Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB1B640
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755061313; cv=fail; b=X6k+stsHrG1IsX+PXj0a5PjasjXfqZYnC+lJ3GAyNp1vNTc8oG7j+j969Fn1k8q8aqImhGrVmGb8JWmxSoo7To3HX02bmAOyFnUtbQrH8BNZvjGdm8JTNvguIn5HOzK7aE5MYVm0MaUh3ogItYMl8EOH7HhCgiQknxE/1Om30Cs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755061313; c=relaxed/simple;
	bh=/Fy5kB/LhYoyOW7cZRK5V1OAmA6zr1USURkdELiguko=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=O63LSaBMQJWz9oEFqZ4vugSglMY44VTGY4/lHJJ69msSJ0tCHHBdwfK0OZ00l/y1Ds8ek5z3lM3yBt5tUPcNxGaViLnlXrrkV1G4VuBg9X0kEWGU6iaT1KOSzF1iOwKWIjTxwMCweYeRgonInuMwGm8s/H2UwaV7F8abHhWfvuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=auc9CYYt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TL3u76Z9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="auc9CYYt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TL3u76Z9"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CLQsKi019125
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=rRz3MnGwUExFMlBU+D8EBhQTcPNkhTlCb6QcJF1PFrM=; b=
	auc9CYYtLXcn1SskCPRDzQLqntcXE+42YIn9PlXlqZgOnfDvmsQG+BPhyUxeSWJn
	AdxW1iB/TDJXk71St/kpkAOedFEarMGIRLhcumTsLjgrX6ZJALSWjrCN76t0Eq1e
	NQ4gt5yO8pNT5exvEOLQiBXsLuxVhP6fDAvwbXpWq73GprdUssx9izVh9wl/WDNz
	WReIyrNutSpEHiknPhBATjMzIdUNJBVbi1xF85eH1Wc7Hir636+yVXG1y8MX83os
	HcfV2IUpDHUXzE7Rxp3DPipUhWE1ZHm25P5rLDButU08TGaKPgeOlNpBvBBLw0ue
	diK3axoGoC420zhUQxSeAQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dw8eedau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:01:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57D2hPZ1017414
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:01:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsavf49-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 05:01:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ay/D90CaouZdUB1WKXm/r1WzCpiKF/8ysffi7ih/1p8UfgyrUei3ttsHFNQjg8u5/G0vuJRNtosDNcr+1fVXZu4oyRIJNhsdNVNeOXyk3GXwOv1ZCNBq5D6IQJpblKCCatdsOBbptDEfwYFi80ZxULU8wGuFHmUrVNlf3hh4CPzsetRdS0tuWqPmAMcEONmPlJKzsmtc3jCCvPD5py5vurrqRMUlUJZYC/TmASQ5QVSfqwzZabH190RIIZ8YBrWvPAQXnMEix3vSZVoSUhsZsFYF9IFNOKuqUCaHVFghdHhG7WGqQGFS6NTkrOigoARlKY+5ezDjSBLnLw+1z/vN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRz3MnGwUExFMlBU+D8EBhQTcPNkhTlCb6QcJF1PFrM=;
 b=sQ2nk3hwGnTd4KCNRnsnOCTzjTQ8mOG/gFt+IJT4PcdStd721vQOrJm21qrU/conc7OzbXD6Ppn8R+1gbJ5P28wHvWkrbGzRjdnUDQKgVgpgheiYoMgFb0aUkOY/2EbWHHQua3b0JwseDGmDLazISaVTqwu7Y7cFdRGwhKULaGD31DqAzoezv/tVpV/zyo7yhLbsPZbBe88bxHJoBc2XQ7Qw3kbenRQGiJfUHHcEJH3SW2+KQzr17wu3XRjuev5zjSU+PWVTZwW37+cI7iZ5pCgR+56vYEdXI6zbP6zvPv0JR21CGo0SY2zvc/TPMUEW373WL18hcRPbZpJtKZoiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rRz3MnGwUExFMlBU+D8EBhQTcPNkhTlCb6QcJF1PFrM=;
 b=TL3u76Z9C5reqSgN5Wq6Bewu0k/G9HsoSCirynIQAU51P0QaU6u/0Dzj+KerE+xj4mAL24GoR807eaOhpFwZVQnH1GXg8S+gItVY9BTNOSPUKqOtKnnDQWtb613IKXxv4ma4j72bHTAciVuLGOGtvN8l6wCNTvz/HfWI1yKfoAg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB5819.namprd10.prod.outlook.com (2603:10b6:510:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 05:01:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 05:01:45 +0000
Message-ID: <9d6a371a-3b1c-b2c5-71b5-fabb9d8edd40@oracle.com>
Date: Wed, 13 Aug 2025 01:01:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2 2/2] tests, actions: fix tst.symmod.sh
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>,
        Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
References: <20240131141306.355929-1-nick.alcock@oracle.com>
 <20240212162131.136636-1-nick.alcock@oracle.com>
 <20240212162131.136636-2-nick.alcock@oracle.com>
 <c1d9bd72-5e76-ec2e-61e0-ed9a68b07850@oracle.com>
 <871q9gl5da.fsf@esperi.org.uk> <ZdTWzXYTTvKBfKiC@kvh-deb-bpf.us.oracle.com>
 <842b8662-978b-fdaa-986b-59b350b56ba2@oracle.com>
 <ZqQqQnrUsB//0mNx@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <ZqQqQnrUsB//0mNx@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:408:e4::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: ef03e1c5-3351-40a7-d6a4-08ddda26802f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NE9LRWtCWDc1YkpER052TGNsc2lHNGppZEFSS0RmREl4NmlVS0piWDhEcEt0?=
 =?utf-8?B?cjhJMGoxUExmblBBVkNMcTFaUHppY0VGTDVHUDZZNFBDdlVqQ0xwMGQwZm42?=
 =?utf-8?B?Z1MzL2NtdldZSjlMM28zNFdrRU9OQlVvQTB4NkNWMEF4RDdzcDhWVW4zbVdZ?=
 =?utf-8?B?RTZPZUdTNEJEelBYY3pIYkh4Ty9ad1VkdUxidXVLcVBRdktYTmswMDRzRnRW?=
 =?utf-8?B?dDhGSVM5WGRqamZpd1hRTVh1T3RGM2RDd1VSeDZrYVI4cERqRDRtVUR4N25K?=
 =?utf-8?B?WFljVHRQYnRVVHJmN1NQWiswbXIvZ29SZ3RpRjcxMWQ5WGExN3FiWktXZ3lP?=
 =?utf-8?B?MG9LVk5YVlNOQ3JjNmJRTkZHZFVtVkxLei9TT1VZTkNEcTdyUjl2NlRHL2tO?=
 =?utf-8?B?c3IzbnR1L2NWVWF1Ukd2eU90eUkzRXptSFNlUFJtRHczWjE1NUMxQUZIbWRX?=
 =?utf-8?B?Q2Z3VlpCdnZmZTRlZmpHNmNuZC9uUDJFVTNGc2QxNHN0eFpEK29CblA2cXJX?=
 =?utf-8?B?RTZ5bHNBU21nR0hRbEp0TkZYV09VN0puV09FeGk3TVMyQWpUb1dmMlhoUVBB?=
 =?utf-8?B?Qlh2K291WUQ0NnptYi8vSHgzSkxDSTgrWndGUnIxQUFZZnBQQU9iSE5paDV3?=
 =?utf-8?B?WFF0MmFKS1B3bXpsVC9nS2NmSUxMYmg3TWF4M1NqNlRTOERNRTF3Z3FwaTNL?=
 =?utf-8?B?SmVYMkd1eHBIY2lna2NwOG90MHgrUHBNcGt6UHIycXRzWFhpWkJTcTlRMlRr?=
 =?utf-8?B?dGxUZndPQ2F1YmlvcWZLWkxwZDA5RDlGM0pJOU5Hcy9QQlB3MGFKN0FiRG9L?=
 =?utf-8?B?cjJ2VkRlOW1RMTlzUDlESE1CdTZGcGIwQW1wOHVyNUtubDMrMXdqb2pwa05X?=
 =?utf-8?B?L1BnWkQyUVp6YlNvdUFIcHNsTGt1ZGtBMUh0VThmQ3VxdFNWc2FJOUlFMHMr?=
 =?utf-8?B?ajFXNXJ3Q3hFNDZCSUFSM05XamtPcWlaUE5yc2tGMkdaN3hxQWRQb3djaWxK?=
 =?utf-8?B?Q0UxYjArdlJFS044cGZ3c3B3TkVaZ1M0N3Z5U0VWMjV2b2lZY1RqdVRsdmxo?=
 =?utf-8?B?bk95UlJmRlZ5K2pUTi9lN3NPeUFuYkZwYWFhMlZsVHowdVBLcHh1R1NoSnVS?=
 =?utf-8?B?dEtIdytjSUM1RjFTOGdvT2E0ZHFoUnFKcFYyY0c4VzRpMnNJWlVOWHpFcTBO?=
 =?utf-8?B?ZTB3QWlUNUhhTnFsVHlxQlV6ejhyWnJtTGNNYkZxMzNPa0hpYnNTTUlKdlZQ?=
 =?utf-8?B?ZEo5OTZuelNOTUtZUnRyOUVLSFJOQ0g4a3VwOW9aRzU3MDZ2Q05VQ29IcDgx?=
 =?utf-8?B?R0ZMUDNYU1BrdVlmMkp1clFpTWhyUU1uUjAwaGZ4UHkxdm5KK3B5ZmdTK0NH?=
 =?utf-8?B?MzVnN0NUSkZ5ZUxzQVgxUmhubHJ3dkN4RDhKcGtoQzZiSWo5MzEwdlJZNGw3?=
 =?utf-8?B?RDBmTVRqNTBBMXRsa244U05qRG81N3BNalYrdFBjeUhvVXdBcmUrMFRWTlNi?=
 =?utf-8?B?LzR1THYrU0RKTEkxZHRxZHhaQ0EwdjJZT08xYkNxdm5HTEU4b3RHalg5Q2Vw?=
 =?utf-8?B?cXBHQ3hGbDJJTzI5MHkwb3hSZkpTcXZNaWo4cm53bnNuR1NKcHl3ZkY4TTdZ?=
 =?utf-8?B?dGxpOHVqWVY5d1p2aFhDNlJPQklHcmxaS3hPbkU1bEkzVnE5d2ZxSkU0Mzh6?=
 =?utf-8?B?Y1p3d0Fnb0p6ZVNtZVNBZXdiaU9jekVHb0p6cnlRN2s1Rlg3d3drWWl6Qlhu?=
 =?utf-8?B?K3RlYjlTTDJEMG5sRXZrRzVjeC9RalpzNTYvM093SS9jd1lFYXBoZmx2My85?=
 =?utf-8?B?dWc4SkNLSjdkZGt5aC9JUGFYQlVRYWkzZnRQa2JYNWVVa2FKRkNzeVVIVDhh?=
 =?utf-8?B?UmpHSzlPVDhybXNxa05iQjAyVnZNQTV5b25lQzlPZ1AySDFGWncveEJ0WXJn?=
 =?utf-8?Q?ZzAWLwc8nus=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWdkdDZKSnB3akdkR1FsYTZ6eUZDWFgrZ0MxUkw5MG92YkFQTGh1OUp4QS9B?=
 =?utf-8?B?VDJQR1h3TXJJZlhwSkZuVDFjTTdORWNDOXNqZm9ObE1MZlBESm9WVWVLQU1p?=
 =?utf-8?B?YzVyZllkTHVOMXpJTW54ZGkxOE1DbkQ1ditRR21qd281SFBWaDZUR1JBVWtj?=
 =?utf-8?B?bXZKa2JUWWN6N0FxWERZTHhQTHdnVEVOQ0FnWHdhc2QwNUZkOVZod291NG5v?=
 =?utf-8?B?VE5US2xYdnROelE0Y09XMGJIeENUdy9rcU9xSXJLUGhEdkV6TWVLdUdjb2dG?=
 =?utf-8?B?RnJlck0vU0M3Z2tsblJWc2kxL1Iybk1oc1kzdVlucERYN3RwZnE1WE15MDM4?=
 =?utf-8?B?amJmQnVsaldRY3N2REVQWEJLQVBhSFcwdG1MYzZFdjhucEhCdVZlMDR1WEo3?=
 =?utf-8?B?ek1XOWh2WFZYdTM1TjVGaTdOdmlscWpqYkN5ZGxHME1WL05WdDdTSSsraGQ4?=
 =?utf-8?B?VU9teGxJTUZjd2ZxeDlkdUtpUjNsNkxlbUNudHdTNWFrdC8rMzd0ZzIzSndM?=
 =?utf-8?B?ZnBxb0NWZGNpSG9YT1NBaXJzZ0RxNjFNQlpQL0sxeThueExHMUgwZGkzbktw?=
 =?utf-8?B?UWlXR1EvQXRrZDZMTkVEYnhDU3NZVzdJV3ZtY05aR2l4ZCtYamJkSjVFTTVB?=
 =?utf-8?B?UGgrU2ZGRDJoTFYwVmdBN09tZDZpSjd2a3NmRlNiRkxUbjZ3SlVJWm1nZlhJ?=
 =?utf-8?B?bWZIendEOVhYdG1CeUkwY24zU05zOUYzWVQwM2N5SnpBMjdxTVg1NS90M2NV?=
 =?utf-8?B?WG5naVg0WTZSZDFGR1c1cGZlOTBUWURRRWE5Rkg5aUE5dkQrUHhobEZ3Qlh3?=
 =?utf-8?B?TDBaK2pzd3dQZUF1QXZsV01ZaFFoemFlaXJnYjFMeEl1WlRJZHQzaWVJK1BK?=
 =?utf-8?B?a1plZ2R3NnRGR3BSaW14RG1xN20yMGFDNVVKcUJVMXRnZWNkeUd3V3YzVmJH?=
 =?utf-8?B?QnUrTW9MYzVwM2RkeGRMSmFZZGJBbzlSTkVOWkUrSENnTWQ5am9lMW9jWDRi?=
 =?utf-8?B?MVlyamRQcTlUYWFsRU9RSUZHcFBiclpLbzhyakpIOG53L3JqNWRBLzJQMVpv?=
 =?utf-8?B?dzJNaE1wcFA1WjdSOU9qQ0YxblJ6WHRGb2xaTVNPVFFqWTJrMFJUTVdwblhH?=
 =?utf-8?B?anhvV1RPM1pOeWQrMC9HM0plQ1VKQmZvbUw1K2NMajdhRk5kWjYxSXpkOVdD?=
 =?utf-8?B?ZE9PQ0NlN29maWNqZWJEVlIwdk45dXdHaUgvdzlWWUZGZUpGcnRWY2ViU3FV?=
 =?utf-8?B?alJtZC9Rb3NyVkxXeG9ZNTc0a1ZiNEpYMXllcjdXd25qRGN0dUMzaWRXUUlM?=
 =?utf-8?B?T0FXZmFGT1JtWkFsYW5RYytVaC8zeFhQeWRFeUFaODN1T3duRGlGeWhiZEpm?=
 =?utf-8?B?MDkwcUdSa2F6OWYvUnAraG00M3pYVTBDSW1KOU9PSWFIajRxbnkzdXpodkQ3?=
 =?utf-8?B?YTZES1FmcmdGRk9sWm12YklLVlRDUkp1YVZDWGttVURDY3NQcFJCMHN6SFJZ?=
 =?utf-8?B?SzRyMDZIMVdPcWF1VkR1MS9tU1kydXN5ZHRxajF0aGRrTUVoTlRmaWVSY0tS?=
 =?utf-8?B?Wm9mbVE4WDhERTRuNnQ0UkFJbitXK3VKbXhWSktBbXlEL2ZtSUNEOUFNZFA1?=
 =?utf-8?B?cDd2MUdkcVpDK3pRZDdvYlFVRWtpeGprb2pNbUVNeGUvNHBWN0tob0hoSGYy?=
 =?utf-8?B?V1VkNkMzYmZna3gxSGxqWW41YnM5N0xOYWlKRnZ6OVlzYUgyZUlzOXlrU3E2?=
 =?utf-8?B?NjVxYk9HOHBWUEl5SVBwVGVyRFFXZUxWZzc5aTFVa1FaNUJiZGdSS29aZXJT?=
 =?utf-8?B?N3kxRjVzZU5rNFlSRVRIb0VEQ0ZSWHFsbVVhdW5sUWN3S3VZY3Jic0llK3gv?=
 =?utf-8?B?MWRld21mZ2VuVXU3U1A1UWlWVng5aHg5QU1SODVKd3U0QmZqRk5MdU01T0dY?=
 =?utf-8?B?M05qZkxlUk15aTlpc1RsS0k4ZFNwVlVGOUpEWmhiQTZvcWRFcEJ1bXY5RFZM?=
 =?utf-8?B?MnQ4RElsbktVMlhRWGNWcEFUZEVQNnJjTW9GMkhzVE50WVJzMXo2ZHZFb2tk?=
 =?utf-8?B?KzQ0OGtOYUllOEd3SGUrZGRyOXpSSE1iYlIxbEZTaEprQ20wQ3ZaVXQ3UGFp?=
 =?utf-8?Q?NXSnn1BWEwiVSbGYzBe4faSea?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rvvAcaF5yvlzITUYbZZlEZ10g446xSDrhlmZEyUgLIPmrUvjlca437iarok8RFGJkfIk4nUPIbPFGrErEWepjwg3/7k27ADSjAh9te/8CtB7H0Qug1Lw5leXqx0c75+uC5Jb/y6Hn6wInlIL9Wi92WghtOtTusJ+j9CnMqi5qBneEhEr3LVLIVnzacJ5EuZIWDcZjrBQBigM9QX9mgB8ZW6bEgHPtNncouZtcWsk33iEgp8ZpTV58PoygZxC1M5zvbo3gJfrfEKGXzo1+oAN8zgfCvOJdur5Qn8LkZ4WchRBvym7szDNBwDKWuJrr/Bd3vl48cZZvumFwLZH1gIc4OM17B9nCcsSGPIGcIEVsNl8sLdEDV/OqtxgRW2Kt3J2K/qjNgl43IpbWR6eFfFLvo/6t7dWEI89SnukdeuNtvXGZqu6ZNbggeG/+lrGAFDHGdtBOm3Twa+xH1ejEKVtCnfNi+IIyfExa+KX2o+DhtbQ8uuysJlZpuDSYMMegZRgtOv28SYz+4z2T24J9wc73bkHCzkXXZhYC5uy8r9UnKMUGu4UMjivNX/L3+L+aMZZ7qchiKeoMwDh0R9l3QPEK8kd8ETsz2iTlAlle9/yR8g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef03e1c5-3351-40a7-d6a4-08ddda26802f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 05:01:45.4258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fm9HpXJtIoIUZoquXXzSrYEQ+4qtecZm4qZCxG+MCjbg3PO1IBa2zWZD27aMKrec6XpubIV1QzfrGuKgh1Fo4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5819
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508130046
X-Proofpoint-GUID: sjmgMvkjPNRdCPLF7j_fb-d-cJoYm8g1
X-Proofpoint-ORIG-GUID: sjmgMvkjPNRdCPLF7j_fb-d-cJoYm8g1
X-Authority-Analysis: v=2.4 cv=ePQTjGp1 c=1 sm=1 tr=0 ts=689c1c3e b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=5LlCU918ThkDnaYoHrYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA0NiBTYWx0ZWRfX7Vzmz7eWjvbb
 EecPdfIY4F0eav4W7DlYnOR/5vM0apuRJfnf9dHC6/1XilfdGtQLtF/d1vabfjRe07k20uxBZLg
 FGhUyygwznxQdh+2RqEX7akfk5kICtWZBiG5zI0GOIBmaFh9eEcInE6rRvkPAltJxquNVC2GWEV
 S7FCPgMS+vhKGMZPBBf4oFcm3vMXVWcMnLiqB1bmWN6tC2F9P0NjtjKJmi4FhbtRO+VgUt0XmEd
 yNgjHVKB+LjnE0dvtsHpRuYt+lfo6gZ0GRUDbX8WT6ZBzYqPIiWS8gZSz3kKIFtFuSl4LPMdTym
 DVwaTw6SWaBk0DdURuRq4xnaXfbXV587NC3fMdpwr0kbYkTsF4wM0OukRyT8GZiHIQK0bs3wwHp
 EoIRoeQ2q29uQ5W9FOGhSV8XXCvTLx9x5ofNx7qOFj1/2vJZk1ZKe7bCpaH/nQWND2xZBz6L

I do not remember the status of this patch, but the test passes for me 
on all my VMs rather consistently.

On 7/26/24 18:59, Kris Van Hees wrote:
> I am renewing my question from Feb 20...  It seems that a v3 of this patch is
> needed to address issues as discussed in the exchange below.  For now, I am
> deferring this patch pending such a v3.
>
> On Tue, Feb 20, 2024 at 02:31:42PM -0500, Eugene Loh via DTrace-devel wrote:
>> One question is what need there is for this test.  I think the "need" was to
>> wean the test suite off of /proc/kallmodsyms.  It's unclear to me what
>> urgency we feel on that.
>>
>> Generalizing to any symbol opens up various cans of worms.  E.g., DTrace
>> won't handle every kall[mod]syms symbol, and the test needs to be tweaked to
>> strip [] off mod names.
>>
>> Maybe for now, there is a simple solution.  I think the test name and
>> location make it clear that it's doing a sanity ("unit") test on the sym()
>> and mod() actions.  Nick points out that mod() is not robustly tested if we
>> only pick one symbol that we know is in vmlinux.  But still, maybe a "good
>> enough" solution for now is something like:
>>
>> - # pick a test symbol from /proc/kallmodsyms
>> + # pick a test symbol from /proc/kallsyms
>> - read ADD NAM MOD <<< `awk '/ksys_write/ {print $1, $4, $5}'
>> /proc/kallmodsyms`
>> + read ADD NAM <<< `awk '/ksys_write/ {print $1, $3}' /proc/kallsyms`
>> - # a blank module means the module is vmlinux
>> + # the module is vmlinux
>>   - if [ x$MOD == x ]; then
>> -     MOD=vmlinux
>> - fi
>> + MOD=vmlinux
>>
>> On 2/20/24 11:43, Kris Van Hees via DTrace-devel wrote:
>>> We still need a v3 posted, I think?
>>>
>>> On Tue, Feb 13, 2024 at 04:02:25PM +0000, Nick Alcock wrote:
>>>> On 13 Feb 2024, Eugene Loh via DTrace-devel told this:
>>>>
>>>>> The comment about never using shuf does not belong in the commit message.
>>>>>
>>>>> The indentation in the file is with tabs, so that style should be preserved.
>>>> ... it was? Whoops :)
>>>>
>>>>> Instead of inflooping (in flooping?), how about "infinitely looping".? (I do find some occurrences of "inflooping" on the internet,
>>>>> but might as well be less slangy?)
>>>> I find 'infinitely looping' clunky. "Looping infinitely" is even
>>>> clunkier. Inflooping is an established term of art, frankly.
>>>> (Irrelevant given the below anyway.)
>>>>
>>>>> Anyhow, instead of the shuffle approach, how about "awk 'NF == 4' /proc/kallsyms" to a temp file and use that?
>>>> Oh yeah that would work, though I don't see what's wrong with using
>>>> shuf...
>>>>
>>>>> But even that won't be enough.? Once you allow "any" symbol from
>>>>> /proc/kallsyms, you risk encountering symbols that DTrace doesn't know
>>>>> about.? Stuff like __ksymtab* and __kstrtab* and others.? I think we
>>>>> filter that stuff out in dt_modsym_addsym().? The same filtering is
>>>>> done in test/unittest/consumer/tst.symbols.c.? It's the headache one
>>>>> saves by going after a specific symbol like ksys_write.
>>>> ... but doing *that* seems like it would render the test nearly useless.
>>>>
>>>> the fact that tst.symmod.sh as I found it was broken for *all modules*
>>>> even though much of its code was meant to handle them suggests that
>>>> whatever it was intended to test, it wasn't actually testing it. (There
>>>> are no comments describing what it's for, which makes it hard to figure
>>>> out how to preserve that property when changing it.)
>>>>
>>>> (I mean among other things it was carefully selecting a guaranteed
>>>> non-modular symbol, so what all this code to figure out what module it
>>>> was in was for, even if it had worked, I have no idea...)
>>>>
>>> _______________________________________________
>>> DTrace-devel mailing list
>>> DTrace-devel@oss.oracle.com
>>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
>> _______________________________________________
>> DTrace-devel mailing list
>> DTrace-devel@oss.oracle.com
>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
