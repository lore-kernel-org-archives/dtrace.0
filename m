Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0368427462
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766091971; cv=fail; b=Ei9/pZjXKwZsKeX7Kf2nClH4VrjNMjEwVqJaXICF5nhbd+cMTHdSTkjVABKJGqVDo3ZyhSJm1jtjNfFlzPtlkKw4LkIIvBrfpqf/GueEz1q/NvYvxCk6P0hQ3QPb51l2l3OZ1qiIX5thLYn9N+EYPIefJO85Yvwbo8ngtdzBBcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766091971; c=relaxed/simple;
	bh=pHjV5sJZ3ObS9+0HS21UJAoEiHxpuKUHZBdwLIFNnow=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sCYdzs9uI/34K5KAS755oGWMQtQBieryvzR2+0ATMTUrG7o6DdYgyudw3KXqqjRVJ7nGuvUifcK2PLKBg6OcOYK9JjjRP4geNt1M00beiwW8sYk8hTSx8Eka0iVoPBKObAg9UfM7f13Z55PlW/dCWca68NuFHy3FjO0jEzwYmms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ht0sDfwl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tnduwaCY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ht0sDfwl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tnduwaCY"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkU3J1605318
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=AJl+3grNwL4HbaLp1C/lVVG4iuMkYorz5Oake1+Jg0w=; b=
	ht0sDfwlDVNxv7s4xdX1oRNPnmvMjpzZY18VhqlXx2GWaMPNOeOSTDxo4uPGdQ4O
	EHQRNQwtYvUw0CF/rWvpxg/Dufi962/htSDkgOhVavuQKTw9Stb+zCUDYMqBAgTg
	VWE7MFwYhkF0arRqVgO4sslzrMfL1dteE9caCDXKHiJafAyJ0BpErIK7mzjkooJU
	PaglRApTYc4aPX8u/JRMZ1aSu3buiWNIhDLwfpoJTWdjk7nNwQUBgMVLdofi9Z4+
	miolh/KsTZQexbby6lOY+rnub5rK4TKMchtHRqQu40CW7mSLSw2UUb42q2zW8cNb
	3pjPLqBh0Fe0kma2xgZ3vw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2cg3yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:06:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJT3LH024074
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:06:06 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtdbhkk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 21:06:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DZYSpox7pVUIvOkZbv1rnqlBElNJ/sKbtPKYubRvFNUqRPNgudBBiKdD9rVkW6FjRC5/mEEJ4DI1DDmWcYlJr69VCkoRum9z215ur6+kEgTCy0Ikg1NUoYdfw1xLQ1EYoJSEuwFcwY3BAkPcGnpmPGOBHZf+M9w0CsJdmROTuJOQDHh9gRMHWK0+A488MgqLeHsat9QYxy1YknWNkk81bC3EFp0Ctjr3Y3pJVfhbL150r0cCGUmZSUT2ZE0oAJGU0im3PmWe4kPk046277zIK3Wa0Ot2/XtO/Qz4ZOjiuFEQkQrX+9WMdkArChoYn3e982u8GgoTjt5hzgT4eif30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJl+3grNwL4HbaLp1C/lVVG4iuMkYorz5Oake1+Jg0w=;
 b=mjUAXBwd/aiYt5XnH6+dPOUBYLD5kXEcrs5gNAYB4lypjhLmOYN9l8nohgXvhHe9SrRoeMpVLROYoztK/nV64PiNjJAuusTzmEH14DOyQB3GxnCIptvuwnW2PLg5Tcf92A3jhltkaJW+ynVgLi5D+OCf9b6wL4HeFE6KSX6/HwyTv/mzb22Iz4XBugmeKele1ueD2NUN1ezfs6RjLipzijicflABpIJGRGbl144Tyxur6iah2xE3eQl1M4aiy6HUnzBR17Wy5j/bMxYxaKK7EDFl2RqVAUfhW/tv03GuJltCsFKTTnXkYZri/dJHHoLZfUjxFQHc2h6IN5uFINdeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AJl+3grNwL4HbaLp1C/lVVG4iuMkYorz5Oake1+Jg0w=;
 b=tnduwaCYdmoSqT6FsN8jx7cFGRXR9f/IBVOia4NXk7fd3AWnbfJs4jr6l+Hm8wlJ+pVzbjItR9Eeui+Cei99erSId8mwMJ/GSFMAIJTOkOFUHGbzk8N4CrDs2ENbG03btPPLvdP4GHtQ7FI4Yj8+S3lR+Zr/kCKHSEGKyZ0mwpo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5153.namprd10.prod.outlook.com (2603:10b6:208:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 21:06:03 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:06:03 +0000
Message-ID: <d701127d-01e5-3849-c824-39839bb8d34b@oracle.com>
Date: Thu, 18 Dec 2025 16:06:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 4/4] options: discontinue -xversion=V as
 a valid option
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB75225B4E633FF1F79FABFFFEC2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB75225B4E633FF1F79FABFFFEC2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0070.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5153:EE_
X-MS-Office365-Filtering-Correlation-Id: bb182b30-1b01-4bdd-a0f4-08de3e7940cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmlBQjk4L1lHZC9XcGhTaENubFpYeWhGNmNLdU1TU3Z4am52VFl2WW5TZFN5?=
 =?utf-8?B?MG9kbTlGTXVEYXdMRTd5TFZmZCtiY3dkbFlNeVRvUm5hTTZMTisxa0hoWHE1?=
 =?utf-8?B?YnZZcU9LL3BYTS83Zzg2VUR1T3VSV3gvaE0zSCtJc2ZiYWYxOHdDcXI5NVd3?=
 =?utf-8?B?S2VxQXI2blVhd2hNQXlTcms5MnZESDErY1ZueTN2Qk9MbjdkQjJsWjd4RXZQ?=
 =?utf-8?B?N1UvUHFRQThsMkY0TVM3a0duYVA3NFJoT1JwRVhSU25Ubk5YVGdxdFp6UmpW?=
 =?utf-8?B?V081b3hRdU9qZEoydVR6dXFmdGxMeWh4Vm1MK09hZjJMcDBGN2tKbFZoeGlR?=
 =?utf-8?B?Y2gzRkFFSlQrejNsMGpNRExFTXBOUG0rdGtmV29yME9PbVBZem5ESTIrQ1Jz?=
 =?utf-8?B?UFdDVGsyckZWd3hWcjJUSkdtTi9DSFoyMmN4MUdpMFpNdzEwdENNNmpKRnZI?=
 =?utf-8?B?STcwWjA0S1drMkNnS1h2dVJnVWI0SW9XOGFaS3F4c0lobENtMGRNQ2dHZWRy?=
 =?utf-8?B?SXBFaENQeTRTM3AzQmFOeGtxYklHNVdUZFdqTDFWYlBNNnFtWmlYRG1ScGsx?=
 =?utf-8?B?SnBSM1c2YkVyVWNrZVlLWlFINGZLZTRHUE5uWDQwUDl1bXpMUEpDLzRyeGE1?=
 =?utf-8?B?N0V6ci9EY2tTNUliQnNEQXNxUEl6SlMzWURwbTBVSllkaDdra20zZW9xTmNq?=
 =?utf-8?B?SFFZMmdvNS92VWdCeGwvdC92Z0tnYVNNUmhWTDFWanhiaUpZVmZhcCtaQW8r?=
 =?utf-8?B?SUhsOGdaclVFazJTS29VOU4rZmpkUjdURk1HY2pBbFhESlliaGpXcGd6OERV?=
 =?utf-8?B?QWhPRXVDZ01ySlg5Q0RYbCt5OW5pazh3WnJiS3dFR2JyVko0RWZzckVkUzRr?=
 =?utf-8?B?aVlKay8wcmh4VEt4dWNBUnEyOHNrV3ZxZi9EU2cvcXNsVW9xK21SdEozK3FZ?=
 =?utf-8?B?QmxCYktlZUR4ZzRsT1NuT0pHMGk3TDhUajNnM0dnV2FyV1dXbENwMDYyeEcv?=
 =?utf-8?B?ZkpZbEtlM1ZIbjFZOU4ycUpOYmw5QzdJY2pKMmZyMFA1ZzJRcmRIMUptM1Jt?=
 =?utf-8?B?VDZxRFhCTFd1eVN2Wi9oOWwwMXRZdlV2YVU1R1ZEVlg1QXkyazEwUDdwTldu?=
 =?utf-8?B?dHZjNGVpYU9pT0tFMWJTZlpJL1YvanBQN0FlY2w1VC84cjNSd0puYzZMSURW?=
 =?utf-8?B?TGQxbmdmN3M0WC9wZS90S25nbjJBU1BUNDdnYk9rdW1SV2FiNGNrcnZraWFi?=
 =?utf-8?B?UGtLekZ0UE5DV2tySy9RRDVMSmFkVGVNMko4c1NrZGN2VitsdEdPWCsxaUVk?=
 =?utf-8?B?TUN2VUJyRDN2UC9Ka2ZHWCsxeVM3U3BIY1liUXh0WFVsL0lzZyttUEVsV1g1?=
 =?utf-8?B?RnIxOFVBQUtmMDVIazc4bUtlUVpqSTE1d3lBRkZDOSttT3gzMUpGdlhYeWdX?=
 =?utf-8?B?ZkZiNC81eWpONW9veGlrWTltbktLbHhFOWZXcWV6dmt0eGtGYzc1REp5alZH?=
 =?utf-8?B?VVJ2emhROForaUd3Q29FSGkvaHVBZm1RaU5lcVlNMVhOZXkxVWJQZWh4SzBM?=
 =?utf-8?B?K2ZacXhpSnlaRnA3eFUwNGJjaUdTNlorZXFvQ0o3elRmVWRaakFBK1dMcEVm?=
 =?utf-8?B?SzNBaWFhQXZLb3d4SElJK0x3TkM2NFJZOEdOazJLZ0FoNXNTbVZ6LzBpZUVY?=
 =?utf-8?B?NGdVemZPWnZNUE5TdjgrK0I5cTRick5YeUsvSEhQdHpqUlpLblhtdi9DeFYr?=
 =?utf-8?B?U1Bhek42TDQxTzd6byszQUQzdUF1d1FtME1waUU1d1RrOVR3MlJhWUk4RldP?=
 =?utf-8?B?QU1KK2NLWnZkc0VLUy9xN0xiN09VTHY5Wk1XSU44ak1rTVBUR3BFTjdLc3dQ?=
 =?utf-8?B?ZEVDN3E4TUNobUVlK283alFPTzZVR2cwbDNqOHJXNTI1bitsMUNUV2JNampU?=
 =?utf-8?B?elZmSzN6U0lkdlNNOWkyOG13Q1ZabnEzUkZPZnNTOHMrbktseURSUnh6QXdV?=
 =?utf-8?B?bzY4eVl5L2FnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cFNmY081Y0tSdndhZ3R5OXpub3NXSGxOVTZHLzVsT3B4VzlRNXF2Tkk3WXc2?=
 =?utf-8?B?dlBIZUh2VzhRUXBKYUtuendlVFJORTNuTDRwM2YwRFVOODcweXdYMUdhWnlr?=
 =?utf-8?B?V0lDdkh2U21YRFZ4M2tpZnQvWmhEMHhmeDZwL2EyeFRzTjhOU2NTMHdObksz?=
 =?utf-8?B?d05pNXZ2SnoxektlbzNKYVFlZEkzMVZMWXBmQ3MxbEhRTGdOc1p4ZmxJYnlK?=
 =?utf-8?B?QjRiMWd3aXZ6OHVESVZoL0kyelZsYktXdEFleU1qVEFUdk5JK0NDZmcwYkc4?=
 =?utf-8?B?Qk5wMjZEUnR6UGM4aVd6cm5PTjZYa21majNSeFVmbThhMFozYlYzQmpvcU40?=
 =?utf-8?B?c1BNT0tlZHlUNDZwaE9wTmJ2ZUNCNGxwalJELzFIYjdzOFFjZy84ZEIrRVE4?=
 =?utf-8?B?KzJCRkcvQjdTenIraWsvTE9jL2hBRDdpdDMxcVZ4Y3lNMk1NNGRSdGdjTXhl?=
 =?utf-8?B?cUxrT1d2Zy90KytJenBSa1FjT2N4QlZwTTBPMGpjWndCa1lwbGQ5YzdiZUFz?=
 =?utf-8?B?Z3VkZnNyT2RHTVRyUkM1V2N3VWRwQlNEN0ZtaFhaWjhZR3IzN0R4UXJqa21O?=
 =?utf-8?B?VlV2eGJnM01oYyt3clEwdXU3ekhzcm5aRkhubUI3bkxEU3NGV1hRcU1tSnBZ?=
 =?utf-8?B?YVlhd1dPRGVPeER3TXp2Y0VqQXBkdEFiRS9QejVlNHowTG5xVU5BM0ZSUFRG?=
 =?utf-8?B?UllNSjZ5VDNLRnBmOUVSKzcxSyswazBUNjJTdm9xS2RpZGNuZWlLSGVSU1M3?=
 =?utf-8?B?N1RMSEVQWk5oWlVRM0JpR3lVUlAzS3d3S0UybkpyMWN1aDFJZWt3OGhuWXZ4?=
 =?utf-8?B?TmxSR0UwOStGTXRnRnAzYmdLU0tqcXRjd3lJN3RyeVNOdXJuN2RPMmk5YTla?=
 =?utf-8?B?NGlOUCs3djB2UVVudGlkUEUvYkZVWnIxWjZoQU42cW5XOFBqMDRQRG81VHQw?=
 =?utf-8?B?d3RUYzZtSURUK3pFSlk1SFpEK0RJQ25ZZWVJSG1Uek9wWFJ0RFJlOHFsa2JF?=
 =?utf-8?B?emo4YlFaU1l4OXJtR1U3UzlrMGFYRDNuUXhBaFBsdkxmejhYVGdSQnlmRUZK?=
 =?utf-8?B?OVhEdDloNHBqQ3lVSXdBb3FKQW0wb3IrZndZZW5SRkZ4ZzcrUGJFVmpyUkYr?=
 =?utf-8?B?ak9XSWRxVHhYVWMwSW9lZUxUQytLdWZlaGpBNGlCUUQxSUp6N0NpeVJiWUJl?=
 =?utf-8?B?ekxuL2UrcTQyejlzU29JbUc5S3BzU3Raa1BaVSthRnI0SldielQxdXNKOG1y?=
 =?utf-8?B?VGc5ajVmaXBPQm16R0xHbEFINVJaUnQ5NmoybjN2bXVaZVljRC85eHdLSlBH?=
 =?utf-8?B?aGhPK2dFWUJPR2NuY0pMV3FaOGtlNjFtejBKUVVMd0tOU3VFcjRwcjE4UzFu?=
 =?utf-8?B?eVdLRG1EbXhyU2svY21PT3E0cDRSMERJRit4ZlZMbFZVdmh0N3lGN2Evd0pQ?=
 =?utf-8?B?QXloV0JMNkFXV3Bzck9EWXJ6OGd2UjJLcXJiV3JpQkxTczV0K2VNanlKbHVH?=
 =?utf-8?B?MnhVbUkzdTZUb1J6TXQwOGdCUHljeUlzeEZtNDZEdFZsTWtPRHhEU3QwVHRv?=
 =?utf-8?B?WWowZE9hRU9uMXU1bHFkV0M3aVcrM2czYUtTVmZpS1JNOS9QZTRPdHJPZVJx?=
 =?utf-8?B?RzJUZThDaldmY0xJSzBMblpTZFJ2T09Sc1ZqY2VQZTk1R0xOUnNSK1Zhd2FG?=
 =?utf-8?B?NHhYSTllYXdFdEdMWnh5Z1ExMHg2V3I0Ky9UNWJRR0poZWlBMnViK0hkSVJM?=
 =?utf-8?B?VytzV2c1aDgyMVZYdTZWaGt5UjRDdVlYd0pnL1ZHalRjZTh6MFJ0ZmZwOXRE?=
 =?utf-8?B?ZG5lT1p5VDVzcWM4U0xHbHp0U1Vxb3ozZTB3M3YrNTBldDc0NDZnQW9hZjg2?=
 =?utf-8?B?WVZvdHZzS3M0enpwOXRncnE0ZnpmeUYydkw2MVJOV2Z6Rk9PSXgrYnBaNkFx?=
 =?utf-8?B?NXZGU0wvWTN3ZnVHbFJ2SGJITlplVDJnVmJxb2xJTTU2N2dlbWZaUy9OeHBM?=
 =?utf-8?B?SmhOdWpFb0tXZmhNRXhiaU4yR0E2V3JTWWRYaUNkVVBXaGYwQUNNa241QVRy?=
 =?utf-8?B?TmlhWkJjMmFQRmQrelFQSnh4dXQzV01rOTR1cXlHMTBzbjh3ckVkb3JCWmMx?=
 =?utf-8?Q?Dmozv2ePU9azhKYokc4IBhNNZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FdOcB+y1INQG74wlOcqm1ifRCdFV0oaOGkeMSruOGlXVEmHl2NNH0bctEqQD0Z0xpt2aWtUBoKI5IT7iKkDEldJQ6z/XA6hnXAACiW4UHZEWUz58gf0JSncM8+I1qcF1XCtN22TgZHNSGQzoXw3tv1v0Q8LMdXQJtG2G4ja8MJwzsR58ej4AaXLvRo0QHgzEyQqyiKAaAsEW7Jm5Qf27OsbP1QP9Fl4XDe9bVQe7eZOSNwNKWk2H6fwBPruYCcMB9ZAjmFKj32EBEbE6zTAmboOmrh67xZip49Z+Jwf/PtcpY9aqcEcI1GHpetV4SvwBWI4x3sMVXcPXSKNrkotvS5HKkMasP90MQ9yjT1MDhcIhdRa1wv/EHIrfbKltiNXzYG2A3ShUPUxdIp0zHYl/dah7ub56BAEnaeHpIu0cxBTD9VoL1UB66qc6tzm0Hv4DtO0G4SrZRQ15P6rX2nRxjm6nPS9d47cqNoRh603NVV6Cz7kBpsZ1AhvgVv5C/WSFUe6ZUvdKDSpFKZZcK6fnVytNLzFhh16sEjwymcmryuskL4Ckpfsf5k1SwLmFh6ga6NivubCBav4L9Ipv12/J6NcsLlT5SLpwIdvsuAlzU0A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb182b30-1b01-4bdd-a0f4-08de3e7940cf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:06:03.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kHbn736/8qys3lVQFdxWjnyTMKD0mPyY4EB0b+iDjpbC0a/lWhyv3gFu8qTd1mckH/aIa9cGpDshSnptfrwkww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512180175
X-Authority-Analysis: v=2.4 cv=YJmSCBGx c=1 sm=1 tr=0 ts=69446cbf b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=F23UnYTvweldJ78FYksA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE3NSBTYWx0ZWRfX7lsju9D6r560
 ztQi49KTDF648a51krjATncxFXb7EVGrjnxuwGaTyfXgW5L9LIYeAZpVgxR3kRNIc/Gt6h+gJlG
 3s5S93bBDO72OUTdDKbAcCL0EY5FYeEBf5i7fw+ed/y7uakeKM+1/mo3Pb1y+ZHgUx85BwvxOb0
 SvYEkIAjlr6YdLxoW2/+q16EWhrQ1F3XO0okyCiawRoeJin2PfX+FUx5Bve5Z7rtkfU2lP2taLW
 YhvJ9P8I8Vv84Owdjd0kN5Kyfje1cNB6CP288odqAL5QfBb33WZCYYLPaSl0yhDV0HIxm9mZzCg
 Ly2ZWe7UmspFhDXDXjxxb6ewpCkfp5uo4q39ILJeQu+o9pMfxw/dr7QhlJClL+sQq4bp4dJ0a0a
 2zhZtvto+IQ+q3h2aebkuqG+JAIqCJwulE0F59tBGSvC/t3yi6qAyph82Smnhh6M/KmsvSxIn/i
 qKn3EnjntVV+b9Cdv4g==
X-Proofpoint-ORIG-GUID: Y7aTFML5r-sx4EueYsYqFZjM8GX3sZ8b
X-Proofpoint-GUID: Y7aTFML5r-sx4EueYsYqFZjM8GX3sZ8b

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 12/18/25 15:36, Kris Van Hees via DTrace-devel wrote:
> DTrace allowed setting a previous version to operate in compatibility
> mode.  Unfortunately, it was not fully implemented.  Translators are
> not really versioned, and if a translator uses an identifier that does
> not exist in the version specified in -xversion=V, data structures end
> up corrupted.
>
> Since the usefulness of -xversion=V seems to be less than the effort
> needed to rectify the implementation, we are no longer supporting this
> option.
>
> Tests added to ensure that the error is reported for -xversion=V and
> when set using a pragma.  The former version tests have been removed
> as they have become obsolete.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_options.c                     | 14 ++---------
>   test/unittest/options/err.version-pragma.d | 18 ++++++++++++++
>   test/unittest/options/err.version-pragma.r |  2 ++
>   test/unittest/options/err.version.d        |  4 ++--
>   test/unittest/options/err.version.r        |  2 +-
>   test/unittest/options/tst.version.r        |  1 -
>   test/unittest/options/tst.version.sh       | 14 -----------
>   test/unittest/version/err.1.1.d            | 27 ---------------------
>   test/unittest/version/tst.1.0.d            | 28 ----------------------
>   9 files changed, 25 insertions(+), 85 deletions(-)
>   create mode 100644 test/unittest/options/err.version-pragma.d
>   create mode 100644 test/unittest/options/err.version-pragma.r
>   delete mode 100644 test/unittest/options/tst.version.r
>   delete mode 100755 test/unittest/options/tst.version.sh
>   delete mode 100644 test/unittest/version/err.1.1.d
>   delete mode 100644 test/unittest/version/tst.1.0.d
>
> diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> index 97516517..0a35e852 100644
> --- a/libdtrace/dt_options.c
> +++ b/libdtrace/dt_options.c
> @@ -24,6 +24,7 @@
>   #include <dt_pcap.h>
>   #include <dt_string.h>
>   #include <libproc.h>
> +#include <port.h>
>   
>   static int
>   dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> @@ -676,18 +677,7 @@ dt_opt_invcflags(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   static int
>   dt_opt_version(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
>   {
> -	dt_version_t v;
> -
> -	if (arg == NULL)
> -		return dt_set_errno(dtp, EDT_BADOPTVAL);
> -
> -	if (dt_version_str2num(arg, &v) == -1)
> -		return dt_set_errno(dtp, EDT_VERSINVAL);
> -
> -	if (!dt_version_defined(v))
> -		return dt_set_errno(dtp, EDT_VERSUNDEF);
> -
> -	return dt_reduce(dtp, v);
> +	return dt_set_errno(dtp, ENOTSUPP);
>   }
>   
>   static int
> diff --git a/test/unittest/options/err.version-pragma.d b/test/unittest/options/err.version-pragma.d
> new file mode 100644
> index 00000000..88825ef6
> --- /dev/null
> +++ b/test/unittest/options/err.version-pragma.d
> @@ -0,0 +1,18 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The -xversion option is deprecated.
> + *
> + * SECTION: Options and Tunables/Consumer Options
> + */
> +
> +#pragma D option version=99.1
> +
> +BEGIN {
> +	exit(0);
> +}
> diff --git a/test/unittest/options/err.version-pragma.r b/test/unittest/options/err.version-pragma.r
> new file mode 100644
> index 00000000..279186d3
> --- /dev/null
> +++ b/test/unittest/options/err.version-pragma.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/options/err.version-pragma.d: line 14: failed to set option 'version' to '99.1': Operation not supported
> diff --git a/test/unittest/options/err.version.d b/test/unittest/options/err.version.d
> index bd86e13f..093b29aa 100644
> --- a/test/unittest/options/err.version.d
> +++ b/test/unittest/options/err.version.d
> @@ -1,12 +1,12 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
>   
>   /*
> - * ASSERTION: The -xversion option works.
> + * ASSERTION: The -xversion option is deprecated.
>    *
>    * SECTION: Options and Tunables/Consumer Options
>    */
> diff --git a/test/unittest/options/err.version.r b/test/unittest/options/err.version.r
> index 6cdd1f7f..7c659859 100644
> --- a/test/unittest/options/err.version.r
> +++ b/test/unittest/options/err.version.r
> @@ -1,2 +1,2 @@
>   -- @@stderr --
> -dtrace: failed to set -x version: Requested version is not supported by compiler
> +dtrace: failed to set -x version: Operation not supported
> diff --git a/test/unittest/options/tst.version.r b/test/unittest/options/tst.version.r
> deleted file mode 100644
> index 8b137891..00000000
> --- a/test/unittest/options/tst.version.r
> +++ /dev/null
> @@ -1 +0,0 @@
> -
> diff --git a/test/unittest/options/tst.version.sh b/test/unittest/options/tst.version.sh
> deleted file mode 100755
> index 37fb6f75..00000000
> --- a/test/unittest/options/tst.version.sh
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#!/bin/bash
> -#
> -# Oracle Linux DTrace.
> -# Copyright (c) 2023, 2025,Oracle and/or its affiliates. All rights reserved.
> -# Licensed under the Universal Permissive License v 1.0 as shown at
> -# http://oss.oracle.com/licenses/upl.
> -#
> -
> -dtrace=$1
> -
> -myversion=`$dtrace $dt_flags -V | gawk '{ print $NF }'`
> -
> -$dtrace $dt_flags -xversion=$myversion -qn 'BEGIN { exit(0) }'
> -exit $?
> diff --git a/test/unittest/version/err.1.1.d b/test/unittest/version/err.1.1.d
> deleted file mode 100644
> index 0b63421f..00000000
> --- a/test/unittest/version/err.1.1.d
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -/* @@runtest-opts: -Ze */
> -
> -#pragma D option version=1.1
> -
> -/*
> - * The following identifiers were added as D built-ins as of version 1.1.
> - * Using these identifiers as user-specified variables should be illegal in
> - * that and any later versions, but legal in earlier versions.
> - */
> -int strstr;
> -int strchr;
> -int strrchr;
> -int strtok;
> -int substr;
> -int index;
> -int freopen;
> -
> -write:entry
> -{
> -	exit(0);
> -}
> diff --git a/test/unittest/version/tst.1.0.d b/test/unittest/version/tst.1.0.d
> deleted file mode 100644
> index 79f23b0d..00000000
> --- a/test/unittest/version/tst.1.0.d
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -/* @@runtest-opts: -Ze */
> -
> -#pragma D option version=1.0
> -
> -/*
> - * The following identifiers were added as D built-ins as of version 1.1.
> - * Using these identifiers as user-specified variables should be illegal in
> - * that and any later versions, but legal in earlier versions.
> - */
> -int strstr;
> -int strchr;
> -int strrchr;
> -int strtok;
> -int substr;
> -int index;
> -int freopen;
> -
> -write:entry
> -{
> -	exit(0);
> -}
> -
