Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF524EF7C
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741792101; cv=fail; b=lcHfskVY2F1SMbCA4DT3MnCRblufKxcdK/cFiVMeKxyjxOjla39AaBODN3Lieq56FB7QVkgVUwXkCgI8XyYKydKwNAXyRga47I6/ehZirnYKX2dGuHNQnGDllOieKRvIXIGlB3BsP8YSy7VNb9EFPndue8Mxw6wcCJotmIa/2Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741792101; c=relaxed/simple;
	bh=m6PFTTyGIR6cyYCSHH0fR8V/jwQ/Skd5YSPnXrVd09A=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=mMgTuqauYEbEL5H4oSSX8RctYHddOT4JvPP47M/QpBargXptb5rG4fbwTqDWIc+oWrI2a9sw/hnwsTlVcPyfWgfDnr1fcZO88YU8FVh2EqfpxwzCY/YFiDX0V1wBgDHcBQ4zKAm95BuJaYe9HGwWAheJjOCkUl66se9OrLRTvzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MtmBwwbS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EG/pNm5s; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MtmBwwbS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EG/pNm5s"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CBeCs6019051
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=ykh4hDHLKKwSkye9awo/Nx14g59I9GWAXp7kk8bzgNc=; b=
	MtmBwwbStgXDWf1ZV1hWhqjRUEJmvMnKs4dZyD7OKRb3h2RIOsx4J0FLMLGsIqG0
	f7WWztvjNOAo2xjdoqNqym59JwFt1Pht8e0pyNqdk2wrbzJj+UPLbBzVZZ/eDTKY
	74/Hlm45U7tDJADl/AFroSyjtUh11GJpUQEa5DWL4YwvUoZWxiJ6mUTmYEYD782j
	ulT9H35lYZQOPnSkPAfGBGU9t2FFwoV/gRecD1X6b4JGLIe8w6uhf3ruUjp1DV1+
	wCxpxQ2bLFjDfAxJ5JOTlWN+0PWnQSmU7/zDGK7vN0g6GNRgIxNUFKbOHngrytCb
	YBRBP87hm5rJjnn38oy8sg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45au4ha1vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52CEMXY5002391
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:17 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45atn7dmde-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Mar 2025 15:08:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCH1R0HxfpK+HDp5N2AID/K6sd+xOGfoDe8v2lNwoyuTjv6owR+QGqQLtn/Uzy3vFGchvER6iH0Wr33JAmY5l29ABJLazeDXdHad34xbzC4FRYukOvyovU2ByQMnhNZoN8DNfLFXbUrTO+VHvORrI0G+ZDH39ugOnzszHiayHhnsL5ZqnPX8v8SWEGbH20tn2BHf5A63kF1MDVc0USvyZlqhCGwrOMvUVeejTyg0NXs6KUB9iKJ0EBRNXliGx7lW+6i5z/8Lm8W3bq28kN/TeADkEBojw0ry2uxs7pkO4h+a1W3TSexkjtEetggd4IVhlLgWBE9KVic+ziOfJu9v1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykh4hDHLKKwSkye9awo/Nx14g59I9GWAXp7kk8bzgNc=;
 b=hrQkn9J0OwE8YGL7V0JA+rf+XLsZRgat+s/iobd8tdhmvq9Zkx9OSxTfLCucJWxWKt9h30kyosr7saymYNoCCIT1gSwujsCI0apha17in5GxKLnFDqpnx7QV9sX8slO7/rU3jBKsv2qgEQ6DiW2ckrzX3q7D2HZwx/wSczpvWlLwxQJCPHi8SkqSUIyVPxeVh7JPJNSpWxUe94FCid3bHp3SA/wY5K9+ZXZtJWOG3qMKrH9HQZVv8R7LbYLxh+q9cu2U3B5Y0CS+z/pGCgGKkQHuJQgIThUC54gR2Yutg6yrxw5XRrvBXEAOr2EP7t5XryYeZ+s42AQvXoYZG1RdEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykh4hDHLKKwSkye9awo/Nx14g59I9GWAXp7kk8bzgNc=;
 b=EG/pNm5s3aBiYKuvqTeYXOM9QitL886llKv5kYDLIoyaU0XarLfvGVdHvQuq10xbQW0qLmTxAEraSypD5vsOPr1xzBzDpZS5cmyxhP32kdOGXtoAF9UYQk04jNf5YoCx+L3UuhAxZBMVb+FB5CqeXSwE0wWPDC5geRFLt326pD8=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4492.namprd10.prod.outlook.com (2603:10b6:806:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 15:08:13 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:08:13 +0000
Message-ID: <c4ad72a5128eaa842f3ebfd2e3a05080.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Tue, 14 Jan 2025 23:21:11 -0500
Subject: [PATCH v2 6/8] fbt: performance improvements
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::15) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d47b93e-66be-469b-c9b1-08dd6177b575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rT4rgSztDmUH2gB94uNbwIdVjkO+Qfd916DvyZuINPTsxUKwOq6tVlzVSz0Q?=
 =?us-ascii?Q?5XEBQPVHuTYiVD2WNE9seOxXMXq/gmJ8qqfZZ9X07DRPRpzM7PII7xvL4AIE?=
 =?us-ascii?Q?n89XomeEeJPPTuz8tw/b8VnzkmaJOMyFNmCkWtRAijp6F2DxKgGx2fH9vtP9?=
 =?us-ascii?Q?E5QMNefCu27E5SDxoYCwjQJcykDdMf++aay8tKJftvBnr8W70M9+9j4oVoc/?=
 =?us-ascii?Q?RqiOB85ktt8XRkCDJgGONsZzCXd2psG3v4QDvnJPn8ysWG/pd2psX8Uo4PG8?=
 =?us-ascii?Q?S9l450Hqr2QSyolipA4SCFk1i0i3Q5H7fqJ353Ayf5rm/C3e2tWJxFR4LHoF?=
 =?us-ascii?Q?GUal/vjdSgMOVsFv4RoOGA5+Ip1BLtzsgO/Bh7fcLECMQU3hHDbE5yNh73lt?=
 =?us-ascii?Q?fsRGJRDrRXWbOYtvCcCN0y40WGuH0BBoGCw6tfRfCph0JXSBAMkbKriKaGzh?=
 =?us-ascii?Q?LQBYKNIna3Lq7cwsIuEyk+qsks13QMu7865AGmiflWQu0INSHsz31Q875m8D?=
 =?us-ascii?Q?AsJ4uFHaaIck3H8tXZUzxkQE+4KFLjRbnTc3ECUumPOKaAuNkILehG9W9WUu?=
 =?us-ascii?Q?q8HAW0oamgUXOeZGot76V9Ab6UBgAoqzNSrXMZ80uln/MmMD2iDRwY3l3QfH?=
 =?us-ascii?Q?uKxuFGq3jk9uaCUVKDXNd0XW3UiyJHHhauMhX3HHYT3OD1CjFzEoy17I+dvD?=
 =?us-ascii?Q?diu7nhl/ALzLlkJWV0+GZOhuz6k7KJnhFbNd6TsTn1YKRM2n4rJ1FvhOUMS1?=
 =?us-ascii?Q?dsJeTGiVlwUHnttnMNODLIboaNHPEH+/h+SZeCJUcZMCMsXa94hz/bNTP+5/?=
 =?us-ascii?Q?ZMTeXGgyHOBkCdA0nuvS9F18IfBzLxTTHSOA9g6vptqXniA1fUggPMUBBi7t?=
 =?us-ascii?Q?znHvnrhCZO2ibx5guofLJQ8Rd4k6k0Gmc7kR8E7lDafqSQeKAQxfWuyjiskS?=
 =?us-ascii?Q?LWHnKhQvj2fMovzmElL6CiRZyVghUMy8H5ySpDAXQHX54wCW7DSJzhyKZg2j?=
 =?us-ascii?Q?VXC3rVIksccC9XpoldS4pdGmgSJ3rcds2xdy+1mlrrBnRpsL1HJfHB6yQlgb?=
 =?us-ascii?Q?VNtQ9D/iP2V8D3Fz56tiFDqeeaQzNnZXEJ/1qsH8TUCP6ZGSr1Foxxbe/tDA?=
 =?us-ascii?Q?6220F6lz1kEgBMjlJpVxgwHKp8UY5zdH1i/r66B2e39BWZ756IAc0Wx0u+Rh?=
 =?us-ascii?Q?wFuAYIIn0rz40wJQR3HjAoh3xH1/YRr1HMxojTCA9BtoiRkPDWSN2nWFU/Bd?=
 =?us-ascii?Q?9dgrKWw0CNZ8iwOdQk5XPtIQRJgYB/nU2h+bN5AcnrNsM2w4oexHF9LC3DM9?=
 =?us-ascii?Q?Dqps49v/zZ8XTnmoa7OiRmzLpU8PUo+qmwdnm2NRDI0jMeBgtP6jwILSyUue?=
 =?us-ascii?Q?3B79KM3fvyyt7rw9+s4K6bIe233I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VVyUgoyQMWdtiPFGxS51povMgN21spel/SkoHLH6Q9Rs07JvqJf5MVBUZeGY?=
 =?us-ascii?Q?ivT5Ti0KE3emMcY+HNbIDYK47l4E+JVy0+Kzt3Pqgq9pd70mDT+D8ZutbLAq?=
 =?us-ascii?Q?sO83EJWDlaHhmiBWfxugO1YcvkdcV5n0KszBEkIgr/OwYAcvsDEaCImet4kD?=
 =?us-ascii?Q?PSIj8PfAaBsua7NjDkdIZ0CT/fyiVlZAXnZGP7sEX/QDN6haVFInrrEjevPU?=
 =?us-ascii?Q?gWf2O5lskIOF+v86rxjLiCNZvIRmWbT/l/4unXJILF64UK+iiRW0s/+81PV/?=
 =?us-ascii?Q?VqLfwIXfOdGpWBV84faWB8GsSc/1bz4ikFKEMQH9FON6WOcjzYbS/gS2pqWX?=
 =?us-ascii?Q?1rXKndwQBpim7onFc/wu549w5AYg5QSsEbElWxF2n5tv3Lf0tUfEgYK3douI?=
 =?us-ascii?Q?X6hrRHRmCssDIO65lEVk85gBHWQ58GRr34t66GyBdqlqLMmiHLf8gUtsPRTj?=
 =?us-ascii?Q?QBp/DypZ1SjkasIVV8PuUJkkmB5bYmAuNHIGRJD8NifAWBX4ApWprh1wBAl2?=
 =?us-ascii?Q?uRI05oeTkFIruicx1NETJFbO74AoMZc3uNElzfzuxZA0cqM/Xsn47wJDzm5f?=
 =?us-ascii?Q?DAFPXrhuYYp2Kc+MYOI2xOkIoE3+5cpmP8dsqlXOLqdbzY4XgeDmPI/lMEoQ?=
 =?us-ascii?Q?YvTj9EhupD54fdcGid1BMuz7Fi76nIALp7RxwIs2FFXfRYmwRJvnRbkxM3PW?=
 =?us-ascii?Q?xCI4APzG0DloBVnlV+mIGc/Lry5mtIs5ggeKnu61QGfi+nbAzSzsYLT7C+ym?=
 =?us-ascii?Q?UaPMyoRzh53INH0yXcaYxdEhNqRtfvnw6FFfLQGdGMRwbzIKX3OyOzHuzB9U?=
 =?us-ascii?Q?bGf1gVuUjxfaPLpCsPcAkle0r7HV04jyoxnS5hQFlJzM+Xrk+ISsKfBCVaKm?=
 =?us-ascii?Q?2I7MMhmGXQlxlYXyLEeQ6bBCF7jVF994ZH9UHcsqqncsWhyE692+Cl2fLCFb?=
 =?us-ascii?Q?1FS8PCgrL5APR5Q0lBPRcP0RIrb186eFVeeV+navYkf9hbX4sl2F8JUr1Vm8?=
 =?us-ascii?Q?y/EPZpPvuyqR9NunAShSxZxqBgpDwFOx+TjgNkYx3cRL9NJx/2jREA7CfLrS?=
 =?us-ascii?Q?ueNv5PhPIkosWWyQGCfUl6qAe4ey+6DjkOyatrrAhwYPvG8GiIbe/cqdLRhE?=
 =?us-ascii?Q?QLBTztxHYN1tyf6s9Eo/MKgtBelsWkvXiuT91wzGEt/MtLcozi2YsSrg2NTw?=
 =?us-ascii?Q?Ui6F1xKeTWjwPrAZCu1CM9VaN8R9j8WmISkxWTr48mjsXPHSqEV7h1TjFN/x?=
 =?us-ascii?Q?GhHSrjfrR3LpoPstIp6apwTo1ln8M8g9G934PPuMeqThaJwwWnDt/MhlVtHk?=
 =?us-ascii?Q?I8GKZoVzx/yCdSaiGa8L+qC3QTOiJlb25iA8C7RMhufO9keM4f+4yHA1UaGv?=
 =?us-ascii?Q?BAiuClfy6P0Xfr55bkRUDyHgDPA1QQium1Y7Pu2FRZ52DI543Y3YYDLcpr5x?=
 =?us-ascii?Q?G1RqcrotfolO+jN+s9rugy6nBWLyMX34EU+Et0yjiPQPV8vtUA5xrQW8jPsk?=
 =?us-ascii?Q?JKAvvcYPk/SlcC9+NEjzLod5ZwyRBOIs0FjQM437nEWg3r6u8RuwqGNTFFjh?=
 =?us-ascii?Q?pq7IBwWgNhcsuJY6unaGOwuoQrpIU6o2Q57Okivbb2gbc6l24Wl85d0aLmYn?=
 =?us-ascii?Q?1ZBzbJYTNLhIrAELr+kckOo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wgJjJut4v9PzmraGlJ4LJq7rUk/HYMrZYcOOUB4WE1n/UGNV2loeT3cQet2ICSfR9lZG2+n6DVFUDJKIUy+c+dM7WJmcXJTaSCQ4RxeCiqqkWyCgzIPr+8in+SRaNd6s4MjVX1HOeltkDpnDUwq/RjQ1HC8QpSBOIexBxztOA2+HsK8RC30x8eH7zrP2/IqNMdkiemW2TeDRWc4D0p6rW3ItDIXnCrMdpQMb3zT8Gf0s7uOQsqkhzo/bol1aamkkis38GakGUfQT98uztMONLnDI/5RVaHf5pVOQt9ofT6Mou4AwT2+r/c5Yf249NJkPLXMvHtvB6wXTcME/ERe3MTnHcbB3WZXqh8bp3qqmXQhOTonMIzHazDaAxXUVZEpFOqczD3MQJJMyDfkAnnIEaJ3MLNc2E13e+1+YWjclyHftkfoWgedOIPImpDqb1Vfd2KJKydjfHVrGieNMqAPD/Z0BQscOFZLXp5VdVgmf5auFBgljHakFpXyLMQUu+3tQfhPczu+QVxBTd0DBQm6nakrtfi2ERlFSE2f27dcOs2Iqyg8gQKBUjNIIAIiOn62Vz9Fw76xkZGnxRwEzdcRqyIx0pruxXq9OLynUncPjRE4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d47b93e-66be-469b-c9b1-08dd6177b575
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:08:13.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xQnwJ0GPZfS9RwcNJ66lRU9Xj5d/QWl8YZPIHvziCbJKOL7MnkKyKKt8J1Yeusc/ijkxAmO4Rm6A1ehPqOE5QzL8TK4HOrC7aPuDa//n2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4492
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_05,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503120103
X-Proofpoint-GUID: P5hodnye9nb6gYhwUJMH6w7Qhb6--9KL
X-Proofpoint-ORIG-GUID: P5hodnye9nb6gYhwUJMH6w7Qhb6--9KL

Up until now, FBT probes were registered for every symbol that was
listed as traceable.  Most tracing session do not use most or even
any of these, and the process of registering them all was quite
slow.

Going forward, FBT probes are registered on demand.

If any FBT probes are to be registered, the first will incur the
cost of reading the entire list of traceable symbols.  Any further
FBT probe registration will be able to be satisfied based on that
initial processing.  The performance improvement is therefore quite
significant for tracing sessions that do not trigger any FBT probe
registration, and if FBT probes are used, the improvement is still
quite noticable because only the probes that are actually needed
get registered.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c   |  78 ++++++++++++++
 libdtrace/dt_module.h   |   2 +
 libdtrace/dt_prov_fbt.c | 219 +++++++++++++++++++++++++++-------------
 3 files changed, 229 insertions(+), 70 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 2e915e2f..e7553a07 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -22,6 +22,7 @@
 #include <port.h>
 
 #include <zlib.h>
+#include <tracefs.h>
 
 #include <dt_kernel_module.h>
 #include <dt_module.h>
@@ -1044,6 +1045,83 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	}
 }
 
+#define PROBE_LIST		TRACEFS "available_filter_functions"
+
+/*
+ * Determine which kernel functions are traceable and mark them.
+ */
+void
+dt_modsym_mark_traceable(dtrace_hdl_t *dtp)
+{
+	FILE			*f;
+	char			*buf = NULL;
+	size_t			len = 0;
+
+	if (dt_symtab_traceable(dtp->dt_exec->dm_kernsyms))
+		return;
+
+	f = fopen(PROBE_LIST, "r");
+	if (f == NULL)
+		return;
+
+	while (getline(&buf, &len, f) >= 0) {
+		char			*p;
+		dt_symbol_t		*sym = NULL;
+
+		/*
+		 * Here buf is either "funcname\n" or "funcname [modname]\n".
+		 * The last line may not have a linefeed.
+		 */
+		p = strchr(buf, '\n');
+		if (p) {
+			*p = '\0';
+			if (p > buf && *(--p) == ']')
+				*p = '\0';
+		}
+
+		/*
+		 * Now buf is either "funcname" or "funcname [modname".  If
+		 * there is no module name provided, we will use the default.
+		 */
+		p = strchr(buf, ' ');
+		if (p) {
+			*p++ = '\0';
+			if (*p == '[')
+				p++;
+		}
+
+#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
+		/* Weed out __ftrace_invalid_address___* entries. */
+		if (strstarts(buf, "__ftrace_invalid_address__") ||
+		    strstarts(buf, "__probestub_") ||
+		    strstarts(buf, "__traceiter_"))
+			continue;
+#undef strstarts
+
+		/*
+		 * If we have a module name, look for the symbol in that
+		 * module.
+		 * If not, perform a general symbol lookup to find its first
+		 * instance.
+		 */
+		if (p) {
+			dt_module_t	*dmp = dt_module_lookup_by_name(dtp, p);
+
+			if (dmp)
+				sym = dt_module_symbol_by_name(dtp, dmp, buf);
+		} else
+			sym = dt_symbol_by_name(dtp, buf);
+
+		if (sym)
+			dt_symbol_set_traceable(sym);
+	}
+
+	free(buf);
+	fclose(f);
+
+	dt_symtab_set_traceable(dtp->dt_exec->dm_kernsyms);
+}
+
 /*
  * Symbol data can be collected in three ways:
  *  - kallmodsyms
diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
index 56df17a6..dd3ad17c 100644
--- a/libdtrace/dt_module.h
+++ b/libdtrace/dt_module.h
@@ -25,6 +25,8 @@ extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
 
 extern const char *dt_module_modelname(dt_module_t *);
 
+extern void dt_modsym_mark_traceable(dtrace_hdl_t *);
+
 #ifdef	__cplusplus
 }
 #endif
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index eef93879..827156cc 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2019, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
@@ -41,10 +41,8 @@
 #include "dt_pt_regs.h"
 
 static const char		prvname[] = "fbt";
-static const char		modname[] = "vmlinux";
 
 #define KPROBE_EVENTS		TRACEFS "kprobe_events"
-#define PROBE_LIST		TRACEFS "available_filter_functions"
 
 #define FBT_GROUP_FMT		GROUP_FMT "_%s"
 #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
@@ -61,19 +59,11 @@ dt_provimpl_t			dt_fbt_fprobe;
 dt_provimpl_t			dt_fbt_kprobe;
 
 /*
- * Scan the PROBE_LIST file and add entry and return probes for every function
- * that is listed.
+ * Create the fbt provider.
  */
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
-	FILE			*f;
-	char			*buf = NULL;
-	char			*p;
-	const char		*mod = modname;
-	size_t			n;
-	dtrace_syminfo_t	sip;
-	dtrace_probedesc_t	pd;
 
 	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
 
@@ -81,79 +71,166 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
-	if (f == NULL)
+	return 0;
+}
+
+/* Create a probe (if it does not exist yet). */
+static int provide_probe(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	dt_provider_t	*prv = dt_provider_lookup(dtp, pdp->prv);
+
+	if (prv == NULL)
+		return 0;
+	if (dt_probe_lookup(dtp, pdp) != NULL)
 		return 0;
+	if (dt_tp_probe_insert(dtp, prv, pdp->prv, pdp->mod, pdp->fun, pdp->prb))
+		return 1;
 
-	while (getline(&buf, &n, f) >= 0) {
-		/*
-		 * Here buf is either "funcname\n" or "funcname [modname]\n".
-		 * The last line may not have a linefeed.
-		 */
-		p = strchr(buf, '\n');
-		if (p) {
-			*p = '\0';
-			if (p > buf && *(--p) == ']')
-				*p = '\0';
+	return 0;
+}
+
+/*
+ * Try to provide probes for the given probe description.  The caller ensures
+ * that the provider name in probe desxcription (if any) is a match for this
+ * provider.  When this is called, we already know that this provider matches
+ * the provider component of the probe specification.
+ */
+#define FBT_ENTRY	1
+#define FBT_RETURN	2
+
+static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
+{
+	int			n = 0;
+	int			prb = 0;
+	dt_module_t		*dmp = NULL;
+	dt_symbol_t		*sym = NULL;
+	dt_htab_next_t		*it = NULL;
+	dtrace_probedesc_t	pd;
+
+	dt_modsym_mark_traceable(dtp);
+
+	/*
+	 * Nothing to do if a probe name is specified and cannot match 'entry'
+	 * or 'return'.
+	 */
+	if (dt_gmatch("entry", pdp->prb))
+		prb |= FBT_ENTRY;
+	if (dt_gmatch("return", pdp->prb))
+		prb |= FBT_RETURN;
+	if (prb == 0)
+		return 0;
+
+	/* Synthetic function names are not supported for FBT. */
+	if (strchr(pdp->fun, '.'))
+		return 0;
+
+	/*
+	 * If we have an explicit module name, check it.  If not found, we can
+	 * ignore this request.
+	 */
+	if (pdp->mod[0] != '\0' && strchr(pdp->mod, '*') == NULL) {
+		dmp = dt_module_lookup_by_name(dtp, pdp->mod);
+		if (dmp == NULL)
+			return 0;
+	}
+
+	/*
+	 * If we have an explicit function name, we start with a basic symbol
+	 * name lookup.
+	 */
+	if (pdp->fun[0] != '\0' && strchr(pdp->fun, '*') == NULL) {
+		/* If we have a module, use it. */
+		if (dmp != NULL) {
+			sym = dt_module_symbol_by_name(dtp, dmp, pdp->fun);
+			if (sym == NULL)
+				return 0;
+			if (!dt_symbol_traceable(sym))
+				return 0;
+
+			pd.id = DTRACE_IDNONE;
+			pd.prv = pdp->prv;
+			pd.mod = dmp->dm_name;
+			pd.fun = pdp->fun;
+
+			if (prb & FBT_ENTRY) {
+				pd.prb = "entry";
+				n += provide_probe(dtp, &pd);
+			}
+			if (prb & FBT_RETURN) {
+				pd.prb = "return";
+				n += provide_probe(dtp, &pd);
+			}
+
+			return n;
 		}
 
-		/*
-		 * Now buf is either "funcname" or "funcname [modname".  If
-		 * there is no module name provided, we will use the default.
-		 */
-		p = strchr(buf, ' ');
-		if (p) {
-			*p++ = '\0';
-			if (*p == '[')
-				p++;
+		sym = dt_symbol_by_name(dtp, pdp->fun);
+		while (sym != NULL) {
+			const char	*mod = dt_symbol_module(sym)->dm_name;
+
+			if (dt_symbol_traceable(sym) &&
+			    dt_gmatch(mod, pdp->mod)) {
+				pd.id = DTRACE_IDNONE;
+				pd.prv = pdp->prv;
+				pd.mod = mod;
+				pd.fun = pdp->fun;
+
+				if (prb & FBT_ENTRY) {
+					pd.prb = "entry";
+					n += provide_probe(dtp, &pd);
+				}
+				if (prb & FBT_RETURN) {
+					pd.prb = "return";
+					n += provide_probe(dtp, &pd);
+				}
+
+			}
+			sym = dt_symbol_by_name_next(sym);
 		}
 
-		/* Weed out synthetic symbol names (that are invalid). */
-		if (strchr(buf, '.') != NULL)
+		return n;
+	}
+
+	/*
+	 * No explicit function name.  We need to go through all possible
+	 * symbol names and see if they match.
+	 */
+	while ((sym = dt_htab_next(dtp->dt_kernsyms, &it)) != NULL) {
+		dt_module_t	*smp;
+		const char	*fun;
+
+		/* Ensure the symbol can be traced. */
+		if (!dt_symbol_traceable(sym))
 			continue;
 
-#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
-		/* Weed out __ftrace_invalid_address___* entries. */
-		if (strstarts(buf, "__ftrace_invalid_address__") ||
-		    strstarts(buf, "__probestub_") ||
-		    strstarts(buf, "__traceiter_"))
+		/* Function name cannot be synthetic and must match. */
+		fun = dt_symbol_name(sym);
+		if (strchr(fun, '.') || !dt_gmatch(fun, pdp->fun))
 			continue;
-#undef strstarts
 
-		/*
-		 * If we did not see a module name, perform a symbol lookup to
-		 * try to determine the module name.
-		 */
-		if (!p) {
-			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
-						  NULL, &sip) == 0)
-				mod = sip.object;
-		} else
-			mod = p;
+		/* Validate the module name. */
+		smp = dt_symbol_module(sym);
+		if (dmp) {
+			if (smp != dmp)
+				continue;
+		} else if (!dt_gmatch(smp->dm_name, pdp->mod))
+			continue;
 
-		/*
-		 * Due to the lack of module names in
-		 * TRACEFS/available_filter_functions, there are some duplicate
-		 * function names.  We need to make sure that we do not create
-		 * duplicate probes for these.
-		 */
 		pd.id = DTRACE_IDNONE;
-		pd.prv = prvname;
-		pd.mod = mod;
-		pd.fun = buf;
-		pd.prb = "entry";
-		if (dt_probe_lookup(dtp, &pd) != NULL)
-			continue;
+		pd.prv = pdp->prv;
+		pd.mod = smp->dm_name;
+		pd.fun = fun;
 
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
-			n++;
-		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
-			n++;
+		if (prb & FBT_ENTRY) {
+			pd.prb = "entry";
+			n += provide_probe(dtp, &pd);
+		}
+		if (prb & FBT_RETURN) {
+			pd.prb = "return";
+			n += provide_probe(dtp, &pd);
+		}
 	}
 
-	free(buf);
-	fclose(f);
-
 	return n;
 }
 
@@ -447,6 +524,7 @@ dt_provimpl_t	dt_fbt_fprobe = {
 	.prog_type	= BPF_PROG_TYPE_TRACING,
 	.stack_skip	= 4,
 	.populate	= &populate,
+	.provide	= &provide,
 	.load_prog	= &fprobe_prog_load,
 	.trampoline	= &fprobe_trampoline,
 	.attach		= &dt_tp_probe_attach_raw,
@@ -459,6 +537,7 @@ dt_provimpl_t	dt_fbt_kprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_KPROBE,
 	.populate	= &populate,
+	.provide	= &provide,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &kprobe_trampoline,
 	.attach		= &kprobe_attach,
-- 
2.45.2

