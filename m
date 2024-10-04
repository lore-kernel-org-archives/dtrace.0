Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FDE3A1C4
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 04:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017047; cv=fail; b=m36sjsgiOZFUu42IdA1EqjLW10l7sDLziiyUF+1mXdhVObpzUAY303cwUhEdOzaO6MD38ZhDn/FEfiG5RfHTt/hnIG2UU8xPCzZ+S68JyeA23SK9nbBzbQN1JLuA5zIeI+SFRxR83ePfu6T8coLwYIkpy8DZzHjHIAKQB9UjAvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017047; c=relaxed/simple;
	bh=cgpBIIMTL8dVnLhwgpKF3UERNHhhtpgIlNDmQkpW3lw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EEKS/9C6xcANM03BHCF2GY6But1AXdjQfOqVp+FdyFcpnpcgIodIesWRF2ASji0Ed0WSeiCAsUHT9O8oIuMAgVoVOtAvzG7l/Ri0QVkEHeYijKn1LFAo9YtuQnaqyLDZBOn3MtUXrsJqRaF30JABmYF1IuDU5/1BT92rjYmCNBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EjrMNQN9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mQJfXRXJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EjrMNQN9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mQJfXRXJ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940tdKd022826
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=K4H6cgpsOomTdm
	Wbn8ryb4H5rRHBTMdzkJHGnh4HIjE=; b=EjrMNQN9ygXc8rGqnj/bUWeeptFH9D
	sk+OFlYVTICGqHqTPa/nnT9xOsn5Rkp4XyUy9MXxsefmfhEH2vc8KdycMFyCd/FJ
	X4Y/8gmkLHxHYXzYPdJizPsKEn5IiDAYVHxQbA2b4UlTdnYM90s2+xEtOE5rg+UD
	gMaVK8ussUpZMIPqmbfjRiB0JuzcF+RNNJP6RPijtliUQ135Wpvpi1qBAAmflXpu
	PMJnv+i5VO9OVj0mYMqhPaiwgs8wAO2K45F2cJ5DALBv9nD48Rkr15vWNkGlN58w
	iGGgCtONbjLQzSXxDh8LQBZlRDEuT90pYetH3l7/wf8nmRt9Rt0ofvrw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4220490tcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4943wmLG026199
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 04:44:03 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4220559g4p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 04:44:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpyuQwQeP22oxfBShDRZhMOl9BncjQhpzdCSAYiNPKjEADOrSFOPA9Z9tRoBdG0UVfM3m/AK1xvzG11wNEXza4bkPQBqUVXpqIzujG7D+Q678tb0TbGDyJn/7kk0mAHHbzLL7HbkqSgwGfEeSHMGwy2U7iiI0EtaBrNH8OMoId/seE21ERU7qqX18+gxLSshEh8xZkrNxmRUXqU0sGyH/qg10Xk2pKr4FYB6UJb+DffxmsTaHoHdmX+PHMxJNfZYMR/qQv/ts4pBBoDmZN6Fqxznuj+JgHYjlXeQX41iKghbpG+2BL7EGFFG662qiCvu7pGlOlut5py00VAi1pcmow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4H6cgpsOomTdmWbn8ryb4H5rRHBTMdzkJHGnh4HIjE=;
 b=EJbwmzij8A75ICznQuJllefHBndPPSEnNDcysKEsMRX96zJjyz0VW43tR5vVd0pMAQsT7vcYoFSGkORmaD5f7tuV8AbGlHkLCNJdCkjYJf2mmkPdO2bvzVVbTWZNtuE9sqAppdkFygkd8ZzdA7d13KCb/7nEsRVJJTpH1AfvZXhudE89RUothYZ4R7IB0PAigBGxWYAVD+LqDXSbVqmZIlDJwFFJCGHWGUy6yEyEuzfbRSjRU1pV9mqVVAQT8YLQr+i+BJbq0dv6h9/JDKQrCu0M9rgV4AL8kIr362d9i8VZmyQjIc82rwV9b7qaZyCThbgMB9KNRpiy0qEcTUrlBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4H6cgpsOomTdmWbn8ryb4H5rRHBTMdzkJHGnh4HIjE=;
 b=mQJfXRXJYZ8an7nrhdo62ZZsrHX8a/mpz8S+iUrOGkY18rPWftNMIrR7TXhQd8oEvizx5TkN/L1+hGv+st+ZnXcKpe7wuBBHe7kTg7gqnSL5RQqgePiYkWCpLy8akzp1puupagK4BIyhQRsXmig0NXfvQdbxBce5dElhjQ0QQBw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN0PR10MB5909.namprd10.prod.outlook.com (2603:10b6:208:3cf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 04:44:01 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 04:44:01 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/4] test: Increase timeout due to long shutdown
Date: Fri,  4 Oct 2024 00:43:53 -0400
Message-Id: <20241004044355.25870-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241004044355.25870-1-eugene.loh@oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR04CA0157.namprd04.prod.outlook.com
 (2603:10b6:408:eb::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN0PR10MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1f8a16-e9b0-4c17-312a-08dce42f2aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OYapcw6v8/+mCuIcKhMMx/9+weenVGnCTJNEuNd0NiqO4AOV4r8o7VMIcwlk?=
 =?us-ascii?Q?/gvELiAqj3H4NBTbAsk8aNwAXkzASQRXvn3nnagxRlmvOrHN428BAWbrztJ1?=
 =?us-ascii?Q?dj0j8WeQknjHZ4YJuRnkanXBlWPwYWSjFZKShdR52iMcCfl7SF71TsQi6edw?=
 =?us-ascii?Q?V4QjbpEh/m5ari2mIudPqE5V60bcoC1woAXbIo9zk0WSmkOMcuq0dRJUwQed?=
 =?us-ascii?Q?jWIEkdHujDW3h4cyu1dFnJ945VH1MUKHWVopAyhjf11cTort3/tenSzePBDN?=
 =?us-ascii?Q?NXZEKMueSDpEzWIOBvcB0ySyMAuz0eVMBZvXFKEQMHqqmy7gCxKrypjIkwZp?=
 =?us-ascii?Q?7Yd4XZqGBRIOKLa1w6EXHSqn+6IfYHEzLWE7ANrFkS3+wjxlfAYODZJPa44x?=
 =?us-ascii?Q?/kA1I/8oEY0rsv+TuOH6XGxPeVxxkyzUYx5R9AYpNvncUIOwqNW73r3hq5eQ?=
 =?us-ascii?Q?e2C0Fh4nuMgzPd5cwD318GCJ1WAVdDhvy2DIW0sjfJ6n+H6IBMhXqTqeCoQG?=
 =?us-ascii?Q?2uk4HSX6cPD3AwQsn2hGDGC+l/6i9cfJq7QPinNCOTkgu3kZxgdSuZk07mNX?=
 =?us-ascii?Q?VtKIwTvGQ91I+Qxmbq9S3K/kKPlQiY1Pqq+0jtQLi4PtskJdgrasawznSYGZ?=
 =?us-ascii?Q?hksnZntGmVu6CVOkOJ9ktpPj9L71UGXTQhrGkynxtVdjII3SMxki+PzfumA5?=
 =?us-ascii?Q?GTPFnIAXx2fcXEygyGxmfGThtULCsO6d9nZ66HyyQy0ZKezDchTEOR0ZmVW8?=
 =?us-ascii?Q?sh3w1vSe0u/IM666I4XGQ+sl4wPWh9uTVtYSdHDk7N/9PLeMeEVlpcel6vbi?=
 =?us-ascii?Q?AwJCjHEhzpSHjdm4eGdlJwxsYPmlNI6+lwwaVVz4pwiZNu9f1TCji8O5uZoS?=
 =?us-ascii?Q?fuQLrKGmPozxsuxcyfOEZ7V0w2IdjhbVG0kApFFWZQ6E6sK2sEqMB7w/KpOZ?=
 =?us-ascii?Q?MM3U3i32JF8oO/0xc6ljX8ynDmJKDmLUHDa90a/FYFGVrvyCDCD2JO6MhYZg?=
 =?us-ascii?Q?g3Le7RLgYGaGTo/cpl+B0zT/R7AhnmoUmjKzvVhtc1pGFSclFk/c/ws1IfCp?=
 =?us-ascii?Q?wA0E4zeWLXFcSD82h7+w2i4Sh5UO9USuiLpkdCdR6/htI/qY5QsdRMzRumvc?=
 =?us-ascii?Q?0lcInsO95Uie2J2Cx1TepF/VyD9wBmnZorZmeS74DuhPI7tAJouF+K7Isbba?=
 =?us-ascii?Q?jwJGubaE3WHz2xkPrAdl0YPHjdH+8DkceBa799mmV8UnGDLysIezqdxXszKr?=
 =?us-ascii?Q?R8ebuK+NdzFDy0tpi+61o2KM8Xc9/d4kX2iuVXeccA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ajcEvHWNEHZiN2aIY6ArAAs7/YIJ8+Po5Zt8AuzcQuf8KS5fiietpaa3sYfW?=
 =?us-ascii?Q?qbPY3AVIKlHHsWDKdxDheF3Ef8R2v8AmcO1AXavmaVGluThjYUDpJ+pTzbH4?=
 =?us-ascii?Q?KHqv37oArBiAim4v0uQWQjOMUjR7CLoscvKyrVWZOBJukUjLp5outTZkwLeM?=
 =?us-ascii?Q?2jF4smS8jth2jto87/b6R3auonygYbHNZZxXjUAy7dqVc655kgFWDt+GnM+e?=
 =?us-ascii?Q?mht05CJUc7K1gTTQ00f67nvFB/xEjzKyqu2Bq5LHYUKAGMY/KELWCJzIwLY3?=
 =?us-ascii?Q?DN9jcvMN4Jmwh5RYoVUhbpG2plKRKlgX4n0iKjVhgnyauRM87I3KuWU3K909?=
 =?us-ascii?Q?7ZNkf41bQUzC5lC3nznY0vrCGYq1QpBuP7CnP7BpJTen77rEoJQ/L9JCyNVa?=
 =?us-ascii?Q?xyxu/p6cpJPjO22IbMoKdAh5sJbo3vT5NGdiG1EDgVi8wJXpVAMDkk4SAm38?=
 =?us-ascii?Q?T0IVyWLJBY/AYT5rXNtxv1OPI0SVS3y6PbogDk8BqR+1IidPtcgVDGqtCjl3?=
 =?us-ascii?Q?JglxWJpPgF4Gd1Kzhe2GP1EwSBhvA1hj0mHkhPqxkk88LiouVKS/oqOQa89l?=
 =?us-ascii?Q?x/SHs0n+qjYd5g0GCTfZH+UMtt4k4cTNeFdMR7SY2NMPf1Nq4+2MSQEEGUaZ?=
 =?us-ascii?Q?vJPcMFZPRluUcQ/nsrTvaYMtyVH/TqIypVFeIqT9ifNYyjmzQKGP9BJaYh29?=
 =?us-ascii?Q?1tqg6EapgJ+MKLPaWKtHhDKULduFTpuhem7N2J0NZlx9blM+Q2xEXfEb5z7L?=
 =?us-ascii?Q?bUN4gYrdkWFKtimukmwhVN/NM+z5rPq8o3/HEEze1JmnZ1r0YvtAw+1BsonQ?=
 =?us-ascii?Q?vRlpx+GrHFgMJIF4WMFz9+jU5YqIdCVJf8oBWXCPs9FsvMl31kfn2VGBH2A4?=
 =?us-ascii?Q?+wAxW28FxxMDekvHCPBgX1ZX+2GHZzqdJFka1fUEQlfD12tB9NXnPMRrDee4?=
 =?us-ascii?Q?NeHymj80olshac3JOXlfg1vaFvzDPjNGD6MvxFb9+eGlq4yMavrnwWfwthzy?=
 =?us-ascii?Q?0T9u+mjVPXh5JGOOuROAoq9IL9UM30Sg+8KkfmzY/YdA2XFCKdrn0qgF8jhA?=
 =?us-ascii?Q?XW0YOToaBkSXnaZ2e05d5Iq/nEttNMbgNrpzyh+9m0GsVOMLZJbnUGusEqi9?=
 =?us-ascii?Q?Fn5OEYvb8u187HDvaRUslImfwPWZHGH5tnvlsfnVLSOHBO8RqAwwS891Zo7Q?=
 =?us-ascii?Q?ghSL5aoSSQBdpCaRNdnJpTvScwGCwxW/Puo0UgZozDxJ1iO1mFaEw5aEP633?=
 =?us-ascii?Q?j62oYkOwzgdZvqQIcYQxaPkRHcx3/2Hy1x+J9s3ragCq7fMk+4ByjotYWN2C?=
 =?us-ascii?Q?AH70M7UcySXItatu+z4ZJiS62SqF40+XC11lzFDKbixRW7hD4YS4Qr5zwW9r?=
 =?us-ascii?Q?yIGAGoTB3XMZ9hHLX2tC/2eM1Gc9EuPKpM2iX9ICck6xvKZI3wwYtNzuxaU1?=
 =?us-ascii?Q?6fCXGyFDLoOzapmowFSbqyJQp0236C4GWPeEUKJKfN3E48OlLE1GlyWspF7S?=
 =?us-ascii?Q?naXdzarWZHwf+Be030Tp9fljmAmBIa3YvmCJdnUgFCUIQ/zjDaEn6IluFKA1?=
 =?us-ascii?Q?xV/Cc1cS4QKSROU7agu4DjK35cbNiOEtGdRwTdw6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6KhOWaE1VWdRo02c7aktcQMZvLy7XmzB3xHbuuLadJKHdWXPkUfsBWm2mEyUvXB0B6+fVrLQjCJSlphtO+qCnhoVCZuwRQyzksF/W2726g/E72rZn402r32UGKN+Ji1Hr94ca0sln4XNzpnIoCpx7UgRy93NUkQ3ur34d5o4zEWG3uGKzBidwqa4eFpAAXs4xqodmUd0VGwWd0782S5K9juGxi4h7SyjQwl50FPgSf7I/vF8n9sGUGSxm9+es/6DmxMuWCfPavFJS0kDScG30AK+zTHfhBlmQ3bofr7KmiLwDuj+CO5JxU+7a343odVj2WMoNJOCKYY8/98ts6SgGIifRbBSfQLqnRFAgwrPFl05uJBRZFqxsqrmBlNEI/Y+kpRrCuhWv2lM9MJ7gmMqA/UKdWTYqRI7/dMmBDxKDnJ3R134NxFBd1zVZhWfXgcIZHHbxjE76f7XneglLov7kyDQC+uMwDSIeEkwLSo+e2LccyJbTLPBmLO+8mu64t8uJyu8EvgxRsOz99MoaomKc3UhzkObfgz6ZcQXP8x+/Wa7kaQOTIRcWHWX6StNnGgHrbtgk04X4PK5zWCtiN4ZdVBiL06qd+xwb6H9YikeNAw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1f8a16-e9b0-4c17-312a-08dce42f2aad
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 04:44:01.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6dlyykV4XVSPTSxRYWGsB5KYY5UyhvZzEDTfvTksrQOJJfn3m+gHPpkGlWmX8QHGC2wbg+RfE6Q/Mk/Hilu+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5909
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_03,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410040031
X-Proofpoint-GUID: KAlsc7gnX65lnAi4xHBSv7xOOMFluXOf
X-Proofpoint-ORIG-GUID: KAlsc7gnX65lnAi4xHBSv7xOOMFluXOf

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/pid/tst.entry_off0.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
index f1a75b6ae..1a4c3d207 100755
--- a/test/unittest/pid/tst.entry_off0.sh
+++ b/test/unittest/pid/tst.entry_off0.sh
@@ -6,6 +6,10 @@
 # http://oss.oracle.com/licenses/upl.
 #
 
+# Although the D script takes only "one second," it takes a long time to
+# shut down.  Until that has been solved, increase the timeout for the test.
+# @@timeout: 120
+
 dtrace=$1
 
 trig=`pwd`/test/triggers/ustack-tst-basic
-- 
2.43.5

