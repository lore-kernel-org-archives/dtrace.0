Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616AF186A
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 05:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742275603; cv=fail; b=A9J0Qx+twUUQ/w0ZJw7NNcSCMVcGsTzOKfGKjDDqqu1yL7LK4AfKujB54yX0AuePqb6SQ8m9sWCugu3l8f6PCX1ckcwVvCtFd26Nmqyr+1NJ3hoUQteVzq3OWtYusdwyavAn6McWKtxFyGfjR6RVp8KDd8yo4yzKInKphbVMuOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742275603; c=relaxed/simple;
	bh=CPPELtcuF0HhED6zU5dQX0jNeVl4iA/OGzV/Qns1B1s=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vFPv78NbLIjyWtRd2CJ9h/pDdjj1OoXpOMUBKLMYjG4HgvfJ1Dn3LLkc7yQ41TMsOqj2o/Tw+LTJUBCrjkBoJbvijHXn/84PreZyh1mia1GYuogi56rh4EWlVwBJFdFmTb9VmOKHOY5gZY3ZyeDAP/yzMt56bFOWOUvcEGxguBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fwh9P0Hj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wfQcwWx3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fwh9P0Hj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wfQcwWx3"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HLuRqM026993
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=I8IOtgDxXWDLD2czzso2hNkiU3MDxl5lq+QZAKv9JHw=; b=
	Fwh9P0Hj5ShfedEDcofzIMyZdzTAebowvidDjrSPnrG4gU+u1P+0gVv1DI3b6FOF
	HdTie9Z3/z1b5pJn9excZQ1Vd2Wobp+AuDOeYjOY8aIpUpvFoAwWaIGk3rK2EEXw
	+XrjlVTeNmaRm32cNUYzX1EFmq1v/CvCNkrM+ZisYSHsLqwMRP8amW8bLheNMooS
	omH2X3ZPvofBkr3vlKdGAY1o+1BBDyoWoJeR7UNtmaPvJ0jwrJ37Q2AEGEGvt6eY
	nQS9q+98Hp4HOreXiMoyQ/fkndFRR/lhq3mZppIyquTapPAzmHZGENXJ/W0tonQV
	ZfcB4B1OR978Is3GgkAVQg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m0vbaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 05:26:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52I2x03X008882
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 05:26:37 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxky3yfk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 05:26:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMIWEr2jCGlvUfT+dkSJeFyg+lQDrIFY7BlLScbNubwIeS1LdrIKz1acufUQyNnV04GuiEh0W9bErscJabkUqBtnXmonF8W4e0bdeD4urANF4iIkwKnZ6TmIfmtA6hiLydX6m2Zq19/bUfLG3WlgoyixH4jgAMhVPHdN5OhxfcyOboTY+Ada7GdYwNs+SCd1ZqsxvL7aZbn+YkY8rl//n4zKWTT7Ikyeq2hwrNeDsA+posO7XBcj5fCMI3i2059hFHNQO+LefCdfRJKy8189jE4/1gK1mNywrejgtD1ebk/ZaIG9YLuywf5RZzjIvybPUsmGtziLUSwUXxlzin4c4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I8IOtgDxXWDLD2czzso2hNkiU3MDxl5lq+QZAKv9JHw=;
 b=Fb1jb2B2mpxmgojh2EFGTPDSQCqWp7NI7JoS9O4DNwFNHL2lqD70Puep6GqbsPO8smPhwJTdVD0/yqyg/ykTrzn94js+XssEcDytLi4FclLmXHqK17QfFXj1Ea9xJZ0aR2X3MU5MEw3vkIuNT0Tr38byPZVrMYZ+fX68BnAKfvPo9CbObP6O0pB4EVyB+QitktHvA0qgIdxwevaQibrdnIQe9zYPRhDp2ok8+ff7HX9H9AMCedW736dnSOLvEAU3qBit0W0FEHrilPpnlpn9/mW72c2f2/GkbjYBY1G7/4zXARLoQYYOaubMYk2FIuJV3DiBAYeaJj6sqFxAUCrRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I8IOtgDxXWDLD2czzso2hNkiU3MDxl5lq+QZAKv9JHw=;
 b=wfQcwWx3R0ao71TtY9FZmjcPIaWcqkte5Wqkv9DirhXzRkMGmxfpUy6otUITxJ01dy4muWR02Zn/5wP2JcwHtNCkxYBU12/9iWo1S0HLKm385/jQkSHQZXEpuYBb35dUXUtLZYBgRl454rE2PRXEjKJqdQA6z88di8W30eq57KQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5165.namprd10.prod.outlook.com (2603:10b6:5:297::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 05:26:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 05:26:35 +0000
Message-ID: <c0a6e73e-cab7-5d25-eb2c-50bd7f1eb801@oracle.com>
Date: Tue, 18 Mar 2025 01:26:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 5/8] symtab: add support for 'traceable'
 flag
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
 <20250307213441.9495-4-kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250307213441.9495-4-kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0204.namprd04.prod.outlook.com
 (2603:10b6:408:e9::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: 6560c01a-f926-4781-68a5-08dd65dd7366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2xzL2QzWDlneTNDVnBtWjNyZmFvMlAyaEhtcUVSMTZUSDdtT0tLNWNZdjFF?=
 =?utf-8?B?eFdQbWxBNlFZWWNaUUhjZFlVazNPZy8zUHcrakZXbU9WVEhEamRtSWFMUm9j?=
 =?utf-8?B?YlB1eWN3VnBLZ2ZDbURwQ3FQUjBPcG5Vb0VFQml6YXo3RGxnbm1PY0lPM3Fm?=
 =?utf-8?B?WE96amtNdVBQVWZmaHNpUGZERFZYQzZOblRBcVZwcGZ5RjRhNFg1b1ZMRXFs?=
 =?utf-8?B?TldSZVMzSDc5ejFYN1llaWpMdVc0cllDbWNZNklCWGgwSVRtazIvQnBwZGZS?=
 =?utf-8?B?ZVhjajl2dlZkUHZWdnBpUW5lRmh1cmlTWThRU0U3cnpHbjNmSnNGK1JVR2RV?=
 =?utf-8?B?bTIyLzUxcXMyMWYyVDI2MWxYUzNDT0pzNkdZL2FhSC9tNVZPSjluZGcybndI?=
 =?utf-8?B?U3kxOTVmQ29keFVNSEpJWC9mdThSYUhLUzAxZkUxWkNsNG0rb0lUMjlhSlpJ?=
 =?utf-8?B?UFIyVnBtRW5yUmhYbzFvZjh6SmRGNlZxUVVkd0kzK09peS9ZZ2hNNFEwVU9G?=
 =?utf-8?B?aVNvSDdwa1lXd0VtdTF3NlJaWS9rSDhYK3IrY1RPTHZKdVhVQnduOTBwSkxX?=
 =?utf-8?B?MmRRZGlZVjE0VzV2cGFJajFTWlMyMFhjdVpHMFFINU9aaU4vRGs0SjREMzBR?=
 =?utf-8?B?ZHo0SHJuT0Y3K2FiQjBTbFY2ZTd0SWlFNG03TXJXSmRrL2RKT2taeEZaRHQr?=
 =?utf-8?B?K29xYWlBSjVVN1VmSi9pdWdlaDFtRkppQkpKMDZDRlRzN21xTEEyekdBVTlk?=
 =?utf-8?B?OGdqWER3VlB1Z2grYTZReEhVRGtwaUVmYzNTZnZnQmozbmx1dWN5N0tCSkJl?=
 =?utf-8?B?Q09NZUplNkhLSllEM25BL0FRNXJTZEFWSGdwWEJJMkVmUEh1VUxmbVVUdEx4?=
 =?utf-8?B?aHFmK3k0UXBhTEIwKzBFYUZDYmJYbThtQXNVTXZCMDIyRHRBcFRzS2RRb2pR?=
 =?utf-8?B?dzA5Q0phdUJTZGQ4TTlUZVdaSHhPOHRxM084TzF5OTN1ODRoMmZrQUt4eStX?=
 =?utf-8?B?bFJBMlpuMXpiL0NnMnUyVitpOFVDZGNFbGxIV24wdDlzSytDU0dUYytRNDVX?=
 =?utf-8?B?RW9vSmRsUGhKTjR1VXFIWlFoTWNVc1lnTlorRlVMSEdEYm1Sc0t4TUt2L1J3?=
 =?utf-8?B?OFN0bm1IZjF2em1qUWlMeTZKRWIyVVlQQ3ZsNkxFenpLc0pqdnJzTVdINjFo?=
 =?utf-8?B?ckZlTCtXUkNadlFjUDg0NTVySzRpaHpTTVZBMy9tU0tndXhkb0diOFUzMnJE?=
 =?utf-8?B?TnRBME1HejV6NWFvRGUxNS9zaDk2dG5pUWsybFkyeHoxaGFoaFdVaHJyL0Za?=
 =?utf-8?B?RFRnd1ZvUGFhMmJRWnBLNGQ1eHlxQlhhQTFCSks4ZTM0RVFHYVJQYzdNd1RV?=
 =?utf-8?B?azBIVkhMaktKOGVZNEMyTVN3WWVjZjNjWWxOQUJpT0JzRXlLc1BaWHlYUFI5?=
 =?utf-8?B?b0V4WTdyM0xxYjBobzF6dGwwT3lseGFObnFLTzA0Z09MMHlhOWcvaXB6K3Z3?=
 =?utf-8?B?OEtSc0g4SkZlaXN0RmJNSW51dnRPSkVDKzVGR1JrczZNUWF0Z1NYN2t3NmFS?=
 =?utf-8?B?MHNDN2JSSjh1djd2ODV3QkpBL1NSUWMxd2hEWVFNTlIzUHJyNklhd2JWVXo2?=
 =?utf-8?B?MGJOaitXckFub1d3aUlISGRnc2FhOGgzcGQxRW14a2tXNFFjcVRvSVlsSzhC?=
 =?utf-8?B?ajZuN1NGZzd6TEtRSjA4TUpHeXpLeWlPMHRCa0dUY1dheWlxUDAxMnI1eTl2?=
 =?utf-8?B?LzFxZlZMd0wvMlVpL1RjYytoZWVWZE82VkVJZThEZzVnRDNWaXRqeGhCMWJR?=
 =?utf-8?B?WUdzZHZnMUYxY0k4WVVkVm5Pa2JhbjRZdnJPeEZZTTd2cDNBVWdqUlpHcE1v?=
 =?utf-8?Q?hxjvSrlxXlsxL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THB4MmtJZkNwRzZUc1Rlc3lyeU1Zd0RqbDdzbjhjR3NQbWdaMUZlcU5sbnhD?=
 =?utf-8?B?cDgvL0RMaTRpYzlna1JzMVl0cXgzaFZHcHJRSXJNVjFVRFZEMVBYQ3laTHQ5?=
 =?utf-8?B?b3dZRUV1eVJPSWdHRFNCNEVvV0trMENxRUxvUmIrdmRLOS9kcDVWMGVITjhW?=
 =?utf-8?B?NjRlN2YydFF1bmdvRFpvYUhyRGpjWTJSQnhWY1dUbzJVR0ZIaVRyY01Ld3hU?=
 =?utf-8?B?QnE0L0g2RTByNCs5UDBQWi9hMm5pWXBzK3BGNXM2RGNDTmZySmY0YjlUSXEw?=
 =?utf-8?B?bnV2T1ZDRlVUZEhtWS9JVDBWUTJXZFFPMDFoYVRCUEk2K3Q1U29LcGI1MEdp?=
 =?utf-8?B?dER3Um4vR3dVb0t3Y0ZDN1JuMVRWbmdyQVBVQnkrUWxhV2NjWmFkUWVBNkZZ?=
 =?utf-8?B?MnJHUDZUcnNiOEdaZ0pSVVZacHVmRXl0UmZSd3lpRGUxcE5iY21uRGFsQUJC?=
 =?utf-8?B?YUpiVEhSWld3bUY1N3NjM0FCU0UxT0NsRFR3YTEvajB2anloLzhhc0toOXZj?=
 =?utf-8?B?SUNCMzRYZHVoekExYlllY2l6NkZSeEo0M3lUYkdZNkNVQkdSSWVRaXBrWW1j?=
 =?utf-8?B?R1NUUTZsOTRFdU03VEFENTRESzlob2tIR0JZM016YzkzZWRNNkViMHZkOS9s?=
 =?utf-8?B?L0ZGZnNaUGRISFk5aUhnOCtTbFJtVy9uU1RmWHFvdjBkWHAvbkFOdlNBZlUx?=
 =?utf-8?B?Skd2c01nSmMrRXl4SWFWWDhnOXFTTkYvNzRUK1IvdC9pWE56ODZhcGd3QTFn?=
 =?utf-8?B?VlZPNVB4U1FnbHZ2bXp6VTkyMTZFWTc0dmFyR2pUTHRMNlp3My9uWi94aDVP?=
 =?utf-8?B?d0lIRCsyL1paK2VBbkt5Vk9rS2Z6T0F1bVN3UlpxNnFBVmRram1hMEpob2I2?=
 =?utf-8?B?d3R3TzlNd1lqbWlxWmRReUttK2J3WXM3VzRoYzI1eFVqenlidWFsU09Nd08z?=
 =?utf-8?B?STltWlQxemRuUVNyMTlCQ01tM0F6MmcvYUU2TXRSOExXdi9jdFdSRWI4dkVG?=
 =?utf-8?B?TXp0OFpQRnNhL0xqeFRzajVSdGRiRzdNQVpGSFpYekEvSEtLZFBwd3dqNlNn?=
 =?utf-8?B?ZG9WUDZFL2xVT0VxZCtvYlpNTkNxYzBBNjdlTGRhQzBROTdrRWUrN1oxRGxH?=
 =?utf-8?B?UGVaKzZwZUMvMlBJY0VqREo1Rmw0cllHMVdKZ05zVDNEWml2QSt4di9qTXI4?=
 =?utf-8?B?SjJEUlgzdTdFUzMvdmJ1dHRwWkMwbWZnaG9aQmZpazdLcjUyUldQZXBtRFBF?=
 =?utf-8?B?NE0va2dQSmgzWjQ2TnR6VE9oL2FhQUluOFNtRW9hNUlmK29hN2dCTzNZVWM5?=
 =?utf-8?B?Y3VJVi9mYzRWWHk2YTkrajVpUG5TU3Q3WFhHVHhuSmUyNUVrd2w1amJ1a1l3?=
 =?utf-8?B?THgzbmlIOVNYZkszWU9hcHd4VTJLVnNUNWFDbGUzN3dWU0hLZ1RVbWNBMlN4?=
 =?utf-8?B?eEwzNnVLRTllcXhibzZXZDNwa3pYOStsSkhqL0NsN0lmSUg5MGF4U2lLbjlk?=
 =?utf-8?B?U3gvR0JjRVQxZDQ3VnFKUDJjdWdYSWxGWmZKZ0hvL1lCZEx1d2QvVDN2SFJw?=
 =?utf-8?B?M0NOSTY0ZlJNcWxXanFYeFZ2cWVVOG5KTDhsOFNac096ZXZpeVZqc09Lek5Z?=
 =?utf-8?B?NG9UbTFlYjNPTHJUMUJTamRSUzJvck1tempwSGR0blJxT2RqQVBOVGNUQ2ZO?=
 =?utf-8?B?N0lBNWM4RHd0M3hlbGZ6azlTNjZ0VTg4dG1NNURiZDl5TXlwUlhlT2pEUDcr?=
 =?utf-8?B?LzJHanpSU0JyYlkzK081eldOcGU5Tm9wMXZzUEg0bXRtSDE4TXVPN3dNTlBs?=
 =?utf-8?B?UC9Vb0FHTE5PS013RHd5R0YwYkJsSytuT3VDOVJJK1dKa0xBdUIyYXhrdHlD?=
 =?utf-8?B?QWF0NUxNZVMxdTRMY3FpeUVFbWlWRTNreFJ6d05FeWcrcEg3aG1UZ3paRzU5?=
 =?utf-8?B?S0dKUWVKMFZLbWN1ZlNZZEJ5TG45WmZ3WWhnVnRLR3kxMVliVC9tYm53NU9F?=
 =?utf-8?B?TGhRZVVwbEYzS1BHL1Q3bmJzNXJoZHBTWjdGTGc2RktLemZVZmwzWkpRSkxa?=
 =?utf-8?B?cEt5WjNwQTJNSXhDTHplWlNJY0sxdGxnQ1RBdjBnSkpFSWs0bU03MExuVWZk?=
 =?utf-8?Q?/G6AwuvchczIDigXVOO/Rnfr8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gGuHAjH+XJs08Kihn3fyPxMhqZq9ImTkDdWTA/GmG5FWzKQnY1Mi99YQ0SVoelUjXXCuNITluwZ9flFiw4Icp+ILfgwz1BwMF9hE38/yQ9Ed3LOPXCYTTwwiS+Snju2xO9Fuk7dbUJ/0zsOTwIDVO/LXxPcA8gr9coXh9Uzk61xy7iN6CScPlL0BqBaFdxCHwEBRo/qGe7IYOfxsCvMf0D7wCTRIL8AVNesEs7h6VJ70v/qfI419Qunb3joSZvNoW+0ULFF5w+N6EFnIN7JEzg0rLxSYdGS4DlRutCDlXCdwXXH28/E6MEYwJ8xF4Y0UkuUJEq17iLmpyPsMeytniib4Qu5a3oa9G5lHfnlK3FDUtZCNSJ7G3E2QG3C6+729QDpyOi4REV45TxJLpoNPsk6zIGpm/fXo+kDp/aJG5zg14gHgmg+D7V3GgAoAXh2bZSQynNmmOiONNfcmDqrVNdayAmymW6rvp90SvgG0M4Z24KWl+jq9KYSfCbn1G2fP8MItju9xJ967vcwfkbxRZ+cEfi0d9fhugt3TZvnwAJtMTh8tOZsADdNrhY8dh66ybwMFfTs3D8XdzTyitJsm/Z3QY9JtxIQhJueruAaTEfU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6560c01a-f926-4781-68a5-08dd65dd7366
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 05:26:35.6336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6jjshMWbazyoSZydmJu7dUmiLA9B9A6+h8XvM+ovzttFQxAmAtZPN8TBtP/2j3tp+AU8bPyf68uDct5pOBn3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5165
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503180037
X-Proofpoint-GUID: FqntQwY5DqUfAps_Ie44IArzMOK3PKbS
X-Proofpoint-ORIG-GUID: FqntQwY5DqUfAps_Ie44IArzMOK3PKbS

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
Note...

Both files need updated copyright years?

On 3/7/25 16:34, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_symtab.c | 53 +++++++++++++++++++++++++++++++++++++++----
>   libdtrace/dt_symtab.h |  6 +++++
>   2 files changed, 55 insertions(+), 4 deletions(-)
>
> diff --git a/libdtrace/dt_symtab.c b/libdtrace/dt_symtab.c
> index db63cc88..4e46f280 100644
> --- a/libdtrace/dt_symtab.c
> +++ b/libdtrace/dt_symtab.c
> @@ -23,9 +23,12 @@
>   #include <dt_string.h>
>   #include <unistd.h>
>   
> -#define DT_ST_SORTED 0x01		/* Sorted, ready for searching. */
> -#define DT_ST_PACKED 0x02		/* Symbol table packed
> +#define DT_ST_SORTED	0x01		/* Sorted, ready for searching. */
> +#define DT_ST_PACKED	0x02		/* Symbol table packed
>   					 * (necessarily sorted too) */
> +#define DT_ST_TRACEABLE	0x04		/* Symbols have traceable flag */
> +
> +#define DT_STB_TRACE	8		/* traceable symbol */
>   
>   struct dt_symbol {
>   	dt_list_t dts_list;		/* list forward/back pointers */
> @@ -275,6 +278,12 @@ dt_symbol_by_name(dtrace_hdl_t *dtp, const char *name)
>   	return dt_htab_lookup(dtp->dt_kernsyms, &tmpl);
>   }
>   
> +dt_symbol_t *
> +dt_symbol_by_name_next(const dt_symbol_t *symbol)
> +{
> +	return symbol ? (dt_symbol_t *)symbol->dts_he.next : NULL;
> +}
> +

Obviously, not a big deal, but this function seems to have nothing 
really to do with this patch.  Arguably, its introduction should be 
deferred to the next patch.  But, I'm fine with leaving it here.

>   /* Find a symbol in a given module.  */
>   dt_symbol_t *
>   dt_module_symbol_by_name(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name)
> @@ -548,7 +557,7 @@ dt_symbol_name(const dt_symbol_t *symbol)
>   void
>   dt_symbol_to_elfsym64(dtrace_hdl_t *dtp, dt_symbol_t *symbol, Elf64_Sym *elf_symp)
>   {
> -	elf_symp->st_info = symbol->dts_info;
> +	elf_symp->st_info = symbol->dts_info & ~GELF_ST_INFO(DT_STB_TRACE, 0);
>   	elf_symp->st_value = symbol->dts_addr;
>   	elf_symp->st_size = symbol->dts_size;
>   	elf_symp->st_shndx = 1; /* 'not SHN_UNDEF' is all we guarantee */
> @@ -557,7 +566,7 @@ dt_symbol_to_elfsym64(dtrace_hdl_t *dtp, dt_symbol_t *symbol, Elf64_Sym *elf_sym
>   void
>   dt_symbol_to_elfsym32(dtrace_hdl_t *dtp, dt_symbol_t *symbol, Elf32_Sym *elf_symp)
>   {
> -	elf_symp->st_info = symbol->dts_info;
> +	elf_symp->st_info = symbol->dts_info & ~GELF_ST_INFO(DT_STB_TRACE, 0);
>   	elf_symp->st_value = symbol->dts_addr;
>   	elf_symp->st_size = symbol->dts_size;
>   	elf_symp->st_shndx = 1; /* 'not SHN_UNDEF' is all we guarantee */
> @@ -581,3 +590,39 @@ dt_symbol_module(dt_symbol_t *symbol)
>   {
>   	return symbol->dts_dmp;
>   }
> +
> +/*
> + * Mark the symtab annotated with traceable flags on symbols.
> + */
> +void
> +dt_symtab_set_traceable(dt_symtab_t *symtab)
> +{
> +	symtab->dtst_flags |= DT_ST_TRACEABLE;
> +}
> +
> +/*
> + * Return whether symbols have traceable flags.
> + */
> +int
> +dt_symtab_traceable(const dt_symtab_t *symtab)
> +{
> +	return symtab->dtst_flags & DT_ST_TRACEABLE;
> +}
> +
> +/*
> + * Mark a symbol as traceable.
> + */
> +void
> +dt_symbol_set_traceable(dt_symbol_t *symbol)
> +{
> +	symbol->dts_info |= GELF_ST_INFO(DT_STB_TRACE, 0);
> +}
> +
> +/*
> + * Return true if the symbol can be traced.
> + */
> +int
> +dt_symbol_traceable(const dt_symbol_t *symbol)
> +{
> +	return GELF_ST_BIND(symbol->dts_info) & DT_STB_TRACE;
> +}
Very minor, but these four functions are very similar and yet their 
comments seem to have spurious differences.  I would think the comments 
would be boringly similar.  Also, the first comment ("Mark the symtab 
annotated with traceable flags on symbols.") makes sense to me only if I 
read the code and think about the comment a lot. How about these 
comments instead?

         /* Mark a symtab as having traceable flags on symbols. */
         /* Return whether a symtab has traceable flags on symbols. */
         /* Mark a symbol as traceable. */
         /* Return whether a symbol is traceable. */

Or even have "set" and "get" functions and reduce the number of comments 
altogether.  I mean, one can explain what "traceable" means in each 
context, but then people can easily enough understand what the "set" and 
"get" variants do.
