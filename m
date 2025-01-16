Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB51B0F30
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737066860; cv=fail; b=jOXBzM1dv5aNXisDPOY50/tWweJqCgNO+cgFiJSDVRGhlG5u0x+tq6XShKZ5ZIbWsJIDSrxIINSaEIh1fvljKjyKMLl8PgSkWExfxcabd6v/BEKnXfSypW61jg3b4zbIjzY2ybTBuuCXhthhL4XTSx985dDJ3AdF818we5Mm9dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737066860; c=relaxed/simple;
	bh=TA7aBpWKo5qtfLt1GY8Qq7skLcfZ80sRcE34boF4MMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aVEUzudg5t6DPv30SXW4M1u8iy4XX+0gcuS7SjnJ77luD1ZjS7T8l7KB4DqtlVB99J7S4riYheXWVXTKmguD8cdTfBrpeBzeFZUeow/dXu412llHGngEkPzWI5Y5vxOjwLBwuOQgDa4VPRw9gofu2YamHdQb/fXCD2zkz4YRQso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fn9pXjGd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zKD5JX4i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fn9pXjGd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zKD5JX4i"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GMBpsc029669
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lfn2OtS7dMpVsu8TTu
	e2Vn8WSfUNzTOO8ymniMUZLUQ=; b=fn9pXjGdq+GB8/PN1yc0A7n/6oI4VnvOtT
	ZCi9U7uAeyggG85pZs8a+m4dvI6RkK5+c6oIY0GlNtt6Dss6shb07sCVQBp48NXh
	+ObWXuWAJViXZFvfQzl6/+yeQjc12gqmtGHVxh7kFtGdQvmoaUevxj7ZJOsLKIET
	U9SCQiX6Z66FoOLKGpgAi3x7Kh3l8XQZKn2RkP+bAjO2FMUYzYR/4u+Yg7HMDO4l
	+V9cXpQUfIHQOwRi3XGriqojNBc/6s8SxYq13HLvO/NPJh9FeeUPvkfpa67zkBj9
	xKZMq6lce6RE4SODp8f4yO7cTXLoIIeMpN2qj1wh6BPYJXAWU/1Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446wtp9q4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:34:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GLSTJE034885
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:34:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f3bebt4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiYxrdIe2kyEomJrC2K5ps8BuOOk9W9DXFm429Kwno2VkTxk71bPKAS8Az2Jd17e8D2120f8WlGBaPs2KxPFlTPEIgFVV9RYzshR1xV1lXNRINZ/+p8CGbZ0+noBGmejlszJab8z/pF2LQBNwHbk/Xik5onR6stwfbTHM6cFDeA/w2/KOKvSN7y64QGOu4t3jZfigUxj0bTxbZ/dtryzU/WRs0iwHj75tExIdk4yOTYgEJxYYs/8D1KGQYTqnlz7Hrq7pao6noGZHf3SayXBdlvW6McRFH9yZqga0ojKzHkVs92nhAREDKs9yGPGPBL4V3A+Dx8zXqsbRcrIa9EBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfn2OtS7dMpVsu8TTue2Vn8WSfUNzTOO8ymniMUZLUQ=;
 b=TFRVzsLSJMWfje54i0cXVQ6c31mrcKMLGp5IwFOAL9jujl3Bso1uf0uAfMouUnfmB8CZGTQx9wsx+DYwi0wfPooh0zl1p446pEcjj3Iy4RRI7aWqwKY9iRen7ChHLLCLrLDamMQ+qurIOdVOVfUMUlZK3xmjMy+avmYvgCEFEBHXIxIiVITJRukT9ciV+G/cmrBdHE0PSh/RZXZr8SvMB5vJs4qp+Syb5BVvja4ML0rG9VAG1gU0QMQDkc/bFSxWvE2M+EusBLa19doQTIlbvYFCd4IOZJ3n9zqficVvVMNUaQdqWcHcW1ZK6o9gaArxf/tfBZHpkCI+OBNUC5Hudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfn2OtS7dMpVsu8TTue2Vn8WSfUNzTOO8ymniMUZLUQ=;
 b=zKD5JX4iX8tQfBaFOrmDvjwh++1RwS+mXSzlgyJE9n8yXJzfF7KVOmavyUl+/xdVOmDEyvOiPCmdoB6uEWAjROCsQ5PpiwOA4eQkrXKT4266MIOCwmnbzY4NTZNzw1MKM9fP25GbN3PFUMfwk8h9gk+y1XS63wgS/nEnmAW+5Ec=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA2PR10MB4730.namprd10.prod.outlook.com (2603:10b6:806:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 22:34:11 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:34:11 +0000
Date: Thu, 16 Jan 2025 17:34:08 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Fix trampoline use of BPF stack for scratch
Message-ID: <Z4mJYJ92JfCJg7wY@oracle.com>
References: <20250116220415.31864-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116220415.31864-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA2PR10MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: f209ef47-bb4b-4555-6852-08dd367de5d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nIV7QoTzx0OUtS8M1InZjYgVKDWwJfdUtoHjs3yuJXk/yhEfLZK8sfJAOZYO?=
 =?us-ascii?Q?tGnLOq5/Wvq2cAhPuUEUYqLD7Uyx21ppnBWv56ywBrT9uRZGGHZ0OHfgF+Jg?=
 =?us-ascii?Q?mu3MDIOaQ/gQbo2Jl/NSLGsDn4Aa0R1w2HZlUdEwRK/pDGNwC8Lk6L9I04Rl?=
 =?us-ascii?Q?Du5Q2nwRoj82qnFkvfAgeRbMiZtfrW43wliHlyWbG5390LRsLDhXoZcCGuX9?=
 =?us-ascii?Q?RkjLnMtO7lBGIelTRcgxjcu5Zyn+YAV7WHa5SQfF2lfTWpyKp8/zqQyMTvI7?=
 =?us-ascii?Q?yrD8uk6NSkueVjvrT9thuyNVezpFz7v6jPcvoY8wOJZWDp7aKb/q0gKSC4y4?=
 =?us-ascii?Q?XaB6xh+JuaZSxrA88+Fla+hUfcxR4dRMskqBWGYYk46KsXRS2OW8sVZC9sQ/?=
 =?us-ascii?Q?PgQgdOn6OEYrif0XQkaA6C2q71oI4zb7X/hpBpmQsj3nvJREbR2v6QhsBx15?=
 =?us-ascii?Q?HcE3VH5JrKkgfWQfA0rk5V5lP5Gt3aqTOPgpQoXwy2p7JbtgPVXVbNNIjfH/?=
 =?us-ascii?Q?e3Q0eEgH26mis7thH8FnxkYYRIWGCPhAqymoZMZbsdpq0BRT2+dFbyXtQZUo?=
 =?us-ascii?Q?dnWERWfB8C7AeHC27/RY2XJuljgyDCYLxSF5A8dxB/nOxdjTBTjGsBxul7MZ?=
 =?us-ascii?Q?yBNKMvlxOXp8RS4d9odIuR29Pg/mVkvs8R7+8dl1c7crRYgoz222+6DF93ne?=
 =?us-ascii?Q?/129u9yDvuU42UmPJR0IDLDSqzXC7HErLnKGI3e8jX3J/NeUK/wG5eI3vYGj?=
 =?us-ascii?Q?DGs+DqQd3Hvf1eLvppX0tfaB8u9GQH5R8MEeUSx3cYvBE8znbXbeQpMxyArw?=
 =?us-ascii?Q?D6karTtRMSQ2WuS0vhR2tjt3S+VIZEs/FUWdkB/jY8sOeqjAasQcddmHHBEM?=
 =?us-ascii?Q?BWBxjdpWh6kYBeiepyXUheCVOqdghGp+1u7wQ4iLRK9Imi75dPBxouXv2ap6?=
 =?us-ascii?Q?pmsn3NhpiIDZwYYzUoC7AeqUMaA8owQPhj+6N/glFM8D7AFuyO7DG4T6QsQt?=
 =?us-ascii?Q?A2hr2+nEW0szcdGngipWcz2aq+46a36++X+RmPY5Hwdj+0hw2bid3HqIfSwP?=
 =?us-ascii?Q?kDG67wGlhypydYbPRyv+okCg5A0aIvG2kfy+hkRLhx7e06c6LPhwewFoid/a?=
 =?us-ascii?Q?JRi5/TcEWXNXVkGPLI7M30IVq8ZKOlhz0BEjxwIqima/atOsmWM0U9QF5udR?=
 =?us-ascii?Q?MJWgkKqCPnFSNca00Gg7SSRhWRgBwGXsUKW9M7LGfxabEFQ8/26E26vjZYRv?=
 =?us-ascii?Q?xw+hQq4w37p0p4+29czI6Ju2VH/2DuHHFExOBhkUUpcRcnoE9qZuJEMumAH9?=
 =?us-ascii?Q?7gX5gYj4EUYn8Qk+6SKLOWfhBIWiaxs9+rm/Lk6GE4tFLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HvKNHD4SWF9h7mkfusP9NHkFFELGitPy1RsdBtFLtRszchiJHGkFp/6gHUjy?=
 =?us-ascii?Q?KQkKXLo3PrnmkxSSu0iKNrkY1iyqO2mF9Md3KYlWAGxtS1Zucj4sQlYWNFzm?=
 =?us-ascii?Q?ypcvHx+w+dM3Wffxup0NzW4V+7hJOMQ4I0pI5WCAf1SRuyS1uJVDcPeNepx0?=
 =?us-ascii?Q?KvdGfvLJNbi6+YZQv/1mwn6/ogXVKM/d54Fc+9JJBXs/CDsZHeGahMmOtXif?=
 =?us-ascii?Q?0VVL82YC8aVcy+C1rDa6fvlf/x6fkdbJf/LCZu6+BBgH679Q/DdB0nlz/P4x?=
 =?us-ascii?Q?SmWQUxUPcNibt2eyPDftGc+AW79x3/fU7RDwZtYrV8Y4dl0QeLwvMeMSxdfI?=
 =?us-ascii?Q?n1maPcdvRMOIASN26DIshbOqFbcuA62YIlqdaa7YPksMgoZTb01Pmkm9O1tT?=
 =?us-ascii?Q?niay3M4ecpsVIyU/BimSm0zVgLQPM+dR1ZFaXUHheil3bwL6xgrfryaabQYG?=
 =?us-ascii?Q?NLdPPUpEbbN0gIcSrM059wIA44snzbU0jwhATRxGjOYSc5zIr8R92LsPvfLW?=
 =?us-ascii?Q?hxeBs/W3WfDzRB0jMA0GJc7SdsSK84suuDZj7lIXaEF+RFPULXE6OoRg7Vhg?=
 =?us-ascii?Q?mN0oPuqeY1b/+Q3kP9X3pjCzd3Xawb5ZJ+1CRPLpGtlqxTMHdbesLsRZLHIZ?=
 =?us-ascii?Q?wQ6Yik81C7c7MPv0E2QHQ1cAqRfKsmdEWxlQImyYWjHItATXhRF95a5Bzbj2?=
 =?us-ascii?Q?mrkA1oPYNhvzESpcTBTMofdy7U/++uSknZLOhEnmvUB/Y3IXSFxo4ukMaV7n?=
 =?us-ascii?Q?6H/ZxfqvIz9X6oRkKptjXlWx1EGKoFutUo+qpVGbTvWlziyUEtiBsujLo6fH?=
 =?us-ascii?Q?LRbrkG1Ecd4tP7Punldkewh4foclQi19Q2GgiiWxAPCZItzqBKZbk8soi/P2?=
 =?us-ascii?Q?pfpVAT71VSWctkujPQJnFYjLee1W92MFX81xHJKdwhrMpzx7p853QnoKVu0+?=
 =?us-ascii?Q?tbriBcsKrayaJPzFMxI+epn8Ksu8LkeVairanEkZxAHWsyV7VeD+jcloVBrn?=
 =?us-ascii?Q?Wn33P/0/rD3nkXQllVAEJAv3HW4tFJ42O2XwDStd5iCGY6RmIIH9UTwzcMNs?=
 =?us-ascii?Q?9KOwLSPlCHO0Itrl+ChsaB2Qm8zwRKcLz0VRE05SmhXveAJqTxmJ98837sp5?=
 =?us-ascii?Q?7cu+njwwZEBbJBKwCphURxg7HmfkzQPdtADqjpXwL8jilwlEDsP3HgwmJoC4?=
 =?us-ascii?Q?QoLGgkh1GENunXQZIwCLTHbiNgdaQ/s0pOrcCUhXIoI7kHu0dp/UzRw1Kpxo?=
 =?us-ascii?Q?G+aPJWt+0WNcGINA7lookQR+O2yOWF+jT/Zacog0rHZzoHTNawxsxolJqLxi?=
 =?us-ascii?Q?C8GGjqLXQapaOyyDL1YrTmy/oEm/BJ9/tWXn734h+oTkiPsZhVuv/b+bKGmQ?=
 =?us-ascii?Q?hV1awyoCpp1c0ujLTsuykWnvqnbnBkL0A5YegIzA7pkrJliL6THMWUwDF+Lz?=
 =?us-ascii?Q?wwF5UDrGYFTBFwDd9cyaExf9DCNGEG5ZFFV7lY1rRaMUZfFtstVqiIPCfRtB?=
 =?us-ascii?Q?sXxYgHRsl0pAOGQUOJDddmjV3uujYxvPqow7sp7G6r+vV8S7BsgCUORCjaZ4?=
 =?us-ascii?Q?REW62zfjn236aMFntTWOKFWmSTHPYlrG9ARwa3ifHfdhVFhtAaqgi49P8cwe?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+aZMpSeLIx+B50LM0Z3kxU0cI8aCu648eapIzPz5trAcYVfjq0EXsy1MoTGN5DZlMNm2lCxoWerKqmaHzFt1oJRbrxaH4EXJk8+/dIX91hO7Y5ZZfH8GnISbC2yK1lv+dnpOKl5DKKTNt3jtPmEEMzcp5lg7MJLcHd310Uroajr+kslhcPctPj8ZFLLFQ84xTyE0djv16FasslcLnecCm+ljgYQjgfNwJUi2PGRZChMpN+aPq+R/6lWysUeYgR11yEnYKwvm9MKCHLL1Ng3oeQMpxkESkA6CfiV0Xyqqii47KgfK6OfF8iy96NKwG0UHPexFvw6gF2Os0jS+BNxwgl8wQfmLAwrU4sJtYKpHEp5P/zlYEGECqWd2YlIM3iGlND3PpHormcvHb23f1L8jckes2DWjxsto4LIpdvE8VUAYXew310tWovkHAgjnxyMAJEfFY4OGUJ+madnixQVI9p2aLVz3ax1WfX0cc1tZ59Wx3fjakGw5XxTeK5HC5MfKCxJEVwPA0FLv6CX71g9Zqzb4MZ1OluNcLOqH3OdKNf+et2jZwl7vTgrW7Uo6+9Ot9ZOT5oQMqhslyXhnl/Sw5jJTU4ecXKki+oQT9Ld/naA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f209ef47-bb4b-4555-6852-08dd367de5d1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 22:34:11.2966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/m8fL00Ho8t2qD7Q4I4UPsr2knuWRwAG/fjnGp+W2VGVgVgTY1D8QevdF3/PjQTLnH6f/cRMmhojQJHzdTlbjcKogbh6B7KqyWPUp25NzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4730
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160166
X-Proofpoint-ORIG-GUID: Q7ke-wsyVayTreMlx9Y3QIaTnZCPAa0V
X-Proofpoint-GUID: Q7ke-wsyVayTreMlx9Y3QIaTnZCPAa0V

This would benefit from some explanation on why this is needed :)

On Thu, Jan 16, 2025 at 05:04:15PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_proc.c                         | 14 +++++++-------
>  test/unittest/lquantize/tst.32bit-bug26268136.sh |  1 -
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_proc.c b/libdtrace/dt_prov_proc.c
> index 0223c5d18..58e8ad147 100644
> --- a/libdtrace/dt_prov_proc.c
> +++ b/libdtrace/dt_prov_proc.c
> @@ -62,7 +62,7 @@ static const char		modname[] = "vmlinux";
>   * The dependent probe support should include a priority specification to drive
>   * the order in which dependent probes are added to the underlying probe.  This
>   * is needed to enforce specific probe firing semantics (e.g. proc:::start must
> - * always precede [roc:::lwp-start).
> + * always precede [proc:::lwp-start).

drop the [

>   */
>  
>  typedef struct probe_arg {
> @@ -350,12 +350,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		 *	else args[0] = 2;			// CLD_KILLED
>  		 */
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
> +		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, sizeof(int)));
>  		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, ctm.ctm_offset / NBBY));
>  		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_probe_read));
> -		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_STK_SPILL(0)));
> +		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp,  BPF_MOV_IMM(BPF_REG_0, 1));
>  		emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_1));
>  		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_2, 0x7f));
> @@ -406,17 +406,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
>  		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
>  		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
>  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
> -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  		off = dt_cg_ctf_offsetof("struct signal_struct", "group_exit_code", &sz, 0);
>  		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, off));
>  		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> -		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp, BPF_MOV_IMM(BPF_REG_2, sz));
>  		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read));
> -		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_STK_SPILL(0)));
> +		emit(dlp, BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_keep));
>  		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
>  
> diff --git a/test/unittest/lquantize/tst.32bit-bug26268136.sh b/test/unittest/lquantize/tst.32bit-bug26268136.sh
> index d5f143f58..a360fd17e 100755
> --- a/test/unittest/lquantize/tst.32bit-bug26268136.sh
> +++ b/test/unittest/lquantize/tst.32bit-bug26268136.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> -- 
> 2.43.5
> 
