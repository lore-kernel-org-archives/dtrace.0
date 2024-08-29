Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A42A446A2
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909193; cv=fail; b=eh15SokEPM140KupO91MyJV1IKwRRJdSqpVivE5u1r4jBntUD7LWxQQURa8eYhQtqwZ0f9WxDXAuqGZNgu8CHpAsQf2WNsBA5ooEHTnDQkP7jQcthhGJK+NMIwBb+JkJumvIUCEDwF7G1IRjuHcUJNG0r4n05cm0UZBmBfQZnr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909193; c=relaxed/simple;
	bh=/MxEcm7tUVg2DIAtpa3G5AULeoC9D8ALb0Fxb/Su1d4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jqhNiE+tntoyYNJzIoeaYqSEW0axCW7RmN5nxIYhZEimt1DUPTvHiFSJ0e5xrWQTIRandljGTetHZRSl7KzMpfN8H5fGYZN49mSXZE73k71+yPKEudLpb8H7RdOIKLWYPoIw8Rlkl09CkkMt1BD5au4WbYAXu73Le710FbUTPXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=U3nUN+47; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JQdACYMH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="U3nUN+47";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JQdACYMH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1g2CC006650
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=29jwkURHNY66Hw
	9RiiFT3C2+p65pZCf3k7YOShBq46g=; b=U3nUN+47vShsE28ViEgsgBO7hkov0S
	hvBOVRoaDzIkB37kR6DegrjkXeOcmc+vq2NZprjCH+E9wrOupVIWILWf2MiTGuvg
	5eCyWk4GTMVp1B6yudhOeb9LGvDa5qfoJ8zC39IfbUCb0+D9dziMGO+rGIERcsLJ
	6wxR67VWea31CDDgjBg80NIyxDKsBVDbfXazNp9xuKfJklfzKOgi0qQmyHmRiFNA
	HDsEFaQE2i6LzhrIWKMZ8trN12sfdIVzhRDVjxc5s46dwx2LSORZTq6MTXsSvb2B
	egj3QijA03piCgC3ienvxVDiWqi5/dfLsPKVV28S0AjeDe5HyDKwAFKw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu9er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5F4dv034714
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:30 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfp7n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DbRQTpT4kZaceBG5agiPWT3pI45PL7syrK3wGiAQHLGXtGbSjj5ZqMxKtPG6OU8CzxnpmBwSQkKNTrrp/pxa6Ocr1h9ZHHWODJDtLBnL90W1XmUIZPqswRpbNY0nlU4oTHLaU6vCsYwJ+8I4y2D07+BBwoiTP3N5racYCQ1mKYmV0iIlklX3oyMk5YBuC0PdvyUpu3bGBHV92KYmiNXUWFb03U34MxbwC7e565NfWEaNahqEz/0aCVwrm45GrUUigGnx1R8lDnhjoGMwPKecy1TfrBV1dLteEBOHXBrD/JYbs6RUu85CHAb++cvo5Kvf4BTqCIyCh4LboCqXwrS9hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29jwkURHNY66Hw9RiiFT3C2+p65pZCf3k7YOShBq46g=;
 b=cZtU7M6S9gVahD3d0ZruC37IXmCzUL2gGI1XHEHsmpBNz17TK275nBFfYSauf4NDpHDMzxd0NZgRKL8Cj5jZ+Ot/1OnmSzuu4MhfBEIgUMgLG+YkqCPyDeA+s3qIjqB0u7/pNG/J5+QHQVMQIfIsSEeB8WAxu4IRmkZcmdzzQg85LYX2KXOnU0EPxdnZUlycnDG2/KObYI7ACgp9GUDsXHatkz/CS+6ibtOkTSlQF8fvWXiU/pNNZxYQMZ4hDkt6dNne7l6p1yi6EXZf3EB2+2rN+jM3hjvEbPT53+/RmR2jk7W+xHv6KoSS4yYQyfcPpsoltVb5ftg2bYNXOfllpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29jwkURHNY66Hw9RiiFT3C2+p65pZCf3k7YOShBq46g=;
 b=JQdACYMHKxhTc2iXXlwvLQx3knbvTHT5UkFPakpXQl0o6mGWp+ujeI+wAj4R52Q67BqX116RHDnD9NRs02whKQyhOPyaQhbyKLCPaMC9+yWP0HvkyM1sKtNe90P93E2QaTjrJS00rm09dM6fGAIM8JmTIsYu8VWfzA4N482+9aI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 11/19] Support USDT wildcard provider descriptions
Date: Thu, 29 Aug 2024 01:25:50 -0400
Message-Id: <20240829052558.3525-11-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 835f7c2b-875d-40c7-0de3-08dcc7eb212c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rLFomq+aJi+sDHbaLl36Ko2/AURDHwA+rDkJQs3GQRvyhUyxT/tRxEgkiSDK?=
 =?us-ascii?Q?6FBiWQwz8SnlvW7kI9yh+Jw5N8ICbUlQANfd45x5r4xyGaBGRjQly5k8Y4So?=
 =?us-ascii?Q?ADOqdXmTEddoKrKqmgCyEUNLFYrqz6WuPO5x4RzxOHMjvi+8IBhGYoHDCVBP?=
 =?us-ascii?Q?D5VtRpI97rSXeffrtMYNzPMgZbo9lYwcOQnJkBo9ep1O9uwyxPazIUqK/Fkd?=
 =?us-ascii?Q?lkdAtVsOIlSEMyjEylm466o0L9glV48y5KbUbxChCyp/UwprCKpxFOTFax4u?=
 =?us-ascii?Q?atWhEp0Auj16kEUV9QptKv5rHoiznuiAxUQum+rDd3Qb6u6PKtXzUv0RrzoD?=
 =?us-ascii?Q?raPTKiaR2DjNsUfjMVVTGwxY2wBJBG73BbCGznraW/Ecl+CYnJjl/+V0ImRk?=
 =?us-ascii?Q?1KLqK9skHUq/WPbO/g7LvRFl1Sdh5ezXhG2MtH9BCTQgGGilc11lt7mRIy41?=
 =?us-ascii?Q?KQ6EZY0vxEfQC4uDGX72ybmF6Gvs5IKKV0/RnvUncrvPIl9vDEvGv1nV+Lie?=
 =?us-ascii?Q?Xek9qJ0ra+/8tcPLr/q/7W9p/MU39gcVkpVG2iI38xlbp63dIvO57YXKyjRN?=
 =?us-ascii?Q?D2gloEjnnW3DNpOjbqlDO+ovrEtpjKhHagZ3+mpbSymjW0g6Yy2TLBvvj/0G?=
 =?us-ascii?Q?QM9j1foS0UK09J4PifPCQXiYNSssgoBZBgsNPTUspzOLxBkq2hJqRJOwuOTP?=
 =?us-ascii?Q?sYSBuAeyuIXqXjR4+CS01//2MuBweIAwUNypYjwQ9b42X0ydt8wiIOxG4NUB?=
 =?us-ascii?Q?INqpupj/Y3Q3m7VEmSoyrhP/an0Uti1BaEZgthBKkGAVeN2ikHoQHI+Pwm5H?=
 =?us-ascii?Q?V0xg+lvoiY8B60aeGP66SEVccFvp7uccWC7qbIAwQiP1+5AwxHQbU7I6uKW2?=
 =?us-ascii?Q?i/oywR+BumzRNmvfeWRDGEe4CahjntEjVfoB8U5PVNPn07wt4A2GRDvN9vMF?=
 =?us-ascii?Q?KtY9M8c9a3RQfq7i8JUxrDV0H/DXH2tTJX4/6jTCXZZDNP2hKa+7Q0TFGi95?=
 =?us-ascii?Q?pWa9PmE1IO0THKLtzKuVTGSU2T4npsX4V64Ub8YRXcR8Cw/CA1PUMbdoS4AK?=
 =?us-ascii?Q?6YZQBA8dOhxmGe2MXE6yz6uhXpFm8MEYCVetYAGnI0J90CStbgohG9QPB+/b?=
 =?us-ascii?Q?nZaHQtNy8XN6rYVE387UO7bsJiCoRI2I+UOLJMv8Lhtrt7oRtbvd6QZBRZ39?=
 =?us-ascii?Q?PiBictnoX7IKw9Pbsvgka9ox2CKKsc7bktwtF8Qkfsu+fg5rENW0sgFAZEQu?=
 =?us-ascii?Q?Xa8uxMmWXd5pmZSso0wmX4Zm2+bjzl3lmV8Yv/dd86ZvIyEZaSgiwPIGUD2v?=
 =?us-ascii?Q?Gy4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q5CUxbHxrAPUtvQdEhssMHwxmgjjq8Ey6zhKRlZK9NvJVNhMbXBj+iEKB9Fk?=
 =?us-ascii?Q?+xz9TePHl6AE2iObVjcRcRDsirpXaTGYfG406ihC1ZofkkzkXYKZamfGLmlK?=
 =?us-ascii?Q?jeYMesmwSrdSLOF/28649VwABTaoqR+0zlPj61iWLZwCJK4ums8nIhB6Uw5N?=
 =?us-ascii?Q?JMuv1D07sPWz/GXrxkWeIm1DKCHecugOfBkQxn4Dnu5yvqqTLHbLxZJK31Nc?=
 =?us-ascii?Q?+YGRYjXGaZebb8vzIIgR0TdTAYoZYb4gl/nEpdCH6e5wTZKXWqgFV+YaWWGh?=
 =?us-ascii?Q?WpZc/094UM42+oo5mzJwVg6n3p/lakW4oXVF4OyO5kc1Swo7c376tSM4ZAwf?=
 =?us-ascii?Q?pCEeynABnFePpd+uYhRhslkCE34uk022gbUTF4Nh80m90+ru7e5dqDM32JM/?=
 =?us-ascii?Q?GpMDAAsn8emnXBhkaPSs2XXgwhrjQijYNzXZ07cZcmbZK2yoPpQBt2jaZth2?=
 =?us-ascii?Q?1TLiVmgYlDfgAl4ctKf+vZCUIvRYfsrW5MmzKaGMntLFDlaz9isiv2rFT+17?=
 =?us-ascii?Q?H6IukVImbVxq7qoSzuOGlT5RS82aq+K2r+W3BB/j1+Nrp2nz+W4Lz43oBR3i?=
 =?us-ascii?Q?iMS87tW9PMwQ3cdXI+BoOVsQAGDQiaHM0c9vKZ6d0qsXuc8YWd7roNHGZJnU?=
 =?us-ascii?Q?ot3JNm114SsQhz7tQvmSKjlvOIpIYXZEiiCizmr2AV+EmpL8VIB8rkjLd9gW?=
 =?us-ascii?Q?1B+exZzAF0ggu1h4ClnxNS5CIkwiKkUb+tp98SiPCWxRYDiO6sUu8cUPpuVY?=
 =?us-ascii?Q?fuhcvfQbR2wsQlA+yTEWwL/q8oh36/vc1f6NlzedfSZCorjeXayO37xv6iSH?=
 =?us-ascii?Q?pQtcv1ij02NYqxl6mlRsQfrGVauPqxX/R5e0Uvze9BG3LGsB89icsOhRuILV?=
 =?us-ascii?Q?m0xCSKOYoS7/MoNY4i4qAVVHUnkzpPW4LWCkYV7ue1OlV3zqZ9D7R8CIngnJ?=
 =?us-ascii?Q?q0ie24+g3G09V33KSTvy84XXEnf2fdxdbh6djWfv7J1Go000AjX/tU6SxRL2?=
 =?us-ascii?Q?8e0YlxpSDVY24TKhx14+xCS8zOUdystK42Y3ICnNRd4Tj+EFFYZI+/K2YsJ1?=
 =?us-ascii?Q?lBMrJl5vWtBQX7PlPe81UyUHjqNQL0DOy3ZcLmxKCzXq9vKzabTFqaCsvxaR?=
 =?us-ascii?Q?nDeGOUndg1JlknBlQf2X1+4IQN5Orw1yhacMZ9vvgTjbPU/aGbWuzPD2mT6J?=
 =?us-ascii?Q?ekh0cq0LyQJyxyBfhwM3E+WDAnSMFehdM2lUv/tvq+DbNnnaKMV4ZzcZNzdv?=
 =?us-ascii?Q?wq16uJ1zX8nY8hVT6BcrLoKgUNAG2DY5jfftK/P7GjgcoHwvKnh868EVqc3W?=
 =?us-ascii?Q?L42oA1LmTKrLiIFxscywK5Ltrd5N6JGb62dDJfEgnWtQ3kp5lp9AV9cqP7Hi?=
 =?us-ascii?Q?yujAN9pc+/po5QZ7g9s+bHJiQN3tzz38dZ6JPyOk+IEY65BTNhglSkeMObzM?=
 =?us-ascii?Q?+JuL/mN03/jyFRS4e7Yh2XBwVcgBbXv9uNtthP1o97kJeGh33Q9wz3NrU4kb?=
 =?us-ascii?Q?KPWQMv3Y1pbdZF/RgGUf+6mgHuScE5iNysMMfZyCdoC6kbXjxwEI10uZ0Izz?=
 =?us-ascii?Q?NWa6I1RCH5bMXmslg119mjh4TusnJfrgjGC5+8u5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FqIIVrR2Jk3XNmEaBTHQP4BCKzIzto3HyQN17NJStmgk7HdgvqbxwVdhv/xpjCq2kxhJWudfpkTL1ANmV8zGmsP2eXKgsXOj/XqyIaiO8NDtKtFK1w1eo6Drdd4YU2X+aYW/s53nLH0EGuMc8sVboh3Z3Yz++zbXbfP/Q+zeKifG71v6WIHTubjrZxtOPGs9FJaxrqsri0R3+GjMx8ycHA4sAX5cZpXPWDOl6MCPjvK2xnq9Syy4m0EdOcCHqKuE5RMJKD6WVW48i8lxcCoMA6RzG5ZwJBg1KSX8f7VNFJxDdXFB1msfC/lrTEOq12ESy8FodyO+QVg2SwqXIPdT6bKKkS3z4F7y3PaDfwqAAt6BwdfyG1YWsU0DVIazB8CMNqn3Tg2mjVd8isdPUnimCz0kRFuUF4ufooVCBCIGsbogri7Q2IcEIrsHA8obnc+VWwAyGXASppf/Le6VAVQWkNgxsd6V04rnraCUhvnL4OcmELJWMiQH5lJW+f30WGOGyQG/t+c8c7mJUNOik6q5yNPr9JxQk7soBpJWYH7ZRiOZNE7sSLpKad5YLiMcywHGSyr+OnnPYgZQsXAZ87wAjSahCvr3nkdqfcppkOdbHac=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835f7c2b-875d-40c7-0de3-08dcc7eb212c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:26.8312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwFLpgICAM2vp5S6cQ8MZekmhGHcX46OdGOnNERZ+EFcH6M1Z7nDp+ErKYjtjipAXKetbRJyxS/SdTNZXZXE+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 6OOcdFsf7k9ZTz5-iyL2pkw6ZCfjo_7j
X-Proofpoint-GUID: 6OOcdFsf7k9ZTz5-iyL2pkw6ZCfjo_7j

From: Eugene Loh <eugene.loh@oracle.com>

This is rudimentary support.  We still need to:
- handle globs in dt_pid_create_probes_module()
- add process monitoring / inotify
- deal with FIXMEs

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c                            | 76 +++++++++++++++----
 .../dtrace-util/tst.ListProbesFuncUSDT.sh     |  1 -
 .../dtrace-util/tst.ListProbesModuleUSDT.sh   |  1 -
 .../dtrace-util/tst.ListProbesNameUSDT.sh     |  1 -
 .../dtrace-util/tst.ListProbesProviderUSDT.sh |  1 -
 test/unittest/usdt/tst.forker.sh              |  1 -
 6 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 3f3453af..356e02a4 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -605,6 +605,9 @@ dt_pid_fix_mod(dt_pid_probe_t *pp, dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	return pmp;
 }
 
+/*
+ * Create pid probes for the specified process.
+ */
 static int
 dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 			 dt_pcb_t *pcb, dt_proc_t *dpr)
@@ -702,6 +705,7 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 
 	return ret;
 }
+
 /*
  * Read a file into a buffer and return it.
  */
@@ -780,8 +784,8 @@ validate_dof_record(const char *path, const dof_parsed_t *parsed,
 /*
  * Create underlying probes relating to the probespec passed on input.
  *
- * If dpr is set, just set up probes relating to mappings found in that one
- * process.  (dpr must in this case be locked.)
+ * dpr must be set and locked.  Just set up probes relating to mappings found
+ * in this one process.
  *
  * Return 0 on success or -1 on error.  (Failure to create specific underlying
  * probes is not an error.)
@@ -795,9 +799,6 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 	char *probepath = NULL;
 	glob_t probeglob = {0};
 
-	/*
-	 * Systemwide probing: not yet implemented.
-	 */
 	assert(dpr != NULL && dpr->dpr_proc);
 	assert(MUTEX_HELD(&dpr->dpr_lock));
 
@@ -1100,16 +1101,27 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
 	pid_t pid;
-	int err = 0;
+	int err = 0, i, nmatches = 0;
+	glob_t globbuf;
+	char *globpat = NULL;
 
 	assert(pcb != NULL);
 
-	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) == -1)
+	/* Exclude pid0 from being specifically requested. */
+	if (strcmp(pdp->prv, "pid0") == 0) {
+		dt_pid_error(dtp, pcb, NULL, D_PROC_BADPID,
+			     "pid0 does not contain a valid pid");
 		return -1;
+	}
 
-	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
-
-	if ((usdt_only == 0) && gmatch(provname, pdp->prv) != 0) {
+	/*
+	 * Is this a pid$pid probe?
+	 */
+	provname[0] = '\0';
+	if ((pid = dt_pid_get_pid(pdp, dtp, pcb, NULL)) > 0 &&
+	    snprintf(provname, sizeof(provname), "pid%d", (int)pid) > 0 &&
+	    (usdt_only == 0) &&
+	    gmatch(provname, pdp->prv) != 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
@@ -1119,14 +1131,45 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
+		// FIXME How should err be handled?
+		/*
+		 * Nick writes (also, see USDT case below):
+		 * Well, if you get an error, probe creation failed. I guess we do what
+		 * DTrace normally does in that case: log an error about it and keep going
+		 * as long as any probes at all are left...
+ 		 */
 		err = dt_pid_create_pid_probes(pdp, dtp, pcb, dpr);
 		dt_proc_release_unlock(dtp, pid);
 	}
 
 	/*
-	 * If it's not strictly a pid provider, we might match a USDT provider.
+	 * If it's strictly a pid provider, we're done.
+	 */
+	if (pid > 0 && strcmp(provname, pdp->prv) == 0)
+		return err ? -1 : 0;
+
+	/*
+	 * Look for USDT probes.
 	 */
-	if (strcmp(provname, pdp->prv) != 0) {
+	asprintf(&globpat, "%s/probes/*/%s", dtp->dt_dofstash_path, pdp->prv[0] ? pdp->prv : "*");
+	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
+	for (i = 0; i < nmatches; i++) {
+		char *s = globbuf.gl_pathv[i]
+			  + strlen(dtp->dt_dofstash_path)
+			  + strlen("/probes/");
+		dtrace_probedesc_t pdptmp;
+
+		pdptmp.prv = strchr(s, '/') + 1;
+		pdptmp.mod = pdp->mod[0] == '\0' ? "*" : pdp->mod;
+		pdptmp.fun = pdp->fun[0] == '\0' ? "*" : pdp->fun;
+		pdptmp.prb = pdp->prb[0] == '\0' ? "*" : pdp->prb;
+
+		pid = atoll(s);
+
+		// Check, since dtprobed takes a while to clean up dead processes.
+		if (!Pexists(pid))
+			continue;
+
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
 				      DTRACE_PROC_SHORTLIVED) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
@@ -1137,17 +1180,18 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 		dpr = dt_proc_lookup(dtp, pid);
 		assert(dpr != NULL);
 
-		err = dt_pid_create_usdt_probes(dtp, dpr, pdp, pcb);
+		// FIXME: How should err be handled?
+		err = dt_pid_create_usdt_probes(dtp, dpr, &pdptmp, pcb);
 
 		/*
 		 * Put the module name in its canonical form.
 		 */
-		dt_pid_fix_mod(NULL, pdp, dtp, dpr->dpr_pid);
+		dt_pid_fix_mod(NULL, &pdptmp, dtp, dpr->dpr_pid);
 
 		dt_proc_release_unlock(dtp, pid);
 	}
-
-	/* (USDT systemwide probing goes here.)  */
+	free(globpat);
+	globfree(&globbuf);
 
 	return err ? -1 : 0;
 }
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index bd0552dc..99ae995e 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index 7b9c6a5f..5ae087fb 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index f9b1d8bf..5c0509d8 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 644da2ac..6eae82ed 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 7cfa9eb5..92513eb5 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -7,7 +7,6 @@
 #
 #
 # @@timeout: 120
-# @@xfail: dtv2 USDT wildcard
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

