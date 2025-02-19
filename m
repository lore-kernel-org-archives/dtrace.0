Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBEE1A841F
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 21:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740001912; cv=fail; b=YImF8g5HVyai2iPOq43aPS7wEAChlzPNNy5VyjXR48TWu2ccCifQNLFddVwxBWqLDxY++3Ki71x/vwgDJpqOBkqiVNmMhhs/VijaQTq1ary32oYxnfeCUYrbRXteGv5VtRiKXVak3dnVFEHFeN46nY9TsGsNQ/mKSFvDUnpQoYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740001912; c=relaxed/simple;
	bh=MUHUSSUrwmIBKVl76mpbcl6ZSBBxqhWwAxZlb3w38+w=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mftjODKfy69iaRW1LbnICoMqcQ7Fytt1n/6iv8AwC9csNlFw+TgEGZ9c2x5Vy6/FaDfSvDYw6I4YpKaSB4t3VkCXm5Um9PTVGYUBZzhy73eQBp9xjqm/gFypEGv5fs0Lvt5xT+C1UKnf8Qbeb5EjlFEVMMgDSc7Qhxn5RcK7o8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MG8zEQsp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nGxfvQyV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MG8zEQsp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nGxfvQyV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JLXWnR024793
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 21:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=3NwESfxDtF4OB0ktejQctuwFxDTUOiWA1psUFQNsiYA=; b=
	MG8zEQspUOyn8CqLSHPPpkQGdjfbiOWZcDKszydbzc3Kd2exSav4DUqC5+O0u387
	aUpJ1f4hMhAL19DEfwHB4AsoawWa/w6g8iqEI0CmYtW4ZFa6c2SXE3VL/66PNhIj
	3EKftHxNZEPC2ioT8MmPgksZlHHcfatiWh9fNhxQr8YPPwhP/Z0mcqEgcF9ygGnI
	kT+13vgYT7+j/mcUvPNh8x0mCGgdeLhQY1qJaFEYrfMSThDTVtorfze30z/WqnTt
	4hn4qTSty+Apr0dKDXgT3nBQohEj3+EUJNTlxh9Sz46kkoGZcZvYgD1dvztorlTp
	uFp5lYK1+LICcx33xL6ekA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w00njthf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 21:51:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51JJsaQh009743
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 21:51:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44w09d33hq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Feb 2025 21:51:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/VWVeC1IsdOzE4R5r6EBzZvJSEnV1a2UIyPhfggBfwhs172XjsxHCPr2OqS5IVAWe5bQsD68KeOpej6gi/z2Tal4aUDoAMc8fy2PqiLkpZU78m1IF9/C0NocA9EnnxhPLGP8Qcw7oAtiOlImMsiUvMOg02GrAtW5dCF70COWzdb9miO728ZRH5LG8AULZ/Ro/hTd390lnU86du0G8KolzCqBidGSebvGjin/gT7M/0d4jQP4cawsKcHNnkKrcEz9qze8Kp1XJ8iCiuCvv7oD51jAcEyinYs1vxF6M/6Wo0UdWF4eDHOfEo9lOFbYZTDQNx80ru0aj0RWudqbw0ftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NwESfxDtF4OB0ktejQctuwFxDTUOiWA1psUFQNsiYA=;
 b=UZx6ggxkoczYvvVCNp56u0knAF0cUTwKlTOdRi3lPm+ycxxo8j9uCrvSlD7U6PgfhNROjvK33IlvziI+UHo13kLs6Ol6IFZZ7XvweHpl411yyANsHBSbtT/Z/xxrvxCQ7D/CrmH8RhnfCJMbPfISB6IqeyevxIy4gAFdrQ4+kL6K3OCLoeS238Ro/8z4b1HZR27w/pjdRLju/xV5UWo1IzuoRfmnOiru4WKxcyDjsCmbHbD/YCMMEr0oOP/e/EOQw0PNm9/oHsowkSgdCJl+/+b1xD39snQnDZgcr0GbGUzZi072kSY0sSpUhKR15n4rp8+nVJbAHsFT2W5UzK7cug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NwESfxDtF4OB0ktejQctuwFxDTUOiWA1psUFQNsiYA=;
 b=nGxfvQyVTINvaZPbRR89lfFbT3Q8mEabVEdVhyYsEacA0DRyiAnP93D1GBGi65llo+ciqk9lnJWUC1w/OnnADwRZVKRkR7jbKWnIpDHiGJVea/3B2EYmpyjwu+b4GgHqwCUwwqyXKF6Zl7Dv5MG472dqlfW4ZClxVsnrmr8tOgg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA2PR10MB4475.namprd10.prod.outlook.com (2603:10b6:806:118::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 21:51:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 21:51:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix fprobe/kprobe selection
Date: Wed, 19 Feb 2025 16:51:42 -0500
Message-Id: <20250219215142.10568-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN0PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:408:e6::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA2PR10MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: b312a069-8826-4d58-c145-08dd512f9ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eFD12SB3Qc213/XS6KVHI72c2fOcga/xiGozPsgGel2qli3s2pFCfAzXWZBf?=
 =?us-ascii?Q?BU0NvBpRVytUJF6MUclSreyQ11USPkauqIIV8x7yNBUKL+LIcLZQRUdNADWN?=
 =?us-ascii?Q?WjwPUB3nGf6suD7NCXr1hgVEM8iS9qPWDq8DNFTSSmd6XQqi65smXZ3m/lkj?=
 =?us-ascii?Q?qi7riL1fvr0M/7CjaJwyS3gna3XVoEyCBjtvUi4RCUj3kKqJwD4ZgZHGLNB+?=
 =?us-ascii?Q?3uVEULq96LGu3sqAOFaJN5sieHXJiYZ8d6tJB2ObGHX5uVb5qXge23cOBi66?=
 =?us-ascii?Q?IsmgPJ2dd4FnVmti7qI3s+48OMxvhCLzhJlIMl8V6w0iwctkFGrTMfEP7ehT?=
 =?us-ascii?Q?O4gucxi/jOLRlDpKr5FJh7Kd3sCj+lCdKnUzgclxXzYrhvwEldygwsTMY18+?=
 =?us-ascii?Q?cZymPAOVis17yRh21lMP5eIqGm1dFVMcSvh9f7X34AO+osErwrzVuJTeFA2n?=
 =?us-ascii?Q?a+WSBR28Go95tnbyPkH4wXw5diunqf0238vXrQnrhdCM7t83yrnqAl/MiTyr?=
 =?us-ascii?Q?m1sNfmq3O8YHpyj98FeTZpzAqbL0JzDrQqKDVZjfUtUm9nSFD7kj5tTFHlpc?=
 =?us-ascii?Q?lCmdKbZr7l001jkBd4NKOb84UJGukbQFuudx2KZsG2qk1WQW7fJW5ij5kiXo?=
 =?us-ascii?Q?AiHm1QlLyzzimkB01sM/FHPoLlRLgq1zfM5qlnAD0IBGY9bzHrH3u9EshWob?=
 =?us-ascii?Q?+vdpKN19gE+XLcRLfifjTon1415+2QjHBe0dxGj+DuWR8ZWgG6hvjxbPYRWU?=
 =?us-ascii?Q?sFLiHsnyIIcOhtIOVAllworxkCqSlA6lKG/nfoB3TmvQydOAayXvdeT2nHF/?=
 =?us-ascii?Q?QUnkjdq4ct3SH71uBs4zjwfHRlOl6gY6HptrgsKSKw58ML1Q4ReiO1v1YOGj?=
 =?us-ascii?Q?Np9vVZXNHI/sh8DPpzdkNHHULwFIA5pYsoVm5l0K6Sib8kA32FMVWOFnBvsg?=
 =?us-ascii?Q?gaW92MQ+yvkrZm+hKmJzrK1OGNWPp8FEIf0qMVVsYsRGp8fKf/ejkSHWTxxN?=
 =?us-ascii?Q?nL8uIGUvfhpoXPJwHu4Ak6WpbR9cNbqjZtKV92TuFcy7h1Ykbf2swZchIS2/?=
 =?us-ascii?Q?Mfbakas0gnPt1TqppvK8A4ZLdzNbe+Wv/kKwvQA0bnBherOxll/3kVo2gtK9?=
 =?us-ascii?Q?PXDKfCWFiJodr81ilRpTXRypjp1twY91BU6ZkJPmvwNHXSR8Z8Wj6tVm6NOJ?=
 =?us-ascii?Q?Sm0lHxni/VUO76F4ajRm7K4cSaZTrgaWcgy2sri5qtAf9Kk7r6XqIFBuzQb3?=
 =?us-ascii?Q?qfDHkIKmdogIsD5rCQlE1iII2U4PxMQl8cSsHm0FSnHcPtG1sXoCGpl7377/?=
 =?us-ascii?Q?poj4CSFKeAizJuikqUVOAv0vC++HOgV28AIOmKlztbyDfT9CmYGADWpJGUPw?=
 =?us-ascii?Q?CAu3GrzS863i15HA5FWvbMJPDYqC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+hlvn3TOpTsAprth/ZcOnRtt2xzxjspPd1Y0acMrWLt8Jkw9lQV8BLQxBnL?=
 =?us-ascii?Q?d8Nl3XK+w1PJUARFHkBPl/KiaemzfYwDFlhabzrOkkkxzcBfPoQjt/IpHmP2?=
 =?us-ascii?Q?vqljm3Xkf1LTBdsIUa8yG68c96hMPzilxzL1En2Tcd4mOiWsvFmwzt2/zlb7?=
 =?us-ascii?Q?/cUujFd5oDlHSYhZqt7HDmVYAmwEHv5TxyDDXfFJbZGmT+lt2Pl02yJzlmrM?=
 =?us-ascii?Q?iKJ8aZ8xmlUdAD56eMPIfMey1D0OleuxYQMAzftxzWx+qAj4eQSFC8l+tth5?=
 =?us-ascii?Q?J7H4DHhGqqbV+zi6Lim9szc6Zm5QPJPXFYx8Nn1cNRcs42yXrUkMSYAV/uLC?=
 =?us-ascii?Q?MxIpEnJ9yU9C7/RassCkVL612FE4McZ7lymxlpNDGD0cqh5qvDVc+2Yt1L1N?=
 =?us-ascii?Q?9HGehcQwXwanl8F7COVBlFugLkNkrFv0yhKe2XPARxZTahVcq6yM3+JM1Z4w?=
 =?us-ascii?Q?zOVuH2pSeEQmjm0clk7T/Glt0ZHjFME3BXP/lrYx5AcAS70m76jLCSVFSnbw?=
 =?us-ascii?Q?AQPDGOK43l+H9xEpxHGBQJIziPegNZgBOB1NgQldzW/XufXKVKgcrdfSe8pO?=
 =?us-ascii?Q?GDTIeld+LjtJVm+Ycoda7Gz8b6PRmeJ101HvLZ6vyGtjfw/bq2H1sdY0QVwr?=
 =?us-ascii?Q?auzoQPBatOsqSVNcQ68pfziewYdM9PyBG6pD2cwyidVKBYUSArLGmKWc6jj6?=
 =?us-ascii?Q?/8zdJrnXazhFqd6WSUJNa8ptQWvMXJGMvWYnN3lsA4oSlYO1L0XOJ8k4Tm01?=
 =?us-ascii?Q?hfe6ur7lXCt3F7aXZO1XO2z/ag+1XlZ6gTRmrDj/Q/h1zCTBjE0PBmRAyjcP?=
 =?us-ascii?Q?8AW13f53oSN7O2ms7eWDlufMQ1jOeVP2jELKYQ/Dkn4mL8vZJJDfZ+CR0icC?=
 =?us-ascii?Q?ZNByqqJmIAMyskftELZ5LabDgY3QEL2eH1YhmdNjIedK7PZLZE6xJXKNvz7L?=
 =?us-ascii?Q?TKra5YV01mNDID4kZlbxrkS2nRa9lnN7viWwjgrm4BfnRbRPO0fySDP4S4ng?=
 =?us-ascii?Q?FtVdJDhpGE5qNlXpsYLMNgiZdu0TqCbLMVIPCEV5Bi4kextdrm1N/E7VSS4q?=
 =?us-ascii?Q?R4a8/pJ1u8j7up+KbZiEuRWmfDmZmp4mlWuUrAwEggpwiBTfeLwpLKgfKsmH?=
 =?us-ascii?Q?0CibJL/g4+iBJr2Br5rwDP02z1atbO/oNOj4d6f2fXVdbcYfEBMNHGU9jQBT?=
 =?us-ascii?Q?DFvif9KltGZCN+8JLWa41HEhjtN1iqQ1Y3rOnAvGk0Dc5j88LeZLKLZVcGdq?=
 =?us-ascii?Q?X+1o/TkXE0wxRCPKHfc0kO9pgquGdxHACpueh5PtNzv2q0ptlzH9/BAXeAak?=
 =?us-ascii?Q?gnJFeieTC8oD8i22qcBUkMgwoT+LgKidD8OT9pKQ5eLTFanOaJydRyMJJpb0?=
 =?us-ascii?Q?9ymF44udiS0nOWLv3vufj+aMEUThNtSn+Q0OU3Z0KUa1bR8jv3SvJXAnWJ+m?=
 =?us-ascii?Q?QGDDhT58NOr+gL4dXtOpBdrssYspyQmFO+F12jDimaUW/LV00kHudFDLGCQL?=
 =?us-ascii?Q?nKiDXhpGkUvcMPo1PI1IUlcn5Y9lMZ0BSrJvlwtYECRme2IL1HWW1wMPj2kJ?=
 =?us-ascii?Q?HcScSBrssvYBnjl7gkuAsncvKa08VU3BqslEL7BM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B79dzHAUZcJ8rxerXI+asG+ApkoPfUFamj0cgApKNW4K26v/HwuYjBNv4jAC8rsamAJf3w5Znw8i5Cyh5fw9D+Kcvt3Gt5iSirqtRuPue+Nk70nAiQZJiNfHTi1YSz/opOebGSrX9DpAYPU1760bx2PjcYBco1dxT5q8zZLHKG/beUJPbVlMR8Hu2Ms0zFmodCG6vIOK52wn130HEb8OJlibvOR/F1Bposcgn2mt+ymQUc4ZW4QiGkKAbngi5folY9BQkCkkYz3bBxQupH6y8gSkh6A7GSveH1UAuxYTJ75YjtGqprkwiPXBOjUEhOfbaljtV0gg044EocIbssh5RAvycgfO/zSpfRJRzdFMUSTKMKgsmqatTawo41vgnvhIbN5bqxpXFz2sYBkIkNvQCUjTY4Gmrx1/JlSXe7xuIR7DBETdCYrUsSLGLzvXjEaBIzII3UjK8DCt8FlxAc52rwSpnwex/vjAiyUzKMie+PrCB34K6dC//X/D7vLE8QaiLBRTDDppXFbC3C5cKRsS/KoBSx/Q08bSnMUckvhyeBLi1dvsxt9BKpY32X/1BBsV1L/baMMM0UFXLXIcCwhF0LRf0d8D3huiEjqSaIb8Ey0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b312a069-8826-4d58-c145-08dd512f9ae4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 21:51:46.1600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r75axi1U9idXdZG5l90BUwgN/YyMgmYTu5P+hjsIn1LM30cE0aAbRHmgskfM0Ko6hfTplXOzdIYSn2knQn5woA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4475
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_09,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502190163
X-Proofpoint-GUID: Kw_EbEEB9dIsSTG8Xi1fziNnvsQJeTrI
X-Proofpoint-ORIG-GUID: Kw_EbEEB9dIsSTG8Xi1fziNnvsQJeTrI

From: Eugene Loh <eugene.loh@oracle.com>

In commit 2a09b3bea504 ("fbt: clean up fprobe/kprobe support"),
libdtrace/dt_prov_fbt.c populate() has this change:

    - impl = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? &dt_fbt_fprobe : &dt_fbt_kprobe;
    + dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_kprobe : dt_fbt_kprobe;

That is, regardless of the BPF_HAS() test, dt_fbt_kprobe is chosen.

Restore the choice to pick up dt_fbt_fprobe when appropriate.

It is hard to devise a test for this unique problem.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_fbt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index f0910c371..eef93879d 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -75,7 +75,7 @@ static int populate(dtrace_hdl_t *dtp)
 	dtrace_syminfo_t	sip;
 	dtrace_probedesc_t	pd;
 
-	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_kprobe : dt_fbt_kprobe;
+	dt_fbt = BPF_HAS(dtp, BPF_FEAT_FENTRY) ? dt_fbt_fprobe : dt_fbt_kprobe;
 
 	prv = dt_provider_create(dtp, prvname, &dt_fbt, &pattr, NULL);
 	if (prv == NULL)
-- 
2.43.5

