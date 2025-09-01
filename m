Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0B2DF14A
	for <dtrace@lists.linux.dev>; Mon,  1 Sep 2025 17:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746845; cv=fail; b=jFce+csoQLpdpbX/UPvWTtqu3C1mUXrUHlPpPqbfa8ZUYlyKQRwR7FCfYmTZRCyA1BPHmTzVWf+fRgp3BdecjTIFpjC/N1B1gnl8AiJCz5VycoGlo/pIAP4y89UUIB6u9anf6uGw13D+u0bx9cd3e/HVGb4S2maPDPGiRriuAqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746845; c=relaxed/simple;
	bh=Ny+I5n5O+ZinBzYISKOehdT3/CAnbh3mQtJEzJ9SmGU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=je1bm1pkWt0xykcQzsHXZtXg0HpdXZl0P8CC0Eq43RL3863BD50L/G/ssRlq3QAFEC9Ny7d+zcLTEqcEvBk6nX0V7PtE+htubjmXo6A9xFypyQFq5jha707nDM+Z0bjrDuYD9VkCHB1Ftv+ioKcNX0wbFI+FdmUiJ/k7gtWaOVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gLgif/b3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Lf2do9qX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gLgif/b3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Lf2do9qX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 581FMu2X030520
	for <dtrace@lists.linux.dev>; Mon, 1 Sep 2025 17:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=CwP7GRiT58KS9JFasGWmOcFEwPd65ivHb9PKAcvKv1w=; b=
	gLgif/b34zZHZ6XshO5ifxRRDgY7K14OS9PNDhith80FNhK1ZfRnxtgNBw5/b762
	9xzVZC7y3pK5gWXy6lQyL0zqKoQC2gr9gT9Y33pIzwEY/N/SWgmyTuNyFyCwWoLf
	RwSoPQWN97vnzF1P8k+WvxGEFJDReDyWEEshOFg2Fv2eUHqsCivz0Qk7SGWyrx4o
	zhKzreFpdyoLjq9B0GmJLjbbpjLX3LtHbVNm6FDPCOHpX5gLruN+BIjIvFYi2dq5
	6XstFMNiRwMzMwjCWiMn6BVbyj5A6F6IAnifUbjb17LAUm4gbURSsDJBI/QOPiYo
	MxTmjTewNJccCiRDye1FIg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usmnaqy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Sep 2025 17:14:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 581EOgGF028741
	for <dtrace@lists.linux.dev>; Mon, 1 Sep 2025 17:13:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr8b1x2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Sep 2025 17:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7N0lxVTQ13TsS2bliyAlAE3SVZj1uTQOszbaN5t6UGu6x8SxDs/dRTHS7Sl02JE4eD/nx9q7UTQiNy1WnnYOaAGxSm4BqIpbluvepbU4R06AxzigrffdxnWA5I7Gebbsa98PvOzL8rglxOYyoIr/A8A1Mf9Fxj1EgFFXVNPUYrgx3ybZzUSzL18PegEzkAytMWQZFDjvS/pAMFfmsJUHPqyQBSPni7L3uBNGxKbf/bwQvt9M0v72OkgwkQmycbEAAteOrEToF5bBm92KiEF998cpSHg1/z77c+AD4LZZIKGrizxyPL0OIoTsjJm19maAOyB9zOE3lKUpV2hZUMM6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwP7GRiT58KS9JFasGWmOcFEwPd65ivHb9PKAcvKv1w=;
 b=rM3g6orVwiiCVd06IpW5/Pt6jd4rKbrVsHW62wCfnB6mjurnThVyEAbct8Mdh+RUzLcgQG3Bxd7qcoYX1mmfMZcH6HKZWLWkAQiaXBObEZ2i6T6DuXouieY5F6m8puRoIvyEYZ9DJeeWgQQ/tLo8eR0WciLaW0cfY3xqsPV2fjLmvO3Qlt0tGOlLAGamvb98LkG9W6Q2T/K9n1/dr+TesclnCtmMVR1TdkUbqGgF/G3p87URIwKOFJFLTp5XZU7XkhSghZAD21pcgz0q2ELSoqRrtwShKbFl/TnzP01rTHqNdLEPdW+ju2ALP8JM67P9wfSCmPFKnXPrJ4vbdy4LIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwP7GRiT58KS9JFasGWmOcFEwPd65ivHb9PKAcvKv1w=;
 b=Lf2do9qXV5ViqUZnNHdtgyiBY74aT/VlXblQC0nZc+XMB6IAek+PMQxOH63ILwKT4vWD8+n45jNwohi4ZO17OwvrxGGuT4FswiWALJyCZ85urC4c9H/kV8P7HaUtkJMaWf/ks0Zs41/hzy9UsULznSb9AO2U5G1YYULLS1WwNp8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7208.namprd10.prod.outlook.com (2603:10b6:208:404::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:13:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 17:13:51 +0000
Message-ID: <ed020c9c-1d0c-8405-b8cc-969324798934@oracle.com>
Date: Mon, 1 Sep 2025 13:13:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] alloca: fix subtraction of two alloca pointers
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567210C6329527665030B8D5C205A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567210C6329527665030B8D5C205A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0060.namprd17.prod.outlook.com
 (2603:10b6:a03:167::37) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 574ec47c-e7ee-4f35-04c4-08dde97aec27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmtkbVB4b2dPRGcyUVVoSFpvY0VmR3l3TDRyTndLQVp0VWdWMTB2ODZiTFBa?=
 =?utf-8?B?aWViSm5qWDQ5Q2ZjbUd3bFNSNkJlbDVCOGNBa1JkejJTb3FpQS9MSFVyRVFS?=
 =?utf-8?B?OHgwQ25CakxxbVg5cUNGY2w5UUxQOStQZndIdWJ6NnFvYlRtZy9xYXg4ajM0?=
 =?utf-8?B?Q1NscWJjL2ZtYkVQNnJGc3BzUTI2cUhGZTRNNmwzOUkwSk81TU1PVHM5cWNw?=
 =?utf-8?B?L25zaGx2b05jQXFrS1JDYlkwNW9QeFk2SlBPc3pFQTZNcGpqd3JRYWNwS25P?=
 =?utf-8?B?RmF1M25qWWdGMzQ0OGdzSkdZSzRTZ3RHK1JyWlI0dDFDK2xFVGxydERyZVg2?=
 =?utf-8?B?UzRpSElDV0M3SW90aytna1BoMkk4SDdWelp6VHBkOUZ5M3orb2NkVkpOV215?=
 =?utf-8?B?WlRvb3Y4alIreGVNL1VneHJZN05hUGsvU3dmMjg4MkVqYStqUlZXazd0aW9l?=
 =?utf-8?B?L0FnTStvaFpRRFFUdXU0M2syMkJqMy9lb21WU3h4NnVqeHBZdk9DT3pPQ2wr?=
 =?utf-8?B?di96Y0RWeVl6bDhnaE5leERQeWt4SGkybVBZbnQwYnMrb2hLTEl1ODIzNnc2?=
 =?utf-8?B?R0NRTTUyRWIwd1UvbWZ1YnFLRSt4TkpFYmU3Q0FsR0dCdm0wNk1LeGNOc2VB?=
 =?utf-8?B?TEhvQStxbUlmaHIzalQ0eGM1Tkdrc1NJT0p3Zno0TXVTWURidDgyL05pL1lj?=
 =?utf-8?B?UndUY3U0c2VWVlRzOTIxRC9mMHp2ekd2UThDU3RZalBNN01FVytxK25mckJ2?=
 =?utf-8?B?NG00N2lsV1l6L0RhOERVK1o3SzBXWUw0aWJMRUF3ZTF5U2RHZTNwcWY5TWp2?=
 =?utf-8?B?dDF0ZG1KbnBvNWNUMWpGYVVmeFFuQ2kvWXByL3lWdG5GeEtLcGNWM0Z0blZQ?=
 =?utf-8?B?ZEZROVVvT0RpeDhjUjQwaHI4d0lHd0k3Tkhnc2lzZVJlUkx4RW9sU1NhUTBW?=
 =?utf-8?B?U2srcGxCeUpOWk1BYUVmd2lOSGwvZDl3ZENHWWZNMDNGRU9maXAxN1lzcU9u?=
 =?utf-8?B?bEp6UFhGOXVwbkdsZE5tNjBqKy9USFlPSWw5eHkxOWUrdEVkMGtDZW5IcUJN?=
 =?utf-8?B?T0FHNlIyZ1FnRmxHRnFQNXk0Q3NPTzhueFV1Ynd0ell5SXFuc012dXk1bVpS?=
 =?utf-8?B?TDVQc2NITTNIaGJxRlE0QmdJNVFPdUUyaXhqUitpTlVVWFNQYmpMS1NTNVlF?=
 =?utf-8?B?ZFJpZVpKRENzWGNZUGoyYUJBQUU5SUIwR2tFaThrUFF0Vlp1OUZjbjQyMFJR?=
 =?utf-8?B?MVoyNnFVb3Q2T01jd3JkclRKY1hEOGplTGRZUGNjQnRDdUVBQnVONGIxb1Fp?=
 =?utf-8?B?YXZZMDNSRWl0cndqSGM2Y1Y2c29SenZwdEtBL29aMGx5U210Z1hOd0ZveThH?=
 =?utf-8?B?OTNTYWlXZHg0QSs2R2xGY0J6NllkK1U4Y2ZzRFJwWmFLazZMemdJbkE1Mitt?=
 =?utf-8?B?QkltbzJ3ZUkybWNrQWg5eWpBRTNaeXNFOXM4d1RQK2ljVzA3NXNYVFBlZjY0?=
 =?utf-8?B?VXpnODlaM0krdXpMMzJ3UVVuLzNPcFlxNnFDU2lxL0dtWGd5WkVYdFgzRytQ?=
 =?utf-8?B?TCtjVDhQSjhVNEw3M25rNU1OQmNPL2dBa1VuL0RJZElVTEhaaU4walQ2aUhT?=
 =?utf-8?B?Zjg5NU1NcjZGdVMzU1FVSFZiQVcvMEtMZ2tmYUhaN0FXcnZ5eTlCcmN0MXly?=
 =?utf-8?B?NzF5OFFWNWF3T1hHSVJOVUFwOWhhS0xaUFZDbmYzVDN1YjBjTEFKVzdTRHZC?=
 =?utf-8?B?eGhzcDE2VkRpOVUrWXZBQ1FkcTU5MTJRdTFpYXhVTjRmOUV2NWFicFZLVzQw?=
 =?utf-8?B?SjQ4VlkvR0U5V1dTQzZlRzBXcm1oejdyWVBzcmoxL0l3dkswMmNlMzJQenlT?=
 =?utf-8?B?OG5TcFN6Q25MS0lpak90Ymw0UFg1TUpGcUZKRVpxNGVaTGpobENxbE4xQjRC?=
 =?utf-8?Q?dtVPXVAUan8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUNtZ2RLL1JlZklocEpsT3ByNEs2bFNVTmZ0QmI5NVp1OU5FUzYyNkpjWkxw?=
 =?utf-8?B?aXd1OGtTZ1ZMWWlMeXNlYzNJU0pJWi9aL2E5MHFRRExHSzNKd2hocU9mY2lm?=
 =?utf-8?B?cVhsdk56QWxKR1N1bFkvZ2x1QVoya0lSekZkUDJnWmp0aW81eEcwZG00RVlt?=
 =?utf-8?B?aGUzRmdRZms0WVFqQk9SaHF3dUJYV2tPR3grNllRdm9DQW1xcWhJOHFiWk1s?=
 =?utf-8?B?STFpeklNUmltaUhzdjZ2clVuU1kwazJMRklrdmZ4dENvYlY0RGRSYno0R1FY?=
 =?utf-8?B?ZjVJUDF3K0ZkcnNBaGw4V0c5aklvNVkyZS9OenRYWTVFcnJSbU5Cb2Q2QkxC?=
 =?utf-8?B?K3NGM3k0Z2UzTnNhL2laU0o3MGVlWVAzcG54M2ZZSFd4UGhYdUVCWWgvdlNz?=
 =?utf-8?B?VnBIc3REV1g3RjRMZ2YyWTdBdktSdG5FcGovRG1YcEROc3NMaER3WGJ3dzY1?=
 =?utf-8?B?OHVHak1aK0M3YWRDMU94bjRaLzRaZkZ5V1BvNkQ2U2dRQkMxSTJja0E1dWcr?=
 =?utf-8?B?dExlTnh6dlR1YUprNCt4NzlRVWYyOVlUM1JhT1N0QWZoeXFjdlkzNmtlMmRQ?=
 =?utf-8?B?Qmc4NFVnNWsxTVN0b1FwTzZpbzFEdmN3SkdOTTdsdkQvVUhTcHBDNUY5alNi?=
 =?utf-8?B?ZHB3dU1mTURuQldZNzUyNmFQWENieGlTdWU4aitOWmlDcDlvWDJBZlNrYzF5?=
 =?utf-8?B?T2Q5YUUrYlJGWUhoUmNUNmt3bUtQeEU2dDByZ2RzUW5EdUU3UGdvL3RqMFZy?=
 =?utf-8?B?NWxUVVdNbEhVZDNHRFh6cFZZbSsrUXVGWENQWEc4ZVc0MTFWSVNFeDhnMFI4?=
 =?utf-8?B?cUROb1VoS3BqVlBLMGZQclZYRmRhTFpSQnJNc3lrWHlhWm5YcjU2VXhJcFdT?=
 =?utf-8?B?dGdqcm84NlNVckFlbitUMHl0dHVwK0NaMDE1Y1ArYitoeTJZSTQ1RUZhZmtU?=
 =?utf-8?B?bHp6MFYrMzQxTWlYUzNZODQrT1dlWnFzVVQxR0lmdHdNNFNLbDJDV3MrMXRl?=
 =?utf-8?B?OGg1RlhsM1BqY2NLMWlGb0gwMFZaQXcvbTB5ZEkrUjNSWldEODBGayt6N2NL?=
 =?utf-8?B?SHhpajArMjQvSmJVOEZsR2VPd3dDeWxGWTNOM3BkRC9pSkZRemY0LzJydW5S?=
 =?utf-8?B?OHloSlB0cUQzOENXbXhLanBvUElCakt0QXU4NmFvZldWNDhtVmFkVVBqMm9P?=
 =?utf-8?B?MDhsT1IwUEdHKzJhcWgzNm8vSzJ6dFAxcU9xT1h2YWNLZ1V5aDJtSTNTYkJs?=
 =?utf-8?B?S0tFTGYvakNpU3lseU9vZlBTY01iSDdLYlI4M1NzanB6cWVpQW83dlY2bUNC?=
 =?utf-8?B?cnVWWGNoVEdDMGlzTVVGWDVqUzVBeXVrZk1ia1Rja3lYdmhDejVQdHI2OXlK?=
 =?utf-8?B?SXNic0N0M28xaU9KdEpDbUI3a05wWkQ4c2lFelkyNHFoUVNFbFhaR21MR00y?=
 =?utf-8?B?L09CMU9MY1d4NnpwMDVNVVFqVlAybnNiNkovTVZtM29acFlIWWR5b1gxRDhV?=
 =?utf-8?B?N1VpMm1EdnJZbTBjTEZFQ0dlbHdxVVVnZ2dBTEtKNUpjUENWVElJWWxxdktw?=
 =?utf-8?B?czJMb3d4ZGlNS0lOVDZFN3hqMm4wTWRNdmFZWGsyMDFNMmcxTWgyQ1RjSUpJ?=
 =?utf-8?B?QVMxOTZuSUFNdEEzbUJ5QysvWWo4Tm9qcXRUclNXUUd5amlmTll5WGRuRXFK?=
 =?utf-8?B?YjVOc2NtTnBXQXZlekY0d2Z5aE1HYXJDNHBCamNqZmZkSE4waFUwWStZM0NK?=
 =?utf-8?B?ZTNpY0J5b290OVlJc2w0bXY1Ui9tbW9oZ2ZIWE5hRldUSHRJRk1xWDdWZ2Vh?=
 =?utf-8?B?WmR5WkJBVGlYeGlGdWpsVW5QQWIrczY4SzUyQWZTQll5VlpCTzM5b3NuRytu?=
 =?utf-8?B?djBjcFd3dGZDRklFWS9NYm1YUnRTQlJxdjJaRnJCTTVyWkhhL2NJRElSNEE5?=
 =?utf-8?B?OGJUUkIrMzk2U01aYTVQK3pUVk1Qekc1K0F5dVhibE4xU1ZBTm02bmFHOS8r?=
 =?utf-8?B?djhDNHI3UUNSTUJtMWF1NDNFczdmcjhITWdsZTZ2aVpOT1pCcVUwMVhWTnl4?=
 =?utf-8?B?emxNYVpvSGd1d2xPN0xQZE9tSHVoZW1CTUsrZ0hQYkJyd1FMRXVQMmNFYkQ1?=
 =?utf-8?Q?+ErbqyloeyC+rmaSNt1WwtMUS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UaBFBCxgj7nN2q1+LRD6icL0Uq/g5dZH6SC1KWdKLfdHMmmzA60YFJmph99dRLoHpbwUm01KzL0P88JjzJ/Wu+p+oz4l6fVwRW+UVb8bnAjqjZ0/lWifkxvWqWQe1U3oCj3om565r+hBvX3yWTU3gj3nxav6PBEif+0xk/Q++891GuPy+fKduD0eXiYXhGTuB0EPRNewYZTdKWZEt97QQXqUZHQeGDKQiBBHVahCaY7nxm0byuHbXpnH+cf+EoEBx7FVAvL1CMSR3zQwsBaJfSnI1jlk79sYm4ZUz6do69/veJitKW+9h2Eet+KAANNKKACM3mEBCZnjv7OCUFcjfz2g0Rgd21AahzlgAomwa3Wg+Aolvl5i786z0ylvpdvxYyH4wiztKn1Z+RQZ8OCYdrEo5TA9XTXPIIDrstfSnt8TS7f20gJl+BaowlY/xRzkNUlj6pDGpjOlkcvyzKwob/YTtJa7/aGTSRLw5xU4b2+5CDMjtlAw+Ci6addYXsad2pOPexVNS0cARsOHY3+Cn4QsG+Wn0STwS+YsyWXguQd7NibcP6fsUtdbZx9/6UsiVXs48KXiGYMs4Ps5Nkbkhvy+6gMGSEaCdGnQhhSqH3Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574ec47c-e7ee-4f35-04c4-08dde97aec27
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 17:13:51.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1V4Gl5lvF5FKiW7jQBX6kNeo2DfGEVYicQ5xa833JToVs/VfxyeOS5FTZBbEGRpaDVqFxzZ4YsMLCrQa645UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509010181
X-Authority-Analysis: v=2.4 cv=D8xHKuRj c=1 sm=1 tr=0 ts=68b5d459 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=jSGCIOYfLpd_DMhIDoAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13602
X-Proofpoint-GUID: g9jR9u6AqxDyeo3wmrJGoAsu1oQfC4nc
X-Proofpoint-ORIG-GUID: g9jR9u6AqxDyeo3wmrJGoAsu1oQfC4nc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX4o1JgGiuW3OB
 55I6eFF6k5aVuLxva4lHC9sS31Lo8W1uE6gf0frcoioSVyaXgkTlqk3/AFzc9ztSu9j2l9+Dd2e
 oweQ7wFW7S8+7+DyyzU8Nyb9UIDagM8WpgeOcGa19Uj8qfPpXr73PLVIfacxczSfWnhUobRQ612
 O01fzCgAJ0KpJXVtNg3mBS0Rc5+RCSVp6V7sNXTkd++o9w+7fJPfVOA/Lhug8GPwu6MruLph79j
 y4qr2+pCJPCVUT+EJ6MqdU4P2mHzfPXTV4TK5opxDh6Uf8emmm+ftbhlMI9HtXz6RMHKmZfQh1Z
 sACPFkZtIzuqVNsP2Bw+xgE09hpa6mrlijtXu6TQYrN/H6nr7+QKjI3gQ7mSvdm4xLccRy5J0MX
 tGEC8HyUCHVnpz+3XffvwUycntgpdA==

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
though...

On 8/30/25 01:55, Kris Van Hees wrote:
> diff --git a/test/unittest/funcs/alloca/tst.alloca-arith.d b/test/unittest/funcs/alloca/tst.alloca-arith.d
> @@ -0,0 +1,29 @@
> +BEGIN
> +{
> +	x = (char *)alloca(1);

This is okay, but is it dead, vestigial code?

> +	x = (char *)alloca(10);
> +	y = (char *)alloca(1);
> +	z = y - x;
> +	z /= 8;

This is okay, but how about skipping the /8 and just testing for 16?  If 
you're worried about padding changes in the future(?), then the x 
alloca() could become alloca(16).

> +	exit(z == 2 ? 0 : 1);
> +}
