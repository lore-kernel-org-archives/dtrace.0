Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A03A2144CF
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124687; cv=fail; b=cmRPLxT31fYqozd0xV41/3oX0V06ogGCxSFistKjbaKd/RjGbT7ATJ9+oSJn2sendAaDrb0RJf6RFXnkQ8tquMnWO66E8WUZyl4logqtyF1MymoYspRM27FHEDoKfAz8HFKakzaYrkgiStHwANiyKDYIaF7qKY3AZ2hjVPsBmt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124687; c=relaxed/simple;
	bh=GTvUZnsUdVDQHs2m4RlS32wpTiRglhB2AK+QPgQMrgc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IB05jcAH3DtI7ffuAxi82CyZS3dMWPg15AgwvY2iduXZYPN2G4LiY8qQMmfR2QDhAePPirijffSdajfBFg9Rd+eKeVr7Ojzpm83BirwIbd7SPH4zr9Sj3fD7vRJ74UjmJCHPiG9Lz1H1v5xSr+4jFVQAgTZfeQfmPF9PfoBoRbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j5W6HHSI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yRzhxuEs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j5W6HHSI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yRzhxuEs"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541Hts0Y009614
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=VctzvTy4lcI4VNnts1g58+W6Q0/2N9TY5kka2NBDw2Y=; b=
	j5W6HHSI84v8ArpaBLHMOl/O0h3nHfpjnTKSYClxzmtzrrgbAh0Bq3JdhHiLl/GQ
	G+MpzcFeZH8KeCfVunm5NjXgT2d3Yyc2dgAhcm1pmogeWLF+bEqH3MMGYopZga/D
	rvwBkD1mMYQA6+F4OGnicYIk+V7Cszv+qNd+XjnecU/X4oWaGhHyQjZe085ipgMv
	T6c8wMfW4dx8ND4MC2A+WYfa+S5OdwggxLHM5wETB5pUHz79Hf/ckXW0S2lDicb/
	0RJEZb57+xRgjtHzVyuWZAuunj6XWI+34MEWC6u7fMwnWtLC3E2ZJolLCrbbXyL/
	umUbVb2Y7pHulxHUAtXtoQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6ucknh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:38:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541GYYrK033448
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 18:38:03 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcuwvy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 18:38:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKkpSFTRLseKKnqdzmvm6kt5p4CD+gPw1SOSPaC4M5GjV+wZXmnf+iP6ntb7Ya+WC0kbLBEyDC7O/E1tQnXz5tLN8iPQknV81OGLzAsqbDho4AAQsWwsOXw+QYBBi4SSjGvJDxZXXNDFsTTs+zi5eZC6Itx9dzGR7oQdFtgm8EPan4nTFwhQB3jmZZsukljIscC5+WC6r5P1u6U0y5/9gh4Ewqbsa8JubiEKvLzaiLQrbpSDyILgQEjdKX7O1LUr4b/tK6x8smrVkweQGra0T4z40amwo4ePuk2T/9cwJwGCDQmaVOFLFo5uXwNJp7sS9BJzAGPzeQ2sWJV1MK2UGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VctzvTy4lcI4VNnts1g58+W6Q0/2N9TY5kka2NBDw2Y=;
 b=aVIrV6+9HH7NgF9butCMir85fxE8pODfKYfLXbl1VsLnc9ows0/o9iY8GVtZw9QN903e53vAHzx62JqkcrZPkMW7hZXO4y5e/Xx05DWQbPrIHTECmCcPb4oip8qWbgNYAsr4CrugaO9zxj5Cn+vHHIevRQtMuwXGSGI/echDWFbwdfjG1r67YuvmW93yya8Uov+KyDl779WU/ylUF4AskPZ0Y0GpAO3cpgZ4yXnNIAKulliMdb194CYPn/RND56QY3Qm6Z4nVcBk8Jrw7spQEaQs1Oc88775/T8m0EbrLxaE7Ftv+vv1Sp8cT3U09N4HjHF9w+yCG759sE40TN+rsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VctzvTy4lcI4VNnts1g58+W6Q0/2N9TY5kka2NBDw2Y=;
 b=yRzhxuEssVmP/q2jT73jKPcSDYzTYazamfzXJJl5OiJvIy49fLI6HTVEpH0+9D7Nwj/p9j+c5PWC1UByKAOXyJCekY0eFYKF2OMOM8Ge/Ry4z5bvhpUmO8zRbjnQjhokAUvKqnR6hWN2mS285mV63rXoFROVRvLSM0LiJZAIFgA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA1PR10MB7420.namprd10.prod.outlook.com (2603:10b6:208:447::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 18:38:00 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 18:38:00 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1.5/3] Remove unused map-of-maps functions
Date: Thu,  1 May 2025 14:37:59 -0400
Message-Id: <20250501183759.27917-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0061.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA1PR10MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: 89157542-0427-4020-3302-08dd88df4cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qE9sd6YAeJN4wB3ce0VuyF3KZMMLRGhVnCLB0lfJ80QE4+nS8ECwsxIVGdMo?=
 =?us-ascii?Q?YciG1gmTyTr0QC4RsY1E3TqYI7cl/0P3i1KHDMqVJBUiOHHtTOM+si1DPB7c?=
 =?us-ascii?Q?WvrsJvNjwtZp42EC/JgYP17VSnAmZ4R9vfL3AY9STIk5KsFESCUIbWEvs9YJ?=
 =?us-ascii?Q?H+8Dw5I0vekN6lOCP1kjU/iDumVhkZbTGl8H2jikbxs/npzLQe3vFhkSbjnf?=
 =?us-ascii?Q?RSyb5bP4r7RnePp76Oj7w0I6Lis4ED/STmZQLcV9DtEp0zCv71hunOtqy3/J?=
 =?us-ascii?Q?lu+TYPoKmUYot6QCuMVOkZ+aGibNVFtfZ4uF+CWmVMVg55BTunlEvTEBLViQ?=
 =?us-ascii?Q?9vbtusg9uFzbRjRc4qrPAOGk1LWKzAwNBnfYL0UsrcQG7oiiZ5p1RFTpIM/h?=
 =?us-ascii?Q?1Y9X9ZQugsG8Ud2NBkSUbT7ZOKbJ5OKoLoj0ArbmxmA5Oe/CQcAbUBEsP9UK?=
 =?us-ascii?Q?3sX0jMzZz2ttqKY4iE79Xx3wr/GiiEzP0qVvPIXdpLz7Gr2du79tkzl+N19P?=
 =?us-ascii?Q?biiNIVrNKvGEb5BDGJrrnwLtJz06HxXXlxVslvkgQaEZ0wSwba+hqc/rxbwx?=
 =?us-ascii?Q?R5PE1BGZb9+L8hhl/vo/86R0zYEUHHCEAixtAkBurC1r+vfKhPgPp+rkRPsB?=
 =?us-ascii?Q?HqpuWAXA9kR1uHuCGK/5Ex6VWGuZA9ADvzAXUO30oL1Tvf8d/L0H9nmDlUD1?=
 =?us-ascii?Q?z2NDHMI/6b5IZbnir+7/2lv4SH0dCRU6Fo9J3csrtxH2JnredfTnXOVzeAd+?=
 =?us-ascii?Q?QAaujuD61e1506/BZC9mSyZYBPcMocb75fudOIC6gSWFFvOAPnE7HyEmVPlg?=
 =?us-ascii?Q?B9tBT87Jq5Zf3eHFtX/LruDQbpt4qh4Ahq07zuWxZfOETYiqSs67zej4KR77?=
 =?us-ascii?Q?dtYHV72Cip0Cws/fbd2dj0omSHUl1WLzlJCtTvg8Xe2rWEXPSVpuILinw1qy?=
 =?us-ascii?Q?7ZAgblYFWJDMmHoIjlPmBaTLnwIbinlVW7bJ4G234azFsERUr8lBqlwFek/x?=
 =?us-ascii?Q?VZvtHe/9JgYC2HmRYzKIFWMSN5NexiIxxCAp+QikbxgmJxrwBNRz4XJomRGN?=
 =?us-ascii?Q?iTJdxOyOHvlypJSTQ50DfIWKeRA6S6ODklM+th1aIXHohEUmVHGMjM+2B44l?=
 =?us-ascii?Q?GD7lGXdzYiln3EZlLNlXy2skHx61WUWxDw+VsiLhgeG3na4JcA5aTJd1E9Sr?=
 =?us-ascii?Q?0wmi6JK4xI2ftfArXUbhcb2y9w9I6BnUWg+CYvF5toEWiOOUx0cHchI+BBL6?=
 =?us-ascii?Q?KD0b0L4D7R02Xy7yAtJwEO5ZbQvAbrpfXoIDR0uqx8GGp700xW3NKz7pjHpE?=
 =?us-ascii?Q?l0OD3G6tQNFRbGvOxlbD5bW+ACQwvHe6No7DbkACu8i+Kbdg/ZHBfnHjsuQm?=
 =?us-ascii?Q?7fDDpT4fpf6fC4fYcqmmqWACbEUIsL4C3JC1HNXdnvo69kw58T4hdKXZ7uc/?=
 =?us-ascii?Q?1kUTkio7n/E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cqYrqrO9ute+btWKmCL5GzsZOvbpt39NML+KpgcJZiRouUxN4ObxNU/ZOtNf?=
 =?us-ascii?Q?kbVvS4TQzw71h493pR1qMbzx4K/L7maHjwTafTYPMqSM/qI/QSojyAWOkOmP?=
 =?us-ascii?Q?xrLFGBeEu4zURBpug+qqOzGo5sgPajbME4Do+fjki2hTcXVn+oiN3OCT3BpE?=
 =?us-ascii?Q?FnYAE/t1Nw2hIeakcKv+EMx/nOoWuYYatcZKoCaVQ1A1CV8XMil9a9Ivl9Sf?=
 =?us-ascii?Q?u7mWTrQ2V2rzDT9Ce2uVhYTz40idpN25qRtu4jt7ZYC8V2GiSFxXAGtm5ieX?=
 =?us-ascii?Q?+6Juqc28yQNjoXjh97guXnlCzm6o8UfOXveWr1hvIeeMFyIuxGe/nbhasPcd?=
 =?us-ascii?Q?hHmjqrYsmlMfc65IKRRCkSr9UButNuHNRMLu685st6s0bMZNpbQ7AaRa6Bvy?=
 =?us-ascii?Q?QF1g1LWC+J9kPBkw/zvP29BA/WfLgz4t+VxZah8vAWt8HTt6IqAs7Q635YDX?=
 =?us-ascii?Q?VGc0M+cGfhO6akqB8DoY9JjBSP/zAfWIF5c2PKBOw454kMvlrTW17J6/4H81?=
 =?us-ascii?Q?seuwAr2bnqt/5Gq5V1er9YW7xeC6o7Fgn4MMUiIBP7ENybbtVRBWj6ZXPeQz?=
 =?us-ascii?Q?AeEDU7iMY7+Q6Wggpo4Xk/l+eemuiEgRjD8LRonYExT/7GBG0aOG2xKaZd0b?=
 =?us-ascii?Q?c2Vj2nhVzgx8xkvk/DNzyP4ZWKPqi8vf5JduuQZMdp2/ilQ14UcST3NPNd5Y?=
 =?us-ascii?Q?aX/CW9FtpLsEbC/cFw6CRqV+0g9K0coCOohtmttKGAk/lpKhCn84mr2dAwgU?=
 =?us-ascii?Q?6jhwv+wB5DNwcf4iuOu0lYMcXMFeDdFrkFmmRofblv/DTHxh8RgygsXgDLTO?=
 =?us-ascii?Q?ibQrn/eirhsBTD3vhO7NG27C5COGsw7zxJDpslq7aDwt0v10NWbVyDGWxkbv?=
 =?us-ascii?Q?Oq6OPkhDxaJyGVKkZG3WhWfC7DlBfNBdDiy/4SbRyJnUfHx8lmJvr9t2kEFS?=
 =?us-ascii?Q?vQuWUqUPEcboMcs5ETCkCPT9PzNZ/QJ196+kAZY6XIeAD+U5LXikoaFlZF2D?=
 =?us-ascii?Q?hRU+n4b3qLI731eAgGsGoL/dI/WyBNnCSaqdAa7DSOK2FZqgMabO4YdDfAaw?=
 =?us-ascii?Q?Wuvbg/9CiHfixLJF+o2VP7+tpiK1G1q0jRgCnJuEQOqfO5ffRqQ1wZ5C6ADe?=
 =?us-ascii?Q?/aBhTjz9DL6XjlshO7osxdIY/5GstQd5OfA7/UHGsgLxhgg7AGaEOVWrFNj8?=
 =?us-ascii?Q?RPZpjo/LvZo++blCXPwoAMKmAOiwgOobRtIAs6Zyf2N43eu0d/iEZeG4MGSS?=
 =?us-ascii?Q?V/7bbnbIJ0xxdAOBG707Veo8DOh36KrrtI3ViLODoaoEowWVMVhl+TqgoMOa?=
 =?us-ascii?Q?sKi5aqf/JoH84//iz7fj9ogyQC7Jpsnfd0zg+T2a0/Z70qX5cIQ4YEQQ6Cc7?=
 =?us-ascii?Q?wg1hSbkrRf3F+2hPgMYJyzut4mNkYJbBduJ82/jhcCHb0UFJAuZ7ShEQWP+1?=
 =?us-ascii?Q?HtTZNE5GybH2YzHYxOej59DZNg6eb/1QmEDZbEvueguLcFJ57+bk4ifqLKkV?=
 =?us-ascii?Q?Ke0zDJ9v7zMPgo3wLmNvEAv6K6jKxOpZqmxPEs0PgITy2uuMA6Te81y2jVQk?=
 =?us-ascii?Q?79Np0vUQoZ6P5NR8lnW6wu5K+iJpMUW7nZvuqJZz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RajPLt7+wS/wym+IYgOaAPvbAWcU1a3DlYdCmepzrd5Qb4Ab6ZNPrSdABDSBdDlOBuOn/WA8GgG6VGa1lnUi1Qhk6aOMtkiQqvBb5kqTCScIVglacm0xE+qSan/I6JAqjuw0CTikXE6QuNaghFURVpqyOuNS4XqdjWS61nL4431VJnMhow7Z7xmSw4KzBtqoaX214ipoaELrqwRVkuRsga/Djgsy0bkkw9nGj71+ThnvRbP7N8W6YM9p+xhA1R0Mo5ErCG4t2mMjpheakAPTWbvQQZBwDuJUPGeD9Yq3qaRn9EKDTq2FX7h2FeaAzfFsF/EkcPaEhBKwhl7eyw3OXhonT4ie6g1Wo0WoRxYbRvxLKnZOzDwwNH50gv6Er7+Wohtks9ifeL+qYqLGxmFUjhn0LxaewkEUeoGwCOxQTHuRccZhSM4us8bDGtvLsysIzykDqlax2ElwZRpKH/AIeGCFDSTGu0teM3qc6PzK+RRRDpH5xqohrAuxLxX04VMfmh3Ggk4R9l1R3XTRApSwglY64D780Pd8Jw3eMAENbmCgrUCh/bIuvrQWqFExpMcTlWew/xVDT2VIniqIKoENOqKAn0FFPSqfBwuthPiXH8M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89157542-0427-4020-3302-08dd88df4cc0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:38:00.4499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iQfIKHTL/WDBCZ5YxnqRQQpTaietPFOn4vMA2FYH5dJ79kvcfZViIF1ACtGRuACZbapd/H+LqDvd6zN8eEnBIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7420
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 malwarescore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010142
X-Authority-Analysis: v=2.4 cv=ZsHtK87G c=1 sm=1 tr=0 ts=6813bf8c cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OIV7AAplvkvAQyccEJUA:9
X-Proofpoint-ORIG-GUID: xCL5BP1-Mo2dE08LtDr_RFN7xYnvcnCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDE0MiBTYWx0ZWRfX14y87avlttC5 1vEnVoBuN3ePwCDZKVdDQaSbMl0WitrBZx/FuUi2ymhHbvN33GmnSy0Zfpcp2Xw5pIFsOSE1+k3 pSWhiihWRJ63XtQMI1wXo8A3wMLnGDU9uxGoxiH2fD+hFIcsdLn/PY5QbdKiCxoU8RT0dU9dJJp
 3Fl6MP8wc0T9ltYnGACXfDyvi7MYrbyLbYSwVNOo0RUvJFwp2/LOkDh9s9qWpllew2fvfevGG+2 0A0kuPtO/Jkd4DBb1V4p+Oz47TaV6es3MwiMzdx9i/HxbXEWYnjQsvlkWotJFshzb85/ghMyRmh THpiSrPgCiiJsTjGE99ZaNr9EqUTzf7p9n2cG6tIpcclovGEbZNu67/PJXKduLKnghfC8o/d2C/
 o+KA8Yrl7tKjsW9JRZnsca3B+ekRGNskGZEWm/RwnbxsiAK37CkaM7V4NQk2THLr3Kr0U0QO
X-Proofpoint-GUID: xCL5BP1-Mo2dE08LtDr_RFN7xYnvcnCz

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c | 57 ----------------------------------------------
 libdtrace/dt_bpf.h |  5 ----
 2 files changed, 62 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 635780738..4e4b6eb87 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -341,63 +341,6 @@ dt_bpf_map_update(int fd, const void *key, const void *val)
 	return dt_bpf(BPF_MAP_UPDATE_ELEM, &attr);
 }
 
-/*
- * Retrieve the fd for a map-in-map, i.e. map[okey] which is the fd of a map.
- *
- * Note: the caller is responsible for closing the fd.
- */
-int
-dt_bpf_map_lookup_fd(int fd, const void *okey)
-{
-	uint32_t	id;
-
-	if (dt_bpf_map_lookup(fd, okey, &id) < 0)
-		return -1;
-
-	return dt_bpf_map_get_fd_by_id(id);
-}
-
-/*
- * Retrieve the value in a map-of-maps, i.e. map[okey][ikey].
- */
-int
-dt_bpf_map_lookup_inner(int fd, const void *okey, const void *ikey, void *val)
-{
-	int		rc;
-
-	fd = dt_bpf_map_lookup_fd(fd, okey);
-	if (fd < 0)
-		return -1;
-
-	rc = dt_bpf_map_lookup(fd, ikey, val);
-	close(fd);
-
-	return rc;
-}
-
-/*
- * Store the value in a map-of-maps, i.e. map[okey][ikey] = value.
- */
-int
-dt_bpf_map_update_inner(int fd, const void *okey, const void *ikey,
-			const void *val)
-{
-	uint32_t	id;
-	int		rc;
-
-	if (dt_bpf_map_lookup(fd, okey, &id) < 0)
-		return -1;
-
-	fd = dt_bpf_map_get_fd_by_id(id);
-	if (fd < 0)
-		return -1;
-
-	rc = dt_bpf_map_update(fd, ikey, val);
-	close(fd);
-
-	return rc;
-}
-
 /*
  * Associate a BPF program (by fd) with a raw tracepoint.
  */
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index e03c5c6d9..43fb2233e 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -80,11 +80,6 @@ extern int dt_bpf_map_next_key(int fd, const void *key, void *nxt);
 extern int dt_bpf_map_update(int fd, const void *key, const void *val);
 extern int dt_bpf_map_delete(int fd, const void *key);
 extern int dt_bpf_map_get_fd_by_id(uint32_t id);
-extern int dt_bpf_map_lookup_fd(int fd, const void *okey);
-extern int dt_bpf_map_lookup_inner(int fd, const void *okey, const void *ikey,
-				   void *val);
-extern int dt_bpf_map_update_inner(int fd, const void *okey, const void *ikey,
-				   const void *val);
 extern int dt_bpf_prog_attach(enum bpf_prog_type ptype,
 			      enum bpf_attach_type atype, int btf_fd,
 			      uint32_t btf_id, const dtrace_difo_t *dp,
-- 
2.43.5

