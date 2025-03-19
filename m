Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A751E5216
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742406375; cv=fail; b=LEIydYjG3WkoOSw9Ds7F5edX1MH5qpux6QwkWkxtqq3oHtFahTvYfW3nk9chgivVK1f4XmvmcTFo/uWYNCjbtIwEz5ByGk4L0aN4wPzMzHr25Rl+6ZrAoGnMrlShBBbife58MfNCF7eZrVBZvbTZ9GKBNvUY9YtjI3ef7DATbOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742406375; c=relaxed/simple;
	bh=PbQ6AtJqQ6iqqKrO+ymZ+Sja7MBUhS7chNj1PXeQ/0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OqLg3LPzUDmSxRUdEpXyg/226OdTRCqRhgSVpySvT2wcZuo1sSkX+8VeuSfqcf0tZbI+T0b5zBctpWjYGUSRdx9gu1yd/kQqvGSlzO+udVJKRcXBCvpsoJ1w2cpSs+HcyUk50wiu4t4f0swM6n/DZtU7xzKsLFDQhtsK0QLA4Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i2/NdMdJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M4UUGpjJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i2/NdMdJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M4UUGpjJ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JH0sFM012176
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=wWg/ty5uLqSaEw/PHI
	4hz1c5cKqbmnX0WUVI7+syOHs=; b=i2/NdMdJOzK9eE7QwKoDJWXn7U9pnnqfEa
	D+pxw2XU7mjAnMGpd6COaL3H72qzrLpQcvlSWJ/dswL0JOzq2AJs+UzEqWb7Ejoj
	huXt2gtgejlKZxAzArdFMxMYCHbaac0emoAhJWvaDtlY2MYyHjPn+uq9UqcKQ/QI
	6UNOX19dPnmJWoj2bWJqHats0oh0YQ56N2aPXt3l0QWN9byk66TprsW7Ibis/Vhv
	0jH241r7jZDgHtHf5pjTKsxIKT5fH54aMBYoF7rIsxdyfKn6E7gLNhJPNlaaSRJG
	uDF2MZlTazkN9/q2SDmy5iEoe6whhVTpdkJG+HoIL22FoNclX+Fg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d23s41n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:46:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JHLSPK009582
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:46:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxm1gyfc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 17:46:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2Np/XlTcXK4BmPAZLcx/HMn6JH/LgWBF2jmt8HBvy80UGJBAyxaRja6aSUSK5SU2vLDz3qAL3Ln77Ijz8xEobvfUqg0IQ0BDtTHgAIPSt2154AIphFYqlzpx18cxW6FLSLDyIQPe1Mbi7W4Kh8mWkEiVolkNlOBCdtoK99FPiIKWvzNCBBXGFoJhLzQt8S9EUUw3+rbmp9ptSCJxNg+T0NKCCfvEgpD3gDQBqDMaj7qxt4DZurV0fTvu+Nn50xIQall9w5efXeFIvqcmLkiQ9gpgBo0QWSAd+1NBYKkdS0WD4kop5RxQFq5i+BS2r+31cv88pgah3LyI4fKOa2GQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWg/ty5uLqSaEw/PHI4hz1c5cKqbmnX0WUVI7+syOHs=;
 b=sSOFcXMtsQDVU4pZE68CaHjemms539TGbgI2PQshphRcG0LoyLumFBJrohK+xpbSNDYtgFwZBU7P5iFRdiEiOOomPY0Qk4+sTe2uJw7F4NE8QJsvZWvqj9sRqAAzpbiQuL4TWYNjatQCfvZTrMeU8g1aGtyIJoQGgzr1B8cHxj2ZFW7kKUjEa3mg9S652ODPPyp7QOYFgBCdR1aVXybM0JHI0BTGqxSYI4Uc73E5wZj6f4//1rzm7r2TAQ+shiSv+0jcXZ05Gyl0eSOt/ESmATv1p2NCN0Ry1Yn4/pLRq8xNXIW88FlwnjkqRiCKQlFMVKrlJka71pyVRQvzQFkAiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWg/ty5uLqSaEw/PHI4hz1c5cKqbmnX0WUVI7+syOHs=;
 b=M4UUGpjJnz3kvflq7Vy1vR5iQLRD589js2H2PRBIJjEzMlWVUDfOcnKpPDUKTLSiG2nMOZVL5snHIxC05t3aC//ccCEXGvJ2iJyYk8+vck4Z5mf3PpdnSF2cuFMLY/tZe5DvRwgNFFXgDnDgWJhus1fkho3YyGrtsM1p2majRZ8=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by MN6PR10MB8166.namprd10.prod.outlook.com (2603:10b6:208:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 17:46:05 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 17:46:05 +0000
Date: Wed, 19 Mar 2025 13:46:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Make tests more resilient to different prid
 widths
Message-ID: <Z9sC2i3zJRbT0nzG@oracle.com>
References: <20250319171525.1877-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319171525.1877-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|MN6PR10MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 54cd7f76-7c60-4be1-77f0-08dd670dec19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QI7OKtMTywzw+55eRP21HXmj45ImdFlRBnZGJNLvStnEB8Klg/JPC2m9vOKF?=
 =?us-ascii?Q?h+5jRpno9p4Iw7fGyNIONzI/rFISLmejjmZ7qVB5LAZvYzI2+Py2s56CGvwW?=
 =?us-ascii?Q?ZgSJp0nNJgYews7Ka99ncT3zHZth0CSN/kqA4ORLRX7pkE+VMyhfnvWe6Q12?=
 =?us-ascii?Q?dAagSDRXT8DQwukSYABgDP7oWIFLkNk+fUOQgt6JMwjgpilG+GS6lKUn4pet?=
 =?us-ascii?Q?TiFHIm9ttOdzOvJsOwHI25Z6MXWeAQQYraR0Bla9etYUEA4QDZE/tLBx4/GF?=
 =?us-ascii?Q?bdSS0CT153ho5wAAAkFMV+k44k0fnd2o/hlaCEz1smaw2TMQHpPMNvJFabTs?=
 =?us-ascii?Q?YyrQOe0KtKZjZ3xbba4vFr5dj3D7Y8h651i4SuFEA4oblDJYwYZv3Dr7Kzyn?=
 =?us-ascii?Q?j2Y4lOkMcOWlMYYjMo0llz76/DhTc8MH4+LJLa/jQLeroOn/dXSIQmqWoAv7?=
 =?us-ascii?Q?ekuWyeooQIG+r31v4aQqL2rrA6KEIMdqn7fehsOMFWHJAl9yst0sI0g2g78x?=
 =?us-ascii?Q?nPK1fKBBD1GFgeFQ8Vr+nwE6z371sCgtLLIeZP6mlc1xWz1aDxSlQg3nwkCQ?=
 =?us-ascii?Q?SJFCJCyhFVR264a4m0TTioYB8upPkZlv84fRTXIECuxdqi5LvtrYBNnuRAQx?=
 =?us-ascii?Q?waKO7u7M/CjMpWt9v3bAeb+uJPWTN+F0QaZ0ohw+V76A+wfSf0Kyy/BWNn58?=
 =?us-ascii?Q?mmGwlIVrPVTocuSsxprngCC0oW8/3+RfmWlcQWA7rtboBy3mU4/H+MZB4l2Q?=
 =?us-ascii?Q?qhWklu3wqcMdbpzwiANgSXC8yetvRjn6lx2QW0zqI5RahrEObK4QL1yb2UzZ?=
 =?us-ascii?Q?BKxLYWNjE9L9Ion0jotsicJ9wDeL6dPem4gl2KDc/Dg7yz2U+b5Y1ARrxeO0?=
 =?us-ascii?Q?iG21S0uVLLTx/uT9DDt3NrUaZOpakLfhhbicO81c2gPf+9D6iYH8muZ6xVpn?=
 =?us-ascii?Q?vXqQ5qLrJM0ioV2Djg9vYzI/3zZgUuLXPkIv37IijL6d5woh3PR3gMPHFdqU?=
 =?us-ascii?Q?4aUIkXoid+THg4nPFIqXO9X0WPgAjkF/PYKjQ6+d53Y+VVR7AHGju7g6I02z?=
 =?us-ascii?Q?vJnKe+6u5eqGzUmHBodeOO3Xc6IV1V1/+0uFEXWFugK8UqYDpjv9qxTsTKWF?=
 =?us-ascii?Q?cIqsZFal3rga01OlyHvIxGB9VmmGMEWVeWHWjAaM2Otqk8uNM4ON3yEPjBdV?=
 =?us-ascii?Q?+maX7GXnajHL4oDFdFmQoXlh8yKjL38qgluXqae0aYxp1Mqtl7aJMl6iMfpw?=
 =?us-ascii?Q?Mro5t3aDe/Qxjow/y/IsR4ozpim4hcAp2W5CzCrRQWlBUcGNAu2N5lCM0xkr?=
 =?us-ascii?Q?Ru4TLxwVX3OT/Jzjb+w+jUIOgQWJZSLpdMbidehCjOvfin42TaWv74NPFkBd?=
 =?us-ascii?Q?4MyyQR4BJCunvk3ouqTAF2y49Pog?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VeTBykuX3k17wx3krvZaGggLDvwhwFmq1FO1pjRknD2JN3d/mTLv4O9Qsa1l?=
 =?us-ascii?Q?DzYjZUlVDVXjNRsyshqQgGOD/G9ZckSHiiYYoNfIDFCru4C16HlbHdqmP2WF?=
 =?us-ascii?Q?vo3/HLli8GSZPiTTR0sfIfFX0MPwh/xiYacFu4wimSnNmzNHujYbL7LBX5UM?=
 =?us-ascii?Q?3B/GGP4l7XGOyMdWFgBovmis4EASM5hocO7LZzGUIrUjxvJFHk+m6SFsqIfU?=
 =?us-ascii?Q?LLtd5is+Y41dNyjQpqWd63FahVrp0C/bZyfR2PeTx3X7yiVHMWoGhrhspj97?=
 =?us-ascii?Q?8V36HwGO0MkGj6qExoX0UaqJmPWe6920Rd7v1INGUHLN7uUBdx0dGF6wmHVT?=
 =?us-ascii?Q?+k70UlLyiiFkFk3uGrvYa6KGwnfluAFOxcB3HB3ek5MWQHotai5kxvHKWvfj?=
 =?us-ascii?Q?Vkj12DHLR1qiR7K6hTQo7okioFB4KOU7QjTD2nC2kzmciaKr4lxaWxsL7rvI?=
 =?us-ascii?Q?rlkm19DReKpZpZCDtK7JDlB0+ubePdUN9BF/G85Jw4OGEsDVxpkTAcC965tR?=
 =?us-ascii?Q?XYUwYbaEEEqPonFrbK1kHjLlVDIaCXtY3w4rwRp/YvuakjK7jWPImr3y5s0Q?=
 =?us-ascii?Q?n/809nIwRaLCyuaZwRNxBQ/qTtmZA3u3MRx+8HeORcXLsVa9wf9MQOnwWwTV?=
 =?us-ascii?Q?rqPjG6UIq3cd3/g2+vZjZlz9pj75WomeiMvxS3aCVNwUsTqsEQ3KaUO5arI8?=
 =?us-ascii?Q?wAkEkgAsAJDx4yZYphlBKcavJv6P1SYBxS/Lm2kT3cR1J/9wl//5JKlKG0nD?=
 =?us-ascii?Q?LqJ0T9dSxNGy3gEiT3j/1vaMNq0qhap5svH6a10aV5KUL8j/LYsVgJ24JYZe?=
 =?us-ascii?Q?EQ6+i98wqRESvtMC6F6+mdewtzYVOkW4UOozNBI6Bpj/ilS7Wz9DHrOuZMVQ?=
 =?us-ascii?Q?NvU2aJPalFuV/UsMgrDA4pTJ6QKHNC3jpRSRXFKxInniCJCstvDQjL3YFxo1?=
 =?us-ascii?Q?H6ZVRdnrh/slDKpIzZfMd6+cwYOwxRAKUODy1ovFoJ6d0urkxq8roGqBtV+0?=
 =?us-ascii?Q?kz5vjFbFDH/XZEttyFiuImP2wkrtb0RISrm/68RUdZGVfSS9CfhvixfJIFos?=
 =?us-ascii?Q?HICDVgIr5/DTQtN3PMzk/3sjnd1XaE3JTHp3FPzNndcWMbd0lrsYadW5/LmC?=
 =?us-ascii?Q?ZiNdZXfNk35UiTIe1ZABap0ZFqOiJHQolpaBugMUzT/oyQlaZ/NZn2HbSzNe?=
 =?us-ascii?Q?JK+0ARvpLraPwmYXtZ69oDpcAUTYJcaLflLTWTu3PnHeTaXx/8GB704J8PWu?=
 =?us-ascii?Q?napKtmrhW4AzHXOkycxShItRpscU4NemT6fr2umSt9ZMLRZfo9wJOnHcLcjh?=
 =?us-ascii?Q?yoejwJAp0aaGCOoZbWLJ0hpD8k2dM/bg821N/1o5BeXZ9W83KIso7xmW1HwC?=
 =?us-ascii?Q?GXjhed5BQ6m+KZtoC2wl93wYVB/AjWpKpwaq+sZJTN5s5YiF84ythyYb1WRh?=
 =?us-ascii?Q?LJIbUQojJbZi18KnRb56+GQBTUnIYgx2x5NTs/tsCeARx8SC8pfzD/m4X5NA?=
 =?us-ascii?Q?JCrpTGofEOWa3E5iV4EhYL8ZNNnExLkg3fD4ig90V7Eb6BKSxPufCy4OQsD4?=
 =?us-ascii?Q?OswzzirO52agSW5CEX07cqWm2uj54OKyGWGnhDcS37WAUy+bNe/N2sqJDas3?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c8lDDqf2kH2UoS4+NNmtDZuPnxPmeB2HzWNRo0208sjOWRhEPhhWh2y/CkvOLZxWhYpORG5svrC+bh3klZcVcCN05jcIS5tC3c90posoZF5ZkS/RFv92cH4ELBE4XT0qEoHsZiwgLCn7CHPcFMTAqwF+gIEFEXQvLNFfJ4STnGQ07Euz1SEbd2YKsKlh0nZGNlqqzSPhTs5vpLUJKvj1tQSeT97c7JcVHVTu95G8z70k3EA0JiLEXtBlW3ElPrMzNOpUJNuU454SueI/evCYA5g62qLo6Kck2oUQHM+ao6eKc/45VghbTGZeKZLB+vUF6aIZBjXwAOylV2+TUMsfDBNCk4wVQR6s1ogImPAbGUVco/zeiVbow1NayMqBmZVAAliNoUI9iBfQd6ceYVrCsluBX1KoPPfq6ADYNsfN8BSjTI2PreWDRGJ/CCWiU8j7W3e4E2Wy6cEUstakR8aL2poybPoJZR2/RAYgCkfFZuGE732vjB7m76pxV/zfYtrqf71YtRGQuqyn1PTCw7dlhJdxEOoB7NipnFuzJUG7laRQdYCmuczu9BA1rSVsgaNr4nSNSyEKdlDydXLJRtDn2g8ZsActHoCP4kqx5lh1P1w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54cd7f76-7c60-4be1-77f0-08dd670dec19
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:46:05.2054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTPx5UciwT+Sfh6DbgcIEKDniRt10gKFMMQaC41EurDBa/095Bp9cFldeVcwmroagpXdKUr2m0fzl05n4flYUnIvUkMgozEeRtV3F9ywItU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503190120
X-Proofpoint-GUID: BzjvY0H06QvEBpk7Wtlov5xrT9W-OzoV
X-Proofpoint-ORIG-GUID: BzjvY0H06QvEBpk7Wtlov5xrT9W-OzoV

On Wed, Mar 19, 2025 at 01:15:25PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Various tests convert run-dependent values -- like PIDs and probe IDs
> -- to run-independent strings before checking against their .r results
> files.  But the conversions could be remarkably sensitive to the width
> of probe IDs.  E.g., some conversions assumed probe IDs were flush with
> the beginning of the line, but if they were narrower they were preceded
> by white space and were not detected.  E.g., this happened in recent fbt
> work, where probe IDs for fbt probes became much smaller in value.
> 
> Also, these conversions were being carried out by a hodgepodge of scripts
> -- sed, awk, and grep;  some using run-independent strings like "NNN" or
> "XXXX" instead of more informative "PID" and "PRID" strings;  some
> incorrectly using "PID" for PRIDs, etc.
> 
> Replace these .r.p postprocessing scripts with a single script that is
> more resilient to PRID widths and is commented.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/usdt/convert_PID_and_PRID.awk   | 20 +++++++++++++++++
>  test/unittest/usdt/err.argmap-null.r          |  2 +-
>  test/unittest/usdt/err.argmap-null.r.p        |  3 +--
>  test/unittest/usdt/tst.dlclose1.r             |  8 +++----
>  test/unittest/usdt/tst.dlclose1.r.p           | 13 +----------
>  test/unittest/usdt/tst.enable_pid.r           | 22 +++++++++----------
>  test/unittest/usdt/tst.enable_pid.r.p         |  8 +------
>  test/unittest/usdt/tst.exec-dof-replacement.r |  2 +-
>  .../usdt/tst.exec-dof-replacement.r.p         |  3 +--
>  .../usdt/tst.multiprov-dupprobe-fire.r.p      |  3 +--
>  test/unittest/usdt/tst.multiprov-dupprobe.r.p |  6 +----
>  test/unittest/usdt/tst.multiprovider-fire.r.p |  3 +--
>  test/unittest/usdt/tst.multiprovider.r.p      |  6 +----
>  13 files changed, 44 insertions(+), 55 deletions(-)
>  create mode 100755 test/unittest/usdt/convert_PID_and_PRID.awk
>  mode change 100755 => 120000 test/unittest/usdt/err.argmap-null.r.p
>  mode change 100755 => 120000 test/unittest/usdt/tst.dlclose1.r.p
>  mode change 100755 => 120000 test/unittest/usdt/tst.enable_pid.r.p
>  mode change 100755 => 120000 test/unittest/usdt/tst.exec-dof-replacement.r.p
>  mode change 100755 => 120000 test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
>  mode change 100755 => 120000 test/unittest/usdt/tst.multiprov-dupprobe.r.p
>  mode change 100755 => 120000 test/unittest/usdt/tst.multiprovider-fire.r.p
>  mode change 100755 => 120000 test/unittest/usdt/tst.multiprovider.r.p
> 
> diff --git a/test/unittest/usdt/convert_PID_and_PRID.awk b/test/unittest/usdt/convert_PID_and_PRID.awk
> new file mode 100755
> index 000000000..1dbb31301
> --- /dev/null
> +++ b/test/unittest/usdt/convert_PID_and_PRID.awk
> @@ -0,0 +1,20 @@
> +#!/usr/bin/gawk -f
> +
> +# ignore the banner
> +/^ *ID *PROVIDER *MODULE *FUNCTION *NAME *$/ { next; }

I think that using  / +/ for the whitespace instances might be better,
or perhaps even /[ \t]+/ if we want to guard against future use of tabs.
But at a minimum / +/ seems most prudent.

> +
> +# process other lines
> +{
> +	# convert run-dependent PID values to "PID"
> +	$0 = gensub("prov([abc]?)[0-9]+", "prov\\1PID", "g");
> +	sub("pid [0-9]+", "pid PID");

First arg of each function is a regexp, so should be specified as /.../ rather
than "...".

> +
> +	# convert run-dependent probe ID values to "PRID"
> +	sub("^ *[0-9]+", "PRID");

Same.

> +
> +	# squash blanks
> +	gsub(" +", " ");

Same.

> +
> +	# print
> +	print;
> +}
> diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
> index 215475e39..97b1850de 100644
> --- a/test/unittest/usdt/err.argmap-null.r
> +++ b/test/unittest/usdt/err.argmap-null.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
> +dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provPID:::place4 args[ ]
> diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
> deleted file mode 100755
> index c575983ad..000000000
> --- a/test/unittest/usdt/err.argmap-null.r.p
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#!/bin/sed -rf
> -s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
> diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/err.argmap-null.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.dlclose1.r b/test/unittest/usdt/tst.dlclose1.r
> index 7873cb51f..70bb50d76 100644
> --- a/test/unittest/usdt/tst.dlclose1.r
> +++ b/test/unittest/usdt/tst.dlclose1.r
> @@ -1,6 +1,4 @@
> -started pid NNN
> - ID PROVIDER MODULE FUNCTION NAME
> -NNN test_provNNN livelib.so go go
> - ID PROVIDER MODULE FUNCTION NAME
> +started pid PID
> +PRID test_provPID livelib.so go go
>  -- @@stderr --
> -dtrace: failed to match test_provNNN:::: No probe matches description
> +dtrace: failed to match test_provPID:::: No probe matches description
> diff --git a/test/unittest/usdt/tst.dlclose1.r.p b/test/unittest/usdt/tst.dlclose1.r.p
> deleted file mode 100755
> index 85725f3bb..000000000
> --- a/test/unittest/usdt/tst.dlclose1.r.p
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#!/usr/bin/gawk -f
> -{
> -	# ignore the specific probe ID or process ID
> -	# (the script ensures the process ID is consistent)
> -	gsub(/[0-9]+/, "NNN");
> -
> -	# ignore the numbers of spaces for alignment
> -	# (they depend on the ID widths)
> -	gsub(/ +/, " ");
> -
> -	print;
> -}
> diff --git a/test/unittest/usdt/tst.dlclose1.r.p b/test/unittest/usdt/tst.dlclose1.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/tst.dlclose1.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.enable_pid.r b/test/unittest/usdt/tst.enable_pid.r
> index 675fcdd6f..9241202d7 100644
> --- a/test/unittest/usdt/tst.enable_pid.r
> +++ b/test/unittest/usdt/tst.enable_pid.r
> @@ -1,14 +1,14 @@
> -                   FUNCTION:NAME
> -                        :tick-1s 
> + FUNCTION:NAME
> + :tick-1s 
>  
> -                   FUNCTION:NAME
> -                        :tick-1s 
> + FUNCTION:NAME
> + :tick-1s 
>  
> -                   FUNCTION:NAME
> -                        :tick-1s 
> + FUNCTION:NAME
> + :tick-1s 
>  
> -                   FUNCTION:NAME
> -                        :tick-1s 
> + FUNCTION:NAME
> + :tick-1s 
>  
>  done
>  ========== out 1
> @@ -39,7 +39,7 @@ is not enabled
>  === epoch ===
>  success
>  -- @@stderr --
> -dtrace: description 'test_provNNN:::go ' matched 1 probe
> -dtrace: description 'test_provNNN:::go ' matched 2 probes
> -dtrace: description 'test_provNNN:::go ' matched 2 probes
> +dtrace: description 'test_provPID:::go ' matched 1 probe
> +dtrace: description 'test_provPID:::go ' matched 2 probes
> +dtrace: description 'test_provPID:::go ' matched 2 probes
>  dtrace: description 'test_prov*:::go ' matched 3 probes
> diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
> deleted file mode 100755
> index baf9d2a90..000000000
> --- a/test/unittest/usdt/tst.enable_pid.r.p
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#!/usr/bin/awk -f
> -{
> -	# ignore the specific process ID
> -	gsub(/test_prov[0-9]+/, "test_provNNN");
> -
> -	print;
> -}
> diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/tst.enable_pid.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r b/test/unittest/usdt/tst.exec-dof-replacement.r
> index 7547f85e5..226ab7c8a 100644
> --- a/test/unittest/usdt/tst.exec-dof-replacement.r
> +++ b/test/unittest/usdt/tst.exec-dof-replacement.r
> @@ -1 +1 @@
> -PID test_prov test2 main succeeded
> +PRID test_provPID test2 main succeeded
> diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r.p b/test/unittest/usdt/tst.exec-dof-replacement.r.p
> deleted file mode 100755
> index 1a5871f73..000000000
> --- a/test/unittest/usdt/tst.exec-dof-replacement.r.p
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#!/bin/sh
> -grep -v '^ *ID' | sed 's,^[0-9]*,PID,; s,prov[0-9]*,prov,g; s,  *, ,g'
> diff --git a/test/unittest/usdt/tst.exec-dof-replacement.r.p b/test/unittest/usdt/tst.exec-dof-replacement.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/tst.exec-dof-replacement.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
> deleted file mode 100755
> index bdbce0189..000000000
> --- a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#!/bin/sh
> -sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
> diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r.p b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
> deleted file mode 100755
> index 5d11db2d4..000000000
> --- a/test/unittest/usdt/tst.multiprov-dupprobe.r.p
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -#!/bin/sh
> -
> -# Remove banner.
> -# Replace numerical values with generic PRID and PID labels.
> -grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
> diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r.p b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.multiprovider-fire.r.p b/test/unittest/usdt/tst.multiprovider-fire.r.p
> deleted file mode 100755
> index bdbce0189..000000000
> --- a/test/unittest/usdt/tst.multiprovider-fire.r.p
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#!/bin/sh
> -sed 's,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
> diff --git a/test/unittest/usdt/tst.multiprovider-fire.r.p b/test/unittest/usdt/tst.multiprovider-fire.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider-fire.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
> deleted file mode 100755
> index 5d11db2d4..000000000
> --- a/test/unittest/usdt/tst.multiprovider.r.p
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -#!/bin/sh
> -
> -# Remove banner.
> -# Replace numerical values with generic PRID and PID labels.
> -grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
> diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
> new file mode 120000
> index 000000000..11a06e058
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider.r.p
> @@ -0,0 +1 @@
> +convert_PID_and_PRID.awk
> \ No newline at end of file
> -- 
> 2.43.5
> 
