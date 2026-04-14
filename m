Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AD25A2C9
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202289; cv=fail; b=mSHKtHGpmf93SFIXT0wXvjmbbwJl15ii+johdfMXgeO8i6vAbg2zGnb7f1Pt5tTz7zmj9ui6iG4v70pixV989FAFemoKhclIFYZMcQiePYTzgXhEioEHEhtLcoj/CAJyW/KSlrf/m62P/B6f3fb3bgGIu8parqR7a1qAYUzFFOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202289; c=relaxed/simple;
	bh=29YeNJ5uYwoRyGZnhqJBizpVmJcJ6OgWs8LhONzQunY=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=UqWgAMf4TrTa4P++jhrFOeQiqeeuFKNmr2+imAFv5xunkg0E7fHvgr5X5SGBV0uxJei2DAJ9w8vJOskIW0ZMiUVEZeZYQAIVhuUGvcJ/IGMXjIIsqrsQGuxxk4a/CQvQ9kTzxuSrUBtak0MdPAG31IDU0wb8RZRjjqt79fJjaSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=W6TTBq5J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OHG8S8of; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="W6TTBq5J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OHG8S8of"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EKfkUH4056096
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WP9laui+QoBviqcnPb
	l+lIM7EIalQSD9xKmMVvYKL6Y=; b=W6TTBq5J3OKLOwO2iin+gea+kpdtasEf76
	ppo5xAsJWtGT+5sOZQSz7NDAo+G6kjMAbjGdxvsomDfM/XDVyaSF3GiECjgRxZWM
	v6UjxXCJKvk1RUtNHcZW16qT3WbilKSFQ1IhQwPREHxF0wnUDGu7nBXpvCwyJxWQ
	cN38AvLcbyrwrUhsOqNUZxy+qsuWEcUF+AVKqDKhq8knxJ+qQB01HTWDyS1C8cYB
	6Wx53Q6C4mOgH6z3dGSRwWDb4csAxKTS4FbWVi6Qjixnp9eXF17NGNMdTPvT/i88
	rxqEA/pQZSfW4QOaEFHtxkprvcZGR79SpZVlkySJdfC3BCJ9vrdg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qbqaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:31:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63ELTQLS028980
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:31:26 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nn2757-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:31:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWBEY0vObo+pCdYxwkr4kLgmL/nUaL0PiuVRXp/Q60vtALagBylKQZyU2ZgmesCqvXDw+lW7lB3/F79LiBP8QdfId1d0B8ZwfyA3FcjkyHCSt2YliaBlStCWTGKzKHS97RmOihH82JJ27dORwTQRi4Lxt3Knq9jYUyR4rgW67VcvWjC/gf30IC/BiauXntbJr9iEUJYkqhnKPgWC7XTuq0wGEmvYuy8YxZayeV39xKzVwwN/2U0BT9rDqnuphIgfwc02O8EQXKzuPs1QY2slQrirFHKOQtD/1I7UVNkI6MJajgKrKrxwuqKHdMXeV7fPO+boIiNTB5SRDjSgAO/JcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP9laui+QoBviqcnPbl+lIM7EIalQSD9xKmMVvYKL6Y=;
 b=OY05evELecD7BpzpM2YViTUOdr5rPWABLFtgPcrxkK14WHo04foKvuGLv0L3u893B5ndXgLAPkIoPEuNkzKQlfT0rQrIG98tav16UEo531pwbIB1cuBCvFgIQPeIbSWvzRPDi/gcPNeOlelVoK9TRZnZ/2Ta1iNV7Yalc8pTRAfiN93iZaQtzdtZPM/MWB5bZB1LUuvhrsyfwXtn82ud5GujVprgllL7iUjjbUQ+dizH5gNQtsySpSxmBl8ZeHQ2qL2dHOwtCNv0TeZFJwcfQ6F45ibeydvib7+GSXflbCWhTu91oh4gwuJ4mUliaHIeCZfOSqNoimF6e7QqhNVnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WP9laui+QoBviqcnPbl+lIM7EIalQSD9xKmMVvYKL6Y=;
 b=OHG8S8ofOWBMiIdpDobfi4Y8w9w6V8RNPeRNFlqlnRCJe4aD7aHqCdFSC28qnTn0Lh30hIujYX5g7t5kC/DyOGEHLcI9ewmPBriRAdxlPgdo579JkwMF3cPXV8LuVeIyFewkbjpge+Yag6DUp1QQMMK367U72zL5K63T2ImaJtc=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA1PR10MB7141.namprd10.prod.outlook.com
 (2603:10b6:208:3fd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:31:23 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:31:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v2] Fix flowindent for "return" probes
 with multiple statements
In-Reply-To: <20260330011343.8596-1-eugene.loh@oracle.com> (eugene loh's
	message of "Sun, 29 Mar 2026 21:13:43 -0400")
References: <20260330011343.8596-1-eugene.loh@oracle.com>
Emacs: well, why *shouldn't* you pay property taxes on your editor?
Date: Tue, 14 Apr 2026 22:31:19 +0100
Message-ID: <87eckh2pqw.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0002.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::7) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA1PR10MB7141:EE_
X-MS-Office365-Filtering-Correlation-Id: 11229660-0b26-4eb1-edfe-08de9a6d2cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dm7CNKfpTVArUv8xU7vPAwVODI/gOYSMHbS4vnmQB0mGowlCFs/xbMAyyz38ZhXDWy56sM9bpvcHencBaDWeJYNcTGqhBOtsrcvLNvFButTBfyGIXpFpsV6GiCh/7GRvgkE1Q6Ty6BFkFG74rMsYSFFGYTHvxXUWZ/l0KT3w4ruc12gaRvLBthfUZgHPEfLMZW3ys39CsHEKK8Oc6wZHZrxdPuJOGMBKhRb7hdvsYt+4/qZ0rFSAPYzG7dr0o72xFzPyerf1rMnmuCFkIk/fgFcERUBQFjgc5TVROhnfekN/9/P9DAsyB1D0P2jJxG9vhRl6dDIk+AWG+DyrWLawg/4ifhTqrC0z3V+X8YLSCzZV4OPhJy6vpqZVlZCsdCo+S6UqNPdv7KnQiEks/bZOYG6/UudO/4MOuUIHpnfdu1biZ2jNloW/zhWCWgjsU9o4MA7hBZIaYfPNsZhCjRSkwMfL3tPwcExn+UELdB7syAwyZeZCTLuCOY1GcFDn6FmDtRFM6dtmDz2r0Qt8J17aXbAuhDqCCdXMp0RRcVI8y6bw04WpF27iT6MoykyS0RcMFxtgiciGYQVV/9Rcd9uKLFPMd1nYG8QAVL5w6kmGyUOAj7Saf51h1P84y6lHKMpb7dlkFHAKful4DLo8uxaof1rXp9Or/fE9ABrIb/7Ss3YzdPip9oDUEaWckh7sSiX0pwmK/LseMysvEY4BClnIaA7H2Up0/2iGRtzMuceWhLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fnvfdvfKcC3SuXy21j1jsMWEuz68UFspDrv5uciFJ7Zq57AcCAAhC0Xy26f+?=
 =?us-ascii?Q?v8b9P5sYeuuewGLrwUocdk58Gd6NtrNXwIwbSOvuK8i6L677BPDRpB2UvyDr?=
 =?us-ascii?Q?jFAXdD19DYHqpJo/1nDDnNYQliBtX7X6+FDVodXUhkB2Puc9jPVZKEkPj8W/?=
 =?us-ascii?Q?XLw2W3uk0QQEO8M79HIbpZMF527zN/hQq5slmhXQA9w5AEqRg3DPLBkQ7FDd?=
 =?us-ascii?Q?/rAgSYV5uVOG4mw4/B9mjYSR05CAKsRh54fEXA1rQNMKYj22RakD0Dr7oLB0?=
 =?us-ascii?Q?GAATsgtnkRg2c1RI5EH4mlRSJo+VkrMygjaaoZPZmb0o1/hvx02f24YAJgb+?=
 =?us-ascii?Q?rA1mn9zVfgVg8NwlqOLgnWcZP9WfVWq0aWTKjeXTK2ilY1WSui0un0QzLrTU?=
 =?us-ascii?Q?rRA/77ndYv2o/KF5Le6Cqj1dfalA7c3tJ6t1k2M2fXDCribyePUydzuQaJ+a?=
 =?us-ascii?Q?vEp4p+cZYD4WAXTqZctQ1XzyM/hovr+5yPnM5uTnC14f9CRLFMFXawOn/Z+s?=
 =?us-ascii?Q?xKiV2jOL61pfZaFVRQAo8O9YFuenTZUqX7fJbUp2HCJ1mr/6sr3UL2a+ASzM?=
 =?us-ascii?Q?dcMIrQZEeyyJo242vdj5MdTz+ZhrMux39sWszyE4kwnHo6JTvIcYo5806+G/?=
 =?us-ascii?Q?nJ4ZYJ1PweBd2QrStzNqkGZP5t+b3kEJxELC6kCRTNwe/CcwL9uClqyXKkLW?=
 =?us-ascii?Q?3fT0W++pYdaJQPyNWTjX2IjrWXgGtBJCPU6g9HSRhWi1PFBpUECsGbNO1uSr?=
 =?us-ascii?Q?sjkJ2A6pONTTJlTMdmSP16MqrQbGYghpfhQSovFpc2Jhd/qFJvJds+a6TbdS?=
 =?us-ascii?Q?GKSyCktMJUOFQvKSkYnU0Qdqq+G2U9cdoCO+y3e+3g5D5ecji/AXzj1qfPPT?=
 =?us-ascii?Q?m2l98zWyI0gOpkWsrfzDPV+Clp6RU0vNRjAchu6nJmH/fevp26/Vsl5lGrfA?=
 =?us-ascii?Q?kgBoaDsyeO0CuSHnpwy1B2/ulLoTpDGm28bFEy1zgpg2GoMPnD6B++F4f2As?=
 =?us-ascii?Q?e0JA2yFgYt2kj/EnhuwEwZJ1d8miCAs1ihoW4WmxarGVSI4kpz6wE6qcsCJo?=
 =?us-ascii?Q?+xiQjYzyPm8J7yzUfHAKrqb2dygQsnksvJ4A7+WGu0AHsKOlqvZrwGOvr+Ng?=
 =?us-ascii?Q?1ri3vMudaK9S1Aza4AM+ZefPbFikJqQ9l3yDVJ7cuBSDsX8mk2I9bZrvkNNp?=
 =?us-ascii?Q?cuVdPqXeZWAOG1YgyU4nG8MlyiRVYe1AnkA9Pw1C9Z/3kA6s8JJKIsDrf05L?=
 =?us-ascii?Q?/uCWyXWFgd1lQi4R9C/e6RLja2C/bdMWc2yILrKGXJd6iCzS9ptK9mCnohKv?=
 =?us-ascii?Q?VawOR/32qB17Yl+rTCxUPVY1yVN+Qdb+9GAuKBpEdhZ6pCGrm9fpXQT66wYI?=
 =?us-ascii?Q?GBEFdC7iULKTBA5iqciqpecCrJu8VNErcB9LW4FdVAaZmQDpFGxf6vht/fkt?=
 =?us-ascii?Q?t+40UieFTww0ZgNbQZJsalJyoOUIuD9oyMCWwjCSOAHwotBYUeSnbaY0caMo?=
 =?us-ascii?Q?7fNCK1el1v6wIB/A/LNg2l3IMkHiz4SXxsrDtPfy+lLuppjTm1+KiWh6n9VD?=
 =?us-ascii?Q?J8uSxY+fDL+hgwFam1N7K7RzTb6Sxlh8td5jsQhGAIvygaDcTwsLpquWee64?=
 =?us-ascii?Q?UouR/ssAQsyov7nckcv1Jj+Gb/z5kiO+l1kj0Q4wL2F+Wr6VXT5b4nw/Q2zq?=
 =?us-ascii?Q?siuLwgDbd/MMeVyOTYVecU/fwy8jqFL+qqRA3r63m5EomnMCuxv0zARQikoJ?=
 =?us-ascii?Q?P1JKv09rIQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	ht5qGs/8ujV+W1WnIprJ2iXi1zCVKvgxPr2hNXhW76EOiTGyRKoUFT9YWXmDG9JR9Ek23LFB7dUQS8i1ROKJ/qeN17tTDU6mfWgq/2LBWz7S3RCN3gsXQU0E0hfwc2m/tV5D0lbXOe4faaVrCrc/y9t4XeYVq48mIYuHARCkjAdqcpvgM9uCBcJ12rsQxJ+ouzdXqb8GoQ01Hycplf/VlSW8VbG0g1wfL31aOcnI/W+NeWShC3Ox15J0DgnJpUeNeHurxiMpLE5ViaAJhU/WQJbtB2d3O3iCs2hdg5ye1EO9/8PAbvOIIDibIYbwP+3q+YDn7rLUPsaG0yg1vwh7+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5D4tnGCTMJK1O6xQ+RgwxKdKNU1LOOt33H/P5NWnJcDuDobS8oECTWmKt0CSSX9i+mSaW//SncEtFBSRevnXQ9EIbooQ+P7/2+oQbgJ/H5asxQ/cySs5HzafClHeDPcjiumjcXoc0Z0j37X1A3T38RdCg/7ZAXGV9MjP9P3zMNFb+5zixFB9WF19YwlO3d6yto2nMJASA2OSQiiUkVTp2tNngCaJPnoDK66sMau9Hynz9/GbgUe1M32Sx/wsK/rHAuYlJen45fSMzHhBRVKVmzyL9vcCK+nw0usS61Bdt5kNxmnMgvjrhk0WYxnGPRedPm7z8X5Hc+JzmNscvFxEi9sYUPE6IIYw7vShP6rbxDLvUR8GNKGhgStuouODaeeYNwxzGuigX7ur73UKEyW066fhSSOtSdJ+gAMie8CxeKYwAt5J5jkTJ48X8nSyqFZnQnhSx/30TmNaWwTGx1zuqwU27Y1KbNrUOW4Z1cIktCOUdp7JOoO71RPnhldR4T3wbu6dLe4Pq5xhe6vYMoswG9QdpTzV5UbsC6QBQilA+CggJUfwtTIfUi0BuPAmidcZo2XETbEwY3btxpX3Qq44KdFWGLKX9A9OeHhm2ls0dCs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11229660-0b26-4eb1-edfe-08de9a6d2cd8
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:31:23.2178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bTnqVOmjvNRphveE+K9y2v1B69ikZvp/1py1RXH5yVgGb9NEgTt+OhH2B874nnxOdj2fpO+t0c7U8DH/ksSqFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7141
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140200
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDIwMCBTYWx0ZWRfX1byjWG6pp0+3
 ma8ezOGrlWJGIQQ0+XDp5zuHl6stPMNH8ZnbRNGzKCaxTVcpS0RFUOT8nJxImuCYK7uPEL89GdJ
 3+WJ3D077cI9LW1ZYY7PX/x9HnLK4dypqjTmAihGGa+GEGOQ9QyUZkZjVvFCWFYT4weawp1k2D5
 UTRWGzUj+zpGZRr9pEPVgDoHexB4nTnL6fDqcG1+v3hjlm3aberrKdzl76zNsGflIdaIRvkaduk
 wrX6HvmIKdr1AeejpYQZPcVCjkiwVYfHFCuVeOZnm5xDvnEc0scrMjaildRCCCtXCai7OZaMPwv
 +4Yblpilj2adtZ1AIezHDQQfOFUvBjF3+eXcPGGzpIxIyezQACbw0a5D2BTZxoD8h8vrhv30xwS
 q8DiTZDWOLjN22q+MnUb9/GSdQDTSiuVm8k6SObOSItNmuvcLKTTxyYjceZWMdfYRELV71H/hgJ
 qwAGW1LH5vGgmr4w79UaTWnlFmbsqsxSL7QTwakU=
X-Proofpoint-GUID: UjcdTjo3m8LYmcviV97CZ3VoHWFltdw0
X-Authority-Analysis: v=2.4 cv=V49NF+ni c=1 sm=1 tr=0 ts=69deb22f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=-WHWV3JbqKau57kf5uUA:9 cc=ntf
 awl=host:12291
X-Proofpoint-ORIG-GUID: UjcdTjo3m8LYmcviV97CZ3VoHWFltdw0

On 30 Mar 2026, eugene loh spake thusly:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The flowindent algorithm should change indentation based only on the
> number of levels of entry and return.  So, if an entry or return probe
> has multiple statements, the indentation should change only for the
> first statement.
>
> Such logic is used for entry probes.  Similar logic should be used for
> return probes.
>
> Add a test to cover the case of multiple statements per entry and return
> probes.  Also have it check a greater number of indentations.  Since
> the new test supersedes the old ones, remove the old tests, which
> were fickle anyhow.  The new test can still fail -- the flowindent
> algorithm is not completely robust -- so allow reinvocation in case of
> failure.  The intermittent failures of flowindent tests have long been a
> testing irritant.  Now, with reinvocation, testing shows no failures in
> 100 iterations on over a dozen systems.
>
> Orabug: 39140395
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

Much better tests!

-- 
NULL && (void)
