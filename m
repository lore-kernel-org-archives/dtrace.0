Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0900B9463
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756404888; cv=fail; b=rubjgNH+Fe67NtEivjngbnTo2YV89zqXSwcxcj5KbcLOvzKCZlB5R/+K+UeoJJALI6vrslxT8IQPpz4dOMgEsUNLsGr/Y6NwxPtDr1xp1mmOp6fG5fLWWvOHcFTSX4bnU9ayfxtjXGewztRvqs4SPPAJHTP79HjVdmFhhQewFj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756404888; c=relaxed/simple;
	bh=I68+nppNUP2xWcUnvYr17nWxrP49X8dE1vpaN3Uy1zc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T5Bf9q3j2XhpFv+ImQdnqQVddexLSnqabPWBAPQNZK8LAhhowaZxSMpVBObk1Q3JG+y6WaF4lYqZMCz1INETYhp/aiGWTWM9DO/zui9t3nKsVPIZVQQ1PK5TrZcku/z1FnalsOsRitSUHdxaGScSKj32/oDj17/KYgp+2lWy2Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gk04PyC5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k706Ijv8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gk04PyC5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k706Ijv8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHMwAC030462
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=X8b8HZpGQOyP8kgcjGPmBez3G8m+oCAf3YZp13BFTwI=; b=
	gk04PyC5LrVq0ZNrA8vEqHTsQD9Eb95O4pcAKTZsOhWFcvCEKkcAv4S9gvJzVbHf
	YaJEmL1RHdtprYPqhS0ZSC1nxbIESfLtpDBNq6nRGcQX892XxUZ4H01oc6xR9eqj
	NmjsfJ+5ue+UlLZOkOHZZnGP0gyy6A1NONf6nv0gADq6nyivO59yMj20txexFyFF
	n5vYUbkNNoFjQyKtb5ZTr1DCehjfxHvSAgyLVlgaJGNhjXEt8vUwO4ekVOD9oEFP
	9GPM1FHWW+F3l3kiM2gQJA5hz1rwDdrBN820Ypj1dCxC7YO1FM4iYanwt/9JKOjx
	Zymbw1jJmZHZjLh64wIh/g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q58s9402-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:14:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SI1WpG012167
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:14:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43c725m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzrAukOyKDQWfg8nwmfJmwbsBU/1BPPc08pp3HxaFPaS7OeUceqOJSycwGi6u6aifucHryHyQsjTzXuApjvgM7PpQMPz7MEIjb2a0BaVSjkawjbL3B1iMnpYJVuyj0MVb9nIUP2KVz6PBh9iDwz/sH37EQXAj7HF+/t0CB4lYM/vYYZxvjEwniSvDxwVBwMngjOSNhmmHAuriHsSKumL+6UfTBWXXrYBgebi9JuHCRSZh0BI1ijn7u01aV9JlO+BOmDu/ZXz5+sU/criGYaP6/i/GrUCO5GppPs7bsRRIFQHKDfj1+W342fdcIWXPPOpULFcflU0CYxHi89DuennVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8b8HZpGQOyP8kgcjGPmBez3G8m+oCAf3YZp13BFTwI=;
 b=DytDskwjAonbdswgjzRX22jAQPoHLntFXFRV18wasj+cXS0TILDXcuD9rmrRJcdIvTWToPYJiMxkC3bRMb/DqPzxXZs2FLV8fXqQWdlmJxb3o+5W7ZeR2g8V32QelfjR73J5VdTzjunrWFMQo8TayfTh6xCk41DGv8Z6eRqiBCH0HR7oPNzPyvFD0EUdraHxgCQachQ29AiV/Yzlz3EW3dGWHSPRFD1OUhnv1VEPPIAVbhbz2vduZNCzo1vgcm4SRzfSrHZvg4ZMlO0BxQ4xdQhragO/iAszrqpBHaiM/3CSa3opvBoa+Ha/DRZNUWVyk2gTeboQvVclozKMJElsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8b8HZpGQOyP8kgcjGPmBez3G8m+oCAf3YZp13BFTwI=;
 b=k706Ijv8UW9LR4VqX03r9UwseCJchKoERzJY4QvdbsCpDm5uCGTH0VHmSgBpKVXouCIosSWwpaRzso6XXSLYHAjZzBuPg1bxK/5oJIOqDm65GpkPPg4WpBoqSc1BrUtntW7ox4Pd+8bB8Lei9CdOefW1XcSFVqeJOKOOJhE4elI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4357.namprd10.prod.outlook.com (2603:10b6:610:a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Thu, 28 Aug
 2025 18:14:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 18:14:36 +0000
Message-ID: <1a5f6f1f-31f5-3bf4-a767-65e1ab8efbe4@oracle.com>
Date: Thu, 28 Aug 2025 14:14:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 4/5] test/unittest/udp: enable IPv4 remote
 udp test
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-5-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250822181629.30972-5-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:510:23d::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: cab7f0d7-339d-453c-1de5-08dde65ebf0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0dQdkVMUHdGVys0ZTVwNTRiSjRtcWJVclpiRVkzK1U5VXlKWXRnZGRtUkZl?=
 =?utf-8?B?Y1ErbEN3SlVkOTVPTnIwYkhWbXI1R2VUczNmSGpvZXlQcTVwTWptbkRIRHk1?=
 =?utf-8?B?YW4ybWFTajdBMDYxZk5lYnROV2hKNnQvZXRNU0p2eG5NK2lUNEg3UVV1UXVE?=
 =?utf-8?B?MGFJNE8vR0xCSUVPTE83aDZjcjZ3M05yMHI3V1RKSmU0TGRmQ2RUeGhLL0o5?=
 =?utf-8?B?bEdwK2xjRWlHL2c1MDkrM0xTRFYrTUNaazZlL1VoaUoxQU5MYnhXS290R1hz?=
 =?utf-8?B?Q2ZKY0t3VXBwVWl4UjhzWGVwNmN1S2VqVWExTXQrV3dlVU9UaVRMVjhTMnAx?=
 =?utf-8?B?ZGZqY0x3aWVJRUs0UERDUW5EQnZhekFLcTZOUlVzNXVuRHRYZFdTTEE0WDJv?=
 =?utf-8?B?WEw3bTNyaDNkeTZCdWVDUlFlV2J0ajlWdkpmaGdHSTcvVkp2Ni9YaUg4QWFi?=
 =?utf-8?B?VERBdGlva0pXbXJDVG5wM2oyd2ZLSlcyOGpldkpMd1VlS3ZNcUJRNW9hclZj?=
 =?utf-8?B?RFhKQWlJczVtY2hFaGVWbnJFZzVnc0VJdHJQNlZMZ1JOOWF2K1FSc3N1T0tu?=
 =?utf-8?B?bU5JUU56NUx3MmY0TmcwMXpISmhtVWNqV0FyOXVWajYzMm1NU0NKaUE1QzNJ?=
 =?utf-8?B?ZHZVdGM4OWpCR3dNTHJSU0M5ak1vbmdhZVZNdE9SNWlMQmhaZnRYQkJnUm91?=
 =?utf-8?B?QjgwVnNMbHhwQmcxVmIxbjF6aVZudUdUV3JhUG9XS1Y5WDdvMkNYdFFTRFZk?=
 =?utf-8?B?UXp5ckx3dXhsc0FrZmd4QkVjVTFjdEdCQVNvdmN6aWRlYnBxVTcvRG9SMmhN?=
 =?utf-8?B?LzVWZU1Jb3cyM0RPWG5XYVhjcTdNUWpaM0J4NjhkeVFoUzE0Qi9PenpKQWs3?=
 =?utf-8?B?V3Q3VkUybThWL0llZTF1QWJEQmlDVi8vdTBiLzZoRmVpc01vSENYeVpoenpV?=
 =?utf-8?B?Y0NxYUZJeE5ZcjdvSmwvWVgyOXhWc2MyNC9BOUxYWmlqU1VjRk1hY2twVU5a?=
 =?utf-8?B?YStlM1VqMjVPQlBCUkpsTVRyMCtoQkIrdCtOamxqVHBtRlBsajFUeml5N0VB?=
 =?utf-8?B?QkE1L0poZzNZM3BXRHE3TEU0VHVzanRXdjhGdmJXWnlSTU5hbnY3M1ZKdy90?=
 =?utf-8?B?ZmhIbzNYelR6TXdFNnlpRGI1WlpxbEhrNFJ4MDZqT1ZnenVKbVk0RzhnTUR2?=
 =?utf-8?B?YlVkdlZvY3FybHZsREdjL1VoQVV1eVRyaHRBcThKSVlraFFpOG5xam1VWnRD?=
 =?utf-8?B?RE9VNklMN0x6WEZFQmszTHY5b3FMcG93RGo3cTNSeEV4V2xvZVFCWEF4UFJx?=
 =?utf-8?B?YjdGdXBEaldldGo0S1MrWlBzSnRiTHErU0VYaUdOOUViTG50V25PNkNhY1ZL?=
 =?utf-8?B?cWFZTEttb2ZjWXNza2FnazJmQ3pIWFhIVW9JWjdlblFmWXlLLzdybklCWWsz?=
 =?utf-8?B?ZTMyS1paSDJRTUxFQVdmMG8zN0U2dGYwOTJEbUFBc2pBRVFQa1VjT2QrUDU0?=
 =?utf-8?B?OWJhNG5KbHNKWGNteVVteXVBRFE1ZzJSaC9aeUZGbDRpMTZ5b1BnUW1tRFo4?=
 =?utf-8?B?ZDJXcUo2VEw3M3BJK1ZURHlwSm1od2owRmpOREtqdmxPZFNsN2MxT05Yd1ZG?=
 =?utf-8?B?TncwbTByaEFqNUVPQmdKVmM1M1VqaG5ZWlgvRWo1UW5seElsSExrWnNqYktB?=
 =?utf-8?B?QnRDVXFiRjYxMXdyTk5hVGsrS0NQZHVuVUdOd3E0bFdlYnBvUi91Q2FubHVD?=
 =?utf-8?B?S1hFZHZIMmtUdXU4MGRldjYxbEF3OXNMWGNJU2Nldk4rdHU0VkhBOUZ4RktU?=
 =?utf-8?B?OWVKS2FEdVc3RzF4VnMyS21uNjRyMEdPNjVrMStFcWN2dnF2Uzdpbm5nTHNI?=
 =?utf-8?B?ZWgvQ3oxNGEwaG5PN1E1NmVPclNWYjdXdlh0VTRENkFoZVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1FudDkvY0FBNEhpWU1pRjFxbS9nNXVqbklxMExCdTh3Q2oxMzlPSVRaK1hG?=
 =?utf-8?B?T0dkazRVUnhrVkZ3cnZ2N3ByMWVZRDVwZUtRcHNqeVFnRmpvV3FDdjArYitN?=
 =?utf-8?B?UVNrQ21NU3JsM1BsK2FrOXBwWFU2WTVoQUd5aFFwaWdFU3JqVVhLam1kanJv?=
 =?utf-8?B?R04wMUI2WExPRHBYbVF6Q0o2bFpUUHEzSEtzTFhodUw4NExJeWcrdVhHWjZR?=
 =?utf-8?B?STgvcDVzVVZyd3Y0V1BNaUJoWjd5a292cHVCVmtmSjFNY0lzVmlsZ2p1SDdB?=
 =?utf-8?B?QytUNVNvMkp5VGxLZW95T3Y3cGZJMk9zTTVhZktBVmZCZXpWS2laakluYzE1?=
 =?utf-8?B?clVpUE9nNzJabGswSmV6UDE0UlMvYVRKR21KSG9SS2dZQm1FQm4wdk5NalFC?=
 =?utf-8?B?QVM1c1Z4Q2pIN3U2dnVZczhpOWhhM1d0a2JnTzZRa3llQmJkK3pDYldrS1J4?=
 =?utf-8?B?NW1STFJFRVJUZW9laDZnZFl5VlhQNEFYZUU1L0FtSzBUMWczS0FCbGp6QVBj?=
 =?utf-8?B?QnBGSjhhcVNGcXVhODd6WDNCZWxubEViNUhqamd2Z0dsamdxUnF6bnVOc0N1?=
 =?utf-8?B?ay9pTUxQdklxZ3VIVnJIOG5KSnkwZXhTYTR4SGF4RVFyNWdxL3N3dkIraWFo?=
 =?utf-8?B?eGtNc1VlN2dJa1BiZWFaYjIvdnpMUmFWS2pRQnZBTy81OWxRSTNBVXFrUGhx?=
 =?utf-8?B?REhSYWxqa0M5SXNnUXhmczQ2VzBYTjdwb0h1SXord21LWmZlWGhoQm1SOHYw?=
 =?utf-8?B?MnZFY0RpZlBLb1ZHbVhHTER4RzlMVU1May9qY2NHeWZUa3ZjRytVR28xSDRI?=
 =?utf-8?B?Q0Y4ZjdiOWYwNEdEVGsrWVhnb2lnM1Vic0o3ZlpuK2t0NXBOSi8zNndFTjl6?=
 =?utf-8?B?RHNaOEwwNEs3eTg2am8zRC9ucW8waEwyMlBzZWEycU56MjE1MlFPT2ZoaE52?=
 =?utf-8?B?c3JwMGxTVzJFL0hWR0NCeXhCVk1FL1hEdlpPYjl3S1AwZHNaV3NBUVMycWN1?=
 =?utf-8?B?eERmN29XRmJ4OWRJbEd6Y2tTMFc0UElMWm00Uysya1grMlJyaFZlWGo4TlBZ?=
 =?utf-8?B?RHAvalpjSnZMMDR5M1kxT0hEWU9Wc1NqUy9rSGdKNUsyVHpHRzIvVjN6N2dr?=
 =?utf-8?B?c1hwVndGN3hNMDdYMnVNWDBra2Y3ZERKYm1CZXRGU2x5V3lGSE4xYW5tbGhi?=
 =?utf-8?B?K2RQN1N4Nnl0d0ZxZkhGbHdHeTJMYTZFQnF4NmFndWFqNXFMMThNc3VlY1pl?=
 =?utf-8?B?YlU2bUVOZTFRcU9TdUJrNWdzSUk2bUlOOUtIdEdxelY0enVjakJlY1VjQzY0?=
 =?utf-8?B?UHVFQUV1STRrTkZkN3BjeDljYS9FdittZUNtbkxVNzg3YitTNjB1YWp6aGxp?=
 =?utf-8?B?VkhXUzhEQzVUM3RjendEalE1ajJNQlhjM3AxUkFtdHFGU3lUWU9XWFR6am1p?=
 =?utf-8?B?R09VK0Z4a1dqT0hudHF1bFFOMkhaZkhDbURMKzZyaE0wREI5QUNtckdheG1F?=
 =?utf-8?B?WmVaY3hoY0pHVXFQNHNRQStsRkZRMXdGaVhUQ2RXLzVPYzZaakhQdXN5MTM1?=
 =?utf-8?B?RkRvSFdpWGlrU09UQWhCejJWRkVIbnR0NnhVTlFpeDAwUmlQRUtVSkhRdmox?=
 =?utf-8?B?bG0vL3BLTnBzS2JmK3hSUy9zUXRtMXdHSkl5N2JQeXlUWmdlNkFJOTFiOXNW?=
 =?utf-8?B?RGhYZHI2KzlrQjlzMTdNOWlac0lTaGxERjBGeWlLRHBZeTVaZ1pTU3JPdVBu?=
 =?utf-8?B?UmdGVkNGMjF6N2JGazQ0K3B6MytsOExZamZmczhIS0hBVEcxM2RHWEE0a25u?=
 =?utf-8?B?YnBDREwvQVVHVDRRZEttQ3JHazk3b0Ixc1d1UlVSczR5SFZpalFKVS84cm8y?=
 =?utf-8?B?ZWpkNGNvaG1QOFQ0cy9NQTd6eDBUNG41ay9XMi83a2RtMjNnd3ZFWDFLck1C?=
 =?utf-8?B?cmRjdzNieEZMdlBLSHBkZXp3R0F6YmJ4T0h5S3JVZ1d0SHlWVDIrM2N4enJZ?=
 =?utf-8?B?UjFXRlA1Nm1wRXJkTEIzYm5OSHhwUlVIYXR6MFVIQ1ZKUnc1QThRUUJSblY0?=
 =?utf-8?B?TVE0TjFyVGpQNm0vc3RQUmV5Wmxhcnpjd1lvbFZqYzVTT2s2VlFmbVdzaWtC?=
 =?utf-8?Q?P9bwolPfME3smXyJTH336AxJT?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V47lU+U7GqgSxC3NyIJTcLtae/FLjSXuYIu6bKXqEdd5amzOJ5VKVbFg/YK7gWc8FN547jz4hLgnEpS9H0+0YSxpGvyH3aFfaKsKjGuwVk/qZ4c7LdktLLDJ/hhK35XE1/crV/LlUTodnkMSKjtBUxYE4wdXtBdI5wOlVDOp4MBpXqh4uWtM9Rui4Jmvepxn2BA7yBqSaupCNuSwQRRwkm4c7+xVAE/2Mjibmw0NHxjSaXRUH79bsaV44xD63Q1gVpq495w8DE2iXv/SABCVXU/Tp6tuJqXYq/g5g9icgzPtFnk8aDgzq35hv8OIKEJk1Z8IDLhCJV4vK8IvYkzyk7ZWG30ACTX8oA790CLJtiMkZ87fIDvgli74t/fUu2KIMcw2NCYLCfzKnN24DcYQa3Rzua5YcQ5tBP3/zUWke0z0n4/BcYoFlYDjpbjydLwFkWGgAiC7FXJTEog/i7F8fYN3p0ftmlwD8XOm5gx6Kx9QRPjx/F8SzT6mVV5nR2VpCpdZRtwbGf6cYtatQc/r0SPi6ryDlfL1U2A7qfUzKr/nR5FuFwLuOhC9+PvoEHLfsisOMxrH0mSZHlsXzrLblHooHnu+pT7/8KKrv9v24ds=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab7f0d7-339d-453c-1de5-08dde65ebf0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:14:36.4866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aq+nVTBtxCgdi1skJA+tOKwfzxNIvDcTvrp3ruPMSBixllj3wDb7RDVjwfifXj8+82ILdeVPSpsHrYi6eNwyVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4357
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508280153
X-Authority-Analysis: v=2.4 cv=J6mq7BnS c=1 sm=1 tr=0 ts=68b09c95 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3AFdnleRfX3doKjJ3Z0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-GUID: YV8sGHa_9lkLLiX9eCGgbB4oCTF2fxAq
X-Proofpoint-ORIG-GUID: YV8sGHa_9lkLLiX9eCGgbB4oCTF2fxAq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyNyBTYWx0ZWRfX7cFfEYL/rzu8
 KSfkzPT6Eem5hqjIfXiN/3yqMyj5FMGVKkwF+gjqDQl5VEZ0OCLYZOfsmAeksah1YulXzhAAGt6
 ymIv2Ky263gxOLzZlFdF4Ekrs7MmW/OvlIkTWvgj8SLRrLr5kZpijuQQ3ASSuwF8unfvnA/B9a7
 FQ/GsO8s3sATKUTgtGDt6ddMxx8HMj+mdp5mouyDqwEJOquFpRGVK/rXHK8N7SD2+0I2R1Q27wM
 TqPlWo94dNDDvlxMmRB/sfzbnW36UBEmQlqAxC8PhzanyeCJUiJcZf43UxEyvjZxzjpWMr7hMEg
 HpQMjSr1uvzL9D/vgvFJCsYo7Ri0CY5btLNTdmZSsgUY8hee9iZnQflOLzvSTMnyXDpYn8+xrgc
 2yAaKhpI8DtAmQzU64bFfrjsy618tg==

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

PS  I do not understand the read->set change, but I'm good with R-b 
anyhow, just to get rid of that skip.

On 8/22/25 14:16, Alan Maguire via DTrace-devel wrote:
> It just tests send so we can send to remote address
> and verify probe firing.
>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   test/unittest/udp/tst.ipv4remoteudp.sh | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/test/unittest/udp/tst.ipv4remoteudp.sh b/test/unittest/udp/tst.ipv4remoteudp.sh
> index 89309cfc..62ed186a 100755
> --- a/test/unittest/udp/tst.ipv4remoteudp.sh
> +++ b/test/unittest/udp/tst.ipv4remoteudp.sh
> @@ -13,9 +13,7 @@
>   #
>   # 1. A change to the ip stack breaking expected probe behavior,
>   #    which is the reason we are testing.
> -# 2. No physical network interface is plumbed and up.
> -# 3. No other hosts on this subnet are reachable and listening on rpcbind.
> -# 4. An unlikely race causes the unlocked global send/receive
> +# 2. An unlikely race causes the unlocked global send/receive
>   #    variables to be corrupted.
>   #
>   # This test sends a UDP message using perl and checks that at least the
> @@ -25,8 +23,6 @@
>   # 1 x udp:::send (UDP sent)
>   #
>   
> -# @@skip: not sure what port 31337 is supposed to be
> -
>   if (( $# != 1 )); then
>   	echo "expected one argument: <dtrace-path>" >&2
>   	exit 2
> @@ -41,7 +37,10 @@ if [[ ! -x $getaddr ]]; then
>   	echo "could not find or execute sub program: $getaddr" >&2
>   	exit 3
>   fi
> -read source dest <<<`$getaddr ipv4 2>/dev/null`
> +set -- $($getaddr ipv4)
> +source="$1"
> +dest="$2"
> +
>   if (( $? != 0 )) || [[ -z $dest ]]; then
>   	exit 67
>   fi
