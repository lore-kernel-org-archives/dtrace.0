Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0911A28D
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721361623; cv=fail; b=N/gQyjL1Bfg3UTs5H3M436hJ+1wCWF0krh89naE/scCWnN2Q4kRS26UtN15ToNOZmN93jAaYkYSkpbDpYT+jVR8O7hzWVkzYJSPefB6P1dAY1IjTDZfCEKBplI2JdnD9CKeA4GfSkcvP4eEjOe0oY2SUo8kKuI4hN1Mangg15jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721361623; c=relaxed/simple;
	bh=WE6usLPj1roxOM7f9SctuGS6XxSyPkCSMYAU36zMTbI=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YMjDYmd7JnCgkx9Cd3OwMDHtEmqGkPPSQegYL7dLnjq1hn83A7vD4Vi9w8aiz0swMRHfBp2ixRF36D4sXwcF0YwfS3Av4Q6ZF8i50ktf/ozIBvXyB/j1ez4D11REd5ixaPSBfaEmUtEjqtZZ7BL4qntf+gEhDI5BPAO/+YNieUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XV0mvq4/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dTZ+JohD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XV0mvq4/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dTZ+JohD"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J3t1Nf029247
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=6Qnf1El9GG2yx5Tc5AdVhhtSqYFnqgpS1AGjENtoFl4=; b=
	XV0mvq4/+yAZH/zDUEUTByFRIxeDU9Zn69Oau5EUU9howWNDuimLDtaR1hE36pHg
	GbBEGgKDhMYDDy+QM74VK0TUPf1QGZnWFmqdREXZnggddQ246c2sreeKXCeYqh1f
	63p//0o1bzUyV4tyVh8Xff+M6JK7jm0CLhsGRECXAProrG/an1LBPSgl/4VzdQeY
	/dTu21C661cZjqFMy8m3c9BCg+VeOfI+ukr2ZAziHvTCeVZkdP1u0nLdyMbF6duU
	Z+1+VQ1C+10eI36bx4lK2w5KQhV75/d5FSrx7XqcLNExT8TvtN70pgGsTAQrTIOM
	RE/7PZS8Ia+chiEGu8Rk7A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fgnm0040-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46J3m93j031570
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0mj3c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 04:00:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgbYAa7D9YocHebViMw2eVCOoN9xInhtuaHK3/IDLLiUmpgcWX0oZqzF2N3wmz841SUgNGUo6zOUjd+wfhZAfYK93hgLVgfcDoM3Uzu2/oxheTW60ZzbjlfBQBRRfZ596VZOBX6vIVuvimfDN0e5mwpmPjpgfss+Pw/tYn7PfXJiU8HsbmwvxyD1REYyoEqTOyE/XH7iqyQqSF1MYuLHrOCz7pE4Vs3GtSkJWwcEbdt3Prj6wlbm8L1g0H9fQIPLh1HMvwCMh7W6VY0DNoazm/uPu5s2FLbmKvg6if5Z55soy8fYCnUfxzjaskxwIXh9tuugxWtlvG1ZIObcXAJ8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qnf1El9GG2yx5Tc5AdVhhtSqYFnqgpS1AGjENtoFl4=;
 b=mNBCxaUrHYs1XCD8EwfyeLO9g/M1mFO23Hdgyq31vaRnI0JsS2UOu46auqMDH4pz6sVAH0ouUd7B2CsylKrzFc6SwbMb4kE8YdZNiPHuR3wINQFJGmcdD3+/cf6RX9jH4/j0ijIHk0WkbGpAIKR3N1o30lDYETfOehWKrEvVHZUEf+y7N7yQYT++7QluDg24lVKik/0weVxSP+xhsH71GMZ1D3wcP51Rm44e/I5zjxCvw9FbRKmANRS/TAp526xWBrn5GZ5RLlxo6m/oB5n7IBBMIN/OnmfH/6i+04eCQzhAmaJrTPHkuqLvk/0az8QOOMVV6T6Y8RyNkWPn6ZEfuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Qnf1El9GG2yx5Tc5AdVhhtSqYFnqgpS1AGjENtoFl4=;
 b=dTZ+JohD647fP/OSgaD5uPeWfh5DA4f2MPfMkxz1+/d1w3b1fq+uJy8zZtqjvgL5L0IjSEEWWQwklKlKOF0U1zxQ33mzRa8psWJEYfR+oyHOV8Qe/ODmbofw8KthwvDy9zF9uFsjPrPkkCF2QUYepWa8QffvfHX4+DbNZAQ6k7s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6158.namprd10.prod.outlook.com (2603:10b6:8:b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Fri, 19 Jul
 2024 04:00:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Fri, 19 Jul 2024
 04:00:16 +0000
Message-ID: <2fbbaae7-ce9e-af63-7dc1-c36c3103cd94@oracle.com>
Date: Fri, 19 Jul 2024 00:00:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 17/38] Add a provider-specific probe_add_clause handle
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-18-eugene.loh@oracle.com> <Zpl/0a633S9c4ibh@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zpl/0a633S9c4ibh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0026.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::39) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc4f558-f4d8-4932-ccfd-08dca7a74c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bzQ3QXlrZnJnek40U095SCtqUWg1SkhJQWp4cU1iUGJkUUk3c1pYeFUyMEtz?=
 =?utf-8?B?ZGRnS0cyWTdDalRtVE5WY0E1bC8ydEgyem9XUFBlUE5mbmRrWWhYUVJqLzRS?=
 =?utf-8?B?S1pmT1dhMmlDWXNLOENHWlRNWnVQZG5CMlRqc0xVOXVpSzNweFBiYXMvVThq?=
 =?utf-8?B?am5uK3cxdm1qREVYVFd0ZzM5OE5XU3huRVRDTUJnVFJqVUhZMXdoTWV5dENz?=
 =?utf-8?B?Sndkb0RlVGZSZVRjaTV6RUlvQ1Y4MHBGNzE0Slg4elluc3NYaUM4N3Y1dDA0?=
 =?utf-8?B?amtrdEwwWkpBK1V0dm54SUxsblMrM2hDS2NwRGhxcTdndVdhdEx3ZWNNdUpR?=
 =?utf-8?B?bWNlbUNtaXhtK25xZlJ2cDJuYnE0WnZxRHFsTGNNYWZpdEVMSXlSeXFLMmxk?=
 =?utf-8?B?Z1ZhSVpsQjZaay9PcksvSEc3SWFaR1FJL1VHYm9aSUQ0RnlUUEVmUlZ4a0NS?=
 =?utf-8?B?T1dHTllNQ1FocFFsOU9RM1lpVUhBemE4VG8ycXdwZEFVazdRSi8rczBITGEy?=
 =?utf-8?B?VE9RNmZUVUxYbDJROU1MRnRJZjdSR3lkZ0FhSTRyYjhBc0lqeGpzTU1rdGZh?=
 =?utf-8?B?aFhuUi9ZNGYyTzI1NG16RzhuN0ZPUWRWTlN4K3p5M3Fwbk1SUmswV3ZsY1pz?=
 =?utf-8?B?d0ZhOEU3dUthZ3RmbGZ2UFRPUEhrWkZFSEwzRmQxZHVUcXUvVFZLaktmclkx?=
 =?utf-8?B?RzVJdTBsYVI5U1R0dFRESzIrT21QbHpWSmErRG12a284ZjBmTTYxOXFhV0FP?=
 =?utf-8?B?ZExDUDJrbytnZmZxQW9US3hxLzZBeXdtb3RlSys0dCtyczc0NjllNHJEZzdJ?=
 =?utf-8?B?L0M4NWdRY1g0eis3dlBiN01OS0tsZzNTK0NTRUZnaElNaFhTL2N4R002dGFh?=
 =?utf-8?B?RTZucmd5dU05QWZSZFFnY1UxYnpYdXY5NnljRGZMU0V3M1gxTnMrZWJ0TjMx?=
 =?utf-8?B?VnIyQ09yNmM0RjF0RG5BN0JBWEZtTnVidGFrZGZ0aDgrc2FOcGdmQzQwKzV5?=
 =?utf-8?B?ZmZ1TnI0UmFLdlhyLzA1amZEOElQczBUU3FTd1hQZ3VNbVFFZTQwelZHMUxM?=
 =?utf-8?B?bUZCa1M4WkdpbS8zMzJOMG85OHNTaFp0V0hmUFBvMU1TNnFsMXQzQVVLVFE3?=
 =?utf-8?B?eXVEMUx4TmdQWHZMSzljMHRWY0tnVmFMSS9EU1BOZVRXSjlCWmxFTVk5QkZy?=
 =?utf-8?B?dzdHenBxaVdjaVhjZ2p1THZGOGxadXQ5TGFwZDZpTU9lWktFVzlmUEtZY1VI?=
 =?utf-8?B?SFRRNUFscE1oWDY1YlUycGkxZG1DS2ZCNmc1R0JhbThZVVlGdnhYWFdKMHVE?=
 =?utf-8?B?MW1saDVOY2F4VXg1RWlOTklzUkNvemRzcDBkMlVYZmgwaS9jMTBiUEJEMjVi?=
 =?utf-8?B?L3dkbzdOSENjRXNUaENnUENQamFTOXhvT00xM1FudlJUZzV3UlRxVGtpWmNE?=
 =?utf-8?B?TStFTUJRWm5tNUd3TDArUXZQSjZENXMzMlJwbWFrdS9aREdodndJbDZnL3JW?=
 =?utf-8?B?bmprMW5rKzRlOVZjUktlT1E3SS9Wa0xnSFhacWdpU2h6SDZna2JWd09ZTXIz?=
 =?utf-8?B?cGh0blVkQkh1R3U2MUtUZkJDTWJFakZrL21QcWZXRHB5WkFncjVTeWhZRys5?=
 =?utf-8?B?WEI0bmdPWFBjZGYwOWp1OUwrUUNaZWljY090OXpaMUlweXl4ZmI3aGFnKzd5?=
 =?utf-8?B?QW96ZEhYYnRzYm5Yby80a2ZZL2NXSjhBMjFVOVQzMHpwYlBpc0N2RmtxRUhO?=
 =?utf-8?B?cjh0bm52T3JOVTJMelViWkNHa0lKM2Q4MUdCMW1zSkxlN3lSOEQrQ1REck5Y?=
 =?utf-8?B?bHU4WHNJUU5zM1gyN0tidz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YmJIOXJ5ZnNRcjVzZ2lDSDBEdEQ5NENKbzYreHlrTVVWV1NOQmhvSDRBbi9a?=
 =?utf-8?B?cWtkNVFDV0hsSDQzUEEwTFMyalVtVW5vVEJ3cmZKYUo4dkJFMkNaNW1tTEV5?=
 =?utf-8?B?RDJ2cXFjSzR6LzdlZUlSYWJtTnN3a3JtbFo5d0Y0VVZaNXFKR1NiK1V1RGkv?=
 =?utf-8?B?MzBoYklyVms2cEt3cUJLekhud1JNenpqcDlNODd1L1ZIbUtwL2FyZjFuRktZ?=
 =?utf-8?B?MkNaY2dKRHE0cHI1UmFWc2FiTVloSU1ZNUpMMkUza2NSUE54VS91N1JzYTBS?=
 =?utf-8?B?V1lVbStKdy9pTHdLNm9UVnl1Y09xZnNxV01JQkZZZFJwN2pBYWxQUWE1VzFH?=
 =?utf-8?B?dk9EcVZxTGo2ZGJsM0t1VjA3M3ZmdlNqaFhKQ09IRWQ4TzNNNEJ5UU1FVHhY?=
 =?utf-8?B?dUFkM3dNNkxiS2FhaHVaZjY0WEJUcjdHemFRNG8yQkJTZEM3NnN4aFZKRUts?=
 =?utf-8?B?Z1JuZXN1OGhFYzdNZ0VkcU5kL3NIUXpBSm5SQ0JUaDNRRHpsWDlQL0h4RXF4?=
 =?utf-8?B?OWVUYy92MlFJTFlWQUVtdWwwYXRkZEN0S3FUcGFWcVV4V3lvQ2NlSnhRa3Zs?=
 =?utf-8?B?cGttQ1hvUGVhNm9YaU9Ca1kzNU00NWh0ZE1zL2FHVTNndzFNdWRYK1E4Ti9B?=
 =?utf-8?B?NGZIUE1LbnNsR0N1QTgzdFZRTHJBdTZwTm0yaXZhQm84Y2xTeTllVHBIM3V6?=
 =?utf-8?B?cERidS9uaDNzN08ybkZ0aUo0TTV1RzdHZk1sem5sejJOTGh3a2kxUko1MW8x?=
 =?utf-8?B?U1hVdVA4SGU2NGdyU2ZLY0ZFbEZPWjlQSnB1ZzBLTXNsVE50bzl5NVNoWDBz?=
 =?utf-8?B?S0lRdXlVUnBWUVRsRURKYUNEWjE1dVBIQjFVbHFWdHBubU5hbElvN29CS01U?=
 =?utf-8?B?a21EZGVQc2JCcGRUcVpMUWpkaDlJVGlqRVU2QVRGUm8xeEhvVFpZdHJBZHgx?=
 =?utf-8?B?RUdNM1lzY0RuQzd1cWp2d2gxTHJ1eEZVV29qNUZScmJyV0xoVERDak9HczlR?=
 =?utf-8?B?Tit1eUhnc2NNeERoWlVGSHB4alVMZGJ2SEFXcVJLMjlwcFU2ZjZJWHlpUTI4?=
 =?utf-8?B?UnBLUXFjTzlIcTh2cmJYUkh6QmdsUy92bzZyRVdLcC8vWjRCbWkreGtoTFh3?=
 =?utf-8?B?QndycHRzekZDa2laTEU3Z0phOThVNWNvczM2NVNpTUk0NVNOb2xueDhnRW5L?=
 =?utf-8?B?VmFJTVdqZ2dKYlpld0EvYUtnTm9DWjNNMkFZQlRuMUlDNEhNR3VhTnNhYzc1?=
 =?utf-8?B?ZjJZY0s1RDlseXd0MXpiS0d1cW9wVjdJcVMwaVBuUG5jMGF3ZmFWZW0xMVRv?=
 =?utf-8?B?ZVFiNkVsUUxkTGxKbFo4Ukh0TFp4SE14L1pLaHpuY1phTEJzcUNqaUJBZkho?=
 =?utf-8?B?K0hCMW0ydzZmOVdxRURmVHRZbGVoLzZIYTZxbGRvSDBIY3RGTDcyd3NVRDFl?=
 =?utf-8?B?cVdTamM5azBISVdaK3RwSkF0QVBWZVRVK1pUVFgvVnFaVHkyNnJ2SEp2TGty?=
 =?utf-8?B?c01MVjl4dFlqWjlXNlpwMEw5T2t6ZGpqS2RrOHFDVkp0UytPWmVaQ3JWM0kv?=
 =?utf-8?B?b0dEYlNaL3lZdUJSQTlYOXN4QjBrYzUwWTl0b0tHNW9NZTVGQW1abVdoaDdU?=
 =?utf-8?B?WHo3RlJRb1F6b3FBcG9SdXoxRFgvcXU5SjJyS1QxbmgwNmJCQi9HMTcvUStI?=
 =?utf-8?B?TExUdXRXMk84cjJ2b3VUemdXS28xY09nbjQwdTZpaGJvSXo2Y1l0QmZhNlg4?=
 =?utf-8?B?NjMwamJqVU5nRm4yS1RrYmkzNVJyL0FGVkN4OHJ4WEtOS28yZjZqenI2TGlv?=
 =?utf-8?B?RERISCtVREs5OWRINGVEY1R4eXJIUUZRRGEyM1AyRnNocVIzWTZQZzRnWktj?=
 =?utf-8?B?cW5MbmZGN2tnbGpaVG40M3RwNTRKSmVHeWdrV0JkeUdKK294NTBmUkpBUk50?=
 =?utf-8?B?VXNjMzhwQ3NzRTRVelhqWWVKLzBVKzFraGQ1YkgzWlhmWmVSdTQrU1hqMGJW?=
 =?utf-8?B?RDdETFgzNGVTdk9rUlJIZHNWL0RXbUhob2Z2SWVaaE1tUzdhTHF2UFh2K0J3?=
 =?utf-8?B?YW9LR3ZCeTZ3SFRvaHkxN1dqcnp2M1BPeFhybFdiY1lwVTJNVWExVjlyaXlz?=
 =?utf-8?Q?oJCNlLb6K/MtSlOqwo52Tbprk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	OZBXR5ZJiBDTeOVQWS5i1rMG8n58Y/ICdcAJpQlpMb+Jwl1zSKPO4cYG+ki1PCFX3OrE2tyJ3yMZwwDw4ssZPqYdxlAc8VjgAlRZ0aCZUkZIO+z759CN9CUkrtKU49/IDdsk+rRLdcYU7/gEdqfPIQhEK84CizEPgk4JlySTkSUClAs+0K3N2//JI0/edIWbmyVNeaLiGmxO3+3VOe7AmyzXlgLZ1Oi8qN27hfJjnYzlWDZLoxBplqtEqeLPudn05Dnke6hSAnYI3GvTUaJ5J3BH8iEPz5ctSaq+YIs7IYfqtnOdB+HAObNCFnDpRKXwEiDU55jPo16oiVhyivHzFRPLamdshtY4dzlrkS96w+tAn308RmY9o4leiSaIRCXl53KqWmZGGQJnKJBGg5+0qFMvifVDMPrLwa5z6yxPUkX/XLNCGAM7qLLQC7JUZaaMLrg2RnXYuB/LmqaYAHFOqkKCETDpHyuqkECE5qgFRxcvzVjHo2Kye0y+gSpPp6yK6/qf7PKbA69mZ07JdxuC4Ba6Ikuvh62EGn0PcCWgBruSQEy8NqVOpXD5bZ7FTSrVnkFw3cUMaCkuSJGrI9FTfYgO6M7gVuUBeiIqEdA1vb0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc4f558-f4d8-4932-ccfd-08dca7a74c33
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 04:00:16.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uDlLYwIGhAEHq3YS9W95jHL4h890FXtzbGvcoBLiM4GeVF7kzHq4OMDjvPSfJA+TVeoTCQViaDA4lyxZcLfHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_18,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407190029
X-Proofpoint-GUID: oINa-lQDy0OrXm-32MoG3SFTvWWEZLZG
X-Proofpoint-ORIG-GUID: oINa-lQDy0OrXm-32MoG3SFTvWWEZLZG

Patch withdrawn.  Its contents will be squashed into a new "v2 16/38" 
with a modified subject line.

On 7/18/24 16:49, Kris Van Hees wrote:
> See comments for 16/38
>
> On Thu, Jun 27, 2024 at 01:34:34AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_probe.c    | 2 ++
>>   libdtrace/dt_provider.h | 3 +++
>>   2 files changed, 5 insertions(+)
>>
>> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
>> index d0ae63d1..48b02e11 100644
>> --- a/libdtrace/dt_probe.c
>> +++ b/libdtrace/dt_probe.c
>> @@ -1354,6 +1354,8 @@ dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
>>   		pcp->clause = idp;
>>   
>>   	dt_list_append(&prp->clauses, pcp);
>> +	if (prp->prov->impl->probe_add_clause)
>> +		return prp->prov->impl->probe_add_clause(dtp, prp, idp);
>>   
>>   	return 0;
>>   }
>> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
>> index 17b1844c..b1b1b1b8 100644
>> --- a/libdtrace/dt_provider.h
>> +++ b/libdtrace/dt_provider.h
>> @@ -62,6 +62,9 @@ typedef struct dt_provimpl {
>>   	int (*probe_info)(dtrace_hdl_t *dtp,	/* get probe info */
>>   			  const struct dt_probe *prp,
>>   			  int *argcp, dt_argdesc_t **argvp);
>> +	int (*probe_add_clause)(dtrace_hdl_t *dtp, /* add clause to probe */
>> +				struct dt_probe *prp,
>> +				dt_ident_t *idp);
>>   	void (*detach)(dtrace_hdl_t *dtp,	/* probe cleanup */
>>   		       const struct dt_probe *prb);
>>   	void (*probe_destroy)(dtrace_hdl_t *dtp, /* free probe data */
>> -- 
>> 2.18.4
>>
