Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3541C63
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763511332; cv=fail; b=hy8FmOZRRUGKmAmuFAtZthPjgB8w0z9j/N2w7eyohs3cvPam8+uVVNBFurC4w3QMKTCai6Lk03JImlTLa1jkUThQ99HRGAqWiWuuBKedlxoFuAzh30e/IgPNyow31l77N8WwvRszs98kyW8fK/eics8MLvILUDMYTkjjnz8G+U0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763511332; c=relaxed/simple;
	bh=2dI9tDP/6sfQgOz9OAGxFUMk3L/B29ULvxcT5tQgmHc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tJZVVqUeiyjfkoIGbn3OlxgoISYvXdO4xQbg5Ef0rwr1ldLff9AHgzF86J0f/Kwu5oXiglDo36YUnvY6s396vH37IT5pPthCURVsJTq1vdE9F7O5hmxmSngVg77uwAoBmj4dOLObFCBf4/VZnQ3pxdOFEVmStMnsTrvCEKDrcgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ODzUt39H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vLW1DcoJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ODzUt39H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vLW1DcoJ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AILNIDP025376
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=zgKRugmrqurP4cje2KQisMdcZ7Q6IGVQh8MpQRYUu40=; b=
	ODzUt39HKpFwOWeID9MEq2YQ1WRRqwIct3jLJXMsZIo8BawZhxeZ/HFILplaJUdz
	q2L7AORNtIstYQizzO4lpVC4td4Vp2TsjYDfT2NtSojIU27PQG5LUX9szPPP0kYT
	pgRr00wZw3TYoSGpVNX479U9f497bld0ttmeMoc5668PDuXj9j7g3qOfJ8tVytvF
	Lds7yuSeVN+8mdFJyptNC82y9O88+YmXhT5lwQ+TexY5rFTQMCM1c7HS+0VTjWIC
	Bn/MOpxmJYlcg5U4fGbxE/ju/kmx/Uvy0sPe2CDceBUJnBVBMHo0Ry0YFdqOJvVD
	Tu6IiP1Bb68rpiDDSRKeOA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbpx3gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:15:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ00AB6007971
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:15:29 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy9vdqy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 00:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGMjElF2XRE7qZv9cbwT22euwuHXScxU+g1AdoXFgeC+4cqh/8VRNqdUurtGsEG9JNMN0fNoY1ve1YKmgA5Tl+1GDPpYa6p6YMftV12CdiM/Ix9FfUCS94kGNh9FQqCjFk4+nNEGtYPExg3bGB+4mAWHje1OCd07jLfDQb06sspi/E7tocYj5Xc8zUs0Hfh2hovBVKkJWzosgxZOo0qdD/dtBSq+Fg48fTH2aByD6+RKJlUz+tlK0vuxzxrLGlzTUTzfkDm24isk57zfQTZsvQ63sc65+aad9DXhWwH2Y+Pn5/gdOPV5Ba9JdRvOsdROnG/+NeHEmrop1TDL/ogA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgKRugmrqurP4cje2KQisMdcZ7Q6IGVQh8MpQRYUu40=;
 b=onHSg3VvkAylNYBgcosPbazXBWW92PjF9M2ae5XD9U96vzW6MyUt4OejfEmJpHbwdpvYw0RIRFQMerLnFNFW/QrFn7gwACKPnrD7LEu/J38W4IAooY6TphcZr1b/+SgoI1MMiXtM+MIsotRTdGd1nuvM7PK1mDCyju+Z4UaaCBGfhAIdRGx/4QbQdB+kIxj/1VId7/FOOCwy2UcPnqi8G5Eem2SRbUU5Yi6SSJ2L7s1f9DP6L8Tm24ukueE8MI6COnoP5N+gTAe9w/u3diL5f45i9DaMm/c7FYqe/dCXkU+FnOdAFF4/lrftpKs9RIW/psMsufxMyqOf+SYiZFbzQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgKRugmrqurP4cje2KQisMdcZ7Q6IGVQh8MpQRYUu40=;
 b=vLW1DcoJdleWGEP3jc3NoYP/gOaYgBfY2B3RbmQ9AMlTveqKhlTLFMsSpC8L3S+yvV74O4unsNYJZjoJmwjeCe2H92R4fTxWOm1aEoVGezFfVCKqFk2JwpKg6vplsaVPJ0aJ2tyf06Bz9/3UnQO5NFBC+P1QUixVofiN1gG+nVg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5885.namprd10.prod.outlook.com (2603:10b6:806:234::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 00:15:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 00:15:21 +0000
Message-ID: <be44a5bf-aaca-b98c-731b-9945ea837702@oracle.com>
Date: Tue, 18 Nov 2025 19:15:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] doc: Add stapsdt provider documentation
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20251118043036.16867-1-eugene.loh@oracle.com>
 <ecf085d1-1ef7-4edc-8bcc-a98d3c583233@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ecf085d1-1ef7-4edc-8bcc-a98d3c583233@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: ce0c692c-2e38-4150-1110-08de2700b8ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFRTZmtsaytPa2g3NHdWV2tnNzM3RFI2OTIyNzRQRys5Vk85UjRGS2JIQ3g2?=
 =?utf-8?B?L0xpcjAvclRyTU1kZ2Q0RVZpbVk0ZmY4cUxna3NNYzNiTS9MNUwzU0NLZVZI?=
 =?utf-8?B?ZUFiOW9jTGpzb0h1bndseU9YaFF5KzZveFVBSG9KYzFMSGhvVTE3cUd4VkxZ?=
 =?utf-8?B?aDlnbUZ5MFowc0szTkx2ZkRJQ2Y2VUpsOFJVK1lZVG5vaXU1UzFDODJHNzkz?=
 =?utf-8?B?dTVkbFhXRlQ4L0ZzRTg4UWNadU1qZmJNdGI1ZWxCL3NtWUVSdWVkTFM1bW9j?=
 =?utf-8?B?MmVLdDhQS1YxTEFNNEM3TlNLd3ZzMnNjWHRRY1laelNTSDNrRmE2cWZuRFcw?=
 =?utf-8?B?VEF3NzYxajRqbk5SOFZMZ3VBV3hyWFZVMm5LYWFwYVFEcWVXbnpSR2pvMTZ0?=
 =?utf-8?B?d3gxVjdnUE1JQTBpRk5YU0tJTjl0M2JuRmxjSTkzQ1pTdjVGYmF4N2FqRXZY?=
 =?utf-8?B?WU40S01RTWQ0b25oQ3RIY2x1eUkzSmVDS1h4bkZZNjU1UFZTei9JSWNucEdp?=
 =?utf-8?B?MzhGQW1QVUtQWDVYUVFHdk1Dd0RIaTQ5d2xYZG9zVXRhUUJ0anVmdlI0SUxL?=
 =?utf-8?B?WitIbjMySnowSm83bk1pZXJsVVhHSUgvaHd5Vmlodm1EaEZNY0s1UXEwQlpx?=
 =?utf-8?B?dUI1eGVwbG4vUE5WV3BpK29mZTZrZmFGT0sxYlB3MlBCam82WERWUGduTnRm?=
 =?utf-8?B?aERXZXNsNS9QNWJjd3lOdHh2V2U0M3ZVN3VBT2U3bk5YVnkrcmxobzZSVjlw?=
 =?utf-8?B?WG1GQ1JXUy94U3pRT3g0QUtmcWFZUWs0YTA5RWtFcXVTMUsyTU9kd1hsQXhE?=
 =?utf-8?B?SlNPcEUrYlAvaURwSjV6U1d5M3ZEMWxsQjh2cW5tNlpKQ2FlQmxpV0dza0pX?=
 =?utf-8?B?ZUFRMml2NXYzV1hQdnZUVDIzYkFhdWhZWExFOElVYWphTTB6dmlBNHo1c2Q4?=
 =?utf-8?B?YlZ6WStFWEh6Wnc0UFgzZEhoY1lwU0JyNk5DTThIWWVyRDU0MXAxWC8rUnpq?=
 =?utf-8?B?cnEzS0tKSlkvQ29GRjhhRGxZa2RUTFRKUWxQdkZONUhKcWhacVBKREN0ZFdP?=
 =?utf-8?B?WEd2eHNLZS9LV3FhcHMrOUxCTk9OUXhKMWpIV2RuQit1OGVRUDdWNmxmVlJn?=
 =?utf-8?B?NWcvNnQ4d2o0cG5jTWlUR21JK1V1eVBoeU11ZXhFSjA4emZEY2E2blZPYUtS?=
 =?utf-8?B?Q0pnbzBCV2FxQXFmdmhTM3IwZzhPUk9Zem44UW54Vkk0UTZicy9rUWRMSjZx?=
 =?utf-8?B?WmU2VHMxWUx4SlQ4bnVUSDlPSUNUM1pyRWxDMU5xR1IrWDFxUkRITm1MNk5p?=
 =?utf-8?B?ZURzNnpEK0Q5OUM3ZDluZ25BaEdSWUplRkxzWTZpK3RSQnBYYmpRa0pIdEhz?=
 =?utf-8?B?azFxL3RFUkJVUFdiWXJZTjlCWmJ0QzVLR0x5R2xSNHU5b3VIUHV6aldISWJU?=
 =?utf-8?B?cjBhdzByc1FUSHRvT0ZpQ0pvMjlkUndRMUw1NkwrN0phclBzR1VtYjcvdWdZ?=
 =?utf-8?B?WWRGbkxyc0lsUWN1OWdtbStuWHdncVVRRlgyUnBEQUNTcWZaMy9Lc2gwb3Bj?=
 =?utf-8?B?enBPQ1NzM2dGZGZZdGpld1ZVU290Z1BlTUJTUzJKSFRHV0h3WmJKdjRJNk9I?=
 =?utf-8?B?YnoyTFpsbFBpUzRMS3h3cDM3WkZHcnU1MzRHeW5RS0FweXo5UmExNVozbUtr?=
 =?utf-8?B?MjZreVY0akxlNHBDSnRQK1NCTi9aZE1SdXQvUGJHMnZZdnJBeGJSbC91Vlkv?=
 =?utf-8?B?N1FYRzJKRXFtcUNWcVYyc3RCa25ZVi92Rm9MZ1VPR1ZuajNIakZ3YzBUamgr?=
 =?utf-8?B?L3gycVZpNTZhZHVpMVAyUFNvcTRrOHBwcGJjTWlKK2RNdUhXazBFaW5LVlNE?=
 =?utf-8?B?dHVMa3o5VlYyUGpDY21lYnZzQjFqVXVyNndRem5ZekY1dW9aM0g3TzVGYzF2?=
 =?utf-8?Q?F11T/n3vNqyQuQebjji7MFgtSojzKOKC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGtOb2gzNFdzQlAwTGNyNjZPQ0g5VFl4WVV2ZVRGZGZ5KyswdHJWa3l6dG1t?=
 =?utf-8?B?c05pSC9BYnZJOWgzN3M1RkxQQ2t2Z0FJV3IrWHJlblVEZStxeHZLOTYySng2?=
 =?utf-8?B?RFdySEkybGM0a1M5N0ozTnVDQktjU29MdFljT1h4MmZTTDdLNlpMZkx0VUJi?=
 =?utf-8?B?Yk1vaFdIaGI0RHJoL2ZaUUNqZlNDbGRKY25oUUlmZVJkK3dRUHpRYnV3WlA5?=
 =?utf-8?B?Y210VnJNS3J0My93eUF5dGpDYlNPQ0xYYkJOOHUxZzM5RzZVK1lEY0dlQUVt?=
 =?utf-8?B?SzRvNnBFaG5oekRLM0RrbFEvN2JtY3VMTGk5RVpyZ096MkpVQVBIY3RSTFZr?=
 =?utf-8?B?ZFRUd1l3bUZrdG14MUlNTmg1Y0hyTHZIczN3WjQvMldES1dlZ3Q4TERua2lq?=
 =?utf-8?B?a3A2SWNlb3Ard1F6K0V4ZEdUTjRYREVjK0pWN2E5ODduTzNRQlczQ0crMXdq?=
 =?utf-8?B?VXVQLzB5QWR5UFpGSGE0QzNEc2xZSVRnSC9pOXZHQVRobUNkWUtielI4VzVE?=
 =?utf-8?B?NWJYa2cxdTZGUEhQbnNsbjJNVDRJU3NTUksxdklBUEtWMXB5Ky9HeTRTZXBs?=
 =?utf-8?B?U0VqWWZqRFY2ak5mT0FWcEorVkovL2lzRUtpNFM4bnVxam02TnNLMFBCcDRo?=
 =?utf-8?B?YnNkdlNheFMxUmV4NnF0cEgxM3lzSmlHTVJmQ3c5aHZrWnk5cnhGZXdaYTR1?=
 =?utf-8?B?OWRmT0pXUVNjb1JHZTMxTVNUUFlRZkt4UFVGL0J6OWdxV2hMd2lWVzZvdWJH?=
 =?utf-8?B?OS9xSnRmS3o1SkIrRG1XNmY3U3ZIbzV4bFJKMlpCRG1oU09aMFRXZGlobit2?=
 =?utf-8?B?dHJFZEdxM0ZRYUh1YXNKZE85ZllVTEFrT2c5NCtxQ2dYakF5N1ZJS0JtNFNy?=
 =?utf-8?B?NDRuV1RLcm9wamRUMHlDcFpRSXAxdmpLV2djdUV0REh2SHpoeE41bklKT2NK?=
 =?utf-8?B?em85OXBzeDBnNndpdHJZNkFZWE9OT2V3VmVQUXlPNDhUUy8vcmdOanZyS3BS?=
 =?utf-8?B?K3VaSzl0aWZKYWZ4NFdMdnJhb0tBanBFMlBGalpVR1Q1dmpKOU9iOG5SWm5J?=
 =?utf-8?B?Qm1rNGN4TUplYTFVMWw3VW1qWXpDSktsUjhhVXNGZVV1MDdva2tnaHJXeTBH?=
 =?utf-8?B?azBjRVBBQ2NQOC9lRzFqLzVPTWgyT3pYd0JNQTRzZjRpTS9CUzJRRzh2NmE1?=
 =?utf-8?B?cXFzK0dnb1ZtY1YrbE1xSk5OMmt3VzdzZmFaL0tqNHIvSWg0V0FPRjV5QzBN?=
 =?utf-8?B?QjNYb3RVeDV6UzhYdlNSeU9YdFl2QlR1MENJVWhmTlRKWHE2akQ1YnJHTDAv?=
 =?utf-8?B?NHhQbElFQ2RHN2lBWTBwT0FMcmg3R0JubUtiOHhOTStveWkxZnBEWUpTM1Iv?=
 =?utf-8?B?c20yR3cxL2czV3I4aFEyL3UrRzEzaXladVNkVGJib1JTcnpoYVNnbmdnNnhs?=
 =?utf-8?B?ekUzY2FvdDRTWHYxR2d1dmRPc3VVODM0RUFmdmx1eWlTaHF5RHlVS2M1bG52?=
 =?utf-8?B?VmVjR3paNVlNbk9BR29HME91Mmp3ZXE4eWVRMkdINXZaYUpJTnVQRkNDbUcv?=
 =?utf-8?B?VWg3QUZFb21URGMra1hycStsaHl5YVVRWUtyMmtLZldUK2p3UTBJalpiKzNV?=
 =?utf-8?B?REYvaEcrNTZGdUtVQ3V1cjNjK3RLNnIxcG5XOEd0SDF6MGRYMXFRTEVERDFl?=
 =?utf-8?B?SElBY3dwS0F2STcrN0tYRXo4Z2gwd1RLR0t5L282eGxjRGFVRHNSSW02N0p0?=
 =?utf-8?B?ZHlPbitlSmNxbCswZUdOdzBNZzVCTlBvNGk5MlpLSVFhSzFiTHk0cGFGU2dt?=
 =?utf-8?B?THAwNkVwd3pvZFZBeTM3bXhKSFFFUzJ5NGMrSDl3RmRQWGlabGNtS1BCK09L?=
 =?utf-8?B?RVVVMm0yUzdRUzZHVmdnMUwwR0VnL1BBNVY2Mm0vck9sOGFwSzJXOVU4YUY5?=
 =?utf-8?B?YTEvNjljeEpYcFdmbEtuT0ROdGpTTTFzV3VtbEJrdDVpNXVhUHh6OHZDR1Rv?=
 =?utf-8?B?Zk5XRnRyejlnYVdZS0xEdkhVNkFVNU4yZDFCd1dmSVBPUmhpVHA2Vm1HL0d5?=
 =?utf-8?B?L09mbkdqem1SbUxaVzJYYXdTTUJodlJGSkxtaVhjbFl5eXNHVHRXYkg5R1cr?=
 =?utf-8?Q?zJhkl4z89k39xitwjzNs3O92B?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jSB1/A4+fl38C1HOstvxkaTl05ng5NRm3+BUIMYnn+ZGZbjGuC9ezKNPjyWm/El/NWCc0pldElljKT5LqKI5fLVPn1moW6d4J/dFgsplbAKtIAMv/0LRYrx9x9djCmyq7ejjZGnwIcyPwBGOtpgbx+YPPrZAfXxal+5tDN52P+4IEWBXjvA3Sw+X6SPxdW/eAYPJVDaPgoPbbSVSTuEagM1xrsccwHWSihBqxGlE9BHVvV0UDBXN2ZcAcvOOocoxsJnCYzR+PUizA32Pwb0MchOGJaFQgQiytz3ZZaSDX2a3qlIEyWWfsrcHBFG4yyxKWBJ8+rnFUzke1cgS7eRs/SjLYYxVC3E9rPVWqwmtwsoXJ/Mlb4L6qqbCfoM6d5gT4uivz77vUHZN1OV7qiSXNa09SQQRUaSBXTSsNAChQ4P1CT5cg5eD2WoIGXdPI5F2I9ZqnGLk3iUuoyD0nE9sBM3omjULIp5NVeighf5+KTdw1eoyhTa4k2NZ3NTl2whG/wNjWvKeIpjXH9Gp7hvGlKLXoVHKNnT5fqlwGUYnhO3nxMrqmv3VJ7DoqmyCkdMhgBF3F9JjcNu8J5dgdIdtF/hNhL3X3taTHZ999lgFFic=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce0c692c-2e38-4150-1110-08de2700b8ee
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 00:15:21.0803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3tkhTR2M3OIdCbgSaSW5KDpuXrbvMsUUr2JpMCEvo9A+dgAOTgj+E/CPVsu3SGQPs9v/Siv+Qsg0SkfY7n6/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5885
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180196
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfXzZ/kttLzpG5G
 MMoHSByPet9SB47ANc8KOY2+3CSBo93US3L9340gjlTRendCUHg7szJacnzuVAU/IVY7H9VEEub
 B1z/W4VsRo8GncvZE5ObtEFL0ZhC8+iVazAXYQCQQXHrMbw21bM/en9Fpmnbzhr8RdetXIYZaK/
 qT90IqTRt4W9gW3XvHktnyIxhWIfOOO8F4wdAYsOxDDgiJnHbSvmHX88qjdL3GW6SyHQYqlq14j
 jLONWSnwQYttVsKWM6NZqZJ66dDgyhphO+IuRWhNHzRe6wzd/XDaMfwctm3HYD1vo/FKmSZnKZ0
 YUtMQEewGk23MzdEq4qlDka4MO7eE4vnJWKWMfl4Mid/s+uMi2K5nFAtGapmnZE5j0AuM4v85ge
 Ryq/xOLDUlW89ZHvf1BvAf9yJpilRQ==
X-Proofpoint-ORIG-GUID: -gbaxBS-Y8Ec_3r7TjIpztakbVH_CarL
X-Proofpoint-GUID: -gbaxBS-Y8Ec_3r7TjIpztakbVH_CarL
X-Authority-Analysis: v=2.4 cv=a+o9NESF c=1 sm=1 tr=0 ts=691d0c21 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=x33NsS8bojyH4PsKLqgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 11/18/25 07:43, Alan Maguire wrote:

> On 18/11/2025 04:30, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> looks great, a few small suggestions below, but
>
> Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

Thanks, but...

>> diff --git a/doc/userguide/reference/dtrace_providers_stapsdt.md b/doc/userguide/reference/dtrace_providers_stapsdt.md
>> +    STAP_PROBE3(myprovider, myprobe, argc, argv[0], 18);
>> +    if (myprovider_myprobe_semaphore)
>> +        printf("the probe is enabled\n");
>> +    else
>> +        printf("the probe is not enabled\n");
> I found the example a bit confusing. I would have thought:

(fwiw.  I think it's cool you can check it anyhow, but yeah your example 
makes more sense.)

>> +Notice that the instrumented source code includes the header file
>> +`<sys/sdt.h>`.  On Oracle Linux, this file is installed
>> +by the RPM package `systemtap-sdt-devel`, but the package also
>> +installs `/usr/bin/dtrace`.  So be sure to have `/usr/sbin`
>> +in front of `/usr/bin` in your path, or explicitly specify
>> +`/usr/sbin/dtrace` whenever you want to use `dtrace`.
>> +
> Would be good to mention that a double underscore "__" gets converted to
> a dash (-) in provider/probe names too.

... but what does this have to do with stapsdt?  I thought that was a 
general DTrace thing that would not need to be called out specially here.
