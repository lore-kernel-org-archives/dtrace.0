Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372097346D
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 21:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723672237; cv=fail; b=LVl7oXpj3SwSFeJ1ZqH8X/S+hPGMSoIDMCc5i4o2ne6dTfQKRQu7nAEK5pXFfpWYWkdh/BZHdnE9X67gkGEMJAkR/JA324ww84fLJ0qtu9Ogp5nrdSiHZBUT4DtwmTDd8niAtirDlQWVUoeyxrJe/Vj1sT7ifUUrjgrw/FgYIQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723672237; c=relaxed/simple;
	bh=VszTmE8awcnKE/arqQtBEdbeaquNG6BXjjE8/JIynMU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ssvY4WeyPHhPdpAQSsTIQOKlAZtuOF7JNTc9EXni2u6GDqSJmXMMIqlAHG72a4uvQs0Oft7WOOq49UH9smOIGfk80wgQ0ETnHW4j7x0vJgrquFoGMyF3zgbgzWGnHV6mgucfSRn93KWuxRMVil9obGqnmHNRnVyFSG0oNlUeqS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SY/cPUck; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Y5Tsrz7P; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SY/cPUck";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Y5Tsrz7P"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EILIkX028372
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 21:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=JvVIHObfT/HU3J8m4Qua0Rixfkipq5m8bQS4+GR1SpY=; b=
	SY/cPUckL00ei31+sk5XttFNiqY722cL2lWuzs2xDoM0vKNt7kMxwXWFouaUGGbd
	ovyJUDNB6xtneyLSt/2KiIZJjf6xNLRbpDZjQQB+ZiJV1lAe1MEv8jb9fl4Pc86a
	3eVIGc+ekyzO38vFC78rjgkOp0o613URvAl5GZlaEKjvT+COe6aYkEv3hwPQafYu
	SECUB3YfH/qKiBoHY3NCWoY6rg3zWp9K5HgFGMyDDKL0Aq285D/hAaCUnFflc+57
	LjK/l7eDDfaKlAwjXncxYlm2xz7GU3OUEEpYLeAunAuaUe5Hl4EXSIMsp8stSh3/
	oupU/+89pIIYeUiRL4VrdA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wxt11epf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 21:50:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47EKd61t017734
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 21:50:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnbg7fk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 14 Aug 2024 21:50:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNgokwQ9PUyevWHS3+pZ4rotLArpWFJWaoNlDk73qukY0MYoVaj0XUeg/6EnrsSWbm+tW1cxI6AFejiHNo1w7ds6DNoeb/16jK5RWVvMsk9/t1c0ICmI6h/NX9ODiaHfAvxksXwAg/77jnREI/UZH7vhnRPzCh2ki3Y+pqKJRKfJls2FXmc0pF8nJYtxgvPf4HuWUUB0HL+q4q1FiQOuv8rNsWAUnrZNxWkvpqP4aLvkLqeiJnuSNQVD5BiBUDDNSh6a518risH+k2uUjT+3aRZ53f+3JHmazAvkIkON0HAoC808PoKurmaJMvXHyg3hIw/38qz81JdpVjor60wd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvVIHObfT/HU3J8m4Qua0Rixfkipq5m8bQS4+GR1SpY=;
 b=Wr0xcXzYFn0OdAPdRxgY+Lx3rITe4+fc6hDkE29mO6f1rUeLSsE9K+SpK/g/xjo8F5ZQwMJT7jPnLEirvog/7xFPzHuZtjtNSt/fsNSiF5NpQHYU3WS2nhGPnv6Uwsn3tqR+HfFIf6DV/o0Q5Gh6L8gx2VpvV6Y0IGHOwQEe6nOQLpV63goedoAJgbjE0SBtX0fFNKThxazOoj+EQlMOYjILKEe+DoAbcrnl1KuwP2gi0flvqjwEndEpj1w71e8z2hV+OAvH9ADEDG7zf2otbD4NqTkXrtT7kfMrcyHCqnWTkwmhzR55eJ4ist4CxDPxsfD0TxX2JovoFEgfaNQUKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvVIHObfT/HU3J8m4Qua0Rixfkipq5m8bQS4+GR1SpY=;
 b=Y5Tsrz7PUH6rjwX/S/Ks4wVeFMaZIKz8NNThYzBJ7fdrCnutKvK/MlYRTYAO2uzuOXlv4NH9sHcIx8Elo6vlcNH15fPsWv9vCsP6Fy+SqmLENweoClk8obiN1UfiMbKUE00DnvCJYn+OfLmS6W6ukk0WpRYqIAnLQPs/v0UH2Cc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Wed, 14 Aug
 2024 21:50:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 21:50:30 +0000
Message-ID: <f4c37d36-5a0f-17a7-19d3-37afb41a331e@oracle.com>
Date: Wed, 14 Aug 2024 17:50:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] Action clear() should clear only one aggregation
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240814025925.25408-1-eugene.loh@oracle.com>
 <ZrzT9mvBboADVnsE@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZrzT9mvBboADVnsE@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:408:ac::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 43629428-7339-4831-b0b8-08dcbcab1dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVp1bS9ab1M0M2lNSkl0UjVFdFF3UXlGWW55NFdRd3VYSlNpSjErSjhUTEIr?=
 =?utf-8?B?bFVFT1dWVndlSDZId09mQjJMeFZ4dFRxTTh3am1idXdlN1ZKcjNuQUZFM1JI?=
 =?utf-8?B?MGp1eHFFN2tkRStQRUFzaVFVeDVtU095UkRVNk8yL05qU2htd0FBeEpqZ2Rz?=
 =?utf-8?B?UVh1MHVvM210Q1VkZWROWW80QTZYR041RTVXK0FFcVRkTTJKSy9vWmErUXUz?=
 =?utf-8?B?dXJIMkY3U3F4NVdPVjkwRjdOa2VNd1hoUE91NFkxNnlvL0s5TXJZdkFyY04x?=
 =?utf-8?B?ZEtVWWdERUhtYW1BMDU3ckJYaVJrSXJReDhEazJISjMyVTBkTSt4Y0k5a3p0?=
 =?utf-8?B?NDdxZHRrdWZMWlVpSmUzQXB1aHJ4SzNPQ1BKWVJZYWtlaEppSG5WSUFmbDhD?=
 =?utf-8?B?N0lBR0RzOTFnSVpXcktFMWtkRDExR3c4b0ZGakdTRVlZblBkQmZLWi9kMVFw?=
 =?utf-8?B?Ty9LcFJma2VidmY1ZjRTRXRZUFhJb3ZFOGg0WEExeVE2eWRjWjk1RmN6WGxV?=
 =?utf-8?B?MFFjd1F1ZnVWUnArdjZlNnJyRi9ESVlXcFBMUThXcHNlbUNvVm82SHdpYTYx?=
 =?utf-8?B?bFY3K3FPbDJBK24waU9kc2lxVndMOFU3d2l5eTgzbWx5a01vcmtYTy9hc0Rx?=
 =?utf-8?B?ZEJuNUM5ZXMrSFZCZHp3T2hpaHZvc1RVQmx0aVJkY1MrZHRpc2xXNXkzMDZt?=
 =?utf-8?B?S0lsUjJSR2dBOEVBREtsQkRjeld4R3ZRUEdDZWJxU2hNT2ZjL1cxb25LdU54?=
 =?utf-8?B?TXQ2QzBabVZGL2RZcW4yTnZCWmVLL1E4NFZvQUk3c3F0WnIyNk15d2RjQ1Mv?=
 =?utf-8?B?bWpZaEFsUFc1Yjc5TTloSkVuRjJjL3h6WGNEb0pIZk9nV2RvZVN3ZDdRNEgr?=
 =?utf-8?B?S1pFRGlSUWw3SnNQZjI4aHlNamNmaGhNeTRBeGo3cG5JWHYzVm50ZVVQSVdk?=
 =?utf-8?B?SUNxSVBWTjM4UWxwOGptSWN2cHQ5WVZIK3UwdFlNNlNHRlRYZGQrcDh3RVdm?=
 =?utf-8?B?UEZuT3U3V0dJVm4yVHRRaytVQVVWUnlMQVBFQUUyODZwYWp5b3JSWDRwM3cy?=
 =?utf-8?B?bDVkTE9zQzdUY0g0SVMyRW1YVmNxMmxQeHZnTVBWOGQ4SkxRa29PNmFXdy9o?=
 =?utf-8?B?YlFJV2ZKUTNNb01DMndQSThtTlMzV1VPbXJRd1FWTWluZEVmUTZldXFtMDE5?=
 =?utf-8?B?dzJPdk5HNmVGMTlEL1hHcUhmamFQcWp3MERZMVhSR09vTXU4QXlJK2p1UzFm?=
 =?utf-8?B?ZHMvdFprY0cyd2pWbGgvOUR3OVRjbEpCTzhIUlUxdWdvK09qaE0xNiswMkRs?=
 =?utf-8?B?UlNEa1laUm5PcThaN2taMTQ0MTJkS1N1MFVnbDRPTlM1V2hub2VoTFEyOWY5?=
 =?utf-8?B?MWkvZTI2N0ZIc1MyaHhNTnNndnpCbE9HcWttUFdGN1VKTVRFVnEwWE1sVHNG?=
 =?utf-8?B?SE9NbnhtdTNyeGl5V0JIMkUzbkYrc0VvNkw2eHBjWCtLd28xRzgwcU4rUkND?=
 =?utf-8?B?OUxTS09FRnRIcFZUTllDMS96TERpMU1QbW8wUExlUS81OFBCNE5OLzhFUllF?=
 =?utf-8?B?YTJmYkhrYk9pVWt0UkFXVnVNK1ZUS05mUVVvNEUrZkNMeHZGQm9ibU4rZGww?=
 =?utf-8?B?c2hzT3FUQkNsdUlaMytMb2ZLYmlHZmtyUVFudFlka3dVRU1nd3IxNlB6VENy?=
 =?utf-8?B?eDRRQ3BRcTMzalZNK1A2VUIvL2ZBK1dKUGNNWVByR01EWkNtVVV5ajlHbTR1?=
 =?utf-8?B?MDNtT3RMUmpPV0dpZlBZQks0b3RhamphWlF2R2g4RWM3SHprRmt1UDIreGVp?=
 =?utf-8?B?ME5JZEJaWnY5cEdUOEZUZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHd5VU1US2FCYWtMWTZkQ2w1a0k5b0NqcnVMZE9QTDVrSjlUazBUdVRPOEVX?=
 =?utf-8?B?UncwV3I0cUF1NGIxQ0g1OSs3NWhSd3d2c25yY1B5MUhQeGxWcUZOc2pXK3dl?=
 =?utf-8?B?M1lKMEZ0UkdYeDhOMkgzUnV5STh5dGVlaS85SUxMdnVGUGY2TFBjTFJjMzd0?=
 =?utf-8?B?Qm5QQmlsOXoyV3pqcmJyUFowVzJiSWNjMXRReE1jbU5rVDl5SWxMSnBiMmpY?=
 =?utf-8?B?cVhTeDVVLzY2WVl3akFKTEdTWGo0OEVxTWZXYjBTcW5heG12bzNBdVFKcWRD?=
 =?utf-8?B?emo4Uy9oSjd6b0prSXNXSWVqODdqamdlWmJ0eXhhaHA0ZW5Jd2dZRVphMFBU?=
 =?utf-8?B?RmUvaVpQZGRNZmFWNDM1a3E3R3hRSkppUzJ2YllkRTV4bVB2alZveUtCZ0M2?=
 =?utf-8?B?MEs2K1JiZW9SRkFqT1B5K3ZraTFYMXJ0OWoyN01CZE1QaUtMY0tyb2hFcmFM?=
 =?utf-8?B?L2ltZGxtaXprWkFFcitiamQ0WVFCcEtsVjhUV3BqVFhjSy9KU1NEVEZ0d2gw?=
 =?utf-8?B?WkdNMXNWNlR1UlpyS2ZVUGg4QjVZbG4rcCtoeUc2a0FVdHNrVDkxWGtBVmtj?=
 =?utf-8?B?L0Zyd05MWlM4czh5U3lsdkxWT0R0MmJrTWw5VEdWa2hVNWNoUjFNc1ptVzBL?=
 =?utf-8?B?c3RIZTI5YW5XYUQ2N21iVzlPT3F2cmpxR0xlQkYvQzUwUkxONGNjOEtlUkVJ?=
 =?utf-8?B?emlxbE0zNkE0bTZmUnkvV0VYa242akkvbkxPL3hqT1FyOVp3NTdQQVVCb05F?=
 =?utf-8?B?TDBPMTdVV2pQYy9zTXNFcVNXWXFVRStZZThuUTZ3clZWMm15N20yTWtQRzlI?=
 =?utf-8?B?a3JaWkdTNHZYQzVSVk9ReFZWaGNWenY2b0l2aGs5T05PdWhlZFRRRFVndnpD?=
 =?utf-8?B?blV5ZG1veHlGK1YvSHIzTlRna1RTbFQ2ZkVhS3NSa3h5SjRHekUxWGVFRmVp?=
 =?utf-8?B?UFhOMGV5dHFJeFNoTTJaa3haWE9pekFGdjUwV0xUcGMrREFTcWh1dlhEYVFZ?=
 =?utf-8?B?UW9RNnkxMXdwUVpieEpYMmF6ZVUyTkJvMHN1UHNxVHV5U2M5OEdSVG9PTDFk?=
 =?utf-8?B?RWxnTEd2Sjl4ZGlpS2I4Z0psQXBUSFZDWTZmeVJoVVFlTDZDay9PdE9iVjl2?=
 =?utf-8?B?MzVmTCs3aE83MDlqaGRndlg4UHovci8zNzFHRU5XRk9SZE1VV2VaSUVOTXVG?=
 =?utf-8?B?ckc4aE5WQlVqMzdianlERmUySjd5M1Y1bkJmTEtOQlJBVnQrM0tHTVJQaW9E?=
 =?utf-8?B?L3d3cmRFUHJMTm5xakZUYlJEZzdJeXpKOGsxZTR6UmFBZXZQVWhTVDRScW1V?=
 =?utf-8?B?RnBKamRrUjRIOGtZeWRWc1V1NDFzaENXWThCdC9IdEh4Yk8yZk5Ca1VscjV2?=
 =?utf-8?B?T2pFZzNQVk02cHIrSjBIbjl1STRiN3VveGoyMW9TRndKQmhLaU1YMk15N21k?=
 =?utf-8?B?ZHR3NWl6akxXVkpaTnIxZ21CcHVZOFdNSE5zZlptYXZjdEFKTjhRWHNIV29C?=
 =?utf-8?B?dEN2Q3NlOC9HYW9Fc1JDNG10VStGYnBDYld2dnpRVXZsWEorek1zY2FEQVd5?=
 =?utf-8?B?RG54bE1ENkN2TEpYUlBSamxtSE1rWGdvNU4zeS9zbEp0OVAvT3JWTDhVWWkz?=
 =?utf-8?B?bXJLUW9tcVFyNzhlYkttVWxSbW9YMVV1QmZ0WGlyYmVSSndpYWxDNDkwbWhh?=
 =?utf-8?B?eHVGdFJjSE4zTW9hN0hENXEzeEhmcVNxellNQXp3aHdtTExUZDRyY1dZaDhI?=
 =?utf-8?B?VjVoZ1hPMi9nUkZyNXlzSy9EMmpLNmdneVJSVllXb3gvZml1ZWZTNGVLYUdE?=
 =?utf-8?B?NmJWSzZnUDNpZ0YxeUFDeitiVlRFK1JKVFFId3gzUHd0Rk03REVZTWYvT082?=
 =?utf-8?B?SG8wVFM1Q21ZbEtJTitTTFBoRWtDUHRBVzNHVmpybTJLUkM1cDUyYVIzMnI4?=
 =?utf-8?B?U2RKRTltQThOay9GS2x2cGJob2NSeEIxSjJSTitpRUZUUk5nZnlBL2dEdmRT?=
 =?utf-8?B?MVNKQmJQQjdQbDFoZHlYRUNLcXhLZnYrazZxOVFvTjVVdWtyMWw0cytqZEpr?=
 =?utf-8?B?enJuWHhCN1ZhSVdMcG9MK21JY3dqQUFkL3MxR0VocWlnRENTWmR1Z0h5Rk5y?=
 =?utf-8?Q?jfL8WHb0czjM5DB0WOb7hqgp3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7QlOnhGSXITTBNuLDJ02HyCatxUtJN/PJrVuQL1C9OIEZiDWD/u5PeHoodozKTQRwnPpN3jBZyEJgZf6RDM3r62VPVRNb1uVgCrrunc0g5u1IukvDXFH1ZYqnlavSqehXAbyJp6z0QJhJiKRj+97CHVxJWymfw4tms5/WjPtFfr2f1k+HpvDbNUBKF3btgmnskhuMmVnjq3faDEtRkqfiprcXRhc2E1JUmR9A1eBioNNz5+Z+U2bl/Oxrv/4E4km3pwExnYYbI/+YgOCkj9Q6alR8hhaH90yPJejrArHk7SaLli7wbEhMeyn3OGx7SbojpzRQ134Y3U4IxR4hhy8j3//xYeK/JbyaBn81i0KRLiviUZ24qa3ft5tyD6OgybNn6hO2eQec1v9Mmwl6t3BoKlOFfTsrz2ApgI3QzVrI6jHFTyfe9P1+ZK1V5mQolPY5Tv33b9UaCfOsNSTF2CxpaHowtVkfYDLkuP8CkUtCKTjnx0aO4Qd0gblrhctXarRlH5duv7IswyrFL4kFNp1dXqy8YlMprDXZyLjrNw7L1aHFvtBukV2oRBTOiq7gogERcSleitgLIQSqi4R6UhKS3YcLzv5+bP+yruemkW5kF8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43629428-7339-4831-b0b8-08dcbcab1dd0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 21:50:30.6825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8udBc194MneQOmM2TMVZZpnlvbBq8eVnPpyYDKedO6OOvvuEheZGfCQDVG3ieACixobjH+EnwJmf4wR6CfOVtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5647
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_18,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=763
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408140151
X-Proofpoint-GUID: I_xhfQIt5E8SWtpGjbOiB5CqfJ4qMSym
X-Proofpoint-ORIG-GUID: I_xhfQIt5E8SWtpGjbOiB5CqfJ4qMSym

On 8/14/24 11:57, Kris Van Hees wrote:

> On Tue, Aug 13, 2024 at 10:59:25PM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> FIXME:  Is libdtrace/libdtrace.ver correctly updated?

Incidentally, what has to be done in this file?

> I think that keeping dtrace_aggregate_walk() as-is would be better, along with
> adding a function dtrace_aggregate_clear_one(dtp, aid) that performs the
> lookup from aid to dtrae_aggdata_t *agd, and then calls
> dt__aggregate_clear_one(agd, dtp) to do the actual clearing.  There is no need
> to go through a walker function when we already know we need to operate on
> just one aggregation.

I'm not convinced.

"Just one aggregation"?  Yes, just one aggid, but possibly many keys.  
To narrow down to which agd we want, we need to know the key -- and 
clear() doesn't give us the key, plus there will generally be more than 
one key anyhow.

Now, one can argue that in the current implementation and its current 
hash function, the aggid tells us at least which hash bucket to search.  
So we could write a special, reduced loop.  Maybe so, but that would be 
wed to this particular choice of hash function, and I'd argue the 
current choice is a bad one.  E.g., consider:

         tick-10 { @pc[uregs[R_PC]] = count() }
         syscall::write:entry { @writeentry = count() }

Lots of agd's will be sharing one bucket and another agd is sitting all 
by itself.  We ought to change the hash function, and then we'd have to 
undo the "search just one bucket" optimization.

PS  Here is an oddity:

     # /usr/sbin/dtrace -n 'BEGIN { @a[1] = count(); @a[2] = count(); 
clear(@a[1]); exit(0); }'
     dtrace: description 'BEGIN ' matched 1 probe
      CPU     ID                    FUNCTION:NAME
       34      1                           :BEGIN

             1                0
             2                0

You *can* specify the key in the clear()!  But dtrace ignores the key.  
Silently.  Same behavior in Solaris.
