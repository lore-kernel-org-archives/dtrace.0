Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260031AAA11
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938249; cv=fail; b=gCOKdZ5C2Pw9s5k9c3zC81X19TJ0HV7FsJ0FzKn7TRBauvZ5QU4foZFwSyClbOYtWu83sW9rea8P1ft9VxDXUNlW6CunRGQN/KLONJ0pU6GfpamZ3EwS/+47SMtvOpu7XFJaSkk+Adkhiz08Q3OduDV/y0hNjSZsXHY/rUjBojc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938249; c=relaxed/simple;
	bh=2LA//jfzqfv2I5x2pOrJyLzMpQvlZNTRtGo+5P8VBx4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YiV9l8fVyZV17n0ufIC7+AGNcd7wpTbGWUCYZ1QqWoC+RqqvkKEVCm+nbQBTzd8YhODeIH9vFNtB0mQWhvMF6KesPBMqSIGizGi+eZltqDGzpRn1ysuVwL78E29poV3bo8/8/P7tMK9pkyWnw7qmN6fgq/jrrb2JhjXqM9TdiFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YFLxKD3O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wUIKYeP4; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YFLxKD3O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wUIKYeP4"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MIM08N010372
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1TavxHpRYIGFl0NeoT
	41pSgRqjc6apu4ISfeP8MDLqg=; b=YFLxKD3O2o89IjXYo7HIHVmPvouR0vTCUf
	5aYL9s7V5/kf0xRdAUiRUL+xHVtT862m94VzU1wGsE34Dp7FFdUl4/wLLYxQB7ND
	qLHtJxlK8T+dH3jzpM+S/9FQep1sV8W0tFkjWpuPEqH4/u6IGMoxB0cZ5WmWAFxx
	v4XOgebZ5xh8YTzNZNu2HEwAWPpYLtPIo+RXCWVQdYFQHHB31lttFQg7Hdn3CpLP
	qMqQdK7CEkkVJZ8T8rgkThMkK83tHQ+l72YHA10g+w+r9Sf2x7mpeT1wy/9Z+UAA
	cpf8PBBxH072c3XxY2+vWdULMxs+TfzRa12u5glM1Nsu0Y+jofdg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t8x0012n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:24:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGovp8011350
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:42 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010054.outbound.protection.outlook.com [40.93.198.54])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rweprwm3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzNhGMvC5EnCnJQwtp0qF84H1zAEJTFXwkn4DltTtvz/nvDemO2YmXK3ItUcaPPhnyM/sNLV3jGjopJyYDsH8ao0M1/EqbKxA1ihYYWHixh8a7aqvFPvKofUnGqo82uT2Nb9ONDflcyXPKX750quTdnr3ZUtushK1ojcwwFcGRSJeq7iZVIm6mJlPBwkq43r4+KD0ogcAXkSURcSMh59LGV0R1WaRPAO4qsHspXiHwhnExbz60cTpkidJAJAuZ6Lb1DG9pWm1Bfbcak7PR0RQWyvq63PWpATxgGoMyBIny9oARN1oWJB2H+aKrXDE2VNJpYt18oGr0io5PZOfrBwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TavxHpRYIGFl0NeoT41pSgRqjc6apu4ISfeP8MDLqg=;
 b=D6A+1AJ4KN8w7Q/kImpTL6FeAJ+kqbfaFhaiESYj4nmsISTG58iohJnenwZWnnXj1FsmY9QYy+EsDo7vzIxPKEedtq4en9f0XsBZ3E5X+M1SqSGNJIDDpuGYjV6HL72cD1xMlj0n5IHbFBNvpfD3i7f84hrsWZtkII7ORddRhmq23UW0oHulghf3MHLVk0cTRIrBTAAUjtsmGsRgGoKbuXgnrmyJAhAkIyRhKfBJDlXm613UqNb5lTxXBlBC3wnvTyk7C7hH/H3BGNtoR01IuPKnihAsRfFti1rjCYGPc4Zj/4nDalsJaWigZHRzXU6X0ekDGbWCXyvGE+pJE0snqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TavxHpRYIGFl0NeoT41pSgRqjc6apu4ISfeP8MDLqg=;
 b=wUIKYeP4B2cf/neKO/y4UqEUsaJ9VRqukikLdVWiVD787VLgTCfrYArQYUKQe/iR8ZZ6i6zIVIW595i5H2ysMf9QtkJDzQAoA5Na4o3DJdXsNvP5EF83HHMCTOHC1e/QuvolFJFxiZUQ8bd6B9dXMqt+0WkRe4zv7LQTXm3adMk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:32 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/14] Test: caller and stackdepth tests for fbt provider
Date: Thu, 22 May 2025 14:01:08 -0400
Message-Id: <20250522180118.27343-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e1fdb4-9abd-45c4-71be-08dd995aaf54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cq4gzFOFW+KvOi46i7Xq0giHmgaawTJE6/I8Pm0U/mmvRA1cU0gK6prUnMjc?=
 =?us-ascii?Q?S3QKjPy8mrSkx+H8EvDPszcZ2VqssGsZtDIUy4WEYCG1L3Pq3E6ZtyR51BKC?=
 =?us-ascii?Q?Yanh+XNMnJhq3Zy95YXcBdvOGEdJkmCG7QTM4FjBXRt75I5+xXhH8ApZHyjV?=
 =?us-ascii?Q?uH3WyJviLbmmQwYzpjaMwj/rsx+b8CTNbGyCYm5XmruwcEhdS86l9cohhVbh?=
 =?us-ascii?Q?Pi7sGnvfKKq/VSNey3BmIdQDYJif3yMbXt+CMUSdZItgOFpajx8AL3j+axbT?=
 =?us-ascii?Q?ZdCX13VUnICmyZrQ2aLmM4z34CuHrnywua6xqEJUeXisAth46/BjRFZ3LGC+?=
 =?us-ascii?Q?eDUZNLUTBPCNA27xvFANH65fz0zjQbBjfcijt6Mc3wOKGGI8Xvooaq6md63j?=
 =?us-ascii?Q?fJ4thjQOBUwx8z8UV9sA91i7KlwP+eGeKPt262bjgozdU+HOJO/eObfdf+Q2?=
 =?us-ascii?Q?jW/y1P4ZSb9DqRkTvQWZFJ8t9zNcEEw8WKqWSn9bW95mZBxdR/IvASZTO4L9?=
 =?us-ascii?Q?FrcytYGpfWPGrUySHdShQAXiWJw2pjncSwYEOY4FfGWGV59hacjd5O7oIdMi?=
 =?us-ascii?Q?y74rqrGxUogVxLxtji48HvsQniqgQxkas6GKWR/9/HOT6W3CkIRtNqaxTSMG?=
 =?us-ascii?Q?0Pc+lM/10aZD9RjPTD8tsEn1CWPSGYpwIiEv0XfcelYc7S5Ryjnqmw5IOwMC?=
 =?us-ascii?Q?9ppkXwKVbHrXkPlV/Jgefsx0KEH5++n+BKx+WsyTaKXqumLaSV+5Jw1E+Aln?=
 =?us-ascii?Q?OK1UmE4lYsY1JMfUngntD5aJkXgvkBRr3VeOn047hu4+cZ2Vp57M14wQtAsc?=
 =?us-ascii?Q?cCHlTuvHk7Ilskn+Uxf2CL/gLDGKmLeGD1cx17a65v5pIyO4BqbQLUNfyroR?=
 =?us-ascii?Q?gOTItMVPOcraiqOq05idYwFVObKWQa+pGXEDveh3NRwpgQoIP9emq9HauIrD?=
 =?us-ascii?Q?FX8cXUjQfuD2Qq8tPQ81JvqfFkFzcKkQUtXpPlEOijevspvIm+wa7TOjDrwm?=
 =?us-ascii?Q?S4pd2sT5e7TjbbLyLh39CN3EL6LkXSbUZiLJEl2KbP1rpRQF7tYv8R+09DN9?=
 =?us-ascii?Q?9bWEI0cul2xDm+0O2XQZDnmV5dNJcS0QDbxRr+uozJLTi4Yr3Thkxlvwtkw3?=
 =?us-ascii?Q?1p+oGzCZxjXEgnOlamOH6qPSvgxYbGoxAAOgHvoekgY0IFOXR7OhWmIo9Zn8?=
 =?us-ascii?Q?TB3/eJ9GzV/H8l7A1xZEwcGr0/2vUqBpCQS9Ij/DYwNUL8d+ZhO1d34Nkh7F?=
 =?us-ascii?Q?IG7NlX7pIfR+izYPhLf8BiUy/NgtZGekB8KkRrUQw5Wzm8fVBdj9rB0ag3yW?=
 =?us-ascii?Q?PZvaxkBa1isc0ac1muH78Nl9HGMIVDYRCsV9v/nRiYruiDqNmppFqjqaREn1?=
 =?us-ascii?Q?Z/3dbGFud1spiooNwqooUImqY+u1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y06jknZV/517L4/8Ht0rc3Kwo4CFofI7azUk+BP82ePej0+PWmtFI+/qGPMt?=
 =?us-ascii?Q?UveC3OrgzHFrUFpz0QMVn4YXEH6MpMmsnOhicso4utXBNgCnn0Qd4TmZZfF1?=
 =?us-ascii?Q?n4dXiMfFaAtkjF3SQo2VSzne9+mp+X0lT8BrW3I31VKc0kvn7hV94s6VuzY6?=
 =?us-ascii?Q?Ox74IbocOy2xtMQSu8iOxTiEvchYDrvvc0lwaoAhkuizDuBprOp4K4GUFV/d?=
 =?us-ascii?Q?GCJlieP9EhiA57HIH0W5sEdN6HYEWb6BCHJJvI7aCxkQ0jH/ARTHLe0sBXj9?=
 =?us-ascii?Q?HjzPJtunl1jJtRpPrMiyrJhDT7pZQu6YZB1nv/OVzk7n5Z81jrzEyGs3gLtt?=
 =?us-ascii?Q?vM/6nkySq5lJFZ6MKiMtYascz5bBuysCEYRtB5ZaUo2jZbB/f8X5oKGuqS6T?=
 =?us-ascii?Q?vj6ir3VuNItXk8UInt40Em/sveeKMv3eHq1IYkAvaV3rAAFuzIwgjIk/eFPI?=
 =?us-ascii?Q?RBgHidBRYH0BzxklRbSguQXxJw7FMWBMDFMX3sqNiV4KBbr6lUk/r/714gVX?=
 =?us-ascii?Q?rUrTDgSjqmDmVHKGECmRCMKwqYJuRKjQoLRTpBgDuxjxsZpfWMGYw6PsB940?=
 =?us-ascii?Q?pbLkMnTmWca7d/3amqSmATHSn5CE0c/Xbc+jaF0ii4wLo6UZPNECNVsmnlw+?=
 =?us-ascii?Q?pX5kEcSYJbqUZgT/ekyZldmDBSsl+r1l02wvxoeIQL9eyG1Cx3WMh7wCL+eL?=
 =?us-ascii?Q?IGa551Y7NIuaS3FkGjm9sF/rSc2xdQNRybzZwa9xYoHhQVfpbYmSpjzJEl5i?=
 =?us-ascii?Q?bpvLNSxn0Klc0EzGE0FJMZ+ZGCj89UFU6977dvKKo61IHt7cIU2pixr03fBY?=
 =?us-ascii?Q?OnOZq+25LanSTCwvKXkO5ZyKLOFRsxrtBAwKZd+P52lh+4PvmNLxNDxa1ADG?=
 =?us-ascii?Q?MIhJx42fTQYHfqWemsKXoM8Bp0byUISkTPxHalog0PX+6BtJYL/OcVjdugpW?=
 =?us-ascii?Q?eFf2QRlK1U47KYHCTC+14bfMiYzcPiD93AqdtyoT5SbXP7/nGIVWMWL+YtzA?=
 =?us-ascii?Q?x0ch/30uzRI4LrmErKP9oXiHQLHY5HriTlzGdDOUE+IKZ0uXiC7RftqkOUN4?=
 =?us-ascii?Q?gVEI2KBzYVA6QCcMtzsla9uu68vaFgVQ1Nen9OPmAQhImFU1rRObYy6nrcH3?=
 =?us-ascii?Q?BFnxELFmGps5XJo70hFaHTXYG/fgXqNgdNdWsZMJ1fXRw3d/cQ5QMto/OuJQ?=
 =?us-ascii?Q?GinE0EZneaz73jI1aOimjUYB8N+867cv/lrSRm1xRayMhBU6+f/ASv1cITrP?=
 =?us-ascii?Q?nKuYbK5Ye0MwT/QPjG/A7Q7wM+E3arWORpsgobFHvMjH4G5LKQwQthBfLdZw?=
 =?us-ascii?Q?bSZtHJdlnrM2ekvZt/i42ZOcFmSxxUIDgPZOvRSh6CJBvI46koyaPKTdAEJu?=
 =?us-ascii?Q?UmpiWW9tEszaLllJy3iHo3Qcs8HyZSrgKw+CHFhxyD/RZSv8sGlQrU22bQ95?=
 =?us-ascii?Q?YDQqvJTHPq+vjVbOe23Cdu4N0V5+JeHpEt9OvwhA0R3rxEelnagbREstbrVX?=
 =?us-ascii?Q?4L3R9l9rg13g2fBBtfaZO6zMgh7DVu6DsybyK3oX0rovQcIkU3Np7icihJiN?=
 =?us-ascii?Q?rhah3Jb0izTdwG3F5kDWYjkTgE4ahbdeKkGoynVL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3RUcaH44a1cFilGcgc27knQgQMi3YUXXxQFac73ItrI4sulOcNOg+nGWl4SespGaxgTGX5sYEJEluMHf+d0RPoMZSbFk4XD+hpv8SVeC3P7BzeLlBvEcLawHvbifaMwQ6ht8Tpk6JYl0/VQOFYhjrm9voJi5uzoVF503dWNjboKyKlZYEAHPg7m48MzzcmyNmxEO69EKcn18jK13Lo4YpNAl6SFGZQrINsq9GT57aXnWegjBGr6HMYJ7KDOom578SuGycgvkLM2fHDO6NCMCNvbqr28sdP1J45t8rjf5TCcpoyLrVzGMeDMEsctxo8BUufcs4BSceMOJIFsR/mj2TxsqF5MEOHmQQqcV3v7lHPf3wdu7BZnB3bjV/Szo/yHk9T3qnPJtcJzWNGi9B/vnTOAiUIlRyiRFK3zBlThH2NfieaHHSERPM3ZmUznOghoYBGWr+4DyURJv+goeZC2W+coxQLPekiG13pJqVTyn9ehyyghC7/PmkwqA9ujtE0flIcBwwTbAqzMa/13T6C9NJ2LEYesBrPDFplM7RtsKgQL6YMbhZUW8Zq1Twivlk/JeDTbOgGiwuN5CUguIYexN3ukPNgtI1E2xsyMjIgol6e4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e1fdb4-9abd-45c4-71be-08dd995aaf54
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:32.6212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idrgLhKStqcxbXwajSHoW4x/KILoIWJwBkHRK1phnnyjVADUY3uHs/dzNfaKWz0+wZ1vBGF+bz3m57yE0exNug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NSBTYWx0ZWRfXycUSIUEW4wXS OqFEmmGHhA6wFwgPczcT/JWuLpCzNofiXt1gZLyF+Q8K+lYpVQlrEYOaNqv0opnieGfHHyJyto0 9ySsJ5XyEOeANf9Z8UXi0Cq4HDrbZZUGAo9O4X7Ye11aIear2TZgO48cBHdyxn/nMxJlNj03+kF
 8+G+t6Pr1Zp5L2AsLdnVnsWfY7wZabbOLrcoePQZGAOOKsQqYhlhy5NFRu8QDW9GwkJLAnqsYWR coscml4L0pSv3NPVfRkJ+ZqCamUOSLyAVZW91Dbz+e3cgnXJfIQ6qtcs6g+aj051/hfI5Wnt4Zu osYmImz6pL9iXMV0+jGN1MyZKVNYOyIEEDIsetNBlZsBPy7QrmJK81edA+yvoA/M3Cpho2CVhB/
 XlsSZSeMWUdK+7V9XN3x7wX7CIi4Dtr/NIykVsOC0nIAmdDvbsYC7gP9X8PMxKL7VO699Q6K
X-Proofpoint-ORIG-GUID: Fu49zEmKJnPc0B_J7tFHUZdT_MP_Zgsr
X-Proofpoint-GUID: Fu49zEmKJnPc0B_J7tFHUZdT_MP_Zgsr
X-Authority-Analysis: v=2.4 cv=TZKWtQQh c=1 sm=1 tr=0 ts=682f6bc6 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4xIc-4EMh5p-rtFnVp4A:9 cc=ntf awl=host:14714

From: Eugene Loh <eugene.loh@oracle.com>

We will introduce a set of tests for the caller and stackdepth
built-in variables for a wide selection of providers.

For the caller test, we will essentially call
        stack(2);
        sym(caller);
and then compare the caller to the second stack frame using
the new script check_caller_to_stack2.awk.

For the stackdepth test, we will essentially call
        printf("%d\n", stackdepth);
        stack();
and then compare the stackdepth to the reported frames using
the new script check_stackdepth_to_stack.awk.

In this patch, introduce tests for the fbt provider, along with
the support scripts they need.  Subsequent patches will handle
other providers.

The old tst.caller2.d and tst.stackdepth2.d, which tested fbt,
become obsolete.  Remove them.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../variables/bvar/check_caller_to_stack2.awk | 32 +++++++++++++++++
 ...pth2.r.p => check_stackdepth_to_stack.awk} | 16 ++++++---
 test/unittest/variables/bvar/tst.caller-fbt.d | 25 +++++++++++++
 test/unittest/variables/bvar/tst.caller-fbt.r |  1 +
 .../variables/bvar/tst.caller-fbt.r.p         |  1 +
 test/unittest/variables/bvar/tst.caller2.d    | 31 ----------------
 test/unittest/variables/bvar/tst.caller2.r    |  1 -
 test/unittest/variables/bvar/tst.caller2.r.p  | 11 ------
 .../variables/bvar/tst.stackdepth-fbt.d       | 27 ++++++++++++++
 ...tst.stackdepth2.r => tst.stackdepth-fbt.r} |  0
 .../variables/bvar/tst.stackdepth-fbt.r.p     |  1 +
 .../unittest/variables/bvar/tst.stackdepth2.d | 36 -------------------
 12 files changed, 99 insertions(+), 83 deletions(-)
 create mode 100755 test/unittest/variables/bvar/check_caller_to_stack2.awk
 rename test/unittest/variables/bvar/{tst.stackdepth2.r.p => check_stackdepth_to_stack.awk} (63%)
 create mode 100644 test/unittest/variables/bvar/tst.caller-fbt.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-fbt.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-fbt.r.p
 delete mode 100644 test/unittest/variables/bvar/tst.caller2.d
 delete mode 100644 test/unittest/variables/bvar/tst.caller2.r
 delete mode 100755 test/unittest/variables/bvar/tst.caller2.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-fbt.d
 rename test/unittest/variables/bvar/{tst.stackdepth2.r => tst.stackdepth-fbt.r} (100%)
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-fbt.r.p
 delete mode 100644 test/unittest/variables/bvar/tst.stackdepth2.d

diff --git a/test/unittest/variables/bvar/check_caller_to_stack2.awk b/test/unittest/variables/bvar/check_caller_to_stack2.awk
new file mode 100755
index 000000000..8499852a7
--- /dev/null
+++ b/test/unittest/variables/bvar/check_caller_to_stack2.awk
@@ -0,0 +1,32 @@
+#!/usr/bin/gawk -f
+
+# Check output of tst.caller-$provider.d tests of the form
+#
+# {
+#     stack(2);
+#     sym(caller);
+# }
+#
+# Confirm that the caller information matches the stack information.
+
+# Look for the first nonblank line.
+NF != 0 {
+	# It is the current frame.  Skip it.
+	if (getline != 1) { print "ERROR: missing expected output"; exit(1); }
+
+	# Now we have the caller frame.  Strip off the offset.
+	expect=$1
+	sub("+0x[0-9a-f]*$", "", expect);
+
+	# Finally, get the sym(caller) output.
+	if (getline != 1) { print "ERROR: missing expected output"; exit(1); }
+
+	# Compare.
+	if (expect == $1) {
+		print "success";
+		exit(0);
+	} else {
+		print "ERROR: expect", expect, "but got", $1;
+		exit(1);
+	}
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth2.r.p b/test/unittest/variables/bvar/check_stackdepth_to_stack.awk
similarity index 63%
rename from test/unittest/variables/bvar/tst.stackdepth2.r.p
rename to test/unittest/variables/bvar/check_stackdepth_to_stack.awk
index 9b071181f..fba1f4242 100755
--- a/test/unittest/variables/bvar/tst.stackdepth2.r.p
+++ b/test/unittest/variables/bvar/check_stackdepth_to_stack.awk
@@ -1,8 +1,16 @@
 #!/usr/bin/gawk -f
-# Oracle Linux DTrace.
-# Copyright (c) 2016, 2021, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
+#
+# Check output of tst.stackdepth-$provider.d tests of the form
+#
+# {
+#     printf("DEPTH %d\n", stackdepth);
+#     printf("TRACE BEGIN\n");
+#     stack();
+#     printf("TRACE END\n");
+#     exit(0);
+# }
+#
+# Confirm that the stackdepth information matches the stack information.
 
 /^DEPTH/ {
 	depth = int($2);
diff --git a/test/unittest/variables/bvar/tst.caller-fbt.d b/test/unittest/variables/bvar/tst.caller-fbt.d
new file mode 100644
index 000000000..695104134
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-fbt.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+fbt::ksys_write:entry
+/pid == $target/
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-fbt.r b/test/unittest/variables/bvar/tst.caller-fbt.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-fbt.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-fbt.r.p b/test/unittest/variables/bvar/tst.caller-fbt.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-fbt.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller2.d b/test/unittest/variables/bvar/tst.caller2.d
deleted file mode 100644
index ca6dbfd22..000000000
--- a/test/unittest/variables/bvar/tst.caller2.d
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: The 'caller' should be consistent with stack().
- *
- * SECTION: Variables/Built-in Variables/caller
- */
-
-#pragma D option quiet
-#pragma D option destructive
-
-BEGIN
-{
-        system("echo write something > /dev/null");
-}
-
-fbt::ksys_write:entry
-{
-	stack(2);
-	sym(caller);
-	exit(0);
-}
-
-ERROR {
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.caller2.r b/test/unittest/variables/bvar/tst.caller2.r
deleted file mode 100644
index 0cfbf0888..000000000
--- a/test/unittest/variables/bvar/tst.caller2.r
+++ /dev/null
@@ -1 +0,0 @@
-2
diff --git a/test/unittest/variables/bvar/tst.caller2.r.p b/test/unittest/variables/bvar/tst.caller2.r.p
deleted file mode 100755
index 1a26a4df2..000000000
--- a/test/unittest/variables/bvar/tst.caller2.r.p
+++ /dev/null
@@ -1,11 +0,0 @@
-#!/bin/bash
-
-# sed:  remove +0x{ptr} offsets
-# awk:  look for the ksys_write frame, then write the next two lines
-# uniq:  count unique lines
-# awk:  report the counts
-
-sed 's/+0x.*$//' \
-| /usr/bin/gawk '/ksys_write/ {getline; print $1; getline; print $1; exit(0)}' \
-| uniq -c \
-| /usr/bin/gawk '{print $1}'
diff --git a/test/unittest/variables/bvar/tst.stackdepth-fbt.d b/test/unittest/variables/bvar/tst.stackdepth-fbt.d
new file mode 100644
index 000000000..10b05399e
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-fbt.d
@@ -0,0 +1,27 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+
+#pragma D option quiet
+
+fbt::ksys_write:entry
+/pid == $target/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth2.r b/test/unittest/variables/bvar/tst.stackdepth-fbt.r
similarity index 100%
rename from test/unittest/variables/bvar/tst.stackdepth2.r
rename to test/unittest/variables/bvar/tst.stackdepth-fbt.r
diff --git a/test/unittest/variables/bvar/tst.stackdepth-fbt.r.p b/test/unittest/variables/bvar/tst.stackdepth-fbt.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-fbt.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth2.d b/test/unittest/variables/bvar/tst.stackdepth2.d
deleted file mode 100644
index 2b1c0866a..000000000
--- a/test/unittest/variables/bvar/tst.stackdepth2.d
+++ /dev/null
@@ -1,36 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-#pragma D option destructive
-#pragma D option quiet
-
-/*
- * ASSERTION:
- *   Test the stackdepth variable.  Verify its value against the stack trace.
- *
- * SECTION: Variables/Built-in Variables
- *
- */
-
-BEGIN
-{
-	system("echo write something > /dev/null");
-}
-
-fbt::ksys_write:entry
-{
-	printf("DEPTH %d\n", stackdepth);
-	printf("TRACE BEGIN\n");
-	stack();
-	printf("TRACE END\n");
-	exit(0);
-}
-
-ERROR
-{
-	exit(1);
-}
-- 
2.43.5

