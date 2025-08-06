Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F0928D85D
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495927; cv=fail; b=rx/kNr24rejxORm6wEBnvGBS5z+nGiT3ef7psDeskg63fBfjbOzEreBC2K6HukFc/3gOSvxkxANUak5rp5fGYYh8CAzHiBlUKKIFs8u1ZpYYeZbDsvsM4XQL57zFT54CVmWmMF/J0trEauztdhGxJj7izmKwZ+qTFmJQFvX5NFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495927; c=relaxed/simple;
	bh=E+z3l7nmAw2+BTYuLS8OtWT+/HKiKIyGLa3a8bBwxhc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I4P20d0k29kKnxKPIiQs3+qAWI6qPtWkKSD9u2q/SO2RXJlJOtd/q5VLRqIuHIjOuhGPicMBY6PhHi5QEAROmpH5MPpu7H2zXV6d52+lWcv+I/WM2k0wTtrnvI9vm7oQ/HYPyKU8tbM7yhjWbWHj8hRmWqvNJ+DM1a1qNxjQNqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HSC1fguK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uUkAZSUU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HSC1fguK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uUkAZSUU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CRT0t031171
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 15:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=FLVHNh4nRHAc6+BP1ZsiTwVtJ7yLymEjMG9kC/2icqI=; b=
	HSC1fguKBXHET4IRYhsQ2zjyD9dOqRZypRfWmT8yk9sIV3RHtkvrmZ5P2aEbmwR8
	Q+qEjPoqVe2lCuUcrtF7dRWclQmLT1iNcaP3sV04JP9dcuLo+PwFfaz8D9gsz6M9
	8E/0OPvDYlmB79Thz+Nk+5yivzePbtO/3TvUfgSRamy1shOlWuonHOOBR5gspbjL
	U1DzIw+8oyuBm4PeEVD5VRvPkarjjxgriRmdqTvQ6Ddhmttfo91LUEvNSFyd39Ph
	+mZFx3Zq9sGtbECRVkH+UsgP/2A/ng8faEOWM+T76/tbwzM6ZsKH1/X5lZSQ+IxX
	qPomsXuqxjCtAS53y3rs7w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf22r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 15:58:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576EM2ce018366
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 15:58:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwr7ruh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 15:58:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYouWsn7iy6h2xFcNC8pFI5lUaXZbD/nCucAQax5Se9kL24zdKLeOXAV4lJs65CUvPRWYermv2zM/iSWJLXH721NmWwWSC/e410NKQHaPxe5bs3O28+kc0wWWErSyvT5Pi/r4QHKx8A83suulMzo0ftZe3U9F5cbVtr4LCG3WJ2XzZeGnh+uhKKVGiuLGeV/ju5OwcU/eCK2TZr5dInrRJ80EPeeFuj8yY2O+EAfhhgAhsmQTCwYZP27y9PLeVVLFShgWMoIepx9cTRSOu8Oqly818U5RH2O/piN9fzui/PumYOGOYd2FebaLjZEI5KhWrZfZ3U0kghFRH+538VANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLVHNh4nRHAc6+BP1ZsiTwVtJ7yLymEjMG9kC/2icqI=;
 b=VBOAIKDdFYUw+aH18cgYVdaWypBh6/WX2VQzl1uzsnn5Mt/DgAHuSEfruEvY50oMdE8V2Ma89F01VIUnrD8EE6Lv/xtRj4JfpwR2cyuk2QbadYj0pgjX82S2ZToMUfM5PYhVXcP27pn/9gH8TOVon7T5ECP2W1B7COy8eRZNsc5W7J81m0onWAm2mHJ+XeKV2yYMFxG35phq7t2sx3hE26r/Lf1Jc5x5IaQhCYwGKtN7AjvcRWKnS3nB8nK3CopimGB7dZj1aREqhF/X7OqBtRrYTDA7c/64u22g6q+nIMs+t6WHXLs82H9hk42a6FNfUi4jUri3rq5rdl4fvKRDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLVHNh4nRHAc6+BP1ZsiTwVtJ7yLymEjMG9kC/2icqI=;
 b=uUkAZSUUI1oiC4w2dPYhBj8TldYXX93ZbH+eLxJbYn4hpIgfMaFMKrpyX+mfXddkZDeuW9HAUNzVS3MGtS0llJSXiyEnPXv7OihmGd0W3N8fzQwmafOCGMKfY9AiReih9ebD2zAKBNnXRC6nc7NgpDtOdXxQvWTgXtF5QsLjjBA=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 CY8PR10MB6876.namprd10.prod.outlook.com (2603:10b6:930:87::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Wed, 6 Aug 2025 15:58:32 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 15:58:32 +0000
Message-ID: <b9c18809-79fb-403b-8705-3b53dc2aced4@oracle.com>
Date: Wed, 6 Aug 2025 16:58:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] test: Add tcp to expected providers
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250805201841.19694-1-eugene.loh@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250805201841.19694-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::19) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|CY8PR10MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: ba4a3eb5-d29f-4051-3301-08ddd50217a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3k2KytqbzZJM3gyV3dmNFNJelpCb1VKM0phdlRSK0kyQ0tMWXNJbnB4bGl1?=
 =?utf-8?B?L3dVR3F0V3h2bTVEK3JBNzdOQ3VpZXMrQURCcU0rMlp3OEdueVEyZnFxUS9X?=
 =?utf-8?B?ZmlIem1PcTJ4YzBQWDJrUTQ5MjgrTmVwN2RWVEhidExycHdNVXBoVEo0RDlM?=
 =?utf-8?B?djlVSC9vRzZYQTdzQ1JCdmpVNDVSckRuWHZQelkzbmRhcVpEV0NwVUtqZ2FE?=
 =?utf-8?B?TWpzNkdiNFVpKzVzaXpHZm1yQkVTN0oycHlUNmthWi9kMGNZWmFjb2lSeTVN?=
 =?utf-8?B?VXJ4MFh5WGkzQklwRFJ1QUFnUWJCMkdiRnNuZStKYnQ4ZUE4QUE5cEpvdUJR?=
 =?utf-8?B?T2pZOEVoVm4wY1Yvc0lIRko4ZmRJcEtUMUhNTEQ2U1ZTbUVDS3BZN2hJcEtl?=
 =?utf-8?B?U2tRejIxeVl6OWgxV2N3OUFjaXhyUFhSQWMzcjBnMldldTZHdkZCRTRVaytO?=
 =?utf-8?B?RElTNlgzVUVhbnR4YjgvSW9SWkhjUkJ0emRJcHZSb1hpU3FZTzJSaHdkdzRh?=
 =?utf-8?B?Nm5lMDVwUEVIT3V1M2NpQTMyakx3YnhHMThjR0FMQ3FodTVGWWZuT2dYN21q?=
 =?utf-8?B?WkFCL09nTC9acmRiR3JSVXNrVmkvaGtkWUNrYnJoZEtkdENJSzA2RWU1eUU1?=
 =?utf-8?B?VWIweU5QUFdMeXNQdElpZk9NQU5raXIvcUxPTEZrdjlKNERId0VsSjdEUEx3?=
 =?utf-8?B?ZjhPZnlneWc5RXdKOVRtZ2F1NjlWMkJJL3pYdVhRV0V3TXRaK1lKQTJWa25s?=
 =?utf-8?B?dDFCNUsyb2JaR3NwdVErb005dEhuYWN5R3lHWHpuMWI0VDQ3TzNvaEFiaXlM?=
 =?utf-8?B?TTNIR3NtMzMyaWVsb3B2cmNiNzN0QlQxZHREa2NKUVBTSnNVMktXL09GV2sv?=
 =?utf-8?B?SjJXQTk4cmxHYk4zMll0WjlsdlVqQW52dW5LbFRDbW9EQ3gwZTM1TWt5eUJG?=
 =?utf-8?B?ekhGZ2pJdmFnbm9IM0I5TUxnNjJ4Z01CdnFQbWMzZmFFWTRUeXBxTk5QakV0?=
 =?utf-8?B?SFA4WW1qT09BMnl2Qlp5OHJUTXY1QW1MSjgwNEpvQXYxQ3RaNm9GMmZRazk0?=
 =?utf-8?B?MmtyS1ZXdktHTWQ2cVQwZ2NsRmFMTjlEcFNLTXVvZDRKcUdRWGhScHFlS1o4?=
 =?utf-8?B?NmZkWVdhdUxWam56ZHpBSG5CUU1mTTRMWFpWOVF3d2VETjFVUkZNWk05MFJR?=
 =?utf-8?B?ZHRaTHl4V2F3NEU4T0VzS3V3SXZyeGVsOVhiTCtOZHFHeE4zV3FHaWVRYjZo?=
 =?utf-8?B?azg5Nk1FZE8ramxadStyNTdxVnB0WStKaW80dHhUSHIyOTc2V2VRQzMyZ1Yy?=
 =?utf-8?B?YTVMZzlxcU44dWVpWUN2b1hQZnJDSXp1ZDZOOEkvVFphNHVBakdCbFV4U3BH?=
 =?utf-8?B?Y242WTZuMXRQS25iWDZjMVVYSU1IZjZ6RittcFM4SEhDS2R6SDJMbWh3UDZK?=
 =?utf-8?B?enpxZ0FmYVJneWx5M2pObGNRWXVtOFZrb2VHalBuUVdEcDBjVTJtdnJKRXhX?=
 =?utf-8?B?WjJ1NnZqUWg2SjF3VlhWNlpuTUdhQ1BYSmJYSm9mTXprRTdqUTgrYkM3cy9l?=
 =?utf-8?B?R2FrcmYzTlZpWmpweS9iYlI3YTljL0dzbEh6OVE3b3RwMnJyUVRIajBGUVNK?=
 =?utf-8?B?R0JtdjloZkdrUnNHd3lidzlhZXREOWRNTklhVWhMclVINnRqOVhUZHZhRkRv?=
 =?utf-8?B?ZUNnMlRKWFpMdTZGODFsaWJ2dkloRHlCSVN4d1pNNzJzRUZJeXhqclAySktp?=
 =?utf-8?B?N0dLYWMyYVJSK0VuZ0tSaFVJUEVDVmx5RzBqd2ErbkhUUjRVQ3lKaDdCeWNo?=
 =?utf-8?B?cXFzR09jTEMzUlFtS1FBYi81a2pmTFcycER1ZzRBMWhDMnAxd3doRS84a2V2?=
 =?utf-8?B?c2gxamx2V1YyVkRsRHhmQ0s1a05FaWpNUnZvUTd3MzNGOU03N3BVVlJ6WUc5?=
 =?utf-8?Q?42cElnAi3j8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFkvT2VwVDNhY0V5dCtoZTErM09HaE05K2lHMlJ6T3d4dlpnYnlaWDk4UFpm?=
 =?utf-8?B?OFlOMExKRmNDUExvclQwQktEVXc2NXFjT01VQzdPV05rdE40aHFFNUU5ajR5?=
 =?utf-8?B?akF1amN6WmlsTGdXbWVjaWt5VlV2M0hnbVpvM0xob2hCR0tydU9NM0d6Ymlo?=
 =?utf-8?B?Q0dkNVRYV1BqR3pEZ2hHZnFZeWZYUkRGaFB3VENOUGIzaUVoNUlqR3JXRSs4?=
 =?utf-8?B?UXhCT2gzcVFubGFLTjdRT0NXQ0tKeGFReGF3OXRsbzhubzk2elBpcTgyaDdy?=
 =?utf-8?B?YlRpaUlldFhSSHI1L3BtRUYyNk1VY3dPS0FBVldBOFY4blJFOHh6Mnplc1d2?=
 =?utf-8?B?T0lieE45NWNQRE91em9wdnAxZk9ad1hzR0t1L0wrUEFTZkY3REZFTVI5d3Nz?=
 =?utf-8?B?Z0lyclNjdW1kb3VDNnMvTDZHai95ZGorUGM4c2JOMnM4US9KdXdrNTAwYXBj?=
 =?utf-8?B?S24rdVBHZ01sV2pSM2oyRmJJd1lSWk5MTGthS2QwQUZXTVp3a1FneGhXVUVT?=
 =?utf-8?B?TkZlMnRYUDBiSEpsM0h3RjRkN1RJVnhsa2pPQWFhNVhYa0ErczFEVDVBMVdG?=
 =?utf-8?B?V3BCZFhLUEtneDhCeUMxb3FvK3VUR1Ird1h3aXEwNWxacGNNNUdKZlkyU1FL?=
 =?utf-8?B?RkdRYjlQRVQzUDQzUTJHNHNpUUZ0RkRTZUIvTE94S3E4M2RqQTdsRFNjeFRB?=
 =?utf-8?B?Q1ZpZXRXZjA0OHdWNUV5cDVySCswTzIwTE1GMkhKQXVMMUp5ZHVlRFNUT3gz?=
 =?utf-8?B?QmlKbUdiZUVSVGpna0JZTkNPMnZTdU1KQzV5VHdianhGYzdzc0ZTUmxqMlhM?=
 =?utf-8?B?eG9INXVGdTRrWDVHMjRMYVJ3QXJ4QkxKRGVyV0NYRTdoeE9UVlFVeWl3SlE3?=
 =?utf-8?B?SHJmRitpZUovTTc1QUZucFlWZGJOMzZVRkZlbENEYmxlTC9jcHBkVFcyU0k2?=
 =?utf-8?B?ODBORXBYaVpWTG9EM3oxRVlMSUdQY3ZoWm43TldIYitpVkZQaUtNZWltOXhP?=
 =?utf-8?B?dUg0cmttbWNBeU1PQUJsMU5uNFJtdFloQkYreFh6UVh3MlZHdFc0MGgzNTVN?=
 =?utf-8?B?U3JIY2Q2cGJPYlNjNFA2RlFrRUVKditXd1c4dk01R3NwSjc0eWMzNTVUWDV0?=
 =?utf-8?B?L0VuVjRtYWgxTVZ2YlVTRFhSdnQwOUFUQnVVOTdrSXdhZXIwS01DbnA2d1FR?=
 =?utf-8?B?MUx4V05yU3lhU09OSmVOa3dCekpXQXFDKzIrL1lSSjNybnE3aS9jT2hRak5l?=
 =?utf-8?B?bFRBUjVuU1MxNnFwKzgyRmhvcUpzd3VOWFRJc0RNTHJ5SWl5NVBjZVIyc3I5?=
 =?utf-8?B?aU8rNzZNaHNSbEQ3K25iQzlrZER2dU01MTMrVXZSbHorY3M4eU9HK1VnOHRL?=
 =?utf-8?B?ZGtqUm44emltMlF1MGovUmVTYVlXMWNXOFB5Y2tlZ2JqTUdia0tIejlrdGNk?=
 =?utf-8?B?Ly9HUFRiWlViUHFQaElack5NRStLSFArZWlpMnltUDRyaDJlakNpMEZ4dGRj?=
 =?utf-8?B?S3FvZ0RiSWpwaktWSEpCQ0pxays4ZE1PNmVGNmFZZlU0UWZsczNIOXhZeUZs?=
 =?utf-8?B?RkZOSEY5SUovZU1EbEYvOXV0Z3lQU1o5NWIxY1A3ZlI1NVBpaFg2d1JxNTdN?=
 =?utf-8?B?QmZpdkNLOXBoREhobEc5UGFtcU9sUWJqM2ZDbGlTV2VBY1F6bStvVUdXQnEy?=
 =?utf-8?B?VVY0ak1EbEVzekpwRmZ3dDZSVHJoQ2dvZkxuZ2I1eDE0RWFqQWZmeEVTQ3o0?=
 =?utf-8?B?MWlwN040dzRQVU40Mm9uWW5vUU5WK01uZVNHYjIxSVFUQU44b204YWVuUXhh?=
 =?utf-8?B?ejQ5eDlNYUNOcVd1aTBTUXZXMFN0dzBmSmY2WTRjRDg0Mm14UEI2QzB5SEgx?=
 =?utf-8?B?ZzFpcXpSb2tldkJXZVpBYnhtOGNQWkdqNFVzTHBvYzhOVS9zTVMwVXA1cVNo?=
 =?utf-8?B?YlVRQ2tZUnU3YlBBSEh1K3ArSCthdXpDZlFqSEs4V0oyb0RLLzlqU0JQbXhy?=
 =?utf-8?B?bzdndm9Lak1VSTBYdkZlYzduVHFFSkwzL2c4OXdtbTFxaGUyWEpQK0dhVEwy?=
 =?utf-8?B?K0tHa1RLSXQ2QmcyaTFXeFFoUXFuOU1vaVJGeDBUd0xpdUVub09XK2xkNTV4?=
 =?utf-8?B?S0lMenlObG15dklTNlk2OGNBRS8ySVBEUzQ0VUpvUjArenRTMkduaUJlY1Y0?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TJ33Y4dm1B9xBgC4KWVJWtZsLnTU7ziN9R6M60de6spq4ulGwdNAI76BjdqQaw2aNqS9x5OiqCo6j71fv5rfKakLpijUxXbD5qWHOYvsIick3Pf+tpxRM+slRzX2CIFBIgernz2W02T+AEsd/2I+DR0nzSFnIPoAiaaLO+p5s8AfLL8sbMgH/9YHEM3iMeXXtMibM+AnCdaRZSOEO0KXyzcdniQvNlaycAesHdR4DiM9AhqSe0eYtu5In/wVybgL3abaGjdP5EECbJZFyG+mnjDLHX19Uhi0FllOxFhRMgrNjd2DDNqlsG6q7yKRK4YQQ3BfP1qQKOukEiABsWGfPIJ5USIxYtsT9XHRUdouHHsGI9x8vcO4BYsYZVHjT5BPK5fqzv9juzMgbN8H09Fl0BNut+DDpeLnytEXEC2D4bN4gHSIsE9bn/NO8QuDIAH4V31C0WlFsKxpqecp2BgM/NiHfOIKml8aSAIDXlmfVHOIFvPiU2+KMJ6I2uISW+1HsFs4JSUzGCBda0vmT+fVgdOWmg9su1mdWpUutgqPCoheb1iwW9ZOPwCKXIS4qlvTp+SyqkM7FtIhc6kxX2PGa5Zvrizn/QQsjBDdfhc5NBU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4a3eb5-d29f-4051-3301-08ddd50217a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 15:58:32.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iB4h0KmZ3wHI3aVbcMkn6ZadQzRtVwGaV6blp0i1s3Cl2iHp0cceBmxqEAeAPLT0nUqBI0mN/wFbO/2LGbmTmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6876
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEwMCBTYWx0ZWRfX6eALjS8kxlD4
 5XgK5wVICuMBm/yoxFJE1RGkw5adC14/wNEwSKrrxUrZBPGeAmDa9oaxWppQ6wsK8dALTrGc73w
 13SfwfpyIVTMIe+E9E9sAMVHqm0DxDW6RvbNhv5flD/BxONem4ZPiy17jGKtIfXtTs6eYWTudK6
 5JFuVV/7HAjaa+QZM/cVuTk5a9gWIfCy0B9sHJXzK2DOzXPIxBjvj/cvuxJVQL4BPyt/t/YycNo
 qnFkhwoyio/MfZahgH18C6q9fRJPUUVp99DWRP8tLqeollsf/PhuyHzjuhRX8XMqRwWvU7k75DW
 XzpH0nhtL7ZJ1yLiq8iGSVL/TspX7+0mw1SUS3AUIFBgFTTMoWdFkFJkQ/ECjgIkAoObJYUN6ZW
 GOCoiAYTbqVm2xLRZAW6R3+pCIRZLWTPmOAp724/m77Fk+YhckwSHxE96Uqx8mV8SAdhmUgp
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=68937bae b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=GITfv444BUgapKSqGzkA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: DSOrEg-so5ocwHoT5lR9l1Xk6JsiQ83s
X-Proofpoint-GUID: DSOrEg-so5ocwHoT5lR9l1Xk6JsiQ83s

On 05/08/2025 21:18, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  test/unittest/dtrace-util/tst.ListProbes.r  | 1 +
>  test/unittest/dtrace-util/tst.ListProbes.sh | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
> index a04669843..ad557253f 100644
> --- a/test/unittest/dtrace-util/tst.ListProbes.r
> +++ b/test/unittest/dtrace-util/tst.ListProbes.r
> @@ -11,3 +11,4 @@ rawtp
>  sched
>  sdt
>  syscall
> +tcp
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
> index 84f363443..a747a0458 100755
> --- a/test/unittest/dtrace-util/tst.ListProbes.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbes.sh
> @@ -69,6 +69,7 @@ $dtrace $dt_flags -l \
>      $2 == "sched"    { mycheck($2, $1,     3,     30); next }
>      $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
>      $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
> +    $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
>      # nothing for usdt
>  
>      # Unrecognized line.

