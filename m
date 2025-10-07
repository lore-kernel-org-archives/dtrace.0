Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32343A1D2
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 22:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759877494; cv=fail; b=cO5QoGw+TmiC5UyaN3FCJA/e3Sdk1+pZURe07GD6OlCljdfRjMKmMBRHsM30WlkcQxVEP8F68j0tzMuYBFQXmCt4Cdvm5yLK3aESm1rB0cUdJFaXpcOzwgtVc0uXrHP1amF7FT8vl0fELHk0f3iiG6qWZtkeoP1E5BKT2eVnU2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759877494; c=relaxed/simple;
	bh=mBvccVFuoEHJX1oidbQn8/s2L8kxuPrHqpOIgimFeUM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qHyDnoMS6rfHKqWbwOyjXtgeYypUFjBKftWudjWSM2LBt6RIUVyajUjw4h6ofWnexkn44lvTkxDD6PuXtA120+d7a0lqE9btFAgJM2U2ixnfVMcYPjHHRuiXZms3mbt943yxlJUToLMH7o5EuS3kug5boOFjyMN50+RPKSAOjEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FvhYnvnY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xULZHT8Y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FvhYnvnY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xULZHT8Y"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597MDtEN028939
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 22:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Habvdfj2NXhZP3mzXpSCctIeqX1WfYwRDA3+DRanBFc=; b=
	FvhYnvnYQvMHTTQ31KR0Y6wCLObdeXeN1SpZzb9aSIMQALdxqGZSlVjnbRijBtHZ
	F49OyR6eMvFy0eDMPenK1JQRycW98OHVioZkxcXwduzqg7Zuy+yJZHE/LhLl4ONx
	kGbVvLAk2UMeWB4ndDNPm4EG4YcSMp3qLHjUlHNKRJOKg3udORmyQSKwkdXyOLpk
	fVU6Z9ay5J4wCGXz85Ih59FIz2MW+FjijlLcspmwUu4gRziOXexR53VBQz47vAUp
	k0hakuV4pWN4Jn4M5xa1HR7meHgG22//KdMgM8i3e7/k7BqShsPPl1njIOy4rwuH
	jGnzvJPjxSOyfb9bmjRyfQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nakr03a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 22:51:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597K2Mb7035993
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 22:40:00 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18u81v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 22:40:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwCVVtXXmjB7rf66EvH4A/pRM9+JGiz1k4xexVo8EV+ONff8eWQayzS9pbJCANWJ+FFu/jE34kbQiigZqBf2MK+BOIa7grc7HP+xErpynthomdItrzEDduz6LNwaVeG/3usCMlp1+sdYn4QVwdSjQ9JzaitSmy1zIG1DxQbnWBtB4luB1/Knc6mo0z8mC17vRfpxTTq66yS3C7RVxteY/8ZatLM/NJ47TTNNWQXVR3cuQfahrKbidZlwCXUv8ZxAQ4eCCpM2d9SOQWocqPE4YitI+Etq1NUOLMfCzOgYLkZho+JsRbFive+aaCttDrAx5F45ZVCYGxsEPqBdhRTruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Habvdfj2NXhZP3mzXpSCctIeqX1WfYwRDA3+DRanBFc=;
 b=DGFFcWKYw16UT48vXeArfXmb3+FVQ2Diy5vqBjgY/gPguZZ7UUO1h9yzZ+BQPUre+nSmX0T3sa1YrqdDVo/D9t0MUzdnha9+Vy9RK8tjpkPwjXpAjoZhRaBO2G1MwZDjuTy5ZRP5mU8KXai3NNcyGYZ9w+cqpgZSKL/62JfLexI5FWSIU+FHgGTH/+it8o+MfVwaOHZQKqj2MkfIemlnWIjUla7ZWEiStUngk+y6ip3WjpkZiRxUR80VEMEIkZg9Bfp0Z1trDo+rGgJ1Pv8QhGqRKsCR3ppjaf9vnsQeVnpbqcpcuCHrKY/KTy19cB4VZSTVIiuTSPpvaHW/qdW8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Habvdfj2NXhZP3mzXpSCctIeqX1WfYwRDA3+DRanBFc=;
 b=xULZHT8YMelJL7DsDbFsdomyxvPRoHHnY5yYF9tZKppdU9Gk0Rj1LCw0hSiFDgaC75kyxihE47gfsd+0jOXaibpL90BLiLWqEETOahzcqQEoLbHBBF987s+AL2vGfIeYr92iKptID3sJg9P8uolDSoUcabQzvBJf7zQJBwXVq40=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH3PPF63308C95B.namprd10.prod.outlook.com (2603:10b6:518:1::7a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 7 Oct
 2025 22:39:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 22:39:52 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Account for variations in error messages
Date: Tue,  7 Oct 2025 18:39:50 -0400
Message-Id: <20251007223950.31241-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0066.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH3PPF63308C95B:EE_
X-MS-Office365-Filtering-Correlation-Id: a7aaa82a-2f99-4f2d-01d5-08de05f26e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eTiC0P8/P/7r6oP0+HEfX1rqAmd9pIN0WZWvHnwxPxMCz7VHqzGhmXiSmc3A?=
 =?us-ascii?Q?Pd36081WQejMM86NZ3jwKUNPCsx+YeoH6JGA+mjXOF7mChiQ70rpfN7wB2Qa?=
 =?us-ascii?Q?whkl6WFNCb7Wgjd7+5qFpMr2DH+QGn6IaggBOjufQx62U7u0XqgS8DJJtORJ?=
 =?us-ascii?Q?Lpg34eiExAyMLhuJJ9IqsNSlsZSN3h5C7aVGbK57wQtnuvKECGaT8VFrdEQx?=
 =?us-ascii?Q?Qq8Ik2pJoo6rxB7NnDhtCa+rIiisBZ19H2R8ajLB4AYWOyOeQWJzgosbPIGQ?=
 =?us-ascii?Q?0HIVE0JssVKqwujU05mY9rvF8+HIXg9Seu2D7AnJHMeuVF3luAiEeomwI1fu?=
 =?us-ascii?Q?TlIomugsBcrRoY7Wytu2SZingD/B8ZQQbHoRtiao65b416j512CuMwtGPUgD?=
 =?us-ascii?Q?/DDLpecJHhGFUEX0LERIi6yTpK2oxTYbFWSiuyKYlL+lfzwKPwv1kFwLHk6Y?=
 =?us-ascii?Q?mIlkjfm1HSrrmi/r/B1k9F5jsOiE4Ra5zpITZ+qT0zulotzwxWXw9HFYg38I?=
 =?us-ascii?Q?MvIfFJ1pAzt9zBjLuZLF3jclZZFHLkJQ4nQQznojUmYDNyl1BwH/Uz4X9cA1?=
 =?us-ascii?Q?Vi32IByC5TtPgIg7gzGAJWi0DFSRzbKoQTIhMGkDN9fiMcVzfIH/UU4WjIyB?=
 =?us-ascii?Q?IRhCuYZ3BSV9kqMDlODXoDz2AIzJimlBQDRw+H+LVUUh2n8l5NHtHuZCZtPx?=
 =?us-ascii?Q?EIMuPgyECG97aQU2ljVPmUqa8bPtFheGBGVw5q0aAuJYhbSluKNVkEWSk4rG?=
 =?us-ascii?Q?qC36OUFkdGIyAUXOF9Ftz3ppG5dlUIkXEY4Vyk7ZyVITxFHMKkEJcGRj+FtX?=
 =?us-ascii?Q?NzhDjtJgszT4LLz54yakigdp+jecy7xL17sT721WEIoBU8UXiPLTQ1wankSz?=
 =?us-ascii?Q?uyfeyZGq8UI1VcxwTXfZ1V43m/AfZcE9zByBURii+uCV5Sp76UGh8VjHyWdS?=
 =?us-ascii?Q?Qyn9TIduzSAddTsIrBCU9ftummFvg5E0aK+Hri//Bbtlm+SJSWJD6Fi2nX6v?=
 =?us-ascii?Q?XhdSmrQ8+oO3UhGJxEZwEa9u/wQMzZyiXXCQuEWp1uYWI26Sic9VsqRo5Evz?=
 =?us-ascii?Q?ajkYQBMDBbe9lB9PAdJAfcLb9qB4abI3XI50JkuJesIG44jC1Vyxjsmog3MV?=
 =?us-ascii?Q?vsTWwPEkU6KbjWW0jYfozCv2CANs1gOMSYK3IBxTGrMdVGOaFNPXA1hkBEVE?=
 =?us-ascii?Q?06EIOWuCbsBv4y+sj+2n0EJEYU2eQrf/imBMjA+TqcOn3wtQEjWPOwUtbm3D?=
 =?us-ascii?Q?+dM93HVJV1Mlc/x2KriRvfiZoe1LN87mlUCH+Tprc05rj2p/LC5Iaqe4dkRr?=
 =?us-ascii?Q?Qic9fpjik5eX9KNsK0kTo/aAnbz5h0TtJ43Y2sDGpVSvLFXTCojIOsKRkH8L?=
 =?us-ascii?Q?qOlwMsmmc2Lj8s4AmL3s5AedMus7ScIeCiRBcwoYy2oaUeKDeJrltp1mtCMT?=
 =?us-ascii?Q?0+NHxyz24t1zq1Cl5534W73TKcU/COBoJ3/CNxEwwPETUVBxKCtXUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b0ppnm6eXlKsRLeBDdTdsd+3HAo46FmwWsRtMudKY7f+IOvn/ubGRrGkQV+Y?=
 =?us-ascii?Q?edyRu06wZzB7plVGONqLymxhsaJ2FSHBM9Fmmb0gUfZJ/hEuPRlAhwfxSGpX?=
 =?us-ascii?Q?QzozIdSfS2GctnGjR/8gR/8t3qkp658qFukJgg+EIjrhK8PF20GGLReA6ar9?=
 =?us-ascii?Q?lhav3d324G+p6NcROUBwiEpLuYuiTntjRNDj5Je2DUxuw65EiCro7LaJO2nD?=
 =?us-ascii?Q?6Fe2lnW0m+pVouXQlCAelEGKLJIzv5OCAbZu+qEQOyzY/f5rS5ebBzPPCD2x?=
 =?us-ascii?Q?w0DzuLM1Z5FvCjVbSBfFHTq4SGjbifnV5rUZQSmX3ehlqJOc4HYeq/YlrH5g?=
 =?us-ascii?Q?ql31iVNMQ2OVvpS/Y5CySI22mwAQKZrjsMw+Nu2N+Mex+o2A/80n5G6Zf9HI?=
 =?us-ascii?Q?unUihx12WJKobxNxGxqi9QVZiv1HQOo3kSXtNmiOQ0hUhwYx+eyllKOxHYJS?=
 =?us-ascii?Q?uH2ldqbMZ4loRp9FV1wZmQp0yGBEBr0ZcBT/u1MdV08UO+FMSJzHgsGKN70O?=
 =?us-ascii?Q?67IwiHliaqz0HoH+iKsGSxVn/syz40+bclZdmBH+c1XF5juu06hxmwyPOPRG?=
 =?us-ascii?Q?5WaaeHSlnfOeBpA0m5xwEe7mSWH8upudTXqJjwim2Zxk0M6sQ1qoOghBJr2m?=
 =?us-ascii?Q?GRAQ3BTy5Md+8IuuiLaBVjZsgtH05dkXQz/2x5t+1WYPyqaD8/MynK7UQyv4?=
 =?us-ascii?Q?Y4kNbEYWPK6E3qJb4B/rull9zNLfueRJp0b+1xOKCZ5UV0B+7zSYSEvyyg2v?=
 =?us-ascii?Q?O+PAIGwuY8uQcnfJGF/pATm/cyEshm/O/VAOSLMGBZv/cpHPar9xSQ8XyDeM?=
 =?us-ascii?Q?a81dx+lYNqTfYRshSoEkzry9AbuPeGTWYaW4aOtTVIEURF7vBD/eWvmRUngM?=
 =?us-ascii?Q?VPpfsOhLR6j3J/PUEth/mLNjQQkrUGdDYZ3zH7+pPSMWq3WflmRIO+s9p9YO?=
 =?us-ascii?Q?gxgzPhWFYfbXpP64sB+Q1OSFD2uYb7LgrZRzlYh85f3WhascfDKMqFW7eRY7?=
 =?us-ascii?Q?4EGuyRdoYV89WTKypqpEICDMeIZFiDiztUheX5TfmYzhZST+AmDkxC92JlsJ?=
 =?us-ascii?Q?9aSDR1cFbFdLiSti5lJTCFdp15rUGhupRh7h2VAuJbcwF8Xu3dgfwaWkEImJ?=
 =?us-ascii?Q?VUGQ9JpZvqXx4Qgr898nzJ0kihCCfWhIxxe9gkFq1fcZj8ey100i0dRG6FNn?=
 =?us-ascii?Q?aQ1KC7iL+1wAtfp6lJam5QISpgUXUMrKvlM5+1Ll3SL2OZqU2oFyRCcX0jBH?=
 =?us-ascii?Q?0lP1GtHosZpjzAPeqXKimlk3vPNiugrNjTtRtTwYWGH1y/r5ZAuOCACJ+Qji?=
 =?us-ascii?Q?PRud0qlXYLbU+9EkwWtK+4ExguYoE0WHoic1CWjwtfffULGB2SSYcGmjtnDz?=
 =?us-ascii?Q?REXapm7u8LrVs6HOU+qCzHz2oXk2MozeVD3cyIVktPmhkPMugtxxtGD/LPxH?=
 =?us-ascii?Q?DePtTl4iMdW4WavV8gUIQjgz/kIUcWJiba2RM1GYC/XOmmOq73LqILFN4mKS?=
 =?us-ascii?Q?dRLaI+U+HzDTOa6ubvZE9OX4IsvAqaGft+gjd2CQ4SL3/p59GxZuPwFXrkIe?=
 =?us-ascii?Q?4QmUEmXcSoS43RUAes2mVOc+XxxeF9BiColcXcal?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	H77fRKhML1ioCJqW0JZzYCELk7hqH6dm+LlqVEBYcQUnCd+S44vMpB4qOzG42u5iZpgLcJF9GQ2aoTzaFmowxpNOR5CGcKWLS1vkDBj0lF6SzjbSyitJf+g19xGT2QHMb1D4QvcqQ8zXSidM9pyORBxN2bDIQ2jqRmQaNoL1rzRcU6U8wR65RSihf2U00ZHW2XfftSJAxBluTW+KOr726zDaxDhmodKnrQIRmMbS0Oi8ypWXv/s23OX8uACoruxdr3kpvpTRBqv888zOvQo/ty54nodTsc3OWIWgG3lI6NlTEH8TOtUuo1tRPLkChgOCKwijoitLsgPi1ky6+yn7Osuqm89NSOVrb+6OzZLghq80N6sQPKrd0cVhAKiCTCw2g4GO94IACvlFjq2qZ8FfZyGI/aF88Tou+/b4Me/ag17r8rMZC+wHpOzi/04qJfvbnXLjoz7DMOalfBKWzdnJ2Rwu0yBvKuFzcUw4zNhHvgrTePPekNAGbTUuWuo+9hRswFibuUQaA6BuvKA8TrlUUONJ+lzDpW2Ta1651QxV1ZwaevRSELLV0gQlWFd7imBnJ135Yoo3cBFAqiFs5AQaMCE53y1sPBoWPbB1ipYGyVk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7aaa82a-2f99-4f2d-01d5-08de05f26e83
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 22:39:52.8896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rPKjSukfnTWTk+0lmRdy38kXYVR99jCDMkvAwbNCElao63e9fuU0rs8DC1ZnIo7h2TOKrVfXGCGt92xl3t7hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF63308C95B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510070173
X-Proofpoint-GUID: BuylrxmpntldsGH0ShA1G1Uf4Wbv4kAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE2NCBTYWx0ZWRfX0cq63p76ycJg
 w+ZW9081CrDWeTz6kjVT7sZKSxFLX4jM/MScxaATWn3Ixf8yxeXL7ciYO4fxYYir/mlJ5x2sJNP
 dEx2H+lXwFY2TuvCGgavNwE29mHFn8vbFEvc+6EN3Q0vDj8KzOI6Zn6imfo38fi0wQ0kG/a8nE1
 U7dXkXqrQwCLngBFk2Tjz0gPf2JVTY7Mxp0/GJC83dPSXcY+MPlLaCNZ0RLFyjMCMYA4Q4XcUYC
 3iBMDXBDBDpi/j0Hz40NjhvGpUgfqtszIpkeseRMKO/LWYpleS+Z6V2zU/xCbKggPAv6pov8NDm
 IbTxhyl0Ny39TBUSyVGk0zzQg4hO0tT3gqopt9qRWDEYsbXmRE3U3jI/WitXAnF1B3O9zY4YFvx
 g6eGlj2CPBwSFlQZb/+5N+HULR73T7rL23wGguLe/ctBU+fUwO0=
X-Proofpoint-ORIG-GUID: BuylrxmpntldsGH0ShA1G1Uf4Wbv4kAh
X-Authority-Analysis: v=2.4 cv=Vaj6/Vp9 c=1 sm=1 tr=0 ts=68e59973 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=sWKEhP36mHoA:10 a=yPCof4ZbAAAA:8 a=sjm0V57joCqfTXn6f-cA:9
 cc=ntf awl=host:12091

From: Eugene Loh <eugene.loh@oracle.com>

Clearly,
    test/unittest/enum/err.*RepeatIdentifiers.d
    test/unittest/types/err.*dupenum.d
are impacted, but so are
    test/unittest/offsetof/err.D_UNKNOWN.OffsetofNULL.d
    test/unittest/types/err.D_UNKNOWN.dupstruct.d
    test/unittest/union/err.D_DECL_INCOMPLETE.circular.d
    test/unittest/union/err.D_DECL_INCOMPLETE.order.d
    test/unittest/union/err.D_DECL_INCOMPLETE.simple.d
due to symlinks to libctf.r.p.  And dupstruct needed a fix.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../enum/err.D_DECL_IDRED.RepeatIdentifiers.r |  2 --
 ...tIdentifiers.d => err.RepeatIdentifiers.d} |  7 +++----
 test/unittest/enum/err.RepeatIdentifiers.r    |  2 ++
 ...ntifiers.r.p => err.RepeatIdentifiers.r.p} |  0
 .../unittest/types/err.D_DECL_IDRED.dupenum.r |  2 --
 ...r.D_DECL_IDRED.dupenum.d => err.dupenum.d} |  4 +++-
 test/unittest/types/err.dupenum.r             |  2 ++
 ...DECL_IDRED.dupenum.r.p => err.dupenum.r.p} |  0
 test/utils/libctf.r.p                         | 19 +++++++++++++++++++
 9 files changed, 29 insertions(+), 9 deletions(-)
 delete mode 100644 test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
 rename test/unittest/enum/{err.D_DECL_IDRED.RepeatIdentifiers.d => err.RepeatIdentifiers.d} (78%)
 create mode 100644 test/unittest/enum/err.RepeatIdentifiers.r
 rename test/unittest/enum/{err.D_DECL_IDRED.RepeatIdentifiers.r.p => err.RepeatIdentifiers.r.p} (100%)
 delete mode 100644 test/unittest/types/err.D_DECL_IDRED.dupenum.r
 rename test/unittest/types/{err.D_DECL_IDRED.dupenum.d => err.dupenum.d} (74%)
 create mode 100644 test/unittest/types/err.dupenum.r
 rename test/unittest/types/{err.D_DECL_IDRED.dupenum.r.p => err.dupenum.r.p} (100%)

diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
deleted file mode 100644
index 424d6b077..000000000
--- a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d: [D_DECL_IDRED] line 24: identifier redeclared: GREEN
diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d b/test/unittest/enum/err.RepeatIdentifiers.d
similarity index 78%
rename from test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
rename to test/unittest/enum/err.RepeatIdentifiers.d
index 43837c78a..0dfd7b86c 100644
--- a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
+++ b/test/unittest/enum/err.RepeatIdentifiers.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -11,11 +11,10 @@
  * error.
  *
  * SECTION: Type and Constant Definitions/Enumerations
- *
- * NOTES:
- *
  */
 
+/* @@runtest-opts: -xerrtags */
+
 #pragma D option quiet
 
 enum colors {
diff --git a/test/unittest/enum/err.RepeatIdentifiers.r b/test/unittest/enum/err.RepeatIdentifiers.r
new file mode 100644
index 000000000..860ffb5c7
--- /dev/null
+++ b/test/unittest/enum/err.RepeatIdentifiers.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/enum/err.RepeatIdentifiers.d: expected error
diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p b/test/unittest/enum/err.RepeatIdentifiers.r.p
similarity index 100%
rename from test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p
rename to test/unittest/enum/err.RepeatIdentifiers.r.p
diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.r b/test/unittest/types/err.D_DECL_IDRED.dupenum.r
deleted file mode 100644
index 0b6369e52..000000000
--- a/test/unittest/types/err.D_DECL_IDRED.dupenum.r
+++ /dev/null
@@ -1,2 +0,0 @@
--- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.D_DECL_IDRED.dupenum.d: [D_DECL_IDRED] line 18: identifier redeclared: x
diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.d b/test/unittest/types/err.dupenum.d
similarity index 74%
rename from test/unittest/types/err.D_DECL_IDRED.dupenum.d
rename to test/unittest/types/err.dupenum.d
index dfc74f250..22001e5d6 100644
--- a/test/unittest/types/err.D_DECL_IDRED.dupenum.d
+++ b/test/unittest/types/err.dupenum.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,6 +12,8 @@
  * SECTION: Type and Constant Definitions/Enumerations
  */
 
+/* @@runtest-opts: -xerrtags */
+
 enum foo {
 	x = 3,
 	x = 4
diff --git a/test/unittest/types/err.dupenum.r b/test/unittest/types/err.dupenum.r
new file mode 100644
index 000000000..153985568
--- /dev/null
+++ b/test/unittest/types/err.dupenum.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/types/err.dupenum.d: expected error
diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.r.p b/test/unittest/types/err.dupenum.r.p
similarity index 100%
rename from test/unittest/types/err.D_DECL_IDRED.dupenum.r.p
rename to test/unittest/types/err.dupenum.r.p
diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
index a2b4602cf..c81e1b709 100755
--- a/test/utils/libctf.r.p
+++ b/test/utils/libctf.r.p
@@ -1,7 +1,26 @@
 #!/usr/bin/gawk -f
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
+
+# Possible "enumerator" label.
+/Duplicate member, enumerator, or variable name/ {
+    sub(/member, enumerator, or variable/, "member or variable");
+}
+
+# Possible trailing '.'.
 /Duplicate member or variable name\.$/ { sub(/\.$/, ""); }
 /Member name not found\.$/ { sub(/\.$/, ""); }
+
+# Could be union or struct.
 /enum union pirate:/ { sub(/enum union pirate/, "enum struct pirate"); }
+
+# Older or newer libctf diags.
+/\[D_DECL_IDRED\] line [1-9][0-9]*: identifier redeclared: [a-zA-Z]*$/ {
+    sub(/\[D_DECL_IDRED\] line [1-9][0-9]*: .*$/, "expected error");
+}
+/\[D_UNKNOWN\] line [1-9][0-9]*: failed to define enumerator '[a-zA-Z]*': Duplicate member or variable name$/ {
+    sub(/\[D_UNKNOWN\] line [1-9][0-9]*: .*$/, "expected error");
+}
+
+# Print.
 { print; }
-- 
2.47.3

