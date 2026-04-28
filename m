Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52A36EAB8
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777403076; cv=fail; b=deodLLJL1Dr00PA33zarB3cFz3cDb+S8439hejaMOv4w8ZA4JidmYiiNuhq5VjM0/Y6EW/QJAW8lWcbbRHQm7AYy2ZL35kUiH4vWR3tjHInvemxpwk1stZbKkzZx/bGfaIxYlzrLd2efXusrQy9/5ycVLdZHzrc8LCvI7ZW1TD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777403076; c=relaxed/simple;
	bh=Allyu0AeKdTmLV+09n2MLUM6xqt9KvhlEbRbjfkhhkw=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=qUY0ZYPylqlr/Po5L4tah87PT7q5nR/ONvJoGSbGu6Q6dB2JDKWCMJUTvhVzL5gQkvtQCxec9b9tYIUWo/7NjGPSwE+boO4PfgGFnDdOgQVf0YhhUGeI9CRmt+RMMrGWQK/z12MEbktLUXpO62gEV4juo9ggFT3AP3uq43e7IkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kxqpYzjK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rWdtTxbz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kxqpYzjK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rWdtTxbz"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SGmdoB1905274
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=me2M3v+J//AradyVLN+PluwyXwLLh/ijoUjm95TfXdQ=; b=
	kxqpYzjKy2877gkAJ0IakYh1csr3wi7WlkSULZ7/EvAFTkMi0LEypvr1f0INDY3Z
	8DLU6AvTbV9ysKxO+ACWaykpn215LoIfrDo/6REU0BaDQODUeBjAHTG/M7/Svpk9
	1lClxQ2VnlgmYeua0a7v15VvLBYQYjyxICr9LxYS22DLi8YhuUwyZNUY9bZqcvy5
	Y83E/I1+rlq8UlWQ8LUV3v2Os+CYFF+N+PGjZJjyy16ye/eubZR5ofpL3LyaI87S
	LYohOpxl2Ia7rlAN3pEJrCpd8NVoy0zh3auD/8tCn2Et7vXmYq+pf3cdH+iADdri
	JennKjE3Wb7aEdwjvthMow==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4drng8ggav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:04:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63SJ1Pjh034222
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:04:28 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012048.outbound.protection.outlook.com [40.93.195.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4drm2cfxux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Apr 2026 19:04:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY6dPLnCa1Wnm2TuchQOy662vKHabmIcaYxUdTlRwgKxRZHbgebGwwp8+1pETERhOwcMMuvGzFHGH7GAbqdxhbc8lGSWRFzpVJ0CnqqghTAA4pfuVk6taXbo/c2szXIMmITVYT0Pn8b2bCkDtLl+2v5FJr03/hFpKKyVqcRJdWDQS8sVfMHHSToeO1TLh3AQNMUGcYW9+bOjDlccjLQqa2my8rtn5b0jOGK/sWjDd29S4I/qju8d2tjoSHkRTlL9QHQ9trSTUUQguoNuqjrWOtNdC454JbCWLzx+Ad02d+ci+eWix/rvzdLqffHVkhe90fVdGpIUgmDYe5ZaM/IhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=me2M3v+J//AradyVLN+PluwyXwLLh/ijoUjm95TfXdQ=;
 b=QaJWjsMtDUj/vlVyXdDsIoulSo3dQXbdHWB46oXKY/s82fSmLr1onD34RxAc4RUAROViGl7GHxVuiiXOaLolYpf/9bapJYrfuHKYrl31aWMsARbzNya+yOsWHeXfPO0gXNhskP1uQ6qMVPn/0zwZaeZzc/LkLFGgsrMniKnTMp42EAA+3ICOLmX4mNG6qWYS1pGBtn+0P9WUOPVeDWr/DHxN7c6Hqf7P1n4Fc3NjreG9oiaXRDk1zC6Q74u8K6ZX5ZMOyqmjbCirM7qFUxRop58egiGLJe1YBJ3dX9VdbpRRd7N+Y4HfsE81p3u2FDXdM9ei+EBmbTGjxDAVEeiXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=me2M3v+J//AradyVLN+PluwyXwLLh/ijoUjm95TfXdQ=;
 b=rWdtTxbztAsCh15cuiMOWYbXu6eaGAN/LtEJQ30fDNO4fsEM6XG6VZNEAeA61gTMnkZgKZdZKy8DeGLrGovZg75tUMtO7N+CqEyfKBCXqN/CiICvqw5+F8yijCngpBNvT2t7HuHnCTe5+4dnfwAcSiuINP63PdyvfEG3KyRgI/I=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 19:04:24 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9846.028; Tue, 28 Apr 2026
 19:04:24 +0000
Date: Tue, 28 Apr 2026 19:04:25 +0000
Message-ID: <e2828289b737fc9b39ec532e617838f3@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] btf: use dt_btf_real_type_by_id() to resolve types
Content-Type: text/plain
X-ClientProxiedBy: DM6PR01CA0023.prod.exchangelabs.com (2603:10b6:5:296::28)
 To IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|CH0PR10MB5113:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d66bc5-3f66-4c17-ccd7-08dea558f621
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	iBfM8nN86l97wXMQKxF+oCC83aXlW3JQF6FV2kXOVBMDIjpjClWCVrthxCz9zrJsqBT/o1L6pyfqx4ZzMi5bwK1sxv43LR3FkQKKFABqFBVLe8D81LVkH2eryeW1x5DAiPfXYMGmCVi3K3eZl6Vp8D4yrHrkJ3p0uFSmDaSsE/8f48LOc8S2lhaZWRh0IuLJmx4RnX3ykSOCfa12L4eQqvlxWNQ1EPF+JwrW8mnFY1xdAr5lRMPjBnz+Vfm10O4Qvdd30ezUNqzl0LQonsCqmbW7Ty0oqimoDVhdofHCZFt0pTlFoQbORHVKsQoI2T9eqzAhR/j7VVsj1MYOAw0jntmJbQdWpb4voJpUrAX/2/gsnV8cpSodKvKUW7NMneSSLgYn0pB3ktKSi4R29xnOAJxJbklW4lSUo+kFvlruqNlcHiiRRkUJ1H0AfDV+Z5TjrZVNnRoYY6MbuzJXOqS8sQH/FbmPUG+LO7qHMCxk/+Fz8z7uHkDRct9se4n0/AZxQOIHURd7GkNdXEjEK+LB9bdaMdctFzjLb1dumxq4RnAc1DLKWb9c07aEvgEtGZZCcs0SDCOu29YdWdm5wdJTCf9lCgoesL84nfqqLXDeFvRpuaob5RmZjAILWDAoeGnNvvChcqRS/HPhbIHsfwWZxl8+89U3xHNZYtWfjErfPD060zMV/Li57sMdkEjc6f1A42AbwOrYbeBOYSLlZLEbm+ngb83EbyYp2hQxBrxLq2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ka3v9NzTsnFAuxtgssWv1rjR3h1ef1w/QtfqXkTJBsvXY96vxN7pysBODb88?=
 =?us-ascii?Q?9Gxkhu0XOV+453kZP/iMLCYaBgOsVdMer1w0lCwaWGCGJqA8FhOojcZ756ht?=
 =?us-ascii?Q?/le6dzElztllUSUt715TeCnEIuIYZUUICP5lOYhkDRz5DvW/SBpf/mgxL741?=
 =?us-ascii?Q?0H45Elap9smIFSwePBxHj8K4WCkl8Rlvr68+NZAdZ7fbwR8Iga4tZCq2SMN+?=
 =?us-ascii?Q?E9R+4JikZPGtqwVlAh4W7jLLplz/ZQSc2YK159j1+8XK/KgwxpK4VxwqFtKU?=
 =?us-ascii?Q?IbUYq0zXww5zOAuRj6jdvGVTBtQskBUPXnDWrRHjMNLz0N3cBgjRoQU+CVVr?=
 =?us-ascii?Q?5au+0iv4SQdleeAa49gXoOLTt2Bfgl0lVsiASbXofNqgOAEkPXOsd8vbpa9d?=
 =?us-ascii?Q?MYzMFhsZfNwfOXEq/aK30IQc/bFcxgtcEeBMcvfpJLQe8OnWxuS7ij/tdqRg?=
 =?us-ascii?Q?SSPtYX/NCx0s2x8k+4fNLGpShOVYO7Hb7nVf42E//zqDpaE4NG94SOKAJzFJ?=
 =?us-ascii?Q?E23VwgO5kpplas4gRZLD55TDbAZR/p8uSHzSXU34E5CtfnBR+Z8VWixQFTEJ?=
 =?us-ascii?Q?ogC5A+wk9JoBzVVUcdcEnGZ0tw+Be8ESyNnkst4ZIdzUFF91npK4zyjLtgCy?=
 =?us-ascii?Q?F9aYh6TfnJsKNQ3NrqL0sb5B1rZFGWldmYlroaNfFyy7CG6fDbqOf1mrFYJP?=
 =?us-ascii?Q?MXDQW4fLoMj+vc6wetE+umpi1Wgo/Xyik+cfmBM0zSu0c0Tgv0F8WhZPhOZT?=
 =?us-ascii?Q?y/BQrJQ916LHcAwEwpaTs3QztiZcxntl+94UI6e93Ik1dFqxo6zHQ3rBZxTf?=
 =?us-ascii?Q?rRiK+29/um4Fv7HtsyvmSRbimjeTd8jhG2uPl/ChzZwOkyCFd9xmT52qwRM0?=
 =?us-ascii?Q?CBwHKGUQlcAdG8yIgHvS641w7/Q8juiRHUUbX6dmlxgPw2AFBk/IiHxPblBP?=
 =?us-ascii?Q?z7bJEj2diMqYFst2tHNHeBQNBFHcrnEBIqfeq3mUZS2QbUo7tg+H20LS8OCM?=
 =?us-ascii?Q?V4kBe1zE2G+406M3BYS+rGtYn3DU+jnNYScsZTUWKfZMMx+as6IDkMUtOBCH?=
 =?us-ascii?Q?lrxEVb8gzqhfv/3wtWEkpW+HTjDMdwika8rUAc/ewQ0/dByNb8fk5BRbUIAa?=
 =?us-ascii?Q?KC0uU6lQhtH+8iHYOhjqT87jVCKL7W+SMfCHOMiSFHbNZjaNLP1lkW8lCLcW?=
 =?us-ascii?Q?lGWBHBiJi9PL+8iHWeoWKRubZqLFrkt0EM8ZnEIhgIUaTnE3MhftV1qSu9Wv?=
 =?us-ascii?Q?2LlGHtMnpQgj/j9DNeOGjGzCYNS5ESQSouTubVggT4NX5j+gxHlwqa2oVqEc?=
 =?us-ascii?Q?Pytw+EB5pfxpHg5OwwIYuBBnkalSG3kRMOjy3Wip4fEluWdFG8m2Qf9Tm23g?=
 =?us-ascii?Q?p2O+jVWGZHdckLSr4ZjbWt7qP1SP95U/Vv7jh9EQn/9ymo4QEq9uriVhsMF5?=
 =?us-ascii?Q?4cCYrb587gbOzXI1RFgBoAc3gInxnyOVqS+icKdsYEV3XQUvozvQ/QrjNtmW?=
 =?us-ascii?Q?O3mr3fRsu0mkJwBoWcaVcEfj5J0fXrKDxzIF1PhGGQ2Yk3zDbl17NqRUkpSU?=
 =?us-ascii?Q?1Z8B2iQtt8MTPHPojRdM8bk1MpF4XwgQXM0u+M3KQ594AoSH1/9v0m4Aq0rn?=
 =?us-ascii?Q?j5JUf+osHTwK63A4dsUOOC/psY14ZXnBzcbREN4vULgPrlXXf3tq6Ehf4qaL?=
 =?us-ascii?Q?+ZpGU1oK3MPVisofJ/Agq9auvhoDJSLvoIEbUym0ZrIDXTHHqTM78pqt6uGs?=
 =?us-ascii?Q?KQGHk2iboEK8i0YVHF9gVAZMf5BPJrE=3D?=
X-Exchange-RoutingPolicyChecked:
	sUNpXR40UuiPMnJmSKKvA8dE1twqz/XHme7oAKvltT6G95Tu5cVezjStewCmCk2qrnJC1ylFmLG13XxETwTxagVIPOZxhtwG5M8YuJvE+kp1+GKe0VQcAzrplNx6LGsg+ds0mUCczEnvU6UncfwmQ13/Hv/LkJZjRHiwFLad2KtqS72VUJwIj/eY4DmfIgdMNed0DFXr7Z8mPaV730mAc8pl/SIIS87Xs6WOAx0+Od/JZh8QfBRxqipB0OLdZ4z9hZ+DBDfoRAf+Dw8uCdy8JidSLJAsNrR/ORf3ehqWtIJ1+mM0S2OkXFdT91kqs9SALHQfGlfHgqmSeXi9QKED+w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	s4xdJPO/asBeXHlmYe4H/n4C3boepgLTd0MBHqXGwDvkmhG0pN3MpN4LcrDUffNWEpsjoLPmFTEaEpMJbJrIG8nGPWaBetY+bSMQ/a8xJDVAWLk9Th/+0TUQhjvA6Gfrmn8lmXfHhMuy3CPKiawsEMlzu0QjOf5+mhbWT1PVx+siZbJaEq3zGZ4aWLCWuU7tX/+g7fmbPPDlSAh1WhJTNEYq/xLao+2LWJQ9p+yqsMM3D3xqdW0MZRttiuZkdLFdj6oRq3OjCIszX2Ej/t7MnukGoSQxkJOz1JeY69wLVs1Sbp0h3+yckD0MfGriCMtH6sXCMGTkEtKbK3ZVsiQqwT9M5mEmidZ3BcYiAATPWS5g73AzkwGrLyDTIZ9f1h5h0/nbBDb2S4SkUlDqylhJl5wQ6gXd5YxtQbyY6rmCbhNjrc3Xi2UfaaePMPav9ms9EX5XheaEd5WAs89p+WHqcBSVC66MmUTTDiIk1BGkybiH26BTvN6vRK+V6ggq3dt+pd58GkhGfQXv1zlMaqiynOqNB1TGw1wwn6aMWNwhBOdcQ4F+G/sk3cW5BQ7QJdzLcYgisopoKtsoA8D6KwtHtfwA3D/zcKaV4xBMi/8PU6U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d66bc5-3f66-4c17-ccd7-08dea558f621
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 19:04:24.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyWlH0FXx3aJphNbhiOysPwp+bXUwhh8XyiWSAlgcjje++Qf4QVYlgC1jfzbKbj+Ngf7OByO1lWM0fpKKBLbjNLRBgN8qzfll04yDhRqcek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5113
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=927 spamscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2604200000 definitions=main-2604280185
X-Authority-Analysis: v=2.4 cv=U7uiy+ru c=1 sm=1 tr=0 ts=69f104be b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=H_nP_5F5Jeef4X9Cs0IA:9 cc=ntf
 awl=host:12310
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4NSBTYWx0ZWRfX0DZ+wiGQR6U5
 FNMHkJNnLzse2DYv0csO8Tl3MRGBUB8vrMypMtbtVr7regkh/PLuys0THUvMv6req2fqmqtkcE6
 ZwuMBZ16OMsWOaoyWqdlV3OqS0gipC5KbC5KhfY+Od3pJF0umwFizfBvoOrNN+xKa8xBkrYyVO4
 vDEieNHJDE2bczB3ooDG//WVX+zjM/l+FPcSijVytrAIDGynzEdhgiRtB6lJ92KqhYcXPYz++f+
 kn/QvvLFOKzEss0ljNbFbYKIjQHvq8jED0EZOTQRMpoaBTjCOP27JcYztHBtbQqkE7gDt6++Paj
 Qlt8BFaYtNDg61DpQvxXwMuo4kDr9dGhYNv7dIMpspAczR/S1HLSQcHEXTZ1QzdIPN0Szs/FBmL
 xeVyD17T1EotOVLUpzng9BW0gGCqYlfLvjVSEXVjFDcs5uucX1ny+qkQHGlXyIf7AU3unv9ODmo
 kBGZyyyc4T3Q+fmhXYOnMUiAqJZFslIJL5U0KCzk=
X-Proofpoint-GUID: 4aw3X-JJScXvptzg4b2aTMm1Uc4bpg60
X-Proofpoint-ORIG-GUID: 4aw3X-JJScXvptzg4b2aTMm1Uc4bpg60

Functions that need to check type data operate on the real type rather
than a typedef or a type with modifiers.  Similarly, when a type of a
function is needed, the prototype (BTF type BTF_KIND_PROTO) is what is
really needed.

Introducing dt_btf_real_type_by_id() removed duplication of code in other
functions.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c | 44 ++++++++++++++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index d08599192..e392468fb 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -848,6 +848,27 @@ dt_btf_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
 	return btf->types[id - (dtp->dt_shared_btf->type_cnt - 1)];
 }
 
+static btf_type_t *
+dt_btf_real_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
+{
+	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+
+	do {
+		switch (BTF_INFO_KIND(type->info)) {
+		case BTF_KIND_CONST:
+		case BTF_KIND_FUNC:
+		case BTF_KIND_RESTRICT:
+		case BTF_KIND_TYPEDEF:
+		case BTF_KIND_VOLATILE:
+			type = dt_btf_type_by_id(dtp, btf, type->type);
+		default:
+			return type;
+		}
+	} while (type != NULL);
+
+	return NULL;
+}
+
 const char *
 dt_btf_get_string(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t off)
 {
@@ -978,29 +999,24 @@ dt_btf_module_fd(const dt_module_t *dmp)
 int
 dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 {
-	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
 
-	/* For functions, move on to the function prototype. */
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
-		type = dt_btf_type_by_id(dtp, btf, type->type);
+	if (type == NULL)
+		return -1;
 
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO)
-		return BTF_INFO_VLEN(type->info);
+	if (BTF_INFO_KIND(type->info) != BTF_KIND_FUNC_PROTO)
+		return -1;
 
-	return -1;
+	return BTF_INFO_VLEN(type->info);
 }
 
 int
 dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 {
-	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
-
-	/* For functions, move on to the function prototype. */
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
-		type = dt_btf_type_by_id(dtp, btf, type->type);
+	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
 
-	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
-	    type->type == 0)
+	if (type != NULL &&
+	    BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO && type->type == 0)
 		return 1;
 
 	return 0;
-- 
2.53.0

