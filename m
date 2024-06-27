Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3201A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466757; cv=fail; b=Za3d7HkSXLLiHcLiRIojSoXEoqGiPu2KS5SNr4CwehnV/Z33e3POjGe5kcd88S6uk4HI59520BFR0LUgE5P1nkMijdliQehF5juIH+KpMIH1lNS+1nHvG/iAQs8fyMO7V9V9E+xzwLQ84zE1rpPcxJ58W2vV1OaICcpHripFOWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466757; c=relaxed/simple;
	bh=gmLr//axGp/0B2tSuckjHhufQ8859by3j7LRv0UA1F8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PhGFXoeYxPMA0vCA9CLWWsK9ZSNBBwCpELXW+2sRO0PmEU8fTJENI8eupmPqxgeKaBi4vijWSL/X4ACWA0egrkKsYblXza9X24rXrOoIxxmkLXAQy+tNoIBY5QLyOb5U1siKPuSSqasr5TKvTkTECxSnSFYWLzelz0aJMw9Orpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cNUWhW2S; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jArdIzfF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cNUWhW2S";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jArdIzfF"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMfTs022450
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=J/E1QknBlUfPFJ
	h5Zl8TkF8rUBxnX52VCBCNswf1HWA=; b=cNUWhW2SNSSE87bYYveILiW0bh1jVY
	b6KhlLkRXPTgRV3e94nqfE9xy8JdvPmhHHQlu92mBkdyGPLsEUhVOluWBNkAOee2
	cbJr9K/YdPHpgttooWQXV4ZDhNZ3w10FRP0GtRlVKuQGRbJdBRou86o6fG8tCwrA
	n6lSDQZnG9A2QICb84uvROp9qMFEoaD0ZNGXRJKTJ5eScpA44OljDS3xtM/k0JKe
	C3DScBGSwPOS+OTXI4zR+L7TQr7yAiEE4tk6XoC2dVuu0wwM0E1HWauwFUzcNxZz
	hAwOL7yUBEPqH7sFtGfz1CvJhxVrO43uJgNIjG3vTep4hi+gqYSBNT6Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn70d128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3qB5H001320
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2an1uk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:39:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PNBPJdbTcujLuYr2AGoQ+pTbnqPCbXRCcQlQfKMmbu1/l800nj5wSjUzRvP703xQ9OIQLtaTb9fnfysaY/UuvFadyvEWpEDZ8U1HYT50w31BNmfe7IDwKmb6xlsyiFnxLKt2MrS2WVCBXLgBMzwgZa4NCckQfyohSnxZK9NgctDtQKaip4CRw9f5fqkWqE/cRwLKttG3si7UYRFzW5SCa1fDqWlxP+MuMGsbw3ot7XJG2maveQE7Mku5oNpuReC5C0jECWp/516sGYPjN1cOIjKpq7ZRRn5bSxEmL3xwqPbNyhlRSWa0DKrHatb/2+Jgr4EgWNfwfghf6yPQ7096gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/E1QknBlUfPFJh5Zl8TkF8rUBxnX52VCBCNswf1HWA=;
 b=Pmedcpnes/tV/4R/oSwg154xDYygTy6pW+o/TzL0EHx6eLX+AYnfr7FeX5O+/R6HzPiRjm2lO84jHVPbAsRZ68fid/PTwjC+yAb4FkW/V7vCq3a81sojB0RBxvRKlearpjR5KIg4wm/cFhhJzJwqg5REkB5pi8VjqmdnV4uFfswC7TJ+R+WYNOME7WaoISKZcgsQCSS8HwTSAMwkOHSnGElVd7UHO8fHfO5f+TJghTpbf+9i4bes9OZcoXroVNiC1EVkEknyjVpissddQIqFsg1fIuXeVn0+MfHYwx9q33hZJM5cgq+16mreZifQvt9kWeXpFDLWp+nW35SleP9ypA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J/E1QknBlUfPFJh5Zl8TkF8rUBxnX52VCBCNswf1HWA=;
 b=jArdIzfF4W3wUJ4G6QgdLZOgQ3LyjU9tCAzUdEPdVmQRJE23By8Qki/3EC15Pwf9PRejHrVgfDq+8iaQrB1JxQoM5efmOVaf1viiCExa6qXfLB6U4FFa0muwvy1ViVkGB91mAR1ZBNtrbXxl1V7T/qmBykGEF1q0yWYZd/hd1y4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:39:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:39:11 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 22/38] Fix aggs comment in dt_cg_tramp_prologue_act()
Date: Thu, 27 Jun 2024 01:38:48 -0400
Message-Id: <20240627053904.21996-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053904.21996-1-eugene.loh@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 8033c391-98d8-450a-20d5-08dc966b7902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3NK0jtbclsNd3AKxPIJnZ5oVsRdcvkMBHCxiM55KTXqg9RSEQycPhkbmwBxA?=
 =?us-ascii?Q?QZZbQp/1Xd2cjiJBciYL78+XvxWX1/ZembfizgSFz+jDoVm/QiK9yd9q2RGI?=
 =?us-ascii?Q?t0ba18KJIXZMU0BnNMACzbdcZg3GLqNDB6CdgbOw1N2K2Ew8izzAdN/4hnP/?=
 =?us-ascii?Q?vvd3qvh2u2D2gE7Xff3i86b/pOAOONb8qmrg56YpUt2Bs71yVjqclOFtqLUd?=
 =?us-ascii?Q?wmLgnF5v4WmTrLxlyHdac4VEfKlOX0A6xbNhIDAx8aBXavy2F8c/5HD6z4Dq?=
 =?us-ascii?Q?c1HjbdY7ds4Wh20y/XQ6Hmi0uo5zSwPrGlPY8Q1YbmWdae0WY5Vhsu+A0oPh?=
 =?us-ascii?Q?CjHFx8GfEnSvzhIoNGB1nsSzaZpLjiFPdCYVFUJ7YirlKtCzu/ixUUMHD38W?=
 =?us-ascii?Q?rjn+SXLXa+o29zkeafgmkyE93H5lNpdJYQvJetyS6NX7ahHh4YMn/R3vOHuV?=
 =?us-ascii?Q?vJzxgkQ6wlJ8by4IWUhxZqzaCWXfNyw+7FSl0yH/th1s0Xk4kdOKYWX7fetg?=
 =?us-ascii?Q?G7AD6YlYIAZZTzRm/KczVswHhB6Ej+GWnjgP6cndVOaAv0SF3908AprUVPkd?=
 =?us-ascii?Q?+guwEw3d4X9Jrf59vIFXZQEqAWoLar3qgx4mtdpXR6zp4c3JoxTGrYbxqcpq?=
 =?us-ascii?Q?3nsBCvowvyNSjcg5maRGVKFy13Ej76StZ7pIVEGcsuGZEfECHOpYwtF31UJe?=
 =?us-ascii?Q?no/sm9Tm4AsEJ/Qg9TCFOGoSH/vVQIo4h+8VjcPN6yXiGmu801IDe9c+9rqn?=
 =?us-ascii?Q?vsqVf/ECCdkWJ/JcK3OPO54w9Ws2vf8B9nZNIXfk3tPxKLdXvZlJXrP4r0Tc?=
 =?us-ascii?Q?yS5++dVBVdDqTmYQaTNx9GKswGiEAlt4iPv/ATnMqMnnfMRHVuuAbgz37+Bl?=
 =?us-ascii?Q?iWSe+vBqg/2KF2gExDKwtTu3GeIZrxbxrLnxx0V5rR3fOQ8FQesMzBSoK/Zz?=
 =?us-ascii?Q?UO1LcklVLrDVfkrU/QOh20qdQHsUYPfkdxd6cB7pc0bX33fsJYhR0f2mDYyc?=
 =?us-ascii?Q?ZzKIIhJ0b/wvJRHViSigNdsAWfsPjrz/32EsTAiF4uXvCdkOl4DjsVXqqoS8?=
 =?us-ascii?Q?EOZ/5jUC9K4Xykh7vIpkYMaH27uGUwLux71sY0El3AIGNYcmHkZAk4Q4XiQv?=
 =?us-ascii?Q?cK9GVC8sz2q7/wxDuzELYOUXEl0MLc/x+QSjlikXIxScaKM+5aKF7NzRzgKv?=
 =?us-ascii?Q?3WUCkbgpksaes6jM/BP8OZHKL9/ogXWMihWfmjaxqY1va0h2htRx0Bn7v7eh?=
 =?us-ascii?Q?FBGofZ5U8S4pYFjLAT3KX9PntoV2rwvkgNv1W8gRfeewqSJppS8bj4Sb6qE+?=
 =?us-ascii?Q?+jMYrYYk94bkeFQ4uXDvJOwBPOGjOk/1ltnOh3Z14zJnbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Ku7g8aFNzNitYNaj5pQxk2c35WOo4IirCaMhptF6PKVSASRz1CqsbP1NiW2?=
 =?us-ascii?Q?CXCY6zBDy2c/exxeUE/vPAhEJH0RP/C0I1tgywbUBUSO06F4WUN0dgtN4hA6?=
 =?us-ascii?Q?D3mrqkh6Log76inHYgrCQzRdu1f7Zyz2nlru9xxYBzm1t3z6gVsA7r0wQH6k?=
 =?us-ascii?Q?mxRZIG5GWXUURYRGtgpy6D2wmwACfDVFJWCMg/Qr4k/ykqrpEYaCWYskQUXK?=
 =?us-ascii?Q?EaZ4XQofzsHiLr2vPvOwJrtxBpvyfEdEijORi6T04iJ3g5Ta3+PEZJtZHELp?=
 =?us-ascii?Q?C000IgHI1TkttvzRuvTWB5eUBcdUw0qn4zrwxTeC0JsJh8WhNC/cuZdH70ql?=
 =?us-ascii?Q?jH6RzBmDKrDo3uIa7Rd17GVNKPL0QdRos9FCK9TLyfntvUeION9HzfQ2rd9M?=
 =?us-ascii?Q?lYHOa9PDX9kpVRl9aDhpqElzKSRpyk33v1hYNTkMJ3kpFGLd3Rn3l9anUO5f?=
 =?us-ascii?Q?GpccWCZ2VYoNs1LyI4k/VwCCKBP+7j3dRDCfaoOAXuUVXLEpxzjsptZs4Btq?=
 =?us-ascii?Q?6BuqBDfJo2UMFRAoRIcRKGk9Hza/LV6twY2hTSrGqYdFLovCzCja3TZNAuYy?=
 =?us-ascii?Q?L4EhpsMkh+rEDeBVmWIQ/DfRYYAkStclOUCMKnmu/XI/BUSehgoT7frTncV+?=
 =?us-ascii?Q?rY4cVrHQKXmhgN3fHUB40HYUcrpLPsznItm0SP376V7l0hbHJAnyh3At3g6L?=
 =?us-ascii?Q?VkSB1PEEKAW1LqE83OpkP+bNBom7MYjzRDRQTuACBCzutWO+rWBlEh1+YxYC?=
 =?us-ascii?Q?wS8eWdkDDyFSDVXXPd6KxDUqBMjBz41qbf8nv5sIDhN0IAqcVu7eGVMW08bF?=
 =?us-ascii?Q?jJbITjTAtAIu0gSG2gKAcze5YX4rfAyCLzcHcWz2u0+Pp/+e2Zb4ez96J9PK?=
 =?us-ascii?Q?Yao2gXC+wB7z2YC7tRcEFr6qS9tbs+8FYrPufEKKhqDb5O/S4d/AvbN4cLNV?=
 =?us-ascii?Q?Q/Xt4P9EuV5qOarLUoViQIzgVpFYTSLc69LHUtHbVRhoKBeFANQbelZDFeRC?=
 =?us-ascii?Q?x4CThjy9sRBNjJxAcUB9OpPdvP6p6QYpm8AyiLamvcwX9tWy96PG9JXeM5z4?=
 =?us-ascii?Q?2Rg/fsf5c1Aoagzo8fC9V3YOczjBbgA3rd6Egi0Jq8/Z9AO+a8HfEZYW31IS?=
 =?us-ascii?Q?z3kg6H+hCZDFgSBHPEmwd44dhatFfJgPBEF5GJ2Nqi/NhNrdawRMCFw6KyTZ?=
 =?us-ascii?Q?absFAWUYwkbkaUf9/tJs653WgmJGCu4YXY3cbFub9Elk0jmmIQ2KLbS0RxFX?=
 =?us-ascii?Q?xDwLwK1K/hXyALGAKBWM7xtmyErfm6Mpb8HFQSwFlzCS4h0wd1IvmJ3pTi9o?=
 =?us-ascii?Q?sgUkxGj1CU8kO2PRQ0blZo6P0PxHj2s15LqtTGLoPS3g+tkRJfR7Oq80qF/w?=
 =?us-ascii?Q?yZjcworXfL1oE/I4FTM4fZhgeNlq/9M/XQc4xVRLjur035emm/8z2ibjY/6G?=
 =?us-ascii?Q?AwlhwGLKFWG6tweBwCpcJzqLCs6n7cfkJBk5OrAWljx5ko3vVJK5+bFmSAj3?=
 =?us-ascii?Q?Tl7ugiFZRdhFwm2eikFGDC0cGvcnt6D6Sw9YSeeD3fM4bUz7adhey6CaP5Ir?=
 =?us-ascii?Q?yRwpbwmCg67eeQ+ClAfztX/M1zS6a9uvUcVzgcK9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	UKowNdQ7b1CXypM+QOkk0z4Ida8APaHzJqgxKwEtEwcxaMJEosC7NOllu7gckN5/L8he5KQUODMQ0OiwxBtgssXqw2ZPkx9FVdDi++gdm6xbdjf2MwzrKf/btOm6/ByqhOSebYSA1F1xsnXdTIHaP1JUz/v07wOz65SnLRCuwO7p5YVj9t5JM+eQ9z31i5iJvAQDygJLW5pFUO8gwCGNTn2/nyjVxyS5AKxyGhfGH4z0/HCdXlhnIgKb1SZSC0R+cEB4ld+gyzCdn3X/qONqkZBhA9/W7KGe1j5bRVKMVzi7dkVfA3OlA49VMaEWuJKjr6B4qOoybo+6DtYqTPVcd3RYFv4Yol2/cpKHbI0Y5ObdmVSsBz0N2XKiPWcWDgLiiyCRj3ux3Y2txbMqNmKDGd4qssW7hc9W4mVcF+JSPoSmDX68C5gf8JSNTn5g8nhCXFdiqxkFwTjHCCSRuOBCpYq96UC8A8W592O/2iCBpoBqy0zsoNE3RV1ntP5yC1HfBiULeFe2eblM0Al05G9e+9UcA6z3f6lfwiIh9ePeH6/63GVB57KL1LscajFT3oz7U6hqkaexlTj98kqGpesfH3HhnHjLtXRfzXCqfewLn+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8033c391-98d8-450a-20d5-08dc966b7902
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:39:11.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LYlDpBYXUCq8pYb6CGXG1Ed0lUaZUZQR0XRPZvAuFRyZ2S5O/cQEKfjm8PVBMofKjC49mapfBYgiRTGJMNpDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=984
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270041
X-Proofpoint-ORIG-GUID: sMYXMnXOQe8uHn-YdswMk8kDegMDiYaQ
X-Proofpoint-GUID: sMYXMnXOQe8uHn-YdswMk8kDegMDiYaQ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 4fd2d359..2fb2d0d8 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -372,17 +372,6 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
 	 *	if (rc == 0)		// jeq %r0, 0, lbl_exit
 	 *		goto exit;
 	 *
-	 *	key = 0;		// stdw [%r9 + DCTX_AGG], 0
-	 *	rc = bpf_map_lookup_elem(rc, &key);
-	 *				// mov %r1, %r0
-	 *				// mov %r2, %r9
-	 *				// add %r2, DCTX_AGG
-	 *				// call bpf_map_lookup_elem
-	 *				//     (%r1 ... %r5 clobbered)
-	 *				//     (%r0 = aggs[cpuid] BPF map value)
-	 *	if (rc == 0)		// jeq %r0, 0, lbl_exit
-	 *		goto exit;
-	 *
 	 *	dctx.aggs = rc;		// stdw [%r9 + DCTX_AGG], %r0
 	 */
 	if (dtp->dt_maxaggdsize > 0) {
-- 
2.18.4

