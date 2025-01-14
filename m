Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91091F9433
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736897910; cv=fail; b=oZgCUtbmZv/2DVOEZ12ekCLLtCEnTrOuLFYElUH4UtB8abFcYOlKF0brmykPnB+ALfUm7GPVvqtvH/r2DBReNEJExyWbbXZVjbUoImda8InbEGqkW+0iQ6qEj4KwhYkYcxRIsR3P7OncYbtTdeiqoGtx0PbWKLNisLKT54fJgr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736897910; c=relaxed/simple;
	bh=qLkk6PXiAq1zugkAdcKCtPh8uPKT9zY/EBfGy+gS3rM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=naigZpPprlpV9RNpaoTPuzo+MDoYRa1akpa2672nyUD3l0Rcfb1pM6w1K/N9sVU8XGJC125ji1phd5zi7DLjt98FtUb8HZnapg1KZ64MGUefulipXZS+2KG823/cCYQAerti6CmIwpLdPJznyXmDjiVF4zCxFpgVtIQix2kKHxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y2jamWsq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H9Y2Y1ak; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y2jamWsq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="H9Y2Y1ak"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EN3OWT001938
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=BQHe/LniPZBgPtTp7K8whPwiQ5xQf7Ll6px03GOc4hU=; b=
	Y2jamWsqrc5G+BvJN/p0t6BilVHtl56yUYnMlDXBeoyplRcpnyCyCXIVbA87BoSQ
	JckrmVjivNMIpcNORY76Yf7+uazyzVVMxQZ5lI41WxZyISOguuPHGrxML/Srg5/f
	LOtIXCB/acLwybVyA8V+6dq5/ZprmakuKh1Gc4e9t6MZKTKYjjuyrqy/5G4gsr6x
	W7aGnFFYD5e2NqaNjy00+RA8hEdR0YkKfz1rg4BIc7VBSXtNVFuPrCZktr4iyxzc
	Hf3TCX7dHNydTadoCqlh3Y2F9T5Iz0s4zzlKI2bcJX7ZFSR0hSRnS8+kuM/ZrJDU
	OWVcD6NpZA7F8NjOxOMqeQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443gpcq0jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EM181B020364
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3f2yuw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Jan 2025 23:38:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKM4IXo827rFOGxlyW1WV3DcaId1WTb7K1atiJ32tMnovPbnt/4I4RnoQxCdozHzthdmZdn+k3i/yOb8gMCrDvPOOQDH4KZOCSZRlyEQ0zNrX0lEUsmf8BJxLYSysWK7NqBOhpN6oRqqv4mr2KmMF05x56v9uAB78Yyf8ZK0J/WE9o3Q415V1VLR5ardLXUXOQVaXyBtWgCXxcvEWAA3hc4d/vIncbp+irqbZGIjd3Tz9lY3Q24DLpTra3RS9V97kEvM3u0g6s3q5lX8NdQ28Kv2SFxiWPgGMWX2gnC+AdYicQWh7vfXL4Tt7r+aeMLj3dXG7i7+LYLCQic3cTtBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQHe/LniPZBgPtTp7K8whPwiQ5xQf7Ll6px03GOc4hU=;
 b=itcvgFSmBMdelI2kwtqmhNfK3ra7qBxfqm9W3cUaEXOfUmxjrVxfDhNtG8hDr5ELTUPiVxmsx9sFNzWRIzlTg/BashtgOxoaIENIdUC4E73zVLxFSOgB6q0J8LIh3Ob1lzgMdDeXuYXBj/wfKo4LdPId1WZHcAlZn3QInqusuoxrZANSpr4Uq7/IbeO/jMWIRXx/0yCO9NMbHIFCXF+jGbE31hUFLs5f6Rb3kk/VynunqM0Q5gSUjdRSR4Ul51I7wTuQPZCkgiX4stY3QGjQGqb0uR3bK0n2G5+4Bb6vDMQqvuWRzBNX5UDjeSswvp9dfFv0WrXK2WGteYi1j3FZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQHe/LniPZBgPtTp7K8whPwiQ5xQf7Ll6px03GOc4hU=;
 b=H9Y2Y1ak6ZSaE/9ZtonDaRAo3HBX3mu1EtPyDd3B78InboU1mfB6h+w965BzCOFafZrGMzvXwGednOqak4987YuE+VYLSZKHBSaaWByVPLQXDqvPeUJWfhWaQZLyQG7xM5e6KjcXUOt2d1BBZHxeBWu65Wa4q17RqSP4ECz4X9g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6477.namprd10.prod.outlook.com (2603:10b6:510:22f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 23:37:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 23:37:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 6/6] Add support for pid function "-" with absolute offset
Date: Tue, 14 Jan 2025 18:37:50 -0500
Message-Id: <20250114233750.5425-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 327669e9-2f17-45da-4333-08dd34f47846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LY/G9kI5oseRi9QR4QSHET5p9HdQKNpq0hk6mZLB01qZnEg/7ZNkWlvi5M8K?=
 =?us-ascii?Q?jUa0RGEMSScHvHGbU12ePlMba6fr5PSwT/YDDF/4f0qLRPJ2vNR5StcWhV49?=
 =?us-ascii?Q?rSILVbRHQWTsiViOIg1gJ2j5gqtzmIs+VQU0PJiAzvD1JlBiNVzG01Xu4fRW?=
 =?us-ascii?Q?qUZgC04P+K2fbsRhP/he8Ud6Zm6TP781NWLcon4hRKS6iugpd3B32Y5K3ZX6?=
 =?us-ascii?Q?ZHT4UILzOVOGaQI446Dhd1iWdS7dIMbVkFsYrYsxzWYg2tW7mAPaTjSZzNt/?=
 =?us-ascii?Q?mPyj1Pe0yMJ3YR1c95UQN31IU/IF6htF1oQ3BfLZrrEZBWUze+P82UJLk3Yo?=
 =?us-ascii?Q?rZcOVj2U6EICfQtMtP4ouqxt8dxSRF1cYkqDEP++De8h76brIfosKow1tpV1?=
 =?us-ascii?Q?1iLGdFMx6zsBnFkf9a0zVWxoYDLJO/V56urkHEbI3dMzLHBK9GodgDiR3nKR?=
 =?us-ascii?Q?FgkcmY0t+YcYatZpNkOjLTVks3TZho19KY+4ahAEZSkRZNGTYSGakDYmBDbk?=
 =?us-ascii?Q?QTSCP7HimPaZSGCUhx1xJpAS+eF23u8bQNflbQIAjWP6FyE5fgIBElEfaasr?=
 =?us-ascii?Q?BLgO+uzKGuiBDNpaLZ2x64zJbhki47bXhR97v2FImioCQaEmcl0RYh312W00?=
 =?us-ascii?Q?iL8paDh+RpRnizBJa/4NMm5r+5JgFZw62/ZxqN6TD7CsLy6VHrZO5vB//GfP?=
 =?us-ascii?Q?sr3UqYn4XjzZ3ccc/lH1z8j644vUP5fcd4RKnEe7TvftZrgQ/XL/DxxLa91e?=
 =?us-ascii?Q?jHG7cqSpX2hZRtY/YAYPIbCumXXcqLkqLI96JH95J3glI9ePZ7uDjwVp3UQ+?=
 =?us-ascii?Q?qvMI9pm+2OE78cxFlIvZmA9ImTDf2dt0vUx9DFhujQKEOHKXTEDBUvEtBEy3?=
 =?us-ascii?Q?sJNT5HV7+JtqjSn5ostJbe04CWP8YTtM8xXoQGdR8n+uyuZJV0ApygRGCbq+?=
 =?us-ascii?Q?rRWQjt7PkE5hdOqrkX3/8V7pBbQX5HxUkbuYsLAtjBrNbNXtkl6+PmzIcUd/?=
 =?us-ascii?Q?ydoN35Jt5dHTuviDZEI3or89uwrhBbxNwdLh43dxCp57+3+VcUHn1oaFDaJx?=
 =?us-ascii?Q?yzk6j8et9WiVqc9E6tuUVgXHib5YrVcvJWA9MHUQ8SjTXJ0zoCJAc9TL/LM0?=
 =?us-ascii?Q?RBq6TPL3NFXTrqE7W7Pn9/ylp+/bAOLeisa+tmrPgcGFd4QuQXSXZXPPFl4x?=
 =?us-ascii?Q?/LzCKl+BnfLnv1jfC249kmKQRw184HSIMpgOvInmNR2VNOddu7xGY5a+J8Lm?=
 =?us-ascii?Q?wH51GN5aeYJZLWYIIJwYdUjCXLrh9GtR7CNfDnOhxa1hTKX3hWLSCdn0Dyf3?=
 =?us-ascii?Q?yv08X9c/TyyjYGoLD7V7ALxX1M7t0riNxrOjFqO7DB7MWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HeAtR+J5arj+DSaq4Rj3lagRXAG11kLYETcXug9JeoGgt7MEXWnlqCr2d7oQ?=
 =?us-ascii?Q?jvyo7d9kFokJZfesLfTKckmUx5HFYuGoWFj0MUOtqaBn3tlvFHyW6kGpe84Q?=
 =?us-ascii?Q?/td9Z7IZHl/bSec3VCWGbL4bltQjRwZDj4gnXUuo8EvVYIDJxNNZcTD2EqDf?=
 =?us-ascii?Q?qneOOgkKF9XW5IepBI/ur/RwhJCivfZ7CRUXFotXIP/LE/KqQ8fDpENe/Rhx?=
 =?us-ascii?Q?DFH8/wH8pk+rTenRszXu19fhvhWQu9ucIQ7YfzbNJCgvGMvvdMoUktT3Vuy8?=
 =?us-ascii?Q?b8LKY3ZxghbSD+TV5OvAK6JHrq/MHUSUCNbjr8VwbXAtJxqfPL5jpS3IWlh8?=
 =?us-ascii?Q?HV8HvWeNKv5A0NofSuMvYgsJ2o4uH+ySASucuAqjJKx5G9g1i1Lg4MwJ/kDA?=
 =?us-ascii?Q?UfrpkJbnykvPUUiEkWzXdah7+GrDp4yksoSGVq28+h/iDmjrdYkLldd684rd?=
 =?us-ascii?Q?gC76c9JCpjDeQSdCkhYDJjK4QMr3P33WmCarpVA7jP0opykppIfiEvri3OqA?=
 =?us-ascii?Q?2HMGvOBeT7g+16fid6KTQsy0PjZSSHOpxKRzfxryOj+bvh2Cev67xzE2iCqJ?=
 =?us-ascii?Q?jyIWNkTUkMSYvjGLK59bnZXtAPZyzhnA92GIUksd/lpkROFEPqf+HNHj4xvH?=
 =?us-ascii?Q?iI5ybOD27XcDuWwNwAoiqOgCX+mvdR+apRxj0LtRLfxkUOtmCEjcXDMPtvUX?=
 =?us-ascii?Q?XZEvvPuUlaRROmUz/hblcI8UhxNPzCnUBXQMW5Vps7XWezVn+WqABzRTxaG8?=
 =?us-ascii?Q?iAMSYwqbo7GunOyn5CSHzRzLcGyLkAJFJXILf3aoEofTEYnu9G589byWOxaf?=
 =?us-ascii?Q?LILDTblyjYYzRDgz+ATodCltOZHHyFVpHykINF0x9TissG5iQFvCq8cWS3kD?=
 =?us-ascii?Q?Fq97Fy5uyHHTuMLrVuKpFXjqymZs/tNY8+7Kw1IQacId6OJC++a05+IppFm0?=
 =?us-ascii?Q?bJpFH02SC6tQnbuM6mPUV35m4rxdVaViZDn+M3bVsXTRczDepKzhpu4mO7fp?=
 =?us-ascii?Q?YBr9qLg0ZHF9Giy6LX37+ieDclJNvSk2d8xdTClp1O8KfPZoOp50R6LuWdtW?=
 =?us-ascii?Q?mIdimLB/1Uj7Cf3djR+5uGeM2xcqP/U+0CzVCeKvlVbKibZmj4AttIQKfl4T?=
 =?us-ascii?Q?2LDD67o8yEpEr37N23vUTxphPab4xXBTMIcacYFzqIop1gEJOwD40RQCQNEj?=
 =?us-ascii?Q?dEm2Zo6HVReNubHTz3gBaC26LhGJcK2sdYOBrHigAUo4xmTRBr+tsckjJ6ur?=
 =?us-ascii?Q?8DKHuE5kt4Quw8EDbvxzvbCDGAL1HHvCZecia7yS6+BeALqC8HU0LTasCg6+?=
 =?us-ascii?Q?1lz36zQrSV4yy/9UfC+53C0GTO5j4/sjRxn1FgI2nrNiDHoMkpjIWIuiM9hb?=
 =?us-ascii?Q?4BUhIt5TWP6fAkVIjZqTYk+JhvyPuKlfOXMyt9cKUAyd9NuopJ80yUtvy9PJ?=
 =?us-ascii?Q?IyOSkAvzCBJbz3ppXhlk6lFaewsF8BQJTM9CWSWVzC8S2zVl0RssP9YUxdAW?=
 =?us-ascii?Q?vFr156UCFigeMHjTfST6+TIn4hvdfdpuK8lZ3E5GYlGrrKc0nmQSnoBEQDNx?=
 =?us-ascii?Q?vns3bYgY4QaM6ita/To2FP3zT46eU8jOd4wUz1b/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LWqX6ioeujHKES5Y01h6aTGz1ppeC7vCcc/lI5AMx2qGMSGax6pbnPap8ALRk9l8fBaQdQqhwvI0ewqChA58Eap1ur7U+D8x6a6/jg5YeoS1bwD3cUmlSiy81zqSPHXiH5xl1xOVH6HBvqGykhyPDoR2XiPUqG8wKZKROdbS8y/UYzxjj7Rg4sHfInMQxjzuwSX4mvRAuuGbg664eliQnyMcpAyQ8+nx5r9CjMsIKwD+JSyrntRokTQHl6aJ21k37ivIlYMy0JE+bkPnm0L8Pac5ixEm1kycPv83JJGyeiTZy3xiQKycQsVtSLCvNG8H6bsYj+ylFvLWj6+64ADa6LpceVvMWQzZR0wbplNCY8PwX9Oo4UD284CWOmYRqEkCx7DYM4j69MpOy8hBE7L5vrpEtwvqqHALu86mRrdp5qQLTS5E5HVYpGctiFk0Z3OTxQSuj6qN+4orYphxj8PaZA5VTWZKXzuBN0LM9mgO0PFTskfLj7nkNHEpm/kjD4mI5xoEvUUE84z2KKeLzrfVrq5cEyPW6IxNEz1y++w/uoReZmpWZYmwTNLk//vBm0GyMIOj2sKWJUxvvk5oSZg2OH+VwG8LSfjEUaTvqiziRSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327669e9-2f17-45da-4333-08dd34f47846
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 23:37:55.3551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVZmwjDljvyOVBqY8C0IaSSoBdE/uU77RyU3WJlhsYQ84jl+nm0KHkN4CzcvXOPcCuHCHR1NClrKlODrMoqpqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6477
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_08,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140178
X-Proofpoint-GUID: BuPTbMbkl9qpVck5MMKMHND5y08AyAat
X-Proofpoint-ORIG-GUID: BuPTbMbkl9qpVck5MMKMHND5y08AyAat

From: Eugene Loh <eugene.loh@oracle.com>

The pid providers allow users to specify a probe function "-",
meaning that the probe name gives an absolute offset.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/pid.h                |   3 +-
 libdtrace/dt_pid.c                  |  79 +++++++++++++------
 libdtrace/dt_prov_uprobe.c          |  38 ++++++---
 test/unittest/pid/tst.dash.r        |   1 +
 test/unittest/pid/tst.dash.sh       | 118 ++++++++++++++++++++++++++++
 test/unittest/usdt/tst.pidprobes.sh |  21 ++++-
 6 files changed, 223 insertions(+), 37 deletions(-)
 create mode 100644 test/unittest/pid/tst.dash.r
 create mode 100755 test/unittest/pid/tst.dash.sh

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index c53e60047..12934500a 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
  */
 
 /*
@@ -22,6 +22,7 @@ typedef enum pid_probetype {
 	DTPPT_ENTRY,
 	DTPPT_RETURN,
 	DTPPT_OFFSETS,
+	DTPPT_ABSOFFSETS,
 	DTPPT_USDT,
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 11b964561..76608f690 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2010, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -155,7 +155,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	uint_t nmatches = 0;
 	ulong_t sz;
 	int glob, rc = 0;
-	int isdash = strcmp("-", func) == 0;
 	pid_t pid;
 
 	/*
@@ -183,7 +182,46 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	psp->pps_nameoff = 0;
 	psp->pps_off = symp->st_value - pp->dpp_vaddr;
 
-	if (!isdash && gmatch("return", pp->dpp_name)) {
+	/*
+	 * The special function "-" means the probe name is an absolute
+	 * virtual address.
+	 */
+	if (strcmp("-", func) == 0) {
+		char *end;
+		GElf_Sym sym;
+
+		off = strtoull(pp->dpp_name, &end, 16);
+		if (*end != '\0') {
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+					  "'%s' is an invalid probe name",
+					  pp->dpp_name);
+			goto out;
+		}
+
+		psp->pps_nameoff = off;
+
+		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
+			if (psp->pps_fun != func && psp->pps_fun != NULL)
+				free(psp->pps_fun);
+			goto out;
+		}
+
+		psp->pps_prb = (char*)pp->dpp_name;
+		psp->pps_off = off - pp->dpp_vaddr;
+
+		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ABSOFFSETS) < 0)
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
+			    "failed to create probes at '%s+0x%llx': %s",
+			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
+		else
+			pp->dpp_nmatches++;
+		free(psp->pps_fun);
+		goto out;
+	}
+
+	if (gmatch("return", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -195,7 +233,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		nmatches++;
 	}
 
-	if (!isdash && gmatch("entry", pp->dpp_name)) {
+	if (gmatch("entry", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -240,7 +278,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		}
 
 		nmatches++;
-	} else if (glob && !isdash) {
+	} else if (glob) {
 #if defined(__amd64)
 		/*
 		 * We need to step through the instructions to find their
@@ -449,31 +487,25 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	else
 		pp->dpp_obj++;
 
+	/*
+	 * If it is the special function "-", cut to dt_pid_per_sym() now.
+	 */
+	if (strcmp("-", pp->dpp_func) == 0)
+		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
+
 	/*
 	 * If pp->dpp_func contains any globbing meta-characters, we need
 	 * to iterate over the symbol table and compare each function name
 	 * against the pattern.
 	 */
 	if (!strisglob(pp->dpp_func)) {
-		/*
-		 * If we fail to lookup the symbol, try interpreting the
-		 * function as the special "-" function that indicates that the
-		 * probe name should be interpreted as a absolute virtual
-		 * address. If that fails and we were matching a specific
-		 * function in a specific module, report the error, otherwise
-		 * just fail silently in the hopes that some other object will
-		 * contain the desired symbol.
+		/* If we are matching a specific function in a specific module,
+		 * report the error, otherwise just fail silently in the hopes
+		 * that some other object will contain the desired symbol.
 		 */
 		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
 					pp->dpp_func, &sym, NULL) != 0) {
-			if (strcmp("-", pp->dpp_func) == 0) {
-				sym.st_name = 0;
-				sym.st_info =
-				    GELF_ST_INFO(STB_LOCAL, STT_FUNC);
-				sym.st_other = 0;
-				sym.st_value = 0;
-				sym.st_size = Pelf64(pp->dpp_pr) ? -1ULL : -1U;
-			} else if (!strisglob(pp->dpp_mod)) {
+			if (!strisglob(pp->dpp_mod)) {
 				return dt_pid_error(
 					dtp, pcb, dpr, D_PROC_FUNC,
 					"failed to lookup '%s' in module '%s'",
@@ -647,9 +679,10 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	if (strcmp(pp.dpp_func, "-") == 0) {
 		const prmap_t *aout, *pmp;
 
-		if (pdp->mod[0] == '\0') {
-			pp.dpp_mod = pdp->mod;
+		if (strcmp(pp.dpp_mod, "*") == 0) {
+			/* Tolerate two glob cases:  "" and "*". */
 			pdp->mod = "a.out";
+			pp.dpp_mod = pdp->mod;
 		} else if (strisglob(pp.dpp_mod) ||
 		    (aout = dt_Pname_to_map(dtp, pid, "a.out")) == NULL ||
 		    (pmp = dt_Pname_to_map(dtp, pid, pp.dpp_mod)) == NULL ||
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 11d595898..e96479963 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
@@ -55,7 +55,8 @@ static const char	prvname[] = "uprobe";
 typedef struct dt_uprobe {
 	dev_t		dev;
 	ino_t		inum;
-	char		*fn;
+	char		*fn;		   /* object full file name */
+	char		*func;		   /* function */
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
@@ -128,6 +129,7 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->func);
 	dt_free(dtp, upp->args);
 	dt_free(dtp, upp->argvbuf);
 	dt_free(dtp, upp);
@@ -333,9 +335,13 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	 */
 
 	/* We know what function we're in.  It must match the probe description (unless "-"). */
-	if (strcmp(pdp->fun, "-") != 0 &&
-	    !dt_gmatch(uprp->desc->fun, pdp->fun))
-		return 1;
+	if (strcmp(pdp->fun, "-") != 0) {
+		dt_uprobe_t	*upp = uprp->prv_data;
+
+		assert(upp->func);  // never a return probe
+		if (!dt_gmatch(upp->func, pdp->fun))
+			return 1;
+	}
 
 	return 0;
 }
@@ -623,11 +629,11 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	 *
 	 * The probe description for non-return probes is:
 	 *
-	 *	uprobe:<dev>_<inode>:<func>:<offset>
+	 *	uprobe:<dev>_<inode>::<offset>
 	 *
 	 * The probe description for return probes is:
 	 *
-	 *	uprobe:<dev>_<inode>:<func>:return
+	 *	uprobe:<dev>_<inode>::return
 	 */
 	snprintf(mod, sizeof(mod), "%lx_%lx", psp->pps_dev, psp->pps_inum);
 
@@ -638,6 +644,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	case DTPPT_ENTRY:
 	case DTPPT_OFFSETS:
+	case DTPPT_ABSOFFSETS:
 	case DTPPT_USDT:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
 		break;
@@ -649,7 +656,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prvname;
 	pd.mod = mod;
-	pd.fun = psp->pps_fun;
+	pd.fun = "";
 	pd.prb = prb;
 
 	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
@@ -672,6 +679,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		upp->inum = psp->pps_inum;
 		upp->off = psp->pps_off;
 		upp->fn = strdup(psp->pps_fn);
+		upp->func = NULL;
 		upp->tp = dt_tp_alloc(dtp);
 		if (upp->tp == NULL)
 			goto fail;
@@ -692,6 +700,17 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		goto fail;
 	}
 
+	/*
+	 * The underlying probe should have the same function for all
+	 * overlying probes unless it's a return probe.
+	 */
+	if (psp->pps_type != DTPPT_RETURN) {
+		if (upp->func == NULL)
+			upp->func = strdup(psp->pps_fun);
+		else
+			assert(strcmp(upp->func, psp->pps_fun) == 0);
+	}
+
 	if (populate_args(dtp, psp, upp) < 0)
 		goto fail;
 
@@ -735,7 +754,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prv;
 	pd.mod = psp->pps_mod;
-	pd.fun = psp->pps_fun;
+	pd.fun = (psp->pps_type == DTPPT_ABSOFFSETS) ? "-" : psp->pps_fun;
 	pd.prb = prb;
 
 	/* Get (or create) the provider for the PID of the probe. */
@@ -823,6 +842,7 @@ static int provide_pid_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 		strcpy(prb, "return");
 		break;
 	case DTPPT_OFFSETS:
+	case DTPPT_ABSOFFSETS:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_nameoff);
 		break;
 	default:
diff --git a/test/unittest/pid/tst.dash.r b/test/unittest/pid/tst.dash.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/pid/tst.dash.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
new file mode 100755
index 000000000..375a64536
--- /dev/null
+++ b/test/unittest/pid/tst.dash.sh
@@ -0,0 +1,118 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+DIRNAME=$tmpdir/pid-dash.$$.$RANDOM
+mkdir $DIRNAME
+cd $DIRNAME
+
+# Make trigger program.
+
+cat << EOF > main.c
+int foo0(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int foo1(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int foo2(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int main(int c, char **v) {
+    int i = 0;
+
+    i = foo0(i) ^ i;
+    i = foo1(i) ^ i;
+    i = foo2(i) ^ i;
+
+    return i;
+}
+EOF
+
+gcc main.c
+if [ $? -ne 0 ]; then
+	echo ERROR compile
+	exit 1
+fi
+
+# Loop over functions in the program.
+
+for func in foo0 foo1 foo2 main; do
+	# For each function, get the absolute and relative
+	# (to the function) address of some instruction in
+	# the function.
+	read ABS REL <<< `objdump -d a.out | awk '
+	  # Look for the function.
+	  /^[0-9a-f]* <'$func'>:$/ {
+
+	  # Get the first instruction and note the base address of the function.
+	  getline; sub(":", ""); base = strtonum("0x"$1);
+
+	  # Get the next instruction.
+	  getline;
+
+	  # Get the next instruction.  Note its PC.
+	  getline; sub(":", ""); pc = strtonum("0x"$1);
+
+	  # Print the address, both absolute and relative.
+	  printf("%x %x\n", pc, pc - base);
+	  exit(0);
+	  }'`
+
+	# Write the expected output to the compare file.
+	echo got $ABS $func:$REL >> dtrace.exp
+	echo got $ABS "-":$ABS   >> dtrace.exp
+
+	# Write the actual dtrace output to the output file.
+	# Specify the pid probe with both relative and absolute
+	# forms.
+	for probe in $func:$REL "-:$ABS"; do
+		$dtrace -c ./a.out -o dtrace.out -qn '
+		    pid$target:a.out:'$probe'
+		    { printf("got %x %s:%s", uregs[R_PC], probefunc,
+							  probename); }'
+		if [ $? -ne 0 ]; then
+			echo ERROR: dtrace
+			cat dtrace.out
+			exit 1
+		fi
+	done
+done
+
+# Check results.
+
+if ! diff -q dtrace.exp dtrace.out; then
+	echo ERROR: 
+	echo "==== expected"
+	cat dtrace.exp
+	echo "==== actual"
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+exit 0
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 54444d49b..0c75d7967 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -121,7 +121,13 @@ fi
 pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
 pc0=`echo $pcs | awk '{print $1}'`
 
-# Run dtrace.
+# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
+
+for pc in $pcs; do
+	printf 'p*d$target::-:%x,\n' $pc >> pidprobes.d
+done
+
+# Construct D script:  add a glob for all pid and USDT pyramid probes in foo.
 
 cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
@@ -130,6 +136,8 @@ p*d$target::foo:
 }
 EOF
 
+# Construct D script:  add a glob for all USDT pyramid probes, dumping args.
+
 if [[ -n $usdt ]]; then
 	echo 'pyramid$target::foo: {' >> pidprobes.d
 
@@ -141,9 +149,12 @@ if [[ -n $usdt ]]; then
 	echo '}' >> pidprobes.d
 fi
 
+# Run dtrace.
+
 $dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
 if [ $? -ne 0 ]; then
 	echo "failed to run dtrace" >&2
+	cat pidprobes.d
 	cat main.out2
 	cat dtrace.out
 	exit 1
@@ -286,14 +297,16 @@ fi
 # - a blank line
 # - pid entry
 # - pid return
-# - pid offset
+# - pid offset (relative -- that is, pid$pid:main:foo:$reloff)
+# - pid offset (absolute -- that is, pid$pid:main:-:$absoff)
 # - two USDT probes (ignore is-enabled probes)
 
 echo > dtrace.out.expected
-printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
+printf "$pid pid$pid:main:foo:entry %x\n" $pc0   >> dtrace.out.expected
 echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
 for pc in $pcs; do
 	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
+	printf "$pid pid$pid:main:-:%x %x\n"      $pc          $pc >> dtrace.out.expected
 done
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
-- 
2.43.5

