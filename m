Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A01F09B5
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741644264; cv=fail; b=cW9G7gUD50vifgtoxQU59tXfABeR9oizcJHyg7OrqEgE91aOOUiyPA3xqwLq0nGao5KdyoKUXNPQg1G/7cvQSesntjUV1Pf7Lse6I7tXEIo6vnKNkV4tlbChpHOMgElMsHq90dvGfICUjpPpWkRBPwkT3aQhlYvcgVWb4lXXAFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741644264; c=relaxed/simple;
	bh=IQ3+M2Ve/FYM6gLwE23ICJaxW7r44cMg0sTbXX2t5as=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q7I7DhyhFPYQ92u/zs8S40cRAcywifXUki5TwlAolSSGAepHC0LstpGlYf4BxWsDcxqx6aLAiCXJRvtJCAAkSOy+f7on2Sr2Ww+mo/Rga7V9plSRghSsyzuvhUa50bFEPMawgQvHdwjowjWQ0PruLgQLc1cv38dBaM3laGvIy4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HjBUWyUB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BHanEqE6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HjBUWyUB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BHanEqE6"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ALftKe025319
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qDw7g9hY9oPueRB463qmfjVqLwiVLFPoRTZwYMjTAZg=; b=
	HjBUWyUBDwW8CmsCi3G+tb5imuv282vn0VoecqdAFEsIICK6gMi81VDxgR4RdJck
	pDuCylH0ACrY2vzsgLea/y/qsKRAkBtqhY9VSKZh2PBnnpIRuky//5oUhIkIc3Ko
	RD1n7FcLsK/Vpero4tKaRmUlIuvflZ1UyCCFun0hUMP+9rE57JtI4UJzkPmIV5f1
	1padE7SdM9GWLMv3gqEeg7X19g3gzh+Krp/G0mh0oiRcvs9tZcrE9gwT3pn5fmAG
	fk+AQtYA0/gLfuXOCshzw9XzcjxX31okG5C2zSG3m5KKwIp+cRZPlEuGLdrvI6Kn
	Le0D+n4T3toWk2htZx6Hdw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 458ds9km6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:04:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52AKotkb017577
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:04:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2045.outbound.protection.outlook.com [104.47.73.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 458cb8785w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Mar 2025 22:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpWHk2pIaKsKMbegYysHKhInWwOXrN0ukeA91rshspkprRhPnvqxai3XF0s/k3uE1Yb8W4rs3CVYdh02rsrjl1k1W6/trtooHU2M1geH/OlkhktjH6VAxbQEoOoYssuF7166S4s1EMtu5Pr+CBMhkRLDJH3X77o3wZHlM5donImAttcJr8ZvjOxpNYkIGgBhVpv3Hz9gJdolIiitQOQ8Z+/pBbjvhyACFSulzwdO/WpdGnJSOJCvy1fxRcCvaU5rR2/B7Cwvt/IgW5ADtuqEW48XmwggnKMHeJuJ2tl1DeAEVn6gasezTVKUjLYnGaMrHcja32POt1VD2D3jkXD5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDw7g9hY9oPueRB463qmfjVqLwiVLFPoRTZwYMjTAZg=;
 b=Fzg3lQTlewdNdMeSCgp69ijO887erXwva3HvJtlAOOSfPGP/rmnq+pvQVMjq6ffmxLA0uBpYJCUAcUWwYumCqhlCM3YockKlL5oBCX9MgjWl3I8hY+EJhmDIm8WiFweWLcS8BUGwlmaSft2uQhzgYC4Fp5xM06QHgcrtW083PT2DW+rl45AS6dxvtGNIbGvLMN2kVLI2Syw3tERrepYwn/uk/JhBER2PYoT1YxPXLnjpr4jWdTVRNjr5EtBidSOso/1LBFfSLbGAVmb8Nj4kl2yRfDl3U6cAxPFLfDK+cRRj41j08AoHq54RnoeR8mj+KQp2sdgH6Cjo3cOIAm9h/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDw7g9hY9oPueRB463qmfjVqLwiVLFPoRTZwYMjTAZg=;
 b=BHanEqE6abDl8johMLQ9nCA/fLHPqsO9bKLWPSsaDAjSfOXFixxHdLYaRTJXfC4LQp/II20H0Hj5NG9oCyBAWPNa1jRrUtW6DJ2Cv8jOlxFEP7h7GP4Zgte/cDDPThTHrFzKASZTt1zlhjv9lN/C4wLQIE3/uJg6c1qPVrvz0Bo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5718.namprd10.prod.outlook.com (2603:10b6:a03:3ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 22:04:18 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 22:04:18 +0000
Message-ID: <fc889fc7-540a-05c9-1d15-f53886198389@oracle.com>
Date: Mon, 10 Mar 2025 18:04:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/8] ksyms: make symbol name filters less picky
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
 <20250307213441.9495-3-kris.van.hees@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250307213441.9495-3-kris.van.hees@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::49) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: b188902e-d923-4d86-b0f4-08dd601f80c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUhUbjd1MXQ0YVloUmpJQkFnTEVtemRWUm1hbnllaXIzMXNUeEdwY1l2UEth?=
 =?utf-8?B?cTNPY2I1d0VjZFlKTnBmTUxVOVpjV3RLV2ZvL2hhOCtjYXdtaE1NUzhPZmFp?=
 =?utf-8?B?ZkFxK05wUzUwNFlBKytSQk1KZFdrNGdxMXVLMkxuNWFnL00xbUxocCtvSncv?=
 =?utf-8?B?K05udjB5dk5rZGZSMDk1RFM3S2hUbWVCK3N0bjcvM2FMelBHWXpRUzN0dEFp?=
 =?utf-8?B?UUx3YWJzQVZsc1ZFVnc5VGwxY0JhUWlkN1JPMmdCQXN6MWpuUzE0Smw1bFdl?=
 =?utf-8?B?TEFTaDh1VjNEWFJveTBSRUFNY2pvMnk5enBJZEdVZENDRllHQTdWMnIxaHJo?=
 =?utf-8?B?NHgrdzRmTXdxR3pWVVF1SnpTWXNxejNqZEhTOWV2QnQwNU1mbHNrNDN5TXVq?=
 =?utf-8?B?V1hkZUx3bHExR0RLekxIR0ltR1d4WE1EUkxmYTQyQmdsdkRpeWdYOVFkK0la?=
 =?utf-8?B?WUFCejd0UktNRnFZaE5LZDdlMzJTUkRqc0FYWTZnMWpWTllleWhhVk5uK0tm?=
 =?utf-8?B?dUxuYkJWSVNmQkd0bTM0K3ZGa3RmbVNKdzFtMzJWdjRFbW1DWlV5Z3RnMHNq?=
 =?utf-8?B?d3JMdjhCbHBBdlc1WHlQdldLL2NEaHZMamhQNGh0NmwwZjdNRzBsWWgreUxo?=
 =?utf-8?B?WVpyaXovUmtRRnZPSSt5bUptb3dWZ0xZRjJ6MS84Uk1yY3lMK0t5NEZVa3pK?=
 =?utf-8?B?Q25RRVN1cDdISDA0d1BIMUJORWwySnA1dmplMkt3Y0w2OXpxRzZPN2JneG9W?=
 =?utf-8?B?dVI4THZLRmZ5cFBudGVXaXVYMU1LL05xZTFFZ2NYc2ViWWNCdXA5T2E2U0JG?=
 =?utf-8?B?WHJ4TFhpSTNtQmVDR0hCd2x2WlZXa1BIVGpleTNOekQ1YkxKVEc4UGt5RHpx?=
 =?utf-8?B?ajdCRy94STRETWNNMUw5OWY2WklLckcwS0VVVVVRMUEwbzBYYXUxZ1Z2WFZ5?=
 =?utf-8?B?T1ovTVV0VFNhK2MxREV1YTltVHYwLzFqK3BsZlRHcXpCYm5tM1FjcVQ0WURR?=
 =?utf-8?B?eEFXdGxub2dsK0drM0RQOE9jcVdZaTdEMDFLTUQ2bDBnalk4WGl5N0lIQytF?=
 =?utf-8?B?bmE0QU9zcExuQWFYdXZNbWZuS0pwZXhHbE5BWFlINnMzOGpmN0pUQWtvam0x?=
 =?utf-8?B?MStIbUFLRm9sd2tlTFVsa1J5Q1AvYkRaNzRpNE4yYlJvaGVySnoxamtQczhS?=
 =?utf-8?B?d1crTkpVL0o4bjhPVjQ4aFY2NjlJVTFLYzhpWWdwUU1UNkRPMVMwYTNGbDlE?=
 =?utf-8?B?OVhiSWI4U1M4OWJ0c1VQcm1HOFJDcDh3WnhjOUUrcmh2YzdjQnU3eDhFaCth?=
 =?utf-8?B?VHlIM2VZSXlIK0dweUZDdTNsNm44Z0MvenNGOVQ0WlFPbERkUThteEl3c2Rs?=
 =?utf-8?B?b21adkNjME1rbVV5VEE3cHhoam5lZHVXOTVSc29LQU4wYWNWdXBxWnE5ZmFt?=
 =?utf-8?B?YVFBMkgwNDNEMWkrQVJ6d1RwaHBNbUJyWHRROTgzV2ZSV25lbitKcHRLQ0hV?=
 =?utf-8?B?c3VDNEFZQ3dZWjU4aE5uRUxXMm00MDRYWUF6bmcrNDVKN21IOVl6MDhNbFlo?=
 =?utf-8?B?ajRkQlFQNVcyeldyZldiaGZucmVmTWlVOGlSeE9PZk1HVTBxTWpQekI1ZXlt?=
 =?utf-8?B?eWNLT3BTMTVzMlE3OHNrVElkZ1FBMkdoSEhNczFDRXBmcTUwS2p0a0Z2ZWhE?=
 =?utf-8?B?V0V4aDI5elVYZ3ltM1lMUzFvcGdoT3dWZHhWbVV3UzAzY1JSTWdhYytZWkky?=
 =?utf-8?B?RHhHek00c09CaE9JcjNyaE4yam5qd1VDcGtZVVp6eWh3WWN2VUxLdUozTHZs?=
 =?utf-8?B?SndRY1lZM1JCMmh1Q3RnR3BYOE1IUm5DUS9QODc4clVJRFR2TkpGWTQ4dzQv?=
 =?utf-8?Q?OAJw4j0SCIzWs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnJ0MmlLUFEzbTFsRFhMNW5scmpOQjlqU2JueklRS3FaUzdkYnAwR0ZQbXAy?=
 =?utf-8?B?QVU4VWxTclk2OEpoZDR1K0MrYVFwUlAvUmFVV1VKSlRidWtMRVdKK1FDdURL?=
 =?utf-8?B?eC9kbEdCb0ZiNk5oeUIrWVdoRUloTVVPdmlJTG5mVFNWM21kWEkrWUJtMGZJ?=
 =?utf-8?B?UzNvc0RGWW96Vm9jeVduMUI0UHYyY2lXcjZHY1dGSjEzRlgxNmUrZUdUcndG?=
 =?utf-8?B?UEkxbWFocndoWjdJZHFiUzZsNC8zQ2tvMWMyd3QzWUR3RStnRU12WnI1SFlu?=
 =?utf-8?B?SVhlRFlJYU44QkNzZlI5bkdGbHExNVNxMDFBWjRvNWNiTFlIdXJCNGM3VHdL?=
 =?utf-8?B?NkRsa3g0RjIyd3dtT3dBSEd2aEZxbU9pbnpRdFVwb3FXU3VuTHNPNllUN2R6?=
 =?utf-8?B?MFlZd1lHVWZCVVRNQ0lWZU9UenBnMGVsSjNsejdkL3BXSXBmRHZ3MVhCc1lK?=
 =?utf-8?B?MEdxVmxpbGxJYXBodEdGc0RUYlcrcnU0Qit1N3dQZ1dIZjBxU1NMQ2xxQWdP?=
 =?utf-8?B?b3pEUlozS2ViNW4wTS94cGxMUFpYTFdlWk5ZSE5DdVlwRUdxQUU1bVZhc295?=
 =?utf-8?B?R2N4dTlDbGFoR0xpRTRrNVFRajhxRlhTaElOSnMrckZ5clBnMzFYdEV5R0hG?=
 =?utf-8?B?VStZQWt0SGhjNTBWWU9iNGpxZFhSYXZJYjErYVlEREpLSFhlczZTNDZtL3dl?=
 =?utf-8?B?T1YzRHFWZldrdkYwTUZkMGFnUVlWMUtrRHNHSzZkZllOQTdDMi9sK1ErdXA3?=
 =?utf-8?B?aElPNWNnZWZmSTVURFVTb1UzZDBJSUY4Q3NsamNRUFZhSGNvV0s2blRwb1FY?=
 =?utf-8?B?RmZEUUlyd2FnN3dpL1hleUp4NDNXZ1lxVTk1WWJLZWwxSnhWQnlOdzFwSVlk?=
 =?utf-8?B?ejZCOHZMb09BV2VBc2JJamN6azVxOUJ5QVpVWkFzSHo3cVVBSDNKRzZnRzls?=
 =?utf-8?B?S2ZpclFoRUxQR3RJK25YRCtjMWVqQzF5Tkl5UzE5aExad0pZUzRRQVhUbmwr?=
 =?utf-8?B?ejE0ZVdCTnRTS3VjZWFjbnFFZ2plYTNZbElvTmhvdzJkL2MzM3FDR3hjUmFY?=
 =?utf-8?B?SXB2NmpTT0VBUEpuT3lzN1hvaGhmWnFIeFBuQ29Id082VUdOQUJrUC82UVJz?=
 =?utf-8?B?bnh4aFBWRW1qQUVYR1IzWlFPQjZKdDBrWi91K1FVS3ZIVURCenp5MG1PRWxU?=
 =?utf-8?B?ZUNZVnFmS25penRTWU5NK2lQV21MZkRqZE1MZDUzMkRJZ2pzK09jRnJlWXpY?=
 =?utf-8?B?UFVYaTF2Q01BNGtYRDV2WHgxN1pPS0Y2bHV4Sm03ZkYvSlF5U0tIN21XSmlO?=
 =?utf-8?B?dURSd0RXaFJjYmFaSlNPekZZRUQzRGRYZWR2TEx0dGRmQlgvdGJRYitwbm44?=
 =?utf-8?B?TERHNlRvM2FwOHlqMkhVRzJoS1BXbmptSExVUVU0RmhOeisvQVFJNFRJbmdB?=
 =?utf-8?B?dEwvYmFHTzB5L0JsZzUzZVN5THhQS1BJR3krMCsxRWpFMGRZZGRwVVBLcVZ2?=
 =?utf-8?B?bE95T3EyNHZHUzVTU0lBR1dvUkQ3YXFIbmVyd0ltMWQ4ZzlOWjdFUlp4WEIw?=
 =?utf-8?B?QW5WaE9MZkJQcitQNHE0Z05scG12eGg4RVF0VWRLa29DNDdhS1JrcXF3Ymtm?=
 =?utf-8?B?V3ZOU1FDUjZsQ215VUgzVDJ3dU5iaGM0dGlaaWZrcm5mQklPUFRSVll4Z3p4?=
 =?utf-8?B?eFc5V3QxSjZIQWR1N3AwZnBoRWZVOHN6cnJqMUk1eTZLSHJpcTBKa09veUpP?=
 =?utf-8?B?cTYrQXd1NW5XNklER2o3OFhzUkl4NHppeDhLQ29RMDBXOFNwN3pSQm9VN1pI?=
 =?utf-8?B?clRTREpnd2JNa2RBa1RNNDB1a0Vrc3VoNXFTek1uMEIvUHZKMlJEUWVxcnU3?=
 =?utf-8?B?Q2lFbkYzc1gyOFRjMzlyUTU5U253WW5Kb05XZDJMeDJBUk92VlUwRVRyQnpp?=
 =?utf-8?B?VjJrbjRpZE1FU040RldqeHBWUGpXck1xRjZUUnQ2WUc1UUFxU0ZNdnVaUlVM?=
 =?utf-8?B?MFhkY3VxVXEyOUlkZmt4N0JxRVMvRnpoWGNnT1BGSldtTnJPZ2l1RVVBeWVG?=
 =?utf-8?B?ZDU3NWFlZnZCdlR2ZzZZRmlZYkxxL2NBekYvUUQ2U3dTbnBJOEF1Yy9qVE9R?=
 =?utf-8?Q?k6Htz+RxeAwVoIXbYYyw09xbL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iVSCZIdvDI1Yjn42yFWEEY51qlKt0QuLbMjOpiLm7SQtMH+ViZcD+//MonR13fpkAb4sRB8KWKsfzNGX7xK18wYVtZ4b042uH5hXton6grU1AftU9RFkgsc+tAiZMV6NwG2MrjNfaPhSoRmNqzdsSjqe7p9W2mn8GsrrnpOERY7cZ1h9x1VTqa5v73XsIzRHj8CgvvEuyw73gt2Mef8ygXapuCny/ZR6jW0Uq4o91rNwRjWQ/KGOapr6VumznWxINs5Tf27DWffhrVpsrwvgrv3gk7hJivzsUjq60Q61armR7QgLtghcBVFkaW8whCvybKvvTMNyfMiiLRn7pzJOJCaDXy29L4Ph3xUuLGVr6u0hJhO8JTERleIAegba+riajM3JRpZk3BSkovwPC87J2aH/fKYgb86UNjmz1HPemb20zlsVlTVcaewGKXdNm4gSz/dcz0VVd58cGTKds1EluOpMrINvT0FUdhIYRD87/gTJPM2GxopXSFkPbZGq7Bsq8q+D09eiUoDmAGvb4cY/j2kNF1tDGNZoZ8YOQd4AMzRLGyKwkbN/RDUeCBwmb4hTXrZuh+Fv4YgMrXcp+ZIwu8AUi0UcvwdaVS+lpOJSCVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b188902e-d923-4d86-b0f4-08dd601f80c6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 22:04:18.0559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDDqcJvBqKzR+OckqCps1O3zX4E57BhANkMmeVeybNDBRHALYgaBnTblbukBh0b4DSrITtxDKOH5mJyXmW1udg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5718
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_08,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2503100167
X-Proofpoint-GUID: RFnmlJZ0OEeJgZmmYoJz4iSNn6QOvb93
X-Proofpoint-ORIG-GUID: RFnmlJZ0OEeJgZmmYoJz4iSNn6QOvb93

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 3/7/25 16:34, Kris Van Hees wrote:
> Some symbols were being filtered out even though they represent symbols
> that can actually be probed.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_module.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index dc00aa88..2e915e2f 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -1215,7 +1215,7 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
>   	    (strstarts(sym->name, "__syscall_meta__")) ||
>   	    (strstarts(sym->name, "__p_syscall_meta__")) ||
>   	    (strstarts(sym->name, "__event_")) ||
> -	    (strstarts(sym->name, "event_")) ||
> +	    (strstarts(sym->name, "event_") && sym->type == 'd') ||
>   	    (strstarts(sym->name, "ftrace_event_")) ||
>   	    (strstarts(sym->name, "types__")) ||
>   	    (strstarts(sym->name, "args__")) ||
> @@ -1223,7 +1223,6 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
>   	    (strstarts(sym->name, "__tpstrtab_")) ||
>   	    (strstarts(sym->name, "__tpstrtab__")) ||
>   	    (strstarts(sym->name, "__initcall_")) ||
> -	    (strstarts(sym->name, "__setup_")) ||
>   	    (strstarts(sym->name, "__pci_fixup_")))
>   		skip = 1;
>   #undef strstarts
