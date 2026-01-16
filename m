Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546FD3A0E99
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768589740; cv=fail; b=ULJ1eDtq8KLUR/npk4tpCSgo8IYXtiBmYVOqNZEgf34YgVRHR8jeYwJISti/7G2tHbR4ysmIoxcRR1OoTmT0NTr/z39W53uo7DiFrw1lHXqn0gpb9bRl0MMq7jNuuu+FFG0jkb0/jVcRJdHeUQTgFG2e6X7BUUD8YrEUVaLq/Nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768589740; c=relaxed/simple;
	bh=Pm3qHJn1reBG4cvo9RY0prxaimCswMm6U8aisNv7e1g=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PGqev+DmP1t89If5KRmSUDS64721wWSgxCitGUPC4d6Hr8hknsmxTzrf3xxW/m4FASiaHGr568y+0Jji4UIylSO8QTdNlWAarOsqwhyklfYT3kWOE/Jio28Sa68MfkCT5gIqI3juTCBVRWqhEAJU1Z+GrFyPncq7gfMCr28Mlb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cdJqIGa8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VFL3T4kU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cdJqIGa8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VFL3T4kU"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GEFmoP1737550
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DGPXz8u/o/tQ9M3wg7PyyXxclJIjnCJQyeb7TLGPgE8=; b=
	cdJqIGa8eaCc6pYWwgHSmdBb79/dG26v1TKvNuwQZWr01gtkFTg2l0V3XzoMIrZq
	8mYD8ZFJ+VY3XVi9zv7TrjmgwBNyG32fi0872gvohsc1Ec6vEUkvSCmsuY3+CWcu
	ILYaRwuWFAwD94NyU8LqrnIk+tGVFfSEKzlMwjG1ID72IDpWmprmseDArdOyWXpC
	XEpHq/1MeJ2F/riUZ1C4C0PD+H2QZyrAvERCyWUQx8InPvajqueeUFdni/U3ywS4
	gN+/LHQotKUZPPKYBJzzjWbiGUdtuYC8lnUkErYdmYzG6jx5jhkaulJINo5OMRff
	7I713Q1EpUUkNG7FZ7fCAA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntbafqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GIIdNS029103
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:35 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7q1e52-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 18:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZufhVJ/LtEjMh2im3TkzgCujw5lfgRa06jkU9nylruLT7PRpwviq4LG69uxEnUtbe9beBZuoVaxPK2GTKJaI8JQMUYYMwRQMwdx2Brlge6hi2MvE7yrttFiLxHzqqNzwliQ1OXiBYA/tLVwRAeMTUjUkZ0XPIcqLsQxt6HecYfyHR+Cu1Yqh/kagWC1izv9HeFtU5O6eWWa0i/A9RELozElxBzK9GaDtNJ+BHwS61R1O0CpTYcQIJWX6X89HTqAWzxr2b6NO41jT8lx38nouDeDfgnrIAuqvDx7wNPAIlO4OI6Q7GxnUGGZ+d6ktfnomWCzVWR+HV6C+S0/DVaIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGPXz8u/o/tQ9M3wg7PyyXxclJIjnCJQyeb7TLGPgE8=;
 b=fwo74h2G4S9My5LBKRxsRvsCijPTSsWOKfmdoOOZIMJXpeso1ezxmSES+dccf/R8gg3i7tobUKTIezqryuc0vDB+YFin94vAEht2rFaRyhjbtpSuESbD5l3BArh0Q71Nq0WtCQ413O5bNsnPPAgcO0hYO6K2RvWmKpaxpGYwxPf4W1MAy3UysvTM3ngS0z8JgZU351zA6TB7lJF3rki4asyQq1joac/Lsg0cisphYbLkmfHDbTPBZRlHQ7ZmAxLgq69DiuBm18QDX5+mWk7yn82MNh3vv/hxO8JkgRhbY6i+6LldwrSqil4cKkGsXohV2SyTLNsSe3hY7wN6nQqfsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGPXz8u/o/tQ9M3wg7PyyXxclJIjnCJQyeb7TLGPgE8=;
 b=VFL3T4kUcfImUffa+n19U3kZiZX3lWUy6gjJVTuCBG/zwPH3uWbHJVWJaXJmrn2bc2BkiXfZube23wnuVHvH4wYEECJHolxMvYh55+fDXdGluBqS0uvVtb2O0kI7FEsonW5Xb7Ng2wU8haEj5yFrGFX/nyRFZU33ZvUGNZ+rPug=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6911.namprd10.prod.outlook.com (2603:10b6:8:101::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 18:55:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 18:55:31 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Use asprintf() to allocate strings
Date: Fri, 16 Jan 2026 13:55:29 -0500
Message-Id: <20260116185529.19682-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0060.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdb83a9-98c0-4503-99af-08de5530d2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DyhdAbXx0w+qJNkYchR51G++HStp8y4UaTn8S31EzvfBmisy2FWqVwW/3jtK?=
 =?us-ascii?Q?BpSCjxamhMVlgZ7TsamvNMp4rnXO3bwCadUlEi5IQ3ls6yJK5bADDdvtGqCb?=
 =?us-ascii?Q?FZxEIYnedVFEANYg1jjXMUfAdCt9o1d5N87J6rAeBoo6zpNOAKvPGPEN/gR6?=
 =?us-ascii?Q?aZxUWP+VZuJMCvqmhrLpU6xRbAzM8lGcNRakzRhCuBkelq0by/mmGZjgNBJH?=
 =?us-ascii?Q?y7dRXoWvTZEDx0+kIZKhUPaBso7Wm8uSObTJQeJp5T45jlIncGI6cdHOIEic?=
 =?us-ascii?Q?vXPHXaV8b9e0dmLnJoXJfL/VxKPDOxrIiNG8EeoNzHctiXdlz6yyRlzwPR/d?=
 =?us-ascii?Q?jbTS+JdOguK/+gbIqziMpwJBlHWAXponSezNNwzhUHV8qp5zw4hYIW+hG9Bc?=
 =?us-ascii?Q?fRjP2crJkJpmBQZL+ojbzZ6dXULFFjtwiVTYp6IycHNdxpw5w7HNW6SXVOFf?=
 =?us-ascii?Q?FmsooAN5g+z2am10I/P5aAa/2yMk1NstSH3a1OWe1dAFrGKWWOhHREQo3XiS?=
 =?us-ascii?Q?Mqy4izO95cpbEbbTmVd6sePWbUIObu+0QLh2lgla9hRpsLrv4M9Uugb//ulA?=
 =?us-ascii?Q?CGJiYhRLgv9rF8Xvs1jB0D1cguPm39Phuvs9eMn/sT5iXUpyStkuAMPWWunj?=
 =?us-ascii?Q?w2TZ163VVPcD7oOBCABMfZGEHpjwOw7nWLaqHqOJ9nPl+a2m+ZKr1ek1MXyC?=
 =?us-ascii?Q?scPfIkdBysyzg1fPikLeYkf1ECKtR9EsJZo0Yaog5TAYP2w1d/EbTep64Le2?=
 =?us-ascii?Q?Q65qD1PzCClUjVlUH7IGjHOPX3kv8sXaPvnc0SLUhR0fOoPI2tz/jiGmV3JJ?=
 =?us-ascii?Q?wRm/UgkKD+zgAIec7ZXTrRfo/EEE7K6orpwkxa/rnk0abOFUNptFsokRZuBL?=
 =?us-ascii?Q?efeBtBwzpr6Zi2Aqq3v95oLu5wMddJg9Mcj6cBWMgOWi+5k7aeGhFu5kW549?=
 =?us-ascii?Q?NFU4MzbnYPhPKHjTsE68fVZCHuOuEPSBlMAQtRcYIIwaSBoZ7BZizLwutkXk?=
 =?us-ascii?Q?jh/Cwei9OPkj3mUfWSzBrd8pEEW91NPWjrBYdbrY8niyeH5uO1O9ZtlDDsGl?=
 =?us-ascii?Q?pLSoq6RRl2Rfe4DgC16+nVRubOh81PfgNiaav5DSygbVFVN4BxEtq8TcbHUT?=
 =?us-ascii?Q?HHLfoA+Yfey6LNKpuURkmPIBoIz2a3YmsanR+TKX46nI5zICtYaWsVMA6mJa?=
 =?us-ascii?Q?ZpMtsZ+FNQunJ71akga48HLlwYWfMHAnI51LFv+ZHc5wJkOnhl/KZW5iWQ2I?=
 =?us-ascii?Q?9QGa9h3opQnfgOfXrNoJw42D/LTsL6kKHm4ak23EBl9Sw/Pm/yUq33hyYw2X?=
 =?us-ascii?Q?O7nKYXKA57+nghHpVTkbis+Sev3rHgkfpHbnp9myfifB4nFNWoo31MNry+EI?=
 =?us-ascii?Q?Aqtbo9/oqTM8+CpEylq5rEdw6pNNpad+6a9AXlwiP9oWd3L1UD1Ud19hF860?=
 =?us-ascii?Q?Jtrhpoky0zMu1DPsN7LUkjUyU6qnsR/T+h7nZRu7FS27K3vDNmdBvHxHe7+8?=
 =?us-ascii?Q?I4S9rYhXA8i09HK/cau5i8NUUlzY8wychHTpajVrorei9nPCtwSMO+Qtg2Ep?=
 =?us-ascii?Q?pmFEHlUPdlAvepnIz3kEg90vka5397Fo5/B1G4vf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jNqx0efaI2fY/aGzlgz3kxH1MXaMl5P64h/lAfkVn44Q2GPtcNsxmP8PgiMM?=
 =?us-ascii?Q?pwwPUU/l3+aHsUdJsPkYUhfsUvclSwMEmWdZUAVGBorEOtlTijk2bASmk6Uw?=
 =?us-ascii?Q?eYCFhoLZJUfNWXbL8feYinN83M4dgu8CRQ0Splhd/f8riHr5MvPtY5Di6i6c?=
 =?us-ascii?Q?/pxvCUv+X02Tu10PByb/zZifczMh6XzqZhRj4GzuNDmCDwru6Q+P1EiLvxY1?=
 =?us-ascii?Q?HWH+ctS4VsJID6UJ1oRD/AFYES0KiplM/7mLVwemerkxwEsertYg80HkqZS6?=
 =?us-ascii?Q?UZcIisj2IKuAGki8Yx2aNNqJfVeOb3/oZTu4sYcyuPg4aUYs7aMdg1HNVQFA?=
 =?us-ascii?Q?Av+fuAKnmXI4s1oElP8CSJNtdv/lwafHoftWsBVi+dlLF6aSZYk/olk/YM6i?=
 =?us-ascii?Q?W43aLdCCABEpNGDTcmcEG2rOKE5eLQ43FkwF8VaJn9QdzunDtE96GjFkljWP?=
 =?us-ascii?Q?MYOq2GJryzNKwgcfp4tQRRSxLSlJLabIwxk1M31nic4wGLZIXD7kHT+xkDb3?=
 =?us-ascii?Q?H9elfXMEQyQLjv3ugDoEVKbwvkNNYDQdrhN8Klpn0aI1axPJtIWfbqIl8c5P?=
 =?us-ascii?Q?p46lmep0Sl67tnVqh1fCksuuZ5QH5TZ9M5ISGikQT24Iw1DWVMMD4feBrHnJ?=
 =?us-ascii?Q?1ato5d0dF6diMtSrbVoRLTrOW4wqL9F+XB/a8Ola/daUqhjHwng3NMP93bs6?=
 =?us-ascii?Q?uRvzJrqJOk20oCbUZzngBSfqVgVINsBSVy62BJ8VGjYYGUlDGLZnQQXLxSI6?=
 =?us-ascii?Q?zKrWbnn57nW7GNfWUs2B163lLL4UG9N6T+oJjOfEMdc7V8y8IrjDjjEIrV9K?=
 =?us-ascii?Q?LiZx+erD6wvCjwpjvqp7mBECG+PeIjUKEx1pW1ClHJEJE3oH2/FRwZjb+ZD+?=
 =?us-ascii?Q?FK9NtyZA+M3C3b/mdNW8B4EAJFeeDIAAXf+TU+c1PEjnEMtEOENZLH/s4DWN?=
 =?us-ascii?Q?k6gzw+JLxXoQtc1U8SmOXQVtH0aoDoYqm6DEs4dVp/9GpusLHYJhvRgmtaUn?=
 =?us-ascii?Q?QajoVtpMsooi5ntH976/+9jWiJkqN+HNbFGExms4vBMNHLvQUeDeYQkh5rbG?=
 =?us-ascii?Q?WaLBN8TzNv5Hl/+sQcNabhavSVOOTJjCnfS9ukKwtufGaP5KWqXvZwR0Yf1+?=
 =?us-ascii?Q?evbtw8Q6RQgqOl2ZNZnc1umGvJ47qW8WnNPI9+fPlbWzI3FUrZuk3Tw0y9fG?=
 =?us-ascii?Q?lhu9IWYx82dFgcPLBSaODFCaNfhLjm8/QytnrKFnq0L6bDxBcZBjnr9OO/0l?=
 =?us-ascii?Q?kS4SSWOC+vvd/gxKa9np9Me1tEHUsmGxZlOvYW/bh5uRdvOsHPPs+4dNst9S?=
 =?us-ascii?Q?k9oMzHjxqsduDlVGPpH3jb/G6GWqSna9o4FLlBfZJxKu2D9DwgdoB6HY541w?=
 =?us-ascii?Q?r6VZWjhuhSZw6ekg6Awv96Hlm7K+PXTpOXHKx19uH376ejDANMeGkRk33XNH?=
 =?us-ascii?Q?wdiAb5AdmHQgwFzleMc/fXm06SX3zcZ7vxE0j046cbcBMdydIB83I8IEKdK7?=
 =?us-ascii?Q?XmuwzvJc/eWWw2GzHm5RpHy4ttAOnEkiy45F8WnPnox2n06dutmsKVutznR8?=
 =?us-ascii?Q?SD0uIOOEM0tFl99ZsQs8ukOR93l6QcViNL8aGCdLFo7Hhe71uFDhHOjHKpr/?=
 =?us-ascii?Q?Dxu+A6DHGlOJh0PL3H42CzUPOMOlkcF0u2A+cdS+9eZ+xpT+tNQ5BG2dZyAh?=
 =?us-ascii?Q?s27Oz7xygIK9pFNAJXhjcPcpygh5oZY9ZkQINpyW4stVVD+Qimwg58Ri0tcZ?=
 =?us-ascii?Q?F6AlCTf9cQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rzj5Q94t4vKcxuwCpPWpTf+DP8va+BnSTPlcsMIITZrqKHS6a1X/I38gCAPUvMZ56he+kURRFWTqr8LuhX4+GbMiczmvSrI5pH8l7UkkAO2rE+h4uRkGiEjwiPUOJFB9zYb79sV2bMxKzZizzWRdyOsw+vYdsGtBiwsZnDCZvc+J2RhNYCB6+Y71YRF7C0n8QRCj5Q36DfgN+sVj4kMDzWMImPRWj+rixmAT1Mf1YYlkemwFpnbq24R/E9ETZ/V4E+REd553sYPpONaeub02TbT4i1/mkXUborwiJ6TZIXVwOIAkpmE4bs/sZAw6In0QuxymPU3YAegfcmwkhsS7Kt5DcMJqFJ6i/y1gLlElnAmpcUhVfMuRdmN0eejIgyRIxZ1vt060a9lqNtrv+HN1OUqWBIY/1aEi5YGDz6eZhD5ghKG3+YpRnz0Y+oe01UEAlCdNnmfhvuE8P3VCqjZumDN0Zd8BPoTpDy6ZGf1Uj+3Aa5ovfUMGViJdlo3hHacW/rMbtAljgCAdIpVfDAUwuQRl2daR8ueSifmW1IV+9IKmlaG3Rm2OgwxG2yDCyoQPgPDa9EMcT/hqjigO46C5etQA7mRrLntn2w3VCuyVeIY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdb83a9-98c0-4503-99af-08de5530d2d0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 18:55:31.9162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbayDeHYg/BJe4FleziTA3ObiLGz9l9J6prhJJe4qRdPi/0b67wVikvPt6zZRCqaojHzb2XAcukhYfHj4XopKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601160140
X-Proofpoint-GUID: HbJj_HANoXLpa34adges1Ffwi8Zg5i_f
X-Proofpoint-ORIG-GUID: HbJj_HANoXLpa34adges1Ffwi8Zg5i_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0MCBTYWx0ZWRfXxG7c5BhVWV96
 A8T/vYxq9zrRhQap2Ju3+UdM5Ukwgu4YKOsG2ftneqxbXPRPtHh3Hp/ZFMTYwqghkX3n/3WkMkg
 Pvh5GEhDNbySXzwMMcXuYWXxJbar84LMxRdD/MSIT2Rmz53kkKOTRLumq2ymSaFX12YeIcta/VK
 rhsEC2LkGDjUh1/Y7/gz/eUfxddkHM9REvI81Gy+WZnMsBp/AqPLEbMOrvHUlQfAt8FkuBfcXEf
 74ztjnQ0mrSEtWkUZHDujL6dAuyCeH6H6YpIFhUjXAI22058wOgoaj+wmYJ0NoD2HLaIuvv9fPv
 dnQiAe+zWHHjDogF/UAROtm8ocgLox2lzJvhgsI+dJh6xxDvCYX6NAzNcIeoYDkBvIhEVcrchfq
 J7cjHh2f+iTMCKo6ZCZ3GMuW5Fv+VV/QrSciDMdfP8ptXKGYAE/6uUB6KAfYCAAdMzhtRJkUI/Z
 VHZFg7yOz1fE62HZP6FRQuWQ8yjKhHXfpYP0dOeM=
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=696a89a8 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=lwT4594mb_7TTWvNfykA:9 cc=ntf awl=host:12109

From: Eugene Loh <eugene.loh@oracle.com>

Earlier patches have slowly replaced constructs like:
    int len;
    len = snprintf(NULL, 0, format, args) + 1;
    buf = malloc(len);
    snprintf(buf, len, format, args);
with the more compact:
    asprintf(&buf, format, args);

Replace the remaining instances of the bulkier construct.

Note that dt_conf_init() continues to compute a buffer length and
allocate a buffer, since that buffer will be reused multiple times.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_link.c        | 17 +++++++----------
 libdtrace/dt_probe.c       | 11 +++--------
 libdtrace/dt_prov_dtrace.c | 12 +++---------
 3 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index c9e0ea5fe..ffa16d9a4 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -416,7 +416,6 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 	char drti[PATH_MAX], symvers[PATH_MAX];
 	int fd, i, cur;
 	char *cmd;
-	size_t len;
 	int ret = 0, status = 0;
 
 	/*
@@ -426,6 +425,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 	 */
 	if (pgp == NULL) {
 		const char *fmt = "%s -o %s -r";
+		size_t len;
 
 		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, file) + 1;
 
@@ -521,15 +521,12 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
 		}
 		snprintf(symvers, sizeof (symvers), "%s/drti/drti-vers", libdir->dir_path);
 
-		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, emu, file,
-			       symvers, fd, drti) + 1;
+		asprintf(&cmd, fmt, dtp->dt_ld_path, emu, file, symvers, fd,
+			 drti);
+		status = system(cmd);
+		free(cmd);
 
-		cmd = alloca(len);
-
-		(void) snprintf(cmd, len, fmt, dtp->dt_ld_path, emu, file,
-				symvers, fd, drti);
-
-		if ((status = system(cmd)) == -1) {
+		if (status == -1) {
 			ret = dt_link_error(dtp, NULL, -1,
 			    "failed to run %s: %s", dtp->dt_ld_path,
 			    strerror(errno));
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 65316f515..86353893f 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2026, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -475,15 +475,9 @@ dt_probe_tag(dt_probe_t *prp, uint_t argn, dt_node_t *dnp)
 {
 	dtrace_hdl_t *dtp = prp->prov->pv_hdl;
 	dtrace_typeinfo_t dtt;
-	size_t len;
 	char *tag;
 
-	len = snprintf(NULL, 0, "__dtrace_%s___%s_arg%u",
-	    prp->prov->desc.dtvd_name, prp->pr_name, argn);
-
-	tag = alloca(len + 1);
-
-	snprintf(tag, len + 1, "__dtrace_%s___%s_arg%u",
+	asprintf(&tag, "__dtrace_%s___%s_arg%u",
 	    prp->prov->desc.dtvd_name, prp->pr_name, argn);
 
 	if (dtrace_lookup_by_type(dtp, DTRACE_OBJ_DDEFS, tag, &dtt) != 0) {
@@ -498,6 +492,7 @@ dt_probe_tag(dt_probe_t *prp, uint_t argn, dt_node_t *dnp)
 			    tag, ctf_errmsg(ctf_errno(dtt.dtt_ctfp)));
 		}
 	}
+	free(tag);
 
 	memset(dnp, 0, sizeof(dt_node_t));
 	dnp->dn_kind = DT_NODE_TYPE;
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 102afd84e..d417a864b 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -232,7 +232,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		char	*spec;
 		char	*fn;
 		FILE	*f;
-		size_t	len;
 		int	fd, rc = -1;
 
 		/* get a uprobe specification for this probe */
@@ -252,16 +251,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			return -ENOENT;
 
 		/* open format file */
-		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
-			       EVENTSFS, PROBE_DATA) + 1;
-		fn = dt_alloc(dtp, len);
-		if (fn == NULL)
+		if (asprintf(&fn, "%s" PROBE_FMT "/format", EVENTSFS,
+			     PROBE_DATA) < 0)
 			return -ENOENT;
-
-		snprintf(fn, len, "%s" PROBE_FMT "/format",
-			 EVENTSFS, PROBE_DATA);
 		f = fopen(fn, "r");
-		dt_free(dtp, fn);
+		free(fn);
 		if (f == NULL)
 			return -ENOENT;
 
-- 
2.47.3

