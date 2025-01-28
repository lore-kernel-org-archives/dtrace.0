Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860FD14EC4E
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738045914; cv=fail; b=KjeiuoCd+C1Vm8frTpC3WKLNASuY01dluBh0ewBfZYWHH13TeXOJ6QfLDyi802xl5nHClR72ty090u4tgF96gFfvR4jcbFDEeUBxsBAkTVyCc62hRyZPA+BgFEgNjIjROO+7NTLJpvPUoZk5SqzBRLIlzbRGdE3LrFB/1cw2PLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738045914; c=relaxed/simple;
	bh=lVFo1Xnd9JdFd8QD1GzW6S12f3uexfvYkSY4jC9qaW4=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=MHuzyqjPdD0pldgvHL/5fZcE0TY6J+ts/kd4sQSNCK0ZI366SgX1boS+Z+q/mueV8pBtPG/qRYN8FJenglmR7dJAIZr02X7rTmNlafsmvSjsI6uEWwPENpB5VKPJfdPWqXTbYzADl9wdGT0p69o8d1+tHf2Xe8C0lqH7X8wuZYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OZqyQ04h; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=onUSKRb2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OZqyQ04h";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="onUSKRb2"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5atGh013964
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=srh18QFhwRV7OhySswHzuMzBKwb2KioHXtvq29DwHhQ=; b=
	OZqyQ04h3KQU2vcRdx7x8tDXN+5QWhuIv8nZpjqVgm6UBpTfUoqi89fqjR3r4jVv
	AwVEItGvlJBoefeUi91nHazc3AI69uB/uK23fLozqwnIEttP63IoNPJGSCGsnYYk
	flwgSsW8TjuHN2YSHJx+P6PNmYRyGxbuBXqgkdVZhqNbkaA5fmAxjcaYbGaYDtgD
	aQBE4NJMLgHlAT/arCHzZKvihXPThuIBSrMBWgflqUCiSZGFvbbttmUxrB/LjMrJ
	IV/Yso9c5hR6iemrB+YfQ0lqIC4pQ+fykDpJ2Ql1qy+yE2rlgs7XD6KXlasgAjhQ
	BTCkdAd4MGDsWkwG22syVQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44es880251-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50S6TMT2035827
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpde09ye-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXTMe+yxo/JImzO1XQDPNeJJ6tRUZfJhG1xtjyRPpF9uoKEEPblmpj/69z6CPaVaGCnfkg1EdU0DqUpMep6LSpRD/7kVaMQ4DXOrra7FfiZE0jwZW4E7AEzoam94NGot6nCy6fjkbrBSSHHikuH0+JmC44nfEJQyECrBxVDjxuxneOUb3cqviUXgzZjTqG/5V5DW4g5vOQRHFl8XDisiI43yc0XYi2wOwveLnNuozrM3nVcS0cKyk/aI6JN8+oR/DuA25oxDVCvaXG9f836AfD/jMPpMHWzINfNoDlXgKVf6G5EBMgEGqoQJpAfsUtWGYTnSMR2NsO/dShCoJ2gB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srh18QFhwRV7OhySswHzuMzBKwb2KioHXtvq29DwHhQ=;
 b=tpeq2BBU4d6759C4HHiQZNUnF1wd/NPiNzOBF8e4hzPFmNrqHVd9/q1gSr9eZbTCFXDoKB5csc5iGmlNwd0PBnr43QclTdM9UrQgEbrToZ0ZJ3sW5pI98JtLIYtkfLJr8a4xJEnp7KJikAu7SjAwbt80l0yPwBl5nTSDyH03Mi8Mxji4MOdVTT9bcNWeGIb3D23TVL7IRQWGXlBKQ/2+I3wQ66D0wTfJJu0C+ajPH01/0Erby4aEjKl4emuCGFIRBTLn7rPNqWRbX94nkyE5n5h5wNSCSxIPumv1QjnsrDT1c/QRksorCiApbgk5WPbSvmm1LfwxoxRUxe0DAevwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srh18QFhwRV7OhySswHzuMzBKwb2KioHXtvq29DwHhQ=;
 b=onUSKRb2QGt6E0IUeiQLBYL53ad7kEZPHj4hjJMoWt/GR2EpfA9I5KXo7SbkuJhntbmC3MENmn1wWJg5scXpaIRIz0GixLdNsD4eAi4Rk0G1pNS7QICvef8tFxZgxRgDzDhkN5U0FKQ2PEGJ9sJPtg1hdok3VhDxQtRLuCV+kRA=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:31:48 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 06:31:48 +0000
Date: Tue, 28 Jan 2025 01:31:46 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] procfs: add 'execargs' global variable as inline
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB63378175F68DB1DD5D55463FC2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a72101-4aaa-4c1f-e8ba-08dd3f657132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Txnn213uDo0ptyA83u6qDDeuRKH712lpRSO5E+fC4czV5FaKsq3yyzIOMJUL?=
 =?us-ascii?Q?VR4DmOn2BFDLj57Kh4rof4YZ+zc8SiHdP+Ro0wspS5morf+EC7wSO+F3L4U+?=
 =?us-ascii?Q?DsEoUE9r0wl80k+24vfqW7ksTHtiv7XShg7oSYFd9V6qvIDZKN9buX2nExnE?=
 =?us-ascii?Q?ZAvJW0yBDdulSd4Z5QvU8kWqHoCApbJJL84X6V61v2qW+gfkojyqc+sEyEoj?=
 =?us-ascii?Q?1cubz+rUQMtJ0n+nnVyIiClMOzSReeeetaUMNN0adDEfvs9RepuPygRXQsvA?=
 =?us-ascii?Q?L7RYLa3bfcSBzBGGlhchbfNjfYQl0PlsP7TasvNG9x1yrFRFiSJzDyQ4TTJE?=
 =?us-ascii?Q?K3rpIK7T7+9jzXMVRh3raJ9tRWQ6r4V14ZEBj9N0iZZ8BSegHqWsR153Yza2?=
 =?us-ascii?Q?UL2sdE0vY9zd7LzsbUB80+A77tceEUJBhRr3wdN+hSUEP3U43Du/h9zUDkC9?=
 =?us-ascii?Q?PMPVMSPPvMEESNAkmbRQW0PmFoIw0xbDjPXRaav9MmNxZlRB/qOe2fHyoxqy?=
 =?us-ascii?Q?c3KKcZ3pJrX7EVYR0pbdCL6yvV77NVCWpwKDWs4x3wzYFrphYnNAQL8PwaUU?=
 =?us-ascii?Q?pHQeZROG5h5vzvc1iw8zpqrC1sqdjQt1B4aWb5lot5oaTe8CqxEE0592i1A0?=
 =?us-ascii?Q?3IqnDXTL+XaJVELSaYCoH6uzMa7RENRKGxxLInk9QZxs8ST/THhqbAumkxLr?=
 =?us-ascii?Q?83pXe5bob/PGu2ENUZ71FA8ctdnfDaEubqr/UM9tE3aFpdFT/ahn0qQHF30X?=
 =?us-ascii?Q?PT5bOfkIOo1yQ/RhfwVgM5+d5Ocv/yditO3FdqBOZ/FtCsecxu8K7vZRggPC?=
 =?us-ascii?Q?xmgYwfzITBTUGjmY01dLucJ2qeE0Hsj4rWQwbnPBPbs+CYObWYv1uSy4uH5k?=
 =?us-ascii?Q?7yjxIKlcRJp6f2ut8DKheOduahl2bYUE4LBXY2eZHmdN2pgNuKn9wPtDnm7S?=
 =?us-ascii?Q?c00BuVIYxgso1SSAB6PcY1PHxDuAjKyk9N6P98v8jpbjShYERBfrAd/PZ+Nv?=
 =?us-ascii?Q?L7D9V99zz9s+IWFVEXQdpIiIdgoY8U58/HflSniSjQz5ZOCxTiprPwOfBHL7?=
 =?us-ascii?Q?1srJoimXP+7/JK36BDLde4RZi+PzXbLVtwyI8Wskahk0QpA2Jvn8lp9AU8Xg?=
 =?us-ascii?Q?hIG0B95fY01tbift+4E+1D5SWAG0w3e5kYfOdzuHgb5OgMaVrsCOMlRtbb1s?=
 =?us-ascii?Q?+2aWGBXZ7R+Yi8KSKHlzxVkg1mcnJTXVsxZl8LFJ80mZvq41c9Mt+9Q3kN/I?=
 =?us-ascii?Q?+lpGjimNLs1GvSREAW8fhIf7KsCufEgd/rQOHLJBPacjP8Lu+VZBT1vkhRlz?=
 =?us-ascii?Q?HHlpPmUcThnl2CKTSpciODBFjNuYVACR7J1+O2EpIEUdJQZ4nPvxZW27xKcf?=
 =?us-ascii?Q?SqnZ6vt38xdo+lvEl9sABiIzzZ+o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k+/9TJqHoyTrv8CjTwJJGtf4BrzhhwtrA+dDy56IyjFHmj8Sx4y2hJtpZPE2?=
 =?us-ascii?Q?Fjzg59TbTfWQKNwt8lVneahEmNyNCIuHhQgJuBb1Whz43NQ6rU7KtkKFVB7P?=
 =?us-ascii?Q?fFctWKpxJgkHMu42E5EIpNbcpRbizOVPh8LaVZRGVENS5ZtJCdCqexzarobI?=
 =?us-ascii?Q?kw3iNlLSsFiH4QpuLXvFrfPZJDySGgoqy6UPLqjImKlRducVSeoVRdXcTQPz?=
 =?us-ascii?Q?SfMnnCXdoKMsLMBPqPQudcCazDBFrdtbR4NQynBeuwCnC6Y5QYzMlJUn85kc?=
 =?us-ascii?Q?rYBmme43yHppzTDQkvEx9VZV+xUFRfPsb7HRW77trJ7phPLAUWX7uRifO+xG?=
 =?us-ascii?Q?XtsErdAuR3A90sBlw0HRmBHsXCOqc9a+1pObDlt4DrYbimvQnBrTIIX2rAuv?=
 =?us-ascii?Q?+4T8ADKx/6xDk6QP9FhhBu7p1zRtufhDYWV//bSsFnty8xKLpL/W8HwFexWu?=
 =?us-ascii?Q?hOMEGHwaqLSBVfsA3EdYgYKKCMTVjeUfZglnmzyMqtBsEck0P7GfpQZ+rrcI?=
 =?us-ascii?Q?fQi+CjRbLwfW9SDGV0b+Vsdf3W2TXkjBkBC17ZAnA48oZnnvJSijfXLzJzVn?=
 =?us-ascii?Q?E/SQznWzAiv0ZvTOI/Rf0VmeqZrVYw/Po1+2DQn19vHcz9c2AVU7VRP2wTq0?=
 =?us-ascii?Q?r41WxX7aitAE1y3apKcr3EKHFztlH8iPMF9tVSY5sJpxr+QXd7MRXogzM4cY?=
 =?us-ascii?Q?HMm0b9HCtvbJK7Rw+uQuQ+Q3SrfqOilz+ZB8uLtRWmaD+AwCgjEFp/nudUMQ?=
 =?us-ascii?Q?wvOk9rOqaM76S1PUYsQEUmTNJxA2zUOfabkRriaBlcZMdV41AAKKVXANnTWa?=
 =?us-ascii?Q?/gMrSZLT3kJ8enOezm2E6NvBAxaZrKFigm67C+WysDJmXK2NccCAJz1bnjad?=
 =?us-ascii?Q?Yw2cmGVCYgYF50pPTDXtI7t0j62UL59s4HI5ny+Je9GRClQPXxfQzAKMfaO8?=
 =?us-ascii?Q?YpOScCiLUwq/vJT6H0M9ZwY8YgM5cPoaXtLeh7ZaAx/SEDMfNcUBaqGwLVPw?=
 =?us-ascii?Q?3fOS4GaC3VpNd8KvVqd7Hdyf2bfznNvCOpGO4lmTY5jqZQCnmx5GH/aS9wj3?=
 =?us-ascii?Q?zplFERsXAEBImHh/eZ0d5rhofwz4QXldW5r7bc2OCv0RcJzn3s3KnA+pzFKG?=
 =?us-ascii?Q?sbf5CuomXgZVTITxRi6Fkmp7zMN9gaAvoXYK8wDuXPP6R8qZEvZxyqNgfMQ2?=
 =?us-ascii?Q?//WXurdCm8zyewRN9fqUHGSAOBsjNepBIOma+T2BUmznospfmeyy+xloaewR?=
 =?us-ascii?Q?Cpes4DNKgFMGi7u924rpr504XnnVv2/FoQ7YrJfr9ESYhLWVn5NDhNRmJKf8?=
 =?us-ascii?Q?ELuyDVJWtIg6HPgc7NSxj0QsWJuOrEK/GTRykIFK2L4ychhr6VOvNuTIjv5w?=
 =?us-ascii?Q?RSR/oOEWCipBOeD81M3eG/yN/I0ty5bPvxT/6aXbeIi15GrDwqob/NDHe6Ct?=
 =?us-ascii?Q?RTmd/LNF3oKx10ggIDDIyDzL5PjbQP0qIo/xKr2eOXG1lMgugE83WceqEa6t?=
 =?us-ascii?Q?hsxeNfGgsPg567YBVb4mVJk04BPwHQF7utaJVZepmg1HAcTZnHyL9wdzOvNm?=
 =?us-ascii?Q?/sCUUCg6o7t/SBq3rW5LtlfxZG8qPjVvzckOqi/kZBd/SvP2k52kskgtZDhP?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ZmOeh8d0msUbUl8z1BDQpFdKp6Qi00upq8Yndm8qpbc2Sf9WhQI3NGtYSotqu0bJ0WADnWKuIA9UoZa4tIBJBcoJVo196jv+AogszXjx9CShaZvOniV/bk1vlFEy6R7OSAc/uN93VpNB28fvV6lxjzCVkqWj8kcwFSBUU0AWWdudZjeX8nwOvpjSquciXZvVg7aBUG2NBf9i3Sk5QLtLiE0I3sPl80EY13FYL/XupQxyEdK1FutOEfEI0/z571sE8j23MTRHIW4lK/yWqZKBdWmtqh7dzrMSMXTv7orS0hFAVbmrWts10dCH10RAGjj+01Ak4k3sF+MZezdHSplrEjIChTnTKBs+He5cS16xD+713sFy00Q6AU4gEUsVgAdIPhfrd4DtQXBVXlp8IeBlOtQyZerwcc70BCC6DjztUPZTI7NdH8DXIK6c2WSzcw4Rz/FWRPKepLc6bRBUa67ZvKuXLTpCP7tuHdNnyX8Pzys1qfp+qJzBrlWBJS+4IkThTHrMRl9XITo0utb2UH3Uifi9QHd7PEkNfrA/86tRE4xzTLo19F/Fd9Zo9HGzWPBSIj3clM0k8YGaHn8PPQbgdG6gTzAXeZdYp7FtSYAfB0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a72101-4aaa-4c1f-e8ba-08dd3f657132
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:31:48.0776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5BdFxI/XWfoiAqLWr04GMqNnm+KmuXoa+TgZ/2kGY1QGQ0EtrKQsIEvlQnb7au2oS5PHqxHvpTirhbENf0H34nE9VIw6XHKisA+Hsnhef4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=763
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280048
X-Proofpoint-GUID: VMSlk9CpqqTvcP0rTlQGgBTHEZrRBHwY
X-Proofpoint-ORIG-GUID: VMSlk9CpqqTvcP0rTlQGgBTHEZrRBHwY

The 'execargs' global variable provides the psargs for curthread.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dlibs/aarch64/5.11/procfs.d | 4 ++++
 dlibs/aarch64/5.12/procfs.d | 4 ++++
 dlibs/aarch64/5.14/procfs.d | 4 ++++
 dlibs/aarch64/5.16/procfs.d | 4 ++++
 dlibs/aarch64/5.2/procfs.d  | 4 ++++
 dlibs/aarch64/5.6/procfs.d  | 4 ++++
 dlibs/aarch64/6.1/procfs.d  | 4 ++++
 dlibs/aarch64/6.10/procfs.d | 4 ++++
 dlibs/x86_64/5.11/procfs.d  | 4 ++++
 dlibs/x86_64/5.12/procfs.d  | 4 ++++
 dlibs/x86_64/5.14/procfs.d  | 4 ++++
 dlibs/x86_64/5.16/procfs.d  | 4 ++++
 dlibs/x86_64/5.2/procfs.d   | 4 ++++
 dlibs/x86_64/5.6/procfs.d   | 4 ++++
 dlibs/x86_64/6.1/procfs.d   | 4 ++++
 dlibs/x86_64/6.10/procfs.d  | 4 ++++
 libdtrace/procfs.d.in       | 4 ++++
 17 files changed, 68 insertions(+)

diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
index 70a43ddf..9c06fe1f 100644
--- a/dlibs/aarch64/5.11/procfs.d
+++ b/dlibs/aarch64/5.11/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
index 70a43ddf..9c06fe1f 100644
--- a/dlibs/aarch64/5.12/procfs.d
+++ b/dlibs/aarch64/5.12/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
index ef27bb70..2824d137 100644
--- a/dlibs/aarch64/5.14/procfs.d
+++ b/dlibs/aarch64/5.14/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
index cad2d2c5..daf30745 100644
--- a/dlibs/aarch64/5.16/procfs.d
+++ b/dlibs/aarch64/5.16/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
index 6b1b1b9c..3594e5e9 100644
--- a/dlibs/aarch64/5.2/procfs.d
+++ b/dlibs/aarch64/5.2/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
index 70a43ddf..9c06fe1f 100644
--- a/dlibs/aarch64/5.6/procfs.d
+++ b/dlibs/aarch64/5.6/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
index 4cb7b77c..2d52f079 100644
--- a/dlibs/aarch64/6.1/procfs.d
+++ b/dlibs/aarch64/6.1/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
index 4cb7b77c..2d52f079 100644
--- a/dlibs/aarch64/6.10/procfs.d
+++ b/dlibs/aarch64/6.10/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
index c2be76d8..7679db2e 100644
--- a/dlibs/x86_64/5.11/procfs.d
+++ b/dlibs/x86_64/5.11/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
index c2be76d8..7679db2e 100644
--- a/dlibs/x86_64/5.12/procfs.d
+++ b/dlibs/x86_64/5.12/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
index 28fada6d..3a348ebc 100644
--- a/dlibs/x86_64/5.14/procfs.d
+++ b/dlibs/x86_64/5.14/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
index cad2d2c5..daf30745 100644
--- a/dlibs/x86_64/5.16/procfs.d
+++ b/dlibs/x86_64/5.16/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
index 08696cf7..6ad926ee 100644
--- a/dlibs/x86_64/5.2/procfs.d
+++ b/dlibs/x86_64/5.2/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
index c2be76d8..7679db2e 100644
--- a/dlibs/x86_64/5.6/procfs.d
+++ b/dlibs/x86_64/5.6/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
index 4cb7b77c..2d52f079 100644
--- a/dlibs/x86_64/6.1/procfs.d
+++ b/dlibs/x86_64/6.1/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
index 4cb7b77c..2d52f079 100644
--- a/dlibs/x86_64/6.10/procfs.d
+++ b/dlibs/x86_64/6.10/procfs.d
@@ -261,6 +261,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index e9d50349..827d6b81 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -307,6 +307,10 @@ inline string root = d_path(&(curthread->fs->root));
 #pragma D attributes Stable/Stable/Common root
 #pragma D binding "1.0" root
 
+inline string execargs = d_execargs(curthread);
+#pragma D attributes Stable/Stable/Common root
+#pragma D binding "2.0" execargs
+
 inline int CLD_EXITED = 1;
 #pragma D binding "1.0" CLD_EXITED
 inline int CLD_KILLED = 2;
-- 
2.45.2

