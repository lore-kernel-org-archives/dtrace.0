Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EDA2E9EA0
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 18:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863198; cv=fail; b=sVCh/LS4xElJw2idUY79oU4L2WXQT0nIrVfLmqziZsAjIF/Ex8Pp2T5rN/IVckKLgd8Co7k9vjCv6bVO9xCISyMkzATjCCY5l0gajwEiDLmHei2+nWNodKamU7fORwLeHLqcXbHHHP6616Lpk2jGwwK6HveZ1j2hK2t2sf2Fh+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863198; c=relaxed/simple;
	bh=lARd3Q2HSrS3Mnye9HtyeTotd32x7u6eTJZNNemgeSA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Plfe+5216uxYsnUBUDyYs2HgNF9fWGFNZEQw4dqK4oJgvCGmvpqkjghbeQLFMlQyJXeJw8Wkx0YyW08u8I9BF8BlC7dzNNlrEXaZ4V8fPJ7UC+jGzeKsl40kOB/gDBij8mCVBc1IOyU/TdktvOiRRHzDpcybZOuQ7GXKF3a0NnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B+ofhSGy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jlmd4Bhb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B+ofhSGy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jlmd4Bhb"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Io6Ha014649
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 18:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=WQCzRSA+vvMUKYbPJo/6gK5AYvLLbDLnm84VnYuoylM=; b=
	B+ofhSGyRjH9qgx4cxAXT8i1EOkBt73Hi/c/ONgBFizfUHGl8LPIkn+9gsOBS4pJ
	zuPfEKC4o9/dsDnM/ccZcMZTS1sTqsMNPkrUKwVCfkqhe/qrQmpCFMePTJRSL4MN
	uLFeofUwPef8VeVmr8wL1Tz59Rh4NH1NtQv1I8UREp6JrYrcjDrvFslTdLWLGLcV
	oZsgZELUkQLf+Y9B9D8DJnPtQpJyhg2l0Nps+zBmxfI3YjxQOulDJvN0r3lBd1EU
	5ucKAqpwYEXwP2CQK3F0+8iPxkhfiwl9SOtxpNOsfVj4+pckodctQXKKxM2kRiI4
	IQ7iiF0yq19tzgQ4tap/mw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n8fsr0cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 18:53:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597H7SwL004828
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 18:53:07 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011066.outbound.protection.outlook.com [52.101.52.66])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18uj1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 18:53:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6iAEbYLQ8goqtmKkaRcj9CfKGcO1hI7URXO5FL1E35jJJlyP9joGh1UXduEbP31XImUEQavzcLBK8/EkRsa/ujRiP2Z55DaShH+IK9OGsr8KPvXbfHeYhYIZuPMIcOFkG3UXncWpXdsHS9Df21bAsnfEW3Z69s48GahQCzNRSCRYW87GbkR1e552hCw7W8ss73FCHMTeA3FMnnwpbdgQBNAPNP1Z60k5hrf5881VY54jMd4RMu1KzM7ewB5v7V+o7fLjG4YdTcDypL+YDjmm1G3zxFnNkAXPR10zNN38Dm30pNYRijb/W+RH9FIsYnDFvW7yjczSjz62TEc8ldG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQCzRSA+vvMUKYbPJo/6gK5AYvLLbDLnm84VnYuoylM=;
 b=stHv5MHkVT1HVgJ0AuS1RGGnC3eQbsbZ4vwsyfXmx5Ywt9tyNFezTUUU61BsByL17gTIH68k2hgOuAlGAwH6hVvchPrBl0raOARNI0Uhd0U2spa6WrgUMLaiX7pFEo/ITbnz4FaE4t9uJOIBwPm8EASyJx9yTH+Ijnbu/zilgijl3L2w7j6QI5hN9z6Ghr67OcBpXrRREQSqLLgKdJqF3gRFEFKE3OfWSLdcuG0uD1V3287K8rsczJvyfYWWxUQ+LpB5s1awKCg7I21viwV9TUflAjHM9ZVjQW+B5rD6fJpkFB6ckuJiNaD77Zvs3xp+M4hPGSsasGt1k9YLt62fZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQCzRSA+vvMUKYbPJo/6gK5AYvLLbDLnm84VnYuoylM=;
 b=Jlmd4BhbeDtY3BSzkV+H6eMZ1ecTgbw4ON+w4/o5qGZ3NhlHNt9HgE2o2naCdhVbKyYHBeKqhptGpVdimeUrEgYhJwfRVoYKeVOL9D+XgjU4Nyemx9DqDH8207NVY8+rvTZefD8sgQADF52cAbeOxAYIB1pSy1dSroiqgHmeI/8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7662.namprd10.prod.outlook.com (2603:10b6:806:386::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 18:52:56 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 18:52:56 +0000
Message-ID: <4a4349c5-cb07-a2bb-dbca-f2252336301f@oracle.com>
Date: Tue, 7 Oct 2025 14:52:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v4] cg, printf: allow storing [u]stack()
 into vars and printf using %k
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567269F7A861620C0E28D07DC2E0A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567269F7A861620C0E28D07DC2E0A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:408:f4::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2cfb0e-f19f-498a-52f6-08de05d2ba00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REZ3L1FYVEpTWm52UW52TVlJVS9VcnNqeUFrUmRPREFRWnIrdTBsRzhxUTRi?=
 =?utf-8?B?S2xKamNFMDdTTTRlS01mcWZGZTRuaVRZY2kxRGRzNEdvSkpvdFU1L0JGdDBF?=
 =?utf-8?B?RVdrRmEwdFVsbVcxSWk4S2x1YUtRd3BMWHJJdGVPZ3p3TWJJOWt2WExoZVVL?=
 =?utf-8?B?RGpuM0Y3TWJQUHZsNEFkTk14VTA5eW0yKzRIMFJqZDNuNERCTlNwNTZXbEto?=
 =?utf-8?B?MTBLNS9tZ0dVVGRKMUNuSnBXTHlXNHNuZEt0dGZQNVRjaXNVSWJQT2t3ZUdW?=
 =?utf-8?B?VjBPZC83ZXRLYksrS0tKOW9xTnRTRDNlMHVDQnZlMW1tNGJadldmcUN4N1Q0?=
 =?utf-8?B?d3kraEZCUnVkeWR4TUVXQk5pUmNXcGhvY3J6VXFkd3ZVbjRZMnVGN1NMS0hN?=
 =?utf-8?B?bGU5b29zMkgwcEZCaVJ5Y201eXpGREdEU0xhOGdaSUNDN2xVYjBFdDNCYmdR?=
 =?utf-8?B?L0dMcGdMT2tkVVhtME5mUzJPS0JibGVhSHMvZ1NXemdyRElSb2pqM3VGZklu?=
 =?utf-8?B?QVBERTQ4amJxOVlpZGZrM3BOQmlUdTZoMFZnUkIvUDZPVitROXlxL3ByeEVn?=
 =?utf-8?B?VXBqRm5aUDF3MGo0QVdtcS8vdDVycnYvOGMrS2xlUnkxRVFSVHBhR2c5VWFU?=
 =?utf-8?B?aUZtV0ZlY1ZSQk5jeUt1S1RPQVNnSVM3RDNrU2NuUG5QTks4UUNVNjcybS8r?=
 =?utf-8?B?U0pBQzkzT2xnelFCZU1ZcEhLa3BXSDVGMk4zNzB1WkZ2VWtaaHp0TVZSdzBM?=
 =?utf-8?B?bUlrT2czcUNWbUpmNnFVamlhZVpBeWhrK2FlbGdtbGlJQTBKcU1UWFZ4T1ZV?=
 =?utf-8?B?VWRDbEhtc2R6NU9YMDdrbjNkRnU3YzFPKy9scndOS09tQzlMNVluWjhDbkJY?=
 =?utf-8?B?QlF2VUgvZXpZZTVzaFZLZlhDZjlCQ0QzQ2VMRlFiczRuWVNwSkd5UUN4cS9l?=
 =?utf-8?B?dmQvdnY3UWpOQmU1SjdYb1dtZE1jMVV6a1ZYOXFzVTNMbkRzNkdkYm9NUVdN?=
 =?utf-8?B?VGM2elRJWE5lRGxBQko5TGE0allhbk11WnNNRTBJRFNwOFZhVWJUZk81cEF2?=
 =?utf-8?B?TjZlZk5JaXVKeDhPcENyOEdRYnExNnVTWWVMK3hKSHFKN29hcXBoaEJzd0g5?=
 =?utf-8?B?N0k5NWJneis4WktXVEF3L29NVmUyVXpYTmp3MmZ4OFk1U2NyVkNxRjhtUWJk?=
 =?utf-8?B?L29JOVpDa0ZvZ3YxOEV3NXQ2ckl0REoxeXVTZXlUZU1nK21ZSHpRdkF0MWFE?=
 =?utf-8?B?RnFvZHhLdnZsdURaNmlrZkdaTFlTNDViYUZIUkdNc2pNK05BbXZncGRJMFlv?=
 =?utf-8?B?RWJCWEE5dC9vM200MFZxZG5NZUV2dTdGdUt0MldSdStPcmVBTEdZVTlpMUNi?=
 =?utf-8?B?RG91L0YyZVNmODgyYXk4VU1Sdmk2eFVRWEVrTWovWVlJRkZrU3pKUkU0dTB5?=
 =?utf-8?B?RGsvbGpXbExtSi9OZDZIS2dIZE5xbEx3amZXaG5TZXNobGpCS0p2Rk9nNVFD?=
 =?utf-8?B?WkRTNERtSEt3ZGcycWZiZGwxcUI2YjIvTXdTeU9OaGhQTmdaY2REUll5b3R1?=
 =?utf-8?B?Q05sckNXdHRRZ2ZQZ3NwU0E2bisxblpGTXAwRXR3TTF1ZDVoSEV3S0JKdENG?=
 =?utf-8?B?QXNMOFlkdDBMRmFXQVpzNGpMQ3A1NWlkd2EvckRRaHFaR0lnSmlOdlBBQ2Np?=
 =?utf-8?B?TlhyV3U2dVY4dUM5TVFwdE9aajJjQjh5eEhCU1hjbXhLenAzOXZiNTJtOXFn?=
 =?utf-8?B?ZGtoZ21nQTNJTjA1dnBpajV1WVpnYjVab2oyWmFjUjk1WXFlU1N6OGxtczJ5?=
 =?utf-8?B?MHVPTkJUUjlOVTBXc1Z5RXZDWWJIMFNQMFdqeWl4NUV2c0dmK3BzUjM0ODJK?=
 =?utf-8?B?K01DWnNVU1YxY0pIazBydHhxTEFaejd5cW5ESnh2TTYreGNScnBrMzBhNUF4?=
 =?utf-8?Q?05f7FfLS8SDRtkCiTcSPAI0szkCVQjNY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0ZtbDd5a3Vhd0c0ZGlLM0c4S1NkSmE2WktLN0hpa09rajE2dUJhZlMzbWtW?=
 =?utf-8?B?ODBVYnFHQmRLVkZPWTJBeUVKNFpVSGU0T0ticDFmdmMzbmZhaW1nMXBUbkRp?=
 =?utf-8?B?MEhYMTJGck14Y3lPVFY5WWdYTDEyM0xCaEdJc1NmdmZyVUlIdi9NTzJEbUw3?=
 =?utf-8?B?Z0pLdkFlcGxyNGsxaGxFZUFkNVc4MUlmUzZsaFRwbjhNSnB5Q1Mrank3Skgy?=
 =?utf-8?B?QklMbEtIM2hHZE44K1JPVkJVNWdjdzU4WFlRUlRDQTliZi9GMkFZMkF0OUlF?=
 =?utf-8?B?Tm9DTVJzSlNUVVRvZllmaTNHNG5pbXIxakFjSm9sZmc0aDZsOUdzQmlsejUz?=
 =?utf-8?B?aGJQREZPMlBRMjNaUVh2dXFoUURSLzNuNytEbkRmb05ZNnkvNUdqUVN5am53?=
 =?utf-8?B?UE05VTZsdUU0RFRXVHNLTm1WaWFhRzdWRzM2KzZucHY5Rzk5b08wNkoxcjd6?=
 =?utf-8?B?b2RNaUJBZ2FoVDJMOW51SkwwTVhEc1prOGY4MVB2NlBGcUNVaVo1QnZXSWcw?=
 =?utf-8?B?cFFaK1JjZW91cVoyTURCZmhlU1pZMjUzSFVhemlESzVXWG5oR2d2SlBISUlG?=
 =?utf-8?B?UnIxK1YrM3RxNVFRbUdPdHlHblFlSVFZZEliV21SSEhZSEZiaW50VStWWk80?=
 =?utf-8?B?NlErZi80bHpJTGViSENoaDlyVWp1VjZkZ0xtVmRmeVg3cDRNcnQ1RmxvREZ0?=
 =?utf-8?B?ZHMxeSt4bDd6akJHOW5ZT0xSalo1aTdJbzRjTGNzcTl4UzFIMHN0b3RnZ1lX?=
 =?utf-8?B?S2JXYmdReStFbWFzTFA5WmdhUEg2NHRJUGtValVWeXZ5QWdvRDVtTGF0UzBa?=
 =?utf-8?B?U2c5bDd0eUFQWmIzaGVUY1VTdmFNNXlHMzF6dGtNS2NXdnltWmtGaXk2Ujds?=
 =?utf-8?B?NWVpZkxDM2dpZnJ4Vm10VndlUWgzRDZVM2ovNVF6bUs2UWxVUmRvcjZiUnc1?=
 =?utf-8?B?eHZlNmF2T0JTb1YvVXJ2OGtPZ1RpVnIvbWViVm1rcU9xZ1FXcG9mU1lzRTVh?=
 =?utf-8?B?b21oZ0ltQXBTVHA2NnplUy9GRm5FeWJlejd1ak5uTXdITmdPUzc3NkhjSC9j?=
 =?utf-8?B?eDllQzUwTkdFd25Qcmo1MDJzVVJTc0FyOHJDMkdkVldPZUJma213UGR5UWc4?=
 =?utf-8?B?Vkd6SHBYR1FQamxOK2paNjM1RlRtRGRYaDByWS8wd2FlSUw2WVl0MmVCSkdh?=
 =?utf-8?B?TFVJRk8vdTc5MVdXVHFYRVZaeEovQUFnSGNMeUhZd29CR2YyTFdxQmdaQnZX?=
 =?utf-8?B?Q3V3L0dKbi9Qa1VDU0tJSWdsa2JMclhJRkd0RHFBVWpFY0c0RXU3bVh6eXVB?=
 =?utf-8?B?djdOMzZ6VmtBMHlwa2NNSUd0ZGM2YkpaQzE2L0xtNE42OFRyZi9PbXFibkZN?=
 =?utf-8?B?eHVGSjR3NlB3NzJoeXdRakwwWFdCMWdQV2RlMkhYRUdGbU1jdFJ4TVpxZ3Jz?=
 =?utf-8?B?YkZ6TGdWcDRQQmdzWkFobjFxWTV1dGNXMmFvc3ArWGVZd09jalBJa1pTZ1lm?=
 =?utf-8?B?ZWQ4Y1hUMW83ZzBRQktERXZBZzNaQTFlVGk4eDAxU1d4enhCcmh6Mm1zVEk5?=
 =?utf-8?B?Sm9GUXh3WkY4NGxGZXhlK3Y5TnM1d2RJZk1rcDdHWDNHWTFueUxRdy9IMW5B?=
 =?utf-8?B?aWl1QndQZ2VQYlc2UVMvUDVUTmtYT0dtbVBDRUNUQWFKc2x0TVlDbFBaQXpm?=
 =?utf-8?B?dmJuL0VJT3dDNCtZc0tkZWltbWFpemswaW5KaW5FYnlvM2tEVy9NQ2lNSERK?=
 =?utf-8?B?am9vcVpWYUV3RjBpeU9pczJDa0ppRE9DdDcxejF0N1dOWmVIbm9lMGtZY3pt?=
 =?utf-8?B?bXJaRE43d0hINkx4U0hmR1RueFhDUmRYRVIyaWVoOEhQc0N5T3BpN1AwRDNN?=
 =?utf-8?B?bG5yQjNiZlRwODhyVDFYMFcxa0g1SzF4aUNPdWxtMWlvTjZEekhMR1R4bmFN?=
 =?utf-8?B?eG81ODlLTzZLQmhjYUhIdzAwUU53Tk1FTzJjb2VKUHZTM2NNUnBIaHg3RU5O?=
 =?utf-8?B?S3JQeHZ5aFcyVUN5MDFiV2RHOEp4d3d2aUp6QVZObzdhUzl4TjMzQzBJWC9j?=
 =?utf-8?B?NE94alhXWGVHb0FZSERNSExIZTRFa1VpTDdzZ0RPcndNb1pJc1NwaXd5M3NE?=
 =?utf-8?Q?38G2d47os70QgksYniU4nChOv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zgUxyt8Qm93SmOgc2XPe1pUKC8ICZWYVY87zd2UF4bziRN9RxLYkdF3K8Pbrpf+5+j822t070AtCwWfiR5snUSWzlQmdcTvcUvuEBE1QV3vOIgDmPWBZFFl736PUfduuuJpz0TtISdupe3Lie66qTJT25jBHopWjz1/QcaDZb0iN+9LNrl5722yUrMK6mm8r9xirsVbkIgnvSQPp0f7sTsm4dBlDYN5EVABpDWzGCDhbbNKgeaYyHT/qYr+fEKsu1E6O1zGaESxQS6v3XJmdb5Wy5I4hrWYVYWUpN4qlmJZAZKg7cdP0uz6R1XPsH6CjGwSqocNUkBR8oIAZvOf4qS0HauimN5TeZBDBa5AYjoSsEc0wmns2yBHgweQjmVU9OM9Jz1bnD9vwKjTrBvSZzjqLD86ArenF0jFBE7yIFyB2rbuh0s1xj+3FUghQqlX31xpVWxMix+R6T+JHelPuROX0gx6h1ehcssqyhjk2y0ifhk1sSZvVNujyux1vpVuPUVLylI5Pic9k6IXtwYebMdg0pklDITYysP3CrdudvGufkmCrVS/efkUWDtJjsMO8uYHRXLRYGcaukezYWYidNFsp4vU/kbT1H12WLCwvRzg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2cfb0e-f19f-498a-52f6-08de05d2ba00
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 18:52:55.8524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCOjXjknjqId93stoVvezeAM0CnRpvQz+QMVkQfATqE2Xlmjko+rN64T4NW+vl52LSG685+UXUjwDcxzZIzFsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070148
X-Authority-Analysis: v=2.4 cv=Du9bOW/+ c=1 sm=1 tr=0 ts=68e56197 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=YBDKb4_GhrTbCwHFY_wA:9
 a=5mBYMFHptHa8XouY:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: dNhdIzwR6lG3XxHOaNjzxv0R39CyXDv9
X-Proofpoint-ORIG-GUID: dNhdIzwR6lG3XxHOaNjzxv0R39CyXDv9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE0OCBTYWx0ZWRfXyc8XAsfyghLb
 JsIdwZoFZesS8Hh5Vxp68IMsOG1PKcyNtTceC6HFWhz8UJ7Xa2SUTFe5/xbwOhryLXuYXg1BBJJ
 I46e5jezGWuZ9+mxsUkPjBkgGmAMXmUwWXVR8Cs00K+kiLH+KgiPMCyfCGoVkzTMDlesczBFCmN
 +dgDA5ScNGGmRHrjgUuRiP3UPAGot2H2YrlZhWn6h5GE/Q0chGu0BXIfsSadpTXux9lur/uMLLT
 nPtY6kaTi4b17vCdLQJ5jnL8BE4zoyub6WkEUy33CXzzDvV0Zv0O557/qxIxgazApxjX3CUxCOm
 GjeK6xOCugASLPDBdWvKohGRGiMyZ42pKXIG2muXCOciPuYr85zeyLUy4TwLRKZdj9E5I2NFNlW
 PyZCpNfjTJSh9Bzi8j3PvlxMuo1Vbw==

Nice feature.  Tour de force implementation.

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 10/7/25 01:35, Kris Van Hees via DTrace-devel wrote:
> To support storing [u]stack() values in variables and as arguments for
> printf(), a type definition is introduced:
>
> 	typedef struct dt_stack {
> 		uint32_t	frames;
> 		uint32_t	strsz;	  // optional string blob size
> 		uint32_t	is_user	  // > 0 if userspace stack trace
> 		uint32_t	pid;	  // process id (or 0 for kernel)
> 		uint64_t	addrs[n]; // stack trace addresses
> 	} dt_stack_t;
>
> where 'n' is the maximum number of frames that can be retrieved (set
> with the 'maxframes' option).
>
> Since dt_stack_t needs to be known early enough to define stack(),
> jstack(), and ustack(), it is defined in two stages.  First dt_stack_t
> is defined as a typedef for struct dt_stack, and once options have been
> processed, struct dt_stack is finalized.
>
> Once the value of a stack has been assigned to a variable, it can be
> accessed as a regular struct (*not* a pointer to a struct).
> Modification is also possible, and safety checks are performed to ensure
> that such modifications do not cause crashes in the consumer.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c                             | 84 +++++++++++--------
>   libdtrace/dt_dctx.h                           |  3 +-
>   libdtrace/dt_impl.h                           | 13 ---
>   libdtrace/dt_open.c                           | 62 +++++++++++---
>   libdtrace/dt_parser.c                         |  2 +-
>   libdtrace/dt_printf.c                         | 43 +++++++---
>   .../unittest/funcs/stack/err.corrupted-data.d | 25 ++++++
>   .../unittest/funcs/stack/err.corrupted-data.r |  4 +
>   .../unittest/funcs/stack/err.store-to-stack.d | 23 +++++
>   .../unittest/funcs/stack/err.store-to-stack.r |  2 +
>   test/unittest/funcs/stack/tst.asgn_dvar.d     | 25 ++++++
>   test/unittest/funcs/stack/tst.asgn_dvar.r     |  1 +
>   test/unittest/funcs/stack/tst.asgn_dvar.r.p   | 35 ++++++++
>   test/unittest/funcs/stack/tst.asgn_gvar.d     | 25 ++++++
>   test/unittest/funcs/stack/tst.asgn_gvar.r     |  1 +
>   test/unittest/funcs/stack/tst.asgn_gvar.r.p   |  1 +
>   test/unittest/funcs/stack/tst.asgn_lvar.d     | 25 ++++++
>   test/unittest/funcs/stack/tst.asgn_lvar.r     |  1 +
>   test/unittest/funcs/stack/tst.asgn_lvar.r.p   |  1 +
>   test/unittest/funcs/stack/tst.asgn_tvar.d     | 25 ++++++
>   test/unittest/funcs/stack/tst.asgn_tvar.r     |  1 +
>   test/unittest/funcs/stack/tst.asgn_tvar.r.p   |  1 +
>   test/unittest/funcs/stack/tst.ref_addrs.d     | 24 ++++++
>   test/unittest/funcs/stack/tst.ref_addrs.r     |  5 ++
>   test/unittest/funcs/stack/tst.ref_depth.d     | 35 ++++++++
>   test/unittest/funcs/stack/tst.ref_depth.r     |  6 ++
>   test/unittest/funcs/stack/tst.ref_is_user.d   | 35 ++++++++
>   test/unittest/funcs/stack/tst.ref_is_user.r   |  6 ++
>   test/unittest/funcs/stack/tst.ref_pid.d       | 35 ++++++++
>   test/unittest/funcs/stack/tst.ref_pid.r       |  6 ++
>   test/unittest/funcs/stack/tst.ref_strsz.d     | 35 ++++++++
>   test/unittest/funcs/stack/tst.ref_strsz.r     |  6 ++
>   test/unittest/funcs/stack/tst.store.d         | 28 +++++++
>   test/unittest/funcs/stack/tst.store.r         |  1 +
>   test/unittest/funcs/stack/tst.store.r.p       | 63 ++++++++++++++
>   .../funcs/ustack/err.corrupted-data.d         | 25 ++++++
>   .../funcs/ustack/err.corrupted-data.r         |  4 +
>   .../funcs/ustack/err.store-to-stack.d         | 23 +++++
>   .../funcs/ustack/err.store-to-stack.r         |  2 +
>   test/unittest/funcs/ustack/tst.asgn_dvar.d    | 25 ++++++
>   test/unittest/funcs/ustack/tst.asgn_dvar.r    |  1 +
>   test/unittest/funcs/ustack/tst.asgn_dvar.r.p  | 60 +++++++++++++
>   test/unittest/funcs/ustack/tst.asgn_gvar.d    | 25 ++++++
>   test/unittest/funcs/ustack/tst.asgn_gvar.r    |  1 +
>   test/unittest/funcs/ustack/tst.asgn_gvar.r.p  |  1 +
>   test/unittest/funcs/ustack/tst.asgn_lvar.d    | 25 ++++++
>   test/unittest/funcs/ustack/tst.asgn_lvar.r    |  1 +
>   test/unittest/funcs/ustack/tst.asgn_lvar.r.p  |  1 +
>   test/unittest/funcs/ustack/tst.asgn_tvar.d    | 25 ++++++
>   test/unittest/funcs/ustack/tst.asgn_tvar.r    |  1 +
>   test/unittest/funcs/ustack/tst.asgn_tvar.r.p  |  1 +
>   test/unittest/funcs/ustack/tst.ref_addrs.d    | 24 ++++++
>   test/unittest/funcs/ustack/tst.ref_addrs.r    |  5 ++
>   test/unittest/funcs/ustack/tst.ref_depth.d    | 35 ++++++++
>   test/unittest/funcs/ustack/tst.ref_depth.r    |  6 ++
>   test/unittest/funcs/ustack/tst.ref_is_user.d  | 35 ++++++++
>   test/unittest/funcs/ustack/tst.ref_is_user.r  |  6 ++
>   test/unittest/funcs/ustack/tst.ref_pid.d      | 37 ++++++++
>   test/unittest/funcs/ustack/tst.ref_strsz.d    | 35 ++++++++
>   test/unittest/funcs/ustack/tst.ref_strsz.r    |  6 ++
>   test/unittest/funcs/ustack/tst.store.d        | 28 +++++++
>   test/unittest/funcs/ustack/tst.store.r        |  1 +
>   test/unittest/funcs/ustack/tst.store.r.p      | 63 ++++++++++++++
>   .../printa/err.D_PRINTF_ARG_TYPE.stack.r      |  2 +-
>   .../printa/err.D_PRINTF_ARG_TYPE.ustack.r     |  2 +-
>   test/unittest/printf/tst.stack.d              | 33 ++++++++
>   test/unittest/printf/tst.stack.r              |  1 +
>   test/unittest/printf/tst.stack.r.p            | 75 +++++++++++++++++
>   test/unittest/printf/tst.ustack25_pid.d       | 21 +++++
>   test/unittest/printf/tst.ustack25_pid.r       | 28 +++++++
>   test/unittest/printf/tst.ustack25_pid.r.p     | 37 ++++++++
>   71 files changed, 1313 insertions(+), 76 deletions(-)
>   create mode 100644 test/unittest/funcs/stack/err.corrupted-data.d
>   create mode 100644 test/unittest/funcs/stack/err.corrupted-data.r
>   create mode 100644 test/unittest/funcs/stack/err.store-to-stack.d
>   create mode 100644 test/unittest/funcs/stack/err.store-to-stack.r
>   create mode 100644 test/unittest/funcs/stack/tst.asgn_dvar.d
>   create mode 100644 test/unittest/funcs/stack/tst.asgn_dvar.r
>   create mode 100755 test/unittest/funcs/stack/tst.asgn_dvar.r.p
>   create mode 100644 test/unittest/funcs/stack/tst.asgn_gvar.d
>   create mode 120000 test/unittest/funcs/stack/tst.asgn_gvar.r
>   create mode 120000 test/unittest/funcs/stack/tst.asgn_gvar.r.p
>   create mode 100644 test/unittest/funcs/stack/tst.asgn_lvar.d
>   create mode 120000 test/unittest/funcs/stack/tst.asgn_lvar.r
>   create mode 120000 test/unittest/funcs/stack/tst.asgn_lvar.r.p
>   create mode 100644 test/unittest/funcs/stack/tst.asgn_tvar.d
>   create mode 120000 test/unittest/funcs/stack/tst.asgn_tvar.r
>   create mode 120000 test/unittest/funcs/stack/tst.asgn_tvar.r.p
>   create mode 100644 test/unittest/funcs/stack/tst.ref_addrs.d
>   create mode 100644 test/unittest/funcs/stack/tst.ref_addrs.r
>   create mode 100644 test/unittest/funcs/stack/tst.ref_depth.d
>   create mode 100644 test/unittest/funcs/stack/tst.ref_depth.r
>   create mode 100644 test/unittest/funcs/stack/tst.ref_is_user.d
>   create mode 100644 test/unittest/funcs/stack/tst.ref_is_user.r
>   create mode 100644 test/unittest/funcs/stack/tst.ref_pid.d
>   create mode 100644 test/unittest/funcs/stack/tst.ref_pid.r
>   create mode 100644 test/unittest/funcs/stack/tst.ref_strsz.d
>   create mode 100644 test/unittest/funcs/stack/tst.ref_strsz.r
>   create mode 100644 test/unittest/funcs/stack/tst.store.d
>   create mode 100644 test/unittest/funcs/stack/tst.store.r
>   create mode 100755 test/unittest/funcs/stack/tst.store.r.p
>   create mode 100644 test/unittest/funcs/ustack/err.corrupted-data.d
>   create mode 100644 test/unittest/funcs/ustack/err.corrupted-data.r
>   create mode 100644 test/unittest/funcs/ustack/err.store-to-stack.d
>   create mode 100644 test/unittest/funcs/ustack/err.store-to-stack.r
>   create mode 100644 test/unittest/funcs/ustack/tst.asgn_dvar.d
>   create mode 100644 test/unittest/funcs/ustack/tst.asgn_dvar.r
>   create mode 100755 test/unittest/funcs/ustack/tst.asgn_dvar.r.p
>   create mode 100644 test/unittest/funcs/ustack/tst.asgn_gvar.d
>   create mode 120000 test/unittest/funcs/ustack/tst.asgn_gvar.r
>   create mode 120000 test/unittest/funcs/ustack/tst.asgn_gvar.r.p
>   create mode 100644 test/unittest/funcs/ustack/tst.asgn_lvar.d
>   create mode 120000 test/unittest/funcs/ustack/tst.asgn_lvar.r
>   create mode 120000 test/unittest/funcs/ustack/tst.asgn_lvar.r.p
>   create mode 100644 test/unittest/funcs/ustack/tst.asgn_tvar.d
>   create mode 120000 test/unittest/funcs/ustack/tst.asgn_tvar.r
>   create mode 120000 test/unittest/funcs/ustack/tst.asgn_tvar.r.p
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_addrs.d
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_addrs.r
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_depth.d
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_depth.r
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_is_user.d
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_is_user.r
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_pid.d
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_strsz.d
>   create mode 100644 test/unittest/funcs/ustack/tst.ref_strsz.r
>   create mode 100644 test/unittest/funcs/ustack/tst.store.d
>   create mode 100644 test/unittest/funcs/ustack/tst.store.r
>   create mode 100755 test/unittest/funcs/ustack/tst.store.r.p
>   create mode 100644 test/unittest/printf/tst.stack.d
>   create mode 100644 test/unittest/printf/tst.stack.r
>   create mode 100755 test/unittest/printf/tst.stack.r.p
>   create mode 100644 test/unittest/printf/tst.ustack25_pid.d
>   create mode 100644 test/unittest/printf/tst.ustack25_pid.r
>   create mode 100755 test/unittest/printf/tst.ustack25_pid.r.p
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 3ce13c74..ec4e3123 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2647,11 +2647,16 @@ dt_cg_act_speculate(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>   	dt_regset_free(drp, dnp->dn_reg);
>   }
>   
> -static uint64_t
> -dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
> +/*
> + * Extract [u]stack() argument data, storing number of frames and optional
> + * string data in '*nframesp' and '*strszp', and returning the storage size for
> + * the call stack data (not including the size of the optional string data).
> + */
> +static uint_t
> +dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind,
> +		uint_t *nframesp, uint_t *strszp)
>   {
> -	int		nframes;
> -	int		strsize = 0;
> +	uint_t		nframes;
>   	dt_node_t	*arg0 = dnp->dn_args;
>   	dt_node_t	*arg1 = arg0 != NULL ? arg0->dn_list : NULL;
>   	int		indopt, def, inderr;
> @@ -2689,19 +2694,24 @@ dt_cg_stack_arg(dtrace_hdl_t *dtp, dt_node_t *dnp, dtrace_actkind_t kind)
>   	if (nframes > dtp->dt_options[DTRACEOPT_MAXFRAMES])
>   		nframes = dtp->dt_options[DTRACEOPT_MAXFRAMES];
>   
> -	/* For user stacks, process one more argument. */
> -	if (kind == DTRACEACT_USTACK && arg1 != NULL) {
> -		if (arg1->dn_kind != DT_NODE_INT ||
> -		    ((arg1->dn_flags & DT_NF_SIGNED) &&
> -		    (int64_t)arg1->dn_value < 0))
> -			dnerror(arg1, D_USTACK_STRSIZE,
> -				"ustack( ) argument #2 must be a positive integer constant\n");
> +	if (nframesp)
> +		*nframesp = nframes;
> +
> +	if (strszp) {
> +		/* For user stacks, process one more argument. */
> +		if (kind == DTRACEACT_USTACK && arg1 != NULL) {
> +			if (arg1->dn_kind != DT_NODE_INT ||
> +			    ((arg1->dn_flags & DT_NF_SIGNED) &&
> +			    (int64_t)arg1->dn_value < 0))
> +				dnerror(arg1, D_USTACK_STRSIZE,
> +					"ustack( ) argument #2 must be a positive integer constant\n");
>   
> -		/* FIXME: for now, accept non-zero strsize, but it does nothing */
> -		strsize = arg1->dn_value;
> +			*strszp = arg1->dn_value;
> +		} else
> +			*strszp = 0;
>   	}
>   
> -	return DTRACE_STACK_ARG(kind == DTRACEACT_USTACK, nframes, strsize);
> +	return 4 * sizeof(uint32_t) + nframes * sizeof(uint64_t);
>   }
>   
>   /*
> @@ -2729,28 +2739,30 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
>   	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>   	dt_irlist_t	*dlp = &pcb->pcb_ir;
>   	dt_regset_t	*drp = pcb->pcb_regs;
> -	uint64_t	arg;
> -	int		nframes, stacksize, prefsz, align = sizeof(uint64_t);
> +	int		allocsz, nframes = 0, strsz = 0, aloff;
>   	uint_t		lbl_valid = dt_irlist_label(dlp);
>   	dt_ident_t	*skip = dt_dlib_get_var(dtp, "STACK_SKIP");
>   
>   	assert(skip != NULL);
>   
>   	/* Get sizing information from dnp->dn_arg. */
> -	arg = dt_cg_stack_arg(dtp, dnp, kind);
> -	prefsz = kind == DTRACEACT_USTACK ? sizeof(uint64_t) : 0;
> -	nframes = DTRACE_STACK_NFRAMES(arg);
> -	stacksize = nframes * sizeof(uint64_t);
> +	allocsz = dt_cg_stack_arg(dtp, dnp, kind, &nframes, &strsz);
>   
>   	/* Handle alignment and reserve space in the output buffer. */
>   	if (reg >= 0) {
> -		off = ALIGN(off, align);
> +		aloff = ALIGN(off, 8);
>   	} else {
>   		reg = BPF_REG_9;
> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind,
> -				 prefsz + stacksize, align, NULL, arg);
> +		aloff = off = dt_rec_add(dtp, dt_cg_fill_gap, kind, allocsz, 8,
> +					 NULL, 0);
>   	}
>   
> +	/* Store the stack trace meta-data (type, depth, strsize). */
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff, nframes));
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 4, strsz));
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 8,
> +				 kind == DTRACEACT_USTACK ? 1 : 0));
> +
>   	/* Write the tgid. */
>   	if (kind == DTRACEACT_USTACK) {
>   		if (dt_regset_xalloc_args(drp) == -1)
> @@ -2758,19 +2770,19 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
>   		dt_regset_xalloc(drp, BPF_REG_0);
>   		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>   		dt_regset_free_args(drp);
> -		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
> -		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
> -		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
> +		/* A 32-bit store effectively masks the lower 32 bits. */
> +		emit(dlp,  BPF_STORE(BPF_W, reg, aloff + 12, BPF_REG_0));
>   		dt_regset_free(drp, BPF_REG_0);
> -	}
> +	} else
> +		emit(dlp,  BPF_STORE_IMM(BPF_W, reg, aloff + 12, 0));
>   
>   	/* Call bpf_get_stack(ctx, buf, size, flags). */
>   	if (dt_regset_xalloc_args(drp) == -1)
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
>   	emit(dlp,  BPF_MOV_REG(BPF_REG_2, reg));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, off + prefsz));
> -	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, stacksize));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, aloff + 16));
> +	emit(dlp,  BPF_MOV_IMM(BPF_REG_3, nframes * sizeof(uint64_t)));
>   	if (kind == DTRACEACT_USTACK)
>   		emit(dlp,  BPF_MOV_IMM(BPF_REG_4, BPF_F_USER_STACK));
>   	else {
> @@ -2786,7 +2798,7 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off,
>   	emitl(dlp, lbl_valid,
>   		   BPF_NOP());
>   
> -	return prefsz + stacksize;
> +	return (aloff - off) + allocsz;
>   }
>   
>   static void
> @@ -8735,15 +8747,13 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   
>   				if (idp->di_kind == DT_IDENT_FUNC) {
>   					switch (idp->di_id) {
> -					case DIF_SUBR_USTACK:
> -						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_USTACK);
> -						kind = DTRACEACT_USTACK;
> -						size = 8 + 8 * DTRACE_STACK_NFRAMES(arg);
> -						goto add_rec;
>   					case DIF_SUBR_STACK:
> -						arg = dt_cg_stack_arg(dtp, knp, DTRACEACT_STACK);
>   						kind = DTRACEACT_STACK;
> -						size = 8 * arg;
> +						goto is_stack;
> +					case DIF_SUBR_USTACK:
> +						kind = DTRACEACT_USTACK;
> +is_stack:
> +						size = dt_cg_stack_arg(dtp, knp, kind, NULL, NULL);
>   						goto add_rec;
>   					}
>   				} else if (idp->di_kind == DT_IDENT_ACTFUNC) {
> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> index b50a1395..5bf21345 100644
> --- a/libdtrace/dt_dctx.h
> +++ b/libdtrace/dt_dctx.h
> @@ -128,7 +128,8 @@ typedef struct dt_dctx {
>    *	    completed.
>    */
>   #define DMEM_STACK_SZ(dtp) \
> -		(sizeof(uint64_t) * (dtp)->dt_options[DTRACEOPT_MAXFRAMES] + 1)
> +		(4 * sizeof(uint32_t) + \
> +		 (dtp)->dt_options[DTRACEOPT_MAXFRAMES] * sizeof(uint64_t))
>   #define DMEM_TSTR_SZ(dtp) \
>   		(DT_TSTRING_SLOTS * DT_TSTRING_SIZE(dtp))
>   #define DMEM_STRTOK_SZ(dtp) \
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index aa81906f..3b0b2358 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -236,19 +236,6 @@ typedef struct dt_tstring {
>   	int		in_use;			/* In use (1) or not (0) */
>   } dt_tstring_t;
>   
> -/*
> - * The stack()/ustack() data record argument encodes:
> - *  - the stack type (kernel or userspace)
> - *  - the number of frames in the stack trace
> - *  - the size of the optional string area for ustack()
> - */
> -#define DTRACE_STACK_IS_USER(x)		((x) & (1 << 31))
> -#define DTRACE_STACK_NFRAMES(x)		(uint32_t)((x) & INT32_MAX)
> -#define DTRACE_STACK_STRSIZE(x)		(uint32_t)((x) >> 32)
> -#define DTRACE_STACK_ARG(t, x, y)	((((uint64_t)(y)) << 32) | \
> -					 ((t) ? (1UL << 31) : 0) | \
> -					 ((x) & INT32_MAX))
> -
>   typedef struct dt_dirpath {
>   	dt_list_t dir_list;		/* linked-list forward/back pointers */
>   	char *dir_path;			/* directory pathname */
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index ba5463a0..17dfbf9a 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -175,7 +175,7 @@ static const dt_ident_t _dtrace_globals[] = {
>   { "ipl", DT_IDENT_SCALAR, 0, DIF_VAR_IPL, DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_type, "uint_t" },
>   { "jstack", DT_IDENT_ACTFUNC, 0, DT_ACT_JSTACK, DT_ATTR_STABCMN, DT_VERS_1_0,
> -	&dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
> +	&dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
>   { "link_ntop", DT_IDENT_FUNC, 0, DIF_SUBR_LINK_NTOP, DT_ATTR_STABCMN,
>   	DT_VERS_1_5, &dt_idops_func, "string(int, void *)" },
>   { "llquantize", DT_IDENT_AGGFUNC, 0, DT_AGG_LLQUANTIZE,
> @@ -274,7 +274,7 @@ static const dt_ident_t _dtrace_globals[] = {
>   	DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_func, "int()" },
>   { "stack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_STACK, DT_ATTR_STABCMN,
> -	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t])" },
> +	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t])" },
>   { "stackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_STACKDEPTH,
>   	DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_type, "uint32_t" },
> @@ -329,7 +329,7 @@ static const dt_ident_t _dtrace_globals[] = {
>   { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
>   	&dt_idops_regs, NULL },
>   { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
> -	DT_VERS_1_0, &dt_idops_func, "dt_stack([uint32_t], [uint32_t])" },
> +	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
>   { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
>   	DT_ATTR_STABCMN, DT_VERS_1_2,
>   	&dt_idops_type, "uint32_t" },
> @@ -1058,16 +1058,33 @@ dt_vopen(int version, int flags, int *errp,
>   	    "<DYN>", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
>   
>   	/*
> -	 * The stack type is added as a typedef of uint64_t[MAXFRAMES].  The
> -	 * final value of MAXFRAMES may be adjusted with the "stackframes"
> -	 * option.
> +	 * Define:
> +	 *   typedef struct dt_stack {
> +	 *   	uint32_t	frames;
> +	 *	uint32_t	strsz;		// optional string blob size
> +	 *	uint32_t	is_user;	// > 0 if userspace stack
> +	 *	uint32_t	pid;		// process id (or 0 for kernel)
> +	 *   	uint64_t	addrs[n];	// stack trace addresses
> +	 *   } dt_stack_t;
> +	 *
> +	 * It is done in two stages because we won't know the size of the addrs
> +	 * array until runtime options have been processed.  We add all members
> +	 * (except for addrs) here, and then append the addrs array in
> +	 * dtrace_init().
>   	 */
> -	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
> -	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
> -	ctr.ctr_nelems = _dtrace_stackframes;
> -
> -	dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
> -		"dt_stack", ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
> +	{
> +		ctf_id_t	stid, mbid;
> +
> +		stid = ctf_add_struct(dmp->dm_ctfp, CTF_ADD_ROOT, "dt_stack");
> +		dtp->dt_type_stack = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
> +						     "dt_stack_t", stid);
> +
> +		mbid = ctf_lookup_by_name(dmp->dm_ctfp, "uint32_t");
> +		ctf_add_member(dmp->dm_ctfp, stid, "depth", mbid);
> +		ctf_add_member(dmp->dm_ctfp, stid, "strsz", mbid);
> +		ctf_add_member(dmp->dm_ctfp, stid, "is_user", mbid);
> +		ctf_add_member(dmp->dm_ctfp, stid, "pid", mbid);
> +	}
>   
>   	dtp->dt_type_symaddr = ctf_add_typedef(dmp->dm_ctfp, CTF_ADD_ROOT,
>   	    "_symaddr", ctf_lookup_by_name(dmp->dm_ctfp, "void"));
> @@ -1174,6 +1191,27 @@ dtrace_init(dtrace_hdl_t *dtp)
>   	int		i;
>   	dtrace_optval_t	lockmem = dtp->dt_options[DTRACEOPT_LOCKMEM];
>   	struct rlimit	rl;
> +	dt_module_t	*dmp = dtp->dt_ddefs;
> +	ctf_id_t	stid;
> +	ctf_arinfo_t	ctr;
> +
> +	/*
> +	 * Finalize 'struct dt_stack' now that we know the maxframes value.
> +	 */
> +	stid = ctf_lookup_by_name(dmp->dm_ctfp, "struct dt_stack");
> +
> +	ctr.ctr_contents = ctf_lookup_by_name(dmp->dm_ctfp, "uint64_t");
> +	ctr.ctr_index = ctf_lookup_by_name(dmp->dm_ctfp, "long");
> +	ctr.ctr_nelems = (uint_t)dtp->dt_options[DTRACEOPT_MAXFRAMES];
> +
> +	ctf_add_member(dmp->dm_ctfp, stid, "addrs",
> +		       ctf_add_array(dmp->dm_ctfp, CTF_ADD_ROOT, &ctr));
> +
> +	if (ctf_update(dmp->dm_ctfp) != 0) {
> +		dt_dprintf("failed update D container: %s\n",
> +		    ctf_errmsg(ctf_errno(dmp->dm_ctfp)));
> +		return dt_set_errno(dtp, EDT_CTF);
> +	}
>   
>   	/*
>   	 * Initialize the BPF library handling.
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index 006b4b6e..e71c0985 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -3794,7 +3794,7 @@ dt_cook_op2(dt_node_t *dnp, uint_t idflags)
>   		 * described in the ANSI-C spec (see K&R[A7.17]).  We share
>   		 * most of this code with the argument list checking code.
>   		 */
> -		if (!dt_node_is_string(lp)) {
> +		if (!dt_node_is_string(lp) && !dt_node_is_stack(lp)) {
>   			kind = ctf_type_kind(lp->dn_ctfp,
>   			    ctf_type_resolve(lp->dn_ctfp, lp->dn_type));
>   
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index a3e15397..4f814c4e 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -449,7 +449,8 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	if (depth == 0)
>   		return 0;
>   
> -	tgid = (pid_t)*pc++;
> +	tgid = ((uint32_t *)pc)[1];
> +	pc++;
>   
>   	if (format == NULL)
>   		format = "%s";
> @@ -569,18 +570,41 @@ dt_print_stack_user(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	return err;
>   }
>   
> -/*ARGSUSED*/
> +/*
> + * The data at vaddr is structured as follows:
> + *	uint32_t	depth
> + *	uint32_t	strsz
> + *	uint32_t	is_user
> + *	uint32_t	pid
> + *	uint64_t	addrs[depth]
> + *
> + * The 'depth' member provides the maximum number of addresses in the stack
> + * trace.
> + * The 'strsz' member provides the size of the optional string blob that is
> + * appended to the stack trace data.
> + * The 'is_user' member identifies the stack trace as a userspace stack trace
> + * if its value is > 0.
> + * The 'pid' member provides the userspace process id for userspace stack
> + * traces and otherwise will be 0.
> + * The 'addrs' array provides the stack traces addresses.  If the stack trace
> + * is shorter than 'depth', remaining addresses will be 0 and can be ignored.
> + */
>   static int
>   pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	      const dt_pfargd_t *pfd, const void *vaddr, size_t size,
>   	      uint64_t normal, uint64_t sig)
>   {
>   	int width;
> -	const dtrace_recdesc_t *rec = pfd->pfd_rec;
> -	caddr_t addr = (caddr_t)vaddr;
> -	uint32_t depth = DTRACE_STACK_NFRAMES(rec->dtrd_arg);
> +	uint32_t *vals = (uint32_t *)vaddr;
> +	uint32_t depth = vals[0];
> +	uint32_t strsz = vals[1];
> +	uint32_t is_user = vals[2];
> +	caddr_t addr = (caddr_t)(vals + (is_user ? 2 : 4));
>   	int err = 0;
>   
> +	if (depth > dtp->dt_options[DTRACEOPT_MAXFRAMES])
> +		return dt_set_errno(dtp, EDT_DSIZE);
> +
>   	if (depth == 0)
>   		return 0;
>   
> @@ -603,9 +627,9 @@ pfprint_stack(dtrace_hdl_t *dtp, FILE *fp, const char *format,
>   	if (dt_printf(dtp, fp, "\n") < 0)
>   		return -1;
>   
> -	if (DTRACE_STACK_IS_USER(rec->dtrd_arg))
> +	if (is_user)
>   		err = dt_print_stack_user(dtp, fp, format, addr, width, depth,
> -					  DTRACE_STACK_STRSIZE(rec->dtrd_arg));
> +					  strsz);
>   	else
>   		err = dt_print_stack_kernel(dtp, fp, format, addr, width, depth);
>   
> @@ -777,7 +801,7 @@ static const dt_pfconv_t _dtrace_conversions[] = {
>   { "hx", "x", "short", pfcheck_xshort, pfprint_uint },
>   { "hX", "X", "short", pfcheck_xshort, pfprint_uint },
>   { "i", "i", pfproto_xint, pfcheck_dint, pfprint_dint },
> -{ "k", "s", "stack", pfcheck_stack, pfprint_stack },
> +{ "k", "s", "dt_stack_t", pfcheck_stack, pfprint_stack },
>   { "lc", "lc", "int", pfcheck_type, pfprint_sint }, /* a.k.a. wint_t */
>   { "ld",	"d", "long", pfcheck_type, pfprint_sint },
>   { "li",	"i", "long", pfcheck_type, pfprint_sint },
> @@ -2487,9 +2511,8 @@ dt_print_stack(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
>   	else
>   		format = ((dt_pfargv_t *)fmtdata)->pfv_format;
>   
> -	/* pfprint_stack() uses pfd_rec, pfd_flags, and pfd_width only */
> +	/* pfprint_stack() uses pfd_flags and pfd_width only */
>   	memset(&pfd, 0, sizeof(pfd));
> -	pfd.pfd_rec = recs;
>   	pfd.pfd_flags = DT_PFCONV_LEFT;
>   
>   	if (dtp->dt_options[DTRACEOPT_STACKINDENT] != DTRACEOPT_UNSET)
> diff --git a/test/unittest/funcs/stack/err.corrupted-data.d b/test/unittest/funcs/stack/err.corrupted-data.d
> new file mode 100644
> index 00000000..d35361eb
> --- /dev/null
> +++ b/test/unittest/funcs/stack/err.corrupted-data.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Corrupted stack data does not cause a crash.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	v = stack(5);
> +	v.depth = 0x7fffffff;
> +	printf("%k", v);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/err.corrupted-data.r b/test/unittest/funcs/stack/err.corrupted-data.r
> new file mode 100644
> index 00000000..1a2b8d2b
> --- /dev/null
> +++ b/test/unittest/funcs/stack/err.corrupted-data.r
> @@ -0,0 +1,4 @@
> +                   FUNCTION:NAME
> +         hrtimer_nanosleep:entry -- @@stderr --
> +dtrace: script 'test/unittest/funcs/stack/err.corrupted-data.d' matched 2 probes
> +dtrace: processing aborted: Data record has incorrect size
> diff --git a/test/unittest/funcs/stack/err.store-to-stack.d b/test/unittest/funcs/stack/err.store-to-stack.d
> new file mode 100644
> index 00000000..2125c395
> --- /dev/null
> +++ b/test/unittest/funcs/stack/err.store-to-stack.d
> @@ -0,0 +1,23 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Assigning a member in stack() is not allowed.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	stack(5).depth = 2;
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/err.store-to-stack.r b/test/unittest/funcs/stack/err.store-to-stack.r
> new file mode 100644
> index 00000000..1b0fb044
> --- /dev/null
> +++ b/test/unittest/funcs/stack/err.store-to-stack.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/stack/err.store-to-stack.d: line 16: operator = requires modifiable lvalue as an operand
> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.d b/test/unittest/funcs/stack/tst.asgn_dvar.d
> new file mode 100644
> index 00000000..fd32c7b0
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_dvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of stack() to a dynamic variable (assoc element).
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	assoc["a"] = stack(3);
> +	printf("%k", assoc["a"]);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.r b/test/unittest/funcs/stack/tst.asgn_dvar.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_dvar.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.r.p b/test/unittest/funcs/stack/tst.asgn_dvar.r.p
> new file mode 100755
> index 00000000..2bc2077d
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_dvar.r.p
> @@ -0,0 +1,35 @@
> +#!/usr/bin/gawk -f
> +
> +/hrtimer_nanosleep/ {
> +    # check probe
> +    if ( $1 != "hrtimer_nanosleep:entry" ) {
> +        print "ERROR: expected fun:prb = hrtimer_nanosleep:entry";
> +        exit(0);
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if (index($1, "`hrtimer_nanosleep+0x") == 0 &&
> +        match($1, "`hrtimer_nanosleep$") == 0) {
> +        print "ERROR: expected leaf frame to be hrtimer_nanosleep";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing second frame";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing third frame";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit(0);
> +    }
> +
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/funcs/stack/tst.asgn_gvar.d b/test/unittest/funcs/stack/tst.asgn_gvar.d
> new file mode 100644
> index 00000000..06e75430
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_gvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of stack() to a global variable.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	v = stack(3);
> +	printf("%k", v);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.asgn_gvar.r b/test/unittest/funcs/stack/tst.asgn_gvar.r
> new file mode 120000
> index 00000000..a79e4237
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_gvar.r
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r
> \ No newline at end of file
> diff --git a/test/unittest/funcs/stack/tst.asgn_gvar.r.p b/test/unittest/funcs/stack/tst.asgn_gvar.r.p
> new file mode 120000
> index 00000000..2ca41971
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_gvar.r.p
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r.p
> \ No newline at end of file
> diff --git a/test/unittest/funcs/stack/tst.asgn_lvar.d b/test/unittest/funcs/stack/tst.asgn_lvar.d
> new file mode 100644
> index 00000000..1b63d20a
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_lvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of stack() to a local variable.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	this->v = stack(3);
> +	printf("%k", this->v);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.asgn_lvar.r b/test/unittest/funcs/stack/tst.asgn_lvar.r
> new file mode 120000
> index 00000000..a79e4237
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_lvar.r
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r
> \ No newline at end of file
> diff --git a/test/unittest/funcs/stack/tst.asgn_lvar.r.p b/test/unittest/funcs/stack/tst.asgn_lvar.r.p
> new file mode 120000
> index 00000000..2ca41971
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_lvar.r.p
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r.p
> \ No newline at end of file
> diff --git a/test/unittest/funcs/stack/tst.asgn_tvar.d b/test/unittest/funcs/stack/tst.asgn_tvar.d
> new file mode 100644
> index 00000000..9722290b
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_tvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of stack() to a TLS variable.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	self->v = stack(3);
> +	printf("%k", self->v);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.asgn_tvar.r b/test/unittest/funcs/stack/tst.asgn_tvar.r
> new file mode 120000
> index 00000000..a79e4237
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_tvar.r
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r
> \ No newline at end of file
> diff --git a/test/unittest/funcs/stack/tst.asgn_tvar.r.p b/test/unittest/funcs/stack/tst.asgn_tvar.r.p
> new file mode 120000
> index 00000000..2ca41971
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.asgn_tvar.r.p
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r.p
> \ No newline at end of file
> diff --git a/test/unittest/funcs/stack/tst.ref_addrs.d b/test/unittest/funcs/stack/tst.ref_addrs.d
> new file mode 100644
> index 00000000..8ea385f7
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_addrs.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'addrs' array of a kernel stack.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	trace("Expecting vmlinux`hrtimer_nanosleep, got ");
> +	func(stack(7).addrs[0]);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.ref_addrs.r b/test/unittest/funcs/stack/tst.ref_addrs.r
> new file mode 100644
> index 00000000..f209b8ed
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_addrs.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +         hrtimer_nanosleep:entry   Expecting vmlinux`hrtimer_nanosleep, got   vmlinux`hrtimer_nanosleep
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/stack/tst.ref_addrs.d' matched 2 probes
> diff --git a/test/unittest/funcs/stack/tst.ref_depth.d b/test/unittest/funcs/stack/tst.ref_depth.d
> new file mode 100644
> index 00000000..0a8ce390
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_depth.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'depth' field of a kernel stack.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	trace("Expecting 7, got ");
> +	trace(stack(7).depth);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).depth == 7/
> +{
> +	exit(0);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).depth != 7/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.ref_depth.r b/test/unittest/funcs/stack/tst.ref_depth.r
> new file mode 100644
> index 00000000..10a70b58
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_depth.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +         hrtimer_nanosleep:entry   Expecting 7, got                           7
> +         hrtimer_nanosleep:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/stack/tst.ref_depth.d' matched 4 probes
> diff --git a/test/unittest/funcs/stack/tst.ref_is_user.d b/test/unittest/funcs/stack/tst.ref_is_user.d
> new file mode 100644
> index 00000000..076fe289
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_is_user.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'is_user' field of a kernel stack.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	trace("Expecting 0, got ");
> +	trace(stack(7).is_user);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).is_user == 0/
> +{
> +	exit(0);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).is_user != 0/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.ref_is_user.r b/test/unittest/funcs/stack/tst.ref_is_user.r
> new file mode 100644
> index 00000000..78259b48
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_is_user.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +         hrtimer_nanosleep:entry   Expecting 0, got                           0
> +         hrtimer_nanosleep:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/stack/tst.ref_is_user.d' matched 4 probes
> diff --git a/test/unittest/funcs/stack/tst.ref_pid.d b/test/unittest/funcs/stack/tst.ref_pid.d
> new file mode 100644
> index 00000000..db64d5fb
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_pid.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'pid' field of a kernel stack yields 0.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	trace("Expecting 0, got ");
> +	trace(stack(7).pid);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).pid == 0/
> +{
> +	exit(0);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).pid != 0/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.ref_pid.r b/test/unittest/funcs/stack/tst.ref_pid.r
> new file mode 100644
> index 00000000..30f4541d
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_pid.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +         hrtimer_nanosleep:entry   Expecting 0, got                           0
> +         hrtimer_nanosleep:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/stack/tst.ref_pid.d' matched 4 probes
> diff --git a/test/unittest/funcs/stack/tst.ref_strsz.d b/test/unittest/funcs/stack/tst.ref_strsz.d
> new file mode 100644
> index 00000000..3ec5efcf
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_strsz.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'strsz' field of a kernel stack yields 0.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	trace("Expecting 0, got ");
> +	trace(stack(7).strsz);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).strsz == 0/
> +{
> +	exit(0);
> +}
> +
> +fbt::hrtimer_nanosleep:entry
> +/stack(7).strsz != 0/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.ref_strsz.r b/test/unittest/funcs/stack/tst.ref_strsz.r
> new file mode 100644
> index 00000000..3fff4fea
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.ref_strsz.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +         hrtimer_nanosleep:entry   Expecting 0, got                           0
> +         hrtimer_nanosleep:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/stack/tst.ref_strsz.d' matched 4 probes
> diff --git a/test/unittest/funcs/stack/tst.store.d b/test/unittest/funcs/stack/tst.store.d
> new file mode 100644
> index 00000000..6d113596
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.store.d
> @@ -0,0 +1,28 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: It is possible to store to members of dt_stack_t.
> + */
> +
> +/* @@trigger: periodic_output */
> +
> +fbt::hrtimer_nanosleep:entry
> +{
> +	v = stack(3);
> +	printf("%k", v);
> +	v.depth = 2;
> +	printf("%k", v);
> +	v.depth = 3;
> +	printf("%k", v);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/stack/tst.store.r b/test/unittest/funcs/stack/tst.store.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.store.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/funcs/stack/tst.store.r.p b/test/unittest/funcs/stack/tst.store.r.p
> new file mode 100755
> index 00000000..cd1bc568
> --- /dev/null
> +++ b/test/unittest/funcs/stack/tst.store.r.p
> @@ -0,0 +1,63 @@
> +#!/usr/bin/gawk -f
> +
> +/hrtimer_nanosleep/ {
> +    # check probe
> +    if ( $1 != "hrtimer_nanosleep:entry" ) {
> +        print "ERROR: expected fun:prb = hrtimer_nanosleep:entry";
> +        exit(0);
> +    }
> +
> +    # collect 3 stack frames
> +    for (i = 0; i < 3; i++) {
> +        getline;
> +        if (NF == 0) {
> +            print "ERROR: missing stack(3) frame addrs["i"]";
> +            exit(0);
> +        }
> +        stack[i] = $0;
> +    }
> +    getline;
> +    if (NF != 0) {
> +        print "ERROR: too many stack frames (first stack(3))";
> +        exit(0);
> +    }
> +
> +    # expect 2 stack frames
> +    for (i = 0; i < 2; i++) {
> +        getline;
> +        if (NF == 0) {
> +            print "ERROR: missing stack(2) frame addrs["i"]";
> +            exit(0);
> +        }
> +        if (stack[i] != $0) {
> +            print "ERROR: wrong stack(2) frame addrs["i"]";
> +            exit(0);
> +        }
> +    }
> +    getline;
> +    if (NF != 0) {
> +        print "ERROR: too many stack frames (stack(2))";
> +        exit(0);
> +    }
> +
> +    # expect 3 stack frames
> +    for (i = 0; i < 3; i++) {
> +        getline;
> +        if (NF == 0) {
> +            print "ERROR: missing stack(3) frame addrs["i"]";
> +            exit(0);
> +        }
> +        if (stack[i] != $0) {
> +            print "ERROR: wrong stack(3) frame addrs["i"]";
> +            exit(0);
> +        }
> +    }
> +    getline;
> +    if (NF != 0) {
> +        print "ERROR: too many stack frames (second stack(3))";
> +        exit(0);
> +    }
> +
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/funcs/ustack/err.corrupted-data.d b/test/unittest/funcs/ustack/err.corrupted-data.d
> new file mode 100644
> index 00000000..c4525aaf
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/err.corrupted-data.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Corrupted stack data does not cause a crash.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	v = ustack(5);
> +	v.depth = 0x7fffffff;
> +	printf("%k", v);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/err.corrupted-data.r b/test/unittest/funcs/ustack/err.corrupted-data.r
> new file mode 100644
> index 00000000..8ad0244f
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/err.corrupted-data.r
> @@ -0,0 +1,4 @@
> +                   FUNCTION:NAME
> +                  myfunc_z:entry -- @@stderr --
> +dtrace: script 'test/unittest/funcs/ustack/err.corrupted-data.d' matched 2 probes
> +dtrace: processing aborted: Data record has incorrect size
> diff --git a/test/unittest/funcs/ustack/err.store-to-stack.d b/test/unittest/funcs/ustack/err.store-to-stack.d
> new file mode 100644
> index 00000000..106c0cd9
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/err.store-to-stack.d
> @@ -0,0 +1,23 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Assigning a member in ustack() is not allowed.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	ustack(5).depth = 2;
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/err.store-to-stack.r b/test/unittest/funcs/ustack/err.store-to-stack.r
> new file mode 100644
> index 00000000..3a0aeba5
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/err.store-to-stack.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/funcs/ustack/err.store-to-stack.d: line 16: operator = requires modifiable lvalue as an operand
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.d b/test/unittest/funcs/ustack/tst.asgn_dvar.d
> new file mode 100644
> index 00000000..142a56ce
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_dvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of ustack() to a dynamic variable (assoc element).
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	assoc["a"] = ustack(3);
> +	printf("%k", assoc["a"]);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r b/test/unittest/funcs/ustack/tst.asgn_dvar.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_dvar.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/funcs/ustack/tst.asgn_dvar.r.p b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> new file mode 100755
> index 00000000..0ffa73ba
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_dvar.r.p
> @@ -0,0 +1,60 @@
> +#!/usr/bin/gawk -f
> +
> +BEGIN {
> +    cmd = "uname -rm";
> +    cmd | getline;
> +    close(cmd);
> +
> +    if (/x86_64/) {
> +	gsub(/\./, " ");
> +	maj = int($1);
> +	min = int($2);
> +	if (maj < 6 || (maj == 6 && min < 11))
> +	    missing_frame = 1;
> +    } else
> +	missing_frame = 1;
> +}
> +
> +/myfunc_z/ {
> +    # check probe
> +    if ( $1 != "myfunc_z:entry" ) {
> +        print "ERROR: expected fun:prb = myfunc_z:entry";
> +        exit(0);
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if (index($1, "`myfunc_z+0x") == 0 &&
> +        match($1, "`myfunc_z$") == 0) {
> +        print "ERROR: expected leaf frame to be myfunc_z";
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing second frame";
> +        exit(0);
> +    }
> +    if (index($1, missing_frame ? "`myfunc_x+0x" : "`myfunc_y+0x") == 0 &&
> +        match($1, missing_frame ? "`myfunc_x$" : "`myfunc_y$") == 0) {
> +        printf("ERROR: expected leaf frame to be %s\n", missing_frame ? "myfunc_x" : "myfunc_y");
> +        exit(0);
> +    }
> +    getline;
> +    if (NF == 0) {
> +        print "ERROR: missing third frame";
> +        exit(0);
> +    }
> +    if (index($1, missing_frame ? "`myfunc_w+0x" : "`myfunc_x+0x") == 0 &&
> +        match($1, missing_frame ? "`myfunc_w$" : "`myfunc_x$") == 0) {
> +        printf("ERROR: expected leaf frame to be %s\n", missing_frame ? "myfunc_w" : "myfunc_x");
> +        exit(0);
> +    }
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit(0);
> +    }
> +
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.asgn_gvar.d b/test/unittest/funcs/ustack/tst.asgn_gvar.d
> new file mode 100644
> index 00000000..089e145f
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_gvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of ustack() to a global variable.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	v = ustack(3);
> +	printf("%k", v);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.asgn_gvar.r b/test/unittest/funcs/ustack/tst.asgn_gvar.r
> new file mode 120000
> index 00000000..a79e4237
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_gvar.r
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r
> \ No newline at end of file
> diff --git a/test/unittest/funcs/ustack/tst.asgn_gvar.r.p b/test/unittest/funcs/ustack/tst.asgn_gvar.r.p
> new file mode 120000
> index 00000000..2ca41971
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_gvar.r.p
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r.p
> \ No newline at end of file
> diff --git a/test/unittest/funcs/ustack/tst.asgn_lvar.d b/test/unittest/funcs/ustack/tst.asgn_lvar.d
> new file mode 100644
> index 00000000..132d4a89
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_lvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of ustack() to a local variable.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	this->v = ustack(3);
> +	printf("%k", this->v);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.asgn_lvar.r b/test/unittest/funcs/ustack/tst.asgn_lvar.r
> new file mode 120000
> index 00000000..a79e4237
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_lvar.r
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r
> \ No newline at end of file
> diff --git a/test/unittest/funcs/ustack/tst.asgn_lvar.r.p b/test/unittest/funcs/ustack/tst.asgn_lvar.r.p
> new file mode 120000
> index 00000000..2ca41971
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_lvar.r.p
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r.p
> \ No newline at end of file
> diff --git a/test/unittest/funcs/ustack/tst.asgn_tvar.d b/test/unittest/funcs/ustack/tst.asgn_tvar.d
> new file mode 100644
> index 00000000..46fbe606
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_tvar.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test assignment of ustack() to a TLS variable.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	self->v = ustack(3);
> +	printf("%k", self->v);
> +
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.asgn_tvar.r b/test/unittest/funcs/ustack/tst.asgn_tvar.r
> new file mode 120000
> index 00000000..a79e4237
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_tvar.r
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r
> \ No newline at end of file
> diff --git a/test/unittest/funcs/ustack/tst.asgn_tvar.r.p b/test/unittest/funcs/ustack/tst.asgn_tvar.r.p
> new file mode 120000
> index 00000000..2ca41971
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.asgn_tvar.r.p
> @@ -0,0 +1 @@
> +tst.asgn_dvar.r.p
> \ No newline at end of file
> diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.d b/test/unittest/funcs/ustack/tst.ref_addrs.d
> new file mode 100644
> index 00000000..97b0d684
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_addrs.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'addrs' array of a userspace stack.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	trace("Expecting ustack-tst-basic`myfunc_z, got ");
> +	ufunc(ustack(7).addrs[0]);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_addrs.r b/test/unittest/funcs/ustack/tst.ref_addrs.r
> new file mode 100644
> index 00000000..20f36969
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_addrs.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                  myfunc_z:entry   Expecting ustack-tst-basic`myfunc_z, got   ustack-tst-basic`myfunc_z
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/ustack/tst.ref_addrs.d' matched 2 probes
> diff --git a/test/unittest/funcs/ustack/tst.ref_depth.d b/test/unittest/funcs/ustack/tst.ref_depth.d
> new file mode 100644
> index 00000000..d847736a
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_depth.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'depth' field of a userspace stack.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	trace("Expecting 7, got ");
> +	trace(ustack(7).depth);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).depth == 7/
> +{
> +	exit(0);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).depth != 7/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_depth.r b/test/unittest/funcs/ustack/tst.ref_depth.r
> new file mode 100644
> index 00000000..de6bf067
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_depth.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +                  myfunc_z:entry   Expecting 7, got                           7
> +                  myfunc_z:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/ustack/tst.ref_depth.d' matched 4 probes
> diff --git a/test/unittest/funcs/ustack/tst.ref_is_user.d b/test/unittest/funcs/ustack/tst.ref_is_user.d
> new file mode 100644
> index 00000000..5465f090
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_is_user.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'is_user' field of a userspace stack.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	trace("Expecting 1, got ");
> +	trace(ustack(7).is_user);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).is_user == 1/
> +{
> +	exit(0);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).is_user != 0/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_is_user.r b/test/unittest/funcs/ustack/tst.ref_is_user.r
> new file mode 100644
> index 00000000..937fd8d3
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_is_user.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +                  myfunc_z:entry   Expecting 1, got                           1
> +                  myfunc_z:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/ustack/tst.ref_is_user.d' matched 4 probes
> diff --git a/test/unittest/funcs/ustack/tst.ref_pid.d b/test/unittest/funcs/ustack/tst.ref_pid.d
> new file mode 100644
> index 00000000..80c2473b
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_pid.d
> @@ -0,0 +1,37 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'pid' field of a userspace stack.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	trace("Expecting ");
> +	trace($target);
> +	trace(", got ");
> +	trace(ustack(7).pid);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).pid == $target/
> +{
> +	exit(0);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7).pid != $target/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_strsz.d b/test/unittest/funcs/ustack/tst.ref_strsz.d
> new file mode 100644
> index 00000000..7d4740c3
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_strsz.d
> @@ -0,0 +1,35 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test accessing the 'strsz' field of a userspace stack.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	trace("Expecting 42, got ");
> +	trace(ustack(7, 42).strsz);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7, 42).strsz == 42/
> +{
> +	exit(0);
> +}
> +
> +pid$target:a.out:myfunc_z:entry
> +/ustack(7, 42).strsz != 42/
> +{
> +	exit(1);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.ref_strsz.r b/test/unittest/funcs/ustack/tst.ref_strsz.r
> new file mode 100644
> index 00000000..840f7e21
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.ref_strsz.r
> @@ -0,0 +1,6 @@
> +                   FUNCTION:NAME
> +                  myfunc_z:entry   Expecting 42, got                         42
> +                  myfunc_z:entry
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/ustack/tst.ref_strsz.d' matched 4 probes
> diff --git a/test/unittest/funcs/ustack/tst.store.d b/test/unittest/funcs/ustack/tst.store.d
> new file mode 100644
> index 00000000..066d5705
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.store.d
> @@ -0,0 +1,28 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: It is possible to store to members of dt_stack_t.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	v = ustack(5);
> +	printf("%k", v);
> +	v.depth = 2;
> +	printf("%k", v);
> +	v.depth = 5;
> +	printf("%k", v);
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/funcs/ustack/tst.store.r b/test/unittest/funcs/ustack/tst.store.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.store.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/funcs/ustack/tst.store.r.p b/test/unittest/funcs/ustack/tst.store.r.p
> new file mode 100755
> index 00000000..7ccffbb5
> --- /dev/null
> +++ b/test/unittest/funcs/ustack/tst.store.r.p
> @@ -0,0 +1,63 @@
> +#!/usr/bin/gawk -f
> +
> +/myfunc_z/ {
> +    # check probe
> +    if ( $1 != "myfunc_z:entry" ) {
> +        print "ERROR: expected fun:prb = myfunc_z:entry";
> +        exit(0);
> +    }
> +
> +    # collect 5 stack frames
> +    for (i = 0; i < 5; i++) {
> +        getline;
> +        if (NF == 0) {
> +            print "ERROR: missing stack(5) frame addrs["i"]";
> +            exit(0);
> +        }
> +        stack[i] = $0;
> +    }
> +    getline;
> +    if (NF != 0) {
> +        print "ERROR: too many stack frames (first stack(5))";
> +        exit(0);
> +    }
> +
> +    # expect 2 stack frames
> +    for (i = 0; i < 2; i++) {
> +        getline;
> +        if (NF == 0) {
> +            print "ERROR: missing stack(2) frame addrs["i"]";
> +            exit(0);
> +        }
> +        if (stack[i] != $0) {
> +            print "ERROR: wrong stack(2) frame addrs["i"]";
> +            exit(0);
> +        }
> +    }
> +    getline;
> +    if (NF != 0) {
> +        print "ERROR: too many stack frames (stack(2))";
> +        exit(0);
> +    }
> +
> +    # expect 5 stack frames
> +    for (i = 0; i < 5; i++) {
> +        getline;
> +        if (NF == 0) {
> +            print "ERROR: missing stack(5) frame addrs["i"]";
> +            exit(0);
> +        }
> +        if (stack[i] != $0) {
> +            print "ERROR: wrong stack(5) frame addrs["i"]";
> +            exit(0);
> +        }
> +    }
> +    getline;
> +    if (NF != 0) {
> +        print "ERROR: too many stack frames (second stack(5))";
> +        exit(0);
> +    }
> +
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
> index 95ac80da..b1e55bc0 100644
> --- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
> +++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.r
> @@ -2,4 +2,4 @@
>   dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.stack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
>   	conversion: %p
>   	 prototype: pointer or integer
> -	  argument: dt_stack
> +	  argument: dt_stack_t
> diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
> index 5df10376..d6687d7a 100644
> --- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
> +++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.r
> @@ -2,4 +2,4 @@
>   dtrace: failed to compile script test/unittest/printa/err.D_PRINTF_ARG_TYPE.ustack.d: [D_PRINTF_ARG_TYPE] line 12: printa( ) argument #2 is incompatible with conversion #1 prototype:
>   	conversion: %p
>   	 prototype: pointer or integer
> -	  argument: dt_stack
> +	  argument: dt_stack_t
> diff --git a/test/unittest/printf/tst.stack.d b/test/unittest/printf/tst.stack.d
> new file mode 100644
> index 00000000..db943c29
> --- /dev/null
> +++ b/test/unittest/printf/tst.stack.d
> @@ -0,0 +1,33 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Test printf with %k and a stack argument.
> + *
> + * SECTION: Output Formatting/printf()
> + */
> +
> +#pragma D option destructive
> +
> +BEGIN
> +{
> +	system("echo write something > /dev/null");
> +}
> +
> +fbt::ksys_write:entry
> +{
> +	printf("%k", stack(1));
> +	printf("%k", stack(2));
> +	printf("%k", stack(3));
> +	printf("%k", stack());
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/printf/tst.stack.r b/test/unittest/printf/tst.stack.r
> new file mode 100644
> index 00000000..2e9ba477
> --- /dev/null
> +++ b/test/unittest/printf/tst.stack.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/printf/tst.stack.r.p b/test/unittest/printf/tst.stack.r.p
> new file mode 100755
> index 00000000..895f96f5
> --- /dev/null
> +++ b/test/unittest/printf/tst.stack.r.p
> @@ -0,0 +1,75 @@
> +#!/usr/bin/gawk -f
> +
> +/ksys_write/ {
> +    # check probe
> +    if ( $1 != "ksys_write:entry" ) {
> +        print "ERROR: expected fun:prb = ksys_write:entry";
> +        exit 1;
> +    }
> +
> +    # check stack(1)
> +    getline;
> +    if (index($1, "`ksys_write+0x") == 0 &&
> +        match($1, "`ksys_write$") == 0) {
> +        print "ERROR: expected leaf frame to be ksys_write";
> +        exit 1;
> +    }
> +    FRAME1 = $1;
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(1) to have only one frame";
> +        exit 1;
> +    }
> +
> +    # check stack(2)
> +    getline;
> +    if ($1 != FRAME1) {
> +        print "ERROR: stack(2) leaf frame looks wrong";
> +        exit 1;
> +    }
> +    getline;
> +    FRAME2 = $1;
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(2) to have only two frames";
> +        exit 1;
> +    }
> +
> +    # check stack(3)
> +    getline;
> +    if ($1 != FRAME1) {
> +        print "ERROR: stack(3) leaf frame looks wrong";
> +        exit 1;
> +    }
> +    getline;
> +    if ($1 != FRAME2) {
> +        print "ERROR: stack(3) frame2 looks wrong";
> +        exit 1;
> +    }
> +    getline;
> +    FRAME3 = $1;
> +    getline;
> +    if (NF > 0) {
> +        print "ERROR: expected stack(3) to have only three frames";
> +        exit 1;
> +    }
> +
> +    # check stack()
> +    getline;
> +    if ($1 != FRAME1) {
> +        print "ERROR: stack() leaf frame looks wrong";
> +        exit 1;
> +    }
> +    getline;
> +    if ($1 != FRAME2) {
> +        print "ERROR: stack() frame2 looks wrong";
> +        exit 1;
> +    }
> +    getline;
> +    if ($1 != FRAME3) {
> +        print "ERROR: stack() frame3 looks wrong";
> +        exit 1;
> +    }
> +    print "success";
> +    exit(0);
> +}
> diff --git a/test/unittest/printf/tst.ustack25_pid.d b/test/unittest/printf/tst.ustack25_pid.d
> new file mode 100644
> index 00000000..9ae3a7b8
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.d
> @@ -0,0 +1,21 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: ustack-tst-basic */
> +
> +#pragma D option quiet
> +
> +pid$target:a.out:myfunc_z:entry
> +{
> +	printf("%k", ustack(25));
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/printf/tst.ustack25_pid.r b/test/unittest/printf/tst.ustack25_pid.r
> new file mode 100644
> index 00000000..412df410
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.r
> @@ -0,0 +1,28 @@
> +
> +ustack-tst-basic`myfunc_z
> +ustack-tst-basic`myfunc_y+{ptr}
> +ustack-tst-basic`myfunc_x+{ptr}
> +ustack-tst-basic`myfunc_w+{ptr}
> +ustack-tst-basic`myfunc_v+{ptr}
> +ustack-tst-basic`myfunc_u+{ptr}
> +ustack-tst-basic`myfunc_t+{ptr}
> +ustack-tst-basic`myfunc_s+{ptr}
> +ustack-tst-basic`myfunc_r+{ptr}
> +ustack-tst-basic`myfunc_q+{ptr}
> +ustack-tst-basic`myfunc_p+{ptr}
> +ustack-tst-basic`myfunc_o+{ptr}
> +ustack-tst-basic`myfunc_n+{ptr}
> +ustack-tst-basic`myfunc_m+{ptr}
> +ustack-tst-basic`myfunc_l+{ptr}
> +ustack-tst-basic`myfunc_k+{ptr}
> +ustack-tst-basic`myfunc_j+{ptr}
> +ustack-tst-basic`myfunc_i+{ptr}
> +ustack-tst-basic`myfunc_h+{ptr}
> +ustack-tst-basic`myfunc_g+{ptr}
> +ustack-tst-basic`myfunc_f+{ptr}
> +ustack-tst-basic`myfunc_e+{ptr}
> +ustack-tst-basic`myfunc_d+{ptr}
> +ustack-tst-basic`myfunc_c+{ptr}
> +ustack-tst-basic`myfunc_b+{ptr}
> +ustack-tst-basic`myfunc_a+{ptr}
> +
> diff --git a/test/unittest/printf/tst.ustack25_pid.r.p b/test/unittest/printf/tst.ustack25_pid.r.p
> new file mode 100755
> index 00000000..c87ef73f
> --- /dev/null
> +++ b/test/unittest/printf/tst.ustack25_pid.r.p
> @@ -0,0 +1,37 @@
> +#!/bin/bash
> +
> +# A pid entry probe places a uprobe on the first instruction of a function.
> +# Unfortunately, this is so early in the function preamble that the function
> +# frame pointer has not yet been established and the actual caller of the
> +# traced function is missed.
> +#
> +# In Linux 6.11, x86-specific heuristics are introduced to fix this problem.
> +# See commit cfa7f3d
> +# ("perf,x86: avoid missing caller address in stack traces captured in uprobe")
> +# for both a description of the problem and an explanation of the heuristics.
> +#
> +# Add post processing to these test results to allow for both cases:
> +# caller frame is missing or not missing.
> +
> +missing_caller=1
> +if [ $(uname -m) == "x86_64" ]; then
> +        read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +        if [ $MAJOR -ge 6 ]; then
> +                if [ $MAJOR -gt 6 -o $MINOR -ge 11 ]; then
> +                        missing_caller=0
> +                fi
> +        fi
> +fi
> +
> +if [ $missing_caller -eq 1 ]; then
> +        # Add the missing caller function after the current function.
> +        awk '{ print }
> +             /myfunc_z/ { print "ustack-tst-basic`myfunc_y+{ptr}" }'
> +else
> +        # The .r results file has an extra frame at the end in case
> +        # the caller frame is missing and the 25-frame limit goes
> +        # "too far."  If the caller is not missing, fake that extra frame.
> +        awk '{ print }
> +             /myfunc_b/ { print "ustack-tst-basic`myfunc_a+{ptr}" }'
> +fi
