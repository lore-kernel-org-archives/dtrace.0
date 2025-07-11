Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F266EA59
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752209404; cv=fail; b=rMg9XYfo3GS+mfbuInlUtg/EX2SUXDtSqJtxbTkFqTT0XFTodPhog9+0Jbe6OjGhx0trDHp9glV9QJsVFP+pgTBdAxen6VtsqXm+mv7pY2jM+8SmIiTj7YYkR4rWGdZRAUljYBTtPWFIXO9FliVt37S/u/b9Ge4VaeG0MjEfZcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752209404; c=relaxed/simple;
	bh=LO8QlTVwhythdHBwC719z/GYtE7cP3EtVmZKUgdAPPU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HVWM3LA0eowpJb9W/ScR9fHlAr8F89TpIZoFqry/8AUkWvJpDHXifT8A5uifkVJkfvXKQR+9VVQbNox+H83kGdp+PTupgpT1hQXQGKJ3n+lDPQ94adbcWXvauapj4hBdCZzRiEqMG6WGOhPX/3JzJCldX9zeGuxvcmAB/2unIE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=sUGWx3Mr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qVLZSVCJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sUGWx3Mr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qVLZSVCJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B39wjS017572
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=bl9pdbJooTjtEmLepyiW548ZzG/trWreWN5YYsroXKQ=; b=
	sUGWx3Mruimf6e2esW+uTaFDrs8RUn9NJmQkZXlw3E/j5B8z1p70nqI4OE4J4drM
	+ba9uE+9d6xHpXbztLG9duW8w0EhvFB1VO/h9Gf4OzyKZvKmCRkVj/wjrx5jjiRP
	IYuU3Zp4Xo6TUc8ju4qe2gSINQIJKwtadvcirA74lk4eoZ66p+rTUPrH9MOxvr03
	IqcTuV5g2VAjTN6yZtHMcXvtQH/sIflnYVxCq2EGqZamXDUsAMQ7yW6u+JXtlmfe
	7WytB82ljpGdt/kRryKjZ7HYZl08SDev7tPZg+FkQLSm6toS5fiuFbVbP74PbzEM
	+nhtOTg9mjhyslqYxU+zGg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ttdug2gf-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:49:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56B2KH8n021391
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:37:25 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2079.outbound.protection.outlook.com [40.107.102.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgd2pn3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 11 Jul 2025 04:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGcCkVOCBbpPHdRx0os2o847Ujyi8kTD3hwkhXTfJzoiaLR+Y6P1eu/3XWT0UBKqcYNjgLSQIV5b+/gzH3NGcF9LbMaEX1auWW/otoxrVI2NRMsqyK9VHTYfmpg/vOhQ8loqdSgxnrDXEOiuCmKy64NdT2kn5XpBX3bduLAcTkSXqJ0jKHnEUldPoyinKNdyYrJeukAZv5Kn4Unt9JJN8K2s7LEFtZKBZ+rXUIy+E5tlkLcsNm7zno6EqeqraqTyV26vVRcIg0xfixaf4XGDcfgAO+9nQs07GycepbZ+6sSnAsIp+5lAa+2hSiADkbmw8MSck5XdVZ3UYxU/a3jxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bl9pdbJooTjtEmLepyiW548ZzG/trWreWN5YYsroXKQ=;
 b=yFu7Zrf9gcGTwH10rKtVLExo+kWayIz8wcVQqvjMb97UTcDx7dshxU7wZrjw5gZ2VriJoo5AU9OzePGHyCWjHrc2nWIAZmYGiNIX+BnZXryEH2mvLEyjWgF/pg6JKgkw2EXEFKOB0MqsMKz48WxLxBGV4OOz7uqQh6twWWYpPepMMiZl0AF8HymsEFb+D7H0ARl7IsEW3/oKq2GEDyGmH1grmWjHKtVjjCTcJYaTaMu85KfrEurgHpipis2lksmc6+2dEf6SpjXuceRbRBYwu+D63o05mssWcYWgAtoY6nQXrsQHgDYBEMNiLnMoMAwnWX/hnDOw1p/x+iINQNPE2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bl9pdbJooTjtEmLepyiW548ZzG/trWreWN5YYsroXKQ=;
 b=qVLZSVCJ/PcXP3fliqvVfmDGnx2vgnGUuXdlv/tUAGZbf/UOqY4AQn3Ne3+k/zUUygNm4gD8q9RLwFnSjH8mMroCUFe+c3jTSPb2sV39/7cERr7SU4YOkIO7iG5aIolOIKQJIn9lVi18XBFVE2dwcQgNhvjVd9D5ZyDtvtgDznE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5887.namprd10.prod.outlook.com (2603:10b6:806:23e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 11 Jul
 2025 04:37:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.017; Fri, 11 Jul 2025
 04:37:22 +0000
Message-ID: <39d2e33a-a486-2115-6ed2-b222ebdc2a77@oracle.com>
Date: Fri, 11 Jul 2025 00:37:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] test: Skip err.Z_no-w for now
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250708045257.13808-1-eugene.loh@oracle.com>
 <87ldoyev5f.fsf@esperi.org.uk>
 <4677a328-8622-794b-5273-f0aaa6d12032@oracle.com>
 <aG7/DBUnMDy1PVVS@oracle.com>
 <1333109c-48bd-8e96-b16f-0d264c950e04@oracle.com>
 <aHAexDy7Xp46/fES@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aHAexDy7Xp46/fES@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: e1779b90-0bf7-400d-4ca1-08ddc034a095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmVrZzJlOHdGaityMi8xYVI3YWc4NnFyaGRxRkxaLzM5ZXpxeitzdnltdjlo?=
 =?utf-8?B?V3lZRWhFSmxmSUR2bUttemZlNHdWWnJtSGhnZDlNckUvMnowSWlSc1V3NEtP?=
 =?utf-8?B?Qk9ZRC9zZCtQb0J4M1RBazFnK0ZQM3dQTTlLYS9oVmRDc0hORExQcFloMmp0?=
 =?utf-8?B?dXIwVDVkbTZHRGRUbFJ0cHpzYkZUbmhXTnZyQm44VG9NUU9QdlIyZk9hTzd3?=
 =?utf-8?B?N0FYWmZDbWpyalVhUXMwQjdENWJRTFRDaWsySCtCT25ZZC9ieDJZU3BlUE5l?=
 =?utf-8?B?b3JXNjhBNnBqTVNzRS82ck42djhScElwdlZudTJFZjBud0hQSG9MMUdYZWkx?=
 =?utf-8?B?cWtCeWZidFNUUW4yb1ZEcW5iNEwvWDJJL2lERzZBM0dIbjM2WnNIR1dzUmtN?=
 =?utf-8?B?OFRlMnVHMUhZZE9Lbk1YRzdWY2V1SEc2cHlLYWlJUmhKbmZFUmIrWGZBRW5y?=
 =?utf-8?B?cks3N2dTVDAvWVlSOStOQ0RWUDlWV09ZZmNqWDFJN2plVDNNUkJOVW9TRGNS?=
 =?utf-8?B?bjl0ZktueEkxTUpQZkRMVEF0SW8wTDV1Y3kyN2E0OU9QajFJMzFGTmd4UzN0?=
 =?utf-8?B?ZkdzQ0NlclZEamJhbEVvR2RvanVWLzFKYlBSUk91eTJHWEhjR04rSG81cFpq?=
 =?utf-8?B?b0ZnTExUdE5xUFlsZUVXQnZ0aGdwS21RTjBndWlvT3lNRnI1SFBwbDVaNE1F?=
 =?utf-8?B?TzlIVGowU3pYNS81bE5QZHE5UWR3azRwZ3U1MDFHM0s0QTNMZldrQjRwWFMw?=
 =?utf-8?B?YnlRVWxDYkNyMlhoK25jbkdTd0xpcjBoeVhMYTF5bGRZUDBPc0hoNEpMR0JM?=
 =?utf-8?B?L25UOWdYUU10NXZtbmhjM09xRkxaK080RVFkdk5SVFB0aThIYkdUV3VnVmhh?=
 =?utf-8?B?Q1VVY3FkUXVSVGFFZHYvUjZBdDhzQjl3SkpmZHRRSmhkR3NUYnNIZ1Vud0VN?=
 =?utf-8?B?Q1lrTVMwenc0SjVmT3pkZktQYzRNNDNLVWRTdjM5MDhtZDQ4UCswcUI2dCt2?=
 =?utf-8?B?S3pQODNuZW5udTU5OHJKY0pOT082ZE43QkYwM2JSOElBWDlGd1ZpZGd2Vktj?=
 =?utf-8?B?ZTByQ0UxSEdaOFVBMkhMWTlpMVBrWEphM3dnTXBBbDJuanNJVjVvZDZOS3E2?=
 =?utf-8?B?NlRJWkdnOGJiaVJ5VlU4dmpCUWY2Q1hOTGovWFdrMlRuc0lqUVFvaHljTEtF?=
 =?utf-8?B?dkw3Y3lsWkdDc056WjM1N1F5MXBrbUxXc1JSL3lWdG1MQlJmRldmdTRldE04?=
 =?utf-8?B?Rm9xeVZwUVpjRlJJUkxheW5OWEUyVlMrVFdyQ0ltQkMwMGUvUWpaZlZaczJz?=
 =?utf-8?B?RjJaV0ZwSFlNRGMrTlNYMVl0eVk0NHI2azkrNElSK1lnV1Z0OU1SdVpWWERq?=
 =?utf-8?B?d29EK3NvaWFGbEhmYnhpdGJHWHY5YXJoTXYvVU1qamsxVHQ2SWVZa3d6MWU2?=
 =?utf-8?B?TmtJaXd5M1Q3RlZuSlpGN0NiVisvSU1qWmJkR3hTYUlCelh3cWVhd2RaaEJn?=
 =?utf-8?B?bTh6ZnpDSXREU01DaHZqRDJwVVAxY1JwK29UcGpOYnpJVTlnNlo3cWUrMFMv?=
 =?utf-8?B?MFlTaUFtN0JXSHF1UkF0RHhQazlIZFZtblQyTyt6ajVTZlp5UThTNzRSUmxO?=
 =?utf-8?B?a3RGZ0ZOTEpQQnNpbmdkd1lLMjEvSEllOW9hTXZOaUxVSFVoNjkxYm5ObGpW?=
 =?utf-8?B?UlJMVTF1RU5lMVdURjFYdnA3WDRTempQaHBEVUJDa1ZsRHlSWjVsbVIvVXlr?=
 =?utf-8?B?YmZOSDJIT1BxMTcyQnVDZHA4RkJtckl6QWdFU3I2aUxIMG1VNmJCOUlGY2ox?=
 =?utf-8?B?MEFmOWtUd0UxUXU3TEFNNHovSWdTNGkwaHNXVysydmZTOHYwSDIyVmpxV3Y3?=
 =?utf-8?B?Rk14aVAwdG9yNk1zOUx0bldrYlExL2xoR1dTRk1Za0R3ZnRncm1TbVRnRks2?=
 =?utf-8?Q?UlUjSoi57ww=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFN4V2xNZzNaSlI2UUovdy9aQ1BQQ21WQ05Kc2tyNFk0UDJ4U2E0TW5QcXFQ?=
 =?utf-8?B?Z2tTZWpMMVFlb1hxQU5EWERCYXJiTUZjWUJkS1NqWEhYczloeGIrakZLdFRC?=
 =?utf-8?B?ZnV2aXlhOFR0bGUrd1BqN3hKbEJGMDdIRElPUE9CSWR6Y2l2SXBEcDFrQUJD?=
 =?utf-8?B?OVpZc2Qzck9BSlhCUThYWFlSMi91MXJTd3FrQVA2YlU4b2p2M3pwWHZvMytr?=
 =?utf-8?B?U0dFaXdZYloxcU1FdnNjYkNyWDhwOFN6TlYwanUxMzdWUTMvbVlvM2hCTnVh?=
 =?utf-8?B?RmY2cE45MU1NOVg2WDlEL2w5Z2ZzQ3JyYnNxOHJSSHJaOU5KQzBkdUlDcHAv?=
 =?utf-8?B?c2cwK09qUk1XK3pWcnhpNUtFNXVjanpMMWtHeFJpcGM3L0lCK2lXa2RuTUhx?=
 =?utf-8?B?bzdVMVVidHVoU3Vna0w3aW50Wmt0NDZ0Ymg1UlBKeFlQSVMxa1F2T1BOZitv?=
 =?utf-8?B?K2IvRFNBYTVJQ1BneDlqbnhjVUcvNTEybStOUExQWElkS2ZsLzFLdWd3SHhD?=
 =?utf-8?B?djNGbW0vL0NSYmd3b2V6Q2VWZnYyUGd6UWIzS1JvWFNHNVRJWHM4Ulc1cUpt?=
 =?utf-8?B?OXkzcHRaTTZ1Zzk4SGpDV2hyYm90VlZhaEJtalJCTktDejl2TEdJdVU1eVdz?=
 =?utf-8?B?MVRVSXZQc2lGWEFLaThqYnIrbWcvK3B6ZnlTM0lQRVROVGlSNk9GT094Z1lN?=
 =?utf-8?B?UE1sYjhEOXdhM2xUS2d0eDNFV2lKajRndktuWDFBS0ZJOTRkQ2drY1g3WHpF?=
 =?utf-8?B?U0pEc3NiK3QwbHBKelI4bHd3YWxoeFdpU2x5SG9pSUVZby96RHlTODRqVEV5?=
 =?utf-8?B?ZHRxNUQyMENTWnAzTGF0ZHFhNDRIV05qcVkxSU5taHZJUjU3aG1FaVJ6OGh0?=
 =?utf-8?B?Q3NqMHp0dHROdUNFUndsczAva0Y4cTBqWWY5OUk3KzNjeFJEUWltOTNNRmtR?=
 =?utf-8?B?bVlPNUtjbVY2ZVVGcVlLTTlRVVNNU0t1MTNqd1NTNGdsS2RkQUJWcHZSMSt3?=
 =?utf-8?B?Yk11UExaOC9XSEl4V0MrbEZJYU9td2J5OXdXWnFKMCtGbTRwUC9YTS9yc3gy?=
 =?utf-8?B?T1VEN1g0alJhQUdvNzJacHU5YWR3bWNjeUFvREpKa2s1K1hwSGpGLzM4VEVF?=
 =?utf-8?B?Z0lnaTZzS2JHWE91MFpuUDNxQ1AwRVhyL0RiNTJUblpyNUM5VWY0TElyN1JV?=
 =?utf-8?B?ZXFSWEFaNGE1d25qSllBd0NZZ2dDYlVzSDRYV3dLZW5DbkJyZUxBMWJob1BB?=
 =?utf-8?B?MWNHRUIzYlZQdjBEUDVyMkRCT0hwZTFpTnorak1JWjdNRGhtL2tBb3hseTQ0?=
 =?utf-8?B?NzRiNTlNR2JORm5MVVB4L2tWVlArbXl1OGdyV01zMEpmaVl3SkFPNWZZV2RU?=
 =?utf-8?B?ZWJ5RFJFODM0QzYzU29CdXFVNnFBbDNwS2E5Mjg5L1pIQ2ZBV1FidklWWkpU?=
 =?utf-8?B?RnROVnBJUmFGYXVlZ1poL3lxRDlqVFF3eGNIbnJvYmlqbzQzeHg0aS9KcHZX?=
 =?utf-8?B?TUJuSkZFeUQrbzlhenRCYXY1eDN0MnRSTzVPMU1EYUtScjFVRFBTOVNDU2Zm?=
 =?utf-8?B?QU1HWnhsamdKelFxaUhHSWFla1ErcTR4RkVFektvNGR1L0ZJUWFEVHFQdGNx?=
 =?utf-8?B?Z2xZcy9GODZrR0dMTXZYVENSeDBJQmdyVU1NanZUQi9JdlI0c3F6U1VaT1V6?=
 =?utf-8?B?djdtMUd4aHN0dVpRQlVkczI2WVR5aVdLSDhidG9UQ0M3WEtFcFc5R0dkVHd3?=
 =?utf-8?B?dERvWE9CL09xUmRJMDhwQTNSRFhHeHQwWllhbDh5ZHZkeGhxK01ZUlllRXZM?=
 =?utf-8?B?R3pPK3dyK3BmZldjeklOTEtYYnFmdWlYUlBVTUZiQm9TdFdic21hdDdWeVlC?=
 =?utf-8?B?YUR0aVZWWjF3OEFRQUxXSEdPVG9vdUpBZVB3TWhoTC9ieGovWnRiVG9jUXkz?=
 =?utf-8?B?WlpzaGNnQ2x3N1dLa2hvbGRBd3VKRGh2WndkM2p3RXZJenZNRW5HTVhYdHU2?=
 =?utf-8?B?ZW5aaTRaS0V3b1M5UW91YnpZcGU0RW0zbEYvcnkzNlVhdVRXOElDV1FaaXRZ?=
 =?utf-8?B?Yy8xdUwyVUtEWlByQXBXUTZ0VkdhcENsVXZ2TVZyREZYalFJTG5penB0WTB5?=
 =?utf-8?Q?QJgGUmipVyaUrOGUDKORzRvCK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gO5nzgcfqatd5Fw7ipyGJ8W3sI5luYyY350fBAZqwAuGKnPxLqbiNGigjlLGb3T6+6xjjU164V8ZUlQwJNlC3oFuY/t05w2mKlCD0BVZhLQLxeGNr3w6ac+rS/kHtQeYYP7EyGAy90fKgaq3B2zlMUXt3imb9uAws3Ld0SfvIJljeFIwVb5MW2t9HRYkqk5oIOLfMUGrp+afp+ffQBMEEQtdznYAeVvMrvXqJDOAiltI0Eyoz10XJtFLerbNq+l2rjaTgwVfk4tIqJC4dp1yaecF1u3uaB/pBdncmGNG5xbvZycf6FMaREgUht5CC2vKcwUTqqCPyh09ybGlBeqyYVEjtxDUf3BAGQnsJjoTLGOfVmo1ovhSB4U1B01uNncW+ZZ0w11+2OKw+qvuIJ18YvmBAJW4BosXjZn+K9r7UpkJ+/IlgnltDmoACS6xjQV3ej61HS7hy8tBAx9+D64Q5ZNtuBVdoEPEwUSHDHfcV/BcWW4dtWnBlanBkTYjdWLC3LxD9ZR8G25OS07gU9sH5LTyjhaiZ6xNvE5QxHwM3UjzaBgdoNAYvt92XO82wZOmG8rZeNBQF9Z2e++g6urCp1iiUauVr4xMgROZbDuGZh8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1779b90-0bf7-400d-4ca1-08ddc034a095
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 04:37:22.2732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFX/CWUjY+JN+Lbv7hNZ9hPDR6ze81n6/LC35emzp6q+FbVTG3d++b4c3iiTAcVOQKIIIpn5dZkXJQXXjt/4gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5887
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507110029
X-Proofpoint-ORIG-GUID: oEdGiowHFNR5sq_ALw0Oq_WFbGIOwedc
X-Authority-Analysis: v=2.4 cv=T96MT+KQ c=1 sm=1 tr=0 ts=687097f3 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=iySi2A4n-QvR0VO7T3QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDAzMSBTYWx0ZWRfXy2oO3e8bG0qU 1dBpq/wcmDY6caEBKjA3CBiZG1IvEUiNVG1OjZAQtmcDlAYrSIkd72DAcEwaAG8uBFPW9MewujG 3eWEBisEMja+pQKnPZr4SzLAzvqh01/AMcORomIXlz+s6K4o5Wh6JlsvvNbRL43mUx7JRwcO07W
 obnoU8OXaluPe9x7XsHUfu2e8Y23bTR5SKo8NgkdMSDuEfj+SLyCq/jRG+tnmHRery8RHqyo/Pk fxg2ABE5glbA6a2TzYPJpcFvcPuW94pUqxNZVRV7SzzOP4thqqvM6Zq86hznWQjPJg9nGjMhGCN ME3StWzFo9sd90RmcQBt60yuoveCh7hgGHk5J+EjMVwXBeYETxvcoY7gKKQXb6jOsq4xs6nsKhu
 6ExoNLd4HqSqFepW7MbLcbVRr/ssAIVUvIS/3Chv5g0j66q/uOOm+5Oj1Z7MhKuqnQAlhTgb
X-Proofpoint-GUID: oEdGiowHFNR5sq_ALw0Oq_WFbGIOwedc

Thanks for the guidance.

Both approaches are "fairly easy."  The thing about "the first option" 
is that it not only departs from Solaris behavior but also from our 
own... in the sense that a number of .r results files would have to be 
regenerated.  Not a huge deal;  just another evidence of behavior change.

So I'll post a patch using "the third option."  If there is sufficient 
demand, I can supersede it with the other option.

On 7/10/25 16:12, Kris Van Hees wrote:

> On Thu, Jul 10, 2025 at 04:03:01PM -0400, Eugene Loh wrote:
>> Okay.  I'm withdrawing this patch and will post a different one in its
>> place.
>>
>> Your first proposal sounds great, but I'll go with the third one (which you
>> recommend) in order to mimic Solaris more closely.
> Actually, looking at the code a little bit, I think the first option may not
> be bad at all.  We can introduce a new error tag:
>
> 	D_DESTRUCT	destructive actions not allowed
>
> and report that one from dt_cg_clsflags() when a destructive action is being
> reported and destructive is not set (in pcb->pcb_hdl->dt_options[]).  That
> seems entirely reasonable, and while it is an enhancement over what Solaris
> was doing, it is also something that is simply possible now where before it
> was not really considered the right thing.
>
> Even if we eventually support pre-compilation, I think it would be reasonable
> to expect compilation of script swith destructive actions to require -w, as an
> extra safety (requiring it both at pre-compilation *and* execution).
>
>> On 7/9/25 19:45, Kris Van Hees wrote:
>>> Yes, this is a bug.  Solaris (and DTrace 1.x) would load all the DOF into the
>>> kernel, even for probes that are not (yet) available (when -Z is used) because
>>> the discovery of probes happened at the kernel level.
>>>
>>> Since we do it at the userspace level, we do not load BPF programs for any
>>> probes that we cannot attach to (yet), and therefore the destructive action
>>> condition is not detected in this case.
>>>
>>> That is obviously wrong.
>>>
>>> There are a few ways to handle this:
>>>
>>> - Report the error at compilation time, i.e. if we encounter a destructive
>>>     action during compilation and -w was not set, we report an error.  That was
>>>     not really a valid way to do it in the Solaris days because you could compile
>>>     D code and save it, so you wouldn't want compilation to abort due to a
>>>     destructive action because you didn't know yet if you were going to use it.
>>>     We don't have anything to save compiled code right now, so this could be an
>>>     option.  But it would change the error from a runtime error to a compile
>>>     error, which is a change of behaviour.
>>>
>>> - When we are ready to load programs and start tracing, we can loop through
>>>     through the compiled clauses, and if any use destructive actions, abort if
>>>     -w is not enabled.
>>>
>>> - We could have destructive actions trigger setting a global flag, and check
>>>     that when we start loading programs for tracing.
>>>
>>> I think that the 3rd option is likely to be the nicest, because that flag can
>>> be set during compilation, and if we ever implement something like saving and
>>> loading compiled programs, this would still work fine (we would process BPF
>>> programs that we load and set that flag upon load if an instruction is found
>>> that amounts to a destructive action).
>>>
>>> Thoughts?
>>>
>>> On Wed, Jul 09, 2025 at 06:39:31PM -0400, Eugene Loh wrote:
>>>> On 7/8/25 08:15, Nick Alcock wrote:
>>>>
>>>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>>>> It is unclear what behavior is desired.  For example, consider:
>>>>>>
>>>>>>         dtrace -Z -n 'BEGIN { exit(0) } foo:bar:baz:bop { raise(SIGUSR1) }'
>>>>> ... isn't the lack of semicolons here a syntax error? (Or have I been
>>>>> inserting them pointlessly all these years just because awk needs them?)
>>>> I routinely omit semicolons.  Okay since even Solaris.  E.g.,
>>>>
>>>> # uname -s
>>>> SunOS
>>>> # /usr/sbin/dtrace -n 'BEGIN { printf("hello") } BEGIN { printf("world") }
>>>> BEGIN { exit(0) }'
>>>> dtrace: description 'BEGIN ' matched 3 probes
>>>>    CPU     ID                    FUNCTION:NAME
>>>>     51      1                           :BEGIN hello
>>>>     51      1                           :BEGIN world
>>>>     51      1                           :BEGIN
>>>>
>>>>>> The first probe exists.  The second one will be ignored.  Solaris will
>>>>>> reject the script with:
>>>>>>
>>>>>>         dtrace: description 'BEGIN ' matched 1 probe
>>>>>>         dtrace: could not enable tracing: Destructive actions not allowed
>>>>>>
>>>>>> On Linux, we have:
>>>>>>
>>>>>>         dtrace: description 'BEGIN ' matched 1 probe
>>>>>>         CPU     ID                    FUNCTION:NAME
>>>>>>           0      1                           :BEGIN
>>>>>>
>>>>>> Perhaps both behaviors have merit.  For now, just skip the test to
>>>>>> avoid test failures we are not ready to arbitrate.
>>>>> Does execution fail if the probe exists but there's a BEGIN that exits?
>>>>> I guess so.
>>>> Right.
>>>>
>>>>> So the interesting question is: if you start with -Z and
>>>>> specify a destructive action in a nonexistent probe, and then a
>>>>> USDT-containing program starts up that provides that probe, what do we
>>>>> do? If we don't terminate, that would be surprising. If we terminate in
>>>>> the middle of execution, would that be more surprising than checking all
>>>>> bodies at startup and failing early?
>>>> I think I finally understand what's going on.  The point of this patch was
>>>> to move on to more urgent matters, but there is maybe a bug here I should
>>>> fix.
>>>>
>>>> Solaris rejects a clause even if it's not going to be used.  E.g.,
>>>>
>>>>       # dtrace -Z -n 'BEGIN { exit(0) }
>>>>           bogus:bogus:bogus:bogus { raise(SIGUSR1) }'
>>>>
>>>> Solaris says:
>>>>
>>>>       dtrace: description 'BEGIN ' matched 1 probe
>>>>       dtrace: could not enable tracing: Destructive actions not allowed
>>>>
>>>> Nevermind we do not use the second probe description.  It's a baddie.  Our
>>>> Linux port has no such complaint.
>>>>
>>>> What about the case you propose (which is, after all, the question being
>>>> addressed by this test)?  Well, "it depends."  Put another way, we won't run
>>>> a destructive clause without -w.  The problem is that during discovery, we
>>>> might first encounter an is-enabled probe (which we "enable" since it's
>>>> safe), then later encounter a real probe and reject it due to its
>>>> destructive clause.  If you squint just right, you could see this as being
>>>> not incorrect, but it's kind of goofy.
>>>>
>>>> Ideally, enabling probes and their is-enabled probes atomically would be the
>>>> right thing to do.  That's a tall order.
>>>>
>>>> But falling back to the Solaris behavior of rejecting destructive clauses
>>>> without -w is the right thing to do, even if we are not using them (yet).
