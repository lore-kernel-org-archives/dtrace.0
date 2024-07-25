Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26C1799D
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721883382; cv=fail; b=P97BWUmlJiyF08LIhiGR4yTC1Dcy7z8aZm6ajtO3eyhlIsiII6IQqtxkrUuISc9tSjh6fssaUt8Cr1sqZifhesN++mMvh2V4lYiIfibvQqOHKBUJv3f69dvR78aaKL7l7HhwPViJTocdnkIxHUXTEegl0ShookUDVm4TbM3aIDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721883382; c=relaxed/simple;
	bh=sQcrXn0+0BfiP8vN4fk7ltd9f7eHhCzcVteiDW01P40=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=aNm14y7KfKTRnR8wCxYr1sRU+kYKhlKJzY2VgnnTl6laal5jVITKGHsxspMfYpfztdw5iER6fwnoHxRNasM+d4N8qCZepvFeXjL7U66r94/WCz0qPXzZO/cTsduYC6iAC/8AlvGVyiwoxbQPC6eXaRPgOEsV4A3siah1yHEbxEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R3fVp8Jw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UV5UcWfi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R3fVp8Jw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UV5UcWfi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46OJe4jx024709
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 04:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=gdPCmz3MQdRnhdeuhPoQTucoVhA6JcT0LQYwkFjd5KE=; b=
	R3fVp8JwDMd0N25ImHZ6g86b0n8AK6d82M7wAeHUQdckJQS9/uJSK2hC3r+8Dk27
	DmL8KyPG6q9YtHYRyfNIHY3+JLQmn2RT2Aax5oMqqds9YxpTPhqr/6kJLnx2tuWT
	his/GBsY4h7KNiJ3EN6xp/dxW122DnVtqxB/oeE6EYZpfKH9b3SMKJORrlwa01y6
	lX0oxoU4U0rDbAmWjQM83Y40bh7YvsNmrbwcjLW1o13x2nyMs+XA6MVvp8ROkxFZ
	hxxkx2zvmqt2a2QB1AHri8mgXRVb+eBOW0NOCjY1Kvd6x1GuiFy1ciJgz8P7yoCd
	tCvrHQGuR/HwQlKJU09D1A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hgkr2dn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 04:56:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46P45WvZ040050
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 04:56:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h26pt0q2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Jul 2024 04:56:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWYYGg1ud4RfqxxNBSHAHuCzD8byJ+IB19BvDyPjKX4Fdbnydx0R9DUghN7i5zJiN9hCxdzQuqR4JwaTMm6NntP3BUxz2JCW3iANoZeUpdKfZ4oGEgk3438I3gQvFIoeB7G4vazB3gpdvACgkdCib9j83qc1cmRp797oSpC7Z9azaKeH2jMnHBshCJg/tAGahHIZkbB66GWPRseU6E8eKmi3xWOEIlJxADjjNVI0qEG3SrnCSwIgwP9rRfR6Fe1RXG2pdR4w7/zqvIa1vh/lkZxBEKKlV5n44yawGBLEIlibe++jYAtyBemRllPEBSIN23Q+Dd40zoXkZyHjCbgomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdPCmz3MQdRnhdeuhPoQTucoVhA6JcT0LQYwkFjd5KE=;
 b=a7vuMVIhcaa4nnjNPLlXEcgvhjyS4em44rIfXsVcIUMXIqmBz6Rc7p5sTLqpS0ccDOIjmy662wK5fSFg6rdWSYKF3k6Y/Ztyg2FiNZYnHn7BxYy4XmCUVeBDxt+mtu8R9fzYepXfN7sljrz4HtS7MPMOwxjxe9rLwJyLPNzMWrO8zAPKKE3kI+kOsw/fhxKHOqJ7EENmNddf2QzBZJfbAfV7AIgURoVlluchjQITOtZclmG0lNYVeXoKc50mqPYzGOBEG+BocPt40rZoytNrgvzUbPFsiL7LaiwpTlyI2ggWJoJ2gzEs1QAwf1Qs2+GxeYdeys+ABAa3YMoXfj/9JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdPCmz3MQdRnhdeuhPoQTucoVhA6JcT0LQYwkFjd5KE=;
 b=UV5UcWfiWr8a/oAJwjEEtS+uAhlwH0q6liOHjTpJBevNVDTq0xKjfDLmFFlgzO37GSY1Ksd+vB50SoWZZw0HIWhFkBB2d9LZjHbcwELi9j5VAQBAxZoNpZzhbbPL+ype2ng2+rCBb1AudqGKAzFU7K4/59a9Wy9gscZEseoBfXI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB5648.namprd10.prod.outlook.com (2603:10b6:a03:3e0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 04:56:13 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 25 Jul 2024
 04:56:13 +0000
Date: Thu, 25 Jul 2024 00:56:11 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] btf: ensure BTF-to-CTF conversion works for modules
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:207:3c::35) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287CB0F14DD5FBF62319CBDC2AB2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: aca15944-72cc-479f-a351-08dcac661bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sngiK+qLYEC7HyFGZ1CfbSn1undmX9xfejLq1ovDBOcqdHDPzDEq/IIzonrH?=
 =?us-ascii?Q?vlOFOoUTg2qec6vxvISyq/8xemS3bTc5XifZI+EXr+SQee/f9jBdmCznTMn7?=
 =?us-ascii?Q?or0ezmjLrMXvMNE3mvB7ID8YolROrgYDIQ3iMlPWgxB7ML/GbvsQX8BnshqB?=
 =?us-ascii?Q?cQJDqUvrB7guVgghwsNUYVZhke5eSWOkd46aVlbvG+IPsL7N0m0nSk3Od8tq?=
 =?us-ascii?Q?22Dr3x2CeSprDgozJ3n95+U+jkPKcTUU2zJ3xhUSDnu43ZkNhrilM9M12e8t?=
 =?us-ascii?Q?AMM/TlAq0m3wsPIsFmSe4m0oXjiQ4ih4B8C38SgbogiOYe4i+Nl7zcCgYCU1?=
 =?us-ascii?Q?H1N8eRDUOFDBSq7apJypaPYMDrWI2quSecsSkFkGzheF5jD2Fbeq6WDHzS7L?=
 =?us-ascii?Q?J4+WlP4F+PNNXGn7ux0KoWMHS7BDaXSwkDceZZomXeUnA2TdK6GysBIUja//?=
 =?us-ascii?Q?NBC2/rF8bnCw6nM9VEESjcq6JYDJ9nSvG+11OYt63vkyeU9hfkn1+C53ZFqr?=
 =?us-ascii?Q?gwuzuhcuqWfSdEJ7avuS3qmz3LsCupnZNZzA/QHIEUIzMPJoYE3bZiJ5K4ZT?=
 =?us-ascii?Q?MUYeQdd11wW11tOHAj4PmQN3ZM4bo98LA/mf+WnB4SdkOSxWncIc4FtofwFK?=
 =?us-ascii?Q?AjIlUJuxzyjVDs2HBddd4q9fMFuRg3qH233VeaUfwPwYXCOlKtenXlTDVXl3?=
 =?us-ascii?Q?tHU9SuBSpPJSGHgRDXdwK0qfyJfHpI9z7ylvPyqOEHQ751Rdsr1v3z1YCzt0?=
 =?us-ascii?Q?unVhkK4Q5IaSC2YtswhnU57AxdaEwntqejEVF4pI+PytSC5cl9jkeEebaFHY?=
 =?us-ascii?Q?zxIit3DGuz4ln1yf4cAPimfvfjUxEBqnaV0IZ0UFS7uon29cznFkig4XvBBj?=
 =?us-ascii?Q?2a2D4NAUrSvvofgtZaxs9vZ0SMwc92rgPMGb9ycg9hsmzznfaP+b8gGN5ex9?=
 =?us-ascii?Q?UuSCH3wQ0i2VW35VnDeyJR59oA1bVIsU6fjKObnpqT7LsuQzrO4swdmK74p5?=
 =?us-ascii?Q?deTVOUddpnH7zY/1Jse5s81dAolpa3ZRBwXYLKJ3UfrjUk+Q5ZQ+pL5GHvHu?=
 =?us-ascii?Q?/V5/zqTdiHxas2toNBkVIAS2IW0GE94DP90iD9JnGK76ArvGdfmboCtzRT3r?=
 =?us-ascii?Q?DNZcxlHphzNKjOn6zvl3dSseam8k/oTc9Z+oJr2QDFX6lNDx/3HsDiwMIMmp?=
 =?us-ascii?Q?qln0WMVt/5F2vJhFMzUFflL3pnXnKkcsBxiYM8Qd+5StZnm8hMZ/MBQq0LVI?=
 =?us-ascii?Q?ta+X4rTc5OzNIXuBj9x9L8OeewfyRdOtpXzuAYP8Zo/jfbzS1JSywqb4SfjZ?=
 =?us-ascii?Q?L77BUTwK8bmDZTTe00o4w3c2ez2ECQGG3M9zr+PrNYV4Kw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VeGZxodc0UE8yondYBNIpFM+/Oz70LYVY2QE6aVgnuwxnty6tiJW/Uz1zuvA?=
 =?us-ascii?Q?AjsX0H5Obz8QijDkznR2nATRf3ydHU2Vrm0flOFBf68rSFKhO6b2EP2882ra?=
 =?us-ascii?Q?GAQNawbLy+Ubo/6H1s7SuzkUns3jC5czdyKN9SCamYpB5gYySNGvImBT/63P?=
 =?us-ascii?Q?sBtT68vPi3zUoW++eQkpGGFMmhFWlIqQUgcp7jkhLbBMQb8FmvSOBtCyxpFS?=
 =?us-ascii?Q?DH9LiwswN9cnI/Y0Y9SrVaGPNX5GNcrgCOtoPRPGkEz86Dx7u9Dj4yVasvVZ?=
 =?us-ascii?Q?8OJmvz74AvjU8x7Qxnm0+PzuQ49c9PJTcO3GhyGch6f9b13TWT6lysaxQnYp?=
 =?us-ascii?Q?C8nIjYP1PNdTfRyi3sSq1qXy1M6uY2nCFosOb4IlzYCCE/279ct1Ti5mZR82?=
 =?us-ascii?Q?ubWNnslc7e0O1rCWO5S1zuo+qvrGsPpfJMLMkAqv6Lm65QfHMF19h7RjMBOj?=
 =?us-ascii?Q?oXhruXE68/OdoJ2uBjeILUUTPdpwzDuy/YiSZxUZd9WmLMQHOprXcXeRR4Yk?=
 =?us-ascii?Q?qIgb8QFQBvKtwnOSXlgF5TF1AWy/BKQdy0aNkArB7g/kufxAkYQY+9E3epLX?=
 =?us-ascii?Q?d417wHHEPYbmYZ0hsemfJ05dBWwSiXIkLt+0F8Nsx8b6UebxX3ORftp8zs8d?=
 =?us-ascii?Q?xoqflwMvggo9DMbVlI8nyZsweg45a58e5UCb9YXPQLJOaRluLtQO0ut7pYcY?=
 =?us-ascii?Q?20COeXeoNXS8hnvTJIW6icrYMoupDQa7U2aXT5Wz7MGWQunJQY3/JDKGF+GN?=
 =?us-ascii?Q?/t6GQJB0YQN+mwgBaarF5OQcCQjEV8gA0qVFr28NQ6ClRhNuAGd09FjOGDl5?=
 =?us-ascii?Q?UrPdhULzgiuZklPqdULHZs6zMcQ3ODRK56AryUir1doMFDIcsUMlYM0WdXTg?=
 =?us-ascii?Q?Rw5oO8lgDngzxn18rOOgl7wRMtp7kR6Mx+X+3Pv98RXXipaf+gSQwJz8a/8X?=
 =?us-ascii?Q?8dxvAqhj1B2zsM19k4g/khfejhB19INrBHcfn+CQ348A2kUE3HDlSNlF+OCx?=
 =?us-ascii?Q?+CcmePAz+spKUNED1h/vqsLb85O42xRRtaHZH+UMkp0/DVEuKm78uQY8JV7z?=
 =?us-ascii?Q?iiZ3s2xBrFsK9bBwnXkjZT1y8FTR121wrP0nWgDNnjNq6uvvrRaCe2SF/Qep?=
 =?us-ascii?Q?y503F38UlGlOt3qWrIUFHGqJUB39qV8CFErl89GnLpC46qAnAAUUGP7Klvdp?=
 =?us-ascii?Q?agJYocu/+lyGHtRQP0idAdk4Ce0CSWIE9y0GRrvG8cWPECygEiroYuXvVpU/?=
 =?us-ascii?Q?1e26r6z8HICePDJPv8hkTA1qjJ+0jJqsftQwAHp+W4Lg6bVsxwIe0MZsBg0+?=
 =?us-ascii?Q?3D8OhwingMQ7KLxM7jwZUK50SYKqeDJzcnL+V8iUWSqRj/8Wvpz3mIhV8+4b?=
 =?us-ascii?Q?4NrPdOK0LfebVezMqL/glVUon1aC4qZ4Q6YY7fAn8sfMmAzEM6IKewE7Iv2v?=
 =?us-ascii?Q?IZuM3FjftYjp12wJLIDBuz/9LsTx2JwkN9KLeQpdFN0fvZebTSCyQXdF8r5C?=
 =?us-ascii?Q?OTKGb67QOoHGvZt1Kmmli/PHUP7cZioRVWPX29F08vaeynFKd8z+M/QpqPyW?=
 =?us-ascii?Q?4tFGZ3nzNAG06i10EIgMg7u1uyl8TuVuSb5ZokzPrTSl+5XYlOaS4L5ykzHg?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wZDJ1yVODPG2X3464+cZZVaK6r1gLpG+LK5xGafp078Rd0Rxhe7cSUk+dYusNlzk9rQtoMc4qOfZmXWQXmFViXPP8yr245BxUorKkOknvB1tnmSnZVwYvPiLSv9wZxXtJfw/N7LLBtMJ3Bqa9Yh+IUg2/CEhXZa9pbd+OwQQBn7i+XcGtzmmxD7Sw7FvCK0e6Sg/R3wGB5hrkDAamZ7LUEFNkHdfbD3kWC1ePrLEXm9ezoflMf2zVAvNPTJIAzaWxQwVaDCfJShU7xrZemWa4LOeBwTWszPlSTiUsR4GrdTRvzRXbNqVlYCi++pEW85L5fDA6U/jWco5jWhDtxmGAJQ/tY5fcXPJkrpWzpHrRLHSWYreLBrWVyhqqEPyFRurhrBeOlNuevP1uVlQHKRkd6znjetAWDpBE7KLwrkR/MFgcrVfCJOHBQVnaID61luaurkEW49s3A4JsKbcFMmr1qKF5MtG4qehXv9yDkEoW7lgZsAzHMmrfS7TBRDbOBqjVdveUsaklYqdUkqUMh8jEs0mAUOLYbMmEZIvpK13gjU+R4lP1DfVeAQ0r5XYsDY6ybaFUeoHivM/ISz+4ouY7vwUbJ/dmQTXs73XCWwumFA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca15944-72cc-479f-a351-08dcac661bd0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 04:56:13.3965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sy9oMM2AhLs0ZfEgkyWTGQXBNREAcwTGcsDDJCWuUDeJBMJydt+EFMoOJZC73Eed76kGsW/El92gKoJ2cMvDRt3HMTmpd3XwYPA3FyKY+UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5648
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_05,2024-07-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=788 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250030
X-Proofpoint-ORIG-GUID: qHC7NdfhcFRMakvwF1wXr3eNsNaVIzw-
X-Proofpoint-GUID: qHC7NdfhcFRMakvwF1wXr3eNsNaVIzw-

The recent introduction of code to always load BTF data for modules
broke the BTF-to-CTF conversion for modules.  This patch ensures that
the BTF-to-CTF convertor code is called from any module that does not
contain CTF data.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 5e608446..cbbb1d3c 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -962,8 +962,8 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 			dt_dprintf("Cannot open CTF archive %s: %s; "
 				   "looking for in-module CTF instead.\n",
 				   ctfa_name, ctf_errmsg(dtp->dt_ctferr));
-#endif
 			return;
+#endif
 		}
 
 		if (dtp->dt_ctfa_path == NULL)
@@ -1018,6 +1018,11 @@ dt_kern_module_find_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 
 		dmp->dm_flags |= DT_DM_CTF_ARCHIVED;
 		ctf_setspecific(dmp->dm_ctfp, dmp);
+#ifdef HAVE_LIBCTF
+	} else {
+		/* Generate CTF from BTF for the module. */
+		dt_kern_module_ctf_from_btf(dtp, dmp);
+#endif
 	}
 
 	/*
-- 
2.42.0

