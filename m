Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A163469E4
	for <dtrace@lists.linux.dev>; Tue,  2 Sep 2025 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756836319; cv=fail; b=ubfQoPpR6OSzhEm0Rp6B/QrV3/ku0FLHif4HdZHhQD/MGxjAurE0m5LKA3XLijSRhxV2VQSMIfYldHfKTrcPOFQ9OUxpfkqsQhLTVEe5cXC/29W4fBoT7xhbw5X6g1D/WY2ZgoKyPFhoYfoeRbPsLN3KK4k/maDpurZh/JOH3NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756836319; c=relaxed/simple;
	bh=HJKvMf/LFymy5Pa6/wMV2bx0L0gpywH0HZzW051qcEM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CHudRVFnTLGZdx7prViB7Q+39MjD4gJOdkKhS/H13VJ3MlZ2TPqqYUcHm2EDL44/flIFBMbS2U8w3BPw0gqDfvBLcYPQFBZ8i3TS0E+NKJzaMXHudrIsbykXnWDF37Ki2U/wWlAZ5812V9vXuvH41gNrTstLUCP4HhOsStN6o/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DVVpKiiv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=thUfKwsf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DVVpKiiv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="thUfKwsf"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582GgVXI012641
	for <dtrace@lists.linux.dev>; Tue, 2 Sep 2025 18:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mIJVPVCpjAMDz/FlvXewshoAV//btw5HqACMk1CAyA8=; b=
	DVVpKiivcc4WJ4B9ffBfLnzMdV8rPzVJoKOCuq+6M2Nk/dJZ061E4+P72YjL1qjW
	0kI6tnTOOPimLzs3zMscceZmepOHvtlAkMLOU/2i1QbZWYkboUEJYpgQZ251A1Mp
	fxrZvYtY9SaGFRXEGZF/v8r4pggHNX6ml9ZLnDe77ofdfykmPGKLJt292W8BiPN2
	Dh9lmJpzmWe6RkwNPowIUAdJicYjrRaoL6E1/+3/GHPJmd5Vf5z75BMjq6Ufmboi
	SaTQa7WF51J0hSLpgDNXNrlfgOhf6z52DnQjl/Rwo0ewSOm1VeWTsAyCry7k8aZ1
	PFGYCr+YPLWoc1Sfm8Ezgg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ushgvp66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Sep 2025 18:05:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 582H41rQ040212
	for <dtrace@lists.linux.dev>; Tue, 2 Sep 2025 18:05:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2066.outbound.protection.outlook.com [40.107.212.66])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrfft94-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Sep 2025 18:05:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLoDeh/DvQq0J4/wia2nWUnCGpaCBtwJG0uLRM7h5CU1XLzOYSvbNOJsP5AzRWBiAVLEMCfo0pZ3KmMOxFzFxhiHq2Z/+X2eTSwxMc3os0boM2YENfdaCvvlaxeANNID1VjSglOqcmcAlSsgZDnST/XUdKBATAdMmV6ngwVIzLUwyhHuN9MXKXkvqd9cgTtc12G6qrB6iMneViAxK7qaVWR/B86UT0vuMD908ia2UiinxVwlBP9PcxyRoqc15B2imFiofwxPH8LPFqAC8XX8uolQbygFawu510eTCgDjtB4NpBXhCXeAdiFx+vDHi3yKhXZXhlnd6dNTRVh+LFw0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIJVPVCpjAMDz/FlvXewshoAV//btw5HqACMk1CAyA8=;
 b=uIxrbTJ8Eb8SWqf8eUzidQrw0ykDfHpYfPpxdlw5a1GICzvYQBvE3lKS9C4sXje2rzsmJU1LLa07+peZlVF7qbL3CVfqQjnB5AkgbYcZCrtvA4XdsCt7sIa1pEq9HqASm5K7pLcn+2kTexk9JqL+4i/06sIfSHC+5UzQBRbwpnJpqKCC0M7XYnQW1T6T4gVpHMiPwhdUIHQEvPW7X3cH6yh1KSXyVGry+B/46TDKluyKaGJi6TV75KxMf6Nd88Cwcu2vjiRoC/+ZJO+EOEBPUu4GeErIHITrDLIdPHzrROaEO79SaB+988jlaM1saXyImvrLgsS3GPIx4hVm+/d1Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIJVPVCpjAMDz/FlvXewshoAV//btw5HqACMk1CAyA8=;
 b=thUfKwsfepRAYG3TA9BKX6zFpztihbA3LtmOmW3r4VMNynqMQOfcTnctjHD/1YzzyaVnmbgzsP2RPxB+bHcTQw3R6kv64tn3KH5I8jrRf5XIyNQKhczXJMYESzdPGzJIE84lmVPSr75CSDxTlWNhSkt29cFC1Ymmc+uu+Yanrvc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7005.namprd10.prod.outlook.com (2603:10b6:510:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 18:05:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 18:05:11 +0000
Message-ID: <a9b623d2-129a-ae26-56cd-46f95a8d0cc7@oracle.com>
Date: Tue, 2 Sep 2025 14:05:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] cg: fix offset for > 8 bit bitfields in
 dt_cg_ctf_offsetof()
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250826081226.591245-1-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250826081226.591245-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 182e9b15-c858-4ec4-d21c-08ddea4b4275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlViZmNkV3E4Y1pWZW1iK2I4NDI1eHJuZkRLaVJTZ2oxSWhNUS82dkZKTElu?=
 =?utf-8?B?a01SbENpaE9VUzREYVRUZm9TMkRFSkRZV1VSOEdZNU41dWkzbDd0RFJrckVo?=
 =?utf-8?B?SHRYOFY3ck9zNDMvOG96THAyRVRVdmhOQUl3TXhsN3JPbnFGTFRIM2E0bnkz?=
 =?utf-8?B?TGxadWVsUWFndHpmb1VadGpPQ2NnTmJpN2NyQVFnZGNZRW5ZbW1TMnhwSUk3?=
 =?utf-8?B?cGdFRXZVWmRydWpZWXN2bGFpaEN4SWFnNnVYckMxUlBtU1ZJbW95cmZJZmxV?=
 =?utf-8?B?YkY0M24yNHBERHJyTXpkR2RQamtpRzl4VFF3OEVTUnlxVnZGS1R0WWI4dXg1?=
 =?utf-8?B?OUZJNE5pOE9VV1ZvUWxCbnhlaTlnVlp4YUZrZW5yM28wWFdUbG00VnFSNGtG?=
 =?utf-8?B?cUh0TmNQSlBaQVE4RTVONHgrQzY4R1A1Z3BrWGVzMkR2SStRYllZbStadDZJ?=
 =?utf-8?B?ZDM4TklJQ2pBbTRLakFYOGM0NnBrOUQyUUhXNHdKTnI5Yk5MUEpmMTNBcEE4?=
 =?utf-8?B?cUlGbGd4QnRIa1NaaFUyVWFZcXNkYnRUVDlyRzdwaGxsVEZPYmFxYWVNOEJJ?=
 =?utf-8?B?OVpDYUdaTk10Uk9NTllsSm5XM2t6SzlqanBQRWM5Q0ZVWVFKSG4rYUFMZ045?=
 =?utf-8?B?bEdSN3drbDJxbStuL0VmVlpRM1llY3dUYmRtNTlSK0MyN2cvRlhYQVFYN3Nz?=
 =?utf-8?B?d2MwMFhnS3kxcC9GZDkwNmZVUDNacXhZaFlQdE1sK3o0ZzJXSG8rVkx2YVRC?=
 =?utf-8?B?ekNDb2thaXNQemhGU05WM3JZb3dOMS82Z2hTU1hoVmhnOXFWSE1ETXlUNDJy?=
 =?utf-8?B?RG1ERGdPTHVEUGhMcDdkdFpjU0I4aWV0M2JPWkxoVkhaMjZPQWd5QitqU1c4?=
 =?utf-8?B?OFlzYTUxZ29GSERIY0VUUUl2Q2tQbUhCK250WVJ0aU1zUWFnclpsdEpYZ3pp?=
 =?utf-8?B?Z05KdzR5SEFDVm8vUWp6OVVSWld1Zi9hQzlCdlRJeUwvSkduZjFSbG5SSDkv?=
 =?utf-8?B?MlpXRnJTWGZPWEJQaGF6b3lmdlAxTVpvMHR4dWdrVTVBOVBIVWRCWnY0OFlQ?=
 =?utf-8?B?dkNkRUYwYjFyYTVRUmpKWWdCZ0dJemowY1ZVcndwb3NwQ0pkT2hKMmZBZndm?=
 =?utf-8?B?bWhsdDdTK0tiYlZqL0F4aWZJT1Y1L0JUODdrRGs0SUoxSmttc09US3djT1My?=
 =?utf-8?B?a05nSUNzZ0NzNy8rdHJ4eUN2a1RFWnpMVWVsa0x4QnJlelA3RXN0aDVQb1pi?=
 =?utf-8?B?Z0ZVa0dDekxHS2FYU1R3aHJyRWF6UHdEWXRjTWJ5bTBLa2h2Syt5SlVZdjdC?=
 =?utf-8?B?ekFveGIwR3dJaFdXVjZDS2laN1hDZGJZNnJwN2lWa1g3SkFxc2RWYlBlV3F3?=
 =?utf-8?B?NjN3a3BqdzA4K3VWdzVlUmo2SnBBWGFMeEZKRTRlMjNFaXJ6VVVHZzA2UXpJ?=
 =?utf-8?B?RzZnazB1ai9RaG10L0Rid3pLQ2pGWkpDVlN2Ny9NUVdRc0F2ajNhNkl4YS9x?=
 =?utf-8?B?cmQ4ZWtZak9XOXpvcWQwRjVBOTBVeXo1KytDSHhDV3RROTd1SXNDUDBoMnZB?=
 =?utf-8?B?K2ZTODRVNG9mUzEvRDdqSXFERnJmRmFXS3ZZc1dnWTNvTVJvR080bDR2UnZ2?=
 =?utf-8?B?SUxtWEozeFBka1dhSzhFbzlENVNoY0xpalNka3BKd2dBK2Z5bEszU0F2SC9I?=
 =?utf-8?B?Q0dpdUJ5V1MvNUVoU2JsOU50djA4SzVUWHhlMFpKQkZyeFRnODJWdGJFSmpi?=
 =?utf-8?B?bG1Gbm5XWFFWblBCTXprVDlVVFVuM2c3bFZMSzNLaHhFYmp0SjVROVpjeUJ5?=
 =?utf-8?B?RU1VbTdEeWphZ3IxNVBUaUYvd0Z4MUdjNFhHaU8xd3JNYzJCTEtkTWg0dSt5?=
 =?utf-8?B?ZjBMMWcvT3dQaGVoaElKNEpDK0IvWHlhY1Zsa2NhUC9UMXhUMUtwOWZqRCtr?=
 =?utf-8?Q?TRDPcWs0r/k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHR4aU94VVNKOTNFc3MwY0xFa3lnNlRacnN4VTlXS0lzbmRQbXppTTJoUDdi?=
 =?utf-8?B?eTFJUUwrMTNYQUlleWlRWWtWVno4Vysyb0ZMVkpWMFo0bHA3TVA3cWREY2Ra?=
 =?utf-8?B?SVorekFKUXVyTEFJS1JneXk4MVRRa1plakJuVUVnRjBWamxYMlZaNlFPUFA2?=
 =?utf-8?B?bzd1Z05qZ2dwT3RuY1B4TnNrVGpWWUxLcHQrNWJDblRXMGJZM0pRN3kvSVdZ?=
 =?utf-8?B?M0srNUVJeGxERGFEbVlNMUN3bWwyUE5rMWhMTlF0Z0x1U0wyOHlSbC9BbnRn?=
 =?utf-8?B?SlpOL1E1Ni9wdk9TZTIvSjVHUThhZ1cyeXd6RDFsT1ZZYmdnMUFiOGw0Zlpv?=
 =?utf-8?B?QWtGU1h5eDQvL2ZLMkNKdGRZbnZhU1FTOTJGcjcrQSttOXpkNmpqNS9TMlkw?=
 =?utf-8?B?emw0bDYyekRLemdRTzhaTmtuS05zZDRUbStUaHNKVEtlVUNEZmYxbWNEblJl?=
 =?utf-8?B?R1E1OUhGVlVPMXY1K2MyS2J1Y2ZwUFJncERCMkRkRktkSk9kMVBsWmxMTXZU?=
 =?utf-8?B?eExDcDF1Y1VtazlnTnVuR3N3M082eENTazFVRHhPR1lwUTZONG5xcU83TW0y?=
 =?utf-8?B?Y3AxYkdBN3MxUFhTcVFXSW05YVh0V2VSVGFWVkZkMWdkcnNmVEcrZk56Qi9s?=
 =?utf-8?B?WndJRVBVUGVxcm1rYnpJajF0U2ZrKzY1a21NZkF2QzZhNCtSWGJPbDAzZWVw?=
 =?utf-8?B?WkpwU3NCcFg4QkNiTEJJSlNzOGh3R2JWYlJvMk5waitXNUJQUTd3eGZuVmJF?=
 =?utf-8?B?K2s1TlllWTNwOE00emZsdjJMdmpwQ0JQQkxrMUVpbmppSGlZMXFzTVdoMHdF?=
 =?utf-8?B?c3NsdlpRR1VYZFNRZlNxMGlMSld2Wmo0aDNVSFdWNittSG94aDFmZ3UxWG4y?=
 =?utf-8?B?ekpIOXZPeDRuTk9HbjNqL0F4Z2V1UER0T1Fha2c4WmJOSjlvRmh4Qkk4Zkpt?=
 =?utf-8?B?YThvU1ZUWjIzSzh2YnV1UlpXWDl0Q2R6SWZkd1lxeG5zQ0U4ZWhibHZnaXNE?=
 =?utf-8?B?YkxLa2svOEs4cnlYZlozVld0MXlJaGxxTUtPZTh5OFJKSW1TRHUzRWc3S0gz?=
 =?utf-8?B?QUlQZHQvdCtWU09rNFp5cnZGdTd0dEtWdVNVdll4WkwyNHhOUSs4Ums4alBz?=
 =?utf-8?B?WTNFTWFmVlRrWFdQdjFzdjdZQ1Q2QzdPcTBjYnorTVY2bUVuL3E3V0x0b28w?=
 =?utf-8?B?UHRKZ2NSVVVGbTU3eTVMQVdGbmxEOVZUYU1FWXd6NFcxU24rUUd6SDBsNkNO?=
 =?utf-8?B?ZnVrVVJhZDNKVXdCeGdWa0gyQnJVQnJIZXZ5S1RWdVp2dlptOWUvN0t2UXpI?=
 =?utf-8?B?Q2FORzBOUmpNUWs4SVYvd2tWNElBYWl4U201UHR3Zmx3Y2ZsOERrcXc0cEtL?=
 =?utf-8?B?WHA5Y3dweEZtalRXT1ZKMk52ZHJKUUxGK0p0NkgydG1ZNTdwZk1QVzlmNldj?=
 =?utf-8?B?RU13dDZ4OXhEZW1FUjlodXpvVmlzSnU1WFp0bkRhVUUyOFg4N0plb296T2RX?=
 =?utf-8?B?U1dncm1jZ3BZelZ5bDZmZWJvdGhGVjNZSnoyemNrVDA5ZmxZM05KRGxpbEFw?=
 =?utf-8?B?eU5JaFo0V0c3ak00a2wvZndOTGt3NzBUSloycEVqMVRtUGpYcmJKWWFHY2Qr?=
 =?utf-8?B?SW9MVlpDMVJvTjN2MlhxZkVZQ0xVc3prckM0Wk5ZLzRwczRwUE1hYlVRNU1l?=
 =?utf-8?B?bmhTRUxTVi9zbkNwdVo0NHNVNDdUd1JVV2o5UENXZEMvdEJXY29jRm5Gc1Rw?=
 =?utf-8?B?bUFhSUt1YnlLRi9DRjR2bk5wNWNpaU9MTXFPTGNqbzN4OEZFdUdZa24rSGpM?=
 =?utf-8?B?K1VBVUtGTFo2aVp2YWJ5SVU5MnNzWkJtdFpkQXFzNnFvdUhteWo2azNKNTVM?=
 =?utf-8?B?OFpxdXJjZjhFb21lNHFuOVMzWFNsSDdlb3JaYVhaemt1eS9UcXZadW1WajRm?=
 =?utf-8?B?UFBwNTYra0JaNHZTV0dSMStWRkt1NGRsV3NPMkN0WUhPZjh4RXF5UHVGQjNk?=
 =?utf-8?B?S1A5MVdYVXZXamtUUXVYQXM5TEZMNnZTRGxDbE56NUNiSjgzRExtV1o2MjFr?=
 =?utf-8?B?dklaQ1E5cXc0d1JUVGFkcllOYmtKc04yTFIxU25sM2liemVGRUhIRG50NTV1?=
 =?utf-8?Q?LFqAFJVrwRD+lxItxNF441NZ2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MHmanCd9zNA13RlkIBtYJ5GwDcNeNvWLdNnCnaMazqoNEuEcTJcFstZ+HWa7D4nAkykpiusHWpSLA88Nn4zkgxqX6JzLA1iLA81Dmb+hCLdT/XiBQNkZtpOLyH2cqkWJiEev1TxiPaaEkBANo48AlMVmIfH0eKgpNUvgeiBJ5ltXjZF0OrMSHG2d9KpFTsWpqv/eXu2OGwLhEcx++jAEeZL8/Yyr4BFqwsYiJz3DWl9raBwzFzttq3N6lCOCP55DqBXP2OMStnzI5gytTMpKD1YMdrnGRDEilveFRAJd1LIlaXMMqfZyrqc6VoVo/G/NuIPkOKNxN+Ag0I19yEAPtaSXhOgsHcH7bKalWIo/16SWJJootpoWe3A9rMyvd8CxibnmFUvI/79jFqH86noOHp0qWGFF4l8wpG08UCdc2XyCsWZuLqTKoE0KDpsYqBshA6nhJ25LHJiHkCrl2y23HMyotbZQ7sVx1T4Tx58fSfcNk5cEypWY/L56olf4bYA4uZTtalRULLTACQaw1Z8lm2GBOBBs7KIEJEtVyhZfxq428taiFUYOh7rMX6xE7N0UVDVkooCNtNwWqQl/OH9fyFJU5VuZtk7bMahX2FjjqmA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182e9b15-c858-4ec4-d21c-08ddea4b4275
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:05:11.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE8eoOk6RZl4l0SuO4pzrg4d7JW/UaBlU2viLiYX30Fq9ghlGvvzkIKr9qwyKlafhE7vcUG1LAlpzdg2HnJNXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7005
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509020179
X-Proofpoint-ORIG-GUID: aCj9_DnanB8pNrQGHFJvZgc26g1IHm8L
X-Authority-Analysis: v=2.4 cv=YKifyQGx c=1 sm=1 tr=0 ts=68b731db b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=wuHKdgGY9IbqWoR8sAsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=DWXRdjMNOu4A:10 a=m8sNJrmRSlsA:10
 cc=ntf awl=host:12068
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXwsH2DygW/BD/
 BhW/m46Ar5moQrvtO6ub7KNlbbhpCXoLcn3il9+S7IK/GniX5TYbhGPmtTtpE7r6NbvwlATiTdn
 y7TK6wObxfqVcWknh3dymjlkL9qUU30i4g/g6sy3SX7VqCwjrWVmV3Ym5SIQxfOmEMq+wTRDl8g
 ImEYsf1cBbj1IB+79SjphviRfr2faKFsHzpeejEhlWkC95MfJgZc65ZIxqCq3RsTrcd7l8c/fjh
 BvJgqbm2C+oP0WU8+ZtQv6ebULVh7pI0Piz3KWL+xtzzMl0s1T+/AYrB1Vi3Ky1kbQN+457JNgt
 UKS9lm/+o5QNFzbSvYb4PgEYB1ZOD9wi7GE/gId9GGqRkIcaj41dgnqxBTwyorCAulDw2DvdAnd
 rp5gFKhl7uWZW3qmU9qOHQqroCgEWQ==
X-Proofpoint-GUID: aCj9_DnanB8pNrQGHFJvZgc26g1IHm8L

So far as I can tell:

*) https://oss.oracle.com/pipermail/dtrace-devel/2025-August/006562.html
     Nick commented on the patch

*) https://oss.oracle.com/pipermail/dtrace-devel/2025-August/006573.html
     Alan responded to Nick

Since this patch is related to observed test failures, can we complete 
this patch review?  E.g., perhaps Nick can respond to Alan's last 
message, maybe even agreeing with Alan's proposal simply to add a 
comment that we don't need bitshifts yet.  If so, Alan can post a v2 of 
the patch and then Nick or I could add our "Reviewed-by"?

On 8/26/25 04:12, Alan Maguire wrote:
> The tcp provider uses dt_cg_tramp_get_member() to retrieve the
> offset of the sk_protocol field in struct sock.  However it
> returns the wrong value on UEK6 since it is an 8-bit bitfield.
>  From pahole we see:
>
> 	unsigned int               __sk_flags_offset[0]; /*   560     0 */
> 	unsigned int               sk_padding:1;         /*   560: 0  4 */
> 	unsigned int               sk_kern_sock:1;       /*   560: 1  4 */
> 	unsigned int               sk_no_check_tx:1;     /*   560: 2  4 */
> 	unsigned int               sk_no_check_rx:1;     /*   560: 3  4 */
> 	unsigned int               sk_userlocks:4;       /*   560: 4  4 */
> 	unsigned int               sk_protocol:8;        /*   560: 8  4 */
>
> In other words it is really at offset 561 but because we just
> lookup the member offset and not the member type offset we get the
> wrong value for the sk_protoocol.
>
> This in turn causes tcp state-change probes (and in-progress UDP
> probes) to not fire since we verify that sk_protocol == IPPROTO_TCP.
>
> The fix is to look up the member _type_ offset and add it to the
> bit offset we get for the member itself.  With this in place the
> state-change probes fire, but the local tcp tests still fail due
> to separate issues with the tcp:::accept-established probe.
>
> This issue is not seen on more recent kernels because sk_protocol
> becomes a __u16 as the number of protocols exceeds 256.
>
> Reported-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   libdtrace/dt_cg.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index cd9e7f4e..7abb5bc6 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1959,6 +1959,8 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>   	dtrace_typeinfo_t sym;
>   	ctf_file_t *ctfp;
>   	ctf_membinfo_t ctm;
> +	ctf_encoding_t cte;
> +	int offset;
>   
>   	if (dtrace_lookup_by_type(yypcb->pcb_hdl, DTRACE_OBJ_EVERY, structname,
>   				  &sym))
> @@ -1973,6 +1975,13 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>   
>   		longjmp(yypcb->pcb_jmpbuf, EDT_NOCTF);
>   	}
> +	offset = ctm.ctm_offset;
> +
> +	/* a bitfield may have an additional > 8 bit offset which means we need
> +	 * to adjust the reported byte offset.
> +	 */
> +	if (ctf_type_encoding(ctfp, ctm.ctm_type, &cte) != CTF_ERR)
> +		offset += cte.cte_offset;
>   
>   	if (sizep || ldopp) {
>   		uint_t	ldop;
> @@ -1982,7 +1991,7 @@ dt_cg_ctf_offsetof(const char *structname, const char *membername,
>   			*ldopp = ldop;
>   	}
>   
> -	return (ctm.ctm_offset / NBBY);
> +	return (offset / NBBY);
>   }
>   static void
>   dt_cg_act_breakpoint(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
