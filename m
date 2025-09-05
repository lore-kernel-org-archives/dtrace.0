Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9513228641E
	for <dtrace@lists.linux.dev>; Fri,  5 Sep 2025 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757092054; cv=fail; b=JP+uaRyvfIfofv/umDGodQpElFYqcLURghnNfZmtJRO8i/GRWB3ORTym3Du7TQZWMJPgybUAXRNFA9QLNCYCktkSaBdahnJVqLuWcXhN68gW+E/fc2IsioIOxV4GE4bcT1wzDglBYGOyq/zgjrR0xAUhTcpounpO0Z83laRsUmg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757092054; c=relaxed/simple;
	bh=kqa9/P0VjBUOogNETIOEg+zctkiSeLmshdKm4BhngpQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bfmLJWYcOSUn0ANglXCWHz1TWdH0OBTLyfRz84mHNavyokK8ciUu1va/Y7summVHIJ8HaSUi+AHO9RWmyCg0poIMtJavARcomBr/qnzXU60KFLgMgIzsFGU9DqlVpKpa5IdMw9CL/xjFQHvTnbM9ZeUUmgBY668S6c6K46d6JnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UqPlM3xM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X5ZvwWDV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UqPlM3xM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X5ZvwWDV"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GrSo5001311
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 17:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ewaNuQB97hWTSm6RVO
	JahnJN1yIFJIGbeSnl2ehjAg4=; b=UqPlM3xMRF37MOP39CUtePdZ/FOzOCnX6K
	hkHEh0P6bqt9cAczJ+Yr1Pczk8PIxWTEJsQZmesXz5IocrU8+pwxdttqpPHXCUo3
	dJ7RFAnXMQMr4YFfvpebm/36wNNwWXNptNfPHhMe1a2M2o4xjfFIM3YwgyRPJ+ZQ
	KPsp+C78MrY/ACqRJxKzqJFE6ATPRn+FkFqS3qxnxjn9an0ndd80zOPeKFZRgbAn
	8zskfyRcp0Iv6hNoK6YnahfcQq4A1jH8gHMPlAWbQ9IrZdb6St5436pddRuMAzwF
	RFLpO6jqjnhbpnGPyPSibrH7vT1U4lpHSHuoXcWJgZI4XE72NPNA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4903sg00rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 17:07:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 585FKLWR026253
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 17:07:30 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010042.outbound.protection.outlook.com [52.101.85.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrd8vfg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 17:07:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep4QRzXScCuSdOsx5vlWDV05C01Denf4x3rEN1mHpoflAKgyV0dJit51uhrkbuOn3jRE4Cu4YNyzCXZytmIW5jFPmZ5DCquE3NxwKcoDKsJEkotJlLa6TRvIYHLM+qIRIze/GgPvjr1s2MJoRJ2n02g38lE80ncKEDPafhkWCA1Q/pNJihYVCpk6WCboK8UVSK6IaQdWbtefGdfNzyz1rwOQlLFiQloNK6eVqx9J8m3VzFZnJWt6225wBzia3Yq7zlswcWfvlky6XKoVw8Q2qKow84xRZ4Mk7H6pEpHgl7nhAfSvhv2QfiN8srighGLcJUINigo3q7TdcFqQQWkJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewaNuQB97hWTSm6RVOJahnJN1yIFJIGbeSnl2ehjAg4=;
 b=UTirRyDL0ullpDhFw+Fc4khWz4VIQR4L4ZUSpswLuAyI9B08VeTg4la5hfeDrsXBGuj+/vRHzTTCknnS5x7JBcWOIN5sZQ+F6DkCJiUwbFDtl6+fS2Ac6Key7QQvA7vIeZUGkMQh4mXMq0d49hXGRYHsokMuH+L2UNzIlvxsrFoZVh3BJx4U098hOXk9AqHCtavz/AmZVrxXV6mT+sxwKmHOAx1pvO31jmQ4YIwl02BAEXAVoQP+whjV/h0RSEPeO7vTGu1Hf1w0sHLkJ+HNBwJw2RbwDNFhNISi8IUll7kNok/HhYAP3JSO7wUYh7fj+iRAvq1shBTkF89Swh+SlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewaNuQB97hWTSm6RVOJahnJN1yIFJIGbeSnl2ehjAg4=;
 b=X5ZvwWDVqs1k9w3Vc6K4uaZaOQv2/0DxqIEAwi85DVmO06dB2vO81rZ+19d9f2A3Hs6iqj+qYlpZC/BLgfesQf4xMjQeCJZ0bBWeFFUzv4i0NCCsvoaaRyvRHX4l3k04lzhsKbbn4WSYFvU4Xbkz4VhNLsCM573E5TfUc5HUguk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7160.namprd10.prod.outlook.com (2603:10b6:208:409::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 17:07:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 17:07:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Update DTrace version string
Date: Fri,  5 Sep 2025 13:07:15 -0400
Message-Id: <20250905170715.11981-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250905170715.11981-1-eugene.loh@oracle.com>
References: <20250905170715.11981-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7160:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d32e09-cea9-4f92-de3e-08ddec9eac8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sJzb62940PBF7rfe5IporqafTUu7GspIsJBFrlGsGgztUSM39udVE+sJj1+x?=
 =?us-ascii?Q?s/enmjSKntxiSr1sc4Y+tGLeA1AIHQX0VavBj+GEra4mRqnaPsftNuyjTvDa?=
 =?us-ascii?Q?uhBZE1pvau1lxbKo/rOH1e+6XskNKG6WTp1IG6fHiSh2rTdf2P1d+Rd9ZkRQ?=
 =?us-ascii?Q?oRAblkvc99URL3YLovIu+mRsXlUTAL+e6mq/3eHiny7ki1iIK5BQN7Tn4u7o?=
 =?us-ascii?Q?ZSad0yRHhUx8rnefqhHtfRm57rH82JpLkSf7j4t+Y++tQtABmWootIuSFOAD?=
 =?us-ascii?Q?dKMkbLuJqqfJ4O1izOiGuTJf7AZQ6VO3piwvCpa+rrE5M+uOvn8g2SiCEZ4/?=
 =?us-ascii?Q?SNmHvMfXWRRem8yWPBbFCPPQnVeKN82GYllZ7ohxoeO06zmnDfCjlIXNWJvj?=
 =?us-ascii?Q?I2OlSyKWgqnc1NbgwiEv+9r7JhCVtHhbqyO3AKHWfsGqLBcJzJR8NDmZ5gn9?=
 =?us-ascii?Q?OBlZxYkRjQijts9qfQU5tEwsuMVlTvOJEOipdtXs6Ixm5FC5In1pR279BY2O?=
 =?us-ascii?Q?4kL3DY3w37W0D2GMCD5XOqIEgqbfo9jZlNXLhtSaqfIjlYtkxUfjTiiqCQTl?=
 =?us-ascii?Q?keS1a2WwD0qap6TavMA9zDEsDiVC5DfHvnhxWzN9P8PrLEQ7rKslcCfL1FRH?=
 =?us-ascii?Q?i/gAvZA6FbHAGjmgCqBqcGmttJEdXvVDuxITHAfELG8SpWV0nuYIHtkbj3gU?=
 =?us-ascii?Q?VsEGayqbZZUyBZvUV6o1c54z3MfcBtZqa6/BvMnftS8nh8mYemqv0sJeBN1J?=
 =?us-ascii?Q?vT+0oZJyo6K2NbhmoUrKyfvSHSPW1CkPuikB48mFbs6aTCwrk0g1iiLxU6fL?=
 =?us-ascii?Q?10KzjK391nI42KvJGgxTI/iq6kteHGepJhQK5/EYSYny4wsXGiiDgGIt30NH?=
 =?us-ascii?Q?bgg5hPjrCDJZiY3pvvgHXpWfDE0yHPis1vfeJwLykPllJAaQUnyG7+nlULMi?=
 =?us-ascii?Q?sBGh1Y3o707Xyu1qe9kgsn5Vl8RPh6IH/2mC8fEk1lMz0WadE9m9k4jBUOqO?=
 =?us-ascii?Q?OW8NpjaLttmojBYAfXRpVFfZChODDNku7jF6m1KkILOd6AyMgeV+kDYeSMMR?=
 =?us-ascii?Q?E3TH1zu86qDAU3wcGDkbrFv2HxBsqzoyG4J6UMGJIPAy3Fi1YMXb6SutUCMV?=
 =?us-ascii?Q?Ted/oQKCWLHkighoSoKjDF/YOqW4D3yf0xYp+ekz/sqE3BYpGWkSVR8gRH3u?=
 =?us-ascii?Q?vleG9qFm1/3Wv3xIFaff1knmYdekWoQ/jHIXVvhfNkcYoi/pImO9zAXOwlR4?=
 =?us-ascii?Q?hHwf06t0twn51IDgo9HXnnXI1WZstQnA5JKRewjywUXjPmlcpzs3il7fDqle?=
 =?us-ascii?Q?Wm6fbUuB1qgdKHQg1mu7fS7qiW7EFgQSugqRDiQvuQVsUGIll83yQOw2Wf3E?=
 =?us-ascii?Q?DwifY85vCmeCvJGLkSjnpWi4ltEpLca3q253GBG713FvgJA8pcISlg/+OdC8?=
 =?us-ascii?Q?gDT6JacTmaU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y7CZa8jG97QE0E1ERB3PoUsPaTMk+ouLAD2ejlwXWYSicT9o9SN5Rl6FTTDC?=
 =?us-ascii?Q?RXHpxbCOUXU8l01dwx9IazG2wuDpCvm0G/iMesmNVypm3A0cnw7WiOuqtS8K?=
 =?us-ascii?Q?Aefu++4mUZIGrU7Y/tbDzMKK5kfAYwGp6Gf2zOh4QA/6PF2+JjGRvD/tu0Yn?=
 =?us-ascii?Q?rvM+tKSXvL6xWZioG0PsKnBdcw3nRiaegc6iqRrcQlw7/DdWwvUgCAK1lz8o?=
 =?us-ascii?Q?KU1z8vOIT7PYHMGjgTqcfFnwT3Qhp6wj3eWI7XfyyrXXBppEeQMTMoHTt47M?=
 =?us-ascii?Q?iaryIOfzDFDiMv15PZDsXpH3SjeLG39tdr68rZALGUjwYP8j1uWy+X8Oe0YB?=
 =?us-ascii?Q?S9BPgJ+NPKTS4XjRbe/4Ly8nCHCFHIgGv4+f3PGqwhAcJiSNOTA6GuHSNeIZ?=
 =?us-ascii?Q?ARHc0M3T6caoaKT0zMTgSyCHkIe3+dkC/tvXcW+bs5qKkP5Yxn/+A/ZfBq3s?=
 =?us-ascii?Q?gm478BxXualra73QwuywggYloGBdzcWFSSD7XwYeAgUIC5iHxfR8EPeM1/En?=
 =?us-ascii?Q?T1VLnYWXmwFnvWHd5+XOalvdXcRj0eS9NERgEbG56ojKKeBNS4IA58tc+hYY?=
 =?us-ascii?Q?ngVEw9PT8hCKFfW3OaqHQ8//jEiI2K5tacfORb2a+7dh2cmo7aRVPIEMKXg9?=
 =?us-ascii?Q?msui4sVk8lVkRkMvKgYRKATsWlfmJJ70QCuhlWkVucpREqaY8JKGjW/Bko6V?=
 =?us-ascii?Q?+/fEgiBlTWjSZK22q7vDgWA97C7j7k8hQLSJkzZGxq/xogq8BfkcLw+tkrm6?=
 =?us-ascii?Q?h3AXQIX8MI1RL8Mi3bEsXxpZxrTPnyNsskhPBGq39QayIfYUaZWb4CSyKXq5?=
 =?us-ascii?Q?fkwV4+wl7qg20JEzRhTfcrFNz0aF4w+hrGpKCbe21lan+xMH0KXB0dleFHY2?=
 =?us-ascii?Q?1LR+OmI4VY0l2UzDLNkWGeR/LLdMRWBMbkun3GnD+rqs1aeqYy/wk/GjIhAn?=
 =?us-ascii?Q?4wHtooUQzgegfKnvO1vvV1pJelUkkecYTUcQKkpxUoLufTXg9iUI5cuhtmFg?=
 =?us-ascii?Q?O+sAjGP1/RtPviQx5OqvoS7TTFC4UU5rj56zDD8z5hjLRUzh9KGelul8AzfZ?=
 =?us-ascii?Q?6cfQAndsi6EE84ZuuPx24N+8tZzMSRXKOqchwh/5LyvNUdUFQra8vAWJpc8b?=
 =?us-ascii?Q?wybNn/Fl6iAk6SJ9TZXeZpADuHfq4702292/YkLMJ7R27146b9Kt44WIZ2lZ?=
 =?us-ascii?Q?BVjDH4rmjuq918d3sW9QiMZqe0dg5k8xgzYCnaZ+xiryqWGWKqcfKYvcoO3i?=
 =?us-ascii?Q?uSd48my54fjlGcm3BT59TE7yFET7kGnJZ2VaPM1oDfyzMyEcJPasyE5ipVSi?=
 =?us-ascii?Q?O4jAPNicC8XWqKroQCrFtVpAwGI5EMmcTPWyKHWVJA7WP3rmj/NJMJLppX9y?=
 =?us-ascii?Q?1Oa66U0DG/n92abowo7ZqvCfkBvGGtIz5K2HZ7LhGE3Hq9cMt2HLpE+XjdSJ?=
 =?us-ascii?Q?HxSYGhJiXZWBQE7upi1v2JR0fEM9PzWezof2JzLAPQPY08s7M4Zg1DfxL6no?=
 =?us-ascii?Q?AQUKmdR3y71sgKFDUOB056HN18LiyYLfnyVKYJuHdX6GiK1WcyDogIpjiktr?=
 =?us-ascii?Q?UdjLfZITUM9e6jNJC5GVd/tN9mUDhr+NKMkbTmyN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K/v6l25S8Yr2KBoNdsjbHDbKxbd8H2K+7zw2IkhvGKULgnk8WN/Blp2m2M0UQa0XaiNXZiv7qO5GHdXWO+FW6I0WZNLNF+6SI03zwyQneuZJPAGoWmt4R/NZ7etNnNDy0TVSTJRGssqpyWc4dMAYABGKKHLc2OTz4ZW1nEgxXJ82j5kj4GANcAR420QlgDDEZ4cJHNOA24KXJ2SOX51GdvnRITpo8rnlLqD+O9Q8lxMcd0bb4EEsQtlqhE1Ms3rEgURIegHHB+0lFdHG3o7f0t9GfaxQyMf0Nkv2Z+Q5cit89K+oHA3n/NCbAsoy//EeSDINgvg0eT9FWZeSmFKWdX7gzL4xlMwb8HUl7CR3/eQXdkmy5JUf7NCNur/7ptFJiP3hE6nxGIxEipDOeH6KILByiTsU44omNTKLPjzZVlE6/Bigb/ecYqAeq8atvBVR8WGJdysIih1oMZYPrfc0HSxVS0AlqJdFrZ3637o4xdy05QZUMyfuaHWUoxRQ5mu0X0C9VegOP04E/e/skHCxG/RLQMrjvqIveQRO5FNrWowi2fl0pzZCyUPDluBN6SoP+IeitiNyUcJr95dOIbuotYpP32ay9unLjSAAMFKw35o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d32e09-cea9-4f92-de3e-08ddec9eac8b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:07:20.1969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1W4+5UtNXJRZddqfThoi3qjRonAl3A31uuYZsBN0t0twkA+J+acpjxrnc0MRiCQYbCNn4IiXeim6dbn2ZgB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7160
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509050168
X-Proofpoint-ORIG-GUID: yGayoArjkAkc2ycYTEgGhWSLkjO_XUU1
X-Proofpoint-GUID: yGayoArjkAkc2ycYTEgGhWSLkjO_XUU1
X-Authority-Analysis: v=2.4 cv=UYlRSLSN c=1 sm=1 tr=0 ts=68bb18d3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=IYCtlQWohbVWweS0zsIA:9 cc=ntf
 awl=host:13602
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE2NCBTYWx0ZWRfXyFTjc17Exdtd
 C1KgTnHEatjj8kCLLBxiV/cMsyzzp2PfW7oFFcXXA2eek0rRaRamcMKKQ8aCoU4qon+3lz3mn9i
 0BQ6XS17QvOMF3WdTZIInZdZT13iDrajyKDR+FmpL8KEwib1O45doKrgpBvJ/ljjq29okXp4ejS
 O6valfUAPgSw/CqlXeKB5hIn9NE41xUZRKdsb6r+y/jSWLuYvteeYaYkj+/QASNEmlPrzA2upvS
 gqRcy9NqOiRmHtai9z94209VqSD7Ryf7F4mb4EEnEoyJEJvhfBvmWrtPJU62Bm5DIzmj0ANwahU
 V0FAe4FtBn81KmcsUftJgdwwsI3LlFPWczF0YW7V5ADkyf/RCJrncQnaZknjZI+tbfp2wLvvXh0
 cPtK8zqHG5XgM/OXEYE+LNgjcMT4Fw==

From: Eugene Loh <eugene.loh@oracle.com>

Commit a48a76472 ("version: fix DTrace version string") changed
the DTrace version string without addressing associated testing.

Update the test suite to match the version string change.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/dtrace-util/tst.APIVersion.r | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/dtrace-util/tst.APIVersion.r b/test/unittest/dtrace-util/tst.APIVersion.r
index 0d88b694e..72d03e71c 100644
--- a/test/unittest/dtrace-util/tst.APIVersion.r
+++ b/test/unittest/dtrace-util/tst.APIVersion.r
@@ -1 +1 @@
-dtrace: Oracle D x.y.z
+dtrace: D x.y.z
-- 
2.47.3

