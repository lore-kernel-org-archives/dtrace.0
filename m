Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0BF2AE74
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 00:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751500930; cv=fail; b=UWQ3SfbrBN0REhb6P/KyNCFSKDhctO2xn47obdprliY8Cf5dDGMfMxeHSNUf3kBLCKTPEv0UK8QmZ2hmnedTKRTxt+3c7VkYUgIHoOKpYygmYNkUC2veEI07sTCuna9CA6eC5x/33RqHtK0laykjlSOq6N/LJlUg+hM203HQ8fs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751500930; c=relaxed/simple;
	bh=jfmDkyNfI5BqMt/Cao8LvAokJjXJqpXFB/IzU7LwzHM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mdSCOA8ETrBRjPnZH+umMqGW6rHebaZLZ6eBXOR0KDRAWdRRxrKZRstcuIMsqNiE4C/AbSf/C0mDJBTEIPO2krNSa0elu/Ah44fnIcR8LBiu/0e0TESJkDRSloeqt/3EqHqyj/0z211bXC5EJKZVLgV1Ojc0sHWCkdjlT6nZtSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h4yi3kAm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q74JkBg5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h4yi3kAm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q74JkBg5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562NfeTr020574
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 00:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pEIXFQKVcT6MV4U068zFRfnYksZR7faI5uZTkWU5Sl8=; b=
	h4yi3kAmkvpkLpT3I2uKs+ifg5VlMEnG7MUvr37fZqFABo7VS94EPsP1vHLm9/Oz
	LlqTSvHOr6xs8Ismfqq+29Jpok7jB2tpwR3jtqXtXScP5W5Hw4J3MmHIp58itaOI
	mr4+AH/0fu7x8WtjgrqK4FkQkQlcAZFlPWUoOOAANcQQ9WvRY7CggfOw3h8c4+Iw
	PSZN4+sU7Q3eL0/Td1wZwfIQcBbMViUQs2pKyHC3IMr5zHUg9+YPp7V/hgIfWuB0
	m8BetbkT/HjG+2Z+j26DJDUhHULKeYfHiMIZZPagU8xrWYBV3rutw/RB1nCAIZVc
	BbnTYhq4dZxVG5kGR/L6Sw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w7ynx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 00:02:06 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562LI6Mi033630
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 00:02:05 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubwa3t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 00:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqE1Ywww+slbVSZWAEM9tujW4WFFINFeYSjTHM0ZPaTXI0xzQ/dKFa2JCBWEoZ5V/c7kO3eriZICzSpNdX4omGKrOdsw6Q+eZUCZ3ytxMrLpZsGHOZdCiDEGA8tRFqrZe4bE3N/wQIbB15xMwy1mvyoxexI0lPf/F/HeQBwwb94qa1EhaRK2d8KXqJxsySbfHrla487z8R80TTwG5u8vSt2I4iGylyzJP+ILj+44ylt0WiTxAHDf2ULHwYS61dWbJ1m4971QdgjVQlBJB5JOpWZ12l9qV1wnR0oU4Mk82M8EMHGnt3NwS8fCWcBqgnurqNRZ5rwQcepfy/IGk3AMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEIXFQKVcT6MV4U068zFRfnYksZR7faI5uZTkWU5Sl8=;
 b=vA82mptRCccGwAUeF4ewFzbbQgJ1KIO7Ln0eBvQ8jaldbiLc+ohHMqDpPeyu/4+IpiR00GjvyF5/RvlrjoF2Van3NcSitul+/j52OFwdllD/hayABpHJR0dlwTXrJpTN3kxgJBBcBWuBSh0fTeVCRDp7cM7V86pq/uWUVvRTtQSmXcl9b0Lc/IceuoDXVw1p8hF4JJq06O5ED1pgXHhxgxLr+wzEzrJfyX1RvHf/IwNbrOCRWmaXloLPEjrmbdxKLCxpTzV8dD/xwjHS+/WRhB5WmEWZjGvnXfm4SBRutC8/nK2CXUWwDXSTh5wrfft1c2NAU1R1IFYgBcBjvwDPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEIXFQKVcT6MV4U068zFRfnYksZR7faI5uZTkWU5Sl8=;
 b=q74JkBg5F8VAJRmxqtb0bX0qlvbd7IokMYAxoQ2X/nzKtxyib/beGsuQkMIjwcIE1DAaCb+NCQngADk0FYxFN3VDQ6SaSaaEWygYvCrM76NbRSIiRbWfs3juN27AyVAw3P7tWsHI43t0VOh0Jhc8vRGEebgILtNURdNuOw/zZ2w=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6139.namprd10.prod.outlook.com (2603:10b6:208:3ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 00:02:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 00:02:02 +0000
Message-ID: <148eabc7-ee00-33fe-b013-0f48fda0163a@oracle.com>
Date: Wed, 2 Jul 2025 20:02:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
 <8ed88a3b-6e37-a696-d6bb-38745c144995@oracle.com>
 <fb5b1e66-a2a5-4dd1-8c58-2477b1ca6894@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <fb5b1e66-a2a5-4dd1-8c58-2477b1ca6894@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e106c7-9fe7-409e-f6ef-08ddb9c4d6c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0J2azN1aTcwbEd0NDdaYlVzdzdPT1lNb3JnWlJ2VU9VRmFDZG9nRnJ4YUN5?=
 =?utf-8?B?ZG9MTExkVmRhNktLVk5IQ2Iyall5K1BGSjlTMGIzYk5qS2FlbWJ5UkQxQjEy?=
 =?utf-8?B?Z0JjUUN2dUVsYzh5U3pmalNQSG9laDVlRW1XZDhBOHVnazFjUUsrR1htb3F2?=
 =?utf-8?B?WlQ1OUwyQkFKNDlSNWQwUFFiN3E3ZklMUDJSTDZVbGIvQjlrOHpzTzFDMHRW?=
 =?utf-8?B?NFNFblZSSk9vU2hucXhPTHJxQStBT044b2wvOFpmcVhnYkx0SFZXK3pyNFFj?=
 =?utf-8?B?V0hsUFBqakpscDYxdGxsOFpBUzExNkkraUsyeXVCR1FRZDNNQmsrQWRqOElk?=
 =?utf-8?B?RGhtMmg0RFBpcUJDVUFPd1E2UWkxeEdKaHhlck1MVCtTOXcwWjZSMEtvVkRT?=
 =?utf-8?B?T1UrNTNNemdVUHZMNGNqdzVKdmxSZmhZUDRKTjJLMG1XTjNibGs0bFZCTFo2?=
 =?utf-8?B?cDVJTEh6aEovUml3elU1QUUvczh1WjljZFIwWW1wL2tXbGVGNUNVV3h5dEtN?=
 =?utf-8?B?TnYvOGNpKzJXQkxVb24zQzNFRGc4eGtyWTZydTV4ay9yYUh4cDNVVDFRYmtD?=
 =?utf-8?B?NXMrVEJnVjByR2xqalZZRmp5MWYrWEs4SC9RQktja2NXeFhWZ0laeFlVYTFZ?=
 =?utf-8?B?ZVRnUHAvRnp4ei9zVjl0NkR4aUJTQTc2bWlJc1A4YWlybVFJbm8rOGVwU2lS?=
 =?utf-8?B?WGc2SUJYMTA0QmNNandnbkUrcDY3RW5MNmJpS2FodjA0enc0cmdSQmJRZ0RW?=
 =?utf-8?B?ZTQrbm5Tc1JIYjdlVXV1MUhRcDhVcHBNcVFXckRJMllXMStmLzdxMDFzcVIr?=
 =?utf-8?B?N0ZBZktxSWttVHFEU3YwdWc5WEhRMElTbUEvQ1c5SFRDbVNwdDFzaU4yeGgv?=
 =?utf-8?B?b2ZoYnB2R0x1R0toMXFVbkc0NmFFTUprQmR2ZkJPcFRRVDBJcWE3NDVTNFJm?=
 =?utf-8?B?T05MbEUvekF6aUxuWXMyOW1tajZnZG1kS0wzSnhETTRlc1VBYVNKNkFOeWlz?=
 =?utf-8?B?U01mNnFFbE9YN1ZEQnphUUtqMkRadlFRcW9MY3ZnYkRnN0RvL2UzVjQyQVdv?=
 =?utf-8?B?dzV1NTc2aS9keC9ucENhNVI3YUpqaEY3YzJlRmsxZ0RWdkZCSjg0c0NtOHB0?=
 =?utf-8?B?c2tIUTNkWElZeUpDY0hqRTIrdEp5a0NKZkt6dDBWeVkyTjRCTktvT2pWN1FP?=
 =?utf-8?B?VlB2NC9RRnh3SFhxWG1iNzFMc3oyK1hDblpDWmZKWnZ1blZvdFk3Z0lsQ0F0?=
 =?utf-8?B?RVpQTUJ1bGZmMkFhV2Y4Zzh5Q211K2RueFJhNEloVWJnZjkzRitaUDVXWERt?=
 =?utf-8?B?d3U1ZWI2aGE5bEpiVHduMXdncWMzY2prT2pFZHJ5MUFZNG03TWNzUTFzRTJm?=
 =?utf-8?B?TUlMZEJEd2UxblBFbGpoaHBtdUpPNHZJVC9sYUpYN0NzSThUNlZ2RzZST21l?=
 =?utf-8?B?eWxodzExUXdrN1R0UWZiOCsvNHVjQm85VU14VmJYbllYY2RrOWpBK1JOdjZ5?=
 =?utf-8?B?eG5uZFkyOGdNaDFKTGg3ZVNZNllzbml6NjN0RTE0TCtwQThsL1NwV2FlcDVO?=
 =?utf-8?B?eTJwVmNuMWcyQS9sbDFMRXMySkJNUXBRcjVmUzNIdFhRdHcwd2kybVBaVWU0?=
 =?utf-8?B?bG1DR2hnQ2lnQUl5ZkI1SElybHlvTy9LRXczbjNnWElnMHdjMUF1V3QrTm0y?=
 =?utf-8?B?bC9SL1E1a2wwOElsSm0yNXowWElMekJoTUhRY1pmbzFXWDkzQzA5WGJjM0Fu?=
 =?utf-8?B?UmZrYXREd1N4QkMwZnBBL0lZK1RjTlQvZ082dEdTdU1YQUFieVBwK1JLSEcr?=
 =?utf-8?B?b1dKeXBpSkNQWFhUbDhGQXBwcUJweXhMTTRsZzd4cjVOUU11Ylo3dXQ1aG02?=
 =?utf-8?B?SkNhdjllZXoxUncrWm5ldTIxUDRMc0o4MnFCWmtnSG8ya0tyK2RETE9ucFNp?=
 =?utf-8?Q?yBQ/CqgHJFY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3pDTTdLbUJ1czZ4N3BWaytpK2FhYjVjb2FTVXA3Skt5WUZObE9qUUp4U2I3?=
 =?utf-8?B?a2dvRi9aamJaOGhKMEV0MjdxeklNdjNmTTkrK25KajN3UVJKUVFKV2NBR2xT?=
 =?utf-8?B?WW9QT2dVMWo4bUJZK3Y4TDdiSXFRckF1L3M3eEZad0VEcUUzYTREOGl0SUs1?=
 =?utf-8?B?SGZzbUgwVGVvaE5qKzZMSktydHlrZi8xaDJpaTV0dTFQYkhUdjZKZEY4M0hT?=
 =?utf-8?B?bmFOUW1KMVVhK2QwTWgrQmhidXNNNi9DdEtwa0RZQU54TElXamFSZXdnRTVw?=
 =?utf-8?B?am5CQ0F6ZTBpQVI4bHYvQVE2QkNDY0J3Wi9qU213VktzcW5VSGo5eU1HZkU1?=
 =?utf-8?B?REdxZmZoYUllbFZ1NU1tSVY3ZUxRS1N6Z0xVWTRKUTV2VWduM2pUS2RTQ2xJ?=
 =?utf-8?B?RVlOVjRzcUhKUmpLWUh6SHJLYStCZnR0dUVkdEp6eksrbXpoTlVxbzZsWkhl?=
 =?utf-8?B?MmRIUlUzNFdDZExnU1hTS0dqRk9abkZEclRHNVI3cGtEOUl3S1V3RDJudEFk?=
 =?utf-8?B?d01kTVgwV0FrRk9LeDNpUkVvQzRnNGF6YjF1eFd6NktIbG5rbU1Hcit1bGdZ?=
 =?utf-8?B?MGZoNEVwU3hURTVhaWszM05jVHhqdjl4Yngxbzk1Uk9ROFo0bGh2d3VtRzM4?=
 =?utf-8?B?NzNvMGFYdjRHQXJrMHF1SU9nN01ENVRvd016ejdvL3E4R052dnVGczRJNFd2?=
 =?utf-8?B?MEVydEhHcStFVGVXR3JaL2hiZS93SUoyWE9WeHpvN3VyWVRvbnI4dk1nb0ZK?=
 =?utf-8?B?bWo3UXU0bHBiNnFMb0thVVFHbWRRT0Z4WnlIZENsVlBjN0ljUWVwejZOMmZv?=
 =?utf-8?B?T05qd2dGelQ3V3J4ck9Cdm1hbzRHZVVEU2F2ZUlhUnFyeXN5em0rck1YSndE?=
 =?utf-8?B?U09tTWRCVGJIaDUrb3NGRmQzVXh6VTc2SCtBSkc5d1BBN3hvODcvOVpOZUZk?=
 =?utf-8?B?aXBBTDlIZXYxZnJRZW5qNk5jODJSS2dZY0hXN2pQNVFsUFVGK0FGNFlXK3F1?=
 =?utf-8?B?M2thNGczNHZaakNIMkdJelUwY0ZVUTJRU0p0OXliRzBCT3B4dUYvZEZiRzF0?=
 =?utf-8?B?bks3UW9JMC9UMG1YRCtkREZFckJteFRZaG9QVXZKbDVkNGN2V2FiNGc5ZTFE?=
 =?utf-8?B?NlRHajkrRC84aGNCMWRocmNHaXNDQTVNcFFBemhtcjhvditrSm5VWTJEOTM5?=
 =?utf-8?B?ajA1N2JLc1ROTTRTNm5leXhDc1hXRndvTkkvWjJEQ3FGQUtmZUhCT0FVcEtG?=
 =?utf-8?B?Y3A1WUNGam1tanZKMGZmNkQ4NStjK3JkTzFYV0FKWUprQ1JYKzkwRVBVRDZu?=
 =?utf-8?B?eDZnTTlQY2l5K1NkUmtMVlNCZi8rL3k3Q2RFUldwK0t1dU56KzZsKzFZMUlD?=
 =?utf-8?B?TWYvR1VyZk82cEdWUGtVVERqT1ZqRk5RV2dzMVp4c1FSQU0rZ1p2YWlJbUF1?=
 =?utf-8?B?NnNzVEowZlgrZzFFSmlRWHdkWnJtTDltQkw5bVQ0aktjRElnbXhkQmpaVXFR?=
 =?utf-8?B?cjQ2cU9CU3BleW44MHJCMGc1YzlhY1BrMjF6ZnVlMnNSck9lYy9BSHRpTG9L?=
 =?utf-8?B?czYrWUF6ajZpUVpGWllGRFBPdlBOanNoWExneHViczVid2k4WGhQNGZhR2hT?=
 =?utf-8?B?dHVTMFc4cDRmaGQ2VWpLUDV4WVRVeERJZCtob1BmRDJrZ1AyTUIxTUVheWdL?=
 =?utf-8?B?clVxRzUzYmcxNXh5N1JhdS9Tb1lHZVU2c1Z4WU9YRTczZ1puVTlZdXhBSFVx?=
 =?utf-8?B?YWxSamgzWHhlN1BoelAwRitrNmQ3ekU0Q3p1a0tCN1pNNHJkUXNlZkZBbjFK?=
 =?utf-8?B?L0tRRW54dnpNbll1TjdUbnlhRGxWNjExczVDSGF5UmlnbUFqN0VJWktlU2I1?=
 =?utf-8?B?clpSUzU2bXE0U1U5Ym13THlPdG5KMUxVcW42VjhMRDVKem9BbWJORy9GTWhN?=
 =?utf-8?B?TlRSTmpUVktXMERpODhIdmJNR2MrQVJGSHdTVU5PTERWS1owTHBWNHpBNXdH?=
 =?utf-8?B?R3dHTFovVjBqcit3cnNQZkhxeHM1eFBnSVRYZUd3aXpVQm1BcTI0M0svZGFO?=
 =?utf-8?B?djVHN010Uk5RWnAyWnMvS3FTY29hOS80ZHJqZk9YV3VZMVJUeTM0bGtsZFBK?=
 =?utf-8?Q?EC55OJqYqqmRQPPiADAIOVtlf?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/wOoz7CwM9V8wI3FN5yKB8HqXDizIMiUUYjf7suvSYgFJvEwx/42bX9RCgPc1Q9qnhIpTm66P6Ot9MQypME+GqAdkMlTfjULuCguZ/GxqcQcB3dLMZ14OFjpz2uQsOe2pEuVnXSV4kiiXUe0/lRWekuqEisU29wwRsoTj7VSxiHVXitAQSpfGpNfN9ZZHdAumjBd3yVxKg4URl9Z1icbu8tehlFUeOEg8GPF/AzFuOwI4ARk1EVOFTa2OKscvC7d2xE1t879xubqijnmMcHth6LwOpSETU48HSd3UOtQ8S37Tr1QMvU1UWv5QxcOszZzOEvLRMNv+udJSOYF/CkqGrLKE110QMd52b6UDiw3GdV6cS8iKGCFBFzhvEQ4frDtwvvxvVt80vMkPjRODfBjyqK0byLDB880YOsFSW1kXXlydqcDkTf6NusuNLZbPuN1aRQUmx0MO8ZRuK1bAyxSn0aUAbmZPL96Kf1yjtPDVPvsGZ+WXvYXiDoD4ifpYL1yN50MIzadjckSe7kkegDGfQ59VDgnwQkuehFxHPpB8uS9nbeJ8dPsPGU1BKvfgcoYFtyDSVndbxzt86bh2uYbMKOtnXXRBC7MLzI7IFIASMg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e106c7-9fe7-409e-f6ef-08ddb9c4d6c7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 00:02:02.6985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2jVw5TFyHq1bNhunbHGHDPYGNIfuDcO/dyEBAE4JFlMdwRRrpbaRjr2whK7Vo7LB3OZoWetSUk7D4DUYof4UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6139
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020200
X-Proofpoint-GUID: GXnsxWfMsDYuH0Xh1w3Is2z62GL0VuJK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDIwMCBTYWx0ZWRfXzSIDvWFtDUFU tCgIN3fqSrydMdjCImo5obbt11AWdp0i/C+/am1Rpw/oS5RrncYD+K+KhdikEJxEbBUYYfXsKub tvtqgLJIXJnqdixGM5sEUkHEJT8Vz1flX9rVzc9OzdrhMoDWIewvZbBOKa+3e0E/cuA6Bj1NWU1
 e78Z6se2/ql+qijl/ph4uy8plvtOMY7BcZ9imKP98oon9bx+Smktic9dOlB4tW1z9H48iM8sOS4 /KbW5ZssTGiBkNQfhN4FsQOAmGThElmTGq8A3mw9CYlVc72tClY9g6QiX7+YRBDCRei+LiXB5F4 vOcZ+sqwVJCnuLHa34KNskyrkjGwqAxObll35+q9bm4X0cP8ig9x7yzdjHFo0yaiBw6nwZXV0AJ
 t1rLylN1/RCRvjmPIDDyGcD2Kws/W5he2/BKolDOin8/BCztRwEF2af7mFmkwVASKyx8iABv
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=6865c87e cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=QUApx0Sia0AI8yfTFlkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: GXnsxWfMsDYuH0Xh1w3Is2z62GL0VuJK

On 7/2/25 11:06, Alan Maguire wrote:

> On 02/07/2025 00:16, Eugene Loh wrote:
>> On most VMs,
>>      test/unittest/tcp/tst.ipv4remotetcp.sh
>>      test/unittest/tcp/tst.ipv4remotetcpstate.sh
>> xfail due to missing remote.  Are we okay with "shrugging our shoulders"
>> like that?
> Yeah, I don't think the remote test is robust enough. Specifically in
> OCI it seems to always fail. I'd suggest we replace it with creating a
> network namespace with IP addresses configured on top of veths to
> simulate the remote case, the codepaths will be the same. I've done this
> in other test suites and it works well.

Sounds great (if "we" is "you", haha).

>> Meanwhile, my one non-OCI VM ran those tests.  The first test passes.
>> The second one consistently reports
>>      -tcp:::state-change to time-wait - yes
>>      +tcp:::state-change to time-wait - no
> I hit some of these failure during development; adding the
> fbt::tcp_time_wait:entry probe helped. Is that inlined or something
> perhaps (grep tcp_time_wait /proc/kallsyms)?

On the VM in question:

# grep -w tcp_time_wait /proc/kallsyms
ffffffff92ad25b0 T tcp_time_wait
# dtrace -lP fbt |& grep tcp_time_wait
49373        fbt           vmlinux                     tcp_time_wait return
49372        fbt           vmlinux                     tcp_time_wait entry
# dtrace -lP rawfbt |& grep tcp_time_wait
51079     rawfbt           vmlinux                     tcp_time_wait return
51078     rawfbt           vmlinux                     tcp_time_wait entry

>> and occasionally reports stuff like
>>      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
>> invalid address (0x1fc0c0000000000) at BPF pc 287
>>      dtrace: error in dt_clause_2 for probe ID 4976 (tcp:vmlinux::send):
>> invalid address (0x225b80000000000) at BPF pc 287
>>
> ah, ok there must be a null deref somewhere. Haven't seen this before;
> what kernel version/arch is this?

5.15.0-300.161.13.el9uek.x86_64

FWIW, I can comment out all probes in tcp other than:

         { "send", DTRACE_PROBESPEC_NAME, 
"rawfbt::ip_send_unicast_reply:entry" },

Then I run

dtrace -c "$testdir/client.ip.pl tcp $dest $tcpport" -qn 'tcp:::send 
/args[2]->ip_saddr == "'$source'"/ { tcpsend++; }'

The disassembly shows that I look up args[2] using dt_bvar_args() 
(including checking for a fault).  Then we try to dereference 
args[2]->ip_saddr.  We first check the pointer is non NULL.  Then we 
call dt_cg_load_scalar() to bpf_probe_read() from the desired location.  
This call is problematic.

>> The non-remote tests fail on OL8 UEK6 (x86 and arm).
>>      dtrace: failed to compile script /dev/stdin:
>>      ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
>> inet_ntoa arg#1 (ipaddr_t *):
>>      Unknown type name
>>
> This is a weird failure; I see it on some systems but not on others.
> In tcp.d we have
>
> #pragma D depends_on library net.d
>
> which contains the typedef for ipaddr_t ; it seems that's not enough to
> pull in the typedef reliably. I suspect there is a timing element
> involved here in when the net.d library is included. Perhaps there is a
> better way to define ipaddr_t ; would using a builtin typedef in
> _dtrace_typedefs_32/64 work better perhaps?

Don't know.

>> The probe names are
>>      tcp:ip:*:*        Solaris
>>      tcp:vmlinux:*:*   DTv1
>>      tcp:vmlinux::*    with this patch (that is, no more function)
>> I guess precedents have already been set for other SDT providers;  so,
>> okay.  Just noting for my own sake.
>> Meanwhile, the typed args[] have changed in number and type from Solaris> to DTv1 to this patch.  Does that merit discussion?
> Hmm, that's not intentional (aside from the additional INBOUND/OUTBOUND
> etc which we use to help inform translation).

Worth mentioning somewhere?

> Do you see other changes aside from them? Thanks!

This is what I have for typed args[] for tcp probes.

The typed probe arguments for probes
         accept-[refused|established]
         connect-[refused|established|request]
         receive
are the same as for send.

The typed probe arguments for state-change may be different.

So, the typed probe arguments are (wide screen, fixed-width font):

args[0]:      args[1]:      args[2]:      args[3]: args[4]:      
args[5]:      args[6]:      args[7]:

             send Solaris         pktinfo_t *   csinfo_t * ipinfo_t *    
tcpsinfo_t *  tcpinfo_t *
             send DTv1            (unknown)     (unknown) (unknown)     
(unknown)     (unknown)     (unknown) int           int
             send DTv2            pktinfo_t *   csinfo_t * ipinfo_t *    
tcpsinfo_t *  tcpinfo_t *   int tcplsinfo_t * int

             state-change Solaris void          csinfo_t * void          
tcpsinfo_t *  void          tcplsinfo_t *
             state-change DTv1    (unknown)     (unknown) (unknown)     
(unknown)     (unknown)     (unknown) int           int
             state-change DTv2    void      *   csinfo_t * void     *    
tcpsinfo_t *  void      *   void * tcplsinfo_t * int

Here, "DTv1" refers to legacy DTrace on Linux.  I guess we can ignore 
that.  By "DTv2" I mean your patch.  For state-change, Solaris calls 
some things "void" (not "void *") and tcplsinfo_t* moves from args[5] to 
args[6].
