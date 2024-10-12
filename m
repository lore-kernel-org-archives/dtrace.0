Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC2A41
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728705342; cv=fail; b=eYWsHFc/hDYI2YkIfG33yEnmMtJh9lDIewPrFa0DKBq5ziON/zaxVM6+DBEgdQxt+MzSsjtE/b9JoN50MFLsuuOW4OmACpXKcU8+9q8rvPs2XDV6Z4+4jPuxYbZr414wIsz2lXYYBbowqJsyNtGpVzO2dLUVMmjdQzxUtPUewXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728705342; c=relaxed/simple;
	bh=7Xzi3O+mLDSgLSpU7Zg+p8OXacd4ycrCgV7qqqkXSbc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OdMVFV2tmtvmtkh3G4dRcZgRjf6mHaGsEDiMhonfL+iQKwcA8Z3DH0cWX/nBJVv4Hfq/uhG1enbLGJCM3cLerQRDXrRwdBq9OID8WmnwNB4bj/e7DEH1oY8Sk/mq9/ENjV9PdeM6YtOozotd3tYTdp16+5R8f9e5RguNuiQx/6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TwQBXP8v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qQ1RoBwV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TwQBXP8v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qQ1RoBwV"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C3Pjxh029383;
	Sat, 12 Oct 2024 03:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=jXXzc/g1A5V8SMGZG81Aq1lYBldVFunslpKowuWc/Ec=; b=
	TwQBXP8vED/jAw8bgwWvUfdfduRe5HGZ4tQE+vkkZgQcgOgrhOBp8MBdeyQGkMhC
	OWfMVQYdZ9eb7mTDEnzrLvtcjOEQk6R8V0nhN0u5aB1bur03HpvEutg20WwvMNuT
	CiCoprccILbAdmorkhq13Z6dlr5gADyIdsK/WVdOsRpDfWR8mF63dq6ri36xOMiA
	xCVulmgfiKCwrqE+A8uFTldpL8pHhHbvSW5nzS/pm+DwP+pvwCHWsuXBFBRsZdYy
	i3by4Kzwu2Ix9CZO6hAipurHtbzWhhKhr0vUwdJpR7znTJixBE7tTFG7Cuy9G1wv
	7APBIgbAj3XartIaXIePgQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h5c80gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:55:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XeiQ010371;
	Sat, 12 Oct 2024 03:55:37 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjahyqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0w7j/FzznbElLNGf2sLBNYz0FyNeBKQ2WQJgNixSr+RZWJsKWZEevRKbd9i+WBmcoo2N8GNhVhxPRVtRpwma75jBkkkFb7iFagcUvsfkC/qhZAVswxK3mGxPfZVCy9u20XWdGhAC7U2kAdRIEBARfAMGPTllC/X8U8lF0WIh3uGK6A3PJl81xTbT5Q9yQ7kZWXsJjx47h4w64rIvZ5PqQAOdw5I8DglJHbj/y6avSQr7duo3J6XyMOUQsRE3sxN4zYoI9L9xVfmBM3Fd2MrHLwDxvTnIrN659rTvFd8B8fysD6CiqtjPcUoVIgxmzaFOQXDNke444J3Rnm+c+d8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXXzc/g1A5V8SMGZG81Aq1lYBldVFunslpKowuWc/Ec=;
 b=oaNEhEF7PQ4puOwEvzCEp6xAAXJWHUEZDnkTRpzFBy779oAweicdzu07YJWycIpAYsMsav2rvl3qH+pqh/sFbNkN/w9OXFLFW2nJ04jC1ihk+CWzre+cXiFnxgyhjoJ+eK9NMCN4DVrpA09/XT53NdUhRmUUij/IlKrIh66VlkHefOF7oGdXlVjyTNS2Ryif4S1+dmUKMSLdRurlqnhmHOKO0nT8U5MaSDYm2tXRlbHXDlY5XiKPEOOdff7fRji+6WbvnJyJOJ993DmnM9wXXY7TNQAzhgCW/xTRoa1X6NFUaTPpcxTvqp56EkJLF7wtGq0+QH/9QLGnnMf5zRrsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXXzc/g1A5V8SMGZG81Aq1lYBldVFunslpKowuWc/Ec=;
 b=qQ1RoBwVQbvX+IfxB6L/f3PQrBDD2UI7gs5lI9Nyz1+FgjNIeJh8bs1G5O0bxgluqBFkBzdIiBK0wmMl3H3Lb/RU9tAO7nynGvZ+HW9MjqbfP/6SY4f6uUO8jmeJszP/wbpBMjbqVXf/xWkmc76fld/Bgh1B9DAiOX085yZIHqc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7699.namprd10.prod.outlook.com (2603:10b6:806:38f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Sat, 12 Oct
 2024 03:55:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:55:35 +0000
Message-ID: <a509486a-47d9-5dfa-ad54-5a91bec6169c@oracle.com>
Date: Fri, 11 Oct 2024 23:55:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] test: fix exit code in tst.newprobes.sh
Content-Language: en-US
To: Sam James <sam@gentoo.org>, dtrace@lists.linux.dev
References: <cover.1724112622.git.sam@gentoo.org>
 <6ab9502eb62a6d4be913b5032fd6b1f54fe7627f.1724112622.git.sam@gentoo.org>
 <ZwntG33P5oU7pt9t@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZwntG33P5oU7pt9t@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7699:EE_
X-MS-Office365-Filtering-Correlation-Id: 39085929-b81f-4b6c-1917-08dcea71ba09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NS9PeFFlWmlsNEZMTnVwUksrR2ZoNm0vUDJVWDV4eVdZdW10ZDd3Ui9Md2dY?=
 =?utf-8?B?VktxczNqVUxpb0Nob1dsOVl2ZExUY3VIR2JVc3QyNFI3N05yN1dVaGhrTGMr?=
 =?utf-8?B?aW1naGVqNXVOZ3RiTy9VazV6ZVVRVWZnR3RGTGk4dXJxbld0SnhoOWxmaytp?=
 =?utf-8?B?MHNYcVZoMVJyZlQySER1aUJLa2VJYisvSllNL0tTSjNKQmk3R3dwTlVEZ3p0?=
 =?utf-8?B?aUxPK1htZ0dHbmM5djhVWHJ6NytON0ZkV1FrNWhNazJnOG10dVFLZ1IveUlH?=
 =?utf-8?B?TWZ2dGphMFhXNm9nOTh5bUt1c1luSjJqTWk1OHFhaTRGQ3VuQmJMY1RGTDJN?=
 =?utf-8?B?c1RJa2ZWZCtnR3BIM1VqL2NZWWRpVkNxTzBzbkE1eEZjb0J6UlVNRXVtWDQr?=
 =?utf-8?B?WjNnU3ZyM2lyMjgxdTdzZjlJclZ6dFVKajYvU3hEbWlGZ2NYZ2ZxNmQzeDhr?=
 =?utf-8?B?S0c4cEVsSkxaS2M2a2VFRWQ0SGRqdytiV1FNUTVMdXY0Y0pLRStCampMTThp?=
 =?utf-8?B?N3Zmd2cvM2lQUDlIRkIzZGpoVmFOTDhZbWpneWdObWlGUmFGWUIyYmZUME9H?=
 =?utf-8?B?NyszRFFmMy9pMis4TFhUamxRbzhvSUJSVTlvaThQSi9GTjV0cUFESWhJc3Zu?=
 =?utf-8?B?bURxYnphb2VwSkJ1Tmh5SWlodXd6U0RUZkx2R2J2OVhabnV4Q2VSSkdNWVBn?=
 =?utf-8?B?eG9GTS9MM0V4ZHlmdlBaU0lOSC9JRmRhK3UzV1phUFRMdTJmZGFYajNIUncx?=
 =?utf-8?B?MENHRitPTDFTRlJhSkQyaS9FVXpzZkV5ZzB5S1dSNHFHY3VSQWFsSmtaVmN5?=
 =?utf-8?B?dXYxY0RjcHd4dVBBcWlZRXI3TDh1S3pKSDBpZ0wxdE8zbEJVOGtEMlZiSmZO?=
 =?utf-8?B?U0FtQmNZeEx3RWUrU1F0c2hEektUb2ZYY0RzejZkNFNzQUtwdkJzc09VZHlW?=
 =?utf-8?B?M3R5VlczdkNkZ0NNRmw1ckRjdVFCNlNRMk5tMGd6K1pXM1BoSnp5L1lQaDVs?=
 =?utf-8?B?L2pPbFVXRk0wbGFqUVMyU2pvMjlDWFVXV0xRZGVhOTM0T2F5c2VGbmRiVGdJ?=
 =?utf-8?B?aFR3MzVaQldRRGc3czEzczU3S1Y5ellxR3NTbGtjUnZabjJVQW8yeUM1aVFG?=
 =?utf-8?B?eG1wZUFVcXdycDBxcjJsTXFHaEFpdjdLcm1PYXYxWVVOa3k5MmgvR3ArLzNj?=
 =?utf-8?B?SFZURGJXbXRzVmhnQlRQRGxvdnVjTDJTT0Q5Y2NyekpMVVJsMzhkUmJ0ZTli?=
 =?utf-8?B?ZEd2bWYzWSt3YXp1ZkFjcjdDZ2ErWVhBUG01L3ZjT2NQZzRaL0l1ZnBSeXRp?=
 =?utf-8?B?TlJFNlYxM2owVDA1ck9OcllaWVExN3BFL1VFMlBjWmNNem8vdE9sTXo5cldl?=
 =?utf-8?B?bHROOHNNcEVpMUZhSkZ4NDZrUFJQTDVFM29BcWVXdSt3UzhnZ3ZnUC9EeGV2?=
 =?utf-8?B?MzJzME5DbEM2NXJXajNJb04wUHh3dW12OGUwQUt6SUtwQ1A4NHhTWmcvaTRD?=
 =?utf-8?B?THVtYjRWcW4vRDlSVi9kOEFvb1p3RWRvZkptLzJPakxjMkY5clhRQkh4bGZL?=
 =?utf-8?B?RVJGbEpoVlBKZWlEejViNHJpT3l3Sld3RXVGWWQ5enJkTllObktXWVJET3l4?=
 =?utf-8?B?YjVteFRtVXlmV3VpVkd1Mm45dURpTHVlcEZHWjlkdG5kU3B0Mkwvbmc1Y09q?=
 =?utf-8?B?VkU2a2Q2U2IxdjNlTlB0eFV3UFZBb2p1cVdoTWFaSC9CbXlCdmxqa2l3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVJITVg1OTduV0dEQU5NdnpjNHdxaXcwUFRnYzAwK2trNTFHRURGNUlQMmRJ?=
 =?utf-8?B?WFo3Ymk0UlZBZUplWCtVdS9PZzJDT1E2UFoxdlFFWlFFblpRSlNCQUtRMGJy?=
 =?utf-8?B?K2NpQVhTZHoreGNsbnhvc0ZPTmFVbklmdkV0MjhYemxSZzc4ZWM3ekNyRUZo?=
 =?utf-8?B?WFVkVEZ3RGR6eXQyb1JDdkl3ZVEwVFBQdVFoVkc2OE9ldlJKcEdHRXh5NmQ1?=
 =?utf-8?B?RFdXQUJIM2NvTXk4em9VQUlkN2xMUFNBV3VTZEcxVTU0TFB4di9JcEp4YXg3?=
 =?utf-8?B?TUl5VU04VXp5SVE3SnZhelNPSmxZTG15ZFZmbm04YUNLMnVaUDRkVWl0RTVw?=
 =?utf-8?B?bE1MQ0FuVk1veHVQRll1OElQQUN4bFk0bzhYS0lRNjM3OGtsN0crZE96aGR1?=
 =?utf-8?B?Q1ZBSkw1b1FHVmVidGZta21XdWpwcGpGbzVGMjhsRCsyVW1vZkdjUlRGdjJY?=
 =?utf-8?B?bkg2WTVWNWwrU3Jqc3MzRFd2Q0xqWmZFd014TVRkVloyc3YvcjFCZDFnVFdE?=
 =?utf-8?B?Q1FBWGxtN3NRSTV6T09jaTZZWVhvbURCbU5nMjF3NmFtMW9veGZSbVVwN0c1?=
 =?utf-8?B?M1U4TVZaKzA3UVlmbzluT0d0b0dnM3Qvc1Bad2ZMaS9USVpxMlI1QjN3RUVL?=
 =?utf-8?B?R21VZjU0U0RJNSt4ZWpZVkhodUZOb2MyZmMzVVl2by9Nb0w0d01DWnpGZ0xo?=
 =?utf-8?B?RjdGNmxqbmsvTGpDcXI1dVR6NlJGSndMeGpONnlNRitGWHFCZUdhMEZ3cTZC?=
 =?utf-8?B?YzBsT05HUGMzOE9Fc3lxcDF4VC9NRktDQWtaQjNlV1U1ZHVNMG1kQUpKaTZk?=
 =?utf-8?B?VW9abUhMYkpkOHZqSWxHaU1uQTYzbTZ0WUJEcTZmR0FpUElOV2FqYllLbElv?=
 =?utf-8?B?WE9iRGlKb2FIYVgvUnF2RE9BdHdha01jcXhydFVwSVZhWFpLUXBTK25xZ0Zo?=
 =?utf-8?B?SUcwSGdxTitua2taMG9vNFlsNE9nUFBUSUFkb2FZNGpnRDlWcU8zNWM4ZC9Y?=
 =?utf-8?B?ZVdyaGczNmU3VGZST3BNVXhUMVl4aWcrcE5nNGNaRCtzZkt3UDNhZU5wUTI1?=
 =?utf-8?B?Q3VwbCtlZkgveHNSUnNGZk12R2ZUQ2ZKMUF1ZkVWekptRjJKOXpxRE92ck9o?=
 =?utf-8?B?R3ZlTlpXVk9qeDloYW5QQW9wYkkzS2xIbDZHVmVES0F2dXZmc2ZNWkNTbEI2?=
 =?utf-8?B?aXZwUllYdUtmMTdOSGxUeHZTRUoyVkRBc0VtYS8yUWNKRTAyTnBCZG1SdVBL?=
 =?utf-8?B?MnJsV3BQVEdGYkhNNjFBTGI3RW1BUFdaNE4wM096VUhWSU9IQm1HeUFZYXpw?=
 =?utf-8?B?K3dHRW5Cbks2RllmQzI2R0s2b1FPQ1pReXdEQjlpR0R4RlNzR2UybWVqTzZt?=
 =?utf-8?B?YUIvbXlJWWNnbEMvMkNOYllWcFNyWHZ4Rm1mMjljK29mVTNDak10d1F5cFJC?=
 =?utf-8?B?cjNkNWduNXNqRTZ0NktPSFBEVmFsRUdkaFh5WkZqUFg0Y1lZdlpzeWI0a2p5?=
 =?utf-8?B?SHM4ZHFBeWJMekJpcnpRcmhQZmJYdy9aQ2lQTWdLRXVtdXEvTURQQlRMM3V5?=
 =?utf-8?B?SWJFS3VTUk9jVmhUZFI2Qlg4TGU5MkZTb2UzRU1ZdVFJRlkzc1Y1eC95Nm5v?=
 =?utf-8?B?WStDcnBnV1VVUkJRNmdYWG9DeDVSeWR5Z0xqc2k4SWk2RVc1ekFXV3FoenZO?=
 =?utf-8?B?WXp3SkR4OWtXdUxYdmJkSTN3bFQ1Q3Z1VWRsNjZ4VnhFZE9YTDhwMmlLK3NR?=
 =?utf-8?B?MFJFU3l2ckgwRmlsUi9sclhPNGo5VEJwNUNSSzRpdG1Cck1wTGlPQXF5MEtk?=
 =?utf-8?B?Y1JqdTBVaHYyMmg2THpPS3FtNEljUkNpMWpDVVplM0VYeWdkN013RFFKQTZm?=
 =?utf-8?B?NmZna3NGQnpwR2FwWUxjMGpvb24ydTN4bjR6S0dmRWhiUjlBSEE1YVR3eXJ4?=
 =?utf-8?B?YUdEdmNEVlgySGtLaGdVdlcrWmFKeFhabVpXanhFRTAzSHlnWHgrR2dzeUwz?=
 =?utf-8?B?aHFEc3BlNFJwS3pOTTlqZXZZWUNOMXc2Rm5lYkdQbkhLM1NsWWtuWFBtaU90?=
 =?utf-8?B?VXN2VlFITEhMbDFSSzFUeGpWSjFPYmQ1UExYZGF4TWRNY0VKN0xIdHhYa3RE?=
 =?utf-8?Q?qEBN1eNqEgAW44l73gRX0X4h7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2Pr43WsylzRIDSnnyv69cXKvjsWvxakYpMDFV0ZbXn4B7EV9JmHRG3sPWBlS0OIErH8v5kaHpispnNV6q3P3gfw/V3Yfd8aOr3eivGWKLvViCIyY8XGGkb20KT9nRfdeRJ78COiXHXXUFYda0eyep+8yw0gRQcG0sVm0z2BBOewWKdXq726ojFOqNQ+j9+2YXmbNgg3VE+CdMj1p+rFiASOuJHS7p6erCIgAkaso/Fkv5WAuawDbwjaD7/3sLsK95uA5VpfcCCdk5ZQjqhRoLIC05QvNemPr1iu53SQjxG3NDDwDFsPuBo9OqIdGtNzTIMX2jkqku12aiZRqfnY3xtJNdA46z5cvtJJbbgynYMKmlrE55UVlRnqIKNIOEv0/40MUnnTOaB3zFT+gZFxTyPSz+U04SIxsbD3jedXrNCW6ByQXK29+9NEePmr8FwanASorclBVJHpa9EprsIdInqHMZ1Qb3qrVAW6e5xs5Ed2v8n2qKI12VmLWsrZerm6NEECQLlhX/il/XZzxAIdSPSzuDKM2ckCTT5R3gYYTy/6PmNDzZ6rQCdsY09yqhKeWNPLXsFQx+EX1kI1fVSaspyNhKlrC34/X+y0DATIaiOA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39085929-b81f-4b6c-1917-08dcea71ba09
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:55:35.3964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rf0vNp5mkGyaWoald7gltWj7zlKsB0tyeWqt1y6LMUL2NjqAVP7e3qlZGlPis29ZVzMXtv3qsO87ZHaeDMgaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7699
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410120024
X-Proofpoint-ORIG-GUID: y5zDVFm7rgCtOXBJ9bMLQA34ga8akrHD
X-Proofpoint-GUID: y5zDVFm7rgCtOXBJ9bMLQA34ga8akrHD

Maybe I am a few patches behind.  I thought this test used pid*:awk:: 
and was therefore XFAIL.  I do not object to the patch, but I was only 
curious if we wanted a "real fix" to the test. There are other cases 
where tests have multiple problems and we do not generally seem to 
settle for fixing only one of the problems. Again, though, I'm okay with 
the patch... it's an improvement over what's there.

On 10/11/24 23:29, Kris Van Hees wrote:
> On Tue, Aug 20, 2024 at 01:10:22AM +0100, Sam James wrote:
>> $status is never assigned, just use $?.
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
>
> ... and committed with Signed-off-by added.
>
>> ---
>>   test/unittest/pid/tst.newprobes.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/test/unittest/pid/tst.newprobes.sh b/test/unittest/pid/tst.newprobes.sh
>> index a4944688..0980d3b3 100755
>> --- a/test/unittest/pid/tst.newprobes.sh
>> +++ b/test/unittest/pid/tst.newprobes.sh
>> @@ -44,4 +44,4 @@ tick-1s
>>   }
>>   EOF
>>   
>> -exit $status
>> +exit $?
>> -- 
>> 2.46.0
>>
