Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3067213236
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742324401; cv=fail; b=UlOL2mwoUCIBgOljjCp1P5n3bboEl/i/cOL/LuI323wWv0LwfTTcCnlEf8SbibKx5prgRpve1sivVO57+2913RzKeEhDfnjjiL7wZf+S/jRpbJ0/9f9BaHGMXQbsfLfizK8m+5qwe1tRSEigyn4lT622FNs5K5WvsQiwOoEA7Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742324401; c=relaxed/simple;
	bh=A+vZpFD/TadIGX60XilqQYUqgwSdpBPaey3+bAQ6ruw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aR7Onkbf15Ytjz/saV4/zmPUN+/Gl0R8ajlJk3X36GyR1kS86bU7Fxuaq/AnfRtGTSAMoBGTN5IPQWMOpFBX5QUKQXuHDvchQqfqUKYLIrXMoVmSkrF+AvUk+WetXHKNOLsr8jhqEvDZNNnVZj+GUwFEUEdlE034juCroP37ZNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iLpyodwT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WtuY7Rtb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iLpyodwT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WtuY7Rtb"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IItlqn016305
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=kSNrQ6V00XdD2b9uX3OoPKwluQKl3L5l9u+u5tHz5nk=; b=
	iLpyodwTN8OAqmao6qbfSnv/K2cIPgcRiW/qarY4hCkhr9c6u/T4ohNeLaXp39EU
	eUOgx3X1gQISk7213wPxCg7T2463+5jdhIYgFbD4m365IGLrvDOeV/pLE1/xfme+
	MlFD2YhngpyLPUwH+tN6OzdafI0z7mDvd+UJ5Ui9AiLHTo3U0WVA7HfAn/uIgk1j
	+3njKqXEB6YGvkhNjvX6iA5ky5UVa6PexejsygUUQQ2sBEiFrxKHZXj/NsLHcv+m
	KklWzlJqJvpBkRONL5/4cX2+3B+9Yytojnjt7iSmVTZswFdJqhkPo0iA4DRJ+Qdh
	5lpl6Lz2QCJS9tcg4sWUMQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kb6084-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:59:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52II0fdg022346
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:59:53 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxefspmk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Mar 2025 18:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+hig0122wdoPcoWFsjXV0iTZuDjh9/GmjCmG5/jDBhbk/gCwCPyqCZBFe/dkPsYyI/tHLdA/RwNWTy1dg5X1XgwDrN0hpzE80dyZHEruYXVQtRCCypFlKrRsyIPTrqribIbpPmVem7Pr4v/xHovmMvYd+hlFxmMzz8qwqyP1fstvs0HcZUlBvVW6lDZU/QkESqrgXGOADOPQMCrmGUi0nJtT4uCEU40sBfalJzllqHYsoQA+RIAPx4tqe0LOfJRkacYXMjvsnuOBE6GhWor215WnXXQLQawZPkvzTO4/UHKVN6NAngtdsE2Y4hP/rUdeRDFqPoQNhSM2LsZvWkRKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSNrQ6V00XdD2b9uX3OoPKwluQKl3L5l9u+u5tHz5nk=;
 b=PRBsMFkKWKr98L2U3LqlowrVQYGxDaz2MLnMuQ15a91vIagQC2meZx/Lk6A9KMKTORKnpoipBrCNO1SyzMpNwFXyN3kP7lCA4OJVapX0iITLNsYSKxHeD6uMjYlUBvZxF5rK2DYJnuHWeQG/JVhRgXmLyku3oEFYcfArmHLDDbCYJz6gRhsvqUWHDzqCYhBdonadJ7ViYHB8fT6doBNT0IyhETSl/Zdq1UFtfzqPsacKbHfZkx3ZCIpL2Jo+wD3CtjV3Kf1q2w2Qej/ajVdHZpS41+WQAqW3wLLXiEa5fDupm5cnN6UqPX114jP/ahaP4tqquTt2snRpm4uPXi95dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSNrQ6V00XdD2b9uX3OoPKwluQKl3L5l9u+u5tHz5nk=;
 b=WtuY7Rtb3Tc0k6qWuYPitekGLpPCu8HLHVvD6ipHgTcENYV5TOKHhv4tadn3Ivavjib7HRzn1T4s2nLXajQkNdNSXUMULCDIynwC5D9Gu2ZaDfd0K0KRpsCJZsPWKvb7u3CksEqN0pNcGwaY5QFJljgvWjiY9rF6dgp2GuKBQxU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB7661.namprd10.prod.outlook.com (2603:10b6:806:386::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Tue, 18 Mar
 2025 18:59:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Tue, 18 Mar 2025
 18:59:51 +0000
Message-ID: <38e69a45-1a32-50c1-0eef-bcdf8cf10348@oracle.com>
Date: Tue, 18 Mar 2025 14:59:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tests: add test for buggy deduplicator
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250109164711.232013-1-nick.alcock@oracle.com>
 <Z9m41r6P8HPZY0wC@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z9m41r6P8HPZY0wC@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:408:e6::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 813e9655-9155-4b06-aade-08dd664f0fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXV0QWExSWJFdENWeDJiaDNoYmdWQ3R6RFlqOGxlSEJ5R2lCOHJ1NDBxb1dt?=
 =?utf-8?B?c1pHUldqaDJsbk9CK2RUd2NyZ1poT2s0ZURKK0dqRkcwenpiSmVFaGc2Nmhj?=
 =?utf-8?B?VDdxTEdQVGtMS2c0c1lkU3FySDBTV2dkNlRkaEpCYWFWYWJTVXNrVDRiY2Rq?=
 =?utf-8?B?dWU3Q1NNeGlXSUU3TFlpZWJVc2Nabzl2eXJUS0YzenB1dktJZmMxanI2Ukhn?=
 =?utf-8?B?QzU4QlIvQ3hSQk5sZ1NzaWNiWklNeVVqTFNGZTVwVFdNYlJqUk92V09pbVRF?=
 =?utf-8?B?cjB5TERvRGMwK1J2YmFZUWVHaE4xUEtHZmhENXVZaGFUVjF5WE5EdjN4VnVB?=
 =?utf-8?B?ZVd6Q0RWUk1Qb1RwVXEvZHBpdkNHUkVlekFxczY0aVdld085UVJkSGRlOXRH?=
 =?utf-8?B?RmF1aVAzY25xRGhaZlhPRTNjenQrZm1zbkZ1OVUxM3RoOVg4MW1EOTQ2bUNm?=
 =?utf-8?B?VmVwWU1qZEZFVGYrMXp1Qk5obEVmL2NJS2N3OXlHSHF0UldZNHRPcWZ5RXJx?=
 =?utf-8?B?emVWTGhWSVd2WG5XekJCcXhzaDh5cXNXQ2dENER4OXh4c2JFRDQvY2VLdC9x?=
 =?utf-8?B?am1BSEhISUxiZU5QZ1JKV2dZUzJrNGN3Q2RPZEhieHpoRHhkNXJHTE4vVXdt?=
 =?utf-8?B?S0VFNFVWQzFtRXdPei9Da0JlNldaVHpTNUFPeGpFRE5hWUZ3L0l0b3hTTVVq?=
 =?utf-8?B?Nmsxbms3MHpNWXhlb0NRa0wvbVpQN1FDVDd5WkVuVFdRR1ByQzZFY0NiQWVX?=
 =?utf-8?B?L1NUK0xSTzVHL05OZzBKTHlNalh3OUZpek4vdVkzMThTR1ZVUVNzMUNZaGk3?=
 =?utf-8?B?aUFOZkNhelNTTitBdk04WW16djljVDJ3Z3krUlNFUG5BUWMzUTNoYnJEWmcv?=
 =?utf-8?B?aFYrVm54QUw0VHFjcEtQVWtkMHY0UGd2b3lYdUsxYkxRZjBjUjB3UnNPQkxV?=
 =?utf-8?B?aE5oU1dzUEJlc1hRSnM1TkdCYlBaL29qNW1kSWM1TjJ0elZhTkYya1dMNWla?=
 =?utf-8?B?MjFDcWZKV0x2aHNaOU9CYUxVV0Q5N0l5RmVSUTR5VTJoUUE1a3J5NW95RWV1?=
 =?utf-8?B?d293TlZrM0dsRmFnOXF0L2hqQUs3aEh1UWdNQzkrdGRxZW95ZVhXZ2VRZUNF?=
 =?utf-8?B?cjlZZUo2TGZyLzdUcmRiNDBwenRENUdyM2Yza1l4M3lrV2VDcGljL3BQazFw?=
 =?utf-8?B?aVYyS0RTUTNKcnJQd21OVFNwUFp1MUk1VW9tN1RBTFNHcldvekFzdXVhNTZn?=
 =?utf-8?B?T25LRTJqK205U1g4OGpQd04vajEwQXdDOHVYazJsS0c2MTc5MkF1cUx2QnVj?=
 =?utf-8?B?VGpzeFcwREIxNW5QUXEvZi81MlZJNk56c1FMN05yRGVkeVdyUk9UbGtvb0Mv?=
 =?utf-8?B?SGp2K0ZmR3oyeHNDVHFJN1lXV1ViZ2VyWit0VEdZcmt4MndHUTZjdkVTMnBE?=
 =?utf-8?B?WnhFdlNQR3VycVNidll3T1I5K0NzL2I2NEx4V3Nsa09BZVo0ZWNQL2hkVHNJ?=
 =?utf-8?B?d0s3Y00rSDBVWHNRNnBKeGdPZlkwaGllQ3hLZm9rSDBZdWR6Q0RUdzdWU0xx?=
 =?utf-8?B?Y0daYkZJejBEUGgraURHVTJhenpDelZ0cXRPMGZQcDBzNmdJMUtkR2RZY3FL?=
 =?utf-8?B?OENVY0k0cVJya21idkxJZURERmF0OTFURXF4WnA5TWdrZ2hPaXA0YzdzSU9v?=
 =?utf-8?B?Qy9PUkxCL3JJeW01Q2RFQUh6VGVqbFhNTWhFMmFQY2w3N3VrR2NqTlpXMmRo?=
 =?utf-8?B?ZzRQenZLcEtweGJQK1YvaXduVUF2NUtXZ2h2UTZwaXpVSGdGMmJvVEdKeTZW?=
 =?utf-8?B?VnNudGdvNDFaRmlFUGk4alQ3ZkRIZHZSaEJhTHJod0hqcjBFK3RyVVRDWlpQ?=
 =?utf-8?Q?qqeHJ1+S8pjtc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlcwYVEzb2lCb0luZ1o5Wkc4dFpQenR5b1RrVzVmQTA5TzJBRW9hZlFRNUxa?=
 =?utf-8?B?NDNQM2dSMnJJWjJ1NDhGOWNKcnE1L1RjLzZpMUZYSk9xVFFtOUIrbXdwTTlX?=
 =?utf-8?B?Y3VXbmRhbE1mZVc2WDFJb21OeTJEc2tPSmNRNDY2N01mZmdrd0NWRmZJcUl2?=
 =?utf-8?B?ZFJWazVsQzFjTWViUWNkNS9XZWltSys3czFKaExpVjhIWE43SEs4OEdHYktT?=
 =?utf-8?B?UkJrdC9wS0FvcThZVlErQXFONWlPNEkvVlcvK2xqWTU4QnlpQUE0MmJRQVkw?=
 =?utf-8?B?eDhVeThISHdrRk82SEJCbVNubHdLOXFFcldFQ2dBUlA0c2VBMkg3cGp0RkhB?=
 =?utf-8?B?QjZJWXowQmkxdWZXN2dDaWNaVWovSXJzdVhVTEFGN2tvSU1WTWZ3WjY3QUFi?=
 =?utf-8?B?eTZYM2d0Y3BxSDlEN0hpTFJ4NHAzbWp5WmdKeXQ2VzJvWmRoWlcxNVIxMFJJ?=
 =?utf-8?B?Q0J3aklUSEx2WmJIQzZ2ck9EZTN6WFhpdFJVekNSSkFuVDh2WStmTDdteEdY?=
 =?utf-8?B?N0NwN3pOUllWUjgxNzBnRklOTDVRUVRaVjVBOU5ReWJycE9mYTBxK3JLQitt?=
 =?utf-8?B?TUhyWWxISTJicTc3dXdQU01LUHZUZEVycmV0TFhXVHNreHhpVGJBWmRjMnhk?=
 =?utf-8?B?VzNaNGxHVDRENitpOE5qVkZ0ZHJ0VXdQanNFQ0tUSVJ3Rm5GSTkxVmNiNzVY?=
 =?utf-8?B?K0xaVmtRSnloTE1zdFRKb3hSbEpxMnVxOGkyS3QzSXFnbVRod0ppc3hUTnhK?=
 =?utf-8?B?MnBKM25xdExzZFdkdmZXMGNobVJRYVJoaW9UVU5iN01OaW1Fb1ltdDQ4c3F6?=
 =?utf-8?B?SENCL1pwV3JEbUp0NXAwZTN0NEpwR2Fpa2Y3SmdSOGtHMjh3WnhUbXYxaWhL?=
 =?utf-8?B?TmJrcDdLYjYrRXdDZC9IUU9sMnBaU2pBVkZwV24zVTAxa2NWN3EzWDQrQ2cy?=
 =?utf-8?B?NmF5VUQyNVJJUzZBSW9XTjJJYWVrRGFKZVVINXJhVjhRRjdraGJyRERUYkpQ?=
 =?utf-8?B?MVZPYVdUOG5HR1N5VmdyRkdpTS9ZNDhrWjV2WTBrTVRqdVdYaUxHakx0V1hZ?=
 =?utf-8?B?SVY2Y3BrMjRacXJObFAyM0VWbXdtSFg0T1Q3L0FSeXBxTnI2MXhERFU2K2hs?=
 =?utf-8?B?SUsvbUdGOTk5NGJqNmtJanhxZ01mN2xtRVAyb01ZM1Q5Tks4SnpSS2RqbkpX?=
 =?utf-8?B?Wisvd1paYis5ZW5hVjhjeWh2Nnh2dWUydm83MnZpMTJTQk5zSFh6VTNSMUEw?=
 =?utf-8?B?VjhDcyszRW11NUdySkIwRmw3V0lFdlIxT0Z4VS9CL1pRQVlIM3NKZCtnaDB5?=
 =?utf-8?B?YjlORjdBeFF1UEZ5MWRqMjhKZEdjMW5FdGw1TjB1NDlmUkNtOXBzK0VHeUpv?=
 =?utf-8?B?czlJUlVwa1hUM0N6Y09Ia0ZVbSsvZXVLTGxLZkNjZDVYNlJCeElMZ2tWN1ND?=
 =?utf-8?B?TGdFc3MwNmIxUVVGWS96ZGxtUXY3L0lqQmhWMTJIL1l2ai9HckFYaXBwazUx?=
 =?utf-8?B?enFTcFl6cjJHWXpxQzZnbDBCMGpwamtRc1JWZ0JxUWRDcnFWYnU2R3IvV1hB?=
 =?utf-8?B?MVdLYVFMd2trcTk1eW9HVm1QSWVDcnlQSTRiZzIya0pxcHN0RjdlVEs1a2pO?=
 =?utf-8?B?MXVxUXBTanVabjM3Y1hTbVhYZ1YxRWRUTHhjUkFPcU03azk0bk8wbUNMZVVk?=
 =?utf-8?B?SWZkcHpEU05yS2NQUkZ0V2tiRjhZSTdiOHpnd0ZJb3hnYnc3aVR4UUk4VFlt?=
 =?utf-8?B?NUdMREJOVjZLd2dtQ0tvbVFISEY0Q1JOTllleW4vem1hQ28wUklQS2grWG1K?=
 =?utf-8?B?V0RHa0ZhWnN4ZUtDdy9sZC9PVFZMRGV5OVAzVXN6WlM0WnF0ZG1KR2R6MHNN?=
 =?utf-8?B?S0VOOUx5a2NZZXpmTHRPWkQ4YTVjQ0xOTHJtLy9iVVYreS9LU3pGT2JwR1Yx?=
 =?utf-8?B?eHhKOWJpY1IwT0RYSkZWYWxVVDhPVXEwVkprTUtzVjJEM1paNWk0RXZIcDlN?=
 =?utf-8?B?ZndodDZLYUhVWjZNRGtzSGVMOVFHUVlBQ3ZIWnZzenhUYTlESWZxYWRtN2Mr?=
 =?utf-8?B?TGFWazZsZWNsYU9IVld6RThya2Fqb3RMRHRHd3IwRWJ2bU5sMVVLdWtTTkZU?=
 =?utf-8?Q?/EU/VGpRZW7t1Oecj5BSw55/x?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iYRtce21hFNiCNM1ntvtT8nSWMj7mgN9jzCZc6Etw46IlKAIqBgJ+PwECvFGDB89fWs6kEpHvU4r7LQ3jvQxHKjIwLBX6aIdlHQeuYx8tJr4erfAkHv7mYHZlPCS6W7PYrKB0q6UzKw9vL8x3Z0Lc/M3w5HsvA7yGIafjSt+nCFkvOZ4f4ThFsexCP+rbZcmCj18IcV2p40YHRmUdXYFcXGLBgafbpIgTs4yfN/rEJKFlucnCOr4z3F27vRFnYhoVb9oQiEpqz3Bb4a4is/TSOjkpe9cvwD85xR0PR5qyloV7sgGxRScrsIDUWa6YS8Q114B1VhUTaBfb4SbN8bZMS4mra/G4auwcOpVTHsfSVTL0vJeH3Uctqegrvxs0jp+m8d1AgOgULxHquxa82b8hhgo8Kj7eaAKg4m54PhYpJJ19AHBjvkM6LlloBSzcfqircpcKuIEO3xAGBEBTThCT6LmgR4C2ZlWRLfYKu5iIYv5g37mGOe3RMv6FW8+mHOZP50wWIn666Btk2V+kuS7IuoyVTe2nxkA0S+nFVWm1P8O5qG+nIarWGAlkaHL0BUyXiqkQzT/3T2mzi+btJBpYbFpI1pQ+eROzErJsixekSI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813e9655-9155-4b06-aade-08dd664f0fc2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 18:59:51.1097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E5hvwyIMO6RVpQ6o9CSk02fEWSpQfnlfEW0ZveB1mwpIuQI22mYmJXJuMliOwp2TIMzOO3yBDnClLxi3bgv75g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_08,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503180137
X-Proofpoint-GUID: 5tIVKqu03_IgSTfy8x7iXaRNpf3YjsNN
X-Proofpoint-ORIG-GUID: 5tIVKqu03_IgSTfy8x7iXaRNpf3YjsNN

But if it is a dependency, it would be nice to know there is a problem.

On 3/18/25 14:17, Kris Van Hees wrote:
> This seems like a test that would belong in the kernel tree rather than in
> DTrace?  It seems like a weird tst to have included in DTrace because if it
> fails, we cannot do anything about it in DTrace anyway.
>
> I'd rather leave out tests that exercise things that are not DTrace itself.
>
> On Thu, Jan 09, 2025 at 04:47:10PM +0000, Nick Alcock wrote:
>> Some early prototype deduplicators dedupped types in one dict (more or less)
>> rather than putting conflicting types and module types into
>> sub-dictionaries.  Fail if the running kernel is such a kernel.
>>
>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>> ---
>>   dtrace.spec                  |  2 +-
>>   test/smoke/tst.ctf-intact.sh | 58 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 59 insertions(+), 1 deletion(-)
>>   create mode 100755 test/smoke/tst.ctf-intact.sh
>>
>> diff --git a/dtrace.spec b/dtrace.spec
>> index 902ad7d8bb980..cf960f14b55c7 100644
>> --- a/dtrace.spec
>> +++ b/dtrace.spec
>> @@ -151,7 +151,7 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
>>   Requires:     java-1.8.0-openjdk-devel perl-IO-Socket-IP xfsprogs
>>   Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
>>   Requires:     coreutils wireshark %{glibc32}
>> -Requires:     perf time bc nfs-utils
>> +Requires:     perf time bc nfs-utils binutils
>>   Autoreq:      0
>>   Group:	      Development/System
>>   
>> diff --git a/test/smoke/tst.ctf-intact.sh b/test/smoke/tst.ctf-intact.sh
>> new file mode 100755
>> index 0000000000000..d737a2b162fcb
>> --- /dev/null
>> +++ b/test/smoke/tst.ctf-intact.sh
>> @@ -0,0 +1,58 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> 2024 -> 2025
>
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +
>> +#
>> +# This script verifies that the CTF, if present, is non-corrupt: in
>> +# particular, that it has at least one child with
> The rest of the comment is missing?
>
>> +#
>> +
>> +ctf="/lib/modules/$(uname -r)/kernel/vmlinux.ctfa"
>> +
>> +if [[ ! -f "$ctf" ]]; then
>> +    echo "CTF not found in expected location of $ctf" >&2
>> +    exit 67
>> +fi
>> +
>> +# If this is not an ELF file, turn it into one so objdump works.
>> +if ! [[ "$(file "$ctf")" =~ ELF ]]; then
>> +    objcopy --add-section=.ctf="$ctf" /bin/true $tmpdir/ctf
>> +    ctf=$tmpdir/ctf
>> +fi
>> +
>> +# Dump the CTF
>> +objdump --ctf --ctf-parent=shared_ctf "$ctf" 2>/dev/null | \
>> +    awk '
>> +BEGIN {
>> +    intypes=0;
>> +}
>> +
>> +/^  Strings:|^CTF archive member:/ {
>> +    intypes = 0;
>> +}
>> +# Scan for each member, capture its name.
>> +/^CTF archive member: / {
>> +    member=gensub (/CTF archive member: (.*):/,"\\1", "g");
>> +    next;
>> +}
>> +# See if any non-shared dicts have any types in.
>> +/^  Types:/ {
>> +    if (member != "shared_ctf") {
>> +        intypes=1;
>> +    }
>> +}
>> +/^    0x/ {
>> +    if (intypes) {
>> +        exit (0);
>> +    }
>> +}
>> +END {
>> +    if (!intypes) {
>> +        printf ("No non-shared-dict types found: probably buggy deduplicator.\n");
>> +        exit (1);
>> +    }
>> +}'
>> -- 
>> 2.47.1.279.g84c5f4e78e
>>
