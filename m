Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C64220F55
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755188330; cv=fail; b=Kzi8D8vCok7PW17ic1gUgQxPpnvOGuMpRPWFA4mg7Rsl7pkZ4T1AyWxzLvX2wmf5jqy/6/Wq1lHP2l+WUd1p6zDtU9g7qhQnJv56KmKV14mLG46Z8qk/QVSkG8G1gwBdXKkfJup6aPVIWWlTgRRls9hpouyvn8jm0ALFlzRHQQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755188330; c=relaxed/simple;
	bh=Q0ire4p7mWgDllNtLtK6J8OmOtdqkrjXuJMz9M+W1fU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hoDra2uCscIVJMtSn8LBLs0MsQZDsugeVC+O2AvIxdIvh8BQlXGOXP7Igiy1f/ACCyqeuk0k23UqWfiKOAo467MewWxmyUFp8nyTozfgv9/sgQA4VaB46HmwP+ybPXE5TscJkRHdWiuoP43qp4fYy3m8M18wmoVe68/4i3dMSNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QZlnnGbr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RtSvEuyg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QZlnnGbr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RtSvEuyg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECgGOJ002179
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:18:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/jcAgxrfWlVIroD5vAX/7a2EJ3dKv9iPzuvnJISY1c0=; b=
	QZlnnGbrKGKgAeiXn1Z9+C+xhWbwcmZRYxOd95zrnC82Jwtz3qAlM/fcWzGs9m1N
	HPhjjWpmiSkhwMTLt0Rg/fY+HHJEz7P0mZZ88thPnvHV5xmm/5ERV2XBlRS7eEwi
	LV43J+019TGonLueEFDiIPEiBo+cxez/ytXTJruYVroJuJGUR/Npeahw8Ul5ZmRS
	/k8L66/ibGlknsFKUYEAhoQ4xmGmcjH5+OXpLtl/6DdQa02q1MHgC7infGMvzi6h
	MGBG8JEUtqKr3Y383h3MMbQ/tqm2TNWFpkhe8355w+XV7jzbO2SRrZVMyzdSD6ou
	WrEyFiixOce5IsDSg66F6w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvx291b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:18:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57EEn5LI030151
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:18:46 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvscycjt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 14 Aug 2025 16:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nv7Owcg3ELg83su6ZWKW5/xsKeTsBSyUQwUJ7Qv6cyO8dahZSo9hdfCo2Y4SXIk7r8wVhBfR8gjhrn6SWRsE938lXbx0cKoOorcakU+VhCMNcoK/89+GT2l60P5YY8968d6PaK+XaUny9XfUsrF7Z+nQjfUTLqO/YfLK3GPBuzwcMK3yVEtg3SIocVmF34Vq7JXpaVuuriGS4Gw/bjGqOj9DVJTYGUb6j00p+DwhAmR6ntHaI0KMuqhxBJZQmqSY6tJdb/c/O861faP8dZTRFVS8Qnx19aMH/0af93d/19oSshG8VcfYVsB86wAvoB+sXawRZBAwp+ajs98bkFAaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jcAgxrfWlVIroD5vAX/7a2EJ3dKv9iPzuvnJISY1c0=;
 b=nRbqkEewO7s7WOPAx9nAey9E0kAK4uCTOophXot3lcgg+2mS2/T2LM/wnbeqA4EhfLZQpAKFjS1Glbif2FAmy84w1U6cFpxUDDDO1FMsQCyJjr82PuH5WXVFCYJhpFjQ730Y+e2cbBESgjy7E5gZbV9xILKykYbLCJerRieg84LAjOAM2LQDp9vmzbU/fHcIWx48R/4rFQz7Pw+C6LFrz1MkLFFaei5c4tA4t/UklU+6FDvuuxuqJKuWBpXNs89J/i0ycU1Mo/NpPf96SdGCWUXHpUPCko3pUxNBDMRhyPkyIluZ3m3ds+Fc9nDcdXkmqui3P02e1NfgNH9MT3Kw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jcAgxrfWlVIroD5vAX/7a2EJ3dKv9iPzuvnJISY1c0=;
 b=RtSvEuygi6J5bv1qjVARrNk358yb34M0hSfConZMNsHug4P+VU2BQlDEshnmtKgu3ZPCAO43GJ/3Ovjt5EHTAJn+nl2VaSlhL/KXzVlL3Hz1krGP+yKMb+WUt63rwK5PExrosauNirX97fNb0LAPL5a944uJGg7iIqF0xLoQzRo=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA0PR10MB6916.namprd10.prod.outlook.com (2603:10b6:208:430::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 16:18:43 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Thu, 14 Aug 2025
 16:18:43 +0000
Message-ID: <90b9cbeb-1960-96f1-5f6d-34acbec013a8@oracle.com>
Date: Thu, 14 Aug 2025 12:18:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 4/5] trace: handle the empty string in a
 sensible way
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672B6FE7FAA35DFE6F946D4C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672B6FE7FAA35DFE6F946D4C22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0155.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::10) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA0PR10MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: fb18c9a5-1ef4-473f-0f57-08dddb4e3ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXFjejRHSUxzdXI5MGlBNlpmcVlOVTBFRVM4Um1NWlJRYkIveURRbEdNc2xS?=
 =?utf-8?B?amYvakpKdDdGNTBnMS9ycG5KeUlNSzZtSXo1UE94N25RbmZxeXpQWW54Vjgw?=
 =?utf-8?B?eVQ1bnlIUmhxQkF6Y0pJNHB0Unk0Ti9qbk04YlAvTXJwNnRIYkNBV09laE51?=
 =?utf-8?B?WnQ4R0dPSGRzWlViSWZYbk1SQWRYazlLdWhqaUhZZHM5enZRd2pQeVJ3YWJj?=
 =?utf-8?B?SzBpbDZkUVpPcmFBRi9GYVVjSkxvWnRvTkt2eXRhazlrNHZSalJ2T2RJRThh?=
 =?utf-8?B?TEhOR1d1RGVocjNEYmdUN09YTUFJMHhsakNjWXpKREVtQU1Mc015bXJqSi9z?=
 =?utf-8?B?azlPOFJJbW5LRDZkQitDZGxFRytQcHlYeGZ3b3dBalBKblJteDhWOXBYbE5m?=
 =?utf-8?B?NW5VUWtzQk5EQ3F2NWJtVUErNUdVWFV3Z253SjdwdG5GOU9VZkpjNXRyRXN0?=
 =?utf-8?B?TUNXWnVVVnUxc2RIc0NPejNLcUc3WUxxdlg4VHNtaGlidGM4RU9wVUh2R0sy?=
 =?utf-8?B?VXFydnAxUSs5K21YZTY5aFVycDg4SU9SUnNVeDVJWndyajdqUXp1Q1FKVzR4?=
 =?utf-8?B?N0RMOHhkK2RQNTEyek5Xd3V1TFJUNHoxMkUzbXdhMVM2SG9mTzkzQ24rKy9Z?=
 =?utf-8?B?TUk4UEo0eWZZbFZ6aHh6RDNlY0ZUMVo4SXJRN0hicVZSSDRZRzJZeGNMS1VL?=
 =?utf-8?B?aXpNR2tEVmYyUTQrU3JZTHBELzd2RENRYUVtc2I4azdPdzVzOFhSOVljVmg2?=
 =?utf-8?B?amJBYXlrRlNFWjNaMy9JNjY1U21CWHg5VWR0bUJiQTd4ZHVMZ01OaEh4ZnNh?=
 =?utf-8?B?RDN3RVhCNC9iM2c3OWhWWDJ6dWN6dG5tVG11VTBudEU1U2srdWhTUUw0bEEy?=
 =?utf-8?B?dW1wMUJsVlZpZ3hsVkh2dTlMT2VoUzV1SndJa1VQaWZrQkVaYWR2QTNTSWxY?=
 =?utf-8?B?TnFxb0ZnaHZhQlh0cTJkNk8zRk5YS3VxZ0ErTHltNlBBaHRMcUxsRXBCbDEv?=
 =?utf-8?B?S3Y3RXpSMVNLaVVCY2hKWlRlTHlIQVFMK2lyQndjN2NSQzM1bk5EempkYlVo?=
 =?utf-8?B?R05zZ1hGekh4VzNVT1BkcG95QVVsaVhUZE9iaGNRWjE3Q3dUclRhYVVHMEZi?=
 =?utf-8?B?bFdoS01yUGY5K3BOR3d4dzZUckVNVkdCaWh5ZlYxT0hPbnNmaEdTcmhPOHlw?=
 =?utf-8?B?WGNlYmh3RnU5MXd2OWxMMVZlcWFVRWxmekE3OHFLLzB3VysrOU5nbGpmWUh2?=
 =?utf-8?B?NlhybDBCOG5GeXdEK0hBbVl2WFN4ei9qWVBSOGt6c2RyQkUyZ2xsOUF0cTFx?=
 =?utf-8?B?MlRacWhBU0ExL3Zlcm93Y3ZLN2hMT0JpR3F6dXBpUVdVaGlFbDhNdEtBL3JF?=
 =?utf-8?B?UnU5U0c1YVJZc095ZlVsSnA4eG53Qm1HK2lBR3oxRTZ6eXVwVlplV0x2bjlu?=
 =?utf-8?B?M1BVRDNQcVQrNE1EeGJyNzVKWlpmdlcvMDQxcjVLd2N2am1HSHhRQldISzhB?=
 =?utf-8?B?NXVoNDhYUGdvSkd3RmZtYW1sWGxmU2JyaEJXTXVKSytqTnN4VzZPZkVmL1gw?=
 =?utf-8?B?WkhDci9NQmJZUCtIekF0cnFleEw3S3hpbFRJUFVmMGszV0RsTFpSZTR6eVBj?=
 =?utf-8?B?c1EycEFJUnRRbFlSRmErdGtZZ0RVbjZUeFNuVlErUm5xYWEvblZVZzVaQW8v?=
 =?utf-8?B?dmFDcWEzakRVNjJ3OVlmd2F2VFlSYTNtRnhBTnlOSy9BRDUra1BoVVJXMk9D?=
 =?utf-8?B?elpLc0t1V3g0RER2aEYzMCtMMU9ZSEMxbHNXVG9XR0x3UytBUDQ4UUhMdkJ5?=
 =?utf-8?B?V2VHRnlOTXJGK2JUUmxvdU5GRTR5cDdOSm9rTjVTRGRzSEQ0VnlFUExtNDdt?=
 =?utf-8?B?OXBSMWVqUXNqUUJXeU9xOEJTZytEQ2lmbmNpT2ZWQXFDNnpVOGVuTlVsdHhM?=
 =?utf-8?Q?2PnRnYzWN5o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkcxaFd0bjBkeFVJbjBJbDkxNlZKZlQrU3pMalJQYklCeCthRklIVDdYUHNr?=
 =?utf-8?B?cTU0d2tucEh2QkZhSGs5d05LQm1MZlJrZ1dNTmhBaU1XNmJNM0FXZDhhYW9L?=
 =?utf-8?B?SWlMdGpQekNWZERBWW5DbmdGRU9uaXVVbWs1bWh5SmRpMk52bm1Ncm5qSFpO?=
 =?utf-8?B?ZFNmR1M4a0JTQ1hER2NDWmxlUDZCbU0vS09zUERzdzYrU0VqZGltbDVxYVVH?=
 =?utf-8?B?cUJibjNlL0tkVUVTVzdEQ1hQTk5LNU9FNFZpa2pQa2JrTDh1azU4dWIvMVRK?=
 =?utf-8?B?TWw5Y1diV05tdms4dFIxRVpmMFE1eEk2TEFyMFU5dHNOcUVvR2FIendpRzgr?=
 =?utf-8?B?VWV6MHZkdUhGM0xpcjJtUjBEYVNUN0RVMEYzeE55aEZHVFpncS8rNGNQUFNv?=
 =?utf-8?B?a0pCUjhOSjRZNWtKaVlvQ012aWh1MVpxWFcxV0VlcU9wWHNpOEU5VHdtWUdG?=
 =?utf-8?B?MVA2U3U3RjBwSWNielR1YmlsRlpEOTFvcEZvSkphSmI5ODArelQ1OW9nZUgv?=
 =?utf-8?B?SGpJd3lhZEpIZkE3bTZCUTc0Sk1mbnV3Wi9IbUt2VlRja2huVW5XdGo1TElG?=
 =?utf-8?B?dDFJOTdnTk5NblhFN1JpRGkvM0tDeENzK2JzQUQzWnNydkovcHJYUzRkZGFr?=
 =?utf-8?B?RURFOWxBeTZMZ1pHRzdscUVQN0JGR1BkT2R6dmdLS3l3emV2dEV2MmxQS3FK?=
 =?utf-8?B?TUhzM2p0NlBEQXE5R0VGK1ZRUmFaRE1UQjNyYjVDM1FlZzJlNFVyWU1peXlC?=
 =?utf-8?B?dnUyVVRJMFZ1UDk1OHdxQlRsb3V2cGZ6eXNicjR2ejlsWXkwNWdRUFpVQzNJ?=
 =?utf-8?B?bEhSdFVRUTYxbC9yc1VnbE96QzBkalZtTWNNaktkWG1TSm9wRGtmM1cxMFF5?=
 =?utf-8?B?eDVpUWx2TWU0anVxSUFNU2RQaWxGcngrK0daRlozTERQaW1TS0w4UTFLWTAx?=
 =?utf-8?B?ejdXb3ozMkd4NWdKOXQ3OGpmOEdEcmp2OVN3VzBQbG0yNStTTDRDeEtEd0tt?=
 =?utf-8?B?aXNodDN6Wnh3WHpjZTlRL09lNDZva0FEcW1kdjM5aXViMVVnL0VnSjRubHgw?=
 =?utf-8?B?QVZPUDNIN2xlSVJyY3BLa0pWYkEzS0doK1hDMmRaREd2ek5GQ1FPRVF6d1R0?=
 =?utf-8?B?R3lQTUtJQ0wwblBLQ05PdTE3MmhOdnhISlRoZm1leGdoNUtUalo4YU5LakhM?=
 =?utf-8?B?WkFsV3NUdWo1RE90cnEranNHY1QrWmh1cXhpZnhiOTI5SkgvbTNRbFRaTVNo?=
 =?utf-8?B?bTRVYnl4cHNFMUh1bm5tWEFkYmhzWWZEZHZSOW5idmJVSHc1ZnFYaFZXWmFx?=
 =?utf-8?B?RERDa0NBN1VUL3JBblNqb3diRzFmZzl1ckZSNmVGOURFUmh1aTA5Rnk5R2Zo?=
 =?utf-8?B?YzFSeEplYk9HcU4zWVdFWllMYXNTWm1DMk5ibDdac3dqcjBpaXgwL2luOWph?=
 =?utf-8?B?ZzhwdVhJR2tPSVB3Z0hEV3lMRzB3a2xHTDBmNXZZN1pUNjBCdUlkdWc5T1Ew?=
 =?utf-8?B?S1lPdCtzVGowNC85RXorMDUxWEN6Y3hSNVc1NER4a2ZDNzdiMXdob2hKZlpQ?=
 =?utf-8?B?VWhZUHpqTXBRUjdqSXo2eGFjdkxlZlVseHA5M0tqQkpCV3BsYmVzMlF1NnUz?=
 =?utf-8?B?aXptR05kclQxY0pKOXJ3Z3gwM1ZpNXIrZnFzYlNUYmlIQnBNQ1B4M3JucEc3?=
 =?utf-8?B?NURiZkQxQW44bVdhSjFuRnIxWEJqbXVJK0pRMkhQNlZnWVJsMkNMN2hhZVRJ?=
 =?utf-8?B?eEptRWlmSHdHYi9UNEN1RXRtNmJVZVJBK290WkEvY0RndktyMUVnVWpmQzZR?=
 =?utf-8?B?NlJ0Ym1IT2I3b0Z2d1hiUks4eVFldHRhTW9JSDJTaDI4YWl1ZXVYK1JMeGxG?=
 =?utf-8?B?Wkt6MWRxSXpBazJicWxveFdJRVJIWHJHNEwrOVJkclBxWXpFMk9hbDZ1dTZP?=
 =?utf-8?B?eTZpSm5xbkRKYVZib2ZSbFRZcGJzSzhLclYweWFpQVdERjRrZ0J3TFIxZFZh?=
 =?utf-8?B?RmQwS0owWTlKVDM5Qmw0RHZsRExPVEwxUUFJWWp1cC9UM1J0RkdaNFVyakVB?=
 =?utf-8?B?L0cwRlp3cWh4eDNFdUsyL2EzbXMzWXUzVCtIOEtIVUtYWjFhSWhjQ1BCQ05X?=
 =?utf-8?Q?PstmQjD8nf/GFVVKRnS82mfZj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7BJ+wpM4MQoDvtwZcZz6LywZiYyiSMN/Hk7px9RErGdQkMRFS8EXB9DoYTmp6Ji6UbEx9RO5o+44PyzClH9ddoq7uFDie2PTqMXEU5PUaD/l+WqS6s0rhlZaGpvlWOhcULWzCwRw1fH9UmCzJZTunPFICMW3DjlUgvMibWGkNdR7/YZqMSy5DWD1DorCAuLcBECfBm8P2Qs2hz4uA21bplUfOrJSzdKl7L1Vg72aL0S869lpjwlmhSbfAxBzOQyK9kt3+9i6z6fu3Jek378uc0ye354pfpiiqt+5RyzjYRbdBfOSZoxo3qC4zmXcgOX0Bi4oABMyuYtUP2SnWSXT4bh40qFNPcPcVv4YvrMYT4hMLtgx+6780e/X1UJYNOHOO8qF8iuSJ9EZNglgDYeCcJ4Pa+EnyFy6/6kRwl4japC2l9D1vWgcPghmh6kme2edqALmmVCptT2PHS7j60KAlcxnZz5zP+WRb32m+9SOmyINPlOynp38t/OF29rgWrcBGeAgg0MIPnijofMpju4ErpofdSKt044+LKpVsXa2KGLXQrF4QXon0ib/HsuHyupUYL7AVjTpgiwUeqB0Et53Y3lT654qWeW0wp/GyLbW1XM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb18c9a5-1ef4-473f-0f57-08dddb4e3ce6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 16:18:43.3896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqwapyE+qeRSaaANm8tekC+OxeIwECsVTm3PK6hQyjGvlrJua/qDHjpjNQSkQi4UljHOe1/CA4I5EYzsYL0wTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6916
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508140139
X-Proofpoint-GUID: 1zHomRr6e4agw4HU0Ni7ZuTjLXu7GHBI
X-Proofpoint-ORIG-GUID: 1zHomRr6e4agw4HU0Ni7ZuTjLXu7GHBI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDEzOSBTYWx0ZWRfXwvECRR1GHaFe
 OjradXUMBj4FN3j1WFN2D+D3nGDEW+zukr07kkzQXS5o4Ryoz0PuDTGaUALkrNCOvAzvVja0LIj
 HLa1vGmgpipRiiiLxChPMvIDsyefEV1WUn4myLyismDC1pAVDZVrCoFZcVG1JXUQ+MBVbhq8Gpu
 klH7iOC6vFcbnejxF2zYxD64OXRSOuD51mibsVZ5fbWMFwDewrqUp5ghBVxuZCNoEpRsLjzdlaJ
 w5IqJouCjdeI360LlSDmnrMtiXRMqNIu8G05ZiXHnQKMRqiL7j5imj35q14bujLRSlRy73dmEra
 JPhar97ExYprUtHHz7k9obSsJA6uI9PNpg5R3MK4Q5pkgpXaNVlFF7XRl23pEsc8vnc75+0GCrr
 03WDfdjjTlGxIGlY0TfQZPX22bQBxepygiYQEfkyWYRrzrHG4G6FvGwC2VqOPgPwQbXSQ6w7
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689e0c67 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=lDWXRMBTjsApoHca0roA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

I agree, but does this change any test results?  If not, should there be 
a test added?

On 8/13/25 11:57, Kris Van Hees via DTrace-devel wrote:
> The trace("") action would dump a series of 0x00 bytes (strsize of
> them) rather than printing an empty string.  While that is the legacy
> behaviour, it does not really make any sense to do so.  The trace
> action is described as printing data as a string if possible, and a
> block of 0-bytes can certainly be printed as an empty string.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_consume.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index edfe5bbae..2dce69d6d 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -991,7 +991,7 @@ dt_print_bytes(dtrace_hdl_t *dtp, FILE *fp, caddr_t addr,
>   		    c[i] == '\b' || c[i] == '\a')
>   			continue;
>   
> -		if (c[i] == '\0' && i > 0) {
> +		if (c[i] == '\0') {
>   			/*
>   			 * This looks like it might be a string.  Before we
>   			 * assume that it is indeed a string, check the
