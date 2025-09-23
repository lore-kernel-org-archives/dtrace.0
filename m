Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E211872628
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 22:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758666619; cv=fail; b=stkyc2wJIp2dCYQREOwgSHCQiIPux6yIfeCQB93cKj1uKpoA/mGGTpWD2UeWTZRAZY17ays9hF0Edvq1yAjbW/eMXLsUhdLuj+YPambF+K+zz6mN2sX+txmcjwklZw4tFANm0gtVtEsuOjVnDp82xYe3PrmaEePXrwYUs/ZpjA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758666619; c=relaxed/simple;
	bh=IphAap6ZfzX08EFjs9sZLkdHXtUgnw5CAdA+OHDNXHc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OQ73D6rQa5WEdzdoFuvSfpb5z+w7RyWqjDmOu7j/OUOF8eTlfLqoEhSvqPKEHNQxYRmIBmNHcRx9+sDr35gKB3/4aZUzs9js1ykgZKH8hZiFF5VgC9/hpCBFPijN+DfhQ3cbdx2WMYWvuSZYgvCRBKEXnWiIrsmINoPNpGzUzLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U+mmPReK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c6fuwg2W; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U+mmPReK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c6fuwg2W"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NLcG57024294
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 22:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lo4YIWh6AV7Sbuxlm5tL7iITsbv15g7F/i6O5I/sOCU=; b=
	U+mmPReKAZauDsDG0BFCGQ+Qq5tYp/syEEAoEEKXppO5dQ+X30PhRG1aUeoQeajR
	M1EWHJIVx306dZS8EOFEAtbr6KAaQLyV3c5tP+yFCldoFQgggb3wrBG74baRhK8q
	wUAG9qcrCwbb/7OHervak00QDczHZFeTCiDJaXS05jqbQfNTlplS+T9RjraUS8Pg
	CHeKoUUNQoY6YpoMtHOqR8iEuFlsGJBJz9ZiNUuNEH7P/fWByivD3AavmdpASxp0
	p4cab1pSc0VW7d+O6Czrfoy/uy8sf1r1LQFDdFAPWrPsd6Nf3wZnvEMOLAEJHjem
	PA5pMD5VnjMw1KxJ6s6vEw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499mad5rya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 22:30:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NKru9p025265
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 22:30:15 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq945na-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 22:30:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Im+SVg3e/2O65o9JIlwrlA2ykn8sW1ow0MiKsGrISCuHaJ2nIVKxymlAVZHkvLVSxeoDHKKt5iF2M3rxitSwkh7N7Z34jhNiTMNesqaRfI9vtafsj62IK5YPhsyShJQ9squUw00ChGasi8oOpkVOLoDImJc2dGtY3Nje16Nv92mKGxI2tiGVLfGdCE47Wtu1JoIE9vvO9vrbTjDnQ/IdXV/weYdeSNMdsxzmoNnvhUzHzHHuVnIVHmBSR6PQ5ZXkzwIIBVsK8TB8io7FT4lkGouwgUxyYJq+wA9FgkavfwSq7nyRddIu5+/xXsoEt6v+L6Th8zq1ZUb82RX1luisRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo4YIWh6AV7Sbuxlm5tL7iITsbv15g7F/i6O5I/sOCU=;
 b=mjgD3LktI+tVNW5XTmWnfKES1ZfbTQ3ZpT4YA0RXOYHXEIpcfjGiwqRoSg2GaDiM4NQv8k0ouxKhcdTVUNQ/7+FbTEikAxz97cxBPwnwf085izPcfLjq8/QeHTC103KYE3yhm5o2Z5PWk7jHtDCuhskwitirP9eOn/2vsmuIAKrYKE5hRxjp7/qbpbEFrE4mYiIWPUhUBC8NZHhNvCn3QFBURJdozdVHnuYLpvv2lhwHAIi9WF1XT3HGIZnCStsYBy7BnmI9IvjhPa9/liMemDhbX/YOWnMJvSRwHHvb5ZwOtgw5COtlA6GwsL8n7mnueXgZ7ymr3I+LoCnmXArrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo4YIWh6AV7Sbuxlm5tL7iITsbv15g7F/i6O5I/sOCU=;
 b=c6fuwg2W8PGtKmXNWWlpmwxX+w7BVZcOvgUGRtwvPoaUJoTSeOeOCTurXDIJdQJCYsQ9zyJHtEtkFmJq5qHie4qjk+RYbM96lZIxeNY1lKqhvM/EKNsUnIdC8EQtvkbBfQmBzcM2O4IMF+TXhj4geQXOswIU4pvCvmaLNDcDv+0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CYXPR10MB7924.namprd10.prod.outlook.com (2603:10b6:930:e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 22:30:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 22:30:12 +0000
Message-ID: <f972089f-e2d6-13a6-ef53-bdca98472db5@oracle.com>
Date: Tue, 23 Sep 2025 18:30:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 3/3] cg: fix masking of lower 32 bits
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB567238056385C0BCE6329EECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB567238056385C0BCE6329EECC21DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:208:32d::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CYXPR10MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b96021b-d672-457f-b246-08ddfaf0c273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW1KdWFCaWxqeE5MVW5sZFREU0phd1k4LzQwcTlZQU9DNWVpN1BIdTJDTVF3?=
 =?utf-8?B?M0VBd2ZITnR3TU1LVW9FZWJUUStvUklwRTRSU3JMRFZZYXpsV0U0R2VhQlFE?=
 =?utf-8?B?V3EwMXJyWURVL21ZTFZvWEFTT3E5am04NW5UYitWN0hvNDY0aGhYU0RhbjhH?=
 =?utf-8?B?SnBaNlYwQ3B4TUVYK2U3YjErdjlNT2Z5bzZXUmdMeG1aM0VxZG0zVm1PNnJs?=
 =?utf-8?B?OHlDMGZ2Yy9rSlZaVDV6d0dXaUloUDFDcHJQeUlIVy85aG1iY3BFajU2ZWNV?=
 =?utf-8?B?bkZ2ci82ei9EVUt5a2JTeGtYSG5EbXRVeDlCU0xML2l3RGRrU0prMHpJcnNJ?=
 =?utf-8?B?S2lmS1JpV25OUHhBTjRvbkJydDRVWVN5ZU52NE9TcHFPMnkyR1Q5alVxVVBr?=
 =?utf-8?B?OGVudUwvb3hPeTlIVzY0K3Y3bDdwS1hvR0FlN3FZZEg3eFFLWWIwSTlaT0xM?=
 =?utf-8?B?L1ZhRWN1M3BOZTUvQmt4TnNmZU04eWh2TFBkQVliUm9GRkw4NjVsanRMTUcy?=
 =?utf-8?B?NitzTjZINGJ5QU5lQ1huc01Wd2xtV1FPNnhML01pM2w4Szd6RDhVNVVPZlZE?=
 =?utf-8?B?bjV4ZThaS1lCbC96VUFvbW5KZGxTUnl6dEZSeGJsdkVBSG8wc1U4OHNBQWl1?=
 =?utf-8?B?MXhCZHNBeWVaTFlyWDRjVmtaNkJZZDFjd3NtY2w1S3lZS0pocnNVTVVESGVL?=
 =?utf-8?B?dUFwdG1qV2dtN0EzRmd0aUJXTmF6SUh0ME1KNTBRUjl0ajBCL1hENmlkQUhU?=
 =?utf-8?B?MU05V0tGTSs3MC9SQ1ZvLzZWVmhiVTFjQWhtaTJHYVNiWFd4Sk9iUFpiczlw?=
 =?utf-8?B?TGdCaitqQnJtK0NrUDA0TjJTdGxvUkRZYTZzSVh3T0JJMEdhVXFnYXRkZ3J4?=
 =?utf-8?B?ZEJHWHhQYTZBemIzeEMzQmljNmFwaFJ6TU51SDdXYm4zVmNPZW1EaVdhRDha?=
 =?utf-8?B?YjI4dTBpNjlyR3lzZ0FFRWJiNzZ2WGpnZWM1bEh5RjhkNXRvTzZhbVJxSW8w?=
 =?utf-8?B?QXB3eVdndmFlVXc3V2M1RVVWUjQzRXh5K0FtbTU1QzZDWnZwVWc0c2lOTHkz?=
 =?utf-8?B?ZEFiSEMvTzJqWlJLZkU4ZktVRTUzZTV0Nk9vSUMwTXlkTGhOM2d1NFF1dkd6?=
 =?utf-8?B?eDAzbzNGa1Z4QmhRR2gzZDF2Uy9aZ2ZqUmMwWXRhNEdxSkVERFZxTUtydHdi?=
 =?utf-8?B?VnNkUDV2Qjh6ckFJNjV2emhzMzFHRUt1NXMzMkZ6Qm9aN3JMUW1nd1JzSkY1?=
 =?utf-8?B?NFlRN3phU094UkVaSnJjRS9FZjR3dmNINzYzaWg2OUl0cDBiQ0dBcWlobVJl?=
 =?utf-8?B?akpDbTdZOUUwZ3I4WXBacUNibnR4cTFNd3I2cTZsc0F0czdpdVlUeE1FT0FT?=
 =?utf-8?B?RjN1SlZ1SGFoOVdzRW9hS0c5NW1xS09OQUdjbWZqYlE5V3UxbjB6REpHRlZ5?=
 =?utf-8?B?R09BenVla3ZLZXBYdUlBU25hY1dmT255djEyKzUwSnlIdWxxbE9uVW5ndlJ1?=
 =?utf-8?B?ZmN2Q1cza0RSTUdRS3ZmU0FoM0NMdDU4ZFhFZE0vVUhCUjlFaDJsNjNKaFVy?=
 =?utf-8?B?UnRaWDFFYllWUmFNVkpNa3R3dEJxemdqSVB0eVUyaFFscGRTYStIdFEvRmZo?=
 =?utf-8?B?VFNRNlRTRjcxNEswb3FibXc3RW55OTBkUjdrWnpjRTdsMVQ1VmNRelZNRkth?=
 =?utf-8?B?UnJJMk9HVzQvYTlBczNUa0MxY0h3d25XRlQrd2N0S0RiRDFjSW9LS3BmL25H?=
 =?utf-8?B?TjhhenlRdUlNWWNtbGxrZmNuV056VFN5RGQwZTkxMTVqc2RpeEF5RVQwaEx2?=
 =?utf-8?B?MzVBYWhERjZySldxUWpKME9aMjJxaTQxZWVFMVZiMGNaS0VoSk41Z1ZFYk9G?=
 =?utf-8?B?bGhtMHlDbjl3MkVTY1B4YjFhVGU4TVNnMzlKWlBBb1Y1QUptS2l0alZGN3hL?=
 =?utf-8?Q?A772bz7JUak=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0E2RHE1UEJVTklJR1lBdXlBYkVRYnNzMEtwRDJ3SzV1Zml3d2tuamxvdHc0?=
 =?utf-8?B?dnVaczlmOW5pZFBBL1EvdW1wVHFHek54VStuS3RKTUNoSzYwRER1VTRObXI3?=
 =?utf-8?B?Wm9pN2hoQ0c4d1dzQWN5dXBYTExkN3p2aFgwNUM4djI0TnA5R0xFcXBwMGc0?=
 =?utf-8?B?SllSaE9DclJPeTFjaGR5M2Z0ODNNcExoaHg4aG16SzZyOFZ1ay9POUdtSm5K?=
 =?utf-8?B?TDdDWEZJMGp4OWdHbVU3aG9UNXVmQndlZC9UNlZOaHFEcmNTL1BsN0Mwb1ZM?=
 =?utf-8?B?NE9NdWQ2QTBGQTZUNVRobjlMS3BFRVYvQWtNbEtUWUV3Z1BzY0xZTXRjRlht?=
 =?utf-8?B?MWRHVFVhV3haMjM5c01wU2tJOGtieXNJZkhTaWV4eWFXSWYrRHA3NTJ2N2NI?=
 =?utf-8?B?aXUvRmdjekxVTHBWQStMbXQ3cmxnT3hDdEI5eDFEdGI5UVNBOXRSYTJNQm9n?=
 =?utf-8?B?V0Y4K3JEUW41TkZoYWZHN1Jua2ZJSTh3TnN3QWNsc0pJR0tMbnczMW1LM1hI?=
 =?utf-8?B?QzV3a09DWFArcmRTTFNKNnMyUDBCS0FtQ3NteXQzLzZYQWx3UHVCREZzWUtW?=
 =?utf-8?B?MGFYNy9qaW4zVDlKL1N3VWE2MjFhU2JQN1J2QUdIeE9lY1lIL1k1cFBmOGp0?=
 =?utf-8?B?QnFvTnhJQUVIRDVEYlA1QnNDOFI0MmdFSGJ6OWhEMStDMm5EUkJwbkYyZ3ZC?=
 =?utf-8?B?aVF2U1Bhc3RsTlJ4U1BKVHFoaVEza2FNcVlwQ3dMVnR6aks2K3ZwbFpoWDRa?=
 =?utf-8?B?SFBTRWlSQlB6UzFIdjhRWUh3dTlpR0xnb2RnRFRxZHJJNGNZejA4OVNEckVs?=
 =?utf-8?B?SFh3eGtDNXZ5SWRFSGVQYUEzckU0QW9obTRuM0tSSUxscExyeHdmelJmcEN2?=
 =?utf-8?B?NCszZEp5VFZ6OENkdG5uTkFLNTBMWWtjcHJkY2VnLzROdDBtQzdCZENZdjBU?=
 =?utf-8?B?dGo0WWRFcEt6VUFOSmpVZk8wUUlHWFhsSlNOU3ZPTXcvZjRnMTZXejdXaytm?=
 =?utf-8?B?RGJRR0VPNC9PK29CcVByQ0hxemxZR2hsMzE1TmwzSmdHVmprQ0R6dmhiaVRN?=
 =?utf-8?B?cHJ4Y0d6ZlFBZEFLV0FUQVV6U1FIOEZFeXpSdXVWVEVLOGR2OWVwSEI3dE00?=
 =?utf-8?B?S3htUEVnNnNueXlEMnk5WDh5Y2Q2MjR0cEVZM0NnRjFPYm9nN3BrSW5MR1VY?=
 =?utf-8?B?Ym1CSkpZRW5mK2JlL2trR2czanZGL2duVU8zYnB6MkVUcFJXclRML3hBNnQ5?=
 =?utf-8?B?cGhraXpJT3lIald4T1R2VVBYTU1kOEtVSjB4ZUdhcDNtbFp3Skl2UCtLanEz?=
 =?utf-8?B?YkFoQmh1czNRQkg4d3pLT2IzbnN6VCsvb05xZUFBZXZ2OUd1RTlyZFJmK2ZK?=
 =?utf-8?B?TDBvd2xmSjUxYUxJVW0wczNTUTJJdW9GMTB6TlVvTE5GM2pZSkhWbTBUdFQx?=
 =?utf-8?B?WEJFLzZzTFZsVmt0dHFFejVjMElDNUFJalpvVGN2N2o3aG5uTEdmZFo0Y3du?=
 =?utf-8?B?WmZUSEdrYmp5ZHdUa1l6dTNYcjcrL0d4VHA5QjNkREVGRUw3ejlSMmpSVkhy?=
 =?utf-8?B?RFNmZ1Fic3NvZ0g3eWVJRjRXOFlOOG5VdDJqSEQ4K280WWo0WjlLSVo4YTFP?=
 =?utf-8?B?T1NmMitoR3NkS1lDR3ArbE14WVlmSXJJSmZIeW9qWHNEY0RVRlNlQ09rQXl2?=
 =?utf-8?B?WVk5ZzFEUlRKamtjbVk4OVR2Q1dJWU1uZWxrSnVFc2R3NHB4Yk55N0FuMWU2?=
 =?utf-8?B?QlhMR2MyOVRqeXIreWNqSGhMT1UwVEVJd0NRNXM3ZzQzdFU5eTU4UDQwOVhN?=
 =?utf-8?B?cjBQWkxFSkxoZjJyVlhuR0UzYTBPdU5rRUpGTnB2TS9ZaFF3S2dTVVRFeDhO?=
 =?utf-8?B?STBRcy9td2EzTS9Idy83YjRNSTBXclVuVm9Ea3BkRXZkSGZ5RHRPZVN1M1lG?=
 =?utf-8?B?ZExzNTlCb2RsZHd6ajlQaE03dlluY2kzMGZUaUZNcnJvVCtmMlRnOEl0ajUz?=
 =?utf-8?B?VU9GYzFjeEtZWEQ1QklMNHR5Si80b3I0STIvZk1LVXNEVnhMZjZZSDRaSkdX?=
 =?utf-8?B?NzJHamkrbVZ6L2pBZ0ozWTJMVWlEaGNDR20rNDRUMWF3WEkzNVZyMnRnYkUy?=
 =?utf-8?Q?ton2s6SoUFMmLxxvWACqCXvGj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uW+muM098vWhNmk/kmjm5lO4xZEsCtC1sx0kE2M8s5XVRPREyU55yil/IBbr35H56va3e1n5J6zRf5m5zgsKeUMnMD+QJyXbD7qOBH9NrqOsJ2YTjcvuHSJg7JXxMk93z/IIQUUd7VE6O+5wmiPJ5AQPavQLYF05GKWzxMsH+iIdehWjNjeMOVPCKH5f5zyXxQYkBgShCxde5S5ELFrCPiixIzdAh0jCWrMNgPu1hEnLZJb5w72Q49QDBS9EEaS581LkHLe8E+MrrVMrEYgq5NNsl8+h80dvrOLq8wvc0NlBTGwNB9+ZDMEexP4jBFEQWsI87C4ArOKMM6Dv9O9I5jLiiUkl1nmO8mH/LIRM94y1NIiyt9VAhM79NtHqgYzrY/IzbnQIFCHKfH+X6z9l2tc5+0/ZbfnEfJst+c7sJFRY20zxQ3lqnCeNkxhdD0AOx29pHlpP5yqnduOflkHKuajF8fRg+i1GS4SeLmH4xCjN5Izn4b4fQg5ALmBIVNH/vH2D9JLsxmQGYQWizF+iNvpadDXp3UDuD0cJcrvhqXGBLw0imWNAeDh9PGPZ4I0PdKBMBT+okwGCd3pn4uDBB2irYipgh/VHvK24rZjVI1s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b96021b-d672-457f-b246-08ddfaf0c273
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 22:30:12.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSShN85ExiYFVYbwWOiAgmnVlWvWcY7P96vK4XV3/QeOS6MXeEEj66Gim9OzbUz5AkCNC9uY62KLCJxKfhmMjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7924
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_07,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230205
X-Proofpoint-ORIG-GUID: 2d5rdNQBfFyL2V4Kty1EYj52sgeA_FLh
X-Proofpoint-GUID: 2d5rdNQBfFyL2V4Kty1EYj52sgeA_FLh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyOSBTYWx0ZWRfX3RXsNLgJA2Le
 KLmldr3+gPo6Ya6pm+W7neFNMgmS+Y870j6nTTrOdvkE9lLcxtMnHm61shCUA8F4sMdxIBqzfTt
 1lA1zmWd/Ua4fVnORWmLp+80PiI0ixfNNtE/bG7bI5X913bIv8BlHfdR9I+vMWb/SqRh8DHryKi
 Z7y9GVx+ioVf4rBOQbz9UHsr2Ygb+9yiQbx/udrLXQB8fG/iM3D101FuoWMQJy1b/dCsV3PVjed
 zGKqP8Ne4OG/3fKRsJcDgccwc8uF6eekymsgpPZ0fvMGcz9jZ/YTyYvb6Kmaa0R4BDpIedmdC4X
 BSmimwKVRHaLX4RAO3Uxi9PdMcaMF2BPHMFqVcWnVG8MdPAV/Ruq5g7Bh/ziwIPqEf7xj5sRrg0
 wsIeqZ24
X-Authority-Analysis: v=2.4 cv=Vfv3PEp9 c=1 sm=1 tr=0 ts=68d31f78 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=gJAts9LzvbAACuw7y8gA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

On 9/23/25 17:05, Kris Van Hees via DTrace-devel wrote:

> The "and %r0, 0xffffffff' instruction does not actually mask off the
> lower 32 bits as one would expect because 0xffffffff is interpreted as
> -1 and then sign-extedned to a 64-bit value, i.e. keeping all bits.

s/extedned/extended/

> The "mov32 %r0, %r0" instruxtion does correctly mask off the lwoer 32

s/instruxtion/instruction/
s/lwoer/lower/

I started looking at this a while back and was not convinced that the 
lower 32 bits were what we want.  Do we want them, and do we have a test 
that confirms?  Or do we want the upper 32 bits?  I got distracted and 
mothballed the whole thing, but the test involved spawning a child 
thread and then looking at its ustack()...  maybe after the child had 
exited but before the parent did.  Admittedly, I was confused at the 
time, and I'm even worse now.

> bits because it forced the value in %r0 to be a 32-bit value.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/bpf_asm.h | 11 +++++++++++
>   libdtrace/dt_cg.c |  3 ++-
>   2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/include/bpf_asm.h b/include/bpf_asm.h
> index 152d2312..63987e01 100644
> --- a/include/bpf_asm.h
> +++ b/include/bpf_asm.h
> @@ -36,6 +36,15 @@
>   		.imm = 0						\
>   	})
>   
> +#define BPF_ALU32_REG(op, dst, src)					\
> +	((struct bpf_insn) {						\
> +		.code = BPF_ALU | (op) | BPF_X,				\
> +		.dst_reg = (dst),					\
> +		.src_reg = (src),					\
> +		.off = 0,						\
> +		.imm = 0						\
> +	})
> +
>   #define BPF_END_REG(sz, dst, dir)					\
>   	((struct bpf_insn) {						\
>   		.code = BPF_ALU | BPF_END | (dir),			\
> @@ -68,6 +77,8 @@
>   #define BPF_MOV_REG(dst, src)	BPF_ALU64_REG(BPF_MOV, dst, src)
>   #define BPF_MOV_IMM(dst, val)	BPF_ALU64_IMM(BPF_MOV, dst, val)
>   
> +#define BPF_MOV32_REG(dst, src)	BPF_ALU32_REG(BPF_MOV, dst, src)
> +
>   #define BPF_LOAD(sz, dst, src, ofs)					\
>   	((struct bpf_insn) {						\
>   		.code = BPF_LDX | BPF_MEM | (sz),			\
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a8f2c9d2..28b7e7c4 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -2757,7 +2757,8 @@ dt_cg_act_stack_sub(dt_pcb_t *pcb, dt_node_t *dnp, int reg, int off, dtrace_actk
>   		dt_regset_xalloc(drp, BPF_REG_0);
>   		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>   		dt_regset_free_args(drp);
> -		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_0, 0xffffffff));
> +		/* mov32 %r0, %r0 effectively masks the lower 32 bits. */
> +		emit(dlp,  BPF_MOV32_REG(BPF_REG_0, BPF_REG_0));
>   		emit(dlp,  BPF_STORE(BPF_DW, reg, off, BPF_REG_0));
>   		dt_regset_free(drp, BPF_REG_0);
>   	}
