Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A0713B58C
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737066292; cv=fail; b=gmNNknwRZHlF9S3ICPJvt6D+pBbIHxIcbMCXvzZEksCWHDMAyHIS7oPG+BdYw+ORERdhXF/Nn8CKkGj+yog7C7J7i5yD4gX6b153auD5WvFu3UDTuUzdyUgLE4R7soh5t/S0DWetSims8agZNJ/qn4YWUMq41Rh6fh/94Lzc2Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737066292; c=relaxed/simple;
	bh=LMJ5qos9SHkAKvMafAZ8QKd+Vtle3JjPu/nF7mfRlHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KXNLxeyCF8dlFt5FTBf8AcU95T2J3BLjRfp0O+Fn2zfuoN7LD2HuxyxyoUzgL8YgyaEL9KL69/11l90YkSlxC/qUQoPjA3YJfPYl+hRAYdDFlwBUSzRunCwfHRTF+6OCqxGg9l85I6qJg4IIYPPOtZ+vhq38JBpIEkWJiReE99c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RNgwTOO9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tZgABeZ9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RNgwTOO9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tZgABeZ9"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GMBpSd031448
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=o5QXq1XQU9laa0kNOk
	98vuB+S3Uddl+yB8LJUISZG7g=; b=RNgwTOO9SYPb7R2YXaAs9raKvGcKpm5ol4
	wW+EgMaCxapLsnCN64bTFcALAwBO6xfKb3iUiQVf8V64ov6YIT2SeLWSKTdsPcMS
	jsErzK+o+1swBQlRX6VsCuo4NSEzDCBA0wO0sgi5wLFOGb/Af5fHqdyvXGSW6IFf
	3udo/XsuhWqnnI6vUJCVj8e2HBKA2i5eTN5mXBXPDLu+w7Ntcb0+C4WR8QImhLzJ
	i+LwGZK+Rb09D7rVGvbsQZM7fHScx4FTv7ISTZHCBnnoZSg361+glMalzos+tZ2u
	idwI2b0mXctW/dtYXJm+75daqD542vxdDo2sdyAng4gPQmicfdwg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 446pdx26mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:24:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GLkg1O036286
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:24:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3c0904-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:24:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AxfCN+Bt1QFPTtO5/+Gu1xfFhdp/eO+ENxVkvETDKMUaYxsx4bmy2wZqG2mUHcuVeBEd2l3Vk1b5fCSRZQnNejpUzkMFZcXeoNPG6Q8qNLotOB8iKBbbnID+whD8wmGpci888Tpsoi8+t1tzWkqK0r9yOgscrCl1Q2TFA6mZXrinmz5Q8vPw4Jo4tJ/wiJ1vELFSOLOt+qkRV0rqG42zL9YyMk/MvRUqB4KF4C7rHcFrWXWTZI8OjoaoC160pcxYXsr+GclAJ08n2mFAP/nUAKwOuH+v9yPuk2zH/gLxL0YK0n65vS/c74y2MZiB/qTFp0q2y88PHUMOlf66Lfs/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5QXq1XQU9laa0kNOk98vuB+S3Uddl+yB8LJUISZG7g=;
 b=kMBiYzyEKMyfOTnVi66zOmp4s/2pMxHh0sfxQY4lkmELWQK2k40MiYnUDXDl9w8c442+o0HXAJjPYxr7IRcPvs5lzPlgFj0OZWskeydZPhrzG753EFWxbzoeQZkl9erVxjmJgqf74EoMoQqTlqHE2XPpUd/T+nmhxUUiy8LrEYMZFfb12l5lANqQIWdoR9GLCnBVUpvxVklteXfc29uCXdntpewkSadVlvDPBEqblTethcmnfqCGxWyBLXwL3N9/CtS72jKGKK6tgclnyA/3vVE/mQ4pjJfxQl89sbx8YRUwEFqFsJVwZlBF0EBLOedSMaxxsHrvCLG/989PNnjztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5QXq1XQU9laa0kNOk98vuB+S3Uddl+yB8LJUISZG7g=;
 b=tZgABeZ9AUwgFDcaJF63t3UZA230VRWTilxTECnekmIZ1QnoxwrfaOok64bRgmDqNX4bcJIoA127odRDtvvSB/miMxyPClXMd9/pAT4c13BLxeleWKdQVUXCYY4nMgw8cIwYU7W3SsOX/sBVwbxX3s659mu0x6JdKPNM0ZBxo98=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Thu, 16 Jan 2025 22:24:46 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:24:46 +0000
Date: Thu, 16 Jan 2025 17:24:44 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] drti: do not compile with LTO
Message-ID: <Z4mHLMzMMQpKKAkN@oracle.com>
References: <20250116215418.417155-1-nick.alcock@oracle.com>
 <20250116215418.417155-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116215418.417155-2-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 3894a8ba-1000-42be-3570-08dd367c9563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sEUdGEiHBYv2nUaNiMoBlIskzuVNCq/CbiacGr/x6lo2LRbKD8GK/y72gkm6?=
 =?us-ascii?Q?Ci5smAbsPUGnjN6GsedzAKzl1z830qBbh47EsaplB0kxRWgHQakrVyyZr4p4?=
 =?us-ascii?Q?0ktNTwizC+Sws7onZTWsehJ9p6aT/yRc1SVm6VRHuBZCYOe4mU8886iDHvOX?=
 =?us-ascii?Q?K+wv47OsxTaljWMOUMsl71Wk3+eSnN0bOLfPfAaosej+Ve/s1m5/7tujnnvZ?=
 =?us-ascii?Q?EZmGCAwf7j4/K6gG5IYkA9SBIEPDsqsUkNdfynozXwtL/Sr+FMUCJ0e/+Wge?=
 =?us-ascii?Q?06JRSl5n4yJvjUwDwqayF2wWZGm5yJ9FgqcOeWSOqkcAvy4jOctTbSgmuUBt?=
 =?us-ascii?Q?+haKd0Zap6OqACYb0eiwIRMr3Xdj15NgaX8E8gs5WTKeRRpN0qnbXNAKuRdB?=
 =?us-ascii?Q?hdJ7CZTOXZSFjooWAYFk9aGJGwfZoeCvQUEUydFBJ7Lg5qgASAhggMW6VIlm?=
 =?us-ascii?Q?iO9UwY4KHMjEHaAbUT+kpPO2o328LIiVH462Xy6/gp7i7THIGio3j0UH08JR?=
 =?us-ascii?Q?zZ1gc9T2IHKzuDwO0n9gjE3mnjrlYbNUYXEmA0e+HB1QbL83a9cEQ14VMNJ8?=
 =?us-ascii?Q?YbGby6R1NPIewipStWmkViAgHDgowaE4MQmNkPjcj+n8vFg4ZsDVM/wTs/n+?=
 =?us-ascii?Q?oTfzQDZEpUcamRSbwTMouyJTfRYaoaTI6Gl86qGYNibRdhxLXKbGcqZEN53M?=
 =?us-ascii?Q?8hAUUxhR4pOaKEhwiyJAg0IkyHnfMhao3v8UmYRbfZkHIsJytoT//M13cbaA?=
 =?us-ascii?Q?cURbD8FVmN9f3cGyTC0LMpalc1vPRXlbtlSC4DgYwO1GKY2YbNRPQij2M9wP?=
 =?us-ascii?Q?GFr/+zxwvbd5FC/ajulhJY2zpzREfmMinQsoL4pEC7Hby20Mi9SMSsA/uE16?=
 =?us-ascii?Q?ztiI3LVICCkruXQGRKiFRUFqYgUtAmHk/Yj1mCy+/6N2MYa6/WjO8r3oaG8E?=
 =?us-ascii?Q?+/y1IJlpyAXtD8RROr5UOgroXAda3PNd4jxCPMpg+vQIVSNdI782pUviw/24?=
 =?us-ascii?Q?5A+IYl1jmqNcfrFMqZ774UNBFQzHh9O4P27rbMJ5vOnX5jBn1gWhb9SY+6Rs?=
 =?us-ascii?Q?18FYrCLBhOkBDMQqHoAJVIEqfmvz4pYq/0n23cyOkIbgYYSbZM82yY1dxDOx?=
 =?us-ascii?Q?Qdm1WwgbXte7omMVr/ID5Pmbyh4jvYIl5ZhJf/3GXA7UicFfNTgQBKhTqIkH?=
 =?us-ascii?Q?RYCIFq3dRMcHTEKdB0dpF0ccilQguDkfFFU3Ob0F2erZNEctlGwqmbGAtBo9?=
 =?us-ascii?Q?6O5q1OhUXaeJZc1bHFC9jQBVKBFJl4nuphp2pM2lJi6ePJ1WLoJ+EM+tZRyd?=
 =?us-ascii?Q?inaTAGqWkOoBHwq7E5FX2T7H54YlPFdAJx9wV8R9gKhjcK6nXkr5cS3bpSaH?=
 =?us-ascii?Q?EqAON4ta6/N+RybKLI6zmNCWL+G3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?piZxQyuC8x8/eJKlBHUYc/mb+KI1m+lw8Uyl3IJ0iFs3Kp3Kp5+Dm7S1V7zw?=
 =?us-ascii?Q?oigLtJBWfoxzMjrwZDO+I+rL0AcaAC8CxUI06Gplz9wyU83wta3HrAD5NAkQ?=
 =?us-ascii?Q?nyo32Iqn5dp+MBoffVlU+BwN1zyO9LjnjqK/DQNsMCJNe2FLzkRDF8AOIxwA?=
 =?us-ascii?Q?w1taS1/HTnbY61S8roTVGrKdchJKy4vuj4MyOaYSYCF91gJE7ACXtz/SRru0?=
 =?us-ascii?Q?O5+xhKPGZvPYKNRQWqpjUoGRSgCjb8GGatgMPH18dWM6ELxtyr2p25HnbaS6?=
 =?us-ascii?Q?upk5EI214qNdAg3mLcrFAfe68nHN4wo6n76AXJ5eUVQIJ5jynL2QAZ7/+LgN?=
 =?us-ascii?Q?R53Ff/E/Onj8VSey0bEr9JahbHZj4nkZMFdUmEEtWcMj1YUGf9zSQNIG7zEG?=
 =?us-ascii?Q?u3y88asozz5kU7k78Q3yYBdqnNTGf6Sixg7kFaduVGBkupZ7AWHMY/NkcCDf?=
 =?us-ascii?Q?+iwH+ak2wy1zGSM8AjY0YlPGHLpm7xkFFwSYYNyC6nlRs5vbY+bGwVAy/fr2?=
 =?us-ascii?Q?ap0Bdnz5bOOVJxQWq+VMgRZnxziVEMG9kWDeMJ+fxhGnsaXuvFBucRPzxuOn?=
 =?us-ascii?Q?P3lQl1GR9tvz/HfRT+DMDtoZZs0lpgTdkOilainwzcRsilLOcp3v2vb5oz9B?=
 =?us-ascii?Q?IzTEDQhkStP22Q9zJ0shiVK39CKijxqMOcQlwNtWmQr09HTsolSk2CVt7U2h?=
 =?us-ascii?Q?HtxL1o2twJ955MXrK8vSs6z4kTTQJio1WHHDpatdECM/9TH14c1pM05hPbKn?=
 =?us-ascii?Q?8A47OvcIhtE4Fo+nbbR25LTVZPRQvcf5w9pvLtLZtCdvt70WWpDZ3Cxvyt1d?=
 =?us-ascii?Q?L0HvtNUngpink7Ar8lS/e0miDgfSaWZA0Wq09dgVHDSF0BHUll/30n770plx?=
 =?us-ascii?Q?cSfYfC29OYjXFYeyTZrvld1Lki9+z9sZ2fQcQuw2sZP0bfQNKjYpzk5dlFLj?=
 =?us-ascii?Q?swPy8D0tdB806kLuD2reA7kyVbLo28fZTBzvOvq4v2sGIN+2BlPY72VnnTJf?=
 =?us-ascii?Q?+gxWKSmlO+ub4lHYLbLY8wQ7A441wy+YN74pI2KCihe/Lnn8ADIveZHLWRDJ?=
 =?us-ascii?Q?6toXJAcHuG7ynt7LbiMpUbhfPq/DWZJ2OYPREogYeIgQQhTJX8X3iLJSPX8P?=
 =?us-ascii?Q?0u6gBhUHDMac2B/e5pDe1FPa//nvmzHCgI4cOYWqdXWJYaMejvdaOrATAhHD?=
 =?us-ascii?Q?sJix6LhaZFoPKRIbG9HMg4NOwuycgP6B1mOiGUbeASo7bNSc9z6gUINGE4pA?=
 =?us-ascii?Q?djOscZc3RNIPldq5mBCKepGefEKkPc7I+5JosIgN+o8khpHipXfsbVJogRg0?=
 =?us-ascii?Q?puNOethv8LfZXbdSqfv/mkTS7bcAFtD3cMxMQyP3SOV2WY3E47UzzemEHzdm?=
 =?us-ascii?Q?149qeO5tyVtqwb60g2Jnu6ofCo7Qy6SD0X2IYDpfie1sn03Kij38toxq1VFp?=
 =?us-ascii?Q?3nvlGQd1MXDkeYNmXuV6j8yxTjLswIfeYQ6yEcmP8KZAPJHPVTqUPbqs+/aA?=
 =?us-ascii?Q?8vxnX6hlOTHewcLDhV0kyaAYRmBvYMB7W0TOZKtucfhr2+g5Geq2U9mBYGD5?=
 =?us-ascii?Q?zyyov9be/PedB9g5BVUwlDFR7ZcnJtzo2gZ8BSpDWOmjYivjK7rHtyYMeKmb?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	f5ufSePij/SkqgmqWThnYoIFH/rnB/u3lySWRqvXqXeMOJB+0pEVOBM0PovYMHLiioRH2Xnv9x98QXGG/XNw7h4eIbm2NZGBySvIj0vnUUbZdjANgsLBlIZiJtCK2MFjY2brBw592oKGA9qrAWLre5TXxpBgAVf5XBtbSmlGyD84ohgOjiSXlqaIax5BRUq9D/T1bAXyyzk416KV5M0jubGqWStO74cAzbOOU2sbVr+VX+gCmQieHjzu1syn6gLzVY65vXgNDCsM3LCtdpqZ7RhSk+d4XfP0hyBuIAlaHw7uKnx8jyBUliIdNpxJ2wKmZUYimJyqcGkjuivxhl3s861A6yOhzqowhaa7yvHLSawO9WorazJQslPHdnxCrvdM+TvQPGM3OAWtzxJ8Bo4c0Ztp/up4dAhu7HZbRbgD1qGs4iXuYQsruMnhQ0k7wRlL2y/Z6dpUR4KyGi4hLEUQmdcMxIjipd+Z5+EgSM8fo35FjI69NqD0ZgtoD1xc2DUe9k/kxqBC9QYJut1cPbXm0xpKBQQ/ACJV6ljGU7FmwQrd4Scnc4/Hwpin85UfTMw/sHM4u+OmrlR2uRJBAjwc2c6RgkJ60XbyrN85J2QyTPI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3894a8ba-1000-42be-3570-08dd367c9563
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 22:24:46.7787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4t2NBEJkDIhA6I8GGjk6VYt9R+pP+G3x6ZLIIbDvC078t3cdoJBufl+LVH+atwuUzGp4wXUT5UZkIfKkyDpH4UNqwr5ueavdC7hQPSbUjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160165
X-Proofpoint-GUID: JxIU-1dKtZ0Kc-Uw0u-H9HrTtxvzmL6b
X-Proofpoint-ORIG-GUID: JxIU-1dKtZ0Kc-Uw0u-H9HrTtxvzmL6b

On Thu, Jan 16, 2025 at 09:54:18PM +0000, Nick Alcock wrote:
> drti.o is shipped as object code and can be reused by many compiler
> versions: we must not put LTO IR into it.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/Build | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/libdtrace/Build b/libdtrace/Build
> index 722351591aaea..307d7e8bf6434 100644
> --- a/libdtrace/Build
> +++ b/libdtrace/Build
> @@ -122,6 +122,10 @@ dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
>  dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
>  drti.c_CFLAGS := -Wno-prio-ctor-dtor
>  
> +# drti is shipped as an object file, so do not ever generate
> +# LTO for it, since that is compiler-version-specific.
> +drti.c_CFLAGS += -fno-lto
> +
>  SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e 's/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\).*$$/\1.\2.\3/'))
>  
>  -include libdtrace/$(ARCHINC)/Build
> -- 
> 2.47.1.279.g84c5f4e78e
> 
