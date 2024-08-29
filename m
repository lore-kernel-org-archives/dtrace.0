Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468F1DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909220; cv=fail; b=Ii7WhgBXIrIHclHgj0PvjXrQDfAtZ/c2FeSiNXn6ZqDsenxmOxBJhwgvX8NOo1JyM0MnVDhaoMRAlQhC4KSSP9ycDj4hRyXkgiopF9MvxagIBL/vmN+jDghyrAfkdsgwITWK4EEDd/buTlU6sFz6ARY8y+q7panDyOLz1RXBQjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909220; c=relaxed/simple;
	bh=HZv/Klnc+puTf/2MtlSFYssG7T/UX4jqjXXz7isS7dA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=esIDKaXltIe46PMDt0CoKV0wL6L3eB8bQvO3DyvkoRUXucRDUoLb6a61/43fMZ9y5b6vXGnIO96N1u46/Op+gl3mG7mLKWqx5zxFRm+P00WlaOCTovKOV9XMqvYtm1b4qb20BtHDNw4vbNvi8t6VVd9lq12gfakfU35q6ioYI4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rr9yXEWV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TgVf/S82; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rr9yXEWV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TgVf/S82"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1hO7W014986
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=IhX3WOAzjMdB5g
	EJ2qvVd32UeTSLHN/nwrJhEkOhSKQ=; b=Rr9yXEWVQ18f7GcLVPvENOSdTNA8/u
	3783oPPqhorjvzHt0+QdIeMsiBLCnruSRuU9t/YtM8Lv6zJoK0VXgZC1f7COVC6F
	6EgyQQQLCJ5qZl+nnoEYzmMFF4BnFzV06apf0KvVwrC6T2ql3ejeHTW7/IeBOm70
	un1eBCD1tgFzYcD/F0KbuYlUGs47NnywN0ZtjpRIxP2tgEO+YjPhDSFup+oEnLOS
	rlPFCAPRuH74UrN2WyTLwrCzsb34F5tbRhQXFRzLYHLHkjQDIIGiTWPcMS94uhiz
	GedGDU78KT365k3VlJeCKiUIsqVje2Rya0Vxt333yKJYnnhcB+j9NIGQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukk772-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3XXhb031839
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:56 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w85qg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzoUguzHweSnjMtdTaNvw9fz6McUDmYWoN+PzpcKYUeuIa8eHcwdykBLq0Bu+lsFo2WdFoWUbbPReyr1QURBAF5TV+MqxejlamA8+Zo4w4fzUSzeUrTVhB5htr4kSnVh7PldGiduOb4JJY7wUUmMQp3TrLJbiUr2U5gcGG6XHeEHBc37C1PomydYjRgzkY/Vr39knJm7Msz1zPNNvJrFmlXNOm5wVma6NO725cSz0ysowhwH8diqFdqn0rPIedjn3UCkjRnYGJlxRMbmEtiIh0bnI7BFPho1TAkpfe5goDblOa7piTLnOJsUNUXgsNkQs3TAmRwY0NVnBQN1xe1cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhX3WOAzjMdB5gEJ2qvVd32UeTSLHN/nwrJhEkOhSKQ=;
 b=ClESEZSN2GP+Nac/2awTcuKb53Q1Ze17qWqCJ1YphiEPx9IrAIy9R45ncAMkRL89uS9ZBIQD5AKWNojwpQp6rDEmrNE3c/uic/YhkwxRJ+IKC6osEg/bubj11c/Bqa0Feo/TcJa5zC9ozwCXSZ3o338Lk+v8+zq9lFWhOP+eaTHgoXTAXq/tKvvAwxbF08iwPKNzNEdIkLWdciDPMkR5Dga1DoKQ9eYV9nlZ4WTcKeeGx7qNwTWl5X4j67Yg2Ezrzfmc7gpyLcgBy4ChVE2V9taCEe21QynZ13tjktPfLHCu53y2IsB9KqMFxTkFnl8eX+nCb5VoPBGPMs1nF6IuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhX3WOAzjMdB5gEJ2qvVd32UeTSLHN/nwrJhEkOhSKQ=;
 b=TgVf/S825pSl2HbCxyIgEaxj2qZrTmIwpwRFJ8PUYPpzIPTXtCOW/G3YXvwMYSrJZN9ndI7F+mesv6pmjYpkpUofHrS2oUNNi7e6caN7rdtyZaMupu7GRcRBV5XyPn38guTNGYDF8nIkb1XHLp1geCq/Gv8WwV5ZW0q7wYiIt54=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 17/19] test: Add a pid-USDT test
Date: Thu, 29 Aug 2024 01:25:56 -0400
Message-Id: <20240829052558.3525-17-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 7955406a-c769-4a7d-4fb3-08dcc7eb3046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xCHzOLJTw9p0PwG4W6/iboFA+We9Gv4SO4nqvtKBgZEDHLVzTh5LyTLBt+aB?=
 =?us-ascii?Q?KpwkFhTpJZV+oGGyX5rMSlRazSIEccUVtiiNiVKVas3SQPaNxWpLWGwKyni9?=
 =?us-ascii?Q?V8Ddgy+yaQS6PZCzawSblJJmUaXRyDcmlfkc1DcF6rq2BOeORQIED99957VS?=
 =?us-ascii?Q?xOQo2Zz/7FRsPh3TPHWoq4MEeFKk8/rxST1aAXtRXwAR3aFXvt6z9OURHLEA?=
 =?us-ascii?Q?/Liad9sQkQPtCQKwrtRFzOXB6nYA6QCn8C/NWBl+AU98OKXiMGwBMv/a/JSJ?=
 =?us-ascii?Q?6xCnICdyScJWUIGQDToGiXECE8lhMikkv7b6LVDvL/3zXKoqguFlTnkqdo6D?=
 =?us-ascii?Q?Rw3mS5DH9MPKYr9fdVQmaV3CBOYv5GGXKtYNrw3iikhKJqzUbKaJzJEVZPWJ?=
 =?us-ascii?Q?t5pWGL80pqSwdhJNkThqxfdh5Ov1apjfxdBTPuoCwFZ+PVFzgwNU4M01beMV?=
 =?us-ascii?Q?b/SMM5kkTc2sskZk7sufvrpZW+9SJ5xrZQeJvARb0cnJhTeRHyL7in1gjQXH?=
 =?us-ascii?Q?ybdv9eyw5H+97Ke91JF/8peVLlD0jD98whgsxpkxauiv9IOKU0gHi7rb8BjZ?=
 =?us-ascii?Q?NuXI4oGQQRRzW6/nneUlF7OH/0RY6WdtzOp/Iw/4sgh5pH+VSKWVS6hyiLr0?=
 =?us-ascii?Q?5z8MJoMMPV3ry1zuZspqGvFV/tbMwtz31uStyRIcBhzflA61ctPzwQlLG71n?=
 =?us-ascii?Q?Nui0ZBRooBB6uGHnQ2kftmpFiCydLCkirnOeFejNbya7tsSy7JZmebZu0svT?=
 =?us-ascii?Q?/Y/noW/YmJf3u9FpeEjBv9Lz6HF5BXOjZsZSnNNFGMY/YaUxTMAbUcpgr3GU?=
 =?us-ascii?Q?7rqrgKJzhNTBWzgDyn+/ax1+qEVG1DqwtObZdDwt9w9753mTRQYa1ln6CqFT?=
 =?us-ascii?Q?BFVGp0qmJZa5czth538bWFbAwsSwXue5Z3H2AW5dNreGA68YnN0fpHW+zCef?=
 =?us-ascii?Q?txHKPN53MxDUBxQTv6CbgLTwOfOIW8zAoD2IS0LFzAcNY6nD5Eu9OFIvFgsn?=
 =?us-ascii?Q?9w1/vy21faTBVHqnC4NMcayoJ7bWCrSwAg18DX3puH1dnsiQ3z1tMjEMl4Jv?=
 =?us-ascii?Q?b4MVJrH9ZGmbNaoK98CFzm2JMIyE4TnXpyr2EE7NlcSCEmKaBEr1zWKlmXCq?=
 =?us-ascii?Q?eF/IkRil8TgNLWQQrvP5PDdFmuLlxPS0EbW84mNrtv0CCgmChFaUXtEexf2J?=
 =?us-ascii?Q?BQ89ytRl5ZiHDsrs8/5mJ7HZdP7LYK2JM2HWQOlshRXrNz2mLhhgosILC9vD?=
 =?us-ascii?Q?z/SX6UYuc+3wLDoRyZygx11rlbtltaFXTJAVa4xldH9cEnXC7zGwz8dWYgFB?=
 =?us-ascii?Q?n8w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V8YTtSuxS3jHTr/75ux2V0SsYUSqopsU8Hv2iR/mvGLi0SlDP948J7B0jaP7?=
 =?us-ascii?Q?dZLS4MOZ0bj9L2HME3X7e7ooQfjrZhvwMy0q+fq17WRKLieH7c5t0poVq/Cc?=
 =?us-ascii?Q?dHiQBwi7PVQ4xCrpatE4X2EictbajSguYQn8VNqtA7aIGppNYN52lvt68FWn?=
 =?us-ascii?Q?wFbtQHWIOe1zRJmnuAv8J+Zw5UdJTFuOmFIsuFspTVmjMLGwC+5oagU4UKGW?=
 =?us-ascii?Q?icla4T1n5cCgdDOAA4FfMc5Eim/TaPHODA/XL7etg8U1N4USeC8tVexSROP1?=
 =?us-ascii?Q?fv3nLKW6rIDkOLtyGtlFPuMA+E/5FCzGfFYukN/4CahQy+DAW8k7qlRou6cV?=
 =?us-ascii?Q?3e9D/m7uXLVElxc1lR841Azy1/hizcHDQ6g/RGJZgkzs0Wb9s7IhzVbeWpBl?=
 =?us-ascii?Q?PtWJoQsKSeN8EPaYVKLpboD65Xc/hAGv7cs7ZULT2afo5g10b+/apAWfU4ss?=
 =?us-ascii?Q?QD1zndD+oSKneE+uJzjNUB7UZoj/oblTbXSa5JzvVQ6q26P21htgxQZ8tT/Z?=
 =?us-ascii?Q?oICvmZ1N6ri741YKD4J8Usk6IDrvbmYOx4vkmoG0xILMgOs/e2eTHaP3zYQl?=
 =?us-ascii?Q?5SL3zKeYrOZNt4Dzc4A/YQfbrSHXfnqqgDIPwvCGaUyJMQR/e8UH0Gb5f54Q?=
 =?us-ascii?Q?3YsFcAssPBVFWeSCkEVj5A12yNpc30rVJuGZEk115twaI/HUWIshPyBbY7LI?=
 =?us-ascii?Q?ZcMPHDf4JJN0MI9iXcPZg5SFEYtiKBgv9lRHIWvcMwZrvYcALR36835l5uzH?=
 =?us-ascii?Q?9ld8mUoD4EJbNTh05YjkxW6/ru8GCxkNr3YDRuT5hNeIR5gxGpr1f+ZRPdyt?=
 =?us-ascii?Q?rcA+yio7kBh3dSmEfP2xYs3dQEYYQAZxjs2AKWbpZTXl9bhejGWY5YsqwjRX?=
 =?us-ascii?Q?thXkOISr1FDInvX6Tu5KNY3SnbYiODKVhHZAiUoAI76yk4sEpubx4j6Cmlaw?=
 =?us-ascii?Q?gYCQ/YS9130aHNIBsKCCh2LlE74cELIp2HynzBFIActtRDc9Q+IZ+HRdPQNk?=
 =?us-ascii?Q?LV3li5V44EfcvriN8VZqcykingOjNddAIyP4eEe2kEBsURHqN0PL9aP83e/e?=
 =?us-ascii?Q?86SfkIPI/+FUbyTdBV7e6TnTK0SI3OTQUmhU7UITJXvmkh5GxurCfcolLG/N?=
 =?us-ascii?Q?TZ0exFvdfbDbV3Br/rm6jUl+07uMTvsnSk4OWY+PeGrfNs5hg2m2EOhxnJqv?=
 =?us-ascii?Q?0nZrjL3vDKGouJ9L0mvUJAjrm8IHpBfWqQlQ2fH61N3MhTrYdP38SlCs3NFa?=
 =?us-ascii?Q?6X+oOV+gDsyxY+cUPxZpkhmfmVvompoNHqr456eg8GqXRLVQu7zzSR6BNChw?=
 =?us-ascii?Q?e2GpQJrOSaFkG7dsNteD5hBiDPU/yHUftfPu8tmhg5S2xeX8sbSdBovv5Ve6?=
 =?us-ascii?Q?Z2VoYfPgc1o+kR5nUoyCJkPP+tVJMm8b95t4OsYCd5C95Vytj+FEKTlHpYYy?=
 =?us-ascii?Q?0zqXuGlRgaEd4fg46GYCvpbJtmwl2feC1Jbuepkp5fiC08/kQWRcMJtU3ut/?=
 =?us-ascii?Q?ewgr/gqmNDPWq88D3LCFBqD5HfKLB9YWm3hp+Gfb3ikD8AH9VwjDh5ObzFtx?=
 =?us-ascii?Q?PIRiiHx0up6n95KOhkb4Whzfj7xQQ+k6cv66XSlL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	akmKG6LD5YC5wuy1cEs8WRIs3GIz0UHTjPLGQyTr4l+4x/1YW8VJBjVOLPc+B8C+c9jxj7Ku+pW1gZyIbspUEQk5yS5Kf9G/zqSGyEpBb1yGZNc6wC0CtshdcdVmh9PxSj9EChFTavh2X4wZuPxIdPctTxkP4y0bV4Gi0iWvkRleBm8MBEnrX4H4Urq8hsgLWoDlMUk066M36nQBwothQpz9nOse5DBbbHn3XIsCgj7P+p3x+hsrTKlONCYLWPv7i4S+hhlRfMH7+0MRmF4s081dm11nStI+vKmBj0lJrfSGkySky6nsOzD+iLpfWtftWOnoGz6eg6CGKkHMjw3nQOMHLDYNmtg1mDEwDnCynYHCx2A5CipM9gZBJjoguLsbZyzrKKcnPPa/NSoSpTvi6KT+E8jc9l/w7odHbBlLlivUDpRhu85z3LLgSUaIhHXvmHaFaqYHtZ3I3rlAzuWc01PRPVnewVDSOdg6tu/IUnMl1aUF7gG+jfqllSEyOZYlFHqmZBd+534R6sC7z0kZcHA+xkt8HCcq2Nh0XxGh9XXXW+VjMIXwz8Nj4N/IjyuurzjVJ9GpxaNPJF7ERYeBXVhc0ADne7788HL92f362tw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7955406a-c769-4a7d-4fb3-08dcc7eb3046
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:52.3126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL4AmaSf+ar+0TER9ojnvOtdB5SUZDpPNQpTSxi/RHnS01KC1E+DMWJuWWdzBzRb/8/dnRGUXHShxCrnQ0/0DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: Rfi33oVMEZTH7r4rljP8wl-dVMGsxEU7
X-Proofpoint-ORIG-GUID: Rfi33oVMEZTH7r4rljP8wl-dVMGsxEU7

From: Eugene Loh <eugene.loh@oracle.com>

This checks that pid entry, pid return, pid offset, USDT, and USDT
is-enabled probes can all coexist.  Specifically, pid offset probes
can sit on the same PCs as pid entry, USDT, and USDT is-enabled
probes.

Note that PCs for pid return probes are apparently in the caller
function.  I guess that's due to using uretprobe.  I'm not convinced
yet that that isn't a bug.  It isn't what Solaris did.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.pidprobes.r  |   1 +
 test/unittest/usdt/tst.pidprobes.sh | 243 ++++++++++++++++++++++++++++
 2 files changed, 244 insertions(+)
 create mode 100644 test/unittest/usdt/tst.pidprobes.r
 create mode 100755 test/unittest/usdt/tst.pidprobes.sh

diff --git a/test/unittest/usdt/tst.pidprobes.r b/test/unittest/usdt/tst.pidprobes.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/usdt/tst.pidprobes.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
new file mode 100755
index 00000000..7eadb9b7
--- /dev/null
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -0,0 +1,243 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that USDT and pid probes can share underlying probes.
+
+dtrace=$1
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Create test source files.
+
+cat > prov.d <<EOF
+provider pyramid {
+	probe entry(int, char, int, int);
+};
+EOF
+
+cat > main.c <<EOF
+#include <stdio.h>
+#include "prov.h"
+
+void foo() {
+	int n = 0;
+
+	PYRAMID_ENTRY(2, 'a', 16, 128);
+	if (PYRAMID_ENTRY_ENABLED())
+		n += 2;
+	PYRAMID_ENTRY(4, 'b', 32, 256);
+	if (PYRAMID_ENTRY_ENABLED())
+		n += 8;
+	printf("my result: %d\n", n);
+}
+
+int
+main(int argc, char **argv)
+{
+	foo();
+}
+EOF
+
+# Build the test program.
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >&2
+	exit 1
+fi
+cc $test_cppflags -c main.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test" >&2
+	exit 1
+fi
+$dtrace -G -64 -s prov.d main.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >&2
+	exit 1
+fi
+cc $test_cppflags -o main main.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Check that the program output is 0 when the USDT probe is not enabled.
+# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should not pass.
+
+./main > main.out
+echo "my result: 0" > main.out.expected
+if ! diff -q main.out main.out.expected > /dev/null; then
+	echo '"my result"' looks wrong when not using DTrace
+	echo === got ===
+	cat main.out
+	echo === expected ===
+	cat main.out.expected
+	exit 1
+fi
+
+# Run dtrace.
+
+$dtrace $dt_flags -q -c ./main -o dtrace.out -n '
+p*d$target::foo:
+{
+	printf("%d %s:%s:%s:%s %x\n", pid, probeprov, probemod, probefunc, probename, uregs[R_PC]);
+}' > main.out2
+if [ $? -ne 0 ]; then
+	echo "failed to run dtrace" >&2
+	cat main.out2
+	cat dtrace.out
+	exit 1
+fi
+echo "my result: 10" > main.out2.expected
+if ! diff -q main.out2 main.out2.expected > /dev/null; then
+	echo '"my result"' looks wrong when using DTrace
+	echo === got ===
+	cat main.out2
+	echo === expected ===
+	cat main.out2.expected
+	exit 1
+fi
+
+# Check that the program output is 10 when the USDT probe is enabled.
+# That is, the PYRAMID_ENTRY_ENABLED() is-enabled checks should pass.
+
+echo "my result: 10" > main.out2.expected
+
+if ! diff -q main.out2 main.out2.expected > /dev/null; then
+	echo '"my result"' looks wrong
+	echo === got ===
+	cat main.out2
+	echo === expected ===
+	cat main.out2.expected
+	exit 1
+fi
+
+# Get the reported pid.
+
+if [ `awk 'NF != 0 { print $1 }' dtrace.out | uniq | wc -l` -ne 1 ]; then
+	echo no unique pid
+	cat dtrace.out
+	exit 1
+fi
+pid=`awk 'NF != 0 { print $1 }' dtrace.out | uniq`
+
+# Disassemble foo().
+
+objdump -d main | awk '
+BEGIN { use = 0 }             # start by not printing lines
+use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
+use == 1 { print }            # print lines
+/<foo>:/ { use = 1 }          # turn on printing when we hit "<foo>:" (without printing this line itself)
+' > disasm_foo.txt
+
+# From the disassembly, get the PCs for foo()'s instructions.
+
+pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
+
+# From the disassembly, get the PCs for USDT probes.
+# Assume they are the first of several nop instructions in a row.
+
+usdt_pcs=`awk '
+BEGIN {
+	# actually, pc2 is never used
+	pc2 = -1; is_nop2 = 0;    # pc2 is current instruction minus 2; is_nop2 is whether it is a nop
+	pc1 = -1; is_nop1 = 0;    # pc1 is current instruction minus 1; is_nop1 is whether it is a nop
+}
+{
+	# pc0 is current instruction
+	pc0 = strtonum("0x"$1);
+
+	# is_nop0 is whether it is a nop (these heuristics may work for x86)
+	is_nop0 = 0;
+	if (NF == 3 &&
+	    $2 == "90" &&
+	    $3 == "nop") is_nop0 = 1;
+
+	# check for a USDT instruction (presumably, the first of multiple nop instructions)
+	if (is_nop2 == 0 &&
+	    is_nop1 == 1 &&
+	    is_nop0 == 1)
+	        print pc1;
+
+	# prepare advance to next instruction
+	pc2 = pc1;  is_nop2 = is_nop1;
+	pc1 = pc0;  is_nop1 = is_nop0;
+}' disasm_foo.txt`
+
+if [ `echo $usdt_pcs | awk '{print NF}'` -ne 4 ]; then
+	# We expect 4 USDT probes (2 USDT and 2 is-enabled).
+	echo ERROR: expected 4 USDT probes but got $usdt_pcs
+	exit 1
+fi
+
+for pc in $usdt_pcs; do
+	# We expect all of the USDT probe PCs to be among the PCs in objdump output.
+	if echo $pcs | grep -q -vw $pc ; then
+		echo ERROR: cannot find USDT PC $pc in $pcs
+		exit 1
+	fi
+done
+
+# Get the PC for the pid return probe.  (Just keep it in hex.)
+
+pc_return=`awk '/'$pid' pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
+
+objdump -d main | awk '
+/^[0-9a-f]* <.*>:$/ { myfunc = $NF }         # enter a new function
+/^ *'$pc_return'/ { print myfunc; exit(0) }  # report the function $pc_return is in
+' > return_func.out
+
+echo "<main>:" > return_func.out.expected    # since we use uretprobe for pid return probes, the PC will be in the caller
+
+if ! diff -q return_func.out return_func.out.expected > /dev/null; then
+	echo ERROR: return PC looks to be in the wrong function
+	echo === got ===
+	cat return_func.out
+	echo === expected ===
+	cat return_func.out.expected
+	exit 1
+fi
+
+# Build up a list of expected dtrace output:
+# - a blank line
+# - pid entry
+# - pid return
+# - pid offset
+# - two USDT probes (1st and 3rd;  ignore 2nd and 4th since they are is-enabled probes)
+
+pc0=`echo $pcs | awk '{print $1}'`
+echo > dtrace.out.expected
+printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
+echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
+for pc in $pcs; do
+	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
+done
+echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
+echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $3);}' >> dtrace.out.expected
+
+# Sort and check.
+
+sort dtrace.out          > dtrace.out.sorted
+sort dtrace.out.expected > dtrace.out.expected.sorted
+
+if ! diff -q dtrace.out.sorted dtrace.out.expected.sorted ; then
+	echo ERROR: dtrace output looks wrong
+	echo === got ===
+	cat dtrace.out.sorted
+	echo === expected ===
+	cat dtrace.out.expected.sorted
+	echo === diff ===
+	diff dtrace.out.sorted dtrace.out.expected.sorted
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5

