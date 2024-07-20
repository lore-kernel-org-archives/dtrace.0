Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5B02913
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721518019; cv=fail; b=EqLXqGay9N2LoIR207rL7croRxFYB1eGLmEv32xWYS/Z7HihpLjfAKG/sGOc7uMnaez9LW36Td3Ya1jxg/eyX9mCmZq8eKSft9Bqcd3YM6jX3FADtSyBYSVZbDFIefALPygaiAQBGf0xkQv3ISOex5PCHbCqH56VhEFYBwFOp1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721518019; c=relaxed/simple;
	bh=pOhQWAc8syDnfOl+l4HeKWC4ZKtncv2o6EIx+96+gLU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GM45iuJI0JSqT86Wyk/kQtc9ViJd8H7Iury3ADQ7/yeSCcA0G+vn/CW69Q7QJdvPVP5f3Ay/x+FViIdk/s9VQyozBkj0Wfo6PumoaT8D5mifEOPyT6+G4x9zATgw08EB/74XGJb+k/ROj79IByQi9ptVgfPTIT2+kHAv2CDVSKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=o1Wy0mLL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Jr9c67LI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="o1Wy0mLL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Jr9c67LI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46KNQqxG007441
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 23:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=47s3IeN/29akIeOxgbGGhxqHcnRUaRWkRFw98behzRY=; b=
	o1Wy0mLLDlbi9EJeduMmCn1xwXmIfj8Ccei0UA5XG7eHXG9NlDUqoiRgmMWaQKU1
	F4chkO73HtTd9HF/hQVKOfxtqOd/gpGbOJQ8eIzb8b48RA5+bG5tt2XsGGCyvAq8
	zZNyE8YGaziHhh21ZahuFJ7VJWZnWr9mqPr6WJyFamGE9fbGh2mWNbyVbaECE40c
	ieqrHpfIduLfJ8N5nsN/vpb5CXTytAKNTaVfszm11hnK2lfHX/hIb9Psj8G9SSo6
	SO2jT3irblMRKnrl+Bx7guSZMqAFs//LuZuetnRQ6gDteMZydAHDNAx/5ef0EmCg
	dk6EnYtSRA2l1ln87tq6wg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40gpw4r00g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 23:26:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46KI6jWa024776
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 23:26:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40g3p61k2h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 20 Jul 2024 23:26:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7VitnjCbHsHrL4QEGNBq05Bd1V3Kt7Jmv0H2ju4KOuYhHIoYOJSmIml+hZ0YgDdTOk8CSv3AD6DzYmo9SQcux3lGz8wnNc0hUnLgxoTPtc5s45MkgBwc8/DMeDh8gMoBKfx34bnwscu9jBsWe/1ly+aqfOC+r5w9mGlBcbDhqES1MA9vF40dc0sSdkLs5X+CKhswi+aNbR7PpGDgfctGXpk5e/smsGWGzvQ6FYH+GD1D5Ts2iRzszOUhsS0ghmyVs9/EsvfkloYHB8AJV3b9TlaK6//kKqYZbBKISPu0C/CzZriK8jjNTfBLAI29Sw5CCu4BkvIBghZD8GxbS5I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47s3IeN/29akIeOxgbGGhxqHcnRUaRWkRFw98behzRY=;
 b=qb15d2wIivAwrq0O14D4A4I0t47Ll8t4FA6kktMNL/6TE2f460k0TTV6X+y6Tge9IFoKr9DUdFASAdoNjDKDndLWAkryVMNZZsbp/Tg1cwei8MSI+1kyJdvWpo+bYbpC2K1nPAsAUcIusu5CNZNcwgDuI6xjQ3eNVZ+D92ZJZ7AuOJ/D8wYo7btkwxeT/NoztBC8cGCsISJmqK3X5CK3ykMTy8BAoTrCxhrSSGSkGHuzNafzT1y/53rz6Cq5mIz+2hmY0811ROKM8d927jrDzjTLuD+EAQfN4KHZEvnYJgfg2Xrzgh2DdDOkqXjyAXdbp/jEvvH5UMrH43j+tKS3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47s3IeN/29akIeOxgbGGhxqHcnRUaRWkRFw98behzRY=;
 b=Jr9c67LI0PeAZtHlJp29UTvmuVdJ791TgCHh0d4ipKS8l4rti7+nxFnBjrlsQkMOzKISQg+DqwIj3PN8QQ8UfPRDVx7xLPBf4DpPP6t2uMHNQFPOLn4m+8kwMN6lxE+HvEQ3j7yz5JZ4J5V8K7FsX86LtIZFYLDgOZUjtOdY19k=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB4851.namprd10.prod.outlook.com (2603:10b6:208:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Sat, 20 Jul
 2024 23:26:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Sat, 20 Jul 2024
 23:26:47 +0000
Message-ID: <939139b2-0ba8-98c2-9a0d-15452e76a03c@oracle.com>
Date: Sat, 20 Jul 2024 19:26:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 32/38] Widen the EPID to include the
 PRID
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240628020316.32544-1-eugene.loh@oracle.com>
 <20240628020316.32544-3-eugene.loh@oracle.com> <Zps165WN4pmcJ2cP@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zps165WN4pmcJ2cP@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:208:15e::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB4851:EE_
X-MS-Office365-Filtering-Correlation-Id: 25120baf-f605-4695-ddbd-08dca9136caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sys0QjM1LzNNOWVselc3OE9rS1FaOGVkekE4enAyaGpMSVVBeXM5QllIY0p0?=
 =?utf-8?B?RVpubnFwb2UvUXBYbHVHb1lYZEpWaTZvZ2kwaWdIOFhXdlBYc3A3Q0RFUGVG?=
 =?utf-8?B?d3Q2cjVoZnRoRkxnWmlNK2VQSzFvdHVaRGg1VWZlbUpVbjUvK0FGSk9Pb0Zu?=
 =?utf-8?B?aHkvdWw3VVIrMFphbTBTclVKY0hDeCt4QldBekcxdHpvTVVlaHYwTGV3cmdN?=
 =?utf-8?B?eTY0YUp6d3FhT1pVWHhCbzNLMVI5L2RyUW0vWExlV3ZuZjYzTFZCbWdKQWRw?=
 =?utf-8?B?ZHYrWHY4MHZld1ZJWk92MXJ1cFFYRUhiN05wU2xiRGxNbWp4SWhjK1hCMTdJ?=
 =?utf-8?B?VE10M0VGY0hkTzdwZExuMEZONE5RTzBGc0hBcENVdEpxcWliT0NabWh4TGFN?=
 =?utf-8?B?U2FleGFrWThwOC8vYXh4eW1iNUVud2tjazVRN2tFYVhFNEZTZTB5aUZSS2JR?=
 =?utf-8?B?YU45dGowQ2lEZkl2MjFZNFNKcGFoUUVVeVYxYmhaQVhEUllnb2JINWY0bDc3?=
 =?utf-8?B?Y3FXSndENDFYOVNlZVlYT21MQ3NXY1pWSnNkT1FQTjBlOVVIWXFuZ0pQUXZn?=
 =?utf-8?B?YTlBRGh3MHpQRzF4cHl6VGFZNGhtcEg4WmxoMDB3SVJncXp1bTBWQklrelhj?=
 =?utf-8?B?VGs4Nk9uZmI1QlR5VWZPTUluS0tmYWJCVlMraUR3Z2ROUkY5OHRVV0htVnFp?=
 =?utf-8?B?VUMwMmFiZ0YzZ0FabnJVY2VZc0VjOHlVL0MrKzR4WDlJNmQwQjFDOVBPcmMy?=
 =?utf-8?B?NUxjejdVaUtmUlBEOTBDcE1jOXlaclEzSDFNT01wTTNGdEYzRXZvbzQvd3dO?=
 =?utf-8?B?clhSb3JhODFGemdOb0FxTWgrbWJWNVR2Wlk0NXZ2QXg0N1E4VnRHSXByRE9X?=
 =?utf-8?B?VXFpeVY5aTZhSlR1RXJ6b3BVUXdIOFdrSUUvMElJc0c2b1gyL3F2K3hKQWt1?=
 =?utf-8?B?S2lYR0NCVXZ5Nk9TWXIrR3BsTi9RNVY5dkgzN0FaMHU4eU9iOWdERUYyR0hV?=
 =?utf-8?B?TUlzQW1PNzlqZ0RLdW1vSUZGbXBHN09PMDVrWjNkaUw5OU44dEZlS1JWa2RC?=
 =?utf-8?B?V3piSGRadzIrR2hLQVZRampyTE9FUmRsdytmMlN6eG9GM01pWGFmVGRDSmNi?=
 =?utf-8?B?ZDlPdk8zN0cwclBlaVpYN3ZGYmMySXhWdnRDTzc0OVlObzhtZENOYWRUbzNy?=
 =?utf-8?B?TWJTMkcvM3VNUmdXeXRsM0FaQ0V5WFF3Z1NjVUhadjcwcDAzYnJmVWdYdEdv?=
 =?utf-8?B?ZURub3pITUtRM0JxU241TENtREhQVW03UFc2RmFocmV3SFdVbmppYnRBd1Rw?=
 =?utf-8?B?YW9TQ1lVSjlKTEFPNDNTcFZIZTU5SXVmcEdNMXJ3NWtoSEhZeHJqNmZhajk4?=
 =?utf-8?B?VFRXaXhwT0plUXJaTDVmUElQby90N2hzS2pYajcxYzAvSjJaNUhoYVFjaWY0?=
 =?utf-8?B?TXgxYXVUSjdHNE5mZ0daS1JobCsvNjhkNTVGRHJlQ1RyM28zTGhvTnlZK2Q0?=
 =?utf-8?B?S0VhWmRJK3hycWFlNDZ2ZE9OQjIxREtPUHQrZFFtbGVjejBRNWE0SFBCRm5R?=
 =?utf-8?B?SXBrMUtVVDVVUlduY3pIbmdOYzFaVGY3SkNhbjhvVGdJYTdJK29pZUVBK0Vy?=
 =?utf-8?B?YmFWSm02ZlM4YTdod3FmcUNzRjAxQ210d08xOGV2cVgySkdpaEphdWEvSkp6?=
 =?utf-8?B?MkVmNFZLU1JZVmc5Rk5lZ3hHVkNtL3plNVNBeGF0Y0pKZm5lYmF6SnB3dWo0?=
 =?utf-8?B?TmVDZmF4THdXSkRST2xudENFb0d6Q0xhWnh0YzBQU2xtUm1XU1dqMFY5VGRy?=
 =?utf-8?Q?V0qKiS8c/fT+MXraN145wX2R7XkzZSFaGoVrE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkJraWJJMUxWWlNHamUzczlKdGRnRTJHeCtlUEh6SWN0SXgvMFlCL1hrUU85?=
 =?utf-8?B?ZC9uWkVraUxhcUxid1plTTlKZFJaSnRYS3QrYlBRcFVZQVFFMFRCNnA2VTJv?=
 =?utf-8?B?MjdNc3BKZ3E5aE1VUnFuK3BwMTM1cXIzZ1N4bldxcmRDOVRlamxOSmRhamlC?=
 =?utf-8?B?NlB6MVpQZVA0TEJicVF0ZklXajI1ZG1udys2QzlVQWtweVpyRkVCaVVzMDRM?=
 =?utf-8?B?Y0EremtDRURCQU5HdGVmc0p6NUtyRitMSEhxT1E4TGdHMGQyR1M0MXJIaExt?=
 =?utf-8?B?MTJKQjd5UVNKQmt1VmdjeWJuZTUxM1dQY0pwRjdSRTdJV3F4TCtDTEhiK1NI?=
 =?utf-8?B?anRIWHFlRTQrMmZoNXJwa05FY0Y1cnRvRlBQeUFGNDdWZkUvdVZRSlBkMUZQ?=
 =?utf-8?B?REdOVXZyT1BpWEVqYlRXWm1aSzl1ZytmT3BuVldMR0ZseFFpNWM3U09wY0NG?=
 =?utf-8?B?RE5NeTMxWHp6TmROdjQ1anNEakU5QWxsbFFKb2pCREJtcGQ5aGZ6NExjYXRF?=
 =?utf-8?B?QlFmZ2dYSEttZ2Q1bkFuVE01WTNqUTVUSWljZ3J2a1VFcmxKakdVeVAveE1k?=
 =?utf-8?B?T2kreFRwZEtyRzBxUldVcjRoSml3d3JNbUlmQ29IOG5IMHJzUUNHRFhXSi80?=
 =?utf-8?B?YS9jRjV4V0ZKc05DdzYrSmhWU2U1YmRxWTEwWldmZTBreGMzTi9BU0l5Q24r?=
 =?utf-8?B?Qk94NXFqYTlrSmtLSnptNGpjaWhscWdZRE05TytQTmJPamFqRDFaUzJ1ZWpC?=
 =?utf-8?B?SWt1U1BoU0FEcEdqUHQ0WmdneVJWd1pCZHlKZ2tLTTBqMW1vd3M0dnVNRDFy?=
 =?utf-8?B?VEp0ZHRKdW9iK3BndmlhckdQcDUwcjBjNEdJQWp0ZHYxSDVSM2YyNGtUZWFQ?=
 =?utf-8?B?WFlQYkhaZmJtcnU1YSsvTkh1ZkNlMWc0UWczSXlnSDJCTUswbDRWSkorZ0dq?=
 =?utf-8?B?bVc1QWVieWpoV2hxR3YvaFU0U0lkVEZaamxGTU5DS3pHRFE3NUtQYzBySzB1?=
 =?utf-8?B?YnRLR1R5Qys3L2JhZzFGend5MCtrMUpoM0lwK2xqeEFxd3FvRW1JYnBYM3RZ?=
 =?utf-8?B?blBUUmhQWXBhR1VtWGhib0pBREkzOHNlS0N4bmlkWWUxWk8xNWQxZlVRVTRY?=
 =?utf-8?B?TmpxZXR4YVpmVnBjQXVpZHZYR1RHdStFenVEVk1NSzloTG9ZVTJ6T1RoVWhm?=
 =?utf-8?B?RzNod3VGNitaTTh0Q0VoS3NaK1NwUG5HZ0NDTVpJcTJUZ0oxdU84TDZVZ3RN?=
 =?utf-8?B?QnRkUytMeXJVREdtYTFIS25MK2NzK0tYa0hoZmtEZDNRVUJ6d0o3SlFkOGRa?=
 =?utf-8?B?Tk1JLyt6Y29PL0ZtaXhURC9xZXJOR2ZZWHo3ZzZnb244NzZ5cTk0STVNVmFp?=
 =?utf-8?B?cnFxaGdEbmk0d25ZSzFIZGJabzBuaHRjSEJaekhWNlpTczJqS2dBdDIvRUZR?=
 =?utf-8?B?Sm14K3o0RFl4OWtOczhITlRzM0JpZE5aSzc4Y09UdCthZ1Zac094OW5YWFA5?=
 =?utf-8?B?MzdBekFxV2hLeVVHVXh3WU9rYmplQWZQTEgrM0FuQjhzVzRJWGhVRVFQQkRm?=
 =?utf-8?B?eDBVWEdEM3ZxMjJrRmFzUFpDbENsRmZ6dW9pUHFWWW96UzcvRWJQK3IyTGla?=
 =?utf-8?B?bm9peHBNVURRZm9BSU8ySkYzYU1mS0RQUmZvZXBTcWhkZUZmeEFBMkRLVDVH?=
 =?utf-8?B?RDV5b3NZTkgwWE5QbHRaNmtXZVRadEFoWXhIU3NuZTBoTTR1MExzSVdDQ2xJ?=
 =?utf-8?B?cG91SmcrNGE4bTlFRjUzSE5aYXZHcStFd21ncFV4MHgzZkxxOGVzS0RraGF2?=
 =?utf-8?B?U2tBRFJ3STJ6clc5TTRQaEdMSkRIcTJ0WU9zVlJyQjFEdEdaL0lNdWp0UWVr?=
 =?utf-8?B?TjkzalRWMnovYUp2YzZ2SXpINDJxUGpOS2x3eWZwNE1yRDJXYzRqS2d3cmhT?=
 =?utf-8?B?K0w4QlVlb2NWMUlwc1hPbFNUYlhYVXRNT2pUZnB6TC9NQ2ZaOXI1UTFTTDZC?=
 =?utf-8?B?K3MrUnk0blRYTThhRjRpK0IyVlB3cGcwcUhMUk5EaUdCMXp6RE1OaFRQS2Vn?=
 =?utf-8?B?M1pyK0gvb1FZZ2ExL21Fbm15akdCYk5IeFlYbGRkeWI1L3FvNFVSNC9CVG0y?=
 =?utf-8?Q?zmYCR4lKbxdns0I7dzIz5+qRB?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4EsDiJ5NfUEMI4wTiKLJxHv1f+smget8kc86LcaiCmScWnrOygaLeJ6W+MgNSmUnLeoNmLWk1WFUsrtJX97sM1xJ4K7UaoR82vVrniHGXikwpgf+Bj0c3GPveekxK+efAs8muzF+sPBUpfdzXnOYmAd5QgJ4QwPOzkKW8wptGy3HA7uZzQttKtKLbPjhpjpUy1IsUDyAGVKonWvyxxZapCAJFWndEZOVA+FvrhzPFiffV0647meH/RILvioXywJdDQDHJ+Gz008Y2nY0eFQxp1OlmwiDStLm6GsCGfUXFtqKA9k5D7hlB2U2RchdZWRMHig7MVV5nhtLytlcd9zIKvU6izu+78bMytx2alM5ZIRqLCiK6ahdK8zvFS9r0++EawroIeWTL9tssLRHMryb1yM248q2EnVpJ6GvCppoIqOAuYNtiK8LufS/E7v0aggRgsNGIUs1OIPe0cn459Uotdacc40txl118calMyhJHUdhoRMHBbUhJ8ZV5oh7aCcspO/n2CuipYh1Z0gd+JPwGin/1iMps3QkQgtmVnl3WK6XHvchMK0kFIBUxnZsU5Be3rWmy7tJVvWD9e9V+dt/6jFMmdZo6PQXPiY8wyE7ArE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25120baf-f605-4695-ddbd-08dca9136caa
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2024 23:26:47.4564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2RnFV8NcAqtklTnW4xuzQQ0gMSUUP1qJ5fgCKIdPNjGTFfF7AxsAoDxAWny/kh1X2IvdKATlssbWGtUWi/BQEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4851
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-20_21,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407200171
X-Proofpoint-ORIG-GUID: axLW90MZmDE6aPuKNJDqInc0N38oQe4_
X-Proofpoint-GUID: axLW90MZmDE6aPuKNJDqInc0N38oQe4_

On 7/19/24 23:58, Kris Van Hees wrote:

> On Thu, Jun 27, 2024 at 10:03:13PM -0400, eugene.loh--- via DTrace-devel wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Each output record has a EPID associated with it, allowing the consumer
>> to get both a data description and a PRID (so it can report PRID and
>> probe function and name).  We want to support uprobes that trigger for
>> multiple PRIDs, however, basically breaking this scheme.
> So, the EPID is (before this patch) an index into a list of ddescs and pdescs,
> effectively associating an id (EPID) with a { ddesc, pdesc } pair.  It is also
> a unique id for a clause as it is used for a particular pdesc.  When you have
> multiple probes that match a given pdesc for a given clause, the EPID still
> identifies the correct ddesc, but obviously the pdesc data won't be quite what
> you expect since that is PRID dependent.
>
> Which is indeed why we need extra information, as you outline below...
>   
>> So, expand the EPID to 64 bits, half for the old-style EPID (based on
>> static information about the D programs) and half for the PRID (discovered
>> at run time).
> Of course, this is only really needed for select providers (e.g. USDT) whereas
> for all other cases, the single EPID suffices on its own.  Therefore, I would
> expect that we do not place the PRID in the upper 32 buts of the EPID *unless*
> it is needed to override the "template" PRID that is associated with the basic
> EPID (lower 32 bits).  Doing things that way things will look more familiar
> anyway for users who expect to typically see EPIDs in low values, and it also
> keeps the code design where (in general) the EPID identifies the ddesc and the
> pdesc.
>
> It means we have some code that needs to deal with the exception case, but I
> don't see that as a problem becacuse most of the time it won't be used.
>
> In that sense, we could look at the USDT-type case as an exceptional case.  So,
> it would need special code in dt_get_bvar() to put the PRID in the top 32 bits
> of the EPID when it needs to return the value for epid.  Which means it needs
> to know when to do so.  That could perhaps be done using some flag in the
> mstate or something.  Similarly, the prologue of the clause could put the PRID
> in those top 32 bits when the clause is called for a case that needs it (which
> perhaps again could be indicated in the mstate)?
>
> In fact, if that works, then such a flag in the mstate can also be used to
> dynamically generate the provider name (probeprov bvar) rather than needing to
> add it to the strtab as a string.  That might solve some additional issues or
> complexities that are seen in other patches where the strtab is getting updated
> at runtime to add more strings.
>
> Why would a scheme like this not work?  I.e. why do we need to add the PRID in
> the top 32 bits of a 64-bit EPID for *all* cases when only USDT needs it?

I don't think we're forced into the choice presented by this patch. 
Other solutions are possible.  I just don't see the value is having two 
solutions, one for non-USDT/non-pid and one for USDT/pid.  (You say 
something will be more familiar to users, but... what exactly is more 
familiar?  Users know what EPID 23 is?)  (You talk about dynamically 
generating the provname bvar.  That's a cool/interesting idea, but it 
seems to me to be independent of what we're talking about here.)  Some 
things can be streamlined if we just settle on one way of capturing 
epid->prid info for the consumer.  Instead of two solutions -- both 
"prid in high epid bits" as well as "pdesc[epid]" mapping -- we can 
throw the pdesc away.

tl/dr.  We could maintain two mechanisms for doing this stuff.  I just 
don't see what the value is in maintaining two mechanisms for solving 
one problem.

>> The EPID seen by compile-time files like dt_cc.c or dt_map.c are still
>> the old-style EPIDs (even if now 64-bit) since they have no knowledge
>> of the run-time PRIDs.
>>
>> Further, we do not need to expand:
>> - the mstate (since it already had the PRID anyhow)
>> - the output buffer (since it already had an unused 4-byte pad)
>>
>> The combination of EPID and PRID is for the built-in variable epid as
>> well as what the consumer reads.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   bpf/get_bvar.c                                |  6 ++-
>>   bpf/probe_error.c                             |  2 +-
>>   include/dtrace/universal.h                    |  2 +-
>>   libdtrace/dt_bpf.c                            |  2 -
>>   libdtrace/dt_cg.c                             | 43 +++++++++++--------
>>   libdtrace/dt_consume.c                        | 28 ++++++++----
>>   libdtrace/dt_dctx.h                           | 12 ++++--
>>   libdtrace/dt_handle.c                         |  9 ++--
>>   libdtrace/dt_map.c                            |  3 ++
>>   libdtrace/dt_open.c                           |  2 +-
>>   test/demo/dtrace/error.r                      |  2 +-
>>   test/stress/buffering/tst.resize3-manual.r    |  2 +-
>>   test/stress/buffering/tst.resize3.r           |  2 +-
>>   test/unittest/actions/setopt/tst.badopt.r     | 14 +++---
>>   .../arrays/tst.declared-bounds.runtime_out.r  |  2 +-
>>   test/unittest/codegen/err.deref_0.r           |  2 +-
>>   test/unittest/codegen/err.deref_1.r           |  2 +-
>>   test/unittest/codegen/err.deref_i0.r          |  2 +-
>>   test/unittest/codegen/err.deref_i1.r          |  2 +-
>>   .../unittest/codegen/err.deref_string-assoc.r |  2 +-
>>   test/unittest/codegen/err.deref_string-gvar.r |  2 +-
>>   test/unittest/codegen/err.deref_string-lvar.r |  2 +-
>>   test/unittest/codegen/err.deref_string-tvar.r |  2 +-
>>   .../codegen/err.str_NULL_plus_offset-assoc.r  |  2 +-
>>   .../codegen/err.str_NULL_plus_offset-lvar.r   |  2 +-
>>   .../codegen/err.str_NULL_plus_offset-tvar.r   |  2 +-
>>   .../codegen/err.str_NULL_plus_offset.r        |  2 +-
>>   test/unittest/disasm/tst.vartab-bvar.r        |  2 +-
>>   .../tst.DTRACEFLT_BADADDR.null_ptr_field.r    |  2 +-
>>   test/unittest/error/tst.DTRACEFLT_BADADDR.r   |  4 +-
>>   .../error/tst.DTRACEFLT_DIVZERO.div.r         |  2 +-
>>   .../error/tst.DTRACEFLT_DIVZERO.mod.r         |  2 +-
>>   test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  4 +-
>>   .../error/tst.clause_scope-begin-ended.r      |  2 +-
>>   test/unittest/error/tst.clause_scope-begin.r  |  2 +-
>>   .../error/tst.clause_scope-regular.r.p        | 12 +++++-
>>   test/unittest/error/tst.error.r               |  2 +-
>>   test/unittest/error/tst.errorend.r            |  2 +-
>>   .../alloca/err.alloca-bcopy-before-beyond.r   |  2 +-
>>   .../alloca/err.alloca-bcopy-before-bottom.r   |  2 +-
>>   .../alloca/err.alloca-bcopy-beyond-top.r      |  2 +-
>>   .../alloca/err.alloca-bcopy-crossing-bottom.r |  2 +-
>>   .../alloca/err.alloca-bcopy-crossing-top.r    |  2 +-
>>   .../alloca/err.alloca-crossing-clauses.r      |  2 +-
>>   .../alloca/err.alloca-load-before-bottom.r    |  2 +-
>>   .../funcs/alloca/err.alloca-load-beyond-top.r |  2 +-
>>   .../alloca/err.alloca-load-crossing-bottom.r  |  2 +-
>>   .../alloca/err.alloca-null-deref-lvalue.r     |  2 +-
>>   .../funcs/alloca/err.alloca-null-deref.r      |  2 +-
>>   .../err.alloca-scratch-exceeding-bcopy.r      |  2 +-
>>   .../alloca/err.alloca-store-before-bottom.r   |  2 +-
>>   .../alloca/err.alloca-store-beyond-top.r      |  2 +-
>>   .../alloca/err.alloca-store-crossing-bottom.r |  2 +-
>>   test/unittest/funcs/bcopy/err.badbcopy1.r     |  2 +-
>>   test/unittest/funcs/bcopy/err.badbcopy4.r     |  2 +-
>>   test/unittest/funcs/bcopy/err.badbcopy5.r     |  2 +-
>>   test/unittest/funcs/bcopy/err.badbcopy6.r     |  2 +-
>>   test/unittest/funcs/bcopy/err.badbcopy7.r     |  2 +-
>>   test/unittest/funcs/bcopy/err.badbcopy8.r     |  2 +-
>>   test/unittest/funcs/copyin/err.badaddr.r      |  2 +-
>>   test/unittest/funcs/copyin/err.null_arg1.r    |  2 +-
>>   test/unittest/funcs/copyinstr/err.badaddr.r   |  2 +-
>>   test/unittest/funcs/copyinstr/err.null_arg1.r |  2 +-
>>   test/unittest/funcs/copyinto/err.badaddr.r    |  2 +-
>>   test/unittest/funcs/copyinto/err.badsize.r    |  2 +-
>>   test/unittest/funcs/copyinto/err.null_arg1.r  |  2 +-
>>   test/unittest/funcs/err.badalloca.r.p         | 12 +++++-
>>   test/unittest/funcs/err.link_ntopbadaddr.r    |  2 +-
>>   test/unittest/funcs/err.link_ntopbadarg.r     |  2 +-
>>   .../inet_ntoa6/err.inet_ntoa6.arg1_null.r     |  2 +-
>>   .../err.inet_ntoa6.arg1_null_const.r          |  2 +-
>>   test/unittest/funcs/strlen/tst.null.r         |  2 +-
>>   test/unittest/funcs/strtok/tst.strtok_null.r  |  2 +-
>>   .../funcs/strtok/tst.strtok_nulldel.r         |  2 +-
>>   .../funcs/strtok/tst.strtok_nullstr.r         |  2 +-
>>   .../funcs/strtok/tst.strtok_nullstr2.r        |  2 +-
>>   .../funcs/substr/err.substr_null_arg1.r       |  2 +-
>>   test/unittest/pointers/err.AllocaOverrun.r    |  2 +-
>>   test/unittest/pointers/err.BadAlign.r         |  2 +-
>>   test/unittest/pointers/err.InvalidAddress2.r  |  2 +-
>>   test/unittest/pointers/err.InvalidAddress4.r  |  2 +-
>>   .../speculation/err.CommitWithInvalid.r       |  2 +-
>>   .../speculation/err.DiscardWithInvalid.r      |  2 +-
>>   .../speculation/tst.SpecSizeVariations.r      | 22 ----------
>>   .../speculation/tst.SpecSizeVariations.sh     |  2 +-
>>   test/unittest/speculation/tst.negcommit.r     |  2 +-
>>   86 files changed, 169 insertions(+), 148 deletions(-)
>>
>> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
>> index a0c04f3a..5673c94b 100644
>> --- a/bpf/get_bvar.c
>> +++ b/bpf/get_bvar.c
>> @@ -48,8 +48,10 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
>>   			mst->tstamp = bpf_ktime_get_ns();
>>   
>>   		return mst->tstamp;
>> -	case DIF_VAR_EPID:
>> -		return mst->epid;
>> +	case DIF_VAR_EPID: {
>> +		uint64_t val = mst->prid;
>> +		return (val << 32) | mst->epid;
>> +	}
>>   	case DIF_VAR_ID:
>>   		return mst->prid;
>>   	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
>> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
>> index a6616c2f..c8b21d7c 100644
>> --- a/bpf/probe_error.c
>> +++ b/bpf/probe_error.c
>> @@ -31,7 +31,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>>   	int		oldprid = mst->prid;
>>   
>>   	mst->argv[0] = 0;
>> -	mst->argv[1] = mst->epid;
>> +	mst->argv[1] = (((uint64_t)mst->prid) << 32) | mst->epid;
>>   	mst->argv[2] = mst->clid;
>>   	mst->argv[3] = pc;
>>   	mst->argv[4] = fault;
>> diff --git a/include/dtrace/universal.h b/include/dtrace/universal.h
>> index d6562489..655ea772 100644
>> --- a/include/dtrace/universal.h
>> +++ b/include/dtrace/universal.h
>> @@ -37,7 +37,7 @@ typedef uint16_t	dtrace_actkind_t;	/* action kind */
>>   
>>   typedef uint32_t	dtrace_aggid_t;		/* aggregation identifier */
>>   typedef uint32_t	dtrace_cacheid_t;	/* predicate cache identifier */
>> -typedef uint32_t	dtrace_epid_t;		/* enabled probe identifier */
>> +typedef uint64_t	dtrace_epid_t;		/* enabled probe identifier */
>>   typedef uint32_t	dtrace_optid_t;		/* option identifier */
>>   typedef uint32_t	dtrace_specid_t;	/* speculation identifier */
>>   
>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>> index 71c6a446..428cb407 100644
>> --- a/libdtrace/dt_bpf.c
>> +++ b/libdtrace/dt_bpf.c
>> @@ -778,7 +778,6 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
>>    * The size of the memory region is the sum of:
>>    *	- size of the DTrace machine state, rounded up to the nearest
>>    *	  multiple of 8
>> - *	- 8 bytes padding for trace buffer alignment purposes
>>    *	- maximum trace buffer record size, rounded up to the nearest
>>    *	  multiple of 8
>>    *	- size of dctx->mem (see dt_dctx.h)
>> @@ -787,7 +786,6 @@ static int
>>   gmap_create_mem(dtrace_hdl_t *dtp)
>>   {
>>   	size_t	sz = roundup(sizeof(dt_mstate_t), 8) +
>> -		     8 +
>>   		     roundup(dtp->dt_maxreclen, 8) +
>>   		     DMEM_SIZE(dtp);
>>   
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 2fb2d0d8..d27a8cb2 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -275,15 +275,9 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
>>   	 *	buf = rc + roundup(sizeof(dt_mstate_t), 8);
>>   	 *				// add %r0, roundup(
>>   	 *						sizeof(dt_mstate_t), 8)
>> -	 *	*((uint64_t *)&buf[0]) = 0;
>> -	 *				// stdw [%r0 + 0], 0
>> -	 *	buf += 8;		// add %r0, 8
>> -	 *				//     (%r0 = pointer to buffer space)
>>   	 *	dctx.buf = buf;		// stdw [%r9 + DCTX_BUF], %r0
>>   	 */
>>   	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
>> -	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, 0, 0));
>> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 8));
>>   	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
>>   
>>   	/*
>> @@ -1094,8 +1088,6 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>>   	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
>>   	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
>>   	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
>> -	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
>> -	 *				// stw [%r9 + DBUF_EPID], EPID
>>   	 */
>>   	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
>>   	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_FAULT, 0));
>> @@ -1103,7 +1095,13 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>>   	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
>>   	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
>>   	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
>> -	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
>> +
>> +	/*
>> +	 *	Zero out the leading 4 bytes of the buffer.
>> +	 *	*((uint32_t *)&buf[DBUF_PAD]) = 0;
>> +	 *				// stw [%r9 + DBUF_PAD], 0
>> +	 */
>> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_PAD, 0));
>>   
>>   	/*
>>   	 *	Set the speculation ID field to zero to indicate no active
>> @@ -1113,6 +1111,18 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>>   	 */
>>   	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_SPECID, 0));
>>   
>> +	/*
>> +	 *	*((uint64_t *)&buf[DBUF_EPID]) = (dctx->mst->prid << 32) | EPID;
>> +	 *				// ld %r1, [%r0 + DMST_PRID]
>> +	 *				// lsh %r1, 32
>> +	 *				// or %r1, epid
>> +	 *				// stdw [%r9 + DBUF_EPID], %r1
>> +	 */
>> +	emit (dlp, BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
>> +	emit (dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_1, 32));
>> +	emite(dlp, BPF_ALU64_IMM(BPF_OR, BPF_REG_1, -1), epid);
>> +	emit (dlp, BPF_STORE(BPF_DW, BPF_REG_9, DBUF_EPID, BPF_REG_1));
>> +
>>   	/*
>>   	 * If there is a predicate:
>>   	 *
>> @@ -1131,10 +1141,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>>   	TRACE_REGSET("Prologue: End  ");
>>   
>>   	/*
>> -	 * Account for 32-bit EPID (at offset 0) and 32-bit speculation ID (at
>> -	 * offset 4).
>> +	 * Set the offset for the beginning of trace data.
>>   	 */
>> -	pcb->pcb_bufoff += 2 * sizeof(uint32_t);
>> +	pcb->pcb_bufoff = DBUF_DATA;
>>   }
>>   
>>   /*
>> @@ -1169,15 +1178,15 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>>   		/*
>>   		 *	rc = bpf_perf_event_output(dctx->ctx, &buffers,
>>   		 *				   BPF_F_CURRENT_CPU,
>> -		 *				   buf - 4, bufoff + 4);
>> +		 *				   buf + 4, bufoff - 4);
>>   		 *				// lddw %r1, [%fp + DT_STK_DCTX]
>>   		 *				// lddw %r1, [%r1 + DCTX_CTX]
>>   		 *				// lddw %r2, &buffers
>>   		 *				// lddw %r3, BPF_F_CURRENT_CPU
>>   		 *				// mov %r4, %r9
>> -		 *				// add %r4, -4
>> +		 *				// add %r4, 4
>>   		 *				// mov %r5, pcb->pcb_bufoff
>> -		 *				// add %r5, 4
>> +		 *				// add %r5, -4
>>   		 *				// call bpf_perf_event_output
>>   		 */
>>   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
>> @@ -1185,9 +1194,9 @@ dt_cg_epilogue(dt_pcb_t *pcb)
>>   		dt_cg_xsetx(dlp, buffers, DT_LBL_NONE, BPF_REG_2, buffers->di_id);
>>   		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_3, BPF_F_CURRENT_CPU);
>>   		emit(dlp, BPF_MOV_REG(BPF_REG_4, BPF_REG_9));
>> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, -4));
>> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, 4));
>>   		emit(dlp, BPF_MOV_IMM(BPF_REG_5, pcb->pcb_bufoff));
>> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, 4));
>> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, -4));
>>   		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_perf_event_output));
>>   
>>   		/*
>> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
>> index 7dfec72f..adbd2c7f 100644
>> --- a/libdtrace/dt_consume.c
>> +++ b/libdtrace/dt_consume.c
>> @@ -14,9 +14,11 @@
>>   #include <ctype.h>
>>   #include <alloca.h>
>>   #include <dt_impl.h>
>> +#include <dt_dctx.h>
>>   #include <dt_module.h>
>>   #include <dt_pcap.h>
>>   #include <dt_peb.h>
>> +#include <dt_probe.h>
>>   #include <dt_state.h>
>>   #include <dt_string.h>
>>   #include <libproc.h>
>> @@ -478,7 +480,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
>>   	 */
>>   	if (flow == DTRACEFLOW_ENTRY) {
>>   		if (last != DTRACE_EPIDNONE && id != last &&
>> -		    pd->id == dtp->dt_pdesc[last]->id)
>> +		    pd->id == dtp->dt_probes[last >> 32]->desc->id)
>>   			flow = DTRACEFLOW_NONE;
>>   	}
>>   
>> @@ -2202,19 +2204,23 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>>   		     int peekflags, dtrace_epid_t *last, int committing,
>>   		     void *arg)
>>   {
>> +	int			specid;
>>   	dtrace_epid_t		epid;
>> +	uint32_t		prid;
>>   	dtrace_datadesc_t	*epd;
>>   	dt_spec_buf_t		tmpl;
>>   	dt_spec_buf_t		*dtsb;
>> -	int			specid;
>>   	int			i;
>>   	int			rval;
>>   	dtrace_workstatus_t	ret;
>>   	int			commit_discard_seen, only_commit_discards;
>>   	int			data_recording = 1;
>>   
>> -	epid = ((uint32_t *)data)[0];
>> -	specid = ((uint32_t *)data)[1];
>> +	specid = *((uint32_t *)(data + DBUF_SPECID));
>> +	epid = *((uint64_t *)(data + DBUF_EPID));
>> +	prid = epid >> 32;
>> +	if (prid > dtp->dt_probe_id)
>> +		return dt_set_errno(dtp, EDT_BADEPID);
>>   
>>   	/*
>>   	 * Fill in the epid and address of the epid in the buffer.  We need to
>> @@ -2227,6 +2233,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>>   					 &pdat->dtpda_pdesc);
>>   	if (rval != 0)
>>   		return dt_set_errno(dtp, EDT_BADEPID);
>> +	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
>>   
>>   	epd = pdat->dtpda_ddesc;
>>   	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
>> @@ -2661,9 +2668,8 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
>>   		 * struct {
>>   		 *	struct perf_event_header	header;
>>   		 *	uint32_t			size;
>> -		 *	uint32_t			pad;
>> -		 *	uint32_t			epid;
>>   		 *	uint32_t			specid;
>> +		 *	dtrace_epid_t			epid;
>>   		 *	uint64_t			data[n];
>>   		 * }
>>   		 * and 'data' points to the 'size' member at this point.
>> @@ -2673,13 +2679,17 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
>>   			return dt_set_errno(dtp, EDT_DSIZE);
>>   
>>   		size = *(uint32_t *)data;
>> -		data += sizeof(size);
>>   		ptr += sizeof(size) + size;
>>   		if (ptr != buf + hdr->size)
>>   			return dt_set_errno(dtp, EDT_DSIZE);
>>   
>> -		data += sizeof(uint32_t);		/* skip padding */
>> -		size -= sizeof(uint32_t);
>> +		/*
>> +		 * The "size" measures from specid to the end.  But our buffer
>> +		 * offsets are relative to &size itself, to preserve 8-byte
>> +		 * alignment.  So, we leave data pointing at size, and we increase
>> +		 * size by 4 bytes.
>> +		 */
>> +		size += 4;
>>   
>>   		return dt_consume_one_probe(dtp, fp, data, size, pdat, efunc,
>>   					    rfunc, flow, quiet, peekflags,
>> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
>> index 1422ad24..6d38b0c2 100644
>> --- a/libdtrace/dt_dctx.h
>> +++ b/libdtrace/dt_dctx.h
>> @@ -82,16 +82,20 @@ typedef struct dt_dctx {
>>    * The dctx->buf pointer references a block of memory that contains:
>>    *
>>    *                       +----------------+
>> - *                  0 -> | EPID           |
>> + *                  0 -> | pad            |
>>    *                       +----------------+
>> - *		    4 -> | Speculation ID |
>> + *                  4 -> | Speculation ID |
>>    *                       +----------------+
>> - *                       | Trace Data     |
>> + *                  8 -> | EPID           |
>> + *                       +----------------+
>> + *                 16 -> | Trace Data     |
>>    *                       |      ...       |
>>    *                       +----------------+
>>    */
>> -#define DBUF_EPID	0
>> +#define DBUF_PAD	0
>>   #define DBUF_SPECID	4
>> +#define DBUF_EPID	8
>> +#define DBUF_DATA	16
>>   
>>   /*
>>    * The dctx->mem pointer references a block of memory that contains:
>> diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
>> index 4c9b9413..b1ba5f9f 100644
>> --- a/libdtrace/dt_handle.c
>> +++ b/libdtrace/dt_handle.c
>> @@ -14,6 +14,7 @@
>>   #include <alloca.h>
>>   
>>   #include <dt_impl.h>
>> +#include <dt_probe.h>
>>   #include <dt_program.h>
>>   
>>   static const char _dt_errprog[] =
>> @@ -147,11 +148,11 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
>>   	 * This is an error.  We have the following items here:  EPID,
>>   	 * faulting action, BPF pc, fault code and faulting address.
>>   	 */
>> -	epid = (uint32_t)DT_REC(uint64_t, 0);
>> +	epid = DT_REC(uint64_t, 0);
>>   
>>   	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
>>   		return dt_set_errno(dtp, EDT_BADERROR);
>> -
>> +	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
>>   	err.dteda_ddesc = errdd;
>>   	err.dteda_pdesc = errpd;
>>   	err.dteda_cpu = data->dtpda_cpu;
>> @@ -195,7 +196,7 @@ no_addr:
>>   		details[0] = 0;
>>   	}
>>   
>> -	snprintf(str, len, "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): "
>> +	snprintf(str, len, "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): "
>>   			   "%s%s in %s%s",
>>   		 epid, errpd->id, errpd->prv, errpd->mod, errpd->fun,
>>   		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
>> @@ -256,7 +257,7 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
>>   	str = alloca(len);
>>   
>>   	snprintf(str, len,
>> -		 "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): %s",
>> +		 "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): %s",
>>   		 data->dtpda_epid, errpd->id, errpd->prv, errpd->mod,
>>   		 errpd->fun, errpd->prb, faultstr);
>>   
>> diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
>> index c685274d..fe6194a7 100644
>> --- a/libdtrace/dt_map.c
>> +++ b/libdtrace/dt_map.c
>> @@ -137,6 +137,9 @@ int
>>   dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
>>   	       dtrace_probedesc_t **pdp)
>>   {
>> +	/* Remove the PRID portion of the EPID. */
>> +	epid &= 0xffffffff;
>> +
>>   	if (epid >= dtp->dt_maxprobe ||
>>   	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
>>   		return -1;
>> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
>> index 5c922488..0550379f 100644
>> --- a/libdtrace/dt_open.c
>> +++ b/libdtrace/dt_open.c
>> @@ -169,7 +169,7 @@ static const dt_ident_t _dtrace_globals[] = {
>>   { "discard", DT_IDENT_ACTFUNC, 0, DT_ACT_DISCARD, DT_ATTR_STABCMN, DT_VERS_1_0,
>>   	&dt_idops_func, "void(int)" },
>>   { "epid", DT_IDENT_SCALAR, 0, DIF_VAR_EPID, DT_ATTR_STABCMN, DT_VERS_1_0,
>> -	&dt_idops_type, "uint_t" },
>> +	&dt_idops_type, "uint64_t" },
>>   { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
>>   	&dt_idops_type, "int" },
>>   { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
>> diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
>> index d3904f47..2504e793 100644
>> --- a/test/demo/dtrace/error.r
>> +++ b/test/demo/dtrace/error.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/stress/buffering/tst.resize3-manual.r b/test/stress/buffering/tst.resize3-manual.r
>> index 43b647c7..25819f15 100644
>> --- a/test/stress/buffering/tst.resize3-manual.r
>> +++ b/test/stress/buffering/tst.resize3-manual.r
>> @@ -1,5 +1,5 @@
>>                      FUNCTION:NAME
>> -                          :BEGIN           3
>> +                          :BEGIN            4294967299
>>                             :BEGIN
>>   
>>   -- @@stderr --
>> diff --git a/test/stress/buffering/tst.resize3.r b/test/stress/buffering/tst.resize3.r
>> index 9c471158..5e6afe81 100644
>> --- a/test/stress/buffering/tst.resize3.r
>> +++ b/test/stress/buffering/tst.resize3.r
>> @@ -1,5 +1,5 @@
>>                      FUNCTION:NAME
>> -                          :BEGIN           3
>> +                          :BEGIN            4294967299
>>                             :BEGIN
>>   
>>   -- @@stderr --
>> diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
>> index 29e39fd4..b1c6d148 100644
>> --- a/test/unittest/actions/setopt/tst.badopt.r
>> +++ b/test/unittest/actions/setopt/tst.badopt.r
>> @@ -1,16 +1,16 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
>>   
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
>>   
>> diff --git a/test/unittest/arrays/tst.declared-bounds.runtime_out.r b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
>> index 4917528d..fa6e3b73 100644
>> --- a/test/unittest/arrays/tst.declared-bounds.runtime_out.r
>> +++ b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
>> @@ -1,3 +1,3 @@
>>   expected run-time error
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_0.r b/test/unittest/codegen/err.deref_0.r
>> index 07c1dc52..ef71d557 100644
>> --- a/test/unittest/codegen/err.deref_0.r
>> +++ b/test/unittest/codegen/err.deref_0.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_1.r b/test/unittest/codegen/err.deref_1.r
>> index a2ca8ac4..11bf0b20 100644
>> --- a/test/unittest/codegen/err.deref_1.r
>> +++ b/test/unittest/codegen/err.deref_1.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_i0.r b/test/unittest/codegen/err.deref_i0.r
>> index 07c1dc52..ef71d557 100644
>> --- a/test/unittest/codegen/err.deref_i0.r
>> +++ b/test/unittest/codegen/err.deref_i0.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_i1.r b/test/unittest/codegen/err.deref_i1.r
>> index a2ca8ac4..11bf0b20 100644
>> --- a/test/unittest/codegen/err.deref_i1.r
>> +++ b/test/unittest/codegen/err.deref_i1.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_string-assoc.r b/test/unittest/codegen/err.deref_string-assoc.r
>> index 08277992..b047a341 100644
>> --- a/test/unittest/codegen/err.deref_string-assoc.r
>> +++ b/test/unittest/codegen/err.deref_string-assoc.r
>> @@ -1,3 +1,3 @@
>>   66
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_string-gvar.r b/test/unittest/codegen/err.deref_string-gvar.r
>> index 08277992..b047a341 100644
>> --- a/test/unittest/codegen/err.deref_string-gvar.r
>> +++ b/test/unittest/codegen/err.deref_string-gvar.r
>> @@ -1,3 +1,3 @@
>>   66
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_string-lvar.r b/test/unittest/codegen/err.deref_string-lvar.r
>> index 08277992..b047a341 100644
>> --- a/test/unittest/codegen/err.deref_string-lvar.r
>> +++ b/test/unittest/codegen/err.deref_string-lvar.r
>> @@ -1,3 +1,3 @@
>>   66
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.deref_string-tvar.r b/test/unittest/codegen/err.deref_string-tvar.r
>> index 08277992..b047a341 100644
>> --- a/test/unittest/codegen/err.deref_string-tvar.r
>> +++ b/test/unittest/codegen/err.deref_string-tvar.r
>> @@ -1,3 +1,3 @@
>>   66
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
>> +++ b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
>> +++ b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
>> +++ b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/codegen/err.str_NULL_plus_offset.r b/test/unittest/codegen/err.str_NULL_plus_offset.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/codegen/err.str_NULL_plus_offset.r
>> +++ b/test/unittest/codegen/err.str_NULL_plus_offset.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
>> index 06d7c52b..53e5f618 100644
>> --- a/test/unittest/disasm/tst.vartab-bvar.r
>> +++ b/test/unittest/disasm/tst.vartab-bvar.r
>> @@ -4,7 +4,7 @@ curthread               scl glb r    D type (pointer) (size 8)
>>   timestamp               scl glb r    D type (integer) (size 8)
>>   vtimestamp              scl glb r    D type (integer) (size 8)
>>   ipl                     scl glb r    D type (integer) (size 4)
>> -epid                    scl glb r    D type (integer) (size 4)
>> +epid                    scl glb r    D type (integer) (size 8)
>>   id                      scl glb r    D type (integer) (size 4)
>>   arg0                    scl glb r    D type (integer) (size 8)
>>   arg1                    scl glb r    D type (integer) (size 8)
>> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
>> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
>> index b9f5f43c..5556955d 100644
>> --- a/test/unittest/error/tst.DTRACEFLT_BADADDR.r
>> +++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
>> @@ -1,6 +1,6 @@
>> -The arguments are 3 1 1 0
>> +The arguments are 4294967299 1 1 0
>>   The value of arg4 should be 1
>>   The value of arg5 should be 0
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
>> index e6d6afa2..80cd485b 100644
>> --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
>> +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
>> index e6d6afa2..80cd485b 100644
>> --- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
>> +++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>> index 1e4fdd64..31752a9e 100644
>> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
>> @@ -1,5 +1,5 @@
>> -The arguments are 3 1 PC 1 64
>> +The arguments are 4294967299 1 PC 1 64
>>   The value of arg4 = 0
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.clause_scope-begin-ended.r b/test/unittest/error/tst.clause_scope-begin-ended.r
>> index 8d57382e..7c88b227 100644
>> --- a/test/unittest/error/tst.clause_scope-begin-ended.r
>> +++ b/test/unittest/error/tst.clause_scope-begin-ended.r
>> @@ -2,4 +2,4 @@ Error fired
>>   Clause executed
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.clause_scope-begin.r b/test/unittest/error/tst.clause_scope-begin.r
>> index 8d57382e..7c88b227 100644
>> --- a/test/unittest/error/tst.clause_scope-begin.r
>> +++ b/test/unittest/error/tst.clause_scope-begin.r
>> @@ -2,4 +2,4 @@ Error fired
>>   Clause executed
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
>> index 7659601b..8117b8ab 100755
>> --- a/test/unittest/error/tst.clause_scope-regular.r.p
>> +++ b/test/unittest/error/tst.clause_scope-regular.r.p
>> @@ -1,3 +1,11 @@
>> -#!/bin/sed -f
>> +#!/usr/bin/awk -f
>> +
>>   # This report has a variable probe ID in it.
>> -s/ID [0-9][0-9]*: profile/ID nnn: profile/
>> +/^dtrace: error on enabled probe ID / {
>> +    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
>> +}
>> +
>> +{
>> +    sub("ID [0-9][0-9]*: profile", "ID nnn: profile");
>> +    print;
>> +}
>> diff --git a/test/unittest/error/tst.error.r b/test/unittest/error/tst.error.r
>> index 0d29bcc8..82c6da2d 100644
>> --- a/test/unittest/error/tst.error.r
>> +++ b/test/unittest/error/tst.error.r
>> @@ -1,4 +1,4 @@
>>   Error fired
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/error/tst.errorend.r b/test/unittest/error/tst.errorend.r
>> index 73abf697..17cbee17 100644
>> --- a/test/unittest/error/tst.errorend.r
>> +++ b/test/unittest/error/tst.errorend.r
>> @@ -2,4 +2,4 @@ Error fired
>>   End fired after exit
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
>> index 4257f567..9638fa5b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
>> index f5ff855d..35cf68b1 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref.r b/test/unittest/funcs/alloca/err.alloca-null-deref.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-null-deref.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-null-deref.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
>> index 4257f567..9638fa5b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
>> +++ b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/bcopy/err.badbcopy1.r b/test/unittest/funcs/bcopy/err.badbcopy1.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/bcopy/err.badbcopy1.r
>> +++ b/test/unittest/funcs/bcopy/err.badbcopy1.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/bcopy/err.badbcopy4.r b/test/unittest/funcs/bcopy/err.badbcopy4.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/bcopy/err.badbcopy4.r
>> +++ b/test/unittest/funcs/bcopy/err.badbcopy4.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/bcopy/err.badbcopy5.r b/test/unittest/funcs/bcopy/err.badbcopy5.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/bcopy/err.badbcopy5.r
>> +++ b/test/unittest/funcs/bcopy/err.badbcopy5.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/bcopy/err.badbcopy6.r b/test/unittest/funcs/bcopy/err.badbcopy6.r
>> index 4257f567..9638fa5b 100644
>> --- a/test/unittest/funcs/bcopy/err.badbcopy6.r
>> +++ b/test/unittest/funcs/bcopy/err.badbcopy6.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/bcopy/err.badbcopy7.r b/test/unittest/funcs/bcopy/err.badbcopy7.r
>> index 4257f567..9638fa5b 100644
>> --- a/test/unittest/funcs/bcopy/err.badbcopy7.r
>> +++ b/test/unittest/funcs/bcopy/err.badbcopy7.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/bcopy/err.badbcopy8.r b/test/unittest/funcs/bcopy/err.badbcopy8.r
>> index 4257f567..9638fa5b 100644
>> --- a/test/unittest/funcs/bcopy/err.badbcopy8.r
>> +++ b/test/unittest/funcs/bcopy/err.badbcopy8.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/copyin/err.badaddr.r b/test/unittest/funcs/copyin/err.badaddr.r
>> index ba4a4695..dadaa45b 100644
>> --- a/test/unittest/funcs/copyin/err.badaddr.r
>> +++ b/test/unittest/funcs/copyin/err.badaddr.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/copyin/err.badaddr.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/copyin/err.null_arg1.r b/test/unittest/funcs/copyin/err.null_arg1.r
>> index a806d107..c0739a4d 100644
>> --- a/test/unittest/funcs/copyin/err.null_arg1.r
>> +++ b/test/unittest/funcs/copyin/err.null_arg1.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/copyin/err.null_arg1.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/copyinstr/err.badaddr.r b/test/unittest/funcs/copyinstr/err.badaddr.r
>> index 0f566d6e..76861803 100644
>> --- a/test/unittest/funcs/copyinstr/err.badaddr.r
>> +++ b/test/unittest/funcs/copyinstr/err.badaddr.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/copyinstr/err.badaddr.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/copyinstr/err.null_arg1.r b/test/unittest/funcs/copyinstr/err.null_arg1.r
>> index cdd7c22c..074882e0 100644
>> --- a/test/unittest/funcs/copyinstr/err.null_arg1.r
>> +++ b/test/unittest/funcs/copyinstr/err.null_arg1.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/copyinstr/err.null_arg1.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/copyinto/err.badaddr.r b/test/unittest/funcs/copyinto/err.badaddr.r
>> index 11861e1f..9c2e65c2 100644
>> --- a/test/unittest/funcs/copyinto/err.badaddr.r
>> +++ b/test/unittest/funcs/copyinto/err.badaddr.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/copyinto/err.badaddr.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/copyinto/err.badsize.r b/test/unittest/funcs/copyinto/err.badsize.r
>> index ec4b062e..7e99c307 100644
>> --- a/test/unittest/funcs/copyinto/err.badsize.r
>> +++ b/test/unittest/funcs/copyinto/err.badsize.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/copyinto/err.badsize.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/copyinto/err.null_arg1.r b/test/unittest/funcs/copyinto/err.null_arg1.r
>> index f568ee5c..7c1fa9e0 100644
>> --- a/test/unittest/funcs/copyinto/err.null_arg1.r
>> +++ b/test/unittest/funcs/copyinto/err.null_arg1.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/copyinto/err.null_arg1.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/err.badalloca.r.p b/test/unittest/funcs/err.badalloca.r.p
>> index d7a88a39..15f99035 100755
>> --- a/test/unittest/funcs/err.badalloca.r.p
>> +++ b/test/unittest/funcs/err.badalloca.r.p
>> @@ -1,3 +1,11 @@
>> -#!/bin/sed -f
>> +#!/usr/bin/awk -f
>>   
>> -s/(ID [0-9]*/(ID NNN/g
>> +# This report has a variable probe ID in it.
>> +/^dtrace: error on enabled probe ID / {
>> +    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
>> +}
>> +
>> +{
>> +    sub("ID [0-9]*: profile", "ID NNN: profile");
>> +    print;
>> +}
>> diff --git a/test/unittest/funcs/err.link_ntopbadaddr.r b/test/unittest/funcs/err.link_ntopbadaddr.r
>> index b798b5e0..f0973529 100644
>> --- a/test/unittest/funcs/err.link_ntopbadaddr.r
>> +++ b/test/unittest/funcs/err.link_ntopbadaddr.r
>> @@ -1,3 +1,3 @@
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>>   
>> diff --git a/test/unittest/funcs/err.link_ntopbadarg.r b/test/unittest/funcs/err.link_ntopbadarg.r
>> index e386a67c..3c677e9f 100644
>> --- a/test/unittest/funcs/err.link_ntopbadarg.r
>> +++ b/test/unittest/funcs/err.link_ntopbadarg.r
>> @@ -1,3 +1,3 @@
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
>>   
>> diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
>> +++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
>> +++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/strlen/tst.null.r b/test/unittest/funcs/strlen/tst.null.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/strlen/tst.null.r
>> +++ b/test/unittest/funcs/strlen/tst.null.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_null.r b/test/unittest/funcs/strtok/tst.strtok_null.r
>> index 03226aa1..4c51c5e9 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_null.r
>> +++ b/test/unittest/funcs/strtok/tst.strtok_null.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_null.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_nulldel.r b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
>> index 70f8e4e2..2ab9938d 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_nulldel.r
>> +++ b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nulldel.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr.r b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
>> index a57b2469..be5ffe14 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_nullstr.r
>> +++ b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr.d' matched 2 probes
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
>> index d7df3aca..6c6fe35a 100644
>> --- a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
>> +++ b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
>> @@ -4,4 +4,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr2.d' matched 4 probes
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
>> diff --git a/test/unittest/funcs/substr/err.substr_null_arg1.r b/test/unittest/funcs/substr/err.substr_null_arg1.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/funcs/substr/err.substr_null_arg1.r
>> +++ b/test/unittest/funcs/substr/err.substr_null_arg1.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/pointers/err.AllocaOverrun.r b/test/unittest/pointers/err.AllocaOverrun.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/pointers/err.AllocaOverrun.r
>> +++ b/test/unittest/pointers/err.AllocaOverrun.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/pointers/err.BadAlign.r
>> +++ b/test/unittest/pointers/err.BadAlign.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/pointers/err.InvalidAddress2.r
>> +++ b/test/unittest/pointers/err.InvalidAddress2.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
>> index 187543b6..64a3861b 100644
>> --- a/test/unittest/pointers/err.InvalidAddress4.r
>> +++ b/test/unittest/pointers/err.InvalidAddress4.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967299 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
>> diff --git a/test/unittest/speculation/err.CommitWithInvalid.r b/test/unittest/speculation/err.CommitWithInvalid.r
>> index fc072417..e8a71c29 100644
>> --- a/test/unittest/speculation/err.CommitWithInvalid.r
>> +++ b/test/unittest/speculation/err.CommitWithInvalid.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
>> diff --git a/test/unittest/speculation/err.DiscardWithInvalid.r b/test/unittest/speculation/err.DiscardWithInvalid.r
>> index fc072417..e8a71c29 100644
>> --- a/test/unittest/speculation/err.DiscardWithInvalid.r
>> +++ b/test/unittest/speculation/err.DiscardWithInvalid.r
>> @@ -1,3 +1,3 @@
>>   
>>   -- @@stderr --
>> -dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967300 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
>> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
>> index 51f0596c..2748b307 100644
>> --- a/test/unittest/speculation/tst.SpecSizeVariations.r
>> +++ b/test/unittest/speculation/tst.SpecSizeVariations.r
>> @@ -11,26 +11,6 @@ Speculative buffer ID: 1
>>   123456706
>>   counts: 1 1
>>   
>> -Speculative buffer ID: 1
>> -123456700
>> -123456701
>> -123456702
>> -123456703
>> -123456704
>> -123456705
>> -123456706
>> -counts: 1 1
>> -
>> -Speculative buffer ID: 1
>> -123456700
>> -123456701
>> -123456702
>> -123456703
>> -123456704
>> -123456705
>> -123456706
>> -counts: 2 1
>> -
>>   Speculative buffer ID: 1
>>   123456700
>>   123456701
>> @@ -64,5 +44,3 @@ counts: 2 1
>>   dtrace: 2 speculative drops
>>   dtrace: 1 speculative drop
>>   dtrace: 1 speculative drop
>> -dtrace: 1 speculative drop
>> -dtrace: 1 speculative drop
>> diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
>> index 75e527d9..79995b59 100755
>> --- a/test/unittest/speculation/tst.SpecSizeVariations.sh
>> +++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
>> @@ -9,7 +9,7 @@
>>   
>>   dtrace=$1
>>   
>> -for x in 63 64 79 80 143 144; do
>> +for x in 71 72 159 160; do
>>   	$dtrace $dt_flags -xspecsize=$x -qn '
>>   	BEGIN
>>   	{
>> diff --git a/test/unittest/speculation/tst.negcommit.r b/test/unittest/speculation/tst.negcommit.r
>> index 69f246a0..29a3a538 100644
>> --- a/test/unittest/speculation/tst.negcommit.r
>> +++ b/test/unittest/speculation/tst.negcommit.r
>> @@ -3,4 +3,4 @@
>>   
>>   -- @@stderr --
>>   dtrace: script 'test/unittest/speculation/tst.negcommit.d' matched 2 probes
>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
>> +dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
>> -- 
>> 2.43.5
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
