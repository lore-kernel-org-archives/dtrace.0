Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC2382397
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654902; cv=fail; b=lhhYshyur4/uwTRcfNzZBofLHG2Z/y4ruvLnUOMCEc/2IRiOARsxPQMEPH4ZhqNFC4Yo9vxcI9fwqhHTU8wpZ39SHmBniDKh4THnkch4h97AcUAQ17K6FbO+yQB1daUa79Qj9zXIl4zyxihICyzpdA3mxLj0RH0nG5FsgWwFV2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654902; c=relaxed/simple;
	bh=u7Ppal5+sm5+vhnWe2phAoylTVODbY90D3h7nO0tfR8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jQbSu4tVQpEdPAbRYof/W3V7hyibvmIn/6Y9bMvwwBMcEhsOnLzVVhHTFwLE0TVWKtDeSGXdCpVPes4D9rUDil12DS2yg4Jg1FvBCOQQhBsrgrAejP2cAln4HiDEa8lq7IOPFg50vd95UeVsnMeo58u7okHNyA7Tp5yt6l8Frzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mG4XlFcB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ltGIXZf9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mG4XlFcB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ltGIXZf9"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624JIUN73209455
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lCwczWo105Zbm1f4qK5J2PAhZJxr6SnC9pGIrqDTj1U=; b=
	mG4XlFcBGscMEBvl8V8YbguE1x+pxUbkC7yGkygLrx4BuLeInQYky+LWweQtOLI8
	tMh2BJRV0jouZxhdtu8Z1qgclvztbBKpoe9C7IgdMEtR5ZCqvIysk20iTxc+W2B6
	BDamCeRO1Wju4GXPwhnV2e580d42B2oOGE+lY0b+fJDL1vuipxKNKxD508NhJmnZ
	C4dn0LcSSxuXvPdVC885fDqR9EFOAaiUFZhjjphJ7+zACaP6RtPowfl2Gh5lzvcp
	ZHu1CszxfLYNspe39IAo06p2+DDf2rbXAk8rj8IA071OQqjDwO6BGFVxH9yb3/Dm
	yZo8xIbyHkcbV9YFwWuq8A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cptsa02r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:08:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624IJieW034715
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:08:19 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012037.outbound.protection.outlook.com [40.93.195.37])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptga51h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTs7xuvkceWR1smZDqdpCFBzV6F8FuD83aaO1e91iJfXgv7FzIKvtIo0bPdxZzyAF5Z3Rzds+ejV3LV9/1WbZYGBGndSRcsDm34OIbLMZLq5w8oDyo5LPHIaU5exfYTTIWbhG4HZqS7I+MddfXz1YnCNB9XAmzI6AGviIDlSigQUgnvIuZg7If1/XcZzWXrQBAhcvy7zFoHFoADRYAhIf5KvPJGCX8d0H2H6ll7lzqBllpRl1Mz7267Rye7+lttEAh6KZydRQIwTcaWJ4pCixCr7YDkSysb7MGcSkRP2MV1y7/NB+lNbAUmaceMh1lYVPR0sSkRyOXmMgNE/v5cBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCwczWo105Zbm1f4qK5J2PAhZJxr6SnC9pGIrqDTj1U=;
 b=U7fR8UK5cFsqKq2UxGL4EjLZYwqtDWV/Y3/iji5jLyAQVA8/U7xm8uYR4irzg4ukb+XeQYuuviymT2xAEylXjTABg3D9Rg1RPB1ELJ/Ole3YhmfwzoQtgVkrJ0gUjBo9C9pIZYB1cEh2aesTM38w8nrZuAjRrjRIaGZsl0YWZOHM8y9h3lIb8aF1NqdR36T/H/SVbOlqHUXwNDQw8AJyyX8SIfKwv4WiyIgU2ZOIqD9qjs3X2kk+URY/ad+kUeuSB94P0HYgr7gJTAWbvMV9PUuByOyTQYjaHcBa2IQHE1WU7geUq2c1AYdZcNdSGC3H05jNO4iBAy/QZTmQqioTyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCwczWo105Zbm1f4qK5J2PAhZJxr6SnC9pGIrqDTj1U=;
 b=ltGIXZf9QPUg91BDWxnPyFGsiB77ZFqRgPZJvftpUtOLV/iIvpTg0lGkwW6NA006pkhhFvm6XkZOwdfdRAD7z9ntPFGgHQjtQK0VZlNTOi9stkHiqlsQaJ+gqgR7J1twKvlUCPfG6OGKJ6q3L+tMIRJmh2IVDiFXAwQKaiPCxMk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6948.namprd10.prod.outlook.com (2603:10b6:8:144::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 20:07:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 20:07:47 +0000
Message-ID: <483a8ddf-bc12-d7e5-f7f4-24aff9fcd874@oracle.com>
Date: Wed, 4 Mar 2026 15:07:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH] sparc: remove architecture support
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <DS0PR10MB752292F0685B382085838FB8C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <DS0PR10MB752292F0685B382085838FB8C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 590cd072-6750-4f13-84a9-08de7a29b436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	vw5gdGX+94CU4SyBYefigGLxmKozoDSgwR+yexYD9gA9cXKkjnj6pi2s0cB2ou1y+AnqwuCXiH+Edrsnyvsq3JWssBftmB++wQJHGvM5BemHHHxav5yardEsfUH4xKG/tz6fiTuFe8juQ+TjiA05L3IKcXAE8HDCoNctxnTRHqJk2ssjTNxxAK+EsantVjluRGolg8JBhc6Qbhj6ftpXUUy11VKj7cn4wOejRSsNasRIG508kAW4OppxwxFfS82kt2vIWh2NzUUOvqstYOx2HAb+flk3tZTGZuUxLwtGQtJ0aSJF58kD26c3sLXpXN3rtlhAUqGSrO8XpA5BEJJ+micxyERhMzpOPnDrAx3Sn9lXhnkssX7yGOcqHctBp+EWcSr70jSnxPQH1xDNZwEG1ecIb52iU1+XBzTqhet0VsNMc6qccyh829z0zNMsBNikd4M3NhU/cVZx1h8DmOnxd8fV+EXFqXsPKyJRHjHBTYJSLvRqTBrfA2DobIQzBb7+An6mgSuIGYxzgfMJ3FiwuoFb85I0T1HSEVxj0BawsRXm0pf86ZMCxSYmuj18X1L54k5RUCblxZBINkc6Hh6m1IM555qR4w9rxZbvupw7AT6bIKgekkBIXPbjXQQvMda89WC3famRyqUy4VN5DxkPF0DfTtFo+lLwykre9GKfI5bW7QZSPN8rp8Y7x5iNoe25TslNZw6r4WxeiHPUICEkGK0miCFNYzYh4nVKnKxmp5s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTlISUNzNk1RSkgwSjRFTWN3YUhJOWZkK2V0WlpRVFBUR3UwVWJjSFhLWm9l?=
 =?utf-8?B?a214WEVTR2VSRHZHcG1tOWpBWWl2d3V0VTFHOVpxWlRmaDJDOUlnVDhXOE1G?=
 =?utf-8?B?MUpoOS9uSVBLNnppUE8rem1mMzBZUGNyUERtZytQaEUwU3ZCTDdYV0NTN2NW?=
 =?utf-8?B?ZDVybkEzZU1uM05Qd1FTK2t0V1RFbVFzS3NSUDMwbmlaMEh2RnJ3N1VKNmdh?=
 =?utf-8?B?MUFjNll3eXAxRWxHaC9lSlZoZm1oK2FReUFsRmN1V1lzWVZNYUkwQVV5Z1M1?=
 =?utf-8?B?NVRIZk01RVJxek1DUk5UOTJBd2JwUDZTUXVaZzd6Y0RBRGlLcmdjQjZzeEFP?=
 =?utf-8?B?QWErT0RUN2RzM1RWaWgzWmRYRk1qOFJYcTJiVXpkZHY1RGpsTHhHd1FuOHhu?=
 =?utf-8?B?OFdzVGhtdEZ1TlZ6L3FyRjdTSjU1OXhyb0huQWVUSWNKWGF3aXJhSGlxdWpC?=
 =?utf-8?B?ekM0NEJEbDQ5NFhLRUVwdDZGc01Gb2dzOEJ0Z1hVVVZRMUpLWndpTWo4emlh?=
 =?utf-8?B?MFNIcnU5MTVJMXNRMFhDaWVTWG1zOGJkT2ZHRDk5QUpUYzdDQTV6ZWlmMlBD?=
 =?utf-8?B?NzdkeTVkUlhGVlo5YVJqWHA3ZUpDbXZac0dBWlRMK0pibmcrZ1QrZGwyMUVP?=
 =?utf-8?B?SVMxUDFmK3lubkZBTkFxLzZ4cjV3N2ZObUo1SitNTUR4clQ3cXo2ZFMxcUd6?=
 =?utf-8?B?eUE2WDFBWm00R2lDTWNFRFNBZW1PS2J5ZUxIYUlCK0ptMFVqcktmWVpCaWJW?=
 =?utf-8?B?akhMRnEzK0ppWEc0OHloclNSTTV6K1pCNlpuaVArZDNybHFDbnpxU0hjZzBH?=
 =?utf-8?B?WmpYWk5xWlpkb0M5VDRsTTZ4Z3JjMkd2ZDZTU0pPSjQydFAxUTRlTjBXa2lG?=
 =?utf-8?B?VkdMOUpoeld1REhKcXBqODhXUmx0Z2NsUmpxQjJOMlRBdGZZSTVlZlRmeHZk?=
 =?utf-8?B?MFY0Y0Eya0JScllFdVZpdFNFL1hkenh1TFV0RDVlYXo4L1BDdTNvSVM2SVh4?=
 =?utf-8?B?c0NxVTlsLzdoSU1FM3JBZnczdWFOS3RZTC9XeDc2alFpN1ZibVBCcjNTM0N0?=
 =?utf-8?B?Q3Z1bXZMSzVNNExuYkdlNDkxK1dxYWFrRXNndlRONU43bFc0MUFDWEtlZnZj?=
 =?utf-8?B?aiszMDdldGRLbWhJZUN6NTZXMzZxQURZU2djVUJLRzd4Z081dU0yL3JaVm41?=
 =?utf-8?B?VURQSzQvaktSMGxYYW9Cb3dvclpvcGNHZm1hTi8rUlBmZVBKcmZaUHlwNThi?=
 =?utf-8?B?MWNoK0xHSkNrdjlmLzFKeWtlUUZ5bG4yL0RKakJsSjAxMzVHK2FNV2VNMUFy?=
 =?utf-8?B?MGFETXBwYis5dGhCRG12dGNRdHJkWjhINWVUM0F0UGZ2d001QlpoV0lVeG5o?=
 =?utf-8?B?WHZTcWQrK0FZb3lTY1hVWEFLVHJQMVZ3T2hOd0dQNEJvR1dQQUxiMnFLL2lM?=
 =?utf-8?B?VFlNZFJFNUl2Qlh0bndLWGtjK09aYnZnYnJoT2Focll3bnpJTlJzbHp1bTh0?=
 =?utf-8?B?MWxKWit3SlE0SVBHOVF1S2ppaDNFL2ZqOWF2V0xTUzJYdUlsbkFJcTE3U0RC?=
 =?utf-8?B?dFdUczVqa1ROdDB3MmhDVWRFYmdzUnkxUXZjdjFIak81V1RWMDcwcW5lUzBz?=
 =?utf-8?B?VGlwbUV4Z0hjM0Q5bHd0SnB1cmhmalBIRzJzZjQ2SGUzckpRUTEzYmJoM0ZS?=
 =?utf-8?B?eWc3a2J2Nm91amRpTXlmUG5Mbk15eVZIZm4vUGZ1VXpBZW9aSG92akcwS3Bj?=
 =?utf-8?B?NS9MNHVoR2ZWTkFqSVZoeVNxQm4rWVh6bGhIci9KaFhtUFk0ZFg0T0E2QmtF?=
 =?utf-8?B?c2RHY09rNkc4d1NkaFl4NElNTUFwcFRpOVl3czFOSWFTcDFKWVhhYkg0S1cr?=
 =?utf-8?B?d2Z0eG9LV1lJNHVmTTlTRVkrRTNQUlRGUGFIbzlBMVFsc0c4QmZCVWpSa05X?=
 =?utf-8?B?bEpwOXJlM3pZOHZvOVFRZ0wrOEZucjlmR3hUK3FRQmZiSUhYMWdVV2I2bVhI?=
 =?utf-8?B?RGc0TGxnWitEL3R4bHFMbjFJQndMallkOTFJNGZMSmlFSkVDZ0o3WmxLYmxu?=
 =?utf-8?B?ajhMOVJLd3BSU3U0SU5kNXB6WHZlR0c0Y2hnd1Z5cmxaNTAvQmtvbzkvWHh2?=
 =?utf-8?B?U0hGREExK2svMGxRQzc0MUVvd2N0SDRCM2tVTFk1U2VzNDJCMEVKWWozZVMv?=
 =?utf-8?B?ZXZnZDVMSnBmZU9XdWhKTmVTWDFGdjdMQ2N3U1N4aTJnYkVMZUk0M2prSjVC?=
 =?utf-8?B?Y2tmWXFnK3dabGNhN0NqTEhJdU5DYXN5d0xIcnNiYlNaN0grODR1U1o2dVlY?=
 =?utf-8?B?NUZQbk02bVNFUmxKbXd6ajlpckFkak1KNUxaejdWeHUxd3hYVm9Odz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YaJZANU12RCdUb/wH89k02CXuMieTrWCyVmQnR/2zV+zcDCghsq3t9bxs5QN0uYu+pT9HBMqCpxXwBshtO7bk01z6Rn5ScgjaaY14XmzpyKlH91JZpSjQzL2y46JkUBmphp48C7pevj9On3PAhxCRvTVFcmRKiSdeEPbvvF50iw5cGpxT7ib1CF+rkbGwJDAb+LxEv1Kd8f6HhQia6GyQvfCAsrBLHgQpvaT5sFVEYs+0ZDCM6FSNN/f4zy+v7CD0lVYtwfotW3ujSM7iLVJQOthehLPdmf3erZvQpOwGfFwxGBNA7wgp8mkvz/KhDgm3zELlckEWv7efFQ3s494RDGY0G11KtJfAKRyoIdV2MDXng5UVHMVQ5UfIEmWhSuR4Eu74eeYqnunlEDdnFl5HtzMiHl0cQiHt6diA8Gf+RhghxO6ZvCrRasBnd90EJPycmGvFL+TXGZ2XDVO/LhA35Fb1pNZuRnJzYxGOAvnHvLbcQJh0JjUOCjNWzfAMLA3suKrBEKQ/ngxpOdQ4xvjQQ5KM0geviewN65A0JitDCzlPrJkt8X6dLq+/bhsU1+5JjMrE1EHflqfU0ukZcj76VeUrxuOA8vw+6GLnlZp4WQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590cd072-6750-4f13-84a9-08de7a29b436
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:07:47.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gyzfStoS8kTL//U/l2MPXOfw7VXFPRFpYW6dsc3riMb35VXpjRk9nFbQGmZ+sAdCwZWeeqWlTtGUFENQI9wcOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603040165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE2NCBTYWx0ZWRfX2KLcLwRnKMub
 vgKeM8vlu+jORGKA+jUzfrSS/pLRlyzTe8thcPw9At2RC7sSg9Vy6PeJJr1tRxKqyFat8LbsQGJ
 WlNjv/aQhV8MCnpKpgp/2ALuUM0DRK094t4MdYJbvw9g1feGsVn+T4ghjNWIIlWCY2dKAphJ3oE
 nKtJfKcuh7i+Aha/Oy0HxqX7h88uVGjRG8voL2EXEssrmNq41ahkPzFxnpRjA6A0EBYPJ59PU0s
 bBnmARUKDH9GsenM7XF1LGDbFia+c+RGLIyfOywRYRGfOg0Mv1djVi0FUs1Idh6wQq2QeiHTnkE
 +FiWTJnRkxDpuyxSpC7wIoW1O5pJ190Bwny0puj4eakJgoG/l83KVnAnAsayRAkhYvHYYdbPNyc
 AgJ+Kprsqx1AoJf5rss19rbCWw+uphIauiVvhhrFNhaccD+ioLkJzlYB26ru9Wez3ZfruG/2TA5
 2hPDd+/nS5OURwL2B+zSuLGse6x0FfEe/diCdNL4=
X-Proofpoint-ORIG-GUID: faSExqUq06pGFU3jYG7XVq9yH5Yh6Pjw
X-Proofpoint-GUID: faSExqUq06pGFU3jYG7XVq9yH5Yh6Pjw
X-Authority-Analysis: v=2.4 cv=U/ifzOru c=1 sm=1 tr=0 ts=69a89134 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=PEE1vfjphuXqZPJ-IVkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12266

In test/unittest/usdt/tst.enabled2.sh and 
test/unittest/aggs/tst.neglquant.d, there are SPARC comments that read 
funny in the absence of any SPARC support.

Should libdtrace/sparc/regs.d and include/sparc/platform.h be removed?

On 3/4/26 13:50, Kris Van Hees via DTrace-devel wrote:

> diff --git a/COMMANDLINE-OPTIONS b/COMMANDLINE-OPTIONS

Okay, but this file also has the line "All options are believed to work 
equally well on all supported architectures (x86 and SPARC)." How about 
s/SPARC/ARM/?

> diff --git a/GNUmakefile b/GNUmakefile
> @@ -20,8 +20,8 @@ VERSION := $(shell ./libdtrace/mkvers -vcurrent=t libdtrace/versions.list)
>   
>   ARCH := $(shell uname -m)
>   
> -$(if $(subst sparc64,,$(subst aarch64,,$(subst x86_64,,$(ARCH)))), \
> -    $(error "Error: DTrace for Linux only supports x86_64, ARM64 and sparc64"),)
> +$(if $(subst aarch64,,$(subst x86_64,,$(ARCH))), \
> +    $(error "Error: DTrace for Linux currently only supports x86_64, ARM64"),)

Okay, but how about s/x86_64, ARM64/x86_64 and ARM64/?

>   $(if $(subst Linux,,$(shell uname -s)), \
>       $(error "Error: DTrace only supports Linux"),)
>   
> diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> index 23454d63..6a0e0122 100644
> --- a/libdtrace/procfs.d.in
> +++ b/libdtrace/procfs.d.in
> @@ -286,8 +286,7 @@ define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4_dnl
>     [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
>   (m4_kver(4,9,0), m4_dnl
>     [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
> -  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
> -  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]], m4_dnl
> +  [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
>   [[((struct thread_info *)T->stack)->cpu]])m4_dnl
>   	pr_onpro = on_cpu;
>   };

I can't read M4, but maybe that diff is suspicious?  This is what gpt 
5.2 says:

### USER
Does the following diff in an m4 file make sense?  Are brackets still 
balanced?
@@ -286,8 +286,7 @@ define_for_kernel([[on_cpu]], [[(m4_kver(5,16,0), m4_dnl
    [[((struct thread_info *)T->stack)->cpu]]), m4_dnl
(m4_kver(4,9,0), m4_dnl
    [[if_arch([[x86]],[[T->cpu]])]] m4_dnl
-  [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
-  [[if_arch([[sparc]],[[((struct thread_info *)T->stack)->cpu]])]])]], 
m4_dnl
+  [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
[[((struct thread_info *)T->stack)->cpu]])m4_dnl
         pr_onpro = on_cpu;
};

### ASSISTANT
No  as shown, that diff does **not** make sense, and the 
brackets/parentheses are very likely **not balanced** anymore (and 
theres also an obvious stray character).

### What looks wrong

1. **Stray `l` and unmatched delimiters**
    ```
    [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
                               ^^^
    ```
    That `l)` sequence is almost certainly accidental. It also strongly 
suggests you now have an extra `)` and/or `]` compared to what was intended.

2. **You removed the `sparc` branch and spliced the default expression 
oddly**
    Originally you had:
    ```
    ... [[if_arch([[arm64]],[[T->cpu]])]] m4_dnl
        [[if_arch([[sparc]],[[((struct thread_info 
*)T->stack)->cpu]])]])]], m4_dnl
    ```
    That last line clearly closes a number of nested `[[ ... ]]` / 
`(...)` constructs.

    In the new version, you have:
    ```
    [[if_arch([[arm64]],[[T->cpu]])]]l)]], m4_dnl
    [[((struct thread_info *)T->stack)->cpu]])m4_dnl
    ```
    The default `[[((struct thread_info *)T->stack)->cpu]]` expression 
now appears outside of the previous nesting, and the closers that used 
to be on the `sparc` line are now partially (and incorrectly) attached 
to the `arm64` line.

3. **`m4_dnl` placement**
    `m4_dnl` comments out the rest of the line. Moving delimiters to a 
new line while also changing where `m4_dnl` lands can easily break 
balanced delimiters, because closers might end up being commented away 
or no longer part of the intended argument.

### Practical conclusion
- **Brackets are almost certainly unbalanced** after this edit.
- The diff as shown looks like a broken manual edit (typo + moved closers).

### What to do next
- If your intent was only to remove the `sparc` case, the safe approach 
is: remove just that `if_arch([[sparc]]...)` fragment but keep the 
closing `]])]],` structure intact (i.e., dont move closers onto other 
lines).
- Run `m4` on the file (or whatever build step consumes it) and expect 
it to fail with a quoting/argument/parenthesis error if this is truly 
the current state.

If you paste ~1020 lines around this macro (before/after), I can tell 
you exactly where the missing/extra `[[` / `]]` / `(` / `)` are and 
suggest a corrected minimal diff.
