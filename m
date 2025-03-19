Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A681114AD29
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742410406; cv=fail; b=Jb7TqCddQuUarFkUD4I0cib6u74Z3/sHirleUa8LNUz6ncuZfJ4xK3+OiP9ygEbyNG5Uys7U2ajYESiRAUSmS30F0XBsdg+UUKPs4KMlMmp9UKTEfMd6Eep4W6vrSlTJQQDLTmA7bQny5C4wjIiXXjbW5xXp4iW6+OdUUmdqJr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742410406; c=relaxed/simple;
	bh=wsPQBKpBG6o4JsNr+I+tlIthqpTGvx7b6z7ceKAlKSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fSJrbLjF27N9uM0HXedTgTmcf4WQd5IyyKyL0+GlKO8UsA1YD9GvqJ39+5AaTQQqJoc0uN2lfVnJo7sYADT6dvqdIPl/DayDotRYPr06a0dVkp7zZeAj8q8VBv4AbpfDeGqWpOy50Iip5av/6Yb7lLs7k+RLyiFcKxVIpbxKhVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c99tVqbv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=epeVFKnR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c99tVqbv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="epeVFKnR"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH0o4Q006009
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=YT9lCwcBAVttK8eqyX
	oYdJlo4QieSrOEZWrfVUW5EmM=; b=c99tVqbvjLhm12pRLvmWiZLnQZhkCZp2Rs
	G15+/8z9/d4qOGfk8cPmx1graiV6rDDE9WMdvhYmv/U97LOCjVHt7qHBfn63yiIw
	qxkRsEClPPLMHssduDKeyJhZs/+avHPPYH0FuDlbuVNmJimQltanuTXoCTvVf0Gi
	qaA39RH1S78YRWt0beIXeLk1MNNrX+xPJuPTIs+XF0On90VMwNf4/1APl0tunhwl
	nrfO0ou+5Nv1FNJuZy1B+ij/0374e3r6LEy8Qe2WouNleMjasRtBluDYpitShqal
	FeD3kEDNfVYePpJy+DYnaY93PbbiuTSL18c6smlkegbwwS1y/98Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kbc3t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:53:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JHh1J6004686
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:53:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ftmvy786-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8KA1rRyMU4iJbQ9ooQgmJEU/fpNHpjOWi2t0IRF8EnpyM4GE/gRkiYE2YwQDulRojSXnymy34/J1IZ3AhikHaMbGsrTQ6hSh/ZLQ0kDiORN715jG5Z6/7zEZtiY6ztSAWDmcO1Y4vQE8p5iQ3+4abZ44ssZ/f9UX85B40M57312QX3ZRTqjaScO8syubUo13Awm/ily4bWhwbikiY6+DTVR//E94/tuvF8ECXf9cgA29nOtVDwU9jwTnLkdqs6LQhovreTD+ADejFnnHrW0/9zKC6PWPC7ZZl6NCZaktnllf6Da3TdT8E7fAj0Ddml7HYHHD3V6JG2C8GKI/Mr7lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT9lCwcBAVttK8eqyXoYdJlo4QieSrOEZWrfVUW5EmM=;
 b=CTRL5iOjrOJRdCWQaNMGvtHmae1SPK0Ww6pVZdPS4/siWxJjKcqac/4e3bvCySTdZ+m3YUX7uKOTJeH4ZAUbQztg7H0xMnxw3AVpcUsECgKljfXTACAp+0iEqr7UQX/esxBGoTlquKz5C+0RKYEukC2S22zEEmUT11oNoSyknDKKn0z43w/gnZk8t7Pe6l0+0Ka2Xyf7U79+WvoZXng63l+zjz/7HLIolaJjhiQGr9aiaCZ5+mnVJ5D0UyzI6uztf8QFf2UppjljPqDLoSZn6d0h3fIDxJtLWcWnwb34+9SjkvEmRcNdKNZ/6+/nf5BGy0p8INtavCV+dxsEjVOf6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT9lCwcBAVttK8eqyXoYdJlo4QieSrOEZWrfVUW5EmM=;
 b=epeVFKnRCXcDPHww/xLA81ejPNjpxpVoHAcMgVEMIv/qTB8sLhABcd/KWgEwKlYpcD9ajFMJYkyuWd6J0IV6MJbpFlMe+NN3mk6Xdu69FAoUQDVfJM2Ulzng/+KkHy4jDhdeE8uUEvT4wj8BnYpJebCgm6TZCt79cobbu3I7TPY=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS0PR10MB8175.namprd10.prod.outlook.com (2603:10b6:8:1f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 18:53:20 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 18:53:20 +0000
Date: Wed, 19 Mar 2025 14:53:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Account for pid:::entry ucaller being correct
Message-ID: <Z9sSnbvztjJTeXdn@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319063230.28171-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS0PR10MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 1173e051-147a-49de-e410-08dd6717515c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wxX1J+EsOojVSQrYGFOg6cLKCW1UCnP/eSg2GT9UtKjE8LrJlpMxKpub7E35?=
 =?us-ascii?Q?VKGnqWMmGNyZbJ7jwVi4hj2aaqxECFOxIIOPuOKQp81a82saQNC+E9YBvRP1?=
 =?us-ascii?Q?QZ70yYu3jnACUIWTMf8Q2rVay38m8qaT0xq9P7PPiCsbTfSr7LlskHKMGsJm?=
 =?us-ascii?Q?net2qM3njbUIf6nc6HgBdkOwu7SsPXHGyktJhASNpXZl6CnR73QnvipejKu9?=
 =?us-ascii?Q?OAACOLO1N2ekCnJETNGQ8WefjgGqEPr4Twn5KA7P57Si0TBOQslSBQPE8Q9q?=
 =?us-ascii?Q?6mQYhPrSRKlXF0V50vjDSztrzveQOreGSe0KxjzgmnGhHtGZxfHblS4KK+6/?=
 =?us-ascii?Q?9xbC6dTKFHFfQ6qgpYYGIK2MPC6zHp4Ie4uxK6DKnF0ZTf97b9Z8f5HtoJo+?=
 =?us-ascii?Q?Nr196HJ3V7jckVazUQx2TEvLhiNp3PRl4Hcb+oj3wbA69mCAj5YGDqo/9mWc?=
 =?us-ascii?Q?gY12YUan7yPEBuqmbIxAe9OPxev5Dxz9jD1Ge9Z8TEgGFjoSgQQaIjgPlt3K?=
 =?us-ascii?Q?JoBNpidjQGNmgwDxSvmjdn2hGn3T0CMgHu6eCOS3n3NuwfGb3mhPggq7RwWD?=
 =?us-ascii?Q?7FtTVEy3H004YlpmEE7OnEbr09P0eCE1v4qc7UCDBekSIm6CURh1Yx7FULLL?=
 =?us-ascii?Q?DzO06WBu7S+XpxAT8pzc72VY6UHJ1TKFb3vNqClcVe7c0k1CvjA9nuMkZ+zN?=
 =?us-ascii?Q?RTdDcRbbv32ammLcsy3jBIGxQ4fm4JdhHRojP3uKznI6c3Kd5DERWgZm0vwH?=
 =?us-ascii?Q?RUK5kDGKz1cZEAu8jwnp88dt5buClX4Hl94bcDAIg49Q8OXSjKCNN0wzNQLz?=
 =?us-ascii?Q?UzU+nWVWt4HLAuRTQYPRUtePSVi4GinvYO2LiC6/+oXkwYsEJojHeHZoN66E?=
 =?us-ascii?Q?/7jIawkOgiRETiipIicGoy6Gx359LbouI/NOxShaTK3gkfoSmwELo9eYfFEc?=
 =?us-ascii?Q?o17zYBJH8eqdD+yclIJ9eUrC/5GCYG/Epp7sDxzKfqInSgZPvDOWDi4YNg/Q?=
 =?us-ascii?Q?+eWpKGCFtnh7U8XPt4NYDbZn6Nm9ISFWlWJ1VLC6LcGP3MLTVThdAXPtEemn?=
 =?us-ascii?Q?431I5Ca6zFnyV3XwXIcY8P//M7QbyBmUyKpTU6dQA82DPMON930BvE4KOrqV?=
 =?us-ascii?Q?7dKn0WSuJ0j+DQzDinDjKJ18whHY08lF+JJ3pZScK54ym3jV61pdEtiAo4uK?=
 =?us-ascii?Q?SAKgL2do82ngKYk34J+MsySiv5zgiI+vttyTzIsYk5bREuJxqptVcumYGRRz?=
 =?us-ascii?Q?cjlgaXnDowMCWGt7/5TJxBsJnQ1HQwqgkzwbt/dlt5+s2z3A/a0Lo2TyZO+S?=
 =?us-ascii?Q?Nbcr4Oo2XXzQASg3XubkyhFOmJACGECjjZs/DPxMWqa5XD+ax90RyzZnZu3j?=
 =?us-ascii?Q?pHBWf8uMBmwxXognbuNXefOZJ7pM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pKFVvSSyJUD3ZivNqDmABu2TGs1QUSpQU4Plo5Yw4mdZLGR9MHsJZsEOofMb?=
 =?us-ascii?Q?ewSitAZwUfMjKY3BK3AK/1T+Opk2lXz1pTqIygYrrQ98r8rsTB8SA+iVZ6wo?=
 =?us-ascii?Q?6L49++tORarvofDs8qUFu5aWUXzHClFTT5+ZyNaVy3CKAQbSzVrSFHEGIe5g?=
 =?us-ascii?Q?mKDuOIY0U00KMrIvfN7oR2tgOEsbyuNYDdsy6CvnHTqA5OG7iqHhV7zNOjZa?=
 =?us-ascii?Q?pLEHjgx6qMm8WGpUI/Ucf1JqgR+8E9DEnZ/T6FECS1aIhba3Akr9Nf4uZ6sD?=
 =?us-ascii?Q?nhPhPX0/VFITlUtDFGUYw2LDRlE8wc+5hCgYWkq2/UKpJuijBI97EYKivClk?=
 =?us-ascii?Q?MH76HYnCQ9cFlHtNd/hm45ulMonfvKnElH6Yw16JWZfEnTxOvL7p8DsYnm8r?=
 =?us-ascii?Q?i9T+C0Bgejia6hA9frD1AUqpV5xks/Q2I+gwdqbIEFG4535Nn9xW5s1kR1i2?=
 =?us-ascii?Q?yTaBvcc7zY38vy6sC1fixzp4zMjmNVCGBPHP1alLJafU4X59Cs2g7Q7P3rpg?=
 =?us-ascii?Q?4IMwmTl1HiP26Z/AR0OKR/D8DRjzK5Q9JLKHjoy7dppBJ3+Q+OPkTwvKyZAj?=
 =?us-ascii?Q?FEo5FrsqYlWpXipO9NDhWF1lgJYmeGpFtdCe8969ZtjF8kUFgGvmZQdLCAs5?=
 =?us-ascii?Q?wPyLCU9t3OXaI/Pm5p7iADh76sKtHEWkaOiXGpJjaCx60ZKpjhN69gWi0WX7?=
 =?us-ascii?Q?hRkrkX3JzCVomkCrSQxSon3EBv/4tm3MCMePD9k9Coxud+HSu0xWRA6V8IAw?=
 =?us-ascii?Q?T2cxnLRpVQTAfoEfBM0R229WshiQVTfOoiYOG6hTwBo6BeVIxaqomeS+T2kj?=
 =?us-ascii?Q?LuN788rzpcwqOW53A5DJm0yKvt4gQOC5zYNH9OY4m1fi3YVSe3IAYTG957IG?=
 =?us-ascii?Q?HqWMCYr0pZ9tbG88YonUivhQ1Z7fXn5lZLhLep8NemdjDKxzvrQKY6wr4FB9?=
 =?us-ascii?Q?2gaJPAK4fEpZ68HcvZMoPmcvdVlzbJFKGkeBFec0pI9IerCxIHveWgeFiter?=
 =?us-ascii?Q?nhHYl8zurczh4jOJK8LmhPXMZGeePYwfMv34AEoF1jgDr0+MaNS8sDrs2fz5?=
 =?us-ascii?Q?OAOzHHrLbVOQj0LrL7QZ1sI4aq7zwLH3IROJVe9+NDwKvtPjkiLllAZghXr0?=
 =?us-ascii?Q?QTbizdnNlHVBloajWRLMaJ9czZM2C3tqkebqwsvp2+KJosqTgNXrst/nbYmy?=
 =?us-ascii?Q?sbQ/e4U/HwhHX+UucRAQ6cLc6YyPS4miVz8+PMMbXOBu8dtf53JVFl1gYHRl?=
 =?us-ascii?Q?LLrFScSEM/JumSMdRtoXXLh0HabQnTKIF8BRWGYjR1uu70h4bzMl4mHhuqVV?=
 =?us-ascii?Q?YybPu3Pgw1E+h2qfP+jqUaD4qJ8ekej/ChcsgWbnkK+pngs/K90AkKFxInCV?=
 =?us-ascii?Q?vVeNqMBT3flGoEwwW3cb4+Td6PVX1+Do/3OVDipUVBfCkedZwrj0Ucs8TwPh?=
 =?us-ascii?Q?mMOr0R6v7oP+QoH+ykzlnanCfniqGHhlhNNbPxDeLrVi4EF2NUN4LaDLxqz4?=
 =?us-ascii?Q?hsJiBgEK6oZjB4XCWbBVGjKxeJ5WFJufTcdJvN/FOpQNHyCRDoVBGHuPHV/B?=
 =?us-ascii?Q?A9e760BVRZ6XomvJXKxsg56YDwFxDZ2NAo1oIUxAYBBQX36WvsIZYl29Cple?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3ghQf0pJRfQ7H63ZWw3WVfKlgQobc28lWETh7X63un3J1ZLcxpebs02DTqkNG2H+5bmmuznP0+X0yA9/gSzqG1I36kUwLlwUL3Cx1nsi54lDqot1gnrU6F9yKo6fCbqOPna6RSO6k2vjnKWMe+h9VMJxakOg13d7mU2G7R8sRSGc+KDw73wkJfEcXPDBncqX+U8a30r/qZbtMKMoP3MAwLbIUiFEU/0Puz4fK4g2goCz+kqh3LPvzlvfrCLJ0OwPiR6iq/O+IRLAvfwUHi80om5v7R/kW89jhJ5CfrZt1vcnKWZ++q5NQCjVPcUgTNGVYUwoiP0o1yi6JAO9WUTB2z6jSe4MQjHfrG7UvMmCACmIXiz3QJ8aV7VmjZaOwwc6dZYAXRo21fj3shDiLiPC2+awdgUGR1UFTS7oSk8NedKaaDWXqFImZxRAq3umzHbxKqSsoIPhw8xcwEYYRn1Ku68eGLXQq7tW95yn9BpkoQYmGe0OU9tin9BpHzZqKawW2azU0V5ZUK7MiteLB3PSD3sVrDaIyQV+ZtkUyF0nAspfRl7hGP2XyIb9NxY/0UWQi9RYcCJzXO8pyTaFpX9rJ66JHbVJcYjtnkYdpXOo7Do=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1173e051-147a-49de-e410-08dd6717515c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 18:53:20.5207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbPHoYfF2aeauBjokWCjHFd37LxnNzzqY/wxOfBBONN9PFrL6Y0rktSQZxiTSKbQu2verLFoT65dnF7OqZhvvf1ADKXeZchrchVqWw8wT3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8175
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503190126
X-Proofpoint-GUID: rpmcC5R0R6O4uUcDM7rvL2pbZklbd353
X-Proofpoint-ORIG-GUID: rpmcC5R0R6O4uUcDM7rvL2pbZklbd353

On Wed, Mar 19, 2025 at 02:32:26AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit f38bdf9ea ("test: Account for pid:::entry ustack() being correct")
> we accounted for x86-specific heuristics introduced in Linux 6.11 that
> dealt with pid:::entry uprobes firing so early in the function preamble
> that the frame pointer is not yet set and the caller is not (yet)
> correctly identified.
> 
> Update a related test to account for the same effect with ucaller.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

LGTM
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/vars/tst.ucaller.r.p | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100755 test/unittest/vars/tst.ucaller.r.p
> 
> diff --git a/test/unittest/vars/tst.ucaller.r.p b/test/unittest/vars/tst.ucaller.r.p
> new file mode 100755
> index 000000000..8e03f110d
> --- /dev/null
> +++ b/test/unittest/vars/tst.ucaller.r.p
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +
> +# A pid entry probe places a uprobe on the first instruction of a function.
> +# Unfortunately, this is so early in the function preamble that the function
> +# frame pointer has not yet been established and the actual caller of the
> +# traced function is missed.
> +#
> +# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
> +# See commit cfa7f3d
> +# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
> +# for both a description of the problem and an explanation of the heuristics.
> +#
> +# Add post processing to these test results to allow for both cases:
> +# caller frame is missing or not missing.
> +
> +if [ $(uname -m) == "x86_64" ]; then
> +        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +        if [ $MAJOR -ge 6 ]; then
> +                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
> +                        awk '{ sub("myfunc_w", "myfunc_v"); print; }'
> +                        exit 0
> +                fi
> +        fi
> +fi
> +
> +# Otherwise, just pass the output through.
> +cat
> -- 
> 2.43.5
> 
