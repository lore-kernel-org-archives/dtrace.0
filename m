Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4C913C3F2
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 16:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731341121; cv=fail; b=ac/Jo5DTqpkeLp1IIhM3TjfM3y6uvtTqVeRqroRI2TW9QYZdmpmk0k8nxUswSyzoidCacx9Z7WQaVDMUovae2lvNWWZgRhdx3gSmCZtjNE+7aG8iwHubw5BDIsdjpG1frrcrTZOlEbcsL1I+o8ZpCgxBuKLvKln4SxD796eMQlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731341121; c=relaxed/simple;
	bh=vI4Qe8CqUZGDDIL1TdO77x4TJHN51KASnFQWuyAlIx8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Bj3nORSlwfdIbeNuswDj6hQ8K8Q3tdw+2s9x4/Kc5Nmstp1OaNP0oM1GxdwrzJAx2z5mx5YTV6BInZvirfv0rt7s0FBED3H68o2O4yNQy02Yg3zFujbAzoupriyWTMSUpkzONoeFEawZupb0CRG8CRRhyHTtNbV02XcepsBY6Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IYU2GQUa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cWcu6VlX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IYU2GQUa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cWcu6VlX"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB9sonS002358
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 16:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=0UH1rV/g47h4HJN9
	w8qibQ8YKm6yIrAZiI66YFfTwZs=; b=IYU2GQUaduadxQSkgJHddW292T/sZ9Hr
	XsFcEiwslOIVrfuRqz7mFwsJTpjZdyPclVLEWXxKZ2xkRu7ksyBfIcD/Z/LhPV7y
	kX60BZIticgzrrAQFL2Y8CpEMZAhuxCum/rwSbAB+r5XaAXqUAJBlwI0RASLIgy+
	uOhDPjqGsOFXlt5x0n2GEbCwkWbL3SVSb6w8pyn//QcVgylbB8JBcHwpxCM0fbow
	C6RUgm31+V1sqVYNbr8fMGM2/JebVRwd81262fqpoiEOv+taYCc15c8RbkD2smHE
	TkBvK/M8fIZfoPUusOS0CXdaE+UcdXvBTne/f/oY/hf8k3uWr5yOfQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0hejsq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 16:05:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABF2Wi1037859
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 16:05:16 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx676a8g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 16:05:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwGyWIwgRHSgRn59qi3R7FaP5WbVWsngpBI0aAQvSPG5y+zHdLNqsY+3PHlh7Efp7KYx3YXFO3GHkV6N4Z81JSqtIUhEcECX3LyLb0lzMj2PJHo1neYJSOgFiiP0BuJmN2YRhVzDurPfbE5UTrVN0EAvQ5mhjCBdq8tlelqJ6/9yf2YbkH1q53Pz3L8tWKLWu9E8KcxcgrMz/8vMiIgKvb1iUQYojtm61Z7q99u70TRP/sur2dI5aFK87g2XjYT68ep3nmmG94TbvPT4a2PxBuO27Xqb483APclYNjuHW42mQCbVpUBx1IiGX7bMxu1M6qcMcErsxVOLI9L8Ro3mBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UH1rV/g47h4HJN9w8qibQ8YKm6yIrAZiI66YFfTwZs=;
 b=vcyob9ENoU+eQq3bZL5NBp1iqVlsuPTa8W9m/bWxlWe2MQUsUBTKmVf1nFWBLAyxykNF/IAGDKRnhK1FLAU2nS2vttr4cZacNJzDFwpvWZuT6hHwVXQ74zslY+sF7Ee99s/H11Q9h6PiroAEWWZDfgaHFnFcSLplnooKAx1G2Ov7yMyBlwMg2BxExupMIW6EdIvTSs5ffq8djSqULackfILcU+5hCgGbvfuCkr8zM6CO62THWY4Qe/2uprAtwITSDFcrJkbJaNRODjn1lMUejlrpYZmffcEpqeR73Wc4FTwbm7USMxbmxcUMkx45z3Pe27dEAXfxAD3mh2EBC89w9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UH1rV/g47h4HJN9w8qibQ8YKm6yIrAZiI66YFfTwZs=;
 b=cWcu6VlX996L6EgdNJsTZ9q0TMskR8Vpou4alEkFk14M71kB0071npJuP0MYTPEmA9BIMlKMTgUSrKSijBvuSn4ihuPQmW3pb9sMV0w91ptflvNErisOlm7yRmkK86mB4tK67Lho54glI2AXhxxGDqr6v51qiWRbQ0spMTBKRv4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CO1PR10MB4772.namprd10.prod.outlook.com (2603:10b6:303:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 16:05:11 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 16:05:11 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Allow arbitrary tracefs mount points
Date: Mon, 11 Nov 2024 16:05:08 +0000
Message-ID: <20241111160508.138914-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0055.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::12) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CO1PR10MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: 63900134-e71c-4dda-fc7c-08dd026a9f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mabyWieozBNGeSBiItJR7ltr7R11ubPp6VbF5MjV9ET4aaslzmVzt8Xqm8DX?=
 =?us-ascii?Q?h5vgxauAI85V56HfnKMkp5M/joXikd3FwQ8rZzfWp9x3KHblOyBWK5dCWuFA?=
 =?us-ascii?Q?hxnn8MmWnjRlgRPiF5R5FuPuuENDWW7m26B4wcvjldoAdiB6/w/G7a6/yBB2?=
 =?us-ascii?Q?141us7JmE0+5kwbDulM3W3wAvk0URvQJUhUiO1UvXzKkgE+dmGnGvY83PopB?=
 =?us-ascii?Q?TuPPjsc5mRkjKttIkp/Hj8ySNpsgzYBksBJdTsTAHp4FycLPRWhmWeUBSz1J?=
 =?us-ascii?Q?WH2/z4aPsctb97BX41BLSj9OLraGfy7S50ZumuAEMzZeltJGhjt7diTUazhD?=
 =?us-ascii?Q?1WFfn3GndZQ8p1Jm0g6zFdSejHhQtWgOY8H2B/RdADsnOkuAAzbb5MZpg+31?=
 =?us-ascii?Q?k8IjwJiM6lvhVkS3xJblCwokJNwv4wp+0xF0Khw4Jg2HpJ0XtUtD272/Polz?=
 =?us-ascii?Q?lJRETDx0/I/qT8pVottU1Ptwep1ksHrSzT1m76fiMQFVQOmdEORqKnc73K/4?=
 =?us-ascii?Q?egjUwWPg/CTcJhZBYUw1wxs4dgiBm5ebKJ3mstlCMHzVg/oc/0tIW9a1XEC9?=
 =?us-ascii?Q?SE5+hPcooXZiHUyCRr3oR1y/B6WOC+zxAH6zY+XDnIlD0KxNSJurPlBhvbhP?=
 =?us-ascii?Q?H2EUZ1px7iZ6dG7iAkiIamhEMhOS5f4udgYvGc42jFT2v+x8vF2eKSJpEeQW?=
 =?us-ascii?Q?Mm8cDg+6u6SXassvZQk3K5emH8f59g5WWM8AckZ8rYPt6FcRKUMyS1/tIXwP?=
 =?us-ascii?Q?XVr7nKzPDTt3TyeTyTkIWNWQ8vvCT98xqIX4hlkhyskPmdR5vJlcKIKFYI+v?=
 =?us-ascii?Q?QsGmLZiQn+eB9W+N/Eocc48f/D19xJxWeAroJMHKVhDI9Tou+LDSa4Z8h28m?=
 =?us-ascii?Q?ceoHoZD0Nz52LjYigMZurXU4wrtkG41hqdnAswl7+w+WhsmmA79OUxp3x5DH?=
 =?us-ascii?Q?e2P0NqP/p5Au3+Q9Gb5KcbtD2Dp657e4hBKAG9oiN4F2g8aLfz4JvJjPlLkI?=
 =?us-ascii?Q?igBujuoegBbdv5l311e3Zr8M2DUSUWxsRLKDNJsBBpKbnF5vDcae4QfT0SI0?=
 =?us-ascii?Q?/JmN4wUtpNmDojfQ4DXJzKlarIlzpriMFJqso5CmKZ6xeQjxnROUPUj4fUDF?=
 =?us-ascii?Q?Ay2CpfC/XHyK/cpLWE3mA4csrKOJgjde8BVbRDa08G0dN86EaBGXdPm5Mx2h?=
 =?us-ascii?Q?Qc7LcRIZDcA6ZPLgHCl+Ybg7qt9eEkSMYCTmM/AvbEEZVRK60PxQw71xfDfz?=
 =?us-ascii?Q?oXgFuTv/AZqvt2SU7dc0hBrr4rYSWlr375kVDcs2Lqx6FvVPDCOGpHFdPOMi?=
 =?us-ascii?Q?WBVgqNf/mDWWFSgmon8rsrXW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BPiDwl7bhgTJkGaNYfVoLMxyxebD6Y5Gun7PmEc/p5lANb7iEkSrXG5/PlGG?=
 =?us-ascii?Q?M6/6F5XXy5ciacotIuW+A53D5O4dPKxzoobJwKZj3DG/o9xX+dngSGzRf+ZP?=
 =?us-ascii?Q?6oy4j+0ajmYiTNrbWf0iIFmnHniXZzsQj/fLPXoYO30PiYqobRy3XPP49SZT?=
 =?us-ascii?Q?b+p0JMYxhtCE5QbK4pYBDAm0RSvcfk1uif2fk4V//jrjNIaKADUFf3hGX90z?=
 =?us-ascii?Q?SlfK7NdApy+sMPXNL5pc00ffjQU3+nLE8pd389CBwcsDwc8C44RZjUjG4OFA?=
 =?us-ascii?Q?uFrfe/k/V0/RzGv4+IEz4zTQVrlIcC+E3eEXlow0D4wIs9BP9MTeF1WYJIRA?=
 =?us-ascii?Q?tn/9Ly+Y7u5ZU1pl9zF56qSzvpbfUm8cL6dlZgThpri7PLo6z+yr1yOsB5w6?=
 =?us-ascii?Q?nWjit6D1GXa/0DS0gprRQgJy6ecnMYpm3FklSf/mdjI4t6RL3FoCL5wSukXb?=
 =?us-ascii?Q?A8lN0zfh4N3zn0A4a7y/SFOOqAtDXbp8Ny3SHpwCWCU/eABwiw5f7ynE3G/N?=
 =?us-ascii?Q?YNQRSpIgJnHxARicjtvP7fEbCTJp0LiKVT/PBQUENSwTLQc0DW2RwRUVQ/vb?=
 =?us-ascii?Q?TBCW331tbdsORqLKLSYsYLyHZbR+M1yYLNax8oOA27CuuX9TpFLYsv7glh/0?=
 =?us-ascii?Q?VmOs4wJL8TrM+A8gURBI3BkTl88LlYIPnZnK8iJ4l8GS9v4d6cKDN5GVaD60?=
 =?us-ascii?Q?tCclEkFWKPN9gI3Zp4mRl5t/upbKIues8cKrGbbNadVO83fQupKDpK7xKA1h?=
 =?us-ascii?Q?4nBC3JSNOnj70uNMK5AIwsQMy5sjYLOoYEMOV+Wr6Hf1yLMCWdbAv90OBMJI?=
 =?us-ascii?Q?B3G5347nswA/eA7xpxlywPr6TcPdtMgqyoZ5ZLuIT/zEsVJ06MhvygldFI/a?=
 =?us-ascii?Q?5JU6TDm7Lx+AioLl4KfuMatdX1dj0fLqwexcDy3uhF942GcBfSQ5zg7RCz3p?=
 =?us-ascii?Q?E+Kcoi7rMOtnl4+6HW34VYmsmwDJr0t3aTDMm0ygUMWe4xa63yahOv2lxjTj?=
 =?us-ascii?Q?jRlYe2+57uqsMWrNwTOmIHxzy+KWDEJX/WjS7fvQNOA54s7PK/5ZYMj3/V4F?=
 =?us-ascii?Q?MzPkIT467fxRT200yMQRLUndvgCoYow20+Q09cw0twJyCblro6745Cpvdwht?=
 =?us-ascii?Q?0Hk0pHkxkKcBk3HSfl9vgJiKLbmbLVd3K6TqK+NtTwII9UHh1VF3L4lwiCjJ?=
 =?us-ascii?Q?DUBBjZgwTt5PinK36jUCoopJ9O6XOc6DJWxDet2c5/bN9WhhBKGqGL5FudB+?=
 =?us-ascii?Q?vpTn5UqtP6gkITYgnC8ffyryx1+36+0b4pgsO/2hxELsruVGvuL8ezcVCAfu?=
 =?us-ascii?Q?R7ElaYDfVRENxUpKhx23fWannL0oIeeFTxzWr+ys+q6YDCZSFYpuo77AzAGo?=
 =?us-ascii?Q?EA87BNhGNJ4dAbFZj3OMSoqvNgIMDzG4JJCmWhaOKT/vAgPwD6/Rwi+MOIWm?=
 =?us-ascii?Q?D+X5pqcZKP8xknJB2Hn2B5xhIyFgz5vBcT6NgN05pBIVV391WVhwnbeHCGAB?=
 =?us-ascii?Q?VTQEe+U2+dE0lCvUAUo90N3ggsWCzmWmfvrNJIgg7TK30ry5mx2oRMBb57Vl?=
 =?us-ascii?Q?C0itePaiCZffXtR1TKQJ3VCAxYY67c2t26rxNF++xVeFzF2vnX81nwhHgOtH?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EKiItP4s4l3RiPgQOHPcy+d8Ox3M5/cayJJZqtNitGRJ03Ix67eNB7D5i0szxxENy71Csw9WSRmevXQgNV50+z3fJp8/1VBjOwQXqlMSDFns9ujzDVN7WYZ9nqDZc1ZhsvwHzQsDnQsTpNmosnSXCDM8jCGzBY52Fj5JCJNq04J4qr590wZ29Yr1kwa1K7w7AtwpujcEEFy5YHtAQkkAV4DBBDtB8A5Jhwsb9+bnSPn6WVQ4TrbnSGBXUDoVhqAIv7CGtpFkHkPflLm12u9pnN4cbiv0SFGld7cDJfVbhNXkKAo8Td5a3sDZkF/HVCoaR37+CVEFHCH+Zzwfl3+bWWKvXhpqzIowRNicCdR8EOqwmKs/Po26UicaItfevjY4QnIL2Ogx687wmUg4sEpTk9+mSzgVlinkpOMjOPlusnYHOQAs4Y/eOlEwhS+vy5BCW8SaxYBGNU0hZeyGfYu4YbjIOJ/N52MQcrRZZHXMSmfQf5OhCzgb+K3mG9WA8KkGx5rMFdo4BnqSNVz0zXgDI4NcKjRykkc8EHRYr6FUATMTL8cn0jLARGvE8meBlNH8z10uNTktZzvrPTmBURGqCsGRSGPXBsUFhwXXSPGZ5SU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63900134-e71c-4dda-fc7c-08dd026a9f26
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 16:05:11.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxCza5wbh+sdMUhI9JgCMaoXV/ofiy5cMV7W5St9TyL4SBThWV++5tqz82vfkSlwapgBPVIUW4Uwt7qS+DxM7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4772
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_08,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411110131
X-Proofpoint-ORIG-GUID: QNhOphifiPrmIwl0fHLgfgyfPHUoqy4K
X-Proofpoint-GUID: QNhOphifiPrmIwl0fHLgfgyfPHUoqy4K

So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
this requires an explicit mount, and a great many installations have not
done this and perhaps never will.  So if the debugfs is mounted on
/sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
as it used to, as another tracefs mount.  And of course there's nothing
special about the "canonical location": it's up to the admin, who might
choose to remount the thing anywhere at all.

To make this even more fun, it's quite possible to end up with the tracefs
on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
(I got that during testing with no effort at all).

All this means that the existing DTrace hardwiring for tracefs/eventsfs
locations isn't good enough.  Instead, hunt for a suitable tracefs mount with
getmntent(), and add a function to open files under that directory, allowing
the path to be created using a printf-style format string (mimicking the
things we used to do with EVENTSFS defines and the like).  This is actually
all we need; there is no need to ever return these paths at all, so there
is no clogging up the code with free()s -- and actually there's a
noticeable simplification in most cases.

Tested with both in-practice-observed locations of debugfs, and the
obviously crazy and bad-in-a-format-string path of "/%s/%s/%n" to make sure
that is properly rejected.

Bug: https://github.com/oracle/dtrace-utils/issues/111
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 include/tracefs.h                             | 14 ----
 libdtrace/dt_error.c                          |  3 +-
 libdtrace/dt_impl.h                           |  3 +
 libdtrace/dt_open.c                           |  1 +
 libdtrace/dt_prov_dtrace.c                    | 27 +++----
 libdtrace/dt_prov_fbt.c                       | 37 ++++-----
 libdtrace/dt_prov_rawtp.c                     |  9 ++-
 libdtrace/dt_prov_sdt.c                       | 34 +++++---
 libdtrace/dt_prov_syscall.c                   | 31 +++----
 libdtrace/dt_prov_uprobe.c                    | 42 +++++-----
 libdtrace/dt_provider.h                       |  1 -
 libdtrace/dt_subr.c                           | 80 +++++++++++++++++++
 runtest.sh                                    |  8 ++
 test/unittest/funcs/tst.rw_.x                 |  7 +-
 test/unittest/providers/tst.dtrace_cleanup.sh |  9 ++-
 test/utils/clean_probes.sh                    | 12 ++-
 16 files changed, 207 insertions(+), 111 deletions(-)
 delete mode 100644 include/tracefs.h

diff --git a/include/tracefs.h b/include/tracefs.h
deleted file mode 100644
index d671f51adefc..000000000000
--- a/include/tracefs.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * Oracle Linux DTrace; simple uprobe helper functions
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#ifndef	_TRACEFS_H
-#define	_TRACEFS_H
-
-#define TRACEFS		"/sys/kernel/debug/tracing/"
-#define EVENTSFS	TRACEFS "events/"
-
-#endif /* _TRACEFS_H */
diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
index 213f0d9e1385..9c4a2b32888e 100644
--- a/libdtrace/dt_error.c
+++ b/libdtrace/dt_error.c
@@ -98,7 +98,8 @@ static const struct {
 	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
 	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
 	{ EDT_PCAP, "Missing or corrupt pcap() record" },
-	{ EDT_PRINT, "Missing or corrupt print() record" }
+	{ EDT_PRINT, "Missing or corrupt print() record" },
+	{ EDT_TRACEFS, "Cannot find tracefs" }
 };
 
 static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec53c06..950cb34819aa 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -354,6 +354,7 @@ struct dtrace_hdl {
 	char *dt_module_path;	/* pathname of kernel module root */
 	dt_version_t dt_kernver;/* kernel version, used in the libpath */
 	char *dt_dofstash_path;	/* Path to the DOF stash.  */
+	char *dt_tracefs_path;	/* Path to tracefs.  */
 	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
 	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
 	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
@@ -643,6 +644,7 @@ enum {
 	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
 	EDT_PCAP,		/* missing or corrupt pcap() record */
 	EDT_PRINT,		/* missing or corrupt print() record */
+	EDT_TRACEFS,		/* cannot find tracefs */
 };
 
 /*
@@ -713,6 +715,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
 
 extern int dt_gmatch(const char *, const char *);
 extern char *dt_basename(char *);
+extern int dt_tracefs_open(dtrace_hdl_t *, const char *fn, int flags, ...);
 
 extern ulong_t dt_popc(ulong_t);
 extern ulong_t dt_popcb(const ulong_t *, ulong_t);
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index e1972aa821e7..775830f64492 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1317,6 +1317,7 @@ dtrace_close(dtrace_hdl_t *dtp)
 	free(dtp->dt_cpp_argv);
 	free(dtp->dt_cpp_path);
 	free(dtp->dt_ld_path);
+	free(dtp->dt_tracefs_path);
 	free(dtp->dt_sysslice);
 	free(dtp->dt_dofstash_path);
 
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 34b5d8e2467f..670954beb4c9 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -23,8 +23,6 @@ static const char		funname[] = "";
 
 #define PROBE_FUNC_SUFFIX	"_probe"
 
-#define UPROBE_EVENTS		TRACEFS "uprobe_events"
-
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -229,11 +227,9 @@ out:
 static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*spec;
-		char	*fn;
-		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		char		*spec;
+		FILE		*f;
+		int		fd = -1, rc = -1;
 
 		/* get a uprobe specification for this probe */
 		spec = uprobe_spec(getpid(), prp->desc->prb);
@@ -241,7 +237,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* add a uprobe */
-		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
+		fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
+
 		if (fd != -1) {
 			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
 				     GROUP_DATA, prp->desc->prb, spec);
@@ -252,16 +249,12 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* open format file */
-		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
-			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		fd = dt_tracefs_open(dtp, "events/" GROUP_FMT "/%s/format",
+				     O_RDONLY, GROUP_DATA, prp->desc->prb);
+		if (fd < 0)
 			return -ENOENT;
 
-		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
-			 EVENTSFS, GROUP_DATA, prp->desc->prb);
-		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		f = fdopen(fd, "r");
 		if (f == NULL)
 			return -ENOENT;
 
@@ -296,7 +289,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 
 	dt_tp_probe_detach(dtp, prp);
 
-	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
+	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
 	if (fd == -1)
 		return;
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddffc73..e20d0283d956 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -43,8 +43,8 @@
 static const char		prvname[] = "fbt";
 static const char		modname[] = "vmlinux";
 
-#define KPROBE_EVENTS		TRACEFS "kprobe_events"
-#define PROBE_LIST		TRACEFS "available_filter_functions"
+#define KPROBE_EVENTS		"kprobe_events"
+#define PROBE_LIST		"available_filter_functions"
 
 #define FBT_GROUP_FMT		GROUP_FMT "_%s"
 #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
@@ -65,6 +65,7 @@ static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t		*prv;
 	dt_provimpl_t		*impl;
+	int			fd;
 	FILE			*f;
 	char			*buf = NULL;
 	char			*p;
@@ -79,7 +80,11 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+        f = fdopen(fd, "r");
 	if (f == NULL)
 		return 0;
 
@@ -363,16 +368,14 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
 	if (!dt_tp_probe_has_info(prp)) {
-		char	*fn;
-		FILE	*f;
-		size_t	len;
-		int	fd, rc = -1;
+		FILE		*f;
+		int		fd, rc = -1;
 
 		/*
 		 * Register the kprobe with the tracing subsystem.  This will
 		 * create a tracepoint event.
 		 */
-		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+		fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
 		if (fd == -1)
 			return -ENOENT;
 
@@ -383,19 +386,13 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (rc == -1)
 			return -ENOENT;
 
-		/* create format file name */
-		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
-			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		/* open format file */
+		fd = dt_tracefs_open(dtp, "events/" FBT_GROUP_FMT "/%s/format",
+				     O_RDONLY, FBT_GROUP_DATA, prp->desc->fun);
+		if (fd < 0)
 			return -ENOENT;
 
-		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
-			 FBT_GROUP_DATA, prp->desc->fun);
-
-		/* open format file */
-		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		f = fdopen(fd, "r");
 		if (f == NULL)
 			return -ENOENT;
 
@@ -431,7 +428,7 @@ static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
 
 	dt_tp_probe_detach(dtp, prp);
 
-	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+	fd = dt_tracefs_open(dtp, KPROBE_EVENTS, O_WRONLY | O_APPEND);
 	if (fd == -1)
 		return;
 
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 778a6f9cde90..c6b3c7947b3c 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -38,7 +38,7 @@
 static const char		prvname[] = "rawtp";
 static const char		modname[] = "vmlinux";
 
-#define PROBE_LIST		TRACEFS "available_events"
+#define PROBE_LIST		"available_events"
 
 #define KPROBES			"kprobes"
 #define SYSCALLS		"syscalls"
@@ -64,6 +64,7 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
+	int		fd;
 	FILE		*f;
 	char		*buf = NULL;
 	char		*p;
@@ -73,7 +74,11 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+        f = fdopen(fd, "r");
 	if (f == NULL)
 		return 0;
 
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 675e0458ca4c..2c07707e04b4 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -36,7 +36,7 @@
 static const char		prvname[] = "sdt";
 static const char		modname[] = "vmlinux";
 
-#define PROBE_LIST		TRACEFS "available_events"
+#define PROBE_LIST		"available_events"
 
 #define KPROBES			"kprobes"
 #define SYSCALLS		"syscalls"
@@ -62,7 +62,8 @@ static const dtrace_pattr_t	pattr = {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
-	FILE		*f;
+	int		fd;
+        FILE		*f;
 	char		*buf = NULL;
 	char		*p;
 	size_t		n;
@@ -71,7 +72,11 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	f = fdopen(fd, "r");
 	if (f == NULL)
 		return 0;
 
@@ -192,16 +197,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 			      int *argcp, dt_argdesc_t **argvp)
 {
+	int				fd;
 	FILE				*f;
-	char				*fn;
 	int				rc;
 	const dtrace_probedesc_t	*pdp = prp->desc;
 
-	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
-		return dt_set_errno(dtp, EDT_NOMEM);
+	fd = dt_tracefs_open(dtp, "events/%s/%s/format", O_RDONLY, pdp->mod, pdp->prb);
+	if (fd < 0)
+		return -ENOENT;
 
-	f = fopen(fn, "r");
-	free(fn);
+	f = fdopen(fd, "r");
 	if (!f)
 		return -ENOENT;
 
@@ -223,15 +228,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	int			argc = 0;
 	dt_argdesc_t		*argv = NULL;
 	dtrace_typeinfo_t	sym;
-	FILE			*f;
+	int			fd;
+        FILE			*f;
 	uint32_t		id;
 
 	/* Retrieve the event id. */
-	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
-		return dt_set_errno(dtp, EDT_NOMEM);
 
-	f = fopen(str, "r");
-	free(str);
+	fd = dt_tracefs_open(dtp, "events/%s/%s/id", O_RDONLY,
+			     prp->desc->mod, prp->desc->prb);
+	if (fd < 0)
+		return dt_set_errno(dtp, EDT_ENABLING_ERR);
+
+	f = fdopen(fd, "r");
 	if (!f)
 		return dt_set_errno(dtp, EDT_ENABLING_ERR);
 
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 20843c6f538e..3f816a0d6ba1 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -38,7 +38,7 @@
 static const char		prvname[] = "syscall";
 static const char		modname[] = "vmlinux";
 
-#define SYSCALLSFS		EVENTSFS "syscalls/"
+#define SYSCALLSFS		"events/syscalls/"
 
 /*
  * We need to skip over an extra field: __syscall_nr.
@@ -61,7 +61,7 @@ struct syscall_data {
 
 #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
 
-#define PROBE_LIST	TRACEFS "available_events"
+#define PROBE_LIST	"available_events"
 
 #define PROV_PREFIX	"syscalls:"
 #define ENTRY_PREFIX	"sys_enter_"
@@ -71,7 +71,8 @@ struct syscall_data {
 static int populate(dtrace_hdl_t *dtp)
 {
 	dt_provider_t	*prv;
-	FILE		*f;
+	int		fd;
+        FILE		*f;
 	char		*buf = NULL;
 	size_t		n;
 
@@ -79,8 +80,12 @@ static int populate(dtrace_hdl_t *dtp)
 	if (prv == NULL)
 		return -1;			/* errno already set */
 
-	f = fopen(PROBE_LIST, "r");
-	if (f == NULL)
+	fd = dt_tracefs_open(dtp, PROBE_LIST, O_RDONLY);
+	if (fd < 0)
+		return 0;
+
+	f = fdopen(fd, "r");
+        if (f == NULL)
 		return 0;
 
 	while (getline(&buf, &n, f) >= 0) {
@@ -195,23 +200,21 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
+	int		fd;
 	FILE		*f;
-	char		fn[256];
 	int		rc;
 
 	/*
 	 * We know that the probe name is either "entry" or "return", so we can
 	 * just check the first character.
 	 */
-	strcpy(fn, SYSCALLSFS);
-	if (prp->desc->prb[0] == 'e')
-		strcat(fn, "sys_enter_");
-	else
-		strcat(fn, "sys_exit_");
-	strcat(fn, prp->desc->fun);
-	strcat(fn, "/format");
+	fd = dt_tracefs_open(dtp, SYSCALLSFS "/sys_%s_%s/format", O_RDONLY,
+			     (prp->desc->prb[0] == 'e') ? "enter" : "exit",
+			     prp->desc->fun);
+	if (fd < 0)
+		return -ENOENT;
 
-	f = fopen(fn, "r");
+        f = fdopen(fd, "r");
 	if (!f)
 		return -ENOENT;
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 205014617586..4bd834276912 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1116,13 +1116,13 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
  * uprobe may be a uretprobe.  Return the probe's name as
  * a new dynamically-allocated string, or NULL on error.
  */
-static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
-			   uint64_t addr, int flags)
+static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
+			   const char *mapping_fn, uint64_t addr, int flags)
 {
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
-	char	*spec;
+	int		fd = -1;
+	int		rc = -1;
+	char		*name;
+	char		*spec;
 
 	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
 		return NULL;
@@ -1132,8 +1132,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
 		goto out;
 
 	/* Add the uprobe. */
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
-	if (fd == -1)
+	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
+	if (fd < 0)
 		goto out;
 
 	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
@@ -1153,8 +1153,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 {
 	dt_uprobe_t	*upp = uprp->prv_data;
 	tp_probe_t	*tpp = upp->tp;
+	int		fd;
 	FILE		*f;
-	char		*fn;
 	char		*prb = NULL;
 	int		rc = -1;
 
@@ -1163,7 +1163,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 
 	assert(upp->fn != NULL);
 
-	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
+	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
 			    upp->flags);
 
 	/*
@@ -1177,12 +1177,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 				  upp->flags);
 
 	/* open format file */
-	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
-	free(prb);
-	if (rc < 0)
+	fd = dt_tracefs_open(dtp, "events/%s/format", O_RDONLY, prb);
+	if (fd < 0)
 		return -ENOENT;
-	f = fopen(fn, "r");
-	free(fn);
+
+	f = fdopen(fd, "r");
 	if (f == NULL)
 		return -ENOENT;
 
@@ -1251,21 +1250,20 @@ done:
  * Destroy a uprobe for a given device and address.
  */
 static int
-uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
+uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
 {
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
+	int		fd = -1;
+	int		rc = -1;
+	char		*name;
 
 	name = uprobe_name(dev, ino, addr, flags);
 	if (!name)
 		goto out;
 
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
+	fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);
 	if (fd == -1)
 		goto out;
 
-
 	rc = dprintf(fd, "-:%s\n", name);
 
 out:
@@ -1297,7 +1295,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
 
 	dt_tp_detach(dtp, tpp);
 
-	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
+	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
 }
 
 /*
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 8f143dceaed7..4598a380b950 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -12,7 +12,6 @@
 #include <dt_impl.h>
 #include <dt_ident.h>
 #include <dt_list.h>
-#include <tracefs.h>
 
 #ifdef	__cplusplus
 extern "C" {
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index d5dca164861e..9887c4fc5ffa 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -20,6 +20,7 @@
 #include <assert.h>
 #include <limits.h>
 #include <sys/ioctl.h>
+#include <mntent.h>
 #include <port.h>
 
 #include <dt_impl.h>
@@ -998,3 +999,82 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
 
 	return hval;
 }
+
+/*
+ * Find the tracefs and store it away in dtp.
+ */
+static int
+find_tracefs_path(dtrace_hdl_t *dtp)
+{
+	FILE *mounts;
+	struct mntent *mnt;
+
+	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
+		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
+		return dt_set_errno(dtp, EDT_TRACEFS);
+	}
+
+	while ((mnt = getmntent(mounts)) != NULL) {
+		/*
+		 * Only accept tracefs paths that do not contain percent
+		 * characters in their mounted paths, since we use this
+		 * to augment a format string in dt_tracefs_vfn().
+		 */
+		if ((strcmp(mnt->mnt_type, "tracefs") == 0) &&
+		    (strchr(mnt->mnt_dir, '%') == NULL)) {
+			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
+			break;
+		}
+	}
+	endmntent(mounts);
+
+	if (!dtp->dt_tracefs_path) {
+		dt_dprintf("Cannot find a suitable tracefs path.\n");
+		return dt_set_errno(dtp, EDT_TRACEFS);
+	}
+
+	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
+
+	return 0;
+}
+
+static char *
+dt_tracefs_vfn(dtrace_hdl_t *dtp, const char *fn, va_list ap)
+{
+	char *full_fn;
+	char *str;
+
+        if (!dtp->dt_tracefs_path)
+		if (find_tracefs_path(dtp) < 0)
+			return NULL;		/* errno is set for us. */
+
+	if (asprintf(&full_fn, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
+		dt_set_errno(dtp, EDT_NOMEM);
+		return NULL;
+	}
+
+        if (vasprintf(&str, full_fn, ap) < 0) {
+		str = NULL;
+		dt_set_errno(dtp, EDT_NOMEM);
+	}
+	free(full_fn);
+	return str;
+}
+
+int
+dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, int flags, ...)
+{
+	va_list ap;
+	char *str;
+	int fd;
+
+	va_start(ap, flags);
+	if ((str = dt_tracefs_vfn(dtp, fn, ap)) == NULL) {
+		va_end(ap);
+		return -1; 			/* errno is set for us. */
+	}
+
+	fd = open(str, flags, 0666);
+	free(str);
+	return fd;				/* errno is set for us. */
+}
diff --git a/runtest.sh b/runtest.sh
index 46b532d7e161..fbf4e60c82a9 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -607,6 +607,14 @@ elif ! /usr/bin/cpp -x c -fno-show-column - /dev/null < /dev/null 2>&1 | \
     export DTRACE_OPT_CPPARGS="-fno-show-column"
 fi
 
+# Find the tracefs.
+tracefs="$(awk '$3 == "tracefs" { print $2; exit; }' /proc/mounts)"
+if [[ -z $tracefs ]]; then
+    echo "Cannot find any tracefs mounts in /proc/mounts.  Some tests will fail." >&2
+fi
+
+export tracefs
+
 # More than one dtrace tree -> run tests for all dtraces, and verify identical
 # intermediate code is produced by each dtrace.
 
diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
index 29c581116154..06e1f0b3c3eb 100755
--- a/test/unittest/funcs/tst.rw_.x
+++ b/test/unittest/funcs/tst.rw_.x
@@ -1,6 +1,11 @@
 #!/bin/sh
 
-FUNCS=/sys/kernel/debug/tracing/available_filter_functions
+if [[ ! -e $tracefs/available_filter_functions ]]; then
+	echo no tracefs found
+	exit 1
+fi
+
+FUNCS=${tracefs}/available_filter_functions
 
 if ! grep -qw  _raw_read_lock $FUNCS; then
         echo no _raw_read_lock FBT probe due to kernel config
diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
index 4ac59ccb4315..69e3ab369caf 100755
--- a/test/unittest/providers/tst.dtrace_cleanup.sh
+++ b/test/unittest/providers/tst.dtrace_cleanup.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -14,7 +14,12 @@
 ##
 
 dtrace=$1
-UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
+if [[ ! -e $tracefs/uprobe_events ]]; then
+	echo "no tracefs/uprobe_events" >&2
+	exit 67
+fi
+
+UPROBE_EVENTS=${tracefs}/uprobe_events
 
 out=/tmp/output.$$
 $dtrace $dt_flags -n BEGIN,END &>> $out &
diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
index 8292b3096424..8372e8a26da7 100755
--- a/test/utils/clean_probes.sh
+++ b/test/utils/clean_probes.sh
@@ -1,9 +1,13 @@
 #!/usr/bin/bash
 
-TRACEFS=/sys/kernel/debug/tracing
-EVENTS=${TRACEFS}/available_events
-KPROBES=${TRACEFS}/kprobe_events
-UPROBES=${TRACEFS}/uprobe_events
+# We can't work without the tracefs: just give up quietly.
+if [[ ! -e $tracefs/available_events ]]; then
+    exit 0
+fi
+
+EVENTS=${tracefs}/available_events
+KPROBES=${tracefs}/kprobe_events
+UPROBES=${tracefs}/uprobe_events
 
 # Check permissions
 if [[ ! -r ${EVENTS} ]]; then
-- 
2.46.0.278.g36e3a12567

