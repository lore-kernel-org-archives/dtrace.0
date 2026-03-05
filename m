Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BD8299931
	for <dtrace@lists.linux.dev>; Thu,  5 Mar 2026 19:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737871; cv=fail; b=CBTE6df+eSaAjOyggCD3Vk3EPRaw7lqO/u6VvlulCMpi3DKcLFt7jKFUOB1jfrD0jSUWmBvSdNvuSEVufmMZ57iACr6LYVtknWpzy50HRwrc9aR6iRXdkttgaP9EgCpVG0olfZp6SkbGBHD8K563mhW16YhWZNsrmTdRdAMAc5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737871; c=relaxed/simple;
	bh=DZyvye9L7ZyJ7oShzZJCBtNvXpGjsKw2/B3mgWU/jgc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=apGjCdifjTz4iPUqEBYFHTsFXLJl/uVSfM859WjGj2QrvKb32mWb2wpn3UJcMwDbBhNhZJ6w+N9J64sXLA2MQCCSnVPxWIABkbQIC4YWKySrQfcpN6TUVs/KNftv9EMRVZnhu4DN6YuLN0wj6jlsQl2J0fhQ+iV4FauTQXzb4gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MPivrvH2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ye23xFLt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MPivrvH2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ye23xFLt"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625J6Y8i936421
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=g56B54Dy4UEYOSOPKJ2AkOKvgbMGAsJeMmLMJ7X2V0k=; b=
	MPivrvH2Fk+b9V4QlgDkLv/O0UDFakPBu7BgZkXyG6M24WRHVT/unTv3TrAQ1bC5
	DA0XPzALAXC1w5LbcaCYqJZgp6YUx/2ZalEPvfkHVYYI4nM2Yk6mp5/HjCCQFeig
	C5XSvET1XmWYOm8kfImIKJHmmXpnEbvHFXfAsAfS2scySVUEKuCEffFMdZf7Kglf
	1ruWLEUosy7u+jFMyjgK/3R8mz16pBAq3f2MT1l1krMBqIiv4dvPR2Bgx/5WKuKG
	wICIrh2GzvEwb8kNY0KiHOU1Yrrfs40/hd8Hu+jHM+uXI37Cuy+NO5CgosEJMn9h
	3xmpFpwdmE/DWhZPfz5zNQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cqfpvg06e-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:11:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 625IeE4v001411
	for <dtrace@lists.linux.dev>; Thu, 5 Mar 2026 19:05:59 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpthy6dt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Mar 2026 19:05:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8E4x1zXmvgHvlpOVFUYa+T4DZYBNhmxVpV3I7IU5HDVn+O8KHJTZWWzMDe8xS5CKLF0f7kknAux6N/R3wLUCkQOidrUy7tDM8aOXpJXzYQwErafLbmJdd62eUDEvA0V7RvtB68kStZJmjCQjnc+JEZZkTWhzvgf9+7e8Z/U/LoY/0Z2nK4hWqxzuXkfdb2tEgFqws5j7SFaEfhBQVMpjmWt/uC6rlbHkJCQ8OtYpm3iVmgUyaLiIXqghMZpJnu95iu/bjJBSsvuVZsz8s5UB3IZOoPyI636BTBbxiAe0ztcw5jv6OG2E4IuWQ3oqMn07PHRMB4ntwSBiZ/X1rn+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g56B54Dy4UEYOSOPKJ2AkOKvgbMGAsJeMmLMJ7X2V0k=;
 b=MdMwPfkLahByH5CGFHMWz0Hh9hI6SfI8QDtjNhT5lVESGj2zg+Xk0XZWeQlGr3RycBgRMetBWzZ14JDqiEf59oxEeKX9epSKSVc2cr+BUx+rjycxgI2A+qTSO/ZJ/FKUGwjcjgqNX6SEVQ+LdIxkkFN6ByhE4gbXWowQM5+4WfJPOx/+vlE8z+Asbbn1CjXOPaRTZv0Y1JFX3ZFyj4GRuMlG2fvGLXzisMIOiA+7Plw+Zx7OsHMnu/RM+GhMrUsWPZAHEekaxY800lHsqp3pb6yw0IwyGTUe3kVvc7n7Y5gcoQw0wBD4DQkrbmaMA35Z5qESN2eqx38rggbM7DEyeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g56B54Dy4UEYOSOPKJ2AkOKvgbMGAsJeMmLMJ7X2V0k=;
 b=ye23xFLtxJOxk96lycOT6pBnKYZ+KdmXBNLJvDDDoKmc7b4RsoEkZ1KHVSzyt3VlcwAkSJM34EWOoKD0J1Q6js8/M9f0FOR1qyga+syIWFuPkGZnZ7oIo5fLpkMwiNkNeFqp6SurXCn0gw5o+iXKzIdzj5sDoKVnojvMGlkmjBo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH0PR10MB4469.namprd10.prod.outlook.com (2603:10b6:510:32::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 19:05:56 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 19:05:56 +0000
Date: Thu, 05 Mar 2026 14:05:55 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] license: add overlooked license statement in
 bpf/GNUmakefile
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522FD4259C76530607605CDC27DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH0PR10MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: ba83ebe8-db4e-4bd3-8333-08de7aea3b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	rW0U4zKEakCmFOxUgQ03lUuwF7yh62OyVXjNUc4S261K7x6qhQtxzrv7LBiqjxpNUiL2K1nmt7aUW555FCWNSwxj8H1o5B8BEQNJ3qDKo8o6UolgeyXFGlErrUNlG7ffdvrIRBe/JhiOnG4AvCE1ej9tA91YaXH1zzno5p4TJfJLZ7kyq53xxjy9Fe6mo38g3GOnx6Z79Kt9Opx9uTdyqesmUWaP0oCdv1YA+Q321CtRgL3HDm5F9pIwEz1OTI/4EtY0bJFdTAc10611klBzeGsbZlG0NVGrvXfzow2qpSiscJv5YS6i0rl7J+PG8UQJ+4WcroQzAaJIe39hy5tLJCbHsv2nZle4Z220tCfZrwfAktM1HMFQeEfAhP4C/szzN4EMm9SYhPdgzJ74juR8ve+bHJnBI5cplIiVk/w/Beo14kEHNXSxalYHuZTt9rRJvM2OL7qKMaLKXqE9sn5mVlQcLhINRAfGXbpQdd1lUVskHUFhkHQJsBpIu009GuxLoM98mBz6irM+TA1kO4fthdoTneGdX1+q0eC44T+KvgjTTpbuVZHXQlTp3LYTX1KSDZBvzQNwoYYcDHfctY6QSwP3o1n09jQesQrEYJUn+Tn9l8KBkU5G+YoImSeQxnbzVMtihNuKXBqJShgWA7r58BBuEVpDh5QFI0XLoMwnaSnlMRU6jpguNiUZQ38FbO/Xq7+pctmSdOISd329YoZ3HiSGRIZEhts72FI+rxAVqYw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LzwdskqwA7MNg6baHx9v4kbAVzNxj5koQW3FqQk5w0VobkWeIyRRtHITy6/j?=
 =?us-ascii?Q?B7uIgcWO/2UlWwk+E+UmOZbgiDmfB3GvG32U8tMZgUfqRDdKMNwUUWnsr7sO?=
 =?us-ascii?Q?rjJewlm7sAyATFpgXw4f8aMTXHU1mDWjNx0dzUqJlrRdclFDw8NNFzdfyrJx?=
 =?us-ascii?Q?QfiZlcgoc34VmgUtb2bDMdfIgsUQG3vkrOGA4lJr+haINSdQAzzu+Z5bArUJ?=
 =?us-ascii?Q?+6vhfzUsfDvkbq3KJtDy54X8hwxdyF+p5dRH8TWMWWLKr8hawO7telV1k7JV?=
 =?us-ascii?Q?t//h+GT36tG6nSjG5KJITl5RlhAd/qDqIuJSd2F0rUsw1T7GwnYErEAcx8/f?=
 =?us-ascii?Q?UdAfG6adHZq5/D6R3IJT1XfsRTzPq9wsyS0/AP9aaSAF9L/CkNf3cnZLIATG?=
 =?us-ascii?Q?hvh74twcQa6YYn1MqOwWAdgTGvoiiExGl4fcoPvxCt6mdhOV3sLkSFviBJGI?=
 =?us-ascii?Q?YEoNiVCaMPYI5BTnqfkoq3UEMG74+r78w+pWTeVOy/zp7iaK4cU/brPK2WmV?=
 =?us-ascii?Q?YhU87nDehwim75AwAChWQIa21LUrqbpmYYLdEghXOlIjV5O9//+Y8SeCFaK7?=
 =?us-ascii?Q?7bOkv4XcgXz0Bu5LUQLrdEj4fhJL6F8LdvRVIo6TInUGL4sRSR0uOY5MJNdd?=
 =?us-ascii?Q?l0D+nl+09thGkOuRvU2XICNRdNzd2P2RTl1iXSEonjLxF64SP2s6Hl4AJ5s5?=
 =?us-ascii?Q?uurnizhjc115Gy14BPWFfWEfdA1pSRyahlLEIUpg1wgoA6Y+j9uQni3h0Vqx?=
 =?us-ascii?Q?tdRNK9TcCCrIwTrRi63ROdA3fLhqF0lyyYEoXAwv0/FSAVXGMbLkcbijmQw2?=
 =?us-ascii?Q?Cf5Bi/Ym5QTbPqbCI+MUn5tp0XEGeRaH1sK3GkVmb2T2RulxtFA2YOLDt781?=
 =?us-ascii?Q?iLo2FgGkHm3+lLq/B0GAyW6gMEt/vQOsZX3kSZrDLb11l7LSo6rSesc8CJPx?=
 =?us-ascii?Q?h/9k9XPn8gIVl0XMGp5l4YngPvOyYQ3WyvTvNX/cnvi9HWF94VnaMX9dbUSW?=
 =?us-ascii?Q?05ZcAW1R5dD980YahYRq55lL6GMbhqyALFpv5bBDDP6A62k8cTV//MUNBick?=
 =?us-ascii?Q?QSKQ7vWmH9wIqUb0e9DlQqlEYr9mf7jg9pLVzib0tvHQ7I8HD1BEJeBLM1oh?=
 =?us-ascii?Q?CsBJvWoZM9llkZHJDCols9lury/UxOfv4CM5G74wpaINN9hyC7zKABdw3Qea?=
 =?us-ascii?Q?A/svnGQzpYTN4Q95SRLPzHwHxokqatIeW0MeedsZReyxec833hwECNgtEOpg?=
 =?us-ascii?Q?IbmvdX51v6V7Ih87w6C2XKs0dtIR+hDr0P1InWsQe+2Si0rE5CglErELtQcS?=
 =?us-ascii?Q?qATR7HhN+aGhNPJVZu7fsEcjp5UBdaxVwt4LAdvAreS8P35r4m3SUyYaXdqJ?=
 =?us-ascii?Q?hUP0XfNWAjPhDt8+eTuG1/q47pgoaMiy6sQCv/j85jbQug4hzkG/0NNLnWS/?=
 =?us-ascii?Q?GIwvqVS4+UT0vL9zOo7QnFFsX0yH/VEsDK9rnXIq1k3cbbqHpA1DRA1wgITh?=
 =?us-ascii?Q?hftvm7JoRd7akJzJEb/793NuJHCaAaRg4HzM3xhFmeQ3+IB3i1eA/wjMLliX?=
 =?us-ascii?Q?5z+Zaa7KdjMr2Rtb5NItyt/wj/mowLLpRhIXJz1uZX7HcXaOrm2b1B2jY25p?=
 =?us-ascii?Q?MKf+uiQTervhcVZ81Y3ShEImDH2i1WazoEzL7pNCBSsC6rqFcw/3coNfNSmG?=
 =?us-ascii?Q?qSFJ63fdcYJp+zfWSsuTthiicCU/cMHEZVq2G3tZtLLgAFADZ9xueBZM+I8A?=
 =?us-ascii?Q?1sj8vlT5bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/HZ1NRZqcz72unRjmX/gvFU9J4C6wFjKPqgV1pWiHDBOfZ+4CEanlG0Y9Yv78dciWHwjvyfOeX7wajUiD5NCY5HigqPiNoFGP8YUqkprCFWUflNXXXMj19Q7/Ikp5ObhymiT8Yzlcfu80KWX7MCfXjGL7Tit2y3h4bFnI7J/uF0tAiJXL+Vs4sf2LNsckdttQ0nUfFL8FALeLgMQ1SWs37oa96V78IxntiD/QIbpzcjeeak/C2u/0wGpjyUNmLkYSeMY2g6MudsGGJRwedCa+NLzujz1xcAYW3xvqIg/qHQlXBM9ikYZy9QQoyhLJIbN9cKKRlXIu+E48Ykk6NlQsbtUlfs+YunJyWC3emY4zCgbVW8MvT93n6t1QBaRmFpHNwiOBdUzUOF+jw7Gipa3ai+X8ncWxCO104wLt9qevDiw4LukU93cZYE5rJ7K/uou1NmA+GxiCt9QCc0lhTnNAuIecCrEJqb354WDWI/2XaucbS93B58BK2X02jGwr/3K9ghjXWrxJI4LyL5k4C7VVFuWwHqeXwdfLl3Xsa87TQMHV8wwhuivigIW623IsUhCTa4Pbe01EyRS1ImdsRJ3GSeSZSlXyPmrQW8T3Fi/B8M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba83ebe8-db4e-4bd3-8333-08de7aea3b02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:05:56.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NR5ZCKI3K+TboZty+EdIkLPM9b3FxkUvqe0CinFS55Iic6W8SC/7tNMv9m3kFBWzfiwDVRuO/jte1o/eEtzmL8i2uev8q9nZh2NULsGcsvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603050158
X-Proofpoint-ORIG-GUID: NVq9JSJ9Y3DwhB2iUakuoml-a-duh4Bm
X-Proofpoint-GUID: NVq9JSJ9Y3DwhB2iUakuoml-a-duh4Bm
X-Authority-Analysis: v=2.4 cv=PKUCOPqC c=1 sm=1 tr=0 ts=69a9d54c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=En8llR7kGgukSPX3MBoA:9 cc=ntf
 awl=host:13812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE1OSBTYWx0ZWRfXycKdXg74joI+
 oR8xdtnycCHawBnqLTLOWs3GaoHISybv7tbXrS37GUZiMlQxECl7bx1e6OIBxIewOIJj0CIqA+2
 iE4bejS1nmaeOnsFnpeqec/U3uGpnWYk8Hy7eWibi8xlzCqYshwiRL5SjqJBmXufzf+KECOtDa8
 /azb3Yr0pGBaMC0x4Px9snRzN7fL5ln4P/QuSD4udU+oLamKg6JAYe9TLHJEt4E0mX1iizhf+ON
 hfTUUOgsANsIRHmK9Gy5PNKxgEuV7rA8HoYAY8iSGSW256XMPQDBu/81/++b3oys6da2T0snTmG
 b2d0AN/LJEB75VWuFI4d2mIulmNZLtcN8umwbclmiZJmEQBAxwCDqrl8r3xmjypm1BAGcLkSFpv
 6NmEdlbAcdZWpuXAIoAbDgsek/Sb5ZHkz9iZnTEG0Y1/YL1NUaWVUcymP7ZUN6CnnMUYLzDICSm
 7ZPz8FLpnC13rmHuKOg9bWd4sM4PJFRkr8XTF+EQ=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/GNUmakefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bpf/GNUmakefile b/bpf/GNUmakefile
index 4a27e08b8..51ed7df6e 100644
--- a/bpf/GNUmakefile
+++ b/bpf/GNUmakefile
@@ -1,3 +1,8 @@
+# Oracle Linux DTrace.
+# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
 %:
 	$(MAKE) -C .. $@
 
-- 
2.51.0

