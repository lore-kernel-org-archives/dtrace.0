Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8BD126C0D
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209457; cv=fail; b=cEUsuzT0v7KEpKDsVvyU01vC2OfJQKRziT/Ao0iWIsC94GGDXLt7c1CP0aIPVc1y/G+KUVpWZ1McKTOfOvVLtatCCKELzigBbC5wsQEQf9FjbxNpB/vSYB2lOw1CH/u3I/HJfpkgr0L6SENtVSRMBqBokc41mjR+Cfiuhdq+N0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209457; c=relaxed/simple;
	bh=EM2l6Wezfuw/n3mufJd1s5jzAW0mr+4H007+Mw3su8k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tbXfA8Ss4XwTHhaAQyZx9GgGuIs6J0vrhnE+CiCdKSxmAaJnAt9Lqk2dhwdbYNH1FEsEP8rmOFxdzQi6N4SxQVzEdPg99M6fGj3Z/UB6Fu0VoIluMCLCVpSTUjSMLRxDl27qFNFaOLWQ4rbsZT8Sk2rP0LB6F4ux/yfYSb8bbmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SYVNxKaz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mvdByR4w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SYVNxKaz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mvdByR4w"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHMVFg010117
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=y6V6b7AAB7mhx1rlMLDrJJzwZ5x/5ai+YvL0FEibTbA=; b=
	SYVNxKazYqcbHJsMsDmSFrgEVrcOdNmrzBIblzlPzN2foM+yVAjT6cIzhqC4Do+h
	W+7w4GJNFBXtOKkgwhEXQ+23n8MBglPmAc7nxdOHzVC6Qqx23oYBwiIZpXTSgTwQ
	MWNyPzzfyS9R31VX9P0jBSA3bgNgPN5uxWYxE/ZDD8jTKzQHS2EQr7KyItlJT0tk
	d0QPeewC2mB/5LQpD5OwqdsqHrcblHdTeeN7bgfO4xr5WJYdI7ggRiit3ngygY+P
	r3Fpx30mEqhxu5ks7M5HTpmlqA3QvOnZmgWb952PtyjP6RYLHoGYZJ20hA/2b1zg
	wZKDEltg7F8PsSOQxb6Y8A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41smx363yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:24:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIrLMV026109
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:24:13 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41smk9rk8p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:24:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdaODV0w9R3FBiu1vCPM4/qhzFOVZM0hvxDWLq4zoAXws5U2RDVXax3YaDLsc18An8Bisi6JsTXQLAeOKt57a5D2K7YFY+33Qewr9tDaHxHLBTp9hmwRFazsXvGXmmi82W1/MWDHl+gcbCk90useq73W9rpfiSjVKaMdl+SJfUaTrSh5Uy+f3UwUHwi8nzeSadcWkjMM0nshRg3OLyWjzifmrNoKcGKtw6b+NIIAQg9cEjc6ze31CuGvQqntE1cnZx0fMi72rwnvyVobFLqENE4RSavUSBVazVvVS0ML/Xnlt/PvIyw/a23uyn5gSbQ11FDz4ahn1vrJXJU529h+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6V6b7AAB7mhx1rlMLDrJJzwZ5x/5ai+YvL0FEibTbA=;
 b=c5yFHWZPiMz+0ArsSuCe4PmhNsc0s5rMNsBL4fV0+SpFjH9W9wURH0jri9+sgmiJLIpws5yCy9+DBbm0wNlyh9tVFaKc5VVmA7KWP++OYxFh55BNVYCFlIUMLbsxwLdchmaROVwfN0V54NWfz2mRtzOe6oy2Xo8DtVUZ/JXYhdUwB7HHxO/2hYqWYkwp9yKX8tscShD6tgCyCbCj95ONEDWt6Y/o23jamhyyLZSlC9Gi/u/9ogIAPAoF5uJ4HGvvrYjJu47b0z4ho+joeCv8csO7e+dBPFiB5rCyFFRci8jbThZeeQcudJ82cZ8hg6UTikyeyAyGQmiXGA9VhyTUCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6V6b7AAB7mhx1rlMLDrJJzwZ5x/5ai+YvL0FEibTbA=;
 b=mvdByR4wUNI5IrVvA0wbn20wGXn7HwpSsxnanqfshKXl+J10fS/nsoFCriZOP4MRWZ8fQG91vom1q5vWXLBekBTjSXZJQsUNhou0XTDNgWDQF8mREfRyK6GVgiMtTGBcsJAJJYPsvzhNbm16I7y5C5a50HqGZt59c4cJ7amc4JQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7066.namprd10.prod.outlook.com (2603:10b6:8:140::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.11; Tue, 24 Sep
 2024 20:24:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 20:24:08 +0000
Message-ID: <6f0f324e-afd0-77a6-84a9-c799b1791ed4@oracle.com>
Date: Tue, 24 Sep 2024 16:24:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 05/19] Add flag to dt_pid_create_probes()
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-5-eugene.loh@oracle.com>
 <Zus5K4R4otOVRMO1@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zus5K4R4otOVRMO1@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0625.namprd03.prod.outlook.com
 (2603:10b6:408:106::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 9526c4cb-53fd-470e-b413-08dcdcd6d7bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckpXSTh1VTBsdWErNm9LVCtxRExhWmphR2QwWXdkK0xzMklkM3ZNZGlDZlVY?=
 =?utf-8?B?czNRUm9NQzRVbTZRcmE3NWFHVGUrNVpDRkZJeVhDY2xYMHhsMHlKVk56UW1I?=
 =?utf-8?B?UmwzQlFobW9kcVJ0VGoxQlpXVUhuTExXUVcvU2dWTENxNCtQakxjRzFmMFlX?=
 =?utf-8?B?SUd3VnBUYkwyWFVSMFF6cWhNeWdrT1ZGeU1KWFRIay9lZzduTG9ENmR0c1ZX?=
 =?utf-8?B?ZnY3b2ZmTVZrbldWSUlXR3FUMFNQUm11L0dnY0oxa2pMTTBzalcrQXRwNEoy?=
 =?utf-8?B?djQ4cWxSSjl0UEtOSG1TS3JiWnRYK3U3NWVXeC9DRWVWTFVSeVUzNXBJUmI4?=
 =?utf-8?B?TWRKK3RCa2lKL3RHNnJ0RWhrb2ZKbmdySFNZQ012dUZKTkZFeHRnZ3Rka3BC?=
 =?utf-8?B?U0tGQWNVSUczSTg4K1FlaHAva1VIaTc3NGpqWXdkb2Q0dndBeDVKUDVyZi9v?=
 =?utf-8?B?ZXp6VGIzYVppZVRtSlJQZXgxRUlVd01sKytyN3MrS0c2b1pDV0Y2MlJUb1Jx?=
 =?utf-8?B?dkFlZWV4VERqV29xUjdMSjg4M3hXcS9uSGhrZUl6UUVwcmQ5UFM4VHZBcHRN?=
 =?utf-8?B?dlVFcGFPMXNvbEF2MEhDT2taanQ4QWR2cWVZNkJkZ3V2S0luM3RNY3Bvbkxa?=
 =?utf-8?B?Ni80S0V4WHk4TmV5bHRaY3U3ZE5WVDd0cWc2UVdsb2xnY0NxbkhGaDgxL1RU?=
 =?utf-8?B?czZJUlNLNTZKcUpxNlJ1Q3lwa041ZDlVQVQ0NE0yWlN2RnNkYlBVZEVpampL?=
 =?utf-8?B?ZkZhcUI0WUFadXpHWEwvT0ZicjFsVWltSmU1YXJnbDloNlJEcWpjZzgwZFVB?=
 =?utf-8?B?V2ljcGpvZk1hNVJiWUhBSGFaUlRpK2drOXdkcnB0OXdBK3I4aGthcFgvVjVP?=
 =?utf-8?B?YTVoQU9jWDU0YlJmMy9XQzlNVmRVWGxSbmlGdkRDd1J0aFQrampBbWhSQm4w?=
 =?utf-8?B?MnEycndZckFjNVpLR0ErcDd6ODhmei9LZzdtQnIxNnFUNTZrYWoyU2lvbENz?=
 =?utf-8?B?RUY2OXY0VlZWZVQzU0RTQXArb3FRc0UvaFNlSmliaVFKYXBkRlJLWnRsUU9W?=
 =?utf-8?B?djg3VFR1ZE5yZkNnRjFoaTZxZmRWMkszRUFZUXB1VmhvQzRzMkJLTjM1WTdK?=
 =?utf-8?B?UERtT1RnYSszSGROWktTQmQ1cEpHV0tZYmkrTE5UNVNPWmZmeHA4VWhtbWpQ?=
 =?utf-8?B?YXVXUnBIUUR2RGUwdGcvR0h0VGgzRTJZT21lS3czbXVBbEUwMWtWZVNyUzFC?=
 =?utf-8?B?TDRKUk4wYXY0a0doUU5EZjJUdFNJY2p1ZUlVOVZOc1A3clpIb0huTmt4NEp5?=
 =?utf-8?B?QzZEalY5NmJDNkV1ZHhBS0RZdHh6OXlPZGlQS0MyK1VMR1FQcThKbWpIQmc3?=
 =?utf-8?B?eXNuVzErcDRsQldmMExub0NyUFQxN01vd2xzMml4eVBlL0pnNEt0ODlJZ00w?=
 =?utf-8?B?Z21rYThxV2E4R3dRcmgvUDFkV1oxTFlDaWcwdndEdVV3UnRLRzNOUDFiWWJw?=
 =?utf-8?B?bXNUVHZqN2FySXVKR1haZ1RoMnhmeGJBSmFjNFFXWXBSTlk0OVlsZWZ1ckRj?=
 =?utf-8?B?S3VvTEJndW9KVGVVNGtoQXYxdmdYZ2dhbTgzU2hPL3Vxek5rU2ptWEhDNkdm?=
 =?utf-8?B?RkZMaGdaYk5MRmtONElCanp1MzZtbjJIaHVXeEZXczFnYlpTWjBwRURiWlNJ?=
 =?utf-8?B?TXNxVUgvT1dUL2VGL0NSNTRUeW5IQUZKKzUrcTJRMmt4ZEpWYkY4Ky9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHdhblpoRUI1d3E2SVRxdG4rZ3dua2dtcUJrNWtXRWorL0JTdkw2Q0dpRHdr?=
 =?utf-8?B?VktVaFNZaEw5OVc0dmRNdjkvS0tFRmUzSGhsVUZvMU01ZXR0eXJtZ0p5NGIw?=
 =?utf-8?B?d3A3dDh0aHJNM1VVVUhVRjBPQWlGTmJnWUlUbUVlM0RYbTdOWlhvaUpnL3JV?=
 =?utf-8?B?M0tMWVh5Q3Y4ekwwYVR0MDRXcGt3Ri8vMDYyZmVWbUVYMWthZk5Yc3pNSzdt?=
 =?utf-8?B?Y2RFT2FqeE1XSjhNMFRVZjlFUVZxcjhqQjAvdEdrdW9hcUhJTXF6QU9rVkJW?=
 =?utf-8?B?MGZDQU95dHRyQStyN2lFOWlkbjlFODZyWU0wbS9jUGN3R24xTG9kbEx0NEVO?=
 =?utf-8?B?eUV1eG5RREtMMExjZHM2RGpRMTc0OWUyV0lHQmZ3elRGNjJLek01ZlpNQzhz?=
 =?utf-8?B?Sm5SUTJFZ2thenp4c25tdEp6N3hhSzQ0a2dheWhmdEcxd3YxbmZOTlpuN05m?=
 =?utf-8?B?blpVN3JiUkpHcURzNlM1NlpLNERGb3BpcUxETlorbUtKTWhmdnZCT3pKYjFC?=
 =?utf-8?B?SUloa21sY2d1SkJsYkg3anFFTXhjYmJpL0dId2R0b3lPNEd3TmxHTCtoSUJo?=
 =?utf-8?B?NkJaSXNxdVR2NlIxazY5TlpPbHlMMStTSE43VjE5N2s1eDk3ODIvYmVMZ1Qx?=
 =?utf-8?B?MWthWnZHaVowVjRNeG5RZGZOZ3VrZ1oyc2wzdUNpckFiVnhrejJTNDdUSEFL?=
 =?utf-8?B?ZDhoTDB0OE52Y2MySUtSQ0V3TDUxKysvRWpwL3VtQk15RHFzNEUzYks1c3hF?=
 =?utf-8?B?akt4dUUvQmV5djBZUTYwMmYrbDAybGV2c0U0NlhHWDFhdWczSHNlemJlWlJO?=
 =?utf-8?B?dCtXY1NGYmJOMkI5bnpaZGtMOWtvUHU2Vm9xK2tJRkxkN2JDb3k2SmJnWDY1?=
 =?utf-8?B?aW5wdkpoTjhlZVloaVBpTzJJREdwcHRvV2F4b2hxUlc4cWxJczMvb2llNkpH?=
 =?utf-8?B?VW0wbnp2Qyt6MlM4N3Arc2thSG1uK1Z5Y0F1WXJxMVc5c1NXTEVJSnJUaHNN?=
 =?utf-8?B?eGpSUWZsZUdoOWtrOGNsMzN0TS83eGpCL0V0dHJkWmZSR0l5eWJ5R0xYVE5L?=
 =?utf-8?B?NHBMUktnbDRWak5ldHN3RmVMNFY1UUdjNzI2VkEyRkdSSGdFSUNMYlRWaEdr?=
 =?utf-8?B?Qm9WeHdZRzJVbXFKT1FsMDJDS3hkSjZxZWxhVkx1ZVoxVGJmenhsckpEVkFN?=
 =?utf-8?B?OW5oRVB4d05UUXp0UVZqdUdFM05rVWlYYWc2YmMrbWtWSmZrdTVCSmRTdmNM?=
 =?utf-8?B?Ty9GVzF2ajFsbUl5TFNNNWI0d01sMHVEQzNaQmgxUnA2ZkFWZWthOWp5MkVO?=
 =?utf-8?B?R1hub0l0NHNhRnFKRndNcys3SXlxSTBUd1o1aHJtaUtLYWw4WmJGMlJwdTBO?=
 =?utf-8?B?NlVPNUo3NXlNQjhnNFM4YTJpTngyc1F0TTk2ZzNTMFF1TGhjVkx0OVkxcHFv?=
 =?utf-8?B?QmVESHFFandkbVR6SFJmSitjbTg2a3lrYlMwdmYvQmxWdHFVekVDK2dKNDNZ?=
 =?utf-8?B?WnVyMGhrRVM2RWJpd2RXdG42cHdDSjJWM1MrTTBNZVFLU0N2NVdYd0UzSlNB?=
 =?utf-8?B?UWhDNXFITkRFOURuc0xGYk1wampHcEx6V1M5anU2S3BYN0k3VG9SL01aTVlp?=
 =?utf-8?B?QksvVDlRY3Q3dUh1a2w1Q2VJVnlzb2FPaXArNGZqaHRKL3ozWk9hUi9rMldy?=
 =?utf-8?B?a3d6REw2dExMa05yMHBqM0N6aVRtdC84ME4rTjBzWUIwYWd1eSt3M0t3SVlR?=
 =?utf-8?B?SGlCL1U0TkhPTldjL3R3TkFVV0xrcURrUWpsenA3VmpsNUt3M1oxMlpUOG1P?=
 =?utf-8?B?dUJkS0EzV1BjRUNqWnJZclY4M2N0ZG9BMUpJejdTdThoVGVRSUZPZEUxdXgz?=
 =?utf-8?B?Ly9XcWIvdmdXd0d3anVlZTc4SGpHR2oxeFZBbWkwSHZsbkxwczlHVjduSGlp?=
 =?utf-8?B?SHJJcitqZDNSbkh3MldQQVJObWJ3TkhFT2w1V0pyTk44dVFQYmYzQXhxb2Jr?=
 =?utf-8?B?aFFNMDFlUFZ4K0p2YkkyYmpidGZ1Uk90Ym8zQmdwUEdYNDdGdmphYUpOTzJq?=
 =?utf-8?B?cFJqRURPRzB6eDRsQ2dPVVhJd2NNeFJjbEhUN05uRzJFb0R4d0VkcnZmNmEz?=
 =?utf-8?Q?JOodFySq75x5k+0R1xrkraTfu?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WNYCf1k4eQSUmB/JnFJgWYhYKEzz2+BCqadI56WkJCmOajywTm2YZs1pjWInuMNXOO1jNFd+PnUCnnZg2cTYN1bAePLK70q3/ksxUmILQmEC4pGymF6IlfCepUMhVe7Wp2Oy5/gyEnCUctbtZz9xmxyuaNwHRKY8YmSc+Pmkkx+UN/roHwtFdO8toUTNKs0uk5iLl36ksFcGPdcp37kFDW+ZH5gY78d6mCWhNV6QY5cRnUkEm2ZnCB/fjDu7njCB8HUMfqM2HgYoAYMoWswjwEfelwrE6NG6MqlwPi1qBFGoSUrLnRktWeA+nme4KUEL7DU23mhg310pmdTZi0JF7IFvsJnN8x+FAp6tJnpJonQKtWFVuRYLw+KRjxb1/U/5sYIopJvg4PpHr3EixVLZeUVw7rQBJP924MtZFqaY7yBG+9OEKKiGpGqmPI7y+kCwZL5AmhdCSuwwEb32HoySoj1cjcg2D1VjK8h3qJKrED/ZPsINc0SQOB7imSMkvk2QI69sP6f1idEpJBwv2itA/KB5yLnJjYKCzE2uNHnWMol0xF4SkMHvrd9qBCmtBIRVxIzOHoBFLMZp8l4ZeUDVzyx+WwrxNKUeYYSvTGE4euM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9526c4cb-53fd-470e-b413-08dcdcd6d7bb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:24:08.3085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6avmt62nEbx0Lymy3eZC9tASAsxMtBiIGUCHSMcMrZb1EWFY2vc3ME6Cfp+lyQ117pQlCiYY1cSXx0TnkQr1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7066
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409240143
X-Proofpoint-ORIG-GUID: KmsfuCLcIIZTHUe89I5g2vkUksi80EQj
X-Proofpoint-GUID: KmsfuCLcIIZTHUe89I5g2vkUksi80EQj

Okay.  I'll patch a v2, whose Subject will now be:  "Split 
dt_pid_create_probes() into pid and USDT functions".  There are 
cascading impacts on some other following patches.  So, I'll post new 
versions of those patches as well.

On 9/18/24 16:33, Kris Van Hees wrote:
> On Thu, Aug 29, 2024 at 01:25:44AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The function dt_pid_create_probes() creates both pid and usdt probes.
>> Once the dtrace session has started, however, we only need to watch
>> for new usdt probes.  So add a usdt_only argument to the function.
> It would be better I think to create two functions, one for trying to match pid
> probes, and one for trying to match USDT probes, and to call those two functions
> from dt_pid_create_probes().  And then, after tracing has started, only the one
> dealing with USDT probes needs to be called.
