Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794067589;
	b=EQmzeEtHPr2hujmbiJ5C+QK7Gtr/fxLJLJjW2TG2gRZ7GOSUmYE9DGx1EardA2jQ9K2c
	 ry5R41ZboEDpmo1MNWh9eWCL8asbHZ64hH4G7ag1+/Yyk6lyUZuAkxnGMI5mQDwtWHPv7
	 OOLP5oeu7uSCWVgTffs+XUvB10EX5tQgQkQgzHfP+uJCSWZhPSIYwd1SHo39316rVlLSD
	 jv969Sz8gqHqMP6RKJ2PNapo3v2+n5V0BxBGqM3vXe0SHZ5fPfoA/SOvRTxoLXqY6h+uh
	 2wye8lR2eLRKPbXa6TSZn59v+Fsi7zVRNlh4nBy+WeMTO4moBaAM3xuKqxNFjH+fBwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067589;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID;
	bh=HrpagIgI2XM5T6ZvewmN5fSioZhgo20AQXeqBdfdB2g=;
	b=uZpgdp4TRCXXIMH0Sm3nHTOFv4aJCKQ0IQt+D1YNfcGVAI8yZXgkOFPSFuUhzkDvVkQQ
	 1uK7YMiqqgjYBs4tPcKzx3ZNtibTjydFCtX1ZEzLBeuFKKwJwevXUhWdOT5msqLBAZgdT
	 EilP97tWUaNsFAmiFO35Si2sgGxP6Js9KfuSuU0oWRXu8ISwpCNInBEpi8jlHR5JgXLbN
	 noOHCGB23ajWYDuykneigDQpFvHawXsTKtLntqVYrK4B7yK4IMhDxYAAf77g6YA3J1nhO
	 WPB5FvV4XjX6GgZWVvHgW7NgJCc32yjM3k1pggX6zCORr/5p4UayXIoiF1P91asI/pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=ZHLDPR4K;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nhXlkkFL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CC5606A326
	for <dtrace@lists.linux.dev>; Sat,  7 Nov 2026 16:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CC5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=ZHLDPR4K;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=nhXlkkFL
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7G2Zlx818328;
	Sat, 7 Nov 2026 16:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=HrpagIgI2XM5T6ZvewmN5fSioZhgo20AQXeqBdfdB2g=; b=
	ZHLDPR4Kd8APZKJzI+hgQxlxZbhm2cSP8chdHqQMzeOXCKBeUEvHeZNl0SqYN756
	HChs9CT0iBkFyWAi98Ninjh2YrT6HrfNp9DxzAv1hchaCfW4wLGtLxHv5sLUNZ9g
	ztRnZSANHKtwbPQQ3scKeXgaivjTZtfBc3ZDpW+ryO6Rwb/5+3MySdKoGhQlLtvn
	ZeX28sEOSqNOvvwzDC98qozQPCjaVNAi6j+0oUR8DN1WDE1Q4gpsCMHB1Uu+/YEp
	2sg7jtYIZvPG9eCHqDr3/pNE7CHTCi2gzAow6pDy/FhOT686lC4j+Vr25lotIevB
	emonisQLZKcxjVUoQ0EpBQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hstdbgcr3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 07 Nov 2026 16:06:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7F02oB3601336;
	Sat, 7 Nov 2026 16:06:23 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ht28xe4gt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Sat, 07 Nov 2026 16:06:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MktBsdYomgwDJn3y6QfF3xNx6F0wRoBq3Rq8oQkLfq66tpHOeaI1G8FoUV0Ti/x4W6gh4mhBZ6+idpAMcy+73iSwr2NszLK2w7hcjvlCoVi1UxOqeGk93zQavR5dDtocEFBoK9WYdAtOvl6lwyn6iTaEh/3TtkfocgmS5158W01+m5reta5pCBlGO3t+HRNWX+NCUCXxBbDc2UTe4OIrR5cLKAZnJLIPmq/MBxGTEIrfatGkG4DI1UYOF78FSFhs04QaZ2VKtG//vC5jBXqdCkCRcI7fJYqNqNBf57wx0wNqs4LoTHdgQEI3kEPy+r5bugwuXCtC9ejPCK7kGo98Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrpagIgI2XM5T6ZvewmN5fSioZhgo20AQXeqBdfdB2g=;
 b=j4SrzaLIGwO6Fl4/dJV7LY7uf03QGs0M/Mgx1I6e5Q5wKZL9zImV26nWS5GLHab/r0rjJXp+AKIhbP1gTceD7U6LhDwbGVMo2pVG7efSYBwt6gYQGXm6ngBVSwfLBhhQ/Wva3VvJAf3JixO2busbi2G0arjmTlJwK326VPb+XPLEFvzVtsIj20z2QZx8mEg2DgN86Kf2S0/lw/cu0LRfScIoAzjkj/9ffINZidgroL3KVm5v/BL4mpyUF/O+VN4p7r0ufyOU0+ZeKWnP1zTf3ztehyVsgevGRQOi5SYa1GRxfbQfKT4H3FcPZKiYvD+Mc7OriJv4Rf9qmkQm9M7gtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrpagIgI2XM5T6ZvewmN5fSioZhgo20AQXeqBdfdB2g=;
 b=nhXlkkFLE5qdkR5GKsk2MdEISKNsY8cSeWdWG5yhxY7JyFP+vwKh/kvdYLOLafCNr7iw459Efn/tFuO7+755F45BEXcM1+thFrHMncDI3SIOVtF77hAxaQlyzAcwIOiH2iD0Dt/x8ZTsdeGUcu17QEf4LO+RXjgN4ptPJlzBSvo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB5893.namprd10.prod.outlook.com (2603:10b6:510:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Sat, 7 Nov 2026
 16:06:21 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 16:06:19 +0000
Date: Sat, 7 Nov 2026 16:04:38 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nix@esperi.org.uk>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 15/20] libdtrace: search both ELF symbol tables for
 module symbols
Message-ID: <au9MFmAqmdIFmrGJ@kvh-deb-bpf>
References: <9a3ef30ca35af2d994b6f8a42a8e6700@oracle.com>
 <87ik2artkr.fsf@esperi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ik2artkr.fsf@esperi.org.uk>
X-ClientProxiedBy: PH7P220CA0176.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::29) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 1363361e-0f24-403b-9bb0-08df3ce90f86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|261102123227099003|261022075727099003|261021135927099003|261021121427099003|4143699003|261028144727099003|261026140227099003|261022105027099003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vJmVpDXAARzMSvN+8DohbQdaaCqLozmygtRd145cDgeUsWjp4ggAup5GrSN5vuJKSuEy5OLctsQHGQe/t4iOSp5zYcq7JWrqfohETY4I+kTh33J5C0yVWwYnWYwnp7ZawTd+wQi+8a7BcW5MQOyaOKHc5UINdtxvgwl49MJ06y4zCgryac6B7jERZ0x1eWS/TyaDTZVidGZP65L9HnaOR2D2YNi/lwmXHBQCUs/+bOQqRb67iU2hLkQQ/PsbBBXokQUFVv4yand6LAyJ76oR40q73T2j+tCXj9wnjHUoWt/p5B2Vh0StdLIvcbl6XEDWnuz/ZGAbs0vxrztKYV1wKHUsAzrG1mFk/NzR7LvM1TGPF+3Sy4DL3VL262YIDgsbHWqp/C4rZD3fk5IZLdWXM2F0hDb1Kyfzlz+Qw9SyLPoApmxREfCVseILcgRUcfexLW995Skeuozstt9kU88Z3jhjl2EmnowTbZQKCL7X2k7xZXo71SIBIknQPZWcebu6rcKPMTWq7jFxRhIlTKAb2nBmFaOrIU2bDATivA4vsJhbobjHuxaXml6PS1nTvTf+YtIO54cfx6E2t2PRh+q6cfTa2ep0qLgCcbBprE9PC8os38mEmS5OQR5tKbmhaTnpoy4bWnMYRSdF2yl0kT2dav+Tzklm+eXLwZhaNBsf0Ps=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(261102123227099003)(261022075727099003)(261021135927099003)(261021121427099003)(4143699003)(261028144727099003)(261026140227099003)(261022105027099003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0g0Q0ZsWlp6SisrQ21XWE1KT2dMNitmcGhFRE13dTRyaWJTOTI2T3htZmxi?=
 =?utf-8?B?VWEyenpZR1dZS0ZSbW5QYzM2eUxoc0lxc05BaTBrYm8wUkRGTXp6SFFYd2tq?=
 =?utf-8?B?SzhaME1PZWV0WkxadUlPZUhBMGt4YXp6ZFlSM3lPOGppMkJkSjVVdzhVS09V?=
 =?utf-8?B?N1JDTjNRNVlnVkhTTVI2Q0pjb0UwbDVobGt2QnViWlJscGZQcnF5WGZLZVhn?=
 =?utf-8?B?ZW9laVN6TXdMUmVXVmg4a2srcWRvaXNDZ0lyT2FkWjRXblhCUTA4ZWxSaFQz?=
 =?utf-8?B?ckZ4aWdkUUx1RzhBa3hWeHh1dmhIWnhUTGN6WVIzTG9pelBzWnduSTJpTTVw?=
 =?utf-8?B?SzFxTHdqalFBTWd4dGZBRXBkZDczZEY0dVJENHAyTStvem5VckczYVBiSEY5?=
 =?utf-8?B?Z2gxRmZUbkh3UHNxNXh1NWNaZFBRVFhPUW94WTc0QmEvODBQVnphdmRTNXFN?=
 =?utf-8?B?Y1VxMWFzL0gwOG9NNWRQbkNuK3NQazd6L2t0d3RkTkQ5bDlKZVZ4elg4ZjFN?=
 =?utf-8?B?c2V2eE1WdTNWSzUyNlpJVE54QVJ2TEZBajdaN2ZNUFRwamNrQm9EclFoNUd5?=
 =?utf-8?B?VGxDRTQxVEdUQ1ZaenhxM2pJOGt5OEJRZE45eDA0YTlwdVlRTzdGbm1zZzRm?=
 =?utf-8?B?M2RQUCtxWWc0RlBkbWI0NUkzK2NjTUpEQzlONmsxMTNVYW5CNDJaUGFqWnZQ?=
 =?utf-8?B?N05qT0dzR2N6QTE3TnB1Y3ZNaVNvS2tvdjFlREZmMHVhR1BxVkMwZWN6bkc4?=
 =?utf-8?B?My9uUEV3UWcxTHpxL3lQaGNveUVnTEVhdTJHYnhodGt1RDFqLzRab0RPZEg1?=
 =?utf-8?B?eFFRTjlyNVhTSFRONG9Ld0J6NGdNRmdKVmhOMEN2SkN3ODNra2RSSFk3WFU2?=
 =?utf-8?B?K3pVZmRPeUtKYnZQcTYyUmZQVEJSSmd2cUZST0RmSWE1a21NaEVheEpaS2d4?=
 =?utf-8?B?QUlLQkwzbmlVS1NDNW5QTkt6TXNWeW5nb0NBR1Q4bEdVK1FaczJZOThRM2R5?=
 =?utf-8?B?M3QwRmQyN0RnR2ZqU3ppam82QU45RGdZYXVBRkJHTU9ENWRBY2hiRStpZC80?=
 =?utf-8?B?cFdrQmhWMGJ3ZVRkdnNBS3pEYm5wMDJCVWZxbWxuVERHVlh5SndDMXpOOEpl?=
 =?utf-8?B?UE9WUzZsZU1qbm54dEtVcGtpTzFUK1VGa3Z2bXVUMWQ2T0Jjc1VkMnRnbGJt?=
 =?utf-8?B?SDA5Y0VnUkMySU5VaFdKSDhHQjBDSHVCYmh0MksvTzVjdVp1bHZNRENGVVhT?=
 =?utf-8?B?SE5mbm9CWEpDN0MxblZMS0tJTjZmQWlHT0xDUVlKaTF0dFlPWWt2bnQ0MitW?=
 =?utf-8?B?SmR2RFd0OFI1OGlBRFd6d2pLbURzM2hqRXJQcWVyN1V5eFkySkdGQktVVW5o?=
 =?utf-8?B?ZUNNR3Q2MlljRmFIN2lPU0gxZm4xazdXbEF0Rndjd3dQVnIwYUNua2twSHZ5?=
 =?utf-8?B?T0pIZXVPZzRyNmJtbHQ4T2g1VEduRW5HYk1rVW5GZjBQNWhtSDNzeVgzTHdu?=
 =?utf-8?B?OFgyakJYVjd2K3oyWFhLeVJoTXVOd3JHdGxhUk9lNFpBeCtuU0NJaWZnTmQ1?=
 =?utf-8?B?dWpxKzdqS2tDTDdnbXFmZjBrYkJnT2wvd0JZK3dnTkFmYkI2aGFmWTdLUmFF?=
 =?utf-8?B?Rnk2T3djMHBBbjRPSFdUdnA5am5IT0ZrTlFOZ1lSUUYwcGFDZndNZnpraHM5?=
 =?utf-8?B?SWJkYS9kM2k2N2xFKzhweFdGYUZ0Mktib0JUc08xaGl4MDcvQU13MEhlQ3hz?=
 =?utf-8?B?WU1iU2xPbWpJTWJBa2lwSm1TN3pObWtGWEhYV2V3TmRXbXVFdUpOV2o4NG82?=
 =?utf-8?B?SzNFWk05RDd0TWpBQ2VkRkdBejl1QkdDQ0hLQzhMNVRUekV6dnBQNGsrVkFT?=
 =?utf-8?B?QyttWHVOeWpIcmhXNWw1dml4Ump2T3FkTTFuN2RQcW9Oenk0OWVadmpadlpN?=
 =?utf-8?B?dncwZXlyc0o3ZmF2YjRETmJPSmdlaGhobXhhTjRhcmZmdGlGcDNRVlhpQXYw?=
 =?utf-8?B?RDhsSEc1Q2d6K1N2ekdqcVlBR0wwMlRlUVNZMkFGeXMrT0JrVUtsYk8zYVow?=
 =?utf-8?B?RG15U0planE2T2JsTWhlM0dpM0FjdURBSGNLLzF5ZVZlUkJ1OG1Kc2x1ZzNC?=
 =?utf-8?B?anFwOCtFTzdxZFhCMFVMcTcyRWRvak80ZVQ2OG1mYytRTXlEYlIyNG1YZGtl?=
 =?utf-8?B?cFhQNWZqNmNObUIrd09MWmhybDEyUndVdXFiVUtnMGJIWDR6cTR0SHBUZ3Zq?=
 =?utf-8?B?SEI5blpRMkEwNGE5b1hkcjlnMlFpU01qTjg5Uld5dU92TUEyMHFhanUzd1k4?=
 =?utf-8?B?UUxIUjhRTFRqcUhSUDNpMEc3OHRjdTZkcE9GbEFEamVCUlg2WDRkMXdDK0l0?=
 =?utf-8?Q?QNiVYyLJK8CHTGn8=3D?=
X-Exchange-RoutingPolicyChecked:
	RF+U+uX4fERcSxc2B5WQzB/+pvBgAl5qVbx7Ywq1R3pMbbBurkYu9gs/DQj2xZZ3WGhNbN6JVAGeQ+Kh1HmGf3FABPdijdFPtPq6RdeckmjIWrySPGRdN3DkqbWcOJvn2NJ1iYUGm+X6hhe1bOXnHk3ap6uD5XhZh4IDiB89Av1Y1he7El8WGvMymtvVhD+wNwyoxCBXJrmyMx7qU+nCjuj1A3xGkTbapdDPQmLL7efrixgqccI8wlpDtVRdz/4ogdhL4xFEL5wFs+Ms/g1H91RgzHZfq9IGttifUK/mEWflJ3mU1B/ctw3NJMLRRxaxWToixWO5w8gTZsOc4aAaRg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WQT0F+Wx+p2aZ0vsZnMeI9uR35MDvnxtOA6WG03WXdG3Zc34dOSzca9GpXqrEJQvUO8byBBBO3sWTfHqmujKgOEYzhnu1D2DHNioHO8qjpxenUjUKLhwzawlr6M3WtOxJ5J75ZJ8Rk8fd9aAHhoVXFvp+Ek9VuwUvQqsIO/7Ow50GC2a1XsL/K0H7pV3DiUTYD6tSZxr33LOJzTFiynMbxA68hKh8EZCpGFdshFueI3sJBAVNX41qCMB4EqkHEYTpRteg47MBFY6nCWwK6BEgdgvgVIZOQ9GLLkUrKoXs8szQNlNyzx7JAftdspoLRbXUONTHrR2wweD1es4BgX0lZV9WiYa+EHCkCQtL6t4E7WhxUZoLXDNa4eyhv4qFzVgehgWAWuILoXkbEYFVY1ACR5upl5EgsphpTYKyWgUOZkejEN/w3OlEindMA+yKHaK6ROKlMxanw5ON35MNxAtxHwHiRh5b8c5UKiyAbT3VAiURIukJj1TrjuoVAJapgpHC7UITyLfkGp2oK7BUD9KuqCww9gO13AKn/AHspmO339bYnPyU1foxW5JnqmmjGS+0i+QqB2MbXPmymemKR/few2GpukucDnYdK26ytpA/OU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1363361e-0f24-403b-9bb0-08df3ce90f86
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:06:19.6049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MguadW1EUlE05ClnNazAxQkTDnLXX4ueH9FUuIwss1CXMIzwRbas9b/PgWewS4vVgFcdoQAVCKFUi0aKW04xFyTqQkl6M7ETFNMMPOh3LUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5893
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=941 suspectscore=0 mlxscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070063
X-Authority-Analysis: v=2.4 cv=cfBHPXDM c=1 sm=1 tr=0 ts=6aef4c80 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=lAMDSQhdEg_u4JUCSa4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfXxVgMLLr1zjPO
 lo1ZiQRVvPR7ha4EJ1D5SxEyPYkm2VS5Lh9GDpFfsCxS4fPV7/WFqo7gCkj+hqThKKeiOiPYJzr
 /YG+JjJq1Y02bebBNxnqa5J/a9q1d51wXcYeEHtIlhHfhOOfbk140HlWiiNO5d/xh/zHNIP5i/9
 4ATJ1Q3LNm06gB9eHCFrdkMVpQGZEDwdGja7z2nMO2zw2OEraT61ZjOX6dkTUjYtnWzkMNuSCik
 YLTYWDfPuPevfROXgEm03GjQGdo32rLvQzzS6Hciz9Ydz97SMKaEj4WXxu7kvrTYDzhgjBtC5AU
 7m6nOJZcEHyo3fuJKWjuDkDSrIuZqcRmRzNfaSqgmrdGAX7+7fJAWUAimVZy82WCK0fEF2p98K+
 QZlUOazoYaS5EFFYSMqWPf+18V+Oo29AhB8jF9W9nELJPPLZl3+WO0nepeMaDngQ0H34d8jsKtH
 n/AeQK+F1PJ1+lZm5vjtUFrfJwF4Sgg8PaNp0+sQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfX/BJmk1HppRMe
 txdW3S/f562idt9LxSsSYZ8vT6JTKkG/gTqf496XNMMnLCbDDBjv3WuNUTc2SGFrKUhtrxVkJpH
 M+vy32gw3auIKuGXcLcrfJsCd24QE98Uod0cQeK/m/FkvJ2a7Uzl
X-Proofpoint-GUID: EZdD65nFMhFMvcAN2btyOfRm3cJ7SstB
X-Proofpoint-ORIG-GUID: EZdD65nFMhFMvcAN2btyOfRm3cJ7SstB

On Fri, Nov 06, 2026 at 01:13:40PM +0000, Nick Alcock wrote:
> On 30 Oct 2026, Kris Van Hees said:
> 
> > Keep independent symbol and address indices for SHT_SYMTAB and SHT_DYNSYM,
> > loading strings through each table’s sh_link. Search .symtab before .dynsym
> > and include dynamic-only names in module symbol iteration.
> 
> Yet noather place where one or the other strtab was overlooked. These
> mistakes all date right back to Solaris...
> 
> > Preserve .symtab indices for CTF, place dynamic and external symbols in
> > separate ID ranges, and use .dynsym for CTF when .symtab is absent. Allow
> 
> Except in old dicts (CTFv2, or v3 in the absence of the CTF_F_DYNSTR
> dict flag), .dynsym should be searched unconditionally for CTF.
> Preferring the symtab is wrong. (I suspect this code is basically never
> run, since it's all symtypetab stuff, and the symtypetab isn't emitted
> for kernel CTF.)

So are you saying that this should be updated (and some other existing
code) to give preference to .dynsym for lookups, and fallback to .symtab
if the symbol is not found in .dynsym?
