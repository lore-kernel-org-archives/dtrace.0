Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78389224F3
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760382954; cv=fail; b=I5ZzLL2uhNqsM84OIUOnjr8F+B9Ln5oA6LxNUMkrQ+P7ue18J0iFOZyTuJrrmUiLZYpidfXbsIT52dS7a+2UcWd05g2TwAPsZxtR0AV/jnq6Vmavx365G6kC9xiMnkr/ORuT+gWTUy8FvaKZjOZEHGguNXSDmJn7roDmvtFyvzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760382954; c=relaxed/simple;
	bh=SIOU6EnPXWRvq1K3SNsjDqmH5jN4O2LmtgopNsxVo2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ne8PAZJdgHG41OhNQV5FwWL9N2I+cDCGzGICgJ74XgA4OQV/g1q0AD35Eg4BuYFIkxAoYClldNNCL9hZ1R6EgP0PQS9RVDNpI4kvT7oX+V1iKQx6LGgXpjW8td5EVeRJHcMhaIBRx5SSgypkhK0vOspfT0H1rbukTN+U/64wCEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cZl37P8h; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W9HsKflI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cZl37P8h";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W9HsKflI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DFu7Ke015609
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Tz5WtwCsS/m23rF9AW
	uk/6AEnDVzs14tD62esgRyCiQ=; b=cZl37P8h+gUTnhj1C24AtMcgwOxQ9amvqN
	UArfq6b9Iz7ngDgDRIprzFVB1DA2LI7SdbEwKUP9xRuukVtYVHDar/0U4yGtsLvR
	j57DJ6V0/XL0aQeaaFZvE9GfNi7fin3+a92sLlLUusZOcwItuVQrxp3JMS4lcs3X
	T7yYGyTtYgzQd3L9k0FJ9NG1mF/vsou+444BbaRTkhvmFGdRjGaSmnhJhrsHsToz
	A2i0lu2dzF0ScnD+Jgu6rKUz1XhdvWDjMCqHJKSFf1oFTqLCxZejZQ3dXNTVwB6/
	5gy0IGhiWSx4ClujS1OES/+yeRbPFeo/yVJxakKuQhKjq03tRbQg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qdnc2wqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59DJ8wUp018310
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:44 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012060.outbound.protection.outlook.com [40.107.209.60])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp7qf0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 13 Oct 2025 19:15:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaZ/jcsAXhg8tKgJReH8IGqKADonfYXtdboxxVQyLaln5b+kghJoaS9ZyiV/UnkDN56EkPdhDHw9eREZBcjfjY2w/Zd3gZcQilaACsNmYsHpxzlRffVZydmk7f1lxGAD0A5DOFU+v6USIFtvRZVTU+SQId5cIXS892/6uAqNtSZ695nZmoI0EiLNBiLRvc3/2l7ElFdM6XR9nYIQqJhZ6AP58P8TRv5VtZbHOYe0hfxb9CGjMs4fao/AWqY/ua+XjvTZKtvcZ9Q0tJKypN/R0QSBIt4lgNV1onPAjE3OpsjXoa2O9Cr+Jven5zLEkaIQ47FNKkDSTnYd9eJ+j0QzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tz5WtwCsS/m23rF9AWuk/6AEnDVzs14tD62esgRyCiQ=;
 b=Q/UjaDZPyOlb52tUmyvNXsV2Rvku1Jz/is3X0QxEa6UVNlzNlOyI06Cy36xhZGiOa8whyXU6rjw8qmOiRvAGI7ojI1Cvh58n0PTZDRMeL5QggLfObZEsqXkRw+tCslJXqO8roHDJ0mCCR2wYtL518HojgLXUtNDFcGFFO/rYmH0edwi1dtZyQs2fLtFYxr5o4L+AT7BHFc6ChcQxblryc6fwkECkjcZhZmVFnwrxbChJol0HL9wSq1yCdgdQr3a/vQXUau7jTLlMnpsQmQWBd4Km61//slOOHdgMu0opPNlU5fySpl+WMNqJlj/IR622d2C+CDsGxWNmDLsmlxOwVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz5WtwCsS/m23rF9AWuk/6AEnDVzs14tD62esgRyCiQ=;
 b=W9HsKflIeN6MC1rCUjpmviIaBZR4ikS7a/zmEBefnULRzOxsbic7vzTXWGm7EG6IFfSGOBbiYGQ2E3KU4qYU1Uy6Xng3fKFd0WUojqIs3hixDLkOPtOccY3U9eI7bt7PyXxS5sdNIk4a+ES9B5aY8iDZ2i94vs2BM9pnC92A/lI=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by BLAPR10MB5028.namprd10.prod.outlook.com (2603:10b6:208:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 19:15:40 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Mon, 13 Oct 2025
 19:15:40 +0000
Date: Mon, 13 Oct 2025 15:15:37 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] doc: Add rudimentary documentation for using [u]stack as
 a value
Message-ID: <aO1P2VL5uBj0rMCm@oracle.com>
References: <20251010033337.4397-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010033337.4397-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|BLAPR10MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d15b7c-b07f-4143-28a4-08de0a8ce5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zjLCDpCWSwWLDtXFWjbjkhsfAyvY2mSgg5dzPb8s8gBN5yFe6SjbOmCe4Wq6?=
 =?us-ascii?Q?zmEUeEQoxn22C5QXNXjlmqJeKrEmG5D2t4Q60AoKXjtQ7ahUCjO25PYq+d5+?=
 =?us-ascii?Q?zAkyLI+OqkOPkys2h0CQpXpx/vKnk1VBBhPAMoJub8DgUA1HL22QCLXHqPUH?=
 =?us-ascii?Q?1O8XB4/Z1maHm/v41orIsNu28C9mMsHPrKyqEtvlOe6nmLYYShyrTsHAMFQC?=
 =?us-ascii?Q?jGZ3REITwtVOz2GtioBNCIUYWFudJBWNlYN1h8kX+3OnFqv9+Tuu5A+n9HdQ?=
 =?us-ascii?Q?eWUG1tPIXSvofUMHhqWFgih9/96XwZ8QVHtIyX+TlIah8s0kWsHHGVY0z5EY?=
 =?us-ascii?Q?7EKSpaHyhE2oZH3x3H9jlO48UV1ZR8AHp09WfxuPlH2F0jq9ts/s89J5+s/N?=
 =?us-ascii?Q?SposGa+kLMgIrou0+Vmn3lU3lURlB/L1iOiOsNjHgGYA4jYQ/xYdHDuBRqX1?=
 =?us-ascii?Q?FxjPSQgSoUe6fKW8PeE2SKUObrdZ0DS0/d1RAo7iqbepVhlst/O1LKEWs+M1?=
 =?us-ascii?Q?FxYwsQYRzVZ5Qwz547zJn9VKcAgesfPhzCGxLQYcKftOJE2kV0fAKRR2p80A?=
 =?us-ascii?Q?V7jAFAl/4YvGRCNrOFc4sw60E3KegsL43RVJ0hz26juaPsMXkfpdAYf6P6He?=
 =?us-ascii?Q?0ZzVsWLrYq2rQEO1FDDtPGmO4uko3gCu72d/ct8tD7c1g1+t7UFEEERGUqN4?=
 =?us-ascii?Q?+ouv6bgNBOQ0gsrsj2b6lkkOHRNNX6/JknaJwkGxJCh3ZcBNtyEn3KhA7ark?=
 =?us-ascii?Q?X6o67VKMsm/MGB1lQrV2uNISJaXCvIweKbAXDUA9aU2ZH8RO9Rp3uO3I58YB?=
 =?us-ascii?Q?6TVSoAWZbhRzfIiF7sHYFjAQ62PKOWqNvYBiTzya3VdQ0fyzxR2xOXiN5kX4?=
 =?us-ascii?Q?AOHGMjaq/7TOPYAMSVqOuV8MSSaprvpE+luVtqmik530rkVN7Yf2664Dz8NH?=
 =?us-ascii?Q?uwTs4apUVbBFpV9XQ7qVeI4/45qB/iDGeQgiHbrjhH2xeSCOIbjXU/FjmVe3?=
 =?us-ascii?Q?V+7sCN/k5cjebdNVnu5U+tmCVwjfPlFVl0CatkCTFCXkhC6UBinM3K7Dxv3M?=
 =?us-ascii?Q?gmhezwrS7AYj3896xsRDl3Nb5gRgo00r7DBTM96HtpY6lXZqZLwfG/UC9x6l?=
 =?us-ascii?Q?6G84pN0FXzTYQT0i3DqUDu90K3Vy0CNtr1+Irap0Zea+J8wqkwTga0OvcG73?=
 =?us-ascii?Q?EsRr+BE/2emjFBBFK1UO5F+V6Bkjnoi+bWYtaWS3boDZ5kJ+E6M19YK/TZ1+?=
 =?us-ascii?Q?0Jf7XjqWOOrqSFznvJN3BrfiznAU3fMf6XtKy2pyctr7IwntUzLdVp3ZyL7x?=
 =?us-ascii?Q?tWJTOAS/Y2Od3vyx2Eg8j3qi1le0WqZTHW4U+YiDILd1jl7pFNlRHJzpRg8i?=
 =?us-ascii?Q?iLWSSXd3JaOY3rQiJdr9ILM6CyV8+xRPybVEUOIj8ad80OVU6fyP8xQ5UKPQ?=
 =?us-ascii?Q?5Gfy3QbGjLx3Kg4hpWaQrZYthEFByT1s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B2h+EblCtNn0B+XBDzh7/Lx1u5YL7oRrlfkilbaPaBVbE7xH8CJuFWsYwKa9?=
 =?us-ascii?Q?cNgkEhSVZds08AQUQopTbnwjOi6smIQS2a3GgVhwbf8kRoOMoUch4b0patLj?=
 =?us-ascii?Q?RjZM5/pgUXpk/+CPbSXJG2HguE/Mjbr879FvG5AHTiaLnlVGS1Vb0jIm0Hmu?=
 =?us-ascii?Q?pHnll+mFOuBbn3vkm6HMUCOeGjCFJJTX0jvNgRbcgDKfnYM487SVZcUcLo1K?=
 =?us-ascii?Q?owx8+ah+cU6CurY/5bbFKLFUlLkJoeNbSodEEyHLMTCrWbqkymlmkwTVqgN+?=
 =?us-ascii?Q?WgrOq25fKL/8yKSWMqXLkBo4FIT18GTqrBnrZhjnNTsSVeRAwu0cb5Aw7aWi?=
 =?us-ascii?Q?esYQtkMy/hCGPVMImbMtccsagOkDSyCA5oloUWLQiZTPYqJCXFKsFkm8qGC0?=
 =?us-ascii?Q?Xjgac248eJqK6waaTxyn7C29p2+9JfnnnAghywM8f80Nz3AiaMjmYoMJUcB+?=
 =?us-ascii?Q?3e0Kq6s0dpHk/yZFixTpzV+Se54n0jQeb8qWvUfshD6ToGt9DIOhx91niVNs?=
 =?us-ascii?Q?XoGRFIAwZAyjjYSL7/KecyVKqOFjGAIbeZfAiO1fOrU2NGx6u2BqhMD7UUna?=
 =?us-ascii?Q?A16KpZ9tmOSp24wQrDA3G+WJHG1ALrCCfDoNrHAZXbNWbk1VPypKtnA8kcyr?=
 =?us-ascii?Q?RhDmvYdKInBsFuVwtZi8Heto/HICtx1vigKZFILx91vujAZtlHH0LuOU6hhT?=
 =?us-ascii?Q?w4pJRU9bBJlswr3qXFrNna+X/APjZzBypVtO67QreTj15BcOMmhJRGFkpuBX?=
 =?us-ascii?Q?sKASKYDBWltvy9KlC4wi4k02GyVASnUNsGJF0DR6B3YGmg5AxPOA0uZx+vBj?=
 =?us-ascii?Q?5ukVFWf7/sJVB5vjZ3lcVyu3QoqP2jEZEBgEmkkDF29iOSZVIr/TEpLfAZrl?=
 =?us-ascii?Q?k4PjGvNQN9UlxL1HoVXuymNO6USnA3ZU3e6GdPK/RhxUcKLLNwMobtzNxbi5?=
 =?us-ascii?Q?VsyyK6cdZA4NW/IzxLCS+9KZbuARqVezp52qNknCa2e4GiiFiijU6ZG4dg6g?=
 =?us-ascii?Q?6/WLjXcVRg0/iLwFRQ6/idzBBcVR6MaIhbY6O6rycp8iS1XR8K6S9S2YMrpC?=
 =?us-ascii?Q?77vIubF0stdOevq6sON7Q384mtpKDSYqGIOipxrRavaxQSmEpvluzwxTlMhe?=
 =?us-ascii?Q?KhlstyccZXF2epwbBxu7zc6LWNl5m+Nr2O3kiFFsMmDgGqcLMwloiN6/s+sn?=
 =?us-ascii?Q?lORr37WMtiLDCEuo6cwwf7weC7KDdsThl7uhDrZKdPyhs0bHPXOVEcC6t82g?=
 =?us-ascii?Q?zptnakf0/ekwqgkg6Ffyk8hpKJrV5iDxomek85Yjcy7BMtGpsL592+KE4bNA?=
 =?us-ascii?Q?Dr5Y3nNmm4mJxPFB5K1a7mzd+2FBsVh4FYSz2otqomWaDUgmkFH9EYs0BqL/?=
 =?us-ascii?Q?PpQrt7ybjBqvsVfIhFtT5qTWSCyvVPJNxz45N9r6lQmeyoa3P1Wlpm8waaUc?=
 =?us-ascii?Q?dTkPsvkA9Un9djimYH5Mi0BK3/e9Kj07ZmAWz8FlZD1Qp1AjZPRztZJOK+k2?=
 =?us-ascii?Q?vLdtUMKK5F0Y4CXoCtbMaBSwJYWX1wyC2Miw9g5mErHA9U50/AKXg8IXQi1f?=
 =?us-ascii?Q?9iFcL/d1qk40zCilY5WjYfIXKiZSpyQE82xmA0to3Uy/9O/aE9htbFWgXjuZ?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UPf7gLbW6CSRfhHXic5rxzJlxlinwfK6mmXCYAQW4zxl0iLRNYo/YzpfYlx3wg8r/5frpA4HLNvTTHE2CG6m6llBu7y8Wz9goGkH3B1yF4VS8HszOGnmdkGRQoDNz8q34/VriU/W+4Bf2SbUUtOOuwWYdfvh7dvaIY2CleHANBkh1RSzO36XsxjgJCq+K1Ocudu2Y9kT/nZYGTd2e7u3GjIcLtY2FqDdy2PyRTXUFF59aipvgQuaV9zsbkow1JgMsm6dP5NX0draWgS2cIGHomKIh0EBBA46kbXMqRq9nyHKD8WGciY3xZDkk37X8aV0+OI1EAil/i5PFpypGJtbqwtZdRoIv8QbcUWpRAXwivdk+PGDe9XNBkQBokj5Vh9EAZuDk+5NDq0bhJJKo+4mzhAktl+RSpaJqsmWAVzxVjGVXe4ZM6ujNQdxGnnN4w1cLkXsRCn1CAt1G9hL/+9Q0AbhZMD3J+gdGgv01yZN+3Vvy1iqSbXX9hYAvMlrBc9XItNeO0n7Lp5YVb4P6kjeH3wiFbGaWtk3qhhrVvEe68u98cR0ngPg/NPShE+t3QfjtlxM8EB7fASnN12SU7B1DDcG1Af9TCYEHs94BbhEMGc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d15b7c-b07f-4143-28a4-08de0a8ce5e6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 19:15:40.3507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: imyZvTYboLMMuR/uU7E+ooxAXn5+HZJcTHdVwYyGq2q7smBUzlZqYcCEDk1zlZMQBvDnICUmPfOiyyhVG/ZkIG0I8KAREkventH6vyICJCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5028
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510130086
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNiBTYWx0ZWRfX0u95ciO/+7Ov
 C/EqQqUPP/GYBwY6NcD45Vq1fwXy4u+NmFp06Rb3viBOloRC5WFU1J+CZgTO5H6taqOWMTA8bu6
 Cn5PlWDt+XwLlXG0jIqlAyjFKIMURhCxj9IB/htlL7FYKChzha48y+UzSuLv6VQ7t5C1s9OCZ7A
 PJiRhib8miCFMNzHcXixYaRj3b+e2uYkSXZWdW1VUIN1HUP/6AfoZzd5i7iWpzhgel1oHcOJ3Kg
 D1nkNYupkqDfKvHoDZx82vyqpQfyG9wFeHrxo2VHcQdtATfNs+AFWXvjeiBojkzKg/Gfv1iL+QN
 zaf+aYOzgxcSRpkEMLePsCn/CZDXqzTXe6jqoRw64ZdP/KxwFZTxPvHLgg400oRfubY8s/+Qg8d
 OwSDAx7A/AdDT3lX+pApPUMQp9CGPQ==
X-Proofpoint-GUID: V6ycDtwx4gsRXY7-h2HEo7BUYK5-7PhY
X-Authority-Analysis: v=2.4 cv=ReCdyltv c=1 sm=1 tr=0 ts=68ed4fe1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JsI4sMX3MLxJo44k3DIA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: V6ycDtwx4gsRXY7-h2HEo7BUYK5-7PhY

On Thu, Oct 09, 2025 at 11:33:37PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> While we are at it, break up some of the super long source lines for
> future maintainability of these files.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  doc/userguide/reference/function_stack.md  | 21 ++++++++++++++---
>  doc/userguide/reference/function_ustack.md | 27 +++++++++++++++++++---
>  2 files changed, 42 insertions(+), 6 deletions(-)
> 
> diff --git a/doc/userguide/reference/function_stack.md b/doc/userguide/reference/function_stack.md
> index a92c61a0f..d172dd017 100644
> --- a/doc/userguide/reference/function_stack.md
> +++ b/doc/userguide/reference/function_stack.md
> @@ -2,17 +2,25 @@
>  # stack
>  
>  Records a stack trace to the buffer.
> +Alternatively, returns a `dt_stack_t` value that can be stored in a variable.
>  
>  ```
> -stack stack([uint32_t *frames*])
> +dt_stack_t stack([uint32_t *frames*])
>  ```
>  
> -The `stack` function records a kernel stack trace to the directed buffer. The function includes an option to specify the number of frames deep to record from the kernel stack. If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option. The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
> +The `stack` function records a kernel stack trace to the directed buffer.
> +The function includes an option to specify the number of frames deep to record from the kernel stack.
> +If no value is specified, the number of stack frames recorded is the number that's specified by the `stackframes` runtime option.
> +The `dtrace` command reports frames, either up to the root frame or until the specified limit has been reached, whichever comes first.
>  
> -The `stack` function, having a non-`void` return value, can also be used as the key to an aggregation.
> +The `stack` function can also be used as the key to an aggregation.
> +
> +Or, its value may be used as a value to a variable.
>  
>  ## How to use stack to obtain a kernel stack trace for a particular probe
>  
> +In this example, `stack()` is an action that prints the kernel stack.
> +
>  ```
>  fbt::ksys_write:entry
>  {
> @@ -22,5 +30,12 @@ fbt::ksys_write:entry
>  
>  ```
>  
> +Alternatively, here `stack()` is used to assign to a variable and print later using `%k` conversion.
> +
> +```
> +        v = stack(3);
> +        printf("%k", v);
> +```
> +
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
>  
> diff --git a/doc/userguide/reference/function_ustack.md b/doc/userguide/reference/function_ustack.md
> index be9436f82..01d282c7f 100644
> --- a/doc/userguide/reference/function_ustack.md
> +++ b/doc/userguide/reference/function_ustack.md
> @@ -2,14 +2,29 @@
>  # ustack
>  
>  Records a user stack trace to the directed buffer.
> +Alternatively, returns a `dt_stack_t` value that can be stored in a variable.
>  
>  ```
> -stack ustack([uint32_t *nframes*, uint32_t *strsize*])
> +dt_stack_t ustack([uint32_t *nframes*, uint32_t *strsize*])
>  ```
>  
> -The `ustack` function records a user stack trace to the directed buffer. The user stack is, at most, *nframes* in depth. If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option. While `ustack` can determine the address of the calling frames when the probe fires, the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility. If *strsize* is specified and is non zero, `ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel. Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace. If such frames can't be translated, the frames appear only as hexadecimal addresses.
> +The `ustack` function records a user stack trace to the directed buffer.
> +The user stack is, at most, *nframes* in depth.
> +If *nframes* isn't specified, the number of stack frames recorded is the number specified by the `ustackframes` option.
> +While `ustack` can determine the address of the calling frames when the probe fires,
> +the stack frames aren't translated into symbols until the `ustack` function is processed at user level by the DTrace utility.
> +If *strsize* is specified and is non zero,
> +`ustack` allocates the specified amount of string space and then uses it to perform address-to-symbol translation directly from the kernel.
> +Such direct user symbol translation is used only with stacktrace helpers that support this usage with DTrace.
> +If such frames can't be translated, the frames appear only as hexadecimal addresses.
>  
> -The `ustack` symbol translation occurs after the stack data is recorded. Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible. If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +The `ustack` symbol translation occurs after the stack data is recorded.
> +Therefore, the corresponding user process might exit before symbol translation can be performed, making stack frame translation impossible.
> +If the user process exits before symbol translation is performed, `dtrace` outputs a warning message, followed by the hexadecimal stack frames.
> +
> +The `ustack` function can also be used as the key to an aggregation.
> +
> +Or, its value may be used as a value to a variable.
>  
>  ## How to use ustack to trace a stack with no address-to-symbol translation
>  
> @@ -35,7 +50,13 @@ Mon 20 Feb 17:38:15 GMT 2023
>                0x7f6d63fc2e65
>  ```
>  
> +This example shows a D clause that stores the user stack to a global variable,
> +then later print it with a `%k` conversion:
>  
> +```
> +        v = ustack(3);
> +        printf("%k", v);
> +```
>  
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
>  
> -- 
> 2.47.3
> 
