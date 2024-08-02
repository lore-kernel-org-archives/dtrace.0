Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC3D1C2BD
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576549; cv=fail; b=heiwRfl3jM5IrWsxFdiL5PKYy/SGP0NWGqzr6j9FFEIuv8/cuFGQQC2nsvPa7qqGWAWEZxA0e3q0MTqtF2HMd5UPTiQu/HgpuC08eb7Ygyn8Gjogn6/L5hxVmFp2zNWxKJZ/7KTmxsP8ZJb4T+/HnnZ8Ku0knPa6hYsO5mvgucs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576549; c=relaxed/simple;
	bh=q2xO5uxt2cOkFtrFYO2aM9qvQPSoVNUnsAobvShjhxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o04btP0pwJZYalVqp65ei+Ssi0qYp1/VT0RW+39RBJOm7pmkOreNDfYO5pKHnF6F54rj/BvRGO2+vPfjbP+R1yZBd2GZc0ofI/YGJmKcg24gKLjBoz948i6ubDY/ujx9cxV9iqA9/gBUPskwd4pS5HGEzeaZ7aprlz1oZJ/F138=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dPsvQWFi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LUa4DrEN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dPsvQWFi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LUa4DrEN"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723faku022088
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=ivD/6vvI5cratzP
	BK/rDrcV8rpmaPw6z/34QPJ+bF6I=; b=dPsvQWFik2EtcE1co/3q5V4kRwNooNU
	B7ICv4tp0B0Y4kkN8rKNAKBP0DAdsMQXrO/TFnWZuw+4ND0qF1Sf/HXWsSPb1inK
	NrFKfKPpPkHL+MNHIjTYfBmNtOEe+NdQQbVqykuMEJi7aHPNd171TIqpJUMb7fp8
	OrZEUzNXbr7NZzxm/XVENltbuwRmLHGT6rqa6U3bm9ZJB0G5xTrDiS+hnj/YwN2T
	mRnL/yR6U3L5lvs91O3k+4j21Eiql8yhM+X8NO+lIO+SvKSAMig/hUw+xhWA3M31
	x90RLXuDfBZoA9jD+mRqpKzzuVbLqz3v2SkqYtZ8DmlexpQWyIoKmVw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjg5ge0x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:29:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4723F1YT029018
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:29:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmptx7c2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2kGlLxg/PxFEzplXD88poKMnKvYvbZ1UGH4yNGG2J7FIv9JCK5Tv3SkS0w5vB/lN/L4op8iA0khaVBRR+ey3CpZm9+LbpRPN5uXUTDgeProIQ7eKxZ0UzntRdVBsez3eqDB/qelrolIP/WmKMl9WxElIi9BTePPKFWhveYaqG4qKYykJuffGlD/wZ4pA0lmFbQEIwHessEd+MbsMFSogN7x9gFdT3YqMEthmcWpyy7CPevZpZTw/MEJS4ioUw144FA5LiPCeI++/EiX0PJs9izGMwemFYEdyhvgsK4rsGhtc8674wkqRpAy5Y/13DMcyZi62izZ41VoeUGp/tDNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivD/6vvI5cratzPBK/rDrcV8rpmaPw6z/34QPJ+bF6I=;
 b=wQzBnL8d3Oxtnr6gBH4dExPIlzE4wHg0MCcQ8B+gpvXmkvjatZ+vPvQi46Cat2nPCXY5lVzrIf0mrw7kKDdjltUxTdzZTH0ca5mr5S7MebZzPiHMffGCRGIOcx4R2lb4OiocnCr3DGRZqazrngMbF9kZZzNkaSDRcIG77MEm9S3rsjEVm+aCHUOrDsaX0jyL6tVq30vZIzJwKMfWxhOSfv+D1Ks8KZ5TvJ3rwA6mBNb3Ztg/8JABlK7FVtlZe340aYrFPVeqClkQsRe0ciEj92GxT+THEuGjkMvMd/M63nMqFbmAfN7+tnAeJ55WB/49hSuQBKRXKJZj8KpiNQS7Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivD/6vvI5cratzPBK/rDrcV8rpmaPw6z/34QPJ+bF6I=;
 b=LUa4DrENyQrqzw7ZhmslyYRQVSyLHLZ8Px2NNXygg8JKw1+N/hlD64gHrY9fo+FL/6zVqHmMbPEizYtg8+Q5VVXLSJHadDUczMS8/+dlrgUj59GeF/oQcC+Nnv36PmeoWTwqj7+Cf4rYJu6/hqsLCUuGZFUMzvTxVGdL0q7SW4s=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN6PR10MB7421.namprd10.prod.outlook.com (2603:10b6:208:46e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 05:29:01 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:29:01 +0000
Date: Fri, 2 Aug 2024 01:28:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 4/9] build: --bindir is supposed to be equivalent to
 --sbindir
Message-ID: <ZqxumvlV/zwcA61+@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-5-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-5-nick.alcock@oracle.com>
X-ClientProxiedBy: BY3PR10CA0011.namprd10.prod.outlook.com
 (2603:10b6:a03:255::16) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: fa114ea8-f5ae-4f97-573f-08dcb2b403df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6wCFIX/6Z5UC3JXDtQo5FCcKiLti5JT2r6kUHo8gJcQmlbpO8F8NwgI53QNY?=
 =?us-ascii?Q?7y+byz3f+sGIVEicqvRxNr0zHV6okGpEt0k70e7I8uqguUlYzvV9J5ESG4hn?=
 =?us-ascii?Q?H5CQTy7EDXH+MSZ2gj9kIDCUWwjuUT4fOz9/EQJ1eokoXpacJhv5NEYePI7Z?=
 =?us-ascii?Q?SuYsPMiRbLr48iTIrNZ/BeYvlJEbKjGWNgfAgcuOHe2W1o0iLOGg69WWljKe?=
 =?us-ascii?Q?XldnGuduxCYdndsPhF3AjOyKtGu9SB9kmJTwuX02JHAwEivrPemY94CtQVZ8?=
 =?us-ascii?Q?IgdVmdwQOHQwculcwj95KAwf1HJkPy9fegEIbXMrp986VDx8Pl0qrpUFJjUt?=
 =?us-ascii?Q?vKitz2Yuuo2VL/S6sK3KniKJviQCoGTp+BSAJkiIUJjwmpfxxM1DWoa2wye2?=
 =?us-ascii?Q?EtIMpb1/FGYYQsPPSLGI9j6vA1WDeHhJAlK2TKW5f9fxd3clJiDcWoElq/bo?=
 =?us-ascii?Q?rwaIhm9OE7vL9bShOKlSP8wPWtPps6AVnOtCXY6lZbI7dgJEbc5SpCs2st/z?=
 =?us-ascii?Q?hVGCPwqLECxsoTRj63YDbVtGK5vL+jhOr3NfSZCMUFUF3xdsWaojCQar4rmn?=
 =?us-ascii?Q?yjaO7GoGlD02TO4SgsnLCNjSWDhPiR63Nohp7TcA+LR7rSIxFOwdQuOEzpnc?=
 =?us-ascii?Q?o0WSaPUwH6O5/UjRgwUDPI7G0/8ZoKM/v0+STzAIwhM+SZbGzegOsW25g8yK?=
 =?us-ascii?Q?4imQ1DZfyX63RMLMua69WX0xUUo1HfidQv+qUL+2aNwolpLf2U9AsMpuSgdA?=
 =?us-ascii?Q?5jyvfYpvE9IJQRsZsw1crfMVuArbdAIsHpECdEG0vcK3c/U3HhkI5EJy4hKJ?=
 =?us-ascii?Q?7ZTBoODpa2TwbxS1rlvxc7f77f0lNzgsXHw8huiIA56Ews+v4rfeMn/t/1LL?=
 =?us-ascii?Q?7U+bv/MCBOHGtHOE48AIsYT32nffAqPxu5wOFmf+gBHI/3jTBmy4cyxvRhbf?=
 =?us-ascii?Q?hHMhIvEhlkM6nSF0TXr1EWQ4evcCoOiuUV0NjjuVv4OFRUnJL46/97MHYeI3?=
 =?us-ascii?Q?PKpjAFUlb7gQExicz1dplJjabhY8g/H3wILnfzZnumjEtlCFAeVp41lJ+rRm?=
 =?us-ascii?Q?qqvshyCAjLsdHkUBj6O/e9bHjGuhbVsu5AXC/IigY1iEvz7K6ZhVRAd7UuF8?=
 =?us-ascii?Q?nwl1cG6IRLySA/oY2cVAclOHDWu0kOC52pN4AYzUweSHnxOej4+tq8gskbK4?=
 =?us-ascii?Q?1NnBq1oFZ8Tkk9U5/FFiBh87al9OjUtIDcOmeF/yDoRQPcGRmE2/SnwlBjMP?=
 =?us-ascii?Q?2DduL8txdPoTfT1oxrWhxBFAwjkts5BQeFif9N63WTsv8k6ZqwRm7fUByAms?=
 =?us-ascii?Q?0HC3cjD2mEV2dgpAkOamsv6Cyhj98hIm8jEy0IktWapisg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CrnT96m/I0koCMYNFfaTNKT9nmupbeA67ntG/YzlSxHhQyvKeNM1LlpKSU/V?=
 =?us-ascii?Q?ktoA97714nM9C3G4bGwRgrc7GJs2ZDcDMEFDzhdcdFoqqHu3t8E4eAsmI2Ad?=
 =?us-ascii?Q?G0AzxYKSYpnMF7lqRX5N2VybRqcuYSkS6min11jNZPBaLzcan94t2pHbZKBj?=
 =?us-ascii?Q?EELmlOOtof6FCflfQFR7NZ1MlgKGPybElawzKTKmk9taLde7JWuXLtAwTRGb?=
 =?us-ascii?Q?QWKJeBPttf8ekE/Lbbxc1X++Ap1MEvw2AJ6ViCw6UgqZd0tQe6PGA/SC8p9K?=
 =?us-ascii?Q?zcxHVN0n/RT0ac0FghrzQXOnOnGGXMP83tUzf+0qA978tJLU/Qp2bXEr7v0Q?=
 =?us-ascii?Q?KktzQBWWVpF3boRXVRTygG9ugsVVciHB11Q8PlUJwkQPJZXyeimuiUCjsiSQ?=
 =?us-ascii?Q?sWCafteNb5WlGgPXefooz28faQIVH0AW6Z/CMJCQBnSgpF6PpsB9v0pc7sHq?=
 =?us-ascii?Q?/XX1JypKFlQRDVi5kfQ4guWoGEpL0hZpz2CJ7RgHfrgLVHu7RNGWZxKaB8tY?=
 =?us-ascii?Q?/4g4aMeYTAQC0h7QslvsM9pXi/AbFm9xodS+dnBLIxyoNq5I813saqWT8gnl?=
 =?us-ascii?Q?w+mPI/jNflYrVy4UkZgLroJZtAJlg+/o2qlRtwXCZ7BfIKUW1AxccGpO9F8f?=
 =?us-ascii?Q?kZy2soJ7+OnNNgcGsv0i8Cokcy2pSu98PhI9ARHVWeiI/9XUNJRS3nHrrVfR?=
 =?us-ascii?Q?Encymki9OSsbwEYr4mrFOeq7Bf15WXRORNaDDh4TiY9NHhfR4Imy1T/VkD8O?=
 =?us-ascii?Q?y65oaiTND2G0y7Ichcb6Vgbcafv+YJ01LW13G5Pb9k7rQ9yztOj5ybsEZDAN?=
 =?us-ascii?Q?JlX/lWcmVA0BX71+5+o0JmVZLPMOlXlHS9Lt9U7Em6Y3fiu9lvz8tynfuj1A?=
 =?us-ascii?Q?X0ODtrvHE5x0SIbQrr3hUXNJ+NRUJVG0+4u17jN4oVxj8iEvoAFjg/B/NArx?=
 =?us-ascii?Q?S1u6DbVzlpN1QrbAFiNWy7UUFHPhZCYKs9GDQEOubYiM28SJdcwJ7H1eom1L?=
 =?us-ascii?Q?ZbY5EBxD1NebEeL6ZEXsNSWVXFcKFscaz50/VweuJVojsRUkxkij9oNvZFmo?=
 =?us-ascii?Q?6vW8cL6i44PIM3WMEDHpOz6OfB+iiUa8mqYD6VbRf4XzbkLpehj6DOGQvTyp?=
 =?us-ascii?Q?WNxf5YLgGzvMdvsWAqoy9AU92FAmzr0WXLZN1FGPPi85pXt+3lZ5jX5rdF0y?=
 =?us-ascii?Q?FqT43nn0DnvpKf5jMYoQEDZYVdc33uxHl87IFGr2TV6FIKtLlVbQmjANLYPx?=
 =?us-ascii?Q?Jo4gKb3HPPJETnK90AxCFs3iBh13zC4Q4KC7Iv7ltrBI3uh7NHfYMzMFIiLj?=
 =?us-ascii?Q?kdPoP6bAAczNHDOaUW4dMZNxrWNfCRpZzWCx6QMYOOTooRh1P3ugjdP1Nw0u?=
 =?us-ascii?Q?+mU+DGZ9NYPScneiOptHllVydDzgwYm8Vl+O4XaHcEHprUaPNgTdU23ez2NM?=
 =?us-ascii?Q?60lWDgZhpKtNDURU1Fizyql5N8gy7SJ4Ktl6CSYuMMcpW/WOzqSRDw5mqv1l?=
 =?us-ascii?Q?vmrnz41FS8lfr03em/1fVx42zJio1A0mB224dGCKmUKTYkB+4JWPTgpqVByr?=
 =?us-ascii?Q?jDBL6nMevO9G3rZHOS3PFw6gHUdMnWHhWylL+qEUOB36E0ZQmWl/FZbBb2T9?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/lfN9av+H89wR+4k+xenkEVTvzz5XBEBHB5+mukk5to6zikwYQN/X4MnOsmqNuIqEChoBEGo9yazLo/4xGXBo9hMsH9XzXBIMNjuib4TR0hOp/20Mvm9FTZTbnGHHMI9hYBIAzEvI4qWXqbfya+iK9L9rcNwnt1Ne7aR2ObQQzfL7gl5mnakL8arHJXBPPPLsx1kXPfNfYo4hyifKq2YdDTGyyEON/bSdk415V8B6nV5eG4hmfPdbHDYU90JH5DLxVTu+lU1Q5U4hL2HW//hvfF0MgNORtTfSa+SEZHdK45bajLNWR4Crs4c3hNHYPWa5ViL5itCfIEF8MRzSlsE0cI9CH0DuT8m/+hH71MQycFuSBaZVBrsKkH0MYnjNhuRY1dEv09xLdvextWX6i0Tgy6iikH6JMxjN/m/wp0KWXdhoA2DevJgkCYh7VwDEMf2Dgjs4nZR2gvCBlK5e0dLWStOvWr0ittfxf2rkGb5abMg31j66TbifvWgrVdyZsNiF+0iWtl23mWPV8orL5hej+tEe4BQIAG6QgUP7oFWHvXy3YEbAsG0kr3sQqL8BYO6ajCQIhKEJ89vgJq89ZYwkeZvuVAQcI99NUbPrOhiwGs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa114ea8-f5ae-4f97-573f-08dcb2b403df
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:29:01.0225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQh6MwfVKsEVuu296VzDMXVw5NkAHQiMWQEblmTGncIuQgLNUQE/QecF077AVIwQtRA6w1WQfquS76mRtogpSg5DcreYDSbMdHgpZjwZMtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020036
X-Proofpoint-ORIG-GUID: yA9vPwUaHVKSI1rjUP4vKw3iZM_c12eE
X-Proofpoint-GUID: yA9vPwUaHVKSI1rjUP4vKw3iZM_c12eE

On Thu, Aug 01, 2024 at 02:21:51PM +0100, Nick Alcock wrote:
> The configure script said as much, but actually it set a
> BINDIR variable that was never used for anything.
> 
> Fix this.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  GNUmakefile | 2 --
>  configure   | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/GNUmakefile b/GNUmakefile
> index 0fc9b3b5e85c..5903a8e355f6 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -82,8 +82,6 @@ prefix ?= /usr
>  export objdir := $(abspath build)
>  LIBDIR = $(prefix)/lib$(BITNESS)
>  INSTLIBDIR = $(DESTDIR)$(LIBDIR)
> -BINDIR = $(prefix)/bin
> -INSTBINDIR = $(DESTDIR)$(BINDIR)
>  INCLUDEDIR = $(prefix)/include
>  INSTINCLUDEDIR = $(DESTDIR)$(INCLUDEDIR)
>  SDTINCLUDEDIR = $(LIBDIR)/dtrace/include
> diff --git a/configure b/configure
> index fb9a45cda1b7..4026a3eafcd3 100755
> --- a/configure
> +++ b/configure
> @@ -125,7 +125,7 @@ for option in "$@"; do
>  	--prefix=*) write_make_var prefix "$option";;
>          --objdir=*) write_make_var objdir "$option";;
>          --libdir=*) write_make_var LIBDIR "$option";;
> -        --bindir=*) write_make_var BINDIR "$option";;
> +        --bindir=*) write_make_var SBINDIR "$option";;
>          --sbindir=*) write_make_var SBINDIR "$option";;
>          --includedir=*) write_make_var INCLUDEDIR "$option";;
>          --udevdir=*) write_make_var UDEVDIR "$option";;
> -- 
> 2.46.0.277.ge12b8151ed
