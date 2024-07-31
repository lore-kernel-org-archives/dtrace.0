Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D59219E1
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722456296; cv=fail; b=LGb1okPK0FsSI3BPDYMhOq9bRivjtE/KOmx8lBv0yiL2kpYsUgvgsRbQzwcJsVFPL3RDjD23t1KQVdFgPr8o3RawMdrgEucxCCh1ovEG4TG4sGtcXSb29+X8tC6vqFc45eXlksDeGobK3kd/0tlhkHkl/KSprFx8DAxmSRIFxhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722456296; c=relaxed/simple;
	bh=DLUREJfHC2/hXiGHKVsUXI/NWID157k/SdbBUEm/3Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XqXR6O9eEXIksLbwiIAnl5+vQ6887qGy7ftF2PnTTSEF+8ucaENrDeF4yxmoRJUhk2bsES6hOPTVjsq1/dmHt7JRN0xLDOWUnt2DxR2UD4Nhs8GqwWhANIhe4JjEqaMVmE6nUcEWqu6YmfaGLLIPJe7G1DliHsDHx0smt29149w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B5xHOFY3; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Rd8jdreU reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B5xHOFY3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Rd8jdreU"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtTr4001709
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=9hJ42sANWVdgwvUUnF1idlCUpQYJjcSrGS9hZAQK0Z0=; b=
	B5xHOFY3EKH3Q00O0OeKXfyRmGlxWwqPjabeMm2DGaO7qqEiTvl/1qHzsQeVUoZV
	siiocfIsivU9udQzn56sdtNnmoIpdq5MSGaLEiAhnNxe0inB/mngCwwnIv8VpSMe
	n/kEuZ9cGe56/dLdn12iWS8al6GJIMzou3eG6WX0XtGch8+fqqBjHDNGCKOsbL36
	nnaaajh6I7dFLNZiNb2k/ht76xgsNA5mJi0SAediU9JCcIus3sQ2perL1GhRlXlh
	+ZPfXOU+IfavRYdaT9JIYc/24xPgY4tH+OZT5t0RotLwS2IgOJy27ovhngFx0VuS
	Rr4zPm9WdrnfpDL3wMeyDA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msesr8ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:04:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VJOR3j037663
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:04:52 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvny7p50-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 20:04:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsZI3FDt/A+/3AWefWy7PTVPjP0gj56g2m+Zx2H91291wNtelmEgSC5XkpFHfLm4K154ilm7sWOB4ai9UiNd0yty5/lfZllxgAkjdXrkZU3QuiS/A9bSBcigfGYXKQJ16kfLM9BHWm3PO+2V8hNNN3jvA58pgFYn+1PXe7LF5VCijk0KYxSOiU1aQEVo1iFKrs5gq4V3p/tLQwEpOMGRNS8BKBlR22SQZkGPO4kHgl6kOfluefHRMKOHT2l+x1szJsR3UT/rkO5yeMhXURUEZOULDPdK6TD6E8Yh5yqdlbaxQTkNrUyAAisb2fQ3exQJX3sMtna7s1F3j3xedBqz6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtkBbbEucWHyE22M2mkQInVAdx9mCNGsuJREh7ode2s=;
 b=P/3j4LL+plUxc/21n83IjIEjUAAlJoj5mWzDJyhCPYJqbsmbBoB0Vjrv95VENE3pwinVtGzyIK+omk0Yugh/Upv+sRGJWZB0nNEjDtDB6avG+QlKUOIbO6s7aTm+xaHNwb5CzyQfS4kBzBkYgfzDu4j3O/gmXvMdyMNF+XxfNvjljXqjagDTSgMc2QKlQd3+LkyGhmXcTHrqbJiyZA9j6cgpK+DuL95gjJprcbMGRGRwaniNpmEPvUWen1xWbYsEeoyjEptzhZWWRwANY3NUSK7sqP0CASOpD4cSR/388ImV8yrHKCff3T7u9MusukKHiw91E83/6xBw5eEfz/rqsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtkBbbEucWHyE22M2mkQInVAdx9mCNGsuJREh7ode2s=;
 b=Rd8jdreU3TE0rvOO7Le+k7MgW7eT0PnKNKm2R/TxIPkA/EWNaDO6+ls8F1xbDbA512BhpOxH2M9+SorCDZudOkjoA2UBCMBObZNMhQa1sGVhiC8ClZURfAU9wGqUeXK31H5+EjWbNg93vJ0XrCEfWukijMQFDHIcRXjFXANgIZQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH3PR10MB7778.namprd10.prod.outlook.com (2603:10b6:610:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 20:04:50 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 20:04:49 +0000
Date: Wed, 31 Jul 2024 16:04:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: ensure casting does not affect value
Message-ID: <ZqqY3mvU2Fv14hly@oracle.com>
References: <SN7PR10MB6287E87D4C69887B1DC570C7C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
 <5c65028b-a5b8-12f8-d1c1-0fceee063dc7@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c65028b-a5b8-12f8-d1c1-0fceee063dc7@oracle.com>
X-ClientProxiedBy: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH3PR10MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: d23ad0f9-af0b-4d08-74da-08dcb19c08ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?cf+YAEf5ms6anQIXtAfr/sRsQ5roBpq2xQAy3NUBXmVlYDZOw7lomPYEB+?=
 =?iso-8859-1?Q?mS+pAeFTIJP7mZj0j2Ov4QIzn9mrGzPR5LQYeV89uiboCl0rVStSBp6thp?=
 =?iso-8859-1?Q?gnyGOIvqzeiT4SLbHE/uf80rrWrY3qh6dGDCc0V2XhsF6mcghIC0jfwUaz?=
 =?iso-8859-1?Q?QJ3L31DWS6HnuZ57JOUjY3HmnETovVskIjoz2G4QG1ms3lJlU/IYQUbln2?=
 =?iso-8859-1?Q?AWZQlzWfRmS/rM+bhheHpNzcsQi+oNNfpFu0haMFiZ7mOGkWkKRTEY6AzL?=
 =?iso-8859-1?Q?3X3gDFlBsOQ1gO3aXaeXblrDyJVf5jXeVdjC+g7+7RAMNecQUADj04oyxU?=
 =?iso-8859-1?Q?73qhGJKgM7DPBPw6crU1uYwE++8XLOFBMZp8kL9bJsvyP51WE2UCmxXvUZ?=
 =?iso-8859-1?Q?nXRqph5Xz3A5/4eOPpvuzfsD2rH1sC+YH70pXuj/kO3MWPqdt/5dxHly5n?=
 =?iso-8859-1?Q?eegMpgP1K5YoKDj+NrPMbtdz9awuAjML46Moxw0b3wxTTW5p0hDOmw7EaC?=
 =?iso-8859-1?Q?nEdMvEZMpphkvzEETP/hHHIAFRU3DICSqsRYCrlNLSYpuBJPXXsc0tF3f9?=
 =?iso-8859-1?Q?oH1n+a1LVR3dUeqL0Dt+F1am3AHuHfGaBR/u0bg1C6hKh5ThJ8Gg/lB3VD?=
 =?iso-8859-1?Q?bTr6FS1pWGuNQt40lP9yQlOWEBMgmkyDvJiIXHfUVl8DQieAv7KVUiq1h+?=
 =?iso-8859-1?Q?y8fsCWbqX4avx80kVj6+vJyQYcilFKaMH9+kIN0aRWSaOEambTCu+U0WSK?=
 =?iso-8859-1?Q?oVNT28wRv2e46Mc23SE/y+4gVBn+AVgsaqDCCbKm9FRxtjyA2Uj+oHkJMO?=
 =?iso-8859-1?Q?YsKjhyX7Gn8jwZ1vBjoC4jeoJforzDgyudLO9FtvKOVMQr9RmMPOh+wbQ7?=
 =?iso-8859-1?Q?2WBmOjBBjBKVdPUDZ6pXTPTbcJwD86umD2rpSFwCdvHE3ud0egEmsZ//8q?=
 =?iso-8859-1?Q?SOhZSeYgXSujWHJ/oMSvbvuVccjSnhkH/6P8ycqntL/+5s5nX9O3N6j7Ak?=
 =?iso-8859-1?Q?h6tX1Sn12Cca0xkSd8TjJNRaVB5KkrYRvWj2zFJ/usGsS/xEYXPgcoEAKf?=
 =?iso-8859-1?Q?N14WxWDy7gaWCuML0H9JkcwhdKcKe2Gi15f1lkRxrf4VNx1Z84WYk4c8/w?=
 =?iso-8859-1?Q?mnldF3a7lP/INMwUB//0Y+RL6fK+CaeeMJ8FOFyp89zbBo31LKJkW2Zdsv?=
 =?iso-8859-1?Q?ENPlGHDGNIif4U6O8t/XN/j8N9NGIMYJF6xab3m8E5DHbO3BSKArXsX52/?=
 =?iso-8859-1?Q?JjEcaplG1XuB0ygfwfRQ4M7v0wSjARPMlhZ/hmrD7raEKp8IJ6xn/D2xjQ?=
 =?iso-8859-1?Q?z1l4cvkDltNQAsFdeT2mWbEtdC0KT/cUWjwzfDFTJNJhALAWM+XBG8uAKL?=
 =?iso-8859-1?Q?MkOddAGkYGO+52xDknabeG2DetYkL9IC6ougJ6pza5z7EwU4jeTks=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?wVfxWN1kmDC/r4YhZOOlu+IZX5dTyBAli8Qdet9h1sIwOOq2lwaDuSCRDK?=
 =?iso-8859-1?Q?YXcK0cLE4yu/cHzdH93h+v/BHHJwR8zM45vhoWgrwHdGf2geth4P/3XUY9?=
 =?iso-8859-1?Q?9qtRE9EElQ3sJrrareBzYhy1Lg9XGZTL0MU55py5DuO0XH510ONupeAq2U?=
 =?iso-8859-1?Q?e+QM7GjI+EyeflrTSwim+MA5Zqz2iS74U0J/xaaKkUNl5JTzCqrwTUV3dp?=
 =?iso-8859-1?Q?OeIZQmeE1oY0VGQM3lejI+5p9BGfCJQyQouBfcn6eIQ3+QzlWIolrLZhhq?=
 =?iso-8859-1?Q?Setl5KoNkDBBHU3V9aDUUzf+2qERk8epJzOVRsBujs3ktJtlVYb/5cwp0V?=
 =?iso-8859-1?Q?40e+owXpTd3APGajYRVTH3ceboZtB6lDMdnzws+1m5QxIawKEu9hD0lPju?=
 =?iso-8859-1?Q?ErJeufBTdbTDVUtkfjkE/KEMEgEPThqar/x7OmTQR1wGBFoXUIeL9QPE32?=
 =?iso-8859-1?Q?zv7zyKXI3XPhTEKpLPz1ZuFK2MLCsOOYHqhHORRt4zswHVezxe7PPip1tF?=
 =?iso-8859-1?Q?H82s4QVdQeBqaBi72CtyuFc11yRJZzEIuzLsLT9nm551ntKaYIvhQGD7jh?=
 =?iso-8859-1?Q?DVwKh6Wmm9Mtfn7x9iL5AddDMUfZRZJ9mGpOKb8qV3+xr92+QUpgvzo0CB?=
 =?iso-8859-1?Q?32TBBVN6ZunI2zIaWQfdCW18mji3Qas2zH6iQPJ8r2p3LJ7Dnk4GHWRa4+?=
 =?iso-8859-1?Q?yq4UePet1zgFBmqDHNmPM0XiA9irPKME/PI00XyUWutAHGLSKQDrZw7THl?=
 =?iso-8859-1?Q?N9MwyMqEa0XkqjUMOmuwNTX4uwzMj9kgkWuWJ5dmSOSia3vaSm+tdjc+0u?=
 =?iso-8859-1?Q?7PuBXbicpuOrO58QLPcXZDFzMgMqiAnYRR+XjREza3X7AtAOt7wlQbEDK2?=
 =?iso-8859-1?Q?VV7Tbuy5JSUnKtX/V9EhmkpMOl/79W/NIjgZXmcA6Cfo3Lc1T64heMVCa7?=
 =?iso-8859-1?Q?bDsD3zgJkFXI0ZPpmiLZ9+cfeAZgK1yqQ6GUGSW1B2fXV441emD/2WjiZx?=
 =?iso-8859-1?Q?AmeGXpvtto7PPhZ3mBq4WRzHEtV/3TpgT13ZdAxxylZhc7ynEGRjg3AJKR?=
 =?iso-8859-1?Q?nziHI0COWRGT10Orf6vOJkt1QQmwBnLNrop/t5a21lM0Nmo2Rh1Oj0H1mT?=
 =?iso-8859-1?Q?qULVSbZS9QZ1T1C/TqOj+ryElhWTbk8w4IoaEkZJyJt0mIOkpV3Rmyd841?=
 =?iso-8859-1?Q?g+TWQljw3OvNWPFKyIXuAi9l8JxdFav0Gd1Pw5DuaXoEpu7U3Ha4qDzbSo?=
 =?iso-8859-1?Q?/oC7zJx6aWJ0yhK/Wl3IdldiyQa1PFvZg9A/cZYgpkzbntwIyPUVYjbOOF?=
 =?iso-8859-1?Q?iP9eP667gqbOg+F0rtneiFTUoBzsDryjhE9o2p/7fcVjWwozb8Swx4og+G?=
 =?iso-8859-1?Q?rJxiV31K8fiooaYi0KxYQByY/dAz8cP9gq0QuUdyh0Ke/135FroUDBAHKR?=
 =?iso-8859-1?Q?S7nqESMNKttwxSg6Tjp30LhRQqusxeVv62z0QaP6ngOQhzGuYAkwG7lU4H?=
 =?iso-8859-1?Q?UO0KMJqgZzl01rqsy7wMw77TgeW5mMl3aKHWnKRkrpalDQ95casfcL0N9l?=
 =?iso-8859-1?Q?d27kNqbZztlOmGtF0SE6WjRSkvoiUnH4uYOiClcQfTxK0A5AeiKAYa83RZ?=
 =?iso-8859-1?Q?SBe9ZBMdukdkGjFqnfAPND6jxNx8PZufXYNrbEMWJr3xlYXnICT3zWDw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m3VAGKDxUICKPKYjUNLXb1kfaSiHmCyLdNjj2dFTrjs1u/nPG8j7CNUxWogMoL5Zi6grNU3A8ccRDq2F+s11hYKZQtWfXHxfhqXAxNwHJ2RQSGKp6ujXkz5+Vnek/uiXG+f0tTZ5/lBxOu+7lDzCRwJD83omaWxaro8qksILHUerdwx27Xjal61aqofOu0yrPRluGS4OdZTeAt6Oa7Lr4DCE9aPO4m3bXOdaCbCr/yyrM87tf6V8glWobPo6w46hASS+iHemIS0pp6LctbIyl0KlRDjmBZTROFlAd3TknGeWwbbZFxDIVdkdrZrHMxCqlm3ekRmiuYu7h/McniD7nnYyqI8w+12WiSGeATrMldptRty02TSX8OfqG7WSvyjANx1K5yBi5NH4EzsyUgpqycAerXHeA/mZJu0By9vCBFWbIckVZxcNF0KgK3hT9+xPHRqt2JI6WBk3ZYYd4296tNj6xE9GzsoAnw6Im+yUCDDP0NXyR/rKUSaLgHN7fZnfzbw7uJsi7f9mD2cMSsl8R/BaB5JsbLhZ91LBMjJuOcrrZHz+WmBj/kqDurwQCHOPfm6cued1gfWP9iAzTAI7351lIFLTsk6Pm1zc1xksrk0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d23ad0f9-af0b-4d08-74da-08dcb19c08ab
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 20:04:49.9136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 152ptaaXXWQpD+EBsSYwlenhkPptbmyJLP7Id+KuYdDU2sit2Pw6tV90ItUzBkAJ77Sbp2tkWGEYCBYO5wO8/AwptUw46zGdkJ+Wy6FgI3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7778
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310140
X-Proofpoint-ORIG-GUID: PH_9y12ZwSNFuw04p5sv-Lp-q4YVxgby
X-Proofpoint-GUID: PH_9y12ZwSNFuw04p5sv-Lp-q4YVxgby

On Wed, Jul 31, 2024 at 03:51:52PM -0400, Eugene Loh wrote:
> What is the point of this test?  If we do not know the type of the kernel
> variable, then what does "kernel_read_neg_small_scalar" mean?

We *know* the type.  That is why we use that particular kernel symbol.  The
issue is that on kernel without CTF DTrace cannot know the type, so we need
to tell it that it is an int.

	Kris

> On 7/31/24 15:01, Kris Van Hees wrote:
> > On systems without CTF, we do not know the type of kernel variables.
> > By doing an explicit cast to int64_t a negative int is converted into a
> > large positive integer.  The proper cast is 'int' of course.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/codegen/tst.kernel_read_neg_small_scalar.d | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d b/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
> > index 7c585d1b..cda6649b 100644
> > --- a/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
> > +++ b/test/unittest/codegen/tst.kernel_read_neg_small_scalar.d
> > @@ -1,6 +1,6 @@
> >   /*
> >    * Oracle Linux DTrace.
> > - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> > + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > @@ -11,10 +11,10 @@ BEGIN
> >   {
> >   	/*
> >   	 * Unless we are actually crashing, the `crashing_cpu int will be -1.
> > -	 * We cast it to int64_t to ensure that the value read from the kernel
> > +	 * We cast it to int to ensure that the value read from the kernel
> >   	 * is sign-extended.
> >   	 */
> > -	trace((int64_t)`crashing_cpu);
> > +	trace((int)`crashing_cpu);
> >   	exit(0);
> >   }
