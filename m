Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525943D97A
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824957; cv=fail; b=EgmePhJP4NsnZuwsSldcp0/0WSGV8HiCh2VZe4oUrPEJ5YWUCOBhDA2a4Ld/xDQAYQgYFetTm1VNo2r43B3mDmlbYl4noI03YES2xCz/LbgQqHm2b9GzeXSgVjDu2bmoS2/VKsN+XyfqAUxDSisarxwwFOrf1kjHQtFnhATLXn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824957; c=relaxed/simple;
	bh=ZuD/DJiW2+ThyFsMNALSn47hk9UbICAu2QcbzEX2EIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nHhPwbK0q2ipqTFD7c3gpN7a2IcRY79VfMs4T/MYfBM+kEA5j6BB7AK45gT3fcO6XO/GsOQ6eHPAptTTZD5MLMEBDhIy7ENko8EMKXHSomjc7iLKzV+uXytMtAcRODKKuEojtDdA5XnleX1ANXFLxoI1N+YdioLEkpVLkpdytMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QU+bfiNI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s9Bz2QsP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QU+bfiNI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s9Bz2QsP"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fbp5008948;
	Fri, 25 Oct 2024 02:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Po749/+OJywHntGmte
	sUtLI+bcZrS0XoV7Ikx5dyDgg=; b=QU+bfiNIq23TYgecHIU9KKeHuzxaa3LUkJ
	f0ZX2dXKyZ5fTYgmOg914dkQjdJKaxLDS59t3W+dGy+DW9KCH2jWYXT0kTSW2x9e
	i2A7eOAKT8/6SvkFdZiUhFUS/ia05RsDzmmDigKcZBeetoPHG/z/eg5qY2Ho9XG4
	80z3ajW1JdV+of2GSfM3VDAgDCCE3+z9+kID07TtoBVApWYsslCevOxqA/9PMShA
	+skgS0mpbfflMWpYYnV0iqq+mIr6VSQ9qX8zar6OdJ3eXBwNldyfTtK5gfZ31DIj
	ERn0lOa+1AfDGh8O824+fw/SNI2DMkBWOs1sa2+bQ5XXOdUg8OaQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545c5mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:55:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P159XK039476;
	Fri, 25 Oct 2024 02:55:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhdar6t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:55:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5XMmkaENZpsZf0ebyExNiCwcEWNCCe85j2g3PK/x0hnmxz09fkhSFaz++ljyvHsa1TAPxfe15QdvlQBU/eDGa28AlV9Y2tAZB0P9Yz/9jnoF15Jwnj4wlhr96Mm6521A8yTXAwfmdVHNW0udrZIctL1PkDV8cMw5ErX6V3px5C397RfWJ0NeYuVsGLVEHdJdXCWqPjRSFl0bt/3RjRHZ7qZJYYAZq4BW7K2BIjnHYGpnHt6ZcCissE9axa+5j0mWF14xCiJiIe/jWjdaxrzU8ZcFDP3hFdZJyILKO3RL8NlSy3+Gmxd6vg8BHJoAeqrZWq3p/d6aoplbvuj//gm9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po749/+OJywHntGmtesUtLI+bcZrS0XoV7Ikx5dyDgg=;
 b=pbirbFaiEkyr2wZHUktNdKKSzDjKmw75T1wrA6sK0VYuDnOEA4UGvWyMbgXANCjx0RV8BIK02pLLjfu3wSfQGRLv1PWTuI1nZirhwUkepeAIykFC+66AlPMnZ/rtR3za814/YYYv4QAOkPMfmqAIm5zHiPmsnI9+g6s19zGSv6AG9pCOt2cQuecxu+MTRtlWSjtH53r/t66fg3QbzjNS7/ZPqx7lLeWTV7RaoHz/TbirmyoVZKnaaAlG87pVJ+4d+Gs24Dfktoy0omD8IjgxWpkpgN0iOUDJHbsHEs0wyQ+eC5EVICD3K+Jp5XQ397F4ac38rk/QFvmlG4MIlfz7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po749/+OJywHntGmtesUtLI+bcZrS0XoV7Ikx5dyDgg=;
 b=s9Bz2QsPW49MUDrU90jPb1uTavRu1+ExayYgDDH3ALntoGALLYNS3nzVVhSF7I1R/K6LqCgo0lVTHgLmO48dqg9wlMTMCXQA6NCiCCnZZPa11hOXuk0tX5wZHRb9Cmg6vrk4pxfFjphPDbsXGc71iFm4Oj5JJwt5fn0RoYzLB3s=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB7150.namprd10.prod.outlook.com (2603:10b6:8:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 02:55:44 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:55:44 +0000
Date: Thu, 24 Oct 2024 22:55:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 14/14] man: \fP-ize
Message-ID: <ZxsIrRzSdo_PU7u6@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-15-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-15-nick.alcock@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 690db486-fbdd-4f28-986f-08dcf4a084b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Y0sbcqMgeYqFLsoyya7mwHM6hNjy6RfQZcAKuJ+SIsRoLr9DWamQjyP+Phw?=
 =?us-ascii?Q?z2p/CVtZsaqB0NHzLPr/8GnHJ7L3lxcLxvsEXgfuXg+Af9lXxn9gNKLdP2yP?=
 =?us-ascii?Q?pdzMc7ijm2ktc9B1/gakE+sEtDGOhAK5V+plILcWOcih9K0TBHs/woxIuhEU?=
 =?us-ascii?Q?isxaws+6xLKFxtBxP036BKY+J137nb3XcoYLoFl2fuyDNTacnu6muB40y6Ub?=
 =?us-ascii?Q?ur1/X1S9OrrTcmR1SbNFkSQ1JzZrsCOaOKDMOJvdWghOayoz2umfsKO+RXRT?=
 =?us-ascii?Q?FGXCX00Q14QluoqD2WwojNLaZzqQszbBmI5nde8oqL/0ao3Ce23gz3/kqWpl?=
 =?us-ascii?Q?/Hxqx+9tsYU9tChBMxBY49C9W279GJPDSmNX4Ym/RWGn4jghDVYohu3uuKLJ?=
 =?us-ascii?Q?xdihtUvav3tdcDk1SrBDTKq/mW9VogF/BOtBjgRSJyRafHUTrg2nIq2AB0vl?=
 =?us-ascii?Q?tZ9h3x/H9fMOENTyUH72o+b88JZCXFU6vX3S1OsaTFi6Q1s2HUkgr0TJtIKE?=
 =?us-ascii?Q?nhcG8pNzaL7dTaCSeEMQDqHaX3On4PO0/WdtMzq8pZw/4zi0yt2nEqysscOj?=
 =?us-ascii?Q?E514462mUmila2032uafMcpQ7j7ijQQmpmJQTOMK5irWoPQiffUfufMD0NC2?=
 =?us-ascii?Q?rfseyYd2Fg8Oh45M7aZ/LYQMJZl9V5CaEMxB+LrjEg4vYr9nmfHyTUIt2dgf?=
 =?us-ascii?Q?rYchOnylMubpshcZAsXeiAmcobfeyyJ60PTcvMitfhx/w2BOr9w29L9TvwwF?=
 =?us-ascii?Q?ZabQjnXnUvbwHlK6/6wKfIgpCAJkqV5W/2zFYIw8+8li6tnP0eKEj4CTqPrv?=
 =?us-ascii?Q?5O89ztuQ1iJjTwPtr6AuJX/M9W6WYE/E1zkE4IF6Nf+Q6tZ0qwPPjD1L1JX0?=
 =?us-ascii?Q?7ejAAGudvJZvnfK7DbkF2fu5s+2GNwRG9qV9gPGw4df1AJCQH0Gqmy3iWn2r?=
 =?us-ascii?Q?cyaZgtr/5FORwFphe97Td5Lin/rAtJCJkzqAWUWmG6vUNICFZexit+OT6aAi?=
 =?us-ascii?Q?Ei+bX0LrIOlDFGki4WsTfVzIBpqSIpRM+c7DxXVHZXZLQ6aroED4MIM7YTvh?=
 =?us-ascii?Q?XHGZP9fCcyQDa52pSDZXpP+jg8pdPGt3fcNbNYBawfN+793+406ahcQOwS96?=
 =?us-ascii?Q?T/o9PLXvdYtlmMzYm/jA7u4KloaaOmtsr9+Yz8wqgzEfqAOBCCJwrxD8z57j?=
 =?us-ascii?Q?Wl1ufwZyqZMOzT564z29G2SKlyGLLXgpUWG9HEnbUvQwTlN98HczPY4aWkGb?=
 =?us-ascii?Q?rzu42r/N8YzSkr5zWaj5jbSBG9BjL5NfAsCMyGzgl6z3mn+zw56zU7n+2W7p?=
 =?us-ascii?Q?yOZH+LW1ZEWOEisfTinTbwdj?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fHeo2GVJJbPcWDBOmja5FwDBZGvqpFd3pOAoXyATGNVghmZGK9DJdZ+78xq9?=
 =?us-ascii?Q?CV89ZfW/k5jexnu5SNuiIYt0+c5/iEyb516A9a7nIS2SeP6/2sgke5VEvSUO?=
 =?us-ascii?Q?f04WeKMsmMD5j8ILcKkmLWXaNfbKojKLkrBEUsdRPcNxIhzwquujR88PTkI+?=
 =?us-ascii?Q?HPxDxQneVOIeIOpwTgtd99iTZAakiMdnbMVNsL1kUm02j3RoV9P+5vbVv4ST?=
 =?us-ascii?Q?4exwO+wNckTjFZHHdENmmLysZj60Vyuka77mTNTJDZWYD4uTtYr2E3Lhnxr2?=
 =?us-ascii?Q?PeSwefqJPGuuWDRvH991bWpgFb4yvssTkNg3SNf7lUkwY9TJuBWtDbzr5H+4?=
 =?us-ascii?Q?rtR+5v6loVbXmQmXb2xD5TNDxHJhzRl4lideuRUvw6NcQxKrNFmk/Djj7WZ8?=
 =?us-ascii?Q?iBKZB8YXCurQd9mPEeuhsY4cMUycNMhLnZ3odMd0JOHuZYThz79Orb31SgoU?=
 =?us-ascii?Q?0lQbySEjw3eF070Yl8lndS9/awa1x9XO9zzlsr63Xn7X2mz7hqglfVFyK3VG?=
 =?us-ascii?Q?kttgqin/VjCjTsKc17WhdDIaRtYZCfHJ7EPApQ82kgPfsH3ZeD2slOzXnefF?=
 =?us-ascii?Q?iR57mD319H8nn0PHnTw26Aj9KIQLBVCKjERgd3oe9dyX8q8gBy68vjxsl3dz?=
 =?us-ascii?Q?vYAv0v0TTZjGko4DSmrCUcsATJVD5ZaYyq0KFwTePNk/2DpzuDyM/lJUbddS?=
 =?us-ascii?Q?z78AnWJpv/rq/acgKHl9YsY+6JlsLSoJRn9eEvlW3RkzXgzNUZCLKeajfqDO?=
 =?us-ascii?Q?cyNa/FXaF/pVuhkQGB0XzATEPQZHFDj4NDMz4w/CTDLCXTpw1llA8s20KFIB?=
 =?us-ascii?Q?ciDxsNDgW9OLq0zb2zCfTDGygURivFEiN5s7jQjfPiWSVZsEtYjLPNxiHfaI?=
 =?us-ascii?Q?qow2fwic8C9rH/a6WghjwhmjvKKxsoVc7g/dKhyt1E9QqtzThj3EbFB429L6?=
 =?us-ascii?Q?kprgkrVZRtLkCOWXlz6LX/PFxa1eHPvVPln2WnkeGLe3OH7QiTDP20DKKiKt?=
 =?us-ascii?Q?IbGsSI7biUeTlP0VO7QFYrvIFoN8RZrkv9FShCNxA+CP40PW4r2/rSwbRUN8?=
 =?us-ascii?Q?4bOVrKZekuDff5P/FFeUxrjHTwdTvkUAxDqrR7xEqDJkgscvKwuMRLDXbCIJ?=
 =?us-ascii?Q?z3UqKD2ScWyBNlhl6yenVUSSYC0HOZsBcGsv5wpq7tr5X/82iSGtLEMs4xc0?=
 =?us-ascii?Q?r8kXmmmuSRkaffLISxrf1uxSmMIiWjpNloGGNYLIlgqJBB/2PTTOvZF4H/WK?=
 =?us-ascii?Q?eshv4iOWY43TBeGhj8bC3QQC4INH2JG1NTn0kVqjEyhJbtOEB+TRnr/elZQB?=
 =?us-ascii?Q?zk76Vas90CmP5w8zkWQb0A/FBYYU+J0HSj8vBmcVMFuu86dxbHwviF26qCjY?=
 =?us-ascii?Q?IPzUf6FkvKJ0+N3AcbGJ8GBs7Hg5nz0HlD6wwcb4xhafJoYsgCTBDXR0tT3I?=
 =?us-ascii?Q?2Z9AEckBhzpJShutt/6VKvjsmkRlZ8hS+g3RRHB5nGJy9Ey3SsFGDBwD94BN?=
 =?us-ascii?Q?qAZIL9bL3X7ZbecZPaFPGS4wELDPdolYw8H2pLsxWyoH/qaE05R7qgY4fIcb?=
 =?us-ascii?Q?DjpqZ1zB1ii76tTbWo4FZoJz2rR9buguwDukEL2NT2kn/t6HvqQRv+TFdI4D?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KaPH55Lqz+Qhb3VmjY3ed5y1CkdMOdJ/eyyzB1BT3pn3c0w8ePL/GVHH2jWF8/1LPWIK+7+mWggb+IxmnYPz/nyc4jLhdxIsrKrsVNGWKLpTa/lys0fOcv1yx7knMq83dqLMy5ynllFH6M9JRLZZT2Zphr8kXnGOfCJYOypx5ObMED8utew9ZgiK2J8lt+ycWUQ4poJ4FhkTZuUN9ZTS621FhsBHGFSn8u7QfDhMDiRrSufOHQNlir8vCn2qkcbAQnzrOpzJUXrqsCwC0LcFpHZynShfLQb99sg2DYUs50uIfodtlqvrKHrLCPVTcawY4Ua+uWQFh0rD2PQ9eX7UszXrpJQ+LOBciZYxOIkJ5Ye+PTfXBeGIRuY7lCbzt/1Hi008MNvAcAvdfuDeY80VZaBJR4DIZAKc7XXpFRfNfRfNzVlJh6UkHsHkrOjukIWjNUD5AmoQQZIpO9H8Iq/Fm3lY60aqAoCxQe5XYkthaQCTc4PA12T7XX94tSRTBa47lHtA3hJqhfiL1H1XVDBh5xFagX1GqBk5b3oE9mgtKk1YcfI4m8WwbIpyESxfifuXbVFNlb+2w0AFyYyATyWuRExQI/b1hbmt1KmWwQF2qqc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690db486-fbdd-4f28-986f-08dcf4a084b7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:55:43.9628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Jv5ypqovuz7/VKiG1890X5auu47oJVhrIwZDEjDrCEdnIsuerDdEVVxIJ+RPCq1OIPuuvBhYPDQryAhwYR4/tp7g+0/LUIhTftXoS7tuy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250020
X-Proofpoint-ORIG-GUID: Gny6TihUk5M--dhFFptNATCT5UAaElIS
X-Proofpoint-GUID: Gny6TihUk5M--dhFFptNATCT5UAaElIS

On Thu, Oct 24, 2024 at 12:37:58PM +0100, Nick Alcock wrote:
> This adjusts everything to use \fN...\fP rather than \fN...\fR everywhere:
> the few places that were using \fP (usually \fB\fIfilename\fP.ext\fR) were
> re-expressed into \fIfilename\fP\fB.ext\fP. \& was added in the instances
> of this pattern that weren't using it (about half were).
> 
> No effect on terminal or typeset output, other than very slightly improved
> layout around the filename stuff above.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8 | 72 ++++++++++++++++++++++++++--------------------------
>  1 file changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index 355484bd0d34..1f2d48a07531 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -39,9 +39,9 @@ dtrace \- DTrace dynamic tracing compiler and tracing utility
>  .LP
>  DTrace is a comprehensive dynamic tracing framework for the Linux operating system. DTrace provides a powerful infrastructure that permits administrators, developers, and service personnel to concisely answer arbitrary questions about the behavior of the operating system and user programs. 
>  .LP
> -The \fIOracle Linux DTrace Guide\fR describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
> +The \fIOracle Linux DTrace Guide\fP describes how to use DTrace to observe, debug, and tune system behavior. Refer to this book for a detailed description of DTrace features, including the bundled DTrace observability tools, instrumentation providers, and the D programming language.
>  .LP
> -The \fBdtrace\fR command provides a generic interface to the essential services provided by the DTrace facility, including:
> +The \fBdtrace\fP command provides a generic interface to the essential services provided by the DTrace facility, including:
>  .RS +4
>  .IP o
>  Options that list the set of probes and providers currently published by DTrace
> @@ -57,100 +57,100 @@ Options that generate program stability reports
>  Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
>  .RE
>  .LP
> -You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
> +You can use \fBdtrace\fP to create D scripts by using it in a \fB#!\fP declaration to create an interpreter file. You can also use \fBdtrace\fP to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fP option. See \fBOPTIONS\fP. See the \fIOracle Linux DTrace Guide\fP for detailed examples of how to use the \fBdtrace\fP utility to perform these tasks.
>  .SH OPTIONS
>  .LP
> -The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
> +The arguments accepted by the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, and \fB\-i\fP options can include an optional D language \fIpredicate\fP enclosed in slashes \fB//\fP and optional D language \fIaction\fP statement list enclosed in braces \fB{}\fP. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
>  .LP
>  The following options are supported:
>  .TP
>  \fB\-b\fP \fIbufsz\fP
> -Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
> +Set principal trace buffer size (\fIbufsz\fP). The trace buffer size can include any of the size suffixes \fBk\fP, \fBm\fP, \fBg\fP, or \fBt\fP. If the buffer space cannot be allocated, \fBdtrace\fP attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fP property.
>  .TP
>  \fB\-c\fP \fIcmd\fP
> -Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
> +Run the specified command \fIcmd\fP and exit upon its completion. If more than one \fB\-c\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
>  .TP
>  \fB\-C\fP
> -Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
> +Run the C preprocessor \fBcpp\fP(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fP, \fB\-U\fP, \fB\-I\fP, and \fB\-H\fP options. You can select the degree of C standard conformance if you use the \fB\-X\fP option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fP.
>  .TP
>  \fB\-D\fP \fIname\fP \fB[=\fP\fIvalue\fP\fB]\fP
> -Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
> +Define \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). If you specify the equals sign (\fB=\fP) and additional \fIvalue\fP, the name is assigned the corresponding value. This option passes the \fB\-D\fP option to each \fBcpp\fP invocation.
>  .TP
>  \fB\-e\fP
>  Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
>  .TP
>  \fB\-f\fP\fB[[\fP\fIprovider\fP\fB:]\fP\fImodule\fP\fB:]\fP\fIfunction\fP\fB[[\fP\fIpredicate\fP\fB]\fP\fIaction\fP\fB]]\fP
> -Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
> +Specify function name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fP, \fImodule:function\fP, or \fIfunction\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fP are specified in the description, all probes with the corresponding \fIfunction\fP are matched. The \fB\-f\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fP option on the command line at a time.
>  .TP
>  \fB\-F\fP
> -Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
> +Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fP. Function return probe reports are unindented and their output is prefixed with \fB<-\fP\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fP. System call return probe reports are unindented and their output is prefixed with \fB<=\fP\&.
>  .TP
>  \fB\-G\fP
> -Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
> +Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fP option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the ELF file is saved using the name \fIfilename\fP\fB\&.o\fP. Otherwise the ELF file is saved using the name \fBd.out\fP.
>  .TP
>  \fB\-H\fP
> -Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
> +Print the pathnames of included files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-H\fP option to each \fBcpp\fP invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fP.
>  .TP
>  \fB\-h\fP
> -Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
> +Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fP option. If the \fB\-o\fP option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fP option is not present and the DTrace program is contained with a file whose name is \fIfilename\fP\fB\&.d\fP, then the header file is saved using the name \fIfilename\fP\fB\&.h\fP.
>  .TP
>  \fB\-i\fP \fIprobe-id\fP\fB[[\fP\fIpredicate\fP] \fIaction\fP\fB]\fP
> -Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
> +Specify probe identifier (\fIprobe-id\fP) to trace or list (\fB\-l\fP option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fP \fB\-l\fP. The \fB\-i\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fP option at a time.
>  .TP
>  \fB\-I\fP \fIpath\fP
> -Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
> +Add the specified directory \fIpath\fP to the search path for \fB#include\fP files when invoking \fBcpp\fP(1) (enabled using the \fB\-C\fP option). This option passes the \fB\-I\fP option to each \fBcpp\fP invocation. The specified \fIpath\fP is inserted into the search path ahead of the default directory list.
>  .TP
>  \fB\-L\fP \fIpath\fP
> -Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
> +Add the specified directory \fIpath\fP to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fP is added after the default library search path. If it exists, a subdirectory of \fIpath\fP named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fP. (But take note: dependency analysis is performed only within each directory, not across directories.)
>  .TP
>  \fB\-l\fP
> -List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
> +List probes instead of enabling them. If the \fB\-l\fP option is specified, \fBdtrace\fP produces a report of the probes matching the descriptions given using the \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, \fB\-i\fP, and \fB\-s\fP options. If none of these options are specified, this option lists all probes.
>  .TP
>  \fB\-m\fP [[\fIprovider:\fP] \fImodule:\fP [[\fIpredicate\fP] \fIaction\fP]]
> -Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
> +Specify module name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module\fP or \fImodule\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fP are specified in the description, all probes with a corresponding \fImodule\fP are matched. The \fB\-m\fP argument can be suffixed with an optional D probe clause. More than one \fB\-m\fP option can be specified on the command line at a time.
>  .TP
>  \fB\-n\fP [[[\fIprovider:\fP] \fImodule:\fP] \fIfunction:\fP] \fIname\fP [[\fIpredicate\fP] \fIaction\fP]
> -Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
> +Specify probe name to trace or list (\fB\-l\fP option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fP, \fImodule:function:name\fP, \fIfunction:name\fP, or \fIname\fP. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fP are specified in the description, all probes with a corresponding \fIname\fP are matched. The \fB\-n\fP argument can be suffixed with an optional D probe clause. More than one \fB\-n\fP option can be specified on the command line at a time.
>  .TP
>  \fB\-o\fP \fIoutput\fP
> -Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
> +Specify the \fIoutput\fP file for the \fB\-G\fP, \fB\-h\fP, and \fB\-l\fP options, or for the traced data itself. If the \fB\-G\fP option is present and the \fB\-s\fP option's argument is of the form \fIfilename\fP\fB\&.d\fP and \fB\-o\fP is not present, the default output file is \fIfilename\fP\fB\&.o\fP. Otherwise the default output file is \fBd.out\fP.
>  .TP
>  \fB\-p\fP \fIpid\fP
> -Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
> +Grab the specified process-ID \fIpid\fP, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fP option is present on the command line, \fBdtrace\fP exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fP option through the \fB$target\fP macro variable. Refer to the \fIOracle Linux DTrace Guide\fP for more information on macro variables.
>  .TP
>  \fB\-P\fP \fIprovider\fP \fB[[\fP\fIpredicate\fP\fB]\fP \fIaction\fP]
> -Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
> +Specify provider name to trace or list (\fB\-l\fP option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fP argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fP option on the command line at a time.
>  .TP
>  \fB\-q\fP
> -Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
> +Set quiet mode. \fBdtrace\fP suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fP and \fBprintf()\fP is displayed to \fBstdout\fP.
>  .TP
>  \fB\-s\fP
> -Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
> +Compile the specified D program source file. If the \fB\-e\fP option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fP option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fP, \fB\-l\fP, or \fB\-G\fP are present, the instrumentation specified by the D program is enabled and tracing begins.
>  .TP
>  \fB\-S\fP
> -Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
> +Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fP.
>  .TP
>  \fB\-U\fP \fIname\fP
> -Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
> +Undefine the specified \fIname\fP when invoking \fBcpp\fP(1) (enabled using the \fB-C\fP option). This option passes the \fB-U\fP option to each \fBcpp\fP invocation.
>  .TP
>  \fB\-v\fP
> -Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
> +Set verbose mode. If the \fB\-v\fP option is specified, \fBdtrace\fP produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fP.
>  .TP
>  \fB\-V\fP
> -Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
> +Report the highest D programming interface version supported by \fBdtrace\fP. The version information is printed to \fBstdout\fP and the \fBdtrace\fP command exits. Refer to the \fIOracle Linux DTrace Guide\fP for more information about DTrace versioning features. In conjunction with \fB\-v\fP, also reports information on the version of the \fBdtrace\fP(1) tool and associated library.
>  .TP
>  \fB\-w\fP
> -Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
> +Permit destructive actions in D programs specified using the \fB\-s\fP, \fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options. If the \fB\-w\fP option is not specified, \fBdtrace\fP does not permit the compilation or enabling of a D program that contains destructive actions.
>  .TP
>  \fB\-x\fP \fIarg\fP [\fI=val\fP]
> -Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
> +Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fP. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fP).
>  .TP
>  \fB\-Z\fP
> -Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
> +Permit probe descriptions that match zero probes. If the \fB\-Z\fP option is not specified, \fBdtrace\fP reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fP option) or on the command line (\fB\-P\fP, \fB\-m\fP, \fB\-f\fP, \fB\-n\fP, or \fB\-i\fP options) contain descriptions that do not match any known probes.
>  .
>  .SH OPERANDS
>  .LP
> -You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
> +You can specify zero or more additional arguments on the \fBdtrace\fP command line to define a set of macro variables (\fB$1\fP, \fB$2\fP, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fP option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fP.
>  .
>  .SH EXIT STATUS
>  .LP
> @@ -159,12 +159,12 @@ The following exit values are returned:
>  .B 0
>  Successful completion. 
>  .IP
> -For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
> +For D program requests, an exit status of \fB0\fP indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fP returns \fB0\fP even if the specified tracing requests encountered errors or drops.
>  .TP
>  .B 1
>  An error occurred.
>  .IP
> -For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
> +For D program requests, an exit status of \fB1\fP indicates that program compilation failed or that the specified request could not be satisfied.
>  .TP
>  .B 2
>  Invalid command line options or arguments were specified.
> @@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
>  .IP DTRACE_OPT_*
>  Set a given DTrace option.
>  .IP
> -Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
> +Options set this way are overridden both by options specified via \fB\-x\fP on the command line, and by \fBsetopt\fP statements.
>  .
>  .SH SEE ALSO
>  .BR cpp (1),
> @@ -191,4 +191,4 @@ Options set this way are overridden both by options specified via \fB\-x\fR on t
>  .
>  .SH USAGE
>  .LP
> -When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
> +When using the \fB\-p\fP flag, \fBdtrace\fP stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fP running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fP tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fP(1) and killing the offending \fBdtrace\fP tool clears the deadlock.
> -- 
> 2.46.0.278.g36e3a12567
> 
