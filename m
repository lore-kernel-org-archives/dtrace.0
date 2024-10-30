Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E81E882A
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290375; cv=fail; b=dUKyWx6LGVO6MdNCyhd7lqfJr5FmVWwJLXCddeV8e84uBaNLc6f+5P7CFhEsIgCulP7suVhCJH3gsFRZ0yxD4lb240lFsjxy2/Bo3yIS1YiHb4a2BhAjdXb9pXSZ6dgAQA3AAaDawfqeXQtG/GeDtefskW2TQaINJbqkhOse8/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290375; c=relaxed/simple;
	bh=iZARXa7hqhRBa0NHvC8IT54bm3mjFgGOjpsfu7c3D/8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mCUaLhHWAsrIFgQqOG3sk1h1Hs5PiLrxkztk6ODlXMdKbUxVgJpCKDrpTycJ4lxJ89BSkZZ2swKoa0nFT0/vmwy4ILlanNu/i5KlMJWZgNyVpBG3R0z+FEMOSs82NVQut5H1hzDvjTOWsv/TEuEkSUQRXz5ahCiSDs8ISK8L2jU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PqJ97S9n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oAHdPzX+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PqJ97S9n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oAHdPzX+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1hZJr015134
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=1zbNWBMFaAFFm7Pg60X9ngcGzxpfsDpNMY5NsIEfnuM=; b=
	PqJ97S9njVy1qeiZSve6UDon8zz9BYntuH6IlNzUQ+zmmEhNe0bYe6rXYtyXQenx
	qJAt0kndpleecABPVDFB78lYSRHnU8Qhum2O7/cME1twqBX9P9TACmVaYuRhk002
	H9j5awpcDAHCPNnzeutl6lhGU0/dm1+oy+XJBHk1E0dHHWeEiKg2lvQv1jMuRDsX
	eIOt+EXzoLLgzeTrz6ogDGRcVEEh94PLt9EqOE9xzWiXUGPIc94YaYWz41gkuqKr
	JwB0eE8rwuCMf+ItvNm5eR5mMntiIG4JNdBNZxHSPzzCELR6UKByuq/+KeLLC12a
	0mNnKBQRfK77/xX/v+bbGg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys7vcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UC0cb5008838
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:50 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hneb0mmk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4EuV/uHmq1YgPw1CwXMDuddLUTxNfQ9X7qU+cFHlDegYlfRLdWLe/AD4ISXXOckPxiAJKFTw1cGbjd5tSGBgWBcCZow94jbFCAOGzYZOEF6cgR8ASBa+RmUBgfKOzfy4VwLzvvOXImkS36TmA4s+QBFpF8krqH+ZiVSUyR/c28lMSkYwoqJOfWJRVBeoih59/11vmKn/s3OCyh2e+WvmntBoRtg/ukTgqqBvJoZ81OmVcwRT4Rx6jSkZpoIAt3Y81A7Ab6Q9cQGCvX+YbJENIASoTu5GsaqzHPqmQFMl1n0Zdvczd03bO+MMX/PZKlzHdoYRUW8fulCQXmGzFprvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zbNWBMFaAFFm7Pg60X9ngcGzxpfsDpNMY5NsIEfnuM=;
 b=PQIU+1D/D+Qu1jamuBx8bIGyc1C8uci0mMaZIWiT1P/Zz06HJ5zoN87St5aXzkh8YY4RHD7/jT0cz1QDBap2y6wbgI9NfDLi4RzLIelpohV2IT2WWEcMEM7/W10R4ep6ME8f+bG577pynr0VXouySxaFpWggoBeByCbzuV7CVsocr0BlyvFwql5wYR/NeTjCFd8SZvYGpCUhkMLeh4YkUt19DmOZ1zak7Z7HsItR2n6ttfrt3M5NYxs+J8bXF+m2aauyeinVSO9cLEEvL7fShx94Mc3ZPoSgwl4itqtG85aOqQ7fkeczKrcxtgcXXYP6uXJB4iMd46cqhba2gwblUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zbNWBMFaAFFm7Pg60X9ngcGzxpfsDpNMY5NsIEfnuM=;
 b=oAHdPzX+vxArHTaOtTYySMhASLmeZYkjXozliIrk62mQcRoHzxBH9Q1Bveb8SZNJSIIyMeQGu3lamVrM2O3h57x+0m+sniOzaZ+JhUPOcIgX/f3qBqaUyLCiF6LKG1Q3WG3r4a7bDdEgArlgPLefv2PWJOdD/chNv4UKK1+K12U=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:12:47 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:46 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 03/14] configure, build: make valgrind optional
Date: Wed, 30 Oct 2024 12:12:25 +0000
Message-ID: <20241030121236.257803-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0321.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::12) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: e84f731f-7d57-47ef-0f99-08dcf8dc2a61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d0MMq/+J/5UvFAUX+u3f2FkyEvmGEzcRQBRc2f8vM1iO6Ql2j+AjMfmbRURE?=
 =?us-ascii?Q?wE2OHTv6zWNQarNVYrsuhy/UfSmCjWYLfhF+fGpMqeei41Iar1s4bzjQrgl8?=
 =?us-ascii?Q?RFkQb0zivrIpAoVwxqvZVN+55FxAy9v3mR7RICtY2K91N/7b8JLFQS0ItZgw?=
 =?us-ascii?Q?fl6Qo0kxtQqcAe703OvlHobq6kXmDm9GzqavuliuVt0hf3M2QlZUy5yFge+J?=
 =?us-ascii?Q?xLvoZl+I1u7mMsNaNz8g8REPrpGX4jlPov+seDRC37SwwDuJEEUdL/WEE7lJ?=
 =?us-ascii?Q?jkZucNelsWdn+yhMwOlZp8nNZQNHCnYcvUKhJb1w/kBmGmK9/1GHclgxPt9t?=
 =?us-ascii?Q?HHCw0a/ARJwWTKuZ+XQOu1Fhae29EZVSz+jko8KZPEPXVpsVemWwYhuAMujb?=
 =?us-ascii?Q?i0G/5UrKc1gshLYbmLO5P4yKvPGm3LYkHsWxBaINb/awgM2QLKdfrH9ym0P/?=
 =?us-ascii?Q?2Sn5Ws9RMebzyJ2Iq0WRghvERAtAj+PjTN24Ubel8N+ljyGgK0Fswk1bL0Z+?=
 =?us-ascii?Q?O45Eo82zHGnsPkddTcoxhjsGGZE7+KXqu58ARVApMeP/rmChA9d8Q+PQYO4K?=
 =?us-ascii?Q?TYPPwa9nEEK1EZ23DuKbO7kMNtM6kvdJb0FDFXcD4MSblTT5M71aR1rivkiX?=
 =?us-ascii?Q?2II08Box8yov5z9HM0A3w7+ASoFW8E9OtiD1fwxz60U350unWy27YqoQFzER?=
 =?us-ascii?Q?USdr9iLg0kWhnI/Ss0EjiR3duLW8cKz7fq4pq1B+axKE5+MuqcNm+b82sWSn?=
 =?us-ascii?Q?DIHL0P0U4iMTBvuS/OluP/PxdlP1vtKpNUfNGpZ3Ny3ndiVZ4mMIbmzY26ov?=
 =?us-ascii?Q?AcoC04YVJJNaQOi4BF6aAF8y8eY/GzrieGbK+cDw6uu+Hg/7hFJ8TmwBElR7?=
 =?us-ascii?Q?EfpICME+85qtWRcVR1kkgd5WNt3534FZ+3hRPTX+B01Sluir3aPbhkx9fXgF?=
 =?us-ascii?Q?vUXpLT0DHXuQQ9eXjZrEdz+w2WyFAyfGAo9X1G3rSl5axvlTS/rdvw/ozQdb?=
 =?us-ascii?Q?A741cN5pszMJ0/NhshkA0W9HCvUvspQEj3Dc/KiSHlacjgE2Km0j9PfPp8Rw?=
 =?us-ascii?Q?yiQKe6tXCHybe0ETbg5OIL+O/eT99UrGVQ5k/PHJ+KCoXW5axEXYoUfCpvXo?=
 =?us-ascii?Q?mgwI1iQOpNjG57f5/YVefcYktWGQQvK+yuxrQZNBSL/eFq7QTCAz6cYj/PJR?=
 =?us-ascii?Q?sSFz2eKkhH4lITVAmjcTbIEqsOR8YfkPD1rMpNwfdI5FfgtlKPD3yAue8ain?=
 =?us-ascii?Q?tkLQZJUtrsPHmV6UraDb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZJ5TGnhuinuSzUlzytJI6Y7Fccbq848I+DE1+QtW3nT0Yna1OXNWwxgjYHzt?=
 =?us-ascii?Q?jr78YS+/tfr73M9+oS0UGREg9mhuAi98HirSAWz6ynL4NWNDh/wgPpVKckb0?=
 =?us-ascii?Q?yMcC+NH2HaJJuRtDQgrL6QR4jUS0qOgrhmdc9/VVLMRhjBksY/DBvJ8JDmEA?=
 =?us-ascii?Q?9/n9EU6gCZZvf9cYpBBnT0l/2pFHmd3tyAq9WxM0AGMKJio7YRvHL+Fy0Wmn?=
 =?us-ascii?Q?/lTtUHUIsvfUOyyS5LiAbrLDxiLJ/7/0K/orbJm3gORml3MrkkafJaOjKf/x?=
 =?us-ascii?Q?/Ui17X555zK7XY0i6MIbYRe7taJoLzlAL5LSmtok/E3snRIeTmO7e2qn22h4?=
 =?us-ascii?Q?HiUMUsa4XOAb8G79KG4PXWklu8ryGdDCnlrL3NIuRlc3jW1pmkTZxaYmyxin?=
 =?us-ascii?Q?W3LkPLG95JdBoHncDkEwP1fscXsSa0Rxhj+R+1hTBjkhQa9GJNZJ+8LO4qFc?=
 =?us-ascii?Q?GPIdnBHP7oQ5kLJEEU4MhDXej3talHGjK45UxG5szjHkofqEu7PYM6+XJFSN?=
 =?us-ascii?Q?v9kVS1tdDKsZCfw60tlysgkGT2JrrzeykcqhaUt8agrahLlzUw9kNCCqJfLE?=
 =?us-ascii?Q?NRabQLxB8+isYLlopjqs/E90ROmQPByUsHE1iUgxDvckpw8MBb5nHJnxCxHj?=
 =?us-ascii?Q?G4HlLI6q4480wyI/3l1zj8UeJFlK0hUin6IzbtcMJSj2eBlGVnDdjjCuZfN+?=
 =?us-ascii?Q?5SOzGR5lYU21dBMhrA+3lu93el3EOzkwMilnwhqI61z3RCRHVcxNZHwn7Mqv?=
 =?us-ascii?Q?yZ2v945MAHEe7A20R6D4EIxb1qxjN8kcS4m9Ml4anfFOMJpA/e/Mr9U0Buch?=
 =?us-ascii?Q?x0L9rQLB2gl7RX9qwXUEYhvQGjfRGVPCotZRZo5GAfxeTnHYCfryLf20WLGT?=
 =?us-ascii?Q?Bj7Tmm0hJzrXEcIAtQAmtCnUikKPK0LcBeDUcHfd9VPHsueOpVu4XOWKjRr7?=
 =?us-ascii?Q?AxIiEE+7mCgBZJy4/nmerL0oGbvx7D1NkqDvSc/wWOpfMYI+2Xfi9a1s4xkx?=
 =?us-ascii?Q?+RrPgVbJI953Tv7XFD/d/aUiDEWCD1uRtXp7fMDpXwW+a2mSMEeZsQcGxUi9?=
 =?us-ascii?Q?JyXiSVAhnM18nnI2WN9mCrFSJ4fMuOvJF/JcHzhlE9p6695XyLNXmgstA+vo?=
 =?us-ascii?Q?XbVlOFEK+nKU+u2PfJ0vgchGkhv3EJ/SsRGctwGg3sSA7fctmnUTtK2LmV81?=
 =?us-ascii?Q?t1Vtu0jAgg+YSW5+90T3dkMfF04c2NXIOwjf0pIDgwTGMQgLaOcDso9MPt7P?=
 =?us-ascii?Q?c3fKvDd3DLs2kjS5h6Iq2Voof8PnlPH24bp0Z4CcgAmsuY6cZlLODru9XvBF?=
 =?us-ascii?Q?dHqwZ6dUQ/OcBFjxVYGErO0ds/p9qCpaD6srVxhVR4ZCpAZLjKDDYdtiAH8f?=
 =?us-ascii?Q?YV36gzGkx1F45YCy1hd4mm63YPEQ+RN4Y1xA5hJI2013QTYc5B2THvEAbdiB?=
 =?us-ascii?Q?Yy1/C65NH4v9EblOYo/HP55JgSN7HjB7JmNrEPXs2Fhl1YKo9f8D4CYLHIUw?=
 =?us-ascii?Q?dDGbEancDFLhOAH94RbQOB/dxOC0xM41BwbuPUUktIP7a0gX6Vsvwl4U177o?=
 =?us-ascii?Q?T6i3CXzbhZXSuLkIgx5bqUa2r3uioQafvPdmlmzkLo5Ued1iQBa91adIboVf?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kq+ScC/VH/40lE0IfA/JbJTFCT8R+e4ha9IbDYxPUQFN1TzCiKQLCg9mWt0wZptfqsJ7YVAwL4Tu6ImNooqnwlCfGHRDF6MevVmX4ndhZAd+ubzV9eFpcKdnvh6NzJ72ER/XHpWRhR4yDooAR+AFpULSqzYO3iOFI2DEyPHAlA53VJLka/SRNV67cgYyAFmJ0K8VmSZ/Se4EstZNWCvFMsPraXoTTyp8eWVZdO0bin2FBPRUj85D2Y/ljQ/Ob3F0PTKXeawiN/+BEgrky7UWHQjCgPjENJcCJw8U0KlRZKkFxTO5p+6QqWmGdgEhjRQu0UTbdF8iw6CZO8SKQK6cfV8COpDp5/RoEegzpstMmow9zzwxOm9BOL1Y0Dx4m+RKfHG+UI1x2NnlyIouK4G1QTVt5vhiUWAvhZ8y29a41/byTva50jhzgJfZetRExgKU25RQmEgRpJ2CuLlVS+LIyTJ2CXdfLhkRnOnyvw3uDanSOY2XAJzT87bpggtItmfdzaXYhNw+xjVsIv1XK0r/9cTI5N5Iz87yHME+FrJ7KkDWmbvmAeqgUIill2djeyVWaBYjVFX6to5UeyyGlEZ71XIfE3WSxl5nUGsHpjs/A0g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84f731f-7d57-47ef-0f99-08dcf8dc2a61
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:46.8260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQxQp7FSW/X3qHafZWRXA7aL26Tt7i6Yw8hCrzsFueDfCN2DWxl30+QyI9JXBE612EJZBWo9jKISvCdR2tpwLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: 1A6xKCJh3CkJtDS_StR2uqWpyEuQsVS1
X-Proofpoint-GUID: 1A6xKCJh3CkJtDS_StR2uqWpyEuQsVS1

We fail building if <valgrind/valgrind.h> is not available, which is
ridiculous given that the only reason we need it is to make valgrind go away
at suitable moments to let us drop uprobes.

A suitable new configure check (using a new check-header-macro-rule
function) lets us check for <valgrind/valgrind.h> and disable it if not
present: as usual, defining HAVE_VALGRIND or passing it to configure will
also suffice to override the check.

Bug: https://github.com/oracle/dtrace-utils/issues/80
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 Makeconfig          | 36 ++++++++++++++++++++++++++++++++++++
 configure           |  1 +
 libdtrace/dt_work.c | 16 ++++++++++++++--
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/Makeconfig b/Makeconfig
index 346078598624..752bd79b01fc 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -163,6 +163,41 @@ $(CONFIG_H): $(objdir)/.config/config.$(1).h
 $(CONFIG_MK): $(objdir)/.config/config.$(1).mk
 endef
 
+# Generate a makefile rule to check for the presence of MACRO
+# in HEADER and emit an appropriate header file fragment into a file
+# under $(objdir)/.config.
+#
+# The first argument must be suitable for a filename fragment,
+# for a makefile rule name and for a #define.
+#
+# Syntax: $(call check-header-macro-rule,name,macro,header)
+define check-header-macro-rule
+$(objdir)/.config/config.$(1).h $(objdir)/.config/config.$(1).mk: $(objdir)/.config/.dir.stamp
+	case x$(HAVE_$(1)) in \
+	xyes) echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
+	     echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk;; \
+	xno) echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
+	     echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk;; \
+	*) if printf '#include <%s.h>\n#ifndef %s\n#error %s not found.\n#endif' "$(3)" "$(2)" "$(2)" | \
+	       $(CC) $(filter-out --coverage,$(CFLAGS) $(LDFLAGS)) -Iinclude -D_GNU_SOURCE -Werror=implicit-function-declaration -c -o /dev/null -x c - >/dev/null 2>&1; then \
+	       echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
+	       echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk; \
+	   else \
+	       echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
+	       echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk; \
+	   fi;; \
+	*) echo "HAVE_$(1) must be yes or no, not $(HAVE_$(1))" >&2; \
+	   false;; \
+	esac
+	rm -f $(CONFIG_H)
+	rm -f $(CONFIG_MK)
+
+$(eval $(call make-override-help,HAVE_$(1), presence of preprocessor macro $(2) in $(3).h))
+
+$(CONFIG_H): $(objdir)/.config/config.$(1).h
+$(CONFIG_MK): $(objdir)/.config/config.$(1).mk
+endef
+
 # Generate a makefile rule to check for support for OPTION in BPFC and emit an
 # appropriate header file fragment into a file under $(objdir)/.config.
 #
@@ -229,6 +264,7 @@ $(eval $(call check-header-rule,DIS1,disassembler(NULL),disasm))
 $(eval $(call check-header-rule,DIS4,disassembler(0,0,0,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO3,init_disassemble_info(NULL,NULL,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO4,init_disassemble_info(NULL,NULL,NULL,NULL),disasm))
+$(eval $(call check-header-macro-rule,VALGRIND,VALGRIND_NON_SIMD_CALL0,valgrind/valgrind))
 $(eval $(call check-bpfc-option-rule,BPFV3,-mcpu=v3))
 $(eval $(call check-bpfc-option-rule,BPFMASM,-masm=normal))
 
diff --git a/configure b/configure
index c44c77383dd0..8cb09942703b 100755
--- a/configure
+++ b/configure
@@ -169,6 +169,7 @@ for option in "$@"; do
         HAVE_FUSE_NUMA=*) write_config_var FUSE_NUMA "$option";;
         HAVE_CLOSE_RANGE=*) write_config_var CLOSE_RANGE "$option";;
         HAVE_GETTID=*) write_config_var GETTID "$option";;
+        HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
         *) echo "Unknown option $option" >&2
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 11335345a6d7..fd57b59513f1 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -13,7 +13,9 @@
 #include <port.h>
 #include <linux/perf_event.h>
 #include <sys/epoll.h>
+#ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
+#endif
 #include <dt_impl.h>
 #include <dt_aggregate.h>
 #include <dt_peb.h>
@@ -187,9 +189,11 @@ beginend_child(void *arg) {
 	read(args->tochild[0], &cmd, sizeof(cmd));
 	if (cmd != CMD_BEGIN)
 		exit(1);
+#ifdef HAVE_VALGRIND
 	if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
 	else
+#endif
 		BEGIN_probe();
 	cmd++;
 	write(args->frchild[1], &cmd, sizeof(cmd));
@@ -198,9 +202,11 @@ beginend_child(void *arg) {
 	read(args->tochild[0], &cmd, sizeof(cmd));
 	if (cmd != CMD_END)
 		exit(1);
+#ifdef HAVE_VALGRIND
 	if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(END_probe);
 	else
+#endif
 		END_probe();
 	cmd++;
 	write(args->frchild[1], &cmd, sizeof(cmd));
@@ -300,9 +306,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
 		}
 		if (cmd != CMD_BEGIN + 1)
 			return -1;
-	} else if (RUNNING_ON_VALGRIND)
+	}
+#ifdef HAVE_VALGRIND
+	else if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
 	else
+#endif
 		BEGIN_probe();
 
 	dtp->dt_active = 1;
@@ -344,9 +353,12 @@ dtrace_stop(dtrace_hdl_t *dtp)
 			return -1;
 		pthread_join(args->thr, NULL);
 		dt_free(dtp, args);
-	} else if (RUNNING_ON_VALGRIND)
+	}
+#ifdef HAVE_VALGRIND
+	else if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(END_probe);
 	else
+#endif
 		END_probe();
 
 	dtp->dt_stopped = 1;
-- 
2.46.0.278.g36e3a12567

