Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CCD20314
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490169; cv=fail; b=tFZNTyo7GNeGIuRVSuPOSCE7oBjOAUUKIvW1QDPGXuj3wiJUOx7MjiZEiBDCQQ7tA+HgAX8SI1bb6ewOSWEfplibYNUm2oascOi8dk5jTxlgfPj8SnPPSwibgeXi6fNirPIw+t89V4je9L3tPHwT4xnMuMCsrYfBN1d0YCI8lSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490169; c=relaxed/simple;
	bh=IxMgBAegWPOHjGsNJ7wKcFn6Fsa40NTJkXdOWnnyCFI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YpdDxTmVPG7xZ04Q6EDs1RbE1MczyiKjFk7ElxrW1tbcbwbmLXCSURAox2NDlwtqYDrlxrCoYX7egupEfYLUM4mvqg+52dSdLiJlAU4ZqOpiufKUxgSWwT2b+Tp9u1c3Pl6dPolGwgoAKqKw3scqBiYSqFj2OQ6VzL/Ir8BBTFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TOIfIvjC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nmZxBqlt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TOIfIvjC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nmZxBqlt"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S0g7s6022999
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=PLgBf+q1rXxCZ/
	gtr+xrV49M1ZHn+Aq9nqFGSJFtLlI=; b=TOIfIvjC0YVW7U89NhHPyJZ1bhjjA6
	mvih2BTgv68UNBY7rjFNfL/cDzDO2iOx2qVvnZH8w/SlUL0wU2D0YSlWL9ovSr0h
	n0AguMjnEj2405EDEskmE9/RyIkO9iOVQzVktNKoXQCiQcEI2b6Mc29HqKmvutUu
	iHw8j6LdhYZ7XXaQUyMqmQO5hJ1WpTS2GNOtChP/0pbghpii8J2BFrJipMYIEdk/
	hpXqP1VdlDFqMtmM2OncjUV7bsfJvl8nKWgAzN1fo7dR2dj8E4w7x9oiWm9aC8IU
	f3y5bQ2fWDiVcnmgfb80ls48yggYcJtNTwIc2In51+jEu2ZkEIcxholw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sp6cpkam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XRUS039418
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848q68-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIrPgf7wfwTlGYYzIfFIrWuQ3x8Yp0PWgAiN7g4dcbpADCDv7QCFvA3zRQqOVKhMbVx4XUZ0KSZ13V+uaEoVNnXmNQH8DhrV+RtbP+JpBw3dS+9CnOv8U4AsNoqJFzGaK+SP71junzLTWqQoHanTZvmPxxGcTfgqfg9znfL2RiZJHkOqp/hHhToOzC+Lg5fvHjaULNwNfYJgzgX7Q5l3tOzapBLkp5qlYLBqCa+xyHxsbaDwT7ckZ7aH8WRIq2qhR9WvioQ13978sYNDuwQWowNYsrN+0RlZS723Iy5Fi1xaGeYVG8cPM59OtGDhzJqOr4bvkcClw9FgzigF/hmptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLgBf+q1rXxCZ/gtr+xrV49M1ZHn+Aq9nqFGSJFtLlI=;
 b=I8zHlLMNa8KwJ/NO9Z6Ly2cJWaO4VSCwQouoO4oP6EdJV9tH71R+u8BsznLEd+e2nOPhKXmmVMFAB+zPvELeWCX4h3O8UYE1WX5ePVFb+TYKwChmvMplfGe3RZB32Ej4F7E2b3CJtlCHhkUA3jxOPgGEUf8KTmAtrS6Zb2K9FMSeW+sa5e6WapN6rMYwS+GflvgAG8R1PGH0RbdqSXkzNtb9okjlrlW2xBuKfFCsqW5CNbHdrYFEzvnK/jjGBs2+7ed/IGmEvMo/UZq/zO7uMUEF8LlG9LzfA3CnRG8w7o8jtBRBFnvK9VQp1yxMSOegkWQ6iZAdqwoY81/lAIHSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLgBf+q1rXxCZ/gtr+xrV49M1ZHn+Aq9nqFGSJFtLlI=;
 b=nmZxBqltRP4hSLof5f+hNjoJOG3Ayl3zEfhIofCRq2vpkLUdnfnPUnTLZkjfnUZqcjxrrsvcoS437eYhaBdZAULKxhXBVAgov28DvHFuNR8EsNNnSxTzyA6krkifLEWZc7wtyD/uIWnd8bem95/FQ76qyanGnTV+qItDNUgowSM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:22:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:22:42 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] test: Add USDT error tests for -w and -Z
Date: Fri, 27 Sep 2024 22:21:58 -0400
Message-Id: <20240928022158.9206-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240928022158.9206-1-eugene.loh@oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0662.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: f9a71218-8474-4e42-e0dd-08dcdf646e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t01EzXlDINtTuSHV5cAdRmLjrGWPCF0zYvxsqG95uanUviSIawtpPvs7SLkw?=
 =?us-ascii?Q?AFqx2RXWE+mBZft3bAqa9DKFTQ2wCtVk4kZCfzmoyPoyaWSWpV1XMBSreGrB?=
 =?us-ascii?Q?6np/1jg0Rlvxme9wWMd+Kk6+HkJmb2IWSKED9VvJfaUYrJ4I0BXOjhjSWtFB?=
 =?us-ascii?Q?g09kcWCTG7jNlZ6fGb5pJZAJImTBEtZHTlXaK8Yj29KDThju4W54MuywuhzY?=
 =?us-ascii?Q?Bh350oxshfbToBdilf1PXorqyOQ3biM06w5G4NQYPwbzNOOHvmXFjibH9koU?=
 =?us-ascii?Q?u4DefWxh4yGMq97bUn4CnN1ZumQAyw2SHPsA1E+LiMTtPqz5O5RoMtzlxe2x?=
 =?us-ascii?Q?FpMBSKorK8u/FY1w7kWWZwVUMml32ZjdNEzISggnhsvjUsJR7zxLhuuVRyHi?=
 =?us-ascii?Q?jUi8lUxDZn+Txuka/ug9EP8e0KDwDIlJR9EQDnDwqOzQ2n+/2xBe0lbTAJpE?=
 =?us-ascii?Q?Go1c6+H+cPOpJmwG96dISkDxSjGtJJblMw6/W0pR0iyDKMAVSdw/znk3W9yO?=
 =?us-ascii?Q?9V33Dn0PyJ+bCkWP8RkQm1GaXe+HTLYUHsfGnpevNjnVN4uCRosRK+ZXzv68?=
 =?us-ascii?Q?TnaNA7qsoXDVKNWw2XQOzr49g2j31Gwrpt91CO9KpKAdRmHqfdMAgWmEYeLr?=
 =?us-ascii?Q?qfmPmKkkXbb2zPQA1CELGSkw1xx4x6aeI3xYTANtR8MM22Xu0lhWx2rV8BuZ?=
 =?us-ascii?Q?jFtnBZYEQXw7Mv0SbCBlQJCbJT9isfQ8YsgZ0mFA1pODjbl7W8sPbQRaFw3H?=
 =?us-ascii?Q?SOHged1EUXOiNx7zVE3zwS1DyC50DrRwmXFJLu1NUNm9C/FmgtaRMuVbCsK1?=
 =?us-ascii?Q?FxtRYSBgt/BTMcNiuf9am/V99O1YPjCO7JjoVPoTdXwnXnH92wuUNvMXwEHo?=
 =?us-ascii?Q?d5/les7V2lOVXO4jj/3erMv9GwbNmTbk0mnDJgLgseZuCqs1s31rXHWqv83B?=
 =?us-ascii?Q?avm88j9X8rwnUnlbVPHmwUyUWMYaa2wQZ5lgelzGoDptQdaD584Ma+wXtXzA?=
 =?us-ascii?Q?CoHys93PUdXbk/rnsEUGAR2HcRqAraCfw5lwUjJMtBSrfEOBvoETuFEO8VDd?=
 =?us-ascii?Q?lw3tMf7KrNYVBXC/RCXuO1ppA0YdBtTL084pJw8BHQ7REZO6Iyznl6M6axdE?=
 =?us-ascii?Q?cFI4ZJEHEKObBeDypKERDoJ5pz9Kue88WClmdc/tIe4tsJjDLVaABoq+3Uz1?=
 =?us-ascii?Q?4LKsZhhIiU+xNKrV75ManuTVZGtz6LsDojVjPcolX0NmNZx/U5RIBMVmHlM9?=
 =?us-ascii?Q?4fok7DDSRbPz91OUqd5HVop6MAmh+1Nj9SaJVtnPuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFBwjUwjiziZl7LtK8bQtETFb6AW8jd9d0AEezRy5lgsNy3I4ekNzFeyE9gu?=
 =?us-ascii?Q?azmHrpL8r5u8PMCfwPuVfwBzmol7T7pBOHws2JHz/dHrpyv+V2yVmuhaBj95?=
 =?us-ascii?Q?M2NqKiilCr3fdEP4tYI+rd1ON7bLLUEbRI8dZuuNCffqWy02moxKtFbpelWQ?=
 =?us-ascii?Q?+atA7bZFCcKCafHtIFyQEUcjkjCRydfCxmxnHFa/FSoaaSwCRxu6gO7rTBm7?=
 =?us-ascii?Q?MwxNVBAuMvM9nJv8hvad3hieF0GdX6h35sQTCdVgycjdZYdMWTB1G50KAPYH?=
 =?us-ascii?Q?EPZUOMp6/T3lznNkobz85qlIkEEekNP5jaiXPQJPSa6uOq0TadyaznWkeR7H?=
 =?us-ascii?Q?dE3jO4Vw+/Tqyc/t5xwoHgicN7rZA+NWAV1ljSUc/Da7J8RGIc+ZMX1fd5P3?=
 =?us-ascii?Q?A3BvmpSnXSGtnGqU0HGvl+GgiQwRRQ5Apeg99rJxEl6+i165QxUaZ83ngleQ?=
 =?us-ascii?Q?3oZXuE0zv+HYuGD5AQxk8TvhGkWfM+1i25vPp7M9HMHgh/kMtRf4k6zKRMb3?=
 =?us-ascii?Q?+xmAxT/owo3Om9urLOT/1iozZD2gHWF2vmSlEIcOBTukuvxexdrK3ZqCt1a/?=
 =?us-ascii?Q?IFydQB8mu34FnFwLNkuUZQaxOEHbvwXFL/oClI1oSEbRyF6xrWbUsCOvFdQN?=
 =?us-ascii?Q?K/Ql8009QeMNwcqvLUcLHuNtSD/dJKKthg+3DI6rUTdG4FZYJipPA7h5bl2P?=
 =?us-ascii?Q?hd5CILqgZhW+ziJ8MA32O5iVF3J/ctIUiLIrKLv2PKdC77X11wfSSr8PgrzY?=
 =?us-ascii?Q?KnGrkk2TP+qgHSskEBiNo7kMtiIS0rsODPJFFQtJCdYJ7z8t/bQr7qV3ILgz?=
 =?us-ascii?Q?TwD+4fnBT9tOwVxfmm5dkiadG+XgS5Ll7d8Y2whv+2p6bY/5qDLZLySelxON?=
 =?us-ascii?Q?KoPlZH1BFNxPn2hBtb+OVXi62h7AYKWgtOQBLTrZHWr9Y7ruw4okIC9b6i3S?=
 =?us-ascii?Q?AvNOMzpxdNmFddWzT/79tGLqRpigl9twFc33KtU72OJCnZFUdL4sN7biHmsj?=
 =?us-ascii?Q?mtq4IGA9oWeRuCSWH/eUw/8owegsGS9wQGiW7oMjs5bR1aTC5khdSZDLnRIB?=
 =?us-ascii?Q?M8SbXL5kuo4CFc43RdphKP4uzTjnKQ62zLQiY8woTsbRIQXcIDzlqtO9Pdyb?=
 =?us-ascii?Q?5rC/jDXVAssSIQ85GB49zLdy+iSYblNP9P/jZ8yqYj8ah9I670J8P+HXxmSi?=
 =?us-ascii?Q?20h1V9wT9I8GjbtJUXTebhm9oboDbCtMIsov6i9CEc1XOVN/KRptOwh0njgF?=
 =?us-ascii?Q?AiSvnpSK62XB2rpm2qANSIYJr6hNuRTlWNVLCzKzqqPFptYIgA1jFuPV0Pnc?=
 =?us-ascii?Q?1v/qJs6W8+MptlmXEYvaM2rzJGSYCdzOmUiwPMtlT3anvv1bRjkSahD/Uhxq?=
 =?us-ascii?Q?fbT0vSla1pNQz4i0K+Pc2QSHo8PxQtfsXIHLWmFBUjN9OUJ4xhRJmzJqe43k?=
 =?us-ascii?Q?iBsI+X4iCEUFilg8ZSjbEZylm3+jkZndUS8R2WyBppvUUCYiWmI2NYXoo1oU?=
 =?us-ascii?Q?IQ+DWSxU/YNXpqO2oNwg+OMQyvLUaqwjqQ1BLdWVyTYERXG+FrxOIWh0nzWp?=
 =?us-ascii?Q?sH83J84f4MOul6HQEJM/kObwtzNUsnpWNAaTzpUy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J3+Nrt/BHM8d4PgLOkFjbuG2j2FwvuJVEMIys/+aBoadeFWuiUATuiRMIIwzbxOLuc4HXNiDmp16HX4LQdsKsa6AuBwbAqDniBQ8oq3a/Tt9vS58kX3E7JjD/PPILMV97hBh2l+hzUV/m6e0xszNwhPWX6asCOuvmcbtHsRS9JOT0bMxo1K0anRZj4c/u29YldO9qyi9FmfonpNJmXQUoJ5VC46QPmyeE7iMzdH1WGWOB18FGXQ+VsN/QYBAMd6bhXeH1QAg1INEWZRKA48ZH7gG4W0ZXQrKVDGD9zxRslKhIiiXaJ5kiCSZVYMwgiTuyh/Pccd7Dt9fkMR84l61ftDiI44ekBlTI6ixDQYMrGFrr8vrU7n1k7VAWf01GK3kWLlJD20+dE7K2gF8TnDap4sHg1bX5I/QcO0QjON98wXCAsE2u38pNFGTBv21rRDRyo6gJwqYq3JA9CvDD5FiFKfwFYuT8GdyBpF2eRxiCCrHUEQhVDLTQF+KnilW5Cj0NWdUaDHa9TWOV7ZLg1pqmJqGTKB0KsXQRZZXWW3rzZwHD8xCravFN6L0G6iprJNFl1J25wkTRGPquvqQEGQ7HNYFw7tGyYt48NCoQfngp1c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a71218-8474-4e42-e0dd-08dcdf646e8c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:22:42.4838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRO6FueeNZMEKAzjxfMGdYWgDBKilWG3f/MSQoLN31t2CEffSYm5MHgCcdk7Vdt7qw1+kmDGPr4wY2cq1xq+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409280015
X-Proofpoint-GUID: jGKAm5jnoEQov6g4sjVYBJqGIGE5vVsr
X-Proofpoint-ORIG-GUID: jGKAm5jnoEQov6g4sjVYBJqGIGE5vVsr

From: Eugene Loh <eugene.loh@oracle.com>

Error checking for USDT probes can be different from other probes.
So add specific USDT tests for -Z and -w.  Specifically:

    err.no-Z  No USDT process yet when dtrace is launched
              and -Z is not specified.  Therefore, dtrace
              will not start up.

    err.no-w  A USDT process is running when dtrace is
              launched, so -Z is not needed.  However, the
              action is destructive and -w is not specified.
              Therefore, dtrace will not start up.

    err.Z_no-w  No USDT process yet when dtrace is launched,
                but -Z is specified.  So, dtrace starts
                successfully.  But the action is destructive
                and -w is not specified.  So when the USDT
                process starts, dtrace fails.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/err.Z_no-w.r  |  4 ++
 test/unittest/usdt/err.Z_no-w.sh | 65 ++++++++++++++++++++++++++++++++
 test/unittest/usdt/err.no-Z.r    | 13 +++++++
 test/unittest/usdt/err.no-Z.sh   | 31 +++++++++++++++
 test/unittest/usdt/err.no-w.r    |  3 ++
 test/unittest/usdt/err.no-w.sh   | 31 +++++++++++++++
 6 files changed, 147 insertions(+)
 create mode 100644 test/unittest/usdt/err.Z_no-w.r
 create mode 100755 test/unittest/usdt/err.Z_no-w.sh
 create mode 100644 test/unittest/usdt/err.no-Z.r
 create mode 100755 test/unittest/usdt/err.no-Z.sh
 create mode 100644 test/unittest/usdt/err.no-w.r
 create mode 100755 test/unittest/usdt/err.no-w.sh

diff --git a/test/unittest/usdt/err.Z_no-w.r b/test/unittest/usdt/err.Z_no-w.r
new file mode 100644
index 000000000..b81622481
--- /dev/null
+++ b/test/unittest/usdt/err.Z_no-w.r
@@ -0,0 +1,4 @@
+dtrace is running so start the trigger
+dtrace died as expected after trigger started
+-- @@stderr --
+dtrace: processing aborted: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
new file mode 100755
index 000000000..39b99c691
--- /dev/null
+++ b/test/unittest/usdt/err.Z_no-w.sh
@@ -0,0 +1,65 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that dtrace will not run a destructive script
+# for USDT probes if -w is not specified.
+#
+# Specifically, the script is launched with -Z and no USDT processes are
+# initially present.  Only once a USDT process is detected does dtrace
+# fail due to the destructive action.
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/Z_no-w.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger executable so that we get our
+# own DOF stash.
+
+cp $trigger main
+
+# Run dtrace.
+
+$dtrace $dt_flags -Zq -o dtrace.out -n '
+testprov*:::foo
+{
+	raise(SIGUSR1);
+}' &
+dtpid=$!
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died prematurely
+	exit 1
+fi
+
+# Start a trigger process.
+
+echo dtrace is running so start the trigger
+./main > main.out &
+pid=$!
+
+# Check again if dtrace is still running.
+
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo dtrace died as expected after trigger started
+else
+	echo dtrace is unexpectedly still running
+	kill -9 $dtpid
+	wait    $dtpid
+fi
+
+# Tell the trigger to proceed to completion.
+
+kill -USR1 $pid
+wait       $pid
+
+exit 1
diff --git a/test/unittest/usdt/err.no-Z.r b/test/unittest/usdt/err.no-Z.r
new file mode 100644
index 000000000..52d9492ab
--- /dev/null
+++ b/test/unittest/usdt/err.no-Z.r
@@ -0,0 +1,13 @@
+expected failure
+-- @@stderr --
+dtrace: invalid probe specifier 
+BEGIN
+{
+	exit(0);
+}
+
+testprov*:::foo
+{
+	raise(SIGUSR1);
+	exit(0);
+}: probe description testprov*:::foo does not match any probes
diff --git a/test/unittest/usdt/err.no-Z.sh b/test/unittest/usdt/err.no-Z.sh
new file mode 100755
index 000000000..29d63d9ce
--- /dev/null
+++ b/test/unittest/usdt/err.no-Z.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that dtrace will not wait for USDT processes to
+# appear if -Z is not used.
+
+dtrace=$1
+
+$dtrace $dt_flags -qn '
+BEGIN
+{
+	exit(0);
+}
+
+testprov*:::foo
+{
+	raise(SIGUSR1);
+	exit(0);
+}'
+if [ $? -ne 0 ]; then
+	echo expected failure
+	exit 1
+fi
+
+echo unexpected success
+
+exit 0
diff --git a/test/unittest/usdt/err.no-w.r b/test/unittest/usdt/err.no-w.r
new file mode 100644
index 000000000..7a4d60cd0
--- /dev/null
+++ b/test/unittest/usdt/err.no-w.r
@@ -0,0 +1,3 @@
+expected failure
+-- @@stderr --
+dtrace: could not enable tracing: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.no-w.sh b/test/unittest/usdt/err.no-w.sh
new file mode 100755
index 000000000..407654981
--- /dev/null
+++ b/test/unittest/usdt/err.no-w.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that dtrace will not run a destructive script
+# for USDT probes if -w is not specified.
+
+dtrace=$1
+
+$dtrace $dt_flags -c test/triggers/usdt-tst-defer -qn '
+BEGIN
+{
+	exit(0);
+}
+
+testprov*:::foo
+{
+	raise(SIGUSR1);
+	exit(0);
+}'
+if [ $? -ne 0 ]; then
+	echo expected failure
+	exit 1
+fi
+
+echo unexpected success
+
+exit 0
-- 
2.43.5

