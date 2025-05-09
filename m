Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4AD2627E9
	for <dtrace@lists.linux.dev>; Fri,  9 May 2025 04:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766776; cv=fail; b=P+xKRUV5OYm28zrJpMpneV8Ig5AWlbVh3u3idNTM+B2K1UnQItieD3IAUfUpcwpB3wm3QNXjs0AH/9RjTH/SavysJkXMjlPOOx+bk4FRkrrCIebASnloAhEJeC7NNjTW4kZnbki07ne0cQOKuMnGGsSsGjGDs9PLEusCJ2z6c0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766776; c=relaxed/simple;
	bh=Bepv+oAK0Irk2UtCVQPHDCAjK3WXiyjlxzXUYtmy8VA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=FL9VBgRTxrMviGQFV+xkxnBtIgXIXff8CYz1Atdae++7JrP665UyVSBzteybOqk4jQFYZ4eC79jiPRciMEG2nw0w6KxRQtBEjlCHJtueiRO9xvvWNYUSo6XDKhYKhud4s9SQnDf5vkWDghr46uArHaD57qmvujcxcY+4ErItJzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O0IFcoK9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hOowQ+Qe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O0IFcoK9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hOowQ+Qe"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5493r8Lg019864
	for <dtrace@lists.linux.dev>; Fri, 9 May 2025 04:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=0mhu+ncdJJplFdgrr9MdYp5g2L07YCQOJSFEbSiG0Q0=; b=
	O0IFcoK9n5ZtByFdmpdGUphZqVj25Gkjr0RaK5/jih84xbFCCbnXmIvsSDBGYJbc
	KZTxkGk/xny1ghzREPUwM0x0wt2CS35tPb180YErcFps501ZAK/wPTOvD+b4azV3
	gki4O0BB2iID3R4COw7Mzb3zSoH98czxbU7mpVlctziwsWE/j9/ClId0XNivYaqC
	MBGA/LTB7P4Art0fPjHjMBmxfjsdehVDWMs27DyNwpmJZ4sefVA9nbhSa4teYwiU
	btghqnDHDbn/X99qEUn9Hh+vqxJE84v3oFQySE/GQ58e9Vzt5drsKpVTRQpLwo8f
	6flmlcg2R1ug0zQeP7h3Dw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ha67r204-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 09 May 2025 04:59:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5492jBaX007520
	for <dtrace@lists.linux.dev>; Fri, 9 May 2025 04:59:30 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010019.outbound.protection.outlook.com [40.93.12.19])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46fmsb5651-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 09 May 2025 04:59:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYCNigOR1PtqzsU7wGOB9jhKJqeKRtH2liPulqEmbMO3wTtRZRxXTsowzMi7aJYqFHexw0nQb248xBIU7/Xxjz4uXvbEXTAWMNQYM7qjUPXR6MospHuapqKvCpdFPnZRCTTpxbaX0lg1B7bm0MPJodz/DbUdtZOHT22/XnmJurMKR4JT67V4zPQ2Nn6Avp6ffN38chOEdrvG4FkoJlGUz/55wOMppXMUbwVjrpOB+sqjzXlptCBTKgBPhAxzVhRpCDO8pLiD0t2sfwWgdn+Uq1lCK9aPfCq4iSjyharD4xYp5UzY8LiFFv+LaUHaQP3Nb2U2Up41eg3sSt+uCO1ifw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mhu+ncdJJplFdgrr9MdYp5g2L07YCQOJSFEbSiG0Q0=;
 b=OKmgmA6dqHNYoyB4TbkiBiVS4IrSDF1n+OuqcrA0JFTAqFwwADwlZ9JjhxncXhl/VCYjfafUOeehZse7bl6f5n+LeLDvJYDKKsxiZn2aq3b2YQm+eG3IWnKPisLHb78kOVd//Z9Bok4J8kjhyRrnCVp2VDruA0TkOshwAz/ys4VT7SErRutDSlZAC/PKaYyl8rYZd1RrFJt3X4TTsaTEdG0wcP3X8IbfnFZ1ugXxqjhHQ+SBIZB1Gz/7Vwo+LWDyT2qck0U9WhUumUB1+SRMHm/uSJwmuLFrz059MkxdhSOiVU/ntHAEkE1Wfn3BJMPQ5GG+69L2EyBXHEkrYmfs8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mhu+ncdJJplFdgrr9MdYp5g2L07YCQOJSFEbSiG0Q0=;
 b=hOowQ+Qe5+9oeq/5+OIMS/cSJPC0VRY5H8bM27dBJiQQwhoYQYUGPN1BzPzyATmGljMM/NuBpOQf4uKqzUrOMvrPtuiNdWAXFiwW+ii3mF364+O3AE44anJmKSUNEkNZ5e9tk9rCDDp3Jo2kjc7Eq7vO7QfV/5e7GiYJttxz1B8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5737.namprd10.prod.outlook.com (2603:10b6:303:190::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Fri, 9 May
 2025 04:59:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Fri, 9 May 2025
 04:59:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/4] test: allow overriding CC, OBJCOPY, OBJDUMP, NM, ...
Date: Fri,  9 May 2025 00:59:24 -0400
Message-Id: <20250509045924.25004-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0909.namprd03.prod.outlook.com
 (2603:10b6:408:107::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 21aa579b-f726-444c-3c0e-08dd8eb6462f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WJTO4eHqrOn3fBy32FiDVfvdfnRL8TmkV6IVSHaAN+5HN35NSP5HmwTf69mV?=
 =?us-ascii?Q?yO2Me9yRsW539x4p+b0U68h3gRW5XbcYEqwu3xBug7nogjtwsLdg01SFoHQ9?=
 =?us-ascii?Q?c4BnePA4q4sU5PR9eXIK1oVz6PSyF6foYTfjqgJ5fIRm02MsBNO1c5rZgj4w?=
 =?us-ascii?Q?UqOj03KG04u/2181yEgIfZd7iQK7Ql5WjIk3kZg4odWkVuZxmdTFQq1qlnON?=
 =?us-ascii?Q?jtfN3ygg53WANxWAikFHTMH15Ls0RH0T3jgQvajLTipol+oaediO5QIYrxf3?=
 =?us-ascii?Q?Up8WZhPJGpdsA/qBpS2EcKePChiann0uT4FerPzOcng9qCuuscV3cGRsM/CM?=
 =?us-ascii?Q?jBDt3Qk/oU/K3as8sOpPR88g/fuDY8JX6snXdWQRs9EN+l7WTFt297gGnPxi?=
 =?us-ascii?Q?bumTwCx1j7f6ppbe6Xv8lG9QU17JO1KI6wHaIkQJdDSHxrI5XIPLvUpLVt5G?=
 =?us-ascii?Q?E/WMG82m1xAkjrvQRAFH7pyOLMTDr8OEbYutrlwdcE3+2M4KrPwoXvtg9yPQ?=
 =?us-ascii?Q?AIIlajQuQStu+BXbQAdCaqcuTECtraxuFNqMKOQs9zIaxK07QKN9KCZUEXTB?=
 =?us-ascii?Q?+hD7k9tujOuC/R7IRh+2toNfge/8Lfl37cGtX9Omi3EWtLRu2ttzy/kN9f3D?=
 =?us-ascii?Q?tSRzpzDxyEwS7efe36jQHNuYVLCEAqO0fYQ3Tz/RbFxuyAaAxBwz4gKCaWBQ?=
 =?us-ascii?Q?kNCRL9F7s6I0sePOrA6iCeXDVYwUIQlwlHUVNWURG11cF6gmBAWTfjkDX8N3?=
 =?us-ascii?Q?9OrSj88wxJQEEeAmCOwbdmEaTK1WrwwuHOAuVU6j//rooH93gUV3VAiUB9jW?=
 =?us-ascii?Q?uzw19jqmPo9fQnT1zD2opuu6IArMxZz3vmWJ5HvDeMhvc15aGZA8CKab9v6N?=
 =?us-ascii?Q?6xKAixiYYwwMHAidWofOg1UrhwI62NDKXx599VPsyBfgSC9jVqd4uM7Ptvn9?=
 =?us-ascii?Q?1WLAzcxc1S/ywwphhHUJXXZS3TiTrIbCEH3WtYvEz0gaIwlgtWRtK4hKDVs+?=
 =?us-ascii?Q?Ci0uwPZDWyxEbrJ4vr02aQbwZQkKPLGe/SE+6i9/Ke2CEJfFel0L3xS2XM3N?=
 =?us-ascii?Q?C5YZgN5A6q7tsGgW4rI4e9IbmT/hy8OuollHq2t7wjcx6BEvWwLcu92SJSPC?=
 =?us-ascii?Q?yvQOe17z+F6MTlBNAPkT88fRCDHwfUEmdYhwxWw9UyyNXoJK3LYfBhdCp2Dm?=
 =?us-ascii?Q?3xtt/pRLnSLQANOS96WEd6OSsSpV4mx8y1/G/68hFvHLwyHl/k5CHc8JSARd?=
 =?us-ascii?Q?G9Fb3rcv/LylzryVyXsEgaS9B2QnaalRKLJiKhX69BpaoKu/4iM+WrFmNfAl?=
 =?us-ascii?Q?NTO1EO/Y82z8K+6abgwdpZPBLspFicwkZEstyw7Xo8u0ct0rqUWhdtCHXKM7?=
 =?us-ascii?Q?ZFNYoL/uZCiDny+kRPxq6Jofbe9/or8hJOI0g10h1qCPlYVVlB0MIOQpUJBA?=
 =?us-ascii?Q?oLGV9VR2LLeInTXBHZQHEL8Nk1tbQUDY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JHAzMN8JCoYjahAU6u0YGQa2TREbI9/G1D8N+VR8IIsRugiYLJeZ64iEanrO?=
 =?us-ascii?Q?oa1/om3GEBOeVIyT7MSED7Y8tbZNnr3rfkAJikmUtPm//x6Pw0xF+HBIPN9E?=
 =?us-ascii?Q?ANxcmimxd/M20ywOum/xGvzbXRom41nA5Y21dsPOeMqCL+Bo7/+PpPWHnve2?=
 =?us-ascii?Q?w82L17Spg6odsCnyR71fJd62Jtc/K+2voF2BC4xm3BauzFL14s4l82uHV77G?=
 =?us-ascii?Q?OzVQHtwEXXYEJju0jxETsvCrse9JmVbBSiTCO2QrCggmPxb6kq0+IQEJfzu1?=
 =?us-ascii?Q?A5DEBUCX7IA0CdJtciK2NSfNTUV66XOingoFORdJhk0tfPoVd/PrOVtdOhHM?=
 =?us-ascii?Q?+awl2RYXzJGYxWSpY+NGDkEUU0pdj3DFUDnPPRMI923as/hCwR4/xV7C+od3?=
 =?us-ascii?Q?/Nd5En9aWW/fOt6uBFNmZvlj6KGDu7MV9fAtB6iyWS+vL/zkczS+tpPxdVw+?=
 =?us-ascii?Q?z+5FWyMC70ZOQhZ0gQmldViNfAIIwSM8yCBV2KZh1VDMF//ZSCawWz6HAkLu?=
 =?us-ascii?Q?QLRhJgsjh41AgT6HDcZxH9pIX9GNN0KFnoiKFP3qZuKYVZdf2Xp1/36/ULRg?=
 =?us-ascii?Q?DQPQD8oe9StY3YgpeEa2jzUboyx+l1RNRHaYd0oxJF0AF7RiZl98gpo7NEmt?=
 =?us-ascii?Q?Rw3T4BYCuu7l2yTIfnG3kTHmcO6U/VQBycNorM7jV2cxBrZPQfeGdN+kX0l8?=
 =?us-ascii?Q?vQWybEKJiX/Vckblb4VBAn/tYcBxyKae2ZLbRk/zqA2CbHHGmYBJzGajuJOo?=
 =?us-ascii?Q?R0Htzh70IIJVs9faYXK16cN0XGfimos8WoBsZaw6eGR4K7/Y8uI+9Ur8L1AT?=
 =?us-ascii?Q?9xvgC/Mrx4WhjQP+2mCdFXCHgbSJWZYJ5bHrvYXmEYYcuZduQdEURzTw/3vt?=
 =?us-ascii?Q?/HCGTVARF9Ke7DDFtQ4OYd4Nes3/DhxV8Pm+Qvphgl0ykGFjtkYhIGfE6sOe?=
 =?us-ascii?Q?aDjYNVxV0rneWS+3ZqODBAGaAq7Zs6O1BEnsY8oQPLFxVu5kvTdBYrphELSi?=
 =?us-ascii?Q?ju6vk5VSuRm5wiiUWqq/UR3NaBGO4+qUsqyA/iwhYLxmWdLvoV4uHMo27ctU?=
 =?us-ascii?Q?uAWm5ZwhaEOpcX3+1hvhEY6qTrY6kHaZm6Jvx5SpVRxA9qVr7RMsAA/DrB+x?=
 =?us-ascii?Q?Xduj1ihSbHJRfIJ9Pa2gnka9TxN5OKwcBi7NKxYFpxWz50qxIaARbI6fy7Fj?=
 =?us-ascii?Q?/IQ7cJTa799d6rCmd2bSdDbg+7qx9MFQiZUR76doKi7N5NZHnPutMnoluHX9?=
 =?us-ascii?Q?+cLL9y1zRalg2EtXEzIuhpbpfy9JpFobguKrSFz7OHA7Nep6gxhedQBhNW/b?=
 =?us-ascii?Q?hSmYSI7G0WWur3hH6dk1Z067SHdWw2/7ARDcwPGJXPb4vliiWutlWj57l2aL?=
 =?us-ascii?Q?sbRPvf2dWWWzQFJTmfnHvtJ6fAJ2nVfgwxhyqCh2bpJDCqdrtfdVImDzLl4i?=
 =?us-ascii?Q?2MNsY0dTE/b4bJdTY+shsPGfSGf4LaX7MSbiEeaawB3S9mxEr6euYMHWvnjf?=
 =?us-ascii?Q?BBuaQjt+2mjHOfC42LxInc/g4h9340CJ8kaAG7dvC4qM3hjDlM9Q9LUriD3c?=
 =?us-ascii?Q?raMvC1SUYtQU72BEgLJbsYYqvznRPPBhj08EWNCE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cAStgaJ/UDkMuqhWzeY7xlT8mp19YtYDMwlXXKJDOIgnxVzQv0eu1q9sSmljPRygFZ5XiJZ5nPP1PWaLQu3JdtKOBJ3MnLtqyL5KzTdmQ85vT/AFLYmGFaCePp5bT1Th7LK5jqKlrUcOry6v0HcjztZ/J8eKoZHaf3hMBDJx/+gfSlFEkNb+qFItRfl0iEx9Q69aLg+9Ij6CqE8PzaH8+at4ti3rWsFxCZvtWxhQi9AVmNvv1zZ1xggHFPVDvW4cnfoBGlCXOF+LDfbaRkzP2ZKVMrMgphhYuqbuYSAtQ7Csfb2ORHPPlNNH444HyUvbtVkroKsJY4kuQcpsjo9A591tylYrfukyho6Y1i/iwdAkTESsAaLQADWan7u2/xPlK2NHufQWkIavl/7Vv9PHR+dDyL9nV+gxwpyd4etSMpKe5x+C28YnAQgCsTkOdWsESQFUkeCB0KtyaNthTL7dm3XIpkJfG9piqpIx5rvh3ne/UapqZPDn0OoRIVbSUow7b3WY17QlcS5xw4GRKkOqcVB3nmyQGcAg/GQK5AhklKHDXjxwt/Eo9LVkPQTqutFtVHJo6YeCWU51/tFnLDBl/R+qg6Yaz0nptC4m47EjTis=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21aa579b-f726-444c-3c0e-08dd8eb6462f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:59:27.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BmeBFEutnDy7bIyXbmhSxYv+CPN9RYU5Q2lzp3Lra89P8kEIz7PMDBrHaHfI/FIlTb2L+U+cb3A5IR24+E/Pgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5737
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_01,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505090046
X-Proofpoint-ORIG-GUID: iRHQiwti3gTKOvEbpmRVmlG_sj-e6XQT
X-Authority-Analysis: v=2.4 cv=S6zZwJsP c=1 sm=1 tr=0 ts=681d8bb3 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=7mOBRU54AAAA:8 a=6fEu2DfWyTV9D_SmYkEA:9 a=wa9RWnbW_A1YIeRBVszw:22 cc=ntf awl=host:14694
X-Proofpoint-GUID: iRHQiwti3gTKOvEbpmRVmlG_sj-e6XQT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA0NSBTYWx0ZWRfX8fpk3a7qZPxB 3oEQQk70LdXu/EPG9WlnA6b0RacIBcyaCQDqdBkTqlBAkndfxcOA6HdL+35mdwnJg4gLLUV4kGu DQeXBuOC3v3EeXEMF8F/e3kCEi5I4IszMY2P4cCFTc64IoLUIMymQYsHXqJU8qZ9U4Cp8SwserT
 6I7kFAoIpZQU7VHlFky2EPsS+4uJILKhHocrS5FAHptB6XOa+lb6PsA3R50BMp6RjrKsD7CRiHk pcVPOWeyZhYYD9XHEZIwjHdYANJakAqT8O2zmkybiRxAVE0rLP+vLB+S2eSIhDSVzd9enL47vhA M6OEYF3xm3fkC8nbnY8dE5Goi04m4r8lVHry6kNTVjJeq8YHPE8XUdj3Rq/G4kQAzD0yf5M9RPq
 8Mke8EL/A+qlHmnTse/zh/tTCt7uT62256Dl2h8DLr6P5gNeyDCnVCPMXsSTU7vOSZfHpSgy

From: Eugene Loh <eugene.loh@oracle.com>

Bug: https://github.com/oracle/dtrace-utils/issues/75
Signed-off-by: Sam James <sam@gentoo.org>
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 runtest.sh                                           |  5 +++++
 .../expensive/locking/tst.DestructionDoubleUnlock.sh |  3 +--
 test/internals/headers/tst.header-endianness.sh      |  3 +--
 test/stress/options/tst.cpu-syscall.sh               |  4 ++--
 test/unittest/aggs/tst.aggmod_full2.sh               |  3 +--
 test/unittest/arrays/tst.uregsarray-check.sh         |  3 +--
 test/unittest/bitfields/tst.bitfield-offset.x        |  8 ++++----
 test/unittest/builtinvar/tst.errno3.sh               |  3 +--
 test/unittest/builtinvar/tst.tid_pid.sh              |  1 -
 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh  |  3 +--
 test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh  |  3 +--
 .../unittest/dtrace-util/tst.ListProbesModuleUSDT.sh |  3 +--
 test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh  |  3 +--
 .../dtrace-util/tst.ListProbesProviderUSDT.sh        |  3 +--
 test/unittest/fbtprovider/tst.entryargs2.sh          |  1 -
 test/unittest/funcs/copyout/tst.copyout.sh           |  4 ++--
 test/unittest/funcs/copyoutstr/tst.copyoutstr.sh     |  4 ++--
 test/unittest/misc/tst.include.sh                    |  3 +--
 test/unittest/options/tst.cpu-syscall.sh             |  4 ++--
 test/unittest/options/tst.ctypes.sh                  |  8 ++++----
 test/unittest/options/tst.dtypes.sh                  |  8 ++++----
 test/unittest/options/tst.linktype.sh                |  5 ++---
 test/unittest/options/tst.strip.sh                   |  5 ++---
 test/unittest/pid/tst.dash.sh                        |  4 ++--
 test/unittest/pid/tst.offsets.sh                     |  6 +++---
 test/unittest/pid/tst.provregex1.sh                  |  6 +++---
 test/unittest/pid/tst.provregex2.sh                  | 10 +++++-----
 test/unittest/pid/tst.provregex3.sh                  |  6 +++---
 test/unittest/pid/tst.provregex4.sh                  | 10 +++++-----
 test/unittest/usdt/tst.allargs.sh                    |  3 +--
 test/unittest/usdt/tst.badguess.sh                   |  3 +--
 test/unittest/usdt/tst.badguess.x                    |  2 +-
 test/unittest/usdt/tst.dlclose1.sh                   |  3 +--
 test/unittest/usdt/tst.dlclose2.sh                   |  3 +--
 test/unittest/usdt/tst.dlclose3.sh                   |  3 +--
 test/unittest/usdt/tst.dlclose4.sh                   |  3 +--
 test/unittest/usdt/tst.eliminate.sh                  |  7 +++----
 test/unittest/usdt/tst.enable_pid.sh                 |  7 +++----
 test/unittest/usdt/tst.enabled.sh                    |  3 +--
 test/unittest/usdt/tst.enabled2.sh                   |  3 +--
 test/unittest/usdt/tst.entryreturn.sh                |  3 +--
 test/unittest/usdt/tst.exec-dof-replacement.sh       |  3 +--
 test/unittest/usdt/tst.execstack.sh                  |  5 +----
 test/unittest/usdt/tst.fork.sh                       |  3 +--
 test/unittest/usdt/tst.guess32.sh                    |  3 +--
 test/unittest/usdt/tst.guess64.sh                    |  3 +--
 test/unittest/usdt/tst.header.sh                     |  3 +--
 test/unittest/usdt/tst.lingering.sh                  |  3 +--
 test/unittest/usdt/tst.link-idempotence.sh           |  3 +--
 test/unittest/usdt/tst.linkpriv.sh                   |  3 +--
 test/unittest/usdt/tst.linkunpriv.sh                 |  3 +--
 test/unittest/usdt/tst.manyprobes.sh                 |  3 +--
 test/unittest/usdt/tst.manyprocs.sh                  |  3 +--
 test/unittest/usdt/tst.multiple.sh                   |  3 +--
 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh  |  3 +--
 test/unittest/usdt/tst.multitrace.sh                 |  3 +--
 test/unittest/usdt/tst.nusdtprobes.sh                |  6 +++---
 test/unittest/usdt/tst.onlyenabled.sh                |  3 +--
 test/unittest/usdt/tst.pidprobes.sh                  | 12 ++++++------
 test/unittest/usdt/tst.pie.sh                        |  3 +--
 test/unittest/usdt/tst.reeval.sh                     |  3 +--
 test/unittest/usdt/tst.static.sh                     |  3 +--
 test/unittest/usdt/tst.static2.sh                    |  3 +--
 test/unittest/usdt/tst.user.sh                       |  3 +--
 test/utils/workload_analyze_loop.sh                  |  4 ++--
 65 files changed, 109 insertions(+), 153 deletions(-)

diff --git a/runtest.sh b/runtest.sh
index 15bd78fb6..156e7dec8 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -653,6 +653,11 @@ load_modules
 
 # Export some variables so triggers and .sh scripts can get at them.
 export _test _pid dt_flags
+export CC=${CC:-/usr/bin/gcc}
+export NM=${NM:-/usr/bin/nm}
+export OBJCOPY=${OBJCOPY:-/usr/bin/objcopy}
+export OBJDUMP=${OBJDUMP:-/usr/bin/objdump}
+export READELF=${READELF:-/usr/bin/readelf}
 
 # Arrange to do (relatively expensive) mutex debugging.
 export DTRACE_OPT_DEBUGASSERT="mutexes"
diff --git a/test/expensive/locking/tst.DestructionDoubleUnlock.sh b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
index c9b9eadcd..b7118642b 100755
--- a/test/expensive/locking/tst.DestructionDoubleUnlock.sh
+++ b/test/expensive/locking/tst.DestructionDoubleUnlock.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -28,7 +28,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/destruction-double-unlock.$$.$RANDOM"
diff --git a/test/internals/headers/tst.header-endianness.sh b/test/internals/headers/tst.header-endianness.sh
index e45cc5970..227da854e 100755
--- a/test/internals/headers/tst.header-endianness.sh
+++ b/test/internals/headers/tst.header-endianness.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -10,7 +10,6 @@
 set -e
 
 dtrace=$1
-CC=/usr/bin/gcc
 OLDDIRNAME=${PWD}
 CFLAGS="-I${OLDDIRNAME}/include -I${OLDDIRNAME}/uts/common"
 
diff --git a/test/stress/options/tst.cpu-syscall.sh b/test/stress/options/tst.cpu-syscall.sh
index 6fb09d48b..3f6f2f481 100755
--- a/test/stress/options/tst.cpu-syscall.sh
+++ b/test/stress/options/tst.cpu-syscall.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -91,7 +91,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR compilation failed
 	exit 1
diff --git a/test/unittest/aggs/tst.aggmod_full2.sh b/test/unittest/aggs/tst.aggmod_full2.sh
index 66cfc002b..b87d6ba68 100755
--- a/test/unittest/aggs/tst.aggmod_full2.sh
+++ b/test/unittest/aggs/tst.aggmod_full2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -17,7 +17,6 @@
 ##
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/aggs-aggmod_full2.$$.$RANDOM"
diff --git a/test/unittest/arrays/tst.uregsarray-check.sh b/test/unittest/arrays/tst.uregsarray-check.sh
index f55d36d0d..4f1aabaa8 100755
--- a/test/unittest/arrays/tst.uregsarray-check.sh
+++ b/test/unittest/arrays/tst.uregsarray-check.sh
@@ -1,13 +1,12 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/arrays-uregsarray-check.$$.$RANDOM"
diff --git a/test/unittest/bitfields/tst.bitfield-offset.x b/test/unittest/bitfields/tst.bitfield-offset.x
index ae57c2b56..1f328c23c 100755
--- a/test/unittest/bitfields/tst.bitfield-offset.x
+++ b/test/unittest/bitfields/tst.bitfield-offset.x
@@ -12,8 +12,8 @@
 # skip the test, since we can't possibly tell what it was
 # generated by.
 
-if ! objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
-    LANG=C objdump --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
+if ! ${OBJDUMP} --ctf=.ctf --ctf-parent=shared_ctf /bin/true > /dev/null 2>&1 && \
+    LANG=C ${OBJDUMP} --ctf=.ctf --ctf-parent=shared_ctf /bin/true 2>&1 | \
     grep 'unrecognized option' > /dev/null 2>&1; then
     exit 2
 fi
@@ -21,7 +21,7 @@ fi
 ctfa=$tmpdir/vmlinux.ctfa
 trap "rm -f $ctfa" EXIT ERR
 
-objcopy --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
+${OBJCOPY} --add-section=.ctf=/lib/modules/$(uname -r)/kernel/vmlinux.ctfa /bin/true $ctfa
 
-objdump --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
+${OBJDUMP} --ctf=.ctf --ctf-parent=shared_ctf $ctfa |\
     gawk '/Version: 3/ { exit 1; } /Version: / { exit 0; }'
diff --git a/test/unittest/builtinvar/tst.errno3.sh b/test/unittest/builtinvar/tst.errno3.sh
index 7546152f6..d1bcde391 100755
--- a/test/unittest/builtinvar/tst.errno3.sh
+++ b/test/unittest/builtinvar/tst.errno3.sh
@@ -1,13 +1,12 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 
 DIRNAME="$tmpdir/builtinvar-errno3.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/builtinvar/tst.tid_pid.sh b/test/unittest/builtinvar/tst.tid_pid.sh
index 7ff0227fe..e367411dc 100755
--- a/test/unittest/builtinvar/tst.tid_pid.sh
+++ b/test/unittest/builtinvar/tst.tid_pid.sh
@@ -7,7 +7,6 @@
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 
 DIRNAME="$tmpdir/builtinvar-tid_pid.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
index 737f2cc88..945d21882 100755
--- a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -20,7 +20,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index f8083f2c9..e7af9da9d 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-func-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index dc6cb1008..f66d6cbdd 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-module-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index 59b8dca56..9f6ca8bab 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-name-usdt.$$.$RANDOM"
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 64fc185da..be6d87be2 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -22,7 +22,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/list-probes-provider-usdt.$$.$RANDOM"
diff --git a/test/unittest/fbtprovider/tst.entryargs2.sh b/test/unittest/fbtprovider/tst.entryargs2.sh
index f5b435f56..4485d33a8 100755
--- a/test/unittest/fbtprovider/tst.entryargs2.sh
+++ b/test/unittest/fbtprovider/tst.entryargs2.sh
@@ -9,7 +9,6 @@
 #
 
 dtrace=$1
-CC=${CC:-/usr/bin/gcc}
 
 # Set up test directory.
 
diff --git a/test/unittest/funcs/copyout/tst.copyout.sh b/test/unittest/funcs/copyout/tst.copyout.sh
index 748b138b8..9553938bc 100755
--- a/test/unittest/funcs/copyout/tst.copyout.sh
+++ b/test/unittest/funcs/copyout/tst.copyout.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -31,7 +31,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo "compilation error"
 	exit 1
diff --git a/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh b/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh
index d98897fcc..284478b06 100755
--- a/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh
+++ b/test/unittest/funcs/copyoutstr/tst.copyoutstr.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -42,7 +42,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo "compilation error"
 	exit 1
diff --git a/test/unittest/misc/tst.include.sh b/test/unittest/misc/tst.include.sh
index 9d9989a3e..4cdacfe91 100755
--- a/test/unittest/misc/tst.include.sh
+++ b/test/unittest/misc/tst.include.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIR="$tmpdir/misc-include.$$.$RANDOM"
diff --git a/test/unittest/options/tst.cpu-syscall.sh b/test/unittest/options/tst.cpu-syscall.sh
index 401839d56..4fb58c35f 100755
--- a/test/unittest/options/tst.cpu-syscall.sh
+++ b/test/unittest/options/tst.cpu-syscall.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -91,7 +91,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR compilation failed
 	exit 1
diff --git a/test/unittest/options/tst.ctypes.sh b/test/unittest/options/tst.ctypes.sh
index 30a6c9b16..767de0db0 100755
--- a/test/unittest/options/tst.ctypes.sh
+++ b/test/unittest/options/tst.ctypes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,14 +14,14 @@ if [ ! -r $tmpdir/ctypes.ctf ]; then
 	exit 1
 fi
 
-if objdump --help | grep ctf >/dev/null; then
-	objcopy --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
+if ${OBJDUMP} --help | grep ctf >/dev/null; then
+	${OBJCOPY} --add-section=.ctf=$tmpdir/ctypes.ctf /bin/true $tmpdir/ctypes.o
 	if [ $? -ne 0 ]; then
 		echo "ERROR: Failed to create ELF object from ctypes.ctf"
 		exit 1
 	fi
 
-	objdump --ctf=.ctf $tmpdir/ctypes.o | \
+	${OBJDUMP} --ctf=.ctf $tmpdir/ctypes.o | \
 		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "C CTF data" (found ? " " : " NOT ") "found";
diff --git a/test/unittest/options/tst.dtypes.sh b/test/unittest/options/tst.dtypes.sh
index 441de098a..ac6a8036d 100755
--- a/test/unittest/options/tst.dtypes.sh
+++ b/test/unittest/options/tst.dtypes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,14 +14,14 @@ if [ ! -r $tmpdir/dtypes.ctf ]; then
 	exit 1
 fi
 
-if objdump --help | grep ctf >/dev/null; then
-	objcopy --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
+if ${OBJDUMP} --help | grep ctf >/dev/null; then
+	${OBJCOPY} --add-section=.ctf=$tmpdir/dtypes.ctf /bin/true $tmpdir/dtypes.o
 	if [ $? -ne 0 ]; then
 		echo "ERROR: Failed to create ELF object from dtypes.ctf"
 		exit 1
 	fi
 
-	objdump --ctf=.ctf $tmpdir/dtypes.o | \
+	${OBJDUMP} --ctf=.ctf $tmpdir/dtypes.o | \
 		gawk '/CTF_VERSION/ { found = 1; next; }
 		     found && $1 ~ /0x[0-9A-Fa-f]+:/ { cnt++; next; }
 		     END { print "D CTF data" (found ? " " : " NOT ") "found";
diff --git a/test/unittest/options/tst.linktype.sh b/test/unittest/options/tst.linktype.sh
index 564d9b0f6..7298d67a7 100755
--- a/test/unittest/options/tst.linktype.sh
+++ b/test/unittest/options/tst.linktype.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -9,7 +9,6 @@
 # @@nosort
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/linktype.$$.$RANDOM"
@@ -61,7 +60,7 @@ function mytest() {
 	fi
 
 	# report whether the file format is recognized
-	objdump --file-headers prov.o |& gawk '
+	${OBJDUMP} --file-headers prov.o |& gawk '
 	    /format not recognized/ {
 		print "objdump does NOT recognize file format";
 		exit(0);
diff --git a/test/unittest/options/tst.strip.sh b/test/unittest/options/tst.strip.sh
index 054955fb3..f7960d7a6 100755
--- a/test/unittest/options/tst.strip.sh
+++ b/test/unittest/options/tst.strip.sh
@@ -1,13 +1,12 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/strip.$$.$RANDOM"
@@ -48,7 +47,7 @@ fi
 
 # link with and without -xstrip, dumping the DOF section
 
-objdump="objdump --full-contents --section=.SUNW_dof prov.o"
+objdump="${OBJDUMP} --full-contents --section=.SUNW_dof prov.o"
 
 $dtrace $dt_flags -G -xstrip -s prov.d test.o
 if [ $? -ne 0 ]; then
diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
index f364e3e3c..0289b6093 100755
--- a/test/unittest/pid/tst.dash.sh
+++ b/test/unittest/pid/tst.dash.sh
@@ -54,7 +54,7 @@ int main(int c, char **v) {
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR compile
 	exit 1
@@ -66,7 +66,7 @@ for func in foo0 foo1 foo2 main; do
 	# For each function, get the absolute and relative
 	# (to the function) address of some instruction in
 	# the function.
-	read ABS REL <<< `objdump -d a.out | awk '
+	read ABS REL <<< `$OBJDUMP -d a.out | awk '
 	  # Look for the function.
 	  /^[0-9a-f]* <'$func'>:$/ {
 
diff --git a/test/unittest/pid/tst.offsets.sh b/test/unittest/pid/tst.offsets.sh
index cc1a440d5..23aad6202 100755
--- a/test/unittest/pid/tst.offsets.sh
+++ b/test/unittest/pid/tst.offsets.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -54,7 +54,7 @@ main(int c, char **v)
 }
 EOF
 
-gcc main.c
+$CC main.c
 if [ $? -ne 0 ]; then
 	echo ERROR in compiling
 	exit 1
@@ -85,7 +85,7 @@ fi
 # hot and cold instructions in the function.
 #
 
-objdump -d a.out | gawk '
+${OBJDUMP} -d a.out | gawk '
 BEGIN {
 	pc0 = 0;	# First PC of loopfunc()
 	pcjump = 0;	# PC of the jump
diff --git a/test/unittest/pid/tst.provregex1.sh b/test/unittest/pid/tst.provregex1.sh
index c672b23fa..5bc0bd510 100755
--- a/test/unittest/pid/tst.provregex1.sh
+++ b/test/unittest/pid/tst.provregex1.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2021, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -23,10 +23,10 @@ cat > $DIR/Makefile <<EOF
 all: main
 
 main: main.o
-	cc -o main main.o
+	$CC -o main main.o
 
 main.o: main.c
-	cc -c main.c
+	$CC -c main.c
 EOF
 
 cat > $DIR/main.c <<EOF
diff --git a/test/unittest/pid/tst.provregex2.sh b/test/unittest/pid/tst.provregex2.sh
index 305aafe99..890836d9c 100755
--- a/test/unittest/pid/tst.provregex2.sh
+++ b/test/unittest/pid/tst.provregex2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -24,16 +24,16 @@ cat > $DIR/Makefile <<EOF
 all: main altlib.so
 
 main: main.o
-	cc -o main main.o -ldl
+	$CC -o main main.o -ldl
 
 main.o: main.c
-	cc -c main.c
+	$CC -c main.c
 
 altlib.so: altlib.o
-	cc -z defs -shared -o altlib.so altlib.o
+	$CC -z defs -shared -o altlib.so altlib.o
 
 altlib.o: altlib.c
-	cc -c altlib.c
+	$CC -c altlib.c
 EOF
 
 cat > $DIR/altlib.c <<EOF
diff --git a/test/unittest/pid/tst.provregex3.sh b/test/unittest/pid/tst.provregex3.sh
index 41210ff09..bc7908eb1 100755
--- a/test/unittest/pid/tst.provregex3.sh
+++ b/test/unittest/pid/tst.provregex3.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -23,10 +23,10 @@ cat > $DIR/Makefile <<EOF
 all: main
 
 main: main.o prov.o
-	cc $test_cppflags -o main main.o prov.o
+	$CC $test_cppflags -o main main.o prov.o
 
 main.o: main.c prov.h
-	cc $test_cppflags -c main.c
+	$CC $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace $dt_flags -h -s prov.d
diff --git a/test/unittest/pid/tst.provregex4.sh b/test/unittest/pid/tst.provregex4.sh
index 5aa38fa98..0e405d3a5 100755
--- a/test/unittest/pid/tst.provregex4.sh
+++ b/test/unittest/pid/tst.provregex4.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -25,10 +25,10 @@ cat > $DIR/Makefile <<EOF
 all: main altlib.so
 
 main: main.o provmain.o
-	cc $test_cppflags -o main main.o provmain.o -ldl
+	$CC $test_cppflags -o main main.o provmain.o -ldl
 
 main.o: main.c prov.h
-	cc $test_cppflags -c main.c
+	$CC $test_cppflags -c main.c
 
 prov.h: prov.d
 	$dtrace $dt_flags -h -s prov.d
@@ -37,10 +37,10 @@ provmain.o: prov.d main.o
 	$dtrace $dt_flags -G -o provmain.o -s prov.d main.o
 
 altlib.so: altlib.o provalt.o
-	cc $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
+	$CC $test_cppflags -z defs --shared -o altlib.so altlib.o provalt.o
 
 altlib.o: altlib.c prov.h
-	cc $test_cppflags -c altlib.c
+	$CC $test_cppflags -c altlib.c
 
 provalt.o: prov.d altlib.o
 	$dtrace $dt_flags -G -o provalt.o -s prov.d altlib.o
diff --git a/test/unittest/usdt/tst.allargs.sh b/test/unittest/usdt/tst.allargs.sh
index 179552b65..ca2d71886 100755
--- a/test/unittest/usdt/tst.allargs.sh
+++ b/test/unittest/usdt/tst.allargs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="-std=gnu89 $test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.badguess.sh b/test/unittest/usdt/tst.badguess.sh
index b6ff9e233..6cd959bbf 100755
--- a/test/unittest/usdt/tst.badguess.sh
+++ b/test/unittest/usdt/tst.badguess.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.badguess.x b/test/unittest/usdt/tst.badguess.x
index d92f8bff5..b4030d55f 100755
--- a/test/unittest/usdt/tst.badguess.x
+++ b/test/unittest/usdt/tst.badguess.x
@@ -4,4 +4,4 @@
 #
 # If we can't compile a trivial 32-bit program, this test
 # will fail.
-echo 'int main (void) { }' | gcc -x c -c -o /dev/null -m32 - 2>/dev/null
+echo 'int main (void) { }' | $CC -x c -c -o /dev/null -m32 - 2>/dev/null
diff --git a/test/unittest/usdt/tst.dlclose1.sh b/test/unittest/usdt/tst.dlclose1.sh
index a6bad02b7..6e2c0da7d 100755
--- a/test/unittest/usdt/tst.dlclose1.sh
+++ b/test/unittest/usdt/tst.dlclose1.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -29,7 +29,6 @@
 # The second should not.
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose1.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose2.sh b/test/unittest/usdt/tst.dlclose2.sh
index 907685a68..88779fc52 100755
--- a/test/unittest/usdt/tst.dlclose2.sh
+++ b/test/unittest/usdt/tst.dlclose2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose2.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose3.sh b/test/unittest/usdt/tst.dlclose3.sh
index 0b70906fc..bcc1e0ed2 100755
--- a/test/unittest/usdt/tst.dlclose3.sh
+++ b/test/unittest/usdt/tst.dlclose3.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -21,7 +21,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose3.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
index a84e34600..9e1a11c49 100755
--- a/test/unittest/usdt/tst.dlclose4.sh
+++ b/test/unittest/usdt/tst.dlclose4.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ PATH=/usr/bin:/usr/sbin:$PATH
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-dlclose4.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.eliminate.sh b/test/unittest/usdt/tst.eliminate.sh
index e74896bbe..e9fbf5e99 100755
--- a/test/unittest/usdt/tst.eliminate.sh
+++ b/test/unittest/usdt/tst.eliminate.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 # @@xfail: Linux ld does not seem to support STV_ELIMINATE
@@ -16,7 +16,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
@@ -71,13 +70,13 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-nm test.o | grep \$dtrace > /dev/null
+${NM} test.o | grep \$dtrace > /dev/null
 if [ $? -ne 0 ]; then
 	echo "no temporary symbols in the object file" >& 2
 	exit 1
 fi
 
-nm test | grep \$dtrace > /dev/null
+${NM} test | grep \$dtrace > /dev/null
 if [ $? -eq 0 ]; then
 	echo "failed to eliminate temporary symbols" >& 2
 	exit 1
diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
index 207184d43..7f4f68698 100755
--- a/test/unittest/usdt/tst.enable_pid.sh
+++ b/test/unittest/usdt/tst.enable_pid.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ PATH=/usr/bin:/usr/sbin:$PATH
 #
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS=
 
 DIRNAME="$tmpdir/usdt-enable_pid.$$.$RANDOM"
@@ -120,7 +119,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
 fi
-cc $test_cppflags -c main.c
+$CC $test_cppflags -c main.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
@@ -130,7 +129,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_cppflags -o main main.o prov.o
+$CC $test_cppflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
diff --git a/test/unittest/usdt/tst.enabled.sh b/test/unittest/usdt/tst.enabled.sh
index 4cd1eccdb..a180f9622 100755
--- a/test/unittest/usdt/tst.enabled.sh
+++ b/test/unittest/usdt/tst.enabled.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.enabled2.sh b/test/unittest/usdt/tst.enabled2.sh
index 1732085e6..b174ef4c3 100755
--- a/test/unittest/usdt/tst.enabled2.sh
+++ b/test/unittest/usdt/tst.enabled2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.entryreturn.sh b/test/unittest/usdt/tst.entryreturn.sh
index 84af96723..03418e7ba 100755
--- a/test/unittest/usdt/tst.entryreturn.sh
+++ b/test/unittest/usdt/tst.entryreturn.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ fi
 # @@xfail: dtv2, no wildcard usdt probes yet
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
index 6d547cce3..b7ec5f2dc 100755
--- a/test/unittest/usdt/tst.exec-dof-replacement.sh
+++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.execstack.sh b/test/unittest/usdt/tst.execstack.sh
index e7b59105b..42da70350 100755
--- a/test/unittest/usdt/tst.execstack.sh
+++ b/test/unittest/usdt/tst.execstack.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,11 +11,8 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
-OBJDUMP=/usr/bin/objdump
-READELF=/usr/bin/readelf
 
 DIRNAME="$tmpdir/usdt-execstack.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.fork.sh b/test/unittest/usdt/tst.fork.sh
index 9b2b372a0..e82463f96 100755
--- a/test/unittest/usdt/tst.fork.sh
+++ b/test/unittest/usdt/tst.fork.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.guess32.sh b/test/unittest/usdt/tst.guess32.sh
index 7a130e178..219612368 100755
--- a/test/unittest/usdt/tst.guess32.sh
+++ b/test/unittest/usdt/tst.guess32.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.guess64.sh b/test/unittest/usdt/tst.guess64.sh
index 23b7a241c..417dcec92 100755
--- a/test/unittest/usdt/tst.guess64.sh
+++ b/test/unittest/usdt/tst.guess64.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.header.sh b/test/unittest/usdt/tst.header.sh
index c5e411be6..521e9fd1f 100755
--- a/test/unittest/usdt/tst.header.sh
+++ b/test/unittest/usdt/tst.header.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.lingering.sh b/test/unittest/usdt/tst.lingering.sh
index 079acb75d..148345cfc 100755
--- a/test/unittest/usdt/tst.lingering.sh
+++ b/test/unittest/usdt/tst.lingering.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.link-idempotence.sh b/test/unittest/usdt/tst.link-idempotence.sh
index 643ba10ca..caa495338 100755
--- a/test/unittest/usdt/tst.link-idempotence.sh
+++ b/test/unittest/usdt/tst.link-idempotence.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.linkpriv.sh b/test/unittest/usdt/tst.linkpriv.sh
index 2c89f5d46..5f637e857 100755
--- a/test/unittest/usdt/tst.linkpriv.sh
+++ b/test/unittest/usdt/tst.linkpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="-std=gnu99 $test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.linkunpriv.sh b/test/unittest/usdt/tst.linkunpriv.sh
index 9ef386392..b00d532ea 100755
--- a/test/unittest/usdt/tst.linkunpriv.sh
+++ b/test/unittest/usdt/tst.linkunpriv.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 
 DIRNAME="$tmpdir/usdt-linkunpriv.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.manyprobes.sh b/test/unittest/usdt/tst.manyprobes.sh
index c0deb8df0..6e894f2cd 100755
--- a/test/unittest/usdt/tst.manyprobes.sh
+++ b/test/unittest/usdt/tst.manyprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 DIRNAME="$tmpdir/usdt-manyprobes.$$.$RANDOM"
diff --git a/test/unittest/usdt/tst.manyprocs.sh b/test/unittest/usdt/tst.manyprocs.sh
index 585503029..e157d05a4 100755
--- a/test/unittest/usdt/tst.manyprocs.sh
+++ b/test/unittest/usdt/tst.manyprocs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.multiple.sh b/test/unittest/usdt/tst.multiple.sh
index 440a7d7ba..8734a1103 100755
--- a/test/unittest/usdt/tst.multiple.sh
+++ b/test/unittest/usdt/tst.multiple.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
index 6595737f9..2fc17e586 100755
--- a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@
 # @@nosort
 
 dtrace=$1
-CC=/usr/bin/gcc
 
 DIRNAME="$tmpdir/usdt-multiprov-dupprobe-shlibs.$$.$RANDOM"
 mkdir -p $DIRNAME
diff --git a/test/unittest/usdt/tst.multitrace.sh b/test/unittest/usdt/tst.multitrace.sh
index 262c78282..81f43f767 100755
--- a/test/unittest/usdt/tst.multitrace.sh
+++ b/test/unittest/usdt/tst.multitrace.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -14,7 +14,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
index f275f921f..93c56e382 100755
--- a/test/unittest/usdt/tst.nusdtprobes.sh
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -66,7 +66,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
 fi
-gcc $test_cppflags -c main.c
+$CC $test_cppflags -c main.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
@@ -76,7 +76,7 @@ if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-gcc $test_ldflags -o main main.o prov.o
+$CC $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
diff --git a/test/unittest/usdt/tst.onlyenabled.sh b/test/unittest/usdt/tst.onlyenabled.sh
index d3487834e..9db5dc462 100755
--- a/test/unittest/usdt/tst.onlyenabled.sh
+++ b/test/unittest/usdt/tst.onlyenabled.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 0c75d7967..72434eb96 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -69,20 +69,20 @@ if [ $? -ne 0 ]; then
 	echo "failed to generate header file" >&2
 	exit 1
 fi
-cc $test_cppflags -c main.c
+$CC $test_cppflags -c main.c
 if [ $? -ne 0 ]; then
 	echo "failed to compile test" >&2
 	exit 1
 fi
 if [[ `uname -m` = "aarch64" ]]; then
-	objdump -d main.o > disasm_foo.txt.before
+	$OBJDUMP -d main.o > disasm_foo.txt.before
 fi
 $dtrace $dt_flags -G -64 -s prov.d main.o
 if [ $? -ne 0 ]; then
 	echo "failed to create DOF" >&2
 	exit 1
 fi
-cc $test_ldflags -o main main.o prov.o
+$CC $test_ldflags -o main main.o prov.o
 if [ $? -ne 0 ]; then
 	echo "failed to link final executable" >&2
 	exit 1
@@ -104,7 +104,7 @@ fi
 
 # Disassemble foo().  (simplify with --disassemble=foo)
 
-objdump -d main | awk '
+$OBJDUMP -d main | awk '
 BEGIN { use = 0 }             # start by not printing lines
 use == 1 && NF == 0 { exit }  # if printing lines but hit a blank, then exit
 use == 1 { print }            # print lines
@@ -112,7 +112,7 @@ use == 1 { print }            # print lines
 ' > disasm_foo.txt
 if [ $? -ne 0 ]; then
 	echo cannot objdump main
-	objdump -d main
+	$OBJDUMP -d main
 	exit 1
 fi
 
@@ -277,7 +277,7 @@ done
 
 pc_return=`awk '/'$pid' pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
 
-objdump -d main | awk '
+$OBJDUMP -d main | awk '
 /^[0-9a-f]* <.*>:$/ { myfunc = $NF }         # enter a new function
 /^ *'$pc_return'/ { print myfunc; exit(0) }  # report the function $pc_return is in
 ' > return_func.out
diff --git a/test/unittest/usdt/tst.pie.sh b/test/unittest/usdt/tst.pie.sh
index 0d62c3762..a2c12a262 100755
--- a/test/unittest/usdt/tst.pie.sh
+++ b/test/unittest/usdt/tst.pie.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="-fno-inline -pie $test_cppflags"
 LDFLAGS="-pie $test_ldflags"
 
diff --git a/test/unittest/usdt/tst.reeval.sh b/test/unittest/usdt/tst.reeval.sh
index 371eee3db..069248f55 100755
--- a/test/unittest/usdt/tst.reeval.sh
+++ b/test/unittest/usdt/tst.reeval.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2007, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -12,7 +12,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.static.sh b/test/unittest/usdt/tst.static.sh
index 81b3ba041..dd96b0fff 100755
--- a/test/unittest/usdt/tst.static.sh
+++ b/test/unittest/usdt/tst.static.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,7 +11,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.static2.sh b/test/unittest/usdt/tst.static2.sh
index 115a95511..2606ecf33 100755
--- a/test/unittest/usdt/tst.static2.sh
+++ b/test/unittest/usdt/tst.static2.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -15,7 +15,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/unittest/usdt/tst.user.sh b/test/unittest/usdt/tst.user.sh
index 30513acca..624897053 100755
--- a/test/unittest/usdt/tst.user.sh
+++ b/test/unittest/usdt/tst.user.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -13,7 +13,6 @@ if [ $# != 1 ]; then
 fi
 
 dtrace=$1
-CC=/usr/bin/gcc
 CFLAGS="$test_cppflags"
 LDFLAGS="$test_ldflags"
 
diff --git a/test/utils/workload_analyze_loop.sh b/test/utils/workload_analyze_loop.sh
index 3bbadf78b..7edce7b02 100755
--- a/test/utils/workload_analyze_loop.sh
+++ b/test/utils/workload_analyze_loop.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -13,7 +13,7 @@ if [ ! -e $prog ]; then
 	exit 1
 fi
 
-objdump -d $prog | gawk -v myarch=$(uname -m) '
+${OBJDUMP} -d $prog | gawk -v myarch=$(uname -m) '
 # decide whether to track instructions (which we number n = 1, 2, 3, ...) or not (n < 0)
 # specifically, do not track instructions until we find the disassembly for <main>
 BEGIN { n = -1; }
-- 
2.43.5

