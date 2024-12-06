Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CA0199E92
	for <dtrace@lists.linux.dev>; Fri,  6 Dec 2024 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733481367; cv=fail; b=dNJ2sbwOEb+SzIIBUkGqSkqbgnWjZvEAmco1lqT8Z9EeAesb3ANuWs9KwntErAUaNsAy97XORJnx7DUTPJic98OrKPQVuLQrM4V5Xj2KVZHmFeUG/jgKqk5pE2rAr1QJebU1nX6z5JFBSX6W7RatIkzFf5puCDABRkRwtpWnYH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733481367; c=relaxed/simple;
	bh=AjC7ma2St5pMubkyBgNXB2t72O1pYXIMajJrbhdRiB8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s0nybBFLj9hKAVYOoVdCJegk8iHs7tNXLyb9hjSKk32BV9HLIOPvXvXshNkwQ3Zrq5z36JP8cuH60qAt3USZs77V8ywHV3LE5bwfOAto2rBO8Mfsv8f11Ly6M9mManHzmHNst6cxcGLwbmlDIsdmgTZMZDlqXeRJ6GOAqdWveHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m50fnWmr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s7w4bBum; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m50fnWmr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s7w4bBum"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B66s2Xk027302
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 10:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=C/ynwAWkmH4oRFnufze1PBve29b7RrSshvlRQB/Q75Q=; b=
	m50fnWmrj9VwdFLW4xpk/Xmq1Mw2wTyc1qjw+2KnvYtXsKeaM8CJ6nEevkm0Fgc/
	yZawmPEwO3wd+JG2nk2MARJywRfQFdNyTFFmRJ7uHX2AgUvMdogEu/K0QMakCOvu
	i4swNIFq2rxgREJyURkdOalL+gY4F8bkKbXBlEhbrugp3I89QG/wJrmS3lCYLkw4
	o+wfWgYGpLjGP7T10BXyKD1lVCVNCUmMsjZ88j+KZnn3DQMCpWoGfaEuctMaf4+v
	t5GHGrPYWpMJyNjy/Dhq6Jpc1LV/Y2tv75xh246UUmw+fuS2c6i5UZpF7UxLCKuD
	0qu8VcjGvas9cfZx5dAGZw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tk9544x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 10:36:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6A9GvB036791
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 10:36:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s5cp4e1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 10:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PDxd+SXjhuOHhaBjNDmUEOaw8kpH5Z3TxreFs2B5BB7JcL5/yHU2veplIQgaeED29uozwwKS3T0hbcV/GiVDZVSk80BYOVpQOOmo3/EYRM66TMaE6UhFVpgYSYNTXECKB7shbKwjDOnDuhj6XmeeOGKQgGCgbABC5qzNfJxsLN/fOSes0ms3X+okB7tGpeJ6a8OIFAGq9ceME4gHVFEfUhOdW4qP+CfIMc6YQk138fYOzExXGyZwh++bGAKTzt8gIwd66S85zBpbbw14BFlESUrGjeL9YcZeQYvnh+jBfckrGS+tO2J17fYzfA5dO4Wsrmj444embPHkq9P+9Ufv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/ynwAWkmH4oRFnufze1PBve29b7RrSshvlRQB/Q75Q=;
 b=QXO7Zh82wUjevTW38fGFVmszVACZZDvXs+ldgry2LtnoV7f9BjAU3BSHVVRk8X4mNqmwXHRETnoT5AJTaYQ3V+wX5OH81d9/nyJs31uch0RP+s+iCPGtvm8lCE0LyXNvzdJ6d03MIRS06hha7iIghjg0qqfuqboOg6HcW83lMvmhadGnvZl1BZHhLUlwvAom3nF+VNkjzNJ+6QwTJdlPNuSHN1TEi84jJoUPvJBgJ/Qi24Acn/rMerStG9ISRQl35g2V4Dtdcx9oPw3LXIxe9C9Sz5pCLPtW9RK47yhEG0AwhnOHh3XUqAJsW57dEAt3UNVFTGWOFOWUsqFSJwIxfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/ynwAWkmH4oRFnufze1PBve29b7RrSshvlRQB/Q75Q=;
 b=s7w4bBumKdut2elmGDVyk/ZhPssGtKXj4RAbTLRSwb7yHMQoRW7SVwAXgUlA3fYxIGAEd5sYdCA5DgMXjBmXx9lRANJc2vuA2ePKa7fkGx3ZIL21v5R6OHWvSBdVklmz2iiAGsxOBeMPI4jRkCIirnLDIAu1jAR65j7RuKJQ4AA=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by DS0PR10MB6246.namprd10.prod.outlook.com (2603:10b6:8:d2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 10:35:57 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%3]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 10:35:57 +0000
Message-ID: <7b734e3f-2892-4282-9067-1b3ed69a8262@oracle.com>
Date: Fri, 6 Dec 2024 10:35:50 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rawfbt: new provider
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <PH8SPRMB00374BF4E363FDE8B36D9E86C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::31) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|DS0PR10MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: e33487a3-177d-48c8-b136-08dd15e1c4dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVNHaWhBRVBpdWlCWnRBSys1MjZoUHlETXA4RWt6ekp0U0RjRXJxV21HcTRo?=
 =?utf-8?B?NEVKRkQrYXljN0M4TFN4QklnZGMyQWo5RmYwVklMK3Q2YXFzSjNHTGRFT0xT?=
 =?utf-8?B?cTdJZGVGUWpEem1ob1NlNmZlYVhzME1adFdXeEpST2ttekxLQlZudC9qSDFm?=
 =?utf-8?B?VW01dnlVNkpZcVBUQ0xZSDhuL2o5V2NlT0ZvaUhvakMxK1hybkJTWk1tek9R?=
 =?utf-8?B?bldoZ1N1cm0vOWt6S0s1SU45bkF4d21vNnhUdDZDM2ZVZHp0TlJCTUd5cmpV?=
 =?utf-8?B?Zzc4Q3AvbGNnSFM3MjhmT2E2OVpSRWsvdVd2Vmt3V1FuR3VZQnQzVlVGVnRI?=
 =?utf-8?B?QTRuZHhDUU1INkhndEplQXhyaGJ6WUVTUGsvbXN2T1NIQXNwdXpra2xheEFD?=
 =?utf-8?B?dmM2OVZSdSt2ZUJyaXFmTXJndFphaFpCeVp0ejZjNktEZ3djbzJRay9xZHUy?=
 =?utf-8?B?RmRNcXREeXpCREI3UFc2YWZkMzUrNUtSMnV0c3VRTUd2QU15SkVGanZ6Q2d1?=
 =?utf-8?B?cjgySXlUcGR4R1VYZmhJV2RXRnNSM0xxS20xNFUySmZFQmVmelFaZjZFZENi?=
 =?utf-8?B?eG5aM1BPS0xoTlJzS3QyVHN1cENqYlpJV25ZaXIwYWNGMjdBc2hvU3A2N2ZV?=
 =?utf-8?B?VlBpVGZ1YnJkenkwWUdZVjVHWElyNTFKMkJhOFJRZnBXd2lGT3A5azFDdVhR?=
 =?utf-8?B?TEp2WUlBVnZHWE1JR1IrdFRIeDFhbjFWbEZrMjJEdlg4c04rR3phNUlGajM2?=
 =?utf-8?B?WW5uQWlRb0d3QnNQc2M0aVRtVy9OYmlqRkFYWW5USnV6N0FtU20yMC94L1lm?=
 =?utf-8?B?QlJZeXIvb21LNWh3NVd3LzE1dFNLNFFHYWd3OGlxYUs0WlNORDlZZ1NldW5k?=
 =?utf-8?B?eVRyUG9WSU5jSDdobEticUs4SGFLN2toeUlZSlkveDZxVGVpSWlBTDhLaUd4?=
 =?utf-8?B?Mzc5STgzQVlsR0dWR3NQdGNLa1RKWXF5Y1Jjc3U3NjRwSHk0cGJWTTVpdDFk?=
 =?utf-8?B?M1V5YThtU0h3VE5EellLOWFwOFAwb3M0MEUyUDQzVy95ZmFDa1FnMkp4eHdm?=
 =?utf-8?B?a3FYU2Z3RVBMSGFYalhvcXRoOWpRSXM1WUk2ajUxMktwYXlRWEVTZjdGaGNL?=
 =?utf-8?B?clhiYWlGNERRWmh2VDNKTEdDMTNTMGV0T28za2MrRWRMem5WVG1LRHJUekha?=
 =?utf-8?B?alBxVVVjdHhpSVZpdGdtblJjSUNhTXE3V2V3NEMxMDdaRGFVbGsyL1hBelh3?=
 =?utf-8?B?aVE4YXBLWVRqa2hQcE1FZzBWa2ZPcWJUK1ArSHhkcTRPQVg5ZURRN3B4aWl5?=
 =?utf-8?B?RW9xOTZHa1JuSGMzWlhHeWRIb3I3YVcxTHVhNlIxbTJ1L2ZDa2pzMjVTVEIy?=
 =?utf-8?B?alBOeUZiZE9lcTlGTTY1TXJuME5uNXo4S2tiN0NmTjR4dTczQnBFV2lTUk1Z?=
 =?utf-8?B?eGxLcENYNCsvcE1oVUlrMDloc2pNNldzNDhxNnFYK0R2S3RpZEJNcmlzYzhD?=
 =?utf-8?B?M1JVekdVb2R0SzVZanVqWVZKQktWcVdUcWV1RFlhVGR1NFBtM25ROEJUZnRN?=
 =?utf-8?B?aUlyK0VJaWR2bHdhOWJlaGViLys5OVIxNmNVcDJ0ZGszS3hpbWZFUmRMZnNv?=
 =?utf-8?B?Q3NZdG90T3dRRHIrZWpuZzNlNlo3NUdYL2JBSFFsN1Yzdi9YWmxZMUJ1cm9Q?=
 =?utf-8?B?V1J6Zmo3OHdMQzBMcnJucVpIY25KMW9iRXdsS2pKUlVQTk5nTnYvZjR3K0pT?=
 =?utf-8?B?bmIycm1Yb0hZcStNMGlXUE85bjd3ZDJsdHlFVVZKUDdnZHc2SFltSHU3OSth?=
 =?utf-8?Q?+/wp9Pv720VRTp8DVrSvOK+dUYnZ23rRSAtIg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkJwWXNsWFpwaHg2amFPZUhTaGlScE1EU09rZDlWQURKam1CNDNMZDBPWDFK?=
 =?utf-8?B?aXJVbWg5Wm8wZlJodHhtZm5DVTVSU0RVR0VUVXlHbGluUUpySnRWaDB0djlU?=
 =?utf-8?B?VnNlRkhCZWN4ekIxNzJMTEozTXN4YjRtRGx1Q013SjBHZlVweFRrWEJ6V1Rv?=
 =?utf-8?B?Q29xVTA2VGNhN1ZFWHBWa2UzblNiajBGa3h3VzdUV1lZenArekVlbmhNN2Fs?=
 =?utf-8?B?NmhuZ2sxZTdPZ0F1UnhSalBpZHpxczNoNTRQT1UzcncvRnd4TkdUYW0raml3?=
 =?utf-8?B?eWx1bDFYZjFQYU5JZzgvSjhyNEJWaFkyV1Z1TyszSWZQbU9XbnVOOVFwa0tI?=
 =?utf-8?B?VHBXU0VmNmd0MXl1MVhNUEtSOGRsZW5NcU5ZRVY5Q2Nzd1Q3ZFZIYWp3YTNL?=
 =?utf-8?B?UzhaZVBLalFSN1pvdXJBbEcwTnVFMUE2eWlxdmRrRVp0THBnRzJYNUFZYzlv?=
 =?utf-8?B?SHU0ZStZY1A5L1NDVVNVZXBWTXlxd0pmYytycGVDZks5WXNxekx1MmNLV2lh?=
 =?utf-8?B?Z1JSMHlrbldNUjBsMXowbWdmTWpjZzB6VzVZYWpTdHFDUnpDQnNIbG5mWHlL?=
 =?utf-8?B?RU1seHE1a2JyeFR3bUtFUnowUVpiM0FJcFA4bmtxakFZT3lYdjJjUFpsd1hi?=
 =?utf-8?B?dGQ0ZVByNEZiL3BYTEl1aEcxai9EdExHcVlVVHowR0Q3WDZVR0ZWK3h3UVRw?=
 =?utf-8?B?ekFKV0hzdm9Jdnp0MmhmUDVvSGN1Tnk3TUFEc1EyS0xCMXBBZ1hwUkJMYTg5?=
 =?utf-8?B?WTE0N2ZzUzhMWTR0YnFzWEMwTFVOTXdkL0NhUFYzenR3ZzdxeVU5U3dpZVdM?=
 =?utf-8?B?V25YcEtzdDZiRlhXMDFhSWxZUmpCNElKZFNEWFI0UVdhME1UYUZiTU5vNldO?=
 =?utf-8?B?QWlWeDJ4UkVwN0h5eXlQWGNNVDVsNFZyNUVmUlVqUjNWYWgxY3BhVStLNHJn?=
 =?utf-8?B?YmJNNkY5WXNqMUkraTB1WWF5ci9nMDNBV2pQRllHamRpZWFRaFkrR2VMT0RG?=
 =?utf-8?B?anpCRXNiQmErWGJmaU1KMndWM2x0OTRDK1VKYmwrMlJ6dUY0dXpjY20zaXBR?=
 =?utf-8?B?azFZYXEyaUUzbWNPMFNvdjVaNHE4T3dmMWtzYVhMWnBtbVcwVkRRRytCVnpm?=
 =?utf-8?B?NHcxekxMd3pVWUh4WkpoVFc2S0Z2TWR6dzViekw2a1p4a3ZpbUNTMlF3TDhn?=
 =?utf-8?B?eDZxV0hDaFp6R2wyNkZraVJySzcxSVhISzNPVnN6YlZTWG10aGMzWkRxR3Fv?=
 =?utf-8?B?Vmg3NGl1Y2d1VGF4OWk3QmtKeTVUY2ZMMWdJdlh1bDBNZE1OYnVVYnRQNnNu?=
 =?utf-8?B?emZ5T0lhNFord21ubTN1NkxxdFVlR2JhOUFVZzh4YXVCY2krb0piWjVFUUhL?=
 =?utf-8?B?S2FLRFNCWk9FK0dpejhpM1VYMTgrdHkxSjR3V1V1eE1VR2RQKzVmYnpwVjVM?=
 =?utf-8?B?OGUvUkRQU1hFZldHQnpxbGQvNmRXRTVMajI5M2Zxb0N4UDlKaDQzS0t6eTZM?=
 =?utf-8?B?ZlRDd1B3WGRLZGppN2x1UDUyWUtCbkY4L0FFQlJzdWhDVGUxZGxZakRMSis4?=
 =?utf-8?B?NXoxMmtaZ2srVHh3SmRZRW1zSWFOYmo5QW9QNEhzQ3lJWjJLZlF5YXArMVRq?=
 =?utf-8?B?NDU4TU9tdkI4aktrRFRwc3p2M2duVzh6eHEzOUJxOXRUbXhHS2NPeXhzY0tZ?=
 =?utf-8?B?OURhaTNyejM2a1pKQzlDWEx1b1JYL3dobDNMT3FxUUFzMjhEZlFZY0g4cDBx?=
 =?utf-8?B?Z2R0Z1JtbGxuVWtsek5ZeGNha1dmSThZejhhc25OWGRpZlU0Umd0aUU4VWsz?=
 =?utf-8?B?K1BPS254NDhkL283Sk9DQ0E1L1lUL0prYy9nbHk5NE9WekczWWJoS3dQUFBL?=
 =?utf-8?B?Z0RiZld1QmNYYzdnTXA3TTI3VUU3TDBza1o0MTFXcjJpL3FiWUNLSWNMV29S?=
 =?utf-8?B?UHd5MnZWT3Q4cFZzZ2N5TThCT2pIZyt3cnEvdDc1cWFKdW9CMFlpeEdKeExD?=
 =?utf-8?B?WnRNejNzZUxJd0E1SHI4YldPRjRGdTdyYkRmRHhBZHNwVVVyb1JISi82bHgw?=
 =?utf-8?B?RGFKdzhVM0EzT1FCbFpaQ3BJMkZMZmdQTHBMRXRta0N4RzgvODd2Zi8yY2xr?=
 =?utf-8?B?eUY1RnZlZ2ZGS0VRSUoyUElPK1BPQ3FSOG93S09uOEdPT2UrRU85cHJoMnBh?=
 =?utf-8?Q?v9uHt7XTBBnAFjrYizMVNlA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jV8MeSn51De7h1JPflLyVetp1NlJua9g4wbcCij/R7LIP5Ku9PdJ2zoYgaL08uo5fLC1t4dyeSB1wxDuMBXAGPrBfkyNXmjBNFf3gg31p3EQNXxLy32jbDDsmJ/3q4OdNpY94lYt5wDTJyFSjddmponi2RFYgf3HMjAVb5WWEnQ2aQtqQ0srCVSBPsMbwpu/Jl+FU5A9GAC8TIgMhDm2tAp4ixUHGFD1sSmsGtpx3Tc61DrC14OBXJhKzbAvZgU+rT4Ow0RIVGPrAXi6P4eSjCQAN7AeZKovd1GEQUF2flXcilrBoX2xnjl9ltHT02uaZ7GFl6ighokkxT8ZjTj/XJg7NBzV/x/P68LrwVSGQslCHkrk1ndQk6Kv6+S+17CZq4gd27hPhlwKBcMvKNM27Vd8SAgHCWDC/Ha5UL8i6fQbbpZ2EQ8TN8gRlKjm6K0ZT+c+9ZHGoEYtTYtqVK/yfmosSkHNhh84zq7A8zPzfPX8NJUt60R+8YaDd5anpj49/YGfpwd+QQORNWXKC6UkLF5+7Rb+n6vz2VdMZ89mYgWdVTWDB2gQEeZTmTIDa5jTSSa+jQDd/zffkMCD+xqgwXVagGIMtnxE1kArpzakXy0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33487a3-177d-48c8-b136-08dd15e1c4dd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 10:35:57.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FY1oTMrAeLlRhlNPAOhkFgLh51P8PHAh/2cIXJ7zGRaYioLD8IMD0VLIV+99TN+R8CeSXUNw553fPLUZFv58hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6246
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_06,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412060076
X-Proofpoint-ORIG-GUID: puwaksWoDKK_FZT9YnZD4UnGA45UWbBp
X-Proofpoint-GUID: puwaksWoDKK_FZT9YnZD4UnGA45UWbBp

On 05/12/2024 19:42, Kris Van Hees wrote:
> This provider provides access to all kprobe-based probes that are
> available on the system.  This includes any compiler-generated
> optimized variants of functions, named <func>.<suffix>.
> 

This is great! Having a rawfbt allows users to still trace cases
where fprobe can't currently handle.

On the .suffix; I get that this is intended to be a raw provider, but
would it be better for stability to expose these functions as "func"
rather than "func.suffix"? It becomes difficult to write portable
scripts when suffixes are included, because wildcarding

rawfbt::func*:entry

...to catch both suffixed and non-suffixed variants may end up tracing
func, func.suffix but also func2 etc.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/Build            |   2 +
>  libdtrace/dt_prov_rawfbt.c | 330 +++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_provider.c    |   1 +
>  libdtrace/dt_provider.h    |   1 +
>  test/utils/clean_probes.sh |   2 +-
>  5 files changed, 335 insertions(+), 1 deletion(-)
>  create mode 100644 libdtrace/dt_prov_rawfbt.c
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 8d398221..72235159 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -55,6 +55,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
>  			  dt_prov_lockstat.c \
>  			  dt_prov_proc.c \
>  			  dt_prov_profile.c \
> +			  dt_prov_rawfbt.c \
>  			  dt_prov_rawtp.c \
>  			  dt_prov_sched.c \
>  			  dt_prov_sdt.c \
> @@ -112,6 +113,7 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
>  dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
>  dt_prov_proc.c_CFLAGS := -Wno-pedantic
>  dt_prov_profile.c_CFLAGS := -Wno-pedantic
> +dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
>  dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
>  dt_prov_sched.c_CFLAGS := -Wno-pedantic
>  dt_prov_sdt.c_CFLAGS := -Wno-pedantic
> diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
> new file mode 100644
> index 00000000..edfd36b4
> --- /dev/null
> +++ b/libdtrace/dt_prov_rawfbt.c
> @@ -0,0 +1,330 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + *
> + * The Raw Function Boundary Tracing provider for DTrace.
> + *
> + * The kernel provides kprobes to trace specific symbols.  They are listed in
> + * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
> + * a symbol in the core kernel or with a symbol in a specific kernel module.
> + * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
> + * provider also provides access to synthetic symbols, i.e. symbols created by
> + * compiler optimizations.
> + *
> + * Mapping from event name to DTrace probe name:
> + *
> + *	<name>					rawfbt:vmlinux:<name>:entry
> + *						rawfbt:vmlinux:<name>:return
> + *   or
> + *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
> + *						rawfbt:<modname>:<name>:return
> + */
> +#include <assert.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <linux/bpf.h>
> +#include <linux/btf.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +
> +#include <bpf_asm.h>
> +
> +#include "dt_btf.h"
> +#include "dt_dctx.h"
> +#include "dt_cg.h"
> +#include "dt_module.h"
> +#include "dt_provider_tp.h"
> +#include "dt_probe.h"
> +#include "dt_pt_regs.h"
> +
> +static const char		prvname[] = "rawfbt";
> +static const char		modname[] = "vmlinux";
> +
> +#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> +#define PROBE_LIST		TRACEFS "available_filter_functions"
> +
> +#define FBT_GROUP_FMT		GROUP_FMT "_%s"
> +#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> +
> +static const dtrace_pattr_t	pattr = {
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
> +};
> +
> +/*
> + * Scan the PROBE_LIST file and add entry and return probes for every function
> + * that is listed.
> + */
> +static int populate(dtrace_hdl_t *dtp)
> +{
> +	dt_provider_t		*prv;
> +	FILE			*f;
> +	char			*buf = NULL;
> +	size_t			len  = 0;
> +	size_t			n = 0;
> +	dtrace_syminfo_t	sip;
> +	dtrace_probedesc_t	pd;
> +
> +	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
> +	if (prv == NULL)
> +		return -1;			/* errno already set */
> +
> +	f = fopen(PROBE_LIST, "r");
> +	if (f == NULL)
> +		return 0;
> +
> +	while (getline(&buf, &len, f) >= 0) {
> +		char		*p, *q;
> +		const char	*mod = modname;
> +		dt_probe_t	*prp;
> +
> +		/*
> +		 * Here buf is either "funcname\n" or "funcname [modname]\n".
> +		 * The last line may not have a linefeed.
> +		 */
> +		p = strchr(buf, '\n');
> +		if (p) {
> +			*p = '\0';
> +			if (p > buf && *(--p) == ']')
> +				*p = '\0';
> +		}
> +
> +		/*
> +		 * Now buf is either "funcname" or "funcname [modname".  If
> +		 * there is no module name provided, we will use the default.
> +		 */
> +		p = strchr(buf, ' ');
> +		if (p) {
> +			*p++ = '\0';
> +			if (*p == '[')
> +				p++;
> +		}
> +
> +#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
> +		/* Weed out __ftrace_invalid_address___* entries. */
> +		if (strstarts(buf, "__ftrace_invalid_address__") ||
> +		    strstarts(buf, "__probestub_") ||
> +		    strstarts(buf, "__traceiter_"))
> +			continue;
> +#undef strstarts
> +
> +		/*
> +		 * If we did not see a module name, perform a symbol lookup to
> +		 * try to determine the module name.
> +		 */
> +		if (!p) {
> +			/*
> +			 * For synthetic symbol names (those containing '.'),
> +			 * we need to use the base name (before the '.') for
> +			 * module name lookup, because the synthetic forms are
> +			 * not recorded in kallsyms information.
> +			 *
> +			 * We replace the first '.' with a 0 to terminate the
> +			 * string, and after the lookup, we put it back.
> +			 */
> +			q = strchr(buf, '.');
> +			if (q != NULL)
> +				*q = '\0';
> +
> +			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
> +						  NULL, &sip) == 0)
> +				mod = sip.object;
> +
> +			if (q != NULL)
> +				*q = '.';
> +		} else
> +			mod = p;
> +
> +		/*
> +		 * Due to the lack of module names in
> +		 * TRACEFS/available_filter_functions, there are some duplicate
> +		 * function names.  The kernel does not let us trace functions
> +		 * that have duplicates, so we need to remove the existing one.
> +		 */
> +		pd.id = DTRACE_IDNONE;
> +		pd.prv = prvname;
> +		pd.mod = mod;
> +		pd.fun = buf;
> +		pd.prb = "entry";
> +		prp = dt_probe_lookup(dtp, &pd);
> +		if (prp != NULL) {
> +			dt_probe_destroy(prp);
> +			continue;
> +		}
> +
> +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
> +			n++;
> +		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
> +			n++;
> +	}
> +
> +	free(buf);
> +	fclose(f);
> +
> +	return n;
> +}
> +
> +/*
> + * Generate a BPF trampoline for a FBT probe.
> + *
> + * The trampoline function is called when a FBT probe triggers, and it must
> + * satisfy the following prototype:
> + *
> + *	int dt_fbt(dt_pt_regs *regs)
> + *
> + * The trampoline will populate a dt_dctx_t struct and then call the function
> + * that implements the compiled D clause.  It returns 0 to the caller.
> + */
> +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> +{
> +	dt_cg_tramp_prologue(pcb);
> +
> +	/*
> +	 * After the dt_cg_tramp_prologue() call, we have:
> +	 *				//     (%r7 = dctx->mst)
> +	 *				//     (%r8 = dctx->ctx)
> +	 */
> +	dt_cg_tramp_copy_regs(pcb);
> +	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
> +		dt_irlist_t	*dlp = &pcb->pcb_ir;
> +
> +		dt_cg_tramp_copy_rval_from_regs(pcb);
> +
> +		/*
> +		 * fbt:::return arg0 should be the function offset for
> +		 * return instruction.  Since we use kretprobes, however,
> +		 * which do not fire until the function has returned to
> +		 * its caller, information about the returning instruction
> +		 * in the callee has been lost.
> +		 *
> +		 * Set arg0=-1 to indicate that we do not know the value.
> +		 */
> +		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
> +		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> +	} else
> +		dt_cg_tramp_copy_args_from_regs(pcb, 1);
> +	dt_cg_tramp_epilogue(pcb);
> +
> +	return 0;
> +}
> +
> +static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> +{
> +	if (!dt_tp_probe_has_info(prp)) {
> +		char	*fn, *prb, *p;
> +		FILE	*f;
> +		size_t	len;
> +		int	fd, rc = -1;
> +
> +		/*
> +		 * The tracepoint event we will be creating needs to have a
> +		 * valid name.  We use a copy of the probe name, with . -> _
> +		 * conversion.
> +		 */
> +		prb = strdup(prp->desc->fun);
> +		for (p = prb; *p; p++) {
> +			if (*p == '.')
> +				*p = '_';
> +		}
> +
> +		/*
> +		 * Register the kprobe with the tracing subsystem.  This will
> +		 * create a tracepoint event.
> +		 */
> +		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		if (fd == -1)
> +			return -ENOENT;
> +
> +		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
> +			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
> +			     FBT_GROUP_DATA, prb, prp->desc->fun);
> +		close(fd);
> +		if (rc == -1)
> +			return -ENOENT;
> +
> +		/* create format file name */
> +		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> +			       EVENTSFS, FBT_GROUP_DATA, prb) + 1;
> +		fn = dt_alloc(dtp, len);
> +		if (fn == NULL)
> +			return -ENOENT;
> +
> +		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> +			 FBT_GROUP_DATA, prb);
> +
> +		/* open format file */
> +		f = fopen(fn, "r");
> +		dt_free(dtp, fn);
> +		if (f == NULL)
> +			return -ENOENT;
> +
> +		/* read event id from format file */
> +		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
> +		fclose(f);
> +
> +		if (rc < 0)
> +			return -ENOENT;
> +	}
> +
> +	/* attach BPF program to the probe */
> +	return dt_tp_probe_attach(dtp, prp, bpf_fd);
> +}
> +
> +static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp, int *argcp,
> +		      dt_argdesc_t **argvp)
> +{
> +	*argcp = 0;			/* no arguments by default */
> +	*argvp = NULL;
> +
> +	return 0;
> +}
> +
> +/*
> + * Try to clean up system resources that may have been allocated for this
> + * probe.
> + *
> + * If there is an event FD, we close it.
> + *
> + * We also try to remove any kprobe that may have been created for the probe.
> + * This is harmless for probes that didn't get created.  If the removal fails
> + * for some reason we are out of luck - fortunately it is not harmful to the
> + * system as a whole.
> + */
> +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> +{
> +	int	fd;
> +
> +	if (!dt_tp_probe_has_info(prp))
> +		return;
> +
> +	dt_tp_probe_detach(dtp, prp);
> +
> +	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	if (fd == -1)
> +		return;
> +
> +	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
> +		prp->desc->fun);
> +	close(fd);
> +}
> +
> +dt_provimpl_t	dt_rawfbt = {
> +	.name		= "rawfbt",
> +	.prog_type	= BPF_PROG_TYPE_KPROBE,
> +	.populate	= &populate,
> +	.load_prog	= &dt_bpf_prog_load,
> +	.trampoline	= &trampoline,
> +	.attach		= &attach,
> +	.probe_info	= &probe_info,
> +	.detach		= &detach,
> +	.probe_destroy	= &dt_tp_probe_destroy,
> +};
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 1e2e844e..0c621197 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -36,6 +36,7 @@ const dt_provimpl_t *dt_providers[] = {
>  	&dt_lockstat,
>  	&dt_proc,
>  	&dt_profile,
> +	&dt_rawfbt,
>  	&dt_rawtp,
>  	&dt_sched,
>  	&dt_sdt,
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index f62137de..59a8d62e 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -82,6 +82,7 @@ extern dt_provimpl_t dt_ip;
>  extern dt_provimpl_t dt_lockstat;
>  extern dt_provimpl_t dt_proc;
>  extern dt_provimpl_t dt_profile;
> +extern dt_provimpl_t dt_rawfbt;
>  extern dt_provimpl_t dt_rawtp;
>  extern dt_provimpl_t dt_sched;
>  extern dt_provimpl_t dt_sdt;
> diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> index 8292b309..16052cbc 100755
> --- a/test/utils/clean_probes.sh
> +++ b/test/utils/clean_probes.sh
> @@ -70,7 +70,7 @@ fi
>  	     { sub(/:/, "/"); }
>  
>  	     {
> -		 if (/_fbt_/)
> +		 if (/_(raw)?fbt_/)
>  		     kpv[kpc++] = $0;
>  		 else
>  		     upv[upc++] = $0;

