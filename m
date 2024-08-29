Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810AA4A00
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908970; cv=fail; b=nyMGQV08LxWUpGbXMyxKfzB9XaRBJxMqv23496tdBBxb2jdsxsoE4j1J00HPRyT7lj+vuqew1/b+tVDOzbuACikNnnJe+CaIOI+EtGMmRJhm4O4M3T5PU7QFsXb5EBrdFBC6e3EeWU6suAzulUXhA6ctBJTujzm3KK35uWdsDVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908970; c=relaxed/simple;
	bh=y4zaOXwGAngbEChXvdLImsenEKpSE0L/WC0qTWCoFt0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hOfngd78Qj7KWELdeqd6PzB6+8s426sKEeoW8F8t/uKMYULgyf5y320kxbqxI8hC4brIz8KEgmIwITfHCBgBf79ZFO0DbTm0pvJG5PoILCf7GeI/8QFZLLw3yRokohc8S7z49ZT5nRA5sxxrJ0eQStd/HsMaWP2VVmmSKPRUk+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c3QVMkyp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yDByHfZl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c3QVMkyp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yDByHfZl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fWeh030195
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=FPd4bKa7N6wbnA
	7ST82C9IIL5s3baJb3iMP45Ow2oS8=; b=c3QVMkypuIQQxlQ7jMUMOmGljVmcAL
	EHzzXHvQ9eERUOt+N0piZUFrSJ7M+x1PotddXSbf6s1qOa1qyjQCOZlXuyf2cpCu
	sThFACI+lwiLIAWJzTwF1sGRZuVoFcstsLwm1Isw3YfNzlVzpkAGHVkjCa7Pzy00
	sCFzH2FdT+5eSNxyeOAgTYzyE/RGDVrTH+McotlW96/Xl9O0Gay75LM/ux5sLcSg
	Mexi32i4kf0rfsE57F9IbFAAUKSh3f/z1Y2kb0aSCGNHfs+i1bd77T25Gs9AJvg/
	JPipuKDFDG2SRMkf0uTk/CUOtFx/mkOlEGitQ2HZQv2WRMfgH+aRrNFg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pup3bj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3wMTO036950
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:47 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jmrpdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MECcrmtrbPhmZaXFRIcbz77YlFJtMBIYjbRTN0vATrsF8ybjFbJsOos8V/bAvqzoa2V+zygUpuE6s8qpMl2c7KBgOu7JV0mqT48E7TzHA+kGy6AXDV7lV0E/AB9mEKszL0jSW4Bgs9ZVdFRv9HU0oVFWxUX61vaW4NHvE/LZQ1tFBkOh2Faf00njfp8usNqzsOi1jYS6X1YXKfrgKgDsShUUPgVZVlmfthgsMSYYkUcoxOoDWyIdXguianFdkW3PSW6S/+saGf3auDPnlL81lGNSbBZSVeArJdQ6oz30FxwuwCQMoAvlnPV8VmL5N8HDYYAVbkTp2U/zHJq2eKEgrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPd4bKa7N6wbnA7ST82C9IIL5s3baJb3iMP45Ow2oS8=;
 b=j+w9ne0N9KihB2PTDfPNpln0JfqK9YToqN4GDlASwU0g4mWuKPgRkYJ0WTIOO3iAA9S/1WU2Xyw0K5nS0Q1vgsSEPvi6wnhTLsJpufapSV3SetiWmpHRWKYR633R+n+9xXP7rzSaSnWEvrTC1pA+84BQfmbL9Nlc00T0vwgyjIiz8cAHzZWOcNoLyvMfVkee83Ms7W1YNyCrjIdCW2AUAJ0Ovl21p9KlnDBzyrTPhIyDaDpJWQFJgKKZMf5BhbDWu7mykazZw7qqCrqwIaF6O3xmOx9i0DePqjEzwqkFMMuQCvWbW4F15Dcfa7TH/pcMnpjBt4ICnHG0XB7g49PoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPd4bKa7N6wbnA7ST82C9IIL5s3baJb3iMP45Ow2oS8=;
 b=yDByHfZlgzLhEAeLvXWvZs3qxY7yKna0Q3w56dk8HsXxCZk//gaXyv4N5fBosGbBRaw/AOQO9O4aXn/ria9zMppb0BmdzOMlZpi2a/cfoMq7T73xzoR695ujN9i1UqEBPDSk/SnA9fy/Hy6BoAuqMdC9QsqPtr9ZpH+4utGLCiM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/22] Remove apparently redundant assignment
Date: Thu, 29 Aug 2024 01:22:09 -0400
Message-Id: <20240829052219.3234-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0015.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b77d10-55bb-4a20-7de0-08dcc7ea9c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WY00cQ/nKe8Jju+uUYtaWqX5qEeOIdW+lubqAMHiN+KWZMJnyITUMU2/UsBH?=
 =?us-ascii?Q?vyThg9D8QGY3YLnzvXf0aCFNL+YHXYQ7C/FTQUiBcuRba0pTxcizT9cNFoya?=
 =?us-ascii?Q?q+7R24VdSnulIlqsrS2zkGJjs5pRaUiIIxbcwgvcUGEB1TpmmieJ4wa5ZfWW?=
 =?us-ascii?Q?ahr/tJpbeIzLF0nzUiK5zN4qS1DUgrBDcgX2QmimTSZsRUyRjqh/AcC1B0Ob?=
 =?us-ascii?Q?eDosmM4XSRgkDBTThIHp+K+3XOa8MriVfxmE9WOxKlKvhXgZtrYY2+Ar2mpF?=
 =?us-ascii?Q?F7la9T2TBpjM8oN8V3RwgWcgdQ5GwUfaSOGBTPBnnIfI8dreVm3NE2Q5fxi7?=
 =?us-ascii?Q?nz0iyd0JblaSSsaaR96lVcpU4o0Cy2wZjC0nKjbUIpYDFYQLyJiPZrBaI6mO?=
 =?us-ascii?Q?mdn5MIYQ2u2k4I5Cb4VopnxsIo+u4WDtuzdjLunXrWYTaIAUmXl0+aQTbkc0?=
 =?us-ascii?Q?dL/Lc8by9Tgl7Lo35ZFcn8IPhLADk7MznfI5AK92JzO5LcFbXgBWGFALaPba?=
 =?us-ascii?Q?XvM514VslmXfXPa5qVw8l6muxO3d0WmbUS1Xy5eQDF5PITTRvJvaYxlBZiDf?=
 =?us-ascii?Q?W3nwpsbKBqZpwrKWvkAPbHixs87H8CBprXCyxrb7qgW07weBxH2U6+L+j0Kg?=
 =?us-ascii?Q?RIMxfNKT1Y1OfZ/tFr3a3uGZzkiXGNKQ8c6pHDON3/BflS/YnnGgvUivNIb0?=
 =?us-ascii?Q?Dk863Mo3QgW1W/nWNfqCKrdlEojmrfzi3weCCzblZU/ak5zUoc9tbBGq6VMT?=
 =?us-ascii?Q?yg0MZVBbpao6B5rMCsYd+KsyLwppjeJnYflH5xwR9dRNnFdUAIXsEYaChkHX?=
 =?us-ascii?Q?pQwybPsvUhAvNL3JcHmLRa2Bjn+ixiBHRZ4dA7k0xiYly16PEA/H4cV5ZUm3?=
 =?us-ascii?Q?EKHECXjjuhg9RWi1e5Ur1W5Kjb4eqzzSS7dg9rZX0oLg9S+t1h2XF0ezkcr9?=
 =?us-ascii?Q?yYjPopoOIk9RUVPZ6Axu8RAk77K/TlVGR4KN/GszNb4afb9L4hZd6wsvcCaR?=
 =?us-ascii?Q?5ghDWDTDjLhXj9csTkQh66gQfdvJgnrZJhciKCpKlJ8RclsH8gma++v/mzfJ?=
 =?us-ascii?Q?AKtZw8ZuB6KI0R7Ftyp29yMesf5LjWC3YnNqX8Mq1g4lgo9kSzL3wTNzgkYr?=
 =?us-ascii?Q?G+Tb440BrNllVQcd3O7ajwDHf3+RA1ZSGqyJRHsKtq6/HCn4/L7XOazPnMgF?=
 =?us-ascii?Q?E/YCeZflhbJ9jfJo4832odcW0LexX04SrldrfWKZ87ArDh6JGVtRpcTMVUp3?=
 =?us-ascii?Q?fwPRlbeAQWJuUaBG18pXnHI1hkALBvf4Y8VuZw3yx8TK1+P9e/gUCcA6tCgD?=
 =?us-ascii?Q?jq2cHfn02oAEE4p2Dr+8V/sxPydJbHskf0J2Q2t+7ZFwjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nBGrU8Y0J5ZAtIha7xHb2CPSFkpVtiduI+SwU5pxkDQWP7VcE/Ng9qMnSbL4?=
 =?us-ascii?Q?IguzXq2MiAuAcmGHbBcz6Mn3soH+zMHk8O8/xwfCVLioUmemgP33vVUvltux?=
 =?us-ascii?Q?jfX+89YHn5OlzRdhAJ8X4c6OoEnMERF+D3LZZqNX1hsMuMy9y6wsfSSy1DMq?=
 =?us-ascii?Q?XD4xEw3/rgd+5j8tTVOi92q4f/TM+wt/OJG9hgiGxBupTdOV4HUbqH16Vki/?=
 =?us-ascii?Q?4zIDkbI7miNH2KHQTeA7eVyog1r5cNzE6Huf+lGsEyzZ9kkgdeAPR+/OXy0E?=
 =?us-ascii?Q?IL3UsviTB/a43JHI72vy+LZVucro6Ufi0bbXEV528s7fFSphQF7UL83VDXDf?=
 =?us-ascii?Q?5U/i7NTRrUL8vWf+y7qc+Gcd8/nGbZImpzVPkDmVDbU02lS5nqH74L7gNDLq?=
 =?us-ascii?Q?XBHVQxegDibIyERK34qsD14SxfQh6WzrUb8uve+TqRgQbizjlJaH2LyfJDz4?=
 =?us-ascii?Q?ZLYssmh/fgXOHSNr7aRh9PCHgBu+b0Wm37o6KcDL2AWU5zNmCOJSOHSFk2mw?=
 =?us-ascii?Q?VAGu0murhlrjY/iyDKFrtetlrUwfb7gTqhYu1RpdmVzJV53nEgUbujaQtCdJ?=
 =?us-ascii?Q?tJtgrdOKFMi0+7sbNHGUMyjiJszqag/AOgWY4Dt3W6dwGyaZmFbllXYQ2foN?=
 =?us-ascii?Q?QCKkqh2olE/90Cc51v17w00O/gaWOP59em/e+LV+WlbPWNOyUPQj7buqINOG?=
 =?us-ascii?Q?rw5lQeBWbnHpc+1n/yKk1PZNUViSQ3t8yzsA+S0J5pVpO1kZcFAFFMdr0MdD?=
 =?us-ascii?Q?Wd1gpq5oq42SjsbebqKwrqog8lGez7g5DOCye+oU5DwVi1C4IqjWbi3ZVs+e?=
 =?us-ascii?Q?HMOSpWBAtZgOo7WjTCyIyu/UhSlHuT5FUg1j1RzYK6RLC7wDcLeOTULD5sK6?=
 =?us-ascii?Q?uCpeoMxo5VsPhDkBrQPwUMDuse7McL37teIg6LhvnvbtYmrec8aAuDmluWbm?=
 =?us-ascii?Q?PA9CHvKQW76yN0FXd0mby5TzHdRe5kBW+6L6yt1k/gapv++UoEl2lJ8MxRgM?=
 =?us-ascii?Q?RjQyQzh2Ju+LW7yFQ2Ky0EMfzgWE4kcq3g0KqRgyd16kpmDwUYHnFwVtbCjx?=
 =?us-ascii?Q?O/AiWbFrxQY1RQfo5v8GBvgR8y3dkKWWv45qP3osm0AZigPRrv0IydOzX+tR?=
 =?us-ascii?Q?tQ0v1Q24CYmd2vYSRXFu86k6V01WTP7Dp+GwN41adcxfBhf0V4lA2OQti3bf?=
 =?us-ascii?Q?ly3zZ1rQ6u9t8e16m8c3cmkMPrqVXiKScrAY1HR7PgVrXEkB/9okVgV3caTz?=
 =?us-ascii?Q?TeNiFzT1rmoUhTR7FAnTZThCNTqmnT8Ft5z97Zl5bNRPlT8rKiexh9net6O5?=
 =?us-ascii?Q?g/C7BpQmhgbvqCmmzFjS3uT3a2FF0stgXf/mnKyFZSQhLqByBKtCg3eFz/KQ?=
 =?us-ascii?Q?aXuJUuc0eA3KLbzTDmgP9vIYpkO+HlXPSWWNCPXsXXDTk+YnLDSYRyLDM1VG?=
 =?us-ascii?Q?5UnO81OIWlK5t/sqWQvuZcvtk4KoxKxGIgZfOPacbrvz9A9MiboYdnrVj3+A?=
 =?us-ascii?Q?IM1+aesYEbTy9ywgwj/ld9Ey4q3V6LUDpTJMr7645Bob9hShwBu5AIjD6W0R?=
 =?us-ascii?Q?b1IOoIWKd0eJQ9FgRCD7X+2V6y0cnVB1TNlQCzJ4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hhLzyxWmOMsjZ5LHYpBed9HP/+ITlxuwYSvdNyfcvrgU1oPeK2njiKPL9O5Qy95Opqo5XLY31HITteGrSM2gs2R56PsGatSH2ovGGfN7o/sGRdQjeXYlKxrsWyWKGXSHGQzuwfHxzVpiLJjLfScD86v4FHQALSlDzUm/R8YZBP3aur9N8uTA15zNcXh/CZe24+Mz9AyynS7dsiszORpdAyGmvJE/w89CqRU4Nodz7OK+rXuc8DluMfO6ZGybKpodzawhFBuAUrXAuMNGQNrzTQoXTdhx35JyKiM0a7f2UY6SDDnXkyAQW04BgBkzTmsN+bk4f7nhKfkBAtnUIsZP7NxeCLf64oZtBGzSu6OTQ4N+xp/lxygiaclrRczeSedJ5Dsd/7M73egF3g5qXn4cALnfpJMqzkUHFxEENsaya7x4aMfGk1a0SXtVbxHTqz22I2obmgUPAqcCqS8/vQUgYP5pKFnQel7eNoc2GR+sNYneDYwU5/3F8FIG/lg4a2i+qzwFm/LrgsS+lR+bk5nSz3ewRkuA+thMZPY0ikRTMk3qoZNDoAOckzVFedYe4Ia8eGIZRAS8xUc8vYJ39+sN7tuY8F9JZ0SziCpuCJ6FiNU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b77d10-55bb-4a20-7de0-08dcc7ea9c27
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:43.8056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmziuCU1BPeEJRriBaioAgZhzB/1tj1Hc02v+z3rKoODSo3310w+cw4o6OojK2NBjZ616x6AH8+O35+U9+Bbpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: AyRYoJMn74WUwT4XhVPqlJ_3kV6pEhpo
X-Proofpoint-GUID: AyRYoJMn74WUwT4XhVPqlJ_3kV6pEhpo

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 8825739c..d87d49e8 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -621,7 +621,6 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 		}
 
 		/* Skip if data gen is older than hash gen.  */
-		hgen = *(int64_t *)agd->dtada_data;
 		if (dgen < hgen)
 			return 0;
 
-- 
2.43.5

