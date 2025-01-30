Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20D12C499
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738277593; cv=fail; b=Y1kJ9L+vjC9bmz3JbtkWIk2ButF30/p5slahPrYzFZM6v1ngM0w3qhT2cgttR+y4K8B5QpDH221kMHnPuFT8o3PDVzDQ8t+wQwN+nL7fdKiKzdwNnHVLS06+bEnAHdt/8KKDjngLx3mhblJj4tvWLAZMu2RHi9L/24DmLDu3YD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738277593; c=relaxed/simple;
	bh=mt8yoN5axJ0lb62QtimCIijxCXOD4Ah7CWNpGtBm+7M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O987ZtdCqW7B8hSRw11QcPJ9e2GKhlXNCb8Njun7lZobgUCm5zM7g/ZXDKtJ/FBAp+NTKpLHYT14pWIsxnu0YcuBABEJhQQj3MD3kiZIQZI4qODYzXucrQor2btVZ8bjnzPnT89sCyiavwgcoQiDrBdSqNJG4BmGkc6vBJLeawQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Md/XTWMd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N1YbRBFg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Md/XTWMd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N1YbRBFg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UMF59I020911
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Rvs5k3qPTJ7fgFkSCjDTclHfztZdg2YyuRqoZw+N2QM=; b=
	Md/XTWMdGRbL7np/SdUzKeejfNc8iWKe2Mi2AVIFi4jAP2U0aND3rKAwGh7yEYwn
	psnLFn9ATGhKh1CL1WE0+6KE2F2gACGfyRdgRSut1dNCOeO8DAs4fuobficCSr39
	XJ58TemW0yOHCBJjcPZWEfB5WyFfHTGP0DCu458YLERPz/rzszOuKAwdaSk2truM
	OZv9BzQG+e2Ij94UwobaHxjW9trNHAHWPpmfEr4s8EVeWvFKoD6f0bRvLqmOj+ZH
	LLEsupic25pG0/pTK+u5LtjhLMGbGdk4md8UEVj3hJnHf/DDe3CTrF13y/Kwm9Iu
	MBhsZnF3LVmdvlTP/Rp+Sg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44ghxar2a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:53:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UKsgYE016653
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:53:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44ggvjkvew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 22:53:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StIVcbSYiTIXrOnmF6eN29KshMuAWmQjSjGYhYi9V+WI6gvS3u9xXf3HYvsAi9wgv1tbq9RJpo3DPraKP9nVBABkHr/33173bE9gtMTmbs9ti4Ag/aWUZEmUUgiyEWGeWVdGWhu2ikuyEsEYXwQUjxNcnrYHx0CrX7J5q/CSUqlYP547FS5gr5jL0P4qWk8DRXbhOlCY/A1kO7wqHRi21dJD6YgKvaNuR0TikAbdk9PGCoRKg8l1xDDOepKedBSTGEw8mu5sN624FHN8vaiwH6crOVCSbUOqq3HUJvRJCWlCXfVfHyzFssPNCIXRlDdrdybWtMxPuV65Kr/ACPDaEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rvs5k3qPTJ7fgFkSCjDTclHfztZdg2YyuRqoZw+N2QM=;
 b=mYRSI4QhdJh9ylYVHa4RUBIU+z49yk2TAXLVTrDz6Z1kooOHq5ayY0D6hXFlvEN8zXMwWN4CnQwTdt1VA+GeWF/GmYCt1momgsF2ZCmWgbjmX3Cr5PZHF34TlvWKw3Uxn1vyWovd2tNyi78C/hzi8pNY04eLnf44pdqqa3l6dC/cbCRef0+E+UUdkebSSHNtUp2HzRVzVVot3MD1WeckjNulR4rHM7fZyBGro5E99gqlhxNJtZvwqzD+TectIBHEiYdk1apUv/TbcgAGJE7twM6Sak5+RyGSzbGN9l0Z4Nrz1Yxtyv37kFtMpJnBzlkyHWl7MANfPK9PzENJ5GTrJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rvs5k3qPTJ7fgFkSCjDTclHfztZdg2YyuRqoZw+N2QM=;
 b=N1YbRBFgj3nQz+hslnBod6SG7rYWqJA3woaCFAXb8sszPJFOt9vuO2S8WsCXvaKXoyUBObKMwYgB2cwY2+rct7JK4wmOWynYE08qOUqw+CIz/XzlobZiyt5TMBRRtBdBbYJ8Ftl+Jp6PFbrK/15x6iRGuFsjfVcPLHkJNpoHzG0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4681.namprd10.prod.outlook.com (2603:10b6:806:fb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 22:53:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8398.017; Thu, 30 Jan 2025
 22:53:05 +0000
Message-ID: <961b140b-e70e-4934-3b1c-b8d9ce799518@oracle.com>
Date: Thu, 30 Jan 2025 17:53:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/6] bpf: implement additional relocation types
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB633706565F4BEEEDA1D562F9C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB633706565F4BEEEDA1D562F9C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4681:EE_
X-MS-Office365-Filtering-Correlation-Id: af1c4acb-62a3-4ec6-b922-08dd4180db52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXhSaUdDY0toeWpTRlZRR1JNM0Jtc0dvNUZhbFowaG9laWxHaFVzaEpNZDFl?=
 =?utf-8?B?N2huQW5MVTM2WDYrR2VyeEt2ZWhuUE4vN2xoeHVXZ1RhYmN0bmh4cjNYOHhI?=
 =?utf-8?B?azkyZnBtU2VRem94RXZhNUxaRXRld2VINGszTkdXQWVyWkh5MG1VTnp0bzFY?=
 =?utf-8?B?Rm0xQU8xUzBKOVdHcDRJT2VYa0hTUkE0c2ZIMUlSQ3JOTlFiR3dkenJITXJ0?=
 =?utf-8?B?bEZQNDN2RFZHWE5jYmFFY28zUVkzeWNFLzhnNmZ6TXNadmVpNlVCQ1h0V3NP?=
 =?utf-8?B?OVRwSHJZd3A1WVFaVFRhcFo2K0lFSWh4K0JZL29ZdFpIbWJjemlOUjlBNkJE?=
 =?utf-8?B?YWtkYndlRXJaNlhMeGFRL2kxbXdPcEsrdytra0pBM25ncmtESk1ldHZNRTM4?=
 =?utf-8?B?NjFXdC8rd1ZtRFFJbWxPakF0b1ByQXoyNG9oc1pLT0hWRzhvSGsySEs1WnEz?=
 =?utf-8?B?RHVaRHlUZzZpMVA2YTc1M0IvMWNCZ0NpZ2VZOWJBRkE2eDg1RmlRQnhFTVF6?=
 =?utf-8?B?ell2QUk1V1d0NjNwY2haS1Q0eWZucjNLeW5RcDM4eHE5c0VZQXV5eXZ0MzMr?=
 =?utf-8?B?WGRncUJRMFdLTkZYMk9tMzVhTlE2dW5RQnROMkx6bitxNlVvSTVKeFVPakY0?=
 =?utf-8?B?YVVvQkhKYWlBRXZUMzdNMWFOTnZEa3lkblhzOFViTzJGNkhTbzhhWXJiVy9R?=
 =?utf-8?B?aUhZVjNKVWF0K0tQc002WkN5WGRRS0UvT055VEdvMS9acWFjbitpeVhxTjhK?=
 =?utf-8?B?djZLMkVYM1BZNTlSREJwMDhIb0d3RWFFb2ljUnhsS2h2VnhjSGJLNlRvMlR6?=
 =?utf-8?B?QVJKMzJlUHN4S3g4VTZJUjhqdndRakM1VXh0bU41bzBFYTFQU0czaGh5Yzdw?=
 =?utf-8?B?YkZaMEwwZW9pKzcvNXdTR3VHR1JwejAvZzlpTDlTaUt3OGsrbTIvSzlTUWpX?=
 =?utf-8?B?OTIvVE96d3NNY3lXc3B6dDBxRTJpQ1VhV0pIOG0zMjd5QTYwTVNhQmxibk5i?=
 =?utf-8?B?eVhpR214RURMZVdYdEtUdGt1UWZZYVo3b3NERDR3K0xmY1g0N1RJRDcwR1lv?=
 =?utf-8?B?cGVER0pqWlVxSkJkN0g5Q2VwL0w3c3RGV2Y2VFkwUlo4dlZ3V1FqS1hwTDdO?=
 =?utf-8?B?dytDRkZPemNlTDFjaHRoOHEwWlIrRjl1U2xobDdzNXdOY2s5SlN4MmVDQjUz?=
 =?utf-8?B?TCtEaHpDNWxZam8zRUNqc1JwYzVpSWVKRHYvamxlZHpEQStBazBnKzhwcmRn?=
 =?utf-8?B?eFNzWW5tUDlwRGVaK2VseG55ZjNCOFhidXR6c3V1eEMycVhibkF4YnZDbXJD?=
 =?utf-8?B?dEJaYWl4RFpFOWNMOVdqQXpXcXFWQWhra3JNQi85WHFNSVJsczFXYnhqaUhH?=
 =?utf-8?B?cXNVbHdaSkJycS9RNnNqbHppdlZxd1JXL0l4MjU4Q3ZFTHlhZlBGWmR1OE5L?=
 =?utf-8?B?Zmp5V0RYNVRwMEN4UWdNR3RKa0JOY1pZVkhQVVB2RStzaVBDVnFpTzFWZUsw?=
 =?utf-8?B?LzFJL1pzWHhDRnhtWEpQL2UxOFQ4Y3NnQWFjMmFZaDVsTVpTaUVsQjI1UTVC?=
 =?utf-8?B?TDREaXNHOE0xWDd3Qzl6NExDQlkrSHFQNTRWTXRNelBGaWw3SHkreDROMlI3?=
 =?utf-8?B?VTZObGVRTTZId1FLNXhIVEdBWlMwMEpvZWYxMnlUei9lQ3lsejJkbk1wSC9K?=
 =?utf-8?B?L3ZuV2tQM0dKaFVrODNRSEdJZmpIMDVNaHZqK0lqUU1zalFxdEVlUG1CM2J1?=
 =?utf-8?B?ZUlKb3F5L2V3L0JURkdCL3VWSlNEaTdnMmpJNW9MMGJDemVTSVJaUWFpUS8r?=
 =?utf-8?B?M2I2TjM1YVdoY0RtWklhQmNreENzS09RMmVuQjFESlY3VGZVL3NrSlo1V05P?=
 =?utf-8?Q?vrQI0xETghVX0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y05qYVd3MThaUm81WUZZdlJISkZ2WUVLczQ1YlkvY3ZLYmhHczlUR2NEQ3NV?=
 =?utf-8?B?LzR3SWVTTEhSenRmMVp3QnFEUmtTdCtlL2FzT2pVdWkxSU85M2UwaHRsdWlM?=
 =?utf-8?B?Nm1ZWUpMdWRUNkFqOW5QWmQ3a3RTOEhQWWNoeTh2M0xIQlI2bUU3c0J6Z2Js?=
 =?utf-8?B?eVV3NWFqY010dXpjaVgyemtBZEpqeXJRNmcyeWtWQWd3ckNockI4Q3cwRW9j?=
 =?utf-8?B?ZVliUmI0aXhFT1BHclkrU242bS9UT0JIclJ1WmFKdTUyc3YySExML0JVZUho?=
 =?utf-8?B?dXduZTJXaXV3cmw5Ykw1NG9nMmgzMDVKVlExNFE1UUh0TEpwa216R3E5QU5T?=
 =?utf-8?B?V21WT1IxeUJKbG1VVkdaR3pwQmhsVEQ3TUFzU1AwKzlyRi9RRDM0WHpCemtQ?=
 =?utf-8?B?QUF4bTNJNmttcDYrSG9nUzBFYVRLYlovQkZnZThOZC9IQkZXZ2F5VHZCNjdR?=
 =?utf-8?B?eS9reTk4MVBxQ3RVbmY2YjNGSmFtWThyY0tmTW5tUE56RU5IekVJWG9ibGpF?=
 =?utf-8?B?NWZxZzFtak5UbkQ4RTJ1UU5FcE1WMG0vc0RoNTB4dVNiYnV4VDNUTGxMY1Ax?=
 =?utf-8?B?Y2JadWZQc2NHMG9HUXhFSDFuVGpLOEduMzhtZGorbHpYdDVnbkhUbGhNNE94?=
 =?utf-8?B?WUxPaTNWenRQcDFEeHR1L1FCRkFBWTE3MGxtandNQS9HTWNKOHlQZW9qdDJD?=
 =?utf-8?B?ZkduRWxYZHIwTy9vcDhoTUlrOGtuWCtYQ3NJalR0cXJGTHJ1MG9vcEpya1o0?=
 =?utf-8?B?WGJyeXBiS3F6UDhqVWN4WjVneUFnWjRRMTBtMTB1cWdmRTdNbVJaRjBQbldB?=
 =?utf-8?B?VWx3dENOQ3lpYllvdHkwY0dUYVZjUlM1cDVzY0xWVC82OG8zaHVLdDR6SmJt?=
 =?utf-8?B?Yk5oRDU5TXVTV2t0R012T2t6OVB6MnhzNWIyVzNyTUEvK3NSN2VTWFF0eWJB?=
 =?utf-8?B?WlVEakRxeGduQ2YzU1NIR3pMK0xwZll1VzkvZVc3YzcyaFZlTFZ1Z21tRFR5?=
 =?utf-8?B?MVNJNjR6QnlZQmMrai9PQkhuNzgrVzEyZXFqd01pVzYvbG5KcmNzblQ1V1lU?=
 =?utf-8?B?d2RZbzZzcjM2SjVoZ2kxbWpEOVJOL0dsTXp0ZERndnRWSXhxMk9BM1V0dmNF?=
 =?utf-8?B?R3VCYzNwV0EwcEpuZi9UVmhRV21tMW9Ed1BUa3Aza3hESis0Q2JXa3N6VXlm?=
 =?utf-8?B?STczQ3dYK3Y3WUp3SEVGSFJEbENSUGFtWTF3am5VeG1EN1A4eWVwem0vTU5h?=
 =?utf-8?B?WHdKNGMrZ29DU0FYZ0FYU2psRmVaWUJsTXYyV081QTdXakFPNDV3R1RDdHYy?=
 =?utf-8?B?M3VGdEZEenJGWlkvRU54aEpvUzNzWncyRXZsNlZkYWlLMEFkVURkWEhRY0Y3?=
 =?utf-8?B?YU10bXdvamlwNWVEaERZc0k4S1lFSlEvU1R4UVpvME9UZ3NwWlNOSDYvNW5E?=
 =?utf-8?B?S050bjZaTlpNckh2VVFTNUs1TlhBbitRSWVmenl5bUprUzRtdVJ1NjFkU2kx?=
 =?utf-8?B?eUk5Wm8zWlNET3JjWnJLUXBCSFlTK0JpK0g2ZzlmOUJVTzRxT1pVd1RicWtY?=
 =?utf-8?B?dUxXcSt1dHUyYS95eFJjdUE2RXNCNkhVdjgrV0w1REViMHFmdU9tV2xhcm4v?=
 =?utf-8?B?dVl5Q2dyd1dlTmFKQ2FQNWNPc0Q4R3dRLzIwR0dQMmxBYjE4VDR1WEg1V1Vx?=
 =?utf-8?B?MW92cC9HVXRpbk1BaVRxWjNCUzZ3OE1zK2FaWE5nc0JKWXRTNEdUdGtrbTZx?=
 =?utf-8?B?WEpCdklFNG5jZGhrODdPeGFrR2ZMQkp0ZVdhRjJ3VTg0VlllQUpzMnQvMHlC?=
 =?utf-8?B?ZXVOUXpvR3U0UlhZUkFxdFlhRU1RcWp3bEdhc2dtWTVIZEZ1bFNpN1lNbERE?=
 =?utf-8?B?NHBTczd5eS8xbTd0NnlqZTZ5SUVPTE4vV3ptbGFXSGlZUnhNTHB6YWFCdnZN?=
 =?utf-8?B?WEhTdEVSNm0xT3RhUktaQUc5Sno0b0Y5SDE2S0VuRWxQR1BKVWpmODQ5UWZj?=
 =?utf-8?B?SWtPQWwrYjhvTDg0QitSdFk2Zkw3UUwyL1JXTEtYdW5iRUlMU1ErdWZyeFIz?=
 =?utf-8?B?MnRKekpZK2RQMGtvWi9uU2l1TWhRaEpFV0VMRStaVXdoRXEwSXI1dTloZzEx?=
 =?utf-8?Q?wovCY1mAea7BAI9UBavSpwDQj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	viiPnIbM5k2RCv3OOJoRYKXS8wl6oHZEnIKLWzeXvfl+RsRDKQ4gFtj+NlgkBDY7yomErHiOLkfxiYH1s2zQvv2c4EXpxwKs5M9Avnry1iggRNmugxMqbmwx0V3t2IpKyy/Scj3jMhW2qMcbnbpZvnvMZ21kBUIeqEIA1/AHtmlCe0thcsokDOLI8gbN06s6Ht2obMvmEgfDwTR27z5SGI49dlBvPiLtI1TYDZGQJqhmkm0V0YQsC9+1PiRPN5Q9p7m0JfBQTsLyFE8ncSSeSgtbAopHEKGdKC4jxZm8OkFLtgsAU7w9IjHwSE90KzUE9z9MVWHNUscMK8q+dfyFHbQ+lsttSpGKWGEkQkKI/ysrc3wZQe7H5LjmwnPp8Vi/90/RNyPImXAOEmOPy9G+Gmw+JC9hBF4XNUB0J/vt2cMJt/aK0RhGJOV5pVO38B1G6TVp59kw9jTGGwFqGHV8PV98U9S36OsglJkxduRK6MQm5kQ1FhhIkgw7B67U5x31mexnpMklmW3mGN5Tp0j73OV6rfiaakgLOgtVoagWVlIWspEMytjJN7R6FBff2UDCG9Q4j4pY++WLWX0CcnIHdCtM6u0GosRR9/fnfNI3aeg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1c4acb-62a3-4ec6-b922-08dd4180db52
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 22:53:04.9624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ez/Ee12my8URacPVHyT/Cf9SIHXWWQJ3iXl5TzS/2jHMY+HQFnjmxn7+hpapeLW+J98jiCokc/Vn5ZAS6ySAHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4681
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501300177
X-Proofpoint-ORIG-GUID: OMM22jOBMIwZL-Z9qZR2SeBU6ob3pBhv
X-Proofpoint-GUID: OMM22jOBMIwZL-Z9qZR2SeBU6ob3pBhv

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
and an explanation in the commit msg what motivates this patch?

On 1/28/25 01:31, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/port.h     | 6 ++++++
>   libdtrace/dt_as.c  | 2 +-
>   libdtrace/dt_cc.c  | 3 ++-
>   libdtrace/dt_dis.c | 9 ++++++++-
>   4 files changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/include/port.h b/include/port.h
> index 6ce8611e..0aadacb8 100644
> --- a/include/port.h
> +++ b/include/port.h
> @@ -88,6 +88,12 @@ pid_t gettid(void);
>   #ifndef R_BPF_64_64
>   #define R_BPF_64_64		1
>   #endif
> +#ifndef R_BPF_64_ABS64
> +#define R_BPF_64_ABS64		2
> +#endif
> +#ifndef R_BPF_64_ABS32
> +#define R_BPF_64_ABS32		3
> +#endif
>   #ifndef R_BPF_64_32
>   #define R_BPF_64_32		10
>   #endif
> diff --git a/libdtrace/dt_as.c b/libdtrace/dt_as.c
> index a634b855..d3126f9a 100644
> --- a/libdtrace/dt_as.c
> +++ b/libdtrace/dt_as.c
> @@ -492,7 +492,7 @@ fail:
>   			case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
>   			case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
>   			case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
> -				rp->dofr_type = R_BPF_64_32;
> +				rp->dofr_type = R_BPF_64_ABS32;
>   				break;
>   			case BPF_LD | BPF_IMM | BPF_DW:		/* lddw */
>   				rp->dofr_type = R_BPF_64_64;
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index eebd923c..29cfbd84 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -1266,7 +1266,8 @@ dt_link_resolve(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
>   		if (rp->dofr_type == R_BPF_64_64) {
>   			buf[ioff].imm = val & 0xffffffff;
>   			buf[ioff + 1].imm = val >> 32;
> -		} else if (rp->dofr_type == R_BPF_64_32)
> +		} else if (rp->dofr_type == R_BPF_64_32 ||
> +			   rp->dofr_type == R_BPF_64_ABS32)
>   			buf[ioff].imm = (uint32_t)val;
>   	}
>   }
> diff --git a/libdtrace/dt_dis.c b/libdtrace/dt_dis.c
> index d983c099..b2e66754 100644
> --- a/libdtrace/dt_dis.c
> +++ b/libdtrace/dt_dis.c
> @@ -639,6 +639,12 @@ dt_dis_rtab(const char *rtag, const dtrace_difo_t *dp, FILE *fp,
>   		case R_BPF_64_32:
>   			tstr = "R_BPF_INSN_DISP32";
>   			break;
> +		case R_BPF_64_ABS64:
> +			tstr = "R_BPF_DATA_64";
> +			break;
> +		case R_BPF_64_ABS32:
> +			tstr = "R_BPF_DATA_32";
> +			break;
>   		default:
>   			tstr = "R_???";
>   		}
> @@ -853,7 +859,8 @@ dt_dis_difo(const dtrace_difo_t *dp, FILE *fp, const dt_ident_t *idp,
>   		for (; cnt; cnt--, rp++) {
>   			if (rp->dofr_offset < i * sizeof(uint64_t))
>   				continue;
> -			if (rp->dofr_offset == i * sizeof(uint64_t))
> +			if (rp->dofr_offset >= i * sizeof(uint64_t) &&
> +			    rp->dofr_offset < (i + 1) * sizeof(uint64_t))
>   				rname = dt_difo_getstr(dp, rp->dofr_name);
>   
>   			break;
