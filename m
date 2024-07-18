Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EF41EA8F
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721335769; cv=fail; b=mx8qRFn+sTCe84ZyUWBMg4IhOGhbUvCKbdvoiTAp/qnFET6RV0SgI1CUJ1Aq6WAas7H3KgIfYEF3egy61BJ5ebw3mzhAxEQznEGaQGD//NE4Rt5bp3bTCEV9YoIJi3bU7qKn5NvMNw8ijJoEYjP1OtDaNOKBu8AXPMAssv5ZYxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721335769; c=relaxed/simple;
	bh=hTQ939pmAuqvEa0WBIJd+0pY6fYMe+vxplj3w2VHsfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZKVyQeiZf5njL5Ye7YDdyrXXPUcQaocv1mEaaBeFjLlA80yAxJi9xQZKrQkGiaflCOn8eZxD4KywLYYSJnwT3OkLQtYOZ+Bhvf2AExE7KhxNcIDIxOY5YvrgV7iQ/zQL+0H1FNpAtz3Wx38zYm/mwmYOwV9XAxNWglgLg2j5ILI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XgNrmBQH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pngNgE5E; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XgNrmBQH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pngNgE5E"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IKZPXP001827
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=tSta7yiow1xbE/S
	DWF6i5VrgF07d5Ro0wgO4NzAp/dg=; b=XgNrmBQHa9pclLgMnIwEWeKkEtyNCwL
	gDziG4BsV2vHHP+5ZTSshGsVdpbMs+ePtOpHQe42hCbQzvY12MmFEjgm7ldR0UtM
	NLOVkBTazmYjaw4/7xs/a9XY4ne1eB13+2HDSyPmayrKDqEy9N3aEOv4H9GFWxrV
	WvzFeYoIUAK2zOGmG7NloxkhSG39PE2WIj8tD0ogkM83ycVfqgmf3rVc9zUTyL7C
	FNgC4LF+ylmCun4OtCu7kHzl/fe2LzIgEWZI0FM1++PeK4y7yqlN8+txxBEWM7pq
	A7kzwCPFA+mDXFqTE2+U5j/wJM6mq/JhgkPgdE0SBRIWSGlxleTgthQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fa7eg0vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:49:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJD0Zf039531
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:49:26 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwewvgsm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:49:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qy2SSWeW19nOd37KKeqL6TE/3meIXrK9t6g9vBYWB47hdIqYWuPpD3th6fZKHjiavTD8WOEbPKhNpPa8owVheSkxFNZMqqVJgpPf3utj7Q1mevw0h7EVjV/jniIirOt401X1SXw1hbxm1hYHdgGp6gmpAc9abokX0OTSKBXRqgnWFnwOrMsUDlNwRwIYqbYnMvDnl1ZrfPWw36aiX3QoNLfV1ZyPfa6NcjZVZMaEc2Tfq/v3SFmk57P42PzEJwKopMjoDzWliIEx7fbHBNHu8ReVdVPM9hbywf0PARJCX9EmeH+QtKcklyRmuO6Km/+rxlQa4JaOTh9lSNGq6aOP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSta7yiow1xbE/SDWF6i5VrgF07d5Ro0wgO4NzAp/dg=;
 b=HmywTwtiJHPmZycv6l2IUCujNeUdcHxYbNKNKuI0dvHoIovLIDTnzTlozU/Qhg2/SRf6LtNM3jAfnxa8YfM826eispsMz02EshltjZ0J+G2VvI3z3jF5LwiQ2S2IMhfGgcyADZEYR/btaV/85qMyjM0lPlXJLOvpaOq0g38MiMAXt0zasNQB9JODnYPeQpSE/dFkDECuxGNP3QDFjGvgP+jGqbYOpFEUIOB10NF0KrMzjoHsmpiGrfqhAHn7YtUkMR0oFM0u1uJeXcQk7DqUSslBIlbmicgph5mv0LYVHfBBpf3bcUNWti/gWRwGVMfSW6O9HhBgp6iYKdWeHwrsPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSta7yiow1xbE/SDWF6i5VrgF07d5Ro0wgO4NzAp/dg=;
 b=pngNgE5EPjzG1wHgjX4brVB+S3CCV0Cb/CxMfoUB8AISX0KhFqYMLSJ9PP1A+sEDeTqn04j7pm1kza8V2nFgrH8BivSuyt8Sc9eXIieRUrJ/xR0VJUKK6tlRfJ0WOdCPEeaIrAZyy3oxPvXjsDUdCVSFa1f3KVJvQtSM7lBT2v0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB6153.namprd10.prod.outlook.com (2603:10b6:510:1f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 20:49:23 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 20:49:23 +0000
Date: Thu, 18 Jul 2024 16:49:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 17/38] Add a provider-specific probe_add_clause handle
Message-ID: <Zpl/0a633S9c4ibh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-18-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-18-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:208:d4::39) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9685f8-45f3-4b6e-e898-08dca76b1ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I0g7Y+XTpkhtGuz2/9xWB7XQfXmRDB92bC38OQYHE/J+Rl8Fxg4u2etN/JCq?=
 =?us-ascii?Q?Coh29UlPRJD6FobObAsHIinWzoGH7af+mwqvULOkEb7yDkDT97mnAEh+Mf1l?=
 =?us-ascii?Q?TvX93XC8/5XxRoZJ0pY1Z63DjpNn8YDmNQVdu6zl8z9UJ7h44CkMP887Py2l?=
 =?us-ascii?Q?8pWTJ4Wf5xt8OqcshLyPEicG4jEZG103ttPlGOMdw4vofRuaTAwKDNQsbyUn?=
 =?us-ascii?Q?A6QldP84NRxr/bsIKE+I5gFDGRDqfIs7TH0WY7pkuVv1CAI/GwgoaxIUbPKb?=
 =?us-ascii?Q?LVSIqSXtxXiE5/cCPmjgDIOVFG8OPynkvRN1BxujSME+30YKX1OCPrnVW6uW?=
 =?us-ascii?Q?+ehmzez8wfcoW3H3c8MgEBCSPldIp9mBjT7BGPWQLsiI6gM/hLMpIy/QhAul?=
 =?us-ascii?Q?V7f+spuuoNLJ1lbYM3GhAUZksgrR0o7PiFsCfmIeEGUfzds9rpCyHri7KgLI?=
 =?us-ascii?Q?2QqTu3oJrAtmnVa5exwvi6AZQApNJpKaCXdY6y+KrqxR/BGUiWWRZSQ7ggAZ?=
 =?us-ascii?Q?vEL0FTQ9ojtL9PZ2lJp23W0IAm7WsD44MJ0blMEIs954NwXuDiqTiAySCAAG?=
 =?us-ascii?Q?d/55f9n3ietvQp/W81yaPmgo5k0UQZx0SE8t5AgOz8pQweG6dGLUP4riYPO6?=
 =?us-ascii?Q?JMgSau8lAcA7P33U3L2yoXhRXYAkhQ9kBcaNvH3jbELq0YAL6gzVAhEBdtqE?=
 =?us-ascii?Q?FyfOw4l4Gp1VObzq4GAfVEDs9xa1+sPpwj9mp1tu8x7SzDc0xF0n+CdmXZ/a?=
 =?us-ascii?Q?Gsje1eAV6JXNLGjOYrJj8t5EWK7GJfvVcmceU3++2A+C4IFjWTUFHcqpEvnW?=
 =?us-ascii?Q?vPK6U+tLxE1AVHRD3iSV3gDqHs+NPge0futN/LwPMESwlzlAMV2FMrcmS1hu?=
 =?us-ascii?Q?19Qlg2wdWvogI6jlWqaV8ykCpe00RKQcOMGKZeRvGpI27IoiyRk1TK31HRti?=
 =?us-ascii?Q?M1oYJ0eH4VJtLwynsjwKevSVjXBCfQbT/hUqTwJPwJI997HVZgYrOoqz4j4D?=
 =?us-ascii?Q?fO9jfF48Op2VFlwdc81Rd0+Ng7G3KYivRtXK+QpmfNFG0IdDaaN1vEF8PMll?=
 =?us-ascii?Q?0acT3TS0TFVVExIRtu2rSwelXlcNZw9NCMNdZeJhPVqv58zTvRjBS3tE4KDX?=
 =?us-ascii?Q?a/+FgKJx4K3oOh0NY51zfW1PTPqgVAScd8SQ1Lj96UvKAMlCNhQO8O20LJU8?=
 =?us-ascii?Q?XiIoovfKlV0AhNpZwXQ4F3ZMql1LUNaL8QLn2UUwJHbtTubpMAOFjCxVrCn5?=
 =?us-ascii?Q?ED/7FKgu0vSKyiWHcTzTnc/RKnmam1NDlGTsYO3coOTiFJRWkof5uVYk7C/m?=
 =?us-ascii?Q?CXe80B1NFjzGciPXqkCfDsS3CaDAyh67bQyZdDt2g5a0Bw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?//DHcpKfbNxbA0F7jUmwVxa7Ka80qKb5nSfDNQ1Kfoz15xDi9Qm1AJz7VVDS?=
 =?us-ascii?Q?ESVG+YhJdHZQB7jP67zfwoixJA/sLd2I8F8oNDR1xa+VttEop88ol+YnBRhM?=
 =?us-ascii?Q?1T8uoHteauzIVKypwF5Kt87TcMOlXfJ2kAymtXdMK98Vvk2V4jjy8UyaKvgY?=
 =?us-ascii?Q?8XAXURDoxXeqx/TtCrfUpZWqmZPJxVQUcI5Pn4ddVal/a37flUR0VvDvF2z3?=
 =?us-ascii?Q?QzgRtZipqV0PY7gPxnY2RcVrMo4AjsuXspHICNiplibQIcEbk0l5G6ubFGSE?=
 =?us-ascii?Q?dZ+coYY4f9RsgzWRCnDeLQ4VZz25zcYYNmPY4K7iDsX7hQl+0yy1tkjBeJqS?=
 =?us-ascii?Q?+aV3C388FEYnY6N4Cr+xuMvofdQjMTD8Ku++zrzZeD34rCUh5oNdaRRa5BSz?=
 =?us-ascii?Q?SkFm4byuLP7ujcB165GF45NTeihsgHFwsji3NSYSlzOCwYbysI2PUZvRAGy6?=
 =?us-ascii?Q?Le22YCr4rRfZBV+BnATX80qzPTlT1HQObK90z5T0CAY6ZulnSohenwKg6OXq?=
 =?us-ascii?Q?sI40cgtC3ym5ZZVxFSymWc+58yD9TDQYGyLtkDxoHs3zn9nR4wd8oM/rwQ6f?=
 =?us-ascii?Q?1BLXRCma9V+XvXj12/pXmIlb2rqTAwdLt0QYx3R2LVHB2XEdkIijQNFeJPuy?=
 =?us-ascii?Q?sfD5+at7CSWQyuCFW03zA2cvGh5Djl0M5z1p6Aft/l+6m/RPvJZAvU4cYxFX?=
 =?us-ascii?Q?6kID/M8Chcj+OCifH1WwcRyiKIZpXl+v5wAZztGUDnDCq1Mg7IigQo4nE535?=
 =?us-ascii?Q?VtEuilf5OA+1W9IRa5S3yd31+5Tby6iGXCPAYFiLMVbHr19lyIXAzSawzHP+?=
 =?us-ascii?Q?0SIjL6YDj/ZcFkYpW5SMkVTpBUTf1h81wfdPMr5y4Gpp/WhNIG23aqfNfPyo?=
 =?us-ascii?Q?MZKEoV1QkCM6DwVYmX7ScncdcGI16dpo9Ul8jW2rYYQkMpDPp9q/v+a0x96P?=
 =?us-ascii?Q?I3ePnr1kKEY2RwbXmsE6Uprrem32fO1+H5nXhZkMDuYhMAYWKuwSwm8nzvgX?=
 =?us-ascii?Q?m7FYD2SJkPJeBE+w39LKrtqc18MQl5n53H2G3JicBj8HFnKbsjQ89IKm+skA?=
 =?us-ascii?Q?UwSulE6kuyiJFtY4lj8AedBLGjTZ9LYYZkNhiBZzrsfhY3ffP32sv3fTzFWk?=
 =?us-ascii?Q?XbKWPQrth8WwEcDuuB033M0Q9QixzwecIhumntqWmxXUUDgF9VrO/AtLt/op?=
 =?us-ascii?Q?TS/4+fUK0CoqwUTlFDB16WQggxZXGW419sLoeGqdE4EJkzq2OSzRU7diKZLP?=
 =?us-ascii?Q?TsJkCFTXym5y1NjtNObZIuSit8pCzYCy0C91wa07IhMF52KYhPGSjMYx+Etj?=
 =?us-ascii?Q?34J3lMXCn6fQfMsH7JbyVYfqrNksbZMz23LOiY62HxChfJU2J96S9SWC8tH2?=
 =?us-ascii?Q?ciom8+TnbAWheT4P4AVjvm33bNpXr4vbUeNT+EwOk+NrET31uKlyfho9M96E?=
 =?us-ascii?Q?OODSF+zZKc/pRTh5wbnmrafkFNI/ctMUidf4BO8MQ1tzVtaDEK7M0jJcZ22l?=
 =?us-ascii?Q?olkWF40yjeF4u/E5A9cctVgosB9Fgg6dx7Df10dFNeRMDJ17GPr7MVgNu9LI?=
 =?us-ascii?Q?G3qJ1yVJ5kHu2KRkRTS68sSN33T3GsT1CsNtYCv140o3+jEYawRQxZdO6En6?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nwm/ckbl1P9FcIzPUUjoMPhJ5rY7nvfG44cnsWSdGibO2xkQacA3WdXkYPDJZB31Q73rWHee4YDbAIEwUWqZWlChIAF3XyrGvAygs4DkOt8z90eOQ5ZqhnD3cjQpo6zrXywSMj1R8kQrtl8SJ17WglhSYxIELgWfqRQflFoBCVCjJZW0ihl4kJrAkNU8csI0ImO+LqCxjqQk6B/q0Zx5j94TAvHcMWxeSgi9df2WUF0muPp2Yl+Qv+osZCjXio3PrN/CrOpBbMe0thh8Kz4ra2lx9lyfyaVUIujAc2aMmXej2SgLg2MZO9QGxD2l6skyBLvs7WndU1sapOQhntbSkYx1PDS/w4dvVg3BqB7YQcj3Z6fYwuX2pKgwl5aHzXQIdyGL7C5/i2ksztMI/tot8xi3KBT81uGiCoVQi55bo8EnWyigrmXYeISeMDAcHjw11Yyhgwlm9qHeb1itHAJTpAcNeHcEtdIJaFnKcnOfSru03VEzPv+JFjqvJVkRAXoYsM/YnT6srrFy6bt+wUBmRXdfbWoAUi7ZTYgWw8OFwFzFcKD1Qg6/PgPHTWtTzX0o9PJuIjw8NafR//nbx6qqPgnHJGI5P4MGLAIKGeMxIWc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9685f8-45f3-4b6e-e898-08dca76b1ae2
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:49:23.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrLNBp7KvkMZ36AR/GVRJKji5FuZntYfWgxBf0Q7x9h/zndeUU9riGTHQvWzUaoa38s1Rk4EaqLJ/gLl6eKbRI12i11rxCQlfdQnXmYZ/Zs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180138
X-Proofpoint-ORIG-GUID: K8TqB4bruhh6emA4YzIkWaH2LqxFQAUg
X-Proofpoint-GUID: K8TqB4bruhh6emA4YzIkWaH2LqxFQAUg

See comments for 16/38

On Thu, Jun 27, 2024 at 01:34:34AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_probe.c    | 2 ++
>  libdtrace/dt_provider.h | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index d0ae63d1..48b02e11 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -1354,6 +1354,8 @@ dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
>  		pcp->clause = idp;
>  
>  	dt_list_append(&prp->clauses, pcp);
> +	if (prp->prov->impl->probe_add_clause)
> +		return prp->prov->impl->probe_add_clause(dtp, prp, idp);
>  
>  	return 0;
>  }
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 17b1844c..b1b1b1b8 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -62,6 +62,9 @@ typedef struct dt_provimpl {
>  	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
>  			  const struct dt_probe *prp,
>  			  int *argcp, dt_argdesc_t **argvp);
> +	int (*probe_add_clause)(dtrace_hdl_t *dtp, /* add clause to probe */
> +				struct dt_probe *prp,
> +				dt_ident_t *idp);
>  	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
>  		       const struct dt_probe *prb);
>  	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
> -- 
> 2.18.4
> 
