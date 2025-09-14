Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0605221F1F
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 12:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757852899; cv=fail; b=dX26jqaa3N8FoeL15cX00CHm4AaFm7Q6AQNigPowPj7VhfyuQZlODi6doKy4HnfKclaZCbPOF1Nq3XYvFl3Kje6CY9GxaIJj+3Owv6J3yK47sFNmhKQkpFl9XHWias/e2JSY8BTRlyLMNNT/h+rhkVSDTx0TB5LGW+bOIeg06tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757852899; c=relaxed/simple;
	bh=HftVGRDETYRMuB6omDHyxrjr6AGJ4jv/iEDXzlhYmB0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Ad1GUUmWQeMIKV8nPUiz/RwyeVm10pfGb/wWiWY/K6xK7A2SGzqatXDt5M3CkQ7HRU+VDGv1gQkl6OFE7OhOotLH30ak8aUvCx+Dsp+xeAMjMajZ5MqnGpgcD12TXf2JvpS6QwrX2uc3xBY9ZGJM0UI/KWkxQCT36SyFzwxduts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GcG0Vl5d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v366BlFJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GcG0Vl5d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v366BlFJ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E4Arg1007002
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 12:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3cxcMQ/2yPWuhW3hbL
	FSO50iLx1a/wcOGpNWbH6USss=; b=GcG0Vl5dZbA09IVRUaI1bR9V9l03CK4N0L
	GM7dTHCjXHSZB/MHbzeZ+yrS9K/fEnm0SCHQJjRR90gEQHPE1B/jEuB30GcAvXkV
	zMOjAO10aYjGfLkRZQoKvnVsQxTGqpPtsaaCernrSlKReri/hULvh/MSBbGhb+U3
	UEfJ3MSuoEdcIAVdxUjXMwieFql2qlacQoFIOeN/iwPdXw0xXT98cgWWEtBUEtG3
	NpgTPm0ad4qgI26OXfeV60rk4jPHQ5oI497lwV1L7SA+saEigo8eXCKnKtU0sbKJ
	jqWXKxe7Rs4n07ZYP8K5NAuFI3rXgBm7EBJ4MwdigQiHyp21l+Iw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49507w0y6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 12:28:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58E8f0Z7011188
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 12:28:14 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2a3ck7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 12:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqI0cDvwXX8TZAG7xGB5uSm7HaID1mAcg5ONoVrANfF+qtC5xISAvxxHCrx4l1/8loTRKii52SkCp8B1Tv0O0Jcv0uSjukaTgTXa0yN1VkvdUrOOIoaIb5TVfKCE857iV22bkwtPhbeA7giNGOXx1a6sv7UMfLRf27eQXx6sXCI6KOPKOhyfCEhUZA3Xcxjp0w0N8Uc+O1QWGEQs/c/hd3iXN9lWTvXKoboH85LT6WCCcVR4674sf0wO9zbGdF/73YyVPHsN73mkBF148eOiUSoAmtdWzM8jPORPIK1776rG3hWvWlYI336McL8TL6vaXN/SgZFc+upC2d7ZYd5HLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cxcMQ/2yPWuhW3hbLFSO50iLx1a/wcOGpNWbH6USss=;
 b=tX5cv3WnrqgQrgm3DS757h3d870fy0O3aYZUs1n6HQmyoj5md++qkzqJ+EHOPkuHWxbYPyTUdFHMHZqV3b8cOqwXjh3LvTc6gyop1lyfe009jF7AcPFcXzZIyJBXDxkF0vvkqOo3kdMqAMC4jGCQgD0HyCqnCdLhQEHOoQvD364Bh9b8wDehSsZLe9788vfjX2UuGbQx9KrK2NMebOcUj1GJFsY3gKnpdE6ec+XehCKwrgtr+3E3qXpVXNgD1PG7QtKOC6QeLRT1apgymYy4iPWYQHVcgJGOQI9opn1grGJ8w3+B5icBgZNQGodtzKMFh2bvkqXrU/C5VzbrjN8w1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cxcMQ/2yPWuhW3hbLFSO50iLx1a/wcOGpNWbH6USss=;
 b=v366BlFJtCAKz0/p8WYT0bollnx4umH1sKFoNxZJMOLjaZzDYc0HR95SYUaS+wALX9hCdwlfDzYR6AmoqOmTlKqlteLnGfd1OUR60foaSaswxj7M3S61J/poviMk5jqbeJYNJnRvgQiy1V7KeZa1WLT2pi6bD3ojc1/euXj/QZc=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CH0PR10MB4907.namprd10.prod.outlook.com
 (2603:10b6:610:db::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Sun, 14 Sep
 2025 12:27:40 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9094.021; Sun, 14 Sep 2025
 12:27:39 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Elena Zannoni <elena.zannoni@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [PATCH 1/1] Make sure the doc dir is cleaned up on RPM uninstall
References: <20250912215706.1109973-1-elena.zannoni@oracle.com>
	<20250912215706.1109973-2-elena.zannoni@oracle.com>
Emacs: freely redistributable; void where prohibited by law.
Date: Sun, 14 Sep 2025 13:27:37 +0100
In-Reply-To: <20250912215706.1109973-2-elena.zannoni@oracle.com> (Elena
	Zannoni's message of "Fri, 12 Sep 2025 15:56:58 -0600")
Message-ID: <87segpw75y.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0496.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::15) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CH0PR10MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 99862570-d90e-49a2-562b-08ddf38a1858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?13EK/1tyHWEWx0JotvrfbPHwhSAdTa5jDO2YSotMF9TRshCTGo0qbF/PhLFK?=
 =?us-ascii?Q?810PsRYCaKMoRQegWvAwV6eUPAZsQcX2yekSRUCuJrnFRmwfRPG7S7qf4BFh?=
 =?us-ascii?Q?9oAroAVgp2t2lieI0ZEEk5wMCKJuLYydRxu2fhdlqRzkDdtFJywDsCzaM1n5?=
 =?us-ascii?Q?dbEJ47Ow4Q4jkUn5XnxtKnNqD1TFzDkh17y7AZslgnpT/QzU+MBGdA9vj+Y4?=
 =?us-ascii?Q?kwmKJZRCQ+5Z1XvGpmkgsG3JKonuxOfjz9jK1ihKkRONu1L9DSugsKGzQ9PR?=
 =?us-ascii?Q?6E/oHXILLdfZ9D0XXcCp5flKF/ihfJ6iXtAEzb53ZFTLOf68OZ9xk4t7Oz7W?=
 =?us-ascii?Q?VksB5qnpxbpgWkpGdSH5jGznIU/xkVfvVGUekvkLgQXUD6av1kbUxqBKhJDN?=
 =?us-ascii?Q?x0Kp8jF9rRaaSJK3Qu2v/mfyEDqjD32cenAuyWCDV216aJAogZ0FBq84bpBh?=
 =?us-ascii?Q?9vM5m9gXAFD80pvlyLY1akb9wAUs81bP/YuIHmZKXwaTNL6pr3BEQx9QogQ3?=
 =?us-ascii?Q?ujkZSNUEIiEG0BB1gPwAS+RNuiGb7BMudkK8pz1LRvUaPXpZ/lu5hJdnxKLG?=
 =?us-ascii?Q?ItQow4fiLxFpdFbxXcScWUCQD8Vx/6U7lxeTuL5R2SNq54nYCtOjfSTLr0UY?=
 =?us-ascii?Q?IMNW5H5XK8Qcoix+d2kG73GULmZx2DaD48BoX7yhSROFY9hGzCJrfey2RYWJ?=
 =?us-ascii?Q?2GLkY8AGD6MbjT33vth/5VjZoh2encvaEC9IgNJWI6gmh5O7JqPtflBc5sNw?=
 =?us-ascii?Q?7rWv6I+lorKooNdIo6XuxG4kaHfsK6qyjVxD4cuByWPesdE9421oREvlB8sa?=
 =?us-ascii?Q?hetiXk/zlyG2HzIR83nCbcKF4LY38IPQsHRi3JRPQQg1Q4DJRVVW4YOsO+sp?=
 =?us-ascii?Q?H1QoufADdl5irhQAG9K6J2m/IC+Q03JEC/OlPxvagyoZXvtDzEQIDYkyJpfR?=
 =?us-ascii?Q?OaYGvezexPgZ+9jMTdhzzLveIVtcB+6P0n/B36AK71xYdmQJaMLPFSY+uftu?=
 =?us-ascii?Q?X4+17CA8/GWItnN4IomzkbMPf5oC0e5hY922f6Ub2gWo+WG4+9qCHFO7ae0x?=
 =?us-ascii?Q?uYyeYvT0ZGAX8F47Qgt/hTNG6sfPtg+y84JaN0JsFaQMHoGsFEGsnZL+GaxF?=
 =?us-ascii?Q?sVq6WMViqqlydNDjJYBmWTGu17f3TVFwk09khOgqVCQDJqKwRE60ASF4fJJZ?=
 =?us-ascii?Q?tubGkPMzjpaS1tF6GpkZe/BjJxdyekBbhObf2JtxYdDMEHUheDQ2GH+/qK8A?=
 =?us-ascii?Q?BnSWK+ispQMxS+wOa6hhiHZffhpPDght3mBltog8MGXhl0gkEzOCFtth+aYM?=
 =?us-ascii?Q?S+dA0/ZUITJXyt++nU4oU+IM62erNtoERbVSEjXzTPNtMd5IqeSiDwt7rmEr?=
 =?us-ascii?Q?U5Jrh7t7Lulqy+YmQUyOtmVMicUWIeryZFdYXno9ll3G2iV2KNfoDSgIWFCL?=
 =?us-ascii?Q?UD0ZyO9b314=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nQL+fusTdJmDZIUh2gxkdSeag/lBKdY48ZbY8HwSxGSSBXk6xDspcR3PdUcP?=
 =?us-ascii?Q?qW0QRXnqdw4nt2D+gCiIBbfvIbBGpEd4NKsQIFmXqhZnMYOvz/JCUmQA+9qa?=
 =?us-ascii?Q?5V1xeX6A2Zp2mAyPJkqry2SSnfF6b0RH9h1HgjQxir2UY6/hUefzTvh7DYLZ?=
 =?us-ascii?Q?4xoxfooxbLy0Dl/MeIJrsXRAXJKSzrrbhgSqeuYZZBQDep+f+MaFyjaKtl2+?=
 =?us-ascii?Q?zhD7YetphBAVnRQoGeLpj2/jChZfoog35VY5Upzds1h9ceNtLLTcgueZ4C28?=
 =?us-ascii?Q?nVu55i3l/U0ycxIXpMm8rSiWRu4PwIcD+/fPau2zt564gziH6r/UZnSxu8+g?=
 =?us-ascii?Q?0G73yOXiEyPIASv5DblCY4kPE49esVmU6dottP/b5rfA89GKLNIG5rtOm3JH?=
 =?us-ascii?Q?ZInaA/YbfKofLuJl1EqHjA6JLQ4VxXlrmeaKOOLkmSmYjaAcRyu+4IIeJfmF?=
 =?us-ascii?Q?FaURO60GbhTawHQgQnLCqUVZLCt9uHPWk3/BMfwPjXBdSC32LRw4j/Iahntw?=
 =?us-ascii?Q?jcY6C2onc6nf8MJF6FBQ/xnLd0dYrsgTDJq8vB+ptNh1Pqtr5lOWo8bUMuYg?=
 =?us-ascii?Q?AXB9ATxLjwWg7ZpzjV58psspftIj8OOiaUlLgdyczNXOj2hHbnMq8ys2CoI5?=
 =?us-ascii?Q?sVNNpZByl7QqGSrWPC6QqnUQmdABgCQNyVBMULR8ufuguyIHUWzBkUnevXtM?=
 =?us-ascii?Q?fLxj1c3dbKE/qZIZIrLhGQDzO7wVtfNZW5L0E8gsbGbqn2PxfmzGsVCvkjU0?=
 =?us-ascii?Q?8ij+Kss6Hbb4/5lxkk6WuiCgwTWStY5S1zNstO87yOy7LoSaGvEkKEtaWUU8?=
 =?us-ascii?Q?SPmm2EGQwis0ptO5PFPGEjhoaq/iVLHvah/87KGNq0tlpfq0I876GjTdsGAb?=
 =?us-ascii?Q?p65M/aWhv98jYZ//nSjLFTTlG5Ed7XMtqwI4TSuegoOiNq+JqRBlCp4e5Xzj?=
 =?us-ascii?Q?E4tFx6oMOJdQ6JbKdZwm9nQQLav0mQtDqpZv7Qhpku6lL7Ibehwo6TDJ3YC+?=
 =?us-ascii?Q?F0rfS6bL0ERDO/uWq3GpmTP08Ru3Hq+ChyKzO2Dg73+VasDHzm0v8v8AZxIk?=
 =?us-ascii?Q?CoboyjPhw5ZCC24d8I1wyji0PhD3hXDw+53m9oY2xp71t8XKth6ngXsdjvtt?=
 =?us-ascii?Q?UXjaD1aHsC0UDgM9uVwK/9yi8h1KnOH0ca3uZEVLL9uSZtWkDL0zq652tCNN?=
 =?us-ascii?Q?0DAUEDu63KYAHgrFujOQbLOQRhZXx2QAP76o1w9dl+jFqsjCLfMIIYQYCetM?=
 =?us-ascii?Q?HXuepIyHc6c1xw8tRNzNxCyswlaMl4MYrt7tPbd9g9YNc/g9LUtLyfOhCrVO?=
 =?us-ascii?Q?gr6ZGO49wWBBPBMMsTK5296KXwtuh8XY9mGghKDyS4ubpp1gyb6ybOBe6dNd?=
 =?us-ascii?Q?VO9y5jTuGyJTBJp2feY3ENHVg36wjhKkUyW5HaEdtXaG74msgG2L57sJeG4V?=
 =?us-ascii?Q?lVfer7o78QtQeejfQs7ErVBd3uv3QM9AW1xvS0etvbauK3gabPAEGDIMlFHc?=
 =?us-ascii?Q?HkKp46z4P4vBmLb3pkV+OfsDuSR0uXIDBNoccGcyOpMAMN6x5NBqLqHiilBK?=
 =?us-ascii?Q?FhlHavB9qQDlRsF74QO1+Cg6AeopwN+2NRP8td5P5CcS4UHcNG5s5Z4uRxTM?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G+ChG+0MN8yZFq8GNW6ae42nk5oicXfev1Ks4GSZJBtahNdrhdWosd9yDVnwDhcoAMCY5IFsX353vV0VuKmKqWj3XNhL9Yk4vI9IT43DkuyMxOV3BeWwZiPmOIXuA02SvaysKn0BaLaZMKmgAU8HcQhy2PA2OwbRGtoAm/iasTQl7FqMcQHW7ZDaaoLkWZoUPZPobQl8EJ6w4rLZXGHqjOGlfkTxIsHyWyzAOktC3Yuew/KOTT9E+9wkRlv+bQ4l9dmnfNEuUORQhNE8BCIIQl35eoe9tgpT3eBONhyOOLFI5tYN+jV36thrVOynlcZjFk20WEbbA2hY4iywrEnqE1BqokBDSLU2J02lfnl7nN67WGfiwyxdMGDlHC1z72ABx7W8GbINwBOWyF5iRnp/ZE6LNVOjzb++DqqFqubQc/cKBQf08UHz+ZzsyGC8Wcu5ZCpiW/vzQPSadaXj0bLGHf0QvPYbAPaGgCx0po40+Sr1yPsUIIL0pn6NymkVgzFV6eiw46p8pdTPZZ91STBecLKEcLbVmOmTuS9fLongwDHduzuwq3lyat/MKIED4XPqwgffahDx8Q6iPjLdU9x6H70cYXfmiUn1V1XQFebxZAc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99862570-d90e-49a2-562b-08ddf38a1858
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 12:27:39.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+5MY4rg0F/SVme3QYDuAsKp7o7O/ztl29Kv8IrhE/5R7TucQ8psWjcZkaJjhJUt7B+bZ89LirycoKeQswsQgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4907
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509140119
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyNSBTYWx0ZWRfX4qNPhYeQMHS8
 PLdF1ANv38TuqS12n/27WEz6iBUj17HlJmZ/369j77VjHLKhbNmFiLb+4P12boKy+5N11vecHeJ
 WvyvZWo6J+F6jtK4RNfDoM5FhUwzetzlw8CAXT1peAPc4qeZuo2FNCZvNbn+9GPg2945TsnLHoC
 1SebvC6Qh0Km9oCZHz+PSZqTqwnSjAXbMjGQm09JVemejfat5SdT+bQuiq/OPVN8GEM3ouV5vdQ
 Vvk+/t7BZaf7TpGNGDpb7S7N3fB6uNbfkCNMnRt17t82zMSh1jGf50kKCrfN5QxEemxB9iQGfbc
 Ej4Gf6OU4PPJFtoIlNyjdzodR2X+vfoX/s3FhHtIMaOfv2bIDOcjsVL55b36D8nmXJZDTv/2f0G
 dYYq4E7B
X-Proofpoint-ORIG-GUID: R3_mvzmFt74Dmj0QhJVVvU09mETXSE_G
X-Authority-Analysis: v=2.4 cv=RtPFLDmK c=1 sm=1 tr=0 ts=68c6b4df b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ySVvPE2-pqDjmadjQTEA:9 a=1c0tI19lo3UA:10
X-Proofpoint-GUID: R3_mvzmFt74Dmj0QhJVVvU09mETXSE_G

On 12 Sep 2025, Elena Zannoni told this:

>  Add to the RPM file list the entire dtrace doc directory,
>  not just its contents
>
> Signed-off-by: Elena Zannoni <elena.zannoni@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
