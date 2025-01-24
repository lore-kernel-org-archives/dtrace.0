Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF56923FC69
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738942739; cv=fail; b=VLA/xis5PiyaI/BwX3fuyFtKB3cuUe7WWMakd5LCnIwxFReA3rYnbrHCinNnR58S06shRwTy5zLFX79zTVE5oDnlkUUeSEUnztmmLpIhgL81BtlezMMAkzeUWbpHjU2JhAVimE8vssjB7xMW/CJAHgjUwjBpccdzy5pCx3jCio4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738942739; c=relaxed/simple;
	bh=9agxqstkyaeqGzz9QzR6U4i1aKUgP3kBJ3XtLGq4zHs=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=AX7KjekAvPV2/2PNS/50gdnRElXQEkwM+m6fIJNyAOpcU0KcNiPib9R/9NIspxYH9qFi/WHNOAwzGrLlyvab/FTT7HXCDUVD59l7uzZSznZO1mIR/8wWxvkX43blnefAYDhIiikaTwWIO0Hnba+5oWwkkigGe73W7bwnH7nxmYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fNB6LP6l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Bruk70OL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fNB6LP6l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Bruk70OL"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517EkdZX031719
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 15:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=SVC/aOdJCZhpFW3Dlgy0K60748TaneCCNa4MbcQocEg=; b=
	fNB6LP6lLbiPD+CGXyMDeEY+yoyQBPzCq/JMvlTyGEURGldl+Ah/xgMaeuCL+uJG
	ik5oaUnEl+o4cfz9mMIxx0AtKdWXc1GS/bzar9z9cbQBON2fxROyATUHJrWqZIBo
	pFLiaFVBTiVsy3AQVwlsuVsiJHF+ofLBvl87wsThjFBu+VmCCuyYQXP7Z3e9ri0M
	Xk4s0LRvLszCXccPQgqqFiVABiHRRy8E0tF4TrrdtwYNzasviieH+9YO9HU/ALe+
	dFIkaOybbquhEBHURDU1SqpbXjdq8OLjcNEsJpG9IifuzPTP7E1ZuRkDJ8YWNenq
	S4D4jdvvmhTvDe6LE8PdZw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44n0nb1yj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 15:38:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517Ek8MJ027776
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 15:38:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p7cyc6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 15:38:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IChqMvHSgjgcF14Kuv9/U9nA8LqA8nkH5w3LmbRnJZcRsaC+Qs24JTpcs26cRQB6NWcDKkHU2XlNprX1FNoq48UrUBjodsO+fLXQbTjGxr8vsK31ChmqTQtaFzgfJPQp4FPFQyIKu3he/ivBbZT+dFHpDS3IrHqvmXo+NlZlZQzGIrlmnGiERO22LLX9gQB/hMt8Gsr+B7WxU6EtVcppR/j49YyD0BXiQ/zuGqT8gyBJZ7zRzVwiKhlX8hM0iws9pOWJPjqpECqpZ2QFp+Q+9iP50dXewboqIO2qmzvaM0/zgFcPXc5EyBWXsblAbYfyBSx+C74LzhkO2iFL5wiP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVC/aOdJCZhpFW3Dlgy0K60748TaneCCNa4MbcQocEg=;
 b=jNo6wliaD6DNURdkRAcgNJt9OPm+ZZTdwAJzG5Qdujxqjkh8tNYmKtipSLDXpv8x0DTcn130g96wxrjPtKXnk2jyPUMgt+3v4Q3RObgA2FSqnBU5RJZpJ79If/CikPxaHqT5sOfJYef0qgCxIoGtVoJUe+7FgixDLbO2O0xNYQ75nCwqn7Gki+wWv5HQhxsbiifuGZayLGHc7Q8JmbvvMfiu6ABwNY8iCka7ctNy9s4Ys7dI2exTGXa3nzyjQlhcDfxAoXK2zjen3TKJcqUNTFDrinN8qPQJKgogvKirwWjT9OKtohTONwiqW3jxR5rkb2PGoLcyNPwTs2zagxM0dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVC/aOdJCZhpFW3Dlgy0K60748TaneCCNa4MbcQocEg=;
 b=Bruk70OL3Hc5FaikO+bwlinBGiwUVlR8Mwvn3/YKwMNWMsWIEOM/vYPLYB6eAk5rzQpKu+e+dNQ5hGAAqbhj4UMbLF4WpgCLxLtNxd0NjxHOecfLJ7P9nkh9IFEmJOm968EFiCUo/7bOsy8US0IE0UfGl3c8wPKIxvlR/DKlWX4=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by CO1PR10MB4628.namprd10.prod.outlook.com (2603:10b6:303:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 7 Feb
 2025 15:38:47 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%7]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 15:38:47 +0000
Message-ID: <bd8205def53845aa0fd280ea1502998f.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Fri, 24 Jan 2025 02:17:54 -0500
Subject: [PATCH v3] procfs: implement execargs for pr_psargs translator support
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:a03:117::17) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|CO1PR10MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 25d9138c-b836-4d07-077c-08dd478d82eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KHYI7y0xV80Onk5qp2K3EBdRxcRFRiQcJ87GsvPUQv5XSEdhw8MC8BU8U3zS?=
 =?us-ascii?Q?Ids7yvJp+M4t1z9g0hCYxeAUTkLJdRYWeQ1ixttrES18myPNVkDf7nnsRD45?=
 =?us-ascii?Q?104nt4CPAPsPmr3egmt2C/tZSBH3Dp5nb5fy4BTmE/NcNxkYUL0tHCP2uBHX?=
 =?us-ascii?Q?G3Ssn4A+MlXaQa8mHpBJEXXZuy2cF6b8LWpoRAVaQgSC4sW8N2B3oW6wN4bB?=
 =?us-ascii?Q?Xtd1blCkGSvIywg42avMtE2a2gHBeuXW0YK5IGBJAmaW0Ihl1AsIvCCS8lbH?=
 =?us-ascii?Q?i84nq2QNSiXZckhadWEnPh+jXO6UjwSjDbS5vo1xT/HnD72fCBByzgTldqGO?=
 =?us-ascii?Q?dE10mRFDUhrc7b1KcLkgiuQKvQQnhorR7OQnnHVNmtgnpUbnPq+qigqCfEsP?=
 =?us-ascii?Q?c0u/xhacx9/oqtN30DNht2WJ9oHXz9cqGfb9+9Ap5JafBzG4zDIIeLR/F87R?=
 =?us-ascii?Q?NPPO+q0CkO//8SYXbiKEbkuvEwCkH7lJxTDYfB0PH4kxDGYnUeDnLOF0U9F3?=
 =?us-ascii?Q?DdBTBtf3YKLHbNyz8bqNFZ2m1a58RY0bQxF85BDEdLenExbNvDJ9AMQ8tC2B?=
 =?us-ascii?Q?htV32QZOCsLZwHI7T1TILC55P7dUMECIfKSak+7XzEzEjLr6bMXwlAFSKT36?=
 =?us-ascii?Q?STGvF5CyJrCVDT0Mx6/2wE6xwa1Xx7Njc2JpO4TIx84sKu21HqcRcHnfo6ZO?=
 =?us-ascii?Q?f/JLVpTyCJrPxsUxdAuPP4cidLrsbAmhODgRO8wHWPwh29o+KwoZAML2fRdw?=
 =?us-ascii?Q?OevEL5cWh0AjP032H44cRXO5q27YQaRNNWbvbFSWcngPCvEaFuTeARrDUHfy?=
 =?us-ascii?Q?esWWYZ6SjbgwcXCpx5RcZcwi7ldv4m/P3VD/d/3ya9BI2eaYW3l8QuCp8VGY?=
 =?us-ascii?Q?qRlgGKLGJbHlgcB6uZcuhhqgt0Hq2D4ETneE8JOycBzhP3RL5DRsqFKnUSfo?=
 =?us-ascii?Q?yogIL5Mt6Y/j5T8WIMF7bohGQew6noqKL8Lt+7Fype2TGn0KnsKTOy4gphSt?=
 =?us-ascii?Q?BQ0dwYDP/GU+o7TG2q8L74ZJGYxJAglGtpAdQuVyCOjjLJKpVi7KvsIgcUhA?=
 =?us-ascii?Q?elG7ndDhbl0NhA/Vu4NpGSaJAexpOwoHJ0RIi2/GNKrczGQJbrvDQ/m+WbHf?=
 =?us-ascii?Q?+/LFVXIwB1rDK6szsUSEv6Ed2yx6tsDb1uxsvs88dZvMca/GtWwr/m61MGLw?=
 =?us-ascii?Q?PlpksWFhB9mcvUC/gsEOd86gWESDe3jtMCyYFE814/trAkOH4wREL+YOM4rg?=
 =?us-ascii?Q?15wEPwfJ8a5sL14cP95peX8aFnprSOpdBJ5kYtd0ZAosQ6u/apoCCmtzTSE+?=
 =?us-ascii?Q?glEDz4UiQadsKzk7ZL64k+NE9MRwZfzn/Gfai3CC+tYZrQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tqbtjVnwlZ7xi9ji1im13xryNqeATmrGZI0Wclq0F8yGf5lawxaFF3xGHOrI?=
 =?us-ascii?Q?7aiiP6ovgWmPnpOJVbRUCrL/lFyIYEiQzLVHApugkbR3sI9mxfIZnQDYOa1U?=
 =?us-ascii?Q?wCZ20PBLHBr/A142li9mMfcC1d3Roy85ybwxUX2mbUPM4ynXVY1c0P6Kn7p8?=
 =?us-ascii?Q?hV59m4d072T7PLHDzLBVYRHYHH1sodwqJP2YGtj0eQTxgb85PzXlDGhKFqI8?=
 =?us-ascii?Q?p3071Bk5X6p6bZRO15BESIV9wQhP7gX76owBG5V7G7vlj6U8/NxHF1z2ee+P?=
 =?us-ascii?Q?v/2s5ql/ueWmXot/mux92tusvNacE5UqRb4IYXuW4JNjCi20MNqPFGp3o/HB?=
 =?us-ascii?Q?Yu/h1DCMbPyxdDy9H89z6ILD4qPd+kWPJtLk5B74/qOuDQHl7IQ8KFAcCp9/?=
 =?us-ascii?Q?tBVHoVpoeVoazyC4lSgEhHOITIsftgtrd2c8/Mr1CwLJGFFQAWVVfab/uU9B?=
 =?us-ascii?Q?3DH6bzXIf2VE4S39pbvXhOCb4ziVmcacCpqhZNo9IjEGu11BNMyH4Uk5ihmQ?=
 =?us-ascii?Q?2qdglDPup2quBXfMKFsBU3NPsNuPwyHQjawDflBRt1EGagQVZQaHB31+cdIm?=
 =?us-ascii?Q?it1ow7lmu+eXNjM+qruVnuUJbQ+1AJTYCumgsAT3ZBoIWQgFpiCyn1hXJOoe?=
 =?us-ascii?Q?G+rjpFY5ME3t0iBgBG/Fqq17osQdUN3c/fZl0G0/urpNkUyN6Y8JilttM8Rk?=
 =?us-ascii?Q?otKU9oFkJ3O0E6BrhNQesHzGrnCiINDhRgITimOM8dW/wuU0UXXXp1w2luEC?=
 =?us-ascii?Q?32tuWLYUFTWVgKLoQAI79zSpJhgdmdzJKyXd7LhxkXbqque5k/8kdFBD6zho?=
 =?us-ascii?Q?QEpJSChDqyn/qvRVprOvlS8YUip+AC/lIHPZtDHdkgR7WoPZRwnv/XjOw+iD?=
 =?us-ascii?Q?Pe+CVtK9/A710BBBqQBB0n0K9d+WMly5YiqPKHJ8zswbWKJCPIACM/eyqwI8?=
 =?us-ascii?Q?tEv7qhE48bvxbRX516Mc/peIDCzM+HxTL0zPsf0i2CIkLSaFNV5qUqxk9r31?=
 =?us-ascii?Q?XySdpabwsvi1Rdg+yPgPS0srWZM198DvsLTCzAN8qEiKoScdO/LRgEh8vQW+?=
 =?us-ascii?Q?wz7uxPq46chTvNpcoI1y2MT5rCbRHorEPWE0vI7c3xbj/zuGbId2z+MKvr8F?=
 =?us-ascii?Q?iAXZ49PaJK9kCx5Q8E7ydHF+my6Rn6pF61RrSX+Gth45FriSE2bbWTxb59Gq?=
 =?us-ascii?Q?wp87ikL97BnebvSd5VcZuVc38LpS50An+f5JyFF1ZufeIZu4aBsVE4z6UKr4?=
 =?us-ascii?Q?0vw4hjw+z6cESfCyFfJofWtSKEc41ZeeerwQxmDeleUYKdBDarJGZ4lA+ERj?=
 =?us-ascii?Q?J3zMI6I5H4r5gk1E1Mtcb9Udel4oQcihnG2HILfpKIKaArd5BfszzqIQ6REP?=
 =?us-ascii?Q?ECBnOcaowY9AZEZhBppDZ7wYzcVHUQQQjst+KN9tuox2YA7H7iyw5gC10x9q?=
 =?us-ascii?Q?WEZieE1v3fruZoW4F/kQFgRetZ4IoMNVBYtBQh/a8kq+Ze5KldmJ/qSEAbN1?=
 =?us-ascii?Q?qkSz/2VTMPtsyUWyYA1Sn34UViq4BKr/Phi4SQGsmJfGothpAIiTIKarKpak?=
 =?us-ascii?Q?ymlmmfrQZc+najFs/fngjOKtBVhyWKG0nWBIhMVHF0KAD5YgQ8SGUE7cUCsy?=
 =?us-ascii?Q?XPl+U6p1MOXfW8W1tO+XuBQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1NnrhuGCKi79FEknhDEBviEG5dpT4d0qRwWULrxgnFTCNwaG2sQLBkMC/3TAhKhEnzDfhpTqqkPRMJMnGZyXSTGAt925P7yekjhc3V4HTLaQydK0kSKwsdfwcYPKcTWPiSJZLSs4E93JtxnYKJJ/s6cXBeb/Jl2mqaUK/MRkQARiE3XVx4RokMNEcTehWL4VGpU8yUrZHTt2D8fur1NDg6fregfpN4yegg0Muze6aPaEq41fX602SOmHYN6F1YhT/H8QC2auMitaOnUkMcsLYu94RQxWaC8OaVMbzFj6FSINda5Rw2zJs5F8LWLQYwDe2EA9Cobl/WMT+it9jr20QZz3OpVJvg4b/C1K4GkbfiSKE3CKLLDMzuILFUXNkGfuk604qzB74jGkmrBHlHSob+fjJIXhnCnEjJOuI/zfS4AHv64h5pyOES6zkyWj0+AjJWr8ItCfxW6M3gsddCCu0YNmNUXM6NTypcTuTdciTJSqwEGCI9VLX0lUh6yef9OOc98aM66AqNzV2maIT7mHacLcfoqXujO1jvgj+86Jj9DJFHPpQEVCEsN8cuK4MU4vcTT1+IAX2wV/98C/tykNOjTTI2Q4H1goFf/be3vsO9Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d9138c-b836-4d07-077c-08dd478d82eb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:38:47.0102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fM1sPGIxYymQesWNXOPk28W0266Gt5SxQFgWPJXOQVVTuPP06shz7HFvz8zAmZQ0ASK9HIjC53kh+be5YJa/oWxzpwyFawx9ybqbO6krt0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4628
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070119
X-Proofpoint-ORIG-GUID: ctrHE7oRPcer0Et0iCBe6We9MqqEqGAf
X-Proofpoint-GUID: ctrHE7oRPcer0Et0iCBe6We9MqqEqGAf

Implement a new execargs built-in variable to provide the ps-style
argument string for the current task.  It is used in the psinfo
translator for the pr_psargs member.

Due to BPF limitations, it is only possible to retrieve this information
for the current task.  The data is stored in the task's address space,
and the only BPF helper that can access data in another task's address
space is not allowed to be used in non-sleepable programs (such as
tracing programs).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/Build                                     |  1 +
 bpf/bvar_execargs.S                           | 97 +++++++++++++++++++
 dlibs/aarch64/5.11/procfs.d                   |  4 +-
 dlibs/aarch64/5.12/procfs.d                   |  4 +-
 dlibs/aarch64/5.14/procfs.d                   |  4 +-
 dlibs/aarch64/5.16/procfs.d                   |  4 +-
 dlibs/aarch64/5.2/procfs.d                    |  4 +-
 dlibs/aarch64/5.6/procfs.d                    |  4 +-
 dlibs/aarch64/6.1/procfs.d                    |  4 +-
 dlibs/aarch64/6.10/procfs.d                   |  4 +-
 dlibs/x86_64/5.11/procfs.d                    |  5 +-
 dlibs/x86_64/5.12/procfs.d                    |  5 +-
 dlibs/x86_64/5.14/procfs.d                    |  5 +-
 dlibs/x86_64/5.16/procfs.d                    |  5 +-
 dlibs/x86_64/5.2/procfs.d                     |  5 +-
 dlibs/x86_64/5.6/procfs.d                     |  5 +-
 dlibs/x86_64/6.1/procfs.d                     |  5 +-
 dlibs/x86_64/6.10/procfs.d                    |  5 +-
 include/dtrace/dif_defines.h                  |  1 +
 libdtrace/dt_bpf.h                            | 21 ++--
 libdtrace/dt_cc.c                             | 33 ++++++-
 libdtrace/dt_cg.c                             | 26 ++++-
 libdtrace/dt_dlibs.c                          |  3 +
 libdtrace/dt_open.c                           |  2 +
 libdtrace/procfs.d.in                         |  5 +-
 .../builtinvar/tst.psinfo-bug21974606.d       |  4 +-
 .../builtinvar/tst.psinfo-bug22561297.d       |  8 +-
 test/unittest/builtinvar/tst.psinfo.d         |  8 +-
 test/unittest/builtinvar/tst.psinfo1.d        |  8 +-
 test/unittest/proc/tst.pr_psargs.d            | 36 +++++++
 test/unittest/proc/tst.pr_psargs.r            |  2 +
 test/unittest/proc/tst.pr_psargs_other_task.d | 37 +++++++
 test/unittest/proc/tst.pr_psargs_other_task.r |  9 ++
 test/unittest/variables/bvar/tst.execargs.d   | 23 +++++
 34 files changed, 319 insertions(+), 77 deletions(-)
 create mode 100644 bpf/bvar_execargs.S
 create mode 100644 test/unittest/proc/tst.pr_psargs.d
 create mode 100644 test/unittest/proc/tst.pr_psargs.r
 create mode 100644 test/unittest/proc/tst.pr_psargs_other_task.d
 create mode 100644 test/unittest/proc/tst.pr_psargs_other_task.r
 create mode 100644 test/unittest/variables/bvar/tst.execargs.d

diff --git a/bpf/Build b/bpf/Build
index 3e43f4b6..a9fb100a 100644
--- a/bpf/Build
+++ b/bpf/Build
@@ -23,6 +23,7 @@ bpf_dlib_SRCDEPS = $(objdir)/include/.dir.stamp $(objdir)/include/bpf_asm_helper
 bpf_dlib_SOURCES = \
 	agg_lqbin.c agg_qbin.c \
 	basename.S \
+	bvar_execargs.S \
 	cleanpath.S \
 	dirname.S \
 	get_agg.c \
diff --git a/bpf/bvar_execargs.S b/bpf/bvar_execargs.S
new file mode 100644
index 00000000..1c47cafb
--- /dev/null
+++ b/bpf/bvar_execargs.S
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Oracle and/or its affiliates.
+ */
+
+#include <bpf_asm_helpers.h>
+#include <dtrace/faults_defines.h>
+
+/*
+ * uint64_t dt_bvar_execargs(const dt_dctx_t *dctx, char *args)
+ */
+	.text
+	.align	4
+	.global	dt_bvar_execargs
+	.type	dt_bvar_execargs, @function
+dt_bvar_execargs:
+	stxdw	[%fp+-8], %r1			/* save dctx to stack */
+	mov	%r9, %r2			/* %r9 = args */
+
+	mov	%r6, 0				/* set %r6 in case of error */
+	call	BPF_FUNC_get_current_task	/* get curthread (T) */
+	jeq	%r0, 0, .Lerror
+
+	mov	%r6, %r0
+	add	%r6, TASK_MM			/* %r6 = &(T->mm) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
+	jeq	%r8, 0, .Lempty
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
+
+	mov	%r8, %r6
+	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
+	jslt	%r8, 2, .Lempty
+	mov	%r0, STRSZ
+	jslt	%r8, %r0, .Llen_ok
+	mov	%r8, %r0
+.Llen_ok:
+
+	/* read data from arg_start to arg_end */
+	mov	%r1, %r9
+	mov	%r2, %r8
+	mov	%r3, %r7
+	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
+	jne	%r0, 0, .Lerror
+
+	/* loop over args and replace '\0' with ' ' */
+	mov	%r1, %r8
+	sub	%r1, 2
+.Lloop:
+	mov	%r2, %r9
+	add	%r2, %r1
+	ldxb	%r0, [%r2+0]
+	jne	%r0, 0, .Lnot_nil
+	stb	[%r2+0], 32
+.Lnot_nil:
+	sub	%r1, 1
+	jsge	%r1, 0, .Lloop
+
+.Ldone:
+	mov	%r0, %r9
+	exit					/* return args */
+.Lerror:
+	ldxdw	%r1, [%fp+-8]
+	mov	%r2, PC
+	mov	%r3, DTRACEFLT_BADADDR
+	mov	%r4, %r6
+	call	dt_probe_error
+.Lempty:
+	mov	%r0, %r9
+	stb	[%r9+0], 0			/* args[0] = 0 */
+	exit					/* return args */
+	.size	dt_bvar_execargs, .-dt_bvar_execargs
diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.11/procfs.d
+++ b/dlibs/aarch64/5.11/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.12/procfs.d
+++ b/dlibs/aarch64/5.12/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
index 584ac325..ef27bb70 100644
--- a/dlibs/aarch64/5.14/procfs.d
+++ b/dlibs/aarch64/5.14/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
index 5aabc6f1..cad2d2c5 100644
--- a/dlibs/aarch64/5.16/procfs.d
+++ b/dlibs/aarch64/5.16/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
index 683ff5a8..6b1b1b9c 100644
--- a/dlibs/aarch64/5.2/procfs.d
+++ b/dlibs/aarch64/5.2/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.6/procfs.d
+++ b/dlibs/aarch64/5.6/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.1/procfs.d
+++ b/dlibs/aarch64/6.1/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.10/procfs.d
+++ b/dlibs/aarch64/6.10/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
index 7274554e..f0071440 100644
--- a/dlibs/x86_64/5.11/procfs.d
+++ b/dlibs/x86_64/5.11/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
index 7274554e..f0071440 100644
--- a/dlibs/x86_64/5.12/procfs.d
+++ b/dlibs/x86_64/5.12/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
index d1cf90d3..17f95e5c 100644
--- a/dlibs/x86_64/5.14/procfs.d
+++ b/dlibs/x86_64/5.14/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
index 5aabc6f1..f924c2a1 100644
--- a/dlibs/x86_64/5.16/procfs.d
+++ b/dlibs/x86_64/5.16/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
index 35538862..36608ad0 100644
--- a/dlibs/x86_64/5.2/procfs.d
+++ b/dlibs/x86_64/5.2/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
index 7274554e..f0071440 100644
--- a/dlibs/x86_64/5.6/procfs.d
+++ b/dlibs/x86_64/5.6/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
index 5d7873b5..a3d7f949 100644
--- a/dlibs/x86_64/6.1/procfs.d
+++ b/dlibs/x86_64/6.1/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
index 5d7873b5..a3d7f949 100644
--- a/dlibs/x86_64/6.10/procfs.d
+++ b/dlibs/x86_64/6.10/procfs.d
@@ -141,9 +141,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index c8c1d961..9f6e3b55 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -162,6 +162,7 @@
 #define DIF_VAR_GID		0x011f
 #define DIF_VAR_ERRNO		0x0120
 #define DIF_VAR_CURCPU		0x0121
+#define DIF_VAR_EXECARGS	0x0122
 
 #define DIF_SUBR_RAND			0
 #define DIF_SUBR_MUTEX_OWNED		1
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 6518de66..85934d2d 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -47,15 +47,18 @@ extern "C" {
 #define DT_CONST_TASK_TGID		12
 #define DT_CONST_TASK_REAL_PARENT	13
 #define DT_CONST_TASK_COMM		14
-#define DT_CONST_MUTEX_OWNER		15
-#define DT_CONST_RWLOCK_CNTS		16
-#define DT_CONST_DCTX_RODATA		17
-#define DT_CONST_RODATA_OFF		18
-#define DT_CONST_RODATA_SIZE		19
-#define DT_CONST_ZERO_OFF		20
-#define DT_CONST_STACK_OFF		21
-#define DT_CONST_STACK_SKIP		22
-#define DT_CONST_NPROBES		23
+#define DT_CONST_TASK_MM		15
+#define DT_CONST_TASK_MM_ARG_START	16
+#define DT_CONST_TASK_MM_ARG_END	17
+#define DT_CONST_MUTEX_OWNER		18
+#define DT_CONST_RWLOCK_CNTS		19
+#define DT_CONST_DCTX_RODATA		20
+#define DT_CONST_RODATA_OFF		21
+#define DT_CONST_RODATA_SIZE		22
+#define DT_CONST_ZERO_OFF		23
+#define DT_CONST_STACK_OFF		24
+#define DT_CONST_STACK_SKIP		25
+#define DT_CONST_NPROBES		26
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 29cfbd84..1dc119ea 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_TASK_PID:
 			case DT_CONST_TASK_TGID:
 			case DT_CONST_TASK_REAL_PARENT:
-			case DT_CONST_TASK_COMM: {
+			case DT_CONST_TASK_COMM:
+			case DT_CONST_TASK_MM: {
 				ctf_file_t *cfp = dtp->dt_shared_ctf;
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
@@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				case DT_CONST_TASK_COMM:
 					rc = ctf_member_info(cfp, type, "comm", &ctm);
 					break;
+				case DT_CONST_TASK_MM:
+					rc = ctf_member_info(cfp, type, "mm", &ctm);
+					break;
+				}
+				if (rc == CTF_ERR)
+					goto err_ctf;
+				nrp->dofr_data = ctm.ctm_offset / NBBY;
+				continue;
+			}
+			case DT_CONST_TASK_MM_ARG_START:
+			case DT_CONST_TASK_MM_ARG_END: {
+				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_id_t type;
+				ctf_membinfo_t ctm;
+				int rc = 0;
+
+				if (!cfp)
+					return dt_set_errno(dtp, EDT_NOCTF);
+
+				type = ctf_lookup_by_name(cfp, "struct mm_struct");
+				if (type == CTF_ERR)
+					goto err_ctf;
+
+				switch (idp->di_id) {
+				case DT_CONST_TASK_MM_ARG_START:
+					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
+					break;
+				case DT_CONST_TASK_MM_ARG_END:
+					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
+					break;
 				}
 				if (rc == CTF_ERR)
 					goto err_ctf;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index b48e27f0..5268e900 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3341,7 +3341,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	}
 
 	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
-	/* Special case for arg0 through arg9; encode as args[n] */
 	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
 		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
 		idx = idp->di_id - DIF_VAR_ARG0;
@@ -3351,6 +3350,31 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		   idp->di_id == DIF_VAR_PROBENAME) {
 		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_probedesc");
 		idx = idp->di_id;
+	} else if (idp->di_id == DIF_VAR_EXECARGS) {
+		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_execargs");
+		assert(fnp != NULL);
+
+		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		dt_cg_tstring_alloc(yypcb, dnp);
+
+		if (dt_regset_xalloc_args(drp) == -1)
+			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+		dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_1, DCTX_MEM));
+		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, dnp->dn_tstring->dn_value));
+		dt_regset_xalloc(drp, BPF_REG_0);
+		emite(dlp, BPF_CALL_FUNC(fnp->di_id), fnp);
+		dt_regset_free_args(drp);
+
+		dt_cg_check_fault(yypcb);
+
+		emit(dlp,  BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
+		dt_regset_free(drp, BPF_REG_0);
+
+		return;
 	} else {
 		char	*fn;
 
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 07d22afd..9ad4f5e7 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
 	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
 	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
+	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
 	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
 	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
 	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index a0205887..51c056b2 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -153,6 +153,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	&dt_idops_type, "uint64_t" },
 { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "int" },
+{ "execargs", DT_IDENT_SCALAR, 0, DIF_VAR_EXECARGS,
+	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "string" },
 { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
 	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
 { "exit", DT_IDENT_ACTFUNC, 0, DT_ACT_EXIT, DT_ATTR_STABCMN, DT_VERS_1_0,
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index 038cf69b..adcb1889 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -179,9 +179,8 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = T == curthread ? execargs
+				   : "<unknown>";
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/test/unittest/builtinvar/tst.psinfo-bug21974606.d b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
index 68d9503d..67fea54e 100644
--- a/test/unittest/builtinvar/tst.psinfo-bug21974606.d
+++ b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To ensure pr_psargs does not have an (extra) trailing space.
+ * ASSERTION: To ensure pr_psargs does not have an (extra) trailing space.
  *
  * SECTION: Variables/Built-in Variables
  */
diff --git a/test/unittest/builtinvar/tst.psinfo-bug22561297.d b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
index b9efd0ec..5a9fe333 100644
--- a/test/unittest/builtinvar/tst.psinfo-bug22561297.d
+++ b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To print psinfo structure values from profile.
+ * ASSERTION: To print psinfo structure values from profile.
  *
  * SECTION: Variables/Built-in Variables
  */
@@ -32,12 +30,14 @@ tick-10ms
 	printf("address of process = %p\n", curpsinfo->pr_addr);
 	printf("address of controlling tty = %p\n", curpsinfo->pr_ttydev);
 	printf("process name = %s\n", curpsinfo->pr_fname);
-	/* These are still getting faked */
 	printf("initial chars of arg list = %s\n", curpsinfo->pr_psargs);
 	printf("wait status for zombie = %d\n", curpsinfo->pr_wstat);
+/*
+ * These are not implemented yet.
 	printf("initial argument count = %d\n", curpsinfo->pr_argc);
 	printf("initial argument vector = %p\n", curpsinfo->pr_argv);
 	printf("initial environment vector = %p\n", curpsinfo->pr_envp);
+ */
 	printf("process data model = %d\n", curpsinfo->pr_dmodel);
 	printf("task id = %d\n", curpsinfo->pr_taskid);
 	printf("project id = %d\n", curpsinfo->pr_projid);
diff --git a/test/unittest/builtinvar/tst.psinfo.d b/test/unittest/builtinvar/tst.psinfo.d
index 92f91de7..09bcce86 100644
--- a/test/unittest/builtinvar/tst.psinfo.d
+++ b/test/unittest/builtinvar/tst.psinfo.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To print psinfo structure values from profile.
+ * ASSERTION: To print psinfo structure values from profile.
  *
  * SECTION: Variables/Built-in Variables
  */
@@ -31,12 +29,14 @@ tick-10ms
 	printf("address of process = %p\n", curpsinfo->pr_addr);
 	printf("address of controlling tty = %p\n", curpsinfo->pr_ttydev);
 	printf("process name = %s\n", curpsinfo->pr_fname);
-	/* These are still getting faked */
 	printf("initial chars of arg list = %s\n", curpsinfo->pr_psargs);
 	printf("wait status for zombie = %d\n", curpsinfo->pr_wstat);
+/*
+ * These are not implemented yet.
 	printf("initial argument count = %d\n", curpsinfo->pr_argc);
 	printf("initial argument vector = %p\n", curpsinfo->pr_argv);
 	printf("initial environment vector = %p\n", curpsinfo->pr_envp);
+ */
 	printf("process data model = %d\n", curpsinfo->pr_dmodel);
 	printf("task id = %d\n", curpsinfo->pr_taskid);
 	printf("project id = %d\n", curpsinfo->pr_projid);
diff --git a/test/unittest/builtinvar/tst.psinfo1.d b/test/unittest/builtinvar/tst.psinfo1.d
index 9e6d5053..be9e251c 100644
--- a/test/unittest/builtinvar/tst.psinfo1.d
+++ b/test/unittest/builtinvar/tst.psinfo1.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To print psinfo structure values.
+ * ASSERTION: To print psinfo structure values.
  *
  * SECTION: Variables/Built-in Variables
  */
@@ -29,12 +27,14 @@ BEGIN
 	printf("address of process = %p\n", curpsinfo->pr_addr);
 	printf("address of controlling tty = %p\n", curpsinfo->pr_ttydev);
 	printf("process name = %s\n", curpsinfo->pr_fname);
-	/* These are still getting faked */
 	printf("initial chars of arg list = %s\n", curpsinfo->pr_psargs);
 	printf("wait status for zombie = %d\n", curpsinfo->pr_wstat);
+/*
+ * These are not implemented yet.
 	printf("initial argument count = %d\n", curpsinfo->pr_argc);
 	printf("initial argument vector = %p\n", curpsinfo->pr_argv);
 	printf("initial environment vector = %p\n", curpsinfo->pr_envp);
+ */
 	printf("process data model = %d\n", curpsinfo->pr_dmodel);
 	printf("task id = %d\n", curpsinfo->pr_taskid);
 	printf("project id = %d\n", curpsinfo->pr_projid);
diff --git a/test/unittest/proc/tst.pr_psargs.d b/test/unittest/proc/tst.pr_psargs.d
new file mode 100644
index 00000000..5c4995ad
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs.d
@@ -0,0 +1,36 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: psinfo->pr_psargs provides correct results.
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+BEGIN
+{
+	mypid = pid;
+	system("/bin/echo TEST a b c ");
+}
+
+proc:::exec-success
+/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST a b c"/
+{
+	trace(curpsinfo->pr_psargs);
+	exit(0);
+}
+
+tick-1s
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/proc/tst.pr_psargs.r b/test/unittest/proc/tst.pr_psargs.r
new file mode 100644
index 00000000..bbfe6074
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs.r
@@ -0,0 +1,2 @@
+TEST a b c
+/bin/echo TEST a b c
diff --git a/test/unittest/proc/tst.pr_psargs_other_task.d b/test/unittest/proc/tst.pr_psargs_other_task.d
new file mode 100644
index 00000000..040a7864
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs_other_task.d
@@ -0,0 +1,37 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: psinfo->pr_psargs is only implemented for curthread
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+BEGIN
+{
+	mypid = pid;
+	tsk = curthread;
+	system("/bin/echo TEST a b c ");
+}
+
+proc:::exec-success
+/progenyof(mypid) && curpsinfo->pr_psargs == "/bin/echo TEST a b c"/
+{
+	trace(xlate < psinfo_t > (tsk).pr_psargs);
+	exit(0);
+}
+
+tick-1s
+{
+	exit(1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/proc/tst.pr_psargs_other_task.r b/test/unittest/proc/tst.pr_psargs_other_task.r
new file mode 100644
index 00000000..ed0aafb2
--- /dev/null
+++ b/test/unittest/proc/tst.pr_psargs_other_task.r
@@ -0,0 +1,9 @@
+TEST a b c
+
+             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
+         0: 3c 75 6e 6b 6e 6f 77 6e 3e 00 00 00 00 00 00 00  <unknown>.......
+        10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        20: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+        40: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+
diff --git a/test/unittest/variables/bvar/tst.execargs.d b/test/unittest/variables/bvar/tst.execargs.d
new file mode 100644
index 00000000..d4eac223
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.execargs.d
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'execargs' variable value can be retrieved.
+ *
+ * SECTION: Variables/Built-in Variables/execargs
+ */
+
+#pragma D option quiet
+
+BEGIN {
+	trace(execargs);
+	exit(0);
+}
+
+ERROR {
+	exit(1);
+}
-- 
2.45.2

