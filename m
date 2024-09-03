Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08318EFF4
	for <dtrace@lists.linux.dev>; Tue,  3 Sep 2024 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385774; cv=fail; b=V4j1dTxA4o3iYYt7PEiThVEPJgF7i44lcxTsvtkyCjiz+cdHTVKanP8Ta1o8yEWQBrzsg48Fw91K8PzbC+uEdMRYVoZAjf36QutHm9OaEO0DwnMKsk+/pteF+BwX9bKBTY89DYJCAZaOi2csJljlZUdIbmVBFrpEoJuu7lFyzaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385774; c=relaxed/simple;
	bh=sdA+gj3ucIxZJba1hc8IieZTw+4HI8iI9fGPSKLzeOI=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DF8MiYzAHV/ZrpB3O+diyaSmHQsXG4PVAOsSH8y717dfoPZT/CAJL2aLZKpD8pT4uelQFdyuApCP0eTujO7MigPe2Akcnwslkt2/SKPbfRP6gYyHW0TI/8cp6UpIzD3J9K4F9+OlON74J9g8vEl4iNJhPK4qK+5m4ZMy3+VexIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XCAT8OcA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ktQrbhI0; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XCAT8OcA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ktQrbhI0"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483GtS3Y011136
	for <dtrace@lists.linux.dev>; Tue, 3 Sep 2024 17:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:from:to:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=x1H0rRuJnLpPiSDLEg1rA89yDeF8Ugo+9TG2o8ThoFI=; b=
	XCAT8OcA8YEzwX6n4cJyQSrHwt4v449Qdl/XHCI6xCXxoBEEqD1fpMMIXgxcTHxW
	fFZPAYrKGxqsYMKP8ClTbKTeKqjxQ+xNyipeucq7jGadjGZiIGw8m+hNonKkhKjQ
	ImYuGkf9Us9xUPvbUy+lEHU3ogrcycBkmxBED6l4TVsYPS3kjU8zbcyIxzvM9aLp
	bJvhDa9iEEJF/nZKZqVwgpRohRL2mxUHh1SQnrEuQ0NIWQti+Ie7ckUV/IWcelSY
	rcp5X85JPNHjlKJiaqTOALS/vqeHuA9jDov9DlPDKX5+icjR7UsQHYmcZ3oMJ14a
	04zdkylFwWyPUU05nnVifQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41dk84j8b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Sep 2024 17:49:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 483HFvLv036713
	for <dtrace@lists.linux.dev>; Tue, 3 Sep 2024 17:49:30 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41bsm91k5e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Sep 2024 17:49:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRxCNpyWv+8XUgmQqiH9UrjDfRT+OblaKQ4aJ7Xa+gJeo8gIYACAT6eVdsxsnWQbfo45IFbN3VEyeCNtRpWwGL/rQjloKxDnSckwVmFCAqAYcZc9npHlyLNVFtzr+wuKQ+d8Py3TsneB8r1c4mbWL4hWcyKajGs++s1WT2DGM1s8+YPbZdR1YCvGtkWz1DguJtuSxseagKJN6XKqOO4sN920cSJ8f4iLY2ZUvq4OqTuIHXkkppJmMVorWHbgRiad1PNZjOuaAeE8i/+bv+OnCGcazL02JHkJ+EUQq9RCYpHx4lCt+kY/8PT9OH2VBgvlx1R+biRk0XXBISahg2xkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1H0rRuJnLpPiSDLEg1rA89yDeF8Ugo+9TG2o8ThoFI=;
 b=Z8leTQh8/9DLldzAI+o3ga5QdwqPKZ23WyGh7ooFulx47yQly2lC7fXZdv2wLvCwWUgkn5zv7YIfdk60+LK1fq/UXNpc8bE4Q6RerOSDDP0r0KkPF8va8qiz+pSFyxJU5oNAVuGwLpU0b46FAcvEy+XRlj4X9Nx2F3gfbkn2jrUZha27mhx1cNw52lpD3ySsVa6jgcSKaRG9pidoNmSyjlkh+pHMTw8kafLdtJSAKANeP2XvRijIvEZYydzAcLIOj8xbbnh6VK61wPCyPb31ufB+I6Xk8DcPKeY9VKndjB1uN5DJaL6wG2cuS4dxEK9yvQ5UWCR12nh6uqYeqEP9Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1H0rRuJnLpPiSDLEg1rA89yDeF8Ugo+9TG2o8ThoFI=;
 b=ktQrbhI0ZEylhjUmnpiJImNKXK+/ij6HbD0by1BWu/AqeqO2hTNN5LUe2EIGg7icqSD8UGh9yxAhpC6z8e6LyvQo+ND8EX+UDQ98KS86wXYZfbpblSrOZX69VxirW1IcnO+XleD//T6EZTNJKYBIr5PeRxoK/5Ftd/cuWKTpNfk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7814.namprd10.prod.outlook.com (2603:10b6:806:3a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Tue, 3 Sep
 2024 17:49:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Tue, 3 Sep 2024
 17:49:27 +0000
Message-ID: <e48bdc51-6832-d23f-338a-a68327c8e12d@oracle.com>
Date: Tue, 3 Sep 2024 13:49:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 13/19] Get rid of relocatable EPID, dt_nextepid, and
 dt_ddesc[]
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-13-eugene.loh@oracle.com>
In-Reply-To: <20240829052558.3525-13-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0052.namprd03.prod.outlook.com
 (2603:10b6:408:fb::27) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 3baa2193-acd0-4349-62c3-08dccc40c116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHJ1VjJ2T1BxRkhoUnJBakhVU2ZjRjhJY2luREF4Ukg2emZCUGtHVVlIaGVM?=
 =?utf-8?B?bXYrSXlLMXBiaE1UV29mM2hYODlNKzFuTWl0S21wc2ozYmI2cXMyZ1VXTXdI?=
 =?utf-8?B?QTJqMDVFWnhBL20wNzdNSzFINmoxNWc5ZzduRkFIOWJ6ZTgwZGlweHVFbzZ3?=
 =?utf-8?B?ZHhObldzcDczcFNBdlF6QS9hQUJrR01PQjgvekhFNWlTMmtoNURWSlNkbGJQ?=
 =?utf-8?B?bWw0R1V1YTA3OWdQa2ZNWjhhcG5aU0wzdVpEYk9PZDZDTk03bUhJWnN1RWRr?=
 =?utf-8?B?QjVQZ1VwcUJvTW9zdUR5ZWFZUmVXMC80dEdENERZc2NLdEcyT01kTHlQT1R6?=
 =?utf-8?B?ZkRmaE40TGtpM0xqdnJxeEVzU1hvTlBQV0V5OVg1ZklBZkxlcVNMQy81S1hX?=
 =?utf-8?B?SjR6bWNaTDdFdGhyajF6a2lkYkNOVDRuNHd2OW5zQVB3L3RPclVQU1NRcHFU?=
 =?utf-8?B?ZUE5SHFKYVFGcjNiTTVlRXM5c0FRcWpJbkM2QUZ3cGlIZTlYSCthVmFQWkl1?=
 =?utf-8?B?VUxHeU5tam5FREV2TUh4YitOSzREcTVKQTFKVFF1eFIxclRLanA1TjYrbVFk?=
 =?utf-8?B?Yzlacll5RlJsc05DSFk0bVIzM21Qcy82cmRYUlMrRWJ6ZzlKbWNUcU1XNnFC?=
 =?utf-8?B?Qm84TDk1WTlKU3JFYUFMNjJNdFpLY0pCcGNpTjl1UGhuN2hENEhzMmFiMDRv?=
 =?utf-8?B?QTU2LzNLT1dhRlpzQ1NPVndmWFhZN29PR2FJdytyd0ZjVUVIZWtTb1Jvblda?=
 =?utf-8?B?OE4rNk5HZGJFQXJtdHNoSXYydlphYzE1cm0zampGZ1A1VjdnWHBOUmt0UUhx?=
 =?utf-8?B?Z2t6dnhTUXhBYXhDZlNncG5vdGM2N2dUMm1jRlgxVithSWloMkxpN3VVR3Zj?=
 =?utf-8?B?TCtvZnJtZ1liQ1YrV3Q1Z3JVL3dCQmpGa1FVMERKL0lMSitWQVQ3cXNsanAx?=
 =?utf-8?B?aUF2VGdPNTVUU0t4c0p6ZzJmMXh6VmxSeDFjRGJvNm5ZZ05GNmREcEVUamlB?=
 =?utf-8?B?aGJxSEVDZ0ozVWFjbEZVWk4vdkUvN2h2bHFNcEhWRDZyUFkwVzNqeVp1R3Zj?=
 =?utf-8?B?eEhLUkJPREVQL1hpNnlxczI4S1cwaDNmbTcyaFo5SXgvSlJkRGtRYlV3ZzM1?=
 =?utf-8?B?R2s0QmxuQUk2WHkvbXpDaE41bytDTzROSXhSWERibWVMQXR2UzlpMXZHeDZR?=
 =?utf-8?B?L0dQdnlEWVhDY2tidkF4Mno0L280UGpsYmk0bkNFYmk3RzF5Z1VJVGpMZ1dJ?=
 =?utf-8?B?bEZwM2hhRGxRZnJRVTFUaHlzb1Fka2xMWXplVDBqTXZHN1BVUE1haG5VUXU4?=
 =?utf-8?B?c0s5Uk0xMXJKQVNrUXRXTlA1MmVVUG9wMzN5UFJhYVZJeEVMSU10L1hhOHpm?=
 =?utf-8?B?UHEzYXY3ZTcxODVwODYxcnk4WGVwZ2dFeUpmdXF1ak53T3hBZ0draFg2VURs?=
 =?utf-8?B?dUM3cG9nMXFaeDZONGxUR1JsblpxMVU3OXNLY2ZNN1JiMTVpQW1IQUpvS01W?=
 =?utf-8?B?UW93SVBYR0RlWjBxdVQwMU5wZ1JvdzRtT2JTSjVKOHV2Qmk1SjZScXNjMXU3?=
 =?utf-8?B?VlBpajNoQkVjbGlVZklsdUNReVZBYytENTR2M0ZMc0p2d2hHZDN1RkdzN2ds?=
 =?utf-8?B?NzIzWXFCbGhkWE11MnJBRTFXSXhoenVnVGVSTVBNcG5WYUk4NmRtcXM0OENp?=
 =?utf-8?B?MGVBSmlVbjR4RXNkbWtaZC9jcnYxa0FjT3RSbGIwYVh6NHdwdnh2OWwydnMz?=
 =?utf-8?B?akpEK0JyVnE3NVM5ZGx6T25mUmgzQklFWGZnTWZVWldDb0h6ZnBKS3NXWC9o?=
 =?utf-8?B?Mnp3YzZ0aGlrOVBZS1Ftdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzVmUEhRTTc4Y0kwSWYyZEQrSXJMSjgxRDZYMmxidHBQMEp0TFp2Z3M3dDkr?=
 =?utf-8?B?ejliSjJxajNzU0xoa2VNWjBFRlpYUGQvbUFvQXFBTmJxMHhneThOTUlDZ0Ja?=
 =?utf-8?B?TGsvSkFHbUJiaWdWVHhpN2UyR25udWhMd3l6T05MZ3VNUG1rNldLM2RXM2VO?=
 =?utf-8?B?ZUdTZjRDK050NWc1cVhwalZzRlpTMkRTZmpZUWFQSnQ5T3ZDYWl4M0Y4Q0ZC?=
 =?utf-8?B?MEJBWTdyMjBPQVFzMnpSZnVvdTBWZ2xvQWlob1V4cnBRY0ZOVDMvWC9nQzBp?=
 =?utf-8?B?Z2RkRS9pQ3ZYY1VwNHFXREpISTAxdnhUUzdhZDg0Ynk2QVNJTHBEYzBiQTZ4?=
 =?utf-8?B?cDRGbjU0ajlMZjRTNkJuYTV6cnFuSUZaakxHQlU3K0t5MExVUTd3WUx4eXcr?=
 =?utf-8?B?R0ZRM2ROeFJXampEbHE2d1dmNHYxcytDOHdkRzZCQ1F1UHE0V3dlSERKK2s5?=
 =?utf-8?B?YkZHZWxnSS8wTEpJdkRlTXhHaERBaTl5QTJrdUM3dVZuaUg2L2d1aTdUWEsw?=
 =?utf-8?B?WWlyNlV6VlRBQUlXdmkrWlhaNTQrMzZtZWJETFRxQ3pYYnBHdkZNUERyNE9i?=
 =?utf-8?B?WmwzaXYvL3NTS2VTZjI1NysyWXBuRWdDOFdMU3hpVFQ5TzFoUDBuWjFTcm0w?=
 =?utf-8?B?YUhHOG1ibStUS2FJVjdLeVUwMjJoclhDdVFGU0Nma2ViejJuSWd5cldZU28r?=
 =?utf-8?B?OU5ocDhiVllraXRGN2FYUldQYkVsOFpVOWlxakxoL0YvTzZPU0NqNVBPSkZK?=
 =?utf-8?B?ZHlNNGJoa3hybGJzblNMbmxXdkxHN2FwcFQ4bTZjMTNNS29WWkprSmNTRk50?=
 =?utf-8?B?UXFCS3FyM1h3SUVDU2hxUGJvMm81aUxDZmMyc211aTNXUlRicTBqWkk0anRC?=
 =?utf-8?B?ZG9ndUtLQi9UbzVGTFJySlBUVnh0QjVIZ21zZ3VzakFVSlF0NHM1d25tODZO?=
 =?utf-8?B?cTUxZGgxYlRWK2VHR0g2WHI3aHBXdGxQN1NCazdvM2FDK21XWHBTUXlKTDRt?=
 =?utf-8?B?U2ExYkJpMStzKzhRYjZiUCs3by9QN3R2dmZhSHpZWlJ2dXdGTDVkL0dDbTRI?=
 =?utf-8?B?cW1TNVpVNkZOajhXeGpReTUxdlNKWUtjSVRocnora2JFdmlkM0EzSDRFRkxo?=
 =?utf-8?B?TDlIWUNBMHZoSldXb25wWVFnQlZKOEFjcFNob0dHdmZ3MUUwUUQvSnF5VWVD?=
 =?utf-8?B?OGF0Z2tZa0dWSDBlTUh5ekVCR3BGVmNhVXVLVllsMGtuR1cyd2hWRGdtRjdZ?=
 =?utf-8?B?R0RwdjdHaitPQTM3TDAxTzlsTFFOVWY5N2psVHZpOUhEUzcvUDB0L0N4NTNh?=
 =?utf-8?B?Ymo1UytaakdxMHdvZEJQYk9Ic3dWNzdtZkpoNmJUbHhTNlJNQW1KUkhLV1p2?=
 =?utf-8?B?Z3BWeUZlN0JZR1ZCZlZiM3Zzdm1NSVNVYlc3V242U2JmS055WStPL0NCZDV1?=
 =?utf-8?B?MVk0NWQ1eWU3Z3JzdDY0dXgvVE1wcWJhTS9JR1BicU56UnhPRDFrVk8yK1Rx?=
 =?utf-8?B?VVFmYUEvUENsK3JBNFN0czdGQUN3ay8zWWtZd293ditZUXk3S3g1SWFydlVN?=
 =?utf-8?B?V21ET0c2WDVDaEQ0Q0VXY0hZS2xGUTNBV2NzT3A3dlFQUDZ3bkVmMTFFbkRh?=
 =?utf-8?B?cFcxaXFJbnljQ0FtQU0vYjkzN25nQ2RQczNGMHlVb01HSDVvYzJPMmRlWkJq?=
 =?utf-8?B?Zk02QnN0azNSNXdHM0dsWGxobkNYaGhMczFkc0o1SWxURWdycTlFZHd6Q2wz?=
 =?utf-8?B?WnRsQWdYeEhvenBjOXAzQUg5OWpwcTJvVHpxanZITU8xdEpaU29DMG9oWFRM?=
 =?utf-8?B?NVBXKzBRaU1SdnhYbDNMK3FxMlpvZENMZUFTTHFSejFtOUd1eHdHZFZPVWpj?=
 =?utf-8?B?S3MyNXgxVllxRFpaRDNQK3JHVzFOSS9xZElWcWdCVFBCK21hT29tcHlVdUZz?=
 =?utf-8?B?N3dMQ2pady9va0JHUzRlT0dXNlhnR09QOWU4d0dmay9jT1VmRG1LcVdHVjd2?=
 =?utf-8?B?bWZOcUFwWUxJOVluMDJCVWFaQVdndStQUUQ4VkVmODdETGtsRnNwQ3hXNUVs?=
 =?utf-8?B?dmNPN1BqVWdVWnBWWHJ2dVY1MUtNMEo0WDdRZWU0QkZsWmUyUlQwNzFhWTFn?=
 =?utf-8?Q?7C7nbTwXAaTcjwK3AVKoId1yM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0683mAQdOQefowsh0GxFLIw1i4+5XvhJAzpHn5h5+trLwwDDwrLnxD+jHbNIZ2+dTupXh+PgVBmlWOIp7O9ugmpTM80DizlEmcKpHHR17+tPuVKIUvtuIICZ6xuNGjl8f7+FVXk5j0Ek1j7gFv1wDe6h1+b3TEZeyI0/fMkNgVHqQvqwCltSpM5Hxlfs7WcF/3yKGBi/5f6rc/QgPfIZWOWOAk5Ex1dwDH56slmXone/rZLCJrlCbC91ZlYDTZMLIYmrmrO8vTJ7NnbkYifxPvEqam1YccEYY7usoMWilBhJ28g93kak88N6wuDDr4tqTu1gtRZSufJikfHdQX7KvvjtIKzKYuD1VtS9IIe3NFj0497Ec4cBDIDghAomp4dKBWk5dsUGLS0tIa67fkA9+ivFH8LsyPR/aCrqmVKbwlHUg/hi99QWZZ3Ht9WtUX7oQOd7/No/+JUGmJHExRRO/vNjdEjF9mzp1g4smPXFv7fAJaQKuTEk91B9xsA46S/x4/mR1JXRPOQcm/NaHE0thC/ZOxY74wOayzk3uboT5Y6Vs8R3W374R7KSoChRLue5F+QuQT8QilxB/brTzdWJ46N+15KZbh827B5vM3cNTe0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa2193-acd0-4349-62c3-08dccc40c116
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 17:49:27.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDpe/lcGpXku9wJI1fvYyaY8yl+HWW3Qb4CjiLyByzRYSpwN5IsyYOyGnU7vyjsp+zEWjgXWfQd/WnmZNwwWjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7814
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_05,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2409030143
X-Proofpoint-GUID: CLaafLo72nWYzkEpzfoGHMHE6xauSbG8
X-Proofpoint-ORIG-GUID: CLaafLo72nWYzkEpzfoGHMHE6xauSbG8

Patch withdrawn.  It's been squashed into v2 03/19.

On 8/29/24 01:25, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> We no longer have to assign an EPID value during relocation.  So we
> no longer need dt_nextepid, dt_maxprobe, dt_ddesc[], dt_epid_add(),
> or dt_epid_destroy() or to track an EPID during linking.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>   libdtrace/dt_bpf.h   | 47 +++++++++++++++++-----------------
>   libdtrace/dt_cc.c    | 20 +++++----------
>   libdtrace/dt_dlibs.c |  1 -
>   libdtrace/dt_impl.h  |  5 ----
>   libdtrace/dt_map.c   | 61 --------------------------------------------
>   libdtrace/dt_open.c  |  3 ---
>   6 files changed, 29 insertions(+), 108 deletions(-)
>
> diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
> index 5b2df264..5981eb0e 100644
> --- a/libdtrace/dt_bpf.h
> +++ b/libdtrace/dt_bpf.h
> @@ -32,30 +32,29 @@ extern "C" {
>   					(dtp)->dt_bpffeatures |= (feat); \
>   				} while (0)
>   
> -#define DT_CONST_EPID			1
> -#define DT_CONST_PRID			2
> -#define DT_CONST_CLID			3
> -#define DT_CONST_ARGC			4
> -#define DT_CONST_STBSZ			5
> -#define DT_CONST_STRSZ			6
> -#define DT_CONST_STKSIZ			7
> -#define DT_CONST_BOOTTM			8
> -#define DT_CONST_NSPEC			9
> -#define DT_CONST_NCPUS			10
> -#define DT_CONST_PC			11
> -#define DT_CONST_TUPSZ			12
> -#define DT_CONST_TASK_PID		13
> -#define DT_CONST_TASK_TGID		14
> -#define DT_CONST_TASK_REAL_PARENT	15
> -#define DT_CONST_TASK_COMM		16
> -#define DT_CONST_MUTEX_OWNER		17
> -#define DT_CONST_RWLOCK_CNTS		18
> -#define DT_CONST_DCTX_RODATA		19
> -#define DT_CONST_RODATA_OFF		20
> -#define DT_CONST_RODATA_SIZE		21
> -#define DT_CONST_ZERO_OFF		22
> -#define DT_CONST_STACK_OFF		23
> -#define DT_CONST_STACK_SKIP		24
> +#define DT_CONST_PRID			1
> +#define DT_CONST_CLID			2
> +#define DT_CONST_ARGC			3
> +#define DT_CONST_STBSZ			4
> +#define DT_CONST_STRSZ			5
> +#define DT_CONST_STKSIZ			6
> +#define DT_CONST_BOOTTM			7
> +#define DT_CONST_NSPEC			8
> +#define DT_CONST_NCPUS			9
> +#define DT_CONST_PC			10
> +#define DT_CONST_TUPSZ			11
> +#define DT_CONST_TASK_PID		12
> +#define DT_CONST_TASK_TGID		13
> +#define DT_CONST_TASK_REAL_PARENT	14
> +#define DT_CONST_TASK_COMM		15
> +#define DT_CONST_MUTEX_OWNER		16
> +#define DT_CONST_RWLOCK_CNTS		17
> +#define DT_CONST_DCTX_RODATA		18
> +#define DT_CONST_RODATA_OFF		19
> +#define DT_CONST_RODATA_SIZE		20
> +#define DT_CONST_ZERO_OFF		21
> +#define DT_CONST_STACK_OFF		22
> +#define DT_CONST_STACK_SKIP		23
>   
>   #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
>   #define DT_BPF_LOG_SIZE_SMALL	4096
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 2510db86..b801c87a 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -949,7 +949,7 @@ static int get_boottime() {
>   static int
>   dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   		  dt_ident_t *idp, const dtrace_difo_t *sdp, uint_t *pcp,
> -		  uint_t *rcp, uint_t *vcp, dtrace_epid_t epid, uint_t clid)
> +		  uint_t *rcp, uint_t *vcp, uint_t clid)
>   {
>   	uint_t			pc = *pcp;
>   	uint_t			rc = *rcp;
> @@ -1030,7 +1030,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   	for (; len != 0; len--, rp++, nrp++) {
>   		const char	*name = dt_difo_getstr(sdp, rp->dofr_name);
>   		dtrace_difo_t	*rdp;
> -		dtrace_epid_t	nepid;
>   		int		ipc;
>   
>   		idp = dt_dlib_get_sym(dtp, name);
> @@ -1045,9 +1044,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   			}
>   
>   			switch (idp->di_id) {
> -			case DT_CONST_EPID:
> -				nrp->dofr_data = epid;
> -				continue;
>   			case DT_CONST_PRID:
>   				nrp->dofr_data = prp->desc->id;
>   				continue;
> @@ -1212,13 +1208,10 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   			rdp = dt_dlib_get_func_difo(dtp, idp);
>   			if (rdp == NULL)
>   				return -1;
> -			if (rdp->dtdo_ddesc != NULL) {
> -				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc);
> -				clid++;
> -			} else
> -				nepid = 0;
> +			if (rdp->dtdo_ddesc != NULL)
> +				clid++;               /* FIXME: dump this? */
>   			ipc = dt_link_construct(dtp, prp, dp, idp, rdp, pcp,
> -						rcp, vcp, nepid, clid);
> +						rcp, vcp, clid);
>   			if (ipc == -1)
>   				return -1;
>   
> @@ -1259,7 +1252,7 @@ dt_link_resolve(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
>   			continue;
>   
>   		/*
> -		 * We are only relocating constants (EPID and ARGC) and call
> +		 * We are only relocating constants and call
>   		 * instructions to functions that have been linked in.
>   		 */
>   		switch (idp->di_kind) {
> @@ -1332,8 +1325,7 @@ dt_link(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
>   	 */
>   	insc = relc = varc = 0;
>   
> -	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc, 0,
> -			       0);
> +	rc = dt_link_construct(dtp, prp, fdp, idp, dp, &insc, &relc, &varc, 0);
>   	dt_dlib_reset(dtp, B_FALSE);
>   	if (rc == -1)
>   		goto fail;
> diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
> index 060cf28b..140ac9a6 100644
> --- a/libdtrace/dt_dlibs.c
> +++ b/libdtrace/dt_dlibs.c
> @@ -74,7 +74,6 @@ static const dt_ident_t		dt_bpf_symbols[] = {
>   	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
>   
>   	/* BPF internal identifiers */
> -	DT_BPF_SYMBOL_ID(EPID, DT_IDENT_SCALAR, DT_CONST_EPID),
>   	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
>   	DT_BPF_SYMBOL_ID(CLID, DT_IDENT_SCALAR, DT_CONST_CLID),
>   	DT_BPF_SYMBOL_ID(ARGC, DT_IDENT_SCALAR, DT_CONST_ARGC),
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 2378235c..3fa2b9d7 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -343,9 +343,6 @@ struct dtrace_hdl {
>   	ctf_id_t dt_type_symaddr; /* cached CTF identifier for _symaddr type */
>   	ctf_id_t dt_type_usymaddr; /* cached CTF ident. for _usymaddr type */
>   	ctf_id_t dt_type_void;	/* cached CTF identifier for void type */
> -	dtrace_epid_t dt_nextepid; /* next enabled probe ID to assign */
> -	size_t dt_maxprobe;	/* max enabled probe ID */
> -	dtrace_datadesc_t **dt_ddesc; /* probe data descriptions */
>   	size_t dt_maxagg;	/* max aggregation ID */
>   	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
>   	struct dt_aggregate *dt_aggregate; /* aggregate */
> @@ -779,9 +776,7 @@ extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
>   extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
>   extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
>   extern int dt_datadesc_finalize(dtrace_hdl_t *, dtrace_datadesc_t *);
> -extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *);
>   extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **);
> -extern void dt_epid_destroy(dtrace_hdl_t *);
>   typedef void (*dt_cg_gap_f)(dt_pcb_t *, int);
>   extern uint32_t dt_rec_add(dtrace_hdl_t *, dt_cg_gap_f, dtrace_actkind_t,
>   			   uint32_t, uint16_t, dt_pfargv_t *, uint64_t);
> diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
> index 9011da5d..26f101e4 100644
> --- a/libdtrace/dt_map.c
> +++ b/libdtrace/dt_map.c
> @@ -85,46 +85,6 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
>   	return 0;
>   }
>   
> -/*
> - * Associate a probe data description and probe description with an enabled
> - * probe ID.  This means that the given ID refers to the program matching the
> - * probe data description being attached to the probe that matches the probe
> - * description.
> - */
> -dtrace_epid_t
> -dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
> -{
> -	dtrace_id_t	max = dtp->dt_maxprobe;
> -	dtrace_epid_t	epid;
> -
> -	epid = dtp->dt_nextepid++;
> -	if (epid >= max || dtp->dt_ddesc == NULL) {
> -		dtrace_id_t		nmax = max ? (max << 1) : 2;
> -		dtrace_datadesc_t	**nddesc;
> -
> -		nddesc = dt_calloc(dtp, nmax, sizeof(void *));
> -		if (nddesc == NULL)
> -			return dt_set_errno(dtp, EDT_NOMEM);
> -
> -		if (dtp->dt_ddesc != NULL) {
> -			size_t	osize = max * sizeof(void *);
> -
> -			memcpy(nddesc, dtp->dt_ddesc, osize);
> -			dt_free(dtp, dtp->dt_ddesc);
> -		}
> -
> -		dtp->dt_ddesc = nddesc;
> -		dtp->dt_maxprobe = nmax;
> -	}
> -
> -	if (dtp->dt_ddesc[epid] != NULL)
> -		return epid;
> -
> -	dtp->dt_ddesc[epid] = dt_datadesc_hold(ddp);
> -
> -	return epid;
> -}
> -
>   int
>   dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp)
>   {
> @@ -140,27 +100,6 @@ dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp)
>   	return (*ddp == NULL) ? -1 : 0;
>   }
>   
> -void
> -dt_epid_destroy(dtrace_hdl_t *dtp)
> -{
> -	size_t i;
> -
> -	assert((dtp->dt_ddesc != NULL && dtp->dt_maxprobe > 0) ||
> -	       (dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
> -
> -	for (i = 0; i < dtp->dt_maxprobe; i++) {
> -		if (dtp->dt_ddesc[i] == NULL)
> -			continue;
> -
> -		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
> -	}
> -
> -	free(dtp->dt_ddesc);
> -	dtp->dt_ddesc = NULL;
> -	dtp->dt_nextepid = 0;
> -	dtp->dt_maxprobe = 0;
> -}
> -
>   uint32_t
>   dt_rec_add(dtrace_hdl_t *dtp, dt_cg_gap_f gapf, dtrace_actkind_t kind,
>   	   uint32_t size, uint16_t alignment, dt_pfargv_t *pfp, uint64_t arg)
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 8ae6cdfa..848141dd 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -739,8 +739,6 @@ dt_vopen(int version, int flags, int *errp,
>   	dt_proc_hash_create(dtp);
>   	dt_proc_signal_init(dtp);
>   	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
> -	dtp->dt_nextepid = 1;
> -	dtp->dt_maxprobe = 0;
>   	if (dt_aggregate_init(dtp) == -1)
>   		return set_open_errno(dtp, errp, dtrace_errno(dtp));
>   	dtp->dt_vmax = DT_VERS_LATEST;
> @@ -1303,7 +1301,6 @@ dtrace_close(dtrace_hdl_t *dtp)
>   	if (dtp->dt_poll_fd != -1)
>   		close(dtp->dt_poll_fd);
>   
> -	dt_epid_destroy(dtp);
>   	dt_aggid_destroy(dtp);
>   	dt_buffered_destroy(dtp);
>   	dt_aggregate_destroy(dtp);
