Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6364320CBE
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 23:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770162846; cv=fail; b=XunE+xvjN5hDX0cf9rVi04wCrJVxopreAJAa3SWaSBip2/bwLBsCkozgPwNCiumUnyjwVEeDPBhEb19Ddsazg6MtcAh+Xam1opyoJF5EIkFbIHRbEonSnPA9XC3DpVmrEndDLemX57SRAVN+NvCNGeREDMrDLTkT1XePP173DMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770162846; c=relaxed/simple;
	bh=bjxYA2WbaMCBZ4DtD3ds7USb9CqGov3LPhnOmBApzrs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f3pl5zqdXej/axEPS2PbEnQHYARXGV0o4pBEeUOPaikQgD61svO8KUXsv+B7WrfG6HE3VXJxgrB5BIyeQzVS7n/35Bgwm1h1ZIKZ5hiav8JEX1EeF6Shy/3siz31UElyJeXv2xqckKR0/Qlado+e1TQN5P4HI7FYdMw+El7+rlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QOizSr4c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I83Hh/jG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QOizSr4c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I83Hh/jG"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IuFOb318462
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 23:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wHidio8ZFOEzjHCOYcHx6G9F1KpS5aRJ7AE1hDZXB9s=; b=
	QOizSr4c2wC6DnjB9ajr1k7eW5lS8NFGqgmZwSKwphtSlVk0GkBOUajPtWOquLST
	ozBJir97w9J7J3pRs35c/l4vn1u1JVmSdcmeaTDpEwnhHAz5NxqwtdeofZlc/X/E
	oWcNTBRR9yBFXwQ1JDG3tDo2/8vtnyVYqn4pZYn944/5myYkgTMv/+aMXnEi7ySm
	JtcNGHHTUrz3BA3j+I8hg/NGJHuVybcdi+npcVmG/iQMRD92bzF4OLHbXS/JPeUH
	NtX6sJzMEBKV3gchv9ZAQw8Gn/bse/kwAIlVNmWFmR2OWNmrycuTtnpzd0fPk2re
	3NjZ2Y2BeIe3TzLSWft4sQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3k7uguv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 23:54:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613NLd2f002081
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 23:54:02 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013031.outbound.protection.outlook.com [40.93.201.31])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186n4jen-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 23:54:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnurmFqF8IPg6BzK3guYHHbdNf552lEIy2K2LWoPLA2F5Lr4rv2MMMNu7yzVVR+GeLqbYjrmSbOoIEHRZuYJYI84IVFzKZqyVMNgAtoCAG0mb4dWIctV1eHaUar6SmzlFeMn1P1eucO0AyXsuRWWwoCe0jcDo74xvKR0R5y4VpPv13piLyVbI7fje9hhlWhAJWcQtPcCllSpJH+RYeYJxnggZ+AE4aalpaBb//+2Bi21jJGitZWhqL7C2w8KOvQZs6ZSP8Pu3/EUePqR0l95/k+iswiQ0wyr/uY5iQYjfK18FT/pYvJuvnEfbq0t7R4/jvJv2QJL1veTMXFXunWg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHidio8ZFOEzjHCOYcHx6G9F1KpS5aRJ7AE1hDZXB9s=;
 b=Z9N9eeAsTwfvXUvjgbtYM2ZbCfX3KvMYmN8E1/cDH401XSX3xuvWrXfGaIKL3+LN+3GbsMd7h+Lloyrqq7CkW4fp/3LMohglViTemSK2okD+N1fTzOuPqROcveO57ivIYTcWtSvc2XMnnJk/7S9XJyZmxktt8zUCaoKykFnP/XC1iVlUMoVvqGhUw1Z+ZPOkvpRreZ3zCKTHDfHYOsixulWtC/8Vg1DQeYXEMwtRb0lmsqHxTT2NNVnP8QeZExdfde8eyeZ+gjJ/qY2uELnZ9kr3QU1cQBJfQq9KazbIHB7NApvMHRyOtY6m2al/vSMHDhzV/MVaOYZbEsOa5p777w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHidio8ZFOEzjHCOYcHx6G9F1KpS5aRJ7AE1hDZXB9s=;
 b=I83Hh/jGcFQ/r27sx6qP6GqMse30TQS8AgLTV30c7aqHAyL4LWopDQLl6jSghm+MYkVRLT3BLY50XJZ2PkynktE9O+8aqdUEfdKyRbEk8gw1FNTf4Z5RL6LhAaU7lLIBwBof5grVI+2VAlp4QmfvVTTWH5vKq1UcYa49n+SmQVk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB997557.namprd10.prod.outlook.com (2603:10b6:806:4b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 3 Feb
 2026 23:53:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 23:53:59 +0000
Message-ID: <a1d50720-a420-9171-d1b5-c3deb4f746a7@oracle.com>
Date: Tue, 3 Feb 2026 18:53:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] usdt, stapsdt: fix arguument handling for multi-location
 probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <aYJ3Q3oBklx1lGAQ@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aYJ3Q3oBklx1lGAQ@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0076.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB997557:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fe2796-98e5-42ad-603c-08de637f7fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnJwL0VuOUE1WHlsSFFEanZOczhQTTNaS014Z1VWTlBpeGJZdHczOFNOWTgw?=
 =?utf-8?B?UTNtWUlTWnNPc2srMUppNDIzNVlVaU1GM0VNYVBZVnYvZDFXOGttUGc0SFFY?=
 =?utf-8?B?cU5kRlNIMlRoNG40cGgwVW5zaXZDV3liUzVtOXJYVlM3MnJYUE43S0Q0RnBP?=
 =?utf-8?B?Vk9mUWR5YWpxd3dyNDMxcmR2bEx3R3FyWmZRU1ZpaVhZLzJNaWx0dFhobGNE?=
 =?utf-8?B?SWZKSndxbkU2dmZVRXdwYWdCUHFCMkNIMkFWL2RpWmtGdXR6RXZtenZhQWhs?=
 =?utf-8?B?RFF6Y0p0T3ovWDBkZHM5ZzlkL2phUmhaMWliakhSSXhjSmIyTEE4dml1aDAz?=
 =?utf-8?B?TmhYbHZ2aE5SNzZYY1lDMTlsc2g4V2lkWW5GK2pCWUJKdml3NjBiR3ROOFQw?=
 =?utf-8?B?T1Zod25mdDNIT09oa1pqMmE5SXBoUllXa3NjQXh0N3kwOU5oOS9ZbXZCWElO?=
 =?utf-8?B?SjQ2dWhSbU9kdW1zd044aEdvblNFVitvT0tFSFhES3pMUy9OLzFvNjVCNFVR?=
 =?utf-8?B?VVBydzkyMmI4NldJTHBLMXJSSmJiSzcvRmpJTXAwVTNsNWNSRFpFRWdTaGNL?=
 =?utf-8?B?eDFmWXU5TlNSYWJkK012U2xRWHlMTUVyK00wOWxRbWJEOG1kT3piUWRJOUVy?=
 =?utf-8?B?THU5UGlHdTJvM0xhZmpONkdnSDZkWWxYaVNxMjRDYXJQbTRNZGNGeWNLK2Q4?=
 =?utf-8?B?RUV4TTlwSnlXWmtNTHVVT1lyaHFqTzgzZnlCdUJUU0laUEh5RUZpSmsrRW1H?=
 =?utf-8?B?eGNOR1pzaVlZZlVROGJMSjArZnlYYzk0VWxaMG51VXNKdHk4RURiN1NTN0dB?=
 =?utf-8?B?cEhITm50RCs5cm84cFJWWFhhWVF2dDNQTTI1RTZlS0ZBNzVZcjlLTUFhcUsz?=
 =?utf-8?B?K2xVSndkUFpLWFJUZzNjNzJ0NWZrY2JWUHhXb3o3V0xGWTByS05CTWlERHE4?=
 =?utf-8?B?elA1Y3p3VmFkVWVvdFZGK3NNNXQ0OEsva3pLRXI3bEJvTy94R0xrTTROME11?=
 =?utf-8?B?d2xGaU4yb1BWa1BRT3NZbDF2cTZCMUpudFZubzcwcklzTERDdnhwUWhKamtK?=
 =?utf-8?B?Ky9aVSs0cVAzdGFqeDFPU0djUmJpU3RUM08wZ1hNTlQxMlpPRGtmMjVFVjIx?=
 =?utf-8?B?L2VSeCtaZVU0Uk04TUkwUlBZMzgyTFBxL0p6eHV0b2ZnWEV4MWNuay9XUy82?=
 =?utf-8?B?Z3phbU1DRlJwM25IM2NDSGUvQkFZZkhKaC93RUFrVU1ZT0k4WHlsc05uOUQw?=
 =?utf-8?B?RnhuakhRYzdZSkxKOGhjV3pqMXIyTFJzanN1aW8wRjQ1SEh6cDU0Y2VKa0tN?=
 =?utf-8?B?RWtUVGJ2Y1VtcndWOEp6ZVFPeWZNc1RMYi9yTHdrY0R2Qkk3azVZSHJPQVR0?=
 =?utf-8?B?a0hUMElLblZLN0FLVU12VTRHZWFXRWJQbllLaE4yUVdZbHczWHgyd2UwZlNi?=
 =?utf-8?B?Ti9XUC9sclJjOGFLdGVRN042Q3BZbFJHMVF1UkZzNVBOZ1dxQWZmQjNpRE1C?=
 =?utf-8?B?SXQrVlcwNEQ2dkhFZFNVVTdXRzM5WGdaUFQydkNpMEZlL29KTVlmMzZ0NE96?=
 =?utf-8?B?azdZQ1NUUTdZNWNiMlNPaWpPaEp4UlRWZEpLVm1ZcDJ3TXRaTmRZem5CU3lI?=
 =?utf-8?B?Y05zRFBmYTNJK3ludk5YTWZYR2lXaG5pbDd5dGtUdkVJYVFnZU1HN3UwZnpt?=
 =?utf-8?B?V0p6YVU2NjY3U0tsN1gyTlFuSWZudFFaeWxBQ3o4Q0RQUkNFSTFNK2Q1MkRx?=
 =?utf-8?B?SDRVNDVJbVlWTFdVYlRpVHVUNFVva1Ira2hmMkRlWnBZMFpYam9RenQvL24y?=
 =?utf-8?B?WFJXNUFsVzE4ZmNla2hjSFNXQm4vSE9JbjRXVkNnbGNyY240ZFJkZEd2S1Zl?=
 =?utf-8?B?MDlhQXNnc1pvRCtzaEYreXN2YU1UQk9wNW9PUStOTU9qbXQ2WC9NK2pEdzZR?=
 =?utf-8?B?alNnSEJwazZkbXZ4Zmo5Qll2Q2dPTUdUMTloRWhaK091OVZWVVkvN2d2SmVz?=
 =?utf-8?B?eVcxWEkxZk1qbjd6czNDVXo0L1N4T0ljMGJaWHVFWExlWENVRi9wbHBkbzhh?=
 =?utf-8?B?TGJPQlVRMjQrUGd0MU5iaDNoQlpYclM4WklnNFJtcTh6bnMwYVFVSEdPMHV0?=
 =?utf-8?Q?bu0pi8Lpm1NeYUBBwFrmgDgk2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHI2NDJiSUNtYUZpWHAzdWJxcG03ZmJ6VWVPKzBVazNHdE40N20yUDAxbFRn?=
 =?utf-8?B?dXp6NHloOXFLREJ5Y2FyVWZDbW9Uc0xzd1dyRXVxcW9NN09JVjY1bWhBSXJH?=
 =?utf-8?B?OHhEVHVGdTB4elhDZmZuQTUyc0JZUEtYUWNjTkpCNFlyZkp2VXFkVWs0WDEv?=
 =?utf-8?B?ck0zUjVCQ2FTMmdKUWFiOXJPN3VWUkkxVy9nTGs2TzZqT2pncXhpOHE3TnAx?=
 =?utf-8?B?b0dabEN1K2pCNkM0QjBkRUk2MFlkYzBrY3NqK0lDc1JoZXRad2dxN1ZHOVhB?=
 =?utf-8?B?RW55ei9IcmdBQm5rd0tFc2M2SlZqbzZybHFNUkw4THVHcTVHZ21PR1kzdWxn?=
 =?utf-8?B?MnQzaXorWWYvdDdGZmszQm1wM0tDVXJGaml0Z3NIaTVneGY2bzVzck9VTEJF?=
 =?utf-8?B?UWV1NEJVbVFUcUphR1hpd1hQWG5Jc20zaFRLdTd3R2E0NEhvV2FOYy81emlx?=
 =?utf-8?B?REVGdjJLSlkxRGkvU0Yzc3hCT0ttaWpvN3VpUlcwQ0dkSTJrL3V2MWhkMHhn?=
 =?utf-8?B?TXRXa1oyODRydXBLYWNUT0U1MVlsakplaVVidmFJd3kvOWdBZHozRTd5Wi9D?=
 =?utf-8?B?MlRNV2VXS0JSNlUzUWUzaDQ1WE01eGI2bHg4WEEvbG9jVVlqY2llNjJBelJs?=
 =?utf-8?B?NUJjMXVKL2cxWFl5VkZ2TCttQ2R1YXRrTzdWQ3R3ZVJvM0xxR0JrL1dVNVh2?=
 =?utf-8?B?My9wSmFrdWg3VHErUm9mUWFnV29HcTdrVjEwZHNjR3dDVnNobXNwZUZpbzJH?=
 =?utf-8?B?bTZnaGVWSVFlbEVvVy9tckNBdy83QUQ1QlRYTEJscjRlMDBpL3lEdVBKT21a?=
 =?utf-8?B?ZXJQSDBUd1IrQ3c1WTZYTElib3czVmN0MjZmcXJLaGpEUnV6ZGxWVGxKS1dZ?=
 =?utf-8?B?Q0JFUkRxa0lpOWVlOVVxRVpUWnBZVHBoamZTQmNMVXdDTTdFcHdDakI3bFhj?=
 =?utf-8?B?SDI4di9JS2lQSTg0b0FjSkdaQ2gxcTZ4K0lmUlc5WUJ4M2xUWmpWTjgxejRn?=
 =?utf-8?B?bUJDZEM1MEUxd3B4Zlp0Vi9oSnVPUmpZMGg0UVZMOUh3NVFxS3VhMHlpSjRa?=
 =?utf-8?B?Y0VONnhtZG04N2h5WmZhekNWeDIva3ZKdTF6Z2JqR1pNN3liTjZlcHRVbHhx?=
 =?utf-8?B?Q1I3TDJXaENLL09PTUJ3YjUwc2s5YitCYVBUSUQ1elo4ZXo4SUxSQVd3eC83?=
 =?utf-8?B?Q0hZWnI3YXY5eUJ3cm1IenpKQUlCdXRPTzhqTzhwOTVJYUM0QisvaXgrVmFt?=
 =?utf-8?B?T2xUU0N2d2daQndxOG1jTDUreVYvaE13NVoxMkc0WUNFQ3RUTmg3ZDdJRjZl?=
 =?utf-8?B?ZUF0V3ZzZi9vd2gvMlR0VnRaOWErdVlkY1ZEY1o2dFhzRHJ6K25zY1d4SWhQ?=
 =?utf-8?B?aTNpVVU5QkVyamZiSHpWWU12WWtEYXEySTM4dnRNbjlmd2FKSjJyK01VZmFw?=
 =?utf-8?B?eUFMQWJyNGZZalE1Q1BQU0Z6cGgyUk5Vb0ljL2tSamJLWDVTeHFoWUFnUnFL?=
 =?utf-8?B?RFNQaEN4bGVLU3Nyc1h0UnVVd1lDdVg1b08wSUZERkxBcGhraUNNc1IvRnM2?=
 =?utf-8?B?SElHcWRYSHoxcXdDZzV4ekYzTFduUEhHT2twWVV4a3dsYWdmRStTblBDaDhX?=
 =?utf-8?B?dDRYZXhGWURQZkQ1SFVoRFdpTG5iWVVnV0lORVRlUG0rWkh5ekVTMVpFRTUz?=
 =?utf-8?B?ME85dWd1UE8wKzltcVRWcWdkWUFqNGJaTFNlTHlZRVJDTHBJVkEyeDA0RU44?=
 =?utf-8?B?bjZSZVNZK21BVFRhUnVKUEdicXJ6L01PMCtWc2M0WGRtbW92MWkzclFCMlg0?=
 =?utf-8?B?V1hRMGY2Q0JUZmsxd0V1eU9XSzFrUGxLSDRDMnFpdVNNSjQ5bElNYTRQWk9l?=
 =?utf-8?B?ZUxteUd0bzNHbzFnTFJMaEhHSjdRVDJHa2xYQXdqNTdDRkNEeUl0ZWJSdnNL?=
 =?utf-8?B?aEFJdWFibTEzMVdDN1FRWW91TXRuNTFmdE5UMXlOdDh3LzdnWlhHNTlRK0lJ?=
 =?utf-8?B?dlpnS3lxS1lhYk44ZWU5ejF5VytkL1FpaW1TSW1OL0dBN1hsVk5QZDcwZXFm?=
 =?utf-8?B?MytvY3NObXZiM2pqQmlzUy9Ob3JzSndxMVJZejQ0SFFTbUVPN3h3ZmVWZ2dy?=
 =?utf-8?B?VUVVdExCTDJFN2xjcTJ6eXlRWlNwbytKNjZ3RW5SSElPeGNkM1BudmFqcDZX?=
 =?utf-8?B?UTBjbUI0ZE9FZzdkK1RUUzZIYTBrcTlWWFJ2ME5JSUFtVGNxQ0l0azhNL3pV?=
 =?utf-8?B?NS8rMnUzTWJEcnJpby9KU0pid0JGMHMzelk2d1VjbkV3M2kybW9tQllkNHVT?=
 =?utf-8?B?RXBUR0tTZ2lGQWxQa3VIYWhERWQveklZaWpyeGY1NjJ5TCt0d1NKZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b8iX2ylVHYto7hTcVMEXkpKaPKHy0w6DPoF/jFuR+ANF/Tbp0mn+svN2I0g3QymqcDIlldyhMOx5ma4OyuKAsl2poNaXmcQ6Rxe0iRaUHFOfpPB1m0heVLJkRQ+Dhu9+XbaOxtMdHWR6tgiYdUNtD/j11SC49fFLoGXo0LOxhgoAUArtYkW4KXjmB0sQMuBFqo5rOILTRjXq9gWEOD3ObN0mL3E27ai5goG8JCmbcNODfO8YK7PGGismWuq+GJcuohUC7LjtBm459JIbBBm/EyuFN8lDSZdcFMmsdaIeNfqRFWBsgPz9dUHaZXS4nhWFqqv9MgeiYb75mNd37uVU1MiGoM3JHtlJxouGM8j5zVdsgHKYmmWo+h8d5vQEqsR/2FhYlObE7OiZgmXlkjYNUmd4+EMcg8ueoafrDer+9vtb9F1IFLViawdY1pLyxH6nfzj0ztA3MzQVpQrJMB4Lmjja5daO3inRm0swi2+bAhlaZ8mEm0TcTKmRZiL9kYZgo4Jm3BSrBU2SSnTlK6sHW7IJ+n/Kbe/xYZHuW7QR96Wh+EMCpiX8sql/6nKTTU/bZ3WdCIq8p04EsrMSudDb/kRb7Sk1rka4OALCWrSfvwo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fe2796-98e5-42ad-603c-08de637f7fc1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 23:53:59.0547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMUlYuN1xOTgf/2bqHN+A5hes6iNfdyM/9VtsYnbO9H9R2yhg9UyNBnUyPAl5BszblImK4CzsAawdmdL438Mrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997557
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030188
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE4OCBTYWx0ZWRfXyszPl4TxJNKN
 8kFOIZp2JpO4DizwHx3qFBty5x3F+AFQPvZqW1FOXQ1Y/C2IbzppBnpsXprgu3lcZJ+/TymIWHI
 LrRWfcOh23ysHyMPqaNloMjKdQ9gFQxTcGHbnWu6kFP8yYcax+odAmI6YbsTNiYceKpQtAPBIL5
 X3pjrP07iRhD+uhu7heVkE7mxC4OT1E0jMjpTNEGemiHV7Idkmk2+38r3XselvfwyAwXsok4kMF
 vA60r7LCskLF41Ref40H1IfXw63s/JueGniOvm8LgG9TfSnX9ntUZ/zuOloXsjLfsEea3mSpsZZ
 U3QxiqcooQkrBjplqj/aORjOUGpY/3WzY2mxpsFt/DjgjTm9eELPwV/yVQuMqUFirxuThQlhZSw
 vPRe81DGA+I7PLJ4Wvqfo0vlOx5a80VxB3oWRBrXLfLND/tl/A00p3dYO4+Jb5ODgKSi9/VIiuI
 K2AGoUJv0zWoDFsZiJvJRWJxkgSMTBLXWUFglZdU=
X-Proofpoint-GUID: 5vFosi-l2KdTVs5mGqnqWlWUMSQII8X2
X-Authority-Analysis: v=2.4 cv=Z7Dh3XRA c=1 sm=1 tr=0 ts=69828a9b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=ivjqQoigMlVgDZ1Y4eYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12104
X-Proofpoint-ORIG-GUID: 5vFosi-l2KdTVs5mGqnqWlWUMSQII8X2

s/arguument/argument/ in subject line.

The commit message should include "Orabug:".

Since this is right up against a release, should this patch update the 
changelog and NEWS?  Or, a separate patch?

The tests define CC, but I thought we were getting away from that with 
commit aa63660a7cfc ("test: allow overriding CC, OBJCOPY, OBJDUMP, NM, 
...").  And, yes, there has been some slippage in that department.

Typically, CFLAGS picks up $test_cppflags.  I didn't bother to check if 
we want that here.

Not a big deal, but test/unittest/usdt/tst.multiloc.sh has an 
unnecessary blank line in the D script.

I quickly tried the test on one system (fwiw OL9 5.15 x86).  I didn't 
bother to investigate, but I got:

test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh: Running timeout 
--signal=TERM 41 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh 
/home/euloh/z20240321-systemwide-usdt/zdir-src20240611/dtrace-user/build/dtrace
FAIL: expected results differ.

-- @@stderr --
dtrace: error in dt_clause_0 for probe ID 5067 
(test_prov2322957:test:main:args): invalid address (0x402010) at BPF pc 252
dtrace: error in dt_clause_0 for probe ID 5067 
(test_prov2322957:test:main:args): invalid address (0x402010) at BPF pc 252
Diff against expected:
--- test/unittest/usdt/tst.stapsdt-notes-bug38922360.r  2026-02-03 
15:07:41.656410179 -0800
+++ /tmp/runtest.18439/test.out 2026-02-03 15:41:13.250649966 -0800
@@ -1,3 +1,4 @@
-test:main:args main
-test:main:args main

+-- @@stderr --
+dtrace: error in dt_clause_0 for probe ID 5067 
(test_prov2322957:test:main:args): invalid address ({ptr}) at BPF pc NNN
+dtrace: error in dt_clause_0 for probe ID 5067 
(test_prov2322957:test:main:args): invalid address ({ptr}) at BPF pc NNN

On 2/3/26 17:31, Kris Van Hees wrote:
> When a USDT probe has multiple call sites in the same function, only one
> of the probe programs retrieves the argument values correctly.  The
> probe argument data is collected for the first underlying probe, and then
> skipped for any subsequent underlying probes.
>
> Since it is not guaranteed that the argument description is identical for
> all underlying probes (although it is almost always that way), we need to
> process the argument description string for each underlying probe.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_pid.c                            |  9 ++-
>   libdtrace/dt_prov_uprobe.c                    | 10 +--
>   test/unittest/usdt/tst.multiloc.r             |  3 +
>   test/unittest/usdt/tst.multiloc.sh            | 67 +++++++++++++++++++
>   .../usdt/tst.stapsdt-notes-bug38922360.r      |  3 +
>   .../usdt/tst.stapsdt-notes-bug38922360.sh     | 52 ++++++++++++++
>   6 files changed, 134 insertions(+), 10 deletions(-)
>   create mode 100644 test/unittest/usdt/tst.multiloc.r
>   create mode 100755 test/unittest/usdt/tst.multiloc.sh
>   create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>   create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 6f93123f..a379a0fe 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   		if (strcmp(pdp->prb, "*") != 0 &&
>   		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
>   			continue;
> -		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
> +		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
> +			char	*p;
> +
>   			psp.pps_sargv = prb + strlen(prb) + 1;
>   
> +			for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
> +			     p++)
> +				psp.pps_nargc++;
> +		}
> +
>   		psp.pps_type = DTPPT_STAPSDT;
>   		psp.pps_prv = prvname;
>   		psp.pps_mod = mod;
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 6d1c0f65..e575b072 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>   	if (!upp || upp->sargv == NULL)
>   		goto done;
>   
> -	/* First count the arguments. */
> -	for (p = upp->sargv; p != NULL; argc++) {
> -		p = strchr(p, '@');
> -		if (p++ == NULL)
> -			break;
> -	}
> -
> -	/* Record number of arguments, and allocate descriptors. */
> -	upp->sargc = argc;
> +	argc = upp->sargc;
>   	if (argc == 0)
>   		goto done;
>   
> diff --git a/test/unittest/usdt/tst.multiloc.r b/test/unittest/usdt/tst.multiloc.r
> new file mode 100644
> index 00000000..06b0c94d
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiloc.r
> @@ -0,0 +1,3 @@
> +test:main:args main
> +test:main:args main
> +
> diff --git a/test/unittest/usdt/tst.multiloc.sh b/test/unittest/usdt/tst.multiloc.sh
> new file mode 100755
> index 00000000..aa8ea2e5
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiloc.sh
> @@ -0,0 +1,67 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test covers USDT probes firing from multiple locations in the same
> +# function, verifying that argument data is correct.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS="-I${PWD}/test/unittest/usdt"
> +
> +DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > test.c <<EOF
> +#include <sys/sdt.h>
> +
> +int
> +main(int argc, char **argv)
> +{
> +	DTRACE_PROBE1(test_prov, args, __func__);
> +	DTRACE_PROBE1(test_prov, args, __func__);
> +}
> +EOF
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe args(char *);
> +};
> +EOF
> +
> +${CC} ${CFLAGS} -c test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +$dtrace $dt_flags -G -s prov.d test.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >& 2
> +	exit 1
> +fi
> +${CC} ${LDFLAGS} -o test test.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >& 2
> +	exit 1
> +fi
> +
> +$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
> +test_prov\$target:::args
> +{
> +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
> +	       copyinstr(arg0));
> +}
> +
> +EOF
> +status=$?
> +
> +exit $status
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
> new file mode 100644
> index 00000000..06b0c94d
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
> @@ -0,0 +1,3 @@
> +test:main:args main
> +test:main:args main
> +
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
> new file mode 100755
> index 00000000..4678a415
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
> @@ -0,0 +1,52 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test covers stapsdt probes fired by the STAP_PROBEn macros, verifying
> +# that argument data is processed correctly when the same probe is used in
> +# multiple locations.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS="-I${PWD}/test/unittest/usdt"
> +
> +DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > test.c <<EOF
> +#include <sdt_notes.h>
> +
> +int
> +main(int argc, char **argv)
> +{
> +	STAP_PROBE1(test_prov, args, __func__);
> +	STAP_PROBE1(test_prov, args, __func__);
> +}
> +EOF
> +
> +${CC} ${CFLAGS} -o test test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +
> +$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
> +test_prov\$target:::args
> +{
> +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
> +	       copyinstr(arg0));
> +}
> +
> +EOF
> +status=$?
> +
> +exit $status
