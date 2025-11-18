Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D9231ED94
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 18:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763489716; cv=fail; b=XjbIHEpsgxq7M6EDVm2OleKhFiYUvDRVou6B2dEg6m1BcLfe8GtxQhG8+mv1T08W5Obrl/LFCHQP+G0plig+ifhlagP9PLxG8q6n630H1gN2fIFL3HMcMibQVFK4BaEQYjfdxwGul2L/Pnij0pm3co4s23sGMrZub2COHEh2HtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763489716; c=relaxed/simple;
	bh=o+IrolpefZz3PalHrjp0tMfiGQwdlL2hCKMlOM5KFLU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RP3d7VJ/snQOJFNCtXvMZd+oerzI/rEa5AtTwI2q1/LsU66OerYb0YhLqMgU0p+PBbfD8rHEyKey4z5dRAO2wtZvXlg1c1N0uRXVE6eS625SP7pwxfASrPTR2gaYAv1SdwUzJWuVHSCTXEeZHVTww5Yax6H67ci9A8LBsWu1x58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G8eQqQIh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iM9FIJk0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G8eQqQIh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iM9FIJk0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHNJ81002461
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 18:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=MSt9xrEGQjy7ybdsqesckh5E07CBFzEsLHQpb6CIjls=; b=
	G8eQqQIh+Qx2/IVALeY4BlaAjSUvt3aR7YUQttVeObBDqCpLlA+bld7Mgeq1tcjD
	SIYGYNqsrWyOos/WOq3vzyQWbsYVLkl3UXunSKfVh5oMcgv3J8fv2sdBuUUUkWoL
	ejwTDdaUV8eA+Tu4WbMuwP7YSCimcyC0sTDpHSKJgTiOXhv7f/lADpN8gV5U2MeU
	gkmvATAXZ0N+V6txluzYXnnkLhmVSgKQ1ccQX4cJajzjz0U9kL3mAS7R9NqYTh3M
	oo45jkt8WK7W1kUyu3GZZ4XcVaPlPG52NP8QYDvhOEFm/KgeQP8iJk02dhP0J5mW
	xoq7QVtpWyK+91Tda2VJog==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbpwdpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 18:15:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHZ6kh035952
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 18:15:12 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefykrxub-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 18:15:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2t2oSn6eyou0jkpsNdFC6ZbQZ86eYViivdAd3xxfKabjB4g7QsDkZHFcs9t6vDvbZKfyJaGzSMJcH78twsgyzWrugdxPZPtUyfONTPeykvN37EPFEbJAfvIueH8LL3cGS67e7rbu4eM+1d8KxHQbzU+qqz8d1JfLPxPu/6vrh6GwUVoV6uM+6aMHbwNYjFHJK6n6qyYZSDLCQtPAMnsTFIi0B1tbsGGJLBEiZL/uKS9XanJBUiVcwejQZRGH1rjaYUw1ktjnVyUmN4yc143EFTNlRfO6ZVfIQXzFHc/knBzdw+OtizqM8Hn1pLWTLkU/R8J1SsYUHvsAi4WRwdwbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSt9xrEGQjy7ybdsqesckh5E07CBFzEsLHQpb6CIjls=;
 b=ynoR5kGVxko72F6D0YG7HaEOhsd/4jd2wiWkn/nlm28DX6TnVOOzvTUVIbieD2isNVVx86Vg9v9eHBLXH+xLG7RUv017bfyNqaE3VhGxmC9s0PdsePbnOfrAUUzIgF0xuPYGn38kdSV/Ngy2CplwJ7QI9DTvtrJ83Z07YYWfqLzPqdWA2w8+tz1f1ppFhgkVw+8w0fkW04mpdo3xdSxlfi+FA3Cn1e07300N/5dXeb+dhyf3344+sMulp4w2+XC3uD9AkqWOdXePLQXCaTEu1BCU4iYZ+btKBUVNEsdjAgtEHMqjcBCGdidXzibYkdVmSJUmHZ41QSKdN6vxXYYFKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSt9xrEGQjy7ybdsqesckh5E07CBFzEsLHQpb6CIjls=;
 b=iM9FIJk0YFt3Oj+IzbvXKZtLBj4NgWlms9+y6rDwMmnVEpOGujcSbPDg3iT//+ufta1TCq2k3+RN9Gj09MyAo2z/SkeukkezPR2o/Ipkc8+B9KYIvbpt/NyGiq3VbQesR+cuOsoKXJixbQ03DIL1WZGCm9zCxEMVHhUyiuZ1jZ4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5649.namprd10.prod.outlook.com (2603:10b6:303:14c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 18:15:09 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 18:15:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Update README.md for RPM info
Date: Tue, 18 Nov 2025 13:15:07 -0500
Message-Id: <20251118181507.26266-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO6PR10MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e40d0fe-d66a-4ea6-12c9-08de26ce6857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cu98AnTlyTJL7yQbgzRNhMoSyWu6+xlFeLYYKTVPxednBmTWjkk0pP5Ix+Zz?=
 =?us-ascii?Q?nOf7uNTIB47GvJoFwasko2cQsYqR9NVxGArwbjDfVteswvYzVB9VgiApmi1V?=
 =?us-ascii?Q?0Y7Lu/NnTWVPuuBquQBYSSVlWIR/wn5MAekQc/ObyM3HLBbHDg5+kHmX+F/k?=
 =?us-ascii?Q?G5Tdbz3CJKL+aYjkLTT9FUMxzK+2kOnd1Qg9t5BcNbRhl+gn9HqvZ26dYCR7?=
 =?us-ascii?Q?KBczrz4STT0FRgvYd3bRK/aUcwNdpuJ9k354qVCHv/44d6f1+2jbKnhLtb26?=
 =?us-ascii?Q?AgRlYl2NHLdw4veS2n/iW0577BJzCcuqA4dd5iVXs4J24IGDHwODQHRI6jDu?=
 =?us-ascii?Q?iaAxbPRYMkOg4iEOlmCFWMOXmXhsdrK2aJuMeY1k2sK0+5geuweJdvfEowxk?=
 =?us-ascii?Q?XZ/508WRnPRssQ2Kt4VhnwkGeqSHtYis+zxRFuYGThQL46mI5EhZfN3zISp1?=
 =?us-ascii?Q?amBXbzyFrjCJ3wNLwD328P6WDv3m0qoNEwkw4Ze5heco0WPARQqzXNNYHBO0?=
 =?us-ascii?Q?LoeI63spOhR/wnb8MxX81DyM28IFL7mj3aBPzYgvbqK3RScUL863lX5nkVMu?=
 =?us-ascii?Q?6S0lgH9jNwdouIKjDOg0aEqqkbd/qWkZsG9vXitctvtdfPoZHM//bqVfTqGY?=
 =?us-ascii?Q?BLkwjBWpcxDMG8AGB6YpW/7hH/33+Ma16RF38B6GSmsa95XmJBwtgK26LIdO?=
 =?us-ascii?Q?IX9iCro3etQM7aMuZ6gx6iwnPyKVSlwhFVrtfUdE600FFqyrkSQHGUMt3W9q?=
 =?us-ascii?Q?ZS8K1bpYaugV9dkosHxYBCYaxsIv+GPdXK/4FQRZbw/VmRdfFgYUVTGFW+Qp?=
 =?us-ascii?Q?I/T/19AjcN0JBymZ/prxBWRzhRCv+6cM37v0+A5av55ZyVzeCUDp6Gcha9B+?=
 =?us-ascii?Q?00lnW0jPK7uyEkHPwk09iJ2MgWlEpdkeLGlWhnERSFYRDQw+RqRrcbXX3WWG?=
 =?us-ascii?Q?FIOMXSHTUCSBmJBMrUy+u/qZYYWvjSXoSihAKpMR4T6ErpFjrBuBn5Tdu81s?=
 =?us-ascii?Q?Cr3FOBNrjyYFrVXZBmJqGlbf3C12Eiy5TOZdMO7X8O5plwyOhxix5T6ykEUM?=
 =?us-ascii?Q?usa1SM52ScSionXFn9BVhMVaCtXrREwTroEgxjdKFr2tCNPZkZSnz/oxo9wI?=
 =?us-ascii?Q?s/NpdqKKxg7DkOhyMqIuzPSw1M6Qmxn5JGgbj9uITgpJvkRCe/ibrL2iR/Xa?=
 =?us-ascii?Q?eQ2ZqhFg6Vldfg5VAWjNpqRiMhAMVNOuTE/Fp2jTkS2kZk1HareHDyqOJ57I?=
 =?us-ascii?Q?U4mP32iKotj5+nDBgrl0EoxUMl+L4FE/QMDnfwNF/w1YEa+C2mfUDT8EUOcR?=
 =?us-ascii?Q?mffFBMIQYSqfZAxJI44sA0KuqV9GdLWm5hFrorSI5Vtz8wJdbfVl3jGzaQIU?=
 =?us-ascii?Q?uJNSUR7cP4ezJ83WVGnzDybPpQfaWtHxfaChjRaCQIHLUY+w6EOUOxzQYJXl?=
 =?us-ascii?Q?4cXQMoJ1x0U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MQn+qHCmE0QvqFAI9K8Xnz7PYNwKNZtLJBUd349Ag48jvMLVp2A4cHHues0K?=
 =?us-ascii?Q?1DRBcitQqLbaEde+dmMrYiaSCni5hKph3HcP1q32bObCrfi+VjXXrQPqq6c5?=
 =?us-ascii?Q?4MT8IgA1Dzam12BZbih4lQ0dqnCD+74hpbQwged8x+BszN3lDeqIK7c6nP3M?=
 =?us-ascii?Q?N5yNtKxJGsqJUumLuNhwuvvTTObhJFyAbnkMntJ38gtP7c0x/pSzL+Qs5wAt?=
 =?us-ascii?Q?I7roTv1tOdi8Vc8logOrkHwKT5j252vuaBGL2dVfxZuYXHnDDzVLW2MBd1lF?=
 =?us-ascii?Q?ERKFbsfFp0MfAeSjd4iNTEV0NpOUdqln15lq+XYc75U72Z/Shzvufpz/FMIo?=
 =?us-ascii?Q?pfIX+s/+3wuyH05QPJhbEHZODZ2cbpykrqsRjFXUTzG4/1sUwct9XNMzU7bx?=
 =?us-ascii?Q?UDWKEwkktP1Xna6ceJi4qYK4ErSPvnZIhFvlUu/IoZBLvLScA0lj3R+cIXhJ?=
 =?us-ascii?Q?2TtL+gSlK/gPOxI9uDZ4oWkjHqTjzooUtVWPFW69RuKU05ARNF4AUIiXTiJ0?=
 =?us-ascii?Q?+qnIlZapXeshtwicP3RTYvssEPh9vF/AYGOSSPr0mTaYY3qm4EXqiIwMJhX+?=
 =?us-ascii?Q?vwfjqmf4vT9D+X6lAIr7mHKv19fG91tl+yRqbxKxETNDwZizH63wNBI3PEwM?=
 =?us-ascii?Q?1j0WiYeN00KB+VQAMnDib1jAxffSG6Oq4QDZQ9SkaqSfiu/KmU81RetmgiK9?=
 =?us-ascii?Q?D/5giIa6brGR5lpRpB/Jm5j+XqegPK5QlAArQ+jx+pSQpIYVjO23qSblEV1u?=
 =?us-ascii?Q?XFhVqNBBw358ysw8EaYurn83YvCCd4JBRPbDF2TU/IPU0jdPCUEfWYjQvPcZ?=
 =?us-ascii?Q?8YYructJWBFvpU3zOejzRo14Azpo9Ujf/+ZzRTO67RCotgkSlqKq5LmJeB3m?=
 =?us-ascii?Q?cuqyonF3Bm3k7XY+qrw5CDk9+kgWgLAMdST2OuReFD+JE5hVWisFfc+3VEkH?=
 =?us-ascii?Q?ZxBL6jgKv9pgLEino0kP7ITO+weeiMVld+14Jc12NxUoSjAPQjBY0zxbU6l+?=
 =?us-ascii?Q?Kfr1O+FolBV/yWX2bTVMH9NRqEq8U/XCmiaOfM7as+AhhXCz9mat2vPvU5Kf?=
 =?us-ascii?Q?w7wemjWa+IPfv83LGVb+/oBF3Ov5ubZQfeHakcDIc0ISolzyVq3XnS/KIWXB?=
 =?us-ascii?Q?1hIul+WN0ejS+iehIA1JP3EQmJaG08xMVyCicPOeUc3gOWg4YnFqZeMlh3fh?=
 =?us-ascii?Q?cMGzwMj4DriGDUKiIbdWp84ppwWi4IyaU3grz5puE5MBiLxRtvwYptZZ2L6g?=
 =?us-ascii?Q?QHaMlKg5TpgjalezoawkegRpIdTBswJkrKZoSzKkhjlQdGaxumZDIcb6PkjT?=
 =?us-ascii?Q?XQXEnogJyllS7YiYu8RSHUPF52t99WwShk6TRICqTQWR0w18pyrdKfYTdLNd?=
 =?us-ascii?Q?p3DENejt+/LClWpNRi29xtSyWMvTXDbUZ8DNw51r/7g0MLl0K4gKHmOOi77h?=
 =?us-ascii?Q?qUGVAdYvB4EitbIAltwaYXfxQWiJ7yWa/y1rWUY2EObau31LG0mqQ9c9fe6M?=
 =?us-ascii?Q?DiTJ34dfP1m7QYvlYN7VSwwhBkZaEJElI+13jvKE0uqTL3SbN5+K/F2l/yu4?=
 =?us-ascii?Q?AFh+okQp4pJhmCd7BZh8M4OzrbUAoahu75QVKBbH?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LE6qpKBM9EnWrm4wly0r63yFETV6+K1lzcDwsU5R7JJMHeTjZnCX8ILx4cNXaEVQV74WnnyIurZPtgDA+sRXE8kQSRBzEU8mTu1PB/WmGHWLD0yfuDiFUkga04mQfNwAmdBv32Y1UAm+yEgr5TgsSCFXyJEP5tN6A942XpmLXfn6p4tPpv0nXxL13zo0FyGqVW5oj8Xf35KOR7kvgJJIHSrInH4WyI8VvfDxGQk1BjMBUb6TxlHp+p79Ae6Xsyb8O5GBD5wSslO4Tc8GrgAC2FISqB7RMlS3xq58FEfKD/Lwz3dWiuf2AHFFNEsWRg7u8F4roQk8iPKHHSUX637V2+s20ylSjF9qHXL2deX1zdA1utmjHbaaUa6Pwimi/u4thFkc8/3mq5M8lAeA4s4U8spSnL/j7i4KxwEc5vZ3eKIjhS4ajsT/SYfZRBZeRorgZv6vjYiqBsqb66PUjqz0JOhYWGQ/S4MDXmoYpB3Ll44jzMkOcMDRdFPRcIUm0MpgJ7xG8Jy3ydSWuwBOFiBOwcj8F+JXSMeu5i7TOCdyRnmZh5G5354PwYf0n1mLR234kVsYAmDCoja4V97A8hRF9CHUcyki5dtWHSH8rqExZLc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e40d0fe-d66a-4ea6-12c9-08de26ce6857
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 18:15:09.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVOCuYSYxe0aKS6+eC3z+ARYVHzDw/xDe2wabk6lzrlpBMMYfUvbXQ3XmfjJX3G8lywKgelgrMsetNJ99Lng7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5649
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180146
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX+Z5AiFoI2RVB
 fvsD3d/+ZSM3bsDgpqKlUM5CyaiR/UxmM/ER6rbiec1yOk0P8H76eSjSw5lGxTYX8AfrGdTsR/H
 MCSwlhOgtRew9vrOVDxZAg09vTIdqkb8OEK0y+2S2d82quOzbBaA/0CfCjefj+NaQnRHAoWvf4D
 WndG0iWLt2xnWt7m8FNArt6YMT7tdRA5zChz7kqtKRVfOEY+kHbhAmB4qGgFmfrhHEI2+w6Ii15
 yFLBd/V3k5fY96qEA9KhpiXj4J6HKH96kNNuSNarO220Xt9NVWD427j4zmmjGd43VFzbxJfm7n/
 TYZPQLMdT9KDnwFnyrjIaBtxVn+Z158fACiwuujpiEwVCkhEJUEmOfLHckgJPC8IwVojnndYXeO
 XkLQ7fdoriHOdFmrWHTbFe8reV8zIVa7yrnFcUW1udylRoonGPg=
X-Proofpoint-ORIG-GUID: LShJzqKKRAR5IiO1SXWs6lEFXZfO1htw
X-Proofpoint-GUID: LShJzqKKRAR5IiO1SXWs6lEFXZfO1htw
X-Authority-Analysis: v=2.4 cv=a+o9NESF c=1 sm=1 tr=0 ts=691cb7b1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8
 a=WPn2QM1W4K-mbIwS7OUA:9 cc=ntf awl=host:12098

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 README.md | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index b54189b1d..95e434340 100644
--- a/README.md
+++ b/README.md
@@ -9,19 +9,27 @@ community.
 
 The main development branch is [devel](https://github.com/oracle/dtrace-utils/tree/devel).
 
-We provide prebuilt x86_64 and aarch64 DTrace userspace packages for Oracle
-Linux 9 (UEK7 kernel), Oracle Linux 8 (UEK7 or UEK6 kernel), and Oracle Linux 7
-(UEK6 kernel).  These packages are based on the Oracle Linux specific release
-branch [2.0-branch](https://github.com/oracle/dtrace-utils/tree/2.0-branch).
+We provide prebuilt x86_64 and aarch64 DTrace userspace packages for
+Oracle Linux 10 (UEK8 kernel),
+Oracle Linux 9 (UEK8 or UEK7 kernel),
+Oracle Linux 8 (UEK7 or UEK6 kernel),
+and Oracle Linux 7 (UEK6 kernel).
 
 The latest packages can be obtained from the following
 [Oracle Linux yum server](https://yum.oracle.com) repositories: 
+- Oracle Linux 10 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/x86_64/
+- Oracle Linux 10 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL10/UEKR8/aarch64/
+- Oracle Linux 9 (x86_64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/x86_64/
+- Oracle Linux 9 (aarch64) UEK Release 8: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR8/aarch64/
 - Oracle Linux 9 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL9/UEKR7/x86_64/
 - Oracle Linux 9 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL9/baseos/latest/aarch64/
 - Oracle Linux 8 (x86_64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/x86_64/
 - Oracle Linux 8 (aarch64) UEK Release 7: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR7/aarch64/
 - Oracle Linux 8 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL8/UEKR6/x86_64/
 - Oracle Linux 8 (aarch64) BaseOS Latest: https://yum.oracle.com/repo/OracleLinux/OL8/baseos/latest/aarch64/
+
+For Oracle Linux 7, we provide RPMs up to 2.0.1-1, but building for OL7 has
+been deprecated.
 - Oracle Linux 7 (x86_64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/x86_64/
 - Oracle Linux 7 (aarch64) UEK Release 6: https://yum.oracle.com/repo/OracleLinux/OL7/UEKR6/aarch64/
 
-- 
2.47.3

