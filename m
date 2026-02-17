Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8E264A97
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356092; cv=fail; b=nxtLdqNiMmaazJ8KfKCthXtstFR/yRX9ABEUim80TCFMKGQJH15DNTYroVvPV9BnOhIJgznhNXhfmimBhRrrvB/0RjyuZGE5tWkJCAU2OiuVwjGIRXSW484KY8fiyTyxWWrXCKBBPe75I2pv7zguNZT1oVmgTTI4Hh94bewlTks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356092; c=relaxed/simple;
	bh=7PA6TUjAg16MR+kPgFv8E6d6gT5kJAsNgXpV9iqDoNM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NVlYyOnNFrZOYeLftalbpALGlGfphum7hpYOMx3Lya7YUEAAEFK07eHkXdA8Z2ce4xGVHuihgE+soCBddqmQQLmSVw1W/V0F4XYU1irDBzozwa32XLPjFrepNXiSRbp36sHIWZCR+ngIQC8Uh3IQUL39JH4HWD4LDWEf3WKIjc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TCY/sNYy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cX8VkEjI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TCY/sNYy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cX8VkEjI"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNIfQ3675464
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xZrloJ+uXVdi2MKcQ6YyvWgZoh2ETYM2tED4X1B8JB8=; b=
	TCY/sNYyLPIcOcWS30UpF+7dhABtVrstdhh1uz1K5cd212hDRoiQvhy14S349fWW
	YG6XPmftpJFo+cVA1vnAuF9p9ZWbQYm14WOd5UDIBKRK+azqS7pcaD4BtdTXj1wm
	Lj2wlN1T01F3SVztakuH9kYfGIwOLpZxc/LcEvNbcNw9Ocwm2Cx9DI9b7emuYZMP
	I5xznBD8fuC3R+p8/543x8wcQ1dDTA/hYzPN4C9QFM2qTVdkQUYaJUG+WAvRokHd
	nz36ll8YLVycm2uYyEMIZMUVF/7MyuncEiDkhKMWmL86ntfdq8i4iWI7TSYWKrPo
	Lwv0LKRR3/Z/P6lqyQ/eNA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj0av9rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:21:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HI8gVO009957
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:21:28 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb294taw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 17 Feb 2026 19:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4sL+LIdshnfQun5A1YnfFNWDA2lzMy2l6EchIuoO3AokaVoQe4Bw4iMJf1Mmh/1PsKj86gSVxFEyC6NgpCODn6iiDRBk87tZ2gU2D+s9bdKbst1FlNfoThDpXTGWW3q1cxvqcgjLqcAvblo9Gm6lB2Cyo8HeP/lmt8Ors4h0E8kXWi4Mw/vY8tbEwDVyy3K8335udkUgA6rv4gJA4cNBEkMkRv+Cb0E0nyKvzD0u/f9Mphtel64vbSqmyoc23YQvATqcFesUlmNRuFVU1wGjZIye9KEwSwBXobWXrgcYwH98JG4+8W1GfzhG4agjtUF9wJGRCxgfsXB5cqgzrkNGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZrloJ+uXVdi2MKcQ6YyvWgZoh2ETYM2tED4X1B8JB8=;
 b=r/EVUFoQAb405PSzsMcYzsP8bf+YMwdmMvwGDke+Fa2PJPofQt6dkY/yiAgRZBlCE0jDMrl7Ykpr9ue7CYJNkRK8bAsX5OckZxMhMC0KtqA3+EcvuFwXBh09d6akqZFesk8p8mqwD3W16RsYastEHJLrZtfqRMXO+fUREhHZmKQY+3f6eVsmMSIyAulvnZ6cORDcUUz54XhbxGz9hN5aWeCUSl3jnGAJwlnIqH8yylJG0RSR1eiU0HkpHAZzb0p7YZ58/FhdB+t9ci042m1GGimH89gFgL/PiFQeKjzbmfbkKn1OTEtWIddJGLdwwepMWAvvlM9SK3qx5u+JHTBxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZrloJ+uXVdi2MKcQ6YyvWgZoh2ETYM2tED4X1B8JB8=;
 b=cX8VkEjIavJDuVHy7tANIUzWCNJsq/MXLmpV1tIzx7bibwdF1cBxRP6jmrpczi4c1m+rxtrR+K0Gt/lh4hrsSPGUP/2SxbaBE9SpCCGNMwRXqtWGvyR9xozrko33XbH1Mp8M2Gqumrjl552e+XrRIVyWssz0ffEaiJzvkROllYY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB997624.namprd10.prod.outlook.com (2603:10b6:8:315::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 19:21:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 19:21:25 +0000
Message-ID: <a756f0fe-2496-6964-6d16-97fd707e0c1c@oracle.com>
Date: Tue, 17 Feb 2026 14:21:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] usdt: enforce provider name size limit
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB7522C161F2C7C0F342DE99BAC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB7522C161F2C7C0F342DE99BAC26DA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB997624:EE_
X-MS-Office365-Filtering-Correlation-Id: c03aefd1-f988-4b49-e376-08de6e59be3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0JCUFZOTXkxaUU2dlZwZnpBODd1d2pOZkFwejdTUnhJZW96VTJ5Nld0SVZP?=
 =?utf-8?B?Y1R0WHZuUFFoeXd5WUdSVFV3TlFGcVhKTnlINzVpMzUxc0FzRUtKVDg0dlMz?=
 =?utf-8?B?NjQxM3AwZFJXbjNTRktuMmRHRVV5VGh6NEEvSTZSSndqc0phZzA3RDhEbkRW?=
 =?utf-8?B?T29KVmdoK1gwbzg3VzJmeHJMeURxNUhKRXFabmUvK3ZQMTUxbkFQT1pSdlNP?=
 =?utf-8?B?SXlieEpMWGdVREtESTU4dlFKMEVSVkk5WHJTcUdmeW1iYUxlL3UvZW1Fdm9h?=
 =?utf-8?B?ZHhRTDNmVnRIam9jK1dYcWVYb2JTVWc3dXdFdnRxQS9aL0VzWTJyenBSdVUr?=
 =?utf-8?B?QmxQMlcybUg1MFRaNFczS2xBcnJVODhnUE1FSzk4SE1hdVN4MDQ3QnRBNzk3?=
 =?utf-8?B?cnBaUkhpY3lkL2t1UTJmZEFkYnVzclg2dCtWaVBiZ1ptaFg3S010U1p3Si9G?=
 =?utf-8?B?eFJpdTQyVVYzT3pPa1dBdFF1TTg4VWNoREM1UkExczU5Nk1qeDhqZVdjN056?=
 =?utf-8?B?SFJQT1NUcmVhdDdSd2RhblVkNTJPNTZRZzA2RmN1Ky9rdFpzRlFKOThmdDJC?=
 =?utf-8?B?azdkbVBJN0pwNEdkdm5vWlc5M2ZBeVdYOHFNNVVmZXhPNG1JdlJMSlQ4NThU?=
 =?utf-8?B?SlpIU2dTYnNlY3JWUUxvbGk0WFZaYytPK0JJcFJ5djRIUHFlemtKaUVrYS9B?=
 =?utf-8?B?ZlRPNE9SU2VsSVQzVVBGOWxpWkwyQ3JWUHd4OGtNQzYzMlJBMnpNSTVtbEM1?=
 =?utf-8?B?SkkxcFRYY3dDKzU5VHJBQzVYNHRNRi9kM0M4NVMxOHhSNnluRURVOEZXUW4w?=
 =?utf-8?B?MWh3ZlZxN25iUWNVY0dFbXVEWXgyZmtSUytCMTJCc0JGOGdWWGFZclBMWHRS?=
 =?utf-8?B?YjhwMTI0bUlqLysyZkFVTW5KRHVkOXpBbnRGV1lGOFAvWFRCQmxNL2VCR2hQ?=
 =?utf-8?B?NjZlUUd3TTFUOFNhZG1oekV3Rm9jZ09mUUFsT21DcVpmUk5rRTByOFhPTEdK?=
 =?utf-8?B?ZnEzRVY2Wkp2N016Ui9wbDFaZ05BWFNBdnlHak9PaHhObWdQeXhBS2twQjg2?=
 =?utf-8?B?SFBCOXgyRmNiN1N4QkJqRHgxeHJJQU4rajVsenplb2tMTXZXOE5lUXdZMTRP?=
 =?utf-8?B?MnBHL0tPZTk5dVFMeDRpMEVmb1liSmpKZVlFWnluZmdMM2ZRRmx3VDltbkFE?=
 =?utf-8?B?TWx2SHdTd0pZeGJrVldrVXgyVEtKWnRUVUljUkUwZ1drWFdYSUNDYXlSY25X?=
 =?utf-8?B?NStxTHRFMEZRTk9CREYyMDEzK2R1MkNyYWlsS1BKNGhlOEpQUGVzVkRudzk0?=
 =?utf-8?B?aWxVd1FRUE4xaktpY01PZDltU2NrRTNtemFmVEhJRml0SXNhUGQxWmtJcEZu?=
 =?utf-8?B?NEF6K3RacnZQQlRJeVlVeGNDcWlmeUd2ZnkrbUxIUFFjZjdxTHdMNzlobEoz?=
 =?utf-8?B?ZHA2ZlV3VlZOLzVpWDdsQi9XNjRjSzc4U1E5MHhqVGxHVDdyK3BtMk5TZER0?=
 =?utf-8?B?Sm51ZjIvOHRsK1RWKzZEMXc1YVlrcXpnZ0RRQjU0OHJWMmx5VWpiemI2WWlH?=
 =?utf-8?B?WGVJc0dhc0o1R2xzTHp5WXdaRzR2Y05LSHpRK2JIV2M3aHFNeXJLb3pLUXdB?=
 =?utf-8?B?NTVidGRuN2lwcWlZVDA4Y0N0QVo1VjNLN3dZbC9xS0FSWlBUMWx6aFo5bXpX?=
 =?utf-8?B?Vks0c211Q3p4V0dqL1FoL1V5WGdONVowQm9zdTRqV1ZabXljeFVNSmtsRVg0?=
 =?utf-8?B?c24yQ0JVNkhhMVd2cmlkcnUwSW1WUTdSbDl2UWg2cmxEMU54ZEs4a1YxclZM?=
 =?utf-8?B?RVR4cFVHcFpGRlRqSjBKMlZiUmpJdGV4RVM2RE5HbGVWQXpQdGxYc2lQOTZ3?=
 =?utf-8?B?QzI1NEd1N1JJVGlDUnovY0xDR0s2THRWUENQY3B5MnBuSVB2WlozcVFHU3Mr?=
 =?utf-8?B?YitRaEhURzRGVENKQzVZdG9Jc0pEaFEvZ1NFUXJicFJ3L3R5T0NURXFMYUVk?=
 =?utf-8?B?ZDUxZjZjSUFKVVlxTDRVeG5Pb2Y4Wmd0VldLWmFOaENHb3Z0aXpsZ3kvb3J4?=
 =?utf-8?B?eDI3dXQ0aGJaeGxCUmZrRUtTdTFRcmJiM0g4byszZTZKb0hoN2RheVQzS0xC?=
 =?utf-8?Q?wg7/5m6/9cQN6jDl7HxCQ66jH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXVKQ0xWclZzNU4va2tsdWdHQ0wwSzdhc3ZuelZiNGxwZkYwSkNCRVRnT2ZZ?=
 =?utf-8?B?T3hDbVRZWTl2WlpLSlg2dU5XNHlzN09xQWN3MjBVeTVQN2V2TTZ2cUdDZUJN?=
 =?utf-8?B?U1l2cUFGTExpRGFOR2N5TEpuTU5QZnNIZ1kyNEwwU1QrZEpta3V1dmVKVitu?=
 =?utf-8?B?TEgxYjNhSU5ORVd5ZjJRVjgyZldlRC9RSG9TV0tmcWd2WW00OWlwazRDNFow?=
 =?utf-8?B?Y2VjbjF3RTlWMFVucXVqVGhTY2RybmZXVUNZNmlydnRxcU4vVmVEZ0pNY3lo?=
 =?utf-8?B?czlxRTEwaUNTUDVMYnBoeEw5ZUxBemRxMXoxSTE1TUlCakhmWUdjQnFRSXhj?=
 =?utf-8?B?ZTQrc2ZaOGx1Tmx1ODhYdEtqZHc3QlVJaGg0QVl5ellBMU15TGNhV2pxN2Q4?=
 =?utf-8?B?bHpRUVl1Z0JGTm9aUlRSL3lXQ3RHUEJCZWlyVHZVbGY5YUdvRHoydG1ZdkpB?=
 =?utf-8?B?aWY2NUxuWmFtZk9vRUdFR29pVGJmK0FYR0ZWMXVkZUpTeUxUa3phZlRkQTFY?=
 =?utf-8?B?OFVpRzFrZktOZ0xSQmNvZno5WE4vUVB0dEFnNTVBOFdpSEcrdE9GTjhCVTN6?=
 =?utf-8?B?VFJ3cFVoVDVhSHVKZ2tHRldxU1V3RU5ta3NnWWMyY3NDRDM4TlJzclkrQ1R2?=
 =?utf-8?B?alAxL28zd29sY3dTS0d5WkdRZk0xYmJGbW9BM2RWSEhuY0Y1c0JRVWN6eS9V?=
 =?utf-8?B?STFrRmUxY0t6emJBaHU5emVydkFwbnZ5akszOFk1VWpGdWVlamxMb3hyQko4?=
 =?utf-8?B?TGgwK3h0Sm1tRmx4M1h4bTZiVW1JQW5pcjJtdHpGU3pIcGMzbkx5bzFrWGR3?=
 =?utf-8?B?eERaVjVYVnhuY1FJT2xrV2RXeDVlU3RaZU1JdXFjRXIveDZ5bFpBNkt2a214?=
 =?utf-8?B?Nk1HUFhzVHQ5WEZieGdzaVBHTGt0dVdLckJvaERIRklkSE1vUi9nTmI5RFg1?=
 =?utf-8?B?bTdsSFdvNTMxK0VLOElZaGZCNXpsc0RlK2VnMXF1Q0FIQ0JrTk9CWDgxZkln?=
 =?utf-8?B?VE9MbjUzaFMrdnVkM0RNY2xSRGZONklWRXkzL0NxSnNSRkIzeUxNNEVrRi84?=
 =?utf-8?B?WTVLd3h1T0tRd2MzaEkvQVFaR1JLdDdLZXcxZHhIOFNiRk1lRFd5eEdPWHZY?=
 =?utf-8?B?RWJHZjJocE1JNFNYTUhyTklBcmptcXNBWjVQcStPMllaSFNCZDdWNllpT24r?=
 =?utf-8?B?TnZodlkzeFBZa3B0a0RlZTRNdnFXMjdmYVdubUtOamd1SUk1b2NpQU5Rdmhn?=
 =?utf-8?B?WXczVTBqNy9yUVV4Qzdsd1FibkFpeDhzU1JsS05heVJBUFljTVA1a0JLOHlJ?=
 =?utf-8?B?VEd3V1BlQXMzcG03empJZkFodDU1blJHQXQvb3RTUmd6UFhVWkxYSFhKeGhx?=
 =?utf-8?B?Q3ZtOWpqdzFHMlBhZktZMVEzaitTU2hJc3BjQ0pGNmVtYnN4ZDVhWjc3UUwr?=
 =?utf-8?B?R2RPN3NGaitFMTZsR1pzeU8wNENReHZ1UTRsclp3RWx6ajNkQm5OMXZrTmhx?=
 =?utf-8?B?Q1YvZ2ZUSElxU0lFOUVWb2VoaGFWT3QwT2pEWVB2T3RucjVPWmRBckZpZFRT?=
 =?utf-8?B?czF1NEd6M3g2bnV2OGFFamFYQmdmQ0VQc09XaHlWdXZZMHREUEFqZEF6K3Rn?=
 =?utf-8?B?TW1xRjRrdFNEaU5vcHY1cGJBVGlIWExkWHhjaVYxeVJ2Zmx0YS9xMUplSDVL?=
 =?utf-8?B?Z2cwTnZ1WDRtQ2FGUElEZUtPb0djejVhRHYvdHZaVHNIc2RQcWJPZWpYbmFK?=
 =?utf-8?B?ZmhJdnN3VERsNnJyLzRxbVVtS0Q3dDdBQXVRQnVScHdKNmVCYldCbmdTL1NZ?=
 =?utf-8?B?ZmE5QUtFWlVJRHNOTVA4dXA3QmlwRmJjbVFyTXVPSndrZytseDF5RE1aRGlo?=
 =?utf-8?B?bCswbHpWdFJjajEwdCtyYS9pQ1J6MVpCVmNseVlhWTB1cHZndUxLdlpDNlpS?=
 =?utf-8?B?R2hPRlhGVDlXN3pRbGdyOHd4Yko5ckhMSmtSQzcrbWRRNEY4YStBVWNVcEpC?=
 =?utf-8?B?alh6MVJ5WTIvTnFlVzdRQ1NjQTNDeUtTR2ZKTnZHRzhwVERFTmZzMkJBcFhB?=
 =?utf-8?B?TGNrejNXc21jNmlvV2cxNHpGV2JtSVV5UVJDQmt0RFRCdzVKK0R1aDhpLzNS?=
 =?utf-8?B?S3diYTlsenNucWZCdkNzR2RMWnVvVy9HYnk5Ly9Yd0NORFFCaENoTXgvdnRG?=
 =?utf-8?B?TjJGcHJDOEMyaVUweEtZRkxLOS9McjBvRkdVckNjc3ZYUnZkeDVUQUJ3ZFVy?=
 =?utf-8?B?QWRnRUIwOXI5WXFBazRtclhoT3N4NG5rMFFjT0pYbDFHVy9ldlY5NnNsSzFj?=
 =?utf-8?B?RzlhZTBUR1RSUzR5N285VFBGUWlVNDhyYWFFdXlnaVdFYW1RMFY2dz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3/XY5VzejLvPK/HmX3XGGSw2QNIqvYKDk3wjATvzKPNizgyY/k5s6DhL/nj4jPyHl3aGBfL0JcFGKKZ4iKz6yUeZhlWcfzYV4Ma+fvRV/tO0VyP/jlPsKynFrbNW3jtJ98M4smyZ5rQdTGTkNgXWmqLggXPFomrH5LnJA3gUSTr9U0VeBdDse2ce/IbYQ14nCFEMhBTl//DQ1aoDuHC97uIpx+w1FUX2bovnCabMjs56McHGbI64ZlTafScBsd5si4RQUfkiUNqrfqW/yvyq0AI6fIvnuBMH9ScxtTY/OSfeL268fg6v1Zjp+Em7Xkxfzv1l1OXsGAocZEVFPULZDJdOHHrhkf8VkIfKoR47zen+IueWPYElBF2jAUNm16Y0uTZPuplpxgdIu993tpBiP4WIBl/SaJI39MjhlUHT2g5ax1URKYYwvL2D00buOz8pErEdo1TPwCcWReo3//QMOLK6WjKdagP/OfO0LrPbTTI09/Eo581O1ipPNFCWXHrzlpJBtXcodlaBR/ckZimQUpshVXpVhZiZc0lndhrPWRmgo3n+TVj1KIE0CKxM/oIbUhaFIhOy/akusvZP0s4FDuEWROchGFJLfVCtpHRofxM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03aefd1-f988-4b49-e376-08de6e59be3d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 19:21:25.8290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzbMA+VLOn2VVYEiQAjweu6vqixJW5FqqbVFCsI6EHDa5ZyEi68o9nzZNAss9CnIqJdzZDfVfhkhKseD9tbaFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170158
X-Proofpoint-GUID: OndAJShotlUjFOXAxxHfIo_eLafQK8E1
X-Proofpoint-ORIG-GUID: OndAJShotlUjFOXAxxHfIo_eLafQK8E1
X-Authority-Analysis: v=2.4 cv=UsVu9uwB c=1 sm=1 tr=0 ts=6994bfb9 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=fHb_Z_Y7H0Io_TG1UcgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13801
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1OCBTYWx0ZWRfX6pYPQPaZhJzU
 0A2XlIGoVwMJHLpunnNnGoTmGrXC94qCnI3x5zePSJ6SdK1+jb7xKnfV+9XR88E+pgthugDJtLx
 DOcbxiwIJeYEcihSXJQQ1qtX+ukQjWcRwWX33mgjc/tiL1K1t9xxaRzpquvRCwQKrSgjj+PWV/J
 w5EEWV87n1PMACkH7Xm4IihUgnVzaorvp7IEO5lxEbJAGaXvbS3DnRJHY4+JQNekj0LJKOpch/0
 5nAakQ/1gpprK9cOUu45CqKctDsWUtmEQpdQ6VRO5mU9EXPDBMRpMaAOAcHvBH4QUAVWVbfpjBd
 vEAHpCdZEFsE1wnun3LCi17IFOvW3icwirK4yWovdg7PRV1xkKXbfukrsWbVymU7kCSYKsrOiSl
 jA0VMYuj7Jn75ZU9WLuV8zMD2IIJLibXY8ufW9FTJ+uc68C9gf55sW6w/Kg7xAvl/twKtLemHdT
 Yu/HJRLuZEaSfM5J9tivlSeNbiECQLnf+ij1QmaM=

I'd like to understand this patch better.  In particular, in what sense 
can a PID take up to 10 chars?  What if it isn't that wide? If by 
coincidence all my PIDs just happen to be narrower, why must my provider 
name make space for a PID I'll never see.  IIUC, a PID will "typically" 
(whatever that means) not exceed 32768, well, or maybe 4194304.  So I 
might even be guaranteed that my PIDs will be shorter than 10 chars.

On 2/17/26 11:35, Kris Van Hees via DTrace-devel wrote:
> Since USDT provider names have a PID appended to them, the base provider
> name cannot be longer than 53 characters (PID can take up to 10 chars).
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_link.c                     | 24 ++++++++++++---
>   test/unittest/usdt/err.prov-too-long.r  |  3 ++
>   test/unittest/usdt/err.prov-too-long.sh | 41 +++++++++++++++++++++++++
>   3 files changed, 63 insertions(+), 5 deletions(-)
>   create mode 100644 test/unittest/usdt/err.prov-too-long.r
>   create mode 100755 test/unittest/usdt/err.prov-too-long.sh
>
> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> index ffa16d9a..e77f06f7 100644
> --- a/libdtrace/dt_link.c
> +++ b/libdtrace/dt_link.c
> @@ -148,7 +148,15 @@ note_add_provider(usdt_elf_t *usdt, dt_provider_t *pvp)
>   	usdt->base = ALIGN(usdt->base + usdt->size, 4);
>   	usdt->size = 0;
>   
> +	/* Ensure there is enough space in the provider name for the PID. */
>   	len = strlen(pvp->desc.dtvd_name);
> +	if (len > DTRACE_PROVNAMELEN - 10 - 1)
> +		return dt_link_error(usdt->dtp, NULL, -1,
> +				     "USDT provider name may not exceed %d "
> +				     "characters: %s\n",
> +				     DTRACE_PROVNAMELEN - 11,
> +				     pvp->desc.dtvd_name);
> +
>   	sz = PROV_NOTE_HEADSZ +
>   	     ALIGN(len + 1, 4) +	/* provider name */
>   	     6 * sizeof(uint32_t);	/* stability attributes */
> @@ -382,12 +390,16 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
>   	shdr->sh_addralign = sizeof(char);
>   
>   	/* Add the provider definitions. */
> -	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL)
> -		note_add_provider(usdt, pvp);
> +	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
> +		if (note_add_provider(usdt, pvp) == -1)
> +			goto fail;
> +	}
>   
>   	if (!(flags & DTRACE_D_STRIP)) {
> -		note_add_version(usdt);
> -		note_add_utsname(usdt);
> +		if (note_add_version(usdt) == -1)
> +			goto fail;
> +		if (note_add_utsname(usdt) == -1)
> +			goto fail;
>   	}
>   
>   	dt_free(dtp, usdt);
> @@ -492,7 +504,9 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>   	if (!dtp->dt_lazyload)
>   		unlink(file);
>   
> -	create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> +	ret = create_elf64(dtp, pgp, fd, dflags | dtp->dt_dflags);
> +	if (ret == -1)
> +		goto done;
>   
>   	if (status != 0 || lseek(fd, 0, SEEK_SET) != 0)
>   		return dt_link_error(dtp, NULL, -1,
> diff --git a/test/unittest/usdt/err.prov-too-long.r b/test/unittest/usdt/err.prov-too-long.r
> new file mode 100644
> index 00000000..1305f434
> --- /dev/null
> +++ b/test/unittest/usdt/err.prov-too-long.r
> @@ -0,0 +1,3 @@
> +-- @@stderr --
> +dtrace: failed to link script prov: USDT provider name may not exceed 53 characters: test_12345678901234567890123456789012345678901234_prov
> +failed to create DOF
> diff --git a/test/unittest/usdt/err.prov-too-long.sh b/test/unittest/usdt/err.prov-too-long.sh
> new file mode 100755
> index 00000000..599e461e
> --- /dev/null
> +++ b/test/unittest/usdt/err.prov-too-long.sh
> @@ -0,0 +1,41 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +# Ensure that provider names longer than 53 chars are rejected at link time.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +
> +dtrace=$1
> +
> +DIRNAME="$tmpdir/prov-too-long.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > prov.d <<EOF
> +/* Provider name is 53 chars long */
> +provider test_1234567890123456789012345678901234567890123_prov {
> +	probe go();
> +};
> +/* Provider name is 54 chars long */
> +provider test_12345678901234567890123456789012345678901234_prov {
> +	probe go();
> +};
> +EOF
> +
> +$dtrace $dt_flags -G -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >& 2
> +	exit 1
> +fi
> +
> +echo "DOF creation should have failed" >& 2
> +exit 0
