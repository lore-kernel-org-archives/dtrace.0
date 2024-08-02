Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E781ABEC5
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 18:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722623666; cv=fail; b=HNVJWZ0dwM5iNmESKXkFZ72YMf//KzXZELC2ixuOvj2Tb66nUFhWHDOjbHlDEVBiKpunzgzXO1mYLH0X31uOAhCGPFlAMZ0w1g8sstAMSCbsyGVrQ0bVCp+C+mgAtLLKz0ckZKzzchQnvkNW5qahWiLbTEngembPhZtfnBQ5wic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722623666; c=relaxed/simple;
	bh=mzEwqpVDuxAk/iFME/BkPVzK/Xv2xaORHGScA0ZX+jw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=MkTMmqPtJqeLfrVtRspod1jSw2mJQjA2f6Ix1Ao0bOebEylIbBChmtKzLpJwpRA3vIAd/59pVp53ziN7bXE1srDxjZOE14heBo0YsF4UtxDQia15ZHD1mYoCWRjeuFGneqzfLC5wMM/G9Oq84N+DrjXrRSFfYiygUOYxESxaqCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z9Kiv+zo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gsY4Q2wc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z9Kiv+zo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gsY4Q2wc"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtXOK022309
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 18:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=wa8rDbiho72uC6LBiVMp0K6WiH0ifMC36pFnITBOOxc=; b=
	Z9Kiv+zoYDqlQwMm+IxSN94DeX1A/0hsOpjr4VX5DZCPRbSX7UyR2FNdeWF7Z8ao
	hxBQoJ/MCXEUr4DYejHJ4h5O2DSNkIAs0Zo30kc4h65EqeRxWW+tkiGfN6paTKl1
	mnCL2z1igo97G70fxR4q2cMawCg7U5QjYoFnMrGoH68bUY89nBnMxEm+8y3W8pvd
	cs7uvTI2TaOUKLSnEzAG/n3Iddb8XYcnYayMq/zOAUEB+bf2lG2a/p8nkb2smc7s
	eVkceOcKGM0/o1eCdi6BAlOjYMDgWKGZ+fuNvGxInZYvgofHY7F3+mjN0C0VJi1Y
	ZqjBhkc9DPvv+L4mjw7ogw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdwhyxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 18:34:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472HuSDX002519
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 18:34:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c4jkqf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 18:34:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnhYeaYnaOBqnCAyZlRgvImmqjjNF0P2Mg9FSbJTkplXE0RTOFk+kPrhnHcRKiPPuyTNo8BVoWqJTTuXBhtAiAdDYxGb5K01KzNqZqmsj5bU4QV2LO22tLewkacMteDq+wh3zwFds5ofGpnxHpCocSBXP584+4IE5jNtwGviBwKpDVJ+rserF66k6Z7H2rvWFzW1UZiYUq0uvl+uvSBVJobACvJfs5AmkigfkVx0r4/LB+MeD5yvipQ268L/pONCJFgCF291C1UU6ZyXCZL5JRg/sJ8mxpLE7elL+QL7q6Kq4LD6P1cgxmcFl5wjmzoJAnpO/340Ylyu6cyA8Fo98A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wa8rDbiho72uC6LBiVMp0K6WiH0ifMC36pFnITBOOxc=;
 b=UnXU+4n6cJblogFSKj4/FTe5zg5AAm3Nqx2Duqqvi+jyxp2DBFAmMdu/c2ef3n0ZVLhkjpaxjMjFys+l9gAVZWUTUMjGz/S+OFeGFz/zcV+vn9cpo+zekcvzAurkDglYhQyJdSqQLs4Ry5pOhsRQZp6cO1odYvsDQOuKW+JJhRWPhdbWhioWTJMgCa8iZpkiL/MaXRcsAcW9tenf4P4P4Vuth/v+t2dNFPlCfBvhmwmR6g0rfcBSKqBB2EjAbIc2ytR70hTo0xiv+/MKueo86ovkTbv/3Hs6BKE7HEyOjKfsFp2rNplRSjSENi1nbBoedOAynHMkRLYiwVw0Tn19EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wa8rDbiho72uC6LBiVMp0K6WiH0ifMC36pFnITBOOxc=;
 b=gsY4Q2wckLqRJej4fZgDF8aExpgaYRNQXqT/Vfr6ThLY3myNB+pkw09MOdEWcZXLsNrArGZoW/GP3IXxYr1oPvYF07OGJ1LmVn3/AsRsyOFRIK7B36DTOPcz01Lx1VzYpY38RYjyYtn2w7ZiCsaJPVRfXZ7b31yf2upMMbF0JG4=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by BY5PR10MB4387.namprd10.prod.outlook.com (2603:10b6:a03:211::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Fri, 2 Aug
 2024 18:34:18 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 18:34:18 +0000
Date: Fri, 02 Aug 2024 14:34:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4] bpf, fbt: do not try to get a return value for void
 function return pronbes
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0035.prod.exchangelabs.com (2603:10b6:208:10c::48)
 To PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
Message-ID:
 <PH8PR10MB62928FE15529A234FD7FD361C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|BY5PR10MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 47161f40-6dfa-4c4a-98ef-08dcb321b7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QSI88mLQRPQYJlSAuCs/pWDGKydYO1xqSxfsOqUg89vX/DMcIwteKijTTyue?=
 =?us-ascii?Q?RASH+nmhZBa9rgmMWS+O9i18Ga+whIw6Z0YoI/dz0xbU3tugInDOCjuU2Lut?=
 =?us-ascii?Q?oP9lCRrTtT3+aaxUdLr+rGhjAO6dze4bgG1MA5m+QItp+86ygXuAiVSYAQ1g?=
 =?us-ascii?Q?cKBVYk4ZGhoUwrzd/60/T6039iM47bz6E0vZZuEhiGKxIQL101/Gy5cR05LB?=
 =?us-ascii?Q?ndYDQ5DynYDbCXmxHLSb9gqaIFwYrt1KIg784PtlX/Z9qHV6lcWbsvemWSh8?=
 =?us-ascii?Q?BvCNLISk4cx8lXOcWD9LqwzWi4n0Gs6EZzGFlN9+/P8c7XoaQFOHQrWuCh3z?=
 =?us-ascii?Q?zpFe2ZRnuWykhSyQ6qEIqr1QoliSzzg4r2+Ou0xnKRxUi4KaWP82vVDfFc/g?=
 =?us-ascii?Q?ZR1mi2tZI6YAWyVHV3Reu4wGMQN1NKummRQ4VlkHHBwiYuqUwav2wZfahGMV?=
 =?us-ascii?Q?Rj9PrC0L4aguAJ91nyPlaVJM/vJMPy/GQahPGvejtcWMyefYLu+yiGq3R9Sy?=
 =?us-ascii?Q?sFER4aiYS7QNpHK4X/yjsiwnbQV2gO1lC0pJQZlUllxq/Ss+74NqyNdJVkui?=
 =?us-ascii?Q?6DhLv32xu4xioWDQTkzR6Dn1UBUU7+C2GmGldTSBFPwk9SkQl2YDlnAHJ1D+?=
 =?us-ascii?Q?J2HrR1uauDY/7A8dStEKvTvpwyBxm9kixm8sqsZLFGAZnRL0vHoIp/+dlAir?=
 =?us-ascii?Q?pTndboVhfwX2Pzb3qeUl9sv5oHyJTIFNOIR0ou7Ax5vdBFJZyS6FlXIQT6QG?=
 =?us-ascii?Q?SPmCkx7CPEJnyxjlatqivfig2gIseDMC3NjcljJ8mHeoBlduIt1183mvzG6A?=
 =?us-ascii?Q?BCDzcw9dIkiXstEaX2BJJ/dIJjpFHjzIRP65eA7kxo2v4cvqYV7w/hHX4i4a?=
 =?us-ascii?Q?SyIH0FdPNAJfvmhFnM48LNY3IO0+NIGKDSzjFqv9LH08kvYfX8CKjNhg+wNi?=
 =?us-ascii?Q?K4+DUgP4xXOTlJNLoFpm6YPEeNUWGbljGG1/mNSzxYlIyJhKOdmv2UQEmxEz?=
 =?us-ascii?Q?KV61m6LpvUjR5MaWqv9O1UVoKy1glSc7sVXHhs2lmZsEfjD9gH08aRH5yy4t?=
 =?us-ascii?Q?Y+UlyLlSJFwLJ27f5DX09L3CJWYAvXSgf3xitbHT6btIohmGMpst2kIhVZzS?=
 =?us-ascii?Q?66ehCEUS+z732sikAGy3ZGI4yTcgOnvZrwqfc0J7cDQHkg2EeCrcWMJrjJrO?=
 =?us-ascii?Q?EUuS7A3pJtBcOejKjZAHCouvkVogLo9ruESE/L6FXIg+NGt6ljLQ8PEXDQbe?=
 =?us-ascii?Q?V4uFwkIejsGOixqjGlfN6NqlQBgi8RWh9sgK1S2TIsV57FDg7wse3AmxT2yH?=
 =?us-ascii?Q?yxSpmxRYTQJIM5/PX6OVaU4uyCL68qIOk+wf/pi0tjQwjQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kfHmubIJqDsdJw3/IYK/zNh6fPwDX+MFXHqYzl0n60TmvS3OM8ug9MAK8jqU?=
 =?us-ascii?Q?3xgF7ocJVcb5H+nid0GeqByYP78Xrge207+2IvRXSnbGxDoZvVnPw5jTzetj?=
 =?us-ascii?Q?jCOVigXmaMUjtM/9tBOBJEeQy9+ODAyXt7f1i7/IDmdXSteqkELGWfzzwNil?=
 =?us-ascii?Q?I33kdb+9PX5X2cv7F5vYdG+4p/3bVhpZKyH4kkE6PzkcCaEKgHNk8EFiWpxx?=
 =?us-ascii?Q?ETJF3xBFACoQmOG8kom8cPklA8X9QPVqmDZgsH34bjxguizgxpdmivKnHBdQ?=
 =?us-ascii?Q?Z5mc0kXG8LhF99e85UyblENjs74P3xaFnAdvnmRgNpP1GDzZ0ZIGojuw354U?=
 =?us-ascii?Q?HeSnBA07F5ULy9Evi+MYV5VVJr2nj7cCSeTUJ36nAY0D9UfRIiRN1kQn3OKO?=
 =?us-ascii?Q?8+I8/5jUDq3Q1cLqdV3pu7O1ywqYJ6kwrb1kV/oR+e7z5ac4x/7s9m6kJG7a?=
 =?us-ascii?Q?QMEpu0vxiCpQGELwl0J9qyr+e6RwzB0HmC0DTSaeHBPKFNoNo/luNtlICt55?=
 =?us-ascii?Q?eh0Hwvy58/QC/4+sy+J63l33yYkskGrd70JnMcfJRKBX2IV3Pk5u7CnJZVnY?=
 =?us-ascii?Q?ySj31YHtvMLUK70pZsUTcq6p6jF0TQmf/GW80QAfLinjk9pCYpjjnAKDUbGE?=
 =?us-ascii?Q?ZAzaaBWQqxO3FTwDMuDKWzcvY+vNLKJvje10rx/fsiPOUblne9f2eruNocNp?=
 =?us-ascii?Q?ZIpP0ZlZsC1NCxfr5QwbU9vonnWb5BjDPp6LJNI4x3ZbqtQh4RfsEyM1/erZ?=
 =?us-ascii?Q?kS14n5f4J1+NgV9gy/oNg2IFQrCyPANW264FZE07jlnuMUtp55x527pBdZoU?=
 =?us-ascii?Q?7sT/jPVkEC6hfqMxJwS0gTEpOWxIEbxknFIeemsvvs6plJ/rbiK/bkCWwpgN?=
 =?us-ascii?Q?GxfpUC4E2Sm8H9rZnesuwPDpjji1s/nfMKSe8Veyn1xulsMS+o+MGQIg/hqy?=
 =?us-ascii?Q?NAiIVpVSlTBqNQZ6JZz/ITYXF3ukYO3PL14QqIiJIY17/BBeDV3DpOAhEe2M?=
 =?us-ascii?Q?iGmq6bq56KDVcsSqYfZeEUYqe9FsZYQs/8WbSTA4psHloysE+WoZWZ6bnpGN?=
 =?us-ascii?Q?YQ3sVArxvnoUDTC9CHYV0io6/wVdsWDn+tUmwGH0mLxMZDhZjrzS+TVd518G?=
 =?us-ascii?Q?TCHtb7eoAfa1QV8YwLO9sJtbv6DBXpEcfr29AGJHh31r0Snn5d0kXA5t3Oz0?=
 =?us-ascii?Q?h4lezOdgQtz/ImAa/AEEcLlBMRUrkihV3Uh5RCFFlQU1mdGyIb3NXqTu/uFs?=
 =?us-ascii?Q?6Dsy3vSKoVEBbH6J9msnsIGmjVfgn4Dae5tGWW8WfXX95bE9xRAeZ3WPYr/m?=
 =?us-ascii?Q?v3h7C30qxjzJ1Q0h9Wo1feHhlrn8ZCaftxYtRecfcCcPGef8pHwOE/oXlP8P?=
 =?us-ascii?Q?H32LYEtQcEJ6ChW5+7k2QGZwfnRsDdy7opJJ6GkYfixzEnPjcpQWqJ0DQkJC?=
 =?us-ascii?Q?6DaxjDy0N6/BchSxQlczSi2cS/DrR6qCpf9QFC1L0RyygG+YnNmgB+Bfm1as?=
 =?us-ascii?Q?L7z8bfL3Sn2mop085MnQugWFvx4FqdLRXivaxQFQrMpNlKTTzmSPcFp0W11R?=
 =?us-ascii?Q?lTAZ14lYjTcJp2pOieYGYMx+6ZtmXw3bqZm2wO74tF+Bb5lIuWQUUqcCKGee?=
 =?us-ascii?Q?fIQvTdxO4w9AQ4EwezdF/jo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b3TB82rEBCeoArhHQwLB/qv6B9LluN1nCplll0ajMF/w9rpApTADtIaUHV7KQImQ1lUjlxQeG3MXqVEhkKMGKUD5jiS7HPMvyxR0Ln/iCAhKuKG9SbXQLodwn9isM0R0DDPo5Or31Be5jQ045UbAhVD+C+lmY8G4/lHd9rjtJI4t26YI6rhx+fTd/j0goKYsucDzBQBJVSOoO3zLRj0a/QgUYalmZ78MWP+q1r8eSiBfPrGlqOjRmD7DN/qG2dbwIgRVRwkZMFlOME4+gXS7BUXIvnGPad6rRGe1/gdUBs6UJA5xI2fkjNhjoEgt4MUh8PThGOD0b4UTKhxi+eM/hhGXr3g1R8l3qVIifomHHTl34xjSN7YTqpKQIY6vWAOolwnQWbCzP0Wu8WF44cCZZQ7W4klqLjQLFK+cL104vwhfR983zGxzI/mPt1i84n1bFdsfyDtWFzCNUS2ZvO1T6Ssdv/L9gjFooclJBBI4iEPc05T96thy03htz6xyMQKRVS4XsGolBZiHJUKp05aOqtWXuQ736wLc087H6UoqvLrcmPrLQGZq60MZCRm2Vru1VcwC4OS+6hgU4lZaG24HgYoTgz5Zfc42bwBBhTMcfuk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47161f40-6dfa-4c4a-98ef-08dcb321b7cf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 18:34:18.0818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qAQ4ezL+0zp/E1Yc2m+FgJcSWaCb0YsPBIsMhNTUC5pXqnb9WHQObnXDWFpS2GDefndhUgV9ppg7P0qxV1XDywY1AVUpF+7vz9+2VZBPVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4387
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020128
X-Proofpoint-ORIG-GUID: 3z2lXmQ2k_kgU83ptiQMEOSrRBEC6Vb5
X-Proofpoint-GUID: 3z2lXmQ2k_kgU83ptiQMEOSrRBEC6Vb5

We were trying to access a return value for void functions, causing BPF
verifier failures.  We can determine the return type when getting the
probe info, and set the return probe argc value accordingly.  This then
drives the code generation in the trampoline.

Reported-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c                            | 16 +++++++++++++
 libdtrace/dt_btf.h                            |  2 ++
 libdtrace/dt_prov_fbt.c                       | 21 +++++++++-------
 .../fbtprovider/err.D_ARGS_IDX.void-void.d    | 24 +++++++++++++++++++
 .../fbtprovider/err.D_ARGS_IDX.void-void.r    |  2 ++
 .../fbtprovider/err.D_ARGS_IDX.void-void.x    | 11 +++++++++
 .../fbtprovider/err.D_ARGS_IDX.void.d         | 24 +++++++++++++++++++
 .../fbtprovider/err.D_ARGS_IDX.void.r         |  2 ++
 .../fbtprovider/err.D_ARGS_IDX.void.x         | 11 +++++++++
 9 files changed, 104 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
 create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.r
 create mode 100755 test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
 create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
 create mode 100644 test/unittest/fbtprovider/err.D_ARGS_IDX.void.r
 create mode 100755 test/unittest/fbtprovider/err.D_ARGS_IDX.void.x

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 77366df6..e905580f 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -980,3 +980,19 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 
 	return -1;
 }
+
+int
+dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+{
+	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+
+	/* For functions, move on to the function prototype. */
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
+		type = dt_btf_type_by_id(dtp, btf, type->type);
+
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
+	    type->type == 0)
+		return 1;
+
+	return 0;
+}
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index a7cee464..e05b30d0 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -25,6 +25,8 @@ extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
 				       const char *, uint32_t);
 extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
 			    uint32_t id);
+extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
+			       uint32_t id);
 extern int dt_btf_get_module_ids(dtrace_hdl_t *);
 extern int dt_btf_module_fd(const dt_module_t *);
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 461d5e35..80c3db20 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -199,13 +199,15 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 
 		/*
+		 * Only try to retrieve a return value if we know we can.
+		 *
 		 * The return value is provided by the fexit probe as an
 		 * argument slot past the last function argument.  We can get
 		 * the number of function arguments using the BTF id that has
 		 * been stored as the tracepoint event id.
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
-		if (dmp != NULL) {
+		if (dmp && prp->argc == 2) {
 			int32_t	btf_id = dt_tp_get_event_id(prp);
 			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
 
@@ -240,7 +242,9 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	dt_tp_set_event_id(prp, btf_id);
 
 	if (strcmp(desc->prb, "return") == 0) {
-		argc = 2;
+		/* Void function return probes only provide 1 argument. */
+		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
+
 		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
 		if (argv == NULL)
 			return dt_set_errno(dtp, EDT_NOMEM);
@@ -250,13 +254,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		argv[0].native = strdup("uint64_t");
 		argv[0].xlate = NULL;
 
-		/*
-		 * The return type is a generic uint64_t.  For void functions
-		 * the value of arg1 and argv[1] is undefined.
-		 */
-		argv[1].mapping = 1;
-		argv[1].native = strdup("uint64_t");
-		argv[1].xlate = NULL;
+		if (argc == 2) {
+			/* The return type is a generic uint64_t. */
+			argv[1].mapping = 1;
+			argv[1].native = strdup("uint64_t");
+			argv[1].xlate = NULL;
+		}
 
 		goto done;
 	}
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
new file mode 100644
index 00000000..4bdf36cb
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+/*
+ * This should fail compilation due to accessing args[1] (not args[0]) for a
+ * void function without any arguuments.
+ */
+fbt:vmlinux:oops_enter:return
+{
+	trace(args[0]);
+	trace(args[1]);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.r b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.r
new file mode 100644
index 00000000..8bd3dd7e
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.d: [D_ARGS_IDX] line 17: index 1 is out of range for fbt:vmlinux:oops_enter:return args[ ]
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
new file mode 100755
index 00000000..fb503858
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
@@ -0,0 +1,11 @@
+#!/bin/bash
+
+# Skip test if FBT probes do not provide argument datatype info.`
+types=`$dtrace -lvn fbt::oops_enter:return | awk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+
+if [[ -z "$types" ]]; then
+	echo "FBT probes without args[] type info"
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
new file mode 100644
index 00000000..516d733a
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+/*
+ * This should fail compilation due to accessing args[1] (not args[0]) for a
+ * void function with arguments.
+ */
+fbt:vmlinux:exit_creds:return
+{
+	trace(args[0]);
+	trace(args[1]);
+	exit(0);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.r b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.r
new file mode 100644
index 00000000..720d2f97
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.r
@@ -0,0 +1,2 @@
+-- @@stderr --
+dtrace: failed to compile script test/unittest/fbtprovider/err.D_ARGS_IDX.void.d: [D_ARGS_IDX] line 17: index 1 is out of range for fbt:vmlinux:exit_creds:return args[ ]
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
new file mode 100755
index 00000000..79677007
--- /dev/null
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
@@ -0,0 +1,11 @@
+#!/bin/bash
+
+# Skip test if FBT probes do not provide argument datatype info.`
+types=`$dtrace -lvn fbt::exit_creds:return | awk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+
+if [[ -z "$types" ]]; then
+	echo "FBT probes without args[] type info"
+	exit 2
+fi
+
+exit 0
-- 
2.45.2

