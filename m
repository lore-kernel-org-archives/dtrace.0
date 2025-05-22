Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F291BC58
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936921; cv=fail; b=Nd+LsuY4X39owQ0VWJBYYxVysVMS1yCDSMoyedvAsiNV69gC48sSe4RcmXOjY/ENvLOstLAfBNh8lsxhfDUKuc26PwnfoHd0l1k04e+acfSRiPVRQhikOyglpyuXhTfCnXFt+aIPXAO+tGZolpZOV+hMnrASsZTcTOVpRgjwagQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936921; c=relaxed/simple;
	bh=i+YsOFcROUAEu42hQS1XWy2QMVGkwJABvJrH7CqGdMw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gurOONjtBKDULx14isfaNixa72phGQNZP8nwhgFLzdKEEF4FdyCy4qsDqHYj5w0Tw2sAia49kWJzObPgLNVShnPnkCxy7HFuUYy4Mo3pejDoyji9g5gfoxDjFZPqQe1md7Mupv9pH7QMXuFEID8J+O5H8pwpzYed9NFD8cA0fi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DU6SvNnl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fvFl6KNa; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DU6SvNnl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fvFl6KNa"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH13ro015388
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Yow1oU/mFK0ovIo1ji
	L5T4v56U4ocvIau2saf6JWmsk=; b=DU6SvNnlrP3aQEJGKkzd1dWeecFkeUzANK
	4aCQ5TcsX3rHedIsEPbV7MmyWuFY172+ZLh4YSmnGw9+EtVF6o528PtgjQqEAMT/
	uvq4qyB3tiWh3VXdzNkpyQaGpes3Yhf3tHepw3yw7I7KfFdnNyxc7NTmYu4fSJBx
	bM5+x6/fAworlIyzJO+jEWaH+SFNW1hsRQZJESnK2Hs/l3iSMnaotqFSyVJSPUS0
	LOrACDZdNo/H2LVut+Fpd682CE1atc1spvxLbp6pG+0WPczyQVVdyMF+GXC4k+t5
	gLDl+JE8UGKP76d8tSYBwkjQfD/hd51RN0oAKQy0LRMFZjZvUOsA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t7838a03-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGplde020290
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:57 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwevgj28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPbYxn8gR/xRZN4wENvjIszCUhW4LvIGdcj6VFl1Rw0xkE/20U2XBHogD7HdaTt8fHrs3KgTZDIpkIPG9LfmX/aPMReA6LBpH1kA+ZV1aDvhGx5jiCo48WExpP+kuyz2/BQw0rwdfivmDif/tPsl8QJac46VfpZ/hA6XB+eTvpDTMNGkGMkQ35ZJtF02uQ5D1mQI6gnfIRJtYRL0RSJIX/E0hRs3djoYJ2tpKYseZ2E+aqXfES3FTj8bqZqVfIJQ3pGq8PFdxj3YuG3NpS3iBafReXQgH05WN7ZXuObYxJgvJDhcFXEsysT19jPu+sxp5ChPvff0WrfvT+kE1fv71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yow1oU/mFK0ovIo1jiL5T4v56U4ocvIau2saf6JWmsk=;
 b=FtggmsY6xo8Fw9lGaei9UQkdccSSl5evGY278uA93wYhbvRezDvQM2kpteO8MX5/TqG8cmyys8rT+uLTVsClo/5vLKelvYPtixDflTVHtrHKLu0xxgCyOzMLaN28K+hW4ooUrm6CGnz6EmdT+yGoLCpGBW42OaonJEL5zl/RUBXeKWhYug+ViYEXNTO4twr6HrzD+2Es/BaA1xQ2jO2aKYjD6f/gvG+8iHfwY5sjhbSK3bOuwqSnXhbwDYrOha2TmsJMXG5BlhU6y4eDt5289HwZvMV/dXM9kvmCdJjSLCx4+hD6b5bl3wlhwM8eNEH6eD8NitDmWjj2uA0QIkF+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yow1oU/mFK0ovIo1jiL5T4v56U4ocvIau2saf6JWmsk=;
 b=fvFl6KNal+2VLF0ZX1ggMPhqJL+cFx1xA+qRwoVmHmjjx3tstxJNsw1zic+gtYZxi+V4cA673fXnKPt0vzVXK8/qqve0qKOsoLozFvuJOw9k/konACCRPuo/stStW3CPiEWgVt6sKtwMKF5bH2iDINXA54kvtwO7sEcnTn73aGo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4758.namprd10.prod.outlook.com (2603:10b6:510:3c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 18:01:52 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/14] Test: caller and stackdepth tests for sched provider
Date: Thu, 22 May 2025 14:01:14 -0400
Message-Id: <20250522180118.27343-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:408:142::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4d3f8b-3dd3-46f7-9210-08dd995abb05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P65N1R7nV2W5xPrkRZpQF3ES5U3REwl20wGXbZs5q8ctizTiLjoHXhNgL/JK?=
 =?us-ascii?Q?Z4zNmCZUZ3ZGd92INZ5XKOgg0OoPAfZpa4BFsLatl0vb/oWSK31zu0VaAML8?=
 =?us-ascii?Q?/ZEX03khi3SHp/07Yh3fFxfbsRLJ6tVBMDk4TXDSbkZFpvdA0HlaKKAuhooM?=
 =?us-ascii?Q?omUDGtO18PuPNqGE0KXyh1x9tpFbCB9KLuOuh2poXKUjZ/PqCaiiqqmGeE/R?=
 =?us-ascii?Q?Sb5BmHP4YDuKv6bxqPK/dA6quONxe2X82zhZDaJ4gQCHmqFLYw+z9BY8TWRn?=
 =?us-ascii?Q?lYnYp1aQDaMEscOtomGti/crN3RbRjVAVBlzTm5jlFMLw7St0iHYjYA+fufQ?=
 =?us-ascii?Q?4Txe0SNxcDWyNDh+i08Ky2Qv/dJowPpC0A4preYJdGL90hk6PvKUSAcyJJ3Y?=
 =?us-ascii?Q?NwDosmWdmYALFnaVf0ZQZ5mLjT/c9cw1+3uAY6hfGcEZKESQWzdIk+jwqy46?=
 =?us-ascii?Q?S/Bsdl3DRtN+xLG/AABRnQcp6yqpn56kCCW7XDkFUnbtOwzg0MwcGPJ7A736?=
 =?us-ascii?Q?KiDlrfK9Lm+RP9/2lFRcWC8kjlzTlnsu/oJGJcurYHdsXxT0NRzHjFILFPrJ?=
 =?us-ascii?Q?zqUVhZ/IWOA+STNuYP69fIx85oZdLgLcPBD/S7G2b19v8ZO13O6q9ZOSzZ3/?=
 =?us-ascii?Q?ZxJgFTRr2/g4vJGMf+bqCsoPSRcTlhA+NQsN74PEIOLiaZOBj9xIvd7E/UUf?=
 =?us-ascii?Q?jiPlnup+dyXPA3pZPdW9ymwQMl/dEdhbAq9FqaDSO1QeuHoXm3vtIMCNpV7t?=
 =?us-ascii?Q?otuiix0fPWCGX8LIFluE/+l3+iFgExV+hAQlCdHHdr2EToK50leWBCWPWiMl?=
 =?us-ascii?Q?IVJOKc4TREWaj+s4YxBnL6Mx8/f89jLXZ62waMWgVN/sZsScvLKljgNwuZFS?=
 =?us-ascii?Q?TMz+ptw6ofWFKkkcpZde3uodGNOiik64sCgJTNN9G96vab8h2jN/5+MZegwd?=
 =?us-ascii?Q?B0BHIayHBLi29hoTWI5MkGBP2BSTOn87h9CgZ8qN4/89rkLfR6Ro12Qor2tt?=
 =?us-ascii?Q?ZlPNVmQr3CrhCu8wxuHM00nJ4VwmrRPSFidBURxy1ADBqkXLTtiTn2dUObnc?=
 =?us-ascii?Q?eAS0cImGN2ByQUHEnfSE8tE97b9BWu9pvXnyG8g/GX1GsqQT7GbQtbgIAccI?=
 =?us-ascii?Q?L3DJo2Wv7XTyJOC/qlctG7HiG9L+nreAZ4+iQBpsmUWa59hIIBHFgPnc57pN?=
 =?us-ascii?Q?BpQt7UcbohjMIRDov6qt6+RmKxt17UAUCVS08Z4nMU70ucCvjZrIfd2lyInp?=
 =?us-ascii?Q?bhri9BSG87WusgZv46eeRLIwpddj5BpV/zRWtd/T9GHm9TZDyQKsD40E32gj?=
 =?us-ascii?Q?RX1dksM9ap6bI9RlwXIMVTwNjGUhdjYVtxl6ahn45dotWMMqjYdzUceNa8/n?=
 =?us-ascii?Q?fqJje4+msvIHvZ1NCH3XukPiZhY5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RoX/sCGk/PCuWoUxYdDU1RP0xxpSTsvvqg7pR5fx4rnsbUTAhtIdw7cuLfQx?=
 =?us-ascii?Q?W8nMix+budYTzfksUkudwd8uyyIZrWW9CALvd6SR8tZAmFe6nITy2WjC17be?=
 =?us-ascii?Q?CiSVdIHwNXdgEMLCkSuFKU/xoseJHglPQcWqksF6gjx7XUgkaUncddF2FXaG?=
 =?us-ascii?Q?D9+7fhR4/4r1yimTlNtwtFaEO8aHpSKsLNzM/vLmZU4BG/6f/1Gg5YMb1bLZ?=
 =?us-ascii?Q?BfQ9LiryImXzTzggdVNV81h0uwN3DqWPay4KzEYujqfL08HU5g0mbUggmF0v?=
 =?us-ascii?Q?7ikUBMUfyNFpDPUboU7QjVL/N28C+wBMYQ4Py8+UqogBvJ0vsKwmVGF+pdFP?=
 =?us-ascii?Q?jfdfJIFxFEUYEtc9t2GfVft1ADs9f85SS1oKx55sx0KzNgMnGHvHsMg+huF0?=
 =?us-ascii?Q?OyjUzTRumn44YdvXsMBLasmcLYTSK0yHc3tNr/O5Avb+JTClQtqIygG6fsW2?=
 =?us-ascii?Q?fE/i4NPWZ287KZ6kTNPSsx710mtyG/uWWpUtb5wUVI0/HxW1yGb2rgCXcVkL?=
 =?us-ascii?Q?NVdNmCkmd8ufr/0P+7WGPgePcduMqwx2GfLmEnPAM9LMlon0HZqNhjRMcqtl?=
 =?us-ascii?Q?Vujsw2L4383mzbImMJZctrIz1DVXUXK5tN61JAkyUW/24CCsz9pmB4jHIXyk?=
 =?us-ascii?Q?DqAXWOgUzZRMxap1pcshhqVumwMgguJ5MVTKn+P9Q9VYJlTvNyGKGf3pedyT?=
 =?us-ascii?Q?wOrdIbb7CUENdqb6VjqAXustcrkeqWF7698prKRr+JFtxU9LCGCAErBzCsuJ?=
 =?us-ascii?Q?33ZZfzgVIeZLFNW5TIbpklAIhXsj7fSzwUddgIWnELlCr7mq+Qgo5ij9CsF4?=
 =?us-ascii?Q?Y8vwQUVAry6UlsX8ZtGNDCKVgBBDHILNZpkY/p3muFKXN321HUGBV50i6Cdl?=
 =?us-ascii?Q?K7Dyk6iNPZ+cnA/fq6e0Neq7IJKPLQQ7J8xZ0h7fLl114jMaLTMdgKUAmDw3?=
 =?us-ascii?Q?1tksx74j6NKqjG70u2TkHxMnadR8Tu8nxMfb+1N6kS1hpzHBpmwDwZhihEsR?=
 =?us-ascii?Q?o55qGoZtwbvYph+yP0r4d0lzWIQjjqHzZtSp/O7dzPm20Mw1NXqvHOobxleJ?=
 =?us-ascii?Q?WxulBb9KEXoMp/K67ZP7ZPHUnCQeB4NjymDmpkmsod453ZSF1gCMvWiN9Ckv?=
 =?us-ascii?Q?GHchWqwqp7n01t5bzDVlKDtfQpKoBcywPylK5isQUkuwswa5EVEH1JzrFIuo?=
 =?us-ascii?Q?HlJytzBOPV99psZV6yKGVEhS4xipZ0tVA4mXLvBQ4BwVz5FJwgjEM6MN/JrU?=
 =?us-ascii?Q?TPqcA7/gWzbx6kXxlj4v1WbPgSijz0B0HMQ/CnM8vz+/6S/P+x07byEQBvs/?=
 =?us-ascii?Q?ofATGCIelVch2ZHb0tbEY0+xBklnVsXPLjpqILuo+dl5sngX5z/aGLvQHN1q?=
 =?us-ascii?Q?n76jJvkeLz/Ve1YIw2vFsQgDb6xdneqAQaXxdAT8qNtUWION0XCLYGDVH4Fa?=
 =?us-ascii?Q?OH2aqLu3OlKvJdqjmfWmPKySz9ClKpXcrX3WV/oWt77HYuNFZgOFZNcbyJq2?=
 =?us-ascii?Q?MCRqYOeJwarZT6jn4Aow18/IBgke9yKLkeeI2IQozc/Ubr8/F5rPk6Osu018?=
 =?us-ascii?Q?sPHP8jFIGzUDfPH1+Md1o2P579ynw4A06P+WG7br?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cafilR+SVgQqRawqoAIFI8CVWYlHdpL/91HGBPvoPGxCPxRQZXPuBuUnAI/LENpmPWNPNGLz4AppA28oOEOVfAw04Fzq8DIiTjFxOpMBpyMuAc8370BypNQzsWvb4IufswSKS8nsePwGhz/zbVMH8nfMSZrOXzodZU6Cn90aoURvuQl6zqs1A6O5PLEg4k40lzxD9AA2x6ESCdmwfAYBHq95/ygRfSQV3jAMD3a3Q6HTKev3O2uClFh4M47n6Gjh8BDRUd+zHVTkR/1sHiM9Rjz5Jwi0zj4B/8qZVsDjtqASUPS8XCt+qU8X1OBlt5cg+VGv7HTtwOKiItLrMPKJmFsIN/lrf6+CVcISJQ2DkFEqEqZ+vdQA/XqC/7yTw/fiG49QQ/NTvix2lkiRMCkiseyFjUAIbNMpF67QWbbT+sz60DG2X7NnibDaypP3X5M4DPBmycCFFIkqm31Vre6+YfQQ4V6/fWIs2rKczP2q59knpBaVc/4ZIKu2rBi3ArGh/wnznWuwK2AYUYl3/k/3CvJRpkCAtTnJgvJbtOstiOGDlNhLfAEw9IXp8q2aQzY83368HjQbeuvCNvdh3PSuA3NIqMRgID7E4enJ4bhCosI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4d3f8b-3dd3-46f7-9210-08dd995abb05
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:52.2227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sm7v9HYfecM7DeMnFHAJ7BOOA+vKvVg5qgGr4IabyO2g+wt00Q7OJo8iQvUqlsM5ziivu74Avz4JBIRE75ClRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4758
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MSBTYWx0ZWRfXy9j5oVpIHBP4 CAi+yFssEDdpSkuycqsnnyAQ+pTRXy+T+9f0s9M+pVdTLntRy2ZksXe1+vtKeo/PrGzabyvE7u+ QV9/DIQ8jujkOl5KJ02uXSeSLmaMHRqKuEZOTbbvzCgeNai2tsiKvF6iXkK9AO2lUDUgWJoreBM
 DpZh4IvvJhBbGTMtRNT8YPsWizIHsDu5Yz2Cv3dIgJvDUJ783SD6PaUtbSZMtupGv14LHYnqxfC 5JuPrlvbpaRlqqA8eDdiw5v3BUSIZnT7LP2Z4K5Ye9pocyEuWn/Xh7m7F2mOgh/mCvPFYwTNcxt esciY3RpX4dSLqVY320PjUQZ5HJoW4iEkbmHc+NOEFHThfLJvKVREQ5Mk/rKrpplyiOFhX4nz30
 dZgPKOokUBo+k9AbxmhXFlxjb4pp/b0xX+KWq2IRJyrWl+R2v2xXSMeMcDf4h6kxbvaQ+/XR
X-Proofpoint-ORIG-GUID: zxxeH2HbrBNH-PviJI2-wW57C9pAAYYn
X-Proofpoint-GUID: zxxeH2HbrBNH-PviJI2-wW57C9pAAYYn
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f6697 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9 cc=ntf awl=host:13207

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../variables/bvar/tst.caller-sched.d         | 31 +++++++++++++++++
 .../variables/bvar/tst.caller-sched.r         |  1 +
 .../variables/bvar/tst.caller-sched.r.p       |  1 +
 .../variables/bvar/tst.stackdepth-sched.d     | 33 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-sched.r     |  1 +
 .../variables/bvar/tst.stackdepth-sched.r.p   |  1 +
 6 files changed, 68 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-sched.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-sched.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-sched.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-sched.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-sched.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-sched.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-sched.d b/test/unittest/variables/bvar/tst.caller-sched.d
new file mode 100644
index 000000000..087571531
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-sched.d
@@ -0,0 +1,31 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+sched:::dequeue,
+sched:::enqueue,
+sched:::tick
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-sched.r b/test/unittest/variables/bvar/tst.caller-sched.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-sched.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-sched.r.p b/test/unittest/variables/bvar/tst.caller-sched.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-sched.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-sched.d b/test/unittest/variables/bvar/tst.stackdepth-sched.d
new file mode 100644
index 000000000..d3e9e18d5
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-sched.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+
+/*
+ * Some probes are implemented in terms of rawtp probes.  Avoid them
+ * due to stack-skip issues on older kernels.
+ */
+sched:::dequeue,
+sched:::enqueue,
+sched:::tick
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-sched.r b/test/unittest/variables/bvar/tst.stackdepth-sched.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-sched.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-sched.r.p b/test/unittest/variables/bvar/tst.stackdepth-sched.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-sched.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

