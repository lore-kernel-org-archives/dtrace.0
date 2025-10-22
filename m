Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5F23AE9A
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 05:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761109623; cv=fail; b=XWh4+WLOx//0oK6PK7kSp07GSm6dreZid8TMfenDFI/1z2JtkGFbKahh6UbpvP+WGpeTZYN8i/isFTi43cANFDVELl+Qa/RUanhhKd8VWttwKbthLbuxcuV0W/CPgRauFYWafNVioU1sBZEi4aKdZXc7r+qMqZAK6GRlMtst1/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761109623; c=relaxed/simple;
	bh=MBvFhLtGAS6D9WqoUDeKHxbWELtb/30ykCtF9EEafjM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NhdWoLnd4L69YhjhsDFa0JF0lK7zaxHjPf2+uEm0vtuGDQVQfIA/N+ONpiOOkN/UGfFF/y7whCp66xDwxAiIRZeoshYfTjoHVsKn2RPfHrLJQKUX5XIdBiq5a6eZJ0QzqkeDEAFBDJfkTrihDqH5R3xJ0SzbaBgo+n09V5lS/io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JAD5Nw6P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sdlSulvY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JAD5Nw6P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sdlSulvY"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NPPY010852
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 05:06:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=UlLNF/ItH/xKkVqfFNSycGgUczDCrVWhcX2LqGZazKI=; b=
	JAD5Nw6PfpOhFOMRQCOiG7JZYNVNqdj6iGW92+RKhye2TFxyErMdFTf/8aQYwx4/
	8mjlFvsyVb+lGHxcPOajAOZQlGrtBKb0A9Hglko08fBBG6am2uEzZNpqCv1crg2T
	SguBkHrcKvY1e87RpZnFlqskAAJbRyBLqYW852GtuNV9722luX4pEMZXx666o4Gf
	C+7XzesHujIEQZMmmUmaxcVw6If9p0m6vFZAIHQepG+bZfUzxjIfN1L/CluO2Bt7
	YdQ98iyk8J0XZz1w7u/U1GUFKxk1Rkl1Xew1S1IxD+VbTc22lawIm/qdRPTptgOr
	6qMRod2QDtQ7Bo9rz97dzw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2ypxvr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 05:06:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M2oo9e025386
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 05:06:57 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012063.outbound.protection.outlook.com [40.93.195.63])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcq10n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 05:06:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKxfpPasc/8BEgIUgdJhh7c46hYPCamhdvr13tKuD0VvC34NQeFcyADea0ztjD/RfQ1APtioSRPNR3s+njz72abvbGlFuu5Ai7GtvRSUpF6dpxQ1H0X3RDEQFBzBGCgZ67thBGgMJ6Cf7321aluIFjiE2AvTf/1rABwob8wv9zSZxHkbWSfIX/ku+DeT7v0Vwl7opvng7LvlgYfPp65Fib2muuGTwkli0ltlPHDeOziG7p1QpzAgDM6Db33JUvXWiY0Ks9Cm+pWaYzvqyI6MZtXKcle5/oWyMy//x02OcPrH4XVZD107nAJe591TugqX11zHS4MRLEKKJLC+HQQOBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlLNF/ItH/xKkVqfFNSycGgUczDCrVWhcX2LqGZazKI=;
 b=rRAvEH0+iv2ogUnlEV5sJkwEeoQqp4nfqgXEY77hn8pPsNZ4phVMKiJSw/3EgSOKDbz1+eRafCgAk2JWDDwMhLs0UqdavSmTP3XFBxz75J9elfA68snJ37gsjTxG7wmy/JNaigBpMUlk2HuOoRCcd8O8awhQon0G4pgmz0QfvdBNoGmfCIXw4CkQODgPVVnq4Iq6Xncee9+/OfEiM6BlqQ4kxdyIbQVYk4gLBG/+GEBBPsMti6uzLLoTM6adi7524oHkr9F5JPInkY0JTA46p/DoDLBiY0Yyl9VgLbzA3rFT1/Q4Y5fpCiVHwaJmyNp5FAWZbLuwo0Bn2pu0PdI2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlLNF/ItH/xKkVqfFNSycGgUczDCrVWhcX2LqGZazKI=;
 b=sdlSulvY/CoS1AlrjogFDeLNJBlSD2kEL2QqXv2mxaZF0gIm8ZuIp4gVbdFHnvvyGY+dz73GMZiz9WL44JDiL7MUbgHR6QdJtV95r6nraDfx37674KoSl0TT041rlv+FY8LEG5u69n6O4LgCnWUujtEvQBThDOGVw4jRrc3jDIU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7742.namprd10.prod.outlook.com (2603:10b6:610:1ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 05:06:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 05:06:54 +0000
Message-ID: <290c46de-f96b-5318-9eaf-5a6121b7083a@oracle.com>
Date: Wed, 22 Oct 2025 01:06:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCHv2] Update llms-txt and add README
Content-Language: en-US
To: Bruce McCulloch <bruce.mcculloch@oracle.com>, dtrace@lists.linux.dev
References: <20251021201638.1318745-2-bruce.mcculloch@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20251021201638.1318745-2-bruce.mcculloch@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0058.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 3256fa35-6a9f-425e-95cb-08de1128d16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clFFSXQwQ2l3MlRqY2k5SHo5c2JLNW9yRGtCQ29PN0p6dVdPTTV4c3dYZ2Nz?=
 =?utf-8?B?dHpOZ3NKaHc5RG5vbkk4THl5RUxKc1BzYkN3Ni9lSHFWTWx0aXNZSDJ1aXgv?=
 =?utf-8?B?THBXQlRHWStXTjFYWitMVUFmTVpneHR4Z3pNTnpBV1pTbUQrS2dZdUh2L29H?=
 =?utf-8?B?aFlBMVZadFM3eThsSmZLZXZSUCtVOGZmTlFQblA4bC9jNFlQYnZSclNkWStx?=
 =?utf-8?B?c2JiZDg4TGtnNHdMNTdZb1BVbHA0VjZHdlJBUTU5MVcxRTliVUpZaWdKUFNN?=
 =?utf-8?B?NkpTZjc1eFNYbStlR3ZERVNORFVkbmdIQ0NjVUdwMFltMDlOODVIKzVQWnlW?=
 =?utf-8?B?MHllb055N3BjT0l6SXJZTzhoc1FnMFV0SzZNKzB2ZlJseFV2RXZlRGhBOXNo?=
 =?utf-8?B?cFVNZitWRlBjdnNYaVpUQmxGZGxFbGpDaWp5eFIxUTQzT01IM0RnaVAwTmNh?=
 =?utf-8?B?NkxCRzdLck5DT2YwOHBHL3h3ZktaRHEwbjNEMG4zYU5oRGhVSWw3ZWJZSW9M?=
 =?utf-8?B?dEZLT0srbjhzbmluelpwbHM2U051TTVPNGRpQmZ6MVVYYTNMRWwvSlJVOVpz?=
 =?utf-8?B?R2NZMHRpQnpUZkNKaFQ3SC9XbTZrRUlqMHl1N2VnVkJmb1BWbWFjWU5mWGJT?=
 =?utf-8?B?Z3NzUWl1YnorNVRzOEVGRXIwc1hGQ1Zha3NUNmxEMTV5QUgrRGhvb2FvTy9j?=
 =?utf-8?B?VzVzSGI3dTNwQ1NLcDlmbzJXMVJMclRRTWF3K2JBQnZlbmFacHZCMUN3REh4?=
 =?utf-8?B?cjdBa1A0LzdyZ1JCQ2M4Q0pLcTMvUVB6SmkyeXl5WWNrb3BaNUN4b3ZvZ2Iw?=
 =?utf-8?B?dnF5VGZHa0kwSWowSWtST1hzZW5MWlZZVUpoUXA4L0JMSXRJVndtTVJPRGlZ?=
 =?utf-8?B?UURVaU9PM3dKOVhGZzhnN3dWSW0xVWk3VEFzZjVhMkQ4Tk95dWZJenkrVFU4?=
 =?utf-8?B?V1lWeFdJUXlGRWVWWDdnOFg0N1NuQkdqcmFadHQ0YWIzdTZpazNIZEJ6enFu?=
 =?utf-8?B?UlNHRTFhaXJIZGowV2wwOWFCS1RIbUMzZWFWY3BNQ3R0MVQ5VHdHYXYzR1Ba?=
 =?utf-8?B?VmhUMkNHZFdHMWtSYk50d0JxVUZuVzhvWFpJMjFTbE81bUlLdm1hbnd2YmpQ?=
 =?utf-8?B?VlpOZXRvcDhCR1NLWXNRT0FCSTlmeUJmU0Q2QlRSckRmVjdwSGlLUS9yWmxS?=
 =?utf-8?B?VGQ5NzJ1RGxHZU9lczN0TnVmRHpKTVhOcHdFZUFXNmN0cDFDVEVmUSsydS9H?=
 =?utf-8?B?Wlpnb0VmcHozbm1uRE9sQ05vSWVpNHVnN0wvaVBKRUsybWZsYVpvWkZOV0xW?=
 =?utf-8?B?RlVkNE9KdWs2eHN2dU5mMkRxeTd5ZWM4dHEzc1ZnK0dPZldJZ0VDZEo0dFJ5?=
 =?utf-8?B?RHR6ZEk5VDhIZ3JKbU45VFNnS2RMQ1o1WUwxU3ZPa2dlUjN4UWlmMnd0cExo?=
 =?utf-8?B?bUxBbk5tOVduVXBRVC8zSlpRZHBvVGxXQjV5UEJwYkxDVkc0T2RDT3BDd2FX?=
 =?utf-8?B?R0JxN3lBQUJFYS9qRnVCQlB2cmFoTVdodzdIalZMcHpSS2NtSWR3dlNWek1M?=
 =?utf-8?B?a1dadHUwSGZ5WDdsYktzbm5GcmxidFEvMmJYSUhzQ1lROXZGSkQ1VzV1ZGlh?=
 =?utf-8?B?dUlMVWgwekV3TVBKOWp2Wm5lYTZ3eFozUmY5RmlibXFWTnVoSmlOOThneHl1?=
 =?utf-8?B?VGFHVnYwMFNYMnF6RDdyRFAySm54R3ZXc2ZGUDlkbHZNUXhSbWlyR3o3dzFo?=
 =?utf-8?B?YWpGZlFneXVrejlkSXZKOUpydmJVWUI5YUdleEtpL2dTOENoOVNjalhaT3VH?=
 =?utf-8?B?TEZLTlUwQzJ1YjRLZTZnNDVjUzk0enlrQ2NXQWpZQm9PNTg0NWZUeEJxdUx0?=
 =?utf-8?B?QmdoNDIxYkptVmlnU0lCRFdSVy9Ca2RVR011WHVuelJOcXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1J1S2VLZkxvYUNoaHZMNEtjUDJiY1JpbVNzOUoyRW9nMzhwWlpUVUhqM04z?=
 =?utf-8?B?cUhsVzVpYy8zMTBsR1ZMYUlyZm11MWQyYnM1N3lJczJWbDdEaE5yazlNeWRC?=
 =?utf-8?B?MFRDTTA4UitqK1dYeUJNRGtqSXFuSHZSOFFCWUxRcWhFNG1FcTd6T1h3L2d5?=
 =?utf-8?B?d2JyYUlxQ3FZMWV1SnZjd2pYZSt3SnZOT2J1ZUc2bEMveTcvbXV5QmMzNTVM?=
 =?utf-8?B?R3lIRkxuVnNoSGl3M0RHTzRBOW5jN1RpWU1rWXZXMVNYZUo5R3hxYWZsZDMz?=
 =?utf-8?B?bnVoa0ZVckh2WDF2VTJpK1NJR1g1YmN1WGxUR0ZTa0lXdHk2TjI1dFlBQVo0?=
 =?utf-8?B?SElZSFc3amdwYkZoUlUrUkVkYi91cmxpVmJKVUJ2ZzFFWS8rOWgvdjhZSytK?=
 =?utf-8?B?M0NsTUlFSDV2K252N3RoQXQ3bU8wdGhTcWxLUVJJWTAvM2dYeVN3aVNDcnhj?=
 =?utf-8?B?OUQ2ZXcvcERhMm11N1lGYkJWK0ErUUFTTEFWbWd6dkNodm15MGozZW9CdEFj?=
 =?utf-8?B?WVo1bXhtY256VTNpUGZzL2QvRS9IRE1UUTBmRUw5MWgxTmZQRElUbUIrRnM2?=
 =?utf-8?B?cVdpbWJYVmFvTXdMSGJpVDZoekt3T0E0cWxnM1l1QjdORVlRU2ZtNjVWUFMy?=
 =?utf-8?B?Vnl2REQxYmdxWmtHZkRJc2NoeTZpclFrUGw1eWRuZUZyajVudS9HVVZEb0NL?=
 =?utf-8?B?Y09ESEZsTmhyN0FKVUQzNkQyZlVSUUFRbDJxVWlFbHo4Wjc0VnBvVGpVZ2VP?=
 =?utf-8?B?dVo4ZmhpNWN3Y0luYm5wYks4dys0YTZ2WThMTUh4YnlES2tkS09VMSsvVlg3?=
 =?utf-8?B?OWN4M0NsU1hlQVlxNXdWbEduWG9FeDhDNEVYMTJvaExsNmNKdTRveVBIYVNS?=
 =?utf-8?B?OVMwTk13dlFQeWx2RW1raXpmTWpsRkdsYmUxZmtvcWlDdy9qUyt1bU0zeTAw?=
 =?utf-8?B?Wm93VXl4dEdZTThkandSb09hOXl5S2J3akxkWSt4YnZKUkx1Ym5PNjdCR1JT?=
 =?utf-8?B?NXlCVjkxMDFndFBXYktXZTA2YVhSK0JpTGpaaldzTVZTMnhKTTFjNC9LRGFR?=
 =?utf-8?B?c3lqMzh5MVZxU2hiVWs3QzFHMldaaUY5cGo5aFFjY0QwUExUeDFsZzlkNlhN?=
 =?utf-8?B?K3RNc3RjTGloWk5ZanJPZFl4bFBRS3VKc3R1Z0NKdEQxKzh1Rmo0YnAyYzAx?=
 =?utf-8?B?emk1NUI0dlpocW9hM3FBdlgrZndQcjNNWGJOdHZKTmxob0hOZkhxL3JqYjFl?=
 =?utf-8?B?akpETm1PZnlESmI4azJXMTZrSnJWaEZyT0NVeDgxYzdhWTRVWmpIMjRxV01z?=
 =?utf-8?B?a2pNN1VwRCs4NmN5ejU3TU93aDBjN28wTHRNbkhURDVod1ltMm5SNVljU0Zn?=
 =?utf-8?B?R0VpR1BMeU1xSUtubS9vZHRVWGxRdEJQQ2hNUER5MkdQTUxCcU0zNlNYUVdj?=
 =?utf-8?B?YzhZUDEvZTJBQXNrMXNWbTU3bGRXbmxaUDRFOUpuZ3hNNUNEK2RhTTJEMTZV?=
 =?utf-8?B?L2JaNzUxRHhtazcrcEtPVW1jeEp3d3M4aExLSXgyRVVzNmw3b0k3Y3Brd0I1?=
 =?utf-8?B?RXZvWFNaUGVuR2xnZlZJSmRFZisxa1haZHg1SzgrbE9JMEg3SW5pdUFJdVEy?=
 =?utf-8?B?V1pZcEFJN2RCL01aa2FtYlpENnltUFFuekd5aU9teWxWc0JVVjdLOTM3WG5I?=
 =?utf-8?B?OVUyQnVPTWVZRlVDVkNSMG1KZlBkY3JwRGRaY3AxQ21vT3Y3S3o1Y0FkZkRW?=
 =?utf-8?B?d2hhVDlsQ0dzRVpMaWlCMVRaNi90bHBnWjlWbjAwTXpYck9yUkliWGNkZ25n?=
 =?utf-8?B?ekN6dnpobDA5RElSRFQzdkJvb2E3dkdPMnhDN2htak1rSVBCNWtEYnJNSnhv?=
 =?utf-8?B?bUNOYXhFaDBMODM5a3N0dTBxSWViWWJySDBRd2lhc0Rvdk9nMkRWeGVnTXVw?=
 =?utf-8?B?UHd1Uy9nOGN6VGJMUXhaVkxHTTBPeWZya3Z6bUorNm9hSzlSSysrUUtUazlT?=
 =?utf-8?B?TzgyQ0ZIZ0tXRmNmdWdmaDJsQkFKa05KM0hxb3I1NmFxL2ROODRRS1FwVFhP?=
 =?utf-8?B?WHkrRlp5M3lZZUppSXBGMmlQKzM2OU01QSt5TjR2bUJLMEJCZHVZd3ZVSU1h?=
 =?utf-8?Q?GhRdmqnTxoCXOjfWwU0k8dJE1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/7i3TSg1lA1yrVQMtBHwLjOVdmi4DXLEvs1IVNJZa6ftnH8wgfe6Ceg/ALlOW/Y/Ql0rhjsM96Iz6D0iYCvRja6tPj/dFD2zTnZ8pbeI/AM9gC3GXr7CBUpdUwGfLCo6vpYdYkBBfAty5J2MWjSUHEsvL63Klwf/JSN2BQ7fZXQP/9iOPMuwNpX3O8KsMwdFNhELvUm5Y+j6Q2OTeWDsMrYx+Evehzs9mOormWaPMpwyU9UV/ebcj+4SlEZb8UB5b+vIqMO5ijFMevQXckQHpGEvVhaMqPR3A1e8qmfPgIrBgHcOILBNuXfsgvaaIjN+QK3yPI/UuDKrRV9+PPCNaIwYgimwQyCQeO/5uDMA1gnHyoOsjpQE9QnOer9/MfPMTEVqCyLkb5IwN4lIDTUd9xTBGVSfksHxAYSSfjGapAXK3TrsIgkOKC5GF2NoI4UjIxeQ52hp36zpXJj5ooGWXoNnk3tsbWi4rhPSrjqyDBfhR3tZjHHtXjxD860xbFlL47GdY3X3pYsa52+yL7fmhICB1k1StETK3eq02YHA63MyGhFCbCbU0UPO3Jwbk+1sV8F4qlD0Z3a5w2oBQ4KY3kf+pQKG5J50yZUgQ+WJ5h4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3256fa35-6a9f-425e-95cb-08de1128d16b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 05:06:54.5634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caGS38xjyBDK01mRrH/QNOMbXpPWmu+hiqm4tg1BWFqVrSwgDDoWFB4EUcux2dOtJKhInuUwJJta8YdU8qwmDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7742
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220039
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfXwauuUskFwDiw
 EYutjvms4s92d/2JgC1ZlFFLRX/xVHW4NEWVOM6i/C1QrCIAg4iiGuN9oca6ubdbNXr10db2s3X
 XAaZBRKmcATdXx3eXla3mTXdsemsJH9zo1HlYD0tM2eyTBLmBm9zId5C6AQK6IQT5yCLyrVVGSX
 3oTnkXB7Uc5P5D05G0tahjyqdcxLL4mDFszv/pubxbgvb7VFutllhgCKNNvSqJWG6gutlgyLTB1
 s86l0jZCrkUpofFim0jAGwZYRH1XHCjyEmWFswT1e6xrQDzvBsIdiArrnuqY2EvcQcwzDb+LdjH
 IrNwrSnPCUMzWCGicSZ7e6i/Dv2aDulBXcrQGrmdZmjcgNGINEq9fEVwBYh08FYaHxXs8rsyWcP
 6lFKv39EZnvgMU//LqqUKCNxFa/ETw==
X-Proofpoint-GUID: vA6TEpKQW7KF3WarqbcyiRr_9s9QbIFj
X-Authority-Analysis: v=2.4 cv=Db8aa/tW c=1 sm=1 tr=0 ts=68f86672 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=-bMhQ6iiAAAA:8 a=yPCof4ZbAAAA:8 a=uH5r_W6JY0JBcEd-IyUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=aViEl8YYgB_fEZN5ws7z:22
 a=poXaRoVlC6wW9_mwW8W4:22 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: vA6TEpKQW7KF3WarqbcyiRr_9s9QbIFj

On 10/21/25 16:16, Bruce McCulloch wrote:

> Hello,
> I have removed the reference to the blog-git html file, and edited the
> links at the bottom to include a link to the actual (public facing)
> blog.
>
> Bruce
> ---

I would eliminate the above text since future readers will not have the 
v1 version of this patch anyhow.

> Signed-off-by: Bruce McCulloch<bruce.mcculloch@oracle.com>
> ---
>   llm/README.md                | 130 ++++++++
>   llm/llms-dtrace-complete.txt |   2 +
>   llm/llms-dtrace-short.txt    | 611 +++++++++++++++++++++++++++++++++++
>   3 files changed, 743 insertions(+)
>   create mode 100644 llm/README.md
>   create mode 100644 llm/llms-dtrace-short.txt
>
> diff --git a/llm/README.md b/llm/README.md
> new file mode 100644
> index 00000000..7324a636
> --- /dev/null
> +++ b/llm/README.md
> @@ -0,0 +1,130 @@
> +# DTrace LLM Context Files
> +
> +## Overview
> +These files provide structured **context packs** (`llms-txt` format) for use with large language models (LLMs) such as GPT-4 or Claude.
> +They teach the model how to write **correct, safe, and complete DTrace programs** for Oracle Linux.
> +
> +The goal is to let engineers and administrators generate working D scripts in natural language — without having to memorize the entire D language syntax.
> +
> +> The context files describe probe syntax, predicates, statements, variables, built-ins, functions, and safe tracing idioms for core providers (`syscall`, `proc`, `sched`, `profile`, `io`, `pid`, `usdt`, etc.).
> +
> +---
> +
> +## Files
> +| File | Description |
> +|------|--------------|
> +| `llms-dtrace-short.txt` | Compact reference used to bootstrap LLMs for DTrace knowledge. |
> +| `llms-dtrace-complete.txt` | Full expanded reference (available from the [DTrace-utils repo](https://github.com/oracle/dtrace-utils/tree/devel/llm)). |

Maybe I'm just tired, but I'm confused here.  Why wouldn't the reader of 
this file simply get the llms file from the same place where they are 
reading this file... whether in some git clone or from github or wherever.

> +
> +---
> +
> +## How to Use
> +
> +1. **Install DTrace**
> +
> +   ```bash
> +   sudo dnf install dtrace
> +
> +```

The opening ``` is indented.  So I think the closing ``` must be equally 
indented in order for it to be seen.

> +
> +Make sure you are using the DTrace binary from the `dtrace-utils` package,_not_  the SystemTap compatibility binary:
> +
> +```bash
> +which dtrace
> +sudo /usr/sbin/dtrace -V
> +
> +```

I suspect this "Make sure you are..." sentence and ensuing code block 
are also supposed to be indented.

> +
> +2.  **Load the context file into your LLM session**
> +
> +    -   In ChatGPT, Claude, or another interface that supports file context, click the “+” icon and upload `llms-dtrace-short.txt`.
> +
> +    -   The model will automatically ingest the reference and understand how to write runnable DTrace programs for Oracle Linux.
> +
> +3.  **Start asking questions in natural language**
> +
> +    You can now prompt the model to produce valid D scripts:
> +
> +    ```
> +    write a dtrace script that shows all read() syscalls made while the script is running
> +
> +    ```
> +
> +    or
> +
> +    ```
> +    count how many processes start on the system within 5 seconds
> +
> +    ```
> +
> +4.  **Run the generated script**
> +
> +    Save the model’s output (e.g. `trace.d`), then execute:
> +
> +    ```bash
> +    sudo dtrace -s trace.d
> +
> +    ```
> +
> +
> +----------
> +
> +## Example Prompts
> +
> +Here are a few good starting points:
> +
> +>“Write a DTrace script that prints the PID of every process that accesses memory.”
> +
> +Teaches process-level tracing and probe filters.
> +
> +>“Provide a DTrace script to count how many processes are started over 5 seconds.”
> +
> +Demonstrates use of timed aggregations.
> +
> +>“Show all `read()` syscalls and count how many occur per process.”
> +
> +Basic syscall entry/return tracing.
> +
> +>“Track which executables call `open()` and print errors.”
> +
> +Uses speculation and error guards.
> +
> +----------
> +
> +## Safety and Trust
> +
> +DTrace runs in **nondestructive mode by default**.
> +Even if an LLM suggests unsafe actions, the runtime will prevent writes, signals, or other destructive operations unless explicitly enabled with `-w`.
> +
> +This makes LLM-generated scripts safe to test and explore on production or staging systems — they can observe but not modify the kernel state.
> +
> +----------
> +
> +## Notes and Troubleshooting
> +
> +-   If you see:
> +
> +    ```
> +    dtrace: could not enable tracing: Destructive actions not allowed
> +
> +    ```
> +
> +    either remove `system()` calls or rerun with `sudo dtrace -w -s script.d`.
> +
> +-   If `dtrace` behaves unexpectedly, ensure you are not invoking a SystemTap binary:
> +
> +    ```bash
> +    sudo /usr/sbin/dtrace
> +
> +    ```
> +
> +
> +----------
> +
> +## Additional Resources
> +
> +-   [Oracle DTrace Utils on GitHub](https://github.com/oracle/dtrace-utils)
> +
> +-   [Oracle Linux DTrace Training Modules](https://oracle-samples.github.io/oltrain/tracks/ol/dtrace/)
> +
> +-   [Oracle Linux Blog: Natural Language System Tracing with Dtrace and LLMs](https://blogs.oracle.com/linux/post/dtrace-and-llms)
> diff --git a/llm/llms-dtrace-complete.txt b/llm/llms-dtrace-complete.txt
> index 2264fc40..8a4a535c 100644
> --- a/llm/llms-dtrace-complete.txt
> +++ b/llm/llms-dtrace-complete.txt
> @@ -2,6 +2,8 @@ You are a senior systems engineer with deep expertise in writing DTrace programs
>   
>   You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
>   
> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
> +
>   Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
>   
>   After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> diff --git a/llm/llms-dtrace-short.txt b/llm/llms-dtrace-short.txt
> new file mode 100644
> index 00000000..a514abbf
> --- /dev/null
> +++ b/llm/llms-dtrace-short.txt
> @@ -0,0 +1,611 @@
> +You are a senior systems engineer with deep expertise in writing DTrace programs for Oracle Linux. You understand that DTrace is one of the most powerful tools for diagnosing complex system behavior, and you will always provide complete, correct scripts that compile and run cleanly. Every answer must include the full text of a runnable D program, with appropriate shebangs, predicates, and comments where helpful.
> +
> +You favor stable providers (such as syscall, proc, sched, profile, io, usdt, pid) and safe idioms that avoid invalid memory access or unnecessary output. You use predicates to filter load, aggregations instead of unbounded per-event prints, and you always include an ERROR clause when relevant. Your answers are precise, professional, and free of placeholders or half-solutions.
> +
> +DO NOT RECOMMEND DANGEROUS OPERATIONS UNLESS THERE IS AN ALTERNATIVE. Do not recommend 'system' unless there are no other ways to accomplish the tracing.
> +
> +Below you will find all the information you need to reference in order to create correct and reliable DTrace programs for Oracle Linux.
> +
> +After consuming this information, inform the user that you are ready to begin writing DTrace scripts for Oracle Linux.
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 1: PROGRAM STRUCTURE, PROBE DESCRIPTIONS, PREDICATES, STATEMENTS
> +
> +## GOAL
> +Provide a compact, machine-optimized reference so an LLM can generate correct DTrace D programs for Oracle Linux.
> +
> +## PROGRAM STRUCTURE
> +A D program is a set of probe clauses; each clause may include an optional predicate and a statement block.
> +Syntax skeleton:
> +```
> +probe descriptions
> +/ optional predicate /
> +{
> +    statements
> +}
> +```
> +- Multiple clauses allowed; run in program order.
> +- Empty `{}` triggers the default action (trace EPID).
> +- Scripts may be invoked via `dtrace` (shebang/interpreter line).
> +- Scripts can include pragma options.
> +
> +## PROBE DESCRIPTIONS
> +Canonical form: `provider:module:function:name`
> +Fields:
> +- provider — DTrace provider name
> +- module — kernel object / library / program, if location-specific
> +- function — program function, if location-specific
> +- name — semantic probe name (e.g., BEGIN, END)
> +
> +Shorthand precedence when fields are omitted:
> +- name
> +- function:name
> +- module:function:name
> +
> +Avoid numeric probe IDs (unstable).
> +Wildcards & patterns supported (shell-style globbing). Empty fields match any value.
> +
> +### Pattern tokens
> +- `*` — any string (incl. empty)
> +- `?` — any single character
> +- `[set]` — any one in set; `[a-z]` range; `[!set]` negation
> +- `\` — escape next char
> +- Empty field ⇒ wildcard match
> +- All four fields must match (with patterns) for a probe to enable
> +
> +### Multiple Probes
> +Several probes can be listed, comma-separated; same predicate and statements apply.
> +
> +### Examples
> +- All syscall entries: `syscall:::entry`
> +- BEGIN without module/function: `dtrace:::BEGIN`
> +- List available probes: `dtrace -l`
> +
> +## PREDICATES
> +- Optional boolean expression between slashes: `/ expr /`
> +- Evaluated at probe fire to decide whether to execute statements
> +- Any D expression of integer/pointer type; nonzero ⇒ true
> +- Can reference variables, built-ins, and operators
> +
> +Examples:
> +- Match only "date" process: `/execname == "date"/`
> +- Targeted PID: `/pid == $target/`
> +
> +## STATEMENTS (CLAUSES)
> +- Semicolon-separated expressions/functions inside `{ ... }`
> +- Default action when `{}` empty: report probe activation (EPID)
> +- Clauses can use aggregations, variables, built-ins, and functions
> +
> +### Minimal idioms
> +Count events by function:
> +```
> +syscall:::entry
> +{
> +    @counts[probefunc] = count();
> +}
> +```
> +
> +Predicate filter by execname:
> +```
> +syscall:::entry
> +/execname == "date"/
> +{
> +    @reads[probefunc] = count();
> +}
> +```
> +
> +## NOTES & STABILITY
> +- Probe IDs are not stable; prefer full descriptions
> +- Providers, modules, functions, names may have differing stability attributes
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 2: TYPES, OPERATORS, EXPRESSIONS
> +
> +## IDENTIFIERS & KEYWORDS
> +- Identifiers: letters, digits, underscore; must start with letter/_
> +- Reserved keywords (subset relevant to D):
> +  auto, break, case, const, continue, counter, default, do, else, enum, extern, float, for, goto, if, import, inline, int, long, probe, provider, register, restrict, return, self, short, signed, sizeof, static, string, stringof, struct, switch, this, translator, typedef, union, unsigned, void, volatile, while, xlate
> +- Avoid names starting with `_` (reserved for system)
> +
> +## DATA TYPES
> +### Integer Types
> +- char (1 byte), short (2), int (4), long (8), long long (8)
> +- signed by default; add `unsigned` qualifier for unsigned
> +
> +### Integer Aliases
> +- int8_t, int16_t, int32_t, int64_t
> +- uint8_t, uint16_t, uint32_t, uint64_t
> +- intptr_t, uintptr_t
> +
> +### Floating Point
> +- float (4 bytes), double (8), long double (16)
> +- Floating-point arithmetic not permitted; can trace/printf values
> +
> +### Strings
> +- `string` type represents ASCII strings
> +- Special handling for tracing, comparison, functions
> +
> +### Pointers
> +- Declared as `type *`
> +- Example: `int *p;`
> +- Safe: invalid deref ⇒ BADADDR fault, ERROR probe fires
> +
> +### Structs & Unions
> +- ANSI C-like definition
> +- Access via `.` and `->`
> +
> +### Arrays
> +- Scalar arrays: fixed-length `[n]`
> +- Associative arrays: `name[key]`
> +- Multidimensional arrays supported
> +
> +### Enumerations
> +- `enum colors { RED, GREEN, BLUE }`
> +- Values assigned sequentially unless overridden
> +
> +### Typedef
> +- `typedef existing-type alias;`
> +
> +### Inlines
> +- Named constants: `inline type name = expression;`
> +
> +### Namespaces
> +- Backtick (`) to access kernel/module types: `struct vmlinux\`task_struct`
> +
> +## CONSTANTS
> +- Integer: decimal (123), octal (012), hex (0x123)
> +- Floating: decimal with dot or exponent
> +- Character: `'a'`, escape sequences (`\n`, `\t`, etc.)
> +- String: `"hello"`, stored as null-terminated
> +
> +## OPERATORS
> +
> +### Arithmetic
> +- `+` add, `-` sub, `*` mul, `/` div, `%` mod
> +- Integer and pointer arithmetic only
> +- Division by zero ⇒ ERROR probe
> +
> +### Relational
> +- `<`, `<=`, `>`, `>=`, `==`, `!=`
> +- Applied to int, ptr, string
> +- Strings compare lexically
> +
> +### Logical
> +- `&&` AND, `||` OR, `^^` XOR, `!` NOT
> +- Short-circuit for `&&` and `||`
> +
> +### Bitwise
> +- `~` NOT, `&` AND, `|` OR, `^` XOR, `<<` shift left, `>>` shift right
> +
> +### Assignment
> +- `=`, `+=`, `-=`, `*=`, `/=`, `%=`, `&=`, `|=`, `^=`, `<<=`, `>>=`
> +
> +### Increment / Decrement
> +- `++`, `--` (prefix/postfix)
> +- Works on int and ptr types
> +
> +### Conditional
> +- Ternary `?:` operator
> +- Example: `x = i == 0 ? "zero" : "nonzero";`
> +
> +### Type Conversion
> +- Implicit: usual arithmetic conversions (C-like)
> +- Explicit cast: `(int)x`
> +
> +## OPERATOR PRECEDENCE (highest → lowest)
> +- `() [] -> .`
> +- Unary: `! ~ ++ -- + - * & (type) sizeof stringof offsetof xlate`
> +- `* / %`
> +- `+ -`
> +- `<< >>`
> +- `< <= > >=`
> +- `== !=`
> +- `&`
> +- `^`
> +- `|`
> +- `&&`
> +- `^^`
> +- `||`
> +- `?:`
> +- Assignments: `= += -= *= /= %= &= ^= <<= >>=`
> +- `,` (evaluate left→right, return rightmost)
> +
> +### Misc Operators
> +- `sizeof(expr)` — size in bytes
> +- `offsetof(type, member)` — offset of struct member
> +- `stringof(expr)` — convert to string
> +- `xlate(expr)` — translate type
> +- Unary `&` — address of object
> +- Unary `*` — dereference pointer
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 3: VARIABLES
> +
> +## VARIABLE CLASSES
> +- Scalar variables: single data objects (int, ptr, string, struct, etc.)
> +- Associative arrays: dynamic, keyed collections
> +- Scalar arrays: fixed-length, indexed by int
> +- Multidimensional arrays: ANSI C-compatible, rarely used
> +- Variables created implicitly on first assignment
> +
> +## VARIABLE SCOPE
> +- Global: `varname`
> +- Thread-local: `self->varname`
> +- Clause-local: `this->varname`
> +- External (kernel symbols): `` `symbol ``
> +
> +### Table: Scope summary
> +- Global: shared by all threads, not MP-safe
> +- Thread-local: per-thread storage, MP-safe
> +- Clause-local: per-probe-firing storage, MP-safe
> +- External: access kernel variables, read-only
> +
> +## GLOBAL VARIABLES
> +- Declared implicitly on assignment or explicitly outside clauses
> +- Examples:
> +```
> +x = 123;            /* int */
> +s = "hello";        /* string */
> +a[123, 'a'] = 456;  /* associative array */
> +```
> +- Explicit declaration (no init value allowed):
> +```
> +int x;
> +int arr[unsigned long long, char];
> +```
> +
> +Initialization can be done in `BEGIN` clause.
> +
> +## THREAD-LOCAL VARIABLES
> +- Scoped to each OS thread
> +- Syntax: `self->name`
> +- Examples:
> +```
> +syscall::read:entry
> +{
> +    self->read = 1;
> +}
> +```
> +- Created implicitly; type = RHS of first assignment
> +- Can also declare explicitly: `self int x;`
> +
> +## CLAUSE-LOCAL VARIABLES
> +- Scoped to single probe firing, persist across clauses for same probe
> +- Syntax: `this->name`
> +- Example:
> +```
> +BEGIN
> +{
> +    this->secs = timestamp / 1000000000;
> +}
> +```
> +- Explicit declaration: `this int x;`
> +- Faster than associative arrays, use for temporary calculations
> +
> +## EXTERNAL VARIABLES
> +- Access OS/kernel variables and symbols
> +- Syntax: `` module`symbol ``
> +- Examples:
> +``
> +trace(`max_pfn);
> +trace(&`max_pfn);
> +``
> +- Names kept in separate namespace from D identifiers
> +- Read-only for safety
> +
> +## ARRAYS
> +### Associative Arrays
> +- Dynamic, unlimited elements
> +- Syntax: `name[key] = value;`
> +- Key can be any type (int, string, tuple)
> +- Delete element: assign 0 → `arr[key] = 0;`
> +
> +### Scalar Arrays
> +- Fixed length, declared with `[n]`
> +- Example: `int arr[5];`
> +- Bounds checked at compile-time
> +
> +### Multidimensional Scalar Arrays
> +- ANSI C-compatible: `int m[12][34];`
> +- Access: `m[0][1]`
> +
> +Note: `arr[0][1]` (multidimensional) ≠ `arr[0,1]` (associative tuple key)
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 4: BUILT-IN VARIABLES AND MACRO VARIABLES
> +
> +## BUILT-IN VARIABLES
> +Automatically available within all D programs.
> +
> +### Process & Thread
> +- `pid` — process ID
> +- `ppid` — parent process ID
> +- `tid` — thread ID
> +- `execname` — current process name
> +
> +### Probe Metadata
> +- `probeprov` — provider
> +- `probemod` — module
> +- `probefunc` — function
> +- `probename` — name
> +
> +### Time
> +- `timestamp` — nanosecond, monotonic
> +- `vtimestamp` — per-thread virtualized timestamp
> +
> +### Call Stack & Location
> +- `caller` — kernel PC of calling function
> +- `ucaller` — user-level PC of calling function
> +
> +### Syscall & Error
> +- `errno` — last thread error number
> +
> +### Arguments
> +- `arg0` … `arg9` — probe arguments (64-bit)
> +- `args[]` — typed argument array
> +
> +## MACRO VARIABLES
> +Expanded at compile time, not runtime.
> +
> +### Process & User Info
> +- `$pid`, `$ppid` — current / parent process ID
> +- `$uid`, `$gid` — user / group ID
> +- `$target` — target process specified via `-p` option
> +- `$1`, `$2`, … — script arguments
> +
> +### Notes
> +- Macro variables allow parameterization of scripts
> +- Expansion occurs at compile-time, before execution
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 5: FUNCTIONS
> +
> +## DATA RECORDING FUNCTIONS
> +- `trace(expr)` — store expr in trace buffer
> +- `printf(fmt, ...)` — formatted print
> +- `printa(fmt, @aggr)` — print aggregation(s)
> +- `exit(code)` — terminate tracing, run END
> +
> +## AGGREGATION FUNCTIONS
> +- `count()` — number of probe firings
> +- `sum(x)` — sum of values
> +- `avg(x)` — average of values
> +- `min(x)` — minimum
> +- `max(x)` — maximum
> +- `stddev(x)` — standard deviation
> +- `quantize(x)` — power-of-two histogram
> +- `lquantize(x, from, to, step)` — linear histogram
> +- `llquantize(x, factor, low, high)` — log-linear histogram
> +
> +## SPECULATION FUNCTIONS
> +- `speculation()` — allocate speculative buffer, return ID
> +- `speculate(ID)` — record subsequent actions to speculation buffer
> +- `commit(ID)` — commit speculative buffer to main trace
> +- `discard(ID)` — discard speculative buffer
> +
> +## MEMORY COPYING FUNCTIONS
> +- `copyin(addr, size)` — copy from user space
> +- `copyinstr(addr[, size])` — copy NUL-terminated string from user
> +- `copyinto(addr, size, dest)` — copy into DTrace memory
> +- `copyout(src, addr, size)` — write to user space (destructive)
> +- `copyoutstr(str, addr, size)` — write string to user (destructive)
> +
> +## STRING FUNCTIONS
> +- `strlen(s)` — string length
> +- `strjoin(a, b)` — concatenate
> +- `substr(s, i[, len])` — substring
> +- `index(str, sub[, start])` — first occurrence of sub
> +- `rindex(str, sub[, start])` — last occurrence of sub
> +- `strchr(str, c)` — first char occurrence
> +- `strrchr(str, c)` — last char occurrence
> +- `strstr(str, sub)` — substring search
> +- `strtok(str, delim)` — tokenize
> +
> +## STACK & EXECUTION FUNCTIONS
> +- `stack([nframes])` — kernel stack trace
> +- `ustack([nframes, strsize])` — user stack trace
> +- `system(cmd)` — execute shell command (destructive)
> +- `raise(sig)` — send signal to process (destructive)
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 6: PROVIDERS & COMMON PROBES
> +
> +## PROVIDERS OVERVIEW
> +Providers group related probes. Each probe is identified by `provider:module:function:name`.
> +
> +### Core Providers
> +- `dtrace`
> +  - BEGIN — fires at start of tracing
> +  - END — fires at end of tracing
> +  - ERROR — fires on D program error
> +
> +- `syscall`
> +  - Entry/return of all system calls
> +  - Examples: `syscall::open:entry`, `syscall::write:return`
> +
> +- `proc`
> +  - Process lifecycle events
> +  - create, exec, exit, signal
> +
> +- `sched`
> +  - Scheduler events
> +  - on-cpu, off-cpu, enqueue, dequeue, wakeup
> +
> +- `io`
> +  - Device I/O events
> +  - start, done
> +
> +- `profile`
> +  - Time-based sampling
> +  - `profile-N` — kernel stack sample every N Hz
> +  - `tick-N` — fires every N seconds
> +
> +- `lockstat`
> +  - Kernel lock contention statistics
> +  - spin, adaptive, rw lock events
> +
> +- `fbt` (function boundary tracing)
> +  - Kernel function entry/return probes
> +  - Powerful but potentially unsafe (debug/dev only)
> +
> +- `pid`
> +  - User-level function boundary tracing for a process
> +
> +- `usdt` (user-level statically defined tracing)
> +  - Static tracepoints in user programs
> +
> +- `cpc`
> +  - CPU performance counter probes
> +
> +## EXAMPLE USES
> +
> +### System Calls
> +```
> +syscall:::entry
> +{
> +    @calls[execname] = count();
> +}
> +```
> +
> +### Process Creation
> +```
> +proc:::exec-success
> +{
> +    printf("%s exec %s", execname, copyinstr(arg0));
> +}
> +```
> +
> +### Scheduler Events
> +```
> +sched:::on-cpu
> +{
> +    @oncpu[execname] = count();
> +}
> +```
> +
> +### Profile Sampling
> +```
> +profile-1000
> +{
> +    @[ustack()] = count();
> +}
> +```
> +
> +### I/O Operations
> +```
> +io:::start
> +{
> +    @io[execname] = count();
> +}
> +```
> +
> +DTRACE (ORACLE LINUX) — LLMS.TXT FORMAT
> +PART 7: COMMON PATTERNS
> +
> +## COUNT SYSCALLS BY PROCESS
> +```
> +syscall:::entry
> +/execname != ""/
> +{
> +    @syscalls[execname] = count();
> +}
> +END
> +{
> +    printa(@syscalls);
> +}
> +```
> +
> +## TIME A SPECIFIC SYSCALL
> +```
> +syscall::write:entry
> +{
> +    self->ts = timestamp;
> +}
> +syscall::write:return
> +/self->ts/
> +{
> +    @delta[execname] = quantize(timestamp - self->ts);
> +    self->ts = 0;
> +}
> +```
> +
> +## TRACE OPEN CALLS WITH ERRORS (SPECULATION)
> +```
> +syscall::open:entry
> +{
> +    self->spec = speculation();
> +    speculate(self->spec);
> +    printf("open: %s", copyinstr(arg0));
> +}
> +syscall::open:return/self->spec/
> +{
> +    speculate(self->spec);
> +    trace(errno);
> +}
> +syscall::open:return/self->spec && errno != 0/
> +{
> +    commit(self->spec);
> +    self->spec = 0;
> +}
> +syscall::open:return/self->spec && errno == 0/
> +{
> +    discard(self->spec);
> +    self->spec = 0;
> +}
> +```
> +
> +## PROFILE USER STACKS (SAMPLING)
> +```
> +profile-1000
> +{
> +    @[ustack()] = count();
> +}
> +```
> +
> +## TRACK PROCESS EXECUTIONS
> +```
> +proc:::exec-success
> +{
> +    printf("%s -> %s", execname, copyinstr(arg0));
> +}
> +```
> +
> +## COUNT SCHEDULER ON-CPU EVENTS
> +```
> +sched:::on-cpu
> +{
> +    @oncpu[execname] = count();
> +}
> +```
> +
> +## I/O ACTIVITY BY PROCESS
> +```
> +io:::start
> +{
> +    @io[execname] = count();
> +}
> +```
> +
> +## TRACK ERRORS
> +```
> +ERROR
> +{
> +    printf("DTrace error: %s", probename);
> +}
> +```
> +
> +## TRACE ARGUMENTS OF FUNCTION
> +```
> +syscall::open:entry
> +{
> +    printf("open(%s)", copyinstr(arg0));
> +}
> +```
> +
> +## LIMIT TRACE TO TARGET PID
> +```
> +syscall:::entry
> +/pid == $target/
> +{
> +    @syscalls[probefunc] = count();
> +}
> +```
> -- 2.47.3
