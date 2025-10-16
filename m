Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798C22E5B27
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760655083; cv=fail; b=foOE4S2ZMqWuBjp+/fgErdQ3DvzvgnK63c1Kugxw+QXgIGRZzIaGXk4wxtaZaM6zyn+lPhfusSaHY7DkoWwH2P8zy3O5ZcEJBA9k/Hr4HBat8ahU741CTramIO5/W3y6rjcTzugMgowyYtQle58iQ5G36fjYHzr8N4oFVx3WKz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760655083; c=relaxed/simple;
	bh=z4FaJfn2HKirNaTms9N4hp2mLmuuoEvIp4Ija5B2jzE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cfo1ywBx6XlmZJ+3JQrvttYgxJRBfVL1qlWaiXPxS5VcSVwkE9MmHb9COMpJJJUYEb9rxVMOXSdGRm7Ewo4eS6d32EUZQ2IVJyngrZVKV+MbQ0YmNu1MsAxix6OzPqXcdiWTJOekwd1HNcKC+Tm0p7xIqE6krZOrf9cj4j9XFyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b9NkziWd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mW5Cnt3M; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b9NkziWd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mW5Cnt3M"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLuLHk020005
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mX9iplZquE6hmxVM67DPw33qqnZMQ9q0xsQaZNuuClo=; b=
	b9NkziWd9q+M7w15E8bECIaaOifAhmJKriaGil96FQ5B4CcrxRfzuu4ONlemJPDK
	SZcMTaMw64wwHxrgR8slOe967pcciXjGfquW1hGL/fzzsXZfM5tnEmy36ck+ryMy
	IYZ+IEP2hld1CAqXB9Iytb8YLcQ9vOW/5Cr82LYkFBUU1g7Ouzdr636GPIgN4VkS
	NjbVWe5XpGneTtNFY2pDVHt2xifRyfxZk5K5lcYtEGoYVtEHxKplLyG+XZRYrWRf
	pIDNjFnUDlJ/fuoM9lvv93j9tRm9NeW9T1SX5qaBhKM/uXCLu62dEVZKRHFO5ETM
	7DIwlXoIISSt7exg18BJ4g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qeut1ue6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:51:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLYIim017959
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:51:19 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013032.outbound.protection.outlook.com [40.93.201.32])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpc33w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 22:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weiAWaR1cw3X52Z6E3KJ1fRwi4R7N0yhDvO2VA/MD2m6mXSLvjVCdQ94kv7JK9lfWoTk4fmrq0daYnhLPugxYxNkQTFSfI6PWQO445e8rxua78qp3+RCaBQT0B0JJYtzldlwOz4eKvsxAGOLA+7ghRPIzC/mQk7qFyj4wwIj0pe2p2uAVplo64whvSFgy07yToWvf9w5iGVWNVC+eemTdIvl62aCfJFR3krClHpmIBHXYQZP0BUoQnDYN/QSUknbGaLmvszfwPQmcPV/X8Ug3XHmpAHtLkslm1xfYneOHmQnGHn7gd6E0TDllivrOip95kuQi52FW740SyPIWeIslw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX9iplZquE6hmxVM67DPw33qqnZMQ9q0xsQaZNuuClo=;
 b=yl7NTWAGup3H2CNspEMkmOrGBrSAgdUR11+Gfq6tOpeYLl9e9G8I9vUZ10rIctxoW8sbDpOL4sBGugidKTJQmEqp0uR38G2+tB1RMpQo9FvmGTvwrFTiZJY9anebMUzca0y7jMoToesxi1kQ4LkCwlV0q5/Bq2my5vj8S9y8YtMZTx228sChI4YpLUzPWJuXShmgHlJBg7s2eRyo69XHKm9NalEZqwD+6Onudwoz7L28fblEuDFaxlNxKf6HoRTeuwUNqejqddgymkxkyn4i+k9Twoe1HXlabv8sIYp2XUMKHhpPat3TNRNAv2AGAl75GBCfyXIRCyp4Nc6MKaEwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX9iplZquE6hmxVM67DPw33qqnZMQ9q0xsQaZNuuClo=;
 b=mW5Cnt3MX8iL9wM+IauYe0m4e8y2PIK/NrBx+3Zo7LgyEspeJ3O4rQs9vZ6zg3DEnPSj0OdhuAbqxY+Ex7AkVaHyT4BDe3rxL9p7nAqG6DRvPP1CJqKCnhiKeoLk1LJvukkzX+6NQTV+TakJP/V4iPNjv5aen3AG2CB+GuNHqPI=
Received: from IA3PR10MB8513.namprd10.prod.outlook.com (2603:10b6:208:576::12)
 by DS4PPF751CD7230.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 22:51:16 +0000
Received: from IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823]) by IA3PR10MB8513.namprd10.prod.outlook.com
 ([fe80::dd32:577c:40ed:9823%5]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 22:51:16 +0000
Message-ID: <150a690f-7ef5-4695-8508-0661a0aade21@oracle.com>
Date: Thu, 16 Oct 2025 15:51:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Update llms-txt and add README
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev
References: <20251016205330.4055747-1-bruce.mcculloch@oracle.com>
 <BY5PR10MB39879FA7FD793F7F152D2677C2E9A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Language: en-US
From: Bruce McCulloch <bruce.mcculloch@oracle.com>
In-Reply-To: <BY5PR10MB39879FA7FD793F7F152D2677C2E9A@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P222CA0024.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::14) To IA3PR10MB8513.namprd10.prod.outlook.com
 (2603:10b6:208:576::12)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR10MB8513:EE_|DS4PPF751CD7230:EE_
X-MS-Office365-Filtering-Correlation-Id: ab50fb93-bfbf-46e2-a9aa-08de0d0683a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU1JckxFU1Y0RUg0MlB2SDFTaXVlSC95Rks5aWVSMHNpOUZZbDcwRDBLZUNK?=
 =?utf-8?B?VmxWTHB6TGRXemlOOWhpSFU3aWdYeTFicWNvVlRlTDMrMEo4a3BFN09VUkJW?=
 =?utf-8?B?b3JVWm93dkRJcEdzSGRuM1c2L24ybjFYdndVQVBzREs1ZzI2ZFhzWFJoSFA2?=
 =?utf-8?B?aUFnRWFuL25uWHFmaFRNOXNZK29obHRRaTFNUk5iYmR6SXdPdU5CRVpZV2Vt?=
 =?utf-8?B?SVZLMW4yT1FkV2JXdS9jaUViNXZSOFhwbUFTVVJpM2RtWUpmaElBZS92bUNE?=
 =?utf-8?B?dkxUc2IwSTNWaU14Q3M2czA1WXBSOTNneEorc29vL2tjMGNnM0xUYVJGSDdi?=
 =?utf-8?B?NW5yOEN3RmVTK0VPc0luR1NDN014RjN1bXNibjlEMXZ4aHNwenNVWE93bm5T?=
 =?utf-8?B?dzZqYXA1OHNMcDZVSWs3WmliZ0dJWTBMTGFsOHZ2Yi8wUUhRVitmUEg3S1U3?=
 =?utf-8?B?Zk5KNG5QZkNUOGVFZ0pTemNxWWp2UVZpbEJrMDVsWWdsV05sOFBva3dvYTFM?=
 =?utf-8?B?ejh3bW9scEFTMHM1RnR4K2MzMHdwVTl3RENCc09zbEExM3dzWkZlMkRIaGlU?=
 =?utf-8?B?aHMxRkljR1kyOEp4MlNHbEFsOTFWdHNvV012clZ1WWZpbytESVV3QUdTbThR?=
 =?utf-8?B?ZG5ER1kwQUdCTWFsMFNFNXR2ZWh0L280M1lGVlF3czd4c281RWVtcWduMnJz?=
 =?utf-8?B?QUpNVDFTb1dKNU1RelIzV01kSzhUWFVUYjhzU01vWmw2bEpHM2ZKR3FpNERx?=
 =?utf-8?B?RnhlUFFEUU80S1dVZVVXT2JUV0wvSnhQSUtqSWZvclZ6NmRLcUlHdVJnVWxo?=
 =?utf-8?B?ZVZpdnZ3TGVNSXJjMDhVYTN3KzhNUmNMamJyS1J5ZCtjVDdCaW13M28wL2Mz?=
 =?utf-8?B?Q09qMmpxeG1wNWVTWlJDdDNUcWxvMVdmN1hVMkoxUTlxTlJBSGYxcmJ5dksz?=
 =?utf-8?B?ZjdOaU04WklZdloyRzhKcFVtbFdzTnY2OUplb3QyYUh2MFhUc1hBMXVNQUpT?=
 =?utf-8?B?eVhVMUhTUE5VRVlSN1MwWTVCZnF6OUt2UmgwdVhkWml5N3djL3JJTjRpdERQ?=
 =?utf-8?B?TzVLWENFWXh2aTg0RC84M0lBaDhOcVpEdHVPQUpXaHBoYnA4aFp3VDNrM1l6?=
 =?utf-8?B?eWhBWnVkaUZoSHI5Ulh6cFZNM3Z1RmZldFd1cDhrTnVPS3NoUkYweUs2OE03?=
 =?utf-8?B?T3VIejg1bXlWTkdhU1BZSTM2d0FScnkzOWlTZVdaNWFxVEptWVRYZHVlNlZR?=
 =?utf-8?B?U3YyMEY5QTloRkVTd0FyZUdCTitabWFWN2U4UFBuR1ZCTVdVWHhZd0hLQVpD?=
 =?utf-8?B?emJiY2p0bDZ3akJBSUNXall0a2gzUWJvVi9CeEJCU2RtaTd4L3p6Y2E0MVI0?=
 =?utf-8?B?NE1GN0ltb2tmblA2ME4xNG9zalJFR2oxZ3FNMVBGYnZPQUk2eW8zMWlRK2R3?=
 =?utf-8?B?cmZCcTZEbXQ5SDRYNGdaeU41eXFITzdjNSs4cFdCeUlkS1lNdk1ZeDcrRXhm?=
 =?utf-8?B?d0g4RERiYVVJRE4zNjFXNktmNGlndFhpYjF0OFo0NjJ3alBlM3VhQnZpblhh?=
 =?utf-8?B?N0Z0dFFlV1oxMlJ1dUFMdU43NWJmdW1UU2JHU0JBZHpWdSs0SE9qanJjQXph?=
 =?utf-8?B?MEhDeGJGbVhqSDY1ZEkvcmJNU3NOLyt5cXo0bUN4dEZIc2xLWExXM0tGd3ds?=
 =?utf-8?B?SkRWQ2M2TW5TRGIyREFBdTltRHNvNE85TDJZc0duZEk0MWFpNU9XUnJjVFEw?=
 =?utf-8?B?K0RmN2lqbStmSXRoSG1EaWZ5SGRSeUkwQ1pReTBVRXdPRFFQcHhnY1BvQUk3?=
 =?utf-8?B?Mk1SeG9CZi82OTV1L0ZwUk02eTNNUmpROTQ2SDBYYjk0R2M3ZTh0Y2k5ZUdF?=
 =?utf-8?B?MnJKNzVZMGFYYkVrejBmN2dFcWkrNjVtb1JNWWU3aTZjRmVkeHV4dlFSNWVD?=
 =?utf-8?B?NHpldnNRU0w0eHNBVWxuTThDL2ZnVHkwelRsRkFIMVNuK2pSQ0ZOTzlnQ0E5?=
 =?utf-8?B?eE9VaTlHY1NBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR10MB8513.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1hGcHcxcHRzUEJBUkFqU0N4SmxPM2Z6V3AyVmZEbm8yUm9CTEFrbnFCeUhS?=
 =?utf-8?B?d05uRnNnZUNIekxBRnlPSkQ4MEE1TGNsdzYvRkNJSFdUL0tKVTJJZHEwZkxN?=
 =?utf-8?B?Q2gvQWlPU1BzV09QREZEVDVWbGhHVWZNckltZ1NVaGsrOTdmMnFvbm5WVm9R?=
 =?utf-8?B?MmZkNWVqV2RKV1RLY0tzWmhxSm84ZFVrNjUzek44L1dDY0pONzkxTDl0cG1H?=
 =?utf-8?B?SnRjaUNCVVVFNUZaYW51ajZtYy8rbU1ocllCQndONkVIK0NYVERlcXF5YjJX?=
 =?utf-8?B?MitGOVhOTlNsM01seG9DZ1ZxUzBydHBKOFFTMllGeTBjQTRQQndLUU9PL3Bs?=
 =?utf-8?B?T0tNR3hoUml4NCs2ZWJySGNMekRUUUpmYlBaYnpBQ0RaazdyV0pDQXkxemFM?=
 =?utf-8?B?NFRMZTNJU2NYM2xKcVN4NHhHZzN4T3FlcDhsQ0Z2TFZTZkcvTHExK3lsdU1r?=
 =?utf-8?B?SE5xTUoxUGEyQ0hwVkxsTUFLS204Wk95RzhsMkRaZmZsZ3BiSXN4MzNkNmI1?=
 =?utf-8?B?YUlobVA0VW9NcU9ObW05ZG9JTk5qeTlOaVlVa00vMWFiZXUyaXI2R0dlRkFi?=
 =?utf-8?B?UnhIV2FZME1WVmhGVzYvRHJvOEFGcjlBSGZOL3cxbkR1VkdFYWUyaWRUM3RE?=
 =?utf-8?B?VFB3UTNLV1B2cTVHT0NnR2VDSGQ2SWxPT0cwUTZTemRXbVJWVDFrQ25obDEz?=
 =?utf-8?B?M2hpMWh0dTRRenNaTmRkKzdhdTdLUHRqWExYNmtoMmRoSFpjeG5iSDFQUFd0?=
 =?utf-8?B?cUkrQVpJc3NUYWM2WlpzK0xEek92VFA4RG9SSVFicU9HbTNCZnFURU54clZJ?=
 =?utf-8?B?d2VrWnJTcEhRTjRGS0I0REY2dHJmSXZvdUp4SWJYUXo5U1lqdXZMY2pXeHB2?=
 =?utf-8?B?RkEweFZyWUxrNWIzZDdGbVB6T09SME9mbHhyb3lPcXpWOVVJTkl6czJNTGI2?=
 =?utf-8?B?RlFqaE5xeGg2SkdKczNJOGtSY3RJM296TUlQeldhNVNWSEFxVTI0Q0x2V0FW?=
 =?utf-8?B?Y3JQMGZiSit0Z0VlK3BCVVk0bWRTd3dORUkwMDN5d3BDbE1ZUU5zKys1bGVB?=
 =?utf-8?B?SERlVW9COFJNbWxQZHZzY004dFpma2RsRlViWFpScHZsUVJCcVhxbWZHUWI1?=
 =?utf-8?B?QzZiV2sxc3l6Y1FUSkxjaXlKSzY5TFNUc3VUZnhjYjVTdFgyVStFK3RTUDBr?=
 =?utf-8?B?RHZKTnpyRGNxVU80Y0RXSjREd1VkU1E4eXdHdmZPZHdER041Q0JZRHJTTUx1?=
 =?utf-8?B?TUhabmlWbFNoeStaMkU0eS9VbDJ6YTVYTXg5ZXdMejE1aUtPZ2M1TkZyem1X?=
 =?utf-8?B?blo2TjV6WExUVzlKYnluMFVhMkw5SGFaQWMveGhGMGZxMnlzVXlUZ2hEbTI4?=
 =?utf-8?B?T0phT3V1MHR3S1ZRRTI0UEFpdVg2dTNSZGNyOGE3WUZETVY0dWhMMG0rMXZQ?=
 =?utf-8?B?WHRFc3NzVUtKVnJWRXhsdVQvNDZ4bEtDcVZDVzdoeFJ0Y1FZSk1EME80a1Q5?=
 =?utf-8?B?RTVJNHd3VHRqTCtBQnZ0V0IyWUlURW53SGR2eDc3OThjS3o5RnZXdzZLY2Vy?=
 =?utf-8?B?NnJXU1k3V25HZlgraEw4V1VhbTZSZTZudUliN2xqM2NEVXZ3MDUyeEZ2Q015?=
 =?utf-8?B?ZFZ0d1ZZVzZUaFFPVmtRWU1MYVoyZTlSQzlLM29Bemd4amVEek9TU3dSemky?=
 =?utf-8?B?WmQrUmp3bkR0ak0yUktSOGwrcEkrcFlGUTRJSCtKUDVJSVhBTThMblZNMkNC?=
 =?utf-8?B?WFRrbVJnMmtyREExb1N6T0hhekhZejNZbWNCL2pEQVBGSHp5b0laQ3E3eTJ6?=
 =?utf-8?B?azl5bGhLeGxwZlB0K2lZejdFcFRWY3VvUzZBR1drYTYxU1VRZGRleTFyTDZ1?=
 =?utf-8?B?bUVwOTAyT3l3T3NnNTg5R2x2OEl2V2NYQ3pPTU1lbW92ZThVTmxzOXZ6REtK?=
 =?utf-8?B?RzVtQlZDd1A3QXNQNjZRVDhJcWUrOU1PQklrc1RqeDYwSVFWbUxYdktDZitW?=
 =?utf-8?B?aHdzSmNZVnJxY1UyK2kzbGg3cEd0YlU4L08rODc0dGRpM1Nuekp5cXdZSHdw?=
 =?utf-8?B?QlpNcWpGYWFMQWI5K2VtY2psUWJ6TUxiNzF1QmYwVlg3OXcrcDBURkUyanVC?=
 =?utf-8?B?OFZQTi9XSk9kZTJXMnNZQ0thbHdvU1IyMUhzUWg0bWFoWGlkRGpvUXlLQXJy?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JQHzZ8aOPRqi0SFZ0YnCi/R7ziJyXyDGHbKBTdZwy8JDoz8VI1wLBkRArHjQq8wJXEx3Yg2kI/f1PZjDXE0gQeRahJg2Bd+j2PPAqPDNHNOhZgJw+sD57veCINzcwN2mUjopdYD/wiVCDNVp/RWEo7C6iXdO7EaZ8Z2I2CHQmHM47n32LqYGhZP9P6IcKotvvVQmOaUcyhck3/gn5e2+In7qb3kAcdUZTPO9IGUM5YRipRdBSmGcmFhLdMiWpoWcibgJx82GCwMrEgDqRW8yj1JN6sb2mPn5tSKhGrWCDWF46eMirNoUbxoSqb67JPhAVy4891/FXZPBNTfAf/Z4FLhHXResGF9eie6QGvLANiYqbL4PqXyb2EFUwjinmd0e7YZ7Izm8sIP19vnEPJMLa6nul1034ttkAJ4thBE/WdO/VDfJ6vF9hT/nckM4l+af+z/twldqUEs1ETEtaPpQ9DggcTif0+F7PDvslJA5eP/1fFNL4wVvYhi2IQ/9DolQnhTGLE3ioa88mKpoFd6nV2YGFZqyxaXgzyBYzQ/McU/5qSmSgvS9OmNuX3lJh1xpDFdTEpcGzgm/82o6kOuTlaOBAVqfSBOZg3WUdYFbNdg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab50fb93-bfbf-46e2-a9aa-08de0d0683a6
X-MS-Exchange-CrossTenant-AuthSource: IA3PR10MB8513.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:51:16.5071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duSt9S2nFrIyRPqgsflvcMaYIrPFc809pDNf16kI5ElMRbk1X8WRkQHnIHMO7pE7zspExZZQRKBg0qr5tEFf20Oj7EEgs0O8mh1vOgmKnSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF751CD7230
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510160172
X-Proofpoint-ORIG-GUID: trTuyeb8X0lJYoaEU9_65AgZj4tTrZ49
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX53xPcjgSJuwO
 V8LK1LLFJ0HAfs4zxtl9xCrlLbHReocKzE4hkIgqKWD061pJqADTV5+nDISlTDJx+3o2KqMDRKF
 VVS55zo2I7mvPb2HRUyZicrHbQ/MU58D5nDKqJzsdQvxYckFuq0nwsmvQvS6LImSEXAHRgX497g
 22gHvHRH3A2kNTVudVplqt16CRjeHdCHlw8Ima0DW1Rp5trZ581TG1QuJdK2Fvzhrr7LN28HhYG
 T3icByRiNBEA3/pP9RYt/BSljR50fdvy7yQ1sMsdQqF1JBUltO2nofEImNSmYkCVMf20bF+mw2Y
 pM0kECxWonzLvVI11kLO2Fg2C8az17H30qw2ZluoiGjQI/kaMTXak0+0w10SD3TBfW9BrBABXg6
 T+BeITmD6QzIX7NIZRL757lwQNFadw==
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=68f176e8 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=6CFDQusALmt-TZurQXYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: trTuyeb8X0lJYoaEU9_65AgZj4tTrZ49



On 10/16/25 3:25 PM, Kris Van Hees wrote:
>> +## Files
>> +| File | Description |
>> +|------|--------------|
>> +| `llms-dtrace-short.txt` | Compact reference used to bootstrap LLMs for DTrace knowledge. |
>> +| `llms-dtrace-complete.txt` | Full expanded reference (available from the [DTrace-utils repo](https://github.com/oracle/dtrace-utils/tree/devel/llm)). |
>> +| `dtrace-llms.html` | Blog-style introduction explaining how to use these context files with LLMs and why DTrace is well-suited for machine-generated tracing. |
> This file is not included in the patch.  I would expect it to be included since
> it is referenced here.
Ah yes, I was initially under the impression that this was going in the 
blog git, hence the inclusion ... I will remove the reference.
>> +2.  **Load the context file into your LLM session**
>> +
>> +    -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
>> +
>> +    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
> The context files are not currently included in the DTrace RPM, so installing
> DTrace would not make them available.  If they are to be included in the RPM,
> we need to determine where they should be installed and then these instructions
> should reference that location explicitly.
Good catch! I'll include a link here.
Though, to be fair, if users are reading this README, they likely 
already have access to the repo that it covers.

Bruce

