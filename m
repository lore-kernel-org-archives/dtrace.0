Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61DE126C0D
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209590; cv=fail; b=j3iB+kIx4SlEDSuU+/rTGHSdcC8S7NX83/GC3tuf6QE/ZTo1YBPEvqjBR1LxTL25oOQ95BzxPjIP25zIFKgMp4uwEGioBKECn1SkwsbtrhJMI8bD9eoy4X+h/yY1BXNzzLoFXPLlffS9hswWAz8XmUz5oDPGDNV32fRTSEziw48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209590; c=relaxed/simple;
	bh=k5rulUB78LJLng6ExWRgl/QMFYSzBNnoxClnoa+rqFk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LFDuuVzs/P2WvfIzwOrUdjeTUfftP0ho0BzlZCXJw54J670JbwC3lNeVvrhwSzbvufS22mgi6Wy5EnJBjM6ZBhIm9/tDK/dx7lkwzaSPLUkcALXKd8ASVjdSlBuli4nrDc2KQb35u4qr/EJq3DeGAg+wEY6WF1dshpsw1eTwpTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nmBpaq7G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zC83lEao; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nmBpaq7G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zC83lEao"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHMeJK009089
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=EZ4RdA84D1YhO5
	gbtdoygJy8PCPyGkl1wJirOJn+2Cc=; b=nmBpaq7GHocyxuspde4w/bDRuKmjaN
	G0YJuUlcV7dR4Y2xxy4X0RaZ9GWTKvBL+1zMnIv2HPNdXSyTzd34E+218gqF9srn
	C77S/G+X7FzBlJcun4caH/W8u4UaS0SK9Lzfd9ANi2q9+FaPMwgClUlzBOKcfXTo
	nKKJY4GgLWQ1ukF+RTVEAYNG8cYxeYz+OibhOp28xZNbRXMbymoxFIXYCx/OCv5Z
	PNxYYLmrlis0l7/4IOY0DJz4m7OaHZI8N9dap+K2fieosOqjpGaxnXRBqbtiFKD6
	LXo1z/L2zFYmynBukG2s2EzFiEdgK/77PBdI7FpV4yUjLRT7DxhTqQoA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sp6ce4vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIpLiC031285
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:26 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41tkc6bsjk-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=psBj/Yx3aHCIkpwipxS7E9T9qbm4kPUdvxneQ5OubgmOQUuwm+k+bjLyZhYjaf64AHt5QquMDNzMN8vCcNYu6YU92Jq8xN2vM29O6zP9L/3ZpcLRSaZcVbupM+H1h+1VdSQOjNxNwijSvuOvispzoCLMNmd0dxcIsJFoeVec2NKw+LBH2YgMA26miIz3ta8cduTwf0IK4iakUUg9u3X4iQmHc8Z6TiMrR6x7ZE3MsZim4/TND/l87mjj5bDc+079ndNEELcyDPqyl0hRIy6LJSe3afsRneIfdmUNKnB6dcWYnXs4ccW1teNL4VywtDKrwIaH1h3BiV9Yt2qOl0khfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZ4RdA84D1YhO5gbtdoygJy8PCPyGkl1wJirOJn+2Cc=;
 b=rfXjs8tZ++a8zVt8ISvLxc01011ztLYBKBz5Lr8pHc+/KXSXdHglns8ExIcGIzB+XxHuhahmGvDDc7GpxI6l6yLL+wPckpufzScTsQm0b6GApt9tbymjtcDiKuGHggC1DPQQMrrFcuGsE38N+3yJcOVrWUo7piPxb+ulyBTfGSMUZAjDY4SFR3ll6yhBIynZnaU1WfmhNcgHo/84rRnymjfbeMzF+jxwBO0HtnaweZXihE7i8t2KY6Yx7ONfeOXomtDtvfR68vsj2abCaq+FZlDhjaHksWLzs6nI+M7HrC1qmiALZfodtisPseMKWhHWYFXlIOecUfVXYsbdHMFBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZ4RdA84D1YhO5gbtdoygJy8PCPyGkl1wJirOJn+2Cc=;
 b=zC83lEao9cFdizh2PWNZQO64IpLE2OOYauMu775afTyol7YP8ti/BghD+vf0K4/4dwmqSRrx6TImtOWzr0wxZACnKExmSwDOU+8VVtqORFpV4f9gcIw5ApcIbKDDO75L7G3LHhVZJYBqqg1KW7FkeV4dROGNm8U50hvmnnPCjts=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7269.namprd10.prod.outlook.com (2603:10b6:8:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 20:26:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 20:26:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 11/19] Support USDT wildcard provider descriptions
Date: Tue, 24 Sep 2024 16:25:52 -0400
Message-Id: <20240924202554.7011-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240924202554.7011-1-eugene.loh@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: d59b23e3-26b7-4d2c-df1c-08dcdcd7259e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ld4Ys3xJisN5ZvXnOZFDjAJdpcPPdowEtRIqOYSTDlALQKZ/HRXSlsU0ECAV?=
 =?us-ascii?Q?e1ZNuAt3gwXDR1iZ3PLc4XC1ZoH7prLu/X1/SFq9GifHlnxlDsAogeCw0Uhn?=
 =?us-ascii?Q?gqRIEIt46UvoUitv7ZU0ar/thCCc7vi+toeiaGHIGFJgyJbR+TdG0OtHeE6c?=
 =?us-ascii?Q?PKX74TgFIKwXxlpr1+oNqU4QPXFW0hwladL2ZFnI/NYuuLpfZP2O5nH5U+w+?=
 =?us-ascii?Q?wFEu6S/z4h9vspS9jT3Y57czgjHEKW3nvNUX2CNKCAsqJoNV9YgUaSSTf2X+?=
 =?us-ascii?Q?XboHzlT9My2cKyfnw1jLbC/seBibUcKm+64kB2mXg3W3Xye+3GOMcYBk9mF7?=
 =?us-ascii?Q?LjhgPibZff+i3AgYQuxcGdp7LS0/KgdjOt8Lc0l9c3OTF+ateHBMnjCnb6vY?=
 =?us-ascii?Q?iAox0bwRBNO2ITQzp2zwFI0ThlPfRr4MKmnBI1e1z0HXLT5pVYflsVaAPZ5C?=
 =?us-ascii?Q?DGDi0GA6Pvhl2QwO6+Y/XtU0YpXIzxWISRjBfdjwqGAhGMIOpqPbRYQEIao9?=
 =?us-ascii?Q?Ox1lOWGRxvxy1WooAznmkTXZRG16ffWzKHuat7+7NiMApqwB9DAM05WVg57o?=
 =?us-ascii?Q?Pr72sPBKA9V8tGvdt2P7zP8bDtAFp9QyHsO4ceTRw8ZAXrnjrqOjgXeNpwK1?=
 =?us-ascii?Q?bKEx/D+deFo9Js/+iS95zfHQB3qfbvtXRk1FImunK4KzV/QDOM1lIWrTKpy0?=
 =?us-ascii?Q?rm5sUZTZhOGD3P5jTb+PaYjRWbsEhVN91xx87S3FPV3UWyjWxSPAsTxbpW7n?=
 =?us-ascii?Q?sJvHEDfCz+wXy3BIX23S9y7kz3mxbEuIZ09VGcC5oEL3tq1ZQR/PCy0g9jvW?=
 =?us-ascii?Q?819in/C1mv7Qurud76luil78NGGiLUjjTsjThwggWcRuSPGBeJxFWEtRqwMK?=
 =?us-ascii?Q?H4pw29HePEoiR3CY/1RbIuCEo/jc/jubeBeRI11w+uwLVhV0wXgaRXD+mgzI?=
 =?us-ascii?Q?BSm5gwkkagSJggHC8FoDlLEDWtqCGl/Eovd9X1JZOIfIl7l1FOMndJmksLWy?=
 =?us-ascii?Q?S7/sw6fpjUARme0z9rtpMgwnFyhGI8YFvsNkPmqnFf6t9owr2kEdz3PaFTyy?=
 =?us-ascii?Q?CGvPxiL4GjJGL/XAEajSRCkvDJMkTEQgBC+6TfdkysdeAm4pFR1f3dgHGu8+?=
 =?us-ascii?Q?PJEUQyaNgNdoY/y3N7JdVtoHvRBeMgU97u5hL8giDKKHhoLmT6vmjz/bMCt1?=
 =?us-ascii?Q?okl4XelNYXyWmkgIRJgkBmLabWgZVv2eRI0ORK1vsjp7kjBz/3C09IDzoh/0?=
 =?us-ascii?Q?0X9wH8oM59cvYVkEqlQsII9/2SPNDVsuHPOgw4+xEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TWhfDndru2rhoOTB7F7ancu0LkUiNxO5fhlupoNmydjGnkdNPk1MdQ43MdjV?=
 =?us-ascii?Q?tDxIH4rZD748TZeaMNZtK/3JrtPVV/pQPDBd29vhs2PgTCpUyb0r4nMNNMGu?=
 =?us-ascii?Q?L4+mtRRNGDun4BwXrkwcyyy2rMMP2tvjXaAf2Yx7i+qKFEhdjSPe3RfpOilT?=
 =?us-ascii?Q?t7lyImvENuDP2aRUDEw7DH/9Ptexob1R9a6NhXDZOrzQznR/7kVwHDA25T9g?=
 =?us-ascii?Q?XFDUlcuhUnyUuvrobgKze34xyw9XA7PIT9J8Y3xwVFJn89DH/cxZvJS0LJCJ?=
 =?us-ascii?Q?nIQ3aHVVRGazIp7g0urD/fAG99eeCTBspxHp9oR/lEukvXsSBCYcjJxwDIvA?=
 =?us-ascii?Q?okgCcUfnseXm00AC3lyi962d3J4m721d4w5RivW1Fl5Y6wLmJ636fkxvpyj5?=
 =?us-ascii?Q?LqDf/Z/OTX/97fexedLbHx+vbFDQ1wRarNVYGuOMSw1xOCp9Xv8yrNdCqCmu?=
 =?us-ascii?Q?ZQE+MVnr1L5X6ENonvSho4ssqLMY/dTYAYU1cIqrld6yHMvnU6L0Aaekruoj?=
 =?us-ascii?Q?tcnkD1YretBaRR2M0khug61pYUvn3LmjKpqVU4BbV0/qZyF7MPAGYvPDovRZ?=
 =?us-ascii?Q?WOhBVvJ8h3CpU7dxLmaP6ihnqIUTv6kVsbDkWTIEusN8qFZO9H6THWyu6Pvt?=
 =?us-ascii?Q?hXc4rtG6RzKFF9z/kE/mFiMrWsk5l1TU7Po3miUDAtBxHK03kgOzymFl2txG?=
 =?us-ascii?Q?DzEVKF6SN9bJX0X3jzjtD3JJkimD3JSexbY44iCE1RrV64Cd3FI3SfYnw6Ca?=
 =?us-ascii?Q?Azza4s0xQ1jm5vLz60s51xEFETSZ07bv0F0alAhNp3d3vlZz1g/1kkHcj35k?=
 =?us-ascii?Q?x5GRMFu1qej6jQL+4PTLGUB7etzVkuDbALdGbhtFv4iJfpuEwacTcx4ISpzp?=
 =?us-ascii?Q?9KrgaVYFHRYyqquydHYLbcy5HDJp+o/3JrlPE89uqieb6o+qG+104Wz+kp0S?=
 =?us-ascii?Q?IxicaA5MEOmJDKhicd12NgNOyyFNvCVOthp68snYuMZpO8N5J2tb1HXpFhvS?=
 =?us-ascii?Q?nyOlHX4NrlUVCK28oEb5pLFHeiIsfWln9i1E1iIy8TLPTwg7hHFMc+g1D80K?=
 =?us-ascii?Q?yuJMIoqpiHhvt7SOBAiMHajbEWsV24KlBiPXdVCCvFlZlYW1vK9+LhDGQu1u?=
 =?us-ascii?Q?+/Sr6NiexPeIUDvA/COBRcVFKXsElU8ET2kcnsUJZ3JKPIqeUzLYALRvlAgJ?=
 =?us-ascii?Q?IoHO0a8YMtXmG0xhAQQGDaA8fjjPSqgx0kR73eYS7+h/eEAYCem9Rifs3ZbT?=
 =?us-ascii?Q?ZQ/ezeMjI8B9S5jCJX1sbU7giXaBm2HZegOoy8F6ByRl5mJ0UrlBgnOrfRgJ?=
 =?us-ascii?Q?o0a64jN7/nBBbCP8jbx2LiUvtY9bPp8EatE6XWOz1koWNmNBF4NrfmBKW6NV?=
 =?us-ascii?Q?/YSR8IWfOaRecjY4ddDXpfd6M/aLhDau6cWs1Dua6v6veRC5WFCJ4dBMo69p?=
 =?us-ascii?Q?t1lYI+cvjDHLlZTySxpSPH/ALje3svONGQ2940MQu6qkyb1D+3MxCqXH9b7F?=
 =?us-ascii?Q?g6mouE17pzRT1oPl3OkP2ZcISCdOS7pxfccEeOUWGN4cSPz2bJS9vr8TZja8?=
 =?us-ascii?Q?xqAnUEWUmEqmPMWJgSkKcA4Dhy1SoA15hOiXDCvx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QG5sDNgxI32q/WoFkM1WyXPFDyr18xTXTNQAj6SqCpZ+lgDraD5zTZVRB7EACE0AaNhhmsX5GoSV82I1k5Czw8hWfWzElxU3oAaIGk4tK4zIw/cqpK+U8N3yByTRZVUgHDxBTvUAoR8dv46cGsDgHIB4mGsyh8e2FiWOmpWkeVyZCL9sp9Xt7o+D1jr2//1MzKIYEniFCxlahc1JS2BU2oVFlNIIQOLw/JDEJ3glY/HXjfurq5bEjZWOxwCnacROF99IdqYg+PQ7shmKATsaV8xGVgyvLrVJCgS0GoMwORw2JJNIy10KkSbSyXAEXFDM9J7XntL60eE6PG+wJcpZKHLUwqv4hJGBvl7a09qb+uysLLV0eco8/AvsRyaXtkNf7rN6owA0QDSrxZO32GWUXtSCi8kcBJZjx5OvfXyAtCGsrUamj11ClgkNDy1B5R4FZ0I/CfU+QBsRCVpQxa2xHPtFzs8Sh4Wrmk0O/aXH3yJP//D8/p1s7Ax9e7kuGloHYEnRrwrFdlWPt5gg1UhPKBfClUK2fjrCJSWbirkC4qCWqcxa29+m5YcHlTBV7LjCTBvuSxHJ+kfqXFax9eSqP+CYxNkzENdWdPkc7hKrOBc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59b23e3-26b7-4d2c-df1c-08dcdcd7259e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:26:18.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dx4PzXyBRGpVFvdHllLUng/MslVtsVknD1Mf69JFEIx9UC8NgvkY8saE+KizvuF9JjjslULcB18NHYT8tuHhqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409240143
X-Proofpoint-GUID: MrqkpnS6bvdNEScu1tspABCplE1ENnob
X-Proofpoint-ORIG-GUID: MrqkpnS6bvdNEScu1tspABCplE1ENnob

From: Eugene Loh <eugene.loh@oracle.com>

To look for pid probes, whose pid values must be specified explicitly,
we can require that the provider description should end in a digit.

For USDT probes, however, there can be wildcard descriptions.  This
includes a blank provider description as well as a description that
ends in an '*'.

So, in dt_setcontext(), expand the criteria appropriately.  And
modify dt_pid_create_probes() accordingly.

This is rudimentary support.  We still need to:
- handle globs in dt_pid_create_probes_module()
- add process monitoring / inotify

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c                                       | 5 +++--
 test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh     | 1 -
 test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh   | 1 -
 test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh     | 1 -
 test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh | 1 -
 test/unittest/usdt/tst.forker.sh                        | 1 -
 6 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 12104fc21..62482a70f 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -273,8 +273,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	 * On an error, dt_pid_create_probes() will set the error message
 	 * and tag -- we just have to longjmp() out of here.
 	 */
-	if (pdp->prv && pdp->prv[0] &&
-	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
+	if (pdp->prv &&
+	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
+	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
 	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
index bd0552dca..99ae995eb 100755
--- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
index 7b9c6a5fc..5ae087fbf 100755
--- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
index f9b1d8bf8..5c0509d89 100755
--- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
index 644da2ac2..6eae82ed9 100755
--- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
+++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
@@ -5,7 +5,6 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# @@xfail: dtv2
 
 ##
 #
diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
index 7cfa9eb5f..92513eb5d 100755
--- a/test/unittest/usdt/tst.forker.sh
+++ b/test/unittest/usdt/tst.forker.sh
@@ -7,7 +7,6 @@
 #
 #
 # @@timeout: 120
-# @@xfail: dtv2 USDT wildcard
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

