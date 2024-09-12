Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142E188925
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 18:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726167069; cv=fail; b=DiFJj/AIaFx0EUsIMjyUHLKPpndU+Bgqq3PDPnbn0G1xk84NgcvxqGpaFfqQ3U0IAHyRdYAlV7lhMC29JtTMkc5wvto3Ff84zmTmNLyNg8wEm46hB+OnZlI633vuzWiwXaBGXuMjN3XnkjSQjKndvO63eoERvY9bVoevI7hF0kQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726167069; c=relaxed/simple;
	bh=2wKDTyglPZCsOXl/CqtFnNhmMn34VAOlJSvEkEv8ahs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OuxhHyNRJqaAtwK5aeFelOgdbtWswLkX2GBnha43m5QnyIIw8iPm2gSyBZO5XAU9kMhPmkL3wbJRDiw9wzRVNun2ZiNYjgDCbBYqABLJwFOgdZQwmVDJzPgAAoPGcDgyDds9nW4y1+sqFKmEXxnMwH8DTSfi6Ruu5VHUwL7XEOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gevu/xRd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CHu9Qf2F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gevu/xRd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CHu9Qf2F"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CIfb7B009509
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 18:51:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=EUJEIA39tJy8o+DvYQxaW11Yza/K6cjlwm0nMZ7PzFI=; b=
	Gevu/xRduzEfTgUIQtsPYqRfmQfUcxefaRpMSx5dyEMJwrAMsOfHLYBTcnnHI2oR
	k0w8kmsnJplEzjy88GKGRSjsevChmYpIExUl9ZsEakgjvEHfxgg6yQVf9sj6Dfry
	DGIlpSrrresmPSUX1hXS5ho5K2Y0AYibloOBYrx1hyC55/t1nOe7OxkMZ7SGdBEf
	dq7Iyb4REGQHyl2ICb+TarxxDUSPmHO5KLXS3Ycc5fLYwlOzvalBQAsqOovU60BL
	QvRNbKm7+wv9jeOeE9G2W7nhBBNNuYi5YTOESIDsvC9N+zsgzTZ2HjkDEfCq13gs
	lFZ2EWGCENotIUxsWAR2cw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdrbbqwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 18:51:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48CHpuFL033626
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 18:51:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9bpnqx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 12 Sep 2024 18:51:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6tl15TRfjXAgnnKprN1jLf5uIMvazlIc6HLZF73bDP5w4NY3KQflAI9AYKYAELlJPBxVN3SzaU7uDZ84cVvPCYMWcLCfHYPOD0BW529HmO3YGFiYn0acy4Sg7jm7o4+k6aXZFRpu/LkSGHxmTpgb9Gx3RO96hKJOsf0fUxpp9DUwOICA+Mqk3AbPp9pPTG0QLV3yamBmTzqIPddCvMf82AxyooMl7pw2QVpaXzPSSeANFgl9/SDPZObOXKEWGo1Jy9hK1aF/M4H9h099SrWGhxTdk4jhv7jqc4yY26hQmatTF5o+0DY1UxLOFz5KJH2lZEfwZVU678P7DY5e+PZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUJEIA39tJy8o+DvYQxaW11Yza/K6cjlwm0nMZ7PzFI=;
 b=MQgIWHS7xGrwvIja3sqfbfAk+RlxNYji+mLv+NVOo/PvmrxgOzKgR3LqDFK2FDpX28MMK3y4caSsUgTgxWFshz57L4GLy6qA1ZBiXJU090ZWdxbuQz1hfM94QZfLHaG3+waaK0eLh9m9SxgmOQV7uMculD5IfsluwjAmcn091r1hD7nK16xFlDmRztC+n/S+PNPYMk7RId80IUC57C1mXM7gir1BJOSFf3W9UoJElda1i+rIYNAyZVklh10WR4rJQe3DvzBhnA7kwMm6kyO9uDKieKauWpRcaxg4oW0iyHlHVsHTO9MM7/6PhwhgBhcI35/Y0iLeS+cJpCKqAmfcVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUJEIA39tJy8o+DvYQxaW11Yza/K6cjlwm0nMZ7PzFI=;
 b=CHu9Qf2Fkwp6CSvLCNCaZ8YFOWp3L41XubzvAUSSRgisMAUj7J16ooLGKjC7rSo06iOf7thgAo8JQZjMu9cAfIAoM1u8PPHsO7MWnqQDizsm/iqvmy83WK8mQ5WbXqvmAgNo1BCykye/TprA1uIvKvWc5JMCgi9v2Z1XqYfmA+0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB4852.namprd10.prod.outlook.com (2603:10b6:208:30f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 18:51:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.003; Thu, 12 Sep 2024
 18:50:59 +0000
Message-ID: <31f0307a-ab17-93f5-bf36-d8d3be8ae590@oracle.com>
Date: Thu, 12 Sep 2024 14:50:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] error: ERROR probe firing should not corrupt probe
 arguments
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <SN7PR10MB62876065F551A5ADC0AE998EC2642@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB62876065F551A5ADC0AE998EC2642@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0205.namprd05.prod.outlook.com
 (2603:10b6:a03:330::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: 851d781d-1592-421b-6824-08dcd35bd7c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejFlQTZJNXA1K0xwWElVZmZZMUcxTkZ2V2lRK1BUaWJNdyswTC94Unl0T1NI?=
 =?utf-8?B?K3J0TElGOEIwUTlWZ3lMSm5LcjRsU2ZFc2V3Vlp4aXFyTldMeUZ2aG1kazVj?=
 =?utf-8?B?RkttTmRDamtvdHlpejhpN3I0dXZsV1BJckpSVUtLNlRKRzVzVUE2M01DQzRF?=
 =?utf-8?B?ZU9wQW1yVzJ2NjAwTGZsSlRQMkhxMjE0NkR5WElaUnA1RktEcFFrM29zY3Fk?=
 =?utf-8?B?VjU0U1FJYjhGOVFiMGJZV2t5TVRXako4ai94eUh1MU9uVUdIMW43bUNuRFgv?=
 =?utf-8?B?ZUw4ekVLTHFBR3VFL29HakF2V3EyNHY2UVlvaW43NmZsN2JUVy9STzVlN3JR?=
 =?utf-8?B?R3FrVEJvb0VhNXZvaHBUWlo4S3V6djdFaktkamI4cXAvK3FybWJpSS9TTHcr?=
 =?utf-8?B?UnIyTVl0MG8yK3UwRVdlMXo2SEZ6SHA2ZnRjMG9nWmVBMk9kMDhhMXZzUjI4?=
 =?utf-8?B?TmVCR1JzYmFjYWxWaUFyUEs5bkZheTEzWGJkS3hBTldpNVBnTmVxU2JzdmxH?=
 =?utf-8?B?dHJvVXdvNklWRWE5b2RNdDRNL0xUclFvYkJVb1MyUTRhcVQwVzMyalJSNkpr?=
 =?utf-8?B?R1lUUnFuZUlpRkVuL2ltTnhLU0VCMHErK1pUSmRBcEVsMGo4RStBdjZ5MEh0?=
 =?utf-8?B?c2FrK1lyc0pXV3JHY2I2ZThxc0piSVlNVUhNOHBsMUdPM2s5d2tnRUIzSjNX?=
 =?utf-8?B?dmkxeU5qWHl2VG9WQ1hnUHI5cW4zMEttbUNQOTZHMURoQmlwWkw1M0k5dVRJ?=
 =?utf-8?B?Tk9qbWowUmx1UUt0My9Ic0hna0l0T3NvbmtUS3B3NUlBZ0owUGFOU2JZU0NN?=
 =?utf-8?B?dERTeWZMSXNRKzJnQjZyZENNZWtra1NoYmpvdXF4cmtoWnI0NTkxSktZNHNP?=
 =?utf-8?B?Rzd2VG1wQ2htUFBSaTRXUmEwbkIwZi9IMHQ3Qk41NTlSZ2FsRDhyV2VVWDRo?=
 =?utf-8?B?SVk4bU1UdHZ6cExhTEVYOGExSFBOeWU5VEZWakI0bkxVYTAwQ0JRZnl4ZVNr?=
 =?utf-8?B?WjJLZ3RocWxHdEQvK1V0ZUZnQ0trRXN0ZURjY2E3L1JMMzl4RmNmSTNXZUtF?=
 =?utf-8?B?aUFTZ0xWWDFQaGVhUmVOdEdnTXNTYVhQRHUzYUp6dmYrbWJNYVhDRG9JeFk4?=
 =?utf-8?B?Z3pSczV2ZmZxWkNQbDExSnI3NlpiN2ovNnRPKy9zTmo3V05paG5XQlF1K2N6?=
 =?utf-8?B?cU1jSDJvZG9lZVZOZDYzZDNoWXdHZ2lXdlRFMDFheVVWd1NnSitMTlVMekcw?=
 =?utf-8?B?UHdRNGtnRU9EbWVWM1FkTU96d0RsTHpscGtRVG5ad2I0WEtGYnVqV0gvSElJ?=
 =?utf-8?B?TnQ0OUVwUjh6Y1g4QVduTWE0byt3ZUVqSlJVT05LaXcxclFDbExuRGVkclJo?=
 =?utf-8?B?MEJiNjNvYno5T0QrcmhDVkxtRW5DSFlNdERMT0pBV004OWtBOGRZT2tiVkZO?=
 =?utf-8?B?RlhnZS80TVVmQnhwOTRpMi93VW14TDRMY09McXl1NC9kd1hxWTZGNCt2bm5q?=
 =?utf-8?B?WHNhSW1pQnBkaE9YVjFWY204NWdOUGI5Y3pUeEFiK2w0VXhmbFFQalQzZHla?=
 =?utf-8?B?bHg1NGN6MktIK0NKSXlOUWIvQ1Q3a3NzTUhMbkNZSEtWcjhYTkdBU0d1czg4?=
 =?utf-8?B?NUFQcXYvdVU0Qm43eitPa2QvdXVWY0FBRUJsVVhrbndOWXJRTDlaQ1VWTTQy?=
 =?utf-8?B?SzVna25DQVhrY0VnRm9kOTN5NlBTc1gvSCs4aW04Vi8zVEpiWlFLeFRlc1k3?=
 =?utf-8?B?aWdQSGM2cUFmODJFKzBjV2FvYWNNd1F4NXVleW45d3hXcWNQYUpSQVNTWkpN?=
 =?utf-8?Q?HIXeXyZsp04ygVdTz+HAJLeCDVwypu8EGAqq4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzMvRGdtREhLT2lBZFlSN3EyMTBqRzBlQUsxVC9kSHhBRnIyZndZaUlLNXRB?=
 =?utf-8?B?RGdlM2VzOElVRnZXRDd2VDdjejVFb0JrMldTRlJnZ1VTdHk5RGdwakRDc2tk?=
 =?utf-8?B?VVpmRU5nRG5RL3F2SWtCT0EvTlNiTzRWRWZBSjZ3RWhzN3EyUndTTEpvelR0?=
 =?utf-8?B?RDczOXNjMUtENHVqbXdtbVIrOTY1czFpSFM3bndLWlkwVTBwOTE4UVowazV1?=
 =?utf-8?B?SHBsOVNYbHR3YnlteFJOVUFsdk1BZUdWdVMwZUpkTkRvQVRtWnJOMEZ0N3dO?=
 =?utf-8?B?UnByTW5PREJGQ3ZLZTlZeVhIalhCd1FQRDFpZ3Q5MXhvMmpQT05MSzdzSS8y?=
 =?utf-8?B?Z1R5dnUxaDRsWXhScDZGelE2MDVld1ZoYVJHN0g4NU1odWkyVVV2VS9TZGdv?=
 =?utf-8?B?TnpLcHhkYUdpdHIvckptOGNGaTF3YnRpcTZQOVJ3MktSUUllMFEwelQ1OTJy?=
 =?utf-8?B?RzFGVTJuTXJmOEJ6WlpsU3J3bkNHa0tTL0JUSnZua05scTJ5blRXL1JMTG5o?=
 =?utf-8?B?KzlYTW1CTWk0L2lCSnlrUjJ1L2VtOE5qNTFnWER0YkJDTUNCWlk1UEx0dzhK?=
 =?utf-8?B?azdhSW5ZUW8yYmtuRVRYQUt2ekk4SXZhcm1XZ2hQYXk0cm0ySHRJY2gxWXpm?=
 =?utf-8?B?M2hvbXJVVjRzeDlHSXk0RE5JYy8rTTBycm9TaGZyS1FWczBDVjVqY0s3K0hT?=
 =?utf-8?B?a3hIajcwalNtc3UxOEZlbHJLZmg5THREdEhQN21HN29uaXZnS281ckdZUm5H?=
 =?utf-8?B?V09PK3EybXUrSm1Hc2Y1VWJGVnBERlNONGVqc20wb0UwTC85QklIZ3FnMlI3?=
 =?utf-8?B?ZXlSRUtGdUZoUDE3MW9RZmNLTzhZOE9aTVZLNERwcUxrWGUzK1JMNitTN1Vw?=
 =?utf-8?B?Ykt5QjJiUjFrNDRzRkwySG80eGYraG5rOFJ0YWE5bTlwUUhhRHVtRXlzamJn?=
 =?utf-8?B?eDQrK3hUS3JWK3QzS1Rob1ZlcW9NNEpzNThlbDV0Y2MyY3NvNk5PQk5KVUFB?=
 =?utf-8?B?ekRjQjRRZGtMR0duYVdFbHJaM01mQjJKeUJCd1pJZno3eFJkdXJYekhveVJn?=
 =?utf-8?B?OWlySEMxTU1jQTRYU0tRcHN0ZmhNVVZud0dxanZlNGMwRUJEQytnWVg3MHo0?=
 =?utf-8?B?TkxsM3Zhbk9jQTlRYzFoMlhOL3FCTkQxNE9jcUdPQnliUWJNK1VOejVNMU44?=
 =?utf-8?B?WU1tK2xxa2hBUUV4aDJBMXd6MnU1ajZsek1rMnppZDkzN3o1dVpkMFBJMnNR?=
 =?utf-8?B?TUdqNHpIaWtzc0hhVXRJRFdUNkh6UlFXckVlVDlYWnJFcDB3NEx1RkJac1VP?=
 =?utf-8?B?TnNxV1pmNUlrMVFBelJQVDNwYitBMDFFTGg5YVdSQzhyUWh6Yi9QK1RvMHk1?=
 =?utf-8?B?QmlqUUFtQmNjTXNVSTBOcFNUbjVpOG0zb2dHcVNQT2Zyemg3bHI0U0JJQ3lB?=
 =?utf-8?B?ZGxHYlVIN2Fjdi9TL1l3ckczNWh2cWhPUEtHZ1pxSTFrTHNkanlReGozTGdk?=
 =?utf-8?B?S1RwMzhackU2QTFlZVJtazNRTG9mQWY4TGYzR2VqeXR5aUtpYU5NTDZZUkx6?=
 =?utf-8?B?WHJTYWlkUXFnOCsyeWlrY09MalJXTXlvYmZtMkI5SHVwVFBtcldOdDBQa2U3?=
 =?utf-8?B?VDc5eDBZWUNIblJ2K3BEYTdLSUdFeXFzeDJTS2lWaGNqU213NUtxTUY1S1FG?=
 =?utf-8?B?RTZHUUVZSWd5Y0pJb3Y1dkVCU3dxTEpnRytFTU1INEJNOFFtZDlDeWxtNHJX?=
 =?utf-8?B?SVB3L0NYSjF6ZnB0UE9nODVVaHY5SS9TdWxTcC9BYkI0UElEQUlMbEdyelJT?=
 =?utf-8?B?MUk1VmxtV2xTNVMvNGwyT3hNV2Q2UGs3STJReEZtOEFqMVpIalVtbXZPRWdo?=
 =?utf-8?B?Zkh4TGh5SlJBQ2xIL25DSUNCT3cweVlBQllSQnNTQXlJVkZOV1ZlN3VYTXZ4?=
 =?utf-8?B?UjJLNFk2UGhvY3BuZllrTlJ1TnE0TFRxQmU1dlFxTkQ4Z0thWVBicjNTTmRo?=
 =?utf-8?B?Q1F4Ry9nZmM0R2xLd2Y2THluYjV2K3YxazV6bGprWnNMc1VvTlNzZGdzMzgz?=
 =?utf-8?B?dVpLUElkdUc4MGxtNFNmNU45TzVjSk1jaWJqb29yVFRTbG1iOW1xWnpvUjBX?=
 =?utf-8?Q?TjGWXSY0ncBSdbfm3acUy5u2I?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K/BWGh3P2dS3cm2AN0/G13cds/1PTslYI/xFyhj/lZr0c/P9VIYd4ql3guWeuH32WFaDmqkR+BX0Q5jJdcKDVij8tQg6qMEX5ViZ/vh2HVEtJHSGiAHpAh66jj3qhYJO8dQD2xHDw52pCCOy3ZhBoNdW4bY6tIYhTwbSudyY1bgg+LePXEwWcN+l3RDik9gJcRzrkL8QwY4/+HZ7RAJdpb38dDiqcmPd43ACG5f1oO+n6WjVorVCVvDZ+y+G16+FMwV/qTjZ1+2AyeOf/YW9nyVQTSCfPqOGrwSTl+OgL1VLJsSESbHxFr4HGO9ogAmm5Ywb6PE6wK7euCWbnyMkm7aagIohR2Zuf0VcviDBfCdh/mtGqUnrMlwlsI1SlFFnEkOf4M6am5ougJCKclD4BdGINYV6QMriYPusflY1aafPcfdG2QxTvVfsY00mdokG2xFrsyyIgjMXH2HpWccjrIAmoB/Qwbiop63nPUuEtHsBZGtpFl/SRqQD1XTyX/ihtCoq+R9EofYXI+Lomx/8jV/r1C2FXFQf+f2bY4bmbJTCKj1dRjJUnp+A59FqhaNlOvEs16isqElmboFZWw2qm7MH0UNwt8+82ej98hlLPig=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851d781d-1592-421b-6824-08dcd35bd7c6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 18:50:59.7164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOrhPyyiYxGrYYyxwV06z7uwyrHLDWDOyDH1vR8tsX8LsPtdjoGirZ1P4bnkDqkIzTrkidnci1b2lBq8ZA9oKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-12_07,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409120140
X-Proofpoint-ORIG-GUID: KINw1udkM6rxiLpuWSfxnsYRr5vezm3Z
X-Proofpoint-GUID: KINw1udkM6rxiLpuWSfxnsYRr5vezm3Z

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
Might be nice to have an explanation ("ease pressure on the BPF stack") 
why this is put in a map rather than on the stack, but not essential.

On 9/12/24 13:59, Kris Van Hees wrote:
> When an ERROR probe fires, it overwrites the first 6 probe arguments.
> If other clauses are then executed for the original probe, the probe
> arguments will have been corrupted.
>
> Save arg0 through arg5 prior to calling the ERROR probe, and restore
> them after the ERROR probe finishes.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/probe_error.c                             |  2 +
>   libdtrace/dt_cg.c                             |  4 +-
>   libdtrace/dt_dctx.h                           |  5 +-
>   .../error/tst.argv-corruption-by-error.d      | 48 +++++++++++++++++++
>   4 files changed, 55 insertions(+), 4 deletions(-)
>   create mode 100644 test/unittest/error/tst.argv-corruption-by-error.d
>
> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> index c8ddcdfa..cad161fd 100644
> --- a/bpf/probe_error.c
> +++ b/bpf/probe_error.c
> @@ -27,6 +27,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>   {
>   	dt_mstate_t	*mst = dctx->mst;
>   
> +	__builtin_memcpy(mst->saved_argv, mst->argv, sizeof(mst->saved_argv));
>   	mst->argv[0] = 0;
>   	mst->argv[1] = mst->epid;
>   	mst->argv[2] = mst->clid;
> @@ -36,5 +37,6 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>   
>   	dt_error(dctx);
>   
> +	__builtin_memcpy(mst->argv, mst->saved_argv, sizeof(mst->saved_argv));
>   	mst->fault = fault;
>   }
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 4fab8eed..166627fb 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -818,7 +818,7 @@ dt_cg_tramp_save_args(dt_pcb_t *pcb)
>   
>   	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++) {
>   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(i)));
> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_SAVED_ARG(i), BPF_REG_0));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ORIG_ARG(i), BPF_REG_0));
>   	}
>   }
>   
> @@ -832,7 +832,7 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
>   	int		i;
>   
>   	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++) {
> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_SAVED_ARG(i)));
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(i)));
>   		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
>   	}
>   }
> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> index 1422ad24..633c529f 100644
> --- a/libdtrace/dt_dctx.h
> +++ b/libdtrace/dt_dctx.h
> @@ -30,7 +30,8 @@ typedef struct dt_mstate {
>   	uint64_t	tstamp;		/* cached timestamp value */
>   	dt_pt_regs	regs;		/* CPU registers */
>   	uint64_t	argv[10];	/* Probe arguments */
> -	uint64_t	saved_argv[10];	/* Saved probe arguments */
> +	uint64_t	orig_argv[10];	/* Original (underlying) probe args */
> +	uint64_t	saved_argv[6];	/* Saved arguments */
>   } dt_mstate_t;
>   
>   #define DMST_EPID		offsetof(dt_mstate_t, epid)
> @@ -45,7 +46,7 @@ typedef struct dt_mstate {
>   #define DMST_TSTAMP		offsetof(dt_mstate_t, tstamp)
>   #define DMST_REGS		offsetof(dt_mstate_t, regs)
>   #define DMST_ARG(n)		offsetof(dt_mstate_t, argv[n])
> -#define DMST_SAVED_ARG(n)	offsetof(dt_mstate_t, saved_argv[n])
> +#define DMST_ORIG_ARG(n)	offsetof(dt_mstate_t, orig_argv[n])
>   
>   /*
>    * The DTrace context.
> diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
> new file mode 100644
> index 00000000..6fd1834e
> --- /dev/null
> +++ b/test/unittest/error/tst.argv-corruption-by-error.d
> @@ -0,0 +1,48 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A fault that triggers the ERROR probe terminates the execution of
> + *            the current clause, while other clauses for the same probe should
> + *            still be executed.  This tests that the ERROR probe invocation
> + *            does not corrupt the arguments of the original probe.
> + *
> + * SECTION: dtrace Provider
> + */
> +
> +#pragma D option quiet
> +
> +syscall::write*:entry
> +{
> +	self->arg0 = arg0;
> +	self->arg1 = arg1;
> +	self->arg2 = arg2;
> +	self->arg3 = arg3;
> +	self->arg4 = arg4;
> +	self->arg5 = arg5;
> +
> +	printf("%d / %d / %d / %d / %d / %d\n",
> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> +}
> +
> +syscall::write*:entry
> +{
> +	trace(*(int *)0);
> +}
> +
> +syscall::write*:entry,
> +ERROR {
> +	printf("%d / %d / %d / %d / %d / %d\n",
> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> +}
> +
> +syscall::write*:entry
> +{
> +	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
> +	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
> +		? 1 : 0);
> +}
