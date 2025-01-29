Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AA37E9
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162627; cv=fail; b=Aada+NknnxPdPJdnWsyT6iL6neDbI8Km5Qqva0kJhnJKjJ/WeVj2dTXnJfaTZZYuGkFE5zOzF85QjU5SBL+qDqgg/ATqxp2Dmfc6FVHEb3e8Am5AuBmc57QJoSHdVWKVggVkdYUhfqeM4rRwcbZI64qFfplnn5x5FEiVmg7pm4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162627; c=relaxed/simple;
	bh=FsbZ4dPnKl0bB2mL6v9QvZIojrrlrGqiO7i9TkC65iw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ELwa7CqhoZxawLYhtF2i41BChnZliZObT/avmARK4sQi06AK0bvk5mBrFbMQj+fAP+QINJ/tJCmu91jXCqhM3nNyMXmdfoUpCSzXVh19ry3BP8dwIXvkYdPt1cuuUUekYILM1yR99b+YOXKxfra2jdT+B3gzz4VPku+6B2bjqLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EtSIoL+w; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ajEZwdvx; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EtSIoL+w";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ajEZwdvx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TEY3Wj011806
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AOpq0iTPRzOw3CxzEwKpy5lNSJvGJrWHi6jYJMPpGfE=; b=
	EtSIoL+wvnD0p3VPHTQZRGj6kbZTE/Usf/ONQAH98Nt0W+g5yVw+KWkGbtiMHmPP
	A3sMLKniF2n0/gQHiw0Zq1jHIwFqGm38dzE5wPo4ce1KrbBYfLUCU6wzf8NGD5dP
	NS18wPiIrMOU543cwv5mviSZ7/3d44wQhaS6Ol23qi5W4TDcarLAW5wMX9k5gHun
	9ah3e+spxehgRe3jT1swlbHZ+nRMY2JlFMchDNHtIAHSDwiaSbWCPuCkw+PdA+lT
	rB8HkaQJHuSKFRoE+/uXao5+u//ZtdmDJB7vQpT8+CDhoMaWnDw0RLVl+ZQf7Y0Z
	tCt0MlSxvo6GZtG68XxChw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fnk9g4na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:57:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TD9ZGP011727
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:57:03 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9j6py-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 14:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWaLJFBqKu8tJEn8FBXvNk+VhKBXOheQ1WreGBW2h89mIUuRl1bUrK9BAFAlfD8VNMX1vA2nme/7byVDbP9KKWl2HV8dX28GaWNga5h5s75ZT6TWgTOZ0TfeW5oVJ9MwEePd4P/Rw+5Js3HTYqSqOs+pK26Neea4CXwIINylKldpVwHWYMi2tKSbYIYVInPzg1qBYc4fqYDJs5WN48bHa12rqFkH57ewca8SsAMqD/NEBQOC4y3OiXMZgXAulRvtZ/bZ5rNqPOIQF2oNQMcupEFBzR9kaAaQ6EJfOwj9C8/1ixSC5qrxRx5R6h57EyKVG56BKnhyj/plDKrqIe7LYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOpq0iTPRzOw3CxzEwKpy5lNSJvGJrWHi6jYJMPpGfE=;
 b=GxNEKxjazhnj5P6yWv1fwm8M4nnwMuufNH/VLAfj0jXVj8VJ9MpZ3yU+pZ1awV3ZJYRik1OwGWNojjnuzo0k6rmDGf/KJ3/nd1vTvx9A99M1DrKzHpW0BDQGig6c6DI4t0vnSHxneiqzP+sgu1GyQlQBk2PEmf3PcW08Pz10AflTGDyia7RB3j1dIJel/bVrGUYLQamZ6ORqoFsSRZXf834vvin1UWxzTPZi3w64B9AXL67ktKy3B83TFZ83g7zLM+vKulHzc6mBUiHSQrMz2P1tPRy8O8ZpkmbH5WrckXUtpWmWZWoqD7wTJBeGjhc61txyUy2xQv1f9b5wXRJJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOpq0iTPRzOw3CxzEwKpy5lNSJvGJrWHi6jYJMPpGfE=;
 b=ajEZwdvxa/VlOFSRSqsoAQmHAZdUGbwuLGLyLihmf8tf6Vq9aM1+MfE0KLQVTo8XUCOc7xz7IccIYm/qyirOsvBTRuPqNCfjYMu12Q5XysLY5zZrQtHX8428gD2qouXJ81k41muzFT+Yu1pSe/xuu2Fy88q8fO8o8S0GEOvVzQw=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SA2PR10MB4604.namprd10.prod.outlook.com (2603:10b6:806:11c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 14:57:01 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%4]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 14:57:00 +0000
Message-ID: <eb8192f5-6b85-4898-8c74-35b3df151ab0@oracle.com>
Date: Wed, 29 Jan 2025 14:56:56 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ELF note-based USDT support
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250129144401.505186-1-alan.maguire@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250129144401.505186-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0532.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::14) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SA2PR10MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: d64f48f8-f898-4c9a-a42f-08dd40752f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODNjbFl0M0Q5ZmkwbTBtWlJDa2M3SHZUTFl6TXVLalZvTjFENU43aU1Rd25P?=
 =?utf-8?B?U3JmY1ZxV1JJZVk1SXhhb3prcXA1MlRDdXlNVEtyK3NWNWt3TXRqZm1IUkpW?=
 =?utf-8?B?Z3FhWURXZ1ZjWUVVajYwV2hXa3ZlTEVWSm5VTWJTZEZrOTZXcDlPOE8wanV2?=
 =?utf-8?B?SlJRVzRwVHZRS0lhUHdNY2pJMlRzUWFDZ20yODhlWG0reHNuWXlGUXZzWlFz?=
 =?utf-8?B?NDFROWozeU5JYkpHRWlrR0ExckpHRmlkODBxc0pMbTM1b2hNWTZkVU1NYnIw?=
 =?utf-8?B?OWxpRFk4VFduQWdrYWM1dDdROFhpY0RDL080YkZuS0pscFZSU213NWdVbWlR?=
 =?utf-8?B?elVUREdOekltMjVSVTB1NlYzTDhLMEh0YlRsaUZvamdRQTR1SW9PT2labGJz?=
 =?utf-8?B?UUxpaE1HN1RFRzluajIzYytua0tqTTU5OVYyejlNdW9JUUwvR0FBalB0Y0pu?=
 =?utf-8?B?WWtQZWlqU1ZlYnFXNVNKVkxzdE5pODllZVErWm9DQWxoYlJGWVBhQkNrNXhX?=
 =?utf-8?B?QVczOERYOUh0V2xCdnpzek5YUUZGV3d4YmVTM2dIYzF4N1RWMUdCSUxZemRE?=
 =?utf-8?B?NDlXMjB3bktjWGVrR0t1RnBwRXhUZmwxOWpzbnlnclNUZktacjdNZ2ZoSE11?=
 =?utf-8?B?TlZqL3M3VnVkVGxoeWROa3d3eUJ4Vkw3bHdGME15OE44UWVSbkI2Y3Bhb3RG?=
 =?utf-8?B?emFrNGVwOGpla3A4QjJwZkQxVzdBRW5mK0lvQmMzdjFSSExBMzd6dVRvK1VS?=
 =?utf-8?B?M2d0Y1hZanJlK04wa1BMUVNleWh5by9XUit3eE5DcjNUczFvdkhvNUc1OUV3?=
 =?utf-8?B?N0Rhb3FhTGVXMjRjS3g2aUQ0cysvVEppQTNWcVNmbVoxWHJsVVRsQWVSQTc2?=
 =?utf-8?B?bVBlN0M0L09rR1RTSEg1Sis5aUpKTzBiN1NLUHZXYjhHZEo3MUxiVEtDY0xB?=
 =?utf-8?B?OWk4dUgySkJVT3p3MlBtZ1FVUlBlU05XVHV2aFpZMVkvOER6cHI3L2trQ2lV?=
 =?utf-8?B?RnByODlUb3IwWXREejQ5b0U1RXNQcmNydk5yVWtXOUxpaUpXL0hqKzdEdjZG?=
 =?utf-8?B?bnBEQVVlOEpTdE1SZVhRd2RySmh4MEE0cFJYblByOE1mR2RCR3VhbnlrdjlQ?=
 =?utf-8?B?ckd3cWVNMEVGdUp4MVdHSll4ODZMc21vd3dZcWhMT3A5NHpIM1Zaa3JDbTBW?=
 =?utf-8?B?eFp5aFpCc2dhMktNQmVEQm5SZ0duYWYxRHBTWGRFQkhKYU4rSVV6Y21qWTdo?=
 =?utf-8?B?dlJmNTBjdlVzcWc3bEhlYUhJUU1ZTkV5aG15TWNLUWRXTTYveDE1Q244anhC?=
 =?utf-8?B?N1dhMGZMeHlXY2o3VVJMKzliYkVBbks4OEZtMDVJaUdjTW1seklPU1JzNjdq?=
 =?utf-8?B?KytLMlk2WnVuRWcyalNSY1hEb2pCY21yTXk2UlZCeUZBSEJIQ2JXSTY3ZUxp?=
 =?utf-8?B?R24rbEpSU2R6NVc0Wlh1MCsyMUhpZk5Yb3JJamtiQWIwUzh1MEIyaXJ2UXV0?=
 =?utf-8?B?VzRZWkhsc1NKcElMRHZXMUZta0lDdXBUazZtaU1UYmczSTFqUThCNFRzQ0Fn?=
 =?utf-8?B?TkpRWFc3TCt2VnA1MURZMVllYlJJM29JQzhiaHJEYSsxMTh5VVNIR1dJSHRl?=
 =?utf-8?B?YlVXL2lCUUE2R1BqZm9yc28vcFBIdGFWSzFRZFdxeERubEJhWGF5QWhQanp5?=
 =?utf-8?B?SStmcEZmTDRIU1dSWTJ1VmZ3Z2lNMG04cXovNjRWRG5lTE5uYVllREszb0wr?=
 =?utf-8?B?RFhTMk00ZFUxRmZSSzZnNThSbUxyNC8rb0paMnkwWXMrRHRCKzNtbTZVWXYv?=
 =?utf-8?B?WlpHb0tSSUNreXVEZGhEQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MURzMVFWdStnMlRFelhRRmk3cytsbW9ENXBxdTFzNHFuS1RPcGZtOHBER1ZO?=
 =?utf-8?B?TGFnbkN4V2pzVnhEeFl1WjJGZm1udjZpc1lnVFFjZ2NyRUh6WUk1cDROTVVS?=
 =?utf-8?B?UGN1TVVuSEFETVJ4UmV4R2kvQTd1eE1ubmlvUlFBL2R3VUlVcFNwN01zWHFZ?=
 =?utf-8?B?TUJ4aDlQSlRxUE1GcEVWS0xFbzUvYTZvamhWSitEdWttcHc2bE5BZDlrV3ZP?=
 =?utf-8?B?d2o4Z0syVlVEaFlBRVI1NC9jZEpHa0YxQ0tXQjYwR0Jla21EcXhyR1lMT09L?=
 =?utf-8?B?VnI5Zm0xMUpUWDRWMlJobzhnTm1qelhJSWY0dDc0UjBtc2NmZ2VXUktqT3dZ?=
 =?utf-8?B?UDE1TzZreE9EVmtNWW9CdzcvZHdEWmY2WXRzVGVNSHQrYnFCK3hlL0tuYXNE?=
 =?utf-8?B?UXpNUG1JNUNzT29sRjVsUEkwc0Z5SDlMRWVqQUtHREdhYnJaQ3lVNXoxb2t2?=
 =?utf-8?B?NXp0VTc2cVpxdE5UWnQzY2xQMGdoRjkrV3NCR25sQ1UzTTAxcWY5a1FjWWJh?=
 =?utf-8?B?di8zY2c2RTB5RVZidFd6WERCMW9qU2VoZUoxQ3RmRTRUdGZGZXRpUmwwYzZr?=
 =?utf-8?B?STlIVG5QYnZuSFV2bVF1M2UyYlFRdkNjdmF4Q0tGeUV4bzlDVnRNUzl4c3h2?=
 =?utf-8?B?OUxHOGt4VlNzRzNJOU9zbjRiUCsrbHc3N3laOTVldEwwNUdiN2lRV21DbXhB?=
 =?utf-8?B?QjJkZ21uYUxrNld4U1d4a1p5ZVNRTkJ1MFArYllHdE5vQ29ORldRSGJBeWlI?=
 =?utf-8?B?UFJjam9TbmlvcDVCdC9aMERMUEZ3RkZxZ3JqZnpITmkxblU0Vi9BUEFPeXRk?=
 =?utf-8?B?bDhDdFJzUHduTzBMZDRYQ1oxK0JvYU9rRlRwbzA2WVVteDRTV3kwdTlBcENh?=
 =?utf-8?B?L1pWeXIxbzNDMlYwc0VnWGdMRDVnYStRTjA5bnY4WUlQUVVpTjRLblQzY2VF?=
 =?utf-8?B?RzV2RWgxQStCS25qdG5pSGt0ZTFSTjBIUnllUlBxNXUySmJBd3Jyb1JFZEEw?=
 =?utf-8?B?eTh2dnlUSHg0cXJGLy9JZFkrRzdiSWk1L0txRnYyNm5PZHJQRy9Ec3lIaXFW?=
 =?utf-8?B?V0VoUnBTcDBOS0Fod1UrenY1WUJ3bUtHeFg2a04vKzVqZjhnblJ6SUV2T0t6?=
 =?utf-8?B?a1NCY2lBZWkrR294Wk5rTjZXeGtXWkY0MTROMnpFTjM2cmRQWU5jMElUbVVm?=
 =?utf-8?B?TlBlRzh0cjRtREZWOGFiVUdkNUJpMitZcDhBaWNyYisyeC96cDI4d0hZMGZz?=
 =?utf-8?B?Mm8wU1VLYk1xdmU1ZXZlamdGcWRQMDVKLytJSXo4RFZKMmk3YVdaRWw5TFIz?=
 =?utf-8?B?S3RaY2ljVnB3dE9hc09CMm13TFJHcSszbkFrYWNJK3lLTUljK21IWklRd0V5?=
 =?utf-8?B?d1k4V0tBVmlNRXBsOCs3S1pTZE9GNTV6bFBmanh5TUpGV2JqS05DUktpekI2?=
 =?utf-8?B?NEZGbkFBVlZXNHVNejNYV0lEMk1pYlhINllEY082ZGlYcUZHTkZpQzhzc0xs?=
 =?utf-8?B?d2VCbmZTNk1yQjlldGFoZmlTQ1g4cmJ5MmFMelBqYzBiQlVKTzk4SERSQTJL?=
 =?utf-8?B?bjBPeFVVL1hIQ0xFVzNFdnh4U2hpbTY2RDlaRFc5ZmNTc1gya3prSHpkNkEy?=
 =?utf-8?B?dnNRSDBLRm5WWlJYTjVVd041Qkt6eGVLTXZPT0RGb3FVdUltdGxNSmpoTm41?=
 =?utf-8?B?NHByeitpTHIyaVo2NzJLcGcwOU5QUlQ1bWNNdFJBeTdGdkdmZ3JlMGxGMTA3?=
 =?utf-8?B?QnpNazZkT0JzRXVna2ZuZG1pbnF3L0RMUFNhU2xaTGFlejJ3OWRuamZlN0N2?=
 =?utf-8?B?WHZQbFNCVmNWeDFoWHJYeTBCNWY3SEZwM2oyanIxL2ZxcC84VEtpYUZKZDBt?=
 =?utf-8?B?Zm8wN3pMRVhkQStCNHJjMTQ1WlROaXc3TzBBVm1ORW9EdlF6d1kwY3g2NkFX?=
 =?utf-8?B?YkRNTVB5ZmdJT0o2QmJ4QzZEWWFwYlJocjgweElybERUb05WZnFBUkVxTHhF?=
 =?utf-8?B?SGRySDFnZHhqbDBzc01BT2YyMzJDbFdQL1JkaDhZSWsyQ2p2Q2V4K2hENm9Q?=
 =?utf-8?B?WHpOaDJrK0UwRC83U3l1N1lSMFpZeWNNTGt2YU9HRkhkK3o4cDFzZEJJbXIx?=
 =?utf-8?B?Nk5qSndhVDZCY0ZteU9nQ0JkM0NNOG5oR3JNWENDR0RBd0ZtdzdZL3U4emFV?=
 =?utf-8?Q?7b114TGRZk1PD9WoTvJ/8oE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G0dqLHDlEwN1TIqz/6KVmxUM3LHd6Ds5iYwINP4swthdws0EOqg2pQx0sbOQ0wz4SwF9x/sMa6H7w9gXcfhUZ9lrktMOy48/VzqHsiqAEYJ1OOyGc0ZiDUg60klsd6OppOd6wc86iBlFgqGysxXty87+3l9WSMVVsxsBrHA0+FNsX14eWbgV2oN/vfI+u719sKnpGTTLH5TXOFaX0QWXgnjGAhQ4Z7Sl0KlFqXNBTapKM8L3HhJPd6TEinwgjB8TjFoyfLFFjwNAmdQ43IoEU35LqCVhCJ8fUYkjyEqoKlJ7fcYekqp+8sTqGAJrFhoQecU5t2rW+BmlIF0oK0haT8ANyHLr06VVLwfpcv21GtinURP/VGaGFX6ejlLxJJDwpfRHwKrgv9qrpwT00/PisL4WWBoZw935i2H1C3CAP3OzV8yuV0AON1PdhCkdmQj83zFPA7FUTigSR+J8i0Lfg3Gykt/LKjnaVZhVVBuePi+IsxH+9s/03gvhI+mdNnxYyAHzE/sGqxr56iyX2xZ6VRDQO5sqZ+e+LXJb3N1x4vSeAVIFp7ObsVhhxKVK7kcS2Q1II40B0vSOePK9y6wr6Rm55LuElzf1uejYW+boz5A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64f48f8-f898-4c9a-a42f-08dd40752f1a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 14:57:00.4911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8CD5Q5Kbft+r+Go5gs36LPxypg+ToUKAbWir7Th66xgPDmP/65Ge+bf52aU+qYKiUlpoIuGOF8uklb3DNpuirg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4604
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290120
X-Proofpoint-ORIG-GUID: KWr8DOee5XFDGr-XbDAqR0hKah386p7T
X-Proofpoint-GUID: KWr8DOee5XFDGr-XbDAqR0hKah386p7T

apologies - changes that should have been in patch 1 were included in
patch 4; I've fixed this and sent a v2 [1]. Thanks!

Alan

[1]
https://lore.kernel.org/dtrace/20250129145522.512341-1-alan.maguire@oracle.com/

On 29/01/2025 14:43, Alan Maguire wrote:
> This series adds support (patch 1) for ELF-note defined USDT
> probes in binaries and libraries; patches 2-4 add tests.
> 
> Basic pid-specific USDT support is added; i.e. it is necessary
> to specify the target pid in the provider name such as
> "example1234" ; future work could add pid wildcarding.
> 
> ELF note defined probes are defined by including sys/sdt.h
> from the systemtap-sdt-devel package, and are defined in
> C programs via
> 
> DTRACE_PROBEn(provider, probe, [args...])
> 
> See the tests for concrete examples.
> 
> For python, go, etc, USDT probes can be added via libstapsdt [1]
> and associated language-specific bindings.  This allows users
> of those languages to add USDT probes too.  For example, the
> following example program adds a "pythonapp" probe "firstProbe"
> using the python-specific libstapsdt binding:
> 
> #!/usr/bin/python3
> from time import sleep
> import stapsdt
> provider = stapsdt.Provider("pythonapp")
> probe = provider.add_probe(
> "firstProbe", stapsdt.ArgTypes.uint64, stapsdt.ArgTypes.int32)
> provider.load()
> while True:
>     print("Firing probe...")
>     if probe.fire("My little probe", 42):
>         print("Probe fired!")
>     sleep(1)
> 
> We can then trace this via dtrace:
> 
> # dtrace -n 'pythonapp503211:::* { printf("args %s, %d\n", copyinstr(arg0), arg1); }' 
> 
> dtrace: description 'pythonapp503211:::* ' matched 1 probe
> CPU     ID                    FUNCTION:NAME
>   6 286628                      :firstProbe args My little probe, 42
> 
> [1] https://github.com/linux-usdt/libstapsdt
> 
> Alan Maguire (4):
>   USDT: support ELF-note-defined probes
>   selftests/usdt: add test for USDT note-defined probe firing, args
>   selftests/usdt: add test for USDT notes in shared library
>   selftests/usdt: add test covering different forms of USDT note args
> 
>  include/dtrace/pid.h                      |  29 ++
>  libdtrace/dt_cg.c                         |  47 ++
>  libdtrace/dt_cg.h                         |   1 +
>  libdtrace/dt_pid.c                        | 466 ++++++++++++++++++++
>  libdtrace/dt_prov_uprobe.c                |  19 +-
>  test/unittest/usdt/sdt_notes.h            | 504 ++++++++++++++++++++++
>  test/unittest/usdt/tst.usdt-notes-args.r  |   2 +
>  test/unittest/usdt/tst.usdt-notes-args.sh |  51 +++
>  test/unittest/usdt/tst.usdt-notes-lib.r   |  14 +
>  test/unittest/usdt/tst.usdt-notes-lib.sh  | 145 +++++++
>  test/unittest/usdt/tst.usdt-notes.r       |  14 +
>  test/unittest/usdt/tst.usdt-notes.sh      | 121 ++++++
>  12 files changed, 1406 insertions(+), 7 deletions(-)
>  create mode 100644 test/unittest/usdt/sdt_notes.h
>  create mode 100644 test/unittest/usdt/tst.usdt-notes-args.r
>  create mode 100755 test/unittest/usdt/tst.usdt-notes-args.sh
>  create mode 100644 test/unittest/usdt/tst.usdt-notes-lib.r
>  create mode 100755 test/unittest/usdt/tst.usdt-notes-lib.sh
>  create mode 100644 test/unittest/usdt/tst.usdt-notes.r
>  create mode 100755 test/unittest/usdt/tst.usdt-notes.sh
> 

