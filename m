Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20372E8895
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755019407; cv=fail; b=lvL/Je3Z8+ZLQorhieX0tQ/A9QgCT9JpLORlD1ENjC2vXmlmXcsMQfYHoRhCOTUnJImHBFXMNmPTI+FrTlkgDNfcCh8bOApQe05R8q3QRCnxdpQyFvhPP6aeeX+p7n1WfSFSEUfs3fJPj1TuJjD6XQTtiIin2ggwpaVKtsb8Q0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755019407; c=relaxed/simple;
	bh=saYeJBYhQkpw2RmGa6HVnFNHs/YNqijIo4qWH69xjbo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i/qLjAwzm2B3YK9X2fr+q8G3Hb345ye95wDajXAJ2hyInuy1/Ox+OIYKNWfWXCe/6hd6JGlg+edx9m7Hj9UR/0D5J9uwC9W3jT6Q+3d1oUBUQZxFaCBJYBhinKVTF5LL75vljPwELRRndqkqe07v3iUgcvL2rq3mmDMrk7r3qdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=opy86Vji; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l2TEoyZ8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="opy86Vji";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l2TEoyZ8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDC4Rw021962
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=8ldRl7nem3mb87mJS6ckix0ZPPpzHnf21hHimuGnJ8A=; b=
	opy86Vji6nQpo58yGfnidfcYjow9KN0yONSsbn7BKMRO9LqzfYtRzW2m4WzETGyz
	0fGQJVITx3i3ApxzhAjbLU0qPFW5tiubjaOXFUoUdiiJPqxSwp1r3LtMmxw5oFWK
	z7PDXlm+C3iMkCBhttyHrhg1DuHAga+63b2oXJlHWJ9GD59sVnw6zwFcbDMWh0KC
	0NfuZqc9PidwHa16eAm82tpwOoOKSGzFpZlHw6NNaLp62SZq9YskLsBzotSWXyLv
	fCx4kczoSzWTED10zFXNA7uDkNS+NvHTC79lltMlMBh9yStwoQPyYhNZIcSyyTUc
	rzpqCOp14VJCQnwVyQgt5g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4d87p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:23:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CGlXd9010466
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:23:23 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsgjhy7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 17:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdCTWU7dgY7JpILBVKUsnzjoWY1n+oP8yaPA2j2WzrK/s+7Wsm04q44BEusHAKMcJ2dT9a93mPo/4kUnGXx7/4uzZrkiuV6BQXgieXbOPc9ha05qpbOD7upmTMH4ZVNE0+AVWirVq853ROGWotl6fXZjZCd7L/hXlOhLNrrOYCZJZYwzsKLAaFn+op2svsGiKREmM6Nb1KEDEO+fYZKRxyCX2lFnwlv8vUNqnuZp76HK5sZdasaWpDbEe/SJFRFWiNG1cYE2Kw0g0fRbUMH7DTAtVbolir1K/GZdlC5ESJA/aXQvFet8KeWRInnb0UHhAXCTeSY813lLeNCsEukIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ldRl7nem3mb87mJS6ckix0ZPPpzHnf21hHimuGnJ8A=;
 b=MgbVWYC7eONK9WqARImIXHFF0WNbblk0B/Jj8aZ0XwqoT1NgiLLT1hSG0KiWxAcuFtf16wMrD/IIMC4/hiRNd24eUpaQ6sQHAxFw0YscZ7d75wKrWHR/kyf1QlHrSjf4pd+wco9iBldbD5+PHlmu9ZpNMD5+t2d9BElXDRxZ5CcnWZK6ruqmmiCzHBA9Z/rSW+cUeUGZIODajG6+duKCBeLr1dS14zNaU/xYRxYfnfq1oSX/RYpAKRYere2g5C7zzqHFDP5gwBBEdpTUX4aHkionbOmfaW5TDaXF2t0+aYb3DI9W9vWYf26YcoKEAF0VXEgcgs4okZsBHYDfvR7P+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ldRl7nem3mb87mJS6ckix0ZPPpzHnf21hHimuGnJ8A=;
 b=l2TEoyZ8V3YCIasYuNl0iNEfSSIPYvURnHyAJkQO9lSztU9kh5M+1KjkEtMqvDvSenwhuvTE5B1Bi54/u3r4RGqphJhMLh9e9NxYX4dy/bpKcSzn9EH1acf1odMfJF0GkhdhsiRp2W3V9PmAtDqV5EJoOAlcVBOW/OXrVgvb2us=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH7PR10MB6082.namprd10.prod.outlook.com (2603:10b6:510:1fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 17:23:10 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 17:23:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Pad strings in the output buffer with NUL bytes after terminating byte
Date: Tue, 12 Aug 2025 13:23:05 -0400
Message-Id: <20250812172305.12727-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:208:52f::19) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH7PR10MB6082:EE_
X-MS-Office365-Filtering-Correlation-Id: 085da576-fbe4-4ffb-4ccd-08ddd9c4e8bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?l1N5hby+IVUNoDtrqvpzD2C+RY7ukJszr1qFAtgA6KOnMAajddzmSk4XZgUr?=
 =?us-ascii?Q?nDaBP64ywf5uqGAQ2fzbx3OQUDoMuv4PXKHlRhdRJ+PU5jQ7hufVo/xN6y/b?=
 =?us-ascii?Q?Npx/DlfnipSgZQ8rj4GDhSWCxsn2yyK1EVgOunt0u+hN8SCHTjEw5PSKZkgM?=
 =?us-ascii?Q?AYAW/bjIaY2EXxBSiWxorthhRW1r8vnQyG1u5o5OW35lfAjyCZUWACv9dVnE?=
 =?us-ascii?Q?2JoTL9SJMSu+cm+gmwzTu8we3rILe2FRzE/MfUiJXUWGjzXrvT+xuu4PtcVd?=
 =?us-ascii?Q?MNMWjBO067hF+/niIm0u0Lq7I9byKuOQpBZrdpNpKHmVEBnrunJtjko3l2nw?=
 =?us-ascii?Q?rN+MwBXqDIIo8hOnShMfJdnaQix2q8SQDQXSYV0IVYRtkPjav7a3yRvK6I1m?=
 =?us-ascii?Q?nCfa/Vrpckgk8XtlI5N1bra4VsYVbK+obnytJSnbsk45784VDPN04CcwlHDd?=
 =?us-ascii?Q?sbp8hEE/uhEiNP2BtUMuvWNdDGNAsL8qW3j7aQeA54jH9ohjyYQuUNYfUUFY?=
 =?us-ascii?Q?HcEjJl6FTXMLFKVg+klFUWjgRjOQUaHN/yG1Q7fqgNv4XICWweOg3ATj4KgN?=
 =?us-ascii?Q?Vq+D32hOw3P08pYPfMBKuaIWFlDmyJM5SwODnnuPkuEBaBi1LuONmfoz7kVw?=
 =?us-ascii?Q?3zPdPxaaw426GFM1MeHQ+wA45D6twqZDOPx9frAl5p1jo0WulrcDGoQgPzEL?=
 =?us-ascii?Q?yCyRJd1JmahbOrebgLi/xLQwi5TRmc9mO7Ll6kqIyLT6pkFleva5Vwpr/eAt?=
 =?us-ascii?Q?yT1EaUJ0TfuYRtnLcAFKVrI7tp7gezqOMG3CHQ5vZcOndUecW3vYAobsKheu?=
 =?us-ascii?Q?bX5d4vTwnrBUncR/lwBkd/yoMTbXHFoOhYxIxhceMH5fGfuHjTmh6GofXBpv?=
 =?us-ascii?Q?yxIS5qdksYBMt27g/2ia4rhxscM2qOqrJipIV9+LwW4Uk8ctv/0z/okckYib?=
 =?us-ascii?Q?uBjJbyGHx8pTO4PaOWLLk8L/isfTg9F1EeH9s8NVQLMeqrg3x0qvEnZ1gias?=
 =?us-ascii?Q?Xbfzu4n6vvW8QdyTbaWrtwpkA0aGPl18ZG+ShyaeEA364rM2QhwaC3TfHEJ2?=
 =?us-ascii?Q?mGD0VdVeU3nkjALnec05wJNvWUfBXghLYdW60hzhGiEXPTKxOQz7UqstGONy?=
 =?us-ascii?Q?/gtMH/ncNKhkY3dctI/qpQWYzNYQk86O5fQvPglfsRTcmKAadGqjLi00e87I?=
 =?us-ascii?Q?tmDxZg7JWEUGzCKzj2049OU2OTI5TAfCkFbKgmFVBpGVjFZt57JPzWS0n3+6?=
 =?us-ascii?Q?YuNR7QXNIiRlclRy5MdpH+8eSJaWRyrpu1SJkhmfMJcmtxoJ84P3wVY5Igo7?=
 =?us-ascii?Q?pdoeJjJzrWcRIP8r5eEhqLldeUrRZm0qjh1h7hVR45LVwecViwnkojTaWnbL?=
 =?us-ascii?Q?uUNTDLBvNdyU3rCmcGrIh7XNslioBSf7r4wcDCY0fEePPF7aJTrD1pkpKv8O?=
 =?us-ascii?Q?roRP8WshyzM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?J0TFt2D0QtAqbRfIMQSPB9mL900yjSd43sEijp/MZlOr3aINt4q3J1BJMr/T?=
 =?us-ascii?Q?S8Nj+rNxyJjy9eR6MG/j/BLcN7f6eTM40qKr4JVZf93sa13lR29bCSmRz0QM?=
 =?us-ascii?Q?j/LX6z+y1eDhm9rR8B+lRZ3GKRTL7KhikThrlgy8wW8a9GQmRN2Fo49bJRmG?=
 =?us-ascii?Q?CQ0xglxX/5QDDy0yECOelx/FOHjlS4os9OJ9ZXAXdq8TnhogW2KDEu+0ljqC?=
 =?us-ascii?Q?Beq2xHRQIQICVuR1LJkVzFJLPbh/4Gn0PoOF2RGyQKiCdQ+6C8fCgBVDFNHe?=
 =?us-ascii?Q?ShBJZalEkAgHN2wO/FEaWGKG/ctSowtqpJFlzrXEn/BJ9hvnWAllrg3iDS15?=
 =?us-ascii?Q?umEtP8oO9PZzo3pXTcZrtgELhZYYTsS/vMD+Lrjk0ZHW/m+3hbGC9cJkrx96?=
 =?us-ascii?Q?M1H1UHgmJ/nHepY2KW7tNhZ6Ukp8B7y0x1V5hl80hI28v4HB2+AuC9rtAiRr?=
 =?us-ascii?Q?3ejdmlSWkd426ynbYG4BnVx4C2GVqo7bj0xmgrMrl3bSb27g2vpvWBchFW2D?=
 =?us-ascii?Q?ZkFjzbYaTZu4F+ckXF9wpZpBapitphN9iu4U8osNNaHUGKo5kyvHmDDigZw6?=
 =?us-ascii?Q?CMwWe2xJ3Gr4dYyn1T6IhFQg2tmRQPtJPZAZdyfNNsddHqcfDzEBYVD3I93Q?=
 =?us-ascii?Q?fc3Tl1sgV+4iArB0PHly8RBBa/gPBKFee/JPjmoYq0Hrewvsbx1aoS8ku3Qi?=
 =?us-ascii?Q?YbtIAI/piDIN/75RMC8IW6SmenB+mqS07k/j9TpVphIakETMMDlfPr7GsaFz?=
 =?us-ascii?Q?8f7loFJfOTKzuWoEnqQoyDk3uTT1TpMZsaIvNzcrh1ZGdytLDiJ3HdOWM/km?=
 =?us-ascii?Q?TAmgftPtyQgV+1yjxIHV1L4C8lnGNOl7mxA9oi636Vc5UvnUoFmwOvZFsHv2?=
 =?us-ascii?Q?JzL5OMmlKrjAEgqli5ZRBKUq6HfQvrpzDU9npjydjpIkxXd6TvmPd4pcUgoK?=
 =?us-ascii?Q?2sBxOUsXo8OJFzLh9iyFaCyU7it9kBNoFOaEDk0cn0EzPwo14YHrAoVBp9vd?=
 =?us-ascii?Q?633ITu8ZNKGYa2oDJPBjNVvqYcizfgTpsa5wnR7TU0ryzChEi/XQhmAD3z6S?=
 =?us-ascii?Q?8dQ8kxmDHFy1pky8bi3+icIqo/RudRY4uSRHuQpASKk8m9niNFyT3oOLOWIr?=
 =?us-ascii?Q?A1tgk3l+XVg4ZB+KSaxDunwJv1RDCDh103Anf9ApB13oKUAQ5kuA8iZuSrwI?=
 =?us-ascii?Q?E99AzjiuaNiO5s3xEzbB+4Ce2iutY5k6dqx4GTH/8/R3CDq0cdmC3dgyMUia?=
 =?us-ascii?Q?WnCKVPKLn4AqBWGhCnZU0JIFNvsYeD5PVBuxvP60Y/8rB3Ah70xcCWlvxLz+?=
 =?us-ascii?Q?8YNWOoNqM8BEekr5kc4S0bSz1aiddh/exeMEMw7WOhcN8+aNyI5UA48K1zKK?=
 =?us-ascii?Q?3Plr5s+QaRF7ZacnYZkj/AWhScvfMMrTUwnRVrlr3fRcCk5U2aA3UkLpQwvN?=
 =?us-ascii?Q?l2CnNwtM4EeIERqCO277n9Po2COYWurB9Oxv/1UUkjBxznYeBRxoUyPSR5ix?=
 =?us-ascii?Q?DplWzmV/HuKhvzWHwXWjMFFCxySfnRyytSUpuhKB7pzyu5ai3+AIN8TCmi7D?=
 =?us-ascii?Q?pgm7M9d9UhAmhym/IyO5FsImV+G/g9I7y6t9CZug?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 JlZIzN/38NGc6g08Z2mK28p0Fif6SuOeb1c70Yx5+o94k+zn29+PblbjuNQo5ktByBwcjThx25sJhO+8cdpGta2HpRdF8TufEL99LGFaeBZWFOaBpMMFFQ9feTZlpfeTB02rOTPqrHwyF2Sdq3Pjg33Ckg3pS7LQIn9hMpRcn7rP00yzQWebi/GKX6ur7/4fJcklhM0AgMwJF1NotjJuu5BwfvqlXtg1I0uTLtnI5RF6sH4I9T8+qnOxuga9EGJBVDRqyV+duEdD92hA6CYXBWePg/CpzLcM1WHCJuU+8sk24GitsAQh4O2RsEo7xEQRifhdZ0Ul8wTy+Tncy1IrCV4mHRYWL0beXny6yeJGauSuPXsp0kQV/BJMYwqTU5YNPbMYACroXhJcH1jTdFnqKCGTh05mvX7grBvcW5o5FVLVEwL4EoBurOizGf1kT6zszrhkkF4uePH4C8/B2v0BM8N8i8BpQNzms7veOKInMzQTSP/FNaC4eOpF70FeeEZOJKrgX22+eBTxmywnv65aupfwG8rKem4IleS29W9MfHYPsyfX4x4oa5b+d/Tiz9ooLi+JDRI1cXofkzFr1186tJjMTwZ7NCSahih+z8F13Iw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 085da576-fbe4-4ffb-4ccd-08ddd9c4e8bb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:23:10.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oi6CM5VReQf6uzczk2/svg2jNHvagEfhyC9UrlT20Zyp7fHU34CaNZuU8ErqA7pLPbR2PLzhGkoVFvaCvjUBhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6082
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508120167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NiBTYWx0ZWRfXxoojA2U5MBIS
 vduRuG0NOeZcu5+me+oXZyqtXiVKzkWguQfZHsGQeEbVQFUZX0+cNbBqeQ0dDRolciakWVza/Dh
 kqlEnbgL90/4sDKKnqW3Ze1ud61BMrA9JPccPR/z8AhUkI27YgwOWd0Fxs1bLYBEzWLWLzqd234
 elK6XffAWOyo+JXUK1m4af49L8qmcKtp/rLrbfW/yiJSkJVuCCb0tfxbUBMEAnZBrttU5pJy118
 wh3QDRFa0g3JJBTq5c2dHy3Hg3/IEsYjshQYiybkMiyIYKcO63ZFXG1V0e6AzdwnlkboH2iZrGY
 HJEQyX5xq7CkpGY5wigJxwwUajQz6XvAvS8poB/gZTU1xnmrirg6UWejiMtJD0SL5mtBtLsigHk
 kC5LPWPkIv6H5kocDHqb+wVrO1ABYcJ1hkBUnW4yAnxsGjYtD/mNGJhI6QlGnsxZj8QVlnjN
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689b788c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=MmOJmHIWgf7B3vxi4IIA:9 cc=ntf
 awl=host:12069
X-Proofpoint-GUID: PxmJp9apfzw97WvJMnK_ghmZc0AcNVmK
X-Proofpoint-ORIG-GUID: PxmJp9apfzw97WvJMnK_ghmZc0AcNVmK

From: Eugene Loh <eugene.loh@oracle.com>

The consumer checks if there are non-NUL bytes after the terminating
NUL byte to decide whether to print the contents of the output buffer
as a string or as raw bytes.  So, for strings, make sure that the
string is padded with NUL bytes.

A robust test that shows the problem can be hard to devise.  Some tests
encounter the problem.  This patch adds another test that might show
the problem.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c                      | 46 ++++++++++++++++++--------
 test/unittest/error/tst.trace_string.d | 26 +++++++++++++++
 2 files changed, 59 insertions(+), 13 deletions(-)
 create mode 100644 test/unittest/error/tst.trace_string.d

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 1a306db6f..a1eff8efe 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1640,6 +1640,22 @@ dt_cg_check_ptr_arg(dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dnp,
 
 void dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x);
 
+/*
+ * Store a pointer to the 'memory block of zeros' in reg.
+ */
+static void
+dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
+
+	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
+	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
+}
+
+/*
+ * Store a value to the output buffer.
+ */
 static int
 dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		dt_pfargv_t *pfp, int arg)
@@ -1718,6 +1734,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 
 		goto ok;
 	} else if (dt_node_is_string(dnp)) {
+		uint_t	lbl_ok = dt_irlist_label(dlp);
 		size_t	strsize = dtp->dt_options[DTRACEOPT_STRSIZE];
 
 		if (!not_null)
@@ -1744,6 +1761,22 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		dt_regset_xalloc(drp, BPF_REG_0);
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_str));
 		dt_regset_free_args(drp);
+
+		/*
+		 * Pad the rest with zeroes, if necessary.
+		 */
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
+		if (dt_regset_xalloc_args(drp) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
+		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
+		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
+		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
+		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+		dt_regset_free_args(drp);
+		emitl(dlp, lbl_ok, BPF_NOP());
 		dt_regset_free(drp, BPF_REG_0);
 		TRACE_REGSET("store_val(): End   ");
 
@@ -3112,19 +3145,6 @@ dt_cg_pop_stack(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
 	dt_regset_free(drp, treg);
 }
 
-/*
- * Store a pointer to the 'memory block of zeros' in reg.
- */
-static void
-dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
-{
-	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
-	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
-
-	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
-	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
-}
-
 /*
  * Generate code to promote signed scalars (size < 64 bits) to native register
  * size (64 bits).
diff --git a/test/unittest/error/tst.trace_string.d b/test/unittest/error/tst.trace_string.d
new file mode 100644
index 000000000..f5c8412bc
--- /dev/null
+++ b/test/unittest/error/tst.trace_string.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Test ERROR probe firing, tracing a string.
+ *
+ * SECTION: dtrace Provider
+ */
+
+#pragma D option quiet
+
+ERROR
+{
+	trace("Error fired");
+	exit(0);
+}
+
+BEGIN
+{
+	*(char *)NULL;
+	exit(1);
+}
-- 
2.43.5

