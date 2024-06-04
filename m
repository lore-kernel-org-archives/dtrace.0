Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717F1149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524730; cv=fail; b=hNyysO/qPMCZ997/UdfUMByY8p3D/9gXPWMW20VSr3PigPKQq3ASGRZ9Uxn8SnGJcEX50HyzE6D4ZuqOvXGhhuXM0k1YwxvIENN9oD1/ngVQKZBQ9/uJaWvHBo0xLsewhKKXfRMo/TsC4blWJxSkh5nReyJzw73Zo9sO2Ld2i+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524730; c=relaxed/simple;
	bh=GdU4VeXF2wXHTTWmBMEIfuETl3EjguwnuMnvd/KLedg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jGXYAKfYx/XnBEfQbOvqDaEY/JGFpfaCa73qIRka3Fua0pz3UyWZb9GIji7x1tds9hca1BzvYF38XRasW/tArnoDuinKnXiByjvG+CSsO4C8M8++hhTv9hBk4LaTKeuQp5JMYmOqNPuzGcEVGDPGHQuLMsv64QKENgjasqGFY/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BoOaA000986
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:08 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DKw94DSdMOezz1I9?=
 =?UTF-8?Q?hdlBGgwOuFra+IzQkJJQsqxoQLGY=3D;_b=3DkNeAjbiiyfVXGIfcZ1FGgwBk0J?=
 =?UTF-8?Q?YZx9ktlEmYbQPmBHgNuJoYq+F+EWWTW2Il7gJi/NUb_5XSL2ZizkKlkHES6bmCW?=
 =?UTF-8?Q?T1mFS9eILJOkAiv6ldbftKC8HN0xU0pv9oM3kKwweur0vnKL_mS+GhSn4HO2y3p?=
 =?UTF-8?Q?bl+H4p9H0YX3q7I99GDehO42e11JvFxM5ur0sKR/qF/dgPUilPaZNG_vOtvHuh8?=
 =?UTF-8?Q?APZX1nLT0d2ygLp2Q5b/L3q4VvrPQLHXzUqxxR3OMGdi1lrEHAUOiiu7ZnrN_q+?=
 =?UTF-8?Q?13B9DOD6OCVxabG6NUvarsxdO0qbJK4g1x2W1/MqGDOOlvZSVTn4zomGEjOuBSS?=
 =?UTF-8?Q?DOW_cA=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv6u5me8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:08 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HRWtF016286
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:12:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsag3t7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:12:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYAxDL2JcLeKUorvB98y+T3L7hYA5zd+64S+n6xIheQdf216J2mci/jDSNNeyEUadfYa9lnB+vlodDW/Jd9105tlERT1ZP3RX7H7hoMZFTzRpLTnIPspK/3I5/NWIMiovbyd/UD95e42652/jjPtTurqWDpFjAW/ePEtjuMmQdEiXfxtVXoitppOOUqIFM/LIbxpIY5NLFbrkEtGK6PD3ZZMQtvfwiRVHZ2jsQcFU/L7gr0O6eWSr8QZrzxnM0pV2b7w0UqFBK8PnR92IvLle6qodXc8P9Z6wjzk5fKd5o0bjflHbo2oDLgL1IQR4IORaejkyDmK1NIh840Y7Xp+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw94DSdMOezz1I9hdlBGgwOuFra+IzQkJJQsqxoQLGY=;
 b=Xe3brHj/wZ4pLkOi8HLiM6lyaFlZCn3k4eOuIKGVXysuTm4SWVppaheVV/y7+vew1yNfhcXLTpcqfbWqcCSkgfH53L24yEA5rfY0jn2fSM5p8OUl9sITRD73K+vUF4wYaeju4vC0BCLahyWKNGbImC7iYn1HEiJYcshtCG7ldIOqXXtZ2JcmU2pmatPttf9Oxzk5XTPIjeIgwX2ICInoRakYQb44llWKucXq9YkxNjv7BaJECQ++yzfybYVtoLUxfDs8c0mHEXpumDurBUXaQrfZWAablSjGOsppnYDFyANV2sY4eJOSJdX5+q3BOcrqusFW+l350llcGBUJRK6K6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kw94DSdMOezz1I9hdlBGgwOuFra+IzQkJJQsqxoQLGY=;
 b=DO7+MAFbbUXOaSxicIBrboFEsLZE0Mpjqn6QaDw8eQQtbWfw/ZvJwqXt7x5bPxJMB1LxFNqFy1InSZl0n1K1dQUuyOfNk99ol0KK2IAdoESUMc5i2eZx4BcQgs/wod6Fuv5vw/igrCMe1uRLR4cz1W0r1Et3UxmEeokiMpV8tTA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:12:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:12:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/14] Clean up some comments
Date: Tue,  4 Jun 2024 14:11:12 -0400
Message-Id: <20240604181113.11505-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0021.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad74640-a78c-4496-b66c-08dc84c1d549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jdyJZanihrFK2IjeVkVpj1eehalo+KlR7oO1bT2Nz945pcMx9on8QFGEuIIT?=
 =?us-ascii?Q?Q7g86TFkpqpq4E4NK9Gsh3jUORkPvN3PyZAScz8/0Gc1OAnQzB/nUcjfGT5O?=
 =?us-ascii?Q?LUtIShw7DLf665kw2Wi6j2lqj8ya5jW0QiXGCzaBwtR7qrBqPCBivcy8v8Z6?=
 =?us-ascii?Q?2wMFr5QxXALiLV8RV+HJBi4i+kFZzqyscCczbZWPiotV9IETu86SlaiJ4jM5?=
 =?us-ascii?Q?b6nj8uK4sN9CcTFJ8vul1nUB060fdPZzTF8NWobn6OyAnj8/mI4YaHhrhobQ?=
 =?us-ascii?Q?h5KMDj5UOJToMcRoabmtzUoyH9xw2zDMle8hbS8MnZgGzC9cNAUBe6049Zxq?=
 =?us-ascii?Q?rQBIEDgAIDlRUgDIkA23ZNitZjy4YjiN0VSJWA1e2fwG8hyOWU6mMtboBBtA?=
 =?us-ascii?Q?MAAkFVoDyfpH327c3p97x9P8NXGehzK0LuyvV2Ma7f6yOyscoih34CP+rnlV?=
 =?us-ascii?Q?YOHzt0Ts0bewdKs1nWDSrWir89N85J6W3nTYSW5+RBvIRT5fx7LgeCz+cpU2?=
 =?us-ascii?Q?L94Pe6zEdzM9HPFGAC78esbbwrUvP+HKxQeJIRHRh6MZF83wR6kxZVxvEJZA?=
 =?us-ascii?Q?AgR5Q6Onq1p06OuaON0ghNyHuXOyIc7ElDx3PZezeHAAgc6kh32dz74n0d0x?=
 =?us-ascii?Q?hExOAnFCfMfexFqTKdN5B0/1h1d/cdKVT0S6+llUsH2r0kZ+umy/vyU1Z1aK?=
 =?us-ascii?Q?jmAg8n2irvSYOBE+Dn8KTZVOCGktGZbZmeDX2KaAzhbQpAEL0ZM5eVrDt0/Y?=
 =?us-ascii?Q?/74ScTqegXyNcHaHiksMMLosR5wmwTWsR0YbVrGj2eqPdhk8YUQokjHBr1UI?=
 =?us-ascii?Q?iqTNSESYA2BHZ6zYZQZ0vxCkOvvSRra+Mb9N/SIN7LGkQcAyL9lNIXZM5BIC?=
 =?us-ascii?Q?Z3cb3epk/8zxoEs8zJvBj7sDe0JO5o70PyDrMtzFBoYLxMDwT3unZ9gAJ8Co?=
 =?us-ascii?Q?4Ut7gMciY3gdapBTakX4cGvw6ZDuUiLWwzClsxTlZz70aJIGxcqi1bFhUr1r?=
 =?us-ascii?Q?aiLFyEjqd3JT9kqJeAVnoEabydUhhh2+8ZGLaDzX3Uv3FQ7iwvozRkpcsRxN?=
 =?us-ascii?Q?HiJx0TQ6jkdCKlAF7KY/sjeKkcRNlIJk96+tnfCBGN/mTjz8cREaJH+UW4Du?=
 =?us-ascii?Q?M8AjXtMXr/HnMMjRUoJZbc4MK5lIXJLlh7FJZ2L/P6j3fidL2P/uRHOtUoee?=
 =?us-ascii?Q?KGJqTi/tAfMwYEgiEpTFHMpHEmertbNtBlRXEVDhc6kAp5TipIWW9rT6tSuh?=
 =?us-ascii?Q?76Phpj8qSvc+nzcaCv+2yUXvJb1g7GkSJyt8PAZfIg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xkxype32POFoo+hdv4BnZ/rgHoDlZLXrOzWnQDK0U53Keb6s26YsVPID2kWm?=
 =?us-ascii?Q?7S6HlFb2HIzgC8mVJolbVGHdtLLXUFOZBZLzLBZKsdJZzj8JYZEj67jIvin+?=
 =?us-ascii?Q?QBIHY4ycLaVSVKvcvSiQxJGx5tt8RA2WTBF9/hjR0PzKDdl9jxxTbGXvMqCd?=
 =?us-ascii?Q?NIB1r4Q5xMunouRQ6rbQkTNixFabdzbXxeE4FMZ1rQgBPDIlwu0AkFXUO87p?=
 =?us-ascii?Q?utGn0m/SLnSnK1fjvfi0uDfPUi00pT8N4bM6ErevzumFAwWItq0ZTXdikMOT?=
 =?us-ascii?Q?lAFm5T+nhRdAIwlwuagLtw0bVunbOizKuDQqa1cLz+/mGNeISObqpSoILas2?=
 =?us-ascii?Q?8R/ePxsWAIsYeb4dePqs5RlxRlA0KInAlvm/xMMs0XfzH4PZpITrH6TWgLyv?=
 =?us-ascii?Q?e56HlEcQAIu8PYG0HzTLd2snEkYjvrjvDl7hU5hZAtX8XKmsajsgYXeVZP5q?=
 =?us-ascii?Q?lMfxKuuMGGdgNstqGV87rc59jiq2I4hWEMoRE9+cFl3O6eoHpA1eWIVDB7M7?=
 =?us-ascii?Q?Ar6ecMZk7wjG7TEtGS7n9vWvljWojkeI5zxRnSNw5bD5s6UpIt+CP2aYBsTq?=
 =?us-ascii?Q?9BQjbRPFNR+5wQp6c9HB00A/RTWRAubPL7e/ZJFL+Q91NthYiLHV1biw8kGN?=
 =?us-ascii?Q?ZOv50o+kLxGHA56tNSXshA37JCqRMAa4R2qhv1XFG9Q8Zea63W/ONAZODuGb?=
 =?us-ascii?Q?4xgKo2bNY+Su5DuWvXB1JeEfIYhnBa74GmWqM/ie8JdoTdk/z5UMvq/uQg8Y?=
 =?us-ascii?Q?BIDxeZpBzFZLt1nw5ditji5OMn+ePnJJC3WmfxgtS7Z3QX1NPiVSLqt0Apcb?=
 =?us-ascii?Q?bt1+ri1/jgAvcv8XroErw+eedJnbejJl7OxMNH6Lo1aQRMcXvg9eHh5qQutn?=
 =?us-ascii?Q?2T1Y2LsUHEn6oUGA+ksYaN61h2HAth5V3kJmJ+ttZoineF1pBjNKayl7XkbR?=
 =?us-ascii?Q?YrMvkxZGKELYr+pP9TZg7OSUeOY1DeMqoPHcpoMOZ6v7KXGdoCzjOORo1hHB?=
 =?us-ascii?Q?DTxRs4SW27SF5BkXJD4bvR5EYRbGFCUMeJ2pMpDZJAm2IbDQk9pTUtckWs63?=
 =?us-ascii?Q?VUcNSVEPYwAb4SBiooAPLoylpAUdeUfARM4wq5BYCQ97AihbQ2havBm4xhZE?=
 =?us-ascii?Q?I4itQoVO69n+HMTvtEQwdPMZ1bfMuH5+qSnno9ZjGcZwzd+7u6mhEG9/G32z?=
 =?us-ascii?Q?WlYCFKppJ6+iPEyC0f7N0sa8UTf2A+UK2HlxNw6ydwi46Rdz7zIlX+gIL19I?=
 =?us-ascii?Q?x0Y7bW8iyIESyENUcvp3Y1CMBG8FQ0Z/PC3ZjdbtGXmCEwAqrH479wsBQyqf?=
 =?us-ascii?Q?2I26yoZ0MqfjxCzsARzb67BH+KZf7U5KLphJoPAGuconjXYR4aexx64UeU15?=
 =?us-ascii?Q?EN4JAwYSDV1IDNzz8DQRK97GQo0wLcjOhGPt6VD5oaqGE7x3667A5XR7JqaM?=
 =?us-ascii?Q?EFRwOrY+3Kn5YBGWfMji2MjQmp6MRu3Zwlxmg6BEvYNprYiOoFFALzM7FKOn?=
 =?us-ascii?Q?IqnNZoMGyFwhnU3RNf1jPbZGVXkE8y7egIqZltY2Xlml9MIXyoShrDdnYlT+?=
 =?us-ascii?Q?U7ltQ17KGMwAr63LvKzcpSJ0SDnNHxBQGJqAwQLj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yX9bMklMlR7xRsqHf33N5lNujRZgB801qy57wwubyXXgGa3UyEUoNNa03GoF7r+Eh8rO72WHsp9u3HDkQh93dZT6QUCkdCP8VlLaoPen4EWJJkVzZv2tCF3bUVK148ko0fUhm3Rgs4fz78gUk6OdMr0Ft+GmPDVpKnEhWowrkxEFRW+a4oWBgIoPfo3/WCFMaVB1HskP2tUhIMkNXRZ08sXN3n0TElvCWI0G8RxRhQzNWvMrMY6HiiBGqOa0q8wKDLPq0SehtsDK84UQTeInk/bjYqcCdEMj3MfaK28eEOKb8dcoBXImZgXFKcmcWOYYy1Le04zL23jqI3q5SH8Uawg4Xt5+wV3sglOVzBBpkX55YB1lutXVBuY01/aS57ig/YRNbMU7TMvGSG0lZuaI+LKtSNBCrIEYaMPx9/vJ7KJlFkBtvtSf3XRbcltG9nTQUJ9Tk5Vpo1kBpiFzxtSLmS0UeTQ4Gv6gyZZPQT3xwl8+VLm5MIUypvv/SAWGH/5vK3xSw3I+lhe/BFmXN/u1msa1WceK/kGLBgIHTVW/gibed035cJVvMJ+Q3A/88UBA4OAZ7pT4xmoe6Xmk5kb0hvvkfpElQB7Vxw5YJDEzqas=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad74640-a78c-4496-b66c-08dc84c1d549
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:12:02.2992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuWl+yJ7OvE4EdJfN4lWzIiIoQJi3Nog5lfArE9nLcUnfSCrxj0M1fPY1H4MBHB+Nb5InYyIUSdbd/cNu/ZHsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-ORIG-GUID: xHz2McjG8_pot_CTGYtHcunAI3Vu1MYU
X-Proofpoint-GUID: xHz2McjG8_pot_CTGYtHcunAI3Vu1MYU

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 0977406a..4fd2d359 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1150,9 +1150,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 
 /*
  * Generate the function epilogue:
- *	4. Submit the buffer to the perf event output buffer for the current
+ *	1. Submit the buffer to the perf event output buffer for the current
  *	   cpu, if this is a data recording action..
- *	5. Return 0
+ *	2. Return 0
  * }
  */
 static void
-- 
2.18.4

