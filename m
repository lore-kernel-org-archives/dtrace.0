Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0CA70808
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774918970; cv=fail; b=I+LJzrr8XJ1E4y2mZxGC3uHUFwUcCrz3ROteD/sdwLp+gBIg+jRXcZtjVn8UXZent3FKRoEE2xlTSh5leUVTxJKB+roi9DKas9LBKuy6YGQhvr76vQVZLZ/ir6Anqo//p556GvrN0fg5a7ANpy5kRKro4PHZ7bofa64I0FEImzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774918970; c=relaxed/simple;
	bh=k43KPceABOwB5UlthJOJJfqDlc/qgv1+b9XviKLs8tk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d/MMg9A6gHwaxgqzNy4/Pdsb+Zrh3LFsvXK7pOk+jD7EV/LyqnmhsILBSqZm9WMyi9uPgZdrNibXbyg4PYdlJB8dltuxUYJFzSb60rf7d5gT3OmU8cUdcn8mHhwVZZDKRThpv8wgQ73QH7JvoSB0JAVkQaKI1sctSFmY+zOrQiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZZPQPYIH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V5LF3uc4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZZPQPYIH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V5LF3uc4"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ULmB3Z2813743
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=juBpIsIfAl0HO1ea9k
	3SbbMYIZPEgeiB5kCC2ttGv64=; b=ZZPQPYIH+A931tQHJWExZoy1JCpvZBldGp
	sNBgyk5nrVeQhAJsIZ23XK6vFSxDB14SXBr0cCX/I8W9/YvifpxvQhY//vhVZGWm
	7nTiDo3rweumOFZ2qcTQSEYboYeQsCkgGiYubuzFeUG3MrXqHgIORkoVxpxUPU3B
	bs6RO0gshsvF8FBqe9Ji+nzs4oniqO10oTzilbukMpNc7hPVzvUGuWUABF2TLZUS
	TR8VrmmvGyhsduJkRqKIoNagIWA/wqa5w/rKZ0+FCUybGEtkMuz5A5hJZBx5i0y0
	Q2sqUJI/8nTp1T1D/8BSiv86on1Nz9Q+hSmVz3BMUInEzhPJao1A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d65w7bb5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62UNPMud022296
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:41 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65efj75c-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o92QIna51eLUsMaj8Xralmqntrjq3qwUEeBjrKimqCaoLHfmqAWTW70tzyf5uizdAx5gZC8uVngDzULZrVFAwm0+o7rr8Y/zvI41yoDIaYwgjFA9gmyDcNaCeqmiV/vm7hPhLIbZshlAKl0iUBE9im8ZbhfJqjoCN+XPIqt9ZUrDAbPI7WDpr1Z2AnVtHX4n6nqAl0+MSAkA5kjau7UuKNe67gMw7WS00nxhMY5in3O5v4ZT4lfoy3C70Pu+314HZE08VRLuSFJ8FvNmjBcGb3IHEb/AdZQe4e/UYbuux61KqPt9fRNCr4kw5+LIHcDn/qIotPsHO7IpmOfhg1Ia6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juBpIsIfAl0HO1ea9k3SbbMYIZPEgeiB5kCC2ttGv64=;
 b=xk1DO6HitLHRmuBonoJ+9pUv82Jp0oqWPJU3Napw5c+ZQloxRPb25XqzDwP1n7HiKhbiStvEVdyBHwroYSDxBCcMFQV0LDC4TGCYeGu+PGXhJ3DpolHKZy//GLQIfG+Pd1OXjB5a1z7r8VgOOxgRIv63t+hLDdzrJynGe35vbQanDcitMLBKKJnVHtovnqVZHFk8cQuM0KeLU0RkuOUjr5WBcTAlCP8S38g8U1GHcRH1mVAFKfHLeF+Y9u2RcOWy3Tmv5mHqNwrzklE3cF6BccDR0wSEscVmRcnvkfwld31rBoe/ICTzeAe1b1AhG3YRRNSkroEAqjv11K0g92S17A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juBpIsIfAl0HO1ea9k3SbbMYIZPEgeiB5kCC2ttGv64=;
 b=V5LF3uc4QD/W1Sb/lSE4SM+TsuxjQ34LC3YSRlporsadh0HJfM/FyLmZMueYFNGmT0KBsOrfVlZMwLFLMomfHT0HpBV71siW1p0dGT5IQ5cxKGv6yE4JrUji16Kk/Jp/fIL6RREhaKdInSXO5ulGcJTPhH5hmC+vs+H8w8826Zg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6130.namprd10.prod.outlook.com (2603:10b6:510:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:02:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:02:32 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] test: Remove unnecessary "destructive" pragma
Date: Mon, 30 Mar 2026 21:02:22 -0400
Message-Id: <20260331010224.16165-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260331010224.16165-1-eugene.loh@oracle.com>
References: <20260331010224.16165-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e420eb4-ec21-42b0-9d57-08de8ec13067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RLfffiprR0aYlNMBoFOcVhIXmPfS+rG2h6bUMotfQPirOdWpgLjAUfi2Pww6ncnB284NlZLUtA7VcuYakVL68BKDYDbHjhktCsKMB0fy1x0FgCdV4KXmBzyHPaIZBtGGVSU2/MwHiPIHCS55En97xP+GH5SNw7Z6fxXOZa0pK44VoXkrPT6rR3EiEjYO7RHExFmAh3VB7F4u6P13GN8qDGtHodtXj/AXyCIM59jsh5Q7S+ZFQjGvYciayeDgN71knnk5Xzqn+Zuy3UKcY+c5JmLIjt1yJD7EgP9X6XuQsE9KnpkTAi8BI8QtNAd9GKqsh7H+UzupVe3G37McSYqa8Qz+DtDKx/SkhYsAdSqZgnYCreKSIulK9Jt1GACOznVfyITSbhjh4eKJe8WoGlx+rfkgFJCBUaQ/FhMynbA7hkK7hLg6c7YAEMsm9LjI+xdaboT7KpErO1wkx+3mx38hZZbN1WaWZYPdj0MvUepwrFgh8Eg3md1yZgTeYG6iYjWbdQacGXM5ttK2rIXxRNtspGAIhp/s5d5Pew/LUHAy0fh2ZPNeaHOXVR6WqZ2X9HiTnBTV90eGawsgDxhCzUQWJj8IgdgPibIdtDh/5l+J1gtK+WgXo1Z4SjWnmsGV4rxs9fNJxU+ogIw6u8238VjqMN3pcUHxqFV+6afuFVhO7JQ6NpLt7YFcP2thoofLdXBuuWEqMW1Vwc8jNO3t/HM4DP8MDPbraNTgwB7p1+vEqP4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/72vIa3uhpdGQ/mqmFxvoV46KtQB5jFkNUIMqeLrt04ZFqs0LU9CXe1YqyT0?=
 =?us-ascii?Q?TJ8yjgTSoIcLeJo3N6nIy+xrcj7IXT5o2kkQ7pmDWC1R08wDvVWIlI6I9Gnn?=
 =?us-ascii?Q?3oiBFSgpvxx9WjRBh/+M82ZPycUUd6yJoML+PidUvPVfL1M59daKTK9qnjtc?=
 =?us-ascii?Q?sCExFonWYdMp09s1a904XxOuXPPe5DaEE2ND8YTQjiA8X/9UVEJrXDSKYCyW?=
 =?us-ascii?Q?v0LA9ahvsk+tm6HCqH5MOvZHH2IHmP4wSMfY40yEQL3KqcdZ8zZ3196dPGdX?=
 =?us-ascii?Q?YiikGhSJ62iVcnHXuSUaP6CWeY73Jb1Pv/x+CWarsQdbsbPA9P6qAcDQSqTT?=
 =?us-ascii?Q?QMFfhHI31TRReYQwmZ75KUSqu5Raa4/jPaiew8L1BEBrp3vfg85daEgs5zDw?=
 =?us-ascii?Q?vRi/3mrbQVw6NSGEPrjnvhrt6BHN90iGmz6JDNGfTyA+t894Hs1EZf1TSD2x?=
 =?us-ascii?Q?Q/jscrKkSaRMLX/ic17Rle1KEESC6ufzk+FsJc/9V9P47cA015Co2WXxfsM8?=
 =?us-ascii?Q?VkQbglk1ar3ZaPvjdPCWXovif7ZLpRKdJ4y+2syf2KTqH6tGRKfHogH1zSSx?=
 =?us-ascii?Q?Fgw9oQ15cEJSRDILUrYlcIgO5O8cGJrdWsfxRL5Dx/t59hElC9/6KyLp2ERC?=
 =?us-ascii?Q?uMgLPoszBIN/MZ2aI9w4EIFOUC6PY2PEidxxqXMU2bcIGpoLrJhuY27wR65s?=
 =?us-ascii?Q?NBU3t2bNE0x8/YZa4EA2InetfGw/6vNJdm1UmJMJ+Xjw42h15MoL175iT0E1?=
 =?us-ascii?Q?MW7B5BZ+Fn61jCv6q0Uac/GP4eF8Bp1BUeSo2wFVMToZ/2nhU4Faq/QY90rN?=
 =?us-ascii?Q?Wt9DRpaD8wjGG+pnHjxB0V1Zsa4eALV1G6Xgy12V3JZxTHR+GFcmWpvj8M9c?=
 =?us-ascii?Q?qR4B5rzT9af9n056oQVwJ5w+e+uS00JdipGrZdlO83z8M4xf9Y+RloBZGagS?=
 =?us-ascii?Q?RNbebwwivM/pJZ3T6M6vU+P6AQ8BgYC0qJJlQ7QJ3JboGavzuV3+z+0lTd+T?=
 =?us-ascii?Q?zY2B1Vpkg0A9F8wlBJVOjdv0arTIj/qkh1CeE60NZMw6kqolircyZTCL+n7H?=
 =?us-ascii?Q?MOPQK666JHk8DbVZLxHVgfLy5evO0wFx7COUxuPBqVgTtCHN68WatXDApfDZ?=
 =?us-ascii?Q?tozuiEKljL+BI4jqbk0FU2LogrCm8IIZnZcsuQzd7ycHu1I8gGGDXmbNGcZp?=
 =?us-ascii?Q?kfK3QWZKhHhapVz2HJdtwbgI0WZRel7AXZZqQC9jQG6VdgOzg3Z9s0+visPE?=
 =?us-ascii?Q?ysZJoIuKAE1+e4pn+XtZ3CqsgZVOjVqe9p25Ux+mvaNsE/LMGf06sb4BDJA3?=
 =?us-ascii?Q?c3ShA08BtJDte/qiO6z6Dum2/s4lkoArOdxg9rP9vWEeJG4hgedqCeuXsUT9?=
 =?us-ascii?Q?+/isnnbrogJk+4Pely2+j+UYtfc8ekvPdgW6bNq2U3HzE4/4yef4E0AaaOjc?=
 =?us-ascii?Q?MgraGpHD4az/TrODg6G+3yWK1+KB5zxLrbr9MniFXTS402F6h1wDDga8D0PC?=
 =?us-ascii?Q?YYlqLrtReQEJG3HhOviMsJNiZ6JM8Xe1pTLx5jLobzDspM/kiaCa8GBRYHKA?=
 =?us-ascii?Q?nOz2RfD8geiyoFqE27h7IKJvixAFmJPRx7E5TAr9DnekrkDUW+Vz/WX9IqTz?=
 =?us-ascii?Q?yOlHfJK1mVPvbImT6iB8HLy3DCQ/b4hgeApkgtBb2dJyhLnxWf+jsojAPubn?=
 =?us-ascii?Q?SCBzQKfEw2gTgwqqkOm336BTkIDj43Eyagr2P/aFe2T6Qy6UQxsZuujMOa5I?=
 =?us-ascii?Q?uHNG11qjAw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	G9vmutV/DuYJU92eJosD8otYWuffxmGf1ZkiTN95wEHicbGbGdO21ajgtL5+rnnbmlYVEguctc3nl6Kd27+8DYpbLEXic5hJngEVYQ+FOwRjBbL2ttQV7JKHiI8d8GfDaebEpHw2P+vwYOvwd6I0DDG11vvgc4tKojNW/DH0v5je2Vqk+V90L561V/1KbupC80NNyiPucAUNJHiFUWyzp4L5BtQkjUo4iDMtqFil5wN/A1Q+QILUGS8cuNGMBKuKhhAoGynBhPY/R2cJb/EfdyqKSrPvZEkafQpg3GHTibXx1QGsBicQuRY6FxqGMPGcaT4rR+CcbONlDeuo9lWYxQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SB4MPLRWeWZyWspAAowG7kj+4H+/EKOG3UUTOtjCERS6SsH7Lb5lmPlv+zoMxAJcEQMog6qpDIYQzFjMahHGbHomqNz9rFXrR/RrjER14ZLNdXvFF416dM8IerwOrAIsGzCGGvph/vr/iQsCEUP3J3H/HpckSgxlkGnpmDiL/+2oj3DDGVH4eb5o+FujzrW/uLV64S+yiBxAg6srSKI7CfpLuz9SQ5eTygsdwwcm7XDhcN+piW11GJKouCzHTWrB8yyRMq2CkcE7J56yiypZU1yRctzzRjmc8wOgH2kJueMsVsqfvY02wDQq8PTv2ZzCU2lWvhc3THUuhEBeM9AJglESzS+yrSvnJUdTU9ID/suKwICOmWSbHruCfYoYsXPUsrCSt97x1OHYULACbz2CPc3QkCaTbYM7fwUuDzzM3hoGyP7Et9RWZkmC3d6AAsSgaQMjDO/TU5/l6HhVpisLJS2KgDIcycCuHIqN31f3xHiqHhXzxMlCSmpEgsHgL2Xh6oy119WUqr5TuzPcvRYbcwiioHPezBYUoweusuOJn8anbLp2GMtj83OFWXfoamMMsE5sBaqPeLYRQUTxLoHNz6LHox8qTkQtcpMo/MSYgYs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e420eb4-ec21-42b0-9d57-08de8ec13067
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:02:32.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THHK+xfOeXGtE/2R8aR3no/BpiwRNnjfT9MHYRNkEf4eR6ZhvQLWwBN+lj4lucjIl0DoJwDev351QXQu89ZRyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603310007
X-Proofpoint-GUID: AS8a1Us9RXis08j_Hv7-tyFB3--wHHVK
X-Proofpoint-ORIG-GUID: AS8a1Us9RXis08j_Hv7-tyFB3--wHHVK
X-Authority-Analysis: v=2.4 cv=DKSCIiNb c=1 sm=1 tr=0 ts=69cb1d32 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=26Sn6DwbkJ2VNwVrCaUA:9 cc=ntf
 awl=host:12275
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNyBTYWx0ZWRfX73L/RuL1ZpT7
 tqU663Bs4JOLLDwE0HNaeJSC57ror/WjDP5cvhbQR4piPC9FrXs4ZcpSWhRbMH4kvVkQrJmQ/6W
 rbCAFRrNoeWe1pkpS5cQ21Mwp1AjUqvsos55hi13njSlJuLONh9DRwC2C5Mi0El2bXM8u9MEEa3
 TskfoMUyNRgOLYjmqsqbG6wT4naGGxdscaprXTb4wdT7/rKzTlJYr3tpuhfvCxKC8EvxiF2Muhy
 SXrD5kpVPn4ahnBSmDwrPji13lKXSRF60VAOaxpBaz84bV6zvW5xW3UEy7tzgCqEcZfmnLyYAK3
 p+f0WVmQF4VxW5HPf+CfI3j9eMCoxoWpLaHpbviBuXtkgLaNrEvz7J98ilJYNa8Bqniz3ZD8YEU
 z4ihMy0jZusgt6w4w+7c5HMOgFGuX4m+O7HlHedP7kJPcrAEisJnByG1aPm6YDDnMkmbXShCuzf
 oDA1RjYMYsLMq71ppg/HwdNFp9m/aaLUmzFuPXh0=

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/sched/tst.oncpu.d | 1 -
 1 file changed, 1 deletion(-)

diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
index 7a33bab4f..65bb313f0 100644
--- a/test/unittest/sched/tst.oncpu.d
+++ b/test/unittest/sched/tst.oncpu.d
@@ -8,7 +8,6 @@
 /* @@timeout: 15 */
 
 #pragma D option switchrate=100hz
-#pragma D option destructive
 
 sched:::on-cpu
 /pid == $pid/
-- 
2.47.3

