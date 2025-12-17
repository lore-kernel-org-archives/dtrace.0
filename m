Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020822423A
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765948215; cv=fail; b=uXRmHJImqTrHZx0xy0lwgLqzhmEwlWH3sI27V2MB1l/Y2tErlAwe/FMEtP5FaIYh28XgojRiOedOlaTaH6GEO7RNICeiLHEj53F/ZTDQy3XMrDcUO4gAjxUeTgd5Xf+xuMMi958pVD2dQy9ETLPx0KBBKxEweQkI/EYkZJyjGew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765948215; c=relaxed/simple;
	bh=MDNWTG0rdwZG2vX2QSu93u1h9iMnfAa2QvXWlcjBCbw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=SQ4yIKuW4hVpPxFi8mVg31l5JdDVaG3Q6qh5EzULysM4INYTa6NdScf9nOUMK9Mz5tKMrYCJcOozqi7ik8tS5MILW5UVDDLku1PcgVtafeOkJJGW+SQDdKw64yctE8WeJL1qdYmTnb1CeGCAvkb9lqwfNG2ypYDto+1f47i5kzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l71KhuEL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IExa44cP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l71KhuEL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IExa44cP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH0uIBw1556600
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=T+W6bLbw++QuB79dEytVIGf0hU/oHYMuYLf+zFD6nOQ=; b=
	l71KhuELk1274YTJdghKqzmbMAjpoExSZ+TRZ1ii9K16IQh5zXcmF3JPXo2+zQpZ
	Ch8nP509aay/rz7ieuX7D6/ql1yLhdLD8r+mlSUP9DYgjz2gxlqNH1XfmZlAGxs5
	Y9FfMNAb5jDwtUgIclt6Pz2cLMEljbX0P4Om0uKXZsyFsq2FcznoqTVvY9XvcHtb
	f66pDaGfEF8DitmnTEhwfNg3s0SqFG9lqSkf2dWYrNc3s/wu7yI2SOegxvLnu44L
	N5fML2IBja7nGdwc0dB/RnfPebmaRFZBQvkCvZ0pRKOgQpax6eA2n8rzx9dizle/
	8GU+VdPUWSMg0AVe8Sa3DQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b0xja574a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH4ZTbo022508
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:05 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010029.outbound.protection.outlook.com [52.101.46.29])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b0xkm4cxf-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Dec 2025 05:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COuGeYeNLIIfAqnMDG+jnjhWV5BLUNWJI4Wj8U/j1S1JvM8PQu4cGxv+ORtdXne0gvGL21EMeSufaL1PeICLKCikN0HFIvEI7EJv6CO6cqRBDpNLYw6mpJtb9vGzXTMSVFPBy+h6EUgkanfWgfMvPI5tSnyU/dJm1X6MH/tbbPKJwunc2zI5bcVHXN9Ecj357Ya1TCK+Se8+X2M+t4DyMMGwVS08zs+E8uDrziGqx0SHCcc13CrFfBrM6yqTJNghzyNxGn3ArnUe6FAr1d+TR3GSdZ0rKopldnmIdF5uxzlu67xUhFC3C9pHKvu8m0JFIqw+6/GLz9Hk2dEENpROOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+W6bLbw++QuB79dEytVIGf0hU/oHYMuYLf+zFD6nOQ=;
 b=X2EKcMKENl37Wt9jwmER9AKEl1v0RXr5ZAq2o76g7UiH+2tOP8goD/6U3iwbcCR0qaXVdUrns6ikStOlIjdBLskXX+O8x/Gg2izyv7fDhSi6F1w/1ujqXI9K7QQt/u8UT8PeP17t+8ZxKPogbdtIyRHe1EGVQfOHD+BHTxvwQHrMMzjScSeZittKxTt+v/r2jJdE81oJACY2NyJJrw3U16mWhg9ThcDiNbZPPijcXwJ+c3M2v2Po7QmFxf5zGO6A96/BV2pWZpzU88TU1WdQ6WAbxS99EU7QfyKaJKmAWkZzZ7cDB8eJTnJM7wSlBObzxljKb/3mBz76u65SaIdL6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+W6bLbw++QuB79dEytVIGf0hU/oHYMuYLf+zFD6nOQ=;
 b=IExa44cPd1bfRuc5FTXd51R5HjUDVjheHa25pN4aIidD9ioGTXx9dGAfL6mwR+w2iHfs6L/WERpehnjprsvegP/vbsORgjv4W8odGxGSJ0yVUjmz29bTNQPX5zluSSWe/rX1A95jECWiSiTXU0BgL79CLyp+wv1+qbsqhIeyZCo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH3PPF61A2638A8.namprd10.prod.outlook.com (2603:10b6:518:1::7a7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 05:10:03 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 05:10:03 +0000
Date: Wed, 17 Dec 2025 00:10:02 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] options: discontinue -xversion=V as a valid option
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB752231FDE310C37F66EEEB83C2ABA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH3PPF61A2638A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 6736d263-46a9-4177-9656-08de3d2a8916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hr+Qn8BYoMmpXTA2BkS4RTP3RUU4aiyhvPwbMqrTZOJTTm7V9K1rDJHVs5N+?=
 =?us-ascii?Q?QKrpzXwcidpLeDm6gAZCKti5/XqaBC66HmTqHEMChiImIi0vP1CK4Fuozgli?=
 =?us-ascii?Q?gBxj6LCUTRVDRF4/+ymQ6jczldZ6GMcWkR4znxV65lCs6CkaVIGgX4wDhYLY?=
 =?us-ascii?Q?fCDGTPzcvrFCsDbTpiGVWJmrg+qX5ddku+amuDwdVIHyfmbtqQO6N5JKfV27?=
 =?us-ascii?Q?7hiqVlrqf0G0cK3zYTVVQr0JQXu5U43F1/GQ04rxXeAsGYD6sQjfx7hxNyVx?=
 =?us-ascii?Q?WIduyuqu7BgdvB6XXNVk2euvL2WoaxPIx/oLYLSn4GPuHQW1hQ+kST0/uJ76?=
 =?us-ascii?Q?hOXI82LM5CTIc+da2XhwGCmVFR186GiXDh4/kxyhgUCCLqKxD2POmdIFdQhQ?=
 =?us-ascii?Q?q8TPCSOjH+VL2n4aj5DYcJU3w48oo6e4BDSYm2GGpWfNEHUFaXnCfegebV6r?=
 =?us-ascii?Q?jkevcsrtGKVkDWXoJh/3Rl9UctBn8pTgZWSA72NMMdL9ka41GsQKPSdNiPYc?=
 =?us-ascii?Q?9miIbuNy/M5WqsQX8UO34Nr46RCSRtqfAi9rd0/5wlmKfMR+Mkf22W8RzoiK?=
 =?us-ascii?Q?zrwLnCBs6bb1uIx2dEOgemOpDW7knAicfwYFzlj4+UmCsRf7cuu0k8KBGOGZ?=
 =?us-ascii?Q?N0RWqdC2rcAMsaU6hT6N1ciTVrRd+iFcGp6AkX+pyEBkM25V6ih3j6vMJEcB?=
 =?us-ascii?Q?gqrBWBJfeNP9PUboQ2v13FUShUaRxc78eWrM0RoF3yZrNbFTvBnn9QHeYpEE?=
 =?us-ascii?Q?wV/qF+7ButzIITSeeX/Htr+yoDnk/YQ75LA4MDKnk/LfZuN8bnMngWhP8Bf5?=
 =?us-ascii?Q?zV/yfsbNJ3/YPSgx7PTi6c2WqG0HQPq8phxMqw8SpCd8mwlLCeg0Dp1PorW8?=
 =?us-ascii?Q?mz3WYr2TQDnkFG4CSwpwcMem/7QTFrA6EL7vbjAIERAYhjZDz0S0EyO/iVjH?=
 =?us-ascii?Q?9p01cY06wqD2NXEC/tdgPFGHy6Jo0LOCENyl/KyWNPF3/tWWXFLlonB1AlSW?=
 =?us-ascii?Q?by9+9Y9OcoY5niddM1n+lZMiuGK4t4aUUfO1VdBg0dxeEiJYLGC+AAagEXlC?=
 =?us-ascii?Q?ytnAWIsxD5Afi5kKZQIfrELThtlrtXsU57nJJay+D3ht5LTZaoq+c9oAm0AS?=
 =?us-ascii?Q?964kiGiWVJTq2HjkhYHtbmjYzQwtd6LhDw9v1GAwpXUwyA5T1d9uvg6E5fwF?=
 =?us-ascii?Q?ctrNBOYbVoVHc3Jhfmh6uXcNaC/64jMdIhQyFnA/nkdITjZYvDvTx0vJHy9H?=
 =?us-ascii?Q?KbrRjPz5oc9MVlLqoqmbC04lMj7Nmy09Ehp7rIlgkl0GXx0hd5yFflPcMFtN?=
 =?us-ascii?Q?upsKjViXNTUcPDqqJi52Kv2PtfPMUaiC1bid6iW/wZ0OMXuiDs0yX91+Unhe?=
 =?us-ascii?Q?os9OjvAUNeIUAxw9yQsAMlF7aWjDIrRqg5ot+BKlPK4UsT/oTNmjg3loS2sc?=
 =?us-ascii?Q?qwkHRn8iM/glE/75uPWYbv3BiK+l42xl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qs71BFTkjAiek/gkbHgCDZ9fqxBO+Ej0eJY7bu2X89JsJlsWp0MGNh7B6HGZ?=
 =?us-ascii?Q?d185ykGEtAUkM2tlia8TxyaKaiRL+ETZF1MybOa/aEdqvmei/UXu977TsIeF?=
 =?us-ascii?Q?uBFqD28c75p/ggwQvBHt0Q8bSHikuJxD2UzdvOALPyL7JuiQ3FHNbFXaQ4SX?=
 =?us-ascii?Q?GWULJB4pSkIP0czEmdo4GQRmCIsnp9MfhqALNeq9iIaVnYPqkN2BKI9a+7v0?=
 =?us-ascii?Q?DhHtO2I1ZdWzHqEW5yQz8yqFITSn+bx13wJ8AgXqdMZSMe3MzpDrkKELzbkp?=
 =?us-ascii?Q?t7YxwaU+jnUbwdstKgcOZWXen7huNTwdc0OX0xuKvnT4fyP7lw18IFkCIgJK?=
 =?us-ascii?Q?6ZhHx1XFYJYPYrltFkEOl5XJ46OYO7+MXhbcXhO4accRPMADr2wPKD7JTu/a?=
 =?us-ascii?Q?0nq+2f17y9biCJBxn7eL6ydM8YZCnl+aFonE8yB1VmucZG0ybjhyrowheeQk?=
 =?us-ascii?Q?9iu2pLSoPZQmejXmljMmKILNnZDrfF7Gp7PPhhQ+eIRTZ8asvV7oBsLWIYNh?=
 =?us-ascii?Q?YnsYU84DMr65gi3JhsgPVV73ymWSSOHkM7EMKs4gB6QmoIa7FxbUF43Od8W/?=
 =?us-ascii?Q?FbqSp8+XF67PCOLSD8+uwAMsA2sZQ895Fgr5KBo79ZCyxUGPaM62t9gRh07D?=
 =?us-ascii?Q?fTl1jBUg3+DaEhp3uQ2SDIs/OHe9OvgDNltEXVludL8VnPDL2zaoc+IDLim/?=
 =?us-ascii?Q?U0L+N+DdcC40j8VWwDtWr29McGjJziyZF0Xjk2nEjhudzvnK0FwsZUJ/HFBV?=
 =?us-ascii?Q?r2pkFy16ubsIjw+qwr3m1N4JORD/mPJOPbI1FFRuDiHn5CMf/VOg4GcHw3cM?=
 =?us-ascii?Q?IcFTm96ZVLdqUujCQ1iHwc+Zw8yP5OaWkyiML4pCisVfYjWPyWVXggsqi4MB?=
 =?us-ascii?Q?BlwaUyZ1j2O0aarQ51nseKdNB3YHjAEVm8TJbKj4oRWiaErp8KVKia7SpxD1?=
 =?us-ascii?Q?cDBKPRsTs7zOB/2MXdDLzTLgcdi6a5m1ioOE/zQudcIoOU0OuN/B8W4HRF/+?=
 =?us-ascii?Q?3vqcV55lfdYCFizL5f1gjCRT6xautxoOxFTEPqgGkYuHL/Q3GmkZ82sJtF/K?=
 =?us-ascii?Q?FfbPtuLlMbae0yKCcnWNXbRqdhADJa0RVSMC01lTMe91Kchrv9jZrRnjHMyZ?=
 =?us-ascii?Q?AIC85t03I/7QnuphOCiyKFOVvwDbTlJ+kLPHvD2RRI+5FAwJQKvqtLihyaMl?=
 =?us-ascii?Q?uWYAA5O81jRHA8oV6+32iXt0cUaGxVlWtgrmhKJd7RaTQe8MygjleCsv/aqf?=
 =?us-ascii?Q?+6y9ksPjBZie1qYumpsVfHUJPy1ijrXmRuvsZReaKWmPnm+I3fstBde6mqze?=
 =?us-ascii?Q?728TgtwqVXSAChy37yFRM4Pi62N2GafqnzOdof92FYBpxWG1nVdJF60/QvB3?=
 =?us-ascii?Q?KZGb2HXiVH/D2hPdvfOS/l/LjQqOLb/G0EyopunpNRk9qpx320UPhM21Fsat?=
 =?us-ascii?Q?mVBu5IFf+2KodiHO0YzWcMDd0zCBCmt+oL2lg5f/yd959c2XVpHHO9oxm7bq?=
 =?us-ascii?Q?+k5u4D01/qm5tP7gFIhP77LvCd2xbkQ1uVDm39tGye1RJg6u6vcWyAPzqwQE?=
 =?us-ascii?Q?HiNlvd5kG0L6t/H9j017rMLTXdnsKNwzJ1al74UZzbSSAK8Tg/GReKLU3+eV?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U2bd8+d7q5NtRCUl8sle1lgCjS2v5xBfJ9eMnUQpd5bmLR4L3vMyIWQ3pQ1X+LVMHCzb9Jxe/wzwY9l5l56b9unp2rihdS9Ld+9LdC+ttZjE9UdZ3WI9smidKZavzq6b0H4TOFnXT2rdXzz1WC+W0DG4cdG81EwmoOq4nTDWXuEVI5ktzpWven+ff1w+Svp2MWD8onOtCACFYt1nLknNjBtmXeYKV3jpnrAG5mcvhjnu6uUPJ9sjCgsXwHCBnplFsAVKEz5mzQQGiM+fiKuE+2K4Mk2cNj2PCecgK7wMSwndITvnJY1VHpB8Ck8dhvd0bNMrRAhNXF8wa36hqK5pDMPMwcRZ/dO4jt1ynP08QBrriqc6eJMB80ZxVGKK+T1EZXKLxyLzuK1BjDBhdOMJYXSD4ICLLfDSJJgZ7ZGbfyPVYKwAmNGa/kVE5KWWPR3XJENMBIMnlH/ZxGwvL+5ymijYgH0T9UTmBaWFtkFIKNxd1Rjn+vtfJjJ2yFg7vRm8LB2+HbNPpudrjegkBQ+asX9sWbiBhyWpipePh5a6gKgeXUUPNI3rmiXa57JyCxFLrD5IkbjfynZG+f4nCdIM4UY95fIB7axEeBBn4g6bBd8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6736d263-46a9-4177-9656-08de3d2a8916
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 05:10:03.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: munQ24ukAEroPU6obn+P1sek+JecsHL7wijB9bCX+0iVvfqdF1vfak3Rz8NbKgs3H6OsMD+fQFoFiROcN9nNNNriJce0WWDNoM1TqnHcFzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF61A2638A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512170039
X-Authority-Analysis: v=2.4 cv=TbWbdBQh c=1 sm=1 tr=0 ts=69423b2e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=9_jFiawhHAS8h2CF4IMA:9 cc=ntf awl=host:13654
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAzOCBTYWx0ZWRfX5r9GsZm7Ck4z
 YHLTZzwHqv6G5EkwGUfj2OCXytuEeZgp9q59tK5gKVXO/4fT/D5Rz2n6ggiO5DMJ09AH47rb7ji
 UL8xfyWnKhALHhA2WOkX0zq3AScyvKJBJB3jq7cLPCNn3usPW9ybQV5Sk1ehjYx5lEIp32x0O8P
 lD1vc19ZFUliPAjaFvY/XlNM0cMfpHWE2Owfjy/4vgTy6rlRLEDCLMPxtbt7hVfOuHmDWm2i8xU
 mmQitR7Skr+gorTcnvOigd7WNFK4VpEhkgMjNKfTAMn7PkUOPgD3+8LqD1u4s3W3jtXe5CT75Qs
 lYnTIKyDUCf6HxbP2mQUVFBFcgAsfhlLefj0IBZqaaz/uRoUhzeMXTWP6/A7v0qhvaxI1D0Sk9x
 2HpaJ1tDqtUUpFpluy3TFAu8iJM82Ok6zmofhd53OAGLhqR9v+k=
X-Proofpoint-ORIG-GUID: 8UBwTiVKLEICXQiSbLLIJd3sUyC23QsT
X-Proofpoint-GUID: 8UBwTiVKLEICXQiSbLLIJd3sUyC23QsT

DTrace allowed setting a previous version to operate in compatibility
mode.  Unfortunately, it was not fully implemented.  Translators are
not really versioned, and if a translator uses an identifier that does
not exist in the version specified in -xversion=V, data structures end
up corrupted.

Since the usefulness of -xversion=V seems to be less than the effort
needed to rectify the implementation, we are no longer supporting this
option.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_options.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 97516517..0a35e852 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -24,6 +24,7 @@
 #include <dt_pcap.h>
 #include <dt_string.h>
 #include <libproc.h>
+#include <port.h>
 
 static int
 dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
@@ -676,18 +677,7 @@ dt_opt_invcflags(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 static int
 dt_opt_version(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
-	dt_version_t v;
-
-	if (arg == NULL)
-		return dt_set_errno(dtp, EDT_BADOPTVAL);
-
-	if (dt_version_str2num(arg, &v) == -1)
-		return dt_set_errno(dtp, EDT_VERSINVAL);
-
-	if (!dt_version_defined(v))
-		return dt_set_errno(dtp, EDT_VERSUNDEF);
-
-	return dt_reduce(dtp, v);
+	return dt_set_errno(dtp, ENOTSUPP);
 }
 
 static int
-- 
2.51.0

