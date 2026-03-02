Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8DD390995
	for <dtrace@lists.linux.dev>; Mon,  2 Mar 2026 21:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772488282; cv=fail; b=XtU6RyfcpyBDGDpF/7GWN+5jzSTEMejgJGk4Z9NzpKXep6glyBcoevVjnC2A69rBf6LgyzKctTSiUeRdFs5NN10FT5Y64iQ2e85k7i06A6gsqTnFltFQfJQggLwDP+wGGvtx5Mk+oODFyCtYYl/7IEWQ7H8dOEGanyK2oHImajg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772488282; c=relaxed/simple;
	bh=WmJhna7LtlkTVOJ7jHn5IxgAKFmNwwMFNTrACfL294o=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HDqwSqgHeY9bYPr9UlACaaLFbhOUFkCp0MejBO/nZYtmmGUS4ZwE6ho1GaOHs69u0rdTZpzZYFKnKWDUTHT/osnSGmGGcGXiq2N1ufulVvMQNYMQm9tjoGX0Xu8s0wJF46JeQQ+y+dsjZEOsQv22qDw7GT/MrmdJXnkfRJ4ZW0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NILNSkFJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F3jZr55B; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NILNSkFJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F3jZr55B"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622L7xOC2009867
	for <dtrace@lists.linux.dev>; Mon, 2 Mar 2026 21:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=2q1ScvLlQnX0mhN4KREA3LR81vBda4UeGf2Er0nbi7o=; b=
	NILNSkFJQgyH3P0aPMTLwpOvwHsUVZcxfA7ZZx2+taA7a1jV03bxujf7xsY30NZe
	LMhA6H/UpYFXsV88HDVrVMsTbxjQUODIv9EF2YtFRQMVNHCuoLrkppCe+iTRRA0n
	HN3nFdCgWuUiSWuXwRirPYu25Qfm9z5AzOlh2e0m5gFrV3xZR822YEyTWRg1153y
	6so3LSZSkHyfgSkdDpQSsFTb7gchYdfx1viIZxktHD/nySIbxXAqopMt+TlHyKSW
	oVmMMqY3bmtqjYUHr35TjRXec3kZnZvgfe7U3hCKTwcNXGAr/mDCExOXBFKSbUdT
	YYYwb+MWoKmUHDZM00g+fQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cnj6k021e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 02 Mar 2026 21:51:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 622L5han037740
	for <dtrace@lists.linux.dev>; Mon, 2 Mar 2026 21:51:19 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012010.outbound.protection.outlook.com [52.101.53.10])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptdt2aj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 02 Mar 2026 21:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wy7ZQkCLpYshfbqXYggUwyZ5RpUjVaSHIBk2ZvXAzIq+DqB6jlQs3Fi+9DGJmF20RLXbOIUMMpxv57S+upZY550XMgodApM4zAnjIGFle0bnH6++2x6cCp/4QMOqaFl/CUMielOYM5LsIDLnMqsJZskby2k7/n1Kk2/LQRJjsljDFTTMNsvjMUt4426x4/lUqcTVd0X1KJHJMcdqLt17m1AnNVoba5vi8+6bAbkjHBb+WmDle1R75+x6AKSrlLwE8LHQmPRV0ocST1An9qCrjHI4zGcuHq08njTZXkYDDOP1fuR1LH8oGkf+HsDaV2o2akCqQY1zBZI74qKMnSMGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2q1ScvLlQnX0mhN4KREA3LR81vBda4UeGf2Er0nbi7o=;
 b=PwTVULL2Vi4HHbOjATumT4JAZLsQ+qMDFteALzpg+vZYZqZGicuH2l0GesTkqyOdgaa/aq2jNM633vV5sDqwyaDNMPxQh9ljB0wVO4v8dTeALwpkjC9LMYOxgrOGN0HvXdC+XaXHnJ7DU1DlsS5zAkbKYYFO79OlBVvIBNslw4eO9c0p+ldxOCu26da9t95U8dTq2s6AtTFcRmo/A0Dq6ZOEglYegpPwgQcfIM36kS9DyCFaodseZiFHPXLOJLLwRSPCNuVsBWxGJeKhHMXZbEHjXiHniwh1+VkUW4+1jwaW4Pr/MyAL70COnOEGil6NixIiF7795Rl5fzYdaTMZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2q1ScvLlQnX0mhN4KREA3LR81vBda4UeGf2Er0nbi7o=;
 b=F3jZr55B/vyjxUXnCN3XlsNs6zk9QQ2EmhALOWPxacWJr8Z0Yn2/hFgTF2IWY5azJeNqC7jCqOHBF5My1OnBWNT9ZUbS6/g02zw6fe1oGP38fUolTk9PQmzXxyP+mJQZowJaIrH2ow2P3uyQ5ZS/sOSUfQH2+usmjuVCCCJ4u9g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6776.namprd10.prod.outlook.com (2603:10b6:8:13b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 21:51:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 21:51:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Check for symbol ext4_dir_operations in module ext4
Date: Mon,  2 Mar 2026 16:51:12 -0500
Message-Id: <20260302215112.4416-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee8fde3-d03d-4afb-f68d-08de78a5d487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	cZ+0WT4ORBIz2zSVg/38QD11whNrrS7PI6seAFhSzWQteC6+u6a7r0um2IrJVIHd+430z8yaPYp4J4r23WVKTJ08SCP6VJANFEt8YZaJRxAwvAzatnefPJTZRytzVknX1pWWBOF4c9PRtXpe0mrvCwOBAU0WCPXh9dogzYTsOFljdvgMu+ckGaiOzTo0XFWU8pY2jCRBBXm4iEt/oZwiRmy2aB3nUwMzvaj7Z7jvBzK8W3ZhYv8patd7M6aYzFRpIy2Df7GwSmy+yUcNh6d+3HsD/dkFVERxSWoL03n4HZG8UQ9IrsUvkI3ELWxiLySVzq+7JlxOz3ztXTaSlSQhwUewx0+KAyFDhPPvYKUEnc7w74vwY7EqrYZZF9FbOqVGJUuVpOWVZ/xoMlFYi9ZWzsXWoB+fbsCao1PGTGVa/ZESxCmG62EcIw0XIx7Kr4J1ozaLI2fPXp2vqCPRnVEm2OaUXLhrQb2tCuFqV0eVpMqhgN2hfgYCQUg6bePgsAswn48160uE3p6AXMoQ+D5N5o4hNdswFxW2doAQsS0mD68D5xgGJX9nf1FbkoNAPRrTVTzkbkScxNcJZmw6Ui7vH46HqOD5HapjuM2hVjECcx+1CV+cw05qLbw21emS7y66v9lC16qGqieAtf8JxV9weMkJL+vQMEUZJ3UEVydxD1NGiUNFJaN5YR8J83dp29oyWlQ9+8OQmfxFN0FbcXmq0kW/UZKlfn0jFW1023je7lY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ceu5MAWYPT/MmL0kHVpkkfnWjGv3WgJ5VzkrUiH4ZljITlEVlmslHqBf7+1b?=
 =?us-ascii?Q?aUHmKg8OuXUVabf021Whev3aR56ZJnp7JZYKkJCkWIWwK49RxXVRBKNO2JBa?=
 =?us-ascii?Q?4Ln+dU+d49REbgZuIE/B7OpGxMHZA/d/ZoHKScO3srGgqcdxq/XnBJ3muej+?=
 =?us-ascii?Q?CEjtPSG7YQa1GrILlwzYkQ49Qk0UsQYZa2xc313NEl920WnMkLquzbzebN4J?=
 =?us-ascii?Q?EkJL0NHpZFdIuYmDSJZhNOK5FsJNFZ1eC8J39i1J2ZonnD9NPial/mDnmKWZ?=
 =?us-ascii?Q?6APNouyZ+bb/iwP0nIdfYQ4N2V/tM3styGCYv6WLXNd++G+bZSFjFNr3g2he?=
 =?us-ascii?Q?X/XFb7fOn1wvn0I+V0R3VLCHfBYudozwNAZghfBpIpSyjAQJX6RTG89FRqYr?=
 =?us-ascii?Q?BCInoeCuwOkgFSzUI4+ALrrtpnE9bIni/f6kgNifrSNYDpNwAxyOroZgvBg/?=
 =?us-ascii?Q?lE1NDN/fS5cSf6s5grXG28bpdm06C8ZdG6lj7NYLcZHaC+/aYJ//zO/WbocE?=
 =?us-ascii?Q?aQ8ihzqACuwHHbC3I6hs5FYXoqIvYfgaJeJ9w+MWenJifXxwJfqMZitv0344?=
 =?us-ascii?Q?lm/6UMRYLmYam9EHycTy58g0fYeqkyrCkUr+0/JI9xOKWg96SHk+c4VjaGza?=
 =?us-ascii?Q?s9zEp5PKBEP4elUCmxxlTK7cDx4Ko0ZgDvf9/j7jDhWVnd3Fm9V28l/EW/O4?=
 =?us-ascii?Q?aCT+ckqrSNQOn+8ipO5WCXG2mDZVLbb9sNTBqV5z+/2HwSIKUQoJ8HoYYXIy?=
 =?us-ascii?Q?G6PhGC5g25q0xW1GcwNqZLeA7UMoRHAcuW5p7kU89habNnxFyULSpyacSNYV?=
 =?us-ascii?Q?WF7/Tk0QhpS6OQZvY6csIQP6gGI0J1qxDB9UnkEg563IefVeiTl/qkWQoT6L?=
 =?us-ascii?Q?3eioHuUKW59U+0QFHE70giy0HHkU4txUy4pX3Vbop27B9qWk02ZDLzOO0obF?=
 =?us-ascii?Q?LWYRjMeZvRthekrGLlg2DofAD+8Yk7qmCPHE20eI8fbY3KJk0wyOfk5tFDtc?=
 =?us-ascii?Q?8zxT0YvYvLb1BXpsK8+qNN+/yaECV4OUtD+ZzSEKIMGT2ZkXQlAXvUgZjoxb?=
 =?us-ascii?Q?7LmCtEKo/w861Pv/e3eBUHIR0rmO2LAly4GgTYx7QFdG6IZ034Zig1ev2LmB?=
 =?us-ascii?Q?AbUkznEv01cRasx1f3AEEFl8j7LXsNeSSSswgbCQnDcmCcatV0XYJbP++Zqq?=
 =?us-ascii?Q?MsLZAQUl3+Uj/GnWR3oBH8q3LBAvx+SQSCOfzVoeDJedYpjYE9choijDTsLO?=
 =?us-ascii?Q?0mnsIP+t3w0oNtF+bePoBtpFwPCUezCmperfBCIvLO/5tw2UvcOWAlnGQBOM?=
 =?us-ascii?Q?1B7RD8lOhQ/FBNNxeUR98xLKkePMzHYW+cYoof3kbpl4rb4HYD7feN/D0C7S?=
 =?us-ascii?Q?ROmG6Wguklwv2tWljcezJpgVHM+L0MqNivg2XkgNKNTnEJbYZlVoJZcuuIoa?=
 =?us-ascii?Q?5ev8uJe1HtlXFjrZ72oPOWhuEvzUIX7Z9Ga/Xy25kd/iHF+n6FfFY+a8ojFQ?=
 =?us-ascii?Q?6ei0ANb+BP8ZkhZox4xPGXkEKmSKUqYjUqbBQPpfRNWg6kHXrb37okxq4MBM?=
 =?us-ascii?Q?GB7IvnJvr+GgqMFzsU/3FZZYkMKE3lDrGcihW9Ua7BKAIJq2aeYYdO2Tw4rA?=
 =?us-ascii?Q?Qkgd3AaNCSvBt501BQcF8zM/zhgZVkqpiwZdKdcFcpzs5R9tEnsBs5QScC71?=
 =?us-ascii?Q?sn62V1UZ62LsNiXW9JkcVGlNMqIjMuBRmvK5mdBe201rDW51Kt/HSIDJJn6z?=
 =?us-ascii?Q?wZdRVq0niw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wQW8G8pcJeFWI+xBokfmSr7s+91pMHFvnHSgyAj+QmI/ehqtDpnYSDnYjo2CMEQVcYQoaNcQflYJI+wCis+Ad2nMHuUiE4qrLmaEwc2XNJw5fUhuB3kadg+U5dCRs60zb/12Zumh/O890C7T3E1Q2q+U+4E/RZ2pYQ7ypqeGKu2U4dPx4ODt2gROs3fnFJnI8CHB/Eaa473VueENzfsVva5efFdqxDFWoUd/uUW64rAP8nzFCfKDI3PUaYjcSnFgINYCHJJ5NdEnnYHB0rYE05rpkDk61NkuXslcOvBC7J0zzojjm4cI6R2vl3ggf0UCRi9DXT8KSwWMufyDeCX37WCrP4kFN4E6DfpMdWQkgVufHOAhTED9XtEiDGFJti3BCKmE/yJtuEx1jwbYCglcMBe6KhM6XCoKrOgiDgnoBPhqAX5Z5yN51Jk+0Kgwc5gzkqPD14e8Mua1o8W+JkrJgb/PDv+eVwdFOvoVeB5ljFl5y9MdzNAtpDGe0pGobUT3aadcH6qc3DkIXLVk+ZiHEnl7c2C391um55nMC7LNJXe9p1E50Y9kuHjcI59cP5qBFRVQwpchufiV1xGWq/7pBoK66ciuw9TZkLBg81SaaVM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee8fde3-d03d-4afb-f68d-08de78a5d487
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:51:16.6725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rgEDDOcy63X1tZk+mN+iBrz3/EjR9Cu46UGIy0j2gBzVAXBS9AH2kXKjhq/3enpt84b/5F9aXfbO45sURh6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6776
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603020163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2MyBTYWx0ZWRfXzxsANu+Lf9CS
 FLDRavvHOuOz9H+mFgrF6gBKxaTor/gVEuZOASIkDGB6iiiHm7GE/rKOZbQT+ZnbXvdO6GRm0jS
 O9rBPj0GZom1loeVQ3/qQXuGwNvDUd98v7/J8wClT+SZpgdkefTMAUMYiUFybwdK+SYtVjPgnnw
 NgkLgBZmYJVIOBTuZZ7mvw7Gm10GoJIYPkUPsTdxrMNpMZgOGvFC2oKjcBMDxYmN5NIQW0rRvvv
 riPoqOItgPpNreRam0JmqDIHgCyFSIaNYhgptBDVCA1njp4P2Hvmla4Lq0No5hEzMpaF1ZEH3e2
 u/m+y+TFKh5LAsC3ov/a+8rIGcMrn92Sr+6WNesALtVlVGymj0ENSzSaa0n7kgIwxQZQNpzo0M7
 7dvewZexPqtgmw9X3POMZCz+QzFOWuyoAu4C9u5Qdz0ULYLWJ5/rRELICLf/8Zw23VW3T8SGEMS
 iCDFxNoqzfMzAr0bFCOGI7nkW4TYm8stkiztVZIU=
X-Proofpoint-ORIG-GUID: iWQKsX19Iv785-WLUJJDvSOGm7yqd_Ji
X-Authority-Analysis: v=2.4 cv=Hb4ZjyE8 c=1 sm=1 tr=0 ts=69a60658 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=1iCtkpCcw96_Ef3G61YA:9 cc=ntf
 awl=host:13810
X-Proofpoint-GUID: iWQKsX19Iv785-WLUJJDvSOGm7yqd_Ji

From: Eugene Loh <eugene.loh@oracle.com>

The tst.misc.d test assumes certain kernel symbols can be found.  The
test specifies ext4`ext4_dir_operations, but there are apparently
kallmodsyms bugs that misassign the symbol to the wrong module.
Thus, the test fails to find the symbol.  Meanwhile, we are less
concerned about such older kernel bugs, since we are moving from
kallmodsyms to modules.builtin.ranges.

Modify the .x file to check for ext4_dir_operations in the ext4 module
for those cases that rely on kallmodsyms.

Orabug: 37783183
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/scalars/tst.misc.x | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/test/unittest/scalars/tst.misc.x b/test/unittest/scalars/tst.misc.x
index 1a1d9d271..ffef2fd33 100755
--- a/test/unittest/scalars/tst.misc.x
+++ b/test/unittest/scalars/tst.misc.x
@@ -1,11 +1,20 @@
 #!/bin/sh
 
-if ! grep -qw isofs_dir_operations /proc/kallsyms; then
-    exit 1
+if [ -e /proc/kallmodsyms ]; then
+	if ! grep -q 'isofs_dir_operations.*isofs' /proc/kallmodsyms; then
+		exit 1
+	fi
+
+	if ! grep -q 'ext4_dir_operations.*ext4' /proc/kallmodsyms; then
+		exit 1
+	fi
+	exit 0
 fi
 
+if ! grep -qw isofs_dir_operations /proc/kallsyms; then
+	exit 1
+fi
 if ! grep -qw ext4_dir_operations /proc/kallsyms; then
-    exit 1
+	exit 1
 fi
-
 exit 0
-- 
2.47.3

