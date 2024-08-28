Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40F018787E
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724864305; cv=fail; b=Cw2AhNhCgwWDvNjr0uJ4w0fgXAUaiOemTnwrE0TKnkvjOt2kRhlv4Wtsa8bxvkDWJR7xqPmbi62KMKvIuKEoVKHyB0wxI+f4xkP+BWDdGRUetwFnwDEa9DKAIXzPSCsU9pRboZddbKfdHm3y9SyIUwzx0onQr1iprH2DulwqJBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724864305; c=relaxed/simple;
	bh=wbz8i+UFM9wjyPnZ3iLuVABj3vDU6mcjQeNlAXmZ458=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GYs35KtpqWvu53VLCgShfl66+FMh4SBm2J10R58MGZ/57TmjCkmGPyyclK7I1MychoNxBBoWkfJBcw6vfiRQxkX8aCYwpj1DeH8q2Ev1tCIQiY76oSoCzD5qt+OQl9M2UR0xh5of7W4CC0nidtA0FRmEOvfmW1LvAuVVtqkQG3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iq6iSCZr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oBD1vJ4r; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iq6iSCZr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oBD1vJ4r"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SGtVFC013298
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 16:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=L3Vfrhjm/gf34zJ2RBp24thNTOAd4Rzxks0JQMIEog4=; b=
	iq6iSCZrcwZJe9fth7yX07O1/MCtsFsBimSUYQ00xKyVs2EEx5hQ4Jn7u4eqxF93
	TBuXpSp8WXwUFlh6b5YQII4ozzADrbqhA/BQRfWogNWQAwkTaoW0Ob6OmhTLoVqK
	rcB4vSJfN8YFeR/SjzGu8T/jekx1YZOSrHfT/O38I4ktMhisQgbcfyrr6xs2ZC6L
	ItFhFQLxfvfFvDVcq4fRFVn5ahDlHLj3aM0Z0NBaPscsyNiWfrpJ2r0P09uByywE
	33gfjhrP/MeGyPqtPMbnxfBGz2jMLEvpCRzZXDJq7E8AYqsqaGvwIKxd4v2dMPfi
	bBgj8WkzyQwJ4n/nj/XVrA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pus1u9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 16:58:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SFhm5W020447
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 16:58:20 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418j8pagtt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 16:58:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sC4LFHK4YO2OYIkj4Vz7La8N5kSu9r7q8SKanYZg9W2XNB04SVfY9zSSdsUBbiw577kqOrc+uRPP3VM4f0+jr9Fgwq+ICZi1t+Y3gfukNYZFwrHP+oUVPA8UKETw4lYxleU4R0X3DynF4ETU/uXpmTN7cWdLOAj5nNvS7rOiFIYeidQhTOoqlSnpiYb5VvtjUWb5arup5l6s4/BSG6Dt4pmohQsf2cuP29e/RUmZSubc4BrVep0864Q2q3vKDKv9UgI0cs4t384vn+nvLl5Rg1z3JGNhr7lxJ+IdA8WOeuOoVdggQLlVeyolb7mL1/B6PpVSpamPGyNuZiHJGHIABA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3Vfrhjm/gf34zJ2RBp24thNTOAd4Rzxks0JQMIEog4=;
 b=POUxvd2X2pelriYW+z37dTUQ/iPSNz5tWVff+Lr5zduAS3mmluDpT6IQzjfkJv1g1M+QqWVfDgDOPoElIrBxvvA0wWoXI7wXh/uSbBxXKjhDJjK84MGao6wKSvuf48LM0V6ELLmemSMwZIpzGCaDRQiERsPblmxIg6SatQFHsWzmQggVgxInQpIdSWrJHQZ7BI2m4Mhpyltyk5TiM1fDuONmj+rjpt0/eiM2DiG2j/qXxZ2+XepwRSUMfBkXUtkJBq1NEoTAFObJF0FP13N3m6oq45gmC9QHhxYuFJowaCmkinKGEjkTMMU4WlbExTfshmRHAqjxDhuyUxqyh3CBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3Vfrhjm/gf34zJ2RBp24thNTOAd4Rzxks0JQMIEog4=;
 b=oBD1vJ4rnHgVUUocmujaaqcKoMrL2hbCiVkKRX5feOd5ZxWD25uBs/8eB0vkWk1U4G1XGwIF677tTVRwoEyVDmi3WGtR76oTXe3EmF0PCN27qC0q7y95+FxtEEhAcdidPhOpB8UfgCUyje6AuKC8c/nlk+dGrp6ANCrxLofD1kE=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by LV3PR10MB8130.namprd10.prod.outlook.com (2603:10b6:408:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Wed, 28 Aug
 2024 16:58:17 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7918.018; Wed, 28 Aug 2024
 16:58:17 +0000
Message-ID: <3a029e65-1c85-4808-bdf5-683698a1c85d@oracle.com>
Date: Wed, 28 Aug 2024 17:58:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] unittest/sched: remove dtv2 xfail
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
 <20240628171634.2801954-2-alan.maguire@oracle.com>
 <Zq1Rhz25fVX5eb8h@oracle.com> <Zr+pbCfu2apcbDAd@oracle.com>
 <Zr/utNV5KswtGN3U@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Zr/utNV5KswtGN3U@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0060.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::24) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|LV3PR10MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aab11a0-843d-4f64-309d-08dcc7829d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1ZpVGFvcjVEUE1FeE16YkNlcEY1MjRNaDF1VXBDNG1LSXRTY2lWVTFzV24z?=
 =?utf-8?B?K2xTU3VvMks5U1E0Q0VaUVZtMWJNd1pweGI3OHZoMFVHaWZIQTBLR25OaitH?=
 =?utf-8?B?clNoSERCYVdqZm1tbGFOTTcvVHYzb1F2SWdGamxqdkxIMUZwcGZYa3dNK09H?=
 =?utf-8?B?TmRKWFpMQXpxVVNLTnliTGI1TWVkSHduTWxidzVrcEJBTCtPWXk2a0dWK1hp?=
 =?utf-8?B?L1hoWVpXWDdad3NpcDNqd3dkNzIraE9qaFBDTTdVb0VRNnJqamRUMkQyZm1I?=
 =?utf-8?B?S3dtY2lWZDZENDVKYUlWc210MG8wM0pVa1R2SFpnaGlraVFQMzdJK09GY2U4?=
 =?utf-8?B?K1J0YlY3YTZ0cUVUM0Q1bnpuTGJ5ckFpNnZmbFUzRVlaSjJtTWk5anNVamJm?=
 =?utf-8?B?RFExSlRmZk1WU0ZxdkFuMm1lOGdBZXRZNnJaMHVxVlpPNk9GcGNodmtwclN3?=
 =?utf-8?B?NXAzaHJ4K2pJMWZTR3ZnUjBKUG9qbTRtYVJCeG85clYyQnYzQUFXK1I2eW41?=
 =?utf-8?B?dUhnbThTMHFYa2RUdXlBV0JZTHQrZ1drUW9mVXpLSkQzbkVQSE9NWk8rSWJZ?=
 =?utf-8?B?YjQ3VVoyUzdKZjZmd2tpUWk1MndNd1ZsUU9adm1hVk5OQXNic1k1d255UXRk?=
 =?utf-8?B?MXpuMjE1bjE2bllXYStLTTlyZEpDMUZabVFWcDV6Y2Rldy91NGt4VTU4eEdG?=
 =?utf-8?B?MCt0WGNxUnRlaGl6ZHl6eFByQ25GMTFha1hJNVBBSXB6WTFESHVZZ2FXVFFk?=
 =?utf-8?B?SmRjSFFHTmhXbnNtYWsrditCd3FHa3RvS3A2eCt5cVI1TGM3WmpzUVhxaWlp?=
 =?utf-8?B?VVNSQnFGMzBNUW9jRG1SckVoSm9RcXVXNklpcUxnN0hHQTFFLzNWRjl4Uk1V?=
 =?utf-8?B?cmR1NEwva3MwMFVWczB6T0xXM2U3Nis5TlBzNjJod3RLbmFwb0pYakEzd2g0?=
 =?utf-8?B?eXJ0cldkYVZtSzNVeng3czFTUUNPN2QvbW9pcDRreW1FMk5aUmoydlh1Nkp4?=
 =?utf-8?B?WVRKanQxRHZ4dG5vc0kyNFpzQnR6QjNPRjZSYVQ2NGRnQnRJMk1SWFdUUFhV?=
 =?utf-8?B?ZkMyT2NlbXNTczQ4Nk1YRVJnNm4yVDRVQVFNZldGb0xLWVl5L2dza05INXor?=
 =?utf-8?B?LzQ1K2ZSZHBETjNqNk5pK1ZWR0dKNDAxQXRuZWxoazVubi9RaTVQYkVYTU9C?=
 =?utf-8?B?NGJWZTNyeVJKT20xN21YNHgzanZhdXdVWVdQbjRlclZ0MEQzTTlNZytrZ0lO?=
 =?utf-8?B?eXZGSWNNRTdyN01XREt2ajVvaVFtZFlGYUVKTjNRd0pGZytzWFRVelJrREJF?=
 =?utf-8?B?SkNoRzRpTzFnMEZzc0FLbklJTzNvNXkvL1R6UjJoRmx1TWd2OE92bUpLMTRq?=
 =?utf-8?B?ei9oTmloQ2RFMEN2dFRNOExlQ0Z5UUptUkVaRUVPWTBGV1RmanBFZWpYUTJk?=
 =?utf-8?B?QUUyYWN3T2U5Ti93K3VjbHozRE5QZnVIczh5SjdWY1BZMkg1aVR6TmVLV0Qx?=
 =?utf-8?B?RDRseTcvR1VCOFBlbzRTdmFNemRQVFYzUXNSM2xhRU5LUm9kb20zd0htMDVm?=
 =?utf-8?B?ZHZjcms4cWJQUWhLNkJOSDgrV05iYWNwbUsyMnFkbUM3bTlSMEQ3RGZRaXZW?=
 =?utf-8?B?MnM5SUtrZlZ2OTYraXg3QWVxenA2TllvTTNQTTI5Q05KQklpM2pmWFBIS0Fw?=
 =?utf-8?B?ZFdURUI0RGptdlpNNkZPaVpjdFZXQStYTUZzdUZKZm9kTnVFVjdIVmZHbTUv?=
 =?utf-8?Q?0tThxbaOCWgh6Z9b9GaOR4T87M+zRsGRqUCFyQG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnVlanZrSE9Sam96dFhpM3plaDFlaE1mQktrVFVlTVgwQlE0WC9hSC9tRmR0?=
 =?utf-8?B?NjlRUFo2c1ZWellPMEpXbUR2b3lwVDFCbUdMTGpUNFI2WGZqdnRVd2FPYkRr?=
 =?utf-8?B?aW9XODVGYlBUOEIybWFmWlhOcUhOYmlSMURPd05FdkR3b0lVa2c3Mm15ZVUw?=
 =?utf-8?B?U1B0RXlVN3pqQXZjWHF4UXAxK2xML0xqdjN0MG1KRndxOWNFZkhXRHpuTEND?=
 =?utf-8?B?SlJ5MURHTmVjVWloQUdhd3RyYUllU21RSlh6dFd0YWY1R2o0bzdFVzNQVkZs?=
 =?utf-8?B?RzNLcEZQVWhqT3M3SDZBM1Z2QjNLdXdKZER5LzY1RW9DM0pIWWt2R0x6VTVN?=
 =?utf-8?B?ZmJtb1l6WUhVRGQyUnlBY3BlYXdFMVFYaFVHeGhydlFEeDk2T05qTG5oczFC?=
 =?utf-8?B?elU5cW0zeUFLbnBIaGVib2gzVkpSRW5sakEvdE5haGt1OHRkUEJQcHZjUzZF?=
 =?utf-8?B?NnlLOVpPdTVaR21hRXdhL00yeVFwcUloR1dNN0RwZ2ZPT0hXY2x4TUpub0Uz?=
 =?utf-8?B?MmUrUFZWVnB4dThkc0h6K2xqOW81ejBCbURpazlkUGFSVHFFRFBjN212SENV?=
 =?utf-8?B?WkRXd1lOZ1ZTa1VLbkdSNDYxQ3ZuQW42cUljVHVOQ2s2V2xxemphZU5FNnFD?=
 =?utf-8?B?S0NLdFhacElEU01WSEwzOXdLVWt1V1BCNDRJZWdZMGlQMUpQUjJKMDArTWdt?=
 =?utf-8?B?Ym1FaFIzSjBmTlFEcVlhb2xaZTFpYUNRZ1h0U0txVWFvTVlkWktteHV6a2ZZ?=
 =?utf-8?B?Ly9UOGNMMExEdFNkYk9YNXRzM0MrQTNieGQ3eUZYd1J2VjNYalNyUVF6M0cv?=
 =?utf-8?B?NnJLRGsvdW5IbEpCOUFaaGZUeHdCeU1qb2ZyM2FmV1JYUUtYRFNyOEdiTWts?=
 =?utf-8?B?YXk5bTVTNDdFQVZkYjlTYVNoMTdGdVQ0dW9PRVdxL1ZCL3hSNG5qMHpjcDhQ?=
 =?utf-8?B?S3hIT1VnaFR4dm1vZ2tlZjhwQy85ZXRHVjNyLzVCaHRjQmNTR2dPN0RmZFla?=
 =?utf-8?B?bU15cWRNNStUSmVkUE4yMDZQWHJqdnR2U1pwUENkMDBhRDVnNjljMlJNT1N3?=
 =?utf-8?B?MjhSRkpwK2VpSDZvOUFISXNrM2xPMlQ1MGsveHRwSHVaaVpSbXFPbFAyanZK?=
 =?utf-8?B?U2FEb2JoWFM4c1ZEZkFmN3dEeXV5b1dZYW9xdWxCVXlKVlFyUThUcUgvRU5v?=
 =?utf-8?B?Z1p6dTZFRlRUYWVGUzhDR0FBc3hJbHdnT2VyWG00dGo1T3hmT1ZaOGpXb2s1?=
 =?utf-8?B?bmhld2xiaU5IdjNYcFd0dS9NZmJ3NW5XY3NjTmFJSkExSE1ub2d1c0ZxQXNF?=
 =?utf-8?B?UElKZm9EbzhqTE9LdXhnRXpyTFN4NENsamVrem5DTHBYM3lVTk9NMUhVQWFa?=
 =?utf-8?B?VzYxZEkyZ1ZLM2xYbWJwZTE4RjhMdVZvYUNKL2M5cnc1cUp4aEZSbWNhVEoy?=
 =?utf-8?B?akFXYUZ1WFExNTZYSE1USWhTYnZMc2RqKzNxa0wyanBCbXplaHFnR2VaWmhJ?=
 =?utf-8?B?MTZNRkpXeW1RUmFWVWJNRzAwbmptRFcrR2pwMjkrWGtmMUdmQktvVnpwZUZh?=
 =?utf-8?B?Vkt3NTlodi9TMEJiU2ZaUXh4OWJEVjRqNlBkTEVXa2t6OGkrTkdlb2VLd2pp?=
 =?utf-8?B?ekIzS0FsV2tEMGlTS0Z4Z1luKzdLVlZueDRzWFluTUZmTm5vSWhPOEg3b21o?=
 =?utf-8?B?VzZWaWt3dmFaVTJ4Nkd6bm5BQjV6Wi81TmJ6K29aQ3QxYnN0d0krNDdOblN3?=
 =?utf-8?B?Vm1OdHMwTUdjWHh1ZGFHNFpTclk5Rllzc0RUWUsycEc1RjlNeVBtb3VOa3Fi?=
 =?utf-8?B?VFQvRjlZVi84MzYrdGhuL2lWb1R5NWVreUJjQXVBdmZSbXFLKzRYa0FROGVN?=
 =?utf-8?B?QzVtaTBPeTBDZmlZdm13ejNzNFJNVWRqT0psdEcrLy9KWG4wQXg5eng2Tkg4?=
 =?utf-8?B?Yzcwb0NZblJxV2FMV1FMbXIwak9iZXdmd0lqUC9JUVY1ZndlU240QnBRZWg4?=
 =?utf-8?B?TE5uN0QrdnZsWXQ5SDdydGQ3Z1FMMDU2YmkwNnlGb0Z4T0dTL0JFa3oraUs0?=
 =?utf-8?B?SHpLM0lKaWxSc0RJcm4rbzA0MEFpMGZiY1lrNUNoc0Z5bXZtNlBXL0tZbVVq?=
 =?utf-8?B?aU01ejhtNlFTbjQ2VEVEOWYxRklhNTBzLzZwbE1nR1FUL0pEcmxNcGNaNlF2?=
 =?utf-8?Q?DX0qHkwtYdKMVEjWxVXzucc=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5li8j81QVqMZ4pP52dvLKD67Uq5GaPmcAvRPe1soWlKds/T9SrplQ1rTxRsd2F1ocYMNmrnES3il1WEYteOE8KVtx7S7UFSxEKcsjgstK34ZlHmBK3rqy0WaZsdgr1R1nJQynWOcOwjghplUogBCNT5y9EidIf7KVRMuHlaytJdZ/VARwFcEMtCcY33TG9SNBr4uO8T1mHlPO7yivEuAkqdFZyABJzPqLx8SxH2GM6COExBF1ywIVsYrImJk27CqgNMaWjz0eoS/D1UVWlILLiIJf3oyQc1tBuPbVzgd1w4/8mMuv8xdmyk08MsQ/Rlugd5VXujHC5h6T6kNAFVrgHbYNHMv0dpiryQ0Lj3UIsPGop48QZG/mUfzFPSpQkYwHyEVS13k8s9buuEara1cjA/3kZ5ZrHMm8iIGpLx5yEbYZkAkV2G7gL9m5yNlsFvgdTsc6iEXRgYIo640hL8lMgIGuOmDW/kR9HEHJcF4nimGIM477cv7MrAMqAaxH9iHKQsMC6/p8daO68KMCDPMkw3Px8vUiAVanZpGGpw0NXt50T8zgXuouT7pAKbKqDuWlq+X+Lssyo23JfzomjTnUFc/gKBuPpKyNfSENujcfVk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aab11a0-843d-4f64-309d-08dcc7829d2f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 16:58:17.9007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4C3A+Svwtuax8ni7at9LC8xZKkvU5xcPn5s1oHLZtPInpLEXlpO10iywNGL6dDwJQaahCXzUKQdIUiBGRIXn3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_07,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408280122
X-Proofpoint-GUID: YTP1mM1fkQY4iC2ZRAR4EvY8ueP8TdEf
X-Proofpoint-ORIG-GUID: YTP1mM1fkQY4iC2ZRAR4EvY8ueP8TdEf

On 17/08/2024 01:28, Kris Van Hees wrote:
> Problem found: the OL9 UEK7 kernel I am working with (and possibly all) does
> not allow an FBT probe on __perf_event_task_sched_in.  The failure is silent,
> causing the probe to simply never get enabled and no error reported, so the
> probe does not fire and causes the test to fail.
> 
> In other words... the approach in 1/2 of this series does *not* seem to work
> for OL7 kernels.  That is a problem.
>

Thanks for the report! I've root-caused the absence of the function from
available_filter_functions in UEK7 and earlier (upstream works fine).
Prior to

commit 79df45731da68772d2285265864a52c900b8c65f
Author: Song Liu <songliubraving@fb.com>
Date:   Wed Oct 6 14:07:32 2021 -0700

    perf/core: Allow ftrace for functions in kernel/event/core.c

    It is useful to trace functions in kernel/event/core.c. Allow ftrace for
    them by removing $(CC_FLAGS_FTRACE) from Makefile.

    Signed-off-by: Song Liu <songliubraving@fb.com>
    Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
    Link:
https://lkml.kernel.org/r/20211006210732.2826289-1-songliubraving@fb.com


...kernel/events/Makefile removed the ftrace compile flags which mark
function entry for the code in kernel/events. In UEK7 we see

ifdef CONFIG_FUNCTION_TRACER
CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)
endif

I'll try to find a workaround that doesn't rely on function boundary
tracing in these files to work..

Alan

> On Fri, Aug 16, 2024 at 03:33:00PM -0400, Kris Van Hees wrote:
>> Running a full testsuite run (and then also individual test) I found this
>> test to fail on my OL9 VM with 5.15.0-205.149.5.1.el9uek.x86_64 kernel
>> while it works on my Debian VM with a 6.5.0 kernel.
>>
>> On Fri, Aug 02, 2024 at 05:37:11PM -0400, Kris Van Hees wrote:
>>> On Fri, Jun 28, 2024 at 06:16:34PM +0100, Alan Maguire wrote:
>>>> ...since tst.oncpu.d test passes now.
>>>>
>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>
>>> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>>>
>>>> ---
>>>>  test/unittest/sched/tst.oncpu.d | 3 +--
>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
>>>> index d2c2ce57..7a33bab4 100644
>>>> --- a/test/unittest/sched/tst.oncpu.d
>>>> +++ b/test/unittest/sched/tst.oncpu.d
>>>> @@ -1,11 +1,10 @@
>>>>  /*
>>>>   * Oracle Linux DTrace.
>>>> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
>>>> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>>>>   * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>   * http://oss.oracle.com/licenses/upl.
>>>>   */
>>>>  
>>>> -/* @@xfail: dtv2 */
>>>>  /* @@timeout: 15 */
>>>>  
>>>>  #pragma D option switchrate=100hz
>>>> -- 
>>>> 2.43.5
>>>>
