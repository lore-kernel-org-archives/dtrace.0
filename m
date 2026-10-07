Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167AE48595E
	for <dtrace@lists.linux.dev>; Wed,  7 Oct 2026 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370433; cv=fail; b=OuHqb5WaYd04EBDbXKEyhnNg9vpMRQ3Abv4lwwd5YjEQ14LAZUQd7jEgW3tXXuPO4NkfgJARh7HUva0XuC1eWcZNZWpOOYXsDamos/pPjtTn6sr3Gk3p4S+vSVP7Qc6JsG5xKB6zQ5lpHmTN1FWqq3cfz2KLT6mBdSvYkiMtXC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370433; c=relaxed/simple;
	bh=OVr+g2pM5PQ17C6CCqNKW5cem4qVW8LeF8yNQAaehGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NR9wTCVIKlFbfJO07eN52tQoEin4Vc26zU/F6N6n/Y6FA9YU82nreS3hALUrIEM0CZANuHPIyohJ+sxYZyaWVIWjtRLiLR2PloJVOz5fqCeZtsGIImZlWPROgzPL2vNQ3jrGgv0SOgSbnVO9la+WjX2qesrUTD0+4Jodwr4AQ4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NTpjBXXE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hmyZeXVb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NTpjBXXE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hmyZeXVb"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977g9Jc2106039
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 10:53:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OfBgQg2QO1nZI8Emn3
	F+rGw1jsZ4zJzcxJIpQYnMlsg=; b=NTpjBXXEuBABL4129Xh/4v7jyLDOZpJFYj
	9+qtkIVSj6HwJ7Lbu8Ym/T2N9RLzmo0ir1tJ6EI0B4rmkbsGZB+SOTueoyXbOSws
	vsfjzMk4f/jLFTN86IR7a7QPTlkzb1S6eEtsUBu6dzxxSL8Uw9b5e5rE2pF4XoPG
	XE4oktj7yf2gyy180JuvfPVzvY9VOjxV0xq40UbXx+DcjvcvKNDaeec2afUbqDHw
	vkD0BMqNcEwm9ntWbQlBEKeTFuY0QbYt+7/u5ulWiulnncQZxM6RXzG4rtwOPeEW
	GLsQUtw/3cXhC5qeviXAVNL+zNTlmapWXDXDZTUVibf9hHjfxeUQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2sk7ng2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 10:53:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 697AaLnM031773
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 10:53:13 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012044.outbound.protection.outlook.com [40.107.200.44])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h4d00u3e9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 10:53:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eQP1+YmJ/Ka/hvz7U+gACkdRKbVazgmYsizEHuhiOtkuAIR2BNmeK6QwsHMz4YjN94o3J2H5ksQlpvWe12cRpfVJoW4LHxwCcwWq+bSSCRH+DaQWx0Gj+EvRz2PvzkkZmg0zXpDmhyZH7dEi9xQLB5FjW1RN+BPvqKX1gN4LNf/z4euFctmYEcIUy/UG2mtYSxGt1zcoEecJxgY0bDqe57e9t+PYkV97ckNxjAfWnEoP77vjFOP3z8Rj161MO3jnAvE0KqEGZSmwm+zxQ5Mx2cC2+8XykblUyUuLov6kFu2VFIMYX/TvyK9UdwVUU5nxMoxGOwLksWRPNNpZypVMuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfBgQg2QO1nZI8Emn3F+rGw1jsZ4zJzcxJIpQYnMlsg=;
 b=m160HopGJznemt2AHcSnQBAE91bDKT8jwhB6M2umWI8tOZizNmtR9jY6bC31eZSc1Nu3qiS6D8MhqMfAcSOWKUQ+APadobOwpKvPf51pG/rAL6drwFBy7B3BIp1t2XFA2HLd8JQGmyE5EMihMJ7eVHhHjF7qnQaaMvs/nCc9BrA7Mc+XRZsy0HRiLHZ4Z6zseNLepWtKhwoZZ7UZNKkUtwTqL4figRTcX38sHLwoQ7d5YECLUauZp2NlWOffX72C1U1qByArCsLBthn4Clbrdc2ktNEkRb/yNtVCvCRVrm/aE3iRoo99oC9IGlitNdjQ4eBz4Yxw7BwT6HoDC7YykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfBgQg2QO1nZI8Emn3F+rGw1jsZ4zJzcxJIpQYnMlsg=;
 b=hmyZeXVbv3ufc1Hu+9KAQKst/jTunqBitQw00rugtQEw2YmhpYCraYV6Y7CXlKWXzkv2sm+pnz51xINYRKAh6PmxiASlBFgKR6wnR3P65OyFNZD6pc5Wzd5gD1gj5yLm91njHK0wKrdO3WpGth3aa6FyOWGlHC41jhMnOWNHzxI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by MN6PR10MB7422.namprd10.prod.outlook.com (2603:10b6:208:46d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 7 Oct 2026
 10:53:07 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0496.008; Wed, 7 Oct 2026
 10:53:06 +0000
Date: Wed, 7 Oct 2026 10:51:44 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 04/11] libdtrace: Add aggregation key/value
 computation APIs
Message-ID: <asYkQBvaReka0y_V@kvh-deb-bpf>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
 <20260821161100.41710-5-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161100.41710-5-alan.maguire@oracle.com>
X-ClientProxiedBy: PH0PR07CA0041.namprd07.prod.outlook.com
 (2603:10b6:510:e::16) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|MN6PR10MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: f23ce045-9df0-4724-3d1d-08df24612ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|6133799003|18002099003|3023799007|22082099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	8qZxGzmmawiLimXeRRO+KRAwBYwGlgOdHJtxNUZ1gj2u/LXLb3+1WMw9yEm1uKKJeaKJ3JnZz2Zeg3LWHA1oN5FimlbDq3M18uJ54gtyEG9mykTjhyyzxg9oGyTgii95HXlDpvO0DPBjw9oFsmvxIpTJNsr8/cSJ0B/bR6vdKUuLvcvX0/jIxl0BbqMjyWWuV6YWaxVHlxFCBOndECHXcOv0LQnfBaFZS8wBsNgXz1t8GYzKB2tDeXGCkxpQqnFa+ugvsQPYiPapO3RQPO4GgNf8kJWReBJi2tvmLyjPOpTjJWkXp5JYPhiWwkTqDOg2MIpJVFhm4o5ai/PD+VxyTh9JDyM8JrOgIEqsh9U5ff32jU6MiPmvzTXilT/U3DFwEFvO73LK4n4FoyTCsm7Lf95N5baV7QomCXNzzxfKqhCComBfFQjLIh2R/+ajkUv+Xuw43F078YFLCkks4uk/U5PNCeXTu5gA0fSXcRSsSCB0nNKAAVaeP44t6+DDW42Ki7YxKlfjItnpageOn2Sr6j8OyxapQLgUVF029oWaw4Bk6zDS/frXWuBjR7b5HhnDcquDBDOKbSvuqlQIPQ2/vkQNrwjyZD1LGunQnI8jvfd5bLTF13Q1JhS8Bx5IsdIV1WWqvdLB7MRGvQCurmafCGatZX//ZPeim7z8LpwMDEs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(18002099003)(3023799007)(22082099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Isv3n1+BwUmiwavAF7HNAyPTjIErQIuBXHJEy35obydkX7riQd4VzknfgF9E?=
 =?us-ascii?Q?OalX8AYTskpu69p7BOQpMHSXvZQ6Eqpbhezn1/H85Xw0nmA4D4/6c8OW0be+?=
 =?us-ascii?Q?MXKgcoN5Qibcn4RFQGT2br/R30KnpJOoYi2K5KbNOAgTN6ykPSHh6z1dxK8E?=
 =?us-ascii?Q?Ld/kHwQ4QW+0laG5PywwxAUy3Kmuua09nmMvTA4UeB1jMZ4C5vW3F+AjOvqP?=
 =?us-ascii?Q?HPfZOAD8lqNje67Z5E0gQyXnDiCsVuWuf3hh9ayHuGEGRLb6Cx6UQR9VLARp?=
 =?us-ascii?Q?5LDGpBKkwIdVrEB/EDdz/3ehAE5Oht/7OY8mdjFz/ddXZeZ1hvYKLIpbqpoe?=
 =?us-ascii?Q?RXcNemSDeAJwrBzJ+kKY/LRx8u4vzCCax8y5G/GuUHdlAeezP4KlNmCIAJkr?=
 =?us-ascii?Q?5a3+UQ2yx/0dEr0JG9UG0Kn4Rm6KDLxqd5A+t9l8kbz5IoyGNeyJ4CTlHKvN?=
 =?us-ascii?Q?GIvQIn2MBgdiGnAK1MGo0ALpc7wOTZouxHkXBcPUvtRezOhfxPsYK3V9pByr?=
 =?us-ascii?Q?h4iGv4X5V5taaBaizirU5925iBYSO0CI+kRzE0bBVcVXEVyQWeCD6P1cekFB?=
 =?us-ascii?Q?O7tMUfmGH6JiDuWBP/eOG2hNpu5ZE2B77o6P21NIEIE9YJ28QlzJPA2goAFC?=
 =?us-ascii?Q?NvszJWuDgwozzkr9bYHoFhYQFYP+Tunj0h7apDP8YF22dVxiMC9Or4UpdwwE?=
 =?us-ascii?Q?cZVbByNMjTOrwjaukoj+aJIOZg7ljIM3byescI1mNs/IuoiIlb9n1KWpWHmt?=
 =?us-ascii?Q?fLWN97pqkqKxU7e0B1sItqkgvLjeKtO1l8Qdmepz7qE8Y17DJzH/We3pRccC?=
 =?us-ascii?Q?FpcTpNvm9EbBumgz4H9TdE0sxxSdlIbT+XPledQ8B2Xvxmy45PSTD5joMvMG?=
 =?us-ascii?Q?4kcI09dXemGjhxWzMAgbOr8s0Z6suknFiiHsYSEPqVKWn+wKpHHnD4+ZElQy?=
 =?us-ascii?Q?re6SLluIf9yRyWoZP6rlpFSTnmEVOIyRKcv9GPJNeFHBfKcR0HxM7LwiJhpo?=
 =?us-ascii?Q?S1GMcVoecZRnKLgdGz3PhJXFKFphkQTl4KCyHUhRO7zFzRw8w3hjiNFkWH02?=
 =?us-ascii?Q?98KRJmScCiXY3bi3RTiPWZC+4tADm8nkUnl7F1onHs0rD9fm7v8hzU477Hmy?=
 =?us-ascii?Q?8G+WR56gELOOo44aV2VP/vHPdTIyeT37Lxur1+c/yrXa7lh5z8Rn3Chi6OEa?=
 =?us-ascii?Q?m6tFgsPxjcZIwc2b2x181+7DuR1TYJPQqB9BLbgho67UOz8l/jwtFHmrThIm?=
 =?us-ascii?Q?r4nk6WtOVeXzI9arNfHgDLdtkuwo/kfAkTuDcm2bKFBTbte/JmncbZnarhet?=
 =?us-ascii?Q?cq+2n+ePvOPikqW/fJ9Dzi3h11OkMxvTpDNj19YmbIOyMTvhBPYiZUaJ4U10?=
 =?us-ascii?Q?Tc+saNGTNwp5MpHmETEIbwLQZfNt7OX4WUn5Z1eatxxJHoBiqXNsj8Dtjwwu?=
 =?us-ascii?Q?1pU7HKLHc2b0Z4YoMs6cRtVxZlF/7khq12ItT0PX4/IvuxWelvRhrPlF3Du6?=
 =?us-ascii?Q?1xaCDpD4M2lJF68dQk2kgY7D4tLva7OJCUbpMXfKc+UdKEBGFUa8LI48/JP3?=
 =?us-ascii?Q?bbF1/JXvn+EOvBMm7A1o9ZbzRXT8dhePDnywSKtI2NPk0P99rnkyGhzrgjUQ?=
 =?us-ascii?Q?3m53ZZIPMeYIq4DSGnzWQ+RGgC7A4ZpWQ4bpGsqoMUYyGnnulHH9jRQsjQIk?=
 =?us-ascii?Q?2Vy28j9Lmsgzv392Z7EnNHKd4l9Rx7q89AtWYKKAzMOXZDJ5UP0QXem+izv1?=
 =?us-ascii?Q?e8Uj5O15s7oiA0HkrU8voOXCAHLRS9E=3D?=
X-Exchange-RoutingPolicyChecked:
	DqCPgUzOOwb39kQdFMXhF3YdekDp2wa5HmXC2U0WvIujKIkXJ56UjvqnnZt9Ew525OfAswia6Iw+Z0LQs6ZZ8pHQkXurBIH8XAJSnNy6BaBzKKvFYu7hFlCC5KLM1oKlTyWnBr+UeoI5oPAk7yJbNKW8KEdUyMmGUXEsGFa2wF0Ft4Ic1bLCRAeqZNmclYVJvlu9Nfg2CHO+vhRUuo3OvskQbuI5j+EB/HQAQoN1DwrLVx13epSy3RNQz+fSS3vsmdJUZaBrlrTHOb650kFfdF0LZBX9+Pu7+Yd5SdoHc6y/r3ulN2vDHW4yr9v54gy/9zHjRl02wVUWwMENdoc9qA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lzjorsm79QjNk49hBzW6y0JtmZhEKWvyxnLEbH6UXrmwmic0qtylvxNekt2K8hNsdgxBLtfG0GAVS0T/sfWa+TQnp0ZamjhAsMPQhoSyyyGcdcdF4D2BJwlJmN0so2tFbIsMGcTyeDZsXkmMXkqoU4V0jckSK4Qx3gA+KkHaZHkfBJRGLU6scHYkjov0qn4GCxrzP4pa3NqqS0ep5WfjbbLL4/ihZh8eAoaWCjNwuXHwYY9V1OOPum7iVG2crqtKU9Qs6tIJ2JBXygBhCyCMRX2oPZj/YWzigM1T23GFviLowP8zt26EIH1BvImh8TSBXM6gtnTC4hs8cboITdswThIzhfTNL4SGlR+2sx7DVA/EbAS/gnKFL4UyQCPEQOZnZ9wTUBtEX2jZ01DvCtz8329PXVgKbPdf8ZT6AUUR6NirimQILuGC70BBq6FfC4Pc28Z86VENAtjl4h7F0ynVjhJ2J2m/WVZNSfmHBFeyUCJM1Z4nFCApaccL+gSLz7Qjqv31FoPUPs74snuQgi67rjJd+5c1MtLJ7xXRYdZEuUJs2lC/DX/VZCCtjXHDQg5J6L7PFAzVbkTodguZGKTsfRzl3iu1WZZ7MsBX9cBEh1M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23ce045-9df0-4724-3d1d-08df24612ade
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:53:06.1440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKdgbMDy2PRGrUW+whggQpGPWk3340eafwUnvmDfH7IuL9i4u5gu6R4cWX3E6FiM8JTbPE0yuTqwXA17h8fo5g5evgyw0qSdO8wgvTpRExs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7422
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2610070042
X-Authority-Analysis: v=2.4 cv=Cpsq4X4D c=1 sm=1 tr=0 ts=6ac62499 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8
 a=jRd2sF72W0hPsBGgDRsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: w8bJNWtUlfaqkJUzQyOuo3OOMJf652qV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX32in78ez30/H
 TIGqXgsHvTiyoAfGU6bzDXvGqHuo9j/LOhtN9isTOvWOT2djwdWjybaASfyElbZpqz1At0VcB8L
 rr3on9Akoz7BfvaEeFnGgme4PiS6I092j0t6pFXeYax9SrA46B73
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MyBTYWx0ZWRfX3WyEeDCRyF/p
 yiZ3YChxgN25PsboFIKHHx3fWuAzWaacU9UVqBAYE5WWVLwKA00N8Eh+lH+5Q08JScHhbWIJIFA
 7uOduDTBj3In6EEojm/EgJux2RTUPwuZQampDj2NKqE++ApnjTksv4Wmr9XOaKjAN6KSOVI35Nn
 1UM0F+6xl+/gnEX5R6tfjfdv31B+XPHAQkcumE3lnUWqeEfOGiz6bN1KgSF8K+BLeiNJQHCLAQy
 KcmE/bFNkLdGyiTq3HktQS9sN1qgZ7/8HWD975sOv1JOVsKQ/L4QudRADxhE370lKb15uu4sgCy
 V9/99TYD17WciRHZJqs2q+0J1R/DGlTeHFu5Btu65GLX8vaZNWPinegxFBUZn+c7perk9rbNOmw
 nWcEZu888oCy5FEcDtLSLLNoMw9fO+uHmu+rmjjL9qC6arW203k9XWWX3yrZo2LT1WYygHllY4B
 CIr7pU2whvrt/1vFFxg==
X-Proofpoint-GUID: w8bJNWtUlfaqkJUzQyOuo3OOMJf652qV

I am lookingaand t this but there are a few issues already in terms of
safety.  Since these are API functions, we cannot count on the caller
ensuring safety.  E.g. dtrace_aggregate_keys() would result in an out of
bounds memory write if keys has room for 2 keys, num_keys is 3, and
dtagd_nkrecs >= 4.  Perhaps the function should do its own allocation
and return the number of keys upon success instead?

I would do the same for the dtrace_aggregate_value() function.

On Fri, Aug 21, 2026 at 05:10:52PM +0100, Alan Maguire wrote:
> To provide a way for consumers to emit aggregation keys
> and compute aggregation values, provide new APIs in libdtrace:
> 
> int dtrace_aggregate_value(const dtrace_aggdata_t *aggdata,
> 			   dtrace_aggvalue_t *value);
> int dtrace_aggregate_keys(const dtrace_aggdata_t *data,
> 			  dtrace_aggkey_t *keys, size_t num_keys);
> void dtrace_aggregate_key_free(dtrace_aggkey_t *key);
> 
> These provide a way to compute aggregation values from snapshots,
> print them and free the representation used to print them.
> 
> This allows consumers like python bindings to avoid having to
> understand aggregation internals.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_aggregate.c | 517 +++++++++++++++++++++++++++++++++++++++
>  libdtrace/dtrace.h       |  83 +++++++
>  libdtrace/libdtrace.ver  |   3 +
>  3 files changed, 603 insertions(+)
> 
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index 1fc8294d..afc6a01a 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -13,11 +13,15 @@
>  #include <assert.h>
>  #include <alloca.h>
>  #include <limits.h>
> +#include <stdio.h>
> +#include <string.h>
>  
>  #include <libproc.h>
>  #include <port.h>
>  #include <dt_aggregate.h>
>  #include <dt_bpf.h>
> +#include <math.h>
> +#include <limits.h>
>  
>  typedef struct dt_ahashent {
>  	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
> @@ -44,6 +48,519 @@ struct dt_aggregate {
>  
>  #define	DTRACE_AHASHSIZE	32779		/* big 'ol prime */
>  
> +static int
> +dt_aggregate_read_signed(const char *addr, size_t size, int64_t *value)
> +{
> +	int8_t v8;
> +	int16_t v16;
> +	int32_t v32;
> +	int64_t v64;
> +
> +	switch (size) {
> +	case sizeof(v8):
> +		memcpy(&v8, addr, sizeof(v8));
> +		*value = v8;
> +		return 0;
> +	case sizeof(v16):
> +		memcpy(&v16, addr, sizeof(v16));
> +		*value = v16;
> +		return 0;
> +	case sizeof(v32):
> +		memcpy(&v32, addr, sizeof(v32));
> +		*value = v32;
> +		return 0;
> +	case sizeof(v64):
> +		memcpy(&v64, addr, sizeof(v64));
> +		*value = v64;
> +		return 0;
> +	default:
> +		return -1;
> +	}
> +}
> +
> +static int
> +dt_aggregate_read_unsigned(const char *addr, size_t size, uint64_t *value)
> +{
> +	uint8_t v8;
> +	uint16_t v16;
> +	uint32_t v32;
> +	uint64_t v64;
> +
> +	switch (size) {
> +	case sizeof(v8):
> +		memcpy(&v8, addr, sizeof(v8));
> +		*value = v8;
> +		return 0;
> +	case sizeof(v16):
> +		memcpy(&v16, addr, sizeof(v16));
> +		*value = v16;
> +		return 0;
> +	case sizeof(v32):
> +		memcpy(&v32, addr, sizeof(v32));
> +		*value = v32;
> +		return 0;
> +	case sizeof(v64):
> +		memcpy(&v64, addr, sizeof(v64));
> +		*value = v64;
> +		return 0;
> +	default:
> +		return -1;
> +	}
> +}
> +
> +int
> +dtrace_aggregate_value(const dtrace_aggdata_t *aggdata, dtrace_aggvalue_t *value)
> +{
> +	const dtrace_aggdesc_t *agg;
> +	const dtrace_recdesc_t *rec;
> +	const char *addr;
> +	uint64_t normal;
> +
> +	if (aggdata == NULL || aggdata->dtada_desc == NULL ||
> +	    aggdata->dtada_data == NULL || value == NULL)
> +		return aggdata && aggdata->dtada_hdl ?
> +			dt_set_errno(aggdata->dtada_hdl, EINVAL) : -1;
> +
> +	agg = aggdata->dtada_desc;
> +	rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
> +	addr = aggdata->dtada_data + rec->dtrd_offset;
> +	normal = agg->dtagd_normal ? agg->dtagd_normal : 1;
> +	value->dtagv_action = rec->dtrd_action;
> +	value->dtagv_normal = normal;
> +	value->dtagv_bucket_count = 0;
> +
> +	switch (rec->dtrd_action) {
> +	case DT_AGG_AVG: {
> +		const int64_t *data = (const int64_t *)addr;
> +
> +		if (rec->dtrd_size < sizeof(*data) * 2)
> +			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		value->dtagv_kind = DTRACE_AGGVALUE_FLOAT;
> +		value->dtagv_value.real = data[0] == 0 ? 0.0 :
> +			(double)((long double)data[1] / normal / data[0]);
> +		return 0;
> +	}
> +	case DT_AGG_STDDEV: {
> +		uint64_t data[4];
> +
> +		if (rec->dtrd_size < sizeof(data))
> +			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		memcpy(data, addr, sizeof(data));
> +		value->dtagv_kind = DTRACE_AGGVALUE_UNSIGNED;
> +		value->dtagv_value.unsigned_integer =
> +			data[0] == 0 ? 0 : dt_stddev(data, normal);
> +		return 0;
> +	}
> +	case DT_AGG_SUM:
> +	case DT_AGG_MIN:
> +	case DT_AGG_MAX:
> +		value->dtagv_kind = DTRACE_AGGVALUE_INTEGER;
> +		if (dt_aggregate_read_signed(addr, rec->dtrd_size,
> +					     &value->dtagv_value.integer) != 0)
> +			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		value->dtagv_value.integer /= (int64_t)normal;
> +		return 0;
> +	case DT_AGG_COUNT:
> +		value->dtagv_kind = DTRACE_AGGVALUE_UNSIGNED;
> +		if (dt_aggregate_read_unsigned(addr, rec->dtrd_size,
> +			    &value->dtagv_value.unsigned_integer) != 0)
> +			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		value->dtagv_value.unsigned_integer /= normal;
> +		return 0;
> +	case DT_AGG_QUANTIZE: {
> +		const int64_t *data = (const int64_t *)addr;
> +		size_t i, nbins = rec->dtrd_size / sizeof(*data);
> +
> +		if (rec->dtrd_size % sizeof(*data) != 0 ||
> +		    value->dtagv_buckets == NULL ||
> +		    value->dtagv_bucket_capacity < nbins)
> +			return dt_set_errno(aggdata->dtada_hdl, EINVAL);
> +		for (i = 0; i < nbins; i++) {
> +			if (data[i] < 0)
> +				return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		}
> +		for (i = 0; i < nbins; i++) {
> +			if (data[i] == 0)
> +				continue;
> +			value->dtagv_buckets[value->dtagv_bucket_count].bucket =
> +				DTRACE_QUANTIZE_BUCKETVAL((uint64_t)i);
> +			value->dtagv_buckets[value->dtagv_bucket_count].count =
> +				(uint64_t)(data[i] / (int64_t)normal);
> +			if (value->dtagv_buckets[value->dtagv_bucket_count].count != 0)
> +				value->dtagv_bucket_count++;
> +		}
> +		value->dtagv_kind = DTRACE_AGGVALUE_QUANTIZED;
> +		return 0;
> +	}
> +	case DT_AGG_LQUANTIZE: {
> +		uint16_t levels = DTRACE_LQUANTIZE_LEVELS(agg->dtagd_sig);
> +		uint16_t step = DTRACE_LQUANTIZE_STEP(agg->dtagd_sig);
> +		int32_t base = DTRACE_LQUANTIZE_BASE(agg->dtagd_sig);
> +		size_t i, nbins = (size_t)levels + 2;
> +		const int64_t *data = (const int64_t *)addr;
> +
> +		if (rec->dtrd_size != nbins * sizeof(*data) ||
> +		    value->dtagv_buckets == NULL ||
> +		    value->dtagv_bucket_capacity < nbins)
> +			return dt_set_errno(aggdata->dtada_hdl, EINVAL);
> +		for (i = 0; i < nbins; i++) {
> +			if (data[i] < 0)
> +				return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		}
> +		for (i = 0; i < nbins; i++) {
> +			int64_t count = data[i] / (int64_t)normal;
> +			int64_t bucket;
> +
> +			if (count == 0)
> +				continue;
> +			if (i == 0)
> +				bucket = base - 1;
> +			else if (i == levels + 1)
> +				bucket = base + (int64_t)levels * step;
> +			else
> +				bucket = base + (int64_t)(i - 1) * step;
> +			value->dtagv_buckets[value->dtagv_bucket_count++] =
> +				(dtrace_aggvalue_bucket_t){ bucket, (uint64_t)count };
> +		}
> +		value->dtagv_kind = DTRACE_AGGVALUE_QUANTIZED;
> +		return 0;
> +	}
> +	case DT_AGG_LLQUANTIZE: {
> +		int factor = DTRACE_LLQUANTIZE_FACTOR(agg->dtagd_sig);
> +		int lmag = DTRACE_LLQUANTIZE_LMAG(agg->dtagd_sig);
> +		int hmag = DTRACE_LLQUANTIZE_HMAG(agg->dtagd_sig);
> +		int steps = DTRACE_LLQUANTIZE_STEPS(agg->dtagd_sig);
> +		int steps_factor, bin0;
> +		size_t i, nbins;
> +		const int64_t *data = (const int64_t *)addr;
> +		long double limit = (long double)INT64_MAX;
> +
> +		if (factor < 2 || steps < factor || lmag > hmag)
> +			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		steps_factor = steps / factor;
> +		bin0 = 1 + (hmag - lmag + 1) * (steps - steps_factor);
> +		nbins = (size_t)(hmag - lmag + 1) *
> +			(steps - steps_factor) * 2 + 3;
> +		if (!isfinite((double)powl(factor, hmag + 1)) ||
> +		    powl(factor, hmag + 1) > limit)
> +			return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +
> +		if (rec->dtrd_size != nbins * sizeof(*data) ||
> +		    value->dtagv_buckets == NULL ||
> +		    value->dtagv_bucket_capacity < nbins)
> +			return dt_set_errno(aggdata->dtada_hdl, EINVAL);
> +		for (i = 0; i < nbins; i++) {
> +			if (data[i] < 0)
> +				return dt_set_errno(aggdata->dtada_hdl, EDT_BADAGG);
> +		}
> +		for (i = 0; i < nbins; i++) {
> +			int64_t count = data[i] / (int64_t)normal;
> +			int64_t bucket;
> +			int left, negative, remaining, magnitude;
> +
> +			if (count == 0)
> +				continue;
> +			if (i == 0)
> +				bucket = -(int64_t)powl(factor, hmag + 1);
> +			else if (i == nbins - 1)
> +				bucket = (int64_t)powl(factor, hmag + 1);
> +			else if (i == (size_t)bin0)
> +				bucket = 0;
> +			else {
> +				left = (int)i - bin0;
> +				negative = left < 0;
> +				remaining = negative ? bin0 - (int)i : left;
> +				magnitude = lmag;
> +				if (lmag == 0 && steps > factor) {
> +					for (int n = 2; n <= factor && remaining > 0; n++) {
> +						remaining -= steps_factor;
> +						if (remaining == 0) {
> +							bucket = negative ? -n : n;
> +							goto ll_have_bucket;
> +						}
> +					}
> +					magnitude++;
> +				}
> +				bucket = negative ? -1 : 1;
> +				while (magnitude <= hmag) {
> +					int64_t scale = (int64_t)(powl(factor, magnitude + 1) /
> +						(double)steps);
> +					int n;
> +
> +					for (n = steps_factor + 1; n <= steps; n++) {
> +						if (--remaining == 0) {
> +							bucket = n * scale * (negative ? -1 : 1);
> +							goto ll_have_bucket;
> +						}
> +					}
> +					magnitude++;
> +				}
> +				bucket *= (int64_t)powl(factor, hmag + 1);
> +			}
> +ll_have_bucket:
> +			value->dtagv_buckets[value->dtagv_bucket_count++] =
> +				(dtrace_aggvalue_bucket_t){ bucket, (uint64_t)count };
> +		}
> +		value->dtagv_kind = DTRACE_AGGVALUE_QUANTIZED;
> +		return 0;
> +	}
> +	default:
> +		value->dtagv_kind = DTRACE_AGGVALUE_RAW;
> +		value->dtagv_value.raw.data = addr;
> +		value->dtagv_value.raw.size = rec->dtrd_size;
> +		return 0;
> +	}
> +}
> +
> +void dtrace_aggregate_key_free(dtrace_aggkey_t *key)
> +{
> +	size_t i;
> +
> +	if (!key)
> +		return;
> +	switch (key->dtagk_kind) {
> +	case DTRACE_AGGKEY_BYTES:
> +		free(key->dtagk_value.bytes.data);
> +		break;
> +	case DTRACE_AGGKEY_STRING:
> +	case DTRACE_AGGKEY_SYMBOL:
> +	case DTRACE_AGGKEY_MODULE:
> +		free(key->dtagk_value.name);
> +		break;
> +	case DTRACE_AGGKEY_ADDRESS:
> +		break;
> +	case DTRACE_AGGKEY_STACK:
> +		for (i = 0; i < key->dtagk_value.stack.depth; i++)
> +			free(key->dtagk_value.stack.frames[i]);
> +		free(key->dtagk_value.stack.frames);
> +		break;
> +	default:
> +		break;
> +	}
> +	memset(key, 0, sizeof(*key));
> +}
> +
> +int dtrace_aggregate_keys(const dtrace_aggdata_t *data,
> +			  dtrace_aggkey_t *keys, size_t num_keys)
> +{
> +	int error = EDT_NOMEM;
> +	dtrace_hdl_t *dtp;
> +	size_t i, n;
> +
> +	if (!data || !data->dtada_desc)
> +		return data && data->dtada_hdl ?
> +			dt_set_errno(data->dtada_hdl, EINVAL) : -1;
> +	dtp = data->dtada_hdl;
> +	if (data->dtada_desc->dtagd_nkrecs == 0)
> +		return 0;
> +	n = data->dtada_desc->dtagd_nkrecs - 1;
> +	if (n == 0)
> +		return 0;
> +	if (!data->dtada_key)
> +		return dt_set_errno(dtp, EDT_BADAGG);
> +	if (!keys || num_keys < n)
> +		return dt_set_errno(dtp, EINVAL);
> +	memset(keys, 0, n * sizeof(*keys));
> +
> +	for (i = 0; i < n; i++) {
> +		const dtrace_recdesc_t *rec = &data->dtada_desc->dtagd_krecs[i + 1];
> +		char *addr = data->dtada_key + rec->dtrd_offset;
> +		if ((size_t)rec->dtrd_offset > data->dtada_desc->dtagd_ksize ||
> +		    rec->dtrd_size > data->dtada_desc->dtagd_ksize -
> +		    (size_t)rec->dtrd_offset)
> +			goto badagg;
> +
> +		switch (rec->dtrd_action) {
> +		case DTRACEACT_STACK:
> +		case DTRACEACT_USTACK:
> +		case DTRACEACT_JSTACK: {
> +			uint32_t depth, max, frames, j, tgid = 0;
> +
> +			if (rec->dtrd_size < 2 * sizeof(uint64_t) ||
> +			    (rec->dtrd_action != DTRACEACT_STACK &&
> +			     rec->dtrd_size < 4 * sizeof(uint64_t)))
> +				goto badagg;
> +			memcpy(&depth, addr, sizeof(depth));
> +			max = rec->dtrd_size >= 2 * sizeof(uint64_t) ?
> +				rec->dtrd_size / sizeof(uint64_t) - 2 : 0;
> +			frames = depth < max ? depth : max;
> +			if (rec->dtrd_action != DTRACEACT_STACK) {
> +				memcpy(&tgid, addr + 3 * sizeof(uint32_t),
> +				       sizeof(tgid));
> +			}
> +
> +			keys[i].dtagk_kind = DTRACE_AGGKEY_STACK;
> +			keys[i].dtagk_value.stack.frames = frames == 0 ? NULL :
> +				calloc(frames, sizeof(char *));
> +			keys[i].dtagk_value.stack.depth = 0;
> +			if (frames != 0 && !keys[i].dtagk_value.stack.frames)
> +				goto error;
> +			for (j = 0; j < frames; j++) {
> +				char text[PATH_MAX * 2];
> +				uint64_t pc;
> +				int rc;
> +
> +				memcpy(&pc, addr + (j + 2) * sizeof(uint64_t),
> +				       sizeof(pc));
> +				if (pc == 0)
> +					break;
> +				rc = rec->dtrd_action == DTRACEACT_STACK ?
> +					dtrace_addr2str(dtp, pc, text,
> +							sizeof(text)) :
> +					dtrace_uaddr2str(dtp, tgid, pc,
> +							 text, sizeof(text));
> +				if (rc < 0) {
> +					error = EDT_BADAGG;
> +					goto error;
> +				}
> +				if (!(keys[i].dtagk_value.stack.frames[j] = strdup(text)))
> +					goto error;
> +				keys[i].dtagk_value.stack.depth++;
> +			}
> +			break;
> +		}
> +		case DTRACEACT_SYM:
> +		case DTRACEACT_MOD: {
> +			dtrace_syminfo_t info;
> +			char text[PATH_MAX * 2];
> +			uint64_t pc;
> +
> +			memcpy(&pc, addr, sizeof(pc));
> +
> +			if (dtrace_lookup_by_addr(dtp, pc,
> +						  NULL, &info) == 0) {
> +				snprintf(text, sizeof(text), "%s%s%s",
> +					 info.object,
> +					 rec->dtrd_action == DTRACEACT_SYM ? "`" : "",
> +					 rec->dtrd_action == DTRACEACT_SYM ? info.name : "");
> +			} else {
> +				snprintf(text, sizeof(text), "0x%llx",
> +					(unsigned long long)pc);
> +			}
> +			keys[i].dtagk_kind = rec->dtrd_action == DTRACEACT_SYM ?
> +				DTRACE_AGGKEY_SYMBOL : DTRACE_AGGKEY_MODULE;
> +			keys[i].dtagk_value.name = strdup(text);
> +			if (!keys[i].dtagk_value.name)
> +				goto error;
> +			break;
> +		}
> +		case DTRACEACT_UADDR:
> +		case DTRACEACT_USYM:
> +		case DTRACEACT_UMOD: {
> +			char text[PATH_MAX * 2];
> +			uint32_t tgid;
> +			uint64_t pc;
> +
> +			/*
> +			 * The target PID occupies the first word and the address
> +			 * the second; the record is aligned to 64 bits.
> +			 */
> +			if (rec->dtrd_size < 2 * sizeof(uint64_t))
> +				goto badagg;
> +			memcpy(&tgid, addr, sizeof(tgid));
> +			memcpy(&pc, addr + sizeof(uint64_t), sizeof(pc));
> +			if (rec->dtrd_action == DTRACEACT_UADDR) {
> +				keys[i].dtagk_kind = DTRACE_AGGKEY_ADDRESS;
> +				keys[i].dtagk_value.user_address.pid = tgid;
> +				keys[i].dtagk_value.user_address.address = pc;
> +				break;
> +			}
> +
> +			if (dtrace_uaddr2str(dtp, tgid, pc, text,
> +				     sizeof(text)) < 0)
> +				goto badagg;
> +			if (rec->dtrd_action == DTRACEACT_UMOD) {
> +				char *tick = strchr(text, '`');
> +				if (tick)
> +					*tick = '\0';
> +			}
> +			keys[i].dtagk_kind = rec->dtrd_action == DTRACEACT_USYM ?
> +				 DTRACE_AGGKEY_SYMBOL : DTRACE_AGGKEY_MODULE;
> +			keys[i].dtagk_value.name = strdup(text);
> +			if (!keys[i].dtagk_value.name)
> +				goto error;
> +			break;
> +		}
> +		default:
> +			keys[i].dtagk_kind = DTRACE_AGGKEY_INTEGER;
> +			switch (rec->dtrd_size) {
> +			case 1: {
> +				int8_t v;
> +
> +				memcpy(&v, addr, 1);
> +				keys[i].dtagk_value.integer = v;
> +				break;
> +			}
> +			case 2: {
> +				int16_t v;
> +
> +				memcpy(&v, addr, 2);
> +				keys[i].dtagk_value.integer = v;
> +				break;
> +			}
> +			case 4: {
> +				int32_t v;
> +
> +				memcpy(&v, addr, 4);
> +				keys[i].dtagk_value.integer = v;
> +				break;
> +			}
> +			case 8: {
> +				int64_t v;
> +
> +				memcpy(&v, addr, 8);
> +				keys[i].dtagk_value.integer = v;
> +				break;
> +			}
> +			default: {
> +				char *nul = memchr(addr, '\0', rec->dtrd_size);
> +
> +				/*
> +				 * This is a heuristic: key descriptors do not
> +				 * retain type information.  DTrace strings are
> +				 * NUL-terminated and padded with zeros to their
> +				 * fixed record size.
> +				 */
> +				if (nul != NULL) {
> +					char *p;
> +
> +					for (p = nul + 1; p < addr + rec->dtrd_size; p++) {
> +						if (*p != '\0')
> +							break;
> +					}
> +					if (p == addr + rec->dtrd_size) {
> +						keys[i].dtagk_kind = DTRACE_AGGKEY_STRING;
> +						keys[i].dtagk_value.name = strndup(addr,
> +									   rec->dtrd_size);
> +						if (!keys[i].dtagk_value.name)
> +							goto error;
> +						break;
> +					}
> +				}
> +				keys[i].dtagk_kind = DTRACE_AGGKEY_BYTES;
> +				keys[i].dtagk_value.bytes.data = malloc(rec->dtrd_size);
> +				if (!keys[i].dtagk_value.bytes.data)
> +					goto error;
> +				memcpy(keys[i].dtagk_value.bytes.data, addr,
> +				       rec->dtrd_size);
> +				keys[i].dtagk_value.bytes.size = rec->dtrd_size;
> +				break;
> +			}
> +			}
> +			break;
> +		}
> +	}
> +	return (int)n;
> +error:
> +	for (i = 0; i < n; i++)
> +		dtrace_aggregate_key_free(&keys[i]);
> +	return dt_set_errno(dtp, error);
> +badagg:
> +	for (i = 0; i < n; i++)
> +		dtrace_aggregate_key_free(&keys[i]);
> +	return dt_set_errno(dtp, EDT_BADAGG);
> +}
> +
>  /*
>   * Because qsort(3C) does not allow an argument to be passed to a comparison
>   * function, the variables that affect comparison must regrettably be global;
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index 82965fbd..a108080f 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -379,6 +379,89 @@ struct dtrace_aggdata {
>  	caddr_t *dtada_percpu;			/* per CPU data, if avail */
>  };
>  
> +typedef enum dtrace_aggvalue_kind {
> +	DTRACE_AGGVALUE_INTEGER,
> +	DTRACE_AGGVALUE_UNSIGNED,
> +	DTRACE_AGGVALUE_FLOAT,
> +	DTRACE_AGGVALUE_RAW,
> +	DTRACE_AGGVALUE_QUANTIZED
> +} dtrace_aggvalue_kind_t;
> +
> +typedef struct dtrace_aggvalue_bucket {
> +	int64_t bucket;
> +	uint64_t count;
> +} dtrace_aggvalue_bucket_t;
> +
> +/* Quantized buckets are supplied by the caller through dtagv_buckets. */
> +typedef struct dtrace_aggvalue {
> +	dtrace_aggvalue_kind_t dtagv_kind;
> +	uint16_t dtagv_action;
> +	uint64_t dtagv_normal;
> +	dtrace_aggvalue_bucket_t *dtagv_buckets;
> +	size_t dtagv_bucket_capacity;
> +	size_t dtagv_bucket_count;
> +	union {
> +		int64_t integer;
> +		uint64_t unsigned_integer;
> +		double real;
> +		struct {
> +			const void *data;
> +			size_t size;
> +		} raw;
> +	} dtagv_value;
> +} dtrace_aggvalue_t;
> +
> +typedef enum dtrace_aggkey_kind {
> +	DTRACE_AGGKEY_INTEGER,
> +	DTRACE_AGGKEY_STRING,
> +	DTRACE_AGGKEY_BYTES,
> +	DTRACE_AGGKEY_STACK,
> +	DTRACE_AGGKEY_SYMBOL,
> +	DTRACE_AGGKEY_MODULE,
> +	DTRACE_AGGKEY_USER_ADDRESS,
> +	DTRACE_AGGKEY_ADDRESS = DTRACE_AGGKEY_USER_ADDRESS
> +} dtrace_aggkey_kind_t;
> +
> +typedef struct dtrace_aggkey {
> +	dtrace_aggkey_kind_t dtagk_kind;
> +	union {
> +		int64_t integer;
> +		struct {
> +			char *data;
> +			size_t size;
> +		} bytes;
> +		struct {
> +			char **frames;
> +			size_t depth;
> +		} stack;
> +		char *name;
> +		/* User addresses include the target PID to disambiguate ASLR. */
> +		struct {
> +			uint32_t pid;
> +			uint64_t address;
> +		} user_address;
> +	} dtagk_value;
> +} dtrace_aggkey_t;
> +
> +/*
> + * Decode all keys in an aggregation snapshot.  The caller supplies an array
> + * with capacity for dtagd_nkrecs - 1 descriptors.  Returned strings, byte
> + * buffers, and stack frames are owned by the caller and must be released
> + * with dtrace_aggregate_key_free().  Zero-key aggregations return zero.
> + */
> +extern int dtrace_aggregate_keys(const dtrace_aggdata_t *, dtrace_aggkey_t *,
> +				 size_t);
> +extern void dtrace_aggregate_key_free(dtrace_aggkey_t *);
> +
> +/*
> + * Decode one aggregation value.  Integer values can be signed or unsigned.
> + * Raw data points into the snapshot and is valid only while that snapshot
> + * remains valid.  Quantized values require a caller-provided bucket array and
> + * capacity.
> + */
> +extern int dtrace_aggregate_value(const dtrace_aggdata_t *,
> +				  dtrace_aggvalue_t *);
> +
>  typedef struct dtrace_print_aggdata {
>  	dtrace_hdl_t *dtpa_dtp;			/* handle to DTrace library */
>  	dtrace_aggid_t dtpa_id;			/* aggregation variable */
> diff --git a/libdtrace/libdtrace.ver b/libdtrace/libdtrace.ver
> index edbd5a1d..87d561b2 100644
> --- a/libdtrace/libdtrace.ver
> +++ b/libdtrace/libdtrace.ver
> @@ -8,8 +8,11 @@ LIBDTRACE_1.0 {
>      global:
>  	dtrace_addr2str;
>  	dtrace_aggregate_clear;
> +	dtrace_aggregate_keys;
> +	dtrace_aggregate_key_free;
>  	dtrace_aggregate_print;
>  	dtrace_aggregate_snap;
> +	dtrace_aggregate_value;
>  	dtrace_aggregate_walk;
>  	dtrace_aggregate_walk_joined;
>  	dtrace_aggregate_walk_keyrevsorted;
> -- 
> 2.43.5
> 
