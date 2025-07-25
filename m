Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DFF13D891
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 22:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753483871; cv=fail; b=P/dINX3vgSUmeLE0e4qom1jTAOA//n3P7A3UySsSzqBsWqbw0TpF0gmKt4NS6hX05I7ZUP1lhVcJxfVqJuvV28SlOL/MWYkp/7kWY2bL5Ejo+u/AsLA5Afedt7i0qWzynKdmj927Kd8QsLaKhZMz7+1J6FfA1SyUiHUpb4sI7zA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753483871; c=relaxed/simple;
	bh=Xldunm/xjUc154jN9QoUYgD+u1LvGSw0E5ylS71srjc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZZTAaihZlkSkkkH0QHAO6GiH4SiGJtlMUO1tRSuZ1ICT/ZG+ltTSBwcm4d6NJH2JdKZHlvu9F8LqyhQSVB8hsHSx7TL86HYlwGRRnZQy78KZGEq2iYe/oS+lpVjuu96n/7KJnKmU/PDwZuIFkCHv1Fia2dwOsE8r0v34g8WjXtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IdEqwAY0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X+40GN34; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IdEqwAY0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X+40GN34"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PKgPg5021373
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 22:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=T3YTY2THPh7efouxv6YbKn/8ZPUaQ4F+omEHkfxVS5k=; b=
	IdEqwAY04SCVgRKMez1aqfV1x2XSHXflBEwlG9FpRH2LPAhZ838L87SWFLn2fXeV
	dGNN9Sp0/l/ifs4WYR7avo3AyNVhZmj1lFYOwHEAdpfJl9aisoIWX3DFLat/GxpN
	0AQu26M+axsT0/hlYRlhHIp0awn0IfVv0e0wbiqnPANNXaj8ve/kE3B6kd8zwrbK
	OYWuTtgHybWgvkdmWxp9RJNP3DPiaIr0ps0SSTU+eOQ6hu0hCTcVOXe+OJsVVKn5
	/DXkCxs7tpzFWgpcpmH4ebO/DZIYJUh9ZFy2WtjT7dBc0H56q8BNMlpmLMN0E/OS
	TunY/Re6oG5MSwA2NCaq/Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1n204k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 22:51:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PKov2s031497
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 22:51:06 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801tkyfeg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 22:51:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zp6Pi2/ws3SHA9XkDHZXdt+N7iaZ22fzJCfsQPfLVFNXCCVCxaUFXK7jCUGjzQ583I7YB8sxHAfejSFQ+qTFDBZ/jZmK0GBBqNogklMtlgSOtgMmfngA4xxrDo2Pmlf5CeMvaG7JVq7WJ8A35hm18gYYUvpc+YWbUAkXN61pmcuuo7eQ/fTBAj0B8r5NucnPgbMP/d/YvNMKLm9h1ccyIXkWimJIbvBB1OOR8Nkq0JoWk6T9mN/uvFff4jVNZ18F0++kEzgluPDCIz+OX0JOG1Zvbb4ciLpQ0TXSpysj9y1YUetXbaQQd7NePK+ACyGubULLbsaRF1Ww2hztD75hjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3YTY2THPh7efouxv6YbKn/8ZPUaQ4F+omEHkfxVS5k=;
 b=lyrEVl7RSC/MJYk/TuNTlMOVZXq831c2HTBXINH3srCgR3jlR/Xerk+DRalCqbEbEFnqm/wS/KS+i/7AlDavu/t2Mz+CZbCtBdqYWyOlisQZ9aeNz+b2kfXgB1dcFbi9bqr9aiLUCyJSlRseBCVtzam+Tktv/p+gnpxVmrbTLIlwU3FkoJtZCF6+fQQ1w3NsflAT8USgsY8sMA98VkSMnFKE8/IO9TiV5U9raBKTrQPi4N3aZLvymgfbn/cWSMXmwGoAp9rAe65nK49CfXmHAhdVtlB3C+sNluC14tg5N9dv9WrhASgw17J3uxnQHSgCIzHMbaYStMunRZmjS1FGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3YTY2THPh7efouxv6YbKn/8ZPUaQ4F+omEHkfxVS5k=;
 b=X+40GN34iwqjtE8Cd20AypfCDumxUtIgGjUFjzSxg+MDPFSNd53qCiyEHhWwpGYcuYZLKmkedlizYfIR+R3oEARazjCQGnHo4u/BQcLV/Xb2YLT06l1yEXgmRDt6sHvQGaJAftgILxZGKXqZbCdTGtnXvsDhrx/wwhhTZHfv82A=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by CY8PR10MB7193.namprd10.prod.outlook.com (2603:10b6:930:76::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 22:51:03 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%5]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 22:51:03 +0000
Message-ID: <60f1738f-2ee1-3ecb-89db-8165dbe9eabe@oracle.com>
Date: Fri, 25 Jul 2025 18:51:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] Free the DIFO for a probe once it is
 loaded
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <MW4PR10MB5679C13A1178269C13E67207C259A@MW4PR10MB5679.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <MW4PR10MB5679C13A1178269C13E67207C259A@MW4PR10MB5679.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:180::15) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|CY8PR10MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c016ad-4499-4d28-8cde-08ddcbcdbb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VS9QR2s4bUhQZno2dkRZTFQ4OGlVM3dNamdKdG9ncnJQWGxtT01uNmp0WFV3?=
 =?utf-8?B?Y1Rkb213eWxhekViV2k2S2VUOUt5YzlPNW9JZVlNWUJld0xjdHYyZStEYzB4?=
 =?utf-8?B?QVUwQlA1Ymgra0loL2k5cE0rd3JOUkxySDJBZVlKKzhVOC8rbENiTGhHQnJE?=
 =?utf-8?B?VGg1OVhVcFZyR3VzbFBpTnlzSnE0M1A1cTRmdVl2NjErT0F2SjdaZUxqenlu?=
 =?utf-8?B?ZElDM3gvbXo2U3lucXBhR0RIdUZsSHJUY3NVVWsrQ0NodW1GVFJoWmJtZlE1?=
 =?utf-8?B?ZWRlQXg4aUx5b3BmYmJsc2wyZmtQSldoaHV2SUdNalMwWFNjV0VUMmdSaE83?=
 =?utf-8?B?OUJzci81SXN5ckxUZW1rUDRTVHgyNHZXa0N0T0xxMHB2TGQ0TlgzN0cyakZB?=
 =?utf-8?B?dmV2bFRiYzFOL0dZZXRyK2N1cm45bVRIaUJ5Zjd6WFpneU9ZQ24yRUhMWXJV?=
 =?utf-8?B?blR1MkJrdDZTc2pJSVZSbUQ0WkJwOXVJQm9pZ0tGQmt5K2FhWnBtK0lUUUxX?=
 =?utf-8?B?NlRWc1FFRlpRMW9ua3VMTlFSRDVqZVF2bWRsdzRQaElZaWNaOURpMDZ3Q21z?=
 =?utf-8?B?bkgwZ0NhOHJFMU55OUVGTXdLUDBSbWxYTkxsYU1kRldtOHlmU2IvcTFoU0JD?=
 =?utf-8?B?S3V1aFR1SHB1ZGo0OFJsZHVlZHQ2dzdHNTk1UlRRcXJxa2w3OUx4OGZhYTg2?=
 =?utf-8?B?YTA5SmZ5WkMrWEpJVnJJRkZWUWg5TVdOeGsyK2dkT1V1dWJ4QTFKTGp0ckZW?=
 =?utf-8?B?ZVNTTTMvMkwveXlBc25Pb3hqSklxNnBEY1lHVndJeGh6aHgvMzlzdmg4YWFX?=
 =?utf-8?B?d0doREFkZGlzb1Z3Yk5MeVNjUDIrK09mZ213aCtTcFRseDYwakl3eDhqblZ6?=
 =?utf-8?B?VUg2RXRhdHRSaVBKVW05UnlSc0JvcWpSSFRiZzYxVi9sbVF6RnVZU2JsN01E?=
 =?utf-8?B?SFlRZVV2NmViR2ovK29RYWlNTU9XVk5YVnNrSnR0V3NhMDR1cHBZQXcxKzBS?=
 =?utf-8?B?dHM4dWpBNnpPaFVlUjlhVWM5SXhoNW5MTjhHT2VqMVdhVENqYkpTN2JmY2U4?=
 =?utf-8?B?aGtzcWJFR3FPeTEwUWdYM2JzSXNMc1VISHVPOEg3YmhsNnlsUFh4Si9nWTZF?=
 =?utf-8?B?TllqdHFpRkgzTlpwVUhwMm9FTm9lcjU2VkhLdU53cThmS0paM3JmZ1FjSW9F?=
 =?utf-8?B?R1d5am5jaDNob0ZscGR0YlZaY2hpZmp6UXFCdWY3Q2U0UUFVTjRoNURINXBq?=
 =?utf-8?B?VG81S0dRd1RmcG1OeVhNSzJOY2hIMW50eDllMnRHaUNRMjVVdzF6TGtETEZh?=
 =?utf-8?B?a3BTTDVKUGF5VlhnYllJS0ZVN1dnRVVZNHNXa1Nib1U1SklQTm80dlBpNDJH?=
 =?utf-8?B?ejBjK0M4TVh6VWtUODZwblJORktrdmJkNXJxRDQ3c1dicE5ocEdoTFR4R0Rl?=
 =?utf-8?B?WldOVERpQTJVSHRxV09hUitnNXZqOEJ0bWVJMFhmL2V5WWQyV1ptNkNTYXhJ?=
 =?utf-8?B?N3dyVWFvNHlFZjkyY2R3V3cwUnR3aCs5UmVWeE8vcU1jRG9odXc4ajB4YlVR?=
 =?utf-8?B?SUMwOHJFb3hzeVQ2YWplWjBiOWJhNzFpYnlvNkJmVTJUdmVRQmhDbEh1L25F?=
 =?utf-8?B?RnhxS24wUXpXREc1ZkF2N25xcmxLaGFkT21udFZPeFFLcFptSWJTVWo1c2pZ?=
 =?utf-8?B?aGVYcWxDTkliVXlZa1lFWndtN29vMTJOYWZQVUY4NHN4ZE1GYklKamFTQ3di?=
 =?utf-8?B?WFIxc1BKTGxUYUJ6aEowdVJHbmNweS9SUEdlKzFCeVptTkNucWJtWk5LZjJp?=
 =?utf-8?B?Wmo1dWt1VU51MXordXJmR1k0ZS91OUdFZldZUHpEWXhtdUx2T2lmS1BwckFW?=
 =?utf-8?B?ckNuS0E1Q0tsSUY1c3ZrZ2VLUjV4TTB2VXgvSHdWclF5VzZGQnpDdkZ5Z0pB?=
 =?utf-8?Q?Q2f+J8+y0Ek=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTZaTldJT054UnRTU1pRR0ZLMTVzM0dvb1RxUEdKSUFFMklDcmFFSEwwblBH?=
 =?utf-8?B?eFIvcFpvWDRVemNoOGRVYVFMWUxPNWd4dDQrbXVsTGNIRGRERnU4NFFlTHJO?=
 =?utf-8?B?OTlqdm9haWdQRVgyTi8wTGREVlA1OEZUSEVvbk5xMG1BeFI2YkI5S0F5Wisx?=
 =?utf-8?B?TkJMdVJBd1VuWEllR1lONXZSWHZ2aS9jclZpd0VNMytyWWlWUGhLc1UzVzRJ?=
 =?utf-8?B?VG5nUFBwUTBDWTNkTWZUUENKMjJYMHJsaTRkV09ndStvcjhYK01vaXpWWkRj?=
 =?utf-8?B?K3ROYW9PK0NLU0NlWWNJTHJFZXNoQnphTjZBVW0yQ2FwNjhzMmFJbkVKOWh6?=
 =?utf-8?B?R2E0S2tpRjBiaUhyZ1FqL0xNOXljbWY0YVBWRkFnNGc5cXF4cWU1YlNmU0Uw?=
 =?utf-8?B?S3ZXaXN6Sm11WEE4RUxrbjBhdnhjdVZidW9HN0dZQjdpZ1paa1ZQVmRsQXdF?=
 =?utf-8?B?SFdXMXNmM09LMVdYRmh3SDNiOGFTV2xKK08xcnBNV01lc2t3clB1bldZTm9K?=
 =?utf-8?B?UTNmNGE5bWlTU2ZJVHdIREpxd3k5L0VlMjhHeUI5VGl6UEd4emY0eEdlaEM0?=
 =?utf-8?B?T0lBZUdNdmZBbHRqMlNUVUdMbDlxd3p6VGhDMEJzeSt3T0YyTE1OYlpCZWM3?=
 =?utf-8?B?YXdIRStXZE5pUy9uNDdlTEhFTXkvY2tLS3J5aGFWbUJaSWZ1RzI0aEE2R1RP?=
 =?utf-8?B?SE5LWjdIWm16Z3V2NTZ2Z29WZFkyZ1ZZaUZyQytGbFJyNDB5NER3WktSdk1y?=
 =?utf-8?B?cEtVaVhWVGNlVVdzR0xhOWQ3NGhrczJUb2p6UkdQcndland4emg3ODF4Ny9P?=
 =?utf-8?B?V3ZPK25uZU5zbUxxb1hydmE4RVdBSXdsenB6ZGFWRVpYNHZHVHJaNnBKZm81?=
 =?utf-8?B?TENtQlM4RTU4MWl0cll1UTU4SnFQMTFtUTN0R1U1N1ljTlZrMnNlcUhYYklL?=
 =?utf-8?B?U3VxSyt5cThSczY1NCsrUjZFK0VxWjM5UVZOZjBEcThZR0ZaMEZsR3dvdnU1?=
 =?utf-8?B?M0tqOHQ0RTlIWklPVjNDZ0Q2b1E5bDVKVmN0VFFUcDJNVWc1ZzRkVFhnaHF5?=
 =?utf-8?B?NHhselNtaXlJYlBMR0FRV3hBb1EwTExySWVoYWxpd05XZTFJMXFzVWRURHhD?=
 =?utf-8?B?SWpQa0JwaWZLK1czRGNFOWgreDhQVVpTVTRDVGo4NXk3RUNRQkZxRisyOUdt?=
 =?utf-8?B?MktkbUVlTENIam5uRVF4NWMwbWpSUllSUEkzN2Y0R1QvYURZN0I4SVJac2hL?=
 =?utf-8?B?TlJrSDFBY2llZGFab2lRMytZZHo2NFBIaDdrZDF3aTlNUExUOFowMUdzTjBB?=
 =?utf-8?B?aDBUdDJHNzh2bVh2VmtUa2Y0akN5eDBuVjM5VWpQVDBta05TV0pvKzZCSDNq?=
 =?utf-8?B?cDRuTElwanNqVG5zVjgrZmFJb2o2MFpHMTF0d3pETGcwREdxSS96YTBLVUlv?=
 =?utf-8?B?NkdudkkxVTE4b0YzREVyLzFKSTJDeng4TDN4cUZuUlpwZXNVNkVnY2QzR044?=
 =?utf-8?B?dEZkQ3pFSitoNTVFck85alFRdjVCTGN2SmJDeUFLWWtYdlQyQWdEQ2xwdzJ5?=
 =?utf-8?B?OFhrUGRMa2F1Rk1IMGlYcHVNUGszK2hnN0JIaXdabkpmRmRBMHNhSFdDS2Iw?=
 =?utf-8?B?cWhWK1RLZU90bHNuQ1FHQmNBWG9IVDlxMXRkNWZMc0dBK0hIQnhCc3FnVllx?=
 =?utf-8?B?aFJQQUlzVHQ5RXloNStIcXQ2ajdlckJzQU00R3NUblpWc1RLZG56Z2I2SUFW?=
 =?utf-8?B?bysrZ0FYK0dxcTRLQkg4UWxUWlQ0eEE0SFZ3Ylc1YXpTTjdMejFPekhvRTBK?=
 =?utf-8?B?M0VkcXVqdTk1QjhZUTVNb2d5UnlzMVRrSDkxL1IwZWxxWXVHazJNdGR6Zmh3?=
 =?utf-8?B?djBkakh5TEVTd1VmRm5BRnpkdEd2V3JvNFB4M1pXVCtsSHJ0L2ZGalB6NGsr?=
 =?utf-8?B?MTlybWdyci9jKzV1S3NpNzhBK0U4N1FJbjF3R1hBL2FCN0VBTlR0K1dXQVhD?=
 =?utf-8?B?SVE4dFhENDN5c2lESEhVZ1RGdzQ4WE1LK0NGZzFBRHo5SFdab3hORFZCMWVu?=
 =?utf-8?B?VXhIWDZ4czY2OXY2RW5jZWVsM2NWTEdUUGtsdHJRcXJOZGlpNWpSY2c0am13?=
 =?utf-8?Q?sPdK9mu+qauJBLN8Mrn9SHF7B?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9xaME+GXxtfgyc2cTEIYzBm0qs+MZF1tWrpIKf0UHqp3VSETU7/aL3qzVCMvJB5YBoP6lCAZVUrc27ED/sA/YVrKd3mSWQmNx/elcUE0Qc/zm1DpImZwlNaXqW1nMA0y7gn5qmRc/d0VMHnuaBF18L9JWApmZarPTJMqH769HHT3S+MrDW5AH0+ZNHrzjktXDpWxrjDxdzYRbu7b/84U7dWcF3WrNrXiiJvR4ytVSaSjmlNIkk8g7vHmHL75rZma6SQ8zsNywMGApjJhheMX4WVyk8iJuf/lCcggaAuCv5dtpaXlXYoglBsAG+P4j7Sh4cTqnZgeKghCX8W+UJ0itzG7cl16KvK/QCVtDYXHR+tzOMPbIeGwzuXzL1cbnpw1P4s7b687i8Kp//NusPOoQpHtXeyds0yztir7MxJko2iMoPfrmx7Nt5Ik7DtWyCFZj36GfKDA7CVWb9OiHctg4A0f3r6yOP3QlEktcP7ydqy9GADTOwbmvVjG7I7u4HG0WCkCJqr7n8CzBcrq+/nQBf6kaTcsUPemVYUGG0yHxGPkfm/C+7nO6AG85coYKvRl3/OCJjCrPrQE+QnMOyn9r/0m+U3pic3VCHTCsU54Ft4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c016ad-4499-4d28-8cde-08ddcbcdbb83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 22:51:03.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPFZw+xFttP9+LXWhGlXies+mRI3/MmhaX39VfVHLxBcLZpr7bGHIK6rYKvUj6bLlrcQgpufwY6Q18C4JCQ5OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7193
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507250198
X-Authority-Analysis: v=2.4 cv=ObmYDgTY c=1 sm=1 tr=0 ts=68840a5a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=CuelDG_OGeiJGSSr:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ZUjhifd1tUS2i1do8I0A:9 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:13600
X-Proofpoint-GUID: UzsbK2AFZaJqFZ_HkZWZ0IoTm2Byap76
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE5OCBTYWx0ZWRfX5axj/bx/7aVI
 gTZRr+/mn7m5ffHzLc8D6M1JyKQ+rn0+AcMmjiVD7b1xFc97/GUqyw1xMHmbOrBm52DluEynTuu
 yVmytIdxFnqcAZDcg5c/zHr3TwsyRvyFA3THtR/EYaiOe87d1xll+HLA/XRQ7CoXeSnEb0m59n/
 /gYbnLUgLslnUxMEgO4ZVkx6HC72VfACNo3YMDQVRb99I5cNqS/A3hgZFmp5Q2n0hWEkap9pjUK
 k5+4OxEY8w7YPClgUpUFcKwPCWLA8tnD/EnPC01m+f9DkLy7j3beizmGIyZ6ec2HOSljIdp+Il0
 NQbnVzSx7mRJTTrc9TzdVt2dmTu48k7Ls55fXrHCLaVF0m9fmyPxfBsa6IrUkxmOg52RGb4drXu
 iiIZIm02LfPvjbIt/28KK8CWtacMyJbkvvz3u+HTVaft3dckf1Y0MQGm/cxl2pgdBo65qF2j
X-Proofpoint-ORIG-GUID: UzsbK2AFZaJqFZ_HkZWZ0IoTm2Byap76

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 7/25/25 15:34, Kris Van Hees via DTrace-devel wrote:
> When a lot of probes are being probed, keeping all DIFO around consumes
> a lot of memory.  Once the BPF program is loaded, the DIFO can be freed.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_bpf.c         | 26 +++++++++++++++++++-------
>   libdtrace/dt_prov_uprobe.c | 22 +++++++++++++++-------
>   2 files changed, 34 insertions(+), 14 deletions(-)
>
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index ccec8b43..ad8cc0e1 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -1339,6 +1339,7 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>   	 */
>   	dtrace_getopt(dtp, "destructive", &dest_ok);
>   
> +	dp = NULL;
>   	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
>   	     prp = dt_list_next(prp)) {
>   		int		fd;
> @@ -1353,28 +1354,39 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
>   			continue;
>   
>   		if (dt_link(dtp, prp, dp, NULL) == -1)
> -			return -1;
> +			goto fail;
>   
>   		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
>   
>   		if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
> -		    dest_ok == DTRACEOPT_UNSET)
> -			return dt_set_errno(dtp, EDT_DESTRUCTIVE);
> +		    dest_ok == DTRACEOPT_UNSET) {
> +			dt_set_errno(dtp, EDT_DESTRUCTIVE);
> +			goto fail;
> +		}
>   
>   		fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
>   		if (fd == -1)
> -			return -1;
> +			goto fail;
>   
>   		if (prp->prov->impl->attach)
>   			rc = prp->prov->impl->attach(dtp, prp, fd);
>   
>   		if (rc < 0) {
>   			close(fd);
> -			return dt_attach_error(dtp, rc,
> -					       prp->desc->prv, prp->desc->mod,
> -					       prp->desc->fun, prp->desc->prb);
> +			dt_attach_error(dtp, rc,
> +					prp->desc->prv, prp->desc->mod,
> +					prp->desc->fun, prp->desc->prb);
> +			goto fail;
>   		}
> +
> +		dt_difo_free(dtp, prp->difo);
> +		prp->difo = NULL;
>   	}
>   
>   	return 0;
> +
> +fail:
> +	dt_difo_free(dtp, prp->difo);
> +	prp->difo = NULL;
> +	return -1;
>   }
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index f60bdceb..8e7aa4b0 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -609,32 +609,40 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
>   	/* Make program. */
>   	dp = dt_construct(dtp, prp, cflags, NULL);
>   	if (dp == NULL)
> -		return 0;        // FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
> +		return 0;
>   	prp->difo = dp;
>   
>   	/* Load program. */
>   	if (dt_link(dtp, prp, dp, NULL) == -1)
> -		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
> +		goto fail;
>   
>   	dtrace_getopt(dtp, "destructive", &dest_ok);
>   	if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
> -	    dest_ok == DTRACEOPT_UNSET)
> -		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
> +	    dest_ok == DTRACEOPT_UNSET) {
> +		dt_set_errno(dtp, EDT_DESTRUCTIVE);
> +		goto fail;
> +	}
>   
>   	fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
>   	if (fd == -1)
> -		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
> +		goto fail;
>   
>   	if (prp->prov->impl->attach)
>   		rc = prp->prov->impl->attach(dtp, prp, fd);
>   
>   	if (rc < 0) {
>   		close(fd);
> -		return dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
> -						prp->desc->fun, prp->desc->prb);
> +		dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
> +					 prp->desc->fun, prp->desc->prb);
> +		goto fail;
>   	}
>   
>   	return 0;
> +
> +fail:
> +	dt_difo_free(dtp, prp->difo);
> +	prp->difo = NULL;
> +	return 0;	// FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
>   }
>   
>   static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
