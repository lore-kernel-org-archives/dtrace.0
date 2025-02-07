Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E6B14830F
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 06:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908313; cv=fail; b=KDWIsDLba6adVKY4FHQ+A9eaQuKUPIHRwzI+9P3WVhZY5Rz436zeeAC5dxgcz+dk+kacQOmR2YaLK7x5wyyYyuMmXPp9QeHcSS2hlcgbN4zBuvieC5VvQHnNxYL7Z90clb/Pbl4ugPnjVgg9ZqVHPJONgf9hIGbXTzup0OgusQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908313; c=relaxed/simple;
	bh=X5nGGzHopHY1H1J+2BrW9MoNhKTqeDhaBHeN5Lg9ZJU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mImy9kwMfBPhC4AgNqwhslSwv2yA6Gnnd3bAQ4EVvTbxT2H/L4nhHJMgBc7tc0sU4QW0OyQabwpINoEN9nXG32NTTWzkVfOZOVu2jlQvGygnY5SU6BZeAJNO8uTpMLDZ4h2ohsnfCSVGoeJhmCOvrrGzJ82iIG7byZ2MQeJI8bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GocB3Nhk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zP3XiLTA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GocB3Nhk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zP3XiLTA"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171ttq8017543
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 06:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=AA2BaQQcFIz41SPQR6FHvwUKq48BecaV8tvmVodVh7Q=; b=
	GocB3NhkjsePYpKmIwShBEAJd+tQUazi2QAzRTq4X8T+/gYbfE5QXvSuGfkGxpZF
	3IoJ2hj8G7qhitepS8vyKr+BW6ECSfBO7ljsfrxdEdBwDK9hcXtk86dst1wIKBqM
	cQ37HjtsLtVDGLgz2P0Cbz2i/1rtsWWNssK39B9kv2a5IP3K2EJQ5zNf3yEBpPaR
	irxFDQpG6x8SWl17OqGS4epSBjB1yzD+NJ65iVp0VEXQEkkow0JiZCcDUiOKe2/d
	yQBKx/l7ddGhAQ8S0hds9ZJu2KbO9JJPtLjMD1Qcp6RFJCAGVK2jSFQoJLtYNmgN
	YsJUHbMW4mB+wH6g+IHU1w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhbtju5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 06:05:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5174m7oi020702
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 06:05:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fsupe8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 06:05:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzt+zpZLbsDkDNztM7pBC+dr3oO7j4TaF8mzeULv8CeU/MAa5X2TMR6EtADgrKqN70V6gqOa+udtnWaefPzKQNChDZcxJV915JXEkna7XSjpgF375re8gknhIX+Pxgjk/pIIFDhWryJki/tkL781ZPF2AgYbPiTv8F3sdX3gpN5XfLGLId8R8IDKxXzzIYz5Dl72cLZzKk34qDv3Jkn0jD7EnKM4wdb+vP9NznxbcVoCljjlQPRFmXx+v5R6OufavQov9I3KzKkHaFWajCLymQBA8jY39SOrfjgiGUVwCJrAmF9cLpB3Gpbu023MtGpX1JmoFG6ta2DRuCj43l5IMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AA2BaQQcFIz41SPQR6FHvwUKq48BecaV8tvmVodVh7Q=;
 b=EJh5nS80JBliMDyMu+hmDi/GSzdi+CKcevGBFL9yIzMYwCklW2oY0BK6ZuxTP5oY7ngusBXrl6ib07dIJNT4CM9syl2H8pKf9q51/bZmtWZ2ARgJXnEuNVuChoEblweLI8S65gMnLxlrMsK9tbdd0Cpby9/Zw62jvvkCd3S257PfeJsBmm+5JMTzjmU3hHKuxc6WyaDUV3X+ZOoKD4foSoklVNeZzqbWGCC+l3IJJyL66bPdQCSDFP9rDntmDFgok3o1ZXH3SHzRvPCXgrMydzvO/lN1XUa8dLjDjjBTl5Z54/BmQ5Mf+lkmXt77j4tPNUFvg1zK1lXzJ9OXt8c7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AA2BaQQcFIz41SPQR6FHvwUKq48BecaV8tvmVodVh7Q=;
 b=zP3XiLTAOJ+oBbT9oIbiKuzsU1yvHXwGcAR00CKw5IGo07dYWQ/xTdy/K6S3tOyglrt+FVMjFU5aTAf8i7gZav+16h5AtAlAzIoO4DgOz7FLclK9/ytfro/UPXKbaLL05BU8DuoRmuPai4kyfdL11u2BHdps+dg6PpbglIxZCws=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW4PR10MB6632.namprd10.prod.outlook.com (2603:10b6:303:227::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 06:04:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 06:04:59 +0000
Message-ID: <5629b0db-a8ed-5b75-4bcf-e1ffc7e6daca@oracle.com>
Date: Fri, 7 Feb 2025 01:04:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] trace: fix char-array handling
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <PH8PR10MB6337447CA1EB2716CC4CE522C2F62@PH8PR10MB6337.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <PH8PR10MB6337447CA1EB2716CC4CE522C2F62@PH8PR10MB6337.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW4PR10MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8da5a8-ffbd-4805-e734-08dd473d5a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkViWDk2cGZaQXUrM2J3SnR4aXJMZkVBTUxjSDUxb2dPSkRQQjlvMk16K1c5?=
 =?utf-8?B?Q1J6RE1BeUhkMmpRUzRJNmNwdHdPM2hEclZiNVR3VWhDbEhzUERqUGxEbGI4?=
 =?utf-8?B?bTYwUkhUSXJDdGxKNlRUaWtRZU5oUzh5bzJWMkNnMy9rNStyakRZaFJUN01l?=
 =?utf-8?B?NVduUTIyRVFpQkZwSW4vS3lnTU1YWlhNT3FHclVqOGU1TEVHN1VpOGxncU1L?=
 =?utf-8?B?ODc3VDlTRTMyNmhUeEw1TGszMXkxemczaWlPZWgrRGRvMEtSRUIzczhyWlRE?=
 =?utf-8?B?M1Z0QmFqckV3TThwWnZvMHdlVDd3VU5xRHJwMHBwSnRQaW9EN0pxVVhZNWZl?=
 =?utf-8?B?cnZYVHpWbTVqc29GYjJBR1lJenh6MVgwZUlnbC9TeTMvMjhULzhaYUhXaVBm?=
 =?utf-8?B?RDZkMTJVd0JGVjgwOU1IbVJzdWN3dXh3RHhnVE9tUWhJT29yUjJHeEI3WlMr?=
 =?utf-8?B?Y1hkUXJIK3o0TGEvb2FFY2gvek9VbEU1MEF6bkpuY0RLQWhoNE50anJXY1lh?=
 =?utf-8?B?WFIzQ2NJeTBpMk10a2FPaEZVdHh3TW1RcjhsdDd1SzdxOXR3UVh3djhqQldI?=
 =?utf-8?B?TzFIeEE3Yis3bFNKSEZYcnFnV2tnWC9RK2xrQmJMQStXUkROdDJPbWxmUTBw?=
 =?utf-8?B?ell6c1ZIU3lRMEF4cnBmaFNVbmtHRXNmdlkrR1ZScjZPd0NYS0UzWVJ0eXV0?=
 =?utf-8?B?SG1HUjlWUVR1d0R4N1o2aU9JRXBxWUNQUzJnLzB2TnNLV2JXbUk4OHZITHdu?=
 =?utf-8?B?TWtOUllqajhvVmU5S0llQnhsN0NQOE9KcXc0NndQSzFNQk8zRDhVczRUVTl3?=
 =?utf-8?B?angvZCt1OWZma0U3eTBacjJpMlpLVnlraVNPTnlRaEJkYm9yMG50eEN5VXQy?=
 =?utf-8?B?cTkySzVzNVNEQkxQZllhMDd0aHA5cnRrSFJLbUx2KzB1Ni9acDZGalkyUFZj?=
 =?utf-8?B?OElSMlE1a01CeW5pMFo1VFlJT3Njd0NHbXoxTlErUndjdjNFVkV4QzhxVW0x?=
 =?utf-8?B?ZFoyVFlBYzIyVVU1cVlGb1BpNTlsRFJvUWxGUXB1RXdOSDhXU2k3UDFURnEx?=
 =?utf-8?B?R1dGU2JnZldhQnBnaGRTYlFGc0VPbXVxbVAyRWtMVWJEOXFjQ1RpcmtjSzVM?=
 =?utf-8?B?MVNKK3kvUnFSMGpDRWU0SEtvMkd3eTI4YjNmN0VsUCtxZkpaTW04QlpsS3Ns?=
 =?utf-8?B?Z2RiYnhiZEJNdEs5bWdTVEs5c0d3WkdmZStpQWVPL1g0d05Wb2t5TmJncFdE?=
 =?utf-8?B?V1NpSm9YSmU5cjBDdVpnWlJXVHJ3MkEyVU1mMzYrcHFRWmFabktzV0xWZCtK?=
 =?utf-8?B?emxFdnpHbEM5M3ZSSlJZWHNMYytGRmRvLy9WcmczSWhTVzBUdVlTcnpyUmov?=
 =?utf-8?B?blJmanFXY2FxZjU5aHg0RndtRVpmUnBFWGFJNDJpaUJURVZHNnRJVytHUmU2?=
 =?utf-8?B?RmFRbzA0aFk5NGRaS042cGZITWNOZFNNZFBPS1dQTnM1NjZ4ZERrcTBLTmFW?=
 =?utf-8?B?VUpMY1pxUlc5VUFiL1JQUUNNTFVZYmV6NklScVE3RUFWeGN5bUdLSWhPVXJk?=
 =?utf-8?B?d2lQOHpVS1NudlJXTmNFTkxqRkpSeklzZWpybXJPRWJFRlNJZXh5NkhhQTN3?=
 =?utf-8?B?SlVHSzR5VUk4TXJFdUtjT2U4QUJZRjRUQkdEN3ZIbEJkajdKOTdsNC9RM0Vp?=
 =?utf-8?B?U2d0ai9jTVVhSVB3d2VLekdrN2lKOE1yUVBUOHpJZ015WCt6djNESUJNTmdu?=
 =?utf-8?B?cS8rZXpyei9UUVlzN1d5bHphdE8yYWFwbHc1akFhbnNaWENERllWRzlORWo2?=
 =?utf-8?B?SVo4N2pBMkdSSW5iTmRLQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTZJbFlraDllT1BVTU5QU2NmWHVJanA5ZFVlUVpGQSs1bEMwTmNVVnFDZzZW?=
 =?utf-8?B?UkdKMXhvMmozbmNORyt5aStaY0Z1eGVoeEt0bWZRN3hUd2xTMmRpb0R4VzFj?=
 =?utf-8?B?ai81RzdaQ2NRMThTU0RCTUdtb25wZjRnM1RxZk85UUF0YzVWN1RZRUQ2anNE?=
 =?utf-8?B?TDBMTExwUHNQLzRCMTNjaFkxRE5udUJSaDFuK2JRWklLRFYwSlo4cm5kZVIz?=
 =?utf-8?B?WkMrTHhkWVBHU29Xek9KK21LcVhPekUrUmZ0WkV6M08vUkxnSTVPZVcvaHJv?=
 =?utf-8?B?M1lmbmhvZlkxbEFwS2p0aSttc01JUE4vbm9VUy8vRytjejZZSWNhSTJnTy8w?=
 =?utf-8?B?RThtdlZSVlRwc1U3RWRkckZ6bzZFUi9ZNzJMdGd2NkJHelRJdGVESHQxTHAv?=
 =?utf-8?B?RDhaWGhweVgvVzlpNjhDckdaeHJzMjdLckJZaHl6TFg3YnVoRDlNdVVNVG9R?=
 =?utf-8?B?dldZT0RSS05hY0lIWHRweldLNnVJaUN2Z1hDalFYMG0vcW9oc0Y4WHpZUzZE?=
 =?utf-8?B?QThTNXlFL1dsdzRxTUxwVWk4T2VQa05XaWJPRS9sUDJueUplcWY2aGYwVGZE?=
 =?utf-8?B?bGNlOHdqdHVyUzM0SVlVbEY5UWJYYVlVUmxLekZheUJaN2N1SHZTdFhFSkU1?=
 =?utf-8?B?bVIxTkNOZXYvdldDZzhpa0xaQnFzOUM5KzAwOGVqZnhGYjJ2ckdla1JRd1My?=
 =?utf-8?B?b0RxUGJmS21QaDB6TUluYlEvT3MwdVlDUWtCdGlyRDVYVEM3RllBMlJUL29s?=
 =?utf-8?B?dmRSRllRRllieUJTS1JkZXdTZzRFenN5a2NSUnJBYkNuclI0VXJTSTcxWWM5?=
 =?utf-8?B?dVFOd1BRUTJITjFDeU5XRWluQXQvbVhUcnFMOUdsMDF6ZDR3c2ROVGtkSTdz?=
 =?utf-8?B?cm5xMitUWUpTVnhzbHpmemgveXhDNUhTb29MZElTTWpNcDYwQmo2MkFvZU9U?=
 =?utf-8?B?N1FpbkNYR3M3cnN3MlhMUFBLbDhKQm9TU3VQc1I5bHY3N0ZuRGNPZEE1QWEz?=
 =?utf-8?B?cERTR25oaDBveGFyTGJFZW9KdzBKQ2RrR1ZWWmtrNjB6RndQSnFjQWdNNGJ6?=
 =?utf-8?B?MFFwWXBOUWVHditYRk1HbUdWckVDL2RVV0FDeUdGQ3oyNHhmNTlEcTcxcGlX?=
 =?utf-8?B?ZElmb0tVR1pQcnpjMEM1VWZoWjUxQVlpR0RuWjJvRUp2dXM5ZDFrVXdQTWlu?=
 =?utf-8?B?MHpzSUtTL1BiUXBtMHVLc3lCLzZMcmNwOE15T2t2OHpaUHcrUjB1M0djdXZW?=
 =?utf-8?B?TytaUERMc1RrVWFxSncyUHAvWERvNmlnZVlnTFlPakJHTWZlZkZlK1h1ME5H?=
 =?utf-8?B?N3BNZnNrSkFGTjV0N3cxblp4cnQ0dzNnWldoQXh4MVV6VXVidFRoaHhCQ1Qx?=
 =?utf-8?B?ejdaNEZzdW1QYldQRFJFZ2NqSjR0N3VIQUpQdFBTa1lxdjBJbUNXZTVQMjVt?=
 =?utf-8?B?TGFjZFp3bXZwbS95YW9rQVZpVDQ4b0hWVlNkYWw2dEo1bFJZL1Z3VW5Od0hJ?=
 =?utf-8?B?eHB1a1c4cG84WFlHRlE2NDFaZUtOR0ZMdVhCZ1pEWjBpMHFiemlZb1VPaldo?=
 =?utf-8?B?MGVZbitKcTJKLzBwdmRGRklMcFpTbmloanBHU04weXZSUEtLNUdEZ0tvSm9F?=
 =?utf-8?B?bkZZOUFtZXVWWTlYUWtOQ1BZUGpkamZ3Z0YxZzNWaFBWRUlVOGtaUXBGM2Jl?=
 =?utf-8?B?ZTd4VThQbWlKVXBmV2xYdTdQay9VS1daVWc5c2VpRE1idXEzTDZlNEphdGo1?=
 =?utf-8?B?dk94OVk0S05vMmVrZVB0dnhBdjk3SkUxVldVN3FGQTBjZWRqYkRnY1NPTmtv?=
 =?utf-8?B?eExiQVZMSG1vL3VGa2FmR2JvcHNVck8xS1VYWXpFaWRuTStwSExmRDhJMWVU?=
 =?utf-8?B?RXg5cStxM1VDdEhyaEhLR3RoRzlsL1RuUThTeXBabWZWZHVyQmpkSkVjdGsv?=
 =?utf-8?B?dHExbHB4VVF5ekpOVGlqNjZFOHhlaXhneXIwcnBkNkJwWDBVangxdURqMlUr?=
 =?utf-8?B?bUhUWEkrODduK2JObjZiWmJ0SU13NTlCODJtd3ZZOHJtM3JYN0NYWmRnTzNp?=
 =?utf-8?B?RnlPaU5wMmc5Ym0xRXVqeWtPTXZPaEZHd05GNldaazVlam02ajhUNUVqM0Z3?=
 =?utf-8?Q?ifDSpCEzkD45I50ihaBDg/Pyh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nhIlEnoFbQs5YWAFTwqxulKdnIJeieuTKA/yw12w+XotmTObDDD+GMmnVtw1VPnukIc8Ucyd5jGW61VH0Mn2GePaEPFURdvWjO9bOxxeZpKsz+mU+WOfwbYDQhBYSK7QI1dPF6QfjrkrD0d/gfBZRAt3KIP3gpSrYgb7ezPzVNeIkiat7Gk26WxA4F7RLDU0tpKi1L9XdPmSKGAVMkX/fLH57mWFhMLu7f+s/+60wiIL4n02T4rOsLIsrKmk4FPn80FRnhTw4YJpf5y3+CdOHCZF+3LYYf9xWwS8+4mJ3c+sz5RTrG4yWzzHICx5togFfh5lsfVPTIZ0TYlrXodO/z4wEYfhcwOa7GNQ4z/wcigdr6Uyz2hkFtSOCtf3d9oRRRcVnDzhRCe/uqIqVyr8VBtTWyRnbH5C45KyCCtcjx+klmweZ3wr/O5XzhfzkrMkD3dqTH0gJJHoIG5SjVDG7VR8UCiI3R2ZNWhMy54kU5CU/8lLi8cBB2sIPmZyw7rtS6XOg/BjAQM+4RARtOxF0hg2hkCsYi53x6hmMZkJIDubc7CgN2lvv2UI0yofGNMgDxHv/UMPjKo28JmlnLKJkZeCILuYMhpgygaDbcWLpe0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8da5a8-ffbd-4805-e734-08dd473d5a60
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:04:59.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R5ZB+YorjdH/RVdvg7u1qOFmEqW+i5KqCxSkwN4VdmMNL2K00TTy8cYJA9+x49R08ZdqLt84M8eDc6pSjfFhoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6632
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070037
X-Proofpoint-GUID: LM5FGiORtmDe-QX7D0Gt9a9njK6eyAYA
X-Proofpoint-ORIG-GUID: LM5FGiORtmDe-QX7D0Gt9a9njK6eyAYA

I don't understand the relevant code very well, but
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

Incidentally, it looks funny to have so many "new" files have 2022 
copyrights on them, but I suppose they're inheriting a lot from 
pre-existing tests... so, okay.

Also...

On 2/6/25 11:46, Kris Van Hees wrote:
> The special handling of strings in the consumer's trace implementation
> did not correctly account for char-arrays that do not necessarily are

s/do not necessarily are/are not necessarily/

> intended to hold string data.  Thr trace action is documented to print

s/Thr/The/

> data as an ASCII string if it can be represented as such, i.e. if it
> comprises only printable characters, optionally terminated by one or
> more 0-bytes.

That doesn't read quite right to me.  E.g., 'a' 'b' 0 'c' 0 looks to me 
like "only printable chars, terminated by one or more 0 bytes" yet I 
think it's supposed to be dumped (not printed as a string). I'm not sure 
and maybe it doesn't matter.

Another possible test is all bytes are 0, but I'm not worried about 
whether such a test is included.

> The implementation for trace on both producer and consumer side was
> using the data alignment as a marker to determine whether data should
> be printed as a string (alignment == 1) or not.  The real alignment
> of the data should be used, reverting code back to the necessary
> heuristics in dt_print_bytes().
>
> The dtrace_diftype struct has its dtdt_pad member renamed as dtdt_align.
>
> Added several new test cases to cover various possibilities.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   include/dtrace/dif.h                          |  2 +-
>   libdtrace/dt_cg.c                             | 16 ++++++----
>   libdtrace/dt_consume.c                        | 20 ++-----------
>   libdtrace/dt_parser.c                         |  2 +-
>   .../actions/trace/tst.array-char-multi-nul.d  | 30 +++++++++++++++++++
>   .../actions/trace/tst.array-char-multi-nul.r  |  8 +++++
>   .../trace/tst.array-char-str-multi-nul.d      | 30 +++++++++++++++++++
>   .../trace/tst.array-char-str-multi-nul.r      |  5 ++++
>   .../actions/trace/tst.array-char-str-no-nul.d | 30 +++++++++++++++++++
>   .../actions/trace/tst.array-char-str-no-nul.r |  5 ++++
>   .../actions/trace/tst.array-char-str.d        | 30 +++++++++++++++++++
>   .../actions/trace/tst.array-char-str.r        |  5 ++++
>   .../trace/tst.array-char-unprintable.d        | 30 +++++++++++++++++++
>   .../trace/tst.array-char-unprintable.r        |  8 +++++
>   test/unittest/actions/trace/tst.array.d       | 11 +++++--
>   test/unittest/actions/trace/tst.array.r       |  2 +-
>   test/unittest/actions/trace/tst.array.r.p     |  6 ----
>   17 files changed, 206 insertions(+), 34 deletions(-)
>   create mode 100644 test/unittest/actions/trace/tst.array-char-multi-nul.d
>   create mode 100644 test/unittest/actions/trace/tst.array-char-multi-nul.r
>   create mode 100644 test/unittest/actions/trace/tst.array-char-str-multi-nul.d
>   create mode 100644 test/unittest/actions/trace/tst.array-char-str-multi-nul.r
>   create mode 100644 test/unittest/actions/trace/tst.array-char-str-no-nul.d
>   create mode 100644 test/unittest/actions/trace/tst.array-char-str-no-nul.r
>   create mode 100644 test/unittest/actions/trace/tst.array-char-str.d
>   create mode 100644 test/unittest/actions/trace/tst.array-char-str.r
>   create mode 100644 test/unittest/actions/trace/tst.array-char-unprintable.d
>   create mode 100644 test/unittest/actions/trace/tst.array-char-unprintable.r
>   delete mode 100755 test/unittest/actions/trace/tst.array.r.p
>
> diff --git a/include/dtrace/dif.h b/include/dtrace/dif.h
> index 576bda2c..70257b2f 100644
> --- a/include/dtrace/dif.h
> +++ b/include/dtrace/dif.h
> @@ -33,7 +33,7 @@ typedef struct dtrace_diftype {
>   	uint8_t dtdt_kind;
>   	uint8_t dtdt_ckind;
>   	uint8_t dtdt_flags;
> -	uint8_t dtdt_pad;
> +	uint8_t dtdt_align;
>   	uint32_t dtdt_size;
>   } dtrace_diftype_t;
>   
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 6e74b4b0..a5c9aa09 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -1601,12 +1601,11 @@ static int
>   dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>   		dt_pfargv_t *pfp, int arg)
>   {
> -	dtrace_diftype_t	vtype;
>   	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
>   	dt_irlist_t		*dlp = &pcb->pcb_ir;
>   	dt_regset_t		*drp = pcb->pcb_regs;
>   	uint_t			off;
> -	size_t			size;
> +	size_t			size, align;
>   	int			not_null = 0;
>   	int			cflags = pcb->pcb_stmt->dtsd_clauseflags;
>   
> @@ -1619,10 +1618,14 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>   			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
>   		emit(dlp, BPF_MOV_IMM(dnp->dn_reg, dnp->dn_ident->di_id));
>   		size = sizeof(dnp->dn_ident->di_id);
> +		align = size;
>   	} else {
> +		dtrace_diftype_t	vtype;
> +
>   		dt_cg_node(dnp, dlp, drp);
>   		dt_node_diftype(dtp, dnp, &vtype);
>   		size = vtype.dtdt_size;
> +		align = vtype.dtdt_align;
>   
>   		/*
>   		 * A DEREF of a REF node does not get resolved in dt_cg_node()
> @@ -1664,7 +1667,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>   
>   	if (dt_node_is_scalar(dnp) || dt_node_is_float(dnp) ||
>   	    dnp->dn_kind == DT_NODE_AGG) {
> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, size, pfp,
> +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, align, pfp,
>   				 arg);
>   
>   		emit(dlp, BPF_STOREX(size, BPF_REG_9, off, dnp->dn_reg));
> @@ -1678,8 +1681,8 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>   			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
>   
>   		TRACE_REGSET("store_val(): Begin ");
> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1,
> -				 1, pfp, arg);
> +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
> +				 arg);
>   
>   		/*
>   		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
> @@ -1706,7 +1709,8 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
>   
>   	/* Handle tracing of by-ref values (arrays, struct, union). */
>   	if ((dnp->dn_flags & DT_NF_REF) || (arg & DT_NF_REF)) {
> -		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 2, pfp, arg);
> +		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, align, pfp,
> +				 arg);
>   
>   		TRACE_REGSET("store_val(): Begin ");
>   		if (!not_null)
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 74004c69..58a2ead9 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -1921,23 +1921,9 @@ dt_print_trace(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>   	if (dtp->dt_options[DTRACEOPT_RAWBYTES] != DTRACEOPT_UNSET)
>   		return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
>   
> -	/*
> -	 * String data can be recognized as a non-scalar data item with
> -	 * alignment == 1.
> -	 * Any other non-scalar data items are printed as a byte stream.
> -	 */
> -	if (rec->dtrd_arg == DT_NF_REF) {
> -		char	*s = (char *)data;
> -
> -		if (rec->dtrd_alignment > 1)
> -			return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
> -
> -		/* We have a string.  Print it. */
> -		if (quiet)
> -			return dt_printf(dtp, fp, "%s", s);
> -		else
> -			return dt_printf(dtp, fp, "  %-33s", s);
> -	}
> +	/* Handle non-scalar data. */
> +	if (rec->dtrd_arg == DT_NF_REF)
> +		return dt_print_bytes(dtp, fp, data, rec->dtrd_size, 33, quiet);
>   
>   	/*
>   	 * Differentiate between signed and unsigned numeric values.
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index 325ba881..eefe8341 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -4914,7 +4914,7 @@ dt_node_diftype(dtrace_hdl_t *dtp, const dt_node_t *dnp, dtrace_diftype_t *tp)
>   	}
>   
>   	tp->dtdt_flags = (dnp->dn_flags & DT_NF_REF) ? DIF_TF_BYREF : 0;
> -	tp->dtdt_pad = 0;
> +	tp->dtdt_align = ctf_type_align(dnp->dn_ctfp, dnp->dn_type);
>   	tp->dtdt_size = ctf_type_size(dnp->dn_ctfp, dnp->dn_type);
>   }
>   
> diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.d b/test/unittest/actions/trace/tst.array-char-multi-nul.d
> new file mode 100644
> index 00000000..187fb711
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-multi-nul.d
> @@ -0,0 +1,30 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The trace() action prints a char-array of printable characters
> + *	      with multiple 0-bytes in its content.
> + *
> + * SECTION: Actions and Subroutines/trace()
> + */
> +
> +char n[9];
> +
> +BEGIN
> +{
> +	n[0] = 'a';
> +	n[1] = 'A';
> +	n[2] = 0;
> +	n[3] = 'B';
> +	n[4] = 0;
> +	n[5] = 'C';
> +	n[6] = 0;
> +	n[7] = 'D';
> +	n[8] = 'e';
> +	trace(n);
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.array-char-multi-nul.r b/test/unittest/actions/trace/tst.array-char-multi-nul.r
> new file mode 100644
> index 00000000..c1361e75
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-multi-nul.r
> @@ -0,0 +1,8 @@
> +                   FUNCTION:NAME
> +                          :BEGIN
> +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> +         0: 61 41 00 42 00 43 00 44 65                       aA.B.C.De
> +
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/actions/trace/tst.array-char-multi-nul.d' matched 1 probe
> diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.d b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> new file mode 100644
> index 00000000..75164cd3
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.d
> @@ -0,0 +1,30 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The trace() action prints a char-array of printable characters
> + *	      followed y by multiple 0-bytes correctly.
> + *
> + * SECTION: Actions and Subroutines/trace()
> + */
> +
> +char n[9];
> +
> +BEGIN
> +{
> +	n[0] = 'a';
> +	n[1] = 'A';
> +	n[2] = 'b';
> +	n[3] = 'B';
> +	n[4] = 'c';
> +	n[5] = 0;
> +	n[6] = 0;
> +	n[7] = 0;
> +	n[8] = 0;
> +	trace(n);
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.array-char-str-multi-nul.r b/test/unittest/actions/trace/tst.array-char-str-multi-nul.r
> new file mode 100644
> index 00000000..1951ae69
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-str-multi-nul.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN   aAbBc
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/actions/trace/tst.array-char-str-multi-nul.d' matched 1 probe
> diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.d b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
> new file mode 100644
> index 00000000..532c3519
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.d
> @@ -0,0 +1,30 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The trace() action prints a char-aarray of printable characters
> + *	      (not terminated) correctly.
> + *
> + * SECTION: Actions and Subroutines/trace()
> + */
> +
> +char n[9];
> +
> +BEGIN
> +{
> +	n[0] = 'a';
> +	n[1] = 'A';
> +	n[2] = 'b';
> +	n[3] = 'B';
> +	n[4] = 'c';
> +	n[5] = 'C';
> +	n[6] = 'd';
> +	n[7] = 'D';
> +	n[8] = 'e';
> +	trace(n);
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.array-char-str-no-nul.r b/test/unittest/actions/trace/tst.array-char-str-no-nul.r
> new file mode 100644
> index 00000000..3d56e520
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-str-no-nul.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN   aAbBcCdDe
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/actions/trace/tst.array-char-str-no-nul.d' matched 1 probe
> diff --git a/test/unittest/actions/trace/tst.array-char-str.d b/test/unittest/actions/trace/tst.array-char-str.d
> new file mode 100644
> index 00000000..70f6371f
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-str.d
> @@ -0,0 +1,30 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The trace() action prints a char-array of printable characters
> + *	      (terminated) correctly.
> + *
> + * SECTION: Actions and Subroutines/trace()
> + */
> +
> +char n[9];
> +
> +BEGIN
> +{
> +	n[0] = 'a';
> +	n[1] = 'A';
> +	n[2] = 'b';
> +	n[3] = 'B';
> +	n[4] = 'c';
> +	n[5] = 'C';
> +	n[6] = 'd';
> +	n[7] = 'D';
> +	n[8] = '\0';
> +	trace(n);
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.array-char-str.r b/test/unittest/actions/trace/tst.array-char-str.r
> new file mode 100644
> index 00000000..9778ddd2
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-str.r
> @@ -0,0 +1,5 @@
> +                   FUNCTION:NAME
> +                          :BEGIN   aAbBcCdD
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/actions/trace/tst.array-char-str.d' matched 1 probe
> diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.d b/test/unittest/actions/trace/tst.array-char-unprintable.d
> new file mode 100644
> index 00000000..d88df369
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-unprintable.d
> @@ -0,0 +1,30 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The trace() action prints a char-array with a non-printable
> + *	      character correctly.
> + *
> + * SECTION: Actions and Subroutines/trace()
> + */
> +
> +char n[9];
> +
> +BEGIN
> +{
> +	n[0] = 'a';
> +	n[1] = 'A';
> +	n[2] = 'b';
> +	n[3] = 'B';
> +	n[4] = 'c';
> +	n[5] = 5;
> +	n[6] = 'd';
> +	n[7] = 'D';
> +	n[8] = '\0';
> +	trace(n);
> +	exit(0);
> +}
> diff --git a/test/unittest/actions/trace/tst.array-char-unprintable.r b/test/unittest/actions/trace/tst.array-char-unprintable.r
> new file mode 100644
> index 00000000..1f84fcfa
> --- /dev/null
> +++ b/test/unittest/actions/trace/tst.array-char-unprintable.r
> @@ -0,0 +1,8 @@
> +                   FUNCTION:NAME
> +                          :BEGIN
> +             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> +         0: 61 41 62 42 63 05 64 44 00                       aAbBc.dD.
> +
> +
> +-- @@stderr --
> +dtrace: script 'test/unittest/actions/trace/tst.array-char-unprintable.d' matched 1 probe
> diff --git a/test/unittest/actions/trace/tst.array.d b/test/unittest/actions/trace/tst.array.d
> index 104d42e1..0779d90f 100644
> --- a/test/unittest/actions/trace/tst.array.d
> +++ b/test/unittest/actions/trace/tst.array.d
> @@ -1,6 +1,6 @@
>   /*
>    * Oracle Linux DTrace.
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2022, 2025, Oracle and/or its affiliates. All rights reserved.
>    * Licensed under the Universal Permissive License v 1.0 as shown at
>    * http://oss.oracle.com/licenses/upl.
>    */
> @@ -11,8 +11,15 @@
>    * SECTION: Actions and Subroutines/trace()
>    */
>   
> +short n[5];
> +
>   BEGIN
>   {
> -	trace(curthread->comm);
> +	n[0] = 0x1234;
> +	n[1] = 0x5678;
> +	n[2] = 0x0000;
> +	n[3] = 0x8765;
> +	n[4] = 0x4321;
> +	trace(n);
>   	exit(0);
>   }
> diff --git a/test/unittest/actions/trace/tst.array.r b/test/unittest/actions/trace/tst.array.r
> index fbb674b6..52ff28ec 100644
> --- a/test/unittest/actions/trace/tst.array.r
> +++ b/test/unittest/actions/trace/tst.array.r
> @@ -1,7 +1,7 @@
>                      FUNCTION:NAME
>                             :BEGIN
>                0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
> -         0: 64 74 72 61 63 65 00 00 00 00 00 00 00 00 00 00  dtrace..........
> +         0: 34 12 78 56 00 00 65 87 21 43                    4.xV..e.!C
>   
>   
>   -- @@stderr --
> diff --git a/test/unittest/actions/trace/tst.array.r.p b/test/unittest/actions/trace/tst.array.r.p
> deleted file mode 100755
> index b8cc8daf..00000000
> --- a/test/unittest/actions/trace/tst.array.r.p
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#!/usr/bin/gawk -f
> -
> -# Some Linux kernel versions leave garbage at the end of the string.
> -{ sub(/( [0-9A-F]{2}){9}  /, " 00 00 00 00 00 00 00 00 00  "); }
> -{ sub(/  dtrace\..{9}/, "  dtrace.........."); }
> -{ print; }
