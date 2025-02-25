Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588619CD0B
	for <dtrace@lists.linux.dev>; Tue, 25 Feb 2025 21:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519584; cv=fail; b=Z4W7tDO0njQQrp7z7xBdZ/WStaJnpIjOENYUyn7NeiF3QT6wjFxmu31yyJ9JGiN1uod2gD03VT6OOJYzmflB5Lf/VTC5lzxU6F+tlYrx6imqdPvyMlpRiOFmxyn9f5JsceJoFvkY+U3p5osTIkywfYc49CrMtL3KtyOg34UJcMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519584; c=relaxed/simple;
	bh=SKJ9czWdKUUkUDfGJ8anjqf+7q8Qnq8y0VDgJYWjSkg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sbBcngqIkFujSRCrCURu6SY3mAAEKI01CpssAM+x8zyjmIVL1dxToco1omaC75cCjfBWa2Y/BIorsY6PIZKfl2+qNntLIiiIpjTYkHGKUVmW53PlUt6gr0Rpt6RY2Ih7UXRtPrF9+h/yMc54kjBIEKCXGPkz+mrdE8pIA477Smw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hKiA5Ob0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SalBBb4P; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hKiA5Ob0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SalBBb4P"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PLVYA2003108;
	Tue, 25 Feb 2025 21:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9UxqxhoCix/Tin/iATQbf8g9CvuhqEqqN/A5vxu+ub4=; b=
	hKiA5Ob0E423+NQAWsxfiYWuF0kBGIljfPUzsZs2PN+Nol9CwOBF/X6pUtLKiNGY
	0EyasEdxMNIHlHOldxTchq2DesqfmSqFR5Yl1vh5HjtW4XUEdWFWXYXCRPTxtfSG
	di8QCszI9XXlk/iqZnQt5wG3ntVBwJ5GiZ3r6K/Oyz77kwo5XfogJhfEqwQulnpZ
	pcceADdVmAsxzFdakWq3FSb/iJvMWxZsmbivd5FpXhAjH2yxhdBeY/gmPGcOCcMa
	8Ck6elDbvwR8FWwoDm4Ax+O6wAw0hQEncxwkFYhlW89+gt3X0O2C41WFtClv9dbi
	mm7197GzZ66CiyKmCdtiVw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y50bpc1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 21:39:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51PKrUUO012753;
	Tue, 25 Feb 2025 21:39:38 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51b3vg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 21:39:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClD6UYCBTdQTGnuJwldsROgWNbhh3H86dCdeEe9wJuyu9E7Eql0T57TapFQlMs9bsojouVyc1iqfkVNsOk8Ivo5L6uffxdDzA4cxIvzOLkWoYjaqkLd09CZjUMKE/l07a6Yru9XDNVPZf61kGE0UwbfaDsPcxNMP/17x/z9bJQe33WD2R5o6oqv+4eNuvR86LFrOoSJmvTPEX5tYCUhZsKczYAwXZu3b96iywn9NVt+DCnhXYVLxkntj2bBpmb02FCeBrluPxhEJjh2sbS91dqyVS/++W4vxXujtG5Mz1q+0vL+g4yz1FDn5sA7CXEPe0kIG2xXHGHQV5FNqYNvAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UxqxhoCix/Tin/iATQbf8g9CvuhqEqqN/A5vxu+ub4=;
 b=PcePnmRFb4+nA5B/TEE0tq7P+q3+tKB9pZhRfVmgepunot2NNMY7WN+kotVLnTIJb/UWPbPxfx7NhVfdJo8Pa9V0g27DIsgbSDIeJCDa3jftdeyd3LQht8+NFLXEV3vW5kivu7uy5roFNdABtWBjDeD/P3f0hK7vQ4vCQjv32P2Ub2xYirpVavf7VhpmWwU1j1fgBOMcAzySI7HPpgX5Am2MoUhU+YUnAvpNyPryYQLq+psI/ELGM2D0RGEntion4EC5YRez8niO0yrdybhjdnV7quceNuhvjEdYcUguitNqRNVq7DyRTfoBMQuCYQAcgn/iv0U+zmj0/qSrQA5AFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UxqxhoCix/Tin/iATQbf8g9CvuhqEqqN/A5vxu+ub4=;
 b=SalBBb4PwhW1qcBHQVVHj4pFiAH47uyBKTAZN8giB9rPh+NOee4sGazuIRv+pwQAu1PtjhBLiQ/IlWd8oiTFYfsia8qYuySHzPzNFqQA12dZoP5j1iXZ+9bgtokDH5dLDv64D87kaXRj4LZtScESLZvxEprHTwjYiTebBdQq/Fo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6270.namprd10.prod.outlook.com (2603:10b6:8:d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 21:39:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 21:39:36 +0000
Message-ID: <d8150cc9-1eb7-a40b-3c64-94c32a47c728@oracle.com>
Date: Tue, 25 Feb 2025 16:39:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/4] test: finalize porting small awk stragglers to gawk
Content-Language: en-US
To: Sam James <sam@gentoo.org>, dtrace@lists.linux.dev
References: <cover.1737686990.git.sam@gentoo.org>
 <6801a6bc93d311d2cbb3289d607e4918422e262c.1737686990.git.sam@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <6801a6bc93d311d2cbb3289d607e4918422e262c.1737686990.git.sam@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0076.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 398b18bb-5f73-40d7-eec6-08dd55e4e63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emFRWlF3VUZZVWlHVWowTS9OYnRUS1dwUHdpWVRpQXRwWll0YmNNRWM1QnQz?=
 =?utf-8?B?OVNQNVhCUjBiam1VWEM4QUROOGpkSHRheEtwUU9LTTBSUWlLV0pOdUNqWDlr?=
 =?utf-8?B?YWNMR21sUmFUQnNROXlyUW9yUkFPTGFBeVZYL05MNWp6dW9FaHpkbW9lNUpG?=
 =?utf-8?B?UFRDT1owbjZ2Z2JKOXJ4ZHlnV2s3UEUwZUVxeFNMUU1EdGYrdXQxc0NIYmJU?=
 =?utf-8?B?emtaY25hcDZCTmpIMTBzcVhXbnAzOXZVY0d5THhDVUdyd3hZQ0E0WDVkNjJC?=
 =?utf-8?B?OEhuWk1XL2VZWVlXdFlSQVozeTZkSFoya2FDb1BiR1U0NGtDRmMxbUxjdlhN?=
 =?utf-8?B?S1pIWU5vcW4wTmZSOVBheTk1ZUNNWThaSnJpVTlUeW03MDF5bWJaRVR4bEcw?=
 =?utf-8?B?MitXZHMwZGNkNkdhRXBLTDhHUXFUL0dkOVFlR2RERkp0WUhBblB4Sis0Tllk?=
 =?utf-8?B?WEl3T2RKVHF4UUNhdWJKQXZCcW5aRk5wSGN1aWMzQ29aNTZqaGRaUEk5SHd3?=
 =?utf-8?B?bkRuaXBiQVpORkVxaDM4MFlWMGY4bWUySzBvS2lid1NYcXdocFFuU3VOdHBR?=
 =?utf-8?B?dnpUS3B1bHdJZVNkNlgzM0lZMFVsOWNOazBaLzJ3bDROa1NncFdKeVE1cGdl?=
 =?utf-8?B?V2JsUjl6NVhXRSs4aHN5bzhQTzlURmMvWk5sYlI3Y2ZkRWhaQWZKVkN1Ykl5?=
 =?utf-8?B?WURqeUdNc05rMGlTVHMva2RWaURvbVZQTGRXRVlPS1VNczFmTmdtUmFaRXZC?=
 =?utf-8?B?WGVOM3hiRXI2SVRMMEp6VVBlLzJpNFpxNVpTMlhqM1gxNlNGQzk2MDNKQU5a?=
 =?utf-8?B?ZjUxNnVZOG12UlB3Wk5YRlREaVpVZUQ1eFZCclp5VmFuOVkwbDJ3NEtVYzI0?=
 =?utf-8?B?QWhSTDFHVTJVSU1EdHlwUzVqSlV0NHkrNm1iSHF6aGVGbGpBbnpvay9YaCt5?=
 =?utf-8?B?ak5uN1VIa1VqNThhdEk2L1lRckxYdnRLLzJITDJlM0V6cEsrMURjWG02R1kz?=
 =?utf-8?B?R294VEt5T1ZOK0VNT2tobHBSUy96V1VKNEpKM0h2M0E0SnlVSTdyVS8yR1Nu?=
 =?utf-8?B?YkxWZmxWRXpKK3pHOFEyazhIVnovUGJLTlZSN3M0K2srOUhiZWwvZXp4eWRn?=
 =?utf-8?B?YnZCSnlacXpub2FhbnFhOWl2SUlmS2l3bVZvK3FncXlCZitML0FOaFVEaldT?=
 =?utf-8?B?YXJ1RVdOUHNvSyt6VS9PUElIT3ZhSzVaNzQ2ak45ZkxkQjd1UUVFZ0FoWnBQ?=
 =?utf-8?B?ajUyd0JRNEgvakszQm5wZDZpZlh0anIwVG9aTWFvYlpaclhuZEI2OFdSTURw?=
 =?utf-8?B?NGxzaFFDa3BLUEw0aWs5Z3JRN2pQWHVxc0Iyenp2K1ovVFh0Y0JxbmNWZW1y?=
 =?utf-8?B?dGdmSzhDN0Mrem1JWXNxc0xUUU1tajZ3MnNZRzMwdHEwRUo4SVhJMVJNOGZl?=
 =?utf-8?B?a0VjVTFtQzY1NjB3KzErdEdBVzZjcTN5UHU5UWVZblEvZlRXcE1aeXRvdWIv?=
 =?utf-8?B?UVlqdXFtTVBzTnVHdk44NEhqQXpPenRPTWdwWG9QZGVlSVMrMjhjcWJFUm9X?=
 =?utf-8?B?MW45ZDVvaCtPR3J2U3drcnY4MHBULy9IZW9nTGpmRU0rTWppRWs0R1BpZ0Jr?=
 =?utf-8?B?YVovUHZiNmdzci9SblBPcTlWdWRLbk9LWnhxNTJ2SXBMZXZmK0Jaa29HSDJH?=
 =?utf-8?B?SmFFeEllRTdYY3pLUTI0UE5XT21RVFVUMU5HTmwwMDFlRmpheWsvZjdRd2Vh?=
 =?utf-8?B?WGF2V0tDMVR6QWh6Y3dRcUxTRloyc0hXSWR3dzVPRkVDUEhkOWNSbXBoWjcx?=
 =?utf-8?B?anhWNE04Yk9Id1ZxUmR2TE92VlBKNDdLakJGRHg4TXRmelRNRWVVVEwvYTlp?=
 =?utf-8?Q?zkoxpzY1rq90/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0F0bk9Tdjk2dG1tcXZtM2JmUjFOc053SkQ0dzFnWjg3RFJBZDJITFZVVktq?=
 =?utf-8?B?cmZQR3lmZVljeC9uUlRFQ05VbWFqcGZHa0NZcGxkVVA4MHQvL1BwKzJwK3Br?=
 =?utf-8?B?eGFUSG9jSFdNeHBvQ2Q3Y011SzZtNzVDRVdDRmk0QitON2c2dGxDcVRyWnZZ?=
 =?utf-8?B?NmQrZUdVWHMzVzBkTDhMSkdsLzhENzU2ODhFaXlXcndydmlRZWQ1RnlHVWNw?=
 =?utf-8?B?OWNVZm96Zmd1RGdKN0liV3Y4MXdFNCtWOVc5Sk1rYVh1aFIraFhRbXpDYXlR?=
 =?utf-8?B?eUUvLysrSWV0dzNjTGhYY25rblZaRFZPTTZiN2xMQjdOUUU5VzRnUmM3NnAy?=
 =?utf-8?B?RDdka2Z5Y0RQOHZOcVBONktGMnEyVjFmMmZFcExzZ2w5VmNyZWVmZm1aYTJ0?=
 =?utf-8?B?c1psb3Q5VVpORlAzVHE0OUxTSXNuQnhpRDlxd2R6M0xHdDFsK3JMRXlrOGlt?=
 =?utf-8?B?N0pXcitjK0RkNHA0QjdsSVFPZ0tRQ09JRVhEZTltRUI0ZjZsemZ0ZGRMVmts?=
 =?utf-8?B?UXdUcmlvZ1ZaQXBGU2lMaStsV0E0c25SbjRkZkFaL3ZBaEMwRzZ4c3lQWVd0?=
 =?utf-8?B?L3JoeWhjQW1XaXFkZ2NPRlFyS2RLMm4wVTJ4eFdxc3JNOVZpQ3hzTEJBZUt0?=
 =?utf-8?B?eWJuTndENEpWd29Dc2Mxak9yMDR6ZTdtL05FYWV6bmJxL0VCNzY5Q0lmVzVn?=
 =?utf-8?B?V2sybkRuQ3dxY1duVGJvK0RiYjkxUmlFUlVEL3k5YkdJb1JXUURtQzZmNjE1?=
 =?utf-8?B?QUE0TVloUnVWOE5zbk9HRkxuRDY1RDYvOUtqL2NOTGx4RXQwNjdpaEI4Sisv?=
 =?utf-8?B?Q2gwempRQlNCU1k2MVZZSVlwNXRRMjIwM0pHN1pJM1FUUjVXQjQwNm4vNzdo?=
 =?utf-8?B?Q085a3NpeSt3ZWlCQk1HeElyTGZDK1UyYVRxR2N1THdaMGkzbjhNU2h2OUJF?=
 =?utf-8?B?VVBwREpKZ0NHNUhVUGVKdEJHaEZLUXRTdUZXN25ZN2R1dnpMaFRremZEV3lx?=
 =?utf-8?B?TkN0NWRxc0VCWVN2b0tzY3VLcGg5YmNZVWtLS1R4b0x6eVI2NDNkaUJvaENV?=
 =?utf-8?B?aVB0SnBpSjdZUFpsdUQ5bnNzN0drU3c5eVNDTG5YTTljc3V1NVR6YWphS3lL?=
 =?utf-8?B?NkZ5TjJTS1FydjZ0azVGSFpINWZ2dHNwT1NJQnFsMjd3SGI5VDRHS1VSWTN1?=
 =?utf-8?B?MHlNaTBuaVB6dlA2RGg0L0JOY3NpRkR0anpzanhnRTRoaGpBRFVNbzZXMWRn?=
 =?utf-8?B?NEFpbVk1dDdVMVlvczVsaGVBQk1uVjk1aFZQOHNiU3VtQTdiaDdoWEZNUk9T?=
 =?utf-8?B?SzA1MWN2NGcwbzdCZmtYSFdvd1UxRGN2cHZScXBYOTI3OFdHSXJ0Ni9NQVFu?=
 =?utf-8?B?R1poYjhhZkt4cE42MVJZYnNLS01wYkRaaHdtVDZ2aWdNOExKQXNIRElXZ0JZ?=
 =?utf-8?B?WUtZbW5GZ2xHRmJIcEVPcjRjVEZNNmYvSEJ3eUM0Q0orZGlEYjFkWFJ6Rnh0?=
 =?utf-8?B?N0pXU00wS0FvWmVUcU9JZ3RiZXIweW1RNW1HNHNvT0MzVWlDb0FqYm9VMjVM?=
 =?utf-8?B?bFVLZkRFQTg0dHJmek1qZ0JMRWlCZmpWbmFwRHR1dDFmMkxRQWRoUFVkeVVF?=
 =?utf-8?B?MnpvQUtGS1VtUmwybTlaZFRweXd0QWZWL3ZiV3NIZHViaVFkYitFczc0OUJr?=
 =?utf-8?B?eExKQVhFTmJ3dVd5NytPQjhRS2hEbzFWOWFTUEpJNDEwN2l1dzBpM0dib1Vp?=
 =?utf-8?B?b1FFZm1SRVYyWGdKNG84K3lZZ2ZTK3BqY2pLc1VQY3BWRHdRekxYTlZVb1Jp?=
 =?utf-8?B?cWl2OUUvRGVCbTBmZmhXaVFVK1gvV3Nwb3c1bTdKMnE3RityZHR0aTdheHNa?=
 =?utf-8?B?azhCNzllWDFqbGxERkNObXA2RmVmYWJtOVlJUHVJRkR5TEZZR1hQb1pEdnlV?=
 =?utf-8?B?Nzh1dFFTRXY2eVpaT2Z0YlJWT2hERWZycG5FUjkzaUU2NHhNd2xueDZMK3RP?=
 =?utf-8?B?R3FhMGRmTzFSSDh6WnZJZjNGTVJyRWJGS3l6MlhtODlycGpmemtnaUZXalVP?=
 =?utf-8?B?MFhTUFREMjJIcGRpY0hlKzd1L0JmOGdWSDZuVU5XeG50ZjQxZFE3b2RnN0dI?=
 =?utf-8?Q?oySpyjV0dOJcFU2AyjM6snnpM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s9EvKSlxnpQ1/a7mTukETTbvBIkGqkeNR6a5mPuzzD3c/rIXiqu3tuyI1Ag5y2FCzz1Qeo7Uw5Kw+VB3AtsmbR0XWJOQCOzEUK0VRZe6A9KVWh2rq36RO3+QMI7Xy3nC5SJfDvLggOXYgHqY1gG3OvgqDuKCprTCYkua5AunSW3hJJV5oPaODjzQpWCYxYmO6olXpVYMrjipBF1DHpGFX6GucCPGEEO+tYYErpI74MEo6bdepO1UDWrJQeM988iy/AwIgICmsv6KaLgqC0S+hqzk8DFERJwcC/qYQGEJrHNqKsW1/yNETtmlCjDKmNuzDn/DtRO7v6OWmZKPqtUrIO/1AIay6aXIg0mEcY/O61wvMMrg/1acJoyQuAKhN5u5CB/+DLXNpUQOSrrm/9FXe8/O5zCmFFV6b8fZF/Lic4Ejkb0vP3yjxVFAJUtJ7rq5w91yKrbtVilvs/aVDnJ524BMQ8C3lgOpC/S48cih1GlGaviTvOFwHEeMmaqmq6S5EPrQGXNClDW9aCWi4TvkGqi894CeVHeGmhK2kEACpz4iXzrNzJr5NG2BbY7+XjJGaDrb2+3LlAk8OrNwwULOYrTSoAgEU2oDEeen29KoEWA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398b18bb-5f73-40d7-eec6-08dd55e4e63c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 21:39:36.1806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VidsyRKOomcn/oHsl6XWwhztLFbRgoflI1xdKsb7RUbj8+fM/Mpp8IPuA68H/ks6s14JF3XSi+L+eSlsPVS0GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6270
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250129
X-Proofpoint-ORIG-GUID: Huu-t-JknSfGQ2hxRhHkF0KkDUc8Tzya
X-Proofpoint-GUID: Huu-t-JknSfGQ2hxRhHkF0KkDUc8Tzya

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

but I think we need updated copyright years for
     test/unittest/builtinvar/tst.id_ERROR.sh
     test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
     test/unittest/variables/bvar/tst.arg3-ERROR.sh

Also, at this point there are other "awk" instances on origin/dev.  
(You're welcome.  Oops.  Sorry.  I bet a lot of these are from me.)  I'm 
okay with going with this patch and then iterating further with a later 
patch.  I can imagine such awk stragglers will continue to find their 
way into the code.  Anyhow, here are other awk instances on origin/dev:
     test/unittest/funcs/err.badalloca.r.p:#!/usr/bin/awk -f
     test/unittest/pid/tst.entry_off0.sh:awk '$2 == "0" || $2 == 
"entry"' D.out | awk '
     test/unittest/pid/tst.newprobes.sh:pid*:awk::
     test/unittest/pid/tst.newprobes.sh:    system("$dtrace $dt_flags -c 
awk -n 'pid\$target::main:entry{exit(0);}' >/dev/null 2>&1");
     test/unittest/pid/tst.newprobes.sh:    system("$dtrace $dt_flags -c 
awk -n 'pid\$target::main:entry{exit(0);}' >/dev/null 2>&1");
     test/unittest/stack/tst.stack_fbt.sh:awk 'NF != 0 { 
sub(/+0x[0-9a-f]*$/, "+{ptr}"); print }' dtrace.out > dtrace.post
     test/unittest/usdt/tst.defer-Z.sh:    awk '
     test/unittest/usdt/tst.defer-Z.sh:awk 'NF != 0 { print $1, $2, $3 
}' dtrace.out | sort > dtrace.out.post
     test/unittest/usdt/tst.defer-nodtrace.sh:if ! awk '{ $2 = 
"undefined"; print }' main.out | diff -q - main.out.expected; then
     test/unittest/usdt/tst.defer.sh:    awk '
     test/unittest/usdt/tst.defer.sh:awk 'NF != 0 { print $1, $2, $3 }' 
dtrace.out | sort > dtrace.out.post
     test/unittest/usdt/tst.dlclose4.sh:    $dtrace $dt_flags -lP 
test_prov$pid |& awk '
     test/unittest/usdt/tst.enable_pid.r.p:#!/usr/bin/awk -f
     test/unittest/usdt/tst.nusdtprobes.sh:    awk 'NF == 5 { print $1, 
$2, $3, $4 }' dtrace.out | sort > dtrace.out.sorted
     test/unittest/usdt/tst.pidprobes.sh:if [ `awk 'NF != 0 { print $1 
}' dtrace.out | uniq | wc -l` -ne 1 ]; then
     test/unittest/usdt/tst.pidprobes.sh:pid=`awk 'NF != 0 { print $1 }' 
dtrace.out | uniq`
     test/unittest/usdt/tst.pidprobes.sh:objdump -d main | awk '
     test/unittest/usdt/tst.pidprobes.sh:pcs=`awk '{print 
strtonum("0x"$1)}' disasm_foo.txt`
     test/unittest/usdt/tst.pidprobes.sh:pc0=`echo $pcs | awk '{print $1}'`
     test/unittest/usdt/tst.pidprobes.sh:    usdt_pcs_all=`awk '
     test/unittest/usdt/tst.pidprobes.sh:    if [ `echo $usdt_pcs_all | 
awk '{print NF}'` -ne 4 ]; then
     test/unittest/usdt/tst.pidprobes.sh:    usdt_pcs=`echo 
$usdt_pcs_all | awk '{ print $1, $3 }'`
     test/unittest/usdt/tst.pidprobes.sh: usdt_pcs_isenabled=`echo 
$usdt_pcs_all | awk '{ print $2, $4 }'`
     test/unittest/usdt/tst.pidprobes.sh:    usdt_pcs=`awk 
'/<__dtrace_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' }' 
disasm_foo.txt.before`
     test/unittest/usdt/tst.pidprobes.sh: usdt_pcs_isenabled=`awk 
'/<__dtraceenabled_pyramid___entry>/ { print strtonum("0x"$1) + '$pc0' 
}' disasm_foo.t
xt.before`
     test/unittest/usdt/tst.pidprobes.sh:    if [ `echo $usdt_pcs | awk 
'{print NF}'` -ne 2 -o \
     test/unittest/usdt/tst.pidprobes.sh:         `echo 
$usdt_pcs_isenabled | awk '{print NF}'` -ne 2 ]; then
     test/unittest/usdt/tst.pidprobes.sh:pc_return=`awk '/'$pid' 
pid'$pid':main:foo:return/ { print $NF }' dtrace.out`
     test/unittest/usdt/tst.pidprobes.sh:objdump -d main | awk '
     test/unittest/usdt/tst.pidprobes.sh:echo $usdt_pcs | awk 
'{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> 
dtrace.out.expected
     test/unittest/usdt/tst.pidprobes.sh:echo $usdt_pcs | awk 
'{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> 
dtrace.out.expected

On 1/23/25 21:49, Sam James wrote:
> We missed some in 8a1264bf0e818c8624be250eb5174714b62ed93c because some
> other test changes landed before it landed.
>
> Signed-off-by: Sam James <sam@gentoo.org>
> ---
>   test/unittest/builtinvar/tst.id_ERROR.sh         |  2 +-
>   test/unittest/error/tst.clause_scope-regular.r.p |  2 +-
>   test/unittest/variables/bvar/tst.arg3-ERROR-b.sh |  2 +-
>   test/unittest/variables/bvar/tst.arg3-ERROR.sh   | 14 +++++++-------
>   4 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/test/unittest/builtinvar/tst.id_ERROR.sh b/test/unittest/builtinvar/tst.id_ERROR.sh
> index 082ebd0c..480d99a3 100755
> --- a/test/unittest/builtinvar/tst.id_ERROR.sh
> +++ b/test/unittest/builtinvar/tst.id_ERROR.sh
> @@ -30,7 +30,7 @@ fi
>   
>   # Get the ERROR probe ID from "dtrace -l" output.
>   
> -id=`$dtrace $dt_flags -ln dtrace:::ERROR |& awk '/^ *[0-9]* *dtrace *ERROR *$/ { print $1 }'`
> +id=`$dtrace $dt_flags -ln dtrace:::ERROR |& gawk '/^ *[0-9]* *dtrace *ERROR *$/ { print $1 }'`
>   
>   # Construct expected output.
>   
> diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
> index f7a200c4..bf7e2614 100755
> --- a/test/unittest/error/tst.clause_scope-regular.r.p
> +++ b/test/unittest/error/tst.clause_scope-regular.r.p
> @@ -1,4 +1,4 @@
> -#!/usr/bin/awk -f
> +#!/usr/bin/gawk -f
>   
>   # This report has a variable probe ID in it.
>   {
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
> index 2f6e51c3..97661b75 100755
> --- a/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
> @@ -50,7 +50,7 @@ BEGIN
>   }
>   EOT
>   
> -awk 'BEGIN {
> +gawk 'BEGIN {
>   	ok = 0;
>        }
>   
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> index 38cb38df..b5460b6c 100755
> --- a/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
> @@ -49,7 +49,7 @@ fi
>   
>   # Parse the disassembly output for start PCs for the dt_clause_n.
>   
> -awk '
> +gawk '
>   BEGIN { phase = 0 }
>   
>   # Look for disassembly of dtrace:::BEGIN.
> @@ -70,7 +70,7 @@ phase == 3 && NF == 0 { exit(0) }
>   phase == 3 { next }
>   ' disasm.out > dt_clause_start_pcs.txt
>   if [ $? -ne 0 ]; then
> -	echo ERROR: awk
> +	echo ERROR: gawk
>   	dump_files disasm.out dt_clause_start_pcs.txt
>   	exit 1
>   fi
> @@ -80,7 +80,7 @@ fi
>   for n in 0 1 2 3 4 5; do
>   	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
>   done
> -if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
> +if ! gawk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
>   	echo ERROR: did not find all expected dt_clause_n
>   	dump_files disasm.out dt_clause_start_pcs.txt
>   fi
> @@ -94,10 +94,10 @@ fi
>   # dt_probe_error() is the problematic one.  We look for those calls.
>   for n in 1 2 3 4; do
>   	# For dt_clause_$n, find the starting PC.
> -	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
> +	pc=`gawk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
>   
>   	# Look for the starting PC and then the second dt_probe_error().
> -	awk '
> +	gawk '
>   	BEGIN { phase = 0 }
>   
>   	# Look for disassembly of dtrace:::BEGIN.
> @@ -120,7 +120,7 @@ done
>   
>   # Do a sanity check on DTrace's error output.
>   
> -awk '/^dtrace: error in dt_clause_[1-4] for probe ID 1 \(dtrace:::BEGIN): invalid address \(0x40) at BPF pc [0-9]*$/ { print $NF }' \
> +gawk '/^dtrace: error in dt_clause_[1-4] for probe ID 1 \(dtrace:::BEGIN): invalid address \(0x40) at BPF pc [0-9]*$/ { print $NF }' \
>     disasm.out > err_pcs.txt.chk1
>   if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
>   	echo ERROR: problem with DTrace error output
> @@ -130,7 +130,7 @@ fi
>   
>   # Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
>   
> -if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
> +if ! gawk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
>   	echo ERROR: D script output looks wrong
>   	dump_files D.out err_pcs.txt
>   	exit 1
