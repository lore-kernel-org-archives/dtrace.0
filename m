Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209031DA0E1
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761248055; cv=fail; b=TyKdNAZWUw6oYWidMPtKGyBNNCKYR8jv4KvugmsAMjXKzDi0Gm/A1x/upnCAuWZwpVJlQW0XhYHrEafgHG39i+iLS67JE06KTCUl1ufTSuBI/+K8fkgTHgFwCVI8H+wLBD4rN8ojwMp+1pJGDSsX4VW8iO90RLwK2MFuOCskDcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761248055; c=relaxed/simple;
	bh=1Duany48QW4vyN4Imxzjftk+Cpv0Wlou0e66zmZKPec=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z7LlCSgkHZKKm7ACQD19kol1rbk4NGMqFTcS1h4T9IYfwlFmUL+yciXZk3yLNqXVH4YsqZoeTyOaJiNEdzPxbzsxvjs3/ufVBNHho+9mcElTyNKvDzqn/ORFGiQQpEDHeY3Mx6G+q//SNUbgGhm3CB34Ex/3eU+tmMSg1kPC5uU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=necbR5/u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Pgf3KZhB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="necbR5/u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Pgf3KZhB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBwdd009613
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wfNBepldfFPZmyTDQc9D6M5gsPfqZbVdp/vdCOIgjjw=; b=
	necbR5/uY0ozC7HQuIoyTIaoOAMnGoMjeKjIkNvqEjGR6+x+pVjihTxzojJqiMNR
	QvVrIhPQ5oYa4Kq8Av4mt+Zls8L5Ui3fZ/30MmYAlHTKoLfWiVT5BJkZFx+IBRo4
	4m1m6k+gVIo1VEvm9VMqNPxxokz0ZNkS6g2rJf3rmNvZYF51hx7WO2dBuRD+EpOF
	7UFIxgQiw8hMe8RNl8MsWfIcBZaORbKZ812cxG0HOYNd8JPGL9UOEhextG1jhSBg
	Vakve4XxSHDfyrvxgc9DZ/Pd1Lei/RNwYD2vaPjAmaonBByDHGqjx/3iHCyd6Wjo
	1Wm6ypbwOrrbwnbBL1cKUg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49ykah11rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NJYAXp001050
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:12 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1beyqdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:34:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6OA3l5yGv+tRZ9vndmF+YrDL4wtEOaKT+Kaw9JrQHnZGqHvfP4v1JMMp0sSgeKTFd/WUYia5cfEvfMohlWjLd6NuQ3ikO0Sjk5sUxxyFROz7+xgfPGcAJViZr3UqgqwwOUX4bJc4erljlVDKg6U3+mZTXp1wZm62LhORj8FuTlrn5nnXn3htRlAnZ224n15KRrtGixo9+7O1Qrz52AF1l+T3l6Z0OqnV61lXgrLiDStp9cFZW+5Bdt1tP28OgrcfN1qrAN8tvutxeOHYA/vboJbltX0H1rLxOFkwAY/nE/kPSHTAXu5R0VlacvB7ut1BseNJTgNwCRtLQRgSWeKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfNBepldfFPZmyTDQc9D6M5gsPfqZbVdp/vdCOIgjjw=;
 b=hsEQMS0VZYHUxVuRLnMkgMI6x9GE6DyooCeJMqG1KVa/s326oYnKffoVUPIzfBcsjswyAkmdLdYrPspefVNbe6ekwBPI1/eUj0Rwg9nSrW9e/hXKnd2DJW5vrBopbEL2EJLxvkaHQcTnBOpb95Y3ASaH+mBYFZRbiXHIbKeroPAOfN26pS7k6C6Mb3gFaTs/ZV6r9fLjMLTgf5MrUIhOt+zT6iI3DmC1bq0yZK0838K10EsYObeUt6z24CTy04enUnU2ILnj60A1V23knxPy3iqIVSjSgRV6rBYAxWTJlLraK2rgCs2xceKGDlv4mmfLZz96oQdhBKlzVeZdMQxWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfNBepldfFPZmyTDQc9D6M5gsPfqZbVdp/vdCOIgjjw=;
 b=Pgf3KZhBtP6L0Dg+9Wn9dmjtiMpy4X0chqSCHXoF8AUMbuHfVqm63iDEKO9ziVQAs9AlpbrASqj7E/fCDUNYqiNczKQiWgYZdWhvU94yvFwMvHtCEaF5gq5A3DJemYF+uz+U9UKj8zty+WqlKZ0RQG4zvSjHscfQupJpiTzFtfw=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by SJ0PR10MB4669.namprd10.prod.outlook.com (2603:10b6:a03:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Thu, 23 Oct
 2025 19:34:00 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:33:59 +0000
Message-ID: <fd2b029e-ed32-4d98-98d1-3c0681a41f88@oracle.com>
Date: Thu, 23 Oct 2025 13:33:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v2 15/20] doc: Clean up profile unit table
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
 <20251022032251.2010-10-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-10-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR07CA0036.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::9) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|SJ0PR10MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 9991207b-4efc-4f87-dbbb-08de126b1d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZUZTUUtpbXhxbFVtQlFpUHQ5Y0VyWDJKdmU4czZONGJUUzBNQ3Y5RGtWR0V0?=
 =?utf-8?B?TEE0RThWcDFyNUYvUXViNnF2b3lZY2huRWkwOTNjaDBtOG9TREovRU9qU3Jw?=
 =?utf-8?B?U3kvNnd5ZjcwTGlqQlVZbHpxWEJwY21xZHdaMjZwMDZrckQxL1RaTytQa1hy?=
 =?utf-8?B?Qk82eUFaaEpSYmwzZnU3K1Y1MFVzTjlLdzE5UXl3MWE1UWdZckJWdGM4UmQv?=
 =?utf-8?B?Z09mTUpFRldlZWVLMTFmYzBmaW1HSExkU29mVHBPYS9TQXZWM1BQOTc3bjNN?=
 =?utf-8?B?MTZ0aktUaEpoQk8vUWt2c0ZIb1JETnE3U1ZoQXRldHZENHVLQUNBcFpFYVpy?=
 =?utf-8?B?Q0hOcXc1ck1KRzZBbjdUSXc1dDRpenArNllxZWdmYm9EVlZsNGthbjhraFdR?=
 =?utf-8?B?Nlk0ZWpTdk1kVXd5Q0ZGbFNaKzlNVllvcGd1b0RaVVZqWXVIUnR3S0UzSXhl?=
 =?utf-8?B?YkdvQUw2R0FmclJjTmVpMDZVVTBtNEthLy9vZGc1UENYejlpQnVrUVBnS21u?=
 =?utf-8?B?b2lGTU1DOUd6dEgxNGFCSVhKODJtdkM0WUV5UEFTaFdHVTlaOWVHMUl1aENx?=
 =?utf-8?B?dHJJRlJwV2dWNEFneWJqSmR6eXV0RXJPSFNoMmNEdmhDcWxCY2pKaFBCTnFM?=
 =?utf-8?B?MnYrYVc4c1dyQU91QWhPdC9oN2tldnY3dEZVS1V4cXlRVEZWL1VzSS9wa0N2?=
 =?utf-8?B?WkhEYjFKbTAzai9menkvakoyaUM0d0NBOEl3UjNtVUwxOEo2Mk9LK2p5SzBk?=
 =?utf-8?B?aW54bkFHWU56YXovanFtU2QraXZaQTJQc3N2T0ZxRkJYSHZPODNmM1ZqT1hm?=
 =?utf-8?B?c3BJcHkvUUlNd0UzdS9QT2hPZi9XQkR6OXA0RDRGU2lkRWhySHdLSnA4cUpF?=
 =?utf-8?B?cnJwejBwd2cweTNKaWtpTStGbTYvMzE0Q3Y3RVBDakhWOEZMbitEOUJJV1R0?=
 =?utf-8?B?L3B2L1dVTlFnTlJwckx5Ui9jOEdkNk0vSFUzODZrMGt1ejlOdi96enJKcVJw?=
 =?utf-8?B?bHRXbi8rN2MrNUQ0a3AzVzBteEY2Qk1GdWpzVmhBVVNwNWJOZ0ZudFkxalcy?=
 =?utf-8?B?VTU4YTdNaXV6cnZDbklreFJjb3dJY01DSHJmSFV5L2h4ZzZhb0tPTWdCOWlB?=
 =?utf-8?B?VG13aS9TQ2xhYnJZNVBlTWlMVFJudW5PY1pJMy9oSzZsV210dkxFM0RYdDJZ?=
 =?utf-8?B?S3UrWmJEWG5aSVpabTljeld0d3F5WWJQY3ZlTFVqWllSVDYwbEtDaTdLb2VI?=
 =?utf-8?B?Ylpnd3ZkWEljS2M3NXBaMGJNc3FXbVpSMXVablcxemZJa2U2TWtRVjFFMVl6?=
 =?utf-8?B?ZUVNaHV3VWJscGcrLzBWc0dVUlFHU1k0QkllcGo3cndmZnRKL3hGMFdEUWhZ?=
 =?utf-8?B?UUY1M0N1ckVHL3F2aENMQVhOYjM5cm5BdTFZdHlLUEVEc05hUlhnSWlaK1Ir?=
 =?utf-8?B?dWdzNEI5b1cvOEVXU3FTd05pYk5NSzZRNzJWOGw0R0F1R0lsTExBRWdQQlRW?=
 =?utf-8?B?eE81bE9icWs1Zk5uQ2EzUGNEUGlKdjh4SS8yb0VpRG9VbkNqeVFiSGJsYjY2?=
 =?utf-8?B?aTMwTVc5bHc4cmFGZFdnb2tQUER4RnhweWF6aVJsdXNwSHJyeE5ldkdFMWFs?=
 =?utf-8?B?MEhQWUdUR1FQR1NOWE1TREZQQ1RLVFRUMWRnR2Jad0Y0N0JWTjJmb05zL21J?=
 =?utf-8?B?cWtmbTFUUXJjQkErRnhZZVhlY3dTWUZmVjNkUEVMa0wwSTdIMXhhZkZhcFNM?=
 =?utf-8?B?dGR6dnh1Q1gzeFk0UzY2N09qSGhxdHFCb0lWeHNpdjV1MENxbUZKdHAyZStt?=
 =?utf-8?B?MlQwaStwNGR5WG1BOVYyY2ZpejRFcTdMRmN4T1lxT05EV0ZoQVFyaDVWNU1z?=
 =?utf-8?B?Uy9sTGdwUmEySDR2OGIzemNMQ3l4N09Ba2VtVXNPTWd3RW9YQmVsZklkWmgv?=
 =?utf-8?Q?/YHUvEEenw8m1xcP+9Cewsu967HqAlcK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWpUNW1KWGsrMm9VKzRUVkM4RWZiV21OaENXUzY0UzVnVW1SemtITTlPZndl?=
 =?utf-8?B?ZTRHVC81V3JjRDFxRHFFTDV5RzBBRE5obXU2Q013c2p1T005S0h1bU90Ujlh?=
 =?utf-8?B?L2FSc01YN29oZHdMMGRKd01GS2NmZGNSK0VpOFduVE9uTUFUWDNpNXUyV2dF?=
 =?utf-8?B?MDVpcUtBTTlDY3MzMlhBMnpFMFJQUnV1Z1RXRlR6dmFENzluVVdSTnUzZHdJ?=
 =?utf-8?B?bEh5M1NmVk5YMk9WQmxkTHFYdGRKUFFmQTArbkNuZ3d0a1Rnd1FVV2FmSDZ2?=
 =?utf-8?B?eWkzTzErRTVzMFgrT2ZySEVmZ256amMyMHpRbUl5aXdoMUg1UUFqSWxJVmRz?=
 =?utf-8?B?Yzd6eUxTaUsvRmJva3V0YUl0bnBtSUZtN0ZZVG9GcndHZmRmdGlaT1FudTdv?=
 =?utf-8?B?YjhaSTF6NEtjQ0xQRmZFRTdoQzl1NXo5eGNsWDRQM2VNRUgyZ1lEUTNFbUpl?=
 =?utf-8?B?TTdDVW44M1U2amFRcjFGSXA4Vzg5NUdNYko2MXRDaEdBUGg5TEd6SXVDR2Zt?=
 =?utf-8?B?QzNYV0Z5alpyMkMvN1pDTVRWVWs1dTRqMVQzemxmVUZzRFZsZk5iemt4ZVpL?=
 =?utf-8?B?eDNQVCtGL0hWS0xqQ0M3bEpHUUU0NU5nNW5lVFFTbDkxb1NkczJsTzZ3YUtq?=
 =?utf-8?B?bzYrTStBMVJKbDBONnovbnRvTW5pdUczaEFCVWVtYlAyQmhwam5qWHRmakJR?=
 =?utf-8?B?UU9pUVN0VVFzSUM2RHNGV3djWWs0YnZWek45MjdXVVYxckF3YkZiN2VZQ0Fh?=
 =?utf-8?B?YkVpb0dYZjY5dy9Yazd0Y0JJWnh0Q1FIODliVUtIWmoxMXlzZ0NJaTF0RUxH?=
 =?utf-8?B?L09yM2piVzBMZGNISnhZRTRHdWVlay9leGdRcGZ4L2JXa0Nyb2tWeUQ1SklC?=
 =?utf-8?B?OTRTajhOaWJnUXAwRFhJZnpVV2NtdlpGRlFOWlo0b3Rpa2Z0Nm44SzIwbzd2?=
 =?utf-8?B?RTE4cXNSV3VyU09rRmxoQWZ0cDZLZ0pDVTBISEFIK05EenQ5SmdMUjB2dno2?=
 =?utf-8?B?cWh0N0dxVUhianhXeGd4Z3k2dFhCT0FRTGlYSWRhOHBVeGcrOHdOcXlSWHhu?=
 =?utf-8?B?MVMveXBmQ2ZScXB3bmVOeXdlYjNJSHV5MXplL1pKdXRPTWhaYzNXOTdSZUN0?=
 =?utf-8?B?dDBGbjdFNDFKUzFQUW0yNm9EdXRtVmpRaHB1RElFWHZoQzJOTjFPekQvTFNr?=
 =?utf-8?B?VHc3b3VYMG5GakRkNG9IWndvNmR2Ny83YTVEYW9mR2dwUGt4QU5YcVpxWTdD?=
 =?utf-8?B?eU5ydmdaZUNRNTBYVWl3SEVTU2ZaZkJHOUxKWWlKekcxSUJyUlVNY2RpTmgz?=
 =?utf-8?B?TEpwS1pFQ1drMU01Q1gvTnR1U213QkFZazBTKzFub1JMb1lQdGx5NlpKWDNW?=
 =?utf-8?B?S1piZXc3VC9RYWtPcWt1UUpNWHZzZ2V6VklWZjJCaGIrTno4eEZRcTJkRkIr?=
 =?utf-8?B?ajFJSDc4cXlEdW4wRUNkQzdTMk1wa3VyY3N0cXZybUpKRGkwWktMb3lUVFJr?=
 =?utf-8?B?YXRVbE5TRC9ZV29SdmpYOEFPc0V1VUpVOWFTOEpXN1lxZXNLR3ErVk1yZEY4?=
 =?utf-8?B?WkVRZ1AzTW1uM0hpY1RlWXo5YnFKdEVXMGNuRHBtTksybWw5RzI2N0F3dTAr?=
 =?utf-8?B?S3g4N2NQKzdmTFc5R2pxYUY1SWlSK1QyZG1IdThsMi9qcUZQQ0JYNi94TzFt?=
 =?utf-8?B?SUZoanRSQ3V0dGlMV2tvTlVFa3FCZzdVay9mbmhyUEk4bzEvTEtlMlpPZGpo?=
 =?utf-8?B?bWpudnBCaUh5eDFPNTBScklyanFLRTgrWGZ0UjdCaFhIcUJ3aWtXVC82OTZw?=
 =?utf-8?B?Nm96bnFaVisvSTU4dDRnSXM0L0hnVDhJNktVandzdFh6bkZFYXluRzNqVDBL?=
 =?utf-8?B?YTBWVlBickZtck1ueXhsYmxzOGFSUXFJMEFBdTRJY2dkd0U3eHdIVitjdnFk?=
 =?utf-8?B?aGV2TXNDcEJ3dm80Z2lRWWtTamtzTjlLeTVrejVnLzJlNkUreFh6NFk2a2dt?=
 =?utf-8?B?Q0dsWU9lT0o4b3paT095SzhhUGlPWEVDU05jeTB3T3RoRmJrRlh2U1B0Sm9m?=
 =?utf-8?B?ZXBwaWIxQURmSDBNNkpSU1FTSHNaU082TVp0L1hGUnphVUVQeGhTTXBvZDZx?=
 =?utf-8?B?S2xCKzJsOWRsa25UWjJoR0JVWDlYeEtJODJhayt5NnVKNElEK3Fvb0JRdFYx?=
 =?utf-8?Q?6lAIGp5Zjb0OliFeL0EOKkw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dWmv3IDczoVr6Lbx1OK51NcAJucWURuEPwvoNTm4S/BXqRnMnYXSxrrPY1yGC1h2xC9flwFenCu9hzy399w+oNl4ADjTWrckEHyUYfhFVdV/iid9kR4HwmNm84HgdCSj7MI9/cU7ahREF78TE0ZNMqSwjdEbXnkcy+LSkQ158u3B/dx0dUFuKnVOiAvfHDzIpjTFnQpdkXsqxHj6OioKZrlXmPowx50/d2GYrWZLU1w/3GrA9OGcgiilBF3J2GYNu0UHFODWfUAgbF/JTdWcMzHrJAYkBORLqSz03JC6rGOPdyGfgk3e0obayMRkQGn3y0ccvLvuy48TmQPVrqDTVYn9eOyMWJZrbZrBmMRdozsHFmzkUBRnX8B8knbljmO1YIufLMOlAfjv7BuWKuuvoCcJbYcZ1shcR3QfwOJq31XY/UkzjPd+JUaKDz3YCrlarOwnSb6NPGisF8le1eGwbfrNHDOJ+m08PViAZm8Bm/8zzB8VTdWyFkYMoYraBMPuB3F5Wow2PNUbU8bZQjxVM5ryCQFJ8L1jO5sLPTbpnC3hA3sKtEFkt2ni4FEc7AircOb6kQHbC9Mt1CpRJaKwKw8ZrmVHbpwNUL075UZXjHo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9991207b-4efc-4f87-dbbb-08de126b1d27
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:33:59.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2ZreKylyf91LLPy4KkM7/IRcIhibkRB9KIDfQkm51W5haHoQAt8hKezLoN5UTvsUX3cpX5IxDgYfMJodWb+fMQWxaeuPUr1yZ9JRj5ncZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510230179
X-Proofpoint-ORIG-GUID: P9G2ttOy2eQU9MVai06pErfG-HewFH27
X-Authority-Analysis: v=2.4 cv=XJc9iAhE c=1 sm=1 tr=0 ts=68fa8335 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=ya8n6P55ioffdQ_uoxoA:9 a=ht3SdGwVgXH9XrWC:21
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMiBTYWx0ZWRfXxEetmY8iRV+g
 hut46IQwxt2rUUXiAH9w6IpsFnI1r95QpA1Xt+UGdAN43b/tZilAneHn0/aLT1G9lYtVifJMEVY
 FI02fFJ0XCqLHrnqlh52qy9pbKQk05ZcRH2BFTCdX9hO88j5/bXu3+uAZusJIEZggxKp2nRENpZ
 pGpeCMyLIzJOzKqRHTGn0vOrfvDbFWnWU+ISGxHajUjZdG5/rxXBndzhJSrWzG66mU1Pb1D2p9m
 0gKcWXmsAD5LGA75ozYmcTw7I9bldpUvPxA0fjzHJnh9QtfCR1B+rLccJYS7ICvRcFxjDyMzszN
 OjaZgQX7FzzuNSHD0O9SR8EzYrBckt4deDjhpBvFjYpUpjnoQwfgMcQl/Nu1lksyR+oz/kyJj+6
 DjAE7tYp7X7A20VnHimpmjAc7tlw/g==
X-Proofpoint-GUID: P9G2ttOy2eQU9MVai06pErfG-HewFH27


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 10/21/25 9:22 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> There are two references to "Table 1" (which is not otherwise
> identified), along with links to an undefined ID.  Rework these
> references.
> 
> While we're at it, convert the table from HTML to Markdown and break up
> some longer lines, improving readability and maintainability of the
> Markdown source file.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  .../reference/dtrace_providers_profile.md     | 95 ++++---------------
>  1 file changed, 20 insertions(+), 75 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
> index da83e8561..762109d02 100644
> --- a/doc/userguide/reference/dtrace_providers_profile.md
> +++ b/doc/userguide/reference/dtrace_providers_profile.md
> @@ -11,86 +11,31 @@ Such probes aren't associated with any particular point of execution, but rather
>  
>  The `profile-*n*` probes fire at a fixed interval, at a high-interrupt level on all active CPUs.
>  
> -The units of *n* default to a frequency that's expressed as a rate of firing per second, but the value can also have an optional suffix , as shown in [Table 1](dtrace_providers_profile.md#dt_t1_prov), which specifies either a time interval or a frequency. The following table describes valid time suffixes for a `tick-` *n* probe.
> +The units of *n* default to a frequency that's expressed as a rate of firing per second,
> +but the value can also have an optional suffix, as shown in the following table,
> +which specifies either a time interval or a frequency.
> +The following table describes valid time suffixes for a `tick-` *n* probe.
> +
> +| Suffix         | Time Units                                       |
> +| :---           | :---                                             |
> +| `nsec` or `ns` | nanoseconds                                      |
> +| `usec` or `us` | microseconds                                     |
> +| `msec` or `ms` | milliseconds                                     |
> +| `sec` or `s`   | seconds                                          |
> +| `min` or `m`   | minutes                                          |
> +| `hour` or `h`  | hours                                            |
> +| `day` or `d`   | days                                             |
> +| `hz`           | hertz \(frequency expressed as rate per second\) |
>  
> -<table><thead><tr><th>
> -
> -Suffix
> -
> -</th><th>
> -
> -Time Units
> -
> -</th></tr></thead><tbody><tr><td>
> -
> -`nsec` or `ns`
> -
> -</td><td>
> -
> -nanoseconds
> -
> -</td></tr><tr><td>
> -
> -`usec` or `us`
> -
> -</td><td>
> -
> -microseconds
> -
> -</td></tr><tr><td>
> -
> -`msec` or `ms`
> -
> -</td><td>
> -
> -milliseconds
> -
> -</td></tr><tr><td>
> -
> -`sec` or `s`
> -
> -</td><td>
> -
> -seconds
> -
> -</td></tr><tr><td>
> -
> -`min` or `m`
> -
> -</td><td>
> -
> -minutes
> -
> -</td></tr><tr><td>
> -
> -`hour` or `h`
> -
> -</td><td>
> -
> -hours
> -
> -</td></tr><tr><td>
> -
> -`day` or `d`
> -
> -</td><td>
> -
> -days
> -
> -</td></tr><tr><td>
> -
> -`hz`
> -
> -</td><td>
> -
> -hertz \(frequency expressed as rate per second\)
> -
> -</td></tr><tbody></table>
>  ## tick-*n* Probes <a id="dt_ref_profile-tick-n_prov">
>  
>  The `tick-*n*` probes fire at fixed intervals, at a high interrupt level on only one CPU per interval.
>  
> -Unlike `profile-*n*` probes, which fire on every CPU, `tick-*n*` probes fire on only one CPU per interval and the CPU on which they fire can change over time. The units of *n* default to a frequency expressed as a rate of firing per second, but the value can also have an optional time suffix as shown in [Table 1](dtrace_providers_profile.md#dt_t1_prov), which specifies either a time interval or a frequency.
> +Unlike `profile-*n*` probes, which fire on every CPU,
> +`tick-*n*` probes fire on only one CPU per interval and the CPU on which they fire can change over time.
> +The units of *n* default to a frequency expressed as a rate of firing per second,
> +but the value can also have an optional time suffix as shown in the earlier table,
> +which specifies either a time interval or a frequency.
>  
>  The `tick-*n*` probes have several uses, such as providing some periodic output or taking a periodic action.
>  

