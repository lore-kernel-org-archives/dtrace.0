Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0131D2628D
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714063271; cv=fail; b=PdosDMJYIH7rxloJPwG56uoEGIxarsURFHiS6tMQETFj0nuSQwnhuv8JrFAWZleGettuh5dkuteRDpXdalpvZpavWaeJ32093YZKaLwyxLz6KhiVVp2cNxEf9jWNe+31lQXb7gjLCEZScQ3JCSz0FePSWn52rI5dOaIVrZagwzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714063271; c=relaxed/simple;
	bh=84S45shFIqmM6qHoEU9qao3JEh0nI2KubQBSnkRPDgA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FQ9zkh1rDP6zu6irFEH9b5byLri0KrHXUTGqk9VMG5f0EE4lSLzDWuLiuTdjhMI/wm3gG6G3bpQurDOAnK4eVeuGlB6tiRjDXGAcxWUluoCcn0HUJ0GZZkncY26R6rchXGdjoO1kbIL4lYcrTGwGYFX0FgwLTw58BHgKXrC9d5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=exg978vP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gsVaMZPj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="exg978vP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gsVaMZPj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43PGMfFi030586
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=Dc4aTA5bLxv2mVWw5pz3a/wm/nR4bX81iHfCyYP8RSo=;
 b=exg978vP7hwklqPlVUFLxZyrH8hiT1h2l9ETy90pFtT8Si5UZKG5ceJZqndLa+4G2seD
 H2crYwkl8KGbdmOw1P1rP92Xn6WfYF/Ebt1g7gFRXfGCLg8uUds1Jlcgz2ik0XNZninl
 i+ZhgOMOcKRxQZ/BHI53lteYhHUAOfAPPpleCgtke730FUdNm3sNPk+BACFq04rn6oXI
 hOlK2SKibPAmKXQGta5hTrHruItvRloXcrR6VF5hfprXAZnAkJV1rtZQl33Pgp40qfJ8
 +58Xa8C9V7b13j1M7saOPQqfeNtSRwVnWS1YwLMuRtiLmaD5TLNdeNMSuEKBaxtlmZN7 Bg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm4mdceq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:41:06 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43PFkfRq006170
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:41:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45apj22-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 25 Apr 2024 16:41:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuswgz0njvL0WVf7OYGJ8/jSVOsojfJbvcPbmtKNIibk81ZOHbP6AuoWv+kselN+u3hd3D07G8Kl0vr/rFKijm9pf4l9C1kB7aGfI42ugVJCUY6KK2iFQH5L6PdOcjnzZvpr5N7lD8k4inCipsocpDYljkTBq74Kau0TZJj5KOf+7du+c2UuqqIFwkI3zM1Q8pFkU/YmkjwA7Bvq2LeX0ZhY/3ExcMMmcgUl8FcPMLSuCQ+OEljSUttD42gC7Evq/JOs/audnTrdWuWcAVXAurMF4a4II9s+rRTOySjlW08Vl2ST1vxbcGpfNQBSYaj7nklyemLw21AoxTxDGKUDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dc4aTA5bLxv2mVWw5pz3a/wm/nR4bX81iHfCyYP8RSo=;
 b=gld98Izh4EZMZaulw+f+8cOSYl4NWXwNryG+uWFqE9h0QUM1rd0QWPa6mzuzU0KnUDORKj3Zi5vOGXA5USdWeidJPXhBE7ljFZqUNpzTG/pmdT4aeZ+XEY0e2+zkIL37Lv96RwOdJ4DWvmSeI3Og5+1EkV3wiOfData5Vgq3L/vd2jbFErSG5FqRpEMiPlENXJClN2d8kgzAtUIju/2kutRtld1kqkPsJjlCk2VQblzk0vNzziDZyoSu2SLf7E2qqLcpR0TeOSxzkgmBMdBVIx3qeN9MLc39kqTNxN56Ei7HKueWhEM2Miqrzy+ts8woz6YvX+SOw0lRaDLzZ5Y6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dc4aTA5bLxv2mVWw5pz3a/wm/nR4bX81iHfCyYP8RSo=;
 b=gsVaMZPjjvg3Z7Ice1Ya6ZWmruoA9e6O0Ar2FltJqp/AUH6vd72uTp2E3q8m+KLQtKHgTUJgB+dDoaBUyOlkI9vsIOc9FHVzN2DXJkM1t3yNkOV1mcSUGTdfwzMA0k07PveDzY9Uk24tMwbN1d+pPo5B9+iJEtn3fqQwCkmVJ2g=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS7PR10MB4960.namprd10.prod.outlook.com (2603:10b6:5:38c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Thu, 25 Apr
 2024 16:41:02 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::67a4:9544:7249:7751%7]) with mapi id 15.20.7472.044; Thu, 25 Apr 2024
 16:41:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
Subject: [PATCH] libcommon: disable _FORTIFY_SOURCE
Date: Thu, 25 Apr 2024 17:40:57 +0100
Message-ID: <20240425164057.420580-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.44.0.273.ge0bd14271f
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0128.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::7) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS7PR10MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f04c7a1-d50e-4de2-a846-08dc65467e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HOQZc0ncuet023k2VUetdq/SfkNXn+VDSHpWM8/DJ8SVkPwzyLLH2TzwXJae?=
 =?us-ascii?Q?SA3VfGC1MxcLHYz+3DRLC9idEf8IJ12C56/5Jg2plF+EpNTcbSHEJ9R7HCme?=
 =?us-ascii?Q?7Lry+uXFX6zqaF91T/OriYiCJuapAUlANa8/cMwnW1PjmASzvTRfgR0NrP3a?=
 =?us-ascii?Q?Yjl0iGVs4JyLPSLHMICsRI7v44zuc2kPR3TPsN514jR5Ca4qK/Rt3bT8Jfh6?=
 =?us-ascii?Q?J3lpHDr1Sf0EqaIc62j8J41zvaKlEtGGHJrsUZfjg/wGySYv6REgKzJMuccB?=
 =?us-ascii?Q?Wd5JfvgW+7fqmxIMX2IFUqpUEdaxA1ChnY7jkDwZUnfRivrkALh8rapBh0RR?=
 =?us-ascii?Q?pBBgmLzI+illuQb4BNb6n/0iLH4x2B4V2S/iMMecHRLiWyLAvSRoBaQ57hpt?=
 =?us-ascii?Q?TPQE1qs8dd+/LlYMmA4Yz/YIXf8vdb9GGyC8r4c2bH7PRSw33G2cmzUEc0f0?=
 =?us-ascii?Q?xAnibMZq4E/zlzdTotWulTSEWMwfdbq7j0J4wtz+Isv9RAwH8h2F6oCPN0Xm?=
 =?us-ascii?Q?rqu1/L3wdNcPD8R5wImMaJcXxV84MJBFku8TZFLz+cxd/uBlP/LIrp6df4Yz?=
 =?us-ascii?Q?Kccjgb71uylo0/FavEzV2+zrWGQ0XdJv7cs1MP5NWjbbq5DnZhWuTxemL7h6?=
 =?us-ascii?Q?5AIC0UFn7RehZyjubyaO2vFZM+mPum1BWFxXOELGHj12zqAJVA6/JJfL2aXY?=
 =?us-ascii?Q?yNhMsk9WHi8Q789byWt1lchf3OEoT08V0g6WkdnfPKddVx2XZyrC99NVokiL?=
 =?us-ascii?Q?5qVpiUyowsYT3Slh+9Mw+oB7AjrA/febu4esE7Alz0v186w/Q/19G0Taqftm?=
 =?us-ascii?Q?y8bx2KjjtNS31YxfSVBFLOY/hEfp24SV7GmP8NMHhJoyqcGWepP9aTl7nCy0?=
 =?us-ascii?Q?X/9YAHo4ddcMnNZwHUx1K1hmTESzAU4K+/eWJJSjTRr+RbfcQJ8C+/pzzAUl?=
 =?us-ascii?Q?NzgTCS/kW2p6TPt7tsCO9bFL3hfK307VYryHfhFXRohlSQdP3rmoAbeJhL4W?=
 =?us-ascii?Q?IdNnsuhI/Y9CBzUudnTHgzmIT95uWFTqUzYGMHghOn6T9P/0lD5E/yMbi4MD?=
 =?us-ascii?Q?Sw1BYVOwOU+HeWXhOWSxUffxMlYCDiBODeNANFfwPezL8j6DTKZN9rChG/fy?=
 =?us-ascii?Q?NBkcRrs7GHhcZxkdcUqZFCRky1moDF/CCkUPI4+YMWJ3hyAWAZmNWnx8L8rq?=
 =?us-ascii?Q?LqOlhVP3UZofwhC2i+ScEcFkdd7fINos5q3PeIsnn36vSK46WRuoO9gDEfca?=
 =?us-ascii?Q?vLJc3wkaGfdxf8wDsNpOImHY98LbvPA/yxDCL1M0hg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VBqBadVvNO8gZoMilr3+US6ZqCtYEypx6OooSGsrI+4sqcV128KYkaL2wAnA?=
 =?us-ascii?Q?p4Z5A17Wlo2nu+qducM8cPdcir17zK35DSb8s6xCgS/FS02COZZuUQ/9oO7U?=
 =?us-ascii?Q?KvWcRap3AQTLDqodDFfae+t3h+lTrwmyraYaXXKKn0aR+Q1bDNcgnFC0ieaU?=
 =?us-ascii?Q?AHAzfHifnH18yOId8lWlDTPuwD27o6LwDpajRtfGZTfrgwKDvBhkct3gL9gD?=
 =?us-ascii?Q?tYB5g3oWKcnEJ6vOroZvJen2cZkyvdp3OqwpkV4U6GMhA2gCkYK5cSc2VlvP?=
 =?us-ascii?Q?ESFY0XaeNcAz/ZV703YEk+OAxef8/D4PTjxy05iqva6pOmxf5Le0PoY9RcaU?=
 =?us-ascii?Q?F3fnb/JEMTFtgDEY0zBcvLM9urLCiGDQmJvPLthRKIGdS8EstkhmA6vAvQ20?=
 =?us-ascii?Q?XedIwurhy6sDwkR1uiwNTM94DBXKnMi18mPly8gkkBJVlwEKJe+SmEnGiaPC?=
 =?us-ascii?Q?iz7U5Jm5+MNoeGZo8oIl4Ic9bWDDs/+pgIEytJpwdSf3SNCnonSui1gDmUOz?=
 =?us-ascii?Q?aVlve1xmmmDGh1qabwccRyD0VGbdVcL9TFey1ShrAyOYbeV7d6k0Qo3u5rkx?=
 =?us-ascii?Q?WqWTXj192orL2vZyGtbwLJrVF8kWAO49W8iyfttimxkk2jHFlvjY+ui3AT4V?=
 =?us-ascii?Q?98iFwiDgeo8jCbFjDWP880trTNd35lji/cN1H+MLHmYWAO8f1v5tV74TNP7/?=
 =?us-ascii?Q?xQX7VzACM72Amlzc4QgPIHqycP0WZ7xq2oHqMtmCioBbwMUWB7GerfWOdZIG?=
 =?us-ascii?Q?tNrVlycOr1G/65cDb8XCfetly9aWnIEKoYic+sS9B2x9SFj4GOZn2J0bvi9p?=
 =?us-ascii?Q?8r3VmjjNF4O3joaxOpD54xfWQxkZnJzrwZUe3tXuUWvsxASJig2vFG1YvIlb?=
 =?us-ascii?Q?Luhgn13QM1VuwLSiw2Nowrhym5S5gcAyztfLg0SEk52n47HQ8RPI0E+Hu4gJ?=
 =?us-ascii?Q?6/o/yGpVeUa0mV5qgPV6T6MPA+bLWR4jxYR2svMOImrvhoICwIJdWT3rAzWd?=
 =?us-ascii?Q?B07l/OPYvByrW8Ydqm7XHRLgkj9f4IEOjMLyGH/Wl9/DmNl8XFrHYmmeoJfL?=
 =?us-ascii?Q?LJJtvFbt+uPUyRK3vO4GvOs3kPxDU0St0lhZC25wAxFB4a/fLiPhPHl5N3zi?=
 =?us-ascii?Q?zZmJlqcm1BkFigbYj/vCq/0BOqyTke1IUnis3agtq3KbOHah2IWLTREYd0WJ?=
 =?us-ascii?Q?MHZABdHea9SM+VsdSsbhcCRpqnEH2cjLOXvVqOFyhXmjsk+xGDCDj2kQq0wW?=
 =?us-ascii?Q?qhj0YG2VlKq4/y5T2qELcqjlfpEwVpT6BkOcVfAVo7vV6MD6bMBU3ID/I3Xi?=
 =?us-ascii?Q?Wywfsr0A0Pq6gejAccT89uxEDCCjGhxDL6TnuH5AyHcAeXfsAn0r/OXyb8Ue?=
 =?us-ascii?Q?eBIKcBjveWngctJJ3pzQRNvX9EZVKy7rqp1hHGLaGLzs1aSL46b/iAQJYG/R?=
 =?us-ascii?Q?LzLYQMMVeyqmiciLEGka+3dsSD02xiAgOYY+vmfBigf4L83KnCaHRsTg4zHn?=
 =?us-ascii?Q?ooXC1X217cO/Zcb8zHTuQrSI7iDIMORYsLi3S+0UIzS9Hcxa7yQ3wADjqrJx?=
 =?us-ascii?Q?K1EuWyOmCnTWrHpasnxdlY3tcaWIwIevENAO4QLUsO/DvPEFEVyOLO+nxcYg?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	QLU1ydkwej/1edDf7aL5IX30OnGFbnOnH8yScKc3b6FtrdehPQcbPizFTHzsykX+LV56tjIPDd55lkrA8to10Qma6AdnVwQ3aEilddRxHoS/OOExyikhYqZjkT37WU+QPTlTeIvVQxtWvszrdAsC/pxDBTQg0C6F3y4kIVsXOlEZsYUrHdbjhlsYFkocyLjF0DyDN2IzpZwvX6VLgfkGMhmvdEOaVwsyGGhRiPmnBB4aw0L4YXLkzCDCG2mzaRJjCKTxySCnkHbBPwT1/UxUeRytftRXbZkwId+hktxpF2hqZnhhLp9DOs3xGrFEuW+xZqKCS26n962JiO0vR0k+PdTHJEbD1HKLnczr+1wfpEY+Fdd3UfkTVJv/ByTS3S/atEM05z4+y6dyRKHaZwxIsI31CZPvPisAEraJaUv/hnOfPYE9dtmLfMrraLapbffOwPiHPYdf1VzaRUTKQoY6kxYzB8k3hH/ZpXR07TNDDLqfJcAEYX3kD9c/ODct/qunMEFiEFQJlmPH69lUZz6UE+4NR7rxdAF8FdLUP8IkNWde6hf/9/koc4e34Xv0L391/0CguR8jRKlK8oyi4Ve35ntxUfwrgLyQhNGv7jqSIVo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f04c7a1-d50e-4de2-a846-08dc65467e69
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 16:41:02.4297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UOZZdUf/9Fv/x8S/8tWnPcHZPbO8tzDAj4kKmRcVprzfe0xRacVjSWbmctyT2uCesENNbhDpOtDKKS2o+2vaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4960
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_16,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404250121
X-Proofpoint-ORIG-GUID: YmtpTyXGeu-Usavn8vEbfk90PBN4Rlfj
X-Proofpoint-GUID: YmtpTyXGeu-Usavn8vEbfk90PBN4Rlfj

This is incompatible with the dynamic-length-string trick we pull in
the DOF parser (which is in any case seccomp-jailed).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libcommon/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libcommon/Build b/libcommon/Build
index 50aa4ed88f8c3..fd54dc044f9af 100644
--- a/libcommon/Build
+++ b/libcommon/Build
@@ -8,6 +8,6 @@ LIBS += libcommon
 
 libcommon_TARGET = libcommon
 libcommon_DIR := $(current-dir)
-libcommon_CPPFLAGS := -Ilibcommon -Ilibproc
+libcommon_CPPFLAGS := -Ilibcommon -Ilibproc -U_FORTIFY_SOURCE
 libcommon_SOURCES = dof_parser.c dof_parser_host.c dt_list.c
 libcommon_LIBSOURCES = libcommon

base-commit: 6c5f67cc8ea1d694da8043c8f5aeb2f97b69997a
prerequisite-patch-id: 27ade1c234620c8ed86991c2311a7887e935e1c0
-- 
2.44.0.273.ge0bd14271f

