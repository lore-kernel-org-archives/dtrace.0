Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389151;
	b=hidYxtQPNYLzoJAy4ukfE/TampMTQRMDImz6Eyz9HiEc2YppK4DKwrUsaYJvi8fNRy3t
	 qrIYl8OuMiVUQItnWwZsJujaGrLwLOzFhX0EFq18gMMrcdEnkvt9gRYZULAOjDyT8vtJs
	 hjZGXTDZu2j7rPb8nHkwUDXLwroW4D1w+qzlz3mr165iZ4GH0z4QMwWgUnP3CaYEDK2fH
	 qRLKg8Cxrt6IU6EVGOETK7wU1f9b+ptVaOlDN89/R3CGND+weuOIHavPSeQg/nX1TvxHg
	 lb4qExEshU8vlc3KORnyYMzXC0KJtpf8J29jKXupEexK+jTpjEqQoXxkT0Ft6q50cyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389151;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info;
	bh=rJIVGSKWaDDfDe6ocGMKsMHbdGJDXqvCzTU3oTVYAd8=;
	b=xOk0CIq21HiHa+QOhRZVWxk8Zq/f8SvRrMY4tM8lH7qTz8lBIZcLcIwAq0Kh0VIXRpJf
	 aHjB+Vm6mKKv0aMjKYdSqx2lyFmtuKjfkhQsq1AfftUyK8XoCTpq20gUTutJ70CIkQ+nj
	 O+eo5zZuaBpJMykfyK24FdvB96WnvR/Whv50ZtmajaHMqTPm0VY87ve1sGuLPvs1Ig8aO
	 B2UFWJ8eP6N5XmWcTMPTue/8wQ/rAv6C3kWqRFFESIHkUxvZtbocHSJUvGQK9VYHX+ST3
	 t6DePBrAOe8JZ5UKJ3DNxxdFfYbOxBx+SNlJI9jBGnamF+vUiCzpBE1SCMU8Fz2yBJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=sO2qCJYD;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=A5uAty0s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A87606A322
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A87606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=sO2qCJYD;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=A5uAty0s
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEYO9r3954658
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rJIVGSKWaDDfDe6ocGMKsMHbdGJDXqvCzTU3oTVYAd8=; b=
	sO2qCJYDxTO7Ihu+kaYoWl+0BkFUPsRynB8STmCCdDAeEgl9SJZMtYzo2SQ9ngxq
	vaI8xYTXOZJsQzzyagJESR+exQ2JK33iFOUddsoBf1ZAHWAySf+KnHDHCqkargyT
	Ns9/18qlsZjMj9afo6Jy78ibeain3FFUBCOO1R5ouAKWPq2Yst4iQgEtsRZ9XDc0
	J78hhs9B2ZsByr6aHnYXVJHLhEE69zqu9pQ2kDl0WQdEMYbciUH8MUtC8+DRMWZI
	kKktMoe+9rBPf6wb7BaSZJik4opWL+63cwlwNHq8Rl5dNKTfrBodWt3HcEXeO0Is
	TZH19ZIbk/gNm8xvvpuUCQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme61sd1a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:39:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvqgo2444448
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:39:09 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010010.outbound.protection.outlook.com [52.101.85.10])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hmxs4x4ne-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:39:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cujS2OtmRyzPS7AawH9EKFEiPSRSoQaRA+2w1hZfJMKTZZur1iXeMv1o+yYhm7f1ufxbXdx2xdx2Z8/xhRnWwajV5nXiJjxv4BCICS06dsPUWeIhQ69t+e8O9OvzzxbQ28715e1LK7ZHTCYRSUEttYwWi53U0voljjEdpHD509fwnvzVZiYYkNx7lcEdTDmuHT90eQrb2Ud2SpuT3W0Lwofp6Qj3j/mOzSPu0jCFbe0wOEguHMn4GR9RV4WyrL4Ha8pSiRc9cSJQtMMgKHWHXhVPPm+B7zeacIM4mFhjGxlH9AbcQJI4aq2LKTcJUm/wW38YFANonK6l4uuKhHC65g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJIVGSKWaDDfDe6ocGMKsMHbdGJDXqvCzTU3oTVYAd8=;
 b=IaU3/TZ/MahGFBOT2eqoalsudiMh6ajvExCx4syJdvVpyGlo9PbX+KDq/Fc4MkjZkYbn5Pd44RKfiFSkzKLEyr8iIEp+jc/18PZoOsi3vPrrhIlnvkgmUcNpIXfoVw6ma2hK9huAGZTqF1WBOgElLlNM2Gwm0uCRQaMkVMlCq2C78p7B3MP+igJn9gIt8Tev515UYCVow5IzvQbnVSb5cv1XKoqa5+lt003JHqdhfK0iVHbLWyB1gnSvwkoCAGCctbGO4iv2SlD6/AA7pAp4B0JbRXcf5PDoZUyccxRM0963WWcyAjfrHAbzH7zxGbA3ap9i5z+SVw1UizG48nxvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJIVGSKWaDDfDe6ocGMKsMHbdGJDXqvCzTU3oTVYAd8=;
 b=A5uAty0syyCQyhSTSaDJCxsDMwJmY1FPJAV5+G0DfU8Xl/geY/XIyNPxtFVomjzWoZNJlpXHG2RoKuRCfBPwJHiOBI74Ya8RIfRLiIscVMIooDXaGKaHgsQvbjdlPW0B0LCibLr9qX4INjVIkKXgqVY7lg7fgIW4HkhjcIBodtE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BN0PR10MB5159.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:32 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:32 +0000
Date: Fri, 30 Oct 2026 19:36:57 +0000
Message-ID: <6a0d5564a3dcc127fa5efc01955bf623@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 16/20] module: add support for wildcard matching for user
 modules
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0018.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BN0PR10MB5159:EE_
X-MS-PublicTrafficType: Email
client-request-id: ef08d05c-dcfe-40b3-ae2c-c04457735334
request-id: cb9f291c-275e-439c-ffeb-08df36bd6168
X-MS-Office365-Filtering-Correlation-Id: cb9f291c-275e-439c-ffeb-08df36bd6168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|3023799007|56012099006|261028144727099003|261026140227099003|261026121527099003|10067099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 iL6M0ogxHspRReZRk2dkGyKcWw5QIOJTVD/k1qLaRnwgs4a1ONYm5vQeH26IbUss5EdDh8AWcjA/YzgJy+Q0Mp+B2wkXLlAk720UuMQP/bIaaUbESAeb0t9S81HLDZd2DhImud+HNu4wYe8K3LL68DHAcddCcHtO4HLTc8gsBT8wvBECesg0rMRsJWjmZJY0+Ibpuupa0qhB5gQrRXg8VU2c66MCgJc+CmSJYpXvWAS+Sw7nQlQwp/QhXvuPvPrg7tvm3b+AECYnjnmsKKNMg2D7ZZ52calHBhsVnXPlt+MtPQGpuH4RlZyacW8d41em9XBtD+3AA0L8AebWKVXHad79F69GTvj+GH/xC4vtrgYI1xQdmM6/A4dOebLapvU2njWZ6yMGeHUeGQH9j3tiR5TOR9mDrNibyInmP81pq9uOv40tU9cn27OYAoxYihYpHzcUriVWcRF7+tdZf24+WMohSGur8f/n9Ai/Gv6dUNaIoCQ9k9EIM2wv3Db+1tfDsEaw9ZBNy7a7WdNVCssHPGYayrCfkPrdsjfz8f6co8NTGXcuC5Qzw1ecrMvN7K/QAUWRRCag6U1ZF5HIFAHuWxhbcAEvIcqqziafPCimUr+f8cAdzgzFGHY1HQtZNFfBLaFv0M9LnAoWkkxa+1/kXIXvKEtQCk2lfEwlkSA0wZc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(3023799007)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(10067099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?w1NBxp7cSfp+Ldz8gG2m87UG6I89uO7xOUbOhrZo8YxGW/smRnRbIKs34TFj?=
 =?us-ascii?Q?XHmw9MZgSkwu7zfvQBOA58BHPoyZdUvtncq3NvUJmDZQV0GzBaJYxdAiMEuQ?=
 =?us-ascii?Q?7wmqHudVm7nBo+s7rmP0EP33yG2k5JP8k3QE3jwadCIpzrcbXC5MCt9U/k8k?=
 =?us-ascii?Q?0nWsDWcmuf6O7ByC2RCFA0QnWKND0BVEP4gGPAyXWYCG9upNTUth1L2HI4ZP?=
 =?us-ascii?Q?4+bWLvQG+CBViwlQE1NyEXICvvCu27aLekHDO1Jv37c/m5BsCqwkXTuI3Qeh?=
 =?us-ascii?Q?FOeqeXX0/WHq5jPt6uQZFBVHZbm8yy3lMK8W2HjslA6rkpmwgeWV9m6sTa9E?=
 =?us-ascii?Q?8F5kPwmgxxrbLL0aY4WZwp/eF3CGledn2oFWTdUe5ONHbNeEIKQNqPOhHUBs?=
 =?us-ascii?Q?i/moMLKlhw6q2X2qi+mA9JXE8ezGYI5zh+v+JegfDr3AJrHOTpiSf7bSrWo8?=
 =?us-ascii?Q?9l7kDT2iQdaSumow/zu/01Nhfd5iGa8ZvEHD0iYpZ9X2UZ/VZp+S68jDnBWh?=
 =?us-ascii?Q?iB9/F0shAqaJVO0p44g3PgAU1utVuL7VMBxcGZz8e2qOdWDG+RsDgu0iEr81?=
 =?us-ascii?Q?QGfJvH4rpYT+iUTQO5Scm61CRKER2Mi5MqMIZ2rlgrCE8ddLq+HtAt5Qa6pw?=
 =?us-ascii?Q?breL4qvOaJdCOmLTSE9riABlL5D5Zyy2DR3ydoUTiefgkXNLpJiqM9D8denh?=
 =?us-ascii?Q?xqtIZO6fcl7LDVClcEIGlXFTC0Mx2q8axJadv5/pssETyLSNDsF0GUQCkm6l?=
 =?us-ascii?Q?3bf0U+eaWse6iiUyDkOdwGZyb+0Ky1YvUc5eTBxRcagixmMJ4tmbOsP1B6Wh?=
 =?us-ascii?Q?AESNyikWsW51YLKHKau/qki338JYR2CixslIezwpRGXoo7575RmRubnSRB+q?=
 =?us-ascii?Q?VakC7b3gtwbc793GKzdR8aJzhqhmB8+AeGvFuzId43cxEpy8nPXbZF4tMH+V?=
 =?us-ascii?Q?sZTwiBXUeuyq58fpQLbOJYon6c638mXWS1jQn2NKoytHJwZjTuwbElwLn090?=
 =?us-ascii?Q?bjoNseYLT1usoO/A6HqQl7wh4ou6dqdQC1Lf+Qqz3enuuDSs0T726Lh7wT1c?=
 =?us-ascii?Q?dQQoezsivwkzAwz7CHOkq/DAg5CP43kTJ+TKafUfsrxUeiw7nlizciG/Z0Xi?=
 =?us-ascii?Q?i2kPgcfPwoht2SkHgQSruYASK4h7p4vBDMjWZyTTVW7+kT6c9NgnhWkzuUSm?=
 =?us-ascii?Q?K6t/Zw4hWkctGNn/AXFIOKUhKCtrI9G+XOO2KPLykKCN1Ddh5hgIxPOGFSRz?=
 =?us-ascii?Q?5nU1xH2nMzRHP2T+jbu0qR8vdgXS1j5snuEBpIJUVXvVnnGaF9kuCFZCMmSY?=
 =?us-ascii?Q?wgTeQ86lp9tYxP4v3yJ/URiJF3y5DlweOcyKXtL78T7d3jzkyR2NkBCj5DhJ?=
 =?us-ascii?Q?lfcQgcd9g1ikn3B75lNLmfz/9q1XHxMjjFKUTFrp/NcgfJ2n0BIM7T1Y7Yxw?=
 =?us-ascii?Q?U/vTgWiCuW2Y0kdZrWvAo03A80WBiOIGtJBk5Sl3GZMXmSHOYpkkkRoC6EIm?=
 =?us-ascii?Q?7oPmPAKthW4sK2o2JnVcmP/dDuqW8oHrBwHxhHcOnvVyNJVQPyI2bbwy4GyW?=
 =?us-ascii?Q?KhpgJdZg0ZS3UQq9FZGnH6qCs7parmt0g6EE2l+MhUJanBHBj8lA9wfyvQhQ?=
 =?us-ascii?Q?tmb8uN3a+vpjKsrgd/FZSqxltcKvUvJRoyMgPpx49wFA7UcsA2nzVsMhx8S9?=
 =?us-ascii?Q?0CmfCAi13BtXkqx+8W3EQahN6F52bDaIsekX4CvCgIgk7UfXW/fHF0rX+bkc?=
 =?us-ascii?Q?NhmtAi+Skbn/7l+4dQoYwqtJVu12OSI=3D?=
X-Exchange-RoutingPolicyChecked:
 Eu47QLmRMJnKlmE/kGRsNLKelUOYcqNA90P5fQkNfHmhLxytb42NCs3ARge24gnORVxq9CO70UASjOacKHt7nrYgp0zfrf7cqveUtVGJP2lN9UwGYuw0/bHsdbSVsr+kNVrLg3QPLXD/A1sgIQr1SKYOvYgGnErtc8+Y5N6JYagC0nb9dUBdQV72TzTVSYrKDXWLChzbkIMKmGbL/AT0ppESJqpGEXWu9StGFpKT4ln4HvC5aQgNLk6Zr0LQ5KqutTbzk1Qwv7MoqFyUnyyIugAj3HLzNzTZpJu10rHL0wClSSu3nWocD9xuaYcSoG6NpW/gOssAf7CjSaB8MZGxbg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 JaH1bjKC9PlmeZ0Pwnojf2FfCdfiBb1OBG8S8MvIgR3LxV4LXCz/ret8AGc3ggeQPAcCIEvXJ7DXg+iqNyabZVsnopG6GtvVW/GeJ+OEYBq7aC6ZKeYFp6NceftNV9qz9CL72hYgfEupvhiHIBaPo44j6MCDIOjDispJtVv9Ztqi/mjv/ntT03O3KzcJG/q2Z5aCOcaA1xKD+OGEFUHjtX8JzHneeQqFaeorbQAQUtEDIYrWUJO4DG36vTLZby8wWbNXulenf/H9mg4LMvz+T+BtMVp78y9IdjuBZM03DRa0VtkupyDtVavUYII2Smtxk0ge1cbxHTfm6GZwXeoiayvNVYpN/wPB0LEeynrkadzrXey6z05KYP+JFvTZ5zR4DqZzhWGuLnV6uZJJlpVGYlDZrYmkiMUpYlgoS2EZIymANiQH2XITYg74/B2CzT6e5lk0nh/AQjil9GdkgDrEpF/mvZz+ZmRDThugBkDBXBS32MgRE+GV+uFleA9nbZueJ0SeI1xoRuJQh03R5PHaoDUywzb02IvcdQGyfmU0Uu4pTlooHM2FkSnXhG0zLISSYeaD7NlCjuubzI6u3nUfbIvXwwcVG6HByHTBmd6oaB8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9f291c-275e-439c-ffeb-08df36bd6168
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:32.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHQd02la9pN3tg0dXI0b34iaXdON2qSly85fJFvpbM/btz3miEaxKVOkQZKz0vRdMr+tsQ4hDptNJH9zRt+Oe5999w7NidhOgS1MpRnJ00c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5159
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=L9qI0OT8 c=1 sm=1 tr=0 ts=6ae4f25d b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=tI007Lc3pBB4vkxGGg4A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-GUID: OLnUr54TTHTFo3WkwwwdwTfu3J0Bmz6-
X-Proofpoint-ORIG-GUID: OLnUr54TTHTFo3WkwwwdwTfu3J0Bmz6-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXyUTO32t6mCer
 UCFLrXetRx79GHFUM4oowQrjpOnCyz7e6NY13YwGCpxuDOFEpXpjBVwkRD8pdRMe8i6PanB2bfr
 /lG2TPeIxzptzqestBf4RO4Knko/8GvD6Hj4NG8DXqWyB/Yr83sR9kgXLXIn4IcKAkVH/T27nmY
 uCerRLH4XjgWhYMUCgIS0BjAEmLKbC+2q6XUrrOh0752fozayWBBWTxDgeYdE0YNNNJHk5cvPZH
 WU31zHXbPUhZc6V1oZtiEL//fFNRrJBlLxnoi0tzkZSrhwl181/54acjliQxEsWGJnXsBOStiZz
 rlR68ZrnTsKviXQZ7WVgFIRoT7j09ac8aZUzev/+13XZNCwfXp1lpEyCpigKZAKr8nWIkIs1R8p
 S3v5u87FyiMXgFSyFUFwLzhQCHGARITeBkg91WwpPQRn2j1tU/X3vFzL1bwj2sCvjxpXkm8yiVz
 4h9u9LzqVe1gx2NmAiOus6jNuOy9JUp8RjfcQ9+Q=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX41I1X5pnEWKe
 DzRod4eJqjXqbG3rl7NnSwJJo0sL+VtpGXvDQCISkkgm7nVMKx0Y8xyI0oGqUXq0T30ylB29+xC
 idu5bp9AgZSmQSpIwbtNGy7L28mLt1OkYskZDDAPckgk7jyY6BeC

Tests for this new support are provided by the uprobe provider.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 134 +++++++++++++++++++++++++++++++-----------
 libdtrace/dt_module.h |   3 +
 2 files changed, 103 insertions(+), 34 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 2b91f1e6..06bd55d9 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -19,6 +19,7 @@
 #include <assert.h>
 #include <errno.h>
 #include <ctype.h>
+#include <dirent.h>
 #include <port.h>
 
 #include <zlib.h>
@@ -412,6 +413,50 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
 	return dmp;
 }
 
+/* Create a userspace module using an already resolved pathname. */
+static dt_module_t *
+dt_module_create_user_file(dtrace_hdl_t *dtp, const char *name, const char *file)
+{
+	dt_module_t	*dmp;
+	const char	*p;
+
+	/*
+	 * Use the resolved pathname as the object location, but name it based
+	 * on just the filename.
+	 */
+	p = strrchr(name, '/');
+	if (p != NULL)
+		name = p + 1;
+
+	if (strcmp(name, "shared_ctf") == 0) {
+		dt_set_errno(dtp, EEXIST);
+		return NULL;
+	}
+
+	if (strlen(name) >= DTRACE_MODNAMELEN ||
+	    strlen(file) >= sizeof(dmp->dm_file)) {
+		dt_set_errno(dtp, ENAMETOOLONG);
+		return NULL;
+	}
+
+	dmp = dt_module_lookup_by_name(dtp, name);
+	if (dmp != NULL) {
+		/* Do not turn a kernel or built-in type module into a user module. */
+		if (dmp->dm_flags & DT_DM_KERNEL || dmp == dtp->dt_cdefs ||
+		    dmp == dtp->dt_ddefs ||
+		    (dmp->dm_file[0] != '\0' && strcmp(dmp->dm_file, file) != 0)) {
+			dt_set_errno(dtp, EEXIST);
+			return NULL;
+		}
+	} else if ((dmp = dt_module_create(dtp, name)) == NULL) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		return NULL;
+	}
+
+	strlcpy(dmp->dm_file, file, sizeof(dmp->dm_file));
+	return dmp;
+}
+
 /*
  * Create a userspace module for an ELF object.  Userspace module names are
  * resolved based on the LD_LIBRARY_PATH, ld.so.cache entries, and PATH.
@@ -422,7 +467,6 @@ dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
 {
 	dt_module_t	*dmp;
 	char		*file = NULL;
-	char		*p;
 
 	if (name == NULL || name[0] == '\0') {
 		dt_set_errno(dtp, EINVAL);
@@ -454,46 +498,68 @@ dt_module_create_user(dtrace_hdl_t *dtp, const char *name)
 		}
 	}
 
-	/*
-	 * Use the resolved pathname as the object location, but name it based
-	 * on just the filename.
-	 */
-	p = strrchr(name, '/');
-	if (p != NULL)
-		name = p + 1;
+	dmp = dt_module_create_user_file(dtp, name, file);
+	free(file);
+	return dmp;
+}
 
-	if (strcmp(name, "shared_ctf") == 0) {
-		dt_set_errno(dtp, EEXIST);
-		goto fail;
-	}
+/*
+ * Discover user modules matching a pattern and call func once for each match,
+ * including modules already known to the handle.  A nonzero callback result
+ * stops iteration and is returned to the caller.  The callback may remove the
+ * current module (for example, if loading it finds an invalid ELF object).
+ */
+int
+dt_module_user_iter(dtrace_hdl_t *dtp, const char *pattern, dt_module_f *func,
+    void *arg)
+{
+	dt_path_t	*path;
+	dt_module_t	*dmp, *next;
+	int		rc;
 
-	if (strlen(name) >= DTRACE_MODNAMELEN ||
-	    strlen(file) >= sizeof(dmp->dm_file)) {
-		dt_set_errno(dtp, ENAMETOOLONG);
-		goto fail;
-	}
+	if (dt_list_empty(&dtp->dt_user_path) && dt_user_path_init(dtp) == -1)
+		return -1;
 
-	dmp = dt_module_lookup_by_name(dtp, name);
-	if (dmp != NULL) {
-		/* Do not turn a kernel or built-in type module into a user module. */
-		if (dmp->dm_flags & DT_DM_KERNEL || dmp == dtp->dt_cdefs ||
-		    dmp == dtp->dt_ddefs ||
-		    (dmp->dm_file[0] != '\0' && strcmp(dmp->dm_file, file) != 0)) {
-			dt_set_errno(dtp, EEXIST);
-			goto fail;
+	for (path = dt_list_next(&dtp->dt_user_path); path != NULL;
+	     path = dt_list_next(path)) {
+		DIR		*dir = opendir(path->str);
+		struct dirent	*ent;
+
+		if (dir == NULL)
+			continue;
+
+		while ((ent = readdir(dir)) != NULL) {
+			char	*file;
+
+			if (strcmp(ent->d_name, ".") == 0 ||
+			    strcmp(ent->d_name, "..") == 0 ||
+			    !dt_gmatch(ent->d_name, pattern) ||
+			    dt_module_lookup_by_name(dtp, ent->d_name) != NULL)
+				continue;
+
+			if (asprintf(&file, "%s/%s", path->str, ent->d_name) == -1) {
+				closedir(dir);
+				return dt_set_errno(dtp, ENOMEM);
+			}
+
+			if (access(file, R_OK) == 0)
+				dt_module_create_user_file(dtp, ent->d_name, file);
+			free(file);
 		}
-	} else if ((dmp = dt_module_create(dtp, name)) == NULL) {
-		dt_set_errno(dtp, EDT_NOMEM);
-		goto fail;
+		closedir(dir);
 	}
 
-	strlcpy(dmp->dm_file, file, sizeof(dmp->dm_file));
-	free(file);
-	return dmp;
+	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL; dmp = next) {
+		next = dt_list_next(dmp);
+		if ((dmp->dm_flags & DT_DM_KERNEL) || dmp->dm_file[0] == '\0' ||
+		    !dt_gmatch(dmp->dm_name, pattern))
+			continue;
 
-fail:
-	free(file);
-	return NULL;
+		if ((rc = func(dtp, dmp, arg)) != 0)
+			return rc;
+	}
+
+	return 0;
 }
 
 dt_module_t *
diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
index 73be7144..6857f120 100644
--- a/libdtrace/dt_module.h
+++ b/libdtrace/dt_module.h
@@ -16,6 +16,9 @@ extern "C" {
 
 extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
 extern dt_module_t *dt_module_create_user(dtrace_hdl_t *, const char *);
+typedef int dt_module_f(dtrace_hdl_t *, dt_module_t *, void *);
+extern int dt_module_user_iter(dtrace_hdl_t *, const char *, dt_module_f *,
+    void *);
 extern void dt_user_path_destroy(dtrace_hdl_t *);
 
 extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
-- 
2.52.0

