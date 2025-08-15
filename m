Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EED62C0F91
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755271566; cv=fail; b=i9cOp9+3d7b2eTCphllSZAwIWb3nwNdGrs7ZCFvMdRfDjnluhhwKw49YabxWcFQnGpaXqiF9ya+CT5bE9kZx3ahZbJpN3CqkaFE/Uq8E9H/orQ4lEwWDiYd78J5rrIw8ACp1/ncp58oMNUePU++2z+vQJBYie2m4lD5HM2rm1+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755271566; c=relaxed/simple;
	bh=WmfDdjfzAfto0LkH6KkMK09H0aiHclGLd7vp9cMixCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gvWKo9atbVOaifMk+4vfwzYIuBvCsHRvH+toKXTvq3ksAW1TsW6kV+KOqRfJHG+hNscB263LJTFjkj51yTsH6YyGQquRx3z9WtQ8fbQIGoz2yC7wOx+kvX1GILqwYzhaEWffhYPsvvz39rg1rFfMIjkbvz95KF7ScC+gTleeKBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rbM6232W; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fUzrurtO; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rbM6232W";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fUzrurtO"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDN4FS014896
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GGf5YIROKVymguNgbg
	sJ/W9Zbag/7GqkR5qMO3E6sPE=; b=rbM6232Wu05awgi4Vvh3dcw6C0UKDaEu/b
	lxWEPhQyy/ICPXQ402OutkTWIj2QLqC19ttXojlZNuZUI1A0/EcZq0dJUl0yM+nv
	7/Z91nGh85Sj5EI1zC5soloFh0NDS812JBLzMkGM4tzxNndBTzNg65dsNoaumLrV
	XkojaoUplrx/LwennhvPwNe+b0SWMNUWoek37M7xHSLMwPpGAL7G0NZA8WOQyTac
	y4IXaS8jCqz0OsxaLiyaCzyjTzyHP+EHH+VGITpj472SF4DFeTiZQm4g1SIEbAji
	I0eQcGMog8NwQFR6FAI080QWnvWPWpfpWAj1ll2L1IRIsXRukW3A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4m5mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:26:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDra4o038637
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:25:51 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsmnjwj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:25:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHZSQRRtKf03jrLDv4R+jeP+IvYkdvLk72mjvwJTzPr0nlELdKWMviceQEHofGrjmm0ElvCOKrPJr7lrRj89eC7pBazUzqZHULtJp5/IT9MrRJXpX2+6dUxWaLD5sUwuYrs39FqcnekgLA1qNPUlJrsKJPpds1H7kxi2liiTsJYW26i53jR5iftbESHNWijQxodhyvm+z8Xc6A+jd5LAeOuOXdRskPzMk+u4wCavAZxdQnKJ9b6U4O60iN9AH5gw/LmIVbcYSp90AsQglJ8W+Km9eteWYk2Z3CwSSft7oVVamyhvaGH/oaz+TPgtv330GZb91ZwrI4z5ASD5CmyBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGf5YIROKVymguNgbgsJ/W9Zbag/7GqkR5qMO3E6sPE=;
 b=ANnPgh0/jXsSzCRksICsdmxLtf4uZs9xLwRijPxcYv9fSKb1g8Si8rmEpMfvYiHFDSyfUOj3FLnLwXC4QjVj6eqZZZlEFW1Kx5kkUsOLI1E3HBm0Z0uvZ+ePlL3wgBlWeLw717LvTTW0rySCbHWjdroTb8dPR6ZF+POkcmZBCx/al1WKEwvX5fcXV7lSu2S44tuO/sOxnjpRhXIFcK8/jjXNJcJaP1+H/T2wd43XC4alV+Zrfo9/iGV+GW0bUI7v0ngZfLRhFvmICxCyCyZnJxo+2IDwwCvX7rsXnuRSKojhB5a5w/qCbo8zz5dD+rMyvv6/qkaXAAfiwNB4xOHx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGf5YIROKVymguNgbgsJ/W9Zbag/7GqkR5qMO3E6sPE=;
 b=fUzrurtOH9bSPBwwTdRMhF+YAJY6Bv5LqWiU1taBfr8lS8bjB5EG8PO+7LLXeJpe0FHc2twGGuoiihN74M7YdsrIj7gpAb6WfRRJYQJM5Ix6IdZ0Nc53rJjBjFtiunebTG98T2jfzPZcbuKffsyJprTBUJnbu+Z6WI/lU488/fM=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV8PR10MB7751.namprd10.prod.outlook.com (2603:10b6:408:1e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 15:25:47 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 15:25:47 +0000
Date: Fri, 15 Aug 2025 11:25:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Possible uninitialized 'last' variable in
 usdt_copyin_data()
Message-ID: <aJ9ReKhdRvtPBhuC@oracle.com>
References: <20250812224606.16606-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812224606.16606-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV8PR10MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e072937-33c8-4fa1-befa-08dddc100278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EyLQ6+p0I+WVCeLPfJxDHXFgWnylie99gHCb2Y7lh3fjEqlhrCvNBHlPouzj?=
 =?us-ascii?Q?OfJ0nZ4Pm5Y0E9NNPAZ/QRODh2GUpC50aXvmlWYfSYhC0ffMBMNoafpwT906?=
 =?us-ascii?Q?s9PBAHBwuvs/Sla5axHrHz/EmIoPd2xvD9sB5rqwI577gNLHy2q5RR0cIYmO?=
 =?us-ascii?Q?+oAtt0C8dYLKx9fhYmCabc9ucRTedJSV7TIz2+oMzgLg3ws/pjlB8SrQa5S0?=
 =?us-ascii?Q?GfX+yIF/l0C9Syu0Pr60qRIENy/U0RKySbQ0FBiLZRzr3S7RJnfhH8/KA4Fy?=
 =?us-ascii?Q?5i7gWAN4FXs6Ll/NB3FsmtGm6M6ilGJetOkOEw+kETDwN997+iuAOqE2lTe7?=
 =?us-ascii?Q?xBRUtWa7AAK2fj00CI4p+cx/eARYNomwyHGvWL6DwucnF4qi7+eL7gLX7EtR?=
 =?us-ascii?Q?ZQJ9ihG6+2KeBI5c/7p3GfS+xivFsQGNHd4KomyH3bMjDzFkchbIJNe/QDru?=
 =?us-ascii?Q?xNKsmPUyNxG+XAmHfopkzFdEAB9RjjnySmhGirS2+nIdo5pLF3whgNdzH6KC?=
 =?us-ascii?Q?S2eghqCTsPOr8dlqmcNWrGW+9pxPSpxWZ/97e/O6qzhmfJGcbPHOITQjc8C6?=
 =?us-ascii?Q?p5weziJQLS7eCW4637xsFaZYT2RPcRCRK6nFKFHTgfU+xRS7gw9jCcZPBiBW?=
 =?us-ascii?Q?jr6RvYG9FTdqiaAfOVgBYbA1q0xdMT9M69AqflR11QbTPYOHFp8SE6jb/A7C?=
 =?us-ascii?Q?xGGRbvbfsjfEXDyTwXB8gSN78VYb66QhIhPK09/eX27G0wuFgx7cZjNfODRs?=
 =?us-ascii?Q?b0H/Ed5JHyFHxpFV6zgpGzDtqydOQDQ96BwTnnriXkgUj5WZ0zna1sld6ugP?=
 =?us-ascii?Q?pKOJHjg81j6RZeSanYQYVefR/twKs/3cKYP3rLHwuUZoOwZ+wYkxuEG/xhBG?=
 =?us-ascii?Q?otT6oTGxtOpBx7bnxr+Z2X415ZU6fDw7gm7FBqVHrTwnZaqP6xacCBgkoynf?=
 =?us-ascii?Q?vQXpE8k7dUpAyXjcy/coUIVLM7QlFtheLmy5ijTeBO+WkeIR4dHI/4IFzFSu?=
 =?us-ascii?Q?zEfVZz+iaS9/J8339DL1XCp6kkCuEZ6FWgGUY53WVoSiWwJrGPytpS3NRT6r?=
 =?us-ascii?Q?swAmNlL6z9B3THk9ofjDoVv31/Qt8tJTQgwkYZq4xPnAh7Hpo7PfA5mv1h/A?=
 =?us-ascii?Q?Jmx2pNx2NDCxczJMwDn90+YR9J8UtrffG+ZB4JnC6usoRYIcZ/LB931zpiL7?=
 =?us-ascii?Q?XqMHLSbHainEW0NbObCx7WN6OkxAco6k4O27dXEO4adshA4CEvw8VFIUIfvT?=
 =?us-ascii?Q?3pMqv2WWp7nzEAl4QIo5y1kJ3nkxzFWjqdgmUuDDOYxe8IXAKaEYhH3ziqkd?=
 =?us-ascii?Q?T3F0M81FgtXTA9jgWvwp+iZo4quqyVwaVkbgbsQ6a0fGf+F166zYv1mWNW2K?=
 =?us-ascii?Q?UFbjMIG3ZSpI93JdLRTO4092g1oDAkYWKPRpppT1Gsjx895kRdAm+wXMXk1T?=
 =?us-ascii?Q?v2vo9tfXMqQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pDkZ/5eZpqopVg2Y29xKaYibyyoKYxDsdC81hjDG9ufoJ2T9ZrweQ0eqYQVV?=
 =?us-ascii?Q?aLQW4fF8QNHV61I44hrXgnkky0IIfl7EQrB8YFMkAUjbCVyBqX8dukA5dyTB?=
 =?us-ascii?Q?swlHGK87yj7F78hdT+bcS622DFFVtjOEnLF42dUxX7ebfL9UETnKBNhSlorw?=
 =?us-ascii?Q?+KUE5rzHDhweRpnmg55ag+c5RL+6ZcxgDgDS7sY4G62DbuYp2NMa/EMbjcKK?=
 =?us-ascii?Q?ghPJ8bBytzSzdm2z+E7m0L3nxfkKVY0i5egFLJRBg5g64E5Rp5Jos/DtNYPs?=
 =?us-ascii?Q?iImknApPQsl54+Wb2L015tpVtQrYHCE2FKqfIeUfPc1Zp7x452H41iwGUTCJ?=
 =?us-ascii?Q?yVVNKAZIlR5UKn041SC30JH+HqLBiPG/jxEB/xGnA5ayYToW5wirQeNr7Bp7?=
 =?us-ascii?Q?X3f8iRRQsWjd4L32m7RBD3TTiecb+IvHF0nOp/Y2YfROzmrAU5iZTdLL+J+0?=
 =?us-ascii?Q?FC72IS5aPcoqU1iWSOyfFCNg/QdDevuFqYFyEvC6ek/7plKSh98VCOOCy1dQ?=
 =?us-ascii?Q?oxmv9RDTGNdpZr1/V4dztpEAS6QJMwvm9lIZUvoYxdsUp8Ihq1BBBLH72cSX?=
 =?us-ascii?Q?PWTDOzEAFUBTTlxFtqj6S+iZ7aMjyLdn10V5P23g8BPoAv0pRg+88yrjSfM3?=
 =?us-ascii?Q?bCt+t8/9XRAjEz5FkvQ464Twjf6+6PPByq/D8K22IKT/CUMdTDOJbwHNs7Yk?=
 =?us-ascii?Q?tr7Zu9s++x9bKEQ/hVsPshuotAAUWyplnoJ6CtF5B+iJEZJ1YQlQ0KEW97ln?=
 =?us-ascii?Q?2fUAVWOGLBMrARTiX1t+RTqVjhP7YIj5aA/Euu6kU9OenLmmDq6mXh3HUEFh?=
 =?us-ascii?Q?wwXNFsB7gi6WeJzy8RsvtxZn4R1+V0mHA5oaEa7hNJTQMYaq88AR7KmbblbZ?=
 =?us-ascii?Q?uUhnmGWl1t5iTbtjJMcKUXUqIFXGRQh5TTfuj5Trf79hOde/BtRpwRi65tYE?=
 =?us-ascii?Q?vKgjdPN6Mb23KUeWwuVnYLtSZ3n8gkgnV0+qHL2DkZzTiwxTxy5sVmRT4R+2?=
 =?us-ascii?Q?gT+xLm9LNhyDq4vs5/ns2hOl++TuDuXV8frEK5Mf0ASG+L/0GQMQ9hbq63BK?=
 =?us-ascii?Q?IRHsLnvMmMRJ/Z2NAyK5XICa/DYVOPHUnsOHdoQGZqe/vJ6FYoFHBGWzoiTI?=
 =?us-ascii?Q?2FPN2WfXX7CtNDoQIU/OPY/HEcZKmt4jHZ2II4VCbpe0VGwF8RV8OalXsHnp?=
 =?us-ascii?Q?tYnbNsnYM3nvPXWYp+EZdCb6HCc5IMW5tm0ybnJ2idLGLvO36/r0lZJBZejO?=
 =?us-ascii?Q?taXcawKfr8Sh0BceqDLzBBP4wBBQGtYx11SSP7lJRvbD6u31WJvnSOqwxXg1?=
 =?us-ascii?Q?7d33KtIjH5HKXZaYbSpyInGmL+qZ1m4kuHoc6IYIRxcG7CxXbjbWTfo+EB4D?=
 =?us-ascii?Q?PfrkohtJ57f2BiDdkjklZiNwHYhg3WbcLWuRNUurxI10U9ROjlpz8T0N5IjP?=
 =?us-ascii?Q?xjbvclfN2JlplD6tHOs1lLYq/z4G/29ui8uSoKVZNkhCgiajpavJcgfy9T6J?=
 =?us-ascii?Q?gRi4P9LWp0twZr8vwmUQwlabAb3KvupZfsdD0oxCG2hk0Hb+tcZl+mXyJZme?=
 =?us-ascii?Q?UgCmra2vA8cvW3tozUJXtjkfITlw2894ImUCLs8VIurm/gdsCCETdlNKQsxa?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1XWhggMZ1VAjRguD9hfKaI1/iBVTkrMHBg40vTY0l5YL0c/bXEFWR9B3ovW2rzhuy1BACLpdXmAGdJFIKdP+UtVy7A0LvDIwJpulHnQ1tYUWzVKxRBopJ/RxTr0gz0mephjU2Ce8IAdflbVHrojtEdM9xIeokReYNP+iq8RFU0GqbraC58EZQG63Jr/rOLLSAO78Y/SpmkWhnBrisgih4RVd3L0iG/CwFju5IE/r0+4juPQJDVFBNM4rWqMM9VDvwv5d6cGv66MDjbzLWhTDxnu5Lxj4BORxmKrCh8BV7ze31saxPBCUN1iAR/Amd0gPnMY5ToaS4Ro6BK411lT2DOS1JuFhmuFVOlwHO+PVB6lWONVcu69pTpGRtScDim3O6gkjS+Z0NvM6NXtJFJNAHbjndg8cFCOG8hRwr1eONm0SQwGJCuD4t8LgDvvTR3vR/05Cu7ucFnAC0vwZI+ZuykzpYOMwCGnxR91td3wLtFoCxwxc+P+ex+5q6t+3ymXplZ6KKTfadRHK097bwPI234L63Qm8fsoUTaPV1tl5/OeOp+ek7GnB/wB6e94VEWxSjOYsYZP9jm5tikUWdswQji4cG7JMde/MmcMLnmb8Mr4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e072937-33c8-4fa1-befa-08dddc100278
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 15:25:47.7256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJhejuUSgj9TXjRCvNNgYFIOHHhDpubB3HwhMKen7BOr/9y+JVZmJ8z09g5Xlg0YG+tXp4nAy+s+YsNALjqxk3ZvNC2pleiHN+0gPgDZ2Pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7751
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508150126
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDEyNyBTYWx0ZWRfX+cHQXOphVt8i
 gUlMSN9ATutKf/xWQaVHeLunal2BWXS27vwpbR3SPX7FIN1AcQMkMTogkrQPt8VrLhuRuG6aVqJ
 Pkeo0Ss+JyRN2Tw1gdoQOpMc7sFNPv7rWMnd9UMYjlASsffWnwqNH5Qu+2UhyfaTlYDSLbOs/UY
 XbsTZSk4739rgDQHGztl/ccdqlhAoWr4NnTFd2lY8Qo/Av/zA1G+iLzYtzUnIVVv0BQEhg5QFPg
 j4TCtbeWgSvT7rvj7vtxqfzu0vAa2utxRtRhTiYDKwtyIWrFkrW7v5n5bwBh4HxFZMWxAQoCFiT
 1macALhhr2IICaricEPuW1285hhydL5/0jpstOvH7u9Nvf3rIGDu4p9DK/uQOfYKY7lVxqlIRqc
 Q89LAh70fchZ63i1mlz8XpmPDE+ctuED2jsduIU6ip6U+1JcsAXlyfJqRu4YaGe/Hnv7c1ga
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689f518b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=3qKt4vmbRlU-4E5-cO0A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12070
X-Proofpoint-GUID: uakCCdSp93a5PBxXHjx0PSZL8FwSMz25
X-Proofpoint-ORIG-GUID: uakCCdSp93a5PBxXHjx0PSZL8FwSMz25

On Tue, Aug 12, 2025 at 06:46:05PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Some compilers warn:
> 
> libcommon/usdt_parser.c: In function ???usdt_copyin_data???:
> libcommon/usdt_parser.c:191:15: warning:
>    ???last??? may be used uninitialized in this function [-Wmaybe-uninitialized]
>     last->next = blk;
>     ~~~~~~~~~~~^~~~~
> 
> Change the "if" check to make it easier for compilers to recognize
> that "last" will be initialized (and non-NULL even!).

I disagree...  What compiler version reported this as a warning?  The warning
shows a limitation of the compiler to see that last can actually never be
used uninitialized.

I don't think we should make changes like these to accomodate compielrs that
are less advanced.  We generally expect systems to be updated to the most
recent version of packages so that would include the compiler.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libcommon/usdt_parser.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
> index 864198098..d8cb9b7ba 100644
> --- a/libcommon/usdt_parser.c
> +++ b/libcommon/usdt_parser.c
> @@ -163,7 +163,7 @@ usdt_destroy_data(usdt_data_t *data)
>  usdt_data_t *
>  usdt_copyin_data(int in, int out, int *ok)
>  {
> -	usdt_data_t *first = NULL, *last;
> +	usdt_data_t *first = NULL, *last = NULL;
>  	size_t cnt;
>  
>  	*ok = 1;
> @@ -185,7 +185,7 @@ usdt_copyin_data(int in, int out, int *ok)
>  		if ((blk = usdt_copyin_block(in, out, ok)) == NULL)
>  			goto err;
>  
> -		if (first == NULL)
> +		if (last == NULL)
>  			first = last = blk;
>  		else {
>  			last->next = blk;
> -- 
> 2.47.3
> 
