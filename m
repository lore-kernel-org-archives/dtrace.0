Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F534B198
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247412; cv=fail; b=mO2A2OUiBQ7tYnmS4HiO+mP5+yWSjyToF+rwMrkAxdLEulrLvG7AiW3jV2lVMusw6MzW3oi8HNZZhZQibUXN41yrpfh8BJetnioxc7S3IW1ugcmfk1iBoiG2nRigeVRvOaCCrrqcwc2Hx8BUrRTmMy0d6ZO7Ilo7R7d3Lk5/5Kc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247412; c=relaxed/simple;
	bh=y3EqsH0K/Fr9xpBHyqdja9sL/OW/hvDFM6KlM6V99Kw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ty25Kx3+KjuIIs1pv8y0oi8VDstEf1SW2W0POa+Q5+VKO1Quwgv6MmUvGWWkt/TNbJMa20A+D9mBbKU0ZOcNAV3Zk2v04A40VMieA6hAh3YfeoiWuvf2DH0urPfq5DlL5WkRHF/GMLj8zWsq63TNbs59qs8XCoQn4eP2OlM7B0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WGca67pg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vjt7AWAe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WGca67pg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vjt7AWAe"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIC14R018335
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=eyP1b1sKyt1Y/y4uAOFsa0xUXAcPDcM++YOfYq4ndGc=; b=
	WGca67pgI6Or73Lqyj1CWuDIu8kR+r1c2Yzl1okBsNR54M3eX20tFvUUgRrgGetZ
	RZaZQnZ2Q3fJTRvVWxVfZcJujV7U5Hr5nEvixlA8v01XwKpljzyB66B0jOTeFMki
	+seJl3nnVg6azEBO7Vg97nx8fGqVXcO2TxpW7QxZbtYML+1uOWPXrVA/hYjkmNq7
	39u5SnfqxLa3LZQkyfUg7LT63JlsPgXYfAKHR3HAxTJU5ZTWy5ZFAH/EBi+BnfCc
	ehZnVO+oZIN6gUg62C7fkH6wHzBIlYkiRlT82j9k7U92/+BXYBCMGBdLw9Qj6cf9
	F+LAokSEWLm9RtVe/zYVTA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49xvcybafw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:23:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59NIKH8K012291
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:23:28 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011048.outbound.protection.outlook.com [52.101.62.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bf7ty5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 23 Oct 2025 19:23:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzD8a3aIPvyIOHISBy2rjkTpHBspRp821lwwiyjUUhQ8JMJ89JS3NAe94q25AL47NtWAqVHeh/7KbygCEgmIOhsUBHekCJXmqSw1FYk4iZJjMAFpQ5yXt5FXybgcyaDZI8zXbeut9PwOe3TjJZ9mbW+uNAFlAvln6Jk6c/aUddRc1pKLGctccJuFaeBROb4IMu9puK1S9k/ZY4FKbOaWm017b/RqFOgfP2WqzHFA1IUaG2iYCCNaEZMnDAucmt5PVsHtGDh8+t4HlrealPjqjVQ06bwVbJUdOu/Mntu1CcfHzDED9Xg6VFdCpIiE1sV5TUtMrFIKzBIOBdfQQP7X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyP1b1sKyt1Y/y4uAOFsa0xUXAcPDcM++YOfYq4ndGc=;
 b=Tr9ZEs1/kiti60HIxdU5xbDbVNqrmwk6prRRzL8qLofl4SLLT4tvCNSj1/WMfHNMraZfSBErgQZY06Tl7+pZpc5MMw4WXbxuIl6XJhH6Qah6QnBKMGnrvljocck5skJ2XW0riLlgSQ8CDVFvzzr3JMkqduOUEhPr6ASh7MZF8j+cUwrJ+12OWRGHEMiAsc64xYsxq0XO2s8NB62BBTDzclXRCBo8Xe39Hdg2/z3lEoWLa76VYkCs985LZACb3AisHtU3dWoRsl0YpFDgDlvZdyOiUqrGXsN++434+ATGw63IpwSRWx0xz4fcKiPTGh/MXp3qURo4QOg7Q0na58c0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyP1b1sKyt1Y/y4uAOFsa0xUXAcPDcM++YOfYq4ndGc=;
 b=vjt7AWAekv7yBoz7ZRjhAv6i74x+IkRnGWXYUGEYeWeBNDLMXJ7kMaFNLVUnFGEkoSRj7aqCf/2+LvDQ2yGsRzqW0LHQT55h+Zkw7lbO0z/8QgFXk4y3p3V2dTcDKfjjsbfKI6JZp2gMhHVJA/eDKAfTyfHkS17M2cyX1LkSvsw=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by DS4PPF376CF97B3.namprd10.prod.outlook.com (2603:10b6:f:fc00::d13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 19:23:20 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%5]) with mapi id 15.20.9228.010; Thu, 23 Oct 2025
 19:23:20 +0000
Message-ID: <accea7fa-348d-45c0-9130-f2def0ba6f32@oracle.com>
Date: Thu, 23 Oct 2025 13:23:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/20] doc: Replace duplicate id
To: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::13) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|DS4PPF376CF97B3:EE_
X-MS-Office365-Filtering-Correlation-Id: bda48dd6-2fe1-4029-2be8-08de12699e3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y25GS1lGcDhMTmx0dXUzczdmc1RwRUo3TVlicGNuaExiUlVEZXk1bkRDbWh5?=
 =?utf-8?B?WEt3MlYyNVhmTU43aWt2R1I3U0VBc3o4TDZidXdMek42UlU0ZElZdVZraFg1?=
 =?utf-8?B?RnlpSGVqTEx6SER5c0Y0M3VUNXYzTStJQnBrSDQzOTIxWHcxZS9naUVZSXFz?=
 =?utf-8?B?OXVYMVlRdDJERU16dU8zS3FsR0JHOUllc1R1bVpmZk43clNCVzhZYVRNQ2tL?=
 =?utf-8?B?dmJwK2hkeEs3SWNkM3FOdnFmRnVsMkhSejZ2NGQ3bWdpOFY1cGtQWDFqYlV1?=
 =?utf-8?B?ZEVlVk5Qa3NGY0FuV0VOMU5tZVhUNG0rcHBweTd3RUY4MDdqK3NNTndsT1ZF?=
 =?utf-8?B?M1JkYUFUMTVidE5iSVVoZ0VOc1ZIUXBuL0l6TkZ3RnhaUk5VQkxJdnZESFlk?=
 =?utf-8?B?RE1hdTdNcjJIZjNOaFZoY2tFanNITVZJMTVEOE5nZlVpWFR2bEZ5RU1XaXdT?=
 =?utf-8?B?cE1ha256bmFzZWE5UkNXMUI5ZW5DTkVyTk5yWk8vQ3N2SzhvMzgwMjZkTlVh?=
 =?utf-8?B?S3hLMXI4U1QwV3MrTk16T2NsUEVudExzZGZweTZPVkdsanFHclVNSy83YlQy?=
 =?utf-8?B?WnB6cTNxSXF5WVkzRDNqSWpsdDBkWFZ4cUtRWkxnKzVYN0lGN2MzNGw3dWpZ?=
 =?utf-8?B?ZTZOMjlrbzRqczhmTkxrMFFZVk80WkkxazRiWG5uTVN2UTFudXltMFpSV1Rr?=
 =?utf-8?B?Smp5S055UWNSRThyMEdsclRtemlFaHlXWkJ6TjNVTlFqaGVGZ0NDWE5YdVVy?=
 =?utf-8?B?MERkYklJYWtHNG5VS3R2OEpUQmI2czNjT21GVVdpRTlBV09NTXh4SERxNXRm?=
 =?utf-8?B?WXJlSEhnbjBzSTN0SiszUm5DSTQxK2s3QkkxdjJMVWNjVUoyNVU0aXB0eWwr?=
 =?utf-8?B?YWJmOWpFUHVCRENPemhlR291L1NFZnlYZHJ1dzJSWlBpZTl2ekQxcGkzaVJE?=
 =?utf-8?B?TXh5NjE1TUVEcE5vZWt3SVZmMmYvSm9vcjdCNTU4TmNzSXJRQzlQYloxT3Rt?=
 =?utf-8?B?ZG1zTC9ucXgwTHI1R1RNUU80cEZpTEdudStIZlkvWmJLUmgwVWxQYkM4a0w2?=
 =?utf-8?B?eW1sZVZMdWozMmxJN0NzMDJFYWlwWTFlUjh2ZDEvZmRnbTdZb2pJT3VMWlhw?=
 =?utf-8?B?RUxUT1dDQlNXa2NVNXJqU25jeExvWWNlUk8yZUcvZTZ5ZGJIaG9GdEtyZFNY?=
 =?utf-8?B?TDE4bDZJM2s2OFN4NFBnU08xQUR4eU5wNmoya0NJa0ovbVQ4amx4RVl3UHdC?=
 =?utf-8?B?bDNhcUkxWm8wbHNrMjdlSWM5QVpKYnBoNE5WZFcwZXN1cW9ydC8waDRPYjRE?=
 =?utf-8?B?K2xFVS83QWh4allLQjVVd2hidERwWnhjZGhCdUhjN3FpMGJtTklkbEMxZ2tO?=
 =?utf-8?B?L0x1TkI5L2grNU1QTitPdkJ1MEsranAvaG5iWkJkcTE3STZJazJaRVNGemZV?=
 =?utf-8?B?VVJ2QmtFWFM4bnVTVzFZT09xWlNndXduSUFidmJydjZ4MURhZTI0bndhamYy?=
 =?utf-8?B?MlN2YWFzTzRHZzVVdkpiSGppbEVLN2x5dEozOXdtWTVoWkpyVEhjWTFoNjZl?=
 =?utf-8?B?Mk5Hak5sOVpmU0RWcVR0c3BLS3F0dFh2WXkyTW0yWmcveDJzcGZta2NZcmxM?=
 =?utf-8?B?QnA0OXpaU2tnZjhwZ3pDQ2tRc1BMQ2Z6blNGb2t6ZkFXWGpnRStCV21PWHEy?=
 =?utf-8?B?R2JtRHFHbm9BMkZLUXdENGVoVGV3dTM4N3RyS0RWVUFYVS9pMHdoSHdZSnN1?=
 =?utf-8?B?di9kRVZ4N2ZUbElvU0RVRzZpQ1ZMc3dkR0FlQ1RPUXJSR1h3dlhnS0hBOFJr?=
 =?utf-8?B?dlpoN1BIZlpoU0wvaXhnbWNvN1lrT0sza3N4dldSalYwSVp1bHVlY1Rxd2Jl?=
 =?utf-8?B?L2x2VVh5SHMzSS9uQUxjbWZsa3BLa2JPeFo4UU42Z1hjbC8vZ3B2SXQxOXND?=
 =?utf-8?Q?VDdAx7st1hS+5w12yjjB5tVXaf4pw0mE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnY2SE1xSnFvMkpLekNwOXdzMXFwdk9vWVZ3R0tTRjNmdDltem11eEZwYWNv?=
 =?utf-8?B?WGh5QUt5S1VtWXFxNmVNQWU0MUNhVUZ0ODVBalcwYVF1bjVBMTNTN2ZIWDZJ?=
 =?utf-8?B?TU8weGdYVmIxNGFkbitrQjRDSXlHUDlkd1A2YUpUa1huYkNRZUdXVlJVc2pr?=
 =?utf-8?B?ZkVIRE9YdlZNQWphYThmeHNoYVRDcktEVEpOblZENjFrR2FnTVpJODFEczU0?=
 =?utf-8?B?Ymp2aTNMcjNrQm5SK1pNa25nVC9vL1dzckxuY20yajJOU2prVWRXaklVbXVs?=
 =?utf-8?B?a1A5SVlRelZMSmNycEQ5Vy9oNXJ5aFYzNExUWndzYjdqeUFIbElvcVZ2Yld3?=
 =?utf-8?B?bEdLQ1N0Wk1yNG5MOVc1cXBka3hJTFdFSFFnOXA2SUFsUVJ5a1NKcFpDRm9v?=
 =?utf-8?B?Wk9uL0pBLzFqM2oxelViQlppaGpsNG5uOFhoT012eGV5WDJyam1MaGZMcU1Y?=
 =?utf-8?B?clUveVEyRnVFNFRYUUdlbDVodzE1TUNzYmNNdFhjMFc2VHVoei9QaFN2VlFZ?=
 =?utf-8?B?U0FGS0hNcHJnQjFhSHNuaFFpeXl4YlBYT3hPVHQzU0hiQ002aDFLLzNLOUF0?=
 =?utf-8?B?MWlQK2FzcnRUaU1ZZnhvVXYxVkRvL0ZDOWgrZ2hHdytHYVhPUllaVHJxYlhO?=
 =?utf-8?B?U0RLOU90L1BneHg1a0NyZ3BONVdmdWNzaWlQSmhvZ3RMamszYXp6RzNBbVpw?=
 =?utf-8?B?TTluSCtBSzE3RnppSDRpNXhFb0dtQmovdzRMbXd1Vy9zU1dOTThZSDl3TUJD?=
 =?utf-8?B?NGZZNExxSjJCV1FWUnV6T1J0V2dBaG9VK0s4V0lpSFc4QjRtaU9EVG9TZm85?=
 =?utf-8?B?VWpNSGQyamN2a0Vndm9tZzVjQjhLN09KcFpnZXhzdVZKdkVSRnR4L2plQUtC?=
 =?utf-8?B?cVlzMHNGWk4vSlNNU3JJWitLUHhleU8wOEFOYmtVaGtSeTdwWlVnYStrNVQw?=
 =?utf-8?B?elc1ME9mUnA4RDR1VzlkR1NFRmRMNmdZVk44SE81R2hWcUNVemJmSmVsWFpF?=
 =?utf-8?B?eXFDWVFUUVR4aFVmT3dmdWE5QzZRTk5IVzZtSFp2NndtQUhJemhhVHhyNHZC?=
 =?utf-8?B?U0JiazE4M1RhRWRWejRsN09UV3A1Z1k1VHdnMnBJVmNvemt1akZJZTJXaVpo?=
 =?utf-8?B?bFdTek03S1BLQmpCbFB3Ly9RWE9maGVxL0o0WGRlaWJNL29DOXNwSEpKMG15?=
 =?utf-8?B?MmN5VEhIZmhqRVo0ems4ZVBWdWRwMXhVMDhld2g4clZXMkV0dFdPSmt1VEpn?=
 =?utf-8?B?WERNR0tuUzdJdzl2NHprYmhJVnA3cnVHSzBRM3Y3NmJwUjczRHFqL2h6ZzJE?=
 =?utf-8?B?R1ZCVk0zNHF4aDBMYnkvSFdRWWtad2JQWkZUT1BOK0p5L1k1TkR6bGxnVDRh?=
 =?utf-8?B?SVdpUTRGdVRYR1hDOHJzQVQ5aTIyODNEOElJNCtVRHJCcm5zcFI1S3dzK05W?=
 =?utf-8?B?OUgxSURLdHVEcEptejBmekdQMkhJNk5GcE1JQ3owRVVlV3AyTVpQMVZFdWl2?=
 =?utf-8?B?NTlZLzJicGZnS1EwUm9TUm4reFhQR3I3QkhRd0lnZXBUZlAzTTVBZmFHSVAx?=
 =?utf-8?B?elZUUTVkaTFiaWs3dmhRK1ZLUWpvL1djUG92OHBpK3k1cW5QNFp1QXZTNDJo?=
 =?utf-8?B?d3NabUxIaVgvY1o0dE9waUlwQm5lellSdlIyZ3Fwd3B6dDF2R2prOURXUTAz?=
 =?utf-8?B?YXZEa1hVcVNaYWNGVWJKQTNCUHFxNGRPNnZKcE9aaXM0eWVFT2FFL3RmUklu?=
 =?utf-8?B?MFNjR01Kd3ZMck1wNUJGZ1J3ZUk4VkNyTnNEN0hwQmh1SjVEL1N3bzBTV3dX?=
 =?utf-8?B?VDZNMnlvOFBEcTBSSE9XMXNLMlBjRUVOT1VSbE5ja2RWbHVNNGh0V0pFMFJa?=
 =?utf-8?B?NksxR29aMFhYWnBSbk1sbHhyVzBEMEpRb1RGV2NYcURSR2sxVFBuWlpLQkJN?=
 =?utf-8?B?Sjg4RkFaMS9NUDVIbHFFd25zazB0UGlCSVFTZVk4WUdseDRCemdGNjdiWjU1?=
 =?utf-8?B?M09NTER0TElmZmlLY05ZOUlvVllGZXJYV0dEM05ZRWpPY1hJeVhpaEowOHVp?=
 =?utf-8?B?bjVockNKeXMzQUVkYVF2N2Z3dlZZMmJqUlBDZkM1WnhZai9kMFFnQmJiM1hM?=
 =?utf-8?B?UGpvbGNSU3JGN1lxUmNvbkdNODU2TC9KUTE1a1ZzM0E4ZjBweTV4T09lWWUr?=
 =?utf-8?Q?Bkl72/DNUYBXcgE3LPGs3HE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QQvRo9+iATAqWUQnIBO0gQJRUQS0HZQq87/6DvrHlXN6qqKeYHQRtqiByQGjcTpOgKSBKK2/V61rQMoq5GgwsgzIWZjoXafjEJg5cSoeJbY5FZjM+qWOsI8sKPp4gjYUahVsWpzuW1xF06Cxldbf8g9MHIolpyNPLyYe4brDn0ueVYJE3Xf4MjOgFvtbOwe0gF8Otgy0sxbsJYCaH9YWyIcYdOyGUU4WXwAAXwOlKbOmBqnLORTP3zh0La3qjj+g4ZaGNRiqX+ms1Bh3QcaXfm4EUWMmUbPRmdlvZ90OLq6kikGJ7lWAXyel5wSZzg5G91rBQDE8p1X2iREKMBQIgPzWEWLDGxw51bRt5y4jjNqc9wAyGwr0Gjz96dssbnR8Y0NeoCyD+64X4CkrQh30H9mwc5l7AS+6n+wiLTBTMYVrKA15mo0I+o0ebFuB6XQRYhj8fLuwCf3ZNPH968IUx2gf6iUCaMVdXHetrFUNQ0xIqmJA8q1ETBqwwS25NiK6KYoHc0KuulwbXwBi6FRQ+bq8BuG9f++zUYLVje6le2ulom/mNvzBjM6oBYmXOU/BqgXrK0TsLKLi+TBMrV0RxpK5MDDRluTYhnJHC+VC9ZY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda48dd6-2fe1-4029-2be8-08de12699e3c
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 19:23:19.0312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSb46VpUkVJrj8TU9o9ExfNffbi8zLqLqew2aHUzOc67HIt7bKjEPdLHboJCjx3I5tdNU0O4Z8CFRYgVM+R1NGluEY4IuHNkHP3PrD6cDg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF376CF97B3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510230178
X-Authority-Analysis: v=2.4 cv=GqlPO01C c=1 sm=1 tr=0 ts=68fa80b2 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=pocrWxXa84N-BMzY-54A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDA3MyBTYWx0ZWRfXxYN25FBdHBGZ
 Xyq1C9DgOvV4GU6o5JWmItxppR1logQfDsHY8VJ4U6q9uplrLcdaYv22i/hCZbpOhb/muCQlpi4
 UCZ86rbW1dhEkLEQdNrg5DwqRJtFcxm4QzYRNQgThqMHUjYFf7MWwEEDbnS8b7Lxs+lvjkq5ZQ0
 BMiC+1Ui8pAWaHJ/UVkXp6v5SYW0bd+KAp1nrZlXLSySzMYeTPYrCAeTxz0koecygIkTBaI/WHJ
 bvxkiKtwBA0+qJq35hdktckrfo7q+8SilepNkNYUbblCNyw2TzTqTAhDmw0ZXBzgrHQMQAO2IdD
 8m2rgpfzJcD0qEUUCbiIJqcXWHK4QeN6QBYQIkqUxLylixSb6HfAKARkzDv5GUX4W+h2ZR6nCp6
 K4w+aFYCD5FtR1wEK3xLHD6FZ3YyhQ==
X-Proofpoint-GUID: jsKv1DCxCEPPk0RSEiH3yv4MBh7nGtjV
X-Proofpoint-ORIG-GUID: jsKv1DCxCEPPk0RSEiH3yv4MBh7nGtjV


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 10/21/25 9:22 PM, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The id has already been defined above.  Replace the second definition.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  doc/userguide/reference/dtrace_builtin_variable_reference.md | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> index c9a7dfebc..607c8f0dd 100644
> --- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
> +++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
> @@ -169,7 +169,7 @@ However, in probe descriptions, macro variables are expanded and concatenated wi
>  
>  Macro variables are only expanded one time within each probe description field and they can't contain probe description delimiters \(`:`\).
>  
> -### Macro Arguments {#dt_macrov_scrpt}
> +### Macro Arguments {#dt_macroa_scrpt}
>  
>  The D compiler also provides a set of macro variables corresponding to any more argument operands that are specified as part of the `dtrace` command invocation. These *macro arguments* are accessed by using the built-in names `$0`, for the name of the D program file or `dtrace` command, `$1`, for the first extra operand, `$2` for the second operand, and so on. If you use the `-s` option, `$0` expands to the value of the name of the input file that's used with this option. For D programs that are specified on the command line, `$0` expands to the value of `argv[0]`, which is used to run the `dtrace` command itself.
>  

