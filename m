Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C871B87C0
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509093; cv=fail; b=W0SVzgIsYC+Qsc5e6b8SOPfhOomfibGuDPox7phmgwPMy5dcmuzepN1AFV6TjPufrR3arAm+dcLLJFftuBG2o1v7DYXsNQw21/X3huiLAlcxPAiPkFF+qjWLpgC9rbkKUGuenBHWTO0yt0LhfBmaGKoabR08SPtM3wgu+EfL8KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509093; c=relaxed/simple;
	bh=4G95PPA1Htxe+AiHIZvvnmFyIimmoNjcWpMafCgbIh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mYXsmLu2hlC22XebyanDWGJgaJUC2NIUIbeBPk5o3wtU1OwDLHvub198MAzBB+K7Fa+Jjlkxoj3PKi8bn4QQEN6KCdb4fWrUAf6cLGE44a39K98Y8BNrhG/wJtVRv9thjlydtqYh8mooXPqr1XsSFqyIapoEC7rZPeIeislmyGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iF5to5Iy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rTzIDTbF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iF5to5Iy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rTzIDTbF"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OF70VA010415
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UHdVMDn85VPvfeh5vf
	HACSi3CeNqiStfkQumPjDZd68=; b=iF5to5IyLT7EnCifJti69CNnQXJ+/pEBdS
	fTA5Ii5uZ3rretLCa0ydYaZymhPgVH4Sa1kQaf1e31pfRQwqd0gOEVlhvnoDd/YE
	By5+NBAwcga+NIJwRJABoi0Ku9tFIfwtVEuocGWIMpIwGm3tVJGSeUPZqQTHfRgP
	py1iWsdDLxe2fdiKwHcGbXiJCdvLfuh/oIOmykkOwYXQJeQl+4IReILcsdOr08/G
	dvlKicU7YZDaX4tvE0ICrK4mgyTreVkWrtmB/o3Se1PXE3MKIjh7zJw2EJoVHOor
	2dOZFYOQW2JxtnAB23ZG+BjKCHhulBQ6AKOekHent62ta3qdLfDw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467qner4m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:38:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OFNpld014162
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:38:02 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010006.outbound.protection.outlook.com [40.93.13.6])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 466jxqf2te-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5DqsanlFRq1BKJvC8OT+V08kRkaVP24pLUkRnAsxlTTduV7D7ztbIpYto4o4gLT/4DphaKEFKnGeZf64s+2kIYjpyJuyioKd4WRljQr0V1kj8o/z7g7QkUlha0FTIsLCWvf62pIUqJn4zHC03RdzXrwrqSbHFCEGQnDo5HJ0/rTgUfisRPLugMmDu3Y91/YVO8k22FOmUepHAwQ2yMlvPlYY0V8xGJ8Pmj52jD+Wf1zqGIUGr+SK1dfaelYJE+tgTiJCh+trTgYT9nzvQJDBaKrLMx8LambPJxkrWmft3CgjjjcJrDRSgkCyugvXLHQ5Y2P7wkUbNhH/u9sd+fbwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHdVMDn85VPvfeh5vfHACSi3CeNqiStfkQumPjDZd68=;
 b=pwy7nQBrGscXvBayB08nggu46GijJ79AGNesER5m7ogZC+1OSmxeMDiAB7N7Hflrva+enkUtl9fV8amwR4OY/N89YZaXd/hhN11OhErHikcbbHp8PaEkjle98Ckc3wFQeHHEpiaJpOiKLNAJ6OtcDVUMmx3Nz73r3efhus9HD61YIbnC07QExCdojRemvB0s+zVwe6HPJi7T306eud9OpkL7Dd6rBppsCgqA0lsoMcM4qREH+9FK+8gMZ1yx/N9N8P7AXQCrcTlKkeC8Cs0uX0S1YceY46G89zRNXqX2XP5cTmI/jSDTKUlHMwxbiGutginRGL6sAJQIf8t67KrSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHdVMDn85VPvfeh5vfHACSi3CeNqiStfkQumPjDZd68=;
 b=rTzIDTbFbHGypGo8eNiRVk2TCG5cnHyntwqrJhxsyjwLKwcCRo3ZDtFNNPU4lgzJmjoxIJxby0tESiozOIhkQoQhSsQ2wfW9/By3k5DIJtOq7RWWK3DAz44HteZJE8+dYbmLuPEQ5PkdwfY02sA8g62nU/bqIn6gOwoHZ1mATsc=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by SA6PR10MB8208.namprd10.prod.outlook.com
 (2603:10b6:806:435::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 15:38:00 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 15:38:00 +0000
Date: Thu, 24 Apr 2025 11:37:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Get cpc expected branches and instructions counts
 from perf
Message-ID: <aApa1tkLZzuQez-L@kvh-deb-bpf.us.oracle.com>
References: <20250406051917.29640-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406051917.29640-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|SA6PR10MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 462aec7b-195c-4ec4-2207-08dd8345fe3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VWRxIv1Ni5ceihd9M2LE8KTZRYjYAeKzBvio4KU3NZBGFyfqtMokIQYLXv+G?=
 =?us-ascii?Q?YRhzvweRbAmUGRn3ULeylNVzsAe4C6+9b+mRiZFb+Sz4NJ4taidg+U2vUAVU?=
 =?us-ascii?Q?GBbeWEcpiQ4eqehXmfi2qtImSNXvd87E4Z/8qQPVHiQaHGjCtrV1TmG03Mlx?=
 =?us-ascii?Q?V9gUK+Lv6A01GRfGMJz25r0YO7E82jZWmE8BTXy9a9PPyPk0px2GD1n1M1wm?=
 =?us-ascii?Q?9VuhMT2ojI/ctnhJWslKDaDMhwKx5x71ohgNIZ/CORrlzs68clukNVIkLCUQ?=
 =?us-ascii?Q?Nf9EPgWUp6K+qkQMY3qibslZdvflA+LI7v/RS68RH9uUQWRsivmRnLRni1PO?=
 =?us-ascii?Q?xb8qyV/RSFHEuo0hUw/7Rt8mTbSzQQ43KqO4DuD3oHV3h2WhwllEKWYH6/i0?=
 =?us-ascii?Q?JDKGElR9pL2tRqkulAofjpsXp/trf65d2uMJoR8Q2glABSXE3w+Gagc8IWU+?=
 =?us-ascii?Q?WV92skwMMe6zK51cqtQ2ZThUQ8qU2iEy0cJB1kcfNFmnPK87HwZjuPo0WTH2?=
 =?us-ascii?Q?ekv/3Q3tu6DHCfZR+nFh9mvkvUQUdM9CYw9ue0A16/Swt9e3bf9xo02JdqCJ?=
 =?us-ascii?Q?UpI2lJ44dIKwHMLfbgpY7OEVCYM/Y1cbslXCSEn18/HLrR9oN4bBmllseatK?=
 =?us-ascii?Q?VQdU9cfOGE38vFGqTkXpu1A+6HtCOHu9Sz3B/TmDisZGqPm0LFj0FY7gurbj?=
 =?us-ascii?Q?t9LNNZEhy7IFPKeIjXjQzRpXMxOIUAhajZJHlkpyTU6iakVF1Aleu5BMjUlf?=
 =?us-ascii?Q?HkcbSlioy+o0hO1IKwd+ER6sqDxK8vNFhOJHGH5Tft4dQ0JKRMo5ZtQoooiF?=
 =?us-ascii?Q?T0mSB3sd76MvAermLxE/zPK+3SRnfWKtKbPjiVgfXizyg0yyssxsEX4dqpG0?=
 =?us-ascii?Q?g4DExsANWGCnFgIFjWyocF3q5zU9mFWdbDVxZ5y1uS98yiRkQ7ZAvWBwTmHB?=
 =?us-ascii?Q?dHRuG6YNDc2H5WoWKK90Taf9cjzWq4K41lavEKb7hWF8JvI6c3ywf5yCcmrW?=
 =?us-ascii?Q?+L99Sj8q9eT4ifMLlirwiJFy2UtRPQLkqG1cZmB7JVlK9NgWL497AD238+dT?=
 =?us-ascii?Q?wlDTer+N9OLpu0BKDRWRaUaLegod+Gke3MDY82H4OWAX2bS/DCVlTC1K9ERs?=
 =?us-ascii?Q?JbADdoUOOiGcRwKTvaR0Y5vZ6k4+aa6G75yckaSSuazdCrrHtk8DuHDs8h5N?=
 =?us-ascii?Q?DF+5IIXDRN1WQ2wwFryt+I01PRkMRwz9vTlTPqpW4Ff3wav+PVaFrWziAhlm?=
 =?us-ascii?Q?vq3cHB8A3ToqanRPDwOKvHq2hKxjH5mzt5QF+Kx86AjGefrNYD95mfJ150BR?=
 =?us-ascii?Q?Onu7gkGErp0EiX5g3RmtxhC601HIhYcMDlt4Hiij7N3VqU4VkKnW+jwz3qr9?=
 =?us-ascii?Q?vfrq8TwhvEgELlRMvNma6McKRPFORzM9f0F2V5/D6QBYcdl361ZIHVV3Weip?=
 =?us-ascii?Q?WMfuP1/jniQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dbyH+ThJxaJRpSYTcg0WqJKbH6BIRmpu2HNKn7/F13CvkDbRI46Jhvzvg6pA?=
 =?us-ascii?Q?F0+aPpFQmx/2z//yb7VgrPfg4Xr2v6Ruh0PnRLsg9huzARW/vHWST8bmKbnS?=
 =?us-ascii?Q?YfRdo+tG7ItTTYfuxLHLZzaRfD1+i1y1//Agupt3l1SJIC8w11jugDG0N+0Z?=
 =?us-ascii?Q?I8Bf7X8MCW1rCsoRjxDshUHUQaBBb9ToB0fzsg+ZtQkQtN3m8jiF/KFmqGxg?=
 =?us-ascii?Q?O6rkT5Yuw000S0KMcB4UteBKBtN5BSIbxQ+wk+7yAHWD0LZnSJTMqZqe2JLF?=
 =?us-ascii?Q?seQWBNgM0xQKP2Vla93tqI1qgT1LRJIOn2tr0PfjwGbsAixSOOrxHxFbN16C?=
 =?us-ascii?Q?55YAOlJh3FlFanVsO4uMZ/6EkXa573Rrm7eN4s/VGG8NnB3rPLQ4Szdv2ubc?=
 =?us-ascii?Q?YCdc7ySE/No1u7kaa91mclTORzUQ0Vvg9twwMohE0z/qGkgT/TLAOv85NaiV?=
 =?us-ascii?Q?GKV/JOQQmtiVZVwgnEuR5CPT5MwR6OQsTSeUJzhlLypGbciNjEjlr2u207Vu?=
 =?us-ascii?Q?V9/1XkmszUSly0yWiz92wHuBmoYLa6c35AQnNNnGs8l8trJf7VQ57mmil2ST?=
 =?us-ascii?Q?Uk+azKqMq/JlpmG+vNbaXZAG1YSa+5817FZt2iTgITm+K1wiWiKSc2ejGRuA?=
 =?us-ascii?Q?WGr/LtQcZzvIrsJFFbqpgo8y8IXC08iapluTKm9CtfQk45lOlTBn+mJJaU8O?=
 =?us-ascii?Q?LC5QmIm8rF383YtWXIuXvZI5eEkeRf3Xq04ICSqRvPbCJdnc8R/13e26xRta?=
 =?us-ascii?Q?HDQl7do3IhZRMprBW9FADoqRzgZQL9t8YjUjMZ1gnHSWMfL32WHLinMVg1iS?=
 =?us-ascii?Q?O4/x2SKjSXXB0SxNwgf9vPz42SA+lupmg8Tsyrdxzjg2MmoV2fnQdVrWrcZG?=
 =?us-ascii?Q?4DWzgI0/VRp4WwYOljmn0fpK/omqDset84o6thCmkhzNdp6+4XNyMBBB4Db7?=
 =?us-ascii?Q?Qe7Xe78gM1jAEIXfUmc1IGCbBET1ETH26Hvwz3jNd17q95bDubbguIgcC/IU?=
 =?us-ascii?Q?1Q6zs8jW5KhF40kloXboM4fAJgfxPatB8f5Rx1dkLtnFYOfZawHOeMTgcAXf?=
 =?us-ascii?Q?kXUJAYhpodiD3Wp37BJd3cM1TQomaoIG8Fb0HmdImoNBjHStz8/Ipk52Hlor?=
 =?us-ascii?Q?mDgWXpIruu+1kggS2EidzkluXNi6fn9P4hIsPw9Qs8qEZlMWsOWySrHuF810?=
 =?us-ascii?Q?FOHcqoirSJ86+35PTHEcyXJ/KhVa44bPVHiW3sfJqLCNggGnDJGxB7Hm7dXJ?=
 =?us-ascii?Q?orEIelyqLh1OFNqDg4WGVq/IW5pjnvBkosQtV507myJWeGJ4n3WMTV+zGbTU?=
 =?us-ascii?Q?n2jg2LJUWDOXxmTJ5K9PwibS/BZGTSb02qVfCnPD7tze/f5YQapmih6LaGva?=
 =?us-ascii?Q?ZKqoR2APedDUkniKq6Tos2HVxzkaKp8wq2G/d6NLuvnMOwpNqygBFZzFr+h5?=
 =?us-ascii?Q?4WnR4yMHMS8wgblHVMVJydKaua2U6e2b28XcJriq5U03Z2ZWfcV/rTXzlLgV?=
 =?us-ascii?Q?eA1zd9L+iEtOlw2mbXfZKupeP6F5IMC2heua2Az6jXltTAFl1E67asW+jryQ?=
 =?us-ascii?Q?/GLSssadJze/3Ep2JGDMkf2xjb5FmfUOD+cycKUIPN0CfUIVD7yUvMa9Vfsd?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	D6U93gsG1Jwv/ZGWlVuf7UOvT94LrrcXobW8tMcq5c3qQ7eXwDlVE0TOGKRkHk9oq6KAhaqByGzdu8kQ/04qEN1HY97vyeyFD6CUt2aTAo3yrrAfQ4LEp2tB/pFvqoAEQg/K7wgW2dCKBiWJnUB90hN9nQ6tKq58l+cl+2GuK59z3sQubL4HLtLdlugU4RybsUBJDj21y+aNHkmDMB1gPpZc6Y+ww1Hwntr8ZPCxvcEWp6A9iAnybcVnmZjQ6r2y2UVZqlyj+q21XNQRIARRQQ+p85PTxxYBVKqSHyGtCXUoD8uswNbYFtzdMKWia70VPC/UStY81l/t/+3hel0wUqgMWpeqwDE7q6/9ukMIKo/Nf4AzEh02j7b4KYpaaykCpfGf9kOqjl1whUZksdfj1R9/pNpZsykdL+m8P08EGF6po0i/g9PSudGzlGWPtI8JRhDliCxH/6QwwZ7qLloUuJwPq5ns2RDGjSu1www7xMeyxdcWdEZAXq33NQ3U1MoxktxOnHg+d5qpJccgU3J5gpAE/3f7bqPNVKHQ5/eA032rKtGRA7p7pROw2OsJJexou5DplvFJUo0uZ6R2/XTEvEV+chydcymAFQ03OFFOYrY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462aec7b-195c-4ec4-2207-08dd8345fe3c
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 15:37:59.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D919Hkrl8UOykHKmFt+kO2wEjY9axhauQ9/FZ1eHj5pXl1L1NU6uBJYHrsZ+cmvfHTe9BUsmZcfW5YI3W8km6N35Ok0ZM8XIQxRlmNYg0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2504240106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEwNiBTYWx0ZWRfX4tYMF46xpkwZ AMgZfwiZ+k2IjWvQAdg6+qgomuQTCUZJgPN1zeXGkvx93BpTNOMB+cGXoZTLnHKAPomZ1juKBOs JhmRLb0cNRt+QQ+WBAKSr4HtbzVtU67J1hg3Z7rS0Tr+bfdKg7r9VG0AWZ6CSqv4ILkwbUjgJAl
 7PZY5lGwC2spiK9zPz7co+vIfpTVYeLuSI+2ccNWAGwbT2LeTB/o4dsvjE2cdOlPyORgUsv6C+4 d8hg1y5ZzqXvYH8x1Bz08tiMOEfrsTs1m3uU+eHMjX1OeGiiLPBysvErxsz5SjKhHxCJtHBDFUO v60S/CF33BNFlFuqOjXLfTTtJGQYvp+v0BCY5eRxTVFGWUXYWycEW+twJ5ktXjK0+wWYzmOiwUg A31j2XhN
X-Proofpoint-GUID: mAWjY74dCnr5MWjWOHtZmQtBL035YIN1
X-Proofpoint-ORIG-GUID: mAWjY74dCnr5MWjWOHtZmQtBL035YIN1

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

On Sun, Apr 06, 2025 at 01:19:17AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> For a number of the cpc tests, we get expected counts from perf.
> For branches and instructions, however, we can determine the
> expected counts more directly since there is one branch and a
> fixed number of instructions per iteration.  Thus, we can derive
> an expected cpc counts simply by knowing the number of iterations.
> 
> For some compilers, however, there is apparently some loop unrolling
> even at low, default levels of optimization.
> 
> So, revert to the perf count to estimate the expected cpc count
> even for the branches and instructions tests.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/cpc/tst.branches.sh     | 2 +-
>  test/unittest/cpc/tst.instructions.sh | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/cpc/tst.branches.sh b/test/unittest/cpc/tst.branches.sh
> index 87250c371..442d65332 100755
> --- a/test/unittest/cpc/tst.branches.sh
> +++ b/test/unittest/cpc/tst.branches.sh
> @@ -53,7 +53,7 @@ fi
>  actual=$(($period * `cat tmp.txt`))
>  
>  # determine expected count (one branch per interation)
> -expect=$niters
> +expect=`$utils/perf_count_event.sh branches workload_user $niters`
>  
>  # check
>  $utils/check_result.sh $actual $expect $(($expect / 4))
> diff --git a/test/unittest/cpc/tst.instructions.sh b/test/unittest/cpc/tst.instructions.sh
> index a7fad3e78..34112c6e7 100755
> --- a/test/unittest/cpc/tst.instructions.sh
> +++ b/test/unittest/cpc/tst.instructions.sh
> @@ -61,7 +61,7 @@ fi
>  actual=$(($period * `cat tmp.txt`))
>  
>  # determine expected count
> -expect=$(($niters * $ninstructions_per_iter))
> +expect=`$utils/perf_count_event.sh instructions workload_user $niters`
>  
>  # check
>  $utils/check_result.sh $actual $expect $(($expect / 4))
> -- 
> 2.43.5
> 
