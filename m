Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B741D38550E
	for <dtrace@lists.linux.dev>; Mon,  8 Jun 2026 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780951149; cv=fail; b=qSf8SfeE5gOLRTDEWrLSFceECKv1aYzjEJK19YQLgzHNY2jQRk9dIT/uKXOLuSUOxSmZezAV8NeKJgWt0fVPjlD+SLwrkj2pbCspSDfswd2yws6PBtEh01V3Jt8D/D41Os2PzEl3ka/7V6/ylqqxFevHnoSDleCxQCTy5l2hJFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780951149; c=relaxed/simple;
	bh=YsJqJ4mIfcVSn7LFGT+ZVF+C87HhlpqtqpqkmAjClkY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ijepkTGjGS7n6eOseS4Yaa564wgSJoLV7hbRkmxg4BeYeKd4/aGjWYmthkxxnrwwxM1WUqDhDmsHH5XnvLXoFICjq/JppmDqNoLgdY4xSv0qDQNdABBM+XFONPlokn8jaYEhfnpEAUTxCvhGiUgGAxyf9V0P1Y8IiZb0tKYVWrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ayyMDrcC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kYureC7i; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ayyMDrcC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kYureC7i"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658HSWQm1690252;
	Mon, 8 Jun 2026 20:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eH01TRWeWQEY2YrjQ6GQv2JnmopDmpuLlgEBIXUmI6I=; b=
	ayyMDrcCrjP4K+hd1gdyk+YFSC6iLVnfXnUryKcJ7Bcmn8N1hC+6StXMzCEICl7o
	kgnWFwMx2u0JqSFzBVOnxd09hWBWYd97eFVR9WA5lMpCcEB68m1XLbw+q0U4E/UZ
	+ByjtH3DTETraPCsve5S72K/F0j5EI0vdL4HMis50mTaOgz4i6PVzz+hbuqKat88
	GYFYQQM2BfFvOzmuxCNfV7UfAkd06t22PDKKcr4cxT4HfDsgcLTKIu0PgHtkl43J
	3m+ZakQesObF3CS0roWbLRxvy2tLYq8LBY0lyUUaYqx2kZCN9fkSbK531xDpbxMh
	LHRLrjJ5VRmcJGotG593TA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4emab4k8vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 20:39:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 658Kcapo018618;
	Mon, 8 Jun 2026 20:39:04 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0p9gc5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 20:39:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRw1RaEf8TZ4YYK0tERgxa/zV4gOE4vJqBfNl1hkrnykXLRyjbBOS+hf35X8Pp+x1v5Vgja1udQzVAlMhpY9BLkjhl41dNzCMUKc0pVgpxBgE5DlcoSOl8HLula/61hQKxZIYpbuJT6eInBA3/1oDGvh4R4Ri7y1TADSMJ8H1LeuAE1PcP89HpRfqaSfvyiFpBjiTSDFWFCVF4Ve6vmzkkG/KErOBT2SOViV8qwZdP/PuWx5EnUGiQl3WifUU4310BEyUozhmLyuFN3zlls3FFv8kAji79cX5hyjfYoidJYvCBgL1kzOVV98Nj1Lg8mBIRlyFfh0sxdrORdf/ZLePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eH01TRWeWQEY2YrjQ6GQv2JnmopDmpuLlgEBIXUmI6I=;
 b=VcLRM66vtu77o6LeLn1HrmZWT3rPFtva24DJR/tRViNMw7p5X/4BuAMvvpiy/vQu0EQu1mlIvXFmlHGb+Km2MGziU/JYB9wOeX3K0D0xrNtSEni0ne3Mh7W90V0boBCgB2fKbh8GUDkbLm+lL2XJ3pmK5yrVvI61acr/8qeG58AN1cFELSpKPdVnfTXXmhhsQ8fxyqPwHMmO/lhsRfRnaNornK7A1mvZxC5lVLSn/LsSF1eomoWL3xsvR+Xu4hKvtE6TWOpFjylATGEbyjmhDfkHPUuRupVZGgxbZzQpHS9l5/1W/VYc2dbzhE5e1/zFkEhFoFinSxbaYTDP95PqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH01TRWeWQEY2YrjQ6GQv2JnmopDmpuLlgEBIXUmI6I=;
 b=kYureC7ioHm39U112zzdHsXfsHeFKYjlMdzZ/3OCAXYTMOiCpZvmQILmXjbX1L+O4kzWLy5naTKgedAMKfrthWDNXyIwDj9wEMncL325qT3gxCLlRw6COSSlIFjNzpN0joG3uZmIgvoUQhsk3jTS1Osgd06Eztr+mXmxwi0dmzU=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by SJ5PPF2740EE012.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::795) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 20:38:57 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%3]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 20:38:57 +0000
Message-ID: <e8a1fcd4-1823-43b8-8df4-5188ed0a7dc0@oracle.com>
Date: Mon, 8 Jun 2026 21:38:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 4/6] dtrace: Add uresolve(symbol_name[,
 optional_fallback]) for symbol lookup
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, OpenAI Codex <codex@openai.com>,
        dtrace-devel@oss.oracle.com
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-5-alan.maguire@oracle.com>
 <aiNzBHzLAk45BqeS@oracle.com>
 <e5411146-fb52-4ff1-8660-3ed5ae561149@oracle.com>
 <aiclmi7vWR5IhX4a@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aiclmi7vWR5IhX4a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|SJ5PPF2740EE012:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdcbbc5-988d-4bc3-f9fe-08dec59df63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|4143699003|56012099006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	QIyKcHd2t0fyMCABl3gID3KfaIrzarmiPPHpA4zjhmrMWGWpIAtKNiIumKR4MXtDb2SrIDsBHBHFWBdnV6TfNV82QBbkqwyIsvvyPQ/tvLULZLeT++0n5LxCQq4g+rBEpUc9RZqmKNhp2J67hBu8uitX7AzYNMn6rsh1c5CZoBN2jH/+ZIYMgG6/q63VlO8E8RhDmtVwXAt9gi+JDBnkdMGjNQiOMCUbSTt3mpiSFdyF5c/HSg5uJO6RU8wdwJIMH27zQ6biXa+W+Q2lZ8fvyUt7tycJDoKpmuxG1qxiuT5h5xEcwN2OsfO7Uyfxy2vmHmMox8xlSt97cKI6vRzIfmzFrP9dh0wBt4+LeCksjNehLvdWAYX5Wz1kE8sorvcRZpMj3Y/x1WD316TCGPv4EY7cBzCdBGj2b8vrequV6C+3hfVjB3nUOOsYB3MILU922t8jyCIr7Iiu9BEm1/pLTDcY+vitvTjWdLpSDfCf1d1lQssptAtb4mHGJ5UOcIitBBum7gR94IKvDf80OF4VVR2DyaCbKsUs0OXg2NO5YpeBK3U3jDVjtQyl8u6VxerH2CLYIfhXngGvq4l2lJ1W216DOJNTC1r1mGQ0uBiIdlnUqW/1Thk2xvzDGZOoa4n8THkLx06vpupXn4LBiXHxGveNVXGnXUgJM0UN9x4S+ZS7cqkkEQCt/UiBFvT9k+0K
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXRqeXhnODJGbWpwc0Y3b2h6OEUzamYwUUdnbnRPZVJVWng1THVMREl5ZnpP?=
 =?utf-8?B?RjFxMDlhejdjZHg1QXZhUUFyRGV4TDlWSlNxSHNYQ1EyVmV2Yk9zR0Joa3Qz?=
 =?utf-8?B?MG9BdGlVVThubnh4UTJRZm00cFJXTTdpNHlHWFYvOEk0RjJ0ek8zN29hMTQy?=
 =?utf-8?B?Q29vK3l3N0pGMXBSUGJCekd1YzFsRmdkRFZGbmVRNlVzdTBkYmV2d056d3lD?=
 =?utf-8?B?SUY0Yk1yNjJsMHVDSEJqRGN6cUlGWjZtaG5YVmVrcFdFN21lN3AzdWhaZU5I?=
 =?utf-8?B?WWNsOFFmTHBJa3drZ2d2SzlTOGVDSUx0MzQxMzFsK016WE5iNFZIUUtzUDh6?=
 =?utf-8?B?RFEvWWxNSWpSYzZpVVV4NFB0NUJEQVBWZ01pZ2J0UktjQmg3Si9HYk5BMHl0?=
 =?utf-8?B?OGg2SHNTQ2xQRU1icm1EMU5ZTDdiUUpIWXpsbkVXRkRrMHJuUXAwQmRwUUha?=
 =?utf-8?B?NlNLa0gxVCtBRjR1czBvL1NBc2ZZK29jRkZVenpKNkIzbTEvemtINzUrTHdX?=
 =?utf-8?B?Zm9mdnJiL0poaGZmb2NEcXc0QmpIOUlKMW1vV1Y2WXlKcFJ4eG9hMGZYcndk?=
 =?utf-8?B?QWV2N0E2bHBvbk5Ib1cwYllDckM2Q1NTRzRqZzZaM0ZvY2VNT2lDaGtmRjBl?=
 =?utf-8?B?enFlMUlKbDBZM3ZTaVMxYnNsdklFRS91R3ZSSDArY0x0OStxTmdKVG9oZGNv?=
 =?utf-8?B?TjdmZys2djJhQ2orSGZkWk9NNWs4T3FJaTBMeWl1bjIvR3lOVG9rVS80QmMr?=
 =?utf-8?B?M0dVRDI5eXFUcjRDMitTZHYvaGUvYXBQdFMvN2xObUs5VWJIN3UzTUpXSHlM?=
 =?utf-8?B?cERXWVFWS1ZFWVdNcnA5Um5wQ3R2SVo0UzE3aHVtZWtJcUF3WG5rbnJGNW5H?=
 =?utf-8?B?QXpVbmlwdlJpUUVOcWZlSVhReXNSbXZCRm9vUEVtcHllVDkxbUFiMTFZVmdp?=
 =?utf-8?B?NkhIakRuOFFJMkNLbFpQWWhTVGFMUGU4b29lTTVYZVUzdnJlT3JhektPdjV4?=
 =?utf-8?B?dmtzNXUyVVZ5WGwvdEdxbXQ1Si91c2dzK0dHQkNWam80MTFITEs1VXJmVHZG?=
 =?utf-8?B?V0RXN29rUlZiOU1OOXZFSHdzRE5Ra3lGRUFzS05uZ3RZTGkvbnFEUlk4SVRU?=
 =?utf-8?B?b0ZocU9KQWNXL3FWanZ4blBBamFaTUE2UERDWWY3K0RFZDZSdHA5cXhmSUh0?=
 =?utf-8?B?K09nYi9iTDlWVU9DaUVrM1EwbzQ4cVB5RDlyVkNaaHNzUmJUUGp2UWNQM3BO?=
 =?utf-8?B?QW92ZHpQdThNdG9WNG14UWx2U0FVamNvL2h5OGVtRFBBWGNJa09palUrUngv?=
 =?utf-8?B?REhORVJiUitjYkJqRGpxRURsdjViOGtXTExNRENLeUdwMUtXOWFwVTI1VnQy?=
 =?utf-8?B?SEFWTFBDNkdZOEFBL2M1L3FMcjR5L2xkc2c0Zi9GYXhpK2d3bXBFd2hJZy94?=
 =?utf-8?B?eGNWNlFxUFZYM1FKc2YxQVN0UE9vN2oxaXdYS0FkYndINmFtb001YWdqTGpH?=
 =?utf-8?B?YXNPbkRtYUtncERDLzZoeWEvRlNOTXR3cy9aVTc2Qit1aDlmK0dMcmxNejdi?=
 =?utf-8?B?M1gwWWpFVXh2NGk0ODNSa3ZjUmlKMHlReXVFckxxYU00UlBpWE1FSURCb1VS?=
 =?utf-8?B?dlRaWngrZElnSkRBcDkrN2FLNWdXd1IzZHRrekQvY0NaQmFPcVRkMC8yZ21T?=
 =?utf-8?B?dGhHY0JQV2ttWXRrOHNnMmFhRGpVaHdRUFIwbVFiSVRHNkxpR09ZZUxWWVdP?=
 =?utf-8?B?MmdsWm15TXBQd3JQdjJyUjNqUCtlcXp1dUQ1YVAySFZVbXZ3MnYzSEROTTBu?=
 =?utf-8?B?VUdVZDlRWGNwR3RqdDJYamYyU3pZU1hyc2ZQQjhocmhQdDlqbkl5YXU2bjlT?=
 =?utf-8?B?RzhqRThWVEhZRUxUb1FJNmZaTEVsNEZpSjh1dTdXSDg3Sjl5OEpmMUNSOCtH?=
 =?utf-8?B?eldRSzgwQ1VtR0VlWVo2WmVZRWszc1JhYUl3eEIzUW0yWEx5MlI4d2cwZVkx?=
 =?utf-8?B?QkRJUjNVb3pYUTlncTlzOWVJYWx1RDZ2Vkp5Z0FONzVzcUNhWS9BMmxsZEFt?=
 =?utf-8?B?cm0zMkd4ckFBVDVGQnVqSXZWY3FpeDR5YWgxSXE1d1pXK1JpZ1JDTlZrZUZx?=
 =?utf-8?B?UzdHZG0wblJvdG9jTXFJTXMyOTBnU3pvSGowcDZZRWNRejJiZkxsUHp1bDhL?=
 =?utf-8?B?ZS8rUmtJbjA4amRHUVd5VXZEckhaVU9ncDBDdlNVa0NIVURxRXBESzkvVFZv?=
 =?utf-8?B?dHZ2OWcwS1FGTVA0RWkwNVVFMzBhWWNHN0JXL1oyZE4zeU1VeW16SmgwUUJa?=
 =?utf-8?B?T05iblNqeW1MTXgxM2RwVXd2b0VlQlgyL0tkdXpWaTV5VXNESHB4QT09?=
X-Exchange-RoutingPolicyChecked:
	HXl9XUxhxXa+GN+iW7ldEUQPIXT3dsLexxWlPt3OXtz6PsdKjlRo4jc4uGfg2CXgIc7ZP2GfIwYX4GzRAY0iZRZUeesXHxKw/zOmiYt7rClsN1c+7EG0jqUHx96I32bPTI2AN0TmMIeMv0ySwPiGU9loQ6H9Tp42eboLfXe8N2xNqL/PEDA/1cgcjE/3WA8zHRCH+bkS+HbXtmnnZ6cBFsrZpEkOGK+WE5ACcPkARBgeFiYpoAyfc8eOGGS0EVpU9nBDsJPbw7HK4Gra7x5FHHJmCjzIsT9n0fqL+jjTnCsLyCTQKKjKuAoiU1uw+1MdRHoSn5Z9NEkVq1THaWH1UA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QHxnbsGJWxlP2zyKfiydNa7r6IIHZW7dgq35y3jQRsBY5SE6dHEMFoeLgSP90L53UOhONAbIM1cQAvqXKQp/owJ2sqO1NDFcHf/Cu6Sswzvclj8/JR2Rms+9sj3nkcl7Rhi0+C+/OIt/PQjK/J+sU/qSjFCjq1umrE88H9bxtQPiai8cMcxdsmtmicXVAzcN5mHnuNDcO4jHerBZfCI0DRNDxXlBYtGsbv8p8oag0uPpT6IQaIJWQTlU06GEkJoheAqufmXkrcWpt02J9fdVjvVs/xcJcoNcpjVgpBlnVrbvJwMzV1FLWFIpZ71l8ZQwUD+01LS8ztXuOzoPF/JriqbFdrGd7rE1G9osQq4PGm2JOscZ5NPwwgWfoCnC/+cjOsYLmPg30QauHk2rWll2VAFSRZBePTCymG2MsBgIfF0LogP0Rk11/01xaXa/e3vo2WbmzuiZJGon3W2qgA9vV1LMJFxT24wbHUw60V4OoOYDcbgEaQbLS+5KnEx92BqTzg8Exbnwd49nwPy/sCWX593SsMNxgfhEWMxG+UFpxIQPalpGBT5LLkQHbUR+yNBvr6ylQnkAwfynYFhh6vwTgqpQ/dcAkrO5ZCpzwVr6C2o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdcbbc5-988d-4bc3-f9fe-08dec59df63c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 20:38:57.1468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCXbXJUnkHBo+16OiX8xEGarwCNaJMjRo/855z7b0nymkURsDTRzJlr6ScxGluSaErCwIXPxeCc2hsW2xu4qRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2740EE012
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606080187
X-Authority-Analysis: v=2.4 cv=cL/QdFeN c=1 sm=1 tr=0 ts=6a272869 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=LG5T7v2SAAAA:8 a=dKNLZ-sVzW6vWp3NLCcA:9 a=VeWe3YRKdqvOQKJ6:21
 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12313
X-Proofpoint-GUID: uobVwSMhakAWdR6oRD1Nv5HiWnwwz77A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE4NyBTYWx0ZWRfX50M1ZlhVt8WT
 HNfGm9+HZzfO3V0NZ1A4I0YoqZpO2689Zlsibd3gzPUS8QpLGgSs0pbNXdL1qeK8iU+TDolc4vC
 cf72SZJWwDHTnlOCJ7Z++TivKk7U1TbNJJHwjW1lKqoAElWpTGzAJ/BgpPQmcolxis9BLlGhyy+
 ogy3YMKrv73jxtXE9NLtF5/FnoE22nuq+N4ZWCJbe1amqudT0dbpoezCrPUPyPflDTImyYWJUDw
 n4FY4lW+fW8YAwUzZPVm5wDbw00R/3cwa6kWOnmPpBfQPMVwPyjvQKukVhwUe9EYQ/Lag1a4hEZ
 g1BhUK6R8cFQDGzBT56ctfr50o1CTawZFbXRLGZa6AJalJLHc38sbW49f1BJdxBE+uIe5NOPFqL
 I2e1+bayRFaU5sp3uTuonySlyOFZl7y9rL1xUr7ofqulEWhMYJXEgUngj3RdGvftgdRZlQ+KtNX
 UZM+jcGUEERo5LDZnTw6DIhSvblH4FIZ0LN5ZvY8=
X-Proofpoint-ORIG-GUID: uobVwSMhakAWdR6oRD1Nv5HiWnwwz77A

On 08/06/2026 21:27, Kris Van Hees wrote:
> On Mon, Jun 08, 2026 at 11:43:47AM +0100, Alan Maguire wrote:
>> On 06/06/2026 02:08, Kris Van Hees wrote:
>>> A few initial comments:
>>>
>>> - How is this different from what ``symbol or object``symbol would provide?
>>>   (Yes, as far as I know it never got fully implemented but I think this might
>>>    be similar to what you are doing, and perhaps it would be better to use the
>>>    already documented syntax, and actually implement it more fully.)
>>>
>>
>> this is a good idea; I've rebuilt using the existing `` syntax, and it works
>> well.  My only reservation was losing the fallback behaviour that uresolve() provided;
>> however I've implemented that with an option -xuresolvefail=zero which zeros out the 
>> results of address resolution to allow scripts to handle missing symbols.
> 
> Hm, but the <module>``<symbol> resolving is done at compile time, so there
> should be no need to have a fallback - if the symbol cannot be resolved, then
> the script shouldn't be able to work.  This is similar to how kernel symbols
> that do not exist cause <module>`<symbol> to fail to resolve and thus the
> script won't compile.
> 
> Why would you end up trying to use a script using a userspace symbol without
> knowing whether the symbol exists?  
> 

Because in some cases (like libpython) the variables of interest change over
time from version to version. Having a way to handle multiple versions allows
us to create more portable scripts that are less tied to a specific version
and can behave differently based on presence/absence of variables.

>> One other change below relating to your next question..
>>  
>>> - I think it is problematic that the cg code is making calls to a function in
>>>   a particular provider.  THe architecture has been quite careful at avoiding
>>>   breaking through that boundary.  I'm still digging a bit more through the
>>>   code to determine exactly why that call is truly needed - it should not be
>>>   necessary as far as I can see.
>>>
>>
>> We can fix that as well; it is reasonable to expect in systemwide probe context
>> that a user qualify their symbol with the object (with the proviso that we
>> support path expansion as we do for the probemod). This requires a few minor
>> lexical changes to support filenames with "." in them, but it makes sense and
>> avoids us having to make inferences from the probe context. So in other words
>> to retrieve a global variable from libpython during systemwide probing we'd have
> 
> Yes, the module name needs to allow for . characters, per the module naming
> rules in DTrace.
> 
>> python*:libpython3.6m.so::function-entry
>> {
>> 	this->cur = copyin((uintptr_t)&libpython3.6m.so``_PyThreadState_Current, sizeof(void *));
>> 	..
>> }
>>
>>> Resolution of a userspace symbol should essentially be a simple matter of:
>>>
>>> 	object-base-addr + symbol-offset
>>>
>>> where the object is a particular mapping within the address space of the
>>> current user process.
>>>
>>> On Fri, Jun 05, 2026 at 11:12:15PM +0100, Alan Maguire via DTrace-devel wrote:
>>>> Add uresolve(symbol[, fallback]) to resolve user-space symbols from D
>>>> scripts.  uresolve() resolves a symbol to an object-relative offset at
>>>> compile time, then computes the process-specific runtime address at probe
>>>> fire time as:
>>>>
>>>>     current uprobe IP - probe offset + symbol offset
>>>>
>>>> For pid$target probes, use the target process and its /proc/<pid>/maps state
>>>> to find the symbol and translate it to the same object-relative coordinate
>>>> used by uprobes.  For system-wide uprobes, resolve the offset from the probed
>>>> object file.  In both cases, address generation is shared and remains dynamic;
>>>> the presence of a target process does not bake in an absolute address.
>>>>
>>>> Use bpf_get_func_ip() when available so system-wide uprobes use the actual
>>>> probed instruction address rather than a saved pt_regs IP that may contain
>>>> the resume address.  Retain the saved-IP path as a fallback.
>>>>
>>>> This allows scripts to locate process-local data such as
>>>> _PyThreadState_Current across ASLR and across system-wide probes firing in
>>>> different processes.  The optional fallback argument is returned when the
>>>> symbol cannot be resolved; without it, resolution failure remains a
>>>> compile-time error.
>>>>
>>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>>>> Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
>>>> ---
>>>>  include/dtrace/dif_defines.h |   3 +-
>>>>  libdtrace/dt_bpf.c           |   1 +
>>>>  libdtrace/dt_cg.c            | 456 +++++++++++++++++++++++++++++++++++
>>>>  libdtrace/dt_open.c          |   2 +
>>>>  libdtrace/dt_probe.h         |   1 +
>>>>  libdtrace/dt_prov_uprobe.c   |  58 ++++-
>>>>  6 files changed, 516 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
>>>> index edb98f06..63b8c293 100644
>>>> --- a/include/dtrace/dif_defines.h
>>>> +++ b/include/dtrace/dif_defines.h
>>>> @@ -213,8 +213,9 @@
>>>>  #define DIF_SUBR_LINK_NTOP		45
>>>>  #define DIF_SUBR_STACK			46
>>>>  #define DIF_SUBR_USTACK			47
>>>> +#define DIF_SUBR_URESOLVE		48
>>>>  
>>>> -#define DIF_SUBR_MAX			47
>>>> +#define DIF_SUBR_MAX			48
>>>>  
>>>>  typedef uint32_t	dif_instr_t;
>>>>  
>>>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
>>>> index 146a66e3..aecd71d9 100644
>>>> --- a/libdtrace/dt_bpf.c
>>>> +++ b/libdtrace/dt_bpf.c
>>>> @@ -470,6 +470,7 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
>>>>  	BPF_HELPER_MAP(probe_read_user_str, probe_read_str);
>>>>  	BPF_HELPER_MAP(probe_read_kernel, probe_read);
>>>>  	BPF_HELPER_MAP(probe_read_kernel_str, probe_read_str);
>>>> +	BPF_HELPER_MAP(get_func_ip, unspec);
>>>>  	BPF_HELPER_MAP(get_current_task_btf, unspec);
>>>>  	BPF_HELPER_MAP(task_pt_regs, unspec);
>>>>  #undef BPF_HELPER_MAP
>>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>>>> index 1bd73e11..16c58e35 100644
>>>> --- a/libdtrace/dt_cg.c
>>>> +++ b/libdtrace/dt_cg.c
>>>> @@ -11,6 +11,9 @@
>>>>  #include <setjmp.h>
>>>>  #include <assert.h>
>>>>  #include <errno.h>
>>>> +#include <ctype.h>
>>>> +#include <fcntl.h>
>>>> +#include <unistd.h>
>>>>  
>>>>  #include <sys/socket.h>			/* needed for if_arp.h on OL7/x86 */
>>>>  #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
>>>> @@ -6988,6 +6991,458 @@ dt_cg_subr_link_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>>>>  	dt_regset_free(drp, type->dn_reg);
>>>>  }
>>>>  
>>>> +static const char *
>>>> +dt_cg_basename(const char *path)
>>>> +{
>>>> +	const char	*p;
>>>> +
>>>> +	p = strrchr(path, '/');
>>>> +	return p != NULL ? p + 1 : path;
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_parse_objname(const char *mod, Lmid_t *lmidp, const char **objp)
>>>> +{
>>>> +	char	*end;
>>>> +
>>>> +	if (mod == NULL || mod[0] == '\0' || strisglob(mod))
>>>> +		return -1;
>>>> +
>>>> +	if (strncmp(mod, "LM", 2) == 0 && isdigit((unsigned char)mod[2])) {
>>>> +		*lmidp = strtoul(mod + 2, &end, 16);
>>>> +		if (*end != '`' || end[1] == '\0' || strchr(end + 1, '`'))
>>>> +			return -1;
>>>> +
>>>> +		*objp = end + 1;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	*lmidp = PR_LMID_EVERY;
>>>> +	*objp = mod;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_probe_objname(const dt_probe_t *prp, Lmid_t *lmidp, const char **objp)
>>>> +{
>>>> +	if (prp == NULL || prp->desc == NULL)
>>>> +		return -1;
>>>> +
>>>> +	return dt_cg_parse_objname(prp->desc->mod, lmidp, objp);
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_obj_matches_path(const char *obj, const char *path)
>>>> +{
>>>> +	const char	*base;
>>>> +	Lmid_t		lmid;
>>>> +
>>>> +	if (obj == NULL || path == NULL)
>>>> +		return 0;
>>>> +
>>>> +	if (dt_cg_parse_objname(obj, &lmid, &obj) == -1)
>>>> +		return 0;
>>>> +
>>>> +	base = dt_cg_basename(path);
>>>> +	return strcmp(obj, path) == 0 || strcmp(obj, base) == 0;
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_elf_sym_to_offset(Elf *elf, const GElf_Sym *sym, uint64_t *offp)
>>>> +{
>>>> +	GElf_Ehdr	ehdr;
>>>> +	size_t		i, phnum;
>>>> +	uint64_t	base = 0;
>>>> +
>>>> +	if (sym->st_shndx == SHN_UNDEF ||
>>>> +	    gelf_getehdr(elf, &ehdr) == NULL ||
>>>> +	    elf_getphdrnum(elf, &phnum) != 0)
>>>> +		return -1;
>>>> +
>>>> +	/*
>>>> +	 * Match the object-relative coordinate used by uprobe offsets.  For
>>>> +	 * ET_DYN, libproc computes file_dyn_base from the first PT_LOAD
>>>> +	 * segment's page offset.  For ET_EXEC, the load bias is zero and the
>>>> +	 * first segment's vaddr remains part of the object-relative offset.
>>>> +	 */
>>>> +	for (i = 0; i < phnum; i++) {
>>>> +		GElf_Phdr	phdr;
>>>> +
>>>> +		if (gelf_getphdr(elf, i, &phdr) == NULL ||
>>>> +		    phdr.p_type != PT_LOAD)
>>>> +			continue;
>>>> +
>>>> +		if (ehdr.e_type == ET_EXEC)
>>>> +			base = phdr.p_vaddr;
>>>> +		else if (ehdr.e_type == ET_DYN && phdr.p_align != 0)
>>>> +			base = phdr.p_vaddr & (phdr.p_align - 1);
>>>> +
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	if (i == phnum || sym->st_value < base)
>>>> +		return -1;
>>>> +
>>>> +	*offp = sym->st_value - base;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_elf_lookup_symtab(Elf *elf, int type, const char *name, GElf_Sym *symp)
>>>> +{
>>>> +	Elf_Scn		*scn = NULL;
>>>> +
>>>> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
>>>> +		GElf_Shdr	shdr;
>>>> +		Elf_Data	*data;
>>>> +		size_t		i, nsyms;
>>>> +
>>>> +		if (gelf_getshdr(scn, &shdr) == NULL ||
>>>> +		    shdr.sh_type != type ||
>>>> +		    shdr.sh_entsize == 0)
>>>> +			continue;
>>>> +
>>>> +		data = elf_getdata(scn, NULL);
>>>> +		if (data == NULL)
>>>> +			continue;
>>>> +
>>>> +		nsyms = shdr.sh_size / shdr.sh_entsize;
>>>> +		for (i = 0; i < nsyms; i++) {
>>>> +			GElf_Sym	sym;
>>>> +			const char	*s;
>>>> +			uchar_t		stype;
>>>> +
>>>> +			if (gelf_getsym(data, i, &sym) == NULL ||
>>>> +			    sym.st_name == 0 ||
>>>> +			    sym.st_shndx == SHN_UNDEF)
>>>> +				continue;
>>>> +
>>>> +			stype = GELF_ST_TYPE(sym.st_info);
>>>> +			if (stype == STT_FILE || stype == STT_SECTION)
>>>> +				continue;
>>>> +
>>>> +			s = elf_strptr(elf, shdr.sh_link, sym.st_name);
>>>> +			if (s != NULL && strcmp(s, name) == 0) {
>>>> +				*symp = sym;
>>>> +				return 0;
>>>> +			}
>>>> +		}
>>>> +	}
>>>> +
>>>> +	return -1;
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_elf_lookup_offset(const char *path, const char *name, uint64_t *offp)
>>>> +{
>>>> +	GElf_Sym	sym;
>>>> +	Elf		*elf = NULL;
>>>> +	int		fd, rc = -1;
>>>> +
>>>> +	fd = open(path, O_RDONLY);
>>>> +	if (fd < 0)
>>>> +		return -1;
>>>> +
>>>> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
>>>> +	if (elf == NULL || elf_kind(elf) != ELF_K_ELF)
>>>> +		goto out;
>>>> +
>>>> +	if (dt_cg_elf_lookup_symtab(elf, SHT_SYMTAB, name, &sym) == -1 &&
>>>> +	    dt_cg_elf_lookup_symtab(elf, SHT_DYNSYM, name, &sym) == -1)
>>>> +		goto out;
>>>> +
>>>> +	rc = dt_cg_elf_sym_to_offset(elf, &sym, offp);
>>>> +
>>>> +out:
>>>> +	if (elf != NULL)
>>>> +		elf_end(elf);
>>>> +	close(fd);
>>>> +	return rc;
>>>> +}
>>>> +
>>>> +typedef struct dt_cg_uresolve_arg {
>>>> +	const char	*name;
>>>> +	const char	*obj;
>>>> +	int		explicit_obj;
>>>> +	int		nmatches;
>>>> +	int		no_path;
>>>> +	int		no_symbol;
>>>> +	int		bad_object;
>>>> +	int		different_offset;
>>>> +	uint64_t	off;
>>>> +} dt_cg_uresolve_arg_t;
>>>> +
>>>> +static int
>>>> +dt_cg_uresolve_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg)
>>>> +{
>>>> +	dt_cg_uresolve_arg_t	*uap = arg;
>>>> +	const char		*path;
>>>> +	uint64_t		off;
>>>> +
>>>> +	path = dt_probe_uprobe_path(prp);
>>>> +	if (path == NULL) {
>>>> +		uap->no_path = 1;
>>>> +		return 1;
>>>> +	}
>>>> +
>>>> +	if (uap->explicit_obj && !dt_cg_obj_matches_path(uap->obj, path)) {
>>>> +		uap->bad_object = 1;
>>>> +		return 1;
>>>> +	}
>>>> +
>>>> +	if (dt_cg_elf_lookup_offset(path, uap->name, &off) != 0) {
>>>> +		uap->no_symbol = 1;
>>>> +		return 1;
>>>> +	}
>>>> +
>>>> +	if (uap->nmatches++ == 0) {
>>>> +		uap->off = off;
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	if (uap->off != off) {
>>>> +		uap->different_offset = 1;
>>>> +		return 1;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_uresolve_from_probe_file(dt_node_t *dnp, dt_node_t *arg,
>>>> +			       const char *name, const char *obj,
>>>> +			       int explicit_obj, int allow_fallback,
>>>> +			       uint64_t *offp)
>>>> +{
>>>> +	dt_cg_uresolve_arg_t	uarg = { 0 };
>>>> +	dtrace_hdl_t		*dtp = yypcb->pcb_hdl;
>>>> +
>>>> +	uarg.name = name;
>>>> +	uarg.obj = obj;
>>>> +	uarg.explicit_obj = explicit_obj;
>>>> +
>>>> +	if (yypcb->pcb_pdesc != NULL)
>>>> +		dt_probe_iter(dtp, yypcb->pcb_pdesc, dt_cg_uresolve_probe,
>>>> +			      NULL, &uarg);
>>>> +	else if (yypcb->pcb_probe != NULL)
>>>> +		dt_cg_uresolve_probe(dtp, yypcb->pcb_probe, &uarg);
>>>> +
>>>> +	if (uarg.bad_object)
>>>> +		dnerror(arg, D_PROC_NAME, "uresolve( ) object %s does not "
>>>> +			"match the current uprobe object\n", obj);
>>>> +	if (uarg.no_path)
>>>> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) requires a unique "
>>>> +			"uprobe object path for this probe\n");
>>>> +	if (uarg.no_symbol) {
>>>> +		if (allow_fallback)
>>>> +			return -1;
>>>> +
>>>> +		dnerror(arg, D_PROC_FUNC, "failed to resolve user symbol %s "
>>>> +			"in the current uprobe object\n", arg->dn_string);
>>>> +	}
>>>> +
>>>> +	if (uarg.nmatches == 0) {
>>>> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) cannot determine the "
>>>> +			"current uprobe object\n");
>>>> +	}
>>>> +
>>>> +	if (uarg.different_offset)
>>>> +		dnerror(arg, D_PROC_FUNC, "uresolve( ) matched multiple "
>>>> +			"uprobe objects with different offsets for symbol %s\n",
>>>> +			arg->dn_string);
>>>> +
>>>> +	*offp = uarg.off;
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int
>>>> +dt_cg_uresolve_from_target(dt_node_t *dnp, dt_node_t *arg, pid_t pid,
>>>> +			   Lmid_t lmid, const char *obj, const char *name,
>>>> +			   int allow_fallback, uint64_t *offp)
>>>> +{
>>>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
>>>> +	const prmap_t	*mapp, *first;
>>>> +	GElf_Sym	sym;
>>>> +	pid_t		gpid;
>>>> +	int		err = 0;
>>>> +
>>>> +	gpid = dt_proc_grab_lock(dtp, pid,
>>>> +	    DTRACE_PROC_WAITING | DTRACE_PROC_SHORTLIVED);
>>>> +	if (gpid <= 0)
>>>> +		dnerror(dnp, D_PROC_GRAB, "failed to grab target process %d "
>>>> +			"for uresolve( )\n", pid);
>>>> +
>>>> +	if (dt_Pxlookup_by_name(dtp, gpid, lmid, obj, name,
>>>> +	    &sym, NULL) != 0) {
>>>> +		err = 1;
>>>> +	} else if ((mapp = dt_Paddr_to_map(dtp, gpid, sym.st_value)) == NULL ||
>>>> +	    mapp->pr_file == NULL ||
>>>> +	    (first = mapp->pr_file->first_segment) == NULL ||
>>>> +	    sym.st_value < first->pr_vaddr) {
>>>> +		err = 1;
>>>> +	} else {
>>>> +		*offp = sym.st_value - first->pr_vaddr;
>>>> +	}
>>>> +
>>>> +	dt_proc_release_unlock(dtp, gpid);
>>>> +
>>>> +	if (err == 0)
>>>> +		return 0;
>>>> +
>>>> +	if (allow_fallback)
>>>> +		return -1;
>>>> +
>>>> +	dnerror(arg, D_PROC_FUNC, "failed to resolve target user symbol %s\n",
>>>> +		arg->dn_string);
>>>> +}
>>>> +
>>>> +static void
>>>> +dt_cg_uresolve_emit_offset_addr(dt_node_t *dnp, dt_irlist_t *dlp,
>>>> +				dt_regset_t *drp, uint64_t symoff)
>>>> +{
>>>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
>>>> +	int	treg;
>>>> +
>>>> +	/*
>>>> +	 * Compute the current object base from the saved user PC and the
>>>> +	 * uprobe offset, then add the compile-time-resolved symbol offset.
>>>> +	 * When available, use the kernel's current uprobe IP directly because
>>>> +	 * the saved register block may not reliably carry the breakpoint
>>>> +	 * address for system-wide uprobes across different processes.
>>>> +	 */
>>>> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
>>>> +		if (dt_regset_xalloc_args(drp) == -1)
>>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>>> +		if (dt_regset_xalloc(drp, BPF_REG_0) == -1)
>>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>>> +
>>>> +		dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
>>>> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
>>>> +		dt_regset_free_args(drp);
>>>> +
>>>> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
>>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>>> +
>>>> +		emit(dlp, BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
>>>> +		dt_regset_free(drp, BPF_REG_0);
>>>> +	} else {
>>>> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
>>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>>> +
>>>> +		if ((treg = dt_regset_alloc(drp)) == -1)
>>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>>> +
>>>> +		dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
>>>> +		emit(dlp, BPF_LOAD(BPF_DW, dnp->dn_reg, treg,
>>>> +				   DMST_REGS + PT_REGS_IP));
>>>> +		dt_regset_free(drp, treg);
>>>> +	}
>>>> +
>>>> +	if ((treg = dt_regset_alloc(drp)) == -1)
>>>> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>>>> +
>>>> +	dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
>>>> +	emit(dlp, BPF_LOAD(BPF_DW, treg, treg, DMST_PROFF));
>>>> +	emit(dlp, BPF_ALU64_REG(BPF_SUB, dnp->dn_reg, treg));
>>>> +	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, treg, symoff);
>>>> +	emit(dlp, BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, treg));
>>>> +
>>>> +	dt_regset_free(drp, treg);
>>>> +}
>>>> +
>>>> +static void
>>>> +dt_cg_subr_uresolve(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>>>> +{
>>>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
>>>> +	dt_node_t	*arg = dnp->dn_args;
>>>> +	dt_node_t	*fallback;
>>>> +	dt_ident_t	*tidp;
>>>> +	pid_t		pid = 0;
>>>> +	char		*spec, *tick;
>>>> +	const char	*obj = NULL;
>>>> +	const char	*name;
>>>> +	Lmid_t		lmid = PR_LMID_EVERY;
>>>> +	uint64_t	off = 0;
>>>> +	int		err = 0, explicit_obj = 0;
>>>> +	int		use_fallback = 0;
>>>> +
>>>> +	if (arg == NULL || (arg->dn_list != NULL &&
>>>> +	    arg->dn_list->dn_list != NULL))
>>>> +		dnerror(dnp, D_PROTO_LEN, "uresolve( ) prototype mismatch: "
>>>> +			"expected 1 or 2 arguments\n");
>>>> +
>>>> +	if (arg->dn_kind != DT_NODE_STRING)
>>>> +		dnerror(arg, D_PROTO_ARG, "uresolve( ) argument #1 must be "
>>>> +			"a string constant\n");
>>>> +
>>>> +	fallback = arg->dn_list;
>>>> +	tidp = dt_idhash_lookup(dtp->dt_macros, "target");
>>>> +	if (tidp != NULL)
>>>> +		pid = tidp->di_id;
>>>> +
>>>> +	spec = strdup(arg->dn_string);
>>>> +	if (spec == NULL)
>>>> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
>>>> +
>>>> +	tick = strrchr(spec, '`');
>>>> +	if (tick != NULL) {
>>>> +		*tick = '\0';
>>>> +		obj = spec;
>>>> +		name = tick + 1;
>>>> +		explicit_obj = 1;
>>>> +
>>>> +		if (*obj == '\0' || *name == '\0')
>>>> +			err = 1;
>>>> +	} else {
>>>> +		name = spec;
>>>> +	}
>>>> +
>>>> +	if (err != 0) {
>>>> +		free(spec);
>>>> +		dnerror(arg, D_PROC_NAME, "uresolve( ) argument must be "
>>>> +			"\"symbol\" or \"object`symbol\"\n");
>>>> +	}
>>>> +
>>>> +	if (pid == 0) {
>>>> +		if (dt_cg_uresolve_from_probe_file(dnp, arg, name, obj,
>>>> +		    explicit_obj, fallback != NULL, &off) != 0)
>>>> +			use_fallback = 1;
>>>> +		goto done;
>>>> +	}
>>>> +
>>>> +	if (explicit_obj) {
>>>> +		if (dt_cg_parse_objname(obj, &lmid, &obj) != 0) {
>>>> +			free(spec);
>>>> +			dnerror(arg, D_PROC_NAME, "uresolve( ) object %s is "
>>>> +				"not a valid user object name\n", arg->dn_string);
>>>> +		}
>>>> +	} else if (dt_cg_probe_objname(yypcb->pcb_probe, &lmid, &obj) != 0) {
>>>> +		const char	*path = dt_probe_uprobe_path(yypcb->pcb_probe);
>>>> +
>>>> +		if (path != NULL) {
>>>> +			obj = path;
>>>> +			lmid = PR_LMID_EVERY;
>>>> +		} else {
>>>> +			free(spec);
>>>> +			dnerror(arg, D_PROC_NAME, "unqualified uresolve( ) "
>>>> +				"requires a concrete probe module\n");
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (dt_cg_uresolve_from_target(dnp, arg, pid, lmid, obj, name,
>>>> +	    fallback != NULL, &off) != 0)
>>>> +		use_fallback = 1;
>>>> +
>>>> +done:
>>>> +	free(spec);
>>>> +
>>>> +	if (use_fallback) {
>>>> +		dt_cg_node(fallback, dlp, drp);
>>>> +		dnp->dn_reg = fallback->dn_reg;
>>>> +	} else
>>>> +		dt_cg_uresolve_emit_offset_addr(dnp, dlp, drp, off);
>>>> +}
>>>> +
>>>>  typedef void dt_cg_subr_f(dt_node_t *, dt_irlist_t *, dt_regset_t *);
>>>>  
>>>>  static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>>>> @@ -7039,6 +7494,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
>>>>  	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
>>>>  	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
>>>>  	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
>>>> +	[DIF_SUBR_URESOLVE]		= &dt_cg_subr_uresolve,
>>>>  };
>>>>  
>>>>  static void
>>>> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
>>>> index ca00788a..0505e2ff 100644
>>>> --- a/libdtrace/dt_open.c
>>>> +++ b/libdtrace/dt_open.c
>>>> @@ -330,6 +330,8 @@ static const dt_ident_t _dtrace_globals[] = {
>>>>  	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
>>>>  { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
>>>>  	&dt_idops_regs, NULL },
>>>> +{ "uresolve", DT_IDENT_FUNC, 0, DIF_SUBR_URESOLVE, DT_ATTR_STABCMN,
>>>> +	DT_VERS_2_0, &dt_idops_func, "uintptr_t(string, [uintptr_t])" },
>>>>  { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
>>>>  	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
>>>>  { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
>>>> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
>>>> index 54053cd3..bff47055 100644
>>>> --- a/libdtrace/dt_probe.h
>>>> +++ b/libdtrace/dt_probe.h
>>>> @@ -102,6 +102,7 @@ typedef int dt_dependent_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
>>>>  extern int dt_probe_dependent_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>>>>  				   dt_dependent_f *func, void *arg);
>>>>  
>>>> +extern const char *dt_probe_uprobe_path(const dt_probe_t *prp);
>>>>  
>>>>  extern void dt_probe_init(dtrace_hdl_t *dtp);
>>>>  extern void dt_probe_detach_all(dtrace_hdl_t *dtp);
>>>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>>>> index d53b1e43..9a481f59 100644
>>>> --- a/libdtrace/dt_prov_uprobe.c
>>>> +++ b/libdtrace/dt_prov_uprobe.c
>>>> @@ -307,6 +307,47 @@ typedef struct uprobe_data {
>>>>  	int	ref_shift;
>>>>  } uprobe_data_t;
>>>>  
>>>> +dt_provimpl_t	dt_pid;
>>>> +dt_provimpl_t	dt_usdt;
>>>> +dt_provimpl_t	dt_stapsdt;
>>>> +
>>>> +const char *
>>>> +dt_probe_uprobe_path(const dt_probe_t *prp)
>>>> +{
>>>> +	const dt_uprobe_t	*upp;
>>>> +	const list_probe_t	*pup;
>>>> +	const char		*path = NULL;
>>>> +
>>>> +	if (prp == NULL || prp->prov == NULL)
>>>> +		return NULL;
>>>> +
>>>> +	if (prp->prov->impl == &dt_uprobe) {
>>>> +		upp = prp->prv_data;
>>>> +		return upp != NULL ? upp->fn : NULL;
>>>> +	}
>>>> +
>>>> +	if (prp->prov->impl != &dt_pid &&
>>>> +	    prp->prov->impl != &dt_usdt &&
>>>> +	    prp->prov->impl != &dt_stapsdt)
>>>> +		return NULL;
>>>> +
>>>> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
>>>> +		if (pup->probe == NULL || pup->probe->prv_data == NULL)
>>>> +			return NULL;
>>>> +
>>>> +		upp = pup->probe->prv_data;
>>>> +		if (upp->fn == NULL)
>>>> +			return NULL;
>>>> +
>>>> +		if (path == NULL)
>>>> +			path = upp->fn;
>>>> +		else if (strcmp(path, upp->fn) != 0)
>>>> +			return NULL;
>>>> +	}
>>>> +
>>>> +	return path;
>>>> +}
>>>> +
>>>>  static const dtrace_pattr_t	pattr = {
>>>>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>>>>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>>>> @@ -315,10 +356,6 @@ static const dtrace_pattr_t	pattr = {
>>>>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>>>>  };
>>>>  
>>>> -dt_provimpl_t	dt_pid;
>>>> -dt_provimpl_t	dt_usdt;
>>>> -dt_provimpl_t	dt_stapsdt;
>>>> -
>>>>  #define UPROBE_CONFIG	"/sys/bus/event_source/devices/uprobe/"
>>>>  #define PERF_TYPE_FILE	(UPROBE_CONFIG "type")
>>>>  #define RET_FLAG_FILE	(UPROBE_CONFIG "format/retprobe")
>>>> @@ -1392,6 +1429,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>>>  	 */
>>>>  	dt_cg_tramp_copy_regs(pcb);
>>>>  
>>>> +	/*
>>>> +	 * On some architectures the saved user IP in the uprobe pt_regs is the
>>>> +	 * resume address rather than the probed instruction address.  Normalize
>>>> +	 * the saved IP to the actual uprobe address when the kernel can provide
>>>> +	 * it so consumers such as uresolve() can derive the correct object base.
>>>> +	 */
>>>> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
>>>> +		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
>>>> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
>>>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7,
>>>> +				    DMST_REGS + PT_REGS_IP, BPF_REG_0));
>>>> +	}
>>>> +
>>>>  	/*
>>>>  	 * Record the uprobe instrumentation offset in the probe context.
>>>>  	 * This is the same object-relative offset passed to perf_event_open()
>>>> -- 
>>>> 2.43.5
>>>>
>>>>
>>>> _______________________________________________
>>>> DTrace-devel mailing list
>>>> DTrace-devel@oss.oracle.com
>>>> https://oss.oracle.com/mailman/listinfo/dtrace-devel

