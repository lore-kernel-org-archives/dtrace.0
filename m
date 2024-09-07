Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C5715C149
	for <dtrace@lists.linux.dev>; Sat,  7 Sep 2024 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725722047; cv=fail; b=uFnDOEXaI3qSq8FbHVcAL2YhvVja22BRZ4gHgcuFZ4RefzHIAgXpIrWzCyOAmSH0vEHyYKH5tj6ZlEsbgkX7qpgpOtAg+qLTgztFkrvEyj0khr58PMfzc4Hhvqvue+7XrGTLkfA3Kcv2wOuqHJddGIORgbcqwfh9R95+KRBfuL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725722047; c=relaxed/simple;
	bh=Gj8Wk+tmdsYOmo0f0Vd8k9w5jW8gYMcln7BEoox6HIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pMaw+hF+Sc4HmrXmY88XjXpICzPN8qsBYlMpDR7+K6CruALk6iIViCN1s56pIYvT3/y3HmjWIRZKGMPb5BVYL1QH4CoeEzfRoCv11rv94XT1pJsala8xxPXmBsZZ9hwk9KKorsG6XPwTdSL3x9L489rPdqMfAtPpWHnyNKZQq/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PlYdTwKN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t9lR2WKF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PlYdTwKN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t9lR2WKF"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4878fV5E029136
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 15:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=WmhBPZew3UtSzrG
	/GALFYFnvwvtHHjb/apCx0+BKhXE=; b=PlYdTwKN3H9Ix+JzCFJoJACFZn3D9dC
	SzZdAeD2AedI9neUDffy7ew6aO59Ugd/BWEbu7pokEvZNihNvTsZWEoVWvPWy8vL
	5RXBzwGUWr4EIxmTloFSLg+Uo7hIwLPme/a2SSBW1GtO4YnfRq7gIoI0dwDYcolH
	1PYjWTmDdH/n74hAD92kdPQIaBDBC4v+KM2b7gW7lkP8FPvvwJTRWw+7Fmq9B82Y
	27SXPiEmPkrHnKi4sH0ssI/r5qdKBMnEd0AQ8BcQQcsL339PVYZFYYRoTmyn33yG
	l4BD5yaLTYX0mVlgS4jY2gqj2mtslKc+CZ9fHAMFdO9OZvJZzvQbUaw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2gf0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 15:14:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 487C1AFI032414
	for <dtrace@lists.linux.dev>; Sat, 7 Sep 2024 15:14:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9c333n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Sep 2024 15:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQsZbmEKPUaYWqzAVmcR3Kk9MaIqMS4IUe345XoDSS98GH91w5oFxu6UqTv7WSuFDtCheHwaiT0x/y6ifRz4qn0sbYW6wPOH3kvEZVq5bQVHa+1NPm7YrgH0x//v+xm/8hOOjc63E3mrLfV9pe/+VmhXLCrX4m+N7cmjS2Ai0ZLtLScyK12FtxwO2wY9zhZ/Gye+uaDaGJVBDXl2BQeApLNgH++LqNiMq69Bq2JcJclNqOHQoMRjoHa628/LMFOjNNxx2SJ3jj36MNptpLPeECGKeUD3q2Zo9wJDWVeyhRDRzTuu3l+ialmgrnjJATC/F3nCtM3K0s3SdymNgvBTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmhBPZew3UtSzrG/GALFYFnvwvtHHjb/apCx0+BKhXE=;
 b=QZFlcTiTS/qxELXXN7lBZKiHUM3ExQ1PtabHpEgnTsKDvkOjb0CBk5uNqcPw8tnz8TadrEg5FNfY4WODvLZTtpk14EWVE/PdiTL0wzhvU1P4/mftLz7Vr9pvaDaR58R0EM+tGoVAZRIqwsIoZrrv/Kn9/WNoVCsiqqqsgS3MuFEcuQMjuTfIu+nhdehrJPsIvpVU67nCD3iyg196e4cJ9Bn9fu6WBSLvP7a91DzTeNojT9B7mdgtZuMqLoBc+b/knIM9AlssahdV84JkKoHv1uiQTjZZryDjhFIxyN75Ek3V97f6V3NkVZNOR4E93J6TyJ7e+92VOmeBnOCM/jZFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmhBPZew3UtSzrG/GALFYFnvwvtHHjb/apCx0+BKhXE=;
 b=t9lR2WKFyX7/BpMceFuTyUXMKMefhVSvV/kv7mLPzAye2A9St6Jq3AjxntvMNrfQ72xfFSZHw8GupWw6Q42uYLs8C2hn0UA17/SYrIPVmhEVzQ6HEDFv++wWNMB5WLDgRvVKnLumqney/GZcAv3JEFs2IVNmA/OVR8fWGu9mTMo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BN0PR10MB5032.namprd10.prod.outlook.com (2603:10b6:408:122::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.10; Sat, 7 Sep
 2024 15:13:57 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Sat, 7 Sep 2024
 15:13:57 +0000
Date: Sat, 7 Sep 2024 11:13:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] error: ERROR probe firing should not
 corrupt probe arguments
Message-ID: <ZtxtsmjX0JcJ7byx@oracle.com>
References: <SN7PR10MB628741E2D7AE4B5E4A4636E8C29F2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR10MB628741E2D7AE4B5E4A4636E8C29F2@SN7PR10MB6287.namprd10.prod.outlook.com>
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BN0PR10MB5032:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b63781-62df-4cba-872f-08dccf4fb1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a5r7mZrnep4dQkLPeyyH3JbKRCHCJy30DWWGOR6BEBn7YD8C7vGpK21M0/Ml?=
 =?us-ascii?Q?gKllQM5YeEI+VuUY1M3Dj7BfBKV/g1gb+QBREJP2Q9IvRRr5K6ANHjgBcSMD?=
 =?us-ascii?Q?wuDaqM27jwfpVhP8uAVn0QLZea+ifZz4QsA/Je88/EfpGgNWLy2qE3NEYr3I?=
 =?us-ascii?Q?Q3GWBwy4Cwk5haBVzRsVm2d9e9Vp4I1NarL6ujD5l2W7RcSNavscoEnCOEkL?=
 =?us-ascii?Q?+LMXG4I9bPTfMXQO931ZEPEhX7nXNHvOTsfx3FvP0a+R1Pr6kQnzgtWPh9Bp?=
 =?us-ascii?Q?o9C39zlAyLsG5AHfbUvRM2mTdsMh0mjuSIns88hk3kocjPbxjwBdahT81ZfZ?=
 =?us-ascii?Q?v2kvulqALCN437mW19eEpiiFkHoklJIASafpn0iZz0F+l5DIE5ZkwbLpbTQi?=
 =?us-ascii?Q?3GWVtEAipANup9BwnQkoaTHQpDb8Jnf//8OLSRj55lzR0OtyBWklSbsT8M+F?=
 =?us-ascii?Q?X5H7RZ6+86Z+/NW0vxuCGimkz3GVAWsykW5H/nmsj93PW//V6R9JivVmbpqe?=
 =?us-ascii?Q?e0IVIzYfitPSYaUS1IHdHpg782pPxdAnCrmHW9CNhqLY2IQldLm5wcGwTvPF?=
 =?us-ascii?Q?ofYO2xhMhFTUDxhvHCE2Dnvhmi6D9wJ9oQazsHqslbDjWF0Is59wuUY7uMDV?=
 =?us-ascii?Q?gvw62tQi2ofZQ2REzc6khXWuKPaf0cezYexz2cPYoxWyjhAjySugmJF08VAo?=
 =?us-ascii?Q?lfKuYWLqhFREUIOabcw9Yue7DdI1tHi5Gbt40dj3PjzKcHwhe2ArchVIQQWi?=
 =?us-ascii?Q?XwuJi7HAf1CrxZm0l1mVn0Jz2RBebB1icsISYevnihX9iTAisx9z7Rf+5Lav?=
 =?us-ascii?Q?b2ZSR5t7HZdPn3GJ7n4mwuXvFoGr1nIbEJhz0y14g+K72pyjTaESyGVsaONJ?=
 =?us-ascii?Q?9yQqUlYUKriNI02pxjlnVMQnxA5dKbSyZD1EUYuUB1U1qQP7iKJr0acUlINj?=
 =?us-ascii?Q?4SBC9iWRVcTI9XJIlMNdu76m2sy2qZAeNq4zg25MKkM3ZTO1YYMRnORgvDsN?=
 =?us-ascii?Q?BMwOgANLP4ZaXSJjvOw11VGw7OszzrDVhS0HK5berleXu7JS8dH9rHwctDQC?=
 =?us-ascii?Q?FjUD/pyk/Cg25PeHSW0MrO5yVmuQgT5fKu6z9nClkrnJtpHptgx3lKHAb3gX?=
 =?us-ascii?Q?nCfYp/T8mXJnES9Hl3hGYbR3PCKhsnfRP7kavmdHTy8v+R3aU8MXWn9tJr57?=
 =?us-ascii?Q?bpT7n7Ke2smCSc5qD3jU3vP4fKhd2DW6X5Lyruf1kajPozzY5KHC7WrWzBSt?=
 =?us-ascii?Q?RTDiITKku/YuqEXkxO754KLA5Dl+yUcbrDCqOQx/0k8UmJ5qwKR5p+JVmjGV?=
 =?us-ascii?Q?lrXq3KyDd6SzK4eTeQEZHxGQu2K/hLqDslxnm31WTJ3rWYxSmkc1vpx8mwyw?=
 =?us-ascii?Q?mf7IXrA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4SF7e23AQgxzs2LqI/nsN77jRwIFx1OGyC/jczlds7ATe43vIohoX6r/eqAd?=
 =?us-ascii?Q?INhnxOVmbOr1mqOYyjI4bVVw0cBOluAst1mH1DCn0O/bgp8I4Y0rFM8lPMtI?=
 =?us-ascii?Q?wvbHRUMX2wlStjpG2fOb5GCIT2MDN1qq9TpFbnDZiWTLVH2ypxSMdGSTe9KF?=
 =?us-ascii?Q?CjyLB1Phh6tPWZZ1WseA0V89J2U0NTGuY6pSsnvSSjoDbRSbP1Ube27+vwq9?=
 =?us-ascii?Q?HR9vbOx0jHBReOUbhcsF/xd4IpbIFpaWl7miw1w4eB6i9wrUe0nfdUHIAPU3?=
 =?us-ascii?Q?z/O1RL7jzQE/V/ruIMROlQ4SR0GYkGMRTuynzBvyZxy06IoPIA56+UMuedpS?=
 =?us-ascii?Q?wi5C+teZOHsYF8pLjyPty6ADr93DwHHL2f8HfpUk5RncQYXdaPWeMbqcWDyI?=
 =?us-ascii?Q?QGZLaAyubIBaaVT3Su2NPL6lThTgw+5VpQn+cPgSZ90jh7mH8P/4MqWhmDuD?=
 =?us-ascii?Q?w+clNiClt29QxoXQgaF4FZIZNzQ2RfNpysa3nQnI83ErzOYUMOT1OXQPWOwm?=
 =?us-ascii?Q?iT/Uy+oQzK5b4Q+VnOB7fZVBicsFFL2cbVOHyp5sNXIPPz6by35gqCUHk+GL?=
 =?us-ascii?Q?yp7XjxD/ei0JEt20HrzKF1bQlkFA0PfCWgPGlNwZg4BMkhrH8i5DTgwMXu2R?=
 =?us-ascii?Q?Ad6yy/+Y4WASjThYDA0Q6VQI8yLcfy1pwtjEKJec2+zfdzmMGgtmnQPqdkCG?=
 =?us-ascii?Q?N6SyoXPhYwPxcau3UWB+Hv2Y1AH2/t62BnRkZP2UVxv/HtDo4ZrUvMugkw/A?=
 =?us-ascii?Q?inZBOhNxtmlZ/sHmpyI8ahzanyfUE/5cP8X4792WQtFbLBznU0Pw1u7aj5YV?=
 =?us-ascii?Q?5FVItjg0TIWcfAsvgsS5LAhflm3N9toou1zbsLMd+19nKPcVqcE93wxaCbi/?=
 =?us-ascii?Q?75n5iRD3c/Z0yv49AXf2FfuFQB9ou69gH+lVIpQBXWt8NmKfQ/+Q5WYnsj2N?=
 =?us-ascii?Q?69UU8joYwM4xC0ZyL6WGa0+DMz/GKy4OrXBmD+zK3EM+cmuzlIu67jsoKTs2?=
 =?us-ascii?Q?/FfD8Adzbzu40WTc9yDM++2hvVrGtA6lxhopVmTfPrjSpPJCI72PSrN/Ot1L?=
 =?us-ascii?Q?IPazXozOvAJNFs/aAitTt3nPSr+Q4h9P3C4IfqPshboxVaObB9T1lCTPNsb+?=
 =?us-ascii?Q?dcv2jt9JH4UM5e0kaCFAyBPmg48v5x8MXfL7wmxEvgQnsiM0DiY7/RHhzXxl?=
 =?us-ascii?Q?zWD34QJOWluXIZWVEm40QRXHxJUWFTHLboSa3vGoHx5sWIr38Q2Ae0Vwzf8B?=
 =?us-ascii?Q?LQiomBOADP4pCH12mtdEPfJBMivP66o0t9fKpvuFjwCumydGxwEeuoT2Gwj5?=
 =?us-ascii?Q?wHQyqyG5V9b4nnox3LJIQCDPe87nf+eGhqiH8OrX1hIuhwS9RC0NW5jgl0Qa?=
 =?us-ascii?Q?YW+NBpIigAvyr4Fw5CNlNgRTTrVM0CZhVOHcLXahfw492+xEQPOujVB6obIz?=
 =?us-ascii?Q?3Xlu5pmBpMT/IXSTEn5jWcnHlP47rCx9Ihv/7QHdPy7thVfGIP6GQmZrfKyR?=
 =?us-ascii?Q?W4kVdcTVcTp5w6EsxZs4p9ZdJnx5hhwfTJvT6dNfIE4yc+PVrKcXSTAWx/WC?=
 =?us-ascii?Q?CLe0UCd8tC0b8O9+xgJpMmco6d828zRBeeVS7YNO6Aqd441UoNB5I+yBbuux?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xvk2rbmdfZ/7Rw2Gmum6952FUl7Uf1uuv80BWRw5MTblB7fxqIFJIZzAl+jDftYe6Oo75vra8E+Mzf9Wotax4nXMsGzPohwRbUfUMFcXcMZwQtYSm3Quh3XQLwMK6/3tqdOgt3TI6X6nEepyAjIiHr9+BDsjrHvO4KC372Xib2wccIkK4JaRUk/xGh0eP0bzXjomSAZfoT7d+IfrZm4ZOubzPc03g1fhWp2CO/xKwSBFOSO6Ns1cUNgJtMjipzG4AViuh/9qZL1DRduCrBJQ6zD2PXuy/xRvBlH+mfG6x1aXWJHZv16lharpAsK8vQzS9HEZqqHZ0fb+DXe1Rd2h9bKGObCCx3ULvfzjmo5bCl4nKaxKsMZa6DMQMoKyEYs5qp8XZGyzyKX5QpgbWAJ4RE/Ewuj/TfkMsyZQof2soCgLEdia/VNDv42EDNVdr0bg5KfFQ8IwUgDxvQuloBDFLfrP13JKt4/UBlitPyPvym5ne+a8OWL9A0ugi/vU4BgMUR56/D7zUcv0yfw/5U7Ig3+PwzCcjcFEpwRR5EOi8hn8ibRyBE0TK1vWOxzJBM38O7kBxi3XGqHdSH8Llu8vIrktTGit4D2JGF92ytoBIro=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b63781-62df-4cba-872f-08dccf4fb1d1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 15:13:57.4364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6zsW1w6jgNJdhQhTEg26D9KttmfWn7qq3ut/k/FuQqrJJDCGWLHtRLJJjBmtxZ/bf5rGsNBzypYD5x5apEpyim5YS6wbKPn9S7Ibxry9Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5032
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-07_06,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409070126
X-Proofpoint-GUID: 860p5_ZqF_vPeKGkufXaHNul9LuC8d9x
X-Proofpoint-ORIG-GUID: 860p5_ZqF_vPeKGkufXaHNul9LuC8d9x

Working on a v2 - a couple of tests are failing with a too-large-stack failure
from the BPF verifier due to using 48 extra bytes in the error handling.

On Fri, Sep 06, 2024 at 10:26:18PM -0400, Kris Van Hees via DTrace-devel wrote:
> When an ERROR probe fires due to a fault happening while processing a
> probe firing, it was corrupting the first 6 probe arguments of the
> probe causing the fault because they were being overwritten.  But since
> a fault only aborts the execution of the clause it occurs in, those
> original probe arguments might still be needed for other clauses that
> are executed for the original probe.
> 
> Save arg0 through arg5 prior to calling the ERROR probe, and restore
> them after the ERROR probe finishes.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  bpf/probe_error.c                             |  3 ++
>  .../error/tst.argv-corruption-by-error.d      | 48 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 test/unittest/error/tst.argv-corruption-by-error.d
> 
> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> index c8ddcdfa..49822172 100644
> --- a/bpf/probe_error.c
> +++ b/bpf/probe_error.c
> @@ -26,7 +26,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>  			     uint64_t illval)
>  {
>  	dt_mstate_t	*mst = dctx->mst;
> +	uint64_t	argv[6];
>  
> +	__builtin_memcpy(argv, mst->argv, sizeof(argv));
>  	mst->argv[0] = 0;
>  	mst->argv[1] = mst->epid;
>  	mst->argv[2] = mst->clid;
> @@ -36,5 +38,6 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>  
>  	dt_error(dctx);
>  
> +	__builtin_memcpy(mst->argv, argv, sizeof(argv));
>  	mst->fault = fault;
>  }
> diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
> new file mode 100644
> index 00000000..6fd1834e
> --- /dev/null
> +++ b/test/unittest/error/tst.argv-corruption-by-error.d
> @@ -0,0 +1,48 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A fault that triggers the ERROR probe terminates the execution of
> + *            the current clause, while other clauses for the same probe should
> + *            still be executed.  This tests that the ERROR probe invocation
> + *            does not corrupt the arguments of the original probe.
> + *
> + * SECTION: dtrace Provider
> + */
> +
> +#pragma D option quiet
> +
> +syscall::write*:entry
> +{
> +	self->arg0 = arg0;
> +	self->arg1 = arg1;
> +	self->arg2 = arg2;
> +	self->arg3 = arg3;
> +	self->arg4 = arg4;
> +	self->arg5 = arg5;
> +
> +	printf("%d / %d / %d / %d / %d / %d\n",
> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> +}
> +
> +syscall::write*:entry
> +{
> +	trace(*(int *)0);
> +}
> +
> +syscall::write*:entry,
> +ERROR {
> +	printf("%d / %d / %d / %d / %d / %d\n",
> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> +}
> +
> +syscall::write*:entry
> +{
> +	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
> +	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
> +		? 1 : 0);
> +}
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
