Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82E1264627
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 07:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753774649; cv=fail; b=lSg0lSjD5jmNXFQzw5oWyzDZ0HMLqPUk+sGXR908sDS3zD9i6h7vxAzELAQMeqSXy+5DD1AdSixAqKz9P/RuJnm6N4udyIhPzoEYZYzu9JwnMbpTd6OtVDeHReuQ7TuunT5chV3SN6oEsjNcE2oJDWiExgtWjUTm2Ir0ZTXpT+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753774649; c=relaxed/simple;
	bh=3n8aG1/lzBkjn3G8dAEt/1Dbf9OWT3XKtjMPz/DJyUg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VnrtBicN+RaE+PTPpUU6c8+2DxuaFCAr2Bvs0hqKFhAEI7m4GJ3x82EB0Y6PimA8OW9aV3CpXXpo0q9hkeKWyGNUkUQzMP9UBT6Edy9YU2WZCnB9Stxdh9yR72fng/WjdDD3mRxjHeFD9qgnnV3SH1bX9JY6Y/x2dA5TvBb0Cf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eFqQ3FCl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KPDcmHNb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eFqQ3FCl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KPDcmHNb"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLfq9m012568
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 07:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/qCJ3WLas9nb2afyio1tl8nEwr6R49iL/zcXR9Mh+oI=; b=
	eFqQ3FClvKLeAUw1piHru1N+N/vCKIQ1NYdEajSwd7/eBllS016fw61FmAPmD7wW
	AVro874HEwbGC0rY0vGCZ60XgzSAt/Sc+xqxYTPjz3tbO2817v/11QYibkcv68RO
	4RTchguuuewQDVIQy3ObtuMqs+q4xd99A8mJoNH6z1SkG3MoN3ZHZM8T52k5iODT
	12EXx8Y5ifE28MY9w1jQjq3p9LqU/pZSvBfwS3biF2gJVtaA9F8QIqsqfxL8hTs5
	yAJ8dC0pq3A4Q8O6hiY8PJV3bbhmrfaGKt3OQwqkwXN+zmHuCfnL5+eUqo1U2onP
	wOKJSg0e7O4R/QoSRvrdeA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q2dy8s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 07:37:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56T5p9RF016734
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 07:37:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nffv1eg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 07:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHQDCQ9OKRMjzcln9IP7ugJJ6cgy81jprx26e08iDpcbYaC4+gOQFAzSrYIQtllaUG0qeNKvn7VeZrpj/2D+FvZdXvwvOFst5EuEnNc8yUM32lSSvtVmlwsfl7bhiELsRHZKnFjvHIAhlWqA8AKkHrjsuG41OKcKdCVFKYtnsMHpbuNs7ayw9T5pFk7tzxT2QtcFN0Inh8CsS2cVOCx6oJj1RZGpp+VwvrVT/y7YkcCLECgDZObkO9tJ9PXTDQgASsh0fogchsIVI9ptRNcXYry+PiLUiIw5MrwY5BOKg860iKuFjRsi1mqW9NASmiC/5wrnSrS0Wnkr71r3DvBkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qCJ3WLas9nb2afyio1tl8nEwr6R49iL/zcXR9Mh+oI=;
 b=lbbkl9JL64On4fdPh9EK9emo1f80TaZX3UuFtJFlTXqFLw22VLGBlMuU5U24ett3NTLjaUsbX10/3/eP5uLxLwEl+EsgyjETTpz7coUQbhSvbTcArX+v0B6BNEnvVAFWAzkbsdaef2BOCkBmgrurC7HkmectRixjUcLlVDsVvyS41nddAj9vxiHinzgM1IxokLqt3UUZrKwxVRljj4hncUIvcZUt90SZPJPh6xFlEjJjukvXJ3jNqxrPRVIiXkSetjAfMF0Ps+hB8knl+eAwN029f2gNecRUXJtA6wFjpjmn++Es38FXa0qyJHe1ZRaQI3kJndh154/iaP/zDo1JAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qCJ3WLas9nb2afyio1tl8nEwr6R49iL/zcXR9Mh+oI=;
 b=KPDcmHNb8x36FgLIj+xS904kUrnXyoVTm0/Q/45m7H/qJuf9ZJRN/3a3UaXKvGdWarzKZvZED8ydVffXeIwfrDRy027jvyut/3X3RbTWORaGFps5AOihkNAPkL0sxl4bmvqt6wQKxW3gU/ku2pytrCSL7xqcX4H38RczFtKHkjQ=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DS4PPF1F77AB10F.namprd10.prod.outlook.com (2603:10b6:f:fc00::d0f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Tue, 29 Jul
 2025 07:37:22 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 07:37:21 +0000
Message-ID: <8346533e-4625-4998-b145-04d3cc9079bc@oracle.com>
Date: Tue, 29 Jul 2025 08:37:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] selftests/usdt: add is-enabled stapsdt tests using
 semaphores
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250728163611.1570773-1-alan.maguire@oracle.com>
 <20250728163611.1570773-8-alan.maguire@oracle.com>
 <aIgsyUvMfwfauSZO@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aIgsyUvMfwfauSZO@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DS4PPF1F77AB10F:EE_
X-MS-Office365-Filtering-Correlation-Id: b51dfb9e-881a-4a96-a54d-08ddce72c105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnVRV016V2MrSUNCS0RGc1ZkQ29WYjhuN25HMjlETW9qaTkyMlFOMisxOXp4?=
 =?utf-8?B?NEVRS0U3RWlVUlgreDFKWlhiT3gvaUU5U3RnUTdUQVVUdzVNUjR4K3lybVBz?=
 =?utf-8?B?cW1jT3ZVK3dPcm1mMXhmd0pPeWJCaG4yRTJZLzFnOWUzZUdkRkZ0NUxZRFdM?=
 =?utf-8?B?aDVvUmFuT1gzQ3VlSHdMUzRSdTdRbFNvM0tqQnVMKzFnNTJTUStQZGpWT3ZD?=
 =?utf-8?B?bGNpRlhDKzZCMFE2TGUwMFFQR1pIL0Y3RDFxRDF1MjRVenlKUlRDNGZHNmt6?=
 =?utf-8?B?NkhIVGFmZ1pxall2a3RnRS80Y2hQeGVKRnJaUzE3RjZpY0pscjBuKytkRnY4?=
 =?utf-8?B?dmlmVUJUaU9OSHhKSUYwK2dKMlZSNm5adzZ3QytrNDYrdldEUzN5bUpZYzNX?=
 =?utf-8?B?Q0UxemwxWm04VDA5Mjh2N01RMkVvbTZ2MFdKVUE5a25YWE9iVVU3SzlQNWQy?=
 =?utf-8?B?TEw1dm5CQUY2SDBJZzNOaGRFUkpPY0JSaFBVbm9XVjlMMzkzbkhnb1lBVWs0?=
 =?utf-8?B?M3M0clkrcFd1QW5yZzRVTVNwZlVoTzcvdmhrOTRLclZSSnFaaFV2L2RIcDNu?=
 =?utf-8?B?V05xTmNPUlh3bHdVZncxV2RFbHNQODVodyt4eHNkZzFPTGlkVmFOenBpN01t?=
 =?utf-8?B?ckNHZGVCbkpmdnMxTjdMa2o2NzJYRXhNVkRCK1A0RGVQSHBaL2I1dFNwVmhK?=
 =?utf-8?B?ZGNVMklSQ1RGMzZENEQ3RTYyOW5CQzk2Z1RzK3NFbUFjL2k1Ni9pbytVa2Nv?=
 =?utf-8?B?dEtLKzU1dExvcXQ1YTlYd21MVUxWYzN1WjVKWmE3SGtVNmZ0UnByK2RrZk1C?=
 =?utf-8?B?bndlVjFlcnYyUXFLQUJEajRhVHJWT3lkaEFYeHp4bjIvLzRDUmdEdFRlOGUr?=
 =?utf-8?B?RzlScG00d2ZVWGh4ZHlrT3UyNkUwallIdDNvT0lETk03S1pwODl4ZVVuV0lw?=
 =?utf-8?B?bkNISjk0aDJHUTFlTjBDTkM0N29zMUxHcTRtRXVqL0h5WVUySmpLYmZCR0lW?=
 =?utf-8?B?amY5VHNHbTY1OEhObWpXUFlGZDJwOG5aNHR4dVMrVnpYSHdCZm5zR2FmSWxY?=
 =?utf-8?B?dkVVeWdtS043RkVndW05N0xjMFBGQzJKRkdCODc3ajlEakw3REtVUmRvcFhW?=
 =?utf-8?B?ZG85eFA5bDhOdWY0aDh6VFlqMExrV2RzUFFqalF6RDh6dzVrVFgyUVd3QUVJ?=
 =?utf-8?B?R0pqYUlVRkJMN0lNSHlhaWdqYlh0Ny9LSncydGlIVzdzZTY4WWxFSHpDOW1E?=
 =?utf-8?B?WlVDdXg4MHJMZU9QWTdaVTRaWG1wT3FhbDd6SXdISVBackxVVXk5Rk03WnRv?=
 =?utf-8?B?eWkwbm40c3hPVkQvMXhsU0o2WFRJdng5SWZuM3crVUZ3L0dYQkZMWDJKMW8x?=
 =?utf-8?B?QVFiOThVSUVmeG1aQ2lRMGlxelh1NEZxRTR0VDNQUUJWa1ZIQmJyOTlNRC94?=
 =?utf-8?B?dHpTNFpJK0M2Tmg0MWFvVHBtbXpwTWJVZStiejZnMm1FdzErbTN1NklsY1d1?=
 =?utf-8?B?OFplbEhvOFZqT3l1ZXJWbUtsM0UwSHlUR0VwYnJjNVA2K2lTVURFS2tvMUg2?=
 =?utf-8?B?NFFhUHBoWGlsQXg3TjBORXlBZmdjUTY3VmVhRXFKZ21sUnpDU2srSmwxc3lv?=
 =?utf-8?B?NjhobC9WQTRyY1ZZTGtUdzc2Y2F0M0hNT1JpaHFEQW9lNndyb2pZL0g0WG94?=
 =?utf-8?B?c01OODNXdXpWa1ZOc2l3cjlSOWZtY1M1WW9IM3JPYzR0eExMM2JCbUk2MXBm?=
 =?utf-8?B?S2NJdElXRVR3T3F5VWtBWWQxaklIamV4a2NEWGQ5UmZjbTY4L2VtNUZzbncz?=
 =?utf-8?B?b3ZUVkY3RW5EdFJUb3RZWFNaNmxwVVVQckIxU25LVXJCSnpwcVdXYWxyaWFS?=
 =?utf-8?B?dEtyMjFMU3Bvc1M3YzZjMHV3djk0QzV1OFZmN0xRSkIvT1FwUGpuQlJHNkZ3?=
 =?utf-8?Q?tDn8d516M10=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1ZWTllCeFNpZ1VQdnplREtBTGtqUGgySjZzbXp4a284WjFNeWRFTGVxT25v?=
 =?utf-8?B?aXdhQk5CUi9RNUJXeDh6dmVQUCtxenFQd0FqSk41b0dsVEJCcktjTHptUkdN?=
 =?utf-8?B?eHB3cmMrRlBjYTIrWnQveFpLdm8xOUF3a1Vsa2dORUFKZk9XWkwzaCtxK09B?=
 =?utf-8?B?ZFVBUzMrdXpDSDBYR2V5empWRnVYc2NZV3hYeFNKSys3ZWYzcFM4SU5nSi8y?=
 =?utf-8?B?ckd1OWl3WWtKbHM2bmpjaTFaaTlvZytlaVYyQk0xZ1VwZHludUpaRGl3R3dW?=
 =?utf-8?B?Y24zSmh2Z0NNQzBwbktpZ1VZbnJvYzNWR3Evd2x6bU80NSthczNMT0dGdU9K?=
 =?utf-8?B?ZGFXQzloTDZTbVR5bm5GUUpsbkVkb2h6blRBWElYZXdzWEsvekxtSTd2eEQw?=
 =?utf-8?B?NmNTa1dsY3JEWVJPTHJUSFhOTlJidFE3UHpmUXRsOUhzSGh5YTJ3eWc5cDN1?=
 =?utf-8?B?NVVubUdKSzY3MGJBTy94NVhmczZXRE9idUkrOC9ZN3FIUFRnUkJJWnBDSVAw?=
 =?utf-8?B?M28wVTVZaGF0azk5b2tDZGFiOE5kRGp0czQ3Nzk4Y0lZcHBERTU1RXFJUk0w?=
 =?utf-8?B?cGcreERscWdQMVNPR1Y3RFAvcWxhcXlFOUN5eHNBTDNnMXVkdExNbW01WlRl?=
 =?utf-8?B?VGkzVTBGWm9PRFh1RWduMS9CVGsrMDhDNnI1ZVlNT1F5SVJMT3llZHN5SUFq?=
 =?utf-8?B?cEtoeWgrTzczT0g2MENpcTB2dW1tM09aK0pKdTNYUUpvZU91U0xKeFB2aEYz?=
 =?utf-8?B?QXVPV0NCTEM2R1h1RnlTT2QwY09mdlQzREN0ZExlVGs4eTQycmZmb083N2lP?=
 =?utf-8?B?WjQxQVpmZGZPU052aHJSZ0JSQkNtRFpyN0JDYi9QUnlEYXZ2ckU1ZjgzVGMx?=
 =?utf-8?B?Y1dOanlsUE1DM0E0SkcrRlNZL253UFpHQzBuMUdYakJxTE8xMzh0RndSOHpQ?=
 =?utf-8?B?eFhwYmhRODczRUIyZ29ReDFlOEV6eHR6cnYybXVBcFk0M29YVnBJTUR2WXFT?=
 =?utf-8?B?SW9KUnFZUVIzTkd3Sk44ZnhxNUxFZEIrVFIrUGtCT2h5VTlYN3YvQ2ZQaWZI?=
 =?utf-8?B?eThHRzY3WkY4RTVXVE96b00zS3g3bUQwVmJIMWtvRVdlSFpMcC9PWGx0L3Zt?=
 =?utf-8?B?NCtHSkpwcWZBUlJuY0dWWGtxT0NLWnFpRW9PNmRWWEZvdjQ2TEVrVmNUR2ta?=
 =?utf-8?B?S2RJVmxvdlFKeUFkRUN2elBNUHkxWG1kQVcxN1ppU2I4emdGVG1FWGM0VS9y?=
 =?utf-8?B?VnZWV1J4YXByaW1wWUZiQzhqL3JhZUZEeWRsOGRHdC9iT3ptc3BUUm5aVy9Q?=
 =?utf-8?B?ZCtsUlV4bEpTNXJyNy9pczBEVnJENGp3Y0xMMjZWUWVsV0lzSFh0bkhzcXZK?=
 =?utf-8?B?dDJDd1hhYlFHRm9SeS8vVDFYYy8zNVEzMG5vdzJTamtkN2lZUTBqNUpzUGF4?=
 =?utf-8?B?NVJiVVZOcGdLeldsQmJIZ3AyQ1AvUFBaTDdDRm85aEVnQ0JSSHJ6OU1PaUZx?=
 =?utf-8?B?Q0x3THhDenM5RWV6L2FObHAvU2FFbjVXL21NSVYvNFlnRkkwZ3VjTjFMdjI3?=
 =?utf-8?B?QlNaOUhuQk5MMlROZlVscVFJRjVvR25uOEhDakZpRllhRElqcXh0NithNmxa?=
 =?utf-8?B?cTF1enpxZnJXZjZJQk0zU3ArWkRDUmFNbTIxbVJ6czdXbFVqdjNvRG9vNTZU?=
 =?utf-8?B?Tjh0MTdOR0ZsTm5SbEUzYWtsYlVGc2dpT2VCcEQ2aGEzUncyL2tBS0lKOFFi?=
 =?utf-8?B?Z05nQ2Mxa1hhTDc5ZHdVSmJIQkNlcWFPRi93TlRzbFJvVWtrdS9TU2N5cmgw?=
 =?utf-8?B?cVZVRGpreDBEUVNjVU1aOTgzTHFXYysxZXpRUGdHR3BFNDZxS2xFai9haU9p?=
 =?utf-8?B?anlLWWZMeUhQYkw2UjdERndlV0F3NEg3SHZuVUhVSW1BQTl5dGk4dDJ3RHdG?=
 =?utf-8?B?ZWtMUzFPMTRtTSszR0FGdDdGSElRZFN1eFpnUjJjTFBZcGNMN2dMNGw2bTJu?=
 =?utf-8?B?ejV0YU5SOHRHSjBFMVhBbWdaTm4xUGVGMDBWOTBhK1pNMEFjUnVGV0hWWjNh?=
 =?utf-8?B?Z3pnR1laYlc5aksrOG9IMjl5eVgwRDZhaFl0cm9QYlRRQkpFblE2eXRuQy9l?=
 =?utf-8?B?THZXaDFIMExjVDY2NDE2RGFZQjl0V1NaS05oSzJKOURXd1JQMlRLU3dQTnBr?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	I3oqXiMJ7Fmz3JCukergS9QtPxX4hnfoQ/J2AnRd90nkBJVj6fIVPXyH8GnyexQmYpFMv1RJAA9H2U6wQuzQDslwFvhyh0DiRkWb689zu7rodLJOCtHJpVIBuiO7+ukn0u1eggtxqwbLz9PFBJC1ZI04X3P9VkZ7dkc+ot3LzixvJGIr1iJ8+OR7nIJ0Nr5ro0s40aIHL5Lm9TUWEk0oCdZk1qRYiQDdg+SLL6/H+bCG2jos070UseFv6SkIXIzdQyaSNVuHibPyo5SJ0v/1NMkvaz+4xmWT6Qu2AFFOuN5SKeerZl7FJ84YfZGKv7EmdWXOq1KgrYZqCLG5goixY7SlerLgKUViYwOa7cTqhnjGfGP2a67nTSV8oGNHknX0UjFN5bXp2EbNSKEc9xk2FelsP3xZ3MYa3NODNCXxvSfPEKFPxH9VhfjA71/5LMmFfoPv5cMc7v3Y1LFEFBViJZXfNz/Mp4laA5pZOkwdTFCyOAQyBL/xiUY26l5Xii3DaAFBWKEIn4hHc2A9lg8jrvQAgEYjLVP0YCX6KFQLQTElSVpQ3+JeCc2N7YgK3IL00iTsmaAy9fDVv3jN7GOn0Kz3+RwPRGNBGK/OE5tEKXE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b51dfb9e-881a-4a96-a54d-08ddce72c105
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 07:37:21.8804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QuMIUIWOW32U+lzIs+XTWRdEGD8BMp2VTVAp5Rkp2F5kC6/s3M1Uj4X5E5pLLt7rEI2dgdC4FaqGFYbHg1FuAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1F77AB10F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507290057
X-Proofpoint-GUID: 7KDd3zla01tbNELDKx78CIgtrNHQUIKj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA1OCBTYWx0ZWRfX0ENVoAtPeCYt
 nNMfhaO7ethu6+ZiQjz1qrHGD8dup5x6LhcGRCpzz6NgkJBRl99uM3icG0NzBrqF7W1OkK2nJYQ
 I1eewCxf0ZNcAjnYdoFTGcYzH1Aue0USEN20xjvvezNoo1HT0YG8wD1POcFrIKw2YO9wrpCVJ73
 eZjEJJdC3ojAijf/mTWWgd9PPc0F+ulFTO867+O94WiCfPYxPLbZ0q7rUnmsYGynphD27SP0apR
 WFdg2ZTaaVLCEktvN5/mTkgUnfgbU08RaNOT0/uNSAZDd+jmd8WaRdyEyw9rth4ueVKeaZaxhha
 EFR3A+EFyE5wpOuP9VxUQxL5COXPIFfPzksBWE2fOCs24quzvkSrk57Ajomwj6p05VjRU4a3I/1
 6pujroSIpCDO5ZXTQonuld64clgI+6Yjj09D4ZdY2jGaYXCc9wcDr2iwbx1xGgHpuj8g2vNA
X-Proofpoint-ORIG-GUID: 7KDd3zla01tbNELDKx78CIgtrNHQUIKj
X-Authority-Analysis: v=2.4 cv=A+5sP7WG c=1 sm=1 tr=0 ts=68887a35 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ykqs93DRGiux7fgxSmsA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070

On 29/07/2025 03:07, Kris Van Hees wrote:
> This test is flawed because you never initialize the semaphores.  If you change
> the code to assign 0 to then, then the test fails because the probes never
> fire.  That makes sense because your implementation does not actually do

Hmm, I don't see this behaviour. If I change the semaphores to be set to
0, i.e.

-unsigned short test_prov_zero_semaphore SEC(".probes");
-unsigned short test_prov_one_semaphore SEC(".probes");
-unsigned short test_prov_two_semaphore SEC(".probes");
-unsigned short test_prov_three_semaphore SEC(".probes");
-unsigned short test_prov_four_semaphore SEC(".probes");
-unsigned short test_prov_five_semaphore SEC(".probes");
-unsigned short test_prov_six_semaphore SEC(".probes");
-unsigned short test_prov_seven_semaphore SEC(".probes");
-unsigned short test_prov_eight_semaphore SEC(".probes");
-unsigned short test_prov_nine_semaphore SEC(".probes");
-unsigned short test_prov_ten_semaphore SEC(".probes");
-unsigned short test_prov_eleven_semaphore SEC(".probes");
-unsigned short test_prov_twelve_semaphore SEC(".probes");
+unsigned short test_prov_zero_semaphore SEC(".probes") = 0;
+unsigned short test_prov_one_semaphore SEC(".probes") = 0;
+unsigned short test_prov_two_semaphore SEC(".probes") = 0;
+unsigned short test_prov_three_semaphore SEC(".probes") = 0;
+unsigned short test_prov_four_semaphore SEC(".probes") = 0;
+unsigned short test_prov_five_semaphore SEC(".probes") = 0;
+unsigned short test_prov_six_semaphore SEC(".probes") = 0;
+unsigned short test_prov_seven_semaphore SEC(".probes") = 0;
+unsigned short test_prov_eight_semaphore SEC(".probes") = 0;
+unsigned short test_prov_nine_semaphore SEC(".probes") = 0;
+unsigned short test_prov_ten_semaphore SEC(".probes") = 0;
+unsigned short test_prov_eleven_semaphore SEC(".probes") = 0;
+unsigned short test_prov_twelve_semaphore SEC(".probes") = 0;

...the test still passes. Are you perhaps initializing the semaphores in
main()? This has the potential to overwrite the kernel-updated values
which are incremented when the probes are enabled.

> anything with the semaphore, i.e. if the probe it relatees to is enabled, 
> nothing happens to the semaphore, so while you do store the address of the
> semaphore in patch 2, it is never used for anything, so this test passing is

The refcntr address is set in parentheses where the probe is set up -
see uprobe_create():

	if (refcntr_off) {
                if (asprintf(&spec, "%s:0x%lx(0x%lx)", mapping_fn, addr,
refcntr_off) < 0)
                        return NULL;
        } else {
                if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
                        return NULL;
        }

The parenthesized value is then handed off to the kernel to
reference-count probe enablings.


> actually accidental because the semaphore initial value is (apparently) most
> commonly *not* 0.
> 
> On Mon, Jul 28, 2025 at 05:36:11PM +0100, Alan Maguire wrote:
>> Is-eanbled probes are implemented using semaphores where the
>> semaphore address is specified in the ELF notes and passed
>> in at probe creation time to have the kernel reference-count
>> probes; this allows us to have argument assembly code that
>> only gets executed when the stapsdt probe is in use.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  .../usdt/tst.stapsdt-notes-isenabled.r        |  14 ++
>>  .../usdt/tst.stapsdt-notes-isenabled.sh       | 151 ++++++++++++++++++
>>  2 files changed, 165 insertions(+)
>>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-isenabled.r
>>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
>>
>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
>> new file mode 100644
>> index 00000000..db6d18cb
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
>> @@ -0,0 +1,14 @@
>> +test:main:zero
>> +test:main:one:1
>> +test:main:two:2:3
>> +test:main:three:4:5:7
>> +test:main:four:7:8:9:10
>> +test:main:five:11:12:13:14:15
>> +test:main:six:16:17:18:19:20:21
>> +test:main:seven:22:23:24:25:26:27:28
>> +test:main:eight:29:30:31:32:33:34:35:36
>> +test:main:nine:37:38:39:40:41:42:43:44:45
>> +test:main:ten:46:47:48:49:50:51:52:53:54:55
>> +test:main:eleven:56:57:58:59:60:61:62:63:64:65
>> +test:main:twelve:67:68:69:70:71:72:73:74:75:76
>> +
>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
>> new file mode 100755
>> index 00000000..99fcc844
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
>> @@ -0,0 +1,151 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +
>> +# This test covers all stapsdt probes fired by the STAP_PROBEn macros.
>> +# Arguments values are checked only for first 10 arguments because
>> +# there is support for arg0 ... arg9 only at this moment.
>> +
>> +if [ $# != 1 ]; then
>> +	echo expected one argument: '<'dtrace-path'>'
>> +	exit 2
>> +fi
>> +
>> +dtrace=$1
>> +CC=/usr/bin/gcc
>> +CFLAGS="-I${PWD}/test/unittest/usdt"
>> +
>> +DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
>> +cat > test.c <<EOF
>> +#define _SDT_HAS_SEMAPHORES 1
>> +#include <sdt_notes.h>
>> +
>> +#define SEC(name) __attribute__((section(name), used))
>> +
>> +unsigned short test_prov_zero_semaphore SEC(".probes");
>> +unsigned short test_prov_one_semaphore SEC(".probes");
>> +unsigned short test_prov_two_semaphore SEC(".probes");
>> +unsigned short test_prov_three_semaphore SEC(".probes");
>> +unsigned short test_prov_four_semaphore SEC(".probes");
>> +unsigned short test_prov_five_semaphore SEC(".probes");
>> +unsigned short test_prov_six_semaphore SEC(".probes");
>> +unsigned short test_prov_seven_semaphore SEC(".probes");
>> +unsigned short test_prov_eight_semaphore SEC(".probes");
>> +unsigned short test_prov_nine_semaphore SEC(".probes");
>> +unsigned short test_prov_ten_semaphore SEC(".probes");
>> +unsigned short test_prov_eleven_semaphore SEC(".probes");
>> +unsigned short test_prov_twelve_semaphore SEC(".probes");
>> +
>> +int
>> +main(int argc, char **argv)
>> +{
>> +	if (test_prov_zero_semaphore)
>> +		STAP_PROBE(test_prov, zero);
>> +	if (test_prov_one_semaphore)
>> +		STAP_PROBE1(test_prov, one, argc);
>> +	if (test_prov_two_semaphore)
>> +		STAP_PROBE2(test_prov, two, 2, 3);
>> +	if (test_prov_three_semaphore)
>> +		STAP_PROBE3(test_prov, three, 4, 5, 7);
>> +	if (test_prov_four_semaphore)
>> +		STAP_PROBE4(test_prov, four, 7, 8, 9, 10);
>> +	if (test_prov_five_semaphore)
>> +		STAP_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
>> +	if (test_prov_six_semaphore)
>> +		STAP_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
>> +	if (test_prov_seven_semaphore)
>> +		STAP_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
>> +	if (test_prov_eight_semaphore)
>> +		STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
>> +	if (test_prov_nine_semaphore)
>> +		STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
>> +	if (test_prov_ten_semaphore)
>> +		STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
>> +	if (test_prov_eleven_semaphore)
>> +		STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
>> +	if (test_prov_twelve_semaphore)
>> +		STAP_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
>> +}
>> +EOF
>> +
>> +${CC} ${CFLAGS} -o test test.c
>> +if [ $? -ne 0 ]; then
>> +	echo "failed to compile test.c" >& 2
>> +	exit 1
>> +fi
>> +
>> +$dtrace -c ./test -qs /dev/stdin <<EOF
>> +test_prov\$target:::zero
>> +{
>> +	printf("%s:%s:%s\n", probemod, probefunc, probename);
>> +}
>> +
>> +test_prov\$target:::one
>> +{
>> +	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
>> +}
>> +
>> +test_prov\$target:::two
>> +{
>> +	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
>> +}
>> +
>> +test_prov\$target:::three
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
>> +	       arg2);
>> +}
>> +
>> +test_prov\$target:::four
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
>> +	       arg2, arg3);
>> +}
>> +
>> +test_prov\$target:::five
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>> +	       arg0, arg1, arg2, arg3, arg4);
>> +}
>> +
>> +test_prov\$target:::six
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>> +	       arg0, arg1, arg2, arg3, arg4, arg5);
>> +}
>> +
>> +test_prov\$target:::seven
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
>> +}
>> +
>> +test_prov\$target:::eight
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
>> +}
>> +
>> +test_prov\$target:::nine
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
>> +}
>> +
>> +test_prov\$target:::ten,
>> +test_prov\$target:::eleven,
>> +test_prov\$target:::twelve
>> +{
>> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
>> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
>> +}
>> +EOF
>> +status=$?
>> +
>> +exit $status
>> -- 
>> 2.39.3
>>

