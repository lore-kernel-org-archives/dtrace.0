Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CF115855F
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724273943; cv=fail; b=WnTAVhRfJCnN+X77o/JoJe3oFYijImXTehzz63oF8nLJxPUrGu1Fcob+IZjTNOE+KjUi62odUq1nMnY2bJ9nqTyBCOZnwxMHzyUXAiha8J5rU1c72mfcjNoHZ1sL6TwJXFiiYLzs3bKHIcob4hlqy1Bq5kby1yGDLRD2JCuzK6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724273943; c=relaxed/simple;
	bh=6Y9RVZR07ClRk5eDxDzF47qALzjJIXPx0dvqsBaaL2M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=llWS7QDTPD156Nt8c5Y8pY4RDuchElolWj2g6Onm8r/RiuefED+drnI0lxiu4QZln/EDl+fjgUEMm+I3IGiepsggZrLGD4Zl/08z7UVPTE9QUwZmx+7MxjnTTcvyaVaSXANaEipjTBVdONpYg2tWcgXXgo2obJYDMkuew0MSQNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IYhcIDba; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C2nU9+oj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IYhcIDba";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C2nU9+oj"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKtdox017135
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 20:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=QjnFQNee5zYhl4LwKW7fPEr2QgGgAAmay76nNSeW1lA=; b=
	IYhcIDbaCGqvF2jO87MWtQkvmkfMJYduusw02LkWd1p8IrKYOMlpI/0AJr+ketW8
	TKe4/rDuaHysYmEzq64j+dKg3YNMRpA7QQG32NQzvSr45umkraswHNOFR/F6PX2l
	occBofeAO+EuCcsMpaFmtx40rrdu+sTHwFHm6OekOaUFOjL+2N14gBHNE1iaNYLv
	cSHJCtRUECUYUlHifL3HQtrW/Y7rvv3oU0S26kBTr9qICdWLVorkdsQ+I6arn2PR
	Elx4z5k9Lnc9Psz0OtXwGQNaMD9gGifxQsvLHqUCSW+vxmM3PIYmN4a9WNcdnQRB
	VR3peB9Rlkkv5UNL8eAdig==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412mdt0k7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 20:58:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKwnvT026087
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 20:58:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 415qrgg03q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Aug 2024 20:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQgtko+VCNfMUawO6jq1IzteunES7zNjiI/voW34faT594Nx9qEQR30uH3Y3knCWTnxwSi/idhmcuAb9Q3d1zuYesl7APl/G1HaQDYwG89LJUVe3CltNWsKVdD4NGLuXf5D50QtOTL1vKMFqs1hV7PRUTCwp0g/wGJamHIZu0oXEXRMXCjyVwkOX8IM83j2hlbYuY8UwPIdK+Za9XXUtog299TKTsPr0hIZZRg6/IS2cOTobNO0iNebQdQTAwkvoRDsgik7BL/fczsY3Gg0QbdFr4XZxF+3AEJvpgQcitKKS0CpBnjUdynqe0QkHOdxsHu9SL4EBndw4GJ2xLcSBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjnFQNee5zYhl4LwKW7fPEr2QgGgAAmay76nNSeW1lA=;
 b=F1KMjKpb/NNwlI1mfd0OrpQmkV/Kv9716EDah/DpH9CeLrwFE+ccmAfi7KBQoBvH+Z2wOx5iua8Ex21+Uvc+15t/9nZf7rjXraCYPVFaryqug6QoitAS4gTm+HE4raksMjYJDQWlnYQ4tnZaT6eOxYk8XQcC8S1v07/apGrVHxUWHa8FdL9uxkKYlbizoOMzr27swdNQ6NorG5n0YmWQe77YCnl4smSptypjfUSPLTWeUCSexg4l7Ot7+SnlHU3Qk15RCJ18/ri1F/V2BmovNmI996fWdPlPRkSZBZJHcqut/XM0l45nBvrc7W7ZdYmIxWU1j0BySVKEkrx9CrYTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjnFQNee5zYhl4LwKW7fPEr2QgGgAAmay76nNSeW1lA=;
 b=C2nU9+ojsZp0Jn+mBqitftTR4q7g0fRaO2qtT4iTyebl8KrpuiS4w5DjWyRzyV7gbVOn00wFbyGYqAfTvreb97iwhf1EvFeKUsUxovtLy1drl74YEil16r7fDIUg8rPPoJe8dvIbpEr6xs4h0OGiJ63HxsFbVSoTI0OZHfjtfhI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BN0PR10MB4920.namprd10.prod.outlook.com (2603:10b6:408:128::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Wed, 21 Aug
 2024 20:58:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 20:58:49 +0000
Message-ID: <3bc0ea4f-0f56-a19d-8805-ddeceb70c59d@oracle.com>
Date: Wed, 21 Aug 2024 16:58:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] ioctl: remove obsolete ioctl definitions and ddead code
 that used them
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287296B328D2B3163F27C48C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287296B328D2B3163F27C48C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0017.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BN0PR10MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: b06d29aa-a976-48f6-2d62-08dcc2240dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGxpYzhaRUxBeHJxeEpmSTlvVXVORUVhTlIwUXpCS1BvWjdLaCtDWEVnRit2?=
 =?utf-8?B?R1VRN1RUZDdhV1J0L3BIRXA3ZGRxZjNuODJxb3JYK09KRGRPd3BtWGZ3M1Vr?=
 =?utf-8?B?YzhtcVZ5SThwZjc4RS9iWVB4N2dsT2JjTk5XSW9hUG9xMERZUktzREtHenR5?=
 =?utf-8?B?WDNHUWZYb09YVWFZbURIVHA2TWtFN2FubWV5dmtFZ0dCSEtGVzJIR3RoSlVF?=
 =?utf-8?B?VmZReTl2RjhLVXhoWE9BSXcwRTdqSjRxd0I1aVNVOFNjRTdLenVFTnpWUVhm?=
 =?utf-8?B?QUM0ZW5ROXVSRVI3YXp2Mk9UNjNRZGZRaDJwcEM2T2RONkw3TXZjVE1qeWZK?=
 =?utf-8?B?UXdXV0ZIOFVOVllLbEg3bGg2aUtQdmN1cTcwVHluSnVaYjUveERKd2d3elh5?=
 =?utf-8?B?K2pkNFphRGRqZEQySCtKRFdMendaemVUYlZLdStHTzE2Z01BcUlmb0hJMy8x?=
 =?utf-8?B?WGNodW1obS96QnJ2M2R5U2tlRkhpZU92QzJvSWZqWnRHbThPbzRPZ1JoU011?=
 =?utf-8?B?UWlrVnlXcjhKUzVpMUtzYmRzSjBQVXRrN1NWTmNuNjRqRnZDQ0x0cDNUSzJ5?=
 =?utf-8?B?cGp5L1htNWxnb2NjZkZVckZVM3BIa09Wa2t4aXJHRlpWS1pwWHpCUU5STExY?=
 =?utf-8?B?cFJkMktKcU96Y3hHVFJKU2RKU0IzTDRqcmdRK0ppMVQzbGhlRXpLeXFIN0lM?=
 =?utf-8?B?M0ViaS80S0dPd2VLbndZVi95UG1xVDRTclMvTTgrNUxVUjJKL2l4eW9QUWcr?=
 =?utf-8?B?TE1kbnB6NmZXbVNrRnhkaG9XbnkrY2hOTis4NUl4dDAwc0VFTHc4emxhd094?=
 =?utf-8?B?b1EzYm5GTHY5LzZ6djVDNFNKQVR1dUlPMVI1QnZYaVcxY3E1V0VZd2dlMHZ4?=
 =?utf-8?B?ZmNFT3dTTzVqM0MrcXZLY1VmVWdxTnFVWmdHaldodVBpK2g2NEZkZWVyYWU0?=
 =?utf-8?B?TjRMRmhBVUJyZTNXQ28wRzJCZktCczQyNkhQOXkwejVBRStwSXdHUDZDaGZS?=
 =?utf-8?B?K240cUZkUVdWQzNuU2VqeC9RM3ZUM0VwdzljbklNeDRoMHNsbzN2bUgra21P?=
 =?utf-8?B?UkRoRk5Qb0FIcTU4VG4zYks4azIvNVk4V2c3L3IxSWRCQUduMUN4RzUwdjZZ?=
 =?utf-8?B?ZVYxcnU1MlhNTU4wZW81OWI4Y1ZNdUhHd0psM01xcFdlZGUzVUtIL3g4d0NL?=
 =?utf-8?B?aFcyMGI1TzB0VEp4amZ4Kzd0eDhHWGpaRXpUNURJdnpmMTk0ajBrRWFqMnZq?=
 =?utf-8?B?bzVjNXBwOUI3djFxbktQRFZCKzI5VlNkRmVyUXJBRSttVk43R2dhMzBDblkz?=
 =?utf-8?B?UHkvT1crWnFocGRuT2ErZEZmVVZUZVJLTjlOM3NOV2pFajdPa3hpczMzNHBP?=
 =?utf-8?B?emJwZVI1T2hrSnRvQ3BJcXN6bWY2eXhuc0lQZ0dvQWhKenFpVEtKdzJwMVhu?=
 =?utf-8?B?ZmFTZkFSZlpJZ3FTeHRUVVZzTUNYOS9yVElDN1lhbzZ5NkU5bnhCWDN6eCtk?=
 =?utf-8?B?Q2I0L0pzdWZKY0dkZUNmY1owVWMyYWNpZjJLSUFhNkoyblN5QWJCNElydUVk?=
 =?utf-8?B?b1EyOVdHV29MNmlJeCthakhXT1dZV1N1ZklwUWVuVXIwZUttUVlIVkdFYmxV?=
 =?utf-8?B?aTdJZnJwZzBQdUZva1U4T3pDQnhiL2NkL2hGTE5mQjBrQWMxaEJCMnBEdTZj?=
 =?utf-8?B?cHNUeDh5VWg5bGxHeGlyV3pxYTdRR2U2QVlVSDkwYVk4V3AycXpxcElhMDZS?=
 =?utf-8?Q?azilziqSGRpRnuJsQk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEF5Z0FqSU8wNmJJN0UvbU14ejNqRVEzaUNEcTJHN3FNVXdvR2xkTlFzVXI2?=
 =?utf-8?B?WmFkV0ppckh0LzBlbTlUUTVrSUdRRHdOQ00xNXREdGZMSzhhdm9FMVluRUJn?=
 =?utf-8?B?aGF0V2EwOXdoOHBPL0dJM2RwMDN2QVI5N1lzTFltVi9vYzVkNmNOVEp5T2Jn?=
 =?utf-8?B?YUd2aVlTUzNTdWoxR0dBcDRpSndIZmo2NTQ2N2NiWS9HN2hmTks5RWJOL2Rj?=
 =?utf-8?B?VkNNMmRrTGEzeGdjVjF1dFNOL3Z6VWtteUxmQXZTd0VML3NZZ09SbHBQU1Bu?=
 =?utf-8?B?M3VEVHdMTnFDdEYreVJjMUQyRSszUEVqWWVEeU1tdWZmMzI1bHJoVWU0WTNR?=
 =?utf-8?B?YkliaG9WNy9EZTlaSFFRcmg1a2RsK0oxUlhBaHlZYUZsMFpSYkIrQ25xY2dy?=
 =?utf-8?B?NjdVM0R1SmRjTjROTXhtVzF6dTRCUXF6Zm5TWlEwMGh4SC8yMEw1WFhUWExL?=
 =?utf-8?B?dnBuQzdCSS9oQ2V0UXM1K3Z1SGNqdjAya3dSRWdxRzdNUGNlYk9SWUk3b2Jw?=
 =?utf-8?B?bU0ycFdzZWlnQ3NHSW9jVFh3YTViT3hNZW05T1BtV1ZxMEdmTlAxWmNrK0xB?=
 =?utf-8?B?ZkZTRUlpK2tTMUVMZzUyd09sNGg5VUZMWThOQzV2Y053Ym53b2xhRDc5d2RC?=
 =?utf-8?B?TlJZV0dyQ1IvaU5hUkJ1emU3UE1RVVVIQ3F0UVRxaVlzckRRRWdHQmh0ajNH?=
 =?utf-8?B?NE01Q1V1dXFIZUVVL0Ziem1XVlUydTZKVUdGTnpiNGhHSUlRQ1dPMnJwb255?=
 =?utf-8?B?aDk4U29oWFVFd2VTUjFvWU95M29MUldPdmFuR1ZCcGdIS24xSTR4dzRIOGZM?=
 =?utf-8?B?ZXh6VlJOb1JkTXNXVnBFbXZXV2l3cDJmQW53OHErdEJNOEc1U2M0a2ZHOENt?=
 =?utf-8?B?c0l4MXhONkV5dUFLTHNEQkZtNWRQN2JPMlhVSnRYUTN4OXIrU3VpbTFRbTJS?=
 =?utf-8?B?c2hMOHBYL0QwN3EyM01jdTZzQU54aTVFaXBsaWpFcEFzQldyTytsbXdXSjFh?=
 =?utf-8?B?SVQ2WVlPL3EvL0xGQzhmWFBpdE1IU2tob04rV0tCU2FkTE5xUkZTQWVwdEV5?=
 =?utf-8?B?YmdmNnNUOUtaU2Vvb2pTNUt2TTc2SThJVThpMGZydHVzRnpYUUZwUDA0azQr?=
 =?utf-8?B?bnUxUzRuckNsbFFPZWQyWDhkYnhnd0JmZTA3a3YvQnZxQ3RwM09oZElFbFpX?=
 =?utf-8?B?aEl0MHN6Yjk2VFZZT05WYTczMGM3VUIwNzlSNnpQemZnTE9RSWo4N1dMMVdQ?=
 =?utf-8?B?SnJYWTJBN2xmdCtPZjFadGsvR2h5VDJybndKRVBzalNCK2pDQ0dtQ0tHOHB4?=
 =?utf-8?B?S0FSYUp0WkpWYVVTQVI2REZXQmRPSHpBMmphM080Z1FKRlprcEFodDAyV3ZW?=
 =?utf-8?B?UStqYnVheHkyTzBiZThCVkJJZFFyTHpFb3FzK0VHUlhTQThTb29DU1Q2RWRT?=
 =?utf-8?B?Skdjb3h5cEE1VUM1TFQwZUVlNzd3NWtzU2s4OElRLzA0ODY1eWRhQUpSejlW?=
 =?utf-8?B?ckRNeGlCelBBbXlNNmtYbDllcUhpZFFZeURVT2xwYnFUbmduN0ZrQlBhcEQ0?=
 =?utf-8?B?NEwwblB3d3gwTWJ3SzdneXJnN2xBTndrWDJBS2k3KzFMRDcvTTlZcE5pWXN2?=
 =?utf-8?B?ZDltU3luWjRPTDFvbTIrZUorQXhSbzF4TTluYzlKaTdJcTVRdzd0dkpQWS9R?=
 =?utf-8?B?d1F0Ym9PazIxVmZQNDA2dk9FSUd4czNQY1lYTFkzQ0ltSnpQeHZRd0Z0cGJz?=
 =?utf-8?B?LzlhSmNUeUxkc1JsYnNucktLaHIxcDR1ZEVJVTZ4ZnU1Vi9xNUU4MTlTRmxn?=
 =?utf-8?B?OFBIT20xVjlmSUg1VUZWYXJ2QXFDcjVFYTVkM2hlWU5neUlPaHdWS3N6aDEy?=
 =?utf-8?B?NVNrc2J1YTRDblVkeTZZekJ2S3I1TWk5aVJIM1QvSDgzMzc1YVhPUXFHZFE5?=
 =?utf-8?B?OWNrN0gvTkx5TUVmRm9HM0xvZ3ZNYWxIRjB4TVhGSEVwY0lJTkJacTVxWWlE?=
 =?utf-8?B?TDNwOFhsSnVlZHQ1NHpRYU5ldElveGNJbnZncnA0RHdJVHpMQU85TG9ReXBn?=
 =?utf-8?B?TFJwejVkbFFOL3BvR3UzNUF5UEhVeHFnMFM3VjlCZnlhRUxUL3FqRVdwL2xN?=
 =?utf-8?Q?0aeGyR6CUlol4idc8yp3pqJKp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rUxiIjHGDr93ZandpiOtkObr89IbQ9PbU5dEFsIJvN343aC2kM9/kNZWIwdLdlDgJ+3MF7yKZV19igDqWuDRJdNjjJ+QXcvPF305N8hMxwFBYKtYIheVQj7qx0tVmW9hERnx2YKKrEI6IkN6JKPkQQQRExbibSI8lMD3zqqsChagaqjn2+on2hUGlsp+mHnoX3WyoJNnBJvxUE6N018jKRcCBqPaK6LUhgWkPWGO5J6/HCQ1jBlUJbc4CzGDpmCA4KjHav37graqqREMzajtyb7M4RTX9aaz46dXitJG3SwQAJlRaBm7dc7LueCHifHYEMuwFRGFpcXrEX5vFbXseMTeZyczkZSAm5Dj9z/d51BLNval2DtrgdAndkqPdWlVWg+sTTl8edl0fo1r+e+Uw+bZoIic32+MiUc0bnH90NBqBqCEEJa0UHBZ5QnwTFKf/LYpzvCtkbEy+lZA/bHMbaOXS9ecoGPAMQs/ujApZAbALggaqAVyC1TbJqgmjxMUMr0fEKSXX/uMUZiMUosUiDC9MFFBFhLJl1SNW5355ZDgOQFdzq8yeHAImxWHnfSG2Fb7yJ1/0qEVpxK4xLHwtQ1fLiyjp83HMf5h5mGTn48=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06d29aa-a976-48f6-2d62-08dcc2240dfd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 20:58:49.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lA5H1BKmW2uTcfTA6f40oWIA61RveTepc5PljQReUyAqmxIuT6rdBYcpqF7B+7wuYR8hnBOzl7YzUPM2tLx+ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_14,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408210154
X-Proofpoint-ORIG-GUID: cvU8gluTOBrUwx2Nl5u1_cmyYJP85rNO
X-Proofpoint-GUID: cvU8gluTOBrUwx2Nl5u1_cmyYJP85rNO

s/ddead/dead/ in subject line

The patch seems to leave these orphaned references:

     include/dtrace/dif.h: * use DTRACEIOC_CONF to dynamically obtain 
the number of registers provided by
     include/dtrace/dif_defines.h: * use DTRACEIOC_CONF to dynamically 
obtain the number of registers provided by

     libdtrace/dt_options.c: if (dt_ioctl(dtp, DTRACEIOC_DOFGET, &hdr) 
== -1)
     libdtrace/dt_options.c: if (dt_ioctl(dtp, DTRACEIOC_DOFGET, dof) == -1)

If you're getting rid of test/utils/baddof.c, then this should also go:

     test/utils/.gitignore:baddof

Also, then, what happens to "./runtest.sh --baddof"?  Shouldn't 
runtest.sh also be cleaned up?  (Look for "baddof" and "BADDOF".)

What happens to test/utils/badioctl.c?  Disappear?  If so, then also 
need to clean up test/utils/Build and test/utils/.gitignore. And maybe 
also ./runtest., although "./runtest.sh --baddof" cleanup might already 
take care of that.

On 8/21/24 13:27, Kris Van Hees wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/dtrace/ioctl.h |  23 -----
>   libdtrace/dt_probe.c   | 132 ----------------------------
>   test/utils/Build       |   2 +-
>   test/utils/baddof.c    | 191 -----------------------------------------
>   4 files changed, 1 insertion(+), 347 deletions(-)
>   delete mode 100644 test/utils/baddof.c
>
> diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
> index a2a3a93b..2273453a 100644
> --- a/include/dtrace/ioctl.h
> +++ b/include/dtrace/ioctl.h
> @@ -9,30 +9,7 @@
>   #define _DTRACE_IOCTL_H_
>   
>   #include <linux/ioctl.h>
> -#include <dtrace/arg.h>
> -#include <dtrace/conf.h>
> -#include <dtrace/dof.h>
> -#include <dtrace/enabling.h>
>   #include <dtrace/helpers.h>
> -#include <dtrace/metadesc.h>
> -#include <dtrace/stability.h>
> -#include <dtrace/status.h>
> -
> -#define DTRACEIOC		0xd4
> -#define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
> -#define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
> -#define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
> -#define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
> -#define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
> -#define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
> -#define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
> -#define DTRACEIOC_STATUS	_IOR(DTRACEIOC, 11, dtrace_status_t)
> -#define DTRACEIOC_GO		_IOW(DTRACEIOC, 12, processorid_t)
> -#define DTRACEIOC_STOP		_IOW(DTRACEIOC, 13, processorid_t)
> -#define DTRACEIOC_AGGDESC	_IOR(DTRACEIOC, 15, dtrace_aggdesc_t)
> -#define DTRACEIOC_FORMAT	_IOR(DTRACEIOC, 16, dtrace_fmtdesc_t)
> -#define DTRACEIOC_DOFGET	_IOR(DTRACEIOC, 17, dof_hdr_t)
> -#define DTRACEIOC_REPLICATE	_IOR(DTRACEIOC, 18, void *)
>   
>   #define DTRACEHIOC		0xd8
>   #define DTRACEHIOC_ADD		_IOW(DTRACEHIOC, 1, dof_hdr_t)
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index e1099d75..a40b90a8 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -186,131 +186,6 @@ dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
>   	return s;
>   }
>   
> -/*
> - * If a probe was discovered from the kernel, ask dtrace(7D) for a description
> - * of each of its arguments, including native and translated types.
> - */
> -static dt_probe_t *
> -dt_probe_discover(dt_provider_t *pvp, const dtrace_probedesc_t *pdp)
> -{
> -#ifdef FIXME
> -	dtrace_hdl_t *dtp = pvp->pv_hdl;
> -	char *name = dt_probe_key(pdp, alloca(dt_probe_keylen(pdp)));
> -
> -	dt_node_t *xargs, *nargs;
> -	dt_ident_t *idp;
> -	dt_probe_t *prp;
> -
> -	dtrace_typeinfo_t dtt;
> -	int i, nc, xc;
> -
> -	int adc = _dtrace_argmax;
> -	dt_argdesc_t *adv = alloca(sizeof(dt_argdesc_t) * adc);
> -	dt_argdesc_t *adp = adv;
> -
> -	assert(strcmp(pvp->desc.dtvd_name, pdp->prv) == 0);
> -	assert(pdp->id != DTRACE_IDNONE);
> -
> -	dt_dprintf("discovering probe %s:%s id=%d\n",
> -		   pvp->desc.dtvd_name, name, pdp->id);
> -
> -	for (nc = -1, i = 0; i < adc; i++, adp++) {
> -		memset(adp, 0, sizeof(dt_argdesc_t));
> -		adp->ndx = i;
> -		adp->id = pdp->id;
> -
> -		if (dt_ioctl(dtp, DTRACEIOC_PROBEARG, adp) != 0) {
> -			dt_set_errno(dtp, errno);
> -			return NULL;
> -		}
> -
> -		if (adp->ndx == DTRACE_ARGNONE)
> -			break; /* all argument descs have been retrieved */
> -
> -		nc = MAX(nc, adp->mapping);
> -	}
> -
> -	xc = i;
> -	nc++;
> -
> -	/*
> -	 * Now that we have discovered the number of native and translated
> -	 * arguments from the argument descriptions, allocate a new probe ident
> -	 * and corresponding dt_probe_t and hash it into the provider.
> -	 */
> -	xargs = dt_probe_alloc_args(pvp, xc);
> -	nargs = dt_probe_alloc_args(pvp, nc);
> -
> -	if ((xc != 0 && xargs == NULL) || (nc != 0 && nargs == NULL))
> -		return NULL; /* dt_errno is set for us */
> -
> -	idp = dt_ident_create(name, DT_IDENT_PROBE, DT_IDFLG_ORPHAN, pdp->id,
> -			      _dtrace_defattr, 0, &dt_idops_probe, NULL,
> -			      dtp->dt_gen);
> -
> -	if (idp == NULL) {
> -		dt_set_errno(dtp, EDT_NOMEM);
> -		return NULL;
> -	}
> -
> -	prp = dt_probe_create(dtp, idp, 2, nargs, nc, xargs, xc);
> -	if (prp == NULL) {
> -		dt_ident_destroy(idp);
> -		return NULL;
> -	}
> -
> -	dt_probe_declare(pvp, prp);
> -
> -	/*
> -	 * Once our new dt_probe_t is fully constructed, iterate over the
> -	 * cached argument descriptions and assign types to prp->nargv[]
> -	 * and prp->xargv[] and assign mappings to prp->mapping[].
> -	 */
> -	for (adp = adv, i = 0; i < xc; i++, adp++) {
> -		if (dtrace_type_strcompile(dtp,
> -		    adp->native, &dtt) != 0) {
> -			dt_dprintf("failed to resolve input type %s "
> -			    "for %s:%s arg #%d: %s\n", adp->native,
> -			    pvp->desc.dtvd_name, name, i + 1,
> -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -
> -			dtt.dtt_object = NULL;
> -			dtt.dtt_ctfp = NULL;
> -			dtt.dtt_type = CTF_ERR;
> -		} else {
> -			dt_node_type_assign(prp->nargv[adp->mapping],
> -			    dtt.dtt_ctfp, dtt.dtt_type);
> -		}
> -
> -		if (dtt.dtt_type != CTF_ERR && (adp->xlate[0] == '\0' ||
> -		    strcmp(adp->native, adp->xlate) == 0)) {
> -			dt_node_type_propagate(prp->nargv[
> -			    adp->mapping], prp->xargv[i]);
> -		} else if (dtrace_type_strcompile(dtp,
> -		    adp->xlate, &dtt) != 0) {
> -			dt_dprintf("failed to resolve output type %s "
> -			    "for %s:%s arg #%d: %s\n", adp->xlate,
> -			    pvp->desc.dtvd_name, name, i + 1,
> -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -
> -			dtt.dtt_object = NULL;
> -			dtt.dtt_ctfp = NULL;
> -			dtt.dtt_type = CTF_ERR;
> -		} else {
> -			dt_node_type_assign(prp->xargv[i],
> -			    dtt.dtt_ctfp, dtt.dtt_type);
> -		}
> -
> -		prp->mapping[i] = adp->mapping;
> -		prp->argv[i] = dtt;
> -	}
> -
> -	return prp;
> -#else
> -	return NULL;
> -#endif
> -}
> -
>   /*
>    * Lookup a probe declaration based on a known provider and full or partially
>    * specified module, function, and name.  If the probe is not known to us yet,
> @@ -339,13 +214,6 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
>   	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
>   		return idp->di_data;
>   
> -	/*
> -	 * If the probe isn't known, use the probe description computed above
> -	 * to ask dtrace(7D) to find the first matching probe.
> -	 */
> -	if (dt_ioctl(dtp, DTRACEIOC_PROBEMATCH, &pd) == 0)
> -		return dt_probe_discover(pvp, &pd);
> -
>   	if (errno == ESRCH || errno == EBADF)
>   		dt_set_errno(dtp, EDT_NOPROBE);
>   	else
> diff --git a/test/utils/Build b/test/utils/Build
> index 1398822b..494806fe 100644
> --- a/test/utils/Build
> +++ b/test/utils/Build
> @@ -3,7 +3,7 @@
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   
> -TEST_UTILS = baddof badioctl workload_kernel workload_user showUSDT print-stack-layout
> +TEST_UTILS = badioctl workload_kernel workload_user showUSDT print-stack-layout
>   TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
>   
>   define test-util-template
> diff --git a/test/utils/baddof.c b/test/utils/baddof.c
> deleted file mode 100644
> index 5f844625..00000000
> --- a/test/utils/baddof.c
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <sys/ioctl.h>
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <stdarg.h>
> -#include <fcntl.h>
> -#include <errno.h>
> -#include <math.h>
> -#include <string.h>
> -#include <dtrace.h>
> -
> -void
> -fatal(char *fmt, ...)
> -{
> -	va_list ap;
> -
> -	va_start(ap, fmt);
> -
> -	fprintf(stderr, "%s: ", "baddof");
> -	vfprintf(stderr, fmt, ap);
> -
> -	if (fmt[strlen(fmt) - 1] != '\n')
> -		fprintf(stderr, ": %s\n", strerror(errno));
> -
> -	exit(1);
> -}
> -
> -#define	LEAP_DISTANCE		20
> -
> -void
> -corrupt(int fd, unsigned char *buf, int len)
> -{
> -	static int ttl, valid;
> -	int bit, i;
> -	unsigned char saved;
> -	int val[LEAP_DISTANCE], pos[LEAP_DISTANCE];
> -	int new, rv;
> -
> -again:
> -	printf("valid DOF #%d\n", valid++);
> -
> -	/*
> -	 * We are going iterate through, flipping one bit and attempting
> -	 * to enable.
> -	 */
> -	for (bit = 0; bit < len * 8; bit++) {
> -		saved = buf[bit / 8];
> -		buf[bit / 8] ^= (1 << (bit % 8));
> -
> -		if ((bit % 100) == 0)
> -			printf("%d\n", bit);
> -
> -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) == -1) {
> -			/*
> -			 * That failed -- restore the bit and drive on.
> -			 */
> -			buf[bit / 8] = saved;
> -			continue;
> -		}
> -
> -		/*
> -		 * That worked -- and it may have enabled probes.  To keep
> -		 * enabled probes down to a reasonable level, we'll close
> -		 * and reopen pseudodevice if we have more than 10,000
> -		 * probes enabled.
> -		 */
> -		ttl += rv;
> -
> -		if (ttl < 10000) {
> -			buf[bit / 8] = saved;
> -			continue;
> -		}
> -
> -		printf("enabled %d probes; resetting device.\n", ttl);
> -		close(fd);
> -
> -		new = open("/dev/dtrace/dtrace", O_RDWR);
> -
> -		if (new == -1)
> -			fatal("couldn't open DTrace pseudo device");
> -
> -		if (new != fd) {
> -			dup2(new, fd);
> -			close(new);
> -		}
> -
> -		ttl = 0;
> -		buf[bit / 8] = saved;
> -	}
> -
> -	for (;;) {
> -		/*
> -		 * Now we want to get as many bits away as possible.  We flip
> -		 * bits randomly -- getting as far away as we can until we don't
> -		 * seem to be making any progress.
> -		 */
> -		for (i = 0; i < LEAP_DISTANCE; i++) {
> -			/*
> -			 * Pick a random bit and corrupt it.
> -			 */
> -			bit = lrand48() % (len * 8);
> -
> -			val[i] = buf[bit / 8];
> -			pos[i] = bit / 8;
> -			buf[bit / 8] ^= (1 << (bit % 8));
> -		}
> -
> -		/*
> -		 * Let's see if that managed to get us valid DOF...
> -		 */
> -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) > 0) {
> -			/*
> -			 * Success!  This will be our new base for valid DOF.
> -			 */
> -			ttl += rv;
> -			goto again;
> -		}
> -
> -		/*
> -		 * No luck -- we'll restore those bits and try flipping a
> -		 * different set.  Note that this must be done in reverse
> -		 * order...
> -		 */
> -		for (i = LEAP_DISTANCE - 1; i >= 0; i--)
> -			buf[pos[i]] = val[i];
> -	}
> -}
> -
> -int
> -main(int argc, char **argv)
> -{
> -	char *filename = argv[1];
> -	dtrace_hdl_t *dtp;
> -	dtrace_prog_t *pgp;
> -	int err, fd, len;
> -	FILE *fp;
> -	unsigned char *dof, *copy;
> -
> -	if (argc < 1)
> -		fatal("expected D script as argument\n");
> -
> -	if ((fp = fopen(filename, "r")) == NULL)
> -		fatal("couldn't open %s", filename);
> -
> -	/*
> -	 * First, we need to compile our provided D into DOF.
> -	 */
> -	if ((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) == NULL) {
> -		fatal("cannot open dtrace library: %s\n",
> -		    dtrace_errmsg(NULL, err));
> -	}
> -
> -	pgp = dtrace_program_fcompile(dtp, fp, 0, 0, NULL);
> -	fclose(fp);
> -
> -	if (pgp == NULL) {
> -		fatal("failed to compile script %s: %s\n", filename,
> -		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> -	}
> -
> -	dof = dtrace_dof_create(dtp, pgp, 0);
> -	len = ((dof_hdr_t *)dof)->dofh_loadsz;
> -
> -	if ((copy = malloc(len)) == NULL)
> -		fatal("could not allocate copy of %d bytes", len);
> -
> -	for (;;) {
> -		memcpy(copy, dof, len);
> -		/*
> -		 * Open another instance of the dtrace device.
> -		 */
> -		fd = open("/dev/dtrace/dtrace", O_RDWR);
> -
> -		if (fd == -1)
> -			fatal("couldn't open DTrace pseudo device");
> -
> -		corrupt(fd, copy, len);
> -		close(fd);
> -	}
> -
> -	/* NOTREACHED */
> -	return 0;
> -}
