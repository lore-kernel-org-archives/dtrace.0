Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FED4A08
	for <dtrace@lists.linux.dev>; Mon,  4 Nov 2024 16:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730738528; cv=fail; b=T/8SzRYZCu2+zhUW+XeTN68/c2J7PLMGoQd0/w+FzGRGhSbVRpg3tezPsYiQEGpSgw5EQkjOB76INjl8muf135DrLi6L02KViBmdb20nQbDqmwYVXP165ulNqIQ7KmLG1WuBdHUWd06CrPP/P7Ay1SSzyJWggGpd42/vVi/9xBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730738528; c=relaxed/simple;
	bh=aS7z+vgP5TksVaqkZvpkwHackOCN4fAx8h/vfoNTJaI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=mdm6KrYrh3l8Un7mm2TuHJGh9cbQA3MhKLVNbxRJFoZLIPPzx6ORdF2iqNYqQQb+DEVNzHy3jeWU8R6Km3hF68DUel7IhOnXNO7fiQmBxBfsMD6S36f3o6u186BNkjCkSVu/lrla0fXjf5+vNwTslfKUB0TeZPbl7wQW6r5EpKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ebMpOwPs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F6dbSiSq; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ebMpOwPs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F6dbSiSq"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4GMeu5001493
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 16:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=GGVGjklw08vhZ5YYLK
	90a+00EvF3EOTwpdVrJrRkx8s=; b=ebMpOwPsXzCbTknIrV6Xc6ti9gvHXASNWG
	9Awj253u9TDJIGmQb6F+xaX0Ve+RfF4eZWNVpGQnzQm6d5lpTm8vigYolUGAtuGk
	zDARxKwqLpGeFTkRlCThiINkFbQhAvno+IjAuYdF8UKW3dYrRbLZdFdMMY1W1d+G
	1k7rmuKWocDx6TwlXQkOdG5VbVdHRiSOZKqnNyAm6PhakhLM/RyJMx1zj0uTCkmh
	l0XRjlNBE864aNT2ipF+Nf6w77+esbMJ7U25EvaQivzSPkV3BnS3RtD3rQ6LHIbF
	QYQIXUNWReDUdMxYZDkpymz6KZchZZAixXQLJ42ZyKC/tHrCoeJw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nbpsk68m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 16:42:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4FiX7D005124
	for <dtrace@lists.linux.dev>; Mon, 4 Nov 2024 16:42:04 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p879dnhw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 04 Nov 2024 16:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUqWTWlie7PzBbR4XGbmn1RjUvJ//H23qczttw+xPHn+AwTlcpTfuDUZdD1kwisUc4Q5oia4cqtn6itzDanB3G0KxoFRa6+XXnydxejLatN/k8T/SFj2WEc+tYf1ft/h5WCvPv5Lvmp2WBDm7BewwArEnok7yThp6JFVSUq8tAAt+dYCrfANfFKHsvA8nCqtS3skIIkaIQsH7211izKMXMQz1NM9blhcMM4O4W5oKMgAs1/2BOV03wP8XeDRucfG3o5s/tZ+SFsVtebsDnEiIis0GaPQMA8MxOwUx0Vgoun0lG8ADnOLVuSsf114bVv8jC9cczifMthtMRC08nWssw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGVGjklw08vhZ5YYLK90a+00EvF3EOTwpdVrJrRkx8s=;
 b=dyrCHo2YGCCER+m+EK9Rz/NkkzAklhJuSejPXOM90+g5fIXmbzOjoQFERxK5G+B1mHp2aX3dMksG2owdVNUDuN6aBzt9Ki+wOxlqS6Eylp1vSktIx9BtBGO7CXWDu+0Fis+bC+UIrS6k3uJAA4WfuvJ4KcoLYcRCjEKYo7I3lDteSR3PS7DZhNBNLuXGbcHy7LBApz9A8egpotzBBxIUWxTTYKQJTSH5dNXrTfFpAWPmRI7xQazmb9md06YACtON2TlrC7hMnqmML/+jJCM86cdZCnUjIkySvt3Hm5kaw0ZGHwVMfttf41WosWDAvTXtNWTA/TIXLSHD+MEDwy0BKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGVGjklw08vhZ5YYLK90a+00EvF3EOTwpdVrJrRkx8s=;
 b=F6dbSiSqRenvVO3yWqOTiSQFMLVSz3C9xfwbhvT29jyZvsScRZc7YThnU3CONtB0jXqPwPPEt4j+XfzKrh5qNosrlG60T1aSnn0hz0riZnoYzRWDQiquJfn4oDFaFDFOlRTdwuojiVF2Oa+DO72LcipUsFMixo9Auwj5ufv4c14=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DS0PR10MB6222.namprd10.prod.outlook.com (2603:10b6:8:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 16:42:00 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 16:42:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v4 3/5] cg: add argument mapping in the
 trampoline
References: <20241101155712.397674-1-nick.alcock@oracle.com>
	<20241101155712.397674-4-nick.alcock@oracle.com>
	<ZyVx5oA+nJSqzctw@oracle.com>
Emacs: why choose between a word processor and a Lisp interpreter when you
 could have neither instead?
Date: Mon, 04 Nov 2024 16:41:59 +0000
In-Reply-To: <ZyVx5oA+nJSqzctw@oracle.com> (Kris Van Hees's message of "Fri, 1
	Nov 2024 20:27:18 -0400")
Message-ID: <87y11zgdd4.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DS0PR10MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 8edf5ad0-a8d0-425b-75ae-08dcfcef9adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jjdblg43e2mdpg5v0hUVeB1FwChkRFgiL2eVm3+/yuHTa1T0s72NI/bCOtjW?=
 =?us-ascii?Q?52qAqdD5RZFJ/khD4JeoXMVTRH+RWR51xD1hrDpWXYgbDsz2KRtZ3I1b/OSX?=
 =?us-ascii?Q?on4Ml1Ffs/EOSJCARTFJO5+bd/AbsomMRWVJcxRClP2Fo0a0X1eCGdyO5ggj?=
 =?us-ascii?Q?+8gW1OnDhQznkXSQ9d8OrlcT0wHmtVz9V/GmiBupdexH8nO/cfXD702wwKZ2?=
 =?us-ascii?Q?99X8mkpf6p5I3YGCcbBxiz5zpGqtIUT5oTKMcYGV+ptiw8kEltQLr32LC4BI?=
 =?us-ascii?Q?P95JxHkNflu8G0VZBMPSrvwvpOWs98ByfZXzwDkieJ73afSgXfQD+TLJh3aM?=
 =?us-ascii?Q?osIWW+3b5vqYG8CragItmpwxNl4p4VVmrCvINIYmNZGJEUxQcwf+5vJQ46hf?=
 =?us-ascii?Q?RH6ZgUK46bKHcnmrtQEb0AfroRzTKEWChj6d4sxTmWyV093DTYwWup06FAWd?=
 =?us-ascii?Q?WwnB9v+eBwn5Ft+pCS+lciiIXCukqBBZd4rMvfD6GgJhAJ1NvIvzf+mufI1q?=
 =?us-ascii?Q?Ku85kS3JQ2MC73c61kMHQ1OoWt+7EbfMhappzX7Emd12p3OpezTRADJvbgDH?=
 =?us-ascii?Q?2WyoGnR6YAkp2Eb7pJMrhg+yk3PSrv2B0xUYUYDDjsXZc235kGTdk3mI+pOf?=
 =?us-ascii?Q?qqsP3edQL9EICgj6cNiu2vL+AyYbr72SqwN2/3VzfQ3NgavFkKA4o91/lQmg?=
 =?us-ascii?Q?NN5rDSiuPEAXbwzOsf3yYX0r55oJrhUCIqmsLtbodJfpbkk9CzSqC4qAcr9d?=
 =?us-ascii?Q?2jRYBWKkRGdYqIEAnaM1m2Lgvdj9SRsZ+tfnYQaXtISRKkCpunZvaQH/w5e7?=
 =?us-ascii?Q?lMuKskjymcxtSS2lFQphBJguCgiJzsVQQRtBaW2erqi6U5Spz+j6vaQSEusQ?=
 =?us-ascii?Q?ftie0tUTyQfwDd8e5blk6T65iALclDvZg/ef+FwqfdL7HH3RzcWEFCydQcPq?=
 =?us-ascii?Q?ELeuQ6VATfag3Lccd2Ei+AXvufiS8oIkM56dDH/nQR4A1YG6bj0Ko1LU/2Cx?=
 =?us-ascii?Q?6U1FVBrk0d6tMg9I+xDBMD0LLxeFsB85aKtXxF+mjp0xO3HxTc6V9A9y6wJt?=
 =?us-ascii?Q?S7l9skOvy3/8D/t50ExR6WLNlSwjLPBcpKLG/dt89+3BjtQbP6JnNJ6E9Jmu?=
 =?us-ascii?Q?fCrgCL0syfzT2pn8xLYuKCObEvBtQ6Z6F+uQO6FpqkwkI4PPTLvvjJZ3l3g0?=
 =?us-ascii?Q?cukjliioVA6UhfqEngnvFzfzx8NE5lrRdDuaByj9E6hLqiDShfMuJnQk5f2s?=
 =?us-ascii?Q?FHHWu1LZA77tYDXd5yglxi9n0ziR+suqlJ7R55sd4+Pm24VEfwq7kxyiR09i?=
 =?us-ascii?Q?qGUEtH6u/f48OdDX8WEHzfbA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IQpUZoz/r/CLoS+jhT7kUcPMkBWcqRr/X6aD6wQPmSwjaLaUqRDROoPwmX9v?=
 =?us-ascii?Q?TSLaETi28khWaaWHJvAXINdB5g3qsz7aiHbC3UxnGUg8ZSwt6tkULtpALnTm?=
 =?us-ascii?Q?L3ifJc4UgGLKCBG9p0qCAosM6v0dPXFCckroXPvRb7qfSUk9g6KXQ3TTE3/a?=
 =?us-ascii?Q?SVul2KTEhIyEMaYhtLnARvGWcx64LX8CUukgFWIGCrpQ3LXmwhGCOWuEWFBp?=
 =?us-ascii?Q?6Tj0/zAxiT/pgGSkRQKfJFZp4tD9uA7Gz1JqQ0XW5hvG03VfhXwy9u7ppMlJ?=
 =?us-ascii?Q?kkktboXQLxkJL8ROYtT1mGRnxsR+ziQQ94JHRlQVFTshnX/pE+4ydbw1NJPX?=
 =?us-ascii?Q?N/Hdiv+voNsOhgcqZT0AL6tT/GQqRdsgrt1hQTmYJRh2vBWnQuTahup6N6Gr?=
 =?us-ascii?Q?rhdQTkroujNn5b3dd3w0lxekC066Isp+VF1RMHFfy5XgY2d4jg5J3cO2/b36?=
 =?us-ascii?Q?d74zPNluK8Fd9u3n3yzGaeeQpQMIPTmG6Ow5X4yae5MSXCumyv5J0re+fayY?=
 =?us-ascii?Q?6eRcf++gacCvFXkavr73fIZUGg+OQ+Ms0UIjHHPshDpJ4ARNciRO21D1VKcF?=
 =?us-ascii?Q?JcmGmSAYLYYyQQUr5FFWRmG2KxzSaMG8WT66A8o1/uBdD1RCnLKW4qldr9c0?=
 =?us-ascii?Q?NJ7yd9WtluV4+aiJjzRMoi6/hIniACD5NBhB1zhCoXwxVBQ2uUzHLkeBGoiS?=
 =?us-ascii?Q?LZzKHPRyfK53FecTgUVbhLslYDf++x2Bg44TJxsrE2n3ShW6UqWSovumfYcz?=
 =?us-ascii?Q?Z1N8iMCm321L7ziQXpPizdxWln40saEF6JJxA2ZTBHPxphQ6L25GXQpRtk0v?=
 =?us-ascii?Q?c5vdpOpD5Fz5bYsqK9b40NDaLyJ3SDyFEwY4vCmLG/53nyE4Sf3PzKEheSWm?=
 =?us-ascii?Q?kO6Wa5+Jmyp7t9A830Oqoom2oG8FEuuR9Y4E/lTUtRnUe1daRxfjSZqpjETL?=
 =?us-ascii?Q?Z2tO9UBmBwX35KgbEWVThgwzP/4UsOgTbz2J8bPnAEbZKpP3YAgMD0UxU5iV?=
 =?us-ascii?Q?76q7Rcs4GQHWOvZnVdCvgtNUQafahTRLzR3fC2Cqxif8L4JmMhCHEG5FaMPC?=
 =?us-ascii?Q?AhB7wm1A+5J/wbIcwvFrGhzWcipa8H8jO87+XS8cW6+FJxZRYbITRZa0sloy?=
 =?us-ascii?Q?Msknxbe2neAo9C/A2gtI6zUQUGFecsLD9uhXL1bEue5K2yO0uHEiSLcUCliT?=
 =?us-ascii?Q?2lUX9wHgoibMWZRamgsAd+TICeW7ne/PIfVZXjdhK77VICdM8HKDuE7CVfaO?=
 =?us-ascii?Q?Rk9cTLTc0O+BvP1AaEZMTUqMV5LfWWKvj8rvUQexlrqJTIkYaOjjN3G70+lX?=
 =?us-ascii?Q?VCDTuA+ZVRqK7utaq0zBnczB/Q/B447WFlZK0S4XcWv5CW1iwnoaY0SATbpW?=
 =?us-ascii?Q?CPxXU+iYzqJK980td95Nx3OdVXKPBAFKIeZzqZt5tRq32vxCpLJOWMjUW0UU?=
 =?us-ascii?Q?kcw1d5PbJ9R4raDlsKfgjztE7cK7gFKFJ7y4XtQSVBk2chqmltQka20/rvvU?=
 =?us-ascii?Q?CXUkXI5eGk0n2qU81A0fV8NXT/1PdPT7DsIlM3gUhe+hCvENMVqwtY8r8DwS?=
 =?us-ascii?Q?YmAGOnT+i71X2D6aQ5zqGI7CTcWccpIudLRDPJLz5lVdcz4YpEe0m58qttzT?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lGk//dtpapGK00nIH3zXosylR/jW9/nchb01MGZP0NPsBuLVDr2NEGJ/5VI9vnYxuJyVZ+rmZvF42IrM2vnuqIpvNuUwgLj+ugQXQzBnErIF6DQfMaS5aCYpXgeheOFePsevblfM5z56uweIAJVSUonvYaDPJBD6AboVC5aKoEnkuUCYkGLX30j4n0vVq43B+s7BT2Fo6RaxOIGt9cTzk6q9AmaIo58cl3bbgt3eBybePRvxViMVWINw20F0Ac/c2JLRrsTL3O4Rpy35SXh3RMotMRt7G0z3b6ERjGMtLBu0gq1/d1Wo9xl6Qx8dWIHrRKpSvKHxjF+O1cOJamW4bOuvNsmt6JsH4VKAW2TlT3ayaMhw59xQZjo56H1S9wdkjYW6jkcdUgSsxrcuQ154Ovy27kYLUbecmlCXawuzO/cTyVgztQYtwh5/hFzT8ae53CrYX8C/aMk09GY7s4ctkMgGNKdwRB/N4yRh8ucV2Xo7sppP+0F5Hvb/xhtkMeZaD4eYklBbVNuc45CdwC5l8Mb34BlNkmfP6iW/R8SDHbSu7uusb0LRT/qbrrqN7vsrGoHvz/EyvWFrs+MRbGot6VwD1iEEpakv3YwF63IxODI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8edf5ad0-a8d0-425b-75ae-08dcfcef9adb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 16:42:00.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSwimAtSrubvUQJp3TQnNBdITsPjjqTFhVYEJQA7V6Ie0yB4kwLK3p1eW9seL6lacMYTDWq+91elbBaXwmwomw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_15,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040140
X-Proofpoint-ORIG-GUID: T8L39IGq3z-KBdcinFhrbeiy5BPE_tYm
X-Proofpoint-GUID: T8L39IGq3z-KBdcinFhrbeiy5BPE_tYm

On 2 Nov 2024, Kris Van Hees uttered the following:

> On Fri, Nov 01, 2024 at 03:57:10PM +0000, Nick Alcock via DTrace-devel wrote:
>> +	/*
>> +	 * Work from saved args so we don't need to worry about overwriting regs
>> +	 * we're about to map into different positions.
>> +	 */
>> +	dt_cg_tramp_save_args(pcb);
>
> I still maintain that this should be done in the caller.  (See patch 4/5 for
> more info on that.)  As mentioned before, you can mention in the comment before
> this function that the caller must save the arguments, just like you already
> mention that %r7 must contain a value set by dt_cg_tramp_prologue*().

I think this is gross and just asking for trouble later, but fixed for
the sake of avoiding argument.

>> @@ -5060,7 +5089,12 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>>  	 * array index according to the static argument mapping (if any),
>>  	 * unless the argument reference is provided by a dynamic translator.
>>  	 * If we're using a dynamic translator for args[], then just set dn_reg
>> -	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
>
> You dropped the end of a sentence without replacing it with anything?

Argh! Fixed.

>> +	 *
>> +	 * If dt_cg_tramp_map_args is in use, you should apply the mapping at
>> +	 * the probe_info stage, since the effective "native" arg positions will
>> +	 * be changed.
>
> This does not belong here.  If anything, clauses get compiled separete from
> trampolines and a given clause (compiled once) may get used in more than one
> BPF program, i.e. it may get associated with more than one trampoline.  So
> you can't really depend on what a specific trampoline does when generating code
> for a clause.

... well, we *do*. All over the place.

But instructions to the caller don't really belong here in any case:
dropped. dt_cg_tramp_map_args's header comment already notes it, and
that's the right place for it.

-- 
NULL && (void)
