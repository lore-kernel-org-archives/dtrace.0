Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B615F238D29
	for <dtrace@lists.linux.dev>; Fri,  7 Feb 2025 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941205; cv=fail; b=Rd7yVP/8Jx9bmm3C90btPUgIrLUTuULwchAqLokLwAhl+dqz61ZuDpmemeG7aHqC1dRYH0DwuXA7V0ir2XuxBUvUu+aL68OSZOwFwGsjIqBUqPfwB6FkBqH4RWRqKTqbVZXOMJBRhHOzqKdVmzqKK0TKBGexyejBXyoE1OD+mQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941205; c=relaxed/simple;
	bh=sXlfXVKq8+K/mdOp9uQFkb8+bMnjah0vm1QF6bycJHo=;
	h=Message-ID:From:To:Date:Subject:Content-Type:MIME-Version; b=t2PIjH19EZKUSO/G+uvXCUmdtX4lsJGY8SNLRt6snsYnPXdKMlwxU7M00RNE67b1qfXKEce9nPvjCWnioRQIt+FJo1KEHSriH5wwqK0Z7PEgCNPrBkSC7Qz+9YvbCtJ9b1X6CJ2cvfaNZe5eeazDhXbgeFQ1tVp02ZhZHUqB0wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aO8fsvCn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vi94v1Q2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aO8fsvCn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vi94v1Q2"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 517El8ew002689
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 15:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=rxqfPrHxqUiZH1MlvdqpaxwRzCl0ZVfcKTaFl8rGglU=; b=
	aO8fsvCncbRXe+4WIGS1a3XrAuzxWIkXvdB/Cyc7bRu8q3tUW6u/dmBBFrTisIOd
	a/oLdYHXWkv6WKrJLNDkqwe6y47Bf+3c4glZQJAX2osvbln/DpjN63zUBfBt1kap
	5QcSmayfqk0pabkwnohRQJJaKQUiRAhcT3RbBY125SZiX6nwo9h1FfsVdwSbGKNO
	GcvE/2/TCjcXr3wBfQEx5dHUqW7bEPAJ/HevX/TUOw/0/7W4MZj4Oc+H4wsPpIxZ
	RzFJWwuWsFo9iFEy/noeFSsJcUDt47BrxNPQ3irbuVKKoj3y7Ah305bPKph4hP6l
	0thTZlcZxqox3k3wcoyK2A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44mqk8ax56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 15:13:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517F4OPO022546
	for <dtrace@lists.linux.dev>; Fri, 7 Feb 2025 15:13:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8ec0j4f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Feb 2025 15:13:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GclMKO9R4PmCN3JWyKPJ41sAeWtN1g+CIEVcdAdNi/KdIz0vnRpSeaKTjcrvU83ma5G7qlgFHYQrqRgyyz0/TtqIhMm62nTNVzkMU26dcgqkiw6uy3hgHbGMdmgbZd5rPlhf3tqf3wG5jdJAX+An+Ck393C0QZAG4xRuAOq0fvA8EGdiWUl93OBxMbdDpTquOC9hDMPNrl6TLtU8O31s6ck067/og6wAUjaNX8JCL+xDVU+6lNsyEiHdfBpxIAY2EWKsVfIHrmhYuGiok8nOuCveoONLYBzClb8fyh+gY/Q0EDqU3jYC7phBY+1V+zFVHk1t6JZH01f48bqdzqcShg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxqfPrHxqUiZH1MlvdqpaxwRzCl0ZVfcKTaFl8rGglU=;
 b=vuBlqyK8Ov1pVTyHicztjKLv6dehITQX7SsdB7wXOGichJegOKEpSB9eVx1XW065RvU+qUH2PAJuu06tXzj5yjkOD9uKTjxl8v8AThj1g0tZzcUrPafIwI0C7AQsxCR6EAf/KVFiIXSh5umbtceqJl5mkkJ+zwgGrrtVj0R4/dCYja7FVmPENMs6fFpdn16vqjkyDZ+PFzjI9yb7lQtsXnFS19tyh1Ie2wmkqfr9tlQGHuSyhHyaYeHKk+mylGsXSpcxx+43/btWoGFRgSyE/gv9/T+3d4Z8ItUenopAGRNibf3yepxcuu2FhehyKxUqEIh4Vd+pIt7VM4VTAoqhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxqfPrHxqUiZH1MlvdqpaxwRzCl0ZVfcKTaFl8rGglU=;
 b=Vi94v1Q22d8rXlvKEEiGTzq0/CQnImnBIryd2zpL7NQR0FnhGk0PxfKZ6/Mjzgd7iRJEZRO2ttElWoA4tpd09Nl3De2qwuukjIAVRmTW2ktRkYrX3IExRQcnIADAjiH2/beyU/wikkZa1zsPCPMpjfAWZpdATryBSFcvAxMznig=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by MN6PR10MB7467.namprd10.prod.outlook.com (2603:10b6:208:47f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 15:13:00 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%7]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 15:13:00 +0000
Message-ID: <6c5f5a2593039303a8f1f46fccb7a198.kris.van.hees@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Date: Fri, 7 Feb 2025 01:11:05 -0500
Subject: [PATCH] cg: ensure string results in a ternary are padded to
 strsize
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0033.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::8) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|MN6PR10MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 23040740-26f0-41db-11ab-08dd4789e94f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1iGgSXOfEUCH8L0X+4qc63WSRMER2DsbTI4c4CcJaDnW9aDDSCkcPId/E8Bs?=
 =?us-ascii?Q?QDV8r3XizsgJUCoM6JcIgCVBFZ9/HwgZn8NGMHHyxw9txXelziFRUvYsW2ZP?=
 =?us-ascii?Q?vYK2B/bTk7PJGo1jwizf3dhh/bmWvfH1dc707eFWDTsAYLV8uSdOfdiZeh+O?=
 =?us-ascii?Q?MJg/27e6LZ+4sgk+jwNdsv6ufFOSQKW7XXUkyLorbuWmSNjTDsyGsXErMNN/?=
 =?us-ascii?Q?XFIqGZ3A46VQNjPa+YzwUJGK0SzFbKZNh0MUyT5h0SdeZNNHplJ3g9uJmUu6?=
 =?us-ascii?Q?sYabcLR+BOtOBp7hu4Y7a+LcUAL4Mi6dQQ+bW9pudXoSzXmi8om7cxum3ZXi?=
 =?us-ascii?Q?J23yrJR3XRm7yGNTPctL68CnbT4ocKjnWhudyakd5WUe4jcJEmhqtU3kidMH?=
 =?us-ascii?Q?etjmGsn6BH9SL6/hi/ISkDF/KnmD6SsXTVQu2AMUvuELJQcpfK9qe934m36g?=
 =?us-ascii?Q?FpoXXH9OJCKSxeWu2cOo9oiI6xrSRU+Unml2J02syTO9FMoECBiiNa3nNc09?=
 =?us-ascii?Q?PGQhzp/PRZ4WlItlr0bwv6rkol3VhemW40JwnFgOC231M33KPFS3gzMkIWcQ?=
 =?us-ascii?Q?eafAFZKj/g9QMInxIgjbDHwLCWNWr1vEz8GFXZXCiUJRVE1cNvR1EjGNGAhJ?=
 =?us-ascii?Q?0sxB9K14ruephW2V6MKlkgjrfC3vNyV2Sh58r8eaji91GIS1YmZVEgfeeue9?=
 =?us-ascii?Q?8hgQM2rN7qTNqBR5dGj8ivZOb91LUtpI4mKscVcFtQlG4QQZQ5EqopC+k7R5?=
 =?us-ascii?Q?SSRX1tS8lbupEFTUYLyXIGFz8xnOCYG9QMkj73+XRJoYIlVvTjQO6x1dCWl4?=
 =?us-ascii?Q?/hpqHhXbZU0v6P6xehawRJ91mVSYpGSfQNPvYGJKLFotMZGvKc8tVTcmU8mQ?=
 =?us-ascii?Q?xhcsW7jTgAo0bL1Odc7lhjSfWOqh/RTNBFwK8R96wppKP+zFN4W6onXlbC5X?=
 =?us-ascii?Q?gpFrg8i38MNGFAA8LAG91dzoleG45vMOsoF6xOINpJ7dSkn0cbj3BWwyEf5F?=
 =?us-ascii?Q?2MjFCygJ1pMX0JrgI0z4YdectRK7V3TWd57JHUC+z/hPtfwO7mJMAbDc+WRy?=
 =?us-ascii?Q?kc0d9+py9TggbX6KC1fWLx+A35VkYc9v0cZtYYJnMh3iA0mQzrs5o0FtuNaJ?=
 =?us-ascii?Q?YinvNizQhmoFGZnhtptRgwnCBZilG6hXc1JZTV6axBrb59Ywfv++onB9KOAc?=
 =?us-ascii?Q?e1zpyZSWkX5wTjFoXh0vtDaVsRYW7qexNYauopxerY9/rXRsaUMKEuH+2jcm?=
 =?us-ascii?Q?Ug0Pw6Yy9d+DE8Ql0x9FDoJx8aL/UUrgMeKK1jOL/stRfHj2o0MLkpe7J0VH?=
 =?us-ascii?Q?mzHx+iYTAz9PZqlEUC0NMIHQ/ypygnp344u2sw+4tCcc6DcmKVOJWBCctCfK?=
 =?us-ascii?Q?iHnQitHl9bkkOwWn4bmC89TExQvL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?26ZBNNvzB8vbPcJdt6zREvZT/rO8McjqrEmNUwo5uFele+QRxMjE2daA0xBc?=
 =?us-ascii?Q?P13qPlISNJKpkWLorIuX2v6fy0wWbUZAqZpByQX/FoxnjTgJbIFuFw8hUmoR?=
 =?us-ascii?Q?SnIKm2UtUhFXNp0lgPz/lFz+hbeGFXoQY/g5YWk/5pnojov9rzfosnlmxG9S?=
 =?us-ascii?Q?GV4QNO0iat+PUBWDmr7OJdODHgWVrw3aPMcKcOdTjpw02tNCTjKOCJXE5qgf?=
 =?us-ascii?Q?fyV0UWtD6PYSPZTmUA/YoVaF5PYI7qvp73GAwCe7ih8XaRS9l0suu9T4Wu0t?=
 =?us-ascii?Q?t1jzPKOk7HG7WewJXbns2ElDWeCnX3X1Mf/O2Od3CFbEWc6o0/XIsTvOhiyn?=
 =?us-ascii?Q?fwjC1amLNeccoOqNkSPAHIdq1cyXxGEbOcbKBwUQl7u+uQyv0Jb/dGIBC8uh?=
 =?us-ascii?Q?rhnruq/nqGX2ALCVpXz+6chGnUZp5wu03tlIUhZTFbNObeJyPla2u9xVQBhT?=
 =?us-ascii?Q?qFLaZbRLhKszNR8UYIOM1nhCpRzXYg0Ix64QgiSzPTWhFfykfDxcZdpRtK8r?=
 =?us-ascii?Q?2Q6pP4aVFCQjTBI5vOp3pW+LU4ai/xvBvD/yx4cotOXGHnW8eQp0IcB/FX1j?=
 =?us-ascii?Q?KJ5OqhapCBMWP9lYPHhGcI+14urqK1tX87d0bFf5WDKKRuZs/HCBE17OsN60?=
 =?us-ascii?Q?tDegnhDahdl50lbvz+2Tsxux03QeJgvLwVBoPY6Gg0baLr9FC5buLc/14zAP?=
 =?us-ascii?Q?/HgdymZH0RCZ5Xd0e32Dm8oEpoi4P+OABnpNXBe0lzPcQiqrfO2ZDf6u/pta?=
 =?us-ascii?Q?z5prmY2UPnnnLDUIaogPTvInYbfHWC2TNOYkEQpyMyCQsyLeTVsoZ7SvsjA9?=
 =?us-ascii?Q?MpVeuS8p1JS4CzgJUhiwBWYaZl93Qvv5mJWmQva7Mk+1rp8IQJ5FER9Bqzpj?=
 =?us-ascii?Q?VwoOmvGJ0ztD9XnmWJxNr/AfbJp1spN4v8s484dSap9K97kdMge8j8OL4J1x?=
 =?us-ascii?Q?E68Ha1mlxh9X2UwArJRNHUsY8KdLekN/5mUsuUcFfjnMotX5yTWyq5E4TnFZ?=
 =?us-ascii?Q?NuqGHCSeDlNpKvvCGxvDEQZUlaQ2QGD7xYzVq7z1JTOR+Y0fO7JKZI5poRkK?=
 =?us-ascii?Q?ZqXzqO+BSyV1Hz/kO9Us2gudogHrS6LaKdlRxSLgYiDR263yhWpU6nO1/Jdl?=
 =?us-ascii?Q?NxZpUmtXc7iaGCx3LwXe8PVDbovy1AuCGOIWXuHwDa46/DRq0zMi7XBWdMIU?=
 =?us-ascii?Q?mfUxkVtp5bv2fDXm74B1ckxEIbSZrB0rmASY91gJn0jL84I9cf9Ec4HDPc2O?=
 =?us-ascii?Q?s/y5VGDzIkRdCMin+NCL1cYQ4oRb+TyZHnkuj7qaSwXu67EI5W1wbZ742b60?=
 =?us-ascii?Q?kH7qBxhnWOm+e54uiCsHgTKwKflwiwdQE6jfCQIQzNs8ro+mf8v0pqgvjZCd?=
 =?us-ascii?Q?EbX6reKhIBp+W8hME321NBM0qdSY61pxL7yhjIp6dbbe2XADVAuLkVGMOezO?=
 =?us-ascii?Q?ScxEP69aJwZsUunOBMu3/jjvKI/v7dE1qrQPSjzOwV3Y8n85MYtmza6SQAgB?=
 =?us-ascii?Q?4JKMSQXY9tpTcowko17BLeqQTy1sgu+rgsjf07F41i27qNHiwhDhWiB/eVmE?=
 =?us-ascii?Q?T+Vv+eCk+SrRjr4q5Huv9Ylhy+SGhVh2YTfBx4j6SGCeFyEdpli65Mliw6YM?=
 =?us-ascii?Q?ueu60LrqVeeAXHAIJEBWcTQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NgS1lpY2tbi9fdMO8Cq2SrhujSOWQX6a2uCZrJsOBKARuTQJi3DXn2NjxYw0P42fFmnDFKsBf/On4M5A+1aA5lFZ53c/GtXOoNyCtEBgwTwWFltrh2hMcnMhs3JglFES03XFVjUJJcNUAGkHOUxmwPyCtdAs5pHdukxsRInf/ShA3XOr7Y6f/4CATyS8vVW5vY4uwBkcCD1nutnB3GucTEgN3nes9n60F9rA4ug03VDiB0TldQynahVWxgTkxtnmBunAbliQGHqNMpnyZAtlxb1rV+lJ9N0WB0qU7TWEnpFayBtWgjKATtHCE+GhIexLKPpoyXUmTu+7JmbM/Hb3N3kKF7S4JDqXYE10LfPgNBdMFXITk7NJeO7ZY9+OnAq47U/HlaHnLmKlrP6ZFeNTjDGfSHSlYZO/BF9dvNguEITH/RKJDahqoRbji1KNbZzU2gY99lLQpKGHMfBbxhWnjLzz9ER2k9/E3NycMfA+JVrKZYlLSm9mc+wM3fPv7LXiui9Xm1FAgT8Z1ZOVRQAVGqt2E7g1Dr9R6lWI6UOOpnBSW2BOPm+wzwnRTYGyt4kDw5XWPS15wPUhRf0hhkq8bRIgBtw+oOBlC2aFbj94Qfg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23040740-26f0-41db-11ab-08dd4789e94f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:13:00.8184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K38I3F6Z/h2ypODnCgGdSIg8Jj/BFkd2EjVXkmh2RTM5zQOxoa9+UffN1QoH+Fr71r3Ct5p/7kdhDfLBEdXJsQLpPskuWFQQSrm63Ooio4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7467
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_07,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502070116
X-Proofpoint-GUID: G8ogSHXTGX2QHoTZgx8tH7wBBiAXHikn
X-Proofpoint-ORIG-GUID: G8ogSHXTGX2QHoTZgx8tH7wBBiAXHikn

The result of a string ternary was copied from either left or right
value using a memcpy() of strsize, but that could result in garbage
being included in the result beyond the terminating 0-byte of the
string value.  If the result was e.g. assigned to a char-array
translator member, that garbage could affect consumer output.

The ternary will now copy the string using dt_cg_strcpy() which ensures
that any string < strsize will be padded with 0-bytes up to strsize.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c | 68 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 16 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a5c9aa09..b48e27f0 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1371,6 +1371,19 @@ dt_cg_fill_gap(dt_pcb_t *pcb, int gap)
 		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, off, 0));
 }
 
+/*
+ * Store a pointer to the 'memory block of zeros' in reg.
+ */
+static void
+dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
+
+	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
+	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
+}
+
 static void
 dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
 {
@@ -1394,6 +1407,43 @@ dt_cg_memcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src, size_t size)
 	dt_regset_free(drp, BPF_REG_0);
 }
 
+/*
+ * Copy a string from the pointer stored in the src register to the pointer
+ * stored in the dst register.  At most strsize characters will be copied, and
+ * if the source string is less than strsize characters, the remainder will be
+ * filled with 0s.
+ */
+static void
+dt_cg_strcpy(dt_irlist_t *dlp, dt_regset_t *drp, int dst, int src)
+{
+	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
+	uint_t		lbl_ok = dt_irlist_label(dlp);
+	size_t		size = dtp->dt_options[DTRACEOPT_STRSIZE];
+
+	if (dt_regset_xalloc_args(drp) == -1)
+		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
+
+	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
+	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
+	emit(dlp,  BPF_MOV_REG(BPF_REG_3, src));
+	dt_regset_xalloc(drp, BPF_REG_0);
+	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel_str]));
+
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JSGE, BPF_REG_0, 0, lbl_ok));
+	dt_cg_probe_error(yypcb, DTRACEFLT_BADADDR, DT_ISREG, src);
+
+	emitl(dlp, lbl_ok,
+		   BPF_NOP());
+	emit(dlp,  BPF_MOV_REG(BPF_REG_1, dst));
+	emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
+	emit(dlp,  BPF_MOV_IMM(BPF_REG_2, size));
+	emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
+	dt_cg_zerosptr(BPF_REG_3, dlp, drp);
+	emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+	dt_regset_free(drp, BPF_REG_0);
+	dt_regset_free_args(drp);
+}
+
 static void
 dt_cg_spill_store(int reg)
 {
@@ -3040,19 +3090,6 @@ dt_cg_pop_stack(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
 	dt_regset_free(drp, treg);
 }
 
-/*
- * Store a pointer to the 'memory block of zeros' in reg.
- */
-static void
-dt_cg_zerosptr(int reg, dt_irlist_t *dlp, dt_regset_t *drp)
-{
-	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
-	dt_ident_t	*zero_off = dt_dlib_get_var(dtp, "ZERO_OFF");
-
-	dt_cg_access_dctx(reg, dlp, drp, DCTX_STRTAB);
-	emite(dlp, BPF_ALU64_IMM(BPF_ADD, reg, -1), zero_off);
-}
-
 /*
  * Generate code to promote signed scalars (size < 64 bits) to native register
  * size (64 bits).
@@ -4603,7 +4640,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * dn_right).
 	 */
 	if (dt_node_is_string(dnp)) {
-		uint_t lbl_null = dt_irlist_label(dlp);
+		uint_t	lbl_null = dt_irlist_label(dlp);
 
 		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, dnp->dn_reg, 0, lbl_null));
 
@@ -4619,8 +4656,7 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 		dt_cg_access_dctx(dnp->dn_reg, dlp, drp, DCTX_MEM);
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, dnp->dn_reg, dnp->dn_tstring->dn_value));
 
-		dt_cg_memcpy(dlp, drp, dnp->dn_reg, BPF_REG_0,
-			     yypcb->pcb_hdl->dt_options[DTRACEOPT_STRSIZE]);
+		dt_cg_strcpy(dlp, drp, dnp->dn_reg, BPF_REG_0);
 
 		emitl(dlp, lbl_null,
 			   BPF_NOP());
-- 
2.45.2

