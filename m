Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F149EEDD
	for <dtrace@lists.linux.dev>; Sat,  7 Sep 2024 02:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725676510; cv=fail; b=pQq5CoGNQv3Yp1cAViBQKgiuIPCVGMjf1Go0HHjagXYGG+IBA12fAAuOQUy2ompL/aVJahg8CiFasKh5uOibq6/ZZFCokSy/FZcx2f6Fn/L4mPLQjEt3ok79cjfxvgCpwMCAzXOElzIzHazV0bkzUy/dtPbpGpMTV9dEQq4LFto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725676510; c=relaxed/simple;
	bh=ait5Ialaevnwuyco1KPetQkAK3aVdl12ijzcVW5w3dk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=hTOQ2GZMsYCk5vDzdAuafYskthC/dplhzQHwZ3LxYUxdOWHmdMwky7MVaiP1/0t6DEUtuhQhSy0PeH0o+Z2gk7L0+6EUdTwPUjxDFOi0hucT+I/6Tbwu/e54iIDZTUC0lyzLtbYsiV7GoZz7ex98Ti2TLrknStgKkId0e7QmBEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cK3hZFme; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V8hwmTp6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cK3hZFme";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V8hwmTp6"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48725ZoN015472
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 02:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=Vk8lgUT0JqMNICiFeZV78/vUHNrQSlYGAQ3vmSijcxE=; b=
	cK3hZFmem6JKo3bS7VS970vcG4e/CI+ZCstmn0x6O8BE4yi96s6NaenYqWrtISbh
	jQqE8hIx7QW16vKVmxTZH3C57TmRn4Rp0Fh8mF6JEqlL9lQZ/mmg/PcjfxRJiYxT
	4//osTVo+cDSD6MSTYicCLTqx8GDrIjJ+bGtgmBhHFP0mWYW9YUyVcmbdxIvdXG3
	0gfIek+btOwh6kPMahk4PM/18ywM8SKANbCyV3c5qUspewxPPDikm66G7U1M/zwz
	lEm0C/jDVoy/bTSiljJDRgyGALL+MmXjJNvAEY5bNQoqXhiokU+Upcp5Hn1WAfsb
	PlpUyizf8Er92BPiDcsWow==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdrb00gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 02:35:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4871XcAp033574
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 02:35:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd95gv9g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 02:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdH70EmVCsbfUT+C9Cz8cC25veEIQgIWIk3ychKlicPozP/3tAXVZW0kBQI1DAMdzZZvOkXrvzWdtVQri+hHC+VK8DHisaFWsmSIFjxWDfn0K04FNZnF2xgwuvuzg4YqX0XBbpC4pqbSs1Y0TJsyFsFWfnN7RMbppwkg52SBZ1QrcIdGWL6HT3K4H5mK0T4VeImCVjGNBT+inOxZxxPFKayu6STJaWQVTADcnhRXKmzjA4meLAaq4cqG74q/JbzsCYyx+18P/9veIk+fyuRswT5nZDkVpt9YPvjOdV6nb0a2Kx3JGolPgSWijEdUF20aHBi95uiSMh7Ob3rME+zheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vk8lgUT0JqMNICiFeZV78/vUHNrQSlYGAQ3vmSijcxE=;
 b=h3FGYm6eT33GHzBFmneLvebcZoN1Ox+aJsX+nA0XkmdeoL7QE2RBaN+p9L1neLKrb6P+tv39BPrUDZhzZiFneKoP6Intj+KpORou2LjhuoQk6ey09oLG2H/LNUiQy8fK72m7Q6kPfjQAKs8kBDL6tgKhXlYbkO7xWf+SFqdIM3q7ABCrqzCYu0t37prX8zz3MEzLDYa6UWoiCtFuIpFNSMVXqGKfnPSxd9l1Y96bcL/FuGmg2Dfg+FLAwB+kT8CN6dAufrPSKeWhUC/qFi0MoO2CjFl+dn7rwb87bUKZeaDKLOQj9Il+ACAwjJ9QVo7x/DP2FC0i5It94i4kvQmazA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vk8lgUT0JqMNICiFeZV78/vUHNrQSlYGAQ3vmSijcxE=;
 b=V8hwmTp6iDlKv4upP+9/DpRu9K0+hMMef0nDDGt8XAXJX4mCbh2TIrp5hNLxw2JUvkmVfkCOphIQlYJ2lbDvWPFUs4ZSM7keQch5lD53jLTTFSo0dZ1d151aijJLXY+U6/k7bPT2Q8DZqy/4bk+5Pl+wIZU4PB08SmWRMpPxOhw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA6PR10MB8205.namprd10.prod.outlook.com (2603:10b6:806:43e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.10; Sat, 7 Sep
 2024 02:35:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Sat, 7 Sep 2024
 02:35:03 +0000
Date: Fri, 06 Sep 2024 22:26:18 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] error: ERROR probe firing should not corrupt probe
 arguments
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0043.prod.exchangelabs.com (2603:10b6:208:23f::12)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB628741E2D7AE4B5E4A4636E8C29F2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA6PR10MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 148cf672-6e90-4fa4-e0cd-08dccee5adc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mvuqKZLm51IpTnlykJo8d6GpMvdQoo36HpkKzng+z9Pd7kXJ1284b+6Kt3Bp?=
 =?us-ascii?Q?6O+p1hCMXnFGoAqfn3w1ICxfNn+p9o4lhAg7kkIihxXToHHqGc6iebUXet86?=
 =?us-ascii?Q?IDboU0uIqe/wCRTj02PzsokO/aEMJ6JLC9ur8vjz7D8sIcLxjbl6k4Visq9o?=
 =?us-ascii?Q?EPzq5eN5x+1oaRIpboC/oEEakdd3xkwi9Uiw8ZFIEQoFUOLtQ2as4ezyP9cz?=
 =?us-ascii?Q?6oU445ChZe5jT87lKHp44mytmdD4NgkXSdaVul0whYKexU+F8oNGP5V+SCQH?=
 =?us-ascii?Q?7WqT6BzieOkHVs/ZYP2tBZzxT7LjJU4nnktjSO9xI5aDVKOMtz0BxdHWnDJp?=
 =?us-ascii?Q?J1GijA0XHQZissMRaTOhJgRwQftmZsdtfRAGwNpNL8jAQA0xH5g6xzdvwEVX?=
 =?us-ascii?Q?sc2iSOcC/+0tep86fDLB+8ELbINnC9jwoCSK12vb6oy6dnMdaBG0d+RUGOgE?=
 =?us-ascii?Q?pnHM7zCkZaTv3RvUqDheA+QjMNjtr0lmYFmsukpExYGvOoSLzfuI0m17LmMC?=
 =?us-ascii?Q?nRRuPS6gnYO8Rxc6vxTTWeCGlgVuHWqoDEB7hbV/P9VzZYD/oy4N0uiIB94x?=
 =?us-ascii?Q?0bXHoSFZReKiAl3Xjf4LGjB7BTCnKOigrJXiTtH8hFGFH3vE0vAHvtkjh1cp?=
 =?us-ascii?Q?SqQGATBl9hhx5CTjJ/ofg10WHSEBxN+Ly7zYabN/eoDfcTaMhuWtPYyG2K09?=
 =?us-ascii?Q?ycSzGmn90OmCy8XXi4p7kMfERr0yCUt80UICxCvJdXAxyD7ovg73gCbC4nq0?=
 =?us-ascii?Q?UPAuTeYiP3xs0cDqc8Og6pKPWucJFtbbAcISlj7hlLiKmEg873ACGCaIXdWk?=
 =?us-ascii?Q?G5iZ4cMVFqSdB7L3iM7l+SdJMMsYQ0keoxplHVhq9CcXxcCmcmusMeuscXpw?=
 =?us-ascii?Q?HE4rBjDYvF6+C7eYEWqOhoczWv4Sz4CLCEP6JOlT0DaBxgedEIY+z5+MQP5+?=
 =?us-ascii?Q?VqmEC3z2fAhQDcWDCBzbM7ej1E4ike7zmM8xycGxWjZ3dEEU/FWkohZONJ7I?=
 =?us-ascii?Q?9nSDXuKlAHro7HVpEcsISk6G1N2i1X+cMmcykK1+wdOHdcwmm6ubwwqNaHIY?=
 =?us-ascii?Q?ayCYrLig1qJQdSM4ZDF7s0JEXiZNBYhcWNfuekgt1CgfWlc8G7/w+kPCIoIe?=
 =?us-ascii?Q?oEYhSTI+9wj8TRBrI1i/rx0s8GcqzvM9aCrCGeFvYU8n3YM4aBwaqet+yr3J?=
 =?us-ascii?Q?I33rI44iSiXCdVTYwJZx6lOnPcrgYDDpYtqW3UHfwANix8x1zG0y25SBHiG6?=
 =?us-ascii?Q?P7YLugDgTIb4XFLQ7PDwIISaQnqie0xkxCTLbnnT9z9x1schbeufOJFTy+91?=
 =?us-ascii?Q?FgcXsQ+Ys+XU7suqyLjOx7jmRzzAniGjbwRTu6AjywNreSVXl06RSpNlmVAN?=
 =?us-ascii?Q?YbGtpHU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0EkpfyyysWGHmMGwLfQ3YE4uAo6Tep/G22T1aypGS8XdDW1HLtabWMA9zAu?=
 =?us-ascii?Q?208Ja1nZ/pm9PwFxxcel210U1isIacqU2FP5uTcM/MNcH5mbehehTEtJIivj?=
 =?us-ascii?Q?TlYfUbLMWHpMJ2VDqaltxZcX91nbRYD1aCUth4vgTsEa7kWYE7Q4RqpfKjK4?=
 =?us-ascii?Q?IOAy42byqbMBaqpN7pCCUcii+mFwHr3XgdL4jm3tIunPSJ2ISav8fZvBrMrt?=
 =?us-ascii?Q?QgKo3Q6r9F75Ji+Z08xUw3ifypvb62CW+D0fam7xK+vJp//fYFn2D4mKDbo7?=
 =?us-ascii?Q?JYjBLZYtnhhG0NeNEKNwGZUd0nLTE63ghW/lA7GMGLVPTJdyfJ9Zv5DA7QgR?=
 =?us-ascii?Q?7hoqlqYHQTqE+OIjvWcEsetn8HLQAZ44lsVACFoiN8J/k4fD0GPdSbMFs4Yh?=
 =?us-ascii?Q?/xBuKW6mJhsm+1kF7+mepkAd3tTW1RxXmNh6oAKv7ui2WE4MrbakX4d7MFhl?=
 =?us-ascii?Q?94T+5FfB71WGiICSGEDW5EVKqwB8ur1xNJbOSJmCPNDv+BJElMWD5vc0G70x?=
 =?us-ascii?Q?FVmKhAlgcY94V/m2aRset7wD+5W9yHBCOPA95w3jBG1WSvGuJ0qhDBd1RKoc?=
 =?us-ascii?Q?1MPKVLq5T1EB4Z41Y77aNf88VWzKsuBeTakxPx+OnUj2bPyj/c7NgLYTajEU?=
 =?us-ascii?Q?8/myIauGOZ941hfeBwJ1B9SQws8Dc+6SepqdtAWxp/+1QYj/CWuEmEB5mch+?=
 =?us-ascii?Q?o4bHHEIsUmP427hR5QRgwlQaQqZe1ICAIT/cfqNhwbQ/5se4cLubsQ3GpCSD?=
 =?us-ascii?Q?9FhvGpbbMAf+lfXM84XJoE5HCBcUq77J8FoJu8NX9Bvpqva0J7zZzCr/MJBM?=
 =?us-ascii?Q?0g6muMyZTpTQj4qX66G97f58sBZaazrCY9TeVZz1VAjM9+rubGtng7/VMyHR?=
 =?us-ascii?Q?tJbF5aesF5TjxtK0BEePaB2hJLjbL4ilj2tnuRd+0UxllSrhrzhL4qzvRvr5?=
 =?us-ascii?Q?Yp8mtY479prQBH5qXhY2iZwYyBnf6lZGaAKhEE3rfHFz0mPMqucIQc4hVOOD?=
 =?us-ascii?Q?SRlJZ9YKH/1gZE1sLQkDDHh4VD7rd+axGbfp7R8pibG3AiNvQZDAcCzj7koz?=
 =?us-ascii?Q?Lf9W6WG0c+kJrkpu3+pQ4QrINEq8f6FftaxrRl7LNV9F3dY1tf4IU8CnJM0q?=
 =?us-ascii?Q?ffvKyLTUrITHist4pU7bvXpNGY5WtoV0VwP9PphHGlpGDizdI4ZQAeqULC9Z?=
 =?us-ascii?Q?QppPoxQ34n3CD1BROoju/0t9GbaAfwkqD4atPsue4x+nFfy3vqjJ1pNKYPMT?=
 =?us-ascii?Q?Ru2y/oGUwW6HsIjb9qN6OB12rf7DhjQmNXtqeFu8dsxLZ/2V3iqU4PqYgGx0?=
 =?us-ascii?Q?V1LV8XTjiqXRny9ZSwBwq8amOo75zMoiGOZw7nBxkcELhrcfvfBeumSr/ebC?=
 =?us-ascii?Q?O/pCwOsuU1c0h2FaQC+DAlW8RUnKKAspScsuwmBu/yq6Tiz7HisTvqtr/rVG?=
 =?us-ascii?Q?R32E7kmm5hJz9OOBcaSTmBQ4htr0Z7JWoNQZiV7XM3U+tgsWOxrSibgpwkJ3?=
 =?us-ascii?Q?22R5uR/NyXSpWutaepK28lL5zzaAw6SDg7lWWpdGaoHT6oxVZ1G8gycupSwC?=
 =?us-ascii?Q?muvWx6uXg6M8+wIjw3VVbF781xlMIv0ec0WxJ0cR5oeN4niyQ6KRvR2jg4Cw?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yDzCCO4cwJzKj5p6tVKsU+FBCOghQ14wJQdEO+alUw3LQDZxuxw6YPveDwPQ92sjFybDj0Qx7zZ2J0qI/lD9FvGigFnq6kdTeoN541mPLJpsxs+ZaVgtrGN4HUf0Z6gUCUrHcVtNJD3tJJMMAud0fcjvmeuhDDhr0Zsx17D5Sj+9GWeljEVzKmD1VNZJVm2g5H7YlY+xtYQJIxe4W+83pUEEh4eHV5GmKk+1urEnTw9VN79J0d5uO/IkxSKBdSQU5jrppXg3ygQ887kc6E+CiiVphlqNoSwW3iPMYVaQn1mb70+SUOwqy1xa/bfdrixescC/r9HDM/X6710ShaK8x/Jp5JZH3H9C64ZdfL/1EpQn+jWzgfcgM8N+16Ehhg9ndltQqgkMy78EJsgzqmvSxEjWKSwFPAErteHY32V/XpOB/WtobWYuPjfnO2bNFK2D8J+Wlkefn4UXyPJUUr+5y5yxfWTcvgV64JrFuxp6uOkokXY6MWzDgG2Pby2WVT6Gvc+5Ue5ucoEzmZvu+j3ty0gn6+Nowh7N1g/MJlYZO56DQLr2+THDKGTRLhcptUtdlqQaR86gLbfhylWxDCZIs0vq02ukFuqE+V4zoMUT9/I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148cf672-6e90-4fa4-e0cd-08dccee5adc6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 02:35:03.9054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fR1nWUgC88L0e2rdU2OaitDP/2uhvlQuPkH3G4xPg1Di+/jHpEo6bDOXNWMTpatkJg5DUR9YPDPu4/H3YBLSU06OuUu3Y5Pm3ufQP7tZ6lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409070018
X-Proofpoint-ORIG-GUID: 1R0DhnZd1sUvhkmNDj828rBDlnxnU-BV
X-Proofpoint-GUID: 1R0DhnZd1sUvhkmNDj828rBDlnxnU-BV

When an ERROR probe fires due to a fault happening while processing a
probe firing, it was corrupting the first 6 probe arguments of the
probe causing the fault because they were being overwritten.  But since
a fault only aborts the execution of the clause it occurs in, those
original probe arguments might still be needed for other clauses that
are executed for the original probe.

Save arg0 through arg5 prior to calling the ERROR probe, and restore
them after the ERROR probe finishes.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/probe_error.c                             |  3 ++
 .../error/tst.argv-corruption-by-error.d      | 48 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 test/unittest/error/tst.argv-corruption-by-error.d

diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index c8ddcdfa..49822172 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -26,7 +26,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 			     uint64_t illval)
 {
 	dt_mstate_t	*mst = dctx->mst;
+	uint64_t	argv[6];
 
+	__builtin_memcpy(argv, mst->argv, sizeof(argv));
 	mst->argv[0] = 0;
 	mst->argv[1] = mst->epid;
 	mst->argv[2] = mst->clid;
@@ -36,5 +38,6 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 
 	dt_error(dctx);
 
+	__builtin_memcpy(mst->argv, argv, sizeof(argv));
 	mst->fault = fault;
 }
diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
new file mode 100644
index 00000000..6fd1834e
--- /dev/null
+++ b/test/unittest/error/tst.argv-corruption-by-error.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A fault that triggers the ERROR probe terminates the execution of
+ *            the current clause, while other clauses for the same probe should
+ *            still be executed.  This tests that the ERROR probe invocation
+ *            does not corrupt the arguments of the original probe.
+ *
+ * SECTION: dtrace Provider
+ */
+
+#pragma D option quiet
+
+syscall::write*:entry
+{
+	self->arg0 = arg0;
+	self->arg1 = arg1;
+	self->arg2 = arg2;
+	self->arg3 = arg3;
+	self->arg4 = arg4;
+	self->arg5 = arg5;
+
+	printf("%d / %d / %d / %d / %d / %d\n",
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+syscall::write*:entry
+{
+	trace(*(int *)0);
+}
+
+syscall::write*:entry,
+ERROR {
+	printf("%d / %d / %d / %d / %d / %d\n",
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+syscall::write*:entry
+{
+	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
+	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
+		? 1 : 0);
+}
-- 
2.45.2

