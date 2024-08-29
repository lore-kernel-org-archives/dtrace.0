Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00F13AC28
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908987; cv=fail; b=TSGe2pa/3qCFixsPvMkg1LpB3xdWjkph/c6ipTBWNCXME3Rr3VuVoUuNDf7Z/nR/lNV/ObJoWpN/aeFOGuJaUC764ceZgddQdAqPXtK8mqgW59OT8RjRcVEhnvlkeypbJK78EYiz6iKBUdO/Sm6dNY5ar14BQUVYijJv3xH1hZo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908987; c=relaxed/simple;
	bh=16kQJ+jVq3U5kpNqGgsWO0VlVce6iqqATU4hSJ1QoHo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u1s7H8lcFAq1qtEcYnXBpSWM5dqZ7elDjMUlepzJMkMWcdpxsE4qu1Fb2XY52/oNscA6r/MoKfpfCpA4LszPr6aZ/B1PUVNf7k8HzKVyGB1ft8950GWBdr9F29k5qvu3oFv4qs9rkMoJn7GsFO3PGqsw1Eiz2upV0Og6Y7SS85c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=byO2KxBn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=udi4enAk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="byO2KxBn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="udi4enAk"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fg02012374
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=kl2DRKxzAJyJfn
	ZB80nCnZXtv/3SNRCSB71i3v8m8OA=; b=byO2KxBndhyz32WM1+tpYzhotObLVN
	Gnr4xbcE9FpvobocyWGs+WwsP9V9qsiOTUuAvw7gm4hsTa5zeg1Fce7vIyD/DP/5
	5pG9UEUQhTJfoTdY+B1NkfWdTu+LYqaO1+jzGEJVX3eUCI8SvFUxubIzB3FEr6WQ
	xYJHXJYsCImOvru3YHRe6UfxzdoxaI+gSOhCPmdHfDBmoSIssMoonScaVL32GAPx
	L11FD+20O1qSH8V1yy7PDFnRCz+6U0KvOa5bHPbsvASSrZHwNoji7recfxALNWEi
	u0cc5LXZhM+ySR7fDBisMwYMiaQ1Y+iI7IoXQMSB2ZCfnwND926r+qTw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukk70c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3ZE5n009924
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894q8j0q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCHNofWV7LNleWag538qz6YdBcjjjgU7nLWnzPP7H0Kgll2Acz4si83mloJC8/POmGttS7Cqm3U32sNmE17hxSW2+Crh+9evrdKRC4Bj3jNpve28eTCVUleHm50fNW1xLRBfzm+dLe/5nseJvnDSeQJQVcq1EtOdXT9oQ1cIRg+4lWDn4Cm3mQHLiOA8yvjqzRqSiQl3YpaqGaWdb+S+X9N4C/pot7mgA9hMU+k1SiOWks+3yxg+Ft5Fib+tZOXt+eJMNbgl/+4RCbwY7N0dWu+gCyPBnMc/lSSeCsUgVCiyJc3gR9aQIIWP+s90ZprU7QkYVj8ttCQwhIeVIVWNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kl2DRKxzAJyJfnZB80nCnZXtv/3SNRCSB71i3v8m8OA=;
 b=yCavYDH4XJHclX4N6LFMm0gCtc/mHo2chfUhUpf9X5nt7LKBKBkHES0Tgf67kdQnguEqeHak8JOYXTnuONA5gZc06unnM6IfgYMla/1s+N/WhQlvzY+b9AbXqFmxPmIFPlY1DTi3QSKf9tyr7dh6QlxnIJb6DDZiPu3kPCcFvvFmJxAlsl5S3SqRC8zQuoNUdqEKw+QUv44lOL3LeqTsvglkJxHNH4fAclbLLvE/xh2UEJ/bqnhH8AS4Sbw6o3VTGBm3U7rToa8y+4TY7G7QkuHsncoea69wE4SsKLyiBJ9rOQviXUjyVlSV6ITzS90Mn0pB80SkBIkfKo1kXctlRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kl2DRKxzAJyJfnZB80nCnZXtv/3SNRCSB71i3v8m8OA=;
 b=udi4enAkfcY3zblSjyGaIHyBBnXrQByfxePX5uGdGOYuUI/Z5n14zupvUNunjWkTSv17WCs3SWcxfqlrqP3tzGtveE7JX9L3ukb0/c60tXpTGEvGaFME9NO/lHzE8/MGsCEwvp1a/A86Swm3hKXrBmUicVImCO5v+oSGDo1Wstc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:22:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:59 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 17/22] test: Tweak spec sizes to bracket size jumps more narrowly
Date: Thu, 29 Aug 2024 01:22:14 -0400
Message-Id: <20240829052219.3234-17-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:408:ee::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdf8d00-0af0-48bf-f76f-08dcc7eaa587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x4H0CdFa8lMhEGnvYBCEHhXFwHsVAkbFl0sT9qkrOCZv9r6LSRFCDskfC5sd?=
 =?us-ascii?Q?WP7sdZBYAeOvfLwG4IcgWS/0T24c7FbGWsy8k4Q2FtitOo6YDO6oLC+75InD?=
 =?us-ascii?Q?nEyET0a2MP9XNBKTGaeVxx9BoZ08kLJ/LujhqdJlynt8ZwEdM9rSbp+qRiHK?=
 =?us-ascii?Q?xusDkNZTx6zKfbKPC0XsC+fZLt/of1i3eFXz1gzGSYDJ6qphwWPooyP3TxDr?=
 =?us-ascii?Q?Nn4p9mtZqGnn2J8ktXyGqQkVkq7R6+DNFtZOMGQTU5je4qwhy3jTrx+yHwEs?=
 =?us-ascii?Q?xlr584eDUadEIWN4Cr0r6RRC3rEn+ivJHxTTikUu9goGav8SI6fNlDzFmOXb?=
 =?us-ascii?Q?vKH5JY5GkwA12NOyPtCfRk8HS2Di8bX4AIwUqhVuU3FwX7EiZ1xd3NxAqOzq?=
 =?us-ascii?Q?urmNZ2g2huG4EOSrZ5TLXshlUZMO6eXKIUzPjeCdybB85Szj/8NFou6buzAQ?=
 =?us-ascii?Q?7LxCSEBDOvpZLY03mdCipZLehfUEiDb8ILPkqrgEdpf/bmezbb+wQK0jVQ40?=
 =?us-ascii?Q?DN6Rqr/4/gMvKfT7Wu2AgKXvJXZsyxo4yrk3Z+IUc21oVK/4JcISOl/rrGvn?=
 =?us-ascii?Q?vn/u+0h5H5cPTYYSxX1SZ3x5W+GmQEVMw3PURDneLYSMKYPqcE+4UP0K4N58?=
 =?us-ascii?Q?09iGxKFzbKpVq1G6ioBGiFz8BAIVkqEvvZ826iRTvf0y2lpSWS7KW1tXvqvN?=
 =?us-ascii?Q?uAn3h+Reoze+oujvVSdCp7EKf5aympHNouJruROwXGGLry8yFhm7OvWqq/+0?=
 =?us-ascii?Q?YzhKtmouErKK81NhPwdKRT9C5zc0mj+6jIhqmKQrmd4cQ5zwcd/Kivq/kJeF?=
 =?us-ascii?Q?Rxh8y5T+PsjGAgpUkrORrkscYqq2dyQeuQMHXrM3Hyi4JuQnJbr3DUthb7cT?=
 =?us-ascii?Q?Lycr7jTLEnZaY5YLC+IEQXFEn5FJvbObFoHzYO4obKKI23K3xhDdcaMNNotW?=
 =?us-ascii?Q?4fZssbW1+PvRbay9mlR1HTKpEr+Ps/f2zBNqXTyOaVGbljRA8QBWK8faR+kR?=
 =?us-ascii?Q?RMBZW9IQVVB41x1QJQrPg0zSIx5FwA10/HsKlj/ao30qRABxHmGqxLcjE+S1?=
 =?us-ascii?Q?37iv+RpjHGd9C1MXB+sLu+yXH9FkRcPQ7BWjJkwhY+CMWECsoADM9nN1vCr3?=
 =?us-ascii?Q?Jw3wGbpkNRE4MdvargrlcK0kmfpMdltzX/qe8F/P8HfbN9tX4AnBBvGkRr2v?=
 =?us-ascii?Q?uHd8c2PET6qlacZDd+VhwbEncTtksGCLvsMqcwLPV74TVpyzMJtXzemQFmGq?=
 =?us-ascii?Q?61O/7oxQgpRyo1FXkk56ZkyMoJGkIPXKeIBQz7+mfsu3dQTl9V9gXXmUY7VT?=
 =?us-ascii?Q?LQ3Wpf/hM6X8l/qWT4CjMws8TuVayVbbtkxGOmNmui0qsg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZO/oYkVhC96GrLp73kTNxDTfua894kdlqyn5sdTSVaZOjWhIBNKTf5KAJ6Yb?=
 =?us-ascii?Q?ouJKIkLFHv/ed9UkWKtXuAzBCIYtHkvVsu4Qguh0sICJN8iUdHcdzo5LgYhP?=
 =?us-ascii?Q?Vjrxd7/W8s9GTTFfyHoR15rJsKjyjW+PoDksnhr6r4FFQKZRjwsTO38DadD5?=
 =?us-ascii?Q?enHMa5SJ20seeDOxQFti8GstuhJAcxPkN8Nezk/PM4SLLTuhSDI4lYYT5CaU?=
 =?us-ascii?Q?ZOslJADFMpoQP0ieCaNDeLlZqi7O8ZinuVncJfJL9H+BUxeBUZSgEmU18s7l?=
 =?us-ascii?Q?H32g6TTTpVPWxxTGZoaMcy/igQDGYFsMiVl7EXGRwp+pzjyj1jmEQsbs3tB/?=
 =?us-ascii?Q?x1zI06r0v1nLf4mrfHhg3EyCx7UVtF65p/0wcZSPnxtB9Ac4qSmR96MV3krA?=
 =?us-ascii?Q?PJKz3MuqCBVWL+Gmk93F7qs28Zjt2l0R46G4oUG/dpd+QXsPzzDOYsaShBGh?=
 =?us-ascii?Q?Zu57WN2oWN2ZC6HZD4NxIcUwLyNN5e3aiIsarv0qqW7ROe1lp42rHlGGSAUE?=
 =?us-ascii?Q?EPsfAm5VReivnO/aDlBGQh/7IuQDyCKB02JpGNcXze6C4DH5McTYQc4QtNiB?=
 =?us-ascii?Q?QdtK4LZKwtqLwI5CO74gQKXlFiWIX//6y0O/Rh2c1iC4zPkjSHEdzYtOXbvw?=
 =?us-ascii?Q?1AZ824OHMeubA2mi4E9x3ykKFCCkd8+7rzQChW3cCEpMAwpZ9f/Plp0t5WPi?=
 =?us-ascii?Q?Lt9rJBuzTteUx6m7gzdWgFYxrspg0kHHLTqdXLE4Fp8N5JPVHAMUW7LcQ5xE?=
 =?us-ascii?Q?qWl/cGogeth94str43rXCS9tDvr20k7TP53fEgHjRtZp4waY9G1eCwFhTr1s?=
 =?us-ascii?Q?/Z1Lxz4eP0AW0QPkkVhwlH1jFs1csjRCTZ7SVyMvgRQFzI0xIi5koDRG7lZ7?=
 =?us-ascii?Q?33I8Nc9Ux+Bb+7N0cGLMyScmPijjbtLMMM+YjvgUN0az1/75IXc/seNsd96q?=
 =?us-ascii?Q?6Wk72erOKJgtxWT0x1gI76q1uTY4J0a9Oh/uYwuD/Arah4CQZk3adnxxCl2b?=
 =?us-ascii?Q?nFWIr3kHpyR8vbpTG3TiYafI5aAVqMrMASiKUD44ZUUWjj6/X6n2dzQ9rfWv?=
 =?us-ascii?Q?c9ryB52T8ZfxhpvT/soeWheBN921hLcAB1AuIEg3W8isicfwbB7og+WXXqAT?=
 =?us-ascii?Q?c4Z5vvyMlkChNVJIxJNFDOAPEaIaWXkwtUeLxkM68atqUD9MZYjEKUwtpiUN?=
 =?us-ascii?Q?zjtf3OQ0EmW9uARWrrmD4tbANWYtXWU3cuf0fukbXHGnYQyBattnsgzNhQyO?=
 =?us-ascii?Q?GgDv++tsl20G/r0KTSGoFVTqSrJGzihAwDsRrHaaCAe3TXR8C74sIc6jF7mE?=
 =?us-ascii?Q?5MzzwZB85i0fKjp9jwlndbGvvWUbAOEsC7zF9/ojGlJ6ilclpREfn4AGQDBU?=
 =?us-ascii?Q?dfiiQmb5xfZOkWHVilC/W9j6M2BjLciBofveZqGmAbg6avMuvmdPfEw7aCv1?=
 =?us-ascii?Q?pY4/oNmJmLuk5ovABu2+jwRvoh/7r8tqbwIv+mmcEaLHEv+DQwtdDo/NbZDX?=
 =?us-ascii?Q?4z2BqWBweeJj2muCYBRFU9AFUJiYAE5uK4Y2B1JmdUi6MDBsVSsvlljGtpsj?=
 =?us-ascii?Q?gBBGw7aoVJJJAyfXtUXj+3LwoThnzFehwHiFb+hg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iHy7SO3WGIkyu/FQisP9MwQP318X5l0pc1dgz2cX35FUgR88hpOKIfafc92PJvFNeF6LDCEej0pxcyECV68vaVCfP8tUulCy/pZS7tDH3nbXFQXE8t1IBNUG7WU7ZwvkerA8+KnZEwwK9ztXslA/Bdz114hnmRgbL7oKSlSh49gqpm0IGyGVZCRhgHvGMZ0moqgSmgb4DkqjTM5B8zPOnJ7UQK30kWWpyKs18Cs5dlJHFKmIM1jIUGBTnJ9dvX35DPdn/OUJpAfkxpmmOP+TsEIUc0WtZajL1+zyHAEQZ2xj7/kIlkDW1mBbXoM4l9VC7hqkWRcsTsr5rZS9cYOtweG4PiUOp968FsNbEHGQoGgDHubQkqbCQbUvplujmcierhLgVXuYiL/FPDpt4hIjBCpkSPiTDmuBSc2bz8xdXTcyu9dHthZx97OhX0iXNDVcEIQ7U9jkW3O6D/WPzZXVk4yihhZVnT768FFwTqV2hB5J4Tm0YfA0ekerBkYXpoSUA3N0tIrsmvJeFo4zYaKz68dIrlTnmmJ3Lq0NqNyudYuKH9dGmml3lkEqK7o0kFHEv/a9b3fBL6h6XIAM1PfAZWPW+jHjVRDYcWdIMS+bOaI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdf8d00-0af0-48bf-f76f-08dcc7eaa587
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:59.5752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knx6gd+PvkWN9v2OLt3Qdt1hZUZWJhLxaA1KsP3+NkemLXlSMgS/SV1E2MEe3K/uAuj/LnVSEm/0eAwytbTYsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: GvZG7vivcIgTBBkDGXa-wqnYbfsJ_jAK
X-Proofpoint-ORIG-GUID: GvZG7vivcIgTBBkDGXa-wqnYbfsJ_jAK

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../speculation/tst.SpecSizeVariations.r      | 22 -------------------
 .../speculation/tst.SpecSizeVariations.sh     |  2 +-
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/test/unittest/speculation/tst.SpecSizeVariations.r b/test/unittest/speculation/tst.SpecSizeVariations.r
index 51f0596c..2748b307 100644
--- a/test/unittest/speculation/tst.SpecSizeVariations.r
+++ b/test/unittest/speculation/tst.SpecSizeVariations.r
@@ -11,26 +11,6 @@ Speculative buffer ID: 1
 123456706
 counts: 1 1
 
-Speculative buffer ID: 1
-123456700
-123456701
-123456702
-123456703
-123456704
-123456705
-123456706
-counts: 1 1
-
-Speculative buffer ID: 1
-123456700
-123456701
-123456702
-123456703
-123456704
-123456705
-123456706
-counts: 2 1
-
 Speculative buffer ID: 1
 123456700
 123456701
@@ -64,5 +44,3 @@ counts: 2 1
 dtrace: 2 speculative drops
 dtrace: 1 speculative drop
 dtrace: 1 speculative drop
-dtrace: 1 speculative drop
-dtrace: 1 speculative drop
diff --git a/test/unittest/speculation/tst.SpecSizeVariations.sh b/test/unittest/speculation/tst.SpecSizeVariations.sh
index 75e527d9..79995b59 100755
--- a/test/unittest/speculation/tst.SpecSizeVariations.sh
+++ b/test/unittest/speculation/tst.SpecSizeVariations.sh
@@ -9,7 +9,7 @@
 
 dtrace=$1
 
-for x in 63 64 79 80 143 144; do
+for x in 71 72 159 160; do
 	$dtrace $dt_flags -xspecsize=$x -qn '
 	BEGIN
 	{
-- 
2.43.5

