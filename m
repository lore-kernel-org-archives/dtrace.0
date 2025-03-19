Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AAF35942
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742404852; cv=fail; b=PrC5Av2WOHxOZ8tC51z8M4cBkoqiQoVp8YJnAEFZoUi4B5OMzrSE8lYWDfv+7H03ZOIsmrSp/cDYpGDk+yrNJ2NLG7N9Mjm0++3DKU/yTRLq6U2KwlxB5D0Ka3Hovb28RxZ8oN7XcPmmmwnXm59WGCr5eS4hzNNIxFWNVdCEYBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742404852; c=relaxed/simple;
	bh=DQF5V9LHw3PQy/pzIWp1lM9GbIAeMDyAxbwVzmU7RqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=O5t3kurvGT0iNfJDimckt+6R8v1vMX6EdUQi52L7CZ/chGCPF2D7+z5uEjod+NNAwTojHv2NKUbAoQEspD/7Zb9RrEpbIsX+4JEYAVzC4gaAJJ1cSLSD6yBwh3IzUYr2Ruvrjm5by2BQTnx2NhAN72IZwoYT9inm6aJgn7DwRcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cWlVQC1W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=f2swM4hc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cWlVQC1W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="f2swM4hc"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH0s09014441
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=VgTJfZjVdA3ulwbr94
	U1HpjaqQ4dJgGg7yTu2OWHPi0=; b=cWlVQC1W6aov6rhRS5XWEKvVpfqD4psLt8
	7ZA1NFTh03phLQ0R4+VbnRnFfTc0URysLj3ss9EISCdpHjdPrQnvnU3OLOfxXl6M
	VX1Tj+oi2Lahx4BJIaYIh1I8UxnxIEO2RiOZA1bSbUaWipk+BCsBEJt5IIw52EEE
	+vKusx7G/M9uOmIlRr4SRctFLaWIEqQsBF0i9osUAQtzVaykymtumg/j1rxgWdW8
	DrzWaELkcZfzVrFokMSrKbGNbKjKhzxgdCSu+cctfHGc8TD/oDHcaG4+uxhX5h4C
	2xESq7o2ZrZJ0yT2iKIOtIycx8KQpM4AXRIFck02/xsJWSEYGMOQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1s8v1du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:20:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JGg1gT023955
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:20:48 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxeh5ysr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:20:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdBKyE6wOvtzP0wxpBstH3g7dTVZEZfJDwYllPTqTYFqmMNSohODyAXegjUWh2m1JTigisG2BiNlZNJ116t8Pa3hHIS7320dBXzpzGfjFkeh+Q/XOWmv598tA30gJ3BXBG75/GFk0g8+aQk1vrjI3qPVNg8g//Tj/yuQ7cGQTiSRCM3gEx8K2ewH65vzN+S1tLoETok0/mUElfhqj1y9pU8Oku9/NyexIiwG2m/O+5yGph9QGJ5yrLR6ktaLkka3q1ygTvwZ08J8FO+gsxFO55DcIB1rh56g+cXvBN6YiUCdNqTvFWatxrmcgajcQJcwOpoSoo0u1pFUrDLDuyvA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgTJfZjVdA3ulwbr94U1HpjaqQ4dJgGg7yTu2OWHPi0=;
 b=ppev09Gbwq8ODf8PRvN/Tb4lFhi0fvf4qL+Kj5BnSWGhd+EULv+xvdzPq7YgGj+1A/re9WERIsMr2ad+8zCoPlPr22nxXMNpcFlgjyJ46busJph7gg5eXLI/KPUt9i3dGWhK/OOKTS+YSbQl+eBPM70P8argTB9faLhtyy3LVaHiqzrUG1RdeQiE6ihu9K4T/NlF/V2ASHVfHvg3Jm0i1dz4LuXF8h0wmR5LYfyp0JAvKo0uYZ93lv1y/FznZl7EWGp+DtwUdN0GjbkXIMXc/sS0jfSneQe979EP8rKzQwhcguVwbGNPa0PFlctmlgc9nA3cZ2uSUknktgZqPtdR8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgTJfZjVdA3ulwbr94U1HpjaqQ4dJgGg7yTu2OWHPi0=;
 b=f2swM4hc41KkN0k8nfY0s96P9NSEBTWJMFTHhnHfSGg/gW2L335ppNvfknYJBt6s5xXSZ5RqyS6uKd/VNzvFUyhjOIUbbju/y39YMbohhoiLfzbk305aPzLu7yQYWUX8/7GPFZqfA0hrRmRh1IOEkku9NhkVM/uGMtPt7ChoUVc=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB6390.namprd10.prod.outlook.com (2603:10b6:806:256::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 17:20:46 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 17:20:46 +0000
Date: Wed, 19 Mar 2025 13:20:43 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] dt_pid: pid grabs should be shortlived
Message-ID: <Z9r8614LF8chxLS_@kvh-deb-bpf.us.oracle.com>
References: <20250307144300.230034-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307144300.230034-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 294ed894-cbea-4872-bd66-08dd670a628f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yo/lHx50i00K6cPyvot3UbEOxOWrCBh/nM1atXDhsslxXtnEMLdOw+KMt7zs?=
 =?us-ascii?Q?ErvJ4qSuBUX/LgnvOHP52SVDql/gtXuUeRM0FD+tKTMs1J7qythOqLljWKdj?=
 =?us-ascii?Q?2TKQhh8RYaYlh7kfIk/5Dt/AKBuCEBuLdvRebD00rQYJC4m5J8pTfQ7HrgNP?=
 =?us-ascii?Q?7FjgzB7CdPkYZPSjV9ihHSO1x9A/oLEKUSyyc5in+y9HMJQ0j/CmNhnWgWXQ?=
 =?us-ascii?Q?GDLI+wrimuvKKLnwVE+KnH+AzarSsEjCvMJskIxb0S5bUzuDCgMYEIFMyTDk?=
 =?us-ascii?Q?Drk8WbOK2k8hRNH8ysJ0UZ3ReR9tAg3rdfUJvLTED4t0arHl6+GKEnKY6c6z?=
 =?us-ascii?Q?gR7+UZTdSsN5O6USiXrfFBE375UAtiV7YSJVA8Lz234uwQdgUwH5B7zniQZ8?=
 =?us-ascii?Q?LAE5ys/9JBLmOUmqUOunlAKZQhWslk2RMLVrrPT0pLXSiZcKilbLmgYZCXBU?=
 =?us-ascii?Q?gsdB8ze1C5UAceT524Cz0fcuzfGW8/kxvaZwlIzRJE8Q7cPnyNmsxulycGTt?=
 =?us-ascii?Q?Z4EPVf9Uj52ageTBH9l9fAl3t4xUepxPe2mfIbq6hFUecRImkiZGCKrDjPcm?=
 =?us-ascii?Q?MED9AbcRrq2nB9tU83UaLQkIKbVo8VZzFUMFCY4myc8VEq28hGpqM/DWZU7h?=
 =?us-ascii?Q?BAOURfxMCxxyhrcPDw1rxVqYgqQgChdMwrO/x9cII8+BPuH2PG+wfPAU3Iws?=
 =?us-ascii?Q?pV4HDch842DEpu2r3+Nbc5PmAkf834dv3m7FiAt98IImGI1eTrvKLi3m8zPD?=
 =?us-ascii?Q?s1Rjity9QhF8UXMWQb4FqprvHLIncERx3LVbqGuqAsGroFSvp/CIAJ+vkfYk?=
 =?us-ascii?Q?L+ZxWTshtRTY4nqxjn6SnNKVNAcxyoBBvP1rW/3n/4rtdRsEwtu5VxIxpT5E?=
 =?us-ascii?Q?4ajOoF4W39NGDR7HxkM4Z2x+sOh1nla+zIn5a7lq63W0MXFYFo04y/L6s5Dx?=
 =?us-ascii?Q?tBISD0lbTNG1Zrdwk6AxuBvr5J5w/clr0xLw8FD7hbZws1jJNrFU0gpRNIcW?=
 =?us-ascii?Q?O3SjUhg8QvfNLH068oQqrg9fGpuGuiEbO11ZoMVv305BVYBN0/R6caqnWTIV?=
 =?us-ascii?Q?n8wgB2NCeIph5vvX/H7hyFc6uyZ9BDJ3BlGU98YumdbBLmPJ5zPiXQ1ndfII?=
 =?us-ascii?Q?MQI3A8xK3XiwhXwerHwpjcdDowUPBH6uqybIg3Yuv3X3fo76fB8zGyKez7vV?=
 =?us-ascii?Q?uQlbJ2GgcBg3WDZW0HTqi0shzITChdUFfEd2Dj9lgmCbK0JwhxQWBgO18BWX?=
 =?us-ascii?Q?Fi5iNCvALSRnJ2o5AYV7DUyDRFwUZK1S9EdRU24mSD1tK2W0CiDlrZf/ZrSw?=
 =?us-ascii?Q?xp8OM5mhnI4Oza56W/TErpTIIL1hV12AcoYzYOYS8lu6Ag+ZI5P+Y5GPkHd8?=
 =?us-ascii?Q?uSmDmZJ3UTDnQv7othb6mJjo/aF9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xicNqX/jrVVvK56RHBGlRUIsI4KGiCM4QNb0tz0cT8jZUC/yF9q/uJS/ru84?=
 =?us-ascii?Q?pS0BwqpsP7vAgvAUTxJzdAn0ZJBx/kjj6j6G+NdmX7zzy08SD5e+bq8DukYC?=
 =?us-ascii?Q?0s4EWpMdB3gYgyjaGHcKPZ0NxqSWOQFZDMCGKmcJFT8tfCwC8O94ecrdYzU0?=
 =?us-ascii?Q?jLA/9lXGyg8P2eSqdfRIHukv93J7R6Ibt/fdBQbPL5DwKrz7PC/QgjS58ccY?=
 =?us-ascii?Q?voVT36m0My/YToMi2wATJJdcMSOWAi6YMyNS9ar8dlthcxAYJ4DD36TXsbbV?=
 =?us-ascii?Q?E3L7E9190sO9dawePQvLPEaGi8pV96rtVvS00TVuzrZwO5q2cePQ2chtw8dF?=
 =?us-ascii?Q?zGW4Z7XIXw0nvQotdKZNoD7VtSXKNhir8E7Y/ukjMetEKjz2uXPldDlb+Pn1?=
 =?us-ascii?Q?g9curodgVsb9qNgxrohbMmm20Y1xAzcxmkqzt7+2JQ5mF5ziw2QrrJeif5Cd?=
 =?us-ascii?Q?bh9Wu0VxoieoGGtOYexHq2c/gT1DZr7qZmcuV4oi17DbG4f59j4McqTx3C3q?=
 =?us-ascii?Q?zEdf2fQGejy/OPYBzyi9TZmgv3v0UC4ZNnWsFiAEQzROS7/+iJ2q4DP4E0ar?=
 =?us-ascii?Q?fscZg3rrn5g6hPx0SQD76QJf/ozz1abgUviU6Jnr5c6WP2HRvX5sia/eBXup?=
 =?us-ascii?Q?qlhZ4plL4vcoc43fyg0A7MoZPtTZlg5H+meKJ7LfH/4DRRxtu9PnvcQEXVGa?=
 =?us-ascii?Q?hWwvhl4L1RAnt+3ogcNRHcXiRo7vC8b05Z9zAjtRYtmLngyxsJX+a0QvMTJ3?=
 =?us-ascii?Q?j9OK/xGqEw2WAw2cEAce2mCbHCqa9Yz/MNIGB61cJrWBp0M4WLYZVkoT2K0+?=
 =?us-ascii?Q?TPoBKA1fQAQjku6BrOOEmp+YqMBK0DsEWax33hFnh/z6akKK4X+jRyP48Sbz?=
 =?us-ascii?Q?n4JrpHnkiKzlc/jiGG8Ec9QiOVH7ix/jetwmRtuhgWcn0QfxDNwhaYoXSRVH?=
 =?us-ascii?Q?L35kYUjComIfUTYnpbJ8zn/OqffL4bglduZ995bdniJ0ALuZEOh+hGRToi7z?=
 =?us-ascii?Q?Mvvsx9owtlzgzWtr+EpeowMrR7JWrd/eWWLZCl2VLQnF/bHRIpPI6m26hWI8?=
 =?us-ascii?Q?zQ8unOPkLT/UXKncMxqjlqfpovkNeCHas1DYoyqoLXdd+q+ngQRR0VjToUVc?=
 =?us-ascii?Q?00W0/h2SA/v84GBLqRhr+4BeWgkFXMzQr2LMaJ6GmY5U9j99mQk2RbVSWquT?=
 =?us-ascii?Q?VnIte5tOazA8djELPON1aaL4/F7dp3dPwEya0NmsYj1Of02/WIK94ru0NoDK?=
 =?us-ascii?Q?ChhnBF3l2W3fB/K8SuuL8wI82I1Z4U2+yOIm1iC0LzsUNjS0EBV8EBcnYCRN?=
 =?us-ascii?Q?Kv0dyrD2kJHM1MGfzAkn0oZ2KRGK/W4rnfUXExUk5RQFlOTVH2T/D1Mn6Bwp?=
 =?us-ascii?Q?KmY3Kjf634PDyZnfMYIlX8/D/uW3f0iQoQar/TrHRYRHQ05tmkQLUYrs5z0c?=
 =?us-ascii?Q?IXZJIGgBOds76FtE1EjhTkbVgTK1kb77DrRoD6PWiS34lTvADZzHmCi5T3ux?=
 =?us-ascii?Q?IAFNg7oWMlmUbTLiSqWqqy1zzkngpOfLPceE2vZWozHwJkzMuaU+1he2plkK?=
 =?us-ascii?Q?n98me6Zncpo2dHJsyOTL8TeuQSeEE4GnlKmjabRwIuik4viFW4CPdArbtKg8?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xxt3G7Rd+vt1JSZLFu57l9byT4p2CaKGGl36SipQKbXLOCcJcwQB2qepY61qdC8Q9FxjIZy2Cu2OwPjyQP40gKc9GftzKD+lrxR9RVFI7atITch9J3HaIp3zVIxJvqWo1cTX2MiAIA6OHWIw7a9kcSveHofrJiLqCJ/htLX0g818H9KBgGnphmvHk9fm4LC9Ux8a6aeGtTXOwwkZFAD1pBeGUiU6oo2HBW0GEr2nyAmEKutSFc7kzZepuMoS/kwSX1pWo4DYb3M0iInW+wHpAM0+sdhLxb3yzJLKLWOx62SbftQd0BC5Mv1Wjj2ZhVV/dyryhVOsmILXXztaT0wraco+8fo3uuCTMqTmi4R5cgVSeShs5QwkeuJJJc3zqxCGznImDSkfayJnX4zhbbiav7EWIdodoedk2KQEBXZVx68xMbA931BWbSuAbpxG8DbdTHq3wimKr4ySsHxKjR96r33Klp2TKb32NA80k32Y5ZeKASP+yOHJp2/R1qplVnK+eVr0B5mf6awObvrt0iX3qlVT2WOkzYaljMnFWhdyiXxjuFMIbJhXC9+beoFpovFbp+C91BC5Z57h78ESbJZADTxKMyRstBrH6UR3BrGFASA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294ed894-cbea-4872-bd66-08dd670a628f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:20:45.8855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h66tl8+9t4n3LVWxyW22+f/jPU+nyfYCTTeDIfd69njDeaY9uWUSjOQqzYes2XIN08HbUH9GOUAsmlIbKze8PVac5yhd5u5o5fspYT9RqFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6390
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190117
X-Proofpoint-ORIG-GUID: iVzCF4kusCdX5uDX49Vb241B78f_mj4X
X-Proofpoint-GUID: iVzCF4kusCdX5uDX49Vb241B78f_mj4X

On Fri, Mar 07, 2025 at 02:43:00PM +0000, Nick Alcock wrote:
> If we use long-lived grabs for this, we are requiring that the process is
> ptraceable, and thus preventing pid tracing of system daemons, init,
> processes already being debugged or traced by others, etc.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... with minor indentation fixes to make it more similar to the other
    instacne already in the code.

> ---
>  libdtrace/dt_pid.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 76608f6904fee..4135c3ea656ec 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1243,7 +1243,8 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
>  		return 0;
>  
>  	/* Grab the process. */
> -	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
> +	if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING
> +		    | DTRACE_PROC_SHORTLIVED) < 0) {
>  		dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
>  		    "failed to grab process %d", (int)pid);
>  		return -1;
> 
> base-commit: 39a5e0a8866b38679619fa357bb3082bc245aada
> -- 
> 2.48.1.283.g18c60a128c
> 
> 
