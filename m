Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E2A26AA82
	for <dtrace@lists.linux.dev>; Tue,  1 Jul 2025 23:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411780; cv=fail; b=g2Fp5DWvvGedrKy8vmA6/nEKAR2G6QfyCbZwE7JOVGmSpKz87qow2nqfIj4Qb6g8OoUAl4XYa5J1nCRUxUPCyrlYmV95AtwYuLyiD2JtWsLB8f+dUSf5EuIly52aPxClTePImnazE8WPHj7ESJbCgvjM1JQJcVlrq02QnsjMIug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411780; c=relaxed/simple;
	bh=w1RvgnwtKKIzvE3vfRnYjqVL+DVVURGAugAo8fHm3cM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RJYKOLzwZOOYA4NFj+rz1AHzeQyFe+h2qapUR7Twxryr5DBQanXHJztNZAKK83Cutibp7m7DBTRzHoj6orbKOmRubHgedcylaQ65v77NYf/B6NHsWtwPtemWQ15m2KNNoBjsn8pB2R7WB8IGW4klKKR24mS+Mod3iiNtixKRENo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZHTYtAcv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DYsTRiZN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZHTYtAcv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DYsTRiZN"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561MuH8T029614
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 23:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pSl9zzX+6YIbdmPMSNJhobeC8khtAr4+j0fXwNsItsA=; b=
	ZHTYtAcvZrJPcJlFCkAuJLFQP6jCcFB5Ixe5F1ZbI17PsY9TsOk/7R5JjRVq1KBL
	dBQzkET/ANrf/P+O/eBWPmIf0vsqXOWnHuxEhkNRFNoCCsxOJ4exedTTNY7ZbT1S
	kU8oJrqikiVRzgkiIseRVxeGPL0dx6CFdd/pd24k2IFM8S9caA+z8l1VWFADVQqF
	a2PuuDNO3mSvHJxZr5wF5j58sb8/SnuwdsSFde7I0+phmWeKzJ3ORCmwmJc+2SgG
	c/CZO5+rBx6NuueA1e8b0KvL+zhqPk5/3kvR/S0eD3Xtwlhpb8te0yKOmIZ7b0E2
	XpHc6URvMtJTSlLQTcbmHw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47jum7w3a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 23:16:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 561MDaP2033693
	for <dtrace@lists.linux.dev>; Tue, 1 Jul 2025 23:16:13 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6uaes4e-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 01 Jul 2025 23:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wu9pyYhqv7beLVt4cSO10Zwcf9VtgAUz4El0VLcqj3jEOagX2PvBvQDjvSxjHEiOXBiYlHmGIxywDeAdzwRptcihu3TZg2GsvNYZydmuewny6BXKF4SORjhuSkV/Mu854DrVmG+p7sGg5mPur+fGoq+oCOJuNhZ454RGi5RM1DvGNpaJYS71c5GK+jpOwuwJuxN2Su6y0Cok6oXCIEG2RQjHVfX/BjYwbn1DkZb3DORKy/GZHFFpK/UToCW7xtCheZO5nS8J+p/hvQn6QiN6LpVxYaHASSTmh/pbW+RElNf508J/MdiQE4qm56FF5qAefB/p+BEf7PEN7fHi0/PsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSl9zzX+6YIbdmPMSNJhobeC8khtAr4+j0fXwNsItsA=;
 b=QuVVnJbQuNfFHj5UPpdgLpyCXGDboqFoZx1+/ogmZTF+baUfUlutQv2d2ET5beBWt9Frc04mVb4Fj9XmukxuVrD77UbWHO7r8uyvKCyqhqC+b+lisUUPwLLM7JCszXxjnp8KKSWctfYJ4KXVGjERRiq/FDZFrZLkv9VdUFPxRPJR7QxNJW3iP5rNd0Vga+Pbi+NwGo+EIIBWW7ne5sRe8QB76WuvQ6F/jsfqWBCPHdEOLAwsYtJVHziY7/b27y/H+N0+BdnLJzPgL2G42abum2iCIHTefK9cSaZ5vmgcke6YfzRk+HtjRDChFaR6nmahnSR+Ad+lA5RQclDwUhqIvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSl9zzX+6YIbdmPMSNJhobeC8khtAr4+j0fXwNsItsA=;
 b=DYsTRiZNc3otoXAO8nxVcm+4Bgn8Alt+mNJyd2dlAVUL1c8VOSXywjp3OA0oow+njVB9Grr5tz+YCtuDJ9HAFUhDcICPXHy5xZTgTZdmR8Q4oVwyG5xKQQ64zbyxEI8tpVYspYDk6EjEQmf647oo5vbGxx3qe/QHpaB6xehdJNE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ5PPF2BE4E177D.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::798) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Tue, 1 Jul
 2025 23:16:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 23:16:09 +0000
Message-ID: <8ed88a3b-6e37-a696-d6bb-38745c144995@oracle.com>
Date: Tue, 1 Jul 2025 19:16:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250610135813.15746-4-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ5PPF2BE4E177D:EE_
X-MS-Office365-Filtering-Correlation-Id: b65f5172-3c86-41ff-91ea-08ddb8f5433e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V3NzSHo5YkgwbGhscHBYMWw0ZStQUTdqSmgwMVZZRUJyVG1mNDcrKzVyMHVU?=
 =?utf-8?B?cEl5dUsvS0VLbDl0RGdyRjJ5WFMrZHErcnp4ZjRGOGtKVllOSXhmTVBJd3VN?=
 =?utf-8?B?SW9DL01DY1d6L3dtUkVya0V0QWpoS3F1VWFYa2M1ODAvQWFvUWxjNEhJZFpy?=
 =?utf-8?B?TzhhQk1saU5TbHlOMUdCd1VDM0R5TmVtWFUwNGF0c3Bmekc5TnBWaER3eWtO?=
 =?utf-8?B?cldXVzhmOGcvSXZaa3lLN1p2OE4xUm42bnVmV1diNXlDSks3MXVKVXU5L1BV?=
 =?utf-8?B?blR1dHZ6ZnN2NEcrV3VWdURyWmlOS1RkRVl6N3daem5tUHhqUUgxNVpKamlx?=
 =?utf-8?B?S2xUUDFLMWJUMUFkOXNVUzlmNXNsVVE2Z1NaU0RHVDhSQ1JVRlh1c0ZrMVlw?=
 =?utf-8?B?YzkxTXovQ0xqK25RSTF0RXJ6NkV3NElWcVVhZ3grRC8yKzVtZWVxYnlhMGJB?=
 =?utf-8?B?VlhyVUFFQzdJU29hV0EzbHNtanRWWjFhTmZXWFllZWFrWkxyejN5djFIRFNt?=
 =?utf-8?B?eVRvMzZRS0pmRVM5dmtxYWdicGNEUkdFNkphbzA0a0xUSmxtZndhbUFJVGha?=
 =?utf-8?B?MDkwM2VxczJwcC9MMld2TzZ5QnVkYjdicVFZcFdONFhqTlpsVmxhV3JxaTll?=
 =?utf-8?B?ZEpiU0tYaWt4VTd1MXNtbElFVHFnYS9xZmpCSWFuZThvSFBkN3M1b1djNkJv?=
 =?utf-8?B?SGNhTEduaVlCQnZvNWgrMHZVZEtVWjNaRmNmaGhiWkx6Z1ZXTmRkS2tXZWlk?=
 =?utf-8?B?dmVMV3FuRStSNlBuTW9qcXN5YUVZK1J3T3pzeERab2JxL2d4YkZPTGZjV2Vo?=
 =?utf-8?B?Tk9VT3ZVblYvMDNVeW80ejNZSjFubnByeWQvK3FQandXNFg5ZndkNHNZQjR6?=
 =?utf-8?B?aUJGNU5hL0FTTm9DOGJqUk5DT2p5ZG01WU9HL2xkWXZ6RzMweGhzanJZcWZa?=
 =?utf-8?B?UUI3NXJ0M2tUallteG1CVnEzTzh3TnFTU3FIWWh4VjBSdkIyZUREMEUwTFNh?=
 =?utf-8?B?dUpieEJqNWprZVoyVU9ieG1DRnZpSVRvUXM4dnVQblovYWdFMmVoRkZaaTFm?=
 =?utf-8?B?Z256SkNmNzJEQlI3aU4xYnZ4aFNoZklKdkVOZVZSRkdBU1JJSzNFUCtXQXho?=
 =?utf-8?B?Zk85WU9NT2F1NldIc0g3TlcxNUh0Ukw2RXA0Z01pWkw5TXdBeGh3RzNkeFdl?=
 =?utf-8?B?aTFkVlRXNUZab0IvOXlWUVNQTVA4Vk9qYk52NnlhQ1F3cUxzTlFLM0NPRHdO?=
 =?utf-8?B?QXZxY0dXdmwveTBGSXpxOG5JbXl4eUhxMVMwakFYUXlDSWlNTm83ZXRSMmNt?=
 =?utf-8?B?dXpZTlVKNXZoVlVMdjBwb21PMUFkWjJYQ1p1ZUFkL3NjNHBSaWZHdHNtK2gy?=
 =?utf-8?B?YnRBZ3QydldjZkZadzlNVlZXZTAwVG9ydU8vUnFoZmtFN0dGd2JzOFBjUEdh?=
 =?utf-8?B?VnhmMjBxbEJwK2tNNnN6a3gza25lTHFscUxhTDY4emp4RUJGU2RQbStlb1Fy?=
 =?utf-8?B?akFabTc0WENhZTlKZy9oRWNDZWZWRnFadmJ4cXlPQi9oTGg0ZzhEMnZkemVo?=
 =?utf-8?B?ckNOMW9wVXZEZERERGFDYmZoMTBFL2xOc29NVjRtLzRuZWR1a3BINGxUVm8w?=
 =?utf-8?B?WTNwbXhGWWtwUGdqamFQTkpwZDE5NkV1V3FwTG9GdkdncEVFMk5DT3pwVUxz?=
 =?utf-8?B?cTNkWGZsOTdLNHhmWGNmRFB4Wms4c21tdXJ1TWJKNW54RTd0eGQvQ2RzYzZm?=
 =?utf-8?B?djgzWmwvSUlxSERxTlBCYjEveDNHNDJrRVhlMHNaSXFReEJDQVh2WXRtNW1D?=
 =?utf-8?B?VHdnM3VMMnYzSzdWN1hHZ1d6QWE2WVd6a1VSdUVZempDR2VDTjgyL0hZQ0lQ?=
 =?utf-8?B?Mk9wekdINUhYNmNrRGlZOG9NaXN2VmdWZFJKa1JkMmE1TlV6ekxyUWJBcWIv?=
 =?utf-8?Q?sPX2PSzxdPo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVBHaDQ0OXYxL2IxNEFacklndDNlZmE3ZURIOUVtZFpqc0FhTER6WldQdmtx?=
 =?utf-8?B?QzFRTGRBQVVJK002WU0zVDVYQmFXdDlwQWRHTW53WnN3clZBSU9ubDRwQzVM?=
 =?utf-8?B?VFVuSndvOTgraExrMW8va2x5dkhKR0pNNUdtZ253aGYzSktiK2hPS0Zlb05w?=
 =?utf-8?B?OVFyU1BYQ3JuYkNGUVloOTlYOUlVMldHdTRyR1lQcjJhREE3K1ZzT1VPU3BP?=
 =?utf-8?B?ZlgwWmFjam5KSFI4c3lqZU85UlFrK1RsOGhHVWMwS01HNXlvL0NLeDFna2Fo?=
 =?utf-8?B?OEVxb3RFSUhjb0RtR0p2bHdCeU9lOFhKdk5TRE0zbFBkQm5lQS8rOExmOU5s?=
 =?utf-8?B?WFlidml0bDVHTTZnWHRFWEVmSG1Ucko1a2l5dmIvRGhBVi9SM0EwK2RKdXI4?=
 =?utf-8?B?Zkw2Rk00aUtsRW1aVlJsSDNkc3pBemxsM0pBM1FqdEVmVGxyTTVMUE9yQzRB?=
 =?utf-8?B?MlZoaE1abGl3RW1PKzBiVkJKUC9lU3NzYWNaOEcwR1VoUFN5MnlRblZLUk5a?=
 =?utf-8?B?RC9UMEZrNTE1NnhhRE9PblFmSkFLbm9jUnM4T2EvaGZ2WFdEQXZzQ3NYZHc1?=
 =?utf-8?B?bkxYZTltRWdva1lOSFV0N1FxRW9lVys1L0NXTWI3ajRyUmdtMzRpRXM4S0th?=
 =?utf-8?B?dHJsbzdBbkJkRjhCMXMwd3dVd1hDVk0zTFkxSzRZZ1VRcldkdjFkM0FLWEll?=
 =?utf-8?B?czFhMm5oWk5Fdm9EUVJhczBZVko0OXNzd3F3akNFODBHbnVNM0dMVkRPM1Ji?=
 =?utf-8?B?R3I3SkN2R2hLbHJ3ZGZBYjJXOEtTOS9URHNJMzl6R3JIeHJGRnowY2ExNTQ4?=
 =?utf-8?B?TTNLT0ZBQzg2aXkzbG1vYjE3S050NGFxRTZOV20xQTZxc1BPbEZsYUxnaldS?=
 =?utf-8?B?dDNWQVA0dEJ5aStCbE9FNkkzT1JldDFJQ21ueE92UkVtSUltaUQ2ZjJ5eEsw?=
 =?utf-8?B?NHVxUllpQS9ybjY1MjRUb3RRTGRVK3ZQU0FjaCt0UWdvMTcxbmhOUVlTSTll?=
 =?utf-8?B?Y1B6d2hYOWlSR3hLZTdIN1VtUjJsZGZkNFo0aXNmV2V1WVVWdDlCZ0ZicDJx?=
 =?utf-8?B?NEhhSUdMSFpnUnQvYnhOZUNuZTBibkFrVDlRZTNGOFpReExaR2grQnNlQTFC?=
 =?utf-8?B?T0lmcXNwajdWWnI0Zk0yS1FlV25OYjBDeEhhUkJEU0t1ZWJiWi9iRTFQWjVT?=
 =?utf-8?B?L1FzNlJOdXJmMTZjUXpzTHRaWFlYSmhMb25pcnBtMkNJdHdYZ29LY05VS01Y?=
 =?utf-8?B?OHN6eFlZNnRiRXRFcTl1UzhqSTNvUTlrVyt5cUE0SDNtalNJWmxYRFR2Nmph?=
 =?utf-8?B?bC9OUUt2OGtzOG5yelc0eDN4bUZ0aWRNUXJST0RPWmZsVDJ5dEpzdHllYXpi?=
 =?utf-8?B?czFERTNDZjlDczJ4dFVQaG5rOXJJZUpQTVJURVQ4MUVtSzFZQ1IxTHZmcXQ0?=
 =?utf-8?B?MEhON2MwUC9SYVNFU0NzV0g4UFdKYys0SmllTStIb2lLOTZFNldKcUswcnJ6?=
 =?utf-8?B?eUc3QWoyS1B1eUpBTHp6NVg4UFJNeEJDcVVTRmM0V0FwQ2h1Q2tQM2xLUSt3?=
 =?utf-8?B?ZFlGdXR6Tk9JVjErSVNCYlZIZkxKTFpuYTU1MTE3S1dDTGFLTDhEanltVzE2?=
 =?utf-8?B?NnB0Tjh5dk5tM29odzgxUWlwRVJJM2dBdlFoUzVtT3V5SFBOa3BzcnFkdTBS?=
 =?utf-8?B?akN5a0FkaFFTaDBKK2tJN0RXS29maUlPMmlVOVhhaUpVcTdsVEt3YXpaZHhz?=
 =?utf-8?B?WThCZVYrLzBZekttRVpOQmhiY1c3M2xIUkJyQWNkeGN0MjVtUy8wZGFzcWoy?=
 =?utf-8?B?dlpDdmRuclF5TFZSREpLUFNaSFhMQk92a2dMN3dmVVVDVEo4eFlVS09veGZH?=
 =?utf-8?B?Z1p6ajlzaUpOUFF2WENhZXRZOVQ2U1JMb3BEUXNtUzZuM0llalFSMmlJL3Zt?=
 =?utf-8?B?cFY1Rnoyak5wSXh5VmpBVjJnMXd1ek5Ud20vN3BiMnV5RUthRXpzMGZTaWJE?=
 =?utf-8?B?dzNGbGNjb0xCWTNlODRxb2ZYQ3o4OSs4S1VjNXZaTVltU1BpbWIwSUZDS3Bj?=
 =?utf-8?B?NW16RW9mQ090MzU4bWo0NERsd2FNVmdTTElXTm5ITjg0akJOUEFZYmpPUXdG?=
 =?utf-8?Q?0Uq8WBGcT8kxYZFY1UwdoVU9o?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E1BKw+3brjJd4zhHIW4DC+Icd8kmjjiagW2IlDfv3+HAwPF7UFbcw6ZtRZ22phEMKx15u61woeGbkqdEfR62rGGTmyllqg5vtev1UMcJO4nm7wSXt+93edlcjSeW7nD0U/TVt8cIYZv4uw8258bTFa/eOlvoACua/qCayG/mBXvG+Py1Vyn9XJhRdKEeCpsK3BXQJakR/1ieUp1IKcYiFufl9GuCVDwqt19TUTZyBZSgMbUZBwnDAIBbW+ZodHdiig7Tfm0PPflhwcn5H0cj0+/vd3fxDbzPW33MA51av+b2FqWKGNszwIipeBHCqBdo2XeINC7iJ7ElQspDM4seJhAE7TmYNRBE5KksHKH2G2wxLvGpHpj1+hFDKXygU+47TZvTnOWMt0X2o2NX3juCQhoO5PWH4DOZNyoVRU8ySh2YzKwIiwfVTQJsy8qFReHvYa7VcTetgWJAYto0fRyi6fGlQQIiSb5HKwKnb2wbc6VO0+R9/rcZZ9RuXrXn0udJVVP3Bin0Pm9pkRXFNRKLZIA0iVLI7L7rxK32Ne6vY2FKx61gqcdSdSL1+KNcgE79VGSZF56YKCXFVbxJExJ3lYHg4yjXWY2QWd/LyCM/Tuw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b65f5172-3c86-41ff-91ea-08ddb8f5433e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 23:16:09.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiFqcbGDORnaR4cD2MrAyrC2RUp+ffC+G65Je1hmAwfjiOqHWMX0IJ87+WH7HtdIsyiR+166jDLtZRnqmVvN8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2BE4E177D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010168
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDE2OSBTYWx0ZWRfX8whM+S+AHPLT Vr/44KGqUzlfLxY9312PMlz8EiUK2OXqcbEzUfdWY2xkooAm3t4xz4nOkLCg2If1bVC3ssrn5Kr tgLQn2fx+RfA0K+hPUYRURyOaWiaK5Q11QK/HDtF52fcHUHkNX1jQZerPP5t8t8/r3C4LvVXleQ
 UexoFSgFRdcmPjAQ6kymyxDXG0VbrvQPZMRTZAnxxTLTZHHhjSI4SFadmdHxLvjMTd8vmYbzgZz 3x5xnbZ1yUp8dXMbBjyObyDkR/uz0hMUTdpnlFVIA11we5lfozhUJwEtK+6UV6AYNqdWmb6sDxm pljHmHul1IKTPaW/JGpw7MMhgn9Ef1+4jWW9s/1bIF9MOXVCF8I1MiuVTGZ9pCPZ1YtiahDw0h9
 hcpCV5dkzdpIObY3gf1jJ4/65Ec+gVQ1+SynJCE3bMcESALEFlv9XwY4W3NVoD8F7+EtifuH
X-Authority-Analysis: v=2.4 cv=MvBS63ae c=1 sm=1 tr=0 ts=68646c40 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1XWaLZrsAAAA:8 a=e4zSUJ4mQz6RWjkm6MoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Q-hZJaXEYojP9nnlKXBXNVRwj9N9yp5d
X-Proofpoint-GUID: Q-hZJaXEYojP9nnlKXBXNVRwj9N9yp5d

I'll try reading this some more, but there is much I do not understand.  
For now:

I think tcp.d needs an updated Copyright year.  Also, there seems to be 
a missing ">";  check "<unknown" in the tcps_raddr assignment.

With this patch, should we also git rm test/unittest/tcp/test.x?

On most VMs,
     test/unittest/tcp/tst.ipv4remotetcp.sh
     test/unittest/tcp/tst.ipv4remotetcpstate.sh
xfail due to missing remote.  Are we okay with "shrugging our shoulders" 
like that?

Meanwhile, my one non-OCI VM ran those tests.  The first test passes.  
The second one consistently reports
     -tcp:::state-change to time-wait - yes
     +tcp:::state-change to time-wait - no
and occasionally reports stuff like
     dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send): 
invalid address (0x1fc0c0000000000) at BPF pc 287
     dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send): 
invalid address (0x225b80000000000) at BPF pc 287

The non-remote tests fail on OL8 UEK6 (x86 and arm).
     dtrace: failed to compile script /dev/stdin:
     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of 
inet_ntoa arg#1 (ipaddr_t *):
     Unknown type name

The probe names are
     tcp:ip:*:*        Solaris
     tcp:vmlinux:*:*   DTv1
     tcp:vmlinux::*    with this patch (that is, no more function)
I guess precedents have already been set for other SDT providers;  so, 
okay.  Just noting for my own sake.

Meanwhile, the typed args[] have changed in number and type from Solaris 
to DTv1 to this patch.  Does that merit discussion?

On 6/10/25 09:58, Alan Maguire wrote:
> Based upon various fbt probe points support TCP send, receive,
> state-change, accept-established, accept-refused, connect-request,
> connect-established and connect-refused probes.
>
> A few tweaks were needed to tcp.d to support the probes fully.
>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   libdtrace/Build         |   2 +
>   libdtrace/dt_prov_tcp.c | 405 ++++++++++++++++++++++++++++++++++++++++
>   libdtrace/dt_provider.c |   1 +
>   libdtrace/dt_provider.h |   1 +
>   libdtrace/ip.d          |   1 -
>   libdtrace/net.d         |   6 +-
>   libdtrace/tcp.d         |  52 +++---
>   7 files changed, 443 insertions(+), 25 deletions(-)
>   create mode 100644 libdtrace/dt_prov_tcp.c
>
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 7e6e8a38..a5439354 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -59,6 +59,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
>   			  dt_prov_sched.c \
>   			  dt_prov_sdt.c \
>   			  dt_prov_syscall.c \
> +			  dt_prov_tcp.c \
>   			  dt_prov_uprobe.c \
>   			  dt_provider.c \
>   			  dt_provider_sdt.c \
> @@ -117,6 +118,7 @@ dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
>   dt_prov_sched.c_CFLAGS := -Wno-pedantic
>   dt_prov_sdt.c_CFLAGS := -Wno-pedantic
>   dt_prov_syscall.c_CFLAGS := -Wno-pedantic
> +dt_prov_tcp.c_CFLAGS := -Wno-pedantic
>   dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
>   dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
>   
> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
> new file mode 100644
> index 00000000..75e1e3a9
> --- /dev/null
> +++ b/libdtrace/dt_prov_tcp.c
> @@ -0,0 +1,405 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + *
> + * The 'tcp' SDT provider for DTrace-specific probes.
> + */
> +#include <assert.h>
> +#include <errno.h>
> +#include <netinet/in.h>
> +
> +#include "dt_dctx.h"
> +#include "dt_cg.h"
> +#include "dt_provider_sdt.h"
> +#include "dt_probe.h"
> +
> +static const char		prvname[] = "tcp";
> +static const char		modname[] = "vmlinux";
> +
> +enum {
> +	NET_PROBE_OUTBOUND = 0,
> +	NET_PROBE_INBOUND,
> +	NET_PROBE_STATE
> +};
> +
> +static probe_dep_t	probes[] = {
> +	/* does not fire on UEK7 unless rawfbt; no idea why... */
> +	{ "accept-established",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::tcp_init_transfer:entry" },
> +	{ "accept-refused",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v4_send_reset:entry" },
> +	{ "accept-refused",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v6_send_reset:entry" },
> +	{ "connect-established",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_finish_connect:entry" },
> +	{ "connect-refused",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_reset:entry" },
> +	{ "connect-request",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
> +	/* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
> +	{ "connect-request",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_xmit:entry" },
> +	{ "receive",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_rcv_established:entry" },
> +	{ "receive",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_rcv_state_process:entry" },
> +	{ "receive",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_v4_send_reset:entry" },
> +	{ "send",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::ip_queue_xmit:entry" },
> +	/* ip_send_unicast_reply has 10 args so cannot fentry; use rawfbt */
> +	{ "send",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip_send_unicast_reply:entry" },
> +	{ "send",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::ip_build_and_send_pkt" },
> +	/* ip6_xmit has > 6 args so cannot fentry on aarch64; use rawfbt */
> +	{ "send",
> +	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_xmit:entry" },
> +	{ "state-change",
> +	  DTRACE_PROBESPEC_NAME,	"sdt:::inet_sock_set_state" },
> +	{ "state-change",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::tcp_time_wait:entry" },
> +	{ "state-change",
> +	  DTRACE_PROBESPEC_NAME,	"fbt::inet_csk_clone_lock:entry" },
> +	{ NULL, }
> +};
> +
> +static probe_arg_t probe_args[] = {
> +	{ "accept-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "accept-established", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "accept-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "accept-established", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "accept-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "accept-established", 5, { 5, 0, "unsigned char", "int"} },
> +	{ "accept-established", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
> +	{ "accept-established", 7, { 7, 0, "int", "int" } },
> +
> +	{ "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "accept-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "accept-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "accept-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "accept-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "accept-refused", 5, { 5, 0, "unsigned char", "int"} },
> +	{ "accept-refused", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
> +	{ "accept-refused", 7, { 7, 0, "int", "int" } },
> +
> +	{ "connect-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "connect-established", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "connect-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "connect-established", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "connect-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "connect-established", 5, { 5, 0, "unsigned char", "int"} },
> +	{ "connect-established", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
> +	{ "connect-established", 7, { 7, 0, "int", "int" } },
> +
> +	{ "connect-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "connect-refused", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "connect-refused", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "connect-refused", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "connect-refused", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "connect-refused", 5, { 5, 0, "unsigned char", "int"} },
> +	{ "connect-refused", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
> +	{ "connect-refused", 7, { 7, 0, "int", "int" } },
> +
> +	{ "connect-request", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "connect-request", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "connect-request", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
> +	{ "connect-request", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "connect-request", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "connect-request", 5, { 5, 0, "unsigned char", "int"} },
> +	{ "connect-request", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
> +	{ "connect-request", 7, { 7, 0, "int", "int" } },
> +
> +	{ "receive", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "receive", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "receive", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "receive", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "receive", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "receive", 5, { 5, 0, "unsigned char", "int"} },
> +	{ "receive", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
> +	{ "receive", 7, { 7, 0, "int", "int" } },
> +
> +	{ "send", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> +	{ "send", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "send", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
> +	{ "send", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "send", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "send", 5, { 5, 0, "unsigned char", "int"} },
> +	{ "send", 6, { 6, 0, "unsigned char", "tcplsinfo_t *" } },
> +	{ "send", 7, { 7, 0, "int", "int" } },
> +
> +	{ "state-change", 0, { 0, 0, "void *", "void *", } },
> +	{ "state-change", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> +	{ "state-change", 2, { 2, 0, "void *", "void *" } },
> +	{ "state-change", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> +	{ "state-change", 4, { 4, 0, "void *", "void *" } },
> +	{ "state-change", 5, { 5, 0, "void *", "void *" } },
> +	{ "state-change", 6, { 6, 0, "struct sock *", "tcplsinfo_t *" } },
> +	{ "state-change", 7, { 7, 0, "int", "int" } },
> +
> +	{ NULL, }
> +};
> +
> +static const dtrace_pattr_t	pattr = {
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> +{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> +{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> +};
> +
> +/*
> + * Provide all the "tcp" SDT probes.
> + */
> +static int populate(dtrace_hdl_t *dtp)
> +{
> +	return dt_sdt_populate(dtp, prvname, modname, &dt_tcp, &pattr,
> +			       probe_args, probes);
> +}
> +
> +/*
> + * Generate a BPF trampoline for a SDT probe.
> + *
> + * The trampoline function is called when a SDT probe triggers, and it must
> + * satisfy the following prototype:
> + *
> + *	int dt_tcp(void *data)
> + *
> + * The trampoline will populate a dt_dctx_t struct and then call the function
> + * that implements the compiled D clause.  It returns the value that it gets
> + * back from that function.
> + */
> +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> +{
> +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> +	dt_probe_t	*prp = pcb->pcb_probe;
> +	dt_probe_t	*uprp = pcb->pcb_parent_probe;
> +	int		direction, have_iphdr;
> +	int		skarg = 0, skbarg = 1, tcparg = 0;
> +	int		skarg_maybe_null;
> +	int		skstate = 0;
> +
> +	/*
> +	 * We construct the tcp::: probe arguments as
> +	 * follows:
> +	 *      args[0] = skb
> +	 *      args[1] = sk
> +	 *      args[2] = ip_hdr(skb) [if available]
> +	 *      args[3] = sk [struct tcp_sock *]
> +	 *      args[4] = tcp_hdr(skb)
> +	 *      args[5] = sk->sk_state
> +	 *      args[6] = sk->sk_state
> +	 *      args[7] = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0)
> +	 */
> +
> +	if (strcmp(prp->desc->prb, "state-change") == 0) {
> +		int newstatearg;
> +		int skip_state = 0;
> +		int check_proto = IPPROTO_TCP;
> +
> +		/* For pre-6.14 kernels, inet_sock_state_change() to
> +		 * TCP_SYN_RCV is broken in that the cloned socket has
> +		 * not yet copied info of interest like addresses, ports.
> +		 * This is fixed in 6.14 via
> +		 *
> +		 * commit a3a128f611a965fddf8a02dd45716f96e0738e00
> +		 * Author: Eric Dumazet <edumazet@google.com>
> +		 * Date:   Wed Feb 12 13:13:28 2025 +0000
> +		 *
> +		 * inet: consolidate inet_csk_clone_lock()
> +		 *
> +		 * To work around this we trace inet_csk_clone_lock and
> +		 * use the reqsk (arg1) as the means to populate the
> +		 * struct tcpinfo.  We need then to explicitly set the
> +		 * state to TCP_SYN_RCV and also skip the case where
> +		 * inet_sock_set_state() specifies TCP_SYN_RCV otherwise
> +		 * we will get a probe double-firing.
> +		 */
> +		if (strcmp(uprp->desc->fun, "inet_csk_clone_lock") == 0) {
> +			skarg = 1;
> +			newstatearg = 2;
> +			check_proto = 0;
> +			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2),
> +						BPF_TCP_SYN_RECV));
> +		} else if (strcmp(uprp->desc->fun, "tcp_time_wait") == 0) {
> +			skarg = 0;
> +			newstatearg = 1;
> +		} else {
> +			skarg = 0;
> +			newstatearg = 2;
> +			skip_state = BPF_TCP_SYN_RECV;
> +		}
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
> +		/* check it is a TCP socket */
> +		if (check_proto) {
> +			dt_cg_get_member(pcb, "struct sock", BPF_REG_6,
> +					 "sk_protocol");
> +			emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0,
> +						 IPPROTO_TCP, exitlbl));
> +		}
> +		/* save sk */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
> +
> +		/* save new state */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(newstatearg)));
> +		if (skip_state) {
> +			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, skip_state,
> +						 exitlbl));
> +		}
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(6), BPF_REG_6));
> +
> +		/* save sk */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
> +
> +		/* save empty args */
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
> +
> +		/* NET_PROBE_STATE */
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(7),
> +					NET_PROBE_STATE));
> +		return 0;
> +	}
> +
> +	if (strcmp(prp->desc->prb, "accept-established") == 0) {
> +		direction = NET_PROBE_OUTBOUND;
> +		have_iphdr = 1;
> +		/* skb in arg2 not arg1 */
> +		skbarg = 2;
> +		skarg_maybe_null = 0;
> +		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
> +					 BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB,
> +					 exitlbl));
> +	} else if (strcmp(prp->desc->prb, "receive") == 0 ||
> +		   strcmp(prp->desc->prb, "accept-refused") == 0) {
> +		direction = NET_PROBE_INBOUND;
> +		have_iphdr = 1;
> +		if (strcmp(uprp->desc->fun, "tcp_v4_send_reset") == 0 ||
> +		    strcmp(uprp->desc->fun, "tcp_v6_send_reset") == 0)
> +			skarg_maybe_null = 1;
> +		else
> +			skarg_maybe_null = 0;
> +	} else if (strcmp(prp->desc->prb, "connect-established") == 0) {
> +		direction = NET_PROBE_INBOUND;
> +		have_iphdr = 1;
> +		skarg_maybe_null = 0;
> +	} else if (strcmp(prp->desc->prb, "connect-refused") == 0) {
> +		direction = NET_PROBE_INBOUND;
> +		have_iphdr = 1;
> +		skarg_maybe_null = 0;
> +		skstate = BPF_TCP_SYN_SENT;
> +	} else {
> +		direction = NET_PROBE_OUTBOUND;
> +		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
> +			/* NULL sk in arg1 not arg2 (we dont want ctl_sk) */
> +			skarg = 1;
> +			/* skb in arg2 not arg1 */
> +			skbarg = 2;
> +			have_iphdr = 1;
> +			/* tcp hdr in ip_reply_arg * */
> +			tcparg = 6;
> +			skarg_maybe_null = 1;
> +		} else if (strcmp(uprp->desc->fun, "ip_build_and_send_pkt") == 0) {
> +			skarg = 1;
> +			skbarg = 0;
> +			have_iphdr = 0;
> +			skarg_maybe_null = 1;
> +		} else if (strcmp(prp->desc->prb, "connect-request") == 0) {
> +			skstate = BPF_TCP_SYN_SENT;
> +			have_iphdr = 0;
> +			skarg_maybe_null = 0;
> +		} else {
> +			have_iphdr = 0;
> +			skarg_maybe_null = 0;
> +		}
> +	}
> +
> +	/* first save sk to args[3]; this avoids overwriting it when we
> +	 * populate args[0,1] below.
> +	 */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
> +	/* only allow NULL sk for ip_send_unicast_reply() */
> +	if (!skarg_maybe_null)
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
> +
> +	/* then save skb to args[0] */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
> +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> +
> +	/* next save sk to args[1] now that we have skb in args[0] */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
> +
> +	/*
> +	 * ip_hdr(skb) =
> +	 *	skb_network_header(skb)	=	(include/linux/ip.h)
> +	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
> +	 */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
> +	dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> +	if (have_iphdr)
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> +	else
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
> +
> +	if (have_iphdr) {
> +		dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6,
> +				 "network_header");
> +		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> +	}
> +	/*
> +	 * tcp_hdr(skb) =
> +	 *	skb_transport_header(skb) =		(include/linux/ip.h)
> +	 *	skb->head + skb->transport_header	(include/linux/skbuff.h)
> +	 */
> +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
> +	if (tcparg) {
> +		/* struct ip_reply_arg * has a kvec containing the tcp header */
> +		dt_cg_get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +	} else {
> +		dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +		dt_cg_get_member(pcb, "struct sk_buff", BPF_REG_6,
> +				 "transport_header");
> +		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +	}
> +
> +	if (!skarg_maybe_null) {
> +		/* save sk state */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
> +		dt_cg_get_member(pcb, "struct sock_common", BPF_REG_6,
> +				 "skc_state");
> +		/* ensure sk state - if specified - is what we expect */
> +		if (skstate)
> +			emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, skstate,
> +						 exitlbl));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(5), BPF_REG_0));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(6), BPF_REG_0));
> +	}
> +	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(7), direction));
> +
> +	return 0;
> +}
> +
> +dt_provimpl_t	dt_tcp = {
> +	.name		= prvname,
> +	.prog_type	= BPF_PROG_TYPE_UNSPEC,
> +	.populate	= &populate,
> +	.enable		= &dt_sdt_enable,
> +	.load_prog	= &dt_bpf_prog_load,
> +	.trampoline	= &trampoline,
> +	.probe_info	= &dt_sdt_probe_info,
> +	.destroy	= &dt_sdt_destroy,
> +};
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 0c621197..798e67ee 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -41,6 +41,7 @@ const dt_provimpl_t *dt_providers[] = {
>   	&dt_sched,
>   	&dt_sdt,
>   	&dt_syscall,
> +	&dt_tcp,
>   	&dt_uprobe,
>   	&dt_usdt,
>   	NULL
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 59a8d62e..4db89b45 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -87,6 +87,7 @@ extern dt_provimpl_t dt_rawtp;
>   extern dt_provimpl_t dt_sched;
>   extern dt_provimpl_t dt_sdt;
>   extern dt_provimpl_t dt_syscall;
> +extern dt_provimpl_t dt_tcp;
>   extern dt_provimpl_t dt_uprobe;
>   extern dt_provimpl_t dt_usdt;
>   
> diff --git a/libdtrace/ip.d b/libdtrace/ip.d
> index f8b77f12..d59bb436 100644
> --- a/libdtrace/ip.d
> +++ b/libdtrace/ip.d
> @@ -51,7 +51,6 @@ inline int TCP_MIN_HEADER_LENGTH =	20;
>    * to the net namespace (nd_net in struct net_device).
>    */
>   typedef uint64_t	netstackid_t;
> -typedef __be32		ipaddr_t;
>   typedef struct in6_addr	in6_addr_t;
>   
>   /*
> diff --git a/libdtrace/net.d b/libdtrace/net.d
> index 6ac34287..45b5cba3 100644
> --- a/libdtrace/net.d
> +++ b/libdtrace/net.d
> @@ -25,9 +25,13 @@ typedef struct conninfo {
>   	 string ci_protocol;	/* protocol (ipv4, ipv6, etc) */
>   } conninfo_t;
>   
> +typedef __be32 ipaddr_t;
> +
>   /*
>    * We use these values to determine if a probe point is associated
> - * with sending (outbound) or receiving (inbound).
> + * with sending (outbound) or receiving (inbound) or a state-related
> + * probe (i.e. neither in our outbound).
>    */
>   inline int NET_PROBE_OUTBOUND =		0x00;
>   inline int NET_PROBE_INBOUND =		0x01;
> +inline int NET_PROBE_STATE =		0x02;
> diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
> index 54e310cb..d4beea87 100644
> --- a/libdtrace/tcp.d
> +++ b/libdtrace/tcp.d
> @@ -8,7 +8,6 @@
>   #pragma D depends_on module vmlinux
>   #pragma D depends_on library net.d
>   #pragma D depends_on provider ip
> -#pragma D depends_on provider tcp
>   
>   inline int TH_FIN =	0x01;
>   inline int TH_SYN =	0x02;
> @@ -60,7 +59,7 @@ typedef struct tcpinfo {
>   	uint32_t tcp_seq;		/* sequence number */
>   	uint32_t tcp_ack;		/* acknowledgment number */
>   	uint8_t tcp_offset;		/* data offset, in bytes */
> -	uint8_t tcp_flags;		/* flags */
> +	uint16_t tcp_flags;		/* flags */
>   	uint16_t tcp_window;		/* window size */
>   	uint16_t tcp_checksum;		/* checksum */
>   	uint16_t tcp_urgent;		/* urgent data pointer */
> @@ -111,13 +110,16 @@ translator tcpinfo_t < struct tcphdr *T > {
>   	tcp_seq = T ? ntohl(T->seq) : 0;
>   	tcp_ack = T ? ntohl(T->ack_seq) : 0;
>   	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> -	tcp_flags = T ? *(uint8_t *)(T + 13) : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : 0;
>   	tcp_window = T ? ntohs(T->window) : 0;
>   	tcp_checksum = T ? ntohs(T->check) : 0;
>   	tcp_urgent = T ? ntohs(T->urg_ptr) : 0;
>   	tcp_hdr = (uintptr_t)T;
>   };
>   
> +inline int tcp_fullsock[struct tcp_sock *sk] =
> +	(((struct sock_common *)sk)->skc_state != TCP_STATE_SYN_RECEIVED &&
> +	 ((struct sock_common *)sk)->skc_state != TCP_STATE_TIME_WAIT);
>   /*
>    * In the main we simply translate from the "struct [tcp_]sock *" to
>    * a tcpsinfo_t *.  However there are a few exceptions:
> @@ -158,47 +160,45 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>               ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_daddr)[2] &&
>   	    ((uint32_t *)&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr)[3])
>   	    : 0;
> -	tcps_lport = (T && ((struct inet_sock *)T)->inet_sport != 0) ?
> +	tcps_lport = T && ((struct inet_sock *)T)->inet_sport != 0 &&
> +	    tcp_fullsock[T] ?
>   	    ntohs(((struct inet_sock *)T)->inet_sport) :
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
> -	    ntohs(((struct sock *)T)->__sk_common.skc_num) :
> +	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
>   	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -	    ((struct tcphdr *)arg4)->dest : ((struct tcphdr *)arg4)->source) :
> +		  ((struct tcphdr *)arg4)->dest :
> +		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
>   	    ntohs(arg7 == NET_PROBE_INBOUND ?
> -            ((struct tcphdr *)arg4)->source : ((struct tcphdr *)arg4)->dest) :
> +		  ((struct tcphdr *)arg4)->source :
> +		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
>   	tcps_laddr =
>   	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>   	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_rcv_saddr) :
>   	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>   	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_rcv_saddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->daddr : &((struct iphdr *)arg2)->saddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->daddr :
> -	    &((struct ipv6hdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->daddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->daddr) :
>   	    "<unknown>";
>   	tcps_raddr =
>   	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET ?
>   	    inet_ntoa(&((struct sock *)T)->__sk_common.skc_daddr) :
>   	    T && ((struct sock *)T)->__sk_common.skc_family == AF_INET6 ?
>   	    inet_ntoa6(&((struct sock *)T)->__sk_common.skc_v6_daddr) :
> -	    arg2 != NULL && (*(uint8_t *)arg2) >> 4 == 4 ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct iphdr *)arg2)->saddr : &((struct iphdr *)arg2)->daddr) :
> -	    arg2 != NULL && *((uint8_t *)arg2) >> 4 == 6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> -	    &((struct ipv6hdr *)arg2)->saddr :
> -	    &((struct ipv6hdr *)arg2)->daddr) :
> -	    "<unknown>";
> -	tcps_state = arg6;
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 4 ?
> +	    inet_ntoa(&((struct iphdr *)arg2)->saddr) :
> +	    arg2 != NULL && (*(uint8_t *)arg2 >> 4) == 6 ?
> +	    inet_ntoa6(&((struct ipv6hdr *)arg2)->saddr) :
> +	    "<unknown";
> +	tcps_state = arg7 == NET_PROBE_STATE ? arg6 :
> +	    T ? ((struct sock *)T)->__sk_common.skc_state : 0;
>   	tcps_iss = T ?
>   	    T->snd_una - (uint32_t)T->bytes_acked : 0;
>   	tcps_suna = T ? T->snd_una : 0;
> @@ -229,3 +229,9 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = I;
>   };
> +
> +/* For tracepoint, the last state is in the sock state, next passed as arg6 */
> +#pragma D binding "1.6.3" translator
> +translator tcplsinfo_t < struct sock *S > {
> +	tcps_state = S ? S->__sk_common.skc_state : 0;
> +};
