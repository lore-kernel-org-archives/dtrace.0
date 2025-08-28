Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A73188734
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756404980; cv=fail; b=NkLKLkhjuIMSUcE2ain0NHzIJXs6/XMX75soKInCAF8gbAAEUs4kSeU+WR660dC0+l6MpOmZBpsatFNkOEzxjCtVSBBCxogr1No7lU/IAkCJNGt7U4j+bl8YcO6sTiPF5ovrW7sKn4x1soZ7Qw74U//zbCJc7tTWlt16MLaNcsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756404980; c=relaxed/simple;
	bh=e1nuXQ8kZFYZ9EG6YflRt1sc28csn2k6DO1jZxufOXk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gKnuzmmfx4Q39j852CesutYnusJuvefBgAijEgLN/+Yxfd7ckUSFbsCBDNw81g1wHDoaadyyTOm62dM7PS1HJgjAfYmy+fS01s19MZfHXkWKphW0EETlQbJOGl4MRQ/uO/yJDdlSdcYZOx/sozBdPEsyesmVlw8n/xqWl+wDl2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VOeGqeIc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LDwky/e2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VOeGqeIc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LDwky/e2"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SHMqhF030390
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=64p9M6QhR/xllAIq2QxPop8Qs95xbQE9YhJfT3oRESk=; b=
	VOeGqeIcYG+ONskoQIINJ8ZdbYjmtlpJzvuMjkcfZLVY25vbqwh5iX7uQf98fGVD
	2Be6WIUX+x2nKZEOpnR+EyUUSHFzu27dwShuPnFwAHom9JJpegl7RK2tzHmJfsw4
	mfpQUHv2t3e0I0MbIigElGeO1eP7d2N5v5Z3sstfMTx/pC0Acg857ue7NFg6iUd6
	Q6M/La/H4o3By7J3bhjTRZsUSQoveOlLRwrd9mZe+oAPoYd9cRiPWyDP+/1XZlmc
	gpLYxun1A2mafVJDiW5eKqAkgPoj3Zx0YJ+YCYnuccpVHdlwECov1fkoB8dK+xBt
	7JDzOi5tzQRS/956KWxOGA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q58s945b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:16:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57SGV0SP012172
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:16:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48q43c74a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 28 Aug 2025 18:16:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCmzZ5A1xURIZ16N9wf1M4Q20R8r5ctujQLjToUw4o3W+WTVDfKJZzEBW4OJhfYWmv6r4o8c8p5qrQFHd7/0JdIj62YPntspdNnV/vC7Edlkw/q8tBg2zegWaOJi5xTq6UdAUtBnnSmk9B4Ee4sR87brYjNb67whXNwoEgB3wTMtC01uObtvQ4Km6rdbkhRKoflYNChdo+F2AHkMbYH9//IXTA64TSE1IJVsVYW65pUwm2KMtXHQbK+PLlSUGIMSp99a4L/TJa2FA+ZX7HMNLSRZTwKjd99JOuDQo9+ueVAvjzHDHB6AOaHZq1GjxDb5CT+3Nry5Wn4Tw5xz8wyaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64p9M6QhR/xllAIq2QxPop8Qs95xbQE9YhJfT3oRESk=;
 b=X++D1UDwQIpGGUKDEoBREzoyT4lODEJJBBxf3RhqtIAXCuPNjaykZZNDdf9gAuWzXmjlxcetWeGleuQEp6Qfgi5U/h7zQCrRxLIfozQdoEulO0Zn7YdthvhidbHCyOgOOTXB+G6kC8LlQyCFX593veuZJZLS2ly/3T5eei/H0SZ9jArxa8gF+RT+qE00MxCBCAO5B0vmTICrvDEmRA8q6jGqvt4aS/fvgH3MqAEY+M25bzOy7WLxnQg9Y6C39HNKR2i44q17NSg6gXzzcc4Pb6ehclYP098yA8jYL0Q/WrwQ+R0oXxpYwGEOQtSXXMP3iIVwv8I6tBU9vY5yM6XzqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64p9M6QhR/xllAIq2QxPop8Qs95xbQE9YhJfT3oRESk=;
 b=LDwky/e2x7s+OqH3dM10vRmao8pKK+9mpeo5CsUm9YXb0Q7sb1FJrrH3Ij+KgAoMCocsantjeAdMzfFYL2d6/AcljGobw6mNfhohpR2bj+393PljDEtHJFjgg+HA5jHV1sGcgcpQMyG3t8pe0IJTkvvaqjHjYEm+FWwrUC3LVUw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM3PPFE51A5CB22.namprd10.prod.outlook.com (2603:10b6:f:fc00::c51) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 18:16:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 18:16:08 +0000
Message-ID: <5d3f969b-885a-753e-43cd-24e7d46c8da3@oracle.com>
Date: Thu, 28 Aug 2025 14:16:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 5/5] test: Add udp to expecetd providers
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250822181629.30972-1-alan.maguire@oracle.com>
 <20250822181629.30972-6-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250822181629.30972-6-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:510:23d::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM3PPFE51A5CB22:EE_
X-MS-Office365-Filtering-Correlation-Id: 14427195-91fb-4e9d-6997-08dde65ef61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REFNRlk1anNTeHRqaDJsNGtHWjJwTmowQ3NTL09kMEl1N3cxbTZLNUlXbm9B?=
 =?utf-8?B?K1Buby9BQ0R3YTQ2REo1Z2FPc1ZnUWYvbG5DazM2bm9ERHVFWmtXejNLNTJ5?=
 =?utf-8?B?bW1sR2RzYkFsVTU5TFNrUzdwam1JTW1JSy9QZ2IwaE1rQnJzd3FjREJOT3ZU?=
 =?utf-8?B?YkNvZ3FKeUtZSXhqSi9nY0ZpL2J2NFNmcVEvMitmUGw4bG52M2ptN0o3Q21U?=
 =?utf-8?B?WldjNGdpbDM5SDJOYVMrd3BMeWhEVm9QN2dsR245MmJqaHZvZzJac2NpT2F6?=
 =?utf-8?B?RUwwTUduSytxa1gyTVdIdyt0Szd3RjFVRHhjYm1nV1E5ZEwwL3ZxakVKd0xx?=
 =?utf-8?B?UmVpVEFmN3h6dk1YM1lQSk53c2pHQVg3NzRVYmRGT0FZSUtwcDJpOGZRbFNE?=
 =?utf-8?B?bkMzNkRQSExkOFBodWFQQUk3VE44cXYvaEFqWHgwQ3lPaC9tZERlWXk0cVZk?=
 =?utf-8?B?RzIvbFFLbXZpTHlJZDRaaU1tVmtDTzZTSFV6bUI4RnpIcUlxczZKN0E4WEFQ?=
 =?utf-8?B?b1dISWhoTU1nSXBmL0l1NUNJWXBObGJFNjFtaUZON3lWWDR3RnNiSDF6UlFR?=
 =?utf-8?B?WG1TU1luRU14TkVmU25zSVNzWVl5T3BVOThjYUlxZ0krb0x3Vjc0VE9KZlRp?=
 =?utf-8?B?SnBzTUx3a1lLYTNSWUxMb0FCWU1vOWFKVWFJTmNEN1R6ZndLOWFsM1crSkxO?=
 =?utf-8?B?cGdhS2NsVUxFSGVoZis5L1hxMUZqZ1NhWU02SXlwNkdLN2ZsamMzN3MxR0U5?=
 =?utf-8?B?UGVyOU9Ub01KRHBEZHlFWTlZUG1SdnJzb0ZBMGFiVnBjZi82dis0cWZadjlt?=
 =?utf-8?B?aFg5K3V3THduQUpGc1RqeW85c1g5TStFYkQxQnRwNFQzcFNkdW9yQzV4M1g4?=
 =?utf-8?B?cFUvaGxnbU5XVU5XejFLb0wvajJ3N3VTdjlQQ0Fmc2pONXNGaWF5aWVKRSs4?=
 =?utf-8?B?VTdnanloSDNSSENjNHJBLzJYdHl4VHZUNUo5SmRhQlFaMXN2dDhxRXlFWTlJ?=
 =?utf-8?B?a0c5SmdFd0lVZjFLTlh2a3Bnd0c3STVacDJPOERlelAxclpwUTI5andnSkpV?=
 =?utf-8?B?cjl0OE5RNThoazdSd2FOZ1k3ck81a3NCL0JDK2ZEMU9oN3hnN0pPbDIrdi9o?=
 =?utf-8?B?UHJDZHd2UWt6WFlMUDZMVzloT0ZwTWVETlZrZGtvMkZRN0xSYktmam9VaDFT?=
 =?utf-8?B?OUFXYlVkZDdxbno4Mmptdzl6MGdMcEpkUnFZN3hjRzBrdHlzRFY5cjlTT0Vl?=
 =?utf-8?B?REhZc2doclRJZXowZGNuTEhWdlViZmFoQlNFTlFxeGc5ejJRcTFkV2VucXlP?=
 =?utf-8?B?TDkxVGUwRjNsczdNb2pFSUxHVmN3cUNoeUdjandVZ2JkbGdEMVFsTU9zNzFQ?=
 =?utf-8?B?R1NPdmNTUDJIcmE4YUZNVFZXbmdWWStpaDE3cE9aTmZOTm5PeWUzQmU0VXJw?=
 =?utf-8?B?a2dDd3hhV2YzZnFQZEdzOGpIeW1VaGRHcGMwOEF4bWREZHMyMmtPa2FmVk14?=
 =?utf-8?B?ZlFQcnB6cHpMNUIvNXJXOTRJdzFZbnJCTFhoNktmSXV3UXhFOUppNGs5ZlRm?=
 =?utf-8?B?QzVqWkY3VThrbkVLTWgrbHA5c1loVkUwRW5oRjFHaTh2cHQ4Qkhybng4MDRU?=
 =?utf-8?B?U0VUMXlCMVJMaHIyNzlSMFh1NlVPa3dpT1AyMzZ5WFJxOTVtK0FCWG1OVzZq?=
 =?utf-8?B?ak1LanlOaUJtTWp2L1o3cEdYaGplZWJkY095VStHZGRWdDZzTkhWc2xFdkpX?=
 =?utf-8?B?enIxbHo5WER6OGhSVXJYZ3krVXpvc29BNDVxMkRzNDN1UHQrTmNLYzJZdUs4?=
 =?utf-8?B?SHFkVmFrdzNBOEpoT2xjSFQ2UFpac0YvWDdPU1ZRS21hQXUvRjVXYlEzNWZu?=
 =?utf-8?B?aUEwTzZTeEgrbFdEKytCZ2RTOFdOV3I1YTZiZHc2QUZtMUZjblE3NGZSeFlk?=
 =?utf-8?Q?1odSCqENL9I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGFLV0JhVEZYOW5oNHVwZXBGNnMzZFlXN1Z0V3NrR044WTkwSTJ2S1libzQw?=
 =?utf-8?B?SUdOWTN4MDlkYW5NSUhOTE1zakRQTkFRQVpwaW1KUnVaZzBrUlBQUyszTHNV?=
 =?utf-8?B?cDF0ajdtd0NkSFBxc2NEOVRoMFpRSVdjWGtGTzYxQUVDenBRbklzNnQvU0JJ?=
 =?utf-8?B?Zy9FOTY5WGhmVGpyQ3JMZGFGcHJoVXk5UnAybHpTTGczUFZEaVRqbHh5TDUy?=
 =?utf-8?B?cGRaTk83Njh5bHpqdExKL1VqYVFla0JLZG9BeC9lazZNR2hRVWN2TnFaR0ha?=
 =?utf-8?B?SmJhYnVCSmJidHlRY0hTbE5VQ2xlL0NtS1Yzd3M3WDQyL2dTQ1FkcUJpL3VC?=
 =?utf-8?B?cU5QRHBtdkdCWkdXak9POWRLaFhXUGdSdkRSbmpheWZiNjJ4TDFmOEZMb1J2?=
 =?utf-8?B?MWNhdGUzOGRKbXo0b3dPMG5pcDFZRlZQanQrQi9uUGNNa2VFT2NKUG9qckxD?=
 =?utf-8?B?b01jLzdhbzNMZDUxelliMEJJK250YlBvWDIzUGxBbnRDV1QxaUtFcWQ3S1hw?=
 =?utf-8?B?YnV0cGIyOHYrTWE5NlhSMEhoQ2pqSCtlOTY4ZlVvMWJjYWc1NXJ1VGhzaWNJ?=
 =?utf-8?B?dHljVW9NNGU1NzJhNDVoMnVicnVuSjJiTk1hWitDbmEya3ZxVXlHY0taSXZ5?=
 =?utf-8?B?b3BmQU13d0ZDNHlIN2xwMUpMZTgxM01pZU85eDM2cFNhQnA5VHJQZXo2OEZw?=
 =?utf-8?B?My9NbHhsMDJvVjd0NWlLNitWVjVPWVRvR3NkaEdjdVYrN2kyM1RGSU1YRlBY?=
 =?utf-8?B?L2t4bVBDTSt2SzA2UDhkSU1kNVdUd0ZDa20ya2k2NVlVeHFpZXl6RzVpVm92?=
 =?utf-8?B?Q28xUXZVaXpIMVZBcnB2YzF6YjA2L2VnUWdYK0dDVkZHNFkwOG43Y2s2emNs?=
 =?utf-8?B?cFd4Rlp1bUxVS1NhSjYzeUpYUytCZkNCVHRRN2IvOWRBMlMvNG5aVVNKZk5J?=
 =?utf-8?B?aEYvaldZSTNKZW5DaGpHc2tzMUpKcEZyU1BqWTU3RzZMV3ZOUVE1ZG8ydmxT?=
 =?utf-8?B?b3Y2VWF6ZFlyT0VoSFhUMEdFdVRVN1p3djVXR2Z5enJSYTYxT3hSdThYUk5l?=
 =?utf-8?B?WDBoY2pEcW1PTnA2N0JUNXhENTZ2Ny9LbFZQMWJpV3BKMW1XZE1QR3JSTVph?=
 =?utf-8?B?dGxHOWRMU2o3aVREcVlrczkxNjg2WVgxVURvOU5VTVo5NGdncWMxbW4zWFJj?=
 =?utf-8?B?bW1MUUlEQlFlQzVBZFg4Y2tyeFEwclBYOWl3d1I0cTQ1TU53WklZQlRJdmtq?=
 =?utf-8?B?SGpMZ1doVEZOcTJmRm5PRVZBbzYyMWgwcFRSc01NNDd3NHNRNHFGc1lWSFBQ?=
 =?utf-8?B?cEZCNitrN0JjMzFEUTZYSTBJbVVoYVlwN0ZVRTBxSFAvcFR6TjRjQ25FbXIv?=
 =?utf-8?B?eFVVZFBDdW9mTHVic3hxOCtvcHhaRDVsQmtTVW5jUGlsUlR4Skg3WTd4NXB5?=
 =?utf-8?B?bDJ4S2hJUHVLRXhPM1prOVM2ZitVb0krVU5qMUpqZWZ6NWtueU1qRXR1d2JC?=
 =?utf-8?B?VlYzZDRXeFpESjFYam9FbGxUSWdyeHFJVU80NDBnS0I2aTdwYjBlc05yM0xQ?=
 =?utf-8?B?TmtRZWNiWThoMVVaRW4yUVBEb0tJNzNnU09YMm1Rd2JxeDJEeGRjaWVQNXpW?=
 =?utf-8?B?MmZXbFlUbTZKQ3JqOHZMci9zbnhWck04RGd3ZWtUVUFaeUxDdGtnVlRHSnla?=
 =?utf-8?B?ZDRIOEljc0JDQk9pM3NkUENUMlVSZUphd1o2MkE4eitaTnAzL0JoVjFIQUdS?=
 =?utf-8?B?c0UvQ3lOb3lXQVpwM0tubXpqQjJZbFZoNlovbjFnTVRGc054Q3hieG1LOW1r?=
 =?utf-8?B?NDRreWZ2VXZrOWlqbWhVRU5hamlxMEdDSXUrVDVXV2gzYVlyaTIwbExJaEpu?=
 =?utf-8?B?eEJ6cnRNRDRhVWRSQ3RVeU5WbXN1ZjNYc1dOOEN4bmg3NENKMWo5YzVGbWhB?=
 =?utf-8?B?Z29qS3pnR01UZFFKM0pINzVTL3lweTROTUlGSWU5QzFHeVQrU1BJcDI4SzJH?=
 =?utf-8?B?VW5tVnF2Q24xQ1NIRWFob25yd1I0Y3VTWEp1aUlsazRwOENNZEdWQ1lUV1h1?=
 =?utf-8?B?R2Z5aFRudGdZRkNMUVNmeUR1ZW4zMkF4MG56OXNrNGVadWFLNkMyaVdiNEk0?=
 =?utf-8?Q?optqVC95rnWL2BKSu/Rxkn6Z3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cPuvEoaG1Ay9DgJr0XYltT9W0vAtUFP6bb06DSioEv+tYchlIKEeQW9CYqdWEhff3CUG6DxwXF5/c923DKmzCjHEco+L8eNbuSBipUaxWOpWihEo213MPZhC4gEY9opfZBA5bJw6u7XelJj4yVS1lT1ITGRzsTpM/8t9aDa1lqZIsVqOs8h6qLk+tCMw2E4PhnlqB4C6cAF2xK4fvPq3jCTB4CjxFAHqS7zYJOa4TpKG87FszmBQv06ErfhZ5Aj9IQAxVu2mppeRvW3ULhGzTbCkEw0D+dmSa6wE1DgfRIlqziq6J2iU8hl4h6oxsnV4cOCz5KumU1mi9hhMvCZ6IP8zv0zQifAP4Q65yDQxIKn50pugDIZGJ0jpT5Oo6jYTlFN56+rWQ/5ptQUILQOUbeb133Pni08y3k9AXAMaXKSQSYqF52m7lCPZYbqM3djXYtxl3oCKUxSyPUZFNmj801ucCElwB7hzNSViHP1IbsH/YVa5lRvRDNYBw1aJmKiuxuvhK5Hn5D4qcdsngzGDAQyV0QrfVhKDVp+vH9kdPrDvhsnJ6C6tbigAGj1sHJrGmg1cc7Z5hD8sc+fMbz4pwll3g6ObmKh9jyr3ehBK+5U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14427195-91fb-4e9d-6997-08dde65ef61c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:16:08.9164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSha1XuATJmOZeS8I87hpYZXUKGLK2UqMCnn5xL4lChDWxY1KiIwZbPT32Lhi4blcMplcAlThi8MXtVMGbI+NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE51A5CB22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508280153
X-Authority-Analysis: v=2.4 cv=J6mq7BnS c=1 sm=1 tr=0 ts=68b09cf2 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=V2k8GJKv3LN8myhmzqUA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-GUID: ehCuojhly_T7qoRJ1HCo1CO8kO-XRqxP
X-Proofpoint-ORIG-GUID: ehCuojhly_T7qoRJ1HCo1CO8kO-XRqxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyNyBTYWx0ZWRfXzA+1NcgvxXhu
 MmuHQR070itDRFNUL7y6B0JzGegtwBrN8ETELhc9ZbVnc1wuWP/ZXDI01moKseIlNjXYsoiD6/u
 G1TS9TSN1VNyD6rC86u8tr5oT0nBsIc0q6hpiVVM093YMbVX1W/u8VoqL4dDaU39lkNFOg3v2Fd
 er04BwpxD0hA/lJEnDTAE0lzI/CKx/cs/bVRjSZYbj7Vamsr8S58tsTmfmYDtQbPsQ97Ej3Ya6z
 cUVjS1ch7XhrRaWDWGwmMWBqvo60BtQexsMBctJgY3qV+5XH22iuhsj1QYvTT5JlmjT7roNomFC
 1GLuOxuVMVZp1rnBamPCAsZCjYZduHa8R8x04ZoLfRmQYmXsXyyreM1hz1OJx2EC/YBIYMnCDdv
 KE+R1mg81YRoIEgnoM9MbHBePusZRw==

s/expecetd/expected/
but really I think this should be squashed to the 1/5 patch.

On 8/22/25 14:16, Alan Maguire via DTrace-devel wrote:
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   test/unittest/dtrace-util/tst.ListProbes.r  | 1 +
>   test/unittest/dtrace-util/tst.ListProbes.sh | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
> index ad557253..a1e185d4 100644
> --- a/test/unittest/dtrace-util/tst.ListProbes.r
> +++ b/test/unittest/dtrace-util/tst.ListProbes.r
> @@ -12,3 +12,4 @@ sched
>   sdt
>   syscall
>   tcp
> +udp
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
> index a747a045..744bb8ad 100755
> --- a/test/unittest/dtrace-util/tst.ListProbes.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbes.sh
> @@ -70,6 +70,7 @@ $dtrace $dt_flags -l \
>       $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
>       $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
>       $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
> +    $2 == "udp"      { mycheck($2, $1,     2,      2); next }	
>       # nothing for usdt
>   
>       # Unrecognized line.
