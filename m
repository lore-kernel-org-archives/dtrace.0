Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE86282F0C
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618612; cv=fail; b=HgeNPjksCR70cB7a+UN1GS2JiOKwC1R4LtwpxjNstA3PuT1EDutUhNfvw56FmOa1DhVX0ydVmPlNeI1dwRVh26QKGUJ6qoDXKJg97npiaq6jxRZ2EGANVRJdgNL3JuLSTJp8Xf0zhGkQuzBFP1ez9UdrVh1Brv4TDAh7Xf/JyBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618612; c=relaxed/simple;
	bh=h3ZAWxOItGRFyD7O43E7q45JDIi25iXDuCLRzOK5u+E=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=OgFuPwo9YLqo30e80AwpYz6QgwY7p9s59nKsczxylzDQ6TGD/WuSMUVOvq5wVkijt6WJHuZoErFxwJilgfC1g6fQk18LXWqiXxuEEAJltvl7Mcz7rQHiv+t/OzAOZTVVJX/vkKp3/6Q6DMDU2/eqgoGjfnxbk0rgTi/FGlT4h3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PEvgzaC9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gULXVQmG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PEvgzaC9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gULXVQmG"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDg2eI025905
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=uRmU4Pr+Wv3zKyezeG9rLNXxbIlaRV2vP/nKzu7PNis=; b=
	PEvgzaC9Z8hQY8X1yYGrg5mkUAHlQimJsdLjxdgjtQJ4HzR8lr+TJTJ90YWCY4p3
	kIkaN26x5RtE++qZabo+xli4BsqtzAr4bE1DTA2VQHbLoqtK4zEXRriKPPi/S17H
	QLALcn3FNRinR9mHdQOygm70qwSsowKOu0mPUQB/LQBEclqxOj1g7Obxs2psvAw+
	pmlEKc4qSlqFPxIbAsMWJCdp/S2eDc0nMos4V1qn3NRV1wFEGUffnqZ50Kh5eZxQ
	NNb2BBu1+TNEsJjeTTpRoIMIZDvQDMyYARdjPeKL2jfU2YXda71E0ulnyJ8CwinB
	nKuFi6dfLgAv7R71wqoMaQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4mybcqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHZOm2020715
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gnpjvh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAyOrY5V6yXz30aFHClNJC0U3di0f0KcRRAPJ7nojMRiY97vGlI35TqgHHe/r3Pubou7kni89V+1vQOKdkLp60+AaejrBMzYUBl0yV743mIPYGOaqkp+ZkiOkRGkqThu/E8Csd4IBTKquLTWFuieWe3PODJoSnDl8cPBv5L1OH03B5v0siocukhjdfvoBI1utWSEd0mFsJ5XSlb1Y/I3W9rJyI1LQMzKvxXuYjN3Y1u8WN+x7Mf0CzgfQP5sl8bv/2TnK5/j2VmpASrPpbpRwQCabTygWiTb9gDvCNS0gdFV7SeR1RguWPLep7AyMmjw2x+IKcR3sFpgaFV1IXibYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRmU4Pr+Wv3zKyezeG9rLNXxbIlaRV2vP/nKzu7PNis=;
 b=Aaayh0eT0ABB1Gwch0GZXg1ykUb4Z/9VXZX3b7H6jSpe1h1qvV/bYrx4sw+lbmijKmdN6Oxp2UKnaGktt9BxmDbNSvCAFXn3Q5lI4sZMi1GgGsymProp7i1YCcqC436dl6bsRAZ21uIMVNo2nTXyAeKyrzpt1AoQIy/ZSik2IbetBQ4qPKO42ENhh2S/1AlqzxPYgXnploEjUrZkLDqEbmW1tA2v+iDvpEu1ORYWcR3aO0QUjsP8Lq2NPKGNRpeXok5ifJ5zv4kRdHevM3ROG3IhDsvRU8TvKkzkBfB3VC35O1lt2QG8Cr8EggQTU4ss49zKLdnmQSoMQXgqG8TdQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRmU4Pr+Wv3zKyezeG9rLNXxbIlaRV2vP/nKzu7PNis=;
 b=gULXVQmGKOcjPsgX5GauaufgION9GpY2djNRnlCHecZtOB106oGgKxqPtySgKU1DVD6uag/UrKpxkx8EChDBKX42r5dW1g6N7eSj7LpJPB803mKzkGKMXsyAEU+rPV430s8MG/C3shB8Q/TPK0lT/u5GLmeyuc3CdlUm17mp2js=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DM4PR10MB6912.namprd10.prod.outlook.com (2603:10b6:8:100::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 18:03:25 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:25 +0000
Date: Mon, 28 Sep 2026 18:02:08 +0000
Message-ID: <aa2282debc489ee70f47aa6f2bfe1ba8@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 8/8] test: add missing expectations and update diagnostics
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DM4PR10MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bf858d1-893b-4a14-ac40-08df1d8ac96c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|13003099007|3023799007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	a3oFxgTsZrM36BT8tSRWEuNsXr0z/U8NTD73kDr1CkqU4Z5DeKRCFsR9KzOUHypxcx/4nC+k5TNzhDsxyw3beO2evlPR0zHbBxohWOPk8o9l9jHtaDhgBa646owUyE6rqqNiiAiOH8/TTRcPMM6S9sFS8maw7WZ78p14nmj+jO15Y0BTyI4PXXJaYvuJC+c0014GiZtMSkYDBmUcpA+NOrCg2kstw1ariZVUYCkZQr2vJT3DUa+aCvQt+XCq+yApQDWJkSwl9ZEK/+jWq1oOIWe/W7rO4MnP+X4mnavfuZgRaGsoPHKPvNEXKLIC5V074CP0/ekChid3xV9S7woYe/+Wd6MBHmHUlin+nfx/+VwXupz1111Vnk5ZZy0HWa56T0ep7SjY5osantu+LV1whwOLnnPVoJShGYZlbblZhwSuTmYAHXqsj78HN/weGr6y6FPiONETBFqUVtAOxwWiQA7JVWg2ZT1NFngdkSPdq8ee2OSjyq5Y60XY7ela3kzRYxhhCnsqcRRFRrLxOHhI087+mzCoNmNraeP3asueaVwDYRIXYaZ++UuHL1Q1wD/N7ujZc1KyFFoEMjLgbxx2vo9pySL4p5nnwzUTh0UzU4C6cSbbtToryXadoRfa1Wv1oR7+2MlSaBWvgvn/r7GOxhGucwdaobE1evagvhOHAk8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1m4V2yinanjCNCoDtaSW2p5yMF6cWrDVkERpFYSRQskmK7IC0qDF3Gx50ddC?=
 =?us-ascii?Q?qZzO9iObhQ//ENc0XIFygUHHelDy3dazw0jcTOSzc2sFA4y7isI9XppGxmsj?=
 =?us-ascii?Q?uzc6ToOYQG9lZtX6XBwYfvlb3CW8HI+r+o5tQCc3Wx0yTZTNh/uc9uHQciOI?=
 =?us-ascii?Q?Kh2985uxVU+nPo4vy1UVpU/XOj6tK4JQTks7NiLvLriC/z0/oPfGb7Aad22d?=
 =?us-ascii?Q?FetOeFyGKbWcjW4ckaOfPxJCZ2wEaMh5anrmksNth5c6OzikvwHC/AsP2mw/?=
 =?us-ascii?Q?pQ+sCBI+Iz1Aq+B03aaL6pNIUmuNfGw0CW3FNewcR85+KsRZ1cQK0AvlwUMV?=
 =?us-ascii?Q?e+F5XgOAnG0Qh+1XnNDhDVQW1zjznBXVAQwo85LOyknLD1cRHjc5KL+v7bwZ?=
 =?us-ascii?Q?NVKAG1iacxE8ALKDilLej95m/15ixHOFfoG2LSBaydVlr3IidN8W6x2cEVp8?=
 =?us-ascii?Q?CRS8z9LpXEpJaFPjev6ugQmxwch96yHbAvyjIR16Nefl88ghrwXmFL04vAuy?=
 =?us-ascii?Q?LwMwJffeVczTnzFoOHLkBnztUgMA5gOzI8qYkm/Ov5NZG/iGtPk9GlZd4c3d?=
 =?us-ascii?Q?qt6cJXWhSbqNemV4iLMOFVKTrrcQciqGTydBRPidGtGiF2pdI9GadFpu2+Qx?=
 =?us-ascii?Q?/rC4zsWfRGYVnIa1potoPFQ/dPCb2qtTQZkyuomErreD5WonhzBpGE/vjVw4?=
 =?us-ascii?Q?iprytK5c8HZvFARmm+Ydv77l+ESpgMBNeHsEtsnYkVPGbIFvNQKMBJIFewwF?=
 =?us-ascii?Q?Ex2wstEBkGw/g/yvrrF5ZtThmm1Xn5nHs5KbIF0Y+mWD1ky+FCuyy6yJhnaN?=
 =?us-ascii?Q?Pd1nFya8rMo5CuWiW+ghkqHsKyvOD6ykJLnAgBaDmaMGLFbyaGriaaoCs994?=
 =?us-ascii?Q?nJER4kY/JPjJYXGQcyGKilCU+QyXcWSKHavasBQK1eCPTfgSEuRHG1kqkgUt?=
 =?us-ascii?Q?rJ2J7lXtB4buWtMffquNNnLqLwMTpFqR3Td8IQB+jAazEKnsMmLSGbZXk7O/?=
 =?us-ascii?Q?uKvlSphzudoc8qsU/HcMumQqlPdiiogTsalyg8vLtQZODbyPLGwLdPQxJIvX?=
 =?us-ascii?Q?TLa8KSdM5X4FYq7W9fDHYufNINkiatKHgpjRrkWwx69qAw8ZQkbtn44pLuJ/?=
 =?us-ascii?Q?VC9/nLRbeVpb2KVpJCRghXzIr9dG3t0Xlu0t7J6WzcNKB1tdEDqV8C3l/apg?=
 =?us-ascii?Q?JDwO8i9vokjoOSPvPU2VAqLStxd7U3/JiF1xWMaf00vnnEf0Cl+qPgamFXRz?=
 =?us-ascii?Q?R20Kx/+4Su8Rob0G7LHt+KgRsZdvcrE9BJ3rneV8GwkxHvt2MMhKmqR6Fecz?=
 =?us-ascii?Q?ezjQmIiO0apZJj0B39QJzV9oLN6SZFaQtjxmAUk7vScP1+Znu61vIZYjQGhH?=
 =?us-ascii?Q?m+IHqiTBJ/NQZtnlPWj4bwS5BESBS25cn/d7MCQxyDDfZAEQGT+5TayakbUF?=
 =?us-ascii?Q?wIcLsyvsurT7B6DbwQGsgIcKLUDeW1oInK4t+R6nl87Vfc/WElcOOmtXVTsP?=
 =?us-ascii?Q?xNbT4IHhPj3Uu/GQTpxkTgrfp3OzDBGvM9hygUN7kw5ZBYAz3CX7vgR1YEfR?=
 =?us-ascii?Q?Y9PxyjwPmi1UeUC78lVbRXACvYxOSYUHlbbbCDKHnErVk9h/j0OoqmwoKdAd?=
 =?us-ascii?Q?k44U8DrtaIKjxWhxr7Gq0W5+cWyExD9rPu/ONaeXAY78cxRTDuIETcVC4FMO?=
 =?us-ascii?Q?dgmTeJEhA2hyTPzazj69bLPwOYb7kiyJRJe61ghJlnWSllgpbuajORvK4QFq?=
 =?us-ascii?Q?x8HkI4xdBgiajlqQMT3o/ltI0RTPMYM=3D?=
X-Exchange-RoutingPolicyChecked:
	WicrYlrXAmaMF92rVJYLwdQGDXkfM3lhRD+61MdCmM8EkS5SZ6O5Adfx4sQT7Be82UDcg0XTwlzR6V4/3ySek2nplahcm6LC06r6HW0tdTrljBNuRoTCmxseXiwPiC1VqyEmaAQ1gOPPf5eMQe/ayZzevy3zAGWuJUx/9hf5UFrfVxDTjA233HBHYoPXmeg1PA4SZUq/J5I9B/jQxIV0osn4Qmdf4buAoiQuVMMDa+EM0LizTBdXQAhEDWnWrCD0jlduz7byrzhYhff0b1G3Upj6iatsPKgJf2LY13xAw/iFUbTv7x9A65GV9exDT8Lf4HaIbL8Ukb3InV9aNR/6Rw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZCQ27p5sFascQ11SllITZiETztpBsyZqcnslAnqrYs+M4x07jwawx2lUoqDB00Tfqu9pwiVRfEieR/2H912YYzZ9Y3zFZ4rtFXhcHVtnLdIRVW/u0W4Kar1j+/JsfFGrUHtLqasEBGm511Cp3Hr32AgR+mDm01VJfKWF22AJ2pxsM5EO49MBKa4Xg5N1MQwccE3UgDLN8QQbzHJRDU9Jt5eWlqupsFT4Gs9Dqt31SaweUGVAU94+mUywgEJspo0ex44dO652QPBkoHPxuKO5uTjGmJDiunbRf92XNsNuTzqdcqOzVb332LBcuHCP1/3tkXlhNZVDFvdLUXijhKNvKD7C2BvIiHD0wcOAI5lT7YtvPkHHHOETv96q03BhwKlLofkOAmJcdcBD9x1p0L7tS449IjVq2k5RttS5ZI7stdexdqBJpwIbU3S4Fg+PlY5i/VMEVvvfzg9xQ2kANe4FoB6ZM5ATr8LH7nGHSxcafMC0ej7CFuF6s53awsGgMxhWecksF6vB6wSzS2aRAlqf+0yIiOqDh4VhFv9jknjLcUILrm/3b78ZPCpBL3NzJu3WN5vluRXjP/TgJlQQUnfiV3OnXDCBgJAMKsLmDbFVKkc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf858d1-893b-4a14-ac40-08df1d8ac96c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:23.2561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZIUXZH8pq1D+Nd5sZc0dj88EFlSOfKZNs0uRgNa3ajf8+a3RbVqy8xgiy8dN3IPM1U9zDwZNgCgaJAJsYqCoO/ONutUdpZFjXUkfIBiQQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6912
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2609280070
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX0jl43uYO/G+2
 GdCpTpfFO0WN2cY75ZrwWx+W013PNC/mdNbPQplltXDH3o6MoPTJiAcaiWkiWI/8mJJVNC2D8fh
 zi7xlEOYTCBnG2RhO+U/BM7mr1BFbuCiRMmGFb8LsLjOq91NiifE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX/44GSsnrkfQl
 ehPDsRcXe/N+Lx7GEABhBnp9tic6uSx2yqcj75ThCCHGzia4G9wLFodjzchVaXzuNT8VourUJYY
 xYzG37O39A4Q/dRieB89FPHiL0krJW1j2s905yiLnlwFoS5DGP4evnRJoYq2sAjKDXSCzJ6FBd7
 AerF+5Ztl3x3qSP94G9JHmMFikdm6DE60t1EmnKG3BjbYutOGkJ/jctj4zUGIC3kCfjCEvpzld6
 97KzCLEvQ95yekJYsukXhmYM8Lhfpbg1uIyGMqM56IbsJfgKiBvGWTqP1zRiQYy3YuizXktm/xN
 4XJBDy7NIzjnUy9RzKP5dPiEB50F4NAUmX/2IIqiVYQeaxXKfCCTIxQolzm6ihzsMCf8G0vIek+
 rvTBIvk8lYwsJzR4DMPAFNyy3oPtG7TEkGV0cT33sV5bRBJcs28w6EJybEHxkzLndfGvpDlVUm6
 RSSabzlMFIaBzyY0SHBubwHfwjaYljlvmfmSTnfA=
X-Proofpoint-GUID: 2GwkTsBiX1QMUwazVOKxUMDjcQwKPkCA
X-Authority-Analysis: v=2.4 cv=DZmCOftW c=1 sm=1 tr=0 ts=6abaabf1 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=Ne_JY2dTs1AhPna1S-kA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13532
X-Proofpoint-ORIG-GUID: 2GwkTsBiX1QMUwazVOKxUMDjcQwKPkCA

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/lexer/tst.keyword-member.d      |  2 ++
 test/unittest/lexer/tst.keyword-member.r      |  1 +
 test/unittest/lexer/tst.keyword-member.r.p    | 22 +++++++++++++++++++
 .../unittest/types/err.D_CAST_INVAL.badcast.r |  2 ++
 .../unittest/types/err.D_DECL_SCOPE.badenum.d | 19 ++++++++++++++++
 .../types/err.D_DECL_SCOPE.badstruct.d        | 17 ++++++++++++++
 test/unittest/types/err.D_SYNTAX.badenum.d    |  7 +++---
 test/unittest/types/err.D_SYNTAX.badenum.r    |  2 +-
 test/unittest/types/err.D_SYNTAX.badid.d      |  3 +--
 test/unittest/types/err.D_SYNTAX.badstruct.d  |  7 +++---
 test/unittest/types/err.D_SYNTAX.badstruct.r  |  2 +-
 test/unittest/types/err.unloaded_var.r        |  2 +-
 12 files changed, 73 insertions(+), 13 deletions(-)
 create mode 100644 test/unittest/lexer/tst.keyword-member.r
 create mode 100755 test/unittest/lexer/tst.keyword-member.r.p
 create mode 100644 test/unittest/types/err.D_CAST_INVAL.badcast.r
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.badenum.d
 create mode 100644 test/unittest/types/err.D_DECL_SCOPE.badstruct.d

diff --git a/test/unittest/lexer/tst.keyword-member.d b/test/unittest/lexer/tst.keyword-member.d
index 0c3650e3..18d78c70 100644
--- a/test/unittest/lexer/tst.keyword-member.d
+++ b/test/unittest/lexer/tst.keyword-member.d
@@ -11,6 +11,8 @@
  *      after -> and after ., even with comments interjected.
  */
 
+#pragma D option quiet
+
 BEGIN
 {
 	printf("%p\n", &(*(struct cgroup_root *)&`cgrp_dfl_root).cgrp.self);
diff --git a/test/unittest/lexer/tst.keyword-member.r b/test/unittest/lexer/tst.keyword-member.r
new file mode 100644
index 00000000..808ef419
--- /dev/null
+++ b/test/unittest/lexer/tst.keyword-member.r
@@ -0,0 +1 @@
+All pointers are identical (as expected).
diff --git a/test/unittest/lexer/tst.keyword-member.r.p b/test/unittest/lexer/tst.keyword-member.r.p
new file mode 100755
index 00000000..4eb25f23
--- /dev/null
+++ b/test/unittest/lexer/tst.keyword-member.r.p
@@ -0,0 +1,22 @@
+#!/usr/bin/gawk -f
+
+NR == 1 {
+	val = $1;
+}
+
+NF > 0 {
+	if ($1 != val) {
+		print "Output line " NR ": Expected " val ", got " $1;
+		fail++;
+	}
+}
+
+END {
+	if (fail) {
+		print fail " failures";
+		exit(1);
+	} else {
+		print "All pointers are identical (as expected).";
+		exit(0);
+	}
+}
diff --git a/test/unittest/types/err.D_CAST_INVAL.badcast.r b/test/unittest/types/err.D_CAST_INVAL.badcast.r
new file mode 100644
index 00000000..0c62733f
--- /dev/null
+++ b/test/unittest/types/err.D_CAST_INVAL.badcast.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.D_CAST_INVAL.badcast.d: [D_CAST_INVAL] line 14: invalid cast expression: "void" to "struct task_struct"
diff --git a/test/unittest/types/err.D_DECL_SCOPE.badenum.d b/test/unittest/types/err.D_DECL_SCOPE.badenum.d
new file mode 100644
index 00000000..77e3d68d
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.badenum.d
@@ -0,0 +1,19 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ *   Test a bogus enum declaration using an invalid identifer.
+ *
+ * SECTION: Type and Constant Definitions/Enumerations
+ */
+
+
+enum foo`bar
+{
+
+};
diff --git a/test/unittest/types/err.D_DECL_SCOPE.badstruct.d b/test/unittest/types/err.D_DECL_SCOPE.badstruct.d
new file mode 100644
index 00000000..f8b1884d
--- /dev/null
+++ b/test/unittest/types/err.D_DECL_SCOPE.badstruct.d
@@ -0,0 +1,17 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION:
+ *   Attempt a bogus struct declaration using an invalid identifer.
+ *
+ * SECTION: Structs and Unions/Structs
+ */
+
+struct foo`bar {
+
+};
diff --git a/test/unittest/types/err.D_SYNTAX.badenum.d b/test/unittest/types/err.D_SYNTAX.badenum.d
index 77e3d68d..6717dd84 100644
--- a/test/unittest/types/err.D_SYNTAX.badenum.d
+++ b/test/unittest/types/err.D_SYNTAX.badenum.d
@@ -1,19 +1,18 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 /*
- * ASSERTION:
- *   Test a bogus enum declaration using an invalid identifer.
+ * ASSERTION: Test a bogus enum declaration using an invalid identifer.
  *
  * SECTION: Type and Constant Definitions/Enumerations
  */
 
 
-enum foo`bar
+enum foo.bar
 {
 
 };
diff --git a/test/unittest/types/err.D_SYNTAX.badenum.r b/test/unittest/types/err.D_SYNTAX.badenum.r
index 834c2b1c..9a14d317 100644
--- a/test/unittest/types/err.D_SYNTAX.badenum.r
+++ b/test/unittest/types/err.D_SYNTAX.badenum.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badenum.d: [D_SYNTAX] line 19: syntax error near "}"
+dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badenum.d: [D_SYNTAX] line 15: syntax error near "."
diff --git a/test/unittest/types/err.D_SYNTAX.badid.d b/test/unittest/types/err.D_SYNTAX.badid.d
index 23d026f3..8f234539 100644
--- a/test/unittest/types/err.D_SYNTAX.badid.d
+++ b/test/unittest/types/err.D_SYNTAX.badid.d
@@ -6,8 +6,7 @@
  */
 
 /*
- * ASSERTION:
- *	Identifiers cannot begin with a digit
+ * ASSERTION: Identifiers cannot begin with a digit
  *
  * SECTION: Types, Operators, and Expressions/Identifier Names and Keywords
  */
diff --git a/test/unittest/types/err.D_SYNTAX.badstruct.d b/test/unittest/types/err.D_SYNTAX.badstruct.d
index f8b1884d..a4c8149c 100644
--- a/test/unittest/types/err.D_SYNTAX.badstruct.d
+++ b/test/unittest/types/err.D_SYNTAX.badstruct.d
@@ -1,17 +1,16 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 /*
- * ASSERTION:
- *   Attempt a bogus struct declaration using an invalid identifer.
+ * ASSERTION: Attempt a bogus struct declaration using an invalid identifer.
  *
  * SECTION: Structs and Unions/Structs
  */
 
-struct foo`bar {
+struct foo.bar {
 
 };
diff --git a/test/unittest/types/err.D_SYNTAX.badstruct.r b/test/unittest/types/err.D_SYNTAX.badstruct.r
index da798f0e..37ff0051 100644
--- a/test/unittest/types/err.D_SYNTAX.badstruct.r
+++ b/test/unittest/types/err.D_SYNTAX.badstruct.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badstruct.d: [D_SYNTAX] line 17: syntax error near "}"
+dtrace: failed to compile script test/unittest/types/err.D_SYNTAX.badstruct.d: [D_SYNTAX] line 14: syntax error near "."
diff --git a/test/unittest/types/err.unloaded_var.r b/test/unittest/types/err.unloaded_var.r
index ac7972c7..d8c59c5e 100644
--- a/test/unittest/types/err.unloaded_var.r
+++ b/test/unittest/types/err.unloaded_var.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.unloaded_var.d: line 21: failed to resolve gfs2`gfs2_control_wq: Module is no longer loaded
+dtrace: failed to compile script test/unittest/types/err.unloaded_var.d: line 21: failed to resolve gfs2`gfs2_control_wq: Unknown module name
-- 
2.52.0

