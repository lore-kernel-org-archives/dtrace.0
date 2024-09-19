Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF5199FB3
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726750497; cv=fail; b=muR/DvdAoXri0l7/l/i4xUCDNcsLArvuF1QgAg4rKDtfB0qzBqNNcqDNmi+09duNHvKg2c9SJGyQ0aqangfrhJsUNycjE2MAYgwgTOvv4QX57WhMP4tCiLhhQ+pNYCqLol70EwYtRTUgowmz+ttfxP6zN5oExJBCOYGOfHXuB9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726750497; c=relaxed/simple;
	bh=UCE9A9K6FW1tjp2NDZjPAbTz6Ywzb5eY1TcnsD1QLcs=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=hiYqrQtEUoY69MPRg0/ol5CdWPbqdiaCqZBvCX8Vjjzpcj2+dIRBM/gdJI/2p8laK8SYiwxeg6yOXDUjnugacelICEW/nUqumMZYesWLQm96j6GtgOaPUQXm4VDLY/mSTLPpPSI1Cua5WW1oR0bEurXc5Ic2IV1/PkTKxJacf+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TITb99f4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fwDImtwW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TITb99f4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fwDImtwW"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J7tXbd003659
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 12:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=MKyDlWFdI6Ww249zUTKZMH7OJS++dAZCjwJeXYR9bsI=; b=
	TITb99f41ccBukcDhTSJxldI/Q9AcqL6chW1R7jrOYrbKPFEzlQoGqU0UCkQLhzH
	vhOtiq3reNs/4herMxNQHCcR6BDV7lomwbZaR2FuNLlhZdO0QjiqOMSG38Cx4mzP
	pFiR4HKRN1UgGjcs6WSO7ezYfKcDcsFo5BDbf9APgsUtcINyhDbaTgra62wPwicZ
	EklAYx0/3nWy1hbJ0Bv2EbqT6DexILDXfOdvaGYCeWEYvCPDIbNx50hE7v6vJFVK
	Emb7VUggt0h6oQ4a4agoL0+3J6AIiv6g6KeXOPLmtOeaIvT1XtinpzRC96c6Bj80
	0NlifNka0CPQViFWAZi4Gw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3nsm4bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 12:54:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JB3ci3010334
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 12:54:52 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41nyb9ptd8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Sep 2024 12:54:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hU8GdF9VDrc9IoZu5taItpCuQJM+J4Y+1vV0x5EWzDW/w3QKUvC/CVtFIILdAjVh8OW+24OkAh3P8KAURqoEX6mA/dnQ6KZG6JzQD3zzVP8sGoagIR1vfW7VllbWHgqAqhJ18DsqOdqv0iR24xsW1J/NfrAd0mnkxHHrZ7+wFFZd6ZIGP3OtBV+gTW4aL6gbw2yx1yeYnS4f5IbIdSpjGlAm85CEkWS+p2ohioNFdzCUXs4dK0/X7hgHc8XnXKiOcWAyT2TZdXa8anIC6IscikenfqxZdmYDEOXUZfedGLbIzcK8alJrXvl3+SEnegqm/bXQxDpnDAvoOUDSv8jEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKyDlWFdI6Ww249zUTKZMH7OJS++dAZCjwJeXYR9bsI=;
 b=Pnprx/SXC7S7XGv7gHuCzfRKjmE2F2O49ymj5ONzHA+oufvC0F0ePm+p25IUmLKnKilqw0NSAUjU1XkjTpU/bXiljqstga3bs8iBWwuLTC8kdAnImlwP5AO2DLJd8LxosFZiUH2NDKZfhoA3YXmI4T48im4lLsitAj0vtY1Fid0fKNCkIvl4gdX6jk/2lorn7oEIil/YxgVU7lFYziyT6+GUVlyKp923if1eEEoIZQRoW9XLpchXHyMLW/wXq6xjk9j62YxebdHdkmztojO3eA2zMLreYIwpKYAYVnrCQwrfj2vacxTT712j8KqMYoLE8S+rB9QDLd+rypgGfnNNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKyDlWFdI6Ww249zUTKZMH7OJS++dAZCjwJeXYR9bsI=;
 b=fwDImtwWPmvBDj+SrbNrTl9dpxbU1bXe7GeWi5ADpvyWmIIbGuOal+SuyMsIEdGKl1wWXMfM3PYuEuBPenBnUtDHdwPB5UO/GXGS5M1yUZYJ1aELVn5f63mHVp6HF+ZBfOka4Xb5DalFVjshMjHCuV8iwBHp0QEsmaFKc98T1CU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA2PR10MB4507.namprd10.prod.outlook.com (2603:10b6:806:119::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Thu, 19 Sep
 2024 12:54:50 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 12:54:50 +0000
Date: Thu, 19 Sep 2024 08:54:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] options, test: correct bufsize calculations and tests
Message-ID: <ZuwfFjKdHQvlxuSU@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BN9P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::12) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA2PR10MB4507:EE_
X-MS-Office365-Filtering-Correlation-Id: 509a721e-8bdd-422f-8f21-08dcd8aa3f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?flHm9XCoH++2YcTlkZjnkkPAc9nLYGv7MNe6nQeW2iyPPQAFk3ZieyUCfDu/?=
 =?us-ascii?Q?wXG9i1vPZDqUARhetp2754NkldQbf326yW/Y17MFZgPrRYDNB278tblLoFzW?=
 =?us-ascii?Q?ZkD9jitEV5NF+YEUfNBRHAcXD6qV5YzPId1TfCwOpJYGU1TYvRlonLjbC21R?=
 =?us-ascii?Q?PzXap6+H5IQ5unYX7GBIVEN1f+1/W/dRdb/Ch2S1l6RtMCgXmIHh4wMxBgmr?=
 =?us-ascii?Q?d+kApMG1azHjE+2mjK0IJUzID9IgqiYUdkUynqkx8FdFKnc5H5bNzV8CS8at?=
 =?us-ascii?Q?94SuUvzzyVplfwyaTRWqM9x0f2aZObmySQnFKX1fzQMv+Bvjh0b+94jzUWVR?=
 =?us-ascii?Q?duAJBkNkLh3Avoi7vDZ9Fj3JWsShQizo0dZGjnerpKJ1YajTni6PziFBdN2P?=
 =?us-ascii?Q?xLCkMIe4yxRcw+6n3iEjxDhiarPBHIXbQdbwKPMLM7a9Xhq9jqSG9t6mqx3e?=
 =?us-ascii?Q?ulwLCLuSZ+jykcbd8rvHd7LMPzIjRLbHgNBdAYWgOJUKb5B1SoBNAALHzvnM?=
 =?us-ascii?Q?iTXxnRiKNjh+U/boYPpX4XwVdK5cYLqVMj+bShnA74v0vHG/8V3MrMmoJQlK?=
 =?us-ascii?Q?RkJiVyMnrPhiK1eoIj07ojAkhDNNnmtZx5KXJv5COxjdu0704ZQPaBBXPyBg?=
 =?us-ascii?Q?v8YVz0ctrVAds105pYjCPJsLOHBdCGNjdJVXQxBnWc1l3f+Rk40eS4obmehJ?=
 =?us-ascii?Q?D7VrmL8+rhHs6wGpWouze2zMdAQ+h7mzGALhRwv88UT1D32Opfke3wDJCfcZ?=
 =?us-ascii?Q?VahH5l/NB3LSLdNhi9fSaQP4nUaGArl6uIVzhUMG7GFpvV0ocZs6fdKWIGqI?=
 =?us-ascii?Q?MQvCCrhCfxmtbANsrPI0J56/g7dl18LUjr8gAvVqjb10vlfqn2LGomDl2Q1b?=
 =?us-ascii?Q?VcVnYmZ92Pb207n085KC6+d18SI56CEnYR0yFAg1Frcf2gZhWv/vaWDhbmNT?=
 =?us-ascii?Q?Lxy1D9dy10ymYoURMtD5Ye4j0eTYS3aHx33QtTbMTFk7gx9XQm6Sx4EHPZwO?=
 =?us-ascii?Q?Ulu2xfHCHMlfQ9C9yFb9fmvTS/vIl4Oj7Skt1ZTMRHjyV8IOEjDFaWA9lGm/?=
 =?us-ascii?Q?h4O8chKaq/ygD2Ie9tKv3vA7UNDzP+g2z/yKqfb/1CUEZPmyfhF3T0C0ZdkU?=
 =?us-ascii?Q?dl8ZuX2rld+lVm87wb5PBW8xmm2cS5NeT29HX07+N0NQNCTquqfl9Pi9OAtF?=
 =?us-ascii?Q?+n56OJL7Wf6A2eNyXjqjM43PbV5sZA/YqnHuY266G2OgEQO7Br1iF0hle7sl?=
 =?us-ascii?Q?4yPdYCB08Edn4xLhjsa0YhY6FweLqb2infv68qvJJXYCAwqrVrN6VvcNSoiy?=
 =?us-ascii?Q?krary8loD4nuIebQKjrCyPVoIn9i2Up/PIDiuVHtcF5aQzeQZcLsXScjoKYm?=
 =?us-ascii?Q?zEZOjlc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?17U62i3L7e01MGEkYd9ZObd4QeeNxRcDuF/YkvnI8Z//zWR9I2oeork3Bnmc?=
 =?us-ascii?Q?yUKRb1q7PyVqkNGtlmM12wAcyQbHkBbNGiv4RZMnfoOU/CX8wyVSy+kf1au0?=
 =?us-ascii?Q?xmPD+XV0RInPpCHdvzFEpovGUmIbn9Yl3DGNSb12Vkmt/C0va4RCP0GGs1fc?=
 =?us-ascii?Q?fNppOQMoUpxfXVIVW7ldipO+dzEI311R/wFm8EkpKzCWlXJeCMlpQVcF8fYa?=
 =?us-ascii?Q?91okG94m/XulaCqpD+X3t78O5TZbA6gPASTEiudVtHLaByeGKSCNr0K8Ztqa?=
 =?us-ascii?Q?Yzxli8ga29qrPkMssPJ/NqXMsbcRiJViQt9la1nSeJwcXIjH4oHNU6OgbCwM?=
 =?us-ascii?Q?Sah8E5MX1zs2fhQS0IdPIFZ5843zjlMWQ2gk+sAYikQX+3g/667BsxEBBCyj?=
 =?us-ascii?Q?SQ7fmma02jI/8cdqYZ03U6J4TWBsU3/aE7twZupUtFG7Ner5IaQ1Pu5e9w39?=
 =?us-ascii?Q?Kw3BPewXOf6lrYCQ57B+p/0CzmbgDjdOHXshT/OXHtVTQ/29WGoAIsBWDlbs?=
 =?us-ascii?Q?CKAUy/OhTQOi1r3czygYlRf3u4f05TB1fG1GhFV8bhrMEeVC9Z9t2ZanBit3?=
 =?us-ascii?Q?ESnGsFJf0c46Acopesrc/EV/k99veWsFPy/qO2xIV3lYRqVzuWglmrfNMWN6?=
 =?us-ascii?Q?clUP9jhVFfoxiOdmS0Un2OpE89grMq2irrRBkIvFZk3XNlQQbYmM7PR9Rk09?=
 =?us-ascii?Q?VOrcMiRSHGfrQbssDbdtnxlyYKybvBBK3Es8vIKIx/GHbFjUJvfJGhP39YIZ?=
 =?us-ascii?Q?7QPtSDq63QG0KdtTC0bq3eknWiWnobPN364BOXHH4/Iwu4LmHy/zYC5g+I9H?=
 =?us-ascii?Q?Wq7qBza+1DvZczgm1LsYd/0jBZ+w8mZgf8790Gi7iE1dqqVY/oikKO5kCiWm?=
 =?us-ascii?Q?YBMuKTbuofDqkhLJKguayNx3ZzUvvS+APYvMZhyW7NQ2/6VvAHKPHDcWhH6G?=
 =?us-ascii?Q?jl1QsuNYTm2XT5VNSdlEKOMGWgBwRbgAw9rv+vLWdLbLWR91VaBTIBrciv/r?=
 =?us-ascii?Q?mmPU+geMMsTme9PhbF+81kLev8p0NPIPQS2ZXbmB6VWFVYSpktym1xr7IYp9?=
 =?us-ascii?Q?3YZJ+xMTVdVjQ6fSPEIi2zquHxv73kwnmg0l/MxArm9m3Rpk2DApJQZoUktD?=
 =?us-ascii?Q?wa5wltVWEKbW1LIswMXfuPM0CKciUOrMpdYbsOI9KH+WR1Hw7TqGhsGlIUb3?=
 =?us-ascii?Q?7M2sN62bCXEfy8Sh3QsYJG2pTXFchtHTAZqBf339lH8K8QVyFQpyKpU+NsU7?=
 =?us-ascii?Q?MjEnLSVTIurCpQ6XzeSe+cAC9UPDu9y1rf776hPCljxTQyuQ6IQS1rdRg2Wb?=
 =?us-ascii?Q?//Fsbt0/WE0ERllOn7ESbOeW1HBBx/vMBOvRvr3lwCNvU+fAlpvOMKc+EIvR?=
 =?us-ascii?Q?8MY2v57HRGPR2ce3L2SFJDhm0i0EBY0wGGQ4+lSZ6UFK9288IxEb83oeri16?=
 =?us-ascii?Q?NBbucVxLX0VObY5aVt2fik7VKDjhEttbfgg7vQU0m4cBtHnFXJL3RtT/E6qc?=
 =?us-ascii?Q?w3AUIta4p1Elgc67BmMk3K8/J8OgM5PgQPWYGOsvbr7tk3uQOopeLK33lpE6?=
 =?us-ascii?Q?nYLFlXFcfh3PsEHIobWdE19nknXbtK28OWw/iHYiyTZlXV9j43PlKOKv4UTH?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tZ7KpoNd3B9b2MlQuTPTNITj56f4k9y/KrtPeRdLhr32oLFXctwTbNk3xGmOoJRqVtQdZ7xAI9ud/OTWqXptXwBzrMA8ZsdI5lKM8Wb+OJUchptbaXmh8tqCInMeGg9LL84sytstdDzF74T4NfehmNV26zccV5OLvMMCclIjQM9FTBu3ibr4J/uZi5W/4QjXfqQ/pB52bCcspM1FkNH6VqAZBZFHLamxPIrsydhuF0YwYBwxtnn7Hle/WM8DxOZb5lbSz3JMBpGLKJqNg68yPnCYk1DbfdZV2g3QJBnTogXUF/nmKdrxnxdQP+LXsdWvLQJaeBkzdsx08epE3uJfKAzld/FFrkR1RnIAM1n/Nu8y4NReo9w1SEmoHWqGpo/kPO6n6Ku6gILfhIPCe5Qdw6zxV/W3EsjBx9mgb89No1eJzkV0PSK9qLx3JZfZIb87ahmXiu9Wh8KA4NE7NXka2eWRe0OLYiLPls5V3QET/aMLqqfxH2OewHD5wsuEkLaQxMV3o0LfpJpSGCUZLf1nWLtrO7R8PAcUbbLInW6FSTyeR3IqMnoblfgooOAuWGNmwURMKEpIeJ3sGszXd+ZwBKb8sdGB2BhkB0c78agKMH8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509a721e-8bdd-422f-8f21-08dcd8aa3f5d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 12:54:50.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8yGXzOTlyk1PXh7yGv9FVjod6xbfEsmHEDyu4UlYVHi2MgdGp7g8VN35uY9ilDc6i2SOUA9qqecniRRXdNeeawDML1jxwPnnTmZ/mmGoKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4507
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_09,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190084
X-Proofpoint-GUID: YZlRQxiIDsxoWKiqayshEMZiyVh90Qq4
X-Proofpoint-ORIG-GUID: YZlRQxiIDsxoWKiqayshEMZiyVh90Qq4


Reported-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_work.c                 |  9 +++------
 test/unittest/options/tst.b.d       | 19 ++++++++++---------
 test/unittest/options/tst.bufsize.d | 19 ++++++++++---------
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index c98bbfb9..11335345 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -268,15 +268,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
 		return dt_set_errno(dtp, errno);
 
 	/*
-	 * We need enough space for the pref_event_header, a 32-bit size, a
-	 * 4-byte gap, and the largest trace data record we may be writing to
-	 * the buffer.  In other words, the buffer needs to be large enough to
-	 * hold at least one perf-encapsulated trace data record.
+	 * The buffer needs to be large enough to hold at least one
+	 * perf-encapsulated trace data record.
 	 */
 	dtrace_getopt(dtp, "bufsize", &size);
 	if (size == 0 ||
-	    size < sizeof(struct perf_event_header) + sizeof(uint32_t) +
-		   dtp->dt_maxreclen)
+	    size < sizeof(struct perf_event_header) + dtp->dt_maxreclen)
 		return dt_set_errno(dtp, EDT_BUFTOOSMALL);
 	if (dt_pebs_init(dtp, size) == -1)
 		return dt_set_errno(dtp, EDT_NOMEM);
diff --git a/test/unittest/options/tst.b.d b/test/unittest/options/tst.b.d
index 57fa030d..af7d090a 100644
--- a/test/unittest/options/tst.b.d
+++ b/test/unittest/options/tst.b.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,16 +12,17 @@
  */
 
 /*
- * We use a buffer size of 60 because that should be the exact size necessary
- * to hold the trace records generated in this script:
- *	- perf_event_header (40 bytes)
+ * We use a buffer size that is just large enough to store the data recorded by
+ * this script:
+ *	- perf_event_header (8 bytes)
  *	- size (4 bytes)
- *	- gap (4 bytes)
- *	- EPID (4 bytes)
- *	- tag (4 bytes)
- *	- exit value (4 bytes)
+ *	- specid (4 bytes)
+ *	- PRID (4 bytes)
+ *	- STID (4 bytes)
+ *	- arg1 through arg5 (5 x 8 bytes)
+ * So, 64 bytes.
  */
-/* @@runtest-opts: -b60 */
+/* @@runtest-opts: -b64 */
 
 BEGIN
 {
diff --git a/test/unittest/options/tst.bufsize.d b/test/unittest/options/tst.bufsize.d
index 96b0f1b8..7884c0bc 100644
--- a/test/unittest/options/tst.bufsize.d
+++ b/test/unittest/options/tst.bufsize.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2022, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -12,16 +12,17 @@
  */
 
 /*
- * We use a buffer size of 60 because that should be the exact size necessary
- * to hold the trace records generated in this script:
- *	- perf_event_header (40 bytes)
+ * We use a buffer size that is just large enough to store the data recorded by
+ * this script:
+ *	- perf_event_header (8 bytes)
  *	- size (4 bytes)
- *	- gap (4 bytes)
- *	- EPID (4 bytes)
- *	- tag (4 bytes)
- *	- exit value (4 bytes)
+ *	- specid (4 bytes)
+ *	- PRID (4 bytes)
+ *	- STID (4 bytes)
+ *	- arg1 through arg5 (5 x 8 bytes)
+ * So, 64 bytes.
  */
-/* @@runtest-opts: -xbufsize=60 */
+/* @@runtest-opts: -xbufsize=64 */
 
 BEGIN
 {
-- 
2.45.2

