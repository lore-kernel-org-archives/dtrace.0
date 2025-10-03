Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900B813635C
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 03:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759463458; cv=fail; b=qApgJIIL0PCh9422miJOxXs1OyaQehtq3CCrJwlM8KnpSM9kouRvMUCBEgL83AFfS6hdisTLDmweGqdbrsisyje3NNJX2FuGyQlCZjjoniTxSxMOcCOYmpltfW3yH7c8YvLPf01UtspOsOPTkeFzc5iIj7tVxHq3333fLm4hFQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759463458; c=relaxed/simple;
	bh=pmwQkSHG5DtUYI8iQqtl2rNE83lZgAjPQGTg5niD/VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CG0wseCF4BP0jztXZZu37IKtZ3wZUByBMwv0KP1SQXh83eFJW9LBPjh3fz5ZRB8xvnIYHTTR/9S9UHItjdWJoXqaSpwyYASXqVPysvw61rlxjyWUVlhuTEx/PN3ApAwMi37fDpxbi16NQdlJS2lCSHkhpMgGg+npFo33Kiq0QrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qbovsWKd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vwf55Xo/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qbovsWKd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vwf55Xo/"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1pMl015822
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WudLArTQVPA+9STXie
	kcl7IqNGiCoOzXYty92+FGdvc=; b=qbovsWKdPkf/6s4g1HAksYxdQfpQOXAcRd
	brF1cYti4PiBSj0qqsO3bB7HDGYGvEJnlMsjM0UVinw30Qi046/apX3yUh3HdSf/
	34XA9DQiuiBBh1GA+K3yzVvINckUI3vuzZsi7zkoT9J5sKWEOsscro5+N4+ZSLaM
	hoO8IcA90MP7aJVMIEwsmDoFiyT1Qsz06Q6PXrtid82YyJpc4qHLxs9Tv5cPE378
	I8WxXzEqRskDe4gyOYn56eM9eEp4HjZ12i/vAP+CQaB7KvUVQCF8bnD2XJ0W/fUi
	RTTbyk181tVe8gqCS2McoPPKClupvfW5pAv76sERXFOIu0tx26zA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmacvg8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:50:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592Nwjdc003419
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 03:50:54 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013036.outbound.protection.outlook.com [40.107.201.36])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49hw18hnk4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 03:50:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q2D+tjh7hLUFi9HZw5rhz6ogly4o3wngOLC7vwCPsmgCyAXf23eW9hx0ggVGrIhILRml76G384x2RgK+aTKuO9A2n9TSsVTJukG7lddTvt+hrqMKMoAm6RM51CvVtBq8GmRN0SH0oV+1flI1n2JM/CLPHz+d9jYtIba5JVGORJcXSNCijsZoiyx8kWUhfIzDJZLem8kX47NNt4PVPaIfseqY+nKL2cCmDVFHdLNjt5heC5Z0EnZtxF2Pk5cAooSi0aTCCutL2Qja888aPnS7cwgiZ+VU1Ip716t1rKz9+dSkVhj5UDKk+UIqCWU28Zbd9Cqmeu1/EBMC2dyNGXXamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WudLArTQVPA+9STXiekcl7IqNGiCoOzXYty92+FGdvc=;
 b=d+uro0Osfc84IpSdVdA/KiRUGtN0jRVCRkme20IgulEpW1EoRm/PH7u3Yx2cTBB5i0h+O0wWHYAMcp1Hjj5YykMXj3jJsX2RsvaGChue+0+QWwf691oXt491rj0KQtkOecWwagAFC1CCfha128HZ/AjLeVWzcufxOq+yjSZ2Hd74Wy6BBrBSjPDUOgcx+9Z3sBCWHIKF4XAvaNVBnKSNVNRwvk2VsZrN6v8086OPDDc4RBUoJkdnbRLGgrZ7+KJTo4D30h/s9Ji/Ikx2xshMH83exCVTmhkONIuJEshtugD4mz+WVn5mpafbuv6ZlCdqW37zB2laLO47V6o6ZKrH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WudLArTQVPA+9STXiekcl7IqNGiCoOzXYty92+FGdvc=;
 b=Vwf55Xo/MHvUi06Jcm9EJuHiTPyZVNtwSSHYTLKhtXXa1XhF6OOfrvRzu1LoBckCrr9XDx8/LZ6zJFk6i0EOwL9CZKDUeI1EgtoOxpMiywO5m6INur16cmUfyYhXG3pKcEzkzOwomXLorV/OnXKk13s5eMSC4IDNLQuXmSGkAFs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 03:50:46 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 03:50:45 +0000
Date: Thu, 2 Oct 2025 23:50:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/5] test: Use a more ubiquitous probe for
 return()-action tests
Message-ID: <aN9IEpYnaAwrDpnY@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001062418.6902-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6fed33-ae8c-48f6-325d-08de02300873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eC463yDik5kMfYoYlTDnDZf8HC54WpRYAbrutWHMsV2+QDNuYt3fPeXKtU+G?=
 =?us-ascii?Q?YdxvW8mpaRYOcbxQJyZJ0K4HrgfbD3Zb06HYJJLfIOcA4T//+SUqR267hOHW?=
 =?us-ascii?Q?fc9m9oTMj6JxN2aq7cCKGZeL4ul7tpaBDVwykP6eD9o/L+SDvpsh7WKa9ek1?=
 =?us-ascii?Q?51916pKpEXR6oF+SnnnSdDtcRWxMB+UE+jfowCzIfd25qaWj9NpP1FVaWyn9?=
 =?us-ascii?Q?lWyQclx8Wq8RKuukcouvzVRE0xyR2QMOQ9u01kopsgFCtG4LMf4tDuXXsGGc?=
 =?us-ascii?Q?AAOMqNyexVwVLZJVCywYXw/nens/TWKwg3WKkUrQBrXt0A33R06knJWo5sgP?=
 =?us-ascii?Q?vYRWXlCJzZMOsMWUZaV5i32N1Ytp8bXdauXuP4dJqnuohHPiW0mLwV9dx6r4?=
 =?us-ascii?Q?voowIwXzExRpb1SkrPuBYBgZw3WL/Mq8SthQLXGBrlfWfervchJtzxsurqTP?=
 =?us-ascii?Q?5ZIc150uRTo6mKntAK5qGsh8LZXWUPM3SmivjSOVCyRG80tfjWGWH0DySUkM?=
 =?us-ascii?Q?5dMxL97WV7+MBiRGfBKzAGymdLAExkuTSkUzYJoMViTwwDKWfTzKeSukcYXy?=
 =?us-ascii?Q?AP4Ha4f7wXh9LmJtQnHbyxHHzhgXJEZT6YsJSTq4kOwqDB7m67lUId4q9cTK?=
 =?us-ascii?Q?cZXM6O/d0NjvSgDD/xJhzkqca27gef10/Grp1WP3Y6DLGZ1dcpWfTjHtzjPt?=
 =?us-ascii?Q?2B51/XFW6n5+PgXItJ7OovnQIrMJErGMZDemb5BsiEbAjts6VR0LH3eVSU4Q?=
 =?us-ascii?Q?BhuKZbc1p/p8PZl2SZdYHxsQb6s1Ui1I+3FfDM39dh5RU63zjRvfuFi866RC?=
 =?us-ascii?Q?Ft8CEaaDhjbAQvMjSGCdOGN4HKmJ9f3inGYmQWK3QjLf1tqVV9+9ikuD3Vl+?=
 =?us-ascii?Q?PoZTcEF387qhlLXJjD3NzUUEB/P0H6oXdQEfpyCIZyCyRz0kREKtIlwU5puD?=
 =?us-ascii?Q?0LhsZZBU1UcSLf/5A2eky4IHAe8yyeam0XG7ZVnlROp+DKrnryL57nkKXXrk?=
 =?us-ascii?Q?MXaeYxiWW0Ls91hz3zJbu+wT50cFD8rSQQPBFPu/reJQz/0tczNOGpE1N7U5?=
 =?us-ascii?Q?EyK8OGVz9PxUYpNsgLH3f8QIu1auqFjOQK4KpQGMSbUmZYOnAw51Wk9P3i56?=
 =?us-ascii?Q?whRVLWO2qhDRt0PHNRPNKlPvPvJEoa0ualPZD98gkQlQCbVn27MfiHtBp7/S?=
 =?us-ascii?Q?9WhzoA5WjfOUyJG2Kiobu3JB8cU7NB2Mg0ha9c03Fs47mWSdRIlHHKMZcBvx?=
 =?us-ascii?Q?ZyKJ4AFw/mzy2WMx3K5JD+O6DAtRgJcFj2/2Om6S838AxTqMmTJc3ZXEX7v9?=
 =?us-ascii?Q?wgRJqe4+3r9gpznjEY6MSolNyddp4C/DsfqZYilHcnEfeJ0lgLoIZ+VESR1f?=
 =?us-ascii?Q?jMdIVIwMolI0P0uNLXSSkms4HKl65Dcs/CSfRnzVsT0Dl8PHTCpQ2OLT7h5I?=
 =?us-ascii?Q?EoFSO76+xTgVS+35Wlc0274ePIv8SCNg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4jmyuTUtY66fM0tCVfV5xQvPVt0VF7x0uZ0gSbP/dYoj521sLYI3GdUReaiO?=
 =?us-ascii?Q?Lu5Sp4D74qmRnwvNBPHO+SYRca663p2o4u+XJDVMjvcw841Wj1fP4qZrfKOT?=
 =?us-ascii?Q?T3yCKSgCB1kscJrTq6v4+xxEt4G0jnlqiMOAALSbGh19pUe3B5lDI/snpi9J?=
 =?us-ascii?Q?o75iOKjhps48Ygzm9rRJoSvRMGZDgv+qSKPD8MHWUE9E6N3n3vGkYkWNrA+q?=
 =?us-ascii?Q?7ppoNMb18TwnYBjafqgkmHQo2cTsawmrb90FlVE0fpm/ot5XyRXZTYxOtttz?=
 =?us-ascii?Q?BVgIDwR9TqtI8YKnvFDa/ruNDBE2s2x4O4jf3d5XzhWFy+qO7pAqqENrnJDH?=
 =?us-ascii?Q?yX7J4Fdu3WQ9Npmz3hpy4D/RgkgQX1+nDXCBWplc1RydIjj3WXIBgsEcL02G?=
 =?us-ascii?Q?/LvAUqWMS4g0jJtiiymnF4o95ioGqbzzqqAd11LAjn2Y5YTOjFBl1AHCOBPz?=
 =?us-ascii?Q?fvDYM909wy92UuzYzzJYU2H1TDGjKyyEgWz1qCl8vsuBuDgeEUyhYUZ3cs8o?=
 =?us-ascii?Q?9g5I/nowcr4carBjnFGC8a8/QtB6M2Z2tSZQ+bySCcu58CXyWIqFgagHKByT?=
 =?us-ascii?Q?yrfT527cmYv780k3b7RTQfQy9yef46ZMi/JRRp6lumMVZy9EwIkDBmmqK9iY?=
 =?us-ascii?Q?zjm+gLoAx2EesLCvwvWjhBCbVQEyJwXXQhprxuZ5zHqS5lQ5taqYThvF/nAv?=
 =?us-ascii?Q?KCGWCbYuRHoJbVgwtPDnVpqY8oX3jJI4f9jIhoYmCAFjnZg3hfUY0B0r7JfJ?=
 =?us-ascii?Q?a9wemO5QyvhaHUmz9gOjzeO38ouXov7G8qSERHvdv8sdGuJVdhxacBiYRoom?=
 =?us-ascii?Q?SzzvIJaUurqYT3RZydK0rY9uocJziVQsI93kYlpP+tKS7BptlsUpjVabQvt9?=
 =?us-ascii?Q?JSf5Cv0XyRK4YNJ765WvdyeAiabHXGVCu/YoyrQ4jp04vXDpnl67l+BjNiI7?=
 =?us-ascii?Q?Q7v1gmP4gmn8Nkz50xd5MnJzVdLkCqNQvA/Ht2x4BUyxKsxr4vC6UsOJGG8e?=
 =?us-ascii?Q?6tAiSdG0TOsDmLYqN4d1ORjdpI7Gzj3ATYY+dYjhtTt3CQwq1U++ZTfl55VS?=
 =?us-ascii?Q?lFpKFXFnVjZYkTVm8kr/15Zqs5RWqsTRkfcPDjR5UqfvKSScsKC+z3Ht7aCm?=
 =?us-ascii?Q?3BqGrwWfj8f3HwLl7mBUhohtrK6rGg57oT2Sadt+j1R9INY6kInpdqi7GEo6?=
 =?us-ascii?Q?vROrRj6LqHgX6VU6gfh+NcDRJq6rTYMFDd5suVeJkFb25dSA+u8JNea1OUUX?=
 =?us-ascii?Q?S/+297p/M13PW54x0BCC/iiluZ1vDsQNMpenbqHUQaALcP1cHH7JMcPSnFLf?=
 =?us-ascii?Q?4C93h0fnP+BM/vMM2HK4Upz+D2kxuit+7wmdO+bQvsUTcwMbGOjiw27vEQ6A?=
 =?us-ascii?Q?e8tKNA6wtigS6ZbA6h4fJf3ivE+V7ZxfQTvUokXpDoD/yaC7ACdTg0QhkgZT?=
 =?us-ascii?Q?TE0jj6snh0Rli3YVbZI7QV8ZLkT05lUTLiplDEBtVKHtjR4rlJz7MUtgp9zw?=
 =?us-ascii?Q?wwVYzypNZZl5WpDCLVIkgjYyYAkmpn8DeZ+M5lkHLkarGxHSWWNqMs7M0nfQ?=
 =?us-ascii?Q?k/XVLidMw5I5Sj2QB6Y9bONcrdrBOhhWA8oiNrvxkWYnfI7XHGkjFkbclqjJ?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZHq9vLmRfvCUSJFYBWBNBB/++SBQQXuQ8wIXvBRLGZ1g6AnM5KuSUprbzZ41CDnOaQHvMbFLzfqU3nT1RblrGcn8OWRh23oB999ISz6lOG5sUOi/0xX9m2yyxlVeGf2cT6lTgIgq4BCnbg4jRqcpMN4amo24A6CTEYfFmbcdt/yjC9qL5DaebhFuKTBS4BsSALXdUc/OCoqYwNBcodoNUFBleMZ+mpg0HCYY5QcglPmgIw5XBiYvXl0H2tAvOGJWrpmD3IzIFKK063itwWI9jog5WYCwD1vf2J7TIea4KMpeBuWC4+vs8iecbV4CUWABMQOhOMPJPkzWB/PrmLYmIXaeeqbYkV3/6OJsS2SrNkElRJ/E9GO+5cBvp1qJKivVa7XbUbF9JXlUqW1lgPkZFYrXJZgqukezgHz5gullt83Z2xgOxDdAOxJHAe5JyXTUv6PK+hcqQjUGaKz7RKK0iZazbwmYjLXvsJB/zUA5nAYK7YDBrmdc8Xma9HPAeZHl/zQK9sYA6fYVqE8sVdGtIiDxRr/gud1Ka37ySsDvqjje4BMHS59DibldXlfZIYvAshv3sShuBkGAqN6IxNo3EBG+WCLrLnOQkdOxBRqqlyk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6fed33-ae8c-48f6-325d-08de02300873
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 03:50:45.8122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fVZcOU3RVLZLMB7PIgcFyWUYgUkgQtkcvJPKguDmYtQgSNPyw+iyFAJDpe9HzYNjQ90z1dgHc1CscaVURBiPmi9ZmMdh9uWm475pjCc3AkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-03_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510030027
X-Authority-Analysis: v=2.4 cv=P5I3RyAu c=1 sm=1 tr=0 ts=68df481f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rtjZ88qG_EbOcs0FeYcA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: JxJxXOoIDmcmnJtXHxeAPWjglzKWGAmV
X-Proofpoint-GUID: JxJxXOoIDmcmnJtXHxeAPWjglzKWGAmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfX3mla5bv6big5
 rEOlmsD2xrH2+aNAVZmHF1zLXBod7y/WoRmEKjJGV2VbRUbLvzgm7NHFL88BhLzRsQ1pZou4kGW
 gM833HHQGAR2+JRT2jo9zF9J2ruZFkTUj3BfNBO+GhCqHUUbS/elKxBNKdu3GIVOWKvxR67RNvS
 cZ2R1loUxpiYGdkLi2MMzE9v3Mj4lYYq/fJv+NNyYNVUsLilb11oN32QMNV1ZYWthqJbNFNJYLd
 nzPjaQ2wof6bpshvYTiPSkI22opQO8onAl3bxI7zzojrnXlF98JxBTwwbOnuAyk54wXjKHNhzpc
 dDM5a/TKfJJL6JHI0CAqaf9MCwrJf5BfDsMYPRocT/4YeQYp3hr+egd5k9+gpWYZ9mcX3l71/EV
 u311JLlbuqU2FqFuHVd999viIAaguA==

On Wed, Oct 01, 2025 at 02:24:14AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit ee2bd3465
> ("test: Use a more ubiquitous probe for return()-action tests"),
> rawfbt probes are named in some tests, but they do not exist for
> some kernels.  Switch to more ubiquitous probes, since the details
> of the probe largely do not matter.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/actions/return/err.not_allowed-1.d   | 2 +-
>  test/unittest/actions/return/err.not_allowed-1.r   | 2 +-
>  test/unittest/actions/return/err.not_allowed-1.r.p | 5 +++++
>  test/unittest/actions/return/err.not_allowed-2.d   | 2 +-
>  test/unittest/actions/return/err.not_allowed-2.r   | 2 +-
>  test/unittest/actions/return/err.not_allowed-3.d   | 2 +-
>  test/unittest/actions/return/err.not_allowed-3.r   | 2 +-
>  7 files changed, 11 insertions(+), 6 deletions(-)
>  create mode 100755 test/unittest/actions/return/err.not_allowed-1.r.p
> 
> diff --git a/test/unittest/actions/return/err.not_allowed-1.d b/test/unittest/actions/return/err.not_allowed-1.d
> index 246a68b18..e32751bf2 100644
> --- a/test/unittest/actions/return/err.not_allowed-1.d
> +++ b/test/unittest/actions/return/err.not_allowed-1.d
> @@ -20,7 +20,7 @@ BEGIN
>  	exit(0);
>  }
>  
> -fbt:btrfs:open_ctree:entry
> +fbt:vmlinux:__*_sys_getpid:entry
>  /ok/
>  {
>  	return(0);
> diff --git a/test/unittest/actions/return/err.not_allowed-1.r b/test/unittest/actions/return/err.not_allowed-1.r
> index e3443c301..becd3d4fa 100644
> --- a/test/unittest/actions/return/err.not_allowed-1.r
> +++ b/test/unittest/actions/return/err.not_allowed-1.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: could not enable tracing: return() not allowed for fbt:btrfs:open_ctree:entry
> +dtrace: could not enable tracing: return() not allowed for fbt:vmlinux:__*_sys_getpid:entry
> diff --git a/test/unittest/actions/return/err.not_allowed-1.r.p b/test/unittest/actions/return/err.not_allowed-1.r.p
> new file mode 100755
> index 000000000..d356eb0dd
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-1.r.p
> @@ -0,0 +1,5 @@
> +#!/usr/bin/gawk -f
> +{
> +        sub("__.*_sys_getpid", "__*_sys_getpid");
> +        print;
> +}
> diff --git a/test/unittest/actions/return/err.not_allowed-2.d b/test/unittest/actions/return/err.not_allowed-2.d
> index e0d303c71..4c613065f 100644
> --- a/test/unittest/actions/return/err.not_allowed-2.d
> +++ b/test/unittest/actions/return/err.not_allowed-2.d
> @@ -20,7 +20,7 @@ BEGIN
>  	exit(0);
>  }
>  
> -rawfbt:btrfs:close_ctree:entry
> +rawfbt:vmlinux:abort:entry
>  /ok/
>  {
>  	return(0);
> diff --git a/test/unittest/actions/return/err.not_allowed-2.r b/test/unittest/actions/return/err.not_allowed-2.r
> index 758d34770..bd47e2bae 100644
> --- a/test/unittest/actions/return/err.not_allowed-2.r
> +++ b/test/unittest/actions/return/err.not_allowed-2.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
> +dtrace: could not enable tracing: return() not allowed for rawfbt:vmlinux:abort:entry
> diff --git a/test/unittest/actions/return/err.not_allowed-3.d b/test/unittest/actions/return/err.not_allowed-3.d
> index 770565c93..87891b7ba 100644
> --- a/test/unittest/actions/return/err.not_allowed-3.d
> +++ b/test/unittest/actions/return/err.not_allowed-3.d
> @@ -20,7 +20,7 @@ BEGIN
>  	exit(0);
>  }
>  
> -rawfbt:btrfs:*_ctree:entry
> +rawfbt:vmlinux:abo*rt:entry
>  /ok/
>  {
>  	return(0);
> diff --git a/test/unittest/actions/return/err.not_allowed-3.r b/test/unittest/actions/return/err.not_allowed-3.r
> index 758d34770..bd47e2bae 100644
> --- a/test/unittest/actions/return/err.not_allowed-3.r
> +++ b/test/unittest/actions/return/err.not_allowed-3.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: could not enable tracing: return() not allowed for rawfbt:btrfs:close_ctree:entry
> +dtrace: could not enable tracing: return() not allowed for rawfbt:vmlinux:abort:entry
> -- 
> 2.47.3
> 
