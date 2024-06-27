Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A821A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466752; cv=fail; b=LrBOr7v186Ix8ukk6zqBEjiWGC2DnmG8GC7/V5nbkinkUsC0RVPxXNBdUZw5gwBmr7qtDIWCnNxxpN7pbR08ltbquWsjMXe03d1vOxcKiqC6jNJsOf1f5AwNMlvX01VFDPiEuG/ZUMS6FUic0mO88a+aHOuNHKSTkNPUO9zd0Yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466752; c=relaxed/simple;
	bh=Uh91q5Kj4MAjkaTcmL6I9m/XVpGaaP9tvxgi1RzhsZg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Pu5b0YBpLoCKEbSLdgHDCBmbUHoW3T1DVQXoPXI/Job++ecFOhONGUvI510xRfk5IUDMwznXfADiMjYevaLz94MlXJ5+d8PBzyMq4BAj/wXGNK7PfLhYn9SAuiRoNVvKwJov4x8AMYuPoi5pkDx356JggQ8N1R96y5LHJLjhzQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aQcIkj1W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t7Mm2/mK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aQcIkj1W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t7Mm2/mK"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMROG013830
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=UEWuvubYoYK0uY4a982Tgc0Ay5z64sVsJGu0RppVrR4=; b=
	aQcIkj1WZpGmxKevZE5O7/DaQn6MHfODSLrrDIDdirRqXrdw7EtuNhcQIOg60113
	qAuE+rlBjXkVlQ++OMsRCfnbF3wk8iacJMYSxUm01EsX4m0hN2BO+LOOBp23ugGI
	PJYaP0GXkvQeOxZb25oslZyMnVXS+9ITR5fxEpvFrBG7uODsM/qBwiHtLZRF71o+
	TqPyqqT5UFXpybNZWDJ5vqJJNXIDGg5tloeaJlNCIudATOvD2fWV+ZfvPexyDVAX
	9334R4KfSAnv3ZuU5+OL+T3XiELlQbqvmDh0IRc9e/4ITQfHX55l0koCUgL2D96Z
	J/GJXz0kOl69yRPbFPN2xg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywnd2n0yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R5cxEL023394
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2geywq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzSRWnzK2tU6bPjLxOYJl4JB5msibxOQ9toMQ3YZpWzt+4P7nxoTpZxA4GwslW82I+M9W/I2DyI6w+2nCjMEKyognWj9UL+c0D8qg2ztJCOy9uk4FFtKLvmIeFgAtNqHt88wY1MozxSKUymZCwPJYwHbuBYJBdeRXyA5gFOnVSn9Dv7zudQ3k5xk/W7BzNmu4xFbcXM2SKzBposDUWo70kaWGZjHhprKLnS0cfKe2sSfSwl47CJw8I6ScSQRYNURDQ1gEOJxI44CrO3BcGASeiUO7/YQ7QCRPKEIXAxZsRmpWIaAguuX9o0QKLWftENCM4ZusY8IsUJfNGzjl64i1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEWuvubYoYK0uY4a982Tgc0Ay5z64sVsJGu0RppVrR4=;
 b=SQJRSeE+HGa5Xkx6xxUgCtyzvcX+/NGn2VleqN4ncj48ba9ZonF6NdGQJy9bM3io2aCIKUQtp5b4c9shUFile/UOtxkDGAl+66SRWwXsp/kCEK80rJHBVir5gxwoXzUYfLvnzMXGefFS92jWmkZ/nb1OY/MOHpfKvo9OcffG5VtQqTMUVYHniDczSlYRNXz6nnz8c0a03SCCDI2wqcW29LASJvCnMs/7hidaFSl7y4nofkw/xOEaoXL5MG4WO2sZQABfDTAOqTQu+ahUlhdsqhgG4eVGt23OFVX1Wh6twOYQKyjwlAAzhVcu/UJM76z8qFgmacXpsoq93IUUgfST8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEWuvubYoYK0uY4a982Tgc0Ay5z64sVsJGu0RppVrR4=;
 b=t7Mm2/mKDsGSaLEMyGVuUSDqDcydDMyq5q6oO+mj9vsQS20lsUKeXr+yk5SOl2kzIwA4es2ki3A9RXOuV0PSb5QcQRdP6pcuimeoIcQ04zFG+EJajfQu3MzdeeaVHlY3jL8s2fIbBDDS8VGxRvxudYAU5cFI2wx1fBESYeFojf0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:39:06 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:06 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 20/38] Add a hook for a provider-specific "update" function
Date: Thu, 27 Jun 2024 01:38:46 -0400
Message-Id: <20240627053904.21996-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 66977649-e880-4996-194d-08dc966b75cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ve2dsPfANtwNHLUE8+Nr7wCrqS1o0OwMgaKHG1TSUW6j49SodvpJB2YkHQ3c?=
 =?us-ascii?Q?XzbNLaqqCQSZA37LLKMGSEitXn3WiXk1rpU6LsWvKJYVbKdg0h7i0rZLLEMi?=
 =?us-ascii?Q?Zi6ftn5qVKOnzLsaqiNZOa+HMO53qP/5hC8yvBs359AgPgTMCXNnUIju3Mog?=
 =?us-ascii?Q?xt8etPwE+DeUvlRBvJjIZCbdmQAVCE1gUxYPCzBLAr55nD2+3BCf2w/VW8Ow?=
 =?us-ascii?Q?zzlXju4zwKENmKgZ9NPUH3/eDDnALaL3UNdWLRCagtxpNJdphHeySUvv43E2?=
 =?us-ascii?Q?YUfARQPOQUXc71LQchTBzNj4FGB+r2WUsVXWcku+pPp+UFUlp1RS6UtPfJB2?=
 =?us-ascii?Q?xywJX96pFU7WzYJJIjwDoksUmJ1GgzcjkniAx7wTR98sl2BN0s8/CWNCvvcd?=
 =?us-ascii?Q?peWv8IbYkJuOKQolWTrWuPQ8hvItE7KD/Pt5UDN6UOzJAe067KH0F6xVjHVl?=
 =?us-ascii?Q?cItOzO4u30W/4c/aIe1FvJEhVs8hp5SOUp5xKw67XILbpSJn4CBRTQqRPTjG?=
 =?us-ascii?Q?5TcmG2MbZyvjwcEwirskv2iLBDeykM/03u9Rooh0B9LcYA8Zne3ASxldZ7LF?=
 =?us-ascii?Q?LNIwNdsrg1tusUxk54ldpqFlDMJnHcQbbw1dGiWYo8LK+jKRmHjRMbKENIXC?=
 =?us-ascii?Q?U/s49f/n0i0gO5PXjqjpXQrS9j0Wq5LkDTIKgF9aAlHho3YQuk8tq/Bo8REF?=
 =?us-ascii?Q?MeC8entUatK0q2bpQU82uUeEwVEd9Xapf5ShFApbeAhJFoV0E1+pc993bBR/?=
 =?us-ascii?Q?P7ypZP4u9AXV3JujuH7RmASE8PND9KSKIYw+Wwe4nWQCzfO5ySilcVazNGKR?=
 =?us-ascii?Q?lnReI7B8j9GJVmW0iz0pUP37T4DD6h/nNgqHHc/JQpSqvMdwDd4oNFE1BeVz?=
 =?us-ascii?Q?uH2aBIS5Ges8jMhxYX70OtxbR4RYqsXLgqb3l1XpsllQM4tjKUzTtN8iTtpe?=
 =?us-ascii?Q?j/awUhAX27z4gvqUVaGHe4foQzakSD7nl+OyPDwDfIYFC+dodTHvFVAincMl?=
 =?us-ascii?Q?VKFkPKr3W9j6fuquqmZrKi0kGN/+1qvxY9P9Dkh8JmxR7BnxGf3b3Oc53Lps?=
 =?us-ascii?Q?hDvm2rAj2Vy4Ayd2DjzPYlpYpOQJLLg1R8L2/oHxAVA83522W39NHApb5ySA?=
 =?us-ascii?Q?/uLdYQyuGIL7Vv1xfWs92YP8qXbm2KYZPMS1XOP/3hm+ENhELNs/K0iqewBR?=
 =?us-ascii?Q?x5UkR42oC+/XQSvIY6ohYIPN4B4k4aaVo+IF4pDa/QDNH7fspS6XGV7I2loJ?=
 =?us-ascii?Q?9uaInI9T94ag863xlKLPxpM0axW2XcWg1QvKPWIBI6Dyy3oq+CEO+ZzPIH5N?=
 =?us-ascii?Q?tbHB8PlQkgJn6gyNpUnMng71F7qRY/tjUaLEFxfCpNGNkg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?60WMlbiSnqpKcfoFxJhu6SvZ/QEmFkm6AbRE87cbCeevVOsq7r41lPdE50RS?=
 =?us-ascii?Q?MBt4JweRZ5M8vnPJaobm1FcbDQELr+vlrcD7grbHLY8BhWBVDQAt0bYS+Yrn?=
 =?us-ascii?Q?x9Qo8uDU3L4efFmeYMo7rzC1lxUNBO4oB55jMCe+ra21oLbXpynbqujZmh44?=
 =?us-ascii?Q?QwM4paFu8CzhuMMChhAAZa1OEn/vB2QPgBe+nOTt8wy5veDYxjf4zuY/p8KT?=
 =?us-ascii?Q?XjC1L4dlP0vvN+RX3HmbnPCeY4Dzrj+DZkNwB7vp8y6o/Thm8ky9n/PLiXwE?=
 =?us-ascii?Q?Y8Zo2txBsyKgT/1HYHA+egA+42ETKgJfUBgH1KSWWL7wof8Vt6ZUpCrD2Yr3?=
 =?us-ascii?Q?ma08OH3AMp2zumGGeL2IoovRgWMAxi/gixVOdqECkEGRqucSiNLEDPC0QKex?=
 =?us-ascii?Q?c2tc/bONWPVynPWc/bhXnbuNGenkeFHn7+xYtIJjCyMVCGyg7otvNt5wiN4x?=
 =?us-ascii?Q?aNRHHm0LT7iYRGG3mAIds4Pso/yE/wHeHQUC0C/QJdxkukrCDoB/RIo4Nvrd?=
 =?us-ascii?Q?QjeWDa8zszs2Y63W2FU2X0JDex0Uq9BdFdsomefMHijCIctuJK3KqBlEWz8r?=
 =?us-ascii?Q?Vcw5jGwzUtgEFBjTtZslWVkrQaGVl2F+KS7IN0WFTvvAXrWu0HcWB9AO6zcY?=
 =?us-ascii?Q?q30qBMKkHS4eiMa0hdZZW1HH6eE8Y6hffdxUHx8XVgEO1mh6Bfm5R1vQKEhN?=
 =?us-ascii?Q?/f//0NuXvtXBJhN0oKH8p1REkpck7r2Cil2ZmVP28NbJtGxF1/rFLfQG0XLi?=
 =?us-ascii?Q?tSFQbzt6nOIipjRwPhuL5Uqcd4OCa2SOBiZLD3p4hjQf53UlDWIg6I8ND1Kf?=
 =?us-ascii?Q?0JHJJYJGMoJQUv8s7her/1E/ZGlRSe6qs31+0ye9gPAiU7fqKZ2FOX+wld+s?=
 =?us-ascii?Q?6q7FhKaDJxE4l1aMNqHCq0oKm3fAD4RviZSQJODa7nufk8I9HmDGkOM2g+3O?=
 =?us-ascii?Q?UuP+bcHO8D/+GqcK18r0ISdAN37WacbE9KMkTWYdRe1KNnYPsgWJsjfEKlWv?=
 =?us-ascii?Q?rRwB8ph5PNSqwtkuzVuA82tspeLlpLsFG4c5eRh8Iwn4AETAEE5UAYPjY0Re?=
 =?us-ascii?Q?4xtoKGrhMpV09FSlzT7UkyjHjbjxlxmenP3yaLW2Vj24VJ/QPe6tNLwTsvI5?=
 =?us-ascii?Q?xws7kIFA1tpEU+8PQ+x7IiFB5BS0s/hVDQKyKFubyQ45IOWpSFACbyJTBhLR?=
 =?us-ascii?Q?S0iTnT4lmL0P2NtTVSe9+XUEwv0EOmAtOrB0zHpZNoQWja0tmRn6Z3yUusF4?=
 =?us-ascii?Q?8lX8JDMMtXtTOnRmQptc7y6wGTTlZSJ9UTNVoe+ky4Uo5sP0bj7haudl5F3f?=
 =?us-ascii?Q?R0w6l/igemMt33IC0I+PhEK64rogbLPgQPDLLZS0AKuz5DDrp0QhH4dE7fx1?=
 =?us-ascii?Q?4Sgcv+sJ19sxacbOrlZDWhZHhGUj+NDH58ojXAfafbTxckfZrMCsqnmOOJ4G?=
 =?us-ascii?Q?pvtOqLZShvDp4KZoB4ScH6hV4Z50Licx2S/cw7KoWsS03erg5AwFH0tYjeS2?=
 =?us-ascii?Q?tfjXD20u0S0nmL3F+Nv/WDwAr5X7RcCP210w5a5qVjF0afpqdOm1utgszMRs?=
 =?us-ascii?Q?nmHmlwUWemx9bRVc8NMqxR35qv6YjvDHc70R2RDj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8hk1oYa1MgsXKLYr7tsQTL/EfQ3wFrHg2Cfc+d9HnWCOj+fBmgzIqDHtIyyXVUfRgLvZ4LwrwZMJP7ncCL0DSr5VCzJ3v4BbNuX6n8Fpw15mnB0doaol3oTtGxS6n7MbDoc1vzZEy/Ab423njk9msI6QyaokYrroKSRs37bsqBqgt4SrWSJE05oBBIENkPvcDp6GdrXAGHucyzqaa3iB+ccRtNJvGNRAcuqm3TZzMPetQmoyyzC319gGCMs/hfY+21eeNh6NnVhLy8YOMWIU/WG6CTriP0Onvehlna1TOwV8iSQCUtcEUnG1q/AypEcMzYA7XKTZrpZR86qnASEE6WFuyQ2CK2IQu5LI0Vo95jCn8ZivM9yz/20J0PxAkwyKprT2D7UstlIN98AS6N6QadTHt08TuXFs8oCKWSxmIyeKHRSdGTJ6BALVys5bSRgt80vCfmNepo5+IOIVXdfacFkaxdA/Er5G6fm0b2XIkQ7lue/Eix7hg4bowTniEUOo5XMAu1vmjuGHtnkyfzhSySsL4NFwXoTdKoUFXrZTh7iE+66wkvN5uRnbHvXm2bljmiSotYtTdphGDhzOwc1/DNqbO+9aZ3JLQFhcKmAtUXY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66977649-e880-4996-194d-08dc966b75cb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:06.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q31i+Q4w1lDJo5DOf1SItxfNn4Rzg0IFMRkny5NKt0XnmNopUmTncXvrAQJDuiaigBo89NEEgGAQ5LTN4SYqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-ORIG-GUID: x4yV8AWz38kIMAicCxXLnBTkRSRy_0_I
X-Proofpoint-GUID: x4yV8AWz38kIMAicCxXLnBTkRSRy_0_I

From: Eugene Loh <eugene.loh@oracle.com>

For up-coming USDT-probe support, we need to update a BPF map
-- at least when the dtrace session starts but possibly also later
to support systemwide USDT tracing for processes that may start up
later.

One way to do this is with a USDT-specific update function.

For now, let's add a hook for providers to have provider-specific
update functions.  User space can either call

    for (i = 0; i < ARRAY_SIZE(dt_providers); i++) {
        if (dt_providers[i]->update)
            dt_providers[i]->update(...);
    }

any time it likes.  Or it can call dt_usdt.update(...).

This is for WIP.  A different approach can be adopted later instead.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index b1b1b1b8..71b5a3c4 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -71,6 +71,8 @@ typedef struct dt_provimpl {
 			      void *datap);
 	void (*destroy)(dtrace_hdl_t *dtp,	/* free provider data */
 			      void *datap);
+	void (*update)(dtrace_hdl_t *dtp,	/* update provider-specific info */
+			      void *datap);
 } dt_provimpl_t;
 
 /* list dt_dtrace first */
-- 
2.18.4

