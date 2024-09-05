Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406431482E9
	for <dtrace@lists.linux.dev>; Thu,  5 Sep 2024 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725576059; cv=fail; b=kuvMk0y0Dx1+jucwTOSqpM+RncfTObmF77tAanUAE7ufcZQ5AfAllxhKedXXZj/XLdHbIFU0Qq+YnTyyB6D5Dw0B3TzFp44guvaQRUaeu5qLFz4zZM1K5aiCzg0t+pmgIGKu+z0et+5NPyGx4Lzigx7GDnbeLc8/qdO4nBBOHsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725576059; c=relaxed/simple;
	bh=lVKqzurAOyyycNVm95Nj+p5ZZmGglpg+7zRig1O0V3Y=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=qaDFI0zfF0DEK3LbzkN5bSEUt4lZxWIVvtMGWqZSVYee6f18rN9c9eCss1rI4vZksMNr8mqs1X7MPM6YmI+3IjL10J02j25a8EfglzFL9/nYUTLgvMm9FhhaePj6RxxQ2Q8ZVjwnC1DUE2uOFrC/zAylt8aT9brx6Km0JJBCJak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NglvA0Oq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dc52kibX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NglvA0Oq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dc52kibX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485LVN19014897
	for <dtrace@lists.linux.dev>; Thu, 5 Sep 2024 22:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=b+qEwRbIFy+W7oyQWxa26ol81gPWu/JX27jIW6sEevE=; b=
	NglvA0OqnWGmuyilHloqQQwhTxNQQYEk0CYxhf+6aKd+TWkWD0dojRcibCXLs/BN
	U7hQVLy9l910QPoLnDny4jfValu470NQ+XzMx+l3pAIez7jXxZipcfWLfk/RXdFI
	+/YrrefdmqnHsdNh+nZCMMB5bmgXSO5XeFNuoMZsCVYKWMYhpsm5eIrHpE6jHvD0
	UhPYR2TMcb52oC42hkp1Ncnx5pgZjpBNmObNT0Od6jiHYjZBvxIPGqWKAZ7d3ozb
	KfMmjkLo6mVjJQspn9O3eaW+6aJlOgJ+RL00x4EfhAf6NC2AcT7qADoHEI7532fY
	WJEF0/ZSBG940agyLRRVCw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41fhwk8e1b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Sep 2024 22:40:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 485MXUjB040916
	for <dtrace@lists.linux.dev>; Thu, 5 Sep 2024 22:40:55 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41fhyb8gdg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Sep 2024 22:40:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnasxpZ/Vz20g0aFeaiTZAEWZVmFycH9wfhln02I6X7nOln1DKYUN8UyYyMV8x8mbGhyp9/3pTIhIg3tD74QQdDqXjEuWRSqna4Pdy1CbjbtBspwy7KbTSUgCooxwMlj4GPNxyYwN5BjQ4W8UKnoArG+Eb+98sXZpeo8s02Dw39IVYD16OqxHAW30c5bUeux2DQrlCOVl9L9Q1ns+d7+oNZwb90PFdL6m+8z4LnI4u+a1xuAwTpv0Q0XNHtATbPS+39Oy3sEUuX+1261W3uri+EVF4bxP/cliDZ3kRG4siGGed0AgZ6qr2JFDhcw1K8j5F018dQkC3Cyl3XURsG6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+qEwRbIFy+W7oyQWxa26ol81gPWu/JX27jIW6sEevE=;
 b=LP3C9ByniedO0X7T5X4iUOuRKJ25OZ/IS0QDXWbbtUZsdWh+9EtTepP23ed9lMN7DsATzpDr+Q1qrC1xlutC+EYtohCIGggbkIMJVTIC/k6v3rQ6qqBumS5UwGRlFkk08GvUnKJzQhTBVmMrvk/duPDKG0dGeyl+Bkb8qBU3lo1O7g4xHJYzCAOL8HDMEgpc6jkBg0B1EqIO/qo5F352j2s8ZrrC55TXw5Mmp6ruE4ewKH/rvCzEV1EYPphbIOF/ABRr5XCOpU5iC2mfobRcrkH9yxEfP7ZtoT3Jv1h6ud4mkLuAR+mOxuODOt/d9kiCjtHwmhVMctqUUyM1JAWQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+qEwRbIFy+W7oyQWxa26ol81gPWu/JX27jIW6sEevE=;
 b=Dc52kibXVBkjcFckzykd+iFR9WcuryUvRe89Oc8JmGV6mDQHk1yQqMbbOYHeEWQiaqoQWUEC3ZTj8z6SWKonzSsTTaLDShqzSclQARK6Z8QnCsme8qiN7hqtyTZJRuC22l/hdBGtPKTZggnXf3H1hUGnQ8vNmFUfXm9qcs6AmR4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7151.namprd10.prod.outlook.com (2603:10b6:8:dd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 22:40:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7939.010; Thu, 5 Sep 2024
 22:40:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 01/22] test: Handle dtrace:::ERROR arg3 specially
Date: Thu,  5 Sep 2024 18:40:41 -0400
Message-Id: <20240905224041.10299-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0162.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 05168cd8-44e4-4389-3a4d-08dccdfbc86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rTlXOZkr/j3fDkS4PauoHE57qwbObiMP4bWEGTnpZ3EO+xTnvtaGBdKL37U1?=
 =?us-ascii?Q?NN1SjbkHHSuvoUPAaHPGTfDylKhWsqPsY6NMOg77h84YBXtNevkSBSvar0T1?=
 =?us-ascii?Q?wnc30VaFDIPMpOnFGBPYKCou4Kq4q09XFWnk96/8FwRvy+7+yZKXd/cQ0Jeg?=
 =?us-ascii?Q?mbXkXJQ/EjG0xpF6bZnNMtqR/Rw62PvTxX7fiYSuVUv0NB82gxsuLjZCw/1S?=
 =?us-ascii?Q?mBqAy5ZFGcr55bultbXUaWxoCZNfQ9ia4uI36TBwUNYlLJGsOmhRjprFhjwe?=
 =?us-ascii?Q?9bHnEhQpLtCYcXmoEQ5UAnumsA+wd7w4gnZ9fJou9gVfqtCmeFse2braaoGC?=
 =?us-ascii?Q?rrx/ZxOZTOTWKGtpB6jA8El2DJ524JQ87UgyG4BJyZCEJ6VTT97wU4BCQsEg?=
 =?us-ascii?Q?g7O8D/NSZVbQ7nq0lFMuA/QJs5nos2AYkSgpTc8oKNmvZ3lA7zMHpwf4V4Sw?=
 =?us-ascii?Q?O9k8QZkF6U9V8QapgJpMq/7Mz3QrocY2mqB9/egMupB6MgJxF9L/KzJdBozt?=
 =?us-ascii?Q?Us95q0a9ZmGQWhyuEyVOCrU9aJ6VtunWWjuMUNBvnJCXS9s19B1nwksZVN1q?=
 =?us-ascii?Q?YS1tiAMnXqGmIRpXWpa4/0nC2lavFmEOU4zin8doDTIs74dGlAsF3PC9OG4t?=
 =?us-ascii?Q?sw1e7JIFAtOP9n/cU5PKkH7jvCFDjxy6j16C6K/+4u2HMNmq0Yfz7EtK1euh?=
 =?us-ascii?Q?/OaryY/J7LcJRFIHTDeyEb4m95VYvsl0tLXvk6pjBCcUveXGhHdx2B/UF/wH?=
 =?us-ascii?Q?E0MHbJlGv/ftSjRgG13INHsH+RDXW9sPoZIL6PcsyEcHpZBzgeUgqiy/lgGx?=
 =?us-ascii?Q?676yoNNqsHBpfNJCtkXb+liZT4dldW6ER3aIdvnSiDhy93UM+sRGE9+j8wQC?=
 =?us-ascii?Q?+3XIsyu4kg7SzsndywAWQzEWjxPzSiUHwPIem4cYOVBhxQlt4dmoWT4VgY81?=
 =?us-ascii?Q?eY3BP52R2c/xYQhwSzcKyP1vjXnIuawz0C7lwXkp7BZYVSrA4Ldkkl59u3OT?=
 =?us-ascii?Q?KsNjT/bA6n8yPnpv1kJMXj2s5810NCjmFNCEEOvWgROVcEyXImJvM5B10YCW?=
 =?us-ascii?Q?tvN7J0YtlAdoPgCYqS1p9mZlFZpiSDeb9qE7PTPEHlTzDoKienqe4SJ/yuZj?=
 =?us-ascii?Q?P8Kmp45Rqf/rxkmZ9aIk4/tSjWGb2oiRRHG2oMl9Gd5AoNRh+WG23tVA+LP0?=
 =?us-ascii?Q?V+V2affINT3TtGp/cG9kDBO2bANoBFr2c4R2H3H10DsiIiFf2fgxcGBGbATR?=
 =?us-ascii?Q?T9rVZKMfLTfdp9N72tRFSKDJzxOzj4IYr1Mr15ObLOSFJsFuFpRvPJrFNnto?=
 =?us-ascii?Q?C9BhnoGl4mOmhEqu3q7sYyrzbT7DdgcEza9V9W8E45fTBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c4tdohO/ydeygj2rP/YuyMDh+uyVh+IeRkzliCuGhEZbxfRun+xg/gdCOPoD?=
 =?us-ascii?Q?RRTwk2IAX9LqYpqdi4g/tDk7HCyV36mCmInZMZWkOiseiTRNgSoDiODyFTPm?=
 =?us-ascii?Q?2iWbUesFJtUSW8Dr3+Eg09ObGlPO4f5n2ou/+cfIslaH/E9fS26QLd45tUf9?=
 =?us-ascii?Q?ZLoV/X2HNpeGdA19im2f+DwL+01qBIxTDp1cOfRxU/+7nnF+t1R2MO7owTVq?=
 =?us-ascii?Q?EMhzVzzpl0lvEJk+CJ6PLEntDsFfQ2t4/42HRHOvSTZxSSX8QYdxin09jDJW?=
 =?us-ascii?Q?qYgmekLYhGKXln5Maz+reGNWBugmN55rTrliTkXeI3eq9s8wRhDSmiYJO6UZ?=
 =?us-ascii?Q?kg7jIDrnHJJBNxXETjmtEC0ab6toS0bGZ/UPSZbE3cpiJDC5kmB5ezcEUt88?=
 =?us-ascii?Q?mwCTqDSa8JEuOTesHgxSN/BQOb/OVvZm6CHEhzkJ12NUNpO6l63MbDHIoV+/?=
 =?us-ascii?Q?5mmWMck8DUAnvex4IpcNBnmBlyF4UY5g1RAORrqmANO3AOo3HhenUUOqclVV?=
 =?us-ascii?Q?rw5JTznhZzLJUBQ6sQ3q5ZRRGy3MOgTB+H26PR4dwpQtiX4EjdnMy777GPqp?=
 =?us-ascii?Q?byjfcoWEDR6gGIsKgMI7vTAMynz6imPfBAPGgrI8RoBDSQSA0DQYv9OytGx6?=
 =?us-ascii?Q?Yqc7IhQdsXF2D5UgXKLsDVgx1wurK1fh2O5HAaf+/8PY78xXrccWvdyoxL2G?=
 =?us-ascii?Q?cvfb8DCrfY5dTG3KCmmtlDjTvrff+ddJ0gHnGfhnWk2DwkIlp3sn/a+npGjf?=
 =?us-ascii?Q?uLkKqvWs1wmyKjejUXNdNDyTG7svAs4rSN9pg/sopBiWDZ9KQeAYpCI1K4be?=
 =?us-ascii?Q?14jFMm/oNkB/x7xu+gBxnW25CzzdbyNbJoIwsS2brpevGJL6+cZmwFcEtIUq?=
 =?us-ascii?Q?CDiPMhOiR42Olz4+QMYwtL2QxLa/cW/qTydpDDGV6b4XJcS/35UTODtzWSDT?=
 =?us-ascii?Q?h6yvJIR0bw2XaiKioi3jrG3to57ajxgkFwd7hTRUX+mcpbGOHwf9Sdx8zLa3?=
 =?us-ascii?Q?orlGmeKMtTtdiFX64b+R0TKSPYNYT033pREeLB0GMMRAvY0TjOWM1R7vfAux?=
 =?us-ascii?Q?HNKZnRfjNEJIbdhx/hS1VPDyJpnXHD5eSMvSSd7yJtaz5PEwqqMpaKVBXfvY?=
 =?us-ascii?Q?7uDPLMOoxuDqxDla7AgHCAlxF2opXau9BIGESnSkGCcaXZc0r8moiuhhDPM4?=
 =?us-ascii?Q?d/QMmKlcLRt97rCaT4HmOHYk6j1KheClWvmpCqFSUsgUhZ7JaOC22hNTc1lb?=
 =?us-ascii?Q?gpL3BZYMMmWbCeMPQRVz6TbpvkxWuiABh/LZ3xypmF1Fx0GDCgGnAxQxA+np?=
 =?us-ascii?Q?jMK16hc1e+4id59h69t72NADsE9tRMlzkl2zgnFzU9BEYlyB5pdjii7Zq0HH?=
 =?us-ascii?Q?34Ds8KZ3KmWeB2BvjCgl4z8vKcTMg29XNvdpRvtRAZ3AWxZe7MuqBxfrKoEJ?=
 =?us-ascii?Q?Cs9Tm9tm2VCThvl2yRbckPICkEkwLrYcJOBiOrb3GWG4Ks68cyi2bkWutzpM?=
 =?us-ascii?Q?P0PPruQ7WYfPEPSXjZ1TzV+nY0lj49KtOHZfIWgoR2vE5NBO+psjfiSd4bOb?=
 =?us-ascii?Q?U21r6x8T0KkbDd022ioV4qXp8ZGZI/crgTrxnpc1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iNWCA4c5r2igpVoAweqWv3UuPasx8Q5L5aAHZIlmuvbZB2E+1Xh1lm+Fqv42qoaEmBxyGOFrSxlJfKkOlKvvkSSC8mA0+WxGyyKkYfhctph0nKhwF16ymRKKgi0HZMowLoBcJ28WK99/pYyGqQZR+ouo7Cay7ookrDokp5dKvZvqeIDiECubxtp0U80ZmbpYe9oHVGX6SJiYvb+Aq693puN/z1y6B/JTup3Iwg/9UKeJ2UwzF+iJRnoasHqVagXNXd5pi8koPWmj65WuEyzKMoq8/1ex8Qg8ja5+kCo/EACkjS3kD4WddrX47YW1jLLg+LRHELjvUd44tIa/j1JJpdJw6jpN/hnNr2kylr3G2rxbkrqEzukQmiNgCorSgISxH3IFIGXADvGFX9QTnBMOgvI+Tz93js8JqIDI/EiO/MW8oLsBqmTaYpvfWtNkAW6pmjGob8eHgkqL3ZmgheQLIDuUhND6yoJFw7lG2PC5r+iZHyiGArMi+oHaWRRSfNfzQyqM9chgBJ386ooY7bXJt85yFPnkPqudh4B2gzwvQnTqe5Yd5TOyMlbItiiC1aNoE5pmgo16MpcGFG6sE/MAT/jiPF4pIbqg4kZEURqg854=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05168cd8-44e4-4389-3a4d-08dccdfbc86d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 22:40:46.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ha4TD8dnCEQlSsoQPYL/kYCiIbrab4K6X/spZoN6XhifTj2srl/KA2LdKlHBNNThUVGlPsghJ0iBPGE94ha6Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7151
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409050169
X-Proofpoint-GUID: nxEaRBLoZNpiX9lbJL14vPkS9HAJw1i1
X-Proofpoint-ORIG-GUID: nxEaRBLoZNpiX9lbJL14vPkS9HAJw1i1

From: Eugene Loh <eugene.loh@oracle.com>

The ERROR probe's arg3 reports the culprit PC, whose value can vary
with minor implementation changes.  On the one hand, we do not want
tests to be overly sensitive to this value.  On the other hand, we
do want to check the value is correct.

Therefore:

*)  Change tests that dump ERROR's args to omit arg3.

*)  Add new tests that check that ERROR's arg3 is correct.
    One test is more stringent but potentially more sensitive
    to unrelated changes;  the other is more lax, simpler, and
    less sensitive to other variations.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |   6 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |   2 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.d |   8 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.r |   2 +-
 .../variables/bvar/tst.arg3-ERROR-b.r         |   2 +
 .../variables/bvar/tst.arg3-ERROR-b.sh        |  84 +++++++++++
 test/unittest/variables/bvar/tst.arg3-ERROR.r |   1 +
 .../unittest/variables/bvar/tst.arg3-ERROR.sh | 141 ++++++++++++++++++
 8 files changed, 237 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/variables/bvar/tst.arg3-ERROR-b.r
 create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
 create mode 100644 test/unittest/variables/bvar/tst.arg3-ERROR.r
 create mode 100755 test/unittest/variables/bvar/tst.arg3-ERROR.sh

diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index 001903ff..bfc77bf5 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -19,8 +19,8 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n",
+		arg1, arg2, arg4, arg5);
 	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
 	exit(0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index b11f6c99..3e7caac4 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,4 +1,4 @@
-The arguments are 2 2 4 1 64
+The arguments are 2 2 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
index c23f9503..ec519f4f 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
@@ -1,10 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 d_path */
 
 /*
  * ASSERTION:
@@ -18,8 +18,7 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
 	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
 	printf("The value of arg5 should be %u\n", 0x18);
 	exit(0);
@@ -29,4 +28,5 @@ BEGIN
 {
 	d = d_path((struct path *)0x18);
 	trace(d);
+	exit(1);
 }
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
index 8c601a43..be1f6d5b 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
@@ -1,4 +1,4 @@
-The arguments are 2 1 28 1 24
+The arguments are 2 1 PC 1 24
 The value of arg4 should be 1
 The value of arg5 should be 24
 
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR-b.r b/test/unittest/variables/bvar/tst.arg3-ERROR-b.r
new file mode 100644
index 00000000..c05690dd
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR-b.r
@@ -0,0 +1,2 @@
+OK
+success
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
new file mode 100755
index 00000000..fb2518ec
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR-b.sh
@@ -0,0 +1,84 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+##
+# ASSERTION: The ERROR arg3 value reports the correct PC value.
+#
+# SECTION: Variables/Built-in Variables/arg3
+##
+
+dtrace=$1
+
+DIRNAME="$tmpdir/arg3-ERROR-b.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+$dtrace $dt_flags -xdisasm=8 -Sqs /dev/stdin << EOT &> D.out
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* 1st ERROR */
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* 2nd ERROR */
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* 3rd ERROR */
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* 4th ERROR */
+}
+
+BEGIN
+{
+	exit(0);
+}
+EOT
+
+awk '/call dt_probe_error/ {
+	sites[int($1)] = 1;
+	next;
+     }
+
+     /error in dt_clause_/ {
+	if (!($NF in sites)) {
+	    print;
+	    print "  No call to dt_probe_error found at PC " $NF;
+	} else {
+	    ok++;
+	    delete sites[$NF];
+	}
+     }
+
+     END {
+	if (ok != 4) {
+	    print "\nFound " ok " valid calls to dt_probe_error, expected 4";
+	    exit 1;
+	}
+
+	print "OK";
+	exit 0;
+     }' D.out
+
+rc=$?
+
+[ $rc -ne 0 ] && cat D.out
+
+rm -rf $DIRNAME
+
+echo success
+exit $rc
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.r b/test/unittest/variables/bvar/tst.arg3-ERROR.r
new file mode 100644
index 00000000..2e9ba477
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.sh b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
new file mode 100755
index 00000000..4f2c70f3
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR.sh
@@ -0,0 +1,141 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+##
+# ASSERTION: The ERROR arg3 value reports the correct PC value.
+#
+# SECTION: Variables/Built-in Variables/arg3
+##
+
+dtrace=$1
+
+DIRNAME="$tmpdir/arg3-ERROR.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+function dump_files {
+	for x in $*; do
+		echo ==== $x
+		cat $x
+	done
+}
+
+# Run DTrace, also collecting disassembly.
+
+$dtrace $dt_flags -o D.out -xdisasm=8 -S -qn '
+BEGIN { nerrs = 0; }		/* dt_clause_0 */
+BEGIN { y = *((int*)64); }	/* dt_clause_1 */
+BEGIN { y = *((int*)64); }	/* dt_clause_2 */
+BEGIN { y = *((int*)64); }	/* dt_clause_3 */
+BEGIN { y = *((int*)64); }	/* dt_clause_4 */
+BEGIN { exit(0); }		/* dt_clause_5 */
+
+ERROR
+{
+	/* Report the problematic PC and continue execution. */
+	printf("Error %d at %x\n", ++nerrs, arg3);
+}
+' >& disasm.out
+if [ $? -ne 0 ]; then
+	echo DTrace failure
+	dump_files disasm.out
+	exit 1
+fi
+
+# Parse the disassembly output for start PCs for the dt_clause_n.
+
+awk '
+BEGIN { phase = 0 }
+
+# Look for disassembly of dtrace:::BEGIN.
+phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
+phase == 0 { next }
+
+# Look for a blank line, denoting the start of the variable table.
+phase == 1 && NF == 0 { phase = 2; next }
+phase == 1 { next }
+
+# Look for a blank line, denoting the start of the BPF relocations.
+phase == 2 && NF == 0 { phase = 3; next }
+phase == 2 { next }
+
+# Report PC for each "dt_clause_n" (or a blank line to finish).
+phase == 3 && /dt_clause_/ { print $3, $4; next }
+phase == 3 && NF == 0 { exit(0) }
+phase == 3 { next }
+' disasm.out > dt_clause_start_pcs.txt
+if [ $? -ne 0 ]; then
+	echo ERROR: awk
+	dump_files disasm.out dt_clause_start_pcs.txt
+	exit 1
+fi
+
+# Confirm that we found expected clauses 0-5.
+
+for n in 0 1 2 3 4 5; do
+	echo dt_clause_$n >> dt_clause_start_pcs.txt.check
+done
+if ! awk '{print $2}' dt_clause_start_pcs.txt | diff - dt_clause_start_pcs.txt.check; then
+	echo ERROR: did not find all expected dt_clause_n
+	dump_files disasm.out dt_clause_start_pcs.txt
+fi
+
+# Dump the error PCs to a file.
+#
+# BEGIN has 6 clauses (0-5), but 1-4 have the problematic instructions
+# we are looking for: "y = *64".  Each time, we check if the address is
+# 0, calling dt_probe_error() if necessary.  Then we try to dereference
+# the value, again calling dt_probe_error() if necessary.  The second
+# dt_probe_error() is the problematic one.  We look for those calls.
+for n in 1 2 3 4; do
+	# For dt_clause_$n, find the starting PC.
+	pc=`awk '$2 == "dt_clause_'$n'" { print $1 }' dt_clause_start_pcs.txt`
+
+	# Look for the starting PC and then the second dt_probe_error().
+	awk '
+	BEGIN { phase = 0 }
+
+	# Look for disassembly of dtrace:::BEGIN.
+	phase == 0 && /^Disassembly of final program dtrace:::BEGIN:$/ { phase = 1; next }
+	phase == 0 { next }
+
+	# Look for the start PC of dt_clause_n.
+	phase == 1 && ($1 + 0) == '$pc' { phase = 2; next }
+	phase == 1 { next }
+
+	# Look for the first dt_probe_error() call.
+	phase == 2 && /dt_probe_error/ { phase = 3; next }
+	phase == 2 { next }
+
+	# Look for the second dt_probe_error() call, reporting the PC and quitting.
+	phase == 3 && /dt_probe_error/ { print $1 + 0; exit(0) }
+	phase == 3 { next }
+	' disasm.out >> err_pcs.txt
+done
+
+# Do a sanity check on DTrace's error output.
+
+awk '/^dtrace: error on enabled probe ID [0-9]* \(ID 1: dtrace:::BEGIN): invalid address \(0x40) in action #[0-9] at BPF pc [0-9]*$/ { print $NF }' \
+  disasm.out > err_pcs.txt.chk1
+if ! diff -q err_pcs.txt err_pcs.txt.chk1; then
+	echo ERROR: problem with DTrace error output
+	dump_files disasm.out err_pcs.txt err_pcs.txt.chk1
+	exit 1
+fi
+
+# Check the D script output... the arg3 values reported by the dtrace:::ERROR probe.
+
+if ! awk 'NF != 0 { print strtonum("0x"$NF) }' D.out | diff -q - err_pcs.txt; then
+	echo ERROR: D script output looks wrong
+	dump_files D.out err_pcs.txt
+	exit 1
+fi
+
+echo success
+
+exit 0
-- 
2.43.5

