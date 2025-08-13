Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F19B271A71
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755116469; cv=fail; b=WPXpT8zQQq85R9+A34ZImPCqFTTXqI//O4/3DnDYN5gjpKIhbkzX4mn+c7GMt+Ow2mlv8lkYSDf1dQlyNCcdWe/lh8ftLRZ3VYsoAjOmRHCOT63/VrHAyOyFyua2UQLNAT5Og4a6eEFCoEylKAi+FeWdpKhjCliylPy0MS+TQEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755116469; c=relaxed/simple;
	bh=aySKAKOjiDEUk1IjQTOnJyUuoPrzrc+MAkYmZab5ePk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mi59McsgC2K1XWyL+CR4D2EpvsU15KV4kXur2p5OlfnnZ+YujkQOWT5m0sLqc3V/GqfpiMqlawXlBFwduo37nAFqcBBivMWOMLtpcyLYs5Lgr524bCRilb29I4I9U5VHGxf4z9oD+2kCANb3GXGHTgPqVfAf77Swx2/+VnecsYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rQRBVDRQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z0UTsyDV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rQRBVDRQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z0UTsyDV"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DIN1NT006463
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=g/t7Q3cBrO2MZWLM8+BvjOshA4Fj7qCd962rpa3Qq84=; b=
	rQRBVDRQiLV9jECvC8J6yIhf+e5f5Ablj7J2RG1vukXpnW/tAuys6f4NuLexm9G2
	QmqF21Kx9YT9QsRetByFJquh4lXC0w0ccrg+0LIwfx+BlaSDcrxdFwnJ8+9IqKpg
	7GN+rzDAsTh4/waD/uKVKnSJHDzl9uuYj3HFPk+iw8qQRAuBdL1DkXNd0EP5sBz7
	mSlUM8kO8zM7QWVL5/GRLXPUTUbhYh0aQqQeOpkx9fVQkNaJ8ZaZvOSsXdCLwr2r
	2oljEJwMpu0CXKJC4ru1hTRRVhpcW6sC/F77MiQP3ePof1EmIBSgD+qD6k08KhLC
	W/SlvEZS/yW1GcD+qD16JQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8egcx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:21:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DJovju017411
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:20:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbv8xh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 20:20:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiPd1w4bKf/H78tFqQhYz0CWIwfMdIcJodMaZMdO6TJjNwe2nSAyHDGglMNCzj30I2kZrIh4qRIRuSOfGyFNuQyL3CEUiw2+NQW2nbuasWWbHZy1p2ZRD8bo+tcKvSUGzqWWtBE5UJ6JgrLMOqZC8TfH7Yp7ScdIKg964CuqzD59ZaBz0gmreIRiXl90QiaBuFPuwyNDQcr5q5hhLXB0MjzaVYx14DSj+LYvKlw/SYs1rKaiEPo5zToN1EPIqdXUtimxsArbDjvQui3UNZjikacSRrd4QBgz2Sp9hBF3w7NxOpFrGOi3LMmsyrJRG65A4SqIp1MtpGrUkhufkrQlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/t7Q3cBrO2MZWLM8+BvjOshA4Fj7qCd962rpa3Qq84=;
 b=blrWlr6ZNZvoHXnVamciH7fyzYXd+YULy9d1onN/AUPF7wnfkSi01OEqOd94BYboY/59/ELVQj5InoTagBAfoSS8gmcOYwA9QrerXN2/0lsjsEVOF+IpNjbWhPlnRkPkbeKI0eCZ4lBXfRaswBzt3PK19hqkIpMZgEx74Af/Sli+Lytc4gG+cpU+TKlKozK1XTKjW9Ty9IBBl0B2brUUPVhvj1qWLq1yQTvFg5HgUDPF1p0URZocel/aUnJrU3VXw5gId2c9GsXTCO/GOS9th/ZZRbs83wTZGw2Xv50qwGsfVV4/N7n1jpnkXP+8qOqyeOwamIUWEpfZgwSwv+RLkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/t7Q3cBrO2MZWLM8+BvjOshA4Fj7qCd962rpa3Qq84=;
 b=z0UTsyDV52B+HrjT6kXV9oWOLb+qFK9RJPNnOzjJSj4tocohYhOiD9hIRpna31r3T8ls5b1VloC6gMA9GeGf4zYOZ0SBZM0Bip1mJlOZd1qrsTnL9JEn+DCqBsdns9CAlK+oOR9JfXVyzj+i88/N1R+l5ZzzrJNn+UodEOzG+zo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CYXPR10MB7973.namprd10.prod.outlook.com (2603:10b6:930:dd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 20:20:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 20:20:49 +0000
Message-ID: <d639842c-9e86-bcea-e490-912e1019c9de@oracle.com>
Date: Wed, 13 Aug 2025 16:20:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] test: Skip trace() of a 1-byte struct
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250325222521.15224-1-eugene.loh@oracle.com>
 <20250325222521.15224-2-eugene.loh@oracle.com> <871pq88hk1.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <871pq88hk1.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR14CA0012.namprd14.prod.outlook.com
 (2603:10b6:208:23e::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CYXPR10MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: e9b4827d-a4c4-4840-9edb-08dddaa6e4ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmZ4UUpRTDhUZUNLRlJOWmxWbmZqWHNzMVkvL0EyRjR3Zjg5bnZjMk9HQUpW?=
 =?utf-8?B?cjgvOWZQQkpCVVpxT0NKN0N0OTMvQk16OFAxblBwYUZWSEpmZXBoYWtvZ0Z3?=
 =?utf-8?B?NVFaajl5cEw5UERDZzlwZnJZNy9UQ3ZxblRjV2xOYnhRYUt3aVdmRkV3Rm50?=
 =?utf-8?B?bGpjRVZSRDlRQ015U2x6NVVNbGp5WkRBYjJmSkxRWG91TzFDME1pQTVRc1Rn?=
 =?utf-8?B?dWhpM25VMkk4SEtiZkdUaytVVkY5WU5SaCt5bi9iK3h1cG1ZWDVzUHMzd0px?=
 =?utf-8?B?aXBxbzBRb1V3ZkdUcmJFSWdGNk10RHNISmZMSVlOWlBURDV1RVJCWUFuZkRh?=
 =?utf-8?B?NEwzZ1FwTlV4RXFDTXJkZGV0NzgrNVUvQjQ5bVlnYURDdDFFSGpzUktpMkh4?=
 =?utf-8?B?cjZNdkdnTTl2Y3lLeVlmOGdyQzhuSDE3bWRJU3hjTStOUThqT3NYVCtIOEVt?=
 =?utf-8?B?ditBS1FiV0NHNEtzdnQvNnludTIzSzJocGpyT0VlVldXZGtrazBESWhtZzZF?=
 =?utf-8?B?Nkd3dVMzZFcrSTl0SGVBVm5rZ0ZpMU1uS1R5Z0lPTXdDbEsrZUI1QlR4NWU4?=
 =?utf-8?B?ckhiNS9lVHFBRFYza3hWS2owZXJIU0VSVmRpaUNBZ000NjZqQmxsaEc2ei9E?=
 =?utf-8?B?TVdUU2w1ckRUMXhsKzZIWGlHWjVFbStyNnphYnIrTElzMzRvdUFoOFNCTGtw?=
 =?utf-8?B?WXZWVU9PNU12WWV1N3BuWERibjJkMjkvTTJrekRHeTFCWDRoT2lNblkzaFF4?=
 =?utf-8?B?aUJ1dnhtOWY1bVpuMEpzY0owOVloR1IrL3NWUGRlTllEdTBrdXNOaXc5LzZ5?=
 =?utf-8?B?WUJtSFhUSVpld1ZCZndBVUp2Z0tDTitKeWlpTy9jUm85UUNpU0RiV2lkNlBP?=
 =?utf-8?B?RHJDZi9lb0lmY3d0NDlmb3l5ZzNySHZuTlIwRVB6WEhubnFPMnMyZjYvVmxx?=
 =?utf-8?B?dXpibHZsbk12MW05RURsRzAva0lUU094MTkzRFQ0dDlGdTA4ZHhjZlQrZGVW?=
 =?utf-8?B?aUdkbXdXVU8zS09ZQUNqeWxKcmphYWJEZWtyWmpDUUthbUVqanFvcVJlUzhq?=
 =?utf-8?B?S0dmblJpTlptSGdHOWFicXhmYVFlRlNHY2p5VzhRdVdTbFJyejRTWGl1dHB5?=
 =?utf-8?B?dUM5NUNudW1oTVUvR3NyNnBGdkVXY0t4L2ZSa3dZSlJQZXFKTUNFQXVueDRi?=
 =?utf-8?B?MlY4bndtbzQ4NnV3dUo0Z0NRZ2NDZzNOL1FMR0ErZGx5bUNDeUo2RC81L3RX?=
 =?utf-8?B?ZlY4bXlKUU9SeDhHZjVPNEFGUmh1OEszbFVBcWFDeUpTaEpnaVE2TG1uZ2Zx?=
 =?utf-8?B?VWMrZzhOWUp0RW1OZWRIZVE5dGlKU1hTT09ONXFvUiszMDdpcjNwb2FwRWlD?=
 =?utf-8?B?aCtEQ0RoOXhmZWZjRFNxQUNocnk2MGp5bkpGc1AzemNuUUtqSWdPdUdPbUlr?=
 =?utf-8?B?eDlHRTdhcXJSOVRaTkhZVVBhQWZuNjFyTFh4TmNZMUNZcExMQXBGYnpreEZD?=
 =?utf-8?B?Rkk1WTNnWXJxL0VNcXdWN3VRYkxuV1RYbFpEYXFlSmVEdFM1R1MwODVtMG9Z?=
 =?utf-8?B?NjJwM3IvYlI5Z3V5UTBOb0kxTzNsajlrM0lZNFN1MFdZTXNOL1FpRkVvTFNq?=
 =?utf-8?B?RWFZeHNTNzd1SXJtcWc4eW9XUTVHQnMxVkxGVVNoVVl3RFVMdzN6WlRrdnhL?=
 =?utf-8?B?VzQ4L25HbDM2UWRibWRodWg2K0ZtNnM5L2VRd0hrbEhyMGZPU25nKzFvam1L?=
 =?utf-8?B?VGVRak9wK0JaRC9USndMR1gzRzc2VEtoMEVlZmZUM2FrVk00eHNTNUdIQjYy?=
 =?utf-8?B?QU9rYW1TMDgzUlNHeksvOVNqc0JzWDg2cGpoYXg4eVA2VzVYdnluMTU1TWVG?=
 =?utf-8?B?UEkwSjA1SWhSV1VaMDNWOWkzU0I0SW9kR2VZejFWbWxWL25pRGxTM0xNNzZC?=
 =?utf-8?Q?QxkegB/a8as=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1MzaFlzeVRJRjZ1UDQxdHdYQWNsQ2FXNVZlQThBY2Z5eW11ejQ2L3VGalVY?=
 =?utf-8?B?UGUvbW5uangrR3dKOFZxemZEL2duektWanFWNzZOeVp3MG85c0pNZUFEVzZ5?=
 =?utf-8?B?dDRGRVQwUHdMUXRnZmh1RnZ5R1FNNlV0RDQwbDdIaGlDdW5mbGdEdDhEWEp1?=
 =?utf-8?B?cThHK3dweTlkNzJVOUFGd1JIeVlKcUtrVDdHblBqNXV2T1VJcUxMUFNNWUhS?=
 =?utf-8?B?OUNtbWRHMjZ4TXB4ZGRTN0d6MkJvVG1CREpTNnJVQUE4VUl0RGJEcnVUZGw0?=
 =?utf-8?B?TVBlN042bXB3U2p2L0t6aUx5c1NDNVplNEZodGdSZWFDYURZc2EreGJxdkor?=
 =?utf-8?B?dTJtSWluSVRqSFJkT3ROZi85ZWVDSW4zR2l5R1JXa2tqQjBiQ204UHloSVJh?=
 =?utf-8?B?YVJLOGVMVUs4Mms4UFI2cXFCTmI0c29RNnlYNkxWZGZjbHF3bTc0TkhSMy9Z?=
 =?utf-8?B?d1BkM0dUOEFkT1BsTW91bmRQd1NMRlhSSmg4RFJmT3R2QVZVazJsY2R1UnJ1?=
 =?utf-8?B?NlBzU1NJSXU1ZzdxUFF1d2JsbGhHaytGQ0czY0tzV2kwdHNzZHZYNmVHTy9Y?=
 =?utf-8?B?MHN1dGcyS1dMaWVaL1ZHR1Q1OXJNMXdoYjVlQ0dJRTFLVWFEdnZKS0xHbWxI?=
 =?utf-8?B?OWUzelJxeGhuQ0FZbTkwZDV2L2JjanhtN0oxOTQxZ2FhRjJjbDJoWHlMeDlM?=
 =?utf-8?B?TEl3Nm1vQU13UTRRelppRDB6aDJscUVIV1c1aWNtWThDcHh5ZkFmOFF3Ujgz?=
 =?utf-8?B?UlhGK3BNM0twMXBtZlJRWEU4S09WYkpSbEtQelBlVUQybDhwNWFzcVlkOGdP?=
 =?utf-8?B?MVZXZGpXcFRhdmpPN3RCTzBmblU0TGhkeCtnUmh5N2NIc1pSdENHZlR2OFlO?=
 =?utf-8?B?NkRPY0N1WkxnTFZhMzdiUERteEEvd0ZJTFBTNEx6cURvMldZZThRM0E0L3Fa?=
 =?utf-8?B?ZHRJSFo1NENlK0F1NUlrbDYydmZrOUF5TVRLZHA0cURHSnBlTTdZTEpValZp?=
 =?utf-8?B?M0Uxa2xkaUs0eUR1UjRVVDR1b0tyb0hRcXhrMFVzWWJzWWdqUGZiL2RSVlJF?=
 =?utf-8?B?RTlZZnB1ZkJmMzdyNTlzNkZPUTdISkloRktzN21CenE3cCtGb3RjbURLSmtI?=
 =?utf-8?B?MUhDVnRUSVQ3QVRjY2tLRE5SOFk1WXJFeTVhM0ZOUExqWmtPczJUMVovSk82?=
 =?utf-8?B?RWNPUmFOOHgvVWxQUlROK2tmUjRjek01TTU2eVpackg4ZGdUQUpCZGNaTDA0?=
 =?utf-8?B?WldzZXpCOWgyblZYbDh2c2FDU3dWQWZvYXdyNVJGamdlRnFDRUVMWE5lNVJX?=
 =?utf-8?B?ZHgvSkE5U0cwRkxoNTFzNUE2Nm5BM3NGTVRaNXZUN0lPUWpRd3BsSnEvZ242?=
 =?utf-8?B?cHhvdkVESGtrSy9mc2MwMXYrUU5WZzFyb1FQbmorNVFVQlFTUWtPOWgzL0RP?=
 =?utf-8?B?Q29CNkpTR3hzRGxrZXJQV01OZHhGYnMyYVI4cEI3T2ZEVjFUS2ZJbDN5TmQ0?=
 =?utf-8?B?aXY2dktWbUNkSnp4a0lkbXhUaTRoSVFFd2hNZFk2blpCOXpLQzlPaGdTNzh5?=
 =?utf-8?B?aUZpUGRWRTlrU0tSbUp5MmhwSnhBelJvOUlSTG9QdkFHanJXV1RHQXYxRHFW?=
 =?utf-8?B?MFZscU1MU3hHTVlRSnI3Vk5ZdSs0QmVkRGljcFdRNE16VVVkT3lDdWxzYVBw?=
 =?utf-8?B?MXVySkl0cDRmdFA4Zzl0WndlN0kwVnVFbUg5SW5IV2gwV0NFZlI2dkw3K294?=
 =?utf-8?B?R1dkaXdXRXhCZnpDT1pvbmVLVGVTSUhCWUU2ZUVsQUpyODJ5UlU4a0Z0ZTZu?=
 =?utf-8?B?SkhLYUtBYnJiK3kwZkE3M2RoTzhvWGt5alFTQTRGYzhkUURkeFVPaUpLd09D?=
 =?utf-8?B?NjJUdlAwanRwUXhsM0pxUlpNMHNmU0s1Z1JZRDQ4NFh1THZYblpHYVRlQ3pa?=
 =?utf-8?B?d2pZVFdmenVna0VuVHI4U1M2Sld2UXFIbUNxbGQrb2Exdm44cG5Bb1BabDE5?=
 =?utf-8?B?M1RzY2E1ZU43OWMvSHpxVUJKU1EyOWo4b295WTNXMDZXdnJwWlhkN2R2SFlu?=
 =?utf-8?B?UGdVZ2VjQjg5WmtvSGtscG5tUzd0Y0NuaEZlVHNQdDRIMWQyekt1Vm1acnVS?=
 =?utf-8?Q?VCGEjPQjUn8UdqBAodwqcmvL7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YZzHd6oZwNWzV2Y0JOGRNBQC7MuJfDSC4lCuEfvpdrHyXD3I/0dYYiiQsxCj81jDFkIKktN2U0lsx95Kgh+X63bHPPeUlWQdOuuSBaR1o1EM5MXyZHlJLB+G7T+RSOU0DA1SXKFMHnreJKNdY1T5CERyiAMtc/1+67o+LbLrFNRJi1nU372OIHL8r6LBxgT1oa8iXeUG78oSW4x9G0hOZQhruU4WJvC7zP8J1yKqlhxbV+DtvWcWX+1atwJX99G6mzNkyaMcS6SB/q4sysrvV865lkHCnnRp42Ndr8mLIvhWOrIyo2N5N+dg5MULDTPWEJlN56uCR22B4So5R1g6DXlVjY41avI++mOJ46bhYbQuSlD2+qAIgTbKqFo1bQHEEXq/9Bj7KfO78b8PY3BSAZ48O6he2RLlSWvHG/9jFaYJu8GF43Aj+vVVe67kUNbETXcMzutBC5oj9AytYvKEm5XaAyVB2tvINqYmZxHGnJS5PKUjBlTZPNMT19Xl5N7LnVKP7hD38Uiehbd05qE1uoAzIpFzv4zOrjJSe+hUklT9/64SktSDSgNGLxtPXTmyxtTgm1o8CWCFuYlmGFcefLr5XNx2ICrKoj8phio0VHg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b4827d-a4c4-4840-9edb-08dddaa6e4ac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 20:20:49.5221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqujrNXr9NA2tuIxaRS3b6xIsoeO7uth85VCXYQJQKd/sDyn95JSAfvTOOsMA0QgksWzIBN9Lo+VkBpRUHBOWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7973
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508130188
X-Proofpoint-GUID: buEhVNB754tidaueYMvhZu95T9RAqUGG
X-Proofpoint-ORIG-GUID: buEhVNB754tidaueYMvhZu95T9RAqUGG
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689cf3ae b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LY7VU5h48jUJUNCms6MA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE4OSBTYWx0ZWRfX3I6CMBMgLC2e
 AHyzWTuV4NJBVuI+xAHguXWsSabje0qly1OhggOiSDQWN6guwNN6ZPt/MovbN3t7mU9HjcYKCYk
 0QFGhNzTK4PlzPVRzg/kHqFdzXp9DodQBb5A6JhXCfc/WfxrhKVpmRfXoouSaJM6oiXLdm/nweW
 /ei4hUC9e5TU3uDUd3GiKigoxZSsFB0qmqSHAE6MNjfhn0Y3AYiegVeWuLF/U3MVhCSNAo8ZTYf
 +cE6SWeJ88s4KAUrInY3iOrmrpOBCOpYRplNhlJUP53WMJkCJIENc8X2SJXPiaqFdj8nMY9A5iS
 VlG5b8S+4mkCxk8M7f3OOXyl7Zhd9Wy3H/Om/he1FUcjzPuqZakRcLa38iyVG5NXHIDmcC5KqOo
 RuwpoI8OdkvED6MNx3G44aHEmq7qEC9RxekkAMqHHPviUV6B/tS+ZGtdXDPkkOc56lnytPCp

This patch is rescinded in deference to another patch that simply 
changes the .r file to match the current output.

On 7/22/25 09:46, Nick Alcock wrote:
> On 25 Mar 2025, eugene loh outgrape:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> With commit 3a551bfd ("trace: fix char-array handling"), this test
>> started to FAIL.  Meanwhile, the behavior of trace() on a 1-byte
>> struct is poorly defined.  Users wishing clear semantics should use
>> print() or other actions.
> This makes trace() much, much less useful. I'd say NAK, if this means
> we're going to not come up with any useful behaviour. Why not define
> something, then use it?
>
> Nobody is going to say "look at the size of something and then do a
> print() rather than a trace() if it's too small". Even looking at this
> commit I'm not sure what "too small" is (one byte? four bytes?
> sizeof(int)? sizeof(long)? A cacheline? what?) so I don't see how our
> users can be expected to.
