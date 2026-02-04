Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C823D3306
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210754; cv=fail; b=aKGbYOQEPTiSm3jdp6MdSauqcrYZKJOgAY1mQt7DL9Gp95gAQA2x+KRu1DjMJzYLTd/E88d9iPMt0l1e3T0CzsgYasAOypBm1DZzfMHdxqwSXr0Mdkx83lpycxGdqGYPpbea3ycsucPLzMCxZgxaTxrjp8Bpwbnnk1IRVk2P0fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210754; c=relaxed/simple;
	bh=8/a0709VSpEEq+tL0PBbPK36SoKhuqemCz8wPdylM6M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=daX51pkkdJUyv8zQIW2uAd9REo+/8OU7oxVTzSNtctr9T5qbFcoBGO0Di8pW06P8CFUqJ1ZKBLuOLkrRxEiFh2U/7NHE0NCTa2/B+8Pp6cIZZPXLIGlXC/d/7aN81xPp3puypM0uvSRUn8p1hGukKfALM1tDTZx68IDCfN7ukMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pTx4g16C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gE+rLVt+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pTx4g16C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gE+rLVt+"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614AxqgF157420
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 13:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Bn5VcquHkAnXI6Ww6/VLMoK+uF5FQXzHpqsasuJ/isM=; b=
	pTx4g16CNljgFjArXWKYejq4Fgewrecr5RI7jy/KWIHO0XF6s1PdL4k2SBtJRvBS
	Gm4SrUPDisdgtyOeU+1gbbJ+3WgkWAQOUHbaLAjkaWEodMH9MqbVZOp1Y/U7Z5es
	jmCbtx8z8PkCA6eri5a5YFGXJSad34e1a1P1D3nxeMExXA8jxeXpLu1izEV9XXT7
	hNcSMvVYtOCWCJw0WptQMfvwF8olDdqFNLrgEItwdZ474NHgXFAWxHkEMflzZANL
	342yv78U1RQ62jYV3I1ryjE+oxi1bc1VQ5mzQ1hJ40RR6Ohy7lvb9Z5pGyLDKgBd
	+NByL6ciBca4JSrDogrbrw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c1arkwyux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 13:12:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 614Bhw4P018762
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 13:12:32 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186nxn4b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 13:12:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8Ep/CiJVK7mcMP7fsL8CrsPGiDe1Q5ZL8aKDUzSYnLSAQ/jFAgQEo6LeR4KLbnpjllBbNy/jcAeEzN14CEVE2kIBgklkI8nybjQauOmQiYPlG3mE0piq59cSJ1YMXTpIqfBHJ9hQfY67/8+RVuZOrTMQU7Pddb4rpjMtlwp8zSccXy5ScdNoKCGw2W+7x7OfgRyQ5x0TggEiWN6fBoFm0AU0z2kjg316z4TY2ZCrVGzsri7o0uOVvx1Bn0AgYaGZSAiZbVPpZYrf+ZE9MCA8x+qvfyL384FEIjA+0RmV87X9f4EAczED2Iz8/7rmk48Ij2lQf/J9o6uO0HJ8oaOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bn5VcquHkAnXI6Ww6/VLMoK+uF5FQXzHpqsasuJ/isM=;
 b=y+s4qAFt3kftuL2QmCuHxElTxTNQB9Ptiedd9bRIiswb7R2f1hgipHr/HsSkIRcn5XaTAuW3yAGf3j2Yz6owbezj2orXVSpYIMYIXGyBkI6Ui08uQVslSG1GBt7jXh7AEoU+JxhIFVeIdteDJ4GPUj01COx4/LeIgUG1hJlNfWf6jp5z50qhWBMD45opN6NRSjKqs1PBsf20z92kBori6LwARPMQq8ITFAir4vnrDgF/i8BE32P1bs8RhPbmqfBVmfXdKptIIY9EgBAEG6LFm5Afrn3WoG6FkI/aUOmVCHj0ihR+coq2bRzV/bztlLJLG4X4eL3nAmnIrudGD+f8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bn5VcquHkAnXI6Ww6/VLMoK+uF5FQXzHpqsasuJ/isM=;
 b=gE+rLVt+G02wM9Tb7sA25eHIEy73JHYWbUBDvOm1Jce/NBNgAIsI5Js74dvMjLE+/tRGetx0X1zzbagZ5x8zl8dsdBUChNdAoQjeCX6IDQTIQGdMOcE3l41jqk9w0K3XENNbCU5481FF/09gQcUFYwrR9MZiL26GUMFACC+feDQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5852.namprd10.prod.outlook.com (2603:10b6:303:19c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 13:12:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 13:12:28 +0000
Message-ID: <088e8648-733d-92ed-f277-32bc357bb527@oracle.com>
Date: Wed, 4 Feb 2026 08:12:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] usdt, stapsdt: fix argument handling for
 multi-location probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522F828BE6550D1851B3CEFC298A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <e995f8d8-205e-769d-1f4b-a78f448156da@oracle.com>
 <aYNFY8+19VmKMO1j@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aYNFY8+19VmKMO1j@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0056.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af01cca-6d57-426f-b99f-08de63ef0bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TklveFM3MTlPbXc4ekM4NnY3bTVIMkRwekJ2ZGhxTkl6cEVlay9TaFh2S1dE?=
 =?utf-8?B?VnQ1d0N3blI4dXdJVmovZVljWWd2UEMxaDVIdTU4dVBSN3FIcTBpNmZyMjRr?=
 =?utf-8?B?UzZFM0xnSUQzWTlxd1o0UVlSQnhiUUlMeFVzNXJjS2pkcW1Td3pCTHM3U3I3?=
 =?utf-8?B?YitOSi9VY0kvZENZbW5Xc3ZGemtQQjhveEhDNG9JMHRoUkJUUXlOSEI2Zlp5?=
 =?utf-8?B?bEhXYTd5aGQwdjEvVlNkdUJSN09pTGkxRWQxR0JneUQ3VUgwL2dxdUVmbWUw?=
 =?utf-8?B?VmtLRmNqMUdIK1JPRjQ1TitLSnM4azRUSkM3RGlqMGs2anl4aWdmSzBWN0Yv?=
 =?utf-8?B?YzZ0WUkwRXNkc0l5MWhnN3FYY2hJVVpORjM4WGtNczljT0ZRWmsyYlRRNTds?=
 =?utf-8?B?M1UxNkx6enVPQmFDMXIvOG1DK3pnMDhQakNNb1AvMGV6VG5MSU11clJ3bzFp?=
 =?utf-8?B?bXZuMFh0dXVYM3lrK2F1aVRXK2UwdGRBMWtUWGdvSThzMXlWRlJ5OXM5cVFP?=
 =?utf-8?B?ZU9ib0xZRm1ySmNkbFNFUXc4STJWMlZIOHdPL1BLeHRuK2JXSFg4SDVKL1VR?=
 =?utf-8?B?UnE4RCtxTE1ZME5Mb0Y2MURnckw2OENNUG1KOWlGVFNpRnRGallUSm5kdTIz?=
 =?utf-8?B?dSt6VVY5S0RUQy9xaTZYNUt5QkswQUJ4RE9ZbnZEYzFxQWljdUJiRkY1ejl1?=
 =?utf-8?B?LzE0MzZKZ1I5d0pXS2MrajlFUWUxZXNFVFBZbzhkS3Z6K2VxM2ZvWWRMMkFU?=
 =?utf-8?B?blBjbTlGVDYvbHNZSHpHMWlwUGtQZGlqWlBUY2RGUXlIKzQ1TXBtalRJMzFh?=
 =?utf-8?B?Q0VXanJtd0tlNTNMTnBaZWhselVqYVBiTkNscCtZeWFCTlZXMjloRUYwb3hP?=
 =?utf-8?B?K3dobDg1TCsyeUNXRkxGMXlESExkekFVVUZKcjUvM2xscG9IWCtkb2p3NEN6?=
 =?utf-8?B?WEpjS0dhbmxOT1p6UThybSt6Z2VOeEN6RE8vR2ViNjI2SUIxbFNCVW5lOWN1?=
 =?utf-8?B?RGxsNjk4c2VvZm1GVTlIZ0VYRS9mYWNRdVpuZXhmY2xDNmY2SjY3WFJsWTVx?=
 =?utf-8?B?NzFxL2JYRXNOY29VaXEvbDdPVzZuNTU3Y2FUQ2ZkenBQeHBuTmJ2dFJpSzhS?=
 =?utf-8?B?TnJ1dERUOFdENjlUdXVLeForTklQSW5BVU0ydEhhTE5lb0lZdXJFUjVNMmhT?=
 =?utf-8?B?T2hFR29BekJZMHFXeDNsOHB1L2QrZXREV1FzUDNpRUI4Y2E3QXJ5eVFPNVBp?=
 =?utf-8?B?UTlEZmw0YXFKRHpyNHVUcWsvY2kvV2RTNHVseUQxRGRDUi85NmllVjZGT2w4?=
 =?utf-8?B?Rmp1TmxFdGp1eC9kWXpnN1lBZnBXYnhmL1JFMmZReDFySENJbXZxZW1WWDla?=
 =?utf-8?B?OHpXMVM1T1lVMFF1bm4yeElDOUdQMjBMTUF6ZjgrMSs1czVpK0poVVFFTzBv?=
 =?utf-8?B?U0VCaTNFRDk4VzRFcXE4VGFmQXlNWVp3TWszRVRtTmRkbUMxMUNaOVJ4WlJL?=
 =?utf-8?B?aU5VVmdtb0tsMS9jdmJKYVZ3S3RrYlBFQ2lLQ1NnL2lodzIxV0RLNFRJR3Jw?=
 =?utf-8?B?L05MSVdjLzh6OW04eFl4Qzd3RHR5eDN0TXcxL09nQ0hjazI5bURDdWRBVkxu?=
 =?utf-8?B?cnV1ZjdyenAvSkVPSFFTSjB3MS9wdGdEUUhUY013NllSbjZnYXV4a0RiNTFi?=
 =?utf-8?B?WVNYZWJZbC9ybWFMenB5NGt2elBqcU83K1RwMy9raFVlMkRqaG10RTBCcFBS?=
 =?utf-8?B?VVlNcTBpS2lIR1N4Tk83Z3FsUzZiYkxTQ2cvNjVRYW5IS2Y2QWhuVjRsNXQ3?=
 =?utf-8?B?cjU5bU5pUWFrYk9oelRNbXF4U1B3QUhJSWxOTWw0NzBFTDVxVW1JVjV2M2NX?=
 =?utf-8?B?UkYwemhYOExWZUtXOXJ3eWZtQWlFSkptOG5nU3VDdmxSMXlyWWJSR3NNSFZX?=
 =?utf-8?B?bjdqRW94OUR2TGF6cUJuVVAxNEdSVEFHNTdlV0ZlWitLbE90NHVpY2pQWTZZ?=
 =?utf-8?B?bnhPTEdvakFBVFBVMWFjbUVTdXVQZ01UWk8wdWVXS1ZyMjloL0M3UE5UVmlX?=
 =?utf-8?B?WFFWcGdiYXpmT05XYWFoYXJWWTVwV2l6U1lHL2ViV0x3UWFFS3lRWU9WS2t5?=
 =?utf-8?Q?gSiTmzBQDKiaeQ/7Nc6PF1vxZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCt0a2dhV005MDVma004MkhZNWdRUmlSMW1pV0ZPTXVyUVNaTWMwbVJ2b043?=
 =?utf-8?B?VHZGTXdmWlVZMjFJaDAreHZra3p5MkprTEt0MnFKd1dsQy9kbXRjVXFLVkRC?=
 =?utf-8?B?SDdtams4OXZncTFKYzBLVHpEQnQ5QzNCTXMwRG0zeThjZWJXNHFiODdUQitw?=
 =?utf-8?B?RWVkVVFWWGNJczU1YzQwMjE2L2p2NTlYUWN4QmpMWXY2anFKQUdkVGRrUXhR?=
 =?utf-8?B?b3FaZlpXTVF2TzhwaEpXajFRMDY4cjJ2cGl4SVBPbFhOaFFwcFcrS0ZkTHV1?=
 =?utf-8?B?NkN3MnVxbGkxenZMTExtSHk2REJ4UklyYUg2cjlKdXRDRmZRQmZ2SW9ZeFY5?=
 =?utf-8?B?dkRjTEZzVlJUTnYzMVZwRWVRM3dDVnJFWUJjZ3NMeGRlcVBva29IS2RUbk9z?=
 =?utf-8?B?SzRPVE5UTlpEVWJ4Mms1b3hLUFgweUtQaFowdVBvSWdPcnBJWEJ6UFlHR1ZH?=
 =?utf-8?B?L25IT0U0SExuOXFWa0l5U3JEOG42QmJTRU1kMllQTFRkTVJEUk5HOEIxZUxj?=
 =?utf-8?B?YTJsTUt1YXFoMzFUNkl2ZHBTL3ZEOTQzNmZkWDh0cUlPeU9STXlIb21Ic1kw?=
 =?utf-8?B?TEY3MkJuUmdTLy9aNitucHRNU3M2Zyt3MVJqcHROQXZ6Ui9mdkhaM0EyK1lo?=
 =?utf-8?B?bG9oRFFCQUEvYXVRMjMwazBCalFRaDBORVhJQjNzMk1adWZpZFN6NitmalNq?=
 =?utf-8?B?dVpGaGZERFd4S0dlczI1Rlk1Rk52czBaYnZyY0MyWnlWZ1NSeVFvaC95dXdw?=
 =?utf-8?B?RWlteXo4UUVxOWVvM1VReU41ZHZualViVkJXNVZsOXdZUTQxcjdveVVURXd0?=
 =?utf-8?B?L0lXT2RIaW1hQThVNVlJQkgwdnF2NDRGUTlmTXpyZXNwZEhYcTNFQUYwSGJy?=
 =?utf-8?B?bU5wb1VtcUtqelZCSENOcE5abnBjdVptRU9QVHZkWXhWajhRbVQyVzhDNWs4?=
 =?utf-8?B?c1VsTG1ZV25sMGNIMkNNQ1N3bGp0MUpzLzJiMS9Kem5MQitnaHZPeGNKbUdS?=
 =?utf-8?B?akRQSDNjdTFQTStTeWRtbCtJTml6bVRHQS9yeElWS0VvdDRqVGVXMUZPNEFP?=
 =?utf-8?B?bFhTQjFaaG1XQXdoMkFieC9qUGppTUFScWJhY2FiL1JNMjc3MEt2YVRTVTF2?=
 =?utf-8?B?UkZtNXlrNkpobjNVNmxpWTNRQU5hTjljZldUQVJ4QTJudXprUStNb0pTa1ZB?=
 =?utf-8?B?eFhpcnMzUkhTUnUxQlBjL0xaOTdFajJXUC9iMWMwS3QzbWl4WCtZUUt3eXFz?=
 =?utf-8?B?MFFwMjgrNTExMmo4dmdUYmhXTnl0N0ZJekV5a1RnVUlMQXFrMkV5MWhleUhP?=
 =?utf-8?B?cElweHFoVkt3S2xkVjNkY242alZ2L2JtSnhTaXZEekNLdDBEQ1ZqQ2hCeUJr?=
 =?utf-8?B?Sk5IbHVwMlk5bE5LbHBMZk1QR2lEaUE3RXdxMThyb3NTRkJHeVhXaGNJblR2?=
 =?utf-8?B?V1dwcXRGZG9la1B3NFVhVkxETHFoOHQxN0VBSUhaKzZ5ZDVWLzBoRmZ3K3VO?=
 =?utf-8?B?RVJzdytqZFdoTmFoTGZxUndKOUJhY0NTSW8xamRJdnBLR3pIU0tWaG5mN1Q4?=
 =?utf-8?B?bHFaRHovUnNtR1NTemdValUzZHV0UkwzM1NhZDByL0RuSVJlZW1KUkRrb1NC?=
 =?utf-8?B?SXFjeUNYTG43WXExNWxLUWdxZWgyODFQRTNHVzA2TDZGbUlydUpvL1JGQkp5?=
 =?utf-8?B?NEJFUHNQcDB0YWcra2pXazl0SE1uL2o4UE1mVVZoQlJITzFBU2Yxblk4S3Rk?=
 =?utf-8?B?Vjhyb05NZFM2bG4yOE9zSzVDTzNLMlNDdXBaM3QxbUtDL1U1cEZoL1lnQ2Nr?=
 =?utf-8?B?cXNFam4wU3Y3S0FMZUVJMGFTcVJVSVdBdFQ1cCtqS0xzVDAyd0RCbnFjbytw?=
 =?utf-8?B?U0dOeGEzVjFwWDhROEttd2JhM1dtZGU0eUZURTJqRC9GTW9NTFFaVGRhMHZK?=
 =?utf-8?B?VEt1aFNXRTFZYk1LNlpWbWdqcTJXQXo4dnRET1dJVllzTWRlZDJMNTJPYm5z?=
 =?utf-8?B?TDVvN0xwOEFwd2pzME5rQWhxd0locDdzSGhtRUVQY3ZDcCtZVHBvUWJmYXZX?=
 =?utf-8?B?WWVUUVQ1UjlkaURxamN2d0ZpNzJ3V1p0cytVOE9JSXRjNHcxeGVTYUZEZWtw?=
 =?utf-8?B?UDBXZmpDYnA4R2t4MzJKTCtEcVlRV3hJMFBLekt3ejI0QmlqMFJIcWhNa0Zo?=
 =?utf-8?B?SmUzK1dVcy81alBmS29SNGF4WTJwK2JySmd4cmh4OEdxUHhTbTNDSkhXZnpW?=
 =?utf-8?B?ZGNEK0h6Tm1RQXNwWjJJYWtSenJaMEdnZkFVVGI4M3I0ZlpWaWtIWnNtUG1E?=
 =?utf-8?B?VEQrTjRjTzhlZCs1VS9MZkpENFZnVzl4ODBUR1JnaVNISnBWOC9IUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/sghgURmFuUB+xMntnyxBhl8JQVJNiFmL4lbbjy2TRwLRm/+OWlkbNQZjwnuwkBTW5ihNosvl6rS1u5K27MJZIkoojYCymrTzWzEsYTUpNSYt56zBYavxSNaUcLATiEsmWQSiaxjRUW+loxIuVwHyyuRnIwY1PnUH3Gvk0XmYblVZp5ON8nJADfwff4RTsRJ6zeUfQoskOhZtoTwExEhFl0ZpwwfbR3qfkxg73mhO1TYawP7a/baSIPy0s6JRDwMUruONN2WGPSuRuENPAoyNwEg8b33bpOf/aWN8wSPM3ybadZv+j6wMAFTGCsSwY1iOBcvsnQ79W9LFF+gK/xMRfBtEaA+uGTgmx1dpkgBlCVAFPirBPqitZ9dPg7OyUA/tXah3Xq+zCEa38CN9OyCfIBNeqY1Xi1TzrioaCHqTJaynepjT63vFoM0JFAhyRcPVJYayvIldFAAq3O10WhHi8NJrVmyZwExBqu2w5EwihDlYJZ00NXuDkFu7BJ2uXJdb9PTE3mFFPY+M+KIpfqKOIDlaDNFJPYrMJBVwwQ/THKBENpZQGhjNLVjc1iBq1ktE8jmsWqrV4IVlXdReFLuMNIMYxna8C9AjJn1dZFDerg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af01cca-6d57-426f-b99f-08de63ef0bd4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 13:12:28.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0ub3pboj7EIleLGfCBbPjhIeuyYCTnZDnb4IaK5+inDTcB035ivYE4hah2YIEty8AoI/osr3hpz6mBWgixXPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602040100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwMCBTYWx0ZWRfX/5mm2QvMCz9M
 SZn1zQVXp72CZnKkHLdVTbTCqHU62DM9F7MuYbe+f7kbWGNtsvvwvy4yg8FgM3tTuJOgrSOIU4W
 Y5mNr+wLLvVpFDJSMSG7WOTV6Wce3k5x6Z0YA5jHfiZmIj5KtBxRtDSn8YFvIRUFF0kTGUoswbv
 mewtlwfj7qq6ySDad6esmliXO9e53tJZg0KsstfOTk83qtqP7nqKEte/Y3OPLwT3/fHEfM0lOXO
 5ZppfcsjOulgt860kAIGcKThIC6VJ+HiLki7zmXiwlyb+LmWWeiDHl+vSu2XpdqaeBG8K3NoyfA
 +aV8sAN7+sCeLlxb7UCPZhD6X3TDwzmmiysiR/tiZQZ9c9cQ2bXOno3sTrrVrhJt+McHvmJhYih
 Q7KKM5voBhKCb2zdh1CrerQpPXHtRwxAKhKykKk4ynCjVW0bhkAHVBlJcShMj2ljL9y7RffaaE4
 yKR0cdznvMt41Vnhv2psBYEyS13pNdUNYSqsWdvk=
X-Proofpoint-ORIG-GUID: xmQzayXtRFs8ePz-2sa6GMCdCHtdzliW
X-Proofpoint-GUID: xmQzayXtRFs8ePz-2sa6GMCdCHtdzliW
X-Authority-Analysis: v=2.4 cv=VfL6/Vp9 c=1 sm=1 tr=0 ts=698345c1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=11xho6iaKubGieU6bFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12103

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/4/26 08:10, Kris Van Hees wrote:
> On Wed, Feb 04, 2026 at 01:25:03AM -0500, Eugene Loh wrote:
>> Thanks.  The tests pass on all platforms I tried.
>>
>> I did want to check something.  The subject line says both usdt and
>> stapsdt.  The commit message talks of usdt.  The bug report indicts both
>> usdt and stapsdt.
>>
>> So, there is a problem with stapsdt;  the patch fixes and tests that.  That
>> much is great.
>>
>> However, the new multiloc usdt test seems to pass for me even without the
>> fix.  So was there a usdt problem?  Is the multiloc usdt test good enough to
>> show it?
> The problem does not occur with regula USDT but there is also nothing that
> actually tests for this, so I added it as a precaution for future regression.
>
>> On 2/3/26 21:06, Kris Van Hees wrote:
>>
>>> When a USDT probe has multiple call sites in the same function, only one
>>> of the probe programs retrieves the argument values correctly.  The
>>> probe argument data is collected for the first underlying probe, and then
>>> skipped for any subsequent underlying probes.
>>>
>>> Since it is not guaranteed that the argument description is identical for
>>> all underlying probes (although it is almost always that way), we need to
>>> process the argument description string for each underlying probe.
>>>
>>> Orabug: 38922360
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    libdtrace/dt_pid.c                            |  9 ++-
>>>    libdtrace/dt_prov_uprobe.c                    | 10 +--
>>>    test/unittest/usdt/tst.multiloc.r             |  4 ++
>>>    test/unittest/usdt/tst.multiloc.sh            | 69 +++++++++++++++++++
>>>    .../usdt/tst.stapsdt-notes-bug38922360.r      |  4 ++
>>>    .../usdt/tst.stapsdt-notes-bug38922360.sh     | 54 +++++++++++++++
>>>    6 files changed, 140 insertions(+), 10 deletions(-)
>>>    create mode 100644 test/unittest/usdt/tst.multiloc.r
>>>    create mode 100755 test/unittest/usdt/tst.multiloc.sh
>>>    create mode 100644 test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>>>    create mode 100755 test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>>>
>>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>>> index 6f93123f..a379a0fe 100644
>>> --- a/libdtrace/dt_pid.c
>>> +++ b/libdtrace/dt_pid.c
>>> @@ -1350,9 +1350,16 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
>>>    		if (strcmp(pdp->prb, "*") != 0 &&
>>>    		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prbname) != 0))
>>>    			continue;
>>> -		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
>>> +		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz) {
>>> +			char	*p;
>>> +
>>>    			psp.pps_sargv = prb + strlen(prb) + 1;
>>> +			for (p = psp.pps_sargv; (p = strchr(p, '@')) != NULL;
>>> +			     p++)
>>> +				psp.pps_nargc++;
>>> +		}
>>> +
>>>    		psp.pps_type = DTPPT_STAPSDT;
>>>    		psp.pps_prv = prvname;
>>>    		psp.pps_mod = mod;
>>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>>> index 6d1c0f65..e575b072 100644
>>> --- a/libdtrace/dt_prov_uprobe.c
>>> +++ b/libdtrace/dt_prov_uprobe.c
>>> @@ -1659,15 +1659,7 @@ static int probe_info_stap(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>>>    	if (!upp || upp->sargv == NULL)
>>>    		goto done;
>>> -	/* First count the arguments. */
>>> -	for (p = upp->sargv; p != NULL; argc++) {
>>> -		p = strchr(p, '@');
>>> -		if (p++ == NULL)
>>> -			break;
>>> -	}
>>> -
>>> -	/* Record number of arguments, and allocate descriptors. */
>>> -	upp->sargc = argc;
>>> +	argc = upp->sargc;
>>>    	if (argc == 0)
>>>    		goto done;
>>> diff --git a/test/unittest/usdt/tst.multiloc.r b/test/unittest/usdt/tst.multiloc.r
>>> new file mode 100644
>>> index 00000000..a0bbc7a8
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.multiloc.r
>>> @@ -0,0 +1,4 @@
>>> +main
>>> +test:main:args main
>>> +test:main:args main
>>> +
>>> diff --git a/test/unittest/usdt/tst.multiloc.sh b/test/unittest/usdt/tst.multiloc.sh
>>> new file mode 100755
>>> index 00000000..19d5d6c1
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.multiloc.sh
>>> @@ -0,0 +1,69 @@
>>> +#!/bin/bash
>>> +#
>>> +# Oracle Linux DTrace.
>>> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>> +# http://oss.oracle.com/licenses/upl.
>>> +
>>> +# This test covers USDT probes firing from multiple locations in the same
>>> +# function, verifying that argument data is correct.
>>> +
>>> +if [ $# != 1 ]; then
>>> +	echo expected one argument: '<'dtrace-path'>'
>>> +	exit 2
>>> +fi
>>> +
>>> +dtrace=$1
>>> +CFLAGS="-std=gnu89 $test_cppflags"
>>> +LDFLAGS="$test_ldflags"
>>> +
>>> +DIRNAME="$tmpdir/usdt-multiloc.$$.$RANDOM"
>>> +mkdir -p $DIRNAME
>>> +cd $DIRNAME
>>> +
>>> +cat > test.c <<EOF
>>> +#include <sys/sdt.h>
>>> +#include <stdio.h>
>>> +
>>> +int
>>> +main(int argc, char **argv)
>>> +{
>>> +	printf("%s\n", __func__);
>>> +	DTRACE_PROBE1(test_prov, args, __func__);
>>> +	DTRACE_PROBE1(test_prov, args, __func__);
>>> +}
>>> +EOF
>>> +
>>> +cat > prov.d <<EOF
>>> +provider test_prov {
>>> +	probe args(char *);
>>> +};
>>> +EOF
>>> +
>>> +${CC} ${CFLAGS} -c test.c
>>> +if [ $? -ne 0 ]; then
>>> +	echo "failed to compile test.c" >& 2
>>> +	exit 1
>>> +fi
>>> +$dtrace $dt_flags -G -s prov.d test.o
>>> +if [ $? -ne 0 ]; then
>>> +	echo "failed to create DOF" >& 2
>>> +	exit 1
>>> +fi
>>> +${CC} ${LDFLAGS} -o test test.o prov.o
>>> +if [ $? -ne 0 ]; then
>>> +	echo "failed to link final executable" >& 2
>>> +	exit 1
>>> +fi
>>> +
>>> +$dtrace $dt_flags -c './test arg1val' -qs /dev/stdin <<EOF
>>> +test_prov\$target:::args
>>> +{
>>> +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
>>> +	       copyinstr(arg0));
>>> +}
>>> +
>>> +EOF
>>> +status=$?
>>> +
>>> +exit $status
>>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>>> new file mode 100644
>>> index 00000000..a0bbc7a8
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.r
>>> @@ -0,0 +1,4 @@
>>> +main
>>> +test:main:args main
>>> +test:main:args main
>>> +
>>> diff --git a/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>>> new file mode 100755
>>> index 00000000..ea0d6880
>>> --- /dev/null
>>> +++ b/test/unittest/usdt/tst.stapsdt-notes-bug38922360.sh
>>> @@ -0,0 +1,54 @@
>>> +#!/bin/bash
>>> +#
>>> +# Oracle Linux DTrace.
>>> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
>>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>>> +# http://oss.oracle.com/licenses/upl.
>>> +
>>> +# This test covers stapsdt probes fired by the STAP_PROBEn macros, verifying
>>> +# that argument data is processed correctly when the same probe is used in
>>> +# multiple locations.
>>> +
>>> +if [ $# != 1 ]; then
>>> +	echo expected one argument: '<'dtrace-path'>'
>>> +	exit 2
>>> +fi
>>> +
>>> +dtrace=$1
>>> +CFLAGS="-std=gnu89 -I${PWD}/test/unittest/usdt $test_cppflags"
>>> +LDFLAGS="$test_ldflags"
>>> +
>>> +DIRNAME="$tmpdir/usdt-notes-bug38922360.$$.$RANDOM"
>>> +mkdir -p $DIRNAME
>>> +cd $DIRNAME
>>> +
>>> +cat > test.c <<EOF
>>> +#include <sdt_notes.h>
>>> +#include <stdio.h>
>>> +
>>> +int
>>> +main(int argc, char **argv)
>>> +{
>>> +	printf("%s\n", __func__);
>>> +	STAP_PROBE1(test_prov, args, __func__);
>>> +	STAP_PROBE1(test_prov, args, __func__);
>>> +}
>>> +EOF
>>> +
>>> +${CC} ${CFLAGS} -o test test.c
>>> +if [ $? -ne 0 ]; then
>>> +	echo "failed to compile test.c" >& 2
>>> +	exit 1
>>> +fi
>>> +
>>> +$dtrace -c './test arg1val' -qs /dev/stdin <<EOF
>>> +test_prov\$target:::args
>>> +{
>>> +	printf("%s:%s:%s %s\n", probemod, probefunc, probename,
>>> +	       copyinstr(arg0));
>>> +}
>>> +
>>> +EOF
>>> +status=$?
>>> +
>>> +exit $status
