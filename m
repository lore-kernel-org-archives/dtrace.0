Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176373F9FB
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721334586; cv=fail; b=W3LcNA4e+ZzR9k8Vva7oqCD/Q3oIWz2AtF/0JarczKgy1h/K3PQ+6UjKESAImuNUkEYfjBhF5k/8F9ROB6kM2LnURvhxCoFh1LMU4qQfxjFimztOWwG8x0rG6CeKyvbEQUgWJRgQ8wgOBQTwdSv0EsIsMf4td8GDFUbE2AAitUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721334586; c=relaxed/simple;
	bh=FubRPTz0K8S29W0kGOVXo8zs8y5HC4MGpjs05zKA3vU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hZgg7WqcsVvgUTl6Fkjz8iSvJ2ssG1WPTOBbuJLAf8DW2ek1bOpUOFBtxIoaypiGr2goWIycBHzZKh4J+RyuTxZfJzt6kges8q2OYGtDmHznrp0YMRrsZxSKJzQ1YUzxzRlH+ExksGPHRnfNKKtYRNfV2G68ZoDQ2g9LSskAaIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RjONkLgf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IJFZowgM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RjONkLgf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IJFZowgM"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IKFUjD016822
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=78PkJR0Z3jt2eQdG+7oVI23DzTdHXElAI/1PSK8u5O4=; b=
	RjONkLgft6YsZkh9+mn8b2TkyEqQfivjk4aT4DAblcMn7r+mQkWaEJ6XMIWDoZpJ
	SatN93kMWrIzF2jQmTQWMg1L05D3t114+1sR8L9OiGvkGbeAimB4eJZGHaq+UDVU
	mvAI+u7ppODqHT+ArXBySFBgxFz5/9QfOl6EKRM1vTAUsNi7qI6/4VQ6O+JRnmdW
	rB9pdzhxtQ2ngWfcUn2rQHc4a0zLMqAnJB5RqF3t3SGoGKolSm0XWX7Syvwpe3oR
	ALayEaB12whd4iqEbaePzuV+3lVoTpjIb4o92Dw6xw2FiCtvh5lzo8g4XY7CgnX0
	TGWEIdZsSzU5i3b2nFtOBA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f9x381fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:29:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IJlHY4020239
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:29:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0wh5c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 20:29:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxrbTJ4C6NKAFlGZY7BGQAQwZjjgW2gBRYPcWC0Tnw/+SUqNw+CJ235Ul4l1k4GtWP5JinchQjduVhjAk9RC0YDRP2pBeXVEyodOCSoqu3WlLGqxs36sZYHjEpCCfj57JHEyv1P5Mv7fRI2gQtuiNHxT4M0B+9IjZ9GxF67cVxz/kTZ2YeKsLTCMorbi+Gtu2eO5IrTggAjOAUqeJRAzLPOlQNya5qMsuU/TShLvPypbIsCUzTllBOzJYnmU1YzoPMCvqGVrKtnMAjI/b388cIZSpF1bX02PCMC9VHEaeNYB1zDw6b5+96IOA8p9DasYLAE5Gd7ii4CkL/s6Y8e3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78PkJR0Z3jt2eQdG+7oVI23DzTdHXElAI/1PSK8u5O4=;
 b=rNfr/+Xvz3Br3acU1NVJLryyMXgNkvqyCrCshQRhBjY9D7PWCLXk/5eqGegbzI4eqms3MUDk2aywDOJRI0LUzkX/+Z+MPof3fzXocNbnP55bWImsw3TptD45YutcXVXMCUWrgOtSA1gmTJMrRb1I4fqCBIGIb425X+fD2leQZM/pQ3cZmqeVD1ln+mu7MD0nPYzjxXSbrf51QBrCIAA2hOrxJ2s2ObppHPunBpdNmXqzMPyFuluTnmukL47qclo1OatQhNI3AFbppmv9/DQxjrvrMa40u5/HBA0JD80M3VDmET37aoosRhDFO6sIJIpEj25dikKdRixFeyUMuYzTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78PkJR0Z3jt2eQdG+7oVI23DzTdHXElAI/1PSK8u5O4=;
 b=IJFZowgMtYDH/yxD6Gxv2WnEFcmJxBt/3H8YNJ2//0bLlkWA63vzKWZ/pe5s4cPJeKLCibkEhZXcle6WFcNEmEhaTXHDzs+a56arJZ2xm5IFh1uHuSW1MyksspoVZHgExjFjSuHWsDeimljWhOB4PzhKjkHiRgF0e7gaHUtTFOo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN2PR10MB4157.namprd10.prod.outlook.com (2603:10b6:208:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 18 Jul
 2024 20:29:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 20:29:20 +0000
Message-ID: <f317c739-a67c-646c-4b48-600c9e78c6f9@oracle.com>
Date: Thu, 18 Jul 2024 16:29:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/38] Fix comments in dt_cg.c
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-11-eugene.loh@oracle.com> <Zpls53GLbxJCnBTe@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zpls53GLbxJCnBTe@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN2PR10MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: 93e98d87-0028-45ab-7a07-08dca7684d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M09aMkgwZkFtVnphcFNGZVNIZmZnZldkbE1UMlZmRytZSk9ZWnRuNnB4bHhF?=
 =?utf-8?B?MHR4TjRoM244SWdSbFp0TldpNTRIUm9GWWRtdjEzbFlRblBXRndrOVAvQVhE?=
 =?utf-8?B?REJ5b015WjBiQW5Kemxuc3cxcmh6cXpTbnBTUUlHTGpMY0dMcURiS2ZlU282?=
 =?utf-8?B?Vjd1blFhT2NteEZsWmp1YTV4VHRHSkgrSk0xZkoyRXo2WDRBbXZyM0N2YnAv?=
 =?utf-8?B?cjlXL0pNRnVxb0k5cGZqTFEzUXdrbEFETDFhck1JaGlCdmtLNmpjeE9yMHhJ?=
 =?utf-8?B?Y1BvRWxqb2JsbWpBRmZOby9rZ2FsUU8ydVIwdEZvOEFMUW8xbnRMcXlVcVA2?=
 =?utf-8?B?Q1FNc0MrbmZnY0pVTE5NK1FZWUFQYmlpeFZQa3BYOHJ5SjJxNzU3VHJSa2Va?=
 =?utf-8?B?R081emtnaHRuOWN3WmtpTmYxY1EvNE5nOTZJTmcvUUFlYlZWNHBoUVJ4ejVX?=
 =?utf-8?B?Sk1vTHU0ajB2K3NyWjg0dHRaYzdtQmpra1J1ZkJ5Z2ZBb2Vja1U5MlptZXhj?=
 =?utf-8?B?QmdqVkprL1dBMG9hOGVlRVBQeEZ4Nk9uMFE3RmtSRi9FNHZjQk1ZUFR0MnRx?=
 =?utf-8?B?M2syOHFwdlBlOUJ3Skc4d3VReDhKM2RnTUdpaDhMTEcrNU5ZR3NLcFdIc0oy?=
 =?utf-8?B?M2ZMQ1FheXQ1bjY5NXFHR3pkUFJrcjhmQUl4L2YyUGRnK2hSeE9pOEY2Mkt1?=
 =?utf-8?B?K0xZQjRXNm9wNVpaQWRNR3dSMEx6ajY4NjNoVUJSemxONkVWUWpjbE91dUxE?=
 =?utf-8?B?MTN2TS9WMG9DZ0JsM0VWZVNFV0swb3NZZ0dEckRWZlMydG50Ukxsc1JLNVAz?=
 =?utf-8?B?UlM4ajRJU0JsT2NhTTBBdDl3aE9EOFIrZ2doR0NhOUc3M2lxY3lWZW5PRWdW?=
 =?utf-8?B?OElZdlk0M0ZPY0xiODRyYTBXSlNOQjZLcU9tcFdEY0hoN042T21yMVFIUThy?=
 =?utf-8?B?UGtzMzFRbEZtQndLZ1dSd2pZZ3RCK21wVFBsTVpGR0VIR0F3RVdkUTlJUzNn?=
 =?utf-8?B?Sm9tUUxvTzRUOVEwMEpoNGtxcW96S3BuR0NWL2kwVzNYaUtrd2E2UEU3M1pz?=
 =?utf-8?B?eTgvSVllVEFlQ2FuVTNnejhlQzFkdzh1Mk53eCtYOHl2SlFpSlQybGQvc2Nv?=
 =?utf-8?B?NkhyTXRLRXpqaGFMRHplRkFkQVVXWHFIVjFXVDRzSi9QR09yVEpPZXhlUWVO?=
 =?utf-8?B?SVBWcHhFV0ZpdmEvV2FiU2dKSmI0dnJIMVNTbTBkS1pYS3dvUXkzQ0Rvc2h2?=
 =?utf-8?B?aVkwbmx6L3V6WFR3TmFUNm94UFZLS0F5d0Z0bHZORVd2VEhtQzFKL01aQUI1?=
 =?utf-8?B?cTgxMXB4Q09sOUk5VnBOd0Q2WDNxbFFEcENPeERpOGlPU3YwTmlYMTVPSEVW?=
 =?utf-8?B?Sml2UDVlMCtIaVRNeDhiU05KQ3dFS0xVNmpOMk96aGp5VjNQQVhKaUNJNCtl?=
 =?utf-8?B?OUJINEtaMjl6QllrTjA3T3dXQ2xVQjNRbDRkRWQ2Mmo0clFjS2N0WmNNUEV6?=
 =?utf-8?B?aVhlam42Vno1a3ZiVDZmeEFOaEZ3c2pUa3pEV0o3QjN4LzZjWm11WjYvUFVV?=
 =?utf-8?B?Z09LMHBDMDRiVWFOY1BBTjF5dk1wa2IzUkhJV2dqMUlha3hpRkZTN0M4UU5U?=
 =?utf-8?B?QkJuOUw2NXg5SjRDSXNpazc2djE0R3ZwU3ZkTjZRRm5wQnRzdGtxRWlrWjZG?=
 =?utf-8?B?L3NWS1dsQzhzejZIVm5YS2YrV2ZGZGtsY2V6ZzRMOFpGU3VBTEwwZEdGemhu?=
 =?utf-8?B?MTQ0YVNuRDlEYVdKRFQwbDVwa0UxVVQxeDcxeVkrMmc5UnNjd1pZZmlVQjQ2?=
 =?utf-8?B?cHlISVB3MnUyNERxRzllUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXpGaWsreENjeStNamc3S0xzaEwyMmZickM0VmJqQkJCdFU0MENWMG9iRVhR?=
 =?utf-8?B?KzRaNmNOTlVjZ1BMbUZkbGoyTkFaWGVGSWY0K2Qzc2Z4dmR1M3k4ZnBiY2tM?=
 =?utf-8?B?RE83Wlh3NHVuN0ZSWW81VEpyQ2ROVEVGMDJBOHlSYzFzS1ZCQzRBbDlUY2Mv?=
 =?utf-8?B?QUVwVEUvL1lnSWhxcWVoNnJ4RUFkTWdVQ1NDWEJhTys0S0F2VXc2Vzc0eVBp?=
 =?utf-8?B?MVF3NlRaUFdjUHlwOGFkaVQ5dTduLzJ5bzgzdXVGVEp6N2VwWmY1VVh2TWM1?=
 =?utf-8?B?Zm1SQlpQZUc0Z0cxTERVVFYxR1dwSWYwZTBtNmxPdXZ2QlZxZDBsSTJ3NHBx?=
 =?utf-8?B?R2ZyeXg0OHdHRStiWWZDbW1ENTVXSmJncHZuOUJXekM0L3lVMVpLNnFONVNs?=
 =?utf-8?B?elZQaXRVUUNscE40VzFqS0JEU3UyTGpxN1MxYkJlTzFMTTlRb3dpWGxzK3RH?=
 =?utf-8?B?QUJYZy9uWGdjT2wxVU5wMWFYUjJoUFB3cnlrY3RWblF0QVROR1I5Vno0MzRG?=
 =?utf-8?B?RmZQbVlzNVpwUmFsTnZIcUlBS3pjZlloK1BkRDVPb09vQkt6a0pSK0I1cHMz?=
 =?utf-8?B?cm4yK1lFK2phVW5lTEcrcC9QTkRLQUxNd2tKS25nN3NpNjBGQ08rUDl4Qm9y?=
 =?utf-8?B?YUkrL2hTNHNuTXZhTWZFakxHYVZNOWd1eGVneXl5OTliQWE5eEt2RC9xdVJl?=
 =?utf-8?B?ZlRnOERzb0ErMG1taUtQeVl0SzlTckoyUFdsQStISm1VMmxZMzA5SGpycC9L?=
 =?utf-8?B?Yzh5NXFWa3dySjVGcUQ1TlhOVHkvcHBZN1p6VVZqUHRiQkIwdTd5Rlp0RFZF?=
 =?utf-8?B?NnhtcGhBbjVSM0tUV2t5c2I5c0ZCdmZmNlpJNHloR0RZUXh2bWN4Nk1HMjBi?=
 =?utf-8?B?REM0a1RqWENKMHhkZU1BY0pYZzRyWFNXdnJZcGY4TVlmUEVqQUlPNjFENFly?=
 =?utf-8?B?NjZleDNraU9GclBZcW5MTHBwK3lEZFgvZm5WakMxSTlWYlZaM0xLYUczaHY4?=
 =?utf-8?B?YVhBa0lHdXhybno4WDNtbzVTV1ViMnN5VzhWZWRvajgrUHk3RGZtK2hSUHpp?=
 =?utf-8?B?TVhYQXRRQW83TnYxZzZINnNxMStlSEdzQldHN1VOblllVWZ0d1V2cUJ0ZjdV?=
 =?utf-8?B?UEYwM0kwM3VWU1FiWC8wemdsUExuZGh1V2VOcFRpNXdLYm11ZG51NXFWVjcv?=
 =?utf-8?B?ZldOUXA5RWdjTVRwMDR0cXc5U29NZDM5NE9udjRoYllwZXJ2KzFpMGVRSTlM?=
 =?utf-8?B?WmQvT2t6aC9zMEJVSjBGQ1hrZ1BNUENteEZmYlNTWWVrMjF0elFJRGxDbmI1?=
 =?utf-8?B?NEN2QXA4SFFDQ0FEU21aTCtha3pTRm9vODUwb3BjUjZibDdCM1RQa1NBM2Qw?=
 =?utf-8?B?dnI3ajBscytZUkVrRVVWYmE4K1hpbDlmSU81enRJMHYxUjgvZ2JCMnlFazdi?=
 =?utf-8?B?OTZTWUh4dHJmbERDaStrNEFRbVh1VTNGbFZ4WnBTWGFrQTdmZFQyREdBcXd3?=
 =?utf-8?B?K0FHaENPM0FnQkxNTkMydEVVanBLSGFzZzQvL1pSakJYYVJiaHI0V0JnU09C?=
 =?utf-8?B?SE5FdnhINnA1Z211Uk1iL05GYjhkdWFEeEk2aEhsQVpTenROdnlJQjZkZHNh?=
 =?utf-8?B?NkhNblR0cXV6RUdrWUp6ZUtZcWh1N2JIQTUrUk0wK3lLZG5jU2VnVW8xSTJ6?=
 =?utf-8?B?VmhwQ1NqNlNVSloyQVBqakVTZGhOTUlDK2l0YTdrT3dhQitJU0RvdnZIZ0lT?=
 =?utf-8?B?K0t2U1NhS3dwWGRBZE80eUxkTStlOGNpSzFHTmZjOXBUa3ZGMjM2ZWNhcG5V?=
 =?utf-8?B?R2hmeE9EdFJaeDFoZE1KZlNkVHBscGU2Z0xkSkRYQm1VMFdiZ2VGYjc4UjJH?=
 =?utf-8?B?ekY3ZElmZklhVERCd1g0Vjg3aEZoN3UrNVlyQTY4Y0lUNExXTzA0NFQyYWdo?=
 =?utf-8?B?N3k2SjNSSWQ5Q0dlR2t6MFptRkgvdDJYTktCRVF0MzRGYlR0V2F5TGkreWxx?=
 =?utf-8?B?aHZFODh0YkdlNCsxN0ZZNTAzc0NXTDBBNjZMTldYbUkwaWM3b2kwQ2EvNFQ2?=
 =?utf-8?B?M3BDOWRIdTF2Q1hiVFFwRk55b1FPc1RxS0I0SG9hVjc2eHRzb2piV2VxWWJw?=
 =?utf-8?Q?NEHGb5BThxhVD3Rqb59Oe8GwJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Z2dgQarCR6SvYScQIZIdxKNQoaSXv93lYKjAP3h7ZLO4Iggsnytywvtdl+HkqpYMpDjs4vnb+bo46RBfY4R2k5n6fTCHmj5urGQ7wyeVUyF6LSqdcWBhnXydrpBjKhOHPliYOHxc8HRQS8RpNCxI4Zmd2E1Bg6/vh2SrR0+unSuuyi9rkGIBiq+nHYP2wTKjLtSc1KAt5pHIGDNFKqB60FSgkXmJFB3iRrJ6r1LqrP7CtEYYfquWm4l0N1Z5m+V0qJGCVz5py6aFi4weRUFw5Hiz8j83YEJHY12CZzs+dYOtJo9/ZPs3tBBJzZivsLhN7oJDTYOoWZkzPZYW8w1Rr2zNqOT/uJxVHb2YhWxbZ2+KA/QKbg6WgIpHkBQAROlstLjPfaVtnXGqxsVsC7lwhyWgmxWm88j3reelkt83ZK1fReKlmk+yWC+7F7YQo3spycOv4OJl2pdyHGKx7ckC+PG1IxOO/xGVdLVkBDbID/oXv56BxYvTL1lFzqSFcwH4xPNn+9qNbE2/a55jXwisSJj2m2O2KoAA7VP16DRQBU2w4u9jP53xu3rVTvWnBXD0cF7zmyH4AVQrkJp4lULwIvzREhF3Ub2QQkhSkBOLFfw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e98d87-0028-45ab-7a07-08dca7684d8b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 20:29:20.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8fiV9aVJySzZEp+28ePjaa2i5oB1KiWH06sKcd7mwycyunuFeMhtJbwoZMQShDDKQ221QCgcJNh6CzTHHy9dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_14,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180137
X-Proofpoint-GUID: vVC43eOWZY1gEs7FiJhRNE1qGq0L2jho
X-Proofpoint-ORIG-GUID: vVC43eOWZY1gEs7FiJhRNE1qGq0L2jho


On 7/18/24 15:28, Kris Van Hees wrote:
> On Thu, Jun 27, 2024 at 01:34:27AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   libdtrace/dt_cg.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index 0977406a..4fd2d359 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -1150,9 +1150,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
>>   
>>   /*
>>    * Generate the function epilogue:
>> - *	4. Submit the buffer to the perf event output buffer for the current
>> + *	1. Submit the buffer to the perf event output buffer for the current
>>    *	   cpu, if this is a data recording action..
>> - *	5. Return 0
>> + *	2. Return 0
> This numbering was meant to continue the numbering that is in the comment block
> for dt_cg_prologue(), which now would make this be 6 and 7.  The thought behind
> that numbering (which was correctly sequential until we added speculation stuff
> to the prologue) is that 1 through 7 cover all the steps of code that is
> generated for a function.
>
> But if you think that is too comfusing, I am ok with going with 1 and 2 here.
> It just changes what this was meant to convey.

Yeah.  I get the intention, but it's easy to imagine someone tweaking 
numbers in the comment for prologue() not realizing that they also have 
to update comments 100 lines away for a different function.

I'm actually a fan of getting rid of the numbers altogether.  All they 
mean is "in this order," but the order is already clear.  It's not like 
we refer again to these numbers.  So, they're just extra stuff to 
maintain, with no useful value.  (Also, why continue any numbering when 
we don't number the stuff between the prologue and epilogue?  Kind of a 
rhetorical question since that just heads off into some fruitless 
discussion.)

So:

*)  R-b for the patch as is?

*)  R-b for a version of the patch that changes from numbered to 
unnumbered bullets for dt_cg_prologue() and dt_cg_epilogue() comments?

>
>>    * }
>>    */
>>   static void
>> -- 
>> 2.18.4
>>
