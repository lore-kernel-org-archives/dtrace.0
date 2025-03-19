Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DB1C3C11
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742397957; cv=fail; b=lKAEgFqHsDyVOTQg2q3GuW14eTvluYQ/CgcBlxMF7Qc/zi3+GeNnUWsQvXpOKqKGtGwVtMwUkLqfiVw6rdj/puj7X3cpelEMUYrNz+QzB+6oSaULeXJbSYkcgF7F5ENyCYZqOq7FdqbHzv3nPR48zwSjTDEDIn4uizK+t4iJ5ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742397957; c=relaxed/simple;
	bh=6boUyi0XPdhjLNPb3AN9nkn2BRpylhZanQHRx3fNidc=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=XT+NIZKMWBGkXM5WFc7jIJRDIjYUc3mxwa7KnBHn7m2Z2zq0ZchkArIV2LAcyi+pty4KJIB2UUOA1HwaEHFr+fYme5bjK0zPhlkLEh49Jr27ArKC/cNLWV+OPBdbMTPa6Z8rcXVN4e6KM4zObWW1RMnelegJVhYnx+JAkDyHLEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hIeF3dDl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CiD5zu4Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hIeF3dDl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CiD5zu4Q"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JFMpLI007496
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=Z65CBiSxP8RT61xUeht1eZbxUEQOLWxrl5MxDwo5QzI=; b=
	hIeF3dDlOrvcqroth5vaKltfBsXg3vK8NCmR3a8s031Q9xsZdgfwnTAGpA37ax9M
	4ZS/SFeH1HT0mw+7C9A+1KFscnkKmRMoS870oIu0XQTrDzMx229s5y1iV/uv+2Sb
	xPdhHclPb8STjVBGoOi1GhNNpNLo7mYTYbNNbBx8tGlLQzDFhoAkKHFLYSn2BlQK
	IORQZEswLK/76CAvaCMunfYpjXJB039TNaJ5bo3AuCzgJOtPY2fZA9fRX083IOZl
	uRQJJEns34qDIBljD5ML7TKtsl7Y6+xxTZfkIEpIU2Y+XvLtqoRWPCWoSeKflkGR
	AuapofCHXXcIzuR6O3JZVg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d23s3qsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:25:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JENUxS023547
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:25:52 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxc78kfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 15:25:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PEBlMmi5M7F0LhtrHY4Dmq2rTU+Lm8vHTBrAFhrEZ1VA1FvKjjN38IvymZdhA3chhsmGLMpKA2Hc8mU95/QPA6UH6n94clSjKCCxaQdbWDyopYS+mBz0RYUW+cgrqpkw8ZEoDgz7Vhd3KLpX/CX7op2v+DF9mOTNTN5ocBsyVEbLT8KYa2bBajq149maanDSoKThK8oxaCIX6VW7ZP9Op3e56dGwljcnqcyutujiz4VrOL4J8zSkxLeB0Y21YjC01AH6w7ObIMHrhjr+UlTPEe9XIsnnPdHaiJRqXx5tW+wr7G2b+chd1KtE7xglcWop3++2a2rLbTrGRR1/HTf1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z65CBiSxP8RT61xUeht1eZbxUEQOLWxrl5MxDwo5QzI=;
 b=Zi6LIxr2tyDbRkWQ6AYpOOYO78MuNdnDH7tRpA0xqPoV79O+IEdUdO+w2u8geaNuBoKirwoKLhlq7XJ2j2Zegjh1cNOcXbTQtjIjUufUpMzrxvWxBrDYPI004oIr42ZIQFhGqWarcv2TorgBFh2Jxe31V9uekZP5iRRJF2VPxqcTMk2Kkawse8/2Y8wMJQXj4oUFDsoRGBlNXlb30QgyrjfonPnOS8cuvvKiiqiOeF16lleeZBPjlDMh6ikfM/ScIVrtkA2pm4fv/UnchvvjnB+S4kNvX/q7pE2S7wSSlWFfCckcDLZ9l03Opb1nXVAT5uG+bhX6DXwlYuea1ppkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z65CBiSxP8RT61xUeht1eZbxUEQOLWxrl5MxDwo5QzI=;
 b=CiD5zu4QmIPp8kp6hQnj0VCR7P9SdCNu25iZvQx5j4HD9tbx7PT4RdiDs8LpYnPOANYLLt2Z0qdu9/jY5MQKOhStvZfz6S9hxStBYxoacB63mxXJ17Y2itVpG+zRB9tWiWQTnpnSDRYiMiUm4meZmz6scRcg53wWTrRaAYS3BRE=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CH2PR10MB4311.namprd10.prod.outlook.com (2603:10b6:610:79::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 19 Mar
 2025 15:25:49 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 15:25:49 +0000
Date: Wed, 19 Mar 2025 11:25:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] test: Check tid value
Message-ID: <Z9rh-ufZ9XX4fkxi@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MN2PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:208:236::18) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CH2PR10MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: d430c3ec-6ed9-40cc-44dd-08dd66fa5406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u2qfLEvHo7TCtebzk4flGD5eNoMFKLpeQ8AQNNr+PSKShjbshHj/ddy/lP4Z?=
 =?us-ascii?Q?ZsKVahENrmFvPTB1y7Dlw7PE3WgJlRF8WM3Br5IlEV5wnSruoECxtZeb0QXk?=
 =?us-ascii?Q?/Ns7Rbpw7XEz7+RDaB+joWzDClrh/HU7npWZDuOC7Tyqf/DdCdhIsN5TkHm+?=
 =?us-ascii?Q?YN1D0CMdVA4TYr9hCAw4/isfA2iDSmL0aFcxht1kxj8lVZJZFEKC2X6deqJI?=
 =?us-ascii?Q?eDsVTRiDQBn1oIOcgcDvluCRtiYqG7P2v0Y/aRbkqegH1YyfqIJZgseVUozy?=
 =?us-ascii?Q?0t7L1TT6f5pZ/yGEE7anDHQDn+f5sPOJy+4DzLRWm9upglPP5F5oHrso5M5R?=
 =?us-ascii?Q?9YB3eW1cxoaX/jPbqywVLLprnUlnNlTJsTjhOjuP7XQw1+t99pfx6sizVxaJ?=
 =?us-ascii?Q?Jf/BasfkeR5GiNB2EGBFMidmEOY4D9LDS4nBirgHxq/wuuROgUf3rYR4sacf?=
 =?us-ascii?Q?bAqmF9PY4MqPFGBLEpOavBtYgL3jysJ4OWe+B0lRUv/oJ6Us3Wgvo/9K6t7I?=
 =?us-ascii?Q?CPP7FGDBlKJ8Py/i3V8ypgDAvvHqr3pV8PZz+hw9WXw0KY1JyOGCuYPVZUkz?=
 =?us-ascii?Q?FFCr4R4ZgFHx4dEQSvBdUPut+cHyi+7Q2KdAd1o1AKrnMx6mpnCQUI7swR+y?=
 =?us-ascii?Q?o82lRXP0uUPuROK51aWY1QLVb17AqXlIWWi0pk7T7qeyHWcBBgO8sph10+N0?=
 =?us-ascii?Q?FnimiHmB+VJfpzmOctpUSXpSl6vO0Ymcrhh8bQo39UAuzagc0gyOkOgVlIrJ?=
 =?us-ascii?Q?mdQyvdz5HFZ7CFOQTGtn3E76dO3qn7Q/b9gIi5M3vdQulMXHAqGvZCmrSiY2?=
 =?us-ascii?Q?7k5wD0pUgWfaO2P7P5ZcTc399zLejqDU2V8wQ345DLPOQmjIdO0k5o6OlFe5?=
 =?us-ascii?Q?M4gg754nNoE/VmT8YaG+N5QNpov08xVbXXkLgoO0QJ4VFp1O85pDBqVGJcZ+?=
 =?us-ascii?Q?4PIwv0ndir0ed6O8eS27I6hyexPrRj1s4xhv6v7LW5xqPXpfKgezynP5tKAm?=
 =?us-ascii?Q?xcArJlJ+CsrpYps0ijaYBi3kPFBlIsK4nEY+2f22XJFcnU9GzF6ox342cae8?=
 =?us-ascii?Q?xJ49aY3VN7NR5fJjvOy8s8Ty/8oMg9MbVghOgduFrMdptDqa2+ChRML/IqGL?=
 =?us-ascii?Q?I5Ug+gh/Be+vCIdXJWxs1WlLBxth5x96bjWdBxwlYoB8UMNu+N3A5a5uRh31?=
 =?us-ascii?Q?knfyKTwrOb4C7/w5WGmqwVoeg3J28eSlluICHKGpK4r+oCOsYVXKY1CF1sdz?=
 =?us-ascii?Q?TEF/UuhZtzYJCUHvNr8F9xXBBR4IQeKGlXo43yv8b3AHseK4Fwb4l5fEq5qm?=
 =?us-ascii?Q?ndXMrqQwKFqdza9LKV8w+5jJAwU3NmEK1jP+ymHXNUVK1z0g6JWRLMVbSE/x?=
 =?us-ascii?Q?AvTJw8mQuyRmIPhquO9zd7ld3YWO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M861UNNLtsRgnDvidhh+nnJQRQATewBDf+6cwnt62hR2AmRLfgDU25L5kKzM?=
 =?us-ascii?Q?sQef9E73jXoQw9TEt/lnx8xBSImJujQaDnGId9wkps5PXGwIrZhAunwgg4zL?=
 =?us-ascii?Q?4dNmy5E9AsnPXpG2ucO8ymfyApFsfc2JlYPAaxq5fkMLIzRMeH4Qb5boShW+?=
 =?us-ascii?Q?r7+crmYDPmtHnSDubY0IoGBD9DbbN/5Uz1YWkV4jC4Ia/8pfhGKWO3fIJZ3l?=
 =?us-ascii?Q?g6K+18KTLXLeK65mz/X2iMcPrM6TK1TmkLSDqhpXsYfFZ3evRp5Y323++j6U?=
 =?us-ascii?Q?um5DC00idY/aFTtl8EIqCwRWlfHjIi1k+XsisTNQLcZkMRiVytERlJ0nDaWI?=
 =?us-ascii?Q?+DYHWWZfywDAyM2rnBDGV7VDFcuogBOsH1+IJ41i+M4nmKIBJc+z1yq9p5ZH?=
 =?us-ascii?Q?zyG9fWdAvR9/PrcODQFoQIZiK/Xrxtcg0JntwIKCfowrgX1AFuSg2D3WW0MG?=
 =?us-ascii?Q?UUOcIbJyZUWAtY+JJQwTgbZR2Hzmkz7BrmMHI+5m6ebNbsNoUlgC9q74LD//?=
 =?us-ascii?Q?kbadI1xNB7BTj4JC9lq/lwjy2EWkvA3jP84CArPkJ9KRruo7D4fqfk3cVkNb?=
 =?us-ascii?Q?SDFdSoOAg5JyUt4Ks2PquH846AZCRjB5gH6K+pesXjdiBIQULtANxE3F7aD4?=
 =?us-ascii?Q?eVawEqbZEcmmKVKM/mPIXOS7//CFPNA63JHwlY25f4Yhb7eRuSypRqJ7RzC8?=
 =?us-ascii?Q?gWd4WWvAZ+qTnyIMgwJDYty9LDB8jydjju5fvF/JOYVsNolH6qbbDf3bXpHr?=
 =?us-ascii?Q?WY206ilGb2UmVYx0f5fRiyhHyeTnutlM1CtI7iqgKyW8NUK4VyDr2o08bXlH?=
 =?us-ascii?Q?mJERlorAl1okbERO7OBOxwi/RZCO6UPKawPuEYHEJNgt8wfY7WmANerAF8/k?=
 =?us-ascii?Q?j6lwr302d1JyEFWgwhdKmGgVm2pG/tR494lJMnjzMs1+M0cKUZ6RLctri/im?=
 =?us-ascii?Q?MiYvsXU79PQKgrXluWEnmhmSWzxxg5BP75BgST7B9jkcvh/dZ8knL24boxF7?=
 =?us-ascii?Q?5DUdjWx+RwZkx1DpSz7n7c9mj33k5QS+IMCXtmf4lIXWgQas6B0FLIeVB3G2?=
 =?us-ascii?Q?+DgEZ+yiYLaU6HO8Hhti1PNDl4TO1tpkenxGdl2lzq5I7FDe27rYeM5h+tkq?=
 =?us-ascii?Q?HaYBUQFJpoIPev6YFQzVe14CuTa3F6IXBP7HceNyaR4OuC6DbaihpPu81wq4?=
 =?us-ascii?Q?nSwDYLFxwYEBBYM2aElehrJBWg+GBIY1AR/WNAhjO9NNn7l8qJDTnXgGxXdR?=
 =?us-ascii?Q?yM8GJmAUmZEeBMPcEdi6Jp3WJBMKnqtWPGLqxpEXrfBoxq2+z4iBiCfxl8pt?=
 =?us-ascii?Q?Ql+Mr7wdySRr8HqVSgJXRc/8qRHtLFxsVYEUA7yILRUaPRHIbbM7xCFvZVBY?=
 =?us-ascii?Q?FWCVj5kX4LjFfdmm/5TdAHr0pRTyr4dYYYfVayLbpExMfJW7fR6ED+u2Gi+O?=
 =?us-ascii?Q?svkb3blY4wzkQlCaPUnpjG+i7q20nayxcuf0/XS23BXTG0/sVq39TNMPMFqM?=
 =?us-ascii?Q?ITHrxiic9ETMiEFKGD2KF71coB6/t/uLDBvIHBoatVRGoofnmrnyIvvvJEMg?=
 =?us-ascii?Q?kzULVT5Gw+Su+jK/xysJ4EbwtYp2Vv82iziFYMFB+wzvfBOLQ7HfRInULhfW?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NtEVXavrly7rbXUsUPZYXWnpoJD7w291AFEmJGKGyX8ulyK0inuo2nZfmuTyAL3GlC2beW0nURuSbFiDnvvTJMijbeKPJYEi/IbaA6JJheGdMiLKT9r58IuwG2JRjOXbqFaKr88aq8oiUZ3g8aYHd3TLSXuxhe2AMVDkaf+0/+QqIqt6vvVy3VDffoVJ9vpudFBWVizf5QHOGBvz19OXUKWQfrhW1Mg/hH0Qn0H1PvCumyfXq4RiBsVvqcXbf4eYs2K4Dnk+rDiXF3bCoU/QDgN3ibVQChiaz7cjpG/4xf05m0QeFvIahFRNAg0XMpo9obONBuvA0o9yFprg8F8FksaFMhKGTYE+BQ17TCM1v78eRRWSJuEGGhHC8gWvptPdMsWYLyksRy06PnG+Hc1B6VB4BWLkh1BK01575uN3VYFd5ugZLBwIncvNmv0PkRDHzxF6SA/PCrRirBveKA/vL+zNS8P2fP9WOLJs88XXC5cRLwel8dpH0qO6XiNnutxj6ui2q3geM0OIpRCv42oqa6B6WnTpqCqvFOhn/EhgUaC3WhJaqXYL6wBU3/Piqs8FlRKdnyODDjdKvzyu8cVmUw+rLIsURbutCc1CTX9m5Fw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d430c3ec-6ed9-40cc-44dd-08dd66fa5406
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 15:25:49.6439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czjqDldkrsWehX37OPc5mL6WnUVolWUGZPGCYeBS9v/PjMTCHEAJuIXNZV1snaMU19YWVTG680ZaHUrd+GCYJUKZII5GhBaXGPkRapGsRmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4311
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190104
X-Proofpoint-GUID: q7gYx06SF1CHFB9gCnFOHLr-UZkCVLFb
X-Proofpoint-ORIG-GUID: q7gYx06SF1CHFB9gCnFOHLr-UZkCVLFb

On Mon, Feb 24, 2025 at 03:19:22PM -0500, eugene.loh@oracle.com wrote:
> 
> We were checking the built-in variable tid simply by testing
> that we could print it and its value was not -1.
> 
> Add a test that confirms the value is actually correct;
> compare to C output of gettid().
> 
> In line with other similar tests, also check for the profile
> provider.
> 
> While we're at it, check the pid value and the pthread_t value
> returned via pthread_create().
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/builtinvar/tst.tid_pid.r  |   1 +
>  test/unittest/builtinvar/tst.tid_pid.sh | 126 ++++++++++++++++++++++++
>  2 files changed, 127 insertions(+)
>  create mode 100644 test/unittest/builtinvar/tst.tid_pid.r
>  create mode 100755 test/unittest/builtinvar/tst.tid_pid.sh
> 
> diff --git a/test/unittest/builtinvar/tst.tid_pid.r b/test/unittest/builtinvar/tst.tid_pid.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.tid_pid.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/builtinvar/tst.tid_pid.sh b/test/unittest/builtinvar/tst.tid_pid.sh
> new file mode 100755
> index 000000000..7ff0227fe
> --- /dev/null
> +++ b/test/unittest/builtinvar/tst.tid_pid.sh
> @@ -0,0 +1,126 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +
> +DIRNAME="$tmpdir/builtinvar-tid_pid.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Create trigger program.
> +
> +cat << EOF > main.c
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <sys/syscall.h>
> +#include <pthread.h>
> +
> +/* Provide an implementation in case glibc is too old. */
> +pid_t gettid(void)
> +{
> +        return syscall(__NR_gettid);
> +}
> +
> +static void * foo(void *arg) {
> +	int i = 0;
> +
> +	/*
> +	 * Each thread reports the pid and tid values it expects.
> +	 * (Expect the same values for both the pid and profile probes.)
> +	 */
> +	printf("pid     probe expect pid %d tid %d\n", getpid(), gettid());
> +	printf("profile probe expect pid %d tid %d\n", getpid(), gettid());
> +	fflush(stdout);
> +
> +	/* Wait endlessly.  DTrace will kill me when it is done. */
> +	while (i < 2)
> +		i ^= 1;
> +
> +	return 0;
> +}
> +
> +int main(int c, char **v) {
> +	pthread_t mythr;
> +
> +	/* Create a thread. */
> +	pthread_create(&mythr, NULL, &foo, NULL);
> +
> +	/* Also report the pthread_t. */
> +	printf("created pthread_t %lld\n\n", mythr);
> +	fflush(stdout);
> +
> +	/* Wait endlessly.  DTrace will kill me when it is done. */
> +	pthread_join(mythr, NULL);
> +
> +	return 0;
> +}
> +EOF
> +
> +# Compile the trigger program.
> +
> +$CC $test_cppflags main.c -lpthread
> +if [ $? -ne 0 ]; then
> +    echo compilation failed
> +    exit 1
> +fi
> +
> +# Run DTrace.
> +
> +rm -f C.out D.out
> +$dtrace $dt_flags -o D.out -c ./a.out -qn '
> +/* Report pid and tid from a pid-provider probe. */
> +pid$target:a.out:foo:entry
> +{
> +	self->mypid = pid;
> +	printf("pid     probe expect pid %d tid %d\n", pid, tid);
> +}
> +
> +/* Report pid and tid from a profile-provider probe.  Look for the thread we created. */
> +profile:::profile-1s
> +/self->mypid != 0/
> +{
> +	printf("profile probe expect pid %d tid %d\n", pid, tid);
> +	exit(0);
> +}
> +
> +/* While we are at it, check the pthread_t returned via pthread_create(). */
> +pid$target::pthread_create:entry
> +{
> +	self->thrid_p = (uintptr_t) arg0;
> +}
> +pid$target::pthread_create:return
> +{
> +	printf("created pthread_t %lld\n", *((long long *)copyin(self->thrid_p, sizeof(long long *))));
> +	self->thrid_p = 0
> +}' |& sort > C.out
> +if [ $? -ne 0 ]; then
> +	echo DTrace failed
> +	echo ==== C.out
> +	cat C.out
> +	echo ==== D.out
> +	cat D.out
> +	exit 1
> +fi
> +
> +# Compare the C and D output.
> +
> +sort D.out > D.out.sorted
> +if ! diff -q C.out D.out.sorted ; then
> +	echo ERROR: mismatch
> +	echo ==== C.out
> +	cat C.out
> +	echo ==== D.out
> +	cat D.out.sorted
> +	echo ==== diff
> +	diff C.out D.out.sorted
> +	exit 1
> +fi
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
> 
