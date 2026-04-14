Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7828B4FA
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148075; cv=fail; b=QyU7/bmLSP4CVQCIwnB8epHuBFbaJKxzhW1UwJhs7dLqahHxiTJ1ZcPEyZScaMZCCKGzgxChu6GPmd1CUsa9ORc14cBm+WhkeXjazGp9982rFT8ebFaN51jvWL57zSeQBDGisR/ig+usoIK4AkAawDTyKlpOJi+3ghEQlURNi08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148075; c=relaxed/simple;
	bh=dCTU2PHvEO0jCQ8mSlpH0Uw670lf1uZZ9jiNZv0CdgM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=cdfWp1suZfxxRohDZT/xAHE2a7KGOdCFd2Db3qIOFDaChb9U7aeZN9Y2JqYybHphNBmQRvk8C+VpjbHO06/FvpmZYZcn7s5cpaN1K6EEMwqyrJQ/J/EWfuhfR5096Aa+A3LholQ1+8zr900YluUqBBej/9X87I8rw7lkALxzLoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D562Sr97; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dIhmdh40; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D562Sr97";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dIhmdh40"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E5ALKL3230300
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=8ify6qAyKWnBAxmIn48J0kXIH2ck74Id3aE/ik2rIdI=; b=
	D562Sr97lCZs7f015n0SSPV7SpQKhPnrqnLQC0WR2hB0zsnEzTG/sr4htJiBD79L
	pS6I4b1gbx3oL6vHDDO3Xh7zwOYA5nzGJfYa8O1QS9xJEWRZhtLZlDHjrNltpc4j
	WRB2lOZ2FHXrNzukswz72aLeikRFQBb5cZVPjegSHVgqWlKS7Kwf5Cqu2WNLa+Vg
	jglkK4VYWtaHwrGHLy43T0YfmGBtWOi7Sb1tGzrzCrzdDuoqd3fO9nZEmBe7xrue
	zLROyj4+wnB5RKSlciS64ZPJgaBhAHVMZKSm6bcDLPvxGTHjx7X/wxeyCGuyyT+m
	eUIVKdj1fLKUhl8w8kup1Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh8678maj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63E6OP1g000817
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:51 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4dh9jnrn3w-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 14 Apr 2026 06:27:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy6ynSLcVQg4zd8RwLGjESY3adnIjHHiGLzpr/oKazAVGBrhshXaoBxm0aCollYz6N6N4HuxiZnhtm8xeY+mnxV8uvZnfKws3R8qbtY4nsifBLpmfrGm+XgC6oOc6nrG6EaB/BjEPGlf8g92g5lCdssZGx4B7ayFT3TNKLPgPhOfHed8t9CWZsZT+QJ53LTPhRv4JFMMmPs8BAEwlBQ6HoGG93lI39isPQlZhJ4vjN8O1f/SWIcquMe5sW3a7LVe2TbSlAyhXi36ofTa4lWrSnYvVi0odrZPGquDGdc9PhSNCWOs98dpa2iXCZb6Y6d66M0pnd4nxTn7tobwxdgBDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ify6qAyKWnBAxmIn48J0kXIH2ck74Id3aE/ik2rIdI=;
 b=V21Kv2aAB9/H5WFeH7X3mQIxpkX5+lPmo+BfapxwmY41E0dXeCuhJhLtn5Eklci7lJpDDnJIEF9F26bskmvnmnUy1dAlH9gVYoaQrImVz0Kprl34XJcalJzknp9lpaIQuLHQiDDyUfkgCBf3ODKcgKVkbhsqXGoHb4dszf9Lbe+i1lF7oU/tZWqVtxUBwfN/PZ5mC5MBc0GxH6sfrOgXSINvphyh5yy9Ca1zCAIyAZpplg3t7qSCzVNe7eIGKh7blDkWdo50RhcVIVFktqpFt/XSPcav4SsJq3/kb1OYWPZ+PBRAtQbATbsK45R0fE4/0zppbjT/dkq6+AQxh3a4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ify6qAyKWnBAxmIn48J0kXIH2ck74Id3aE/ik2rIdI=;
 b=dIhmdh40JASWYj5b1O9yXKrtDhVbUzuTDETPl3V5iq3XcExjPsVCsG9BZVr33gRsMGr/9rpRExr1oidEtSi8GojxBYoiZkjIcLHTHMdBcP6Qc3uxCrlwLRTAWXZXvR8jzqGCARYn1hB/NpcWMVgX60Cl4fUJtOoFsjXBEBEW2MI=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by SJ2PR10MB7787.namprd10.prod.outlook.com (2603:10b6:a03:56c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 06:27:48 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 06:27:48 +0000
Date: Tue, 14 Apr 2026 02:27:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] btf: add dt_btf_func_is_traceable()
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:208:36e::29) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Message-ID:
 <IA0PR10MB7325F8591942AB9F13EC9EE5C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|SJ2PR10MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8bb532-c148-4846-eb74-08de99eef296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VMnaTG89wY8XQViu5S7srioRMlzZBfEV26zfDwzVz6jAQiW4OCGeax85LMPajeDZEJpI7dqsNDnx7nCyH1wmJL+PgpP+t87lN9R6bF1nz4UHQRZCIUREP7U8MAw0Ps3xy6ELFvwZotna2uG3zAQf/onPzWzXi1OO7SppSBQI2bpQEjbECL3welPHj9dTMZXnSkr3yvbSHI1D5vfuvwEnELCwD/SIOvxC7GM/lCnza56l6yEl3v1wDX+wc3lHJk1RZanQnzaClInH6YJvL7+VsgXcX40ntLRaPLslMDxhoyuXYMx13ncJTkTtb9vzlUwUHGblUILkzCEdHMXqghSA9wC/vcHgySmOFPGE/BGk6C1DjF8IHcB+EDc4LSIMhirwHhPtVd49jYkYHafjRb4+W8R2/xOKbEVXCd8LuCwZPCr3kyf8i0YhlBS5TjpzUggp8fQcaC9Y+taqGK9oRcbr9Uug/x5tTq9NI6UKUo/OQlciRR/SubYmqEjdUCNjA80Orj+5D5hvjxMg8+uV2mjqc4t5ZHLyBtjf5jMkemE6VU9m/JPV3y2gLegfG9dLWBv87ymga4Fz4ncO2u19NTSgt56upm7w8P2zbpWf0XGsyH+IZPJNPJ5OhKItEb6LHT2yGc6d+ifweOP0IR4sbLiz5M8A+LiqJ/KgxGSbFiZ0dQF/VNsvnIl1wv6NY24jnqaIS1wbqKlAMRlE1/aErZyW07OKHKC4LYuczyhyfb32u8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6U5CwpmFEGhzoikrJjXU7gdwdpGBZqp/aRhETnar7wpNn2QLPqK3rCZ26+jV?=
 =?us-ascii?Q?pH3BxdB7UoVCkNnmJipQbDOPK/fu144Bdms2xsJuWNiokRayJQ0MlvdyBYza?=
 =?us-ascii?Q?zvYpcMX9OD3Xhk6lXfDACSl/v6LX709895VxpvGeB0lYT3WwtjKG/26ir1vr?=
 =?us-ascii?Q?aM2pj1g+rwkcRYNFLcsVKm4XwacdQ7gCRIzrQg/8jDxHEnSMRReRaxpMSesp?=
 =?us-ascii?Q?ubFF6hU1Cea/KAqZgAmWH5nyYjoKP4BdUU35Xj5VgDT9FgR8hQkqwYqzL3sT?=
 =?us-ascii?Q?qjKvE1dcN650X9k4Pf86OkleArFSI39e9lYjwI9koSAWhLDmMag1xPsNVK5F?=
 =?us-ascii?Q?S/JhkdPxhROSI/EB43i+unTqvWkLTQT2Ivwn3HDCD1xdJ9tjqjvDi5NIonBe?=
 =?us-ascii?Q?wQyTJxn5qmp2LMSff1QikmHjqKJGZKnnlZhfushv9txbrp9DERuzEg3Fq3A0?=
 =?us-ascii?Q?ZbfsrrasqkOa24VzAUXKDu2IpJVOYsjveVSJvUFb/48Buf/mEOwr/kw8qHXp?=
 =?us-ascii?Q?Stq1ByHfi/rcDkleuroH/5RBdPAlOn4aIWtbcaPbTQrX/BoIi1E83XDtBlkF?=
 =?us-ascii?Q?klvwfuF5ir7H4r8IivwPwOE1BmAWEHp6yV6wjiK8USPR1gk/ZwP7hlEvdErC?=
 =?us-ascii?Q?wE6E0b8rZ4gVB+DOggBXSpUm88tNb0q7D4Qh131cKzDSgviNt1VqmFAJ56fi?=
 =?us-ascii?Q?oAin/vV6gicFyyZxl8d7Ha02aQoJ/ANfw2kkPacE1PFET8Krz7gK8pgBQkG8?=
 =?us-ascii?Q?mj/3n7q42r4ZMTvCrflMBPI8VOCac4qO6yOb8bKhQR0Esz7/kiZMyvVRGuVT?=
 =?us-ascii?Q?ZttxBM69HW0PcRPUtZd5p0exnGCsO0coYt8yw4VfBKc/l3A6154d4Kf6Pwrn?=
 =?us-ascii?Q?BSciM48bMERJTeaXsLzPCbcUS1sFyPBEx+8l4q3uGEKA0gVmXqbMZLMDdnfQ?=
 =?us-ascii?Q?kdktHTTbpHPpib0+2rSY4xXzR5n0USLwjXVqJfOgLTS5nHF4lQnP0j5D2EgR?=
 =?us-ascii?Q?XjEGXP53iTpaeY6eof1Pr1URgpYuQAYZAkw9VRpapCpZXiYRkX/QIBH+2Aq2?=
 =?us-ascii?Q?+4q1ck0tagmmPhuNS1nFsY8AWQiYvNS7Pl9uaxDtP14Mtpvq5ocff84uNeC9?=
 =?us-ascii?Q?VlQe0hS/3vp7vWb9hTDFZHzQwNlc7SNT7XTDnivpYmkNtZ5Uo3ZoPowUt33u?=
 =?us-ascii?Q?mPZzsgpkiF780oeLS5XGBS/+cj8uRPczZ9Qgm5Nlr6HzwoEKRrJrJoCOKv9t?=
 =?us-ascii?Q?C/7oTqsFkfIjqIgPAMhKvatiZiaWSirndQYzSWwm7zZS2stW3AWDobUcjzL2?=
 =?us-ascii?Q?06vJrwsV++YBW2+4xp8gmI96FixtO63kI7tigPPuSHWiSbcVuYZf35KtaOKX?=
 =?us-ascii?Q?lQ9h+BbE8bajazyRGoTUK4Kdy1p+MPmgjNfuDINJcbp1HaPPXBKmzqT4WC89?=
 =?us-ascii?Q?r/09p/uRG/X06dVptyU957sGvgMmuw/IDjK/8/U79z4Gq8n8FVEiPpalcAbL?=
 =?us-ascii?Q?9rR1N6MDTOEr2ej9/hN8kWRhp0zgjMtjQcWc7+cqK5UntHcw+RJt3KztjW9G?=
 =?us-ascii?Q?fwmycHca7qZplD1kW2h75CsE6CAA7ux2O/5/gjmhtEyczQUwVmMtvKiL76D4?=
 =?us-ascii?Q?3Zy5CM+q0icWHhktMPcD+CiavjJ0H5kYcS64Ukhk3gwC1QVNS2A9XuDuML3f?=
 =?us-ascii?Q?kc2Uoa2MNXi3XmUOA14wJVvlPe31/tmXrJHIGvlErYoXmG+hUolp0R4YdRdU?=
 =?us-ascii?Q?bvOUq/4vaw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	PTNHqreQmijkv5GYwyjA1fUq8XZPdmylOJcSdgFi2mi+345ONzwzQJ7Ug2DXDnZ87Lfll+d98vESY2mJxT/7EQvvIudqdHE2NvNJk0toef2GYqiETtuv6PTXO5ekpTWtiNu4OZLLTtNa7Cxsd+GyXwV78vQJ/J8OZlSnorfmJWrR53OKZCmBXZ3MtRyoxatqj+KOnjchcp7x2dkJLTOJqqvVfiZoN865v0PwQT8Y9l8qUfh+UhHQPiSQngiFFD/W3cEennjlIonaNVcHyad2mkEDDZM8AyJ3Q526VwUIDqS2y8yU+p3TSEAE0WxhIl2maSXBWA/xrha4fJxZvUYCdA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XUbssYpNrgJDwMqESznx5QBV60ehj2IuBache9+mVSc4O1NhedOL3k0IK9i+HnjGisURPKcXu9Evu5r94A642b/XTrTV7vSxmjn1ZRhQCSJeqtTj02T9tql1J3YHqn+fXA22BuxYan5e1fw4TDzJakwptbxLLT+HmYQVFYjd6khe9wFdEgMgZPwns9JOaxMpnSFFVpFHRgJYHrcg1pWPE5oUvF8Sqcqg/0EZn/QyPrvP+yiPIxV7LPyCzrOx59zkAD9e1kVq4llPYbJKzdVk6KTUldlKG2DggyMeXk8gQW4miiEbIKfx93MnY1bKFsvUYWAPK3wCvmpWNjYmKCzYj4wkxAoje8klgwTaoHB2jEftCMfv2g5MDQ9yyPz2imSkvcJNBCuy74MIJsI2RcqSvwLdxRir8v0UjgMxu40iOZ0ckQCojVe7d9U2WQ5zJUJFhYse5XaZVGGntVXxCFaC0pggZsqdzUjI5PLFJd8sQPSa5Czbaf5p7MF2oUlb4lp0ss0rVwYUFzVY/un6JPr/ynmIgdCvb6oVHoG3DRex7832aueJ7/4d21dCB5oo78755mMvaqXRL9iDg/WWLOIrKdvOJUCMhc8UwBlRSLbmTSA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8bb532-c148-4846-eb74-08de99eef296
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 06:27:48.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: so/Dxb4zRVvItgmRE42brOSBFXxIgH3cvADyEENsulhNevLt8ykO4Aby+U51Drmea+vhZ7OFdhF+al05ykuF0oQtF1Oa/XxZ8ubBvBlZFuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7787
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604140058
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA1OCBTYWx0ZWRfX7EKIyNI6ddE9
 iOD7ewBW4P5is60/BfQAUVtWvMPbcEu8w3RpSmRnul0hWjie7Mrgi8+iKBWZR1pXgT6JMrKPnEx
 XAxp8yEhBhqBZfejESpUMoldQ/WD0uL9j6nXji+UWLq6TjR5gb4U/rdELaFFZmw7LsUaFdh+X9y
 qN5jp7vo1yo96Ecaq87LGQ5Z25Q3OvanyQnqQFvkuf1iR59YDimvCOPM9XRbJRqs2x0YCCgceyZ
 L3PzIdl+sKVlaZ6kb3Nucm2VQOKOZl5DEFAuKUiiJCON5fMCPU5WuGkGqQU9w2W5TBFvC59TODB
 zoPwg6gsDpfVQChKlugZ9MN3gG4I3J8LRyZ+K5y0IW9+4Nff8tNLxLTacWleyK45scIVtLHmkOr
 0CNAZnY6LNTp3VkyCTn+gM4812jkcdIrE72pOLArPMqWPu5YTEckC2DetCJWMnGMV81cA6qZ9sW
 UtlWHxAbivj7RkXXZWw==
X-Authority-Analysis: v=2.4 cv=cbjiaHDM c=1 sm=1 tr=0 ts=69ddde68 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8 a=QgRwmrztqVP6wXTSXnAA:9
 a=O8hF6Hzn-FEA:10
X-Proofpoint-GUID: OPDjpZx_LPORGxoR-MMrNTYhI1l7UjVe
X-Proofpoint-ORIG-GUID: OPDjpZx_LPORGxoR-MMrNTYhI1l7UjVe

Add a function to determine whether a function (given by BTF id) can be
traced using BPF fentry/fexit probes.  It implements checks inspired by
btf_distill_func_proto() in kernel/bpf/btf.c.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_btf.h |  2 ++
 2 files changed, 67 insertions(+)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 56eb96a4e..fbf377b4e 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -1020,3 +1020,68 @@ dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 
 	return 0;
 }
+
+/*
+ * Return 1 if the function referenced by the BTF id can be traced using the
+ * fprobe/fexit facility.  Specifically, that the function is not variadic and
+ * that none of its arguments exceeds the acceptable value size (16 bytes).
+ * (See btf_distill_func_proto() in kernel/bpf/btf.c for reference.)
+ */
+#define MAX_BPF_FUNC_REG_REGS	5
+int
+dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+{
+	btf_type_t	*type = dt_btf_real_type_by_id(dtp, btf, id);
+	int		argc;
+
+	/* If no prototype is found, BPF fprobes do not work. */
+	if (!type || BTF_INFO_KIND(type->info) != BTF_KIND_FUNC_PROTO)
+		return 0;
+
+	/* If the return type is a struct or union, BPF fprobes do not work. */
+	if (type->type != 0) {
+		btf_type_t	*rtype = dt_btf_real_type_by_id(dtp, btf, type->type);
+
+		if (rtype == NULL)
+			return 0;
+
+		switch (BTF_INFO_KIND(rtype->info)) {
+		case BTF_KIND_STRUCT:
+		case BTF_KIND_UNION:
+			return 0;
+		default:
+			/* fall-through */
+		}
+	}
+
+	/*
+	 * BPF fprobes do not support functions that are variadic or that have
+	 * any arguments passed by value that are a struct or union of size
+	 * greater than 16.
+	 */
+	argc = BTF_INFO_VLEN(type->info);
+	if (argc > 0) {
+		btf_param_t	*args = (btf_param_t *)(type + 1);
+		int		i;
+
+		if (args[argc - 1].type == 0)		/* variadic */
+			return 0;
+
+		for (i = 0; i < argc; i++) {
+			type = dt_btf_real_type_by_id(dtp, btf, args[i].type);
+			if (type == NULL)
+				return 0;
+
+			switch (BTF_INFO_KIND(type->info)) {
+			case BTF_KIND_STRUCT:
+			case BTF_KIND_UNION:
+				if (type->size > 16)	/* value size > 16 */
+					return 0;
+			default:
+				/* fall-through */
+			}
+		}
+	}
+
+	return 1;
+}
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index d956ad940..2c921a033 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -28,6 +28,8 @@ extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
 			    uint32_t id);
 extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
 			       uint32_t id);
+extern int dt_btf_func_is_traceable(dtrace_hdl_t *dtp, const dt_btf_t *btf,
+				    uint32_t id);
 extern int dt_btf_get_module_ids(dtrace_hdl_t *);
 extern int dt_btf_module_fd(const dt_module_t *);
 
-- 
2.53.0

