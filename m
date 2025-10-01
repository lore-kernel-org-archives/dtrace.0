Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E525277CBF
	for <dtrace@lists.linux.dev>; Wed,  1 Oct 2025 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759347624; cv=fail; b=Xk4T7B5op+AEZH9RCxzU2XpW7R7jVq7ZRRK8wZqfArIzJNuhBJDyKHGxSqAlEWw8mVmEZ6DaGJQ4vkv5l8udbkfQZ7CUTowGAb7TUgzg0poDdOYgZjnXW2iWDXhI6RMuvS4VNPi12YggI5/AJh4Q3g8sIJpsrF552IFWv+0htb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759347624; c=relaxed/simple;
	bh=NeyqEWyb7EaK4beDPixl2MHbFmCljgZWdiohXPA1vtk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QZb96fWcOpLKVfHttrlpOSys6soQaMO3YVweCSeAQifZFuFBG/XqEWmY1fLB7wFJoQBI0Fh6FgrYaAdf+XAuzUlpNulS+wCMEWhXnnOM0nm4QSwdPozDXhj8ZnHVDVARPNs/yqSx+vamDYPmnd0RLqaHJU8bILRbtzFlUsDNFFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XHIJAN5n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i8zn9X/p; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XHIJAN5n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i8zn9X/p"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591I0mLM022778
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 19:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wfAalc+UydmbugQaM/a2qAS8V7dEJZs+NJKviNOAgUg=; b=
	XHIJAN5nYlOcbcJVHBPjw7lLbavNDaYqPAT/ghAPkF3kuz6Up5hY71IlkW72gZTQ
	2nAt+6FpXid0RwvyQj1uvE80BZIJdCjNFalY0c4BiwAFTqCLApeBV2DGjh11XK4s
	dkgcsUlPFaXzTToHB7ZPIMmRr4m6nWTMH2Mgetcc2Cbr0PmZHbeWHtXefzgDy1aF
	u+EOZsXM2kF7rAW3NK05qUXn/R2ieuiW6yoTIMKe91eVAX8qk3BXTnn2P+DjdSy+
	6xoX3HXQa3vo9uUHlRbxbac7f005tbGLl7dd/0cMFH/A11V/pA20b9Du9nPxKHAm
	kTS635v68iS5Bwy1+nhHiw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gkxnj5h2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 19:40:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ij4cS012238
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 19:40:20 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c9mdyy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 19:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y77WW2YK+VBWTu3AHAquorqdSCBRK8Z2RRMg4WUFqjYlkXWttNDRcbtDdWQvYhQFOIJM6ykAtYcUYT0xnT9yL3QGx+ULIs5ozYHwsCCCzE+09sw2uvd7QW6mZGA9iWl1XTfN6F+Z9X+IXlcFpr3K+1aCYrQBVBEHqWWBu7MbY+5WA/Gw/XZcAO0HOYP02tEn3nC3OjHGbZmbRWfdQekAIMq0JG0rPaKkgvx7IJUNIzMa3hhZajNx0s+X1RfIhtr1Jv1DcARWqHS6WiBMxUm73MeIJOjfWqvMIYddGuGKdSFvZMZHwer+KI1HqgEwYcmPrlKI0JM2TI0GlQYN02PEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfAalc+UydmbugQaM/a2qAS8V7dEJZs+NJKviNOAgUg=;
 b=EkF2TKNRkXp8v179EC24ysoKydRIQ7VbSnuNM2hLYH1tW0b3yW9JQVLmliVLMTC6nsUSyytIntaCEmpmBE/nFasQGrLOXcsgvjgpalc0hT0KR1N0aGBKe9o2vwhZUzS56fXwhBmCArCAHYL6lgSFm6xASSSeD5SWxmPD8qBRjitu32o0PYXvNPwcN4Bc3KBeY7hifm0mKZrdt95+X4VPnlyHFdzpFjCVSFybKypR1rnF1Kx8QCNX08i0GVHZRj472rpt8PuSBh86IP9yH2bILDQ7odQUQKr4l0ohyJXbzPC5Kz5t0+4j0uUsyz874ejC7aNYFwxTtIPOvf2cmnhBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfAalc+UydmbugQaM/a2qAS8V7dEJZs+NJKviNOAgUg=;
 b=i8zn9X/pYtKKuMrCcqaHEdSmWswE4TQLuCnErxj0xZaIK8D+WZQAuEbwZvqJgVJl+/8RMI44WdU/ekx77coTeXxA6fTZV31ng6wop117ace2lpj2K2ARGnG8M5PHPseGdbSF62C5q4UGdpYLVPv1Bu2mXmyfZn8PeiGIUXrgAx0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4411.namprd10.prod.outlook.com (2603:10b6:806:116::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 19:40:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 19:40:15 +0000
Message-ID: <8d2d86f0-fc8d-721a-dc61-9859259c2bed@oracle.com>
Date: Wed, 1 Oct 2025 15:40:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] cg, agg: fix alignment of key components
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672C0C0B5FEB048DF0CF23CC2E6A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672C0C0B5FEB048DF0CF23CC2E6A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH3PEPF0000409C.namprd05.prod.outlook.com
 (2603:10b6:518:1::48) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c093b1-040c-4590-c3cb-08de0122585a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXU2a2NLRVFiZG9UemowcmZDTGVKVzN1cTFMc2dQQ2JJa0xTL0lXVFdQSXM0?=
 =?utf-8?B?cENGWlhXMFp1TFlOdHhsNUxxcXhlMHVYMWk3VGJNRTJDLzBuWlloZzhxa3BL?=
 =?utf-8?B?VXBLMkVxYUpOU2hXazBUQlR6RUMzT1lVSEpoSlJ4ZzZ0dTRzQlhndUdOdkZa?=
 =?utf-8?B?K1RpVThGVEQ3L0JaOG5jemY3bkNlZWV5R1R6ek1NbHJuUFNXa0hTa0tRU2Mr?=
 =?utf-8?B?MTRkQ2pJL2hOZXFZdkc4WCtPeWhObUozb2FJejJEeENJVjdSSDRPRW42R245?=
 =?utf-8?B?WTAwaitTRmpSMlAweXB6dkhJSFZBTkwvRXhvSDhkS3F0K2JwTXJhbXFVRGt5?=
 =?utf-8?B?VmpIdVV0RGRtTUJXMFc4MXEzaHplZk9zQmRKdFNXSkZ4REs2dGI0a1JZem04?=
 =?utf-8?B?ZkRyQlZUMytPTk9Lc3dyejdlMGpFOUZUNUtGQkhMNGpBTEsyVmNxQ1JMU21p?=
 =?utf-8?B?U0VtS2kzTVo5REQ1WHJIZ0ZpMHc2NmlRTml2cms0YWpMK09sVEt3c3FjWktH?=
 =?utf-8?B?UDV6eUhpNkJPMktwRk9pejhKWVVCZzVYdGhySmJzRENPSDRqRGlLU2NRcC81?=
 =?utf-8?B?azdBYmlZVkZCaXkrTnNPMnBuMTNoeGNwMW1oMkhFVzQ3alRZZlFMMjV2bUp2?=
 =?utf-8?B?eVBrbVVwNVhXZGdtSVAyM1hSb0xYb01wUmozUmQ4TDNvc3Y3bnJBa25qU1U4?=
 =?utf-8?B?K280SlhvVzZIRUpJU21odS9qWkhiVjRrMHBzUFlpaUhQNTJTMWpjTVN4L1U5?=
 =?utf-8?B?dTFlWXFlaEJXcUJtZHIxSmhjS1g1REE3a1hnQUNCTmNyUmJ6RlhHQzZFKzhj?=
 =?utf-8?B?NnlkNzM1Z1E3cVR2WkhMMXRpUWUrVk5KRjVXdHN5N0ErWXVaaHVnVitvcGpo?=
 =?utf-8?B?U09rdmZWNkE2U1kvUGtQYkJoRFZJRFZmUkZkQkc2QURBMkx2MDRKNlZPQVhr?=
 =?utf-8?B?Mlg5TnUvb3Nod1B1bTZmT0RucnpnS1BteHR2c3RLZ1JiaWdPdzNzLysxSnEw?=
 =?utf-8?B?cWU1RlpjcXJ3YmM5Y0E2OUNOcHdVRUZJU1VhZGU0RFRFRGhmK2FtMzBVNGhU?=
 =?utf-8?B?Qk9ubk85Vk1xMkFzL2N0WklqRjI4YUdld0JmTVVGSjFCVWJQdkoyUW5HMEpj?=
 =?utf-8?B?MysrWGIyNlNzS0lLdmF2UHB6MFlCd0I1RExKMCt4NHVZOE0yTUoxT0JLMzVp?=
 =?utf-8?B?QUpSS21LaWNQY0xWcW9TanpJV1FYWmRCRElPV3hGejljUlpDTHg5eCsyYzA0?=
 =?utf-8?B?WWxXKzF4Y0VVVjFBTmZqMFAxSnVhazJQMExyUDFQZjdOYlU5L2hNRm8zZ1ln?=
 =?utf-8?B?M21FRDBURTAybWQ2TEZ0NEJUMUoxUGFrMjU1WmFKTjhqWTdQaTkvTzk5UFBT?=
 =?utf-8?B?OG5rb2dNVVZ2UlVwT2RINkhCT3dCYXhiazYveDRkU2orUHdSSnk2bmU1M2pl?=
 =?utf-8?B?N3RsMm4zQ1R1ZUlTWFNtb0VaQnpYaHBKMzNIQmI1SStoODRpNVY4RnlOYUN0?=
 =?utf-8?B?MWh0V3BmcTFyS3ZDNTdDbFZXTlJSR01xQzhpS2xxTnNyVmlQUjVjSjJkdmUz?=
 =?utf-8?B?K2MzQjJadE1abldkV2M5OTFmcUVjT2F4N045ZnVmZlluL3pTNDRwWVpPUWtQ?=
 =?utf-8?B?T0hBcms0NDJBRjNkQ1JiREJiakFQZ3FQV0IvYkNLQzF6YklnbytUZkhGa3Ba?=
 =?utf-8?B?TTRpSWlyU0cxTlBJWXZpQVROWHlaRUU4bXpBVWF2UEhhOGFtMTI3aHZ5ZWRQ?=
 =?utf-8?B?cDBJUzU2T3ZsQnFpdlo0eTM5TG5xVCt0Vjc1ZFRQd2c2ejNjemliY0pBV21R?=
 =?utf-8?B?TERmZE43aUt6WFQ5Yy9VdTFiQ3JXRFU5RU5TTEFYT2greUE2Tmg4SExuMFZu?=
 =?utf-8?B?RWlidllJT0U4bjlka0V5SFc2dWVuOHgwY0M0Y2VqUHArTXV6d2FQSklST0pD?=
 =?utf-8?Q?09ZUeH3HY6vxXcm6bKdmKo2iVF1jpagX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVqbHZPSVlrL25kRmhvWUJIRDIwd2ZBNytpNEl3V1ZMOHVMQkxVSEtMa1h6?=
 =?utf-8?B?SC9qZTExQUs5Wk5lWjBBa0ZHVjBZK2RTR25wazNWMm5oNG1vRXZpd2RtTEI2?=
 =?utf-8?B?N3ovYTg3L25remx4Q1dlc1l1N1lpbWQ5NEhCb044V3MwNDVCOUFzaXVPL3FT?=
 =?utf-8?B?cHJ4dENsZkVCSTNodmdFaXpTVG4zbmJSdVI3Rzl0WXRjZ1hySkdqTCs2N1Y5?=
 =?utf-8?B?QmpmbUl2M25kdWJpSlp2SnpNY3JWcUpMKzkwdXhsTFVlekEwL3ZtMldERll6?=
 =?utf-8?B?Szl3eTJsNm94eTBmbmpucDRQSVV3dnJFQ2tHRUpvZGdCUGdiWUptT0QzekIy?=
 =?utf-8?B?L2Z3SHdGVGQ4cS80NHo5ejZWcFBMMllNYUViWUtpdWxFR0lGTFVYcEJRa1ZB?=
 =?utf-8?B?ZmNkSWdxUmUxSjNiVVdsZm5jNlIzdS85eW96TktZQXppakVUM25NWHBEajBy?=
 =?utf-8?B?eCsxdzJaQTJiR3VRaWF2MjJ1QmpPMk5JZ3NzK3llU2hWQjl5UmUwdzA1R0J5?=
 =?utf-8?B?aHJGSnRQVGhwK3FmMk1hWDZpNTJjZUFnckhEUnVjTUwzb082QWo3U0pqUjA4?=
 =?utf-8?B?YzhLNG5wZE95eWhidzg2WHBXSjcxQWJTV0Yyd2xKb291RnhsNHlZaU5tMjNz?=
 =?utf-8?B?RXJ0MjlKNUJPOTRlMzRxWEIyVHczV21xN3dCMEM1UE1rcFVvbTJwNkJIWGRP?=
 =?utf-8?B?MFRCMEdLU0JhUld5N1UvcGZZR0J1b3N1eHArVGpROEV1OTU0b2IxRlZFQ1M1?=
 =?utf-8?B?eW1lMVRMQ3lxUnVjRzlZSzBhZ3BBMFJ0cE5pWUhvYStXcmQ0VXl5LzR0dUhS?=
 =?utf-8?B?TmsyTUJ1NExQQ2V6YVU5dENQZ254UmJKZXF6aWFLdUx4bmlnRjUyNks5aXYx?=
 =?utf-8?B?cC84YzhYb0VxNS9yTWcrdjIrZnNHbjVKTTZLc1crWnZXNVhXSVh3RFR1Zjlr?=
 =?utf-8?B?MFZMYURPWkZaRzgxN1IvcU9GVnFZdUxXcGpYbnIxZU80NmF4Rm96UTNJQWtG?=
 =?utf-8?B?MkIwZ2RRRFRib0I0ZHBHUVIyVTd3Yll5SVllKzN6ZDNPRm12ZUJKTm1jV1F0?=
 =?utf-8?B?OXlXUTdPeC82aVRsZzB1UFlFbU1XMEVZb1JDWXVOOTdiMkhWNTJlZ21lWEwy?=
 =?utf-8?B?WG84WTJCYURFRjJrc08vWWxFQ01UTHF2LzlYcld0OWtOWTBMaXh6ZUszdUQ3?=
 =?utf-8?B?QTBIN2wrYkI1SEluQnRaUVBFMWxONkdqaFNMaTZidGtZdlhTdlkwUHgvK2xB?=
 =?utf-8?B?cEJvWnphcG8xSTZzZ0cvVkNURW82ZUVYWTRGSEx3WXBVM0wyc0MzZzErMHZy?=
 =?utf-8?B?U1djdktsNlVNaU9FTm5XOFl6cjZBYUtMMmwwUk5BaDQycllYMnJPODVGVng3?=
 =?utf-8?B?UjRkbHZzZWRqWUxqRkFUazBPZlFva09mc1lNcUtZNGNyaWNHV1NqUHhEalRN?=
 =?utf-8?B?Ym45Mjl2cDJGNklTWTZxNXkvRW5wUEZ2SG56dG5MUW0yZ05nRjBvT0xNRTdF?=
 =?utf-8?B?YTlNaEgzV29JRjNvQXVScXIzaFExRVFJS2FkcHhOUlIrZlB0UWdnWCtpZFRs?=
 =?utf-8?B?NlNtMzE3aitnVnh4SHp1clZwRHl3anoxUGF3ZStWVVdJRjhhUWFaWVJYbmYw?=
 =?utf-8?B?L25iQnZRVWsxQzBKbjZVY0xzRFIwM2kvMCthUE5QVk5kK0puQjFhd1p5ZUpW?=
 =?utf-8?B?Y1E4U0RnWCs5NHl0dnJ2TVN0YzhnTEJXbDlCNkNFWWc4SVlSWjE0dC84Y2RK?=
 =?utf-8?B?NHlNSjYrNmZiNFdGbGYrYkt2Z1hQU3cvYUgxUlI5dHpwU2U1N3NKcXZVL3dw?=
 =?utf-8?B?aktwNDJxU2pWOVJVK3IvalpVNit4K2s2Q3kyRHVlYlJSU3k1RW9qRmd5Q3pU?=
 =?utf-8?B?SmRscXVSK2R6Zm5WeHNLUTJwMDZLNDByeTIxcDZiTkJPREx2Rkg2d0h5WjJ1?=
 =?utf-8?B?Yy9JVnFaU0xVVVk3TjhMT1V1TFZxUVBmUU82RUZWd3NpMmwvcWVVbTFpR05v?=
 =?utf-8?B?K2p0d2JtMk5QZ2owRTdPOWtIbDBhZU5nSXU1R3hheHRMUWVzdEV3MDluOFRC?=
 =?utf-8?B?bUROYjNDSjRvclJVWUppWWhaNEJ2NTN4d0RwWXM0SUt6dDJQczlHbTBJNFVi?=
 =?utf-8?Q?c5NCBuLwREjt2AWeMMI9sTtw8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kcIppYr8p23e0G5RUlFlw+1ND2F/aYwrk41qko1tLAGHV/Zqk3lLO0xss5wnhASqjuI/gUaIKeP4dZ/afaCIEY20+acZ5eVNdY72vD636z3sC8O/fYIQ14XMbJe1H7aDDyyredzzJNhiUn4RNtmWrMmomfyUh2NO280HM/zyOuyGRGlsRwRwvb/jXIoMVyFW5BhxymmcFFI8t8/8NDk2yHp/n/oGA04N6Lb2xk5vHuTBgzEa4vh1LhgOFX4SqgOuXuflObquFYYehSY2qf3d+H7BurhyjjYSEzOubQ0Sa/eE8/bJ6pDd8iWlnXVog3eKYcOjUt6bSLhXvdULsx5J+CW6kK00vo2C0xuTEe8OkyHzNRyP+heKbSZXUMDZxho2TFl5fnuxgtyC9NPq4sxFenxIJVNYdrOCCgvni9MmSrtXR8GeYcCX/C+okikU/ia45l9EgZ+wmbB1xdpVBiBS8y2iIMi0yzIOlHfwGCWAUnzP5rt4VFQsEH4JVsk/rIeeeLzA98UMI85F/jl8HwpiaLPPBoNd4fbs//0OpImDsRq5CIBvAiirM4qmjF0F/eNmZ/RZ+v32DsDJramcmykIAwBtFaC1iERynmVTkhDK/Is=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c093b1-040c-4590-c3cb-08de0122585a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 19:40:15.8417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJHhK5snf/DvkE27vIODh3QUP14QKFk2FT7GrHdfJQo/Eik8uPOZM4xUo3jYzAschTWNGFDFKB2Ye/Rc6xSajQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4411
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010171
X-Proofpoint-GUID: 3Fpn-o-5KR3U_2EwZ7BZrqtyL1un2dHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2MSBTYWx0ZWRfXzTtX4JB8HtOu
 dwi3b7qJZOdkOSZ5U7Sgn8qt923becj/RSU7r/ilDyXBBnDX71jHNKvqn+vyWLUxZbyqRUtAS/e
 a0wIzKaJyoipSyDkmxuXYZhMiTU0+EKs+UI78AvbnWVb3z/skkxhP6QneeV5ITPJJVl9U5auX9e
 I2G+UiaSxFpmEcqTcYZnIbZWMzZZTBqctIM9Kz/WvnVZwz4vFPnnM8uakTLluIJpoDmohtYkUu8
 8IFgKSGRyvNtoakpdwX9wjC9Pbpfjo6jbb4DQNivoIegukO2+9MWB7Ir3mhTnuzU7tmAkCJRXFL
 WdJPUelqUuSKRV+rjW6hxTIDlkqc0l9MCU646aTOF3VYqX4qWKJQSqzEApiOPK1I/xOSBltK4Ub
 uq7m/0VXu0xEsQArqYO5O2MNg3ehldpyL6QjovnGuujA4JQzU3U=
X-Authority-Analysis: v=2.4 cv=RLW+3oi+ c=1 sm=1 tr=0 ts=68dd83a4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=xDIaOKNiHgDy4uvdqjoA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12090
X-Proofpoint-ORIG-GUID: 3Fpn-o-5KR3U_2EwZ7BZrqtyL1un2dHy

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 10/1/25 10:43, Kris Van Hees via DTrace-devel wrote:
> Reported-by: Ruud van der Pas <ruud.vanderpas@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_cg.c                      |  2 +-
>   test/unittest/aggs/tst.chararray-key.d | 25 +++++++++++++++++++++++++
>   test/unittest/aggs/tst.chararray-key.r |  2 ++
>   3 files changed, 28 insertions(+), 1 deletion(-)
>   create mode 100644 test/unittest/aggs/tst.chararray-key.d
>   create mode 100644 test/unittest/aggs/tst.chararray-key.r
>
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 1f120e1d..33435226 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -8734,7 +8734,7 @@ dt_cg_agg(dt_pcb_t *pcb, dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>   
>   				dt_node_diftype(dtp, knp, &t);
>   				size = t.dtdt_size;
> -				alignment = size;
> +				alignment = t.dtdt_align;
>   			}
>   
>   			dt_aggid_rec_add(dtp, aid->di_id, kind, size, alignment, arg);
> diff --git a/test/unittest/aggs/tst.chararray-key.d b/test/unittest/aggs/tst.chararray-key.d
> new file mode 100644
> index 00000000..af45d4a5
> --- /dev/null
> +++ b/test/unittest/aggs/tst.chararray-key.d
> @@ -0,0 +1,25 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Char arrays can be used a key components.
> + *
> + * SECTION: Aggregations/Aggregations
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	@[curpsinfo->pr_fname] = count();
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/aggs/tst.chararray-key.r b/test/unittest/aggs/tst.chararray-key.r
> new file mode 100644
> index 00000000..a2dcbc2d
> --- /dev/null
> +++ b/test/unittest/aggs/tst.chararray-key.r
> @@ -0,0 +1,2 @@
> +
> +  dtrace                                                            1
