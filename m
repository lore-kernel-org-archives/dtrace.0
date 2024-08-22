Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F631CB33A
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724347762; cv=fail; b=Oojeg4znv/kvnYBAfzELExO+L3w8KNe1v0QdnxECWJWumQ6BGbAegSZ6aRlUTCJaXjQiI+CFGyKyamPxWrnM2+BFuRl/ByMEQ0UEGaEoDqWckLiJcViZMlBfDh9YMxgOIL5StW/thGrzLRHs2JFbM/jrdMaEBESwnBNPruJ01Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724347762; c=relaxed/simple;
	bh=JCgKo3Dz0gQD0TaiGfTETPFif1XGX8F2+JMdPY9nsm8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UpzXfQoNjhafjwufqeFRiz2n7pA9c73FMqNArqa4x8EAHyL0s7fOOtAOlT/Zd60C65COkqjYPnZkhbx1Fb713jePeR0NsTqj2VbiA9Je2FCYjC+KYNXcLrdAJcVUygLJFQhhtGX2bKcJO5GJhn+WtPJ/WQQNqEngTWWr3VcZJkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JiGE+iQk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ArvAEFzI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JiGE+iQk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ArvAEFzI"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MEQVAd002395
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 17:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=kHBJ6hJMZRX9ySBcw3dCby8t7Tl2CX/Jnu1DGObI6nw=; b=
	JiGE+iQkl+QyaXN8uUb5kp5vWkTpjnRl0DjjK/gyrSFTdHm7z0E38vOKz3+y5VTR
	3aXZqLb1U5LCq+KOzgG7SdxSMqnmh44zY4dQBr3HV4HgvuhMi1+sCkHhoImv8r2y
	seHRCSDp5i/8FEpwRYSzZCLJ2e/98IRHX3fyOIQg39Q6Yr4Re/jV7/KNOXIcS9Kz
	7u52U9uCP2YaH4Ea7kHu05k2b2eUY2ge9oW8eUpxDX9PQAZBh82rA+/E9/SkhzuR
	WimANsthLnb7Lhy3lcOH4l1tbzG67xRjqgaSW6hS961rJQYLmbXVajJTFDVPq+uT
	kegXuBwZq1WVcoZc29pJ0Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6gjnbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 17:29:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47MGxbku033586
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 17:29:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4169bbh57b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 17:29:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqiSnx98NnAo4si/L6Ivp/EbWvji/tLX3ept4zmyQrIBu/AeaSaOTZkOcMdeeDYE8QjwpwMUxhlqNPJK3mhPSpQBOhwopCbG3XZXvi8A3JBBNECe8fnjxHN8F4N5tJnjFFSpeD3Smu2JW7n/roN6vxOT4VW77nKdMFUhwf/Ko5RLFg9Lk1XIZIVx0FMCnRuGnGZ/0Nctdj7AoWRZ/yWA1T/C93aRkEQRTXdc9umUdBWf6eDN+ryxcMgCZLtrC7ZBg+DSmb3DW2aq1xVtvsIazoH2N66RmYr5W3fc6owvNWV0e1ii9b2dq/x/p2wG9Mah+wS1+G7iVEu0gAhg6dPKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHBJ6hJMZRX9ySBcw3dCby8t7Tl2CX/Jnu1DGObI6nw=;
 b=SxP9IehwKAzvBcarm/qHYXD6FS+VKVf2BqvS3dALHltgfmRDvp3kCMUQlFdsLpE5fo9URTC1P1pZuj5f9Vf1MEisrQWLnpaQqZHfyiPdu/fSAwlGa+SXpZSDDsj/XadTxSAOhvQM2eZ9E0eXHR1DUnVZy3GITEMssrpvfKZDDTNrv1NlG+q7Md9vBIC8szUeIst2Kllbp2yTfxJegpceTcfFyw+A2pmMddsmkfKws6ch2AN9hyWisr8lhFjVLt0TFhVSXvbBECx5207Hp9QA9Bshl+dEVHvKpm409M4lXHjOHvk6QsRv3bGt2Tx8f+RTqMTrn50n9eHMVF2Z+y4eNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHBJ6hJMZRX9ySBcw3dCby8t7Tl2CX/Jnu1DGObI6nw=;
 b=ArvAEFzIIGujeAFM4/OjQUmVBhpEN2D3BEKADDF9su6KPgbWezmgx4CG/VopUD9vEwg8s8XdGnSQQwnU+0e7iskgcOg7d/KmgyrMbq7NrH10k+tIgA+yyEalk+doZTy2buQ4HerMBgqFthdIpvfkojEVNvTbNFEPFUDR7w492CA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4455.namprd10.prod.outlook.com (2603:10b6:510:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Thu, 22 Aug
 2024 17:28:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 17:28:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] Action clear() should clear only one aggregation
Date: Thu, 22 Aug 2024 13:28:36 -0400
Message-Id: <20240822172836.8444-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4455:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d9c2be-671a-4c51-8ae3-08dcc2cfdc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v8DKNOK/bYmSlOLAtk5WOd0cKo5MnI0ikdFB7fsGSXjQvqWXmKHn4NCw7AvZ?=
 =?us-ascii?Q?2yyQHZFhqcFLpk9X66djGsNf2EC0VrUb1VAtZ5raq7cOc3CJrRgDgMMwX3b/?=
 =?us-ascii?Q?BVgNqczWAbMbjf7gGkRFbfWC3iM/M3Uyjcwmng8lAW2B/memXdYvg5Zb8jr6?=
 =?us-ascii?Q?fIlmcGgZyQYgiKm0cEQ3xlHHkZ9aYwwXTkCprmPXXbeZne877XU5FTagpP+R?=
 =?us-ascii?Q?Z9sztrCvROfyyxkn4ItxNr1MwNfAcihJaeMMGyKl2exz7HHQfRK9bxcXSQ24?=
 =?us-ascii?Q?GfHaDYBHBdkEQnJI8RjwprPUxsZgZqOz5vjWIBkS2b0Q+LOPLWnnHUc0w+1u?=
 =?us-ascii?Q?RrEjO6ku3LMdIbCMIMdEybaM8nlG0EZIB+HJ9gfRQ2nax4goeyt6iHyC9tg6?=
 =?us-ascii?Q?6O0CfoJ6Hcw6n4TP+GXQtXBlydq5FT6IFIoqRYvcI3t2YDQ69FYhUq6S8MRT?=
 =?us-ascii?Q?BlhKR/tsMDk6ac+6SeOGgbt53C3O59brIUE+jzKuWEr93fbxkUeXAPF7iIXE?=
 =?us-ascii?Q?mqorUiZF/Hae/5NsU9lLwifq4vilYP/EVQscoEsV6qNTTTZfWuw+/p1VVtuP?=
 =?us-ascii?Q?OdBO7mo/SSEARj8VBVuIzFwx76n3Zt+NgLdPV/bsYHL0CyxTF5I0nnXRTB9d?=
 =?us-ascii?Q?z4mI54iHl5Q7dfQ3UreUDjQcNr9GR8nq3YB+7mRKAcuIhCC8oiypbDeVUJ2u?=
 =?us-ascii?Q?i1TfDJDGKvZPGIKEoTsH860lTi09FIALM5Md/9QQHuIzWmSFTT88OerbNemx?=
 =?us-ascii?Q?eqQmMrO55b2MZ7F+y4dR8I8vQTWmWa9JQ1fy5P+qOpn+6JJ7JsCHiurSQNU4?=
 =?us-ascii?Q?yEhpqbl6m4nrQmxgRgE6LSrKhwIPnFFOIiroDikDkSZYGx0KZdRwYmcpt+Vs?=
 =?us-ascii?Q?GgCfDe9lrMWu9kasqKfb/4w8WjHS0CKx6OTOrNVzutE8VxvIw36nYNj5QHUB?=
 =?us-ascii?Q?5FSRSmhDsGRbEK4Dy4MeXRh3OQbJ9qkVCL/58XDchOz1AFqzxr9KpzImO7mB?=
 =?us-ascii?Q?wr1e5PsJ/gtnNG2bNN62UqReSqL9Bn+g4z7ZLNN2Fw2UuBVLFhEwnoAAQIrd?=
 =?us-ascii?Q?B2mEof/Jl3Hem0hEbWstDwbovnvaDHkDMiq4FjyYTCOjtsZ7TfXdw5CPe3Z6?=
 =?us-ascii?Q?Jpu/eQ6oDU+oxNTyeGs5oWm8g/xVhW2Sg0+TY9KHAM2sEDX/9gKSkCsmnf4Q?=
 =?us-ascii?Q?da3XalvuaSENTaRRzJ2eEAd8OYA9JEaVCwBGh7fZKjo+onNlwOFkeD4D5b9U?=
 =?us-ascii?Q?nUsGAJvwLSs/QqlyRxHeUP1JmCx477WXMWv/EIFwrmFjf5y8+kc/X+Xj/LOH?=
 =?us-ascii?Q?6Os=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m1a67M2WB7hjik9AzxvbNWwho+6jOGWHzsdlplJftrXV3CrwdPzfICnK3fZX?=
 =?us-ascii?Q?8bEA+E5wud8tvPyYP13Sq+njF8UsyJbw8okWvhL6XjXVKKG+waepHCqz/v5A?=
 =?us-ascii?Q?+Jb53pI9Q4yoJuOhy7zcaM1YlEMngdP4W23qn+dvoOUovRQA1GrpXNCwbWGP?=
 =?us-ascii?Q?GZLtbOrkviPkALfKxbk3coPt0IQSk5HWIJUpsHuBp0i0eF1eCEFRzw8DgYpr?=
 =?us-ascii?Q?VSQR6nYHnibkW+c97KxnwP2PcH5T1rNMGQVjurkrWCNQk0pzseootWI1JTAO?=
 =?us-ascii?Q?mB+EjvKYjXWxGPq/XPQq7aAytngFaeL0DnoeVjutctqmnvcpgvrWXVh+tdFG?=
 =?us-ascii?Q?KNkuQhpmTqAaLlmVLN9uds2ya0CwZueJxlRIjCbb9dKRn235mtlvuOFoA0oh?=
 =?us-ascii?Q?8HW6IqAr0QCuMkHV/04kM9zUrs8MKzICggEYgLIfahwdKz1zsgNilrqBBwut?=
 =?us-ascii?Q?+b9ri/PZBNSGm6LAJTOgeThjdYgSaw22vj2Vdod9WAYVNpKTp4/lczoc08Pe?=
 =?us-ascii?Q?+1V+1bGMYR/PFQ0BbNBOgmMul7C+UVIqdXMIaVR7M+v2lVWns4YctuhwfolL?=
 =?us-ascii?Q?oDblgL/KLlm+NWMLqTmkaWP5s2Mr9vMxRhV+AYYy8KcJHwoZMAuVk5WYO7iX?=
 =?us-ascii?Q?QeIjVn9CNIPo/hnTBBFuw0kM1/xMnkUVl+Thvoui2fgMCOm2pdhuP+GAB77t?=
 =?us-ascii?Q?YGtuC4/EV4TwTFxGaL/g17cStc8D3/Wmf22o+10fr6nkv9vxSFrbszMFNr7f?=
 =?us-ascii?Q?L1YUXF8RBEU3MKmDYz1pkDOBCqahWPIsI6O98rK9sz9bb8DyubQU67jLj4eM?=
 =?us-ascii?Q?G0P4r2mn4AlsADyQehvJ0/ujXQV/etvZan5zJzyekDdRS69FRTQ17re1E52x?=
 =?us-ascii?Q?M8kpXwsaF176JfOlScefOxqZNs3BHFwNZuMNWyyPMYrFGdD5ZDRPa6ZbGQeh?=
 =?us-ascii?Q?BaeD73DfFPS+2VRtq8L+zkxl07iooSsGC0iRSFoINX5SLl2x2uQGvqnZThBD?=
 =?us-ascii?Q?MDf0fb6dTelOEeQWWAnxh0fJjM4VHMl9j9oGZ5Arsd0g/VFGA5duqR70sOaf?=
 =?us-ascii?Q?eKGujXQ9ArA8SHhkNZreF5RYtpcZc4WgIUYPKN1WWJ5Z0QfqQPAtLwv1UTfz?=
 =?us-ascii?Q?rdvn+EifLhfB1YhBL2JAxgRfU89vmz2JY2ueyBaJ2q7Nr3LXBoGZM5YlRubD?=
 =?us-ascii?Q?fL1m1pDGEk4jhOVYrq+Ly5Cq2EppXc3wS7VqNmPSc+TpcJi6erSee65QVh0C?=
 =?us-ascii?Q?W9ku9+zYAjPHql6vjjoVNmmr9YgoM82qvcvI56Ademv1o3VUvcw1qKURQS5R?=
 =?us-ascii?Q?CwOYBkpJ0iZYsCWO8lG+XcJczM13G7uv7CVRfMyutDYu5huiRYEBWg+KmHe8?=
 =?us-ascii?Q?HXSsPwn+xZkNUdFK0f9W8RVN17cb8WfNrXtdE+89tP3C9foT3ZHuJCto0nCl?=
 =?us-ascii?Q?A21HkKqSccICjJ1zKMF8mrphpvFEoZh1RDrMYDrA/J7tBPMccGaJY8+JdLBx?=
 =?us-ascii?Q?Ja/jMkxhWE1YaULpia3nHVipEcw9ZTShq8IBlyZmwAGN9EnwUhkRmz663zz+?=
 =?us-ascii?Q?I6dwSYKJyF+URERrU6UeLSVsW3vG8udSxxM7Jumr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wH3b/4S10dPB576UhYFbEqePSsC1gArEegDBgq+4Ja5V/F49Phh7EKsVexJWoKac0Q0i2HiX5YjwRxhTIGCjxt3XksMMpcNX3/nJ1Wa80BJ4a4t5PNy5lYbn86MTHfQelKP0hfTU/xZPXb1ue9M6DlCUHwtoyDlVfexvvQ71iz5pepEoIhmppPB6q4lBgvnzczVWiSb9oO0rjswIIUDzvAqniug/o3mp7MMspoq7DRXNtgFvutKWQanwpd2C4+zasMr2KVQT3lhV9IZV/+OyEFwEtkTYSbQxTs9S25VCzZMxxNLnpNBvc9JTws5upXBIQAbrk+l686HRc90KAwLbhM/FlmGE0GUxeXGjQz8r6+/TPW7c+njfxjhQ3QGOKvIFObGaca5ub9Lbk6IQ/L1+J6zdB6v0U+Q+94asfffeKl/RL2427shbLrfmil0iXyjjKf0Rtkjw0fFZATBigAcD+e1vBl+LmzYfEFq4hrcsbz517nu4xYZGrZD3+xCWhPHjA83m+jcXhxS4AzEI6+Sy3SsIZDHs2jNHdh+U63M4YjaPwXYuSu/w5zFnB8Zzivvkb2oaLE1PI2qxmR+TDYJuGAmohhg4nccS8tXwFTfWktM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d9c2be-671a-4c51-8ae3-08dcc2cfdc3f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 17:28:39.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RN0eiupnputXLXLZ8IiifWI1zmrtyJAqXy1lWrLTK2dovQWtzQY1sFEdXxIViahhAH96QCcnKNmuutHOxJA5AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4455
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_11,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408220131
X-Proofpoint-ORIG-GUID: TkjjF2J4tW7NEd5vdwhu9wZiqrx93lF-
X-Proofpoint-GUID: TkjjF2J4tW7NEd5vdwhu9wZiqrx93lF-

From: Eugene Loh <eugene.loh@oracle.com>

In dt_clear(), we:

*)  extract an aggregation ID (dtrace_aggid_t)

*)  increment the gen counter for this aggregation ID

*)  clear the consumer copy of the aggregation, using:

      /* Also clear our own copy of the data, in case it gets printed. */
      dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);

However, this clears all the aggregations.  While the next snapshot of
the aggregations will refresh our copies of the aggregations -- after all,
dtrace_aggregate_snap() itself starts with a call to dtrace_aggregate_clear()
-- if we print aggregations before the next snapshot, we would display an
erroneously cleared aggregation.

Therefore, change dt_clear() to clear only those aggregations that
correspond to the specified aggregation ID.

In order that only a specific aggregation ID can be cleared, we
modify the last argument to dt_aggregate_clear_one() to be not
simply the dtp, but a pointer to a struct that has both the dtp
and the aggregation ID.  The previous "clear all" behavior can be
specified with an aggregation ID of DTRACE_AGGVARIDNONE.

Though trunc() appears not to be similarly afflicted, add a test for
it too.

Orabug: 36900180
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c           | 16 ++++++++++++---
 libdtrace/dt_aggregate.h           |  5 +++++
 libdtrace/dt_consume.c             |  4 +++-
 test/unittest/aggs/tst.clear-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.clear-one.r | 13 ++++++++++++
 test/unittest/aggs/tst.trunc-one.d | 33 ++++++++++++++++++++++++++++++
 test/unittest/aggs/tst.trunc-one.r | 10 +++++++++
 7 files changed, 110 insertions(+), 4 deletions(-)
 create mode 100644 test/unittest/aggs/tst.clear-one.d
 create mode 100644 test/unittest/aggs/tst.clear-one.r
 create mode 100644 test/unittest/aggs/tst.trunc-one.d
 create mode 100644 test/unittest/aggs/tst.trunc-one.r

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 76f1d8ad..e3380b13 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -504,7 +504,9 @@ dt_aggregate_clear_one_percpu(const dtrace_aggdata_t *agd,
 int
 dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
 {
-	dtrace_hdl_t		*dtp = arg;
+	dt_clear_arg_t		*dca = arg;
+	dtrace_hdl_t		*dtp = dca->dtp;
+	dtrace_aggid_t		aid = dca->aid;
 	dtrace_aggdesc_t	*agg = agd->dtada_desc;
 	dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
 	int64_t			*vals = (int64_t *)
@@ -512,6 +514,9 @@ dt_aggregate_clear_one(const dtrace_aggdata_t *agd, void *arg)
 	uint64_t		agen;
 	int			max_cpus = dtp->dt_conf.max_cpuid + 1;
 
+	if (aid != DTRACE_AGGVARIDNONE && aid != agg->dtagd_varid)
+		return DTRACE_AGGWALK_NEXT;
+
 	/*
 	 * We can pass the entire key because we know that the first uint32_t
 	 * in the key is the aggregation ID we need.
@@ -609,7 +614,9 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 		 */
 		hgen = *(int64_t *)agd->dtada_data;
 		if (dgen > hgen) {
-			dt_aggregate_clear_one(agd, dtp);
+			dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
+
+			dt_aggregate_clear_one(agd, &arg);
 			hgen = *(int64_t *)agd->dtada_data;
 		}
 
@@ -1859,10 +1866,13 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
 	return 0;
 }
 
+/* FIXME: dtrace_aggregate_clear() is called from only one site.  Should we inline it? */
 void
 dtrace_aggregate_clear(dtrace_hdl_t *dtp)
 {
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	dt_clear_arg_t arg = { dtp, DTRACE_AGGVARIDNONE };
+
+	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
 }
 
 void
diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
index 4f8d09bf..0dc126e9 100644
--- a/libdtrace/dt_aggregate.h
+++ b/libdtrace/dt_aggregate.h
@@ -12,6 +12,11 @@
 extern "C" {
 #endif
 
+typedef struct dt_clear_arg {
+	dtrace_hdl_t	*dtp;
+	dtrace_aggid_t	aid;
+} dt_clear_arg_t;
+
 typedef struct dt_aggregate dt_aggregate_t;
 
 #define DT_AGGDATA_COUNTER	0
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 9e536b19..88083b19 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -1536,6 +1536,7 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
 	dtrace_aggid_t	aid;
 	uint64_t	gen;
 	caddr_t		addr;
+	dt_clear_arg_t	arg = { dtp, 0 };
 
 	/* We have just one record: the aggregation ID. */
 	addr = base + rec->dtrd_offset;
@@ -1552,7 +1553,8 @@ dt_clear(dtrace_hdl_t *dtp, caddr_t base, dtrace_recdesc_t *rec)
 		return -1;
 
 	/* Also clear our own copy of the data, in case it gets printed. */
-	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, dtp);
+	arg.aid = aid;
+	dtrace_aggregate_walk(dtp, dt_aggregate_clear_one, &arg);
 
 	return 0;
 }
diff --git a/test/unittest/aggs/tst.clear-one.d b/test/unittest/aggs/tst.clear-one.d
new file mode 100644
index 00000000..f96c2db0
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Clearing one aggregation clears only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	clear(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.clear-one.r b/test/unittest/aggs/tst.clear-one.r
new file mode 100644
index 00000000..101d173f
--- /dev/null
+++ b/test/unittest/aggs/tst.clear-one.r
@@ -0,0 +1,13 @@
+
+        3                3
+        2               20
+        1              100
+
+        4                0
+        5                0
+        6                0
+
+        9                9
+        8               80
+        7              700
+
diff --git a/test/unittest/aggs/tst.trunc-one.d b/test/unittest/aggs/tst.trunc-one.d
new file mode 100644
index 00000000..0556bb34
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.d
@@ -0,0 +1,33 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Truncating one aggregation truncates only that one.
+ *
+ * SECTION: Aggregations/Clearing aggregations
+ */
+/* @@nosort */
+
+#pragma D option quiet
+
+BEGIN
+{
+	@a[1] = sum(100);
+	@a[2] = sum( 20);
+	@a[3] = sum(  3);
+	@b[4] = sum(400);
+	@b[5] = sum( 50);
+	@b[6] = sum(  6);
+	@c[7] = sum(700);
+	@c[8] = sum( 80);
+	@c[9] = sum(  9);
+	trunc(@b);
+	printa(@a);
+	printa(@b);
+	printa(@c);
+	exit(0);
+}
diff --git a/test/unittest/aggs/tst.trunc-one.r b/test/unittest/aggs/tst.trunc-one.r
new file mode 100644
index 00000000..a611026d
--- /dev/null
+++ b/test/unittest/aggs/tst.trunc-one.r
@@ -0,0 +1,10 @@
+
+        3                3
+        2               20
+        1              100
+
+
+        9                9
+        8               80
+        7              700
+
-- 
2.43.5

