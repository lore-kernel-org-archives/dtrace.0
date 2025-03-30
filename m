Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF3FBE67
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368267; cv=fail; b=ZVkYz0dEih01STMkw1hSEtoZE+ZOkw1qFugiok6X96i8n1Tjvg58dxZOcrHu4F/JP4qMSnSkMMVjjSlxf4MiGZuxI9Hf5T5UZdOfdG2Uul/c8ZHJTbsw7NnrU2vK/cYG8V2ullBsLoD1YVm28RMPFDBux72E9c3+1glXhU8+8eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368267; c=relaxed/simple;
	bh=n5Wl/4bXPa39+9bEez/SMpPHeYsa1+3WqC/R+ly4Kcs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Tk5OWLxvDnGf0/+rbKsDqgO+xVVGokk8bAGGtL8fduFUHIhYFAYIZf63Zdvwiq4nusbiX2AhEdEM1+GBHwaCtohZRvQI6OhaszUp9wbiCUt8o28JXenhp/0dH+4avkwCzsNTN0mLAfVQ5o8IIl+4NcEPKesER+H8OITHRAkeEgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nQXbcnoQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DKraWgMY; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nQXbcnoQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DKraWgMY"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKvgi3001772;
	Sun, 30 Mar 2025 20:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=wU8XhS1HPKj1PkkC1+4dy3LkzbcGz3Rrk0gnumAQrWg=; b=
	nQXbcnoQxH+V15YzHvAFiDvebB8znVTR5JTj5qqlAWwpOfqm5I+cLfXSTudL5ecY
	0W821wQYtrw7xGI+CGgY4/J0ZUPKbVZYmS+DRiO3PbPHny/sLT6Udt+r6DCVYQED
	yEHfQ3CM4A8HGPYl4hHbJxLvBmr+v2vyCQH2yrzlgPfgUvqmb9LavMXpY2rcW0D2
	QZvLNEzXMDbw5UmV96foX2MTo+eWedPmw+OCjWI63/3LnE5tuWaY7qboTmFH/rBA
	eS4ypjFGTimS/NkzqmvrwzRWtFj0t1sSScSRElO90YCFb9BeBs0prTSmqISxt/T4
	u9yEyryH2mvWuvRUtIx7iQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dta92q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 20:57:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52UKiMRk004684
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 20:57:40 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a79jab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 30 Mar 2025 20:57:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9uguztWmr2QtduSCUVzijghRcHM7kiSUFiYSwRDl1yC4Ng6qsMihjqUzO73v5nQWIG0L+hf7jkFN5Z6LRSX41z/8GYfz9l95dvZKQcxa+bTZnMvMG1y5myXMt8LLkaTHvhJELfMt63QjuU5BaSdYzN2Gvp7dW8fqRvorWHiEbW6ySaxgCn668Ui36tYhkxtVqPDW3TorVRaNghd2Nyflkah+FY/k+pZ3UekzGBfTNmEJ/UHxc1DPoc91r1Cn27MxwVu4qnXNmMr5ZDMYpFiFG0aINpGXohq8+/U36VtN8upjJl9iPgOrUWqYoLK4ie1DkXG/XEvOwdeP97lWm+ZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU8XhS1HPKj1PkkC1+4dy3LkzbcGz3Rrk0gnumAQrWg=;
 b=LcBH0IyYTgIchEusGhaSf13PFyDT/yYI8hZIAnm2z2ilCkueQWhwucEWbnz4jALoJBClJ/rz8PCsmGZr1oQpuShq/ClwrCqV5DtKWKN89nB0w6nZ70vLMchX3PxgLuUEd1UN+x75qapSjzjqOpFSLOiYGiHeWXoRnunId9uMSdRAZ54daRYf4H+dz84o357QoOqbPOMKUvnD+qonPFSaolR3pC1JgEaJFip5ksuAxlXEcJWZzHCYaL2rHUvtpHoLYmPyvpAmV1WB6CcBDutmGSWUJxmN7YKqLULCdi67VygoTszJoxE4qce+7dDhNvzAWeNNK0OffcUdrg7ipc1RYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU8XhS1HPKj1PkkC1+4dy3LkzbcGz3Rrk0gnumAQrWg=;
 b=DKraWgMYi5ii+TB1tXEq5mZPTeStqNHNxW3aZSBwRItcPE+2w+JRL2rofhPQZo2EKs03xzM+MZ+NfQHJd4aVm3rzDA/R1htzZkiZBXEh+Dc7AfTd1K3ikswAk/5XOYVLqfXKqDugZ+Z4yLJZaFZivO287qw+1W9BargSducE388=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB5945.namprd10.prod.outlook.com (2603:10b6:208:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.34; Sun, 30 Mar
 2025 20:57:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Sun, 30 Mar 2025
 20:57:38 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix arg3 for sched enqueue and dequeue probes
Date: Sun, 30 Mar 2025 16:57:36 -0400
Message-Id: <20250330205736.10970-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0041.namprd08.prod.outlook.com
 (2603:10b6:a03:117::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: d005c54f-f902-4b9e-f019-08dd6fcd80f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yKzqg5+nYgEUVTPCz++vrtg+T2frUokswbN6WPdIZ+DInPhwW47XnZmJNMUg?=
 =?us-ascii?Q?Nrq9mSW0lAqaQvF6k98Ud2uXCZtejNTA2hPcGaFSU3ogo9WLyVvYzpGh14Q7?=
 =?us-ascii?Q?7ip8Rz6DJsmLZbZF/aKz63vQe5PDDRSEQOceY56UQ4Sghpy/PW5UZ0YVvQz8?=
 =?us-ascii?Q?dN82Qhs7zM/547f3bYqoosTI3kra3rmtykXSHLcjQZunWjH9TaT2fPmZly5q?=
 =?us-ascii?Q?W8r/V0yEKdRQq8+r2F7fcyuvwPzMDJz8XoBa4n3iTsOUbuaJVx/DGL2Ooiv5?=
 =?us-ascii?Q?5riuZhldIggnx+VcB9B/hfmSea0HDjXmw7WqTAR8l+gMxrQd/0c/mKQvwR/p?=
 =?us-ascii?Q?kYCQSvgeZQp/8WkCDZ3LrQyiy5F7vpsyXXnuNy2uLsYZD1VE4X0osJZXiMYI?=
 =?us-ascii?Q?mbS4NMxh/24toVSlPptyb0GgMJzWPWE5a76HwZ5E0iw4AhGkqqeZ/XdlXWFm?=
 =?us-ascii?Q?efG22Leayib/6Ft+5PYJf9qJmftoK5KnrVUG4mYFLAPhgacMx5lQxQsAg48v?=
 =?us-ascii?Q?kx2SBktsM7jMwiv/QtikQUPEvJO3oTNEFZj1k5s2TXVg1ap6jV5sM2V3uXSH?=
 =?us-ascii?Q?UCWoi7q4AYb/yfP/vZdBzbnv80zJ4DTl/EFfDy4/Lz1Dwcyltm0ZByixw67e?=
 =?us-ascii?Q?32fNDwZg7DIsffYL4vumyVISn7U8TO14+jf5PgMfnIB6mvj8cfdluAjyfQwB?=
 =?us-ascii?Q?nmBhjKVMfRsD6DEgjX78efUDxPfKHh8Fa22fb/Uew4kTN8lEjYtlg/2ZEGrJ?=
 =?us-ascii?Q?QhdY7CK57hOayk+Dc6JmhkjEfy06CS6d6VB5KlcRdy/gRFpkpgzq5+VLWz/s?=
 =?us-ascii?Q?0jbi28vTB5cujzmvts+u01ncBjhvKTZG+TmTKwYN3MNjeIGHNQ7P954Gqgcb?=
 =?us-ascii?Q?4nVYhtlEdktrbl86Dp8q96if7PE3EOMsv28kpOiHpaRQr8pFqT1PH2lf0io+?=
 =?us-ascii?Q?EBos7Dwjep2WXJzJ4W/VyOLMUf5JA+LWIsGLMMDdtHoy7ry34EBmAqXoqhe6?=
 =?us-ascii?Q?9tILc+nnH7jIWmPsQfs7XPNi7ugo3H4xedycqhrvO1TPjHwH8QH+xTPNDqiC?=
 =?us-ascii?Q?KZh51POpnY4neBZA6j+ThGPyS5LhBdJpBU7ij7XiGiOSx+SWa3mzzpSEcatP?=
 =?us-ascii?Q?qFwXR0GYZxQaH5XcT5pfyIhhksXrlVQy1Y1BFgmETyWUubPAU0ByXqKhdMWF?=
 =?us-ascii?Q?6qVXZRdn9ySROLPE8UsvMh+eiDcLKCgVhwemfqXlHCUJn5/EAXr1TkNz3us7?=
 =?us-ascii?Q?h/emO0IORS2WscZqklipY6sjDH2B9Mfi2qCDBI9MLhzHZluRujPqZfAw+cnQ?=
 =?us-ascii?Q?RZm8Gfr6RZG/e94cuOEBmnI37/C83bh7Lbx+uyyeoE+LmewpFh6US3rZbuxw?=
 =?us-ascii?Q?Br5B1lptwiKuxKnV4RDoTP2+0eF/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KmMdIm0wDpgYIrEi1ADoyi6UDkenaGj5TcBXQYbK4gK1neknujRDQKihkYMn?=
 =?us-ascii?Q?mr0NHdZhySb8cH3IwmTRYYumG3q8SDIk1fsOlJyagiV0+lMaQvRir4pGjA2p?=
 =?us-ascii?Q?a47ZYdCsBGGlP17ukaszc4M3xJ5Tm/iQVRYpeQE4yiO99dhD177BZZSbwYA0?=
 =?us-ascii?Q?FerXUPMbfOuYPBc8CXhg7a+Lba1L8fQF1k1OBi7iO4kb6GMSlT9ASzl2Jlgf?=
 =?us-ascii?Q?31ZWNCm+h8U/cTSVfhv6izaLhRd/C0YzIOwVfghHsiuWrpjsQcdd2jm3pB/K?=
 =?us-ascii?Q?14TQnQ4ImAce4NCHr+7cCPTgQoYeE0f/mJ7uWyjgWZ984okpRDIacFbPRsFV?=
 =?us-ascii?Q?NSSeltm7yt6DjcafbCDmMElOuAr+Z+lA12fUCXJrKKrkpyMLiQVoggcSNwCP?=
 =?us-ascii?Q?ZztN3gNrEi4MFjNGqo/DfQ3TBKVGbySdAy4DS4mwuMoNHRyabGknQjqFfXGo?=
 =?us-ascii?Q?iDWeNpAuXZsfo+RbmR0tDoYEPpyQaW5MgrMJtAzt3viCUDXpIpjrPZnwbNy9?=
 =?us-ascii?Q?euH1YChgVYkqWkBG0MeDkMxUzweL/zB3MqkvUiCbOxy53wScY4rbx7fNg0O4?=
 =?us-ascii?Q?ZnT2z2W67BnBNlxMzxW3ywAxJFcMM+xcdOJYAsv4xvyXRftTqNf/ohkS7q8F?=
 =?us-ascii?Q?l14A4sS3IPCB88ybnHql5m3KgljO7M1nKvfhhQeVB+Kuud/Ee9GGK1J5YWK2?=
 =?us-ascii?Q?lBYhSELZJMTon04001PrQDJiBK8lwiC9IgzSGBNleMTlS//BFycc+Dm1XeLD?=
 =?us-ascii?Q?K4P8z7sbxmBaooMlQDuALcPQBBliDsjGG4n+TCht46xnVNf5bnQh+HpDXTi7?=
 =?us-ascii?Q?xAVa8Rc0iXigxKtDCAlAnMbdrksLHi+FpBxt+2rC7MulRKwqWOrP+m4PRFbb?=
 =?us-ascii?Q?0GZ/7iKNQuAjqwGP+8qAt+OL3y0k6WpLW2DsbE/fJvuHky31BUvlNmC0pME0?=
 =?us-ascii?Q?8xYJ0hNCFo1czDlpIHC+ynYvRBO+L1LCcDKVV4Z8xzI5+RNNbmEVpWtH+AO3?=
 =?us-ascii?Q?XElEZBes2tajrkc6+58n9Ops79dXkuuZ9zq44MiDtwPFahvOCj7qfujHmlmx?=
 =?us-ascii?Q?p55sloubRUTw+ys95oW2LNTGpNvYgCNlpeZmVFzU1qGxLFHwLCVV5MQ7CMku?=
 =?us-ascii?Q?JCHMv9zMZ3yxz/g2dkYEW7LqC62k0VxdGjzgRsZ+xdzxrxo8Tw8oBvHFqgoe?=
 =?us-ascii?Q?GOdcK5hScbE1bcsPwNkgFKL4cQjddK7jR1BbFO7VYyrPPtj2v6uOg6zcmaYA?=
 =?us-ascii?Q?wBEtObWl2xDGlW0gEphcYUk5iXJH4zegMz7ZSA0oY9wwFtfewaXR95aPmsr1?=
 =?us-ascii?Q?XL3RvKBQoqUDrsNtm1HiP0YJz67rIxRhIdXHGu1skp8Hmpr5WOdn5SpSfAA7?=
 =?us-ascii?Q?j275s9RHtYXEUxwCkaGx4ZUYd3P1GKB4cwDGnoXEd1G1o/60wu7OXpBlolFX?=
 =?us-ascii?Q?pYYNqk7WXzA4uqQNYDAzdbFwo2kuqvFFYFwwSdCeafr7udfFu1qhda036bqK?=
 =?us-ascii?Q?rjVyN/mTNsUX34FTxQvV/uaIHTmlXuky9qguvHMgnwWpoRAUBwmjA8mMj9xK?=
 =?us-ascii?Q?A/qr1pU8Wt0rAzRhVsQLb3CXi8+B4gWlxH/VI4wz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rKEuAXjyfTqIeZiNl2B5KDa9UXEFGG11vRK8foRFT8VqDhBPOQmTan3A68gkDB38nMlEUhAz6u9mjXCFXo78Ub3WEkCPLhL7axM0tkf8JG+Bscb8s/L4PpOTbV9nzdaS29TV0TZZod7qzO8JMnor9jyUEOGv86sX9SWZrB34tSQnaPoprrCXaTuphjmMQGsBCnIkoL5UJ76vdAYPXnl67zvbms6UQmIsTh12q9gPLlgDpfVH70/uYmlKgmvMLCTcn+rLVzSguPEfXzLvNtCmO052xiMPV2lSRuqZFAux4eMMawPxdX/rlkO0pVxhB/3EhDbjBl+KADHhx0PD+oPfsw19FmHxayGjSZFsi/qpNb2WblJUbuj4ZCI1xAvdTmVAAtW08J0VzaazxD17Opo4b191FyCiPu44RAoWPtnzXZamhL0hD4PqKST3DiSOTu/MU0jivOShBKObK1PkzPQE/76SEZA5cLZlCgH7ts2F+16VqPk67gKVfvRS/mCH80zXbKVsJ9w4aJ+aoWmFxpxjj7vXeFyryXGcNGqd7M3UslJ3VsznDvHcVChrbMsEsw+zEcC00ZKnYYOvb6rcsqSFgXgrTUEqKJDryrZyw4KHuXM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d005c54f-f902-4b9e-f019-08dd6fcd80f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 20:57:38.0974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZHIx9v6+VaWDpzV2J5ZsnNDHi74QUvDG2/JidFj/X5JlE27EzoOSaE+FFEDK9hUfJNvbl7F3G1VpU5BZ93ugA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5945
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503300147
X-Proofpoint-ORIG-GUID: i9xufxVV-3Rq6lEysAqSS-74WRtSZevk
X-Proofpoint-GUID: i9xufxVV-3Rq6lEysAqSS-74WRtSZevk

From: Eugene Loh <eugene.loh@oracle.com>

For sched enqueue and dequeue probes, arg3 should be an int
for enqueue and not exist for dequeue.  In the code it was
the other way around.  Fix this and the associated tests.

The trampoline was already set up to get this argument correct.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_sched.c            | 3 ++-
 test/unittest/sched/tst.lv-dequeue.r | 1 -
 test/unittest/sched/tst.lv-enqueue.r | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 125d58917..3a218f3cb 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -46,10 +46,10 @@ static probe_arg_t probe_args[] = {
 	{ "dequeue", 0, { 0, 0, "struct task_struct *", "lwpsinfo_t *" } },
 	{ "dequeue", 1, { 0, 0, "struct task_struct *", "psinfo_t *" } },
 	{ "dequeue", 2, { 1, 0, "cpuinfo_t *", } },
-	{ "dequeue", 3, { 2, 0, "int", } },
 	{ "enqueue", 0, { 0, 0, "struct task_struct *", "lwpsinfo_t *" } },
 	{ "enqueue", 1, { 0, 0, "struct task_struct *", "psinfo_t *" } },
 	{ "enqueue", 2, { 1, 0, "cpuinfo_t *", } },
+	{ "enqueue", 3, { 2, 0, "int", } },
 	{ "off-cpu", 0, { 0, 0, "struct task_struct *", "lwpsinfo_t *" } },
 	{ "off-cpu", 1, { 0, 0, "struct task_struct *", "psinfo_t *" } },
 	{ "on-cpu", },
@@ -128,6 +128,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 *	  associated with the runqueue.
 		 */
 		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
+
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
 		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
diff --git a/test/unittest/sched/tst.lv-dequeue.r b/test/unittest/sched/tst.lv-dequeue.r
index 7580a8abc..657667f34 100644
--- a/test/unittest/sched/tst.lv-dequeue.r
+++ b/test/unittest/sched/tst.lv-dequeue.r
@@ -14,5 +14,4 @@ PROBE sched vmlinux dequeue
 		args[0]: lwpsinfo_t *
 		args[1]: psinfo_t *
 		args[2]: cpuinfo_t *
-		args[3]: int
 
diff --git a/test/unittest/sched/tst.lv-enqueue.r b/test/unittest/sched/tst.lv-enqueue.r
index edc5e2c4c..2f5efa30c 100644
--- a/test/unittest/sched/tst.lv-enqueue.r
+++ b/test/unittest/sched/tst.lv-enqueue.r
@@ -14,4 +14,5 @@ PROBE sched vmlinux enqueue
 		args[0]: lwpsinfo_t *
 		args[1]: psinfo_t *
 		args[2]: cpuinfo_t *
+		args[3]: int
 
-- 
2.43.5

