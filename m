Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABB01A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466775; cv=fail; b=lRQQXR/nemU3rY8lY5pmPdjXZJs4PzJjAUhrYcf2Ux+kj6k6pBo8dvDa0fBc9X//QIqKjzd2pB4Ai8EcqGT/JWV5jeauA+5fizdzjPtS58/GYLAwHRTPRzbi9JesWLmUQgvHhxRovnRoDJDiGFKJWS8K04NLoJPa9Y9ywNJ2+sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466775; c=relaxed/simple;
	bh=pWqo3BjxsHLf4P7EVTvLV7RDjhOYn0GsRxgb1vUCL8o=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FI7TsUDMkFoL4rP8KvatSGrFZ8/hzqCS/6i1r2QdXzb5PNNzraeetoiUEsvC08RID/aBOZAjLfDyR7j8szVBqp0NHagv7irwATwBFa1M76U6fSsBwbUbgNQHXrGT3v91xzvn86B4YNE3IamSrJxasFqTQ/nDP1juN/1j92ASt0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nXh3vgBX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FZ5RY+Jy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nXh3vgBX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FZ5RY+Jy"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMXcR010684
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=BsJaorBJlP1Xo1
	5nIUr3oyAI40whu7OVmRQ+oECr9PE=; b=nXh3vgBXBn37DFYL7doqHcSeApHM5X
	biVgbPGfi1p4HlsiFztjBdZqhbaglkNut59aIlIio62rJ9VbfmN5A9A94apnonII
	aVCeN4QyPcnb5Mi8+5+b2vz9EZQvRgqaK78Jm940GGXILWNuFD/Cb1U4k5Z+RL2+
	CXvUZmAW8nVtU4plVVPSdSBwwsAo0pV4kF67vjikruBlINbTQng9RbildIEQJB0O
	I3h4J5OJ3WNn2YtD3KG0Eeo+s4Ul1Cznm6AqfAFt2SHoY4KCw/VIpT/gE5+gMVX6
	lNpBaOhzfUuyKsCCr46i67XyVlc+ZJAU/nxJLb7B7zMP5PX0KmoX0JUQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn1d4r9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R4sxgb017783
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29vb60-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1xB32KuRjVo8HO3vVhVczzQtQ/qDnDQ+7ZhbkdMyFxhxUrf7p7FugFtIjR/ed0YYz1IgcnR8GW+GBUBBsuKp2PTYCKR3xOUj5WfqYEGmHBOfFc4cMBOhrzj1VqOHYi+jO87XsQNXTw6ViDq5EDk7BC5HvKqIClbIEl3F1++oMGchTKyhN/P5KzpN5VVeCR8VLY9pV/OKMuspOfLbCZKHAIKOtkehcztGdPju+zscyY5seHwuHLl4ox6et5yMPbmFLiSjyoYhFWvs3TxCTGbYHhAh4HoSIDcPLWc/amkoZpJqalfm7pakJr8GB5slx8Zbe27rWN5IgUHOcmNvVMFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsJaorBJlP1Xo15nIUr3oyAI40whu7OVmRQ+oECr9PE=;
 b=OnmZP9w7JLyfSB2lvTMHstlIhCrnAoTNQUrcZFyQGGNGRAkxzUZr4Bay5WhOdW0VMfevPtvKHcYzYxe5nLC+OPJv2an63BVLpHMY2T/4R5ZynZY2D7EipBEH3fVAF2qTOEksNmAx1niAnnOgsnPuKC3Izyzhg+OZ8cY2GbWr/ep3dekiWJxdzVr8PydOZUUpJoZlYUyVYPSqNovLa9nA0wy4rPcmB6Ke+S6TWaJXEehU/9620/4jruQDTziBaiJPXiO+f157L0A+bf6VWY+rGa1G9CuruaDT44Bl1w7hBtZR1inOVIoCsXXcNJx0dMBGkAwKFCFf1R3BKw4kgI7MqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsJaorBJlP1Xo15nIUr3oyAI40whu7OVmRQ+oECr9PE=;
 b=FZ5RY+JyA8zt+cxfNEWK2mGZslZx7J8a/Hp42BmVWJLtdF1N4Wpwm0kDYr6GuAJC4TQQfUZSQq8MbpmWS41N8d6TmPcTkkjBbF7hSjGBLxtAhJirBuvNZ4IBll7G34vTbenvt/4k0m2Cnjd7eLmPMsoj8xWINKuCsxDqRxuu24I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA3PR10MB7994.namprd10.prod.outlook.com (2603:10b6:208:50b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 05:39:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 30/38] Allow relocation on BPF_OR instructions
Date: Thu, 27 Jun 2024 01:38:56 -0400
Message-Id: <20240627053904.21996-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0055.prod.exchangelabs.com (2603:10b6:a03:94::32)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA3PR10MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 533122d5-5b94-4273-eb4a-08dc966b8352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XNbhnjNzQvduJugQlpVJLAH4V/DAAwqByXMVV0aJtDlH5mUkGNeovXK8yzSh?=
 =?us-ascii?Q?DRpbUy2ZO+roq0lQhiSC7YXFAC8foM5Rk/n3oiVKpWHrtDUnrZCztRC0U4GT?=
 =?us-ascii?Q?epmf7+GzJL0irkbS15CKIGhRVeIQ9fozOKZrcZRxriYUmRpQmzSAJAYWe6ps?=
 =?us-ascii?Q?APIpd4gXwEkLvS6M7YJW3Ky8ab6udDgI3YNCvMAtGTIVeostXDQJdAv0CFXO?=
 =?us-ascii?Q?2V1dZVYCjQxuxBgxD7Fq8WK69AVwQ3sSt6LvnF/tUXrjNp3IUevcvAHZ0adD?=
 =?us-ascii?Q?WqsoH58944qiyiKw9O/GZVwG9qq2yLgFaaTZ/HxqHZ6SixqtPxBLKscXT8CJ?=
 =?us-ascii?Q?UL0ijUKqUEJ/yTLG5/l8xh8K3n5BqzWkKodvce5me20l9OpfGOjI3yZSCsno?=
 =?us-ascii?Q?c/8iSRJPb2r/t4VJbXKuKV0dTTJVqgluDxJD+A5tYcOwpVyRPL9Iwi12Z3aW?=
 =?us-ascii?Q?j1xHftCVokpnMT+REP19gT8pnnWOfBXYFfmn99rQufujIFltMTkFBMPok94g?=
 =?us-ascii?Q?2XCvGJ28+7f1jLibCLR15onEGuMCw6wFWGv3E5fh73wlPxRCJybDs132dDBU?=
 =?us-ascii?Q?YYsNCyAVj3DqDg8t7uIjqclQI5ByQkFpiv/j8ngixHZJ5J5JPbMw/sSzzwDV?=
 =?us-ascii?Q?K1Lto5kAVZs38ANzQaAILXHOj2J5ly2NI+dDdpbHiNtGerc3H5EvNK3nCEJt?=
 =?us-ascii?Q?CtDWRCjqXS8GdG4/M8ZAeyRE4By+yJoVPLS1Q8lGv8h0ngyzxx0t4gig2lYd?=
 =?us-ascii?Q?YyZyj/o4VkHSe6n1H8GEzrQIN6o6UirIKK07edHJuOWfSBgQwkLHYaWYcLHS?=
 =?us-ascii?Q?CDCYTzZnUWQMWjUdVKi+WEnsiebmoN5ctrITqyNmQxbQpQApT+NvBj9YGVCe?=
 =?us-ascii?Q?i6ObRrtTdVxq0EekW9XxawfZ2V4N/P+0LLipXVEh3JR3wwaUN/M2rg3kizv6?=
 =?us-ascii?Q?ci4Mk///sH9R9fxHCEYn+zHTKOUFPZrm9KGZTwasEVzsmdC4Ca9s/5DH1DVO?=
 =?us-ascii?Q?DwPAlVvXvdr/qo36y3t4gRKEczr41xu7WdwgUA8JUm65yED+K41rn9ujUYKp?=
 =?us-ascii?Q?3XPyWtA/NVwLLnkVo15zvn8mtrDLVOVMkmyXRKj0wTWNvSvMoHI/UB9mIm0Q?=
 =?us-ascii?Q?IgSY/fcLCFDSxvr8nUJjoovjSu2k3csbQbvytXxkV2HgZNEYCfTWgq62Uli8?=
 =?us-ascii?Q?3sEG8+wuAOmC0RAlycICVTzJoC/lmwjXOt0v7RgcgsSEWCkFl+kq5c/UGODY?=
 =?us-ascii?Q?xZaAldxHgcTKfPOi5v0jlLytXhm30s1992n2+RweGbAnXzpg4ORuYh01nH9G?=
 =?us-ascii?Q?9BxsURRuKFgbY35VpEtrXPOp1FWBZlE8/MOoYqJR1dkcBA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AHRpj+lbvGs88T6lu/FR6ro3mAysjk4EjzXdZi1xatAD1pFXL85C8YI5x83u?=
 =?us-ascii?Q?Sn0+ok6icsgmo+x5/PjvNJQWD0uGqApmUa1CYz916MrX1oD86UJ11/0SGZIm?=
 =?us-ascii?Q?4zCkkwrRtvwz7bagvvKHht0pc1ZVQZw8IkiKaUNhMFste+NtRHM1/t+yF1HF?=
 =?us-ascii?Q?zz+AhPNHriYZgBruz8HGVTWfrQrOCN1SVn9edKHgQwLmMGLSlnkuEOHcpgDb?=
 =?us-ascii?Q?CMQqeB0LmuRlBkJioM6DSUlIb87xiq2l2JLYllyZjqtD9PO0GgPDV7ev0Sm9?=
 =?us-ascii?Q?CVtgxEPdScgZi6u/gE3SLO6Gzvd+3Ja4LTJWeI3e27g7gRUXv78mR0Rjxw5I?=
 =?us-ascii?Q?A900xEEx4tExDO7b7A1NAbKfe8zWRiayU0PHxD/ZmOggr/qZOJsE7b8rh+Ze?=
 =?us-ascii?Q?esbGqPAIjIKnyoo1NbK2Maml5ZnCdiPfoSlf6T0wf+BrZX+BIKSH1//CZeiM?=
 =?us-ascii?Q?95EeuT880sT12hSlI09NGWclvMhBrZ23BAbvAIFOIug6VDvWC84muYmgL6dl?=
 =?us-ascii?Q?EbIZQMUdc2WeYoK314TZq8RU0tFzwVhLfFoEMymdgka75kgrjP6qVff5IqtN?=
 =?us-ascii?Q?20vNHCV60oVQlz7XybGgHydswy3lHcCFMKKSShJGTMS164GjRkI30FMiHuWv?=
 =?us-ascii?Q?+klFZlFLjYKbtlaLPT2gKM4fxtUZjEWONXrdb9ZkPlPuzc9cvihdwcpjzjT0?=
 =?us-ascii?Q?RMVRNaDRQEY9qb6OIoWOI6redX5pckXwFjwRgJvTX+3zUqkFyQ+Sz9ukDgAq?=
 =?us-ascii?Q?wU+FMMiauZIyo1asuEWU6y0wbo5wcOywvZ9Qq8OAohC1FOrWLpOE2FyfNeKW?=
 =?us-ascii?Q?1bTlIwbs2V5IQmJD7/cWU6mcMGQ9I83LL6I9d6Kesx+hsxyFNXOTdiqe7dRI?=
 =?us-ascii?Q?yc+bYNec3NAbhZczfklQSkJv0/OefRwW83L25KN1b11PdQkUIEArZUsQY45F?=
 =?us-ascii?Q?uVnKzX9KgrjOC2sqZWa6B11Q83oJLSkxK/Qnkm6ACk5vEtbV0Kx9+y+vBFyn?=
 =?us-ascii?Q?TwJY2dXfObZcFSvrFoATz88zyCO7q44VhfItdQ+uXK5i2HTisBxArmRdtj/i?=
 =?us-ascii?Q?IWqNfGt4e5OMEBtIW7sVj5VPKsgtgXT7cVMzBy9ZDpgNMjJC6Ml22fX9rhLs?=
 =?us-ascii?Q?AoT8xir5AIfd1iS+8uf2XXhzM8CNwglABJT+R3IbvmHHg4AL0HRR+UeVHOai?=
 =?us-ascii?Q?SVxwzmBhC0J4w4gpUYjS5kXcxpqe8ruA/Kcna42Keug2FeXRFOMprg3w18GF?=
 =?us-ascii?Q?obDTVBzSpOgLmLC7MWH6v8Hv7Iru8VSPTm5yrdx4ox36faoUTIAyII4eLrVI?=
 =?us-ascii?Q?d19X8Pb3uj4fokAk1vq2kex1xr5qfVhgfY+NKrGjzScUVwUZCcxn1lQvr2IH?=
 =?us-ascii?Q?Qxa3NsKeuNe9RhKOHEr7oFQJPPUpS8X6nQULiCmSVQQHnEH9vHepKRYO0RAL?=
 =?us-ascii?Q?7QJvIoI+y+eHqHLGGoAp3M5TV9lIMH/IjRyoNFGhcofZdIcD43tH8M1cf1aQ?=
 =?us-ascii?Q?xN7e3bPpn4hCEgTcUF59OArgFZhpR+aWJc3BD+kNW/bQcXskK7GqTddqvY66?=
 =?us-ascii?Q?9JGtxPjipGkNQvFB2phDUPHt+8tLj02SzbP+MwbM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	qozYdwWLgS9eoXeOn9s/8gVwphlVt23KjwCfH8EUP7R0EyTVArHZe+9sAa3YTFqTdpyM1yz/fnyDUXGayEVQrVyDhnYsE20RS3wmE3OH3YAr+3WDGrdae8MPpzs78EdaRgMePifu2H43i2i/YRZCCa1LzJLNgWmtkKQ1DQ+qMu8lq68m4yeAva+xIJwOs/6Fb/P7nbjd/zJ3/twm3EYba9qSKxO0a3HnsdzMXuLOPwl3DttwUX2YPQHxajRUDoj62T8nPN0yNQbKNdDZ6Dgukhe7kpwN2JrdRTaEY7uMS3P4Ri/7cH7wX9Q9XQ4+7pdpsLC2PubxKnZNmf9mLi2o+WyCZub51Hw89PdY1VOz+Pjflph7eyefxs3z38v2xdM0CQdXt2AmH9kz0wrazFSPovpUNLun8BPIfm2p0Nz/jN7oBcF7U49TxQAvE2ME7nkZGnEcoirKQnYG/Ayxy1qGwxHR1Q8NQAky4j76HBp31eQZkXgsRdDMDjt/etDEvdL0/SX1MhM035OV67kTPLYyeND3rkF/ggiRmNmCAZRa21L2BwOwFSnFUq1c8/O6OAg7BlpSZr/hSTl5UdImKv6dJYvqggUvp9yTPOW38n6awZY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533122d5-5b94-4273-eb4a-08dc966b8352
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:29.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5avb8ZRbJgR2k/6/hd2dvlW/PkLHBxbt7jhfvlGfwByex0cODF8ANA2cCYI83Vk0xNXixhzCzWXaOdrf31QT9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7994
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270041
X-Proofpoint-GUID: wGW5Q9p99ZAv_vmEo_2ZUDkSqJXgMMDo
X-Proofpoint-ORIG-GUID: wGW5Q9p99ZAv_vmEo_2ZUDkSqJXgMMDo

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_as.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdtrace/dt_as.c b/libdtrace/dt_as.c
index a634b855..4b397f51 100644
--- a/libdtrace/dt_as.c
+++ b/libdtrace/dt_as.c
@@ -280,6 +280,7 @@ dt_as(dt_pcb_t *pcb)
 		case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
 		case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
 		case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
+		case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
 			if (idp->di_flags & DT_IDFLG_BPF)
 				brel++;
 			else
@@ -492,6 +493,7 @@ fail:
 			case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
 			case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
 			case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
+			case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
 				rp->dofr_type = R_BPF_64_32;
 				break;
 			case BPF_LD | BPF_IMM | BPF_DW:		/* lddw */
-- 
2.18.4

