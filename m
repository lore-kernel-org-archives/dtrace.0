Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64412236F2
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202541; cv=fail; b=qTWMh7UZo18rP0QnUkMLctILOudOreVA7x7eiC+omBB549kNj1mJLWZEsA9L8wdzWUxl8+givg7/aUqggjn/DiDxCxXTHiT7eC2QJtHXuzvAtNo9nFwYQMtJTU5/D7odJI94OcxI2TuXv8U0UXJL97xKwNuR73qokMAnESpDmqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202541; c=relaxed/simple;
	bh=2w9KePk4z0v4N8UpayjJClvaR2se151tPKdFEeLIEXU=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=i3O/mJhygOiQrJKF+APGgGgd2o0vKx2xZ/owChdc70kABW5cqvu7f2aFCV+SmTPNG7/WxhluMxwj/QIF3AbkdgKKx8CbBFIiGukA+2gup4b8qQjbL57Ym9rF+iLx6LfdVk/csTaPogIGF8CCQf6ul46oHbOsRaHbcu3eJwiFAKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WgZND86r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=AXA3EGyF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WgZND86r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="AXA3EGyF"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EKXuJZ625816
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=k79BPqdkCYCUlKseuV
	p6uTGTkWC8Tm16OaR3gH3N6DA=; b=WgZND86rsthtZwMFDOqNS+ZoXbcNgiDNVH
	MIh6Dkfe5L2FJmRuX6WWUAuXHVNOhM5aoIQnrBy/3vX86ClcSjcPSaly1OQC6wBZ
	u9qLkAF4+ILa98A3aq1BG6e4PEmc+pPp7Pk1QfAnD+MBR/gHll/XtM6O7X8E87Or
	uXSD528MpFx1iepM83BKa9sLZhxnyv3EpKq64za+Vw7b0iO2h4W79sZgQ+z4TkV3
	4vG7P+9pJqZpO8NY4Dx1gsK9Y9r4tu5k4qZGIaeIFFTf94+S0YzTjAw7dV7KRBm8
	YHfjD8LpfiIvfPbZ+xzKRfAOZunL4mIZ8FiyeuEyc+Y5wNneffBw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh87h3mxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:35:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63ELYPbs036555
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:35:37 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nnabyn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 21:35:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTDxLQtteX4LMDgRRG8tInIcOEEjzpic+AQQP+7vbmJaVzYhODC13D+k/gebcNJ0yvuCPgk7W8PECr6BKOBJHnXCYElWMpi7V52EhRkuRG9mK0TtYyS9XTBmUMrdjPKpE+8iz2hVxCM25SSpNBYaG+WuXKwliuKJlvMuW/4Dd9zSN75MFbnItXFuWmxxatjVmtXgxQaEdymnCHG9hi3L4Rwp5A2vpXRTPSgBJHqguzC97hgajahXNqgnLLtxGzLOlydidlVSRccU7XbpWXFTrGWlmbkqbo2ATA+Mo92mlVjwxH4i/W1+1HZFCucbrGTYSAIqJlnAzsb7jCY39VcAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k79BPqdkCYCUlKseuVp6uTGTkWC8Tm16OaR3gH3N6DA=;
 b=xmeejmbl0wGsi8JRBe5p9xWKrJIFVXLDeqLqIjz2JyozKSErt/+PVB+aVehUwHOa7jhW8Eu0rFjr8iCNZKyJ9eAMUUxwali0E3DQSDeA2ErKKPKxL3rZ+vxyWjWKzP7FMOPP8xJ8WbO0beVZLW0sg7Nz1xqtl+65RDx5icFgTHjYnzHwG/diSvQcGOOh7X5X5Zp3iqSQK2fPP0+BdQHB8QfLLtSsxJYDZ3x3Jg6ZVev55nUF6YoM2FpFxdqr9g6R8YojK5FpdO70b4g2oQo7hIY4B11U9vhce2VBh2CpLCQ9ooY5J3u+pQAgvfk8RpobuVeycyZkAiykgvK5JzgDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k79BPqdkCYCUlKseuVp6uTGTkWC8Tm16OaR3gH3N6DA=;
 b=AXA3EGyFiZry8mAnD6Yv4rMyGJArB2ij7/bE8VBNEgmZwaaizwMGV2CTvd6HzHit65cSWEydwUdzoltvvkjdzLLtJclYLb9nz+liEL1naSXpcs2i5T1sYhVUdj1wszVsRUs76um47O/pGtPPm9w9SyTR8NQgYob+zNPMM+H7g4o=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH0PR10MB5577.namprd10.prod.outlook.com
 (2603:10b6:510:f0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:35:32 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 21:35:32 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1/6] test: Skip tst.depth.sh
In-Reply-To: <20260331010224.16165-1-eugene.loh@oracle.com> (eugene loh's
	message of "Mon, 30 Mar 2026 21:02:19 -0400")
References: <20260331010224.16165-1-eugene.loh@oracle.com>
Emacs: there's a reason it comes with a built-in psychotherapist.
Date: Tue, 14 Apr 2026 22:35:29 +0100
Message-ID: <87a4v52pjy.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0509.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::13) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH0PR10MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fe48228-551a-4c35-01a0-08de9a6dc186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	mrDQWxr5H3A8IOleGnRPtY1gYK2276PQkehS3VEp/eF/AxWI5vSNJxmSbz9XEbfMV3q2wpaKFkLIuF3uxKxbUZgCb0W2r9XDSRWwTuzulJPX2LErU8Ci2eVnsddcGYdkGoKArpquiDuMCkVM5S0bJa6RTMHoR0PDntQeDydse7MIpiWtzeMIGWm1crNGb9xgP5mcpEPQMnUZ5j3chXnRJvcjHZOldlxVjTyEQ4hMs6Q+JPkkn67JefrInWGTv1fXCevOVt9Qq4RDGf2QdzW0iDydhOaeRfmyw4xTxJgLtx9WDPfMbh50cY7UuwYmx5MBpeaCpVYcHv2a4QvuCIu8iBd5m/gdCUNdDms5KbLF6WsWSsLgUIZMwOgqe/29gvQvjyA8gxPmJIBRgp6ouX9tuw7vHaZ0uAB9xHCAtddvdkCQ1N/FMsDngD7nvpEXIwOjjKUUyfiT5EpdvI27ZKNZE+W2jw6QsFpWc5cff5sxjqYU8zSsqis/ibcxrQSTnMMFvJhduzibyGtuH5ESHpULM88jgnp9WzmxPEdWn65ViYWoFNyIfbJQOspLIh+EnVSrvDPaUL1Kh97kzzfg6uL0qfk6PSqDqqVtHOX7l3U1sLqSEEDT9vUGsb5qFDUbzg8VZsF6khoFRNDhOKQAsOPERw++egWHdEIve8SMOxnri3dbiEC5b9ZLbtKIyhVB73Dzx9RGzVzak8BxhP4xQjbSYOpjihLsUeRziyNkUjqVVtM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qIJq1Fnp7zB4vwOD5srNF6pYXuXXWig8URp4tVbXHuEeHWCqpMBkP0O44nXM?=
 =?us-ascii?Q?NO5Rh/lBPxstFfIsDaER+2x+/hZjhDwmNFHVf5G5YmPAwdHg8Oe8Qim+hayS?=
 =?us-ascii?Q?VlUYQrFHoL3laeuS3n0ONf6cXMNA5SHzWCWmUN2n8eGzLT1FtrlQgHQLXo7Y?=
 =?us-ascii?Q?Ygj4Aeb+Mu+3F/GDnyFkyIU3XqwUVGeAz3Qs88/NqvJi7HjvJWr7PsORyKx8?=
 =?us-ascii?Q?i/ORL85t/BwwzOD7L9QON4o3iREsTYBj+OuNZJXHWEyPFJItX5wLd5CpX9gD?=
 =?us-ascii?Q?um6EINLM5NGDS6M41fGeioHGKuH+8/8GC3PPyBLQDRR+2o4/L+mDSXC1oVz/?=
 =?us-ascii?Q?QWNKtl/Zya1cY3RYNpUz8xLmtEtj5hvvldCcM9vbFzJE4hpRAGagvwE67vTS?=
 =?us-ascii?Q?kNKhqw+fsyjYyAqwi/hpg5Rf41Pt0bvAC5sl7bSBL2B+2UGII+ptBpCEOm94?=
 =?us-ascii?Q?fJKNsT1ocxHhsuk5svmze9WZ086TiNYVDe/2/f3oO4Z1CfMbKxLUqOOGXfMH?=
 =?us-ascii?Q?gJnVt+1wBgFHZMqefPraoGYqVkjaKKJDWFOTiixPc5WuCu4HsOiIY6ajAyBK?=
 =?us-ascii?Q?avVrTUGCb1X8rg1GJp3EXyFRPS4+4eqP0XqPmx4iOwzlKfNJj+dvcNEcScN0?=
 =?us-ascii?Q?I+BtSYt+OloDOn0VvDoqE8Jy+gamGJMFlmku/hskhHbytnplgd0kNf532d1U?=
 =?us-ascii?Q?MlbX06ZguYH5NOvx/tWg8+0qqUmz5TSzQNsdWWa+/0yqkPAvu7HJwcGWXbFD?=
 =?us-ascii?Q?LFtkHnhBux0fesFyGdpauWMKro4eOF/ghQr1KJBSIdrAbRwZXFl/JRTYwAQm?=
 =?us-ascii?Q?KxiqHDvaW5n9cGfNtSkwell8d+6c7/TB3YwJ/chu46UW5boORU+N7z7zrZfL?=
 =?us-ascii?Q?ZMqMEX5uP7pvITu0TUZlmUeLcN6NOaqfLu/9Q4dyMoRkomm40CFHNRgAwtrz?=
 =?us-ascii?Q?I34DbR6XowW5xLPPCJN+20wjdURkVs6BDVJ3KqL5nuwn5IydGOqrmB5CYnJV?=
 =?us-ascii?Q?hMsfqxpJy3M8eIHRZIz8Mu9bN/aJpGpxnn8526DdY3TG7B3O/Wy92929lZnG?=
 =?us-ascii?Q?seyQVrmo49v/N0dC3gmsZaEfMad5e2CoQBee6Ts+X58v3HKZ2vuvaX3jNN3T?=
 =?us-ascii?Q?8FYL4hdjOH4XFWZaDsAhO4OblMwD+fkqt9BmRBvFIocH3DWECpOIYVd2psE6?=
 =?us-ascii?Q?rUvpVt73Pbu6IjqZ5FrwqV+ldstX08u2J3qL/f48JdY2+9KRN50qCFrzA9xP?=
 =?us-ascii?Q?iKcslsiRlL7K7mhvl5+3SCr8nSa/IyjrzjT0HDB0vEcXzKaS0TdX3ixLfFo7?=
 =?us-ascii?Q?5FshcTbkBSjtoyf3i8N+PN27BPbazUv0wa+DbDHdp7j4Jl9fWZpXTMhVNSuq?=
 =?us-ascii?Q?6M2fJxz6ujZgaVc9JVIpGOnm0V42ysLW9LsV/JyzXnQB5TRrOsirCIwYXEIV?=
 =?us-ascii?Q?waDFlc3mag+wel1xUDPX5L94PlEFGAF5UaEwx9/Itn0tyV/In9lIJS4+b9Qe?=
 =?us-ascii?Q?pDRmPc9TZ3tdVACHJVy2g391BIA5hwNCaLvV/EeEk9pLSZuZdUyauZ/N9USu?=
 =?us-ascii?Q?z9iAUCalbbzOVYDQVO/O7Na1nSYlF1uDtgRJAhAUbjYcttn0tlSBv5GrPrIu?=
 =?us-ascii?Q?xc/7px6tfbZydqbfnRsGhlIwS11K/NNamCMM7TmQR++sa4SQxaLJCCm9XRSs?=
 =?us-ascii?Q?9K7Hea0bAwDZ45qiqEetM3fOekEalojU2fsUE/gftrJTM2BmDTL4kNMmffxj?=
 =?us-ascii?Q?8n5omHUGHQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	J02Y59x9AthpLq52qoH2YRcmx27UtuW4UYdZwx1oBV8ij6lTqcVKHadm+qWl/mx5Rh8Jrq19zyW38knq0tuiMtMeuCsCvYbNH73s+xMI0gWsvtOGohDWDmS35P87Rpl3m5CmfOarYTQIHlQWKnxcEXRPQl6jk53yqfjHjzlkKTQDCiT0TeXEgsgMfuOJou60DF83m7aA1EPR3ofvE99M4K9fRyYgh5aeu3BEIs8F2O2INBys1H4VTCYL0XIuNORiXZdhqzkojMsMU2GJ8jF+ExYmzYus7uAI3MhH7RI1vREeCySF1lJRPnB42oM7FCVb+cQ+3NBokkoPt2TojdgY3g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aK3IgmAjJrd4h+Xi9vx5wcQu1YVPKOQ5oR1L/I6+i7HKRR1qNP2M6Hkrz4RruEk+60NXbV4+wB8Wdnh/2Ijpu3EC+4XXn8ekCmjp/fN74BkbCez797RCrDlGJt9+t0rdooLkriu1uk9PEaO2uTQQ7hDG8/hMENlYEruez5TBD6J6kPq7U5hE2D/nhEd97a3RetYeXqC0UhQONN8+Y3/XZD4AyE3sHp7P8HUnlFviEPn9uQQY8qeqY/tfRE0TMCZ5EMl5kzeyJXPNCHGNpJy9seXKMmQCOsjECc8IpHpAFPZ7/KCSH1r9FM2evmFqd3MHkEP/078WtKYAPIw7Do7D9eKZA51ZFPCTZZXDsMTCCO8WiO8FmtixaSKXQjR37Arq1Fep16/2DTQRV1tpNERyddJPyjMC9nVm+aSqJpucHkmxbdBbBNPbYFDHATmPq6D6bKBCcOfScA9hN8W6F/H1F6AgqMUh7wAPzbj80kKVKbj8B4qZtBkxW6nV8e8SHYpgfbzAhDXtNm0UeFKU43OeBMsvqoZQFLXzUD76upUlUH1uWUQ+EdheBcOmAetqCs7G2kV9Ueb8Y4WhDq2KQHjhJ7pDNNnvro5Vme8+oS2+/KE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe48228-551a-4c35-01a0-08de9a6dc186
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:35:32.3605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9eZe6pVQ2WhjLxEnMgIgy4BAJh4Jtkx8ZKA2Nx2PW1HB3VELZo27EfwyAIYkygOkXsM+MIegSgtIWQKJ5llPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2604070000
 definitions=main-2604140201
X-Authority-Analysis: v=2.4 cv=eJUjSnp1 c=1 sm=1 tr=0 ts=69deb32a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=YMjon_F9R6i68WZbWq8A:9 cc=ntf
 awl=host:13825
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDIwMSBTYWx0ZWRfX2zai/w/rqyTB
 W40/oR2hfWCwiD7Ioy/chQ4ckCsSqDTSYNb7pPSdTDMlYfNZw3FhFgVIn3pMm8N0cvC88KfjqMK
 k8liEbtsLvw0hqmi7dtSm1fm7FG3H/omMWDAhv69Bl4i7ES/bt6SGA6S9xeNqXiqeR15Wip7dMq
 2F8BoYQsJtgvZIqiyhFcWY3FNtAJCPvA63W0bCrL7IBTYu+GCCQQIDMiPwGjqFKz5GkKr5Vo3v7
 BY6pK03Kn9Dn4vTmeSXBeHqxTOkqp6UaWdmLZeMfMQPTqdXiO9GQPpjbv5GVEilJ/V34asA2egw
 5VheyRZ8hJnOTYvuRXQRg1It2H6j2+OGQllegeF17HXNm3fK4gLY9dYvTTToJy39TlsC8WFhHEJ
 CF0H3QimD8CMQEFd9V0O4wGKYFIA/qYethnwclkxLCd2csT87g5JmgcgLtlwoe0zz5SXSTY4R4l
 2pc7O52JoW3Q+auLnBc2DiPyPRy/8R2i2R+hBq0k=
X-Proofpoint-ORIG-GUID: vXyd1RwavyCl0j9S19ltFQzmTCDFLw3L
X-Proofpoint-GUID: vXyd1RwavyCl0j9S19ltFQzmTCDFLw3L

On 31 Mar 2026, eugene loh told this:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> The test asks for very many pid probes.  E.g.,
>
>         pid$target:::entry,
>         pid$target:::return,
>         pid$target:a.out::,
>
> If it is successful, this can wreak havoc on some systems, in some cases
> leading to 1-2 dozen subsequent tests failing due to cascading problems:
> poor test clean up, triggers left running, persistent loads, pid=0 not
> running, tests timing out, and so on.  These problems require
> investigation.
>
> For now, skip the precipitating test.

This sort of thing is what the tagging system is for. This should
probably be a default-skipped tag instead:

@@tag: skip-default

And add

!skip-default

into test/tags.default (not currently existing).

(The same is probably true of most of the other remaining skipped
tests.)

-- 
NULL && (void)
