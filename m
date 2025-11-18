Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3B430AAC2
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499079; cv=fail; b=bQ4W08U/s/AgAFK0UUGfRRIbObTOgmS20uLkDr3AC4uN36HF4eTsNiC1OuKlIdhM8QVdWHsAmQKzJPh+heOtUYFChKC27T2zbgkoRgZP2b2YntuNzBaLYtxQVPjWJ7k9vP6R3Kc0T+siG2uhjrPs2/0/przaTrSJ7Jui6tzSlRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499079; c=relaxed/simple;
	bh=CEhq+Yq/tbx1ebhHyO161SZ/1xqCyXcXFY+3CSbo6R4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aCpK7EfgtOqnpHF/A+CZJTES6dD4ti+4GYbSNOHGBhJ6nVjDZNkTmZgWOAvVf+zVCPjq+qJQsYdfrt9cRGr9dgJ2TsajNhdSXUeonTZdGuWDAV4Lw6fHN3Skwc+PBjhn92FLIlvwS/xEf35Xq6w/SKuExvEU56EpIp4pl7JFyQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Kjjmi8FP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LgPwJV+l; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Kjjmi8FP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LgPwJV+l"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHNKjf016788
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=z/uDPpRZa3RnPMJj/Um7F941eEN7U2oW6WReM0FDXIQ=; b=
	Kjjmi8FPNnkp6hoVqY9xV/qaj2lgicKKK6NJgKOlKJehian1efptTO++Fen92A1p
	OfloOB+A6IsGRzeSpQUDpFvIl3tDHTHyW6+k8uqzfuYElK5qpZfmcgKt2b8YJ8yY
	TiyEBd6rLQsLptWcEvL0ghe3Lg9OX5dDvZV53z0jzwoZQIcYCR6dtoyk4Ix9caS7
	meBCAW6seDDLfiz+cuDb35W3gPDg2W8KRvTQN3h9wvBrGVeUnlAUjH5e5Kzsghju
	/zHRhCeHVWRYHmHN0K0M9v+tsRZEsU/tkIT7UNwulM0X4HQgYhd4NvksK8WjWcR/
	y3FJh97Qye9e0kkh48CVrQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej965pup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:51:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIJXg3m039826
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:51:16 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefykyy1q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 20:51:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDy6dvPnLdCbHBXbYV9bWMa03kCiC/G25fXvnG5nWhh36e1MSjZYIBgUUAjexMUvqksKjFNDp4rlhGVGPy3g5SzyNZijGGK327eTm8p1CTZCyKhL+Oi4OUhyR2byNJCvr0qbvd/eXaQmFRbsHuROsl0w6R9GDdN5mOYfCMZsbscD7N15GuZd4BGSozcYSl8jtqDxWXAlxwWX2C0ku4Z/f5uFeV5LXwaPeNSId3EYz46sHCm/pwD0IjVnfiPoRS9mXrbNe1IWEJpBIUW6lN29Sv/xl7yebZLFAXbfmRJO0QF5ger85GAvj0T3I74stvxehaQjo0T9Mkc0+Jdp3EWzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/uDPpRZa3RnPMJj/Um7F941eEN7U2oW6WReM0FDXIQ=;
 b=VnimxCfCW7K7bML0u8EjqsQq71swPa2GcsCFijWX/4ImU4c3eGyIJix0ibOsn9xXo/5bwkfs+tXnR7/iLrKhPjlzVA2lMWXZkZKjJopwna7fKkulUed4Jmz3UsTCXDcu+kyHVXb2wR5SH87opNPKNE9pGsIwYQXRfzn8xGKyO9SObpnBmt+jCtR8QmgHRIhAoFCt/Nnn5GUI2lVUMP8niYeiU0Yok/Z0laHU1zYdhL/Sa/u1EmUPP0EO8jNOyy4vw2EZmMhjLe1/uUy+0lY7F9v3aX+SRr7HVnzWxrgdmbaGYHxC8Nd1+rMzhPHv76+3aU2DlpWV47nHJ+tHUfF0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/uDPpRZa3RnPMJj/Um7F941eEN7U2oW6WReM0FDXIQ=;
 b=LgPwJV+lAfr8v7o1SofiN7n55APVuzVtX1CJZuEgQGb/VlUXK4+N1ob7EBBOFl5fW1EMO8KUAZEplGEEpiclQbnKdYxZKj7r4jD88DKtuu8MNKtMvCKgJE38s+7PFXQVBE+lvZNS5Q0Uh3dL8VIGq0yjGMXHnE2iA97CLOvf0jw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPF45F123D65.namprd10.prod.outlook.com (2603:10b6:f:fc00::c24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 20:51:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 20:51:13 +0000
Message-ID: <044aa486-74d6-7772-d61c-d85e6e9a90b0@oracle.com>
Date: Tue, 18 Nov 2025 15:51:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 5/7] module: fixing missing } when not
 using libctf
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB3987A5627BFEC1D992207967C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB3987A5627BFEC1D992207967C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPF45F123D65:EE_
X-MS-Office365-Filtering-Correlation-Id: 374545f2-c8f4-4c3c-2730-08de26e435fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0l2ZVBSVkRRUWowZGRyVnROMTFhTHJQWEtLWUs3aVdXcnhnN0ZFQ24yNjlM?=
 =?utf-8?B?c3ROVkJXeS9oMUo0SUNJd0tLY3RhaUR4Zkh1ZEF2WUFSSmtxQzRrTHRaUXJO?=
 =?utf-8?B?TVpTT0dPWVEyWnl2OU4vVEw1WDZ1ellkdjRNNkhIR3pENlRhblNVaUh2L01j?=
 =?utf-8?B?cjArYkdnODV0TTFiRERNSDUzV2theWdpZ3p0M0EvNlNMVkJ3ekh0N3BYQXJx?=
 =?utf-8?B?QlM2M0lPSEpRWTdDSUNLbHFwdHpHZDJ2aXNmMncvM0RuYkZOc0xKaEpRSnJ4?=
 =?utf-8?B?NWN2d25MTVI4dXNEMlBEM0p3TE5adEg2QTQxVENNOHFDZXYrL0NjWTZUbGJk?=
 =?utf-8?B?aStaVzBnamxWTmJTVllCV1VBdXVxbks0MlZwRmpFN2Q0YzhQVWgyUUZZVHRV?=
 =?utf-8?B?TWo5U3ZaZHhmMnR0eFRIcjZJUkdFYnV0UGxJRWNQQU5aYWY3c0ZEYk83ZkZC?=
 =?utf-8?B?aStrd1FlVllKYVhQcENZMkNlSEl0bVdWZU56ZjFtaUZKT1dmeE1pUUpTUkxM?=
 =?utf-8?B?bXpZdXJiYzMvdDRVTEtCMlR3UXF6dy9rcHdJbHJKeDkvVVZmZkNPcHVLeGRX?=
 =?utf-8?B?ZHRxU1dobTc1dGw2TmoxT2JGWXdTVlU5MU42T01CUWdHanpwcHlDaUhEdlVD?=
 =?utf-8?B?WnFmU3BYRGtpZk9Oc3pxMndja2NPNlFsVFRZYm10V0w0cXVlWisraENDSmcz?=
 =?utf-8?B?N2JMaHRRcGNlazVqVmVxVVJyL2FUUnd5WmFlSkJ1aHR5NU5NNDlPQzMxZXRW?=
 =?utf-8?B?MHlzVjhRMU1SZmpwYWJCL2FHS2RNRnF2cHNneHlwTTlFR2hEbHdTVktnM09v?=
 =?utf-8?B?TFhZRXdSRVhIelVSZ2w3M0ptRFV0V2NBMG81RTJuRnhFOG4yR3JvNFZCcmNW?=
 =?utf-8?B?WnI0RVRXL2RTY0pWS0RUOHdHYnpCU3FHMlJPdll4cDF5OTdMRllSVU1DdUhu?=
 =?utf-8?B?R0FESG40aWxDbHcwUU1jdXJTV3k5U3MzU2ZRb3lZbGZGTXhoRW5VSGtORksr?=
 =?utf-8?B?elBiSG4vVWR6OWdqZi9CNGZuc1dEMXNnc2lUbXFLdjVCYSthRHJjKzYrbGhY?=
 =?utf-8?B?Vk9aME0zcEtSQTBHem5ISTdtYmE2eFFoczlKaE9jV1FrYThieXM0K1FRZEpX?=
 =?utf-8?B?K29YOVRJUEcrU3BmVWs4TDhsT3VNSWIvY09vcjY3dFVhKytFanVCWk56alFT?=
 =?utf-8?B?QWRSQ1EwU2Fpam1rUGQwdmozMkhmd0ppck5KREFnSDg4L2k3Tm05VUFkL1Nw?=
 =?utf-8?B?OFBxM1U0R2NjcFV6OTM0cFZjb2EyNjgvc2Rqek4zbFp1a1Boc1ZGeDcwY3kw?=
 =?utf-8?B?L2ppWUdkVHRyK1FZb2R6MjJBQ1dTSm9wRWZxOVMxQnhMRXAwNVo4U09vdVNF?=
 =?utf-8?B?R0MwN3VhYUtDb3JYdUJYMHpUVlQ0alRyKzFKRGV2dlJIN1VmdFpsVytRV3Y4?=
 =?utf-8?B?RFQxb2pzQXYyaDBJbUk4VXErak5lRDBVRXUxVVJmMEFDUm1DS053QloyN1NC?=
 =?utf-8?B?TGI4VW5OR21yRWN1KzBtc0t1MGxkRldkVTQ2SUZ5WnFzSjRKRXBxRC9JTGVM?=
 =?utf-8?B?N1ZLdXMvZ1hEVjV4UFNJWWtKOGh0WlNJYVdFTFQxN3crblNqbGdXaUNpdnpG?=
 =?utf-8?B?YVZTTFpQdmRjSnpzd0EyMDU0anl1ZWNwYWQzOVNsYTd0akQ2MllpampGTHhG?=
 =?utf-8?B?SXZiRWE5S2VpNUs1bmVUVHpqLzNQY2RLRTFRSnl1ekxnZlNQWlB3akVkaXBp?=
 =?utf-8?B?WUZ5ZGplZ1pXeXJqWTRKUzVJMC9sSEVxTnVmN0VveHBrVS9qaU9LMkl6MTlX?=
 =?utf-8?B?NEx6b216VStEcUhLL1pqU1VSTEFOdjh0d1ZmUGNyNndmTlovSGRTeWZIanhE?=
 =?utf-8?B?N0dGUHB0R29IZ3lTWXdTUlkyS0ZMMnkxZndIWFhTSEZ0RzZONks4RUdKNDZa?=
 =?utf-8?Q?2RCZOOQ79bKMPN8Gj8Q2WhQ1GTj+3Iud?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWdNQXJ4cER3V3Y4YmVxVkx4YjdOVkgrMFgxNnBRSnh5NnR6WjhOU2tsck53?=
 =?utf-8?B?TkxBT1poQ21OM2s4VHVra1B6MGxRZlBLWEx5UE9KNCt3OXBmTkY5UkRYQkpN?=
 =?utf-8?B?SkxQcUFibXBrWjNOZkhzLzliWHUxaDZzb1pKVDR0UXFIcmtua0NWeEV3VlIw?=
 =?utf-8?B?Y2ZWMnJWRDNMZG9XWXcrVk5ldXNLMlJyV204ekJpN0k5anVqRC9EVUx4c3pL?=
 =?utf-8?B?K095TkNmVTZhWlhRcGtNZk8wMEs2MWxBZlkwZGdtRFRGNTBKdEhGdmVnSDlz?=
 =?utf-8?B?SjdnajJaQjVUUVhNSC80NTNMYXQyR1hORjNYOFp2SWFFZFFYVmZZQUFuRnZX?=
 =?utf-8?B?NXFqQ1A4YjdBbGxqU1NEUit4anFRbmZ6UTk5eGFvampDUFdBQUJFQW9xM2U2?=
 =?utf-8?B?bWplajdDU2JSTGZDeklRZEQ3TUZyQmtvVjdNU0ZZdmtTRGQzTmVtVld5ZUU2?=
 =?utf-8?B?YnREZUZLYnpGbDlpak5TTVpEWWJwa0h0WVdOTkZMZ1pKb3VnU0xzcnJTaFl5?=
 =?utf-8?B?aDZFTlFXMG9xSUUrMU9YSDRYU3l2VVZBU0NVK1UrN2xtU2VSdHRML0xTL1Ex?=
 =?utf-8?B?Zmd4dmhGWTVodElHaDZ1aFUveFc3Tjh0RkxFSHdRSTVtWllTOTRqdFFTMHQy?=
 =?utf-8?B?VkZBRHN4d3k1ZmxneWNONkUyTUZQbFhqbHhWS2I2SHQxeFNESjkxeXViME8z?=
 =?utf-8?B?OHdRczBaTmc4T3RaVXpOaE80alY4SEVyZko4blF4aitQZE92Z0EyQ1NKN3lh?=
 =?utf-8?B?NHJwdzJMOEdMWGtENFNJOUo1Z3ZtYXJkMFQzcEtXVlBNMlpqOHdaQlFwQ2dw?=
 =?utf-8?B?bWJRYTZmVWNHUGlob24vTDl0ZkZYRUhwYWhwejlnRVllS2RBVDVzYThuMTRL?=
 =?utf-8?B?RWpzYVBZelFjVHIrYXU1WEsvWDF4YkJackdkT2krdmJkZWFHVXk1S3NtZTli?=
 =?utf-8?B?MDVtRWF1WkJEbkluKzQ4SmIrR2tnNExldjFXT1dmM0NET3RBMkMwcWtrTXdH?=
 =?utf-8?B?cHJmQkdoTFlWUmE4VkdIaFdnS051OG5ucVROZGowN3g2NGxMUVN4REZwdEps?=
 =?utf-8?B?akxqeWZ2b2xQWm14dTM4ZVFiV3NJTDY2TW5EWGcvS1phT2NVQkRyMEVXYmsy?=
 =?utf-8?B?c0RnZnJNWFUzM3poajNwWGR5bU5sT2JVNHBzVVRvOTFHdzM5VzNOczlKN3FE?=
 =?utf-8?B?NUtrSzQ4Z2owemR2TGxFQTAxZ0V5Qm5aSUp2RzNRYVVXUlZTSFNldmRKRFVr?=
 =?utf-8?B?V1I3Zk1LUk5WMitLTjV5elhJamRyZ2FLUUhxN0lrd2hIeG9NTWorNVpqWlRl?=
 =?utf-8?B?dU9UMzBOVkpXWmRpSVNPWnZlYjlsYlVoMTRmRHdkb29Uemp1WlVZa01LYnJM?=
 =?utf-8?B?MnR1ZHhPbExDeDF6OHpuZHZ5cWZHUE5ncEhxUUVTcFlkQnhSUG5hUzg1cFdP?=
 =?utf-8?B?N2lwQmZLOW5qOUl2ejRnQkl5VnFucUVlWVpGbDNkZkw4TFg5OC84MDlaSjNp?=
 =?utf-8?B?NnFteDVYVWI0YVQ2TXZSSkpCK2Z1dm5DSEFZZjNjNm9XRXR6eUtKMmp6U0Nz?=
 =?utf-8?B?dnpndnBPa1Zuc2xyR3RGcENTTnZIWjdIMXROa09IRWtQTytnUTVuaXhCVFBZ?=
 =?utf-8?B?M1psVTQ5cU93R0praG9iUXdWaWZsWERQSktJdTd4U2M5dGd2ellJUnphMGwx?=
 =?utf-8?B?cUdsTkVvNitpS09TbDZCSFRLOHJDcXo0eVovWkxHd2ViMDNaRlBFZ3JBZXA5?=
 =?utf-8?B?VWxBbGw4MmpPMklYTldXakhCbkFKeHNHNnhuK3o1NVhEQXlnK2JwWURVbEpI?=
 =?utf-8?B?cUNHSWNpOGpyVDl5c3VNUW5WUU53T2hJNzQrYmYyMEN2VENxMWtFS3VNbEdC?=
 =?utf-8?B?eTgweG9WbXdzN0EzdjM2Y05uUTh1RTU4d1kxeC9PRCs2RUV1VFZzWnJMb0s3?=
 =?utf-8?B?d2hKYU52cW5paXhNdkVwYmxvWXJYMGZ3ejllTEtDVUtLb0lnSlJnN3Bua0gz?=
 =?utf-8?B?OVNMcElENFZYRGVlWnhTQkFhVFBQWXVOa056WVFMdVJkWVNFNGUwSWJuWEdh?=
 =?utf-8?B?ZWs2U2Q5NlJjQXpIL2ZEUk00eXZILzZKNjdvdnlTbTJpVHlEaFU1K1oxRWxy?=
 =?utf-8?Q?pK53MUKlGoP5bd9a+bN/IIfv5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	562DnyUnZw9kRrO8/BgnVZgDfsp3UnpabxHv98/9+gOqjan/hiqa3l7LYKpw6ZdzT45bNpiDt2GXArrZwngYw2J/wfdsxVLYR7VjcwTHjtC+vwiRL+eVLeVCEYQmqUD5/3/EGhW/ulCWRNhw8obGcoE1LOYqEYR0lRhPU4n/aX092yCzpyuAGwQDXmCvOQS8umfBLRcjfqRhkXuDgQxq15Uz98q1yQmuMuecdkxVJJXGTTnPfulpbkBn8BoT67TCh9IRA/alYcA9PuKvR5nHCNZJ5ccFLJnDCWX9qS3Rqs3yQVGhdWFlgZIEWqoaUsEMyTHKWQtghVK2x9qG0y1Bs6aReqeahvHXdoQW2mJBhN6rebe7bUF3eiNJ/NvzxOtxAWqbkPqAoE9hmCljHhDvZgticZ4Jgup6ZPl4gX/QcMFoZL2QLRBw/4qCb9GB01V+GgUM7hRk1JxwdN64trFzn3HKrmwYGVqQFTMdopWHFHDV9GPsK+e1dC+vGZn7elFmNw+ND0tFYXeSIjuLEGWN9G0ZZ+JiOoiSm/9xPFO7RSgh9BMbp7N3CUv0PY3T4Swvh204mDXJots6jKwNOpSDSbx/CU/kRW6eoo7P+cICFOs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374545f2-c8f4-4c3c-2730-08de26e435fb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 20:51:13.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lIwGJZC1IUBk5JwNyQhc6bklbnAsuAA9z/y1xt7EdCHOgRJ8H5OJIPY2gR2EcKGElsIq7K+6lLxOiZ6HZE4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF45F123D65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180168
X-Authority-Analysis: v=2.4 cv=DYoaa/tW c=1 sm=1 tr=0 ts=691cdc45 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=wEa2qMosE0cv8PZpc-QA:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:12099
X-Proofpoint-GUID: pTd607fcgkJrWoJXqCR3_ZHzY-t1zmY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX9YRap6L9kDzM
 Rro694LxrNokBP9e6QF8k8BvL3pSt5owAgZSKlHe2N27vMFIirIQCCQIJ3iYRQ/czCFvqrJrQee
 nMfcHOIzez2aylAI5ztiCiBE36W5OYsrrz2EYJLUWxayjR2tnm8LTXWGJsGyS9RDESWyYyfqeQJ
 mtor7DcJZ9oxfPTGb+GuvnogGZzOSZkIdGr3RJ8EfFVeUj+0DY6Qd7YW0fIMK3njNKZF9PIOtYE
 ePw+CG6JBBWOek85iTbr7Qnr/of436/N7nZSNXa4o6MUXY5XEOYFrWA2oAjvyepoNDr8ZiXIUo2
 oik2rmckNaqmWXjLm6HI/XEgcAmQESPuRLmfbipH4elJHWP3PGI0DIMN5oPi/AuKduCyMLCgr5Q
 VKMznsrtGy6fdBox0CSvFBLsTi5X5hFRyEIk4u6rX8U9kPpOS/M=
X-Proofpoint-ORIG-GUID: pTd607fcgkJrWoJXqCR3_ZHzY-t1zmY-

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 11/18/25 11:38, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_module.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index e7d212e4..7ec1b550 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -1031,6 +1031,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>   		dt_dprintf("No BTF data for %s; "
>   			   "looking for in-module CTF instead.\n",
>   			   dmp->dm_name);
> +#else
> +	}
>   #endif
>   
>   	/*
