Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9406D12F5A5
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738045913; cv=fail; b=TJJ3iboskkIe+FpdN86LSKW+vav8m/6K/v7xZRxmF48Ahycy5yapBwVfhQPDXnme85W4du+28xWlunasKn+AvklwrAwNVQtOwaog7hqg41QHOJ8goXWHeae/T3B04S2ecgxr4W/jd32emADEwJ7DGdFBUrnEZNcE2kuOcnBUYQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738045913; c=relaxed/simple;
	bh=lWwtKpYiuECYUOklo+GunnV5nVSsG7P219bgs/nkKrk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Z38bUoIGdzfFGaDF7IMoPURezN6phuDgOsc5p17Ieqth/FD9Gc3hLRel5r441VO8/8MglgS+/WiK1PP/8GWLwFxPkIAU+eXYgt4U6DrgUuvkDANqyTmue9HZOg05TIRBwJg6s691rMRUQlHPxfqSereftsmn6OyAcDubVP6HSlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RjgdVsq7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OduSWyhD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RjgdVsq7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OduSWyhD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S6Gk3T029119
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=w5oo5edIVaEqxrc4Nm1BjA0SbzIbB+Y0VEyDG0s2c8U=; b=
	RjgdVsq7ukQnRHlWsnD0Ujekv72SDhhth4v3now+7pQWrRMerXzIqkhgvA8kvFH9
	NfGzHmuwXSzvvDea0jWJjRDwvw0L6SrLxD5BDhsGtwKvTH2Ua0UncPc0tMzGvqOz
	O+hgz7yz2IZEaRmx4FwTu6JFmIYZwRLRwYfLMuOlvkcvyHRJMolNHVsKzEqDhPxg
	MT/ALQVpgiTqjGNZ0cAcFZ3+B3OwK2PFNileYswHWvqC+zqnvgAjEt1FDsBDc2Km
	lSvgUucCZMCMxgGhVGuWKM7KGy20OmmK7d6ZRAFyEQfWYm4142uttSDz2lyh4Psd
	MK9DAeRQVfqK6AXNkW8ygw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44esu000cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50S5YRMG035796
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpde09ww-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVGKfqlhxazDedGkBFsghXm3N/j1n+JlTs3yGlruZx8HP2ayDzNcPu7kusPkR+pD7B9bjIYaG8Q+eQp5ryNaiV96T6lyAviFas3QcgDt14nhb0hIcXr4JAK8eJ1jiUyCbzlRuRsv2DxDrDZPmSUd5g7E/cWGFFF/tRO2hLK/x/CVHbq9dHInloaDvN+uWPdKprr8lMVWTgA8SPlrt9CQiMXyIamn5hk0CREd/6seTT2yV/TPetEJ6vGCFDDR39ZU7bsacKNptdSpwGzT0Uv00XzAx1TGrRdKIuHThGaL5CPWuXb+ZHxct50te8n2oVNU7a/pRmFG+1zq396NiUEBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5oo5edIVaEqxrc4Nm1BjA0SbzIbB+Y0VEyDG0s2c8U=;
 b=P31OrZ/KlstqKB2IkaDYUUMMV4jlJL7A/DrPuoV8WHf+aMJyws7moC9sN4KYWhCq3fLJll2ppH21EmJWKJkMl+ngchAf1wl6oVMQkYSxcF14y7T+VBnUjBPIUq60uGRTnS5z+0yVw1pQRSRZXWzovj0gBQrbLHHLb4SEDkbs2oDBMWpTm3PWYDnugw2K0Ut12D2+L7LOvGMeQnuIoJhyAyCn8weX5qKw+woL7B4HGMfJlOcdmFFDh8vX6cmbNsnf+XqVEiTogXwzzl4TnBFD2GqlTbpRIs/5kfsCFtD126/STdRc1V6SM42FuYRbR5ETtCFhc5P04duGmV59JtmiMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5oo5edIVaEqxrc4Nm1BjA0SbzIbB+Y0VEyDG0s2c8U=;
 b=OduSWyhDXFbUTs9CaoqCLCZihABJerK4CfscHm1j/GY0txa0ETTTNbJByuQglZzMzxyDPH050fLiZZECwGynXTYtNEwdV/DpiYREklqnwrj+EMhmLtqnHCNkyv0Fs0CaV0HTy8FkwiB7AVXXB4Wru9a6vtXlLxsy+28AF0dLjcY=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:31:46 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 06:31:46 +0000
Date: Tue, 28 Jan 2025 01:31:45 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/6] procfs: implement d_execargs() for pr_psargs translator
 support
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB63379363C8E8F741B68A9507C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f56fa0a-2feb-4789-7043-08dd3f65705a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oy7VSWAs3bw7FYUC7trTEv4HAfFodlpEu+BlR+r0pLzuAKjS/Jh+w5KPE7Zx?=
 =?us-ascii?Q?dR9oxc0pMy2B4p956+KcyT8fv3YmagTALnTHeGBgmfPIx7i2Wi40SHR5yAth?=
 =?us-ascii?Q?XnJSuMCbhrNfM6aWW+SRjOGxSydfmif7gPFj3Q7LRDN5hmhLDAoMI1ddN8vm?=
 =?us-ascii?Q?G7grhGHN1BxWs1M6U1fiOaCOzfRkx6qGyQpTyyXYVaOd3FpVPI+ps80eNdSH?=
 =?us-ascii?Q?rrOZIOIb3dVFcnZzREY3gehhVNumOsvszeNNiYWLCI9JrsyZlU2ehGKRfOQC?=
 =?us-ascii?Q?plj/2uXGBC1pDBqceklGVubdSneOpvT9cQZ2Ij1POqCrgTq08X1bg2Y/lqxY?=
 =?us-ascii?Q?vIuVWHPxTYGNc67u8Q1yr5S5ROQpWuk0AxpKY5RkIKxlqLGSAbFDQNabdAHZ?=
 =?us-ascii?Q?0Qwl6cd8Irgd6CL0hgrNcpCLj+UCG7t+KwAGdWjRK9ASaSGswxHtUT3EKfzL?=
 =?us-ascii?Q?+qCeYV4DWuUf5QaCGu4WA3Y3C+V8X9RIRy8wIpyBSUs6EtyaWbL15bDwlJ1F?=
 =?us-ascii?Q?dHTBob83Ng4S9LzeIpZEfnHOVIbYPi64HJhb12D2CrCZBgYzaInuDQ4tNBHb?=
 =?us-ascii?Q?/S8E62p0hzOGfPszLfobcx8msoC9KYe9BIRKk8EpZTSiqAuZgBvJHTwbZmJW?=
 =?us-ascii?Q?pNZ+gTBoeQppuvOFlohr3/UoeQX97dqPNjYpel7g1H234rvE27/Y77x/MqO0?=
 =?us-ascii?Q?4uLsePDwgInl6WXRdHtZaJBc0ikvcNWMrarrIktGtgaSHuYTyhjoRcTIUKUv?=
 =?us-ascii?Q?Yk+6NxJ9HwGtnkiBCOjAQZBfPRAyoaSgKk7y8EzVUp5mz9R24hBAkWbftlOh?=
 =?us-ascii?Q?XIewZmnGzncroQIoG6Ajj7qDd/bSGRhEOz53zNLGG3SdLWwCFW3jK+g/xUds?=
 =?us-ascii?Q?cIdzsayEwsNMBkpn6C5UrrQ07ShtQV7HDork7gow+Ne7k7zzIrHAdpjj/FjJ?=
 =?us-ascii?Q?5kgw1nhqcZdYohpemmti2gU6C5SYlO37HSETF8xucrpQbx/jSLrGVfOOMZoP?=
 =?us-ascii?Q?afrW7xHDlafKkIP9KmV+Z6ed7tUJaDXKw5lBq59LC2Z1CdZQ4H0FkfBG6W0T?=
 =?us-ascii?Q?Kwljf43DdsnYDvofycaV3YFxSUmMZT/tWdyyTZJ4ik/AE3JMYFF1D4l0Yw+K?=
 =?us-ascii?Q?QRAjEMo8OK4Qotc2uJXN897XGjQwa9cAcr1GaeyUJ67VEJOLvyCcG9A31DdL?=
 =?us-ascii?Q?uK8sSUTqjzI0f7xlQ6zchwl+js5bz7HJEIYz2yB/QXti78HdzwNGk9PBWV5x?=
 =?us-ascii?Q?KgGa/OZzktp5mi/tQrqrJu6wzl3harvNt9jYNLNIOYFIcYexS61qV9oHXoN8?=
 =?us-ascii?Q?sc2+PhdBD8Mp20wTejJJrSTmXs+4aHteMi8KHOyzPImgzhrOch1SqhErR0nV?=
 =?us-ascii?Q?ederaA/d1pX1JYdlFzHgtjuk4+6/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?133WxeX3YMt+FaCZTg95rPDWQaba53IBCxXJ32QFZqEl92K/i466/opZvr+N?=
 =?us-ascii?Q?xNZXWOquJKD+Hy8VkAScPe6XWzlyp+/KPWdxVeYnu4q6+/YPYNVXJutJTUGW?=
 =?us-ascii?Q?uEQioV6LHXIJQ+mlN6tEVu14FlqDAhqInCvLb0wynG3AAehDQy7BeXellxwu?=
 =?us-ascii?Q?C3eQoy6lQiaUN+zDG2RTAtErTiHP+KRNCf8Y1jEYwvIXoaGpNTMhArIrhDM1?=
 =?us-ascii?Q?pJwmZKOcPOwVCutqgODkOSxEJSna/NmPSCSU73hwm/YJHXBHbQ2fB/zysjTK?=
 =?us-ascii?Q?MZq2pkbd4paJLIZOG6Nju0EC8d7J+hpfdSP+2Tj7GDs2zvBaCjVxD4w9m2p9?=
 =?us-ascii?Q?98WoWyOHF8YRpAsHoBQg7PjuSbe4VH6n2HhXsN2se/21/A6GkvvquYcvFmNg?=
 =?us-ascii?Q?Jqw1P2sgploVBfUmxf/721UGUJg0EaJvNQfLaFCjjZMW0LIh1F0BiZuLw5WS?=
 =?us-ascii?Q?1xjR7loGkRZIL5PyW2a6GWCN0e5Hp1WR7xxOeY7/fjQ1IsWLXD8hpMdfro1N?=
 =?us-ascii?Q?c1G01t0yEEAb0poUW+1uKsDM9LoQemcAgdNeJ0wtrRrrA5s9BHr9dgYlzwIP?=
 =?us-ascii?Q?HDVdpscDwraWnI3cafKLNuWj1bQQO+7Knpb8C+dcQlWIXaecldQ+Bv/rK23Z?=
 =?us-ascii?Q?RiqcRtXwk9RvIfKO2NUICQUyGovPooNtIwbll83HfO1TfSzoRto86qb2v0M+?=
 =?us-ascii?Q?jH+IcM0J6KVt8v6L2Uc0/k0TDkj/zgFYQ1PyRMwhDoS/Q//sQjpu6D39ZVIa?=
 =?us-ascii?Q?Zs8swfUpIN7TSB25BCm3ZgpF5dC/1sD+uCupQkLrSl41Vgm7HN1UrucR0meq?=
 =?us-ascii?Q?3jtvzO5iwvbbGil80IDgCKcJNOwVUDIvVY/dnvUlC+YWQCiUZeslmZprS9K7?=
 =?us-ascii?Q?GYpBhB11VXVu5SvxIZ4iaya1ioCKSIJ69P9RLn8T8X4AfsY6dtqD6dplStWi?=
 =?us-ascii?Q?6ial9MPm97/9lzGI1NKcGYkPMoiJuo968e3S8+XXmvzrjDXKjVNJ4uWnZuAV?=
 =?us-ascii?Q?KLaCxgLzhQTASwhHDX/WVklvcSGS2UE2KPCbncnuhROCwthOstzKETZTR4Jd?=
 =?us-ascii?Q?NbnDW1lv91NCWPH9CT75CKLqyiwOlFWpQUAxdpcxpAXScH9RZhMR6cA1o3Ts?=
 =?us-ascii?Q?tp5IWHCGuSUSH/QOiEY8ZcX1jnb08VJmfe/cb/qsdkS8baddbDUp5lTLBuCf?=
 =?us-ascii?Q?+4duIgzQk7ViPHpLWqXH8Dkc7Uiz0NYmr6E5M8yXt0J3onALkwfZojbKjiky?=
 =?us-ascii?Q?x7oVjKdC8hxn7ftKE0a649PiDlWjSYvhXOVq9BTkP6yBC0Ss0z2xTx8KqCFx?=
 =?us-ascii?Q?fWQAisqcjFwIDnsenzp/gxfp1x/E7mPfRp6KEwIhJ+XdXEHYc9PQDxhcs5sy?=
 =?us-ascii?Q?IHSI/toAEfAKcWIU19vQd/OARcadM6QZP3ZlUm+6mbRS3kAaxIBXEQvEpgdk?=
 =?us-ascii?Q?5bu8bNQrKkYQv3FyrdL6YD6e05+YE9KktvpsjdlPl3QSeAkk5IZ+IsaphAp5?=
 =?us-ascii?Q?vOwyTNxBRjvD3I61wgwmjF5kF/dSSl5ETGApvYP0yq7HXE/H3ocDfi1MHXkL?=
 =?us-ascii?Q?sXU6aOBzRXmF5dF8kxVZr2/iD1hJH/NR3LYP25RiMcvK2XuC8Zr7reB0ocHL?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KQR4UcSPFNHxS49Xtb7H9sUWE6nioJvo4k0GxKo3kBEmrdapansmmiDD1QAU2kaBlRYHUIRUpSfWQYexjCgM6ZxD9NilUaklAG3w1YPb6GFHafW+2DpxaUldSDmZXdx73armjDaG1cjzfIbIkuWL9MRlIFwt3/AmOqPCh6s2bu6i0ugltTJzznmo7hOvZE9H1bddp+PYRmbXZYoqmNTSrJUPc54ZWA/LIxMok0PzDHRsadrIMamhpn8w3gArrnCjkG3ZMszLtldRwn42qR0PR9lt0mMmvT9k1TnGzboaQ3IRqPn0gR6QaHc+Ck/53ppFrMeOX5ybrJxrS2ZYd2/wAfvm1gthzYie6Lk8tDL8NFPT7DZwNMP7fiySBYnR9mJby3H2siPvzXdfIheOUIVfnhdlE0TPu+SlIy/GwxwLULTcY6jE7N6Flw5FA9wbK/XRkRPO3RdktyqpV2Yw281AKHWUwiezIpVRqsqyiWssnmkKPco3PQPZwQmRI7bD77iXycFTeTduizvf0YBvjYbmYkuo9+q3yoQi9TVdezcrj4z6QALGBM73DhSD4TEPUz2MLozm+DixNPpG3+8ZcSkGvV0wKB9JnsuJH+5DJyLCSA8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f56fa0a-2feb-4789-7043-08dd3f65705a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:31:46.6799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7xn9NL4meHIWIHjxPSQcLHFWgQE6w6stz/2gxgA1ypcBkVtG7GsI5zaEQLR/KxbLOc8LcgFCK8ujaCUnDLigBsRQiciPWRzbg/g7HEscPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280048
X-Proofpoint-GUID: oqFZWCrIZ9kCUroD3vg3uAqxudfaf6hG
X-Proofpoint-ORIG-GUID: oqFZWCrIZ9kCUroD3vg3uAqxudfaf6hG

Implement d_execargs() to provide task argument string (pr_psargs)
for the psinfo translator.  It takes a task (struct task_struct) as
argument and returns a string.

psinfo->pr_psargs now simply calls d_execargs(T).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/Build                    |  1 +
 bpf/d_execargs.S             | 91 ++++++++++++++++++++++++++++++++++++
 dlibs/aarch64/5.11/procfs.d  |  4 +-
 dlibs/aarch64/5.12/procfs.d  |  4 +-
 dlibs/aarch64/5.14/procfs.d  |  4 +-
 dlibs/aarch64/5.16/procfs.d  |  4 +-
 dlibs/aarch64/5.2/procfs.d   |  4 +-
 dlibs/aarch64/5.6/procfs.d   |  4 +-
 dlibs/aarch64/6.1/procfs.d   |  4 +-
 dlibs/aarch64/6.10/procfs.d  |  4 +-
 dlibs/x86_64/5.11/procfs.d   |  4 +-
 dlibs/x86_64/5.12/procfs.d   |  4 +-
 dlibs/x86_64/5.14/procfs.d   |  4 +-
 dlibs/x86_64/5.16/procfs.d   |  4 +-
 dlibs/x86_64/5.2/procfs.d    |  4 +-
 dlibs/x86_64/5.6/procfs.d    |  4 +-
 dlibs/x86_64/6.1/procfs.d    |  4 +-
 dlibs/x86_64/6.10/procfs.d   |  4 +-
 include/dtrace/dif_defines.h |  7 +--
 libdtrace/dt_bpf.h           | 21 +++++----
 libdtrace/dt_cc.c            | 33 ++++++++++++-
 libdtrace/dt_cg.c            |  9 +++-
 libdtrace/dt_dlibs.c         |  3 ++
 libdtrace/dt_open.c          |  2 +
 libdtrace/procfs.d.in        |  4 +-
 25 files changed, 170 insertions(+), 65 deletions(-)
 create mode 100644 bpf/d_execargs.S

diff --git a/bpf/Build b/bpf/Build
index 3e43f4b6..9355326c 100644
--- a/bpf/Build
+++ b/bpf/Build
@@ -24,6 +24,7 @@ bpf_dlib_SOURCES = \
 	agg_lqbin.c agg_qbin.c \
 	basename.S \
 	cleanpath.S \
+	d_execargs.S \
 	dirname.S \
 	get_agg.c \
 	get_bvar.c \
diff --git a/bpf/d_execargs.S b/bpf/d_execargs.S
new file mode 100644
index 00000000..3a5b1270
--- /dev/null
+++ b/bpf/d_execargs.S
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Oracle and/or its affiliates.
+ */
+
+#include <bpf_asm_helpers.h>
+#include <dtrace/faults_defines.h>
+
+	.text
+	.align	4
+	.global	dt_d_execargs
+dt_d_execargs:
+	stxdw	[%fp+-8], %r1			/* save dctx to stack */
+	mov	%r9, %r3			/* %r9 = args */
+
+	mov	%r6, %r2			/* set %r6 in case of error */
+	jeq	%r6, 0, .Lerror
+
+	add	%r6, TASK_MM			/* ptr = &(T->mm) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r8, [%r9+0]			/* %r8 = T->mm */
+	jeq	%r8, 0, .Lempty
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_START		/* ptr = &(T->mm->arg_start) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r7, [%r9+0]			/* %r7 = T->mm->arg_start */
+	mov	%r6, %r8
+	add	%r6, TASK_MM_ARG_END		/* ptr = &(T->mm->arg_end) */
+
+	mov	%r1, %r9
+	mov	%r2, 8
+	mov	%r3, %r6
+	call	BPF_FUNC_probe_read
+	jne	%r0, 0, .Lerror
+
+	ldxdw	%r6, [%r9+0]			/* %r6 = T->mm->arg_end */
+
+	mov	%r8, %r6
+	sub	%r8, %r7			/* %r8 = len = arg_end - arg_start */
+	jslt	%r8, 2, .Lempty
+	mov	%r0, STRSZ
+	jslt	%r8, %r0, .Llen_ok
+	mov	%r8, %r0
+.Llen_ok:
+
+	/* read data from arg_start to arg_end */
+	mov	%r1, %r9
+	mov	%r2, %r8
+	mov	%r3, %r7
+	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
+	jne	%r0, 0, .Lerror
+
+	/* loop over args and replace '\0' with ' ' */
+	mov	%r1, %r8
+	sub	%r1, 2
+.Lloop:
+	mov	%r2, %r9
+	add	%r2, %r1
+	ldxb	%r0, [%r2+0]
+	jne	%r0, 0, .Lnot_nil
+	stb	[%r2+0], 32
+.Lnot_nil:
+	sub	%r1, 1
+	jsge	%r1, 0, .Lloop
+
+.Ldone:
+	mov	%r0, %r9
+	exit					/* return args */
+.Lerror:
+	ldxdw	%r1, [%fp+-8]
+	mov	%r2, PC
+	mov	%r3, DTRACEFLT_BADADDR
+	mov	%r4, %r6
+	call	dt_probe_error
+.Lempty:
+	mov	%r0, %r9
+	stb	[%r9+0], 0			/* args[0] = 0 */
+	exit					/* return args */
+	.size	dt_d_execargs, .-dt_d_execargs
diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.11/procfs.d
+++ b/dlibs/aarch64/5.11/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.12/procfs.d
+++ b/dlibs/aarch64/5.12/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
index 584ac325..ef27bb70 100644
--- a/dlibs/aarch64/5.14/procfs.d
+++ b/dlibs/aarch64/5.14/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
index 5aabc6f1..cad2d2c5 100644
--- a/dlibs/aarch64/5.16/procfs.d
+++ b/dlibs/aarch64/5.16/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
index 683ff5a8..6b1b1b9c 100644
--- a/dlibs/aarch64/5.2/procfs.d
+++ b/dlibs/aarch64/5.2/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
index 44ec4280..70a43ddf 100644
--- a/dlibs/aarch64/5.6/procfs.d
+++ b/dlibs/aarch64/5.6/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.1/procfs.d
+++ b/dlibs/aarch64/6.1/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/aarch64/6.10/procfs.d
+++ b/dlibs/aarch64/6.10/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
index 7274554e..c2be76d8 100644
--- a/dlibs/x86_64/5.11/procfs.d
+++ b/dlibs/x86_64/5.11/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
index 7274554e..c2be76d8 100644
--- a/dlibs/x86_64/5.12/procfs.d
+++ b/dlibs/x86_64/5.12/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
index d1cf90d3..28fada6d 100644
--- a/dlibs/x86_64/5.14/procfs.d
+++ b/dlibs/x86_64/5.14/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
index 5aabc6f1..cad2d2c5 100644
--- a/dlibs/x86_64/5.16/procfs.d
+++ b/dlibs/x86_64/5.16/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
index 35538862..08696cf7 100644
--- a/dlibs/x86_64/5.2/procfs.d
+++ b/dlibs/x86_64/5.2/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
index 7274554e..c2be76d8 100644
--- a/dlibs/x86_64/5.6/procfs.d
+++ b/dlibs/x86_64/5.6/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/x86_64/6.1/procfs.d
+++ b/dlibs/x86_64/6.1/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
index 5d7873b5..4cb7b77c 100644
--- a/dlibs/x86_64/6.10/procfs.d
+++ b/dlibs/x86_64/6.10/procfs.d
@@ -141,9 +141,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
index c8c1d961..cd785723 100644
--- a/include/dtrace/dif_defines.h
+++ b/include/dtrace/dif_defines.h
@@ -207,10 +207,11 @@
 #define DIF_SUBR_INET_NTOP		41
 #define DIF_SUBR_INET_NTOA		42
 #define DIF_SUBR_INET_NTOA6		43
-#define DIF_SUBR_D_PATH			44
-#define DIF_SUBR_LINK_NTOP		45
+#define DIF_SUBR_LINK_NTOP		44
+#define DIF_SUBR_D_PATH			45
+#define DIF_SUBR_D_EXECARGS		46
 
-#define DIF_SUBR_MAX			45
+#define DIF_SUBR_MAX			46
 
 typedef uint32_t	dif_instr_t;
 
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 6518de66..85934d2d 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -47,15 +47,18 @@ extern "C" {
 #define DT_CONST_TASK_TGID		12
 #define DT_CONST_TASK_REAL_PARENT	13
 #define DT_CONST_TASK_COMM		14
-#define DT_CONST_MUTEX_OWNER		15
-#define DT_CONST_RWLOCK_CNTS		16
-#define DT_CONST_DCTX_RODATA		17
-#define DT_CONST_RODATA_OFF		18
-#define DT_CONST_RODATA_SIZE		19
-#define DT_CONST_ZERO_OFF		20
-#define DT_CONST_STACK_OFF		21
-#define DT_CONST_STACK_SKIP		22
-#define DT_CONST_NPROBES		23
+#define DT_CONST_TASK_MM		15
+#define DT_CONST_TASK_MM_ARG_START	16
+#define DT_CONST_TASK_MM_ARG_END	17
+#define DT_CONST_MUTEX_OWNER		18
+#define DT_CONST_RWLOCK_CNTS		19
+#define DT_CONST_DCTX_RODATA		20
+#define DT_CONST_RODATA_OFF		21
+#define DT_CONST_RODATA_SIZE		22
+#define DT_CONST_ZERO_OFF		23
+#define DT_CONST_STACK_OFF		24
+#define DT_CONST_STACK_SKIP		25
+#define DT_CONST_NPROBES		26
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 29cfbd84..1dc119ea 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1082,7 +1082,8 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_TASK_PID:
 			case DT_CONST_TASK_TGID:
 			case DT_CONST_TASK_REAL_PARENT:
-			case DT_CONST_TASK_COMM: {
+			case DT_CONST_TASK_COMM:
+			case DT_CONST_TASK_MM: {
 				ctf_file_t *cfp = dtp->dt_shared_ctf;
 				ctf_id_t type;
 				ctf_membinfo_t ctm;
@@ -1108,6 +1109,36 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				case DT_CONST_TASK_COMM:
 					rc = ctf_member_info(cfp, type, "comm", &ctm);
 					break;
+				case DT_CONST_TASK_MM:
+					rc = ctf_member_info(cfp, type, "mm", &ctm);
+					break;
+				}
+				if (rc == CTF_ERR)
+					goto err_ctf;
+				nrp->dofr_data = ctm.ctm_offset / NBBY;
+				continue;
+			}
+			case DT_CONST_TASK_MM_ARG_START:
+			case DT_CONST_TASK_MM_ARG_END: {
+				ctf_file_t *cfp = dtp->dt_shared_ctf;
+				ctf_id_t type;
+				ctf_membinfo_t ctm;
+				int rc = 0;
+
+				if (!cfp)
+					return dt_set_errno(dtp, EDT_NOCTF);
+
+				type = ctf_lookup_by_name(cfp, "struct mm_struct");
+				if (type == CTF_ERR)
+					goto err_ctf;
+
+				switch (idp->di_id) {
+				case DT_CONST_TASK_MM_ARG_START:
+					rc = ctf_member_info(cfp, type, "arg_start", &ctm);
+					break;
+				case DT_CONST_TASK_MM_ARG_END:
+					rc = ctf_member_info(cfp, type, "arg_end", &ctm);
+					break;
 				}
 				if (rc == CTF_ERR)
 					goto err_ctf;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 6e74b4b0..a1a39f3f 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -3300,7 +3300,6 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	}
 
 	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
-	/* Special case for arg0 through arg9; encode as args[n] */
 	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
 		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
 		idx = idp->di_id - DIF_VAR_ARG0;
@@ -6661,6 +6660,13 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	tnp->dn_tstring = NULL;
 }
 
+static void
+dt_cg_subr_d_execargs(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
+{
+	dt_cg_subr_arg_to_tstring(dnp, dlp, drp, "dt_d_execargs", 0,
+				  DT_IGNOR, 0, DT_IGNOR, 0);
+}
+
 static void
 dt_cg_subr_d_path(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 {
@@ -6758,6 +6764,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
 	[DIF_SUBR_INET_NTOP]		= &dt_cg_subr_inet_ntop,
 	[DIF_SUBR_INET_NTOA]		= &dt_cg_subr_inet_ntoa,
 	[DIF_SUBR_INET_NTOA6]		= &dt_cg_subr_inet_ntoa6,
+	[DIF_SUBR_D_EXECARGS]		= &dt_cg_subr_d_execargs,
 	[DIF_SUBR_D_PATH]		= &dt_cg_subr_d_path,
 	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
 };
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 07d22afd..9ad4f5e7 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -89,6 +89,9 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(TASK_TGID, DT_IDENT_SCALAR, DT_CONST_TASK_TGID),
 	DT_BPF_SYMBOL_ID(TASK_REAL_PARENT, DT_IDENT_SCALAR, DT_CONST_TASK_REAL_PARENT),
 	DT_BPF_SYMBOL_ID(TASK_COMM, DT_IDENT_SCALAR, DT_CONST_TASK_COMM),
+	DT_BPF_SYMBOL_ID(TASK_MM, DT_IDENT_SCALAR, DT_CONST_TASK_MM),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_START, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_START),
+	DT_BPF_SYMBOL_ID(TASK_MM_ARG_END, DT_IDENT_SCALAR, DT_CONST_TASK_MM_ARG_END),
 	DT_BPF_SYMBOL_ID(MUTEX_OWNER, DT_IDENT_SCALAR, DT_CONST_MUTEX_OWNER),
 	DT_BPF_SYMBOL_ID(RWLOCK_CNTS, DT_IDENT_SCALAR, DT_CONST_RWLOCK_CNTS),
 	DT_BPF_SYMBOL_ID(DCTX_RODATA, DT_IDENT_SCALAR, DT_CONST_DCTX_RODATA),
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index a0205887..c8208de6 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -138,6 +138,8 @@ static const dt_ident_t _dtrace_globals[] = {
 	{ DTRACE_STABILITY_STABLE, DTRACE_STABILITY_PRIVATE,
 	DTRACE_CLASS_COMMON }, DT_VERS_1_0,
 	&dt_idops_type, "vmlinux`struct task_struct *" },
+{ "d_execargs", DT_IDENT_FUNC, 0, DIF_SUBR_D_EXECARGS, DT_ATTR_EVOLCMN,
+	DT_VERS_2_0, &dt_idops_func, "string(vmlinux`struct task_struct *)" },
 { "d_path", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_D_PATH, DT_ATTR_EVOLCMN,
 	DT_VERS_1_0, &dt_idops_func, "string(struct path *)" },
 { "ddi_pathname", DT_IDENT_FUNC, 0, DIF_SUBR_DDI_PATHNAME,
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index 038cf69b..e9d50349 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -179,9 +179,7 @@ translator psinfo_t < struct task_struct *T > {
 				   : (struct tty_struct *)-1;
 
 	pr_fname = T->comm;
-/*
-	pr_psargs = stringof(get_psinfo(T)->__psinfo(psargs));
- */
+	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
 /*
 	pr_argc = get_psinfo(T)->__psinfo(argc);
-- 
2.45.2

