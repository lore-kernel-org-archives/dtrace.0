Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207C4AD2C
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365965; cv=fail; b=OC5F9TE9qjP+NOS8Xk+LcVOUT/tHrNrvlqK6n7FVEnXqlQheOVMz+Uktod5dGw9zwj8trMu9zIsStpS94fETgG/69iBuZqiz/kmFcmFx3N87pPBh4C/JXSbT+1BcZaQM6XZinN+qw/jb5ewzbmkL0ekT9M96GZUrfOr519bQfXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365965; c=relaxed/simple;
	bh=DFwHh15yLHCdr/gmBlDWIKP2NDRi7DHzBxc8OPY7kok=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=P322x2Ckce78tHKTjFd/Gl65iZ0ZEHL4/JJXIKnhKVOWZVVOI4upE4BraQUt3lHkHtqmO8XmOMcqJhuvM6Gbbx6wX3XegqAjEm74VmivR8w9vC/uqoe5lEE9YSGCmjDcIA3Uw39C0dT9YGBTNvItwSrFqNdMSkSZUeB3qvo7uTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SfE7yTrj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mCkq+EvO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SfE7yTrj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mCkq+EvO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J6CLCr027280
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=zePgBCT/P7CWnbvpoR
	5OAHJYWcrOJyWRAbQpla40MmE=; b=SfE7yTrjl7ysGo93jWNpsu5FOT79iSf8Cg
	EBvNE39S0XoFjmIgO6/b+2IXvZb83OTveshZpQ7etOQQiZ869XXZFMDkU1b301eB
	T8yQWEgWFBaOz0yQaxpf1iu7hhz0cIkkmohp92VaSUvtiHgqgZq7jNOQ+f38g0Py
	3pJqPTJ/FKA4d3Y9er/0YV9+j2HeHVmaRm44dyD7Mh2rShXsUpNZ1BMFCugxNmtM
	ycu8K8+T5J/C8uB584Ru55KT+tadXwXHovequf0ETbAevGS6v6xQ0QwFNSC0oHVr
	98q770pLwkBqSG9uxgH/UE8m6XwPTvu24kWBXVL9hrrcFcTaeHYA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m3sy8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52J6TpQj023645
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxc6nyhg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5vGxvc7wf8tAChL8jTR3CHxRV6crERNhw5Z151XKezPU7EcbjLqnCCbgDEba5wjESsrtdWxWqJk4odbsxwh3C0mw0tYI0EfsjMhJ08G4R0DyMBSPuza/QF4OIGkoDXntLfv2cH8W1XVBBSJd5wCW8rEpfei7zaiiP63mFNcLBobF/msbfpLxwxfJ6P8KRPC8/TjR2gi3PL4TAEmusN6zpCKW0sTzlPw8anZex8b/ymzawPM5orc7OssSvs4VRXY1CTMOexXZzVMIxfb4hPJuT2FZUaEvF6NIbG4GmClZivQbrq6O/r1nkIQAYNyyyvoWAuAKgUC2ahDXVVWzeduaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zePgBCT/P7CWnbvpoR5OAHJYWcrOJyWRAbQpla40MmE=;
 b=mbH3nENBj2aCkpnSV115x1/RJNpzNTl4enz9x99A/sSyzN+ZO0bw2/8P4kMIoN+bvwOGJAdsWTEJI0/6e6fMfhRBbDxp0myLyd7dAI7FNq/0x2JZv6SgU2C7+GhWoXvx5TtGeemLVRaIo1MqLtJ4mbz976G2PAo+eCWjzLwTsN9W46vQsQQ2lNbqk8s1XW3wkuk5ykOadRXpP/f+tut/sJAb+tmagMnGoEygs0fMmKuC42lN8apgtO5EculPXxFQmuwo95j6gry4gg1+MLpWRYVylG4R6e8FphqRLKUjdxF0psF4Gj7z+Bk5VJBXqy7ec6O79T+znQ05oEsWt0cK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zePgBCT/P7CWnbvpoR5OAHJYWcrOJyWRAbQpla40MmE=;
 b=mCkq+EvOSQxuxPQvwG4MzukhG0R6UEpRfWc7IHcIS7GQ8ZtqD/Au8eGfHbqzJ8TsKP/AqWANi8kqJRboBBMaC3b5XqGoL8cQBhh7+5GQ8qoyZwVGfqoNNlbcpkZOCJMZIa4Y4DqfhzLd3rDs1WX17rIBehLDEsOoS4ZJ/Jo4go4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7638.namprd10.prod.outlook.com (2603:10b6:303:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 06:32:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 06:32:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Copy fprobes entry args with BPF helper function
Date: Wed, 19 Mar 2025 02:32:28 -0400
Message-Id: <20250319063230.28171-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250319063230.28171-1-eugene.loh@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0317.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 233cd0e2-eac9-495b-7e02-08dd66afd86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PBCoSNz2H8x7w2xvq9IyK8zTSVCjmRlRvbCuynZa6P5aLzjgWffhEzpbutBx?=
 =?us-ascii?Q?lgVZ5wmgksEXzm6d0Jc75Hc/c3vrp+euJ0sG90QwLAm41IGq9gJIU7pDPfUq?=
 =?us-ascii?Q?Unr2fRoa6yQ8M8v5EqJ9NZNhZt+GcJWf7CumxHpLMzMkSSDdBnZyaNEqT1FJ?=
 =?us-ascii?Q?CiPeZwA8w3NL/R42RggO+EChrEL0RoKS063FUs2K3FhXlgRzTQiZrrBosX0C?=
 =?us-ascii?Q?Z7HIfX/Y06muIlEIzLvxQSRz3dGeBRqBgvYYa5W3jFQIjDs3mrNpcfOHtIZR?=
 =?us-ascii?Q?94dn5LJikHCZtH7iIJFAvMq8lXZvMz0MysQISDMYJoqQyRco8iSoZcBsyGuk?=
 =?us-ascii?Q?jvGIwDE5kOPiFjub4iM9svoq4DXyBR22jzTpUn6vEbvAs8BVGg1G9dnkqeyL?=
 =?us-ascii?Q?nEuMAYximhAdqX7qweXJbDc4R5CmdCHJip+9bYHhD7539HcZ1k2M698Tw2Ct?=
 =?us-ascii?Q?wKIF95iKMc4l2IUk1I1Tld3iGuuNGofR36b2DyA5v8mFvvyM168B53XsA40O?=
 =?us-ascii?Q?JoGKlySY417sFPb6orrDlbajt6DbI3DLFB1s5ud/7FhKzbjNbitG48nCf1Em?=
 =?us-ascii?Q?wCKxSkJ82tZFKMYiTo1znnFGfrxluV1+MHIY3UaV0MG6CdLBHzZCJksD8Kju?=
 =?us-ascii?Q?hmNySTfh5CslpeGSo+V8fp2LTqq0G+mwKUHCYfTiJNXAHF/4X+R0tlIQiB2l?=
 =?us-ascii?Q?RBNDhe+EY9Jqt6aMfYM9dxTBwCuoUrEGaNrzUCngZ0Crel/Qez9B9HWQxFp2?=
 =?us-ascii?Q?tfKenVZQXTGXwUkeh/WGHc9uaEAStA8hsrkr5k+OWJ2I+tU81N+tnlxzC2hx?=
 =?us-ascii?Q?+noJOahWVNEqBDOnLHK+kg7oFsHMgOXiDoK49w/tIBljRXJTonvg9HhB8Xc2?=
 =?us-ascii?Q?cZxt7RJyx2Ssk6q9dA5S3oNbNkLAS2GghtTgg5cpByjHhKQzIIOn0kbzQD5z?=
 =?us-ascii?Q?zuI4aYAOHMfqW9lrV2BZDeiZbPrBZxPWCGMKiPm/8waf29nNDHQlzEFYbnZN?=
 =?us-ascii?Q?FJtab7LQ2aSroqEigriW85WVGors1asBPuIAeNGEKBLylM/m5TZFvQl0uP0l?=
 =?us-ascii?Q?yXURsRVgluyq6Yno9H0P1tIqur9d66s7dZ06Ssksg708J5EpZ9bKA4W+rPzN?=
 =?us-ascii?Q?asEMNRVHy4eKbw8zFHQy+wUBwy/oI4uuscu4gEbU9INj4o8ZRhgRUxtxnBza?=
 =?us-ascii?Q?CssNWy4DSMxGqMer0UV48cqWf0tCBFkYwsXvYSKb15R4fnNWO6chvxdv62Pn?=
 =?us-ascii?Q?MDDamPlFcIbH1k+T9NJBdyxqXT8aG+hHwyolPWa/mtbqwre8+taUa6ROyID/?=
 =?us-ascii?Q?dAYVebqDaIXT+zPcTQV85WbHlDkFDu9i/+bARnCmr0itpPY9dWgE9i0CG/DG?=
 =?us-ascii?Q?ZFTh89ajZVz4AOnRHlTlAnA4wM7o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vlR+G9D9o6mCrK1JXhPLz4s75IgZI0YqA2oVSQW08/kMODbsMZFdBrn8rOMs?=
 =?us-ascii?Q?CYWETsnf5+m1Mbq9stFDXS/T6oKe36ug2ecAD3vplBaZ8BtG4yH8forGOHeC?=
 =?us-ascii?Q?1koE8gCa74HjaGLsx1V+GDm3Bc07EcMw8BV7pqZv06oSFoihOgxJ4bl24Ai6?=
 =?us-ascii?Q?pq6dhvrsi7UTWN920VfMUUOwr7gM2XPEURAJMlYiZ4qGz9nniU0lFcwhtrMA?=
 =?us-ascii?Q?ldzT1pKhjrZWmWuSb/JLswZvUyxX+VAWfHYuPZHgckPxg7qHBxWCa2LwxxMk?=
 =?us-ascii?Q?G65dJw2PdtosLNX73uVPflsIhXV6KNgG+QMBvqcrR/ewMBoPa+9wGaweciCX?=
 =?us-ascii?Q?PIxifGaUsQuijLaRCv9ldT57sdU44AGIb4mXcRHpk51/i6szJTVfNt+kozST?=
 =?us-ascii?Q?QYpe63spw9UT7HrPbBtOFx0FZCPNb1Vh0EfxFAl75b9jqT/vhXEqaaCRPQZH?=
 =?us-ascii?Q?Xt+E1ARUAEoBb+KCf2JT0Y8DViDouclDyJdYEXH8to+q77LIDjYLoy2SFZvT?=
 =?us-ascii?Q?gwerNM9PyyHYHxKLOe8DKpMJnuKz1CdinZQvCqWflp2k2Va5uEZIK7Zswbys?=
 =?us-ascii?Q?aCqXLteWtQDzcgkHEnDttF9ziG/WLiXdHR5JUYI8id4WGFMziaSJf3dbY/0u?=
 =?us-ascii?Q?ZZJYOVVZRRnTQI2LtA+bxcQEI3WD71H+LwrzVfpUWbXvfJ7pw/wsI1bJIr27?=
 =?us-ascii?Q?TETVNHxoPRlIeM9HsWfk1QDxU4LAAQ8Rc0Gxb7YbndmUGeejvt/HNyJKzGPK?=
 =?us-ascii?Q?8aMJxt2GBF+qgswMeEj904NJMjj06iD7za8j3fgHivkZM4i61VNSnnho4max?=
 =?us-ascii?Q?V7eSQ32yQyTskyWWHWL0qT6IFeOO3zh0SmcJC6Topd5THcDG0tNylXh3Ev5h?=
 =?us-ascii?Q?G7iyPL9FNK58NNngbQUjMdJUfIL5PX/4H1CZQFog3sGO05cXTcCTxiHSfv3z?=
 =?us-ascii?Q?HJx4N7u8wNdf3CqQ/TSsYh12GFUJLVZ1Mhr1Crp3kRXZNGSovtd8z8sSCqwf?=
 =?us-ascii?Q?6jpwgRi96q7JLi7tUSrrGXL54Fvg9+BngioUMtJ419gcWIgP7cK5ig5tPbXQ?=
 =?us-ascii?Q?b/ALyjuzK8bXcGQNXBpyLGaU1kVC94qHgVaS3KG71DcfbNlxPT3EqKOUW4og?=
 =?us-ascii?Q?e9pYKQdmLPOtYUU9uIty3HjJJ8nPPn7fnlJCgqm64eq0PY1D1ahTdWJ2splT?=
 =?us-ascii?Q?9DeZNMtoO+r2DLmDD9IDXDQ7Nn+ZdKlA8hMwKHBnYJQlSph02Hod/AtZ/XJQ?=
 =?us-ascii?Q?uxRa26Qfmj6nG+pV+M/ejqq8J2Cr+YO41yWcN30mkwTFxBRT7xW9LM/I8GFy?=
 =?us-ascii?Q?6vsVOoebUNxM1wbLBA88L/g8qlaq/KPqw3BTfCeLR6tyK6TptKOcmEdbZ3RN?=
 =?us-ascii?Q?mVcUPyuyRFC4PuEBxBRNgHhzuBe4JFkAloW04xekEBgtRejFdNTdz5kNUdA9?=
 =?us-ascii?Q?N3fLf3ekDdiOxev6b/fT2QsVn5GiqqvLPo3GtMwmBTNNaONfTXVZ2CJUqW6T?=
 =?us-ascii?Q?w9OjtGxpC8IVYKeBqWUaXVs0NKlq1iKbHilV6wmi4Ca9cqUOatGYxfrITBFD?=
 =?us-ascii?Q?c3fWmlzbnEJ/3yRCBl8ZleuBCu4N8yXF7EqnA4m2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WMhPgeuW/TKEbgTCmRNd5S0G+nxZjnVHQMVzMvaMN8Bjjudv5/KzJ4P9t1vtRKWdxap6G3XWBv7ZR5NFTEYhhq3DEMxL6NPJLXjCP7g5YYKqNKZIcAP+Vm87kYzKM97JRQqro9wYWGdqwwpInoyzsbvu7mJsjDFjy2XlopId00/lluWgCAtuJFXhhorLTEVdE9vrfNkBWgUa8ZZ4qCWulE//RSRcYH24OIXc0EW+LqjOTGawd9mz0n0M3+Upz8MS97NiWOw2SItJStCNY0d4ihPwlckJRH3z7A90ZmSX84YcL/LA7/2WfSUq44ceZEuBciw40FtRMw2ZQO7EgSDDFxKtiXEgqr46gHZl6VqhZ27lc/PXBZutNkwbd67ib7KfG/0J0fHLNwSvwT3CMC9+NNBten1r5qbF/2VRhtyfWFijfb9evNCejvL6vcu8HOV+TjjhzfUolnGXTYEikAPjblYemTKsL5o9mSMD2HbYYHlFI5K0gvjfWuKyttGZmT48ZlXj2ARj1wkHaY/U2GfTS3vQDkIGTorTulv0PKyq+AkoSLlJf/5k3RGc/xJpa5RIA1Zdqge3KYOcmSotHime8r571a2nXoIiY5i++z8/w1c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233cd0e2-eac9-495b-7e02-08dd66afd86d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 06:32:39.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rTdmfl/YTyP0UQ6DWpKeUkMlgd+PTKRaDHXJBE2hyFPWdG/nhtFepa2JADxunGPqDYju9lSE02Bh6ZLU5C0SFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7638
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190043
X-Proofpoint-ORIG-GUID: WtLF7045NIE5BaZ7YQOQDWfE7ltJ1fUv
X-Proofpoint-GUID: WtLF7045NIE5BaZ7YQOQDWfE7ltJ1fUv

From: Eugene Loh <eugene.loh@oracle.com>

With commit a6b626a89 ("Fix fprobe/kprobe selection"), fprobes were
effectively turned on.  Unfortunately, with this fix, some tests like
test/unittest/stack/tst.stack_fbt.sh encountered problems on UEK7
since the BPF verifier would complain about the prototypes of some of
the probe arguments.  E.g., when loading arg3 in fprobe_trampoline()
from fbt::vfs_write:entry from %r8+24, the BPF verifier complains

        func 'vfs_write' arg3 type INT is not a struct
        invalid bpf_context access off=24 size=8

We can bypass this problem by using a BPF helper function to copy the
arguments onto the BPF stack and then load the arguments into mstate
from there.

There is also a BPF get_func_arg() helper function, but it is not
introduced until 5.17 -- that is, it appears after UEK7.  See Linux
commit f92c1e1 ("bpf: Add get_func_[arg|ret|arg_cnt] helpers").

While the already mentioned test signals the problem and the fix, we
also add an additional test that actually checks the correctness of
the arguments.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_fbt.c                     |  14 ++-
 test/unittest/fbtprovider/tst.entryargs2.r  |  29 ++++++
 test/unittest/fbtprovider/tst.entryargs2.sh | 105 ++++++++++++++++++++
 3 files changed, 147 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/fbtprovider/tst.entryargs2.r
 create mode 100755 test/unittest/fbtprovider/tst.entryargs2.sh

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 8aa53d643..50fa0d9dc 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -285,8 +285,20 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	if (strcmp(pcb->pcb_probe->desc->prb, "entry") == 0) {
 		int	i;
 
+		/*
+		 * We want to copy entry args from %r8 to %r7 (plus offsets).
+		 * Unfortunately, for fprobes, the BPF verifier can reject
+		 * certain argument types.  We work around this by copying
+		 * the arguments onto the BPF stack and loading them from there.
+		 */
+		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(prp->argc - 1)));
+		emit(dlp, BPF_MOV_IMM(BPF_REG_2, 8 * prp->argc));
+		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_8));
+		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
+
 		for (i = 0; i < prp->argc; i++) {
-			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(prp->argc - 1) + i * 8));
 			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
 		}
 	} else {
diff --git a/test/unittest/fbtprovider/tst.entryargs2.r b/test/unittest/fbtprovider/tst.entryargs2.r
new file mode 100644
index 000000000..efc4685f9
--- /dev/null
+++ b/test/unittest/fbtprovider/tst.entryargs2.r
@@ -0,0 +1,29 @@
+mode READ           : no
+mode WRITE          : yes
+mode LSEEK          : yes
+mode PREAD          : yes
+mode PWRITE         : yes
+mode WRITER         : yes
+mode CAN_READ       : no
+mode CAN_WRITE      : yes
+mode OPENED         : yes
+buf: =========================
+count: 8
+pos: 20
+abcdefghijklmnopqrst========CDEFGHIJKLMNOPQRSTUVWXYZ0123456789
+
+mode READ           : yes
+mode WRITE          : yes
+mode LSEEK          : yes
+mode PREAD          : yes
+mode PWRITE         : yes
+mode WRITER         : yes
+mode CAN_READ       : yes
+mode CAN_WRITE      : yes
+mode OPENED         : yes
+buf: =========================
+count: 8
+pos: 20
+abcdefghijklmnopqrst========CDEFGHIJKLMNOPQRSTUVWXYZ0123456789
+
+success
diff --git a/test/unittest/fbtprovider/tst.entryargs2.sh b/test/unittest/fbtprovider/tst.entryargs2.sh
new file mode 100755
index 000000000..f5b435f56
--- /dev/null
+++ b/test/unittest/fbtprovider/tst.entryargs2.sh
@@ -0,0 +1,105 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# Another test of entry args.
+#
+
+dtrace=$1
+CC=${CC:-/usr/bin/gcc}
+
+# Set up test directory.
+
+DIRNAME=$tmpdir/entryargs2.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make the trigger.
+
+cat << EOF > main.c
+#include <stdio.h>
+#include <fcntl.h>  // open()
+#include <unistd.h> // lseek(), write(), close()
+
+int main(int c, char **v) {
+	int fd = open("tmp.txt", c == 1 ? O_WRONLY : O_RDWR);
+
+	if (fd == -1)
+		return 1;
+
+	/* Move the offset, then write to the file. */
+	/* (We will overwrite some "middle section" of the file with "========".) */
+	lseek(fd, 20, SEEK_SET);
+	write(fd, "=========================", 8);
+	close(fd);
+
+	return 0;
+}
+EOF
+
+# Build the trigger.           FIXME do consistent with Sam's changes.
+
+$CC $test_cppflags $test_ldflags main.c
+if [ $? -ne 0 ]; then
+	echo "failed to link final executable" >&2
+	exit 1
+fi
+
+# Prepare the D script.
+
+cat << EOF > D.d
+/* these definitions come from kernel header include/linux/fs.h */
+#define FMODE_READ	(1 << 0)
+#define FMODE_WRITE	(1 << 1)
+#define FMODE_LSEEK	(1 << 2)
+#define FMODE_PREAD	(1 << 3)
+#define FMODE_PWRITE	(1 << 4)
+
+#define FMODE_WRITER	(1 << 16)
+#define FMODE_CAN_READ	(1 << 17)
+#define FMODE_CAN_WRITE	(1 << 18)
+#define FMODE_OPENED	(1 << 19)
+
+fbt::vfs_write:entry
+/pid == \$target/
+{
+	mode = ((struct file *)arg0)->f_mode;
+	printf("mode READ           : %s\n", mode & FMODE_READ      ? "yes" : "no");
+	printf("mode WRITE          : %s\n", mode & FMODE_WRITE     ? "yes" : "no");
+	printf("mode LSEEK          : %s\n", mode & FMODE_LSEEK     ? "yes" : "no");
+	printf("mode PREAD          : %s\n", mode & FMODE_PREAD     ? "yes" : "no");
+	printf("mode PWRITE         : %s\n", mode & FMODE_PWRITE    ? "yes" : "no");
+	printf("mode WRITER         : %s\n", mode & FMODE_WRITER    ? "yes" : "no");
+	printf("mode CAN_READ       : %s\n", mode & FMODE_CAN_READ  ? "yes" : "no");
+	printf("mode CAN_WRITE      : %s\n", mode & FMODE_CAN_WRITE ? "yes" : "no");
+	printf("mode OPENED         : %s\n", mode & FMODE_OPENED    ? "yes" : "no");
+
+	printf("buf: %s\n", stringof(copyinstr(arg1)));
+	printf("count: %d\n", arg2);
+	printf("pos: %d", *((loff_t *)arg3));
+	exit(0);
+}
+EOF
+
+# Run the D script and trigger twice, once with O_WRONLY and then O_RDWR.
+
+for args in "" "dummy"; do
+
+	# Prepare the file to be (over)written.
+	rm -f tmp.txt
+	echo abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 > tmp.txt
+
+	# Run the D script and trigger.
+	$dtrace $dt_flags -c "./a.out $args" -Cqs D.d
+
+        # Report the output file.
+	cat tmp.txt
+	echo
+
+done
+
+echo success
+exit 0
-- 
2.43.5

