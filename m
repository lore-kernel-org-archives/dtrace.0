Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DAA15D1
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 05:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762924976; cv=fail; b=Rt+lAvOuu5S2r5Tidb0V+Err+iP9ub/h5p5gTokPPXXGczIP0gFB3YRLMYl8vtajYBJyxSTDzN1EnSSLQC/yjX5vaZ6yqQIG6zr4abi3vEY7/nZGdmN12UkkFJQ7JWfhRzQWZqG1rnM6bT4ENx1KUZh6B/36CZ+GOtNpgaAvCak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762924976; c=relaxed/simple;
	bh=ByBc2duXIllsJQppJpeIhNfTnE4pkbP1d1fv1SJ8ww4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Mjdmh9IWuhbaPuJn4GPRVIGBre+E2X9gdm4xHrqBRzvDE0T23Aj9B+/BqsZpF6m5X25s6TVG6uBhRad1jL/lciSB9ZBOwjzS6Lptyz6eQDK1dt6kMRn92+4EGRdP7bet6bghrsqvfQhE/GJG/zbZOD8ekE9T8KwJdnDCdrTGyhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h5BkRKk8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nYmpgl1Z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h5BkRKk8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nYmpgl1Z"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC4hUv4023017
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 05:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rA4sHfpkJjDYlpaE/O/z2GzsYf/sA0Utkuugp5TlyxE=; b=
	h5BkRKk8pu3c8af4vlshZvQevpCmKGZavRl1Dlab06Jg9EkNXjl5ouOEPxQy8rBs
	U90Z69CaxWyiNHRihDMaGz0fCVjekoevddgmX2FrKkKuTGhbc0nVOkr8whXIZ/UO
	H/pmORAkYDXqbz3nkDBRFVMDHwi4DkdgYPxJU7j5Nz2pOWzL9FJChKdwR4W1ZLO+
	LwV4cE0MSMZfbgxZrocfBLkQateRJGaSjltIzdc0ltQkSXGOvcNC1Wk1Vd0Nz7ET
	WwWVVkYOqg8RO1yj+mT2fz2+p9etYbrNYqYvulmjpew1jlfErD8PENTiYHW8Cehx
	HfB/A/6x8+6+ZuoMLklGUQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acjam83s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 05:22:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC4Y060040113
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 05:22:53 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vaa8e41-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 12 Nov 2025 05:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kvccm11SkrYenYhUIuNmOWcgbtJZwdjb8Ruz/By/2JmLKHloHRJlb4/MX4zYpkxnbFUiVoVbvDCk9zvI7GXZLAFuZaYPfniscAVs4rbjNE8WPw1ytGNgk5L+d3nwSU/ui8cR56p1X5eKfsjlmYkHwlCJoP9MnTOrzJuqids/U4qq4cVycbLsVdZloSl7w/+dVrQgnsb6uK2ZvpoOYVsnIRd1+NmSdIgd5//RH6N37Lw0c4jLUovl9ulWPjLTxXQXRK/EGp9d2CdZ60tXLkJlkaHbAxdmODivuu0JcCMz2rNkYnlXAJTkv4YhsQHBbY97hHBQipYmhnEqk+MnMxfWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rA4sHfpkJjDYlpaE/O/z2GzsYf/sA0Utkuugp5TlyxE=;
 b=xWO1aa/uLjP3vs5XG98uKDadxZbetZK+zNtJM1xIEqDSZLvV89hJCgjv2hTjeWpicN6Xn/3E0+/wgzLKz8bbwwoPzRDw7X+qJhMMMVE77OKh/OsQ/Evt7IkqUWPjC/PJZzwfm9SxLxw2quJ8jXNVk5YsJAvTiMirjGdbc2xoRL/3hrsMKeZRWITh1aN3vB72aMLKmXGLsyIF2fhvYkrU/glZppcTrLISgqIlqQgMFoScvPTmDPgCNXuRddw/Bv5w8tS3TGgQZ4dgNiqK4DiiRnkb8Y9xO4VYrsoYYGAAOWBiz/oflglK33clpDtIA2Fk+2sWcvvG+YJ6Vxyshy50uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rA4sHfpkJjDYlpaE/O/z2GzsYf/sA0Utkuugp5TlyxE=;
 b=nYmpgl1ZNBwAwVHfcwVokDRoNQPvD6gc4d9OUcCNY3E+vvFkUJdEVp8k5LPwHJQzpHXTjnelNqrFTxcjkVR5TKunUTwmA3Ag/5P168neBb2mPXLObLgZWwp5392yw7IZkXxF7gs7DxPmz3xeoCBvpgEOqsCWZtXFvoLk9A9ChHg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4273.namprd10.prod.outlook.com (2603:10b6:a03:205::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 05:22:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 05:22:51 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Skip tst.depth.sh
Date: Wed, 12 Nov 2025 00:22:48 -0500
Message-Id: <20251112052248.13481-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0037.namprd16.prod.outlook.com
 (2603:10b6:208:234::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4273:EE_
X-MS-Office365-Filtering-Correlation-Id: f6560f0e-573a-40c8-ebb2-08de21ab865e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0XzwgRCM30tNKRSTT803g8DLDNzsNZF1kNhFT7qetycdXkcGzrUFAXCA0N7Y?=
 =?us-ascii?Q?OSkR9KqF+3mNKYWQJXjrr29zAKxt79JDkuJO8BA+WOXMG99E4H6ERf7uYI+/?=
 =?us-ascii?Q?MP/6LdEyDYPP+oUrCX74N2PZMkkgfYunVOBgSwKCooJVv1TE/BT0ObgBJvwS?=
 =?us-ascii?Q?F47SqQhN9g3DjXpBaQVYzBMbkpfRdMVzwydnw0JrKwy4nkuHbjBWztPDw/55?=
 =?us-ascii?Q?WPfleqHvZumE0fYL1n93ArlgmRRqFnwjJVPuNoEeGFunk/NcdziSJ+qI/Nr7?=
 =?us-ascii?Q?7P9K+C+zBThPEJ3uIyQ45bANy3DO9wZlwe9QEf6m+jBFEcJqDkNVTatxBDmc?=
 =?us-ascii?Q?vLo8Yx7Nib4njhSd+Qp1nEWUKvfidXonmdILX7beDXo+A+Bai8woa8n6Ar3u?=
 =?us-ascii?Q?k0vfakYh1C1H3N5N4qO043LLOSaEEe/bJ/bWHNLHnr/tvbAfEIf8BsnI95l5?=
 =?us-ascii?Q?TcsFDgDUHSjuZAxXdKVgfMhBIMGBsL97Mjb2BY8Zy0Vk7tBvsw3tc8LMu9in?=
 =?us-ascii?Q?yDTG8Lw4FtMT/RNe5NHiagLIzj5OOH9Na79PX85+CgmI03fUjwBaZ/5WUOvW?=
 =?us-ascii?Q?SS1u9j+H3E2rjiRMzc4Uflx6IsFnYUOU3dp+7VKu7Bd2s4g759YQNKj01RUL?=
 =?us-ascii?Q?yKbTTZs24EQ0eqzjZ1GtY09dnsjKagPisXbYmXeiH7RAjUzvN2wl1X5Dg0L5?=
 =?us-ascii?Q?UYSZHf3A6T0mCk3EHy1ZmD+VBIjLB6pzWfxqhmnsBVkg9CjmhiPOO8Ucammn?=
 =?us-ascii?Q?bWoXvY3HQcJUzAkrPP11153P3SJxRoNmD9P9XV08QMqQxoU788E8iPMPob7p?=
 =?us-ascii?Q?eEJYqSoiK4q8qFrqh7mFPq2G1ssIIUIgM7gK9c+Ac+1++mG6EgDOt9qRKDvd?=
 =?us-ascii?Q?roBoNEeI7QIoXXdVwoE05E7IGJftRzLg1upV6Lo2bCNAVlO44/9dwcxOC8Ir?=
 =?us-ascii?Q?c+MSV0xwFt5ozddLobkhDh6xfcvK9IbhmFRfWz9bEfRbeOs3AEzglN7pbaLX?=
 =?us-ascii?Q?lIBFRcHH5EQt8Q5PkCV1ufMAqRYQ01lv8nwI+dGny5KCFyD+8gNSZr5CXVCe?=
 =?us-ascii?Q?Q3RRCKAKJ8jT1YM9mDtxDJbpkPUptHNNNMHa+cb9bEUVDbPIgaAjqy9CTalw?=
 =?us-ascii?Q?JPwZkptbXHHq1vC/CmTptw3GSHgPTEpRUOSyV6egiKcsf2qrydQUU64TtBmo?=
 =?us-ascii?Q?38BCqv1iwhIKTzn5Rr/UlkeLse7V+lXO7tyalgQuMAtJ1Qbfz13qV3RFunoJ?=
 =?us-ascii?Q?tVso0PLY7T7rbjGoInfNkTnHQBhra+HYiiB42i4BoU39qP6FbT/pbW5KcpAd?=
 =?us-ascii?Q?NldG8F+Jo12u61xYGnvbmuUhUCXRKXDK/08UJR6IFxm3OzJDobBvVbbq5KYA?=
 =?us-ascii?Q?OowjU9paMKHFYP8ctry0QQ8/yWSBOrd4MrPjq1F1CG8+K9RaZkupLdbRbh1/?=
 =?us-ascii?Q?f2y8DZ4Bvj461ayyUbVV+JsZHRlLea4oAeflhEPSMdKumraIwuaqCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DuNZ87xZ2cTF5IL8SbxHwVTcFU3hf3jwmhZQu6HKyB/CXZsRT1epX+sKxC+O?=
 =?us-ascii?Q?jIEd4miEMXfsWTKdJDUA3kwudSwkdbK48e74IrqNlmIqokxdYy6F86uNOOS0?=
 =?us-ascii?Q?WVVWIh8y8fswy1u4BJLAMSohsqhXlsXhoN0EG2x3HH+TXueB+2tWyhKnaqYB?=
 =?us-ascii?Q?52oZmuNIO9BWU44A742vNrOh5KP+IHuHcL382lUW+QCOjIXvzM6JUKvtgQEU?=
 =?us-ascii?Q?2/ECiw9xCsH44iM1moDNl2EtbvlmV/RbK9bd5BQkGn5VXS3chVfHJseWnIdl?=
 =?us-ascii?Q?rp+4AOQWKWgkPfGeuT+TnZX32qacYJfUHElamFJgaeXNd1wxujqU5dBPUl1c?=
 =?us-ascii?Q?Iw885+hZwIOsTztd5goiOe5n+9qHeGdEJWXHslOHj3Lz0eCfe6g+IDHznCFF?=
 =?us-ascii?Q?tM0F31wwjfJz+nYnCizgxZqrskhpMi8lUwcr1dwtfClBQ93b+VOJq94qjgZo?=
 =?us-ascii?Q?kmop7MfFQlLn0LRNiwM/T8/sUJqgemqm1gWWtEyjFvKV71KgG3nkUnqXMces?=
 =?us-ascii?Q?cB02+RXdaaMLL5oChfJJiwpksQlpWPiTVtSBvWr3i5gIG0m61Rx9V3bKuSmm?=
 =?us-ascii?Q?8BoNBq8M1f9B3zWXkgGUJgqo8MW4acoo10qVVZxYoCQ3izclrDPoG+Xm6rzU?=
 =?us-ascii?Q?lGmjCOvE8u8BXL2xUekGsnSEAtHDKPbxNgDT/g/K3gPB8w2JB7oQ8qnsX7e/?=
 =?us-ascii?Q?uF6dWZw0XsTuByPy64qhLQvQxOT7O2pmpwjwAcLRN7fKpoO+8Rzp4jhUHPUc?=
 =?us-ascii?Q?SwFPD5ohRhOJbD/GZxrnKmGHS0ZZx4RqyMyotX5UaTm28kXVDXnPo20ve+EG?=
 =?us-ascii?Q?chJ7QBlrb1IKPUR2fwwX7QCKLDb9E6m09Lqib8OGRZJrhSDRTh3AmCuJm0gU?=
 =?us-ascii?Q?w2lWZOdJRzWFQZziqtqEAPEvsMwBgNiXQkeVHHWHisAnmKDozllAXN9PT1vz?=
 =?us-ascii?Q?KnvloyWZIB6j3i3NozAKbYrYsMSkHXJ2BIBr8sPCjD2+br410NsqHeb+OqXq?=
 =?us-ascii?Q?GRANXWrS+stilo5BO1Bz+MaziTx+daO05XiwWQzrXOnEOsuG3vlfp6vM2eUA?=
 =?us-ascii?Q?2kSzhByEJNA+9Yyf4h5bvWjVh9tkRpddZc18v3MxWdFmZyvrrZv3L6KJ+ki5?=
 =?us-ascii?Q?KbOvNGtfUHgbRaO5ED0NfPZKHnIV2sccUJikJYm7iNBQ5edjlvmFOhyw8AtH?=
 =?us-ascii?Q?IWoqb72+za+/mpIysI7KyFykQRHDxH6VIL1oEu6JJx9RiZYLPTnUZKkGHMwc?=
 =?us-ascii?Q?O9oFap391EQ4zgRcJdshZSS6//0pVdL+oT+FrzmgniR/LJcCm7G6t1NKeIU0?=
 =?us-ascii?Q?/3gWV9MhqWraSO100lIrzxcxn0NzGuf+LfTcZqvo/d8FDSBaCN4FF5hz8aeg?=
 =?us-ascii?Q?4LuoyyDS5lW2eKQFm6f+PVfWUkV+LFiTmvwYasFKbdkHiCSbdLrikJS24Q+U?=
 =?us-ascii?Q?pRKp+arOqjcmOrRtwlXTgOTZTkCQ2og+rAPp6uWhjBgCTYix3FrfpCpLB060?=
 =?us-ascii?Q?OiE44KtaCSZv/Kc/JZkQuBm+wCEun2XbmnK2r7rxHj8lUF3oOOeVJVNOy2il?=
 =?us-ascii?Q?pY25Rb2rdv7KwyoyBFifK/m50oS7hZCc+Mi/FQ7e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fCSd7zUkf/1HGeZL9tfdYRe5z97mSc5w+BB+PMrDMLd6QVslrHBu0rXW3Y2nZDu4NT8+4QJuFDydvO3B22lHLDebRSlD/2Jawvi+maUs/B4T/3R+8aX02mB2EmqpxptdHIe174M0VXc5uRT+na/YsimaF3UlnGTKo9KbqFxySfmjyFHR5W5nE7t18e1gH3Nmhb4Owm1iQ6zReUwFD6UozeDE+A8iYoMz3aZIudc1WBVDK874tuL64bktL6jPGFtwOD9b4AQeL/fNRfDwSmCnWJDhWohWvZ+vuYD+rhw/3pAAM3dRQLyuQH9URKM7eNbx1vPNZ1XMsP1+/4TM7MKAuWlGrffnq7brpDMXxiszC08BZAwu+GyK7n/10CLNMq3McakD3znKnJEPP5G1Iliulypa1yR52OXBEeBSJFngmQb1TwTRIr3GZF2JSPiZ21OoTt3xUBU61kO8S0Paoonz5A5u46UdzMnk6IG/pEIhbXpcLJS2QpbDrgO0IWY5Sg/5AHNmWCbmJag+KkuB8TWpfilrHy1a9V4ibsuKrR5IO95cDH9t/1V9Kho2MWeKyzfQUMNoDRe/4nPl3X11PFLRu3ZwP9fL1yHDEC+6QH9bITI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6560f0e-573a-40c8-ebb2-08de21ab865e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 05:22:51.3455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6LQmLWzTsOovjl40T/AIm8Bjo7hi8UyheM0CXkTv6CTRC2ENgm8SRIWQMooviiyCzs78YOFu/+roLU2YwS2d+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4273
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511120039
X-Proofpoint-GUID: piWh-EyaoYNN5crkdD9kN_RHckFdMtFb
X-Authority-Analysis: v=2.4 cv=c+SmgB9l c=1 sm=1 tr=0 ts=691419ae b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Lm7jQZcvG5LuCtinjiMA:9 a=8Y6zDpjSdwQA:10
X-Proofpoint-ORIG-GUID: piWh-EyaoYNN5crkdD9kN_RHckFdMtFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAyMyBTYWx0ZWRfXwZAu78YC6YsY
 bLgQS8dI/3dO8Y/K25zDvipEKd0QREoBYUE78S8p/2dpjCJF9NuqWpc+4kA7J6Agua1df0YEzOQ
 zPT+maQLTK/6W8grqXOnAx/JMODsvEeArE8O6/Thg/gjDhe05mwUKxLsTtLX3U+3WrnYiXgBNQY
 EdBn69XuShcDCoN7/yAwhiVJr2NO8AIfH+ZvWIjfJ3RpFrlCJcb1S5lKypaSpf0Ky/+dAS5d4YO
 JRAyvBazt30mzvvjEdr9fyojsGs2os0In8Odg0S+dFD54PA2Rlwh1kEeqSrPbmHzG8kyf+eA/Vb
 ycerVh513OS+VpNDF9YVQ2BSOCs0dHqsm4tZp5eXoDXh8Kd1OK2lOHj+DFU+XlDsuStLpCpSu0h
 FSBDzl7lwPyfc/Usny+IfpDe6aGc5Q==

From: Eugene Loh <eugene.loh@oracle.com>

The test asks for very many pid probes.  E.g.,

        pid$target:::entry,
        pid$target:::return,
        pid$target:a.out::,

If it is successful, this can wreak havoc on some systems, in some cases
leading to 1-2 dozen subsequent tests failing due to cascading problems:
poor test clean up, triggers left running, persistent loads, pid=0 not
running, tests timing out, and so on.  These problems require
investigation.

For now, skip the precipitating test.

See
https://oss.oracle.com/pipermail/dtrace-devel/2025-November/006916.html

Orabug: 38642080
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/ustack/tst.depth.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
index dec16a3aa..4a67291de 100755
--- a/test/unittest/ustack/tst.depth.sh
+++ b/test/unittest/ustack/tst.depth.sh
@@ -1,10 +1,10 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
-# @@xfail: dtv2
+# @@skip
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.47.3

