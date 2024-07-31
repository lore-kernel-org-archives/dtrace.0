Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCD11401B
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454623; cv=fail; b=eEZrWc6NU4EGmVLr62cmww5Q0Dyr/+009WxUyKK8fQLrRdgU5bJXQ6kbLb7329IGejycZ1+TSRWMpASeKYJUi2+0QH6OGniISCtQnG3fwHb1UrWQ/CN6qzH6sy/MCwAY/6ickmekRFQHkcl0PKYuIUOTAIq8vdTADavQAqPcoHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454623; c=relaxed/simple;
	bh=+pm8QF4rv0fIuq6AOD0ApPTz28h+SHUJD7cIqwid5t0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DnW+QDYEr9BG1Jwh3KIQhUPMdO4JsvvesCuQqOCEMPVK1EXBx2OKIB2APPt6cQdJC+/sUK2fKnYJlFTXoG4ApzpgycutgVbZ7GjVLGlFTziX1M0ai3a8e+vq0VP6QTBp1VuJoR++soDVzjtL+SiEfIHkcQVLZBDWdFlxRC/kY6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e5h9nmQU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EeRZyRp4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e5h9nmQU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EeRZyRp4"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtVlA011991
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=wsuUdO5JaTXBWN+BGBmaJy3qG9aU8IY1WfHMcXmg2zg=; b=
	e5h9nmQUhzzPkgpkxdbR9bDYMstYup8E6G2Dfc5hoJ5ZcAE4Vd/LZP7QTOqeoCl4
	iHO+79gh0P4FmNpTg3dax0mo7oRWew+bvdnZpNRTFEHWARdkzXiKST63tsDy4hEK
	xdyIN6YucSjcjZvDlJiFuewWoruE5ZdaJZ4wAcSb/3ercuyNvSlGTC/W4OaUuhJd
	tETFe45U8CR7JwLkzeQCtxHN+eRVMFOhiE5RW1JSGMtTTnGZVcBVn4p6T+u2qqtY
	GWiylYZZPwP+YT3jIlbS9sfdDRrKOu1Bj6Na1Y7z4K1c3Muh8siRi+goSrq87y4s
	p4qlZrgnMTt23xaUUvzA5w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqtar80k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:37:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VI3OQF019121
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:36:59 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmspmgh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:36:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZ6/dw6sXtL8maLnpuEKC4dtFyI/ZJD4V3hgg0qvs2joFueGzFEYY9ouWPFTfwVw8tWD+/G8ExcdhJtTRxFdfunzGT2/2Esl/CvDkz8nUR2ICM8NDENQKIqBy40HEJkqfw0fbnh+pNImZD7zVM5g2gmI+k9aT6rFx+7KDo5Ks+1tiueepaEXfnTF/4oe/i4BFfgW2g3znqigHwWSmxut2VbogLD/KXJi9lnNIqDPt69a/rPMPCm13kNC9UqznPx4ogsTukdirS39jbf68Ofh81mgwAiJcslVLRIwIJBD1YcJkYL/WWO4xrN82UYA5nUm831I397MR61EBo45RpqjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsuUdO5JaTXBWN+BGBmaJy3qG9aU8IY1WfHMcXmg2zg=;
 b=wNVWPPpRb24aKZZEuk1xVZUTGZ8vXyOAQCnb97i3AkgPdGeuoc7M0q/kTLJiGZJXIi1JR9tNoxG8Cv2ILeVjOPD+4KS1b5RFhFJYYpC3FJSbWwigUlRSjkmiSnzsJ9FCQ4ziVIXQx+cMZ2w9zIUhBwwBT7gfHldHVk0EOK4VoF7k2XHzG+MFB4DB7r15oPTRA214PWgWx9p38QqkTneQR/N7q6qd9X6RR8e6bMUid8r2owEeYd+iAsqxSjdHZKL8nwZreaihyFDlGtwzN5fCq6X24w/Zx3NTEtqy7zzteYUzQE3XUcJmLFKHvslIotaSaRLdorXIzg9Kxx6+fSjsKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wsuUdO5JaTXBWN+BGBmaJy3qG9aU8IY1WfHMcXmg2zg=;
 b=EeRZyRp4i4ZBZBX8u/nsgJeWs7+XaXIOE8kvqA15VzMhTncHguQT5x5sL5Jt8ZmWB3Im4QckvOkI8S3Y1P7qpGPUKORngYfCHDWvtLI25k0NcSP3xMIJ4EbtjTzj59gIfk14SdQw5oGOqaUmMInB1M1H+pODfqBr0jLA2gAwoq8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6178.namprd10.prod.outlook.com (2603:10b6:510:1f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 19:36:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 19:36:52 +0000
Message-ID: <2612a5e1-eba9-d6dc-023e-3f505e797985@oracle.com>
Date: Wed, 31 Jul 2024 15:36:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: skip tst.symbols.c if no /proc/kallmodsyms
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287B34CE377B4B80C34B2BEC2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287B34CE377B4B80C34B2BEC2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0203.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 8362e8d6-0771-4da0-7186-08dcb19820ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NERKVjZCYzRkN0hDMUJIbXp1R2d1SytyVXk3SWl5YUpJVzJpWXExYzNCN29Y?=
 =?utf-8?B?bEhRaDRmMHU1ZTVPS2REcTJUMC9RblhjMTN6MHFUMFgwS0h6eDdkb3JqTUha?=
 =?utf-8?B?UmFXNVFSajJoK3pIanhSakZ5ZHlMRnc3Y2JRUi9nK1B4MVY2b0VDengyMkdp?=
 =?utf-8?B?NkMxVjRFcDNzRXBYUC9aL01BdEF4RTFjR3NPakJxOVBoVVpNVlhXaGZLWVcr?=
 =?utf-8?B?eHVVeTl6VmdQSzh0QXQzcmIyOWZlR1MvU2QwU2doaHBUaEUwbE0xK1dUZC8w?=
 =?utf-8?B?U1Z4bXhyVUhsMXRhQ1RSanoyRXhDZ0IxeTlJU3h1Ry9PV2RBNEdnOVlnWi8x?=
 =?utf-8?B?TEZkQURxSkx2a3E4UnQxOE9rM1NnTS9CcDUxQ3JsNGFCZXBaYzhYOHVJcEZa?=
 =?utf-8?B?eWVaSEVJamNSY3M0S2pPT05WVXUrMUliTnpQa1F3d2VDNTNvMGRkSEVHUlEx?=
 =?utf-8?B?L3FZZkNRRlR1YWl6OTloN1VlalVxWUpkektJQ201NXBmMXFpZUNhTWR2aGxN?=
 =?utf-8?B?WlhTQjJHazlIWDJMYkQySmc4SnNMS0VpblJUZlRkMXdadXM1MUZmckJFd0xs?=
 =?utf-8?B?SXdIbkRkclVpc01iaU9WS0YxVU1mcVhMNDFUMWh5TXF6N0xDeWJwZkxnbndL?=
 =?utf-8?B?MmpPTGx4RUI4SGJDTjE0U2tYbmY0R1c4bXJ2cEJ4cmRURkVpeEFrUFdnekNr?=
 =?utf-8?B?SUFRd2ltSkZIMDhWVXdUbUdZSGpYdFVLd3psNkM0RTRHT1djTkM3bWhsZkk3?=
 =?utf-8?B?YmlaaTlwdjg2ajcwNVF2eDdnTm9FWTZzNnpMMzh0M0JnVkozZ1I5SnA4QlRQ?=
 =?utf-8?B?RmpCVXpFNFRwMmRwYTB3S284TG13ekhNek5LelB4bm1DYTdPZ2RrWktkUEtI?=
 =?utf-8?B?b1pJeEd1Ykh2Zlc0OUVtYlNVeW5QSnlUSm50NmlBMjgyWmc2QTVtU2RjTjdk?=
 =?utf-8?B?dFlQcjNRZ01zdkhCLzh6dEpDbWZvc1RNdzVHODY5aFE5ZTczMTZsb0RoUVJG?=
 =?utf-8?B?QnpMVDVobHJpLzFxR2ZwTEk1a2FYQ0MxQWJSTjlHSVIvdHBsREdqVlk1SzRj?=
 =?utf-8?B?Tm9LZXplV0hqVkFua2dLbHRtZ0kweTdJL2tWYmtTc0lHaURHTWxLWnVjNHAv?=
 =?utf-8?B?WTlTVHl0Zm9aRzAyVG44S3FFQUFDYldPaHNDYkVKeEFTcWw4ZlF0SkE2ZXF5?=
 =?utf-8?B?RE9lbCtHam5EbkNMQ3VhK0hmTWVHVWRwMDVOZ0RoQjBkU0hFY2FpdU5yREdF?=
 =?utf-8?B?M0o5U1VCYVQvclkwa0V5R3VjNk8xM2xmVnNDQnBjTmpXbFl0eU5RdUhVZloz?=
 =?utf-8?B?cDZyS1NodFV6VWhheVZMRXFrQVlZbWlVLyt4OXFJMWQ5WmR5cFhGSnNrSTJz?=
 =?utf-8?B?QW9lcVhrU3BiVjNUeUIwMDBWem9oTG0yY1paOUNFSVNNdHlVbDljakJCMi9U?=
 =?utf-8?B?R1lkWXNFNmhNMXNPbHk1OVZVR0ZrLzlaTUpQT3hyQXlUbytVM3paUG5wMTRy?=
 =?utf-8?B?VUNvc01Pb3B3YWxwanMrL3pCNlZ2RkdpaWRvMld1WHRoajJuL2hWeHZOSEg5?=
 =?utf-8?B?UXRxNEl2VXkvamJQTTY3cjFFMlhQOHUvY0NpSGtkUzUvUjg4aks4bEtSd213?=
 =?utf-8?B?UGJ5YW1VdjJPMDYxS1pPQTc0N1hxbU5sTlB3K0tKUEdwclpNNFltamxKNDFN?=
 =?utf-8?B?NGE1WUFtclFKQUFiWXFvWXJGbGVmZnBQWEJZd2hXR2ozZ1dmWFJBcDNpemxT?=
 =?utf-8?B?Mlh2SHE1ZUJFUERnUkxTK3UyY1NrRVJLWmI0UStCTGNzVEpMUXh5czlqMUo4?=
 =?utf-8?Q?f4i78Wk0Up7k1liLa5v6QFyaf11GbWnUvASS0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TW1qLytUb3IzNnF2V0RDbE9HRE0vdUhZMDFCaVZsUFV1RlRnZ1NhUkRoUFB5?=
 =?utf-8?B?MlRaa1h3Zzczcng0VGNlVElqTmR4YkRPVER1MHJsSHhTOE1UaXdPcHVwM24z?=
 =?utf-8?B?NnZOb0VZT3JkNkhUMVVLV0ZZOG9jTHQrUVhuWSt1TDBuM0ZLZGJtYy9zQVl4?=
 =?utf-8?B?Wll4bWtabmg5TWRTbmpRYkNDOHZjOXJvaEZjS1puTitqN2FTSVQ5elNmSnJz?=
 =?utf-8?B?UmtwSWVnMUgrNzEvK1BTRHpXTGtsWDBHWXZNVGVCR1g0WGFqSm0xcjk3T1Ev?=
 =?utf-8?B?bStCM2lyaHIvWjEzRFhTdXhUdW5IRjkyTzBML1kvZTM4SldBUVFQZXBwQTh4?=
 =?utf-8?B?cG9zTXhFSUxEVHVmZmpiTzBsMEYvQmV5RHlZeFY5clBqOWVaMzhUS0JpYTN3?=
 =?utf-8?B?T094VkpxZ3B1UWNPdEcxQlVXYWs2V1RuRzZyanByM0I1WklKMlp4U2VYaG1W?=
 =?utf-8?B?a2E4eTBOY2orV3pUVWRVM1V4d01qSzVueC9CM202bFgzazJjaTY2U3p2QVZq?=
 =?utf-8?B?REM2MjlIQVdIb05XYit2NitET1ZydDNrWjVpaUtjbEZRcHA0SnkrRWV6NDA5?=
 =?utf-8?B?Tnkzam9nbzg1ZDFVSis3K0x2V0ZiekZnOVNnVUxkRXFDVEx5L1RjRFZPa0pP?=
 =?utf-8?B?WXY5cUVidC92azlZMzBSWVhKc0Y4emVBRmZ0WGhnVUtZN2lyVnNFVmFFRDBG?=
 =?utf-8?B?MmZqUnlpYkoraVpiaHJqckJPOHhodnRDTm43K2kzSHpIVjFyS3ZIclpZZVdG?=
 =?utf-8?B?OHltdTFIQVVkRDdRMjdLbzhqTkpaOWY3ZzNUaVR6ei9oeGo5OHpReWZCZHN1?=
 =?utf-8?B?SGNMczZwYmh4UlJmZHczaWtER25CM2ZIS0Rta0dweHBzb3MxSkU3MktyWmsv?=
 =?utf-8?B?ajNpUWFvTisrMk80azlscVNCaXdESDhub2oxRVlmR0kvbU12dWtUMW43MEZs?=
 =?utf-8?B?SlUreGd5NWNoNkd1UmpXb2ZteTlBYlFRTlphVk9qVklsU1N0dEZIOHNhbm1F?=
 =?utf-8?B?ZDVSdmRaTHNVdVlXdU5LSFJBYkxIWU1ISHlxUk5nODdzRllJMlM3VWNNSVZC?=
 =?utf-8?B?Smc3RFE3eG82ZmcxTFEvOGhXVEt0Qm0xVkE4UDJPMitMQmRYQ3ora1NBQVZG?=
 =?utf-8?B?bnRTZmJPN2Y0WGhMb2Foc3paMjZ1bzBnTE9JZGVvZVR3NmZCUTRjakNOSzFY?=
 =?utf-8?B?dXcyc0owNlNyQTJsSkRLRUY3TkxkWnIvUExvdXJyU1d4RURPemwrYXovbHdu?=
 =?utf-8?B?dGNRQmhJZGZoNEZiUlJjWU14STJBOUVjZXo3KzZXMmd2ZXorelYwNHZlM2tj?=
 =?utf-8?B?RUxpcUU0cmcwYU5KeDh3TUpCVDBNV3FtcFIvRzk1VSs2QlpzNklJdFFvY0pC?=
 =?utf-8?B?bWNkeC9XRmxrekwrK1FOaFpqbkZXZkRQQTJ5QzN5VzU3d21paERBMHY0VGo1?=
 =?utf-8?B?ck1HY3FjdzJGckY1SGdwMnc2dEJ1MnpqNER1Q2c3a1RpR1VjaUkyUFlwS3kv?=
 =?utf-8?B?ZGwrNGZScEpIayt2TGxLYWZOQXIySTcxd1EvbU1uWkk4VWRhR2ZSVGxNUGE2?=
 =?utf-8?B?aUVuT3dPSkI4STQ3eGltSGdSMitTWEdqS05KS2JqQ25ScFlwL3NKTGFkcktn?=
 =?utf-8?B?UVVjWmtRYk5aUnZqZWxqRWJqZ2dsNFhqdFArL2pBa1hWQ2FSNlhNbTkydUlw?=
 =?utf-8?B?Z1BiTEU4SEtwSWJ5aGNXaVFWQXhrYlVJQ2RXNWMwWVVERCtHZ3M3V0w3SGI5?=
 =?utf-8?B?eGZ6L3hiSXR0b3dCaCtndmRUbVNhdVV4UXdibWhTZHdiSUtJN1BWT25vK0hl?=
 =?utf-8?B?dEt2OHZFNmhZTFlnUVgyQThrWTg3cTdrT2liZVd0UDdFMmxxY1hvaDFuRm9H?=
 =?utf-8?B?cUZlUmV2SElES0g3RVNEYVRITXlMYjUwM09DWHhSdGZabWYvY2JrNGwwWnlF?=
 =?utf-8?B?aFZzSVcyenZsbzF4NXpwTHc0NzdJYW1nVkRrSU51R0JaNVJLK1lJU2hvcnZT?=
 =?utf-8?B?RndFVzYvZ1NFU21VNUJQK2lSTHNXZHFoemdpQ0xUZTBnZUxUYWVFV0plc25W?=
 =?utf-8?B?MFZkS0xSRllkYWdFR1oxcC96WXlYK2JVQ3hQeHF6ci9IaE5FVWVDWjBDWXpH?=
 =?utf-8?Q?VgjuGGrZTNwP+vHPEM9UTgxub?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	alVteqIBdzquMIsRkKV8afxXkC50BBWEZrK3WOViAcAPGNeatUG09IEIM+4hsYBwxKJpn0M4VbFkecRJQN+NKjABNr4oa4vzrRxPjxGMsbgMXCJZFN+sLxzbCyVgfzUfxJzoJnttkP0SoVMn/9Y8Ih0YKOJtjm8s0KOjsZWScrNESpHacMA6k/Gh6VKcu/5DUmcwyR8BSZfkniRunFb8kHdYIfaWgZccKCWWzEX7TBjLORquRDoS7CS/0KHl4LKF8z4fzct/HDvFXERhHaS6e7N0xBSiiXJ5I+mVt/XDT1PtMZuCW9d+eLiQLjkvoEoANP800AfcGSOBpzv2PFYMXZKCeW+aHcmQQ8Sexzrqn02nVqlZsQwbfsxH67PgOF/0b8wpul61WDFi3v7pKLlBm223NKuVvxsv8S6f5msPa0hDEC7mL39tKYqw3qyPUQKIUwfcOxrOEZWUEeKYcPY72LErWi/g5S6j3nM5pOo7RviNb/ClwqMz8aGeitKly2U5IcZ5lD1GIrvQQTCn5LnMLBUgTAn/ABVNOR0XaT6L6AYJ2bAiybr3MpmcwyLUYfxvray8MdZcSIq+Bshtgi4V2zIxtzLdeByj+NiDVg93Hqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8362e8d6-0771-4da0-7186-08dcb19820ad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:36:52.2745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQRa0i6ROrUhWWrOgiYqDj7e6LeEPjP+6mpmkIQqTVGZbfSQrEQMW7WdPZ1E1U8LNWHft2vRi/2+Xm/JGJr6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310137
X-Proofpoint-GUID: Lm9INYYEKRW-2QmQhwVLPD1tFWXFtZl1
X-Proofpoint-ORIG-GUID: Lm9INYYEKRW-2QmQhwVLPD1tFWXFtZl1

Should we be adding a version of the test that's appropriate for 
/proc/kallsyms?

On 7/31/24 15:02, Kris Van Hees wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   test/unittest/consumer/tst.symbols.x | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100755 test/unittest/consumer/tst.symbols.x
>
> diff --git a/test/unittest/consumer/tst.symbols.x b/test/unittest/consumer/tst.symbols.x
> new file mode 100755
> index 00000000..e83d97f6
> --- /dev/null
> +++ b/test/unittest/consumer/tst.symbols.x
> @@ -0,0 +1,12 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# If /proc/kallmodsyms does not exist, there is nothing to test
> +
> +[[ -r /proc/kallmodsyms ]] || exit 2
> +
> +exit 0
