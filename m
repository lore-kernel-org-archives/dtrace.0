Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1771ACEDA
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754496100; cv=fail; b=n5Ir/Pm/yBF5f6J14n7Z4gxXRvQa/VVNEZ16wha3xsITrwKqG/3Ojdkop/luaWHneMmZAw0kEzhg+xuKQpDoP8BkaMXs8G6p4QoTi0t9LeJXLPis1HWwEsdfnMVjyj9YC1TkrozdjZHwLFd4N/rlOXLculELMxtm7cd9L5dm04Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754496100; c=relaxed/simple;
	bh=rQwSeYykqmiJnsC5SWnW/rRT63oqzQr2KGI2xxhr3Qs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZsKbWjJHPEoh8/CKeKfN+aaPnr8Hr1D6Y7u4gY4uy15bldtPWGPDDyBFQ1XFLEoH4HUwodYry8+lU4f9VNUsA3Il23jDgj0YL82dlCgAqVbkwBWA+4+iZFntT1jXTySz9vFmRvYFv6Skm4F8sVAWoZ/xvEuxXDZgzoUSa/citp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GEV6hwWd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tZVABr9J; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GEV6hwWd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tZVABr9J"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CRTXp031194
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AuvUoodMGSLri59PNNOxAOgyhZ5DkRmCDJ/PzD8SmG8=; b=
	GEV6hwWds5LQCSOnIIOAhJ6IXs7rIfxyWw1lYbxKLgkQOCzIKzTbhHpQ71e9yug+
	5lkyGW3oJTh+UFZelUagc4x2ougzIkz8ux7Bck0BefkBO8j+w7Vsx9o/o+KP2ywR
	64mAGirRLerScLVcMzzNPKGHziQ3qk6ucUxoP9B+7FOzCPo4x4voyrmM7yWypCgO
	+MCg1eu1oZWa+e3XVf85Uc2TdLfwWMsobCoGmeqapcLLRwJCiSpE/1W8I0fFxvAy
	7ffmvCeDHQvWMgjDDfcf5Zh1RC9J8OjQ7TngV/BC5NfsKnoD3fwRByNN6nOHhPbL
	gjVc76ZLJEIdNfJ8uqjseA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf22x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:01:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576EloIS018331
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:01:36 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2084.outbound.protection.outlook.com [40.107.102.84])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwr7vq7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTfqsrXNDr+2hL4ctdejZwukY27SwLnBapFC21HfrqTCLS+d/u3tOPH9SP/ebXeMsaiCNa6uIv9UUVroxTOfnglBqxt7eXAfjUVpwfs6fJO5KSKW7729aHrbLGrHbrFxNCI/BoIO2Ul+Z9xPbG5LbfA+jtNrIxlrVXcL9aGaSYyNA1lePKH8W0ZKIMaoQA28pLRATfPa0ra0nWw1n3SQ8pADVqhpCzMgJVLdGXpCHkIq/8XZuqfq8eODQ3vfaxm5OazpoGmcFq7AxfvIAVN+536XSYiv7uubnjvfgfT01yvCeYBN8nyeBCWWdKhjm4hjtLqb2wgItjawRyUxLCAXWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuvUoodMGSLri59PNNOxAOgyhZ5DkRmCDJ/PzD8SmG8=;
 b=SJwwFjaadk3aACeV+XY4x6+TP4QiTqFDu7CNyd+0Y8nAt/XEOg4Wiahwkkvj/23FQypiZczAJIdGlNUllOaFg/6OjB1qpS6WP6Ehh9eS22a0TdrlTJSDAGHgWre1UynB5Iac9jpgXgM+Am9RcErXJwPL9x1Tc+bJgzu0l6mEDAtodp5Wg7IE1SNowM7WIOu4VZfbD6GbT73xy8dpGlrcVMJRsiYoW+N5pif4ASSUXzxweNhtVhcglwdLdPM3b7u7YUbzUCNKSOjyI3FKyH2pWkCpWHDU7GnklYqDnqA+HAS6IdZgA54/br4LcAgfDAC21jz2AVgNdT2o0s1u8uEDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuvUoodMGSLri59PNNOxAOgyhZ5DkRmCDJ/PzD8SmG8=;
 b=tZVABr9JZ2a1BYWuVQ3idsi4eR/iquIMNHwoHlE0a1eNlzaO5+QwZUIIwXfrZv7ZwQNUWkk1ogMuGW4dLm03xURNrVIj3ernosWm0LLt4pCGZE1bzOWMDEInC/u5Iq0KppOjuS6zBcOEtTVYh0u0U7ZQMoI9KIpnvS6bBvmdurE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPF3494AF07F.namprd10.prod.outlook.com (2603:10b6:f:fc00::c1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 16:01:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Wed, 6 Aug 2025
 16:01:27 +0000
Message-ID: <90e9dcd4-d971-d743-3c2b-babff35e8c13@oracle.com>
Date: Wed, 6 Aug 2025 12:01:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Fix various memory leaks related to stapsdt and usdt
 probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672DC48BED654643C7F8912C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672DC48BED654643C7F8912C22DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0273.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPF3494AF07F:EE_
X-MS-Office365-Filtering-Correlation-Id: a7571609-aef2-4b0d-3f72-08ddd5028015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cTdGNDcrbmc2TmxJeVRwM3Y5cUpNOXAvN05FT2NKV3hvYkNVZkg0WHlvckdW?=
 =?utf-8?B?Wk9SeXJ0Q1IvempFeGR3b3kzRE04TjlFMHJ3QWNGTWROcy9INCsrMDVDcmFv?=
 =?utf-8?B?M3l6eEhTRmJnb2JZN3N4ZmVHSzRHcmozQ2RLRWNvWDdPZEppS0EwdWpTRE1Q?=
 =?utf-8?B?azV0YVY5ZVhkQWY3a0Y2Z2ZHZ1l4aWRtdzhTVHJsbHczWTlTWWIwQlFmaE5l?=
 =?utf-8?B?ZkNqMWNGc1NZRU5YVGx2RzhKS25uSkgxQjFxMDlWaUQ4d0FxdnBoUVJhNkZJ?=
 =?utf-8?B?YklaRVZLV2VQVG9qaHpNSU1OQnBCMU40MG9pT1hCN3RpTzZ6WHcrWEpvb3ZZ?=
 =?utf-8?B?aWMwQjR2THhEaEZIMDZGamtSK0g4aVhhZXJ5RmUra3dJN3JHWVdNbTB3YWYx?=
 =?utf-8?B?c1BjNm1aVkQyUTZZWWIrd0poV1RGczdoQjQzRkdvcFA5VHltcWxiditSemtJ?=
 =?utf-8?B?WmQ4ZERDTGZ3QitGYUE1REx6dmhPVzRXT3NlZUk3YkJhbTlHY3JWWGdKUGMr?=
 =?utf-8?B?c05GbEswZDhjMmVWWFZwa0djVUllcGJjcExNUmc3UXJ6Vk91Y05QV1lrbkJL?=
 =?utf-8?B?SnhBWjVqcDFSTnl3cFdSVWNJdXFmc09kZGlNVWxPMWtGT2sxdFdKS1NHYVNG?=
 =?utf-8?B?WHBIYjUrTi9iMlhEYVZxa3lubnhxL0NFNmg3bVVOU2UvbjNseG55c2FXMU5K?=
 =?utf-8?B?cWFKZjhQbFFpUWJrSEJXZ1FvUjRidEZINW1PSlFvQ3E0WDFCVndVV3J0R0pt?=
 =?utf-8?B?ZVgwemJnK1dPekhsTVJRYXNZemZrSnNVZ1dEaGk3VU9ubGZTYjQ1V05OWXNY?=
 =?utf-8?B?a1FOdXB0U0Y1cSsyOFRWOXdTeUh0WW5WazNxSVRoRkU1YWQ5cjB2bnYwL0xH?=
 =?utf-8?B?d0FPZWlCTjZ2enNNVnFPM0dYSjYrT0xSRHVTTWVGeTlGVXQvSXFYVFRUZ0NX?=
 =?utf-8?B?ZGFTNkJFZWJKT1FzY1lsRDRlQnFNaTNaUnNERHk5ZStaVGtOdExJRVFLSDlr?=
 =?utf-8?B?MTZNbGp6Vjg5cDNxL2psZ0dRZ0ZhdkpFUFUvdVFpSWVETW9nVmZKYk9jamxr?=
 =?utf-8?B?QjZBaVN1b2FNbU1ReWdBaTk3azk4aXBldXZ2bys4NTNFaTV6RG1td0FSL3Rm?=
 =?utf-8?B?VXNmaThYYnAreDRRd09PSXM5N1g0RnpoSG4wRmlrMW45UXhtcmFNK0dTa1ZW?=
 =?utf-8?B?T1NJekI5NHhFbyszWFNWcThndVVsVE15c1N4bUxXZXdqTVJEY3JSWElDSEl3?=
 =?utf-8?B?QWpyVEZ3dDJ6WlRuQjN1ZFNOQTNObnhCa1RzQXRxMTBaVXhUZWRobmdwbHBH?=
 =?utf-8?B?dU5ORGZNekJpbU9mQnVYT0FQaHd0NjZkOUdzRHVabEQxeVdyUUFMcVJBM09D?=
 =?utf-8?B?cEU3WnZCTGdJMVk2U0gyS2JpNUxjNUx4aDdZZlFmUHEyUkk2V1Awcnlma0or?=
 =?utf-8?B?ZHB1VHltSFVNaVJGcE8yN2M3V3NteUZPWWdVVEJyWkRuRElsRjRIaTM0Y2E0?=
 =?utf-8?B?U1VHdldGVDk5WU9xdU5rUjFBaUZyNVBvY1JURHhnSlFZQ2t0Z3ZncGN3UHNB?=
 =?utf-8?B?SVN4UUxRUEFvN2pLQXB6aEVWUWEwZGt0NFl0QTZPS0dUVnl5UnIwUlRqUWtk?=
 =?utf-8?B?RjhGb05CeE9BR1hYK3l5KzZ2ZmRJWm9OcG1jbU1IanBiVWQ1VEhJSWphMmxE?=
 =?utf-8?B?OU5UbUYwbmJVNmpLVHBmbm03ZkpzdmkyV1NXUWdaSjZmNlUxMDNvb3pRRlJV?=
 =?utf-8?B?TU5KQjA2UnYwUHk4SjZZZmp4VlZGanB0Tml4ai9VTWZEeVIzcXAxcFFkM0Jq?=
 =?utf-8?B?VUEwWWpHRTFrVU9lSlJEaDY1RFhCTHdBVzFGVExxNGJRMmhiZ0JJSHZJbHpF?=
 =?utf-8?B?MDZrMitkb1ZWaDZ2aHJPNnRCQ2IySnJQVHhyYWtnUDdILzRkcXJUS0Fwakxh?=
 =?utf-8?Q?FLtPz1s4Y/0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WU1melo0U3dXVE9mZW9GODhJckxxakN5WFIycCtWZzhwckdrcnYxOUY0U2Vh?=
 =?utf-8?B?ZWxPS3ozMjhlc3ZXZW9Qalk5dDlOY2ZFUDduNVVDTlVqaVRmSG9VQVJoeDZo?=
 =?utf-8?B?R2xlZlFuZ2JGNnMyaXVnZUc0TnZXL3hXSjlERkttazRkMWxHY2JRdkJIUTVs?=
 =?utf-8?B?UTZkQTJwR0RhYjBLbzdzUWdCN0FXUEJXazQ2ekFLcHhiOHp3dU4wNlFTVEpL?=
 =?utf-8?B?NFJ4d2J2MmpLYTFjSWJqaE5iKzEyWktySitzaGhVTnM1MW5zbGxqR2xYZDJE?=
 =?utf-8?B?WW9mRmY2Y202czVxVm03enAzNjdjN0lCeDVYZ3hrUW9xOG1HTGJPMWdvektu?=
 =?utf-8?B?by8yVi9Qb1V3MzZJTDVnbmw2MHBYZTdCT1FmSHAzbXpONFBLcDJXZXFuYytw?=
 =?utf-8?B?LzM5b2lEYUZybGV3UGhrVytaVDRnT1VGMkJWOE5qOEQvQzl4MTJ5TWNMdkJo?=
 =?utf-8?B?TGlydUNla0pOTHlUNEUxcWNWQzN3R0l4TjZCNUI0OWtDQTFBbDlSdnRQVWV4?=
 =?utf-8?B?TjdZTllRUlJRZ0NjLzVQOGlvSWo2MWo0Mms5WWV1WllCQVRYbGFqSkdVcHBN?=
 =?utf-8?B?bmZZRWJKbmM4VnVyV29tNDhNTUNSNVBiYkxXM0Fod3pzZm96T2twTGhuZXQz?=
 =?utf-8?B?VkFMUDlqVXlhWUpmK3l5UFk1VFZVNzlHc1NhMmdJV0RLdGErR1IySkVSaVRW?=
 =?utf-8?B?WG45M0ZCOEdOWlh2Vm9sL3VmOHFnOG5yT0VsOThZam5pSGt0Q3dPRDgwMEls?=
 =?utf-8?B?WWJUT3ZmYWx0dlh2end1eERIWGlJQ0o2N1UvSk9LRC85aTFPbTdrV3ZOOU5G?=
 =?utf-8?B?dzlPbEdmRTRUaFlJU0RNQ0RBOGUvMFg3QThhMlFYam02YU1rUGp6a01HcDI2?=
 =?utf-8?B?WlBwRlZNSFRxR2pKWE54WG9ESmRjOUVJcXlTUzN4MVZ2ZFBzSWpsaUFrS0g1?=
 =?utf-8?B?Q1dRSzVreElyTkZtcUt0dEwxbmpUS2R3bUhFTDZqaWQxSzdqZzhOamI4aDV0?=
 =?utf-8?B?QldqTUg5NXNVVUVwZUZ5cjRxaGlWbE5rL3hXd05MUGhIRE9Kems4TFJuMG9t?=
 =?utf-8?B?cWRyc0tWR0JRUTVvbSttS3FpcEpLZHMvYXdLb01OVklDM1M1US9KcGJRMlds?=
 =?utf-8?B?TXZVTVdZenVKdmh1WXhtbTEwbENRcUEyaEJBQ2lVVHJ0MDM5bERZa1J2NVIy?=
 =?utf-8?B?RXY1RTYvdGhVV2Y3Qk5TWlAzSmlSRWdFN2pMY2JMY2ZLaHk1c1h5ajhyQUFM?=
 =?utf-8?B?dU5nL3dIM3N3amZBVmdmc09RQUFhdWlBbFBoRHFFYW93S1hOMnFPMTFZSzl1?=
 =?utf-8?B?VjV3a09UbEhIeXF5VWRZNjV0Z05HTkJ6dUtsdGUwTUxRYkV2WmpMTzVPR1hZ?=
 =?utf-8?B?bDJKb3VXajh6ZGtUWVFUUDRiUXUra1JQckVPSEMzS2dndlk5cWFqZjFId1h1?=
 =?utf-8?B?aWRUdm1UeXZGSzQvYk50N1IybUEwS2VRT3pRa0FreHEwc2d1Uk50bm9PSGtw?=
 =?utf-8?B?Z3JiaFMrVUtEVDNzd1Q4Uyszb3RZVEFwYlpDWEZYYStlUytMWFE3aHNFREd0?=
 =?utf-8?B?MTVoa3NUSkpQNUtvRmpKbHZMZEhMaklEa3NYeXNxN3VrbUFDRzM2anFtbEV0?=
 =?utf-8?B?YnBkdTZjaXppZEFIbk1xenUyRDd4cnNXWGlFdTE5RW5kd3Q4c05WakhLVFhw?=
 =?utf-8?B?NGIwZnJQYkxNZ1NVd24xVnJiaGpQSzcrSC9WMVBFTi8wSUFJSHRTYVo2SVV5?=
 =?utf-8?B?SGdnUlJmM1FIL0lZenkxSjJYcTNacTM1dm5FT1NQbnBoQVVLMjNDQVUvZFNB?=
 =?utf-8?B?NWlveGJwY3l1QjBLb1NtWEI1U0I2RXlDUFIvUklsekJWZG9WRWp4bG1ta3BO?=
 =?utf-8?B?NGNoZXQ5Tng0SVhQcnJydGlKQUtwZE41cFRQUUUrYkNqSDZRWStuQWNmTUMy?=
 =?utf-8?B?bEQvSWR2R3JRT2NBcFQySlZEdEkyTXppaWVSSjQwZ0U0cFNzUlQxTFB6Vmtp?=
 =?utf-8?B?SWFtZXRIWVBUQ0RiM3d6VTNoNkNaY3NucU8zdWh4U2dQRnAxdWVaVXA0dm8r?=
 =?utf-8?B?bFMydzVzZUIySGpHNE9VSnA4Zi9wSzQvcktNMXFGRjdrNjIzZ3QzUE9sZHVj?=
 =?utf-8?Q?9ImdaAJWPwJLmquBC04/tTEF6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 4fuLgXYOxirZ3yxUO8s2r/Ox5nGBcEBeqRg7t7JHH5Xpmwm0CuYa9PzKvFGYmgduC6KhI0HubDhE/us1Sxe7GjdBOITt633/oR6TReYSSSoRiJovuATcSz/yM2SM6eiByB3cZdC9iUMvTFHcjJrNaj8hXcFuge4nUSlk+TRT/qBX7/7YXVOqU8j3v9IlItcTn+QSEDKqBzzTlU6353X9NOCzFe4afThUNYVrY/BTP03uYZ1tZwC/zql4UZk1ADvcjC1YBV+2HqgmmwklQhMus7LbrdXlqfi17HD/s2nS+joa0g9u1X/g8aA666/5z87n8RKRaEUccAEluKNb23PNy9doPAwoDHHpHb+pUt4z5hQeRx47FK2ShuTfOjJ3eYBddkoZJX+lqXue4N+mzPvGfVWi9WYC/qCi7S+zw+4oX2AmoQmSvTGlNus07o366dK31OErLgIP8CTDO+9Q9tCaK7jg0hYi8GZbZhwG6DqiNMuaVzGWtfscrBlzYgjy3EMB7leR3If+cGivWi/zMfy4jUrqA8lYTDCgzM4+8NF/8WKNdNl6BNGiHlxJYa9AJNoxM2zrknuuN8yvt7g5mGBR5SFV5m/yb5qN1Z9ZvBJm7Bc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7571609-aef2-4b0d-3f72-08ddd5028015
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:01:27.5940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lH4jLDbzRbLHSnXX+8F/p2XQa8W9X2Ij8KA7JLsEFooiH7935oVN9F0VLk0YiX0+jJIZmGVZWDss4JI2N92heg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF3494AF07F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEwMSBTYWx0ZWRfX9ik0lfPypLEx
 wcIYo0m4R2cEA9vAYgNOObAe2mpRB93wf09shA9+AQpfUji/ho2R6bpJ4NymEvrbVhHlbvFyEQD
 s3xLFNWMFFggtxYM3VZVe4UI7+cw0l8ePjXfNbUw/2BVpS2DoTa0HAeLZveyqysvEe/TNvFgKR8
 wN9JtptSF+QBnM17ywoCvpI+6fk02BlM4f/h5EIgKkSxTWWV0rvmMB5GZw4orclTLCFC+JaFgqN
 O1kgk287oDzPB5wCx1x1+iiZDCzWo2SSgf+W2cdIK9zJcibETO4akjqaHVwkNPc4QK3h/R3PHly
 MIbqnJ6l3I+IUKqymUxBqUGSaJny29draKoSUWmQbNUW4HQLnFbeUcvZn4ufvrmorfboua5uPes
 YaqyuxMRgxaF6+3FouPEFAc5VNKJC+sgds/pyWCC6cdToWJD4p/vPabdaUYbmxQD8emceGLO
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=68937c60 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ZKzk_Lvpmn34UDqgn70A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: RyJarWxHq7bvfBdw3tHc1WfVEO_dnqY_
X-Proofpoint-GUID: RyJarWxHq7bvfBdw3tHc1WfVEO_dnqY_

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
(quick review)

On 8/6/25 09:58, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_pid.c         | 14 ++++++++++----
>   libdtrace/dt_prov_uprobe.c | 13 +++++++++++++
>   2 files changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 42f667fe1..4af9141aa 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1282,6 +1282,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   	int i, err = 0;
>   	int fd = -1;
>   	char *mod;
> +	char *no_fun = "";
>   
>   	fd = open(path, O_RDONLY);
>   	if (fd < 0) {
> @@ -1415,7 +1416,7 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   				       &fun, &sym) == 0)
>   			psp.pps_fun = (char *)fun;
>   		else
> -			psp.pps_fun = "";
> +			psp.pps_fun = no_fun;
>   		psp.pps_dev = pmp->pr_dev;
>   		psp.pps_inum = pmp->pr_inum;
>   		psp.pps_pid = dpr->dpr_pid;
> @@ -1430,6 +1431,9 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>   		}
>   		if (err == -1)
>   			break;
> +
> +		if (psp.pps_fun != no_fun)
> +			free(psp.pps_fun);
>   	}
>   
>   out:
> @@ -1513,7 +1517,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>   	const dt_provider_t *pvp;
>   	dt_proc_t *dpr = NULL;
>   	const char *pidstr;
> -	char *path = NULL;
>   	pid_t pid;
>   
>   	assert(pcb != NULL);
> @@ -1525,8 +1528,6 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>   	if (strlen(pidstr) == 0)
>   		return 0;
>   
> -	asprintf(&path, "/proc/%s/maps", pidstr);
> -
>   	pvp = dt_provider_lookup(dtp, "stapsdt");
>   	assert(pvp != NULL);
>   
> @@ -1542,8 +1543,13 @@ dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_
>   	}
>   	dpr = dt_proc_lookup(dtp, pid);
>   	if (dpr) {
> +		char *path = NULL;
> +
> +		if (asprintf(&path, "/proc/%s/maps", pidstr) == -1)
> +			longjmp(pcb->pcb_jmpbuf, EDT_NOMEM);
>   		dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
>   						  pvp, dpr, path);
> +		free(path);
>   		dt_proc_release_unlock(dtp, pid);
>   	}
>   
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 8c8dcae0c..986ac0ead 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -795,6 +795,10 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>   	char	*nptr = NULL, *xptr = NULL;
>   	size_t	i;
>   
> +	/* Nothing to do if we already populated the arguments. */
> +	if (upp->argc >= 0)
> +		return 0;
> +
>   	upp->argc = psp->pps_xargc;
>   
>   	/* Copy argument value source string data (if any). */
> @@ -941,6 +945,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>   		upp->refcntr_off = psp->pps_refcntr_off;
>   		upp->fn = strdup(psp->pps_fn);
>   		upp->func = NULL;
> +		upp->argc = -1;			/* no argument data yet */
>   		upp->tp = dt_tp_alloc(dtp);
>   		if (upp->tp == NULL)
>   			goto fail;
> @@ -1716,6 +1721,7 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
>   	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
>   
>   out:
> +	free(spec);
>   	if (fd != -1)
>   		close(fd);
>   	if (rc < 0) {
> @@ -1975,6 +1981,12 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>   	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
>   }
>   
> +/* Clean up the private provider data. */
> +static void destroy(dtrace_hdl_t *dtp, void *arg)
> +{
> +	dt_htab_destroy((dt_htab_t *)arg);
> +}
> +
>   /*
>    * Used for underlying probes (uprobes).
>    */
> @@ -2014,6 +2026,7 @@ dt_provimpl_t	dt_usdt = {
>   	.probe_destroy	= &probe_destroy,
>   	.discover	= &discover,
>   	.add_probe	= &add_probe_usdt,
> +	.destroy	= &destroy,
>   };
>   
>   /*
