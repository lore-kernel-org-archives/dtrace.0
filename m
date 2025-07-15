Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E312AE8E
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752614572; cv=fail; b=AlXT+fPqPZTtsgXK3dQx20FUeAsNQMFqafYNOnP3YO69BYPJgu/lWjtU0Ci0aJUXZKbbEuAlYdxuSegtEJWuKkvEK41Ix7NjfeouM7o2Q6AQNQ5rgtpIrOxt5yPhLjgi5BrJTZMojfbLvv8phf9oF/FOmo3mGfaZEL0qcEC4QWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752614572; c=relaxed/simple;
	bh=XoRhTkAGESIzFzgR9fq/afNslWYczF6VEuaK+XGulLo=;
	h=Content-Type:Message-ID:Date:Subject:To:References:From:
	 In-Reply-To:MIME-Version; b=tIij4WZMmSeRhZiUS624LJv8qF8rtYhIXpfUs8eNRElWEmnzIoteS7No6s4GHUtTS+/Ub6by81kqPdaqtRrWF3SHGZHJ/FLFSkNaIH3omPFbKCtdFuDiJPa4S9YBSiobTtsnZNp0Bs/W9HvFzSI8bofi5Oz5yaHYMkAvkAzgDpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OfnJiulq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qf8hEu39; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OfnJiulq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qf8hEu39"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FKXp1U028812
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ezu+i5UrdLwZLPlZ47
	E6zZgxIOSVLial6cC+C/CogJI=; b=OfnJiulqeLK1VzLEQiVBYgcebvzB6a9eD+
	Pr+9fLHjegb6LvhS8Y5ZcXxgLauW3q4BbFGCCQMTLh/rhI566SRFC+TgpmDMYIJj
	TJN4MsM4uZKfDNbYXx7IdWcLW+v96zYmF/KVK7tG//9Y5kyrE4M+PL44Cqw/Dvng
	TtpJcT+4SnmcElbZbmeITYQNnbPKNH+vqupXqLGdwV2LijO/YfQEHcAMkPlPYVWP
	9FtL6VuMW6ypfLqUoig0cPBYODh4sispF6Q54NC9hYLZIvm/skLxage2FzQnrhPm
	7oRsBsBwv3VKVHWg+dyV6L295aDogCg7NoQNPX8E1+FZsWYQ/snQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8fyqdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:22:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FJuffC029672
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:22:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5ah6fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 21:22:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FK1vetRq9HT6J17oPJxuqUwDe+dElN8yKZhMmv5tyAL18/5JG5KwJ9g+xNNf1SCdAIGq7aTxG774OpH5/siC+M3IAuSuxctnuI9LDCmbz/H/0NF1VXrOpGkC4+Pf/qs2d7JRiqA6EzyVjjDwJy1+YlrjUtSf44LEf8B5kJjkwPg8Q8UPI4R3qO9IDB01/jzGA+437VKY+TCg0fBpyjgXdBuKa4jyXqu4gtwOutud8NZzqi/H6DXNbdRAWmYWbgLyxZnrLtG35zcjdsN4bR/uL4yo+Gtl7hwIgL/icLmQTMBwpi4dKTkh2ppqV+EHNhXm3UbuPP1FF2LDii5t93P8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ezu+i5UrdLwZLPlZ47E6zZgxIOSVLial6cC+C/CogJI=;
 b=T2jni7nsPh6ZGrTI9fl6qLo2g9L4S58jqI5mcMyYPd1lcn9peS0G4Vc8WncUKq4wzzc0wFUiXUV/HAWSZNymrdC9tPNzK+T/aakBeFPdjYNGFwG3vlehyDVJToF0sWWMUAkgWAvl5f7Xrkr61aMpbJ4EirdHpJMPKa18CjzAzF/V82x/W8/21DrXxZfLs70YP8JLQbfUqbr/BbKJ96IPeimsHTANUO1xuYRbo5W7wcYaNWeaQBlmOOaNxo2W+HWwPBec14bUwX/1oYv9gV106YdwHMoBxsqcsqwjNSsWDWPztw/b4z5k/IFx4joMg/osxYo8nkK+bnasqir4TYtnzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ezu+i5UrdLwZLPlZ47E6zZgxIOSVLial6cC+C/CogJI=;
 b=qf8hEu39rOCnqKRMiYKUtcZ8kHV1cqtLi+KGqtRCzvglswPHghhYctXYfesVFYHIi3oq6aky6AWE/uw/lXdTt1+18Uyf0ctweinrL4wVnDpYqf5Uoe7YelNbIbG76XM7EpVHB1YlrtgG1CYTHvnJzyYhDHetsS2I8c8VuhVf8NI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB6375.namprd10.prod.outlook.com (2603:10b6:a03:484::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 21:22:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 21:22:44 +0000
Content-Type: multipart/mixed; boundary="------------ysQQCX94b00lrM0YDKfcPMSG"
Message-ID: <97ca9d19-12b9-a99e-4710-414d6dadbcbe@oracle.com>
Date: Tue, 15 Jul 2025 17:22:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 4/4] rawfbt: selectively allow return() in
 clauses
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
X-ClientProxiedBy: PH7P221CA0080.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 8487ee4f-af8b-430e-b42c-08ddc3e5bd19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|4053099003|4013099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bU9pYi84YzNZU0tLd3p0S2cxK2pwcWtUR1p6UzNlWnpKODdDN3Q3MjlQaGd1?=
 =?utf-8?B?aEhpc25EWWFpQ3JJcnl5cmp5VTc4UWlLQlVnSElIVmJYTHkyM2xOdE11MHIx?=
 =?utf-8?B?cGxrVW5lUG5kdDJUZ0hEZHFseGUyZGtKNWlQSEsreE9tZ1FMci9CL1VJYk5L?=
 =?utf-8?B?elVqQkl0UHZMVFN0VGo5THVuOWVFZHVCKzJRUTR0M2NxeTVpcjcvb3VSSk9B?=
 =?utf-8?B?VGoweWU2aUdEVjhWM0lXWVFjcEczeXROTUU4SVlyMVR3d2xReUJJT0lYdm9M?=
 =?utf-8?B?YUY5NUVqVmhUTmxFZUhUU0FiL25uZGVZU2VuMStwemRhNUZZcSt6aUFiM3Y0?=
 =?utf-8?B?aXZnbGNlZmRDSnpzQWF6SUNNendRTzJqeGdHcUpUZ1RueDRVeUNzdTFzZGFn?=
 =?utf-8?B?dXd4ZjRRQ3pSQjFObHJpREVaMTBiKzhDQ040UWNGYllwZy9jTkV4NTJia05O?=
 =?utf-8?B?MG9JcWxXY3RFMDUyNnV1aW5aWFVYdVd3djRYTHVLaFpRQi96Z1NQcDdNaWRQ?=
 =?utf-8?B?TjBCanlORmUybkZTbzYxcERxUTVNWnovVng4L004N2FiM3lhR1dETENnUmU3?=
 =?utf-8?B?STZaN3J6b3BBcmt3S0dQOGx0TjArbFJIeGtDSFF2V1JveXROV2NLRUVsN2t3?=
 =?utf-8?B?enB2Y2RIc0cwQkEzZmk2SnlaMC8rVXhaYXIvTGZOTWlDUGF0Rlk2L2hqMTE2?=
 =?utf-8?B?NnZQL1ErRzRZb3VhOWhWWldtK2JyUG0vZHVsYlZDWkdmU2habjNyd2pmTXI3?=
 =?utf-8?B?dW16U1cvalNGNFpsajBFRGswVUxMTjZaMUVtRTFocEp3WFVkVjJJZW1jUmNs?=
 =?utf-8?B?RlJqYWNpbkl0YUdDY3ZENlIvV1hieWQzd0JGaEVoYlFsZEh0RDRML3hPMEps?=
 =?utf-8?B?bXdvbFRUWVpEYzVjSG5hMWxmZ2tYeE9lZUpzbzBpUy8yWjU3NFVtVUtmZFNL?=
 =?utf-8?B?aHhkRXl6cGlWc1FmUEJMUVM1T0VBdUNVMXRHalVUaUt2U0tJeEVROTZ6NkpB?=
 =?utf-8?B?ZlJTMFJwRlNFOEpoaU5wYVZ0YXVxRzBpTkxjWkNQQjdyS2NvbHdtYWp2ekVP?=
 =?utf-8?B?ZHRaU0NRRis3aHo4RlJUY2kvNlByYzNzdWhLT0ZKaUtpR2Vsd1pTL0dGSmwv?=
 =?utf-8?B?Y1liZGhlaDB0cm1UUEprL2tYdzk4Y2c4SXVUYzQzcVJxdXVTLzFGU0xLS1gy?=
 =?utf-8?B?U1gxMFRnWlVQVHhaZ0dzQncvM202aS8yQSs5bnJMb2s5NHBaNXVsa2hjOVlY?=
 =?utf-8?B?NzAvRDlFZC9WUHlzcUJDdFNnSGRORWg0NTB5eHo0ODY0cWRUdEhISU96MW1D?=
 =?utf-8?B?RnFNRmJtQTBYMlZiYTAzOG9Fb0g3WTZPMzVKNzZ0QXZuNWMzT1YrOCtQd1pP?=
 =?utf-8?B?aUhYdlVEOHRPazJRc2RkVENIWXIxa2lML2wwR1Zwb1pNenpNdDVWRHJnbzlN?=
 =?utf-8?B?RzBqa1Y2SHRwcWFYRUtkaUlOaTJDREE3NDFWVkRUSk5KTVFZYVEzaE1RcFpm?=
 =?utf-8?B?RDJrU3BTUjlVbEtJNitMaHoyc2pINVhVRXREcTl2YnFmcWRRdDdKcituSEVM?=
 =?utf-8?B?allFK2k4czFRSlVYVXVYTThWZmYwZmlYSHMzTFN5N3NtWGg2Mnk5OE0vM0Vl?=
 =?utf-8?B?WUtnb1dnT0NVWmxpL1lwaXhRRGQwTzhNVWlaOFpuRzg2U1A1R3JCUWx4VGto?=
 =?utf-8?B?bDQ3c0lRYWM2MTJHVUc1V25NdHo0YjY1bjgxdnFFYWJwT1Y3Mi9WSVdTOUJ1?=
 =?utf-8?B?bEp4MmhJK3pyRm5QbUUyNEVnV2ppNXpLQ3BLYVN4dFlTeUxoSGtLbStlUVJr?=
 =?utf-8?B?UzlPUmpoMmJpWW80YTR1WXhYVUpvYld1MkNkbEhRV0xSQ1kwcjNyL2VQYmNu?=
 =?utf-8?B?NUw5Zk9BYjFvV1pVVzcycE5jRDhrWUNLSDVDalREWXBYUmZqQ255NXdrNVZE?=
 =?utf-8?Q?qwHETnAjZRs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4053099003)(4013099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WERINkJvR2RSSmhrNmdRUlJha2xlTGZ0cEh0c3o1OW4zc3N2RGxYdGJOTlhm?=
 =?utf-8?B?VmhPRTVCdlRsOEpVVEtTbWpIS0xnVlZjT1hjeXlUTEVpa3V1WGpPdzlPeFdG?=
 =?utf-8?B?eVJ4VlpBWEQ1RkpUTElGb0prTmVCYVVUcjVNMnhHa2NrK3BMUzFobHUraG9M?=
 =?utf-8?B?aXZFUmpuTUk1VnFibVhhd0tOaGtGK3p4cEh3Z1o1SWwzQitnNUtGZEtVKzRP?=
 =?utf-8?B?VHpEYW13Mmt3aE81WlovZnAvMkRuM1dDYVZENiszN0tPa3VwS2NENFFZYXQv?=
 =?utf-8?B?V29ySXMwb1ZrOE5RbFQwZzVLWXd6bzVBTDRTWEhtMFpCakI3eTQ4YlA1ZGdI?=
 =?utf-8?B?c2t3dFdQWmdCazUyby9IMFdHNmY4OW9nNDZDRlRQdS9hUGpyOTg4R0liLy9i?=
 =?utf-8?B?UzlsdzZuVXlnalJvYUJXck1nYjgzeHhTY3VoeHdmY1hBRUN3b3JRYVlpU1Ru?=
 =?utf-8?B?cStVT09LUnVNQVE3RmU2QWxRZWo5djRyMm84d213NFpOQXlNanc5a1NETlY0?=
 =?utf-8?B?WWZzVTNsZGduU1JjNW1ENGlKR2Y1SDAwYTVOVnNLT3E5ejJjUmROSlkzWjh1?=
 =?utf-8?B?OUJ5TXVoKzFYWks4MzUwWWVLbkE0NE5yM012WHZzVXdRS2RuZWx6M1hzN2Ru?=
 =?utf-8?B?bTlTU0tORkxRbWovOEdlZGFTSEdvcktDOW8vVFNvRmRrcEx5RGxDNzVxRDA0?=
 =?utf-8?B?WGdQN0JkVm8zTUhybWM5d0RLdDJXZlVlNmh2Z0dqQ2F2T2hoeldkdGRKOU1T?=
 =?utf-8?B?RmprR3Q0M3dvS3czSHRkS3hiWDRaenlRelhMa3MxMFpnRkdiTGJOSThVeTJ3?=
 =?utf-8?B?aXF6azgrbWtaMkM3My8rdjJVSk5abUp2cytoK1IxOHMyakhEY1AraW1vTFQ3?=
 =?utf-8?B?VExqbmVBcXVqUFRwbkVJcUpKOGhMVzdVUjNMQ3lta2c1eXAxem5sQVJMR2s5?=
 =?utf-8?B?eHZJUkNHdEtaNitJQXBXQ3VWTi9lT1hNSDBocDZYYkN4UEFNL1N1Y1lXZDJO?=
 =?utf-8?B?blBacTBqVWRnT3VCT3hBRTJNMnlVcHpKWGRIYzhFWXJrdXFHbGg1M3pWNVRL?=
 =?utf-8?B?VnlUU0hQSzFMR0U2aTlLVTlrSjZrN0tnWFFabnQva3lMd1VSSTM5WEJQeWMy?=
 =?utf-8?B?Q1N0MWtNbkp0VjJWNDA3SDcxVSsraFMwR3RhUVAzWDQzR21zU21LZ1VOMjk4?=
 =?utf-8?B?UmRmN1BZRVVDOTEvMjhwb3NaaG1JR2hEQnlsUWZXeHFNSGtEay9NdXFjaTM5?=
 =?utf-8?B?d2V6RTB6QUtneWt5bktBdE5VT0NZQXpmM1ZJalJJWHNzaFR3R3NLUXRBd1BQ?=
 =?utf-8?B?UDBDNFYrRHZlVUlVaE82c2pYeDhOQWJ5akF4RkxJS3FoNzBBdkdDZWNTOWJP?=
 =?utf-8?B?ZExPTHR3YXNxUHhuUXdwalN0Nk1xK0lHeTEwb3VuTytZdG1YYVpibzRkVGhr?=
 =?utf-8?B?UkQvSFJWOG8wblIwRVdZNEU5OXlrWHc1cGtGN29kVG1QSm1acjVLNGFsdUJU?=
 =?utf-8?B?MWhZWGNCWlNURTBGR0tvRGsxTFdkLzJ5SXBlZ3lwenNxQ0JaUzJCNkdVTXR2?=
 =?utf-8?B?TytiY2VlYjVhM0R3MzNNUG5uanpXNXVNb2pjMnBnZUYrSDlRUEprMFdvZDYz?=
 =?utf-8?B?NDFYUk5ZMFdSRU93MDB0QTZrb3ppcUNUelZtYXJPOXBhc09rR1ovLzhqZnpz?=
 =?utf-8?B?QUROQ2ZnUVR6dGxZN2JXUlFrVW03OUh5Wmk0ZEFmRDBHWDArMFROWnFEbDdV?=
 =?utf-8?B?WEFqcngrSWlWS25TaklmbG9PS295Nk84emdRV1R3a1F1MUFvRjcxZ0V2WFp2?=
 =?utf-8?B?YlQwSmViTGQ1dytidFBJNUFkMlZNaE41bHJPMFN4aitMMU1mMG4wUjhlS0gz?=
 =?utf-8?B?bDB1cnFXNkFINUdJd3RmRjJLU1IrSWllcjgzOEk0MUJySUpmeVR3cVB2cnE2?=
 =?utf-8?B?eVJzQXpJbW1JWGMzKzZMMjRodEl3TDlLK3U2M2xnSGJ1VVp5dmMvdTdpWEky?=
 =?utf-8?B?VGl3azF5aVMvckZiVk50UnBYeHFHdXdaTmF2Vmh0WUZTdjVrZ0VWcFNjNFU3?=
 =?utf-8?B?QmFadmVMTG55VS8wSW51N3lPN1lmL1QrVDlsbnpkbE01bXE0d21LR0tEU1VK?=
 =?utf-8?Q?Flz1SBzWFLJ23NNCyvGXu6Y7j?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Mrfz53DTnsS/sp7C/9AD2G+Wl4A1J9KgUj5qWiRRti9/IzM3CRd3HQ2be/lbxz1cW2oos7gNbcPZ40xyT4BagfoeLCwNhKsYDoXBCwBaznAX0EyL1yQV+vnncquoDGIl+rx6ReLJoMCp+QOI5xZ8JqHVCD8CdxnXCxeXNa9Qspbymoz4HU8vYx4JrmnCRBsNDuzT5LNmMaiXYkUTQ9aAyL6bbeqL7zXkpEYIHb/qIVdDtiEHjkpA+BBKOuV29cQcSTnHU1/+rYsEaExLBtlXbzVpXS9faUVD7MLl95QLab0U+bfFKwnuMjIYX93Ulo5aeFeEHacIgGfXa/x9U4M+2R1TBsqhqd4dHVT2LX+EP8QOlzywmvU/VaR3Vicpkr7WutF5O1iDwOP2yKocFinx1k56uEw7t/dUs8fOS9pzYK4ssatlAZCjgyzbKw4suyfUrzMy24ETrbdfjoRpF6ysCPJYiVpKhpO+4qHeDt8n2ha7qLb1BGHrt2Pr0yZwRN8xa4MIaT8kmNdxhXoNMmMiOfCp6Fn+g8z3v6dz/7JD2quWyNfkQmTUGiTo+Xggk7/VEuRzrQhDqnRFUa8oOr9KOxUuH8BMXFS1vc8ouTlUJE4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8487ee4f-af8b-430e-b42c-08ddc3e5bd19
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:22:44.5852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EINe24oVUV3UuD1e5GOolSRRvAx1Q9/R7+9HDHu1qZgpZzrkX9AbvhgaVYr1t1w7YGwoK1xTtfJCFTdEhLhnuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6375
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_05,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507150197
X-Proofpoint-ORIG-GUID: NsBoLd6HyvQMtq7XMImAxWf1V0U45qU2
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=6876c6a9 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=NfBHSBvp4Sp7peh5TiAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GPMw4cJhzwd6I_2ouD4A:9 a=B2y7HmGcmWMA:10
X-Proofpoint-GUID: NsBoLd6HyvQMtq7XMImAxWf1V0U45qU2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE5NyBTYWx0ZWRfX+UJeVZsUXmUl 7xHExd38AfIhg6INszpCCj0jz0MefyfgHX+lXMYUxjKdg8zeL8D1NB7HPUHMLyBENIbd0vRJEKW X95dBzn7z/FN6p115JPrzRladoxM6+S7DcINMf9z6hVWkd5FS+mVjTWEyKAFoiYdDHtjjZe24E6
 iJRUoMi1imnq81nfnZPC7DBfpKTo6AkjHHoqAm5ZyV0glKP/LovMXDTKc1gZtWZCeHI3obieXM4 iGQ8qLIzstmV9cwR9Dn5VcN3FX9Y4LOxhfA63/XDr+oQppgBHZIVESe5HrJezFOrRFWNW3vwwqi qOrf68Llgw/5O+18KxkKI+BT1rxiEQZwzBXQi+BK/sqaPhKlIIC44DnJLRFXyHExe0Bt7BGH53l
 b2OfVh1lT8EOwPB1p88EqJrtgl4o7w3MLPb7I9ZQ80g39kagtWDTYccNdcBpJGlKa4JH40us

--------------ysQQCX94b00lrM0YDKfcPMSG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I'm late to the party, sorry.

For usability, could an error message point to 
/sys/kernel/debug/error_injection/list?  Might as well provide useful 
information at the time of encounter.

When you parse the list, you expect the function name to be terminated 
with a space.  When I look at my list, only 7 (out of nearly 1000) are 
so terminated.  Shouldn't you check for a space *OR* a tab?

When I run the tests, I get an OL8 UEK6 failure on x86 for 
test/unittest/actions/return/tst.destructive.d:
dtrace: could not enable tracing: Failed to enable 
rawfbt:btrfs:open_ctree:entry: No such file or directory

Also, there should be a test to check that return() actually does the 
right thing.  I'm attaching a proposal.

Typos:  "injexction" in the commit msg and raa as Nick previously noted.

On 7/15/25 01:48, Kris Van Hees via DTrace-devel wrote:

> The return() action is only allowed in clauses associated with a rawfbt
> probe on a function listed in /sys/kernel/debug/error_injexction/list.
> Use a reject_clause() callback in the rawfbt provider to enforce this.
>
> The list of allowed function is only initialized the first time it is
> needed, and its content will be stored in a hashtable for faster
> lookup beyond the first.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_fbt.c                       | 134 ++++++++++++++++++
>   .../actions/return/err.not_allowed-1.d        |  27 ++++
>   .../actions/return/err.not_allowed-1.r        |   2 +
>   .../actions/return/err.not_allowed-2.d        |  27 ++++
>   .../actions/return/err.not_allowed-2.r        |   2 +
>   .../actions/return/err.not_allowed-3.d        |  27 ++++
>   .../actions/return/err.not_allowed-3.r        |   2 +
>   7 files changed, 221 insertions(+)
>   create mode 100644 test/unittest/actions/return/err.not_allowed-1.d
>   create mode 100644 test/unittest/actions/return/err.not_allowed-1.r
>   create mode 100644 test/unittest/actions/return/err.not_allowed-2.d
>   create mode 100644 test/unittest/actions/return/err.not_allowed-2.r
>   create mode 100644 test/unittest/actions/return/err.not_allowed-3.d
>   create mode 100644 test/unittest/actions/return/err.not_allowed-3.r
>
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 50fa0d9d..b98d8d87 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -591,6 +591,139 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>   		free(tpn);
>   }
>   
> +/*
> + * raafbt only:
> + *
> + * Accept all clauses, except those that use the return() action in a function
> + * that does not allow error rejection.
> + */
> +#define FUNCS_ALLOW_RETURN	"/sys/kernel/debug/error_injection/list"
> +
> +typedef struct allowed_fn {
> +	const char	*mod;
> +	const char	*fun;
> +	dt_hentry_t	he;
> +} allowed_fun_t;
> +
> +static uint32_t
> +fun_hval(const allowed_fun_t *p)
> +{
> +	return str2hval(p->fun, p->mod ? str2hval(p->mod, 0) : 0);
> +}
> +
> +static int
> +fun_cmp(const allowed_fun_t *p, const allowed_fun_t *q) {
> +	int	rc;
> +
> +	if (p->mod != NULL) {
> +		if (q->mod == NULL)
> +			return 1;
> +		else {
> +			rc = strcmp(p->mod, q->mod);
> +			if (rc != 0)
> +				return rc;
> +		}
> +	} else if (q->mod != NULL)
> +		return -1;
> +
> +	return strcmp(p->fun, q->fun);
> +}
> +
> +DEFINE_HE_STD_LINK_FUNCS(fun, allowed_fun_t, he)
> +
> +static void *
> +fun_del_entry(allowed_fun_t *head, allowed_fun_t *p)
> +{
> +	head = fun_del(head, p);
> +
> +	free((char *)p->mod);
> +	free((char *)p->fun);
> +	free(p);
> +
> +	return head;
> +}
> +
> +static dt_htab_ops_t fun_htab_ops = {
> +	.hval = (htab_hval_fn)fun_hval,
> +	.cmp = (htab_cmp_fn)fun_cmp,
> +	.add = (htab_add_fn)fun_add,
> +	.del = (htab_del_fn)fun_del_entry,
> +	.next = (htab_next_fn)fun_next
> +};
> +
> +static void reject_clause(const dt_probe_t *prp, int clsflags)
> +{
> +	dt_htab_t	*atab = prp->prov->prv_data;
> +	allowed_fun_t	tmpl;
> +
> +	/* If the clause does not have a return() action, allow it. */
> +	if (!(clsflags & DT_CLSFLAG_RETURN))
> +		return;
> +
> +	/*
> +	 * If the htab of allowed functions for return() does not exist yet,
> +	 * create it.
> +	 */
> +	if (atab == NULL) {
> +		FILE		*f;
> +		char		*buf = NULL;
> +		size_t		len = 0;
> +		allowed_fun_t	*entry;
> +
> +		atab = dt_htab_create(&fun_htab_ops);
> +		if (atab == NULL)
> +			return;
> +
> +		prp->prov->prv_data = atab;
> +
> +		f = fopen(FUNCS_ALLOW_RETURN, "r");
> +		if (f == NULL)
> +			return;
> +
> +		while (getline(&buf, &len, f) >= 0) {
> +			char	*p;
> +
> +			entry = (allowed_fun_t *)malloc(sizeof(allowed_fun_t));
> +			if (entry == NULL)
> +				break;
> +
> +			p = strchr(buf, ' ');
> +			if (p) {
> +				*p++ = '\0';
> +				if (*p == '[') {
> +					char	*q;
> +
> +					p++;
> +					q = strchr(p, ']');
> +					if (q)
> +						*q = '\0';
> +				} else
> +					p = NULL;
> +			}
> +
> +			entry->fun = strdup(buf);
> +			entry->mod = p != NULL ? strdup(p) : NULL;
> +
> +			if (dt_htab_insert(atab, entry) < 0)
> +				return;
> +		}
> +
> +		fclose(f);
> +	}
> +
> +	tmpl.mod = prp->desc->mod;
> +	tmpl.fun = prp->desc->fun;
> +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> +		return;
> +
> +	tmpl.mod = NULL;
> +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> +		return;
> +
> +	xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
> +		prp->desc->prv, prp->desc->mod, prp->desc->fun, prp->desc->prb);
> +}
> +
>   dt_provimpl_t	dt_fbt_fprobe = {
>   	.name		= prvname,
>   	.prog_type	= BPF_PROG_TYPE_TRACING,
> @@ -628,6 +761,7 @@ dt_provimpl_t	dt_rawfbt = {
>   	.populate	= &populate,
>   	.provide	= &provide,
>   	.load_prog	= &dt_bpf_prog_load,
> +	.reject_clause	= &reject_clause,
>   	.trampoline	= &kprobe_trampoline,
>   	.attach		= &kprobe_attach,
>   	.detach		= &kprobe_detach,
> diff --git a/test/unittest/actions/return/err.not_allowed-1.d b/test/unittest/actions/return/err.not_allowed-1.d
> new file mode 100644
> index 00000000..246a68b1
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-1.d
> @@ -0,0 +1,27 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: return() is not allowed for fbt probes
> + *
> + * SECTION: Actions and Subroutines/return()
> + */
> +
> +#pragma D option quiet
> +#pragma D option destructive
> +
> +BEGIN
> +{
> +	ok = 0;
> +	exit(0);
> +}
> +
> +fbt:btrfs:open_ctree:entry
> +/ok/
> +{
> +	return(0);
> +}
> diff --git a/test/unittest/actions/return/err.not_allowed-1.r b/test/unittest/actions/return/err.not_allowed-1.r
> new file mode 100644
> index 00000000..e3443c30
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-1.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: could not enable tracing: return() not allowed for fbt:btrfs:open_ctree:entry
> diff --git a/test/unittest/actions/return/err.not_allowed-2.d b/test/unittest/actions/return/err.not_allowed-2.d
> new file mode 100644
> index 00000000..e0d303c7
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-2.d
> @@ -0,0 +1,27 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: return() is only allowed for select functions
> + *
> + * SECTION: Actions and Subroutines/return()
> + */
> +
> +#pragma D option quiet
> +#pragma D option destructive
> +
> +BEGIN
> +{
> +	ok = 0;
> +	exit(0);
> +}
> +
> +rawfbt:btrfs:close_ctree:entry
> +/ok/
> +{
> +	return(0);
> +}
> diff --git a/test/unittest/actions/return/err.not_allowed-2.r b/test/unittest/actions/return/err.not_allowed-2.r
> new file mode 100644
> index 00000000..758d3477
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-2.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
> diff --git a/test/unittest/actions/return/err.not_allowed-3.d b/test/unittest/actions/return/err.not_allowed-3.d
> new file mode 100644
> index 00000000..770565c9
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-3.d
> @@ -0,0 +1,27 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: return() is only allowed for select functions
> + *
> + * SECTION: Actions and Subroutines/return()
> + */
> +
> +#pragma D option quiet
> +#pragma D option destructive
> +
> +BEGIN
> +{
> +	ok = 0;
> +	exit(0);
> +}
> +
> +rawfbt:btrfs:*_ctree:entry
> +/ok/
> +{
> +	return(0);
> +}
> diff --git a/test/unittest/actions/return/err.not_allowed-3.r b/test/unittest/actions/return/err.not_allowed-3.r
> new file mode 100644
> index 00000000..758d3477
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-3.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
--------------ysQQCX94b00lrM0YDKfcPMSG
Content-Type: text/plain; charset=UTF-8; name="0001-test.patch"
Content-Disposition: attachment; filename="0001-test.patch"
Content-Transfer-Encoding: base64

RnJvbSBhNmE2Y2ViNjE0ZmFkZDVjNWQxMTE2Y2MwNWZlNzFkYTJiMmRiZmY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFdWdlbmUgTG9oIDxldWdlbmUubG9oQG9yYWNsZS5jb20+CkRh
dGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTM6MzM6MDQgLTA3MDAKU3ViamVjdDogW1BBVENIXSB0ZXN0
CgpTaWduZWQtb2ZmLWJ5OiBFdWdlbmUgTG9oIDxldWdlbmUubG9oQG9yYWNsZS5jb20+Ci0tLQog
Li4uL2FjdGlvbnMvcmV0dXJuL3RzdC5kZXN0cnVjdGl2ZS1nZXRwaWQuciAgIHwgMTIgKysrKysK
IC4uLi9hY3Rpb25zL3JldHVybi90c3QuZGVzdHJ1Y3RpdmUtZ2V0cGlkLnIucCB8IDEwICsrKysK
IC4uLi9hY3Rpb25zL3JldHVybi90c3QuZGVzdHJ1Y3RpdmUtZ2V0cGlkLnNoICB8IDQ4ICsrKysr
KysrKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgNzAgaW5zZXJ0aW9ucygrKQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHRlc3QvdW5pdHRlc3QvYWN0aW9ucy9yZXR1cm4vdHN0LmRlc3RydWN0aXZl
LWdldHBpZC5yCiBjcmVhdGUgbW9kZSAxMDA3NTUgdGVzdC91bml0dGVzdC9hY3Rpb25zL3JldHVy
bi90c3QuZGVzdHJ1Y3RpdmUtZ2V0cGlkLnIucAogY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3QvdW5p
dHRlc3QvYWN0aW9ucy9yZXR1cm4vdHN0LmRlc3RydWN0aXZlLWdldHBpZC5zaAoKZGlmZiAtLWdp
dCBhL3Rlc3QvdW5pdHRlc3QvYWN0aW9ucy9yZXR1cm4vdHN0LmRlc3RydWN0aXZlLWdldHBpZC5y
IGIvdGVzdC91bml0dGVzdC9hY3Rpb25zL3JldHVybi90c3QuZGVzdHJ1Y3RpdmUtZ2V0cGlkLnIK
bmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLmI2YmRmMjExCi0tLSAvZGV2L251
bGwKKysrIGIvdGVzdC91bml0dGVzdC9hY3Rpb25zL3JldHVybi90c3QuZGVzdHJ1Y3RpdmUtZ2V0
cGlkLnIKQEAgLTAsMCArMSwxMiBAQAorcGlkIGlzIG15cGlkCitteXBpZAorMjIyMjIKK215cGlk
CitteXBpZAorNTU1NTUKK215cGlkCitteXBpZAorbXlwaWQKK215cGlkCitteXBpZAorCmRpZmYg
LS1naXQgYS90ZXN0L3VuaXR0ZXN0L2FjdGlvbnMvcmV0dXJuL3RzdC5kZXN0cnVjdGl2ZS1nZXRw
aWQuci5wIGIvdGVzdC91bml0dGVzdC9hY3Rpb25zL3JldHVybi90c3QuZGVzdHJ1Y3RpdmUtZ2V0
cGlkLnIucApuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAwMDAwMDAwMC4uZDY1OTNjNDYKLS0t
IC9kZXYvbnVsbAorKysgYi90ZXN0L3VuaXR0ZXN0L2FjdGlvbnMvcmV0dXJuL3RzdC5kZXN0cnVj
dGl2ZS1nZXRwaWQuci5wCkBAIC0wLDAgKzEsMTAgQEAKKyMhL3Vzci9iaW4vZ2F3ayAtZgorCitC
RUdJTiB7IG15cGlkID0gLTEgfQorCisvXnBpZCBpcyBbMS05XVswLTldKiQvIHsgbXlwaWQgPSAk
MzsgfQorCit7CisgICAgICAgIGlmICggJE5GID09IG15cGlkICkgJE5GID0gIm15cGlkIjsKKyAg
ICAgICAgcHJpbnQ7Cit9CmRpZmYgLS1naXQgYS90ZXN0L3VuaXR0ZXN0L2FjdGlvbnMvcmV0dXJu
L3RzdC5kZXN0cnVjdGl2ZS1nZXRwaWQuc2ggYi90ZXN0L3VuaXR0ZXN0L2FjdGlvbnMvcmV0dXJu
L3RzdC5kZXN0cnVjdGl2ZS1nZXRwaWQuc2gKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAw
MDAwMDAuLjdjNDRkZGU5Ci0tLSAvZGV2L251bGwKKysrIGIvdGVzdC91bml0dGVzdC9hY3Rpb25z
L3JldHVybi90c3QuZGVzdHJ1Y3RpdmUtZ2V0cGlkLnNoCkBAIC0wLDAgKzEsNDggQEAKKyMhL2Jp
bi9iYXNoCisjCisjIE9yYWNsZSBMaW51eCBEVHJhY2UuCisjIENvcHlyaWdodCAoYykgMjAyNSwg
T3JhY2xlIGFuZC9vciBpdHMgYWZmaWxpYXRlcy4gQWxsIHJpZ2h0cyByZXNlcnZlZC4KKyMgTGlj
ZW5zZWQgdW5kZXIgdGhlIFVuaXZlcnNhbCBQZXJtaXNzaXZlIExpY2Vuc2UgdiAxLjAgYXMgc2hv
d24gYXQKKyMgaHR0cDovL29zcy5vcmFjbGUuY29tL2xpY2Vuc2VzL3VwbC4KKyMKKworZHRyYWNl
PSQxCisKKyMgU2V0IHVwIHRlc3QgZGlyZWN0b3J5LgorCitESVJOQU1FPSR0bXBkaXIvZGVzdHJ1
Y3RpdmUtZ2V0cGlkLiQkLiRSQU5ET00KK21rZGlyIC1wICRESVJOQU1FCitjZCAkRElSTkFNRQor
CisjIE1ha2UgdGhlIHRyaWdnZXIuICBJdCByZXBvcnRzIHRoZSBwaWQgMTAgdGltZXMuCisKK2Nh
dCA8PCBFT0YgPiBtYWluLmMKKyNpbmNsdWRlIDxzdGRpby5oPgorI2luY2x1ZGUgPHVuaXN0ZC5o
PgorCitpbnQgbWFpbihpbnQgYywgY2hhciAqKnYpIHsKKwlpbnQgaTsKKworCWZvciAoaSA9IDA7
IGkgPCAxMDsgaSsrKQorCQlwcmludGYoIiVkXG4iLCBnZXRwaWQoKSk7CisKKwlyZXR1cm4gMDsK
K30KK0VPRgorCiskQ0MgbWFpbi5jCitpZiBbICQ/IC1uZSAwIF07IHRoZW4KKwllY2hvIEVSUk9S
OiBjb21waWxlCisJZXhpdCAxCitmaQorCisjIFRyYWNlIHRoZSB0cmlnZ2VyLiAgT24gdGhlIDJu
ZCBhbmQgNXRoIGdldHBpZCgpIGNhbGxzLCBtb2RpZnkgdGhlIHJlc3VsdC4KKworJGR0cmFjZSAt
YyAuL2Eub3V0IC13IC1xIC1uICcKK0JFR0lOIHsgcHJpbnRmKCJwaWQgaXMgJWRcbiIsICR0YXJn
ZXQpOyBuID0gMDsgfQorcmF3ZmJ0OnZtbGludXg6X18qX3N5c19nZXRwaWQ6ZW50cnkgL3BpZCA9
PSAkdGFyZ2V0LyB7IG4rKyB9CityYXdmYnQ6dm1saW51eDpfXypfc3lzX2dldHBpZDplbnRyeSAv
cGlkID09ICR0YXJnZXQgJiYgbiA9PSAyLyB7IHJldHVybigyMjIyMik7IH0KK3Jhd2ZidDp2bWxp
bnV4Ol9fKl9zeXNfZ2V0cGlkOmVudHJ5IC9waWQgPT0gJHRhcmdldCAmJiBuID09IDUvIHsgcmV0
dXJuKDU1NTU1KTsgfQorJworCitleGl0ICQ/Ci0tIAoyLjE4LjQKCg==

--------------ysQQCX94b00lrM0YDKfcPMSG--
