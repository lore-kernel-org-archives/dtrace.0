Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DE517A586
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761016756; cv=fail; b=SQHy/5XyshEgv6Bux4vLGQqiL6MdP4p/LSU46fb4sE+SjUD3X7kZY4EAcDeQ5tzzLtRdtRzCVvDzrzyfIojy1wflcQJPnKPukq39W4AP9VQ17LfJoOANwrKuB5Ua3GfZM+3HkujzAlfpimn+RXBeKtGdaEywRUrXyJY2Qm5b584=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761016756; c=relaxed/simple;
	bh=MM7r88wZdNCWhyT+R/Z33XqbtJ4qkyfxfBGpHq0J4SM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Fi/p+Kh8m1K3v57+SabtMuq7eyBtjLqaRkz0p3mlrKcpKqpz7wg8hNBjcXF1bVMo3McVy4n5z8UXzlKKEwRIIwwXQbFXrIzhzeqOHiwTAygWwYnTD0OlLfGXq5flRGEdtnLMXL2NXH+H1p3lYh3bJIahuS0xyTz+57QozydWrz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SjDpo+QD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rUV+f38y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SjDpo+QD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rUV+f38y"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KJuswF025989
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=oyY3+SC0+Gq1r0hgMrOB11Zy69nrsA55MxsMcSIFilM=; b=
	SjDpo+QDeigCDX/1WBMns406U+0mmiJSCNmLPYt4cipeoN/k507U+CXwirBzeW+j
	luuta36RJBKa9Fe1DQpnQNaMv2LRSx05fSXGeolgdZ2atNUJD2ZoZ+UBN7HfWzXc
	nPstgTxkkzfCjhVyIuRqhxN4GXWdorXEci/+jcHHxMLHeZahfbIZN1GIhkkI38/t
	/RlVdJSxZskBaLyuPp9zFv3qwFEBpBA1QV7e3i3oeUiTSN1X4Dswh6qiHxbRqHfK
	wOBLxezO+fRKoT3jJtS1EcD1nKwUJ3qZ0Vdpim4b0tfnGtLPrN/7EfeC4Bu/da4R
	YLE/66TXTd9uhX48f+abAg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49w1vdjkgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:19:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59L2dKeO007615
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:19:13 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012062.outbound.protection.outlook.com [52.101.53.62])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bbmvf2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Oct 2025 03:19:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCcyFCkJlArl4bVKN4hVkvLo/R6+wj+UEBQ25q8rmjkephRp9cVGEOBLfEKiGmvFfD7EKluOsCAbqobuo3eu7idBlx8+LClwNH8eE0Go5pEz2q+RMLunA13aemOFYnToS9YbBbFuDfcAj9g3vFOYZFwoFWA6oycZKY9OyVDb9xsR/n91dWtJaaXbihk4N2aIRVjVtt6ygizhVqM0tewkbPPBI541iXMdWgqbOAep+r4GkwUwrFKBrwczOhXIV8SEb8ZVdmFrTPKP3WVrupeiYItYM2WU/Ph22dPP0zIqhX76ydl+XPfMR3BhL2/91OtMy61KAQG/eConKz0qZG9/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyY3+SC0+Gq1r0hgMrOB11Zy69nrsA55MxsMcSIFilM=;
 b=hgDv4cSajbcoEm5jjwAwKGrA6YOPCMLYpBfOcWOAU3WP47q+tu8Nzc5gV1N89OA24XL8oeA8JMFLz+yEKC0ID2P4EG7zjKelg/a/MQv8ZcsQnlyuUrivAcvFgYQIAfJpzLccTd2Tz6CDns+kRqhT9aCHqt49W7fodlIiuAtAwNWH4eDSJ6Xa0/0F86L+WTprW/ALtcr/M32Wik2s3Ai+nnabIpX0asM8I/02riW0vl7byzCBVF9LIt/N1FWDMNBdhoP6mezk0gS0ZNYH+A3eQXKe6Y2WfkYppVMrGd6JxqkQfvNCW2nrilSXPDF3icf4rKd8zorYrwmQkqDdXiIpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyY3+SC0+Gq1r0hgMrOB11Zy69nrsA55MxsMcSIFilM=;
 b=rUV+f38yYbYFG2uwAtjOhVif/PaaB4CEiYwXekQl7HPNla5ksv5LsajZcIxq6z0kddB3Y8lvlbAl2jomRUKAhkXIi4DsQJ6OJT1nHgtSfangRl4b0OLhgngKbPYMsbE5DpcFy0ZSQUSi6z49Giy1ju8uv/U/orLhLtJYxWBkEEo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO6PR10MB5539.namprd10.prod.outlook.com (2603:10b6:303:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 03:19:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.014; Tue, 21 Oct 2025
 03:19:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Use /usr/bin/perf for perf
Date: Mon, 20 Oct 2025 23:19:07 -0400
Message-Id: <20251021031907.30226-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO6PR10MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: 28be4446-163b-4e6d-52e4-08de105099d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/uw47kcVJZ77MAyec4aXEwZqPxEXFX/ncXcJEhYXE2lWQplV4TgohEu1OpPJ?=
 =?us-ascii?Q?sy3/zTTrVB8YJqUXFWZrorQSsYw9GntMjDRZhTpogwlB+WKK6YaEh43N1x0x?=
 =?us-ascii?Q?OzgAzhR0NuUyi7xwmqovjRIqYQN42yMW4PzZ9oO9O8mDpx4NMJhK7QziolrC?=
 =?us-ascii?Q?S6KxDLBDdGpmxn2CzpxDcXf53SYpBPUtNkGRd/Uf/IGbxVPatJnTxy45wdyr?=
 =?us-ascii?Q?qBzfI075ohW9A4vZTXIpZS0sRWJcP50Cs1KtVjf0xVEY+ux3E37W0ynElZ7c?=
 =?us-ascii?Q?iiADaAuKlq7p7tq7bgt1+IqjXt5abiZgZgcDRHkNMwJJHfWzjkrLB9/mYmGf?=
 =?us-ascii?Q?h5kj1Gy7bdSrhiQKwUmdkzwFQHGE+Ne9JN5xb0KjeVMG8HdoIN7aC6vfwr+l?=
 =?us-ascii?Q?t2tT/Ug9GKAMF0bgHL0G47B7UBRttRBDdTLyYgVsqCXgNHppL33erTPqjM/m?=
 =?us-ascii?Q?k44KWxGWHdCTsLmD0GOl/mHdj/YSa8A8Re1agmriKJ6wNVLWIf0LnwIvH0Bm?=
 =?us-ascii?Q?RgXKxqZJ4TJzc3GEuii4TAZXkbicVI6CuKtmBGxqZspRdY+EsrqJfXBK/4NN?=
 =?us-ascii?Q?ip67hhyylA7MeyTleefeiJUend71utUjbYCFBG6K3I11vycIlf1a6kRYP2zB?=
 =?us-ascii?Q?Ui8MJ0MdzRE76fOK6GP4Z+2Nz8ADb8lMT+HG0fiqquf51KiDpUcH2GuUjDcN?=
 =?us-ascii?Q?5DM7/VaVwKe0XBIecL/lY+l+LJ1PngVLONxT+BsI8ughtYMUF2xpZMDo9A4d?=
 =?us-ascii?Q?GJUsGZPhC37l1prJYICC/RmmHnFOqqT+Bhjdn+rg1uKSOniqbsFAvO5uI8YF?=
 =?us-ascii?Q?x3KtbWOOEvx+hUY/Z66RJlmH7+RxEvVVUEfwNbmGWr9h222AcDidO/TofiXz?=
 =?us-ascii?Q?E0gt9xzVgPjWzQfUzRkA+zHi7CEuo8JecekD6eQqNGOL5XSIeVp7/0DCKZak?=
 =?us-ascii?Q?InNx7ZaO3UU4oCsUJn+Aujb8DPF+eGs0r3oB6lJbQhbvH7iilOh0QBnWsm0v?=
 =?us-ascii?Q?EGUlElS+24f+b2KXmmqmVDY5mpWWcG2xStqsixdeAp3oCtENu10EgSRRLrJf?=
 =?us-ascii?Q?YGoJlZJ7XdEMOc1PkCRLiQ8BSMItdP0HCAGBqZyUv+KuWtKzRb893hSPlleC?=
 =?us-ascii?Q?ivhRbjPSy72sAL+JFs0e8P8BpDZfEVWy2SHEigxqvW9x8P8whPY3OxxFDfWk?=
 =?us-ascii?Q?s0SxoaedXQG9vdf0Vbiy41r/WrsUY13t9xuDbQQS3xHdD33HrkTmYP0afS1s?=
 =?us-ascii?Q?LJqCasJt/SX0bmV7n97JzMyaRoeSePWjPfCIzW+l7WP7IzyXUSuJ7pbOrbXg?=
 =?us-ascii?Q?/o+MGfpSiqB4bGa4JYX0qDDj9nNqf+QDl2hVNPqZFqPl7ttH5pK3rG0ZV5PW?=
 =?us-ascii?Q?I9LEun6BMYEhloTpxJuAeAlDMS3LfELL25ZJTlFGem5tyWBGL/bN2UNb6TRd?=
 =?us-ascii?Q?wKQqcQQk2ZE+KDE3yGsi8I35faqM0KXgreGZKLx49YhXvZfLeXNhgQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XF8rHnD+MC0DvWtv+NhVqiqR36rsZ7Cwqv0KqKzW8k1tHeXn6dSGqcCmv0gq?=
 =?us-ascii?Q?1RhCPafldqEXjE8Y/K0JOZ850dkAnf5AmhhDiUX3ELRAeq+9E1OIK6hIuM+6?=
 =?us-ascii?Q?Teb6OmdkLcZ0Va6rSwiNcejKeGPfAQ0Rn1zCEU+wmw3vWHAGLpfM5zpRXld1?=
 =?us-ascii?Q?a9VmANWAarrMWRJmVaIJD3xo81BXDn2N5hgOaR+WgpCudjE84euczxgX5YZz?=
 =?us-ascii?Q?sBhbQIFOphqD8HiYDUXWRlLEfPToEdeMAfFvYtd+gZw3Uwo0iO5WIHph2qT/?=
 =?us-ascii?Q?gwO0Uwr5Yx1wHdxeYR4qvRhhd7nxTyISUDHI4cmP1vZFwd95wQxKEmlVbFsR?=
 =?us-ascii?Q?U5Q2qqolTSLI+f5A/ezVZsJ2QJZbIDTzX2IuRfEfNjkmwxsU4cbQ0LlLwv/Y?=
 =?us-ascii?Q?BKrRiSNxqzAkgup2miSaAzt+fwxQlS4y/M4V79V06ZfWkR/VYSmpsPSpTFkX?=
 =?us-ascii?Q?02gGGjpuXLBWH1x5Z0Kr2mYybswt47eh+SUqw0p0uauTS0FlEwkIp59sB5XB?=
 =?us-ascii?Q?03SQzHUPlRAzyjhtXg1jAFwYQdBeiSSoysbp/f1Shq/Ez7fgu23YvByc9D+F?=
 =?us-ascii?Q?Pir+86oFbWXnKUT4ooploGrbzoUUryhpPH9dRKBMuzo4fWRo7e+mdmcdP7yi?=
 =?us-ascii?Q?44jH7By8db4u584aJRlsjs+FVVUd1Lmjf4wjM9iD11IG/sjhHOaXdQz5YElZ?=
 =?us-ascii?Q?1mFhyytIvEqN9/FRClSP06jcrEMtbTnNH5M8b/VjgG6M0KZT6o7pSEqjWATk?=
 =?us-ascii?Q?FxNnlqwBNprRRiY3msuUhmeY4ITqsiPaLnxotsJtVc/As27JiBCtKL4DpT1s?=
 =?us-ascii?Q?ITkMMYIOKlIWBAzR+flq6z0ZTAjpj7FtcOAiG/H6ipyiucPAJpv/ju05eTAj?=
 =?us-ascii?Q?0o9QGPgvgqp+IaTsBW3kwt+zOxIIQCsY0/lEU3/CQ7fsVszGgcPgltYUdSNP?=
 =?us-ascii?Q?TfNm0HKpSEpsHR4Xir/YEwY/7be87OcaiI+cVd3U/tN269Md1klWUmdybC2k?=
 =?us-ascii?Q?MfgjYzzrPB0cRCt0im/GiXgX5t3tM1hOIBoFlTMDG5zZU2jaT36kDOkAqXh/?=
 =?us-ascii?Q?vZ6iVI0PRLMWQLJ/36ckQFnl3OB8Xoay3HE+PHVKMOq5J/RrL6bYuNirgsbQ?=
 =?us-ascii?Q?4dm7vrBDEyHLHqAXlCv/O0pFmvTowysTe9uuyWi22rmPH0QGOWCrq8pOHfqc?=
 =?us-ascii?Q?CrJppR5FiqKYBdLnbzxB2epFsboH6tXak77rQhXYcq3YEAuo0Xfxh0aYmbKd?=
 =?us-ascii?Q?+O2LG/iFz+DCxwBStmIgXrCH2c6D6i+3xoX/OhDeAZDfO8qC+09nE8+U18g8?=
 =?us-ascii?Q?gRkaMrFwdfXvFYrdSjGtG37ilWhqI/9ED0zvOetOodDj0kceAoqaWbXTE507?=
 =?us-ascii?Q?7ZKI3l6RMuJIexrC42zC1vyjgIjbXX2Wp9gFYr/WKnYsFn7cNnApcqaf8uNP?=
 =?us-ascii?Q?N6FcHaQJeq5fTiBl9e5ZQp7n361J915uXU65dUp6pKl17unwMvKNJ5x8kt2/?=
 =?us-ascii?Q?EeZ5KfyB+yyzWQxYOc776JkNc9SBlOUQKuAVLxyx8uxmQF+er7gBoY+iHwce?=
 =?us-ascii?Q?bI9wOHQnEFVBtwj/93ipftEwKeaRBRK9rzqV1OwS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B/3r9elgQpC7TUPKkNPufM2EA1llBIA3z5aKgLsgRXV4eL0M3g6kd6zhzUrrrB2HEi9kWLjYBL8HyeIQwndRI/W9wZsxzCz6oKulaGiZxMkb+6yXW1jCWZxU5c/Sy7le3M6qKGAvFShJ6g58G+UZGzL5Yo0KwwSewXSY5cwM3DCcnr6NAsPMYR4DOvc/LbK5chwFrVkuin8g5KEBhiSTi5QQxFW6hYhEUms55GhK60XmhR9g+9FSP9v85ItRuVfisPycprxX4snwBWoLsVFnycQS2q78oG7/2QSqgXgY5x3mPAE6T0kybjdOc/+aU3x83HtkHeiQXxFK5+8wur1lMeM8C5Py9MoPXcne2Qn2B8qt2ocGtqs9ZPl0BcYINYv5u74aEr/AHukjFVd9u5DNaUqnHT8NyBR7VDIqWKUlPHhPYSTvuIS1xwRGr0b2NyoBwLdh0Muek+gDIdLR4GDsKCR26v2oHrAKIN88/rLuvUBTubz+bWhk8UBkH4/f8vzRJd6XbzZ2Lzl/D1dquV2xJXqdty240DNqqoF9m/cB1aTjJ7Q6Wqn/BoteB0xhPT4Mc+9BL9QAeURfhLrhVVB2gUqz7nm6DOLpTSP+4htn1o4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28be4446-163b-4e6d-52e4-08de105099d7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 03:19:09.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXpyoHPzcHlf9g453MTz1b4t5nNcRUsKWOLTu6WZYtjVuYueohrhE0saV6CE2Z04nDubaYwQ1JIoqQJqnaX+Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510210024
X-Proofpoint-GUID: Nm5aIXhqkvnopYh5DYjLTM9jzFRzw9j_
X-Proofpoint-ORIG-GUID: Nm5aIXhqkvnopYh5DYjLTM9jzFRzw9j_
X-Authority-Analysis: v=2.4 cv=WaEBqkhX c=1 sm=1 tr=0 ts=68f6fbb2 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=wfBU9peuZPJ2ucO1pFoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDEwNSBTYWx0ZWRfX4mpxI02f5leP
 ZN/On5yBoKNzaj9mWnWM+sGdM4DnK0odHFECrXR4GBz5ZPK3KUvsmFTp7GYral9eG/3Z1Y8qHjg
 JMXZFlkWzxUeMn7D1qHEjE1EHDkUu55i5s0pB5scihCAGZUnqOVRvFi0rJkuKNlsx6cEy1jSoCV
 NGU4fQHLZhhamImkrpp5TL+bUhqDH0UuyO2joHaCHFN+Re3v91+HxRCtYzTLWKGCXOShq04h1BB
 7vssBVZg3fG3eZvAKwNjA4xY9vZ6Pked5WJIaxj2Es8c2qiLgSrqgEW10k3jqtbyoZCoY3+CvP3
 b9jeLBCQuHq1yEuSiTJ8PTt0bvcmDGENtt1W/4QhUH7bygynlLr0Z4q/pvi6uufYf+itXBCgzv/
 ntaqxt8ztq+6upj2IXHricgIT34aqg==

From: Eugene Loh <eugene.loh@oracle.com>

The testsuite package has a dependency on the perf package.  But that
package installs perf in /usr/bin.  Meanwhile, there is a /sbin/perf,
which is likely to appear earlier in the search path for dtrace users.
That perf is a wrapper for an executable that might not exist, causing
some silent, unexpected behaviors with the test suite.

Change references to "perf" to be explicitly "/usr/bin/perf".

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/cpc/tst.branches.x     | 4 ++--
 test/unittest/cpc/tst.instructions.x | 4 ++--
 test/utils/cpc_get_events.sh         | 4 ++--
 test/utils/perf_count_event.sh       | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/test/unittest/cpc/tst.branches.x b/test/unittest/cpc/tst.branches.x
index 4b235055d..a19d1bc6d 100755
--- a/test/unittest/cpc/tst.branches.x
+++ b/test/unittest/cpc/tst.branches.x
@@ -1,11 +1,11 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
-if ! perf list hw | grep -qw branches; then
+if ! /usr/bin/perf list hw | grep -qw branches; then
 	echo 'no "branches" event on this system'
 	exit 2
 fi
diff --git a/test/unittest/cpc/tst.instructions.x b/test/unittest/cpc/tst.instructions.x
index c3a2ede34..3c1e47b75 100755
--- a/test/unittest/cpc/tst.instructions.x
+++ b/test/unittest/cpc/tst.instructions.x
@@ -1,11 +1,11 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
-if ! perf list hw | grep -qw instructions; then
+if ! /usr/bin/perf list hw | grep -qw instructions; then
 	echo 'no "instructions" event on this system'
 	exit 2
 fi
diff --git a/test/utils/cpc_get_events.sh b/test/utils/cpc_get_events.sh
index 80d3584b2..cc833fbb9 100755
--- a/test/utils/cpc_get_events.sh
+++ b/test/utils/cpc_get_events.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -13,7 +13,7 @@ eventnamelist="cpu-clock"
 $(dirname $0)/cpc_temp_skip_bug.sh > /dev/null
 if [ $? -eq 0 ]; then
 	for eventname in branches instructions; do
-		if perf list hw | grep -qw $eventname; then
+		if /usr/bin/perf list hw | grep -qw $eventname; then
 			eventnamelist="$eventnamelist $eventname"
 		fi
 	done
diff --git a/test/utils/perf_count_event.sh b/test/utils/perf_count_event.sh
index 957363e55..bc1441f32 100755
--- a/test/utils/perf_count_event.sh
+++ b/test/utils/perf_count_event.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -20,7 +20,7 @@ shift
 #   If the output is no good, report -1.
 #   If the output is time in msec, convert to nsec.
 #   Otherwise, just report the count.
-perf stat -e $event --no-big-num -x\  $utils/$* |& gawk '
+/usr/bin/perf stat -e $event --no-big-num -x\  $utils/$* |& gawk '
 /^[^0-9]/ { print -1; exit 1 }
 / msec / { print int(1000000. * $1); exit 0 }
 { print $1; exit 0 }'
-- 
2.47.3

