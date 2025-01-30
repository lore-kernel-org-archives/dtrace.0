Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E8B19006F
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738278236; cv=fail; b=DqQeB2ozXF2is6rriWLae9ugHCtaswLV42+AUbTptxeSYpQraMAknsaDvAUHyA5Emjs3nyPN2RhMnaMGiTzD+RuM9w6iP2bTaNhZJYrlDH1zL6LQfKcL9dOod2Zwzciy1OGCPggVw9g8zfqtQoByBlHgq+vhPoTIm93sy5sF7JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738278236; c=relaxed/simple;
	bh=/I7pzDxvA/w1wPOOs3hPdQFFV429a5h5yiakyIRD1DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SCLTKDV0j58RP18d9ACwnjOaKjpiZlaVdKiJyvBV4cAzQ0idVueltLpDhbOJEx/kWZ6+zakGRIB+Pc/MgLmmI1UM5PvVORQWunikNQLPH9gfDjJYlNBbq65UyDp0H0NiXnV+gSOb1461sDtMLxr08OxkxnLKgaQXWRoWxuuCOlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SmJiWN52; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ji+WMvcB reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SmJiWN52";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ji+WMvcB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UMF5mA010010
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Uo8NR31YeWgT/+CNp4sWd9Cbw9V8Dw3WwhKgxqFlB4Y=; b=
	SmJiWN52qaZUgTnXx3pax5MeJMDFJ0S3f83JUdoNDea6aTxCMiQgFJIsQGIoLjQm
	mSchkgnCPUe8b/LVMGJ0SD43+FTxB4j8OtiLe/Fm8uOxhBvPkWZbCfiE/4JWfEsc
	QpAAGVlMvcheG1LdKJY4JNcnnkj1xv5ALUQkehGdYgjMCGxG+jEiZQCfyFA6uvZP
	/hVAetpOSVOs4cbhIIgQm+nJ5T2woz/VMhg5GZWqNg0jvTE/foqf0R6o0pSijPzF
	XuXvp8sF0DqcOVyQjr1iMpXQsmxvzm7QlYmxCqqGyI1tPS6bD8LkywEq20i5tgvU
	mZXe6QH+SC2jZRB3MHHONg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gh6w05w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:03:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50UL5wHw006103
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:03:51 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gfhtqr1m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 30 Jan 2025 23:03:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDUcWYpb4+B8ziufuVSQ4sWKl6kKnqq1E/zqvo0wnBDBeLMNOCs3QpIgLjlY+nK5u3IIJpjBc3hUvcPdUFkuA4KUEF8Z3zDixSwDldIwHyYKvHZQ6m1eEeU8AxjqEEC0kFkh2ypbVht+MzrGPXA+B5aII7HNgApi1t6+tWBBgO/cCT16O93Z55jnwgmCUweetRcxyItkknH3p7YMdtQNKf/rgdt1LjAwhLISVkmbjtufHFzCgg+1eBWkMgbqqaG5m6BjTIKttEPYoYhqJrINuOSiweGm9A5CfNHlQ9iXs4JDEjRSYovg8TI6tEvVR/pZdQf5IZmYj9+hy5nQbbVQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b18YWYdlveby23OIjJnEetvx8Uwxd/xGzEc/PxwVqCc=;
 b=ynZppd9Au4I5faQMptH9jboY2MmldSqN3ZsDkaAW5OIaasZcfzRpl7Rd9KC4AdPbrukVO6Bbwo1VlWpYUh/d8S6a5Lm1zglasBi6Zara3cp1GIy7NWa0cBhONhl+pKhvQBlAj/2E2ypPb1JN1veT/HtT4MS4+Ge+9tCrR3gX1qFsBlIQC1MyAaxo3pUVyWwaPGDVML/b82kKjB/pcu+U+Sw3rZPwi5AC7Sx/8+1oVqm3RDCYxuTezdm0K7oPjscwT8VbO/UzNLVDoqltK+STlqkIY5KLXCtpbpi57rI01NLYHoh4dYJAXtdDfg3ixcpTHc8S0w/q0z4eL8ORF/YCPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b18YWYdlveby23OIjJnEetvx8Uwxd/xGzEc/PxwVqCc=;
 b=Ji+WMvcBH5jxsemstlBZGUR8Sil2haSFo1tcDk5Yr7xyBuBl6Sphfsy16ZO8fmy5v8RDeHrCmG/0GW+RdLbzvdc8k4WcOHkSHyAZK07K57liPJAbbnY9j5jdQET99Tv+1lzqTKblJYQb2HBLSZTlGR6emYl/ouUAPO+Sk1p0M+c=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by PH7PR10MB6273.namprd10.prod.outlook.com (2603:10b6:510:213::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 23:03:48 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Thu, 30 Jan 2025
 23:03:48 +0000
Date: Thu, 30 Jan 2025 18:03:46 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 6/6] procfs: populate pr_argc, pr_argv, and pr_envp with
 default values
Message-ID: <Z5wFUtaCwaxo1LpL@oracle.com>
References: <PH8PR10MB633769A4429BE0BA293C8FE0C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
 <4b5002a1-1c42-9ab1-92f8-3cbb29368de3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b5002a1-1c42-9ab1-92f8-3cbb29368de3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|PH7PR10MB6273:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bdfe89-0dd6-4146-3f01-08dd41825b23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?rkqlGLv1+4niXdNnXqvadKZiH/m7hy44cbyWYAE9g9ULDQjBFb51e8HCLD?=
 =?iso-8859-1?Q?3C7gLIwehiklRRFNkBOUvByd4zhNiLBHW62NaWwf6DAOrvsf1yrC+XTCJQ?=
 =?iso-8859-1?Q?lcPceixGh/Xs7jWGGE9FGYWQzXp5GSWfjGx2GJJnxQmLeyMLZwqB8NktLy?=
 =?iso-8859-1?Q?CL1zoEiOZLqV6ncwZkdGnQdulVYWkWHQdfpLH3cPbRp0eWF76CeSxH5JbU?=
 =?iso-8859-1?Q?9CFzfY6YrVMjqbpl99Tyzwc+TDdDFxF6QxekYdN+FYB5FTdiyDVn09H17I?=
 =?iso-8859-1?Q?49nw5sw3zqA7H/wVC7u0HP5AC5xz3IIuccWV9V62gOvqe2Iz6/D8IHzOb8?=
 =?iso-8859-1?Q?6N2fW2/VIsD/FstWnSwk3dAlcQYxnoaTu87gcTcWjxh1kgJx3bK2x5CyDQ?=
 =?iso-8859-1?Q?GdZpgNxc4P7XcPlXoecqR/xrK04WuvRgB3xkRrOh6lrj9XCsi3ntTtChYa?=
 =?iso-8859-1?Q?c1gsXIN2Yf6EuzBnYypFWla50bQ+bwmiaZ0XlwhIf8OxqL95DqxNZoe0pK?=
 =?iso-8859-1?Q?x8xbHC0IF+KNCHUjOtlbGt/MCGZ2WpKOIq8eFYaiVz6NxySHrFoen3NwGt?=
 =?iso-8859-1?Q?ZNMwVEqGH4oDMvIHoDeNxUaMN7Pkg1Xp01jEcwnICyfGDqs2Y79V7AcYbV?=
 =?iso-8859-1?Q?PVmU2Z/PRipvJzrgn7SeGuZJ8KxVGB2+P8dbbeJFQ27/UjbklU6mgx9Gci?=
 =?iso-8859-1?Q?RjCHyb92UnJFdaubLEzxLeUYao4RUmeBfihXnZgqBMK3n6vMv1a2w0nZLu?=
 =?iso-8859-1?Q?l+02+0TIAr/D648Jj5icShWPdkC4rtaxacxlVC2052MoS+qnCIvRry0wIH?=
 =?iso-8859-1?Q?fnnTy15BBpxPVX9NBDSNBLT7YtwMefVlYFb8PvOCu7m8mwrl0po5t1h3zz?=
 =?iso-8859-1?Q?G3oc8Y9Qo155gjQQP4oI/5mrgg8scT7zWow0YaFTpHxEl8q2ikQI3aHBoH?=
 =?iso-8859-1?Q?gq8IrntG2NmA4Urh4B0XmaBPWGeoJoteuuBsh7r85rQwHmKqOO50zZ3ghz?=
 =?iso-8859-1?Q?fl8EWS3lsarpjIYFKJn4C+pBug+L1/055RTkSH7qQ8oj4Gd2GOUUbkAIUX?=
 =?iso-8859-1?Q?9ZPpSwhnyBQgmivEov+XkPaJFokdBqWND1S0ohHSZy4ZA201u+TSL8HFqA?=
 =?iso-8859-1?Q?h4nxWweYAkSMN45kk4Pqm6mcdiXlh2UuyHsQOxrbVVilGPlUnSnw5Klahl?=
 =?iso-8859-1?Q?Ws883bDGTJlkrgQDHEoTq5ghZHlJACo2Q2OGWvbrE0cIAU+jBgAcjnr9jt?=
 =?iso-8859-1?Q?SRfULDP6G+C7PkO2BRleMNzOfTI/sQ4V2KIIUEs5kUTEaHUcjxT/vS6TU3?=
 =?iso-8859-1?Q?TyDr10h8ADauCV8YlTNO3FDm4X2Gi9FMRGIL83NkivIAGjGeb4+vurEpAL?=
 =?iso-8859-1?Q?qhRyqOKtkwXde4C0upKNt75ZDRwqj4hA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?GNEbzPn9BgAlhv8hzyJdV2/GIBDizHs42DkFc6W2Dy3hh1Wnkni4h0cpGA?=
 =?iso-8859-1?Q?WPgwqBadoDevUVRc+5jlfSOAF6Q20+G5BZ47m595ojKBrMEOi6qhUVVNaR?=
 =?iso-8859-1?Q?4WARH8ilsiASBsryWiPMnxqDl6mTINx54yQOQd1PAP+N78JHv6mukLfPYa?=
 =?iso-8859-1?Q?GqKSZPEk606GaCM2SUW8bBiag9X4C8RPWvnG05gWByTruuYbYIrPuqMWYM?=
 =?iso-8859-1?Q?WlxKJh1ILkXCqeRl1J4ojgt7XyHu3OImoD7IKSUnAudiikBYVendOfqJxU?=
 =?iso-8859-1?Q?gJ3QgS/9Pu+T91XsHEsU4yQGBd0jbdtR1EazTCm3SM9moAQQhAVb3WA8ce?=
 =?iso-8859-1?Q?x+qGf7SE3CvuMB98E15DlxiFORaKFU+YUHuo81rT8PXVinwbq6SghXgKTM?=
 =?iso-8859-1?Q?yzDJM9IVcFBIRMUxgNQO1cuqgRnsttrRQfRdYXXhPxXAkelFlV+KcgWW/m?=
 =?iso-8859-1?Q?02FqCaEkVQLTvsH+FTSJTnML0dN5RNZw9I9mpFx537uNxt7/8I8z56ZQMU?=
 =?iso-8859-1?Q?W9kK+7Fy7rzSqfzImGFzkIipWXk7bmn9PnhjkFhi46yGEFSwLJFYrB/C+D?=
 =?iso-8859-1?Q?Ljuct/ZteGt5YLuZZTduJzMISXzKyNNXUHr6KsR5rdHSSt60gRlPh7WmS2?=
 =?iso-8859-1?Q?dembHmaZ1LqUBMmQHNPqDKJCH3QiL5jwFacElLIuX0yDhOpVPgrkxv5baP?=
 =?iso-8859-1?Q?+xAIhxWYLIvxb6WKO5S1G9ZRKIi/nqFyzwmGlqoBn6ZK1QUhLyBKjfogNP?=
 =?iso-8859-1?Q?Aiu0ixxubagVf44M3Jq67aXwYGX+PXVopKzXcq1UZ3AOew47cZRgWpWdul?=
 =?iso-8859-1?Q?ybSQE1vwd2ubxmEo4ztl9T8t2TAx8him/aHsulK83NwjjQHnWUy730AMcy?=
 =?iso-8859-1?Q?tDGgBG13GYmuUEuhBsE6xBWJROoto9fQnDadIGqyYH9QSk1LCkzOS9XQQv?=
 =?iso-8859-1?Q?aFPqHNptDyL2FRrb5w6+9X45mp9o+sU4RbhWlTtYxXZumIzvXr+PCQVLnf?=
 =?iso-8859-1?Q?zBONDK4ay6Oh8qN20lUlQT3IsgGX5V4VHGaXGqyi7CDI6kzgNS9HXsspcl?=
 =?iso-8859-1?Q?NsMWnZCCipaDgq6RzrCgpsJc/iFDQzaQq53oyAW3ChbMMmDy8uPSdN3XZ1?=
 =?iso-8859-1?Q?RbzQTdO8IOx6tdu71X+CZhpXlSlbHAU9Tj2Y1apWwF8J4rhLCGVPboA8M+?=
 =?iso-8859-1?Q?NwmwmlsOaZzH9jhHmNEiJ25srW7lv4DqRGQcZOuw3tALCamAiXCB8JRhDw?=
 =?iso-8859-1?Q?qtWumjKl7fRBXL3+7pxeHcvdURjz1nkcxDgxJjhVqbcMy9JeZ3kTDWq6wm?=
 =?iso-8859-1?Q?9rtPvr9DZG7HAl5NDdU/Tksas+TCWkI2GK+ubibjVOo3G53IpgrQoHlO3t?=
 =?iso-8859-1?Q?zi3qqEUbOXR/T4nyAIYUxI3u1m/F0xN2lXajir/qT+LB5V3dofa4YG15l3?=
 =?iso-8859-1?Q?05qXE65rKFASaWbqJpzJOqvtWii5MzN3zRKOwZrBfsxLglOKP66q5nsJVL?=
 =?iso-8859-1?Q?QIzzW+VZCPd7jJUt17s5u7Fm1X3kWWPw5AVasSk/tLPXdlchLZ35nyrfEk?=
 =?iso-8859-1?Q?FvvIgfA1TDhJugxARzZuAVW3uB18Z3du5VxechIoDq2Zzsp++8miIF555A?=
 =?iso-8859-1?Q?RcxFl7VRavPTcp6uwjlbWJo/ojNVKES9T4n19sHfo82kQs7cOC3MgrHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eacB4zIkzplX9btn3zGWh91R7Yt4QgkfnS1VOpsDXxOceByX3hZkazowIW7AQgDd1fxeAm51Ua8mlhpMDEwIej0k1/x9kPwEY31CeCuRC0vqHuSpzdwto//70h7LZy4xMX0TiNVx9p5ZpeeN3JFp294EkF0ohT02v65OauBMOMKzbd5msbVtAyF2DgFyJwWWnGmReBMEMaa/PL5o9IyW2JXBP8gVkMUjPU/F8FpKKeGSL2wKSEpKynqgsQbwW5HdHDMfWRyZXVx4Bvv4dyF+CFXKv7sGGr7qbf+BBdRU5qXtvdcMAxXBV/nDlf8aWRmlN4JwnOTAa7/cQ3c6PGWtDcLfPPBPYC1FBGkj6FsWE4FnNx1NR6kOX2ELpaTA5kNEuVYwcBrTSOXbFW50GBorRq6RJ0kncZoLnPS/6Mm6ozPDW4EKM1ICNrqHphFSzd1Ub3oYae5mX1efsAZyRaJUlljPcm3WwyE2wjw3EXa1imXe2NeRIzFGMZQp+w98RHx5GP/yzzZWPSD00Kr0yhvICSXvArvCDnxwMJlN5NCU5G0/uoUNDmkvjRje92AWsmboahosnLuo5/SQPExkQQL+rGHDLUXoIvyGIknvaNCJ2jo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bdfe89-0dd6-4146-3f01-08dd41825b23
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 23:03:48.8440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNUwsb85s9R8FcDSFkriRZnrow5T+iowqJjRs/+G6WH1YdMRIPLFTIAxqXk6Ak5K/8iuVp4vztndIfzyeYxiKTVkf5OOQJ8iV+e6uD3pC5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6273
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_10,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2501300179
X-Proofpoint-ORIG-GUID: JykeyVC9ITXgkvoAfQXSIVWzd2d2ry77
X-Proofpoint-GUID: JykeyVC9ITXgkvoAfQXSIVWzd2d2ry77

On Thu, Jan 30, 2025 at 05:33:45PM -0500, Eugene Loh wrote:
> My main question is how it is better to provide incorrect results than it is
> not to have implemented this functionality?  How about just waiting until we
> implement this functionality?  Isn't it better that a user is told that we
> haven't implemented this stuff rather than give them results that are
> incorrect?

That is always a balance.  Ideally, we should have tests for each independent
member of each translator, so that we can do more fine grained testing.  But
it is not sensible that we do not end up testing any translator members because
some are not implemented, whereas providing a default value for them (which we
e.g. also do for members in the io translators).  That is the precedent I am
depending on here.

> It is odd that XFAIL is being lifted when we are producing incorrect output,
> but I suppose that is the burden of some other test/s.  So, okay.

Yes, we need more fine grained tests.

> Meanwhile, XFAIL is being lifted for
> test/unittest/builtinvar/tst.psinfo-bug21974606.d
> even though that change should probably actually appear in an earlier patch,
> "procfs: implement d_execargs() for pr_psargs translator support", where it
> starts to XPASS since it depends only on ps_args and not on any of the
> fields handled in the current patch.

Hm, yes, forgot to move that one.  Will do.
> 
> On 1/28/25 01:31, Kris Van Hees wrote:
> > The pr_argc, pr_argv, and pr_envp fields in psinfo are not implemented
> > yet, so it makes sense to set them to 0 rather than not providing any
> > translator for them.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   dlibs/aarch64/5.11/procfs.d                       | 8 +++-----
> >   dlibs/aarch64/5.12/procfs.d                       | 8 +++-----
> >   dlibs/aarch64/5.14/procfs.d                       | 8 +++-----
> >   dlibs/aarch64/5.16/procfs.d                       | 8 +++-----
> >   dlibs/aarch64/5.2/procfs.d                        | 8 +++-----
> >   dlibs/aarch64/5.6/procfs.d                        | 8 +++-----
> >   dlibs/aarch64/6.1/procfs.d                        | 8 +++-----
> >   dlibs/aarch64/6.10/procfs.d                       | 8 +++-----
> >   dlibs/x86_64/5.11/procfs.d                        | 8 +++-----
> >   dlibs/x86_64/5.12/procfs.d                        | 8 +++-----
> >   dlibs/x86_64/5.14/procfs.d                        | 8 +++-----
> >   dlibs/x86_64/5.16/procfs.d                        | 8 +++-----
> >   dlibs/x86_64/5.2/procfs.d                         | 8 +++-----
> >   dlibs/x86_64/5.6/procfs.d                         | 8 +++-----
> >   dlibs/x86_64/6.1/procfs.d                         | 8 +++-----
> >   dlibs/x86_64/6.10/procfs.d                        | 8 +++-----
> >   libdtrace/procfs.d.in                             | 8 +++-----
> >   test/unittest/builtinvar/tst.psinfo-bug21974606.d | 1 -
> >   test/unittest/builtinvar/tst.psinfo-bug22561297.d | 4 +---
> >   test/unittest/builtinvar/tst.psinfo1.d            | 1 -
> >   20 files changed, 52 insertions(+), 90 deletions(-)
> > 
> > diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
> > index 9c06fe1f..52b2bbe2 100644
> > --- a/dlibs/aarch64/5.11/procfs.d
> > +++ b/dlibs/aarch64/5.11/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
> > index 9c06fe1f..52b2bbe2 100644
> > --- a/dlibs/aarch64/5.12/procfs.d
> > +++ b/dlibs/aarch64/5.12/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
> > index 2824d137..8c05e299 100644
> > --- a/dlibs/aarch64/5.14/procfs.d
> > +++ b/dlibs/aarch64/5.14/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
> > index daf30745..e52ab29a 100644
> > --- a/dlibs/aarch64/5.16/procfs.d
> > +++ b/dlibs/aarch64/5.16/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
> > index 3594e5e9..4a95dfd1 100644
> > --- a/dlibs/aarch64/5.2/procfs.d
> > +++ b/dlibs/aarch64/5.2/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
> > index 9c06fe1f..52b2bbe2 100644
> > --- a/dlibs/aarch64/5.6/procfs.d
> > +++ b/dlibs/aarch64/5.6/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
> > index 2d52f079..4881aa5b 100644
> > --- a/dlibs/aarch64/6.1/procfs.d
> > +++ b/dlibs/aarch64/6.1/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
> > index 2d52f079..4881aa5b 100644
> > --- a/dlibs/aarch64/6.10/procfs.d
> > +++ b/dlibs/aarch64/6.10/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
> > index 7679db2e..96e55dc1 100644
> > --- a/dlibs/x86_64/5.11/procfs.d
> > +++ b/dlibs/x86_64/5.11/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
> > index 7679db2e..96e55dc1 100644
> > --- a/dlibs/x86_64/5.12/procfs.d
> > +++ b/dlibs/x86_64/5.12/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
> > index 3a348ebc..8dbf3c01 100644
> > --- a/dlibs/x86_64/5.14/procfs.d
> > +++ b/dlibs/x86_64/5.14/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
> > index daf30745..e52ab29a 100644
> > --- a/dlibs/x86_64/5.16/procfs.d
> > +++ b/dlibs/x86_64/5.16/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
> > index 6ad926ee..23e05c2c 100644
> > --- a/dlibs/x86_64/5.2/procfs.d
> > +++ b/dlibs/x86_64/5.2/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
> > index 7679db2e..96e55dc1 100644
> > --- a/dlibs/x86_64/5.6/procfs.d
> > +++ b/dlibs/x86_64/5.6/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
> > index 2d52f079..4881aa5b 100644
> > --- a/dlibs/x86_64/6.1/procfs.d
> > +++ b/dlibs/x86_64/6.1/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
> > index 2d52f079..4881aa5b 100644
> > --- a/dlibs/x86_64/6.10/procfs.d
> > +++ b/dlibs/x86_64/6.10/procfs.d
> > @@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* Not implemented yet. */
> > +	pr_argv = 0;			/* Not implemented yet. */
> > +	pr_envp = 0;			/* Not implemented yet. */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
> > index 827d6b81..d4433be4 100644
> > --- a/libdtrace/procfs.d.in
> > +++ b/libdtrace/procfs.d.in
> > @@ -181,11 +181,9 @@ translator psinfo_t < struct task_struct *T > {
> >   	pr_fname = T->comm;
> >   	pr_psargs = d_execargs(T);
> >   	pr_wstat = 0;
> > -/*
> > -	pr_argc = get_psinfo(T)->__psinfo(argc);
> > -	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
> > -	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
> > - */
> > +	pr_argc = 0;			/* not implemented yet */
> > +	pr_argv = 0;			/* not implemented yet */
> > +	pr_envp = 0;			/* not implemented yet */
> >   	pr_dmodel = PR_MODEL_LP64;
> > diff --git a/test/unittest/builtinvar/tst.psinfo-bug21974606.d b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
> > index 68d9503d..03857e83 100644
> > --- a/test/unittest/builtinvar/tst.psinfo-bug21974606.d
> > +++ b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
> > @@ -4,7 +4,6 @@
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > -/* @@xfail: dtv2 */
> >   /*
> >    * ASSERTION:
> > diff --git a/test/unittest/builtinvar/tst.psinfo-bug22561297.d b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
> > index b9efd0ec..ffccf469 100644
> > --- a/test/unittest/builtinvar/tst.psinfo-bug22561297.d
> > +++ b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
> > @@ -4,11 +4,9 @@
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > -/* @@xfail: dtv2 */
> >   /*
> > - * ASSERTION:
> > - * To print psinfo structure values from profile.
> > + * ASSERTION: To print psinfo structure values from profile.
> >    *
> >    * SECTION: Variables/Built-in Variables
> >    */
> > diff --git a/test/unittest/builtinvar/tst.psinfo1.d b/test/unittest/builtinvar/tst.psinfo1.d
> > index 9e6d5053..7c451598 100644
> > --- a/test/unittest/builtinvar/tst.psinfo1.d
> > +++ b/test/unittest/builtinvar/tst.psinfo1.d
> > @@ -4,7 +4,6 @@
> >    * Licensed under the Universal Permissive License v 1.0 as shown at
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > -/* @@xfail: dtv2 */
> >   /*
> >    * ASSERTION:
