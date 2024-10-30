Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15DA1E7C3A
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290399; cv=fail; b=UcOw9+/T5vpfwWX3Z5gd7GLEHU4X0BS/lAsITnhBtMwCEEEsKh+Vhp2//ltCta3zC1/YAt2e3Z1zgVK6Dn2g70obtqhncER1xBeHjE/A6tIH+yXmPk3GZNmJoJCp0iltL953Bke3pmV56K9Jzn0RiqOAZ+rofGjxijOoOvFRtGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290399; c=relaxed/simple;
	bh=2is5JtR0bkzGFX/KeJ+YI5VOfkme7dF7xDieV/1wbJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OrP/PRc+AedD0f/NrNvMhjwuq32Max7C5ZPHGqlXZUkz0bBEdKpuz131aYU0IxGWveXTBCAkffgn0lH451rR2fD0Iho6K40DK+HD+r9QJhi0YPzr7UAB0QxZT8iqAdiclgwWxMgdHM5uRuUq6EN0H+jUGftN9lZu5PYPrjQm+zI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WdSfiu4I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hq+T0S90; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WdSfiu4I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hq+T0S90"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fdge012559
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=f6w8AkKEp2y0SW52QmiUqPrMmGXb6VZeLwRN78vUTcA=; b=
	WdSfiu4IOvw02sd3llL7EBLKMYCMxGJK5aq2EegJgD5oyqw8rNbEHhq+Ox5umIS3
	cAWTG0bxnFb4K9gl4Yit8RHNDP4A3MWGmaNvjkEpngS5Hl2j2ZY39sbpKmobERMe
	+R/452nJcrz+XigsUBvYG3ekhBhV5mD67LPY24AYXDP/bJXxTkPnKmDnAnxO7aq+
	sx7jE1/bVrAXS68iQs2SLPD08lznsEigD0PjWOVbbA+zXL56DHXbUTayJIVL8nFP
	P0Bbc4cU52tNcH9Yq/WAT3+56kF+mjiC5C05Awm0ZkvujqX+WQlCzhNTLmX0TPeH
	BKL6EilzUlSViZ69VQmVzg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys7vdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAF0Wt040216
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:14 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnaqfk1m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLJrKFelfwWITxmp3q9PlZgTjCrWssEWkhPizhz9sQ9+juETxLab4Pl5WJPMMbvAnllH78fbXNquirDqQwjYFj/fw96g3OHULcxPbYvScDm1nYbeS4htiC+RnyT8CA8x1ithLhLkj8nolxHYBhaVx+fTz6VdzBLs8ORmq+HiCpiZKHL0TNr/cMp0DMFK8uKwuk+52pDzeM03MwsvQZX3kRdpJDLaIvWKz61nYGwCMJpFFgMleglc3quzXfDqT0oS/xJq45CmbeFzKFgAnrW14pHvuknBKYJfP9SpsEA7ebxgGKYgNz0NvUAmm2erH11dR1h5nUkZ8Qy7bbZ96e2IvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6w8AkKEp2y0SW52QmiUqPrMmGXb6VZeLwRN78vUTcA=;
 b=ohFQWeHrRFQMVhQJwSHTTkY2hwo3iDlOOyHm8TEZSAmLSs7eq+PAGPN8yulGyYq12HoKJ6FOtZd8PtxkTTP2r+A5VzTae1hCKL5jjiIsny6/wEIBsd0BFLQzZGiMgjGlF/aBKeJ+vNQWyRY/KHt9cblYEg/X3EuqBaMQFrwUrE4+RspNta3CqDFxQPn4tLke8fG34sOkBR6jeVDqH5BGmDALIXvsi6s+/ei5Sb1R4kURUxNTzClp9SQbYRHP/7ynT0YBHImyy6cGqi1Yu5QjSwRrGqnx9NdSAy8BI/rUc1DkAgoOOoLQXgqaoPyrUMuASuCao+IT4ed/KuiHOivxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6w8AkKEp2y0SW52QmiUqPrMmGXb6VZeLwRN78vUTcA=;
 b=hq+T0S90EfCY5UuU7DDIyKLpOomXqu9/tWnTKIwnqwr2ocAJXPWaf7hBil8h03pSaS/uG8IGnTaCpNlpq1Qu1TaZoZ7EO8HSC7zh6b3KV8Ai5utrXEADO6P2AAQN1d19zOADif/qlN3vQ+cvkijiPDlt/ixJNVmx3BakG/0HvoU=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:13:09 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:13:09 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 13/14] man: drop double-\fB at the start of every option line
Date: Wed, 30 Oct 2024 12:12:35 +0000
Message-ID: <20241030121236.257803-14-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0336.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::17) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a26a52e-4285-4e5a-959a-08dcf8dc3811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j++Ds1n+baqA1KO1v64EFbktupYYZbyJ95iT4ErMVCpPyX2AJOe6bCu+EMs1?=
 =?us-ascii?Q?qpFuZlFscId4iQr0yLtGdDkvvQBBy2NGXfQ8kCIpcuLj7P7EUQIEHBl7GsJn?=
 =?us-ascii?Q?pqrtM6p6L1wpcwSvj4T4LEm2vt2jhUr9S2rfgPj55FmmHsFWVcfZs/keqRA8?=
 =?us-ascii?Q?IIiZSZxQJs0Qz8zV/qyhhpRZL12yhZtBrgDHU84mUahEb6WVMVn+BCHuB2ex?=
 =?us-ascii?Q?Ac76/Amcp9IdkIH8Ks3s6Zgfz/nsou+ZlxZgG2f/Cv3HGRbTK2Wjq/P3lggp?=
 =?us-ascii?Q?DN9iReggLKgbQDvUIgprGoVk28PRsryBL+wvTCg/FTo/luUdLTglYzJXU4q0?=
 =?us-ascii?Q?zaLAFtboto1DMDXHMELBVLR2hDs0Q4pN+c8lSwp2Gp/am7aZJbvGMnTABWVi?=
 =?us-ascii?Q?tNUWfFpv5wVmhEHdBJkwtYd918HSAJaBAZW5YXaFIzp7SMs4DFEtXsVjHdN0?=
 =?us-ascii?Q?2fojmpYcV7M0Qiecb6Efp30kDbHojhfHhjMax//9QLSe8cuLyM1irYwJ3c1a?=
 =?us-ascii?Q?a4go/b+E1/9XHAf6f97DxFx3larRhgCcCN223A+1THusTycKGTqEm4u6LFE+?=
 =?us-ascii?Q?T2Sm8H5fS33uKvMZZL0vqklW0YakmKcUHplIANq8q2fvAS/QGM7ZHFB7rs+N?=
 =?us-ascii?Q?uhboP0+UlY2rTmz6I1m/XVtggMqoYIr2Gzvd2ihAzOaMyyx1dAU8XLDbQvoJ?=
 =?us-ascii?Q?R7h5hXyNJv14xGE/nY2A6G8YL2GIzI+5AHtxuo1pr+C7i5ymVM5ue2cceiV7?=
 =?us-ascii?Q?y1bzHdVU55oJCSnGgPTPRUAbN8NDJBwR66Cn/ra1AKYpA6B07/aY6YVlWijW?=
 =?us-ascii?Q?BmjP+EXZh4J6zmtuvhJ3eurbyiN938Lqg51rC5FSdg5Q9nioCLCy7QG1FI1+?=
 =?us-ascii?Q?fmScXT9DuQEsUGXRBi2cbL57209gJDxAiSWeSeeyuUnlj5PNoqlqQ7t0fcSl?=
 =?us-ascii?Q?7XRz9eFJy9I1tSPVvB9Tdxlxt07FzbeStsCZRl8Kvhbu3Yzq+/dwFO9Cm2O2?=
 =?us-ascii?Q?7IxeBZ3GHDj2HrIzJJBerGNqxpv6n7WOEkDa8z5n3eEoUOcn57Fd95hjiwgo?=
 =?us-ascii?Q?x89Rs1jZJw7TQMYyCTR38vXIjGz9KXbCSkcZv47e5X0N22dDaFD4MDr1EVEm?=
 =?us-ascii?Q?bZOF412wQvysrmdDgdqUr8qTVCxJXDanN69OYaPy7xZtDp4gZk3hyxWQ6F4u?=
 =?us-ascii?Q?IKLNOfWilF7nqSOmB/3TCmPx6wxDFzFg4aMbbGGLDfQWITpxfaqHl7cEVthT?=
 =?us-ascii?Q?pdWeU/4+/+7DCVgES6fTGv2kQU0yx1nwj0Wr7e7yN4EW9ZQ6D9CJBC5Bg0x4?=
 =?us-ascii?Q?LC/jG+rEKtojIJhq2NL4jLsg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JnlVYOKML2u02p+fV/Sp0skCLDzVZyDV9Mcil9XXZHrb8J2H0RCGlrHRIyID?=
 =?us-ascii?Q?0igVTP4gEndC7yhrg8SYb4CfIsRGilPWUPzPbPsN+ToTyu5w1icy3C7MOKyZ?=
 =?us-ascii?Q?zZGiNXLL4I/9mvrFGHOBIzKqJfxTTvVT5/dp0WxcoKaifzPCwMycFbKdohuZ?=
 =?us-ascii?Q?AEAxPjaBzjHyL8tSCXHvaXjisJ/QeQQ7MVjPQNgUiXD0E7QOM95OzS819xjr?=
 =?us-ascii?Q?2xJtFBwHoMKxOIS80M/5slbP3jwELqtyO0+uRpQbeY1/bQ2F9KNvcjjjHeJG?=
 =?us-ascii?Q?0EH90zb+eeFYBOHb6HfVmCnCHq45uCZx5RhZ2oTCQ489PgLq77WYIZyBt9yi?=
 =?us-ascii?Q?L0DqVs8ygeBpnugR1dSmqxeK5XwmMDTLGYGiLabR3u6MzxCeh6DC1d5Oloj5?=
 =?us-ascii?Q?J1joZ5mcCJJ6ruuT89q7evnTQhkEAsSpt4E9SHYk/Ne7dIWTCegfYwHZpIh0?=
 =?us-ascii?Q?MA2ukEPE98BCHhD4MJUgJkqIxrdPkeWgwgkZZSyMsn0LkV99nD+BkWtTvnEw?=
 =?us-ascii?Q?ig7RJpxTggC6AkSY+6nfHC3nav7vXdBIbfsYWDUuJAyv84cLdToruch7YFza?=
 =?us-ascii?Q?n7nKCbq73w9dI4zXt5FN/5OIFJEPlIKkLcyEak6GdfdfwxtQ2B/Ktmlo/WRh?=
 =?us-ascii?Q?rLVG42++bupo+Nxd+Ljhmdd+m3xA/ra7FiP0JI7MGPwAZ+3fvhBlTeS0XH+i?=
 =?us-ascii?Q?EzRK8uQQXEX6eknQVv9BRaotWdcSloZzbJ7nU8t/1hWK/rHFwyG3/AkGO2Ix?=
 =?us-ascii?Q?Q+vgrPuWOiVWHVOd47d8hvjtpbh0axrYqLx1lItcK56CqfG4F53UqjGwI8Kv?=
 =?us-ascii?Q?mhNhrm/r4VAKtKBjflVwvB2ZVSUlsa9AfXQ1kf33ijcdeWVJ40vyel3RPT5B?=
 =?us-ascii?Q?eeS1DtjfFMF5ESQ8h4UCvHCYQgwQ3gizGvq+6S5I9UHdSWMYP02FBNTQjZd4?=
 =?us-ascii?Q?s+rF3RYPq05e8WZ/PUiEN5g6W1qXMcdQa3Hjzu49yB10XUH5PE0lo8HZGhUt?=
 =?us-ascii?Q?QOyPLl1KsXquBgf1BcBoT3PE0MbXf3Ms7CjcxB0QCrmfUw8v3q5M+WoODsk5?=
 =?us-ascii?Q?GQFuOfZGrN0rmmU7DElUuLZZXICoCRCrN4gxo9QtwucmRyg3OwtUSRagaCSl?=
 =?us-ascii?Q?wuVFHC33VKAWG/exUKst1GWjagRypty/YH4HzxWDd2KpxQFPOD9MFbmoWVlJ?=
 =?us-ascii?Q?HFYn7Btfws7oZ3PD464x9USJVVtrRf4DoJ8jE/YljXLBNTndJ1hv4DAVuWW2?=
 =?us-ascii?Q?xuqlru3+VpiIm9pj7P0MNyCsl1ZZl04Mm7ZskvFReU9KNrSNBUXIHrDNlhod?=
 =?us-ascii?Q?wrps66hpsQRui8ANjI1m3DdwZiTrCrX3ILcr0V1VFjdoYhGGqsR4DRzlxVMW?=
 =?us-ascii?Q?5PtH8hIl1yo8iUn50eNcMG3nJXiwVKO0xF9WzvVkklkdlpcQJ5HwvSs5Tt2z?=
 =?us-ascii?Q?CT1pkssdhV8TpkdWnoaH76bFaL1P96bYFW86LA6n5q0TTPTcapKJokeAWXrt?=
 =?us-ascii?Q?ykl9xWWte40yWc5hDhNl3rT9Ypd6uFbFygv8OIn0BrjJYwu509bDEoSFpsNR?=
 =?us-ascii?Q?OE7CM7t2tUvDs7vdTkgZ9cJje/mcjQ8Zy52WAEdzHh9E39VQJqnrqP8IMEUA?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2sYCR6Z3YuDomoX1ZAAbiTv/VGqmRoqvEQdDrAPreeWrPLPavyES9z3vI3ObfHg9395ErydFojF0SMy+9xKtDRGloVUg407V/B2eK/qpIvhwkQzAntrvfd8QeYLVpWNBl1drWQnrLCaTWEtFP7tMjkSgDBNlHK1rFmA/9rBFQDMvaAub4eWBHoFyNwVcpL4zrT1Q7s1Px0tqWFgpbuPxyUY1ZGrX4FOxOa8gubBn9gsRtzGXWkRGg3paid72UlfMEhBLmnuJbP55/rFth6nEEVCxeF/wMNbHW2Q88xhfvvyT0XFNTedv91gn8nCr+hmWj38g/7ua4++8M6S3Gjm0P0B905qc5DY7OzpMR9n149L3H/llAD91pDhvBIBs4gJNR8KxoHLSr+oW6mqFTu2+EvFMVgT/K35BaQlzY94yJtJp2Kru5N/TsovYhqAFHHlTwy+e2ZsGPlA9D0Z4gKyFUyFmKA6ikH2akQL2gmyU++HWWQqvEsb4nxMq1r9zVymn0/o7PDr1uUUlXn/+Kjv5OHSgQHlygLs1mTE7pRwauPgqNjGtPpJIm7YmVkTIcDiKFZz9D2ivWauOaypabSZ/vma7YX8RURxF9wK9i3DZ4FQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a26a52e-4285-4e5a-959a-08dcf8dc3811
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:13:09.8019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLlebwNl1QDD80esgirJqBoN0gtx2VElWq85XsX9kB1IuNjjV1ZymblvrRGNXGF5q3C5IGj/YhuPxlB4etlsig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: Xm1BnvgWDUDX52LKPwWlOALXn7t6skB-
X-Proofpoint-GUID: Xm1BnvgWDUDX52LKPwWlOALXn7t6skB-

All this does is stops \fP (which goes back to the previous font)
from working.  (The manpage looks fine afterwards, both on
the terminal and typeset.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 56 ++++++++++++++++++++++++++--------------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index c299073239eb..355484bd0d34 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -64,88 +64,88 @@ The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \f
 .LP
 The following options are supported:
 .TP
-\fB\fB\-b\fR \fIbufsz\fR\fR
+\fB\-b\fP \fIbufsz\fP
 Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
 .TP
-\fB\fB\-c\fR \fIcmd\fR\fR
+\fB\-c\fP \fIcmd\fP
 Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB\-C\fR\fR
+\fB\-C\fP
 Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
 .TP
-\fB\fB\-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
+\fB\-D\fP \fIname\fP \fB[=\fP\fIvalue\fP\fB]\fP
 Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB\-e\fR\fR
+\fB\-e\fP
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
-\fB\fB\-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
+\fB\-f\fP\fB[[\fP\fIprovider\fP\fB:]\fP\fImodule\fP\fB:]\fP\fIfunction\fP\fB[[\fP\fIpredicate\fP\fB]\fP\fIaction\fP\fB]]\fP
 Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
 .TP
-\fB\fB\-F\fR\fR
+\fB\-F\fP
 Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
 .TP
-\fB\fB\-G\fR\fR
+\fB\-G\fP
 Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
 .TP
-\fB\fB\-H\fR\fR
+\fB\-H\fP
 Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
 .TP
-\fB\fB\-h\fR\fR
+\fB\-h\fP
 Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
 .TP
-\fB\fB\-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
+\fB\-i\fP \fIprobe-id\fP\fB[[\fP\fIpredicate\fP] \fIaction\fP\fB]\fP
 Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
 .TP
-\fB\fB\-I\fR \fIpath\fR\fR
+\fB\-I\fP \fIpath\fP
 Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
 .TP
-\fB\fB\-L\fR \fIpath\fR\fR
+\fB\-L\fP \fIpath\fP
 Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
-\fB\fB\-l\fR\fR
+\fB\-l\fP
 List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
 .TP
-\fB\fB\-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
+\fB\-m\fP [[\fIprovider:\fP] \fImodule:\fP [[\fIpredicate\fP] \fIaction\fP]]
 Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
 .TP
-\fB\fB\-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
+\fB\-n\fP [[[\fIprovider:\fP] \fImodule:\fP] \fIfunction:\fP] \fIname\fP [[\fIpredicate\fP] \fIaction\fP]
 Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
 .TP
-\fB\fB\-o\fR \fIoutput\fR\fR
+\fB\-o\fP \fIoutput\fP
 Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
 .TP
-\fB\fB\-p\fR \fIpid\fR\fR
+\fB\-p\fP \fIpid\fP
 Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB\-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
+\fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
 Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
 .TP
-\fB\fB\-q\fR\fR
+\fB\-q\fP
 Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
 .TP
-\fB\fB\-s\fR\fR
+\fB\-s\fP
 Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
-\fB\fB\-S\fR\fR
+\fB\-S\fP
 Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
 .TP
-\fB\fB\-U\fR \fIname\fR\fR
+\fB\-U\fP \fIname\fP
 Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB\-v\fR\fR
+\fB\-v\fP
 Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
 .TP
-\fB\fB\-V\fR\fR
+\fB\-V\fP
 Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
 .TP
-\fB\fB\-w\fR\fR
+\fB\-w\fP
 Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
-\fB\fB\-x\fR \fIarg\fR [\fI=val\fR]\fR
+\fB\-x\fP \fIarg\fP [\fI=val\fP]
 Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
 .TP
-\fB\fB\-Z\fR\fR
+\fB\-Z\fP
 Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
 .
 .SH OPERANDS
-- 
2.46.0.278.g36e3a12567

