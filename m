Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7F84D15
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716494541; cv=fail; b=cO3ym9Vkw333nc1Eqh84Q7a4SnpTOlfUH4PhqNedrM2HyImvU+ylIunOS8rJcZ0wKCTB1t/7SOkVprYtZR3IS3kqrlXwXw3PpkH13kJO7NofI6ojzf+zPL4JRUHy4dKAKfGhb2D3gMH75WkZW4CZkHmaFj0cLt9pKuxA2DXYFt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716494541; c=relaxed/simple;
	bh=IY7KJS5gZzRPey5n3jBy0Vtg1kVswIMrqO72H/+kOOs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=dHH68zGRlx+9iNNpWcryMulRy7WA2pqy0BK9fKODS7Zx0jZ0wDm7NFNMhESE1Pz9EVFW0VJvbiL5r942JMFvhfh5orhgB1v8l2C5xZEw0Bk7V3Q+TvLh/3nkRC32krsePDuCkEmEvgtX5NyWAhd/FTmP3EBTzGQNdKZAVZ/k9uY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bR4sc49s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kbmgMHVl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bR4sc49s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kbmgMHVl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44NIwq9J004866
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 20:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=CFAgnl3Rba28yql1tLnLMl9KqEFBu+2pjZq9Ey/b/v0=;
 b=bR4sc49sM4a0l1K3fnD+iFdtEJSnKmQEUMXzhFToQxk01dzpO9PyQ/j08IUnm7O/BnkB
 tLZ4GGfGer2G5kGh7UjoJBZ6mq5uzaHtiDtyfXeNpQA7P2l8iQ8j6jjssf9cNuat7HmS
 AtKm/zyutsy6TYZvTPrWetI2VhCj9rK+kAG1CdeesQMMJJCirBN3vFgcIN32NZYehDi5
 WvtVtnCP9E+V4iyhbHnGThJ1D1CS1T50B9/shExUJv9lew5dXH5+9S+kTfWliv4PGquC
 6QhK1aQJvTfhEsCdTUXPyV5e0JJ1Ti+5keNNG7N/L7m9pYXZDTjYG9ixTLZj2H1MmHAI GA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3y6jretwj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 20:02:18 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44NJvhr7002667
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 20:02:17 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3y6jsb1yj9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 May 2024 20:02:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmprdbtE1M+Khs4awPnMOhDTRHPYBHPY9KuxdzZuvSQqQSH7TjV+Bk/gjQ3HVEkgDW6rqzHLXWuRNxAU0aUXH/wW8xYtvW26hRgYe87az0aVUd1HPvlfQH7QFF7HuUVVfPSNA8RrpKzuSpIbm92GOKHJqDo/SYHzX4isqU+w0617gzuTzzOilhEPAORcxz0xtAeTgLpMRntN2Q9DPKfEerKwg0EH63Iur4lTp8SUF5yXVzeZAz50KDwuPNli5E/wksZbcwaW6W4CDbFbcl2S57HoqmBdSdb3OfXYHu43Nn92JWaE34JMZ00L25PrBAzTXYIDzglzdlVhUAag2jUUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFAgnl3Rba28yql1tLnLMl9KqEFBu+2pjZq9Ey/b/v0=;
 b=hddlERnuMbEKrhw/PPd1/jzT93Bl4b9hJ96HMhk5uiXgz2GodWkQUBdEOKai7BgNeuGsV1TzeugP7/bmWWHL//ydO50z0zd2CCC4fdltLPrHvnMoTuGEx3Vj7lQ4Yy6wbNG7cngfaw8lSE72SdYpzxyTzFl9ODnI8Ux6kyaCMk2df1kiYGwQLbuumlCtiRtY9BShzr0rW9G5N7uUovgnncJ6zoZzu8ve4WqdDXRvFoPtc7ooUKcVLhRxflzxZ6JK3lrcktxKJ8n12g1AJ28LPI+Nw77z9u3cECd03ytqfaBsLsQtnJGLP7CSiC7JvZnqiJygAOGGJiLsArmT+GXKIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFAgnl3Rba28yql1tLnLMl9KqEFBu+2pjZq9Ey/b/v0=;
 b=kbmgMHVlbxxNoDDcLYJySCtTaBkOoSk5U2lMtrLJWpD5Jp/D02KCeWm+KzRfo9sALk5VJv5b2k0/e8pIr3ai2eOSQs1sCuMjPIOmsnahZxsl0gL0qGnkABho3CSkjKtOOSq7BGwaj9Vl7Q+bNWfwQKAl5wy4lCvt8FcSzMblvXM=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by SJ0PR10MB4782.namprd10.prod.outlook.com (2603:10b6:a03:2dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 20:02:14 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%5]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 20:02:13 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] build: install sdt*.h in /usr/lib64/dtrace/include/sys
References: <20240523175654.462908-1-nick.alcock@oracle.com>
	<Zk+N3P7NnwzL1ZSz@oracle.com> <87cypcs6rt.fsf@esperi.org.uk>
	<Zk+RZEAcL32ziSrF@oracle.com>
Emacs: don't cry -- it won't help.
Date: Thu, 23 May 2024 21:02:07 +0100
In-Reply-To: <Zk+RZEAcL32ziSrF@oracle.com> (Kris Van Hees's message of "Thu,
	23 May 2024 14:56:36 -0400")
Message-ID: <878r00s3eo.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|SJ0PR10MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: f14c0376-66a4-46e6-04ac-08dc7b633ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zum7EZOpG45GgmvzTXNMA7GAtk3oWT0raI48Vr6DdIjpMHHeOIzp43y9MVTo?=
 =?us-ascii?Q?lvI9CHimphWx5WjyvrPutnp4oi7x3x0m7cMqkBKZNuratyZrAOiOM39dhmeY?=
 =?us-ascii?Q?R+cksyCmFRdMEbioxmNKx/sqkH506FbhvgdIOFUtm6zqjP2itqVFMdyxbELc?=
 =?us-ascii?Q?OrLXMD1XxapHQOINaPHN0TrNSy+bBtZlUWDIbvBrHsg0ksiHlpfYxItt+MJO?=
 =?us-ascii?Q?ov6CJcc5YrUBBdsllChH8WrrKj1QUrr2tNzNpWd4FoYz8yaSz+nN/5s2Awp/?=
 =?us-ascii?Q?VRPL76mUqL0PAQCHMD4lP306y74rFegWZ8rmmjcwO/9lnXlF204sqUjm8ENI?=
 =?us-ascii?Q?4fJ1CQgX6nsOmna4fW3K0KIcI0kr0ewMjzpBsImMlHtYOWeaXOrCE/6isv9X?=
 =?us-ascii?Q?v7NQVPO7BdFDtYqiB1QJpNDLmZJ42ZuoghynF5pirmMv/wMUEwFPGaHADVgp?=
 =?us-ascii?Q?x6SGUndPbs0nkBJTM8crm6WZKXppvOQ0fw01cfWiMmUeogEDGnxWcCVIxzuV?=
 =?us-ascii?Q?8l2J2infuXpZHZcUC4nMuvOIRH9JQe2t/Nrlph1d0gL0URCa2JFtPRowORWc?=
 =?us-ascii?Q?tGg9RxEjb4zivFbMBaBYrqCiPJAJZa+SsHBDKZJFt26/+GUENuregD0zktI9?=
 =?us-ascii?Q?VW9Mns3pZ1GauiD65kNHuL3cntCBKlONoJVE4hUdYZ4SZei/gaKmKz3gVSR6?=
 =?us-ascii?Q?MQpzQ9fuyHtsNLT9EQi+49NdAy3RxhKwKtLjktd/Ecim2FBNjnfquiWcAewF?=
 =?us-ascii?Q?MEj3x9Eg6gwXkJtR/wixQLgmKFLRyB9d4ARrMQsXcYcEO0FNWeS9FWNJth2o?=
 =?us-ascii?Q?RNQ9Z3cz4tsWNzx+gKSvHA8FihBJKi4BdXFL6a8Kg0aPTwbbkvKA7BH6O66K?=
 =?us-ascii?Q?wtOS4cY4E2qdZe2KN3CmRRrri3n6HdnfEfVM399p1QFJrkmRD0xhTTlnb8Ye?=
 =?us-ascii?Q?7oTlOgndmWX8/SKxb+L7DK5iLk8cPe0DUBYVr0FiZRhmgE2PEc446eokH6fD?=
 =?us-ascii?Q?elJl+mv20kO1b6Xo6KxITK2BpkpFNlxbPhfPF7Wgh2VVa1SXh++EaNdD8bN8?=
 =?us-ascii?Q?YItRgalTMdOQHp/c4ExC6JLr8WdWMJxGmV+rDo05Srw9Yj82xWF0+iw6o7sM?=
 =?us-ascii?Q?YBWmAFaEEJkArlwTBn/keVYUucthj+W9jllzl04bgm4gJPO0pzgzKr9gY7At?=
 =?us-ascii?Q?u7Nn2K8OElAoav1Md9ztZXbt+iNK3hm4LDkA6tpjB5lqWsqZ+Fz8Dom0dS48?=
 =?us-ascii?Q?LlUgb7ihDZYo7EPYJ4ZWhS+Ve7vE8b80xR5iOdx+Hw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Dy9ztX+TfggxY2GeAsuSMGQKPe8GfD7LRqvwpFqLb5G5xopG1Hwm7NMkw3Lm?=
 =?us-ascii?Q?8lQAqZ2HIT5AcKesxmR2A/Ys3Bi51T3XDn85yk4npmGkLRWgWvgMDBN3gZYB?=
 =?us-ascii?Q?XtN+DSgsrnbRZhWoYahI25JNxVFK91Cpf7cv3h0B6E2OIlF/iqMWZzpYPchs?=
 =?us-ascii?Q?cb7UPC6ewmpaeSPkPZwSIfj2f9/52SJCUy+AI0xau+EouEqR+BESr2oaCK+5?=
 =?us-ascii?Q?WTYqMpUYMkdVDScqnyyAYuD3ngh5kOCF8rPkCCJvfB5oXw+I29ArB5/dihuD?=
 =?us-ascii?Q?5Ld8T0KijXQGqUdM4DO8HFXctMKb3EPLH2B/ddcU8kkWTxIm0w/lWbtIubK7?=
 =?us-ascii?Q?7YE/z0FFN5Xzxe4f6BYl24frGkukRmkzzPiuP+NEvwgxYQkoJmzp+q17a4et?=
 =?us-ascii?Q?xJSj555ioC4jTB1Mrd1lmvXVRVEGVoaiyuS/XasVEseqAJCnaujNqU8ZZvME?=
 =?us-ascii?Q?z1ckYMmhqKBjQYBZOMH1uuKwAArsf+vhqh8aPrljQJGFNHOXyidoneeFbmdU?=
 =?us-ascii?Q?Y9ys/HJOcpnuOT7jhtsX48MkM4ZyBhpdaJKYAkVN+ET5+ZAsFWWEDKTNWfzk?=
 =?us-ascii?Q?SlBrjj0CH/kcKVYe/hvtIb4njMgWdNf20iTj7RpaGW7ADEnvqoujM0ucBBQb?=
 =?us-ascii?Q?u3Yb6htNIQQB986XxtVEtH0cLsVGLLf2K0OSPogqOBG4G8dyKy4jH140JGDj?=
 =?us-ascii?Q?3d3VEGXFkR2dWKQffGHio6WSoLC0CHNjq7iVVrRWqsBt0GburYN0+3w/Lamv?=
 =?us-ascii?Q?87P7WFvlbj7Cnu6SJdEWg2looNZhty2ilWXR8KXhaXWMjWgoO+pexCO8tyn1?=
 =?us-ascii?Q?9lxaQRw9jba1dquMmGvwCckpdJ1XPSCry8QXobw2fiuAS8QZ3yf4mSrmCEqu?=
 =?us-ascii?Q?lmLC5gR6SePsNSF4s9TOGVFKpN1SwovBPAAycq3gbtKjTd/SK5LaW2B4RswH?=
 =?us-ascii?Q?I55WaC7U+uIK/kgvHq4oK95fX941E0zoP7CeZOhblyHD0MsyGKyfzRwcsMSN?=
 =?us-ascii?Q?3F0AzVVqbMTjtp/irViQbv88+1p/bDghNIymTow07zc9M/ePNQTO1txEa/70?=
 =?us-ascii?Q?rGe4yi6HpcYysnpJ2qZgdAHu33Q8HT1vxGu6zwlyHixCRhiBIva2F5OoCSHD?=
 =?us-ascii?Q?Y9I3dF7zp9XD0UvJPLl/ZnlS/J+V4PQJKs+t9brYKxgiMtNbVbeuBRyERZaf?=
 =?us-ascii?Q?fqttitwVnqq6GnOpQzjNhUCB5fyGPp1mlgmOwLhHT1XGk4sbG1n+xJ1SaXxO?=
 =?us-ascii?Q?t4VnsSKP38KRcWsLzccZnmCyIXSQ3HAi84t4xvh0KZOvLgEODSquCBJ+jJtc?=
 =?us-ascii?Q?SCftSqD72XDTAB3myclbLRrRYgqyb7qQcocvCSm5zADClw6P0xWj4bvhVmnH?=
 =?us-ascii?Q?ewoTqn0edViFHAaOFAONGl5CWMchQXPINFL/jJEcv+gviwgPLYUOjnyevDxh?=
 =?us-ascii?Q?5TltmzD/JKofbZfn2syeGSVhvRVw5mp/0C2M34V7d5QJekmaUmSLEGnuRFaq?=
 =?us-ascii?Q?8XzNIdQKJK5oSr7OC36ncjI4ScKYvox770oBmz9R0XesGhK5zoh2mLlU+Q7v?=
 =?us-ascii?Q?K341cXZHgFJ8ecKY8GKXq8yqlzFtiW4D6MwIKhrhegu0Fm2A+qRAAS4eWAQw?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	jg5+RpIsvocY+7Nx64ALepiSDc0ZVpwsMYVPdGr2CQRatg2PEYYY6OHIOJcON58X5L7oButsEWB/x1ob+gHcP7dONsQ8pXp3oS0DjhZRxBPYtonpjMaHstqAU4xgQ3NEpPm7WY8kny/1nRSSF+ydi6z7AX+6NAiQhr+1ERT+6ZDgzn3fEHk2PTmZc9G8a36pQ61Kp/M0J+yc5PnHNJDV6aaROzDW9hSWALWixSFOBL8afuNAhmnnRfwNtO7zI5dx/KNcaYkE//mQRpggzyUgvqI2iEXwyiE4TcHbhD3weZMAEzQKrqQl0dfCxpbTmhzsY94porLw38H1Av25zXzY8HlfvTFEELLKSJnJ7/36W+6tk8/k3Sxe9oAe326PP/wnKXZGSPaf0C2yeGsVPjE3ABIXrZkWwxvwQlD5bHzqeRaXZD+YYtO+XaihYYMgH9rW9GyGXNe8UB0QPomSNu9cmnViGH3ErmZ9G/3iG1LkvlnnJKCevRKB1HQf8NBRssDx2knZOaZ+hfxZhnl72kaQMAKpdCDg3NxEhdD0akUqgxoXU9oNSHwhkj2ydUcYoA0Ji3ym7LTtxgdrATrU8F6mKw4EK9iQZrAAq3E3GJcS7d4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14c0376-66a4-46e6-04ac-08dc7b633ce0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 20:02:13.5681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGZPRrxba5qWF76SLJCKmAVhl7FeAqYSdWSuZcvvvkW/TGfEjS6Vqo63RWjmJjVQq3DI0+Q1BXza5KRy/trkbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4782
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_11,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405230138
X-Proofpoint-GUID: I8M0NjSM6R7eu_1krqYu-Cpvp22BIQhm
X-Proofpoint-ORIG-GUID: I8M0NjSM6R7eu_1krqYu-Cpvp22BIQhm

On 23 May 2024, Kris Van Hees spake thusly:

> On Thu, May 23, 2024 at 07:49:26PM +0100, Nick Alcock wrote:
>> On 23 May 2024, Kris Van Hees verbalised:
>> 
>> > Can you split the move of sdt.h and sdt_internal.h into its own patch
>> > please?  And I guess the pkg-config stuff in a follw-up patch?  Still
>> > need to look into that a bit more because I have reservations.  But
>> > the moving of the header files is definitely something that should be
>> > in its own patch.
>> 
>> I put them in the same commit for a reason: doing otherwise would break
>> the installed testsuite in the intermediate commit, and I don't want to
>> implement *two distinct* mechanisms for locating the headers when we
>> already have one that works perfectly well (pkg-config).
>
> Do the first patch with the moving of the sdt header files, adding an
> explicit -I/usr/lib64/dtrace/include to the CFLAGS, and the testsuite
> should work perfectly fine with the file move.  That is hardly another
> mechanism.

It doesn't :( We need to adjust a bunch of test files too, since almost
all that do sdt.h compilations define their *own* CFLAGS -- and if we do
that and hardwire a location, we'll just have to do it *all over again*
when we introduce the, may I reiterate, *entirely standard* pkg-config
method of finding headers in unusual locations *just like this one*.

Oh, also, we can't use any fixed location, because the testsuite
actually needs to look in *different locations* when installed versus
when uninstalled. pkg-config already has a mechanism to handle this (the
next round of this patch will use it). Hardwiring some sort of "are we
installed? use this, otherwise this" into a dozen distinct test files
seems... unsatisfactory to me.


Another reason to do it now -- when we move the headers like this, we're
requiring all our sdt.h-using clients (if any exist) to change their
build systems. If we introduce a pkg-config-based header-location system
now, they only need to change their build systems once, and they'll
automatically work with whatever future DTrace finally allows relocation
of /usr/lib64/dtrace elsewhere (and that's not far off -- after all, the
reason we're doing this at all is that we have had requests from distros
for the ability to do just that.)

(Obviously this applies only if such clients exist. But if no such
clients exist... why do we care about this change at all? Why not just
*not ship* sdt.h for a while?)


I have *absolutely no idea* why you're choosing this hill to die on.
At this point *not* using pkg-config is far more unusual than using it,
in any project that has unusual CFLAGS requirements at all. All the
other methods (-config shell scripts, mostly) have thankfully died out.
The only one remaining is cmake scripts, and even those are now
deprecated in favour of... pkg-config!

>> (Also, splitting them up runs the risk of your integrating one without
>> the other, and they really do go together.)
>
> They are two different things - I mentioned that from the very beginning
> of the discussions to deal with the sys/sdt.h conflict,  Please split it
> into two patches.  The pkg-config support is bigger than just this sdt
> header file move.

Is it? Why? I have no idea what you're driving at. You have to start
somewhere, and starting with a tiny four-line pkg-config script is about
the least impactful and least-likely-to-be-damaging way possible.

>> > Introducing pkg-config as a mechanism that people can use is a separate
>> > thing (and as far as I can see, could use some extra work anyway because
>> > e.g. runtest.sh still has other absolute paths in it that cause failures
>> > when the DTrace build is configured to install things in non-standard
>> > locations).
>> 
>> Well, yes, I didn't try to make the *entire build* relocatable in this
>> patch. That really *would* have been too much for one commit.
>
> Yet the purpose of introducing pkg-config is to deal with installs in
> non-standard locations.

Well, yes, that's one purpose indeed -- and... /usr/lib64/dtrace/include
is a *distinctly* non-standard location.

-- 
NULL && (void)
