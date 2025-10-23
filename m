Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664051EBA1E
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247851; cv=fail; b=LpQ875FoD/Y25ayWullun0c8/BwPYIQnn3s7ILFxuzexq628k10BgM3GDFhrweUwcF7F0ne9MIujoTBNgMaBBVvYPZRxUrBidW8CsYbVDyjVKcoGqwbRe25rJMx5Zefc97QwgB2Vbzs8rKoNB9/iijXaZyieM8maF51a+9a7GIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247851; c=relaxed/simple;
	bh=Givv7dZy/nRnkR38BBeiDTny9Rati50moteColu7Uyo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E236N6268oYeUuu/gx36Ns9J0yg4Wo8JV4hKkuqs1s129tWo5ANMYWZ6XmlfK9DUlTtqnluCURzI00flZ9EIciYn55oLx7wLd0+U8iVMCzQ99030R9a8Cmy/ORmm2PcszoQUqM/ijL0tTi81SSWeyoWkOEoOAucYMpDSI+TPs74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MHPd3grt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Yw/DAbLx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MHPd3grt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Yw/DAbLx"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIC15H018335
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=PzlxCd10RTwUGECwysx4rWFOHLqizAUcK5pxP+24qzc=; b=
	MHPd3grt7+1KoKfYISv6O0pcuDDbRxiv8R/7egjbWQ1JebGvKg5AEj2DFITE71Kk
	oJGFUZ5cXjKXhpKuwZW7T+E8vM6ygWBfDtD7Pd9P7Xl7p8rykVs8hvSoo7AFS0eE
	BwVutnZOAXNicrbCOJfuyCeKFyJL/j/JKSl65l4DOmlCChhhSxS/v0lezQpUvGHZ
	KN7NxFBWI8IIBRdwzfVRcXkXdwvp3qffy4JdZE1nK0ZElhx6hclmfzRfmZPC+UXr
	xQRjHdFnoc+VkSdHXnbYJEoF1EoysJRz31Pnyem0Egi6ToPur5XAHFjLE+E9G/tu
	trN6ovgBc6nhyFQFUavf4Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvcybaw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:30:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NJPOtd022360
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:30:46 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011064.outbound.protection.outlook.com [40.93.194.64])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bg1qt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAfOealT6zKeLezv/y80FFrR5I41nWqHTeTQlhxT3Dzw63qWVZpgxK3jL36yVgEfiE0MDPBACbrM+21Zt8Vhq9L5VBEc63zr/Tv+I/fwXB4cTLrI4SiNKWxefxWkKNSFNRK+kNjdm2SASR447mVnRxmKoieX3ZV0Hj7euTRFfGUp5ibaAIyxFBjaUME6p2NXmzfAfdIeySSBppu/f7IJiWsXi0AoFLmYrq1X3P+999IvK4INkRMBjj7qZOwcn+3iEPPDrjbKM1fLXDK9uDjefJFmntW/1j05B8eqCD8AiW8Q0AIMQ4DHWov2FZ1lRfWjwHumePq9SGwerygWvgb+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzlxCd10RTwUGECwysx4rWFOHLqizAUcK5pxP+24qzc=;
 b=PdBqIdex8X14ZNOHY9oxM/NsrwpiCpSrV/zYj0J/y9YdG36OF8BWJ3++T5jQHZf8ZLSfJw31DGVGebiFu2w37GOOV4ANqK+Fy6YMQu83haicI/q+66UCQ7Dub9W1nNHabEVQObK+G2JU2Vppv+9CzrgaFVlqA3OSiBh9NGy2ZI5qimS426mQbaV4jyEHGoY0TCcPybLvfqE8IwOv283Lm1zjUwvX35HSFQfDZIKO7Bm/2sa6Qj36suJOq2mOP2gD8qa7Fy8ogqcCsbIVXjQNwg/wHwW5PdntND/6NVoRAqmmazlb80oDsx6dCvgnOvcFN7kBF/H2BCgq1uJ17EHNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzlxCd10RTwUGECwysx4rWFOHLqizAUcK5pxP+24qzc=;
 b=Yw/DAbLxZXqAzqBrSLZQZLywP8ouCPWdOoxCchX++t//1gYoWqi328/ew9yMRd9b5NR06igbN7Ij71bBUKN3vdf8oQn9Q8na66YRkne5Mp13kGShfj2gm3807pizbdzY5jcFUZHMHhY5MdNSPX7KQKVL5HzKUdWUUhTJgAulqz8=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CO1PR10MB4467.namprd10.prod.outlook.com (2603:10b6:303:90::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 19:30:43 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:30:43 +0000
Message-ID: <07ceb987-856b-4401-925f-020036939944@oracle.com>
Date: Thu, 23 Oct 2025 13:30:38 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v2 13/20] doc: Clean up the table for
 string relational operators
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-8-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-8-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR22CA0097.namprd22.prod.outlook.com
 (2603:10b6:930:65::22) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CO1PR10MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: d58b403d-3c01-4019-f7bc-08de126aa6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnNSUW5KcE9QV1pDYTNVdHZ5bXhMcWdNOUdnVi9WeVUxNEhKYWtmM1k2R2J3?=
 =?utf-8?B?elZENWxZVkh6dUwwT01DZXlld1dLQjdXdWVTTFB4UFpRU3djT2RWTkRoVmM4?=
 =?utf-8?B?eElCVVo5b09xMGFkMGlUWHRjcnZaQjhCam1WbFZwM2k1VkRNQVArMnB2cjdv?=
 =?utf-8?B?VlAzcktwV1BlZ1ZXbHVubXdYTElBNnl6K2R4MVY0U3VrWFhvMG9uMDFlUjk3?=
 =?utf-8?B?VUtscGlHWlM0dzliZFpkam0wbndRZVFjYThyWk5wSnN5QmhTalBrZlRFMzN2?=
 =?utf-8?B?T20rZ2NiLzU2MXhmSFBiYUY2Z2k2OHlTV09lazMzRUhERU9rN3hUV3ZYMEQ5?=
 =?utf-8?B?MmhManhkU3NJRkYxRXFvbmNJMDVkajR4bmNKRGdKSGVKTjVEc3QrZXVMQnFP?=
 =?utf-8?B?L1hLM0I3LzQ5RjZ0bXFWUy8wV09NU3o3TWFYZlZBVDY4Wmx6azJJUHk1MnIz?=
 =?utf-8?B?RDB2VTN5c0p2dVE5TExaK0VjSE1xN0RQSHF4QUwxTmVlVm5YZE9KcDlwSldM?=
 =?utf-8?B?SFpoZ0I5dWJ5cmRGZnFzNWF4Zk05VlJYUEhiK3Y4K1UrenJ4NklrZlpqdkha?=
 =?utf-8?B?RFVlQWxaWE9Yd2xrVnpKL3E2eWJTWmRpOTNvQW9MSS96cnZsVGJmWmVWdlhV?=
 =?utf-8?B?bDNJM2dqa21CbjBhNlMwV3UxQ2Jyd0l4ZjFEQmRVc0hsaUJtam8yRjQ3NmN0?=
 =?utf-8?B?eDJhb09aWkZRUnBwQW1EMEYvNGQ1SVYra0pwN05UTUdWYlcrbGJNMytuZ0Ru?=
 =?utf-8?B?RE5LMHByN2xLNkNwQTVhRTNCdUovRHJHZGxmZ2FaMGh1OXVlYUJGZ2hoVW50?=
 =?utf-8?B?bnFmRmRRbmtoUEZEUlkvM3pSU0RadGZvT251SzErdmVRQjB6WEF5NXYvZ0gx?=
 =?utf-8?B?M3pzMlNMcVA2T0VsRDZYblh2WHgxZm50QldaT3NKT0NWTHpxUFI4MWFidlZS?=
 =?utf-8?B?bmN2bFF5c2pDdE56QUNKclRpYkZ3K1JDV3NoNW16Wkg1YmxSTWoyeWc4NjJa?=
 =?utf-8?B?M25ncWlqVm5xN0RMYm1FVnpmak41N3gxN3NreVV3M0hOTjBBSnpHUWlKbllx?=
 =?utf-8?B?RXJHb0dZdkJKbUVqQmFuNFl3eVZDdFkyZ29NL2o1MW5qUGZJTGFHZ0JmbjJF?=
 =?utf-8?B?V2xkVTd5c2ZmSmtGOTV1VmF4UlRleHh4NmdLSTIrdVNlZHRRVitINmNvRUw0?=
 =?utf-8?B?K1F2VmRmNTJHUnN3cFA2bVNBVUZpNm9yUlhmRCtpQnI4VlVZMjh1WjVvcEdW?=
 =?utf-8?B?NmZib0paSWdZNzdYWGlGYjdhMmE5WkFMM05kaGdmRFRPelViV3NsTHZWNFlw?=
 =?utf-8?B?UmsweEhsWllJczdQcFZMV0k3ZVdhYWlEWitpYzhuZHZ1ZWVPc3JHUkV1Tlhj?=
 =?utf-8?B?dW00N1ZkN0RoUnA4R2YwVUxjWGx4UzJRc2xoZkNUb2FVcDY5Nmh4Y0RTczdl?=
 =?utf-8?B?dE5PWXB4UWhPY0JaOENlTVAwQWlOb0JnMUhQVkI0djM4K1RWVTkxZE4ydUd6?=
 =?utf-8?B?aHhjUFRtY2wrU0JPSy9HKzQwUEdsajVhTStyMFRkdDhXbjB6NFBKR2xHVyt6?=
 =?utf-8?B?SFBvUnEzcWFQTVZvRVlCR3JESC9rWVZENUU0a3MydlhhMHpFL0txSHVKRzRG?=
 =?utf-8?B?L2N2RUkzbFlPSHV0UThyanFTSkMycjRFa0s2NTQwVTh5Ymk1TzN5a0RkZ0gr?=
 =?utf-8?B?czh3RFJDakVsaEtQZDNwNGg5WGhmRnJubUhkU1ppZ2VDa1lXTkt4VlFPajVm?=
 =?utf-8?B?NXIzdE9EdHNHdzNBYncxaUNWQ1kwcGNzQzBUSXB1VTJhQVQ3SDRGUjNLazVx?=
 =?utf-8?B?Ty80VHFFa1NGUzgvTFVmYTR4UDkyekY1MEQ3cTRRT3VQeVZWMEQ5VmQreDlL?=
 =?utf-8?B?OFNtOFNreTlSZyt3OEpKSHpTcHI4UWE3MlA3NnhWalpxWlpjanRvckN1ZWJP?=
 =?utf-8?Q?aeaMrLPmdDy1c8TM+4E39bsXbnmI18BK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUVzZFR1VWp6SFdyY1pwemlvYk16cnFKOTdjQURWb3BrR0VoZGxqMFlUT3No?=
 =?utf-8?B?Tk5nQ0xYK0ZsazJMbjNDYnY2Vm5CQWNOa2RHajUrbEQwRE5pZ0NLZ1BMbHRm?=
 =?utf-8?B?Yy9TU00ySE5PL3ZpZ01KKzY1NEV1dVQzV0Z6cmlaVXowYkU1cmd0R2Z1b1B3?=
 =?utf-8?B?MHpPaTdRV0FweEtxckNWZml1OTc0Y0grRmhVenRKc3hEck1lakdXR1JnaUF1?=
 =?utf-8?B?bXAvWVk5MEJXblJWaXdRNW1NYnZXazMzSnlFM1dTQTlFOUNteUhseVdvcEJD?=
 =?utf-8?B?RmFLNVNqM0h4RVBLOFJZQUtwZXRKZkRFTWpxMXhnQjBQY3RFZ1dhUENxRk1z?=
 =?utf-8?B?WEY2U2J1dmcyU3AxbVZXcVYrN3cvZzFqbGM5ZXFNTjdrclAwVCtFcUxadElx?=
 =?utf-8?B?MUZVd1RYVlQ1VlNKVnRQcW9kU2NrMkJ4bjhzN29aQWFkaXBWVmRjT3g5anB1?=
 =?utf-8?B?dXlVWWs3WEh4RERyS1Z5SkYvQ3dqK3dWTlVpYTNvSVd0b2hISTVsRFlLVmxR?=
 =?utf-8?B?eGVDSElMbHozLytVSjhKMWVjWU1HSzlWNG1FMm9nVUpNZWVpL0dDdUFRQUE0?=
 =?utf-8?B?MlA1VStPZVpMamltQ1czWWluZFJxOTIvRWx1dkFDd1BKT2d1RzQvM2c4YVR2?=
 =?utf-8?B?azFGQlFmZUlHVU9nZ01vSkRsK1lNY0VqQmFrWGpneGdTMUpkSDlheUNhMWVh?=
 =?utf-8?B?SHA5ZEs5cVR2ckcxK1l0eHdYcXdMcVA4NlBjVFRDZlJRRDJKRjZsOGR6Q2Iy?=
 =?utf-8?B?U2VTOGVrVVZpOVJ3NmloRkZxUXNDdEs5WTlhOWNnOHhSTHZ3VlV1enpRYk5Z?=
 =?utf-8?B?SHpEc1l2N0RGc1VDV2dBK1FVQm1vUzJ1amJSMEptZlZCYlZTWEI0dXdtb3FE?=
 =?utf-8?B?TGg1cmM2KzdTSU9EMncvS3Evb1MwZjZ2R3JYKytvcTFBVnJ0T0FQdWtGWnZM?=
 =?utf-8?B?aCsvWW0rSm81bkpodmNaVUdnSUoxYkNjVmpkMkg2NTR4Y096a2J2OUZDVW1W?=
 =?utf-8?B?R3IrczVGeTNpWFlxWkhOY1F4VWk1bnZkU3BORHZYdE1pS2pVTkxVeDY5dXda?=
 =?utf-8?B?RTgzTDlkYXhlSVQwM1Q3TGhRM1BzN25XYkdRS0tXdUhaRmgxaTViTHovT3hl?=
 =?utf-8?B?YU0wT01LbUhKWFNDQXBINFJkc0lWTTh6TjU3Z0w5MDFlcU55ZDhBVjR4NU81?=
 =?utf-8?B?M2VENVlVbTAwaWRHYzkrQWRjTkVTSlFWSmI3bnBXS3FoaG80OGxYWlhxbDlz?=
 =?utf-8?B?WW4rdnN4b2c3T3FkbU8zVDZGL0Q2cTExSVdwaUNhTEdWVHIwT0tCNXpkNjA2?=
 =?utf-8?B?NXBPN1hnb2x1VlZRNXVzSDBrcDRwS0hYU1pHczRmd1psUlo4Z3BLVEtyVm56?=
 =?utf-8?B?RTZCT1U1WlpiSkY2UkhQdTFvNFBkOThiRmZLZTZmREFoODZzZUJBL0p6NVJt?=
 =?utf-8?B?QjJmL3IzZWtlRUpySkRka2Z4U3htYWJGM01SUHhyQ25HeVpIeDdhNUJSRlRX?=
 =?utf-8?B?eFBWWlpUQVRaZUpKR1NLWEtkYTNlMHBFU2xDN1JiZE53SmF5ZGJrZmgwTnFO?=
 =?utf-8?B?dFpYUUZZQTQzVDMxN3RmNm1QQXhYY0MzeFZ6MVZ5MjFFcmQ3Uy9waW1wQzIz?=
 =?utf-8?B?MXZ3NzB0OVBiajNSeDA1RmhKTDFQYkl4Qy9rN2lzM1lzeUpScnYxeDFkOGp3?=
 =?utf-8?B?anBaN0lJblVZRVc3Z2hOd3E2QWVBMXM0aDJ1S1V6ODZOYk8vY2tiRE1hK0pw?=
 =?utf-8?B?YW1QWlJoMHdTcFN6YkY0VndudjBFbmlsNU9sK1YyWVFkNTNucitNNVJCSHp0?=
 =?utf-8?B?eStoN3phS2pHNkFpYUZWaUJFSHRwZlhZTHptc204OVdoQnc0WXR3ZUFLOG1K?=
 =?utf-8?B?ZUozc3I5SDVIUVFyLzUzaG9oMlBTckY4WW9QaEJpUXRCNG9mbHJnOElmRHI1?=
 =?utf-8?B?Wmwzc21zbGhHK1ZIRXN6SCt1SkFKZU02YmRENmx5S29iWU9HWFM1T3pWSnNp?=
 =?utf-8?B?SGVwcGp0UU5EQXJvbVV6VEFadnozTmlZck5UTlJMSHRIaG5scmh2eUNOd2pK?=
 =?utf-8?B?NDkvcXlGdHg2aTFGYTVJK3dlMXBnbE4wVlhVYzlhYTZIdkk0V3I4M1JpNHBJ?=
 =?utf-8?B?ZDJsQWcreXdmQXNmZnhZSzdRWDNPbDJ3VjJ4TjFqMVFWRzk2emRHbDNNU05B?=
 =?utf-8?Q?JM3owhOV57nqZK8JL8g7v5A=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3MDgs9Zt/7d/vbQ4n+9G1ab5CIeb9hTmgWYtsbKVTm9OgJPhDe+8HxHX5/bdLVvjgOtrmI9C4CiBAXs/J7kyMCviEv5yGZVG6fi4aMBbfMPnSyzwJhTZf0yTtM/eAeRTivw50A6GeU8MHAbRKIUv/w08r13na0MGRL7J1GQ1qBeaHHZvnqVR+OcXYsVsNH+MKqX/VU0RZlKwUmUL94HLMsz/KxvtOMvdwUGSIptXtEzjlpo6SnbC6Tg8V/uDXXGh9LbJYxs/l0keL9G+6bfILnYnLExahPq/l74xnGJhfZRt5qlrk0iETcx9cQ2fpS7A2ni9Se8pjsVu7odJbzAGMBSthuV9Ck8bEe/SfXxVVYBf9BvzJnJvDcnjzEf69ZbHmrbzMOQ1glERXUbVLXgP5TUUgNa+5UyOwWwXSVWwAqW83uwtpxgzhUIYDiG9NUZzPKY8VUjKops3RC3lDHiwPg+wkU+/AjmcbKzDQY4mwcCMyy6wXEDM6FQN6S6CHgkycFR/DGuzxNmnqXNmXlvg+yqDcXJiVJKwbzo4Km/Zq23G3n4394u7HQOdn+4tDoPtswS1fOf3j1YxJjizAPyZBM32ITTKREbqgqC0AlT014w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58b403d-3c01-4019-f7bc-08de126aa6d5
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:30:41.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZO1oj2H6dmcUu+0wEdZAYQOhQSPLPeYhVbge1YDZ/6d45YS3waI9RWrOu6asRbNgA/CrSDtZpLnmcdVE7Un7SnilEIJY5NiNMueCG1fUfCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4467
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510230178
X-Authority-Analysis: v=2.4 cv=GqlPO01C c=1 sm=1 tr=0 ts=68fa8267 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=AkLzQMP_Rs0M3BfJ__wA:9 a=-dUJT0I-3oGLVzB2:21
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfX56CFtxG1Bmgu
 vtCdtpRU7PrnmXsn4FQizJV+Hi4FCeBLljea4jzZce6+yteYk1fxS7rNYtcyTaN0Cms0ghtdkRU
 ItT7Q1lI+DjkXK+f/PzKKaaa2dy+2LBRUmJgby8VKg4aKxOHMdg+fQXfLr35O4pvltbNy80BaTg
 639KOBNpbLd9He7IS75nj/xXE1Sa33XI5xC9u4ZwkhApIA1islr6RKbroWcEmj6TL9KvrnJmV87
 zKCsrXZZ5+EweboUxW5b6DoyDwGbw/ukYKEzknweh8s/0Yc+lhl3jWPKlS6sYPqLIk5YqoIyL98
 IFyhc/U5y0BfLLRwz34oPwHI4ZrCGBriainYFqkGzYR1rFpp67OOi6Vk18S8sBXnvbhuA3CoLqR
 mEUjq2yosvbxqjGmsd/IEEkaBU3kdmMP8Z3nGweJuZNbB6iZ3JY=
X-Proofpoint-GUID: gVnfWevDrDt9Q_b8gKik0-bzdJ_a5gFB
X-Proofpoint-ORIG-GUID: gVnfWevDrDt9Q_b8gKik0-bzdJ_a5gFB


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 10/21/25 9:22 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The text referred to "Table 1", which is not otherwise identified.  It
> included a link using an undefined ID.  Scrap both, especially since the
> table immediately follows the text anyhow.  Clean that up.
> 
> Also, the "String Assignment" link was missing its anchor tag.  Add one.
> 
> While we are at it, for better readability and maintainability of the
> source file:
> 
> - convert the table from HTML to Markdown
> 
> - introduce line breaks into the very long text line
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../dtrace-ref-DTraceSupportforStrings.md     | 73 ++++---------------
>  1 file changed, 14 insertions(+), 59 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> index ea44523ed..e9239026f 100644
> --- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> +++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
> @@ -80,65 +80,21 @@ Scalar type expressions, such as a pointer or integer, or a scalar array address
>  
>  ## String Comparison <a id="dt_strcomp_dlang">
>  
> -D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
> +D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons.
> +The relational operators perform string comparison whenever both operands are of type `string`
> +or when one operand is of type `string` and the other operand can be promoted to type `string`.
> +See [String Assignment](dtrace-ref-DTraceSupportforStrings.md#dt_strasg_dlang) for a detailed description.
> +See also the following table, which lists the relational operators that can be used to compare strings.
> +
> +| Operator | Description                                                       |
> +| :---     | :---                                                              |
> +| `<`      | Left-hand operand is less than right-operand.                     |
> +| `<=`     | Left-hand operand is less than or equal to right-hand operand.    |
> +| `>`      | Left-hand operand is greater than right-hand operand.             |
> +| `>=`     | Left-hand operand is greater than or equal to right-hand operand. |
> +| `==`     | Left-hand operand is equal to right-hand operand.                 |
> +| `!=`     | Left-hand operand is not equal to right-hand operand.             |
>  
> -<table><thead><tr><th>
> -
> -Operator
> -
> -</th><th>
> -
> -Description
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -`<`
> -
> -</td><td>
> -
> -Left-hand operand is less than right-operand.
> -
> -</td></tr><tr><td>
> -
> -`<=`
> -
> -</td><td>
> -
> -Left-hand operand is less than or equal to right-hand operand.
> -
> -</td></tr><tr><td>
> -
> -`>`
> -
> -</td><td>
> -
> -Left-hand operand is greater than right-hand operand.
> -
> -</td></tr><tr><td>
> -
> -`>=`
> -
> -</td><td>
> -
> -Left-hand operand is greater than or equal to right-hand operand.
> -
> -</td></tr><tr><td>
> -
> -`==`
> -
> -</td><td>
> -
> -Left-hand operand is equal to right-hand operand.
> -
> -</td></tr><tr><td>
> -
> -`!=`
> -
> -</td><td>
> -
> -Left-hand operand is not equal to right-hand operand.
> -
> -</td></tr><tbody></table>
>  As with integers, each operator evaluates to a value of type `int`, which is equal to one if the condition is true or zero if it is false.
>  
>  The relational operators compare the two input strings byte-by-byte, similarly to the C library routine `strcmp()`. Each byte is compared by using its corresponding integer value in the ASCII character set until a null byte is read or the maximum string length is reached. See the `ascii(7)` manual page for more information. Some example D string comparisons and their results are shown in the following table.
> @@ -179,4 +135,3 @@ Returns 0 \(false\)
>  **Note:**
>  
>  Identical Unicode strings might compare as being different if one or the other of the strings isn't normalized.
> -

