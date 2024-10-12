Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A91F139D
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703861; cv=fail; b=IunXddbcSau6CFXFXuVzAH2ykUJYB3wKzE47Z8+8TfSZZnsqtZGIu03F3wM2ASLMKduG3luT4R2o2ForDurQXOFcOhK05tohfQNEkMUyd2pPEBMKfB/XxJmCNHRNNZvHfKrEj5cur84vWzS36Cg5CMgdTPiCNbzFfCIfxpE2zZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703861; c=relaxed/simple;
	bh=W4AvYbBIt0jdOBwYmLJ4iqLZ0uouoLogHsWE+ZI4sU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ToqE3g3Nj3WkPvSVHvJbXvW2YdOxlJmayMH0WoGWOVFcclM6G4exjDtpmzR2zZeJMe4otkf/eZUbqG6YBo7bo7Org5u+RV59Y0mFcUJygMUWZon0AcX5eU3DJaVgr6mtjfz2bPKXMf99+FAKViemvfO+v0s2qiGGGErAxdisl+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aH5A+ylO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PbXM8e9c; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aH5A+ylO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PbXM8e9c"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1VwU2001332;
	Sat, 12 Oct 2024 03:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=HZMHG7RyieTyQbP2ng
	7ktCudiJUzuwq2GZlyxeL9Mf4=; b=aH5A+ylOqhPyHSfknGTCThGI4p3FF3qkyf
	gfHvr51cCzfmk16BqflV62fyYiC+7wOI0zEq9fCGZKr3yUUaggyh1MS3Qst953uL
	byDVk6bwwM2KHp5edw5gwURQ5QUW+WazXF3raFIDG6uHa8X2eGy/bleA43pXKrA/
	dOsmMqk8FRt9FHq5vGtdHocqztkjcOKXVcIuhNWAzaDmyAmKIkuEfKu+VwvNoY2y
	sYH6SWEKRBxeRCgl4PoOf4moBy75CFUzRcZHEWEMFWXfGnjQ8j0igAynfP0ZK5mx
	wU8si370cvZsK/ijwMueXV7P9lVX4bkjCDZFuuDYPoieXXKfps5A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fhc81w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1Xwhu036673;
	Sat, 12 Oct 2024 03:30:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjahn81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuMjNcwJ+iaMLINf0w7itFAFTT/C6JcguVYYqd2YrS9q4vz1t3qsM+uC/i5F3RotTgsi/+L24JCUSDQbe4cJS9iozdQW67nhkiR6JLYZeigHfLfL/4Wn58RJPcZCKJvEYt0H7nIpjOzeX9mdT/JEe+2IbwfNs3Z6sz7Yws94iV5ND0OYYLXo6Na2lTPqMYDTfiB8zWyT89gzeLd8RwZ+WnyktstJglmBjZ2JGtzIkAIhZRM0hofYibcLp4JpWNyy5PT2NEWAihf8aJUWrFPU/Uaj+BfSOmLvKCDcLilv3dORJSQBDmW9rjngQUirGDBTuwCZ/vhWk0j2lumExh8D2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZMHG7RyieTyQbP2ng7ktCudiJUzuwq2GZlyxeL9Mf4=;
 b=oKhD7BGh5B9Yqb2btIDLp7ZvsvpyYx04aj8wYb1/iQTg0nTDv6iW/Z6fzY9X/RDxbFxgiSp+V/671ursA4Eexub8PrQx9kk4oH7rdiv4mJJ2enRkjAsdqM1ZgVmz1Pg8LQeMRFp9gwzBgdyHqw1B793/VUEwlsc1Gal3nqbvSdIltqQ80CRskVtGjIy1uVuMeMUkpKm9WXhs9/aqZxUE51ggVMheZMPaKS4Xnu8jYPkzTSAOurEo0OnADtgXVqHY4Z1Ec2Hk7d9EdvToDiiorfr3lK/4armPcru/LQjS2+8Fck0foVuUeZTGsvPpir8esiRsF4fTfUUYj7CG3SiEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZMHG7RyieTyQbP2ng7ktCudiJUzuwq2GZlyxeL9Mf4=;
 b=PbXM8e9cNkYQnsOSJF5X0CkZVPYJu5DgcIWdOOvwYWkHpPChc9iP6BJeqqlLNzuM9r6igBmGItCjCEffX3aGyGMPIyHIDlV/8yAE4ZW8zgGVs9nfjWZH2DvRJaSIiTEnmT94pEvlcydaYsWuqW2a5YJp7VkaPGc9dzKrzyMyUkE=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:30:53 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:30:53 +0000
Date: Fri, 11 Oct 2024 23:30:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 5/6] test: libproc: cater to merged-usr systems
Message-ID: <ZwntandHaYD8a9Qr@oracle.com>
References: <7a1c6618639a057dc267d2e0dc9c9d8afea6b0b1.1724962546.git.sam@gentoo.org>
 <db453ea9d3bad48b505c31c733c5460b6bfecdb7.1724962546.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db453ea9d3bad48b505c31c733c5460b6bfecdb7.1724962546.git.sam@gentoo.org>
X-ClientProxiedBy: BN9PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:408:fc::11) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 6005fea1-68ba-4a08-a9e9-08dcea6e466b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RpgLjPJCZHzxez78IbwTcm8xbehuHFDtTflG8vGGuqtO1sEiIScHrTDvYGdC?=
 =?us-ascii?Q?7vDMgQVSwade4IPTHsRqIRbfaNJI0ixUDijzSkl/k8aawvhs0FAi1oVwVPw5?=
 =?us-ascii?Q?iuwS9QlqabfMDZl8b3dR7GE/MqMSQtCAxO7vyO/Gq8MpMcE7ga0GaeFUDvMW?=
 =?us-ascii?Q?75WvyTQZRm2OXjg98R1r8cPVHeVe6t58W4mkCRPod3TyvL5EW/X3mHksZM4s?=
 =?us-ascii?Q?VMtDSS2sI2zxfRO/OrOQkc9oSfeYku3NO7LGOUvChNeKBRMgohoGm7ICRWYE?=
 =?us-ascii?Q?jfU54Qx+ZeoWSWX0RS3RBA2n4pPtE2uhf+0EY9AzLfknwH/LdKJDLeeYnvBM?=
 =?us-ascii?Q?mW0pZIF4PiMzaRSUAkfMSOF4BBCJl3YAvCnKtrBhU39nbITI767FZFupbw4+?=
 =?us-ascii?Q?a57fiOVbN3ABhg6Xbjhota2ypMdEonIeq9UXUz954y1qLYGT5iPwPe/stgtF?=
 =?us-ascii?Q?w8+eVsAuRLaTmf2Qpk+i+MXMtSsqKl6aFnykmDp7tjChcOeOYm2Zzmo80Uic?=
 =?us-ascii?Q?mIXtqMHF/7b3lG/A+IFGuBQTYdLk2Puf1A5zZhwLxn0/PMhXO1HmZJ0z35NM?=
 =?us-ascii?Q?auAs7LfA4zlM8N6F1GGG05/U7JUGxUsHXo9arWT0AK0DNKo4sLmmJkP0vJLL?=
 =?us-ascii?Q?weHA5nkV1sJgDIRfJNcIxT6pwgL8WQiSJ9/vfXPE4hgmU7fj3w/2TVVtz1t9?=
 =?us-ascii?Q?qKdQs07l+4zdGek0t4Td7BXYBFc75z8Fu7uKCTYmM97Eg/jPWRs/MuhS4Yfu?=
 =?us-ascii?Q?t9BuKOVfxCOUZRIP/jMzZTyz00HNbD3l3JcdH/jU9h/DbGTdZTdofGQeZoRz?=
 =?us-ascii?Q?zOdypbXG+wXAT9EMbORww9jf97gVjadGRnWTDlDTMyDhInenTeA38UxceNP7?=
 =?us-ascii?Q?s27QcZRmsz0MQSpSOAonMK3nQHvwCx7T8lh20ojoYTGsx2YBWOGWyNyvspC7?=
 =?us-ascii?Q?vd/NrNfRBkzzr211KpHUdMOHfD4y/uQwIq/92TXwGwTAsFF2RrOpeLyHxU/u?=
 =?us-ascii?Q?Y9IJCUYdbjbOtLcLOWsNx3jw+FMSbdPVV13/nhb6J1Q8WnmWmiGam7BIZgF/?=
 =?us-ascii?Q?MkZt1E/4C5fye4yh4UkdkmgZBTGrb+qj8rBlonZZn27UT9RPh+1ojuIRW7QS?=
 =?us-ascii?Q?kVU4oRt0snCLxiXiK6oGzJterWxaK26ojQi1dJUKzUHjA7KpGRWYZKc+UFcQ?=
 =?us-ascii?Q?Hw4nVTNslxgzMmq1geI6pmZJiv+hwvVgND+nRlMM0Qmk5fC8/v+SDh3XwmeS?=
 =?us-ascii?Q?WFvf0HyXrGM4+cnOsGMgJ5228zVpR37gbqPpjh8f1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p70KVDn8BcuKGKicK8JdCkc7SZl4FfepeVxVi/4j2HOkoNM3ekigzsToCH5d?=
 =?us-ascii?Q?UZ4K1LRfsTY+nn78AquyUG90Udnt6iY7+/Tg1UUyAd44zxXwrQYbuR9pqfSX?=
 =?us-ascii?Q?ImxXO8q/TmwhrglXWe3nAu+S2+CeBL+EZ7I1TaGoVR5kMLvMutxhs9ZhjZCJ?=
 =?us-ascii?Q?sK81w/ki7gpPOf/+qvLJlETMSqKu3Zfm3g3vR5fIIj/zRoic6aCpNmjNTaDb?=
 =?us-ascii?Q?eNJbu2PDsQsJpftiIncEDrYk22ecuC0yO7z0/B8YBeGcAETrNGFLQiZapEzl?=
 =?us-ascii?Q?lOb8qYYiR8JbzknRdF7oXyfvPKOoIGR5ItKmoGt7hg77mRmPy6W8zu5Jg3cT?=
 =?us-ascii?Q?AQPMGKGzRn/Q7YnV9Q6HoayUKUn9HdTwRIJPv8nxDH7FOYK/GtIXcJwYu195?=
 =?us-ascii?Q?PtKtqWVrs5M19XJLRs9mWCDViK5VcsxzJjbTywI8fEu2QnQQSe3oO3s0Pbac?=
 =?us-ascii?Q?vCVlGTJfG2SHoYYklKTMkODElJQU98l5WBukZf74vyq6ExJkdQuTDuY8Qcyi?=
 =?us-ascii?Q?WxGZrRWZrWc5G+X54DNiZ/Hw1dp3ATcCz72ueq8d2iecM04C2AdGe98hfcIg?=
 =?us-ascii?Q?Koez4R1YsQ8aIbUoVWUOn3xdNsjm25z36wEPixEsMcyEx9oyiTrQaUKKwRbR?=
 =?us-ascii?Q?tatCgpjKRSYngOMuJf4oV6xIKn5zGmIPy9WP27vduICcl8ZnrF/ql9Z3VrRm?=
 =?us-ascii?Q?ZKzby2YBZivGAlXyAoLV73+rAJo1LUUOiDy1LC73ecrtvSoWSby8UIGH7U5j?=
 =?us-ascii?Q?n1CT6/tNg0fYsUHtchZ8uTuYLq+uGi5iHmyKbOpZFWLebCwbraSWLen6e+eT?=
 =?us-ascii?Q?eoaDYlBzb6mU4ibKOAwJgbyk9AOecR3x603tj+rx1tuQYFM1l9HsOKV16kvX?=
 =?us-ascii?Q?EhUea1U6gOP0G5eHaojF4cu852NJS1q0RD5jOXJ8Hgubu+sJhOyZHSn4v6jl?=
 =?us-ascii?Q?3V5ZoKz3t7RsM+Q2hv2qRvPETcYPY6Yst6+Wcc9Z2YATLRfqMs7Ycn0hWyeW?=
 =?us-ascii?Q?W5ti6Sbe9QOPF7qzt2VSutZ9XUtK4NEcywM7fFbiucuGLb6m9yq24IN50Okr?=
 =?us-ascii?Q?kjBeCD1V8YbQYH8KdpCrCceLbd/zM09eStUq3tqn9/0GlQNVIFXrg+Ztwwj5?=
 =?us-ascii?Q?1w7oIBaLd7avxx/tCL7J6uUn1BA6FK+p4jtnBGzJD5/DKioPH0PA7N0E5jMH?=
 =?us-ascii?Q?0KuNQ0P0hcWWDBecKHJyr6p1qWoPsKUvQc6mDC9HPSgAohzziRDooqU/0j90?=
 =?us-ascii?Q?GYJze3M/3ScxVeJlbYWt8t2ZZFY8XP/Lj/5ODKR4sbPxJyCWneOm4MqEwV4V?=
 =?us-ascii?Q?LRaO+YKPMObYMTtB3b2QRCVRdyhf6me54jHTGiRO838KtYg1h6cejNjeTHGF?=
 =?us-ascii?Q?EJM6pmkJBToBOba0A2sVsx9tnGvkzD1szI6r+BjRnMi9BZwICjJxVzZdHDvk?=
 =?us-ascii?Q?NhQ0aLScFcxc5LEZIFO1upCeLvguEqIaPzWYHwODMpcQabvBDO8dNlRV9+aH?=
 =?us-ascii?Q?pwdhTLJYPpWKQaFIn58Q9LPc/gl2ZBDVUVrayEGY7h6hM2n7mEMZ4pjEkkLw?=
 =?us-ascii?Q?TL4fGy17BpcOMDxx85SL/C2Gquzae+8+AMxL/3mx3NTiitTsK1CRE6RCVoBN?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EN7MP/XaoPiFMK1pgoD+lOw6VKCkrBNAkgM6qeNExSgePAIW7cOx6r6fygHNaAk9qaCUJmYRVHg6w7m19RBtDyZWZQ8TFW2upTl8P/hFR9I7lb36Hq6Fxj0zug3nfN9RoyGysudutkPyLWesjtLZnhUGKdA373VhFSHweCFLABLzwXpirtBi2kY18yAaJbzZT9IbvZljPLBHBOUGO5Xer+x06TdELgyoxhQ4hjWn3tixxqDDESdBquU+2QKvLFijL136/rthHw1gcPN75m9npQ5BMHRrxGSBxo2ToPWj4QemdEvCiJHDigPQXxz4llnj/CEHwNOB+jVWv0CS4760B6UaganV0+E78tHKsMYxbxf+WiqY6jwyW3TqgpXA2umHbs12qIQH1bDUNPDv7y745P5uAfmAsEEKalVD85IQ6dI+q027Iu513wIJJH3PJCilie0DZI7Cb80dWZjm8K8mbfLPceyJCfXteBn4TEyU8TOBFORG+2TBIbSw4lM5J5+ByktrhT1N5uNpgSv/C+OpndMDsF93ob1vBJpauhUEERV357zaUaiQC4mBxpFUXVSt6LLZE9a0ebj4du02DIcKQdrQVHtUQSe5E4NVtKKc37s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6005fea1-68ba-4a08-a9e9-08dcea6e466b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:30:52.9801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7NhBCT01Zx+E+rW1cJBJ7Uwxf1XwZf/HBqrLjSV3dcp+OIZnxovJEjd9bEIgfR43CWioIcYY24WUbxOctujJabP3aY0jlcS35G0YpGXcPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=990 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410120023
X-Proofpoint-GUID: FPOh5eeIw2nv7zMAUq2YEtbIVltDAQmb
X-Proofpoint-ORIG-GUID: FPOh5eeIw2nv7zMAUq2YEtbIVltDAQmb

On Thu, Aug 29, 2024 at 09:15:45PM +0100, Sam James wrote:
> On merged-usr systems (where /lib -> /usr/lib and so on), we get spurious
> failures like in tst.plddCreate.r:
> ```
> -: dyn {ptr}, bias {ptr}, LMID 0: symbol search path:  (, /lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
> -/lib64/libc.so.6: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
> -/lib64/ld-linux-x86-64.so.2: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
> +: dyn {ptr}, bias {ptr}, LMID 0: symbol search path:  (, /usr/lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
> +/usr/lib64/libc.so.6: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /usr/lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
> +/lib64/ld-linux-x86-64.so.2: dyn {ptr}, bias {ptr}, LMID 0: inherited symbol search path:  (, /usr/lib64/libc.so.6, /lib64/ld-linux-x86-64.so.2)
> 3 libs seen.
> ```
> 
> sed out the difference.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/internals/libproc/tst.plddCreate.r.p      | 3 +++
>  test/internals/libproc/tst.plddCreate32.r.p    | 3 +++
>  test/internals/libproc/tst.plddCreatePIE.r.p   | 3 +++
>  test/internals/libproc/tst.plddCreatePIE32.r.p | 3 +++
>  test/internals/libproc/tst.plddGrab.r.p        | 3 +++
>  test/internals/libproc/tst.plddGrab32.r.p      | 3 +++
>  test/internals/libproc/tst.plddGrabPIE.r.p     | 3 +++
>  test/internals/libproc/tst.plddGrabPIE32.r.p   | 3 +++
>  8 files changed, 24 insertions(+)
>  create mode 100755 test/internals/libproc/tst.plddCreate.r.p
>  create mode 100755 test/internals/libproc/tst.plddCreate32.r.p
>  create mode 100755 test/internals/libproc/tst.plddCreatePIE.r.p
>  create mode 100755 test/internals/libproc/tst.plddCreatePIE32.r.p
>  create mode 100755 test/internals/libproc/tst.plddGrab.r.p
>  create mode 100755 test/internals/libproc/tst.plddGrab32.r.p
>  create mode 100755 test/internals/libproc/tst.plddGrabPIE.r.p
>  create mode 100755 test/internals/libproc/tst.plddGrabPIE32.r.p
> 
> diff --git a/test/internals/libproc/tst.plddCreate.r.p b/test/internals/libproc/tst.plddCreate.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddCreate.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> diff --git a/test/internals/libproc/tst.plddCreate32.r.p b/test/internals/libproc/tst.plddCreate32.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddCreate32.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> diff --git a/test/internals/libproc/tst.plddCreatePIE.r.p b/test/internals/libproc/tst.plddCreatePIE.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddCreatePIE.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> diff --git a/test/internals/libproc/tst.plddCreatePIE32.r.p b/test/internals/libproc/tst.plddCreatePIE32.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddCreatePIE32.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> diff --git a/test/internals/libproc/tst.plddGrab.r.p b/test/internals/libproc/tst.plddGrab.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddGrab.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> diff --git a/test/internals/libproc/tst.plddGrab32.r.p b/test/internals/libproc/tst.plddGrab32.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddGrab32.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> diff --git a/test/internals/libproc/tst.plddGrabPIE.r.p b/test/internals/libproc/tst.plddGrabPIE.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddGrabPIE.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> diff --git a/test/internals/libproc/tst.plddGrabPIE32.r.p b/test/internals/libproc/tst.plddGrabPIE32.r.p
> new file mode 100755
> index 00000000..51f27ca6
> --- /dev/null
> +++ b/test/internals/libproc/tst.plddGrabPIE32.r.p
> @@ -0,0 +1,3 @@
> +#!/bin/sed -f
> +# Handle merged-usr systems where /lib == /usr/lib.
> +s:/usr/lib:/lib:g
> -- 
> 2.46.0
> 
