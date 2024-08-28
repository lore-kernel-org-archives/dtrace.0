Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C871A4F0A
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876601; cv=fail; b=R+Q9qMb1O5rEi+ayIH90c1+KKEj+6LsdInZ4RDYm3oA6PCW/y4MIWMzuofeN5qzJB1t2X5eVD3w4twZZEE5aVfTtO8hW36/75JPqMX6veZ26l312iU36ondC0YZ44lo/0wuuQ/NGK652oAFdiKGb/HJf0sL5H1IkoQU6YZ2Xr/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876601; c=relaxed/simple;
	bh=OsvrmdjZpQL+wwZxmfBCMzWr2OzRwMnWzK/t27vlOYo=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VWltePIwGeWgasXVRUCHJDL3YJ7T3/gD0HP44GeEELnjVkG4+7cUczuAKHKTk7qGGn+CG/4E7CDYGwxseykYOBWZviHBTwS/NYDZCEllegNwO6z3SKbMKzrkQeUSfwV/9PysZj7XU3iZvHP6daUQMIPKBSNsFO5sNdXvrTQLCt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Yx5a1KrL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pG+/xCQw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yx5a1KrL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pG+/xCQw"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJXU5q005041
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=BoZOx5FOoBmulRRb01oYnGdGeBu/ehMZbNg/eChg91c=; b=
	Yx5a1KrL7oXL0f9dmhtr4ENJ6PfZNAY5/JOg+JNZuu0A1D1YKrM3KKa67ZG+2NY1
	UHl53eKhHsSekDk6DjqfsmJnkVI9f9znJWniGFkGVhRoVtvm8ru7x9j1t98K4IoA
	ueDkv9TyEvmEIiBf9vBKoHKHY98LXUf0EQld+5rwL659Zg1t8rBtXHJMxsKRMRjN
	Nr0r+DVbW01J4NsQD6KZOZ/XQq+h7VLDThA7/wx3xlhAieyJ5o1/uzQA76fHhlQ9
	H4YnM+TKgy8CmKEz3Q5GvCsX1AK+sDweLyXvB01qBWhf8eOMkSM3V1bD4plTYG2b
	SwU8mPUAq1B6FbuoeiGcqw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pup28nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:23:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SKMiEB016784
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:23:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5u7ykt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 20:23:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZGNTT4CpeGIlQSq3982wYKVqIqyPyFsf8EixOW7Z0F8nrDWeH000/E1lurGlAj2Lp/ezizNKr6QKy/0FNFXcdFiieRqXDduk3LBDjKWSWXAXSm/e+mmBs/rNCxHw36aTLqb/N6lWA9kQUBsRGrA663q/0VxahG+mQmleChLCVpd9PACK4widZ5g+kbmV+SgYCv9tRKjfnub9jS7zQEm48ym/AEVUIES3X+EmMO+UN6MO03bLik14aG8jwYaRDS4wtEN+BZb98Th8Xvk0y6UlW1xb//Bz2+mRh81/0IRuGkXhlvDXPqPPbtXCp+rLuBHQQPI81XPs/i5CKLJat92xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoZOx5FOoBmulRRb01oYnGdGeBu/ehMZbNg/eChg91c=;
 b=SSVqOVZzGZ3o9H+8h8dheV/XILKs9H1YOc1y2UDReucz/sd2YYyOaYcMYnxCVezNjK89yzEysFKJcKn660xp4SehkGv8z7bqDKL4JxVEcb2pHANAHhF29/14XW6zr51GuIJDfqmfxD5Wgkhin1TtdEwITulHcXcf3uQSmxggVloRUSH6Ga2yFdxxCwOsnT372T8b8T/Cw2NJSsMurDx1WZklkYq8wVOglenJKowlAHlS+PCWKRqyAoJULnShRw6BXlPD4V9DU5ghjfp9AQBJxZrVj6y1WGOlsejNCBWxNri7bjL1U37Xyim29b+UvlV6V2DpYjdNlfc2PNNxrGGL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoZOx5FOoBmulRRb01oYnGdGeBu/ehMZbNg/eChg91c=;
 b=pG+/xCQw1PPfxpiRZcbMbd6DzEfgJPiGybyuC+Ft4a/eVKM/QW0FEmpFt3hhROpAO6wcEtHSC3aPxWs/YvI90HwiPAMl06VOF9ncvjlDHBYkpiPig3AIydZWxQkdGHs2cDzi9YpNpbSZdEdGKbKRk8Lv+08kKs01NN/S2rSp5dc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7558.namprd10.prod.outlook.com (2603:10b6:a03:549::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Wed, 28 Aug
 2024 20:23:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Wed, 28 Aug 2024
 20:23:15 +0000
Message-ID: <7223b095-bc2d-108c-7738-584673676e6e@oracle.com>
Date: Wed, 28 Aug 2024 16:23:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 2/8] Reduce stack depth if kernel returns
 NULL frames
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-2-eugene.loh@oracle.com> <ZsPVqitlZpZp2lcA@oracle.com>
 <4098cfc6-ce97-e8e4-28c6-b5306c23e51f@oracle.com>
 <Zs+FzkKIbqs6HSA6@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zs+FzkKIbqs6HSA6@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P302CA0029.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd57344-e4c2-410a-0ae6-08dcc79f3f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0lKS3JxQnRwUVh0RWlFd3N3THNacSt3UkdUNXNCTTU1cStzamRtWHdkUUdB?=
 =?utf-8?B?aFpveXBjWVBoY0E2TnljMUtTUjB2TkRIUnZ1MEhUdkpnYnFITjRFdFFhU1pr?=
 =?utf-8?B?b2ZsdVNzV2p2dmFuVlVxVHBNb2JsbGVzMnZWOU51bEpjQnQrdGxnRzZhbzM0?=
 =?utf-8?B?VjcrZE80MjYxNEJmbmlzRFhRV083dVdVUTBQaFJhK0VkZ0w2SlB4M2RRNXdp?=
 =?utf-8?B?TWRlTStDNW1KQzZtNEZMbTIxdEo3R2d5M2xvMnhScXFoMFNvZngyMUdxbE9t?=
 =?utf-8?B?VDlvbFN5Q3Y0Q1QydTZrTTBDK0xaRi9UT1dqNWEvZnFyRDhheGc4cUkzcVdF?=
 =?utf-8?B?NEk1RS9CUkV5cTU1a2RYelZ6bkxJanlBSEdBNjZla2tTN1BwbHgrbzJpbk0v?=
 =?utf-8?B?Vyt4OGhSaGFIRkE2VjUzRnBXNmRaTGg4blpJamJpd2s5UnVQcDlnTERzRTM1?=
 =?utf-8?B?SFlZdEY3dkdQQUVRWXV6bTk0TThwNFZFajk3SWplSnErK3lTMzV4ZEVEazJ5?=
 =?utf-8?B?aTNWajV1bEM1blJuVEVLLzNORnQ3OXZVUXpYRWJtYmtZM2svdWVXWGtxbU8y?=
 =?utf-8?B?SHo3T1hRQk96a00rNHpJZXZReUlFYSsvNUpSckpqNTR3S2pQVGZ1T0JkMUZH?=
 =?utf-8?B?bVJXakIzbEsxWmZLQUJsKzJjTm1OekFmYnBxMEZNdEs5S29oMk9zeFNuSlNo?=
 =?utf-8?B?TzJST3BvTW9YY2FQdXVBZG9iRnF4N2xVaFM4VnY5YVA5OFNZRm81ck1uTkFx?=
 =?utf-8?B?b3ZBdWovSG83RlNQZFJMV2VOY2dwemFQWmJTU3lOS2JhYVoyZHc1SzY3SXZ3?=
 =?utf-8?B?bnVoeGlSNzRnUXNqYW10ZXdaTy8rWVBiL3BLVU5YTFVJZ1lzTk9kWGRyOGJr?=
 =?utf-8?B?dGxtS3p3REYzdjdDd2dWay8vUVpiRmtGbHNjZXo4WnZBNitzQ2ZvY0o1V3RN?=
 =?utf-8?B?VzJXQVQ1bkRsdkgzR0RpMmJJRWJZVC9OVFlWbFR6cXpYL09YdU4zcjFIbjlK?=
 =?utf-8?B?UHMyMGJGYnpZYUxycE9oRFZWbkEvY21ac0NqYVdVelFlclVJVkZybks5VVpz?=
 =?utf-8?B?ZENDSGQ3TUxOQ1A0c0FIb3VtU09nQ1dzdEltZ1JycXByYWtrN0VqYVZtblVH?=
 =?utf-8?B?SG1OaFJpN0NEaHBGaStkaVFoVWhsVkw0bVV2OGdqbGpzSXNjLzgyZjdJRjB3?=
 =?utf-8?B?R2M2UHJNdzlrUncycTQ5a29jLy9FMmdqd2wwOHNwOXV4WDQweWJJR0tjTFFE?=
 =?utf-8?B?WS8rV1U2NXQ4Q004TkIzOVdaNnlsRURBZHU3dWM1eWNLRytGVnFwcHcwTXBE?=
 =?utf-8?B?UzB6NlArUlJPNWcyVGY0UGYyeVN0dmtGQVJ6d0tJY2FpTHdnbnRiRk9LaDN5?=
 =?utf-8?B?T3plVENFYnNzZm14dWVLZ056c0FVUThSRHZxNVRpamk4NXdMblc3SEhscFhM?=
 =?utf-8?B?SWg2WDZxNU9MR2p0SVN5QWFrd2kwQ2JzN0E0Szk5NGs4ZWE2eXBjcWRZc1RW?=
 =?utf-8?B?RkNCK0ZPcmtXcGN2NjkxWUNMWjhUbmpaeGltcW94ZzhOc2RZWmFWck03SGRV?=
 =?utf-8?B?WjNZMVF6TDNqZk11VS9ybnF2U1lUTTFyZC9yb0tqMjRIWWl0eHVzQWZ1RVpN?=
 =?utf-8?B?TEh0ZmRNR3M2Vzk3Y1VwZktId0ZDWi9XQTRmWkZNODlNY0VZWEpjbENlZnBh?=
 =?utf-8?B?c3NjTERHQ2JlWDhhL0w2bXNkQ2taWHNTcURORGVwSlNLaFB4VWdoMmdUS29L?=
 =?utf-8?B?VS9FN2txZGUyckZJZ2krd3hYc3Vad2s1bjVXenE5YUt3eUhYYlNlUWw1K1Zq?=
 =?utf-8?B?VExQVnp3L0s4YkF1cS82UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVd4bVJNNFBzQlZHSFNLYnFNbk5GVE5UMkJXODF5eitIY3NlVmFSOFVOS0o0?=
 =?utf-8?B?eWtVYUxFV0hjYjhQUiszZklYMmplTC9GUkVzenRQdVpHTGZHc09BalYzRFFO?=
 =?utf-8?B?S2VXbCtGYmVTMHRUekFYYytpTjV2R3hvdlN0ZTZPNHlEcFA4QnlGbmZKRTR0?=
 =?utf-8?B?cjM0enlJVG9oR2lUOVpyZzJ0M0NobExtVXFObkpiQzkzMlpmeUhHYko4WCsr?=
 =?utf-8?B?MzVraHRvaDNYZHdwSStnUmF1Wk1iRDliUno5T0ZDSERaNHNDNXQzd0FPVThF?=
 =?utf-8?B?MUhhWHZWNXNNK1FmMFZFaklENUcxSmpFWVBSSmJ4eHIxWnphcTZxWXFBWGp3?=
 =?utf-8?B?My9jbGN4S29sdlZrWTRFMXZaSk5mRlV4bmhEQzhwNkFCckMzKzUrRW1DM2Ro?=
 =?utf-8?B?cG8vQy9HNGkzTVpyU1VHQTAzV3BROWR0R0tIMkIwWGFMRnp2WWJteWN4Z2pF?=
 =?utf-8?B?OFA4eGR6M3Y4NGlNVnE1dFROb0JraGdPSzFHT1dsMk5BdXMza2tVRitUd3VU?=
 =?utf-8?B?WGh4d0ljMzNSVUZzcXk2bTdaekdGY0k2ZXhQUWFzR3pXVFExelhraFgxREps?=
 =?utf-8?B?dHQ0ajQ0T3RtZ3VGNzdJOEcwNytiQUZHS3YrTERwZHFqZkVMRHp6aTdzdzRH?=
 =?utf-8?B?eWVQenlaWnhlQVN1SzV5RSs3RkJ3RDN5OWp0YVpONzRvajJid0dxNkhiczhV?=
 =?utf-8?B?SVg1ajhHRFFRQVdwNENvVVUybnlkakpCZ1R3WEJvUlo4dFpNWS9GSUMreTQ4?=
 =?utf-8?B?NWxnN3A2cFhSRXBOY2NvalB5RUs0TGFqd1VLaFhnT2NRV2xmTEtQb2tJMk5M?=
 =?utf-8?B?RHF5bzNITFJKUXBOSkp0cEVyQ21FYkt4YUJYT3ZYSXZUdk50YnoreU5LaWh1?=
 =?utf-8?B?UFBtZllaTlpHU1VnRzVMUUMvR0NlZ0JES2NqUElzeFIwMERHQzZTRmhPTGJV?=
 =?utf-8?B?aWVzTkhIMGVndkRmYVR6cGpZcmNMeW91bmlRZ09wejlEbURtLzliQk02VGhh?=
 =?utf-8?B?Mzd3Ull3M3E0bDR3aDVKWHF0YXA2eEVEVk1LZmdYbjhPQ1lRTHh2cm5Zbkdw?=
 =?utf-8?B?UEJhWHRNZTNqOGh2eGdsOE93bzJlUng5QStDSzAwRXVjVlRSQXpBMmsrTGVh?=
 =?utf-8?B?K0huUlJkUkhJOVArNHpyTTVoTHJxREJ4Y3MxeTFWRzcrdjVmRmVBSmhxZldn?=
 =?utf-8?B?Rk1GQUI1QjVib0g2aVJyMnpnblAyN2tETjA2V25BMFdDWGdWK1lvaFp4alda?=
 =?utf-8?B?Uk5mNmM3KzdiYjYxYXBWaU11NmtiWkRVNU9SbFNMZVBablRualZtVnBScEta?=
 =?utf-8?B?TmFSMXl4UHNnTHNJYVN1V0swVjcxMSt6N0ZtVFdHTjJiNUlkTDBYUjZOTFRr?=
 =?utf-8?B?eHpxN051Z1hYRVlZdi8zNmRwbERRUEZmSGtIYUpRWmY1YTUzZW4yUHZ0S2ZM?=
 =?utf-8?B?ZVZXbEdOYWFLSjBZL0dTd3prZ1BnSXFwRk85WG5BcytDR1U1RE95UGdvcEEv?=
 =?utf-8?B?TnBITWNncUlDYkNFWUZSTmFHS2R6UmlRZkJ6UU1iNW13WTdSaDJqdzhyb0dh?=
 =?utf-8?B?U1liUkF3ZzN3Q1drSTY3WWV6bk1WMkJWYkVUWHozdEpjMU1QLzltSU1BSEhj?=
 =?utf-8?B?eDQ1Zy82TE1ubkkwOVVLeUZjQmJrd0wrMzl4L2ZpT1Jyb1pTaXRWRWozTGo1?=
 =?utf-8?B?VHdLSTZQbkpnazg3R0NRYkExTEpNQ0l1Wm9sbTd5SEZIOTFBL0xwMjR5bzIw?=
 =?utf-8?B?bWVqWk0zTUdDN09hQ1JHN0F3dlV6dXBLbllKUDRpTlVwMUNTVWR4Z010Q3VW?=
 =?utf-8?B?bHVmWU9IaEUxZkZkcC9ZQkhMVktVSVh2UUpFN0UyNy9tTFY0UEgxdXp5YlpE?=
 =?utf-8?B?SGJiSEhLZ0RuOHlIV1piOXRmUmFtUU9JVHpIVklNSGRKSDU2WVMrejNzMEFC?=
 =?utf-8?B?bEZWQWhPODZ5RlBNTmhOek5oTGV4SVNMSm5hNkp5bE9tYWJhazRWT0pySDJF?=
 =?utf-8?B?R1Y3ZDBBUzJNa1R3RzZvSDFYVUNpL3RzNnQvNzl2RkFESXR3TG1DMmhtSTR3?=
 =?utf-8?B?Vmgza0ljcXVGdWtmckpoRVRSeUV6QkRJK3JZbHpLbFVoV0NnRWh4WWE2NTFL?=
 =?utf-8?Q?UhkLuGscj8KGz+buulzOWlEC5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bODwihL2UXyqYD7194ldOHlj5nrQyBMaKbyd9tMEFod1zOrLxN7TtnlbeOQo82qXf0AhTdAWn3l8cCC7zDI3zuzLaFsyBhF7gOmkfjYZbKIvci4lF4jCbuNqD41/cb/g2ianBuJnAYsljjLPKGbQNvVqlsN219FPBKhymZijCtyjuuL/Q4RY/aH3xlXOSzREUu4stptCwPOTv4B8aThUqDcLhXXODN5y+V3K95Omn/jG7BEqFnEXzX5fBV/IawXW4UeeDMLv7HmDUS+f4LG7TAT96v8vu00fvLw8291DIsnuBlk8JvMrsdAYKhUaC4AQKQQvXuyL6LI7g0do0C3r93jBr1QQDhxhBt8GTiFUskNpQjByzoi2IdIHMZ9jLpBqbsF83xx1wa9wZkYzeVk/FxL8f+Qbb/zvCCRmt8iZoU9V8OaRd+IkngZX2FOHOehLVyJcifivCfzg/HowX3Efpa6jreH/v9VQfB0g25SVBU2l4e4I2+n2hkj/FUO2MGdr0tblH3hhrwurHAas6mGDJmYL5Mte5koT/LNYJOGDlo6DHvpDCypRfMf03jb43609gGGItK0rzEBX/rtHrxTIcsQCz1bRQVAm7SMLjMaq3sQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd57344-e4c2-410a-0ae6-08dcc79f3f0c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 20:23:15.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSV30Sfoi/8hJ3306jXaqhtwdC3kwcUjEhn0AQWSL2ZYy0jHYQ23EeiEvS7Z5ldWB+5a2duoj33fQ97K/T3a7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7558
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=814
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408280147
X-Proofpoint-ORIG-GUID: Zam5CdgZKxqL6jr5YJ5O1C03--lAvm2S
X-Proofpoint-GUID: Zam5CdgZKxqL6jr5YJ5O1C03--lAvm2S

On 8/28/24 16:17, Kris Van Hees wrote:

> On Wed, Aug 28, 2024 at 04:11:29PM -0400, Eugene Loh wrote:
>> It's been a while, but if I remember correctly it's actually just the other
>> way around.  That is, to make stack and depth consistent, we're forced into
>> this "depth reduction" patch.  Put another way, the stack simply does not
>> include NULL pointers -- there is no way to remove them.
>>
>> E.g., let's say we have a buffer of 8 pointers and we ask for the stack and
>> get back:
>>
>>      0xdead 0xbeef 0xfeed 0xface NULL NULL NULL NULL
>>
>> Looks like 4 pointers.  But we don't count them.  We just use the return
>> value from the helper function.  If it tells us "4", then everything is
>> consistent.  But for some reason (I haven't looked at the code to figure out
>> why), it can be 5 or even 6.  So this patch bumps that value down -- to
>> attain the consistency I think you're asking about.
> So you are saying that the number of values that is actually filled in is not
> consistent with the return value of the bpf_get_stack() helper?  That would
> sound like a kernel bug.

I think there might be a kernel bug.  For a variety of practical reasons, I went with a DTrace workaround (and haven't looked at the kernel code).

