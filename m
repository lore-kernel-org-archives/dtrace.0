Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37EA84A22
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 23:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733441476; cv=fail; b=EfsxauCrz3LKJPzZH1wFaPOnZDP2pgHbi+OQ3fR0Y6kq1vCUix6AKlmqtlKGAJ5i0p/gPxLIcHwFSw8ooeKy5I4saOOomf+la8zACd0hLEgdTXzs919isRoVNXkv2PuopnsoIK4W9+iSWp/MwOOm8TJLG2ElwO5Ed9zABYO2FfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733441476; c=relaxed/simple;
	bh=ipe8NsJAQBcmPMfD/Bi4g0NfAGvarNZvLDx0ZNbmOoc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UXxZZhedWdx0x3iC5huRqd2bjgbELGcBI66Gg2+4ai0ma4dV5Y1CrdwL6/cC12bNWZauWakxoeUSjEo6K6/m8Tdbaf56rQirKfx2/VKGnVvnaPAyaHcTj4yVyvuMN3slQ2Gf+wps2moK+UWOOsoaaBGB0Bzy4TbFCVzqZ/4xXdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OikftKgM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OWAWTHeo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OikftKgM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OWAWTHeo"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5LNZ9n013040
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:31:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=O9AufQLzpaZoUaXJGBpsrGGmntozGIv8II9kmJJZAKs=; b=
	OikftKgMVF2Hcnknhrjrx/lG/C3CGbIAvKmX19XtQ7IMMI5XTa/0Z/WnR8ImcYsK
	2VIWP3yuvB9dU6UFgGviyjHARxf2dMZmxYSTMBaLSajuqgY2vDM1Yha9HU6KmXEV
	AoGOX88bhG79vv//6h0osBS1oxmHDQwfQFyegu0jOG44jlorSHCPgKiZt55gFPik
	yCqhWL0gJKcaC8Mds1OgkBSe37VVua/zmcJC/IVvEmOK4SDpvLLBzolz9osCkFLx
	ht/R7O1RYO0emtWkJQstUzaTEIVRQHlhdSJyaqiQndLIRG/e/7bFpNBAkRY6QgBK
	1Z4vai5RU5A/cV1jvj7Vag==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437tk949bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:31:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5NA2kh001458
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 23:31:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5bk2c4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 23:31:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loxEWbKhtDROaAdve6ot53bU3taEmK+8oMpu+hNMEif3NeG62KZrFbEG4XiX8676wc2/AST2rtb1bYewkn8ARZOiIohTnQ/vOOw97W79cSWTKc1PwdbAAYDx70kv7pKvU8PhYfLP2OsVlKUAFNiEYmcBQhED1k0lpHDX+3YpWw21bvYPhD8z7cSBEMmWYiSi3WwkEQQmV2jiamMuw6nfNZojc5nNqtaUIwm+hb1vuzpz8xKfdYO6maOlDr9CMHUr2SC6iH5eQe+RXFB4xL438enYz/Fzmy5aZV6XpZC8LhcH/pguK1Z2AhSLXxwmZMm/xx0aIx/Ms8zJdU3wc9X5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9AufQLzpaZoUaXJGBpsrGGmntozGIv8II9kmJJZAKs=;
 b=uChDzOmAanF3LUJLKWtaJg/CqftVdWfdP2SYlCLF7bxvtmNwT4X5ZbTv+2cu4KmylUj+1NPNE3l2lftLw6YOI5w1xuIA++QBYkc+S5FdGiNvr26yYUprQuftHfGinaxS+pasrOOjeTj2zyrZJNf5CPbK1O6JUWu4DUxP6o/cDOQeXohvIKMBwcZJny3qRBae5E/MPw3xO20MdnjoNMfQ/3jNmctzm3feFlm7grIu3bgIGqscWc83A9UsNZNx7sk7u4k2nuvwFwudItPaw8x3XTcAIWDtHJe3etd5HC6+/FIdhk0EyZwUYB/bLTvo9+qc/WLnYAHReOAUVUSxDCg00A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9AufQLzpaZoUaXJGBpsrGGmntozGIv8II9kmJJZAKs=;
 b=OWAWTHeocv/Vpk4V0Rqp9X5BL1Of4ODw5nmQsMsEffh2pUkXBgVcWlC/tyR5f/gEP5CsG17qi8hhuoJhI7aL+wUJO4rdw/Fjb4zQGQpE4IqpwKR/827M2PrDotaZZjS/DlwkoHVe5ktH3ffR7SIAy1+fvo8wLS9t6pfLn9gLl1k=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH0PR10MB5595.namprd10.prod.outlook.com (2603:10b6:510:f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 23:31:08 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 23:31:08 +0000
Message-ID: <8c6cb08e-130e-4d4e-529d-7513243d9b1f@oracle.com>
Date: Thu, 5 Dec 2024 18:31:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/4] fbt: clean up fprobe/kprobe support
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB635036FA69C3F542A5518385C2302@SJ0PR10MB6350.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB635036FA69C3F542A5518385C2302@SJ0PR10MB6350.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH0PR10MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 1852dfba-15a5-40f8-dbbc-08dd1584e57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEMvc1d5TEZUazRDRmZzNXVKa0RDS3lXNmo5UW9hY0Z4bWpJTmdzcEhtc3VD?=
 =?utf-8?B?c0ljb3VZbVNlNWNnb1F0dTJaYlFsK2ppQWprOU50OFBBbm1EVmNWSHhjMFNC?=
 =?utf-8?B?MDlrZDBNcnpXKzN6K3pxM1BUVGNGZVZHZDNGd2NyRmxSVVJnQnVmOE9xZTNI?=
 =?utf-8?B?ZnoyZkhhQVJzSno1clJOVlF5d2djZFlScjJhUThMSmNlZFRUOEEyZnVpQXdP?=
 =?utf-8?B?eW5LUk1Pb21zb1ZSVTgxR01VRlV3eEw2RXRKTk1ZWGxBRm5XYm9BOE1vaTh0?=
 =?utf-8?B?OVUwTkRhQk9aWE84dEVQOU1GMXJaTkhLamZhUjRiREdQR2VMZ2tBSkE4RGJ1?=
 =?utf-8?B?ZU1vMW5hbW11ZytraVVEME9HaGhSUUxsbnVwWEVJSUJManpEdE1YZGpYMEVv?=
 =?utf-8?B?VDlZZVllMTlNcDVhOEpoRHVlMWZhWDVQNXZXNDdUN0ZaMC9ydGVFdGdKZmRn?=
 =?utf-8?B?M0dPN1VWMXdTTFZGTHpmbkp4b2U0VFlGdDd2cW01blFIaVkzQlpPd0Y1MGN6?=
 =?utf-8?B?ak81K3A5NDVVNXZ6UWE3aHJwS0xsaUtrM2ZJUVNmM3RVNmhia0dPOFNhOFli?=
 =?utf-8?B?MHp6WHlxdlByMEFvTjBoLytXZ3RHUjVPcWZMVi9TYzNuUHhRUERKZVhQRjF4?=
 =?utf-8?B?aEkxYXd0R3FJa2ZydnBzYWZydkJLdmxFTkk0RERpWjZidDV1U3kva2UwMU01?=
 =?utf-8?B?WUw3R2I2TWw4VGhkNXJiN2FVcGpHcE9yOXQrTVQvQVh1emJnWWFnWmhtbGln?=
 =?utf-8?B?Y1pnT0EyRWZGQnowN3ZuT2ExTlVncVNTQXozdkQ1anlENi84dC9mVHAzdFpQ?=
 =?utf-8?B?dk0yR3dDWVM5eEVoR1J1LzBRNkUxSVBnbTlvVTV1RENIbE5YKzRzdzV3amU4?=
 =?utf-8?B?aDk0UE5rZkFwanFub3pIOHZRS054M251MTVab1RORW5EdFI2cFV4ajVMcTRL?=
 =?utf-8?B?cDFzNHNnQlJiL0QzTTVqUnUyK2RxSjUwZEJMQ1ZQQzFIL0ltWStrK0NNTGp5?=
 =?utf-8?B?Y0t2UkplWG1vYTRJQjFHVm1yWFdKREdVbXdlUUdmVFF5aEZXSFRhSTc4Zlg3?=
 =?utf-8?B?Mkx1aEFSRDNjL2lFcEVFU2QzcVp4dCszeFFCUU05ODZEVWI0VXFLUDlCUWtm?=
 =?utf-8?B?OG9oUytNM3pTUnpSVVdmb1g1K2hleThLbmNJWnN5MytmRWUwcVlRRE8xQUUx?=
 =?utf-8?B?RzZ4RkZFOTJrZGZCQTBXY0V3Z2pxcmJ0QVR4cUpHc3FvdElGdW5vYVNhSks3?=
 =?utf-8?B?L0g5R2U3cHRJVkF0QkZIQ2FuUEFsUDdGM0VOWkFFQ0l2VnpqbWlKMG9CaytB?=
 =?utf-8?B?UnZzYlg2SWdscFdGVjN4Mkx0QTAzYjFIQUJRaUJYMG1McFF3bkhrYmErYnVT?=
 =?utf-8?B?TTMvT3pDSW0vS0J3Wit6Vm9rRzNGSTEwejJBT01QclI1VTh4OVhRUWhabnp4?=
 =?utf-8?B?OHFKaTNiZ2FrTnQ1eXlMck5tUVVaRXRteXVUdW9JcTRBQUZ2ZUpkVTBhdi9n?=
 =?utf-8?B?ZTh0N2gyNC9zV3RSS1A2TWh1bHBFVGVkZVJhekRCdmxKZDVUMnZCdnZlbHJ4?=
 =?utf-8?B?aHNtaFpXbHRMa1lHNDh1ak9zU3RjWXdWdTJwd1NTN1c1MXJjWFlVZjZUOW9W?=
 =?utf-8?B?elNSZmh2V3cwRStEUDhqVXNvQXJIZmR1dW9OeDBWeHB2S1dESkxEMEZydWlQ?=
 =?utf-8?B?SDdUWnlnQ0IrUXBWUWd4L0RobUNHck9raFpxSVZhbi9iNmhGWXIrUHJkNmFY?=
 =?utf-8?B?VVg5bVhOMWk0eHpGMDNJOStDS0FqNGR3SnpMdHV6NUV3OGcyTjU4TlJMZEpp?=
 =?utf-8?B?VnNZSTBTVGVRaFFDTGVzdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0tFaU11d1VXOEp5ajZ3cEZUQ3ZnYlNzTXRqLzNHZzg2Qjhud3RTa1dObVZD?=
 =?utf-8?B?ZFZCLzdTK0FiaHpDcVk2UGdMY0RnQUVqNzBNeXhZaHJ6YTdzbUxLQWg2MjRt?=
 =?utf-8?B?bi9rYndJVXJsby9hYVRDQUhxY0FEa2Y2STJaVERFeDFJVDFYRWV1dmRwNlZu?=
 =?utf-8?B?UHpqWTNXR2J4c2lxZmcxWGFYbHZTQno5ajdWR0NEYmRFWjRPelExeTVqVTlB?=
 =?utf-8?B?bTEveDNsKyt3ckNTbExxVkV6K3BlM3pmZUZsTFdIS2UySFhhWEtSNVRCMktV?=
 =?utf-8?B?K0JMZjhsbHlkWHpOL3NyN2E0THFzV2xHbXZGREx3Z0ZVU2k3eHI3ZCtidzBO?=
 =?utf-8?B?emRGOW9VK3loWGF5TXVBZXVnL1hFeGlTZU45S25seTdXSFZyUE1yRG5MYkxr?=
 =?utf-8?B?eGZDSTR5UjlFL2dJOWxsNnNGNXZmL2FEeU5FVUhqRS9DeHYycTEyL3pyblVF?=
 =?utf-8?B?ZkliU3V3T0IyaGdpUjZOOTJzcDliNFQ5bTRwVnJpbzBkL0tmVlQ5ZGhCaHE2?=
 =?utf-8?B?L3ZIZTBqWlA4dGhBNTFlcUh2MVd0N2tpVVZ4djlPWTlDYSszQndkMkp1S0lP?=
 =?utf-8?B?Mi9GSXgvZlVvRlUrTW5pMGNZZ2tnQ1Izb1ZMdlZ3c3pUbHBhTnFXcGxsQzJy?=
 =?utf-8?B?M3VqcGduQ3pmYTdhUnRZVXg0bXpnUVVZTnc0eTExR2V1eGdkR3g4ZnNNNUd6?=
 =?utf-8?B?RlNLcDg5cU4vS3F4b2Z1SmsxdldLL214RG9CdTdlUVhqUkMwOUdGbG53VHMw?=
 =?utf-8?B?MHQycFh4N1JpMmJmV2s0M2srcW1NMHplemt1OVFhN2ZQSUp1U3ZtN05rditZ?=
 =?utf-8?B?SENDNVlMblFOWXpucHFOaklrd3ZnQzRaOXUvcDB0RGQyYVZydGpFWng4Vi9t?=
 =?utf-8?B?aWJadDRBTmhwRW9MSUFVM0xXRFgwSXVUQkszMGRjZTRoVGlKaTAyRXEzWUFs?=
 =?utf-8?B?c1JUanhqdTA2bGJOSm9DSGlGdERCVlhZRTJEblNQRTAyUE9wNHNzeTdlZXdm?=
 =?utf-8?B?VUhZeFVTZzlWeFFnMnNVS3p0TmRwallPNC9ZREYrSW5JSWJxL3hDSjA4dmVk?=
 =?utf-8?B?aDl4aHdhbnVlS2hiRmt6dy9KTUJTczlIWVRmTHlWcGcvSENLZ2lscVJnUElh?=
 =?utf-8?B?ZENkZTVlM2lFbkk5T2pER0FEQ0FDcDdtRXV0SEx6dHlkTnR4cTVrSGNrSm5J?=
 =?utf-8?B?TjcwV0dTVmlpUzl1Qy9CNk1uLzRBV254ckJlTjhRbHA2S0NjWWR0TG5Taisz?=
 =?utf-8?B?KzIzU01haXpjckRFUWJhMktLbzBCWUtIaUxvZUNpQjI2R0ZtYnFKWXRua2tj?=
 =?utf-8?B?NVhsVGRYY2lNQk1Cb1Q1YTdHdFBTZmQ1VVA2QXNSZ09mVXFNS0lrWHhvZGQ0?=
 =?utf-8?B?VGlCVS80TjVNalRSTXpaanphdjY1cklEcTRWZGRZbTlRZzBZNWx6TzI3STc0?=
 =?utf-8?B?RHBpcnlCcmoxcG05SVM2azhkUWJVN0I5SGZoZG9oVU5SVGpVT3dabHBCamtQ?=
 =?utf-8?B?TUYvMHZNSHR1ZCtNVGRyaGFoeGc4VW43Wk1LUDU4Q3NKbUdPTjVJTGMxOWZY?=
 =?utf-8?B?UFZCUHMrZ0R4ZGdLZGMxQnRWTlZ5K0RSM0pOV2VBWGJRd202OTBTRlNMcnQ4?=
 =?utf-8?B?aDdZUllkRzQvT1dpSHpyTkxTSnIrM0JXZGE4b1pLY1V1bDcvY0orUVU4ZSto?=
 =?utf-8?B?VTJ0R2NEOTcwMG5zNy8rbEdIcDJ5RDQ0Vm5CV2hPakx6SldZSUFoSG9WZ3hr?=
 =?utf-8?B?RnFPRHZRcTZmTjJ3cnBkd3l1R25IMEJ2S01jekVqa3d0NGJVR0FiM1FTUXpL?=
 =?utf-8?B?Y0F4Zmg2Q0NrL1R2UFd0VUxOUVRIaUFpRmgrVHp6SExvWWsxZ1FkM1hVQTR5?=
 =?utf-8?B?UmNSajJheDhQL1p6ZkUzbEhFaGNQZlpid1VzTkNTL1h4YjdLSVJqclc2Y3FC?=
 =?utf-8?B?dHNpTU5PU01NdWhtTGhxUnVvNUxHK3oralJpL0EzUWZ2K21qY2JvQXJXb3Mr?=
 =?utf-8?B?ME5YdGR6cFVod1AwdEE4a01QUXdlam9vZUkvajQvdVFQeXVpb2wvTkdmdlFI?=
 =?utf-8?B?ZUNFVGlDN1hjZEJRKzZDSzdLazR0Y1ZFNXlmK0pMUVpweHNvSU5lQU1qQStp?=
 =?utf-8?Q?YszVrYNAd+hnVSrtt/3Dw/RzQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CeJh8VEDcZQPos/8wdhT2XLvSC6L8toWNtVDoMgDpt5TFy1Q6+nLLRwNFON3amlVZMnhIKtQek4ER0aEDgWMQGOcaZMgP9ZpIcfYIA9DGLgSkapHSPuq97R+Cf2v8gfNmRpU2V+68IBEkN5yvNQE3mi+zvZ29vbjWMq1eE66QljA7BQj0mWYZILVivaHHPmnsBBoYE2i/rYDh3quCfXNB4Rrl/G2js4RSNBiutSgopHbD/Ih8YyqQJt5mNBYuCoJguKR3vwHHqP9N/ecbxNK87Dx6dDp0amqc5T+FlNuXmnt4+Bz8Bftgq9hH9jjbvVnssRSjeAd5vZqQUyqsIvx6zjXhlvc1jc9EBO5YX6T2C3wwp3Ee89wmV6Te7meJh6B1FVE9c7nOMIxPYhyJuCD4f1Ys2/4jz30CChKPLDOK5Y3Ddf/crKSlw6EcHu38WMQ2I6zTztBJsSYdTYDKYhzxt2nkBaaMe9W1IeAEcA+IfbDHq+hbP1T+ewsi74LSsOVrbjlqLrMCp+ab6ria0cOMuQvdgIqgyX+AjdANld9hhey71112icD8rYCrfM1PKBFQsIRcIab8NkFRwRXzU8yY3EszXSo0K/bznFWn9Cz2qM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1852dfba-15a5-40f8-dbbc-08dd1584e57c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 23:31:08.8265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMZJbzJ7E7ttmaoPtM74RVuZumc1mOK4ph4+h+/6u6YHp/3zdCf+0PphNtUzIp9cnQwJURAaWWJcXaGq3uUo2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5595
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_16,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050176
X-Proofpoint-ORIG-GUID: CWbPVYZ5SpAOlczXh--jzzFdiqFCSC0F
X-Proofpoint-GUID: CWbPVYZ5SpAOlczXh--jzzFdiqFCSC0F

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
with the tiniest typo:

On 12/5/24 18:20, Kris Van Hees wrote:
> Instead of leaking dt_fbt_fprobe outside of the FBT provider so that
> there is *something* to represent the FBT provider, use a minimal
> dt_fbt that does the job of providing a hook to the populate function,
> which then will update dt_fbt from dt_fbt_fprobe o dt_fbt_kprobe

s/o /or /

> depending on what implementation is available (fprobe is preferred).
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_fbt.c | 13 ++++++++++---
>   libdtrace/dt_provider.c |  2 +-
>   libdtrace/dt_provider.h |  3 +--
>   3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index da288401..8d8545c4 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -57,6 +57,9 @@ static const dtrace_pattr_t	pattr = {
>   { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
>   };
>   
> +dt_provimpl_t			dt_fbt_fprobe;
> +dt_provimpl_t			dt_fbt_kprobe;
> +
>   /*
>    * Scan the PROBE_LIST file and add entry and return probes for every function
>    * that is listed.
> @@ -64,7 +67,6 @@ static const dtrace_pattr_t	pattr = {
>   static int populate(dtrace_hdl_t *dtp)
>   {
>   	dt_provider_t		*prv;
> -	dt_provimpl_t		*impl;
>   	FILE			*f;
>   	char			*buf = NULL;
>   	char			*p;
> @@ -73,9 +75,9 @@ static int populate(dtrace_hdl_t *dtp)
>   	dtrace_syminfo_t	sip;
>   	dtrace_probedesc_t	pd;
>   
> -	impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
> +	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_kprobe : dt_fbt_kprobe;
>   
> -	prv = dt_provider_create(dtp, prvname, impl, &pattr, NULL);
> +	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
>   	if (prv == NULL)
>   		return -1;			/* errno already set */
>   
> @@ -463,3 +465,8 @@ dt_provimpl_t	dt_fbt_kprobe = {
>   	.detach		= &kprobe_detach,
>   	.probe_destroy	= &dt_tp_probe_destroy,
>   };
> +
> +dt_provimpl_t	dt_fbt = {
> +	.name		= prvname,
> +	.populate	= &populate,
> +};
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index ca8b53df..1e2e844e 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -30,7 +30,7 @@
>   const dt_provimpl_t *dt_providers[] = {
>   	&dt_dtrace,		/* list dt_dtrace first */
>   	&dt_cpc,
> -	&dt_fbt_fprobe,
> +	&dt_fbt,
>   	&dt_io,
>   	&dt_ip,
>   	&dt_lockstat,
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 8f143dce..f62137de 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -76,8 +76,7 @@ typedef struct dt_provimpl {
>   /* list dt_dtrace first */
>   extern dt_provimpl_t dt_dtrace;
>   extern dt_provimpl_t dt_cpc;
> -extern dt_provimpl_t dt_fbt_fprobe;
> -extern dt_provimpl_t dt_fbt_kprobe;
> +extern dt_provimpl_t dt_fbt;
>   extern dt_provimpl_t dt_io;
>   extern dt_provimpl_t dt_ip;
>   extern dt_provimpl_t dt_lockstat;
