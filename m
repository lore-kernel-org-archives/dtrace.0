Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6028937D
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750101678; cv=fail; b=aUD1joLlkf/BDubCr0DeUa/TS2Z8GqraBuL+kY3iWn1aNnzAkJOQE94P6Riel96DGMYgceFqj8mV6KT8HAH9qQ1K8xmX6/KmKsdRCklTk3fTMLr/t6hM+bBtSBt4r0izy4/fLCCoxwbA2iByeA0DydHs8iqnP3sNVlkewkz0H0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750101678; c=relaxed/simple;
	bh=zTZOb2qPr6NdRyn8mgLc5+bayTudE/p8BPNdv/QDDak=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eqZpCmhvQtN5oRg5mm/T9H+POaBoxPFDNcMlie1nA1pIaeTvckKT9SK601I1AKCmf6lseZzwqTjOiHIWWp6g2Urs/8RsRgDo61VveMrHwDgaf1mPGRwLisxcCD3+9d8+mZ16yxXUoOhfXg/AdYK1bP/cuOw3ekwp68/Pk/4Qnqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qn+GKWFw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PQBEbePA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qn+GKWFw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PQBEbePA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuTKh017880
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=rVDf6d6SU9XOgnWiKmBEDI8L9j+YvAUAZNln4CTr8yo=; b=
	Qn+GKWFwFQfHDFYw982Farf1rrWWZrbAe7LN1x2EeE3BH3huClXv7GGQr+olgybI
	DABUQJ4q21JPmrQDVOohNBdAnC0bLYwcVSW+/l8DOZm9yTUjqxD0ey6GwIBBh87Q
	vAXTwnckT9GI8F81avMnTVqa4zz/E3yAOsYvesW+PFOzuzdEYsmXzxnx+I+4i2Fa
	KY3AeslAx3TY7jCQsNLiEcA/ryV3+M3S3BHKc6Oju3ceNKZy+A3ve4F45Q8xvL87
	RlRBw1Ft6K11T4J6o5gbuWniQ8beUlIklTAgXiXq4O0+YQHBOjBPbeB30J0sCQhL
	erBXvHZajwYhkmRkwESctQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn31dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:21:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GI0QAC034466
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:21:14 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh83eg0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 16 Jun 2025 19:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+TyOm8E+BOa5kZeqKsuvrGD0+6hPUfha1MGvLrnLcTMVdXkPfgy1/M1Qe3jOwgCdYyg14id8oldNPJ42nkujIjgmX4pVWyibpCGZw2vtsWAQivj4Lr2Y84Ms02n+4PeTqXBfJaV/p1t0zW0AaOxWeCHaR1s6kmYp5JktzJAJXUnLzFDYYFS3EObwYxceS+nntWJ/YenqFQdOnc4TJxQlggaT7PVDSZsLWLL+lNE7gBaMNutfCVi0+aKAzxWnr+fXVuPy/c1A2tLWxkANYOVxqcJG2Jg/3UoK3qbew4fChudibKvYT3NOrwBW9VHj3ZsfJPSXPKWpMGwdWOWSS1EIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVDf6d6SU9XOgnWiKmBEDI8L9j+YvAUAZNln4CTr8yo=;
 b=TZiE5rj5SkttUAriD+0d1DtvocRDMHLJjoWGSFpkOeL1CYAXMGYq7/+E0q5RFypkbrs1W/KJib6l9J1F/rQYJIhPtUYpYxiGwlcm6qny99SQFKJbvb+9m6yTnPQ+nqNyH5hwTuyW0GuBH2VlSbce8dwuhWfxfvEwJzYykDgW6ZZ5rQMeLXSACuE0ir9GVQppwybeKlzrEabZp6B2qx0UfdZGuGjgeyYax1nXEntehu+fxHXdWOxVBTVgN/wKgbYONlhz6szB5W/im/+qpUtnMrk37R9obp7VRi53XvVVhv2zctmaAWce78us7N6M4CWw+how8KLs7oywKeN3c52tJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVDf6d6SU9XOgnWiKmBEDI8L9j+YvAUAZNln4CTr8yo=;
 b=PQBEbePAn71S8vfvli6E70CslIHrz17NLY7DQG5Twi6eOjNxhaNq6I0MKSJHP5+f6RAaqdoN4Oo1L4Y5ciMIjxbiAvYN2OlvmQeOZEPoGqUfvL7FIQuJfXxCmySsyiLMjXO9O9ZVxyzJXAUWfViR1OgKYzPAmj/2iSZAPBN1mBM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB6376.namprd10.prod.outlook.com (2603:10b6:a03:485::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 19:21:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Mon, 16 Jun 2025
 19:21:10 +0000
Message-ID: <6cdb7118-e678-57e7-adff-a74a1ff39e19@oracle.com>
Date: Mon, 16 Jun 2025 15:21:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 01/14] Fix stack-skip counts for caller and stackdepth
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250522180118.27343-1-eugene.loh@oracle.com>
 <87sek3d83m.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87sek3d83m.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB6376:EE_
X-MS-Office365-Filtering-Correlation-Id: 754ee1a9-ef79-40b0-3618-08ddad0af3a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWRQRVFlSmlXcFh0dGVMNTl3TzVUVkwxNGYxRGRuZ1R0emRjWnFleXYvSUdM?=
 =?utf-8?B?R0VmN0Z0R0xndG5icm02L1FXY0xsQ250REhUY0J3STJjcFpYQ0M4ZDBtSEcv?=
 =?utf-8?B?Z0xDaEZwYXA5YnZ3RWR0RTFkOXpZbVZEYVo2ZzRZN0hYTkJMaTNTYUxTQXUw?=
 =?utf-8?B?VzRJZ0NZdEFoSkpuOFRCSnRpSkJLWUhXUjl5L0RUN29iUHp5N0ZlQVJYb3pw?=
 =?utf-8?B?MTgrVllpVjJXdE9uT0JzYzA2Q2xJeGM5elVROW8rQS8vTmk3SVR1ckJjRUVl?=
 =?utf-8?B?SEYrNDhTSHc4U1A5ZmRCSm1Od1Q4WGNXZ1B0MVdZMDRHendGbEZnVHdCWlg3?=
 =?utf-8?B?ZWgxRVdlNjYvUEJJcGxnNnJZQUUzYTNZRkswZ0x5VWJralc0MFhMUXJlbER2?=
 =?utf-8?B?aWNXaXA5ZVI5TWtNMnZUWnFqa1BBcTVOTEJWYzdQQ0hScmltZXFMeW1kOGpT?=
 =?utf-8?B?ckxVTFZWQXhLZ2JtVmc3bGhyU09XbVBqa0JnM2ErbDdkd3dJdEFqOTB0ekVs?=
 =?utf-8?B?Q0o0RElTYmw0R1VQR2xDcFJTYURmWmdWQWRyamFqdEQ5SHd5Nk1yVjNkK2dk?=
 =?utf-8?B?V0JBcTN5b3cwVTZhZnNSRVpMSkR4MFFMSnBZNEk2cllrQXFsSThnWEVkUW1X?=
 =?utf-8?B?NTFZYnd3b2pFcE0wdmZCYkxNWXAwcUFKQ0RZMFpaQ0RHV1RLQlNwbDY3cU9p?=
 =?utf-8?B?K1FCU2xFR1dNbi9JWW9YTHdyWWxySkJFZ3Zoa0tsUnpRN2lxazhQRGFaZ0xJ?=
 =?utf-8?B?VnZNL0RGb2kvbkxkUEZ6WFNhVzBLRzV2MXlpM0NOUkdiRFRQWTRHYi9ybkZT?=
 =?utf-8?B?NFlhQnE5R3ZIOUtJQndHSzhhZnpLNjl0d3paTWhEdkVtdnpBS3VpL2lvcGRr?=
 =?utf-8?B?UHpLQnhlM3l3WkpJNkdyMStVaHZCVmxMVkRnekhtaStTM0xmTmZxWmM4b1A0?=
 =?utf-8?B?MVZ4UStUWGk4dmFJM2RYSE41V21ENDRERlZ5clFDUFFXOG40M1d0cXA3Y2l5?=
 =?utf-8?B?bnhobmN3YnJtUG8yelBvbmsyT2kybmJwWXhiZTBKZ3gyTEFHZk9reC9saDA5?=
 =?utf-8?B?MWJjdUp5WXdabWF0cnc3WVp6WXFwT0xKeTVkSGEwanRZYXFpTVFpbngzcHlN?=
 =?utf-8?B?bE9sZUVxVkF2MHZTeWIranBwN0JrVzl3M1Y2SVNDTndSZEN0UTFrbHVxNlVs?=
 =?utf-8?B?ZjdPZzFLaGxyQ0FaT1oranVkVHZSZXV5Uk9BSkl4UHFObGFnTElHd1dOdERa?=
 =?utf-8?B?Z0R4OGZlQnVvOXdHaFZQaHFvd3VGZnlRdWRQMjE1MHJmd2pvaVl2eEtBL1By?=
 =?utf-8?B?TzlCemp4UTBISjFZNFBUTlZBKy9hTWdscjFyUDdNdUUrNUNXMzdlU3YvS0d3?=
 =?utf-8?B?SnlVcmJvcXl5Nk5QWGJJcGZ5eWRJU2pxOGQ0UkpiUTA3Y2lOemlDUGppbnN1?=
 =?utf-8?B?U2FjQ3RMZjN0TjlQb25WcjJaOXd1ODRqenM2dXZxbmhEdGN0NlJMM1U2Ujdo?=
 =?utf-8?B?cDd6M2VKNGxQYTRvcnNzaTZiUmpKSjFzdnBpQzJYY2FlQ01WTm93OHI4MHk4?=
 =?utf-8?B?bHBOdHBSNEVpUEJNSGVPeHRRZ3VSTmh2azVaVWl2Qm1WeVh6eUQ4UjV6VElB?=
 =?utf-8?B?NjVJZDkvUGpjaTd2NDRtemp2ZXJEc1A2Wk5qdXkzWEZqUFlvMWVkZ2FqZUZp?=
 =?utf-8?B?ajdXL0FBSTBJRDBGbHk2Tjh0Y01ycTcwSHNETEhTdmNmeENMTEdjeUs2Z3gz?=
 =?utf-8?B?WE43dGNNMEhjVzNDSFVnRWVVeE1JeWZCWnVtMmJzbnJqelk3V3BjQW13a2NP?=
 =?utf-8?B?VmJOYkNLcmM2KzdMaXJvUXNkbXl4Mm9rcW9NNGxlMXpBbWJuZWFiNXUxbGsw?=
 =?utf-8?B?QWgwYTFNTXlEM1dIUGF3ZUJua2ZNR091a2ozdDdxUHlMYnZvYk45VXcrM0h5?=
 =?utf-8?Q?9Ir0JzFCUAU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWloWkJCNXN5d29yNlhXeDZyYStERUtxZjY4RUVFQXZ3MEJNSmFEcmFrOERN?=
 =?utf-8?B?UjZjTUt3OUltWHVaSXhGR0Rwekl5WlZmU1h4WGgza1RNWjNDc0d5RWJteXN1?=
 =?utf-8?B?WnkxV2VMSVdJM0hBRnZWZkJQMitmeUVKWTY2eE5tM0txV05DbHdwSDgrREQ0?=
 =?utf-8?B?bmNGZUdLSUo5TnZkYmpqSzh1SHFRQ1UvcHNDSk9SREQva29RNk1nS0JHemxF?=
 =?utf-8?B?Y2g1VThWaDhzREJsSWZpVVJjQW5XUDN0NnFndC9ZOGJYYVdSWW8zcmlBU0lO?=
 =?utf-8?B?WDVaWnpUeS9kaHlFMWQxdzF6ckFXNXFWVGJnMjdQd0xib3FiTmdxcEkvanAy?=
 =?utf-8?B?VC8zVHRFNmxNN2FGd3g4clV3OXRsck4xZml4ZDFWclphZHpaL1dHUnpYbHUw?=
 =?utf-8?B?YTRyWUdGTEdtZFFoUWl0Z1A4SHdBd1A0cVFETmpzbFlCUjlMTEFpZVFWN2tI?=
 =?utf-8?B?Um9KcDJwS1A0MlUzb3ZFOWFwd05HbjZodGxqUG1lS3dlV09acHdBNDFBVDZ3?=
 =?utf-8?B?OVRKVXQrUS8wdGZoU0FoZkQrRnJnZWZ5SGxkRUNvS3BYVDk0VTBlL2RxUWc3?=
 =?utf-8?B?WUlHcW5zNzlaWnRhS0IzMWw5ZXBBME5CbXo4endQbmtYc0o0T3hYcEZnRzNl?=
 =?utf-8?B?NzJXeHhZTVlJRmJwRFoyditKenlHdVl6YlpndUo3TmlzU2J0d1RGeTBKZG5v?=
 =?utf-8?B?Z3N0dmtaNnJkV2tHOFluTXZCSzVYNWpXWG5NdnVrWVZSNCtvUDZZUXJQTUtj?=
 =?utf-8?B?SEFWcGYzWGlUUXlzQTcvNWQvWDRIcDRuT2swT2ZPcTdrK3JsaUlBMkw1UndF?=
 =?utf-8?B?bFRvTG42RHQ5VWZEQkhuTkxrYTlYQk40bGluTzlpMVVjbjlMelI0bFozazNx?=
 =?utf-8?B?ZWRTOHpPSHZldTlaNXM1QWl1Kzd3c05IUkp0T2hscE9qVnBwbjJxRnovbndX?=
 =?utf-8?B?Z1lYYjZ1QzYxWjdsUHRGQlZGRjQ4QkxNR1VjM3hwNlZnQk1NTHV5YTNSQ2dw?=
 =?utf-8?B?b1lNeHAwN2ZjT1Y1TXJkVytMUnJMeWtna3dBVEJRVlpWM0hhTG00V3dyc2FP?=
 =?utf-8?B?eDduWmpuUEgxMkNrK3VrWHVsNW8yNEFKRXZCMFpuMDEzWXFLNnZqTlJJSW84?=
 =?utf-8?B?QnluRU9TbzkraktqRCttb0VlbitxaVYrREpPdTZYTkxpV2hoTFpXck1yK1RV?=
 =?utf-8?B?MUZIWU5PdS9hdWxyZnZsUWRtUHZGOVcrd3BhRlF3ZWE1WUtJcWh1QlBrZURa?=
 =?utf-8?B?eW9yRElUVHAzU0tXMFJMQmNaMlZXcmEzVllrSTN0bWJWTHZkVVVIeEF3WU9W?=
 =?utf-8?B?ZUJUWncxd0RRN1BQSEY3VWlNOU14OElHbHM3N2ZXQThkVm9nbmwvWmRSSTNZ?=
 =?utf-8?B?c1hOcUJRcDd2MUVWY1dNaGVtcGhNN0NESWo1b3hyMlFJaGdCMGQ0UU94blJT?=
 =?utf-8?B?aHVpeXlOb2dINEQxWVl4V2l6K2syakNtMnZLTk9aTHNHcFJzNkt4YlZ5ZjNq?=
 =?utf-8?B?WllhSGozMG5wa1h3a2Z2dU9ranpNcmdJZGVuUGFFVTZZaTE0a2UrU0FUenpa?=
 =?utf-8?B?TCswN1dBeE80VEpkMlBQRWcrOEs3L2hhNnRSdWhUQmMrRVlXQ0pXSi92cUMy?=
 =?utf-8?B?U0JkY0REVHRJZ3pCWGszK2pLOXlacExzUlY5VGh2U1ExRGt6N0M3T3Rsa0dD?=
 =?utf-8?B?dVVuMjU5WHFVUmRNUVZnZnlKbU42Z3pScGpSUWtCN3BwNXI4Qjd2aVFJRjIy?=
 =?utf-8?B?R29YN3hhV2hYLzkyR1NMbm5OZzdweFlUdVArckhEUFFpUHVydVZBMEFtRWsw?=
 =?utf-8?B?MmNCOUx5Wk1FK0J2ZWd0TSs3OXRLeEN6a2wvTE1JSm5pWTBuaW1TSXlub3dj?=
 =?utf-8?B?MklNU3dKR1RCcjIvMmdZNk9JTjBJSHZCSUtiV2J3eVhiZkZxek9RV2NDMXox?=
 =?utf-8?B?eDRrZTVpTTg2bTY1SU42bmwvcXlZTGlRcmhHRFN0NXFmbjU2b21laDBDRk10?=
 =?utf-8?B?Vjc2OUFsQnBNM3g3azZJS2xxYzh4VU1ZVmpZelN0SFdxMlo2dDRGZVlYNHEx?=
 =?utf-8?B?RWRHNCsyVi9UWHRqWUg3WVRkV1A2UmY5VGltZDlaZERpR0czNkpNUnNvTUxI?=
 =?utf-8?Q?1dX7rrrBoRhx+o0LkQ92D+VnY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GsExw+u9ClKSvp9xsrc78yfjItZ+wwAavFhQQe2VakDsCjiK2r9OOkjLgsAPcM+HcWJzQRCGm8QhSieYKLt9v5GmqnItKAi6MXnMym75AEkbWRa1i+U1rJy3XBCxktwweJPFFuYUg1mda7SoRR7h8WY5vKNJGLvtccrfZA/tVeZaYdUvBHui4nEk+fL8aDh/aKBAdhn+FyBfYjCi8nAcQb+nKnQfvOZ1sMmEA9byEi9OTb7brbaRozDvC2unQWZ5JX5HoNIUnNvUrw6nCB+a1KSurzSkz+F4pTLLAPI58Mhfys3We2FuRd8XcPnyFfmPrqLaugiZyKkV0adX/MdPo3GwrXaRkOopK5ELcpjvYKE/v6aTTkXC0AVLxVYAMe/MfiJpuDFm3v2N3wqSDapYkfWjIh8tHCxgeuNVQH5QjA/cN+XBpYvdzTEDrpyLehJFUwGWJsbl7NQpgEximvyt+vYZk4ikv0imbfjRccLl2c8fYPO8jSYuKlsmv2Vkls6YPMlZlgLo3+8sKYQygF6EtChtRfuhMaTPx5Zc7X7Yok+NdyVkX/02GG2vAwHkh4GLj7igJpg5FeqKxtw+CGso1Fp6USmYorS0VM4M3tRQthk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754ee1a9-ef79-40b0-3618-08ddad0af3a4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:21:10.8782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EAtr6YuNuT3PRSY+AavM8HpUU0A05kf2XJuvU24NUA3ChAoGdbWAzNoSCyTRE7gp3NiCUHCH59KRfIG6JyTkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6376
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160131
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=68506eab cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PLCKI5x_utcCeNUqL3gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 5SXScnBr4Ue0QVtrKMbM7Ef7Fa8h9pv7
X-Proofpoint-GUID: 5SXScnBr4Ue0QVtrKMbM7Ef7Fa8h9pv7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzMiBTYWx0ZWRfX533uSlL9IEb9 RZ4yjqFIPd3VSAWE3UTUJTfbWyqHhAs66dQ7g5XX9DMA+f6LPEN3qrYxpZtbo7wDFKk1WxCkzx6 EW4vHjY2GHd2UTQgPo/4hgXkz7NHi+UDBBysEqajF11tcMahJ0BlSpVRP+TzjD69viuCXmixmoy
 eG6cpp9i7yPhy6iOaY94DhY4NGch0qXz5RpnZ75eFKzYOGiCqoGhdNMhbaMmRUyuNe5VmOlnspD G4Oxb5lluy7GPm+JKu2MZE+ZPlilsaKb2KrJQYp0sxrp9+HaqDr+BvxnnSycgny//NSGievj5fu xm/5AAhAeaPI0vNBzr4GXyVnRO0bBrGEbx3WZ9pvEDcELgZF6k+LlSaVWyzdfFLnwaEBNxo4EFx
 F0nO9qEyjJWo2Yoezfp2UtUkwblz2GosHbmk+LX57Dn/0guRxGm2QyxMJABE0l5/hY5bMHV5

On 6/13/25 10:33, Nick Alcock wrote:

> On 22 May 2025, eugene loh told this:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> Apparently, when we call the BPF get_stack() helper function,
>> it generally knows how many frames to skip to get the real kernel
>> stack.  For fentry/fexit, however, this is apparently not the case,
>> and commit bc65cb44d
>> ("cg: allow providers to specify a skip count for stack retrieval")
>> added the ability to skip frames for fentry/fexit probes.
>>
>> When this "skip" is needed, however, it must must be even deeper
>> when we descend further frames, such as when we call dt_bpf_*()
>> precompiled functions.
> Ack.
>
>> Add this support for dt_bpf_caller() and dt_bpf_stackdepth().
>> That is, if there are stack-skip frames, skip yet one more frame
>> when inside a bpf/get_bvar.c function.
> The general approach here seems sound, but this confuses me. Is the
> assumption that if the skip is not needed, get_stack() will itself know
> how many frames to skip, and will skip dt_dt_bvar_caller() for you?

Yes.  I confirmed this with tests.

> (So a zero skip is actually a "the system knows", and a nonzero skip
> causes the system to not skip anything, so you have to do all the
> skipping yourself?

Yes.

> This behaviour is not documented in bpf_get_stack()'s documentation,
> which absolutely does not mean it doesn't do it...)

Yup:  I did not learn this from documentation!

>> Note that we declare the skip count volatile.  The compiler might
>> optimize code that uses the STACK_SKIP value, but we will subsequently
>> perform relocations that adjust this value.
> ... why doesn't this apply to every other extern global variable in
> get_bvar()? They're all similarly relocated...

Right.  There is potentially a broader problem.  But we simply do not 
have evidence of misbehavior in other cases.  Ruggedizing other cases 
could be the subject of a different patch.

The problem in this case is that the compiler seems to assume 
&symbol!=0, which is reasonable except that we violate that behavior for 
our relocation tricks.

Consider the C code:

     uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
     {
         uint32_t          bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
         char              *buf = dctx->mem + (uint64_t)(&STACK_OFF);
         uint64_t          retv;
         volatile uint64_t skip = (uint64_t)(&STACK_SKIP);

         retv = bpf_get_stack(dctx->ctx,
                              buf,
                              bufsiz,
                              skip & BPF_F_SKIP_FIELD_MASK);

         if (skip)
                 return retv / sizeof(uint64_t) - 1;      // branch "A"
         return retv / sizeof(uint64_t);                  // branch "B"
     }

If you omit "volatile", the compiler assumes &STACK_SKIP!=0. The emitted 
code has:

     *)  no run-time "if (skip)" check

     *)  no code for branch "B"

     *)  only code for branch "A"

If you include "volatile", however, the compiler caches &STACK_SKIP on 
the BPF stack and later performs a run-time check on its value to 
correctly execute either branch "A" or branch "B".

Incidentally, I looked at this using the function like this:

     profile:::tick-1s,
     fbt:vmlinux:ksys_write:entry
     {
        trace(stackdepth);
     }

Notice that the profile probe has STACK_SKIP==0 while the fbt probe has 
STACK_SKIP==4.

I looked at the disassembly in three ways:

     *)  as emitted by the compiler:  objdump -d build/bpf--get_bvar.o
        (not too interesting but establishes a baseline;  e.g., that a 
branch is missing)

     *)  after relocation for tick-1s (-xdisasm=8 -S)

     *)  after relocation for fbt::ksys_write:entry (-xdisasm=8 -S)

The latter two confirm the relocations are correct.

>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   bpf/get_bvar.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
>> index 9625e764e..99a6503d5 100644
>> --- a/bpf/get_bvar.c
>> +++ b/bpf/get_bvar.c
>> @@ -53,12 +53,17 @@ noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
>>   
>>   noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
>>   {
>> -	uint64_t	buf[2] = { 0, };
>> +	uint64_t	buf[3] = { 0, };
>> +	volatile uint64_t
>> +			skip = (uint64_t)(&STACK_SKIP);
>>   
>>   	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
>> -			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
>> +			  skip & BPF_F_SKIP_FIELD_MASK) < 0)
>>   		return 0;
>>   
>> +	/* If we had to skip any frames, account for the dt_bvar_caller() frame. */
>> +	if (skip)
>> +		return buf[2];
>>   	return buf[1];
>>   }
>>   
>> @@ -203,9 +208,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
>>   	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
>>   	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
>>   	uint64_t	retv;
>> +	volatile uint64_t
>> +			skip = (uint64_t)(&STACK_SKIP);
>>   
>>   	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
>> -			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
>> +			     skip & BPF_F_SKIP_FIELD_MASK);
>>   	if (retv < 0)
>>   		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
>>   
>> @@ -217,7 +224,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
>>   	 * If retv==bufsiz, presumably the stack is larger than what we
>>   	 * can retrieve.  But it's also possible that the buffer was exactly
>>   	 * large enough.  So, leave it to the user to interpret the result.
>> +	 *
>> +	 * If we had to skip any frames, account for the dt_bvar_stackdepth() frame.
>>   	 */
>> +	if (skip)
>> +		return retv / sizeof(uint64_t) - 1;
>>   	return retv / sizeof(uint64_t);
>>   }
