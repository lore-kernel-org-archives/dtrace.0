Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3913B5A9
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752589437; cv=fail; b=cxCrqDV2TdNMZGKFLowLAAlTZOseHBvnajooNf7X9FyEkIQ8dfwo1gl50FXKJ+WsMK0VPYYmnIaG0aStZneVcdyMY4/Op1BFb9y9d3VsdIr4KM/1MWJkpqeZ9XIF1vdZcSBnDHfknBWGUp+KSNqJOqbQEADwj/OKGEJrrjHZ2fI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752589437; c=relaxed/simple;
	bh=hK6QczQW9BltRHuOb411zTA+EfhcsDhM9JOTihIvhGs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=lCyWGcXPtXydE5f0PrzJmvHdhWrjwFrXJE6thRVK7MjM6D0qbLcvTLyT3rOwiwQZV845n6GEqgrX3x8hYSk7tGYd98UzatpW2OHfK5WS4SUoxfFFHgL7NMU2YOp4SwHN485AypUWflQco1KToYEuE8+7GsgLkLI3WDDAujTLWfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yfs2MymG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FgrynIGy; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yfs2MymG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FgrynIGy"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZF5d013527
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8WPON+muGUMLws0OhT
	sovM1JNj+1StYt+jPsdVvKF94=; b=Yfs2MymGVuTTRbnWy4G7CUJJ/UfTBnvMmf
	fZjK5zmxhIyse1ywB4IAcJH2O8PFfTjqPEYhmOVnT04peudrbdSM+UQ/63Z9Ivna
	FK5hJJHlIZD9Qg1W2xh9FJpBzO5EkEasTia/Q/a2vy4FmiKntHSqXl1SoeEJ6Ue1
	Nof1mT1A4tRBhyle1F6Ii3sx5pirVnj18ID0guOWlA5x0+Vy/uQo/qN9lbkeSz5X
	GG9p8YLvGd8kXeq0Pj3V4n9bEvOhaXdyedoBwNR76Pr8CKnUZ7PUo4xwd6PmEf1E
	SdcTGnoNMunjJqUZmbL7hAWW9BVW49pRXFB6KCscIE6lY+uvhHWA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ufnqqhnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:23:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDKOBH011745
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:23:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5a1nyh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 14:23:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdZwrlLXrTWVji/PoouJYQjjqJP5+bOvXQrO6Ln3PzyJEqSE8DITCBMq5YiU6ksoMKscMOQmSQBN9o7I2ig5cDFjQGSjov5tDXFMoS6IG/g29rDXBI6GRoTahPikrdhABDukMjuv3KJ8Xrc+1H623iHhpHr9LPWouUOfYwxjv5r4S/RL5wx7etUPI02H3NExXHae3rVN5l7opcLzm6h/sgy67CLGmgQsE/IMbXcrEfDyvNtXfSVqsR8mJZVs8rPSy299peNWse3z0hj/UhoPd+En6d75ZctJxmBgZwUAEgkRhj1woYn5bhhxbY1GDodekR2/pZtKZA2G2lUfcRh0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WPON+muGUMLws0OhTsovM1JNj+1StYt+jPsdVvKF94=;
 b=nZtrrkh05v7DNjzn2r28YFjBhuhu2hUNYk+BBZVfOIBWIkoMS/3V6FhJegEmA/W7T/4NG3KY5Dfl+w6Ocg68Ik2cNsN6zCZBZaXQwKQcSmhDFV9X2dDYrzkicXxopz8tu//Aiy35Hi4AhJHCozrbCl4m73kb1snNx7tgmcPvpDd/7Zk8081HVuDGGxj5Tip0nHtkv1rjJH0k1FCd4sQgkJGQCq3Tr3dkOKCXkg93nAob/SzIJpJdnb9pYKeKgBS+GHW6rCdlfyyzPuxPDqPG3yAgW0N6MyLjnajYrtACq7JNoFYBC4NmSzy2iqy2lxYv9jZiEiY36ZsM3xgTUh0qgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WPON+muGUMLws0OhTsovM1JNj+1StYt+jPsdVvKF94=;
 b=FgrynIGyY0cAuqt21r5n395isNrVwrxfc7gcTW46faWt85z+rhJKjreye9P6EeD9iSyff0g8UEHdJOQEVfXzAtH7RUMmEukhtQWlvPgNBMhAntu/guHGpVwhZTKCmUDrYlMnD1hssuQgytC2M+vcpVdFv8IBuPoqoZXJIlgrKf4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SN4PR10MB5799.namprd10.prod.outlook.com (2603:10b6:806:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 14:23:51 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 14:23:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>,
        Kris Van Hees via DTrace-devel
 <dtrace-devel@oss.oracle.com>,
        <dtrace@lists.linux.dev>
Subject: Re: [DTrace-devel] [PATCH 3/3] dlibs: report missing CTF and BTF
 data for vmlinux
References: <SJ0PR10MB5672A28ED52DBF398B01EBF8C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	<87wm91p6ig.fsf@esperi.org.uk> <aFq7B7evUkbsxJ2W@oracle.com>
Emacs: is that a Lisp interpreter in your editor, or are you just happy to
 see me?
Date: Tue, 15 Jul 2025 15:23:49 +0100
In-Reply-To: <aFq7B7evUkbsxJ2W@oracle.com> (Kris Van Hees's message of "Tue,
	24 Jun 2025 10:49:43 -0400")
Message-ID: <87h5zdsfbe.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::10) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SN4PR10MB5799:EE_
X-MS-Office365-Filtering-Correlation-Id: d266d2fb-5c29-41a0-baf6-08ddc3ab3866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UW43yGOHmpRouUNPTwpA6Ubp/ewJmpby4aQX4eAmy51sYIgd+gLkY+P4RKDD?=
 =?us-ascii?Q?AfWS1pYAQPa5UItN0bFGxkHkL22mpF2lNy2B2tocl/Is+epys4qgkS9MneOP?=
 =?us-ascii?Q?yMRltOHjbxGmQUNsX/h4eE+U3OK4mobF4eDXjT5o2Qx0YyLCBFeDLWiu/paK?=
 =?us-ascii?Q?cfbp4p46LuSa0Sk52t+LsTq6Xm5dPVHKRMJO8mQHc4i8qBvc8YeshiF9iLeS?=
 =?us-ascii?Q?YniYcLIZ/NVHyXqlfN+lHQ6ZmTROu2X7GOUeW4wmx8+kS0ag6QzSLNyy7XvI?=
 =?us-ascii?Q?VAA8cAltjf1pyHCZFcw70qvJeuilDHKO8aYzcRJbVCxNCl3Liyt0dya5rDz/?=
 =?us-ascii?Q?DychfKH6/Yd88kJ/S6p7PmMvpjSOhUeWTMSAdtJV8xjobJGMsEjCqyaTZYqg?=
 =?us-ascii?Q?fjg+Km/m5vGQAn9+Q4Va8EzQs3AeLe7JGiaz9zrWHjIBG6H8rvro9aWCKHem?=
 =?us-ascii?Q?dykS7TxPQ573Ek1cbgZaBViU84/M830yy937M+vop1cMLSUkbfPd6g0+suh9?=
 =?us-ascii?Q?qocLwf1Nz0O83L7QbGWijtGQyWURztpUVPxj0s8RlV8YNO2N371Q73RbIEAP?=
 =?us-ascii?Q?trNpbltKXeEPi8ah9rDIncj14uFVhxLkzOSYmPSGY581wkdwnZMxByKa3VAF?=
 =?us-ascii?Q?KtjgLBuN+OmLRwYPmtnyK1kXTX/0qceOgaPEJ0wXywFoo3GkgTkops+dPoIC?=
 =?us-ascii?Q?k6GcoHdT3e0/eT17DAFHofcD8p53Icq6pw/PjFHNSWWCUsLLzhAMTLRk4OLk?=
 =?us-ascii?Q?Xcy6HlCzwCI3mb3SYjo9AEJD/Rg6YFwOiYkIlJjmWfg3I/mzarHU4aaHv+jY?=
 =?us-ascii?Q?L1ynicUmkAkJVjzfB5YHGxJtVjFQtGS/D+D6w2doLQ7tQFsuTwZ0HsjEyVHL?=
 =?us-ascii?Q?ifPEZxHZ27ZIt4XZNUmOIS2xvJ1838NEWvehHVlOy8Pc6NyXy8gioXUcvZwj?=
 =?us-ascii?Q?weFNDBiamnsMB6a1thdbZkTXKHLM+v2lGvNjt/c6m00t7IIKdF3mi+JrkPYp?=
 =?us-ascii?Q?Y7CKyWxg6pt8GYj/gElO9+VdaDt+EaGIXiUM6IhvfuwbgtL/NzwojUCDv/Ty?=
 =?us-ascii?Q?XytPuYg7zonL5kieL1yeRU6CJqXm7NsgwsQ8X3wHIZkaoog7PHkYWwzigeOT?=
 =?us-ascii?Q?M2B2M3kDO3cmcJjn8ayx+ZePMyMgYuIIZhs7AhRmvyHRfLzE9Pg7cp6o6MzT?=
 =?us-ascii?Q?XPMeaYIKohOv0rvEowTA4Y+tdswOGrdOxlvELcvdtrvZXIZB/dnOx9pnZIPb?=
 =?us-ascii?Q?2OSX36vXelGI7ZGTLTFP/o/fdr1dRGUpAqlLVxrr92V9TE9/b+PvmAOYEqqb?=
 =?us-ascii?Q?pkjSl+KsYlVukki6UWdkCINSTFQhTVT84/pDkj2l4pufo4IhlohJDTfR0Q3h?=
 =?us-ascii?Q?3yfjazyvbaIzS4ChgN0FQbK5Wk3rapwczL9ofjDlpoBiBMYl+IuSeyyAJsrm?=
 =?us-ascii?Q?Cqzi+JCbsvA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G7FbbkQkx7RBxLxmJOX3lmxXENcdYWIncAanC91Ivu8zHTpblxoDcqq491wC?=
 =?us-ascii?Q?xeikckKW4ELsNMml2ECKje8kaLrDOsOxtLo9RA5HK/nFBqbe3WWKUqm6OS4m?=
 =?us-ascii?Q?xsPdJjas92FlXZwy+1Gfj4y4gFzsrAQMt7u0uyMLCXcKCxVIywsIJXI6VzIh?=
 =?us-ascii?Q?uIl6k+cl0VpRmM9n+hjg3v5F++eoRXpJwff8+rk5JbwGoM7TclxjyPpxH13z?=
 =?us-ascii?Q?Mhe605+9e13C/tbN11qzNsoGPCxHmDZYObfbxIzBMEDWYF2orseeOv6d2SIk?=
 =?us-ascii?Q?boPxGk39uiO+ExTuvgbEc/0/45zz4L0LomDHeyMDW4sz39CVe1IiD7EUXqou?=
 =?us-ascii?Q?HFRjPZ7saLtAEtDM4Hw4xNl1kc17+QbvQSFPojPmaJP+BlUNtRb8igWyj6n2?=
 =?us-ascii?Q?6OG4fcOJKXeGEidi/4Ps14nh4p7KcPfhpT16j6AB0BmxC285eiNSO4g0oRnP?=
 =?us-ascii?Q?dtB0vO+bRt1mGUA1TK113/y88ZpP79WUvbCB9oojcQpCLweXSPmOWanAZMfU?=
 =?us-ascii?Q?kCvOfjCrubCJ2u0Adg2kkEZrzo+itqtM52Mdmj5BJk+BpKxjRW99kJxCXGxR?=
 =?us-ascii?Q?8KVest/9p9zIqkUN038sXLiOCIjOc6U9zLzmge8MjenKSiHkTxRt5dIan1c9?=
 =?us-ascii?Q?P37CukYp4qOxaOwOKAmSWMNNa9r0eoy1OKS0i/MeTg/KEPmWWbt9C2p+JyUG?=
 =?us-ascii?Q?hLzx+LQiGpIF3tihWCKsahXrESrXUGXtdIP78r6co3+C+I8gzzt6cxxRu1KX?=
 =?us-ascii?Q?0gAR7S9BsZ0l89yJRi4OTvDAwJ4Y6hQmBNdSN01Nm0dCr+E/IygMxridgb1D?=
 =?us-ascii?Q?k2p8quplpyXwTHScAJOoSmXwBFYv2Xy3z2CYXFyGSOAvGWjhPjpvQEF7gEhW?=
 =?us-ascii?Q?YjW7yS1L/8wYjjHHUCCH5301G0qmxZ8vU5KRXHNThWat9rxp+Q8qQTfkObhx?=
 =?us-ascii?Q?E9KLbZjJksJQGq4LLzVGryQwS8xCBt/AaKcouEv+6Ms6x7H/qhXNeUZKjPWE?=
 =?us-ascii?Q?P/3I4VsQ+Q7tDGreRuyj+sqT9if48HecVuX833I+NjXCqHZMBTllSvWJ6Da9?=
 =?us-ascii?Q?Rs7cDWcPAYYn2X4Nvboi9ZvxB0mBBpaD8Xa+6O9BmZ0eSuXU3o1S++HmcsM+?=
 =?us-ascii?Q?wtc0ekW3ZbzG+2HCJbo6I1HhZSA0knDqXyuw97ZCJglFrUYmk4EOZCS3ZDXf?=
 =?us-ascii?Q?6ZVmEvKq+dskoQAVIRpn6cJsRs+4HgmEEKGKolmVFfndpXGhUqbfe8hxCQ/v?=
 =?us-ascii?Q?Vu9TDC1oZutfdXx/tf5/jLiFbocoJRZ2eastPhDg4NWw/ybf5UnTAez16WP+?=
 =?us-ascii?Q?ZfmNN+/BZ0Yya9DLcbyQSYBr4LyQFj37of5fO9yPS2RalYZP1SylQ18+dyU6?=
 =?us-ascii?Q?gdR1oxUlF6Uqq7ymA7EQXSkwK8p/BmXkOsKrwQYlF3fcfLUrJytYA1576gZQ?=
 =?us-ascii?Q?M+H6C+0hVwpPvfeeCh7PJRPI0gt/CmPMg4/1agw8xDa5acMfvM6VTS7TGz4O?=
 =?us-ascii?Q?brhQB3Dze//KLrY9tcQk1rd5sBIHj7xbfMfc/q6vNtYiIp3ANpDdg2mCJD5H?=
 =?us-ascii?Q?rfrlzKIoXpfDDU3p+YcHkQjYLUuMD5A0bFEN/jMQieXhtjt4tG3rYbv9yJgz?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K4z7n4lig1yPp0LpW/PgVbiAMxU0WN8j6db9t+NuNlOJMsq15tlCsO4eJ0VeOo7WmfPujNKTeOeDtYeP/l2yAugliq58lpH8ij55sawmwOwFzQjT3sNCi56g0gmV/djDaJDk56yTZXkdZdaz1CYZy3cNMi+V0u+fgvKV6FUpXF/ntQ+y+DLpZOjndJZUqx+BnDTFMYavKh9dKNDxd+G+rAD8PTDjbtQALDBhO/Uj4gMHyQooKDQ+lQZt+wZHaDrjWWFNrK/GH28b269PflIfWWftFpNlGKjF//0by3JOqB2809AohVInjLWfq9hg3T1goixXhtZ9Q7+oqqtjuQVumZNrKT1W+cNFNrY2FmgOAthur3Makbb+da3ofqF2nCA3fl0c/D9fKd/l15LoC081wnCWiuqyMLm+AgsfuSkyD3Acskgc20k1ahY2AePrGVAz21eHiA3iObwG8zvr0FNLlbyxiaoO5krgIa0FVbIcw/pnHBsJQfiWGYIuqcwDGU9VQW3eOwRvRzu5nM0fXov0II56ZNFrRrVJcCxlmNxHpxuR6SrYl0dBJ4pyCwc/weRleZ38Nu0uCw8scBAMEPqnJ05TLo8UGrNbVOdBIVSE6PQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d266d2fb-5c29-41a0-baf6-08ddc3ab3866
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 14:23:51.2380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSVJ1r1/zXa8B8ei3mS0pTr7nM5bIS5vdfmZDjuf+4dod7RsdCSonomv7I9tI7chSog7hdG3vqUzDfrGUZYGyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5799
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150132
X-Proofpoint-GUID: go6uE_W4BlJNfVf9nmYMxJ1ferY2Z58Y
X-Proofpoint-ORIG-GUID: go6uE_W4BlJNfVf9nmYMxJ1ferY2Z58Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzMiBTYWx0ZWRfX1kut8x2YLZ0I EOv93qpoguwANS6r0lZHG9hha/MFvWB2Bu3VuPFg3RIlvNbTPaILmIQbnXWefc6oz6onEJ2Q+qK 9sEB6GTajc1gR4xhqt0m5vaHVGUVDEYxytqF5TAOVEA/CelK7sMqoDlieo7rjlyAVzp4XLAvFL4
 fF93tuPSSL0kOoiha0S8WiNrwWdMoZsXxGS/HSfztkWe0g1gvoQ8eGCcRFvT69tnZ906DFtNfaZ M3VeTw+xS4/L0jJZlOG5O0nkvCjdn+1B9GcUR1jeq+fPOjpeUiDTDtOm0jcs2u/byNsCmNvkrpx V2huyMA1a7WHnciBbBduUFbI3vLPLbSo2OSYXz6YxXYcGMnPRRyh7/Kee7u4m0Q6OnYuU6E4ZFM
 M1bZitUHN+JFI4jG7UCdA2FopQqK+BXERZoRGI4ixmC8nfpc/aR0BFVdF1hasRxt5c2aGtjp
X-Authority-Analysis: v=2.4 cv=U9ySDfru c=1 sm=1 tr=0 ts=6876647b b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=941a7C73h1giTA749tsA:9 cc=ntf awl=host:12062

On 24 Jun 2025, Kris Van Hees uttered the following:

> On Tue, Jun 24, 2025 at 03:18:47PM +0100, Nick Alcock wrote:
>> On 24 Jun 2025, Kris Van Hees via DTrace-devel spake thusly:
>> 
>> > If the kernel is not compiled with CTF and/or BTF enabled, DTrace will
>> > not work.  This used to result in an assert, which is rather harsh and
>> > not user friendly.  We now report a nice error.
>> >
>> > Doing this in the pragma 'depends on' handling may seem odd but that is
>> > where the initial type data load is triggered.  If for some strange
>> > reason no dlibs exist (and thus no 'depends on' are encountered), the
>> > compiler will complain about missing type information anyway.
>> 
>> I'm honestly wondering if we should do a type lookup for something
>> trivial that will always be present in a hardwired fashion, so we don't
>> have to depend on a side effect this delicate (which will fail the first
>> time a .d is introduced which sorts lexicographically before any
>> existing one, depends on any types other than the built-in ones -- which
>> is why errno.d doesn't trigger a type lookup -- and does not start with
>> 
>> #pragma D depends_on module vmlinux
>> 
>> like io.d happens to.)
>
> That is why I wrote that 2nd paragraph, right?  If a .d file depends on any
> other module, it will still report an error:
>
> 	No type data (CTF or BTF) found for <module-name>
>
> And if there are no dependencies (or e.g. the extreme case of no dlibs), you
> still get a nice error, e.g. if you use curthread and there is no type data
> and no dlibs to trigger the error report this patch adds:
>
> 	failed to resolve type vmlinux`struct task_struct * for identifier curthread: Cannot read object file or modules.dep
>
> That is because of patch 2/3 ensuring that we do not bail with an assert, but
> instead let error reporting do its work.

Ah, I missed that there was already an error-handling case for this that
was just being skipped due to the early exit.

Looks fine then.

-- 
NULL && (void)
