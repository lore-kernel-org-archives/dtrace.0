Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7451618A952
	for <dtrace@lists.linux.dev>; Mon,  9 Sep 2024 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725912006; cv=fail; b=rwWVlKe4gNgUnnOo7JGx2BhYb9YSP5eKite5KGdDrIrWGkoWPvOO8okkCLZ/NcUipNiGDes2SaVuRr8gf1x+RIwzelleWxVu3Ds8oU/m049dsjFFySdZvKk0MpA/kvwGk9dEmJm6RT5Flot64v/ER+L2wtI5PtauzNxn84J4qe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725912006; c=relaxed/simple;
	bh=R+68biNREZDr1lQymqZo0kNHq8PrA5k/HZVk3HhcBkM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Js4+iaskNQqaJvsG3gg4Sgea2EK0zdZ1kQ0I4rUZG648H4l+XiZhccYPXtzhpEBPhaH5s8OY/JhSarzwpXZIGeIRGw+j5FSGKJQluCJKCMZRCN95PYmtRCCezHWbUeVwwAXWYPnC0IaU4g3Y882oXX0rJ11SD40XOmmslxgdxmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=drwuZojw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J/N+NTNL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="drwuZojw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J/N+NTNL"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489HBVrQ032568
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 20:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=mNyFGX5rCqyVB706uZixit2KHuMKYJ6gdX7KZtT7+PM=; b=
	drwuZojwAHqnmIsV5wvSFVvGk75EB0r5td46xWbtpsu6EVTnBtJboqch0gsFG7ef
	KmXbqC79uEI2UekoN8aN/lXEQaz+oAboqnNfFrJBoZGLvqWU28GWZrJy5q2BgUYB
	2yqlXT7ru/K9K+MCDsHbS9ZrqEGg1om2uv+tu9TNzZCb44ZTX2J7KL+xwzxNNKC1
	y1zVDpLoVoP3FKOVRpIvtySgQaNQC+MD+kEczvLJTvE3aFlSTobNf8slZ1Pvab33
	p9wu0lBOisy7EZ68wrrmCvkna/n4okWGWHZWPj9BD/yfHZdYZ1dAfld4kxeTYsdK
	rKvA6rfEyXQjW8pCMJYW5g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41geq9kvuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 20:00:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 489JA7xl004179
	for <dtrace@lists.linux.dev>; Mon, 9 Sep 2024 19:59:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd97nakw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Sep 2024 19:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzUs0zawQKfMq2wZvALxzo5NNUAFYTj+QwU2Wwm6oVDAD1j0byN6PM1+Cko2QnSDnEE3h8IGwzJ2Fp+Bk7t6TcLHgeCDdAMtmwkevxX+bBBDJLIbX/sJTnx3h5xwKjDZqtwYODinxBwYNTF4dra48ac6ky3mIC2sCrWOSceDwvqK+9ivYrgF6AdLg2De1egUebIxY1aifGjfuzbTCGJ2imcAEjcFigD3qWs+hDkoIur2UzkHohPRgp0w6yx0kfvWWFyLoehzdz28/P/xNe5GdYrjVTCDniYxhmVcdVqKk4QcSoHkNWogUk953MwOW6XQ7R2ltPSvKRfdiavkUNQ5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNyFGX5rCqyVB706uZixit2KHuMKYJ6gdX7KZtT7+PM=;
 b=HVctAg57+4lALZneN/1k97+CF+Dwzn16WlEM7yJ/Hp50D78rzAU9ZbfmNSdEo6tieKAb5vgBavH9mY5muX4rMH9WWULirTGyHhVnTU6gb7DZ8fQuJXbfwSJA0RrBgC4OJrIVBuzLZT7ypAHFBozkL0+TEL3D8YYhuemMqOe/SnXw31hFpTaFpaqB/0HTwO2ZL7PlzPd4bQFbHZ0GC+7Xp0JkZNqv5FlBfi7OITReVy5gp05J3s4IEbIzinricPiTpDmgZ7B9w+v04Pp0LwywkEWmr1QeTs9YiPU/1n/ID25b3eeU5NNmk5Ur/AOLBOT208Htp4Fa7f3dCHrdms+Uwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNyFGX5rCqyVB706uZixit2KHuMKYJ6gdX7KZtT7+PM=;
 b=J/N+NTNLo4GuFpkw/6hufPz7N9wb9Ap/tdqCP393tyekRJmW3KTAKjWr1aYa1K57+FDZv6pVK11saUYzwqVsaTMdauvnKOMRiL0NlBxlgRWSwLWGGomZLMNsFRZnp2fIqstKlLsrHcgSazQctS6TkAi1FqhqTROlkLCFsO+ygFk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB6466.namprd10.prod.outlook.com (2603:10b6:930:62::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Mon, 9 Sep
 2024 19:59:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Mon, 9 Sep 2024
 19:59:48 +0000
Message-ID: <18d62446-568a-1dce-8393-412b4778d8c7@oracle.com>
Date: Mon, 9 Sep 2024 15:59:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/19] Deprecate enabled probe ID (epid)
Content-Language: en-US
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20240903051643.17203-1-eugene.loh@oracle.com>
 <Ztp3paXrmBIuigSb@oracle.com>
 <536b6eb4-cde5-709d-d93f-1a442a0aa9d1@oracle.com>
 <Zt8w9uRKDrZVG1Ik@oracle.com>
 <ec91cc0a-eb07-d6c4-0ee7-bf74f1cd4b62@oracle.com>
 <Zt9IG5yxNCR8wSA3@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Zt9IG5yxNCR8wSA3@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: af7c3545-2083-4e5c-9f0b-08dcd109f5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1pOTVVzWEE5RllMRDZnWmc5K0NmRCtKbndmdkdNaWNKVjc3Q1JXU1E0d1FM?=
 =?utf-8?B?SGE1SjN2dEtTaU9aczNHZDFXczEvVWhPclc0d2s1MjE1UHJ4a0lsMGgvM1Fw?=
 =?utf-8?B?UzRiejdQOGM2NktwMm1lVzJxSDFTWVdVRFlYQ3ZPQ0NuOXhFQXoyVWpoV2M1?=
 =?utf-8?B?QkxFT2hieStHbW1HbGhLSVkzNTkyemxlRmVBdWltMFVrUi9QMUFrV20xa3Uz?=
 =?utf-8?B?dGFNMkVFL3d3OTFzSmgwTFRaUmRRMWVWVHVmVTJBMWIxbUdBWGRxRVlRU3I1?=
 =?utf-8?B?VlQ4UnpScTQ5K2NGcWwvYTk5SU9DbU9zYWZBeEFhcThSNWFhT0doa1dxSld0?=
 =?utf-8?B?V3RNcGpoT2kydzlkeDRBUWNqMUlsQmM2L0crQmE4OE0xNk44UytsMU9mSE9Z?=
 =?utf-8?B?TE11NktDUUtTc0lMSGVYeFZiajQ3ZFFvZUpGb2wwektNL3VxbDI0U2dFdFpF?=
 =?utf-8?B?NHExdDM1ekg5VFVSbERHbTJiUi8yMGl0dnRzb2FNSTdEWnVPSTJaemRiMDZM?=
 =?utf-8?B?dU5GRHhYTER0VnFuSFFnLzhGUlh5S1FUSlhwTm9KU0V1Ukh4Y2hNRmxVMXEw?=
 =?utf-8?B?VnNtMmxNOE9ScThYYWtCYnF3WFdEVytHd3hNM1dwWkVycWM4WG5GblcrQXov?=
 =?utf-8?B?WGRWOHFpZ1o3b05KN2dnQzJVKzBqMFhXMHZkb0o1ZnFRTFlWeFRydUh6ZWht?=
 =?utf-8?B?NGdQaGZaV1M3N1pxS0hzeGV1TWh2L2pwSWVBT3VianIzZkR6UEQ3YVhzVmV3?=
 =?utf-8?B?UWlUWFc0SytKU2luVDZOSU4xSmlXZmhLa2VKUDNWblRvb0g5eDdubm81TU1K?=
 =?utf-8?B?R2hDSHZUbnRIQ1FuWkIweWZOVjFnc1docnFCQjRXMTVkbkhYZnp1bzlkc09J?=
 =?utf-8?B?WXdoazlRVC9KSjh4K2IwS29nTkxweEg0YS9TTk1WRWhoNEpKb2lDNkpLSUtm?=
 =?utf-8?B?dUU0SmVsRHNFZW5MSG9URng4cktqdnpHTml4cGpzaXlzZEVvbW1zSmNzUHlF?=
 =?utf-8?B?dEFZVjU3YjRhSzU0MzdRSU9sZHFaOTFHdUtWd3hiM2RMZE91eVlnRy84MG5o?=
 =?utf-8?B?c0VicjBxQXJGY0cxbDB4U3ZMVXFQNzY2YzFCWUtBZmpJK0drQzFiNzJBUVJL?=
 =?utf-8?B?ZUR4ckxDMFA3bWQrNHA4ajBlV29MQmhqVitBRk5ZckE1SUh4L21LbldxRmEy?=
 =?utf-8?B?cWFKdUUyS1RLV2IwQkhFWmVBU0N0UzFHUmR5d1Z5ZVB4R3FrbWlEWG9iREhz?=
 =?utf-8?B?L1paQlMzbWdYd25EZjJoVzM3bVJ5QnVzbmNNRVFkemdIT0owYTJ1aXE3Njgr?=
 =?utf-8?B?dGhsM2xhRTBzYUdtb1plK0hpUVg4YmRCZytHN2FKTVRqSGtNbE5jaDJNRE0w?=
 =?utf-8?B?UytQSDBWTDhwdEVzZ0NCcmpBSFBiQkFJc3YzOEVoRHVYd3VNcGd4NDJXVHE3?=
 =?utf-8?B?ZXdoRHhhbkRTaXF5MGx6QTdvVkROQ0M2dzRHUUJMZC9PL3l5YkFjTThBdXpv?=
 =?utf-8?B?SGwzWXQ5OEJGTmN0anAxVXlEM2tQVS8rU0Q5Vm4zSnNPbnpLVHJnUkZyTHEx?=
 =?utf-8?B?SkRpYnFsOWYvR001anNXbHNhZXRCSUMzY3lUbW16Q1BXNnB0eUVjcEJPSTBZ?=
 =?utf-8?B?TDhNYm5XZ01Tc2dMbHBWNUxzelhGU3JFMzgySmJUdlR1QzlPeGtBemdkUmdk?=
 =?utf-8?B?OUJyTHc4UjhrYjJYa1lkQzlHNVpLRVBodG5LT3kxeFg4VU93eEZYbENWQW9D?=
 =?utf-8?B?dlZ5SGhZK1daSnRhNVE1dndRcVpoajFyZXViM3MxUmRyYzQ1RldmQ3R4ZTI1?=
 =?utf-8?B?V3VSeTg1QVJSTlZtMjY1QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHZEYXNNeGRmUW95UGU4b05KdTRaZXRuOXR4R3I0czkycUtvWlQxYnJxZ2pO?=
 =?utf-8?B?UWVYSWw3RjlBM2ExN25keUNYM3pUOU9xUktFOXJWbGkyMUltcllURUdGNHMx?=
 =?utf-8?B?NHhYRXU5eWVCelNIdEIxT1RaUUNSUDEzb1NSTFRRM1EzRUpobGtFaEV4cjV4?=
 =?utf-8?B?UEdGWkJHdEZ6UEJFNllUbnViei82RDhrdHlOUEIrYXArTVl6em1ZUW9tcERj?=
 =?utf-8?B?ZnR6L2JDb2ZUeGUxSWx4TnlrbHB0UExJSzZQdEEwQ1hjTnhDN1drYTk4ZUsy?=
 =?utf-8?B?ZlVzOVFraWdqcjZDYTJhMFA5YWl1eWdYRFAzcXVYZENDM1hQRFllMDRpMzhN?=
 =?utf-8?B?NURYdTBXdW5XOXRqWUtuU2RNTjVkd3ovczFVTkxuN3pnQkxyK3poYnVkTjNR?=
 =?utf-8?B?K2J5VE9FUmtWKytzYlBFeUVMUjY1cnZNKzJNMnpJVngyRmYwQ3hoQUprdXRx?=
 =?utf-8?B?VXVDT3lDUStCb0xoQlo5cmtDSkxTZ0ttdUNTdGJsc2dhd1VwaEc4WmxZNVMr?=
 =?utf-8?B?QUVSdCtjOFNoR3NKU0tyVEo2NEJGaWJEOWVuMTNPL2F5MGVPcnhqVXhsRHpI?=
 =?utf-8?B?UHRWZGpQTDhoMENXUlFXK0tJVitNU29tOGdEU1A2UGtxOW5vMHBqa0szSUZD?=
 =?utf-8?B?V2FYQlhnU2RVRTNaYlV3ZUxsYW82eHE5Y283MG5JZHR5eitXQngrSGsyb0M1?=
 =?utf-8?B?ejN5eStEcGlTYy90a3RUT1NrZHB0TUlEbjdhc2RhQnBkYlRBa01aM2E2Rm9D?=
 =?utf-8?B?dmx3d1NpdlE1U3lUVUQvQTByc2NSTTcrck95ejd6L1hSRjBCTVZYcDMrdHk5?=
 =?utf-8?B?bkZCT3oweUVSUU1jSG90ejkzQ0FpMGJFdFpxdFB3VVdCVlNLVEVRN3JVNnJ3?=
 =?utf-8?B?S29WUnk5UStsTVhjOFQxTVhkTm42THhWK09COEg1eUNOL0NpR1lETVp6ZjJ5?=
 =?utf-8?B?RjRaOS9jRDV5TVJ3RUJFbllDdXpLcjVTSWJxSU5Qc1F5ZDNuQ3JkZlBxcVo5?=
 =?utf-8?B?ejVoSEw5MU16dEQ1WkdoMXZ2bXlHVXI5T3ZKZmpUOHovMlN3ci9ZbGU2K3pu?=
 =?utf-8?B?M2o1YzYvYkp6cnF4TkIrOWZKSzk0cUtWRFRyR04vR1B5RDVVeEJIMnZGS3BC?=
 =?utf-8?B?U2dKMHdEMjJrWFkyUVhhamFBZGlNWlo2VkdXbm1zbmpnb0pIcGxSZHdOd1Fh?=
 =?utf-8?B?eXF0UmUzSmt3RVZ5T1NZNzN6WkZIR2NOeGdXdHRpbFlMK2N6eER6UHpPSEd3?=
 =?utf-8?B?RnZ1dGdXaW1ZeGFGYmxRT2poa3FTdmtBVmtnMDk1Um1UOUFiOCtXSHJnb3VS?=
 =?utf-8?B?WkdlTDNZMTgxN2hmQ3ZWV09ISTMrcVJwdGNhYSt1OEZYNFpzbmU2Mi9scDdx?=
 =?utf-8?B?cEt3QTJrQ1lLRU1MZG00c2xFdWE2ekRyWGh3eHBSRC9tUEY4QWZpbWhpQ2Fv?=
 =?utf-8?B?YWM5ajR6dVJ1aUlPNUtWZ3VlUDZiV01vNXEyczNGZUJzbE1Helc3VVFHU083?=
 =?utf-8?B?TjYwbEZjeGswZU00YnNuOWc4VFkvd01ubjV3Q1NkRlFvWUJqQnduWWhuOWI1?=
 =?utf-8?B?dEdUWFU3bVhiQ1hnRXRucGdyWU05V0pLZ2Y5WE9sNnV1eW0vRjFuVmdSRnA1?=
 =?utf-8?B?MTdSSGFqTGI1a3pYS3dGbjZ6NXhTOWxjV0I2U2NIUmxkNHViTnJZZWxNa0R4?=
 =?utf-8?B?dEthTzJoYTFKaVBZQzVGQ0wwUFplMk5PMFRJdXI0RlA4TVJiUG9peDc1UHg2?=
 =?utf-8?B?L1IvS1ZSQVZ4T1FQQzd6WjJMblhwa1poZDBjRXpMclRZNmZaVVVsQ254eFdh?=
 =?utf-8?B?T0tzS3o1YWRzM25oYUcyb2NZUkRQeERvanZJQ3huMHdBNVh2VElLYS9MS2cw?=
 =?utf-8?B?cWRuRGp5VXg3dk5MbDhCYzE4MG8vb1htUEJXak5vNnltdG1QYXlNRDdWYTJS?=
 =?utf-8?B?ZE9SNnAzU2xxd3dwSUxsSlgzUTV3dkN5UW0rQUhKZ2pxSWxGTk0zYU4zOVhX?=
 =?utf-8?B?TnZ5KzhyWmtEYUhWRTZXUkxQV3dtM3JZWUlsRDQ3cWF2SHlyL0lLOUZHbkVO?=
 =?utf-8?B?b2syR3RkcTY5YUt1aGdaV3lTZFpsVXBwT1NLNjZ0dWF0Q3BjRUxiV05NWC93?=
 =?utf-8?Q?oAfCkp8sW3dNZoTqorpFdjEIi?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EGok/9yf+ALahwwa6xbBHXV0PSEGWOlP0QLyEJkN7aHPH7NPC3AxUYzUXpR66TcIyZzsBu4j9lw47nn2yE5wjpHZoNPByMmx0h+o0PCZaHKSMb6lrqfknJYKJ/kUts12p9ZOjErWhbMkHIXrWlPPlQewro4JTrJWNim+bNJMx8OXUlkyJALX2KEAGUKN4Pd79a1I2UIHixSnYPy2FDcaUbvWyp3kxvkRWllXv7B+P8qqemOlhceWN6QAkXqTsGBv1GBgf3mhHk4FkKqVSGSqT9rkD6pmhAK3x1vi15jMPiPZWLSTCPppFiQFQCvK53tZ7k8kmbSFbqAICa3jMo6Q/9CzNQytTbgo0FG9dYITmTi1d5S3NLnkcn3vX9kPGqr4zMITiSpvcsZEGSS1hPhEJs0GQHDN2esaOGSoNE3btV9yi/lLxcUM5A0fs/ptcMUoe1cT9yWTwrqfG96MjUT2iHVBq/TjWc3BPYT4YNyhJYp1hpG1z7KVQaUCVO9vAaLc+C+qQrnfrvaODPoDUKj8so5unzIPpTKso7NVyKpAyVS8ZzoIwEpXJbbRTNOD79Z1TCn4Zx+rUsTWLyqjl/igp/7e4r/NQuY0FWybju+Eodk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af7c3545-2083-4e5c-9f0b-08dcd109f5c0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 19:59:48.9135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCf9HKPI0HM14AdqKQ7PWgttg5jDatWV/wCJ1dIWv1+1EYlz6Nz9IPHt4zinzL6z02EdCghtksP2M06AjW4G6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6466
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_10,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409090158
X-Proofpoint-ORIG-GUID: ASm2_pW0xksAvPTYj3adF4V3ZYHja3iE
X-Proofpoint-GUID: ASm2_pW0xksAvPTYj3adF4V3ZYHja3iE

On 9/9/24 15:10, Kris Van Hees wrote:

> On Mon, Sep 09, 2024 at 02:40:34PM -0400, Eugene Loh wrote:
>> On 9/9/24 13:31, Kris Van Hees wrote:
>>
>>> On Sun, Sep 08, 2024 at 12:31:12PM -0400, Eugene Loh wrote:
>>>> On 9/5/24 23:31, Kris Van Hees wrote:
>>>>> On Tue, Sep 03, 2024 at 01:16:43AM -0400, eugene.loh@oracle.com wrote:
>>>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>>> Deprecate the use of EPID:
>>>>>>
>>>>>> *)  So we rearrange as follows:
>>>>>>
>>>>>>                old                        new
>>>>>>
>>>>>>             0: pad (size)                 pad (size) <= buffer start
>>>>>>             4: pad (additional)           specid
>>>>>>             8: epid <= buffer start       prid
>>>>>>            12: specid                     stid
>>>>>>            16: data[n]                    data[n]
>>>>>>
>>>>>>        So now, we say there is no longer an 8-byte pad before the
>>>>>>        buffer start;  rather, the buffer starts with a 4-byte pad.
>>>>> I am not sure whether this layout comparison is comprehensible to anyone not
>>>>> familiar with this code.
>>>> Yeah.  Incidentally, I had moved specid so that prid/stid were in the same
>>>> 8-byte block so that someone could read it as a single 8-byte EPID if they
>>>> wanted to.  I'm assuming you see no value in that.  So I moved specid back
>>>> to where it used to be and I think this simplifies the description of what's
>>>> going on.  Anyhow, I revised this explanation.  Hopefully it's sufficient
>>>> now.
>>> I like the specid first actually :)  Since it reflects the designation of the
>>> data.
>> The most recent version of the patch has prid, stid, specid.  Is that fine,
>> or do you want another version that reorders these things?  It seems to me
>> that at some point we should converge on some version of this stuff and
>> worry less about second-order considerations of things that do not impact
>> the user.  Anyhow, I can make the change.  Just tell me in what order you
>> want these things or whether the most recent version is fine.
> I was just wondering why you changed the order again, since that wasn't part
> of the review feedback.  It just seemed odd, because the moving of specid to
> the beginning of the buffer actually made total sense, so reversing it seemed
> odd.
>
> I agree 100% on the need to converge, which is why such a change seemed rather
> unusual to me.

Fair enough.

FWIW, it seemed to me that returning specid to its original offset was a 
simpler way of getting to "consistent order" (between comments, layout, 
and cg).  And, again, the only reason (in my mind) for having moved 
specid in the first place was so that prid/stid could coexist in the 
same 8-byte (aligned) spot, which is no longer important.  To me, there 
was no special reason to have specid first.

Anyhow, what's the next step?  Shall I revise the patch for specid, 
prid, stid ordering?

>>>>>> diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
>>>>>> @@ -1,16 +1,16 @@
>>>>>>     -- @@stderr --
>>>>>> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>>>> +dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>>> Perhaps it would be more efficient to update runtest.sh to support both the
>>>>> old and the new error reporting output, and changing both into a single unified
>>>>> form that substitutes changeable elements.
>>>> I don't get this.  First, there is no reason to support the old output...
>>>> that would be a rather remarkable historical vestige to keep in the code
>>>> base.  Second, it seems simpler and more stringent just to compare to a
>>>> results file in some simple, straightforward way.  You say "perhaps" so I
>>>> just left it as is.
>>> I was more thinking about making the output we compare less dependent on how
>>> things are phrased so that we do not have to update .r files whenever there is
>>> a change in how we output the data.  Except for a test or two that verify the
>>> exact phrasing we expect.
>> Okay, but again it seems to me that there are multiple acceptable ways of
>> doing these things, each way with its own pros and cons. So, do you want
>> another version of this patch with the requested behavior, or can we move
>> forward with the patch as it was most recently posted?  There are other ways
>> in which the format of DTrace output could be converted to some "canonical"
>> form before checking; do we want to embark on such a project now, or first
>> get USDT functionality out the door to users?  I vote for worrying less
>> about some of this "under the hood" fine tuning (that doesn't even have
>> unequivocal right/wrong) and more about delivering features to users.
>>
>> Anyhow, let me know.  I can make the requested change, but am nervous that
>> we're churning on issues that do not benefit users.
> We are not.  But I would be remiss if I didn't mention areas where we can
> improve things, especially if it would result in less extensive patches for
> things that in the end do not really matter much in terms of what is being
> tested.
>
> As you pointed out, I phrased it originally as 'Perhaps' - this is certainly
> not a make-or-break part of the patch.  Then again, I had also suggested
> leaving the changing of the error output as a post-epid-deprecation thing.
>
> One way or another, we should have an action item for this so changes to the
> error output do not cause such extensive patches.

Okay, so where are we on this one?  I confess I don't really understand 
what, specifically, you are suggesting for runtest.sh. E.g., would we 
check the specific dt_clause_n ID?  (The "n" value.) What canonical form 
are you suggesting for the output?

>>>>> E.g.
>>>>> dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>>>
>>>>> and
>>>>>
>>>>> dtrace: error in dt_clause_0 for probe ID 1 (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>>>
>>>>> could both be rewritten using pattern amtching and substitutions to be:
>>>>>
>>>>> dtrace: error for probe (dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
>>>>>
>>>>> and tests that are supposed to exercise specific aspects of the error message
>>>>> or that depend on specific details could test that explicitly?
