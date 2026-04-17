Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C353B38A2
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776452438; cv=fail; b=SPXZ5VwIm86TqOpDMKYis0x1LC60lotOEAKvzJvBFDEwHu0ihdFfgPzYCl9RJyJtBKo2fNYtUtMzAevW5n+U890y1UwBHRRnOw70dlgi/7jdxJmgnlgr7HuN9i/IbKy6TDmGc2TKxv3vMQ5NA87jzgZYcYIiiYIWcmrzEeGfiq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776452438; c=relaxed/simple;
	bh=9EruuLpZ9yQ04HOIegBw1YZRYEuSIXVB51MJTFG6USk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TDtFP+awG+lf7mZeEabfe0GtEn1ED3qW8wnj5ABX6THQPprzIYy3aCAI/JT+5T7KiamqtEXHMDVP67QJTrRrDHJBfhGi7wnb8VcY03b9V1ne2HZd4w8QwgSgkAvXd5X3ScdxRBEVT5Uj7Evcx9n+ruGL0ICz0c7WotA3tJ7wtUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ROcXgQBc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TS9uFEG7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ROcXgQBc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TS9uFEG7"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HGW3Hw711681
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NdUP1w+yXakWQC0qzB
	04UFVqtVAVRZfjqWHdxl1HIVs=; b=ROcXgQBcrSNxe7+hgc0Ksl06TSTp8d0RwZ
	YuSK9yHZkVjNukasBgZb1gvoYQx45a5XcthVnWv/Q9OdgnxGdFx2S9Zbv/1OOrSi
	ZCVLGlHh/Rvm4kmxuIyUHxP8SJmXVHOmimUvhxF7zA4RAF9C9fO+MBqr3XMZYNLc
	RocHSg3p1nfsd8gsDz+0GiJxdXJzO/B0vDaK8N9S3f3l/TLP8D27rvQ3Oug5cCww
	kOuH8HVRBmn9A2yk9W1Zo4jx7ka0si8Hqi4ke+lsJ2hk7kuRvkBDP2MOpvNvZ5hS
	ef6h8RYev0rYzP4qv0cfPaciFx6TsItFsh9fn9hdzKYo5zJdi/Qg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh85qtctu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:00:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63HIxSIt022204
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:00:34 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7ns65k6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 19:00:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjEUoqR1NLDTtGuIydMk90ZBP1nuyMu116DvaHJfq0+dxBw2+evbgGo6BJofoRgTrhwNMDTc+6pJ1Oz/4cK6pqjgkzkhLvprLkH1BxJuH7ZmZZS9WQArhGIW5DEpI7dM2agV2Q+QZFVyUFFB0kGNxyjYt37zJmNO2oB5jkGiqAzpbktvjeIvavuYbamBg91rzQOeUNIQ6PmeG0u+Aw8gbOTvFSBuP8eNi1hDbN0UHO6uDfwjiq90NK1erUAOkihinEt4cGoBYuLA8ot1qPyZTnkq3O3o/XJhkFog76ScIDoD5s0SvAVMipB4Ef+cQhVO7O6/3j6JgbLQa7ODMTPkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdUP1w+yXakWQC0qzB04UFVqtVAVRZfjqWHdxl1HIVs=;
 b=sc+XDb2gdLCzPO88TOq3ZRbGmtvzjRJX4Ch7HqnDo6/BZSqRn56v2eCc7U4Iu34ae/ELBYNwAKbveZCQzq2/7W4HKs4X1wZ5wmXruJYoNEm4kGWdum5ZrZBwxE5j+8mCZAZcTGCCJwpok0NCcsfA5xOCNorZ2Rv8284s7HT4vvLC6AYGhD63Lh246uleuvgZpMMMwbuVrLHi6gIEyF70nYqiTTs5J3q4+dn2+PK4eBq6+HiXvwvIguYDwjQv/4uSUOJ+9UfKogIvWo4YD8musPfiL8AOWS+RukoARxz9B0ir34DeUt4IcdIpSuUkWBytrZB8UhBEd/Tl55reEnshUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NdUP1w+yXakWQC0qzB04UFVqtVAVRZfjqWHdxl1HIVs=;
 b=TS9uFEG7TzfD8t6t8CEH07asf2ZJjV/wn7PNgEEgtI8kOWSMf1opgkwsfMI1HQpVFDSEemEvGGGOIRLSV4clpihhaUzIXcdAZR8NINt4m/1JpE7N6dckCFgRjwq9JIBFa6pNY+2Ed/9ukhuWQ6oEfZ1PPIteI4ni/L3Zdx8sjBo=
Received: from IA0PR10MB7325.namprd10.prod.outlook.com (2603:10b6:208:407::20)
 by SA2PR10MB4713.namprd10.prod.outlook.com (2603:10b6:806:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 19:00:30 +0000
Received: from IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a]) by IA0PR10MB7325.namprd10.prod.outlook.com
 ([fe80::edc9:d2ca:45c2:b41a%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 19:00:29 +0000
Date: Fri, 17 Apr 2026 15:00:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] btf: use dt_btf_real_type_by_id() to resolve types
Message-ID: <aeKDS7IXIz963A4R@oracle.com>
References: <IA0PR10MB732561FE075BF04C79C5CA54C2252@IA0PR10MB7325.namprd10.prod.outlook.com>
 <87ik9pzfe8.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik9pzfe8.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To IA0PR10MB7325.namprd10.prod.outlook.com
 (2603:10b6:208:407::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR10MB7325:EE_|SA2PR10MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfdac6d-bece-4654-b92f-08de9cb397f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	j1zX5BaV157v/UvanGB3GMkmi7Kzgm35yPnTATyQNmuLg1vqH79fY2lXjeZDOqAFPHN6FjQX+TgvJkVqfFCEEUnWzB3RbyXz800sKiW82Wc9EGm2nmEh5AzRPRr4OOphaTMEy/ty1dZgyhTtAmRqLoDAOzuPHMO/c12z+AMzdBffI6TFLPD6yI84PfesgZMt5ZvC83v00T14TwGgtoL27veTyraLALsCWM3vdusByYV3U7BU9YzttznOx8UZ4KB0qRJcDx/GKkSJ/06z6cdD71jgRY8z2G3M+0QolH4/MGYed0tA0VNIPZdbxlI1YqEg5A3oZAO0+BZXuz9zYZ3sjEZ4xA6Pic4Y7gk8IL7pRKx6cyuMp6ZbQVu9fyEf9K2yFOOJlGj79spaoMEO6Ph8ZQjDBp2i2Iaaux/bzVKUlI5S8rC+5Guxah6KjFoQh0E6iuOAkM5wlEDxHBubmWBCyX7rRtnKLJHUsS5YttipLXMxJeZpaL7Zjyn1NkHgTRjRvpEKcoSAb1BsfNob7fXnfEHrjog1EJG+uxPjxhoIbVPkK8cUWHGYRifsg5A0VTceaY8K2juHZ6yIpMR/rnWf4Y97tlYFR9ShJXadoWYv7q4W2UxU1HER97zhrWIUPPTutyBCIE0DmWdofe8Dfdy2P6NYTCEWc2maIT4aJyUxtdxLI49git5+az5/jdSanSlc4OwVYbqehAMVGgA449B0LwHovzQBc0gZQyIF5kAyGGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7325.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uvp8WJ1deyqqNLX2WdAKESzzTVGyhCNhHCrIKr8mHSq69JUD8lHAT+eQlEMs?=
 =?us-ascii?Q?7VXkrOlMU8LC0x3lbTHwsgDWQ8dZAROsjHpOZkUgfM4EEIO5nakSyCWwzgkl?=
 =?us-ascii?Q?/+b6bWjZWuoU/syxrg3VLQY6GeFMrtzBU11/bADAdl2cmaks99dKErplQo7r?=
 =?us-ascii?Q?Lh7U8HRXtaQtyl6UqShmjL8HpzZFXq9Bld0RbrYt5iOQN/8sD5nj8rDW2YLc?=
 =?us-ascii?Q?zHsxwMFrj/m89c1rZDOhOVTyLSBmk4UJK46taiZFK4xWLejnn97I5cG+UIvl?=
 =?us-ascii?Q?TfNkgBR5JSbN1OWJuR3BqbJseLMHm50Peesf3FRvTY7HPdGZuJ4PlgJfS2ZY?=
 =?us-ascii?Q?y+4NWZuQlahktoYE9IArNN0dgsLAHgbJmB+COilxwnZJkWH1S+KJIs/0W2Z2?=
 =?us-ascii?Q?0ZZhkzowR0RDwPRyXpoRFCaYBKg6PZWsWpwlkr6JRaTKxLsmaHACE5GbvJ0g?=
 =?us-ascii?Q?IOUXtWFeEWqr9aWn1h2T4DEf1/6nue7FjvJs3hOU7MWuyeYwEvnpP0Al9J+U?=
 =?us-ascii?Q?twVvyKsNhMIwtalbU3N815EzRzkttv+BGYPFTldXePf1XKYXYflDmnTj8lz4?=
 =?us-ascii?Q?rbjQkbsNLS7W/vPk2dYMNG5+7jxgAuJiRG4971Jv8kD2PwuA9o13bhm5OTPs?=
 =?us-ascii?Q?tP2M92+vKp8dJ5sHxhTNJluxZf0VFRNVJJDAxuK0DR/sLbDXRmC4kFKVu7e9?=
 =?us-ascii?Q?s0RysN9u9YYPnKyRL2uRlRG4s5YZzTe1vX2TvEU7A8oBoMSgg5qTVKuav8Gy?=
 =?us-ascii?Q?mTfM6mORT+IPEQ52E88v4qUJWAmTMy4d5zbJ8Ppyf3WD4bw03Es0seqcS/Y5?=
 =?us-ascii?Q?uLF6C2X7vR35il7oN+2RWUgfEI2W1TUTqc1MhbL2jYOGg75zIR/SUG7tM80Z?=
 =?us-ascii?Q?OFv6DGUdJaIvwGLxtGlYovDyWD4clTYkO2Q1TkDpIEGD18jHL2r4wRkGCaP2?=
 =?us-ascii?Q?3NdnBl5jEi2pgMesgG366tVIOHNsUY9vnT0QBx9zffHZUAOZZJCts5YF+AKZ?=
 =?us-ascii?Q?92c1GNPeCX+SXSVpticr78UrkpZo99U3N5zP5tGCbHDO3Z7Vh9+P8gJZwAFC?=
 =?us-ascii?Q?a+jSbTCsR//Z+iLaFRjaHdsPHRE9QMyJAi8GI1ASrQbNQeTlOu8LtwJ4Tcbh?=
 =?us-ascii?Q?i6QKk+f1q+pxpHHg1FXjYWD6Hiu13egL2rgcPpkMaE+gFqYXTjq0eAbSi9wB?=
 =?us-ascii?Q?SkXKYxZQlEtN//vV5rlco0tizOxBAe8oeVNk5AxkWjgeWuKVaVJ+J9mnwR/D?=
 =?us-ascii?Q?d8O26klk9neraI2QtxL6wmT+un5kcxL//Z8VncXPoXllFsLH/liJFZ5tImtB?=
 =?us-ascii?Q?Wa58gmuPmuWCbntU4jxmMhtZtwntGi1CUFthTDZXbfp7gJRBdXE61vVdeFfg?=
 =?us-ascii?Q?cCDm5ERQ5c+lLYeEjRlWBx+p8dG/9SC7MSSfFQaii9QRvkZnaBA+R4SnUt+8?=
 =?us-ascii?Q?O0/9XT+qImUpYxB7AZYnejVbEOMmEYaOIvfw9/PpcwXySpExvm5VBVblA3aa?=
 =?us-ascii?Q?XIWjFkN4YcEs+9GcVFLBtU8qdQS7FcaKToVBMBiOPx/cj/2a/9G+gSk7x6Nr?=
 =?us-ascii?Q?6Pua9fbHsK8Lysz0qAaB8+8q/eT4s2Gbg4GZcRcaIxylXH7iH/wOqOkifNGo?=
 =?us-ascii?Q?pl2s46mFMJkWlBppdZB06uUFUyxQC41aWUHgo28yUXMtDv/H80od/lcGsvB9?=
 =?us-ascii?Q?wzV7g4/BZB6CCSzuEj8A8OqwEjBEPJ6jUCTUVNr+UdLjlG/708MSVuzCeARO?=
 =?us-ascii?Q?xAJEJy7xrg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	vytiZgBbz8EZCPmAtZCvdKKCm8FXkSGglxgT5hl2IwFqhHWHpRCnno+b25YXMl2CJp62+6Dxcv3cUta8+ov4jzb+tm1/eyGX9b/rZxJ5Ei5X+Sw7K+9j1Scws/LjqYOkhYaKYwJ6A/4QR8khFRrShS3Ox7Es4VxbGVMMc3GXSJCC8D6/1pfeQecL564gGoMCuwIoZM17YiumIMRYqVEuqDfbA5CWCufS8rHC+L2pjkVOOyLNNmUvsn+fpZYLN4aSG41t/QW0cJxmPRXXTEYngmpwVnacWRDJcLXwxm2JYyK1hKHOLqHJh59NfL7o7XBT9ysjwaYyz77vrUqmK2eQlg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1lRrv0sDghr4vmCRNKhIqgAs/0Bw877k3s+E65Unko4SxwDlXOFQdSDMMzu8/q1vhBItF5Hshf2hhWtXTVzelJ0SpUiVBdk0To/yeVEmLNMSWMpxPFD9fEcp6LHLPHsm0ELLTYStd/5dahP/6ht9Iu80tvTzjGhymXJ9ERo0DDsUJUhjs7HtfqZQ1QMXmlv5n/Q0wyrTK7mIexTa0R+wOUEts2aeE/jVPcimm95lvF9DTweltn49aF+PN3oqiP5JCWZ7A7hwFRfryc9Kzdt3BYmARf/8hqO6A4NwbbLz4zw+Aa6YmwQlsQMb1a2FEMyfprzM1arUqGYQHLUYjDqJ8Z7iaM3jE1g00f5VizRNV6r0QO387TmTBUKIAuhZ07dewWe/jIy2Ut0Fong94WfjSQYvh7BBb2IoNA+0pdwNehK37jI4m/zjMyYKbyYUhGOUMW4xUDqt1Dvp9nc0mRnNUW6P1dTptmRladrBG+r9vAIL+vKqZn0oSdaTKRCCg09zwbG4P8N51Qz1Zo+eCgdqcPFJ2UcboK5G7f3+kumRT6e7zv2H+9EI44HyeVlaoOGyaWZNTayVYOXpgVfBL5xz+98j5gUuFUwQdpD7BM6/4P4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfdac6d-bece-4654-b92f-08de9cb397f2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7325.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 19:00:29.7625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3HNYV9AdjAwC9GsGoNVhQzW/rVwqbyeT6QdaE5iKzLCuJMstMNCabewgzt481cMiifMx6jdiDugZYvxWMHRPXO2w/CrT21KuxeHeh/Mt4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4713
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=885 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2604070000
 definitions=main-2604170191
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE5MCBTYWx0ZWRfXxyinKMXbVdij
 CkT6PxHbLJQUztGkZHAvC2dmluDlc1jujENTY4fJZAHyCTO6y9e34TPX2cxkVHS01/1Fg8EoNkS
 qVQW98/j8TdE45+CcXUyEh/ufgVzhaza3Wiz4HtjL/LEyKjRfBlsWc1ia9yIxPXj9OrzQLZxImw
 +Dgq73ESCBBp1lVhpdhEbzlzS4S3578jE2dotLbjVRqKr69NXkDIji6TeP20H8RtbQPOYHAfO5X
 VKCbBh+EIJVbWM50cSE3nXr0OrXzYv3PquWLm01iUY4xc43ErNgPgIk41pUnJgghge9QhBCNJyw
 c8Ai5gZScsCxOjfPN7q6bDTp9MbFSehbdR8iCu2hdyhehyubFDdXc+dgILHj9m1eqyqQcDXoJMw
 VRIcNSyyLCKstJG7ZudjW0QIgWbPqDdQmfQvc28gV2o8BaOcxOmhxE8T+qDbOWjxuhl2VW1hNF7
 KcrcRcaKpqGGbbvCBKxmDm5rdT/Gx7RfVjgg6/cs=
X-Authority-Analysis: v=2.4 cv=Lo6iDHdc c=1 sm=1 tr=0 ts=69e28354 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=CmmCL06DbocfP8SqivUA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13825
X-Proofpoint-GUID: Fsf6RVKlBtyLcxMFeQpxcRuMtnWq8FyM
X-Proofpoint-ORIG-GUID: Fsf6RVKlBtyLcxMFeQpxcRuMtnWq8FyM

On Fri, Apr 17, 2026 at 06:05:19PM +0100, Nick Alcock wrote:
> On 14 Apr 2026, Kris Van Hees said:
> 
> > Functions that need to check type data operate on the real type rather
> > than a typedef or a type with modifiers.  Similarly, when a type of a
> > function is needed, the prototype (BTF type BTF_KIND_PROTO) is what is
> > really needed.
> >
> > Introducing dt_btf_real_type_by_id() removed duplication of code in other
> > functions.
> 
> Perhaps dt_btf_resolve_type(), for consistency with the libctf function
> naming?

Hm, no, I don't think that would be what we want here because I think they
do have slightly different semantics.

> Other than that...
> 
> > ---
> >  libdtrace/dt_btf.c | 43 +++++++++++++++++++++++++++++--------------
> >  1 file changed, 29 insertions(+), 14 deletions(-)
> >
> > diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> > index d08599192..56eb96a4e 100644
> > --- a/libdtrace/dt_btf.c
> > +++ b/libdtrace/dt_btf.c
> > @@ -848,6 +848,26 @@ dt_btf_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
> >  	return btf->types[id - (dtp->dt_shared_btf->type_cnt - 1)];
> >  }
> >  
> > +static btf_type_t *
> > +dt_btf_real_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
> > +{
> > +	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
> > +
> > +	do {
> > +		switch (BTF_INFO_KIND(type->info)) {
> > +		case BTF_KIND_CONST:
> > +		case BTF_KIND_FUNC:
> > +		case BTF_KIND_TYPEDEF:
> > +		case BTF_KIND_VOLATILE:
> 
> Probably this should traverse BTF_KIND_RESTRICT as well. (The kernel
> *does* use restrict qualifiers in some places. I was surprised too.)

Ah yes, thanks.
