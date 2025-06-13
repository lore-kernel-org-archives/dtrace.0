Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F33817B4EC
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824351; cv=fail; b=EXphVkbtyfO+7qYDFw9O9WGaPkWSlOQ2Nah2qZZi8Dr0kkqj8jAwcFV+GtvuQhfGFisoU5IqxgQT+WSaY6Hmbp4dRNUxJ9H3lybh+6eeTDfX1dCmh340zKV094gRWarY/kANknwAvN51zPzAoARp/v/32UwTui78RQ8KEB/QkEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824351; c=relaxed/simple;
	bh=9J3RmgGANpSJVMOgcSxR9NSwGOggIw23OG3/0mb0lrs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=cOC6991VihxutjhSV5qUuOPKmEXw1TVeBP8PYiHJ9dcZMslD8ahr1agSPNjrTyv1UnDJKltve0C6fkxIIyCEI6/e9Ws7/CteL+sOA3rwuS6BWzWq5n5GgDN8w+aM98BCZkpwQz4O6q4+Hk+d9SuWWNjzgGH8/KOhn+L3oAlVnFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UucBjOYr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Iuj17HNT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UucBjOYr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Iuj17HNT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtdB2023698
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=u5yOcGsanJ4mzTbxAS
	oi1G2XDf9hpRhxvpqNAduXM4c=; b=UucBjOYrqF4IhXM0E7EZBJeXxO7ZS60VBy
	BYvZXkyqS08l4pn2wQaAdNOyoZgyvwvZY3UQEdNreCt9HVwPEeft0U6Mc/c0zm4z
	AoDBLxl00K3qajmWh72jkHt0+zNpRRh+v6rgRSSn1sjjY9aqTAN95LOea139sas+
	zlnUPbj7kiN+5SETbC9NZ7baktKLEfyj9oMotGpAuVe2lwsK1xRbP8gtJQxEnB/v
	BKLMCsb53PrPkpM5clc93uLT+4SuJwpyb/cV0g472rMqVBNEAbKyUkltyBuoXeUK
	FCUw311sAq0hE9tl76GTM7r+MPLMJQUVHO5rPRKsQbU8wjJ0bzCQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dadbhkt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:19:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEGP3L031889
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:19:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bvcya7q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgNPNuzV8GmLS+p8rChIOOyysmSDqeCU3gbHFXOieU1xqOLrnLyn7Wb6X7Qgv6KJsnWlDW1OrL8/hbPdEZhbzyles9ugqYAxOT5Q7JLrcyyUUlipUEBvcAyJ3bal5OGy+zh3MlY1sZCkPMOLwfaQ5QdzZrmfGn+uY2kP3eKQWZ4pCq1YqIhJM4ob1EiOSdNv0HtkrD1wM4UCsanpx5I5Bdul9Yel9BC4pLryif3GWHW6JiXaDoq+EwbkNVbkD2XL/c/WO4GwGtMCpYEg61j4OWuloqK5jGXAr8RVbcofQ14rqlk2f1PrfiwGKP2DjmLRmYVRiYXweQ7nAZnox5l79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5yOcGsanJ4mzTbxASoi1G2XDf9hpRhxvpqNAduXM4c=;
 b=mne5L95+571XZB0ShW3iRkfxd5v4EHCjNW5bNKc6Sfh6aJ3QyyTZ49NmDAQI/7pDA3pwzxCZng7UYGdr2w+W9CqdrF3WDkgwEhZ7cR0L1hyFmaitsXy+kxdleEr2DNI1sr+fKrh4BltlR+yS2yl0aX7aXa7tLs6T9cgBe0aiNk6TEXEphmnfq50ogyKtIXKW2hiEV6raTMSlSTqA62IWdGq/mdPWEO96/quPj2coP03skuqHUdT99DV5TO2PXcfk93BErs+lE/f0iqj2XowtVyGfB3t7GBIRmR6kPvhLr8ETitchi6UITGM+6YuRMtLxL8h9+/cnMPz4D7c3b/sOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5yOcGsanJ4mzTbxASoi1G2XDf9hpRhxvpqNAduXM4c=;
 b=Iuj17HNTuiOQiSBeefcEX5ZulQKMob1/l3E38uX1TjF2T5zNUTPvuYIGsRjhJ1JQtrzqOKRMW1EhVWio+6cvpWPeJl8jlEP4ga7Tn++qeKixMTic1scUJeTwUHIVWsKIuQJXxFR4IZ/blRweRJVlI0iRZm9AULot8QLcQNumkwE=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SA1PR10MB7664.namprd10.prod.outlook.com (2603:10b6:806:38e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 14:19:05 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:19:05 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Make the USDT "only enabled" test more stringent
References: <20250603203532.20743-1-eugene.loh@oracle.com>
Emacs: because extension languages should come with the editor built in.
Date: Fri, 13 Jun 2025 15:19:02 +0100
In-Reply-To: <20250603203532.20743-1-eugene.loh@oracle.com> (eugene loh's
	message of "Tue, 3 Jun 2025 16:35:32 -0400")
Message-ID: <871prnenc9.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0327.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::8) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SA1PR10MB7664:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4e4791-e751-4be0-785a-08ddaa8540b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HUTbfZNSVW4Ho5H5onljnfzuwensTfP8oo18aMdw7zee2s0IRNKzYO/cvxsi?=
 =?us-ascii?Q?inpMTB+GXJwYKK9w1gRXn1GB10bOZlXfKfs87ms+PaWs7KAkSz0cvtfPg6fC?=
 =?us-ascii?Q?8HFpoX/YQAiiVJtV+5uevubPjy3gl0LdobbM46N+brLAaTJxy5VHRVNjFMuO?=
 =?us-ascii?Q?Nci7SQoq/5i3+uiQ65zmVZyyh8aJgSSLM/7K11n22aLl46VQ7AIB0GhuEaTg?=
 =?us-ascii?Q?u8S1iAN6uQO2DlYXaXHG6sxwuWroB9pFATQy6OoObN10Zh40PxmFhX7ZUzr7?=
 =?us-ascii?Q?u3PufXZAX8zwDQdpmf1epi+PdvzY5gWkaii5enMPjfICCJMdA4tRx4NHdNVi?=
 =?us-ascii?Q?jF+Vp7Y+Wpu4Mz6XKfQm5C1d4H7rtUu06m102XowYWhBmlB3yeptMw5lgQz6?=
 =?us-ascii?Q?BqmyWMdnFK/DJ6oUu2NIA6NEFFCrZaKmAb5ALVlCvgVf28+jH37yL8zXDEZy?=
 =?us-ascii?Q?E00ZwHFoZ59CUBPpaqrvk/7Kxc0PksGduO7y+7IyMFNt32rZGtgjdgDdHwMl?=
 =?us-ascii?Q?KvxPsRafM7okkjIzXnz/CyQKp46rBGtrmsSe0ryO2gJifRI6ypt/8rHcsQBn?=
 =?us-ascii?Q?5+1i7B1Z3pSvcG06AVbQjFsLBIItE0DofqeeWfg4ibKBeXYF6i66717kDOny?=
 =?us-ascii?Q?s6UQhvqnKyuCPOSXW6PTt7edEIA4dAAR57jAdGeusK8ehler/JncxLhw7z/A?=
 =?us-ascii?Q?8IqSGHtCLltVYpBDevhSXruVnUO+pPuo6GVYMdk22+BkPLJSxTRdgQXF+vQB?=
 =?us-ascii?Q?+J7rbjItNHrRfKnrh/4k+7V4dns+ki8lXq8CAnuiE6DJzxeJ4pEX+zSyawor?=
 =?us-ascii?Q?KTvtJcGPkKmUqXr3ccvu32a6nGg/LMbNcRTWTrP0tekbOLyrKdYJkvWXA6H0?=
 =?us-ascii?Q?9ryEkbchfozxDzluXklO7GpoOc56oV4apyDx3Xw0YmSiezJdb1tjPsH5V+A3?=
 =?us-ascii?Q?dNiigHLJ4c2rteqshnuksSI2t0mF36Ecadnw0pmflZIYHWfBUXoLgr1jd2J8?=
 =?us-ascii?Q?BnNXE0mYmgTh5mPXx1SByfiLzv/qqHqESLGS1mmCSsJQbxbxQP+OX83dkEzr?=
 =?us-ascii?Q?BSelEkLvfb/BAkOuG8yBatchFCU2ZjehZkol3F3sbMMbVDxNfsMccAmryurj?=
 =?us-ascii?Q?+0LVJiRGW7unc8FQussmCM7ihHMwmO1GgfojUE+PlRu1eQMSxOdwowBDvzMl?=
 =?us-ascii?Q?JhNyjq0fd1veXDCfn5KK0PYJKZ3cRALeyChp5X2W7rmdbOFZAKlemvGwOq3M?=
 =?us-ascii?Q?hZuSWKTv0aPduLUuXJ2WHUgeP+wzjfhIxqvjt1IxyQbB6f0WnVgk3tYcyHpF?=
 =?us-ascii?Q?WtFTdtmp+1yrr9mle3S75Sd0afkjrwwi//NBMcEyGFyt/akY0FC5ZHPi9sD0?=
 =?us-ascii?Q?0ix6H0qdcztnLFuib3Dhg+MTXc6tRxzAaZx1KzVhr3R0lJ7KgpnHvVcq55Cg?=
 =?us-ascii?Q?FHDCq26BBhs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NUxkn2bVS3YaOSzLYWDFuotRgiI6+7zRiq1Jk5d1+jWTw6qybmvFtBHBSh0O?=
 =?us-ascii?Q?DXAq/DuzXU9yOX9ejMl8M9gIioa3ddxkYY8i2skwU3zv8XDg8+PoagORRwg/?=
 =?us-ascii?Q?HDGJhr6+GoCmkESS9L3T9dxAr+7lB0ixl2kg9x0wHjzQ+O823f7PnnpY15ZZ?=
 =?us-ascii?Q?1bGCXIEIm+ID9Cd9+pJlLJCsO2Twe5qUkrVqHEK2Qf5S0wuKR2G9k2qUVNse?=
 =?us-ascii?Q?vso+7xS3QG96MsZDJ7Bo4KDOQ6z5hPDBdmd8jjrCslk8M3/TVD7+xISJrmOE?=
 =?us-ascii?Q?cP68mGxgdgaxgyJ30q9rl/cWRpzxbqX2AfXCYmuctlnh7YKa8ds1MZmuQ9kq?=
 =?us-ascii?Q?ZfpaCozEuEpYQeNQ8Rrf19C/3BDy25PcUivL4QgOqd2sjqpdSwuQv2hioPcr?=
 =?us-ascii?Q?YGeBJRzKXMg6v7PkK58OphFn5WGxfvlatqofRVmCswLGjyVLLGS5Uko69LFB?=
 =?us-ascii?Q?BrCWn/m+HH4ZKOumjsKcCzWSRmxFsbiW11amXpEXs/jyxPgrtA5gMKKU3PbD?=
 =?us-ascii?Q?bRYVWFwPkPRSmUHTZHDKt9+y+gXkG/ciK5kKuRgot+rWUsNWjiaqAH8QbPok?=
 =?us-ascii?Q?L/x9XD9crCn7FI1XQL3PDnArXMXpAD0b6V24O7ZvunY9QJ56jQowEii59Edx?=
 =?us-ascii?Q?eS1dzJTA81cqJd/DB44Rl3YHtQh+1QzDv61UDOwEwDOUbDfEzGufJXCUmy3H?=
 =?us-ascii?Q?pvPZccL0zpsNFALmeFYE4nbc2+X3GpPOuORjZz6F16ydgn+rOio5iddLLAuc?=
 =?us-ascii?Q?7tl4fohm6+s7DV6M749YWUp36KNkanAfvXNME54nWlRICzDOiEaK2ZtjD3F1?=
 =?us-ascii?Q?+cKO6w7LbAFi9Hkqq3MqN0NN17GJLKyvCVDI2yenIdoXHjEMIRYws5N9YhjM?=
 =?us-ascii?Q?f+ylpViO/kH6QYcetT+HHuz6oDeN0jW1JNTXrrbDeQIEOVwj/zUPYkH9tR5W?=
 =?us-ascii?Q?mvJvg9cxK0NtqKE7Zwrs8aJCTVDWe1QquM4gTmdS5ogQUAzfeaj5fG35rY0W?=
 =?us-ascii?Q?sWAyQE4nSaBqb5qDezl2H3mzMMg70GUnpbAwnhhyMuiv7QKciqxhLMdT8csT?=
 =?us-ascii?Q?d9PaDh66um6LhT7YjEd5pYHDVp27b3RRFm99G8bnykXuFYKZ+emNc59O44CI?=
 =?us-ascii?Q?h0XI1IGh2uUARyHJ1aLueCEPKMvl5xt51kRe71dv5xjxJWqMwPN/JcwtBbeH?=
 =?us-ascii?Q?eALLzq0Slrte9ssB6rn4UZiTZYeQZK5KfD/UU8sdDFhteulBO2UUwV2BEuri?=
 =?us-ascii?Q?d8mb48vlu/mL8OxzI1xSUMCD6FRzVtGIX8BpoZ0mxDRZHmoSCEV90Wbfa8h1?=
 =?us-ascii?Q?2o2SKZqI1huSIaf3Uv1lcR4+1PLWWufSGT6mmDFtbiTqrisMRPCfhVEArQaI?=
 =?us-ascii?Q?tgK5HMCAAPn1Hf6sWAJgjO0rU4SIjZV73Kkc6P2o0sbZ2foJ4MqFUKNNRc0S?=
 =?us-ascii?Q?/4fD+Yea7kt8y1vS4bvVwJv63TX/+UmMPbtHgqUGi2X+FJXT9Zd1u0zKWIDx?=
 =?us-ascii?Q?5foEKfsKL8uqmkhk7jRO14RiZLqFkNJf3DOlQX2Tlq278kSVciZVMqMc62tP?=
 =?us-ascii?Q?5fmNdnGC5Ref9k42dQmWgnw0SfDhtILiB1MabOlreFyiQwqUpNgSmc8flbjN?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LHUJYVs/GC3ppq43LSH+SjlADAVR1KT0GHQDu0Z7SKHXMEhC6jgdI+1qgh+DXbeKe9VBO0XqbkIHeMcdfwEeWZI1TWZC01HcNPB2ZUd2FZ3Havwqygd01MO3grMuxuUBJynN0J/plZ2TvzDPHprLse8CHKXBMvn1od+fX6Mi0uSW3f7BI3NRgEfuM+nsdJTgXAcCDtqnmY+AjH2ywqM0F4MZgb8+o8XW/eYeO4Lx0Xh06dlkY3ufQdwDammztUzfdiuCExKBfqpl/gTe0ej535VKHiw7PpTC1okWk19FRnIV5mKwOUjkDV4rSyhyn6GXjXIGG9UyHFlHb9LaMSLN/uiqQ7L1TEErMjXrHhFk1v8i3kQm0d68OPiDgGYUO621WtOcosqUDv+eEicVRNFg4fTBCmetIEwGDrIl7Q2IH0R3z9bLZswGlHsP1LyTlIqHnHJChSv5x0cGoGEGyMqZLEGwKxjXJHNFS33pOKvbu5Cbv+jRIAQvY/pschTGFVVkFShz1qGJaG5T2Hw5oFSqvAx99vv2bF/XAmH48aQLVTs8Sxgy2yrc48d8b2+MKZNqnSKKNYZC4ieKWB1e+kwJMLxzQtZ46pIRz6UQMmYD2YM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4e4791-e751-4be0-785a-08ddaa8540b7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:19:05.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3Cn0c4cWdY4K257axfgTIbxEgh2BqpkIM0U5L3XpcqZ459f6YC4CpNVMYrWMJ1iZsziLv+045xvvlG7NPjI+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7664
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130105
X-Proofpoint-ORIG-GUID: GdICmF5S69ifogaOO3v14wCeFnlGmqWD
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=684c335d cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WfGJ-7nFdo8sMaxP0JwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNSBTYWx0ZWRfX5ctXC8lzNJhV RtOgmm/Tjk85dZ0dZo4bx5NxxQiB1ZiYMsJEsvJsUsQIQzAtksSpX5qrsxy3I8vBYbewZPCRpxq 9IGZDYARGAD31UqcceLnRdzfu/NXwHILZjHQ4QI6L3FClpxUQz0RzlcYsx2qMzUfInwAaODbe7q
 DACorlVk0IHPXst8DMx3DiYcdlspimhZCZtxbks7n9kOXVaefUWGJp2rSrEAMd/v0oeM5tKivkM 458pCWJg5JFlEip6FhkfjfKFkcLvriFzdT9Zop4VbdCdH6riAYyrCxqiENzWdw0BZ6b1ZX5SHL+ GphKd5tTXtXB0a1uyDCVT+fSfHhUIg0Z2c0r6ZrEilrVyX5PSwcmgVDpMO3l45rJHzz+uw2Rom2
 /hDh5K2VGA/effjhgU/LRMJkbRfrH54oMrk05WwnBSHRoeZCGqzkF4dX5Xhamzp4bQO8hhgm
X-Proofpoint-GUID: GdICmF5S69ifogaOO3v14wCeFnlGmqWD

On 3 Jun 2025, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> What if a program has an is-enabled probe without the corresponding
> parent probe?  It should at least compile, and we test that.
>
> Add more checks to the test:
> - the is-enabled branch is not taken when run without dtrace
> - the parent USDT probe is listed with "dtrace -l"
> - the is-enabled branch is not taken even when run with dtrace
>     if the parent probe is not enabled
> - the is-enabled branch is taken when run with dtrace
>     and the parent probe is enabled;  however, the parent probe
>     does not fire since it is not in the test trigger

Nice!

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
