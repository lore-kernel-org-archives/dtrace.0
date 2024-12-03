Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B1F205AB3
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733256971; cv=fail; b=f+IFQy+2pD8b+HLIbKPE19T59yydWUZwMr5ewiv5Jv1fOwZceI8VTRLRz95t6RjTssq++LP3O2y3f2Ug20aS3UsS3hZ9kceJBXKFDQeo/4A2CDfCUBc8pIcNRJyTD20u351Jasqwhf0DUqKZTtMdRO3sGgxwOXkqEtsLlq0MLGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733256971; c=relaxed/simple;
	bh=1SACAMsRL5qADRRK3xnQ4hQR9KSmBmvxjHKgFWyxMFc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SxXbXqeBmsAz/8fLOKAZ1OzRJ8od+OoM9/gWNZewVnW7YAiKkSMzjqNX3Za3nGTXUXUvUciUblXLsnWrouPtJg78JKtBzorKToIa6QBpdx6s7+RW2wbR963buHNXi/aVwjVDmIsQq1hYks/kQNgGztqJ9PAgxQEllJrKoMmwF8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l/rgt4xs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zkOQc1kV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l/rgt4xs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zkOQc1kV"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3KCHJo018704
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 20:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=CHvHMXRiKMPkwtuUtj7HSkbiTb3/eX4yrpQh/VSUw7A=; b=
	l/rgt4xs83MaFUKXsA5SlH2MfE1X5uH8+VdZVIRIKKta7ijGYDU4miMDO8ngVvm3
	enRuUS0P8fBVglt+3EqGL1EiDli4yHbHem7iDUYaNbJYXItaYj+gjcsOHzNhVJkI
	czGoCj6+DKu4YhQe6pUj9yMfkAxAckuutJwuaFIS8aFLJ0FbQQJYVX5lvG1lUxd9
	kqWLAYUqV+8eAGtdLFuw9RRC6HGbQECn0sBlOTAmvWIz6E94HfHQ3TnAT4jzCyDL
	j2+dr3YUAU+SGxoWA2W7ey5C7b4ZVpC8T3mWIuEvAatRlG8NoZx9yB6hyIPOIxqB
	p3/zp3rlc7+zUiG7XQ62zg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbq0ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 20:16:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3IlGpN031438
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 20:16:07 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836ud01h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 20:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpXbyiasoH9xQQVXr/bTqKMmD+X7QELXkR8sC3wEtEQ3802nD35lf51Pxw2gHtr03L3tCcB1RWAFcjDIKh/EpEywMfEvD9EmDbDuhgmWI6O75aaJqbX/raPvKw2LXxOONPFkU+HInEfXDtrVqEnaWstVSFkiFWdKukYFTCERpOgkO5uupL7pdhAD2+55rrh27Jn5tZTCfBrSIB4NTkxxghBaVAbVtCl2PBwxiUQLSdsVL4II4DDE4gSgkMobbocYUshU5cHb6lEBw1ByKCNcsD67Tdfy1RyeN0QrfRXhQB+T25Ln0bMF1MX59KfeGDVuDPuDMkHC7n8ons5STHtT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHvHMXRiKMPkwtuUtj7HSkbiTb3/eX4yrpQh/VSUw7A=;
 b=NYwV0nGjDxwP2QkYle8z9MdYfyY/LwBPUbXabnZA4iWHDvFrC8q55m1D143MLfDluGgPc6I/IP2yJrsLPcTot0CRExGvnrDTUpu58KcYgrmswUNPsDZr4M/DTcdGl5Buq2UZngNuSPSTX46U2HRxzww2yXIKn0c1hVpzWJnL75mb6fYcoSIx3Ux6X4KVjjrwsuyGBrn0aw2vpUi7JNYZjNMQ5sqUOtBzy1PesYYMZi3ZDYAaOV4XkWu+mj0MwVK0lhWr90IUdbENmsqHtzUKxYWOt3NIdtlsxhNbSVYvy2u7IdKDztUvN2fjo2ycb5CLdH2KT5XTx893PC4exWS8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHvHMXRiKMPkwtuUtj7HSkbiTb3/eX4yrpQh/VSUw7A=;
 b=zkOQc1kVtLRDNAngn1HgtXoHOPA+ZrfnsNAAfLKGEiAyghfrO2sxfh0ba1RVySxNLH5ZNTOt4I0wieXWUVEFucC2Sa2nka49lW1aRJ3pNMITxhCn9hIkpy27keQCq213hAMcq4hRj7RIU+0fSkdrlJLgt9EBdzvPD1LR/x/9Utw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5813.namprd10.prod.outlook.com (2603:10b6:510:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 20:16:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 20:16:04 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Retry umount if necessary
Date: Tue,  3 Dec 2024 15:16:01 -0500
Message-Id: <20241203201601.28787-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bd038b-8a60-4221-5609-08dd13d74ffe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wQc+GM+3Bnz+ylRkZZ3u9b+6+DFjYjlzbkg3yMTtMskFYvMhFc7/7/uB5kOx?=
 =?us-ascii?Q?ENFWLac4tCpKYBillG22yJQGdgT31XcHqaVblk0n2cDHQLG0UEdiVW9GGWVg?=
 =?us-ascii?Q?SvgmGtzOTQ53Is+8VNwWLJjidFgPK3L/ryD3gHnb/H0Fw0SqZfJ5MqjfbeHS?=
 =?us-ascii?Q?cOxKAJQPmcuTGUF/S4HV01LQ8pr5YErD/jULQG3KiyHe9NvejMJzPak9gn6E?=
 =?us-ascii?Q?uj3ikm87rRsQUj7lY6dYfBuc4rdQ2TN1HNM9ims1T89HC0OcWbWQtaz2tz17?=
 =?us-ascii?Q?AfvegUww89l2hWTKX1EdLo2qktbAAhkNlgO6JuYklYtTK2EKav4EkkXLkfy8?=
 =?us-ascii?Q?PP9975ahwa3Go9ZNcKekPY1hDyCkR8syP3o37MluSC/OFN0jPyt26dw5E3Ap?=
 =?us-ascii?Q?UV/42KaVzi+IDJXpTkly0GDGh/5TlAWXy1lljJGAEtF8gDzF7+FzuxaDWUdy?=
 =?us-ascii?Q?XqUZWXKpb02an8Q/z7VJrTWErHd3+c055GrWA6dCdi0G9GzMYDkC3b3oLO+b?=
 =?us-ascii?Q?QfIkoEtaQty0yOkteGiSsHcZhNUecLUW3lKilPVGThTNtvUbSrlNuuBDonSy?=
 =?us-ascii?Q?dcLhYsiWCycVaIvMrrRTmMXSqPqPHCcgXAd7IHWzP0yDd8IpShtFpTIAB14B?=
 =?us-ascii?Q?4CMTMj80DDaAYoeBDqPbJ4tF7z2SLM4k1nbwG0YY5wI4QfhGaS+5LN/s9o2A?=
 =?us-ascii?Q?Vug/XmY5emdAZlzGhKzjIcNmQslLppgBVZVviLCHLawt0oKpcahmcOpXMUt3?=
 =?us-ascii?Q?nKww0pARjLDENvqM52UpObrNdLPLjQfoNxwEPygXmDNQaPKXcNdGylYq4+/J?=
 =?us-ascii?Q?4gbKxqqAawSTUh7UbxHLMCjkJj1p0dNXlgAhTOSWtdGqnGAo4xeC68g5o60u?=
 =?us-ascii?Q?X6/n4i1SdgmnDYvsp63lZBUzZVyvK+mvJ0BR9800t2wz55NNS2NslqWQzxaP?=
 =?us-ascii?Q?YVnvV+Xj81alS4H6iLnaGu1y12n+9XcY141TUkvwUjseJXG1SNtG/8HDxjFT?=
 =?us-ascii?Q?Pf1FA/5YVw/eTaKzD+xH88eNMXKHOF1UrTys/T3ctac/DmAtS0QY53skooJF?=
 =?us-ascii?Q?d1NjV6PmnKbdmImjmpD90IUA9Fip7feRBhFMzif/3MyCMftySKAtaaVCJdl5?=
 =?us-ascii?Q?XXlqnV6yV7YHDmMPAVNBsowOqaCI6EOQPntcWMgA0kdf8UgeJODv2OKR2gBa?=
 =?us-ascii?Q?sINegIor/8Uy4iJGoMEXM+WYKh+V3PpXbAb9os4OFbT7r75czswDaT/1jD8j?=
 =?us-ascii?Q?zXd6xrltfIFqNudDWZeusKXJAdw9NJRlUAkKv2a8PHHWgYXg7755a90If+ZE?=
 =?us-ascii?Q?WvT2YIoLo+HrGf3T4MJHs3ti+u1wrO3rWwGfi2UjGaYCjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uFDiYCLnHQ1rZOp/B8xl+cdx/TPxXnFJK4t1KFkzG9Z+sSXfVeU1o6J+97XO?=
 =?us-ascii?Q?twutOE+rcSMqW96fpd7uMhBuV1ziM+ZENH00zLPvxI5X9ShasFmsY2pKfWIw?=
 =?us-ascii?Q?AsshT8xM3LXJ4jp8Df4OHbYXrDQ10Hi7uf5TvOpMXJNPHSwv5T+GznyHg1fF?=
 =?us-ascii?Q?60OlXELTSPElxc6OHqsagiARZ+pOb/Y59C9nWk0vy5Zgq5LYIkS/oeYKowBw?=
 =?us-ascii?Q?Rhs2t6fL++jDVvYboPRzPf5N3JdrMddUU51LlDAu89ARh1Njn3cYj2yBP9T5?=
 =?us-ascii?Q?D1UtAIaplpp3iLwMg3qDinDxHLbcFAv9tj2Wo6OgIPGhBuuD+r7sHKKdDeDd?=
 =?us-ascii?Q?uBahZoswCPyN/5w/TCk9s50wvXm6SZP1AqGefLsWnDthGpBx7zoo2aKZvqLZ?=
 =?us-ascii?Q?nYuDbRjlp1oBPJnGP1JVQ8d1Hn6BMy8cGtZQNgCq81BmvRnR1ph1232p3n9u?=
 =?us-ascii?Q?YXv1OkUBgrefY0b61V46vrGKfUl4xEjSIrKyrVvVD3E6SR1b9T9ZVw1vZhGy?=
 =?us-ascii?Q?SWlvb45VS+H0pU+pYKn1jLfSI3hl574QcT+PmLPfYvcAQXqjf3tlJxd6mdT6?=
 =?us-ascii?Q?Pe9I7b1aWIRLABVi00AjIzKi1Dmm528KDHwxnW9YJkCOHieOApII54H/lqiC?=
 =?us-ascii?Q?ma2UW2UxZtNqj/ZWeYXW6r2GF91EMZZYpi8ZSqOzXmSS1eISYlT0cN9y4uey?=
 =?us-ascii?Q?QmlligC1duKFF2nJYcYW6zbXK55x3FZLihgcPjaxj6FsWHMAXF69kXQvkqQt?=
 =?us-ascii?Q?rO5/apfv90nxw0O5spmL+5/6KKvfralHxIJjnm9pRhqPLZUK0uZwTztQlKZm?=
 =?us-ascii?Q?XzDDYj6PSDux29OqMNIUOIsZGqYaWeFnRUw2GDMtpqnM/HAYcNUDcxVbi+y9?=
 =?us-ascii?Q?CBtSNhTw9G85O5uw1UFH8L5nDthGh2apGkSa51FxyrpHmgS0YY4Qv7gh7hux?=
 =?us-ascii?Q?WDcdGu7b+RPaEDrqPqSPBPtn/2/KepJM6HCCEyiH0YOIMXLCuac5vplgiyl+?=
 =?us-ascii?Q?sgUm/Lzfmiy2AXt24BXFfXgQT6OB9VqE5c94pH6D96bKnEuj9rBjQotMXwdG?=
 =?us-ascii?Q?/UZ6mGAM7EUk40RouYQ84bO/DLTKs6KHgLglikIbH0GAxIUEoC/Ie5JJIwvE?=
 =?us-ascii?Q?t58AGENd78O+ExLsBjnxR7r4iniFtADuLxUwKPtD0swgH8rE05vwlk8Ou7JF?=
 =?us-ascii?Q?X8hbtD4KJkLlHiVTclyafD5F7vQcIuxffnQ4rq8k3J3/MyDppGTcvuqn12ud?=
 =?us-ascii?Q?ElZhIi8tju+7QFQGJqYsw8VJ4orOlIQL1cMidWHWFSnSOSnYdGSmRUu156xe?=
 =?us-ascii?Q?gW2OZ2Mjb4kk5R5o1oZ/8YnwPFuYIDAyyqHlsVFsNs+z0sf3GTMavWDzhyVh?=
 =?us-ascii?Q?O4YvA8poPppjNnM6OmMZAyDpvSMSoz++VF3Yj4jJeVSXxB0MRJOMLlZMDeAB?=
 =?us-ascii?Q?GuHdtE4MiG+FmbwxKL/OUkyb0ADVvMKTeEXX9PmTXtWhvGfrk/fNRdXhOl0y?=
 =?us-ascii?Q?bw68HOXvUwp2G6WPnj/MwyHkg380t5IraHPAgf/vYiN7aBtgnxVNuN7GDvM4?=
 =?us-ascii?Q?SbhJOg7l2U1ww1o0iU+RZU16XtqxfihW+oEtBikF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nCT6pptQbZj8X845+Ev95dqZYz/SJMl99rGRvp1O/h2bdlokepAa6op3zH0Z6OUu6rsFW2br8uW5/bm+1evTiB0fDulEVZX5JWi1pGNHOvj5DPXmDymdOwxYAC/0E24P9BLr5mE8qc6PLFcusGKyqoiEAccHCNNKtUeWLC6Y4c1YqCGE6ty4wxi/17vTjMT0+Rou5anbTQTmLQro9h4YPWd9Y6H2Og14db2qVvyd7eVR4YP+ukzwkwqHMyBw8drLSumRnC6tDedrrcReBDx4BLdQqALqR4k/eAiTsUGHOm+eFof6CkP24I+P0x5xPnwPCxDq/ob6gTa1xXcK/dWivizUo2YDCg9uj50G9Ryqm6FsRorYowB0vHRELfeSHvM8wDSwz5q/7Hvj6/6NoDVGyW9fxQGLRPoQ7WR0EcYBPhRG3A/vxEgcZ094SAq88BT7JNka3YEskOwgh/akL+/cQ9ab0odObpni7VXCTFcgYdXBCFq8ZfnbuiS0TWNuXEXHkBIJHRBAxpboN2jruxG7CWStzK6Gc9sTrV5zDD6XBnc54yt2fvDwX3hj5wBzkQHcGvlamRGskzWZ7EX9USpuqCpxYjpH4OpTNLbHuDw9zB8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bd038b-8a60-4221-5609-08dd13d74ffe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 20:16:03.9814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJWPebNMKJRd68CoKLlOMqBMOX8Jz4MDMyJmCuQdkJQc4EkNg6mMwPMRfzoUvvJQ5yNlcR1FdncBIijEjlA45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5813
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_08,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412030166
X-Proofpoint-GUID: pHx-l0KQrHRip4CNiKAU1GbcDpySGOCx
X-Proofpoint-ORIG-GUID: pHx-l0KQrHRip4CNiKAU1GbcDpySGOCx

From: Eugene Loh <eugene.loh@oracle.com>

The io tests tst.local.sh and tst.wait.sh fail with some frequency,
with error messages like "umount: $iodir: target is busy."

Modify the tests' dtrace trigger, doio.sh, so that it will retry
umount a few times, if necessary.  Specifically, remove the "set -e"
and individually check for and report errors, in the case of umount
retrying a few times before giving up.

While we're at it, notice that the two tests use the same $iodir.
There is no need for the tests to be coupled in this way.  Change
those two tests so that each test has a fresh value of iodir.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/doio.sh         | 29 ++++++++++++++++++++++++++---
 test/unittest/io/tst.local.sh |  2 +-
 test/unittest/io/tst.wait.sh  |  2 +-
 3 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/test/triggers/doio.sh b/test/triggers/doio.sh
index a2a39c245..0171a4b4c 100755
--- a/test/triggers/doio.sh
+++ b/test/triggers/doio.sh
@@ -22,15 +22,38 @@ mountdir=$4
 mountarg1=${5-""}
 mountarg2=${6-""}
 
-set -e
-
 # do writes
 dd if=/dev/urandom of=$tempfile count=$filesize bs=1 status=none
+if [ $? -ne 0 ]; then
+	echo ERROR dd
+	exit 1
+fi
 
 # flush cache and remount the file system to force the IO
-umount $mountdir
+ntries=3
+while [ $ntries -gt 0 ]; do
+	umount $mountdir >& /dev/null
+	if [ $? -eq 0 ]; then
+		break
+	fi
+	sleep 1
+	ntries=$(($ntries - 1))
+done
+if [ $ntries -eq 0 ]; then
+	echo ERROR umount
+	exit 1
+fi
+
 echo 3 > /proc/sys/vm/drop_caches
 $mountcmd $mountdir $mountarg1 $mountarg2
+if [ $? -ne 0 ]; then
+	echo ERROR $mountcmd
+	exit 1
+fi
 
 # do reads
 sum $tempfile > /dev/null
+if [ $? -ne 0 ]; then
+	echo ERROR sum
+	exit 1
+fi
diff --git a/test/unittest/io/tst.local.sh b/test/unittest/io/tst.local.sh
index d3dbf1713..702c6f453 100755
--- a/test/unittest/io/tst.local.sh
+++ b/test/unittest/io/tst.local.sh
@@ -18,7 +18,7 @@ minsize=$((filesize / 10 * 9))
 fstype=xfs
 # file system-specific options
 fsoptions="defaults,atime,diratime,nosuid,nodev"
-iodir=$tmpdir/test-$fstype-io
+iodir=$tmpdir/test-$fstype-io-local.$$
 tempfile=`mktemp -u -p $iodir`
 
 trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
diff --git a/test/unittest/io/tst.wait.sh b/test/unittest/io/tst.wait.sh
index 016b922eb..24ac2e436 100755
--- a/test/unittest/io/tst.wait.sh
+++ b/test/unittest/io/tst.wait.sh
@@ -15,7 +15,7 @@ filesize=$((1024*$nblocks))
 fstype=xfs
 # file system-specific options
 fsoptions="defaults,atime,diratime,nosuid,nodev"
-iodir=$tmpdir/test-$fstype-io
+iodir=$tmpdir/test-$fstype-io-wait.$$
 tempfile=`mktemp -u -p $iodir`
 
 trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
-- 
2.43.5

