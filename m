Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41BA2139D7
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 21:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840408; cv=fail; b=PPjRL4enPs568Y/XcrkEumcJDEj7gTJ7pjxAn/EEXWzMI0NHqiShFc5rUSYbU27LukCAt3qHB5hTwilBAIO2aH+vyfwF8coK0oJ5OLJX6XvTTXmCOBOpfpSM4WmY9zS6pzNaHSFr/8dNeOmRaepZI8j4Xmupv62DZ0AN377HUJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840408; c=relaxed/simple;
	bh=tAQP56QfodIIrMeeBlyVhWsmOL3uobgsCFi4UvwgzKo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ce+40EPLCPCPNIUfYt7tGkFel7srjj4z5Io9pnEInrewvSpsnC1XNHQDL2VEIo36xC1fTwKkZ9J40jc/iLoe07qaaygf/I8SBdbY+Oa55gLlB7vIZh8EMRWWIbw0VprZYyPPbRZQ+CYOLPX6/J2ICRD6T8pid91Xpx3mYPeGjYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O5pjxjUv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BNfe7KUu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O5pjxjUv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BNfe7KUu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KfXX8000978
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 21:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ynUyZH4YX5qFLvBHZqhlbZTY0Zq6HcheOGrGjVUaCdk=; b=
	O5pjxjUvGbgXBwddxyDTFgTCTHNGHksx1ZaEz5xpTCi4s1vmQw64aSQCkShvRnUC
	fsG54DCyLzEeQojA+mSi6/g/K6naGAF4fqCC60kzDYD1wDn5tQ49VBj89G+dvR2q
	RJ0pObv1liQoXMqiRizL623TR2zA0/KYYXxQRbsqQUxzjBBYZDfXyoyMzyTXDqjA
	Xz4ORDqe4rDsOBxjLfZSjCLmCuvT7JKMdSRm1xWTXrWsvmjF7jvrZ1oNTV7xUzcZ
	xHyY4X4OYKe5tz0A6s/Jmlavr7ve/igb6uNuHWxV+uEAwmtDh+WscOzoXnqWSyqb
	iL/Fsx9u1/KZc1BnIzMj2g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagc6e4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 21:00:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Kebxv036822
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 21:00:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nah7nm5m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 21:00:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MsfcFlzW40N82LSo0WCO7V680V1EzSno6W66ISmS2ojX0Eatbcf2Z/Ih1QfcjLsfh2DqU8ZDC1LwXHLvI9lBS6R9Pujy6gphETRj9zWan89qC0f/75/Df9qRn4zmV4i0SzpCYTE5AHA7DYz4CMfEB2+qfdHKs8d3lJFds3C2vHmnXVXDNzYqPx+x3kyrX9A6UIopgk6RYJk8PJxb+zt6m2dB+DMey3i+GHjL9/+cmUu4tAifMxBVAMOsoiKVNZnEf63VCoq5FR91AF6P/fg9WmAWmJNMGzKg4sAeoTbGqHbi4mqJ+VAUybmkedkRgd2Ljqc+vr9ZNugblhAm0Bs+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynUyZH4YX5qFLvBHZqhlbZTY0Zq6HcheOGrGjVUaCdk=;
 b=V3t36CLvBJTmhwnirhHlZ9RnY+kvU2BwaCPpvk8BdtEulV8XfM7dPNZJvbIdbpHO+aYYcuQIWN85kyEEoRjZQj/bs7hLR2JW8RKnToljZyvsrDEpVWWvjp3V9JTHiJrzUr8Ceyg32eXIqoAvyMEiQN61SvA3UzwG0qlbQ2vjcmolIzPNvBiYSKdvo6dhIkuO6Sv/I5OXbrQ9FMWK99B18fPti+5hPBY/cpMNP+xiIDPnyloxaVzLT3NJTuXdgmxXkU/fnCidHsgQbJmmXeazdQ/DNzNlYqTlyMzivRLPz0YhA9xzumP74bOlPFk3IKAGgsrnoN3gsDvdKFLs0dP9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynUyZH4YX5qFLvBHZqhlbZTY0Zq6HcheOGrGjVUaCdk=;
 b=BNfe7KUuqINmAMeyWUrMBiGcbkh3dpovKZmianyM3NS2CJ14kQPbBm+3SaURYSie+re+E4uZVy2OyN1cAkVH2EWi2kVnAN3lFkl7BxX+/vx+hqd0AKwEwVUCYhxNYH1t0PpkHQQFjQ0xaZ4zB6gcAADcjoUN8Fr0qDwTVHXs+DE=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 20:59:55 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 20:59:55 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v6 4/6] usdt: typed args and arg mapping
Date: Tue,  5 Nov 2024 20:59:40 +0000
Message-ID: <20241105205942.192409-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105205942.192409-1-nick.alcock@oracle.com>
References: <20241105205942.192409-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0129.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::8) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: c0daa8c9-c96c-4774-0934-08dcfddcccc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?umsOr9kd+2zDnqKV6jM055nareArSDCsEVGV36E73fj42+R9dhbhPedjZvFS?=
 =?us-ascii?Q?zReFAfrhsfQ0QRRIq9ycVwlN64vQnHttx6Za3B/W0yIzkMGso/g3iMVq/aCM?=
 =?us-ascii?Q?ZkZ3SgEJ/a7ikG83NlQ9ATQdlTly3QYUB/Dtl8s543zZKKTAyApXCDl5tlq+?=
 =?us-ascii?Q?VZFevQlu5mHjDOJwAH6OWNn520A6AIj9zhibM3npJOafVrJj3kuUyd95yTGI?=
 =?us-ascii?Q?ys4JhfGX+xtiQffO/Ns+2iqnSJk5NfHnbQZAQAECoTAxYbjRiKVScsNg95Ii?=
 =?us-ascii?Q?xwmORYSH64z64kurU/UNYXev3yQ9lv24B9+NeW5akMrtzJFn9ebXorMqArh1?=
 =?us-ascii?Q?HGvYLzCFn0K+SztVWX1IFuTAJM28ej1ZAJD7LwyQt31+NK8/W0iFCco0UOfO?=
 =?us-ascii?Q?tm0yX6gJ9DhIXqpq6ZMQX1aMG1KJX3tDdutDuauKt+6pHuH0cNYU5/inxss3?=
 =?us-ascii?Q?eufA9yTxwHSJ0WpJ4/pC1c64OnpT1LE2V7lCps0dMZw9V/ijuZZr1BaPg1Tv?=
 =?us-ascii?Q?r+0qA9McaC72ax0vqVhvBknc7SS63DFSgAr9sOA+rfRGuexiPCvbHheyh9DV?=
 =?us-ascii?Q?f9upto2bkbL8Cx6GJdCdq9DoUXyW9JEfh29goB+qyHJeSeuz4CRppUDEFJfc?=
 =?us-ascii?Q?I8X/pCaI0CFYOu6JUqfdOGEQZkP9xQQb3mblU+/uz1tPwzWJoBc0EaFrlMLa?=
 =?us-ascii?Q?Mrkf/5/R1iWDc7EXIK/pUiD762bVrXw1U0bBgCOKRZZELDpvUXhKPlkGL14N?=
 =?us-ascii?Q?CSErFhil/ovwHbmXpQOrk2DHpzUKGC301CBw/+uvSRqPTW6RccfQne5nKF7W?=
 =?us-ascii?Q?GCX9UohHJJuZFa6XQdtOqyF+tHuoAG3q5Swv06Sx7qoSQMWvMOo8gYMeQHMj?=
 =?us-ascii?Q?Lrj6QBYAASKV+p+xfc3XY+and52ZKfAxtcZE8CYlLwCHtLLL028j0sW7vJhW?=
 =?us-ascii?Q?ebLoW0DjqWoIgZNISbrAHEtPIyBH/l86+Lvr9FO1XDaFghCZmRxtah+xfURQ?=
 =?us-ascii?Q?hq8F5+8Sh9+Kf6ZvL8L0H9HD0qadsv5B51NY0DXAtDKsuuMIjM7KxqipRXLj?=
 =?us-ascii?Q?zEqmG/GeWNKMmQGxpGBbIU30zYaNfmSv0aevUuXgqPoF0JX877PwztyzIk9P?=
 =?us-ascii?Q?aPAQ7NAWD6vc5bEKenjBv/uC7C8v27XtPuK99I0CguOGKAuG8hpC1/ficGfB?=
 =?us-ascii?Q?vhwKrX972MZT6HkO3KXexAepwkQ1D/lAHukCDdutlUNh1oZQD1NbkExPNkFF?=
 =?us-ascii?Q?OCuDx0V1adtLwxjpentAUHOTKKPU4/woGuErGj0Y7Fv2ioYJw9AP1PwtNWou?=
 =?us-ascii?Q?wrByIEUjBYlJqUqkDodadAiG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uxALm6PEYTk0EHDhPMPkbJZ1S5J432jaVqP0S2XJU8jShiFJvhd6EzZvYIKS?=
 =?us-ascii?Q?tSdLqBXoTlPzndkhzUHha2LDquUSgOE7SIYInEECR/EB98ejQjh+CxxSEeh1?=
 =?us-ascii?Q?lofl7Se7jESxHvlcyUJsc3Ln8h1vwIrweVLxG+ofmt5TizRL0EEtA/xOQqn2?=
 =?us-ascii?Q?7Pg/73DIEKZ0KEY6MnZ9yOg7rtPjs29cfCoAYgxRlpTIorFJvcNwBfFP7EJk?=
 =?us-ascii?Q?+3HuOiMpe2WDdb1wFFeUAeyCYZWNmRkGk8lxOKideU7cE8aFqEfYkQQgeWEm?=
 =?us-ascii?Q?S5MRLgPqOfSKnZadqpwOoHX9WqAjJArue64wI1yoJrYNE9EMAXO+KfuKfFQm?=
 =?us-ascii?Q?ZWhL1K+o6MQotS2qVzIXT/kn2htwuHwq1uYiVwz7ogzHTEBwAd1RiX5DbnTt?=
 =?us-ascii?Q?ZmRB89udmpXBxWP7dDc2qT0LLIzMwC1YLKKcqAvrX3O7US+jpp5OiEL4fOzi?=
 =?us-ascii?Q?tHav2gpC+5iVF3fb2mZq1AaBDroLhA2UtF/YjsKEDjolIUHL/5hAdFpTBvfF?=
 =?us-ascii?Q?Ppf3QMIsYR7tw2TgUYONS67yOdXM8Wehn1ASlD8Rhj2Gv0OF9Q0IPqTkjwt+?=
 =?us-ascii?Q?Aw/+3tLtsSGuWB+K5CqjHJrTKew42wM1D0I99FHfQ5kJMMLNk5tkS/SlUgBF?=
 =?us-ascii?Q?QFZguqqvU42JQHjL8noYDVqzNXyH11RwB86joVTFdsK9kiUrYo0QCmSPBcwG?=
 =?us-ascii?Q?GILDNakQ7qTJ7Zea50jbte5BY/g8pJ3y/X3Hkx0DItv0qTX8yGR5aIGFztbl?=
 =?us-ascii?Q?1b0oqXCkplCC4e+tm0XL7VVGLOBEbQ3v3YW8HcxO0z2KKej6YYDYTN0gq/79?=
 =?us-ascii?Q?B37ZwCT4v7OXg3N0zy2VA90uy7z2Tk22We54SFdDDKCECxPsiDNyYMAKF77n?=
 =?us-ascii?Q?aTrloPlFrZ4CztwaNwOdXqluPH6to0m8b1iQncLiqSlcC8p2HEO2Q//Mssjk?=
 =?us-ascii?Q?UDDY9Ah/mjtgiiZRKbKHKpQ2h7RNkM9/YMAZdqWJA3cRSL06fOBk2Bcs2squ?=
 =?us-ascii?Q?FyVYsB+nxoTkvNHAB1uTm+siFvDPzt2b7yiis+TBbnh7hXHBpr1ZBdWBU6y4?=
 =?us-ascii?Q?UDyMimVbmdM/xpsWkdmv1LzRncjD18vE3evZLXZHz+/b8OcNPeklHBaR8PfS?=
 =?us-ascii?Q?KYckdTyUyPh/zV2vOB5n9r+taA5TpSOps4T2fGjENj1YSN0iG0+x+BVs+Ex5?=
 =?us-ascii?Q?D6e8sWGGmASMFhVzQT+YCnnx9Z1vhVqa0MtaiIYcNWpW4LO/qd1oPgY6zOD3?=
 =?us-ascii?Q?T5J5PGSEFdjgeCjL/2v9+yBVk6q2G1rc0wmVaqvot4b+MxrnwObXPaWlpLwt?=
 =?us-ascii?Q?UMR40XxZpk34CXkbmm+Wx/RnAOwblzNnPY/r2JzlVu3JQxVnOJsYiNQed6Xw?=
 =?us-ascii?Q?wYLN6A0bsSIPrbw+l1qI98rDYgHVAFXlqMPqohWEdxNWUqnw8k26DFAbTQYk?=
 =?us-ascii?Q?VXRBSf9xzrDzxli1iprqGKsM69s0vtqn5D31WlvI0cYkmjlq0rsKsDQ67UU7?=
 =?us-ascii?Q?ysjaUSVYsgALNP3/IECvOps2Vya4kgN0QA7RhztB+DAe6BSaUALkLJvMQBIm?=
 =?us-ascii?Q?XQ2LScSFkhuymKdHSIyOzJJXPR68jZGq4POnoXMcQ5LlroIqUTQMox3KblB7?=
 =?us-ascii?Q?GQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	54z46eVySN4A6pO5FL3Ax77NP2hm6XHTZTNko1GbwU4vzUQkHgyfuiCR5Lztd+xDTFWthxMC+0/qZUJzb5wHnmdPMkEF4ifc7Nyj2cTjZcAoaTaHxhtCvBSwgnYwRG7n4NJZamFQUIblb1gmsDsPmzY8SPWX7BhLKxHI67K64eTdGO57QL+CuWSS4UIFH6/oVhM29ZPEf+1OTMVXtK0Zo5meRAWp7cU+piQbPh+rykDtL2cBX02yI6erWsGP6zmo+BqZWLV2JZ7+FjTdHFkJjKBeTtHDii3bGBI2BDG7HmJSh6o08gLs8p4kf073wsFJpT87sX8t0B+pM3ZlZ5pxAWU01ORlkQE4jFh+vMfsn6UuWulgPvzjosZzW3ipVspDvsN6X/Bam3z1uMbApFl9ouAFkLu8wFZzEdX0aWpN7Zcjko7Op9oI3Cf32wWsXLPYRKJ1XFJqNHYoGePQnri/7gHxXfwBXus6EsfK21wJ0xi8eHHCBTEcwejLXdvOwp5xqj1RleO7ptri4Z3N/fCd6A1mNCvWXWSONLWmfBJBhclIdKmGH3AJmU0JsZR8hne8LL+/9I2u3BTP1FXXDt1f5D008pj6ThXNv0kNkOC07ag=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0daa8c9-c96c-4774-0934-08dcfddcccc0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:59:55.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zmsxJdIdJn2d9uwwz6/6wX/a/G8MkyYvIZx+cychLOUAhm1YKHLDAYfYrA01aVjOr7e2Uip4mtvAzFp2Ml/9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050162
X-Proofpoint-ORIG-GUID: chp-sfC0Kdd_5yq0zMuJXQCN1zHpOjbR
X-Proofpoint-GUID: chp-sfC0Kdd_5yq0zMuJXQCN1zHpOjbR

This change propagates the arg type and mapping info we just got into the
pid_probespec_t onward into the underlying dt_uprobe_t and shuffles the
argument values by calling dt_cg_tramp_map_args().  With this, USDT probes
should now have visible types which obey the :-notation translators
specified in their .d file (this is now tested).

The probe_info hook has been moved from the underlying probe to the
overlying one as part of this: underlying probes don't have any user-visible
args to get info for, and their probe_info functions are never called.  We
populate the dt_argdesc_t in a function ultimately called from USDT probe
discovery via provide_underlying, so it predates trampoline setup let alone
probe_info on the overlying probe and all the args info is present before it
is needed.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 include/dtrace/pid.h                          |   1 +
 libdtrace/dt_prov_uprobe.c                    | 184 ++++++++++++++++--
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      | 130 +++++++++++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  89 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  41 ++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 +++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
 test/unittest/usdt/tst.argmap.d               |   5 +-
 14 files changed, 577 insertions(+), 18 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 25bfacfdbfe2..c53e600475df 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -22,6 +22,7 @@ typedef enum pid_probetype {
 	DTPPT_ENTRY,
 	DTPPT_RETURN,
 	DTPPT_OFFSETS,
+	DTPPT_USDT,
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index a8c1ab2761f0..1a1500c03ecc 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -46,9 +46,11 @@
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
 
-#define PP_IS_RETURN	1
-#define PP_IS_FUNCALL	2
-#define PP_IS_ENABLED	4
+#define PP_IS_RETURN	0x1
+#define PP_IS_FUNCALL	0x2
+#define PP_IS_ENABLED	0x4
+#define PP_IS_USDT	0x8
+#define PP_IS_MAPPED	0x10
 
 typedef struct dt_uprobe {
 	dev_t		dev;
@@ -57,7 +59,10 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	int		argc;		   /* number of args */
+	dt_argdesc_t	*args;		   /* args array (points into argvbuf) */
+	char		*argvbuf;	   /* arg strtab */
+	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -123,6 +128,8 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->args);
+	dt_free(dtp, upp->argvbuf);
 	dt_free(dtp, upp);
 }
 
@@ -516,6 +523,80 @@ static int discover(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Populate args for an underlying probe for use by the overlying USDT probe.
+ * The overlying probe does not exist yet at this point, so the arg data is
+ * stored in the underlying probe instead and will be accessed when probe_info
+ * is called in the overlying probe.
+ *
+ * Move it into dt_argdesc_t's for use later on. The char *'s in that structure
+ * are pointers into the argvbuf array, which is a straight concatenated copy of
+ * the nargv/xargv in the pid_probespec_t.
+ */
+static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
+			 dt_uprobe_t *upp)
+{
+	char	**nargv = NULL;
+	char	*nptr = NULL, *xptr = NULL;
+	size_t	i;
+
+	upp->argc = psp->pps_xargc;
+
+	/*
+	 * If we have a nonzero number of args, we always have at least one narg
+	 * and at least one xarg.  Double-check to be sure.  (These are not
+	 * populated, and thus left 0/NULL, for non-USDT probes.)
+	 */
+	if (upp->argc == 0 || psp->pps_xargv == NULL || psp->pps_nargv == NULL
+		|| psp->pps_xargvlen == 0 || psp->pps_nargvlen == 0)
+		return 0;
+
+	upp->argvbuf = dt_alloc(dtp, psp->pps_xargvlen + psp->pps_nargvlen);
+	if(upp->argvbuf == NULL)
+		return -1;
+	memcpy(upp->argvbuf, psp->pps_xargv, psp->pps_xargvlen);
+	xptr = upp->argvbuf;
+
+	memcpy(upp->argvbuf + psp->pps_xargvlen, psp->pps_nargv, psp->pps_nargvlen);
+	nptr = upp->argvbuf + psp->pps_xargvlen;
+
+	upp->args = dt_calloc(dtp, upp->argc, sizeof(dt_argdesc_t));
+	if (upp->args == NULL)
+		return -1;
+
+	/*
+	 * Construct an array to allow accessing native args by index.
+	 */
+	if ((nargv = dt_calloc(dtp, psp->pps_nargc, sizeof (char *))) == NULL)
+		goto fail;
+
+	for (i = 0; i < psp->pps_nargc; i++, nptr += strlen(nptr) + 1)
+		nargv[i] = nptr;
+
+	/*
+	 * Fill up the upp->args array based on xargs.  If this indicates that
+	 * mapping is needed, note as much.
+	 */
+	for (i = 0; i < upp->argc; i++, xptr += strlen(xptr) + 1) {
+		int map_arg = psp->pps_argmap[i];
+
+		upp->args[i].native = nargv[map_arg];
+		upp->args[i].xlate = xptr;
+		upp->args[i].mapping = map_arg;
+		upp->args[i].flags = 0;
+
+                if (i != map_arg)
+			upp->flags |= PP_IS_MAPPED;
+	}
+
+	free(nargv);
+	return 0;
+
+ fail:
+	free(nargv);
+	return -1;
+}
+
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
  * uprobe.  Since multiple pid and USDT probes may all map onto the same
@@ -530,7 +611,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	char			prb[DTRACE_NAMELEN];
 	dtrace_probedesc_t	pd;
 	dt_probe_t		*uprp;
-	dt_uprobe_t		*upp;
+	dt_uprobe_t		*upp = NULL;
 
 	/*
 	 * The underlying probes (uprobes) represent the tracepoints that pid
@@ -555,6 +636,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	case DTPPT_ENTRY:
 	case DTPPT_OFFSETS:
+	case DTPPT_USDT:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
 		break;
 	default:
@@ -568,6 +650,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.fun = psp->pps_fun;
 	pd.prb = prb;
 
+	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
 	uprp = dt_probe_lookup(dtp, &pd);
 	if (uprp == NULL) {
 		dt_provider_t	*pvp;
@@ -591,12 +675,24 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 			goto fail;
 
 		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
-				      upp);
+				       upp);
 		if (uprp == NULL)
 			goto fail;
 	} else
 		upp = uprp->prv_data;
 
+	/*
+	 * Only one USDT probe can correspond to each underlying probe.
+	 */
+	if (psp->pps_type == DTPPT_USDT && upp->flags == PP_IS_USDT) {
+		dt_dprintf("Found overlapping USDT probe at %lx/%lx/%lx/%s\n",
+			   upp->dev, upp->inum, upp->off, upp->fn);
+		goto fail;
+	}
+
+	if (populate_args(dtp, psp, upp) < 0)
+		goto fail;
+
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
 	    upp->flags |= PP_IS_RETURN;
@@ -604,15 +700,20 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	    upp->flags |= PP_IS_ENABLED;
 	    break;
+	case DTPPT_USDT:
+	    upp->flags |= PP_IS_USDT;
+	    break;
 	default: ;
 	    /*
 	     * No flags needed for other types.
 	     */
 	}
 
-	return uprp;
+        return uprp;
 
 fail:
+	dt_dprintf("Failed to instantiate %s:%s:%s:%s\n", psp->pps_prv,
+		   psp->pps_mod, psp->pps_fn, psp->pps_prb);
 	probe_destroy(dtp, upp);
 	return NULL;
 }
@@ -732,7 +833,7 @@ static int provide_pid_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 
 static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 {
-	if (psp->pps_type != DTPPT_OFFSETS &&
+	if (psp->pps_type != DTPPT_USDT &&
 	    psp->pps_type != DTPPT_IS_ENABLED) {
 		dt_dprintf("pid: unknown USDT probe type %i\n", psp->pps_type);
 		return -1;
@@ -786,7 +887,13 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
  *	int dt_uprobe(dt_pt_regs *regs)
  *
  * The trampoline will first populate a dt_dctx_t struct.  It will then emulate
- * the firing of all dependent pid* probes and their clauses.
+ * the firing of all dependent pid* and USDT probes and their clauses, or (in
+ * the case of is-enabled probes), do the necessary copying (is-enabled probes
+ * have no associated clauses and their behaviour is hardwired).
+ *
+ * Trampolines associated with USDT probes will also arrange for argument
+ * shuffling before the USDT clauses are invoked if the argmap array calls for
+ * it.
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
@@ -864,7 +971,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	}
 
 	/*
-	 * USDT
+	 * USDT.
 	 */
 
 	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
@@ -873,6 +980,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 	dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
+	/*
+	 * Apply arg mappings, if needed.
+	 */
+	if (upp->flags & PP_IS_MAPPED) {
+
+		/* dt_cg_tramp_map_args() works from the saved args. */
+		dt_cg_tramp_save_args(pcb);
+		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
+	}
+
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
 	 */
@@ -1083,10 +1200,51 @@ attach_bpf:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	*argcp = 0;			/* no known arguments */
-	*argvp = NULL;
+	size_t		i = 0;
+	list_probe_t	*pup = prp->prv_data;
+	dt_uprobe_t	*upp;
+	size_t		argc = 0;
+	dt_argdesc_t	*argv = NULL;
+
+	/* No underlying probes?  No args.  */
+	if (!pup)
+		goto done;
+
+	upp = pup->probe->prv_data;
+	if (!upp || upp->args == NULL)
+		goto done;
+
+	argc = upp->argc;
+	argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
+	if (argv == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	for (i = 0; i < argc; i++) {
+		argv[i].native = strdup(upp->args[i].native);
+		if (upp->args[i].xlate)
+			argv[i].xlate = strdup(upp->args[i].xlate);
+		argv[i].mapping = i;
+
+		if (argv[i].native == NULL ||
+		    (upp->args[i].xlate != NULL && argv[i].xlate == NULL))
+			goto oom;
+	}
+
+done:
+	*argcp = argc;
+	*argvp = argv;
 
 	return 0;
+ oom:
+	size_t j;
+
+	for (j = 0; j <= i; j++) {
+		free((char *) argv[i].native);
+		free((char *) argv[i].xlate);
+	}
+
+        dt_free(dtp, argv);
+	return dt_set_errno(dtp, EDT_NOMEM);
 }
 
 /*
@@ -1152,7 +1310,6 @@ dt_provimpl_t	dt_uprobe = {
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
 	.attach		= &attach,
-	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
 	.add_probe	= &add_probe_uprobe,
@@ -1178,6 +1335,7 @@ dt_provimpl_t	dt_usdt = {
 	.populate	= &populate_usdt,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
+	.probe_info	= &probe_info,
 	.probe_destroy	= &probe_destroy,
 	.discover	= &discover,
 	.add_probe	= &add_probe_usdt,
diff --git a/test/triggers/usdt-tst-argmap-prov.d b/test/triggers/usdt-tst-argmap-prov.d
index 28134baa6fa3..d8c3e88c4616 100644
--- a/test/triggers/usdt-tst-argmap-prov.d
+++ b/test/triggers/usdt-tst-argmap-prov.d
@@ -1,10 +1,13 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
 provider test_prov {
 	probe place(int i, int j) : (int j, int i, int i, int j);
+	probe place2(int i, char *j) : (char *j, int i, int i, char *j);
+	probe place3(int i, char *j) : (char *j);
+	probe place4(int i, char *j) : ();
 };
diff --git a/test/triggers/usdt-tst-argmap.c b/test/triggers/usdt-tst-argmap.c
index 89a0a53fc1d5..9244092514ff 100644
--- a/test/triggers/usdt-tst-argmap.c
+++ b/test/triggers/usdt-tst-argmap.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,9 @@ main(int argc, char **argv)
 {
 	for (;;) {
 		DTRACE_PROBE2(test_prov, place, 10, 4);
+		DTRACE_PROBE(test_prov, place2, 255, "foo");
+		DTRACE_PROBE(test_prov, place3, 126, "bar");
+		DTRACE_PROBE(test_prov, place4, 204, "baz");
 	}
 
 	return 0;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
new file mode 100644
index 000000000000..d2e280e5f21c
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
@@ -0,0 +1,130 @@
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go_vanishing
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+ XX test_provXXXX              test                              main go_halved
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+
+ XX test_provXXXX              test                              main go_doubled
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+		args[2]: int
+		args[3]: char *
+
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+   ID   PROVIDER            MODULE                          FUNCTION NAME
+ XX test_provXXXX              test                              main go_vanishing
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+ XX test_provXXXX              test                              main go_halved
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+
+ XX test_provXXXX              test                              main go_doubled
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+		args[2]: int
+		args[3]: char *
+
+ XX test_provXXXX              test                              main go
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics:   Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
new file mode 100755
index 000000000000..b0a2345a6681
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
@@ -0,0 +1,89 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2013, 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+##
+#
+# ASSERTION:
+# Testing -lvn option with USDT probes with a valid probe name.
+#
+# SECTION: dtrace Utility/-ln Option
+#
+##
+
+if [ $# != 1 ]; then
+	echo expected one argument: '<'dtrace-path'>'
+	exit 2
+fi
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/list-probes-args-usdt.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go(int a, char *b) : (char *b, int a);
+	probe go_doubled(int a, char *b) : (char *b, int a, int a, char *b);
+	probe go_halved(int a, char *b) : (char *b);
+	probe go_vanishing(int a, char *b) : ();
+};
+EOF
+
+$dtrace -h -s prov.d
+if [ $? -ne 0 ]; then
+	echo "failed to generate header file" >& 2
+	exit 1
+fi
+
+cat > test.c <<EOF
+#include <sys/types.h>
+#include "prov.h"
+
+int
+main(int argc, char **argv)
+{
+	TEST_PROV_GO(666, "foo");
+	TEST_PROV_GO_DOUBLED(666, "foo");
+	TEST_PROV_GO_HALVED(666, "foo");
+	TEST_PROV_GO_VANISHING(666, "foo");
+	sleep(10);
+}
+EOF
+
+${CC} ${CFLAGS} -c test.c
+if [ $? -ne 0 ]; then
+	echo "failed to compile test.c" >& 2
+	exit 1
+fi
+$dtrace -G -s prov.d test.o
+if [ $? -ne 0 ]; then
+	echo "failed to create DOF" >& 2
+	exit 1
+fi
+${CC} ${CFLAGS} -o test test.o prov.o
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >& 2
+	exit 1
+fi
+
+script()
+{
+	$dtrace -c ./test -lvn 'test_prov$target:::go*'
+	./test &
+	PID=$!
+	disown %+
+	$dtrace -p $PID -lvn 'test_prov$target:::go*'
+	kill -9 $PID
+}
+
+script
+status=$?
+
+exit $status
diff --git a/test/unittest/usdt/err.argmap-null.d b/test/unittest/usdt/err.argmap-null.d
new file mode 100644
index 000000000000..ba765bea7a04
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.d
@@ -0,0 +1,41 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that a probe left with no args at all due to mapping
+ *            has no args.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+/args[0] != 204 || args[0] == 204/
+{
+	printf("this should never happen");
+	exit(1);
+}
+
+test_prov$1:::place4
+{
+	printf("nor should this");
+	exit(1);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/err.argmap-null.r b/test/unittest/usdt/err.argmap-null.r
new file mode 100644
index 000000000000..215475e39b48
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/usdt/err.argmap-null.d: line 24: index 0 is out of range for test_provXXXX:::place4 args[ ]
diff --git a/test/unittest/usdt/err.argmap-null.r.p b/test/unittest/usdt/err.argmap-null.r.p
new file mode 100755
index 000000000000..c575983adf65
--- /dev/null
+++ b/test/unittest/usdt/err.argmap-null.r.p
@@ -0,0 +1,2 @@
+#!/bin/sed -rf
+s,test_prov[0-9]*,test_provXXXX,g; s,^ *[0-9]+, XX,g;
diff --git a/test/unittest/usdt/tst.argmap-null.d b/test/unittest/usdt/tst.argmap-null.d
new file mode 100644
index 000000000000..dacf4c4f569a
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-null.d
@@ -0,0 +1,32 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that you can map to no args at all.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place4
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed-partial.d b/test/unittest/usdt/tst.argmap-typed-partial.d
new file mode 100644
index 000000000000..8c4d7273c0ab
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed-partial.d
@@ -0,0 +1,49 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped,
+ *            even if some args are unused.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place3
+/stringof(args[0]) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(args[0]));
+	exit(1);
+}
+
+test_prov$1:::place3
+/stringof(copyinstr(arg0)) != "bar"/
+{
+	printf("arg is %s; should be \"bar\"",
+	    stringof(copyinstr(arg0)));
+	exit(1);
+}
+
+test_prov$1:::place3
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap-typed.d b/test/unittest/usdt/tst.argmap-typed.d
new file mode 100644
index 000000000000..1243e059b8ae
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/* @@trigger: usdt-tst-argmap */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
+/*
+ * ASSERTION: Verify that args[N] variables are properly typed when mapped.
+ */
+
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+}
+
+test_prov$1:::place2
+/stringof(args[0]) != "foo" || args[1] != 255 || args[2] != 255 || stringof(args[3]) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(args[0]), args[1], args[2], stringof(args[3]));
+	exit(1);
+}
+
+test_prov$1:::place2
+/stringof(copyinstr(arg0)) != "foo" || arg1 != 255 || arg2 != 255 || stringof(copyinstr(arg3)) != "foo"/
+{
+	printf("args are %s, %d, %d, %s; should be \"foo\", 255, 255, \"foo\"",
+	    stringof(copyinstr(arg0)), arg1, arg2, stringof(copyinstr(arg3)));
+	exit(1);
+}
+
+test_prov$1:::place2
+{
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/usdt/tst.argmap.d b/test/unittest/usdt/tst.argmap.d
index 7896dc07e0e2..a7d68da3dfbc 100644
--- a/test/unittest/usdt/tst.argmap.d
+++ b/test/unittest/usdt/tst.argmap.d
@@ -1,17 +1,16 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@xfail: dtv2 */
 /* @@trigger: usdt-tst-argmap */
 /* @@trigger-timing: before */
 /* @@runtest-opts: $_pid */
 
 /*
- * ASSERTION: Verify that argN and args[N] variables are properly remapped.
+ * ASSERTION: Verify that argN and args[N] variables are properly mapped.
  */
 
 BEGIN
-- 
2.46.0.278.g36e3a12567

