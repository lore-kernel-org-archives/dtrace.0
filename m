Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF591E2315
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 21:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728594228; cv=fail; b=UsHkryHO9c6P/YqKsxXirZQc0y1m/3cKEnk+8hFyLhY6NROH4k3PZvHlbpeeibtizoURgjFH3ZGPq7bVMbhhGfdoKk3xz7B5CBBPEpZMRLgD35PD/Q+dzCF4yKG6QzJa3fNusMyLmP7EKOrYwchbFtnne6ZBxivKaLIqfueSLwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728594228; c=relaxed/simple;
	bh=BxHr0wzMJeuvcMUkowfLq/khBVzgRIyTF2JTEvhBJMI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lXakT4fyfEw5Zo4XURB9v6tLM+XQkZYW7V2rUptfkrg7u95D5I1+QA16fjBw9f0ifw45U9nQS4Toj4TZtN7GoSaptjCGkRa8DbD+vjBxMoQb9MnRmkij13DDy5TvzxYJlf6uI9bgKgXVQzlQWJhfap5WwW7sXm2ZCgpQRnnRwlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SYat0zQ4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=idoyz2uH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SYat0zQ4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="idoyz2uH"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJu6LF018328
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 21:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Sv+h7sE/Kfu0AGO5UKVLih0VOzhDw0wThfRwWaqFXJc=; b=
	SYat0zQ4wEsyrMAXUFHlJm1tjzMCybZ4ro+1oMo71LPIxo1pGR+r7I7JVgQR0bnB
	549rTVImgNjJmAZIr1hHz5MVr23+N2TvGRWnKSIp+PcPmKMGNlgdV9o3rxYb1IOJ
	JquEtZcCzOKrnbFOmxn2ZhMAmNxtI72pzcZPJeLI5pzMmCbTVZ2XsvPK3i7L0BlT
	WBN6/YhcIU1NMI7NQAZZd+T4AZQtRBqukla6sURaxNbemUegGmRsaoD2lsXfaG9C
	ZajwWvhlDiUVWGZutz4yMKmJQW/7duWh3oyJ4+JpQ/UjWfDMRQK/pYebTwyfhj9R
	+P4Vp/qdWpQMHzW8CpX9xg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 422yyvbse1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 21:03:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49AKsY5F027772
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 21:03:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 422uwam93j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 10 Oct 2024 21:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DccZTyuMyEMQM6H3DcPgH7lnWNLIsK0xkRKvAJ92hYQZx033fIhf+RfsPH0RPbsiEC+BsBei1YX0S+guZs/xWHdmKeD/Ez70KWfZaiG1m+OgSU5sJz89BXaDBK8WTIbYplFsogViVjLBUkeJzfWj89T4ObNZRT1OMTX967jNd+j2VgceHSFsJaK1cNYfgxxkg33NLM+q4JoTDRE1qGNralWP70oBEfVmjCIBQ112Y0iNumX7iYfKfENRwwCTfgNtjQFbXIaitpfwvosX7lFbpOIv1/eostuNPQgnbUYqjWGI6PTakkkaAuQmH3loxcEwodJCK/nZ6vaireyhvJSFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv+h7sE/Kfu0AGO5UKVLih0VOzhDw0wThfRwWaqFXJc=;
 b=XyJaNpndlCuPaCFvbrAM05NSf9mof/sezCHPkQslpIoyFjxbiJ6kWbdaL2locxzIyn/wP8Mdt5G5j3fmW7CeH2euqKQdDJLxw5cjZcti+8QJ17KW0PIatgSlUO8bM/c+tCdpkZd0H8ZUjqXIVB4MAnJbGyCD1wDbQJWEDyPso6shJ/woiWFDs7gTYcNYT4y5p3U1ivhUGSHVTd6piobHgVwMQxGsLNVpS7qcKWP/pqsdf/wRuV2ZTVsqD9eg+yZPdk/OScwU7ReBPd0e41BsgiDYq4CP4D9IsJP27MGL4MfjzOCpk8hDRLnBKXoOFy/GabCJTjPMeWg6ovfuYeLIyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv+h7sE/Kfu0AGO5UKVLih0VOzhDw0wThfRwWaqFXJc=;
 b=idoyz2uH3WJYvRReH9+RZKQkCqvYQsmWP0oBJ9lpRSr6SrgyWAaMIoXwuOaVg5btEsnZsiolyd3yCrbUwYMNRkdL2aq6Q19+KK2ibUiXeJgElx72qqLy2F7pbjIBgt4s7R3NWUJSRq0FAXfEuhaBGRlBIv28KNdzCm92o8/oNXA=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by PH8PR10MB6339.namprd10.prod.outlook.com (2603:10b6:510:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 21:03:40 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 21:03:40 +0000
Message-ID: <f39a5b93-5b56-4861-817e-1efd85809ff7@oracle.com>
Date: Thu, 10 Oct 2024 22:03:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH dtrace 0/3] fprobe fallback kprobe support, sched fix
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241009140236.883884-1-alan.maguire@oracle.com>
 <Zwa+m69lJ00WQ7ju@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <Zwa+m69lJ00WQ7ju@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DBBPR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::29) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|PH8PR10MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a86ef9e-2bf9-46e6-077e-08dce96f0477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tno1MU5OOFpXaEhQOG00TEhSSlhZNDRqendscjV5d1lmK0oraGtPQWdGdGkv?=
 =?utf-8?B?TkRkWWNxTXZGcDk2WFl1L0lMcWYrQSttVDJIemdPVnd3THRJQUMzc1BXVTBr?=
 =?utf-8?B?S2lnR3FYbTlyOUVBUEpubjE2ZHBPZ2sxZE1hcXN4R2h2KzdxenF3U2xXbVpu?=
 =?utf-8?B?Y2JQTnVQN0lrL2l0OFdNN0RzOG1zaFJCL0g5RGREWE9GUC9Yb1E5RlJHN2M3?=
 =?utf-8?B?aG5Hc2o1QUZXbmtVeG5nUXJTNFdDVHNXb2l5OTNBb1NvZXdGRVpGanlWNENq?=
 =?utf-8?B?elhRWXFNUVBmcStLcGFWTTZhaVJ1c2IrcVhXYmVvdURiSHFXc250MGZsbTdt?=
 =?utf-8?B?RkhDaEttdEt2RVBnMjduYmhIckxZUGxTMTFaRGpoMUtoMUd1YnVkVHNnUlV5?=
 =?utf-8?B?dCtqVDNOSkd2dHF3b1pZd3NSb0R1Q0c2M1Y4YytsbVRZTkFHaGVIa0h3NGNB?=
 =?utf-8?B?Qkh1d3JVUVhkMGh1K1hzUHBkTzlFWTNFa1FZOUFyRmFzNWtrTUhWQjgvaHZv?=
 =?utf-8?B?MURucHpQUmN3akF1enlCblcrbHB0SmlrUnJiQXdWN2NLaFJHdTcrZFVicWJl?=
 =?utf-8?B?ZVRDYytaUEIrczRLVGFUNFROa09LNE85ZzU4V0s4N3plMHRGMWVLbHVvOUZ4?=
 =?utf-8?B?TXQwY3l5dHF5UW12dkJrOGY0dWxPYWQrSFdZUVlBa1NENjlLdnNhTUNqSlFP?=
 =?utf-8?B?MXl6Mk5NNHdSL1lvN0dBaHRMUkhrOFhuUXVtTWl3L1BIUzlrcmJEbnNsczFy?=
 =?utf-8?B?MnA1T1plSlF6TTBYR21CUGZSell6Ylo1L1BxSVE5bkc0ZlVpRUYya254NEpo?=
 =?utf-8?B?Mk4rQURCbjk5eWFCWUJCL0dmUDJhTWVPcFJqeFo5WnlUNDd5MTduUnZQNjNh?=
 =?utf-8?B?WWRnbzRRQUtud05TRDNCdVU2T25yZ3prdTM4VGZNVVc3Uld5MnJvOEFGYzRD?=
 =?utf-8?B?SEFraFNVc3RrT2daeW40Zk5aZE1aVUVZWDJ3Wm1PYkJvZzI4cG0xcUJEMVRh?=
 =?utf-8?B?eEdNMFNUMzdFTyt4TVUrd3JLMzczclMyMld4TVRNNmZrdWU0QU9QaGVWTDZO?=
 =?utf-8?B?cHJiVVRjVjVOYmlaTTg1bEtLOE82RE9CYXFDRXIxc0s4Q2hRL3pnZnI1WG5K?=
 =?utf-8?B?Z3BibjJvRzRBOUJzN2RocWlDTVJma0lmazhHdDVpbWNHZHoxUXJtSW9ERkxq?=
 =?utf-8?B?Zmc5RkNoWlFQSGt3Z0ZFTXJtSExDalQvRnNXQ0xwaTFDZ28yUmJhTFd3Vjlz?=
 =?utf-8?B?MVdqK3ZuZzVRV3NoeThkNi91ckcvbTE3ZmQ1UVV3Y3ZqcUZpUHJpSzQ4RlRj?=
 =?utf-8?B?KzVGWTlMeUgyb1pHbXdOcm91MHk4b1dMQzFOM0c4aTFaMjZmVVdIQ3NoRjRz?=
 =?utf-8?B?VHc3OHpCcmdpY21VN04zTkpFbzNMcXJnTWlYeDlsZWZ3STcyeHorSjhkM0Jp?=
 =?utf-8?B?WVNRYnFQaWRLb01LMDNrM1FEUzBNMzhoRmk1UkJLWGwwN0VIT3NxOHRxSjZQ?=
 =?utf-8?B?YW9CL1h5VWdJdVhBNWo5Qm1XU2dSeFhDTWt5YXZNRnFVbVpEbG1DdmhNVjln?=
 =?utf-8?B?aWt5VzJKZnU4ckVvdGpXUG9iOUhhMjJXSzRRMHRqanRyVkd0UCtWakZUak9L?=
 =?utf-8?B?WG84Q3VqSFFFQytUL3NSNnk3akpwOUlVaVBoaG4rdmI5Y2M3OXdyczhTRGE4?=
 =?utf-8?B?Tms5a1Vkc2N6Ukl6VytZSTY4MGo0YjZURnRFMWN4bFd3d0lMTkMrY0xnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTU2dENVbktURTkyYXRYK2c0a05XcU9HNGozY0hQRlUwdmJHam9maFRuV2ZS?=
 =?utf-8?B?YkNuejQrTCs4bHJmdHJ6LytsS2htaTl5Vk9VTU10bWVyZmhXbjREMmdpMkdl?=
 =?utf-8?B?T2U3T3hYS29JVDUrL2oxTG1lTWJYTFNTSy9EWWxHMTI1aE1TWmVGcG1MLy82?=
 =?utf-8?B?QlpXeXZYVFNrRElJUnhOTE5paGdzc1k2aStmU21LS2dlbFJCbFB6OElmNENj?=
 =?utf-8?B?bktOZVhNb3BUVVFGSjFJS09nMkdmTHdOS0psQXoyUytlbU8vT3pIRTR0MndC?=
 =?utf-8?B?QjQ5ekdZR0ttT0F2dUdxbzZZYzNXd2VZQS9zNExaMUZLaVFpaG5FM0xpTDFV?=
 =?utf-8?B?YVpIOEpFcXFHb2JTRGtkWnB0M2t2SE03RDdqckhISXlaKytzQWtEMFFLZCtF?=
 =?utf-8?B?NzZmYldiVzBrVkR2bVBZTGc5dzE4VDhDUVBCVVAwOXNWUDUwQm1FaWtoUTVD?=
 =?utf-8?B?S0hLMzZtYXhydEtWVGZxWUxyV3l2L2ZQei9tUjczUTRHRUJqOFZRekZoaFBj?=
 =?utf-8?B?SEplOGxxenZOMWd3UmhpTmhvUWI4RkFzNmdRTEtIeVFHOE1lbkhEZGhLRkhr?=
 =?utf-8?B?RWQ2Wmd2VWR5VXVTUU42QzYvTGswU0cvZTB4dWpqT2N6eEJBTlZONllzUG1Z?=
 =?utf-8?B?bGx2ZDNGMm1wZ1VxUEJaR3ZWa21GT1Zqd0doNzN0Qm1iUDgyRitNRjZQSFFR?=
 =?utf-8?B?RThlUHVaczBqSVNJdFRDQkRIMkhvallHWGtuYVBQNWdXbUtXek51OTFNY29t?=
 =?utf-8?B?eHljZUN4QkFQVWFvL1dHdVljSUsvR0RYWXAyTWs5MFlJeTZTL1dwWG5sOWwr?=
 =?utf-8?B?b1h2anVrVnhaU1VqYUY5U0ZBNGRCNHF3VVBkSXh0R3o3VzN5SkkweVRJMktS?=
 =?utf-8?B?YXNTMlFkckNZaGdEcE14MmJCZHM5NkxnK2lKNzJSeTBYUGZnenNKUXNUaWJX?=
 =?utf-8?B?TkJLcUJoSitPWUIxQXZ1aHR4dU9QVzdmRDVHSEdWRWFDakJHblBWNEJYRmpI?=
 =?utf-8?B?U25ObDNnRyttcTRWK2lsZjJMcXQzMEpOblcvc0pSeGpSWVU3OWNyM2ZtNEEx?=
 =?utf-8?B?OXhWZ0c5VTNoekFTWFl6UVFReFlyRS85eWlQcitKcmpXWXhHZldqY1VEZzJR?=
 =?utf-8?B?YkljTVFKUFh1dVF2VnIyTmJNR1N4TW94dG1xbXdlRzhKYThLeCs1VkIvT2Zu?=
 =?utf-8?B?cFI1MjBXVDYxalVsQXRvLytYeE1pZWQrbEZCWG5nRENROTBCbVN6MCtOTjI0?=
 =?utf-8?B?QXdpT3hCSW8ybHlYRTBHWWducjE3eE52Smo0MkZyZkFZTmY5alBVMGRpMFdY?=
 =?utf-8?B?L0FSc09KekJoRDdsc0hEbDJyL2NyYzZSV0RldjNwZXRDdXpDR3V3NWxGYnA1?=
 =?utf-8?B?aHhlcnZ5TEpxeElJRXNsc3BzYWg4c1Z6dXBKa3M0bWowTzFUbnlrVGROV1dk?=
 =?utf-8?B?TDE3SmlXdG1MdDZvWUJqckNOcEVNWW9VSm9XOEoyWFhVTXJNd1V1cnNjdEtK?=
 =?utf-8?B?MzNRcGp4TXB2R0d5STZ2b21qckJlS3BpZlJ4MU9qRXE4VDh4YjU2OUtzRGM0?=
 =?utf-8?B?T0NWUUJ1V1dKVlRxeHV4R3RVOWp4WTVQQWtqVjBZcyt6TWwxd0lKTi9HRS85?=
 =?utf-8?B?TnpxS291eGlaV21wQU16ZG5SMkZ2UnpHeXA4WWtvbCs2V3dMOEdrQVJ6N2pi?=
 =?utf-8?B?TVN3SGs1RVU0eUc0Nnd1QUhUdmdHVGxENmFqNHRydzFZd0JvNzkrYkx4OTRK?=
 =?utf-8?B?VTNRNUtnWmcyM0F2ekp0STE0d29sTmhlb1poZVZCcHQrMld0UnI5YkNhRWkw?=
 =?utf-8?B?WlRuMHdRM2lCbFh4Rk9KcjJad2ZGdEdGS2QxbTFleUU5NU9sQVhqcWIvN0tw?=
 =?utf-8?B?ZEhQd1hNY2FPQ2NtUGZGQlMvQ0QvWmVlUFZkNXRiN0UzanlJdDNEeFh0SXJV?=
 =?utf-8?B?cVo3L2RDT2dWb2QzTVY5eE9mWTNVQmVuNHM3cmZvaGpXMGc3b0xQQVVBMVVX?=
 =?utf-8?B?c3NKNlZCSXZjbUhvdFVYK3NZelgwNW9FczlsM2FQTXlNemlYNmgzdUNwRFJU?=
 =?utf-8?B?TlZuY3dlU0h6VVJSeGFOdW5IbFo1N2dwanlTKzJzWFlMcVBNL29mQTRXcEh3?=
 =?utf-8?B?K0wrRmwrZmxaQ1RzMmN1VzAvVzJ4MXhuQ2IvMkF0SDZnazlwQTFTWGRCUjVP?=
 =?utf-8?B?ZGtoMkQ0cmxxUG56TEczZFBZR0JGS3FZS2FhOHVJNVNRSzZ6cjNMMWZzTUpj?=
 =?utf-8?B?KzA3VXpUUG1Sd1k5SWRsOHl4RVpBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L5l9lnWxA7+sASZ6IwovXfnou8xZOXT0Ktre07e695shlwpXpFfmN2qhWAedppbtcqYwlovRu10hD4JQQCQzdPc/OySpzNX0sCI4NcGQySmPUpbNEEco4CoYhoON2cYofLY02HzZiZKBQNAnm/oyYCsKmtAVTvw6hG3n04kytEIDN4qxVKNYDmaqtuFDVs/7PK/rp8dI6pwe+iamk/eE2KWhf0m1A9h/iLKH6I/TQCJ4ogonJsQU9eyhmRY1rfWCcfwyznZeVO4ccy1cRzZUjOQQiYHonJ1rtf8AsjztDjG9b0EtrcIE24XyezHYQ1MAIXPD+X8pKHr5fJe0FHG1bE0mZzf91sM8K9IrbDEoovhGX0JEfDxjliGv98rR3RnTA4umAxStuEinCo22S438UI5HtMW/Y5CCkGsy2iDCRFKWcYh5kAOp5ub+cQgYbR02WF5pkXR3WSltL7lU3rPTf1PJA4Uei/rlK6D2UnxYyU2rVEaJxE2jBtji+0ZJ07BezAOcjWnvCBjJnSNKLQNHkC8lQF5heuP/71j3kxnxpVj8eRLnhVDq97MOYfQivXHsSnrDjuGuyCoI/w6NqtSmEcL79wrd6LDM3svOFGxd9PM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a86ef9e-2bf9-46e6-077e-08dce96f0477
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 21:03:40.6976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtvfCRBzH+SINVykh9Lz1ML40XPle4u9NaOMRrpWv9/YT//BB6ZjvNzqTOc4UTVQzNpi+j9MPCM1Ei4wlAI+oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6339
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_15,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410100138
X-Proofpoint-GUID: WyQ-qTbEp9YP9xrR9v4oEjsSNwiNbF-y
X-Proofpoint-ORIG-GUID: WyQ-qTbEp9YP9xrR9v4oEjsSNwiNbF-y

hi Kris

thanks for the detailed explanation! Replies below..

On 09/10/2024 18:34, Kris Van Hees wrote:
> Hi Alan,
> 
> I see what you are doing here and I think that it certainly has merit, but I
> would say that the implementation is breaking some assumptions that are part
> of the provider design in the code base.  The way that a probe is related to
> a provider implementation is rather fundamental and you end up breaking that
> by having a fprobe-backed probe actually use the kprobe implementation.  I am
> thinking how we can establish the same without breaking that association.
> 
> There is also the fact to consider that if we end up attaching a given probe
> both as an fprobe-backed FBT probe and a kprobe-based FBT probe, things can
> get really interesting because the defined order of execution of clauses will
> no longer be satisfied.
> 
> Now, what perhaps could work is if we were to first try to determine whether
> we can use a fprobe-backed for an FBT probe, and if that is not possible, do
> a fall-back to a kprobe-backed probe by removing the probe and re-inserting it
> as a kprobe-backed FBT probe.  Since a probe is associated with a provider by
> a pointer to the provider implementation, that should work.
> 
> It should also still work for probe lookup (though that should no longer be
> taking place at that point in processing) because the lookup code is based
> on the provider name selecting the correct bucket, which can contain probes
> that have that same provider name even if the implementation for them is
> different.
> 
> This way we can never have a probe that is associated with the fprobe
> implementation but really ends up using the kprobe implementation.  The
> association between probe and provider implementation would still be kept
> as-is.
> 
> Do you think that would work?

I've been looking at the code, and the problem I see is that it's hard
to find a place where we can look at the actually _used_ probes (as
opposed to those we populate()) and make determinations around kprobe
support. My first go at this was simply to use the kprobe implementation
for all functions containing a ".". However, as you observed, that could
potentially result in a mix of fprobe and kprobe for a particular probe
context which isn't allowed.

And for programs where a probe participates in multiple contexts we'd
need to worry about whether probe replacement in one then had knock-on
effects for fprobe/kprobe mixing, timing etc. Specifically if we
replaced a fprobe by a kprobe for one clause, we'd need to do the same
for it in other clauses I think.

So I _think_ we're stuck with an either-or; either we can use fprobes
everywhere, or we have to use kprobes everywhere in a program. Is that
the case do you think?

If so, the question then becomes is there a way to iterate over the
actually used fbt probes to make sure they are usable as fprobes; if not
replacing all probes with a kprobe backend. The problem is the only
place I see that is in the compile of the various clauses. We'd need (I
think) some kind of prepare phase where we walk the clauses and figure
out which probes are associated to make this determination. Once we
start compiling clauses, I think it's too late to backpedal and replace
an implementation.

Or are there other places/ways to solve this I'm missing? Thanks!

Alan

> ONe complication I can think of is cases where both func and func.<suffix>
> should be traced when you use an fbt::func:entry (or return) probe.  They
> would both need to be done as kprobes, because (again) we cannot have a mix.
> 
> On Wed, Oct 09, 2024 at 03:02:33PM +0100, Alan Maguire wrote:
>> This series is focused on solving a few issues with fprobe-based
>> attachment which prevent us being able to attach to functions
>> like finish_task_switch.isra.0.  Such functions are present in
>> available_filter_functions, but because they either lack BTF
>> representations or those representations are named without the
>> .isra suffix, attachment via fentry/fexit is currently impossible.
>> Falling back to kprobe attach is the best solution here.
>>
>> However providers have been written with the implicit assumption
>> that certain aspects of the probes are shared across the provider;
>> program type, stack skips etc.  Patch 1 addresses this by providing
>> optional provider implementation callbacks to return these values
>> for a specific probe.  Patch 2 then updates the fbt provider to
>> use these mechanisms to support fallback to kprobe and to support
>> "."-suffixed functions.  Finally patch 3 can then specify
>> fbt::finish_task_switch*:return as the underlying probe for
>> sched:::on-cpu.
>>
>> Tested on upstream, UEK7 (5.15-based kernel) and UEK6 (5.4-based).
>>
>> Alan Maguire (3):
>>   dtrace: add support for probe-specific prog types, stack skips
>>   fbt: support ".isra.0" suffixed functions
>>   sched: fix on-cpu firing for kernels < 5.16
>>
>>  libdtrace/dt_bpf.c         |  4 +-
>>  libdtrace/dt_cc.c          |  2 +-
>>  libdtrace/dt_probe.c       | 16 ++++++++
>>  libdtrace/dt_probe.h       |  2 +
>>  libdtrace/dt_prov_fbt.c    | 84 +++++++++++++++++++++++++++++++-------
>>  libdtrace/dt_prov_rawtp.c  |  2 +-
>>  libdtrace/dt_prov_sched.c  | 23 +----------
>>  libdtrace/dt_prov_sdt.c    |  2 +-
>>  libdtrace/dt_provider.h    |  4 ++
>>  libdtrace/dt_provider_tp.c | 12 +++++-
>>  libdtrace/dt_provider_tp.h |  9 +++-
>>  11 files changed, 117 insertions(+), 43 deletions(-)
>>
>> -- 
>> 2.43.5
>>

