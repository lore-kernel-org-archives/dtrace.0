Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9CE2D24B7
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768558504; cv=fail; b=V86u1gBBXYEmOXyq+alHD1a5vrVC7mreOxAsaFtTw0nV0qG3HBCR/AWXE+OotYXmEH8ZN9fhGUu+Ep1aQYGy2bPbDrEMgCp0Hh9i2G95eP1sWMwNp8BsZUPuUmibi4m3JulYIdZTtSqnZyJ0nvu0y+Vl0i8QUjTLDbVVH9wepAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768558504; c=relaxed/simple;
	bh=UDEb91haOu48RKHrlB6QNna5DdA2jLqMsgpmrhlbnxY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=elH/yjwqCHKyuAj0US8OzQ30Dp4iO27BYKleeHjQvx5qDBzMF3H9AiOl0BrMtOtGpQmZh6g3YrMXVhYEtD/gL24HHNFV1ismMlaWjKdb+krds0GiXQh7MPim5JmmkMCBWC6GZif/oLkyLTFdtG0flaGTApfx+GfQenkaUhdKrFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JNjEr0kY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tV0e+2o/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JNjEr0kY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tV0e+2o/"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G1ZfFx2020555
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 10:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=kn3/7E62onIoLS85+IaX/3JttsfO/I8Tb6P4lWTrin8=; b=
	JNjEr0kYXsML1v2TGm67EIiHVBiKeG6+uHppzpNpQc7j9NavDVUKJ1mkJ3jDSIn3
	157OECx00PcN4SAY/IdqDjU0GXqZswAhzxdM5BQ8pMA8pJl4rspWwCYU7xYdvZ3e
	RwDSW/2PM7L1hiIBophABK86lTYJXqld3dnTJYVhbtQiMP8smwHd8FCVoffhaEva
	vjDahdHNV5M72rMlwH/IBz3nVbxXQ7kLvI7AACIg/qMkHo/hCDPEpvmXRHtKLkax
	jQfHDcDsuVNMu/5oGMQua+2plqnLetZ/e+eDnat00xuKPBNB1IPO5USbTnQl99oq
	aYLps9kP6sjre5P/wqaVZA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkpwgsqg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 10:15:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60G9LtrE004186
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 10:15:00 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011037.outbound.protection.outlook.com [52.101.62.37])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7ph5bv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 10:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqhrdvM3qZqb9GDzdIYMvjBNLE95Ef4lft5Z0gpbvSoGneYLgBN1o0epvTKMCbLNH9XzyYC0uPGC59WFx5zbs+vrol1FYznovkSI7R34eCR0R2mc5HSPYW/4i/Mv0TD1CdLPcX/W4djLnSCRAqJzN3KvBkkkA9IuhRFqhq3tvWb/wpz2Y2rxL12VrYsNRtnDHqfud4CO9ER+amCqwXGZhNEX4uU6/HPWcgdLkDR5qZHy8uVl3Jo3f6Vz2nEt9UPBWXPI6FRupRbJj9B95HzbKmzG5mMyS2BCTK8j1xcHmQIsjTsxcSuWXbZSKKg2ihOos/fTRa/X9L7FqKL8+Xl6hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kn3/7E62onIoLS85+IaX/3JttsfO/I8Tb6P4lWTrin8=;
 b=KzvkF78bUYwHXxdV2O0yD9GYQYBOgLlzz1UeX/UtgXcsMkuEqEJqrDrWtiApgVoAzAh8deTRqkbZ91yJ4Q1h03CXRmFOEwSUOCTfntpWFH0zGclG7TNZKoDinaIgcvbAqux13sNDTs1WIjbCho1CflbqFukshj7mflm3EETQ/suOkDpf0hhslJL6QQ6ulYVULeR73+V3AaHYdDmGCwDfena9DePPI+fmRxSRRAOHd5aeWJ4RrrN5LTwk1OR+5JcM60/9lF7fa4wr8no0U2j4kvi1NHFRlUN9YDWcKLg+gvAGYaF337OUW+rcKQj0YYnDAEUdPONeTY0Gal5EVx+vJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn3/7E62onIoLS85+IaX/3JttsfO/I8Tb6P4lWTrin8=;
 b=tV0e+2o/JzhrjhTrahQYOgYExU7EXMg3pXN38ctjVgT9sA2gsNaFYWG/uj/tGZpIr4dcCuiXtJ1zVJ4x3KQZP2RHIM3eq98AroOapPeFjPicR9YQyBfPK+Zc3AT1dExvsybDPjZ8BTibRz3lOsKk8NODC42uGnM2vcBsh1MRfRc=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CYXPR10MB7975.namprd10.prod.outlook.com (2603:10b6:930:d7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.6; Fri, 16 Jan 2026 10:14:56 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%7]) with mapi id 15.20.9478.004; Fri, 16 Jan 2026
 10:14:55 +0000
Message-ID: <8c33b6fe-04fd-4331-bf81-79824eabcd19@oracle.com>
Date: Fri, 16 Jan 2026 10:14:51 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt_lex: support '/' in probe descriptors
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260113165132.2454591-1-alan.maguire@oracle.com>
 <20260113165132.2454591-2-alan.maguire@oracle.com>
 <aWluoAHJlDsea04U@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aWluoAHJlDsea04U@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0497.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::22) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CYXPR10MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 05996c35-a039-48b8-66a4-08de54e81892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUpZQ0dsYUNmTXNrSmgwekFydDhRVDRrdDJQMk54c0VNUjkzWlFNdzc2dHJ2?=
 =?utf-8?B?bEh4cGFPS0krbmkweUphWWJoeXBVKzZiMG01V1VQRHQ3b1ZRTFRmOHhzWWhj?=
 =?utf-8?B?TUtISnZtbHVqNzdWbHJTZ21JcEtRcG5XeXB5MlJGRk9MZ2cwazk5TlhaMjdF?=
 =?utf-8?B?TFUycnN1UldYT1ZQKzBjbitPY0pNZG1RQVExUUQ4NGE0bkZTYXhDN0VUeVJz?=
 =?utf-8?B?YjVNdG5uWkwrLzUxY2xGWmxnTnVkWU1lTlNVTWFXcnBTYy9ONk4rcS8xeEhi?=
 =?utf-8?B?VmR5UU1wdFRQZHlKQ2dnSDVpa0ZFOHA1dVZWMjRVV0xTUi9iRU5vVmFmeE43?=
 =?utf-8?B?bWoyZzlVVWZ4YXNhTzJmeDhueHlBT2FTNzltcGVDbkpZRlBiSVBhbGphdks2?=
 =?utf-8?B?VXVUOS9lMitkVXNoeG12UTV6UU5PUWdrWC9qbmY3NWc2VEZlODZzSUZwUXRJ?=
 =?utf-8?B?QmhKa3R3NFo5c3lOU0JUOUFWMlM1SVg2U0VZa0R6aVh6RENWbnVKbHpVUFYz?=
 =?utf-8?B?MUZEZm9GbXZlTFhRZUV3Z2lpakZkc2lGbGE5SFpxR1cwb3A1Rm9tYUluUDdG?=
 =?utf-8?B?TUZBTXhWOHJReHNGeUtIaVVjMXo1MHVoVUN1RXBucHlWVnBRS1ZLbzJackRi?=
 =?utf-8?B?ZU5KNHVRWDdoTzl4QWwweVNQTG9IRzNzdHhGWUtBMitlYkNqYU5WVFk0bEJ0?=
 =?utf-8?B?Q0h2QmZRZDdYNlZ3SDRodHFmRHFLNkJsSmIxQU85dS9IWmFPMlBwWkdpNm9x?=
 =?utf-8?B?UDk2YTRJVlJKK0F3dkpvY0ZlSzQ3OW1CTS9MWWt4NTVIOXJOSGNCZUltKzNR?=
 =?utf-8?B?cVY4anZEN3JWMWtDSHl1bDB0QnBnUkJnaGkweGJjenNUTFJOZStLVTlQWG80?=
 =?utf-8?B?V1l4b3pRZGp1RWJwMTg3ckVEUGYxRXYzZmJkT25uUmJPdno4R2hNbWY2NjdO?=
 =?utf-8?B?alFpek1XN0xDaUpScWJBRnE4Y0VjcHFNcml0U0NYdnZaZ0VUdmtHbkRMU3ZT?=
 =?utf-8?B?STJDUWpsNVg0d2FaMlo4NGhHUjNxNURGdjhzVkYwN0JhdzFSVWs0M1k5MFQ2?=
 =?utf-8?B?OVFBZkViUGJ6SEM3ZWRZaGdLcXpxRmpGUWlKSDdDcjJ5c1kvYXpiYzhSd1Rn?=
 =?utf-8?B?Q1lYeXc1UEV2Tkc2bHpMOVl2WFo3bmcwRmVvcGlyYkVQRFdFU1BMWEp1RmVE?=
 =?utf-8?B?a25TN1FwNE1lSVo0b2MwNUd4NkJRNUVUTTMxUWRrZVZxM1FiOFhUd1p3MW1K?=
 =?utf-8?B?ZGNsNTRWOWw2cGZ0K29LUGhEM1MrWkhvZFo1eVFCd1o1WHB3YkdWQWgzU0lr?=
 =?utf-8?B?bG5qUWVxNDhMeFJwblU5WE9XT1dhRG1rZnRVSWRNbXA1WVV5QitDc0d3elJW?=
 =?utf-8?B?MGdoZUVZOWxGSUQwU0FSd1dtNWZ4ZVRmUitNVXlVeDZ6cXpTOUxuNnEyLzJX?=
 =?utf-8?B?ODBPR2d2ZndLWTN0OEZkMGJ3U09pRmNybHNQSU9qdHl3QXNTU2d0VlN1Rmdj?=
 =?utf-8?B?aHo5T3lnMlduVXdZaWhyVGV1NlBSV0ZZemFwUHg5R2pnRXRZODFvMVNLSXhy?=
 =?utf-8?B?SG9RKzg5UXMzTzVRQy9QQW5XYmIxT09tUFVJb25YUFY5NDFhTWNOMFAxL1JT?=
 =?utf-8?B?cXg5ekU5NXBqQjllMWk1YVpidGVIb2VFRVlXOEp3TU95T3VxSjhwWXpoUVUx?=
 =?utf-8?B?QjYvOElRZFFPbDhxMGRjTzRpSTROaUJDZHRvc0RsbWpoUTJJMUF6Sm90bzdO?=
 =?utf-8?B?UjNLNnJzY2lZaVp6TUdmVEtURWZvd2xKV3dJQUN0MytOUTlNb2JaL2ltKzg2?=
 =?utf-8?B?dUtvU3o4eGIyb1Bic2ZVZWozWVNodERpdUVnVzdPMURFOC9jcXQ3MlFXL0hj?=
 =?utf-8?B?dHdCa2pKNEFZb0IzeklBWWRCaDlES0FMditBNVd4VW1LWWU1c1NnbEcxUjF4?=
 =?utf-8?B?T2ZKUGd4R0d6MkNJZ1VUQ1dSajYrOXpMYkgwUWxsNkhSNTVmM2Z2RDg2dUhI?=
 =?utf-8?B?UStpOVZZRU1WZ3dBUGlvQ0NDdGQxLzNHdjZLN3ZXcDVNQjI3TVZvSXMrY21M?=
 =?utf-8?B?UzFlL3NqbWdDMjlIaTQxaE1WVWdmSk1uS3FxL3hxZjlkU1hFU3hSOVFQT2Uz?=
 =?utf-8?Q?YJSU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlpvSk1TT2h6eGcwQXpzdkMxa2FWZ0U2Um5veUhaOGlONXZvZGV1bmViWHY4?=
 =?utf-8?B?a1BnMlk2TjV5NWFkNGFNNDhYLyt5bS9pTnl1SVh6dWlOZlM4QW9ORGg3Tk5l?=
 =?utf-8?B?NWZ0TXRnU3FIY2tNOXNZUGh6Z2UvZ1J0VHlyMHJ5R25paGc0UTJBM1A5NExk?=
 =?utf-8?B?VEE2d2pIeGFuOXcrWm8zbCtxZ0ZLd3dza3U5Z1lVTlRUZG1uTnpRT3BOVG0r?=
 =?utf-8?B?dU96NGY2UTBXc1NQNEdkNUFHOGNLYmZJZlk4UVBvYy8rQjVMVzlxenl2aUNI?=
 =?utf-8?B?b1FZeWJzSEpPM0JVQUhDUGYxYnZCNHZvNUlxNHFEUWVhdlJDWjRCUW9hdmlU?=
 =?utf-8?B?c0tIRUZxUkcyd3dyaGRYMEw1Um9yaS8rSlVFQlB2NVFZL1d5UStTMS9TTFpC?=
 =?utf-8?B?WHVHVmVORWxPSG1uZ0d2eEFBdzJyenlqN3RSeHM0cGdiNjNWM213ZktkSnZJ?=
 =?utf-8?B?dzg3cUNDeE8xeGZZRmNFKzRuUDNiQXgveDREMnBsUEd6Y0ZydEJ3UmpPNzA4?=
 =?utf-8?B?TVluT1FselZUNmtJd29nL1ZyMk42SlN3SGdKQ1UzeHVaaDZmTFJSb1ExUTdK?=
 =?utf-8?B?WHREWjRudEFxVXJibHg4R2lFRFNxTC9pVS82L0tNUHBDU05TOWZTdkQ1Q0Vh?=
 =?utf-8?B?ZEdqUlhXUzZrTjVHRXZkSU11K005S3NUbEduN3QzVFV5NEdLK1drVHVuemlU?=
 =?utf-8?B?Y0hDeWhUSGkwYmdDSXo5elAyNGZqYjUrQ1F1T0JJYXNMUWtQTjI4MUJKMTl3?=
 =?utf-8?B?YnRmTHd1TW1WdmoyL3JHRFdQekRqNzBvbXFqV2c3RG5CbytVVDBqaU5NdFJw?=
 =?utf-8?B?WE5RcGErN2Z0ZWZvaWFCM3J6bVA1YmxnRjk4VytPd3UrSiswaXRIZzNJUTFW?=
 =?utf-8?B?UVRGdk5EZTBoQllSS1dtNlZCZjdPclROWWc3N1d5Q20vY1VHNy9ham95UUVx?=
 =?utf-8?B?RnFzdVpLQ1BFZFhscE5PT1VFanNHU1k5RklZZjZDcjBMMTJRK2ZUaHJiL0pX?=
 =?utf-8?B?TlhNRUthQzd1OU1OYnR5M3QwVkVqSnNpMGs2RGEzdnA0MHhya2kwOWlWSVpk?=
 =?utf-8?B?dnBudWdDQm1oVTJ2YW5VUTlQWFZxRkFwclo3L1Z0VVJoWlBHSk5VUklUclRT?=
 =?utf-8?B?eThHaTJjMXVkMm1oZSszZGVHQ2w5ckhLNEhlZk5vUFo5UHhSdlZTN1lEQk92?=
 =?utf-8?B?QXJGSWoyMXhPWmRtZ0ZqZ095UzJMU1VYTmR5MUhrVERXZ05FU25Gb25LZWZI?=
 =?utf-8?B?Qk4yK0F0cTFJdmY3YWdsMm8zaWhGTXFaUjRhUVEvM0N3MGhZOGNjc3JaMTVC?=
 =?utf-8?B?SGlHOUVmdTdKUTBseDQ5dndxamN6RDJ1Z3hFNGpmaTZEUU5NZTg0dWg4d0ZP?=
 =?utf-8?B?VThnNTFXNTVTN29oVGNRQjdGZkZNWUp6bGtra3NXMkVzQ2NPR05QTDNnU2Ni?=
 =?utf-8?B?ZmJKTmN6LzRqc1QwMTBMZVpDMWRxVjlFWmFiVUJXQVlWTkZIN1pETEdxN0x6?=
 =?utf-8?B?N0RWcnk3bnpGbzMwazljUnJEdmtZUDNidlRWUnRsdloxajRSaFkwQXpJYXFW?=
 =?utf-8?B?OXU1SjBCVVRIZGM3YjExZUhzaHFnRlN5WDR1VHR5R0NmL1N3ZTVad1JITGlS?=
 =?utf-8?B?M2tGZGVuc1d3ZUtabEkxaE1RUkVyZmpNaFhqODVFeTJrYythdk9IZ1lIOWo3?=
 =?utf-8?B?ZTR6emRRMGRYUEhQNDM4YjdEWm9Xdm4vQlNld0dvMUg5RHYrSmRpczlMUjBq?=
 =?utf-8?B?bXd5NXdDcUFRaGJNQ05haGFDS3IybXo2M3RYWEt3WEl3dkRnVU5UeVplUFY3?=
 =?utf-8?B?UHdWOTRxak84aG9WVWFPY1JlWHh2a045ZU44eFlvRnUwVkZsNUY0TjhIWHA4?=
 =?utf-8?B?eGg0RFhJZ0VpZTRyNld1R3ZIQmltc1dJenFMNzY5NG1kV2JSL3VMeVlZWDZk?=
 =?utf-8?B?ZU1HeXEyZDNMK2NKUit6ZklpYTROWlRLaTZ6Uk1OYkxJZjI3ZnZza3lOc0kz?=
 =?utf-8?B?OTZlNi84UDBYYThLV3Y1VGRFNE14TTJCK20zSWZNWXd6M3A0aFk1OUFQc0dD?=
 =?utf-8?B?ZXBkZkp6L01IYlQ1dTVyRE02eDcrRjRVUVN5M2xYall0aDNxTEJFMURrWU5Q?=
 =?utf-8?B?RkhMNVVpZWtVYnJwWHRNVmJlc20vVml2Qm5CMitUQ0ZtVDF4bjNrTWpXWS9h?=
 =?utf-8?B?a3I0MitJZmdZbzNUMWRjUVdrU1B4dGZhNUJkTnRIUVoxbnpjT2lZYTVMN0VR?=
 =?utf-8?B?eTFnUEN5RDZqdmhjQ3EzaFVuRjlQLzcvRmk3RUZVbGVIdEdXcFRzSlprYTg4?=
 =?utf-8?B?VHB4UTA3STduK0xLSjYrVTdVSmpEYTY3aktRT1UrNXZNTWpFdXlnUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ncm9NsFHpRDSkGecXYhPSlQxwcGyoizHTQOiRXDsWxXXfd6leUgrolTSKDY4rDA5hL/5hObzJYDfTcXNL29q8YU5kXMPkrtO0qJ262YZyHwnXv9fPdMByxad2AagODtooR7JsNuGbaXvcczFR/kpRl+2Ps+ogss2Ugi9tlK4OzGliz62JT/+2iBrRSvek+6/yH6zQKcYcjHnAN5Su5UcvSAB2cPU3xd/6b3J/lnxae/c7LTe0+tGMLy5JWQAAgTrqCZ6t+DnC3CfJbNIlnv4TcvP9a1OzraNLF01lKakA0lAjdRYuVuDjFAIV1c/J6gyUeCH+ReNXRCLPDLWvOi3eO282xfTwNH6KyUFPtHJwnyB4KBp9Nu6UK+qusyy0FjQUtobLkrCf+NR6gkBu38T+/0ly8XBR+vERmnM2S2GqGI0P5UDtGgpgZqNwsx2AQzY5cYwoFxH93RgF3dcyo3pAVU7OLvgUPTQc7L+MXdwlhMv5kLPH+YFuw0qxpRbgnBMLmACQt7mJ5hojgCFyG9VD5/59D1xBMQMHQYfVvBXAznfynnX08OJZrrs1roT/jjOqmroLBuT4lz51XLx+kmpRSG7JMORIR5td+TJeMG0aOI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05996c35-a039-48b8-66a4-08de54e81892
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:14:55.6711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4tpEyigY0PnWntO/GayovzFw4Cc6uIGR7D02BFt0HqU4caR1Kf9j6oRcg0EVAYtLKxE3kmnN4n/OOkAoFqXj2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601160076
X-Proofpoint-GUID: ymwvKl5GHFFyNdaPyCq2uxJTlQmKzmV-
X-Proofpoint-ORIG-GUID: ymwvKl5GHFFyNdaPyCq2uxJTlQmKzmV-
X-Authority-Analysis: v=2.4 cv=ZtLg6t7G c=1 sm=1 tr=0 ts=696a0fa5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=f_XYxruaMxPjbrCmxkAA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12110
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3NiBTYWx0ZWRfX3DSAZyj4JtUC
 SwYc/Zif9U6fkawaX2e3jbe+TEeSSG9nwwDZjWs/JT8VVLM1NvtsaPKYYx3GgEk0C+zhb+uhIiT
 zxUXwQXHFD/YCl4s52OIJt57AibexR2gVyWmRlTaOyaOXXucTeQpCMI+uEtPsL5J734u6viO6yO
 oCVrUwWnPiU1b+c9jZzKMTi87fx/htHR4xfIz8IaPE9nsFc7CQKID3UdaUzEIQz01MUdLWT68u8
 SEhUOEcaYXSqO8aqpi85hQWC4wTf9X5cNbBXC0cjwHyQ06Vxdp+R7FLIbkBA56FnFXuJuozBXgE
 gZbk5S5V9LV55qSC0zLNLhXkf0R2ICnr+RqRQ6v3LimNmfJTrJvyzWO/rw6Ppu+zXUMYpbN3Zy1
 RzH+VhYIfAmUV6eZFmghn3H4CB36BaXJMv44yt61rr0wjiDwLLtuX8zMRyNZWatq2d4CWKsNSKc
 NTyp1MEuhHkB/FInCfvJVPO9mcr/cbhmQVlK/7nk=

On 15/01/2026 22:48, Kris Van Hees wrote:
> On Tue, Jan 13, 2026 at 04:51:24PM +0000, Alan Maguire wrote:
>> This will allow us to support paths in module descriptions.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  libdtrace/dt_lex.l | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
>> index fd70aa0a..a8268c44 100644
>> --- a/libdtrace/dt_lex.l
>> +++ b/libdtrace/dt_lex.l
>> @@ -48,7 +48,7 @@ static size_t dt_input(char *buf, size_t max_size);
>>  %s S0 S1 S2 S3 S4 S5 SIDENT
>>  
>>  RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
>> -RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
>> +RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`/?*\\\[\]!]*
> 
> This change makes it that / is allowed anywhere in a probe specification,
> except as first character.  That is a much wider change than what you propose
> this patch to provide.
> 
> It also does not accomplish what you want, because if a probe specification
> does not specify the provider name, a module name starting with / would be
> reported as a syntax error.
> 
> Instead of introducing a change here, would it suffice to have the specified
> library name be resolved by means of the /proc/$PID/maps file or something like
> that, i.e. look at what the absolute path is of the library that matches the
> provided module name?  That avoids needing to change the probe specification
> syntax while also avoiding the complexity of not knowing what the library
> search path is for the task being traced.
> 

I'm not sure how that would work to be honest. We sometimes want to trace
stapsdt probes before the library or binary is running, and then there's no pid
to work with. And if there's a pid to work with, it raises the question of
why we need systemwide probing at all. In practice the [LD_LIBRARY_]PATH
resolution approach works well, and provides a very flexible means of
tracing userspace, even if we want to avoid full path specification
in modules. So if you'd prefer, we can drop the absolute path support, but
I think the automatic path resolution needs to avoid using anything that
relies on having a process running since it needs to handle both running and
not currently running programs to be effective.

>>  RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
>>  RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
>>  RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
>> -- 
>> 2.43.5
>>

