Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E8C2D1913
	for <dtrace@lists.linux.dev>; Wed, 18 Mar 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773870515; cv=fail; b=KrBjp7n2a7yYRAFbeiKUQSDDmmkZPLBF2Euxr6SmCaL0xaO5+9LooIBrcJYQWHHRu379zXQyrrVWN6EBhrXcg3cDlcato6pcfqHHJ9VE768fR8G1xNepeTPkyHxFflIep+8YfIOnk/OxrDxvniqQt4vV4u8lrTlRaQ/Izez99H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773870515; c=relaxed/simple;
	bh=TUilayuqdr2yaxPPjSIcWzSn/OtMVkB2RdoPCgh2700=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YIDAvAA2qdxdVgooEzsd8NUbiSHytykT6pHrbdvagiDqqOVKu4uuQL5qUboJgLIrJp/AjAmVOPOYn2HaRRwWiFO91msWvbRovq4Dwdo+5rwLJgcj/VhFMsFfsGzxzfVr+k+mRE+ovwRc4M2PttBJKDLXs5ymqkYb5tLfgbSg5kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=httLjxXB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=w//A89Fe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="httLjxXB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="w//A89Fe"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFtXSw2706446
	for <dtrace@lists.linux.dev>; Wed, 18 Mar 2026 21:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=nKyiHn/UP6zrACEUSmgEiq7WYR5tex7IwSfTLlSS/54=; b=
	httLjxXBZzVAZtNTM6iSzDZ4/Dd8COBOzW2tPSKV02bwNq1nQjIdxXoR3X7n93OT
	3+rgOlVUArW0LKC0X07f9f3y5u1cr2LRQENSCeJkA8qmKjip+VuOv/tbhp/hjRXk
	4TTdisGytrgNLyXt82F8KJYWGBcxFuSUMK0JIftoU5xFppWgspVbxdCNgxL8b0zf
	2RU6IrpjHSKpQPk9KLSgYbn5zEk6ZxyESTBQHQBkDoGwgCjOAQlxKORyDqFRZf0w
	0Ro0IlPQnpTUYjFJxylNEN1cy2SgyJacrtEbyjMxDVryJ2OCYVaZbyOEYHXtQltQ
	Y7CNgXkiIwTC7CeKdaImAQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvxf46y0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Mar 2026 21:48:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62ILmMfc002749
	for <dtrace@lists.linux.dev>; Wed, 18 Mar 2026 21:48:32 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010012.outbound.protection.outlook.com [40.93.198.12])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4pfh52-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 18 Mar 2026 21:48:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiqYRJuZUwwUTaeUhIzEwNzcbASFICXIylfIllkz5CF01SYWc46DkTHXiysMKYAgTFkgKqHJCM5YI30vPauvrKsqK/jGoNqWRA8SGPJa032jC5DeSDlvygI9JEmmn64bE4sMbaW+Xi0D35sGUKxNziAjGwwB8V9Gy0xZITX4tuuyYNrJ6ridSx0oxZ1gfUIqf9ZHzC/LJkjZdCni3Z24vyOSFi0ldUj7d5wADFlN/1R/vr113LPbQ+S8vxaIA0DvVLy6Xzn2ux1hrjeZckPvvQRgLLrU+BEyVfEY7uYxgMSnVaDcnvJfneEKS1SBHzgujm9D+6bLcYJ9jOC8i3Vomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKyiHn/UP6zrACEUSmgEiq7WYR5tex7IwSfTLlSS/54=;
 b=Q/C7tNI8Rkq6YL0RwAEv8+PNtQEofvKAaXsCVTjsZYr4NNOEq55ACI7k3BpD+mIA2uAAH3USEZsfT2dBARcrkjG3n0ffE4Tu+2z/dc/e0sUxgDg/sdAD2f3nxcN62hUTx+tL2rp2/oln2iZiqkzrQzVQ2uvSnaKFqMQ/Secyz3FhMdTB0mqTC2Z/1+PdOWQtAzyL9mXhfCrfvEX2aRYuMyrGt4VchkQ7EKM6eaeMcGpV8U2QrFPvsOFNF4GR41g2dngxXQ82JScOWG0yhldn6bffAql2B7v8wM8pB6nNsarIIMTthBgJJdUyYYN6Fxj8FDhIl/NQw/OBbR4d1pBiEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKyiHn/UP6zrACEUSmgEiq7WYR5tex7IwSfTLlSS/54=;
 b=w//A89FewdMmTOuqBkR9L42hdhfBAXnwNQ/gJnkt9zsi9+5sC+wVG7i7smhf6MR4ZqEm39YUZsHSmiVuibmyjxwLEtJ8bxde4Z8u2ql5uOSP84gUJuSt79GrqMNPvxE2Lfa4HWy6Ryufe824Qn8bffJgx2T7JtZDDjp8RjyCFS4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5792.namprd10.prod.outlook.com (2603:10b6:303:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 21:48:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 21:48:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] test: Skip tst.aggmod_full2.sh
Date: Wed, 18 Mar 2026 17:48:25 -0400
Message-Id: <20260318214826.6296-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:510:33d::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO6PR10MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc0f778-7aab-4ffc-f291-08de8538171c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ykqGUN8g1P2mHhiR7aJigC5Fhi48eqUqKvyUgffmQoLCM19YH28aZX8WA3/GuBDVjYpk1RITtz+yvh9CaofvLUwEiSoURi1czKmhx2cSgoeyZWWkelvtl26AEVpgibDxJVDV3FpIZpR3OjoWLCm6o04Q6xC/m1mcFwBqH+GDlJGgjXZ5z06HTsf3I6e3+FUo1K28Wwfq9LfsU4gTKpGjVBCUdrJ/ypCzi42lAYgGhls9GZ1tzWbqurXiqKijD/gJ2ZJUUHtis9blQFxJKyeG2xaQgPLXdABzDh6zNkym9waZospbTasq82SxZ2q3E1x60pSz/P9C4Ae8VVifiklqgLQtjBysg+DRILCDOkmoXCez4S/xJXp5fpCEYeDFZv46quUALEmc6Gm87KCfV9jd/C+pXzjtjGGuRp9mklxh2cfDpSYV/RQ2avZdvMzPvavhbothio0eCRx1LPR/Tl/PVYRgEWjw0X6emSNd1+C6LSuLOCoc1hHBvNrd3Aj0ryAdpy1oYwpa6zAwpmJMQTUvSFEi9ty7l9BkxecDVxAvdI7yF+FDvDAU3RiNRGPsdugG3w5sNIrwDNXjRR747npwr0W3tKQbmBSEBZDt6tFuacAu5387rm2j8l9wTyVfpHLyRWfftBaSRCoYs10POTHQ/xskTK4SsSGjXqmozdA59ok3IwAChnFxjqfvqldwJwlCkWOdaqnB4AZ75Au3+al7/9ustWCTiuzyevEDvmqjG9uUaBVdQIrjfqq9Jolm0Ri8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S/7qX264MU3v/PNsepmBNQeFUv6GpyRKXKZXNt7tcGaxokn/LyXzt4P9uvxz?=
 =?us-ascii?Q?HcfKWZ7TxFQYc7zSguovxLFz3mx7rnkhmaSuHgqIBkJEKq6YA/LsqO/S4S4Q?=
 =?us-ascii?Q?n8wArTDTVXELX21n/iY5SRFbZS/lP66swIPDLB4yAZ7jXO1fqsHoPGpdKX81?=
 =?us-ascii?Q?H2AWwQgZnAujiKNXaPUHzmnuNdk/vrRjFPD3tV5jg/ZM+teaekjjuMq7j+OM?=
 =?us-ascii?Q?qWuVK7RqgcTKo/I4ujVmWQi/NJE2+O1349zif9rFJ8YPN/P9Uqryt4ojESDO?=
 =?us-ascii?Q?tJZhKKrO/kJvaFftlmleDRyE1WPgCDK1EpuZbwChUYuSjhyaFgc1+2jGzaK5?=
 =?us-ascii?Q?VQ4O4kNS82WfMUxWGqbQxP3SXPi1QexOp/gFrwpkc57YK3Ub7sb9MnBt09Yd?=
 =?us-ascii?Q?qvuvO3uv4kltaTNC0gIDvNQREiQLoNZdHIYEGlHU/D4cgGXG4YRW9iwM3eqo?=
 =?us-ascii?Q?0yJAgVZqnfN+/A7XXzy9CXVKf32OL/7rEqBzii5LcBJB3wtWODEuHc8uMMrj?=
 =?us-ascii?Q?UtSNDn77pDXCaW6wk4+H4ubPlfIPdqdwkU3Juk4L4QrFOeEE/uXDDFDUHPDu?=
 =?us-ascii?Q?P42+Fpj3+lCOCky/9bW2fyfK5ZhidH2FJffjREli4NuhFt+q7Die5KnWV6E1?=
 =?us-ascii?Q?m5jd0hQGobdgKGx+2WJT5xdymPJle8YbfockNi540TiP3dfw8Sr1IqYS16iy?=
 =?us-ascii?Q?KEqwYdHrC0wv90zKVcwI3L7zwFV7z3lxQMGoUE6P1ijbKoAQyu/7vHxmxCFv?=
 =?us-ascii?Q?xpIrP43pGaps3EwxV1ssp7T/YixV78/hzfrpPv8AMacaLBF+TwpUGSz5Xlfx?=
 =?us-ascii?Q?bqr+ph4wYd1+hHjgLcNwVqot9sQfRjEeRcMmIlz61ueo6f3Gxbcpln95mRco?=
 =?us-ascii?Q?kPNwrgYlBTUOXQmr7lV7nKOkMttWALMDgtfisabG9vfU+N7OYwdF5JZrwbKR?=
 =?us-ascii?Q?IvFtmueaZD8Fi5WPLoHZyHeC+yQelTgRQbhpdjKHYrE2ZzYYk8WgBPJac5LY?=
 =?us-ascii?Q?PU2wVhfTeLvdIoJLfLcnnFtf5T9kQXDub4HA1Y/Gm089Dxr7wTWbzNdqRI/b?=
 =?us-ascii?Q?qyJK0HgcrX1rGXIPEUlzVHRCDYejd1Rk+9IXSP6SqekmF+d0ICZHZ34BqfOU?=
 =?us-ascii?Q?BTuCsUk/eGnBcE8tcDP0VIYuHeCKpRIteWelVsbgKHavbLTMXCAch4AxWcMi?=
 =?us-ascii?Q?ZFKNJujdzzYuBo5idMuBmdHIhDvxsVzRyMOhMdpatPKZGWAruK0KUt6M8gHg?=
 =?us-ascii?Q?AimRzveyEMurLOOJdSl8V2lFUK5ultghlxIEhBGVii20r9gtSqyBz1xgZ5UD?=
 =?us-ascii?Q?XgRfOUfJRKT28P1ar0dbplyVdSUmJAIh2zGaHT5rlsR5HlJbxkBRtTHeO3tZ?=
 =?us-ascii?Q?WHbnchlgc7DMeRMHJBSA5yedaojcHKMdqJRrdIgiCVwjJjG+Dn+nLFw3omtL?=
 =?us-ascii?Q?xVmUMTD/XDkSr1K3t2Hyf6dI9mHvr2Xfc0PPsDRE9L5RISQOhcYz/fWNFJY4?=
 =?us-ascii?Q?xpWmBzFdYgqKtUNO1/F5xP0C+EeV+62HZP5TeWwHWkmHQ/F5IUBksg+NhRGj?=
 =?us-ascii?Q?myW73tc737jS212oW3ILLGxM+uuavARJYZoBODU381Dj23qshWDRI2gIihbH?=
 =?us-ascii?Q?ChpQ8f+BQU+NkOslSKdgFpFbdXp+EciPX0vbMGC7wk52DKAtalz8RF7gxQJJ?=
 =?us-ascii?Q?Xf6V/9f1ma8pAyO9E0oPKangEp8ShhZI8fIagAICmFiurt/UYFj0jF1AuYHT?=
 =?us-ascii?Q?duCS4xGxXw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	pkMPjQYXwfd7fP2qE2fUjKTZGoPlTN/Yw8LdtC3M+cR162cujeUGtdHeKpWa07QnGRqT0xLkZYp76YQUHVTs/XFK+803lS+N3NI4FiUCuWiVbtFTb6M8DVX2zW2dXdaCIa2HOfMy5FmtSvzj8K3+ri1eyjRVX6U1pigRArZJhBhDvAXg8S/DrU6b84niR+XHZv44YaNofM/YoYMUi8LV7FO4m6b/BU88hoZ6vUctgDigDwm4f/GY53D1i13QCm5EywrzrMPxjilg3WtgO9Pd14KBeDY5v/2J2KY17MsjORgwARJcAkSAZEK3uKUYZBy8P30wcNsjay7fN6aGHayMNA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JfjalNdwIbGQSf9Rd2eWR4/vDexk/QVYZ0/igTvmEdEq7epBQvhByVTCm6hbLKY2fykyoQIZuULiArPq8HlRvGIZ8CMtqM31pmfO5lm8RatZ9g26Ne+v0WNIF6hN9RzsWh00p1JdxpVFWjmh+V1Qpd62vfy6ozLDhCy2gshROF1IUbs5QY0yjAnDj0hFKVZE/cQeUI5Ar7XXobsxOTASY475JbGGSuJ67siFiSdXkKkjySgSg8zIVislruuX0xznJu8OZvnMObMQaaBWBemvPiuEN3d6oQLEpP0cUpaG6J2SQuCyukPyBVSrfknAMqsOdDdhaFQ0rYsAHyFVzSiYepMt26VspjmXdhqyC+h2o/X+GchLO4urKhPhEMmFs3vBtp33Any2wJuSdlbHa3xiM6kj0RNXhZZ/5qV23vXmIFM1ys9vJSMsfEj3APyf0hk1Uu5gbnZBIReD7362NtaJaSIRd7dKXJlXPNqKl6Vo4aDDkXpSgTPziEK9f0CKnCkQSrBs76lhq5tQ10ih/tG0pj8nc9v+z32lPVz7fnyFsDxxDT0b3ySt4offb5YAhNORNJhFefmz5XJMdU6dyAt2hc7NAeSgZjcLeJPDswNkKqQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc0f778-7aab-4ffc-f291-08de8538171c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 21:48:28.8282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFH9ths1/5DyrQnAA8Wx9jVV+kvO3zotcAp1E/LQ190lB+EaPE9li4edrutzj1d3UY1FOdv00fW5JWvThimE2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5792
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603180189
X-Authority-Analysis: v=2.4 cv=ftrRpV4f c=1 sm=1 tr=0 ts=69bb1db0 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=hqMOV6YYo2IVuevCB6YA:9 cc=ntf
 awl=host:12272
X-Proofpoint-GUID: 3Nm9pomqJrjHz5KdWoQAYtjNLSAymwgM
X-Proofpoint-ORIG-GUID: 3Nm9pomqJrjHz5KdWoQAYtjNLSAymwgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDE4OCBTYWx0ZWRfXw9Ruv7rgvZDg
 Zs0aU64ASW02qVv6BT4CenNMAIReH1Ym77etuc+bMGnUN0c1HU8LxZ/vxqs6o+Kv31GLPLQP3OC
 Udrdgum2606rRSHdey0yct32rBj2N0yLrXgDg2JjvLsoumbKlr+MPHChkahmSSGYSpY9v7uDjO6
 O9Eltx1r6xSmmfbi1brJhzFQzpZHnCFEp1g055m/PDDr+L91ekXlYQZXpq/nPlNTmW5XMOtTHaF
 I8FCG3bqKJLXZIujNhEFpBztURPlyJjpUj76n3AYKx209ItVunh3S+6eCYQw4APUaMJuoWXKTAn
 A13Tt/SeS916IUP8YEx1RotMVh1CHfq/K5uuSpt0ofvrsP3SDXV36O0sJIbQwlTcktX6K6HbSVs
 p3h8HAXwvfSBwNvaRZE3WxTNgZmc/+7MlLutvwkxOqOYGu6/ni/TJsrNVJQQ2AydgtzHWbkY1Q0
 QuVw6Flxz5zUmkEvGcKPHXDipbEX0vWw7CiCKe6Q=

From: Eugene Loh <eugene.loh@oracle.com>

The test was only being run on older x86 systems, where it had been
failing consistently for a long time.  Since kernels are moving from
kallmodsyms to modules.builtin.ranges, we do not care much about such
problems.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/aggs/tst.aggmod_full2.x | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/test/unittest/aggs/tst.aggmod_full2.x b/test/unittest/aggs/tst.aggmod_full2.x
index 3660504ad..a530a3d2d 100755
--- a/test/unittest/aggs/tst.aggmod_full2.x
+++ b/test/unittest/aggs/tst.aggmod_full2.x
@@ -1,10 +1,25 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
+# Let us skip this test altogether:
+#   * The test was never vetted on arm.
+#   * The test does not run on newer kernels since they have no kallmodsyms.
+#   * On older x86 platforms, the test has failed consistently for a long time.
+# The test had been intended for checking /proc/kallmodsyms,
+# but we are migrating to a modules.builtin.ranges approach.
+# When we are absolutely sure we do not care about this test, it can be removed.
+
+echo "test is deprecated"
+exit 2
+
+###############################################
+### The older contents of this file follow. ###
+###############################################
+
 # The test still needs to be vetted on ARM64, including for copyinstr() support.
 # Once it runs on ARM64, the slower tst.aggmod_full.sh test can be removed.
 
-- 
2.47.3

