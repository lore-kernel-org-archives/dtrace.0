Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BA6224D7
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724878676; cv=fail; b=bzgPMIc+TwjXkrQEwRgjD2IegRopkZNLYUmvCQSi8ncbrOj9kY4iBR5vSTjSsPmPbmEwuX9gavWFLC12ilt4lRgwJkMF6ynrh7Pk5vt4MLGOw5hwIqxfYDNHJU9ADjdXqtw9/4cksHhfypIPCzQ5jFjjhRgopVqqa+9omwxieGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724878676; c=relaxed/simple;
	bh=iq3gmuBP8Rt3l5gLAOXDWrfotBaeWFdhFw6iGqZWTf0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Kc/q2rDYa4uOSIfC76qVtgUKy2vUWlXEVb6swM5P3skcOqr9zmZP8qB4TkrDty3fxrr5+GW+GcNoWDaxmxBpkJN5C7Fo+itfpuEQWhFXHlSPXvP5SRE1xOPKuDVPENoUnsNpsLpqa+LuTJ6ms27vWmb315+r90huDlhtqDvrU7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R2tu3dpO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vpeyxbB7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R2tu3dpO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vpeyxbB7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SKiOPB018402
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=r6s/9U55zL+qMm4IqGYx8u3mg3ZaviifTFkQX78BMdw=; b=
	R2tu3dpO5+/wleRaYXRkf6gOk//eXDbbgT/NJuLrXIJJq1Pwp4uWf9GbIQlEbr9J
	rNZ/2/IbXWnNlixcyL0bb6Npctk4NscNiFWTEi7UX6RswCrZuvWrxFoFEz1MuXV4
	c/mUhwS3XfilXX96URyOTxllrr5StK0qqDdlBdOiUW35RcpNIoYxJgwWoJDREZ/0
	GQf66uqTwbDJR2B+rlS51FbjHWh8P3jBYMtiMdu5IfWx3OLctxa48IsayIW20gWA
	63bRLd2jdQKdm4qBK9bmCnNnOUS9D3FwyNhx8WH6/lj9JwrTPQ0OtRpCnElswBnY
	Aqjp2k88+VkWM3bF4Z6UGg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419puraaea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:57:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJx22M017382
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:57:52 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5u9522-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:57:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFL2js/mOrCanZ0FGAMn2FesfLtsV8iehPAZnM/mgGReNH2H9b5Jvo0BRhVEPsOnM6MB/5orUtfk2RUc8wOQLEmJ6ij8oVmhjIRhhfc7ZnE80gzOkuwyk3GF+LAdyZgq/fX2yLE0gJnd63z0CI3YdES2pOnxBaiCyiP2TeDLSJJril6x2ajr7ReQZLEzruFFYu0mW9642XPs8jfxl1U0HPmpbfnU8/G+i9/jYvvxB5xF6uCfeJZoMA48l5RcYe6lKOlZV+KIQ7ilSCueDQ6ZMvFFuFzJZEwq6mHgj9A4qY5nVJ2no9mJCr0xxtkQMK0TBLQAx9gnH8rx4lDwucQYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6s/9U55zL+qMm4IqGYx8u3mg3ZaviifTFkQX78BMdw=;
 b=TKaPyoUymPiPqMVg12gKA95/kv5RwaQK+a3sWQg425+n50CiWkZDvOLy8x5Fad431mQmDM18ZHYI4gGVk9ppRDBHpdzGHd94zICUCh2J4XNdK+xIu8ItRi0UosDKN5r4Ts/Y9N5w0Vrhaow/BBqLFa32RNAClURYSLzHowpIVjLjd9HcDZg1TNO+CdDPPy5QwDvxJ8X4837dTZtaJf2NySboEYflZOLaSMpYJYAxFJyM5BwkupccpyKsMCtae2UfIQKbP9w/n+eSFLAor8t8kj0Zynvefw1YurPFFc1I4u9d75ni2ou7ZRTmD/QYhQtmODXbXcoSdjYyOfkWCdSutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6s/9U55zL+qMm4IqGYx8u3mg3ZaviifTFkQX78BMdw=;
 b=vpeyxbB7N4w1TSREk6LyMcSNSe9dvw2M+4Y36AC7z+W9pvnMMpzf2322sEmda1wHfIq98VsnjAz8WyuxLBDSG+vPXabOMUBW2nJb8Km1fNLiCetnkXERKxcA6u/JdLYciPxkDM8S3JUfS5aeaT3caIkyC+igXO/+op06KBnkUnQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5805.namprd10.prod.outlook.com (2603:10b6:303:192::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.10; Wed, 28 Aug
 2024 20:57:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 20:57:49 +0000
Message-ID: <9a232070-92da-3d5c-8337-52286fe66c4c@oracle.com>
Date: Wed, 28 Aug 2024 16:57:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 31/38] Fix dt_pebs_init() call
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-12-eugene.loh@oracle.com> <ZsyRbgnYtFelMhM8@oracle.com>
 <9ddcccb0-6ab3-c1ec-5394-4793ac187273@oracle.com>
 <ZsyrTYUHihmORaU5@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZsyrTYUHihmORaU5@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: f9367154-ef37-4908-8010-08dcc7a41342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VllBeThXU1RRY0xpV1BGd1gvS09RdzFhUUxIakkzSXlZSmM2K2hFSE9ycm1K?=
 =?utf-8?B?Y1d5MVA4SFhUdnVRNUlhNFdxTC8zRGtjdXUyTGJJSzg4cDF6UFlJZVFDTUNK?=
 =?utf-8?B?OERjcFZEejJwQTJFQ2tIajBHZmo3NVI1bi8xNit1NEVZWk9MdWdZV2RKd0x6?=
 =?utf-8?B?Ti9mUnQyVlBPRkRMRU56ZVRVRXZwVk9mVERSVVRDZk1GVVU4T2c4VmZOa2w0?=
 =?utf-8?B?TWhFajR2Qkk2Y29BcXpmaDBMYzJ3SHFRSnFNWVM2NU5KYkFlMnNybnNPTHhG?=
 =?utf-8?B?OWIxVW50bmUxS1hpNFdZdUFrL1BCN2pvV2VFM1NQV0srK3EvZ2cxYzN2cS9G?=
 =?utf-8?B?dU5BTUZ5V21hZVdDNTEzZUN0cnpGcjdCWUUzMU1EQ25TMk5QbjllbDN1c2dt?=
 =?utf-8?B?S2s1SHNlNDJzSWY1UjVFYzlGTndxY1VmQXBxNDRtanRxNk9LOEhUTGViMVQ3?=
 =?utf-8?B?YkJCUzlRdlRkU3RQTlRxN281ckZqYkUxY2FJRnlLNU5PcEpVcFBJZDBiV3ZJ?=
 =?utf-8?B?bENIbWg4WDFTbHZXRWltZ1liNVNnWlhTZUVTRmlVZkNhM0hQOHlhK05XVGc2?=
 =?utf-8?B?Q3BoNk9NMnRHcC8vNVNLSS8xUmRhTnFOZ3pwQXFmU1AxQWl0TlhpdlhqdHlE?=
 =?utf-8?B?ZXJQV0xUemRPS2MrWHhuSHprR29pOUJlSDMrWktkRXByRHJFMXJzVTc4V1Nk?=
 =?utf-8?B?b3YveFdCS1ZwR2JNRy9SNm5oM21KTzRWNERnSXNacEZoL3N4SCt5S3pQUkFm?=
 =?utf-8?B?MDdGeFpsa0xkSU9rdVI4LzB3K1BsRWJRMzNaSStKKy9lc01yVE5SVmM0eCtx?=
 =?utf-8?B?TUNIRWtmZUpQRmpLb2FDMU91d0xwSWJwU296VXdIWkpjNHp2TGZKdG1wZ0hq?=
 =?utf-8?B?ZHFwRHJTYXNacUFPa0NEaWhyQ25nSndTaVVaTnExNE9JV2s4bE8wSG9lWExs?=
 =?utf-8?B?cVNZb1BFMjlLLy9Ea1hyR09ETk15VmREMG5GMFhYK3o1a3JRUGFjaE5mVlhU?=
 =?utf-8?B?K1ZoMVFxVHl2Um5MK1AySkhZQzBVazFjcjFXK1NhWXRRNklMV053RWNVbkFh?=
 =?utf-8?B?K3Q1NWx3Sms1bGJPRFpsdEZZc0ZvN2FvSmV4THN5RjZPK1ZUbVREOEx3RVNZ?=
 =?utf-8?B?dWc4RDhlTEQ4VEY3MW1kRmo4VmJ3OHhxYjZEZDNTK001a3FFdEJLczBaNFJx?=
 =?utf-8?B?Q29GRFV3U2xTODlkU2hPbjNyWFpma0F5NHlhSkZ0SFdzQ29hbjBOZURFUDhF?=
 =?utf-8?B?dm1hMU9Ua1oxc2sweVpzSmE4Y1N4d1docVdZalQ2YldQdFZlQW5RZDNYVm14?=
 =?utf-8?B?VVBVY2JpM3c1SHpwRkJkVmswODlWampmcGREdSsvUW1HZGxrU3NNOTVLT0dp?=
 =?utf-8?B?amY3bDJoY2EwcGpxMDhwazlZNDZQOFM0N0o0Q08rc3JGM3RoTVFxMjh2WVVR?=
 =?utf-8?B?ZU1IWmYxY1BBUGgxbk9ZY2ZtWC9qaU1kby9jM3AxYzBSYWowK1cvc2lxTTM0?=
 =?utf-8?B?dytkQWJ5MHk5T080blkzZnJLVURWYVlzQ0dPTGFTZEw2SERCRVJIdUg2M1Z4?=
 =?utf-8?B?MVJVS0g3M29EZlI2THRZZTBlb2lBYi84Z1dBUUtQcUVLMmtxaG0zK2ptcm1D?=
 =?utf-8?B?ZTlIUStXeEh3VWUxSHdVam5UMVRvQzNVQWdXemUxcDdzeXlRcFIrbzhmRklD?=
 =?utf-8?B?YlZmeWMrWmt4ME8vaXpwRm9vL2taZ2hVclNvb0RGS0ZxNXlRVjB2L25PbHd2?=
 =?utf-8?Q?zOd6yLx/Rlbgmu4BdA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnBpcDZtUzhDaXlIOWZaNlVYSk1neDAra3VIT3JsQ1VCZmtTOW83UHU1UkhL?=
 =?utf-8?B?WUxjL0dROU42QXJ5NU9MS2lPR2ZRb1kxd05DbkozeUNLZlY2b3lFcVhNb2FJ?=
 =?utf-8?B?ZmZuWGlERUM4QjB6dll1a3JQRjVxMUpCUTlOR3IvMVk5RE5Eb3pkVnVPdm1l?=
 =?utf-8?B?cE01bGd2eDZicktFV0ltWkZZeU9sQkM1V09hKzJIejZMUUM1dEpuL3E3eDlV?=
 =?utf-8?B?TDFobS9XV2FDdW56Y3ByN3dBZUhNQWR0Vk1GRmNDUVpweHVhVkRDa3NSR1Yw?=
 =?utf-8?B?VU4rZ3A5UjFLSFVjL0I2MU40OHltc2E0UHdRdjBFcmlJdkxjV3hsWXB2R1Nz?=
 =?utf-8?B?RWpOQVZQODVmcjBRMWt1WUFzazRJaUtLZkg0VjNmNUlja0JIbXFNU21NbEN4?=
 =?utf-8?B?OE96b3ljM28xazJVUEhIa1pJaG16VjVjZ0tveW8yUW8rTDc1blIwdXR6NFcy?=
 =?utf-8?B?WGpOUU1ndWtnb2RoSWNMdTQ4STRIdnhuT0dNM2JLM3FidmZTT3RFMmRPRWZH?=
 =?utf-8?B?eCszeUEwakNhaVl0REJ1U3haYlhsYlJ0NGhhLzdMUHgwV0x3ZU4rVjNvQTZk?=
 =?utf-8?B?WlZOcEs1cnozSXVCWVdjb3RVZTJUTFVCcldRZFFqNnpYM3pTOVVWN1lxQkdt?=
 =?utf-8?B?cjFIMHdCQ0Ntamg1R1hESEJKOXFMSkdLYkJib3UveFdRRGJGVTJuTE1CVEFH?=
 =?utf-8?B?cmY2UzVYNWdmbkhwaUtRL20vZU9Oa0Vnb0dQS1ZUT095RG92dEQyZzVlZ1ZF?=
 =?utf-8?B?em8ycW1TdEdrK0JqTzFGK01EYUFIdWtXMi82SUdDcnVGRkI2NmczMjJXRXlG?=
 =?utf-8?B?TXNIWFoyMGF1ajBrRVk1YU1UWXJrSlJ6U0dYTm9pZXhaQzc0SEdyTUJ0clAz?=
 =?utf-8?B?TkdoWmRDUGcwb0NCTG5PczhnL28wSE85VSthbXlJTkhKVG5ubWxaTDc3eEdC?=
 =?utf-8?B?cTg3dlMwbURlMURHTi93blNBbzNIUWhVK0lJR2pSR09QdVNDSzlwVDErZjFE?=
 =?utf-8?B?c2srODBVd0pTZG12UlRPQ1hmL3NFaGFpeDZRN3dSbzFkNmZERmJEVC90dVdP?=
 =?utf-8?B?UnJUOFRJM0hkQi9XVVlMQ0xYVWI2MjVjZUZKNk5NZVY2djlxQmk4OVRjaWds?=
 =?utf-8?B?WDRDL2pHUUFNcSt3RzIrN0MvQldwbEQzNVJtM2pIdkREVDh0VWhmcDNOakVX?=
 =?utf-8?B?U3RKMnNkL1crTmloM3BucWR0TEdDTW0wRmZDK2FiQnhpUk9nNVV0THkvYzVO?=
 =?utf-8?B?VkJvSUpiOGpBMFZLQWdiQkl1ZVI3WmFka3ZVMWNIckNtY2N1eEh5T0ptbFJW?=
 =?utf-8?B?VGZ3L081dWRrSnhUK21WQVA4ejFJamtqaXNlWUtJMmJXUlljNFVpUHRqSG10?=
 =?utf-8?B?L25zWC9NdU1hOGVURWE2U01MNG5VeHRFN1g4eHA1aFBTSkVEVCt5MVpNY1VX?=
 =?utf-8?B?cFJraWNQWkZPQjhiQWVlZ1RTdjlUNkhxWHJZd3JiU3dqTFBQUXBSbHI1cmJo?=
 =?utf-8?B?Rm5UdWRoWk9kdmkzNkx5SGdTTW43SGgvR3Y4Tm1Ud3JBOGRsTFBkL0RhaUtI?=
 =?utf-8?B?cVc0N2pZaU1idUZCcXhQNU9ocWc5ZjZzWHp0dzU0UENLa2l1bHdzNkg4YTRL?=
 =?utf-8?B?YUlrYkpEcHBaR3djTWpZdWl4NFhjaDRpbEdkTzIvZUVBYlptaUpjRHcvVFdk?=
 =?utf-8?B?L1NVdDRFR203ZVNhdkl5WnJtNlJ5R1BtS1JHcTRTTDY2NzhKS2x2TXVBY2hO?=
 =?utf-8?B?TDIxcWZSWnMwVitNSVM4WHZyYmU1UktvekZFWkRTQU92bE1Fc0ZFTGF3eDZ1?=
 =?utf-8?B?VVUrbEhZUlllNVRrSCtnMG44bksxTUpxVXc4SWFIM1dxSFBqSkVwUGpia3Yx?=
 =?utf-8?B?emRzbnV2OE5vR2xwY3J6WWFpdDIyUzFjTmpuS0RkVTFFL3VyZ0I0TitrMlND?=
 =?utf-8?B?dmVIby93Uk5Yc3N0c1l2UjVkL1A2SCtDK3Bna05SOFZwKzRBU282VmJrM2FC?=
 =?utf-8?B?VmVvY1dRcXd0bmdIMEVHOVA3R1hMblJ1emFEcFZ3S01CZGpCOStaZ3REd1N6?=
 =?utf-8?B?QU5hZDJqbCt6SnZLUFIyQ25wdzFpazd4K3BEeDV4V2swbkE4QjlhL1gxK0Jp?=
 =?utf-8?Q?iBKvrvvsQewyydIX92jTXJ1+d?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	emubbCWQFtmyY2/cIFLgBgJvVrVX9mYVRrYKWLEo12hPFzr+RjzYmIRQflkeACBOOVrhXKwG0/CLgZwOrWSNntbyzd22xrEXGo5oNgn56F3HsmcR48dhFDRtA6qAB0+/q5FiuEQRdWQGA3kcCEufUIrhwQoAWvMcLKHNquKrncCm5Umwd9FEWrh/xW0bi6N5WG2M1RdOSLKTStDCHJKGBGQM9XTjwp0+fauXrgopr4A/QOzRLiqaVetXpp5QV83Q+O4aK1gIQSz27Rws3j367SFs0fuzDCOtdNzynPIoTwLff/uuOYSukOxAG7PWQH/eFXZed26d3ndt3CMXbPbdkyxBC5d+kjIdDVbkf6RliVlLY5Fj65g1epXuo+V5mZjvtwLNSk5g3uy1a6yUOtb0k0O73n52nzxNubXWuwbatbno26QyixYO1/1YTaU0AL2pxrk4sb+uoFtWOtnaty7jx5UESMvStPoNcT+uI0Kp2ypS6xKSRvmcwJB2X7PSaHZaGzjKBC7HipnxaeMdFxE4vmJknYu3ibOH9YgsSBQJWSn9nqHX9atK0H5YAx7B7k02OruE2oUiQloBf9YhXFqDFNGi1akh8XBwphZWwGxHRtY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9367154-ef37-4908-8010-08dcc7a41342
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:57:49.3942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXABTwsElboOCrdGxZS+IfDqZVproO2zVf/SiU4xifHzPgLLiog2xxEZ7Qk5STp6DLwmSKfqqccMxm7Sv156gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5805
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280151
X-Proofpoint-ORIG-GUID: rKqmPhVMuBqz8N2iANHQx4BYByAb03vb
X-Proofpoint-GUID: rKqmPhVMuBqz8N2iANHQx4BYByAb03vb

On 8/26/24 12:20, Kris Van Hees wrote:

> On Mon, Aug 26, 2024 at 11:42:25AM -0400, Eugene Loh wrote:
>> On 8/26/24 10:30, Kris Van Hees wrote:
>>
>>> This patch goes against the intent of the code, as far as I can see.  The
>>> point of performing the size check prior to increasing the buffer size was
>>> to enforce the limit on the size that was explicit set by the user.  Then,
>>> if that size was sufficient, then DTrace is at liberty to increase that
>>> size to a whole multiple of the page size.
>>>
>>> But if I were to insist that a buffer can only be 24 bytes, and 24 bytes are
>>> not enough to store a single trace record, DTrace should report an error
>>> rather than increasing my bufsize setting on its own.
>>
>> The point is that DTrace *does* increase my bufsize setting on its own.  Why
>> should DTrace complain about my setting when it's going to ignore my setting
>> anyhow?  What value does the pre-existing behavior offer to DTrace users?
>> Are you saying that DTrace should not resize?  That it should honor the
>> user's bufsize?  No more resizing (to page size or whatever it wants)?
> The main point of this code was to retain the bevhaviour that DTrace provided,

As far as adhering to legacy behavior... quite simply, we do not. We do 
not set the "principal buffer size" to bufsize.  Further, any legacy 
resizing behavior is, if I understand correctly, to go smaller than the 
user requested;  we do the opposite.  Looking to the legacy behavior for 
precedent is pointless.  The situation is that we are unlike legacy 
behavior in fundamental respects, opposite in another respect (automatic 
resizing), but consistent in some impractical and useless respect.  That 
consistency strikes me as small consolation.

There is no documentation to change;  the documentation is already 
wrong.  This patch was intended as a step to making the behavior 
something that was describable.  Clearly, trying to hold on to a legacy 
buffering model has produced a byzantine situation in the current port, 
which treats buffering very differently.

Perhaps we simply disagree on those points, and this patch is DOA. But 
the patch points out other problems as well.  E.g., the min computation 
wasn't even right and error checking was wrong.

> which is that if a user explicitly requests a bufsize that is less than the
> minimum required for the given trace programs, an error is reported.  That is
> a mater of being consistent (even if it has no practical application that I
> can see).  Tests from the existing version failed because this was not being
> done right.
>
> As far as functionality, as long as the bufsize is large enough to hold the
> largest trace record, DTrace can (and needs to) ensure that the buffer size
> is a whole multiple of the page size because that is required by the perf
> ring buffer imlementation.
>
> So, DTrace only increases the buffer size to the required multiple of page size
> if the user supplied bufsize is at least large enough to hold the largest trace
> record (or if no bufsize was explicitly specified).
>
> We could opt to change the behaviour of the bufsize opton to always round up to
> a whole multiple of page size, but that is a deviation from the original
> implementation and thus is something that would need to be documented, etc...
>
> Aside from the computation of the minimum required size needing updating when
> patches (e.g. the USDT changes) modify the layout and size of the trace records,
> I do not think that the existing code is wrong.
>
> I am certainly open to a feature change to make bufsize always be rounded up as
> needed, but that is not a bug fix and I think that ought to be its own patch
> (along with documentation changes etc).  And it might need some more discussion
> because it brings up the question why we wouldn't just simply always increase
> bufsize to be the smallest multiple of the page size to accomodate the largest
> trace record.
>
>>> On Thu, Jun 27, 2024 at 01:38:57AM -0400, eugene.loh@oracle.com wrote:
>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>
>>>> The function had a few issues, mainly with its comments,
>>>> ranging from typos to incorrect descriptions of behavior.
>>>>
>>>> The function has only one caller.  The enforcement of a
>>>> size minimum was problematic in a number of respects:
>>>> - it was missing 4 bytes
>>>> - it was enforcing the minimum before the size was
>>>>       increased by the caller
>>>> - it was checking dt_pebs_init()==-1,
>>>>       missing errors with other negative return values
>>>>
>>>> So change the function to accept a minimum and change its
>>>> return values.
>>>>
>>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>>>> ---
>>>>    libdtrace/dt_peb.c                          | 27 ++++++++++-----------
>>>>    libdtrace/dt_peb.h                          |  2 +-
>>>>    libdtrace/dt_work.c                         | 15 +++++++-----
>>>>    test/unittest/options/err.b-too-low.d       | 22 +++++++++--------
>>>>    test/unittest/options/err.bufsize-too-low.d | 22 +++++++++--------
>>>>    test/unittest/options/tst.b.d               | 22 +++++++++--------
>>>>    test/unittest/options/tst.bufsize.d         | 22 +++++++++--------
>>>>    7 files changed, 71 insertions(+), 61 deletions(-)
>>>>
>>>> diff --git a/libdtrace/dt_peb.c b/libdtrace/dt_peb.c
>>>> index 5268f089..4983ba91 100644
>>>> --- a/libdtrace/dt_peb.c
>>>> +++ b/libdtrace/dt_peb.c
>>>> @@ -136,18 +136,14 @@ dt_pebs_exit(dtrace_hdl_t *dtp)
>>>>    }
>>>>    /*
>>>> - * Initialize the perf event buffers (one per online CPU).  Each buffer will
>>>> - * the given number of pages (i.e. the total size of each buffer will be
>>>> - * num_pages * getpagesize()).  The  allocated memory for each buffer is mmap'd
>>>> - * so the kernel can write to it, and its representative file descriptor is
>>>> - * recorded in the 'buffers' BPF map so that BPF code knows where to write
>>>> - * trace data for a specific CPU.
>>>> + * Initialize the perf event buffers, one per online CPU.  Each buffer will
>>>> + * have num_pages * getpagesize()).  The dt_peb_open() call mmaps the allocated
>>>> + * memory so the kernel can write to it.  The file descriptor is recorded in
>>>> + * the 'buffers' BPF map and added to the event polling file descriptor.
>>>>     *
>>>> - * An event polling file descriptor is created as well, and it is configured to
>>>> - * monitor all perf event buffers at once.  This file descriptor is returned
>>>> - * upon success..  Failure is indicated with a -1 return value.
>>>> + * The return value indicates success (0) or failure (-1).
>>>>     */
>>>> -int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>>> +int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize, size_t bufsizemin)
>>>>    {
>>>>    	int		i;
>>>>    	int		mapfd;
>>>> @@ -166,12 +162,15 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>>>    		fprintf(stderr, "bufsize increased to %lu\n",
>>>>    			num_pages * getpagesize());
>>>> +	if (num_pages * getpagesize() < bufsizemin)
>>>> +		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
>>>> +
>>>>    	/*
>>>>    	 * Determine the fd for the 'buffers' BPF map.
>>>>    	 */
>>>>    	idp = dt_dlib_get_map(dtp, "buffers");
>>>>    	if (idp == NULL || idp->di_id == DT_IDENT_UNDEF)
>>>> -		return -ENOENT;
>>>> +		return dt_set_errno(dtp, EDT_NOMEM);    // FIXME we used to do something more akin to ENOENT
>>>>    	mapfd = idp->di_id;
>>>> @@ -180,7 +179,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>>>    	 */
>>>>    	dtp->dt_pebset = dt_zalloc(dtp, sizeof(dt_pebset_t));
>>>>    	if (dtp->dt_pebset == NULL)
>>>> -		return -ENOMEM;
>>>> +		return dt_set_errno(dtp, EDT_NOMEM);
>>>>    	/*
>>>>    	 * Allocate the per-CPU perf event buffers.
>>>> @@ -189,7 +188,7 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>>>    			 sizeof(struct dt_peb));
>>>>    	if (pebs == NULL) {
>>>>    		dt_free(dtp, dtp->dt_pebset);
>>>> -		return -ENOMEM;
>>>> +		return dt_set_errno(dtp, EDT_NOMEM);
>>>>    	}
>>>>    	dtp->dt_pebset->pebs = pebs;
>>>> @@ -241,5 +240,5 @@ int dt_pebs_init(dtrace_hdl_t *dtp, size_t bufsize)
>>>>    fail:
>>>>    	dt_pebs_exit(dtp);
>>>> -	return -1;
>>>> +	return dt_set_errno(dtp, EDT_NOMEM);  // FIXME need something better
>>>>    }
>>>> diff --git a/libdtrace/dt_peb.h b/libdtrace/dt_peb.h
>>>> index e0f408f2..9ad23252 100644
>>>> --- a/libdtrace/dt_peb.h
>>>> +++ b/libdtrace/dt_peb.h
>>>> @@ -43,7 +43,7 @@ typedef struct dt_pebset {
>>>>    } dt_pebset_t;
>>>>    extern void dt_pebs_exit(dtrace_hdl_t *);
>>>> -extern int dt_pebs_init(dtrace_hdl_t *, size_t);
>>>> +extern int dt_pebs_init(dtrace_hdl_t *, size_t, size_t);
>>>>    #ifdef	__cplusplus
>>>>    }
>>>> diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
>>>> index 69a86358..7a0eb1da 100644
>>>> --- a/libdtrace/dt_work.c
>>>> +++ b/libdtrace/dt_work.c
>>>> @@ -267,18 +267,21 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
>>>>    		return dt_set_errno(dtp, errno);
>>>>    	/*
>>>> -	 * We need enough space for the pref_event_header, a 32-bit size, a
>>>> +	 * We need enough space for the perf_event_header, a 32-bit size, a
>>>>    	 * 4-byte gap, and the largest trace data record we may be writing to
>>>>    	 * the buffer.  In other words, the buffer needs to be large enough to
>>>>    	 * hold at least one perf-encapsulated trace data record.
>>>> +	 *
>>>> +	 * While dt_pebs_init() rounds the requested size up, size==0 is a
>>>> +	 * special case.
>>>>    	 */
>>>>    	dtrace_getopt(dtp, "bufsize", &size);
>>>> -	if (size == 0 ||
>>>> -	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
>>>> -		   dtp->dt_maxreclen)
>>>> +	if (size == 0)
>>>>    		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
>>>> -	if (dt_pebs_init(dtp, size) == -1)
>>>> -		return dt_set_errno(dtp, EDT_NOMEM);
>>>> +	if (dt_pebs_init(dtp, size,
>>>> +			 sizeof(struct perf_event_header) + sizeof(uint32_t)
>>>> +			 + 4 + dtp->dt_maxreclen) == -1)
>>>> +		return -1;
>>>>    	/*
>>>>    	 * We must initialize the aggregation consumer handling before we
>>>> diff --git a/test/unittest/options/err.b-too-low.d b/test/unittest/options/err.b-too-low.d
>>>> index bb77e37c..f62155dd 100644
>>>> --- a/test/unittest/options/err.b-too-low.d
>>>> +++ b/test/unittest/options/err.b-too-low.d
>>>> @@ -1,6 +1,6 @@
>>>>    /*
>>>>     * Oracle Linux DTrace.
>>>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>>>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>>>     * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>     * http://oss.oracle.com/licenses/upl.
>>>>     */
>>>> @@ -12,19 +12,21 @@
>>>>     */
>>>>    /*
>>>> - * We use a buffer size of 59 because that should be just too small to hold the
>>>> - * trace records generated in this script:
>>>> - *	- perf_event_header (40 bytes)
>>>> - *	- size (4 bytes)
>>>> - *	- gap (4 bytes)
>>>> - *	- EPID (4 bytes)
>>>> - *	- tag (4 bytes)
>>>> - *	- exit value (4 bytes)
>>>> + * We need over 4k bytes for the 4 string trace records generated in this script
>>>> + * plus some meta data.
>>>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>>>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>>>     */
>>>> -/* @@runtest-opts: -b59 */
>>>> +/* @@runtest-opts: -b4096 */
>>>> +
>>>> +#pragma D option strsize=1024
>>>>    BEGIN
>>>>    {
>>>> +	trace("abc");
>>>> +	trace("def");
>>>> +	trace("ghi");
>>>> +	trace("jkl");
>>>>    	exit(0);
>>>>    }
>>>> diff --git a/test/unittest/options/err.bufsize-too-low.d b/test/unittest/options/err.bufsize-too-low.d
>>>> index bbbdb5c5..25efdf72 100644
>>>> --- a/test/unittest/options/err.bufsize-too-low.d
>>>> +++ b/test/unittest/options/err.bufsize-too-low.d
>>>> @@ -1,6 +1,6 @@
>>>>    /*
>>>>     * Oracle Linux DTrace.
>>>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>>>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>>>     * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>     * http://oss.oracle.com/licenses/upl.
>>>>     */
>>>> @@ -12,19 +12,21 @@
>>>>     */
>>>>    /*
>>>> - * We use a buffer size of 59 because that should be just too small to hold the
>>>> - * trace records generated in this script:
>>>> - *	- perf_event_header (40 bytes)
>>>> - *	- size (4 bytes)
>>>> - *	- gap (4 bytes)
>>>> - *	- EPID (4 bytes)
>>>> - *	- tag (4 bytes)
>>>> - *	- exit value (4 bytes)
>>>> + * We need over 4k bytes for the 4 string trace records generated in this script
>>>> + * plus some meta data.
>>>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>>>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>>>     */
>>>> -/* @@runtest-opts: -xbufsize=59 */
>>>> +/* @@runtest-opts: -xbufsize=4096 */
>>>> +
>>>> +#pragma D option strsize=1024
>>>>    BEGIN
>>>>    {
>>>> +	trace("abc");
>>>> +	trace("def");
>>>> +	trace("ghi");
>>>> +	trace("jkl");
>>>>    	exit(0);
>>>>    }
>>>> diff --git a/test/unittest/options/tst.b.d b/test/unittest/options/tst.b.d
>>>> index 57fa030d..3bf08edc 100644
>>>> --- a/test/unittest/options/tst.b.d
>>>> +++ b/test/unittest/options/tst.b.d
>>>> @@ -1,6 +1,6 @@
>>>>    /*
>>>>     * Oracle Linux DTrace.
>>>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>>>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>>>     * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>     * http://oss.oracle.com/licenses/upl.
>>>>     */
>>>> @@ -12,19 +12,21 @@
>>>>     */
>>>>    /*
>>>> - * We use a buffer size of 60 because that should be the exact size necessary
>>>> - * to hold the trace records generated in this script:
>>>> - *	- perf_event_header (40 bytes)
>>>> - *	- size (4 bytes)
>>>> - *	- gap (4 bytes)
>>>> - *	- EPID (4 bytes)
>>>> - *	- tag (4 bytes)
>>>> - *	- exit value (4 bytes)
>>>> + * We need over 4k bytes for the 4 string trace records generated in this script
>>>> + * plus some meta data.
>>>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>>>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>>>     */
>>>> -/* @@runtest-opts: -b60 */
>>>> +/* @@runtest-opts: -b4097 */
>>>> +
>>>> +#pragma D option strsize=1024
>>>>    BEGIN
>>>>    {
>>>> +	trace("abc");
>>>> +	trace("def");
>>>> +	trace("ghi");
>>>> +	trace("jkl");
>>>>    	exit(0);
>>>>    }
>>>> diff --git a/test/unittest/options/tst.bufsize.d b/test/unittest/options/tst.bufsize.d
>>>> index 96b0f1b8..23af81aa 100644
>>>> --- a/test/unittest/options/tst.bufsize.d
>>>> +++ b/test/unittest/options/tst.bufsize.d
>>>> @@ -1,6 +1,6 @@
>>>>    /*
>>>>     * Oracle Linux DTrace.
>>>> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
>>>> + * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
>>>>     * Licensed under the Universal Permissive License v 1.0 as shown at
>>>>     * http://oss.oracle.com/licenses/upl.
>>>>     */
>>>> @@ -12,19 +12,21 @@
>>>>     */
>>>>    /*
>>>> - * We use a buffer size of 60 because that should be the exact size necessary
>>>> - * to hold the trace records generated in this script:
>>>> - *	- perf_event_header (40 bytes)
>>>> - *	- size (4 bytes)
>>>> - *	- gap (4 bytes)
>>>> - *	- EPID (4 bytes)
>>>> - *	- tag (4 bytes)
>>>> - *	- exit value (4 bytes)
>>>> + * We need over 4k bytes for the 4 string trace records generated in this script
>>>> + * plus some meta data.
>>>> + * A bufsize of 1 to 4096 bytes is rounded up to 4096 and is insufficient.
>>>> + * A bufsize of 4097 to 8192 bytes is rounded up to 8192 and is sufficient.
>>>>     */
>>>> -/* @@runtest-opts: -xbufsize=60 */
>>>> +/* @@runtest-opts: -xbufsize=4097 */
>>>> +
>>>> +#pragma D option strsize=1024
>>>>    BEGIN
>>>>    {
>>>> +	trace("abc");
>>>> +	trace("def");
>>>> +	trace("ghi");
>>>> +	trace("jkl");
>>>>    	exit(0);
>>>>    }
>>>> -- 
>>>> 2.18.4
>>>>
