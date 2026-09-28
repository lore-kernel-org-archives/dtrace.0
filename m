Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455E036B938
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618617; cv=fail; b=bEZLPMaFhIEmomrEd3cjzTVhqkuGQaFwaJtyQhA6xcMlU4AsqpQa+ewySDTeVv6SEFHKSD7rYYlZpiJkLfR7FnZVLHojqhBaL+9Fxeua9oTTphM19rwlpLtcsfakx7fPcoFnvaKKzgcm3mXcJU9+PG34p2UL0jX5sQ0B/sXqm7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618617; c=relaxed/simple;
	bh=e+gNsSORma4Hk5R0Vtee3k/Q/2jMf3Q812W0AnH1+QM=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=IZoGH6QVSAFFTK61chQYJjLoOr3q0y8IuWo/+uUaszn6qgI5IVVU+5viNCGyv2ykKCrMvtYLhsERBnG2Cu5qCZ2wdMC7BG1s52wLZz9vRv3MMqXmHZeERP1Hq9dOankjHQO3d1EHtgqhDYhz1JPDht6SpNn0NlSj8SNf6kRtjPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o0g5c0Zw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CKAPNfVk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o0g5c0Zw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CKAPNfVk"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDg6Y52548467
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Q8Q75ROwtc003YuuXTl/WsWF6q+UFrmU1rlyyC0bXFI=; b=
	o0g5c0Zw6G7nHbP54XSvc6RKtBiLfY60hhIEiRfKjlCB+0gDin9ymUzcMIKTcJsO
	zdG08ASDEMaRjFIwd8/tUvmUPtC6UtMxV8QwSx8qBHpfek6HQMR6o/gCY17bC3w+
	c4i7D+bfHtzNu1gYW72uPgkQ1FproolEVdvz3BELzJPQH7EeRVzSe0VUNllcN771
	+1cPEbNv8SDqM4F4KR1fAFwYg68vHo57QNSmPUpMBlDtB3h8cETfA4yjkStYQSZL
	RrMq9iv36RUMWbd3v+Edi1c0s8ErIwRh3tdcUQEfv4txBeD6cH/cG1Rd8pux3yod
	s9MUUFURT4kRgRdE0J0nLQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4y9bc28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHo3il040374
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:34 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gabejh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB6hvvwhQgd3bIRipmvmbqEz7YPrGBAmA1LG/iU01MDT9kmbX9E4i6GV/FHY06ynBCJ/aLTDOyapQCiiihCdua+0hRJyXwUw2MiMswte4X2rzO0I2xQqGPb2Gu2VTIiPAviHnMxYwM2E9kAEV4hg3Ff+As6vRFsHUF6JQAyJ4JZvDIqM8WeOYwMzFc951ladYV5mVwkKV+5qJ7j8xagIEfNHgj2RrVtGYtS9EQfAHrFHu+EF72KXsw1wpUD2yZ4USp6a4HtWwefQwQXFpYKde1ENWfbmTPIOyeZQaI4XMr5J1O9Hq22VyMGgA50awClpIXevWrg0TcvjJX73dKCo8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8Q75ROwtc003YuuXTl/WsWF6q+UFrmU1rlyyC0bXFI=;
 b=cJOHlHW4KArYpqz3cakuTiSrOMMVIdGuNnIdO4A5mP7+Rhk656lKl1B0mBydxKk7XOhdrYKa5t7WAQrrQRHGl5r9kOOeNuniZ8sj9JqXiv2kIwIYG6TM1hAjPZhzwMfmkXIwozM5QJaMQbm/hohOnzLuO29qtiNW/SvaTxq6UlLSeOY2u7xsVpGiOH3XbRDOV26j78GbL2iHli/lgvaaY3/unWFPbzlIs8tU4UL7bxVlxgRQ83ZxiE3dSW5di2WvIlaNW0s2JdO7rQX9I+qXIXX1GdjtJLWuxtC7ByCY2oMH6YYDp05Y9hvzYOpgjXPfX2bFQ8QhESu9WDm1qT6O2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8Q75ROwtc003YuuXTl/WsWF6q+UFrmU1rlyyC0bXFI=;
 b=CKAPNfVki5wr4aFkk2zBm01De/kd+HKf1S/9EmsDqnfDbGd/Okn/ez21Pzn+wj3CcrPEkK//jcFMUnbNyHQJQhjSwdAGjC3XL+NClT9JldPVhuVkINwztUsW3sFAOph3bO0Go6O3H8k8XCD9ILBTpaDUiMsBDeAUBPW1kRE05UI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 18:03:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:19 +0000
Date: Mon, 28 Sep 2026 18:02:05 +0000
Message-ID: <0cdf77bffce3b7976091e81c515d8c80@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/8] runtest: ignore BPF verification time differences
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::10) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH8PR10MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 3161e672-188a-4660-97dd-08df1d8ac72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Z/uW5z/Eqb0EH9V8HecBGYGcmr/+sWQnQVPedtMdWvnkcRG4+vywMfudHXnkOrmwvvsg5z19frJd8LolYDH+ejUYaC9azZifbsqzTT1mTxYzTB1JLMejN3b1mrSV9/lW099yIXWu7ett3Tj5IyrXWk2T0b3m/VLt9xsx8PuDsEUmMvyUo1Xx2fSXzXsknyfM/S75zL1LAxlLikKGWcUDuddlQLusksKTs/7F852t6UrcRMvGJVFbjj73E5hiDbmjF9QkvbwPLNcd+uqxfCNNTquLYRDdc7jjzecbYf40rU1zf9iB0p0bSjOFtTal5GvVcOeZAr8Ikb36OToeKfbKI3tSRQqADkgo0gWEBfONmxBpjUUSnyozoBoa9n0eGu/66818YexuObG6ZWKq7IlnaJLGp716TTaIn4lIPs2WRcvPMktspllItkzuLKNMQp6wENnwH7bYvjX1RrAlZ6r2xuOYkZrstX0cIG3lDxEaryJJqjliYbV4+DKc+lp5U3s/6nEgWrXYGyYb3RZo/vNkhyZamDcsJlSrpO2EGhwanKPBEUFWDnU0Ajz2nBKtAFy1oqChTsIGeFmQSoXKdIVlloK+KaiH+VBv5qc620XM4ShIp5Z7Np0P/W36BgrbwP/fXZKpn4fYPE126GSuacdQZMgr9/cwwjvz8uFJZRO9VI0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6navH26tnsGKnCAo6lAKO9gwi93tzFsaIIiM9GK2brQzD+GtO5PChpMXBY4c?=
 =?us-ascii?Q?Cp0slmd4ppJLchVBdZUmZEtMuE5RsoDlOuXyzq4mQQuxzVnMwio2UHCd2Tmb?=
 =?us-ascii?Q?+OufJQOnh7Nda157/Ewnzgq/sEKDHi39nGAeSgCpCUTnZRTGGlre/Ox8LcTh?=
 =?us-ascii?Q?XDckHWoJI85X9xcRe/3nq7K4Iu1zgpsO5VeOV+LVw+F5vaNex5Dnol89O070?=
 =?us-ascii?Q?tUUH5Y6NLLbbVsqdVg6MUP2FKYlkF5z0HnynlXtxvyzBjq4MISRpdoYGsHIb?=
 =?us-ascii?Q?dDJjk+hv5EKM9au5TJOBN7QQmUv8vRxjFz7iQuZFQ4vu+OTX8kLzSLhLj8iw?=
 =?us-ascii?Q?w4ubhis3p0zh3UCDSxo+mUKbt4JQaQoz6Zpdo7IcgYWJDZbnbUf8Nyz9wKAQ?=
 =?us-ascii?Q?imdlhfjE1IKtjpK9xeLKfAZXsWx5tJ1JiVyf6glUxlQ+Q/8cu2LhGkuhyrV2?=
 =?us-ascii?Q?Lf/QWZB+E6Rhv/7wHSa2Qj2k3/m9B8qcg2jZ/xxjWym0UVTb0eNQ6o2xQRNF?=
 =?us-ascii?Q?06itmkrj+nJnWDwhEevJazD2h6Vgirm0wKQlLJrgK7DyGpqZTmM3HW7qNyN0?=
 =?us-ascii?Q?welPfbih/J05EzD1k6w9IgNIuRWD1Zbwm3sx107IotSqoGV9FhmPjT29Wn8e?=
 =?us-ascii?Q?mryrSozPMqu7TJAsQtMkCwOHkpg5vygbMH9pvbxqfMapv4hiUcqm5sFi3XWj?=
 =?us-ascii?Q?49IK00I0RUeASEvLJ4aiYhpda2EkObj17up5GNFGP8QU46Dzhkvf+Q0+sT1J?=
 =?us-ascii?Q?QeHGWy4oc+W7R5hvQkLsOcnCpmeD1f/lU9Cs7z+YeerfQB0T5rrV779pcXqY?=
 =?us-ascii?Q?FIvxRJvYmjdrFk3M0suPE/6FZ08FrtZ2desgwaTKhQUCTARRi9QNCZaFXAA9?=
 =?us-ascii?Q?mHL7z1E2UXMlDex/XZm6DxDPq3jAb7uBNWaZnIGa4n7toZ1gFCv0KH7JCA/v?=
 =?us-ascii?Q?QhOa8wDGVqpOP1cpsdBit0S7PQUJ/KAcnFsfnFggqilyvwAUoOIcPhTNb3gt?=
 =?us-ascii?Q?LJpPBWJXYSRocKJXukLYrA3RKmgD2uxITWKL6u9aVohcqQi+EuOO/eoq7eZP?=
 =?us-ascii?Q?gcrYzpkeyuBLwjtE/sPzxdK8MaJ3PgHh1/LeIpjJTRiTJhyaAsqtLRd+s4mB?=
 =?us-ascii?Q?L3/k1MX8RNgyf89z9H11/K0cnfJAnl5iV8UV3vTs7DuYeuMd5wd9X7qs0ujj?=
 =?us-ascii?Q?PH6w/nxOm9+wH5BWELJ6UsVVchZPnBAYweCfW4p416wAouHTBXHFhuVAq01D?=
 =?us-ascii?Q?P3fcbMh3Mj4R8dnh/Of1BE8G2HXmcrIJPRlpLN2yP4IJghqF5Pze26KE76Qb?=
 =?us-ascii?Q?NuNuw9cbZ44vtz86SWuN28eZVyWT+fpwpdGF1uQ1PXcWbNXisKOOcGNBZS+C?=
 =?us-ascii?Q?2egbLdOy25e33jc9nQT6kQ1f+6Rb02B0VwXXusX6vT6b0Bq8MlCWVqTNga5S?=
 =?us-ascii?Q?thGZwxM7avoeYq8pEsSbq8WzXfOfSnxnkZuksT0dJQRLCZgOtNZT87dt+wX3?=
 =?us-ascii?Q?dDu3o+oLtAEFMZfNzxxjpAUJblojhjKh2clfFz52KuzY2+fSWXkIgy5Hnmd4?=
 =?us-ascii?Q?yvMEl5zTqzgqLl9WeQuylkeRbnTVMY94wB5ZF3qsRxG5paOYc9u8CDMK/IeX?=
 =?us-ascii?Q?XjAM/p5ZMwPsuJfZYMO/qg4yIK1TeWXvGhJOc/buQAUzW1a64wKaQAq/zzd4?=
 =?us-ascii?Q?WJoo+gyMkiT7AzWupDOOcSAkQw5ALJP8FuEbxy0NUKH0TUZBkrwTJyTsYiSh?=
 =?us-ascii?Q?/zw4orSMU9uz9izNhUj8YGxRwh+wBz4=3D?=
X-Exchange-RoutingPolicyChecked:
	ef6aNorLCpzRYjfn142LyaYq0x/V2SkyhpMqSAjm9cHzBP1XarExfKM46y0ZTorpFPSMVtUOvEetkb8OcwCgDhyjoEvwrU+kBCDOuR+0UkJqFnyuvJaLyvdtWAJ0szQrMr9KWOZlbVss3gA1uIZNGz1S9e6i9lXeOT+ITFzgsbPc/CAs2hRVFX9HobCEWvcvYEXlaHB3NsUZH4xQKHW1sxVq1DOydFFrOOZYfE9TfqvOt7mjbAgYjxse4gKwY9fa8hyKewEZm+QrgcRM1gbJ76paRSauQgYl/R9Q1fc00xJP9vbBDfNDVqWxmPUqTytE+hCrQm5C4+2HintK4NAyyA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	35m11YshvYeWVyBW7Oa1i/WMiKWZM42vPkvuUmhE/CVm9sSShVmWpgBr8gFpGEn7e7+KSMBc1Bk8q8wGMQuAhsXYB8w0RIFNHnz9JWYDMMZatDG5hNE/yfSwla7t4ZEPenZqlzfABhSjyQcrBeMmruA8widLb/h/OhX73Uq38Dvpjc3VmE/5hGPmOQMNitRLRwMZFvQEYEqfocm85RRODDQ9CratG0qgY3DrDRezH7sQmeX1AAnItcaOlqwhGXTw2ygaAklo2E1UCji7VKrPNydX5wwenSsMdBeLJonCNr3MkmlQ0bu3pup9VZqf9Qq19oVblg0PLO6VE5WxITzbF3ZySP4utLM3Fz4WnBywO9LogG96IudVj3Dzi0hRzhgVZtOnfG2vpOB+LijBvKIAbnyvah3TFskaZXwYUlP7Zn8DeN8K/KO6DUfxCPPrkP59cYy+MF2rKS3oKwofPbEKI41NKgPu3eCX2HAGIDMMGaVXr5sJ6jlJvgjRLLKp5oelZnErm4JaZN8TQP+qlzfrNqfgMWJFDi48OoVhG5K/1U0iOF0wOz5CBE4/ivqjL3v30D2c7uLNjZqrUVV7hi1gNJ9titRS5SvchmaUHJa25I0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3161e672-188a-4660-97dd-08df1d8ac72a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:19.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2NCPMoP5WY00/fIHktCXINgj+2gBXp2KBUjXZ9MGNMdWWwK2O/Q9A5LZNQWtWGl6W6zh9yzed3JQC6iaGIQkFpEVD9zr9JNYDEflv57X28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6337
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=943 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609280071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfXwiJZNLgBQSXU
 wNrEgMqOZ1QUyQ7aImg676UiNJ2fZV88zwU9KIJDA7q57hIwur4NpVY85vnN0dLOnEiC/i+rL10
 gUsmkUCSPKjhL1h/MWub2H0Wc2QmppMdAt97z1HrPV8MVLwq+aCUVEjfdXbIs2JaxsABcrGVvV0
 lZcI3ShRcPjzJUmKLV6SAnc09FQnTF3B3oxNJ7nEruMYXKGK7vRlD28k8HUII7nR0m4cdtoqI6S
 +UZpEnDlWlR3asZ7LoUe1DtfHT/LKfnYPOru4X0drLxr8nMAd3HhVWyGq5SqeMuRDU4mg57XX5u
 vC46WnuWveBZMNMG54OdSQQgBAWL4nFGv0ts3bESVqfLhWCA+ZmWBde0HBgQtS7LZbiLUsqEziT
 inu4NoloCssB0N1sDjIOtRl6qsilLXQI6+AFKjzXIm5lwAvctqlPbjCWNZupgY9sm38lGZJxGwn
 jmP8Zo6NU1RxVA7PGhQ==
X-Proofpoint-GUID: bHi7aGWVgH3zFG0QJzxTqmZu-uXqZ5x4
X-Proofpoint-ORIG-GUID: bHi7aGWVgH3zFG0QJzxTqmZu-uXqZ5x4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX4rhVLNp2eqOm
 yu814CRK7SYqrP2VxVub9o1xAdO1jAQWoCa2faqguKscSVqwG04odRPxRdwWDJllUlwm/0NkevC
 T3si3JyrUiYdzhWOAArUdhEeeJcuqj67VJApaoj/H3ZEBnaezQOJ
X-Authority-Analysis: v=2.4 cv=IuyL47/g c=1 sm=1 tr=0 ts=6abaabf7 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=vG2RLZxd2NJGF_5I9BwA:9
 a=zZCYzV9kfG8A:10 a=WmVTiCyuxqgg3mnwYu6p:22

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 runtest.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/runtest.sh b/runtest.sh
index 9f06a499..836613f8 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -510,6 +510,7 @@ postprocess()
     # values which are not continuously variable.
 
     sed -e '/^==[0-9][0-9]*== /!s,0x[0-9a-f][0-9a-f]*,{ptr},g' \
+	-e '/^BPF: verification time /d' \
 	-e 's,at BPF pc [1-9][0-9]*,at BPF pc NNN,' < $tmpdir/pp.out > $final
 
     return $retval
-- 
2.52.0

