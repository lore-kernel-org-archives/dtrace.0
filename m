Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3968C22083
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825282; cv=fail; b=SAuMYVA3sjtVH49vL1eZEa9eyuuQysI4GyE35GBkyK1dQUNhXlmJ1yTtva5QkyHyBHgUbbLHqPVdW16A+oInWmTTRwfz0WiLsb6NOVgBcGHuonjW8leqQFMH7VYX9sZyZNSGYezG3so34sSF0mCNpdIGwmtLTpebiGHXXK+IWnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825282; c=relaxed/simple;
	bh=7STY2a3FhZSYRgzR0PnIR4s0McZsHYlOlE2xSGn8fQg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F/2UORtqH+QrWTkHrvMyacGv5F1wD7xWGIEuL0Bh4YTf8c03jxNc3aWCiQUfqL2v8AUjr13BWI+p/qPWCKNfbg7H39CNWGa2vQKt2nOBgjwPJBUj5MoX18y10Lmb9bdV96i12B1cHomH1yb9ntiBojXQc9wTg9RSQTICrXFSRXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oyqqQw7l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g5vHwI9m; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oyqqQw7l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g5vHwI9m"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMifmg030649
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wODg85GXWCU4j0+tlq
	ReAoQ4yumTbn66ufCJkRq0ghs=; b=oyqqQw7l4DpzgYgwMzHsWWsjG0qtjSUwEL
	IHblGW1tvFvzexkzJVbAuKdDj4yMPNYh013Mnov6DrIH3emHV+HbJyWnfJH/UJUF
	u/dXokG1rk2sotV3Slz9Junlbx5vix92Dnu1vOiMR3gidBvoJmh20uSEdias8m7r
	GsiRpyj6kPl30eDAzuranpjgPo1QLJB94iRA6vPeOXPc1UDdXQNJI+Uuhe/vYN6u
	p+8Ekx4FnIjHAK/ODlSCjI4XB6gOL3lSYaj61jXy+4flY8s59IqgGOWGhJ+p4ArU
	Vv2Sy+r7UzNnzZqsfYcFPW598qVESSkAgkQf2tKVDyTL0FSdwCpA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxen3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1bPnx007432
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:17 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hkus-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0UgXAnpoww6f9VwRaUNMFC5F2P09oKJQOyYyj1RBrEBMuF9md6Wcu5uZ7fvJC1tW4T/Yu5sWg4rwlk/kmbVHlL7OgeInrebLdH/sZynz8u7pUgPwzI6/SBJwrBHGCxqSHAfmO13dazjvpL6ujLuKHFSBK9xIQpjBK2LMCGejfaM/wYN0w2eEk8O0RmSdDVRIkSHc1QqoSh593b3f0MGVz3yYW0wrW9EOn961YzdH6L9FZlzimgiNOjkaHxYZ96tZiu8nw7w4s2eq3hQUEBCLG8DkWsT481oHOLn6D2IuQZlWxMY5rHMi8ADxRyVl6+3QMwxwsKYmOl0Ty7ckL2jcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wODg85GXWCU4j0+tlqReAoQ4yumTbn66ufCJkRq0ghs=;
 b=Fupuvts5mVByWmwJNMU1wa2IqOkYHY72FQO2iRs6IzstFCs3mdGHJZsiNd60sg7FFlZTv49MDxk5iHUHPMPv9ApYvsGcDeLchQHD7nsdEJSCtU24curr4k8pDdUYQtcxz57qAP34wZwcBdKl8hkhrCBDSm03p1Lj0VU6dWz3apG3K1tCXiEsazGGLQS62NdjQKBaeBCgftKbsDXhwpLjXl2gPKcb+7TpfXeGxgFlvGJDvW1aLnUiJRAu8PDRhD/eybItE9FIqlxcPcdUyx7/4ypMiLOeWf+AWXzyj4QR8G08HOsXvNNevaZwmeekRl9ckKUPBZbjfuWIIXX8FWhy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wODg85GXWCU4j0+tlqReAoQ4yumTbn66ufCJkRq0ghs=;
 b=g5vHwI9mycinFtKxwfSvlTaSNMtHCsZQzypeK3Hu8vjCNefl/z2spJwXSg/S5/NxyccyVDeCoadL+cyiFxPLvW4M3MBMem+Y28+xyRB0zKSB7CvXhQ3dZlU6R+tkWqMu9UUlh1Qb0w9eUd8zvnq1ususT/Bp+znfcw6TPAU0+Bk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:13 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 03/14] test: remove unnecessary "unstable" tag
Date: Wed, 25 Jun 2025 00:20:56 -0400
Message-Id: <20250625042107.13571-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: f8dc40c4-5bd5-4654-5be7-08ddb39fb84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HSfJt7nnLKQr06MyO1MbAbDG3HrFEyvVfZu4CpvDVFNmehKW4pgs18+5IrJb?=
 =?us-ascii?Q?39HybL3oFZUwyUFNoFIz9EATgp/9Ao994zthLQADRQkKYCuaLP/K3t0T0nXu?=
 =?us-ascii?Q?+6nrTPArncbU+FsatcL1KWFVBONLkmG91WfJ1lfDX39ZVP+ZqQuNI6xN3qFg?=
 =?us-ascii?Q?W7FF2FhifZEmfkWy31aLszKYrirscE16MnkBJknDA1EJBW6mYwmv3muTqZez?=
 =?us-ascii?Q?MGxEaLhTNNIuI9ssylJW+ZR08gROjeXQRXURe5XALxQ64/tYjOqnUrmxrm4f?=
 =?us-ascii?Q?eO/SkZQ3Fas9ciLQr2jnkWw5R/Y/k8Et3yzZSztOdbhX/CTpV31dT/m6IKME?=
 =?us-ascii?Q?VEcZ9A96nEXgaBBg/kkpfhSe4gDpseE9AOW7C/ZTu8Hs9CZHs1jUBbQ1JAQX?=
 =?us-ascii?Q?joFec6GVGcOWuzgWJHEa3lOQ6dRQy8/bO53QS7YMzpuwDDxHkqN/2TxF3ZfO?=
 =?us-ascii?Q?3Ow0EGtiwNMOYbEA8l/yz9aXQsbp3MTjP9zIuBd6wdQqStnK05ztqw4P52Lb?=
 =?us-ascii?Q?le/NQncIjwNt4LDKtXMoVaR5OZpI8KuNyHhRoHs3G5M2jF5BiOQVNUeLOT3A?=
 =?us-ascii?Q?wTFoy468kobzdiHIyKgd7CPs1hugowFqT5VEuoZg3FU4Als1zRVPjRecPxpS?=
 =?us-ascii?Q?e2jiytnjg+4GnZsdi04U0YocPsJ7b93NPy+SIOgqbc27pIhAtxipRFgxBLOU?=
 =?us-ascii?Q?VHXLOQ6FKF4oqHG30CufbhPu0KHmOAPOcKdwNb61GKpUHJF8P+lyxG+vmQip?=
 =?us-ascii?Q?mu9MvbU4Kch+emUiCZDrdSK3ASfqprSj0APqNMEWS404G6bahhvoXMWmcZ+b?=
 =?us-ascii?Q?w1848nbkd/ywdIUwcm/+bZVOPfBc8jk1mL7Os/6IRcLCwkW6a6+wvGhyXRG/?=
 =?us-ascii?Q?T3iZpApi/8eAsKtKEBqrLPFtb7T2yTnKvYD+OiRuKZ0oA7iBBhv+jRE5PZrh?=
 =?us-ascii?Q?HHidkyQSBlK1SyW1gWl9qpdz50B9BmF4UBCst0A46Tc0sLixc35idf+7ndnG?=
 =?us-ascii?Q?0QH3RUpAWq50CRH/5Mzb5cBQWCOJJTSi4kPCvxNFKFfYmMXyRs4zUsopPTOX?=
 =?us-ascii?Q?kuQVF2PzqdECGBlYH37BCiUcG7INHDNPfEMpKbe69cXb9FSAdkT9uC5iosbA?=
 =?us-ascii?Q?LrZFBk6CAG2R2/6P1j/zAau9HIV+D8sNeZYqG8SysvyTSFp3FApsWhIfyskP?=
 =?us-ascii?Q?MRxsEe15dxY585vhsxjMByjbE0JS4nKtOVPBU6mNos35mVZ9b7cJQZ3D0XB7?=
 =?us-ascii?Q?M9IWRMDUmlG7PXO5iZm9tbZbgxPpcrZU04Lyg9ud7jB6fKU42d2tHX2O5AG5?=
 =?us-ascii?Q?nPlt3OTF1CbGcdS+k1MAXB674vb7j7sQqfpQogy9KLUPec4gwbRaNNFqfaKU?=
 =?us-ascii?Q?TUQyPIMAoFnIJf0yDmVUtWFGXKHVEUOVKvXtoBLvcBB6SWmxHGCAaei7ijkN?=
 =?us-ascii?Q?66/pxHTI//I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rh/Qy+vhGxBPZnrPXTsZ5QqJhz95ONIQ/eAZr2w31Nip00WYjxWDUIJuKn+J?=
 =?us-ascii?Q?kUlGfLvlrhjIIunQgQuPiT0NqKcEJBK3WqHiGEVtHodtkMKDT6x5qg0NvoJT?=
 =?us-ascii?Q?PqKKDc4edwfmX6nV8awNakn5rRlhUBKTTtBT7chqVcXTVBoLuP+7Uc7/xoJ+?=
 =?us-ascii?Q?3dLTB+D1GJWDOXhvyYApodJsb8XZNAevxxpQ8mACGZH4Udqj1Tt36KsXS2ou?=
 =?us-ascii?Q?KfvBE3wOqD5xSPQmonPwU8w/GxMkHYjMBBpfSB8T8nitUvR+dcrLks2/Yd3y?=
 =?us-ascii?Q?4h45XggDjkuRBp7gOGYa9pZA5wRamA8phxJFWItjOOTI0J5hwFlYBTlNFJ5r?=
 =?us-ascii?Q?pZBgJs7XwzCjcFoP1rjKy3NGfKjRTEeFH77z9aLd/jXQtzfAKyR3k3isIAVL?=
 =?us-ascii?Q?yyP1tlfpH/rrzp/s7ItHYOh0x79O7RaLpO/ooQggfzXvn0fGgXcF5eBSRoV2?=
 =?us-ascii?Q?jHbE6m88Hb66b/sKZXHiDsVnpt1QSY/lu5Xnp1Cu+Bb1HNA/cpiUkmwdnu67?=
 =?us-ascii?Q?amEJk/Z35cu6uAQWjS6cubaWpWZbENmNQlE+CaHiM/Xi8F7yikjdxzjgBca7?=
 =?us-ascii?Q?MV19LEg6hXAgx2qlmGKCfa1cTT7iwU3VMF8HxmfX9u4Y6r/lwkMHWh8tnZw3?=
 =?us-ascii?Q?cBwT9jstsGRLfO7l6GethoJMzHOWxeSU7b/5Vgp1mOcdO3iyjqdCYkYojNMD?=
 =?us-ascii?Q?TmGNN5H4+Ly6V6Fx//LnSdmv80fsn+Hav/Nk09bbCu8odgpUiOniaNc/dPXc?=
 =?us-ascii?Q?z2pky/wvDGD7P0SvU9lY+P9uau+6izdXqpanbVwCcesboIBvBEoUyJPnpBSo?=
 =?us-ascii?Q?NIQqc/5Zliq8Eh15UgJKEH7sWCGqipeQNV6IhQhyDpWGdRFWBmFcqCvaXs5t?=
 =?us-ascii?Q?Cnql6TNqqbkj48BarqBs/mnfFpfIR3ET2kJoLkbAquBv65Yz4zTnp/ZciBfM?=
 =?us-ascii?Q?GF5Q/+0HvJcOh7/1p14DypCFRIZtO2QpNscbnEqeaFSCyg6hG3poLCnhyljn?=
 =?us-ascii?Q?UL6IgIfbepN/NmrE//AIP2FQia5WYzW6+AVM7Ue8jOjQBhbPQm4F6zOntjdb?=
 =?us-ascii?Q?Et06jDJF4LEO42bpo8o4EdbibIfkOeVESMLy0UoLCWfy5vVtb1TGgbmz7bmF?=
 =?us-ascii?Q?6qxwiijNeGvYqTKT4MWAbv6bH+ZR5/GorIaU1JgDyOemwawt0rNYN4KU6DMq?=
 =?us-ascii?Q?SCGvhZ0vk6AZ6hI6ZzYmJQ5JnxWWMq7UjzRBqsd40kBEMwHQ9E97m1XHUlkr?=
 =?us-ascii?Q?BQQedHzmzVpO8H+sKtq3YvOco/GEJES13w2qKKZnFiKSbeN9SGM27ob+95OH?=
 =?us-ascii?Q?P8COuxOXAyXsCx22NG0mXpEkBLXJWeTFyBbKEsO5Xl6xHOE9pBGnJ/rjYc1a?=
 =?us-ascii?Q?V30440zGTLiAmzxIupVGoV92fi2ivlytYa4dIfSCpWY8DCzW3spjtHEL/2qp?=
 =?us-ascii?Q?W0Uv0bAuOLgFdY9fOA13CAILGXACUTMHpwCmuvOOB0qRpCy5tJNw2tNF9+aq?=
 =?us-ascii?Q?rrHjMPv7g8R2EfrbW30D6Lmsh0Uw95TfcTa1ZiPAYZIxOE6Uui2X+X81E8ag?=
 =?us-ascii?Q?j+WzF3wqIMNG42WVuox5+2xZAZUAcz6GxvwMT0EO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xKQx0zhugkguVHgga7eifUaRINhQzvt2+00KU2C+4w+LvaQ2Zlh5BVy09C2GLADOw7Hk+Aw3+PdXgRPAD+B3rhVvxChGJQQY0KYqwGMOuEFgMzEtu+0CCTqDA9g8TKquStBK9RW0SoXIxjbQx/NXsnJvJOLVKk3aLJGt88Gz6X6tH6IXDKBThDewPR/K3mYJQhfCZUVwwuTUyCrRlEEKJcnZrAlYtMIBoOn2xedImTLq0jcv1oTlISs+6wQY4vr5PWHtGZtKKZnLRPMaxHQOdqDbpyqozJnJfLBK/Ad2LcqqWQAaZFUjdQhwVv7Sa3Z7n6quPCl/mL0wcrU3Q3KqRvxFFJI2B8BAJPVv3LFh7NivvpgcjtaXFMyrN52MYMvRX8qc6LYNJPyTe5ojJlRL9e9HffJx/63g+10U2+rHU6IS+8uXxc1/M+mii2y3NQ1v/Koq9f4dHBkaaFHjKXHw3fK4QHE6pU6M20IQzqwmUhBsWmFLqYpT1ySbnh1dhgIhY0iR9RAAciQP/EkeDfIy8wnEn0GJGgV9IgQitNr/DRVUbXuN/2SPhLHELjVplqBD38kWevg0p2PA+ESYfavaViDUvRRNHkVXDFudRwQ/uhM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dc40c4-5bd5-4654-5be7-08ddb39fb84c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:13.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjvfzDpcKkP3ia5UATSgyzOx3WUGo3D3TetxQH0L83p5OeOHkfOyOT+EP1rl+WCeh0mmK0zzUuo9tVzK1/jYzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685b7940 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=8BYCmc0dCO9CqidnpmwA:9
X-Proofpoint-ORIG-GUID: QahX_apBWZVfqXDeYYL0-gzIRQqAncGb
X-Proofpoint-GUID: QahX_apBWZVfqXDeYYL0-gzIRQqAncGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfXxPGf4pm8ySmb +TmJdoiGbHsk3b8PmwFeTfJSSBchVIb4cyoDSbiILf6jOy4HYqueYcFjIkS2buf++ODRuNy0HNR fvGdlynwss3vThhpbBUzi4hy/5dejMSE7b71cnnHUbaqK6zzMXbICdp2HXrtbJxfYxzAj6NNrVO
 +4WJk7illi8p0te60GpBqvC1/pljnTa5CuqpfG4Mbe3/BQkr9HMZUqKPNYLuXkvRC1Mix/B58+J WMOuR89avwSXDfZqh3+Y3LhqockwEdQvGDcAH6DvXuTrC03XoT/YQ2vG/IQvh5e/7EdTLmlGxYQ 07tW3Udimr5Txd3m5OSp9st5U4hC2/xTHVDz+hJUwIR/appvrk0erp5oBlowTgYGK9jaBI258lF
 sDfyCLVehQj0iS0G3fE1GYfB2Emp039Im6CYHka7flt2kWjr1bWxUXxPKl9bTOAwpQBSJKBC

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/sched/tst.stackdepth.d | 1 -
 1 file changed, 1 deletion(-)

diff --git a/test/unittest/sched/tst.stackdepth.d b/test/unittest/sched/tst.stackdepth.d
index 02a878bea..e6ffca01c 100644
--- a/test/unittest/sched/tst.stackdepth.d
+++ b/test/unittest/sched/tst.stackdepth.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@tags: unstable */
 
 #pragma D option switchrate=100hz
 
-- 
2.43.5

