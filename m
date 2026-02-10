Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D75F32E6BF
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751041; cv=fail; b=BYvxJxnNyL29CqEhelOO2l+ANb1xaC4pPkNNJeRdrVx46he4zi2E3Ji21wgbAohDTkkqurt8qIyWwm0BjUZFR5krS8brG6vSYw8g8LdNAcRFL/p7Ck2NQZcWeA0Q2EhrXLrURfhI3/ZVz0UeWF5loyXEEm21mhKQKQnY/3hmIb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751041; c=relaxed/simple;
	bh=zBVKzVWueYXmGJd3LChhoPJyZPz3DjLcKa5XxCSi5Jg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nWDJe58dEqRtVqzpJrBDf0s8wi4xEg6OPEY4t/bGQ20ehsoweo9lUWpoePdbT2KUNG/rghcpi+0N95T+UAiaKF4mcmFdEezmWq5I+8bubejQQwWgDz2al3Z5un8AOi2g1uVuEv+9qSTNsTtvog4WoTDZ0x30ZmiFRl9fjV5L4bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d6LZ8oDD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tE2iH1qP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d6LZ8oDD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tE2iH1qP"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AH2sAN3923634
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=LKgmm74/4uuEXagKzPKnGqdGAoAsve16iYMP3Cp+pCs=; b=
	d6LZ8oDDJ++rQzdRTCdk9zgOpfaYeJUjqgE9sz86+L0iQ42iNIraZW+xAeLfl4nK
	uBHYcsrT0jZpThuEUWyQYQ3hza91fYZ38lm6PaEIwfj+952c54YzKbyJfF1gaiQ6
	QA77JPuROF4DQGRayBzKBbtEFMsnW6OL+3zJhdGLv4JFzOkxL0ThpuzZxND1Z3Nk
	slbBhqGxwzRk8hKWoTf9RHyaVCiRW8VYmXqs6WHTUt0zcN81lpSQ2dH3nkhElyda
	TcvREgGFJhaAq3yG7VDjYYtvaE/HOEGefZ3IX07FPSA0QF6pQ+nmCJctwFXcCFOT
	ixIPCAuGqST1kCAs/tqSdA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88qt08te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:17:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AIA1CX030158
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:17:19 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c8228fst9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 19:17:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC3zWI/qOvB8L91yh81x4R8ZaD+n511Q0/ONQ2ie2vLVD8VxyAU+9h29oFBhgspiOXCCasOye0qJi7We7c/KFEUhuwAeGRq9G7/WTX+PkVpV7gBb6dMlAig7zj8TMjTRpsW7jOf2te5qsSe4+vTIEp+jXogni18Y1yhGd8zmjHkIB5sMM7ndyoOQWwsoaIKzaWf3RivSFKG1r8yy44JHAigSd7TsXTAiy3ZafcOLu3uE2XbbKKVvZ72i97+VYPCCdFaBu/bb//Ci02VCPls3xs4Df7dRiTl6UTFU51aAlOljzTS618OOqi713Wnq3JWbxN1Q4+sSiWcdY95TTfP0Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKgmm74/4uuEXagKzPKnGqdGAoAsve16iYMP3Cp+pCs=;
 b=NC7QfsEfsyMHTtSzt8nSaFeJ4jHUHg/JL7Z8+cK8u4EhfbKeASan1Ak7+2yyyRkFC1ZLYCS89watCHsKyp2xhTG5LuKpH10zaWTcGqUPHAvhf/bmkY/OHRqc9XsOaN7ftY03fWGNkuqS2NKEf9U66N84NmflVHNwtN7qCgm4HfuDXTQ22Sfie3wfwhFKpIvOaMO2hE0PF9Hx9+D3eD+MaMTLUV5memcyI+cNvXHImgnFfpvuwG7t2alUz2ktrS210eqXwmtVmpkNkImWgE+gFdMuQn5uTPwR94RlrVxHYOf+Iapuiwv+6WzeOhqXzj2h1C7fCOp1Ob4Q5xWsND6KwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKgmm74/4uuEXagKzPKnGqdGAoAsve16iYMP3Cp+pCs=;
 b=tE2iH1qPt5RPfqAkgmroItH30JcpcHxqyya4dllu/ok6yUuMANmeTJN1wtSWE/7ldLA8Cm1r3NcRBMOti5dpmSoJJGKXEqZtwRShxTLT4lpX7vBrORntamlNfweUxJXlcIseiTWFjBrmwgWB5d+sR0A4ynTYbiUcr8jOtF5+v38=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4369.namprd10.prod.outlook.com (2603:10b6:a03:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 19:17:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 19:17:13 +0000
Message-ID: <3ca318e3-2885-4417-d036-165c988dc075@oracle.com>
Date: Tue, 10 Feb 2026 14:17:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v4] test: account for member name change in
 mm_struct
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752259CE738E82F7D6854BA1C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752259CE738E82F7D6854BA1C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:408:ea::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: 071188ca-33e5-402e-ba04-08de68d8fecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2xuZ0ZnYnBqU0JObHkwS1psanp6eFVVVXBCQU1pdlNORW1FS3lERGY0UzIy?=
 =?utf-8?B?MUFsNHVvRVlTWllTTGJyUjJBLzJMRkxGNWZsVVJxMHJtcTJlMFFqSmRDZURa?=
 =?utf-8?B?QkwxV3pjb1NVUkQvU2k3WWZnVHJ5R2xqbVppRmtjemo1cXMyRmZhL0pvaTdX?=
 =?utf-8?B?Z1F1OFdRaXV6TnhuTXc5M241U1FKcXZOQXYxRlR4QkVYbnkvb0k2NU1SbGRW?=
 =?utf-8?B?d2xBaFJtS1FxTHpjVFQvK3ArM2JDNkZTVmJYNFZFQU13SkpLZFhCM2l5R2NR?=
 =?utf-8?B?cDlDYVN3bkNVZlBZT3JEUG1jY1NlTDNObnhOM29mTkd3MHQ3dHo4Uy84YUNL?=
 =?utf-8?B?Q0JPU2ZwVFh0MXlTODV5NWl2T3huejNyQlhBZFY0enNiUlVuNWFwa0IrdjJh?=
 =?utf-8?B?dERSRHZoeUFvbWRKT2dxenhpLy9JU1ZnVXJsZzcxRXFhQzZ4UmZzVWFGanVo?=
 =?utf-8?B?S1hDZDBmZ2lPb0NnQ1dJSEtQMkRUaXY4ai80QnNhMWFoWnBYV3loQWsrUm5V?=
 =?utf-8?B?a2RWdm01ZkJleHJqdDlTUGUvam9VU0lDR2IrLzRBWXh4dzhqdkRXUzRhdTRE?=
 =?utf-8?B?VXk3aENFQW10SlBOSnVpS3pxYTd2Y3BtMW5OcWp0OHpYcEJpTWdqdHVzUjZT?=
 =?utf-8?B?blJwMnhQMW9YM0JpR1I4Ly9KV3ZWa1g4cW9CaDhBTnZjT01aM1NWT2xDRzE3?=
 =?utf-8?B?WWlMK0pCK1VmMkd5dSs2L2xWLzdTSEFQR2FRQ2VvSFJOT2Z0WFcxYzFzQ0ZL?=
 =?utf-8?B?Sm01STZaTFVUT0tVcjNQNmV3cGdtSmk5SFpkbm1mdmJ5T2VmV21rQ3lFMGEr?=
 =?utf-8?B?NVRIaENQZW9xUDV0YUxzd0Vuc0orOElUZC9aOGRtMEUzNmxaK0t3TUZCTGRT?=
 =?utf-8?B?NWpwSnBjNHhBT1hRWFpmNnczQjY1ZW9HOVllK24wcFVGSW8zd0NFZkdRUncw?=
 =?utf-8?B?UE1QZW5UdjIzMU5pc3oxM0RmMzluSW9WbWZWWWx4TjYwdEMwZlhyb2NuMzRF?=
 =?utf-8?B?RjRXKzZTVHYyeFNVQ3N5S1lrWlFCWk9OSUw0S0JhNmpjTTlCL0FvQ1VWbDZU?=
 =?utf-8?B?VW9ZUDFuQ3lZUXpHSG55REs2REVCa2lDU3Q4cWUwcWx0T3NXYkFEUkV5ODNu?=
 =?utf-8?B?QnB0alF6a3JmOGdJaFMzMnlaM0ZNV25ZVkxZWmtzTE1CNGFTOEtyVXVidld3?=
 =?utf-8?B?Ti9FQTU1SDZhL3VMb3VVUjl0Q0ovQ3BMeFFBK1hpSTJLcGQ0ODRsN0o3b3Ju?=
 =?utf-8?B?ZldLQi9LNFY3V2crZWs5K2lJZWRvUUhHcldMVlRWTHJRQ3RkQ2JVUTNTcjla?=
 =?utf-8?B?NWRJeVhKZFdybHBtU1VSVzVlaFMyall6OGRQTmNTdFhvNU91NnJNbXZqdVor?=
 =?utf-8?B?eHBHbmk1STZnZTYrdFJFZERjdGptWWdSaEtNaDdveWV3ZVpLaitSaHBIMm5B?=
 =?utf-8?B?eSsyOFNWbFk0VGFxUlA1c1BGNmE2cFZjTjI3TUxFMER1QS9oMkFvOUdsd2pp?=
 =?utf-8?B?SGJkZy9XUHZDR3NTNC9tMWZQSXBseUltQXpJTmRHZmtpMTNHNk53STBqbFBH?=
 =?utf-8?B?N0k2d09OTkprQkZ1eGpuMVpKV0hOeGRNdk5MT1F4YzQxODkwYXJLakNaUUFF?=
 =?utf-8?B?U2pDTkZGSzdGWE0rV1NQWWE3YXpHU1o0MlE4M1g0M2R6TWQyMWV2K1VUanRi?=
 =?utf-8?B?RHo2TUw0NldqZnNmaDVLR1o5YXI5ZW5TQzRuTXI0alIra2UvYjJ2ZHNYc00v?=
 =?utf-8?B?NEg2V3pOajFVS1hkait0WCtyZ0FHZlBXTUNqakV4dWQrcXA5bTU3VE1va3Ar?=
 =?utf-8?B?MlJtZjE0dmttMlBMQ3VuODRGRUgvQmp6ei81QVN2NFJpNHJXY2VJSXlaOG5Z?=
 =?utf-8?B?UmtZTmhRbG5ZSU9GRGdHcC8xNFFnWURhS1FYaFlZMlFlaVZCenFUWDUwT1dK?=
 =?utf-8?B?ZFhKKzlSNTRGTks5K1gvU1JjTndQL0tYbjZHTjYyV0FRakxDWm4wRHlzNFBx?=
 =?utf-8?B?RmZPY1dyRHhscUhOSG84UFNIam1tZ05pemNla1BVeko3VWYzMGRMaEFDLytY?=
 =?utf-8?B?WktwRnBHMHd0WTZNcVZHWnRoZDVKaTFlTStXRVRianljYW8xbWttb0VkTmh1?=
 =?utf-8?Q?O0vVeWMJ6UzUS+2OaqC4aG5JT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUhDcEtXUC9PT3JaQ3RadXdtdXBCSzhTTnRQZlJNREdaNDhqQmZlREp3V0JS?=
 =?utf-8?B?VFFma0Z1VHNTR21DTXRndTZaVjAwUnZPTXBxZHB2NVBkYVN5SEJodEdqSEx0?=
 =?utf-8?B?RkVMbUp1MFVkOTBsNTJUMW55VDdEa2NwR1N1dWl1c3FRMzBuUi9LUEpHN0E4?=
 =?utf-8?B?cTF1NHFHYUlpYTZ3RlN0dHMxalcrcUZ3OFhPY216R1p6T1RkOGMyUDVxMXpB?=
 =?utf-8?B?TkNaN0FVUVc2QjZEaklINkNReDBLcHkwTjlWdUo3ZHhIM2hBOEhpWVQ2YURn?=
 =?utf-8?B?YmtwN0NhV2dqMkI2cHNLNmhzaHBVU2xLTFdhSEpPaFZMV1F5WjUvYU45eHN1?=
 =?utf-8?B?Mkk2SUQ3QUx6eUVwZXlHazBldWd1bmMyR005MnBMQkdJTFp6UWp4eHF5dmNl?=
 =?utf-8?B?Nm1Ia3NBbEZYRDJwWWNQQmhwNW1aOXFnSWw5N1Zsby91TU9OS21hUkRoYzZH?=
 =?utf-8?B?VWJSMWVibWZZYm9EbUxBMThnUFVqOVlOd3pRK1MxSUVoSFZuVTMzUHlyWEtz?=
 =?utf-8?B?SWtiNzZacksvS0l6STBqcmUvdUo0enMzci9YeVZ6eFVkTGpPU2IzYU9FV08y?=
 =?utf-8?B?N0dyYmVSbGp4azJ2ZTRCeGlsMUZ4YzlwL0U4Z2NKNDFYSHNKWDlNbWpSYjFM?=
 =?utf-8?B?UnZkeDJRU25KL3JlV2V3NE0xOVBFclpUb3ZucUVmNVdTTnhBMExwT2p2S0lh?=
 =?utf-8?B?LzFQK0FVVjEvVlJhdE90ZklJQmZEK0puMmRtY01LQVQyWmRMZ21yam5nR2F3?=
 =?utf-8?B?SU5aZ1FtemVCYTkxS1owM0tLcHcxdGVoUFhxc0Nldm1KZjFvbFZrYlR2UlNj?=
 =?utf-8?B?MmRkdnlpaHdpOUtURUV3S2Yyc1p2N2xkamFXT2lUUFBKTE83eUgrMnk4blpa?=
 =?utf-8?B?QmdCdmpINjREY2o1OWdWY2E5WXpTUEd1M1ZHMU9zc0Y4V3d4MGNFQ2VXOCtB?=
 =?utf-8?B?SVRWbkFmUE5QYnhzejUyZHhCUlladDlkeDY4THRESiswWkp1RW8yNmdKQzFx?=
 =?utf-8?B?L0E0Y2NQNDNQd09CYURqblFwMG1pOHJXSTljbFBva3ViUGw0TjVUbThhanNN?=
 =?utf-8?B?YUIzSTZzY2U1ZlMrM1ZVREI2Ylp5VzVOT0lURHFrMmllUC90OHRVSFFETzJk?=
 =?utf-8?B?dldhQm9WVlpTbkpCdlVmbXRJbHk4blNrbTJyZUM3VG9pR1AzNU5tVmV4Q3B1?=
 =?utf-8?B?ZlV0bWMycFZ0WWE3OCtsOEw3UW1KL3VqeThRRnI4ZmN0UStFYkNFbnlSRkUv?=
 =?utf-8?B?K056ajhYOG9WM0Y0SmNUd0dsenVMbjhud2FtNHVYWmNoMnRUanFxK1RMTUFr?=
 =?utf-8?B?ckxvYXl3ZnByelpkOHZTNlEvaVAzOTZIQTZpZVY2WEoxSXZsZmc4RlFVN1pF?=
 =?utf-8?B?aEpSb3pTR1F3TEFoOHVWNHYxSE9kQ3NtMXdiWTM5NUVwOTk0QUlrT01mQ21U?=
 =?utf-8?B?bTFNd2N5aHdza1NkNmpCaFFsSnhnUldLTlVHVmdVa0d1UlZkZVNiNExIeTZC?=
 =?utf-8?B?ZmF3VXY2eTJ3UktnZ3JpUVRVY1JGTXMzUEh3clJHbW8rczRieExoR1FZSlJl?=
 =?utf-8?B?V0tnd2hrM0hBRGhuOHpabXh6MTI3VzRYb3hac3RuQ1E2M0Z1alBUbUpudlp4?=
 =?utf-8?B?ZndkZUxTblFiL1ZzVktKUXcxWXA1Q2M3OVBIdG0vUFkxSFFEdmtmYitkcHJG?=
 =?utf-8?B?eVQraDVpVkh5d3A3SjlqNllraTBkekhmQ2lkdTNyckdVNjFrWWtPTU9mVjJu?=
 =?utf-8?B?K0hOZ0xITTRRV0pkVXk4U0h5azBXODlVZ0NzRllBMEQ1d3J5eUw3UFVKSXY4?=
 =?utf-8?B?K1FWZXBMU3BkYUdVNjg3MndwN0NYUitsbFYrSDNWV2xqUHJsaUZ5Mmg5cXVo?=
 =?utf-8?B?YTFFS2dibFp2N1l6a3ZIUTlPSmlTd1VzMHpHZ0JOUVlTdW9zeTZ2YWFvYys2?=
 =?utf-8?B?YWpqWVo2TW10QTNEdVRUaWZENlByVnRHSUlKSkdnTG45cThqWVgzbXBIbVQy?=
 =?utf-8?B?bFBvTDFsYjRsaTgwbTBWWXVlbldZU1ZEN1dCRWN5cFJYUGIzRk1RZ0xMOEFy?=
 =?utf-8?B?bjUrdklqQ3l4MEZEVGM0emdxS2VSRnhpNnUxZjFScENTdndxYWxRbmUrK0I1?=
 =?utf-8?B?bU8zR3hVNHhZbGxlcnVHczBnZjlCM2QvajRsQ0FZb1IxV2NHT1h1Nno1cFhh?=
 =?utf-8?B?Uy8xeWZKWW8xRHY2RGNxQm1seFRGZDRmWnN4Wmd1UDFuSHVvZlRJSlIwYW9q?=
 =?utf-8?B?S28xY1VSd3VKSGt6TldsWFlFOWQvTE1QUjNTak5ESU9Kb2ZTbG1oZ3llUkZD?=
 =?utf-8?B?aGZRU1NLWHhLVGRHUUU2bVo1N2VOUGxpeHM0eSs1RmNtTlVoSWpOZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H+yORxhqqhnBMYMHx18MzkG9KQn3RCCLWASEmM2iQHNnna0OD70tZFvcGntZlWSxahDn+NJb4KRRfMXLLOqZFnPGN1vCfpFcvylDD8ka94O7bMXsqNeYjE/0cPaZjuHaQn6Z+blwkfjkvp0gLecr2DbQkkBagE+tJAX9xfYOpEHLVPLw9ZaD1+miqk/AG0MZ078aBDHcnki5cUjhzdWmYxUJewhlZuheuGtfo/zAzu9ihKWULtOEebyMYjYajuYQ2pCOzWnXbC4nJ0RTbI1y52+WbnSvB83KI2WNv2AHh/kevc1D9+sVFIoEjnOepmUbO3OLDwARQD1yUjSqN+MbdTHyQL1zgjvjunS6EvN4dO5g7hhurUlPUT1z0Evm8MmKpUvvZ7dWS327wBwWa0fvWDxSzohfU2OdaWHXEFiYCpvpeTOudEQr00+gEEmaBiPhWYbOVFwkCh361QeaxVUTaca1mO5WDHO8f+SgC9fQNwCYPss4pRksmkffAZS4KsPKX1R7cKtJOQnemGqu+AilFI7ifaJp8vApirb4WndOdOlOkGR12M/YS0+o3OWaFkFk448G5wYVDpNDInklKAd8RZKH1CxP1TTqS/Xr1TrF2qE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071188ca-33e5-402e-ba04-08de68d8fecb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 19:17:13.2263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yU88Q3QQQhUGIqzNnSiiwFCyRGH8iy9zZ6mlBy0Gg1smf3N06jePtynDYbAMWqljyUs1qXWerLRxBlrKF3fOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4369
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_02,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100160
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE2MSBTYWx0ZWRfXzpvMpxQa6PJD
 Vju2u0fBkYAKt4SCGgUmOufBcW+SL9CGgKc2okPzY88avK9HaG73pSX9LXl+DpTtuzQIrP84P1a
 4i6n5PEp60lyh3jWrjwUiS1BFvmIa88/QzonxTzgGNRaV0smm7lcsujRsb9fMYrl8MeveyR41iQ
 KYNTfLt8mx6ZN0pyqe3ttBfbyX2uPC3hDotcg2ovHkkDN9h/uR1SR6nk9DJmqc0utg3gaIlR9pb
 u5hpCkAsgKlrRAQ1jCI+QbaCimsM5hJBPy080B6KYlJNbQuwi8Unz7cCs0xqijaVg2HqHU/OEzn
 nTd2Ki9JbOUbzNr0dlZsT0TqF5uHmW4dHR9kV1sVGvLD5GjN6VW8tmU+FkrV6HJhahnPEIOg4jQ
 rggBgot+8JqsrblxI28XzEfnPvLi2s6rDa+791wdqWkwZkJ6HjIWYck9TLdhPzzRfzV4ZkljFxV
 HKB1TQkOgfFcONT33GQ==
X-Proofpoint-GUID: M0RcxC4_vG-TFdf9PEQNyRWTDFpyLBP2
X-Authority-Analysis: v=2.4 cv=Mehhep/f c=1 sm=1 tr=0 ts=698b843f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=VlkGvKDkcC7uFZLO-ZwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: M0RcxC4_vG-TFdf9PEQNyRWTDFpyLBP2

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/10/26 14:06, Kris Van Hees via DTrace-devel wrote:
> The flexible array at the end of the mm_struct has changed name in newer
> kernels.  Rather than depending on a particular name, we can simply get
> the name of the last member (since that is there the flexible array is
> always found) and try to use that.
>
> The testsuite gains a dependency on bpftool for this test.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   dtrace.spec                                   |  2 +-
>   .../arrays/tst.ctf-dynsized-bounds-runtime.d  | 25 -----------
>   .../arrays/tst.ctf-dynsized-bounds-runtime.sh | 42 +++++++++++++++++++
>   3 files changed, 43 insertions(+), 26 deletions(-)
>   delete mode 100644 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
>   create mode 100755 test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
>
> diff --git a/dtrace.spec b/dtrace.spec
> index d6af5a80..e0d832ac 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -115,7 +115,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
>   Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
>   Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
>   Requires:     coreutils wireshark %{glibc32}
> -Requires:     time bc nfs-utils
> +Requires:     time bc nfs-utils bpftool
>   Suggests:     kernel-uek-tools
>   Autoreq:      0
>   Group:	      Development/System
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> deleted file mode 100644
> index f3801454..00000000
> --- a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.d
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> - *	      (ensuring the bounds checking is also bypassed at runtime).
> - *
> - * SECTION: Pointers and Arrays/Array Declarations and Storage
> - */
> -
> -BEGIN
> -{
> -	i = pid - pid;			/* Non-constant 0 value. */
> -	trace(curthread->mm->cpu_bitmap[i]);
> -	exit(0);
> -}
> -
> -ERROR
> -{
> -	exit(1);
> -}
> diff --git a/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
> new file mode 100755
> index 00000000..b95e51db
> --- /dev/null
> +++ b/test/unittest/arrays/tst.ctf-dynsized-bounds-runtime.sh
> @@ -0,0 +1,42 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# ASSERTION: Array accesses work for CTF-declared arrays of dynamic size
> +#            (ensuring the bounds checking is also bypassed at runtime).
> +#
> +# SECTION: Pointers and Arrays/Array Declarations and Storage
> +
> +dtrace=$1
> +
> +# The mm_struct 'cpu_bitmap' was renamed to 'flexible_array', so we need to
> +# see which member name the current kernel uses.  Since it is always the last
> +# member of mm_struct, we just use that member name, and hope for the best.
> +# If mm_struct ever gets changed to not have a flexible array at its end, this
> +# test will need a new structure to work with.
> +
> +# Determine the member name we should use.
> +member=`bpftool btf dump id 1 | \
> +		awk '/^\[[0-9]+\] STRUCT \047mm_struct\047/ { in_mm = 1; next; }
> +		     /^\t/ && in_mm { fld = $1; gsub(/\047/, "", fld); next }
> +		     /^\[[0-9]+\] [_A-Z]+ \047/ && in_mm { print fld; exit; }'`
> +
> +
> +# Try to access the flexible array.
> +$dtrace $dt_flags -qn "
> +BEGIN
> +{
> +	i = pid - pid;			/* non-constant 0 value */
> +	v = curthread->mm->$member[i];
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}"
> +
> +echo $?
