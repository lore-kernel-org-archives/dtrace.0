Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C2921D5B6
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754425327; cv=fail; b=WAl3nYi59tF4ShptjslcJ1TuKe2A7J3SREcFQsWMLUvUl5oovknlQtIYZ5dO8dctxpYyk4y6Ebd1HtuX0YXS53v5s/7/ovmSmetKpznO25bqyTA4jMRkBY6Dpo0Xuz00kcNU+UBUREfxhCGybYmGE3vrf1l4Mp5teF+Ui6l7kz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754425327; c=relaxed/simple;
	bh=DGL/fgbkC4ipI7u9aQRRb0i6afXs5IreLsYEto3F9KU=;
	h=Message-ID:Date:Subject:From:To:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JbaBO9ZkLtAZu6xNBE5JGqKLjKzba9LlM0KqYIi+Nt6aq0IRtG/H8bWtENOSFMFm+0WfcKsms+mLGO3UZLrmumGiaaQF1L3gvew04Ug2DgVu7g4mS38eH7PFK4jaLLKEFyo2u3BTKSuB2IqTHS7ecVVHB4mdIB+r9Z4G4Vb4xPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=je28weon; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hk8iSLF7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="je28weon";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hk8iSLF7"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575KCDPq009330
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 20:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=nati9vxTYtteniLTuLEzM7izAr4SWXj0J/6apisKUNM=; b=
	je28weonbFwlOitqW8rInCpxXjJ3C5Ogq2p8FnN0b/FJBv17XCRAC0lKfs/rz1r9
	KB8l3h94nqahDmdeRFv3jJ/4Hj0NHW4C+niv/aWJjiEuFmEtr+Et0IK2jRj0X2RF
	lrzWtZQvK2ytXopRwB0BGgoOmWEHsCn9NV4ZAJScBale6eMIejlyKwTBivQSDR3k
	6Gf9kaPss8MDZO7SJjx1+Zh2jP1JdxLjDZ1ADQtzHWnjur1GdIDKOR2cz7fId5D3
	FnQNL9miEsWJBsxrpKpSlK8MkCqIHiQCw4KGrAjVdtCZn8vtfzl12Y/hIh2ckbWl
	BcMXck9c5Fr3cP+BF70Ihw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvh08kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 20:22:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575KHlrL031815
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 20:22:03 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010056.outbound.protection.outlook.com [52.101.61.56])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwkcwxt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 20:22:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zL10TQZIFsw0DOlywfSj3bN9THuAhIHSEgIEu4NPSTb4vW5Cnel3g8mR7O7b1PG1A6qLZr4zorf0CGPDnVliuBOFE0IWQ+wUZnAwZ/mMp6nOQeUH1qIgfqM4SmPUE3fz5P6gjz0lA2bYMp+kQNM7Y5jk44ncKUUIf+nZDKEJOwjcYeyl9rSBQkl6KYjkpfDuTNi9+QtqoAy7bBqtXPhOyH0CFfmw2CDRT+9WxSSvkrOfui71ANDeghTJyKuiCYLzzRTg/WDLZJLV7ME2vN6MuTTawiU+vpFhktt7WXZMxgKc+I3zFbMK+krypX1gtIfR1TCUfZaWuxUkQvVTVfMULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nati9vxTYtteniLTuLEzM7izAr4SWXj0J/6apisKUNM=;
 b=Pegl3ci4Hy10DQSDum+NgJsaHL7Jnvnom7Nwvwdvyw27L3VCuBa0d4X2HhFYwbCWhMpWLMxeywUe6S9fma24s5iiszYnGVdh1zey8YFTmLwEgGwN5vlK0e2UngNJVsrQdJJVtYhzsVkMuMbQqhuYzjtKryWtTUq2oOWWgA40JjzVHC5ri1aiv73l02FZ1IpQJ1IADuDf1liOrb+uSxqLdSP0STRaBIamvrylnOAnbaO5zgew+SXXQIuJew0nzjPGexJDlBaHXn6JgVQfjs0K/URMbqbaxHC6hxvXEok7UWzeCqAUGgLVXxLtabBy5/HL+ZGSjWVEwnaYHj1az3P8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nati9vxTYtteniLTuLEzM7izAr4SWXj0J/6apisKUNM=;
 b=Hk8iSLF7dczhdJaYKIyPzS/MvfEJENspbDqevoig3GCxbYvnnBvrb651mzzJonwo/cHeGVmp7NAGpxymaFpKfmBhU0g8j6piVF3AHR8JxH3cJmqQ0NCFxFRDhtxHwRwhroc7ZkFAkyrXvpFSOlZB0V2Z60xEKVJimMYgxYqky/Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH3PPF1189AF8C5.namprd10.prod.outlook.com (2603:10b6:518:1::78a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 20:21:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 20:21:59 +0000
Message-ID: <d4666188-72de-e118-8f56-711a36ba664c@oracle.com>
Date: Tue, 5 Aug 2025 16:21:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] Make sure all probes are listed in default case
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250805190836.18761-1-eugene.loh@oracle.com>
In-Reply-To: <20250805190836.18761-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH3PPF1189AF8C5:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a4b86ed-1a92-4311-e8d0-08ddd45dbac9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amVyN2VqdnhnNGdEeTkxaTA1OVd0YU5aZ1R0VE9Xelg5dnRZL3NQdFA1Rk5E?=
 =?utf-8?B?RnE2a0RPSnEzT3A5R2EyV3FQK2djSmppZTVVdHRiMTJpd0hEcWhyL2g1Qk5V?=
 =?utf-8?B?bkE3Q01ta3EyWE0vQzhpR3RzdGRDVS9tVDF3SHdJQlUyRXZZNkFHVkpmRDZL?=
 =?utf-8?B?aGZUaUlEeVA5eU5Xc0ZsTWxKMUZrVDkyaytQc0c3R2FPMG5ZLzJMM1VPT2Jo?=
 =?utf-8?B?aStMN08rZjY0cGlLZmpIVHY1a0xucXovTURMSlZBYVZwVlY4eUViNGM3LzY1?=
 =?utf-8?B?TjFUSWpMVWpERUdRbk5jSjlwdzNGVzBmczJNMWY2S2s4Vkg3bmZ1V0NmUXow?=
 =?utf-8?B?MW16MnNPT1RRbnhvT01Vc1pyOVZBM1VTTmlHUGxiWlhDTytGQktJdmI1UjUw?=
 =?utf-8?B?VVZ2clRJWVNUYUwwdFpnNEU4MDhvSWd2K0hQeTIxTlYyUTJLOWlDZ3ZXaWZO?=
 =?utf-8?B?Y2VxeTN6MGV4WmJ0YlRoWElhUWwzVDlDUjNMM2RkY1JaMVZuZ3BjUzFDbElB?=
 =?utf-8?B?Q1pZb0xvdzE5aEE5UExPUU1mL0ltS1BCN3dSTHF0SmlkazFUS0VKTjNoQ1Y2?=
 =?utf-8?B?djJBaEJGck9TTEh3NjNPV3QyMjlDOVpzOTZRbk9JQnU5Sjg0MFRBN1hFbXRC?=
 =?utf-8?B?UlNKaDU2OVVmcGh5M0tVY21ZMEVxaUxCbVFWT0RTb3A2ZjE4M2F2NXNMbkZU?=
 =?utf-8?B?MTk2eFQwSDNRY2ovSHk4cHZpTXR1WkpUdGNUd1Q2MHBWWTFrbXVkekNaN0FH?=
 =?utf-8?B?V3owVVJJV2ZWQmJNdzQ5SjZBaWFsMnpwNkF5RHNhMFhhZXRyNmFnYXBjdXV1?=
 =?utf-8?B?cUxwV004UDQxTVNyYWFoR3JlTHhjSkJzSms0cVZvNldLNU5sb3lLOU5MTFJl?=
 =?utf-8?B?SVpqTHlZQnk1UGp1MUZtVEM3RlltbUt4MDV0d3A2eHdwQlpzQU9XOFlGaWpE?=
 =?utf-8?B?cW82RVJkSFNmakFnaEdQU0lxeVJFcTVoMFU1MTBtOUhCeXJNOVBhSTBxT3JF?=
 =?utf-8?B?NTR2cFUzZUdQY21VbHp1SVpEZm4wdmFHaWhNQ0t1cVRqdGdoejV0aFhuVjFi?=
 =?utf-8?B?QXBYK29sRDI0TzhnVURwWWpUMGtaZ3pndElRdzN1d2NmamVZeXVTVzJsU2xE?=
 =?utf-8?B?VS9YWVlRZ1dOdlNMMlhlVG00MGxlRVJDTyszbVZRejJpUDVrKzNZdCtkc3I0?=
 =?utf-8?B?eEtZaFJheHVhT0FXU0JLRHpYTnA4L3ZHRENsRGFBSldwdUVRdEYxNk1qUjFW?=
 =?utf-8?B?RWV6OXpHTU5tSXVrTWEzNnhRYWdvYkh2ODZ1ODR5ZlNBaTBaaGdCWGZSRjQ0?=
 =?utf-8?B?c25hZWpYck5la1Q1MXdMY0JoZWRzcGFWUm12VFJ6b21lblF2WlpIUGdTcDlV?=
 =?utf-8?B?UCtTMDlNUk9DTnNWMjlvVER3U2x3aXZkL0FmTkFKQWFiWEtaKzZnYkl2eDFT?=
 =?utf-8?B?WXluZXdqMlVmY1l0amZJMEJFQjNTUTUvcmRnbDdtYm5KREJJN09vNGs0U2pL?=
 =?utf-8?B?a2MxZzI0dHV5OGNGaUd3b1hjQWRPQmNoWkFuVldMMk9TNXlPL0I5NjJ2cVlN?=
 =?utf-8?B?SEl0dGFxWjgzNWRNVFpUakgrR3BOZ0FjSTRaeVVsSGVEZFE3NzR2OHNlb2d1?=
 =?utf-8?B?b0lCZVFvQlorOFQ5NERtcDRGVk82QXdXWnZ5SVJxSUErZWYvT1N4d0ljbDRw?=
 =?utf-8?B?ckYydDlQSURpZGR3SlZPeUJPckpBVHV1ZUZmUmdrbDA2SStOZzF2UG83eUhK?=
 =?utf-8?B?bHVGT2hic2RjZzNTOFE4YlBTWi9TR21Ba3FCeGp6d3lDWVluRW1ubzVjUDBO?=
 =?utf-8?B?a0hWSWN2L2o4ZS9IbmY4Q1ZYZDRuV0hpUlAyNDZUcEpzVnFKUHlMQlE0OURu?=
 =?utf-8?B?Nk55RFZJcXpuK1FxRXJ0cmRWWnVSNHBmT1JOWUd2QnJvOVFkOXMyK1NPdnEr?=
 =?utf-8?Q?quZmg6e664M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDZxRVhJQ0FqVURCeFJ3bG9YSW5Lc2hqYWdrcWJnd25LbG1SMmR6UzdxbWJM?=
 =?utf-8?B?VmFCRkNrTHVBM0NSVlN4VjhLTFhJMTlJUUtvTU9PZy9ja3hKOGkyS0Y4Tmha?=
 =?utf-8?B?amxDSTRrZXVYdUFTaU5tRy9yNWZlK0U3eVFTWHZvQTF0VTZUbGl1d3hyYi9a?=
 =?utf-8?B?SHVlSUtJQ2UxSFB3RjNVb29rRENDOFYrZS8vZHNWSnMvU2RDNDhQckY3bFRs?=
 =?utf-8?B?VnVDbWdhSmZrNG5XMCtrazRWL1pSdit1RU9sV3UybGN5UWdUQ1UyYllwREdG?=
 =?utf-8?B?cG54d1lMOWYzMHpHY0NUYkVYZlhKRlR4bXZWUmZjMmtWaDd3bGRzdnNpYTNs?=
 =?utf-8?B?WGpTSmxNK1RzbUppNWQzNWV0eDhyWGtOSkR2Y1NjekVWTGdRTEZUTWREN3M3?=
 =?utf-8?B?UFBpMG1Ka1Y3aXdIR25Nd1ZpU2g0K1lDVVdHRStwS25QclFLVFBNY2JJdUtq?=
 =?utf-8?B?NC9BVHBPbVNwaXdoM3l6NVZ1eHh6Sk5NZkk2a1ZEVHZreU8wYWMwMFpFanh0?=
 =?utf-8?B?dW9PWEdpelk4NWZRV05QYU5uVkI3c0tRbnk2enVGQStQY05zYVhBZGpHY3Bl?=
 =?utf-8?B?dWtDNUs5QUw3V2VJam43amtzZW1VaVk1N3hVWU9PcVBjeWsrZ3hlMG1WNHJm?=
 =?utf-8?B?cDlWTEtYRmJVYlU3eFZFL2IxZjkrNzg2cjRSWDNTeUhNd0ZOdG9nQ0daS1Jz?=
 =?utf-8?B?bHZveXZTRzhnNXg0T1JPZE1lSTE3WWx2Um0reWxNeG9pSEh3N1N4NWw3aWF3?=
 =?utf-8?B?MStNUzRwMEI4RStZZFNsaVdMRVl0T2VPKzkwcDZyb0lzMGxSQi9qZGhKVHIr?=
 =?utf-8?B?S05DSGNyWEE5K2txS2xBZFd5TXpLQzBIK1h6ZXMvRnpsSDBhYXR3NzA2QmVC?=
 =?utf-8?B?VUwzak1ZQ1MzV3JFN2tBZ3NXSFVWNXlqRlRVOXlzMnF6TlVMOVZGV2VoZlpt?=
 =?utf-8?B?SWFNM295Wjd4WVJsbm12VmE5ODVqclZIMUR5b0YvcFh1UlRYU1gyU05Qa21O?=
 =?utf-8?B?RWI2ZUxpZjZCRkpMYmgwRFJKamxkV09MZEJMWmdmR3hiTWZCWGFCTkRLSWVP?=
 =?utf-8?B?VC96Ly9ocWs0TDBpc2xlckhnaTJDTGFNQTBuODRSSHh4cE5ESCtDUEorbkRh?=
 =?utf-8?B?V28rQ0UrNEMzWWhpNzZtRzJBczRBWXV0UDl3alo2dXhxMWZ6cE9NZ2NqZVR3?=
 =?utf-8?B?UTFFelNFcnpPQzd6Z2JQbzBwUTBHczNyS2FqUENHVzNsQ1dmRHhsRWVLUExG?=
 =?utf-8?B?NnhKdUpmMnBiS3hoRWhhK3U2MU1KSTNSY1hHdWMvTE1JdDVURUw3WFkxVUk4?=
 =?utf-8?B?YzV0VzAwekd5SDFTL3B5ZDR1aC9MSlJLbkVQM1NFTkVpTWw1ODluTS9uV1Vl?=
 =?utf-8?B?Mm1YeG9XVUdwQ2h2NVpadk1hUUp0NkRma09Rd1ZzdVVYZWVSc2xRN0dkbFFi?=
 =?utf-8?B?VWhoTWM1RmxXektjd2ZGYjRCZWowSjhqa052aS8vdzVBZStqeDQ0c0dqWGdj?=
 =?utf-8?B?VllUSTZDQmMxSVBrZnM4eDNrWG9LRkNFOW00TWNIK1lvQ3BjZ2dxTWpROE9V?=
 =?utf-8?B?c0lrSTg4U1NTRERHczZtSUxYbEc1STdlSHBYS2NzV25pd0w4c1MvcnorZHFl?=
 =?utf-8?B?eHdwTlhHRzZDNE1jK0pjc0RheHhvcVNpbmZ1UGxCbEZvem1ITmdBeU1CSmtV?=
 =?utf-8?B?d3g5Wm53bGd3QTc5N3ljMkJjK1FDOFhzVzVnd1JqSkg4OWIzdjl1Y2x4cUZs?=
 =?utf-8?B?MW96QjNzem4zZUZwR2c0UHhkK0NMZWlBQW94NGNWL3RXWHBvOWhzNjUyWnla?=
 =?utf-8?B?MlIrdjczQWd0QUtUT2FWY05BaTBnYWpVYXA0VFZWSXluczY4ZEtrR0JucS9H?=
 =?utf-8?B?VlgvV0RETzk1RWRvYWRyKzBnSGxXd05kSGNvcEFsVGt2QlRhVGFGTEsxdXVV?=
 =?utf-8?B?OUM5TW9oZFZUVUxDVUVDeWk1Nnc2SzhyUEkwUFliTkNyaW9mV1pUL3gvcGVC?=
 =?utf-8?B?UVFRZUI3cHlrckRyZlJ5WExQOC8zTXp5U1AvS1dLVytVNDBRWm1hNlBLbnlr?=
 =?utf-8?B?cGNsdk80ZEZsekRQMUdReWx3eE1WSjl4NkVyeVBpWFJpL29SZmIwSEtaN01X?=
 =?utf-8?Q?piMPdIi/oUcBQRvUipqb/fsT6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/MeqnMagleFkhPYKFs75Yw3iQoXV1OEZ/v7Udj7Ih5Jn7XxPmK/YS1CbFt0jR/x5Fx6ShQUhcXgIy3squ8+qnIJL9vRPDy+Ql3Mtd5phuzCVzXq2NVH21Xu2KaCq68GjzcnTgYS9UB5w45w4CS3lzXSrX1gC/y2W2iB4tI+6NLHBq00Y+KVezNcGuwNKm33drmwAaB9OGn172McHVj3fq309mIDTN88SwuMFFPRls1MN5AmxpKYwzFeiB+BSPNa7VfLKv3UbshiXDbdySpa3/hwwOw0iZphMHB3/IMp25yxTivKnGlhRMi2yeoZ/I9q4TM2GHceMLu/Nzf+kqLHLAkj+EJ0peNYN1oVvfSlgtRjBOKdjzL/nn0lvlKNC8Zpv8dLle4OJScpyqZb4BGsRlBKt5CjMqcCgjzQv7YAll4ByaC1GFzJgTHJuAylIj1OR4VWZnzOhr7fGt3GTIb0Mnh39F3PqtBt1GyfS+itybfQc2tT9Qiz6ID+bObvIPSMqDPKJQ92IxdGsybGZqH86dS1Fi3Az1qdt47MD4fldbxegi3iDsMUdQ6mNbGVYXEgoqvDt4JyffU4f9NHsmgcGqDiZfVdBgXyya+axmPRHkC8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a4b86ed-1a92-4311-e8d0-08ddd45dbac9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:21:58.9711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZaogMOXWyGCmbKCgH+hfCxL9wZjv4EHUUU54KXChnB/WELAnWdenfRSO2eu9nbrPvjr99CLZAYz8IsdjSh4Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1189AF8C5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508050143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE0NCBTYWx0ZWRfX5kitbaVAMXmG
 Wu4NVhSdd6upFsmtZz/P/iUL7FJxq1a7zlvnCUpC/4npoguzEAsY5OlLE/SLPIFFWpeNwkvYX1n
 8dn75+w5PaA+R0PhMQUWlw0pMaopk4C0vIX5Ifr+gWMexdN1X02zzJXAzGnMHZx6UlcF2NbbKhM
 BwY4J9fFc6rXdTdOoqZ/JcFfsGV+irfRf2EZrgdgsToRjlpc8Qpnq83Viv79LifAw20nJC24fZ8
 7fCmYWnbzXRfRmwvqv/rpyYafpOvlR2bjzqquTdQtKhohNGI5Kae0/ja8fZQjtMYsMvJryLjKyq
 ijHSZyHohRChzuuV2iXUQlfHI9YZCf2rdOXHFIUnaSEzwnflfg6kvXTijS3hA79dN+2OQxTScIu
 Py1/WZwwkIUMYJ+1hQAp4lnpHDtaauns5M2jIVghnwCh3vbUi0y/oMA7LYoZqruCjarHw6nw
X-Proofpoint-ORIG-GUID: 2HwJEHl16Ta_6w1SMcqZt-Qh2W0xUF4b
X-Proofpoint-GUID: 2HwJEHl16Ta_6w1SMcqZt-Qh2W0xUF4b
X-Authority-Analysis: v=2.4 cv=Hpl2G1TS c=1 sm=1 tr=0 ts=689267ec b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ta2inZhrwGS8n7XovLIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

This patch is withdrawn.  The v1 is apparently already queued up, so I 
just posted a different patch to amend the v1.  (The problem was that 
tcp support was added since this patch was originally posted.)

On 8/5/25 15:08, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>   INCOMPATIBILITIES                           |  2 +-
>   cmd/dtrace.c                                | 11 +++
>   test/unittest/dtrace-util/tst.ListProbes.r  | 14 ++++
>   test/unittest/dtrace-util/tst.ListProbes.sh | 83 +++++++++++++++++++++
>   4 files changed, 109 insertions(+), 1 deletion(-)
>   create mode 100644 test/unittest/dtrace-util/tst.ListProbes.r
>   create mode 100755 test/unittest/dtrace-util/tst.ListProbes.sh
>
> diff --git a/INCOMPATIBILITIES b/INCOMPATIBILITIES
> index 035c3675b..bf55019ec 100644
> --- a/INCOMPATIBILITIES
> +++ b/INCOMPATIBILITIES
> @@ -8,7 +8,7 @@ Missing providers
>   Difficulty: Medium
>   Likelihood: High
>   
> -A number of providers are missing, including pid, fbt, and net.
> +Some providers are missing.
>   
>   
>   
> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
> index e0e778db0..ed517abff 100644
> --- a/cmd/dtrace.c
> +++ b/cmd/dtrace.c
> @@ -1443,6 +1443,17 @@ main(int argc, char *argv[])
>   			list_prog(&g_cmdv[i]);
>   
>   		if (g_cmdc == 0) {
> +			dtrace_cmd_t pseudo_cmd;
> +
> +			/*
> +			 * If we are listing the default case "dtrace -l",
> +			 * compile the string ":::" to give providers an
> +			 * attempt to provide probes.
> +			 */
> +			pseudo_cmd.dc_spec = DTRACE_PROBESPEC_NAME;
> +			pseudo_cmd.dc_arg = ":::";
> +			compile_str(&pseudo_cmd);
> +
>   			if (dtrace_probe_iter(g_dtp, NULL, list_probe, NULL) < 0)
>   				dfatal(NULL); /* dtrace_errmsg() only */
>   		}
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
> new file mode 100644
> index 000000000..ad557253f
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbes.r
> @@ -0,0 +1,14 @@
> +cpc
> +dtrace
> +fbt
> +io
> +ip
> +lockstat
> +proc
> +profile
> +rawfbt
> +rawtp
> +sched
> +sdt
> +syscall
> +tcp
> diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
> new file mode 100755
> index 000000000..a747a0458
> --- /dev/null
> +++ b/test/unittest/dtrace-util/tst.ListProbes.sh
> @@ -0,0 +1,83 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +##
> +# ASSERTION:
> +# Testing -l option gives reasonable numbers of probes for each provider.
> +#
> +# SECTION: dtrace Utility/-ln Option
> +##
> +
> +dtrace=$1
> +
> +# Decide whether to expect lockstat (disabled prior to 5.10).
> +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +if [ $MAJOR -gt 5 ]; then
> +        expect_lockstat=1
> +elif [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
> +        expect_lockstat=1
> +else
> +        expect_lockstat=0
> +fi
> +
> +# Run "dtrace -l", print the providers, aggregate by provider, then confirm counts.
> +$dtrace $dt_flags -l \
> +| gawk '{ print $2 }' \
> +| sort | uniq -c \
> +| gawk -v LCKSTT=$expect_lockstat '
> +
> +    BEGIN {
> +        nerr = 0;
> +
> +        # Fake lockstat if not expected.
> +        if (LCKSTT == 0) print "lockstat";
> +    }
> +
> +    function mycheck(lbl, val, valmin, valmax) {
> +        print lbl;
> +        if (val < valmin) { print "ERROR:", lbl, val, "< MIN =", valmin; nerr++ }
> +        if (val > valmax) { print "ERROR:", lbl, val, "> MAX =", valmax; nerr++ }
> +    }
> +
> +    # Skip the banner.
> +    /^ +1 PROVIDER$/ { next }
> +
> +    # Wrong number of fields.
> +    NF != 2 {
> +        print "ERROR: wrong number of fields", $0;
> +        nerr++;
> +        next;
> +    }
> +
> +    # Recognize some providers; apply sanity check on number of probes.
> +    $2 == "cpc"      { mycheck($2, $1,     5,    500); next }
> +    $2 == "dtrace"   { mycheck($2, $1,     3,      3); next }
> +    $2 == "fbt"      { mycheck($2, $1, 30000, 300000); next }
> +    $2 == "io"       { mycheck($2, $1,     2,     20); next }
> +    $2 == "ip"       { mycheck($2, $1,     2,     20); next }
> +    $2 == "lockstat" { mycheck($2, $1,     4,     40); next }
> +    # nothing for pid
> +    $2 == "proc"     { mycheck($2, $1,     6,     30); next }
> +    $2 == "profile"  { mycheck($2, $1,     6,     30); next }
> +    $2 == "rawfbt"   { mycheck($2, $1, 30000, 300000); next }
> +    $2 == "rawtp"    { mycheck($2, $1,   600,   6000); next }
> +    $2 == "sched"    { mycheck($2, $1,     3,     30); next }
> +    $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
> +    $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
> +    $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
> +    # nothing for usdt
> +
> +    # Unrecognized line.
> +    {
> +        print "ERROR: unrecognized line", $0;
> +        nerr++;
> +    }
> +
> +    END { exit(nerr == 0 ? 0 : 1) }'
> +
> +exit $?
