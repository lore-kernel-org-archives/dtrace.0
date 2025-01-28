Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B303C194A7C
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738106994; cv=fail; b=L0F7DtqM4FWHq9z76VUrZdbz63mnjIx4WsOsMZwWtNztv2LuSUX8lkgFO9uOHQdf/1dBY3Sc++jAVgaYw3oLxp8nD4YIBierwhQIxWoBOceVfbMHLNNXP2VDswjCWdrcqW/haDhXIFCw23b6dWBEfjuVj+tptIKCm9Ymo693La0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738106994; c=relaxed/simple;
	bh=qQObRiowIqjk1lW2ezqsnrj1PxAacRXVKjkobg8cPwo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NzPHeCfGI3u7DCVoKann1a8q9F+N4GyhYR/LyvC3JZyMasFTl/lVMC/aftZfU3sJFtoYD0ur2SiJYkqLdu1ziIezsVCsic9xKej9T7rSS8J4fubGpDXyLJhMFKbNUsT2e9xQzLRQoqtqNdCUbbKuajB9mZ2O6kWBkogI3P4WTqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gHNznZo1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=j6nbPloO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gHNznZo1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="j6nbPloO"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SMfnAE032543
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AcfPCCRbh5l9f7msjbtcVQ5i7u+ZLhyfwHxXvJl1jH8=; b=
	gHNznZo1xpqhRjkPj7HllJTvL42PNNsgWdcaUvpyOnn+hVvtlAXqxcc72F06gqDi
	nrheYmpL7AtX5bhOUTG/yuTxnkd7FzM/UzNdPInQgEokmqkk60Al4nX29FlB2PPA
	6L41uy0O+Fe3yLO6E5rC63lIyVuakDmk6/TF5D/4zAjGjAd7dWiBMLeN+U6tyNYy
	gME+zhUJbIMhRdqPfgDbNq9ji98aSKbvR19VyaNciVbg09YZ8SxyZqhYpMo4IqPX
	Qc6kHbsBtGzG3qUzUm/0suFwmJMnBpZqkJ8mjMTzOcaAo/ujh855zG1LhUpTYbHZ
	d69tQEq/mz3DNCF0/Tm6tw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44f7a78575-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:29:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50SNS4v8005356
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:29:50 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd93mww-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 23:29:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaS+xF3rrVhsR5QpovFpHUnu/BDiWd19BVfsX2VNMGFr2h/JqKsvxrAEBW1GnnjYiQ0c4NuB4JfM9tdglVz635LHU6qfQ3vut1pEBciFAhePnxMAN6TYeNCvC/dlSk5QuBXPYIc29h4llktT2JL5RJeV9di41r5nKFJtcettm8ILRZSUhyCNALUOIeJqkoO2vPl5OKHZ8mY1coBKqmGMK2b50na9KSSZncZzsht6dp+SNftmqqpH1ATfyJllnivMSFOK0OdBhYiLZYCbWgQBtZYICV2hmOPIgQ+ADvKF1HswfV3q/X+M2JURMQrIB5iTunpd8dX28VKXnekDG4F8MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcfPCCRbh5l9f7msjbtcVQ5i7u+ZLhyfwHxXvJl1jH8=;
 b=AYar0fLQ0uo3Ocy2i/HWBw+x5YZgIOyOO7xdYLe3p1pF+yBvPOkO17PzFpxyIWXuIr0Vj9hpUPCWVA43G4yk8QUk6WqZ0XzEjTrIw6a0dO1C5dojQnniCer03pmpIn2Dzc3kcHvjUTfc6WlCG6I8LULPEfvSGKuLVG16wJRZTXvTl4Hw3xICP5X/Axlbz5Ue/dK5UBiNOb4b7XtL1ZHb1zkE5R2TdQS7+85ZaVY1GL4w9HSLC7GfAzJeauHPRTLveWCPFVDEawsN8z7ZILh2I7aeUJRPxLH4SIb18jlFKM9lF3eFDN5zXPuV/XOVx3a/eQqeFJ//UHfmxXEqUY+gkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcfPCCRbh5l9f7msjbtcVQ5i7u+ZLhyfwHxXvJl1jH8=;
 b=j6nbPloOLsLYUaoHUqRcFEfJ6GSpdrBmQCUuNDwpZ/r20X22R+NNqvxVCRxCwhkHygnV8TjMwSWJECVkAXQk/xLqiiSOllXxr0SfNOmcof3PXTV/vZP5l2HJ0Uc7QwdNqTHkwq7SGoXVzVXSIkrDQJEuCBOCt4gmLyCEbOSQxiM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV3PR10MB7796.namprd10.prod.outlook.com (2603:10b6:408:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 23:29:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 23:29:47 +0000
Message-ID: <996362c0-a77b-9265-395b-bfd9d17e9343@oracle.com>
Date: Tue, 28 Jan 2025 18:29:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/6] bpf: separate bvar implementation into separate
 functions
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB633775D451C8DC2B4847D601C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB633775D451C8DC2B4847D601C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR01CA0059.prod.exchangelabs.com (2603:10b6:208:23f::28)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV3PR10MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 87606c80-9ef2-4210-cc49-08dd3ff3a70d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Nzc5TmQzdi8xdUxxSVVSc1Z4b2RGRWt3SlRaeUtlZy93eU1mRkgzcmh5MnBp?=
 =?utf-8?B?V242d2o2WmxMallCVTJ3K2U1RUxiM3hiS3IyQysyZUdZYnhUekZWZ2FPZnh0?=
 =?utf-8?B?V2VWcWcvQWFqZG9US2pUanRuVVNlT0E4QjRBaTE3VFRkd1ZuamlJMEtiZWhm?=
 =?utf-8?B?Njl4VHRCNStRa2c3MnJ4Sk81bURJZC9tU2pTczliNFg5MmZuRUJLZjBPVVRj?=
 =?utf-8?B?M2RtODlPRUIwY1VsMXRsUnhwVGVTRUl5eWRUczB3Ylp2Q0N4S1p2VXlmK08w?=
 =?utf-8?B?aURPSFhJR2NFdDViYm50YVFmekFYalcvMFozbWdrakJXY216LzFFaXJuK1ls?=
 =?utf-8?B?UmJuYm1OZlJ1U0dWaGNZTWp3R2hDT3E3bWg4ZEdPaSsxQkYwSUQzQ1p0N2Vh?=
 =?utf-8?B?NjhrdDBwYlZRRWRoZnBubFhmQ1o4YVlXcStjMnZqcVdIY0YyVTV2VFFZbEZZ?=
 =?utf-8?B?VGJyOWJlYmsydU96RTQ0YkhwbnlJaG94RkU0Y3VvY0EzMDZlMG4vMGkrOE81?=
 =?utf-8?B?MDRza2RWTlplelp1dGdVUjY1Skp3N2ZXZ2xuWjY5ZkQyeC8rZURPRVBJZzB4?=
 =?utf-8?B?YVVsZEhNTWZodldIUFNteTZNOFJaKzI4NTVYS2xxY2hLY1N6bFV2aTJyOFVh?=
 =?utf-8?B?bW00R3VWYjRiQ1Jqbk5RdHVOU215dEZlaDZXVFJ3NVNnMk84dmRNZ3llNTNZ?=
 =?utf-8?B?TE4xd1EzTXBtNFAwNFVwaFIxZXBwSTlJSmdVY0tlZWFIY3VJU0ZzMnRVdURz?=
 =?utf-8?B?RGhDbGVtZW9iZEdqTGQ1Zm9Ka1Y1eVdxVFl0bjNnNDNQc1hSKy9yTC91elp6?=
 =?utf-8?B?OUJWZlFTYnpHTU9KeE1DQXNtU2FvWnIzMmRBeGdwK1NrMWQ2Wk1hdFhrb2J4?=
 =?utf-8?B?T0Rsam5vZ0RvNDRGcnRrbEJ3UXMxSkM2UWFDOVhzYXpaOTI4K05CYWhaUFU3?=
 =?utf-8?B?WjRFTS81NkthaUVVdWFHaEFNbVlwV0ZuM1ZlMXNQQURvU0hFM09kWjdmSmox?=
 =?utf-8?B?eHFjUU5VU2J0S05SZWRER0wzeE0wQ2lVakxUMFdXZVUvTU80OXJqUThkcXMw?=
 =?utf-8?B?cWxERW8wbFRZRy9VdDE3Rm1jQUdQTStQaC8xRmFlSXhkM0lhQjk3aFE3ZXZp?=
 =?utf-8?B?T3UyYklXaWRkeENrTUlGZGZXS3B0ZVFRc01IQVk2WGxySWt6Q1BmaDJqOVBE?=
 =?utf-8?B?aXk5a05VN0VHcFBaLzVUOTNnem81ZW9UL2J4Y0FkNUtKR2l5bGRkUW1OQkNI?=
 =?utf-8?B?Z0dhdGE0RGFZUGFHRjRVMDVEV1UzV2gzcytieWJ2ellHUlFNNW56YzkyUVhT?=
 =?utf-8?B?bWNJOUtXd3BjbzZNWlBmc295NC9mT0dsUHVvZHM5S3puTlQ1VU9ob0cvOXRF?=
 =?utf-8?B?bFJZZGgreXArdXlueWhvaElZTENCTVVBL1F5UmN4MjBYK2psdnVFbHhHYVF0?=
 =?utf-8?B?MmJ3amxDdVBZTHVTVXVOdWJ3MytQNDVmb20zMUQ3NnVCNDdBRU1uNWFnUW50?=
 =?utf-8?B?cDQxMU1ORTFFN0JlZG1OR1NodDQweXF0UUI3Z0l3NGVkSUU1TURTcXVabkJy?=
 =?utf-8?B?eThXanc3S3NlU1A0S3pxeUZOQkE3QlFVR0ZWb2RLVFlqL25VVkcvQm5qSk83?=
 =?utf-8?B?NEE4aFlVL2NLQnAwVnJFRGZhdVAvTEZrZTgzME9oMWZmUndTemVJZWcveFZn?=
 =?utf-8?B?dGFuSS9nRlpDNlpNZTVuZUNiRzBIWlNXN0VPT1dSdGVhQ2phWDNNaCtIZGhY?=
 =?utf-8?B?Y2g5bHVvNUpzV1dlaEUvaGJ6SmNvRzQrZmxMWlpVYWpwa1ZqN1RvMGpLUUlB?=
 =?utf-8?B?NWp2TXBaRUUxRmZFVzVBdTZTQ283NnpieURKSTlBWEFPQkdaT1hnZzhJZFNU?=
 =?utf-8?Q?Ajk14U07UE4eL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmdMbHVtVmlmSDVta2FjT01zOERkTCtGS3RTR0N1YzAzdjkxVlFxZ2R0K2RO?=
 =?utf-8?B?UVYrMkhaekNxMVczc3MvSTJaTDYwUGFvd2VFcFRicHA1WW5JMEQrNlNJTGJi?=
 =?utf-8?B?UGhwMmVnSUI0SnRhUkFtclZQUzB0ODFxWkhSYmNEZG5OSjVxcXZaYmdPeVpu?=
 =?utf-8?B?MXRpVEFRbHBLNlhTYWdSQUMxUm9IWS9qTUE5L0dzdzlWVTZsd3dnUUQ1MlRq?=
 =?utf-8?B?OVpKOEJ6VTcrZ0ZRc2h1bC95ZCtKU1FLVDFUOTU1WVM2dHNOMnVGaU1uRktw?=
 =?utf-8?B?aVAwaFg1d1h0TDc5WmFnejN6aGp1UGNtZGFKUVNDc1FmaTVPRUlvWXMycDlm?=
 =?utf-8?B?eTBLY3BDRUlFN0RlYThUNkUzelRyaWVVTS80b1BiWDRqa2x0VXZVZkM4TkF3?=
 =?utf-8?B?MWxjdHM0ci9IYzRaL2pPbC9HbHI4VDBUMlY2Tlh1clc5TTdSb095RGhqcko3?=
 =?utf-8?B?djBRL2E4RDFLZWVJUWNBL1h0YmRBM1oyQ2RER2t4cjFpOVZ0TU5FMExWdjVz?=
 =?utf-8?B?bC9XNHNPeG5VZmxMeG5qRGJnZlNaWHhqTzl3ZzdJeHJvNFlQZ2ZmM2plZmIx?=
 =?utf-8?B?bW9ndm1Od2diQW5PNHJ6WXdRTk43TnR6MnBHcW9TVnFRS1NSeFVTQ3J1cUtk?=
 =?utf-8?B?eXFTR3AySWhXT3A4a3JyNVhUOHgxZm15MXVtbm5PcEUwQm5FSGh5MDJNSUw0?=
 =?utf-8?B?a3FDTXV6L1VLdStHdnZscERoa1gvMkN0N2dYMGZnTytIbk9PZVUrZlI2QnRZ?=
 =?utf-8?B?S0c2bVY3OEJkQjJPMDVkY3FTYTZFcmorZ2I0cTlNcVBTWW8vdWVudk40MmRQ?=
 =?utf-8?B?QWdmcW9Zek5XRXcweGpFWHhpb1VTNTBtWWIvUUV5bXVwdG5XUFRleFNkOC9m?=
 =?utf-8?B?QWtFL1paOVVDVVB0WXk0eWtWYitmNjdxYzFJazI1V2xaY0xXd0xTcGNkV0tS?=
 =?utf-8?B?UDg3SFd6TVFMb2pqTE5pR0FFb3dtY1JIMkMrelhrMnZhNG1ubXpqWGZBR1JT?=
 =?utf-8?B?Z0drcEg0TjdjRDJlaVdNcmRZS3RFbVNXVTNVZnYvWTlOMVc4RmR0dlNrNm42?=
 =?utf-8?B?SzFneGt1UXBqQXRjZE1iTXZWZnFZOWJyZUs5RXhoc1pPYmpKUmZySktyK1E5?=
 =?utf-8?B?TmJla0JkdnQwaGlaT3NEU2tmUEQvRUJCa3d3bmt5MXpJR1VtMGl0V1YxSGF1?=
 =?utf-8?B?N2U0dnhNcFVCc1dWeCtmVEtETmpXbXBtWDVQVlE2THRVbzZBbEtWNlRsNFY5?=
 =?utf-8?B?RHpXU2RTcEIyekVhWFA0bHBZQXpOZlB6cStNbkJXdXVsbVpNMm0zTWRFSDBw?=
 =?utf-8?B?SGFnbno5UkFDMlo1ak1tR0VZcFhycXB2MVRvVnBmNzlneDdMRElNbDl4RTNF?=
 =?utf-8?B?QUI1RzhlM09KbmdCU2NoaXoyUDN0SytlYm9UdEFFZXgvZkdML2NESzM1eXVq?=
 =?utf-8?B?UzdHN2lwNlFtcy9IeHBEdkxRRld0clphbzJ0YjhIblRJb0dDdGF6K3MxeXlE?=
 =?utf-8?B?cmM2SFg3T0ZiTjBJNURIcjZpN1RRVmdnWDl0Y2pOMVVSbUJLV0ZMa3BYNS9H?=
 =?utf-8?B?YklPbEFiVVo3OXVDbDJmcjNQeUU4S3JhMXg3dTRqR3RzUzlTUnhYYjl3b1lR?=
 =?utf-8?B?VkdTcW82SkFqNTVFTy92aU1BbDlYb0lXd2lJVEF6OFNUOFZGcWJ5eUpYeG9B?=
 =?utf-8?B?aDlGdlRJWjk1Q0lVMkp3R2puQ2RzQnhNa2RYeENFOHpZYnhvdnVVd0VpdVNl?=
 =?utf-8?B?U2x2THNveVJ6V0lTZjV3bzN2ZjFRVU94aE5Sam1xR2ZsUVkzS2pwU3BxV2hO?=
 =?utf-8?B?UDc0MWlqWFVnQTNDRmZKUXBpMWVjQmQzVkdueStISjFQUytudEZHekJ1UlhP?=
 =?utf-8?B?T3EwWXJtakExSVZ6UGZNdGJUdGxPSjZmT1RzaUJybkZPRlFGb3NBdkNPcUIy?=
 =?utf-8?B?VHhHcnFlZmc4MkI0cjBHenpxeXlHaTVvdmJsVUEweXFySXZBdm5PeU1TSjVN?=
 =?utf-8?B?MUdpcG03dWpSWWNub1p2ODExb3NRS1ZYYzNxLzhieUFkMU4zVCt6TUh2RVRa?=
 =?utf-8?B?TXUxVDZnM2JzNUpFdTFZcEVmS0pVZE5PZFVnOFV0QUZvZFdzY3E0Y2JvZFpE?=
 =?utf-8?Q?8rRfCvoN9KhmY8oKk2EEneaxf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W2k1NGU28bIsxU4qAJDtsP3YN6B7MAdaqHic9iKCo0mnjwEM2cJ9XQ/HsReVfnK8si5d/f6lCgECTIf0y7wf8dlWulaoFA9lfKzq/lW0/85InQaeyYKlFZ2Q5++eqUWG9EHAOIJ6a60Cdf0wHF3dNvxp5ieF7U5ZXS7FOp/k+tAmzBf28YQKMtzFYCo433JtPE8zVtmir0VD8YC7X7r5X6SI9RDJC5DLsDCcN10w1alw9WZ+GKGkaozwynZHeFU0+i01wCMHBXG1bE8a9i150KFWqYyY92nBrmWiyBlw1ranhH6vJrGzJabe3aUmkN6oBIWpDqcN5FBqv15SeLgm5C1H6dlOZJwd9AJBG+43TN3y1BrKKcAPPD9o5Dh14bg+Oy/GoW4OiYkkAJWhSW6NHcttO3B8XB3NTRkINrt4owiayyfYBTKLGiB79AZQry3YOEL2lhMGhJuhw6S/AeL0ASWM0KSvwc6UnZYrxaxHcieTaQjc8mmR4aotL4bm3xJlhTfsClcu3EqvtvpB6Dr8rXNFQO1kBR/8htFDGEFiMfn/TTLveqExUvaW4OH1S8Opmikqf/jnl9Cf2jqZVEd/F/kMArkIqsooIKrM37PWzNU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87606c80-9ef2-4210-cc49-08dd3ff3a70d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 23:29:47.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkKYPjNKRTr4TX2f8kEW/lobZFHtshPOlTjyzyjUhFbN9qwRqZHZqExPfZ6MxGSFNVC/0lJEufUNFQsW9mQqBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7796
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280171
X-Proofpoint-ORIG-GUID: TVe_xs5n-WxOc-e4SQ0ZX5JwkFY7dhJG
X-Proofpoint-GUID: TVe_xs5n-WxOc-e4SQ0ZX5JwkFY7dhJG

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

If there is some quantification or other characterization of the benefit 
that could be added to the commit message, that would be nice.

And...

On 1/28/25 01:31, Kris Van Hees wrote:
> The handling of builtin variables was done with a single big function
> that therefore got linked into every single BPF program (twice if the
> builtin variable might raise a fault).  Providing separate functions
> for most builtin variables reduces BPF program size significantly.
>
> This also reduces pressure on the BPF verifies.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> @@ -19,18 +19,21 @@
>   # define noinline	__attribute__((noinline))
>   #endif
>   
> -extern struct bpf_map_def cpuinfo;
> -extern struct bpf_map_def probes;
> -extern struct bpf_map_def state;
> -extern struct bpf_map_def usdt_names;
> -
> -extern uint64_t PC;
> -extern uint64_t STBSZ;
> -extern uint64_t STKSIZ;
> -extern uint64_t BOOTTM;
> +extern struct bpf_map_def	cpuinfo;
> +extern struct bpf_map_def	probes;
> +extern struct bpf_map_def	state;
> +extern struct bpf_map_def	usdt_names;
> +
> +extern uint64_t	BOOTTM;
> +extern uint64_t	NPROBES;
> +extern uint64_t	PC;
> +extern uint64_t	STBSZ;
> +extern uint64_t	STKSIZ;
>   extern uint64_t STACK_OFF;
> -extern uint64_t STACK_SKIP;
> -extern uint64_t NPROBES;
> +extern uint64_t	STACK_SKIP;
> +extern uint64_t	TASK_COMM;
> +extern uint64_t	TASK_REAL_PARENT;
> +extern uint64_t	TASK_TGID;

Did you intend to change the indentation on STACK_OFF as well?
