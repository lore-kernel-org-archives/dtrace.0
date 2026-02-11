Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CE52DE6F5
	for <dtrace@lists.linux.dev>; Wed, 11 Feb 2026 23:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770852559; cv=fail; b=NOCduQZxqUxfIstBuAd9MLf9fq4aalygE3x8UuGWoOBqcU1DI783UqcHyeDXy7uWlf2E8BGRDqulqudp3NPF525lt3shcyypZ33mvWiI0D4JLiuPrCsbNhBvt+QxSqGloSQlGMUH/+/6skaQIOjgk3FLaOckBfsQ9IaJrc1aI+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770852559; c=relaxed/simple;
	bh=0w6G6c6I7kx4eMiuq4iCesFki/hYdyIPEqqEXJtAUHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IQtemPH1/YB8KQrDSjKzOdm7CGOWKtUR15xmAdPBnMe0XUIw9SOQuCiQHfuSteiNSpjKDMZhDCWM7fkfkPe0XJ7cBK4i+B0RkX4KtqsCs4bMkl+NXHNZxph8CSOXqtvK9tX7TU3IutcTGPbLfvlyBCo6eVo++0pDt53sS5IqR80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rV80mse0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ww1zvco2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rV80mse0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ww1zvco2"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BNDSDs3474512
	for <dtrace@lists.linux.dev>; Wed, 11 Feb 2026 23:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OrIPu9YQXn2JAJOyAt
	Dk8Jw95Mq6VEH0Zaj3D5ufbdk=; b=rV80mse0WuupRlB3OuD4eiFH+Z8FngBKfJ
	wuhxjBoXwZxZUv+zGzx0Hm5IMR4pdEmtolE4TgFY6zgf/zoDURHfCOUOPxaS5ejb
	/Llm41O43U1/qyx4jCESmNsnpd0VaKzx6lySBgpZ88DaJEz8311t9jg77f+oL4yz
	v5gOUfGoYcFAF0DEcorhv/xq/JgClkiqCaiBfynOxMX/TuzHp+uak1pjgh/wEfjV
	e4V840lLL0Z5Knu3gKNWexdGi0GCTM9M1g2EGZW3kAqVkit1G2VRvjsbpPUYpf4V
	fcG6BPQm0olwgPpQuGbphSYK+VizBXb2MhqTI/lVWo6PYACsVbdw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c7rxu3yk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 11 Feb 2026 23:29:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61BMfxH1013001
	for <dtrace@lists.linux.dev>; Wed, 11 Feb 2026 23:29:15 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c8271706j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 11 Feb 2026 23:29:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iJpaKhQro82rk2Vc8gPTcxqpBYs+CKLmSURj4ao43czqgtJQ7bOj+IXh5Brc6qMafWnWhwyNjul9HHv3QfIrXESayoxmcteOHvMcvtVUN1qFJfggynGXtMCEgkyUWJJMxBZPrQGM3cZnTq970i9eehKAMmMAR7ET2c851YFXPCqalNO6dZmQ6eVaDDin00s4c9CbUUDQMG2XRan6v3A7uYZeZyvD6ZniceWQ8AHRnYLF+TrI1tWAShJNJrXu1h9h4ey+w7sDV+sQkFurSaeb32Ujhvo8ja30oAyD6xCVHLmDR8OxqB32IlggiLSt2UTPMV0aUw9FDaQ5toHZtPBRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrIPu9YQXn2JAJOyAtDk8Jw95Mq6VEH0Zaj3D5ufbdk=;
 b=p/Udx3BF5g3+W8ij+kQ93c7IwDrfQqLV6u2scuHuAL9phs3jaRtKNQK5ib1HgdRdr4jv34H7xH8O4Q7ilvhWiOYKUME2aiIraIN/NeJ9HMDWjsBFdiaxp0pJtQ8+9ahR4R/Ptpn4Tiz7uYwucZCqBehHLoMvsZjgurxvLt5gMjLLjhkg8ua8K7e29l41LfXcYabQv0um78m6n29HqzMYQzg3OXyN4Oz85H9A3w5ysKgQr4xXIBr19BD/BTRAPGY3LfTYIu/O8HjSxIz1QC+jTNRnw049A7MBNkYQvjJvpVrWpf7GXcyMvzlrhzv99P+nT5DLd9jKyiSB62+ApHtCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrIPu9YQXn2JAJOyAtDk8Jw95Mq6VEH0Zaj3D5ufbdk=;
 b=ww1zvco2X7Ga0OAmvy8CnqS3e4JgnEaB8BFEFIU3YKbS1tO1VmwNtXeA52zGpPAJzauLAR6Kn+2MmTi+x08I71XrlsyDqnX/zO4pUQpmZ1jA1lRglnn60OzbH5Q++DRvnfn0exR5IoA/y6V2MKbHOzuZ7QFguZQck1U2t9k7IhM=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DM3PPF00080FB4B.namprd10.prod.outlook.com (2603:10b6:f:fc00::c04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 23:29:12 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 23:29:10 +0000
Date: Wed, 11 Feb 2026 18:29:08 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v4 0/9] stapsdt provider: simple system-wide probing
Message-ID: <aY0QxFZOJvmUYHiv@oracle.com>
References: <20260119142300.975014-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119142300.975014-1-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DM3PPF00080FB4B:EE_
X-MS-Office365-Filtering-Correlation-Id: 55c87922-726d-4d1f-bbde-08de69c55bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MgaHGuG25iGFBN+sJXidYhmEUrua0PkUqnOkSwNO0ZRwvqNzwNhMtGA4kruu?=
 =?us-ascii?Q?59ibmGu2b6msLqo/iEG913/9/4I9oAPZ9QNGcUUqSZK/9jUnIXahaIlqElJm?=
 =?us-ascii?Q?kBPDXlm1Kzhx//Ux6KFfhVU6MQEcdILL2bM4fRw/BK/LK3IOugEbX/St8IvU?=
 =?us-ascii?Q?v+3xCBKc/lGcPmOuVfytPYF0vm7o8kY228kQ6hdqNNIBa0buyoez6UqNPZD0?=
 =?us-ascii?Q?y71lJ2BwIVgY1msW65d+9ykro1XvtNdcEFKCc7NjFIA1D+joPXG9r4E2hbnD?=
 =?us-ascii?Q?9FkTV8NlNdT6QC0wsaCjIHwM8Ji0Jwubiea3YcgWQWWmcciwaiWu3OSZggW4?=
 =?us-ascii?Q?dykf3lVS9MgP5auoGaXd4iFyVjH9Ga34BoxHjclLjz+ZH3EQBPmFRun9bSKy?=
 =?us-ascii?Q?vGtO8LUC2Cz4HDxPjhCvlJ62mpcxeK1YXUYU3vgAHXt6bhNCMVmwzgeAkw/q?=
 =?us-ascii?Q?W6kYghQlJ03x6ddPJX2FHAp6t1UaQgrARZYZzG1wOlKA23XEFyD9wFOromH0?=
 =?us-ascii?Q?GMcHZntTjbhxWf/sHLr8p6HgybqlZnS2e+iOQiuvMPgyNxr+C3VXfG3s2qua?=
 =?us-ascii?Q?qaXBLjNW7CIO2oVkc31sjAsMedY0+2CMmAtx3YcJrmcQEnEAXGPB+CjvZgv2?=
 =?us-ascii?Q?lLV4nLZuHw54eMSzXPt8ENi+5Onm+EzKtHweDxdAtpAMpAmoDsHkiLATaJ64?=
 =?us-ascii?Q?I80csN+kb3keQ+wFSKeMSYcWPAsyVtdfSRfVeGujDddoEVWkqIZzcY2uBTm+?=
 =?us-ascii?Q?FVXASXZkkywmXYV1dWshFIZBKwdHFiXttVMeinBXv0kh44y2H0i5FuArUT1a?=
 =?us-ascii?Q?fUdUOlsTYfhSXaVBqdRFkLRqzTAaMTVjyDxptZERz3ILj/aooXn+lw8I9jim?=
 =?us-ascii?Q?pyi7jFoRM+JFsw9qL4JHT8hppmX4lodP+3LTv4Rnmj/hIHzagsqebHPbv81w?=
 =?us-ascii?Q?91G49zuW59FM+Kcm06vtVkcLuWcseW43B1d7t1Vrzm4AAxH2M8pFZTZ+WesC?=
 =?us-ascii?Q?R/cna6FvAusWSb3HIbiFn+eXTH4RH0n51C5phQvU8a1wFKimC0cvLmNwrBdL?=
 =?us-ascii?Q?IfjJ9s3bN+FVkRAzxTML/DZ5DT0qXikLqBmQpiT0y8+0rTYRYvumaG+YiE2U?=
 =?us-ascii?Q?G3grc4TJo4CNyLWWutId3sE3bfl89Nt/yKoZcPsLER9/52kfgWFYGUclg6uL?=
 =?us-ascii?Q?pab+xBeSU//5ImfjWLD+DISDEtjT2sL9V5g0244xEzyNOxGBquRG1CY9+gEm?=
 =?us-ascii?Q?ZqJNF7H/nXHAn2xk5PfprEhVK8RCt21ET0HfdwRFtqoCo1IEW2tSxBbR/eyI?=
 =?us-ascii?Q?6kf6OA6QGwKH7vlP7zH3gNWdhAfrXxQZivn3vpE8DnipHbJFxrkEg2ZKLuHx?=
 =?us-ascii?Q?8569Bijqg7Xl74slN7aNkgE7FHdzmMWeWSXWNSP55uLQ0pjAr+zZZxQRllRi?=
 =?us-ascii?Q?P3+2G+Uy9RL++e8plivO/E+HT21fxIonca1hLuSG2Jc6aYuEGA/SbeBAlpoh?=
 =?us-ascii?Q?6y45dhY1UWPELB1lmIxwKmx9A+xi/uL3IpPyjnDVRfEos+Th0G8oNqYBx1QO?=
 =?us-ascii?Q?o8MORdgQA1usblWhdyI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WKI4ZSKmkJBNiSAFpZ0L0pI/ZYQ7UC5b1VZrcDb0DtdCGCuKzw8jejA0co9O?=
 =?us-ascii?Q?r02VShX0bBpnF1qz28OCOiBAzNbXkgKzOs+yPcmQ8X4UCoTNda+rR/21cxQC?=
 =?us-ascii?Q?XCq3+5cBDVaeqAnv80TsElU6rI8zdLHb9gQhnt/mzJBDUuFwpXrCoD45XO+T?=
 =?us-ascii?Q?FRpJKbhIVUzJQ0ZM10gGP18Ef0Xbdf9OzhnHWEF5/0Np3GrQtPvDCCmhypqj?=
 =?us-ascii?Q?Ad6mwUQVm+HOjvocTDUpNa5ZHJ47jsU1gQuPHmIfJFrTqwHnbNGKBvuqaDiy?=
 =?us-ascii?Q?x9bj5WRjj+uC3NfcGCkDM7dW/XDjUc05YRJikZXxMDvLwoxw79aJSZfuB1mB?=
 =?us-ascii?Q?+I6XqoiflRU8DZGXg+VrynRrb13yIuwu+Octa1786MQczQUrNcDt5pmCT68l?=
 =?us-ascii?Q?zvC9oRwOoY6F5OQkcJOCIBy4aD8dvZp1StOoIdShi7Z3T2g6l7b84ivVqyVA?=
 =?us-ascii?Q?5nXjiN9PAoeHQQpGjrAdLI1Gh+ZdzJWd/HMWN3jf/rRiWkw9ktKGXMV15kSW?=
 =?us-ascii?Q?281MXp4PJo/ZVknJU/sRBmpisH4af98rFrh0N9aBigMUwZ9lVgkntEZMiP8I?=
 =?us-ascii?Q?J5AH25II6LRJt/vfSLz1vv1ybKjcRG8tyUVQYPOWvU4jm/kscYSfzM8yFAiC?=
 =?us-ascii?Q?Sr7z3j2OB4Gu8TVUl1KeT/2/BQTpMikU8Ovi/fjLOjrt/oIV2QCVvjJ+y9VE?=
 =?us-ascii?Q?7lAn/1xWus4DDiqgr2CCTa0ncqzmrTJyH1f58BqCSZ8PZBVyOr5LG7ttydek?=
 =?us-ascii?Q?dTKTJRZQlArYqSbK1gAtKIPoPOQmERHBNkkQCpEWMZunCPgo97bC4IISj28q?=
 =?us-ascii?Q?CkfHocvpi5GhdQz3CmXy/DwUbm5V6kiM/Xpbg1bJ5uuAfbeGhXJmZt4UCw+P?=
 =?us-ascii?Q?wVWrc1eDXAYpQH3Qdpc0yZM96RTysDI4Wf+0S9KNllR2ik33AL7aFAjeQh+5?=
 =?us-ascii?Q?/Vs9yVtp30kQsMsDhsV4hwwDL42pp+7gtJ8dqpGzsQxgWh49E63kFVP2vqH1?=
 =?us-ascii?Q?RqGCPNMXumFvEX1Xu+LoX9Dt714W8uH9iZDWUSY1/sB2vw5BLmNqWAT975it?=
 =?us-ascii?Q?40W9YKepWCvwRnXcylJn0W0gPaVhTwpUwmvQNyl2Uo8J/t58KF21M8/jL2Km?=
 =?us-ascii?Q?injbxX1vOmJ/FBmMhICjLtvldILAHY04tF38CYZOrXJ812DYmGYg8xFgTB3q?=
 =?us-ascii?Q?yxBXaPxwMhrDXWG54gbcZ/AkkhjBkerd9u7+3zsITMGPCahZ+21PwAGKhkk0?=
 =?us-ascii?Q?k5lDYYBuAJGUN0a7e/EM7xTkbnV+pRhoE+xDXSvKNUnTSn/kEbBQWZPlwMnm?=
 =?us-ascii?Q?z9j2dGmvQNhPPX2irfjDDBQitpgReaoyoStbpdBbcXL0OolJJoBvxFLTPmSq?=
 =?us-ascii?Q?7lbkMmFtaRcpzOJr0/ICxa4UGz1PZl+XXdP6h+OPnLdb34FIsqYyGFRpKTV2?=
 =?us-ascii?Q?AAn27b5VtyBJfL/zIs529rl90B3YE5ubkl+lBrfRBa22nYFufALY97o+324Z?=
 =?us-ascii?Q?kXY4tdS4NX2tAqaXrNAFwtiTfq2e1hLf7GvHQfp+L9R4AoPbeiLSsoPUHnRE?=
 =?us-ascii?Q?B2WrjzJ561Y7QNX0k8djNiedDeCtJGuOt7YRLOU1lH7Hd+Eqn8cUfy+MIH0E?=
 =?us-ascii?Q?gNccOqwHJlkYOPuiUkNS8XEXiM3CuJxAVYD081FXeoJQFu33s7ErczXg20zi?=
 =?us-ascii?Q?W6IrhOHUwiXjZGlGk2mSC45YXD0I//RZ1POCzzNUk6HPhI4N3tsiJJppX/9J?=
 =?us-ascii?Q?B5EUyBSCFw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TaEAUrvv16Gi1aSNLYhegUR7mAWWMtwMQb8/MdclExn4th5slGkK5VnPSutokNR//chcatfXp6rP20AytvqYV8NsxCW0SFaB/FQRnDT8U/3yOEDES3yE7JvRsqXG6tyZ8PrU606tKWwoIAkru+HUIpvxWRsPkmV0VOqCyubSDOxr37r5ano77rTyG/oS/9uVv4eicHRbCqRETVl36jqJDX68k2F6oAITv4kFkrSDyEMOvEnYb8/AyOKW7878GlAF2WcUiBt2119XlUzQuMnFm708psjTaJETEQWxSx6Cib5zLdffwjzkI7r3CddnCyi2WLGdL5Ire6rEQtgLQgbWr9T2MTeaNlvhSp5gyBjQo52GIB8eseA2UxDKM3r/IwwMeBTdv3aIMSPKP5LsbKYTKdUdQ9MMS4wediQ0jzKixjYh53BxJ75+2TiauDFy1yOibH07rwh1llfdCpyTh4ExjzwRkzN3Wa2EiYo5XNuUgaKDJfgy6krs6nqzPRaMUFs5PsBCu1Xfz/5ZIPFXp4rmlTZ62DOk0lYjmAC2B/x04yhElD27r/GvgLKGWfNUZLWzJLiEtyOORluY3Y71GpO/LcvgmBt9KakJeRf3l1eKtBQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c87922-726d-4d1f-bbde-08de69c55bd4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 23:29:10.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwK0MOfp+LOp3z8Witi4KnuAx4SPRyNKme/rDgNjulfPuc8RdHBE71pg5G7klFo7kp4CyhALsvk2CXER3Hi9S/mcISSz0Waelt3EmXSoqMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF00080FB4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=887 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602110182
X-Proofpoint-GUID: ZV-onVmO1OJKlXnRueSt4cSLVsYARe27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDE4MiBTYWx0ZWRfX7l2dmad1sidy
 jtkvbBtECZdEtChIbGsGMN6xLAFacfhhwWhQSUS2sRjIEAKvOeav/58hlKJzlFBrRMktrdV828R
 2LlQuwUw5+jGlv/oBM/tXGffzETOiE+w4CBcKkIOQDTDJ1gSBwn0wxuSO5M/oZBFu9TLsrZ6cp6
 rzdJWYrfM+wnmNDP93WmlxNALhJCIrbmkXIrzqQZpWec0sYrWqnRgNOBGYeGboeryiZoCcr4GS1
 9WV9FqT7EGq8xZm8cpPcaaq4IN3eS89nJOwAdgB0IW5/hwYzbF4pG5C3v8NerwL5BN0nGWFv/QP
 0K3h0yCawVBkfilxL3DrVukj2G4wXYwPSzDxWfyAtsODMTXILzqbG0uy5SZLWxytmk+dqd8XGl6
 g6TlbeFBDMaxBI6N8jY4zWGRSFkkb97/QTilC6d4ml6XAZQfjictsXAV4/AglQeboIMQoR+xEro
 AoHqUe23vJq9/gvKY9L1ECKcLeFE7Qz/Ozb4swUE=
X-Proofpoint-ORIG-GUID: ZV-onVmO1OJKlXnRueSt4cSLVsYARe27
X-Authority-Analysis: v=2.4 cv=Y6f1cxeN c=1 sm=1 tr=0 ts=698d10cc b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=Xjq91CkzvB3XtA49t00A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13697

I am reviewing this series, and there are a few preiminary comments:

This still introduces the issue of allowing /-characters to occur in the
other fields of the probe specification.  Allowing it in the module field
makes sense, but it really should be restricted to that.

The current implementation poses several issues that go against the overall
design in DTrace.  E.g. with the current design, when two executables trigger
an stapsdt probe that has been specified with a wildcard like
test_prov*:/some/path::args, the probe firing is reported with provider name
'test_prov*' which is not a valid provider name in DTrace.  Per convention,
the two would be expected to have PID-specific provider names as is typical
for DTrace userspace probes.  They would then also have unique probe IDs
rather than sharing the same probe ID.  In other words, userspace probes are
always per-PID and never shared (even if the underlying probe is shared).

The current implementation also results in a probe 'uprobe-1' to get created
due to the fact that you set pid = -1 to indicate that this is a wildcard
probe.

Non-PID specific userspace probes is something that is foreign to DTrace, so
if we want to go that route we need to put some design behind it.

Otherwise, we really ought to ensure we keep providing per-PID probes at the
DTrace level (even if they are implemented as a single uprobe at the OS level).

A thought...  is it possible to use something like inotify to know that a
newly started exeutable is using a particular dev/inode, and use that to
notify DTrace to grab the process, instantiate probes, and then let the process
continue?

On Mon, Jan 19, 2026 at 02:22:51PM +0000, Alan Maguire wrote:
> This series adds wildcard support to stapsdt probes to allow
> tracing system-wide; this has caveats due to the way the kernel
> implements probe addition.  In essence, probes are added on a
> per-inode basis (actually in the VMA associated with the inode)
> so it is necessary to identify the file where probes are found.
> Probes will fire for existing and new processes (the RFC incorrectly
> said they will not work for existing binaries; they in fact do).
> 
> Patch 2 describes the approach; to facilitate systemwide tracing
> we need to tell DTrace the name of the binary/library via either
> using module absolute path (patch 1 updates parsing to support use
> of a '/' in a module descriptor to faciliate this support) or an
> module name; to expand this we then use [LD_LIBRARY_]PATH
> to resolve the full path.  ELF reading of the file and insertion
> of probes then proceeds in a similar manner to per-pid tracing.
> 
> Patches 3-8 test various aspects of systemwide probes; basic
> binary support, library support, listing support and is-enabled
> probes support, and use of absolute paths.
> 
> Tests ensure wildcards work for
> 
> 1. a process started prior to DTrace
> 2. a process started by DTrace (-c)
> 3. two processes started after DTrace is running
>    (via system())
> 
> Patch 9 updates docs to describe stapsdt wildcard support.
> 
> Changes since v3:
> 
> - Semaphores need to be more carefully declared to handle
>   the is-enabled case where the process is not running when
>   DTrace starts tracing; the kernel handles reference counts
>   so the probes must be added to the ".probes" section; see
>   patches 8/9 for how this is done.
> - Modified tests to start an instance of the test program
>   prior to DTrace execution and start two further during
>   DTrace execution; ensure we see probe firings for all
>   4 of these processes before declaring success (Kris,
>   patches 3, 4, 5, 8)
> 
> Changes since v2:
> 
> - support absolute paths (patch 1, 2)
> - add tests for absolute paths (patch 4, 7)
> - document systemwide probe support for listing/using absolute
>   paths (patch 9)
> 
> Changes since RFC:
> 
> - update documentation/commit messages to reflect that we also
>   catch existing programs/libraries when probes are enabled
> - fixup provider name for wildcard probes to be 'provider*'
>   rather than using the confusing 'provider-1' since the
>   latter is the concatenation of probename and pid (-1 is
>   used to connote all pids)
> - add test for is-enabled systemwide probes
> 
> 
> *** BLURB HERE ***
> 
> Alan Maguire (9):
>   dt_lex: support '/' in probe descriptors
>   stapsdt provider: support systemwide probing
>   test: add systemwide stapsdt note test
>   test: add systemwide stapsdt note test using absolute path
>   test: add systemwide stapsdt note test for library
>   stapsdt: add test for listing systemwide probes in object
>   stapsdt: add test for listing systemwide probes in absolute path
>     object
>   stapsdt: add systemwide test for is-enabled probes
>   documentation: update stapsdt docs to describe wildcard support
> 
>  .../reference/dtrace_providers_stapsdt.md     |  91 +++++-
>  libdtrace/dt_lex.l                            |   2 +-
>  libdtrace/dt_pid.c                            | 177 +++++++++---
>  libdtrace/dt_prov_uprobe.c                    |  17 +-
>  .../tst.stapsdt-notes-systemwide-abspath.r    |   5 +
>  .../tst.stapsdt-notes-systemwide-abspath.sh   |  89 ++++++
>  .../tst.stapsdt-notes-systemwide-isenabled.r  |  13 +
>  .../tst.stapsdt-notes-systemwide-isenabled.sh | 266 ++++++++++++++++++
>  .../tst.stapsdt-notes-systemwide-l-abspath.sh |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide-l.sh    |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide-lib.r   |  14 +
>  .../usdt/tst.stapsdt-notes-systemwide-lib.sh  | 215 ++++++++++++++
>  ...tst.stapsdt-notes-systemwide-lv-abspath.sh |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide-lv.sh   |  48 ++++
>  .../usdt/tst.stapsdt-notes-systemwide.r       |   5 +
>  .../usdt/tst.stapsdt-notes-systemwide.sh      |  89 ++++++
>  16 files changed, 1123 insertions(+), 52 deletions(-)
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-abspath.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-isenabled.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l-abspath.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-l.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lib.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv-abspath.sh
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide-lv.sh
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-systemwide.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-systemwide.sh
> 
> -- 
> 2.43.5
> 
