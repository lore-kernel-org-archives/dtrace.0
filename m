Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E918C034
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 18:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424793; cv=fail; b=qPkaWgV6FLxnfuhfJdxK2toxHmqR0/8FaW/SWGMFGfJKKzqlZwZaFrELB7L9W3fHlZs1hBZyjHsYwIHqered+VMnQFSHSyStQduT64iStYfaAB7SYi8yPnZNtPSiGkuXa2r25qJTN37Z4QrjGQd1aF1dnZz0PrOgzqJ7iL9kmoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424793; c=relaxed/simple;
	bh=M+24xXV17D2ywFOHjQ+iwnd+nzf/pAJ/jqVgwe6CMDQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=VhoZuTFonG6uK9cW3YIuMckVThP3NmQumxWOIyzV0/e0q/FaMXUTt8wH3ww3K6pTaCE96O/+linBOqq+04P7P4xO6P5/keHC3hcUeywITpxTFl72jZhPc8vbgd/7LIYZJWHkSSpT12iCnb+Tpb01NVfq4uKOTF1ipelaUxzABBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H0752Cvw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wpWSmrzf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H0752Cvw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wpWSmrzf"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5DfmMA004654
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=Vj4dSmQhUVj/oh6KIxvSbs4pB6mVAFgyDM+OvW9rOS8=; b=
	H0752CvwLIU4jra95lQjtK1ctcngxmm680ej3PlPpEjc5cA/no0qDMdfpMh1Fi2u
	gsZI+PfQawyL30/pMhAmHeO4vbFJvg3dphcjym8EhzCFy1dUaecdlN5T26sSM4Sl
	88Hb+EqEGwKcaHOAipVcln9hYeYxs4sv/GDOyAFuyJxTpwrKpAuv66oMHHlFdEN6
	7GinRjW8rBH34R1W2+EPD0sXCPYL3oz21AFMDtLxkF/ovFGEns86QhQ3d1Z6BlIF
	ARO8bCkwRPWySXc+0cfkcDNRqYJ7Mf/cHUeZ4dYDd0/amdoatz/xK7WphA4dgDIN
	fkAYej4KmFyzVCM1cj2rDA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sa03y1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5I7mbC040206
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:09 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836x8k1u-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWl6R/q3+2myhafg9O5ZC6oEgDhGytqUFbKTPBlcMhfsnvCingnS3SEcTWvUMMsKgOdpqoAX35v54jiiOAze1BeKwHI9xBK6jUssOYJs5pmBvUfLotaBC2/wGIdHX/tiaExOQ0+T3Dxp203QcJzNwpNhJ++UWQef3UJc+M7OyrikCr9KKP3dX6VmI0YfCTQs684fjk/qNV4d1VFmj3T11KeHj/0G/rd/sKUGcl3IOL4QgKZmLfjpjlivnrSK3rbAqDUzlaLjy1aqHWRyBC4X7a3e+6ZMeS4t5TR9E0danCLx0iXCcHl3sP0a1OxZASmsInAkbm8Pr2aoDYgjHEdprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj4dSmQhUVj/oh6KIxvSbs4pB6mVAFgyDM+OvW9rOS8=;
 b=aeR8jUQlyCtOOsH3wcG2AwvsBb/lcX8ahtm/MrpxYH1GDVR+OsNsxn2Ignqc8WHVXg8xctG1QDjkGdcPzrEjcSEUwTJXmFOisvrrhO33+AmpQBW/kZbb7babuj5Lc1C9DazVlqcQtg1jTFedEs6m7z5fT6sVEJRvxx3PC204zvzW2Hu0YHniDfUXV29ZCb6yEKOACQtmjFSGZP38F3VNdPr9mz7GCLa3bYGmuEJdTWIXpseCir4lSiPUXKKwD4Er78gw+x69U0TZeBkP4Iq+6YI+5LiiNa+fLtrknWlEBoBKX8Y1uhpxEMHs0BO0iucQO/tJLFVQ0hA4QOkFOehlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj4dSmQhUVj/oh6KIxvSbs4pB6mVAFgyDM+OvW9rOS8=;
 b=wpWSmrzfaSNPmu69d6CkSZpBOs18kReqo9XmYYm76YPZytTWLAdXywtiqWh5uEGuGs+/hIZCXtiNgN16b2dAkZpyn4emhZcbZd9a8W3Zp8kTwuWyFaUT5jGFLaFEjKuDE3nMzv2ugliZr0TVlqRanuiPQ1sS2vsetqdhL83ZR28=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by SA1PR10MB6447.namprd10.prod.outlook.com (2603:10b6:806:2b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 18:53:05 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 18:53:03 +0000
Date: Thu, 05 Dec 2024 13:53:02 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] tp: clean up the API
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0429.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::14) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB0037AE9D5C80C0BE27FAFD77C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|SA1PR10MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: c713fb87-5fd4-4992-ee48-08dd155e0c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Frr6rJObfEcDJhG08zZvnI83lLQRVw8ugp0gNJfbKeOgSuG+vy/epfXRI2q0?=
 =?us-ascii?Q?HG6+rimOqyW/9s57PfFK/u0Ppvb34TWTfYefGGbAQmctP5juZopoii9azsJm?=
 =?us-ascii?Q?1R8a2OzIb/heiLEgyWjLA9sR5TTesvRwY6P6Evn55NnsnsFmQ/WXX1+WDPaV?=
 =?us-ascii?Q?oY7sSiq9XZ17vVy7Wct6XAJppe2FxcF6w3897VMskrYfpme70i9iANyZEeBH?=
 =?us-ascii?Q?9fQT5bCiIflbt3e0sMIlCasH4zrpLr63AZsfJzNSQ64R9QBHvt/k3ZJ2MWje?=
 =?us-ascii?Q?eNvH31i5GknI535STVJunQSDOZeHmMPuHblgX4L1IZ2eD2IIBQc605gj/lwm?=
 =?us-ascii?Q?IbN6+ZvqfKGuUDNpJGp64Hl2TuJvbifV9eCIw0Dbzv4FOvs04qd0JDkyI9Ya?=
 =?us-ascii?Q?GibqnLpJnGMwMg7DG1WRBgu5cCTJ3I7u/YoxDv2L5IbOhE4X+Zg4m+NtJtWk?=
 =?us-ascii?Q?/CDWwH6lvyafKfHFIr6K7cRSQKfEt4tSzWFcsVpzwRNpmvevLcymZ/tfZFQE?=
 =?us-ascii?Q?0GIDuesLSL+7FMb9XXvMV3FSFWqjQlGrI4fXCLRjiZbv1Mf8uTeJoJw/staN?=
 =?us-ascii?Q?wTUWAk1tsUITimy+KxEzpbnt/2xSleGiX44bDIJoMG/vNNA16TRWR5mNjUSx?=
 =?us-ascii?Q?t8rfyU/5vY1qV1aCzhBBRTsuI1z+LprokU6bFRes+T2MBd3S18nz7Hg5THw9?=
 =?us-ascii?Q?ILKPhcsrSwWvve0zdX0hqLOQYQS2Ctr2GVMOp0Dx0rsBxFdW7OAq3CG8p51x?=
 =?us-ascii?Q?mAFnZ6NAI2jbNB4Xj9HutpnCrxbZU2fGH1XerNP4eNqD8Jbv4rN+34vcPYHy?=
 =?us-ascii?Q?0kUbjNtr/YUZ5NA0hT6lK4APCgmFDGcrA6gSmcMALoAiXkxuTqcxV5t11gCs?=
 =?us-ascii?Q?ZDvti1VGY4z3GRrojspT+6MUdkjWYAT3yq/FCyZaKaLnF1zrFK4j5cjv9taN?=
 =?us-ascii?Q?GbtlMbpvAKH0A9TlVEHVNXD4sbsdlk/Y5dOfZTZBoKmF9gXIPePDLaw+nlRR?=
 =?us-ascii?Q?IYZBqacYg4F39H0aumRElucj+OFuqZtxYFbxROOPhXSMXGro9d3ZsTacZjN5?=
 =?us-ascii?Q?mim3IsWxQBZoyrr6PlaIIVvMsVHYhTebw2+nEOUj3pTPeaROeViVOYULXNyo?=
 =?us-ascii?Q?vjOnqFzfImXYYSv4aaGLx3swbQ1nihDa5L229e+r3DjE06oh+yQg6KqPKoRq?=
 =?us-ascii?Q?ZXz/epekqJU8tWjDFurFimJVfFZ2L/hr2opye7JDL4bvjt44s0TbOOOcWdIk?=
 =?us-ascii?Q?fHjqAA8tL+muk4B7BUD5CGQNWovTwoaBUTOr3cdPPkX/qegSng3gD8HOZWe/?=
 =?us-ascii?Q?7BpzqoWlHvWq5Shu7EHrAleH7exGhyEXdr6Dk6PtDlr86Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6KiswI9KxKCLSzoM/cz8b1IW96MGnmgBYkXSxWFMzcJZKSJMMXh1dAdCGfAJ?=
 =?us-ascii?Q?yk5HHtqTWtdHusvCGY54UNoFYOBY1hG/+F5u+WUE4d51MPABjFZd+kEI9gzF?=
 =?us-ascii?Q?Qlx15U/9/47BKeNSMfUrd8B64zRFNaXNv/pqgTyJuypCyhEorZRX6wIj+r2d?=
 =?us-ascii?Q?fVEDsSroHza468niUPE7S3/nETpDQk/M19hZbbic4vhnywC76NiDop/8g9it?=
 =?us-ascii?Q?yZR4XYeAVp/7t4QloivBW9cuQvNWtAv8xn55ih80fTKoBsYXqeuPWWYll2kz?=
 =?us-ascii?Q?EHAoPjRm8iBBKkJQWE5AFxNNuw51eQzHsl/JYS5OMhb5r4jFQcXNB6Wob0FS?=
 =?us-ascii?Q?heZs/8vQNDXTbnxFe1lkVTTa+UEcSORtQfhjX7zISh+tXUwOuE6BMzkdtllO?=
 =?us-ascii?Q?EcUGQkboBDZbVgn/DxdGWU/Pf5+9ZVq1p7KdjVBJmGR+l4GVW632bw5BTP0k?=
 =?us-ascii?Q?usinQZVWXShUXanvffGnAZKLP7CSKSAwcqOqDWcBbfkKQVokRjSY5LCedort?=
 =?us-ascii?Q?uU2yiFchF4PgTTkX9+RU8qikm+QVcrcDWGYV9GHfYbabYhcozc3irvchZ0FZ?=
 =?us-ascii?Q?eC7g3bVRFHJqgvjoTb+SbYHCI/uInLzAerOoBrV1hh6/hmSThHiH1lGLhqlu?=
 =?us-ascii?Q?r73Stet+cZmx8Nnv26ShUG15Zq9GTgAb+HWcXesQMLWPpDYpef6t27LBG8zz?=
 =?us-ascii?Q?igZgmYShyWz7q9z4NUTKnaiyHcsol1Yn/uZHwCcjZ9f6RUiWe11ncUK7lcA2?=
 =?us-ascii?Q?5/CDWfyAY6OEAhXa/f3wcckVWqf6ZhXqgaxGKbzcjTvLbiHD+cdrk6+Iheel?=
 =?us-ascii?Q?bIq+Fgzjn9XNR9fdAHtNauErVwf/S12N8AouKZGT+rYaFVa6b4ps0sXOQjnI?=
 =?us-ascii?Q?pAqRrOaMHAR4N9c2/MvIfunEHsT7DAp+iVK0NNzQAAjavFlM9ffA/bIAeF8I?=
 =?us-ascii?Q?AaYGPHrLCiWGvKTdnMiDT5btw0n1aE4IzfjbWtov3tvidN0/rcsqFuZRs0Jg?=
 =?us-ascii?Q?LBRVw5+vbSbOYBYGTEGXIaVd34l8KIqG5lgesRP4ghid4qv/T4ieJmjHxm1Y?=
 =?us-ascii?Q?sLSueUBS9L4DYc0gZyyZJrcsV3ECESLDrCeYNT5sBS6TJVoaLZJDxKe16E9n?=
 =?us-ascii?Q?V8bvf3kQk6Y1wuY4cAw58LetyzAuQK5UGQf32o4iJY9syoybIPGTa7Tc4YBL?=
 =?us-ascii?Q?OnYU/jUXAfGX8SgqW5eWicrjvuv/YWbx84Q59TBVYrJIKNNJeh1mtqz1vMTZ?=
 =?us-ascii?Q?zMv9K34MYIrs+yP8dD0oycc97LAR71zJF5Vx2fMTM8IRP5uCO04u1bTWZY8a?=
 =?us-ascii?Q?9aTcDvUNdw7nika49SHvOFmdDk9MmEXqVg0gh/QHU1aRff8XASsX9EyEHEFf?=
 =?us-ascii?Q?uAYMz2s/NPjITr0IPI8M5OfdEDoD1cCklM+h2Hz1AIx0d0P/wJwsD6/GlPPc?=
 =?us-ascii?Q?QNj/x+6ab9koFmL1ILTx1eM9e25LsIX0MFcMNterG/UO1kT41wX6WMZUP6IO?=
 =?us-ascii?Q?TPZ4oY0080zRMgrGfPoS+YtOJNuozVIcVOPvxnZtrxcFt5Ay2D061BQdwmis?=
 =?us-ascii?Q?ky8TRbYgq/0ygyiFFzTFysZipHsjc1AEPYuR2aS2IAQGQqbe4lnjkru6auQl?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6I3NBA/ZoahJsVitSsOwuWXcYfAHeCufU1CCANy9XfSOInQ6cT5jDjIrcfE4tnc2g+7B/J3BJjMkFZfMtVvgZQYOcBXnZBb5E/wwdKnYNjCfQn/903KplScqu9e79MmjHrhsSFloR0BB851QHkkfF7L8sGDsvsId3Z6JUEsXpONz8jSnu7VJrPWd0lX5oid2PmmV1RcRtSG9PJBd2DGZhvIa9Qjvwi+ZcZxLuw9/X4S9uU+dO0oa88/V4c0ZqB635x/O7Xhqx+i1kTr2N1nd5YkNwbt/RmPeuJxZmRG2jmvbXpcLRwsToaNokx9IEQO+5xlUA4ihKlqs9w6Yz7AEmVnhHukF5r5jSlPVQEqLeTVsyPV8sJUYlMHIUZTqLvv1xKyj2dtjMXhdioxjdwKisXNp5s1QA4Uq86o5vUhYRxKCCkhJSPkPWiCJe6Wxa6hGFbk3NcpDTe2A5OF+qJTkaSrH5snkCsKpiYc8D3s8qVjakaWgUZlbE5+EEmE1Vl4peTTyjNWsTXhWUZjDCLlXOhazxvDIE07SDR63xUmvdBOhm2c0YE36ep0ZC1T9yz2OEkmO6I/M6r0ubU9hL00VPoLUDYxk2opc5EePf9750oI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c713fb87-5fd4-4992-ee48-08dd155e0c62
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:53:03.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1Fop2PmLj2O9PHhU4QBhFD2FUIxibZvIwdX1n/XWS3A99xxSNCoqnpH+g5ZjZmBYIuptWkSyFT6Yh8uNarYUOXpMr+GI5G0kwLoGkhBvWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050139
X-Proofpoint-GUID: XWFu5gaEdXOKwZTqqwkmUAG-QgLPaU28
X-Proofpoint-ORIG-GUID: XWFu5gaEdXOKwZTqqwkmUAG-QgLPaU28

All functions that can operate on a tracepoint object had a convenience
function for probes that are purely tracepoint-based, except the setting
and getting of the (event of BTF) id.  We now have dt_tp_probe_* and
dt_tp_* variants for that.

Also renamed event_id/event_fd to be id/fd.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_fbt.c    |   6 +-
 libdtrace/dt_prov_rawtp.c  |   2 +-
 libdtrace/dt_prov_sdt.c    |   2 +-
 libdtrace/dt_provider_tp.c | 129 +++++++++++++++++++++++--------------
 libdtrace/dt_provider_tp.h |   9 ++-
 5 files changed, 90 insertions(+), 58 deletions(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 21f63ddf..da288401 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -208,7 +208,7 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
 		if (dmp && prp->argc == 2) {
-			int32_t	btf_id = dt_tp_get_event_id(prp);
+			int32_t	btf_id = dt_tp_probe_get_id(prp);
 			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
 
 			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
@@ -239,7 +239,7 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (btf_id <= 0)
 		goto done;
 
-	dt_tp_set_event_id(prp, btf_id);
+	dt_tp_probe_set_id(prp, btf_id);
 
 	if (strcmp(desc->prb, "return") == 0) {
 		/* Void function return probes only provide 1 argument. */
@@ -306,7 +306,7 @@ static int fprobe_prog_load(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		return fd;
 
 	rc = dt_bpf_prog_attach(prp->prov->impl->prog_type, atype, fd,
-				dt_tp_get_event_id(prp), dp, lvl, buf, sz);
+				dt_tp_probe_get_id(prp), dp, lvl, buf, sz);
 	close(fd);
 
 	return rc;
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index 778a6f9c..f1d3b6bc 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -221,7 +221,7 @@ done:
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
-	dt_tp_set_event_id(prp, UINT32_MAX);
+	dt_tp_probe_set_id(prp, UINT32_MAX);
 
 #ifdef HAVE_LIBCTF
 	int			rc, i;
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 675e0458..74555f5b 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -241,7 +241,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (rc < 0 || id == 0)
 		return dt_set_errno(dtp, EDT_ENABLING_ERR);
 
-	dt_tp_set_event_id(prp, id);
+	dt_tp_probe_set_id(prp, id);
 
 	if (asprintf(&str, "struct trace_event_raw_%s", prp->desc->prb) == -1)
 		return dt_set_errno(dtp, EDT_NOMEM);
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 50df2328..3d4ec1e0 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -31,8 +31,8 @@
  * a tracepoint or BTF type exists yet.
  */
 struct tp_probe {
-	uint32_t	event_id;	/* tracepoint event id or BTF id */
-	int		event_fd;	/* tracepoint perf event fd */
+	uint32_t	id;	/* tracepoint event id or BTF id */
+	int		fd;	/* tracepoint perf event fd */
 };
 
 /*
@@ -47,8 +47,8 @@ dt_tp_alloc(dtrace_hdl_t *dtp)
 	if (tpp == NULL)
 		return NULL;
 
-	tpp->event_id = 0;
-	tpp->event_fd = -1;
+	tpp->id = 0;
+	tpp->fd = -1;
 
 	return tpp;
 }
@@ -62,10 +62,10 @@ dt_tp_alloc(dtrace_hdl_t *dtp)
 int
 dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd)
 {
-	if (tpp->event_id == 0)
+	if (tpp->id == 0)
 		return 0;
 
-	if (tpp->event_fd == -1) {
+	if (tpp->fd == -1) {
 		int			fd;
 		struct perf_event_attr	attr = { 0, };
 
@@ -73,21 +73,45 @@ dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd)
 		attr.size = sizeof(attr);
 		attr.sample_period = 1;
 		attr.wakeup_events = 1;
-		attr.config = tpp->event_id;
+		attr.config = tpp->id;
 
 		fd = dt_perf_event_open(&attr, -1, 0, -1, 0);
 		if (fd < 0)
 			return fd;
 
-		tpp->event_fd = fd;
+		tpp->fd = fd;
 	}
 
-	if (ioctl(tpp->event_fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
+	if (ioctl(tpp->fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
 		return -errno;
 
 	return 0;
 }
 
+/*
+ * Attach the given (loaded) BPF program to the given raw tracepoint.  The
+ * raw tracepoint is identified by name (tpp->id is UINT_MAX) or BTF id
+ * (tpp->id).
+ */
+int
+dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
+		 int bpf_fd)
+{
+	if (tpp->fd == -1) {
+		int	fd;
+
+		fd = dt_bpf_raw_tracepoint_open(
+			tpp->id == UINT_MAX ? name : NULL,
+			bpf_fd);
+		if (fd < 0)
+			return -errno;
+
+		tpp->fd = fd;
+	}
+
+	return 0;
+}
+
 /*
  * Parse a EVENTSFS/<group>/<event>/format file to determine the event id and
  * the argument types.
@@ -120,7 +144,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	size_t		argsz = 0;
 	dt_argdesc_t	*argv = NULL;
 
-	tpp->event_id = 0;
+	tpp->id = 0;
 
 	/*
 	 * Let skip be the total number of fields to skip.
@@ -136,7 +160,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	while (getline(&buf, &bufsz, f) >= 0) {
 		char	*p = buf;
 
-		if (sscanf(buf, "ID: %u\n", &tpp->event_id) == 1)
+		if (sscanf(buf, "ID: %u\n", &tpp->id) == 1)
 			continue;
 
 		if (sscanf(buf, " field:%[^;]", p) <= 0)
@@ -287,7 +311,7 @@ done:
 int
 dt_tp_has_info(const tp_probe_t *tpp)
 {
-	return tpp->event_id > 0;
+	return tpp->id > 0;
 }
 
 /*
@@ -297,11 +321,11 @@ dt_tp_has_info(const tp_probe_t *tpp)
 void
 dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp)
 {
-	tpp->event_id = 0;
+	tpp->id = 0;
 
-	if (tpp->event_fd != -1) {
-		close(tpp->event_fd);
-		tpp->event_fd = -1;
+	if (tpp->fd != -1) {
+		close(tpp->fd);
+		tpp->fd = -1;
 	}
 }
 
@@ -316,6 +340,24 @@ dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp)
 	dt_free(dtp, tpp);
 }
 
+/*
+ * Return the (event or BTF) id for the tracepoint.
+ */
+uint32_t
+dt_tp_get_id(const tp_probe_t *tpp)
+{
+	return tpp->id;
+}
+
+/*
+ * Set the (event or BTF) id for the tracepoint.
+ */
+void
+dt_tp_set_id(tp_probe_t *tpp, uint32_t id)
+{
+	tpp->id = id;
+}
+
 /*
  * Create a tracepoint-based probe.  This function is called from any provider
  * that handles tracepoint-based probes.  It allocates tracepoint-specific data
@@ -334,22 +376,6 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
 	return dt_probe_insert(dtp, prov, prv, mod, fun, prb, tpp);
 }
 
-uint32_t
-dt_tp_get_event_id(const dt_probe_t *prp)
-{
-	tp_probe_t	*tpp = prp->prv_data;
-
-	return tpp->event_id;
-}
-
-void
-dt_tp_set_event_id(const dt_probe_t *prp, uint32_t id)
-{
-	tp_probe_t	*tpp = prp->prv_data;
-
-	tpp->event_id = id;
-}
-
 /*
  * Parse a EVENTSFS/<group>/<event>/format file to determine the event id and
  * the argument types for a given probe.
@@ -385,28 +411,11 @@ dt_tp_probe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 
 /*
  * Convenience function for raw tracepoint-based probe attach.
- * This function is also used to attach to BPF ids, because those are also
- * handled through the raw tracepoint interface.  These probes are identified
- * by event_id being a value other than UINT_MAX.
  */
 int
 dt_tp_probe_attach_raw(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 {
-	tp_probe_t	*tpp = prp->prv_data;
-
-	if (tpp->event_fd == -1) {
-		int	fd;
-
-		fd = dt_bpf_raw_tracepoint_open(
-			tpp->event_id == UINT_MAX ? prp->desc->prb : NULL,
-			bpf_fd);
-		if (fd < 0)
-			return -errno;
-
-		tpp->event_fd = fd;
-	}
-
-	return 0;
+	return dt_tp_attach_raw(dtp, prp->prv_data, prp->desc->prb, bpf_fd);
 }
 
 /*
@@ -426,3 +435,23 @@ dt_tp_probe_destroy(dtrace_hdl_t *dtp, void *datap)
 {
 	dt_tp_destroy(dtp, datap);
 }
+
+/*
+ * Convenience function to get the (event or BTF) id for the tracepoint of a
+ * probe.
+ */
+uint32_t
+dt_tp_probe_get_id(const dt_probe_t *prp)
+{
+	return dt_tp_get_id(prp->prv_data);
+}
+
+/*
+ * Convenience function to set the (event or BTF) id for the tracepoint of a
+ * probe.
+ */
+void
+dt_tp_probe_set_id(const dt_probe_t *prp, uint32_t id)
+{
+	dt_tp_set_id(prp->prv_data, id);
+}
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index e7d52876..f131b1e0 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -30,19 +30,20 @@ typedef struct tp_probe tp_probe_t;
 
 extern tp_probe_t *dt_tp_alloc(dtrace_hdl_t *dtp);
 extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
-extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
+extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
+			    const char *name, int bpf_fd);
 extern int dt_tp_has_info(const tp_probe_t *tpp);
 extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
 			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
 extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
 extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
+extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
+extern void dt_tp_set_id(tp_probe_t *prp, uint32_t id);
 
 extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
 					   dt_provider_t *prov,
 					   const char *prv, const char *mod,
 					   const char *fun, const char *prb);
-extern uint32_t dt_tp_get_event_id(const struct dt_probe *prp);
-extern void dt_tp_set_event_id(const struct dt_probe *prp, uint32_t id);
 extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
 			    const struct dt_probe *prp, int *argcp,
 			    dt_argdesc_t **argvp);
@@ -53,6 +54,8 @@ extern int dt_tp_probe_attach_raw(dtrace_hdl_t *dtp, const struct dt_probe *prp,
 				  int bpf_fd);
 extern void dt_tp_probe_detach(dtrace_hdl_t *dtp, const struct dt_probe *prp);
 extern void dt_tp_probe_destroy(dtrace_hdl_t *dtp, void *datap);
+extern uint32_t dt_tp_probe_get_id(const struct dt_probe *prp);
+extern void dt_tp_probe_set_id(const struct dt_probe *prp, uint32_t id);
 
 #ifdef	__cplusplus
 }
-- 
2.45.2

