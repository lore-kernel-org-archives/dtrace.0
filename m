Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6629743169
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746114401; cv=fail; b=rJi5dQ6CrPCo1AuI51X9FhhfEt7lYDN4ETF9HgvvIrS06A9U8GjwvzSHk2jDKGO3goUraRwRjdrZXW0PtlAdQIJk+mszjZLSbsIUJ6fGEykSY+A1CfaFCSxgBch4S7eA3QLsvrhin0oqfL4f4iLP66K/l0USRoqvkAKCWemc8ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746114401; c=relaxed/simple;
	bh=M4tZsKNyP45aA2De5tyW5ip1/FmnPeCk7Uwq5HCghKE=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eztvUxRi5rIdmWepcH4xeE/iOJpUsWItGPC8TgZQBsEjNlkS5ccKkmwVSFAABiyMh6+D9HCpwSNo5IF4XQ+R3wq8tsnsYdtVObIlZuJkf0sXp5odYxE8vG7Jc5YggqjRd8Iy9EppLc9BPJhaTiwa0jLNXpkIa5whwkUyTUIhZ6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k5wGUDgX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HaTb0lct; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k5wGUDgX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HaTb0lct"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541FfhE2009242
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=b/YaQsuzNtO65M2iO/ZxGKYMnslYnrc200yXOlyAjCM=; b=
	k5wGUDgXdeH9p+w56Wgd25+SdVOSFaZEY2qa0fcRylrP9QcSR7a1dn9s7SRw5xFA
	yxPIc9CEMJcwzvLlW5305pPyq+AI0gQHvOqAzF1hjD4ITVF6q+uVILI969hbU4Ln
	dpUkkl2g2QRjy1SO3AdEw2vHtFw5kxgHhpZCjPj0ULA/3NRrvsdIGo6eJJJeeDAF
	j86rG0dp5HC9XcQg6GdFv078Hp5BiEFqXr1j5+kwp89wkp+dxQu3jqM0NcfajySb
	dqFTLbk4bpR0/3jVJseHLe1xilL3vYilSOSB2lqCAZ+nxDgJiG1aaxLsF3XmzEia
	tF8G+ZBZZVLHw/7VXao0BA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ukk8fc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:46:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541EYNLw023752
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:46:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxjx133-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:46:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2W6DtbtWSvx+lhCIARcoIwXbr5fsCW9U0nGZhi3ZG/Yos1kPmWYyyXj38jcpZRDmJvazKFG2yGVQBy22gXggSkD8umx5IaSgfOkzheUASFF9tdHuF5AuMPCKFyE5vsX4yP1xUpXM2SyeejjNEbZ/L/2e4LmX2ueMriZDkEJ+8ShSZ0QeApB3LAoVK7zJ37nECZ8W6LchY58sMl8sSPlirsAMaI4XriGv/DBmpijEjP8J2Faajc88+Pw7H3XfcCHAjjk4FhW3hEYhVEArd83suvbMLyZVm30+5BTqRGYuamepXY7snIyUDrVmdpA0WgA4DfyHx7VPjhP8oFmXnuh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/YaQsuzNtO65M2iO/ZxGKYMnslYnrc200yXOlyAjCM=;
 b=baqBn6T2CIG1nlUgpprKR87LiZPDYgzTD3KcWNcbBzLZvALnmpsPbRECeiy7meam1N7tTtOhStnBcMECeB2lzaHAuUAi/scbD18riZHoFR91kDdCeKBtF7jWwCsgaGEF2XV4QN7ePvetnpxMLOmxGqooe8cKWQczXBGdEEOmJxA/JxIcMz18fBvYazO0rwvm1rYwBchlGDJkCbmpzuSysg1RUt4bp3xhm6I+QJifi52moi9R/C2JgdmRyNWIUD8qCKr4fLgEOki9EBAJmey/y+rivlJU6op+XwrMBViIS3Z2PbpUOOCyJ/d6wNyaUx9X4JMnfNiXOwMGQPoRsOKVMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/YaQsuzNtO65M2iO/ZxGKYMnslYnrc200yXOlyAjCM=;
 b=HaTb0lctIFducARF1n2WDpaCu2g1g8nfT5tB5BROVP3wHs6P7psByCGn22wXZlqe0mE2Mrxg34r1Ev+9snaQnJfenSrT1wPmssJqk9lDP3gsuOXgYSgyNDO/JCJaflpC4MPuesHx4vstIwAtahIjdf6UUKgcQ4Hmp3Y1ibfhw0w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4255.namprd10.prod.outlook.com (2603:10b6:208:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 15:46:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:46:33 +0000
Message-ID: <17a41964-85fc-a79f-3404-5d06583ccef9@oracle.com>
Date: Thu, 1 May 2025 11:46:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/4] provider: fix registering fbt and
 rawfbt twice
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ5PPF7F7BBD994367C836098EA4820FC73C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
 <b5741b99-24d1-82ed-5cc4-5840230f3784@oracle.com>
In-Reply-To: <b5741b99-24d1-82ed-5cc4-5840230f3784@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:a03:331::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4255:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ca0b5f-f783-4ee2-3cfa-08dd88c75963
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlRzZHZ2eENhcDMvVFN6TEE4V3ZpRE14ZGdjck1Rbnl5Uzcyc1I0dmNscnM0?=
 =?utf-8?B?ekEwYUMrMTZzZzdleURSdzhrVC92ZU5DckdJRmcxYkJTTHkxUjZHamEvZEM1?=
 =?utf-8?B?aGlYUEkreHp2Y3N4eDREbmJhYzZKczhpODFmbW02QWVFZDBFclRzOWZFbk5x?=
 =?utf-8?B?RWF0cmNaY0Q1TWl5NmxYWjQzbkE4QlJKSXlMM0xCNC9HUy83ckJnd0Y1cmx0?=
 =?utf-8?B?TmVUb0JzZDBYSU01Uk03ZmhQS3VST0t2ZDl5RWJGcTRXcjByK0tFOUxwOEh0?=
 =?utf-8?B?ZFQrMTI1YUQ1ZUJkQktSL3YxOWdadHJqemZUQVY2VEtYYkFmZjFFZFhKcGJR?=
 =?utf-8?B?WnZoOURvZ2FSNC9RenBxRHRjUzVRdFJPZXRpUkZRbGRQdnVURlZRYk54SmlM?=
 =?utf-8?B?dnNGNGxIU2JQTHFOaWVjeXVZYjRWTmMra0JZRTliczVrT29JYzJXS3VtTmVP?=
 =?utf-8?B?VzZLQ2o5Zzh4ZWRGVGlxY3ZkRnN0RjhZL1RCTE5hd2d4VTJsdWNJdCtzVWhy?=
 =?utf-8?B?S1hLa09aeFlaUVo1aEFJbWxUbDVJRnVFb3QxdFRPbHB6TGtYVWYxc3gwNE1j?=
 =?utf-8?B?Nlc0VjR5bVZaeER6emhaN1BjeHc1Vm1ORU1kdzZmc1NIb2hIRHdTUzcrNDFO?=
 =?utf-8?B?NFQ4NU4vQmx4Rkc0UTRQb3poRDRQamdTYkE2aGhGejVtK05Hdk00eUhxQmRv?=
 =?utf-8?B?MUcxRkJSNWphRGVDM2pQeklNSFFtSzdkRHBTUmg3MFdUQTI4WVYrY2t2OXVG?=
 =?utf-8?B?ZVZwbDZSU2ZZVmFHV2NoWmRqNXBqUGkwVUozRHBnTnN5UUJjNnNXVCtsZjJ6?=
 =?utf-8?B?cHU3RzYybzlscmZxc2tNMmNPTnI4V09CY01FdEZsZHgvek1naVE4M3ZCVXg3?=
 =?utf-8?B?Y0ZEdEpoWlVHVVNqaXd2bU9PRytTUWIrN2cybWlxMDRlVGNiL0xONDdNL0tu?=
 =?utf-8?B?VDdSQ1VYVThZK05DR3J0Q2NRMk5hSWNhcERLZDc2bVVYblpkVXlqNkRwRDcx?=
 =?utf-8?B?NCtJeGJ0aW5DUGtZUUROaHdqUWhVVzI4WFR0aGQ2VGx4WmZjWG4rdG95UDZW?=
 =?utf-8?B?bTlnMG8yb3RCT09HM1ZkUnZBMjZpbWNYVzY5NS9CZHYvN040amlPdEgrVkk2?=
 =?utf-8?B?VFNRYk5OZzN1WFFEZHhjVkFMSWJBODJLNHlrbStLczFWZ1FXN0w0NGd4SzFo?=
 =?utf-8?B?ZmdBeFFaaHhObFR6WUhqMXg3UENTbFNVaHBMS1NtR1J4czNGV2xSZXRwV01T?=
 =?utf-8?B?VmQ0akpRY1QrT3ZJWFNmcjBVcmpTdFpGakxDWk91YnRaTDZDNmhDVWtZMUU4?=
 =?utf-8?B?bnpWUFBaVm5IbDNjZ091VXRiclZFSTdGRlNwK1FJTEc4cnRSanlYWkM1WTBQ?=
 =?utf-8?B?YTAvcUE1SlJiSUlIQ2w2VVpqZmV5cVFqVE1xL0hjdGU1YUlUcGFyb2dQUTRQ?=
 =?utf-8?B?TzlITzBkSjh5Y2VsQXNleU40WEtwQXNPMGJFSTRWclV0Z0hDNC9rM1ZSanVR?=
 =?utf-8?B?Z1RIa0dJbzRXRkRrdTBqZk1MSUtPS1lLWWprUzFyaGRiNCtXYjFMcVBlUlNB?=
 =?utf-8?B?VEN2N2o1bWxZNXZYUkJhMm41eDVhVkpqc2NVakV5U1JpeXd0K2VVNWF6Y2sr?=
 =?utf-8?B?Z1hhVG5hQlFUY2U2S2gyVEJPK3RrVlVyckZXSFQ2MCsxMTdEdDhoRTJPcW1X?=
 =?utf-8?B?OXNoRmlYWHprT2haWFprcnlhcXNZeGY5MTl0R3dKdnQ5ZWZFQkhQbzlCZk55?=
 =?utf-8?B?NFNXcWhiSGZrUXlOMFVQbUh2ZDRQc3h4MXg3eFJKbDVYRUM3Y2JOdVFKeWcy?=
 =?utf-8?B?U2VXUURod1RhUk5ubDZDMkJVK1RVbU1scWM3alMzNHc4Ymp4eHBiT25EaXJM?=
 =?utf-8?B?d2FoV214YnNHY1ZPUXI0NU9DcGFLd09zY2V1SDBvUFY4YjdGQUJNZ2tVUlN5?=
 =?utf-8?Q?IST8gmPZWpg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkMweVcrNUdlN3ZEeklXTmtWTkdJNFE1WTRnS2dMalhad3R6RkxPQ0loNUl3?=
 =?utf-8?B?NG1oZUNBUXYrREsyKzRyVHhpdzJxTTBaQ2pGekRMNnlxZnhtWURVVGtBdTVK?=
 =?utf-8?B?cFFpUlRJZ09sLzBQV1UwTWlaV0tCSk8waHFaSFkxLzRpOHFFNVhSUFN0dWhx?=
 =?utf-8?B?Mnl4MlM1YVUzZmh6MEFFV2ZPek1SS3hsdkg2bXBtbG1sU1M5M2dLRHpjeVdL?=
 =?utf-8?B?dTNhbnN3dkN6ZG51UDZ6bmJmUndHckg2RGF2bFZ0Q0FWY2RFeVVJdS9rMXlY?=
 =?utf-8?B?cVF6R2k5OU5DUmE2R25JZzRoYTMwYnJYZFEwcnVVMmhQeVdubFVTbGlPNG02?=
 =?utf-8?B?a2tFYklhMWpJVFJyaGNJNCtXdFRDa24wOUFOR2c2MmNmc0VpNlJEdDY3ZGM2?=
 =?utf-8?B?UHFwRHlYNTNzNkxVNjNNS2Y4ckwrL0dVaW9rL3hZVEVSQjNzWnE1bkt3NWpH?=
 =?utf-8?B?S1pKWDBiSWQ5UVpGQzlzVnlsVGRpdTNRdU9XWjVrQjF4OFdUcjdWRHNRa0hn?=
 =?utf-8?B?ZXVrTFZ5K1J4SjBsRUhCRVVIeERmbVFQS2RSVWhQc0ovdWtpL0VGekwwYmJa?=
 =?utf-8?B?RVlUVjdTOUo2aENNZUlMQmw1T2xsVldTc0w5OEE0b3ovdFZ5UTB0VmtUeDBp?=
 =?utf-8?B?Vk0wNVQ2YVB3OW5aQ2FONUYyd1oxeXk5cWNaSjVjNzd6V2FNQmJZSHBVZjhs?=
 =?utf-8?B?VXVYQVRRd0Y0dWRQWjRPNTVoNjN1Z0ZCYzl0QUtrWUs5ZEFBYk02amNVZG5z?=
 =?utf-8?B?amRXVGg4cFF3Qk9ORnJkRS8zanBKR2xvS0xJYkt5Wjk1OHNicjEzaWV4YTIw?=
 =?utf-8?B?TDA3ak5UTjRKWEsxUEZ4SU1TOHZkdCtYNHZwM2lFSVRuK0VYaFkvbUY3U3Uy?=
 =?utf-8?B?bTRWTWdqTXppWG9LMjJlZ1hDcS9uSVNxTFoveGIwL1ptc1Y1OEdrZmZLaS9u?=
 =?utf-8?B?em9zd2V3aTBlM0pwaVdCZjRYRi9XcHMzUzBwWEdIOGxTZ2thekE0VEZxczJP?=
 =?utf-8?B?eisvcTNRZ2ZBV0k4dlMrYVZuZTZmbDd6dXNQZDg4OVRrWTNSVkhkN0ZOUDFI?=
 =?utf-8?B?cDZGa2Fpek5QY1l3Q1pzZW1aNWhoYXFmL2E4TElPSHptcGdBUFVlLy9CR1hj?=
 =?utf-8?B?ZFVsT0lYcm40UXhkZnZ6M0JybHFacDcvR2hKdTJrVmh3M1hqVVlhOUtwcE1h?=
 =?utf-8?B?Zlh3WngyWjZ3Z05mc2hDUTVMSE15NEo4YjRldFgwTFRvdkV1TmIvTFFTVWpW?=
 =?utf-8?B?RElDMlZOUnlibGttNkt2OTcyelNlcjN4aFdoeFlYVkZIWnNBZDVtRTUvL1Y4?=
 =?utf-8?B?Y3Z2Uzl3UTY1bTFHOXFiSFN5N0tPbmU0R29uQWVjd256RXNqUmo4L3oyc3V5?=
 =?utf-8?B?VUV3NVpwTGlOUXlTVVhKUU9zRmJPWlFVN1grb2FGSUl6SHhKNDBGS2dCNitp?=
 =?utf-8?B?M1NLQWM2UXpKWVBOV3lpMS9Sc043ZWthNFlOcFdSSmtBYU96MElBVFQwU2Qy?=
 =?utf-8?B?ZFVYK1N4Y1FJc0RaQWhZVHYyTmZMSlVmakNraE56dE90a2NJNjJJd0Qzbmpk?=
 =?utf-8?B?QVV0WjlNZHR1WTBHZm5PaDBLOFA5UXRzSFo4OWJvWnU4ZDdZNU5adXJocDFX?=
 =?utf-8?B?SXhYaGRsWm5MVEpiVW1LOE5QTzNjR04yc2ZQQzQvNWNCaDFBVzdpeVNzR0NM?=
 =?utf-8?B?NGJQbUJNcFRsdnl5LzBFcDI1SXhEV2U1RlBLeUdHeG9HM2ZiVUZsL1lyQmVE?=
 =?utf-8?B?WUYvdVdveFhRZkx2MlZvYUVHWGE2ZC85UkJFMjJIVmNjQXM2WTBXVDRweFhq?=
 =?utf-8?B?SlZuZi9TUFJEL3RHS1BOZWJuWmNyQ055VHpFdlpLOHVvQnVnaGRVYy9JMExP?=
 =?utf-8?B?Y0grbUpkamFLcmdYcG5wYXNrVDhQUU5TTlk3MnJvTlZ5cG9adEtKVzh2QlVC?=
 =?utf-8?B?NFZnbUFOZ3cybnVIMGtySmxRN3l0TDB2ekdrdTVuQnAwQUhjUE9kRHZNb0NU?=
 =?utf-8?B?N0c1U3VTMEtxWDRtVEx3YjlwWWE1QnBpbzg5VURXMTYydUxqSklKd0t3YzJC?=
 =?utf-8?B?OHRnZ0RiVVdkajVmazQ3UGtiSFpSaWFWbE9tTU1mRnRrZE9RK0F6OWhZcEc1?=
 =?utf-8?Q?PURyFYTvZknkUN6RavmtIqbn4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3hwmRbEEWqGfxpToRr/Ov84FwLCvABn2Pe6nFerMoCVm6B827TxFg0vzuZBmXrDCw3DF7X8zjfK+IaQ9GPa3kR4g2x6a8xj78UjKwo7dukaHXH7ysM8J6R/lhFST5AaYRksfPiOMM/WjSnzxYDObmXSp6GutGWYmAh4TeXTKXhtuon/TXyz8Jmqwbrv5/mBcvGG5DBgKNayjcrJZJJFSGfCH36psIJkQQn+xIUQMY7Nv1jpNHnIs1k1sUZV7T8ishfLsSijllBv9pcIypBPJP4kGlmwmfVG+Sf1Un+JEguH5v0iG7En8SrbMOQerh19B+QzmmvyRQm9lFMysIHscw15fqJPjM5FTmOjL6KIyZHiCgkrSobb6JaR+LR3RV6XDbW92dFA6JlXy1obYsyzkSTfUkdyvcpQrLaVg4wO4GlWDd/G3SI7Q11p/fCz3tTIvE1wd6+CFmS2B8r1T4QMV40ibNje6m4//MD2QTS+wcGROxgWTCfJMxFCVsOaqT5oalseHoXv784MAVdZxWkfpzPwYVUY+AJsTINTiDpp0QYybw9AvCf/pxrpqKJHyn9oZHge2qSUZ4Aeh8onHZ2b94r32rdnUY5qNySVylIqmP9I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ca0b5f-f783-4ee2-3cfa-08dd88c75963
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:46:33.7351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9m4feZtLvMfpZZd7/ZXIF6uYMk6Xspd0dpszxUbu9HPhv+XhYbyXIj8HpM94MQ3nJOEmc1/gdPoIU08FdWEFIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010119
X-Authority-Analysis: v=2.4 cv=MIZgmNZl c=1 sm=1 tr=0 ts=6813975e b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Oj_Te2PpQe_Ct6f5lU8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13130
X-Proofpoint-GUID: I4T9tmzycZDp3aTSdSPHVP3tQMZGUjJM
X-Proofpoint-ORIG-GUID: I4T9tmzycZDp3aTSdSPHVP3tQMZGUjJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDEyMCBTYWx0ZWRfX+jDj0RrTvzfQ +j9hoT1KDk6fby91maNDH3AR95glaqywjZX+qgn9Z1/LpWTxbtypvkihxTNxTCfYZaSrqSd/tgw J3Hch0j9DYgJuXN+emE21jXRcOEPc38f6K1gZ+IaANrQ8sIkqCHVj8cDFg8cUqzeaT807WLy6vj
 7HtQnq2KV+wRxkS+qgNdI5WvDMNUrgnAxFEh9J/VjVCsKNZonfDT+KU7zFTz3izQmgtL5aOSC/A BYx5H+Ngt1VBxGVvmKxANSL21CxVsGcrM1doUmzDa1ygsFTZpRsWe4A1D64qYdLXBfgI2jaOrqe E2cTk/Bwp+NA2p331OF2Ln1f5+6Cekm4mwpmwSBJZBm3DejFDFXH3FL5mYf20j8kFykMl0dox5I
 p5JYapjyITb3New2bHduZq4XjUHg+t0UjONF3o4NNdkKSo2q3vTlp/mHF3/5bNbr79jG8x9B

On 5/1/25 11:36, Eugene Loh wrote:

> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
>
> but the commit msg should perhaps also say that rawfbt is not needed 
> for discovery either since that's the other reason we want to be in 
> the list.

Ah.  Okay, looked at patch 2/4.  I guess another thing to do might just 
be switch the order of patches 1 and 2.

> Also, how about removing
>
> libdtrace/dt_provider.h:extern dt_provimpl_t dt_rawfbt;
>
> On 5/1/25 11:08, Kris Van Hees via DTrace-devel wrote:
>> Now that rawfbt has been integrated into the fbt provider, it no longer
>> needs to be in the list of providers to call populate() in.
>>
>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> ---
>>   libdtrace/dt_provider.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
>> index 0c621197..1e2e844e 100644
>> --- a/libdtrace/dt_provider.c
>> +++ b/libdtrace/dt_provider.c
>> @@ -36,7 +36,6 @@ const dt_provimpl_t *dt_providers[] = {
>>       &dt_lockstat,
>>       &dt_proc,
>>       &dt_profile,
>> -    &dt_rawfbt,
>>       &dt_rawtp,
>>       &dt_sched,
>>       &dt_sdt,
