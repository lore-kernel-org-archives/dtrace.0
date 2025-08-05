Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED65CEAF9
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 20:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754425129; cv=fail; b=mx3aW3NTeZg8Ju3pXnda1HNuMrISi0dpsuNNEDE9s3VCc44UYsT/5gi/cx19wYyao+LEP3ZJ+2MZ/1cln2EiNmyeop7RafqUiB9BapTXGvLA+p/jAHbCqY+WjEaLwQgYVdz9Cf+Td9r5roBxGaXK9+rG0+CmcFdchNif7CqzdH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754425129; c=relaxed/simple;
	bh=koNGlK09BZwbpYaAZDeEPoGOOlB0V65q2p2wut8S+vY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YMUWH1CIaLMevdXzmn2DpD0IIt0Uz3c92GhVvflhDnrTWmCBImnhEM/OJAo+KrZYdVBJJT53Nc/UEgh4PIUUvgUu4dj1smeGHgo8GPPvHoVq5WRWLAUjlQGDupZXkwpfe5P0BHK76rJkP+4vLfKfhgMe/RsS2+MuaOgP4RHnjs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kQs04kjk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d5um+VwB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kQs04kjk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d5um+VwB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575KCDPZ006261
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 20:18:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=CNxda7KYc3nLm2AEXvPR4wtXe27cd9bJ9vFWXyydilY=; b=
	kQs04kjk4A4ysLDvYf6gSxyxj3cPs1QqUJdyV/5Fz8m0/IdLyPcy7qB17WtjKd/e
	fJ6NMsIV7s4ZK2xN4klUy5tWugvvwD34FXXVmsZBoHVKcnNLIu4Niq5mkRkT4AC/
	drQeY26GVHHtCKq693/5g6Zgx0EL1FUaKqBblsV72IGLZcufW6Jl3p7Dq1PLsgeE
	ZR/cyz+MtpE+yRzHndMF1F4USlbVHpo9w+x0TEuqOfz3bCSpj14V+nBWrchG1jK0
	vXPlKOgZepcm/x+SFpdWBaRrkl2diPAg8ckY5ulAoPngirUzGgt3cRILLuSykRBd
	eDv44uSGb5WPjhCFA4/ErQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpve08gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 20:18:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575KHpl4016011
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 20:18:45 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpww4vfw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 20:18:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBJUDrRqi96XQHGJhDSjqsqpGMthzEAZNURMJ0IfBdi9S1mGuUxYN+k6n5qCs7jK0A9rwh0fUyizBYFy7yQq/SbMHYJ2aZTAuFy/faxXFK2uTn3HRMBNcj8ri+fkzKRnUieYw72+bZbtrFW0ll2lFkMgtmhOrxmXaP32ef+AE6p8wp2h8JqHoelDKaIJCIFg+BcOxb8QTO1z/9AwnYBu+CkJPr0uuX7xz6IuRc0D5yvXHHNpSxvML3U+8bKo4iepnaYeZ3rSJ6oU4Pjyjw4Tg0WnjUErO9UmYVnlsbwQdo/3VVJtibCdpw1A1f7VlNCm9SDFxm2BmNppZia2p5iLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNxda7KYc3nLm2AEXvPR4wtXe27cd9bJ9vFWXyydilY=;
 b=Fu3OyAQ2IvAwrd29NjGZifEfE/rRaXnSZ6GWcy/VilCZIK2ZCCzce0fKbXa3GyOgF00iDPBUZIxvZdEfhuxPpb106lVkx0LmbDcVpmyGNUETVpp+N5RSFoar/4zhCT4jjaeQ2dp9kxB1WaC1ThLNBDFmhC89wQWwgbaH6HjMKaoHV53h0HsB5L15+kuYA3jE9Q2sSq4uJ1tXQnnMjMNeOAkZuS83/NnQB0gtquaoKRixLrnP8NdV2NOMtGoAwDH2E3DotdhHcFNy4kVPulmU3QMtyS2m8rBrfrzqa6p6zqx9HiBuu1+hYIrQhIckIuyl/OJnhAoigJF4jPOxc7gnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNxda7KYc3nLm2AEXvPR4wtXe27cd9bJ9vFWXyydilY=;
 b=d5um+VwBqFXS7KPCzT+1EVexRI4bVJAq92v76DTn4C51y3Eo7qeGTiY90062NlNWGCyWiDFaBSv5TE4m0a7LegOZB2yHO6g70LfpaoZhWQO5TCOU9ZnIM6RzhPyd70yojvLwlsS0sJgP0tdmZxWhT2B1kvJKl0Ee7ZQi+tA63NU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB6365.namprd10.prod.outlook.com (2603:10b6:806:255::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 5 Aug
 2025 20:18:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 20:18:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Add tcp to expected providers
Date: Tue,  5 Aug 2025 16:18:41 -0400
Message-Id: <20250805201841.19694-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:a03:333::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa7ca0e-94cf-4b94-6929-08ddd45d4648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TVgStNGFszJeBFT9B2iJzNSfi3kA9XhKhE00ovZ/My+4XWKMXrhi+aq4futV?=
 =?us-ascii?Q?2M3Xvl+RvU0BfgLn6fd0zLMVeRfyRSD4m6WwTL5RQ3GhAhDy44WKljHR8ZX9?=
 =?us-ascii?Q?US4JUgObFgeTY5gEcEY5l/gJIfdnHf9yKFCkQ/2GnF+QfBJ511ytkngO1dKe?=
 =?us-ascii?Q?80Ng5Y1ddEavvwYDylYPvdgT9mbNBF1oUNhX67KBYMzDyixiMm6CADYsFqjy?=
 =?us-ascii?Q?iQRkVcIHa4Phu+vHiuNVHTEBVyHF18ErIt/FCquc5UuRS8Vpd1IRhCP0wDKG?=
 =?us-ascii?Q?Talig2ozrPXEBHbB/HF7ZOZWyR674Jcn7Gn3Zd65kbosBIUSE8Qkt4JLu6oF?=
 =?us-ascii?Q?s65aSa2n1yZxj2AMgNct89S3DYTLLVY5IMaWo/4LDi3fbvML75CuIG+3Humq?=
 =?us-ascii?Q?RTrL0TWTcng5tcaQbzQcRv+1Ssev6IckBFrFfYwUnvkJde+XN3WVFQQANFNZ?=
 =?us-ascii?Q?nYs2ZJCiI5Wyw5EfWddx7rDNGBsHs3d7lvZS7CzBKjZ++ix9k0rpjSpHJkkG?=
 =?us-ascii?Q?95WWn8oN9zNIcfNzX21jTSnyJdtp4WIfBMr/SQE7F/8dnysUXPNkVIg4wLb+?=
 =?us-ascii?Q?cC1PA0AK+zJgCJG4pNKXT2osVInPne7lffSybOXTq+Oscfam+SEuvYBLUTVr?=
 =?us-ascii?Q?w+cYoeUO1Z+gYSwqPLcs6E9gU/8wLnPlDi+r0NhG4fdcyHU/DZcXU4s9sI4Z?=
 =?us-ascii?Q?j7iHWrgq8wug52vK1E71RVpy/2KSKWWtnNXGdN9BExtg1SBoUjLnwWuEAME6?=
 =?us-ascii?Q?4JK5w709aOYkDUUnHMc1IINaE+Hg1TtVdpPqaL/wD8XEEmcTxwjJhBbS8/Q2?=
 =?us-ascii?Q?Xkh7/cvTbCgXWm3pChvSsRfr8POsrwjZoE2jukeFNNjZ9coCQ9mRDzyaKLi1?=
 =?us-ascii?Q?9AwIwpediSwYlZWkBZk5wFMBPitXYFkj08Ds0MNUlyRdBAOsi35P4vyU7tuC?=
 =?us-ascii?Q?T1I6FraXDDBCGBQD009XYdBa0bloiM6JtZGLD99qW5GbS3JCMdKRYPoOtPfo?=
 =?us-ascii?Q?EG6OWvD4iCeVMcPOyw3oFpHX4mSeqOKZ3c+kS18XjfHqk8yBw89hzbt6c6kw?=
 =?us-ascii?Q?y6SNyCN+gEB07fEWRaak1XtHfsCmyqNUfBdcbNX/v1eZosyJEHAWIROVTLM9?=
 =?us-ascii?Q?WW5qND0YsHjJhiabxZ6hq8TwX+Dw5c3FFDSURbVIwoNjgDDHNmleEhCyfMNb?=
 =?us-ascii?Q?XJ36+cRTVu/aSeiIR3Osbt43BvahWbBUo2XqliH/S07LmTXTe9vwR3hHPl45?=
 =?us-ascii?Q?rcu+n0grHJCfxxkyCw9m7yewGDHKjMcHkQGgNxu22DD1kh9bD04VdjWnsf1w?=
 =?us-ascii?Q?ewUG1LwR8pB+99D8wLihidDBQAaqGbCwZB4w5wOuoMR+1vdwDYAYGt5gupRo?=
 =?us-ascii?Q?yNYhPxYi8aRDC82LaFxh+KwWFhq7LI6vQ8+POQMkuHyi0rONzWv6cdUJx8gS?=
 =?us-ascii?Q?H+di75sTznU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mXFe3+LYVKYIAgNItWEvSofjOSkudUuN6a24sy9kJpK1bpXECANKHERJzOFH?=
 =?us-ascii?Q?HTr90pR8SafLE/MdHkucpZqxmHxts0tecpUhpTFYdp31SBreVAOntNuSvHUn?=
 =?us-ascii?Q?uYuhdU1lj2/x12Q3Cgcl9tSZQeELTP6DJilh1Vud4515f8k2yEJfbX3Cprzy?=
 =?us-ascii?Q?2cWBnWcF+k0jrEmxkzZM79aAKaNmW4k2PmDGtykMMi0iEFHN0+ig4avt3XcQ?=
 =?us-ascii?Q?AW8NSDkjAZffSi34yO4pfXRGqIOhKHwdQ98CYtA85gLUf25lGv85T3rg7Ie5?=
 =?us-ascii?Q?2bdBNnPLZNQCG9Z+px16aVz6Wr9L5FhVKY4WmENXBPsdiv9VvrtfvObga++w?=
 =?us-ascii?Q?wZGwy78Gv+I7j9/sFl8kAPAPWlOH1pv9rlpDx97bQC7N0AVcvtNaS+lbW7x5?=
 =?us-ascii?Q?jC/7IvoDWWDhXVHmW0CJ2lUIBrhyxkszO/7QYwaXf0k/4aNtQEhodl30rxFK?=
 =?us-ascii?Q?nZy8K/sInFO/1EDr+DeDH4NmpPEyOeGXD8e1wEh/I+dfTgO3RBfAodNaSyHJ?=
 =?us-ascii?Q?CpBnC9Vjm4WZ2Dnsbi7Smf9yH413uSnKNyZ3Nf1P9VAB45xG06RNKCAcaYNa?=
 =?us-ascii?Q?xzNJHgXTN1QpxcgI5TpXTssm4rPugNseHPm8Zz5nFEKmTuT767CJK/vGNinc?=
 =?us-ascii?Q?w14ev3T2BScELJj6YGEZBpe+zNTuJxK6ueYQNraU8raoDUFzJn4kZNKdK6se?=
 =?us-ascii?Q?dgJtv2ufF+GFRUevqlMdc4uCSqLKDcy+OO9rudtztb9rL8GEjl4A8I+3cDFO?=
 =?us-ascii?Q?z9h7ssokGwVznC2Kn9+/dYY+VR5TuywqKr1Ptp0maOoA+5Rn4pI7seHuayeh?=
 =?us-ascii?Q?j9z8MZUDqjZGs1TIsTNKAtTec95lmHLyjC0UMsinfEPL3io0ZyyYqiP/RB+y?=
 =?us-ascii?Q?ZyWgMd8+VcJjpocpaMsQiX2HIqy0B2PoYG2z23ffLsHtuAuU30gs2ZCTvwHN?=
 =?us-ascii?Q?Hq3os1WOFjpGmgZDvi4uPcsnWZYsWaEwmbu+5lNvrd4cWDDZULu0kQguC5qD?=
 =?us-ascii?Q?NVPJZTyEA5K4k2DEpPUi5Lqtzea2KGjlpPsYlIaLmNyPGveMjUlx8psa8D17?=
 =?us-ascii?Q?Q3UbE1ayml20NtCSVunbCTrRBo/6ROSMJatBbKijO33L+OIKb74avhvRV4Bu?=
 =?us-ascii?Q?ufcwacMPxlJNwOdqAfGkJioo9QqU9pmW9IDOYuSTgHsawQttF31oJum7jIoE?=
 =?us-ascii?Q?DQ4oY+X2xLM91xQNEooNZkGJ8DY+re6J/AgF7NiQWlDUUQSRuID3S1OVlfoY?=
 =?us-ascii?Q?HmoyZEu1NKNuGxO0nB8x+5ttNu+AA1WhhHxYa1PASajzK4V8mLxI5IuyhixQ?=
 =?us-ascii?Q?pFFeLsGW4hMIjpjJCV7I5m0b717txiaw1lSAWoob/Ha4lmlsvUcU77jOudGQ?=
 =?us-ascii?Q?JMUVf46UC1mc/H+jBWZQcQmc/zYwsNRiN/5iw5il5ibUbShI476ScR2vSej+?=
 =?us-ascii?Q?FtYXRumTCa+WwY1hayrbheKARbzZVClryMc8MB8RZLyJlLI9CSF5ehOdp4RB?=
 =?us-ascii?Q?pblydCXqy7PLAbMFpQHYuH8CT02Sg7NCWFp5lttcCc7RagrMqj2f6GLeVHAB?=
 =?us-ascii?Q?J6qMp8slBpDsgPx8wRkTnonQerQqwatRDS2qGKMS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y0nvzIk4iYvTqRVNPggxngvRGVEE9Ba/niHn0lZp5gpquDvF7KDfcohMNxvacMgvu83uQPow6XfVO1wVxwsjT/Nntr6MZPag/aslfG7zVrc2esc2RVyJyFA1DT8jHszt1hnxmflo4iYv63FGsuqIb8T29x4trP8vhnmLuTD9Zq3qEvnsOWL3bp6Uhwls+atimZSAa5Z8KqBBo/yfTdI2uDKd7RzBYaeTPa+MmnCVo65hyVwcDFaQjEGhUqLweS8OWgtuGiY/M+BOxtzGxdf6GU19FcrYH35YftFW1VnllnRROBew4Rg+mV+Iot3XP5gV/GclGQ94KyIV8Plu3Sy7K2YloAxoCluy1d0crA71Fwt8bIIVh3EBQjkLIJBdjYdIfpok0Fzx0zrvQiwizlfHzFoEx0iwehg1bNslRAyqGOgwDoPgCNlyIXQfGvK9xx9DL8nUxOVHrMuYFEhUWBjgZAcRdKP2DUYKVStJuV8qRBidrhHdIpOjqI1KPfYrv2qV/saTneRKyP/y5vN87XSkRAX3SP1gSy0mrPlAOoM/kAt1nU8aJjr+V9ZQXfuXeeECn9M1RG693BExQRy24Mae+pqlMR0yKVeoIdmwN3qdQ5s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa7ca0e-94cf-4b94-6929-08ddd45d4648
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 20:18:43.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51Vd9SLg8PzNVL/XT0V/HJJ/f+Ku79RkZto0yHBHNzPANvSHQakIbyW2Zk5tBYbb2KSwZJqDaO3KiMu6Iz/DKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6365
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508050143
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE0MyBTYWx0ZWRfX2Md5aWxbNvHN
 zDGdkMnIOV0Z1GB9a4KxFx9bXxpEE3b2bmSARaFw5ILLDKk6NwIvJMdIVHjU8bdAVpaovNuxO/4
 WNbtMHucX2rcvNeUP0VB2fHSyYaTqpkRtyU+32gwLpyyPRgnJp5Mix2GOvspDLBcHiKjQFWm9jO
 x68xVXoOmD1xRerPVt/3mncPWeg04Kkm24FmcjIbnfX39zQ0NKqPEq9gCqyzIJoMnaRo+vISv5d
 M4g5l8uv2XYLoEmib9j42kr7QzMmTeFN0pIv3TRJWPS3GqRZFfVBQyjClWRhjRW6Xz/u4hQzbNX
 Hwbb9x4z6dtbAkW/dxJSkkS+vRL5IPLT1T2n5QL0tXPQ7dBFkkye8OqRQ2XoYxB+zDJs3NYXmP2
 0y4JFLRgm7FagKrJMCU47C1poO5++9uCh+juo20NFd6VgCuQTXTVcweNdqEaipmI3Gamc1eW
X-Authority-Analysis: v=2.4 cv=ApPu3P9P c=1 sm=1 tr=0 ts=68926726 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=c9EQlvPHIUlzYJJUt-8A:9 cc=ntf
 awl=host:12065
X-Proofpoint-ORIG-GUID: BXSCXoa-JzMc8A97NN-8ALO4J3pW2bEW
X-Proofpoint-GUID: BXSCXoa-JzMc8A97NN-8ALO4J3pW2bEW

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/dtrace-util/tst.ListProbes.r  | 1 +
 test/unittest/dtrace-util/tst.ListProbes.sh | 1 +
 2 files changed, 2 insertions(+)

diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
index a04669843..ad557253f 100644
--- a/test/unittest/dtrace-util/tst.ListProbes.r
+++ b/test/unittest/dtrace-util/tst.ListProbes.r
@@ -11,3 +11,4 @@ rawtp
 sched
 sdt
 syscall
+tcp
diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
index 84f363443..a747a0458 100755
--- a/test/unittest/dtrace-util/tst.ListProbes.sh
+++ b/test/unittest/dtrace-util/tst.ListProbes.sh
@@ -69,6 +69,7 @@ $dtrace $dt_flags -l \
     $2 == "sched"    { mycheck($2, $1,     3,     30); next }
     $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
     $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
+    $2 == "tcp"      { mycheck($2, $1,     8,      8); next }
     # nothing for usdt
 
     # Unrecognized line.
-- 
2.43.5

