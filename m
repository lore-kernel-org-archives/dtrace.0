Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6853918595F
	for <dtrace@lists.linux.dev>; Thu,  9 Jan 2025 21:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736456452; cv=fail; b=qj/ZaawtFccRdosnQjjPjqv/v/VM2GPlWu66glly5ti0k5uWzAKT/6qSKTjGraAct/35XsS59ISHHXyWmXPBcnxCJ11fdIuukjDCqfGFcmf90AAsXofUaiQz2ccEF9yyAJ5K/bbzl6kUGyLcUV4mi4yUK5g145Rgq4La5obACDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736456452; c=relaxed/simple;
	bh=oONNLp+E+rjiUHdNPjOPx9jPgezOpz7cyq7pGYhEZ5g=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hfquj+eJczcHGKU1Bjz2/1Bb56h+2+nJ/bAoPFzx4VTWN1lqu0EhUIQ5MXGTzZlJn3UvnX+FQk21Sp3jcmmTrfiwZo4H5tQmllQs8iqH/aU+nm1U8NjSwMcUobPgs7VIDf1Q9FWOYMneT7TzXZGCArMEI5kb4ODanCBo75oq8PM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U30L4Ijg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aFeijTb9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U30L4Ijg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aFeijTb9"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509GXq4O005349
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 21:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9hN8nbmOcoFOj9igM1DFXNjldvE0nyEjLZ+zbAqPC0M=; b=
	U30L4IjgjigrIahYhrK6Ndg3B/dZUoZ80rSKE7rXfUy8/wdSNGM1wEEUd3ipTh4H
	E+Q+BdD4QPsZV89Iy9cAkTQlS6YlFcc6CiTTsjv021o9H9WfBPkaZxFXCfuI5h8d
	sqOmY1gy7CZzJ9STaAbKZn/42o/uPZTVguyDAnRY1Syyw6S9qECQI5n/ti1GT5d/
	tOEch/E6wVU3xlEIuq3xMrw79SB99ON/o3iEsVyZowHAi+Kq3Kt7gQuUTRpdTvdh
	87gRUY2q1vFvGlM6w+coYihz1BG3L7W+s2RzbQXvghnc9m4WmB/Dv/DD7ejinSHz
	o3vDDymXmlM3CHfJaDOq/Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xudca0mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 21:00:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 509JGJ9H010284
	for <dtrace@lists.linux.dev>; Thu, 9 Jan 2025 21:00:48 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebexvx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Jan 2025 21:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRzpR5ziAbfNOS/TM1pB97w1JmeUEe/WqL1Lau30MG6UTowlYy6OvGYZFkndBY2UI79VuB1I84EY618SAVE1oFj2UjL7pb/N6Lf5M8cJy96VGyUhO1XWcrfdCjIusfzThY8r04yeyPSJeFG2pP2LxPk+2V5ssNX57L9UWuDOtPKemicK2ohhF+CNmlRTfc6EJ1KnPb7MDW59mp1x+9HwVqHHUr1eKY9aaB9NCzK/XJdABP/EXiIc9S0QsPy12K/hbcfHYZ3kADmND9lrszRPHfp8cpoVp83YRVwKvve6thAk4CINoKWAGYPs5apphkKR/ObElIWOVKCSfzcZSxOomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hN8nbmOcoFOj9igM1DFXNjldvE0nyEjLZ+zbAqPC0M=;
 b=KBdzH4UbPHK6Kqds6PfZ/4cPj3zKBRkT5BOu0Vm27wx51Nj8ekiWJFGJS2QysTaIZHyu0F/Jz3kI+1W26jLHor2NpyEI2S3dUxrfbVKTnRCeRoNZXA6xVh509EwgQYPL2tIXNpvqnxdYV4T2EU6zjN91NSdiVLVT5J2imIczm2NDGliV27w0iHb1CQYUB9nIAsL4rb3/3RR8BZPmhC86giVBLk+o0ShAx/eWzX8/Dt7AmCGs8g4J3iULE9entUEya2N6bF74ys6ftB1x0TkX5FvmW5shMcdOYn759jKG2FncyTGUPU7edEDP9DDDlAADQxAuXTXDFZ9xNbe/TMkX9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hN8nbmOcoFOj9igM1DFXNjldvE0nyEjLZ+zbAqPC0M=;
 b=aFeijTb9VPPTr3CJ1KAkUZ49J3d0R4TZZiMBdjYdAgc1LxBBfEc0G8+2wgE3meWlYWZS1wfh2qYWYGYsJ+kB2keFMYOUOA9FovpxHzZvFeZpx+dd84IMTvbe7WPv/iAFhzxEZzoyGqHF4uEeOJV7MFD0Owb4Q7Nc+QqT4/fZuMg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7240.namprd10.prod.outlook.com (2603:10b6:208:3f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 21:00:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8335.012; Thu, 9 Jan 2025
 21:00:44 +0000
Message-ID: <17bc480b-3785-7b7e-9df9-601d65038df8@oracle.com>
Date: Thu, 9 Jan 2025 16:00:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 6/6] Add support for pid function "-" with
 absolute offset
Content-Language: en-US
From: Eugene Loh <eugene.loh@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-6-eugene.loh@oracle.com> <Z4Afgp96zlq1g5Jf@oracle.com>
 <68af528d-8dbd-f081-835a-d92b42e3045e@oracle.com>
In-Reply-To: <68af528d-8dbd-f081-835a-d92b42e3045e@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ad5151-dbde-46c6-5d28-08dd30f0af05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2FHeGY2Mzl5a1hlRU5uZzgvczh3bUFtaC9lWm5aZndQYXBvU0MyWEptbUxx?=
 =?utf-8?B?UnJaUk1JWkV0RXIrMHVZaER6U0V1c3VpR0RtamtXbU5wWEdkNlZWeTZIVzIr?=
 =?utf-8?B?UnJqNzBQUDcwT3JZci9sODIwZkk1bE5za0d6bzJkelNsSlcyZ1FRNnhvUjBV?=
 =?utf-8?B?eHZsUWJ0ek50eVdabmxCNlpvYnBSSjY4TFdaSERDYmhWdnRpcmlqeG0zYURw?=
 =?utf-8?B?NmxuSmxxTDI4WVNqbndsbk9BaXczU0N6LzYyS3NOS1FrWnpILzFyWnhEQlJ6?=
 =?utf-8?B?UzM4V1M4dnFTMkFubDR3S2FTbEpkOXNnTnY3UGdNdEpCQU00SEVMYjUxU2F0?=
 =?utf-8?B?TlBWT3pzUk9rcFVaM1prY2NZSjBBNTZ4SzJNWHlJSTVoZjVYVFVVTFZEU0h0?=
 =?utf-8?B?MldwUFFoZjczdHlKTWpXYXA3Y2pDWTg2R245eFJXTTJvd2d6TkM1V0M4V053?=
 =?utf-8?B?Y2NNc0g2M1dzMm12OGlBdkM5TDJzRXNGUkoxWk1zanQwRUZxTUV4NGRabktW?=
 =?utf-8?B?c1hQMWtONlU2V3JVZ3FhL043alhTWlhwcUhNdEVXdkV6dWFaS3h4ZkRRbVUv?=
 =?utf-8?B?WDdOdWtqWUZkeFFEaGpheGZ2cnFUbk8xaWRBQzgzaXZ0Nk9wcVUzdko3SEZS?=
 =?utf-8?B?UEl5SWFFcVJESlVDM0FURkRNWkp0Sk9zNWh3cHJNK3Z5VzQ3K29abE1UMFdK?=
 =?utf-8?B?ME9yT3NYczZqYThMQzNKWkpVanE1ajdlYmhaQW45NEJQaEpOTkJzeHNZblVl?=
 =?utf-8?B?U0NGdWNLZ1FIM0V1eStoeFV0NnE2S1ViMlhtTHBjbzhFRWlrR05ad2ZkZmlp?=
 =?utf-8?B?b3NTcGVGRDlDYWtObXBLd01QczJxUFArb3ZpV0RwejRaOHY3L1kvRnlBRnFo?=
 =?utf-8?B?czZYWFcxa3R1Y2NFL0NCZFJ4aEZ4eXBjY1M1THhjZUlFQjAvQzYvdEROYkVC?=
 =?utf-8?B?V1J5Wkh1Z1JZUEJkN0tCQzUvTkFjams1bGdBNjFyVlJIbjFNMmJCSkVtSjhz?=
 =?utf-8?B?ZjdrdzBRWE1aQkZGVkFXR3VDOU03SWJQbHowYmFBTlppZVVUS0dPSUQ4K1RD?=
 =?utf-8?B?aFpOMjdydVZWQk50M0tZZmtuTDBWTXVtSUhrMnNlQktZRk1oY00rSDhWUjRt?=
 =?utf-8?B?RVZJQUtRM2FnTHZCUkszbTErNVRIOHROZnZRZ0RCZDhob2hRemZaeXZxb3lo?=
 =?utf-8?B?MTNKMS93WWg1VTBYUTB5cUxmUGJ4YzNkbWE5bWp4MjZSOEhvUWdKaGI2cmEr?=
 =?utf-8?B?bm9OZGZaWldXcng5VlBTN0J0QVpBb1AybzdCL0lPcDQ0TW9xWmpOKzA3RVZQ?=
 =?utf-8?B?RC9BZk1USTFVUkEra1pFSVVJRE5EeERCbk5FTUFjT1Z0K2ZjQzN1bmU1T25p?=
 =?utf-8?B?akxYOXg4TXpvVXd5engvakMyQW5HS3F5TGNlSldBdHRweGlaRGdRL0VVaVY0?=
 =?utf-8?B?aGdPeXd1aGRUSko2NXc5OExHTE5ESHJNenZjL01CNGJRd1hyN3p5RXo4M3Rh?=
 =?utf-8?B?eDlpWVdXTi90clBnUElaN1V3ZS91QzVmOGt0MUVHekxxSnZla3RwclM2OE9P?=
 =?utf-8?B?WUJZdGUrb1p3dWJ5Q1J5NVBlN0J0eVQ0TEZwKzVENDlIa2pCSDh4d3RUMmRj?=
 =?utf-8?B?N0xsempkTStzdDN5MXZ1aFNGd3VDZmZuTUdqZWpvVGhQVzN1c2YvWFE0Ty9H?=
 =?utf-8?B?czZmcnNrY2NhUUpqd3p1TnVmcGthZi9UN2xHeDc0bC9uYW9YaUVjeXI1dVEr?=
 =?utf-8?B?MTJ2YmN6V2J3WjRaOVQrK05MRmZXTHVpd3htNzJ1dzZMZkl3YlVHK0lWOW1Z?=
 =?utf-8?B?NkdSSmw4QWV6SDNKOUllWUNLbWdpS0F5RC9MUDlKaEdCMmFBV2RaNk9SanBm?=
 =?utf-8?Q?/mjh+n/yMdL6a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVY0cUhVWnA4WEtGakdHYnNDN24xbW5CZE9BUUFzV1FDZWNEazBPR1pmT0dW?=
 =?utf-8?B?V2FVeCt6UnlFcVloUlFtd1lTTFNGdWE3aWdUVWVSUWhSQnZXbGlOMWRPU1Zh?=
 =?utf-8?B?cFZDL2ozN1piZysrRE93djN1UVMvQ1U4bjM3WWJ0Z3FNWXRLMkcxd2ozaXoy?=
 =?utf-8?B?SmdiS3VnTmdwUVdROHZFZFhjblRHMlZYeXl4aE1CUklzZUtkMWpHRXZoQ0Z1?=
 =?utf-8?B?eStLYVNPZ2VvemUrcHFIU3llUlhiNHcxdUtuYm1XRjdLWHVCVkpXWHRnZkZn?=
 =?utf-8?B?VnZnaDhubTNVMzJIbjZKaXRRRC9zTTh2cXRSRUlDRHdydGVCRUwwRExyVzhm?=
 =?utf-8?B?Q1RVOEU4SHM5RjN4QUZWY1Y2dldGQUNwc0J2MEQwV3NiWVZjWEJRVlVtRFJl?=
 =?utf-8?B?RThLaDFZUVgxTDFJWThzLzZNdzdYOXpzM0cyTHhVcWxTaE8yY1BmcnhLK0Jw?=
 =?utf-8?B?WE13NXNxRG9iUCt3MDJVTFJMNXBSL3J0K2Z5Z1RTbEY4aTRsOWVnTHBjNlhD?=
 =?utf-8?B?RVg4QmpWelNpUXZSNy9oZFQyRWlVL1VtWWpaajBYVVVtdk1QVHliZktaRWxP?=
 =?utf-8?B?QW9LUk9nZnUva0JYbTRPb2VZM251K2d6R3FwMUcvcTBWa0hlcjN5OGI4am9t?=
 =?utf-8?B?YU5mejRJMWFUVXI0NW10V3lhaW00QXBzTlpJM3pqMFh2ekx1U1VSbEZYbXcz?=
 =?utf-8?B?UzNZSmRvL3o0SnphdWpKWm92cldiZzNMeWJ3SXZhY0tNNlNxR2JLOWZ2eXFK?=
 =?utf-8?B?d0Z5VDF5Ykl2ZlpsdnZ5ZFdQdDMrYU1adFc2aEJIU2VSWWNhZVNaSWg3SVFr?=
 =?utf-8?B?Y2N1TzZROWV5OTdYVlR0WlZRd2phblNKYmgySzdkZjU0Tzd6M0VOejJlM2dN?=
 =?utf-8?B?QjNQd2JkaWdJVGVBZmU5NTdFeXNDeXNNVGNyUG4wMEhNOEVlUEkyRHhJdWxS?=
 =?utf-8?B?SGxYMHNRRGxTUkVoQk1sZzVzUWtIS1JSbVVlY3hRSGxTMHZCbmd6NklVNDFz?=
 =?utf-8?B?dEgrZnNBYmU0cHR5TDV6Ny9WcFFONktaQ1FFcjdTVzhIN1JNcmI5WXBkNllZ?=
 =?utf-8?B?d3JFOTFKNjkzZmgwcStJUDhaTWhqc25GWEdDMU9PbElHSUM4dmlnbUdTWUZV?=
 =?utf-8?B?SXFHK1BSN1RyZEVSREVFazl3Y2FSZ29SVEFpdHNtbnJvSzQ0WHNlM2tqWFZ3?=
 =?utf-8?B?RlhOelJ5UEZPaFE5VDVTMkpWRStsa0dQRjAxRUY2Q29BOEthWWtINXh4eUQx?=
 =?utf-8?B?eGU4ZkhUOERZSEpLUlVqcjFBZjFYaVdTdUdjeVFHS2l0RzBDaE1Sd0greHo3?=
 =?utf-8?B?eVFBZlNIZWpiVFIxS0MweDRnM1FsM0dhZ2RUYlhqdzVIM2JCRS9FZkJPMi90?=
 =?utf-8?B?S2J6Q2dmamlwRUUyS0FER3FxRVpWYjZ0RGwyVTlGdWRaWGFVeTRmeWhXQktP?=
 =?utf-8?B?R1ZkMyttRFE1VkFwdnAwTUdSUG5ybFhqZUQ1M0RSd2tWNmNyVTNZNVZ6UFdC?=
 =?utf-8?B?c2d2LzZVcTRaMWFEakJCTHFjMG5wbDd5WEFKMXdiSmpVTDMwZWtzb2xwVzBW?=
 =?utf-8?B?QWR3NHUxOUpoTzhlNE0xM3RsZ2tHditsOTg4eDdkbjZ6UlliMUNSZkE5TWs3?=
 =?utf-8?B?Rk4zU2xndVU2MDB0WVhNajROTnNwdEI1SG1WSzcvSENnOU10MnJnVWxxZFV5?=
 =?utf-8?B?TzhLTVUzdkUxNVpSSnFOSzhzWXF3M05KNDBvUFRoRGo3bGhGdmt5Vm1seEJ6?=
 =?utf-8?B?RkRLR2o5Z0tmM0lSeWlrU21iZVgrcDFuQVZPZVgwQ3VOWFJ6SG43dFVpU2Jn?=
 =?utf-8?B?Ynp4K0FwNVB0STN5SjNjODlBd2Q0ajBaRklYYzkvbjhiTSt6dEtaZ1ZWd0hP?=
 =?utf-8?B?aEs3eUJPWHc0MVVtYUQrUVFqSXBwQVBVbGlFblpkZVBKakZ1SHhuZS9wbFBT?=
 =?utf-8?B?NFhxYThqclpuaWpPNkgwVWlCV3ZVZFV3VHBaeXI4MXpMT0NNSGdkUkFsN2RH?=
 =?utf-8?B?bHRobGpPZTNBUzdxYnE0dnA2YzhqaEhGOTNhYUhVWWJmWHh6cmVPeEI2N3F1?=
 =?utf-8?B?c05RV043WWdqNWkyOW8weTlaSDgwbERDNTNRdlIxcUJ1WElTOFdscUlGSXBI?=
 =?utf-8?Q?TfeFtxDJIyk7CURbj2t4Pd9RW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+XqO2Uk5TRnZk5dsPcyF4lgPxt6M6aNpfVFq52AP0YBk2nPXJvOj1eZ6kNjOw2CCk7KCEiA6mN8PzLikxI+ltrAom3N0TNsRRaJECePtZx6VSBMoxeboi1L/IZR3XxT37oxwi/QwtD2eG6rmn2WDBhWme4/HynJi1UXYbzC7nSW74O7Xf2BtD+8qbF1EyMcz1vnWtH3cg/4y4pfYzctJn2ghhqj4gq/6xbwyWGgkKZnA3cTfaUWVDajHW6sWJDDGmo60em+OfDQY0pqj8FWlwzbLDrNdPiTAv5w5xQGD/yoZtN+zGZj+6xdUwV0GLVrsaFXxt0oFso+FD6Trc0oVFbz4WrmnRqTEs7rxfcnCrtMz1jil2REDovgAMFPqD9Nm50L6iPI7U45yxlKIouQh6rxuhWOoQscgCCaicK6NJl2ZxVbVHg4csmhGDHCJgq6ODPhJpn2gh9Mi+jKDV98d9/wAcBs4djN8B9SHzP3wzqCkmJaohVkYQxtpPu9pV6s0NeR/8BoNIgtUPILPB52z73ErKGdiiLummWuP80G1zPyv1F0zvrsBOh7ka3GP9lk13eO88IPII2gazLOx7/AA+QCb6AwHR87fhSuMMMeeyh0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ad5151-dbde-46c6-5d28-08dd30f0af05
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 21:00:44.4530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiUgDorLVCJCASiJ5fu78knCt8p38/57hARAgDBJU9OV9kT8hUFOL/woIFjZsIiGBnouW0SPEMVjWe6IcP6YBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7240
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_09,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501090166
X-Proofpoint-ORIG-GUID: j_XtwdTE4L-WeSl95jUIKWiGO9ieSVod
X-Proofpoint-GUID: j_XtwdTE4L-WeSl95jUIKWiGO9ieSVod

On 1/9/25 15:52, Eugene Loh wrote:

> On 1/9/25 14:12, Kris Van Hees wrote:
>
>> On Fri, Dec 20, 2024 at 05:27:16PM -0500, eugene.loh--- via 
>> DTrace-devel wrote:
>>> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
>>> @@ -47,6 +47,7 @@ typedef struct pid_probespec {
>>>       /*
>>>        * Fields below this point do not apply to underlying probes.
>>>        */
>>> +    int pps_absoff;                /* use "-" for overlying probe 
>>> function */
>> Why use this?  All you do with it is record that func is "-", and 
>> then later
>> in the pid provider, you actually use that to force the function name 
>> in the
>> probe description to be "-".  But that function name in the probe 
>> desc is (in
>> the pid provider) already coming from pps_fun, and the code was already
>> assigning func to pps_fun, so it would be "-" anyway.  So the 
>> pps_absoff seems
>> to serve no purpose, and you could just rely on pps_fun being "-" 
>> when needed.
>
> Yeah, good point.  Let me see if I can remember/understand/explain 
> what's going on here.
>
> In essence, the problem is we have to pass two function names: "-" 
> (for the overlying probe) and the actual function name (for the 
> underlying probe);  up until now, they were both the same.  I tossed 
> around different ideas for this.  E.g., pass two function names in. 
> Or, get the actual function name inside dt_prov_uprobe. It seemed to 
> make most sense (given the alternatives) to pass in the actual 
> function name and add this flag to say when the overlying probe's 
> function name should be "-".  Does that make sense?
>
> Note that pps_fun is not "-".  Although we set it to func ("-"), the 
> code that processes this case then fills pps_fun in with the actual 
> function name.  Again, one option is not to do this until 
> dt_prov_uprobe.c, but that introduces some other hassles.

Hmm.  Having said all that, maybe another (better?!) way of solving this 
problem is to add another probe type to pid_probetype_t.  Maybe 
DTPPT_ABSOFFSETS.  After all, we already have this problem of a 
"special" name for the overlying probe while requiring the "real" name 
for the underlying probe:  we have that problem for probe names.  There, 
we solve the problem by checking the pid_probetype_t.  So maybe that 
same approach should be used here, for probe function.

Let me know.  If you agree/prefer, I can revise the patch.

>
>>>       pid_t pps_pid;                /* task PID */
>>>       uint64_t pps_nameoff;            /* offset to use for name */
>>>   } pid_probespec_t;
>>> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
>>> @@ -182,8 +181,50 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const 
>>> GElf_Sym *symp, const char *func)
>>>       psp->pps_fun = (char *) func;
>>>       psp->pps_nameoff = 0;
>>>       psp->pps_off = symp->st_value - pp->dpp_vaddr;
>>> +    psp->pps_absoff = 0;
>>>   -    if (!isdash && gmatch("return", pp->dpp_name)) {
>>> +    /*
>>> +     * The special function "-" means the probe name is an absolute
>>> +     * virtual address.
>>> +     */
>>> +    if (strcmp("-", func) == 0) {
>>> +        char *end;
>>> +        GElf_Sym sym;
>>> +
>>> +        off = strtoull(pp->dpp_name, &end, 16);
>>> +
>>> +        psp->pps_absoff = 1;
>>> +        psp->pps_nameoff = off;
>>> +
>>> +        if (dt_Plookup_by_addr(dtp, pid, off, (const char 
>>> **)&psp->pps_fun, &sym)) {
>>> +            rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
>>> +                 "failed to lookup 0x%lx in module '%s'", off, 
>>> pp->dpp_mod);
>>> +            if (psp->pps_fun != func && psp->pps_fun != NULL)
>>> +                free(psp->pps_fun);
>>> +            goto out;
>>> +        }
>>> +
>>> +        psp->pps_prb = (char*)pp->dpp_name;  // make sure 
>>> dt_prov_uprobe uses it
>>> +        psp->pps_off = off - sym.st_value;   // make sure 
>>> dt_prov_uprobe uses it // dump this
>>> +        psp->pps_off = off - pp->dpp_vaddr;  // make sure 
>>> dt_prov_uprobe uses it
>>> +
>>> +        if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, 
>>> DTPPT_OFFSETS) < 0)
>>> +            rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
>>> +                "failed to create probes at '%s+0x%llx': %s",
>>> +                func, (unsigned long long)off, dtrace_errmsg(dtp, 
>>> dtrace_errno(dtp)));
>>> +        else
>>> +            pp->dpp_nmatches++;
>>> +        free(psp->pps_fun);
>>> +        goto out;
>>> +    }
>>> +
>>> +    if (gmatch("return", pp->dpp_name)) {
>>>           if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, 
>>> DTPPT_RETURN) < 0) {
>>>               rc = dt_pid_error(
>>>                   dtp, pcb, dpr, D_PROC_CREATEFAIL,
>>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
>>> index acf1c914f..ae4b262ac 100644
>>> --- a/libdtrace/dt_prov_uprobe.c
>>> +++ b/libdtrace/dt_prov_uprobe.c
>>> @@ -735,7 +735,7 @@ static int provide_probe(dtrace_hdl_t *dtp, 
>>> const pid_probespec_t *psp,
>>>       pd.id = DTRACE_IDNONE;
>>>       pd.prv = prv;
>>>       pd.mod = psp->pps_mod;
>>> -    pd.fun = psp->pps_fun;
>>> +    pd.fun = psp->pps_absoff ? "-" : psp->pps_fun;
>>>       pd.prb = prb;
>>>         /* Get (or create) the provider for the PID of the probe. */
