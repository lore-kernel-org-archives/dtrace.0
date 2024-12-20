Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAE5226554
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733520; cv=fail; b=cC4AkKMJWqPwQrLProa+QVU/ztbhg/D2HfsjYejYzM87A9i8hRcUgyS1YHD1I56z5uN86h24kV2OkyBObjcIESXq3EY6IXW8iVoNe0Hg1cpRg2k2WG5GEb2FEuhkv0Rb4K964app0mQncme6Q2fykPXUu/4b0rBrjGYcONDggaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733520; c=relaxed/simple;
	bh=OAluBwYXNDBh2G8D2O6GQgd50F0lU9Zu69HXg6Jsohk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JuZN593gB5SVc+zTjt3qgfKK4+C6JG9vg2CPnshVVdC2aIWO5ikdqWP001cRHcGEOtdeD7ZME0y0WI/DzpJ/Sr+PwqGiTrdpbvEKmZibJI3LRJlGW/c5JcPbLGsKJiRFKingUjCJvYBW/D4emIrraKBLLkDVOgODEHD15rvRbe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PVk++eb6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Kq68Fj3y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PVk++eb6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Kq68Fj3y"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMMpt2000946
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=LoGNdwjio2vfHktVq0
	0EueqKvSTUkAy9fzaOsPqvHm8=; b=PVk++eb60n3i74f/KTInbVeB1qrubpgi3F
	ZXBH2Ujb9h4nW8HB69VK2Kbk4QC5AAE6/cJfxKC3viqVM0WFyOAEYmmQ4OX01SU1
	v/yuWkAB4ghy8rQ/L+l+cqDcM47leMzQSU6MgRDQCS2Xayxb+LSWKfICYjpjm4dp
	F4st2E4EXxDht8QM68DiAGVkeBDnNsrzmLaBaMM8ZOKJDGHiPctT9KzYiO7NVVX/
	Rvd21qazn8S8XAsGUKcCxwY9kiRcQRV7tSrvGsHLv/BfGGPwP+xM/kZAIk5s9L8V
	3pg+Om+A/5/t2aMi2jxPxr8nDf2Prphft7a3Xz9uplK2GJbJQIDw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0m0eb7d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKLcH7E035452
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fcyk8e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQJWa+ejdOxXj62zR8L2XMKAz6eEcctOWzlNXIg1gMFlQXJuBRc9/M1yTHE7VtyKmkSKB3NMifIkVgIOFYZ+r2gsXSLDQPUSX9ps3aUB3AObdks4MWfpWYvQD9Xj3ncg3Ks9QXIBR3FGBH5ffCHOrwV5sV2Y4Ihawa9MnWAoxPejFJAOSdUnd2QBSVrKGSNMziCRP/H6oQcM136k9qLt7pzddau0T+7DezP3HcBocff7CF7guFfeI/j1cPgsQJHzvEHt/aqSXYLShL9A/ucg+ooAAtH13AMS9Pj4V6HJzrjlLJ7P1DEDtnNw+RDi4b1TuXdBc9O8VD8L29u2HWasnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoGNdwjio2vfHktVq00EueqKvSTUkAy9fzaOsPqvHm8=;
 b=dcjWrNXII/TRDMfmosChn4NixkEQKVMU3eSQ3F3qrNydZEXWxQqHdFHk96+z4y8iWkrR4qtcRCc9XxjWS82s3esgumk19EKVkdu49cwfpqhHyUr6gS902hx8YSG6ao2xABWbK6WGxyI2MAe0cF9HQ4ZL4P6ebAvayDHjDwkpJNwpqulW0Xs981osAjkgx5zcZe6gMmvEiNYhaTUk6bLiMe50YoOWBbGPzzxzB4q46RhU/4rt1uW1vs+EE8viWR/ExXslLO6WG7FxyuqA3XjDtGzACxAf2kkp+aVa4/ZEATrYa+E0aMsPV/kyaLKPG9CZX+G6guK6FALLXBLqha0iZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoGNdwjio2vfHktVq00EueqKvSTUkAy9fzaOsPqvHm8=;
 b=Kq68Fj3y86AD1hC5amPggGmeBxcEZ08At0vci8TDiYB7nnoLc18aMsA49pLmcG6x5iz9xZ3XT4FrL/uTAMd2NDo7MkhwzqPnO/plcdGap4HsTR2QHNgDOgCJTY5SiXfcxr+ml82jCpymGacFkYD8J0ETEC2nc86Y0gnsTvcJw5c=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 22:25:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:25:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/5] test: Add USDT multiprovider tests that fire probes
Date: Fri, 20 Dec 2024 17:24:53 -0500
Message-Id: <20241220222455.18351-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222455.18351-1-eugene.loh@oracle.com>
References: <20241220222455.18351-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8a5eac-15a2-41af-37ca-08dd214529ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yg8HfBgQoY2ePXa+uawfQrKsNYVCoUemIzwVG+Ls9rHvS2EdeAd8samyyEB8?=
 =?us-ascii?Q?32Mq+N9KrzDH0tTILOynHjaprCnTTMXPtV5PeWxYfh2kxs+DgoCUcQizm2qS?=
 =?us-ascii?Q?5n10sUMMNVko7l2QURz3M898CNZYpgFwZZpsipUiDINSzu67F4RjiBVmAsxr?=
 =?us-ascii?Q?dBEKxLjgGdNxphjJ3i6/8psqYYaOcjtiQAM/Ki4FLols2t2ppuGIBvM3sCza?=
 =?us-ascii?Q?uKU7FUZ3BJ85tb5fYB24+/L5Sb22fuZxRxcGcqCuXTvQsRS9VFKL/7DSMRb4?=
 =?us-ascii?Q?3kVHJCiDXKu7YHfs9G4Shj21sTNeBh+kj9ajsIEw6DtC3r2pF09Sx9Xl7fWn?=
 =?us-ascii?Q?oZWXet5RjJsxEQjYKwlx1jwnKJwNXHOi3g5WyGS5+rm5ig3jUqlfGqHKM3nq?=
 =?us-ascii?Q?foNvaH7wmYG8tO1/whUpkrB9Fa/Bl3/P4vBldRZr3cEAS4TFm+3N/OR2VP86?=
 =?us-ascii?Q?sbylUfIQbCp0XuXhPZqgu6v6XG11WaBIc3GqjpThG6zjfD/iKSq1jI6fr3EG?=
 =?us-ascii?Q?gbpza8UGvCz1RTQqUkDwGaPeAN2FKCvZa6Bj7FWhVnuHeYxb3d0VML2nKAa1?=
 =?us-ascii?Q?tIbvfrc+GkZVFZmGapC1ksy9YB6n9szQL+sy6emClIMY3GwO1ioqrizGztOK?=
 =?us-ascii?Q?XNp/HXW+5Jkzzx6Psvto4f1M8to9czXr/x9NisbAizThZQIXbkdeTbWK7BPU?=
 =?us-ascii?Q?GkLsb8N0nUcRMQAPgnkwDdFCPnmUikpCBO0x2KbJYwLvmVS7eOs/waypvdEV?=
 =?us-ascii?Q?ACRrzXqxPJKTsLDTUUTk/e0V0omxETTGFagPXA68impeHe0OO4z+zqt7Ho6l?=
 =?us-ascii?Q?d6uh4ed6OxwZP1GL0AuX4tK6ttRXMrI7ZuuzsKSxB+FYveQ7KYQQcNzH2VRU?=
 =?us-ascii?Q?Kg/PcHSii7BYP4oCizm00XVMptAeti0zTU3oaH4KkWei9AYKto65aOHuNPES?=
 =?us-ascii?Q?/mY6+cWJglO8dpbWTz+1xwzGc/hI2EJr4fXx/+JApm9w85zD1HeK2sZCVoYN?=
 =?us-ascii?Q?5TgkXUUG57qRwYQCFhO8dRP6kvZ0QVPiDl/7uKALGMPzHKHgnQgZh7TrPmSk?=
 =?us-ascii?Q?vIMYTyClDqdqOkhY+OUR62Vl6DCHUCC+tr/yQd5LzZiDF51MXqz9a10CbT8X?=
 =?us-ascii?Q?0/MNGCUC8IwAJZ0k81PgWuUnf4931CN8wsvVaz+gEjeBinEKntm7zUbKCjfb?=
 =?us-ascii?Q?gpsAv1sRULOCxMOf69QHiC4bkUsV4OADwtHM+MWXtw9Bn5v8qWPQD5Jdksyc?=
 =?us-ascii?Q?hpi0AwYF90l2Ig9mWFnODPvzyWcAIJIm9aPGAiTI2Lywj1tKajbRDPkfNF20?=
 =?us-ascii?Q?pT/PSvZhs2GOOYGPClm83RnqJLOrF3zwBbiBsv+QE1aEIiWtCKFjeeSQVyMs?=
 =?us-ascii?Q?X53cQreTbEw8s2BiM48g15/fldgb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c6hKdz9JOp8L1Wf9kjTgMpJA7FkYwYrYMTuogclu87x+16PioWO3kiNl8tFa?=
 =?us-ascii?Q?HrM9Gn7TizQCnsW9ReLYECwhQsFEqTkoM098sYprJtFxysfDNOZ3p4nL9yt5?=
 =?us-ascii?Q?OPt0t/ra5fA7Ls2vIOW2GXZmr/60O8GlQEbZgoxwbJC2ummYqbljFKlKWfeh?=
 =?us-ascii?Q?WEaPWdV+6/WQ9XvRsjtNAVlaQpbhqMT9xbO0+4TDhRirbwz32p3quFS7t1Pr?=
 =?us-ascii?Q?nnNixbxuW5qeuZN+0bmoe0Lj+d0tlZ5s5w/ArM7y7OBLX6W1CwfpXSJTfwtn?=
 =?us-ascii?Q?/9T4X9/VhhGulWz3gIBJcpMH7FvWEg0JJxYyEVipHVoYmWeB1kqc5Bxdsfq6?=
 =?us-ascii?Q?J0UM1IhiWXjE94Uo/mqDhkxAjwnSjNaBEO1Zblhm+X4IiRbhvseEbC9wG+ph?=
 =?us-ascii?Q?n0+hEQtqdnZPSQXCusbcpHbPd5F+D099dJUGOJVt+fZwF2wszXprzIOhQopa?=
 =?us-ascii?Q?/39/SwQDhr7tMe9IgVSs4h7gcnZzQsIgKkKGbDdjhTULWue7gFy9ZhPnAgzh?=
 =?us-ascii?Q?0a3ol49iPeoSTO2hGgqNWm+5QuAaw9K8JlUkg9HZl5mjzNQjJ2fzZg1WGdUV?=
 =?us-ascii?Q?7chU5P4VvyIDRqOQxlaHAZoa2eYupQ4p169nPzkqWNJDBfW6vfqXq1vzZNX6?=
 =?us-ascii?Q?VwGirO6uvLbJ8dhk+YiQ0U8bIhvgzymDG08AmVt27NRzofX7YxSfB8APB0Ix?=
 =?us-ascii?Q?A1H+ZmDfp4figO4Fk3ETq6C36rI7dFFsDs4nZnr/hJ/XXods93QJZkBQcnGR?=
 =?us-ascii?Q?gOrkvcunOHxPpr96ZxXlU9aMT78L83asUbN1UHf4KILa4Rl5zi9zIIqISJZm?=
 =?us-ascii?Q?GSm29Ldqwd+mMTaTyDta0gaLLlTMqoVRXYQO2PLKxku/HJWUZqOjcb8U0YeK?=
 =?us-ascii?Q?xwRb8fzRyt8XdWeEV8UZOB2QPnzdIeEpQE2jSeRFOB4u7M6tkhPg5sh+1f0t?=
 =?us-ascii?Q?HvwcC1GTzYIFmwfzi7kz/atEaNiQS0B6GLYCgY41/urH1zXFBFAvvlv2b448?=
 =?us-ascii?Q?Ebe/U7a3/SA6VhzRQH5cBPs+I9BfgJ0fcQQ3VAhwvFq2+uzTbfYqJxMNMx4N?=
 =?us-ascii?Q?gG2eT4poWCk7OH+vp0VkwfkHoZTx4KKn2havNAurZR8MuPgLQDZ1xL1tD7TN?=
 =?us-ascii?Q?Ahar3e6LUa7rJ2by4uM+9mVY8thPznhAj+fmw+JJWictoessk8Z3zpTzX8YS?=
 =?us-ascii?Q?WBJC4hedRolq0OD8ym3qrw8n7pNeLnjsAWQjH4WZEISZVIxg+q3TjX1nplS3?=
 =?us-ascii?Q?h/uEc9WGG+rVNpsblknWKEfQBQzFHDJIrDxgs+6vwO67Hsi1BkIvm5VzmFz8?=
 =?us-ascii?Q?RJo66RLKQJwi4vLem5lQmGPPkzTfxwpgJug+KhfcpNVibhEyzT6QpVfZYxBp?=
 =?us-ascii?Q?qXO0w+jssWSaxhPG+A9p4DzZ9DpWvaXARDXx4bUmWoV85Y4CE3tUuq2W5YQp?=
 =?us-ascii?Q?XqO31XbSvKytILbvJhr1yfce/NWBAsvZR/2jEPOQJc6SDQljU2yj4Slth63N?=
 =?us-ascii?Q?AF4XYuCK3UTwjmU2EroEuBguDEc++cQsjAXEzN67s/AEYqkQ7OgphhnRRiX+?=
 =?us-ascii?Q?rasi6VJagxB52Gsqig2qlvbk3DV9KLxQmt5TzLMj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7HpnuULq536YsG3Gsa+U1joouNNbHC21casLZ9JrYInd9dZLBwrfIPGb9FieMruY32FsIPqzegreO17sagMmzKMAY4554ZyQtZYlE8otWyt86sfOC2zF+Y5bj7JBJsV0u6XPFgHZgufXhS8z/Fffxy6Mlf5F6dFDarku7yiMjoIL0ppakeOrho6OgfYcpGe4Xb+4vXveAOtzh4YqRk6ng1w0W0tuoNkjUzPb177FnQwTbMrV3SIFy1ijQL8kQD0LHNAsPgD4l0/IcUe3LltVpkSfShLE9wx7aUNWxWKXfoOWuAJuqFSyj15Rzoe/rdqwR+Kw3ccLOxMF08ySezgJezrCrnZDWL8OvCFCDR/wzXaZbKd4bZM2zgwfUatHLBwxUUQCrLXZptNP5Wqr5mGpc3uEokKgnI7PTpWH8peOLoDeJYUDeuTab0zrda4GLmoq7qrqG48ExebiLijylj3Oy4TSSeRltvKTUxl4d6tVzQ4HKaCnL2NYTF+3gvxIoddeKgv9xH/02+z8OolU6dRDyshxsUDJlmhd+vpxnZ3iZmtvVsKTGCopaSc3o+aaK8fRvpjVOD58hvaYyPDjzcOLPOcxkuAJdHSYj9UIuFOypiM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8a5eac-15a2-41af-37ca-08dd214529ac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:25:09.4184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wwi7o4KyUsdfIObiLkBC4UA/in0KP74G9r58Ph6gTnFAY4K0V+B47J01hynOzGHffoQNx/CTmVXHANbmULOv0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: Ge63KjtlqdfgHcafg111QdFG7oW6d_Bg
X-Proofpoint-ORIG-GUID: Ge63KjtlqdfgHcafg111QdFG7oW6d_Bg

From: Eugene Loh <eugene.loh@oracle.com>

The multiprovider tests simply list probes.  Add new tests that
fire probes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.multiprov-dupprobe-fire.r | 10 ++++++++++
 .../usdt/tst.multiprov-dupprobe-fire.r.p         |  2 ++
 .../unittest/usdt/tst.multiprov-dupprobe-fire.sh | 16 ++++++++++++++++
 test/unittest/usdt/tst.multiprovider-fire.r      |  6 ++++++
 test/unittest/usdt/tst.multiprovider-fire.r.p    |  2 ++
 test/unittest/usdt/tst.multiprovider-fire.sh     | 14 ++++++++++++++
 6 files changed, 50 insertions(+)
 create mode 100644 test/unittest/usdt/tst.multiprov-dupprobe-fire.r
 create mode 100755 test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
 create mode 100755 test/unittest/usdt/tst.multiprov-dupprobe-fire.sh
 create mode 100644 test/unittest/usdt/tst.multiprovider-fire.r
 create mode 100755 test/unittest/usdt/tst.multiprovider-fire.r.p
 create mode 100755 test/unittest/usdt/tst.multiprovider-fire.sh

diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r
new file mode 100644
index 000000000..9563f80ff
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r
@@ -0,0 +1,10 @@
+provaPID:usdt-tst-multiprov-dupprobe:main:entrya
+provaPID:usdt-tst-multiprov-dupprobe:main:entrye
+provaPID: 123 bar
+provbPID:usdt-tst-multiprov-dupprobe:main:entryb
+provbPID:usdt-tst-multiprov-dupprobe:main:entryc
+provbPID: foo 666
+provcPID:usdt-tst-multiprov-dupprobe:main:entryd
+provcPID:usdt-tst-multiprov-dupprobe:main:entrye
+provcPID: baz 456
+
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
new file mode 100755
index 000000000..bdbce0189
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
@@ -0,0 +1,2 @@
+#!/bin/sh
+sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.sh b/test/unittest/usdt/tst.multiprov-dupprobe-fire.sh
new file mode 100755
index 000000000..d72724f4a
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.sh
@@ -0,0 +1,16 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+$dtrace $dt_flags -c `pwd`/test/triggers/usdt-tst-multiprov-dupprobe -qn '
+prov*::: { printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename); }
+prova$target:::entrye { printf("%s: %d %s\n", probeprov, arg0, stringof(arg1)); }
+provb$target:::entryc { printf("%s: %s %d\n", probeprov, stringof(arg0), arg1); }
+provc$target:::entrye { printf("%s: %s %d\n", probeprov, stringof(arg0), arg1); }
+'
diff --git a/test/unittest/usdt/tst.multiprovider-fire.r b/test/unittest/usdt/tst.multiprovider-fire.r
new file mode 100644
index 000000000..ea54cdbe6
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider-fire.r
@@ -0,0 +1,6 @@
+provaPID:usdt-tst-multiprovider:main:entrya
+provbPID:usdt-tst-multiprovider:main:entryb
+provbPID:usdt-tst-multiprovider:main:entryc
+provbPID: foo 666
+provcPID:usdt-tst-multiprovider:main:entryd
+
diff --git a/test/unittest/usdt/tst.multiprovider-fire.r.p b/test/unittest/usdt/tst.multiprovider-fire.r.p
new file mode 100755
index 000000000..bdbce0189
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider-fire.r.p
@@ -0,0 +1,2 @@
+#!/bin/sh
+sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider-fire.sh b/test/unittest/usdt/tst.multiprovider-fire.sh
new file mode 100755
index 000000000..71337aa90
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider-fire.sh
@@ -0,0 +1,14 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+$dtrace $dt_flags -c `pwd`/test/triggers/usdt-tst-multiprovider -qn '
+prov*::: { printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename); }
+provb$target:::entryc { printf("%s: %s %d\n", probeprov, stringof(arg0), arg1); }
+'
-- 
2.43.5

