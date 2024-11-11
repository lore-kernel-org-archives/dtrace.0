Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E732C8E
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731298240; cv=fail; b=gJl5+p11TzOXLtAAEGZoKO2sZB/mUzFvV1tPdr2I3zO+RS1cOdKHL3e8SP9o0dS6XH2V5Jz7OBbh0fcCFA1gETudlrXERV0K0a5lntORi5b+1hZP6l7v26UnXQ/WWllgVkWiTSjlu6HHaV9q6u87Xy85PWjRvrIT43slQR1YgEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731298240; c=relaxed/simple;
	bh=4b/+8w0euS97fkkucZtmPNQ1dDY00oXdBF91QmGNTSM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RCJyyCDo4ICOxchnihUYKE4DPgHmYuIZ4W3caMg4MEnuPop/c2+HHHqgCT5Bfc9QQBfSKXQT5boKt0a3hFHkspfLzvOL1M+3cHoG1dAb8SQXWuHCPFQ3JwrvopCbGltPwPDilSOUBZWPrOOaDcebb3GQ4h4YfN6eJBXGOZ/Ymjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HClyikzf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kQms7P1K; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HClyikzf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kQms7P1K"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AANdKlA020864
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=z+kk8nvtVpyeuy4GMJTJkFzuHpPkCEqrYfurNj6wE5U=; b=
	HClyikzfiTeM22oTqMcgOiDGcCPHdXQ65LD1K3X3nvDX+JCzdBtreLNsUILWVcyi
	2EFU08CwrrGENysc2M9GDYrxNTVVfWO2tnHg6tnk7+OiVyPxfJQxz6HlJ485vdrL
	WulvLBatopE2uXUnpkBDSL5nU82h161zN6qf+iXOWQ4NncF87QT/zEqP14vxpLHw
	NkCOxQk10yxd3K9t/DJtwfEWmsmyqflnzfvJjC9C3VxQ/k1gAExIEA5rqtyZi4VN
	aSwEUiujRwvE8Vt+4zM/TQftHqWiThJLoLd1AwmtVWJFiGJ3gvjsR8cAhk1KAL22
	I3JwgRzT/2MFhcng5+MBbQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42t0kbsnnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AB1B5CM024303
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42sx66amyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Nov 2024 04:10:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zPvs2K165rPWIUd+xKNyKrwQ490PmUEMKTStxiQvrgs38WryBvWOQT6wCnceiViZ1cuioG/LQ96gzIQLBjKrXaNolArHvnluTI0ylxzCuKbN+WlFQZHGlzeaH4rnbZXSiJt4rZPBmZ4Bj2H14n0vqf+nNJJTujd9nh4ihuWDnAIeFT7PsI6Zw8CeIyQZv2x7cqczzKiu4uGMeSnGx6HpRJsdEDqQRMUdKO4FOdwR0PbA9nJlhKGPxxkQC/CUOXYKbaYpquRMwA8ItEJWcgF6wd0y5/BC4dz0mmOcKRoRsHzZtkSPDBos6o0ybf7bdbSLFYpXb+AgudV5sHZJsD9q+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+kk8nvtVpyeuy4GMJTJkFzuHpPkCEqrYfurNj6wE5U=;
 b=VF75a4wqAKi5pvWOwAq4VUuEPMBFWnbbugMHo82+18QiQ+c2K7Bv7Hel3k9Nx7y6zcF352E9TvZRIUOPUnDNHux86Z2pVMrsdr7Fbpx0HVhHb9ruExoqFWlcETfnZ6ZGFM1ySSY+vgO8PxgDAEmt3ZqAWKAYU8ChVb27FZgB7fXyGebvB9pjDjlwjtLd3rtGSkFlBm0m6gH9D/tkkYKLwYKwKYocqyBbxinxJESaJCyhpBIDGcCxNyVcCEK8eSgo/Ci/+nJDGEtr2AQPaMLrgQAxhRNfibUAXu0FUAWvN+iEFyAsT0lCqKTHx8l9rvnCdPylbG5sdNabRD8W/QNOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+kk8nvtVpyeuy4GMJTJkFzuHpPkCEqrYfurNj6wE5U=;
 b=kQms7P1K6y8Ak2yxgogFHsGQ/d7nsHU8UAmRopv4UlZTzhhwDfR9e/rGmvd6B6tTDySTFlYzOXuRufrcTXhGv5VVEg64CCMBc6T4LzM92Sp9+9XkvkXaDGKo1/wVmxlf11gYQRK6kwN+N9ctXyloN/CtTkZjOv2g6DllZqKPDR8=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6029.namprd10.prod.outlook.com (2603:10b6:8:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 04:10:30 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 04:10:30 +0000
Date: Sun, 10 Nov 2024 23:10:28 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] spec: add dtprobed.8 to filelist
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0432.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Message-ID:
 <CO1PR10MB4769D68261FFB75028C1E34EC2582@CO1PR10MB4769.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: fad94e45-a1b8-4629-2e11-08dd0206c7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SDuljrJz3ERcXEIc+tNj41fsd/bBWOW3OeLXsRgVmsMRx6o6PkUYCP375ETx?=
 =?us-ascii?Q?PgcwkwCnB781aDsMJgOXJTTyPtuQTRhLlVDG651pRF0Acfh5akSRtKJofkOi?=
 =?us-ascii?Q?dn7dD1rYmbF/cPs+Jp5PRKja5Qj4EPQAkeuH4t/I18KtdqZZ1JjSmVQbNuNT?=
 =?us-ascii?Q?kwStpuLEBOeb1Ryn377+vLmsVl/JatzXaeOyAKoLfIBHagea1J0KglLN54RT?=
 =?us-ascii?Q?Cz77Awx8hqRmOFzyi15UF0wMtHhgqzikDEi46OvC40wJ8vJWMCK9e9lGdq5u?=
 =?us-ascii?Q?tKPzPRLVZzrSLoXSGqr/DEqlZAPBNfnB70FxPFtJNfjmDVNVEMGDOYSUc8xy?=
 =?us-ascii?Q?+ZKWmiSx5FJVfmsatU6iJWQre4gcOF1foIVEboOdnsbptfMD7cgAInpzt2e1?=
 =?us-ascii?Q?yavbzvoG7piyKgjsHtCiYN82sQHRCZWCf4f4Jgz2lOAWkJTfhX9jcHOyBIEG?=
 =?us-ascii?Q?dchj2yVKX3CKaOoOWPwpqejBbxohJ++B/l9EE4bWg2/wmPTP92t9VsxLem8z?=
 =?us-ascii?Q?0YdIQZR3vz+qvGxNV9l9RbpRmEVpvJeoKtmD4owYGoGP6XXyKxQxwR3rF4QZ?=
 =?us-ascii?Q?0uyYw/reShBtTuDtkDAqgepC99qmG0kog6ZzjlCAYnAARgl48xZs+PMAO6+X?=
 =?us-ascii?Q?lKqV9TYiW5nQSEhj73FxCRq0f0YxRpBrRibTqHf+9yuhlXbMwKYSqRHNv9gD?=
 =?us-ascii?Q?W1kgHuc0GNh1eeS0KvspbzzzitdERFrHkMnLuHh4pG9KfM07X5uhCAX87nK8?=
 =?us-ascii?Q?BjGnabmonbGTH25P0rkDfuBF+K53SOCVkq9lkve/u6U5RH4OCwI7W2NPaDqu?=
 =?us-ascii?Q?cHTPsmDZbQnelYmWpus5ZQEAgRfzcLK4o2b0b2FoMAZ7qfA3jxAwj5UWcSnW?=
 =?us-ascii?Q?3IqLHfg41rp+SEmLYZz0jequc3gTvy02XI2ZYh9nEMwzePXk4KA7hOkvHYSU?=
 =?us-ascii?Q?eD74N9oQDgPZg4z4x0z0zfOL6fDPYarGSexVbB+3lKCyaC30Zaj0QV45UD9Q?=
 =?us-ascii?Q?9fAfZZDvIZpmclW0DqW3XEdBxFOhwQOgDn2b0kheoT1i+rFslQKwyP6H0KLz?=
 =?us-ascii?Q?HA5LS0Fcy5fmtqorlcLC1uaYnN3ijM+hYcsEGBYYR6FzEAmZgIag1Vpq58Ld?=
 =?us-ascii?Q?ZGFOSGX66k+C5LLPMTK506eDsx6AdkXX2ATsRM4GTbCenKe2WV70Fydsuc7S?=
 =?us-ascii?Q?0VcXBMkVJ1Ee07zVrF5QN9CEXprYansN19zFAUZwJ32Iy9sdLr8VMb10whr7?=
 =?us-ascii?Q?U1qq2QU60KnnIQWturY38I/ppMw0K2Trzx9CK9U7aKfQHRMJiNe4mDQqUYSX?=
 =?us-ascii?Q?jP9xAbJjXT8mM5V4MvNilZDh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d+a8PMNZNSvQzeVI3osRRLY2K4p64VBtWHQ47unyeARhyNivSMp13b5vcwni?=
 =?us-ascii?Q?RXb7GxAtT4h1IJuyBtPulJzyVKRqhGkOiZyHsm9HGXsOim9HN3orxt5+Bh0P?=
 =?us-ascii?Q?6Wv9s1eL0zoVJAGCcX0W5qX0UJR5/vYAfCiFtCRr8WRh7RBH9e5rlLzNzUIv?=
 =?us-ascii?Q?nfkMBEOyHEMD8RBDTeA2zUOoZko7AFH00jO3NBv9+QFDTKsW5VfykuW6Eak3?=
 =?us-ascii?Q?EfMy0TAPGl6OLu5dSZZ6x15mGLubaR0T1K5z/4pkPQeKJslZAF0zbqZdDPCe?=
 =?us-ascii?Q?HUGOkp+7B6OFuFrr/UeIkBWa1KDcikds2Fp1Mf/ODV+rklVMCBrQcYYJdsZe?=
 =?us-ascii?Q?FOQ5olXQF11Lm0KdFspPCcKOK+zfkeqK97+CYuc4j8a2XaoyXnzfH9EP8//0?=
 =?us-ascii?Q?AU1JZceakkK0BGsJws9Ui0yO2AdDYp6rDeabEVb2X6QWjM7hx0iqhPOrcUDq?=
 =?us-ascii?Q?cCD4gOLuvKXPg+TAM6S4QOvAFugWIoQLrhhUTdRgn284OjVtaZDaEvM9GJlb?=
 =?us-ascii?Q?8JgyY9PP86/RV7LLs+qt6Wi71faiH7i/IgR/gPh5UK9nMmDqsZdzLOrPOCo/?=
 =?us-ascii?Q?f4csIk3P8WrgFx/hI2M4t+CAqqRt6Y+zongB0kuDqqJLLzIyuqDE6jzM2hfT?=
 =?us-ascii?Q?9Ywcs6H+Bh0P81y3SD9v1CGHD0ynEA4pf++J/6DTZTLHmdWCJpXBLuRByXY5?=
 =?us-ascii?Q?96p494kLA+WGV7Qy2hAZtfJjtpKq7iM7BxeKMbB1aOjDEcPHjZNccx8MZbMy?=
 =?us-ascii?Q?qpYldCxdVzixShhcIlo39BgUuJV0gCYG2vflud56YmYYxWu2uZ1fv72IpG9V?=
 =?us-ascii?Q?jR/d4Ygga69cbMjfNPQJbfPodsqUkNP1YC7pWOxAqmgU2qbpK1s1nhUZhVYB?=
 =?us-ascii?Q?yLMhSsCmn7n10bPs3b6/e4dYDciyIau/NxZygxWuP1BIO7aBAGrNBjUQ1ctW?=
 =?us-ascii?Q?P71fwnR1PRAiwbfWcESCDbLyKIaD4wxXutgWx7TIXQYHw98I8dOh80k4K7Tq?=
 =?us-ascii?Q?VitUObxTNak4CH70H6wt6al8xZKKkCMAyxxHojwXEHbFKWcpt0btGehuKA8v?=
 =?us-ascii?Q?yDhof/dVQ3JcmxNYvdRgZiNZMTomaCJxJgwBGRRl3fm0QusFvjQRW9WTQld2?=
 =?us-ascii?Q?0oKKSUAu5n0EB7Sg7cKDqClPRdxkivKScF4gSeJl4yvoZaogAs3g0QjvQehS?=
 =?us-ascii?Q?CKWuKDfBrNdh/+TyC6kQMWFoa9yHW753H7Lb/RPXeHeApIWl+oQM89ONz0EU?=
 =?us-ascii?Q?uk3v5S95VKg5DwMXjJ0MqIdeq0J1E1FBc22taDL04UhhK4x3/mFNwNizwvYh?=
 =?us-ascii?Q?9Yrn3ieU+qXYnQJmsWYXkXar6bjRoB0SwWI6K4qBJvMmbXpBshbQKgqiPU1j?=
 =?us-ascii?Q?olctLkHylhErzRkQQ+RS4dDtwEqBpeth2IfjJkHLpkrCQ7quSg2+p//HbE3W?=
 =?us-ascii?Q?Di6HhNlAaqqwr2IJWc2hVWxN1IuSBQH8h9gLQV32yBQ+ji24ed0wYqdW5Ni3?=
 =?us-ascii?Q?RUmTYM1VyXs11yfqtI/rgAU/2IVnmrJbzT9yCODgSw1qBdparXY5c5ZDmv7g?=
 =?us-ascii?Q?/xISJba6iGR+UoMQAv4V6pNrUYK/SkL7hslP7HLCAkWaA+nTlftHvprQTfvU?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1gha0jekYPtnMs0UQ3j6a49rG/ymqus3EfIo7ahzXJJ+rJ/ZNT/NjoTPAYm9cw5dsdb0E0qB2wvmlLjKhmwky4BDhCBuYIdSKctxx+UK27qO0Ag9YiY62sMuUyz2MPtwPqLYY4c+bUzrEpVpCX1zeUI61aTdAQhpDr7IXNYz4Ex3vdFPTDJ1IJdR88Mx3SLyBAdXSgGzd+vIvynSM2pCXc9hLs+VHX88z3TyJA7qDDpxhEEQkER+E3JijGe2qTkQ1mo4CTzhkur+ZPgfI2G6WFMsPgBFx+POwqJEoq98Y3enTaZHI7ARANXF7NJjGi+uy2SXNX2f9jYVp4BCDcXVNCIf5/O7cWxFnI6Q5C25D8pf79VWYE4MpISExP8Qt4aFCLdDsrnQr6gGr9cgwiT8s0uTrwTL5ROaqLdOV66HkQNQrO/iblypQ/4E+EoeFnNUFN9w3C0GsQ8QwqqTiUetRoF1HLwLttUMDBFY8KheUBM9dmn5v6NE6ASpOzgBysMqiO3R4cV/zQgPPBUOffUWJpignXRFRHUMO6xKAvYRSOJe6hngnLAXRf+S2LVEh+8aFRo3lDv7CKU0X18O8lgDZSXE6exDnojICuflIKbHtgk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad94e45-a1b8-4629-2e11-08dd0206c7cb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 04:10:30.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyRr0Ee7EkE9mbREo7XjKLvw57rKlS020Mq7Lxn5RPhihq35iLK/KoIqiCRFqvzY8ZNyZdMpQdfVHJEqltxNiqUwbl7VGtWESughIWrWBMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-11_03,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411110033
X-Proofpoint-GUID: cMzfXKHG98K45J25WmnG6dQgFm1QWYIv
X-Proofpoint-ORIG-GUID: cMzfXKHG98K45J25WmnG6dQgFm1QWYIv

Commit 98e24727 "man: add manpage for dtprobed(8)" did not add the
manpage to the filelist in dtrace.spec as it should have.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dtrace.spec b/dtrace.spec
index c895426b..887bb69e 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -249,6 +249,7 @@ systemctl start dtprobed || :
 %{_datadir}/pkgconfig/dtrace.pc
 %{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
+%{_mandir}/man8/dtprobed.8.gz
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
 %{_unitdir}/dtrace-usdt.target
-- 
2.42.0

