Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603EF155A4D
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936894; cv=fail; b=VcSAYozTKeAW6pb4WwDTnJw96nWS469ZWRpF/fI5D47/nxak6uuqV2q+Ydrxl/9U79Z7RjJBaTAu7LMGaX0gci8sh0qnVTFDMXRYF4i3TJqurPILHH4NYxJcRbVFy21NzynECJ05Asd61E6ThXk9f9AWhXUGVxm5LfZ8Dur5WBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936894; c=relaxed/simple;
	bh=vG6NkBAlVdtk8npwC4vXl3pgGcZfyAdWyMJxuUPv9mQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iB99+r5gMABYeY5pSwrfk+MLOInw09jkvYDMgCgzVTGj1QNCauYlUYvfJdvCaKczQQmSxXhA5U+dUJ1yPWw06Ka41bAE/NQ+xg65qfO2IXXL8/LRtAyAHrP5UMzlxA05wKRnlrs+5bP+P0HDEeDd7KiSGOMZDbWmD5tIDxFvaJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gjnemzEw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ae4rLQmO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gjnemzEw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ae4rLQmO"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0tGa014494
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=a82Yk+k4XFBctPfJBF
	zT9/WMDJ2U3CuQlwpJapHq+jE=; b=gjnemzEw15O0ORHYpx5RpqliQYGN49PjQc
	/fcMTpIfen4xD63mXX5AMMk2Zg5mScELH5SBUw8MM2a4XpSoEEBfFu+ywylwWATc
	T6E6d92S6LL+9vtl2GJAHB/zyWbN2/nTyxkTLt1pFMwTy/v3kxPfZ2Wav8HiUcH0
	uPQZVPkB/NRUjlbTFDedW1Pap79CRWzutd472Ly7tWqsvByyLC96W2Xow5c4P440
	KKmQ12vc3IDGdptNDjsDoPYNHUxVrBEOJi4/bFIs/KnueHQ1sw5ZTqTgFkHLm2tH
	Am++R8DfwBtIfxkXa5Or1Z2v9U7Mdj1ITVOXTAgNwMP/OVpIV/kA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t78389uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHVcuf011282
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:29 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rweprwer-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEpZ1Y9smiyTRlyA5165xHmVC3pFqkpz8xoh91pDoR7PGil3GCE5Si+xFLpy5wH+eUbjDjqPN5IWTws+PEjD7Madk07Y0gJpftQSgt5S0+N0a3wu3jUll+wthmASvjGEYZAF1tFyEz+eGisDmKCO9hbZ2g1+wpugAFrWJBaNt5IxybCcsRK10fzOGgBwqI/XpOShdl1Yrwxhoh9IqjA6pG1+NxI/jirbX5VAgjyE/z3a7IxuXC2Uv8C+SPuTV0HBtiqfSlCpQDbRduSKuN93eJt5d247pCX+ivWl/41rTVU4+5oM+PZhaONqfsgz9Ncqp2qQlQMz/KrSLXzt1fkLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a82Yk+k4XFBctPfJBFzT9/WMDJ2U3CuQlwpJapHq+jE=;
 b=LLJHdzqcBIfa37Pjqy2G/fFWI+CFH5P7mlgQ4mWC5xtUN1oYqLjrpZJP5Cut8DqiS1ostNkMxs4X02nRKMh/MLTRaP5GZnLLWd0am+kPERgd4UJwT2QfM7ofEXladj56X24ZrE5981wDDNsozdwfIMhCQMkWBKEfWcIkz67MDwT8Tgh3gi+nbAfyrIQ4Upkbds5VEHEmEbr8SnBeAS5xnqBYtDh6bHLOMdHIXc3m9mjoonKBYX06VZLIGZcgyjHg8KxPQjHOPOSuQnsmhMD7oFKpXbupSANwI8nRfckucB4sPgScYKDNSLD1mnyWvJURt+BympPvOdyR1yve6Wyx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a82Yk+k4XFBctPfJBFzT9/WMDJ2U3CuQlwpJapHq+jE=;
 b=ae4rLQmOfO9qEuv4i8h0ciPCcsvKDpRf6fWK/kvX2gHrRzZLHXKNiJ/MdDNCFPYhnePjt4bhRVR6i9GJnbaP8CRDRx0d/y9UAFQIj9+F8GHYuYa8VgNullusSprgOE1airIfsAEJRXP0o2Y80HeXm6TEbyWVYQbJQcerFx2cbXI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 02/14] Add stack-skip frame count for rawtp provider
Date: Thu, 22 May 2025 14:01:06 -0400
Message-Id: <20250522180118.27343-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:52f::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: b19e5950-0d71-4ace-85e9-08dd995aab3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N1mVfh+KjWv1vJJzOzPJS2bOJf4QwE8clRynUNnaKxfRYGpmqeS9Cfs7JYtM?=
 =?us-ascii?Q?jjo46ryvhM6lcbP4lT3QCEGBajzW36k3ddX8XoluoEbQnFHCzHmxqFK8TICv?=
 =?us-ascii?Q?5uGrcvGO2ztfpd8gIdOxijM/gPGoZbwIcZI4TaoU59p7lnmLbCxL3Qz2bNuq?=
 =?us-ascii?Q?9XcGc0kkefT76aX9Hr9W8L3OcFdUq/Ou+xFRswSrTdcLG33jHr8qqqPYd+a7?=
 =?us-ascii?Q?cxmiIAbSlRF8Mnrh8jcG8FnD+1GV9eDwBkBu5Gycj3vjB7l+wYp2/IR7eDcw?=
 =?us-ascii?Q?xRSA+yjcV1iW90pLOYrFZ7l7/o1Hca8g9vfje6NG2dpdZp41aYFlxno0Kqps?=
 =?us-ascii?Q?oNnHXrqIGQZvHDlj5VeH63kBLmCxiAAn/KCvRjOu9r9CBUd4syZ9xlWvchBf?=
 =?us-ascii?Q?n8qVCRPSgkXCOBVBFImTwBKGyepbCL9/ldCF5gecDH3jhxNIsqllJ401HrY2?=
 =?us-ascii?Q?n8cFb21ow9a262uTEO72wLAljoqt9H/VKzoL3oKG789Vbmw/LdXdGHR4AQ9b?=
 =?us-ascii?Q?Y8smYabe7cbLVle4Zpe++gNotmBZyPVWRktzVT4j882AxeJ8DWDW0mxYhgaa?=
 =?us-ascii?Q?YTHQmeARfmPmYBgppA82QLbDpx+eyhODwtv0Fo3Ebu/6kFN5RdlSTo6Q/HZv?=
 =?us-ascii?Q?5e3WW8WI0kvs2u4kNW29/V1ce1F3MjSqaIdNPXx66j2z/8PCfyMeusg3RWay?=
 =?us-ascii?Q?8TCRr1RlW0AjXB+pYCdPhiQXroYnIXhSbEXxV89PbMs3oygC0S9TV6O/kv/n?=
 =?us-ascii?Q?kMMy+F2U+YO1LT5tUcf0oKAPUlBEY9lOJfFBTLtlBcrmg4meraFUiYM7EpbJ?=
 =?us-ascii?Q?YNqq597y+C1QdiK/MktBVqGj7yE3t0ZHJCzV2PQXoZw3Jcdi0scDkrY4q9ki?=
 =?us-ascii?Q?h8PmOdpAet9yMMjJkqjoe2hzVDZRNWsC7EwudKRuZJlOYdZ/G/Cqjdy9KSHB?=
 =?us-ascii?Q?uVd95vIpHEY2eyuPLTMgLhJVEVq2JYVldeqahWLcxmkWsCBRxmxd69qXojXP?=
 =?us-ascii?Q?OQs6TkuJNnfRFvp2e4rAtbYvoE/F3hXqyRvtVwwN0PRj9FM6mAG4Dm5f0aTi?=
 =?us-ascii?Q?bg/kAV0s8o+Kj2+IsBZsASJN2ZC6QzkumXqKpux/EbuDs8saDAf83OiCDLSP?=
 =?us-ascii?Q?SY5WZh14lne0U8sC6WGRL3x5ssFY5Ub7LXoPFS+eeSvqXlZeqQI0VXfaJ/xU?=
 =?us-ascii?Q?KMZfZiQNkak8CHJ1Zk4JUq6NqoaDLRb3ZaC5h/lBR9pVNkuq1FvIRxYUNpD5?=
 =?us-ascii?Q?CNrQjWWpRhkjEO8k4AawHd8VDLeQsvYG13oqZrsigP/Wwblgo4T66xOm9Hb8?=
 =?us-ascii?Q?B0gRPAARD60jB1+QDaCRLnDSD7C00SwIU4nAAuQ73k6nP3s5H1WIRWNasHEc?=
 =?us-ascii?Q?Az3U8b8P+7+HpzizHb9MLHHWyND6iwukNHHCdw4ihAMeaIkCIg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sleevTloNWUwPPxR45gKynSCIXanzm0TkyAKKU86qv32FyjgnOasZD6cLn6h?=
 =?us-ascii?Q?hyN+K+JK9l2kED/2D9J3nF8ZcM7T+kQVga2rrxRpApyNiNuHeFiqem5wyIrD?=
 =?us-ascii?Q?epENSxSDiY6tgipbIIzCvFJV6+Lle1a2bYHjBdvqiQC0Wzq5cgKIKJltksVA?=
 =?us-ascii?Q?da2J6xPQlu84Z2awFYbTCbvJscsW6zvY7lWt9O5UDZ2Pifc0XkJe0ef075HM?=
 =?us-ascii?Q?iiX6kVdJXagzCnFAtUJ86qyVju4m1mqCgG76piHtj5czvl5xuGYKSXtmJ8px?=
 =?us-ascii?Q?Ph1S/AX2+V9/sGJDML1EPsSBRl5QvSzT9s/qehIRgHAF9sRHi1EqyuZKuTSv?=
 =?us-ascii?Q?kMGRu6s61KjJpFwMjTnOJUIiACYGp4Iero3u9FOAQ+Mmdzz7XlzC+mP8UAMk?=
 =?us-ascii?Q?EFN0c2rc5IXPA/YknOtEddGy6IYQZCMwnEgZ8vQ7pyw9vqM7UYgi5UkpJ2df?=
 =?us-ascii?Q?nLXGxXV2uQt0avCwsI4Pmp61NQT9Bk/HyyGxFOk16WxGh0JWZG8QgGzXVFpP?=
 =?us-ascii?Q?J88zBb8ukKpVypQSUqD/gqr7L3+jHmScgWOt/FCcualXn2RcWkk3ZbFWK+JN?=
 =?us-ascii?Q?opIWEAL6OqZ7uZaLm7WFDBzzG6nJD621gjGqsJKvFEC5f2yCuHGXS4wLlPzA?=
 =?us-ascii?Q?iX+QzE619UCoIKIJCWjjOHEaJoiKCiTXWVe4tLKrY7yIw9WYbFf7gAAn3CoW?=
 =?us-ascii?Q?9Bz+tBlyQlnC6D2OC39Z7Y6AqNwcL/VaK7yoRcsbmh6p5OFdLBlgoA/oh0QR?=
 =?us-ascii?Q?DxRUAcarC7p52m620qs2Qp+CXk9EMrtY+e0vQJHMqpyxKBjA07i6swMjX4Mr?=
 =?us-ascii?Q?PDEtuE4lbOiIbYoI/vCIVIlbAfkien4BtZC1fR+k+jt8MkbN9ErpnKWP89iL?=
 =?us-ascii?Q?wWMh2Qc9jGI+csAkplFgXPsYCcX0V0TIR/15aJ3XxOEjfdyadW6PNihhofw7?=
 =?us-ascii?Q?Aoa/YXMe4EdUiHEUiHKe4Zvd/JW//OSF/YgDAKymvLY2TDSVOhtd5MBTS856?=
 =?us-ascii?Q?ItNCSi//51EcarzD2yVuRCWcj2WMVfGBL5RB+upAcrAXhmg6uZBqZ1a1Aehd?=
 =?us-ascii?Q?MHbP34lFFDO8nyXt8r9T85v4JTCTVAl2zIxWfHE+aerh4kRTJsfBvkr8MsKB?=
 =?us-ascii?Q?ClrT9WMsY1btkdp03LVGGHA84HCTLQdwxMpKvgz0N5KoE40OQOU9ufMXU5mq?=
 =?us-ascii?Q?oYo27KuRsleIK0x2GKkXYO5Q0Gma/rBe0CYbDmCYEFzIqxCRs5AT8zGZ1mv9?=
 =?us-ascii?Q?PJO8RtzqemPXiCVzUajm+JUGxJK0r40AmhJqaiySkGNdzexLd2qkLSXO9926?=
 =?us-ascii?Q?0NMqaCV+h4tjt9/KI0rxqQHzeqGNYL58rd2KSYmBcSNHsvTrDwo6CV5R0qjT?=
 =?us-ascii?Q?1TyagvlppRRzyFZuXEMLknVJF/ZOhkKInigY1dpyMN+mnuAixSDIz1mKBmLl?=
 =?us-ascii?Q?eWIvAdHj3oQf+JglQUWvtQyyu7D7NRRBFaM93ARFif/f5HtLKKnalypuEpDJ?=
 =?us-ascii?Q?a2IKzIb8f0VYhl1wyakg5slqsN/PP7lJJ2Lz/dMWhizgCeZCmce4rCXHjIth?=
 =?us-ascii?Q?Yo2Irzf018A3l2Y25rqfzbVNax3I/DjfIJeh+O0R?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bzUEWQw0xefSoSdAV3T9+joDPM4Z82Pkf0IZ2kIQF/MJM8iEKN2X0DsCvQNihc1nngtRxYnN2ti1lM9+wb11FFFe1feIrv/Sx6dc3eu/h0dANmFI5nJXTDl0DlMVRJGBHblcVxxQug7aWvygx/BBgurMwGd+7SqoLoBt2QD2L6AGfbOsn/lny399REN7n3V1uhN6CayAeP6ftGWqLHHD/QlFMl5UR8iPvURGQAiBmxA4f8RuPdTEUkuJJCU3AkgiK9np9lGtiwlsSbYNRNtPr9Pltqkym/RRa3UEYJEnWI0EKt514KdfLvERbe33PG0sM/MJXMcdX4zoalX4HoyyNehqsoZu13bxmE9knfInisLzgh1XeKwL19Icl2vx1KvXAqiSI9n6ropv0/7kdn/h9yUucywR2Qh+DlPoMUS9/hFI6REuX7BGRqpX6ULZzk1/c1eCPOw2BTMCLanIVy0yakyxkoNLenYf02xsamLhNWOliDJmDQESkIw5iTKpt8h5/CfoUTgmnYZBtWwoAw/cydyLcXGeTUyZh86l2Chy6BZJXwIl4csNPypo+iZ7eCar8FvYQmBkJ1GcIFGR6bYhPkGe5gw2dSTEjt+aqrS2Lxk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19e5950-0d71-4ace-85e9-08dd995aab3e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:25.7153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNQrHyelr22ksKK525FFF7Prev4C4s2JF2WMgDBtCa7LzhrUZay1qtIcItSfEg+C1PVwg9dzmtJIgoTzOflr6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MSBTYWx0ZWRfX+7m9w0dVR59J NqWsv6t9JGf7Zfwe37GwJuJ00b41lCmHSEEdB7Cw3XeiVm1bIfZj+c37GNdZynH/1n3l72VGOw9 4l4H6QGES0AbhoHj0MgO7Af1fGC1cL3vp9GHrSyr4/NDg+dXRPRTvemezQg37kh0UuJXfaurP3s
 QJxqEcwb9rrOsSbjtdvJUHLrTZaRhdC8XZPx94WmMwo3wuyLsAqERUgttXMBSMEztHMSQdMbHQH rzYZwt7MKpadQprYTcLd5B+z4DvdXatzNddo+ejdo9JdPgil2gmzPl4jC4L64UpnGMAImNQXBk6 I2ID3ETvui5nm021Qe1Sa8bI+PO6UNcMXjzpL69QR+mebFg3oukKj9RUyYG3u83lZHrQEBbCyps
 miMUdYeik81IZvdAi5RFe70v6KheQGci0G5OXZ49YsZGRhNEaYVVE3yg8q+rAesTrul4j9kN
X-Proofpoint-ORIG-GUID: HQ7AYEHhigV5KYQL1D-4XrYiozmCig8W
X-Proofpoint-GUID: HQ7AYEHhigV5KYQL1D-4XrYiozmCig8W
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f667b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=26Sn6DwbkJ2VNwVrCaUA:9 cc=ntf awl=host:14714

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_rawtp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index f1d3b6bc4..a36bb51f4 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -296,6 +296,7 @@ use_alt:
 dt_provimpl_t	dt_rawtp = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_RAW_TRACEPOINT,
+	.stack_skip	= 4,
 	.populate	= &populate,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
-- 
2.43.5

