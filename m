Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367D2874F2
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 21:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787861; cv=fail; b=u6Gdv1yw10IfZoPr18euUT5uxTHoho8NjyTJGawzjwuECXU/0n/JaaR9AjKtMEluIEY+t1Nv/exviGQnm3KYHoqQsghWkJp3h0ESZf/IbjW/ZwUq1wyzuEUC+4bGUUHMdsdj8FOLtL//KvH80dnIUyclculTb09cCMQv/k1sOTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787861; c=relaxed/simple;
	bh=rexWTZsSJQjYKb4AnXMrIyYIdmLEa30hUp8ovUZcvRo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bntpWdUrgeTXsMFRGQN2tdyUCfoXjOUKPr0wyisWyzUiZLPZ3pOw37zID8wL8CXsXGVV2eg7is7CPSv6+WLxO3ktax1R+gr34II9BhEd/mwogm0xSLLFYAOrmtc/fBCUIfaHXiiRdS2+lIoMh2kOKeEaH/SR2PBeTZSsBWyBL7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jEHck5fo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Wc/ar2Gz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jEHck5fo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Wc/ar2Gz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596LdQ44021207
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=tPYyVmdB6Ni6YKRHv1bq8lMQYfJkmi+AMgBggcBos9g=; b=
	jEHck5fonDTFcQxBmYcfh3bbdLWC56rOrWAhjg2unreZrrZiURmEjVIWFMHJfijb
	PbyIQldfljk7H2F2M5bX34Eo8kckp0UIHoJ11+6VH7Nbv9nZJWzqHcbshbikLFyj
	ifrMRHOb6/pGwjkBFtmps2UPIUMOJQZO2GeXHedx7LYYP1Wc4OytlPR4qPdYicDi
	0iN5kTfnijweZZlV/pZOapuo1hB95aci+SQ07uxvTTV7IZ1oGRTRMCpEbFeiy70D
	cGrM0lr7p0J5b1AwVVqgFA42CJinArFWQu6pLvO0jyE1E1NhRag85frVryPlMj+B
	fqheGpr4aLvWBBQaED3ulw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mnvcg0sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596Km5Rx004247
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:38 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012050.outbound.protection.outlook.com [40.107.200.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17n0uk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nucx2LDXEW9f4qiIf8kZeiQDGnhnGCHcRa9cOKwL2lZT5/T0CnkccqFXszcYo1COiSPkqm3C0Jz/2nB1jJZRC3qG5mF+DUHeBh0VI/619mdvnHpl0T5oWBSptokrUrWsWLCLu/PxJUPd2g32iI3Z2SsK3tGD99cUVyBykM3qZ97bc6fp8dkoGoot56CL5yd5lazrJVR034tXk1ACrLsg/BLK3xjDgQ1KjDqCMBBTPR5I4X3gSU/NsWTVfGiFfXfdK0dMR2B5n4xV+nBWly1cSctYrzCC8dRQfZXIFil4gP0/hC2VYEm7PCQm9BcGWUlPWTbNViJ3lNeheu62XY1fRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPYyVmdB6Ni6YKRHv1bq8lMQYfJkmi+AMgBggcBos9g=;
 b=tavRNLomCBeA4culvKEUF9tm2KPEpvhb9O2661JG5jR6CDOdN1RBQKOCLGsJZW0tN+hJPcN0k7KbCf9OSgqfkOUNCNM1pWT4ZnbNRRq+t0GybTRb+LFqq4qIHm038My74v4MhSUKxbYFORROk++4MZLLU+loc7tA9mhGZjy3aZ8/voTVIEBt7Oe3aifEwkvac2p0UCBPZUw/+5vK2k1vGmIUmlg90FhfcOHSWgwqu0ddBeTHB0rbGiJKOTajzji8vrsiYvvSpXTcHOxQSzdZ9MYm5ADRMUdxm4RmBU8njkRP9RkKTOlRleVhDjaVeTLKekBspkB7tbI+cDs3oUb3iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPYyVmdB6Ni6YKRHv1bq8lMQYfJkmi+AMgBggcBos9g=;
 b=Wc/ar2GztNRdO7vo3xjBxfmy5Uy3aZIaB05kWt+SDAEQdrltQiUpAkSmnVb7tfH/RQOZV5EIFWiWLMkofM2C8VTm920JZXYzQ6G55jwgbHQ0CbhAaKuwIgVjbJPCzC8q8XoEE4v7Mj0fYvDlSeOiyHXAWouldF5vhVOBk2u3xl8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB7997.namprd10.prod.outlook.com (2603:10b6:208:500::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:57:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:57:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] test: Turn char[16] into string to ignore garbage bytes
Date: Mon,  6 Oct 2025 17:57:23 -0400
Message-Id: <20251006215726.8893-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0186.namprd03.prod.outlook.com
 (2603:10b6:408:f9::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 15df77ae-f8bf-42ba-d405-08de05235829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6ZNvb2qdkfHnv3yTnBKOS81poeWTXJUqn0L+iaBhELSjbTRU0zKPzVBmcdys?=
 =?us-ascii?Q?adu8w7FQQ/I2VU4+9nNlswm/uu3iOt7b/UqPouVWXK68x7Uiwic+lAFGzlOT?=
 =?us-ascii?Q?44mIHAJuqPI8q9OsVujqd1YOu2poNGEWem4Rb7M0xlEu0w/BD9Nv3DP/LRu3?=
 =?us-ascii?Q?SdbXsyhjnJnCA9bzwjpwaRela1YB2tGIiIgInLA70knpUtbW8w4ttsxo3+T6?=
 =?us-ascii?Q?7QlwVk/4lsXf/y17jv4MuPlKnoYgkIe4qC1ondRrrnDmgN3PaNUrr9ymfyvC?=
 =?us-ascii?Q?SiZIVzJoHygQqE72KHX+r3yerKf1FCX8MzxEJiKhyGsQ7x4jzZ9XKDL/kFju?=
 =?us-ascii?Q?yyhVPE7WZ891EkAv2rWbnx33hVm59mTjrLmcxXNyKWLUWoX605OwGUQ3pxDj?=
 =?us-ascii?Q?TIzOTv4dGBIVO8YS0VrFg9Js0FCh/URX6q+C70b3RO3ngQSL4MOsrK95GITV?=
 =?us-ascii?Q?4iEloWGZvsOgc0VPBrBFlYXgbVagGMs8gLd00MFIzaHZ9Cm2iXEAIGGPIUWg?=
 =?us-ascii?Q?gucTvROAwSS0TJiRLu1/VWCbAOJZk9z7rtXiP05xFOD5hr75Y8TXWVXIR1jQ?=
 =?us-ascii?Q?s0uS/VFZHoo2/IJSKOWeoExI741/oAnEi0n0INsfqI9KxR7h6kX2mhxYgBpm?=
 =?us-ascii?Q?INN7v/TZ+8UDS31ym8cMsjdAJbBOrHBzPC6inbLPiDlm+EdvnPIch0OAu1Xo?=
 =?us-ascii?Q?/xFTBb0GRAUj0h7PFw9hLOVyp+BUe52Ay1dbAGVRymuoLLURiEZOI+AW8vpX?=
 =?us-ascii?Q?CtRR9BDPAPXQJ49cPeJtadf0ufv1XEjiJsm95Qp2NlCmQCqQtL1HxQVntQtc?=
 =?us-ascii?Q?MxsI1PUu4C4Ub6UzDP/8N7I+JOMyn4T8tD1c+9JmL3gy9wKRTUlq1E3H5O1v?=
 =?us-ascii?Q?uxgiRHKgL3xDtpfgGiOFUfL4f7nVzXilM6A2SiUas+s5EbJK1bYffPhXxpfC?=
 =?us-ascii?Q?n1U7daPXYgPoak6b7QcxYje0Ms9PeYT+jeaONhRhBNlwyVWYyeM8lFJG524e?=
 =?us-ascii?Q?kimFPmnC2D+HKj+KeYa4urYNG6ix6PjDWPES5Qk6l5Ak1nUlVUL/jwDJk+mg?=
 =?us-ascii?Q?2h9+d7Sg6gPpQtsArjI5DJ00Xku/EQ0qIETu1hqfJIXYkfekSqVZaaDml/d5?=
 =?us-ascii?Q?k6vWEKd4WKCuz2cxjJSbBR0ZxAXxr4ZkEa6IbQU3gdZhovfDDbrv++4IrUaR?=
 =?us-ascii?Q?vV5WQEYAQKm3kgmisAxGN1dHtwbkBpCS+oxV5J/ga/rvYEK7SfTDMGz8g2Em?=
 =?us-ascii?Q?CfdaTIgJtMpLri4FvmvLbRMqde/cik8H+88x6fEARSkKjSAoQo2gKa1RcyGl?=
 =?us-ascii?Q?+VPn3w65LEx4KbTrB147PILgyLduGgaVwR21NgyGjjJSNlsR862dOC1C9xZT?=
 =?us-ascii?Q?QX1VCFLsgjsW7Km0OMNpyRJ2qyZ8kUsDMVjKzc8GPjHuUXkHxgvz0IzunULS?=
 =?us-ascii?Q?Fa72W96Qpoo+a2E1XHW0nVIdIfPlBmFu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mnHhn61T8lAqvSP+fg6QcrEKBgkotNINAKhGR+2yXc1K5al5aYVCuUe95d45?=
 =?us-ascii?Q?NEGsWldBcPAi5WKK9fSS/Y/gvPi6l+tdufH/Zm02t1dmAiOQOrgySmY4E6Mk?=
 =?us-ascii?Q?M5QiSZah5LzKyaGtmSBD06Yg56Nhxs3YOPBK5jcph6DxEbocoqIPTV48ysNM?=
 =?us-ascii?Q?lAssBDcOMraWKpUL1usYvgB01W8sz8NHkIAcs8gE7lfVvcoac3j8Ul29UamI?=
 =?us-ascii?Q?7ubelsReIDqQ5ABFGYYjEGl72FmEFrrEg7QIFPEU+gPyfwvaUWY2HFp4YVtL?=
 =?us-ascii?Q?Q+CI7DlKGdg26uTRbhKDgzD1zcHNYgjzvjxdOt2v52wky3tXnjE6P9qTQcB/?=
 =?us-ascii?Q?vTAqirwxHmgl3RzAaeNgcKC/LFhq5m0hL/lLTxYXpOEl4GWXF31a7rOS5xvr?=
 =?us-ascii?Q?T2po60iAl2zphOmB/qKKfaWgKvyiemE/r5Odz8ZLz6ikjrv4/+jiZf6xB2um?=
 =?us-ascii?Q?cr3xaD2wxgZrJ0yD7CTvd1sDt6mjQ25aW2ebKNpHslj/6SK/HYVTSTZzLxCj?=
 =?us-ascii?Q?JUoG6NK0eJE0I3U9uzxgm6ILkxkTQr5YUnghXlB2vtje2CVJ6jWxqbcJRt5I?=
 =?us-ascii?Q?4LjCIIpYVlA05ka1LTew4BKuvlLWLNf2wRQbvsCfwLZWmKv6B1z4sfBQIOn5?=
 =?us-ascii?Q?qkQSHckRIV8x3Qck+tT2r/xIjmc12VArCtE9T4XWfLmR04CRI6Jo9Ai0MG+q?=
 =?us-ascii?Q?qZJKWFPO/Dp6L5DzGgiuZ3ruVhXXYCSHb2GzpsbmU4rjOjzGjxbRXyHpq16E?=
 =?us-ascii?Q?kN+nvIbpxs15yx8dUNH4c8KGPMnw04sRrSw2A+USM8UrIStMaoGMjfi3aaEK?=
 =?us-ascii?Q?1v33GNAtQ/05SfD9194xFcW1q2c8ZdmKmdp5kRb8Qg5BtmvbfIKkql16ZEHb?=
 =?us-ascii?Q?PTV7YaTQIOxYx7FLbsuDZnfcIIRZS/yNWhSH4+D+yMvPXlp0oegDwXnMZEvq?=
 =?us-ascii?Q?EsWei/kh7QBMG4GNZjnaxe0XSYTVo5zBCThic7th5L4FIharAOznKRoign1c?=
 =?us-ascii?Q?8czv2uRu4fxFHqQHny0Ck234xro1ikRViRBZjSSITXuC+KQsx6LpwI6WBkRe?=
 =?us-ascii?Q?aCINHQk1Pb3L+YVPZ3Wu39VHeJLOWEM5ALtYNvdpG5lF0Q7b00N4QufzyaMk?=
 =?us-ascii?Q?qZjl93HPTVCkDFMZZOYyHdlKF3SuYhz/XP/vDgsY47xUDanFl/4CMPuHo6Bw?=
 =?us-ascii?Q?pQoPYNAhM7mS7LcpKyLOy+hdZSETojuCqPjpkKkjCbff1Z2N+RbVrepTkXvh?=
 =?us-ascii?Q?TaplmaTVavfuVhqTUoDlVjzPyMsk3gqYZEc4MEstlDK2uDElBpvGhiI1oN5u?=
 =?us-ascii?Q?3qz+eGDvKcWFVdo24RQ2CpufXBm9jOirBU6bl+itY1s60dWgvRIeRISAujHF?=
 =?us-ascii?Q?LgV4IAGnNMG1j20HQxzs6kDnJs2q9bkV+Mx+SQLnGcyqi5iRl8qf2qU1unYR?=
 =?us-ascii?Q?GulSAit70W4Q3jfudtzK7Klh79ZlmhoeltTrPFIBlEzXJnPNAVnvC5XWVqKX?=
 =?us-ascii?Q?VoWmvCtEgJ50X50FnrQTW6T3An9aExTDK0W/LHuKYSB5ubnAc0iEmudoLOUh?=
 =?us-ascii?Q?E8ZHVvMY5c2g6G2WjsTgR7UuzN6X/E5eqSsMD/fp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uL9MCpUq3+jBGU4p7MrUYVcJCHsNN5deDFecB5g4eA/AqlwLRrCPHjwI072l4N3FX/WVmD6ePRIuP4kXuPfnS7Y0a8+a7hXk2UHa5G9GCRxpaaCX23felQytADjsa5WzMTWVJRGdtiPOIhhzYDLiy/7g4JRq8Ej2pk7Cvxh3sNimQwQAYYfb7B4BCdBu1HWuPoGYfEAznDVW6Pel+7s5rRCS7rNY9LiLs2JI8e/0+J1crNRed5duyYM2OUzwEgTl2BBDoxS1i5Nxgdf/CJ3yggM9dy/B1epASX/44hrZ9qVoTjy8iQGgImBN+0X5/fnrfJmZBqPMRM6dGzpFLdLwIl+DB0aEYd1t/l6rHWIDLbBK/NUggm5OglJZ0jxW1bZxhuPlzTMYlfpphL9vUk92qmO2bcmENn6vmR1t8vyLxH9D9YVQISDDLC0F9xVShofyyNrOakazTUIBXUhUmFKvnLSeb3E3ZVhuHICADq20dEm/f+9bcGNt4DPojD1Jk4tvEINP/T9K4xtj1N4bABz2BbaqmZfFp3dg2zDzkmM6ZoHHNmnWLuLym4ZlR52urFW7/eACErzgmkkXPPwLXfCoSkS4CxS9TTeFeO5Dp8vNl54=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15df77ae-f8bf-42ba-d405-08de05235829
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:57:29.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85epb+cHbTslnvgK7NOLwl5HisVkHp+XUpu/XO+5lR4ckqLcr5TwDPnyz17URs9zlEMTPl6qfRp5+b/NX8DJAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510060172
X-Proofpoint-ORIG-GUID: PiBzSVdy-4McWDe8KnFJ-hUGW27HgmPD
X-Proofpoint-GUID: PiBzSVdy-4McWDe8KnFJ-hUGW27HgmPD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE3MCBTYWx0ZWRfXwpcG7ryQmEes
 pRgzhaCOyimEXmbZc9K1QKbS5AYs06jvv39/FS5Cj4U4IYbuhwmy+u6SYhc2MZlgP7gs2apMNgW
 mFDY1CjX/jrpIZYsFzdyVB4Fl/wDG+TWqq/q7icFOOpAkhv8GViylRvb2TXa5PZ5HMIHTmVar67
 Mlmcb4za92cnRdqQ5Nq6r2gEZP9QUSv2m3Y3UqysjyoMhmEdoUiC0sJKFaVOJs00ibgwFG0ZEk3
 djCXgunlsy7s57OEYhJzatnKSYMcVtDXRnOkWEHu2z2LIaFeM5ROtxRonO/ZWu1eetgLTFasPd7
 ug1FIYek5Exr6cfOrN08lOG2Z1gOcpVFxCoXmkWud6PwTuVFXDIbMEESxmU56qXP1S3JE3IPpic
 4xE+65lCHI2ekd03yZYr8iSqgoF8nw==
X-Authority-Analysis: v=2.4 cv=OpBCCi/t c=1 sm=1 tr=0 ts=68e43b52 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=oqhSq30TT0QPwnKidzEA:9

From: Eugene Loh <eugene.loh@oracle.com>

In commit 308e996c0 ("cg, agg: fix alignment of key components"), a new
test test/unittest/aggs/tst.chararray-key.d used a char[16] as an agg key.
The problem is that the char array, curpsinfo->pr_fname, could have
garbage bytes after the first NUL byte, polluting test output.

Since we do not care about any such garbage bytes, convert to a string.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/aggs/tst.chararray-key.d | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/aggs/tst.chararray-key.d b/test/unittest/aggs/tst.chararray-key.d
index af45d4a5e..2bb638372 100644
--- a/test/unittest/aggs/tst.chararray-key.d
+++ b/test/unittest/aggs/tst.chararray-key.d
@@ -15,7 +15,7 @@
 
 BEGIN
 {
-	@[curpsinfo->pr_fname] = count();
+	@[(string)curpsinfo->pr_fname] = count();
 	exit(0);
 }
 
-- 
2.47.3

