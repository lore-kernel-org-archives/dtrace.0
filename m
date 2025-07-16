Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246780B
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752642053; cv=fail; b=kPg84yfxjVeSeoC1689B3jzWSL/zhz+46e66a83/UxX/rWmy1G9sgkg/n4SPvCyfXZOGfEUeMToUGvIAHwuD+jbuhVxjn7vdD4t2keGcmylHibHmwuDx4gtEfs/AKMs/R7sPVh8SKW//minEwJZ+FvNtDZFRV6FyIl5ETkIZtjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752642053; c=relaxed/simple;
	bh=hr9PWyIs8MkOI2DYZZsa3vjHYT9UOb0kMVInoy/LmKg=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m/gYHXWs5Lz/aOLwhpDImpDXWrsCuyYgWanNlhfmSNefWpbWR0zHKmeIbHAZ0CRTlY5kC8IoVxSqTOcsIjLeZtdoEfdLyNEVFYgLQnU09o85KsNfv7dgnYX0hopSQy7XCs/1Ldo+EKGWNEwlxgtOo+iz0FHKPpQlgxkFIRVZ7Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ressax/+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NUFpwXRb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ressax/+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NUFpwXRb"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G4toQR024743
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BvKF3AhoeVVH8a8Tm/lZ7Xh2b5hPgRiXWqgDHW2PXSw=; b=
	Ressax/+jG+aD+ZePGYQaef3OvPcsYLSuJVUBSc4nQvT5DopPtr+9jS2QtiyEL/t
	Y5jgKZTFVbMLF4NixgWQ70/ARHcu9mnW1agcASf+M0VUTTPJUrRx+ROHdetwJBQT
	tNEAJwxtEB4elyURinpiCdVPLx9AHutUQNMX0Yy5fD/k9nfs40Kxzbk4MU+3Nd2m
	aR2sb5QVqCZJuv0ozBsLMJj+p9tmJm6au4sA5vcsOpJtQ5/nIdOeld3VNwlmqcOs
	je84l7Ji0RB3fUPD8aq3d4yXtH4n36dsS2wqgaUuQkItXIczmd9IBMsL4OqY9OT/
	Wp/CT7RID4CcInCndD65kQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk8g06gd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:00:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G2XlUd029730
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:00:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5akxq1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:00:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xi4v7VCVKkdndPaCgQeirnA1lg6cz4r/HlzhGd2IWEGJjHGQ3aDJVf6oTcLeEwMFBsCLkhmPG2+uEJqZx7E8a4vtxYswTc997XA2CEGPz04zK9CdaAvdpkF9AHXgpAqGpoZ3WILZFGxIdG7HuuyyKX5kq/S9Qf21GL47hTJpYHtxSxzosu3uOuWqP5TxlpTDp0HXZvXDIZKtbHfSEnyxw8MNQf5/i7N+kmtsxiSES/Zmapp5mOGCAx01Jp1bdtHQjYqLkowjbWqTX4cwILNVl9HZcrcbM5bKo7MPYxocP2gGPX6wN/7jXTvNL035z+qJ59VGP5A57IxPVtecc/9DSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvKF3AhoeVVH8a8Tm/lZ7Xh2b5hPgRiXWqgDHW2PXSw=;
 b=Wbh3KgvY7gMznvUn5ZPaiu5fUYl0eo78UJ1es4ibxgLzdJP3U+SKQf63EL9OSd0Zcj5JYd8FXEnYcOljTNIjmssV0XvfjDYu8vfLQSSfT3gOnT8h2bfACiIC2AY9k0V5FPZ4YZV4yV6M4g25IoSH7rKN2TJFgZjEdZZs/nB46qpo10Rsfydqss8jCKoXF6TXhxNVKmvZoUx573B7hEjkSzQxwpL87V6nTQhY5d2KFKFwzv8MXwL5Janc0cmYG5JDOJ4lmHwyRXO4H0+bBBZfZs+EcsHFs9rilKP2BrfnGoaUF3bXcNq1MyLfLxioiGJku83L+8jritL8GvqqX7i4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvKF3AhoeVVH8a8Tm/lZ7Xh2b5hPgRiXWqgDHW2PXSw=;
 b=NUFpwXRb7UzEEzWgGYKtaJ3c8nlmqVJgv4q6ioBTgu9bDhe2EWAR+nW34bg/u3q+0k6Hjv572jztRfoL9XRn5w3VvUDVguDu7v1d1Ta0Yy/fcAZWHzQQ8N5Gjhp2/pDq3A47rMuYAk7VK2R64vabnkhLVfDZse1Pyabiu4BKmjI=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH0PR10MB5817.namprd10.prod.outlook.com (2603:10b6:510:12a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 16 Jul
 2025 05:00:45 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 05:00:45 +0000
Message-ID: <57838fc8-1e04-2f10-4d4c-e4416aea10bd@oracle.com>
Date: Wed, 16 Jul 2025 01:00:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 3/3] cg: optimize ternary expressions for
 strings
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672AFCDA4B6377F37D0C949C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672AFCDA4B6377F37D0C949C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0008.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::17) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH0PR10MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 91322211-1809-442c-e73f-08ddc425b8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFRKbHdZbVhOODJ2UUxEd2JZeXlpeHo4MDJBcCtDMkhEb3g1VzFtT3l0REtr?=
 =?utf-8?B?aVVNU3YrREt2eEVQQ2NnbVdUWDAwVXJQZTd1ZU5SUEdLNG5vQjJSL1pqbnVT?=
 =?utf-8?B?U1lIcGlYY2w4V01tQ2ZLWDZaMWQ5aEZxUGtLR2d3NTFpaDB2aW5CdmtzMFp6?=
 =?utf-8?B?aFNIVUZmbTZ1Q0llYTBzRGc3MDU1VU5Nc0xqMTFoL3poekVuWk9RSVNsNFNU?=
 =?utf-8?B?TExQdXJCanpUZHpSYTBsaGNLb2F1TGxmdnhhU1RIaDVyVWJJMjdwK204RGdU?=
 =?utf-8?B?M2JCUEs2eGFpV2x6b1hsTm9HbFhnd0daeFM1T2pGdU11NExmNW5NZFBDUEQv?=
 =?utf-8?B?L2d4NFlSdlpzWFdEalN2NWhSbHQ5dzVaVXZSUWhzNnZFSG5LMHFGa1dhWDB5?=
 =?utf-8?B?WW9nM1VNd3RiTlNsQ1NSckhZV3E4K2tDMDBQUlBZQkltZzdWNExaUktEV3d5?=
 =?utf-8?B?UW1BbE1scWtXUGFRQUZDbUdwV3NCTDZ6dmhaTU5hZnc3RXRJeTJrMW1GNVha?=
 =?utf-8?B?SUMzNlhiWnI1bDNQY3JZT0FiWjhqR01qR2lrZFpzMGVEYURXZUk5Ry8zTWxV?=
 =?utf-8?B?MUlUSkJiWFJNeHFSc2x6ZVlkTVh1Vi9QNnNpWmZkUG1mYWJoREhPeVBkZzlQ?=
 =?utf-8?B?OWtpTkZ5R21EeGNpcktVUTZYeGFyR1Q0TDd4dFJGdGhTd2oyaXVoMnA0TVE0?=
 =?utf-8?B?TU8rV2RjcUczUVJyL0lBdW1DNGhhY2R3a0JTb0JIVGx5MEpYVVB0TG81MmVU?=
 =?utf-8?B?NHZSbGpDOUo0ZkwzNFJkNWwzWThQOEZ4Z0o5azBMOVJhVUhFbi9adnBrMVYy?=
 =?utf-8?B?ckluV1k2eEpSZndpUDFFOG84QkxVNGMvSnF2bVVYV0xqT0lUbWhKTDNOSkRT?=
 =?utf-8?B?Z1RjVTJKMEtSOVNwTjd5YW44RkVnYks4SVJvZDIvZ2tLOUhhUVd5VkNyODZX?=
 =?utf-8?B?eFpGN1g2dkg1OUJab25hTDg0VEdDK2dnVStSVHNvSU5DeklWemRMZ0lJc1h2?=
 =?utf-8?B?a0tMck44Z21zSlk4djNGOHdobE8yTlJ6d2J1K0xWbEhYNEJYZGZsL3VzVmJB?=
 =?utf-8?B?cFZJeGpVOEhqbUUweXVmY2hvRU9PSjNLY3k4TWpPanlwYXFWR2JVdE9UOHp2?=
 =?utf-8?B?czhIQW1mYWc3NjRSSk9FangrdUpTdk41dUlJemhCSzUyUHgxZllxWHpxZHFF?=
 =?utf-8?B?WHRwMWlDVlJHaFd6R0hrVGRrTFBqVmQxT3J2VDNaWGMrMDUvY0xhVkVyNlNQ?=
 =?utf-8?B?YXhHY1pVK2c0d0prQVRjWERoekp3THEvK1h2WEFTU3FFTFBTcGFpMm5QbkV2?=
 =?utf-8?B?RnNRaXhTTHVuQS8wblF1YXQxb1BPako5cWhKaS9PdUJBN3ZVMWJ5eExBdnJa?=
 =?utf-8?B?TzR6RXJNcEhGTUdJZFdHdEdONElJRkY2NG9FKytBZ29WdFlXQ01IMVR1dEVD?=
 =?utf-8?B?V25CczAvdE5zbDBIdjFIVU1WSFFIVDdySzMwMUFzeTZWVjg3MHJwd1dOU09m?=
 =?utf-8?B?WHY1UnR0QjZYWFNlRHdvOEdvSzB0NWx6S0taeWZ6Z09rREhpYmhoLzQ2SU5B?=
 =?utf-8?B?VWpMN2FMYlA0VFMxenhvUUxYYlgrb3lTR0NMRnpJNGZ3L3dDUkhvVXpkMnFQ?=
 =?utf-8?B?WXZ5SmIxb2tWMGYzNlZvczhxNVJWcXZUMGdQbS9NWUVoUGw0TXpINTBoRG5T?=
 =?utf-8?B?SFpFZko2WXdjcmNHb0hQYkR4NllHZjNlZVY0TmxDSDhscGNlcU9KK3JEbUI5?=
 =?utf-8?B?QUgwTkVub2RIbGgyaWJhKzJHbFdHZ2Yrc09HQlBGOTUvZHNDS01oVU1PWVRY?=
 =?utf-8?B?U1RDNjNYVFV2ZXcyWEIxQ0dsd1JmWDU5eTB2QnNhVWpuNmJzWTltVFNhc2J1?=
 =?utf-8?B?RHduWkhsZ0hQc090MXVSNlJweEcvbWpkQjc5ZXQ3NG1RY2U2dHdYNk8xVVdD?=
 =?utf-8?Q?G9C3CWrQrVg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckdFWWNIV0FFYWN5V24rSWkxSmVTaTA2cU5JTWJmY2NkakUxM2tCTitiZTM1?=
 =?utf-8?B?WmlJdjFxb2lpSlppcWZpbmlkd1dSUU9RMG9aR1VlMHhURWZoQWMwbmsrK1dj?=
 =?utf-8?B?U1pqVGNKcDN5ckJrb3RHQ2pYZTk1TUVnZjVqdEJhM280VXA0cUY5c1ZyR2Nk?=
 =?utf-8?B?YXBmU01QbDJYRFBEamk3L3hHZmo2cmkwWXJFdEdCdTJOaU1VTEwrNXdtMlhO?=
 =?utf-8?B?ejR6andUZUZHb0RwbmRVK2NvVFZRSGhCQldTWHJZQVk4ak9ITnV3OXZTTE1p?=
 =?utf-8?B?bHdxY3JoMXhCNHZIVUhzVTFyeVc2MExsN2RnTWhxNEVsL1JHUndaNmUwek9o?=
 =?utf-8?B?aFk1Vk8zc0UrMjlEQWMxdmh6S3FIb2ZnYlBFMFdDdVJPZUdCaVlaRHF1UjdT?=
 =?utf-8?B?b0lpOWwzc2E2R3pncGNNc1Z3em1kNTh3UkdHa1JOT1dvVnhjQmtSVGlhcTNl?=
 =?utf-8?B?TTlNdWdaTVcydUNTSUZUUmtlci9Nbmt3RFBnVGFEa0FNdXpiV1llN1g0N0JG?=
 =?utf-8?B?NXVUbE1qOTIwMXo3OUZ1T1kvMmowcDVMSzJTWWNVbHVUbzFNa3FmaWdudURB?=
 =?utf-8?B?RkRZL29BRzBqaytCVGl6RXEwRGRjK2Q1U3ZYOERONWprakIxWEZQaGw3ajFl?=
 =?utf-8?B?aUtTTjhHMjV4Yks3Z05rSFpzcXRzOHplZzk2T0Y0Q09UeHNGQ3VCTU5XVWp1?=
 =?utf-8?B?UDg0dFBma00wWFhhVVQvd2dqUS9UUkVFV2lXTE5VUGl6dWdsSXROZ0xrT3dW?=
 =?utf-8?B?SzA3aENpaTB4b0ljV1JDWGpveGwwMFZCdnBwc3pGSnA4Zm1MZWlJUUEzVEk3?=
 =?utf-8?B?TklYTXVIdVNJaW1xL0Z5UU11eEkwdGE0TGpTVUJOdksvWUQ2VHRxcUVwNUJR?=
 =?utf-8?B?S0wvS2RRc2NkYlRKOUkxUXZCNXRhTHBIZFlsU1RiMmQ5S005QVlXdjVSK0hM?=
 =?utf-8?B?cDRZOFFOVkxQMmNMN3JTUmltUFlhNzJiMno1Y05GUUNFR3FwWEloVzVEczlh?=
 =?utf-8?B?U1ZGcDQreVl4ZGFYdWsyTXFUUXRKeXA2MVpCY3RrcCsyMlNuWXVUWldVN3Fu?=
 =?utf-8?B?VWU4Z2NsaEIzbjk3TnhVNGFlRUR6ckNKaWVGNEZYSFE4SXlhbHRXa1hlcUVU?=
 =?utf-8?B?dHhKUkZZN2tnY3lYdmxjU2JDczZQNEtkOWRESHk3SlJvdW80ZkYvOGFkRUh2?=
 =?utf-8?B?czRQcysyR0IyR1NOaS9LaFQ1dzBZbUtGd3I0VDgxNVV5MEw2aWFueTJWOTN1?=
 =?utf-8?B?ZEMzajRKN05WR3dmWElsbVFmVGtuWmJGOHhjRE1Fek1GWENYdjlRTVpOZjg3?=
 =?utf-8?B?ZVBYajJ5OXRUWFp1Y2dCOGpmSGRDa01vOUNHN3plWFJhOGhTTWNRLzFWakI0?=
 =?utf-8?B?NzJMR080RkxoRHl0SHZUMnZUMFh1YnJUR0Jna1dNbEptNjhIVE4vNlJCeUJ3?=
 =?utf-8?B?N0djdCtYRXNTeitkaHltcHJobkRJV1RMMEc1c0dIeG8vcEdwcGdxYlpKWGtY?=
 =?utf-8?B?TkV1Q3RNdk1DdlZBUUZURlZQZlNaemFtNFpUWGRMbHdCM3phNitqVGRNa1Fw?=
 =?utf-8?B?SENqOGZxVU5uUU1wakQ1L0MxRnc4Mlcyamo4VjhyeG44VEw4YXo3RDYwaVhC?=
 =?utf-8?B?QjFjVEY5bHU4bjNkVFJHVmt5NmNsd1hNc3BncFdyNGVaajdjcDZOODJkcDN2?=
 =?utf-8?B?Yk5QMGxKaWFsbmVLLzArNVVOd1ZTeUlRTXNJRkZLeTk1b3pvWENMVWVlS09n?=
 =?utf-8?B?Q1lwTWtKK0tYOFg3emNKMmtweThvMHNtVjFTYVpxZFRaNGVvZmlhTHFPZGda?=
 =?utf-8?B?SEYzay9VUldLNjRzMWxQeGVFMmE2SFVZUi9GR3ZQZTZIVmw0aC9JMWpmUU53?=
 =?utf-8?B?c0laYlR2SkVJN3I1NHhhVHN4VHBJSlQxRW9Tc2dTY1RybUZnUktYcHFaWmw1?=
 =?utf-8?B?YWFNZEZpcmhrdi9aRjZxbEdYWHRvSDhXMjB2T2o3YW9Bdy93azhvSU1mWHk4?=
 =?utf-8?B?eUNyTWdTalBBbi90SGJacVNpcnZUQnNkV25WdE1kVlpVVTNNb1hxbVNqbUpQ?=
 =?utf-8?B?SGxjMll0YTFyc2p2VDFIdFRaTG5oZHlnZmVqNGY0eDhLV0lXaFMyRGxDZU9j?=
 =?utf-8?Q?nFXT0xEKOPt1zk74xVA+JBUWw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BfwWPo67pZGtDT8nnpr4wy+m/51Pvq46AU0vCKODP380HoDAmU1xMDDnu8El+VqA7uH97sTywUcNqcOIRGHa9Y8Vf9fiVVsUwy/PpGWdRl7hedeJCHk3WKlmbEug3oNZu9BiKcDOD52mOPL5AaLZDmEbbNWSjcirdoXU0sotZA50gOQCZc3t3WnkTVlm0LRByqhttUfV6+psNFD8UaDJa+ubH5gt2EBDZJ3hvFPEsV2MBHnZsAEyhD7o7TzFhdkkB4B24ige16zxu1wO4e38yGHBM4mMmBFbLNzIOuvbbOHBUR6PefppiQUrC3Zq7teG+lUtSHjz5nbSN3NM5GsHByjx+GdIGcgCtfyBhzHWr8nD73ZVgBs/PPS4W/Pt5AjWe78c1ss8T/eZ/ODqvoh6fpIGEvTFWhAzEGqgajssiPISsxiNfOXlMBF/ia3CLyQeZlAFVSFBo8tALgOapl7sQ357FX3444Y102WXUfwQ0jBltyFmsGqVoMROzZOe84inp0eAEx8A9/Xi7aTu6u7tdmbDWeTA7dBga5NZLTLryxkoOYFc72x4342v9beLp1BiLJzCll3Z4m9rA/Ybeb2cvf0v/1G+GeEELoJqRzw4Ahw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91322211-1809-442c-e73f-08ddc425b8e0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 05:00:45.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1+Dd3nk1UbS3UYR9NruAW48sXHWbYVKgGqxZNZTjxt8wpnYogvMQwlcV8TLZ6l93XQfaSrwJxz/pnE+jAZMWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5817
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 spamscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160042
X-Proofpoint-ORIG-GUID: n9qkXhdyrAFZ-wwXsWiJjQmJE-ZAEyhb
X-Authority-Analysis: v=2.4 cv=Of+YDgTY c=1 sm=1 tr=0 ts=68773202 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7sIe9MKhS_lq--usE5cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: n9qkXhdyrAFZ-wwXsWiJjQmJE-ZAEyhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA0MiBTYWx0ZWRfX37mZQVZxMeV3 a2txCfB69qYtw94v939l9gAZoOEiNH0C0NyykKIxFqMMnkDcdCVrXH6OpV5qpSvlwaxBpfvhfcS h4yR3cvc+R3VXpLf95WT9rstIU/nHEjoEdzBUSWHzR0zVLjc9cq0XEiANfdoWxOsI5+AOy/bWT0
 c4sIOiwmxTFw5/VRlW7X7EhrR+WU0Kg80li+ix/fYWTo/G/ijwGVX3d9JPdU83VC9lU5qsdmmaR Afgud49uaKHmeDc47PmpuHoPNZbXfZzOZFSVKwjS6O3cilkyoKT8fit+xY8AAVEia7goGtKEb30 dDWHcFEdD41BSDGnbAsFrvOBcDgHanqdn5wndpZ3zlNDcE86CmlUKd4SvfbwIXJHFX9/d/afd5I
 KxAsvAC3ghBMwqjGXyJKMN98W6l9k142QCAa2LhjXqheuI+Y2nUZ9y+jyxE2jdFfPjE3cd/n

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
subject to a few comments below.

On 7/15/25 15:50, Kris Van Hees via DTrace-devel wrote:

> If either size of a ternary expression has a tstring value, it can be

s/size/side/

> re-used to store the value of the ternary expression, reducing the
> need for tstring allocation, especially in nested ternaries.
>
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> @@ -222,7 +222,7 @@ typedef struct dt_kern_path {
>    * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
>    *   and a terminating NUL char, or STRSZ + 3 chars altogether
>    */
> -#define DT_TSTRING_SLOTS	4
> +#define DT_TSTRING_SLOTS	6

Same comment as I had for Alan's patch.  The comment block before this 
goes into excruciating detail about why the value should be 4. Whether 
its logic is right or wrong, we cannot leave those old comments with a 
new value.  Why is the value now 6?

I assume 6 is not a "sufficient for all purposes" value.  E.g., if I 
kick up the complexity on tst.tstring_ternary_nested.d, I get:

$ git diff
diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.d 
b/test/unittest/codegen/tst.tstring_ternary_nested.d
@@ -16,6 +16,8 @@ BEGIN {
         trace(x > 1 ? strjoin(strjoin("a", "bc"), strjoin("de", "f")) :
               x > 2 ? strjoin(strjoin("A", "BC"), strjoin("DE", "F")) :
               x > 3 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
+             x > 4 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
+             x > 5 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
               strjoin(strjoin("U", "VW"), strjoin("XY", "Z")));

         exit(0);
$ sudo ./runtest.sh test/unittest/codegen/tst.tstring_ternary_nested.d
test/unittest/codegen/tst.tstring_ternary_nested.d: FAIL: core dumped.
1 cases (0 PASS, 1 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)
$ cat test/log/current/runtest.log
[...]
dtrace: libdtrace/dt_cg.c:1472: dt_cg_tstring_xalloc: Assertion `i < 
DT_TSTRING_SLOTS' failed.

> diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.d b/test/unittest/codegen/tst.tstring_ternary_nested.d
> @@ -0,0 +1,26 @@
> +BEGIN {
> +	x = 42;
> +	trace(x > 1 ? strjoin(strjoin("a", "bc"), strjoin("de", "f")) :
> +	      x > 2 ? strjoin(strjoin("A", "BC"), strjoin("DE", "F")) :
> +	      x > 3 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
> +	      strjoin(strjoin("U", "VW"), strjoin("XY", "Z")));
> +
> +	exit(0);
> +}

I guess that's fine for cg, but the skeptic in me notices that the three 
tests all evaluate to true.  I would think one could run through all 
2x2x2=8 cases in a single test for a little bit more rigor.
