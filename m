Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD490313E0D
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279834; cv=fail; b=EGu9IHzV2hQy46U5dk7oeLzzZF0PUY0F4zHWQnrKenqZ9CMMPrWvf8Ja///krSripQWyL/hepgfUMaOkkxDWYuy5yg4gLNocPXAZDKqw8B7ouiegW7v1vv6z8ENCqiACApIrIfAduQYzzO3kTWJqtp3lzNaDukGFzrtL+vPHUig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279834; c=relaxed/simple;
	bh=yXl/tU57f0DrTu2wKwujaQDCQPmC4DsP04Xf41zRiWM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bi5u2nm2rs3p+810x/cfUdz/GOOCwFEzvuPJ1ghQkdzFwP3CFsbOihTdg9ERJkw/6BryIv+e7BBLDJtcxHwR8YpuDQh6q5GTIPwsdEXW3JrQcJHFt1U0a988s1xGRyS6yOPllwoKTOsKg/hWkzIj4Ps5pzv02ShK/h4WSs76h5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GQT+/xcX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SJ3xXDVP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GQT+/xcX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SJ3xXDVP"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLM0Kx007315
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=yXl/tU57f0DrTu2wKwujaQDCQPmC4DsP04Xf41zRiWM=; b=
	GQT+/xcXAj1LxMT0fRpN1fp2IiWTe/oTZjCrk1SGS4+eyzkttqAkXeYV56qMt4xz
	CcU8k0MECJaypzyYkV30pOt5UsxNkBYEiYhh2kIXuHMdVBdfO3Pa9DY3GD4y/G+g
	9P/2I2ABLIoGd/srqFLoHjgMCsuiH+lga00ARHKFPUy4h2IVS8yruTl+ODZD2VeG
	9m6PsO4aF1W9jVnZd8Jde2u8c2Evo9qNtOxtgfs4ljvg7wzy5VKgIL8GjJsqVjjK
	CS6aHVVKPuJaoUDPXOui1OXWgst4YaOLrGBQi1uhtMv8gMa1VA+J0m6AK9gpTBBo
	QobLGSU1NQAGPbi96IIMpQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4janxxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:30:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57R77Fbu014543
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:30:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43adkj4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 27 Aug 2025 07:30:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TS/EiudJovC8AkAdlJAZesRz6KtWBfYaGCu2J7ow5J0O5KDZ83YrejsaG7pDMC+dNnllg0gOzb/VG/dJCWCIdZ5YIVDq0iTuIIdhaooIGzY146DnlB6BIHDAdPhTqdG8GYOCSqLsP3x4s1bhYoO/nIec9BnNjb37Tcl9m/HQcWc7pf+9B24sq+DuEqy0U46ysNgECy7XjBxVKXrS9IQpKr1OrUYJC43yAMqFScOnszXQ+p+Lbj5DwrThotTWBtexNrtqDZDl/9Gk6Jp1fLa3qFSTI9iqxmEsdY9rJDyG/FTO+4sAfCnftKyl64o/qzaYvLM5p+jMqkndOYj6h+LeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXl/tU57f0DrTu2wKwujaQDCQPmC4DsP04Xf41zRiWM=;
 b=RS/aG4JFjr8y1I67DatgvDZZL6JmlZ2TY9lq7ZoSGaLHndwXesVK5ghYesUTdHZEpsBBdBT6cznXciHAEHC/W0XvNkUY6VGhbwZhMBL4+GVE+QfKPHGTDgXpiOuNnr1A79sjMyMUqyg2px7Dj0YVnm/ArOXhogqpXHkqN23lzqoobxZsRRZjiVdXklZvlJyaZ+6hpht29aQ36aEhv4BgXznsmB9IHbeKQ0udulIg2tdGK6QD5AVAcTfzy89bzVOctnWHsBcwn5rzBTVAltupoM5xq443IxQD55T4ohRkZZVSqDlYr11/ooFQUJT65a2/+v++wlHng5k1cC4VKb83EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXl/tU57f0DrTu2wKwujaQDCQPmC4DsP04Xf41zRiWM=;
 b=SJ3xXDVP5agQQfTmJhEU+M4MwjpQZJLlTJdtzdK3YFMWJaLJHiM7XsTKTZ6OtmxfaRiPgux0GtIoHIIWIdC/CKGYA9FSo15t1g0p5VqqOXdpymWuT1ZESfMaTWRYCo/gJQ4+bpwCSBwD+4TMDE2kcx7cH9TZis97DB5plyNIL88=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 BN0PR10MB4982.namprd10.prod.outlook.com (2603:10b6:408:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Wed, 27 Aug
 2025 07:30:22 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9031.023; Wed, 27 Aug 2025
 07:30:21 +0000
Message-ID: <701abf39-eae8-46ef-8e59-5acda727c376@oracle.com>
Date: Wed, 27 Aug 2025 08:30:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tcp provider: support tcp:::accept-established in absence
 of skb
To: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250826131202.632027-1-alan.maguire@oracle.com>
 <99dad3aa-85e6-bd8f-cf58-0e787d8a1d57@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <99dad3aa-85e6-bd8f-cf58-0e787d8a1d57@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::12) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|BN0PR10MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bee908-6289-40c1-241a-08dde53b9481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RFF2V014a2tvODBhUm5ZckkyTzlpdEp5Tm9GNG1GenZqZ0Ixb25MYkVkK25D?=
 =?utf-8?B?ZzhrWG5EREhFR0NXUzVlOHJZYWtHSExKeUt5M2J1amdsUnpZVXZuNlZPZzQ1?=
 =?utf-8?B?Q1pRNmliZkJLWGgxd3FhZlFoZUplVmhDWTM5VDVPWDUrT2lybUpjZmtNOW1H?=
 =?utf-8?B?bmozZklsWENVaGY5N1RTdzhIVmdHRFFFV3p1Q09OZkxGcmhuYlNmdkF1c1JL?=
 =?utf-8?B?RU0vSE14U21lZ2FFb3IyZmJaQ1lUb3BSMkhFUzVBdjh4NXVsQTFweFByVmRm?=
 =?utf-8?B?OFc5dXBjdmdVK2xkRzFoaWY2ZEI4T0pRdGNYd3doU2hWMlhPc3hFVWY2WllQ?=
 =?utf-8?B?TUZaL0QybzUzbERVNFdzaUJSN3RLTWd1WHdUSEN0NUxoTnc0RFlSMzA0TkdY?=
 =?utf-8?B?THJvMmY1YXh1Uy8xaVQvRVVTNHJjV3VHQVdGQmhGbnNTeTQ1c0lxbmRxaHYv?=
 =?utf-8?B?YVFmNk0zWFk0OUYyeEJ4TkRoYkp2MWgzTHlHQTl0WlRkT3ZieFlueXVxMzkr?=
 =?utf-8?B?SWNFOVZmeDFidE1LQUQrOXlMNEptZkg1TU9FYkRPamROY1VDWjlvNEUvMmV6?=
 =?utf-8?B?UWFnNnNzanMyYStUc1YvZEJpZHMwTGhwdElVS2RHcVk1VmZtOFQxTzVqMXc5?=
 =?utf-8?B?dUM1U1RIZmxpR2pMankzZ1VvcHZFUGp3enVIbGR1dlF5MnhjTk5XZkcyT2Vr?=
 =?utf-8?B?VUNJY2VuL2p2cy9DSEZpVVVXUVJldStVSUdoRjh4c1pKTGtxRXJvQk5udzFj?=
 =?utf-8?B?TGJEWVVzcjV0OXpVTmVjbWFzU05oeUpWWGtRcFB6UFY4aXU2N3Rhby9uT3M1?=
 =?utf-8?B?c3F6aWVoQjdyMnUzNXhCYzVwenVvUUxmQ2hlTXJJcXFXWmU0OFFLT3RkcTQy?=
 =?utf-8?B?RXppNFA4TjJGSzk0N1cwU3VwMVFqKzRlVkNkWWZrbGdNcm5UQmlVMkVKNkND?=
 =?utf-8?B?dmNxNGZZZFEvWjJUM2FMbktTZk5hRnc0aVl2VlI3Nys2SGJra0NkelNlbHBO?=
 =?utf-8?B?ZFVXeGFFYzVPMi9GYXBYQ09LaFZ3VUt6blJWa25mN3NhVEM1QXEwYnJGZ2E0?=
 =?utf-8?B?cVJpcXloRDBtRkg2ekp1U1pNbEoxek9WMElvR1lYNlIzRzlJZzFFcVIyUWhI?=
 =?utf-8?B?OThmOVNjbElIZ2lFY3ZPcUxLQVZZWFIrOG10VE4wSkRMYjlrVE12OTliaGhY?=
 =?utf-8?B?N2NpTE92YVVhQ2JGa1R6WnlOdVJvaGZiWmJlUGJUOWl6bVNGZ1k1UytRNXI2?=
 =?utf-8?B?dWtLeUZUbkNNaTFTb3ZxWHZoaUZhc3ZidEoxU3N4VllLM3VlNkhxMVJ3WlJ6?=
 =?utf-8?B?dFRUTFc1SzBHbko4dUFjV0JUQXI2clJjL0J1a1VnQVhLWW41N3VjeWVkV0xz?=
 =?utf-8?B?VWVXdzdRd2dORWNwSy91ZXRYcG43OUZJNTYrOC9DU2QrUS9LM3MvS0czaUw0?=
 =?utf-8?B?WFRkOFp5c09XejZTSU9UOHZlK3dHTTlTa0F2d1Z0NjloLysweko1aTVpZ29O?=
 =?utf-8?B?Vll3c2RoaCs5MnphWTVvQ1IvVnFIem9xS1ZQYy9WTWozbkVRUWhxb1VMdFY0?=
 =?utf-8?B?SjNWemZVZGRkZlI3cnZOVnB1c3Z1dklvVTdJZG5qL0huQkFwTWlUMXJlRUdN?=
 =?utf-8?B?Ry9VMEJQSmc4L3pPVzhHRXoyb2xZN0ZaWC8zZFlBdEFHNGpzL2pHcEM0OGZh?=
 =?utf-8?B?WVpOSEZ3ZFlyYU9Kam9vNVNObjRUZWovYllZd0dWVjlGRHplTzNBMXY5Mkov?=
 =?utf-8?B?NmlMUVQreFpCU05teEs1YmNiOUdHaFB0WThDQlQ2K1VQOHIvNCtBSlVWR3FH?=
 =?utf-8?B?WnE3YnA3bDJzdVU1cVFsdXZuekw2RlYvV3dGa1ZoOUFjdVRHd0dvTFdGR0Zh?=
 =?utf-8?Q?J/R/iXsWlMg5J?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2d4S2dTM0UwSktPbExsSDVoV1NQR25udnFvRmhlWjJRRmowYVBVOE95VDhs?=
 =?utf-8?B?ZXRQRy94K2ExRFZHNklNUVJOTkk4Q1FraGRvQnJ3UWVXb3lnNEFSY0RPYnVG?=
 =?utf-8?B?bzFrU0t5VWNjc1Yvbkl5dHlxMDY1UzRYMkxRcnVkM05HU3ZjdUNwTG5EMjJT?=
 =?utf-8?B?bncvYkhWNmxzK2RxQ2tic1pTb0ROd0dINjN6VE5nb3krRFltbjdYbTVnSWpB?=
 =?utf-8?B?ck9WcFhmaDhvdXhGNnp2VGNRa0ZvQkp5SElpaDVzaUFXdHdLdElDWUxwMC8r?=
 =?utf-8?B?OUpkS2dmakZRcFFrSk94emI0RUtvb052YzZ2QjlETXJtMmoxd2tYL203TUE3?=
 =?utf-8?B?OUQ3LzY2K3dEbkVSUGoyMXozRUpGYVd2REJCa1I5U0pVREI3Yjk3S05sblN3?=
 =?utf-8?B?c0V3UWVJNW9iZXU4bmRnTkJYZXpkSjdtNnd0dVpMQkQ3UXE2RDZWTEkwUkVV?=
 =?utf-8?B?ekF0UGdEbFN4ZjJadFZvM1ltaVFtSFU1aW1hYzc3ZXhWYTRzbWExNVlUcGtM?=
 =?utf-8?B?MGtPZVdKc3p0N1BhQVNoYzl0cEgzdHRyUExaSG9FTjF2SkVUWFFMRDRPR25r?=
 =?utf-8?B?VEZoVHJhT1lnNzFDdm9BTklTOHd4ZDJRVkJRV2dDejRTdDBQNkZaVHQ2b0ZL?=
 =?utf-8?B?Vm9rcm5HV3BUczREV21JVkcvNitDMENlODVIR1A2eE1HZXR4NVVOWU1OOVA1?=
 =?utf-8?B?ZSt3alI4ekxhOW40YUlGTm92MVl1RWk3NGl1WGV4aUhBVUhVZnNRTUpCVEZi?=
 =?utf-8?B?Z00yMlVtRDB2bUdhMFB5RFR6clJlRkFhMlZKQVpMbytOVmhIN2U3dUVjeW55?=
 =?utf-8?B?RmJidDh2NlZtUk54OXZPOExzM3hIU1dVYkxuSzRGNnRrblVtQWtEeDZjMUF3?=
 =?utf-8?B?OU5FUVJNc0RsWG15Tm83KzUyNHFsb01rRkJtUUx2RUVwNmJCMElMazlCNmYy?=
 =?utf-8?B?dytxL0Q4RXArV0dhWDJESE43NjdXdGR6V09IVHc3ZGE0bVdxVnNkS3hGMVli?=
 =?utf-8?B?RHdqOEY5U250ZjFGL2lZNjhWcEpyamtEajZDMEhXVW53QTlrS0NHTDNxa25k?=
 =?utf-8?B?eEY4WW1nWFdVRDlRV29uRWI5MlZjVkZLU0RzejQ1VkZ1MG8zdnlFaW9uc0Vn?=
 =?utf-8?B?K3ozQnoyR0I4aXg3bzJsOXExMnVZTXU0RERKQllXV0R4aXFnd1ZUbExNK1E1?=
 =?utf-8?B?U0tTaHljQU9mZUlHMVFKbk5hcFc4U0NnR0RYSGZQc2Q3Uis5VnVwM2NDSlg1?=
 =?utf-8?B?VGRNNFR5SmZHdWM5a3ZhNExYWHlIaFJUNmt5aW96N1hSSUVNaVhKUS9GWng3?=
 =?utf-8?B?cjQvWXdiNEM5aXFDd1ZVekR0QVhxMnBlbTFSOXJ0VFVqN201cjQ5WmptL2w3?=
 =?utf-8?B?Wkx0djFuaUpwVTJrTjQvbzlCUkQwZ2lKV3dwbit6cTFhQzY3TE0vUkpsTG1o?=
 =?utf-8?B?Um9hc0FtN2EzT3VTRjdma2NrVUJwNDFrellnQzlKa05YN2RQRER3QTlzMXRn?=
 =?utf-8?B?V1JLOE1zc1JkcjVQdWxoSGpJYTFZdzRLREZpd2hWSmprbnBnVUtuRGtKK1pN?=
 =?utf-8?B?YTU3ejlYbE40SC85SDJyMm1pb2RIdDJnMzRBSy92UmVvcUphNWUzRkdJS2NP?=
 =?utf-8?B?b3B6OWtkbmZZb3JUSThOTDkzbHFoVlpOc2VTM05IVnhOZDl0bFRtZXlxN09M?=
 =?utf-8?B?MVExcXlkdVNyMVBoZWgzZFdrMUxLVHhJajduOFd2OUpDVVUvNWlDNmlxWHJZ?=
 =?utf-8?B?WmlhbjJkaHJ4QmJIbUxya1lSMmM2ODhYYStUOFR1WFpmS3NhVzc5bUdyWXk2?=
 =?utf-8?B?UERINFdta213SGFyNEY1Y1VrZzErZ1UxalB2enp2Uk9CRWRTcmh3RVdybG45?=
 =?utf-8?B?QnY0aWY3ME5OY1Vqclg0RVN3MWVZRm9Kc3pmbVJtZVlpVC9YQSs5c1FqMHht?=
 =?utf-8?B?TzhRbkY4MlRKY1R1eXlmMG96Ulg3dG54bnZPT0Jyb0k4UnhQdWRiTkNKcHMz?=
 =?utf-8?B?RG5zV1JId1pSMk1XV3E0Uy9tUWJLL0oweS8wN1NYRm5KTm14bC9OeFZMa3Zw?=
 =?utf-8?B?N3czSHdPaHQ3TnNSSnA4WWZPYjBEM0JlWWJOZ1FhdTk0NzJLLzdUcXFGY1Nk?=
 =?utf-8?B?QUI3eGxqUlpMaFNMVitpMjVOZTZ3c2N5d0lPaHV0alVsQzZVZUJmaWdlWTB3?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3q6aaKCumlgPcpQrMl57HzE4krH+hosVOIgiiQXJxRRLT4hH0nFumwrMon0n+/HDHxUmH2QLICx5718kFGRpcnLuxuAB6QywCgLP5TzbTM6g8+se7WYEAqA4sxoLLw3vzBAR9IG7Mv6LoWEwvkf6KBc07/dy3ntUWG0oRFAur019+yzFlAAVPbfRVTsdWi1VSWag9MotkGzdl6KGT8jg3eUU4AZRlusbw6LSlkHPHYzfgF8yVuqhE/khioQTCZa2LEDnr6+4hbkVH8Yjm0KcSUz2l8nLl7wdMoThtTq13+eX6xhRS9wX/vuYs30WB5PNErWoGWBoSP6Tj/1BmI1a6gKrsnc23bJtEauP1tp8oSSGi8ZF80BP1KlSfOkGNCgiaaMav/rHUZOVYSkPiXNequw6zuY/gqegY1No1tW0pWuxLYbcVBfkZk0/kqo9KyvnM47OwfP9FQ0nzuXbnre1L5h6lxXW6DAcPuK0TzEJYWn2DNB3CdT534AeBzTXCqG6RKwV6JzJ6dCNxZtJlHb/C3hIKuc5VrNmQQUjCAAZe8qf2c7h/u59IvV9x7jpg9sT7Urypv4S+vHwC1Zy/7CXN4piT8+XTddrEXp+dW8kDMc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bee908-6289-40c1-241a-08dde53b9481
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 07:30:21.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 07RPMmZra1OLIFjzC7V3Hc6Hcj2qKLrq8kxkEsHZu2cAUHNLLUgOAKhIRdM44zb/FPDFDJRrO+NuWhDScPLGIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4982
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2508270062
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxOCBTYWx0ZWRfX0TzqvcuUDAi1
 bCV/0GVGONwN+hqO75Tu9NOodLJfopzXbxaBwMIcMsB02LzoVwQXPJooamHFRW2VprCKG6s2g1r
 JzSXckIXevYm8mwUeMq8jX74rkvLhKO5HBCI/kixSon7Vci5aqDSYjbDl7w5KZfPIIRgXjKBqHT
 BiKeqjiuxtYtVhBvp5C+VMlccC2GMhn6GzqxRxHRlSWZkXtHVySBx9v6D2iPt7cuxxmJKaatHMF
 vO7bnhIxjlJQkXquj45ZZAb0uu6ZzyuvXZWBn+qgqEo8u4Hxs3pT6AQ2hDoFgfZuw8W0tCM9Bl2
 JMe6yf7+it4G77rk0M8C7Nhq/ElEDRA4ERxw8TxRnMpkrbWCs7aJvJqOAHeDZiV/Sn0W+u+/dzX
 oKJksQgkiY8XofjoX0RwnNo6EfZ4RQ==
X-Proofpoint-GUID: PoXkQKfWRABxUz7iXh9bPKqvlj9xELp6
X-Authority-Analysis: v=2.4 cv=IZWHWXqa c=1 sm=1 tr=0 ts=68aeb413 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=vbyJIY8eAAAA:8
 a=yPCof4ZbAAAA:8 a=eKbJVaZlo6Yi0SlchPMA:9 a=cfAxYm45D6da2Qrv:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=UXyj_mcEdvtx2GLQwyJ1:22 cc=ntf
 awl=host:13602
X-Proofpoint-ORIG-GUID: PoXkQKfWRABxUz7iXh9bPKqvlj9xELp6

On 26/08/2025 23:23, Eugene Loh wrote:
> I might be doing something wrong, but the tests in question still fail
> for me -- largely unchanged -- even with the patch.
> 5.4.17-2136.346.6.el8uek.x86_64
> 5.4.17-2136.346.6.el8uek.aarch64
>

Hmm, did you have both

https://lore.kernel.org/dtrace/87frdegewe.fsf@esperi.org.uk/T/#t

"[PATCH] cg: fix offset for > 8 bit bitfields in dt_cg_ctf_offsetof()"

and

https://lore.kernel.org/dtrace/2073aa34-9bf7-47a2-1f89-13b17c58fafa@oracle.com/T/#t

"[PATCH] tcp provider: use __ip_queue_xmit() as it is non-static on 5.4"

...applied? The cg patch doesn't mention tcp in the title but it is
needed as it fixes the offset from where we look up the sk->sk_protocol;
without that state-change probes won't fire.

Thanks for testing!

Alan

> On 8/26/25 09:12, Alan Maguire wrote:
>> On a 5.4 kernel, the function we instrument for tcp:::accept-established
>> (tcp_init_transfer()) does not have a struct sk_buff * as argument;
>> that does not appear until 5.10.  As a result we need to fake up
>> the IP and TCP headers from the TCP socket.  We can reuse existing
>> code (ensuring to mark accept-established correctly as an _INBOUND
>> probe) once we fix up references in ip.d to be arg6 and not arg7 (this
>> parameter is used to mark a probe point as inbound, outbound or as a
>> state change).  We need to ensure that args[2] is translated from
>> a __dtrace_tcp_void_ip_t * to get this to work for the IP header.
>>
>> For the TCP header we need a similar solution; add a
>> __dtrace_tcp_void_tcp_t type and translate from either the tcp heade
>> passed in (if non-null) or use arg3 (the socket) to fill out the TCP
>> header info.  We can get the ports, seq/ack and because we know that
>> only accept-established is used we know the flags will just be an
>> ACK.
>>
>> With this in place (along with previous fixes for the TCP provider)
>> the TCP state-related tests finally pass on a 5.4 kernel.
>>
>> Reported-by: Eugene Loh <eugene.loh@oracle.com>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>   dlibs/aarch64/5.11/ip.d  | 12 +++---
>>   dlibs/aarch64/5.11/tcp.d | 34 +++++++++++++++-
>>   dlibs/aarch64/5.12/ip.d  | 12 +++---
>>   dlibs/aarch64/5.12/tcp.d | 34 +++++++++++++++-
>>   dlibs/aarch64/5.14/ip.d  | 12 +++---
>>   dlibs/aarch64/5.14/tcp.d | 34 +++++++++++++++-
>>   dlibs/aarch64/5.16/ip.d  | 12 +++---
>>   dlibs/aarch64/5.16/tcp.d | 34 +++++++++++++++-
>>   dlibs/aarch64/5.2/ip.d   | 12 +++---
>>   dlibs/aarch64/5.2/tcp.d  | 34 +++++++++++++++-
>>   dlibs/aarch64/5.6/ip.d   | 12 +++---
>>   dlibs/aarch64/5.6/tcp.d  | 34 +++++++++++++++-
>>   dlibs/aarch64/6.1/ip.d   | 12 +++---
>>   dlibs/aarch64/6.1/tcp.d  | 34 +++++++++++++++-
>>   dlibs/aarch64/6.10/ip.d  | 12 +++---
>>   dlibs/aarch64/6.10/tcp.d | 34 +++++++++++++++-
>>   dlibs/x86_64/5.11/ip.d   | 12 +++---
>>   dlibs/x86_64/5.11/tcp.d  | 34 +++++++++++++++-
>>   dlibs/x86_64/5.12/ip.d   | 12 +++---
>>   dlibs/x86_64/5.12/tcp.d  | 34 +++++++++++++++-
>>   dlibs/x86_64/5.14/ip.d   | 12 +++---
>>   dlibs/x86_64/5.14/tcp.d  | 34 +++++++++++++++-
>>   dlibs/x86_64/5.16/ip.d   | 12 +++---
>>   dlibs/x86_64/5.16/tcp.d  | 34 +++++++++++++++-
>>   dlibs/x86_64/5.2/ip.d    | 12 +++---
>>   dlibs/x86_64/5.2/tcp.d   | 34 +++++++++++++++-
>>   dlibs/x86_64/5.6/ip.d    | 12 +++---
>>   dlibs/x86_64/5.6/tcp.d   | 34 +++++++++++++++-
>>   dlibs/x86_64/6.1/ip.d    | 12 +++---
>>   dlibs/x86_64/6.1/tcp.d   | 34 +++++++++++++++-
>>   dlibs/x86_64/6.10/ip.d   | 12 +++---
>>   dlibs/x86_64/6.10/tcp.d  | 34 +++++++++++++++-
>>   libdtrace/dt_prov_tcp.c  | 85 ++++++++++++++++++++++++----------------
>>   libdtrace/ip.d           | 12 +++---
>>   libdtrace/tcp.d          | 34 +++++++++++++++-
>>   35 files changed, 698 insertions(+), 169 deletions(-)
>>
>> diff --git a/dlibs/aarch64/5.11/ip.d b/dlibs/aarch64/5.11/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/5.11/ip.d
>> +++ b/dlibs/aarch64/5.11/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/5.11/tcp.d b/dlibs/aarch64/5.11/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/5.11/tcp.d
>> +++ b/dlibs/aarch64/5.11/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/aarch64/5.12/ip.d b/dlibs/aarch64/5.12/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/5.12/ip.d
>> +++ b/dlibs/aarch64/5.12/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/5.12/tcp.d b/dlibs/aarch64/5.12/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/5.12/tcp.d
>> +++ b/dlibs/aarch64/5.12/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/aarch64/5.14/ip.d b/dlibs/aarch64/5.14/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/5.14/ip.d
>> +++ b/dlibs/aarch64/5.14/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/5.14/tcp.d b/dlibs/aarch64/5.14/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/5.14/tcp.d
>> +++ b/dlibs/aarch64/5.14/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/aarch64/5.16/ip.d b/dlibs/aarch64/5.16/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/5.16/ip.d
>> +++ b/dlibs/aarch64/5.16/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/5.16/tcp.d b/dlibs/aarch64/5.16/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/5.16/tcp.d
>> +++ b/dlibs/aarch64/5.16/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/aarch64/5.2/ip.d b/dlibs/aarch64/5.2/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/5.2/ip.d
>> +++ b/dlibs/aarch64/5.2/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/5.2/tcp.d b/dlibs/aarch64/5.2/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/5.2/tcp.d
>> +++ b/dlibs/aarch64/5.2/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/aarch64/5.6/ip.d b/dlibs/aarch64/5.6/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/5.6/ip.d
>> +++ b/dlibs/aarch64/5.6/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/5.6/tcp.d b/dlibs/aarch64/5.6/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/5.6/tcp.d
>> +++ b/dlibs/aarch64/5.6/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/aarch64/6.1/ip.d b/dlibs/aarch64/6.1/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/6.1/ip.d
>> +++ b/dlibs/aarch64/6.1/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/6.1/tcp.d b/dlibs/aarch64/6.1/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/6.1/tcp.d
>> +++ b/dlibs/aarch64/6.1/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/aarch64/6.10/ip.d
>> +++ b/dlibs/aarch64/6.10/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/aarch64/6.10/tcp.d
>> +++ b/dlibs/aarch64/6.10/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/5.11/ip.d b/dlibs/x86_64/5.11/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/5.11/ip.d
>> +++ b/dlibs/x86_64/5.11/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/5.11/tcp.d b/dlibs/x86_64/5.11/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/5.11/tcp.d
>> +++ b/dlibs/x86_64/5.11/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/5.12/ip.d b/dlibs/x86_64/5.12/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/5.12/ip.d
>> +++ b/dlibs/x86_64/5.12/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/5.12/tcp.d b/dlibs/x86_64/5.12/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/5.12/tcp.d
>> +++ b/dlibs/x86_64/5.12/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/5.14/ip.d b/dlibs/x86_64/5.14/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/5.14/ip.d
>> +++ b/dlibs/x86_64/5.14/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/5.14/tcp.d b/dlibs/x86_64/5.14/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/5.14/tcp.d
>> +++ b/dlibs/x86_64/5.14/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/5.16/ip.d b/dlibs/x86_64/5.16/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/5.16/ip.d
>> +++ b/dlibs/x86_64/5.16/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/5.16/tcp.d b/dlibs/x86_64/5.16/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/5.16/tcp.d
>> +++ b/dlibs/x86_64/5.16/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/5.2/ip.d b/dlibs/x86_64/5.2/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/5.2/ip.d
>> +++ b/dlibs/x86_64/5.2/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/5.2/tcp.d b/dlibs/x86_64/5.2/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/5.2/tcp.d
>> +++ b/dlibs/x86_64/5.2/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/5.6/ip.d b/dlibs/x86_64/5.6/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/5.6/ip.d
>> +++ b/dlibs/x86_64/5.6/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/5.6/tcp.d b/dlibs/x86_64/5.6/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/5.6/tcp.d
>> +++ b/dlibs/x86_64/5.6/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/6.1/ip.d b/dlibs/x86_64/6.1/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/6.1/ip.d
>> +++ b/dlibs/x86_64/6.1/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/6.1/tcp.d b/dlibs/x86_64/6.1/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/6.1/tcp.d
>> +++ b/dlibs/x86_64/6.1/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/dlibs/x86_64/6.10/ip.d b/dlibs/x86_64/6.10/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/dlibs/x86_64/6.10/ip.d
>> +++ b/dlibs/x86_64/6.10/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/dlibs/x86_64/6.10/tcp.d b/dlibs/x86_64/6.10/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/dlibs/x86_64/6.10/tcp.d
>> +++ b/dlibs/x86_64/6.10/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};
>> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
>> index a191efe1..44ed2bc9 100644
>> --- a/libdtrace/dt_prov_tcp.c
>> +++ b/libdtrace/dt_prov_tcp.c
>> @@ -72,9 +72,9 @@ static probe_dep_t    probes[] = {
>>   static probe_arg_t probe_args[] = {
>>       { "accept-established", 0, { 0, 0, "struct sk_buff *",
>> "pktinfo_t *" } },
>>       { "accept-established", 1, { 1, 0, "struct sock *", "csinfo_t
>> *" } },
>> -    { "accept-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
>> +    { "accept-established", 2, { 2, 0, "__dtrace_tcp_void_ip_t *",
>> "ipinfo_t *" } },
>>       { "accept-established", 3, { 3, 0, "struct tcp_sock *",
>> "tcpsinfo_t *" } },
>> -    { "accept-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t
>> *" } },
>> +    { "accept-established", 4, { 4, 0, "__dtrace_tcp_void_tcp_t *",
>> "tcpinfo_t *" } },
>>       { "accept-established", 5, { 5, 0, "void", "void" } },
>>         { "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t
>> *" } },
>> @@ -166,8 +166,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>       dt_probe_t    *uprp = pcb->pcb_parent_probe;
>>       int        direction, have_iphdr;
>>       int        skarg = 0, skbarg = 1, tcparg = 0;
>> -    int        skarg_maybe_null;
>> +    int        skarg_maybe_null, have_skb = 1;
>>       int        skstate = 0;
>> +    dtrace_typeinfo_t sym;
>> +    ctf_funcinfo_t    fi;
>> +    int        rc;
>>         /*
>>        * We construct the tcp::: probe arguments as follows:
>> @@ -258,11 +261,24 @@ static int trampoline(dt_pcb_t *pcb, uint_t
>> exitlbl)
>>       }
>>         if (strcmp(prp->desc->prb, "accept-established") == 0) {
>> -        direction = NET_PROBE_OUTBOUND;
>> +        direction = NET_PROBE_INBOUND;
>>           have_iphdr = 1;
>> -        /* skb in arg2 not arg1 */
>> -        skbarg = 2;
>> -        skarg_maybe_null = 0;
>> +        /* on older (5.4) kernels, tcp_init_transfer() only has 2
>> +         * args, i.e. no struct skb * third argument.
>> +          */
>> +        rc = dtrace_lookup_by_type(dtp, DTRACE_OBJ_EVERY,
>> +                       uprp->desc->fun, &sym);
>> +        if (rc == 0 &&
>> +            ctf_type_kind(sym.dtt_ctfp, sym.dtt_type) ==
>> CTF_K_FUNCTION &&
>> +            ctf_func_type_info(sym.dtt_ctfp, sym.dtt_type, &fi) == 0 &&
>> +            fi.ctc_argc > 2) {
>> +            /* skb in arg2 not arg1 */
>> +            skbarg = 2;
>> +            skarg_maybe_null = 0;
>> +        } else {
>> +            have_skb = 0;
>> +            have_iphdr = 0;
>> +        }
>>           /* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
>>           emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
>>           emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
>> @@ -289,10 +305,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>       } else {
>>           direction = NET_PROBE_OUTBOUND;
>>           if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
>> -            dtrace_typeinfo_t    sym;
>> -            ctf_funcinfo_t        fi;
>> -            int rc;
>> -
>>               /* Newer kernels pass the original socket as second
>>                * arg to ip_send_unicast_reply(); if that function
>>                * has an extra (> 9) argument we know we have to
>> @@ -344,10 +356,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t
>> exitlbl)
>>           emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>>       emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
>>   -    /* then save skb to args[0] */
>> -    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
>> -    emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>> -    emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
>> +    if (have_skb) {
>> +        /* then save skb to args[0] */
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7,
>> DMST_ARG(skbarg)));
>> +        emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>> +        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
>> +    } else {
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
>> +    }
>>         /* next save sk to args[1] now that we have skb in args[0] */
>>       emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
>> @@ -358,34 +374,37 @@ static int trampoline(dt_pcb_t *pcb, uint_t
>> exitlbl)
>>        *    skb_network_header(skb)    =    (include/linux/ip.h)
>>        *    skb->head + skb->network_header    (include/linux/skbuff.h)
>>        */
>> -    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
>> -    dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
>> -    if (have_iphdr)
>> +    if (have_skb && have_iphdr) {
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
>> +        dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> "head");
>>           emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2),
>> BPF_REG_0));
>> -    else
>> -        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
>> -
>> -    if (have_iphdr) {
>>           dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> -                 "network_header");
>> +                       "network_header");
>>           emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2),
>> BPF_REG_0));
>> +    } else {
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
>>       }
>> +
>>       /*
>>        * tcp_hdr(skb) =
>>        *    skb_transport_header(skb) =        (include/linux/ip.h)
>>        *    skb->head + skb->transport_header    (include/linux/skbuff.h)
>>        */
>> -    emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
>> -    if (tcparg) {
>> -        /* struct ip_reply_arg * has a kvec containing the tcp header */
>> -        dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6,
>> "iov_base");
>> -        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>> +    if (have_skb) {
>> +        emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7,
>> DMST_ARG(tcparg)));
>> +        if (tcparg) {
>> +            /* struct ip_reply_arg * has a kvec containing the tcp
>> header */
>> +            dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6,
>> "iov_base");
>> +            emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4),
>> BPF_REG_0));
>> +        } else {
>> +            dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> "head");
>> +            emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4),
>> BPF_REG_0));
>> +            dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> +                     "transport_header");
>> +            emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4),
>> BPF_REG_0));
>> +        }
>>       } else {
>> -        dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> "head");
>> -        emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
>> -        dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
>> -                 "transport_header");
>> -        emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4),
>> BPF_REG_0));
>> +        emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
>>       }
>>         if (!skarg_maybe_null) {
>> diff --git a/libdtrace/ip.d b/libdtrace/ip.d
>> index 493b75a0..95520b4a 100644
>> --- a/libdtrace/ip.d
>> +++ b/libdtrace/ip.d
>> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>>    * In some cases where the ipinfo_t * is NULL we wish to construct
>> IP info
>>    * using the struct tcp_sock * (arg3).  In order to map local IP to
>> source
>>    * or destination IP address appropriately we need to check if the
>> associated
>> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound
>> (NET_PROBE_OUTBOUND);
>> - * the value is stored in arg7.  If inbound, we map the local IP
>> address to
>> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound
>> (NET_PROBE_OUTBOUND);
>> + * the value is stored in arg6.  If inbound, we map the local IP
>> address to
>>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>>    */
>>   #pragma D binding "1.5" translator
>> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>>           "<unknown>";
>> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>>           inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
>> -        inet_ntoa(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_daddr) :
>>           arg3 != NULL &&
>>           ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
>> -        inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
>> +        inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>>           &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>>           &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>>           "<unknown>";
>> diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
>> index 48d9adb4..8f87aa57 100644
>> --- a/libdtrace/tcp.d
>> +++ b/libdtrace/tcp.d
>> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>           (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>>           ((struct sock *)T)->__sk_common.skc_num :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->dest :
>>             ((struct tcphdr *)arg4)->source) :
>>           0;
>>       tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>>           ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>>           arg4 != NULL ?
>> -        ntohs(arg7 == NET_PROBE_INBOUND ?
>> +        ntohs(arg6 == NET_PROBE_INBOUND ?
>>             ((struct tcphdr *)arg4)->source :
>>             ((struct tcphdr *)arg4)->dest) :
>>           0;
>> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>>   translator tcplsinfo_t < int I > {
>>       tcps_state = arg3 ? ((struct sock *)arg3)-
>> >__sk_common.skc_state : 0;
>>   };
>> +
>> +/* Use struct tcp_sock * to fill out tcp header info where we do not
>> have
>> + * an sk_buff with struct tcphdr * available; currently only used for
>> + * the tcp:::accept-established case where the struct sk_buff * is not
>> + * available on < 5.10 kernels.
>> + */
>> +typedef void * __dtrace_tcp_void_tcp_t;
>> +
>> +#pragma D binding "1.6.3" translator
>> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
>> +    tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
>> +            arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
>> +            0;
>> +    tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
>> +            arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
>> +            0;
>> +    tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
>> +          0;
>> +    tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
>> +          arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
>> +          0;
>> +    tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
>> +    tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
>> +    tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
>> +             arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
>> +             0;
>> +    tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
>> +    tcp_hdr = (uintptr_t)T;
>> +};

