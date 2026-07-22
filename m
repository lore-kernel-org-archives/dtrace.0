Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD61F3DBD43
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754574; cv=fail; b=AapyxPhHmsBF22e0RhJ5HYno3cM1UYni29/qEtX2g8+KzROMSo8zTlB8RgAJU+XPo8yCH4zLRp08H6qwO3903wQHRclvmOkR6fsPDMdZwBDxRDC2UvK3mmkLL85r5PBxf4Mpfq0Zc1tFdjKYmu0y08o5raGP5j7BkC+l+5A1RZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754574; c=relaxed/simple;
	bh=EVGe4hdKCsWsU5HXzqmETefGvILlu6T6KrQBZe6tkew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PSyzNbgDRZao7XlIQcurhfcTwZCQGBJsOnHeL/VzoxV/AmS3LP73wxmG0rIUzZwbX4mhUUgXKEYqvB9mnVe9vvAe5FxXEMyceGEFpEzEjfwMZVP03ptHLMyflZwuERll/3dIhtYjILoLdEyO9v1vK4MgKBv2S74xlvGg2u7l9As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IoqNlkep; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k3yJ1gcz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IoqNlkep";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k3yJ1gcz"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MJtSWB071406
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XvcgmpN0sv4bL5cKTO
	A9etXMFHFVxdxznZf7r5zKmlE=; b=IoqNlkep3Ljg4QjqEryHnkhDaabl9VCyPR
	RRnMETZWgQofHPDzxBGcO477i7HYrOH+KujTlkK1DN+zfGwtl+ClGudiTx63JFNo
	++KXQVZvXOqZ5j6VoN4ybPWKJMSznOkxzn/W0LP4qi8raikl31i3sWkAkny4QDUm
	TjsXJP/FuNGkvGqwoFTOYK9EvvUic/hjBl3gcoOIGdUgUbJ/5mf+Ir4EjYVUujVC
	Ug0JjE8Rqo3dWdHdsRBztP3ibBJeApavbcJcuZmgzIk91NEHlnMYk6+E8YwKJDwy
	64FqDzg+F044Y0JW3MX7WN+mGgNNHFEFLsSL5M1vGeaf7ZODCqhQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fg1n365hg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:09:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 66ML8GkH020492
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:09:30 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ffyxe3jkt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Wed, 22 Jul 2026 21:09:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lx7YLYcHFcR0NnOgsgYXe6NR2TJwcYaUVuF852/WMHzLUKMRPrUjJxsdI1JggbreGHTnpK9XXDYzpEgjCQkwAXlVMcnCo3QnuZmu9WXl935CYAaWkldcDtKBoDrwQ+jAmx9dE5pC0feMe1grn8dAbNJX54siQKhiu4d789c9zJee156popDz1JsFoe9wegq1w4sAKWgZylwQZUqAzs4jNKe2s2c7X74aftQq2zEs4MX75hD7AdxJpa/wmjKzlmNQe066W6GiLzOSJx6R25qIgVTZTcT4SLkr8L6xiHmJolaTdTfB7sJcOnNiPeN7WjoTctfKBeED//XJoUMoYIEdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvcgmpN0sv4bL5cKTOA9etXMFHFVxdxznZf7r5zKmlE=;
 b=e2blki50A6+lnRmL8IrfYUwh8qvztBeoBtUoAxu90awk/6g+qYvDUnqva1sS6cDptnLPhjcWf4AxpNHBld27wk6fzec+v68WLEli9oBfYFZEaiWvFgB0tmgIVeaBkLFok3f7lPrGCojmNKUk2ljOblEOOkmIpu6qlwDTiQbc3ooP0H2jkaDDg54BY8i0oGKmkZuAMnY4bmGnCxmtDuPAzegwKa8BNk7Pwkv2JEYDAXy0ufbK41Bv7NtQju/0Cd3Mv4jjWOAqzBPjB4J2qHP9z3hWsw81tNSJG2nVqEhJsq6zaibd5b8o/j23n/N6hEyHhPUPPdaAOX3bytjmM4sS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvcgmpN0sv4bL5cKTOA9etXMFHFVxdxznZf7r5zKmlE=;
 b=k3yJ1gczIyeRBqXqP1LTcInRWNZX+I7kOQVuJ4t6DY5Dv+jtgfyNsYYo3paETnY7XCMoXhOPCss7SU8WaBzJp7rfXck6/4dMuBpEeet99jnjf/PZqmnAf3/QQe6RtNS24K68lwYBSAIj4P19pr0bE03wb8OocLTHESC6tJ15WJc=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by DM4PR10MB6111.namprd10.prod.outlook.com (2603:10b6:8:bf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Wed, 22 Jul 2026 21:09:22 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 21:09:20 +0000
Date: Wed, 22 Jul 2026 17:09:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 1/7] libdtrace: Support multiple DTrace handles per
 process
Message-ID: <amExffYtEWp6jOzb@oracle.com>
References: <20260721152452.184842-1-alan.maguire@oracle.com>
 <20260721152452.184842-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721152452.184842-2-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|DM4PR10MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a37b1c2-615b-42c9-fca4-08dee8357f37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	phPPiMjHOTzUYoQk4U6+ksZiGOh/Gq6j3cfgDrtg9eNgI/7JT6N0f1CIv4WOhs9y5CMkoY67W1g4Lt4EnlPB552oDbAL9DMTDNElwzmEJDtz6A7sEBxgUNtjqCiTcySIl6HXx9Q/mxL+t87gS3WBI8Z0q3TIaJjWZPqGAZkF51ForLPMkNOQJsqfT+1o9Uj1y+8dOD2jnKgBxAxWtYE8gRl08brdYWmoy7J2RDsAAXFj3frdSBxZ4x21K5ahOxCbhiT2hQX9AfVzC7vcIjWqvRdJN8Qc3P6Qv8ZUGCAcRvG6/cmq/LQ+nkl9h13fR+cbJ2INx2MjJoi8Vm2Sf8CFBdawVYUxQOqiZ9kEH/tB3QwKQ1ROhQhiQ0SEuIZLTf2pwjfKgLafWSotjmDgIWbFcda7d9rPn0I30YmP5DhoO3M7vKx7o7TyafXlqIqfQBdvRl7/hZ3j1kBIOmiAXJDZImv20w+XCT2KMBJnIXCaKIZAdEow6AJUPfnnWIqovwUwBirs2FLQ4kkXzpDcr+SOTva48Ef9mqQzCh9kqPRLmh0RaFpySPUc4tnb1omtA1e1QGbzhQgJy6I+ROQFdDtDbreHG44ZWeN5NjBbeAHDQjqPUDeMjnh5meunzpljsp5xGA9sBLS/lTSE8lkducvPmHLlILT/+zP0bq5nCEs/hnM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0I2w4IQiErMF2QkA9E4TWz+kYGJHcppwvBFXLMX2OBjg+EOdegWI2Spr7d+F?=
 =?us-ascii?Q?s9L+NlJ6a4ov0AzdT3k17UJ0xL8om2GSHYxr2NkC31igP8MjvD2acChPABFm?=
 =?us-ascii?Q?FMreaG2JX26FpzYuphe66Jutw1yPuGH7vZy/Cxgn8SlEUOOGQSyIEUw+lN9j?=
 =?us-ascii?Q?OhXfJavgCV122yAsqJrr/c/H7d4zbvx3+TOo/0Twd7CwnGIr/LVhmupCP2f/?=
 =?us-ascii?Q?pihBlHcFg2IW40XRljhFE1Cqdcsae4SzH3OeG1F0EZDwq667t5OK9VjJcPmr?=
 =?us-ascii?Q?C080Ga9jMmB/dUbG6ymoSrovzaKCxw2SlvgnY4F3u8ZcPxwtFIuMjuyILCfc?=
 =?us-ascii?Q?yrDkYDrNrQUNJ7t5jeBA0xxBQMKhpAl8eLaai/sbSqhfsy5P22N01LWxG/VS?=
 =?us-ascii?Q?e0WAVDKac8QQsCI9PcL9sU5jeQ3MxY0DOHm15tyR9o0f4vkEbyt7agPqqPua?=
 =?us-ascii?Q?bqOEGlIyZTPNe+7OBUUuLlDFk1anMHr+j0wE7a5+BN+J4EGjrqEoCceBkQRi?=
 =?us-ascii?Q?l8bsfJxwu6OWF652zbuqAw4n71n3o3YGfwc0CYZYr2kM5cKBCgSU0bIedmov?=
 =?us-ascii?Q?XomDePu7+8vpb2WTQndDZJHQ3laSqvp+YVEIHtVwpUtF+aQ6nZ+SWjE0x4GU?=
 =?us-ascii?Q?ETcdDoFHB6E00miShbGTq9iqhPSpsUo6uVH+oaPMnrxJmzJ+yXc/lVDie35u?=
 =?us-ascii?Q?9HXxJDlf/QDyOl9KnJ/yrfpCccf22Vj3/DRvFX7BFbmUZTK0ZTVqqOwfFXkO?=
 =?us-ascii?Q?PzYqlqUa1mpUyqw35iXpXGfU8BJJbS4dTKM+cGJ27tE6dty736hSiLbDNFE1?=
 =?us-ascii?Q?QErx4rlOc8ABPtm0PPKt0QVsBILWjWQ7BTVHFMpBkE8bmW+F3vr7wSJPiOEM?=
 =?us-ascii?Q?83fdzvwmiI2UxgiQY1eC9mHo/mfg/Y2ae1zKsgecEb7Ukc/vywM+BGXR/Vha?=
 =?us-ascii?Q?cdFbQJlSlUYzkoLkrojzwlgAHWJOtGOelBSxaFsoc1pjGgNKtfVWCwBrvAf6?=
 =?us-ascii?Q?94FccOXZI7RTBtQTR4tAVSX1WDy9uTbyVcqhilYculQ8TIZwoiJzJaWdCjJ1?=
 =?us-ascii?Q?c8czrpJdBl+oy6YayXox1WenS5L+mnjlJ7QnkQTAwX741DwcepyW5ATM9hu8?=
 =?us-ascii?Q?Ftk1zQxK9mKb/+JzyRXIaA8IutIUZ9PrHjt6CCktrURKxBDlvpfiDSaAtYeV?=
 =?us-ascii?Q?U5A+kQOtOl+HoKee71bJQfhERG3iw7yAnW5ktYYRyLvJqFHNkQQWHhFXx1rS?=
 =?us-ascii?Q?V9VbBtG6cLOREDXj0GfRUSX3dsKa7+9Zp0iWl1l0K8ChNVvCA/Wr4hc+kP6c?=
 =?us-ascii?Q?HsGFOpHL9eA29eY4ToQjFSRJFBH3R3dbGD86rAUqTiNnTTnF92zk34Mjt5V9?=
 =?us-ascii?Q?ansGl3hndiUqKZkF9DY5hhYcRhS0pJqEQTCvFBIzOd10VZm2oEBBljl3u4DU?=
 =?us-ascii?Q?SNcc7nYz8EXRYgg70qI+mLwoZMjU9XEOBR9DcGLxultudovIb+sxOCgLrgIO?=
 =?us-ascii?Q?T3SdBEL0zj4p3RegbDiebHofWfC4R2852vSQrxlrKhnw6E12Vjqb2vVQL679?=
 =?us-ascii?Q?qMHp+nRogDx/TWaaEHeuVfujFW0KII3rNRhyfrXq9N2+dbTvLLs5xkUQmBuk?=
 =?us-ascii?Q?VrgRzxmpCWXcbNuf333Vwb+aZpP70aWtFw+Y2sJu6O197jTzANjgG3tyF8IK?=
 =?us-ascii?Q?49Fo/yrvmqh16avVEFNCEPDkhS/aBAwKEm21+IV6BfkqM0SBiAQ449npQXqV?=
 =?us-ascii?Q?jCVkNEflaA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	cxhZRHA0HQNBve+JgNQ8kfMPKojr7eY4CpiESOA3GjBd2bL1R/JHNzGtMgxBHSEMfI7I4LJpPCyTqWbBCI+DlfvcyMWprwxOIM/JczTORNHlnkF/2Sjvhbqv3C4KGx7swLSBWw+iVyDi9BJ5s8CEj9WRhW30logUZVUO1LURIsnMhaVma4n92FZM9L1i6NnNaSyrwSGpy14JtWaUfidhzQbeLJr8sznIEmxf9+qyBEpWReA6UFCi4ubrUA/fqjszwjtiv4hPCH3yd8/qnbFxL9lLjy30OooOyUo7jtwbZbEuMIsyLkJc8GijL3S20zwTsR0aSI5FKP8mtjwGZK9qtQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	N3mC5PyOTQbJ5pu9/3y9S44oe688KeuflFBxsSlwHBJW9sPUO21NFKO4dcbWDshr0uhREhmzs4884kYas9mNl/Q3eezERj0ZkUbGpvym10dYK6yioDfRlc7ABy+U/0n8H/a259fzFm0vtYoWI16jMkBgElStxlS+Sg5yqFNVboBos1TvFyWA6j/RXw/+KJGCXhF+0gImeR8pwKCKOwR7OsfDdUoItOmCsBvRIISF2PbbgpLSv2T43+SB2E/9Jpk5ezLzrEQyZHLIsa5wPxD36sZNYW88LExkmjsJjNp3b5HppI9oZf/j/QgCD5HBG7LzbFUbOnboUWXIIIpwnHcbZcj28cHFBXI4WaLnNcNdmnm6J1kO15B/fedcZsfjeepztYh2QpZZ5faAgARGUuywKz3kfQZMaA3gXrTymfWKBF51xLvuTqBoz9RV0ArxDsROj/ViCwIX0PQdSx9T0nnvBjWQ+HsJWSznQH2I+QbP/OmA/tg/By+HALcPh0bnLCi0rEcCmQLrceA9UlPBZZmkM6gUN5pE3SI47hWM5TLOuBZLmMXV/T1ApTN/bBTmJ4UZZmffhjIE2sR1mu1bTn/c8ZK7VNMZNWeOhM9Kjg7q554=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a37b1c2-615b-42c9-fca4-08dee8357f37
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 21:09:20.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yVV6ASPfCcdl5WFACfZ0hEs6q/aufhibWaA2UWdWTIcuVbjAHoTIYaoFrv0OwsgczfCXiNijOf1KuGsRXxkSPCCHXrBwvUwCeLTwOF+Sx6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2607220209
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDIwOSBTYWx0ZWRfX4lapm4y3Goab
 +QYXX30hrsmc7z5d1cB3PH7AY7mr2PKx5mEq4q4WNQ5bId1GSXsrTZp4sdHrPn5LUSSM2M8nKRS
 z6CRWElcrG684e8RerrO2uZ7VQ8+9CNPO/jmR2QF3yvI3vuafF8X/9H0ucrY1b0TWr40feDEDF9
 WcAIL0AMNY9xaQzu1W43+pSN9QeY3I/jlkkKbN9c9OdeAF/aqSNeWHjKZ+xBbL+QYFmaLTqJIfw
 qjic5HUMXKGbAI+0Db3omnKuCQu4MUhvqSSDY95yhNz+Rs+ZnbhcwmpqxnPa0Z9a6LlFl5lngPr
 L+yE2T2+U+c+Tyv+NuT/q04sY7n+6OoZZTeB31Z2cYSsZm6pmTwdjcBy84CE4VSfkZlfPtiq6Na
 MU80YAb063LSjXTnKJmrz6njQCVlIps92mgHk6duRQF8zz3hcnbFzCNTdL0Q8rs7Nlnx83s5PBy
 VfF+5TKqwK4Xj5MBAkA==
X-Proofpoint-GUID: daQ52_s5OFkIbasyGPCOVS8x2Dh4Tv6E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDIwOSBTYWx0ZWRfX6sqXFwsjkBgJ
 UrnIQUcCaWueYXQcs7mqdF0gF8Gywn+3t6Om40g0PUF9z/29gEOPerKtRxY4P7omMlaBOl3Bhca
 qwWc8Sq3G5jLdGyM13sFGqMFaC5Qsq8qlKU5I+Eb72KVKlC1Epf4
X-Authority-Analysis: v=2.4 cv=JrfBas4C c=1 sm=1 tr=0 ts=6a61318b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8
 a=a2dvli2lb4d2tInXX20A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: daQ52_s5OFkIbasyGPCOVS8x2Dh4Tv6E

On Tue, Jul 21, 2026 at 04:24:45PM +0100, Alan Maguire wrote:
> For use cases like PCP we require multiple DTrace handles
> in a process; to fix this ensure we tie global map creation
> to the handle and also allow BEGIN and END probes to already
> exist.  Later work can capitalize on efficiences like sharing
> kernel type info, but for now this is enough to make multiple
> instances work.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_bpf.c         | 6 ++----
>  libdtrace/dt_impl.h        | 1 +
>  libdtrace/dt_prov_dtrace.c | 6 +++++-
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 146a66e3..be8a4229 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -25,8 +25,6 @@
>  #include <dt_btf.h>
>  #include <port.h>
> 
> -static boolean_t       dt_gmap_done = 0;
> -
>  #define BPF_CG_LICENSE "GPL";
> 
>  int
> @@ -1076,11 +1074,11 @@ int
>  dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>  {
>         /* If we already created the global maps, return success. */
> -       if (dt_gmap_done)
> +       if (dtp->dt_gmap_done)
>                 return 0;
> 
>         /* Mark global maps creation as completed. */
> -       dt_gmap_done = 1;
> +       dtp->dt_gmap_done = 1;

ACK.

> 
>  #define CREATE_MAP(name) \
>         if (gmap_create_##name(dtp) == -1) \
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 5282efbd..7db2ba93 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -433,6 +433,7 @@ struct dtrace_hdl {
>         dt_list_t dt_lib_dep_sorted;    /* dependency sorted library list */
>         dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
>         char *dt_freopen_filename; /* filename for freopen() action */
> +       boolean_t dt_gmap_done; /* global map created */

ACK.

>  };
> 
>  /*
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 4b788507..8118ab23 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -243,7 +243,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>                         close(fd);
>                 }
>                 free(spec);
> -               if (rc == -1)
> +               /*
> +                * Multiple handles in a process mean we may have BEGIN/END
> +                * uprobe events already.
> +                * */
> +               if (rc == -1 && errno != EEXIST)
>                         return -ENOENT;

ACK, but I do wonder whether the use case of multiple handles in a process
may cause trouble when one of those handles tries to remove the uprobe for
BEGIN/END?  This really should have a test case that shows that two handles
can be operative at the same time, and also a test that shows that closing one
while keeping the other open does not stop the second one from seeing its own
END probe firing.  Ideally, it would be two test cases:

 - one that creates handles A and B, and then closes A and checks B still works
 - one that creates handles A and B, and then closes B and checks A still works

> 
>                 /* open format file */
> --
> 2.43.5
> 
> 
> 
