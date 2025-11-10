Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63E2D8DB1
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762804561; cv=fail; b=nzrxDJsjZd2wZ9PrZicn/fxQWn+DIitUfTG+Cqc9SQgiwC3eBn4JW3RkXi7AuGNdM3FTdbWYK5/TLb3xzC4XOjOZp1MEjvnmOypOf5UdHUMb5AAmo0V1WK/yeJdCENqHgayXcGT9cZ01VsrWST1A+XQGCLYvuZc7f2D8VmT3MiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762804561; c=relaxed/simple;
	bh=lpT4nTsreszlH2dLXy/TGran2c8lH+XnfVJxYeHLq+k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B/2fAR3hPKXc4dK/86ImCYv1DNbgrYfTm0KS4CHQ2N8jME+t31L3Q2IMXVTeuY47KBpZeQ/0633CzTXsrfZToDFbpSAWEBGZJUPG+ldHqMeY9lMtbD251ovz5dAcwPJ6+v4340Mr4zEbcHeGDikYY+xi7unYKEU2O2/UcRC3MSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CtB931pH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QdoSetmO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CtB931pH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QdoSetmO"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAIoMMp014639
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jsFe9Mqy3tBGH70kfW8ZuYD7q4KXt3b9MwgwWI5lnko=; b=
	CtB931pHNq7jbKLEisuS//aw50OfkkgBKJEJ0hcRmNFMUsFQApLnxJW/Ior4HRjK
	ymMLw3atfjlEEhzPFeKmxmxiA2oduSlWtq0Ct0i+YFtF/VMJf+DHQlr4pBjefCUB
	Il+/mTB0EDnLLOeE0WTtYbslk98I4D4JRPaSNIHXWm1epgznfHsLR9YyMbM/a83X
	7tDLDZ8mv+93caIG1+1RV00DgniyAYcZYIYg4JFkS7J+p9uCOgeG34AfQ4iays/8
	p6+R0Q4uPUfLNXgY6n1tKPF/gE0+EeCkG9t+mPXHEuCJAyH23vFalZpwOsVsI9Kg
	uxV+6b7F4oeRNSmP0Cu0ow==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abks7gfb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:55:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAIFAHD021061
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:55:58 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va8kjxk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 19:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azEityzwaAjiSJiEmwyEwctb61TWR1Q3wlXIr/Cu1TgrdIFQ6gjSU3uxJVyJbVxj1tNW8tR0jPxaPc/NRCNQ303wy7ovJi5yK40vS4M4ynQxTO25P6N6ZchE+prmnZTUFTcsk1nf19pSA9msd6BuZeDBYEt3rw2nwg5yEc9ogqFbmcyl/DcZ+NL89Lid9mLCkLXy3ioIhMAwNJfuI24fAzCde2+1gkssC7Ae7kyNOX0II4uW6co+S7U5pb1ImT+t6W4bEeEqt59CtKUr4py1AzKyHgiuiKsb0UFCVPEkD8A5kSox5iv7VlzcyLDHZoOykM+QlZVxqmcQ2eOT4sSvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsFe9Mqy3tBGH70kfW8ZuYD7q4KXt3b9MwgwWI5lnko=;
 b=e3Io4LUGm3ehtgHlh5/uzeZ+BVMFHnRVRPpSX8bWZfNCeTrzOuv6w1b5Mi7hk9w1miwuhH4k0P90yuwecuoFz9nhMmy20DyMb8DIQnrVhFxdf4ssiA2H0JJoZRyPofx3uh/1OpOTdQfB/3Iism3cG/6yC6pRnIrecDuzmD7Lcrpsi+BC4kz9Cl0GHX0ajmzKaLu7le7FrdFagK/s8aBpStFyJeTKdg5cKN2I7W3smgBZgwU5PRS5wdv6nzhzsPEs7z7wS1DAJW6Bruvlhc7FiAp6SjP1XsgPPkS2uO7LD+TF/j20lETWo8ndMR7bEZHts/NPDtBA//z7MydGKYDHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsFe9Mqy3tBGH70kfW8ZuYD7q4KXt3b9MwgwWI5lnko=;
 b=QdoSetmOw0n35VRKwRcR2xTr+uJ0rH5dIMshHlWyGh1Z6evOuGv9hbRyhEnE8RgEY2LSNs3UIpy8t7gzjC44YOFoilfBjTyNuz0LL9BLf4tqx443piuoQNYf6vUhOnQ0CcDXssYJZGTxEktjqc4W9Lr3yyWI8AtkZ8ROl5PcCOE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6155.namprd10.prod.outlook.com (2603:10b6:510:1f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 19:55:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 19:55:55 +0000
Message-ID: <cee8efa1-0b4c-77bc-ebfa-dcb0684aa6e9@oracle.com>
Date: Mon, 10 Nov 2025 14:55:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/4] bpf: fix file descriptor leak
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <BY5PR10MB398729B40B695D3F3B541D3DC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <BY5PR10MB398729B40B695D3F3B541D3DC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR22CA0022.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 5806c9f3-1f28-42b1-e424-08de209328bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UXI4SGlyUVFuKzRsQzFVMFdMVTJobkVQUGViRGFsWlpodTNxVnBKY2VwOXdD?=
 =?utf-8?B?Y3JBUWR0d2FrM3VzOTNoUWZZSFhJK1ZUL2Qza2JhVUxsLzFSazErT0JaeVJv?=
 =?utf-8?B?QUVrVVZld2t0dTRYRERyUkRuelZ2S1lGVWh6WUlXL1c3aUNGNUV2QUhEdWQ0?=
 =?utf-8?B?b01vNVo2Q0xLRG56NzhoK0V4QUFpWk9CRkNKNndHeDVZMWtXZ09lK0xIUllz?=
 =?utf-8?B?Tmd4ZlJrUkVqVk9zSVc0N09mM1BCQkxlcFUwTGorQy8ya0JLRE1zUDBsTlNm?=
 =?utf-8?B?dnN2WEdyVEFmaE5aOXMveEF6MnlCZjZGa3J3TWZhekJQRUwrWEUrZnRscldh?=
 =?utf-8?B?dWpORUtZZCtadXlXNjNhN1BoOXMwMGVjNmk4Z3NSbkhGWklEbENWbjJGWFFi?=
 =?utf-8?B?eWRocEJDVElSa3hRZnNtQkFwQ3k1Q290UldiWTVJcmd2L1FuZDZwQmJWM0lh?=
 =?utf-8?B?NlVCNWMwN1ExSjQwYVR6dFVwVnZpcisvZVZUMEhvOWF0SmVKTGE0TExQeEFa?=
 =?utf-8?B?bEZWVlYyTUFEclNpKy9IcjVqWVlaT21HSFNyWVphNlkyZFFFYXZVbkhwNC9N?=
 =?utf-8?B?cjNuUksyUnhJd3A5WFlROS9hcTQ0ZnJTNWVjVWswVm5vcnRMVEtqejR4bGZG?=
 =?utf-8?B?Q0UrNjVwUWlBYy9rUDV2cTBWNXprT0RBcDI2R1RHYXlwN1g5aUNQT3Y2QWJw?=
 =?utf-8?B?R21JVTVCYkdSTHhKN0I1SkZKNEMzMW11bXltZUFPWmNHZ0JFeTJWUFpQaE9G?=
 =?utf-8?B?eE52ZFVNcjd5bjI4YWt5TjhwSE10eDRscDl4aHYxWi9nV1dBRXZ0Y0VuMk5p?=
 =?utf-8?B?blJPRjFYMEVFTjUyQ3BuL1pYenJJdG44aU9zbGtRRm5XeDgyM0ZxS3FCaDNt?=
 =?utf-8?B?WEpHalRhN0RSNE9FcWxQVlpOcWNUN1hCd2xYMFRPK1VEazdnb3IrUVp1akl3?=
 =?utf-8?B?Ui9HcjdlUE5kR1oyeU1ZZjJuRFl5SlFjUWwzNStsWmNmc0F2VUpuMWpKWmI3?=
 =?utf-8?B?Yk1BVE5oQ2p3UU8xL29Qc2ZqRk1neGg1VWUwaE1mc0RGenBnSGtlZTFiREEv?=
 =?utf-8?B?bS84VjB3c0VBOGJSNHFCWmd6a09KKytOUmVZT2hRUXRSR3g4djhRY2Y0Q0lG?=
 =?utf-8?B?ZGZ3YnBoL0dBRyt6Skd0S3Jva3JEUGJpZTgvM1ZvcEttcVFWZnlWeHNVR1pz?=
 =?utf-8?B?ZlAxZ3UwYUo2U05tV2lFMFRzckt2Z0lvVEQrMkhzSkdZZlpRbFcwaUlsbzJV?=
 =?utf-8?B?bStMaC85c3R0Y1hGeTh5ZUp5aDhNL3VHdW9aQitVMXJiajgwVWF0Ynh3VjdR?=
 =?utf-8?B?SjVaZUhpbGh1UXYvdEFKeUVHV0Q4Y3VaQTdha29MakxkTFBwM0Ixdk9ZRkIx?=
 =?utf-8?B?ckIvZTBOWTVvMUk1VzNhT1JYUjEzQ0dpNFJyeHg1c3pHSmhiQ3R6L0s0SWZB?=
 =?utf-8?B?TFlIZldSem1NWkh3cW5DVSs5dzNTNklMSnJ1VkNZK0l0ZzdSNzRFUjV4MEI1?=
 =?utf-8?B?T285MzhjTStPZkI3dkNjcDI4S2VRS0NCemRJMk9KbkR4UnNwWXJ4dHA4cmk3?=
 =?utf-8?B?dWxNZktBY1NqRW8xWnBCWW83RmNLZ1JETThuZDBuQ1hLSDhTbzJEcHZlenBo?=
 =?utf-8?B?UHBCcWVsZTdWdHVUaVhRaHFKb2lMRVJhTS9udTZnb01Qb2hNcTJpTGhsQ2tQ?=
 =?utf-8?B?dUlPVzRSakcvd1lqZXFLcGZ1aDdQSGgva08wUjBEWWdWRS9WellLcTlBTzBP?=
 =?utf-8?B?MmthRnd1NUtUQVgzdEw2NWVjdFdNdCtpNmUyUXlzOVlZVkxUdmxJRUNuRXZo?=
 =?utf-8?B?bEhIclJiYWNCNTVSRGhHRUpVUzBIc3ZYVUp3Q1d1aVRlOS8raTB6N1k2QlhC?=
 =?utf-8?B?RjIwQy9VOTEyMEd6bXdJbGRYaTBBVkFuczlpWWYxSnVUS0V1a0tzYVdsOW5L?=
 =?utf-8?Q?dqSXjLI3LTybVbylAxXWXE++u1WAKAld?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmROQjcrVkM5Smx0MTdLSnZXNnA3VDRXa0hvUW5aam5UWjBqeWdORVI2Ukla?=
 =?utf-8?B?THpRZ3VtbnprUkVJdHlwcVB4dkdVVU1qRDAvVzdQZ2p4ZmZUS2lHNGFxQmF2?=
 =?utf-8?B?NmFSSC9Ed0hDUmhuMUhoOGl0RUNhVUlvN25xbGc0clh0N04zeStmNDJ2MSs0?=
 =?utf-8?B?eHFKbzlSNDNQNTJqVVdsWkFTdytYbVhsS3JxdlJzbGp1dHpSR3pmZDlUMmZv?=
 =?utf-8?B?enBoYXFXbXVuaytmYW1LUHFpUWtHVFV4akhPcktmSHBlMVZGSnp5K3BjaE1K?=
 =?utf-8?B?MzhVblQxYTA4c1Uwd3cyYTFxdk9MNWN1eXNpaUNXT0FFaDdUTWlrVmE2bDU1?=
 =?utf-8?B?Tit5SUZENFFSTElLaTBwK3RucFBQL2tySEVkcG1Yc2NFTnRlREtRTnVhYjhi?=
 =?utf-8?B?bGEvdXlEU0NXWlFjWnNXdUp3TTdIT0VEc3lreWlXL204bmJHaGo2bXczaDZI?=
 =?utf-8?B?MXpoYXlmYmpWaktSNjNkRTgwV045dFUzRk5mRXdTdjVLeGVsKy9IOXJzWEJ5?=
 =?utf-8?B?Y0lUSGJqOG9jMmdzVDJaTG5odnBBTTEzNjVWQzUvRzN2ZnhETGFsUnRqcTF3?=
 =?utf-8?B?RkRnbmVhWnRwNm1pOGpPcmNZWk53Q2VNOWhFTFZWR211Y3V6ZldpcXMxU2lG?=
 =?utf-8?B?TUs5ZmdRM0YxbW9NeUx2ZDRSaGZRbVN1Zks3cEhLMXpFRmEvMko4VFlrSkJh?=
 =?utf-8?B?NUZiYmQ1dm90ZkkzWkVyUERmNmRsb3Z3QnRHbUdxYlRTRGcrY0lVUnFrRWxz?=
 =?utf-8?B?eDJPY05hRjdHMlhwdmlOMFptRGtnQmhtdXQ3dzRuVGZIdkNjWVNyRHBGTTNY?=
 =?utf-8?B?SGhLZTF3REl5Y1JtUmVnd2VhKy9MWXlqV2cwUHRkSjMwd3NRM0Zkem8wNE53?=
 =?utf-8?B?WDhpWU8vdXExMFpXbnV5TmcyNEdVaXBJaGlJQ2tYME54R0RzelVBcitubFh2?=
 =?utf-8?B?WGc3QzNYMTNhZEVxL2JVNkN6djZzRVgwaUlSU2VvV3h0SE9LUUxXK2M5MVZ4?=
 =?utf-8?B?ekhPOWNFdFpmTWJQSS9EcTdKTFhQZW9kd3ZOV3FNWm1UMlMyNENVTEU2NXdz?=
 =?utf-8?B?MU9Xb3V1WSthSUpBY003eHMzM09kVHliVWJLOTdtc0grSW9sblpZYWFtK2dV?=
 =?utf-8?B?T2pLQmZzR3Q3dkYrM3IvQ2Z2M0hGSldYaHNoZWkwdWV3RGdLRktKTjd2Z291?=
 =?utf-8?B?bzdqaUlrYnlBeFJucnYyclBCZ3I3S3g5Mk43SjljT3BqZjdlK2FueEh0T2xr?=
 =?utf-8?B?V3FnMWZMa3dqRGNveEZaTERxbXQ5cFhURXBhRVg0dmgxY0gySDBMT0VEVjRa?=
 =?utf-8?B?a0hlTnlIRmJvUDVGWndrMHN1UHk5NHp0NkVFbENrK0dDVS9BN1FpOGFRODRN?=
 =?utf-8?B?MFFzY254QTZScWROZW9SNTY4emtzQ21pZXpmdEp5b1piU3IrbmxXR1FLRE41?=
 =?utf-8?B?SFpIMndSMEJjYXp5d0NIbFhjUnhZdU5nS3UyR3B3RjZHT0xhdlhmc2xINzRS?=
 =?utf-8?B?Qk5vUytqTmkzL21wS2xPWlp4M1lFWHVjSGppeHFkUUFGQVczUzNYbHhmWDBK?=
 =?utf-8?B?bmUvdmp1UHZucWVKbTd2V3hGbFUycER0emowUTFGMWwxRjZkNTRYLy9FRGNp?=
 =?utf-8?B?NmxqOVZ0MTIzL0xSUWxjeG9pazNmVlFiTGR2NEZBM0dtb2ZCSytvZE5idEZt?=
 =?utf-8?B?c3VQRUN0bHliN2NTQUdYMVBmQ0N0R3Z5V3Vkb2x5MTBpTE5PemFncWprMFFX?=
 =?utf-8?B?b05QRlEzN2RKais2SlpPVTIrUFVJZXdMN3FmUVp4U0h1emhtSHVIOG90eHVj?=
 =?utf-8?B?QUkxVUNZL2xLMTBsVURoSjNKTHVwalh3Ky83REVObFEzNldsZXJZczI2YW1t?=
 =?utf-8?B?Wk5zVzZiTjZlNkxlMHE0MjF0ZHFxWCtvYllqa0FJREExUDhTTmYxV3NUWmF0?=
 =?utf-8?B?enU5cUsxZlFIOFpRK3NrRWZwdjV0V2VsKzA2cW9iNVg0UlA1M2FqNzM5Qjho?=
 =?utf-8?B?OG9Hajc5ZFNiMFF5Z3JoRmpzYlhRQjQzT0NqcERpY1BXVVExVmc2R2RXZkJ3?=
 =?utf-8?B?S04zNXl1VjhMcHJocWx1WTdaLzhwQjhveUtKYld5L1FyeUZueTA2SVFDSVU2?=
 =?utf-8?Q?6UeR23m/h8/3Y+/h4Tdkr6Eyt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pPeCGupZU/rsq8Ca1ss2hxqHnq7NZjecUFKOQdNk5a9GKFOOedkz1meRjA9UVnkKhoNNpK1IzZwiSMjfmoyS74nVTerbwOoelV3UAb9C5UTj884wOnL9NXQQ3eF1CvLkWNFUwDsuwl+rvUnxGYo5XeSHanWVDMPVlsh2DEjozRDRR/HmYkxqT0xOC8Q125hWjlpKI8c8Bz/raL+qTqWGN/WshNjvirHb9qLVuvkLcEgq0gH3kWgNGSkEQAiZZahxwQYhzEKnFtXCFL07c+nWLS6/nPKyHLQ36jz5h6rprEMaaL0TAcd1PvKBu1oZNenGqPi8uNybLCK7zCPlYH8J6Cr0TEUODC94MlXsjLy0JKfemo/CLMxkURo+tSmpeM9zymwrD+SrwASNjLGfh130XgTiyVEVt0px+ZFiGUioNfYPdz0tVCKB5iIjrnSIS6fDUPZ35BZSjWZRbllGzUIlyQMdc/6UyhufoNt95r9fEd9k6WA0oRK6vmMxwl+0CicU3p1ERoic122iFPXj+OP8fEoWKwMiC5J447ztTlZs0VieFRC+cafDuQiBDn2eKWYTcERHdYBPWCGgSivR4kAIvp0BcPUfR0tdOedhV/F6KZw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5806c9f3-1f28-42b1-e424-08de209328bf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 19:55:55.1938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwQUu7EgUidRiOhpvedID/e1y800JYgBzla7ZWCd3bLmtIz+kXNB2wc+4eaZ7PuGQr6ZHtSYaHmF7H7vfBlZRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511100169
X-Proofpoint-GUID: 8TFi3HaWtguEdWyzCnvxhgeJkwJjumkL
X-Authority-Analysis: v=2.4 cv=L7cQguT8 c=1 sm=1 tr=0 ts=6912434f cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=0_T82kH-r1c2FpVrAuIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MSBTYWx0ZWRfX6cPgveOADkiR
 oLEKifresuBnZi0c3rLxtfQZcjgI0Al14qRYH71v/7ODeQqvw/Ogk8ofVNxkoh+Z3nhkoQwxCEa
 AqHXuILlcIDNJgRdbp/Or22CFKd8hmhe7dBq813DDvm37lFSvfkuuZTctNap9VrMEHgxIab8BuG
 ofo2W1A3Yb2FYxodYY+ne8nmSpgW+xyOwR7BJ9P8XZRG85pM5//X26aulWlBWn0f7nx6JWW9azY
 uxTjs3W4InEPLs1an61Is4dFigNkxg1a825DA0OsD2gNo3Aer7A9q0+AVo0QIcobNTnDDtdBRuX
 t3S838RS1T8a2LZkga4Kn75YUMRoqeWEut5bZ58tU1TUdjLAF1nnNOMdU7mUIdrIUEoYOmoaqfp
 4Y8QLV7xOwc04/Z1DiAfNffT9Uhxog==
X-Proofpoint-ORIG-GUID: 8TFi3HaWtguEdWyzCnvxhgeJkwJjumkL

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

But I'm curious about the "if (attach)" check.  It looks a little funny 
that we first set fd= and then we check "if (attach)" to see if we are 
going to use the fd value we just set.  I suppose it does not matter 
since we expect attach to be there, but normally one would first check 
if a value is needed before going to the trouble of determining the 
value.  In a way, this small, pre-existing issue is outside the scope of 
this patch, except that the patch makes more obvious the one, isolated 
place where this temporary value is used.

Up to you whether to clean that up.

On 11/10/25 10:27, Kris Van Hees via DTrace-devel wrote:
> When a BPF program has been attached to a perf event, it is safe to
> close its file descriptor.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_bpf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 0223764a..28eb890e 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1385,8 +1385,8 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>   		if (prp->prov->impl->attach)
>   			rc = prp->prov->impl->attach(dtp, prp, fd);
>   
> +		close(fd);
>   		if (rc < 0 && !(prp->flags & DT_PROBE_FLAG_OPTIONAL)) {
> -			close(fd);
>   			dt_attach_error(dtp, rc,
>   					prp->desc->prv, prp->desc->mod,
>   					prp->desc->fun, prp->desc->prb);
