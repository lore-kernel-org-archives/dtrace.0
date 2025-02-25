Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779DB211A18
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740518990; cv=fail; b=md6CtdExIWP/GflVeqIXCIy7fYgZvHdLjVRJCV4e3lf2Y20nuAsPf/nTKwIqPX70RgjqkhPE9S5zRiROHZlmRnmuKHmOnL4eGOB7t5sg6bN7RnO69EgFhqXhMIJhZh6Z9Y6KwK7+Af9RwLYEojD5F00+7MMfVVrdChd4lVHjxrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740518990; c=relaxed/simple;
	bh=jliACE11xLHoxdpqgy9wIZbWL5gkOy/aA3+14kOXqoA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qQRxUqSeXcBBALy+9ccrxyqwW94FUI/VqWtsrysaVvOeWcpf1Y2mV3BN72RYh6t5dLCOdeAN4W2eD3l0cWhDtyZuUe5Zp3vSiyFkV3I3+AMfznr52Gq6d4aS9jeF33/ALxulO7aBvIsDCN2KYFyBR2OK4UD4kfObVg1+7Gyanfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IQcs+9B3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jA07VjC8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IQcs+9B3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jA07VjC8"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PIXeQQ010946;
	Tue, 25 Feb 2025 21:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=SUNeds3ZxSBfC01rQxV33pNvN4ZkesUOCYMPmQMbG9E=; b=
	IQcs+9B3XQDROEc07QFJcw1v64GHwuCLb3mM6RoGLnuSP8oMkIGjoe4RYE+f6Lld
	0VcXE0p4zYzSH32Rel/K+Ej+d40hDO1a43056yKkNaasNjYid0Cumb4Sg4fUBEZT
	9RXXo+3DWKozfQObvF2z2OYeXlZIw9MOmyylNVqF1OoHLAdmvbvSdRLXovQgPvql
	j5ouGAPHx81Jbkiq1CqfSbK44cT6u5TTA+BPURYCy/ptLTLDLlkIU4w1a1SXNtMb
	aQhs9uTywavoGFoEcUTjAUbltF4dHZE8tjBQDQHFiSj2OOskwn53cvOdi0pJw4jr
	6qSz72GAPc98g58BK7dEVA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y74t6d1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 21:29:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PJsLMD024310;
	Tue, 25 Feb 2025 21:29:38 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y519v4y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 21:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsr7oe5alH8ONgmWDxxasbIYsJcvRtZiyIO4pNBHKRTqjAiesfLGaeZ7TJJnTa/pABgS2jfPOuNNLtfsGPAgFmwv7FagTPnvkoDL5Rw9dd6O8a7PtvTISg2HfDhV+rt06F5kDaJQUkR5G6hsqhaVFjrcVFZYuMXPxrqkAenCJsRS/Af0ZE3fPgnx1lPn1A10Y+uk4lWX7zoWJW+sOS0miFlKQkH4lh/6mSCXpBHU5s90tLgixzjLxAhMoQ3XkAO+unOCSgKR+HxJRQ6xpQHrdaTEVAaViu4LxUQvApAS3ruSUI/Z3EDx7FmhT3v9hZXVEauhOToz6umooMYdre9Uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUNeds3ZxSBfC01rQxV33pNvN4ZkesUOCYMPmQMbG9E=;
 b=AhYuVOymDLKP9HDMIbhwnXCdYjQPTiBlWEZvKBbe6Ri8bSt+KbkSY7bvSJfjwvaUX1ETS+0zU83ucKIFV+S6aitvFJq9bd76FM6D42DiZ5a030hgf6gmrTXzK2vhcMu0zqXC71uQozaQLbOtwNuseXMYfjX6pmMJYVXApvt57GJFpMx62VAiiHib4OGU26CnRFW0F1esjS+zttvLjKChsjtpJ6s+HnTWonWo1sIzkNMmqowHDod2zUoeiysJIHcDu2iklKRNC+XBmMceDR5YiZjjRnMdcQwk205XItX/c1vY6ZQg9iA9acBWZSNbcU/cA3EpAyCAPtPAIhLvGbc9eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUNeds3ZxSBfC01rQxV33pNvN4ZkesUOCYMPmQMbG9E=;
 b=jA07VjC8JgD8Q2gclOr2f/JBGjIe+gJdIf3mNgz6AYdcBJ82w/VLu2HeVDQ/CqaU5usmBbkWLefQf6XHGpRQZzwImfI8rpHogcoJW8L0/kZsPKIvzADrKb53VyhMHn/sRgam1yIUdKXCm9MJqxbiynceSnLGJaoOdXtpzLvAiqA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5584.namprd10.prod.outlook.com (2603:10b6:a03:3d3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 21:29:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:29:36 +0000
Message-ID: <57b2af21-a264-382e-caf3-df2b5d0a96ce@oracle.com>
Date: Tue, 25 Feb 2025 16:29:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] test: fix bashism in tst.bitfield-offset.x
Content-Language: en-US
To: Sam James <sam@gentoo.org>, dtrace@lists.linux.dev
References: <cover.1737686990.git.sam@gentoo.org>
 <d9c8271d6b8c6a4ec5b821097d4afd1ff6bfbaa3.1737686990.git.sam@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <d9c8271d6b8c6a4ec5b821097d4afd1ff6bfbaa3.1737686990.git.sam@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0050.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: 146490a3-82b6-4721-1906-08dd55e3808f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dTVCRzdIWUhXKzRkYjZrbGZweVRqc3lMeXhtMWFiZGZZUkNZMEtmenVwNkIr?=
 =?utf-8?B?dVBzSHZwRGh1V2xVQ3E4bjJRZ2h3R3lzenk1YlFmRFJGZWcvYmpEK2hEaWFu?=
 =?utf-8?B?Z2E1ZHF2eStuTkZobU5YSWVuMkdZenF3U3NYRlo5MXM0UVJoaDF5MUhjd01l?=
 =?utf-8?B?TzNlUzAyeFEydVlOS21FcDN3Rm15NDNTczZnUXlTYlVXRlNkWmpaWHQxS2sz?=
 =?utf-8?B?UWgrTzYyLytUWGppMEU5OXBveWo4by9LaHprcjNLSUNDRG5JM21ibytBZkd2?=
 =?utf-8?B?dVE0UGpldVh2dWxvOXRPRVRCSDJBRStWby9hN0lZQ0Y3Q0NvdnNwUitKUnVV?=
 =?utf-8?B?aDJDc3ZRQXpMWDhLdEwwckZBaFR4S0F0NklQZ2dvUUR2RGpjRUNWUDJmQ2to?=
 =?utf-8?B?WjVFVFJhV2ZmdmdKR3BpYWUxL0JLUjU2ZXZkYy9La3BJK3BuZmNKd2VRZjcr?=
 =?utf-8?B?eHhiRWMxakg3TGtHOXdBWWdiUHE1SVlSYmQ5cC9aUXNuenptK3FCdGFQU1Ft?=
 =?utf-8?B?bE0rVGtXWXhaRkd6N1Yzd1A0Nit4RUJtUEp2SU9QY00rZGJJWGlQb291TmNP?=
 =?utf-8?B?bmg4eElicTBHSUhyRkkvb3FTMmJOZVd3NTY2NlFvM21pUUtUcloyUEV6UmxL?=
 =?utf-8?B?dkZMWTFZL3FOVDFsQTR3K3ZMZWRCSFVLTUZRQ2JCOTBpeW42UnVqMFAwOGpt?=
 =?utf-8?B?S04rY1E4WDNqYmRVbW1mdlV6MS91NHdwR2xPNllGUzFweTFnK3V1b3JlcmJi?=
 =?utf-8?B?RkVxbEVadFFMdGpYSjFtNmtuSldESU1LUEYzaEtBb0tuTVZRQzVpd2wwVUdr?=
 =?utf-8?B?TURHS3pVZ2hNekxtUUtrTTVXenJqNGJJQkVXcDhJcEhJQ0s1RGZNajVMd3cz?=
 =?utf-8?B?cFJ3NHp5ZTdSdjhsaWROS1VKNk9WSHAwcWE3Mk5TQTlTMU9XRklReXJETlRm?=
 =?utf-8?B?dWhSckZ1SGZGQjRWMVdkR0w2RUR5ZExyUzNKQ3JlcURXNzZ4M3lSL0dCVFM1?=
 =?utf-8?B?TTI2WEFWMjQzZTBEMnJRak52bmZwQldyc0lIcUx2bzF1VFJPeGZjSllsYkJu?=
 =?utf-8?B?TldQV3VKSXd2RFZFWHFIbW5xd29PL011K3VVczNRVUk1ZHdFZGVBb2lvemRQ?=
 =?utf-8?B?RjF0cThUUFJNVGV3cXlSN1VFNHQzeXB6ZEZxYmdraDQ4NUhCTlB3OHZpVkdm?=
 =?utf-8?B?L1U2cVEySm5KWVZGaHptS0NhWlA2U0toeWpYZUl6eHVKZWUrVUV1MHFHaW9l?=
 =?utf-8?B?L0llTmNaeWNIWDVuN3U1VXBTMU9hUzNsSVFSeHo4VnNvcDRiVHFtWGlScCt1?=
 =?utf-8?B?d2lBaFcrcithTm0vUVhKVG9rN1I3MUMzQ3BTWitGSVlIbmg1MkcvRk1IN0FM?=
 =?utf-8?B?WmJpcURhSkFmRzdLd3NxemdQTGpBeXV6RWVYWExQNDFPc1R6TmE2ZWYrUnJP?=
 =?utf-8?B?QWRkNkJmRWx3K1prTG1ITmt2NHhhRTRZTHpSaVlRdkc4cG5LcUF6dytTaTha?=
 =?utf-8?B?Y1FCeW5wckl1Z0crK0FRN2RRSWkvbUp2Rys4UGJFWDBvSHZrTE54bGtucDFa?=
 =?utf-8?B?Z3BUQ1BSMXlWL2lwMmp4Z0xKVG0yU05EdXMrOUNSdHloM3g5anFsZUcwMk83?=
 =?utf-8?B?bUtodjBPMXAzT040bWhiWVkvaUt1dnJvcjBTQjBNbngxTklybzVQYXAwTlhG?=
 =?utf-8?B?RWpVTUdNRDYrOHVpaEJ1U0tMdUhwaHR6aGVHY2RjeGZVcTJHalBIZTFFM2JY?=
 =?utf-8?B?VU9wK3pGRFp0azRQUkZYRTFNa3dCNis5dDU4eU03dFVHSGJzeGpkUE15MmpV?=
 =?utf-8?B?Rmd5dVY1aEo1bkI1b0cydz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmFHbnl4Wmhubk9lZWY1U09tUmhROUh6UHlPcCtBWTNEc012VURFVHZBT1RK?=
 =?utf-8?B?eFhnMWpaQVY1VlFrSVFVbEtQQWJIM29TRFZjNmM3NEJZOC9jaGFRTmhEVFc2?=
 =?utf-8?B?VG5hTVFySStIMXR0U2E3UTErQWFWczAzZ0dsMXMvdU5xWEZIVEdSZVFmZXpB?=
 =?utf-8?B?cjRjRVhQWms5cEExdUNBenQrcmVIc25KNCtmMzk5SFNqS1IyaThNVXpTL1JH?=
 =?utf-8?B?VVRwb2RMSmgwT2R2eVF5WDg0VS9qbW50QWtmOENsd25FRElMeThZY2NNR0E2?=
 =?utf-8?B?dUYvaTZwTzcwOEM3bW1ha1hqbEF6VEJhNTdCWXJYQ3dUYTNJOTlVVVBQd1Uw?=
 =?utf-8?B?ZHk2dENSZGU5UzVxK1pYQVRZNlZJbFFWc0E5QmJ6OE9mTkhXT1JoVDd6Q0Va?=
 =?utf-8?B?T1J2TThMNDBmMytmMmRPUkY2U1RFTkpOMGl0TEVsWmh2ZFRqOU9xdEdqNXJw?=
 =?utf-8?B?YkVLc0xrRHN6aElSQ0x6cHMyelB1cG5LQjI0UnNMOFFhR1lVcVpmOW1VUGsr?=
 =?utf-8?B?dzZjYlVzZkJ2bE5WOEM3US9YY0ZMQlNlYUVCc1Rjdkk0Z0VDcTNST21tNjFY?=
 =?utf-8?B?ckJsTERkbWFyd2lDNFdVQ052MDFGdlhuK0RlaWFCYW5IbDU4Ung0NlNGQ01o?=
 =?utf-8?B?QXhCQ0VlNDBRM3djZkMzcFd2Y0xmQk5QNlpscGVDd3FGUk1KM2VnVS9CMGxa?=
 =?utf-8?B?Yk5CNkt2MGdzVFNJM0VwdHVqbG1qZTRzbDB0Y1NlVjBTYnlhWUJZWXRVVzd6?=
 =?utf-8?B?UVJ1bCswUEFvbzdCS3l2bmdpQWlvS3EzMWVNSERVS3kxTjFhOFloWWJDUjA5?=
 =?utf-8?B?NllUV0w2b3N5b3huTEJUaDR4dklNM1B2UGVSUjBES2JZZ01VWXFnaDF6cWtT?=
 =?utf-8?B?VFEwZVYyeTFBT3JxdEZxUFl3L0RRVnFJbVlKZ0Y4Si9ocnRKaUQ1S0pOMXNt?=
 =?utf-8?B?dWFFMWVwdWVOcStNblRaTVV5amtLTjJzWVl6aytyTEwvc1FOM2JiWVU2MUpx?=
 =?utf-8?B?Y2hxazl5WkJ6MWllcjcxMHhvd21NV3JaWkN6MGM3RUtlZzZDUkpQbW9OVDhy?=
 =?utf-8?B?eUpxNWpVRDJqa0NpVWJLTGoxYkhyNEpjTUpBaGcyMHp3MEFBY2labzhTZXBy?=
 =?utf-8?B?aEs3bGRDdDBhOVNxZW83a2JocWR5VWZSUkJLVlByL3ExQjBKWHduaUtjTGZC?=
 =?utf-8?B?SFk5dm1EM2Yzbjdab0M4aURlVW9vay9xWmZqR1JLRG41LzZhQk5LbmQ1YUl3?=
 =?utf-8?B?YnBZZEtHZEtxYjdHblVxMFRIZmZ4K3UzTFh3M3BGMTRISy82NnRnVlNZYXUx?=
 =?utf-8?B?WHUyUW1TTGxkWU8vbG1udWhUSmx0QjJmZWdrK0Z0ZlpVT09pV3NHa1RXN1cx?=
 =?utf-8?B?eEErL01zN3ZUUEg1WE5ldi9ieFFKdjNlWS9PMHY5K2hQbTU4SEJ3a3M4SEJT?=
 =?utf-8?B?RDdCZm5oUDRsMG1zWmFNWkNnQThnYzk3VE14eG1pNDZZWDZ6MGhrbjNiQzZn?=
 =?utf-8?B?dmF0T1pnVWhRcWI1N2UxdHFOcThvczlReHNVV3ZHSGxpYWxTT0NZRzBYL2ox?=
 =?utf-8?B?Z3RxTmZCblN6ZVdnMTlFS0dmZkxTN2RBRVhOUC9HcW9ZQXR0S2p4Ny96Vk45?=
 =?utf-8?B?SFhWZTd6RXFzTmdIa0xieXlFUTdFdFNER25mQWdhV04rVUtiYkFKbU5tRmh6?=
 =?utf-8?B?aFQyK0FaMmk4NEF1QlRPSDljYnpKZWlyQ0dRMFM0VlpGVjNuYXNkRzFCY2pW?=
 =?utf-8?B?M3Z5NjlLWGxTcUszaVFLNGwrVytSUEtXem5wd2RkbFpQeXFwdmpYVFRhbXZF?=
 =?utf-8?B?VEdad1JsVDRUSUc5NVczTVRXS3hBZ1ZrYXNJVzlUcUp6U0Z2bUxFdzk0cS9z?=
 =?utf-8?B?UjQ2eko0djdxeGdINi9JNzMrcnJXN2x2bHNUbVUvd3IwTjVtbmVjbmFzbWI0?=
 =?utf-8?B?SWhpVjNEclViY2NvSE04YW5JQWkyYVNHNGxGeHdQUUwwZkN6TFVlTTArTm94?=
 =?utf-8?B?Rk0rajNvUno4MFdzU2VJVTNHemR1bHdic2RGRTY3MWc5dy9xTzMrQmFuVUMy?=
 =?utf-8?B?UjVIRUwrejVRcGJuUm5SSVc5TW9XeFJ3Uk04R0tWNUVjYWo0Ulk0b0dUVzQx?=
 =?utf-8?Q?jA5u9rEaWMlzh8gmMe32U+GA6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	epHs7N32Vf2NmMZGGzcTC+Jt6I9JU5U14TdCUzTNxK+uzz2k7Tg4gcJhMMxKYNw2Y4T+q8aSIpLWv3WpVIOvP5ABAQdUUo+xuSa344EFMrZ6xg30V+tbDx4GZt7EjsmvxUrk5trp+w8qPSD7+jJBfRouiOMsHatDlvgQLKmsQMNSdrfxjJdD4SwiARFlr6Q2VZqxuC0PUtPjZQ2G9SDklvZMXMtmGLDBJxNtsho5H//sb9Dt4GXRWnrgPznBKSJ844rIBrUqgXoVtp7AmyHXvY+DkhiK2co5gABXNhs2kBRHZJo6DadlFZ00rloXAfs01dZuaLXQKg5AdmIWI6UDD+fSOcig++E+KhMXZ0wKBa4hjnLeUKfrvUFpE4zTeO0qX/27Cyfr5yAZOkOiHiVyMEc84svkS1SzcgoF25tQegc/tic/gXvrxBYHMyczTwtqZ6h74eTOydFr2P8k20Yor+lGGBVEsKsPIvp5li6OhRYyXGV8IfeR9eAmQ3vOhBH+2aFnOKZ6cVEIatSq305p1j2kURDUMRGQj8D9NZndKtsXStFZb0UnBoJ+ksLlRkxqhNwNv9c4AA1Z3GsQ8hcNb2K888tK9Sqoyf4Ltw81uqE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146490a3-82b6-4721-1906-08dd55e3808f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:29:36.1070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pW8xKQZP/c4zuPcuFZX45sN70sCxG9GhydLWVpnmFDvPZGj2IUw8Q0fa95hG1Mf0NGCOEBAon7t9hSQ3elRSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5584
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502250128
X-Proofpoint-GUID: EyoLqhv2gLgpLDGdG1GCGWrih-rVxrpX
X-Proofpoint-ORIG-GUID: EyoLqhv2gLgpLDGdG1GCGWrih-rVxrpX

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 1/23/25 21:49, Sam James wrote:
> trap ERR is a bashism and won't work with e.g. dash, just change
> the shebang to #!/bin/bash in this case as ERR is a bit messy to handle
> (it'd be trivial here but there's no real reason to not use bash).
>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
>   test/unittest/bitfields/tst.bitfield-offset.x | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/test/unittest/bitfields/tst.bitfield-offset.x b/test/unittest/bitfields/tst.bitfield-offset.x
> index 4397461a..ae57c2b5 100755
> --- a/test/unittest/bitfields/tst.bitfield-offset.x
> +++ b/test/unittest/bitfields/tst.bitfield-offset.x
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>   # Licensed under the Universal Permissive License v 1.0 as shown at
>   # http://oss.oracle.com/licenses/upl.
>   #
