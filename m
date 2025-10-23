Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB7347BC3
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761249066; cv=fail; b=Do3Xc4Zk1YrUTZYPPufaDsQIQcg315NBhTk0TTEhpFh3f1EoG6Qe6Jc76wpQBh5xhwoaIi5SuMFTSLGbLWORoGeHVaMkpYeCRFkUCo2G183JIvK8aRV79etJVazTEJflDgkiMIjwQdoD2+0gzl47YrHdxIKhZM8/aq1oiAF/bxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761249066; c=relaxed/simple;
	bh=h86VSjYAzB8M9lBE76X9+8zxv8j3p0ZENksaGVaqpcA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GuBo/GR5n5N8wJx4n9utbGd6hR4ZKlnIubCcCubj2K+iqDE4xyqWEfPjL3bCoXmlWpqGF7XN6Dvny6Utm/7o440Qjr6WSt7Lh7cmIFDIMkR/XtAa6sdJcnVvrzZ8HdoCPPodCyM+ZChAr4mk+Ji4yv8tgF62yCAr3FugbPs8giI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hPXYHsDK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FzCiEC1g; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hPXYHsDK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FzCiEC1g"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIBxCq008937
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=vXaB9LDOQ8UMvhD5OIMknEWHd394rJonQwQPx0Q1G3s=; b=
	hPXYHsDK/MFme7ZHwPBDoKXAfnKlfWEDLh6Si4Ryp+r5+B5KSjo9MpEEAQhXfwsA
	ZNu20IKdFsvbK6d1dZ7BwhPmyiGR1vPA2PP51m/8+Sh7YB2f/6kUCV1nGKoJi5c3
	RwIjt/yzbEzutzzm1emtxdDsxWOB7rOBMy3iE+eMHlPyDieIpbKkNz99NJkiHtux
	jocQ07uBHhvR2uF6OQPLMNxgFn/1u7O2JzQ/OQnK/ga4AEqDVz8G1eBRgGkalDLi
	nk769XqYgiWCBx6kSWdzNX1q8w4UBdfEQG2Se0e+RnqmfPlNsO8enTmsjqUfffki
	TU9UkWftRV9Vn+p5mzGTYw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xv3k3c92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIFrn8012444
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:00 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf19mx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:51:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezXTUuEC5VyJMmUyYyjlrikoTDY7Tvchw9vXJta0oZKXKmcdkHAQNeKTsiyiTSMKYCHgb8rqfaBl8/oUAesMIPvmo5dYjJZ19Y5mAsQ7LxJzBSLlkhbcLBDZdMASI6Q1fXAnM0GIKBnf1aO7mfxr9lHJXa5J2OLPdxnn4dJ7CWP82wzpbdF43EpxKY3LPqN927z9mIJQtzvm6JiRho6fMSXshUl1WS6/ndaVArSsytzvhA8nvJzy+6Vn7SbQY0+RtkXLYyYccdQ0gr61tbkXC1nJ39UvqoVHyzHozCdpTUsQm3R+/B9QKC/k4wI5uEbXoNkLVmj+cUp5tJi4eW1Bug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXaB9LDOQ8UMvhD5OIMknEWHd394rJonQwQPx0Q1G3s=;
 b=i322tsjB5Id6m48agrGayYWmU5M40r7WgLs3hwUUsI/aHYqJdrFbs5deEcSRbbLz+hC4yvGBbGMh9R2bVyoZlCflWuSvN6Tkzk52vXY8jXsKCHwXppXydXHT6WisYiBSPbqD2vnYVhZt6WTep8RI3J3dzlGXLqsXVYtcO1lUUSKE6W3nKET+j+7TBhmk2bqSTnR8rDyHUxf9jWHETFKPUL/JGxu7yGnGfY8XUi0JANkf0yw57iNzCqhBJJH4KOhfE8qnBqEhFftCoYlW9WTU+JDNWjW+gayoF+G+WWumY6dE8agrEu6Mc+1uUpdDfProeTmt3PkS6CJFEtvRr/xedQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXaB9LDOQ8UMvhD5OIMknEWHd394rJonQwQPx0Q1G3s=;
 b=FzCiEC1gWgkSZWLd9yQihnE0am47037//y2bXgjT53Jl9VXrp+K/bAfOy7vMCW+uz7TxCqyR6/bMBBJM8aajTrrfq6lT47ttp4/QlcHvzOL9e8csbzYVn4eBfdoPgzt4fHu/ly37OhaodR/n9Ns4PGXbCwoUovEQr55+HOY52kM=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH3PPF077CE0592.namprd10.prod.outlook.com (2603:10b6:518:1::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 19:50:51 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:50:44 +0000
Message-ID: <ec814b42-48e2-4324-ad61-fe00578f35a3@oracle.com>
Date: Thu, 23 Oct 2025 13:50:40 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 02/20] doc: Add a space
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250926190557.8485-1-eugene.loh@oracle.com>
 <20250926190557.8485-2-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20250926190557.8485-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::15) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH3PPF077CE0592:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f8c12b-ba2c-4ddf-532e-08de126d73cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d29HRkQydlpjVkFHRUVuMUcxM242blkrSW1raUpIdlJLZ2hNN0RiOVZEMTMz?=
 =?utf-8?B?UEpTY2hRdmFuaHRMaHBIMFJlSlZPQkdRSGIycXRyUWQyaEFoUnNQWW5kbEJR?=
 =?utf-8?B?ekI0cDVWNkRzMDR4ck4wdHZ1ZFF5dXNmaElmY2E5dFRQNWUvcFFKaTNjekw2?=
 =?utf-8?B?b2xiTXRCNlFBQ0RlcTFjWHNLUE5Fb3JyS1hQd3IzYnZrVkR5RERmODRFdjBt?=
 =?utf-8?B?WlJ4djRvdUJTRWxmaWswRkpLTnVFQk02dWZON0pjeUJZSmlUZnJTZnIzSDJX?=
 =?utf-8?B?OWMzVGJsSXpxQnVnK3p6c2NVV3FNd21QRFFOU0VVVWdtRHZLUXl1bGh0NnRI?=
 =?utf-8?B?NmxsQnIwbWlIMEJNa0dPZy8rMUkrUHcycTFzU2RqcnU5Ky9kNllCYUxHM1NP?=
 =?utf-8?B?dDlVSkwyU25Xc00rcGNmQU1sUjRZSFdUQ3lPaGYzaWJXM0ZDUHNsZzI5WTJz?=
 =?utf-8?B?K3M4YWQ1MGZzTVJaYVlGNDZDVFErS0h2WTdOYXkrd0ZIQzhJM2tmbUpLUkIx?=
 =?utf-8?B?elFwaGJxdnJ2YnlqVkFCTkxkZWNya2lBOS9qdnVNZXQ3Q0Zwdm9zRGc2QVZs?=
 =?utf-8?B?WFkxbVBBQ0Z0bnZLdUo3RVFoT3Ric01odVdncm9Tb2xrTzVkYWlBdjl3bkJ0?=
 =?utf-8?B?VDFMK3JDa0s1ak9xdHZMYUtLYmk2R1Nubnk1Z0o1OXRQK1hkVUpvUmg3ZDAr?=
 =?utf-8?B?NGtRcDFPY3p6V2sxSUp3Y0NVZ21jN1J2eWtzNjBuRElYTUhxVVJkZzlJTWQy?=
 =?utf-8?B?UVAxRTB0TjQxaGJ2WHEraFhGNm8wak5qV252OHVZT2MvblZkNCtKKzRVa1E0?=
 =?utf-8?B?a1VPeDFMQUJxS3d4c0xha3QxcU02M1oxRnlsNU1sRnVaM2tYL1JrWVRzV0tL?=
 =?utf-8?B?aEUwZnlNaUJpdWEyMkdOeWE3VGVoTEk2UmhUMVpYTjNNRnZnUlRZYjRtWm1B?=
 =?utf-8?B?OWcrNXhIZWx1VTRFRThrZ2VnL2NIRU5qVS9yNmRhTHhXZ0VneGtRL2I5TDdx?=
 =?utf-8?B?SWI2WnpzdmprSkJqdnRNL0t1QUk0MERNdnltWXgycW1LbUoxdG5MTXFqNTJn?=
 =?utf-8?B?UnpUSytmSVdjeXZJWngrRmg3NnI3SThZeDQrUllDR0NaYzdsNlp2VFVTZlg3?=
 =?utf-8?B?UFJLMVkwWSt6MVYyc0pjenUxTmJUTE1KK3VEYmV0K0pPaXpmZkdmZHZIL0lz?=
 =?utf-8?B?R1Q2a0x5YmJnWkNBM1RMS1FFTCt2Y3YyM0lreGJ2cHN6N1ZLaWVPN1FINWdG?=
 =?utf-8?B?K2tqTmUzN2MxOWl1c05WUXZmTGJpQ0pjRG9zTTE1UmF6SEtnbmk4RnJhKzdP?=
 =?utf-8?B?blVnYnN6cDBlNW0zODMzczI3S3l1R2ZMd3RSUmg5RzA5KzR2U0xsK3F4WUtl?=
 =?utf-8?B?ZXBreUtnRGlwMlZ5TDNKN2EvNGc4R2wxbk9KZ2pGOVJuNURNRVZ0ai9LZHYz?=
 =?utf-8?B?SU5hczJMaXFIRGJZcWx5OTJPdWVERk9pZnFXSi8yQWxYOHl3ZE9KaUZTWUMw?=
 =?utf-8?B?cWt0MTVWWlJUZzB0ZzRINHNxelRlTjA3S2ZBOXUrSXpVenhoQ3cweUZzdlhx?=
 =?utf-8?B?SnFtWmZNeHJNdGNaU1Nha3VvMzRmRGR4TmxxWlpRUmk1elEyOC9NMGNzUkpi?=
 =?utf-8?B?RTVRVy9aUjVYdkxYcnZuT01naW1veVh6ZVRuRW5vS3QxNXRlaEdITmljTUJU?=
 =?utf-8?B?MG9jdmlwQ010U21TQTdpcCt2dVZXd3dyTEM3UG1NMTJob1J0eDRmVCtnaFdT?=
 =?utf-8?B?VmpMTUZyb29TME9XN25KdkFIT3l1WERvd2FETVJUc0Q3YVFtM2dOSEtyQjRX?=
 =?utf-8?B?K05iWHNzU2g4VHRwaGlxZDJBTlhiY2RzWTAxVmYxeXJ2RjljRFV0UWpGc3Rw?=
 =?utf-8?B?YWZXdFQrb1F6TzdSc3VyWUxlWW9VeEVVNnlWNEZDdzA2dkIrOTlkY3NZNVp1?=
 =?utf-8?Q?uBzQ/NwJ1HVU4z2Wapcwyfn//oif1Ppz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3M4OVFseVZlRTlCdFFFVitlVU9ONjZaZ3h1TEN0SWZKWjR5THBjRXAxckZG?=
 =?utf-8?B?Z0J5eUtPc1Jidmk3SkU2a090d3JqY3lvS3ZyVSt1dHFWYXlZcEhaRDU4YVRL?=
 =?utf-8?B?M0dwMmxhcEJFUlpDVnR5UzBmRmhoTDZtb1RNdEg0Mzl6aHNMRk1UU2gwM2gv?=
 =?utf-8?B?RG9wc0VoS2N4bHFta0NjbFNXbllzdjE4NlZoSzZ1TGZ2Ymc3UTV1YVdid3FZ?=
 =?utf-8?B?dUtxVlZpQm44OVU4em9tdHFvdGpmcVFNdkhOYTJhNWZLNU02bTRRWWtwclJL?=
 =?utf-8?B?M2NNekY3dTR5b0NSMmh6OURISkVsUE5VSSs5SlZ1WklqZnBmUStMZS9adDJw?=
 =?utf-8?B?VU5LbGF1dDR6bTd1ZnBOYkNjdGJSNWh0eGh3d1orT3R4Z0tyYnI0T1VUUzFT?=
 =?utf-8?B?THMwckpLZXdMUHllS29ROFlCYWJleW9qNFM1OTZuS1lGZTlTU0hWQkJ5YllI?=
 =?utf-8?B?bE1IUXg3TFVvSTZDUFVkVlVqV2VtSkFlVDFsYktJWDBJaFgwYi9UTnJTSFc0?=
 =?utf-8?B?UDdsbmg2NkZ1MTd3blB4QXJkMFJxS2J1WVdCN0dBS2RRY09tOE9RcHZXeVhZ?=
 =?utf-8?B?UGFHeXByeitSYmxwN0tCanBJc0g5SjJsKzNIamRaeCsvRUdRaUhVZUR3eGhM?=
 =?utf-8?B?cDhqejdTTGw2d2NHaW5CVWs1WjBxY2xuK2hSSlVxbXhxaWZvMEhWWEUxV24w?=
 =?utf-8?B?Z2RDZmRGTkRtZDZyRmVNZXZGMkpxcFpMU1F1bGpqaS9jbHUwNG9pSmlBWnZk?=
 =?utf-8?B?NnpjVUFKMWxJR3lpYVM3Z0FIKzhqY2VwOTNwWVVSTU9nUWxoekF4eE9FWlh6?=
 =?utf-8?B?VXJoVjhNQzQwRE8yNStYSW9KMHg1ZGxJZHl3YURhTGFwZ0JyVjgwblRlcXpF?=
 =?utf-8?B?c09LaVVJY0MyUGxib3puU2ZnMVlrN2Nsa0xSQkhFUkVyVUJENUoyQVU0SUJq?=
 =?utf-8?B?R2JNZ1JGaDhJUnFqNmNtZE02WVgrUFV1TXR3QzRuYTdaTm1zdTRmaWpyUGZI?=
 =?utf-8?B?MGRkenozditWODFUSlR4K25FYWdCbXZmekVZQktQK244RU4wbmp3VUVwcDRX?=
 =?utf-8?B?WEdjUm1VUnpLWnlBOStQZHIzbkZrQ2thWFVEZWJCcHVVcVZTazNJVHNZa1Ju?=
 =?utf-8?B?NktOWlBVNUN5Qm5TWEs4UURmNDNSWmc0UC9tRkFtYXNBTG5MMzJpREZDKy9L?=
 =?utf-8?B?RWNxalc1UEpjeE1vWnNUU1ZSTmIrMmJuRk5UMWhDN3RIWlRHUkFzY1RQQ0l6?=
 =?utf-8?B?dmRvbmgveDFCU3JjRG9UdDJackZVaWhaVUlvbnpPTnk3TjhRdStHOXR4MzA2?=
 =?utf-8?B?ZmFVcFdyTmJOZWdMYW9jVSs2c200dk8yN1EyMXo3Wnk4cGZwVjhvTDVSSS9S?=
 =?utf-8?B?aGdmS0ZqUjhDdlpZR2w0MGtOaFdJT3dvQmt1SDlmVXRLZktmaTBVMG9hUmxv?=
 =?utf-8?B?K2puYVlVWllYaGhoRGp1a25sZkJ6T0p3RUZkUGx2QWJNQzRFcEVXa05tZDlG?=
 =?utf-8?B?ZVRKcTNsS2tPd1pkZElYRnBCUkhXOCtBbVp1NENxSHd0ZVZDSVRXV20wSTBo?=
 =?utf-8?B?d1ZvSFFQQUh1dUtvZ3BZSmlQdjJVTjE0cVRCdVFJVEZaL3F2cEtzUENheFJv?=
 =?utf-8?B?YjhwZVk5YUxGVEZrY1BTRmxCMzBQbzNvQlN0SG1ING83MWtoMGI2a2lRVXVU?=
 =?utf-8?B?WlJUYW1xc2pleXo0cVdrdUtZdWlHTWNWWFJYaUQ3dC9SNEl1aENSMm1TRlk1?=
 =?utf-8?B?QlhicVZRNlF2Q09rdWJXaUU2SW84dkM3MjJLNzFLUEdaVmlSRWJ4RTNWdmEy?=
 =?utf-8?B?VmtDTnhLK1p0TDlveXdwbG5naHhNR2JyVGVEa3piY2tXR3ZnM1hJZTlQWldt?=
 =?utf-8?B?bFgxNzJQQkRDRXdGLzJJR2dBQzlPQytCY2taV3N2RVJmNWF2Y0lxclNGWllv?=
 =?utf-8?B?dnNCOUIwdXN0ZjIrdnpkc0ZmcFpqZ3dCK1phdkVrU0cyNTU2VFFiSW1jV3V4?=
 =?utf-8?B?RGEyZ1Nta2lUa1U5Ym5SSXhJUjlRck5saUV2Tm9OODJONkVIam5XR3hleGlM?=
 =?utf-8?B?dTZWN2c2cEtCTG1GZjFqZkxRQlNzMXEraTR4SDlLdEVOL3VjMStVNWcvaUJ6?=
 =?utf-8?B?K1RjVStOSnNNWEgzaDhrTnJrT2pPMjFzdyticDV4RmpEdTZ5QnBVTU0vL1RE?=
 =?utf-8?Q?r7OmEkY2RkOEB1HRyBqDz8Q=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qCgufWeWfKhHO75vD/8mhwHHRjE+XSQEDvxu7UOU77ErszwiA7QWRb7ZeWundNPpYx4p8N/QBfyZQN6IdP/zqknZktXsqguL4Ebb7TVhGR2eP53ZSorX/r5bixo8qoayUrnwt2dNm12Qc99+BmbUqFBxlGoxKJduryLYV82VZXrHN5nsUP6BiPW10Putlc1hYuDzzXzB9jICM49toth7qjo1vKzok4y6S8fFUmFDeK+1gCRPthmxQTX532jBJFI4Qp1LyXuGj8gIo05RQGMRXKNVUphLjNYyZhjHTVzfB9LwYfIFv52Iy1JMaxPkF0yP2S64kHP7fKWdPTgIqH4pkIexUeb0pC65Dm1ly1q6Y1ik7dqbKggeihehAhTDABzJ3/jKeiD/NZmsnyvpC5ZoqxUXn7olEggA/lbd3v+91ZRymMlGX1v7DNrt/BH5isoHX1vpRMwfiJlLTwXnd15jMlkQdc8011vmzgS6+k3EnCb0dBDIZRa0jhbCwpTarT9SDCdw7jK3E2ot/OEj6J63TUIxNCs4CKDC4gDddaDzenowmiNoVsANVeZPLPe3cGSsvFVfug80BzIDBOVImkQIhutwWHNIqm1xse7HFATLIyI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f8c12b-ba2c-4ddf-532e-08de126d73cd
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:50:43.9076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AX7ZqDj40mVXvSRQoe5ai8rl2LCsYb6Fg4s8aeIR6dSnSHlA0fxGVQnrdWXT8b3bSHZ6v8ElngU+CIcsY8h5xN4EYrXkVe9qdu8dJJdRYk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF077CE0592
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230181
X-Proofpoint-GUID: tKE_iMRfpfPa3E6qdiijsBcuSlXHao5u
X-Authority-Analysis: v=2.4 cv=bLgb4f+Z c=1 sm=1 tr=0 ts=68fa8725 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=RFlv2n1sLO135lnhR30A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MSBTYWx0ZWRfX44JmFEiMX5hw
 iOxpBJAJWgw7nFgUCtxM7Oavvv+8Vh/DkHwkgpZQtDqGyUXKe3K/VGidlo9iDHF+ha8JAUXTMfx
 sUr9h8QId+Vz2PEODX0cGsjZuON2wT0lhhwRcf35CeDmFiKRvm+kbQiQNusFOTzvVy8taFfijGd
 BrLgsy+iAfkfcLXwyR1bkunfM8HaCZ/HD+t1Bd/znl81BlZwncDNxCf89RFggeg7AsD8WIm8ETe
 AZLN7flSnedETHowT/BChQBYxrknzZVnzzpfn6D+H/2MMgwrwcK9GqtqmFhWYLZhYSIBOQUeKQN
 skEof+uv5/+GXN+K9rC1FxEfmW5NSCq0ajTSOA9qwsaBEl2wS9zfqDAU5XFlvIub5oBnX/RUiRj
 r3KYmi4qGqQoEriOAmgJ/LIidIywww==
X-Proofpoint-ORIG-GUID: tKE_iMRfpfPa3E6qdiijsBcuSlXHao5u


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/26/25 1:05 PM, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/dtrace_providers_sched.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
> index 29f8ad8fd..d4cd546ce 100644
> --- a/doc/userguide/reference/dtrace_providers_sched.md
> +++ b/doc/userguide/reference/dtrace_providers_sched.md
> @@ -245,7 +245,7 @@ Probe
>  </td></tr><tbody></table>
>  ### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
>  
> -The`lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md#).
> +The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md#).
>  
>  ### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
>  

