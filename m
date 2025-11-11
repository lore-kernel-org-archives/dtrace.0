Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B832EBBA9
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762894252; cv=fail; b=g9Th4MA3Ia4qUIkYTuq2BRe4t947GxRu4rfjS5pjTX7q+UByONsjvBaCV+gSGa6c1Lgd7x01o6FQESALUqwvg75XugnzClYWADe7mUjj09XS/sU7vjh6vcwM+NOoDNNZVvL3cbG3p+8nAxOG0SleH25MsRtVNI8N3K7ek6fTcCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762894252; c=relaxed/simple;
	bh=OK0estzUCIdAqOtlTH1mgCO4IGRzdazKYD8RabeC4fA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=o9/tkZprnbCU4kfI6ZHee9tl5ka24wDhQ7Sp+p6IL/cOEEHmnJIIcrhWIsWMDrZrbensx8Ht07TvetCavIxC1HyULe8rjzPscN41K6yLjCe05NRBjYbBEcn1J1SegQ+cpxBTtwbftUXpKy0NMyyeEvjAkTPkPItcqzx7h/9+R+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bYJ/71Df; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bz6NcDoC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bYJ/71Df";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bz6NcDoC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABKTQov020133
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 20:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9bxKef9u204xESMWsvxYQrtuoZ7kxSeMR+sxCDc3zxc=; b=
	bYJ/71DftnR0YyDOmFtJ9f5jeVzFpPTuRrF6rgmOo0bR42rAvzZ0WIfzpUaW9n2O
	6XIemm/yzv74s1YGf/vLTJGuU2Sao1aitd0ItWB9QXRRYScz3SGzqIOP51XrqQEj
	sGNVeXgRewVs6oxJYQ9YTHhlUGW7Rfj5yne/xmZIcjIIjgrKdLACVy47fl3Q1pHb
	SC1cUIj5LTLlzbv8TPV0P4CtfJ1AMgK6DUv0RRuxtzz0cl9Ig46jFmVwDq/Zl+2H
	8C65IBVma/fq3qrfMylcQAZ02uXunEbiwODchN6r7dGYxNdIBl+kwaxwvQVVa8/4
	NpLLgo4sEDl9wYmp/ncbnA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acbgjr3uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 20:50:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABIMN04010037
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 20:50:46 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013064.outbound.protection.outlook.com [40.107.201.64])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vakp5uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 20:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OL9qIx0xKXjGLG58LWBKek9XoR5rQzAdu2/LUwJth++u9YwgzlxNc7dDU/syCnGGTDfMqzt44Ibc0JkdvbPBWQv3igyWRT1Df4CqtBMGTrHSDTFnMriE4JI3X3SeeFHWK3ZbHTb2YruJlgghVLaZcFvyhHH5EHdxLNogUoYIg4lpUF/av6SZ2Eh9Gh98ZNtUS60edbXm52zB3KbZ+IWmKI/tfXW4YV8w1Nm1b3oLF39h+jZ6PuqyjVY0qAEZ8YsDv5pZhyp2gTMOpTLpt2LBEutrPfeOT3l5WOVyO6toonuj5AU3FLoqX51ALmPVp8vuyNLim7nJmUjAO84tRfhuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bxKef9u204xESMWsvxYQrtuoZ7kxSeMR+sxCDc3zxc=;
 b=Uir2rpGjMjHuAscMiMzVRwFSMho3XhyvZL9b/UC7Z/mnfDir8xyLthqlhsC2C4tgT8LSwZbhwc1dDyNoLBKjy1zHTtxYs74iiOvksXQjy2xj5tEaKnbRVST6h7tEN/V57oILkwn7dAhlIpZEGPb3S4ih3rvX9tqsghWHg/3iXn1olo27KYiNs6z0r65pPo9SYuYsYz/DZW0A2g/slp/1wzQOvqgSBqgd+Osf2DLpdSrHr/jJgOZav6TUieAkYxIGZgU9oSKpkOfpNL4y+ftQgvR0NuUHgigWu5X+ttL8kk4Z+YalN7tsuMvHQLkFfsQMTu53ULDO+Ld2tG4pTzu5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bxKef9u204xESMWsvxYQrtuoZ7kxSeMR+sxCDc3zxc=;
 b=bz6NcDoC5NuszEg0txRuRjqj9GSL4RPPHEF6HXWJ5EX3BzjvfyJu40HSQ0TsMqBvJWfAy3XYhg3ITPrER2flylqvKS9qjmts51OQlSUlsAIdgIkXxzMqP6xpqh+ESVXdv5Z0QbN4KCCXyhf63/Hxe7cl4bcjDS2JT19VtMSoQVw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS4PPF509E676A9.namprd10.prod.outlook.com (2603:10b6:f:fc00::d1d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 20:50:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 20:50:39 +0000
Message-ID: <67df532b-f980-5ec0-ce0f-998d524829d8@oracle.com>
Date: Tue, 11 Nov 2025 15:50:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] test: fix tst.depth.sh to use proper trigger
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
 <2f960b99-eaa1-d3f7-11f7-4643adcab8fe@oracle.com>
 <aRKmvyBLFPNRYOM3@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aRKmvyBLFPNRYOM3@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:510:2da::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS4PPF509E676A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 652c07f3-a969-4edb-4d1b-08de2163f8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1QxaWt1RWliM0VsQXdTMjc0YjZSNDNuQ3YyTFF4TEpWc01JOUFrbnRPQ1V1?=
 =?utf-8?B?Y2N1WElvcUZTNjFGVzRwZ3dteUhYWTgxZnArTFpWRUdpbG8zRmxhOGtBanlV?=
 =?utf-8?B?RjlXcXluTW4wb0pmV1JWaERrVEhTdE9qdjhZdmo4Sll4V2ZyUzN3dGp0Z1RZ?=
 =?utf-8?B?L1UyelEvQXpZemJEVFlxV2pqS3B0WEE1N1dreHN2YVRVdm4xWkQxVUtsRU4r?=
 =?utf-8?B?dUs0MzJrYVFMRXRhMjd2WC8vVlBqNG9xakwwYlJEMlpkUFJTUnlmbkFKMVQx?=
 =?utf-8?B?SUJjSXFKeXd0S1piMGgrWW9HYmhGV2pZMmhCWUFSaTdMdTdMZjNTZWY4S0dn?=
 =?utf-8?B?c0ZOQWtYVUNtaHdraENqUTJZV1VCMU1WREhnUzNrOUdzMXRwcFllTVlabUdY?=
 =?utf-8?B?Y3lwa2ZRQyt5WjRNTDJxa0tTeUc2dmxxd0VqQUJEUFZLTG9mSkJJY0w0aGFG?=
 =?utf-8?B?am9TbDFCZ0N5UDNBakV3ZlhoU0Z4QmMxYk4rOVIyeGNkOTlNT3JxcE92cmlF?=
 =?utf-8?B?MVp0Vk8vM2ZiSFVrZWJoclhiOVFDRUZaN2dFSGMwNE00VGVxSTAxeitiM1k2?=
 =?utf-8?B?bUViTWJmVXo3Z1FFb0d4cWgwZWE3UUo5amNyeVVuZEEvQjE0TFFuelFNUTRy?=
 =?utf-8?B?WFBnWmFGWHFDb0thSlNHM0lEWG5jMEJNVTNBT2JEZmhpc25GOTMxZmtlc3Y1?=
 =?utf-8?B?Mm9WQWZyS2R5M3VDeVQySkxLK1BCRXllUnVWSUZOaFlaVlg3bXdnNDVWMkdI?=
 =?utf-8?B?Yi83d1poNUdjWk0wR2ZmTnZlcVo2UHJuZmNuaFh6ZXN1S3oySjBrUDNBTmVk?=
 =?utf-8?B?cjY1TjZDQTcyYmZ5MGEvd1BkU3NqdkF0REV2TUFMZkh5WmxYWWhZT0hTV2Jq?=
 =?utf-8?B?eWdhMWNVVkowMUhBVW1waVJjaytqNGlOYTVBQm10eEhvLzNYbXoxK2UxMUln?=
 =?utf-8?B?TkFoMENPNk5hZ1FsdkVVKzhTTEZBWEUvQkhhdktadmx0VCtoUzMrbDdFZ1NY?=
 =?utf-8?B?MUx1TFF2MDF4TDlvT1RHY2hkQUY2dTQ4a2w1MzdqdVhWUTZ2a3ZOMGx1bE11?=
 =?utf-8?B?MVlyaWxBdThiZThuTjh5ZXdrWmhiekRsSTdBd00rU1IrQjRxMmNyUUZmcHc2?=
 =?utf-8?B?MHB3MWZWbUo5R2ZwM3YwamZPMFBMZmRKRDIwTjF3anU3bVR1YnVZSHVHeTdz?=
 =?utf-8?B?eW1nUDNtY1pyMlZHU3EvUjRiRE16U0lFc2RZelM0VmpxSEtRYStZQmNrd2ZT?=
 =?utf-8?B?YkVHZXFPdUM2NkVFeWp5YUpUZ2xTc1NSK0NRcUI4S1FDdUNyNUkrN1dhR3dT?=
 =?utf-8?B?bGFZL2hkVVB3dUViUHU3TTJZYWFOeEo3cFVPM3FUTHlRWlJNZ1E2ejZZSzdN?=
 =?utf-8?B?RXVRQkpPdFMzRW9EQ0dENVNPTVlqd0ZSV2tKd05odmI1Q1RzdnM5WjlzWVhC?=
 =?utf-8?B?b2o5TFN2TmU0aC9DSWt0YU9RYzVaZkVvdmJ3bERSaHhKMXJrOEY4K2FmL2RT?=
 =?utf-8?B?OER2OUFFaEF2ZnFndmN5M2dEeUxjQUhGbTVsUTRjRFV5QUZiQWVOYlI4T1RW?=
 =?utf-8?B?SkZ4cUNPT0dNaS9GeGxScURXUmVzVllnaHlSNHJETG5wR2p3R28reEFpS2Na?=
 =?utf-8?B?a2FuMWZGbTR3OXF1TnBaYllaK2trVDdhQWQyVlFBR0NlNnA2b3I5TUFiRUxs?=
 =?utf-8?B?dFdFT21oamFNMGlLeFg1S0FYSlJiaFE0bERWcEhCaGFrYnF0NUlJaVN5R1pp?=
 =?utf-8?B?MVpVVGtvNmJzL2RHd09IdU1FTHg4a0x5WkFFdWFaL05hb0daQXpBelhlaUNq?=
 =?utf-8?B?MVRmMlBaby9YTy85UlhJc29CYVZweExrZWdEaWJDQkwwbkgxYUtQZVVVNjlM?=
 =?utf-8?B?SjhTdkFSL3A4OFJETlJLcllIQ3hoTHpnaVY2NGhoTkQ0N2tnNUZUeTdXdm9u?=
 =?utf-8?Q?C4DL3HP/9K+3mbT6VTsoB/Gyu3SkXyKQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkQ3eW15VFU0NUJqRWdWbVc0eml2QUxtM1J0Uy9LRm4yOGVrbXJWQnpZcGI2?=
 =?utf-8?B?Rjd1NjM5SHlkcVROYWhIM3ZOejlMbDZndFNETFhrbzV2elhCS3JrZTlia1U1?=
 =?utf-8?B?WW9haDdlcDF2d1ZxdFJGNWF3Ly9UeXpCeHdHaHU1VDJWU0JJQjA0d3VpM2to?=
 =?utf-8?B?VlgzbkpNNG5aMjNFZmNMZldFRExSREkwRDl2SThEOTJ5K1UzTjhibEtXb3c3?=
 =?utf-8?B?UEdFQndTZG1QL3NpSlZMc2JSdlB3MXQ0aVhPSjVSNFN6MDBOOEhxYkc4ektv?=
 =?utf-8?B?cG9LZFBjZWs0UXM1d1VONk00NCtxNEhsd2NwaDE1WW9BNkJ2TVB2OEQ4UkNo?=
 =?utf-8?B?V2R1ZzRQcmFETi9iTDFWa0crL3VpMjhyN25uRk1ZU3VwWlpkSHNnTUN5K25n?=
 =?utf-8?B?bXRSM0pSMkIzT04vYjVWaklDQlI2TFNaQnNDNDJqZnpSNkFPaG9ld1BUYVFs?=
 =?utf-8?B?Y2VNdlVaNm1KakhvaVVSTWxKR1FJNFFxM2twVlEzQi9yWDloZ0RlR0l1SjFh?=
 =?utf-8?B?MkpRK2w2ZkxsUXZydjFRR0RzNnN4UDVXa0NHOWZyTG10bm1vano0QllqU1hW?=
 =?utf-8?B?MHZsS2VQWFZrdG5OU2dRQ1JvMlJvb0VVSjVEK09aemlSN2V3N3lnKytrUHZV?=
 =?utf-8?B?Sk1pakJ5MWtXZGdJYVFWOFZ5d0h0NzIxTUc1RGljNWdyYnRFbmJuOGdyMTkr?=
 =?utf-8?B?Z2RRVkZnMUIrWlUyRnhBYktyMWxnWTJhRDZ2dlVibHB5d0pTZFBjSVd5bGdx?=
 =?utf-8?B?c0RqaXZtZHRHVUlYZ0dYZnVpYnUyamFxMi82SnNzZjY4bE5IL2pqUEZEZWdH?=
 =?utf-8?B?Vlp0YmFqQ3dPRGhNUUI4bzZwY1ZSaG1OQjJWZWNPeXU5dkNTVVpiQ2FKVnlk?=
 =?utf-8?B?ZXprYVpEVTd1L0RyTzJSd0VwMUwzOGJpc0RwT0lHd0ZvMWJKNzBHSnNFakNZ?=
 =?utf-8?B?bVg5eUJxWHhlc3R5eW1NUHJWNnlGYTl2QXN0OEV6MG10SWF4M0s1a2hWQXFm?=
 =?utf-8?B?ZFl6eThwYkhHZlMyVGZyMmtaQVQ2UVdNUDdWMnJYbmNLbWNma3BBZkJMOTVw?=
 =?utf-8?B?ejdpZkp6T1lJRkw4WWFNSFRGQ2VudHcyVHk3UjJRcmozM0ZGWDFFakdFL21l?=
 =?utf-8?B?UzQ5Umt3NWZVV0t0TytyVmYzNXJhcndIQzR5NEtYTjBUL3gyeW13cmhNcW05?=
 =?utf-8?B?d0lybXhoSkFOcWJoOEFYUXE2Vi9KVm13Qm5DNzdHS09rb0h2ME5SZktaTjh2?=
 =?utf-8?B?S2d4bDhUTEttYmpXQ0ZJM1UxU2JNOE00d0pKZ05hK21meC9ZYWlJbDVRTURU?=
 =?utf-8?B?bWF2N2kyZFZmOEU5R1JrUkI2eTlBUlJyQ09Cc20xRE5iRjNaci9TSWV0ajBG?=
 =?utf-8?B?RlBFRTlnczlnODM5WUR3QXFIeEhVTTFQSURINnk1TDBGRmIxUGw0WUd5ZUNK?=
 =?utf-8?B?bExrWFIwNEZhTStJMngwdkEybGhWK1ZObmdiOThpQVk0YmJUbnFUU2lsS1V6?=
 =?utf-8?B?a243aDA2aEpvUXdyODhldzFKS3FxZzhFSXhyYU0zc1dYU1p1ZmhaWkVBL3ps?=
 =?utf-8?B?SlNvYTZWOHo1VURHbElJc0UwVlJZTkdhcmg4R3FZZHZXdk54b3NwMzgrWjcw?=
 =?utf-8?B?dUdqRlczUXNkaXI4M2tlOGl5d2hXV3k3NldrMW85S3hwa1RSd1ZqYjBod3Y5?=
 =?utf-8?B?NmRaUmxUQ1FZRStkRTdlNTlPaFJGbk1QK3F2RzN2TEdWTHBHQmFFNldWdE9l?=
 =?utf-8?B?UVRtUkJVOE9Ba251Y3I0V3ZJWS9FWDF0eU5lTkUyOUY1T0xGcXZhYmU3dmxS?=
 =?utf-8?B?eEErNzRtVmFha2lLM1lScHFCMytScVNSOEFLV3ZTbkxOL25RUFI3SUVIRS9t?=
 =?utf-8?B?N2k4NkswUVUwQ2VNZTRMODVYamRLNzRJdHlzNE13U0hScnVwc1ExdWNWS1cw?=
 =?utf-8?B?TXlTVWFLNDFLd1dtZ2N0YU51bmhzelpTYVN3bVlBdkRqU0V3TGxPbElpQlFl?=
 =?utf-8?B?cURwSGpSVWEwcy8xc0JiSm9nU29yS3MxSmNmVzBSbmh2R3lUQnZRUDZiMlBL?=
 =?utf-8?B?VllsSEtWeVRvYzhaSzE5S0twTXl6bjFRRitvSDB2ZEdYbElWeW9sMWliQnJu?=
 =?utf-8?Q?j+D5M4Jh8hS+9Jny8efjmFUrv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/8nOdjvCpAr3/vicWQTZDNH3mDmcza+YKcb0htRsmi1mMXf89lFdxn8U9JEeJa9N8jrf8MLc9ognXLYbxWwUHR780FLSZd/YcOS6PctZV0/XQ9hce/1pyVBXT02TmoQsmOsI1SUnSGjj1jjGqyUohxKJNF32K0eJKFB/pwYouPo2c/ORkXua4dPE3470hSsas3NDTnZsU9adYhnyOHdv7a3cdzBx6QPQoQbl61NHYyF5dJgLErKyHAluCkpkZI7LkRZBZXWL1X8NbNxmmmXPCWgVCE5PD1rY+UAIH1vWo7bVPCPIgdLUtPGtgmHmoh8GCMH5HBv57uVT8A1mLP+v3wA4eAdklLL9KJeMcYyLEuk78bt+cQJwNLAtmhUtlPznU3u29zIs1symh6KBMTGI0n62aiIdD7tpND8r7P/orYL1nkvhrkZDzZuAsUbrOIW58z0+bSjLf6R9eDzKynDD9kBJmaf0QthfA8OPfH+aO9bnkXr41n0EyDczSQChFfI+ZaPawDoYta7tR9AoEI7hKsFT49tApjHiD/wCGeobiFC0o0W/AeO051GjX02phR9vMyMFIcYOjIE3cyZMp1FEHxUFhQ4b4jCWrft3lgt6A6k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 652c07f3-a969-4edb-4d1b-08de2163f8d0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 20:50:39.7168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J768KgEm1YapqyIRgVeHezTXW3Y+sbZi2kE8QQk5/hpvosCiVdgZEpQzkmi8fC3O/y76Zd0rhji/90eEjHUh/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF509E676A9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511110169
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE1OSBTYWx0ZWRfX/wxIE6uUCppI
 E7ZQPtPY0NPjRm2WZE477KzUFLHhYbalkHxs60CDBtrGYOISmTN6PP4/VeIfA0mq1gGxdJSP7pK
 +dCu3JrL793Vtrb9+V39nioC+56Ip6rfuvo8EYYMBSxo8MEm8mtLgRX9ObjEViFzoIfB8/cvBQX
 tNvjz7oSehmt0coRfBRAmIpNGl6Uxwyh6h0bFfKpzmJgV85+pf6w0B88eKVyxnBXk1R9rPI+9YT
 kFN9ieE0xc4g4pYBSpWALWnwPm0Dqxx1AQyAhxAyjRDOv9q0DaYZaZB7sewlrgzM7WioSu3iTvE
 pYyjvLkw7A3Q8b22IA9+ebBTWtDbTXyX1t4ZzEemUUIhNLmjeOLFH82LCdJjy9fv75zoz0fvjJf
 kDejF1gYbHmNxBSJtsfC2+LzFRzfJrHoSxY98Da32KO5C83J5Aw=
X-Authority-Analysis: v=2.4 cv=P4s3RyAu c=1 sm=1 tr=0 ts=6913a1a6 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=57oadCU33uK6eHlzHS8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12100
X-Proofpoint-ORIG-GUID: FOq0z4_gyXroSj9EgMWkM5Ey4dTtBIzH
X-Proofpoint-GUID: FOq0z4_gyXroSj9EgMWkM5Ey4dTtBIzH

On 11/10/25 22:00, Kris Van Hees wrote:

> On Mon, Nov 10, 2025 at 07:10:52PM -0500, Eugene Loh wrote:
>> I'm against this patch.
>>
>> The picky stuff is:
>> - the Copyright year should be updated
> Easy to fix - done.
>
>> - the timeout probe could replace
>>          tick-1sec /n++ == 10/
>>    with simply
>>          tick-10sec
> Arguably, the two are not identical.  It depends on why one is used over the
> other.  Here we could probably go either way, though it might be nice to have
> the tick probe firing every second as a way to generate a bit more activity.
> Given the frequency of the other probes, not really important though as far as
> I can see.  Note that I didn't touch the timeout probe primarily because that
> was not the purpose of this patch anyway.
>
>> - the "delay" env var be set for delaydie???
> Why?  We are simply using delaydie to have a trigger executable to execute.
> This is a valid use of it (and it is used that same way in other tests also).
>
>> - the ustacks for delaydie are perhaps not very interesting
> That is not the point of the test, and for that matter, I highly doubt that
> ustacks from date would have been any more interesting (aside from the fact
> that you'd never know because the test didn't even work with date).
>
>> A little more serious is that all this patch does is swap one failure mode
>> for another.  What for?  It's XFAIL anyhow, and we do not check that we're
>> getting a particular, expected failure.
> The difference is that the pre-patch failure was due to a problem with the
> actual test.  But since it is XFAIL that was reported as an expected failure,
> which was entirely bogus.  After the patch, it still fails but at least it is
> failing for valid reasons.  I.e. now we have a failure we should look into.
>
>> The real problem, meanwhile, is that this patch leads to lots of test
>> failures, at least for me.  Not every VM, but many.  Oh, and I do not mean
>> on this test, because this test remains XFAIL anyhow.
>>
>> Consider a subset of the VMs I run on.  I get these failures on the
>> test/unittest/ustack/tst.*.d tests.  Why on these?  Because they run after
>> tst.depth.sh.
>>
>>          +------------------  arm OL8  UEK7
>>          | +----------------  x86 OL9  UEK7
>>          | | +--------------  arm OL9  UEK7
>>          | | | +------------  x86 OL9  UEK8
>>          | | | | +----------  arm OL9  UEK8
>>          | | | | | +--------  arm OL10 UEK8
>>          | | | | | |
>>          v v v v v v
>>
>>          x x x x x x   tst.kthread.d                 FAIL: timed out.
>>          x   x   x x   tst.uaddr.d                   FAIL: timed out.
>>          x   x   x x   tst.uaddr-pid0.d              FAIL: timed out.
>>                  x x   tst.ufunc.d                   FAIL: timed out.
>>              x   x x   tst.ufunc-pid0.d              FAIL: timed out.
>>                  x x   tst.umod.d                    FAIL: timed out.
>>                  x x   tst.ustack25_max95_profile.d  FAIL: timed out.
>>                  x x   tst.ustack25_pid.d            FAIL: timed out.
>>                  x x   tst.ustack25_profile.d        FAIL: timed out.
>>                  x x   tst.ustack95_max25_profile.d  FAIL: timed out.
>>                  x x   tst.ustack95_profile.d        FAIL: timed out.
>>                  x x   tst.ustack_max25_profile.d    FAIL: timed out.
>>                  x x   tst.ustack_profile.d          FAIL: timed out.
>>                  x     tst.usym.d                    FAIL: timed out.
>>                  x     tst.usym-pid0.d               FAIL: timed out.
>>
>> I think the problem is that tst.depth.sh -- with this patch, in any case --
>> turns on a huge number of probes.  That causes problems for this test, but
>> not in the sense of it FAILing since it is marked XFAIL anyhow.  (All this
>> patch does is change the FAIL from one problem to another, but we still do
>> not specify what failure we expect to see nor check that that is what we
>> get.)
>>
>> So, the problem is not with this test, but that the system is left in some
>> whacked state due to having attempted so many probes.  As a result, the
>> process "dtrace -o $file -c delaydie" is still around well after the depth
>> test has finished, the load average remains high, the pid0 process does not
>> run, and many tests time out.  How long (how many seconds or how many tests)
>> does this effect last?  It depends, as one can see above.
>>
>> This raises all sorts of other questions as well, such as whether tests in
>> our test suite should be allowed to depend on running on a somewhat idle
>> system, whether we (dtrace or the test suite) are cleaning up well enough,
>> etc.
> There is of course the aspect that this patch is part of a series, and the
> next patch in the series should resolve the impact issues of this test.  If
> it makes you more happy, I'd happily move this patch to the end of the series.
> I don't see how it matters, because this crazy fallout from tst.depth.sh will
> be an issue either way until the per-PID uprohes support is applied.

I don't get it.

First of all, the crazy fallout results with the patch and it doesn't 
without the patch.  Without the patch the test was basically SKIPing 
(admittedly as a mistaken side effect of a test defect).

Second, the above results, with the crazy fallout, included the entire 
patch series.  That is, the tip of the branch looked like this:

59a49ce9 (tag: 2.0.4) doc: Add blank line before bold text so it is 
rendered correctly
61e69762 bpf: fix file descriptor leak
20780963 uprobe: remove unnecessary enable_*() functions
170c4cf9 test: fix tst.depth.sh to use proper trigger
cf7ae35b uprobe: Implement PID-specific uprobes

If there are other bits/patches I should try, let me know.

>> On 11/10/25 10:27, Kris Van Hees wrote:
>>> The test used 'date' as its trigger but that caused the test to XFAIL
>>> for the wrong reason: date does not have symbols and therefore dtrace
>>> failed to enable probes for it.
>>>
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    test/unittest/ustack/tst.depth.sh | 8 ++++----
>>>    1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
>>> index dec16a3a..977d1b42 100755
>>> --- a/test/unittest/ustack/tst.depth.sh
>>> +++ b/test/unittest/ustack/tst.depth.sh
>>> @@ -16,7 +16,7 @@ dtrace=$1
>>>    rm -f $file
>>> -$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
>>> +$dtrace $dt_flags -o $file -c test/triggers/delaydie -s /dev/stdin <<EOF
>>>    	#pragma D option quiet
>>>    	#pragma D option bufsize=1M
>>> @@ -45,7 +45,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
>>>    EOF
>>>    status=$?
>>> -if [ "$status" -ne 0 ]; then
>>> +if [ $status -ne 0 ]; then
>>>    	echo $tst: dtrace failed
>>>    	rm -f $file
>>>    	exit $status
>>> @@ -78,8 +78,8 @@ EOF
>>>    status=$?
>>> -count=`wc -l $file | cut -f1 -do`
>>> -if [ "$count" -lt 1000 ]; then
>>> +count=`wc -l $file | cut -f1 -d' '`
>>> +if [ $count -lt 1000 ]; then
>>>    	echo $tst: output was too short
>>>    	status=1
>>>    fi
