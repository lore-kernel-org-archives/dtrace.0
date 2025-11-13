Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024B21A26B
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762994165; cv=fail; b=E7urDbqOI2la3u9qOn0BRg2lldiHxiwdgbDpN6InrMZXUvJforcipmuiAukG4hAnLuGee9O30fURMis0/atjeI8vM6qlBWBuFmqUS2YTEm43rTDUaCleVSgCa8R5EM+TW7+yXGmJ+duQ7yoPLIvC9+LiQ2ZpqFSE4bMhei1hdSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762994165; c=relaxed/simple;
	bh=GRwQw5MqlwnoliY3yMTqJAnGh4atp/v9lbtqm9ei0b8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Q37NDr/gPXOBWG0fAjmofQLC6SSh05Z+vBM0YviJtIM35bzHfAus4A3xTNPi34wokwqWa+XHWwMg7qnpnnzs50ead1Ao1rxveNM7RvFNEdFDHGyVDCq4fhVNB2sRh2TnJwAgtF6O3DGqwQN+/fwxBjahwtLd0DhiI0UjOAwuKqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=URRF56Vy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lleWdeAV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="URRF56Vy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lleWdeAV"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACNuKGI018318
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=CCwfYy06qxl9WQvNZALpiFJheFZ47xIXg/SV63R+S5I=; b=
	URRF56VymQCbYzySDVehFQY4tIPUX2GddqZSh5UnzDlgSD+0Fy9IFV7hYhlBl5tM
	Eo63RXEuKapQCWTlCJWM5u7UTgerpWGy7BgnrlCfU7u5r6jyu2hHWmLIyc92PDNn
	q1yDqBsrbpMonLUlLaR9QxXTJYPWaU/9YSva2uHwRtIXAncn1V2oa0PgwekUfI1Q
	rg9r2yK6m07yv7CzIWuWqawzY9/V0kP4OysspHn+oPGbDYshq7cigXYPxqGJjsb3
	GuLttY5oJ2M5RQf6vYZSgKjNUn7pcsxfBbq6ITvMra7AztNPDYugQxCq+QiJ8AVV
	O0uFwgFzCR3f40/HwKRqrw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acvsss4h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:36:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACLu5W6029164
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:36:00 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vafg1rb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 00:36:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipLz5QIyLJmy+9hQgO8mOoqGMX+nkgXtrc/K7m2Oni1fIc7MxDWfULCT7ktADSeC/+rXaJOor9adqz9OuYTfk2R27YXsQDHTHqkeDheh0I/Upzqf+EdSsgExvU8TekQhDFNKfgdv6v14gz+Hjn+Tmvc2FKGVkVfVBSOL+2SSUQVQeSw5Coqgb3cFBQfIMgQDA7XsZT7iX7OYy3cxiB9IPNC2uOpE/856k8doCvSPNvQYVI0PlPG9XWlIx1RWBxnnq2XmH/HSCNzK2oEOsVmQnmHEP0tiuxlOhZ9ZpUme10gwFrp/+GoJVLZKrWnvWfmcnBVPV6GuQNHHSQuI96Qv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCwfYy06qxl9WQvNZALpiFJheFZ47xIXg/SV63R+S5I=;
 b=AzDfaQVUNkNGpJu6gus9xK2GtimAa/hBpvsRyrXQvXrPC5ceD6XL0xKXLNccZIVLYKPRhXakzMfYyZ0KcF8VRLsWe9VOuiEAosqQHiaGevZzZ50z2ingFHzF6g9L3JT8xGcd+uamEdA3Jr+r9uhMAWF1s3Jsdh+mAarl1Q9+WSCH2xWwq+0bbMrCxP8qe5S8pT/gkSbUK8otSudt3AkuOkOv+RPxXGVlS5F+htLPK6oZhpKtO1zc/9mlaoWgzxveX9MDOqlp8izOFBBrGO/q8pSGLFdBvzpuquxfD/k4dmJe1LTL1XBWwOz5VrtbjgBLVpjA+Je8Rea+HEQGfEKP4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCwfYy06qxl9WQvNZALpiFJheFZ47xIXg/SV63R+S5I=;
 b=lleWdeAVdokN/VkZ42W2tJYJ+tTPpUnCb/8mD9c/Wv9ooyiRdqmxXsrz4V4ZA/UgILh9HZ5+gIl1kuZQpN3gZTS5+y/k9TsbfwecVeliNiYRdW0PhxSGDZH2z0064IO0k80ccF8qioBgS6yD/MuwBcXtpUwz5wP0DA5vT2woWCM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6153.namprd10.prod.outlook.com (2603:10b6:510:1f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 00:35:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 00:35:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: Skip tst.depth.sh
Date: Wed, 12 Nov 2025 19:35:55 -0500
Message-Id: <20251113003555.26580-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0047.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 377888ff-0250-4cc1-66b3-08de224c9c9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7DzcCfX6iZZnc2+Zo8jBamMq0wT+2PMdwVztLaS2XblLkWlTUr86AzDw7wov?=
 =?us-ascii?Q?XDSNpVwZi6VhLMXJiiQDkLUnOw77FXbXYLszeKeRuavcEGx3EK9WoL5qZ4AO?=
 =?us-ascii?Q?OdJrotaaR0d0ygovRAI8JfJgNoij6xo9SxAR35lB4dkvqNKzboeJC7rwHz/x?=
 =?us-ascii?Q?RGFxIGco/HRpCxXM3PxAkjVdMWd23Mssc76y/fiYf5IYlkyNJ0Gv6jSqFDfW?=
 =?us-ascii?Q?ilwDiVqMF4G+4PX0IOq7V1pAhmpVitu3LYthN2xzytqepPxWkNpbZk+QUylK?=
 =?us-ascii?Q?PYyF3zwUP2hy61gtTpYSJ0gDbXKlecIwZfQvhAnqWZVK6+toVNge+Cfx+7Ll?=
 =?us-ascii?Q?vayGQ8WBsVSZZrg4QRBE+oTp02vSPFLm1ax9Ri3O8YuzRyVP7XHBJjnOUAl5?=
 =?us-ascii?Q?w3bAJlQzueqhjiOjj5FtYjUqsicSmUiUaRwiWlXqHwhOtbGnXM3Wmq33t6FJ?=
 =?us-ascii?Q?a60OGZ6bqjrcdrAmgTO9U9H6K89zOOnFRfUoK/aRVBlJ9YFIofVqH1H4Hk48?=
 =?us-ascii?Q?aK/BGXC5Oe80/twooi7gwgTMrrtOxRO7/Sxl7Z1mC4ChcP//AQ2q6cp9GlIx?=
 =?us-ascii?Q?bvi8/9wSMwIsBvDExrd1zcDrEiL17wTAxeUddBmv2kfDML0AKrseLZe/OBv4?=
 =?us-ascii?Q?NBFgsBBwTXW+YrzR5NU/t5Z34CT1FmG/OsiQeBrOIhc7D0fjpaaiyWMFXeTq?=
 =?us-ascii?Q?CpInLOD5QwzXxZJ1lBwJiqN7dlFf0ejdcQNGr6xzp1ZWxQf9MPMxI8Wip7iy?=
 =?us-ascii?Q?SZpSmWRV5OENmp8BJS1rP78vqNO8/NubFC+cQb3YlKwLSjVY0tY94TisyD5M?=
 =?us-ascii?Q?QoG8P516lx0FSX7CgViV7sXSLQrFRX04fRiGgX89L2xOt9pEvlr6D80zVNhV?=
 =?us-ascii?Q?B6ijBFJtRPYZ3ZuNw3V8RAXkS9cQnjKuZvXJy/vcc5qz+BAJSxBxABQsiOGU?=
 =?us-ascii?Q?ybTj57D6EhKGG8KknhMB4qmiMhaysNpAKkO+Jji0e7EeOj/OXRlu3Ftcu6Lq?=
 =?us-ascii?Q?dZiFgDuQ7HxVZzzzyG9fz0j5qj43hmQMmQEFuKMq5JhuGRj8j+TcUX3elNqc?=
 =?us-ascii?Q?PaKiUzt3brVsiHk0tjGxvB4Pz7LFQQ7ym4uonuymgI4AmJoBQB8xVTu0XY19?=
 =?us-ascii?Q?oYl0BU5dNvKKDz9i5hX9e4RXOTm7RjUT0oJ/YVlfW3sbg+k9saIO6pQ2uLtE?=
 =?us-ascii?Q?rJozuojx1Bu7BbEe5ZSb1Jy8U024bn0r+BsX6R2zg2Hc8mA66XkxHdolO7DH?=
 =?us-ascii?Q?RQ4qYvsNcfAUUsZthZZctqRkS1hKdkakJnJ7he5dV9wlfrZZuSWB9HROW5Q4?=
 =?us-ascii?Q?ty++nN2qcvvjeuqSqSHn5R2veeoNqTbXpYVjkpcjldxGYh1prhwZzC6iO3Ac?=
 =?us-ascii?Q?bbA8eYVpvkbC/O7bnq8NbjBLfRYNGsq9x+sWYQvcwNTnygEVH08oV/URl95W?=
 =?us-ascii?Q?S184LvdztgGyGxIQVV4s9Z+n8H96TuRonQASFHm9V5b/jVCd+0Nv0Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dXEW8tOJZ30VsemcS5v0J1w9s1za28dDFleHfj9+0NdAe709vWRHx+hzmNEX?=
 =?us-ascii?Q?khvstIUZUsqHr5WWX1oEGyKCryi7NhpiaMswty9BYygkXl9vp+TyjYdk7koz?=
 =?us-ascii?Q?NIDooXSkAdZZe0yQTHPv2jCY7wVBOEO/gnj8CFusZUAnidhHBKBZ2Wrw68a6?=
 =?us-ascii?Q?MKlsBDx4QBw3akuO4WT8PiGO6jwIKWMFgxGMrpdUqhZGHvVoRDBWl/hvuRts?=
 =?us-ascii?Q?1D8Rp4W0nh1EVKiNKtp3YKn72CE1YRjxXOJztKAiLszldvgR6DIwj5jztEy8?=
 =?us-ascii?Q?i3P46bc+ddAZHCt6pGUmnbnt5hiM3VIOvpUhMYgUZX0bEa8+JgQJHyQM2xRr?=
 =?us-ascii?Q?0HPuizsO3lpgb8bg5XtW3ssWBRxQo0SkS3Pae3jdDSBQ7iYG4BTwg8Iaearv?=
 =?us-ascii?Q?wmBBspegs4RXNHypbYdTBL38oKQLexonO+mWdOon+a8U24WTq5VdFvVsRi1o?=
 =?us-ascii?Q?W0+2PBPYmTFHKCJiK77Dy7cBKFAUeEbljqEJGMLK0M96pH+Qm59tXl1ocEcG?=
 =?us-ascii?Q?s2iHhAXQ6shXMS1vEQBEDDp3R2k7tSjSVogTYDRwJNRCxkddvf38DcyhNigC?=
 =?us-ascii?Q?qYODjtnO23tPbXtWA/fQfwUY0SAe+OC2Lo0r6deCmphTezYZsuqzNcv1/vA2?=
 =?us-ascii?Q?lI1xG86IY2avQHA7Ks4d8CAkIgDb3Vf+ah3M/bB9YbxFtsHhcn6sQSQ7VEhL?=
 =?us-ascii?Q?A9HDfD0OKY+rbtCw/AInvBELk2Fc9ak4Cqq2a2EPRZaPy/6lcZyCcA/r3LwP?=
 =?us-ascii?Q?chWkCcR0xefW254/PQGpXBr75D0HCHIHt51BN1si7jKJPyMmX6BB92DyaX8h?=
 =?us-ascii?Q?A8Yj5V7uFlrJYdDODn3E2XqXh/zgSLZXoaRWusoe9X6YZQLjUgU9pVpx0dNm?=
 =?us-ascii?Q?0zRyvpSjuwBaxLNhfld4UAfgKi6Yr4bSnDqmVy5oG1P2Vx9TDtfUY3x3a8Bb?=
 =?us-ascii?Q?i992DppIQD9WaESoCa2l1HO4P7S/cvytJVhPi7YjHSx1aiimmuN+0TvXoGkq?=
 =?us-ascii?Q?J/rd6qG8Xp9iMpPonPk5voVz3sF4fxbd2YSFnFhl97NKbebch2TPWNhkDTnq?=
 =?us-ascii?Q?28/RujjKwP48nPZm8lhtOxNsyzZ1nUIRRhvyLkkOwKJ5dx4PR8eE6oP3Slxy?=
 =?us-ascii?Q?HEZgn3okqd50aI/0YRblerIT+ro5H5wdNKCooid/SztV6rz9FKri/b9mzxSe?=
 =?us-ascii?Q?fsQjRDNZtFN63x7NPOtEM0YG811lTG9/j95fnLLda0NjbmlFdBL6fmJkXJno?=
 =?us-ascii?Q?XrtXEBUsrKro9j5tcORA+ljKE4h6eE7Ggd2G1k4EnImjtKFHqfB6wVHiE0VN?=
 =?us-ascii?Q?ehhrX8shyauIo46SYjo2/vtpdqZyFxB7u4IueV0WZfrap69p8z6HQ9LS0L/J?=
 =?us-ascii?Q?L82Lz7WMB/Sq+9k3rg1UHS5NzhrOcHaqhFKqLuXhmGqKKUAPhhOMiyl92Xwp?=
 =?us-ascii?Q?GrgjGHmZPTaQZMTjet385Ivscu0/E3AvpwyugGzuHXTSgL18ljmONUGsRsKn?=
 =?us-ascii?Q?LABwgQyBohMO+VZMF4+rSvJI3R3SMHVGPgnvUymNlSXrYDvfxldyQrVZkuAh?=
 =?us-ascii?Q?aHKms1quPFoRWBvhqwrLqauJ5xV48efMB4rt+SPD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t5SMnPnqHMMRd9jzPnNBhtELzlxFsi6i36PlEpJS01vGItsnMb/cRE6kdV/vDyYCW1zBKPezc46LAElGSTanLjFMX/AlwlEv6Yfq2fsBspEIqaGf8tkIiPhxLvX2eroH+Xlfd02/51D0evUy/F3XD5LX8jyz92jHfKSQ9qaKnDh3EH7fwsJ1KFkBaV3qX/uAjB34w6oFf7UMJhXTaM4ZMwzmEIJ4AYmrEQEjkVD7UPWMgd+WEuv0OC4Xx8jrIXdH3mciGZstnPzqrslv7RopijWFezcZD1cW//Bdb8AZGvb2qrxVP1OW0am48O8QCVlTmfCb7O6Wye5WK/Qas96s3kPY/uzHuuHMpHSywiGFYDLKl8YS+/+FM3znQ75O4J06NjGDOI0mLwKICGay+KQNoqfUJQQAYfjC1tSwgx013VBVyPuWrP+JAhiClPrSxnVBLCL1n4HyFIbpUoTNeO3L6omyV0MLzki/nVdTxrvChU71uahy/g/qu0Gqi10hcomIrDWQAh3r+nizOTNKfApgN2zh0S+WkcI5u1hL/7NalEMY7hT/3rdYwM7B3fPHB2/1KKyD9P0jBA62SJZ4Eqz6XFJGxdGtUvCSnZ1U9ifgkZ8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377888ff-0250-4cc1-66b3-08de224c9c9f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 00:35:57.5052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gp8XmcEuntdlVxT6AZQSuzafkBseGPDm13OGYeMYMGw965e/DUQR+MalZzfSADTWEeNjSbqqungVxBtx0XvC7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6153
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511130003
X-Authority-Analysis: v=2.4 cv=bJUb4f+Z c=1 sm=1 tr=0 ts=691527f2 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=e6WgNHw0UpcQRKbkQugA:9 a=8Y6zDpjSdwQA:10 cc=ntf awl=host:13634
X-Proofpoint-GUID: KmMTE_Mxw6Q8UT1K506OWuB5hgEX5GTN
X-Proofpoint-ORIG-GUID: KmMTE_Mxw6Q8UT1K506OWuB5hgEX5GTN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMyBTYWx0ZWRfX+qqmbiKPFSkn
 tUsqN+iAuYVc3lTgmLOfp9264h3mfXPsaCTjaBkZaV7uZr2Xw3etYHnLqFGBXkYIrobxZLuCzZw
 lu1BKuyjI5DkCXI1AcHN9Ye/IBf0IPsT5ZHzQaxS0VdV3kbR5HrMw4RLPYQJOHFijD1Kx7x8JBq
 6V099Y0kZZrdnwQdvCGIPJYrVvBze+H1Cuk0cYMAiM8SkdO/yM00MEobDbwirXVqBzWOJMueoVQ
 8Z8+oeSDvFPigy5Sq8GkzXZMbdlH1i/IFbAu0XX9F1P+F1Bg70lk8jLuGyfjeHCZgwrdN1qzNhU
 0Wdtap8BDJ0/Dxv6j2eu0rilvJb+jISv6pY5+kDFPec80QOHpoXQxZKOxcRPJ5xKyLoDc7yf8h2
 xn4ylpXtI54SuJFCacnaZiRANGDxNhGHnHNxCp7vV2s6aItv4Oo=

From: Eugene Loh <eugene.loh@oracle.com>

The test asks for very many pid probes.  E.g.,

        pid$target:::entry,
        pid$target:::return,
        pid$target:a.out::,

If it is successful, this can wreak havoc on some systems, in some cases
leading to 1-2 dozen subsequent tests failing due to cascading problems:
poor test clean up, triggers left running, persistent loads, pid=0 not
running, tests timing out, and so on.  These problems require
investigation.

For now, skip the precipitating test.

See
https://oss.oracle.com/pipermail/dtrace-devel/2025-November/006916.html

Incidentally, there are similar issues for

* test/unittest/pid/err.D_PROC_CREATEFAIL.many.d
  but this test is already marked SKIP, apparently for the same reason.
  See commit d9423bd79
  ("err.D_PROC_CREATEFAIL.many.d causes failures in subsequent tests").
  The current patch simply seeks to apply the same SKIP to another test.

* test/demo/user/userfunc.d
  but this test is marked XFAIL since it needs a trigger

All three tests should be resolved when the underlying problem is
tackled.

Orabug: 38642080
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/ustack/tst.depth.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
index dec16a3aa..4a67291de 100755
--- a/test/unittest/ustack/tst.depth.sh
+++ b/test/unittest/ustack/tst.depth.sh
@@ -1,10 +1,10 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
-# @@xfail: dtv2
+# @@skip
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.47.3

