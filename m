Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235821C8616
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752609057; cv=fail; b=LPj3/4V0+PJ9GsBl3tgZ0goPQyBu+grb5lon1S560Su7pAhDHiPSSNgUP9IOStgUTp+RZ/CEylyKlcXLmWuYb18iqhGwhUf4NbHt2fEwjCJj6tczW3MRRLJIhlLu1/Xq6pfHr/wVP1TaY5VfkPLJmoIjySlRohMbf7GIyQOAwJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752609057; c=relaxed/simple;
	bh=0SPCHkck+T6r2ekVIY0plbHPV3F5RbbSXYE1AyUi5Nw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=HUK3Nb06kxPYBQwXMK30k970YzVFCtIFdc3S4MPFaT5foHlU6ncAwLxiQtIGzE/g8eg+7hrxNb8KBMBTv5kDV//YVuBwAwVqBsRPNWY74e8A9w8GjlKSbhGy+OwoYjv+ZHcX64MKJS99z09kOMkfYV0DQEnntGCuzkmZw5gTR18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KM2rDU7n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=itMJi1aP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KM2rDU7n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="itMJi1aP"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZDtN017571
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=cJ+0dFYATS4qmKhFl1t5+ERwnv57l7v1kgLIJpwaHP0=; b=
	KM2rDU7nOy8JqfXL1buZvxSy9addmG3ZrLeQS3sabEQ3eOi1Ymp6J1GwERsXbmEy
	Iu398HmOsyTdJ6/co/m6H/mN7VfsXgACGoitmskE9XerXej2PnDR6D4/aCFNaFeJ
	glPJwGEXZb7sEEWxNOVSf0/s70/eRxPT1KFuC0FerAlXZxStO+BkKBF8S8uIWOsi
	tPsaXcqpRSf5zePg8tteGA3T5VbJmxPFHWsxekuHYTzTqqExiVWCa48p84luRtaf
	VazjAI7DXkpnZgvMn4f0bBPcdO2HKTIrUOaBaGP/VZl+pkUDBXtNTqMqQydtFk+K
	DIzHUZZJwQW1IYOBrw8HMA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk66y8ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FIYjmo023714
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:53 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5aer3f-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdM4GdIfHfPDnEIRZk8mHXVuL+t0vAWEkeVfNUPzRNpBJhwBR6LZFUlLK8gdc6sA6nvE5TiiamQOIH8uhfKBhi2XSBOZ38HyCyzd/3n6vCnMVuNAiv3n0kv3lRJ2QDfkDqCZOU66x+mAA05onThgyPTZD0Xk+bUFARvCrlnmaHbktMwwt3bKSq2lkqbxZelJLq56CWV2S6M+sBtSiLObT+OkM3mcsX8niNakKxFZ2nnFF3YzV3vQNJSTuSMG9NQYxRxBrmHz3oj9ZgxNSx2G1cOUZfHLnl5VGXiwZ/55XAkOKKYK76quRX/s5k/HuHWLPODb5MAwnJn6o4uTmLxKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ+0dFYATS4qmKhFl1t5+ERwnv57l7v1kgLIJpwaHP0=;
 b=SvtrWV3yC1iU+liR+j7pLSWk2CqliTv03rPIqya8zP7/yLxx7YMbcvJO5Mdc/hDYCnlgG+4TpS8QAnsPyulk/3guUnZJdFI6FN87yAu0Mnsk96Ihw+q4zqJ5LHZU56/sVLzOrqHPJquWhJX+FVPMkIlymNj9GJG0yJeIgFwfPozt+cqAYAEhjtOix6kH2BEYDU8ciOKzSOIa7Wrxbfu6WafB48ImPr1wyKHbooTK+4C1F/SCkbT2p2Af+fdFG6/AT9IL4X7aSnzJSocniFDARPB1aRMWdxiL3uRjwN99ZV/hnHsy1sUrxSMcobYkZfOcPSqbUyGn5/G+AjP67/N+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ+0dFYATS4qmKhFl1t5+ERwnv57l7v1kgLIJpwaHP0=;
 b=itMJi1aPGH/JKQr7xT/dAiKwFDb/APlC9MLZkbB6K4r5Y1ywbwGPpOZTPhMSIvy88JSY9zAyoa3UNytsP+94VbF7pivBN7yVvBcDUtk1PC4F7kbpev5vs5dvnhLBzTxXE78zDqSsJXrlJD24t6LjJnXLTujn4Bb4Dp4kNSnqflg=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 19:50:51 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 19:50:50 +0000
Date: Tue, 15 Jul 2025 15:50:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] cg: validate tstring alloc/free
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567277E28590C437C8E1955FC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BY5PR10MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d00f0e-2b99-45e6-9887-08ddc3d8e6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rpcRJjeHPg8e0TEmaaNkLaNrmxGJaI5hz+bB+YN/RJsM7NpggoBEawKbPJa/?=
 =?us-ascii?Q?JqLfr/IWJvmwLfvLtV7af+/nZFEkJ4sAGRrWCkBPb4fkDMTya71ylk9U8+fs?=
 =?us-ascii?Q?SGQORu6UthpeOSqDYWmNxCNDWJCS4J6a5YXwWsVvgXiW+XSGO5KE4Aop1i8Q?=
 =?us-ascii?Q?ll2gcU3QjrGCqBFRzZeEI+nGbmhmsIK7LrVQgbK1vV5k2rEbzoWWol8RS7/G?=
 =?us-ascii?Q?L8Yl5+N+vPxfFf1zYs8IZboCLE5Fwyulft+jLn8Y/B8HewLp4BRTZq+hbTV5?=
 =?us-ascii?Q?TgpHVI9lgEjgA2rHx3EnrqQDuauvcnh2wcYLKbkdiPuDoqnggRq9WwWw9fs5?=
 =?us-ascii?Q?qIawitIc+VKMqHQgBynzzcDB2fElhmPU/o+EY1VId5Ve8KV7eloG+MiwBYjv?=
 =?us-ascii?Q?GfTQICVFX2xOH+0sdML2MvIWV7VU4oHvdRxvxjoMf/MqGMQHxVGzMM9hI2Dh?=
 =?us-ascii?Q?bFnvOzZGKbhgsYFwpZ0x1RxraXNF/hgx8ABi7OeNmZtfYZ5Qg2TYsiD0qhkB?=
 =?us-ascii?Q?IIIx/0g2KHo3mkzptUzh+Kj/8/MfIPVDyBHQ/TAOUZutzOjyxCGQtNCD1gx5?=
 =?us-ascii?Q?x9Ps2F4Vl2E6MVZrCHIg90X5O1RtfRIr3Zg0vzGZOgu69/8j9EH3ARnwBdZA?=
 =?us-ascii?Q?gVuuND+WRJH7htGruK5pVucCkPFvbXnvmG9L3STzWodxuzx/WyBzSfHw2nhN?=
 =?us-ascii?Q?ZFXEZABl1D9u6Ft7zRQ+KcluMHU4NAJut0v+tfMz8oU3UN4ieMdO0RKTrC4F?=
 =?us-ascii?Q?rwEq5LvGQjpgRVNxo/buVk7wEYHQbgi6cTXuqLJSEOgfTZRXwJimCSwf+vRe?=
 =?us-ascii?Q?iLc7SFkiZrRhLtPj3JKlQ+Dn1oh2H60qfPnIVtPfEc89yxRhyyeoblktOVlN?=
 =?us-ascii?Q?zJ2vLeT0/M8BhaE7Xi5IqSJSpNn5npMkUgOEa8bs0odLCY9hoRvLTuWQf9zN?=
 =?us-ascii?Q?rMyvSQ9SdzQwgRX54XJ97W+Wh0P3vpfVzTAMy36S0d9TJOpNLgJELVBokZ5s?=
 =?us-ascii?Q?3MazTnP04O5goXuRuLlTQW5dvjFIVYmPgydV7gq8XJAPT0KXoow8FjQQzjEm?=
 =?us-ascii?Q?ml0J68STVPivyaTxOkZBKU5nulY7AcZt7b1K/WEB2arZgyTfebqAN1QGfqxl?=
 =?us-ascii?Q?zFS00DYuXeKw3VFyo5qrsSQegYxOCJd0QAWJ2YYUnGx0PLfDtep4HVwiOaEy?=
 =?us-ascii?Q?L5y2h6DB9Zc6Cai4pMZ9MU4OAp/aTnphW7x620bs5jrH0FHWv2qda2g69uYN?=
 =?us-ascii?Q?BBAUPd7BjO+q25yYgCdso2k5MNgkNJVPmDSlagx1vdC5ITmkSjTVnjwqbNx2?=
 =?us-ascii?Q?73o5rSUSCAIORWwSV9WWahtlq+4CjhUXYm9zqJssVczzSbkEUDHVzoCdLYy+?=
 =?us-ascii?Q?pYgBbApyhYMWJvm02/4hop6HTHt3xzVbho6m7Qv+Cyfo5Rthhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yTJnHeHRq4qsiI7keq8JzxVCi4dHpENmGCSvkgMioMknLXRHhojUmCq/G7xs?=
 =?us-ascii?Q?nQIfgJvr0sH1W+s+0WZU087rHh0Bhj4oU7GEd2aAqrIosg8Fo04jXqgQyliO?=
 =?us-ascii?Q?tKFtJzabKScmhlpwP33MhMg9D51yEI6RXDht+3Ow4vD74e309F9AIxjMlMM+?=
 =?us-ascii?Q?LOGE9T2nXjMVElt5pdtYxs0HuzoStYf3J0CzvUVyPEp3MqrDdoQZgZQ4Gy7D?=
 =?us-ascii?Q?0W5aZuYj7F3YQ7X3WtKfqN33jnqnBc6ZLCXeMwChYXw9NldpA5n7KzV7NvJ9?=
 =?us-ascii?Q?MuHD4QWCtCIgXaTdbF4Ser5kMnDZOlIHuLQ9DvI51x3l8k3lE4RtdSHZbzIx?=
 =?us-ascii?Q?2o1kUKs29A26nlL0mpmzIMJRQj7bpKFZPCPdZ4qqWs5KdFt95KMCpZQRGyHJ?=
 =?us-ascii?Q?UUnl6OzVxVaZkX7E8kQvMsAnlCB1We+q2+w6Wud9ZmIjpVK6wDWZJ/xJhizL?=
 =?us-ascii?Q?FphZYYelkKZQpcZKZliH1yLYzVFL8paP7XRHQnovudmf1PxKfaJj6RZZZkRx?=
 =?us-ascii?Q?bhqyK8EhFJ7WeyTMouIGD9+vocNWtcH43Z14A0z38gEsJ0uYWJaWFBaiNmf1?=
 =?us-ascii?Q?8a8AK5XniIPBpisJ78nSnca+TMtir96H5RA9fHIszP6wzDi/2V1YHrfH8sQ1?=
 =?us-ascii?Q?Cfcz6knuBbZuwQVjDzD8ZtwPiPMW8MdnF4l3ddzJpyy+RcZrZIoD5relTybx?=
 =?us-ascii?Q?0cW4wk5UGdBxQDQeper6tvqXUbsHr3hw3pH1DqaqC6mugHpgnFNCMbhfXziq?=
 =?us-ascii?Q?SHHetr1vAFvyKRUUFX+cD6OroqwQElwiwEUljKSLMy9mxMJq7K4Oep9EXHUb?=
 =?us-ascii?Q?IwT7b+gZuKt+sHTMlcrqY7YjLiZADQ60P3Mv2eRtoyhUvGVXCc5E76woHO6z?=
 =?us-ascii?Q?srt00MHY9Shv30tRO5bMYDn5HTPBXVdGyLUcAYoxFRQBEgtQjEjnvLQ3a95o?=
 =?us-ascii?Q?NWFia1wDsGEjrBmbi6RbH6pOQHShHI0nNzGL++etHt6hkInU03PKK9KHl/dP?=
 =?us-ascii?Q?CKB4dzM2iOT64onoSUidkrocBX1/ReD7AXfhri3IJuycPF8AvI04YJx9P9Y1?=
 =?us-ascii?Q?1//c7W64FZKLRrWVah6Fv50Qh+VxPo12A/r2PVfASkaHoLVbJAGl2FxNBus4?=
 =?us-ascii?Q?LuoIGxavilotrvq+chihYeGqTcoGcQcvAY2fOktNWwnPd6FYSXzG5rN+GoGI?=
 =?us-ascii?Q?Y1V+4gT3dK0tr/COrI5MzRrrJxXmUpTkOngYSw/4HZJgxm44oTpo5rXBfQw+?=
 =?us-ascii?Q?sZpw71/3VZPIy+F/5uQ1B0msbi9/1L/jACVuMPOZp0ht4sb/WFZ+lUCqAKoo?=
 =?us-ascii?Q?ee711qJJAvFj5ZALAXa2v6F5JSWh6QZxNSB2zLVXRTTOaen41EaFHcbddCf7?=
 =?us-ascii?Q?9iPjxSBDzYMFEVqAY9pPXt1T6qr5PCMhDp+xrxvSfIkYyo9pzkq08/+4YxF9?=
 =?us-ascii?Q?FpEh63HmkrFEQyy/qZlJ37fHuTli6rIz8m4xvZCp4d6Rf4/mw68UoTIidrYk?=
 =?us-ascii?Q?DRbByVgyzOV7DGwVrc1Z5zA1SsiehaKvwpJjA72BwhKorUORFvXFOCAte0QV?=
 =?us-ascii?Q?O7OmEAGSmudQYRoWhN6aeSSAB0aw98OFk9B7Fi0kIXaiZWbHkUO/QfMuDhHc?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wn2l+zb8e9F/tMwrcLkEKbtnwUCgbhNIDQrcEpoviyFsjmi6SY1AS7v4VT6l60Zbydkm8+C6b4fSGWhYV7ySqYkwxvXhOvwfZEQ85ZWNhi2wxrzONTmp3toon0UGI9ZHUu9Gp4giZP01bi1zm2KvZDPAnRiK8t1vSm9v19Bym3ibB3HIZ6OiFJgu3p1vD4I0UZOGaaCqHNu1dMOb8MFQFFfR/V6BOjCsStl3PSeOnqPWuqVlZejrGijn1xkEGqAqHfRVrKZvEFaLJ7x+AdfzyZcR/luBJZ7H3HtUCfk3gxqlshR9s9xcDntQVtCucmA1gxJvY2yOlyw7EckHXJlpi7XEi4AZZ+9LDkKp8kSE/xqMZVkRsxpkU2TbOMTDv6UFkgDJUciqW6IhOCphDgQYqTE6aQWIDj8lahbX/aobPqXp45nNGH7P2YgVbq154XIi0zS5MxHo4MjV6r7D1sDCrJeBk+KZ3X6PEAAfBTDQ66Nsn4GNmvfRLCNvjbDPjjRdwFAwfUF/DqIND/A5960aGNqGSVN6l018ITVILzn6BlSx8tuC6k9cDX7B/IXql9cfX8TjyHU80a87MOub+YZ5N0UPY2b5XZX/DJJ2UAUePVY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d00f0e-2b99-45e6-9887-08ddc3d8e6c7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:50:50.9273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRwvEFyo/hzNLupopcYJgAjBPVHVBpAsJzOoTpdVsKrXgZ3vPk/JpUkVu5RIX+O9m2DqcuSr9CzEh+lzA6y+0TssjhlYKFP5dOOL8XJ95LY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150183
X-Proofpoint-ORIG-GUID: j0SrIt0fYIMvjfrSbO1SMBRT_e_XHuQ3
X-Authority-Analysis: v=2.4 cv=AZGxH2XG c=1 sm=1 tr=0 ts=6876b11e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NsK-lg0wOEpZ29WZ8FMA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE4MiBTYWx0ZWRfX7qLPzjRYmrYG lczuX4MvUEDGJssmw8QgHczt0PSiT35B5IR7lijLrgwZX9zwVZUXwoXktnEJeKdHMyGQ57o22+b rCSpy4OJNP1r1iowilbh1v2owV7MaW3Jr5Fb14tO+zGkzqG7c4uLgTbfxj3BXRZVJcCft4wEG+c
 hPzxlyq+IgWbk7XjkDPsJzffvUuHn3cXawNu/mCy1UfthASuH5vIgDknRWMNYy4PbVXkhx6y5CQ 44mPV5PbKGGn266XFUBJbqPbO6v8gKc3kpC7df+VQmzEqxp1S4QGaHHvxCemjcDuhJtLQx0jOyu tfjnpz1A1ysD7NKqU2i/abN2fpVkhMIMZOjZCxE3kRzsyqHC9SX/fi1xgD4Nf8xwqfh9eWme6R/
 hAQQybDsWoekKrJEgol0Rg833EFQD8v339+JCR5Ugb7TdtBmdoAzus++qwnnSbk42dABF2/N
X-Proofpoint-GUID: j0SrIt0fYIMvjfrSbO1SMBRT_e_XHuQ3

Rather than undiscriminantly resetting tstring allocations at the
beginning of a compilation, actually verify that alloc/free of
tstrings is done correctly, i.e. that none are left allocated after
compilation is done.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index bd0763d6..6c7ad076 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1432,11 +1432,12 @@ dt_cg_tstring_reset(dtrace_hdl_t *dtp)
 		ts = dtp->dt_tstrings;
 		for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
 			ts->offset = i * size;
+	} else {
+		/* Ensure that all allocated tstrings were freed correctly. */
+		ts = dtp->dt_tstrings;
+		for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
+			assert(ts->in_use == 0);
 	}
-
-	ts = dtp->dt_tstrings;
-	for (i = 0; i < DT_TSTRING_SLOTS; i++, ts++)
-		ts->in_use = 0;
 }
 
 /*
-- 
2.45.2

