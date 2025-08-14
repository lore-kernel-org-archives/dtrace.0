Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D571F869E
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755190054; cv=fail; b=sBcE/lVMWaoMGxpVcGaHuaCdPm5PGwv0KSKMZQprdttubR02ufotmWdpn7pbIknVMI4rE6PW/+gzd0NsGMbbrGgZoCm1kjgLSezIgBLl3Wn++3YpCMpjIIBvMipO2p5sMLf9sw1dVtwlYHuPjh5putchmj/jnqEL7qCnq1TdGC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755190054; c=relaxed/simple;
	bh=VhL5Nd+skOiBYksy59foD/huALklskTx+e1ZyinFAsk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dOD2UzB2296GoG+G3kIQ21IwD4alxK/n/ZT8hFTTV2jXNE08ow2JSPqi6t5b1JGGPog6o9bWKJu5mVf3/m4vsoV/vdfd9eAxyTpESeO1BUvw0FE9mgblD/9iPUSinCW8w63b/9DAo3w3bGrMER+vcRsdSqm+l+V3LlVcIDTLjV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BGrzlo4Y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DS5uVEeY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BGrzlo4Y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DS5uVEeY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECg4aG020195
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=dssmNu8C//9mabNyeXWyN/ihy+Mh+RqtxIkk7/1OlMs=; b=
	BGrzlo4YgGT2Q6RJo5l40K2hJ8ofTQD0ZGSB7Wx2ObopuJodv29iKq98td6TTEd+
	pInSLdLJ8fyh2HbG69PmYe87T4fw4RBrGdjv5nvr/LLZ8a9I3DJFHxpM3HLFGkAs
	FqfEhM1Sj9XLu44L3eA96lAqI+diJnQyqCOY6g7Kg1aDcGb80lvACs8IuhKGuSts
	fjLlnjZ9w4b2NpmmcBu80tm/f3wXJBCjnlIqYQAyDujY1bEuAw6quNDpB1Lhmq9j
	E3EMC+o1OB+GcfcAzZ9lOyrdrunxwFnQFivuJZZlpY97UqbvNaoe5X/XNR8l+6Fe
	Rvs9QmsdBKIkMXWZ5GwbPQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw452fes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:47:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EFv8R1030087
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:47:29 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsd0e0n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:47:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5etIRSidrOdC/5IB8oHEGXPIb1rTFKowfy5VG/L0i6QtkZ5rb3yMQDnFzwIlcoH5ZoxCA24Tt8l8Y4bcxPeIlQynQ4/y5T8MXx3R6/UbcP5h3Bfd4bg6BFmbsU9GZCX3+7ZaoF11LlEswn+EKehaKFO2lIjLK1RcaVtmK9c0UZaYeVen839YAFAOpWs+3XIok/irZ2FDU8+MGYTFG1iIkpNFxGwKSApJ3jewXcmdkY+iie4vGPTlsi+W6wd2PmpNZ+uKsKoPt0/EW/8NF+dcd6kjfGRnOkPrIcsUBuZDfIsO9b9z45+nftSApV+lkI2+sChGIH7YMVX/OrUSRtpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dssmNu8C//9mabNyeXWyN/ihy+Mh+RqtxIkk7/1OlMs=;
 b=ELjOV89JnWNNUDhUJdImc5M89UTw4oa/hQxovcgBn/vg7Iv+7PqJGgWsdB0qd6OXtnoEAgwCAqDn0kXiGLvPyavjBUebxKwvUl34PnCfDcWY3k4Pwut4O8OF9xnJ+Qb0/8Cz9YSlC6g8BNYNgSeRKBKXIer6XCUGwpFEcuBViWK5oHH3T+maoObkSwy7/DKGCXK7b6A49mgGn2215Vt/jVNpCQLNMd8tfXeA+96cuir2+4YgzwYx9RymJyfKKpNwU6/AolPIEBDNfBqllv9XoRAwhgbsPRJR3P9w2esvt+5LMG+yzTTveLvFkpWBbsVZc3sdE/E3/i29gT8gBn/53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dssmNu8C//9mabNyeXWyN/ihy+Mh+RqtxIkk7/1OlMs=;
 b=DS5uVEeYnXquzwzUzpyU7KWSjhY/jdW2yhwDTYgipkR1TDVQmu7zuc8R0z9Qq5fGcqz/MrYmXySApmoItQegmneULPJFIpZKBPxQpCXskiubBYoLRShy6WMMNa0JmwgvM6EUBXgakrw9tb827IhaTVqlTXnAFJnTf0NAgaHWQTM=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SA2PR10MB4537.namprd10.prod.outlook.com (2603:10b6:806:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Thu, 14 Aug
 2025 16:47:27 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 16:47:26 +0000
Message-ID: <8e075b06-1d39-3d9c-3924-61e948827485@oracle.com>
Date: Thu, 14 Aug 2025 12:47:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] uprobe: do not call populate_args() for
 pid probes
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB56724556AE44FF193BB9207CC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB56724556AE44FF193BB9207CC235A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SA2PR10MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bfd850-87a9-4a46-2498-08dddb524045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MVJ4aGlkUFZyem5pWndNcFM3cU5nMEhSQ25CazRwNEpqbitLWkI1ckpwWi9n?=
 =?utf-8?B?ekdKRk5RNEJVbTlobGtjTDhnU1VSRHh0cis3OGhmdEFhTk5qZW1xV3ZWRlpn?=
 =?utf-8?B?Z29nRThGVk11NUlXYVVueHZTNW1TU0R2Y05HTThnN0J0aGdGbUNGbkxMWmZL?=
 =?utf-8?B?dTZ2SEdNSFpteFg2YU5MKzhCRVpYL0Q1ZzhBd2YrN2JWcDh4Zmt1VjRkcUlk?=
 =?utf-8?B?Y3JQOWRPbWlMNzFYR1FQM2xjdThPMHpQeFFTdWxmMzAyazRQWGFINkpRQitt?=
 =?utf-8?B?ZHRsNk0zbXpZeVc0MG9XalllZVB4aFRDVUR4UlVMUnVJdHAyYmVIOERBSzhX?=
 =?utf-8?B?c0c2cGtjeXZGd1RHcElIK3VNNS9veExQZVVTWUdqMHpZV3pDUHp2VUpjWHQr?=
 =?utf-8?B?c3E0akVFNWo3VW1vdE90UDFxVE9WQWVCdUFLSkpza1d0V2hhZW5ZNWZUa2JR?=
 =?utf-8?B?WTNIZVhhSjQ0cHhYeWhHdUlGNzc0N2R0L3RHNjFhclRBRTNsNiszMkNSbnNR?=
 =?utf-8?B?bVNBZlFBSnQyZVBrWUQwVUt6d2I3clFCd1grVGdiZ3AyY1cveUM0aG1aaTVV?=
 =?utf-8?B?RUdzNjBKektFMlFsZGpSRGZEZzFQUE1LUk9kVkFnVzVOQlRtL2RlekIyV01v?=
 =?utf-8?B?SzhSS1ZwakdmcklKLzNXSk02SjZZN0dvaEZIT3BMY0FwTy8yanRvNjFMUWdI?=
 =?utf-8?B?UWowSGc3R0Jzd3RHaFg1UFQ5MWdnYlBzZXh2TnFDblBsc1R0YkMzVjJpRCtm?=
 =?utf-8?B?YkxyV3BqYTF1V3dXWFIyc0lWR2UvbkhxVUMvSVFnMEtNM1Q3NCszRmRyOFVW?=
 =?utf-8?B?NDEzRFd0OEJ6RlZ1b3dNRGt1SEpGcUtFWFA0cGVTanVPMzJSU3VqTlF2Nndx?=
 =?utf-8?B?Q1BxOEtFWDFSZEJrUzF6eGk5OTBVN3RFWUtQbGNUbUNHTkFUTU1SZFhMeldx?=
 =?utf-8?B?cEJ6cE4xZnlEakRpSys0b09FZm5vR1RVS0xDZmxwQzJjN2dzV3JNYmxBbTVs?=
 =?utf-8?B?MjNnYzNjb0ZHZDFVM2s5VFR2QmZVc1RRZTBmTjF6aWJPOHRoRm5sVGtqMGg5?=
 =?utf-8?B?MzMrUFErRlR4c3Z3eEJsNTFyRjZaQjNobG5zTjVGdGROUUhrb3NzVlI4V1d2?=
 =?utf-8?B?RmtSUVN1bEg0WUZQZUQ4ZGFCNHV2RnVWb01GUk1ocmtJUzk3bVZpV3lIL0VN?=
 =?utf-8?B?MDEybjlFMkE2cW0zaEhxTDNrTDgzM09jZmFNeTdFMU9XbVNTNnBOSEQyZ1F4?=
 =?utf-8?B?TlhvTnJuNFB1UlNYMWlZNTRYUW5oSE5CYmJ4QkhiejE5OFJjV1dsQ1ltYnJZ?=
 =?utf-8?B?OFhPcWRnbCtMSXBnV1VOZUVwaEJPdEV5R2FQbTh3TUpsa1I4Um52NVdTc3ZL?=
 =?utf-8?B?SDFZaGVtMjZQTU1ydXhjV29QSDExeHFIWEZEaVQ1cmZPSDZrK3pqNEh5TUxT?=
 =?utf-8?B?OVo0SlhtVWUySTYxVFpVWHpOMmZMSzZ3VkNFWCtlYUpNYnRuQkdId29aRWVM?=
 =?utf-8?B?K2lJR3ZsQnR6Q3JUMDVZODlUQm9udDF1ejIveHdlN2RRcDFNVGY3MDFPcjJX?=
 =?utf-8?B?MDgwYTZaU1kxQnlieGw3VVhCa3h3RnlkdkYyUVFaK3BZdk9IMzNRRjJWTkdV?=
 =?utf-8?B?ZGFLS3BUK1JneDdXVU1LTTF4bWJRVGkxbDA2OGpXWWdWRlhpOGJUU2FtelpL?=
 =?utf-8?B?NUlNQUtsQ1pld0w4NFZTUWlCSFo4VnRRekJLbU5OVnBsclZ6c0xWaEI5MUph?=
 =?utf-8?B?aFpJR1QyUXlGaG9sZHYzTzNYSThRVVB0M21Ma2prSG9aZFpaNlRlZVNxVXVZ?=
 =?utf-8?B?U2IwS05GNUhuRDZQb0hoTm1CNS9wdFk2b3RPYngyQjdZOUUxSWNacFJtdFBE?=
 =?utf-8?B?RHQxY3JENzhRblgzQUt5b1dvYU9kZUNZS2dUT1ZMajNXMzlVV2pFaTAxOUZG?=
 =?utf-8?Q?KcOE9b4jelk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDRNUlpLRWtxSCt5SHRLR2dWOHRVRkRJMmlDWU5xVmpxWTJ2TS9EYU9SL3dn?=
 =?utf-8?B?ZnJQTlozZkhzbVY1TTNNMjVjdFk5OFVQQWR5MjNvaGRxK1ZCN05pWGEvbVNS?=
 =?utf-8?B?NkRveHRvd2lCbnpzaHVPRTZDckZaUnJaN3pkS1RLQUZ0bHg3OGZ6cEF5OUVM?=
 =?utf-8?B?dURtaDhzQmFNRGZrZm5iamczbGxqb0p5RE5qTE1BQWl2NXdyWmg5Y3IxeUo0?=
 =?utf-8?B?R0tCTDcvWVVWL0owTjdQUzNHMmorMTV1dExaekY5ZUZzNTFuME9XN1RjVEht?=
 =?utf-8?B?SS9Ia1BiSUZCWUU3VTB6b3RzQXVNVGhOd3lsNlZ5eHR0RG9ablJUYjVUYkM0?=
 =?utf-8?B?b216L1VUaWE3MW40NVhVUC9MNldBRmZJUDNVOHFPYnhGNGFCT0R1R0FsZmJs?=
 =?utf-8?B?Qm5XVk9GL3A2b1FxZy9tNk1OcUN6TCtremwzS3lxOTVXQjRTSTVzWEEyN0Qy?=
 =?utf-8?B?eFN5VUM4SU05ZmdqWnREV2pUWUkyQnBZdDNBU3liVzFTSlVVR0hmNExWT1pP?=
 =?utf-8?B?dFBvY0lUNFZpYm03OFBzelpvSDhCa2tmN1RzWCt6VmduY2RoS1dLNS8rWFRQ?=
 =?utf-8?B?a1o0WmJmTG5LWFRkQkxUNFVPWk8xNDlEZWVtemFXVVVLTjJuUjQ4dVZUZmZL?=
 =?utf-8?B?VHJvVWtxdjhDZ0xOd3VVdmdmZDB3U0V2d3dlYWtDdlBWRklmZlBtTzBHcnBo?=
 =?utf-8?B?MVlNR0hLbEFHcFA5bHIrQ3EyWEhaaFV6L0svM1FoTloySmZoKzJ5WW1YVEM3?=
 =?utf-8?B?SFd0WjJpWDRIYmNpeFkvWUVpcmVSN2p1dzFzUkYvREFZaEJjN3NUamdEdXdO?=
 =?utf-8?B?VVRCNGhScnZueVVaQ1NJQjluaHMzT3djMGdqS05DRWpCOGtGbE11Ym1aVGpM?=
 =?utf-8?B?UzNQMWU1OXZkL05wYXVwSGUyM3czUi9GcGlpelFidlJOeGRrQmNOOFowUXB2?=
 =?utf-8?B?TWk3TGpPclFKSWc4VU5zeFhHTWh2Z2RDbEh4bDRDaGdnSnRjbEl4UzcrWk4y?=
 =?utf-8?B?VlN4Y3pSQ3YxbXZLdGxsYjRTdnVEMlhuUXB1N1NDWitVYnV0bTBvc3llb0wr?=
 =?utf-8?B?dGdaQUV4UzFrb3hDN1FvdFZJQmFTTHFsRXlMS2pOM3gvL3kyNWRvOHU5ZGJp?=
 =?utf-8?B?c3EvcGZKYUM4UE1OTTlQUE0yTE1HbmpuWDdac0VqL08vK3VzWFNyLzZMTUhQ?=
 =?utf-8?B?L1dCczRURzBKZ0lPV2Z1b3l4T0ZqaFE5WXVmTnIwS1R1VjdDeE1oTC9Tdzgx?=
 =?utf-8?B?aGtzaStvRE9NZGNJVzZoTkFOZHExa0c1Qnc5RmluT1NxYjhNdWo5d3dUOVNh?=
 =?utf-8?B?Rm9rMjF2QkxKVlBWd1haV2V4NG1XMkRiYWFiNU5IQTNtdUpDOXJsblNWaVpO?=
 =?utf-8?B?S25GN2ZrNFJnMHg3VjRrZ2dVQkZzRkgzN1FTVFcyWVdWZ1NISDdtM2FZNlBI?=
 =?utf-8?B?cnNsbWJVWkQ2L2VRSThRUDdBemdXOTVrWDV5V283Mmc3d3FWbCtoRldwN0Ru?=
 =?utf-8?B?Y1IvWStqaGxsOVc2MXhmaDZDaytBSElOcG9QTTgvaUl5RlBNTU5KVFZxb0k1?=
 =?utf-8?B?UTdHYnlybWVsQ0h4WjFKaUxXbzVna3QwZWxKZHZLY2Fyei9Tc01HTHNZbWc3?=
 =?utf-8?B?b2V4blZ0VExPbnFFcTkzZlczdWc5ZmlEWHFhdnVhQlhVeU1uQnZJVWg2aE8y?=
 =?utf-8?B?QkF0UEJuWGxKLzYvcEk0YTRLS0RsM1doZG1SNmg1Y3JBTmlsd1FpRm5JcVJ6?=
 =?utf-8?B?c0xTd2VxYWNBN1FUa2wwNEkyMUVRYTdrYUt4UnpUdjB6bThwN0JlUC9CbkVm?=
 =?utf-8?B?bW1kN0pla2tZR2d4YVJaWGY0MVBkL2tPRUc1TytJejQ4Z21BUkYwbzZrNko1?=
 =?utf-8?B?Zm13NGhwTHdoVmhQdkkyMVJaNUh6eGtWZjJmRXYvRHpLM2d1bWVncTF0TlZ6?=
 =?utf-8?B?MlhVa2tUZ3RFQzhyTjM5V0QwYjNFc3Vwa0lYanF0R3kwKzdIbEJUalRvQXF2?=
 =?utf-8?B?N2xjVHlwZlJqU1FZKzlNR3dXUFRLbGlrT0YwVTFvSDBxNVpyV01ScE82N1RH?=
 =?utf-8?B?b25MUS9KOGRUSUVjamVsaGpmSmhTaTN2LzZ1QXE2Nkc5TmlHRGE5ZTAvNmw5?=
 =?utf-8?Q?iRymzFnNqrCwpKAxh/TG42LYu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	joaMKCwqw41gjtfJ+NKNq+DokpB1LUD3u6DwAYQnpTG32eoI1duxAiLdtZ9dFhwiDhf4DkUCB4js/rFDv4ZLAAH5F/Lb5E7Jac/lbrDxugIGZbowqpP8oOATgLwwQ6R+B8VtVTNGMaPrqCtoE37SEuY22lXsAj1io0iU/XhCZ8o75DIA+VWc/VUi4Dybj5kcBYfhcn+9r/xGZVwesjlMBx2OX53sTB10zGPNALDo4MMPg/rN9zBWQSJ6PLxPrQKflGPnJvFiZsaK6wKrWK3kOQw3+ELVorCBqky2yNPwE94VYYkaqLjdCoawVHgNJeLlXLlT9hYZcTV0eLJWNcceyKImydACBVo05jFNMkF78g9V3tzI4x+qX9Z+CUeyLEQMxu5Fu54IGHWX7UFSmSx4K8AeXZpe/8PCoNVN6lfyJdS1wOAaBAdb2LQ+TfKQ3IfoaxtMDEURexOYT4rXJMFwNCesy5TBXqa1OBKU2Kzdwl90gBKBPyrpecnpLC4jI2uWhiB0IDoxIkQ3GALB/naB/eUQm6sjwalqNKVHxVqlJ33zrIoDrDM6wPmjbWhIe6kcw8EodBEk/5cqEGTknO0dnk35SdaeYjSG9bOVCCgO9Lk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bfd850-87a9-4a46-2498-08dddb524045
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:47:26.9680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oNikvK/taIdRtI7OjR18ugeaCdI+h9yo/3JM3WickRxvBjeFq3xnxZTSs1CqtUUdk3mQIJdAEB87WAHCnpMhaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4537
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140143
X-Proofpoint-ORIG-GUID: ZnP-2S7u8ZCWoaYtF2oHwCAYi6nAmfBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDE0MyBTYWx0ZWRfX4cCFOajODK4b
 P/vTiBbsq6O7hEtUM7xVP0OFnANymD8AoCKYWBIzAaMHC9CJMa1/7E/tma7QsvRA/tLkCvuiNjl
 aJVbGog0DIMA9a2OM/TMuhTBbKOYIQ0DYvMY5KomASJgKnHKaCiS1znnkjV3O+M/c6Lazc4b6U0
 J3K544G6+5ZdHriZ/updeuD6ebGp8YI5xmIfs7HjRZerDLN3Fkfq/9UiSMjv4NsbFfpJIUeqghE
 Y0B1BUe9aFo81TxdjrniS0+utIoRzTh+PpVRpL4q8vlxSOnfOj+EJDXpc/I+GU+ab9yBXII6ipK
 gLpkzyOkh7BGfIbN6avj9CGFL3qKhPqDnomF9fqwNzaj3I7hCRw4TLKNhCMUmzz6hLekQVpzSsx
 /YOtu8zndjre3YwKPq99YrXepcuLpDd+wdjAoyxymjF9QD/wfTQp7+j1Qjd3OIV5aOINzvx5
X-Authority-Analysis: v=2.4 cv=X9FSKHTe c=1 sm=1 tr=0 ts=689e1322 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=dAdvVM_J59ggsNZZyooA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZnP-2S7u8ZCWoaYtF2oHwCAYi6nAmfBL

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

FWIW, with every patch I wonder:  "Are there any test issues?" (Like, 
should we test something here?  Were we?  Etc.)  I assume in this 
particular case, problems were revealed by patch "Fix various memory 
leaks related to stapsdt and usdt probes" on tests
     test/unittest/usdt/tst.pidargmap.sh
     test/unittest/usdt/tst.pidargs.sh
     test/unittest/usdt/tst.pidprobes.sh
The present patch is simply to remediate those revealed problems. To me, 
that sort of information is useful in a commit message.

On 8/13/25 23:58, Kris Van Hees via DTrace-devel wrote:
> Only USDT (regular and is-enabled) probes need populate_args().
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_uprobe.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index c63d58383..605ae8397 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -994,8 +994,10 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>   		 */
>   	}
>   
> -	if (populate_args(dtp, psp, upp) < 0)
> -		goto fail;
> +	if (upp->flags & (PP_IS_ENABLED | PP_IS_USDT)) {
> +		if (populate_args(dtp, psp, upp) < 0)
> +			goto fail;
> +	}
>   
>   	return uprp;
>   
