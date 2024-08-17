Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D3C1361
	for <dtrace@lists.linux.dev>; Sat, 17 Aug 2024 00:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723854529; cv=fail; b=aFPPpvD7jSBQY3yy7ibQaFiyDuk+8cyrAZuTqbUcg5LuYiXpPim7HrWAzwjiZuZzEYCphu6NoeCSPWbCYZarpzJ67NiHqq5VjdUE1BLNRVtvqwNDkXREzZsEuuDHtUItUiYIcyDaQF64eg66aDIIZNpSrA2Ck4U4kTIAjZK/eSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723854529; c=relaxed/simple;
	bh=DUdbeA9e8Ib4sWo3TsRiczUDwnfQLUD3eRlJRU/AQY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YlwqSDX8t+/SIHmRvg55dcAxc8zKxYMc+q46hKZBsz7tDbRYBjOSSCP1SJHhz1bwGVQNhgNROmxCFtjvjUthncuEWEe+B6AiDf+oQJ9GJhgOhqiDNpGkHo+erJyGo3bFWZNHEz5C1q34W3LdnpDYYgr4RcVfcBaRmpkdF6aP5Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IKqDjKCN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VOVbJisD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IKqDjKCN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VOVbJisD"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GLBv4g031724
	for <dtrace@lists.linux.dev>; Sat, 17 Aug 2024 00:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=zqdiNF2OdO3yjnv
	MCSprrQStXywnbsCGxYG6fWgTeRo=; b=IKqDjKCN6PwQUMkvtLfq5XHyPiJknW3
	tlACB90xGuycgjXSQccCW5AJv9mOPeVl6cWYQ5NCryxlVSrn/88PUMDOemyKmoCB
	tysyTMevMvaNYr5Wr9IXvJ8uw8t9U1FBdPJZVG7hh7ojQY4W7b9VgszB9n6o1olY
	D3XoZ9M/aEDtUT67qhDvrfLi47Z2IL6YZJlLYNUDeSfpXJnrGcLYOfQTgQkvjuZL
	uaaS/T84seiLidR/gYAcoQ+DjMfPjWMronwNYxGofV/z92U6z4aOk0C/agwms8hx
	4+X5ucV2c5/NFnJGD9+wbOTaFaFuav8Y1hjQYEwh0Y4Pv8HREU8RyiQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy035wq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Aug 2024 00:28:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47GN6pOG000624
	for <dtrace@lists.linux.dev>; Sat, 17 Aug 2024 00:28:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxncv69e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 17 Aug 2024 00:28:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iseEFFLjmT8PDUFkkRdhzefQfWdmfv8tfm7myiRWsKp3RT6odnXvZRX5j7yT45XlQGlzmsCgIgJ1jCViYQ8+LyYEuunDgFwfl+9pqpWsxYR2wMBVG/wPMzr/aK6x7mS20OBKKHnzQAuwn2rJ1+a29Tm6P4wdTJp7PDxQZk+F6iYkDHnZPFiJov6iG7QPdoVpEL1RiDPWj47noBQ+I9SNIf5Lw/+8oqdqTM21l7UCZShH0R8osldilfeWGpMbmdKdqFKVUgBK8ZHxRTofFnrh0SYuj+g27Fum6BvSDaUu6Muvy2DlFmNuZcdu96XZGafUdalX0CRBghAbosFcR9YJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqdiNF2OdO3yjnvMCSprrQStXywnbsCGxYG6fWgTeRo=;
 b=XSX0m/Ns8JwfzB9oDBInJ9PoYAyJ/VlssGAn45dFTQlIXd+iGf71Zrr383zK/5ONN4HrUHSKdvmroDI22o3zS6XaYeM6Auus3u2M6J/7+JM46N9KYbk4lHMyrCzNRU1MzpEdSjsNP2IBTknam0ZwEz4F4Yin1E1pc9QmmXJ+XtbLEo+9EdjP9vQ1g//VUzStRTv93E6k9ZUrQ4CHi+zEPRrZOXZa2dsEngs5BebAD7KBWlhMm+Swh9SZ8S9TK1l0D0pgYr7KRiDWHwpJp8a6iZ+Z/h0pxUDBceaTSQqKitRufRNy2sFqOQOfaXbjU6qRIg5DxSqh1L5mPEgVeYoGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqdiNF2OdO3yjnvMCSprrQStXywnbsCGxYG6fWgTeRo=;
 b=VOVbJisDRtmQiryoDa98e0uJ63trJrYREEcTCaUsXPkbCh0Sg5RqvF424iELdvZCDnf+66XkoSnicOFTB1k3ptTYnbpK2Z+9IqyV54nbXAWNgHiLEQX4iusfQYbbI86KSdOGqOh56aArSmvHpLZCvMUkCQ+0dc81yhcm2QjWy+U=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MW5PR10MB5716.namprd10.prod.outlook.com (2603:10b6:303:1a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Sat, 17 Aug
 2024 00:28:41 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Sat, 17 Aug 2024
 00:28:41 +0000
Date: Fri, 16 Aug 2024 20:28:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/2] unittest/sched: remove dtv2 xfail
Message-ID: <Zr/utNV5KswtGN3U@oracle.com>
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
 <20240628171634.2801954-2-alan.maguire@oracle.com>
 <Zq1Rhz25fVX5eb8h@oracle.com>
 <Zr+pbCfu2apcbDAd@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr+pbCfu2apcbDAd@oracle.com>
X-ClientProxiedBy: LO2P265CA0508.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MW5PR10MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c35422e-4fa3-49d1-9097-08dcbe538b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gTNPavOGd13Rf1r/N+1E6j46xdmHgePXrbeWF8d62Q8f7rY+nxZ3Q+UH5+DZ?=
 =?us-ascii?Q?z5aeZIGTL/KJxPLLchPL+Dlby1kQChszTOFgJc/TDgiAajbtJhP2+3VcCke1?=
 =?us-ascii?Q?AezjSepAP+7nd/qZgyYqR+MXcyL3Gquea1FQYHE/9tprt2yLTyoNzNrtZmtn?=
 =?us-ascii?Q?QNJDRH8UmVZZoCK3o+1odmqBwe8S56Q/cBY++1/C1Cw52XKdr1Oop3xz02Bd?=
 =?us-ascii?Q?54Leq2M8zTX+cII1JPPi0yB8q+bqHbE4+RK4rWu3gJ256rbIzcp0wljSimew?=
 =?us-ascii?Q?celasKV2PGExUuAro0lJQ5gMo4JLhegNQLIoQNrI0R1UZsgpmUGfsnYZYA/m?=
 =?us-ascii?Q?qAbGCmcj3LoWuTZoKl943kEwCSkL62SG8FqwsJw+iHUJQvsoRDb5uaRAoa68?=
 =?us-ascii?Q?s47TdDwOIpfdh34cBWEhdD7foZW3rtucx9+Y7umBqcq8ce4c2uDZSibKSFnP?=
 =?us-ascii?Q?RiktXL2VWFHxoYXfiIw5Nkx9SOtibGFXI6vv+WkXnz+nzcSlPLSGua0Mk6et?=
 =?us-ascii?Q?x9OYa2oG3ZbRiyYZs3rlnuzTp4ZcT0FkcYQtb/K5wJhMkqXtIB0it7gmNIli?=
 =?us-ascii?Q?vRS+9DGKisxgjrHgzeixlw4K/wKk9HDTyPqapwi6zllhG+B2XMxtzsrkJd61?=
 =?us-ascii?Q?32BOkEBJqD0LlpwGFPvE7aCHyVoindYWfn9aCx1+y/CmLjZ3DSy7uEbJtUJ/?=
 =?us-ascii?Q?7r49nrYe2dvI0ADoi0W4l/ezuqCu80pzqMb21ZVAwSYD4VWgQlzmOKBWSKYl?=
 =?us-ascii?Q?8/AXKBCqM9YnpE4ShIwpSZmvnPqywJN5tOa6fcQEQurR1p6uutTBY9xepsCd?=
 =?us-ascii?Q?tsdMdFYz+uZNOyAFxeMf1wfZjGQxKu6zJEHYODTtoq197GP/+5xVXT1RYNkV?=
 =?us-ascii?Q?cFKZiRG8fW/3MmhlTU+9wmHlaZsAbsltE7gBUEZL8oZKaYQ2sUkHfs7wyaNe?=
 =?us-ascii?Q?ZayYtQRrWnDnIUl4xKvTcecOKAtsPPp9szGTyYgmcsZuBmV8K0637BhW0S4y?=
 =?us-ascii?Q?xCiGZJpezTtf4Tg9hltDRX0V9sCa41UYABvceBBiU2irhP9kRTYlNHMXlyp7?=
 =?us-ascii?Q?sV+p/NcA0y0jxNS0FYsjFUK+SApWqoNFM52EGDF/EAJ5IYZsNlPL4KoCDrgT?=
 =?us-ascii?Q?VtWhWB4JSHb1y/PZeThnrZrQCWZ4fBq/wSvF3t/f9grf+l1GgoUCZbrhMdVl?=
 =?us-ascii?Q?arYNE74lji20pHY/EP/d4+KTQv+ddK6vIQrMboTKJ5dOHuQSkOG2marascdu?=
 =?us-ascii?Q?6ZPT+qCljUiSqFaHt5E73bHKtL1yRIfMM+luKoivV1HRwYSvthS2Ono6vNIO?=
 =?us-ascii?Q?d8I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YomAwo2NX13i0lykSM2AnvEFPIYb2MW9Oq2NDigaJBALltaXFMu1therITnI?=
 =?us-ascii?Q?yPtygYIZ7epE1vCgiO87Vp/ZyDuetwDHu5o7kl0s8+fsNlDkgkPr3jRnRQKF?=
 =?us-ascii?Q?ArOlhccgV/eoWwfp8EVqRlVHySU1d9II4ptQ6wloH9GhrTrJp4s/cwfYXsQx?=
 =?us-ascii?Q?xvSldbB+0gG9dwJiRap+OXFT9DZHcKN5chjShMi0/SZXETp6Fxu2zlqq5Se+?=
 =?us-ascii?Q?9hhqXIpqNitHoLG8SVPqH/6Xkqrh66gKsk8RI37koWUlR0NUQnJ2afR9AwX0?=
 =?us-ascii?Q?gR+1GhwRkYfMF79v2lJrENEKtK4Zv+FBxB8N9OBoYg2E96c+eWuDqeR9ONz9?=
 =?us-ascii?Q?3Ce82eDseIzzzsVDkCKwYW6Kzj35cyV//bkXiioQmiwc6+j7elYzzxTDkN2A?=
 =?us-ascii?Q?ww5BgKmDjKDDX+1I/rL1trhEdN6FeLs0zS26LPf/3a1RLkWpvHXTdOmHtSf3?=
 =?us-ascii?Q?DUg4GED/eF92QcfjhsNxseqPuF0ft6f+uLGqYBgSGRq4Nozeglc63tu/VVdS?=
 =?us-ascii?Q?kPPCWJmQ7J4TddJCtZ5Nw6e6/JxRpSllT3a+tsHSDW73FohpL1/X7knNQfiu?=
 =?us-ascii?Q?zHeAlsEbLqQfnW/e46r+y4W7dw3rxvUq6ZkpEAzP6wqxj/e3YdNoQ6Xtv7e/?=
 =?us-ascii?Q?9CRknGaB8CT3nIWMHMzp4Wx9ZlHLr5h9FCdUy6buxXQ11KnSVHUjtmLAdhrf?=
 =?us-ascii?Q?A8lN9PMQ0xACgv9WRxY7WBJvivxC5hUaXRKkDl22pVlepKewaFypjjoZK7At?=
 =?us-ascii?Q?2hV7kKi+N7Q8fxPFJ1OSaStLuo1hXa0EmE2aj7BGcHihOm6JRymAxGDnRSkP?=
 =?us-ascii?Q?/0e3zmTSNsLsSTth8sLYaCaaCpWqQoHh9Oj/CcWBf4AWTDEm/1X9EPcuuKmh?=
 =?us-ascii?Q?6Zgyf/0hG1k2oF/kaVxHiSrBIdsM3ySwWAkldPD0c6teBAjR/0HuSFnrI2YA?=
 =?us-ascii?Q?9SYx5qjtDktjHw2akJ0tLllJ1CpTzsTIAfICXc75IyPcYAQrNcBkeC8gUf4N?=
 =?us-ascii?Q?7bHo8D5e2i9qWt5E5cNLlfqGwddENXChz4h2TNSlW1a+A/N/Gwwnwxx7rVsZ?=
 =?us-ascii?Q?l4g4ByFAcJgac9cvorzU3P/WQZHIMplAfSWDKYDs9JNZYJ9ZrOiqED8ebRpe?=
 =?us-ascii?Q?pWM6eEK7WE0X6e+gjq8BhIPo6Xbv3sO9H7Nlr68O04wcIso3GFwUhxZgoFMY?=
 =?us-ascii?Q?zjjjN8xwkUgtTdhYxeAMFg7TbKLXwL4YvOJoDa06SHCYrQgh3B74xVpCYAAd?=
 =?us-ascii?Q?QSbrL/MKqWONJBBmR4Wc0AUY4hWXRLWdKnsH2UBNuE8XbAfv+bZjJ9yOsjAM?=
 =?us-ascii?Q?d5y6Z5V7ZGv2BSIGnRMEiB4pINZLwx/UH3d3mYV/kRzYxedc6SH2Brk2Xxs+?=
 =?us-ascii?Q?pwJges2Z6k7M+D30xrNt7rOxd/lWfS/Olx3l7XRpuB96Ec5zsdVkANDEUx1i?=
 =?us-ascii?Q?9w+T6EYur7c/ncVByBccvws9RUn6aBauKQrCVlZq9Mur9hQj3wRMmLNJ/8uY?=
 =?us-ascii?Q?PfxYeoIT08mgORUZQmim5u0XJD1cIY34smNFfk8J1kk5UOaWMzyb3yk6x/xj?=
 =?us-ascii?Q?uJ64UQFjVoMvgAiwv8jQRyx9LX8zgH9H/IHkk9zUCBBC7cz9cmtQs4r2QhJi?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e/pbePfSk3nGfQLEY0KhM3I0b8y4r1uQ2xq/wqh4hYdmD6sQ6e8MZO1un7Ehp7wGlalAozuEtDFKB3gLXE0RW3ye219CeFfhJRg+5vrRD2ExwlMB9rU7LgIFCTrdwVL35gP9iDMysXPsFMy7JW2pegdNkwfqtugO1QF+n6OMAoceQ7YHP3C2FbzsEVYmMB+OBjcIe8DbpPzZK/GFRzNJNyYK1dDdlAgsEff7O1D3fCAoHb1014v7VGgpHSeX4La+59mejOHx88A59kKa5DOi+Iu2gJ/2i5l4R0Z8rTKwankO2X7kptT0WDLqwx/ApMGJXT/zm5Rlu1pYTtlz/L3I3o5Lu/5sc9H43RgOxc5SXycAAyVL6azL/6CnfWyhL2rRZ1t6oelVNqjq5k+5HFD+DhXnX3lSySY8J+XSUVqM+lurocO5+rl8reOBA2fL0iUZLhYs+8lDfbfSaRrRrY9BC+Y1dzMsz+Q54loFG/6K+WcXiOzd7GfFP8blOSVCEO0bLMlm357BbR0XbrtwVIgtZNoSBqUn5reSyAl5RxmZ1OqLTWX+wVGa7YqnU5kFCqocq5aMKyIEYxEaIACYXS+iihI2ridgfexdFYWCebedQ40=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c35422e-4fa3-49d1-9097-08dcbe538b8a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 00:28:41.4710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDfApgTJheJP+gcN2M75DPInywlui+FvrY4RggrBhQPagFUw7T293QDK4mosp69L9yepZV1cOoaPeWnihDFx/7+1Ehytw1h+78tlPizJwYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_17,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408170001
X-Proofpoint-GUID: TiFpoZr-WKBwS40P23uHL-yrnHNygQQ4
X-Proofpoint-ORIG-GUID: TiFpoZr-WKBwS40P23uHL-yrnHNygQQ4

Problem found: the OL9 UEK7 kernel I am working with (and possibly all) does
not allow an FBT probe on __perf_event_task_sched_in.  The failure is silent,
causing the probe to simply never get enabled and no error reported, so the
probe does not fire and causes the test to fail.

In other words... the approach in 1/2 of this series does *not* seem to work
for OL7 kernels.  That is a problem.

On Fri, Aug 16, 2024 at 03:33:00PM -0400, Kris Van Hees wrote:
> Running a full testsuite run (and then also individual test) I found this
> test to fail on my OL9 VM with 5.15.0-205.149.5.1.el9uek.x86_64 kernel
> while it works on my Debian VM with a 6.5.0 kernel.
> 
> On Fri, Aug 02, 2024 at 05:37:11PM -0400, Kris Van Hees wrote:
> > On Fri, Jun 28, 2024 at 06:16:34PM +0100, Alan Maguire wrote:
> > > ...since tst.oncpu.d test passes now.
> > > 
> > > Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> > 
> > Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> > 
> > > ---
> > >  test/unittest/sched/tst.oncpu.d | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
> > > index d2c2ce57..7a33bab4 100644
> > > --- a/test/unittest/sched/tst.oncpu.d
> > > +++ b/test/unittest/sched/tst.oncpu.d
> > > @@ -1,11 +1,10 @@
> > >  /*
> > >   * Oracle Linux DTrace.
> > > - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> > > + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
> > >   * Licensed under the Universal Permissive License v 1.0 as shown at
> > >   * http://oss.oracle.com/licenses/upl.
> > >   */
> > >  
> > > -/* @@xfail: dtv2 */
> > >  /* @@timeout: 15 */
> > >  
> > >  #pragma D option switchrate=100hz
> > > -- 
> > > 2.43.5
> > > 
