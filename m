Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B366D307490
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825280; cv=fail; b=uUl6baHAVgX/XE1yTmGQNv77y/IHkb7rXBPiY1F4Hg5uEuvFBB9ZWJ5S3Z2Fjy3Okor7RDqMTCdXRwsCFQ1K4gsT7G0cAZgmPJNG4pphLnUFZSgQ4dFYAb5Ju/LYsbbjw9UciRP3dkwRieYzu1onLzpsNdpEj12M07LdO/YOQys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825280; c=relaxed/simple;
	bh=SaXt/01m0VknrAWOLtS8f3jiVMpu2gbsKvoUGw8vTVY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S923cO4+wYoTpPQI0idxn53k2/JhcDmcNQnEV53D3+HILZBAaNyVYUrmAYMQIP9bwOvWhMc9ExX6SLy0EegMDwEk0P8VJNjR/yT35n9nCB/HyknXO3CA0+U11nMN+ZeREiHHfrp67s1b7dRxkzeert/ucYI7nZ2zydiAF2UmL58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LEZ+WsLq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kOjqYmxR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LEZ+WsLq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kOjqYmxR"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMieeo019125
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Pc2F/h2BE4DkF5hTJbYmP4Jku1VKytQHBggpxdFX2zc=; b=
	LEZ+WsLqd1SN1m+ev6aXRkaT1bV0cqcHqV9mfVq33Z9RhivjVb7Ih/H+k1BDaOeJ
	lI+GKYQmzU/zoffWGNwjgASgHsW7bcxLuglxsARszkVgzpP6CVHDljs4Zt7idGpe
	GB161oyNrQg1kpm2OaB8GCt1JlcU8CQ/BWFgyr8jNgfqpoeFgLeVsYlIvcETtJrN
	MuKon5ADezCEWht/v9LawdlhTts85xsCHbkoQ7oVbvqbM2/QMb5k/E0CEPa3B54p
	WLwP92M0Sig3C69MqsZpHhbBvuOXfn2LEWuL+EHHLx4hO0WDpsBjIgZGqHa+ifdL
	Q0GfSSPYKDzNL2QGUoOvsg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxjj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1bPnt007432
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:15 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hkus-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTUM0/SyUHekooLPemBSkOKWWuFTrfod9f58l5bLqhta/ymWbb0t6PYmEyimVvwzxaHNXNqZxwk37fJQQr8JA5cwzDgFBU7n+VF9KjzudXnaIVkoe/hbzKyk+e0TfqgkVzZOXyeWec/x/yO5aAqHjhWeekp4pS5T8UWHF/cLwFkbtNqLO71dlbA/R7RrHGob7kK3FuJg13CAPSW6R0Y6hOsO8InlWqnQgr3unfYM0YPm2N4Vy52WO7fWy0VqQTnu6QZtyOc+mGAZ8mCdH76FFsigASptHcyaCLuxvGP308hydF4ihX3LxzqD+QemRuVPKFkn4pkni80HFGmQeqiU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pc2F/h2BE4DkF5hTJbYmP4Jku1VKytQHBggpxdFX2zc=;
 b=HSjpxolq10JsSSarFqBL0dZYrmFpiKUvZWECKC72JLxQDDHOSUqAv2bvRKIWXbLDfXkdxC53AmSi7sBFGiyCDT1iL9ld1PM5KP+67omK5XZqC+USaZ5vYwEYiiLJaTykdeix61ofqmX3Gyp7GkriM7bs1LkNL4uCj55S67wD5+Ot0DLZVvEELk+pyzmPZbMc2iXpSkbmfNUhOGMC1cLkGW94IcMKkcp9i6Bic+/sNzfgGaKI0IQb1BLpc4UNQ9U6wx4vua6873bAjDICkcmeneR7wYKr8WiI32QmZtz94jfH+SCJeuI2TVy6uwGO6ePWiLze1eRjygSQGGjriYN9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc2F/h2BE4DkF5hTJbYmP4Jku1VKytQHBggpxdFX2zc=;
 b=kOjqYmxRnGOgt3cH1GYlWWEPANbmz5pvI1Bg1D12jk4VyUaJPTQtAATwRVAoDtJrjIK/OVi0Km31mK73mto64cnyTedhaxGIw8VfRV48ucq5lL0ALLUmsLwJSddjcJKR5U8+KzI6i8bQIR+zmRg+iQaoe/ySn9KzkcrJZD8MJR8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 01/14] Fix stack-skip counts for caller and stackdepth
Date: Wed, 25 Jun 2025 00:20:54 -0400
Message-Id: <20250625042107.13571-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0010.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: 962ae605-29d6-44eb-c4c6-08ddb39fb63a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FFyRCfjcgK1B3Us4REAdAdmJTaWWcRZPmamjngAWysvmKz81w5B+Oz3wKbAv?=
 =?us-ascii?Q?eGYx2iXIdNp7LBISQTBKPPq6a5SJ2nHB9sxfQARo+0JWnCmIi2751gw5gNwE?=
 =?us-ascii?Q?wKOBp/eP3eQ7FjdnND5aRQSjYEutrM8uY92EN9QWNJlK7E1qZJ9SSvt5+/Iz?=
 =?us-ascii?Q?uXQ+HcVMnRRbpSleDZMLW+GuUPmcj2BwFAvD+lkAWSRCJ+Cgxs40KCggH7Sf?=
 =?us-ascii?Q?gWMnAoUOVPq0VH5HbEjSlV2yMLQLI8///raopQ8ZHxGszPd1UD35gJmoXNhp?=
 =?us-ascii?Q?BrkWUXXhql80Ibd7SZudabPxaTX0z8kkjnYnmWRl6pbSGeUYwH2RXYo/jQfh?=
 =?us-ascii?Q?mvRJHj4e4mCqPa1+LfoWJt6QgnaGPbMg9Bps18kJaCZMaRTVUFIipqgbmjnO?=
 =?us-ascii?Q?R717Epd4kiRJ+HzK+CjuyraTs+rO4xYi057Enr6jncsTdHISKBMIyvfrVTON?=
 =?us-ascii?Q?NtrPih+LOKeF0N7SfrI3Jr3uYli+pU3RZ2Mq+E3TWm5N+2AWyg1i+KCymxx1?=
 =?us-ascii?Q?5u1r8Qae8GuDyLZ+HDPQkOu2hCdcd4Q8+Er2D/gLNVyT5T6NYYPONh3Xd96+?=
 =?us-ascii?Q?7fDJRWBhh8kzwgemiUgH7MaM/IIbh8Pn+MeCxWEHk5VR5B98RbL766152yWW?=
 =?us-ascii?Q?4yjITmJOCiR7yeN1EV3p7JYzoceShJqskpFFf07MoMucElHK/x8uJjdydEh2?=
 =?us-ascii?Q?/u/bY/s97AVtLZZSTd6PoBHx3wSlbd2+eRT3CKCOiB+pPbudcFHkgGdN/sik?=
 =?us-ascii?Q?WlvCOV77tMSGHcfDJTMuD66VnxxriAU+zSymhC8xrLB7yqh4Y2triDx/lh/o?=
 =?us-ascii?Q?ZbNIS5Tgdn0TfQYGMMTHiXdBz/2QdaZdVZX3enWqhd+RaF8KW5J5E81EFJRH?=
 =?us-ascii?Q?VUCzK4beJDXUR3SQ1ukwxn01unvLH7FJM+EcATfQwMbnQeAisRoIX+22NYZv?=
 =?us-ascii?Q?5+HIjzqzGjddg/0pZAG/Nr4ixjTtbjrUH760MGitipCgTf17HHCNInQejVVD?=
 =?us-ascii?Q?EGOLr70qGYGBc48wUzd2VewDZjCY7729ntY9OiVf5faNbUxOy+xtaqabW3Io?=
 =?us-ascii?Q?Wii9r8itx4dX9NFBnoeP9Y3ngaVZ5oCGfTS0z/IdJ8jys6AyWSPG/HR02xBp?=
 =?us-ascii?Q?Kq1pQkC1YQ2QHo7o4thR+4cEHJXHT4Fx/GxhLP0M8rrN7+6+c3nhuIrhLbbo?=
 =?us-ascii?Q?vo2Ey4EFkmi7/ThxQMZk2sUwmk6u7cqtlKJXUn1G6NaEHJ6vVKH7xG7VU7fz?=
 =?us-ascii?Q?nuR//KHd9JKqm5ss3SQY1zN6LQIzij5UmbV7fjIo1E59HfaUJCfz58M96TTX?=
 =?us-ascii?Q?XALGJc9Wgi3df4oNH/KcWp3BWGRohWO1V5RdIR61Qrfj/BwUtkklEZhqc4f2?=
 =?us-ascii?Q?URzxGoHe4ZdyUOwrBF7qLs2vcNTgtKsIM8+dzspSyQszvQX+rYAIaPF0C2b8?=
 =?us-ascii?Q?47xzovmfPtg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I4dQUcoa6k/uzZinXXYF65WuPUn0sFk0xreXYZmKdM3LX/mkE6UZvq4dq0QA?=
 =?us-ascii?Q?jCu7yQi9yx4KOx+eqVBq3u+YdOE0dGuFq13Qkr90+pMDj6B31svtP0mvHNcK?=
 =?us-ascii?Q?aMHYEuqgUSh8zj5tDdyS1K5fJ/fgN+iC7etOKFB7NJq1TasapyDL1EK4ARRm?=
 =?us-ascii?Q?Q+QWr3DtO4cxquuQBr2yWQiY7Pc9J9yh7bhbTns9LP3E+4NKfcK6+8ihYwH9?=
 =?us-ascii?Q?Vlw+FRYuE3Pbfb6U+2hbuluFyewfnunVCUwTpvEuLhajHLAMGvqyB/tcYFrt?=
 =?us-ascii?Q?J0DccdxcsJz11Lk4UrQlQaVTS6SwNSwkIkgmdtNU/PxLqIV1k7wqyr14Uf/f?=
 =?us-ascii?Q?vFAi02/6vt8xzeM4q/8Xu0RNbGLFgVjGoDCOWWZD3IQDxjP+0zGKDMpk1pF7?=
 =?us-ascii?Q?6VkwUCtEpxtgu0FbkXMd1mvNiGL5IEKLgluRV8p0TPXpKmyaF9u/b5bRpEC7?=
 =?us-ascii?Q?Cgzop0GhG1l852bstgaNXAG4i/kQZBF/U7PlAHRtRUr4wi05O+F9j9r0m7Ad?=
 =?us-ascii?Q?5Os8kku3FyORPzeCDFsvjMhSFMnjAzLrf8qM8fJ+YLgDIMKRLVdpmXZLkadR?=
 =?us-ascii?Q?2NPwGTc/VBFDFwgojB8AokWT4w1a9YHOQY9PQnXJzTmyCWBvo6wA3eAE0ADr?=
 =?us-ascii?Q?dNKRc1LrLPEROO/YM6l8Xro1aB1EkjpQw0OeIfFgnULYABcj6CfC9Y65esW+?=
 =?us-ascii?Q?rFGbrNx+gfVjPP0nZiVYQ6q1O8gOed1CbtFn07Ix9ELgtzjOdC/IZyK0J+lW?=
 =?us-ascii?Q?w4lnB5wwfVZjaAfmqOQPGbH+nWXB186XoVBvF51Bixpc8yiq/Uawkz19YYdM?=
 =?us-ascii?Q?qF2Z0MefekdOLeorcGI03W9QDKiNWAlK1DUf9JYC8m2dTZoYppdzFVTXLobt?=
 =?us-ascii?Q?hyYODxHHbh7H2RYYDUceJoXPAeB3r8R4HyyCAYATouu5jj58CRb7dcl/S+tA?=
 =?us-ascii?Q?xAXkM0mRBbWkbdeg+guqhZELpxpl07eP5khNKQ2xdunqe/BXRGO4Z24m3OTh?=
 =?us-ascii?Q?BppatmonsAXegksCzabGnJVPlupsrhwxFeq6uPAtrayPOGC0dQCUnwXCmMOH?=
 =?us-ascii?Q?Icj9By6g/06q0TKkeUyOAdcf6hk9B0JvC+1eL/3GNFH4uniEh1Sxc5ggQyHu?=
 =?us-ascii?Q?dXSrVGnveEjr8T1eS4E6HLQzoJkOppxGbAdPiKYW14JFdSkp6nZqSx9FYYTm?=
 =?us-ascii?Q?ISodjMrRjECMIPx7X67Z6sp9E8cqiPVrInD7WGopvG/r9KFnBfpGAYTpk7RX?=
 =?us-ascii?Q?esEW31VGI6pJ6AV7Gcs+KUIBU8lsF6ESoyzv0zLms2S3fBTz2fmPdGtXsa+0?=
 =?us-ascii?Q?7LgNVjQBeWAHIRQn94ZTbJ5g8VxsACSwD5AbKTeWj1yuXVd1vIhdy1Gkc985?=
 =?us-ascii?Q?4XPQ3LRC/eyuVCMzUR0I3XzSeypQVvdMhNvqlCtizQ/um9MZEyKjLkdvAfU0?=
 =?us-ascii?Q?UvECYRGxEJAexHW4NvV+xRGM77JkImfR/lF4OcRlH+tpvVSDRhE+AjEenOAe?=
 =?us-ascii?Q?9xkk7y6q5djzVyqtn+RFpmObWjxesKs5r+nph7Tq6fYoztIsNqfUdkCTVs0K?=
 =?us-ascii?Q?EeFPjyRscs5mVflyh5271kD5x5ysgBMhZnAHVZFA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Rf5Dr5EVBzpx5wCw25Xtu5MkbTyLobjF8S8yZMO0wG+xLfhFGZ4Gw/FXDNpc2Nl/3gSWXuFAKms6UFMKsv05a3+Ek2iFwLfKShID08jpR9Oh6bAAiIpew4CKW81GIysIIXLCT9LMStg4ow8VqSPYXrL2xAJESw9XSe7HipbwePXe3/aoNH1bxjvOg7GBxK3gALWePcX6ejwmjwAGAsnw7d9pCFNdtIAEu0b3+2aqvW3QitYkEfLjUiyDk4tpPO4HszhswnLXDJfi6WT+/H9OlJw1PQenNY6OLzwxvj9b/8KvMQOm4fR9+fKcpaSUZhk7+GPgpFrKovRUI4wNCqnoMUZCcuX10WOh7KTXXyQJdik0JxTj+JWYTSZ0WlHh2iuWPFtnJU3XeCzKOjTg42eKqDQS+ommcJoln7qeacovmL99QBqI8WllIGfg3YOX5B/VS3jRyZRLoPAgfzVP6D98g2f+tIOtUTYl4y2KfjA/WQMQIqCdeNtYvSpzw/aHkLdfgaS7pZ6l+PVDu5PBzTf0ecb7b42pYGoinpm9iM26GRmLj7IT1spDZWxu+cVAmB4L+7IpGu77292kjS9LoxRzn/xxM4sJYFfRN31LtqI7thk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 962ae605-29d6-44eb-c4c6-08ddb39fb63a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:09.6539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFlbhIGH4GhkLqt7rUuQ32eCm++JJ4WvFNyIST9+Qc2CPt0EtuaJOas8NTsIrrf37MKYdNhvr59XYdK5MWY13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-GUID: C3P7kOsbmU1fvgfdq6R6V-mEEYhQzevy
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b793c cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=hAL8PR_slyO0inLZDI0A:9
X-Proofpoint-ORIG-GUID: C3P7kOsbmU1fvgfdq6R6V-mEEYhQzevy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfXwiu1bAIKqiba oieOf/beYMO8VXDZ1GNVEtCNBXVIZWKIQ9MAfrbEt+hXI1K28VreFX9N3/LAMe6WCWFHZVjin1p 5i+WsS9ALe3f2DHte9JBl8Hwd9kpkXJa6R3HhlOslozuE8qTWNM696p3mdcyE/Z7qn2Xwv00H2n
 wU5U62KhJ9f5mH1ix1XgAT5wJItUmCVW2bLSXqDNs/9HzXjfuXdBZZO/G1bGnGRE/ATW4y1PxNH OyjbJW4iDB8nQenXyBizbF0p6UlPPizHk6Vjxy9bf6kgyL1JCzAm9U5391Kq/XcMltJi2TXhs+Y 9Fj+V1+Eh4FnDtjcAViz6CzEN1U0Gh71TQUj4MrLOIqqZ9MQJtdCsE6pwZWbtAVS9QpnPJ24QPJ
 PD4zWECG1/8gjF+aamcNi2sbB0UZ8cTB0gmpmKa+WmUvDIxDck/LNZnKRHIPle2au1dPg9OP

From: Eugene Loh <eugene.loh@oracle.com>

Apparently, when we call the BPF get_stack() helper function,
it generally knows how many frames to skip to get the real kernel
stack.  For fentry/fexit, however, this is apparently not the case,
and commit bc65cb44d
("cg: allow providers to specify a skip count for stack retrieval")
added the ability to skip frames for fentry/fexit probes.

When this "skip" is needed, however, it must must be even deeper
when we descend further frames, such as when we call dt_bpf_*()
precompiled functions.

Add this support for dt_bpf_caller() and dt_bpf_stackdepth().
That is, if there are stack-skip frames, skip yet one more frame
when inside a bpf/get_bvar.c function.

Note that we declare the skip count volatile.  The compiler might
optimize code that uses the STACK_SKIP value, but we will subsequently
perform relocations that adjust this value.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 bpf/get_bvar.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 9625e764e..99a6503d5 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -53,12 +53,17 @@ noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
 
 noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
 {
-	uint64_t	buf[2] = { 0, };
+	uint64_t	buf[3] = { 0, };
+	volatile uint64_t
+			skip = (uint64_t)(&STACK_SKIP);
 
 	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
-			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
+			  skip & BPF_F_SKIP_FIELD_MASK) < 0)
 		return 0;
 
+	/* If we had to skip any frames, account for the dt_bvar_caller() frame. */
+	if (skip)
+		return buf[2];
 	return buf[1];
 }
 
@@ -203,9 +208,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
 	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
 	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
 	uint64_t	retv;
+	volatile uint64_t
+			skip = (uint64_t)(&STACK_SKIP);
 
 	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
-			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
+			     skip & BPF_F_SKIP_FIELD_MASK);
 	if (retv < 0)
 		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
 
@@ -217,7 +224,11 @@ noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
 	 * If retv==bufsiz, presumably the stack is larger than what we
 	 * can retrieve.  But it's also possible that the buffer was exactly
 	 * large enough.  So, leave it to the user to interpret the result.
+	 *
+	 * If we had to skip any frames, account for the dt_bvar_stackdepth() frame.
 	 */
+	if (skip)
+		return retv / sizeof(uint64_t) - 1;
 	return retv / sizeof(uint64_t);
 }
 
-- 
2.43.5

