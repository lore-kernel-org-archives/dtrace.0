Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CACF18A6B0
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762903180; cv=fail; b=FGDTda4jeHYnPEsWNG3kJYXqElIIOQfZ4L6PJrg4AZAK+9KOPuUebU/425UhyQrriyfrDxYGLXg2uyBxEqS21bkgxH+P7lgfF7U+NhteHU1PahbueM0lEKBrPSsx+gPhXpWlaYvmvqMscrd2d8m8U8VLHdO8LSM4y3zaM7SrV+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762903180; c=relaxed/simple;
	bh=hm6IHp8BbN+4ZBa1KP11L7QVR/ZG4qs400/XmUW+UUo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V/aWOO22QvhCeLiFJ6yNqbwGECKE86f2hnQ77btfUxvS6sBeUtmV4vXcpNLokJx3P77VMIme6WDG7dm7bjCKhHMJs8vXTD/uYWxtJAha2sbwfhRggJWgnYBodnQzsmO0GuGOrdDkMUdIaP392NsxPzv45rUvF+5h5EDBXTv6Tng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=asAfBnem; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L59qFE1V; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="asAfBnem";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L59qFE1V"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABMaLpc029455
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8j5DJBAyMEgskJdfyWFC+I/fpJAsSNq/c41Ke99GFIY=; b=
	asAfBnem5GUjCCUq0xt2dHpT+ElEfIA3HjEeHqSrVNPrttwVI7+uWT9TuBmeiovx
	+Mq6WL53/Y1q6fwIcVBv5GzQD3ExPIOp5Ljr7SrwH5uWgTZvCx8vaIqPv7Zam8xX
	Ht2wS+8oJGqTcVB9csJYV71zEvfSL+cd/FfLd/i2IEmdNjOyu/Wto0XpACMykD85
	hX9zIKXcoKLJ8IMl/MIvg0tr23JFCyboChuOvxkNNi5pJXwq0ChNVIDOzfNHG9S8
	EwtgZcNUpjVq0onqPFu7XAEntHJt7nO8aD+unLghe11ww7Mhw25vk2CYjZUh2/Rk
	mvtV3DS35YRACCvxTJ26EQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acdwwr2hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:19:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ABN0CY0039929
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:19:36 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010024.outbound.protection.outlook.com [52.101.61.24])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vaa10y0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 11 Nov 2025 23:19:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylhRNejNobXHtwLNp7RUmXhVxUlklDYRLypDPnXfRfA76KZvchTwMakwFZRBx04QYCbjZ8b/5D9VMr6TuiPwMEDoGqB/qPb0zbUcva2Q6baDumVmAYZRQEtk3eLZRl6Zui+DIijZodj8RTfbKzOcUj18VESFHOkWLT7ieYjmz3MzAKkzwzQ2xeYvikGo0tW1npEDz8pb0tmxREbFeeUtiyLoxea+wkFGhaH/97yq9D9PPetpm9jH3qePUK6Yy2T6+tIwgTnKvEQuyxwmthA4BnMbEWLmiX7GxTtFYcgxJKQBOhl+/pf4hsFV+sHVRWt55kTVbaCX17akTNH4K+U7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8j5DJBAyMEgskJdfyWFC+I/fpJAsSNq/c41Ke99GFIY=;
 b=rwXnB0LgbCNuobxJvRyNPxjObZ/TojVJWHuPk1m5mtkkRObwDDnsf0to3//4Hvcm84KAfwA0B4DYmtIXXnFrHte+sAbMRfHXG/SzaNx5GGdIs5JUtEPo6RIUPGk5SgF/4+71cjMfNphMeOKJ+ipshHKOpYu/gMLYDgmD8CzWM/4UTjmJHbdcEFZADfCm9ggoX74FAZtNSgTz/G3ycLMetwI/NGDDWZQtAOB1RN9foXflR4oio8zTeMNmD1bMBcroAqV6z/9eFEdLPLhhIXcRjlKVfYU+3Xe5nwqLzxuK+KMexGp60m6vWrZpzyWFADUuWUT9Dd9SGAyq2ktRf+vVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j5DJBAyMEgskJdfyWFC+I/fpJAsSNq/c41Ke99GFIY=;
 b=L59qFE1ViU46d8VRKL3wfKjUlLpjc6dZid90gyH0f0dAPcG54uDMc+5VMZtMZNYRrHnxiQNUxh0kXAjaAzSuj+ZnF6qhwJTIYYGmup8nrroOIukcsSayw671ma5pIYSqKZNyphi/cX2WamQGMwbVXk6fpIJXB9xlvKQb2fMa75s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6053.namprd10.prod.outlook.com (2603:10b6:8:ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 23:19:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 23:19:28 +0000
Message-ID: <b8b5e530-c82b-174b-0553-034845c2e25e@oracle.com>
Date: Tue, 11 Nov 2025 18:19:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 4/4] uprobe: Implement PID-specific uprobes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB39877C63B4E017C4A521C4CBC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB39877C63B4E017C4A521C4CBC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR22CA0008.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: a221438f-d9d4-46e5-78e6-08de2178c293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VUNrR0ZGS1BkV3ZLd1VTcHFia1d2NGdybDN1WU5peENHYUwxcFdQVFIyL3NC?=
 =?utf-8?B?S0xJanIwRERiakI3NDBJUVBGbDJxejBFSmhxU3NmVG9EVHY3eDNRNUJralRQ?=
 =?utf-8?B?SGFHeHVXVDQ5cEpVUDl2clRnL0U1dUxOM0xEVjFnZExzbnNQWG16SkNqSXpz?=
 =?utf-8?B?V3JLcDJ6T3Vhckt6bzlieHJCbk1TUUZxd3d4Z3ZiUnFUSTRRTnlzMVZQcU1s?=
 =?utf-8?B?YmZKeThGRDJZYk1acTArSXRIODlwNmRMdFFwaE4rVGM0b2xoZzFoMUlhRll1?=
 =?utf-8?B?VzlBVnhpNHU2SHp2Q0lLbmVYWkpJYS9QamdSQWIvUldjcm1SaVdyU1JrZ3V0?=
 =?utf-8?B?NFgxcVZyMjNGbjE0dUVKU2RmdlB5WUlyMkxxY2xTb2ROTy9zS3ArVnZsSU1X?=
 =?utf-8?B?RmVPd1NkdWRxRkVWYldPcjZ6UGdLeHRIWUFqVmNodklSbkZDN0JhcWpoR3cz?=
 =?utf-8?B?RFZQTFoxTHFUN0NjZ1lxTDZpd3B5UWVaYnVURyszOVRjOFNOb3VjQjFoZFFV?=
 =?utf-8?B?eHBxcHpWZ2Y0T2EyTHNCT1dZa3NBSlIrM1o5eldQTVFRSGRsejdJdkFBRXVV?=
 =?utf-8?B?SmFLU0FWZVIzQWJnbkFNdW81RGpNcjBIa29uNUlDeGR1OE0vSkhtZ2FWbkxz?=
 =?utf-8?B?RVdxTGFnMzlHd09KcjZNUXprV0hsQ3IveGlXL01ESXBFRXBuYlFRTE1OUGdL?=
 =?utf-8?B?aWdJUHB5VG1FTGUwc2xVcHNoSHN5QXF4QjA4NHN3aE1oMXV6WmgrWVRCN0pz?=
 =?utf-8?B?TjZzc2dtb1I1SzdrTEJYZ3lYTXlEcHZ5V1R5eG1CQ0lKSzU3c01tcE5BamU4?=
 =?utf-8?B?QnZUY1FDWTZGU0VOeUdybTc1RFFpZVVQQzN0NXJZMnBza21UbVR6ZExLTjd1?=
 =?utf-8?B?c0cvaUFLLzk1VFhIdG1zanJYN3J4VEpHc0pTZkVVQm5nQ09CMHVRS1NTd2Fi?=
 =?utf-8?B?YUVwRzhIcXFxZUdLRThwK2VjQmJMZXI5bmtGajdvVVFYWDgvTWFqZjluQU45?=
 =?utf-8?B?emhsazhyMjFOZndwTDFSR1pFTzJPUTExVUZHNnp0Ny9STjhwUGdsb0E3bjhO?=
 =?utf-8?B?R2huSUtxWDhNczcwSWpRSWtnblJzMllianRqV1VmNjNFVTN0S0wzSnd0aytD?=
 =?utf-8?B?NTI3WnczN21xUFhNTEpNemhMQThrM2NNelY1Q29EN3BpaE9mWGxnTXd3aGhk?=
 =?utf-8?B?REdETTRCblZFQXVnRmNsTUpxV1IyRUE1RkZydkVlMXVyMklMNUdBY3FnTVV3?=
 =?utf-8?B?enlFb2JSWU5jekZvdHhxUUFpTlR6WG9WSUtUczNwczM4bC9wM0l5UzdxMkU3?=
 =?utf-8?B?RlVUVTZBcFhCL0xXTkNwYkFvS0cwZEdQTWZVQjVLSWZUVW90eHl4ZkU4azBX?=
 =?utf-8?B?enUxUzBhd0g0WFdYWW9RS3h4bDZHdUxPMUFOTWhoenQ3azl5VG51cXh1ak9W?=
 =?utf-8?B?aVBDdXR1cS9leU8zZDN5ZXhrUXBiME5jdHJ2bEIvRXp0WHNtQkJmcUJNSW91?=
 =?utf-8?B?T1VmcG1JWXFMVWVodXo5N3BVRDM0NWdycDNXbUttYjFUSkx5L1hSeUlWOXF6?=
 =?utf-8?B?YnJTQnV0Ky9teDV5TGI5QnoyMDBKRkprNjRCMWxiV2hIM25ib0Q2bzVHbmEy?=
 =?utf-8?B?UHIwSFZ3dUpYb2Q5N3pOQkFVek92dFV2SFhvb3k0MTBVM1h5WU81T0FXQVZZ?=
 =?utf-8?B?RW5FRDlRZUx0bUVlMWpvcG1lNVlyVW1aRXVrRXpMb3lCODUycUNZb2x2Q1Zr?=
 =?utf-8?B?U0tIZmRud3ZWUTgvT3BsRElxWWdnbVZLSmNUNUtQbHZ0Ylc2d01WOFY0YUFO?=
 =?utf-8?B?QktjdHpHRGN6c1lOTTBhOHoxT2wrazJDN3FaVEJIT1dvRUlmRmlKRnJaVDBq?=
 =?utf-8?B?allveHpscmhrNkhsMko4TGJKay9yczgwcC9FSDF1SlZJUmc1VWhsTy9rV1Bt?=
 =?utf-8?Q?SvMUYwSOUWDLj384/mB2s8UAEkotuH5r?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bVVid2FsU3RlK2hQa1IxWkZ0V1JjT0FnMkVtZ0RJcCtmRkVpYW1FbzlsbGVm?=
 =?utf-8?B?TXM4dWw1R0FJUTNlaTZmcTIrLzU4V2c5V1RycjNEVllIdXA3Q1FvcGFDc1J3?=
 =?utf-8?B?bk5OWDc2OWdMU1c2Q01JS1VFZTB0Q09yS0pnaEdNRjV3Y2IrNUxDaE1CQ2d3?=
 =?utf-8?B?cDFENlAxdTRwVndldkcweUpJYzRVMDN6Q1pjRXU2MVFCbTh2QnZQZFp1YzVL?=
 =?utf-8?B?bDUraURFd0UzL0UxN3d1Q2ZGcVdOcHRSd3JWMzF6elEwL0xYbzVQaDdoemEv?=
 =?utf-8?B?QkxEMFUvdk5ZNjNHTUtFdHdQSmdDbWRGbzFGZW43ZVQvM0hTT2JaNDZEdEFJ?=
 =?utf-8?B?ZXAranJJUHFNL0dOazV6eXZLc1EzTDQzcHdsdUx5L0NLNjlJeXdzQ1gxRXFY?=
 =?utf-8?B?U3l4MFdxYkhVTzN1QjYzdmtZcm51NDZ0dU5JbWMwS2ZzVVBxekhpcFJEYTc0?=
 =?utf-8?B?c1NZbzBLMnhrU0NSTkdPcnAzMWZ4WFBXOUlVRWk3UllGckZ5N0xNcVFlU2NP?=
 =?utf-8?B?d0R3MVE4SldqZ2oxZFFuN1FZczR5MjFHNkdWc0tHUXJqZTFscm5lSG9QdFJM?=
 =?utf-8?B?SWZrOUgvMzJsNzdyVUpRL2RMOWVCejFYTWRpekhlQUpzRDRyb0ZtQ3pYRjNP?=
 =?utf-8?B?WXZxQ0JCOXJ5dHA5VTI2Y3lSeGhPbUdXSmx2V0h5cmIvei9kT3oxSSswb1I4?=
 =?utf-8?B?emFia2p5cTF2Z0FMdW41QitORDhvaDIrMVVSTWVpU1owR3Vpc3ArQ1cyN2Yw?=
 =?utf-8?B?TmJpYnoxakl6MjNEb2N1alVRQndsT1lKSEZ4bnpLZ0paQ2dVRFVuNnhLZnF2?=
 =?utf-8?B?cTJhblBKeWQyUWdSMlFXWG9nUWIvNFNwMU9aOHdBSWhGcWVkVVdjaDBKK2lj?=
 =?utf-8?B?T0JKOHVDVnZVaDdCQ3UrVlo5dVltZHdwbHNDaFAvckY4SVZPS3NRTDdjWHNF?=
 =?utf-8?B?bi9wbnZGRDhPTm9RdDFwVVdqc01RY0VmK1lKbGN4V1YzTzhmeVlwN2xhK083?=
 =?utf-8?B?dThDMXlIWVNYdy9zQnJkSzRSTkt2WExvSzBtUDl1d0FqS1I4cUM0RG9wMy9C?=
 =?utf-8?B?cjRxcTA4UzJ4ZFQ5dmxYOWZvcUNESmw3ZWV5N3NLUG14LzlqbWRmTW9kU3JL?=
 =?utf-8?B?TTVlcUVqQTF5VHdIMXpNNEYzS0wrRHVLTVVXZFlBK0gydjBqZVpwSElqSHcv?=
 =?utf-8?B?cmY4N1g2Tm1LcFZhMUdNNkNSWWowSGxDdzRyNXQ2N0FkdjF5RldaQlJxelJJ?=
 =?utf-8?B?bDZEaFZTSmZaaG9vMGhtZWtBbHlzMGMrSEhyRHdLS2FKUWVCVGVuWUJvdUdx?=
 =?utf-8?B?MGhSNDNaTHhlU1h3cGlqWlF6UjYzMHQ5bVFIcW03b1FYcGNPZHB2bGtTM21t?=
 =?utf-8?B?YitkMmJRbUMyNDNYWVlzckYydE1nVGhSZTNVSjBDaEYzTysxWGFxT253bWhq?=
 =?utf-8?B?bk9OZ1I2Y3YxVGxpbWlHK2xLdHB5VVRoRHBkalQvZ0E4RUkyQVM2eDJSNnZx?=
 =?utf-8?B?RzlSY3NQaTFXbWVTdGQxQmNhMFFyUGVDR0hhTCtEaHN1dXNkREFrSEpZSFg5?=
 =?utf-8?B?Q1hiRE5qMTlvMTJyZm5EeW5CUTBhaElkNGxNMlF1ZHRXbWZXN3dNa1Y1aEQ5?=
 =?utf-8?B?eVpFQy82OFZFbzB2d2ZuWmNoMmZ6OGs5Zm5CMldBVHAwTlluUWt6NFpWRXJ4?=
 =?utf-8?B?RVAxN09PeGNtTnhoU3hHVFNPbEVKWlFXYVhKZ3QzdTFaS2h0ZG5oTUUwWmtG?=
 =?utf-8?B?cFBtZm1UVHZkOE5BaEEzZmh3eE1IcUovWHFLRTVpMjZWczByNGlMVFBTN2xF?=
 =?utf-8?B?ZUdpR1Y4NHpPQ3NqUEtwODQxKzdoQWRYYXVhNURPdDJ6aG5PSyszaVFFL2VC?=
 =?utf-8?B?OWhsa0RKbGxhYkNra3BIMjFtaWxULzBnYjlTTy8vWGt1WFFvY1EvRE4xM2Z3?=
 =?utf-8?B?TnNRUXdtUTZTaUkzMjFCTDlNK2pRTElkK1Z4dFovZlY5NHVYZ2lpQ1dYQm5K?=
 =?utf-8?B?Zlo5QlVCRFNybXoxZXI4dml6ZUpLM1l5ZzVaRW1ZckpXSmt3WjJpcTdWdzU3?=
 =?utf-8?B?Q0dpUXk3WVlMUS81NHEyb3ZsaStMTnZCZEJ2NmIxL1BlK3kwY3BZRXMvdmpa?=
 =?utf-8?Q?ZS3azESSe5hA6Irj4fpM+QtOR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 zkvE2cXIxsYQhh3Sa01ABEUf1paEQtr8iiXQoEGAF35UXbjd+yMLYbppUwlC50J1r51gZ+5TwW2UO1WGaP+M8hEEctC/i14BKsZkR9evA3gzrkJiw/Y8ydxsqfM/FGDNof2JzNUgOXZ1ELRCJmb9UE1k0IscpJMrTKP7gmPyu0wgn5HMcTGMvkYU/JEApMI2rqi6T7DnlWlWRXc5EoLwpME/Z9UF8JQo6E0kbrkUnPsVl4Yx4VsCTkZZyjI4jfUpni3yc3LNwLmFApRgmhMJAkmOwSC59K0DFbbJqvRTAr8ge8mnM/WFPOnKxY5arJnDH1/is4UjHPwpL9hLQoWZ6Ih8XqU1lGEfid0rhPAPF+ieIQvO46PMPuBNzJUageqXTnlzuMBEIywPrXX2eDqLjN6A4pLCWTnkvgJdzcnJC6+vwy6etQ7+I6vpMHWVm4DxD+tReV3F+w16YWnfbhmhIQWJwSxfQaBxwIBQ42OpifyRZX2wN3X6wHj+tE+tyYwKRVHJjfDA+Dk2+bpbO127GguVnPqSF/dslQ4rIWwI4ES/0fZoAc2vNrspGELuO6dfjczKtH/CjRJRlXPaU3MWBYYOiURw8RT6er6SGeh4FKc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a221438f-d9d4-46e5-78e6-08de2178c293
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 23:19:27.9768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tepkZtVjpUh4rGxBIqmnU4yjSh66LOUmkpCgBvW1gBKR+rV68RwzlPfOqfI/E7CuCGIq+Jwd4x4wf3zcowsDxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6053
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511110191
X-Authority-Analysis: v=2.4 cv=Jq38bc4C c=1 sm=1 tr=0 ts=6913c489 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dg2byL3Q4ILmW4z3jPEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ZLRb6BenHJR7XN7WP0imJz421j-FFoAu
X-Proofpoint-GUID: ZLRb6BenHJR7XN7WP0imJz421j-FFoAu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE4MyBTYWx0ZWRfX62b5dPypaQ6n
 GjIrs6EG4a5ZDZdS3RD7GzKKt7nBDw7FQ0um2RmFN3xTCGJSHEW0LifbkoEVlYFL0BDcouN8n+k
 y0kAgTL4qHHkpfikRmAp2T/LQhQDPHaIJzbtuTbv1ZhcUMXwCMKKg7OM7EOG+8Z1XJgwNphawzu
 TlHHin1oAGoEoWGBaAleyf17o89etFH70OK3FYRmFopFwC8yLoDpm6N7nCAFTf2L5zOcgeg93E2
 SpHGVTZ4Ll+pP85Re+KZQAer0pdCtXxFErxD6IPfRGlmZy384jUVxG4Zn+XmqFiiewUsxt63Xld
 Wvj64j5zFqUbPWUURuziXaOuHlx+aLo2jkuRsAqRCpdSeXvmReikOEai2ZriVDykSzMBA7N7d44
 qQNdB72+JvQGcCiuzfVZEnSJAGY3rQ==

First, I had been under the impression there might be some test suite 
changes.  New tests?  Something like that?

On 11/10/25 10:27, Kris Van Hees via DTrace-devel wrote:
> The mechanism to create uprobes by writing to $TRACEFS/uprobe_events
> caused probes to be placed in the dev/inode based mapping.  This means
> that all tasks that use that mapping are be subject to the probes

s/be//?

> firing.
>
> The kernel supports placing uprobes for a specific task (by PID), which
> avoids impacting all other tasks that share the same code but are not
> the target of the tracing.
>
> This new mechanism places uprobes using the perf_event_open interface.
> Perf event attribute configuration data is read from
> /sys/bus/event_source/devices/uprobe/ as needed (and cached to ease
> repeated use).  Underlying probes are now organized by PID-specific
> providers (uprobe$PID), and attach/detach no longer depends on the
> generic tracepoint support.
>
> The usdt_prids BPF map is no longer needed because USDT BPF programs
> are now task-specific.  The trampoline generation for USDT Probes
> discovered after tracing started can now perform a simple loop over
> all compiled clauses, adding those that match the probe description
> to the program.

Should we remove:
         libdtrace/dt_dlibs.c:   DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),

> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> @@ -974,19 +974,12 @@ gmap_create_probes(dtrace_hdl_t *dtp)
>   }
>   
>   /*
> - * Create the 'usdt_names' and 'usdt_prids' BPF maps.
> + * Create the 'usdt_names' BPF maps.

s/maps/map/

>    *
>    * 'usdt_names':  a global hash map indexed by PRID and whose value has probe
>    *                name elements at fixed offsets within the value.  This map
>    *                is used for get_bvar() to look up probe name elements for
>    *                any prid that was created after dtrace_go().
> - *
> - * 'usdt_prids':  a global hash map indexed by (pid, underlying probe ID).
> - *                The value is a probe ID for the overlying USDT probe and
> - *                a bit mask indicating which clauses to execute for this pid.
> - *
> - *                For a given (pid, PRID) key, there can be at most one
> - *                overlying USDT probe.
>    */
>   static int
>   gmap_create_usdt(dtrace_hdl_t *dtp)
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> @@ -20,21 +20,6 @@
>   #include <dt_probe.h>
>   #include <dt_bpf.h>
>   
> -int
> -dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags) {
> -	stp->dtsd_clauseflags |= flags;
> -
> -	return 0;
> -}
> -
> -int
> -dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags) {
> -	if (stp->dtsd_clauseflags & flags)
> -		return 1;
> -
> -	return 0;
> -}
> -

Okay, but then in dt_program.h get rid of
dt_program.h:extern int dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int 
flags);
dt_program.h:extern int dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int 
flags);

>   dtrace_prog_t *
>   dt_program_create(dtrace_hdl_t *dtp)
>   {
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> @@ -316,11 +319,71 @@ dt_provimpl_t	dt_pid;
>   static int populate(dtrace_hdl_t *dtp)
>   {
> +	uprobe_data_t	*udp = dt_alloc(dtp, sizeof(uprobe_data_t));
> +
> +	udp->perf_type = -1;			/* not initialized */
> +	udp->ret_flag = -1;			/* not initialized */
> +	udp->ref_shift = -1;			/* not initialized */
> +
>   	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
> -			       NULL) == NULL ||
> -	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
> +			       udp) == NULL)
> +		return -1;
> +
> +	if (dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
>   			       NULL) == NULL ||
>   	    dt_provider_create(dtp, dt_stapsdt.name, &dt_stapsdt, &pattr,
>   			       NULL) == NULL)

Why is create(dt_uprobe) being split off the other two create()s? This 
makes both the delta and the resulting code (a tiny bit) more complex.

> @@ -401,182 +474,57 @@ static void probe_disable(dtrace_hdl_t *dtp, dt_probe_t *prp)
> -/*
> - * Judge whether clause "n" could ever be called as a USDT probe
> - * for this underlying probe.  We can pass uprp==NULL to see if
> - * the clause can be excluded for every probe.
> - */
>   static int
> -ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
> +clean_usdt_probes(dtrace_hdl_t *dtp)
>   {
> -	dtrace_stmtdesc_t	*stp = dtp->dt_stmts[n];
> -	dtrace_probedesc_t	*pdp = &stp->dtsd_ecbdesc->dted_probe;
> +	int		fdnames = dtp->dt_usdt_namesmap_fd;
> +	uint32_t	key, nxt;
> +	del_list_t	dlist = { 0, };
> +	del_list_t	*del, *ndel;
> +	dt_probe_t	*prp;
>   
> -	if (stp == NULL)
> -		return 1;
> +	/* Initialize key to a probe id that cannot be found. */
> +	key = DTRACE_IDNONE;
>   
> -	/*
> -	 * Some clauses could never be called for a USDT probe,
> -	 * regardless of the underlying probe uprp.  Cache this
> -	 * status in the clause flags for dt_stmts[n].
> -	 */
> -	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
> -		size_t	len = strlen(pdp->prv);
> +	/* Loop over usdt_names entries. */
> +	while (dt_bpf_map_next_key(fdnames, &key, &nxt) == 0) {
> +		dtrace_probedesc_t	pd = { 0, };
>   
> -		/*
> -		 * If the last char in the provider description is
> -		 * neither '*' nor a digit, it cannot be a USDT probe.
> -		 */
> -		if (len > 1) {
> -			char	lastchar = (pdp->prv[0] != '\0' ? pdp->prv[len - 1] : '*');
> -
> -			if (lastchar != '*' && !isdigit(lastchar)) {
> -				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
> -				return 1;
> -			}
> -		}
> +		key = nxt;
> +		pd.id = key;
>   
>   		/*
> -		 * If the provider description is "pid[0-9]*", it
> -		 * is a pid probe, not USDT.
> +		 * If the probe exists (as it should), and the process exists,
> +		 * we should keep it.
>   		 */
> -		if (strncmp(pdp->prv, "pid", 3) == 0) {
> -			int i, l = strlen(pdp->prv);
> -
> -			for (i = 3; i < l; i++)
> -				if (!isdigit((pdp->prv[i])))
> -					break;
> +		prp = dt_probe_lookup(dtp, &pd);
> +		if (prp != NULL) {
> +			list_probe_t		*pup = prp->prv_data;
> +			dt_uprobe_t		*upp = pup->probe->prv_data;
>   
> -			if (i == l) {
> -				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
> -				return 1;
> -			}
> +			if (Pexists(upp->pid))
> +				continue;
>   		}
>   
> -		/* Otherwise, it is possibly a USDT probe. */
> -		dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_INCLUDE);
> +		/* Add the key and probe to the delete list. */
> +		del = dt_zalloc(dtp, sizeof(del_list_t));
> +		del->probe = prp;
> +		dt_list_append((dt_list_t *)&dlist, del);
>   	}
> -	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
> -		return 1;
> -	if (uprp == NULL)
> -		return 0;
>   
> -	/*
> -	 * If we cannot ignore this statement, try to use uprp.
> -	 */
> -
> -	/* We know what function we're in.  It must match the probe description (unless "-"). */
> -	if (strcmp(pdp->fun, "-") != 0) {
> -		dt_uprobe_t	*upp = uprp->prv_data;
> +	/* Really delete entries from usdt_names. */
> +	for (del = dt_list_next(&dlist); del != NULL; del = ndel) {
> +		ndel = dt_list_next(del);
> +		prp = del->probe;
>   
> -		assert(upp->func);  // never a return probe
> -		if (!dt_gmatch(upp->func, pdp->fun))
> -			return 1;
> +		dt_bpf_map_delete(fdnames, &prp->desc->id);
> +		probe_disable(dtp, prp);
> +		free(del);

Okay.  Just out of curiosity, under what conditions does one use dt_free()?

>   	}
>   
>   	return 0;
> @@ -1508,95 +1400,73 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	/*
>   	 * USDT.
>   	 */
>   
> -	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
> -	if (upp->flags & PP_IS_RETURN)
> -		goto out;
> -
> +	/*
> +	 * First check whether the USDT probe is active, i.e. its probe ID is
> +	 * in the usdt_names BPF map.  If not, ignore it for now.
> +	 */
> +	emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), usdtp->desc->id));
> +	dt_cg_xsetx(dlp, usdt_names, DT_LBL_NONE, BPF_REG_1, usdt_names->di_id);
> +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
> +
> +	/* Set up probe arguments. */
>   	if (upp->sargc)
>   		copy_args(pcb, upp);
>   	else
>   		dt_cg_tramp_copy_args_from_regs(pcb, 0);
>   
> -	/*
> -	 * Retrieve the PID of the process that caused the probe to fire.
> -	 */
> -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> -
> -	/*
> -	 * Look up in the BPF 'usdt_prids' map.  The key should fit into
> -	 * trampoline stack slot 0.
> -	 */
> -	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
> -	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
> -	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> -	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> -	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
> -
>   	if (upp->flags & PP_IS_ENABLED) {
>   		/*
> -		 * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
> -		 * prototype looks like:
> +		 * Generate a BPF trampoline for an is-enabled probe.  The
> +		 * is-enabled probe * prototype looks like:

s/* prototype/prototype/

>   		 *
>   		 *	int is_enabled(int *arg)
>   		 *
> -		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
> +		 * The trampoline writes 1 into the location pointed to by the
> +		 * passed-in arg.
>   		 */
>   		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
>   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(0)));
