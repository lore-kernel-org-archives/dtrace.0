Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA65715747C
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733657; cv=fail; b=EDgDBggMEYAli0D9RlRUz15lhAp2kaJmVi1mMvObrB99dd6I4/Hu3CNWcj/hFA24Gm9lohQBOMwohd3yvi+PAiGpB2JN9Hv2AkPSeExZbDdMduGPLI1fgL822/Q80xX0iK2SUJj/+2RhLxI2SP6edCCDcU6VD8HxCchbJOZG5GI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733657; c=relaxed/simple;
	bh=/7XDUHteos209OF3OePEZMnysreBKG1txOOKPLQqgRE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZujMqjT9gfH3ReTs7cFE7ULIk4YPa3mpymyaRv2syHnwzqMHed65Le0SQPcHw+gX542ebvAbaHmKyTv50LIa4D+jDRQ8gblytFn/yhfd5m12seyZJi/kZqmXHXu8ko9knL7QhL7SX+ZHj9SQFRhPx9nb8uHIcNc74739uXeCAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iMhXtDe8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HkCR47Bw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iMhXtDe8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HkCR47Bw"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMNjdZ019594
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=2yH/6bEdDQ4WtBbpIp
	FXzakt3gFGSyYNjm/A7qvSjzU=; b=iMhXtDe8p9G5R7ft90Ng/YVrET58VcEYaC
	0dLzRkiqmFDdZWIyEMBuUnu0FlT8Nty37daw8g4Fi8uzMCYFUCH+CLn5zdnSLw7g
	2d5uO0SQPQTp4wiZLuNJexFFNtEsg1GjctOMSL+psHTUgf7BopKcYL9J6SATnkW7
	AieYBlD9rjAp+86t8FWcI8kIzb0xsKc3KhhDvJGFyDuNiU5aPH4UFYMbTy6oqozW
	VqTdS9g+wfkDLXJ1ax0f4Mhph3EFmbKBvMfELa8+vGD4k78ovQqD09A2MfpxiOcg
	swlPUCnTOZ9LDJ/z2956090FW7bFESGM7z5PrI55XRl0eXzVMb2g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43jaj5ktx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKKk6ed006500
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fdsnfy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:27:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/PHLuAlfHDJnyEoRYxnjEda/HEPcyUyaTS57vUMCLrH5H8ZtueM1fL+OMnCiWzJr1nJti9/mJCxWps8kgioZzawdtnMLn5bVhmAfxU9naGNeO8kCcePMFE3JNuuJjUu2WxvSu1X89b7vhClWpIX8h5ZnoSVSrhFdY8Gn1UHj58YucS45x+SMuDKI1cLmGgu8wDgLNDnPeL1cBwV3SKYvjv5TdULiKSPHVOFpZB5yC6/6Buoy7iJG4mPVDqtQ0LtVRU912PUbxwioK599elhsbhMzO35jVFhjhHgc2W3gXd9fn6wUN7xBzAm48p5OB18uxH8Tkbk5vVUfp1VLLCKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yH/6bEdDQ4WtBbpIpFXzakt3gFGSyYNjm/A7qvSjzU=;
 b=twzvAKObagR9CriFcbzGgEmX7YMbjN37wQZZIomhndPN9Hl2rE7IHD/g2hN5z+u2daVQwNVg5Xu7R03ahNDGk1BIEy8lJajHabT4Q62Sl3rwQjBfhbk3jA61+eZQl0L/E+/znMhe4AmoAIXtJfvg+1RVS3dCm76C+bvcbILpwW4orc1Fy3qddVa5mHboiQgVKSqo0CRQWyf+Cp8tbV9Zeh9OXPgEAoLZmvlvaeZPRdFb1hZrN3lOmJDO3f2jsRzW73+fUlenfo0k8bfaex3JEdcPr5nAwmAoyM+TnlMJgYhltca+FiAqg+I1wLeSWRcdXavtoT7C16RpL6mtGjEiRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yH/6bEdDQ4WtBbpIpFXzakt3gFGSyYNjm/A7qvSjzU=;
 b=HkCR47Bw1+1B7w/oWQfLnsBxOpJ6Jjhftbw8AfwIfnGqFuXyN8widQmhjdkNE0KKdjl/YsMIX0asgLTGXDGPv1KSEpu2CeG8PuJFRLjveZm7YtW6FqYVwiXj5CU5YgqyRPM4yEFm8ZNdXQbK5EquJH3MjGqkS4rKsTiCxapdmAk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 22:27:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:27:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/6] Simplify references to dtp
Date: Fri, 20 Dec 2024 17:27:13 -0500
Message-Id: <20241220222716.18511-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222716.18511-1-eugene.loh@oracle.com>
References: <20241220222716.18511-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN1PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:408:e2::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 4103868d-a43d-485d-557a-08dd21457b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AIV1UGDzcqfGgEohQYzUEUUjT5XK0FAkZ87OjBsljeO48ZcdMFEWDE5ZqP0V?=
 =?us-ascii?Q?C4htxWl55Jgy5/Rj+rYEKi8nADAfHz6XY1Yt7GdN6gORuFT51tlhv5vkIVBp?=
 =?us-ascii?Q?9k9+znQAizRyp2Yn6ZJNC4m/oVGG3+ntF/HY7t2hsp6xly7TqQJpgXjC0wx3?=
 =?us-ascii?Q?zVMcptHYZlfmdLmlq3OCKQ0G4P33zMmbCfU/8oIjftmD+kWWQmFi3EeiH1nv?=
 =?us-ascii?Q?y24uyPd+4gTFgEAAx7AL3BUVXcb1TCmfygaNEqFDdJhqq79vcuNV1hEpKBWi?=
 =?us-ascii?Q?dStyKQKcquX1DSf8n1VqBmVeKgoXyQU7BtX0Pxo1UDpxmLfCuEVhbin3ODZV?=
 =?us-ascii?Q?wpBsNc3Bgpgo5YUlpDm6ZXQT/yvAFYklUlET0AvZIdnn+b8kh2qmZZT3RQgb?=
 =?us-ascii?Q?6FAm9Oos16ukP/m632G/nrtqMKIFrIPzoL1spwvCztsW/NkSda1/IG1UIBZn?=
 =?us-ascii?Q?MYPp+B7T1TIcRByXejo6opBj3MDJqdP5ElM18atTc29GrFotOIlOnKJhKGxN?=
 =?us-ascii?Q?3juMUSgTIpHkab4SamUi63nsD6yZ129Vqls7Ux3e6Mw+4WN68xFrqNMCl9ln?=
 =?us-ascii?Q?zU3VaEAT5BQvg9cURaZ4EYuoZ7MGk2cf6YCfsUjprdVV6AfCwl1c4CaN8njU?=
 =?us-ascii?Q?3LK3QpjmxVcyKdWNB2fuidEYXcGZOPOjGJasH4yChmhdPFgzyH9XXPhLQBJz?=
 =?us-ascii?Q?r1lTjlvn/atpJE842Fuq0u4TfsZe1YE84QGzYUdOxVrW0DBXYFLu0AiiMoj4?=
 =?us-ascii?Q?nEIabhogYF/b4ol+w+LxnCYrU7oC+IpxDGvw12GJ4rUPOAv5ErGKI1TOtVGR?=
 =?us-ascii?Q?B5FEpry7se3Hvw4BrA+bLxT8cJTj8JYSyI9TJjD4M2PK6iJUUv0R7lyjJzpJ?=
 =?us-ascii?Q?h/M/VmEW28roWEdBmccxyABHvkvnTuDY0Rewi+FgXLZkjPMQv6wUd0Zwt7UP?=
 =?us-ascii?Q?Gt56rIKNxGDwZ5hbi+i9OTYzVo/T9StHyOLLqXcVRkchR/2LX2oDgaX6H877?=
 =?us-ascii?Q?VfSKhzlzfCntXxxvQBLVbSZ8DZzApr/XO2CHKcpKoyF/LNUN+ic0OfngZG7E?=
 =?us-ascii?Q?9N/9NCZaZ8Qj0Z1b0akoQ2yqwAbM8iJIDHbJiu6oSTkylPGcezBzl/eH9+zv?=
 =?us-ascii?Q?Tk3UseBoC0CGsunrm8L2i72J6PeNYLjHjZLJEVxbSV1a4tU0t2MM76OcsmzD?=
 =?us-ascii?Q?iMdwY/EiimRr0mfVZUT3pI3crWLcfBAixwa4tjxFWscMZAzp89AWRjTz7Qov?=
 =?us-ascii?Q?gu3dTxRVP1dyStfF/xNufRXS30zsqNfrWyhOAGu6yZCOQ2ypdnipEmlBO9Ak?=
 =?us-ascii?Q?Z8DueUGsGRCHfkRLDbDig2DxMpw6b4lzxIH/iinJu+K+PgF5dokHPAcL338x?=
 =?us-ascii?Q?NpJCjfbFjal6wWr6Fn4DgrLAoCz+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VLwa9u0M9MNmyiPNSQFqhVzuClYsgTM4yZO89uKWblUgzjAPyZ2Up8gax05a?=
 =?us-ascii?Q?BlzFl4DK8uoQVxXkkROMSEL7vY6yDKslN9K8jg8X7AOezoEw0HQuZ78gx/LI?=
 =?us-ascii?Q?ysnfyXRergl9qBXbYW2cbeiCHsVBWQncmGexhw/f29SVg+S5Bttc8vD2jbtC?=
 =?us-ascii?Q?vfmks2zJtkNtInvrIxuFvN2hmlkkB5Fe5jysujRao0s24/dqqJcfIygJC03W?=
 =?us-ascii?Q?uYmip9WPL7Cpggo3Nzv+w8rulx1AlYAY5k02gUYqQkLvrFuzilMLcl42h6UJ?=
 =?us-ascii?Q?wcHonF0hVuxugAwxMGzX+qpg6elx/iVMZ0UOWBi4BGzMO/OdZyw+jK7zt2xo?=
 =?us-ascii?Q?Q7pHI8CIvFfD7rbeP2qx/FhfW8Ar1X9ZW4X50On0MCJ4B03iSUghQ2Oa0Hdz?=
 =?us-ascii?Q?Ijy1ZvGyrDVHvH7DuEEqsUinx5oCAGMrDXB/NfTaB8t/yAzR/P+QkstUEJDP?=
 =?us-ascii?Q?0Q8j6aT6dzPcajeWl0MzHxgIDxJMzPFHfRXozkdvl0qS+siPLNMBggiJDg1J?=
 =?us-ascii?Q?QSVlMQ9Cz6CBvb6bgLsw39rHuwN9oygKau1a13dSDLxpBeJ/q0jNCrlrG34N?=
 =?us-ascii?Q?K9JKEdXUEB1hVjySs/OsuK1A9jbSNovyUPgnIioqw8ImUr1L04bP5Qzh2ahY?=
 =?us-ascii?Q?FceDNc0tGb4ftSKns1gjFvMw22oNjmQALkUbWafg791uln24Y7oAUEhkIlcZ?=
 =?us-ascii?Q?cOz2U+CKsiwTTkBK3n043QHByc/ljiwvEay+uOpOHPEWXr4PvseSnn3NJDOG?=
 =?us-ascii?Q?95Ok0s9TYo/8UUH6HxVdaM36yT9WHiKasJwZOQMsNsSlRWxnEAcDKb7kgFiC?=
 =?us-ascii?Q?UWKUgCAN3IRDqtMm3diIrYR7G0SXp3jYLOkWoKxznO4aQxkcdD3J6FT+VyCY?=
 =?us-ascii?Q?HARVmxnGMKzaehfBpvIpp3M+cUtqvIhU7a5iAKUh7uas1UowvyOdpfLJxkeF?=
 =?us-ascii?Q?YDFt8k+qeJs20JdmOAUvZXCDx8awHZGXBH+xwh5wtc+UxWjTqUnxgfKodp8Q?=
 =?us-ascii?Q?FBe3a5UWooqnkGx2BQA+ky5sREJrsf/YqYY5zD6w77Th4IxrcK6/RoGGuGdr?=
 =?us-ascii?Q?JIrXJeDl++ldv+l8oRE2vqQOYlAon5fQWStMB7FbOB9mGkT4yoOOGl0tjI2Y?=
 =?us-ascii?Q?hoXaGsZ1vUAw4wh98tPL5TScz45GFG2hDr4bjgKjtHTth20Id+/vWcN5rKon?=
 =?us-ascii?Q?sYpcfc41w/6IGOp/8Qt4OqMUXTguNtwdAVYdZx8BdC8LhSPoYhcb012FUAH+?=
 =?us-ascii?Q?nUCw8rDEnsYWsQ1T6x0VqwtcITLrR78UdyUNL9RMi+sCiVIn+X7rWsAhyhuB?=
 =?us-ascii?Q?aMGpu+X60J9suDb13rRJOJi1I7FdqUMgOf9pdw+i3PEj1HEhUhq96NU9finE?=
 =?us-ascii?Q?jVbp+yPweE7JA73U1palrI/g1htGrYVo8joF1MooSlz3M4BkqIGpBfZPfU1C?=
 =?us-ascii?Q?ZLO68OgHZdY+ulEcaODP0crsJozxHbr0sonBbUMiRLopdJrYc8yjuk/S+krK?=
 =?us-ascii?Q?sAx1iBv04EkEtt9PO6MEzQawrvuFMv+rfpfxP97LPQ/Y91E27NQwDOlWCA2D?=
 =?us-ascii?Q?7gBGy4rj2ZF7vS91Ld9NSsIzoF2GMMiLQ4pwv3Ws?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	82F29dtpZ1aHNny9YdIBTbH9qlmzrDbsMdHTRtP2lR/jOEjIxiysmux8yxhz2eJpFF577jELRz7OdDXo5L68WTZtIE+CeSeqnRkAdDaOa5sC02W6ibfzANpbITkBOFurF483QzTStl10Q5J4GcLKsEZntWGAsL4r3VGM4O6g4MORJYLxoFd/jgAjFH305AbOjTKGuUo2D/KLaOryzOfnmVmQNf3HyeMOpTmOXlc5Y7iYkawBpHRiR2/OAvIk5KDdRmKAEUCLqdv0CkOKzAws+8fJHKRtBGsDnSU5sA31POcUmWwBDT892yXPG/BVlkGfuJUTnORwSrnFOATNeBx486QCIBmjDOzmOUfE+z7BmL12Jk3sEI6cXQMCsQ0DIRhgKzbRQEDQ9RiF37T1KB4GTMXKAGn1WmCnvMvMMEDsd0dt/J79ov8b8lROrrSCSTOc0UysY+F9ko1pE+RYPg+AFkvcE4SsgjVJ2IEncJxQSr0dvL6M6AdXAgP98tfPEncPV0wKSc92mQEsztlzjKPh2NbBBuMwblLA9p89l+Ctsz/f3MIjvr01X4ykxB87sLlE9k4s4riaQ08NHb7faXU6rFcblu0JKR42mVrjbAif2fo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4103868d-a43d-485d-557a-08dd21457b37
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:27:26.1619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kdp9c7FdPWGbQ2ui5HymKbWDI+24VSYd6jV9bXsgSqqFpw5Zz7u6NUwvp5tM+1rLi3usyA9xHge635Rx/N5g2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412200181
X-Proofpoint-GUID: _bLUG9xY4NhleHB_Nm-1NcOZhJHnISSl
X-Proofpoint-ORIG-GUID: _bLUG9xY4NhleHB_Nm-1NcOZhJHnISSl

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 27cd7d13f..e57478450 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -231,7 +231,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 		psp->pps_nameoff = off;
 		psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
-		if (dt_pid_create_one_probe(pp->dpp_pr, pp->dpp_dtp,
+		if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
 					psp, symp, DTPPT_OFFSETS) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -362,7 +362,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 			psp->pps_nameoff = off;
 			psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
-			if (dt_pid_create_one_probe(pp->dpp_pr, pp->dpp_dtp,
+			if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
 						psp, symp, DTPPT_OFFSETS) >= 0)
 				nmatches++;
 		}
@@ -434,7 +434,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	if (obj == NULL)
 		return 0;
 
-	dt_Plmid(pp->dpp_dtp, pid, pmp->pr_vaddr, &pp->dpp_lmid);
+	dt_Plmid(dtp, pid, pmp->pr_vaddr, &pp->dpp_lmid);
 
 	pp->dpp_dev = pmp->pr_dev;
 	pp->dpp_inum = pmp->pr_inum;
@@ -466,7 +466,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 		 * just fail silently in the hopes that some other object will
 		 * contain the desired symbol.
 		 */
-		if (dt_Pxlookup_by_name(pp->dpp_dtp, pid, pp->dpp_lmid, obj,
+		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
 					pp->dpp_func, &sym, NULL) != 0) {
 			if (strcmp("-", pp->dpp_func) == 0) {
 				sym.st_name = 0;
@@ -496,17 +496,17 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 		 * dynamically rewritten, and, so, inherently dicey to
 		 * instrument.
 		 */
-		if (dt_Pwritable_mapping(pp->dpp_dtp, pid, sym.st_value))
+		if (dt_Pwritable_mapping(dtp, pid, sym.st_value))
 			return 0;
 // FIXME:  why are we changing to a spelling that differs from what the user asked for?
-		dt_Plookup_by_addr(pp->dpp_dtp, pid, sym.st_value,
+		dt_Plookup_by_addr(dtp, pid, sym.st_value,
 				   &pp->dpp_func, &sym);
 
 		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
 	} else {
 		uint_t nmatches = pp->dpp_nmatches;
 
-		if (dt_Psymbol_iter_by_addr(pp->dpp_dtp, pid, obj, PR_SYMTAB,
+		if (dt_Psymbol_iter_by_addr(dtp, pid, obj, PR_SYMTAB,
 					    BIND_ANY | TYPE_FUNC,
 					    dt_pid_sym_filt, pp) == 1)
 			return 1;
@@ -516,8 +516,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 			 * If we didn't match anything in the PR_SYMTAB, try
 			 * the PR_DYNSYM.
 			 */
-			if (dt_Psymbol_iter_by_addr(
-					pp->dpp_dtp, pid, obj,
+			if (dt_Psymbol_iter_by_addr(dtp, pid, obj,
 					PR_DYNSYM, BIND_ANY | TYPE_FUNC,
 					dt_pid_sym_filt, pp) == 1)
 				return 1;
-- 
2.43.5

