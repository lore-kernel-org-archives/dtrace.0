Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ACB2E03E6
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572523; cv=fail; b=G8ExuMyszOujkPvCZrxSOIg1bH53YX8hJqzRsbcWunAd9agL2neQ2Cfq+/n46IfIzaVeladD9zkJv7HxEVWqKFiZitp6jX0fFJpNszz/2XbC7dv38rdO4ri/9M7wdNPQ3uIGFA5aJ/wgJjehXa0avKZhuGHhCjG9jPXnCEFJdyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572523; c=relaxed/simple;
	bh=SIBz1eEiqfDdFNE0FAj1f3CSPRm/ixgx4CFCpFMbKso=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AQ0ivOsycd/FOL2c/aIolERaBppdGFmNWPZdgibXW8aHm6vIX+iK28FMfL+a4fqJG+/ZYFL3ruX03aM+hKvq0aBKBPohTeRMMQfUt5488SkXc4aNoYGt33i/Ont1JnWUBn9TJuttc1irrs9Ki5+hK/9jVLiaaz9lfTR1SX7c2xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ya7eMmSQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F6t0npP5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ya7eMmSQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F6t0npP5"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HZ4Zv007610
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 19:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=7gEDWqrLDP1MHX/mZnAlotPeSasxk1PcamTCeDOMBg0=; b=
	Ya7eMmSQWGdmo5GY9HJeZy7+eEo+Qcx2ZXYCWxaNj9PdIE1JrinZGYTc4klMGBdz
	bAThq+Bzv82m14xMJNMXkjJ337r20t6/nkh59MoREzZNFyn2CuA2V+0I2hyzkQBZ
	kxUQj2SccWbZWosdtCFrCVdux1jArNINmt+Dcym2OdwDdBemcct/JRnIcwnv0vjo
	vqcwywiWp8asEiNjuF1f6cAed0xKDCEwgo5eL+D9peq8gbph4NyAeyjzNNAgPEzK
	kg+A83bOZLlsTZ5ng36l3YetbG+vloj7xb4pfaWAB3DnoQAP4FVR28u2pp+rkTK9
	ufRu/VW/ms2XodSZ/Sq6Hg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfhn80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 19:55:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563JAhki024744
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 19:55:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ud4h6y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 19:55:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMpC0M41YV3K6xrHl0TG+K5KQbfGHofaDH0VRktRK75BTX2httEy9aIOIpDQFZqDsdua/W3kXAGAVuWQDSqkSazc5GbBzqTXQqA5DQd2j/7bleiwzEt6I5P41Ald6HVUdec9zR70DcEa2BG2feM1pVqoCD1+8+vpRKk+zgDb0slCSy09jH4vA0RYGpu5t4FpKLtNA4JALoECxtCewSEzwTQUm35GupFAVMRRv+asxM473DTTGnB3pyq9lhFfbBcR8A6nT4pD3AUi/nHNpm7h2LgTRfylyEVGqmxDxn86RqjeelBmnhfr3FSQ3XhjxCgyFyREYtcnUkGoBuNf+8gtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gEDWqrLDP1MHX/mZnAlotPeSasxk1PcamTCeDOMBg0=;
 b=hKGCuPRaaVupgrufT9wSZWe8GlA4YPuqx9bo3cmwty5VOJqYYXzs6aM6sunEaNSGgnRK5vN76nFvVs8Ge9X0OuY12/4OTMMVMmLlk1haFTSOWrfXdlNab/k0bAny+pTwWy6vki76TD/EAgZzaQDUwakxDyM0+kq5+oemBmSp34A4cNVZLEQO7W4e/Xan++iF8BsMz//ObScqqMCyBKNVI25PBpdJfdnN4ema2XzrrDEvCdgh6oEWalvzX3w1lj2XqtqAvSCPQxY6nfTbVkIXIRjWkI7XdJkVeE+odgjHZYNekZWwVH/IVLJztbwcEjCsL3/suxxRDGuOPve4ohnbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gEDWqrLDP1MHX/mZnAlotPeSasxk1PcamTCeDOMBg0=;
 b=F6t0npP5LDKpvJpUEei2AWPN2ld/iYxF+FZY6OHVdWeF9VM8X2PsinamOTVn5BRy7o+HYDpUtrT9eW55Lx6CkcAzPKrYKuvXCXLhNDmrxFxqTVmv7EJbTJE2IgbYZ0MyqgVah/3HzhCmtJDp/RXKjCgmBnmQ2xkT2OdJOanmnsk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7979.namprd10.prod.outlook.com (2603:10b6:8:1ab::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 19:55:12 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 19:55:11 +0000
Message-ID: <51b72ab6-2a75-a48e-4b15-fe51be4f6ba5@oracle.com>
Date: Thu, 3 Jul 2025 15:55:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 3/4] dtrace: add tcp provider
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250610135813.15746-1-alan.maguire@oracle.com>
 <20250610135813.15746-4-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250610135813.15746-4-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: b5406b47-4c79-47e3-b673-08ddba6b854a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cE9xQ0lwdGFuRnVmd3RFaHVFcVUrT2YxcjVlRG5DWURrbDdxKzZFd1Jsdy9u?=
 =?utf-8?B?N2owZVd2bXFyTjUwY0FPM21RVXlablBrV0IyK1dWNjRycTd0S3lhQkRsWFBl?=
 =?utf-8?B?ak01RXlraVlMODJnTEFVRlF6Rk94S2RyYlNISWZ0VGtoVEcyTFVIaWtzcTZh?=
 =?utf-8?B?anhYUWVwK1hUYzNHZHVxMyt4bjZxZkRPdlhoS3pheDVTK2MwM3loUEZPdFNi?=
 =?utf-8?B?WHZKeExTc214ZHhMb1RnWENnOW1DNlFXbU5LWENsMGhCWHZWbWdpTnJGNTJ6?=
 =?utf-8?B?bzBMajByNGpEU2JaUVQ1Mk9ocStuM1hBMnQydG9CZnJBZkJDSEhVWkpyZjFZ?=
 =?utf-8?B?QWZURGVkZDZOa3BjdmFjUzZvcXlvUHRZYnV4cW16K3RQN1pmZGJpcGNyMHNM?=
 =?utf-8?B?S0dUMmRJVzQzVlI3b1FsTm92TkJVYWxTQ0VDS0tNQXpEYmFzbnY2NmNHYTlN?=
 =?utf-8?B?YlV6ODlIZ0IxZjF5cDhtSGhuZC9XVDZzVElnWUZIeVpDYmVvd0VGZUlOdFA3?=
 =?utf-8?B?cVR5blJWSVErTlByZ0hkZ05hdnhJOEZvUHFzdG94L1ZCdjM5Z3lleXYyYWx5?=
 =?utf-8?B?T3VzTlo3RktSdWhWQnJxMzJESWZLclZpanZsZ0MvamlhZTlyUDNsTUh2SDds?=
 =?utf-8?B?bUJHZ09KSVNqb2lQUjhmZkFybEgxUzg5cHlRQ3R4RDY4TDZhVE9WaU5Id0dU?=
 =?utf-8?B?RWwzL00yU1FVYmlkNnZoWm1JZXBkTmY0NzF6bzNiS0MzazJ2aWZPdXFzRzBy?=
 =?utf-8?B?Y2RtSVZhczhvMjR4V1dRY0IvcEJ1N1ZGSU1RSWlVYTZua0RhOHpYcUhNOWlO?=
 =?utf-8?B?L3c3RGxXaTBaMWdMa1VEaTNHaHZYV3dNVUNodXdoUFBMa3NxbzZxUThITFZK?=
 =?utf-8?B?RkZMcFhyRkgvbGJialR2K2tCT01hbjU1M2lmcWIxZHUxZkJwcnpLZkEyeEYw?=
 =?utf-8?B?dEVEY1FCQlpsZElnM09QVENtdDVmTVBObDJ0Z1FwbGRTZ1E1YklkZ2VZaXo4?=
 =?utf-8?B?M0pNMW5zZTFBTEw0ZVlTUG82Rm5sY0xFRTNhU1ZlVVVqNWlkNXlFT2UyUlR1?=
 =?utf-8?B?a1NzeVozYjd3ckwrRjRyTGZQbmFaVlNoRitzK3RtaUFISXdGaU5EQlA5UHlP?=
 =?utf-8?B?b1JTZTUwcTdvRGVBZ3lJM1pHR0VBTndPeXUvdGVOZ1dSaVFCSncxMEtuWkdn?=
 =?utf-8?B?T0htYlEvRWRpejdhMHFaM2swdHlwLzBHZkk3aXlTelY2T0NIZHRmdHUzR1JL?=
 =?utf-8?B?Q3FBbE4zM0dTMEJNb0VyMDV3UjJWeHJKK3U1WlNKT0Z0V1ZUS1FMLzgvN05B?=
 =?utf-8?B?R2s3c0txM2xiT0VBQzJRd3NCMUwxZm5YMGY3OVpGTHpBNklkMG9HcTc0WkpW?=
 =?utf-8?B?cGJGeHpqdnU5cGE1dVUvcHU1QXFsR3Z4cHVqTXV5d3IvTFVnTitCZkVFQURW?=
 =?utf-8?B?cEVaOTcwTStRalhzQkI5NU83UFBFb1BmNzJNc3RjenE4Mml0VzF2ODFUT2Na?=
 =?utf-8?B?VTBJcWlhL2l1WXc2bU85RmhnTjM2TE9qeGpjSWxWM0lJMnRsWmw1NkxPWWF2?=
 =?utf-8?B?Um5hdWh4aHg3ZlM4OElkUFo3c2RGaVFFSlN2dlpqaFVET0E2M2NYeWxpdzNE?=
 =?utf-8?B?S0RiMXZKeWxqKzhRQUFISUx5WDV0Q3BROFlXdEZuK2p3Z2JvdlJ4a0xZN3Y2?=
 =?utf-8?B?cEJ4MjFqekVHVHcxQTRxK3NRNjdOOFlEU3hBVm1lTmVSWVN6bmFkUzl2QlVQ?=
 =?utf-8?B?NHZTMnptN3FVWldmdE83RG5lYjlxNWFYcGNjZGpYVGs2akgrM0VBYmlPV2pW?=
 =?utf-8?B?TDZIMURhamcwc2JGSFlRZFViNmdscnF4blZVRzU2M3hVekh3Y3R1UHJ4RnY5?=
 =?utf-8?B?by81ZGNmNkJJR0lZaGltZ0ZWSHZZZW5oelAzWFVDQW53Mmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdVTjBjdGFQdVdJamlvVnR6UWtyK1h6OVM5b2tOWHo2TXVuQUtYMnZWbmhu?=
 =?utf-8?B?N0FWa1lsdFcxZ2QvaU1UUXpMRUJXbldqK2t4QmxoR2F0WW1ObzNLbU9GTGd0?=
 =?utf-8?B?cHZQS3p4NXRmc0V1VW1XU3gvZFVrM1RNd3lLazdiOE1YTWdMQ09peWFPZHZ3?=
 =?utf-8?B?SEdHYy9TQUNTeEZEWGhhK1ptMW4rMzVpTSsrNUtHYzhXS01tY0xHRnJTQmxS?=
 =?utf-8?B?dVZxWUo5cHllVFpKNFllcHhRcjhlVTluRnpJMW1GSnEvY3JNQjhzNDJMaUxV?=
 =?utf-8?B?WlRzTXBNY3dDT1NOOEg2cVV2RW5jZnRKNHV0dlNsUm1Sd1M4SENGc0JRbGpt?=
 =?utf-8?B?Y2ZmRmdYZXp1NWdOd1cvWUZBL0txZlNidWJ6MjNvMUNPUHN6aXdwdTgvODFx?=
 =?utf-8?B?ZGduVmlMSTZNT0hGcVJwSzJaRjBZZHo5R3NiZXlwMUo1SDNadlNVTitCRUVY?=
 =?utf-8?B?SGtwdzlvZkNUcThxTWxONXZLWUpIU0pmd0VLSTJCR3FEVDNQaHZ0SnBHNG93?=
 =?utf-8?B?Yk5ZS3FXc2xFZGdnNGp1MjhCWk9KYVNKS3YwRFNic0JXYlNpWW91ZHMwcEZ0?=
 =?utf-8?B?UFJCZWtPNDl0UzdudWIyMTZNdmJXdHI5OTIrQktRMThBbjc3cTRLQ3VWRVlC?=
 =?utf-8?B?YktQTTN0dnozNXU2MzVaMmZZS0dOYlo4djRvcWo5QkpNRzhIUUd2RWtncnlw?=
 =?utf-8?B?YjVEa0pnZkFjc2p5Y3h2a2F6Rktjc3o1SXprVE5JT3kyOXE2LzkyRUxzR0da?=
 =?utf-8?B?bUJGNWJRWklIUUpqRFk0Z09ubHVQd0FIZ3M5TXRyL3ZnbGhvbGxMQTFTck9a?=
 =?utf-8?B?MDhWTnZRM3d1SGpRQVAxT3pvTXZVQmxobHozVDlES0FVdVNNa2pMeTNyREp4?=
 =?utf-8?B?V1VhN2NaL2ZDcXg2djFBVWQ5dGIxZHZPMFgzREtFbVMrc3I0dUdWVW9KOXp5?=
 =?utf-8?B?R0diL003WmRwT3o3ellIM1ZsUm55N2lkQ1l6VUg0bENEbC9oWWdnOU1xVWdu?=
 =?utf-8?B?Ykc0eStqM1k5cC9JbnArT1dzck9oUmtDTkd5dHpiZWFsNnhWbnpkZlcvcUdW?=
 =?utf-8?B?cDlDNVhSUytSb3BzTnNxVWtXM2lPUjc3ZDFrb0dsRG93TnlvbGM1bURQQS9Y?=
 =?utf-8?B?VUp5eUtOVXdYRDYzL3Yrc2FZekttU095aXJxZlR5bjNRY0NaN20vSXZiZkRX?=
 =?utf-8?B?RGN3UVBOMmR1dndsaldiN2tVRHFPeHZjTTFDbzF4a25vQTBobkJaN29jeFpx?=
 =?utf-8?B?d2I2WSt0WXdWM1F4UXVkcXJlM1plK0RiQ0YwazJMNFlSY1Q4TXpTSTY3VDNx?=
 =?utf-8?B?RVFjVHk2d2JQcmdITWFiWEFhaG5BMmRKVGx5WVJsdnJPVHBYTVdrMHVWb25T?=
 =?utf-8?B?V1VYQW5JeXkrK3NPOGh3aHBYekNDVEFDMXl5alMvNkVjM1FIMjE1UnJyVFJw?=
 =?utf-8?B?YXVyZVpka2FVWVJmN2x4ZTRleThFV2tzRVlmN3NHbXU3RS9YRGcyWjllZHlh?=
 =?utf-8?B?Y2diT1ZWQnIzZjZpSlFMbzZFWHZXQk02MU02OHczZktLVlE4NHo3cjdFS1Zu?=
 =?utf-8?B?YmRLV2UzMmJ6d2ZqcktuejBEclc5cVpHSzY5T2J1Z0c4Vy9jbGNvRlV3TWVJ?=
 =?utf-8?B?cHhFUVZydm9aeTJXYU9MYm1xeUlhSHFzYThPWnh2alI3Rm9sN3lTYTQ0YTVH?=
 =?utf-8?B?RzU1d2VjZlJyRm5MdStiTVJmcVMvVG1mU2sybDBHZyttMXl6K095b2J2YWJL?=
 =?utf-8?B?eVdJbkhoMzUvZDRjSU94b0JZVEk1NzBWNWgwQXNVKzZ5UGJhWWxwR29TZGN2?=
 =?utf-8?B?SGJydlg3a0F4Ty92VUw3OEFjcSs5cTZnMUxsOUtQalJXemRuaDV3NUVBdU9z?=
 =?utf-8?B?akl6RUtobklVQ1F3cktLYVdvSGc2RHg4aDRQU2ZVUmdYVkJtRVlQbG14T2lN?=
 =?utf-8?B?bTFueVVPbkhGNStRY2YvZmExcmJ6cjhqY29RVmVHSGdkNDVYeCtxZHF3ZTJw?=
 =?utf-8?B?UGk4dXBLREM3d3VYYnY5UkdnWW45T3l6U2FRZWN3MkYvV2lKVkFmRCs5Y0hS?=
 =?utf-8?B?VnJUM0NEaEdzYk52c1F1cnhtZ2VQSURrMkZlZXRid3A5TFNzUVZHSE9XbUNS?=
 =?utf-8?Q?2CwzWjKSwFT0fgAp/diGgZnpR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	666gAoqKWb1GJpKXy7u3oS6Gn5u7pdVDpJUYS0u1PGpefF/QQju+96bhXKCXH9vr19RdgvQRHDI7LXLp3ifmKCBSNZOeknongGUO7VqeDMmd+R9lFWBkswtaqcHt5iPUVulUal2jG0JjPBk50z5SQqzR9eUdHlBvyRbLrJxfR1roXuczjiHuCYVXdkjVUJmEnXthLdd9fJvPFAImF+vLnN00NY4bdUhjX/FwvCJDXuHxjZQonmuy4KmXGbJd6ioBD5INTy0mR1JS8YAy+/Q/IbfsfPS9wjeBy/YIC+ahGlF6WDjiCmOLbfERcldGqwtsE6kK5qgpfojRpiZA/7s6cw+5aDmJm5A+vriFa8fltGK1+V8xaOpm1D0YQCfLOT/dkRvAQBBwAugmoo82zOBXemw3YN01wAYCcsXU06v/fXz3xL0X8718kUIOPnohqcDK77NTazhA0fZSqjfauwiy6n11LK4jDWDRQlA7HVwOC6RTVoBGimXWB4iYTFwmIJLJynX4oLHHKVonDh6DT6cbayYlXU/LZkhPipYdk3DM66pxqQa7GiOQEtakUaKCuVyjYQdtPlsGuxKJyJpeHPM3Wf7urzl+VKjub7B6/HgAdUQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5406b47-4c79-47e3-b673-08ddba6b854a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 19:55:11.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8k9Lfb9X71ndvzvfqRdubim23/9JkKywsowY9u6bATI0hEkbAf2C2qZ4bV1gJTnMQR29dq0+AT96LamE8x7u5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7979
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507030164
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=6866e028 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=1XWaLZrsAAAA:8 a=N-WeTNB9yGLfPAtYp2sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13565
X-Proofpoint-GUID: MzlSR20zUrXXNnrx-kzegbV7kkW0nbqC
X-Proofpoint-ORIG-GUID: MzlSR20zUrXXNnrx-kzegbV7kkW0nbqC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE2NCBTYWx0ZWRfX8iESvZYpf4// dP+Qv5PIQkW1LglZUAb3Doi6IJnYjB3YKD0ji4DkfUNq1LxI+vCPOkjfWtvS+kkgKKS1EqS2RmM BYUK8cifpw+Gcou9bEAMHfDefwIn77maGpsqfsb/jwralfu2XXT+Y1OxNDA9ZghvvxB1MoiRdsZ
 494oLbgOLNQxB80agZAaknJFV8CFAcJtarZpgxHMHKQll3nQHhChGe+eEShbnjM6RBxraET5c+M JGXXTIZ12RuaM7EoYWUkVEIbPG577RuSf5I2p3AIt7V20Ji15uCu1RIq5M/bRxY8HPcsBjv6yjX JBT6X0SBfv+6MntqjOcanE6K3ov9jPov53fFy4Fy784uEFGe3VXfG0w3p8y8Li2Kk8GDUra8Gz5
 8aWZYF7EsEMLxmqfK/Fu0aSXLPTuPI/OhY3Wxojs8z1lVqBAoPyhvvfiB/7lqfRKYLjyRjbW

In general, there are lots of code paths here.  Ideally, they would all 
get tested, but I know that's hard.

Also...

On 6/10/25 09:58, Alan Maguire wrote:

> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
> +static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> +{
> +	dt_irlist_t	*dlp = &pcb->pcb_ir;
> +	dt_probe_t	*prp = pcb->pcb_probe;
> +	dt_probe_t	*uprp = pcb->pcb_parent_probe;
> +	int		direction, have_iphdr;
> +	int		skarg = 0, skbarg = 1, tcparg = 0;
> +	int		skarg_maybe_null;
> +	int		skstate = 0;
> +
> +	/*
> +	 * We construct the tcp::: probe arguments as
> +	 * follows:
> +	 *      args[0] = skb
> +	 *      args[1] = sk
> +	 *      args[2] = ip_hdr(skb) [if available]
> +	 *      args[3] = sk [struct tcp_sock *]
> +	 *      args[4] = tcp_hdr(skb)
> +	 *      args[5] = sk->sk_state
> +	 *      args[6] = sk->sk_state
> +	 *      args[7] = NET_PROBE_INBOUND (0x1) | NET_PROBE_OUTBOUND (0x0)
> +	 */
> +
> +	if (strcmp(prp->desc->prb, "state-change") == 0) {
> +		int newstatearg;
> +		int skip_state = 0;
> +		int check_proto = IPPROTO_TCP;
> +
> +		/* For pre-6.14 kernels, inet_sock_state_change() to
> +		 * TCP_SYN_RCV is broken in that the cloned socket has
> +		 * not yet copied info of interest like addresses, ports.
> +		 * This is fixed in 6.14 via
> +		 *
> +		 * commit a3a128f611a965fddf8a02dd45716f96e0738e00
> +		 * Author: Eric Dumazet <edumazet@google.com>
> +		 * Date:   Wed Feb 12 13:13:28 2025 +0000
> +		 *
> +		 * inet: consolidate inet_csk_clone_lock()
> +		 *
> +		 * To work around this we trace inet_csk_clone_lock and
> +		 * use the reqsk (arg1) as the means to populate the
> +		 * struct tcpinfo.  We need then to explicitly set the
> +		 * state to TCP_SYN_RCV and also skip the case where
> +		 * inet_sock_set_state() specifies TCP_SYN_RCV otherwise
> +		 * we will get a probe double-firing.
> +		 */
> +		if (strcmp(uprp->desc->fun, "inet_csk_clone_lock") == 0) {
> +			skarg = 1;
> +			newstatearg = 2;
> +			check_proto = 0;
> +			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2),
> +						BPF_TCP_SYN_RECV));
> +		} else if (strcmp(uprp->desc->fun, "tcp_time_wait") == 0) {
> +			skarg = 0;
> +			newstatearg = 1;
> +		} else {
> +			skarg = 0;
> +			newstatearg = 2;
> +			skip_state = BPF_TCP_SYN_RECV;
> +		}
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
> +		/* check it is a TCP socket */
> +		if (check_proto) {
> +			dt_cg_get_member(pcb, "struct sock", BPF_REG_6,
> +					 "sk_protocol");
> +			emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0,
> +						 IPPROTO_TCP, exitlbl));
> +		}
> +		/* save sk */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skarg)));

BTW, is it actually necessary to reload %r6 here?

> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
> +
> +		/* save new state */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(newstatearg)));
> +		if (skip_state) {
> +			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, skip_state,
> +						 exitlbl));
> +		}
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(6), BPF_REG_6));
> +
> +		/* save sk */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_6));
> +
> +		/* save empty args */
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(5), 0));
> +
> +		/* NET_PROBE_STATE */
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(7),
> +					NET_PROBE_STATE));
> +		return 0;
> +	}
> +
> +	if (strcmp(prp->desc->prb, "accept-established") == 0) {
> +		direction = NET_PROBE_OUTBOUND;
> +		have_iphdr = 1;
> +		/* skb in arg2 not arg1 */
> +		skbarg = 2;
> +		skarg_maybe_null = 0;
> +		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
> +					 BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB,
> +					 exitlbl));
> +	} else if (strcmp(prp->desc->prb, "receive") == 0 ||
> +		   strcmp(prp->desc->prb, "accept-refused") == 0) {
> +		direction = NET_PROBE_INBOUND;
> +		have_iphdr = 1;
> +		if (strcmp(uprp->desc->fun, "tcp_v4_send_reset") == 0 ||
> +		    strcmp(uprp->desc->fun, "tcp_v6_send_reset") == 0)
> +			skarg_maybe_null = 1;
> +		else
> +			skarg_maybe_null = 0;
> +	} else if (strcmp(prp->desc->prb, "connect-established") == 0) {
> +		direction = NET_PROBE_INBOUND;
> +		have_iphdr = 1;
> +		skarg_maybe_null = 0;
> +	} else if (strcmp(prp->desc->prb, "connect-refused") == 0) {
> +		direction = NET_PROBE_INBOUND;
> +		have_iphdr = 1;
> +		skarg_maybe_null = 0;
> +		skstate = BPF_TCP_SYN_SENT;
> +	} else {
> +		direction = NET_PROBE_OUTBOUND;
> +		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
> +			/* NULL sk in arg1 not arg2 (we dont want ctl_sk) */
> +			skarg = 1;
> +			/* skb in arg2 not arg1 */
> +			skbarg = 2;
> +			have_iphdr = 1;
> +			/* tcp hdr in ip_reply_arg * */
> +			tcparg = 6;
> +			skarg_maybe_null = 1;
> +		} else if (strcmp(uprp->desc->fun, "ip_build_and_send_pkt") == 0) {
> +			skarg = 1;
> +			skbarg = 0;
> +			have_iphdr = 0;
> +			skarg_maybe_null = 1;
> +		} else if (strcmp(prp->desc->prb, "connect-request") == 0) {
> +			skstate = BPF_TCP_SYN_SENT;
> +			have_iphdr = 0;
> +			skarg_maybe_null = 0;
> +		} else {
> +			have_iphdr = 0;
> +			skarg_maybe_null = 0;
> +		}
> +	}
> +
