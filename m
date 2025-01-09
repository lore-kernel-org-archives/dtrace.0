Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65AE18F2D8
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 19:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736450064; cv=fail; b=MPeLqs6qwzBNaKNnFJd5QVfzAyAUtLZP8ZBa6RyFvPPeS9wKtv616Q6D6gsK0ctGpHUYhBY4bbyIJBz3omm2zpvnW45sf0IsimXJzWgHYFrgbfBbMEVAYUdXCPAcbTnKakBIlj5wt7XSWAyiHPO3ZcR47f4JcQ/EwNvQZHEl91s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736450064; c=relaxed/simple;
	bh=n+J1jtpiNcWcSa5fZFxbr2d4L5Z9/2cYzyEWgUw6z80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ERJc1HpaD8ARataW/6gQLBcLku4xJ4GPvSSamrpZkMKpnEfK4k9tz6oyY0aFfJMK/yKpraYk7OahpgI0U7NCiHoUhhpxb0CGdPuOltHcc6lUS66OrPak1fn7VXbGtoFKV+NP2dSht0udQ4PXgtRiJgEVuizOZ/05YJMQ9kgMIJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UBC1LOmB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QvIhjeRS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UBC1LOmB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QvIhjeRS"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GY1vs016321
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mm/uU0Zc3IaoRvcL1j
	fCKZrKhytfqJeGkFoL5y0tmVA=; b=UBC1LOmBHNuhkcxuIU8ds5SXXej9ptxoli
	jH1v4KGnRoxqKfrneY6LYLFYfPQ/8/UJDyasVxN3WRwO3nZjMpRlcfGvX49+1fnF
	/mTsB0hc5mwiwaRXnXk0r+aH9NyIkBwtpwNDWH5hgSb8Yo37Fm2JtRY4YLgVHd8u
	6n4kG95s6UIHMR1NvMu8ydqFhTztwc0PrI02CZfyCilzLAgKMquuuk+kZGmKovmr
	lCl23a11FooJO/Lw7VvH0ATQ4ktWsQya2YM2z3/8h8Fr3RsPZC3Hgm7Ht66c5W4y
	N99ihqmgFldzgA9SuZapt3szwctToGxPHONG/LvHB7sIxQSIo+NQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442b8uh3uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:14:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509HxhOJ019960
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 19:14:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuehv2bu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 19:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HV3iSFd/25PGTmORaliVQBKzjKn3A8T0J7fT59lcoApB70l2nq/4iQzFwstqSKszFoeThRkMEt1kol0bCXt2DYEwQAFXv+co/FGTX99CQf99sQJJ554/V/eLPjxaosKEyISxWSTyihfcpMVBMkbM1HcTggVBhz8Fv36DhGAhuxyd7CXKnQ/oWpsEFp+DXysm39dByxcfHsSh0fSZVM1Z9XpEbONY6vpU8irIZN/yZB0JcKX9dWQUaDqEkthnUnlsVqkwJlr+XjoQBp8dh2gT2KZ4CvYvd/Ap+Fm/9E575+/rqdsaaR0Ex/mIS92PUOPuHWmNzxD8UibDETmkiyw4WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm/uU0Zc3IaoRvcL1jfCKZrKhytfqJeGkFoL5y0tmVA=;
 b=fuv6QmY6T2xcGFM3VspprjVfp240MHtJMNhZGOYnydE9hHL/s7ikbT2jvohfUu9uUeP6Z46M73JLqgEqDRXwgpILsA9xjqHYFCxQ76d/1XlbYUemN3EYEzdAKTIXOeWFOVyGn8ZCPTmUDpmstwwRDACfakQ/EtSXuD1hNmDVpHxXlCDjF28vsvDLGUw2OzZQ8vWBE4mquu0h2j3Yfaw3KwnVeoI0GERNkGI5Ljik55/pLfdtioPL4VPpjzpz4iRmSAYVmU3X3h3rci11n6v1N6RMArOf7M6I7uKqd1dSo+efgWeX+QdcQKgAm8W3vgBBLYnCsnKeymMJnUP6mqMBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm/uU0Zc3IaoRvcL1jfCKZrKhytfqJeGkFoL5y0tmVA=;
 b=QvIhjeRSvmPl+QAVSYe4Se2/phVxgdCKPC5UvHB5EM+GAAdCIMcz8p4QvSZATpwO+YtkthETxZWWj3j77REW4q4xQFcUCkJLiRx3PRr/YRD+SygqWmhOyklXcWaEnNbCsfxH61v3tqRmmw6wJoMSAI1ZT5YCNuwmgUcNXGA8kvo=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by IA0PR10MB7349.namprd10.prod.outlook.com (2603:10b6:208:40d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 19:14:18 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 19:14:18 +0000
Date: Thu, 9 Jan 2025 14:14:15 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/6] Remove unused dpp_pc and dpp_size
Message-ID: <Z4AgB9v0b1floGXO@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220222716.18511-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|IA0PR10MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d0e98e-1672-43b9-8b73-08dd30e1d0ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lvH2eaaKNa1L/5VM9hE+/5BA/Jh3680GZCXvC0GB3rkDtfPlEbWRjzo8u+hG?=
 =?us-ascii?Q?XwftXWsdHTSZYebTmAwc43cG110MR5RlO8Ks9LYyiLiEikravn1NmMytB6GF?=
 =?us-ascii?Q?n0wsIhUdD9T5YXYKuQA2uuhVfBlqvIHF4FolN4tpKXhiPRzr8u5UbxU7Cx/H?=
 =?us-ascii?Q?LegRYKaE4DREa20n5zL/UX/qu2LSljYOIqAUeHvsgZxoOH+iHLmFBf/fPWBT?=
 =?us-ascii?Q?uSXYUOH0XXY9VcRV27ZlXLnTpu8rwMoQxuiQzavi5tU+/64h5dqjCOPw3E2X?=
 =?us-ascii?Q?uljTonpjcevfVyj4xvgFnGz8Hrhqcjwgbo6LrTrAD4dVjd8qMEdT+KX3j3x+?=
 =?us-ascii?Q?0wPsAX5qtTdcI7mWFZoz4EZdlX4hkMTUQ3XNjrQ8NFED5p6mADTuyc7w7Ue4?=
 =?us-ascii?Q?uB8NlSbugSsSRInuOtWmsUG9//rxIq+8muJQkws106POMWGtr/X17vBzmnQc?=
 =?us-ascii?Q?nXnfBadtVtHl0oaAUYcWDvdBwLmr0pjr7UEaLYzD/hAHX8KTSInWogVLqz6X?=
 =?us-ascii?Q?NdNpvh3gQny62u3O2GXZzt6tTofMcNuAjkHg8jmy1dao9zLO3rgtcNmPCmFg?=
 =?us-ascii?Q?X3MxmWMVTBGkxEE50nbdWgdxS1TA+ZSOahp+SqrqqK2jEVpK5BIApTTV36ld?=
 =?us-ascii?Q?tbl2bjPSDxIkoAjqUBQUIW9eZL/Gl+8KG/DlP0KrFqRIiKycffIiczQbfHTW?=
 =?us-ascii?Q?GYw1XehQuILYUN36iO8xTLkM9Q7pMeNO6t1i4Mnv9E3o5+b3d2nzoNKLFI8y?=
 =?us-ascii?Q?r0lteOqQgKJksG/6XnST0lpor8g7xCkeavVe1N5kwnCtRmGZcDUtFQSOJP6t?=
 =?us-ascii?Q?l4DSRSp6p3MyPz6WYV+kSbJXSdxgbxWs5xPmXxViXcQpEYAlP58bnMM7FpCz?=
 =?us-ascii?Q?bQhk3KXFDbm342y7JQuU9OQtfXoQOtmqGeNji3E1X1dvJDlwVRMwDtaOiSIn?=
 =?us-ascii?Q?WWPaHJiZm75K/X98dPN1m7Kvue050LtgQjE0XHU/z4DSA0SH3DY2e3cgDuZD?=
 =?us-ascii?Q?2qfNdpyEdnwCQxvgnw/fyjXgD+dmZrnjXsdnZNmcU8VGlYlqadDCzhPa7iPh?=
 =?us-ascii?Q?2QvEknaeYymeOeUvYBPct3NOEPXeGgup+1xZP5vULVCKBgE4CUw7kgnFkvd2?=
 =?us-ascii?Q?z/nN0okIym8UYncowSQ5LuVjjP6vZs1Son2Q6jwUB23t1du5Q2bOHf9iBhRE?=
 =?us-ascii?Q?jfduw30o7ZdYyTC9A23uAi0PZ+v/DBbbIleco7sjLZh8HPs6FY2g0oAayAto?=
 =?us-ascii?Q?LCe3edjAf+8mnX2s+A7i7vpXjrAKVCaI4Lev5VGm03R/Ezl66Whnmq3RoAIg?=
 =?us-ascii?Q?deYAJ5i8wWcsPPpNdyeRL81jfldz/KRqv4KRQRHe7+uj729TkI23lxPplI9d?=
 =?us-ascii?Q?AF0RoGesYwE9jmtbMTQ6PKsNSX/F?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bz6Xije29jKplEgz1ZEbJFlqAvloodpm2ARfgjG5HwdSzl6XbmF/WXbITsY/?=
 =?us-ascii?Q?Ku1WisVq9DLb8tMY/X2Y1Jj/V4cQgTwY+0am8DvN+ajjASniDuuKfLgrti+3?=
 =?us-ascii?Q?dOTJC0WnriyMrF8Grbg6nI7ej/xA5yqKBfY9DwJxT3P4lAlMWZbZ2rzTHF4b?=
 =?us-ascii?Q?IDXUtDkWCLxKqLec0s4NlxAESQ+kF5qNuHb37NCP0ZaMonTpB2QMJ8vC7RGk?=
 =?us-ascii?Q?vTD7qi4PaJX2NbQ73MKMsF0Q84KVBNm0ILb3rO03VdzeokxAlRTDKMtuyt42?=
 =?us-ascii?Q?XIuHJzO141COEq1VS56g3/CwN/hmuE5wFDfY0CzybK1wQucrSiFF4yEofo+v?=
 =?us-ascii?Q?vCpzVGp7wXd2lqsKI3Uqg9I91VakX27bEnKLYCRrgJtCVqm0yTHnBO94TCxx?=
 =?us-ascii?Q?gm7FmpCveko2LIX6eIu63tSOKYxFnd/GFjmuGX2wBcTaJPSJWbJUF7t8o61p?=
 =?us-ascii?Q?j7tAPX77h5oagrAv5cMOitsJ7wjaQ5QlIVlXkJC/TQnd/y1qJAQWsdCq7Q1V?=
 =?us-ascii?Q?r3EEItYMtqPOnKnJFitIoHBi7U++6y2N6ipxcBN/ZNJJkgyIjsh0pyDx8bfL?=
 =?us-ascii?Q?wprnfQsEEf8F59BonLTabMmJ/a0MnzxVG6698AB9/Rn1tQoGRkqu5g3W04G5?=
 =?us-ascii?Q?QUhxCSYEdbYkRwJ41UXrKPK5QGAhy6ShYs1T76CQUEWdbEDxvSxE+BpRq80F?=
 =?us-ascii?Q?XWaNoMUP2PmPffsZntGdmgWsChdOacdTf9UCQ1rhpDc5SYTsDgyVBra5aRDl?=
 =?us-ascii?Q?fYC9JslbMwUoPhxvnDJhFSdb4bfjeIybLxscHJmH3M0WkCwvELqzKD96zs91?=
 =?us-ascii?Q?0HaR/4t+g4U3OIKt0DVRYGVVJHcYeVoqIv2WCiUHyNzEbD8v2kCIBQmwhCFQ?=
 =?us-ascii?Q?1xUxeib7abYtlhs9aeTL7Ys05C7H2cXxKStzo5FbuqiknZsauDsa+ZXzSpVw?=
 =?us-ascii?Q?5Z0rwrkuthquIo5NjvZnnqWHwLFyVsxK+LeZjliiI1Dyz18jjltJd+O1nx26?=
 =?us-ascii?Q?LFolqbHSm6agvy1LiynheM2+SwCGLgCZlIvdeF+9+pu9zEJ3G+TYe5ZmB4Bd?=
 =?us-ascii?Q?VZpgqJ1LYCjV8k8+zGItr+/2X4Kyc+6wRPSjgJJY/r6WPigkUKy/pc4odXyx?=
 =?us-ascii?Q?0VroumByrsaKY67MZ71xRpXEmcTN3EggieEwSVkE5rFjKS1yVXSfYosmO85Z?=
 =?us-ascii?Q?aMzYRBWub11cgftZ+qnuzR7SNoEdkVHdMGeF6fk9iRZHQXNbUbtrwSrDFPDC?=
 =?us-ascii?Q?yhYN1QF+FNbdjNwxRfOyj4Kxrq/glW+7DLvagYOzkJXAPF1vat6fALEUZYTU?=
 =?us-ascii?Q?RyCE74oYp6JP0yhX535nQSaLl/iD5AIVnO4btrX3U3KIx7hUGjRtk0LGGpDX?=
 =?us-ascii?Q?sdrFHu078nyUkMpW+xrGtAD1FjJJb74dD4S0eCDkMN43N3xFMVxR9kn99Oo+?=
 =?us-ascii?Q?NBbsYMQs+vzCDZNjKoT5geIWEb76Yw0h1XnSzQihLBROaNEoywcU6r4qMPDE?=
 =?us-ascii?Q?oNG2EvVVz3TUty69xYYE7aeamDy5is+EUqsRFRGb3znJFk60PT/oeh+BPH5Y?=
 =?us-ascii?Q?JPrb31TnzGvzY/HulizUvvXK01SiSpEHG8BCLEsva3tm/9lWJ2X4gl8DAThd?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PHm1Q0l8AuKO9FVoZDE6aYLXoAm6V8Es1hS4RKDNWwHwxaPQgB9/iIKELa1JwZTglpKQlq0e9uwBAQ4uNcGW55vJbNT+kheVbh77zy8Cw70UPhWWa53K62I4gG8XOwspIatSvcDP1+jDVm3xjvU9JsbnCZyE54ctOTkknxdcl6FEZNNgPla5CnmH6iu4QDJ6t/Ly/t94Mopl550qlksK0Dt3JAraNX6/sMmkhfN2bzZbz7quFa/uSJNapiNxG3geEvvO9W0UjATKPa0iHZpMbT3dURM90OJymqMKY2Kbr2RFLQey0m7n4WaS1X6kxYDPPaRhgEvv7Qsej3rYAZkt5yhKTD9TX9MKh9dPoWakeaqJoCLaovkX8jAduCUarI+WSRahYLv51CExxFfgKYX5gCbJICGaL/j8UCO/toOMdPXF1qG/0d3bAuoCp7zAc8ly1jWbeeUd/N1OivgRYHcIfdVNIg0EmoClkOlCFGojTNA87vDRxCq7pSUAkwyjceG0nRyGylD1M0VSYI9Nb2CW3fh7i0tIvr4vENCJ7WPalFjfsrHiInmhIYvJ1nPB8omBb2mGVszmZky2RC2ZmYb4VIRaAbNG8pA0k1tapWE61Bw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d0e98e-1672-43b9-8b73-08dd30e1d0ba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:14:18.5269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzAQnOwwQrICS0Ykp8TADo/FDY3r2lqs7OFJNIwDIo6hSrtgmWyTJPEIJ8NF3P33KhD8bSgTItwO14D0W/CEwpGDYzihUnfDeMvvx5Xh8ko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7349
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_09,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090152
X-Proofpoint-ORIG-GUID: 7kr_Zh6zwwti7zTvDOX285sD9crkxVCn
X-Proofpoint-GUID: 7kr_Zh6zwwti7zTvDOX285sD9crkxVCn

On Fri, Dec 20, 2024 at 05:27:11PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_pid.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index fd94a0706..2331d1aa7 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -53,9 +53,7 @@ typedef struct dt_pid_probe {
>  	dev_t dpp_dev;
>  	ino_t dpp_inum;
>  	const char *dpp_fname;
> -	uintptr_t dpp_pc;
>  	uintptr_t dpp_vaddr;
> -	size_t dpp_size;
>  	Lmid_t dpp_lmid;
>  	uint_t dpp_nmatches;
>  	GElf_Sym dpp_last;
> -- 
> 2.43.5
> 
