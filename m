Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE699163
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 00:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730765187; cv=fail; b=f2ZIHRo66225FRkeHRsmCzI8WBbnpS0irSd0Zhy0G9W+O4oxZ7zcPpI4euaIpBKXyFMMuBO8HfBFUNLuUESoj6DiP8bSo7E/GklYTnpKctfhEuNpJOUPPfmnOSzutxI8YSP/z9SFYWjVNSkQcn5eKeQw5L4D03n5U/Yy+3ymZjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730765187; c=relaxed/simple;
	bh=xwU6kWvBYoFz/evtMr0LYp2VbnVtJbMtNLeJ1zglmtc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lPksdt+6gsb6B1RgvWmPLdKxSagGKU8K6AXCZAwsMZY6RRCSOIKv0zU7zYnOWe0M3d7RlUz6KOQkfhJGCZldom/ZnyFc+wf3ege5dkVcEK4uTevOaSshxRnepiMO5S7Dfq4gKuqbOei3Y4NKjptJiLi4jRqexLBcqDeOkzDiuOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lyrCTtpd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A83a9k+f; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lyrCTtpd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A83a9k+f"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Lh0jl003959
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=A0bkArWUr2WAD8PRrGAQF3aWp8pJmWXhZml5KeYdARg=; b=
	lyrCTtpd1r8EFJx73Jbn6FcRvBNCoPAsakd1gaAz9mAZYBcZrOoDpg4zuD/q2aRP
	eMyHtqsdloMcwU19x+ejFw8BNWBzUZX1wmFirK+dEAhMSvNlWfZ+CSF0vsRiCMms
	DfsxqN5nOESew1xe7tGnUKz5xIVvzK2AFLKMGMesPlnCYMS55EoBPXOGzHQ1glQn
	WbX0378kycwmqUlN6fUSHcQqcG7C5zYKpzf9/aAw+iFQy0y2rxoTerUVn6Z/5z+C
	cDWVm/utaihS0bAiqoNPF160KB8qIHklsPF6B8VmdFBRQ1h6n1qRzm4slru4nkrW
	56BC0jLMGtRn2zE94ofDXA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nc4bv4yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4MoLj0031447
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 00:06:22 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah67dnc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 00:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+EBMu9qqUFhcl2TOLw4ctQEZcOni2IgsoXQ735MDvAsJ2MmWnewC2gSIVhWbD4vvadt2oT97wVjA+BXmx1ZK2LNdg/qtQxG9KHwX7BupUx5/cD2lstOrmImxut/ocYNSR+GRbS6xJTkstAXcKin/zDNyM8MPs9YelqLss1qnijU+E+gM6ul2gsCHcp3qdbIU8j5ngMRAE1dq1tEYhg/ljhTkEAWpTknugnmJcVxATahUy9wojkNDtv/rryNuRs8CZSiftoL/wQfebF2v3+0R6mqTFQCqhGkX3fvA6Luf073PjiZrxR+l+aM/bduy0CemhuyQ6dV9PevjVuVC8f0ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0bkArWUr2WAD8PRrGAQF3aWp8pJmWXhZml5KeYdARg=;
 b=GiJ3ZvOcOu/RsrbsaChOMAXCyF8viI6wcwWeeAcoHT17mTGqqf+7QBWbl9FiB/XAHxb2RurdMOJBw+LRnFyLJnJzQmIOfTQlTKOimoqJIrKEt7yUWJocgg0cAmDWco96j5jL7DGpBIIA862hFVuiN+2g6now+v2SQU3+hkKzCoTLroFShITdg+y62XYq2GcwS/fm+WVTdYl0yJxly7Nx3aJKB+BsNGq2/r3qu/UOslzyooO+4cY1S9tVaUnVDNWOJpZGzw0B+hXmJwsa/6KFeVl/ku6xN8Q26KU60lmyLgwp98GcBxwVyAWhsBqusQQgw/pZnFaab3yM7q+8icM2pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0bkArWUr2WAD8PRrGAQF3aWp8pJmWXhZml5KeYdARg=;
 b=A83a9k+fEi4n8xqi9LAAZGGM86dPvMIO7yXsyVx40OdgS2gGaWBVbIUEXFF2R7XDUCACzfEbPbwlDLpH9uf4l5rZywdLssnJHVspttfHZa3UdTqhQrLgePbzNN6FFcvTNBzzBPufg1fQLWluKkqsiFKVp+ExKg8PA+9u8Fcu4Ps=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 00:06:17 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 00:06:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v5 1/6] usdt: get arg types and xlations into DTrace from the DOF
Date: Tue,  5 Nov 2024 00:06:03 +0000
Message-ID: <20241105000608.333229-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105000608.333229-1-nick.alcock@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::11) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: f206f736-de3d-4472-316c-08dcfd2dab7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kp1oR4qj5PiKfDU7rfFAdBkShKwiu740p0BveebSv4MXSipfj7oRIaYUmE/z?=
 =?us-ascii?Q?6SqXaWfHbJiGk+qEKXru9WYQ9ZE9kzoqO878RyKYSvM7mCSZlkzNPRyKGZGA?=
 =?us-ascii?Q?9DuH9X7Tveeg38suGOSI0feTBzzVpbo6Fww/WHCqYo7KdXpwfy15GTUWODYI?=
 =?us-ascii?Q?JwaaD2I9x2uKr3Qe3DcgL6WJLwhhmSMqxPqoHxzO7HxYjLV9E0aBi3PzdyRN?=
 =?us-ascii?Q?XkJQLaMfEbINsDZ9wBKMXvDAVIkQDRtxIhtTk7GehI5bvc2MhAmYxkOp4u3A?=
 =?us-ascii?Q?TLo3XA2bBwL/sRUAFbZryS10piwn/Mngsf5EwvUxjQz7u8vYaFMroMRd2GTB?=
 =?us-ascii?Q?16VllxRruvKYXr4huUGHFOGBxJc8pweB6uzQUWM5c/o6la3essjJm5oBVXJU?=
 =?us-ascii?Q?jLlCphgyI6hzwnwUIlEwutEB4naRgwlzDkDO8AYd0YRlGLdznWL5KvhjK9I7?=
 =?us-ascii?Q?4C91thcNHPubMrzO+/RF2DTiIGqPxVv9MN7h0KEK3eeCax+xnA/TvErAOqep?=
 =?us-ascii?Q?JoeDYh2moVpKP+b9GLqbwK+kpD+fonsVOpOkJyoZ2opF/v0mLG1RSfiJ+r6y?=
 =?us-ascii?Q?15T2kg/mwFRTnj7nsfmMqK0S655AGkIfSKSg0CkIld0MFTWzRYepJbPXQoIP?=
 =?us-ascii?Q?+cK2AuxNAbCcLUabsLwlC4qLRwBzn+RXHkkzvFw+zdRbQzOORj+rXOMSmLM9?=
 =?us-ascii?Q?YcmhUpYjdTu0/QWp4e2n1Xj/nitWeEA3h8l/YkFwHJqJclGECLm/8Oi0rd2N?=
 =?us-ascii?Q?cY04YY9GPP+D2KSGzI+w2VjhoKhskTQH1+Qioh0hj7HVc2nNvkuQh5vWffCo?=
 =?us-ascii?Q?f01jE++P6t2+ccO6YxPcl6IL3JRqbC/KQbNiCtjcmA6hvnii8xadWmJHqtbd?=
 =?us-ascii?Q?r9BwSxkXRsEOFgLfMd7pdbnqzPJeW2ejOcg8Dxj4AVgd/h+bdDgcbV33rLBD?=
 =?us-ascii?Q?QJ3yqtkyXMwpHx1jZG9dtxAGjYcOjGR/zyUYNS5iY9biFBlhNemux4T9GGao?=
 =?us-ascii?Q?PQ7qrpZquLUpVCQdBEOGkn821m8vK7RFgucv8mSjzKfAn9XPq/88uUsMWDc1?=
 =?us-ascii?Q?3LFe+aC2Sqfn8+sb5OwpA5nfvLZjKN24fU7nQvH2yWP4F0ztj+lzSxtBof4x?=
 =?us-ascii?Q?DPOXB47o1+31e2jlS3tiqxWtW7Z6tF2Ay+8FcAc6OIIN2bVrFzCRWPWTQqJY?=
 =?us-ascii?Q?AHm+8F1KgnyqYGD8yUwdDm8e2BUC2JjCYyLixqbRJBzWSKcI7q8E3pbTZjVi?=
 =?us-ascii?Q?kh49s+/EcuP264/HzNvfy0aqbMYXkxNAFo8FWZ5Ggv2J4qJvR3tkb8Nsbsn7?=
 =?us-ascii?Q?F1Z+13Qj6cEOprt34K3TusWm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?21hb7PH4pI3PdtXra/8rYKSihBHlfgspbeBtRcBeHlJGfJ8URXrlt7pCG5zq?=
 =?us-ascii?Q?3QcK7q1QifwepoocWD64hJtEWQ8W9KIihF7TRT1ld75al3gvcAUPWil2z9vc?=
 =?us-ascii?Q?2Z4MjtjsXmXKu0+qBLNZD7FjjnGJTbKCkIRrgz4YCRy1rAKzhimywKHJb9Tk?=
 =?us-ascii?Q?fHevggKn/zkQ2aJwxTUojazPMKmcQHRouzeU+Bx7D/4TWZMr70NVuXw3meLs?=
 =?us-ascii?Q?qUTLVIKao5ZeHH5KR4uZ0pPNW3J0/GIJJcqmSba1xtn2aw8nUf/UbwSRR/uO?=
 =?us-ascii?Q?+wIKyecPTB666rYqy0gmni3Cjl9soZLAwY82Gx1ADgm9QuOYuImzAxmk2Co2?=
 =?us-ascii?Q?Rj0stKrAQ1eKt94aLkC6ZYTmdnbhHo7PCzRs5QHTt/1wY+CvwVkqSYZYPy0p?=
 =?us-ascii?Q?VykR4VLiAcIbHWn90ieH6Ww62WR6y7yKo2u25is5Gf0YYVqlmST/XpdjcpCf?=
 =?us-ascii?Q?B3+tu3jibO9DA29DTDz1ngv5ghd/oDSSuyKV8Ld91fVxVDxg7s8lnGeosmSE?=
 =?us-ascii?Q?qHxcUWrr6SVxOKtHKFkdNjyimoqxvmW48smFNxHpJIANU+OqYlCM0AJpqWhy?=
 =?us-ascii?Q?OmhpCT3pG+tn0NzQCTemH7adpvia4qxQyvTyBuyhGD9SAXuGzvoSowhL1Eyc?=
 =?us-ascii?Q?B84dhx/0QczJeTIJgx3LgOHS4znuwNjMwKeYVTdgfx6wheDXIrC3dqnXStge?=
 =?us-ascii?Q?RLQUpupNnn32XUbEYD8GTFgjkw9W8Dj65SeNjCdZB/+jFPGRTu0g9o9t43sn?=
 =?us-ascii?Q?J6voF93UvOB6dB+uZs+gtHSy3wYLWf9ChC7/V0s39KC1mg4hfG2ejBNcyYvA?=
 =?us-ascii?Q?Z1PzBYNGXzGNS0D1wZdew0GdEIp0bz4Rk7KV1pNNnSo21dgfIn+ku2R+d978?=
 =?us-ascii?Q?nJxIdaxCum9uCNNVHLqLyzT+wUhhjRhhE9SivlbeHgeVtdw2jjpeB3D6N6cP?=
 =?us-ascii?Q?Ak+FtjpuP89sEb9WozBtFm+pfehZEcHnbCpX0PqaCz5iwtO36h8IAwVTe5AX?=
 =?us-ascii?Q?+3GDnxfD0iqOqy51vlLhJaFr1+BHHndKpkp1q6do8X2/YktAiRzbtoHhspQP?=
 =?us-ascii?Q?xpJlmVuMLLunrwt/nu1+gKH+s0AwbfeKL7rQMmAZbDIHW59XGrYOLBBOK2PR?=
 =?us-ascii?Q?c/5XVTNRnAReMHaU3RamxkMo6+kYihbRx7njyeK7EZAY0an7zIM6uWmNmUHn?=
 =?us-ascii?Q?lax/xfJOlTWnDtO6U4NdLZJYCYBM8GMyoFdiAxgU4rwlV44FYVTQSQaXXAul?=
 =?us-ascii?Q?xXskFlVMQOGIZVL9RI9/XbOoyTbn/OiOVNgwnzdNSowR5PjMz5y/dPEKHYOh?=
 =?us-ascii?Q?71Vq2Z/tyFodbIuFPEDLv4QsvgoYRQAjOebfy4WkKCxcDR2uZl+6jEt5U9oE?=
 =?us-ascii?Q?ST7E8o6Bk+Im9DdgvIP0LCbtt/6V7eCywB4xqTddidUiX2gtNsD7S57bahj6?=
 =?us-ascii?Q?v0nFg1fvPfPPMvIu/ofxYLptfg+5geNiy7NyP3SgRQpwCpIthRPzda9rWZ9Q?=
 =?us-ascii?Q?cB4iyI0OGVkar5VOq/fqy4oWFMzlhpB0n2aYamiF6oc+3z7tq7X/XzACEem2?=
 =?us-ascii?Q?JBio50Ax/hMiWeEXZKuAiIaapFrOBZ0Kar47Fvodn69cSALVUPPFsuPWzvW3?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6SY1c1zAFwYBEypJYElovOiH4du/NkCFlPAapNAM5zw8Xnm5ITllbsThCV1IeDRcLwckgZFl9IGdDSmjQufHput7hYWmFWvaYoKJfsrg88b9f5L1U/P2Cc/1CJbnZanpl3zR436hH0sqwuitmDh44XWzNSdINY2spmkeqNT7CONu6gP4bVnBEg6r2zN3H0mpbbbOWkyu6yLgE7k2UK6UhjLu1wJHI06AfsdZ8xPjDZ213OBhC3+NUH6P18rGsyZXj0/3YLeAI90+kzBs+rqDpdaII5F5Mt7z594xeb/AO7+kXy9xS5CnunbUArQnTuyQOxHSa89hbm0rwNH1enXfQLPvv8D0FIP6Gb4Q3RoFS2geMkU6l/dq+YA6phz5lcINFmCz0/30TNeLcLNA8qzatVFhBptJItrN3kNjXeN0oz2tYkYCbvQYlJlVaqEFccsUfKiowJR6cCbRtDaxz8ABtC1ozRDeuOUNTpyuwBye38t0i7J8YAniyz0RF4cfRk1YyMvFMsXKcy8QVDQ7MzQzLMcobwU8rfzvt7uKTR2vvHaXAlDQkBXwgCthd3kSR/5S6OmUM6UxktMGEuhV+lfF/f0kdodUzcZhFRPRZclDQ2w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f206f736-de3d-4472-316c-08dcfd2dab7b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 00:06:17.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mdQ+hRiFxTwuZ7vK8mDKgKZqY950iGWczZcVtX8OaEzJIzl8SjF5/n8w5VqmLZPpZ8XRL3bhWM5eTxoWgi54ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_21,2024-11-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411040192
X-Proofpoint-ORIG-GUID: hVlSTOTGUjtPIebM4KZYKhYhNhjTaIem
X-Proofpoint-GUID: hVlSTOTGUjtPIebM4KZYKhYhNhjTaIem

This change propagates native and xlated arg types and mapping info all
the way from the DOF, through the parser and dtprobed and the DOF stash,
into DTrace, where they end up in the pid_probespec_t for USDT probes.
We don't do anything with them once they get there in this commit: no
user-visible impacts expected.

We bump the DOF_PARSED_VERSION since we add three new types of record to the
dof_parser_t, all optional, covering native and xlated args and arg mapping
tables; to make life easier for consumers we emit them in a defined order
(documented in dof_parser.h), and add arg counts to the DIT_PROBE record
that precedes them indicating which will be present and how many args are in
them.  This means we retain the property that you can always tell which
records within a provider are coming next purely from records you already
have: there's no need to make decisions once the records turn up.  The DOF
stash hardly changes: all that happens is that the parsed data written to
each per-probe file gains some extra types of record (it can have
DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
DIT_PROBE record now).

As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
refuse to read probes added by dtprobeds that are on the other side of it.
(Restarting dtprobed will reparse all the probes in the stash to match the
new layout, and newly-started DTraces will pick that up -- so this only
affects running DTraces picking up new probes, which DTrace cannot do yet:
so no visible effects are expected.)

The code is a bit repetitive, with nargs, xargs and arg mapping all handled
separately even though the code is very similar.  In future maybe we could
unify them (but my attempts led to code that was much harder to read than
the original).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c   |  15 +++--
 dtprobed/dtprobed.c    |  10 ++-
 include/dtrace/pid.h   |   7 ++
 libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
 libcommon/dof_parser.h |  64 ++++++++++++++++--
 libdtrace/dt_pid.c     |  59 ++++++++++++++++
 6 files changed, 256 insertions(+), 49 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 0e639076f655..8bf465678217 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -59,8 +59,10 @@
  *    startup if the dof_parsed_t structure changed.  The file consists of a
  *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
  *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
- *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
- *    the DIT_PROBE record specifies.
+ *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
+ *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
+ *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
+ *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
  *
  * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
  *
@@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			break;
 		}
 
-		/* Tracepoint: add to already-open file.  */
+		/* Args info or tracepoint: add to already-open file.  */
+		case DIT_ARGS_NATIVE:
+		case DIT_ARGS_XLAT:
+		case DIT_ARGS_MAP:
 		case DIT_TRACEPOINT:
-			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
+			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
+			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
+			       state == DIT_TRACEPOINT);
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index f4c6be1e045d..2ca39b26f88a 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (dof_stash_push_parsed(&accum, probe) < 0)
 			goto oom;
 
-		for (j = 0; j < probe->probe.ntp; j++) {
+		j = 0;
+		do {
 			dof_parsed_t *tp = dof_read(pid, in);
 
 			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type != DIT_TRACEPOINT)
+			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
 				goto err;
 
 			if (dof_stash_push_parsed(&accum, tp) < 0)
 				goto oom;
-		}
+
+			if (tp->type == DIT_TRACEPOINT)
+				j++;
+		} while (j < probe->probe.ntp);
 	}
 
 	if (!reparsing)
diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 0129674adf0c..25bfacfdbfe2 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -35,6 +35,13 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
+	int pps_nargc;				/* number of native args */
+	int pps_xargc;				/* number of xlated and mapped args */
+	char *pps_nargv;			/* array of native args */
+	size_t pps_nargvlen;			/* (high estimate of) length of array */
+	char *pps_xargv;			/* array of xlated args */
+	size_t pps_xargvlen;			/* (high estimate of) length of array */
+	int8_t *pps_argmap;			/* mapped arg indexes */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index d6631a1afdcb..1792a8bfcc84 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		}
 
 		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
-			   "%d is-enabled offsets\n", j,
+			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
 			   strtab + prov->dofpv_name, "",
 			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
-			   prb->dofpr_noffs, prb->dofpr_nenoffs);
+			   prb->dofpr_noffs, prb->dofpr_nenoffs,
+			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
 	}
 
 	return 0;
@@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	return 0;
 }
 
+static size_t
+strings_len(const char *strtab, size_t count)
+{
+	size_t len = 0;
+
+	for (; count > 0; count--) {
+		size_t this_len = strlen(strtab) + 1;
+
+		len += this_len;
+		strtab += this_len;
+	}
+	return len;
+}
+
 static void
 emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 {
 	int		i;
-	dof_parsed_t	*probe_msg;
-	size_t		probe_msg_size;
+	dof_parsed_t	*msg;
+	size_t		msg_size;
 	char		*ptr;
 
 	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
@@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	if (validate_probe(out, dhpb) != 0)
 		return;
 
-	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
-	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
-	    strlen(dhpb->dthpb_name) + 1;
+	/*
+	 * Compute the size of all the optional elements first, to fill out the
+	 * flags.
+	 */
 
-	probe_msg = malloc(probe_msg_size);
-	if (!probe_msg) {
-		dof_error(out, ENOMEM, "Out of memory allocating probe");
-		return;
-	}
+	msg_size = offsetof(dof_parsed_t, probe.name) +
+		   strlen(dhpb->dthpb_mod) + 1 +
+		   strlen(dhpb->dthpb_func) + 1 +
+		   strlen(dhpb->dthpb_name) + 1;
 
-	memset(probe_msg, 0, probe_msg_size);
+	msg = malloc(msg_size);
+	if (!msg)
+		goto oom;
 
-	probe_msg->size = probe_msg_size;
-	probe_msg->type = DIT_PROBE;
-	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
-	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
+	memset(msg, 0, msg_size);
+
+	msg->size = msg_size;
+	msg->type = DIT_PROBE;
+	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
+	msg->probe.nargc = dhpb->dthpb_nargc;
+	msg->probe.xargc = dhpb->dthpb_xargc;
+
+	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
 	ptr++;
 	ptr = stpcpy(ptr, dhpb->dthpb_func);
 	ptr++;
 	strcpy(ptr, dhpb->dthpb_name);
-	dof_parser_write_one(out, probe_msg, probe_msg_size);
+	dof_parser_write_one(out, msg, msg_size);
 
-	free(probe_msg);
+	free(msg);
 
-	/* XXX TODO translated args
-	   pp->ftp_nargs = dhpb->dthpb_xargc;
-	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
-	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
-	*/
+	/*
+	 * Emit info on all native and translated args in turn.
+	 *
+	 * FIXME: this code is a bit repetitious.
+	 *
+	 * First native args (if any).
+	 */
+
+	if (dhpb->dthpb_nargc > 0) {
+		size_t	nargs_size;
+
+		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
+		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_ARGS_NATIVE;
+		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
+		dof_parser_write_one(out, msg, msg_size);
+
+		free(msg);
+
+		/* Then translated args. */
+
+		if (dhpb->dthpb_xargc > 0) {
+			size_t	xargs_size, map_size;
+
+			xargs_size = strings_len(dhpb->dthpb_xtypes,
+						 dhpb->dthpb_xargc);
+			msg_size = offsetof(dof_parsed_t, xargs.args) +
+				   xargs_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_XLAT;
+			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
+			dof_parser_write_one(out, msg, msg_size);
+
+			free(msg);
+
+			/* Then the mapping table. */
+
+			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
+			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
+				   map_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_MAP;
+			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
+			dof_parser_write_one(out, msg, msg_size);
+			free(msg);
+		}
+	}
 
 	/*
 	 * Emit info on each tracepoint in turn.
@@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
 		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
 
-	/*
-	 * XXX later:
-	 * If the arguments are shuffled around we set the argument remapping
-	 * table. Later, when the probe fires, we only remap the arguments
-	 * if the table is non-NULL.
-	 *
-	for (i = 0; i < dhpb->dthpb_xargc; i++) {
-		if (dhpb->dthpb_args[i] != i) {
-			pp->ftp_argmap = dhpb->dthpb_args;
-			break;
-		}
-	} */
+	return;
+ oom:
+	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
+		  msg_size);
 }
 
 static void
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index d3a6836f15fd..8f42d00551e3 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -15,10 +15,19 @@
 #include <dtrace/helpers.h>
 
 /*
- * Result of DOF probe parsing.  We receive a provider info structure, followed
- * by N probe info structures each of which is followed by possibly many
- * tracepoint info structures, all tagged.  Things not yet used for probe
- * creation (like args, translated types, etc) are not returned.
+ * Result of DOF probe parsing.  The order of elements in the parsed stream
+ * is:
+ *
+ * DIT_PROVIDER (at least 1, which contains...)
+ *   DIT_PROBE (at least 1, each of which has...)
+ *     DIT_ARGS_NATIVE (1, optional)
+ *     DIT_ARGS_XLAT (1, optional)
+ *     DIT_ARGS_MAP (1, optional)
+ *     DIT_TRACEPOINT (any number >= 1)
+ *
+ * The dof_parsed.provider.flags word indicates the presence of the
+ * various optional args records in the following stream (you can rely on
+ * them if it simplifies things, but you don't have to).
  *
  * On error, a DIT_ERR structure is returned with an error message.
  */
@@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
 	DIT_PROVIDER = 0,
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
-	DIT_ERR = 3
+	DIT_ERR = 3,
+	DIT_ARGS_NATIVE = 4,
+	DIT_ARGS_XLAT = 5,
+	DIT_ARGS_MAP = 6,
 } dof_parsed_info_t;
 
 /*
@@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
  * start which is the version of the dof_parseds within it.  The data flowing
  * over the stream from the seccomped parser has no such prefix.
  */
-#define DOF_PARSED_VERSION 1
+#define DOF_PARSED_VERSION 2
 
 typedef struct dof_parsed {
 	/*
@@ -59,18 +71,58 @@ typedef struct dof_parsed {
 			 */
 			char name[1];
 		} provider;
+
 		struct dpi_probe_info {
 			/*
 			 * Number of tracepoints that follow.
 			 */
 			size_t ntp;
 
+			/*
+			 * Number of native arguments that follow (if > 0, a
+			 * DIT_ARGS_NATIVE will be received).
+			 */
+			size_t nargc;
+
+			/*
+			 * Number of xlated arguments that follow (if > 0, a
+			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
+			 */
+			size_t xargc;
+
 			/*
 			 * Probe module, function, and name (\0-separated).
 			 */
 			char name[1];
 		} probe;
 
+		/* V2+ only.  */
+		struct dpi_probe_args_native_info {
+			/*
+			 * Array of native args.  nargc in length.
+			 */
+			char args[1];
+		} nargs;
+
+		/* V2+ only.  */
+		struct dpi_probe_args_xlat_info {
+			/*
+			 * Array of translated args.  xargc in length.
+			 */
+			char args[1];
+		} xargs;
+
+		/*
+		 * V2+ only.
+		 */
+		struct dpi_probe_args_map_info {
+			/*
+			 * Mapping from native arg index to xlated arg index.
+			 * xargc in length.
+			 */
+			int8_t argmap[1];
+		} argmap;
+
 		struct dpi_tracepoint_info {
 			/*
 			 * Offset of this tracepoint.
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 41a87955ec1b..71ac1754d343 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
+		ssize_t nargvlen = 0, xargvlen = 0;
+		char *nargv = NULL, *xargv = NULL;
+		int8_t *argmap = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -917,6 +920,47 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		p += probe->size;
 		seen_size += probe->size;
 
+		/*
+		 * Assume the order given in dof_parser.h, for simplicity.
+		 */
+		if (probe->probe.nargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			nargv = args->nargs.args;
+			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			assert(nargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+		}
+		if (probe->probe.xargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			xargv = args->xargs.args;
+			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			assert(xargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			argmap = args->argmap.argmap;
+
+			p += args->size;
+			seen_size += args->size;
+		}
+
 		/*
 		 * Now the parsed DOF for this probe's tracepoints.
 		 */
@@ -967,6 +1011,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
 			psp.pps_nameoff = 0;
 
+			if (nargv) {
+				psp.pps_nargc = probe->probe.nargc;
+				psp.pps_nargvlen = nargvlen;
+				psp.pps_nargv = nargv;
+			}
+
+			if (xargv) {
+				psp.pps_xargc = probe->probe.xargc;
+				psp.pps_xargvlen = xargvlen;
+				psp.pps_xargv = xargv;
+			}
+
+			if (argmap)
+				psp.pps_argmap = argmap;
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
-- 
2.46.0.278.g36e3a12567

