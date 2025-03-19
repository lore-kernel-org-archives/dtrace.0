Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEECD1DF256
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742406435; cv=fail; b=VsW00BobZwoN/Izb+f67MtVrhCIEn6WdBd+IOBy4kz62hMeOY7GNmjU0FsCUOMeAIaM4o1bwtYosxps1vAKc7lJrCqAbCMzQAps+QpuX4DcYkM2y0H986+iuIsM0P2S1DkJYiwXeV7xAQYrD8kAAB+tWMClkxmfTbGVlqrd/2es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742406435; c=relaxed/simple;
	bh=54oWpaNR3PNLqjH1knmIkTtWVPxcxyqrY4EGfSHQcPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r8vrJHlIQ0BZdn2/VsW6pp+twZRJxcLbiKbfsTDN/xMVDNRAQzufyUNhfjc/3cOIz+PjgDzl81jemm/SWscijRPjqkySfIsexR+Z6hEercN8K0UFpvbZ7WaZiU4IISJqmTvhw3yJI5hwy+jdlmpv6C52x6YWOtw0nMMhTGMKIHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cJ2LR8W7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WlFsZmma; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cJ2LR8W7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WlFsZmma"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH0o8c005989
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=KW+zyhCr4RG697fgfl
	a3couDb0hWwV/EwrvzesjjAn4=; b=cJ2LR8W7AXSyMpxlBO5whH38vmXyj/BxCK
	txrzZO8BvlKaI7A1IyZ7ZbkEgLFb1MeXLKJv+qlXGh/4SXDrqZUeqgDuQzCsIqnj
	HONAf9P+AJHjqeK0AdspYL/3G3np18+wDyy0gCskXlIOtPsGTgMwzhKQ/+heLXzM
	ZWy+c/5m9npE/x1uvAVxIyJqRztJsTPnMMsZMqQrCchsPgrYnWaFPj3pxE44x8U2
	gonyJN4mAXDj6hzQd1ztd9/ojkcp7qENhAYaMroOsYqeaqaoPZ8mwADKsH+bQlz1
	oyRbGTwTFOSi0TvSqoJcxBx5ZJ54sbTbTk/ZaHABzWFuLfXywVdg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kbbypj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:47:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JHeNAK022498
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:47:11 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxeh704r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:47:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoQ3GIIi9CkQJLpLU8lUqponoXVSTELVX7QrOoHQd6kJ8mmiGJe4l/+gIv4b4trdElnNzOS/QhR3XDdQxabElZWc7OJIs3QQghh97ZymMkCs3i38BAAqbOo5dk/1eeTjH/8zmrHA+UKYOqWA1A1AH7UdKCR6Ypb1t72rjQagJ/acmMPxWQvRIxGnc/quu+2P5tcYi2grQfE6KqGig5ZLH8OqX1mPIBuVAC8DT9tojskcFli109lZUk4WB30BqIdpZsLF/wClSNbHJO3u0xl41KzB8aq6X55lEYfCPT+P4cytCRFMP2FU/lciFNLt+8ZBeIwMvmYzx7lkpTw2Ap4tFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KW+zyhCr4RG697fgfla3couDb0hWwV/EwrvzesjjAn4=;
 b=vVfSrnFaRppb1B/op88L58c0F12yykWuKJBU0CQ9v6AQxyeIYAg+KXpwF4pcbK1AhJjqtXtJii4whbCrorIKTMHc2cVNAkkw0q3RShEXnvVFL2o0Zv3qKmry5Zfqsmnkl5Ziqb3tX4LkU4ZyBzi4nlvNTRPBSHKk9SW/39ZQwPGWFQDubA/K6suGgol1yC8dKWOWMQAZXLxVuLtswB683JRzx2PkcolKGC6XGO83DJtsxE24o4+8qitfPlH5Fx9N+kDxOetlj4ZWDof764Exzkb7Yli9L4M9DwfCfmE+U7g8M3PczidKxO2WItC8E8LE9AGcxE4RAeP35Vd2EF7yZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KW+zyhCr4RG697fgfla3couDb0hWwV/EwrvzesjjAn4=;
 b=WlFsZmmaZv1EGmBsDZhh2v+ivWQ0PbsEgGAeAnGWTsByjZOFuhpiDk5KHRxfIGBIeIl+D36CuUqkARd6h3ApMJ71toAxBAoNv+P6mRTFYnXFZXRTMlwXKMnUUnnR00OqEliCimZSyLRv4Y1PCu7W8jHMJP/PY/UA94t3Isx9lbw=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SJ0PR10MB5765.namprd10.prod.outlook.com (2603:10b6:a03:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 17:47:07 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 17:47:07 +0000
Date: Wed, 19 Mar 2025 13:47:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Allow duplicate lines for rawfbt synthetic tests
Message-ID: <Z9sDGZvfbesX2728@oracle.com>
References: <20250319174225.2203-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319174225.2203-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SJ0PR10MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1ada6c-5e93-4554-e027-08dd670e1171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e22M1kIBxPUvb87P5FO6uHK5IebYcwbxmdwdACOhPYzBCYKYAjR7LjXoYbtd?=
 =?us-ascii?Q?PAkjqHACp9jUsUij+rvr7YXkMIPoVf96ZqbiwT9Yjm33wDq2D67pqMJzTrfI?=
 =?us-ascii?Q?mEGR4Ogy4gmYUQQSE8GbOJtWLgueRcREqPxmHy9VfVPkoXtLOF7w3pOy/Zg6?=
 =?us-ascii?Q?Vi9pXhfjXZk+kdcZbv0Zwf8XeL7Zn29rGglPXs4vOHsOXbPPCnCTr9VQoX8p?=
 =?us-ascii?Q?ftSDVNCAwLtW9ZHiCqyhfjDyCAvkGT97OQxwentGcV+/HbMQFzkAxWLuwCuE?=
 =?us-ascii?Q?p88E580BLkoFqqLDdzha/kxJ0m7c+billMdpb8K+eQ3AhoEnaHYIZhnM5Kk0?=
 =?us-ascii?Q?IUT8FD6U/jbfQ4bWGd+FonmHarufPHHYbNYWlREH5w1potd+eAM7QrY+6Fz4?=
 =?us-ascii?Q?sUDoh4+FIpd3vqjOiRncnlzm/A52B98SUIJ5DHD5vX+mF9228Z5h3HOxxZPa?=
 =?us-ascii?Q?x0E2Ee7aRD6I1RUXxcyKbIVprRfsAGA2s+n4ZDMVr+m/tmdXlQpkCtfjB72o?=
 =?us-ascii?Q?5xlMsk/9LVq/Ac/Yvs+GghivTirBH0XSUSlgysGhTbLJiuWMm5hihjvPlCVh?=
 =?us-ascii?Q?uADJY/uaCKqOie/kCKGNuZOMbJ4OS0NtQIeWCjeFonLOlNKujat0WOUFQWRP?=
 =?us-ascii?Q?3eSPQWl4wXpGf455cGa+yIpys5xlXIIHUs0zKP2jLQB1nfY8jdfBcaZon9Ik?=
 =?us-ascii?Q?06FHseMfcxOTr5581Pzs7EfaVxb8JTr7ShREMc3tOB+v9P2V+z9KxPPqZN6B?=
 =?us-ascii?Q?7ieVOQ+vnVZqFcFyktDPV1cYDJ7HSAvt7qurYjxx3nPhg5aEMTFhuEnR6nVE?=
 =?us-ascii?Q?J6txpkmM2jmFLoMAozFjg9ORyaBWRINEe3fCAcvhw2d9knLj4ucdBchrIlrj?=
 =?us-ascii?Q?OVDzZQHDy8YRUZ6VitEYQqtFNZImB/7QefJXaPepEb+c/T47aKF0/QR7wkTh?=
 =?us-ascii?Q?50Qk/US/pcl1pKjSiCNygf3ix/Va9jcPIeQReq5PQNjrb/VeyKAL2H0rPJT3?=
 =?us-ascii?Q?w69rThMBGDbl8bq7ZSp3a60N+tpApdpwVR3s4WMpUGl50+08bHzrRl5iCHdF?=
 =?us-ascii?Q?d2N3tWyAeKm8CgRmwKRKkoiTQkRLlFzYtfLpaJUqrwiC5t3vppCnK/tkjpbw?=
 =?us-ascii?Q?1TSn3ZG0yJxyn2Otr701FBL53fckrgaGQuVWavkqXuURSBk4lIzGSUllsvQD?=
 =?us-ascii?Q?wpADpBHjpI7xa1PQdv9a5UtAz9YUhstCQIB1yPUHoP9IJZKzJ+rCLGEYG8wo?=
 =?us-ascii?Q?pi2iGvq9mrOC/IQgg4Edmby+siYhK9NIgl5lmyV7O+NNK4HLuMpPJMdvBHo4?=
 =?us-ascii?Q?/XXXGIdyqDDYJ/d/ZBL86+ij43ji/UnrSmr9pJcgqDly03CJpk2V84wvUX3g?=
 =?us-ascii?Q?b+g1OjQh39zw82+oU5zzk65t2qjx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AnICh35orrZ/US/o+AKKO/ukWlYICfokjGu3ET5/5HUAhPqPnEkacYX1Fu4I?=
 =?us-ascii?Q?Ubepu7zr5RlDhKriSDBg9pbUR+1Cw06pvjY6nS2vyMtAcSUAgK6eyNRoMIx9?=
 =?us-ascii?Q?GRUFWPPMa1yx+0ankJNKbIg57YC6CL3RGRGkxaKjhV930D9VMptJLMVn7PcN?=
 =?us-ascii?Q?0/9wusTB++QnFR7TW9m+u3ufxEAhVLguym4n+V50FLxpB/LaFQnr4DS8tKOb?=
 =?us-ascii?Q?5QOE4r46XTtLvYT7XylSp+cGpDq7twQmVJY6NKL7MF3fwWFbinULinTfmSMY?=
 =?us-ascii?Q?BrxuYr5tmIt0CntuaZAyCgCUZLaIgZbxREL922ZYDq9GDfoUcURiAO403NoF?=
 =?us-ascii?Q?BsdeUUahn/yaRcvtlfYfhTdXOQaVlfJA29GxTG01Ng6sf1stF/68kK53VE+k?=
 =?us-ascii?Q?gkHMzR8RUpjBZfNiJcoSbUCq9SzOAVo3icaYPJ3Xqyh6in+8GrGTPcQfT8Ds?=
 =?us-ascii?Q?M79vT4uTXoEFK2m0TXzCI9RPHRlkwp6hcJEw+aktgbGThBCOsUgg8V0nhL0R?=
 =?us-ascii?Q?Kyr14GXmN8sWY8XPMHxQbl8/0DGOrHmrQj87I+dwqN89g3S6i3QHPPB2ptAt?=
 =?us-ascii?Q?KRFOssXW6EymQLdMOWNj/I3i0woID0Wc9VeketOTEalrGDmvlvwAKcNs30nm?=
 =?us-ascii?Q?RpI1GW2Y1UMuL5u7tKQjCv3OHx5SDqY/8LkMgB5UKL4ELsMXNII73jBKbDFA?=
 =?us-ascii?Q?CTM6BNI1APEsltD4EnpnpUOR4NicaD8Mn3p7AY93eXIOb1e7JWjcCpBOUyu+?=
 =?us-ascii?Q?yEzf55Ae/V6Ggf99ZnmI2vHrtp+6P7EyUfRHaRin6C0gb4WyD3UvR6MO92VT?=
 =?us-ascii?Q?j+iwVvokBDgBSrkEhiYCDER9mQE/YI199QzFC3tltP6iC74rqvarJ3aBWa1N?=
 =?us-ascii?Q?SKb1rWu0iVFc83L8XD/9W11MoCDHj73cX1Z0OCjO63eW7PJ63Dr7zLeRk/+u?=
 =?us-ascii?Q?1HgahZB9LOjmlM++H1coRSVQBjD6Ba5GNH/X0J0n2wGf/CS/oKKC/k0ZlmOs?=
 =?us-ascii?Q?1j1n0TFSIvsDC5Tik9fpsPI014kZFRzmI7beWkt9hEbjxVBRPLruTWKft6aV?=
 =?us-ascii?Q?DMOnbfmCrZw3q0GFOJlKhbTlwEn0+Lq6143s8PaEpivJaRz8klzjzMgt2jEF?=
 =?us-ascii?Q?AXS7VFeF8NTY0Lq/XqetGyWIStYwl2fguBtABXqvphJh9DHzp+DiC5xLGQLk?=
 =?us-ascii?Q?ddC/ms1djub91Z4R8MrnIu97Qj9naCqVVHR2jmORPM/Fe/PfuuC1/Mx1lYMR?=
 =?us-ascii?Q?3EjtYctY4R0yNwRl+4wLf5gCZec+DUoE3TrBXMU7QdovHtuBsYWH2uddPur7?=
 =?us-ascii?Q?Zn+Hqn/vouQPwIv1svTEZXoIv0VLNfFIs9co0UWbvGWDhm7JMgCvhvdTHvsp?=
 =?us-ascii?Q?H+tWoYMckqlD6sX5ib28QIEb2vyz2dx6zRG8B8XjoPkuFvfT8ooTwHNdkXNw?=
 =?us-ascii?Q?cuaUweFk/+vOoJN70CKF1oTHt0nM23miKcP3DOJ+MmqOjJ3IJe3C0uIMQiL5?=
 =?us-ascii?Q?9v+yFwIjBteXsiuVS8IGzeph2OsiZI68vL7OYiXxQh3gYqFk6iyUv4VeruTw?=
 =?us-ascii?Q?KW0lvED7e+CEeKqzNzwYa9DKpS16cHnqD1+999jB1D6QZnUf5vPigdRzdDHR?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gf7NFVasyyV6ZOUD+RB0efP5jRW56CgqdjQzE6A4VivHISif1qCVvGpUSht1m8rBK43AdWxmvaDYxAZIQcdJzNcKsdVxtLTUPobPgWGmMg1zAG/9PwlzhA7ZszRdM8B01gBHO52OlrG/kVZv75xiIdZMtJRMcS5fr7n1sQDEsgQb9cm2SBViuizX0dGnvFB1uCwwRZgHuTHUL8949Hiha9cMvpDIeJgM1BqLUAPwETI4Gs+eIxHILeUKrvE0e2SlBIZBIqc7W6DEX1g/SZqgstDrSqfoRMGxNdnf731d1RuvCeiY0LLlieiwV+iH72UpM+XjX8lJPVRps8jQhPjxDDpt5Qvm7gUvrSmVMC0fi0+dGmzD+2Hu9aONL7EeEiAIjJIzBA8eFny2Nhlosy/gZxvvJXu5RiHm8zzk6lOdrDWXv6Vbq6ofNZMHbQGVuA5szSWehBRcaWFO12+//1EOkGTxJ6bbC+SPFrQwGgoJX+uXrBy65omWLiutKbxZ9ZbXYYqAmT+pxB4r+/EAjw5makZKQQWUCzqn81n9iekFrIbD2TbpCBMD1/xLVv/pSaL9sj+QUEBawf6VK5gdExsM+VYIu2tMLcSeVAncwicFfjQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1ada6c-5e93-4554-e027-08dd670e1171
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:47:07.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hT0Wm8gSIzBIPir6+bFUl9UDnq350NR7yIy9Dp11lpGlRjEDaAI/tysj63oaiEF8OQgCm1p8lM7sJdI6yUL3p1FAFLk/ZBf3jyr/wAY2XmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5765
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190120
X-Proofpoint-GUID: 5BYcsC3-kiqUhXzFol6Wl9ftBEXozBsw
X-Proofpoint-ORIG-GUID: 5BYcsC3-kiqUhXzFol6Wl9ftBEXozBsw

On Wed, Mar 19, 2025 at 01:42:25PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> It is possible for the probe in these tests to fire "concurrently"
> on multiple CPUs, leading to duplicate lines of output.  Add
> post processing to reduce multiple lines of duplicate output.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/providers/rawfbt/tst.synthetic-entry.r.p  | 3 +++
>  test/unittest/providers/rawfbt/tst.synthetic-return.r.p | 3 +++
>  2 files changed, 6 insertions(+)
>  create mode 100755 test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
>  create mode 100755 test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> 
> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> new file mode 100755
> index 000000000..18171f044
> --- /dev/null
> +++ b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +uniq
> diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> new file mode 100755
> index 000000000..18171f044
> --- /dev/null
> +++ b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +uniq
> -- 
> 2.43.5
> 
