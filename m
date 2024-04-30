Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F93B15279F
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714487810; cv=fail; b=a45tN/R1fx2WpXtMK6dZrtj43lw2mM4EP8iLqUp1As1RfeRyB9ztFZg1acAfpyEiGNvJybcGhceI8s8nxANeLJQUD5KcPe5Fyk63IXXKJBO/JGDduwvcQ0dUaL8M3jpbWqneS5eP3zfb/OBc4D2VkKVUI9Y21EJU76lwQAx9/gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714487810; c=relaxed/simple;
	bh=6L/wWBU8wre0az1BQq0iBFyoCsBFXOP9rlaS82Yq0lY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=BWFUjVbDEWM36JvrM8+qYzf89RRUVkIA2RsbKQW29RzoiXxdNDP6jKYQrmeq5sXVpMv+ROy9wMo6GcYTG7GUv4K9Dm9kudKO/q2wNyIBBKUhQ8WzJyZY9fcr3/iEjJg+tRjh3M7RI2yY3495/EtwtDPZwlZyqlmH6iJraxHPumk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RrAoviGf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=REvoMKWO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RrAoviGf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="REvoMKWO"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UCRWC6016657
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 14:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to :
 subject : content-type : message-id : mime-version; s=corp-2023-11-20;
 bh=mXUiUuiYqzROn1hSoQps6fAR60ja1eMOqFe17eIallk=;
 b=RrAoviGfm9Z25JiFm48wnjrZ60iOiS0Li+2l7YopUEt7SkAljBpSZybtung7iE2r/1Wz
 MbkVu6II0QzVZLdV+pjR/JUvTZr2g2K26SAN6Z866p9yN6cqkUmigdR6shnLjJ3RI4mr
 +JuHUBawoI7QytdxvAZtJ4Zy6+G3EXF4Kv/B+3UMsOdaLxPk389W5mQ9zGVsMP+OFx3l
 kGMAVQosLDVlin0o/ycRQf/w4ijeOLS9c0f4KKIgbSPyzyRngo3sx7NeaZWNGm2xp3/T
 4muM/1vgocecLOPMl0c+aNnk+rs3gs2OEOcsS+ZJcLoWT6IGh5KDKgoQvzQcFNF84/rl 8w== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xrsden7gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 14:36:41 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43UEQkse016720
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 14:36:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xrqte0w3w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Apr 2024 14:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYHh1RuqJ3qhGmBjtNUwd7VzlAiBc9ootlkBjS9+aq+QM2e97oyfG4zUKHUVTxqn3D1omu/gx5KgbjOwTP09ZqVfVpjHuI1erc8u5ltWk5hWVYKuL2epZFBb7AV8q44IpsG0ZF6ax0Ji05ugRegWbV/n5RvHCachduT3D/2pCgP+AXB+Z01wN6SKxcaUwyu7niKOU2cbnRLxY7O3XPwF3GscrQkS7bA0cpzzYI9lEnls/aRKzPtrTWJgQ/XoLd1CCc6syKq5TR4xF2EssaLGSfmAdSR33CvssEnS/tLsf8cvvQBz0TjZAWEYQSyXSyhH+T8G+RGr+MMniJkO6O9Fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXUiUuiYqzROn1hSoQps6fAR60ja1eMOqFe17eIallk=;
 b=Xj4HhdEPU2kcfpg9r4TOlHsKHeA9HO59HhYNJYIcTPxWEtNnEJ4m5h3D8nhDlaFlnSADlrklij1Z4/MOEJw4JlGqNY2FLSFuHtPluAqVj4FG1AzM5FJTGyZZoWpgMDt/kfmQSeu4HUymsLXPY9qalIrSL7YhjB+qN1ppILJhgGcpQRQfhX7IYilZVD0UC4UR1eFsaojGajpXhGTpvxiYnj2IGjub03+cKa9CYYYwfw0QzjHLlHoVzuzDk6U4EdmQ12CHsIjUjgkGVN3vF60K0HqEUW1HIDOGmkweeFWqtIFpmrTsSm5HxAKESg+SEVlxOcc80/OhPn+Yq1gBrrRYow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXUiUuiYqzROn1hSoQps6fAR60ja1eMOqFe17eIallk=;
 b=REvoMKWOsyuIm4cpkyUy/UufFpXWK4OPLRez5GlwlkOhG9nx4M+ENUXNo8CEuOu1TYDwBO6gzL9C4qrhU3ERJuDmmfX1P+RoDm85xl3LLmdW/Jo37+ida5NGkaXNddYHY3um1y5rVyauQPK+TffkX7DeoE1HRdSX3hzODvjxmGI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB6432.namprd10.prod.outlook.com (2603:10b6:a03:486::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 14:36:35 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::6c60:5db4:7058:1440%6]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 14:36:34 +0000
Date: Tue, 30 Apr 2024 10:27:49 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: work around BPF verifier issues with AND and 2-reg
 branch conditions
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:208:236::10) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID: 
 <SN7PR10MB6287EBF86002CF6FAD756D1AC21A2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bf25b01-e539-496b-786d-08dc6922ef7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9zLVQiReNw8GD6Hu89l85sHSEVl2e6F/Wr6bIWtqHxLxJGTn0bRcnhJiXI8f?=
 =?us-ascii?Q?ytkZC2GiycEaeL4YECe6dGvhS7gwj455uJv9uuavGnanE3R8AhazWavwsclN?=
 =?us-ascii?Q?joLXauf/7meFx407m+8v80CNAagPTqnKSCiAPPeebmtl4XM4HCPgMQtS4I42?=
 =?us-ascii?Q?k0yAkiszY+plRihYMkM+0sArtDmew+YPXeJpsAm7ZwiNwYfU5ULGkyKHYy3c?=
 =?us-ascii?Q?mPcBqVjtNc0vpwYqEi37lfWV3jHKuLOF28KEq/+fEz0E21ADHMgR45UesXuD?=
 =?us-ascii?Q?giBYkcKnSfqIpHTRbvFOpZbwr71TXqBbBbDqfHvwVIXjaDTIts9mHa7XsoHi?=
 =?us-ascii?Q?uN/TeiaS9TrBA8butxUsgn4u9gkkYYgFCTnQXKs61+nsT9W+Ts40aqQJB5zb?=
 =?us-ascii?Q?8E4w1F9BSghV53oUcnULhP9BoqQbSNd5+TQpzpAOfaW3P0zDYMj8fSlbrfO3?=
 =?us-ascii?Q?lApWqE6KXsk6H0W98g97qCA3XotO5tE4HHxo048JbEOzMFw+i8pG5r/kfqCe?=
 =?us-ascii?Q?CxAFIzHxv3bASmspI4LSp0roN5XVH2uXnVjIgto9PqQk9QKlPirNDpuCNPQN?=
 =?us-ascii?Q?IP5+zofJs2BIjHSR47VEmn27CH54IG1jOmgNMKqD47rdzhC/M3FJ5PPMfF1R?=
 =?us-ascii?Q?Z390JV+wm6OV6jyXn5Q/HR8/8dLiI0J3kwVjnseOLmy6VzGgHok7jJYiCaEO?=
 =?us-ascii?Q?Jx0W9uR849KHdRhQPpRzoYHnV5Bi+8v5SXndGjlQujOA19Pbpl8Ap13njYXc?=
 =?us-ascii?Q?pmHiFoksUJpUWdADv6LFM49CfzT1H8eHqFkDQ7G9pPkMox3XISmHcISP3zO4?=
 =?us-ascii?Q?7xN7zef6qswJv1KYaaJu54WA8MDLUiAdSkGhqx2VmHqhe7ZCF4lyd+01VEbl?=
 =?us-ascii?Q?gD7kc9FyZ86F31ddKQPHZefuA/vI02gjLxupIo3LAGo/MdrN1+a3Cjgz5Ny4?=
 =?us-ascii?Q?uBRYTGDXVFQZNPSJOA1rgHF/IR4SOUwLzAVE2c9Eu3T+rwikx2g+8CiXep7p?=
 =?us-ascii?Q?Uqw23SCjvjPN8o8GLT12QN4ubRU8Xp/VZp3YMm0DyFvf6rfR2tWcvUhBO97o?=
 =?us-ascii?Q?8oJBYvvZ7mM39bojMhtzJ+XqB3xFpypi0uWcuXayiWYohVcuhk+jgpBSgmtN?=
 =?us-ascii?Q?CdYytlriHwljMZ2tEGGmOBiSjihsFiFsQGjwjfTQ051SNJcSgDk7ryyw/RRW?=
 =?us-ascii?Q?211IwC6vIf6sn5/BnP68iprd79GjV6MrdTbStkjcHiefx+KeXSJvYmhv28wA?=
 =?us-ascii?Q?/+kL2/pVJf1jHSTtRHtM/wbFGv/KQ23NMcB2Khm7fA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WN0snEFTz9Ff6UYrnuwex5SuedOW5rqGTcEtaLqin4nOehOhF2yRgd0zhg7C?=
 =?us-ascii?Q?AJVKomiu5+KEkYRI2gM43GIU2078IAizZYPl7WWdOaZV2hhpc8O2+gQCqVMW?=
 =?us-ascii?Q?pufWXtOsN6+O7uq4XE/Q3hvxfLR1domYoVBnPfkWS+b1lBOkDD4vIL02vvQt?=
 =?us-ascii?Q?L5W4jnwPz7lTkycmEnn1p1xs5UMKM7eZ9yH52vdf0SP+pLmcVv2Qmg1AUW0j?=
 =?us-ascii?Q?dOgiBy7v8UMud5HGviUcLuXd5qPABPGYtzLMBI9JRragzlP7w41l4TI9cr//?=
 =?us-ascii?Q?2KwxoE5NqHpf6tYCcFNh5VkwSdlR0OFi4RwkWIuOAfPk3Cibp1HDkZOavyvJ?=
 =?us-ascii?Q?Zj008YhBLPXS/AmbjDXOdXXrAARwZn4Bxsar/iniPwRGyPN2rBV3seJzkMYy?=
 =?us-ascii?Q?E/HKAawlZWro6uxvKWAWywCXjGtSJ46HE/atyo/ahYQ11d7h1RxXxo20ryVE?=
 =?us-ascii?Q?3/vIdgDTGCBpe688ZTvSZ0TJPVf6Eb5jXv3ToVYkGjunDjxQmeR5AYKkPwNG?=
 =?us-ascii?Q?zniK663Oh8UPYoXoXiGNDorH537BU/0uAE12hN3QZMgCC11k1xmNEgAhvMv4?=
 =?us-ascii?Q?UkfBkOBmmNIosx/2R+emGgWxYw/CoTBZS1xUlWFkLC3dPyx2/t156L5uOD3s?=
 =?us-ascii?Q?N33SG6Po6YPZdkel2Hq+12tTJBtOgjMRRQdlXcW4ckXn45vbmNlfGFotgRxp?=
 =?us-ascii?Q?bM5uKWXMkYbVHkLYUnFtUxqCS0dVF+DFv8MNGTfa87aILKCNamKcXqmwqOKn?=
 =?us-ascii?Q?brwV2X3/1uA54O3Uw3YuV0sobAfySehPIiKAjKr7t3hkzc7O8jZXbOytrM1k?=
 =?us-ascii?Q?96PCGv5L9PPX9BZbWbwzystO1Bh4LfKzU26Y0fO6ck9nvt+YY15ssbsuEHP6?=
 =?us-ascii?Q?P2yTCD/klHwGV+oleDMNHqhR62dw2zOBdwjDREhdaTUKv/IirnoODLXsTeff?=
 =?us-ascii?Q?paCZOAMTr0uvH4BEM78oP6nhhjGZY4YGcyTG6T2zMsAs5yM6Cg9mXoOb2IIa?=
 =?us-ascii?Q?cNPhpJ6uUKBNVpzbi64exv+yA61czghb5+MlrjNWO+y4rTXCv/0INRvqF207?=
 =?us-ascii?Q?NZSIa9f0OTgnCp2zgbfb0TID18LjnFqAVsuUSTMeqU2Dny4RsulM/uR0GNV1?=
 =?us-ascii?Q?RybEAB4tHpnf12uhD2c/qVXu7U8qxW2UDEvDRDumjtEczpR7YnKKKW7ILj7N?=
 =?us-ascii?Q?7yb9Er5+8I7xESdibO8FTPrv7R7HerWRGu1M/S6LW+LW0Y/NQ09/CoGdL9pH?=
 =?us-ascii?Q?H/8z5E+IGmi9yaSDwd37nnjsIrGGGPlF+JUuzkeZ2Vs8xGjspBu+oug9HFNG?=
 =?us-ascii?Q?zsfJvCXfABdzJ6kAclm85V81IejfRHYvP2kVltZiGdrw7aupL/Gw83bZHaty?=
 =?us-ascii?Q?rbW32j9ITeOH+izzMXgA+FWboNfuxOYBnWYR5YQgQ4I6J3HR0Asz7FCepypt?=
 =?us-ascii?Q?v1It15AGVglgWkKbDA0lWvx8bEyPQx8lAzFPMmW5SzmwPXhEmYeX/8ltIFBK?=
 =?us-ascii?Q?rPrTsYvcMO++Y64kjK8d0dLhDZKMjqnq9E1cdJ8mbRwimXbrvQRvabRCurzx?=
 =?us-ascii?Q?yLHlj9X+AO78nsEAgyedJ2Sklk4E/PMQZ8oplwzwXY/w3sFL+uarJU6hcUv3?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bHV8U/+fRORgq1CpecsHbhKPQQGr3ak5W768fwtBdb6K8meLZDOsy+X5kmvnr+oruBWaWTzAqk1nxx5cjgniaeMXrLl4ZSr/LpDm7bZsnmcGqj71VwFz3b1rZW8A4rW/l1afNbMVJgelASg5HL+2IUBFnPGJ0rvbYoFLanUikfqEG3ROtM5oh9vM50+thvGKOa9w+i7O8bwfIv47t2OOKtqEXpZSXpBJ6b643JaPqcXncKyoPYKLXSrj1JOJMh66cs4eX0KZrwpAKpOWELl9jSNan7eOfxJAEKaULU1QUiGz4aDxkeiRu1Y+0yqjqmNAUFD7NdDrYzL1sC2xq3GRF8Szd4e4C/3kyu+F4lMG9bgIKEJrvo5Z4QoarZdiADeDU8qwqg5+AVl6k8noTXDicuba7LIemCBr3ESrQGg3ZNcrHirhbSf/Em92tLXKvCpa7PaahPkT0dcr1HFfAdBShPxUl/2fEd1gmXRmwp5ORpmrhOhgs6RMsot8LBmzjUf3STvix5Z65j57s2o5b1V3fX1/FD6kb0jb0L4SsDeB5NKgLhBviccILllRBX/qq8GgUJ5mtRNjF1xevwPGim1bVV0aHH0i/zUlzuU3dWhF0Ng=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf25b01-e539-496b-786d-08dc6922ef7d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 14:36:34.8724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JPCbEAUU3Aoc0TKV9jmoiFpWFYJ2ZM40bXY2wdf7xUmO6tMcv5QFRvf1/4VgW5AUVZ8hUQ4lBW48VFjoUYssL1PXat1T3jouosCNnVmBirA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB6432
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_08,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=924 malwarescore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404300103
X-Proofpoint-GUID: Q4RDABxUI6PNYFh9gQ0RJhGZ2M4rCXdD
X-Proofpoint-ORIG-GUID: Q4RDABxUI6PNYFh9gQ0RJhGZ2M4rCXdD

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/strchr.S | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/bpf/strchr.S b/bpf/strchr.S
index 8365d9ce..42c6430f 100644
--- a/bpf/strchr.S
+++ b/bpf/strchr.S
@@ -26,8 +26,10 @@
  *
  *     // xor the char with every byte;  a match results in NULL byte
  *     r4 = roundup(r6, 8);
- *     for (r3 = 0; r3 < r4; r3 += 8)
- *         ((uint64_t *)dst)[r3] ^= c;
+ *     do {
+ *         r4 -= 8;
+ *         ((uint64_t *)dst)[r4] ^= c;
+ *     } while (r4 > 8);
  *
  *     // put a safeguard in place, then look for that NULL byte
  *     dst[r6] = '\0';
@@ -72,24 +74,24 @@ dt_strchr :
 	call	BPF_FUNC_probe_read_str	/* r6 = bpf_probe_read_str(dst, STRSZ, src) */
 	mov	%r6, %r0
 
-	jsle	%r6, 0, .Lerror
+	jsle	%r6, 1, .Lerror
 
 	sub	%r6, 1			/* r6-- */
 
 	mov	%r4, %r6		/* r4 = roundup(r6, 8) */
 	add	%r4, 7
-	and	%r4, -8
+	rsh	%r4, 3
+	lsh	%r4, 3
 
 	ldxdw	%r1, [%fp+-16]
-	mov	%r3, 0
-.Lloop:					/* for (r3 = 0; r3 < r4; r3 += 8) */
+.Lloop:					/* do { */
+	sub	%r4, 8			/*	r4 -= 8; */
 	ldxdw	%r5, [%fp+-24]
-	add	%r5, %r3
+	add	%r5, %r4
 	ldxdw	%r0, [%r5+0]
-	xor	%r0, %r1		/* 	((uint64_t *)dst)[r3] ^= c; */
+	xor	%r0, %r1		/* 	((uint64_t *)dst)[r4] ^= c; */
 	stxdw	[%r5+0], %r0
-	add	%r3, 8
-	jlt	%r3, %r4, .Lloop
+	jgt	%r4, 7, .Lloop		/* } while (r4 > 7); */
 
 	ldxdw	%r2, [%fp+-24]
 	add	%r2, %r6
-- 
2.42.0

