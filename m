Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BF9153836
	for <dtrace@lists.linux.dev>; Wed,  8 Jan 2025 06:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736316100; cv=fail; b=VtlwmLXBSfGpWrIgFJnOWhO1tW1s8z/+w/2KbNxvhxXtFxW0ByeG6b9DsMpC03XRhgLIkL1/vjprb375Jv78V8Q25vvu1tNqoyPFNs6Q6uONXX0Uj6qbvMmcRKt9oaG5oPDFEObd3zRCyHOi4OJaw0HNDo3JOnr3CgPR+mN3tQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736316100; c=relaxed/simple;
	bh=gBXvXy2WZ+QMTbzVB/2Jkvy68wMtL4fvgYRyZz4P+3s=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L3jX5u3UjAAeuAPyKi6R2jiS1WnWj4v7zm2u2GBTnT5ajPxPoMJKVy28eo2h6TYEwMQVxlcqghO9eE9wROA88cK9JikMtG3G1HDR7Se2LBh0KPQ/LvMAj0zO224Qsfkw3Ou9EShMcmhKR9MKQ6D3zQpRpd4qLGrXyQabJls3c58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CIhu7WS4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UMDgb0sB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CIhu7WS4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UMDgb0sB"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5081u0Cg007219
	for <dtrace@lists.linux.dev>; Wed, 8 Jan 2025 06:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ECLLqgr8mHhoUOeGxvSZ2n9MS/SoUTxcKgp1ZMynI98=; b=
	CIhu7WS4gx1uHhrvSHDfBhzliYh1WCGbz5jUEzGQ5Nq7nEdQ7mZAmBrnrPn+OPP3
	bLAJ8Fxi9NnJO1bW0Oaxu6u/k4aqBw2LXciDRxnDMxYAHDK2a2pUz0TeQqGiWOh2
	vrYOKSUvJRxc8EmKjmttbcfP9mJEYlEA0/6zHo6pITAUnyc06fOef6hT5abGicef
	l11Br9UOlNTl19IBsWspXy6DDaUpHKm1Q5ATs9GnSpFWo9uLf+mv8EvVlRjuxSiD
	gQJN2M59NlLRVyTSaI5SQIiZE27Nd3hOn010s+Hfa5Xm2kYSPhusa6n3JDyfx413
	bJYkYttNn4hMt32HykNkwA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xvv95vmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Jan 2025 06:01:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5084eSdY021260
	for <dtrace@lists.linux.dev>; Wed, 8 Jan 2025 06:01:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue9bsmf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Jan 2025 06:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIn3R9iw+XolwN/NJNTH8yjz6UH4uZk1jSzYklGhxpVAxo3ARz/7PJqrdLYlZmzebGumROXSIVoSDNkvNyzm2Pl+MDRR163+WtoQN69eoFmItKkColQ7zU8joKiAH2LiCg+kd4B4vZkM0s863KEOvo9sUmS2rqkqHRW5bsFv56w6iG/7H+IAumlJI58iSbr7fMliEPvp6O+oXgVS4QEBPQQA6DJ+RLmqOR5Nu+ohyegD6ipO09GSI2ST1hoRRVuTBbgFrgeGLdf3xgNyij7SF120e76rtwCXuKpjLDsZF9bKdO/H98PewdzmBi6LooN1nb47WFIaX8kgg9UrZF89JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECLLqgr8mHhoUOeGxvSZ2n9MS/SoUTxcKgp1ZMynI98=;
 b=CS2jdJEJTXWW7YE/2O4fNeykT3FS6sW9sU3MVj/sJPM9VJsIrUQsMLycB3vslNE1M0rEZ70hia7m8xJ6j4TRg9BLR+EbDHibjPnknGvsEkhcaCL/dGstCo8VOci2MmRhMCp756AktbtYxnnm3F8qx0XarRJ7h/LUXcCVbgEJRme/xFYCW5mdIYp1I11764fyHejMzYIjvHb+T8Y2aEeVq+0PhmFpBJExAqfqhWaeXWQCkhbENodiDpXxzQAUvNHgeb0K+qMy4qtTyEis+XjD9Tvh2HRGigVrKutP0i0hQdI6RhFRboyJOpPeF4ovmS965uEPz53xbAGUX/pT9ZcAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECLLqgr8mHhoUOeGxvSZ2n9MS/SoUTxcKgp1ZMynI98=;
 b=UMDgb0sB++YZgsVwa9Gzh6OHmsmTMir8l+wJNC1+ObbqMVBTyfzVztZNonf7UtpEwVw+VKasIbXaWq9/h66ikghxg7I8CPPqMqqIfL6VbznP8Af6TSGWbRgfGjBwopafaZpxbXSY//jmw0gX370fCx72pMG/lBnDpFyFh6tTM14=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7184.namprd10.prod.outlook.com (2603:10b6:208:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 06:01:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 06:01:29 +0000
Message-ID: <474ca7db-5d3c-0426-7b17-fb04043544c5@oracle.com>
Date: Wed, 8 Jan 2025 01:01:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] io: adjust io provider for NFS tracepoint variants
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace mailing lists <dtrace@lists.linux.dev>,
        dtrace-devel@oss.oracle.com
References: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: c7365410-8ada-4c27-454e-08dd2fa9e532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG9zamRuTGVmejRjblV5amF2aDA1UW5wVkNJL055RnRNb2NjQUlDVUlBOXBM?=
 =?utf-8?B?TDNnbC9kdGovcU1VNEliaWpiVXBUQTRqMVZwS3NLT1B5ZHlVSURoN1lvZVZR?=
 =?utf-8?B?eG9vRUFkVFdQUXE0QVdhSUt4VjlVRVZpQmFBVEpYYnJwWHhLNUg2K0FzREdw?=
 =?utf-8?B?dnlXblpiclp2Yk9YUlIyaTF1SDExN0NvclU5TjRrMVdOeFVGN2VNRndDOWFP?=
 =?utf-8?B?OEZkQUlQQ3dPMTdRVk9rc2c5eWZ0SEt5R0hrSHMyTkJ4WDc0WGQvREQzYUhI?=
 =?utf-8?B?MkhjMm5vTE5SekF5OVlIaFJIQVMyNG1VYXRhZ2FRVjlYT2FoNmxMMWJJUVA5?=
 =?utf-8?B?Titlc3A1UGQ4a25YL05CcVJ2a0Fvd3QrR3ZrRnp0YnRmTlIzRWJjM2d5VVFz?=
 =?utf-8?B?MFlYWEE2ckdwZzdhVU1ULy92UzR3OTRyRFpnUTVZWG9YaGJVdVdsWEhJSnFT?=
 =?utf-8?B?dGJFOWxnR0lGNnpTYjdaOGFzenl2bjlKRUxDVEkvUHY3VVIzSWpWT1lMaDht?=
 =?utf-8?B?SHUyb3U1SUk5Zm56aklUSUUwZHo2dHluN3ZZcEFLRWFlak1xdnVrcDdkYVRq?=
 =?utf-8?B?dFJJeFEwVWRuZG5Bc1pXeHQ1RHJMOWZ6dHc0QjFaNERkL0tuT09wOXo1NUVo?=
 =?utf-8?B?MkhXZFRCcE0rTEtwcWNOeThGMUJxN0NBOHZFLzNqMjhlYktiUzJpQ0NYeFd0?=
 =?utf-8?B?SU11K3phYkkvVjMyRldOOTFsQnFYZk5WeUwwMWxFd2pFV1hGRVRuY3ZtYUk3?=
 =?utf-8?B?L2pxbk0rTlBoZEF6N1hjdzdCOUozaC83S05jSG5WdGpnZ2d2c3JhdzgvNnMw?=
 =?utf-8?B?R3BWTHNHdlNoQTczNmtBUC84VmdmbWJoeXRLZTBQOW1TS3hldlQ2a3E5dWEx?=
 =?utf-8?B?aVZCbGE5K21OaHlrVE9hM2VyQnJzc0lZd2wxcDIzYVlEL3UyOUhVZUNBdHh5?=
 =?utf-8?B?TENSQWlxclFacDBWV0VSTVBiV3hLV0t3dUhxOG90ODRoRDRadW5CbklBbHlQ?=
 =?utf-8?B?U3c0eVVKR3hWRjNaUmxjbnBjMFpnOHNXeURmL051eW8yQ21HOXNwUFU0SkxQ?=
 =?utf-8?B?Z3FGT24xUHVFblpJei9IbU9zYXJoSmdXc2picFRxMHFlalVkbmx4NC9WeDJI?=
 =?utf-8?B?VnQxVTg5akdjYW83UjRldWFkV0dLcS9taFg5NTEvNGJSUGQzdnprWG9zd0kv?=
 =?utf-8?B?ZCsvMGZRMksyS3MyMnhvUmNFdktyZUM2S3ZORWRKa3RWZkdlTVp0cEVBRWto?=
 =?utf-8?B?SE1tcUlEajdybER2dGlsVGh5RmFlTWVNdm5oNUlQM0tmRVRpYVJhaURSTnA5?=
 =?utf-8?B?UndldlNmb0M1cTFaYWRlZnl5ZzZteEpJblVmZjIrWHlVVnZKYVY2WWFwTXpC?=
 =?utf-8?B?ckRRUGpZYlZZMHozNTRqVkRNUWxFZTVhTURRWjliMGFxNU1xdWpXTzBYOE5x?=
 =?utf-8?B?R25QM0xFTjlHQUNHV2I3eGZ6a2Q1MkVGcUdZaW5lNDQxYUt2RWFURFpBdFA3?=
 =?utf-8?B?dStySW45em1QUmw2cEhrWlBpNVJ5ZUF0ZFExd1YyVVJBTEhJZTlJK2J5a29m?=
 =?utf-8?B?RzNrZGVsL0VWUSswTTdmVktLU01QL1ltN3BsTkVjNWJDaXJjQkcxM25WVlpW?=
 =?utf-8?B?a09Kb3l2czF2Z21tU0xlOUk4dzFSdDByZ0dBbjNEWEluQ1JOU21TYWlHT01w?=
 =?utf-8?B?Nm9tc2kxSzZLYkgreUdGWjl5eG1BZWkzT2k2eGhYMFJCY0RkUUNvR1JWU2cv?=
 =?utf-8?B?V2RvNFZkVWNoVUVMbHU4dkdrR050TzNYUVBpWlM1cjVCN01PaXgzbWIyRVk0?=
 =?utf-8?B?SlJza0tNUk1JRkx2MGsvMzhWdkVWT2MvTHdGUHc1Z2xiSE9RSlNxeGlpU3Y4?=
 =?utf-8?Q?cd3k6/H7HUwah?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjlleWFINUxoUnZ1dHZoemZwaEc1bC9yK0ZnRDI1Tk5MNThFNzBEa2RWTmFs?=
 =?utf-8?B?YUNVWTVDTTVUZldqTGo3L3BoR1luNGFLM1VwOU14TWN4aDNISVRnWFJXZGF3?=
 =?utf-8?B?cFlHRVVCdm9yUUJIRC82ejFkVEl0RlhtbVZzZldyWUIwamVzZmlDemVxU2Jk?=
 =?utf-8?B?cVBjWk42NnBZSkJqZ3BMTzdyOXNxVWhveDJYZ2MzaDI2eVFyQ3p4Wk4rNCtx?=
 =?utf-8?B?OG5RMW81THpaRDBLMzMyZjRscDl0bDVGMGQ3Nk1hTEpveW9rUnBkMEtlYnNK?=
 =?utf-8?B?NEwwcHk1R3lrekcrY1NNZFRVMVYwSG5UeXk2NFkxQVNtNnF6OGpmZjdKWGlR?=
 =?utf-8?B?dnBKZEhPVzdoc2tGbHJLYjhTNGNXcW0rTE1weXY5bVUzeW9mbkJKc1VJcEVX?=
 =?utf-8?B?VkY5OWhmRmkzRVRFRTliMXJ3ZDRTa2xiNlM4andldUxPZGtXcktsSUNkZ3VJ?=
 =?utf-8?B?d3VJVituQm82TEo3b0xFSHd6c0JoNHhDanRmUVpuWnBsUTJFTnZFRG5RQ0Fm?=
 =?utf-8?B?QTViQlMwcVgrV3ltaXltTzJqTk1TOW13Tks1RHlFODdzbk1ySnJSaFArZ3BE?=
 =?utf-8?B?QjYvd3dqenExMkEyVExLVzBxSGJJUElaQ21Qa0c2MnNwWlUvalBlbzdHeU9o?=
 =?utf-8?B?eXdldkxmQitqNDVkbi9Xb01MNUZvL0YzQWRaQUQrMkZDeTdUWjczT2dKeGd4?=
 =?utf-8?B?VEFUZnBJS0hSNFU2ZGV2ZXVSOWNxZDVqeDJrak14NVkzV1pnczRyY0paM1dy?=
 =?utf-8?B?d25kQlhwQkVkckdSUmxRRGlwY3B2TWlMaVVNeTRuT2cvSmQ4SHo4RjdlOGJI?=
 =?utf-8?B?QU9hUWtrSEJuSkF0WGlzaUVZSjNNaU10RWd2NjlESXVFVFUwNk5xVStoVUll?=
 =?utf-8?B?WWNydVo4djZlbnNGbE1Tb0lQNkN4RFl2Z3FEbTV5YXFqQ05XTmVNYkhvaVp4?=
 =?utf-8?B?N1FLZGplb1g5L0VvTis0NkVZS2M4cVVvZnlhcWRmVmRWOE9Sa282c3hRUng2?=
 =?utf-8?B?aWRLMXVnTUUxaW5RUi9CdnYybC9sWWo0VjEyRFdleUNEMklLTE92N0Qwb2NU?=
 =?utf-8?B?K09USlphaVpKUjVjWFBrZk1HMTJwZ0R6bmlZTzZVYnpKWnVIUWxMUHNMVTdS?=
 =?utf-8?B?Zlk1N3ExMUYydWN1SFpCVWhSOVdyM0xzY3NkeTR4amFVbkFaTTJJSmd2VExG?=
 =?utf-8?B?Yzh1OHlEakdKUVdydkxZOEJGbGIrY2tIei9CZkh1dVArUzduSkJjUkpxcW1F?=
 =?utf-8?B?U3ZSY3hNUlJoOUdxK092KzE3VHE3dEVTQUlkMFFSdzdvcWhVa3R4Q3E2QmtI?=
 =?utf-8?B?SkI2QU5QNCtBMkdOZk53aS8xWTY5SHRtOGdzM3ZWc2w5Z08wUXZLakc2VkN2?=
 =?utf-8?B?dU90ZTE0WTV3Yk56VXdHbmZNZFpRb3ZxeEtFdVdvWXgxRTF3Vy94Mkh1bmZR?=
 =?utf-8?B?dU5QaDFmRTloOUk4WHlacVJUYlphSmVCVmkwRVBaYS9BWXhrdGNNa1RMNVJS?=
 =?utf-8?B?a3dlVUE4d3k5eVJXNHd1VlhPVkkwbVk3VGY4aFRHV21MZ2J4emNaTEhBM3dq?=
 =?utf-8?B?RWhEekxWTVQxYTlzV1VhemVCNDkrdFkxYmU5SjdlYzFSM1Nrbk1hMTRUSWI5?=
 =?utf-8?B?Njg2ejZBNTBZVEVjQnpMOFFScHhaNW90dno0Nlo1SlNudVVDVjk2WlEzdEFl?=
 =?utf-8?B?cEhtZjY4L3JuNEFhZVMwbzl3eWNGNWhvUklsbWV6MlZWNDJYOU9mR2FIQ2sv?=
 =?utf-8?B?b25SamlxOTNCeXZOQnhTNkp0Q3kvenpCUVZROVdtRzNxTUhhcEtad0JEa0F1?=
 =?utf-8?B?VzlZTklseEFScXZpS0VQZGNmTVlIaFpLL0J2dDRFSnZyYVVzbnY3NDV5NzhL?=
 =?utf-8?B?cG1Fd2ptTmJ4czY4TlNCTHFhbU41WXBpRmx2bEZjRDBPZGdWNHh0UXJSL29j?=
 =?utf-8?B?QmFFVlBMNmFhaU1janFrL3lBZ1NEM1BZcXpoSHFZT1hUa0tIaVpkMzdNNGtE?=
 =?utf-8?B?ZVI3dU9jenVSNzJydFBCQ2ZZMThoWDc4Yks1dXF1Vk0zaG9COE9FV1RPVU9R?=
 =?utf-8?B?c0JUTVAvRVR0TlN3bTlSWWd5cElIN3RaWWN4ZDk3REs1bDk0RktpdTF1THBY?=
 =?utf-8?Q?JEHP6oyYOT5siZxkz20fUECbY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+QWTwjrN443miWqmq873ycfzj8MqZjXCqZGHVe9VzjXDEXLdDvXmFK+bTUChPJg3qRG2cHqadLsjVB/NkvAAOs4VrjQW9lwoNpPtn5L5tu8jkv59psiloOZXj8Uxq9O4RwvwB27aN5CzcmeD+nwcTJtbJe8OHO0ls18MqYESa00PDkqZZxnseDnmAqJ98YSzx4Akw3Ln3Ld/Fi4tlSK9AB2vbm0J0lQnO5z2PfBu/pbRbsl1MlMMVQCXzvwulxOf/mOfCT4Uz1ar16lXla6ErhSiPhNJo6ajwNQVasIhzqoe0enze3CVQSwkFI8g+r23QvX5qK3CVv802YLunHcANsyK59JRjrx5LY781BErIuH6A4rNC6MCx8mjY5+vgbsgIwp+safMqy/PasqIC6tYZAIUFDUecSTD7LELnarfxd31j1BrHuIQqmJx0PWMTbOIZ2n6EH8BgnUgdZc7YozYxOoOEd5d3t4H8Y7N0X11e6a8uYXwW8b/G2x0TYuMNu+hY1O08EQeCtVT2diNaJK0HRbz8skkLpYfP9CEAyYDbx02siW2Rr9bHtxYCXuEDbnd+0EsrPEIjq9JzCUSzQ//C/jjqjKEzC+KkkevnEwu8RE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7365410-8ada-4c27-454e-08dd2fa9e532
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 06:01:29.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyrZyoIqED0xyLPxjHejS1fmIlOhE0QerNZ5kqG0HmPXv6zCxmMRbVJPDQJSs9bRYH0gbsnOMhQgL8nbO+GfCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_06,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080046
X-Proofpoint-GUID: ccYH7qMFeKOkhPl32bJzATxNLlwm0Xeg
X-Proofpoint-ORIG-GUID: ccYH7qMFeKOkhPl32bJzATxNLlwm0Xeg

You already have a R-b, it seems the code is right (woo hoo! cool), and 
we're trying to get a release out the door.  But here are my "late to 
the party" comments.  Feel free to ignore.

The names v1 and v2 strike me as funny;  they just make up new numbers.  
Not a big deal, but ideally the names might more closely reflect the 
actual version changes we're tracking.

Breaking the function out into a new "v1" version is some unneeded 
copy-and-paste code bloat, I think.  The function is kind of large and 
the only difference between v1 and v2 is I guess in the two, relatively 
short, "start" sections.  So, keeping this stuff as one function -- with 
extra logic in the two "start" sections -- might be more compact and 
clearer than having two rather similar functions.

On 1/7/25 17:44, Kris Van Hees wrote:
> Kernels prior to 5.6.0 pass 3 arguments (derived from the NFS hdr)
> to the nfs_initiate_read raw tracepoint, whereas kernels as of 5.6.0
> pass just the NFS hdr.

Is the same true of write?  If so, then maybe say so and point out that 
what we're really doing is changing the handling of nfs "start" while 
leaving nfs "done" alone...  that would correspond more closely to what 
is happening in the code, which talks of start and done.

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_prov_io.c | 127 +++++++++++++++++++++++++++++++++++------
>   1 file changed, 108 insertions(+), 19 deletions(-)
>
> diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
> @@ -155,12 +147,109 @@ static void deref_r3(dt_irlist_t *dlp, uint_t exitlbl, int addend, int width,
> +/*
> + * For NFS events, we have to construct a fake struct bio, which we have to
> + * populate from the inode (arg0) and hdr->good_bytes (arg2) arguments the
> + * underlying probe provides.
> + */
> +static void io_nfs_args_v1(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
> +			   const char *prb, const char *uprb)
> +{
> +	int	off;
> +	size_t	siz;
> +
> +	/*
> +	 * Determine the various sizes and offsets we want.
> +	 *
> +	 *     // Access these fields relative to &bio.
> +	 *     struct bio bio = {
> +	 *         .bi_opf = ...,
> +	 *         .bi_iter.bi_size = ...,      // struct bvec_iter bi_iter
> +	 *         .bi_iter.bi_sector = ...,
> +	 *         .bi_bdev = 0,		// -or- .bi_disk = 0
> +	 *     };
> +	 *
> +	 *     // Access these fields relative to hdr.
> +	 *     struct nfs_pgio_header *hdr;
> +	 *     ... = hdr->res.count;            // struct nfs_pgio_res  res
> +	 */
> +
> +	/*
> +	 * Declare the -io-bio variable and store its address in %r6.
> +	 */
> +	dt_cg_tramp_decl_var(pcb, &v_bio);
> +	dt_cg_tramp_get_var(pcb, "this->-io-bio", 1, BPF_REG_6);
> +
> +	/* Fill in bi_opf */
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	if (strstr(uprb, "read"))
> +		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_READ));
> +	else
> +		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_WRITE));
> +
> +	/*
> +	 * bio.bi_iter.bi_size = hdr->foo.count;

If "v1" is broken out, then this hdr->foo.count no longer makes sense.  
Plus, the comment is more or less superseded by the following two 
comment lines.

Or, mimic how the comments are handled below for inode.

> +	 *
> +	 * For the 'start' probe, count is arg2
> +	 * For the 'done' probe, count is hdr->res.count (hdr in arg1)
> +	 */
> +	if (strcmp(prb, "start") == 0) {
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
> +	} else {
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, 0)
> +		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, 0);
> +		deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
> +	}
> +
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
> +	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
> +
> +	/*
> +	 * bio.bi_iter.bi_sector = inode;
> +	 */
> +	if (strcmp(prb, "start") == 0) {
> +		/* inode is arg0 */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
> +	} else {
> +		/* use hdr->inode, hdr is arg1 */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +
> +		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, 0);
> +		deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
> +	}
> +
> +	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, 0)
> +	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, 0);
> +	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
> +
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
> +	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
> +
> +	/*
> +	 * bio.bi_bdev = 0;
> +	 */
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, 1);
> +	if (off == -1)
> +		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, 0));
> +
> +	/* Store a pointer to the fake bio in arg0. */
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> +}
