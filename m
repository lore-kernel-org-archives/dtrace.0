Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5C22083
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825296; cv=fail; b=PhAZFQ2qLExb/oTFTGgpLlriMduvx+Yeb3UIuepmAziZCUvr9ZAejGbaCGSsXT2nPy/Wde+Ci0OJkuTyInLia4ee98vzGucnCSbMElEBx1BY7jJt5HIsPbvsfEyTb9RyBLen83exxB17UozThE1vNTDqmuglGkn1lU5L1aXtxvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825296; c=relaxed/simple;
	bh=jwwT97mueRchp0WYajTM7tD/q0AnToCG5/tF6Tj5KVE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bcgNwycjHZz3s/RPTdsU6Wx5NVhl5Kj7rzuHLi/E/7YBk8chNw7//STTIRCG7DX5T3eT4qcUeFHiIwGEvP8X0POwTKvMC2gLmLFu0xEl2c/pagkiGsID1sTQZlCPa6G4ErN4GEoCpwg3znaE+0Et6To0Kq/CsECZbsI0DBUsfMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e1n/KS4b; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lzNRtst0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e1n/KS4b";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lzNRtst0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMietC018890
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IEJ+Q5FMjXnEUJhr5l
	bWmUPEGzahHr+Q8fVlqA+Gzg8=; b=e1n/KS4bxGFQ3TO9PrRK6hmFisS7ZQLnLA
	fiMwI8J61KNGNjYC+10erDs2piF8UaYbkhpnCEVBlb3REM3mfC57ThvKtJoI3KR1
	jYsZP2LMLEPVvYJVbxDs2croOPEFW7nnaQj1c9QK4r+xMAuqkm1Zq/AMl4fl7ZQU
	GMV83u8FHtWkkT/WoHcm+0Jj5+6ZwlZZN8RKg2p3meuqIhdmoY3+qBs9QFhY/4OI
	TWunf+BPCUPmCnt30YBPpsG2tLlTy8ZdcZAT+iBlTZpjb0ckP/o2kKthU2CgSDSc
	7uLdQ6vXTqqdW2ANk8YnNVevWNE/tvY5lGrSyxtlOUFLPdgqZhGw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxjjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1wdX7005009
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hm0h-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOJI448YkHMOdggc1kOwUhADwTL0fAYgqAeJ3ywozcEp1DwJ9cWIr4wIq9FjmAYj146IyTnH890e/ccx0ynf55usZy509cV3x20xNhef3uic+Gpvk7poOr0we1NOMibED1IKxDj1Cl2is0AcwDNOKRw8ONLTucP51SSYSO+2Gb/yHKti/cuAscBvfaVhNPvzDHGAn3rCsIGAHR+KKPW6iaPgoFBOVvUFacyIzgR14juK97qkkJuzPWPC+wYwx+8UlgEDdXXL4EvMRpg20hZZMJP7xo6iFr4txBLnj1Fl6SLLHQ0UO55s3f1Tvm83ujOcKR+It/GP6xcMNFdFKlz76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEJ+Q5FMjXnEUJhr5lbWmUPEGzahHr+Q8fVlqA+Gzg8=;
 b=D1buxux22JzeCXOi0WzY38XuRBuPZDCurNY30WGD1OZ6Ehw6GeIrqZT8oNBH8SQs7W8Pe7aHHPboLjo6bSofotVCgmh3VQws8tqQ+CPjWSMxQ8Dh2bNX0Wvv4f1ZN9IKG/mx5HftGakx2peKipKYU+mS5c5DQTArvobclK7qg9kTb3vtr+A5zSuEpARUST+5pDFclto3Ff49G1M19W9qNoOkHtn5zicGfMahOf9nPj5uxEIMH9ibG80/YlOryp1oKQcWUkqKaU+zEAQRBBmqbEvSZtfvQB3MGNbT70ZAQ9cyTkFzlyE3AwNoBbWK76ev0P/GB3HDKKmR100loKs6Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEJ+Q5FMjXnEUJhr5lbWmUPEGzahHr+Q8fVlqA+Gzg8=;
 b=lzNRtst0BJpKqIoGnkwgnjJ+C4ne4i6WZDBF3J0jiTq/F8LIXTFeYZ0xQWfG38CxlCwqha3xgz97qNcMaE/X6hllFoox7yH+ulHqC4UX7uolYMmGiVMo9jjyJKM8Epsm2T52eM8/zA1qGukaQ3vZjmqOf2PQy0PcHp2RNVstx+E=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7564.namprd10.prod.outlook.com (2603:10b6:610:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 04:21:31 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:31 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 14/14] test: caller and stackdepth tests for lockstat provider
Date: Wed, 25 Jun 2025 00:21:07 -0400
Message-Id: <20250625042107.13571-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 873ef301-4c8a-4a74-b0d9-08ddb39fc352
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?36jiImROUOgjjKN54KYqP0dj2cnTIN39N8Wp6S9Lrm9QkspJrwqi9N9plITr?=
 =?us-ascii?Q?nGPjZWdPcZsvUud6kyfk9wZvTWt3Mer0dzpCS+P93l/3x78FhVUx/9UkdRrj?=
 =?us-ascii?Q?BIpvrqHRP4E9wRLYt9afS7d1mNQMBh2FZ272cuDD2jYTFZm2aS3eAfac8SqF?=
 =?us-ascii?Q?FbWnvtGX9SZHl1aWWtDBo6SvxKfD7R4ieNcZzYrvkaWsij3CBi27OTSyVKQi?=
 =?us-ascii?Q?yCTu25Z4rNiejscUoCdw6jU6wIGckQ8LqiTSakLO9HvQqKHyS+oVhSZl9SnA?=
 =?us-ascii?Q?6X4l/1rb+ssoh8iV6ffxEqtHVKNq3n6JeJmpswCoOkc7VjmYY/pzwo3w1e4b?=
 =?us-ascii?Q?qUut1lKmP7fhMYgmIT/ZDnkjD+T4FHJ4D3oP7ziLxWfgkFGaYAq3IvRaNFBl?=
 =?us-ascii?Q?nodYxE4Sli88yHq8ViOg6dm8P/6B6M8xe7+JlxnkDORZTAjNpARPKxdLaGa8?=
 =?us-ascii?Q?89D/4sEjTcxXMSvTEunQuctPqu3F59EFGFbleHZyiVnVInZpAMiZMWY2Ovkx?=
 =?us-ascii?Q?mZXCMTZekOLv5Cyo1K7SmxGXZEd4B35Ar++D52Y80HwVfJcXSGLVqNbqdi1d?=
 =?us-ascii?Q?pOSpoiM6j+RY+E80A+yEjNWDy01KUC41iDp6WPms8s0pids7ncUwsL5YjHQ/?=
 =?us-ascii?Q?G0OJJ+MvRSVzR+6zuPnTnD2dj5Fflh88XFuODTTR287SuXQy0SGOkFjNgc1k?=
 =?us-ascii?Q?QSz6dL4trsS3r2Psyncry7IcHmaB+sOM3GdaydT699zCK7TY3OSkEQiuFAme?=
 =?us-ascii?Q?3G2O25R3VSK48rEJo89M6TTs0czHI2urXiYoRF6LklRLVAXQ10zxH23nBSi+?=
 =?us-ascii?Q?4GueVFqgWvNLV6G9d9YUXawa/TAp1m+QvtDPBC5zaoVPGF8b8OjSeUO0V2Ml?=
 =?us-ascii?Q?BPOQYRWPhgCewS2QI/FP+XlDxpFUmqp6Y87HRqmRRyTSqJOv1ZDDBjXGbtYe?=
 =?us-ascii?Q?yLXqyzDAz6VDZRNLwmIf4fs3nav1kCg7vRiZCDKH+Csm71d38U4t+4GntV4Z?=
 =?us-ascii?Q?kcNPA5S2K7vrvbk7OmI/GWHhFenmZf32k7VkKOqyXrmOokY5IaxxYHLrZTzU?=
 =?us-ascii?Q?MRN+WGwSue2dtbgbF/tYbcvitYd/Tyqh7or2UdPrXtp3tUeKd9Ybo4s1n7zH?=
 =?us-ascii?Q?o+OTMsyOKcblZWHS44K8HbXmbZiotDI672S7o3cPSg7/iId6uqus/DDjXCir?=
 =?us-ascii?Q?Z6Dge5xVbnHruI17IDpmA6JIzR2XQSduoYXqD0S516LMhNmdI6hCzt5J5wQ5?=
 =?us-ascii?Q?FlggEbQ1O1D4riOEKTd3ICDxAAtJ1RCNMoz7/J3WjeSYbuWD4sTExFLRFqfh?=
 =?us-ascii?Q?8S9cqeWVMj0GojzmACctTd2+cSy8xAlPBQLarHU58Lz/NS0tYkWFAMHdTa/3?=
 =?us-ascii?Q?X2+NXZA+XiEtziQazYaOpjWDMmiK5waExoANUCwn+F1iEb7sAHiZxI05ZzO4?=
 =?us-ascii?Q?QKI7o/qc9EU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oiZi2P1PGcmQCp8J1HpCGNpFSNXZcV66r8SdkCt5HfDQGvKCjHuLjLKMXqsi?=
 =?us-ascii?Q?OCB7SYgi0d1QlJL5uJS5EPJ2bxR7zffE8YiZp8MR+oa7NY1Sxp8FeF24hA1X?=
 =?us-ascii?Q?u7nJitS43jd+RsD58ihrV2F86HJXD7pfQPqgvQosHm2a/A+DYX0A6jiFp+7P?=
 =?us-ascii?Q?rDoRBKfZHkdc6x0ZKoBgXsApVWaGfaKS19s01aWilwj48BOEy2y+ABNvF5pV?=
 =?us-ascii?Q?ASBJ9SSpLm/RkL9Ad42pjRk1OPXp/Skw5VA6qc9ecl5Oh+CGThrzkMgiYwzT?=
 =?us-ascii?Q?vKrZ1gIXZlphyYM/8BDOZixd4NnEppzvN16iMruSwkbt0hoSoUS54MMaXwmq?=
 =?us-ascii?Q?8bDAqS0ZEqZkbCNlajAlbhZ1bmcbRnpHXQoBDIqP9/yczO2Mnh07WJiYVUcZ?=
 =?us-ascii?Q?eZzTLTmZuoolifKSdjIBvUqYaNQyU9u2OzoOxrIfx3/HCeygAg56QfGwEW43?=
 =?us-ascii?Q?QouPkfMQtMG/gNDobwgclVMn8EfAbdwNASi/JSzxAn75dEROmmNtakPAccbo?=
 =?us-ascii?Q?Rj4TzFT6QdnAU+Hzcswju+PZeNQ5ttx7baQXhg0vLGAj0Nh7QmjuyanAVw7G?=
 =?us-ascii?Q?fQQhXVVfHazlQMlHLeMpsJiATdKTd2XTu6fJwmoV0R0YQBkvfCTUQOUVTkFc?=
 =?us-ascii?Q?XcKFrXzbN0WpasRSErkuASfz7G6snd+WAvuuKdhSQJNxR9+u0smocx5LlzN1?=
 =?us-ascii?Q?ywOZSrk8MMZh87nFN7wfC3j+gSy8zKPbi5SIW5fKd4uq+IYnU5fc33VSn6RV?=
 =?us-ascii?Q?97WkFreEL+gX8/637z2LX9/Z4aiwqiP/REYR881Zddyg5ry8KStnWniWYO5q?=
 =?us-ascii?Q?qYitZXT+7L9ZVWl2QID9yr8G1faAv9Z/a402vryGcIsDP+EeIri8hN4ZcytO?=
 =?us-ascii?Q?rhTDajU1wNiqCqwsYKIcsMG6OwwbyxIK4+5E36LgtPAe1A+R2uX3gUpdKa3j?=
 =?us-ascii?Q?j/Oj3HeLLyJwr/l3D2xl9K/++nWaPhrai8tiasWfOu2k2KwcGIiF7H0xzZBP?=
 =?us-ascii?Q?kOGoN0jIyKTNiDV0YnQ2DGoQLXQSlS9xGDxXO9YNKYhC6+TV5MvmvNh9BMQl?=
 =?us-ascii?Q?oFt+QvJ5/3rTIyw8tJYbtKOy2O65wFpzhGd/ALPjlLfFMBavvNJHTwFWGndm?=
 =?us-ascii?Q?/E9YaKwAeYt4wesTVOlhpXH8cMwJb2JZWpfpFjXkDqndguEIHhI4Wsg6dmVw?=
 =?us-ascii?Q?iWv/53i1NisN/15dBtr/JO+kagMmxTB1Nm2KA9iimMSM7RZWFB7vpZ1TecYo?=
 =?us-ascii?Q?jLnLIz571/zVHNVO8s8hcoaef559HuxBn3d7pe07Ivv7z+ftEBV7B7wAGfql?=
 =?us-ascii?Q?0JKlqdyUGxedf1kXX+BeS88/gpR/YfnPRIwA01dnKhCTSokDNmZPgidwGGvH?=
 =?us-ascii?Q?dVWfpcJRE4SJTmIexN8vx5ugwYB6X481vmjPDPDkwvn0m3X346YDK40yE26C?=
 =?us-ascii?Q?0P1M2CK+tSjnkpto0F/x6CzF9RB5BkxyVM8raCns5cLaCZnS0HRuYAtFL+Ls?=
 =?us-ascii?Q?jr3hC8BCrmgd1APpQoWMSmaV8h5xmUScADJLKB3cqO2CaSiOCOR/JteXhzbk?=
 =?us-ascii?Q?e2I15i5gE3DKtkALrcIEq74QBa47XboLGiFA8J7Y?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CaQx7DA89IS86OjVKR4TuaKm0U0A2bv7NT8rWb04m/sDosASswnC/wH0v8cZqaO4NiMNGDhmvkS1r6XQlqidt2Rgo4AfGG/Fb9wacd2XjplyOcEcdO4jDGsURlAaeODxgmwjJUss4Jobi1sBySEQIEcRDBjmoj52cbpJkQsEw9Iz/fPAA3gb1DPWRs/E7Xuam7oP9DiNp+Wft+zNLTMN3BDVAvNf9syig8d5uoJflf478/RsRJYj2t+hgciMPSILh8UdTrh+/5ECqtyiVelCrnNjVMlPOTk1fSer1G1z0tBuWoyMwGQELCZZi94+GVqwm2Vdg7cY/XcqTmQ2kSd51RVCs/kDG3WsOpYOVNpBzw1h6T6l5lSde8x5AI7QkTlfEz9IqySs3SjHteZvOPEtB61atuobjQ1JmJ6wHCz8M0WHAdLVNomoevJJKr3p4qLA9c5dT1Fx2bsDyrnsMuf3/eGIAL2UmmhuE4YMnCvLDgbqyFXyyqAO0Dp1shBo1weeBJUkuaUjksBBLg3SmAC/IlVCGaS8PGt0yp/L6vIGNbmk/MWLn1HFdCjKVU8mvr/i36OASTpJY6cOtR1qGKpqegbM7p3mAc8RnMBhaJ0V5IE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 873ef301-4c8a-4a74-b0d9-08ddb39fc352
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:31.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHFo8kN12zdEyB9oSPUyLn5hX5hE/Ba0DiTncG0ZIBH1QXAF6ar8lOIqFsmJpVfZPmQb30Dp+VNeg8g9djYW5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-GUID: zZbvYH44-RV1Hs9OXziTcnF0Gi8vv-QM
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b794e cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tWnS3hm7DwLpj0N1lJAA:9
X-Proofpoint-ORIG-GUID: zZbvYH44-RV1Hs9OXziTcnF0Gi8vv-QM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX/KLMWvkVKa5d BQq4wGft+I98tAF96rBwF6m6gQngyDMy4pD2EN15O3eJI3KIqxXQf89Njtfqc22qos6j7FuJf/1 ENuY/oBwvdKfv3bvvykyqkqTxEprwUZadwlpO23lelckkNevg7A44mTweGb9X3iN54+wBhR/uem
 sWNOYM/v0qur0MJHLQg1UvSQ4YnaoFxgD228CPxpxx7dFiPvGKMwy9A9CPkHCflck8+ApPpNwXj 5R9QfPwbL7thJDGT472Qo+vc/rfcAJYicfhAdeb/+5AqY5cFI5aeRaKtTeZecABzQUTfFfL34Fw JdTvMD8F60bEqE5P/ulNOLEM6cuWsUJcnV7qV/qLGVXkBtGnj7VmWuJ8Qxm7xsScV7V5vOiKhg6
 Y/TVdfG6wKkJ3swOps8OrYVStyFnMAcauDRxjdDCthRR4wPzsU49wwGj+xPJmKtirnGB11ct

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../variables/bvar/skip_lockstat_5.10.x       | 13 ++++++++++
 .../variables/bvar/tst.caller-lockstat.d      | 23 +++++++++++++++++
 .../variables/bvar/tst.caller-lockstat.r      |  1 +
 .../variables/bvar/tst.caller-lockstat.r.p    |  1 +
 .../variables/bvar/tst.caller-lockstat.t      |  3 +++
 .../variables/bvar/tst.caller-lockstat.x      |  1 +
 .../variables/bvar/tst.stackdepth-lockstat.d  | 25 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-lockstat.r  |  1 +
 .../bvar/tst.stackdepth-lockstat.r.p          |  1 +
 .../variables/bvar/tst.stackdepth-lockstat.t  |  3 +++
 .../variables/bvar/tst.stackdepth-lockstat.x  |  1 +
 11 files changed, 73 insertions(+)
 create mode 100755 test/unittest/variables/bvar/skip_lockstat_5.10.x
 create mode 100644 test/unittest/variables/bvar/tst.caller-lockstat.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-lockstat.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-lockstat.r.p
 create mode 100755 test/unittest/variables/bvar/tst.caller-lockstat.t
 create mode 120000 test/unittest/variables/bvar/tst.caller-lockstat.x
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-lockstat.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-lockstat.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p
 create mode 100755 test/unittest/variables/bvar/tst.stackdepth-lockstat.t
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-lockstat.x

diff --git a/test/unittest/variables/bvar/skip_lockstat_5.10.x b/test/unittest/variables/bvar/skip_lockstat_5.10.x
new file mode 100755
index 000000000..146443fd2
--- /dev/null
+++ b/test/unittest/variables/bvar/skip_lockstat_5.10.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -gt 5 ]; then
+	exit 0
+fi
+if [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
+	exit 0
+fi
+
+echo "lockstat disabled prior to 5.10"
+exit 1
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.d b/test/unittest/variables/bvar/tst.caller-lockstat.d
new file mode 100644
index 000000000..fbd1f1ae0
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.d
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+lockstat:::*acquire
+/pid == $target/
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
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.r b/test/unittest/variables/bvar/tst.caller-lockstat.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.r.p b/test/unittest/variables/bvar/tst.caller-lockstat.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.t b/test/unittest/variables/bvar/tst.caller-lockstat.t
new file mode 100755
index 000000000..fec0d2715
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.t
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+sleep 10s
diff --git a/test/unittest/variables/bvar/tst.caller-lockstat.x b/test/unittest/variables/bvar/tst.caller-lockstat.x
new file mode 120000
index 000000000..539f14255
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-lockstat.x
@@ -0,0 +1 @@
+skip_lockstat_5.10.x
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.d b/test/unittest/variables/bvar/tst.stackdepth-lockstat.d
new file mode 100644
index 000000000..de2b33dd4
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+lockstat:::*acquire
+/pid == $target/
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
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.r b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.t b/test/unittest/variables/bvar/tst.stackdepth-lockstat.t
new file mode 100755
index 000000000..fec0d2715
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.t
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+sleep 10s
diff --git a/test/unittest/variables/bvar/tst.stackdepth-lockstat.x b/test/unittest/variables/bvar/tst.stackdepth-lockstat.x
new file mode 120000
index 000000000..539f14255
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-lockstat.x
@@ -0,0 +1 @@
+skip_lockstat_5.10.x
\ No newline at end of file
-- 
2.43.5

