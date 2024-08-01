Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA1C13D889
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 18:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722537889; cv=fail; b=rQcMPpWeRcZ+0ljCZEw7ZKrLPvtXmpqBrtj9UgNjJ1V7i1Ex0ZfCIm520rqK5PVGCaeslqV7YqpAMgQRKTamJGg/ondrqxQh3PBEw1knwxyxbFzM4Bgs1GaQVLmjeiumj85+frt6YNCYIUshhkxSKpGWwwA36Xm/9GuTZasLark=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722537889; c=relaxed/simple;
	bh=YnqAmzskWHA5aTvadiP1ulRB6zpLENjLGaxYWm8xafQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=kgmMypYzYe4lMwRgBA2ApbvfkquKMbOY9zTG7b0+FM2WgprZXJKrr7U0BxIsn4nPCuY5/zqTwm2Roz3xe4XIxf8C3zH0/xNsI2OX52iEnu1nalH/tIH4ZYQKm1xVsje9FULhoyl/n/jtuCZiEEB6DscwaMdY2uSM5mtqed+2o4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SkrQGbX0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t8jHYvuU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SkrQGbX0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t8jHYvuU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471H0T1E011869
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 18:44:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:references:date:in-reply-to:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=NI1gOKslaDNf2h
	mATMzF/czsevxOD76a0n7xNHWsusw=; b=SkrQGbX0ybVahsOCji1bZgli0emnYf
	hSqWg7HU12BSnQubneS+L4Cm/dNdQaKhleawl4STvpVRwtneKoJCG8up9y4SOb7v
	rxQZ39max8zCgzCAmT/Cbrpez7i8iHpNs2IvrXAghb742/oLBX4zP22nxxCYwDuS
	dPHBhEi/y3IdSsjijIm31QiyxyCrk20VCtsEoSxEmN5NNNHPARNijCvGVmDtzkWr
	iOa7lbcERQxGgZdiABpQG2dH5iEvchct6bgo790/kAyzjJtYiuZJZxOhToM7OzXt
	JD6jJnQeo991uS7sEoBDTrJiR9/y01QZlmWgxZXU8umVkNGuzNFyzJKg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqp22hkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 18:44:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471I9cEq040206
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 18:44:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40pm86bnp6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 18:44:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+gIqjfSPim3X3r2jGXiCfFOz1L/A2KGC89dR5Xu2WW7hDmj3zsFZ2V+CN2C46sc8/K9VALE8WuIQa33QPeZinHoosfDAwH5nWhZnvmomGFaWUiIs/CfIjJhoyDN3/dexXyMeVfWfphwivuitEg/P4DO80xb6a5YnhPtZHuXYLbnQOPWrReH8oatQk47AmprdDnUoloxwp9ZvDalUfxcFretGtuTsJdEwouZX2f8ljEU7Z5YKFTKlkUqhUc3q1OL1ZmoNGg0V64K3e+g94X7K9U6LlJty8moz8h7mHyXS4qAjsloJ7fCIOlc++1xKQdHxSizw+bX1HmVrb6ZfO5XWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NI1gOKslaDNf2hmATMzF/czsevxOD76a0n7xNHWsusw=;
 b=Muplt4HtaTKvuvV6KG4bgKkgH0f8oYC2FjYRYbICxOTI8cyK/0u+NGHwXvvZ4nt6klgncl1avnuKXevpcDIAVlRJxIHzKsRM9mwk815sjybBfLka+tpFDk5s4FxJsqzSbUltPKw89y8Lq53PKR26UFQXMcD8a0FpIIclUY+sno1HSmat9GlrOYa25ZB3XOA+IeKLTRejHrogffiRVInoqXIhLoG2D3S+Xb54xR5L7HabjW3Rf1eh2TpilEej3niSGLO6EKsGjVpIvvYWzFhjWg3JHmAO4f1NpJ5gM5DAvuilZqFHmia4zC6QNN+UYZ0/ZM1CTMSaJz+Wh0y3e+/Lsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NI1gOKslaDNf2hmATMzF/czsevxOD76a0n7xNHWsusw=;
 b=t8jHYvuUws1nrRjh44HWsTaxEVtMWSqEWvRjdBXkNOZbweSlD/GhN5KU4UHDWSlJSnPATpxHCAKJxwIMblXyRB4adPhW6Sliz1nuLPBEwebIMo3MIWvoiBQ+PI7XFgZedbYRskUbtf6+FueAhSWoMoi7uELu7PzWV+FAXaB4aPg=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by SJ1PR10MB6001.namprd10.prod.outlook.com (2603:10b6:a03:488::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Thu, 1 Aug
 2024 18:44:42 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 18:44:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: ensure casting does not affect value
References: <SN7PR10MB6287E87D4C69887B1DC570C7C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Emacs: featuring the world's first municipal garbage collector!
Date: Thu, 01 Aug 2024 19:44:35 +0100
In-Reply-To: <SN7PR10MB6287E87D4C69887B1DC570C7C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Wed, 31 Jul 2024 15:01:42 -0400")
Message-ID: <87o76cjd64.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::17) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|SJ1PR10MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 29293589-6a3c-4f87-c5ce-08dcb25a0151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ZHHThRXE0hhATF2R/1NbxbfxcbVtWZ6m6vpSA3St1B64sO3MMRblfSk9Qrd?=
 =?us-ascii?Q?JdECM5RVAnDgG+ihdNlguR9KLSv7ca8ZVgBBRfUbmaKaHcX5FgSu70x0Vsjz?=
 =?us-ascii?Q?gQBCYM/1jMfrulSLLAraZ1T3NGd5Ab3oNsyzAz9AAZ4NsBfkdwHItlqZK65G?=
 =?us-ascii?Q?ecPljwPxdOjGFfeVZqwcuRfX7e0ddNE60Ewuh52URG1NDstz+AebRyIQ2bGB?=
 =?us-ascii?Q?f6dMcxUbtVw+SxwklIS3vLzgqX3M2cArUWBN502vC//CvW+6uoM5dk65eQtP?=
 =?us-ascii?Q?P7sc4QyH2B389fiKMBFgS9ccb1SfG3m0+P8YLre748Yv+eAboHBkjwI6hSL9?=
 =?us-ascii?Q?8IiOk82UdkNxFT9rLybE3MgAIIsfGd46IPRCAyLs+rscukYBQCGkCP3ENvrt?=
 =?us-ascii?Q?ZeWxiVqIUOoPW6sotkGQnNgr7Cm/DQhw7vZ1+1VD+WAvPtLYQBIYsJYHlCxY?=
 =?us-ascii?Q?QXWv90idSpInN6zEfHI2YnwMM1pwIsxjt4A2hlqDCn5pvBwHhC0D4a2WcB3D?=
 =?us-ascii?Q?X1Jkxjrhw8cw+v3gOZJb+HuhyO+LvSvmBDGRUV9HmC4Rdfva3gkga1CFpmY7?=
 =?us-ascii?Q?wEgfhPwDIMWQduPjVcI2/Jy+9x4rv/wxLA7CqHd6yVJMlBY4r9OImtGSE+KQ?=
 =?us-ascii?Q?BdXZoHWk7U8orHjhdEZx3dAS6TOFYtZmLy7EDcEuChCwmYOZAfHcnLtsn8yp?=
 =?us-ascii?Q?JzMOyJjF3JNhtcm6dV3HIPRU2RfFgbPxmEMH48hmCxe+WVE8OX9aTajpF/eH?=
 =?us-ascii?Q?SDt+hsR1z7GrBQ6b3Xa1ngWerZ2dUuY0LwVUjmDU7VkWmr8spbCkQRmb1IMk?=
 =?us-ascii?Q?hhZudQCrAH0yRzjAmaip8wTFQ1qhov948vpvZt2EKc2TOGTsgK45xm0Ye5Y9?=
 =?us-ascii?Q?hZbBElhOEF4wRtDi6OlNS5Ga8XGRpFRQokQKhma4U/rxC8WvxghINSfPTGWN?=
 =?us-ascii?Q?V8tztRTjAEI/NQRGNFLgW36k0jDFYP63LtPqhGJ1P1UA+oxVood02GVGxMde?=
 =?us-ascii?Q?yOucpIaDN5eJgyR2DIovSHiEE5CA0PSVeuc2GHGZ7ePJygbZFIQF2je3YudH?=
 =?us-ascii?Q?9xvuEFjeVNsGBdjA2MqSmXW0lkQXj+hEp4pZo2rvXycw6VYlXm67IWDQRz6y?=
 =?us-ascii?Q?duuTYl9TxY3lDKbrH4UF0el+vOfB4REmAby7+H3u/5KPfGF42Xt/yIDZ1qEY?=
 =?us-ascii?Q?wUeRKM0Szuq9A84oD4+Dm3RKSveMVuavVomKfposYvLiI20MitRVLw4lIYy0?=
 =?us-ascii?Q?Toue0BRAa2mpl4szA4BG2TK4308NDFchIGqD5d5EEsC8acO8c1J5ksjri8nO?=
 =?us-ascii?Q?pc3xpZ9yf6H6t2BjB/c16slHnn26K9+ldD9jY6Lx9M1L5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kaMs4pWfOVu4nPOaIuJM7V/ZvhUkWHD+K25OWS8T4FQj5SWgLfHnQgB+og94?=
 =?us-ascii?Q?v4vLw//LUnqsI4Jea1qZgRxecchOztZ1Qbv4UG1/xU+fvGBopUm/Wh2POSe6?=
 =?us-ascii?Q?aULTn8H4ZA9/ktfUyED38HQnmaHYMgVGf8+1d5D5Hv6W5oiB+DdDF2DVQg/8?=
 =?us-ascii?Q?KsReyY0yIC3q1Fa4FXvu0RBZ8PvVJR2vaA4NrEqW59Eic6JpThGBBWrBRaLn?=
 =?us-ascii?Q?7DQF5gHQ0ri/mShypyTuKoK9zf0SowPHfr7uVHwUZ3V+ZsQY4rw5I+NHdzGp?=
 =?us-ascii?Q?pUcq6ZAdDecQuTH8SSUMGTOFfcRu5uj8R89bDOUoGfcS3OU+8mpejmE6nEjk?=
 =?us-ascii?Q?I3zLhfwOduQnZBZRaRpzbR1C1e7CoTbo+XmM/svwtLZtU3XzQMppPr9O2w1E?=
 =?us-ascii?Q?3E2Xi/4WF2Uu+0ePakBvAmJWGxxOMOHqX5Y2Au/SnvTjZhnwSU0FkhN/FbDF?=
 =?us-ascii?Q?QCBDt8CznzUFU4Ot6cdr+s61RjfLAn5LV3suH043ledx9fQnQiYNLdjEzmf2?=
 =?us-ascii?Q?EYQ6n3CpY6I2wyNA/GQKCxWfYdTjiuoBue4aKp+Ywhcy1d9iyuIUbxM7KcYx?=
 =?us-ascii?Q?WBIIcHimdi8srjqi1GpovuDjSxf7HD3m4ijWF2cf8EEz7B/dAEF4s5f7Fhn4?=
 =?us-ascii?Q?a5U2Ms6cH51d9nlsnyasCvUjh9liWReYHlZit8niPx6qhRtXEXRCtkgCERnX?=
 =?us-ascii?Q?JbaNX9qpO3AWRwMywSy6E45cm/6kkMv6UQ3KjlUoTg/BEqoRw+VKIVfDBI8j?=
 =?us-ascii?Q?1oQQW2Z9Gq6rF37CGqLszKAEXsXs7c+gOBfmI2eOyBQ6wlV1bGy4UJ6ZOFLC?=
 =?us-ascii?Q?YK3IOvcQSgKQ9m0gB/AxRnnc2Gocu/lY2RB9TYvKrM+SH383t4nvZ5iicEib?=
 =?us-ascii?Q?nnQ2NYAAu8qOY1CjgUIjHCbeth/fXvQ7l4zWtCbvllVlFlROkrOhzgVGwwBn?=
 =?us-ascii?Q?y+wls31D1VKc6C2PmmkiiwH5+F/1w8+tB1XHssz8IvYZ5V8U+prMZK9ZGssn?=
 =?us-ascii?Q?OQKERKCuwdFehPxRWBMaK2/eQIu5LT+nvc7uG3S65pNJ23kN7YbJlLEDsH+2?=
 =?us-ascii?Q?amFBsBLF/B2JsF0a/cIzABgQ5aMOgffsGwdQ6uRSoN0wrGJWo4Oy9RDCbAHA?=
 =?us-ascii?Q?7YOga4JYLCH4WMiCelj6//7Mo2+dWlRk88VgKoa8NGLPjR+gNazPv8TpqkZN?=
 =?us-ascii?Q?plgVa3WUFmmktzpxDsLWpam/I3v0QbCKFeqJ8KNAZp702wzholHjf8rqmze+?=
 =?us-ascii?Q?Szu77jJqhvrYIplZ3F+KrZHWaMXlrfN8bTPvZO1yVtcmoTv8IwW7n1jPcfYj?=
 =?us-ascii?Q?bO0o91LW8cpSINgSeaTfpbIZ9XVtRpJuphJ8L4/VBHPqHybxLFdhGGUWQF07?=
 =?us-ascii?Q?dOuSeq4bqeymRq4WhCf8bRs7T7jfSFwQg7jUxY9cTUq5xJ//esnhUKcuFQlv?=
 =?us-ascii?Q?zdyhgbo5Uyn/CD5MIBpSQL3PUAhLMIRtxZM7WGMnOEigzv7QpkoDwhXoPNEH?=
 =?us-ascii?Q?g9yY9DF+XkGO2nQU6rIbZEo8nMD/grNLKQecZi/VpGbJa3yJX7yxrKpaBI5I?=
 =?us-ascii?Q?U6ByZJOndOYXfaT0PGE5Jvi8o+zhTRVrGqyX9WXgJOOsxdSZenbxv+jUFfVm?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Oib0I2wGNvZ+1srcb1ZAwNi7b60bpVhJHmKDPZMto8gWFTvdZZUBHC2okGoT5b+ddY6Z8OnyfOfPKfUWbVAA2n1OYsBk78ETI/Laf7mbMaEbg3F72J5RwGDZQor3BzlLdJM3eHy7GZevkm6h03C3Rs+7dynOxaoomU4NDSaTUzUXVOD2vseq3A1Xo0WqGGgIyolHLwdvy+Q6yALvnwu8XHSZ4tGyktmDVARhfLG7RLYigRoDehgvLCK0kxYYHCD5zqGd7oNOyNJwQTCx9oYuL5yTyCvNlQb2ruzZKA1ruzjRpm67O7uuSjOdHyphoZAAN4D1xfIIPkNK8wb+OMNFWuZ+udjXg+XFOOdzhYeXxxnSlkzmB/NJziruxu462AhPngzB+ExoM3KH4WrPMR4avTJqX9mSQlTDOSvGQbLOFokW3gA4MbOUJvNLxrF2GRdKX4Ov5ULA5og/t0aOqcJX+32CmSyUIBPrX8a0Blec4yJjxzYYcWEr5oO0D9TpG//QmwqWG15KhkP2pAaTqzdekYyfpoKkzrpss1mLK3hXhTSSZazj5+iB54HAH0xMNL0YSgDy1RM94XnNgtA2QGiVTdiuzBjqhHSwUXbQI2Qz0SA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29293589-6a3c-4f87-c5ce-08dcb25a0151
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 18:44:42.0181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1671o1sH7hhsSG+u+QpCdr5w4VBXZBLxnHX/wcKkOBwl8czShwq+RAjt9/ujX/FObem2MFS0s+VsxXCSJ49uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6001
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_17,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=718
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010124
X-Proofpoint-ORIG-GUID: IIso_x33hsMMGEqGbditdLi3nphXPUG9
X-Proofpoint-GUID: IIso_x33hsMMGEqGbditdLi3nphXPUG9

On 31 Jul 2024, Kris Van Hees outgrape:

> On systems without CTF, we do not know the type of kernel variables.
> By doing an explicit cast to int64_t a negative int is converted into a
> large positive integer.  The proper cast is 'int' of course.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

> -	trace((int64_t)`crashing_cpu);
> +	trace((int)`crashing_cpu);

Hm what type is it actually...

... int, but it's under arch/{x86,mips,powerpc}. Is this test going to
break on other architectures (like arm64)?

I know this is a pre-existing bug. The cast is correct, so

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
