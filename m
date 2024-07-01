Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4182D16E872
	for <dtrace@lists.linux.dev>; Mon,  1 Jul 2024 17:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719854494; cv=fail; b=e0hD9Ev0sMhyn5bEf14cMkY/EYyGgd/8mtxlvZ0Dxi78unuqPfOtLsYNVEijZ/3u+owJfJIkGei6wWIL9kyAPErN6OSyhTqI0oJGYXVUxjNnEbqaDr5UdHLDlaouMb8IcUg92AFLMEgHiwGBmStsxdP+97et25EBTAg23ZN7Ah8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719854494; c=relaxed/simple;
	bh=zqTazJfLfSVNWqB3VYzUm4lkc/zoFuuVBTd6/LzFhmU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MocbzyqStoP9y4qzx+zDqVP6Y80+VqEjohR2z1ZgtVAK2sgog45c08wFucAJFDjY1ET7X+kfwKR9kvq3FrOrwyNXDWzoClr5leag6TNnv7JESg/ABKrwWITaNTiLIkDFbg/z+Rubz6fgdXvIUPeBDQp8uBlAG3kLfCLtPTTOb3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aMclwsf2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MvmIPX7/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aMclwsf2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MvmIPX7/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461Fgm2B007485
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 17:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=eHUeg8L11Gsp/4r+0/hUloKSgfEFqUE2dCfCMQV0X90=; b=
	aMclwsf2qVCaQVqxrews1vF1S0FIy1iqaFB7C0JLzSmo7AZaGCD7Qt7JyT8wq9ng
	QnTJT6JRF8vKgC/2HQG2mYXzekagXTbzG8D1HS+Uos2KOlihJ1FXxyAtHZImokSo
	zx77x1lq7jzQRiZchnlRAfw5X007jCeJcBCTlOTsAaY/AAQUcGR/IV8D6GUMvk9k
	WoaF1ZL1yoSMQDeeCWCiETk3/j0Mqa/ohkTUuNz7KfZe/NO+/s8pDgDymDdAnIgI
	OEVGB/UDUzcdibAcsLqxeMEqcCZKOZ6031dUXGuxWy/nLAu/NI5jtMwOJd6AgA72
	HRNleVIQJs9su6+etqsWUQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 402attc6qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 17:21:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 461GmiEA026213
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 17:21:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qctn6j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 17:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkZ/JrSKOHiIqVopjBlICvk2Mg+Kygi0F/bQu/vxUSrvf2WD4eMXZzFWHIWMZUr6glP+ygGj4dT0Ns6gMfdaohyV/Zg9tZ6ZaTD6ue39fghEI5WgwqipRNrmnoMRCoZ903no3Of7WxrK4JVW10tjzkCxUKyZsCbvgSGrCHERGcPzMXTXMbzo5nVqbmza4RCIkdrfMWLnMBAIXRoPMeUA6smYVMZx/5SpQpueCoHJ3qNzJX1XUf6xjtghcDXQZs+wwW1496Xy4TZRxDioEgPTuGJkfODx5AXFAatyby67HQX4LwSFuBV74ijel/h5alTj8ASUFaq0ynoNbDatidRP1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHUeg8L11Gsp/4r+0/hUloKSgfEFqUE2dCfCMQV0X90=;
 b=PqJz3Sb9iDeQhpWmXcop76eMia2Cbz8luIYo9VlVprCC83eNtbtZUtQ436Xz/7jnEMMReI+TrhOVQBxVefYftEGs0JusBUxSbPUUvM0Cmb51TG44QF4HTZsh5NY5/s6BLA3otjC6vcezkA8546wJArNCdUWhf4Z4uhTM7IDIcKhxz5WlNoOy/8O+QQ5GSksta2I/xhIFEOpzoBZ7/qC9qrylwH32rrpYb+GiT1XweI1aIzhHZpXXApdaZdJ7Hp7H8ffQcJuHBup8McvV3oVJR7VNOS2koBIkglKYaj+8ToAyHLZwDkjzuecMkH+Tcr9V55byNk/i2jbpu0GDUGOcGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHUeg8L11Gsp/4r+0/hUloKSgfEFqUE2dCfCMQV0X90=;
 b=MvmIPX7/wFRp7klkU2dQPIxVuwpU1RgqtJA2ISZAlR2slCkuou248MuC94grTC1mTDFCSOESLiMQswU+SQyZjbcgPS4cAjpQscpVmCd3a6E0CUYT14XSdqmV7L361nA6grKx0l0IoCw1PeM7cE8FUROgOrR5yvrqInuid4GgwCA=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by LV3PR10MB8179.namprd10.prod.outlook.com (2603:10b6:408:28a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 17:21:26 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 17:21:26 +0000
Message-ID: <2b83e5e2-adf1-4a5b-abf8-a83fbaf65abe@oracle.com>
Date: Mon, 1 Jul 2024 18:21:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
 <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
 <ZoLeWRMOnCoecHmx@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <ZoLeWRMOnCoecHmx@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0004.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::9) To DS7PR10MB5278.namprd10.prod.outlook.com
 (2603:10b6:5:3a5::9)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|LV3PR10MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d00ab0-d4e5-41da-0e98-08dc99f23c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Tnc5SEF5cmdPTE9zZWlsR0FybUEwQ09pcHZndWwyZTB1SXJLVEoyV1ZhUFl4?=
 =?utf-8?B?NlpzazdqUzBXZ24yekh4T3c5WXhKdzBmdXdBNERUdjdtaWRhSXlKaDJ2T2x3?=
 =?utf-8?B?U1Q1ZmdCWjB0cDVzTFMrMm56TmZWMi9vQnlIY0lVQ3h5NmJhZWRKYTNlOVRI?=
 =?utf-8?B?WUd0TmhGaVF1bG02eFN6cXRoNVl4dTlscmhDcWYxejhZUlhmaGt2MGg0TEQ3?=
 =?utf-8?B?V0xEaElhTWRSSHlMZ0RQZy82YW9yRVg2MDRRTlJPR2MzbVUzYnhlZDI0bnhu?=
 =?utf-8?B?bFRMbG95N2dBYjlZR20vN1FvcHJaQ3kvREE3TUNoVGxvSGdRVTd1NTNVaDdN?=
 =?utf-8?B?REVCWmIyTW1zTkZ2czVGazA0NlhqeE1kS2ZXVzQrZDdaK0F2RC9BRGRHYzdo?=
 =?utf-8?B?TFo0bHI2SkN0UUpteTlFVHI1K0F4N084c2RWcFFNWnAwSDA1TXRBY25aYlhh?=
 =?utf-8?B?ZUJ0NzJ3a21xUlhBUTF5NlVycUFER3RKUmFoVnhEcHIyODVsRU0rL1MzMTRP?=
 =?utf-8?B?N2t5Nk9QRFpHVlZUelRwbEZkSngrUklLSTRML3Zzam1sNU00Nm1LTHRGMGdY?=
 =?utf-8?B?ejNRcXl1aDQrcFVJQzh5RWFZUGxyQ0huY00vVFYrRTRoUXo1M2dXQ3AwWURT?=
 =?utf-8?B?Y1Z3YlBENStZZG5wODJBVnRuOTZ6ZHZnRnRhbkZQdmdsQnAwdGh4RlBrTHlJ?=
 =?utf-8?B?QTM1TFo5VjA2K1lmV091NkRwWDAyZHg0THdweHdCbjdFMVJLT2dTano0Zk1I?=
 =?utf-8?B?OUpmWGhBQUtGbktZOFJWSDhKVWFmaGRNVzZpYVFMRXdhbDZtempWOHpyUVps?=
 =?utf-8?B?L1l4UEVJaGpMSlFrRnhBcXlhcUIvWEF1YTR2cTMyV29yUTVkVHBoWENGKzRa?=
 =?utf-8?B?YnFRMTF1bTQ2Q2JlNWtqaVBLdnhXNXBMclkzRzU3R1h2bW9HOHd2WlY3S1FQ?=
 =?utf-8?B?YkZTVjAvTk11RkVDQUFMU3hSUVh0SHhORmNXWWg2bU9vQ1VPcmxmdTIyWWx4?=
 =?utf-8?B?N1ROYjk2M1dJWi9nODRMVUpucjZaWUE3ZWxFdWd2dkRBWUdCYXVDL2thNmds?=
 =?utf-8?B?QnJja0hUcUFPUU1ubmNBcTlGaXRsTCs4K2lSbFQrRFNWNThraUhKb1doclc2?=
 =?utf-8?B?a3Z2TTJXSzNRZmw1YjNjTDhmc0c3U2RqWHFTejYvK25kbEFGd0FqNlJMMis4?=
 =?utf-8?B?QnlEL1JPZ0xDRHUvV1BXdnFCcUFGOHcvYnJkS1VoeVVZNldHb3N4dE15THlt?=
 =?utf-8?B?bzJyS01LeWNiM1N4S05MaG4xbzVvdytXZDFDeWtCdWgyd010NVcreFRwTXVy?=
 =?utf-8?B?MDZaQTB5MGRmbE9kQ1dqMHpJZFJjTmtMWkJyNXBGazhiemFRMGU1U2tOaXJV?=
 =?utf-8?B?OXBmSnVZU3ovMkgySlZLdWhXQjR5NGE0d3BqMUNYcEtJWjNqR2JISU1rT2xI?=
 =?utf-8?B?NG5kRVZGK2laUWU2dzBSUURINEJpbGZQVEVzeHVtYjlBaHIxT2xYSUI5c2ow?=
 =?utf-8?B?anFYZlhMSDJBRTY4TUZvQzlvNnB4R1A1NE9jeXBTS1lyRmhrV1VmSWdJSzNi?=
 =?utf-8?B?dDQvSGhUTVFudjFSeUczdVcwbGVMVitiUEh4Yk1zbzk2eCtZajg2V0crMjJ5?=
 =?utf-8?B?QUU5L2dmUTJmOFBBeG1MMDE1SldBOXFhc1dUR1ZQVGx4L3c2eU1yT0lSOGkr?=
 =?utf-8?B?d3gyakpvSWplb3p0emhjSGdTSHdGRUZzeHJWVmZCaFBZSUVGUmp4b2FUeUVJ?=
 =?utf-8?B?L3ltOStvZkdxUEtRQmRoQmRzTW1KdTlQcVZhUkYvS1M1dFA5Q0tXcWJoc2NL?=
 =?utf-8?B?R2owRVZ5SHZMMmt5N2VYdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFo1RWJrVW9lMXlJMEFMTVpHclZsazNqbU42azk0d2JSVlFLVWtGbmRQZnli?=
 =?utf-8?B?ako0VTJhNXlyUVFuUkxEL094WXlnc084QkhIc0NIOTJNblMyM1dSRDFVdkhp?=
 =?utf-8?B?ZHUzUWxJbnNVWkR0MkpsZXBqVGo5VFZHbE9mYWZ2d2wxVVFaZUdYbUZvL1E4?=
 =?utf-8?B?bGVSVlBSUnRMNHFya2M4ZFBvbUd4eXpTeVo5akpKaEsxcHlyMFRIZlI2UjNO?=
 =?utf-8?B?c0htcXhQMXJ5amducjdKREJuYm9pZnhNVGpNZkh2bEFTVXJXNWdWMzBpeitq?=
 =?utf-8?B?ZTNpTkNqV2U2YndMUUJHd2RtbXVER0NPTFNIQUMvR0QrUTlyYmdtYWl6Zk4w?=
 =?utf-8?B?VC95ZkJhSW1UdE5UZ21ZQWcvVHJxVU14TWNnczBlZVM2cFd1WllxdkNXQUdS?=
 =?utf-8?B?a3lDN21hRTltYm11dDdUR29sNkZIclZOcE1HRURUOWUxZ3hnQ3N2VTVQVnlQ?=
 =?utf-8?B?RUZxR0dvaEN6QVVUYmdNY0VIdjNBd05EQ2Nwak9KSXVlL0ZqWFY5MisxUHVX?=
 =?utf-8?B?bmVZMVZvNCtOdit5eVJzbU9ONlF5a1pRWHptT3ZrZ2V5VzJvYzJMWGNkcnVr?=
 =?utf-8?B?cEhMM213VEI4ZVJGdWk5VFdFelNWczlPdlppbmw3MDFVaUlZYmNBMUFpSHZp?=
 =?utf-8?B?c2lyQjJ0dzNtSSs5UWJ5bUJ5Nlltc2IySW1wcDI4LzloazBuN2crcXNEcU9i?=
 =?utf-8?B?WXd6ZkUvUUpxa3ZwNWpjOWVKOXZscmZOWk5TeXdVblYrbGJNWDkzdnpQMVEz?=
 =?utf-8?B?Vk1uOTRsRFpPdTFzUDhsWDVzMmV2d3IvWVpzaVl2NUtYMzhSYzgzc3RteGps?=
 =?utf-8?B?Zyt5bUNCUlpIS3JIempReWNlVklsZzN0RmxUK2toZUFrTW50dmRjaENmUWFQ?=
 =?utf-8?B?L2VDVGpnRWtxZ1VGOVRKYXJjd3FhcWRYTzUvRlArWStERnBFSTY0VTV1R3BL?=
 =?utf-8?B?TTFoUW9ya1U3ei9TaHhFYllNbDk2TTF2a1h6WVdRaWJneUlodlhReDlSVEVL?=
 =?utf-8?B?Q0c3UUJxOUVHTFl2MmJDSDEwUFNpRjBIMmVzdVJiWEptck1abVk1UTFNeHcw?=
 =?utf-8?B?TzhhQ3dLRlBTREhqdHc3WkJxeENzaGVCbXdyK1ZIb3dheVplRmVvb2o5TFVC?=
 =?utf-8?B?WWVtQUkzbHhyY0pSL245UHlSekowTEQrOUdmb1BIZDB6MXdHRnREa1FaV0da?=
 =?utf-8?B?MHd3ZGQ5WWZKZkpoQUNiMkV1eGUxUmZwb0hxNmY2d29rNjd6WktucFBxTWdn?=
 =?utf-8?B?K2ZTUW1DQmFSRTMwM1d5YTFiUXFERVh6N0lWaEFLbnBIWUduVzdYSlZlN3M3?=
 =?utf-8?B?S3ZkZU9LUXJtaVRhK0hhTHFpL3hpWktIN28vckQ4am96eDVqbUJ4L3RaMXRP?=
 =?utf-8?B?Q29EcVNkVXFkdnBzSUNSekJDeldYRm5OSEhJRnpubUw2NGMzS20xUzhTaG9V?=
 =?utf-8?B?MDNNdW42NXUwZmFaQlN1SEdpOGJLYTRNckROYnpqSG1WSXlYTmhzOTJ3K09F?=
 =?utf-8?B?bnFUVGhSZEVQT1ZmbGk1dkxTT09MQitTNGovOTlKNVlPcXFlb0pJOTFPT1ht?=
 =?utf-8?B?U1k0UVZodkcrUDFLRVlSeENnUmE0VnFKQ2I2WUFTQWhnSjdTYmxNanlqYW5x?=
 =?utf-8?B?eWpsU3FVUlQwdVNkbGhvY1dlNXZlWmhXM3d0a3M3MG1ONHdUV3pmMjc4SWJq?=
 =?utf-8?B?V1JFNDRuZzVrVFpCTkVKMTJueU82S3paaVUzdGwxaC9MUnRJSG45RHpPRjBG?=
 =?utf-8?B?WWFwUVNGTERycktZdnNLYjYrM2FRcVJMYjF5YXNxakM5c0tQWk1OZndhcVBE?=
 =?utf-8?B?Vi85REs1MUZqNEwxZWk1RDBXbVlyT0FsZ1BPSGRCZyt1bS9mMm4xODV5UUZh?=
 =?utf-8?B?UHJCZ0ZhSjdqUmZUTUllQkxaQTBxVVd2dzdBU0h4MWFQMkVET01nemJtcVNC?=
 =?utf-8?B?V056SUZFQ0J2Wk5kOG4zQUUvNDV1dStMRWVRSXVERlJnWFZyRTgyeTBjdm5z?=
 =?utf-8?B?a1pPS2QzWkw1VlVKRmdBbmhnT1JTRHJxV2kxS09maGtKaTJ3R3dQYUVyQjV3?=
 =?utf-8?B?aGVIdG1TcWt6U1FwM3IwQlJrMDRmczlaUDVEVTEvQTNqUWlyTG5yVUN2REd2?=
 =?utf-8?B?VDRuRDNxdVE4T0swRHRBVWtiRTVZNWJWT2dZZmJHQmxaVnhWaHA5ODFmSFEy?=
 =?utf-8?Q?01wowMmj9SG9vKaeiOqNb4M=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	H9DmCjllCFCvOu6ny+l+5m7fOgEj9PrfuOa0IYmNZunidrRtnc9F0aRHKQ0dRiUcsb7c/jXkdY9769sOFgPibDnWo+o5rHobi+D7ESbvbN3e4bZuV/glc2DzsqmuVWrEyP0mmWxhKBaMUS0Iy2znge8aGXxolPEAvDFHcy4ZACyYI2u62demuxTjGN+Hh2yiWOQtrbVm91AF4NlwEFQDRTfbyxWz479zeA6J3L9/YrWkQhTMIGysI8B7riP+m7mdz8Zd/OAloJYGRxz4LI0bWrsxMv9we7ryf2WRET0V0hAHV+DrJBKfEt8W9zUfp0YXLCGrQkY+uG/yTvma16OGWxQTIRKRvkuUjHSsCSV1I8ovo6DJaOBDXTh2GqcrWq/ksFx2ge/UgBXV/z5jsY+Nud7/GPeGcmld2U48KF8NNhWHTX7XALt4xu2H3vkzLSBpgyLb816MS8j/G9r6rfGpSS1UWucpX1eTVwCoML9hdBj4c3/6v8cdjgG9FhnIAFDKccTSzWdL0RDVDAeEeshpR0C1x0m9eWp5bdyUTNYG2weRT5La3cR3A2qbd0pJxwIE0+AIvtmAyAnxmyOSvZ7lA2yX33rxjtYHrCGJivY3IgY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d00ab0-d4e5-41da-0e98-08dc99f23c76
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5278.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 17:21:26.4386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvtCT0rxFMnmR2WAoiEu+w7um0IsL2A2tBw77rot3PKYsC3j4nZMlTNDVuIL3qo/nKYTdR5zGcCPsjp5wN926A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8179
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_17,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010130
X-Proofpoint-GUID: hNbmbxUsPmd4JhDYInsRRcd2lOdkr_s2
X-Proofpoint-ORIG-GUID: hNbmbxUsPmd4JhDYInsRRcd2lOdkr_s2

On 01/07/2024 17:50, Kris Van Hees wrote:
> On Mon, Jul 01, 2024 at 09:06:32AM +0100, Alan Maguire wrote:
>> On 28/06/2024 22:55, Kris Van Hees wrote:
>>> Looking at this again, I am wondering why we don't just add type info to the
>>> data record?  Since we know the type of the data items being added to trace
>>> records (and type is expressed as ctfp and type id), we might as well store
>>> that in the record.  And that would make this entire situation pretty much a
>>> non-issue because the record would already comtain all that we need to know
>>> to consume it and print it.  No need to pass a module id.
>>>  in 
>>> If the issue is that modules could get unloaded and thereby some pointers
>>> might become invalid, then perhaps the solution would be to always copy the
>>
>> Yeah, I think (as well as modules going away) the other worry is record
>> corruption, so dealing in direct pointers is too risky I think.
>>
>>> type to the D dict (I think that is the right one - I always mix C and D).
>>> And since that one is always around, there would be no need to associate an
>>> id with the module and pass that.
>>>
>>> Perhaps doing such a copy is the best action here?  And we may need to look
>>> at other cases where typed data from modules might be stored, and if there are
>>> any others, they may also be subject to possible issues when modules are
>>> unloaded and in that case would require a similar type copying action?
>>>
>>
>> I looked to see if there any CTF APIs to simplify recursive type
>> copying, and  I couldn't find any and that's my worry - this sort of
>> copying could get complicated fast. The other issue is size - a lot of
>> the kernel types will pull in a massive number of dependenent types
>> (print()ing a skb will pull in sockets, task_structs etc). Duplicating
>> all of that in the D dict would be expensive I suspect. The other danger
>> is introducing multiple types of the same name into the D dict might
>> complicate things for other consumers of it.
> 
> I mistakenly thought that we already included code in DTrace that performs
> type copying, but I cannot find it so perhaps I was mistaken (or it is more
> obscure).
> 
> But then something else occured to me...
> 
> This is all compile-type-known data.  In other words, none of this is passed
> in the actual trace buffer.  That means that we have a lot less worries about
> how to store this information.  So, look below at your patch and some comments
> that I think make it even easier.
> 

Thanks; more below..

>> The worst case scenario in the current patch series - that the module
>> goes away - means we can't print the type info, but that's not the end
>> of the world really. Certainly in the kernel case most modules tend to
>> stay loaded.
>>
>>> On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
>>>> when generating code for print() action we need to identify source
>>>> of CTF; is it shared CTF, cdefs or ddefs or another module?
>>>> Introduce a module id scheme where the module id can be stored
>>>> at cg time for later retrieval at print time; this allows us
>>>> to later look up the module and its associated CTF without relying
>>>> on possibly freed pointers.
>>>>
>>>> Under the hood, the id scheme uses a monotonic counter coupled
>>>> with the hash of the modules name; the latter allows us to quickly
>>>> look up the right bucket via dt_htab_find_hval().
>>>>
>>>> This fixes an issue encountered when using a shared kernel type
>>>> with alloca()ed memory; DTrace assumed the type was in ddefs
>>>> and it wasn't so it wasn't displayed.  This change fixes that and
>>>> all tests continue to pass.  Also tested that it works with
>>>> kernel module-defined types now:
>>>>
>>>> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
>>>> CPU     ID                    FUNCTION:NAME
>>>>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
>>>>                                             (struct ieee80211_hw) {
>>>>                                              .conf = (struct ieee80211_conf) {
>>>>                                               .listen_interval = (u16)10,
>>>>                                               .long_frame_max_tx_count = (u8)4,
>>>>                                               .short_frame_max_tx_count = (u8)7,
>>>>                                              },
>>>>
>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>> ---
>>>>  libdtrace/dt_cg.c      |  7 ++++++-
>>>>  libdtrace/dt_consume.c |  7 +++++--
>>>>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
>>>>  libdtrace/dt_htab.h    |  2 ++
>>>>  libdtrace/dt_impl.h    |  1 +
>>>>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
>>>>  libdtrace/dt_module.h  |  1 +
>>>>  libdtrace/dt_printf.c  | 12 +++++++++---
>>>>  libdtrace/dt_printf.h  |  2 +-
>>>>  9 files changed, 72 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>>>> index 27246a40..30cccdaf 100644
>>>> --- a/libdtrace/dt_cg.c
>>>> +++ b/libdtrace/dt_cg.c
>>>> @@ -20,6 +20,7 @@
>>>>  #include <dt_dctx.h>
>>>>  #include <dt_cg.h>
>>>>  #include <dt_grammar.h>
>>>> +#include <dt_module.h>
>>>>  #include <dt_parser.h>
>>>>  #include <dt_printf.h>
>>>>  #include <dt_provider.h>
>>>> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>>>  	ctf_id_t	type = addr->dn_type;
>>>>  	char		n[DT_TYPE_NAMELEN];
>>>>  	size_t		size;
>>>> +	dt_module_t	*dmp;
>>>>  
>>>> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>>>>  	type = ctf_type_reference(fp, type);
>>>>  	if (type == CTF_ERR)
>>>>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
>>>> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>>>>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>>>>  			ctf_type_name(fp, type, n, sizeof(n)));
>>>>  
>>>> -	/* reserve space for addr/type, data/size */
>>>> +	/* reserve space for addr/type, module identification, data/size */
>>>>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>  			      sizeof(uint64_t), 8, NULL, type);
>>>> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
>>>>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>>>>  			      size, 8, NULL, size);
> 
> Here you add a data item in the trace buffer that will actually not store
> anything at all.  That got me thinking...  And then you store the data size
> both as the specified size of the data item *and* as extra argument.  That use
> of the extra argument is unnecessary since the size is already being added
> to the record as dtrd_size (which gets its value from the 4th arg to
> dt_rec_add().  That means we can use the dtrd_arg for something else.
> 
> So...  how about you do the following:
> 
> 	/* reserve space for addr and data (modname and type as extra arg) */
> 	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> 			      sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_name);

Maybe I'm misunderstanding here but isn't there a concern if dmp goes
away before we collect trace data this string will no longer be valid? I
_think_ if we were to store the module name we'd need to store the
string itself in the trace record. The module id approach was an attempt
to remove the need to store and retrieve full strings while not exposing
us to the potential risk of invalid pointer dereference. Sounds like the
trace record storage implementation was inefficient but that was the
intent at least.


> 	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> 			      size, 8, NULL, type);
> 
> And then the consume code can perform a module lookup by name based on the arg
> that is attached to the 1st record, and get the type from the arg that is
> attached to the 2nd record.
> 
> This also avoids the complication of modules possibly getting unloaded (even if
> that is quite rare) because that will mean that the module cannot be found and
> we can therefore take appropriate action (unknown type so just dump raw data
> or something like that).
> 

See above; my concern is recording the module name via string could
result in ending up with invalid data in the case of a module unload.

Alan
