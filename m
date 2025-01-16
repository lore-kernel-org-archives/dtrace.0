Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E93158520
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737065074; cv=fail; b=kryGnBYDPQDyqvgylbVNgXtAsPmnfgXg614C4cF0BKAxn6uEmAfKZAvFkxkCKEqK0gF0mEmnsI0c9GJjv6W+2N5NtvAmszis8ROvnDJF4CHbiZKCzxGi+f/bYMURJwA8T85Cl5cle09mKAQ3SJMWqHlfsDqnfrumHN4N8lbIG1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737065074; c=relaxed/simple;
	bh=UB4hCcq3KNgPQHUCsMVoODgTSa9tghOugTby/8kEp34=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=teQJsxgHG4vMUeN4XQH+QQr6cGD0K4gJRfkFlfqFEivlDJCKzaMqbiVqp1vvx4Rm/0hPkt51hIsutHsFMNeyUxGaRAkfHo1+zwn0rChM6kznWJiqb+O9dZQ7UXPLEb8FE8ZGHsbV1BIbgBycREBSuS3vqiX1m8EQZfG6z8Z8G98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M6eOVOk1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U6ohjtRn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M6eOVOk1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U6ohjtRn"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GM4W3Y020477
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=HLQdOOKQL2hg5oGBIFvqaXLTyHqxEmP0fBLKaNZG9kQ=; b=
	M6eOVOk1FyLgtXyeyK6/hSRz85sI6emyPj/6oxn/vg3GJhFKuVVeCvtQCIajw4z9
	Cp0IO+jmF963MCD/MovTimslrEe6FfbeqPtGbEjViVs28EDU4ZFd0N53BsSyHNuo
	ZT1hlj3bT45/rBsmYkFe9INL8SZ65l1HQ7KIjywqEpv/xye/iC//mTuAD/ksmzJd
	CoTO48ScvrnT/saHOkT4/Elg+FcvRa0Gn6RXQDQSfWlJAq9jIRg7Pkm38qH3Vfy6
	FMyTJwdfAxOaIc7ZLO/Vl6J2gDB5OnzMpb9mrBw73XxrSJtJ6XuEOuCzEjDxdZ2y
	R/BSERSV+H9EUFfa1Sa+9Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446pdx25ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:04:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GKbn1C040275
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:04:21 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f3bd2wy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNw2tckdu3gXYqCv8HSAitH4/G0yzncnFEAvvthOCpVlAaUQHe+3G8jdSIfwDzWZ9kle/q9q2sPlNa/ClQypnu2zGa/l0OUDwS4HC368ZOER0KbAQAvaPYKJOPQ6UCW/WsDKPQ/qgn7B8DBB6e619ZWUnSrYvizuP7JU0BjAprW3p63dv0SP/x/03sZM2IbtTw/qZim6NKZR70YKOCKeawDWC1DNzxygojtPv167KN7xR+3c6dbym6aSGSbUIMu6k3V/I+pytie5ruuaW9mZJR8NGsREO2L5mh6MZljV8oiQrW4hb8wmDOQMd1nCG6GUiCUsMp6U7ptY3w18LXsCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLQdOOKQL2hg5oGBIFvqaXLTyHqxEmP0fBLKaNZG9kQ=;
 b=HtviM6OSJa++ZwcSGcNu1NmK3bdEoW6as0L4NsriVdiuQhmtw/t7/epx3DgDG+lWGmbsM9PF/9g3qtEzaAwJuinnqbW9Yz8XU/woeTR6sqK5tezeUTauUfg0nwi76siQAOGZyryJdVVCyuucS27tR2iipH4ZHI2oOJM6Pq/rn6Uq56UsW7oMFMie3c+a2tH+946pGISv72pgQ+H0aJi6ssZER+kQiNGiFsNTdniD4bE+nQ7Oph8R68fPvcvhghaooyJfha8w+MBhiSbVTxUrr8b/h+dRM4C923UsHbAYb2qqaPR78Y9N7FiR/4rOfbNS5yGVdF+afYaLEsnU1i6hZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLQdOOKQL2hg5oGBIFvqaXLTyHqxEmP0fBLKaNZG9kQ=;
 b=U6ohjtRncWK2/OKxmnIpvk1JhZDsp/Uhs+UcWVUq7meffr0GFIiW/nECfRfZZjbAlVmAXAvMvdXpkeFXyfgYQZWqsHSXV2Qa7rnQhLswFZ2/DupFB7UHXXVPuSOfQV6iEzDeyNkzzkND5CtPefkgU+pmpDZWXY8msF4R2ADSx98=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7764.namprd10.prod.outlook.com (2603:10b6:610:1ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 22:04:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:04:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix trampoline use of BPF stack for scratch
Date: Thu, 16 Jan 2025 17:04:15 -0500
Message-Id: <20250116220415.31864-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:408:f6::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7764:EE_
X-MS-Office365-Filtering-Correlation-Id: 636f4832-79e0-438c-08d5-08dd3679b921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?COu0651sLrlXQueDfkh20W1YKhHRj2WgUyb02rYxYparieFBhy160moCk81x?=
 =?us-ascii?Q?BH9XmpN+HzlC3VoPG77y9mnmF7FJsz7DjHeijdwVZdvD/R4arV51aGrON+tS?=
 =?us-ascii?Q?Y66xYcTg0dR6McWTsfkGWupi8UW93XuV03N9xpL7fM5O5fej0/91RLY/krX1?=
 =?us-ascii?Q?SxrcgSfj8AXVZS92vYpfxlt0Hhi30Ihf5caM4LZ2q8x5nsKo9M1cbcg5d0C7?=
 =?us-ascii?Q?K9cmggSW1BZGjON9BzS2DHvMbcmbAitw2/sOLu/YDEurkmgx/XR4KyeTAjur?=
 =?us-ascii?Q?+UQRfGrvjIxO8SbhtKnmiAraykxPUUVxZrBu6i9unn68Ky62bwSbM5MyLs4l?=
 =?us-ascii?Q?oACFCVKSCIwriDKq3JB9q0Mpp4btOo+e0U4sZE27WrE5q8fjlYYWbjOIdjze?=
 =?us-ascii?Q?95PpgsTSsWFWOXel9n6NPCKGVty5ZVGRenj8LVmbobyXzFZKcScVaSGZwytZ?=
 =?us-ascii?Q?I1C3P15ALw5YbVY/+FljuNahAFMH/m2R91VCkvSx8MVMJHeThxVmEGyNAw8S?=
 =?us-ascii?Q?g2hjOjTR2ZcOwXDVQJBvkZYaLgfQZYwm50eexgul6MPDo45cZW0Zvbp4zbFg?=
 =?us-ascii?Q?nAYNED6P5cOrSAqs5DpMulbRclyd/mba+zQ3Y1MOM25YWznOyzJ3lu6h85Vn?=
 =?us-ascii?Q?pBH1qwJ7XP2vXQeijz7/jCLYtF+U4L2tA0Vg5M+h1WGCZfVUZ2o9c773j9rG?=
 =?us-ascii?Q?KyMAZ7fCmwlcSeuh6pqmQQ8HfxwOkJbwYws77+kPpgZRNqkCPuY1/a4t5LrI?=
 =?us-ascii?Q?S3ROkHOLa7Kl3jsx8tJl0Lsz9I/kBfJV6HoOMYukhuHsdJYNReacqH6LQcUh?=
 =?us-ascii?Q?EaQ21n7H/4iy1igUlaJu4wrn3v43WJbJAPd66kcoqAMLXBy4mgqSkhgpr19E?=
 =?us-ascii?Q?vi5MsqVV8ipAEOZvx0ZyoWJWJglx5cOZeNQB8qktGxNPsj1VXXjYI1XuhAoY?=
 =?us-ascii?Q?8u4+M2eGC4Nm/qFtyvJWiFLBV/ejTm6kOq8wRD4XDJJrTA+bXGbtRxJuoDNh?=
 =?us-ascii?Q?JVyzoOy1c74VkfYHvEpkCBtDEXmxtRyf76IQ+HbpMOOqV3aTxWnyYm0Bhj4i?=
 =?us-ascii?Q?QFDyqNRT/1oaJ7zDt3yJiCl/3Hfv3/0E8mWi9YQWeb/GqGicV/g4qbXL/mGu?=
 =?us-ascii?Q?N8SCvx7Img7OfItgQHd1NWQ2KUh/rYStf8NvvGCX+/Zd7YSekju2yZ1q2f9+?=
 =?us-ascii?Q?YXD37sLS/m83ym3RFljslMD2yO9+2QIrFI+FicfvQi0caKK7fGacbQfApMao?=
 =?us-ascii?Q?l68nppToq6AMgsKwpPJ3NwXmllGXdedZUASMGo0VBFIIj71TMA4pK/29P2X1?=
 =?us-ascii?Q?QxqjMAhqQ9TvyX782Ru8MHCmQ/URFwcTpiIIYOesk+Gf9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7A1JnqcjxftbuKaSYhek/VYe1jPY4daSquok8AYUCgn6edRhfTRUPZPIzAlX?=
 =?us-ascii?Q?H2RHlT+mkfxXr9Qq6qGbSM9R6q4yle20WZ030EwHoTbCL0ThFJFGnL8VoTwY?=
 =?us-ascii?Q?Qs7BX6tLeye8K4TBzf2hOUlmCyyWtWcQQJmQQXctT0Rw1s4w8bOJIwzlDYnl?=
 =?us-ascii?Q?h8K5LYNUA4gdu3kE+91833EOJe778LOFK4qb/9GRYdmqmN3CIF8s+pUe+DLX?=
 =?us-ascii?Q?HM6+3zzSHcP48KZEhdjahetmbr461M+n9tcRvIWfyLyeTl202LSxSqHVWZz7?=
 =?us-ascii?Q?ZT8ZBWbLSrtp+SthVEuf9B3YzrzMKgjG9yQQT5rasC31GBCeLcrkNGpYW6to?=
 =?us-ascii?Q?ZZh30k8pMw+u7BRYnQQ+orVdhFJdyvGydve+Osoi3ANURddxhxDt4fFAadse?=
 =?us-ascii?Q?XXKOXygbaZRNxuQXM09Q9CJV7jX3J3wYbe7GGWtp/GOt9tNPYq3rBSkOLTW9?=
 =?us-ascii?Q?zFyZKmVWss4gppWNrbIKgnK2NcohMxHzYmoKBii/wR5n1D4FZTjV55CV7zCD?=
 =?us-ascii?Q?i9eR6XtcNImAzLC6W5HjzkE9gNHnzh67g+rdmpUBKZEst1l/XSxbSvFwB5LK?=
 =?us-ascii?Q?3jatGfJ1f5s7mWxGzHZGvAYC2uZ5o59nCKfMNK4MWbNvfcaUURof9jxyAH0g?=
 =?us-ascii?Q?OVnzDJ18gS+j2MoE1b0ww5Pe4e5ZCA4phhLcx/3vaMZE1vWKiV2EwmsFUWuy?=
 =?us-ascii?Q?9lDykv+xS4Q952ojUXRVtngdaxDhcaZy/zHJ6ezkSLyRrb2oNG73yE87D7e/?=
 =?us-ascii?Q?gdJQJESRhAf+fk9trBEjI3z6Au3S+x1bq6H+BrHoG3adcq0cnjlaiL31HfXM?=
 =?us-ascii?Q?tboiAM/Am061r0ITO3C4k8//semsYYrGXw/aLvwOCgVmFWnAHmNoyjZcYsX4?=
 =?us-ascii?Q?cEwXRW+65wZ2NLbXZx4+t652HjFbJzOpEIIcJZQDhXPBXyramPhhGLHAangV?=
 =?us-ascii?Q?JIFA13A9CL9kxZtIjPqLXa6M9osG70MQA2BZXt8lpG6E2FGVQenVs103poxZ?=
 =?us-ascii?Q?9w+sPVPPtk4kQcUiAab+oN9jjXls/uswRTPpbdtD4vslTirqzcFOedrPixEB?=
 =?us-ascii?Q?bAzyGw0nljisIwVJkOgQOHZ9Evk0q8Q9Kvk4h61bTP8S8+BZcD2pwIGEMCJs?=
 =?us-ascii?Q?jYGM9iKyTLzOPE3+vp0DpfwNyz70j/VFPwBlQANwu5t532PdPyUSgASUbTiK?=
 =?us-ascii?Q?tcIbkxOp6mgYOi0eHjXzpIfxvsD6GXrbj/fxlu3E3AEVIcEneAHQ7IxnCvKU?=
 =?us-ascii?Q?8PPrBtVKLfeY/6cKgyRlrUiGXCmf1Kwocew/carPT1zJ5Iu211F2H/uTsG9Y?=
 =?us-ascii?Q?CY0AMNaAwVXukqf2JqNBEzbVZVJ+/KW65lkcg+SG+W3UTGLFJu2Qa5a3tcc5?=
 =?us-ascii?Q?qNvAEu7PxCFCUoMU0XmFE76t2D7ICN/zWA2CF1oMMM7/hOYZpYv7qkxP0dPg?=
 =?us-ascii?Q?EI+UU0OLb1sJhL/xV1qNQwhYO4Q48gFapvh9turdeq2bKII5+F0MKz4SB19j?=
 =?us-ascii?Q?YFzmgtQFb4YwK609+OOfectpTl9PCgxOUHFojp4yl8KUAXPOznCiWY19m8It?=
 =?us-ascii?Q?tixdtoaEP+glntjObt21UWLvTn8AtWHulKjirpt7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N6SULP5JBoZ2m0qvqEXQ1PUKcE8vgzLYyiZz4XIH/m1cDVbPiKOhJ+fZ8km5zLloICat8XCJUMqdPrO6wv/AUDxdwbOmhjjXgx1QOR/iNWdUDmQp0uAV5IdLSdpjj65xc9LaiAcjhvu1/zU7N5JeyIafET8DfrKQW9V/4pmWNnJA4FV9BnacfOSAIthSSWA/HnSwY3uw6AKuBLFrwv9wrEAcksOYyS+RHiSjL9db5FP4nLK7Y1JDbZMB/3Azj2Z6Xa8dyeVcwv62c/hGabzX50WgtHzFO2NTcWLycJ7KtEf933W3Z0wG7aHcFJHv805rUfyCEQTe2FTPB6kThQ4OxknuBgW9iJ/9ETGyTX+qyzUEi6n2siylFDPawkw7wOEUVpJnzcOz/hqP6MWai+3fx3jrKtjqNJt1LWs07UcWljuNZsIesBafeVUWPlKH0lt+olyrvPTAwa8xNv8inK/gxe0F2XDXGB4t2+YlxKg9tOM5EOjEcQq9kho2DhJ0WXRTujbRCeB4tmfUiB2Qu35oDQ75eo5o2ICR1SFkxT0CUPKAxouZ+xgS2prxTt8M4poIYS4hFNwASX/+2Ge+0+zkZ3k+qedab1ymnA/cxtwUUR4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 636f4832-79e0-438c-08d5-08dd3679b921
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 22:04:18.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sK8G1Dmc0rIQcCQ7jIB5jNAtGHuT/15heBr91mgYASoq5sqtnbA7u5hGehXf8LSY7p3CpXLzK4cunace/XpWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7764
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501160163
X-Proofpoint-GUID: nSk6AvXNJhq2Iy2RmWr8DeXyAAgeCdkO
X-Proofpoint-ORIG-GUID: nSk6AvXNJhq2Iy2RmWr8DeXyAAgeCdkO

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_proc.c                         | 14 +++++++-------
 test/unittest/lquantize/tst.32bit-bug26268136.sh |  1 -
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
index 0223c5d18..58e8ad147 100644
--- a/libdtrace/dt_prov_proc.c
+++ b/libdtrace/dt_prov_proc.c
@@ -62,7 +62,7 @@ static const char		modname[] = "vmlinux";
  * The dependent probe support should include a priority specification to drive
  * the order in which dependent probes are added to the underlying probe.  This
  * is needed to enforce specific probe firing semantics (e.g. proc:::start must
- * always precede [roc:::lwp-start).
+ * always precede [proc:::lwp-start).
  */
 
 typedef struct probe_arg {
@@ -350,12 +350,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 *	else args[0] = 2;			// CLD_KILLED
 		 */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
+		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, sizeof(int)));
 		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
 		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_probe_read));
-		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_STK_SPILL(0)));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp,  BPF_MOV_IMM(BPF_REG_0, 1));
 		emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_1));
 		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_2, 0x7f));
@@ -406,17 +406,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_STK_SPILL(0)));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 		off = dt_cg_ctf_offsetof("struct signal_struct", "group_exit_code", &sz, 0);
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
-		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_STK_SPILL(0)));
+		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_keep));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 
diff --git a/test/unittest/lquantize/tst.32bit-bug26268136.sh b/test/unittest/lquantize/tst.32bit-bug26268136.sh
index d5f143f58..a360fd17e 100755
--- a/test/unittest/lquantize/tst.32bit-bug26268136.sh
+++ b/test/unittest/lquantize/tst.32bit-bug26268136.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

