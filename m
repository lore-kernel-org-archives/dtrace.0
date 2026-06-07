Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954852571C0
	for <dtrace@lists.linux.dev>; Sun,  7 Jun 2026 15:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780846853; cv=fail; b=HaNMl0gRMD3pUB4E7MEn3lrgaQUYEjvIQRRdGu2Ylzy1n1JKXXRcmLiV4RSQ4L4YrwaHX7SkUuqH3o8sUfV1se9roqJ5nOsQjXx9TFZqkTFvhCx+O0UQRtqK+P6C0m9ujyTMXvBpPEMziHXras1xSKO/lPkHkX6KaE6IOXjK4MY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780846853; c=relaxed/simple;
	bh=AVZY2ePU0LSjq8lZRnzNFas46SlyIplzhAURP/4TkBM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ThHcFd+NdpxDs38XWJcHzLWDZTxvG5SMYTsqSSdFUszZlgNafEsMpVfLTleCKpy9pDFuPeqfzldC0MsTC+EYkL2p/s8Js/ovhpLEiLdgp7Zb+uTxjNWGqEFINdm2I4l9p5HZVYxa881OA9tTQP4s5UY1EKyAxHTVnBdPS+kz+Ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m0gJhJLj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RHTlzYXD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m0gJhJLj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RHTlzYXD"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6579o5hB2735156
	for <dtrace@lists.linux.dev>; Sun, 7 Jun 2026 15:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=8jqTvFoe1NDWH1oQkGoNitPrnkiMQOgpNwJ39Xq5o+k=; b=
	m0gJhJLjlrVhfUsBTo008wdXcW0IPPpDae52rUS1bFFleEkdM2N8LIG+TCkpC73H
	gVN7D8qpJgxa2gbrkG5hi5vbUxsYAoK1w4BSW7TXReXItmIwlKKlk+rzW0xVaVzT
	yrF9zCfVbC8mFTXUGO3R2mSMqFvavPXTJA7CyDD67FNi2WBYQd0fYDqN+ZypFzSI
	+d4BbpQ0T6442JGe2q9ZAz86+ZY2UyYCxSTkYLpPFklJOMYlMLARMrQ8ugaXmF4k
	EK2lOOa4YTMbn4AjSAXukQuM8PVYzk6cgqZFjxHJEIhA80mp+aPbH7hiW7GOHVh2
	kjNRTzBCDNJ+lhPMCsuUdA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4emab4hc45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 07 Jun 2026 15:40:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 657FXZYt035573
	for <dtrace@lists.linux.dev>; Sun, 7 Jun 2026 15:40:49 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0n08sr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 07 Jun 2026 15:40:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMFgZIUx6q396rB/2hcnzOOZViFAHNPwdGfw8COBtSNQt71mRfkTn8jsw23KEUDeXS/PFqmAfFrtwIhuTNQVNvicX7IWAv4ozQ+FozMKanWkjFdgWZtFfr9Gc3m2JJeeM7xpmp6zJjQXinVcnT6AjVPBnlZ8+bqWaVc/UE2BJybpjz5gS8tlvDSNghqr5ruO9AiC4nu4TqErrmdsAPjVxSzCz7yg8xECdj7EObHe6oBnoaxoWmLqFsHXa1aZkWsk9L2QPe/jtx/i92PUKWZLX9Vo9ruHYUMoT+AHsbiy9spTmJYdwU3hvmNavKhBQ3AK2UelsKpzyHzIWvMMFl3JVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jqTvFoe1NDWH1oQkGoNitPrnkiMQOgpNwJ39Xq5o+k=;
 b=Mu0eH6Xw+wQLSATWiqD5be2OCdOZNRiXd+zcNE6a/dIRc6978qgC1JBoxOd9ylnjiLaDgksQsHPz7iBtLBMBNbcY2tFmpZ4GSUyAMS31faJCaR3TFfZpF27Okj7sBOeB+kcByGn6aPplb7i7YD2kXlpr48O3GNkgxqfkxSe7pFUkS6FV3Z4FXmXCX4nWs1DkmNhVfimnfBMLbuUAEPPmkADHE63PNqkB2Qi1xCoAyVOhRV/ZxaON02dgBQgcCw/xdEzVT6m6uMSDHc35yt2xM6mOrXZP21y9fvRfdwuTutEHyyFoAPSM0fOukAUV9sPOarpSZmTuanbG0kuRJ1cruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jqTvFoe1NDWH1oQkGoNitPrnkiMQOgpNwJ39Xq5o+k=;
 b=RHTlzYXD7NfIA2gIl96LsMcvP1WtxHhcfQLNbVOFnWcys4GyJLB5aOsXz6kpaVEczRyn5ovka4Pbbg5NLyk/KOwcPDqjC+XZzaQgSKGrdj9294bGjw2MyfIsK+6VbjC3e7buEnXlNwTLIMsJ1pLhgGbjNkYZnSIz+odINIDkfvo=
Received: from BN0PR10MB4901.namprd10.prod.outlook.com (2603:10b6:408:126::19)
 by SA1PR10MB6543.namprd10.prod.outlook.com (2603:10b6:806:2bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Sun, 7 Jun 2026
 15:40:46 +0000
Received: from BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79]) by BN0PR10MB4901.namprd10.prod.outlook.com
 ([fe80::19a8:41b4:f519:1b79%3]) with mapi id 15.21.0092.011; Sun, 7 Jun 2026
 15:40:46 +0000
Message-ID: <efea7ffd-fff9-4fac-a463-36731acf7283@oracle.com>
Date: Sun, 7 Jun 2026 16:40:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 3/6] dtrace: add 'probeoff' variable to
 record relative offset of probes
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-4-alan.maguire@oracle.com>
 <aiN6MK8VV1Hh8ZRN@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <aiN6MK8VV1Hh8ZRN@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::7) To BN0PR10MB4901.namprd10.prod.outlook.com
 (2603:10b6:408:126::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB4901:EE_|SA1PR10MB6543:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b83f18-857c-45ab-7843-08dec4ab246c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	klVjjxMYHGpYLVRNHL12Nc6Qd0t8Pvtaj4Dw8bx0aKeFqeMVJ5yWReUOCUjPnTehx17vM0Cu0OyClBGXvjufV5kO+lzT8AYT0fY9MtkGtvl/YLVEPR3HKHlx20dA7U46kra2fRl6PUy014x0+sEszXyt3UPfO/L1XSNqz0AQTySZ/9iMhklUu4NWu7UM+LzE/cTE4IXmRrt0mhvN7V1yONdRsgMRPfygJqc+kDP300Le2OyQtIF8S8mzK5B53PAO66M8ZWpEpQkm4t6YchHPPEY58xfX4wA9vUnn55HeMpRnxO/oAtWHsx8qKyaYnn/uPVp+nnXuTtYO7bkazWb/D+CQrE4LoM4BMo4OB95Zh7SM/kmGzTiaeXxyzXq7uHnqBHjrVSAlGeKDnY92gfuqvRKv5rn5oKIg3ud1yIif5pJ6eiDoYjL1tkKUDuwJpMhnX/mSPsWrNAeIQMPpH0zRvJ03f90edJoWOlrJ0AI4lSGm/b0fG0vSTBK61eE0llJeW80yI4goATFHSH3zmeOTpKOja5RQXMsTANKbltVkmZZIp4bPQ2L1X8I52pQ9BNXoJVI86hmRD4jkW8WwNHECuapCVghYXEotW27Iq6waW4xV4kHYEF6fEr4TQqiKpbN727ketU1SogaAk7c2682AgMoah6GWQ6p3JYPoNCpJn7RiOBS11/QpIRFoWzlEWfHn+VMCKsEniHlAgw4ynfIngg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB4901.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzR1OGpxNUt4L1pYVzRLV29Eb0paMC9kNmJHdmkwWW5mbHY5WjRPSW5BY1VV?=
 =?utf-8?B?NWlhUzBuNDhEWDdkL2Nmc3AxWTRTdFR4ZHZGN0JHaU9NYlpFa2hlR2xXTFJt?=
 =?utf-8?B?cE5sbURydGQ1RFVHWkcvcitVaXNUSGNlS2twOGRCVlpoeVcxWDFodm1TSDlz?=
 =?utf-8?B?K0l3eDNSUGUrL1d2SXFZTEFpS25PVnpIRTAzUnlGekRQWTdkSENHTUhweGhx?=
 =?utf-8?B?Nng1Vk1GY2pWNC96NTZ4djE4ZXpDODEweGwvWXVkS0JYU0wzb1pUYlRpU285?=
 =?utf-8?B?ZWM3Qno5MlNDZjBKcXFqTW91QnVNS0Z3WjJTUEdpZ3ZUVEIvdHY0S0ZsQ1Az?=
 =?utf-8?B?R1J2NWJKTldKTHlzbXIrdHhQd2w3YmpEeGVjYWYwSENVRHpsRTVkdklkaWgy?=
 =?utf-8?B?QlZkV2lua05ENEVnK3k1K0NxdWhCNXpnZENlUnVKa0l6Y1BsZnNtQkZyRHR0?=
 =?utf-8?B?bFZ4MXBveWtiWmVTZjBmNDFRbmhrQkczTFYrUWQzR1cybHRBbWxHbmtYRE1U?=
 =?utf-8?B?ZHNVMUlKR3JuQnhzT0xhVUlqUEF3RGJRVUxITUdNQ3htdHQwTnZVRTBkTVcr?=
 =?utf-8?B?RzZ3MzVKd1U2bU1uYm5vN0tTblNqN1h2T29ja0hlNFBzd1RuRFVzRFRlQVhY?=
 =?utf-8?B?OS9WUHkzcmJ4ejdwbnEvNXA2cElPM2tWQ3ZKYXVIMFhKbi95NUgxTzBVWnZn?=
 =?utf-8?B?aWpwc2h3b3BPdHRpVm81ZUNnWWF3KzU5c3BSNHhhUXcvS2JzbGVVaEQwTklN?=
 =?utf-8?B?WnpIdTZ0Ti9ZQ0lHNnJYdDNmbFBhUHNqZTAwNGJTQXVvSVo2WWZKaUZGZEVy?=
 =?utf-8?B?UWlQRW9mV1FxK3ZkODB5QnZnVHFNeHRCc21mVC9IRkVPdWlrVjk4RklwWnZU?=
 =?utf-8?B?VEp0QmpkTTlPSHBQQzVWNFhFejRVdXd2K1pBc016aGR1ZlVwSDRWWVFaV3dj?=
 =?utf-8?B?RmZIalRGdkFwUW0yVUg1YWhiSm9zQTJVSiszUHJjenJmSGdTcGRzVEpjMFM1?=
 =?utf-8?B?Z0xoYUxaenQ1ZVJCTnVZN0xvV1l1TytQNlJnTmh4OFhNZG9McUZ4RkZTRFFh?=
 =?utf-8?B?NHpmT0hNaHltQ3VKWnNuQUpiUFk2bURMYytWbzVJK0dBc1lCK05LN2lIRnk5?=
 =?utf-8?B?L25mNlRzcUpWdE05b3dLYXprQVE2aEhTbHZJS0dSelU5T0hZblpFOWZyVjhp?=
 =?utf-8?B?a1R4bk9sQnAxTHJMTkpIVUkrK081Y3hFOXAzMXlNN1hQbEVJS1hmRmM3OHRC?=
 =?utf-8?B?U09yYmhEdUdJRVQ3MGUxenl2Z281bldEU29yMXhUOHIxeGJUQnNZN2RhQ29X?=
 =?utf-8?B?b0J4RjArd2VxTktjdElUSHhFUDY4Wlh1RTZuTmlqdGlvTnhIdTk4QldCcUs5?=
 =?utf-8?B?cWJuZ3dVSk5RUkpwMDMxNW9rejRiQllMUEx2Y3BwbHhEaURJS1B2Uk9qRDVR?=
 =?utf-8?B?ZWxZelFBU3BSQStsL3FpaDl1cHc3SjVuZTJjejcvREp6SkFUbEo0UmQ3azRm?=
 =?utf-8?B?cGQ4SkIwSmhYRW5HTnJQZ2xPZy9nTW1tOEV4SFNYcWVCTEJic2NpQktPTXpK?=
 =?utf-8?B?bEFYOUt1eVBIbG9DbFFIclFuZFZmT0hyMGg1VFlFMFlmRSsyd1NuT2pCcmRT?=
 =?utf-8?B?aUtNOWlKd2JTQjZTekV5VWp2RnpjK2t2WExLMzBxWFlzMlNSSk05Sk9LcVQ1?=
 =?utf-8?B?UTdJc01sQit4VW94SkxFckNxbmU0M3RPc1pOUUFRNWtMRmhaYWdyK1VzOVJp?=
 =?utf-8?B?ZzRsV1M2Y0FaS0sxS3BjclBsSGRpelB4ZXMrN0JWZVNjV2N6ZHJ1VnVBVzFV?=
 =?utf-8?B?M25jRmRpU09QSWhNZEYvblNsaGRNKzRBSStCOWdqbHgzWUk4aHpYbmZHYVls?=
 =?utf-8?B?dTNRcFQ1UDZRbVRXUDVwTmh6ZHZKNU90aUw0bFpPZStNQjNSa3hJWnJqUUpF?=
 =?utf-8?B?TEJyUmwzNDkrRTYrano5bGlZSE0zeG5vc0QyT2lTN3hxcStkVlJnZzJaOW1S?=
 =?utf-8?B?bEhUbEJzS29kUklMWG50bDJKT29oWkJoSHJyOUVEZzVtRnl4T0dZMGN4Z3Rp?=
 =?utf-8?B?aElyTllhd0FwY0N2RjZCVjhsdFpOcFMwU2FtR2NuUDFYd2NQNHRRbCtYdzNM?=
 =?utf-8?B?aElHeFQwMENJY1JJRVVhR2xIdVQ0MDZ1STRDdDlEVlhvU0NZNHhUc0svVys1?=
 =?utf-8?B?ZUtwenYrOUpRQkJvMnNFZW1JbXd2UEJJc2hza0lEd00ycUJ1RmI0WC9NNW1E?=
 =?utf-8?B?NUJKckdxa29kT05LaUVKbmFPL01YZHN6MGFFTEhZZkxEYUJ5SWcraGlJOGFl?=
 =?utf-8?B?TTEzbk9RVVNnMFZwMVdxSnJLN3phRjRxOFNPaUZPY2R0ZE50MUdBZz09?=
X-Exchange-RoutingPolicyChecked:
	sXdKyYEq1+i+qr/iitkzBQ1tMclLTX2IajKogz/NXznA8eeN5aSpUdhHAkwlGpqaxHBQigUDMvDH/OLO/GmgxREjevO2mtB5bsmVYrd/YgfWbfPfUPcxhVdldNV5yHjLE+KhSdubGHqJgc4B0TuzYV+x7cF/57J889eWJzPBLMxLmqIQmUrMuTVjw015pJxsz0LiURwj2nGY4V3KSY+qSmqkMjKyRrZGihk8dShHH01VUQVrQNRXiKZ4T2SvXsXZ6dCQurUr3mdod7f/BjYsVrNChKOsicqbMOO9bavSCHLfFV/xxMYUGZi+PkSNK2+dSkNjqEDM0HS964dLV08aRw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EmBvf0+LHNZqTDkwWP0kxK8cCpyom5dnVKE7IOHooERtwfgJkWXFqZku8h81bxcAW0ixQCOclOeSb0hEy9V1cSjeBIN8PP8yuFxOJDgKHA2rG5GKS/WreKCswUyFhuK5pf5deCSTeEfWbbZqnFTa2oY9f1fwv6lHLE0ht+yMmeAOCxB7yM2TjbhBC02yU02FONEi5T8dRHFi3i/e13hs7Fkp2e4NAibKOHzp5Px86CiRjmQxiwKWWlCoKPFTI1EQWvkkZrDN4BDfCvJgkqIxQ125vnjk3pgQpk+pvxdnkksAHjVcUjlzjkcSxDHdU1lVu0n4C5va024TlfEYWxngLyGldN23VBGaWtHi/tG7i97Vgxf1eqJeE1vfnmv2sudPBurejWFR8Tw4lDIQm6cd4CKIu4XYaNdY279y7rcI7fcXUHT7sZs5cArngn+KJ+PuasmLSPFdSlMKGEtecWWZzBwDAdVRnoZXE7FSem1RlKy+Ca5mbmlj4YgjeclAgQruJjd3jqg4Mh4mRtbp0IeF0GnEAblYSpcrg562oEBN+xMkCnsN+RAukr0nN1IiNunOPQ067Evi2LKYWOcp5QuUpAmzeAeWc61kOxfLN6tecfY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b83f18-857c-45ab-7843-08dec4ab246c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB4901.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 15:40:46.5669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gREYWHCViaS6o/ezSoLrdbe+r+2CgI3xvmDpmTkdt66evcSr4zlOvAJP8aNhbdb+EW1Op9t+uArDQ3s3VmgmJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6543
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2605130000 definitions=main-2606070155
X-Authority-Analysis: v=2.4 cv=cL/QdFeN c=1 sm=1 tr=0 ts=6a259102 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8
 a=AmMnlJFzipUqkXL4VlAA:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:13723
X-Proofpoint-GUID: HvXax-z7BvPqGBNlY6uHpnhpm2fhymJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE1NiBTYWx0ZWRfX508DHAYOOadY
 Gp3pzofMaYmBfdIFuXn9xfu7ZpE/2lEfeK77+VJYCj6WtOHbaCHG0Ue6/cR+NioBKRSYH7QQFDs
 Uhqco5FsYJwau6wa0i5tm34atLY4U6l+bpXT7YklFNUSTvpBWysoY/5+bMCOYM3lN+SA0pjxaDO
 EmNPJYFlxylTxRixODpUdnI4Lr4E3Edynjnxg4/RYLL55793tqvmmrkXwlPvuMQ7tqkci4owNFp
 nrDMwAOym+knjUuzdHnh+JbGl7Dsesjbz8aXhZ1jeWM5rRH9/Xi9UyprzhRBtOYh0QpsnO3TEDA
 HC2WIjM1zvB7DlEodWi0mHZMOZ4+ag/I4Ygcz1gisrUbZdUmVHZ7EIhs++rDvYJRhlTPm6QoC8K
 r7hq+SWuljZg6qO5fE5Zxtwioy5ej0fg0ag87l3inIZopa6FM98hj7hliapCoFUt8x6l3qi07VE
 6Z0X5lh6r0vGPtei2Q6LhJC1KRxfAfV7ZGO7v3FI=
X-Proofpoint-ORIG-GUID: HvXax-z7BvPqGBNlY6uHpnhpm2fhymJZ

On 06/06/2026 02:38, Kris Van Hees wrote:
> I think this is too specific to a particular problem.  We already know the
> address of the probe location (the current PC value, unless it is a return
> probe).  What you really seem to want is the base address of the object that
> the probe fired in, and the proposed probeoff is merely a means to get to
> that information.  It would seem more beneficial to add in functionality
> that can give us that base address (base address of the mapping) directly,
> and then it would possibly be useful to also have something that gives us
> the address of the function the probe fired in.
> 
> Introducing built-in variables like modaddr, funcaddr, and perhaps even
> probeaddr for consistency might be a way to go.  Or a (fake) array similar
> to uregs[] and rags[] that can provide this information.
> 
> Anyway, I believe we need to think about it in this direction, because that
> is more generic and certainly would support other uses quite nicely.
>

It might make more sense to not expose the offset since it might confuse
users as to what offset it is - it is the section-relative offset of the
probe used for uprobe attachment. For the purposes of dynamic base address 
computation it would suffice to have it available in the machine state without 
exposing it as a probe variable.

The next patch uses it as a means to computing the base address to inform
uresolve(), but just needs it to be avaialble in the mstate to do so.
 
> On Fri, Jun 05, 2026 at 11:12:14PM +0100, Alan Maguire via DTrace-devel wrote:
>> Record probe offset in machine state and make it accesible
>> via 'probeoff' variable.  Having this is valuable as it will
>> allow dynamic computation of runtime variable offsets by giving
>> us the base address of a library.  For example, we can determine
>> the base address of the python libpython3 library via:
>>
>> python$target:::function-entry
>> {
>> 	base_addr = uregs[R_PC] - probeoff;
>> ...
>>
>> This will handle ASLR and will work for specific targets and
>> system-wide probes.
>>
>> Since uregs[R_PC] will give us the runtime address of the python
>> probe, subtracting probeoff will give us the relative address used
>> at attach time.  For example if 0x7ff925cd7f0d is the uregs
>> program counter value and 0xd7f0d is the probeoff value, we now
>> know the library base address is 0x7ff925c00000.
>>
>> Once we have this, dynamic resolution of variables becomes easy
>> because we just need the symbol table offset for the variable
>> and we can add the library base address computed as above.
>>
>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
>> ---
>>  bpf/get_bvar.c               | 7 +++++++
>>  include/dtrace/dif_defines.h | 1 +
>>  libdtrace/dt_cg.c            | 5 +++++
>>  libdtrace/dt_dctx.h          | 2 ++
>>  libdtrace/dt_open.c          | 2 ++
>>  libdtrace/dt_prov_uprobe.c   | 8 ++++++++
>>  6 files changed, 25 insertions(+)
>>
>> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
>> index 99a6503d..2b53b7d1 100644
>> --- a/bpf/get_bvar.c
>> +++ b/bpf/get_bvar.c
>> @@ -203,6 +203,13 @@ noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
>>  	}
>>  }
>>  
>> +noinline uint64_t dt_bvar_probeoff(const dt_dctx_t *dctx)
>> +{
>> +	dt_mstate_t	*mst = dctx->mst;
>> +
>> +	return mst->proff;
>> +}
>> +
>>  noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
>>  {
>>  	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
>> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
>> index a18614d2..edb98f06 100644
>> --- a/include/dtrace/dif_defines.h
>> +++ b/include/dtrace/dif_defines.h
>> @@ -163,6 +163,7 @@
>>  #define DIF_VAR_ERRNO		0x0120
>>  #define DIF_VAR_CURCPU		0x0121
>>  #define DIF_VAR_EXECARGS	0x0122
>> +#define DIF_VAR_PROBEOFF	0x0123
>>  
>>  #define DIF_SUBR_RAND			0
>>  #define DIF_SUBR_MUTEX_OWNED		1
>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
>> index e97e9abc..1bd73e11 100644
>> --- a/libdtrace/dt_cg.c
>> +++ b/libdtrace/dt_cg.c
>> @@ -288,6 +288,11 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
>>  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
>>  	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
>>  
>> +	/*
>> +	 *	dctx.mst->proff = 0;
>> +	 */
>> +	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_PROFF, 0));
>> +
>>  	/*
>>  	 *	mem = buf + roundup(dtp->dt_maxreclen, 8);
>>  	 *				// add %r0, roundup(dtp->dt_maxreclen,
>> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
>> index 5bf21345..797c8fd2 100644
>> --- a/libdtrace/dt_dctx.h
>> +++ b/libdtrace/dt_dctx.h
>> @@ -30,6 +30,7 @@ typedef struct dt_mstate {
>>  	uint32_t	tag;		/* Tag (for future use) */
>>  	uint32_t	scratch_top;	/* Current top of scratch space */
>>  	int32_t		syscall_errno;	/* syscall errno */
>> +	uint64_t	proff;		/* Probe offset */
>>  	uint64_t	specsize;	/* speculation size */
>>  	uint64_t	scalarizer;	/* used to scalarize pointers */
>>  	uint64_t	fault;		/* DTrace fault flags */
>> @@ -44,6 +45,7 @@ typedef struct dt_mstate {
>>  #define DMST_STID		offsetof(dt_mstate_t, stid)
>>  #define DMST_TAG		offsetof(dt_mstate_t, tag)
>>  #define DMST_SCRATCH_TOP	offsetof(dt_mstate_t, scratch_top)
>> +#define DMST_PROFF		offsetof(dt_mstate_t, proff)
>>  #define DMST_ERRNO		offsetof(dt_mstate_t, syscall_errno)
>>  #define DMST_SPECSIZE		offsetof(dt_mstate_t, specsize)
>>  #define DMST_SCALARIZER		offsetof(dt_mstate_t, scalarizer)
>> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
>> index 30b8758d..ca00788a 100644
>> --- a/libdtrace/dt_open.c
>> +++ b/libdtrace/dt_open.c
>> @@ -240,6 +240,8 @@ static const dt_ident_t _dtrace_globals[] = {
>>  	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
>>  { "probeprov", DT_IDENT_SCALAR, 0, DIF_VAR_PROBEPROV,
>>  	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
>> +{ "probeoff", DT_IDENT_SCALAR, 0, DIF_VAR_PROBEOFF,
>> +	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "uint64_t" },
>>  { "progenyof", DT_IDENT_FUNC, 0, DIF_SUBR_PROGENYOF,
>>  	DT_ATTR_STABCMN, DT_VERS_1_0,
>>  	&dt_idops_func, "int(pid_t)" },
>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>> index b1b852ce..d53b1e43 100644
>> --- a/libdtrace/dt_prov_uprobe.c
>> +++ b/libdtrace/dt_prov_uprobe.c
>> @@ -1392,6 +1392,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>>  	 */
>>  	dt_cg_tramp_copy_regs(pcb);
>>  
>> +	/*
>> +	 * Record the uprobe instrumentation offset in the probe context.
>> +	 * This is the same object-relative offset passed to perf_event_open()
>> +	 * as attr.probe_offset.
>> +	 */
>> +	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, upp->off);
>> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_PROFF, BPF_REG_0));
>> +
>>  	/*
>>  	 * pid probes.
>>  	 *
>> -- 
>> 2.43.5
>>
>>
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel

