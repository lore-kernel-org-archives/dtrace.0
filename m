Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8A81C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466524; cv=fail; b=JZzQmqCEj5dWWdO0KmIZQsrJbiE7MbpWEsZPP2UfR87lNF98azjKr9UQFJjZlcqV9NzsiXbXdcTAhyQUysIA7EA22FXmWnKIR3rxjYYqf2MUB9kC5hIc8mam9gYbz8nhdygzJci5JioKc5UfT23zCYfQ3evSsGk9FMVb+F4jTcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466524; c=relaxed/simple;
	bh=JwSJ5nFajAnI42AUvyUCCCPE2sC4+wcsKb5UQSM/u/o=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rgt6AqACYKva3tq3cSavZ0MHnbRp4mZyv1k9jpbf9DTvZJmVBYvxsHACn6rlRYELjkuHUc9ceW9Z40aljmIjA9EvKjmk6mN7UjlZhgE+smbwFEjnfTpsTdgBSzI0jRO5T/66L2kcOLEJGmos+FUgX38GK2XAWpujEd6CGSTI4ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hu2wA5gk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=X8qkE0ec; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hu2wA5gk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="X8qkE0ec"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTb2007276
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=rc+EAd7jFP8phb
	hf4REMQiKjUwDqdB30dgim4gfUMjQ=; b=Hu2wA5gkZUOrVGXC1ob8RCGRC3bAsz
	BOj8hLInW07Nnt7bDY7i2chBfDSSz6lCDW/COmq5K6EFV2bNkqOwPlJQcF5A8veE
	q5895ab54Yil3mDs2iXEVzI4zBfB+xLKMii1p2I8301/BPjhAppyTffo+vciIFzN
	Q3nyDQirXUIvERyv1o6Vv2TxlckFek+WXUcSaTbA84Sg6q5XnAgrkqEiT7lCH0pr
	dr7cYKfY/gZIqtj4W78wsxnHwKBOZntZggVUgICgrkkLrs3DS8zT6vrAAbLCCi66
	sgEbOtegYEHR0d48SR/cFpTY+GXcE9INmwwAX5bzAoIEVmemKNi9F2wA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7smx5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R3feF1001307
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2amx09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edzZ+K1Zs6MCm7THZXN6orisoTtvWyLBR2ezZbeUQe0DjJIG7NS7UwRGs4CZCFyfRUsJou5D/Zez3HpEANdjA2ufNfQFJnO+srOtL2FP217lBAuPxINvnZCyzob/SyJUeYwvlurGvPH29IYZ8hj4VouupV4KFknaW1L+0dXbEcZJtWn6yUr02+vi4pK08h1ktqd/pO4yi5TU7N7XRQvTccG2637W9Jilm6ZumqUCeGHEXUXyLc4oD4hoAuohCQOJAfZHuGMF3Ks8eLbqIT2g0h0qX2lMK78qDi3tXXd8CEDBcxbE3/02wEN60sX8DRKP5/gzo0lGraFsAqrDKPLuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rc+EAd7jFP8phbhf4REMQiKjUwDqdB30dgim4gfUMjQ=;
 b=M0oVLe96Tardcsu2Y0Zj5S1Npe0K0xv3NeVmx1tfWScEUU05I4NkYGn8hxbF8PaQ+q1qIgh2QCoxd0rba/OYe0/+l8PWKIS0ccfVcAUUAiEbozc43dyBfOio8tBoAra10i5ahLYmzeTLD3n7Ha+/H50vVc61Z9LF6Eu7xs8/wFIzaFImfMFBDijcRhJxTrsS6MqJaM7rV4SI6dNujDRf35d4in0cMy2u0NJNd368kUnDWOi7AjAnHF6OPM4GIXJxdl383NhQD/mHSYgawRCaTmNDYaz/p2RF9CNds7nHgJzU/zvqXMPWy4UMyeoAsc80iRbM3+gx3ps60FzAyGrbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rc+EAd7jFP8phbhf4REMQiKjUwDqdB30dgim4gfUMjQ=;
 b=X8qkE0ec+GKPha8PsIRl2sG6fCo7Kzy27A33iuKfvo5hHB4AXRjh/XKfh8/9sSKSSCiHnbJVyVapPOTbvqczEtNQWoSyY+q9THtyNyeRirhSRe9zH27mA5gmVkgQ2MAQNUHzM2/9NvfpQLbWt9crQrychbli4KYYDi+Mwu+elxM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/38] Get rid of unneeded enabling_defines.h
Date: Thu, 27 Jun 2024 01:34:22 -0400
Message-Id: <20240627053455.21567-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:40::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: d71f5dd1-720a-49b9-ead6-08dc966aecae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0sH8vuGOW+x3sx+yM9juZ7C0T9czT3HvcOhMNnDquWRdvraIzT3N8OFYxkcd?=
 =?us-ascii?Q?jmtl5JFNFFMtli336c7JijXvdsnm+5kb4Hhr7Mulgq9NjMwZHPyyHQzvzmEe?=
 =?us-ascii?Q?UurpGDLy+Qr5dRn0HTBD+BUNaKVjIYK9eOQBMICr9z9uiGGh3KuayTwUrDkc?=
 =?us-ascii?Q?ZZaiEIImngn1dwIISylkGqUog6GKziHPVxHYeQZORMdj2NpuUoky43x1UNcs?=
 =?us-ascii?Q?wWBK7HYhyirS2ZQk2KxrGUQjwCvz2ZzQrA0wKFOoqq+ejwFikMUx0ZD4GlNj?=
 =?us-ascii?Q?Fr3yRl9U1oTjjSyAtWm8W4nqDDwTN6MfOI7CvREKf+QrvLx3uksa9heRP7z7?=
 =?us-ascii?Q?49raIezFEW4bDi8BgBP+y+qwAUp+4kNizrbptZxvXsGTX52bUmGbyd/CiGhZ?=
 =?us-ascii?Q?rT77Smvv47YRMd1gujVOKbEWbUDdMQTxeUUj31L9DXDCNM/73+Ddz4agekSE?=
 =?us-ascii?Q?9u1/9EC9XwQYpnqyMkQiSKHGWJgRy1UUlSm4+1F8Bv8Qcr1o456+e7guIVp+?=
 =?us-ascii?Q?AU3xCSeG9/wudEhq3KKDCbJqYWiAwgvWOQ6vXlek3qApDJTDxvBWDtvMkaxm?=
 =?us-ascii?Q?sC31zAjHqO3FZzM7lrmOILJ6thrWEJUVFeyVg0UiOZ9i9Tfifopt46BB98Jq?=
 =?us-ascii?Q?UO3neVRmQ02BhGvMSg+wCJjZ7lE/qSCckLRIaI4H9/ImJvFWIJl855Arv6mu?=
 =?us-ascii?Q?8ZEP/2Sda1RlKhogNXYy8H4RUa4PmVtGlPTK+08k0cNIH5fLcmJKIG4fcZiQ?=
 =?us-ascii?Q?YyJH2jEoigplzrmwrih12GdtA1Q6F9kz71ju+h8l1Om4p/Nb3brvu57PQWl6?=
 =?us-ascii?Q?+jaMZ3litaHgoDPXhPNi/euiAcSr/ztOyFlEPniwUpOjY5Hi7r7OZHs87X6w?=
 =?us-ascii?Q?jGcM0KGWYIJOqbrddOOSZh9izisEMNY73C393PiL4mtwDhGDz/ayGfH2bm//?=
 =?us-ascii?Q?6/KqYTVHmwdHFwoZU2vjKrcuccjjDJPuSx8SVmhstx75hpS+qIuba3JCvUv/?=
 =?us-ascii?Q?PRNi7WZMLQG1z5VIr6Jd3M4P+bqxm1UCfrSIiLtXbMN7Zwu37R5O4TSof1df?=
 =?us-ascii?Q?ZSS2hKcv+P3zl1AN32K8nLPg3LQUNGq38+NkOP3lw9X/tAdhuGVOuzFdt11U?=
 =?us-ascii?Q?21ha/s2W2clMNkYkbZOxagTA7OsF2/9k9YxMQedsuHUkrf44d5QMKFvGnmvV?=
 =?us-ascii?Q?lr9nKtKBgcQdWClet5EijHfITM0rKW6vvNa3muI8mmWAGDIIRF3IL1MF+ske?=
 =?us-ascii?Q?mvU4mHdeQElIfDBDDRcDWTJADeB+AB0/7ptyF7JSdLFz/Ru6y6LdkQ/dUBIV?=
 =?us-ascii?Q?Ekyu7bxMTPq/N3URwdoECXIE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aafH3l1fUIdgyLBULX2T/8w7bwiDEBQqrBiT8ORES/djMNtEgoKorGrC7DhB?=
 =?us-ascii?Q?hbVUu1t6iGvhA9ExG5/YseZSUkdiYwzMkv5yG6SnhPd90+rkHQeIMZ3qJ+i5?=
 =?us-ascii?Q?B9jh9cyXtYdlidRpYLjUsJu79P2p+EF1MbsjcmKY5sy7fd+2cOOQrMuTkMQ3?=
 =?us-ascii?Q?jDA0Ksdzq24fcB/QmYOPC8a0GPQHAQ73B18HApjlmdIzjs8NFJRPsWxqUZYt?=
 =?us-ascii?Q?3DXofRnIVtnqPvDwI8oZyWsJEgUS/aqtmjanwd8J/SNxv+FL+sU15pbEL6RJ?=
 =?us-ascii?Q?VmAGxKm8sF+3+Y2en437swhRGY08TYTbB5WMamZGnJWuu9LHbte4f2s68JUO?=
 =?us-ascii?Q?OmQ8LYJ+aZKKV92qOJr2ESqpatO7w7F+yGLvFEURB9XwUJxmsyM+0zjvdg/N?=
 =?us-ascii?Q?7g4V73TfM68jSYCQ8MteW8BEd1sg37YlJPTmxAeguGeeXsLX5ajKtn7bKwM5?=
 =?us-ascii?Q?Uu2xw70beV11/uDRqrh4StX6ZK3NNK4zfEu0SwNYvdgwUMTqwiYQiZdmCPHP?=
 =?us-ascii?Q?tIidb9W0ecCzm8WW83B2DUHhGx5j7wP24RzsQI+ius/8gaBxDggl0X1Gqtt2?=
 =?us-ascii?Q?zIIwDDj6EQHvrYjLFvSsxcaQw7M9VpO53uLKZj+dsgmhQ6D5QbQ/knzUDN/S?=
 =?us-ascii?Q?UinrqcIFR78VHJqyWDfJNQ0mo0TvXK1gkXxPjZQ2qCdgwD6tES57swWaj+qz?=
 =?us-ascii?Q?qmdhXAJIZPYHecdecM00dP9gYR7hSKW5TazATU7aQ64vRLvRjoRknUbgGaAx?=
 =?us-ascii?Q?iyxSU5aYvJdRQOn/j0Nzxq9d3WuSMpXcFzuDa0H94NKCYJYEP70S7ljOzp6R?=
 =?us-ascii?Q?Ce5Rj58+tW/iTaCK3lxswaNezJknN5nO0rvtHnOCZzqy9M6UZclACrE/v+BI?=
 =?us-ascii?Q?xT/OYpLRLMzUOWlZSBQ+9arRdtS2l4uuc87QBv1XwnqSzSkS5y4u4LJdFKHT?=
 =?us-ascii?Q?eqQF/xGQH+BonapR76Del0D9m22l3/26Volk8xMwoiyu8fY9TfqrEADd+pih?=
 =?us-ascii?Q?hAqU3y15IVotL3eHx4wbwZGhROAGOY/Lxidf8bOrZHQt4aeBepyaeWUrlNsQ?=
 =?us-ascii?Q?UEw/ALCpPhcb8AyMkvfU4670tSDPgtqiw/t+zZQlsJ9eDk0QEkIX/PriC+4d?=
 =?us-ascii?Q?nKyQ6q+X864O+szSlB5dGU8yH2eojacY/BzwN3Jt823wl0QVdEq997kceJGn?=
 =?us-ascii?Q?dQRXqVy8FP5gGLn1gl+NVX2U+M2u2xBK6qjxpgFZR50vHmHleHu/SJ9MIyYb?=
 =?us-ascii?Q?RSSzoeKqCm23z7X0pPDhfiG+xi74qFpjzM/OZIqtU4fB6XvHCab8goI68K/+?=
 =?us-ascii?Q?yTnVdYSnz8gPJSCFYcfUfBpvQknAV/gdTg7TOHCr19yQ6tGg6bjwY2WGST2F?=
 =?us-ascii?Q?8C93ufEVEOdAt0H779HhkuAkdkM+sFBO9MfvkI023VF3rilFLY/l0WrdvURr?=
 =?us-ascii?Q?uGOqkzmQr7Q52hVTbVHW3yVMLyz/Ey/wYvJLalBkrqTIUvBzWvw+0Dt0VQfZ?=
 =?us-ascii?Q?ZbmMjOf+wRDoGBc+C6xPyKDIACKxxEaLLTij2GHS4YVt9eLkt+vqPV3L7UJ4?=
 =?us-ascii?Q?wM/xi9z4BH+cVdXiM35qbAjv0qBRCn3gn6Swzu2e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vbbAU+wcpoW7KgQ8MdlKDAZxf+PNfKGBzJWtdGX7Y9jpZr1Uq0m4XVbZt20rrRR8Z+xkC1Jue8jLGskOoZpm3FV0Ak6+zd3zwCJXutdYTaJAQE63bnNjH7Vgq4FBlq1OmVMWEAMM1zHGBGpQUk6D7eoMR6tD8pnDEBPbNdBpSgGnW/INI0ku8sAe9Rx/LubDF/x8j/HsDNqhx50iVDIX1SJXOCwUqse7lgOI4Su9aDU/h9G45wWvZC8Jifh13j2V5m9z/jeRjkpOY4MevEL/CDFLAW35etVIGy9lisDVSTSM9ZcPCFXZ1gA7BwKFkVxcA6OAuoVHl/XPaowTAby5JVdtS6j9BWkeixSHr06qh3g6WfL1RypmM2S7L7K07qFGzDDhSTiKJf/uP+PZVXBlWDnXS33BnueunsCgx3fc9IjEJ9BZckm2jQtqaRr3jWV4LD4AHXh9r15Gi3N8yUniaLBdekamYakXHLsN4upuSwLuHwD+A2r6P9oqngyy4+PyZ7gxx5zO1zt8bGQtvKiNqwdiWBonTKF9TJKJ+Y5a/VJC2nTEhkDNx8TbvwgU1m+6dCFDniKbTpO1iusuTy3uJiNubMlCJEVcBaAp4eZLfoU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71f5dd1-720a-49b9-ead6-08dc966aecae
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:16.2246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09I1JUjQU90de6+RCvDeRFDAdsHuvxVIrUFCYGp8j1zQf+ciUuDfS3w9fNKJ/JzILkaF3opS2NrpAWx/UiOyxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270040
X-Proofpoint-GUID: lcJwVBnG25yCAWKcEfyTdAFpjpcPNrD3
X-Proofpoint-ORIG-GUID: lcJwVBnG25yCAWKcEfyTdAFpjpcPNrD3

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/enabling.h         |  3 +--
 include/dtrace/enabling_defines.h | 23 -----------------------
 2 files changed, 1 insertion(+), 25 deletions(-)
 delete mode 100644 include/dtrace/enabling_defines.h

diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
index 41e50cda..d36a73df 100644
--- a/include/dtrace/enabling.h
+++ b/include/dtrace/enabling.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2019, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
  */
 
 /*
@@ -15,7 +15,6 @@
 
 #include <dtrace/universal.h>
 #include <dtrace/difo_defines.h>
-#include <dtrace/enabling_defines.h>
 
 /*
  * FIXME: Needs to be rewritten.
diff --git a/include/dtrace/enabling_defines.h b/include/dtrace/enabling_defines.h
deleted file mode 100644
index 875b49d0..00000000
--- a/include/dtrace/enabling_defines.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/*
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- *
- * Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
- */
-
-/*
- * Note: The contents of this file are private to the implementation of the
- * DTrace subsystem and are subject to change at any time without notice.
- */
-
-#ifndef _DTRACE_ENABLING_DEFINES_H
-#define _DTRACE_ENABLING_DEFINES_H
-
-#include <dtrace/universal.h>
-
-struct dtrace_probedesc;
-struct dtrace_repldesc;
-struct dtrace_actdesc;
-struct dtrace_ecbdesc;
-
-#endif /* _DTRACE_ENABLING_DEFINES_H */
-- 
2.18.4

