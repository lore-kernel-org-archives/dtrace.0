Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB820408D
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729281523; cv=fail; b=ip+Zo7H1ibSWkXlFW4b/BEoh3QxrjT9vbkUfCduk8rTh2LEJNxCZ9bFVn18hWgdg8g8Ezyrk6swRRjlvBkN9yoXTgUsndnCyZMVzxPRxoNwvmdSh0q8/kW3Nz+xGuhj/FKW87KO8GxvzTNlsEleRfTrTg//Qe59b+kEavej2WJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729281523; c=relaxed/simple;
	bh=zON7YHqrHRbij5qObxCCjrzgqxU5CUpfdvRXi7v/S18=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=giSQvJoCyoCr3/vEcbde+xYtPc+tfb/e4WKY902nLLS8QouBystciE4ngS7vs7rZ/jFxjNfvFw2MYWvypGkonCk2FdoVQUuPcbSgixHRj06gKT/fxA2yajzA/AThrj7+fNtMOsfIhyYXkC1jUghQSQCe0/nv5B8HplUpTb41kCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZMiF+tiM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H7i8oA9Z; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZMiF+tiM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H7i8oA9Z"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIfhlD013794
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=qxjUcqa+gCGCDYy2PxJoWYRQ7hyFH1PtR1rNX8y9ql0=; b=
	ZMiF+tiMxDngJI1fEfzFwUOcvmNrjF3ByS1VJy6QUGQwxBajTYxl/9C5dgDM2Otv
	ckGCjow63Rn9eh39f/FHCyrQkZqThXrh2ed4SNC73MuaqnnRU3wP3YRXUrftjDne
	/rNM3xz1KmMUqjsTO4BsnSNXT8wuURlnznlEEdYs9hqNDprhbM2oOyO1+aKp3HvA
	Qv/bi5xLR4MeskzBiOKILLub8FCOKBvvP91h6R8qKy0OZkgUUa+iA6z8K4S4RsoV
	AGfSw3BYSK07y/0o1wmhkolNdGbRztpHIw4LeZ1oiTtbSmJnO4qwBocPfJKeG2kp
	xA60Yd9PkVJvmy1xmc2Oow==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427gqt9nkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49IIP1w3036038
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:36 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjjk911-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 18 Oct 2024 19:58:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czRWtlhM0mzrJuFeKBk5Cd/tbgMC8VTr4y8UQ4S4Konm4NMAjrdHINuJa1d6BsQjscDn1TvvqXX0cqaZOv0tjC0zeTi8S22lhtE24tioqmPU0NA3hx6xZjCMOlX3rRqOQlLPHbSoL9U/5fOEurYq74zO1PGYxrum7pia1/9Xm/xUzXXReKG1LEOJRed0QTfqSHVCy+RClYMcatnqu07jbup31WX1soCGXfP7NbG192dbLSgVsgHrqcsMq/b/sCZRR4dcizQErwnKBvxAafjHmWTRn30MoygxfymMSJQqlJNCW7v8WPWL5SWA9sYwWv6TjH4mxzxa+Q42bHxFOWqdUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxjUcqa+gCGCDYy2PxJoWYRQ7hyFH1PtR1rNX8y9ql0=;
 b=hWKTurq0mLNdBeUfTod9xYfn+D+Rb4L0rixGrCk/hKj6FjSokGw76t5f4PdovGek/yRjb4fmfQAZu+xCIjNnBpeMRDL7djd924YL1Cq3DfsPPomAh6LiIEYM3uDEyonUrqxITFb+aHJBzYukyWrdcoqU8mm+BCnC0QsJUe/LzS0phyjxzuYziKZlgyg+T2oaqNChGTsz7Boxmz0mwKVCh11oeOqG8lunK//LeKjDqmQ+xVBqaYn9rvkqvCmKlcQCzULkxFxO2IdMsS4QIdvJpSq0hiHKQamWeIN8hv74se6C8XEMYxzJeaLLfli+pyRcOoKEsakzSEyuZzYLx5gqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxjUcqa+gCGCDYy2PxJoWYRQ7hyFH1PtR1rNX8y9ql0=;
 b=H7i8oA9ZNN6CZrk7DYt0c/5gXDZtjXALgn9A+DzNUQd7Bsf8Fm1MrU5HEgFN5JDIETxsKQr/l7lRX6k2lKj+tLnZl3GvKtHJG04aGrcELNIt71SumGRIurUgr6TKpBPqPgcpZAixNSQ19FXdGUrkoM76Ud7bFIQOYqRlcZIFH0s=
Received: from BN7PR10MB2723.namprd10.prod.outlook.com (2603:10b6:406:c7::26)
 by DS0PR10MB7202.namprd10.prod.outlook.com (2603:10b6:8:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Fri, 18 Oct
 2024 19:58:34 +0000
Received: from BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac]) by BN7PR10MB2723.namprd10.prod.outlook.com
 ([fe80::59c7:d2d7:d428:51ac%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:58:34 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] usdt: fix create_underlying error path
Date: Fri, 18 Oct 2024 20:58:08 +0100
Message-ID: <20241018195808.270688-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241018195808.270688-1-nick.alcock@oracle.com>
References: <20241018195808.270688-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0216.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::23) To BN7PR10MB2723.namprd10.prod.outlook.com
 (2603:10b6:406:c7::26)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR10MB2723:EE_|DS0PR10MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0c9df4-5ad1-4953-5c85-08dcefaf3f78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W5jUIo4HP7h33Z014bMimFvfDaXM7LJu+zSYZD/PMmos87xaLhym/80vVrEk?=
 =?us-ascii?Q?V6ckqDG+BJ8cPE8cyo/ckFympRXOlCNAE/6RdrAuCC6LzaDCu3TFllFN0v90?=
 =?us-ascii?Q?9rLfzQFMp6YF1WPzrzYbq1BbVLogxt1L/9BzVIW18a/6538kHsK59Vf80pFi?=
 =?us-ascii?Q?DPzLBqnk4wTanOJpl3C6/6XUfRskjrzg0Z7DBexkbEmUfXwLBckSGzJg3H4T?=
 =?us-ascii?Q?EVU0aqrvujON1W9EZm01qyqsKpV0Q2R3c8MAj+AfsbtUO41smR//eoHpo1N3?=
 =?us-ascii?Q?JsXmguMMB+1CgDKfF9ZXBIhp32gxmowj7Xi/JQSk9/P9dbuYGcST3bGe5Fy9?=
 =?us-ascii?Q?we7oIeZ2xa4YCwfBHLZIQpID7ZKYVzN1rMPNxBVoDc0jFlwUJ3M68dNguU80?=
 =?us-ascii?Q?Lr1bqQL3faVNvc0ibvI0ABXtAQaCTUqlconuOZVn1zhluB11dmp3yeOmxXOn?=
 =?us-ascii?Q?NhQzi2ZUfxFVwemvA6vUkMyXytaXULA6wCORqlaLYZh8HhBDTL2sVRLO6ZNG?=
 =?us-ascii?Q?mihyoNcILi0zC3PJQ2MCUHK1iN/bjrqhm/l0zuPxEM35qLu0CVXt6UdAy+6/?=
 =?us-ascii?Q?SXiueSRbRs2KRKmy9rpOiPtg96ZRkECGd9hYAaVFpmWBvExvEi9+05axnrxC?=
 =?us-ascii?Q?xz97IYQRIxI8ADZmXnR+r5dUGFVbFsV5JG7K/ka096of9lmT3G3Pb9GmVFYm?=
 =?us-ascii?Q?l4E2PoSPejowudQlcmFvBS/B6TDqNYPPayytQRC2xhdKIhvwwLQ/NKQICPQh?=
 =?us-ascii?Q?Ly9EGxMA9B7pfBbblZdtB8MJDEI+lR6RXj97HHmTLQfz5QBlQrJZj2e2CNDA?=
 =?us-ascii?Q?KlnPtRM6FtzWRBLDPFUMpaahJjTIcn4jYhep+mj2/k8dzvGULFaL0ZCM7Zga?=
 =?us-ascii?Q?5fuuzLvcx13Si34n8MuAb11INe30CN2oSft8HJln/2qVhkVHd0xpMXBp4E/c?=
 =?us-ascii?Q?bSGSQjlLo1AO0Ml7v/0Y3ZP4NuDmEGRsQiDu8EmDgwApMzxjeegTI8VJAjNk?=
 =?us-ascii?Q?6A84rqTEM/fM2GmZWeLd43l4Fn2RsVRU3A22D7F/WTtQ4uArsDQG1ibmwA0t?=
 =?us-ascii?Q?tWtPG9zbnBASCplOtg3cD5JhB5saM8Dzp1zPbLuUCyUhRwGaywCS9mf0w9mT?=
 =?us-ascii?Q?ZQTI4visepG1Pzp0lZvi5SnWJbwvAJPyIdOAwKCHmPn53viLin+rn2QKyk7U?=
 =?us-ascii?Q?LIkzQbPSkeKXWIpoTFM5+TcJdYddEa/kMZEYzQi4yJ/ksk5+/EQrwVp+sZzf?=
 =?us-ascii?Q?Pj6iBleEvMmBA5xTqRHZwwLIVuWI5Hp3rxAB10EcqemqSWmBvtJa2fzM1h4D?=
 =?us-ascii?Q?Ilfq6qmxs0cf5AeqU1CY5/+a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR10MB2723.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X2KJjkZdmDJbD2ORX7pvGncjugU725C1VWmHb19FJB9U4EOlBvjLFTGNnsDK?=
 =?us-ascii?Q?WbmOGtlpfjTnLOlN24Cl3YKYmkKsiyCWeyZQE5GsfsD0cHm+0pUY0eBO/rhR?=
 =?us-ascii?Q?ikPzly31vS6j/gft/2s2zd4TaPZxZlQ11kyWcnaRihnazdvQunNmJfng7nSo?=
 =?us-ascii?Q?e6+kHV8nCS4HKNTUwmVYK4RTkuISjcvldfAZvoZ204KrN9uiQPonJeTTgVzy?=
 =?us-ascii?Q?gglVso6ZrpTc+ndGLTzPQ07NxegxJlBUSLPDg04sMNFj0yLvwvam2Y2yjSA9?=
 =?us-ascii?Q?mxVnGlrCUszIdsjpAOhPfnytkieaMCTK4FyaMRPA5Ohv4YpMyTeYUxZuX1Y0?=
 =?us-ascii?Q?cjxUfKARRMLBLivm5MS+V9aWilLBF0csGowlj5YiMb8dR31j02Mz3oGYd6uU?=
 =?us-ascii?Q?4QiEaNMd06B6JMOEDGcM1pbj8Aeigx6Bngy/OlTU7/R3+AN9wDHg25lAF4pQ?=
 =?us-ascii?Q?ymbVEG7p2smZTaaCxsPZY1q5Bh0y1OOXQJFqWTGBKqhQwwJpSbNdzlaYHuDH?=
 =?us-ascii?Q?DcFEpAuE+BXnXl/VnP7gK0XVGiTTZF/LkfO1nFlpKl/Quv5/KbS8p4VssPmq?=
 =?us-ascii?Q?/X70DfUSskI0nroZPhYxpoofwLQYQguwg6YZmA6OMuDbd2NQQWaCc5ILy6CZ?=
 =?us-ascii?Q?wXAoy55nSrOX4RUnJLS9NYuyBnPjdBDftVoSwDnhiQ1BClR47CGFSc1un0qH?=
 =?us-ascii?Q?I/t5EZxCtfnT8Lo1d2nW8AwL9BORB5vqCqqLbkhhVUBx0Ppn7bbtRJIxhyKQ?=
 =?us-ascii?Q?+rmoVR+plXKdgPtlZitlPpfCt1zpLBODEe1wC2wUn20z/7z/heY5tsbL5Riw?=
 =?us-ascii?Q?O5+/8OU9VLWn6S/xHAqJ1rz8HMrZe276+lmCBBrsC356O5WCh1jElXe1WZng?=
 =?us-ascii?Q?IoxjKHvApBLht3NuvEfsAydR45vGeWeuF0UuKuk99Y7ySygFiyytbvNHH4rf?=
 =?us-ascii?Q?HUKKuQfeJDslLoUw0hg1+nO3sRaBRGu8aKriYuvEHsxoHQUTUCu0MOymbZtz?=
 =?us-ascii?Q?apJ/IQuRTSOt46znBvzSAY+SIaJF6G6S9+iuOM3pfYszYpM9WL8kaUJTBONk?=
 =?us-ascii?Q?gKCr5g1KwrqTDZkd8qwAmEEsm/KK8rFLnP53NK6+HFWfR44kdFqleiUmUKa+?=
 =?us-ascii?Q?BF3JmS67JALK3fK2IyuT2zxTfr3D0bJmPAyxq3i/Rk6W6SMRAFc2g2/twOKn?=
 =?us-ascii?Q?zssVXZEUuZsQOPoF3hYrockxxpYsxV97Tb5+M7I4XQBtOHHiL7uOsWWTEFfX?=
 =?us-ascii?Q?8cpc+CNWnUfEvNNVVt7G/tHieY7eMGQIElHoJW9N+7I8tTf2aDE00/CHklgO?=
 =?us-ascii?Q?5w+uHiMgfxOWWhQjP7o26NXXu/x9lHks9f8DAZwQMlj1kYIiMlsB+CLYF8Yu?=
 =?us-ascii?Q?u2Z2hAM9TXMpLSc6OaqlSaa0CPPE8VQtD98mVWRa5fuJ/CyCjPGsfB8SE6XO?=
 =?us-ascii?Q?HGLllDwBFFemodXfALlTXHPxi1Az5Xshty4dieV8PM/Em6viMFEnUO8nONBa?=
 =?us-ascii?Q?80Yax4UyupqYbCQXpnMe3nZ+qMDPkV3BkMV777Hhj8Ov+iZoLAoBibFnvpQj?=
 =?us-ascii?Q?NPoSk2RoLlUm4DuYtWaRo4LwFe3CUuBeC2YfPWtG2p76utcQ/7xmOGitRRDj?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t7F50h6juROVjxmAu2zBwJCbH0agK36xQ/VU6kzLBgp8e6rYoOvdlECWH0Du/r5/BuNpYoa6Qlh0sYD2pBVxUBOuMyHAalmr4ACUvcbfSBUaLmHVozxOWAEEUVTXfuw8VrK2Dmxq4AxkJEv3unLNELyeaO54C50byqTEkP3/xx77ZiGIxNjyxSLDXviUODlQIOLMWVoY3Xh0t7Dblo0bZ6hKU7F/xVANkhQ42+AoDHvtPyYqTnuvJ7bmdwcl/7/flid5H1bJGhP2Zhz5YPX/MzjXtd/zeJyVbfeEyEmKwO9vJrsfkmo1MOVxnilWVWMtn8y3hUIA4SORcdoxK61yA31f3GepkoJQVcPJfR5FKoUu2K38DSHS1qbRwG6ph7+MfOaG5rdvAtlEStcq+L2MCtj8u58krDBEsqw4nQwINwq2ej3UvAZ2Hc8Sgp24OhcUQhpBLAt5U2qrlz6Hzj5ee4tE8+r4T+Hd7TfJJkJFHkbjSa3vSERmkWkA5wyJMacy0vO3yz97AL+3/VSmkYqCFpyuMRK0rCYbXb7RlrApvulWkMPbsV2stXxyzIWd6CvoD8d9iWFUUqCDwrf3QX7AjjKFyn7oNNQ0K4Pl6RuWp8k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0c9df4-5ad1-4953-5c85-08dcefaf3f78
X-MS-Exchange-CrossTenant-AuthSource: BN7PR10MB2723.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 19:58:34.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIsxDOjVJTNe5yaucO9RJSp/WKm8GXjtb+PXWrobCLTWUIr+Tun4AjTOT16VKHToT0I995qSbCDwZOd21NX2ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7202
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_15,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410180127
X-Proofpoint-GUID: DyIaomGVSunHISDYOYgt_Ne3u74_uHrb
X-Proofpoint-ORIG-GUID: DyIaomGVSunHISDYOYgt_Ne3u74_uHrb

On error, we were destroying the underlying probe using the wrong call,
as if it were an overlying probe.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 767d9a80b5e1..83d6f65a5207 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -274,7 +274,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	return uprp;
 
 fail:
-	probe_destroy(dtp, upp);
+	probe_destroy_underlying(dtp, upp);
 	return NULL;
 }
 
-- 
2.46.0.278.g36e3a12567

