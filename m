Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1424E2949E0
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 18:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754417553; cv=fail; b=BrYjxtBzJUpnJuMhHns3EM5nF34tzEgqRPy4PvhM5E5MNFRlsjjyquQZ+WnkFGh7+Uv83gH39DMMirClNuFXPYUUeZ09wVwyJseJyIFdvVqGTnunx7sdgge2IFZRokkD8GBlSbIDLI1F82zWGH9Wr9tlhHVitiO/5d7w7LXpiBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754417553; c=relaxed/simple;
	bh=2rO6k+gI1otsM1Zu1TOR+KhqIrILdBYdw3PxhbJa0fg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mUJuN0SyH9rlLl5ikYvgRs+6wotZ5UbD3n3N7MUj1EkDQuXBJID/G0xTGxCqXaC+oI1c8e8JIwAr0jmz9H1cPoSpNcLQiZ2FRhJEQJ+k2z0k3NGh75Go+/IOuMSebmSNF6hxw4ewAvVwlflT4NFmlvcOgdBrQ7N++58inCOxQGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZB8puGO9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CFIluwpm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZB8puGO9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CFIluwpm"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I1rQs027971
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=6+XGdCiA+oOU0bH6AWAzHdL47FhTJOdTjBq94/G3uU4=; b=
	ZB8puGO9pKaSXDfI88ajDbJ0CbYjUIBQhOwvrwIm/ygLKRTYjUaMDt047qYGK+Kz
	ITx+jY5dmTsXiw7zhXjYk/HaenNlBOdNTCd6f+B1EgBA6yvY3w6y2wIubM8M5OQS
	hCUqkcAnJxLjN2OjQWwCcKIfV2UBBqxoH/1dJ7xkSLhMFNZbITdMaJccpRbXXM3z
	yIzUsRyebDWy+k3awlQDtF+h3e3xObCfGP4znnTJ62o+69A3jcG8pLKd0p7RKc+c
	dffAQuTePohB8+s2OnYHja4zovJFOHQwMVdV3+bxrCVoHkBVXLUTf/zI2OcgEDKf
	o5qyiHCeDv3f0oTqZQW/Ng==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf00jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:12:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I47EB028847
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:12:29 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwk08vy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:12:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnudbtPUiBAB6rnJRYeJRPQ7irVUOuXz+O5mAVnZ3ezi+Gi+GHbRAAggEJ0iYPKpN4MB0syJl12B/XC2A2WykDkVvc9I5vKI+flkrRox89OKediXVkDePXCJI2SSxWtqR+0jocOj86o9ZcqkpqGT7BcQvJu1Llbg2bjhgFcKr4fQUOVmoFxbc5iioQnYp9eehOGV1atGZn5Z3DWzb2HT1ztsxPkXEpML/OiFxamsZ8/mROXXhoR6Lrq9YGvf64Gpl+PvPvMCnWK0Zi5jcz5HxJDqVnKj2LrCvOKv3DJnx8S3AAgC2ZgeDpXJWMZmlU32fLnMNia/bUc674FeTXkX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+XGdCiA+oOU0bH6AWAzHdL47FhTJOdTjBq94/G3uU4=;
 b=K2pOcj77vIerPYjE9uMBFm7yCxFvhynbuEE9A++ZZuRw1Ok1Ln2CdLoLUiPhQue+p5NqzUDDtoTX2aHvFJo3QvVIchw8YLHGf5r6PulWEog2QUBA2wHRqRm3+K2gH1bphsOWPNTjBtIIm8aM/beKttJQPcNvF1yUjBld4CPzCbSbrH40ueMhtZ3GntXW1r5nFJcFc3QRe9HK3TcW2jiHmZD6IE4eP8Mp8mETDaCbng9GjMt4p5ksCJlhAxo//UsF7b7K7j/z877f+eKqUbcZcbE8BmU8SCFM/vGxANqQ/LWkbmQKfw7+RdY/DC1WYUr8Hz2Co7aaZGVuRKg9XCg6tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+XGdCiA+oOU0bH6AWAzHdL47FhTJOdTjBq94/G3uU4=;
 b=CFIluwpmSI983VYrF0e+s0BohQK0XIohh16Ej5X/8s7kqL0f7eUJr3QUKPi0q1rHjBg6tTaQKwPK5KFU2iWlEorVSBIVB1FCuTgZOmPE32kAZv09Z1wmEWX5xbfcizExgWIj7lva9bWTsXahm0RKXp/cs9x3XcJjzhFXqZOQK+8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4751.namprd10.prod.outlook.com (2603:10b6:a03:2db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 18:12:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 18:12:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Fix post processing of return-action override-pid tests
Date: Tue,  5 Aug 2025 14:12:21 -0400
Message-Id: <20250805181221.17770-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0600.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d15c709-23b5-4093-d5cf-08ddd44ba1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DW8Y64wp2/ON8Yt6Yr85P0K0Fy80egQGVCTn8TOPpng2ifJ1J9UMZfvuOFDn?=
 =?us-ascii?Q?OldImhv8J7QagyfXsSQWpJEtouM/9EPkqyvuffhUdjxuBJGujfo+xAsx6bSf?=
 =?us-ascii?Q?rCcyEKXAznAA4Ipp1aVtlXolBEt6mbf8p+eaFnZ8gCQ7RZ/ZYUzpL/K11x7G?=
 =?us-ascii?Q?vgAFjdRoqNkcAb3Gs02ZogJjdjlDfYyhtJA64LEcdDan5+7O8Wwxg1NETUym?=
 =?us-ascii?Q?digSw0sFyCwM4i2BpWqIzt6fmt5dZgl6dYCkvb1p7tVQFEb3aefvsUv2XWKc?=
 =?us-ascii?Q?vRjcQKvnDouS9ER2xKIXJPqMiEPog5nxd1kMulwr3p4+E2S+3Bh8Irr2KNmt?=
 =?us-ascii?Q?3rnX85KQ8aAJvkKTI1ajhHuUFdTSkntPdmdnLp6oeP8n+ArpPnpbfcoNKnfd?=
 =?us-ascii?Q?mvuO/EBmmbhwDlC920ZIWh8SmXEeCc3a4mjZiCEUrxpD1+GRA48BjWMRdCDT?=
 =?us-ascii?Q?bZoGq9A/17Vcz6aYuJAtKMN19hcmPf++qvCkozbA0OQSbrW1zAdMmiKD/Nea?=
 =?us-ascii?Q?ZGcHFT6c5cM8xaJy2X+bVoWNR2t+dK0mLMgjHr086juCJguKuE9B7Azy60e9?=
 =?us-ascii?Q?vB9bsfUvboWZ6bObZFSJAQwnXwSwBxGAb4Ke8BNN3jzsG3Gh5A4/vulC10Yg?=
 =?us-ascii?Q?yTOHhx9rXsZhMALCTE+zB2SfWvXz9kS3xI7hfvEM+ZJwP2Qo2oisQisRrIlJ?=
 =?us-ascii?Q?f0aUbp3364U5r7Q68TA1YFkHepmlZ1MWKixNa/f07y1WWRPJcxF97hwIR+1u?=
 =?us-ascii?Q?7ireHzkToDsjrDDDjoLmyaDgCOaL0/knf4fN/Vvxem6ofdZS7poJLSwcn2rE?=
 =?us-ascii?Q?D4c3nr9QV7GLqGoG0pLcIPLEb7+49886e4ub23uHC1AB5GxRb+YL6n839YgV?=
 =?us-ascii?Q?7dKaVyeAL2X8tC3lJQUOFLi1hVtYK5ewSslwP4FN7BoONiCqdNUWY7OqLM7a?=
 =?us-ascii?Q?R0AcfyOO4XgO9QMThF90yTIKTWeE4V7Xc4OnsNuJLj+J4eqYZXJNfup0NUJP?=
 =?us-ascii?Q?yMgexaLScUV6OAYv7FNONfJnXc/FvG8s2+8RrsmZs1k3igxtJ95PtpjND4P/?=
 =?us-ascii?Q?Zqh13ei926CQldm32uFOMOspkfIBvs8uEVkF/Ed4XbCuVIHPtVZlhBnzmwww?=
 =?us-ascii?Q?8rLYqzQJzlu7y7QgjR5pGCsgn/hwckHJrQzFq3OczK5SGBB05tPXwx/GRaPo?=
 =?us-ascii?Q?fXMfGHoGQQ4vrf5M72vNlMYaDOEo6TRrsrWheL6OUIOWghRg07fo6C4VsKLJ?=
 =?us-ascii?Q?RGZxHooRN+8vWiMGdBDPtPUv6fkewHpskOW5KoXjykYkeyA8oAAcQqnR39Oa?=
 =?us-ascii?Q?gtG4cf9pCDhyltlO9CqhcTqrsx62ab6YstwL3rjbeZMSwpfv9qidN1fojoUB?=
 =?us-ascii?Q?dZHdDk2ovSwly3fwbL1EmE/vMHq9s2V5eIp4Rx2ghAnTCjgIR21SaX8GRCBy?=
 =?us-ascii?Q?Ux1WfT4L/QM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aVc7RewLE/47FdwXtJ8V7/PAZ4XBHo5W9QBiF3PH7WUIzd8R7pFthU1unWe2?=
 =?us-ascii?Q?LHufM+nlfNmBgr5geXyyt7TvRBtTzHongGlcwwPy34oe7d1jottGRTlD+3U5?=
 =?us-ascii?Q?MeO8Fov7VCHgZ5vQYfRUKEDR5Wi0pVwXXp/w15Rytiq54TEHQc6fkB7F9xXt?=
 =?us-ascii?Q?nYpMFu/liL8702KcwC2lsCR34wyWMgagY6djeHmaX9Nfjzx0Z5B0wtpcg8j7?=
 =?us-ascii?Q?YOz+ua8lDchKcdv7Y1z9aWxLruO3GH9OiH8ekLKePjPJgv8a9bQ6ejZBsLbi?=
 =?us-ascii?Q?1e6zyksRse2+vwxOeaSkGQwBS3Zvr25i50NTz5l+wb29BIfvHNMioLrcMKMq?=
 =?us-ascii?Q?wB/Xut4/JSSuTgyI6k5ReCJcVrm1KysWnLyZvRJptZ938V0CYRXdL9z5Waur?=
 =?us-ascii?Q?IKKgAybcQnsHeLxJM6Zm7Omg2S/3NyX+CFc5lN7FzfqIojVQCA72nYzAHrTS?=
 =?us-ascii?Q?jOP2cAzyNNgURAcas9O+7bGSgzE8sFFQ0FsQDovRTyq6EHYNrnOL6p0HWWQV?=
 =?us-ascii?Q?D+DqhCMXQwJGgNzk+CUbVQTDYgjyH9w4A11NyZXH8B60JHIjSoblaca+C9tv?=
 =?us-ascii?Q?QK+to+Lr39EemTv4YN3EUXD+6MF6Wjqn8UkUdlRLx+9H3DKa2e6q3+hfwzgG?=
 =?us-ascii?Q?IOLsLEZ0GbhQBp52Q0UzuCoewOmfTUY1eGVWuN9/IO8ND3U5ISlPYxwuIBYQ?=
 =?us-ascii?Q?0hBz38oIb0M3oMN5Hn7xeRfOSDxLUWDfi17XZFzPGTszkPVuxj7hUXQCifoj?=
 =?us-ascii?Q?ALDoRRTbRvRYi18/wJlxrXNRApHJU++9FbcTDa/+qs63/1K4ERLClRhQA2Ah?=
 =?us-ascii?Q?wMd5EEFCGeYCsSgNQGQ4eV9pf9725dq3t9TwLYNmBGTcUJuXhwEIabPXNvQW?=
 =?us-ascii?Q?U38vaUw4MIu1l1uZgUmJNGngKUwYsvCAtNrlx+QIibZsL94rA+EuDOsubp9Z?=
 =?us-ascii?Q?nVt+qZJkF/uSkgAuZZpGyHImcbiaQB79X1OkoAQROaeYTQJUS5R8rsdiBRrS?=
 =?us-ascii?Q?QFTZ2S/aHrK9LrDi4TFjPhXrVGdGc1bYxoZWbjoS8L7hckWLG+WZ6zQtOOsn?=
 =?us-ascii?Q?9tJo4GBt99BUK7iC30c3MaK643EihZHxC/Ks73RIRc5OqSuJZ3igdpojQQAK?=
 =?us-ascii?Q?qSP1sUAoA0oyNAiPZ/ejr4+HOYSZkMRIF5UjXyeH2gsd91/CinmuEIp/53ai?=
 =?us-ascii?Q?p2LqlDN9AEaUvIlPvvW+FNy8PnuWUIuA3w1n23LMQbpYsDJAZ7lq1AibpAZ2?=
 =?us-ascii?Q?8FvkkL0tZiOmyO37Z8vq8nvaJe6UCCW2B8kO8W0Hl7Beg0C2vEp+XZGutq63?=
 =?us-ascii?Q?mrW4uDjoGhG/E+jH0q3w5c2aqgXx6exgC+++3avf6a9gl09Nt5qN1CBf9Ssn?=
 =?us-ascii?Q?TZfFWawWmU2ElbtFZtTgSp6GOA4OUcMqnIb6/dSYmMO2RBuLCO+sbnaCO1y4?=
 =?us-ascii?Q?iYxTRDtlkdeYaioZfVLJgPvzXXtSkSz06eqKqf8zsSA7Dxs1c0/gRRZa9CcO?=
 =?us-ascii?Q?N0TgmcRS+9TNaVYRTFrLk66xmaxFIUhOPuHyMETZzThPtq5CSUi1Sx/oYpyF?=
 =?us-ascii?Q?9He9QkvhtzEErZBUNgWMTsvMhEfMyry75YgSH72W?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AfyX0v/mDt8/ZL45c2fI7dIjJc1cHm6MGpG30XDwenP/tNDQMvxh8CcM2sftoaNok3xIMvPiKxclfPIOlSha9tSSUXprYkEm2b61twLSBQ1w5373LiBhNav09L4WffuvfObyRQUZxyYCvNnGzWSX30bP8GzeA19rcllFgrF2OrQRJl2+O3toYAJGHWpcATd6jllSXZji5y+OcOh0T6KhzM+uKG75UGD7hc/eueFQcVfQeLevwuQo7XvlGLruygQPoDojox+K/0qSucCpZk9fX7Nxjt6VfPaWIegFT9c8ChJ0qgcE51YpK4Bhe5MduHeUgIPPxw7hI683rcKLhYbVmLrFrxBmCIfLCiAtE1gReY4DMmstiPCCF2GSFCjYK99ExQhGbHqrUVrz1G+T/ok8BX8dVZZB22GScYMxxSH1zpgvwLHFdiVV9Ju6U096eJRjXm9zpiNMpvUnrqxRPqvCZMwiz0eUGyiQquduzw6W3g8axinvnTFxtTOzaevZqi4aN5WZbJsvZZLAmYFtsj1sv54WAq6F6jBncu1yAGRudhNzpYuxI867lua5RfMxAuvLmfblpzhypz4xKCZtQZ4PBkWolKCxIbpEp3V19Gp5ZsI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d15c709-23b5-4093-d5cf-08ddd44ba1f0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:12:26.3568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jH+2YPD5lIIu+A6ZBgngbqbA0bQQQ/g79i+yvqjMLfveiWxsrOghIaUpUzYUb5qCLGNAQTzwXngi8S8dj2YoXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4751
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508050127
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEyOCBTYWx0ZWRfX4g2GQY7xWha3
 dqMVunvTN0sSaAn1xUaLjcn+jtVqE0L2BR1j6wQeRz+RlIEFyFbwe2rQLpSZvXSJXAP5Lko31za
 oVCeqz/m5wI5hbZohf3GMklJ6NCjXu25j4mn0im8c4p7eE5lTNmBMVmbqvL3rxQGDOFSC1FGbOM
 DinIkjS2uQ9CcYPCSzE2oVd02n2KGwrST9MNc1oNCDbmqKiel7mt5P1NJgkA4H2RZdQ7Lt7C73d
 8AOIF01v0kw+g0+xH94qIDzkzFMx7XgxTuBdMN6RD1cmCShRn2PdinAtYW4wt3oHioaU73EoNks
 5dfjo6tRU+iC5I4diA6M6pwK4Y+FP3OJ+Fk4hh6VtHOhH/8I2v+MFpQoyO9xpHtRUusae/SNFuh
 fLNhry3cvqkvYnIinP1oxUPbefRKVd2Mr9CsZvNjOxCxSXTRwCqHCE2Agk23Uw6J0dnoURNQ
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=6892498e cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=vWSsDhi0vrsUorbnxI0A:9
X-Proofpoint-ORIG-GUID: jLPSg1sM9GkI_Ghe1FPqE5v461bPaElE
X-Proofpoint-GUID: jLPSg1sM9GkI_Ghe1FPqE5v461bPaElE

From: Eugene Loh <eugene.loh@oracle.com>

In commit ee8c066e8 ("rawfbt: selectively allow return() in clauses"),
tests were introduced to check that return values are overwritten.  A
pid check value is output and used to facilitate comparisons to a .r
results file.

The post processing logic was flawed in two respects:

1 The check value was being pulled from the "01" entry.  Therefore,
  the "00" entry, typically appearing first, would not be converted.

2 Values were not sorted.  Sometimes this means the disorder just
  described would be avoided and the test would pass.  Mostly,
  it means that behavior can be erratic.

Sort results and use the "00" pid value for converting test results.
Add $dt_flags to the $dtrace line while we're at it.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/actions/return/tst.override-getpid-entry.r.p  | 2 +-
 test/unittest/actions/return/tst.override-getpid-entry.sh   | 4 ++--
 test/unittest/actions/return/tst.override-getpid-return.r.p | 2 +-
 test/unittest/actions/return/tst.override-getpid-return.sh  | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/test/unittest/actions/return/tst.override-getpid-entry.r.p b/test/unittest/actions/return/tst.override-getpid-entry.r.p
index c838391a4..1a9b7b1bf 100755
--- a/test/unittest/actions/return/tst.override-getpid-entry.r.p
+++ b/test/unittest/actions/return/tst.override-getpid-entry.r.p
@@ -4,7 +4,7 @@ BEGIN {
         mypid = -1
 }
 
-/^01 [1-9][0-9]*$/ {
+/^00 pid is [1-9][0-9]*$/ {
         mypid = $NF;
 }
 
diff --git a/test/unittest/actions/return/tst.override-getpid-entry.sh b/test/unittest/actions/return/tst.override-getpid-entry.sh
index 2282305e7..d9436a532 100755
--- a/test/unittest/actions/return/tst.override-getpid-entry.sh
+++ b/test/unittest/actions/return/tst.override-getpid-entry.sh
@@ -38,7 +38,7 @@ fi
 
 # Trace the trigger.  On the 2nd and 5th getpid() calls, modify the result.
 
-$dtrace -c ./a.out -w -q -n '
+$dtrace $dt_flags -c ./a.out -w -q -n '
 BEGIN {
 	printf("00 pid is %d\n", $target);
 	n = 0;
@@ -58,6 +58,6 @@ rawfbt:vmlinux:__*_sys_getpid:entry
 {
 	return(55555);
 }
-'
+' | sort
 
 exit $?
diff --git a/test/unittest/actions/return/tst.override-getpid-return.r.p b/test/unittest/actions/return/tst.override-getpid-return.r.p
index c838391a4..1a9b7b1bf 100755
--- a/test/unittest/actions/return/tst.override-getpid-return.r.p
+++ b/test/unittest/actions/return/tst.override-getpid-return.r.p
@@ -4,7 +4,7 @@ BEGIN {
         mypid = -1
 }
 
-/^01 [1-9][0-9]*$/ {
+/^00 pid is [1-9][0-9]*$/ {
         mypid = $NF;
 }
 
diff --git a/test/unittest/actions/return/tst.override-getpid-return.sh b/test/unittest/actions/return/tst.override-getpid-return.sh
index 078d68a4a..835e443dd 100755
--- a/test/unittest/actions/return/tst.override-getpid-return.sh
+++ b/test/unittest/actions/return/tst.override-getpid-return.sh
@@ -38,7 +38,7 @@ fi
 
 # Trace the trigger.  On the 2nd and 5th getpid() calls, modify the result.
 
-$dtrace -c ./a.out -w -q -n '
+$dtrace $dt_flags -c ./a.out -w -q -n '
 BEGIN {
 	printf("00 pid is %d\n", $target);
 	n = 0;
@@ -58,6 +58,6 @@ rawfbt:vmlinux:__*_sys_getpid:return
 {
 	return(55555);
 }
-'
+' | sort
 
 exit $?
-- 
2.43.5

