Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9512236EE
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753913040; cv=fail; b=Rv+q/sUnsiMwPZJBRTlm7noUO533ENQ58XerPFyDxUpULuEki46QTfh/mxJAT2ahpWpM9f6OHb2hUijtfCG0RGNQFBe2fAQP+5UqV+nPcv9sdGSDhrem+1IYjtPH7Y45X3cx4qfILOsRzYk6xz3e0h+Zi9SEoyuv05cTZISKsDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753913040; c=relaxed/simple;
	bh=KyiZ4AHIke6IZ65Dmo7tXKR7O0wOYJlhe2bcTa51FmE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lqllkWQYSJSTtZHj+nHg6t5o5bwI8DZPTWnRyCQZcNArdS7ZBCCA6jGq0oWjwPrZwxV7kQOAcxFxkSqyC91+taKYVitFP5CggBaFfq7OU6meeDswolEpJI+PC79g0+iDPdjjSaQZnNPrw8iY6qnnVE1SuALtSVq+s6oociRDo1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PGMeA5ib; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KUuGNxA8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PGMeA5ib";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KUuGNxA8"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UJC6Dk016503
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HScAAEmzjb1USWNZezgoSiqlZ0Y0xI32NbW7YdfQWsY=; b=
	PGMeA5ibIy2IXsVPefh8iTxCYLZtmF/fG4CL626zG3gHprsnMb93GwUEI9f5A7Tf
	jU2Vi469a+v/FefeHSvzYBdvRj0CdW+JT38/ocngteWKEhDndw5JXNGpq70tR6lG
	XtNVe9llH5ajwksac9Fjm4escbQ8T4umiHdLVZ80aAHigx59YrrBT+f0QiLZoStj
	AqoZ8PVFXGg/YUNK+8WWJcx7yB/VahnHipKrI9L5OLFEiHWCl3kHEX1qPbEkHZaL
	dZjAImxd88fjO1lRTM0tcFQq8msxZ8oQQrRiWJ+5ItLhesQnfaSDSu6jM7H1Zpao
	Up+Y+Yea3dwWOGfi2coynQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5x2rns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:03:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56ULhPhq002457
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:03:56 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2047.outbound.protection.outlook.com [40.107.102.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfbrqr1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Jul 2025 22:03:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkksmyK6BaCzq3lD/JPV9PrkU1fRpGej6SNrpM+sMyK/zUc5Yj9Q4J/FKMtO8drvrOeRSAO57Wg1lIxcOROVO+1PEPLCQgeW/obywoGRpEaqGa73JAaJLBuCECroVBixrda4j1/cVihbjFOefq+7B5mh6eEL8yP4UKUEwNskQ8ZDv7I9gAoY5NlKc4Fn1k6+JbPIjiJS1+w79PeEsn7zRxvo5Vr7yA6SWPCcKINDMy0HLll7dG9CT1zyiYKBfZY5xP2JB4itzGlvgvq4L9wHtvJZB5jOj5CV52rYXcjJFdS66NaN9cfsFkYTYoNinrdZazOmpmAyXfqm1/nYA0kCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HScAAEmzjb1USWNZezgoSiqlZ0Y0xI32NbW7YdfQWsY=;
 b=AqMiWGh15Lf4xychkF005xS7x+cNxaO9bBWiUwJwS4u6DR+Y5f9RIA0pk64Kn3/KJn13yutdGFGXDbih+OrsjWSer10S4E1hFEiayMWxEqcQ13/TeUHAhEClJNIZfwqwv54SZaEEfOVIOVX7DQjvvkM0mrw2G26F07IxwwAG+qvy89CcICDxREP1rQn7qkYpQQAaebxTiZ3d2IChyTONj42Qy726Sg1ZJTswNB0UtEKnNVVe+M7O4OPlLNR5WDDwqpOxb3q4DdDgHs8F0i9ljNaQiZ1S70ZCxPFEmcWkhqtalHD8e8IQ6kj1n5/f9Pihz3fb9MyhlNOjB3fVtI4flA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HScAAEmzjb1USWNZezgoSiqlZ0Y0xI32NbW7YdfQWsY=;
 b=KUuGNxA8cTgQKc1cMdEKHGQAQYP5MT4p+MOvcy0Bh+z5FXyIxnlpH8ZS4yV0O9mwVa8iKFeBua17KVbu94kxCTirNO6QcpBZDDyMgD2Ioo5ruoAoe9SWHf6DlZt1EFVpnCMrJGs5cdXCVq1KUSASGNtR4xh5YSj6c0NjAHtm1A0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6406.namprd10.prod.outlook.com (2603:10b6:806:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 22:03:41 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 22:03:41 +0000
Message-ID: <251f2ae1-a884-4a97-49e0-c0fb419a92f3@oracle.com>
Date: Wed, 30 Jul 2025 18:03:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] test: Wait for output to flush out in
 enable_pid
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250628223050.3396-1-eugene.loh@oracle.com>
 <aIopqYJP3yn8DzUf@oracle.com> <aIorqcS0sGZ0UuHS@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aIorqcS0sGZ0UuHS@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0084.namprd03.prod.outlook.com
 (2603:10b6:a03:331::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6406:EE_
X-MS-Office365-Filtering-Correlation-Id: c357b17a-8bdd-4f52-e654-08ddcfb4f18d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WjA3YU5lUkxKM2dlclBKYzBaNUhpSjg4bGxaUVhucERiTlRBTVJvZmxyNmhK?=
 =?utf-8?B?QnhReWFTU0VWazM5UC80RVcwcnBWcVFqZGhMNm4rWmcyU3R6WHoyUnU2RUo4?=
 =?utf-8?B?MndqTzQxSlVPUXdtZ2pEVkt2ekFreHAyT2ZhQStoMm8yMlJVMEFCS2QrZEtH?=
 =?utf-8?B?YnFKZ3Zma2xVM2ZVQnoveUI3K1VmMFRKY0V5YVl4TlZ6UnpheE9ML1A5RWc3?=
 =?utf-8?B?Y1lzQ2NKc3U0YWp1YzVrQjRzQXlIWjZWMHhMUmpKSEk2M0xkc1hLUDEwTFhZ?=
 =?utf-8?B?cTY5S1pITDR6QzFsb2pZL01PTTg1L3Zua3h6N0k1eVZGSGJkSzVzeHBUVHQr?=
 =?utf-8?B?MDh2d0hSMngzamZ3Z2daUlp4dlRPbzdwQjBwSjFPQm1QTllhQjgxV3o4Sll4?=
 =?utf-8?B?MDduVHg2ekZwWDM4NlR5T1NkUnZoV1VmcFU5cFJoVkdhREhzTWFSV280SzVO?=
 =?utf-8?B?ajBGZDVyNGd5Nnc2NGxjVzMzNHU2M0JLY1FMV2M4YXZEcGN1VzBsOXlmdEJR?=
 =?utf-8?B?dGxjTU9jK1lSQjhJT3FSRkdwQ3N6NlhWWWowNlJuYjJia2JkdHdMcWdWb2NK?=
 =?utf-8?B?cjdqbkd3b0tFQWFrTGdMcUo2MmNJWk9obHRTN1g5SXI4OVRVS1o5UEdTSkdB?=
 =?utf-8?B?SGxCSkM2c05lb1AyVFN2SFFoT3NjdFZhT1BEcENRdkdpQTc5UmVkMlhZTFZM?=
 =?utf-8?B?cnRRbTRYdUNZd0tScmRiTnFIYXBYNkZ4akpPakt1MEh2SnYyWjJGZnQrUUlI?=
 =?utf-8?B?Rjh4QkJWQjV2R2hqY1kwYU82dEJpT09ESHlZL2J3TWt0SnliUGpxS0RhcTQ5?=
 =?utf-8?B?MCtYQ09wWWIyT210alVobXhZWndFc1pKSDU2RzRFeHMzekx2WlJxZkloN29o?=
 =?utf-8?B?b0l5VExHTjRWQUM2WTNuV0dlT2U2a2NCUDRad2RDYUpxVUN1enk5WFBTeWNr?=
 =?utf-8?B?WTJ1QzB6WjhNNFVPNEVCSy9FNmJzMGd1bzM4Y1NHc3ZIamwvUHoxa2Uvb1pS?=
 =?utf-8?B?UnBqZWdMcmtnSmk0cWh3aFJmOWpqbjlVSzNlUng0aCtLdVJ2S2NzbmZyVmhI?=
 =?utf-8?B?Vmt0TG1tbWxROGNVNUF1V29makoyS1pFdkpYRGwybG1oTGZyd01LaVlPMjh4?=
 =?utf-8?B?QkpjVGZWU2hLd2NBQmw2aW9sU000MDN6UUQ5VFRQQkM0dmZCUzZrZUpsdjdC?=
 =?utf-8?B?ZGJVODROVms0YWlrMjZoZmZzbFdFUUVucFM0MEFDMUx6OFNTMVNjc1pNc0Zx?=
 =?utf-8?B?ajc2cDd1S0FxZm9DRm1LM2EvamkxZVRzWHhzdURLVXFDRnpsOVlqRXROd0J4?=
 =?utf-8?B?TlNIKzdETkY2dUhkTVUwZW11VXRmckk3TmNLOGhBUjlHRHpmVnExZ0htNzlh?=
 =?utf-8?B?V3pBWFRNcGxuMzEreDBJOThyQnVteFFzdW55ZHkyeGFhSmNTYm11MkhSbE84?=
 =?utf-8?B?bC9DN1BudnF2ekJYVFdSanJnejdXSWNsaGxXS01RcmhmWEVjVEtnaHVFR0RF?=
 =?utf-8?B?bWhxV2ZRNUhjZVVDUDVLM0lpdGxESE9BL2xJaFRzbmZkeEpHS2wrbm5kZUVm?=
 =?utf-8?B?b2lVcmlhZ3c4eG82VkpyRVgyZHdlUGJuQmdtRHUvUjFRMlNudS9ndEtQUEtq?=
 =?utf-8?B?aWIvTlFPTXl3UDdVK3pheXNBQ0RIbktzRllEWlBKaitIbHR3LzJLVHM3VFBp?=
 =?utf-8?B?Tjc1VHdkZksrRVVxOVA4TGE1aUZYcU5PUC9yTXQ0Nmh1c1FKQkRHOGtWbGxD?=
 =?utf-8?B?cXUrdmpydlA5dlJMOVZsM1Y1NWtYczdjTnhjczgybVdYNHlPMG5vR1pFR3Zw?=
 =?utf-8?B?R3ZpN0s3RUtuZkd1cXcxeldsa0tXaVoxVFBQY2ttVThLS29VejNROGZwSnRn?=
 =?utf-8?B?YU5wZ3RTUlZUNitINDAvMk1xdWR4c2Q5MWdYbzNFdEdmdWFWYXFGZkRvMUxv?=
 =?utf-8?Q?mD8/Cxh5IIk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmpBVHhpdG1xczVtdEZOOXVQaFBtdE1QdVVFeFlRL3NGZ1k0NGFxQzRVWVZK?=
 =?utf-8?B?OGNxSHRadHNDZVI4MGdvbVFQaHJ1YU1VdUZLdVZhM1pNS3Q2ZHBSMEVRRDVZ?=
 =?utf-8?B?MW9lWitHNEtYdEhtNjhCOU45VWlMQ20ycVJoSHlNWVhmbm40NkZpci9uWWdE?=
 =?utf-8?B?cHhWMnQxTHVLNVNackwrVURwK3BMSUVEbnNlZkMzSW8wbWg4eUtKZjA5RlFU?=
 =?utf-8?B?OWhIOVpTZFhOR0NPSk5uQmIvVHBiVWtEMXdDcWkxTzhUZ3pVc1B0dGM5OFRC?=
 =?utf-8?B?U3RqZEF5ZjZKNWlGcW5jMVpWay9KcnNzSWphWDVrM3VHT2hRaHN2MzBwOXVj?=
 =?utf-8?B?TWN5MUhtd0lLZWVmNDFUNVU5U0JPWjVvSEh1R3RvTVd3T0ZYcWxJOWZvcmxY?=
 =?utf-8?B?eG9MZ1NiSlhjbjdPd1doM2puMTdld0lObkNJd1VuNWVkLzJWanpWbG90RHh4?=
 =?utf-8?B?dmJHbWpSWXRvMUJvdjZiN01FZGgxK21ueG9zVmREcDh1NE1pTVR6MHhXbTZH?=
 =?utf-8?B?dENWZFd2cVBUYnlqcW1NdmFVZG9OdkM1YnBPUEloUUlQbkMrcCtiSnpLMnJa?=
 =?utf-8?B?azNpblhkUFhKME5iVkdNK3RyVTNFQ20rNVNvbUQ2SEFGbUNBR0ltbkk1UFU2?=
 =?utf-8?B?OGRWd2dvdVlDY0laZm1QSE56ZldHZzI4Vi9DWVlqSW5rUDB0SWxSQ3hpY2pU?=
 =?utf-8?B?MUpERHhIa24rd0hIUWJaVG50MDNsQnJNYjlCaGpGZE9IMFJkWGhRaWpYWG9o?=
 =?utf-8?B?RjhxOXBRd0FiS2pIaGdnZW9zWkFZdng4Mzd1eWc3QW9GVWVGdE9TVTdWSGx2?=
 =?utf-8?B?MTBPUVplbWtOaC9JamsrMmlYb24zZHlLL05Jakx5dmNrNUpqd1lScHVsc2pt?=
 =?utf-8?B?WVd6MHVvMjAvdnRsVEZXbXdQRlRaNXg2TVNhTVcwd2YxVUpoWVNObG54cXNr?=
 =?utf-8?B?a0xwekFXZFlrcEFCUDZsNlFXdzVXdENKaG1TUEVOTStUM0hzOGs4eDZUa09p?=
 =?utf-8?B?RHQ3QnBYVmJUb0pzWXBIV1hIMklXTTNGUFhCbHBBVEU3WEVtTkc5dlJaVS9q?=
 =?utf-8?B?bEZSZ25yYkJteU1MQ3lobmZTV2RwTTNSeUhySk5kV29tUXJqYlZBQmEyaFc4?=
 =?utf-8?B?dFJWdTFnTG1DYjZhZW5pVTNPVW9aTVRCR2VmbHYybG5qdkNDWkhkdG5udFJC?=
 =?utf-8?B?TXNLQXhiU2N1UWgxUzRYT1BFYmd5YnQ2MWwzSkNDYWxmOEJkSFZ3TVZreXRM?=
 =?utf-8?B?aW1weFArbmFMb2VjYzl6cFV0WWxoVGxxMEplTnhsL3U3ZWlJTm40dHIwaU41?=
 =?utf-8?B?R0wxeElvTHU2MDk2TFovOWRCOWNOUkJTM0h5OWU1a2Y2bGlIaU1GMWhydisw?=
 =?utf-8?B?ZTI4d1BjWk15a2h1U0ZmQ2JPcXUzK2dsUkxIKzRnbWREQjVaTmRKZjB6WUl4?=
 =?utf-8?B?N01EdnBjTWJxTzAxcCsrWHlQY0dZZjBuUVNwWjN6WmJQZThkMjFoWS9CY0Nu?=
 =?utf-8?B?WURPUVBrdFg0MFRxWnNjenpEWG5iNXc1Q3JOM3hienV6UW92TC93blF5UFA2?=
 =?utf-8?B?cWRMcEVmTTJ3dko0dkhkNFozRE42TjY0dDN4dmxMVHFkcFdXRURVN0xMNEhz?=
 =?utf-8?B?Sy8vWjJVQzdOamdDTTdPYVlTMzNlOGR4UktkMExGUVE1OVhDNUJKY0tmdE8y?=
 =?utf-8?B?eUd1SmhNR1JjM0g4UTJlMjFxZ3NoZ1lxeTB3NEVWTHE2LzR1Y0RweUpDakNY?=
 =?utf-8?B?NG1aaW5TeUZ0eVUzdHZsRkMwazdaMlFmdkhXdkQ2NVJiMlRmbnArL3JubmtE?=
 =?utf-8?B?dU1FL2FybXdkWjdaTFJwbFFBVEoxYWY4Y1dqZWFMK2VpM0x0dW9qdks2S1ZK?=
 =?utf-8?B?UTlSUW9yQzdvZ1FJZjR4bXl3K21wYmo2cHdFS1FGdFZseVd4NmZkN2lSaDZT?=
 =?utf-8?B?c1RoUWpWRy9mYjdhTnBqRVJqWW14RzhGSXdOSmJSS1daN0Q1S3pvbEhLL0d4?=
 =?utf-8?B?VW5DQlN1VmR0N0VTY2psZHVob2RGREFpRXBnQjBpVnVxaTQwR1ZydUlHbnNV?=
 =?utf-8?B?Q1NIWEpJWlZZWGlud2pXb1Vka3dhYnIrRnA4c0sxaFdCZktVQkFERmx4UHFx?=
 =?utf-8?Q?gZ6JMR9TCO+KOgQbUV8p3rnC9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MfB2/faGvqzB9C6KptoC1W+h2N4zhRCpg9sReOJQ8YhhQXlmezecp+PXloKP7cbDKulR997M9tkYoSxyPsJz1q4Yj2HVQcqJvHcjzxKmkhF5wznIxN5GjcGO99FwQ0Ag8wk1nBQ7ia6Fe59V8mEXKtFdrGbdcX0U38eEiCLeQvekmOwJWGQQ2l6jCqplOcNr3kFuT4mgWSVMjV1PJLbOC5j+BgxcbYWJaeSU28GVCxFgrhPIT7zMjEXHA5E6tnb2N9rDzTVY4TRv1pME6JPKMswsqjAmY16/8V0/aIWpcfxgCQaSG1VzMqgyU31OqnDkh/3FWhgPM1A9ydwhisdE6uwWsLTolFd3OvCWG8F/U0paEgqkWMLfqILiGHTO4wWE+wdG3QnRSZeIseGB/Ri9xngtwyTmXOlY/s42KLdje3aYCQIo+gj57fJuxLNui+tZvoQBmayid9foBCP9H0zLA6lMhbyTYqQGacSCOpLZ98u233rPrTTahigARAqiLLGuyG1+CeUNpLTO73n2ohsa1sp8whJ9+3RzLeUE68r8E6SWZBXlgWAkNm74AGF/TkTdu0nkBVoRIClWjnc1WnWV93lPbam0cRa9zphVEI6+cfI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c357b17a-8bdd-4f52-e654-08ddcfb4f18d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 22:03:41.1477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fYcF4amJ09uz28Wtu5X+m00imq303Q+D+R2DQKE1pepzpoBtcYve5Rl+++zCbZXe3sJAJu4dHTsQOn7JuuyNqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6406
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_06,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507300163
X-Authority-Analysis: v=2.4 cv=X+lSKHTe c=1 sm=1 tr=0 ts=688a96cd cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lQAX_F9KQfmhn8gFpiUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: j6aQRmyPrViMnwjAXhn_QK41K780BYUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDE2MyBTYWx0ZWRfXzo2/RR+4Yexb
 KZeKS7CZfimer4LINKVUjvU2RXUmcctGHNjM20jXVCpwgmMvX1Fiv/bDCkHaj6esSafI85OfPxq
 71n7cdQi0BcX6ZHQciXC0lexOxekzhdEwIsfrtqBZhx9wyF2a0iuiIp4ahaIyDT+g08M0ERm4WA
 lPciHNwyxS52pgS1VFjYh29zpijx3a8aY+x1QmoKlE6CSIJM4gCIa6lKWVReZ4n9XUX24l9PPSe
 TCxjHs0Qi8zmkkamzpCXa7MAh77KmB6pCn7i05e5kFRLk5rJDJCHwv6ZV3P+SaNa28GehVyT8md
 lpt5HEin2BIjkc0C+oRlzWZkXZXan64B4VdKw/J4/uLV53e+Ylv2CYXDO15My3iNggHE1WSA7HC
 OKcpU4aZXiw2cEJqsIdpgXvio5lEsjo2a1rV4Pi7EdIfA8l/kBs+2OHziE2uy8SszG6Q2MG2
X-Proofpoint-ORIG-GUID: j6aQRmyPrViMnwjAXhn_QK41K780BYUh

On 7/30/25 10:26, Kris Van Hees wrote:

> On Wed, Jul 30, 2025 at 10:18:17AM -0400, Kris Van Hees via DTrace-devel wrote:
>> I still see intermittent FAILs.  I wonder whether there is a potentially unsafe
>> contruct at work (see below).
> Hm, no that does not fix it either.
>
> Eugene - can you have a closer look at this and see what might be going on?

I ran 40x on each of my 11 test VMs and am unable to get a FAIL with 
this patch.  I took a look at the test some more, but without a failure 
it's hard to fix.

Are you saying there is missing output (the motivating problem) or that 
there is a timeout (I thought you may have said this, but I cannot find 
where)?  Those would seem to be two separate problems, the latter being 
that a trigger does not see 4 signals.

>> On Sat, Jun 28, 2025 at 06:30:50PM -0400, eugene.loh@oracle.com wrote:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> Our luck with this test has been quite good, but it sometimes fails
>>> to show its last lines of output.  That is, we send a USR1 to the
>>> trigger processes to set off the final output and we immediately
>>> cat the output files.  If there is any delay in handling the signal,
>>> the last output will be missing.
>>>
>>> Have the processes terminate themselves when their last output is
>>> flushed; then wait for those processes.  Also, skip testing altogether if
>>> there is only a single processor to run the two, hard-spinning processes.
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>> ---
>>>   test/unittest/usdt/tst.enable_pid.sh | 17 ++++++++++++-----
>>>   test/unittest/usdt/tst.enable_pid.x  |  8 ++++++++
>>>   2 files changed, 20 insertions(+), 5 deletions(-)
>>>   create mode 100755 test/unittest/usdt/tst.enable_pid.x
>>>
>>> diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
>>> index 7f4f68698..296cfb382 100755
>>> --- a/test/unittest/usdt/tst.enable_pid.sh
>>> +++ b/test/unittest/usdt/tst.enable_pid.sh
>>> @@ -33,6 +33,8 @@ EOF
>>>   cat > main.c <<EOF
>>>   #include <signal.h>
>>>   #include <stdio.h>
>>> +#include <stdlib.h>
>>> +#include <string.h>
>>>   #include "prov.h"
>>>   
>>>   /* We check if the is-enabled probe is or is not enabled (or unknown). */
>>> @@ -41,7 +43,7 @@ cat > main.c <<EOF
>>>   #define ENABLED_UNK	3
>>>   
>>>   /* Start with the previous probe "unknown". */
>>> -int prv = ENABLED_UNK;
>>> +int prv = ENABLED_UNK, nepochs_left = 4;
>>>   long long num = 0;
>>>   
>>>   /* Report how many times the previous case was encountered. */
>>> @@ -71,6 +73,9 @@ static void mark_epoch(int sig) {
>>>   	report();
>>>   	printf("=== epoch ===\n");
>>>   	fflush(stdout);
>>> +	nepochs_left--;
>>> +	if (nepochs_left <= 0)
>>> +		exit(0);
>> I wonder whether this could still cause some output to get lost.  I would
>> actually move the conditional and exit to the end of the loop in main(),
>> so that we check nepochs_left and exit when <= 0 outside of the interrupt
>> handler.
>>
>> I am running a long sequence of this test to see if that helps/fixes it.
>>
>>>   }
>>>   
>>>   int
>>> @@ -79,7 +84,7 @@ main(int argc, char **argv)
>>>   	struct sigaction act;
>>>   
>>>   	/* Set USR1 to mark epochs. */
>>> -	act.sa_flags = 0;
>>> +	memset(&act, 0, sizeof(act));
>>>   	act.sa_handler = mark_epoch;
>>>   	if (sigaction(SIGUSR1, &act, NULL)) {
>>>   		printf("set handler failed\n");
>>> @@ -172,13 +177,15 @@ for pid in 1 $pid1 $pid2 '*'; do
>>>   	kill -USR1 $pid2
>>>   done
>>>   
>>> +# Wait for the processes.
>>> +wait $pid1
>>> +wait $pid2
>>> +
>>> +# Dump the output.
>>>   echo done
>>>   echo "========== out 1"; cat out.1
>>>   echo "========== out 2"; cat out.2
>>>   
>>>   echo success
>>>   
>>> -kill -TERM $pid1
>>> -kill -TERM $pid2
>>> -
>>>   exit 0
>>> diff --git a/test/unittest/usdt/tst.enable_pid.x b/test/unittest/usdt/tst.enable_pid.x
>>> new file mode 100755
>>> index 000000000..9506674ee
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.enable_pid.x
>>> @@ -0,0 +1,8 @@
>>> +#!/bin/sh
>>> +
>>> +if [ `grep -c ^processor /proc/cpuinfo` -lt 2 ]; then
>>> +	echo test should have at least two processors
>>> +	exit 2
>>> +fi
>>> +
>>> +exit 0
>>> -- 
>>> 2.43.5
>>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
