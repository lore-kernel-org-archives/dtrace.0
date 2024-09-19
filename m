Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117E1A286D
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726767539; cv=fail; b=DNwK9zxaFS0+l8/mXMI3dVrA/g7Vyt54HGdAx90XH/hQEZ5OZCKcix+xnV21ngZTHyIRaePrSniAXdvW6WdwFEPmnD0TM762teYfNHPnO9Htw1f3oPrm9B9aTHKKw8oGW/vPxu7RnKBHo5LoV41B7/9ZDcUuBWbcYmvQUv1VsFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726767539; c=relaxed/simple;
	bh=QYIK8KVytdVEUwfB7P5xHPXyVx8T+/Wv6dV0KQRWXAw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BXqCKdrQajqRgr8bHNRFc6m/SYuVwH90HPwN/JF3FPe9UhJpzvL+g7Ezxm/s3pKDTNtZVqNEQq77IVcja5kbTk6IRXyC6hKR5GWYW08nQ28JJy3Y6FjQqRsw+V9+wmWAhdsochfLMLGPUBp3Qu9uABN2E+wb6eexidjTkGTSs8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E5syBPzw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=o/dkWTOf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E5syBPzw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o/dkWTOf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JGtb2c025603
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=OLlhsHfmzHFz8WySy1so7yU13alXXxZBWXt3Sf+tw4Y=; b=
	E5syBPzwHfc0EIGZsP6M3sNa5heCt3i3GdIHT4MoxGXxRO0YrB06SmWaxNS45ICB
	Pfyz4TmYK6jVL8sVNbvDAGyystza/rDdX0Fil2PTJ9qNJnnXpixryMqHvDbfKGzR
	StTva1puXyfYwj9IwDv0v4FCLNtHnW6iZxx6ajdHX5TDYuHaW60MKvnRIz+zhPu2
	KcCPraSOAcn8JzGyGHUy4OcQ1+BbKeX9N0LeS59/QZ9jU1ZrXEOPrZsJypvwpfbR
	t4mZf9ArEkcPYwRpCSnBLCLW2akbZlKine4Ypft9fDFV4XXFSHefg+6lhCFn8oAB
	cZL5bvmT1oyOwCANAt/rGA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3nsmv65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:38:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JHU0nU010189
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:38:52 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nyba33g8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 17:38:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z18QFhIxKEicJo0IfyEWoQITM0m3g3didN2c5aAmXKC3mwgq0Qh6iJFqiIYSEoe7JocKRWVOJzzvZOygL3hfYT83fLjRGJzVinbc4ynrXZGPDEicMg8slyvbWuNmphLAzwoYBfUr/6uOaa+u5nU+CAOiQAEf8O2fqxQiwKHh7vlycOpaWTeyyJTZJje/YOYZ1Y06+V31CUOVqJdC7/+cbYwaVsrw2WW1DZk01wkZIszkz4YmIdNkdLxeiyIcbAXlOr0xAxIG+rkds/+sFoU4FQ+F7dTJcnl9RSou1VZ9xZEPmEg7cEynsbVFmjHLRnLy3Jawn0o7vPC3nT/xcldSKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLlhsHfmzHFz8WySy1so7yU13alXXxZBWXt3Sf+tw4Y=;
 b=ir2HQE3FBDwlXHtHmmXjenKLabbT04AEfOcm033PaOuRKD7SuU8mQ6OXr63qSl2WR1UR/IuA8bCbieD44Dy51nPvvAHo/1VD4wAXo4qhaHfYOS6gw+TxqJ6aTEjjffpFDNoYLzVtsWQ5bKOEFvCi+OlaTMno7fjw69jd8nJvpJM8Y1Hp9zJefXo9x27kpMnP0gS4BhImeO21Bqtz3PcppaykGSACDFsRWciWvUiep72SPdxPaISwalKIKrAdL5NWuYDj1kxAiN2OIqu6D74dE7H1HNBf5wWPi2I2IqNClsTsDgz+RNs0/KtiU32F153nFkzZo8aASYq01h4cNczFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLlhsHfmzHFz8WySy1so7yU13alXXxZBWXt3Sf+tw4Y=;
 b=o/dkWTOfLMiGlkG9XUM/vLloCobHZvnx/n8zsBjhqhfM0GGjdkRkYmZ0vYCbgG4X1X4hBgsv7KKQ8Cp36XBGHublzmdjxTDwY4bkEUE0kI6tC6MKx1XcnNjNomysv2rk71fV4Fq7ma/p0CXrY/auA9s1Lzv2xGIHNpdGtPjN9So=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6329.namprd10.prod.outlook.com (2603:10b6:806:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 17:38:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 17:38:49 +0000
Message-ID: <1c5ffd82-506c-aff3-587a-20002d3a45ed@oracle.com>
Date: Thu, 19 Sep 2024 13:38:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 10/22] Simplify dtrace_stmt_create() attr
 init
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-10-eugene.loh@oracle.com> <ZuW5FYlled3rjac3@oracle.com>
 <ZuW6sov45DyFF4Pe@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZuW6sov45DyFF4Pe@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: bafab00c-deea-41d9-af92-08dcd8d1eb75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkxlK0NsVWJRTjZNQnA1K05qUTUyWUtNWGNMeHpESnNmb0w2VUR2U1oydEhz?=
 =?utf-8?B?Y1d3NVJmTWVMMC9YUFE0WldtdTcydEMvN2hYUVdaSnVKM2ZOc0NDQWRsT1BN?=
 =?utf-8?B?akF6T2RDMHJiRXdqNmlwWEpPTW5GTHN1UnROdm8wUHg4WkdNcjJJMXR3cUpH?=
 =?utf-8?B?OTNacW5qS3dpalcwVUU0S1ozejF3a2lpbG0rcllZOGZHL081bjJEYndROTJC?=
 =?utf-8?B?bkNCUzlXR0I4Y3RSR2l5VlB2Rk1Ca1ZlZW1sSTdCMnZKVDE0ZFMvcmpad0Jx?=
 =?utf-8?B?ZUs1S3NNNWZXVElsQXRLanQvc21nTkVqSkcyL2xRYUcxTDQvQUI2WE9Kdk9l?=
 =?utf-8?B?b0RnNTBRdGc2YS9SQkwycEtVbnZIQksvRUtXRXZqUzZzcXF0eVF1bHdCT050?=
 =?utf-8?B?OXVtVFZaa2swcUdiZzJjK3orZUZ6K2pOWnhsemhTdTFvY0FCWlhiMlRsTUlo?=
 =?utf-8?B?VFErcW1aQ2dUeGl1bDlEU3hFb01tdGZralpYYmdhSmF1NUZtMlpOTDdTeXV5?=
 =?utf-8?B?cW5vTVNKNk5EaUhwWkhhY3FQS3hjTmJ4dlVLMXRySDA2UEFKOVhDeEZwd3My?=
 =?utf-8?B?bFFNTXJqV3h3RVF6SHFHUldrUFJVSHQrL1F6MVZLbU0rbXVMbExIaHpGSWts?=
 =?utf-8?B?ckxKZkxOcVdrNVJ2dzhZLzl1ZUdaUEhZWWM1VXJPR3hRY2o2RWlRc05lNmlT?=
 =?utf-8?B?T0hucEdBeThpNnZkRllPbjBJZXFXSW9nNFdCVHJQWE42VGhYRTRVVjVBNzBP?=
 =?utf-8?B?cmpzY1ZoRU1qUTFxYzg3Q0JrY0NkWC9sVDVuRjlsdlFFWkVoOTY1dXk5T1dC?=
 =?utf-8?B?WU05d25wbWF0L0Z3N3lJZ3BiS1RYc2hPZldwUDBpbDZtSEhLbnRjcTdYbzdK?=
 =?utf-8?B?QThyYS9qdEJLc1A0dForeEZpRmFKQnBHaitGdi9ERWkyNlo2SVdVVzRFdDZ4?=
 =?utf-8?B?clM0UytFeG9GVWR1b1FNS0ZrQWFlNXJJQmVDeEJWZzRwZnc5S1VEeVNFaHRO?=
 =?utf-8?B?TFdJaU5GVHpsek93RGVnQktSbmMvMWhXcmdxNzdpcmpBL3Q4N3pKOVNNaHBw?=
 =?utf-8?B?a3pFU0o2VmFGWk83WDVNWWlDVWhPZzAreFhvMFJ3TUR4K2VKdjJvOE14MVV3?=
 =?utf-8?B?Wnd0dWNEWk9iSkRLYjZyZEkvZEhRUDFhdGgreHljMGZXMkFaOVJKd1J4N2lN?=
 =?utf-8?B?UXZaS1JwcWtlN2JWOVVUS1F2Mnc0Wmo3Q1JBNWt6VS9IWFRMajZYdlZrUXR6?=
 =?utf-8?B?a1FVQXYya2RNKzNSS0F6VS9SbWxka2JJRi9SNXYyZ2oxNCs4VE50UUpZOUlV?=
 =?utf-8?B?L2Y2eC9DakNoYmwxKzA2U3pkNlgwbWE0SW5JeUJGcGdoMElrTzNDbTl0dUx4?=
 =?utf-8?B?V05TQkxsV1BWN210WGVoS25lbmFTOElpSmE4MCtTQ0lhZUI3cXo1bzR5cVQ4?=
 =?utf-8?B?bGl3R0E3UzI2U1NjTmMwaWRTSTNPZVc2bk12bjlvSDJ1SnJCWW1iVXpYUWVZ?=
 =?utf-8?B?K2owNWVVT1NrL1ZiNEs1WCtNSzVoVlY2ZTNQRzZWTmplUGxrMjJnT0RIZ3lx?=
 =?utf-8?B?cEg4OVJMTGVMZk5DU0tndSs1MndLaXpjSngzTzZQS1hlaW4xbG1TVC9xbFEw?=
 =?utf-8?B?VThGT2s1VFJwREtjMHUwa2lxTjBabjVoeW9lL1p5cWZ6dWt2VzFGYzdGalZj?=
 =?utf-8?B?c0pyZ2VBVVduZWUrUng2UTFXNVBZaFZHdHN6YjREUmlOamlpUjhPaHBMVTVI?=
 =?utf-8?B?NlBOSE5TWHY2dXAzZEg1aGptLzB3eWxHT2gvb0FJeExYU3BocGc3WlpNK3hB?=
 =?utf-8?Q?Q46ONoxx9wOkeiBDfCP8OVthm2VuN1jsi4JNY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3BWSFBtNkRpdlF6dUdJQ1laRzVGUVh0d01Gd1BuVG9RMGJTK0NXajVIWFBw?=
 =?utf-8?B?UUNvZHVNUUZzSDZlZjlNNGZxUmdIZjlzN1JmMFhxZ21Rb3p1anNHZzFBMk1L?=
 =?utf-8?B?Y2pkK0VQWHZOTkpOaHpaWHVNU1RyQUlrZVBpckU5T2M2aHQxYmEvQnVJWEl4?=
 =?utf-8?B?bTNRWDlnSy9FL3RhcldxL3I3VlVYcENoTXo5YkxWOTMzR2EyZ2pybjQzRUdV?=
 =?utf-8?B?Z0Eyd1VRVGVXREExVW02VDkrR0NTeDdrQXNEWG1Iak5tSFFuM0RZTG1ZZG5n?=
 =?utf-8?B?ZCtyVWYyaUlJZ2w2T09sVXlPaXh5TFViVTNXRUh2Ky9sMDVnaWhjM1hWcWI1?=
 =?utf-8?B?ZUZEM3NWQjA1aDVLQmdhY3FxTEFMTkZoZWxwb0JLMDZiMkZEcUNPRWRSTWJi?=
 =?utf-8?B?VWtyUHB5UlJ0Y3hjUU9BMFk2cFlIYVJvRjBDTWIzMHNDMlhQTkYwMWp2bUZY?=
 =?utf-8?B?MmdncUxYWnh0b2xJbVhWblRKYURXM0xSTUhFek9id3o3N2tNQ3ZNZ2psNkgv?=
 =?utf-8?B?SWduT2RsSmhEZUJtWVVHcFBrMEx4U2t3djRHaXRNSkUyL01RNWo4dVl0aHU0?=
 =?utf-8?B?WEErMjdIcnhqbVdNbVBsbGI0SDBoQ2pISUh4OWpETjRSL1VIWDZCU25jNTlQ?=
 =?utf-8?B?UllRZ1dpSHhpamFFYUtaalNyZVUvUVlMTXFNMkx6RjcrQXBsUHppT2ZKSjgz?=
 =?utf-8?B?T0tEd0p0QXZSbTV0UFQwQnhEemxnaFIrVElwaUZFbVo0aWJUanhuNlIvN3Y3?=
 =?utf-8?B?U0E1TWJNbWNDWmoxQ3krWldFdXladVRKeDAyREpDWVZGY2Z6bnk0TE8xUCt0?=
 =?utf-8?B?WFR6N08wVWFHRDRFaUNEZWFhN2J3alkrWHFzOEhoM2g0RUNqallkaWkvSUtz?=
 =?utf-8?B?aC9qaFpiZjhDcnh0WGNRRzdFT0ZQRFNHclh2R3JxaUV4eE5yS1pMOGVaczBR?=
 =?utf-8?B?UjJhdnNlVGVzVTNjWHVNT28zZnhFTXJlYStJcEdEbXFVajljUXArdmFWTk9w?=
 =?utf-8?B?MTJ0ekxvZy9Lb01lS3R4U1NpNzFuWExWZVJSZkFyU28xY3R6RURzNW05c0Nq?=
 =?utf-8?B?V1dCMGZLbENyV2psRUhLTjR2R0o4VGNQeW5ZZnhLSGFzcW5FR3FmWS8vRm9K?=
 =?utf-8?B?RnVEUkhEb05mTUFMeGs3K3BmdzVMdkxWVjQyWUtQbWt0RVVhSGd5YWdzejBz?=
 =?utf-8?B?aHRFY2FqMFhEVkxOd0NVYVJ1aFpmYXM0a3lFYVlDUXkrNi9zY0FMeVd2aktT?=
 =?utf-8?B?M25ySENOYkNqQXJwSUpGK1krSkhzZFAvN0h4Zkx4dk1OckNEa0ZCMnBmZkE1?=
 =?utf-8?B?dW9VMmxYOEQ3bEpxWGJ1YjhxZ0w1Y01hTmhzdWt1akM1c21PS0ptQTBRbDdQ?=
 =?utf-8?B?R1d3STVzcTBmbzB3MHZGMlkwdFN4WENVR1pKUCtEMmxMUStRVktWa2FXYlZl?=
 =?utf-8?B?aGFNbWZOUjBlU0FROXdQTTRVM0lFZS82Q3pvbGtCc3hXR09uYUhmNVF2dWVa?=
 =?utf-8?B?RDRlayttVGtPQ2oxcmRnSzhuM253amliU09ndmpPQU0yMmN5Y3pUM3JrWEhJ?=
 =?utf-8?B?VHRIaTdzQm5GYXhWMlU1dDJBMG9NeWpJUXYzdU8rMkRHckJlUjZpM3ZjOGt1?=
 =?utf-8?B?amtTc0RkUW8ySnJGVmh3TmNNV1g3OXFJL0ZNMjhLenhQNStRUlhTc3NOZlVh?=
 =?utf-8?B?NlJOZWpBc1lXVkMxRndZeXUrMmMxU0RDYXNrMzd4OGRoVHUyY2Nack9Zd2d3?=
 =?utf-8?B?ckx0U0x2QmJPU1ZaRGNFNmhjSUl3RkErc0hubXZEcDVuZHR3SzhSQjFPNFY1?=
 =?utf-8?B?THc3Wm1adnJsaENJOVoxcHIwaldMQWh2aHhqaHVBd1RQV2VCSTBKZUtEU1Rx?=
 =?utf-8?B?WUNOcHEyRGhIbWdreTZRWXRuS1YyK2tRejJrV01FOXJ4VWo5RS9wUE1PL2dl?=
 =?utf-8?B?RGZuMlBSNzZVNVZ5ZTBNaE84emtzejBIZnk4bnRWeFc0dTNyRXZmc0hMV0Qr?=
 =?utf-8?B?VlVNMVdKVDE1UE9zU2NvV3lIQlpmNFBaUHB1Y3V4ck9IbGJ3RENpVnIyZEZ2?=
 =?utf-8?B?NzhxY0dvZjcweGQrWHdPakRtZXF5TnAwM0ZQeHFpVVVlMmpzbklEMk5BVisw?=
 =?utf-8?Q?P20ClyV9UGQqafrB0u4t1NpHI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s7jRUo5WMUXOIGai/IEXxjVtU60seHs1FG7nIA6S42V+CT0+LXcCCe3dqceTqOuljQpWNeD127hwLnpB8pQ+/Sm+3zhiuiplTQyIyM83hPJ4waOx2jaZFKNWGkuk8fCCed0MPdQVaiZvD8TH1S4qWWhFd8Dxzm7eVMOMO/x2jsDe8NY1TOH3d4WgEN/YTF+LYmLWftwGuE0wIW/aRCp9u2F4u/SevVgJswHK0cSmtG9xgxc3gCdHwDEql+p/sAu7gAGahxTttjiKxMy7uMona/PXc9/QwtFr+NghPNSzVVJhRvIgcCWw/7JnAYjJ6UbZqgESa9rjVJX5R8na7jt3NAR6ctZRCjyg1bzw3qF5DPGtQKAG6Wk73Zn8o4FI94y/zSwSLe+ABqeJb7fZKlnNRxgN4vzDHZvi6J/ok7l2rVawvRjmLyljvm+vl0zYmeChW8ARqQ54THKk+QojdxBi1lb5iSyNX7t+ygX50jCpH4b2zpveapmjvUo0UXo+CaxxlDdR7jUhdkyOiYnhyri9z1cKN0PrtSH3iZ8rb5tLBqL4tUZHEdDj/H4WYqyCNmxwBxH/xFFhgwUhbhFIRJ+XA+uZZMQHeUqgNstk12vfTZ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bafab00c-deea-41d9-af92-08dcd8d1eb75
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 17:38:49.1814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9OyL18Ht7cwZnoqNdRl66YJxZsmz9dgR/hEcbl1kV4od8MBD1VwDYBIZerYbaldX2ZRJG0FtU3qjUB8PiVhSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6329
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_16,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190118
X-Proofpoint-GUID: NqJXwn5idjs0QPeryfI99OnTu_dkZHIL
X-Proofpoint-ORIG-GUID: NqJXwn5idjs0QPeryfI99OnTu_dkZHIL

On 9/14/24 12:32, Kris Van Hees wrote:

> I adjusted the patch, and changed the commit message to be:
>
>      Simplify dt_stmt_create() attr init
>      
>      Even though dt_stmt_create() initializes dtsd_descattr and dtsd_stmtattr,
>      there is no point to doing so.  It calls dtrace_stmt_create(), which also
>      sets these members.
>
> and added my R-b.

That doesn't seem to work.  In dtrace_stmt_create(), we have:
         sdp->dtsd_descattr = _dtrace_defattr;
         sdp->dtsd_stmtattr = _dtrace_defattr;

In dt_stmt_create(), we have:
         dtrace_stmtdesc_t *sdp = dtrace_stmt_create(dtp, edp);
         sdp->dtsd_descattr = descattr;
         sdp->dtsd_stmtattr = stmtattr;
which means that whatever dtrace_stmt_create() does, we overwrite it 
with the attributes passed in by dt_stmt_create()'s caller.  So, what 
dtrace_stmt_create() does is irrelevant and what dt_stmt_create()'s 
caller asks for matters.  So removing the assignments from 
dtrace_stmt_create() makes sense (except for the API issue) and removing 
the assignments from dt_stmt_create() is wrong.

Specifically, removing the attr assignments in dt_stmt_create() causes 
test/unittest/dtrace-util/tst.VerboseStabilityReport.d to fail.

Either we should go with the original version of the patch or, more 
likely, to preserve the API, the patch should be withdrawn.

> On Sat, Sep 14, 2024 at 12:25:57PM -0400, Kris Van Hees via DTrace-devel wrote:
>> On Thu, Aug 29, 2024 at 01:22:07AM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> Even though dtrace_stmt_create() initializes dtsd_descattr and
>>> dtsd_stmtattr, there is no point to doing so.  Its only caller
>>> is dt_stmt_create(), which itself sets these members.
>> No, it is the other way around...  It should be done in dtrace_stmt_create()
>> and thus it is no longer needed in dt_stmt_create().  As dtrace_stmt_create()
>> is a libdtrace API function, it can be called from other code, and since it
>> is the function that actual creates the statement and initializes some of its
>> members, it is the logical place to retain setting the attr fields.
>>
>> So, instead remove the assignments from dt_stmt_create().
>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> ---
>>>   libdtrace/dt_program.c | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
>>> index a4b052fc..bdb434e0 100644
>>> --- a/libdtrace/dt_program.c
>>> +++ b/libdtrace/dt_program.c
>>> @@ -240,8 +240,6 @@ dtrace_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp)
>>>   
>>>   	dt_ecbdesc_hold(edp);
>>>   	sdp->dtsd_ecbdesc = edp;
>>> -	sdp->dtsd_descattr = _dtrace_defattr;
>>> -	sdp->dtsd_stmtattr = _dtrace_defattr;
>>>   
>>>   	return sdp;
>>>   }
>>> -- 
>>> 2.43.5
>>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
