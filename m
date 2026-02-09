Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DAB3F23C3
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 19:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770665948; cv=fail; b=J9nr5upw18NC7S6ErmVKTqa0TjHmMBSx0rmDi9fJEwW0q5FbTeCwl2e8OZWdr0OQIT9rTDAoKGOW/ruQUNIWRRZMJmO5QSYF99aFSFx30yAqSZ9s0LCoJZFP/oNUvOknQbm1sD/wI/ZDVwGXQWwJIHnQYgGLcq5km6Z728SWFG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770665948; c=relaxed/simple;
	bh=N8b3o6Uksx9c44SWqGYIso+4hU8x2UMAuUq/VkKYeZg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BcjfCBYEb8NfIzPJ0eYdoYkAShG6YJnmbaQ8gehSR52cJkfbw3xsbCrKvwMOhXRYHQASaUlbZvqcdyYwUeNU2d3rda7pBgO1jZHh5Hujfc2XVLtg0nvb0CNUgbTOS8qIZao//qlVAIscZVHcRr3N5qPgmd2TG6oQ0XHvKBCq+E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HYU4zWiR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oKtq4qIE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HYU4zWiR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oKtq4qIE"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECi1v1822662
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=+I5MWf6shHflef8buAm8mvwHzsZM2k8ZXA0Wf3o6WmQ=; b=
	HYU4zWiRDPqmI1iRxF3dvZLp0G7HyVUY52nHOPwmjP4HhCen0fC6ce/F15ZefWXs
	NBI9FmXXIdPybLFd4ws8lrif+pVMDhLw+NM+DIkG7a3T/oOrpv+aViQm95IXpXrK
	n0WTaNruCy6zFel+RMY+bSN6EXzsQ5hvWPpzE4zFJzyMILbNK75MKPHB7C7WcDzA
	Nr217kxLsdq8YBpcf4F6ESsJyff/j3p0Db7YlwRBErXM3GU2ZGnW8+Ymi+rn2ZSw
	3/mK88gtqtAREfJ+sIlotG5GCJM27tfuPmjHj3rb2YJIXUfZiopsSL+xYuf+Rgqs
	9M5lVxODCTN1hslovlBHVw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xk4tmh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:39:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619Hggfq035340
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:39:06 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uu9g3sa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:39:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5mtaW6WLIhScHFLb74rwimK5GuRDdmFowgWaaEApNt2NKR006cD4QNu0MiMnXvddu0rOg8L64fERwdrRNXdwgPUXvrHTA2QWb0F9hOBZkNnqKSeBN5zJ+RTe1ZB2rmqc2iwaIVwbzfxPkVJdcMU4nw5dp5C8cEnP6lg5sJ6pwMaeE5eJnjx517THeWO3zEHTwYfRsJf/4XcCWTWop51qi2VpYm3quHQSycbPYvtQu2Xn1XD10tn5pmZu7IHgj5l4J024IdS7gNvtsRg3zlUOaLglZab1rY9mbQZQWBBJ5Npq/EZOMoM2CQdA7CiYlRe/nVQ6yz5YI1LHKEnMbC52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+I5MWf6shHflef8buAm8mvwHzsZM2k8ZXA0Wf3o6WmQ=;
 b=ZZe8eLc2Y62/3S6R2SlyIJ+3NbbYfqtJPXjkjI2SEgYOG5jGBrTP8Yeslo5gMy5aQZ5Sw7CBD12MJhJ/6n0LiD7r08QwOKz/0kPj4hKbEjlCArwUcF5ONflH/YDKQbvG/+NKU+fCvwSdUl1w8T8w/9GCT+v4r2BQa7rxfdBbs07R9sskJDqaeGQIXks35gcx9AJA5YdW3YmxKmE1d0Aiyuj1vN/2uxEPHetAsN8eil1JcmeuXmisBSd51W0j0TNfyaeAC1MFgVu97spwdShvEArOogYUQFLIw2Nxi5LICXuTs8S7OgSo0M2ajCPBkgje4KNQ6r404dQ4Sz+zwONGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+I5MWf6shHflef8buAm8mvwHzsZM2k8ZXA0Wf3o6WmQ=;
 b=oKtq4qIE3CodGKzVrl+dmWNh/1KMiyss43fODhktP2p1MDIPwCLy2slxMF7mTSYvt377AQ9d8el/M5GvwrDfVxOH6nj8sb+sFAnlbL4ztdmaklYBIIYJBD8XSc1ETfK82v7q0I3DpbwoeL0lEkjYkBIkFKpD+UVzkU2w+mnfQmY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5782.namprd10.prod.outlook.com (2603:10b6:806:23f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:39:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:39:01 +0000
Message-ID: <e503f50f-72e5-89c9-99c7-7e82cdf757c2@oracle.com>
Date: Mon, 9 Feb 2026 14:38:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] pid: USDT probes cannot have "-" as
 function name
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522231ADA11F5C6C606FC8EC265A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <a1051394-2811-d0e7-ecc4-f421396b2bf4@oracle.com>
 <aYo3ZO/boPXs4NBW@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aYo3ZO/boPXs4NBW@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:217::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1b8371-db19-4186-eb7b-08de6812e012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUhrRENZQWZmbEF4QUl6bVVDemJhaUNOQU1odE9LUmRNeXNzaFZsOUlqMDBY?=
 =?utf-8?B?THlxZGRWeEN6OVNjVi9PSk9LUWdIaW91NFJvY1BJNnRHWFdYRmZiZHdLZDJB?=
 =?utf-8?B?MklSakZlblF4ZkhNYU9vZUIxcHNOZUh3NzF0bzVPK2Z1SU5VMlNTL0Z0cWda?=
 =?utf-8?B?aS9Vcmk4dVUvQ1E0TnRLR3dHcXc1VFplZU8xa2pwVDJqeGFPZUJHbXVTWm53?=
 =?utf-8?B?d1RtQ0NDbVgrRHBweEVZbUNwdmRxTlRnNUJacWJnNHhFall3UUQ1cHZkS01P?=
 =?utf-8?B?SStobnFvQ29zcWtiejA5NXIwTHNWRkNyT1B5RFJTUjlFVzNFaDd4UjVqUXFI?=
 =?utf-8?B?TXJTN056aU1vejNweHZ0anpwYzVWVzFTTUNiV2VFK0VueDJLYSswQzN0Tjdm?=
 =?utf-8?B?TTc5d2pGWnNIazNkcUFya0kxSVRPczlKeWZ1ZGdFd3BHSmV5ZHBIMXlBQjZl?=
 =?utf-8?B?STBmNVVCZjBNejlUWWt0VXB0RGZEQlFRRVFIK1JxVUVxc0NsRCtqc0F5TDk0?=
 =?utf-8?B?dmZRNTJGMCtHQTB4Z3g3RFNHS0dyOW8xZTJ2Uk1iejM5TEhlMTI4ZWdCZjNs?=
 =?utf-8?B?QWFiMHA1c1RYZHdnTlVuZXJYbjNoQTJ1TyszOUl4YUE4aWk0UVdSRitSMXhD?=
 =?utf-8?B?d0lpY3R1T2d2b1NuVDFGMFE4K0lNN01icVRybnNWRmMyZVh0dXJ1UVdDSitY?=
 =?utf-8?B?V1BDTjhQWm9sUTFTN3hFMFFVRjR4L1kvV0M2UFRRK0kzZDlOSTJxbkFCeVE0?=
 =?utf-8?B?bTF3N3dUOHVyc0Q2ZTRBNHpVaUhTNER2S29HdDQ0dG90c2hSNEFiWlZ6RUhn?=
 =?utf-8?B?c2toV3lvL09DWWNMUHdtZmpIN2doTUpxL0RkTkpLMG9CdGNGY243OTlyYzI2?=
 =?utf-8?B?dXVab2xsTFdBSUtXblU1YnhGV1g5SUwvSkRvZVA3SWErQjlBRjc0d3JtdHhW?=
 =?utf-8?B?eWdYRWZZSlBmMXNQL0lQRUZ2SUdGbUNVK21iMzcrbk93Uis0bzgvVTNSS1JL?=
 =?utf-8?B?NXgyREFwNm5hdFVMZUwyaXpHSU04YVdWS2NDeVJGVlljTm0wNkt3V3p3MDNJ?=
 =?utf-8?B?UzIvY0Q3RHhFeXVlblhVMnEzRGNUdjVKc3MxZlBKTy9DemtQWEFmT21FRmNU?=
 =?utf-8?B?dmg1eEdPRk1TRUN3S3BMSTFoc2t2T0psTlNRLzFsUUxRZDBjS1AzVGsxVGNP?=
 =?utf-8?B?WVRMWlZDak1CeDhOOWJVY1NqTVFwNExHTDh4aUtKSHYvUHd6OUIrOUZOaUtT?=
 =?utf-8?B?a2NLRUZaVXFiTjFWaWxhdjdYMmtwUGNkbTl5TTZlR2JTODNDenpvRkxUNUUy?=
 =?utf-8?B?WE1aQVU4UlZKczB3dTMvWHQySEJvVk5oY3NmTFU4djQweFBIR2h0bWI4ZWZk?=
 =?utf-8?B?ZitiS29haFZuRzcyQ05aNytrSFZZL21wMDVyVk5NVlpwaHo5QndENXp5eWRR?=
 =?utf-8?B?TDhSdFQyOGJTY0ljbm1pcENsb0hINXh0dkFzSk9WMlAvamV1NkZrTzJpLzVP?=
 =?utf-8?B?VGJUSmFnNkpweGVjZmIvbUV3NjV5cXlFa2k1N1h6Yzh4WG9NaEtFckpCL0pi?=
 =?utf-8?B?STN6d1d0Tjg5SnllUS85bHR5UXZpQkZDNWp3cG1lalpRVkV2QTF2dHV1eUYv?=
 =?utf-8?B?RWtqdWc2WHRzMDZaVGp2dTdQSllJRTBlekI3dFhudlNpRWNwSW40S1kxeDd0?=
 =?utf-8?B?ckh6LzJUeUNQVVhpNjAwc2V6d21taDNDb013WlBJY0ZTdkJlVllaZ2V2Z2h2?=
 =?utf-8?B?bjZVRUlQM2JVMEJXM3ppS1dqbm11NHl5eGt5bzQ4MjRPOHYzNHdwWDVuTVZl?=
 =?utf-8?B?VmE4akEzUjVUcDRmL1ltOWF2MDhaS1NKeUp0bHZBR1l2aFRaNVE3TVJOaTlG?=
 =?utf-8?B?bEJ0QUZCQnBONk5ENktxaDBLblZFaTNwQTdLV0RmNjl3UUF1U2QwTlpIU1cv?=
 =?utf-8?B?Uisya0JoL0V1VmE5ZE1ST0lzaGIyZWt2MUViNnNMZGQzbXBBS0ZvUk44d3pj?=
 =?utf-8?B?Q2RDUmlwdld4UHRHT21LK0w2eWkrVHp5aGZXUWRsVjlnWVc3ZEZ6RHJQb3d1?=
 =?utf-8?B?R0xVR3c4eGlxYTJBdHllK28zWlBDQ3hHL2QwSUIwRk96ZXZwdzMwSGpmaS83?=
 =?utf-8?Q?Bumc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmJsd0JuamFUbW1xYjJxaDBWb25OV0tUeGFoekJlS1hKaHI5ZWdRckp0aFQz?=
 =?utf-8?B?SGZIYnJRbi9lSEF4MlJ4MVBZYi8zTEZ0VkZZdHFmckV6bHNuNzBzNGEwQWlw?=
 =?utf-8?B?SERVOUhxNzdtbVJuNUdEZFZCZzBQQTE0SlpoS1dzZDdhRVpBZHRFNk1CNHNM?=
 =?utf-8?B?Wk1UWE9zdDQ3bk9OcUNrTzNuMUlxeCtUb0xVUTNNc1dEbUE5V2FTVXAyN0VV?=
 =?utf-8?B?bWh5ZTQ1MXB3Z2ZubkVPNWRYb2k0SGRlUjdrZi9GNXlMU2hGYWp5M08zclZh?=
 =?utf-8?B?VFBhdHBxUng2bHRGUHRNb0RiTUJKVTB3RGFBN29DV3VPRzJhMEhUZWZpbjFO?=
 =?utf-8?B?Y3FRQVY0cHhDQlYwUkdGMHRlUm5xVktWTlF0ZWo1R3RramNwcDhFRjVma2xH?=
 =?utf-8?B?Uy9vTHlUd04ydUNpY3Z5UkUwVXRmKzFiQlR0N1pBQU5CbGhLM1N2RXkwclV3?=
 =?utf-8?B?eld1UnhhdGZJQXBkU0JTRkhRQUJaenFkUXJva2dWSFk0dUlvbDdmNU96eDZ2?=
 =?utf-8?B?SzVTYlV0c2REVzkreVhmYVdwMFlMMm9IcGhCZ1VReHVNY1pIV25FaTloeGQ3?=
 =?utf-8?B?Y1VqZEhQZm1za0tCUlEzeWRabjYreFFhcXVFRUYvRzF1UVRvS0lnRC9zVmxz?=
 =?utf-8?B?Rm1ET2VsU0lnZ01ma0Myak94UXppM24zdnlId0ZUVUtoRjkramZ2dE56ZHlC?=
 =?utf-8?B?SXRYVXh6MEU5eEtrL1lYMHo2L0QwZHJvZXVHL0k5RklaazVEOGFGUXNIUlZ1?=
 =?utf-8?B?d29BV2dHTVJlSCs1VHJ0Z1lYTVJZRWhCeTFCQnhXSFozblU1N2tVdlNEUmRj?=
 =?utf-8?B?dWpGYXZqM0NRTDV5VHRRNVlid0xhenRMY21aSnNHS0wyZG9LQTZDdlA0M0lD?=
 =?utf-8?B?Nzk2eDVudVRzajdzc0owQTQrUUlJbHoxNlVKRjRwVUhHU1VQZXVEa0dLV3R2?=
 =?utf-8?B?RjREc2ViY05JSGk2QlR1bUlYV09oWWc2NDY1WXJyMW03L1dwK3d3dGdGUTE0?=
 =?utf-8?B?NUdGZzQyWStLTFNOMENNK2ZrSnpLaDlBVDZMUW93RGUyYnlHOTl2YnAyZG9L?=
 =?utf-8?B?VGFHNFJtUFNTY1J1dVIzSkZWUTd3ZHFESUFRYVlndlQ2T1QzTGJWL3ZrVUFr?=
 =?utf-8?B?K095ZlB3NjNOWnlmWnlIKzVEaFc5cDZ5WFJiOHFKZ0UzbG15bEZvdGpBKzho?=
 =?utf-8?B?UUZyY1lwNnF0UU43YzFOaXYveFIzMEd2Mk5wVy9HZngrUytmbS9BeERCTXJW?=
 =?utf-8?B?Wk5Sb0xlL2RXNG1zUytSUENSRm0vYU5BSExiWkUrUEwybjhCTmRYNnJndVRv?=
 =?utf-8?B?WldjdzJta2ExMnJwaXZVWjNxbk1vWWdlR3JjOFhQUHREYU0yTVF3b3luNTRK?=
 =?utf-8?B?b2RKUG5ycTNGaVpmNVdnZXNyNmE5K0pKSm52L052TUQvU3N4Wi90d2hLQm93?=
 =?utf-8?B?a0tFQjdPQTdNZFdPMDlqR1RBZy9mNzZWL25tME5iK05jRWtTeG1GK1poWW9D?=
 =?utf-8?B?amFmU005L3VIZTNTZlFETVcwSmlnbnNWdlpVQUFXNzJUZkp0RFBLODJRNWJm?=
 =?utf-8?B?U2x0cVJqOTVmRnIyaklqNFkwd2RTcTlnSSs2cVhTRnd3NjRpWmxGOEc3QTVC?=
 =?utf-8?B?aVZOMDN0OTdMQTZzSWFaeW43N1pOQ3lhSXViZU9Land3Z3Zzbzh3NVc5Yi9F?=
 =?utf-8?B?QnVGTWJLazdwTFRRZWVNZHE5dElHcUkrT1lDNGpNM29UL1dITzRGRm9oVlZP?=
 =?utf-8?B?bkxSL3AwYm4relJLRHFzZnY4ZkxWVllwMlg3anJGbER6OFp2ZXRiWFZUNUhW?=
 =?utf-8?B?SjUweEN0dENTZlY1TkZMT0p5NE1qVFY3Tlp1ZlNKemFmdDlveU9PcXdPOERy?=
 =?utf-8?B?UkU2V1FBSER2TFpDT0JtdjVrTVFYNkM0TnpQa25zbDJmMkRQM2JON0R0YkU3?=
 =?utf-8?B?NzlwQ1NEOEZXOFBIVnpNRDZuOFFsbFk2bklEQ2lUY3dObm10QVNBR3RZRnU2?=
 =?utf-8?B?Q3pGNmtTMTQxVzV1VHNqQlVMU1NpeGZEemovc3h6MmJjb2VGMlU2RC85SnVo?=
 =?utf-8?B?d0Q5aElhOW5YanRGM0lYZVJwKzdocE5ZM21YMDlHNkFhR3FGU1AzSDMzNWty?=
 =?utf-8?B?V0Rtd2xaL01tTFRXRGlNeWE5Ymc5QVozRHREY3NxblBGOWE4MjVuZEtiZjIz?=
 =?utf-8?B?ZjNFUGdTT254bG9OTThSZlNuS3NaZ1NHYmpPVjJBRGFxcFpIMGRsZUpwTmhC?=
 =?utf-8?B?dXF2M3UzVzVBQU0rekdRQXFxMUFHWW5Ta1F2aTlOdWNYZllFK3JFcFY1bGN4?=
 =?utf-8?B?WE90M0RYajBpVDVnejRna3dQVFZxOHRpb0p4OGRiak42ZFBuaVZXdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bKhTgvoPqBMzFxk3b5IjKB/vUTwsHxhbx6AL0PKfKsRqJ+kv5C9DIZEPx96yUJH9+aOlrwvaOxj/sPqXhbIMU+jsF6MI80Bfd8+uoNdg9NQgwfE6jCImlLftjQTMi0GBjJLjBfLJbtep+GerS/FaJ94QCRmNch+plnaVustHYMGOFDKZTKCHot7SGO7VsCt//+BLzrv/Aq0X2tp7561/rGWy4+doVzXsKZePqtYbfZR0aV1vkhVsmob4lqi8xgxW3SHUtXY1s1yfQz1udN6uQy2UN9PR+VlKHzrIElK0BW2PFTCIQd9LnbHyMIPsFd4rcRxmS9qDRq2Rtaq+xqZLkRzLYkoKJgwIPLLpxQwWw2e6+Fv4mD8F6F3tE4JbMU59U1/iwM/QltWhAfQcAmIOQqoyDjT3qMzfPi7WZtFxUY5+NVWsiXY4IlDdm0e8ORYdc4h6rtizozxZchQwb4LeTlMgpO/DPyM6MtNxeZHrn+KAqdSYGlDCB4qatTx72Y7zdyesI4nok7ZqoW2XcXrnfxpB8EmR/xwrMUS+Nn0D37klEfBpEvbuFOVA6I22BMpXdlBDN+Gt+Rw/k/POxu4zPzqj6pbJNFS+9eBnckHerfg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c1b8371-db19-4186-eb7b-08de6812e012
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:39:01.3688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qhr5G++KbL87G2D9kX9jWIYwHzU8Bv8xwJYW25fUrQOOdL8LFSqLX41lnyZilet5w7U6SGCSFrpqMHI3fDPshQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5782
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602090166
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2NiBTYWx0ZWRfX/uwmCy8B+rFz
 x5o+zZwxHFEGd+vHbwjl2aX/uD4m3SHvJ+UR5A62j7YeibECjp3f619pv6kUQ2qbE78gRM+t68Z
 bQ3IJdj0EltfYLmzjnoQvPduj6Krrqgnjbuoz5MdLQgJnNTf7jR1L5E+/mRT/2vnmLlyXhn1yUR
 Y7cAPbpXpL9NdmQNrMNW7mh+lXtABSLb2qlIEG5qMGP8HTW0byooIuJHbdXpAN3c1uPBpCTIAt/
 30wMqaphwGF6+foalBgO6Zf7coTgfWdGCwLlWcLS3cEfZO07pHJ59wsAwW3mLMh4IpPx0JiPzL+
 781pLed74BDd08W7AWa/vix+aE7cFRQ4SNWWsPxpTVS7agud30QcwErLce2XBGr2ADPxl6Q1PNc
 8Z7nz2UkXknL2lGrLay5u/H6G1g8UdRqhx8yJOYHdS0vl3ExQrF6XEPQ0aPI7Z3DwibQfvshRdR
 hQAjoEUBlwIBjGFOyew==
X-Proofpoint-GUID: nvUs1JUcG_Q5pBUzO6ne9vd1Lc7Oy4QC
X-Authority-Analysis: v=2.4 cv=ccnfb3DM c=1 sm=1 tr=0 ts=698a37da b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=TaTEJ0EFND4tNBiFkk4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nvUs1JUcG_Q5pBUzO6ne9vd1Lc7Oy4QC

Okay, but I like having some explanation like that in the commit 
message.  Anyhow,
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 2/9/26 14:37, Kris Van Hees wrote:
> On Mon, Feb 09, 2026 at 02:22:11PM -0500, Eugene Loh wrote:
>> Could we have a little more explanation here?  Like, what is wrong with the
>> current behavior (which is... to complain that the probe is not found?)?
>> And should any test check the behavior?
> It is an optimization.  That is why I added it right above the test to see
> if there is a pid in the provider name.  That was also an optimization.  In
> both cases we bail if we can determine immediately that the presented probedesc
> cannot be a USDT probe.
>
>> On 2/9/26 13:35, Kris Van Hees via DTrace-devel wrote:
>>> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>>> ---
>>>    libdtrace/dt_pid.c | 4 ++++
>>>    1 file changed, 4 insertions(+)
>>>
>>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>>> index 517b9265..ef97c8d9 100644
>>> --- a/libdtrace/dt_pid.c
>>> +++ b/libdtrace/dt_pid.c
>>> @@ -1568,6 +1568,10 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp)
>>>    	char *globpat = NULL;
>>>    	int err = 0, i, nmatches = 0;
>>> +	/* If the function name is "-", we're done. */
>>> +	if (pdp->fun[0] == '-' && pdp->fun[1] == '\0')
>>> +		return 0;
>>> +
>>>    	/* If it cannot end with a pid, we're done. */
>>>    	if (pdp->prv[0] != '\0') {
>>>    		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
