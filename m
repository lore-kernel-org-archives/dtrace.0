Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429C44207A
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 06:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732171217; cv=fail; b=a9WdAKzgQ72OrUJ+720FUSw90DQJXxqTVRW5YWtG4xR0buSWtIl2ayeSoI+vmTySBpVcJUV6PbWEuSgOUT1SXLefeDsPC9+IiX96jLhOtkaxjXa7QDxDiNWhWCWXKiSXUqaZgAyrPYuUt4vsQMvotKnDuY4fTOCOAUJpVn4IlPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732171217; c=relaxed/simple;
	bh=ZKUlhuAknZPbgISd0OJe8a+nEwCSL7mF2t+eYoQFDY0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=sbs9mwdvf/BGA09mufuxIWcR8P4GbBBZ3aI4WV22oPgT9hgEaPN7hh4INcOYzXx2h02tDqZGWjQA8BkvL71do6suRoUVPuMHOQhEjSF+89MGtsZlMSiWB4hPaoUu21wh6FQXWDf2Gs9+KFzHNJ5XUrU8TT37zBS5w0pruuP4YHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DbLLwOcM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WrEh4YeW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DbLLwOcM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WrEh4YeW"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL1feYj003522
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 06:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=0EE2WJ9Mu9OfgOjveUiyoBSw25hXiuKUZSp1PxNP7R4=; b=
	DbLLwOcMK43y2rmI/IFSUgM4Bev0mHwErKXiBEkPcbFVYnnFzt2VVr5QI2mFvPp7
	+fmbtsv8ziYaEciiBD2pMit8SDXEZ+wRGQwAvT2QHPhYQXC20r1LEQmeNkpHSda5
	Grr3mOgk30qIgEDKjf+1qZb2zG6eQBiZElfB9XlNwr79Qbn+Pwvh2j5LV9qWstJp
	W04BkPn1sJhZdh8qnBIMXiA44QiG+lksW6DlxY48EJa2jjOYPCVhWd9CQIqsIEZf
	74BA1fCUjb7Fb4L5J5/g1DFV7ccIUwoXjUcpcZFe83dCM5KvEuenHXEDvBbb5yul
	zi+l9R48OypBw8RuegeDuA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 430rs5ccss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 06:40:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL63Oa2007834
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 06:40:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhub78kw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 06:40:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abBjTnMsJ0/0x9qtQaglFKN4boEH2/TbiijIiQo8IvHfqdCQDoLOYvjBThWUb2a1+dxeZ7QKNIo0e8cqqunN57UVcp4JDMj2JHLld10DtHNrsjMGNeU82EoJtAR7vFQWYoUdmS5pgpb5jC172qgmGtaIlwkRmGzgzGfU/XuZWLDUV9u6HyDfn1C4l5dKuYnbI/R2UBs30pgTYgllm2tNJglhV1YCI+rS2OtQkt5d8Nji76bceMIpMtmoxc71iA0vapY5UoNA53WjQIUqXkWqm6RKgPz6D8bmBhnq8rwlFZSBqovsdn66YoqB3BqC3JkHzesM6dNjCdruJAhbhIT6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EE2WJ9Mu9OfgOjveUiyoBSw25hXiuKUZSp1PxNP7R4=;
 b=E9dOSMH9rysZADkJaOHCRvBMthD+duAismj/u57IaNADf4p4vSdLTz8G6HOtGQr1JZ4pesxTbFyJRJ7fdAAaHLBoSeZeTcDVCstUzLtUT60NszLAaxwO409bV1329JrJ9B71U15GRALYf2BsPWKpo5LAdeKU1YA0gZyEMm3toDwn+eVTpRVheZVcAxJI2Zjp2HGU2k4qehmt7yJRCpllIMw43j7cLfr40domwbLkxqvpyY1WYF0KCsu+bMLCD6lmTwFd6nsz3k5KO8NxV+GoZmC5P5UlYHqzzHohGSvb7eMFXx5B8teqQf4x0iqFV1YTKOFWv8c/qlASI8D2r1a1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EE2WJ9Mu9OfgOjveUiyoBSw25hXiuKUZSp1PxNP7R4=;
 b=WrEh4YeWIexvoa/qe3mvxUd+9IoHPQvsQJmCPi4ag22IUFqSbecw69LL7OfQ34xvdBEw6ReMwNzU3bBK5CFLtej179UbQj+3P6H9YRkpcNr1BqCyQozYf8+dHeXT+6Yz62pFPqFI2bI6K/b/hRY8JL06CzrR6luKgtNlhNkalRA=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by IA0PR10MB7273.namprd10.prod.outlook.com (2603:10b6:208:40b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 06:40:10 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 06:40:10 +0000
Date: Thu, 21 Nov 2024 01:40:08 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix memory leaks
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0442.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::27) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Message-ID:
 <SJ0PR10MB635051E2F4FFEA4CBE5B3B02C2222@SJ0PR10MB6350.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|IA0PR10MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: f4326622-f70c-4220-df86-08dd09f75869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eDexXuIjQGEabGYXaDDIr19CxeUHtrtnvziJnrxOj04ou6rEynL2fsik4B/r?=
 =?us-ascii?Q?x/GBxUQmMHWbazZbA7zf8fPHPK5JxAHbCb/kzMavw6CrPUbvvNk0QbVqvu3p?=
 =?us-ascii?Q?Hb2YdeTIHTeih9cXzRSS6y1nMgqEKUUx3VfqzK18O+exfB2lyu5bxLvHkx57?=
 =?us-ascii?Q?rKSXhGUk+NjokVb1foktPyodS6UYMtQaeZiCwAl6uOIUYNnadqy0TU3dAdFT?=
 =?us-ascii?Q?8021RzuISy70v5MaG42iGlGoYO4pfN4z3R3goT202CHkhVVIGvgv125D9Cx8?=
 =?us-ascii?Q?0FX32xADfjKF/oTM1+cYF0it1aOGz2j6FYh3iTNmDL2lbZsqIJLM/a9wZtya?=
 =?us-ascii?Q?ggBcgAWZ3vcP9sjSkZaCVpGEebV6lU3upux0GTVrKgLHTgDv1TnCCrjHVD62?=
 =?us-ascii?Q?hIlVXfk/CsqxaemMRRZz7i/Y9DvtGVt/kLFIl0jW3aghyGXfUAeBA5CzXkLB?=
 =?us-ascii?Q?U8klfe/Lgp7BZqUKCuevVxRkQIjHhTuY4U3Oj0UY3++1KDH732ehH8ovdMbd?=
 =?us-ascii?Q?MHSdVBpFJa0586uiVnTuB0F2Fq1ViQLVDIx2ulI6zj2WNf4RwBKondpnkZZD?=
 =?us-ascii?Q?9kPOK5VmKT22DO5hNsu1+Y1XZL22LPa6Tif3GUlCXgMp0Zh7BR40S7+GrfPX?=
 =?us-ascii?Q?6fnsYIF3O1X+P//Zp375nrEaixxCIit1W6YbSXYmUI2V+qn2gtp+2ZRcG6xb?=
 =?us-ascii?Q?eavUlZCRZfuTOPdFL6l6rqx8sbOrlZhaoA/Xzi6qc0IA+fJzsgW93S2Bd5LN?=
 =?us-ascii?Q?cfAhbAAfmVHnw/9iGoJfhwO82VbDBEWwP0GSHfG1bdEZEXiG5XhAcQMKbGgb?=
 =?us-ascii?Q?/UhvltNLl/qx6kECAdfpH+nRnPemhSM4CoRc2w+mcpovUbA1YXIKMXcnGWOc?=
 =?us-ascii?Q?ejvXoUWiabkpaYvKTfU7KRdFDq2pe7IpWnctyPLbscwAS61Sd+ysvMHha2Fm?=
 =?us-ascii?Q?Bq0+Tc6GbJtl1OencBr9D6phV9AUJQvWcr7wHyK1PHs/CnOawuJ+UM6o+2d6?=
 =?us-ascii?Q?k/BhBKUMpRUO5EPLQO0fCzsulZN5AeUwDcWAuvT5QtKZbPyWVwLuyVZjTY5R?=
 =?us-ascii?Q?czfDxnTvMS+vY55xVzbeYLtecguqU4lRUKfQy3Y7ieip/WmG6gikC3bBPJwF?=
 =?us-ascii?Q?hoXnPC0Y3UjPjJdAKvkw+tHfajtbr1IwiGtAwLBC9VxmqWqH8bcuC3S94fLw?=
 =?us-ascii?Q?ABj7BNzkF/qBkkgHIbABGSzAbS/44Js6SgcXL6IClh4djPRT+PE+YRFrVP97?=
 =?us-ascii?Q?OlZEHkhiJJYe6c3mAYOJadTkpgKsKy6yC422l5nknvRDZeXUyBek7gmkwJTr?=
 =?us-ascii?Q?0bP3uMMmkMAOVerdm0CMp9s5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AdnuorvBzU7/SRBzTfuKnx70epAbCRTAP0VDIzegOcqM6IhEmCEmKx0MIqDy?=
 =?us-ascii?Q?PxR5dFgjrHvGskj2FMZi9d//Rs4BCudG6KHgfHzvCjJMqFtoyqGDnKARhKEt?=
 =?us-ascii?Q?r2SaP7utrhVQrkSWRpZAb6NY+dztZ4+y9MzpWndvopuDbBd1oXfhXwD94VB1?=
 =?us-ascii?Q?ls5pdY5+W8AV4Ap4UeN2N0RZNOTNqVMY5bbcxGgMG8u15EnIDssmTAvepJtJ?=
 =?us-ascii?Q?Vc/bn6NqaGDQ4NmQ0gQ3toFsskCrk5gWsz5P31JVr8IrNKIzRxjJECa7FnZ9?=
 =?us-ascii?Q?kknK8U6yfXBgLZaaBGMvoF4Te74h4Kk8L2dkpWKotKWhHpYheLrxIlgxYyn7?=
 =?us-ascii?Q?1154wGuOiEy6/uGMvmOlvfD9cEtOH29qvuSfGrS24yA73KxV4avZKXoZbtpz?=
 =?us-ascii?Q?neDNtsCZCV37ZJE8Sb3DDKBBQOSvHzurYwdQRdcVG481lx0OQJ6yK65nEEhk?=
 =?us-ascii?Q?JfaWW5/oRrJPgweqGeP+tq8Ww5SL1bip/82kwQnFlmYJ8FqI09D5UUP/st4U?=
 =?us-ascii?Q?oQU1cbz/dg1Nn96KRrVRF4zesYJRH1NypFIMIEZgVDnurvd3w4ncwjc70Wwl?=
 =?us-ascii?Q?SvG7pW7/K8Ia1qfaVjxmglXa8OeypqIK03S/BJG1cLH5KUQ8klZgLo+IleNA?=
 =?us-ascii?Q?AVCc15bZRVnpmFJ6nQc1qwlcdIGU+YkxjSF3M/zVYJpr40JdBqh0/5wlzA3P?=
 =?us-ascii?Q?ERVxwuo/F5GCBeNriHZj/ieUDSkr61pHXDP7GJCE2FgGc3RZ8g408oYWBFvU?=
 =?us-ascii?Q?OwmR0807bEv17ZWtICQQtjMXp+kLZvp7rl2SeN3BIFWQT6eyp9LsJGY78Tyz?=
 =?us-ascii?Q?CmNj7tOD4PtFgOCsXJPbnam366TYaIVM8OIQXs9HErcyXt9YVPpfhyBmenGZ?=
 =?us-ascii?Q?ExK7CEAwDR/GCBvfcORzSW1Rv3KuAEkuYc0hx8Br3cb1UZ6iFpug/qrddQPz?=
 =?us-ascii?Q?6IsSgjAUtZUlDyahr231IOhIePIypK4d/0XoP8D3d45pDRUmGgOSkLGtVmKv?=
 =?us-ascii?Q?p/A3sLl8uU5JbLCCuMl9jHiO8FKVNPccfwTnsqnXDTSL9NQ4NG/5gToiFvG7?=
 =?us-ascii?Q?g1xbY7D5XeZGbzbfQhlkvcegbc1Pvep25f5YYggEToI2n9XYhmviBtiF7vnr?=
 =?us-ascii?Q?7K5T551etEZ4/txf/+r3qZHDS2yvXXJ5G3euk1l5mrR7D/uwCujS7BKFkTiZ?=
 =?us-ascii?Q?Ju8x+lUHE0r/2wjJB1IHFxWGtsqhsEYw2xFebhApBK5x14xoRAhJJhfCpjgh?=
 =?us-ascii?Q?wRFKwitP0UZ2pBWg1jdtEuLLmTbSAku2fMXHHjf/hKy6w9nsbgF0yThEvBDA?=
 =?us-ascii?Q?L/0QuXtTGE8b0pWY3KjME3ExkGviaoWnsroyuQPaLseQEj2StAokc0EpKjY1?=
 =?us-ascii?Q?K/DCFL8uf38si7IyKrYVfDo8HVzovHyEU/W/g1QOmk7iMYPO1t/qh6DH7UjI?=
 =?us-ascii?Q?ra/TjvJr1TnMoDiFcuWXUxjd8R7ZUn+Ete2znGXmxUfbJKLLcwd+KgtxKLoc?=
 =?us-ascii?Q?pHRwqPzj/7SQvVHV2bW+AY609JiybUvNhsMTt2yK5T0YZEgASqf1il9DSMle?=
 =?us-ascii?Q?U4+vgzJp7XPdMwFw93LpaVDNauVebqJPg7ZqIxv/YaOtKkk9Um2bBP3x1TZM?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5IV4lvm16U4ORFWZpIVn1p8uFio+7mQ/nkdDEMnPNwNo71bOvikDofRAuXd0fOIWfE4vvsg9t0ih9LT+GlqCK6HK4OyZyo4wNVtWZscSOEoiCJmt3bbZfmJx5UvfmEuDVaSi0gjb8fCEZVILnr6Kxr4WwC0NQlF68nbzXr9JLgLaZIoGfHe5ftjY7Ebo7qo7UcUvneQAwKtfOGSrIx86fSjm6xo3P14L4kTOlL5K8UXXB+onjXBS3mtCDiwt4JxyfAzplptBcj8Rfhi8iB8VAKU6OFuMRIi2Be3tCpCsp8Rfhd6uSSW8dPDA+A/RmaMRN9Cck/FdxC9U/zWJotPhSBLYuA9dfDyD4RxnQ3zWDBQaukC6FOEhc1Q7T7X/Rr4C6xHAf1D/oCSHzHFwXZWbdZJjRAugzJiNfV+1WilVFR+SL07o65x2s1zbQv6GKgnb9u6qBHyF7mZG0raeYO6BUgh0LvWYTkNLbc1r3vQbuUNw6DpkRtxs7TJDZbiVz1zVJgMes+mCV2d2hyPDSBXZ2j9Zsm5g5KZeh/dfMRGlKVl719yxHbJ8R7VmZ0AVZoEw66RA1ReLq0c3iMCu+qoXtaIoc+GeKl9/wS/XwDzCbSk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4326622-f70c-4220-df86-08dd09f75869
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 06:40:10.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t8X5FTSbLBew8c0KdEVIoLwTm64L+FJcM8PE5ij6tXB9nSYHc+bk7Dbr+MVE1GXVWvz4DjdNns0V1DfrDelI2gcGw/NGcqaMlFuzQb/13Tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7273
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_04,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411210050
X-Proofpoint-GUID: 4lTE_Uf5vIvL0JopfCTfb8wS3FkjVvvi
X-Proofpoint-ORIG-GUID: 4lTE_Uf5vIvL0JopfCTfb8wS3FkjVvvi

The array of statements was never freed.
The PFM library data was never cleaned up.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_open.c     | 2 ++
 libdtrace/dt_prov_cpc.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index e1972aa8..717a7ad0 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -1314,6 +1314,8 @@ dtrace_close(dtrace_hdl_t *dtp)
 		free(dirp);
 	}
 
+	free(dtp->dt_stmts);
+
 	free(dtp->dt_cpp_argv);
 	free(dtp->dt_cpp_path);
 	free(dtp->dt_ld_path);
diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
index 8f33cf58..57b11b13 100644
--- a/libdtrace/dt_prov_cpc.c
+++ b/libdtrace/dt_prov_cpc.c
@@ -484,6 +484,7 @@ static void destroy(dtrace_hdl_t *dtp, void *arg)
 		dt_free(dtp, probe_map);
 	}
 	dt_free(dtp, arg);
+	pfm_terminate();
 }
 
 dt_provimpl_t	dt_cpc = {
-- 
2.43.5

