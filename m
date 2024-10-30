Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E6F1E5020
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290147; cv=fail; b=R7EvwdJZvQ8yxlPiB0mZsQqWAeLbUG04YxGZurHde3pV41a8wDG4pQLhgvIVOcFnmPpT5l5XNRcIEgcPI8x7cen67zfSszIi2jhKnCqxvKtDU+mv96L1gzmjH9hgsWyGkhvkXmW6iTovlwLaIOYjWrf26MjZ4yGmKGrx/w1baps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290147; c=relaxed/simple;
	bh=OTNIndPyJA+kgUVMbMoIbzFEXe7ZqU5zqJIDCj524+c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QA2l0+J6SxjB4K5d3s3jIFr/YycOoF7RDm8o6Uf2yDuf9HeYXTjdF7y3w5f1l4EsUj7fSfmv36kLSNl/DyBs20nk9iSSV1zAEp+JAvWLBvS+b5UPk8Lnkr49t5QHHMuNXGjdg8c3hfA5yMeJX/rTqAoudTRdXqBc86EJwnDPweM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mwLbF1Hl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Nf+aFsUT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mwLbF1Hl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Nf+aFsUT"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fgG0009026
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZCM3uTTXQ2ZCGK5qjfpMtiHy8tQe1kK4OgDMpUKsN98=; b=
	mwLbF1HlykGJKUyvEzocAGL822ffpH2qYHPDnYdkDywu/IYrVAalaBx9irnE1HsG
	FE3mag68d6WCSbeTrOKz4vzCilnJLkbR+t0n5JLFfqUZo2uylZf/DO3EW9k5qs30
	uQh4i/tCKXBY3W34qfvut5oYzHxRW/Jm+KC3FyZg/wQlaAelglojb5Rh7X9gWVSb
	NLVGdFDapbaLbLIYY7Eko/bjkUoWiWpKvUDR7CQsG3EG9vOAa8qfagzpKQfQY1nE
	zr4PX5Wv+dpYVlsl1nqrZJblIzeVbyQyPrdecf0bYfHjpDv4yCksY0urASwzz99H
	SEEiZ4KihgAtLs4v/zpUUw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxqu2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAFXG7011744
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnadx57m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH/trB7i9fbrfdblvlt+qJsTv7yB0MyY9idhmC0FdF8cHMu1MoiXzvqW6uzWVcZW4ILtLAjdvUgJp6DIiUF88C6Roi4K0QIXlJxy6wiG8N4gS2DBnRuo+flY8owS3CA8Xcvw29I+XkhPi1SYYbuKBVU1iLkJMdqvvn5fDqreqRG2hjDX5Cu7TEdxaAK2bfn+y4q7H/RDYueGkq4ZGJ7rXq6xbY5PzMtSh2MbqTh8hVPvB0hzGMufHqd5WtUprqGd6i2qSJAYQKDFnTt88Ufjg2SQvOEppWGvuMFW4SxaJmYTf0qXcPWMjbATeg+/xAid2ljX1eRHpmaCgDJ4214f6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCM3uTTXQ2ZCGK5qjfpMtiHy8tQe1kK4OgDMpUKsN98=;
 b=p0aKCtef5TwLJh4LtmwOOQL1HR6/r+QnIgeLmvREG8KWaDDvwkoJBJhLu01UkVLFBBl6BR5nVcc/VuVtEAH/uv5YwzIdRE7KEtKDw1qpyhnzlQi9El1BI7IIJ3xi5TezpoNYLuDgjn4KBu3yZa3PDTLtpXkW2QLOdbvw6AQv8uf2ffXfz2s+FmTNFRFuuil6vfr/rRuDcyhIYoBE3o1kcdG5DmIP+Cnb2UloGRt12hjqqSKLWFA/3Kwpi8I+n6K4pYFdVg7qw414fP3iLhtRR7WieviApgZvdpRSVk5TkOdaji5n5HXB96mIFt/NbWGyJXJGIetw7Vlt2wF0+TGrrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCM3uTTXQ2ZCGK5qjfpMtiHy8tQe1kK4OgDMpUKsN98=;
 b=Nf+aFsUTxjay9ajKR6urLQ/74bJGD/II065q7Qq7fmluRiMbs51mKWtcX5f1D2VMQWaC5eXpAC1q4p6vfzAPmQABbLRir/+4syBmDZ4jGax8FMGHu+tZcqWwj+1z+W4NT2L0Z6lvjk20sxzpHiulCm0xqHvTxwSSI04iwE01Wv4=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:08:58 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:08:58 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 2/6] usdt: get arg types and xlations into DTrace from the DOF
Date: Wed, 30 Oct 2024 12:08:46 +0000
Message-ID: <20241030120850.256884-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030120850.256884-1-nick.alcock@oracle.com>
References: <20241030120850.256884-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::16) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f94a5eb-d93a-41cb-ddc4-08dcf8dba270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1z6RlPhpT7DtnO/cTw/VAHeYQSNL89tnhAjJeCGVuBpB9n6PxSrUMbiiwVXi?=
 =?us-ascii?Q?qLTk89YvugIfxjqcVlnhdvTvSXwmDUceTD0XNZNPgg3XD7T/UFgK1waoFBwp?=
 =?us-ascii?Q?OVTr0xbx7diCdorKOS0bnD4WYl9RrQ+ffs7mmywBZmqEhl/DyBA1h+MdEDwr?=
 =?us-ascii?Q?XWFERAQzM0SALxsYcyckmNzvdWm6MRBhOXoJ4Fb86ApO3VCn2B/im6kCmVoi?=
 =?us-ascii?Q?+Ns1jGFYfCU6gEPrAbA2iYqHSNsb+A5QhXE1sr0hE729EnIShcHGNVugXbR/?=
 =?us-ascii?Q?OM+cxI4gGS8a1yVXh/JKLRruRYxZx8Zn2LhvScO1eEiKh7rXYW5zkwQUsMb/?=
 =?us-ascii?Q?KX/djc/wELJbwI4WjEI6LO+sydcJ0bfrA5Nw6SBkzw3ComPgEjzYwkPiz7oG?=
 =?us-ascii?Q?OjcMK1izfI/BUNuqef08PFETL/NFONosALpqPy/GV/RQKxITVDNtq+Gyxp6M?=
 =?us-ascii?Q?4CwoyEm32sW3MIcSHQNG65daKFH1rw+bM0oLCqwKV90998nyswbbGYdVZ/wG?=
 =?us-ascii?Q?LcOuTq3eua4Zo9rjiLch+THodiAmvIMUNgzu++rPoCAZr0GgfM17RGlto4dF?=
 =?us-ascii?Q?qcOEvId6JfL4m/TIhvbdNsXCTOeOZoNtoMiHOoW+08b0L5Vuov4oOOjiX/qR?=
 =?us-ascii?Q?NkXPaKBN3jxkvhLYK842UAAKtoi+rix7pHMqVPxQL/v1VqruTGFi5SX/oxxE?=
 =?us-ascii?Q?Apk0SMDRKtbzZx4duV74UZy2ztWBECa7zh/kRIM5VS0FInV8j8h/zpG+NWwV?=
 =?us-ascii?Q?S1n3xLtamOsFK9wJuSIn39+vppdmL2dl7IU7JBMXu3Zmb721P6Xckm8ue9fX?=
 =?us-ascii?Q?BUAWRYY0B9B+Mph6c404AN4KKO8LTRYo2QCSztaJ/OSdxWUpx8LhlVft8sGG?=
 =?us-ascii?Q?ISnLAMvT+F2LREeOzUz2aRt89AkBQpCKxfdwYvwq7VKONvuLArDRJ3dKuZA4?=
 =?us-ascii?Q?kXDrmzsd9wz2XD+Qx1Em4DoJgoLSHMVJ9YLusMox+i/EpDQ+ytsSYI+VIuDY?=
 =?us-ascii?Q?S22uvVLvbBxMy1LrgNFrUuG54YyztZaQdslSwLfzdOFkR6Mj6acuZxQ3ZxRv?=
 =?us-ascii?Q?fB4c7vsbi5fm7Q4JF3EucGHiLrYNAG8Ibe1ib2XlwaP4Md4nmeCpkPx4aYiW?=
 =?us-ascii?Q?Bd403FLrRM8heqBdK4cHq3lSldATclXOgia/YaW/6VBnQJepXHi0c+fyAnzD?=
 =?us-ascii?Q?nFTkPVQnm4NbITFC6+Zvj5t2v7tkSAB4f239DQ4+ZERNBLCi6fnVmrnoTsN8?=
 =?us-ascii?Q?eSB1BPN3U+asvIzCsGPfgCmBmeaxYE2H6FU7PWb/NixIXWzwboI00z3xuON7?=
 =?us-ascii?Q?vKoU9V47ooHRTzxQtJuSQ7Wy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iA3Jw2kRoRGwze6jpklHTgDTobJu5KtFs0Uefxo+rd67ULOo7w3o64NOTOsy?=
 =?us-ascii?Q?Fd0qAnwlGcltxmGnPVKIsHEML3X3aIFGCVt5ktmBEVD4pKdXuVGEHZ3x1S7t?=
 =?us-ascii?Q?/Lm8x4hW1d4VxJy1G++c381Z0GCbjqyx3fxns3zwoPwnzqGkeRGNcf1z/qNp?=
 =?us-ascii?Q?RqZh4peWxdWK8D0AArojzxVs/JSW/LyMw6bIhH7n40HyPZxcCGQyyx3CoUBS?=
 =?us-ascii?Q?SKNkPNtvXc9HuzMpczXWsNiXnZZaKOX481DAuESg+VHHSlOC8TMRPPmP+pwy?=
 =?us-ascii?Q?Z108VmK/6e8dxxL8bMRHvnwQ/HoguTuuXj5VQ1K6izUEJsbADoKc+5RP1Ug1?=
 =?us-ascii?Q?khdx5QVj+2ZGd6ruttld+cX5aopVIJmpoNpfN3Z5eRH9m8HhGvof234slidp?=
 =?us-ascii?Q?JCq+mglu4iu+mduk3BBmuZs8YB+Gv6h5Wu3+dSTAFvXF70jSmDWZ6wBVJ6ev?=
 =?us-ascii?Q?iD+bgwE+1ar1M45Em/28uag+FZhB57AXJX79sWJrgaSw5kiuPg5nLPGJrPZL?=
 =?us-ascii?Q?tTNfjkTo6NaEd0735P4wyDBmP5qbtjNM7bnO0A/Gcg6l25WQKQ/T4/gecty/?=
 =?us-ascii?Q?zkZk94fahvFt7EOAKo4rXBZ/ZeCecdFI2v8okUoxMW6CA09D4lxcIA/g0bNm?=
 =?us-ascii?Q?9VQTOoV/hf9lOFKFvPBiOWJr7cnrgkIJxXCdFSiwn7lGWD+MXGWvhgBst03i?=
 =?us-ascii?Q?267rRdQocduCW8zJhQlJ7gzYzFb/AVLIgMXEZlzsEs/Or3f0r1MCn5czsVzL?=
 =?us-ascii?Q?INJq0kE+HjypSrSL0KQMqOcB65Ygf0Li2NWQlUMsSwtYOVyJpqFD/bvqcu+v?=
 =?us-ascii?Q?QXfof0vscK7oNSyAMs1Aov8sI3kvlXMHDxwWvZEcLW5QVyV+I7bELHWq05xU?=
 =?us-ascii?Q?mlA79MfZlRCkiLOoCJLY78Jz0dONwCF2GrXRgWPZ94zsHAhxkwe8e6RKwfiN?=
 =?us-ascii?Q?NHuvhdkwbJb0HqfulhsP0ZLtySZt/p2V96QRftrwhO+u9S6DKpnko3Z4w6Jk?=
 =?us-ascii?Q?DCEmeHqiM/GkC3YzxaLs8yn9bWSS/IM5AHEP4344h+PnO6Ku127Fxh/breGG?=
 =?us-ascii?Q?I66iwtN8RoOdvpRb8v7nyExEW9QSQErsOfGgsQVkcc7Vjx0Ic3Z/PmaszXk1?=
 =?us-ascii?Q?ZJWzwCST5hzA+/Lo1jRMX8wj3KXf6Tnog0ToqEigsdJkXIsYwXMjA2jYQX3S?=
 =?us-ascii?Q?/lNxzkN6QtS9gY1X+pkYcpTkD+XobCTI8J5inT5ow9CirXjI4n8D+pytsLqM?=
 =?us-ascii?Q?lROo8gvAdl/zGT+L/NTqxndRErG3h4MVfKTehjUbmIsV4wYlwYE6+ILv2spA?=
 =?us-ascii?Q?vi2yxpgx9WknAvFULaOocH3qCLEgqxHT40W8epyiIse4RqPwlymG7ThYuU5c?=
 =?us-ascii?Q?uPr9F4aEj/lP881NbOzpntzJwOh3JA3uhA+pOxHDHymkRbQm7emdNAr+oUcY?=
 =?us-ascii?Q?3UJQ7c5whrLl1s/Ml0LTUbrk9fXlOX6d0yEZgHOLxx80fPs/9vdzjN1EuO/1?=
 =?us-ascii?Q?qYVFHW4NJhXFb5Zt4NqI6JFdaZ0GAjg/S5Rhdo/FbHOMAFpJkqonxK95g/1a?=
 =?us-ascii?Q?4BXh9RL1N3x1KT0PFZryUDPeEFAFmyTFrYnILdSZ/5tUfAg9NnpGjxXm3bHz?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sSGgueNITDuJ/0Ew8+kf5ZPSRoJ9NRp/2/foUXqqAjoU0eZRfTGOm0iauP+eucdSVaYYZ9/A+mhm0R7Vw+0NYs5ox5/yOmrmMwbK7rEYTcLAmKY6ksvLSBm90HzP/Cy1sP+XIXD0tzE2R8pfeSVLD+Q+bJHGPZ/dpUB6jIc83yKSzbbQ8/ezURlyFUwLPXHJ4yftt1j7QeU9LX56mRrIEbE+jvy57hCrP7zAd1fAsoaPyZx6oQnEnNPB3gin6pFATuq4zodaWrE70+lxqabg05J/oL8FCumhio95oG1wTe/2OqXf+Cr1vrXq2YLio+X4hmr3kzX6wDhSLG3Xhl1ls6Mkz/BPIBH8CTDxLx3ULLKzKPqO0j1Yo2O2vz3tRhDdGuHNSjOzVMXz4peIdcmVpsoZ6dVjpaE2ySMPWn0iC0ZB6X7iqCgeAjhG99izGdSwIGz7OsRa609dnC16T/5KNzwVEDil3fXb9+FtBXi0Xg7hQJQTistGW4yrhRPBYM6gQItz32KUNgsKfupV7ie7OaWg3eI5zERbMzqb/qlJ7qbfSDZTvk/nYGtXZjlDTcWODmohaWGyBJicUSu2UIPgFp1dGiiyKRAXuvbMOkRtkiA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f94a5eb-d93a-41cb-ddc4-08dcf8dba270
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:08:58.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 474ZffR74OUtt1Ok+NIGsMx8rLcBBMQbwoyPX1XxdBUVdcl2WsTQ+NfvLxGNr0xHJ2jEGblEpO/ipjXet5do7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: hzQNIzbOvyiMQTEpNDW6_xuhskDp-d5U
X-Proofpoint-ORIG-GUID: hzQNIzbOvyiMQTEpNDW6_xuhskDp-d5U

This change propagates native and xlated arg types and remapping info all
the way from the DOF, through the parser and dtprobed and the DOF stash,
into DTrace, where they end up in the pid_probespec_t for USDT probes.
We don't do anything with them once they get there in this commit: no
user-visible impacts expected.

We bump the DOF_PARSED_VERSION since we add three new types of record to the
dof_parser_t, all optional, covering native and xlated args and arg mapping
tables; to make life easier for consumers we emit them in a defined order
(documented in dof_parser.h), and add arg counts to the DIT_PROBE record
that precedes them indicating which will be present and how many args are in
them.  This means we retain the property that you can always tell which
records within a provider are coming next purely from records you already
have: there's no need to make decisions once the records turn up.  The DOF
stash hardly changes: all that happens is that the parsed data written to
each per-probe file gains some extra types of record (it can have
DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
DIT_PROBE record now).

As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
refuse to read probes added by dtprobeds that are on the other side of it.
(Restarting dtprobed will reparse all the probes in the stash to match the
new layout, and newly-started DTraces will pick that up -- so this only
affects running DTraces picking up new probes, which DTrace cannot do yet:
so no visible effects are expected.)

The code is a bit repetitive, with nargs, xargs and arg mapping all handled
separately even though the code is very similar.  In future maybe we could
unify them (but my attempts led to code that was much harder to read than
the original).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c   |  15 +++--
 dtprobed/dtprobed.c    |  10 ++-
 include/dtrace/pid.h   |   7 ++
 libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
 libcommon/dof_parser.h |  64 ++++++++++++++++--
 libdtrace/dt_pid.c     |  59 ++++++++++++++++
 test/utils/showUSDT.c  |   5 +-
 7 files changed, 259 insertions(+), 51 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 0e639076f655..8bf465678217 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -59,8 +59,10 @@
  *    startup if the dof_parsed_t structure changed.  The file consists of a
  *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
  *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
- *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
- *    the DIT_PROBE record specifies.
+ *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
+ *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
+ *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
+ *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
  *
  * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
  *
@@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			break;
 		}
 
-		/* Tracepoint: add to already-open file.  */
+		/* Args info or tracepoint: add to already-open file.  */
+		case DIT_ARGS_NATIVE:
+		case DIT_ARGS_XLAT:
+		case DIT_ARGS_MAP:
 		case DIT_TRACEPOINT:
-			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
+			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
+			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
+			       state == DIT_TRACEPOINT);
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index fdcdee14f851..cdb08a65205e 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -795,16 +795,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (dof_stash_push_parsed(&accum, probe) < 0)
 			goto oom;
 
-		for (j = 0; j < probe->probe.ntp; j++) {
+		j = 0;
+		do {
 			dof_parsed_t *tp = dof_read(pid, in);
 
 			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type != DIT_TRACEPOINT)
+			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
 				goto err;
 
 			if (dof_stash_push_parsed(&accum, tp) < 0)
 				goto oom;
-		}
+
+			if (tp->type == DIT_TRACEPOINT)
+				j++;
+		} while (j < probe->probe.ntp);
 	}
 
 	if (!reparsing)
diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 0129674adf0c..8eb8a1708d04 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -35,6 +35,13 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
+	int pps_nargc;				/* number of native args */
+	int pps_xargc;				/* number of xlated and remapped args */
+	char *pps_nargv;			/* array of native args */
+	size_t pps_nargvlen;			/* (high estimate of) length of array */
+	char *pps_xargv;			/* array of xlated args */
+	size_t pps_xargvlen;			/* (high estimate of) length of array */
+	int8_t *pps_argmap;			/* remapped arg indexes */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index d6631a1afdcb..dd3a6cd2b887 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		}
 
 		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
-			   "%d is-enabled offsets\n", j,
+			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
 			   strtab + prov->dofpv_name, "",
 			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
-			   prb->dofpr_noffs, prb->dofpr_nenoffs);
+			   prb->dofpr_noffs, prb->dofpr_nenoffs,
+			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
 	}
 
 	return 0;
@@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	return 0;
 }
 
+static size_t
+strings_len(const char *strtab, size_t count)
+{
+	size_t len = 0;
+
+	for (; count > 0; count--) {
+		size_t this_len = strlen(strtab) + 1;
+
+		len += this_len;
+		strtab += this_len;
+	}
+	return len;
+}
+
 static void
 emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 {
 	int		i;
-	dof_parsed_t	*probe_msg;
-	size_t		probe_msg_size;
+	dof_parsed_t	*msg;
+	size_t		msg_size;
 	char		*ptr;
 
 	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
@@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	if (validate_probe(out, dhpb) != 0)
 		return;
 
-	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
-	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
-	    strlen(dhpb->dthpb_name) + 1;
+	/*
+	 * Compute the size of all the optional elements first, to fill out the
+	 * flags.
+	 */
 
-	probe_msg = malloc(probe_msg_size);
-	if (!probe_msg) {
-		dof_error(out, ENOMEM, "Out of memory allocating probe");
-		return;
-	}
+	msg_size = offsetof(dof_parsed_t, probe.name) +
+		   strlen(dhpb->dthpb_mod) + 1 +
+		   strlen(dhpb->dthpb_func) + 1 +
+		   strlen(dhpb->dthpb_name) + 1;
 
-	memset(probe_msg, 0, probe_msg_size);
+	msg = malloc(msg_size);
+	if (!msg)
+		goto oom;
 
-	probe_msg->size = probe_msg_size;
-	probe_msg->type = DIT_PROBE;
-	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
-	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
+	memset(msg, 0, msg_size);
+
+	msg->size = msg_size;
+	msg->type = DIT_PROBE;
+	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
+	msg->probe.nargc = dhpb->dthpb_nargc;
+	msg->probe.xargc = dhpb->dthpb_xargc;
+
+	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
 	ptr++;
 	ptr = stpcpy(ptr, dhpb->dthpb_func);
 	ptr++;
 	strcpy(ptr, dhpb->dthpb_name);
-	dof_parser_write_one(out, probe_msg, probe_msg_size);
+	dof_parser_write_one(out, msg, msg_size);
 
-	free(probe_msg);
+	free(msg);
 
-	/* XXX TODO translated args
-	   pp->ftp_nargs = dhpb->dthpb_xargc;
-	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
-	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
-	*/
+	/*
+	 * Emit info on all native and translated args in turn.
+	 *
+	 * FIXME: this code is a bit repetitious.
+	 *
+	 * First native args (if any).
+	 */
+
+	if (dhpb->dthpb_nargc > 0) {
+		size_t	nargs_size;
+
+		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
+		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_ARGS_NATIVE;
+		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
+		dof_parser_write_one(out, msg, msg_size);
+
+		free(msg);
+
+		/* Then translated args. */
+
+		if (dhpb->dthpb_xargc > 0) {
+			size_t	xargs_size, map_size;
+
+			xargs_size = strings_len(dhpb->dthpb_xtypes,
+						 dhpb->dthpb_xargc);
+			msg_size = offsetof(dof_parsed_t, xargs.args) +
+				   xargs_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_XLAT;
+			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
+			dof_parser_write_one(out, msg, msg_size);
+
+			free(msg);
+
+			/* Then the remapping table. */
+
+			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
+			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
+				   map_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_MAP;
+			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
+			dof_parser_write_one(out, msg, msg_size);
+			free(msg);
+		}
+	}
 
 	/*
 	 * Emit info on each tracepoint in turn.
@@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
 		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
 
-	/*
-	 * XXX later:
-	 * If the arguments are shuffled around we set the argument remapping
-	 * table. Later, when the probe fires, we only remap the arguments
-	 * if the table is non-NULL.
-	 *
-	for (i = 0; i < dhpb->dthpb_xargc; i++) {
-		if (dhpb->dthpb_args[i] != i) {
-			pp->ftp_argmap = dhpb->dthpb_args;
-			break;
-		}
-	} */
+	return;
+ oom:
+	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
+		  msg_size);
 }
 
 static void
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index d3a6836f15fd..8f42d00551e3 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -15,10 +15,19 @@
 #include <dtrace/helpers.h>
 
 /*
- * Result of DOF probe parsing.  We receive a provider info structure, followed
- * by N probe info structures each of which is followed by possibly many
- * tracepoint info structures, all tagged.  Things not yet used for probe
- * creation (like args, translated types, etc) are not returned.
+ * Result of DOF probe parsing.  The order of elements in the parsed stream
+ * is:
+ *
+ * DIT_PROVIDER (at least 1, which contains...)
+ *   DIT_PROBE (at least 1, each of which has...)
+ *     DIT_ARGS_NATIVE (1, optional)
+ *     DIT_ARGS_XLAT (1, optional)
+ *     DIT_ARGS_MAP (1, optional)
+ *     DIT_TRACEPOINT (any number >= 1)
+ *
+ * The dof_parsed.provider.flags word indicates the presence of the
+ * various optional args records in the following stream (you can rely on
+ * them if it simplifies things, but you don't have to).
  *
  * On error, a DIT_ERR structure is returned with an error message.
  */
@@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
 	DIT_PROVIDER = 0,
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
-	DIT_ERR = 3
+	DIT_ERR = 3,
+	DIT_ARGS_NATIVE = 4,
+	DIT_ARGS_XLAT = 5,
+	DIT_ARGS_MAP = 6,
 } dof_parsed_info_t;
 
 /*
@@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
  * start which is the version of the dof_parseds within it.  The data flowing
  * over the stream from the seccomped parser has no such prefix.
  */
-#define DOF_PARSED_VERSION 1
+#define DOF_PARSED_VERSION 2
 
 typedef struct dof_parsed {
 	/*
@@ -59,18 +71,58 @@ typedef struct dof_parsed {
 			 */
 			char name[1];
 		} provider;
+
 		struct dpi_probe_info {
 			/*
 			 * Number of tracepoints that follow.
 			 */
 			size_t ntp;
 
+			/*
+			 * Number of native arguments that follow (if > 0, a
+			 * DIT_ARGS_NATIVE will be received).
+			 */
+			size_t nargc;
+
+			/*
+			 * Number of xlated arguments that follow (if > 0, a
+			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
+			 */
+			size_t xargc;
+
 			/*
 			 * Probe module, function, and name (\0-separated).
 			 */
 			char name[1];
 		} probe;
 
+		/* V2+ only.  */
+		struct dpi_probe_args_native_info {
+			/*
+			 * Array of native args.  nargc in length.
+			 */
+			char args[1];
+		} nargs;
+
+		/* V2+ only.  */
+		struct dpi_probe_args_xlat_info {
+			/*
+			 * Array of translated args.  xargc in length.
+			 */
+			char args[1];
+		} xargs;
+
+		/*
+		 * V2+ only.
+		 */
+		struct dpi_probe_args_map_info {
+			/*
+			 * Mapping from native arg index to xlated arg index.
+			 * xargc in length.
+			 */
+			int8_t argmap[1];
+		} argmap;
+
 		struct dpi_tracepoint_info {
 			/*
 			 * Offset of this tracepoint.
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 62060b5921b6..e4dc5368897d 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
+		ssize_t nargvlen = 0, xargvlen = 0;
+		char *nargv = NULL, *xargv = NULL;
+		int8_t *argmap = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -917,6 +920,47 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		p += probe->size;
 		seen_size += probe->size;
 
+		/*
+		 * Assume the order given in dof_parser.h, for simplicity.
+		 */
+		if (probe->probe.nargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			nargv = args->nargs.args;
+			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			assert(nargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+		}
+		if (probe->probe.xargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			xargv = args->xargs.args;
+			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			assert(xargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			argmap = args->argmap.argmap;
+
+			p += args->size;
+			seen_size += args->size;
+		}
+
 		/*
 		 * Now the parsed DOF for this probe's tracepoints.
 		 */
@@ -967,6 +1011,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
 			psp.pps_nameoff = 0;
 
+			if (nargv) {
+				psp.pps_nargc = probe->probe.nargc;
+				psp.pps_nargvlen = nargvlen;
+				psp.pps_nargv = nargv;
+			}
+
+			if (xargv) {
+				psp.pps_xargc = probe->probe.xargc;
+				psp.pps_xargvlen = xargvlen;
+				psp.pps_xargv = xargv;
+			}
+
+			if (argmap)
+				psp.pps_argmap = argmap;
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
diff --git a/test/utils/showUSDT.c b/test/utils/showUSDT.c
index f42aaa21103a..73117d700a54 100644
--- a/test/utils/showUSDT.c
+++ b/test/utils/showUSDT.c
@@ -111,8 +111,9 @@ static void processProbe(int id, dof_probe_t *probe, const char *name,
     printf("      Probe %d: %s:%s:%s:%s\n",
 	   id, name, "",
 	   strtab + probe->dofpr_func, strtab + probe->dofpr_name);
-    printf("        argc %d noffs %d nenoffs %d\n",
-	   probe->dofpr_nargc, probe->dofpr_noffs, probe->dofpr_nenoffs);
+    printf("        nargc %d xargc %d argidx %d noffs %d nenoffs %d\n",
+	   probe->dofpr_nargc, probe->dofpr_xargc, probe->dofpr_argidx,
+	   probe->dofpr_noffs, probe->dofpr_nenoffs);
 
     offs = &offtab[probe->dofpr_offidx];
     for (i = 0; i < probe->dofpr_noffs; i++)
-- 
2.46.0.278.g36e3a12567

