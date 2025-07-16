Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2D15E5BB
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672108; cv=fail; b=j3/nKRE9LNnqOeXiEGSH0s2FX3fG7V9zxQCOkqQytXVIATmwQKuiVwKsOKxpsNBV/lPPWhzOeCPF+ca8RyalvU685XvHWZ1y/90/pfSf7qUpTK+UdO5tJxAnvTXSc7WKeT7wM1g1YIG+VXo7N5sjS2g63T7jtFtDjb1S9cFZZ20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672108; c=relaxed/simple;
	bh=EK/2hVGaaEUodtavm7Sed4+iF/3V3uZNAi8JT4v4yKw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=XnvLrs6I0nu9Ev18xin3RqH/gD2kingc0P53+I7bTlmRml2rbrLPGt6WHKKgR/xtrONOdSz+kKJPgd3/JgMcIZdQyTeMoVk2gHf19NJYTHCdoVHsCoAxZRrc7UGrn43Y9PZwTkwfteKj33ysdSP/vbrUcwTpyAdw5JWekOzVFjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CmresU6J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vzOfAt84; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CmresU6J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vzOfAt84"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7fxYB014899
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=PCY0LBQdTSwpPXwiK5
	oCIuxjGTd+Zm25KiYgEO60L3w=; b=CmresU6Jo22C5bZPra7aaQy1BZjgDdewgl
	BT7QEjpeUhfGNvWLrkSBHVdqDTky61ZcnvGb7TJ7A9oPkD5sW3h8WnSuKwcXb8mm
	7IrB5rQ4wH/qvmUJj7sy09P/csGvdk1QR4fpmQl0fCb5uiTcGGgrhbYlZYxyOANU
	SN4CjNp/1+enROrsBT9ZU3goNR/Yo0zyxrw/QEoRqlTzHSOBzsP4i8rS/kXTQbUt
	GaRgfJeJWlpoKMNSQe1ptIaD5Nzy2YIRvarGDAZFcYFsZdR33arCr/znpORABmiO
	S+Kcrgrc5DHUy79hxgreTvictTOV8IpmiAauBaDpTm7E0pAttSOw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1b0w0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:21:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GDASeT013753
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:21:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5auf8w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 13:21:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTBYP8ImJJtHKAdyLI0DQWNrbI3guRG6gizExSz/8zRBhXyV1fs1ZtFPB5ReiJMz28eAZc04RgB10oWk+JlwEnDSNUheAyoNIycyZpCw7VfMHPa/jcsEWvy8UN7DkmvOXP66ez5v4nry9t7u4oW+fLtiSxUsNc1FLK9Fuh68zmv63OR6sYSvQKFJzynKIFWaBHLyRSmvZb6J23TR+FVfAJZW6jhsS4aQ64rn16Twaj1LY7DowggnwvEgwxACtRHOBejb+uC1HOafnCMmh+NWw1wqiIhEvCbqBXTrpsU+GkHXZoTYaANGxXIAYO8mqmsLuXloUTV7pxwEXY4j6xjlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCY0LBQdTSwpPXwiK5oCIuxjGTd+Zm25KiYgEO60L3w=;
 b=BMVhmXlyEMpX2aqKpOSEb7cDj+0dg9+5JoLbIPXRRwBVr280WKX6MKIVBgt+5LK7U8AI7TZw4ZSd4ACP9/pZy2PEQSzgYPB0OhrrAMcBQhwUnij1RWtxC0XT0Q/yfm1VtGO55Gbj122B1mo3os6/3rWoVxpgdtc5SgUYuGQYtac2GPMI7O7f6yMty46MDRWwphAfjhefZ7xXLFSbqOmaOL5jc+p1AofoSPjy9/NDfw2rRBNKqzFmJe7bHDnOkkQcIdUpCBmwKkzweAzUQdkE4/O66Y1aFrqdnADTQzcLL0hU0wsuJ8gCEyWHlhv30nQ/OsCbddkNjiERwGFMaQ81eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCY0LBQdTSwpPXwiK5oCIuxjGTd+Zm25KiYgEO60L3w=;
 b=vzOfAt84nZGb0/aggkwU9q5Se8GrvNVazz7MMvAhB7Rs5H8LLrPOGxlrnWFvQOEiwd3nzaEKDwn6s+OBoFjHannybYlSNAhIOJWvQfvsHYWyzwUWJXDPZTNR+2dLZVzLmLva2Nho1/5j5JdfqCEkV+TBe8W9FIIUDzQ6T7lwoVg=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by SA1PR10MB6592.namprd10.prod.outlook.com (2603:10b6:806:2be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Wed, 16 Jul
 2025 13:21:41 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 13:21:41 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] test: Convert tick-* probes to ioctl:entry for
 tst.trunc[quant].d
References: <20250501182252.27772-1-eugene.loh@oracle.com>
	<20250501182252.27772-2-eugene.loh@oracle.com>
Emacs: if SIGINT doesn't work, try a tranquilizer.
Date: Wed, 16 Jul 2025 14:21:39 +0100
In-Reply-To: <20250501182252.27772-2-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 1 May 2025 14:22:51 -0400")
Message-ID: <87qzygmfto.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::22) To BN0PR10MB5029.namprd10.prod.outlook.com
 (2603:10b6:408:115::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|SA1PR10MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 2baa5a10-1039-42d9-a473-08ddc46bb3ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nUyGzV66XQAvebH/WovHxQyShqSGHyWVoWSXiR7lG2ri7j4wp3L+Vne0rSXC?=
 =?us-ascii?Q?66n4/w6sCApfqVu1JVRllTGK+LYiXw0Ys0uaw59tT20D1/SPDIqIZvHv0Zyi?=
 =?us-ascii?Q?vA4S6i4EBQPUk3/vj9/LslvT8IM1EA1GQ35CErJhd7lym06fMQ7tmVkSoR8e?=
 =?us-ascii?Q?NzTK7hSV7QR1r4LlV9FdZ7ZREvLkwUJ++AdrzhZxlJ6xRp99TOKfR/Naqhp0?=
 =?us-ascii?Q?+6MllCLT8vg7maAM8Jya06XHfDIwMWt1F2EqK4VWkP2ikOosJznnPEx3Ru6e?=
 =?us-ascii?Q?KUUQdaWtQ1CoypWmux43ku0rv3OxUp6nxNMrxztHCYu8tolZ8Vb9LoTrZO5I?=
 =?us-ascii?Q?KR21/3toL1DEStmbmyqfLE3mEE2aBHws1DizZDqBGRRcYv19I1KK9S0ZxAJn?=
 =?us-ascii?Q?ASuXdLv/vxijxumz9CCA9BBTosJzduq1vohJi85xb80gZ3LiktRdhz1CeQah?=
 =?us-ascii?Q?uoOybanAvrUQtaFxwnspaWNzeinIHGJLY5mBmXME3qtkEap5EVKPPyuIQmmP?=
 =?us-ascii?Q?g19KB60ut0OMX+shfehqb2WlT55hsO41XZ86cpF0woz+q93U0Hi/LG2r/at7?=
 =?us-ascii?Q?bTZlGkEqoDZehZS3r0XwQEfCol3oCM77UA6bhHNWa+Xl8HelU3GML/6f2fq9?=
 =?us-ascii?Q?hwriT+pELS22U8KRtqrPDB0/j8JNtd4u0ody6H0dijq7PZN5+sWb1ee/wH5M?=
 =?us-ascii?Q?FeR3DrxgOM9c4LyklL4j34HD5f6l3nHceH3tqpbUMtCR5LrMVc9kFAaSToCG?=
 =?us-ascii?Q?RYIgZWX9dP4T3p6bmYk0HsOx9GIeLmTGWdTbFIZozJH8rmtKWj5Iozy40OVn?=
 =?us-ascii?Q?8kVw2O68g2CWLtZegmnAe9R+/zuRglewYSORJZsAT5dovE9o76g6h1sa3KA7?=
 =?us-ascii?Q?uC9/32G4ON4PPubZr32gW2YJWwfSgJ5camJwWWMX2k3UhWV15nS1uzYZIgAG?=
 =?us-ascii?Q?iMT0SlOJazJGc0GllVKAwFnzBEqp6cP2ibje6XmvogPBAyVUFoJnFKTmbw5P?=
 =?us-ascii?Q?z7eIO4gaCgIGqXNgK6piXSTEXU7QS4TdHYsrdJ2svGJplQwjAwI/2tQMcWOn?=
 =?us-ascii?Q?ece2vjiZrH4wRc0O1EpHF/XbFxp72k1YYorRkipd1kKFBanWSujeUBEhpnD2?=
 =?us-ascii?Q?lafZHMpOjabBzbiKQ+mpQvD1AepLE7QqjkGCo3CO6lGoIfiD4MRsq1FKolyC?=
 =?us-ascii?Q?BEvrL97sh2hZsLO69pIGxIS0CMMNMCwsjLfYmPhm6JEJEignr5Fv8mCSUH7X?=
 =?us-ascii?Q?/0Gki2U5HpQIEOQHpFWOv4pcCSBXIKQO3IwOFlBVbHr1O8KdkSbIv1pVADaD?=
 =?us-ascii?Q?5INLX+Afgi34+X8XbYSNbBkQ6Ad7d2NifWsv0+p0mMHRQGki2cEgonjKQ5aB?=
 =?us-ascii?Q?C1kl8KLXuZpI2XiIlGZrrxLtgY+Ev3D1qHUHPXcXyhBvo9MWdYPRH29MilR/?=
 =?us-ascii?Q?Ma+nj58f1I4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e92XhCn2csilbh9uPr8Gz4cpEfVxz8fApEvFJRDWHqIxXwc2YA0f5PAw5bmD?=
 =?us-ascii?Q?qRTBK4IHo3Noea+onUZ+/8cICpSetRDm8tvG4DE9CKnq4AD+BpFes2HXBhtV?=
 =?us-ascii?Q?8oWAA/SOzBZrUqGJkyZ7fg5meEhjYzBRyT78ft45m8sokPsOsAv9DdS9cZdp?=
 =?us-ascii?Q?mZw3DkxOqqqKYO1LdElGDRGDtBJfE6JIvgLHueav/jY6WH/ktRltjk9CWXCZ?=
 =?us-ascii?Q?CWdViweKFs1qiuViiSuev1t9t3574Kb5k4PZ6LM1fXHXgORcRcz9yVDyPDxc?=
 =?us-ascii?Q?aCt+j4YVOUZq4XpXoWY+7iYRfnyPkQt+0t4mNlV6nRtz2Oxdp3rpPvZOmxbk?=
 =?us-ascii?Q?EwgHLzsHo4jMslAOOVhTnrkQcqXVFXekNC5i1/DcAbWk+vmP32SBgPbKcGbF?=
 =?us-ascii?Q?jMty/3ChhKxfxbzSMsvf6YEbNY8PGstRlWSWRQGAlUoZ0jPmJ9YlF5hzWcLT?=
 =?us-ascii?Q?8kWD+ZUpmDCF8IUrUSbWtz8O5D2+koMWXKwoYhlZg49+YFpMTflXwe1vngoq?=
 =?us-ascii?Q?HHmLstuKvqaESkRQ1cTsZybyPEa2iTaVhMZPjBx8m8oZAHHq3ryR5PQOIfJ5?=
 =?us-ascii?Q?FPFPS4kSAJ6WWTtBrgXIdte+JMmMPRODJpqcSzX0+zblsQUjXQrwvgtPXAbI?=
 =?us-ascii?Q?eaQyfE+RYqROr86TedTXAlF/WzaCp9TB+nCl7WjLyMi8/Z5KMS102u4x4Pzt?=
 =?us-ascii?Q?33cHDBQwL5ixePMQvanVugdF85xbys/QKsZCTD+z1ttGOP3geeolEnT7nnV4?=
 =?us-ascii?Q?Cuh0bnc8geqBJ62PcE7qZPBtkQiybPGXhpJ2QfpQsoTwcFO9t13oQHjpyxHs?=
 =?us-ascii?Q?JsRweB+NxYHQJ4g2vT8tcG67frPXoMAi1qxrWj4v/RoXCdpCWGJGFCe+91JL?=
 =?us-ascii?Q?ylqvYVA6r5eOIU1BW5TR++7QYhJVXpg9MFcWjyR3K/V32NNX8Px41YpuWmnv?=
 =?us-ascii?Q?ZAQVyfmuAKjDvWx+ZSrQDbdECRujguDcuqwutYZ+MSRooeoCc4pxB9CDAeDu?=
 =?us-ascii?Q?QPhZoSC43HxoftgUsDtz8KgHxD52ulDVJi1W9h0gvvsJMrPU7OfN9O9e4ejj?=
 =?us-ascii?Q?ZxrheUThSZYmGDxTcfHBN/GSHhy1osK3H4zCkfqOlTkITVNibrMTQqGyyj3+?=
 =?us-ascii?Q?4KwJz+QYvWRCkvlKO5puMDPiQRJqjt3VGYUgZIzLdSj6gd/KMQy0Uwzhbb+R?=
 =?us-ascii?Q?m/HioX7cRH4nwePBl5ZGOA+wq2YoFrDMDUdl/+pPi6+oS4t9Ys6DJSQoWnf8?=
 =?us-ascii?Q?wU5T3XdK6eeqmtxobf6Ua4kMiu3xQY5GaI0098ZrU+dkJraO6C1OQhqJQxmD?=
 =?us-ascii?Q?2moIS5Hb9FlwiTdyPWQJUGvkGSE27PBxQ97Sqo29hVecLopBFXNvkxknBzGX?=
 =?us-ascii?Q?8dC23XwAAZTHWnYrSou3zowUCUQx25Wu1kdnjDaKiIKJwx744ppjFTJpUtT5?=
 =?us-ascii?Q?g++iYuJ32qq0daXtwxu72Oq++wwCsw5fvGn9yMizJSFZvjv9Q/bvAHEuf/jf?=
 =?us-ascii?Q?jHo+hBHUVMkRvziv6wSDRj0xfAIQuT/dnSt4h7kzqWwQ4t+DWMLJo50eRwTN?=
 =?us-ascii?Q?vucJU+g5Fjfou/v20HWD4qNQ5t0hv83l9119bu/UK7RUiaqLxPxk5qTbcydG?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Li87gyMI5/mAUKt3HktVRlaeMezG0cnZwUNykQxA53c9Rjoixpvb7aO4YHIWWGsdOi6oO4MWCk832Htps3HTt2zQgEqkAjalTbQ1B7pboMIHsXINuijPR0Mg5bIq28V9nzN4j1uLN+4AjuifATwIx9175yJWvJYvMWaX9otzoLgMo53X3xjvWwajCtDr3YZZMhPTLJL7lT80IcHctu3hwkL5agE8lHKGc1RqeqvUFORysy2tfoPAWL3XHfZAJg86NYBB140sGeUGayqnlz992Pf1mtvkIJylymR+4Ga6bCyBcuqnUk3rGE2er7Ew6QZhEDI/rldGZ6AAXtprEqsAaxwIjOL7eXX1mdO35BVt2eSSRRTuPD9gsdKqPyFBrmToSzLadkk1wUti/nednxlyt3Ps9QAJR9D6ICMBdrsZa2kqmOJfBE0b6j4T8/5J7Lssc82y9Xa4PaATsujVuAxd+c6i7CGweDr4IOns5pnUoZdYi1X/RHLgXib7/ZIn94/H2gKnNxX247JPaq3ZBVfFwMkMq33xBB9Ni0dVdeugTtjhhqF4umuphkWY/fXwDG9+WbKQbKDO4cZfcGIfyLhgzzuFvHp3xhiWOu9qPg73Eq0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2baa5a10-1039-42d9-a473-08ddc46bb3ab
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5029.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 13:21:41.3087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTj34NmrXj8+1qz7l8GEttFYi2rx6c1szbgUF6WGaAQcrDnIFRltQ+NZ8dIPA1tUl/4aCDJFWVHDkATryxoAgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160119
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEyMCBTYWx0ZWRfX+vOKOVn6HkSS aLu6eIqXVGPpMpo2KtegAEVx+iuRbMC8+ipzs350lfcM3D2CVcGLqpNoPcQBX41B+pUKvBXQvzZ XeA8ZXawRG54dkDWp864HABUA+5ZTqg34CT3unAwaT4eB05xQKmjdrsbl1p4/0zLUM3/ryWHHpW
 jKlO4PN5hnm8ZL9bbWcnAnBg7xhFbQgTu3KUCX0QShlcHfkadde9uisP0GymTTz4NE7sW+zUk3F XqMzsE//VoA6UP6Bf1gvwfhcsy9hSq5PSJJeZt3nBj/lmQK7OxHp3mBvzINqPMvE/7eOikNmhiM qmwA/9yLEGyaTYv/7tFW4mMtVmNxGcIoGnRZcBSQUEen7FcT4cO6MJqbUmhxmIcP8QvVzhBluf6
 +9Fc8Qsgn1RlcRHFyCGkwK46KLA5vBmn6Jo04zvFFtdnzBzWpG8cquWRBB7pfohV9lxfkGb5
X-Proofpoint-GUID: uEir86LAt-kazeiX1ddmAiVmzq7YcjJh
X-Proofpoint-ORIG-GUID: uEir86LAt-kazeiX1ddmAiVmzq7YcjJh
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=6877a769 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=crGHExGRtkXSlIljkDwA:9 cc=ntf awl=host:12061

On 1 May 2025, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Historically, many tests have used tick-* probes to get multiple
> probe firings, but those probes can be unreliable, depending on
> how a kernel is configured.  Tests that required very many probe
> firings have been converted to ioctl:entry.  Tests that required
> very few have been left alone.
>
> Convert more of these tests.  They normally pass, but with erratic
> execution time and sometimes time out.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

