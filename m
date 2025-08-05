Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F690295D86
	for <dtrace@lists.linux.dev>; Tue,  5 Aug 2025 18:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754418758; cv=fail; b=dXzsysMIaZOA/3iW6mevyvsHcZNDTsUufQHHED8o0doTctVUp0/stdAnMEWas9x5HBQnj53TsIwnW7/iS4cBiumWDfQ8DPXUSZnLKFuSQJjpxdFAKty4F6fhABjQCm3DbVsTEfgj3ldQPyAFieN7JYQpz1RcfDRvZgsBG4iRVZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754418758; c=relaxed/simple;
	bh=S5HPbi4TbuA8CR96oHl/NNVqjtSZf1q13XwNfhtw0Fg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ipZTQSuKQDBSjSru3IsPX5kdfyIv2ANhtwg0mWa4tBHaKa+qIExNd/stglLIz0ul0b57GBn7XPMAw61U4R5m9OD9L7J9ePsZAoIN3Q7Qlu5YFYEA79Acr07TXk1AtCvYBuw9EQfkNnUsKBemtH3fMX+dZhu0N8nvgFNTBcMpcvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ahMq5by0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qKPPYLO8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ahMq5by0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qKPPYLO8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575ISqMU004934
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=SmBzi1YAFPulhHlWNeYWUJ0Omquk8J+lWmEJ0ATyefE=; b=
	ahMq5by001YoLjxwOJytQ7RHzk57GcHlkdMZvp6XOJm7nKBg962/WkObUS+sV38x
	bxkCyVWy+6ba7Yikndtb0LOlZuNdOAQhQjAPUhcN3vE9fQT24OiRuf7ncqQm/vZe
	+eSqRM9JHH4fZX4SsKrEnr6dJFXk/3w6bqSdtbuvU25XlH9wbYdkRXbubcJpnvmm
	vEp+EVQm8akmXdQ7dUSBdXa1qYDreWkhj+xiAyFQ7zSn4nnjYt3/WuXgdTBrLe9j
	8wou6uNUAkNn92065EcUo1sszbVVrwse0Ej8sriUoNYmcdI+p4/vFY0uISYGL5Ca
	GEQMH9QzkzKp7GiSRFUHIA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpve01th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:32:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 575I4mwR008042
	for <dtrace@lists.linux.dev>; Tue, 5 Aug 2025 18:32:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpww0y4r-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Aug 2025 18:32:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PoeX0XKGlsDOAZKKK56izcyTZCjh2/dOtvx6fYL+Uyw5FJGAhjQePU9hln5J3bCzqj5QsOZRmxZlN116ViTFULC1lECOk6NsbQEmd7bUmyw3fNeBTi0zwz3VJG5BzPJ3+BXPRiuggzKNV6JcVtGHcnPBhd3i5HSOGN2C9B1fZKbZLWz337pHpbVTqpYp1cHg13z70jeetYPMR3FZf6/TI4oxmOXy3muTHsamVEz9kyuqnZJsAP1yltew26PLSHCkqkGuQDDbe5kUm+OfPNrhCTfyVWka5a4sgUdzMMOghP0/RykrvT3woSOnB6/eqlfW22Oj3aU+6dSTaFRhDTlM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmBzi1YAFPulhHlWNeYWUJ0Omquk8J+lWmEJ0ATyefE=;
 b=U99414xH7nJhVgPcalSZNhKwr1kxv0tabNnjn3pVe7WTZ3OlTVDVTcCVDLeMvafQccJ9MFXieaWdfU0X+bCbZ5xxHkCVq046mOMRBus+j5m+AX4cDAuCCY82VbP/JZT6JHO5YSCLPLkyuCBnOn1sTKe9XD09rkX7ZvOa3pty+HC+D0CyfvOQnRNTseBVsz3wcvhdTYv13zkenbzY4jD0XZFiPKIUzz/zqJGLWsyWpYYDA3JP1lCTX4LeU5JlMvDLlo0YUjGaEAnE7bedj9YCTUWWP3IuVxcqwneGLfV0V/9X/yS1hOKrUTPsHaLY366GJ6GA2zavSBdXv0yyr+MdUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmBzi1YAFPulhHlWNeYWUJ0Omquk8J+lWmEJ0ATyefE=;
 b=qKPPYLO8tSTTo0bqZ2zcWvyH65Lx1jjbiqDDglcp42LPqhBsL5JWESfoAtpvAsdd22mtXXOFcILLKDZ3WjpuyRNMFnnpqJMHFHfrQDf23aOH/E/mYtns1+rNj6KrVowiM9QvYV2K25/MA6ESf8XdAoZy1qzFGJFLXZlwnYfSysQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6313.namprd10.prod.outlook.com (2603:10b6:510:1cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 18:32:30 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Tue, 5 Aug 2025
 18:32:30 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Remove errant debug statement
Date: Tue,  5 Aug 2025 14:32:25 -0400
Message-Id: <20250805183225.18130-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0689.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d10e45c-5068-461f-0004-08ddd44e6f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p6ICC4tdqN+zuj0Q1ssQtuQm8ZS+0fK+X89P+Duv+yj4/ZnIeIM0o0ttltI1?=
 =?us-ascii?Q?HTIYNYP6Ss1vr+W9xxwWexLsU/PD9C5kiC8d5iLNt64mnH6t7SYJqs+qf9dP?=
 =?us-ascii?Q?thXy7TCP1R8ygFinH3cnsZHROaTt5uL2FZ4GLwb0s9NLiRUc8ISC7Lfe+rrK?=
 =?us-ascii?Q?wWsxZorY09W0C4O1Q9QI6lPaMlzlPm6vOfHpzffCZ4Gm8GmyIDteCiRVXVK4?=
 =?us-ascii?Q?mrihEDvCvawLqjpqfWxbuMfDnSUxnaZBA4XK3ij1Aqc4zyPdMhLmCNOuFz2t?=
 =?us-ascii?Q?oPFVOcHiV3xqov2HEgSLE9mtHTtn0ni9fQhZTBYvPdXJEkcmJHOdIaX8+E/o?=
 =?us-ascii?Q?oyWsXmSAyOG6YJQWs2d5kUj+sQ3EPFWmrjx+qE6U29uT2Z0fiJpOsQc2e5ql?=
 =?us-ascii?Q?M2awxNsFYaRmKTmy1SKrAnWNbMdpHrxaQlHl7fwvyt+NLQ+zBI6SqSVxG3uh?=
 =?us-ascii?Q?BJEIWTxR7oKv1rXxvGAYnrJ+k75Azo91fVl5zZ1Ei8yNZq3hv0VntbUwenYQ?=
 =?us-ascii?Q?hngiJoacXIuDML1um+Yces4ObHo9JqLvXFusH58ZZr+bgSsfGQ/Fd/NQbnnx?=
 =?us-ascii?Q?rUBz6wOoesk3l4ml+I/5G7/wL/kS0EgpfZkbYbjZTz1Y0nW3duhjGyTWLKyN?=
 =?us-ascii?Q?tHJIMok8KgSoqVYOrGNsFoHUPCcJr1aByfMl/JHpjeS1gPrmCLFa+IxeY7b3?=
 =?us-ascii?Q?19Yni/xpzhYCJ7iv1yGZI3bSgDxREfjKNPvtqAxOY3ATIZOjyvClygyxThQg?=
 =?us-ascii?Q?CfCyGeG8PmTrIZOsJjAj//q1lHU93PD3ZhHmBExIiqjb8nvUdNRCXHdkQt+b?=
 =?us-ascii?Q?kk6bnsoPyIvButq82OiLr9M5GyWQFZHnerqofg+/sRUfE0s2IE6VwRKeDOfw?=
 =?us-ascii?Q?eDxT998yGftOn5JrZ6xHgQM+/+XszYAESRd50LpgjZ1FrLBk+5GaaHpFDZeu?=
 =?us-ascii?Q?Rto841RZ1llNRguB/EGiWNoDXaQKa9dBVV8jtjbD6MrBeefUPiMa0dyUcnNL?=
 =?us-ascii?Q?RqpYoc8Zzk3Ai5JnhdLxRGTJO0gDqh2y1d+ibJBRicsM6D2zmz6DI9i4nKZG?=
 =?us-ascii?Q?jE1vnStlQsFLs5BkrJtPYYqoMTraxk50y+K6md1FcEJLBhcQ/1mhp1v2wNrv?=
 =?us-ascii?Q?xQjJmScRiQVOeB1TI+w28eS2XgLJAf/RiZ2CQ3TfT/RdqvyScUN/F/XscyRr?=
 =?us-ascii?Q?6sb6Q+/q+YqSmuqYGDrO/qMN+5/cHSkc1IXNpu8Q2JVgyBdDyflGG++51sPU?=
 =?us-ascii?Q?zvvmRKg+vYFpVqXmxeQkUDzvY3btlt0GmE+tfDbHvEMBlojDZOYA7rZCuADG?=
 =?us-ascii?Q?7+vNisSLvBynhuoy1iWHS3JOMNX1MgzzzHgj7FMNfToIaIALYMsZN2V4bQbH?=
 =?us-ascii?Q?DXbv9IJRLXU7h1VILyJ1ZlS1A5RXXMnds9kH6SKNJKMKg5W0YmGhwoTNzqz6?=
 =?us-ascii?Q?M0zLediN3Ns=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dhqIM15au2hNuWSiichZEFH9ulNJx+eVRue/TwkMMeZwh7fXbYNVKYD+IN2W?=
 =?us-ascii?Q?P3t2ge8QiksKnswgsOoLYAnk2diJhCzW7njp34DunzQ2ltYpLfGfQNUZG4Sw?=
 =?us-ascii?Q?aPfPxWPfRq9u/57/CVotvq5ozygqC94V+WJnlkYVxR7JASsQPxWA5li/slEf?=
 =?us-ascii?Q?OM/I3usTInOYoe1yB9S5Tb1fPIz3RQh2UrfZe5wUq5WYDigKrKPcfTq24+1V?=
 =?us-ascii?Q?RdVa9JA7VqkMRIbejfJeruX5VA36A6IdlfoV2ZTifInVsrtgNvaT02P7mMk0?=
 =?us-ascii?Q?Cbo++FZwjfhV8tcQYQeNGtoaj+m4sPvM791GFGHdb45K/acNhHyF8SiFrToU?=
 =?us-ascii?Q?mssRECpteT2OEWAUXwA/CV7zCEQC3ntjBlsL1lnWW9p556CeKHmfLOgmLMht?=
 =?us-ascii?Q?mQA4xYmS29NIrhmFkQSzz+1RXvFY0voyUO2L50sMZEs6Qt5ej+7OT5CpFP6B?=
 =?us-ascii?Q?9MQN1LhCUY5IUgNxfBXUxbCYqVtIASUuzi2K+7Sn7due7cVAjV0dmQAMSnCX?=
 =?us-ascii?Q?fGipXoVGyIIHCzyT8ZYDmg0zZXzVPILhKlLOCjXzQf5GXsGVL5+FL6627t0z?=
 =?us-ascii?Q?4L05emzMCpfY0sMwCa0hBs+M2+x6jOlhmfZLty12DUgvwP1QBzqCYYUQNjc9?=
 =?us-ascii?Q?DXBsfwDZj4+EnRZV3PtUtcXBfzBTYStszpB8bHnOtCI5/2AdnZxdsLXyHvco?=
 =?us-ascii?Q?jXpNCsh41l711Qz+hjt7cjUrY9B3pWasH681JfQk8VzWuHwz33hgqy23g/eE?=
 =?us-ascii?Q?hMRu1/oGBPAMk/1FUdAMQ7GaWr2gIpalt59kNCCZ6/pYv8j0NqMCq/4Rc9Tn?=
 =?us-ascii?Q?TG37ulFAdbHp0keS3NmDUxWzxoIAfAyJ7mj9sLPSlmDp1oXRhLcSNKtXE05f?=
 =?us-ascii?Q?Kskmbm40pjsAUghVIc20er+QnutblYL5FzRbSA3sQFKGUi2A6V81lVi3AlXG?=
 =?us-ascii?Q?97gcLmZjsQhKl+74hUMe5KXH/Etg33UDRZyX/v6/mcYmmhKc0e3uUw+BxZ5R?=
 =?us-ascii?Q?euSiMjPObzRAlcdMp0MeK9meNT3q1E5lLJVcRBGsT07BfvSQhqkQZ7qJ/M+z?=
 =?us-ascii?Q?Zv+IH4hhY/dBSRAGjgmD8GpTtggO+oVj43vz+D2Mm+wEa+2YESafJqa2MSKp?=
 =?us-ascii?Q?PkYQXmzNfibOt/KI8uKSPfHnPsUJ0haBzS60GMclTweJj2JNBdq6Lx/k1kFr?=
 =?us-ascii?Q?evmL0LTdVa2TaFyWrP2QYHAn22PrUvNU9Q93RIAm7btBqJn45px92jfItupI?=
 =?us-ascii?Q?mgDHpcv8/75ujRUg8k7LpqSzFjpcimk3HKoxcNFmzgVMQ6mYnoXnCuwCfD6C?=
 =?us-ascii?Q?HZdHEqrUKISKxXwp8E5cvYPtpdooqAr6nlwgtadc6m6mwMuDjZ7Um/7lyv8d?=
 =?us-ascii?Q?TNo4ziBWT+fRkMjBzjg49yiT2TyJMoEdb7/mMRsZaiNgWu32/sjGj5cQy98o?=
 =?us-ascii?Q?mFmCdOUr+w3qljq0wuAZ+1VFbzwmWTxsiNuIDoKf2g5kkIMKUKiBYrC2L06m?=
 =?us-ascii?Q?JgaEUoUC/M/yrFZCjZ0gaAAe0DilmKJil4sB6/Jay6Zrw9pzhs3NiTQzWQa0?=
 =?us-ascii?Q?qYk/DoigTyxGF+iUDbC/8lw1gaQYQ/bGdm0fv+dY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	at7ki0OCRKay/JMPvNX3PaKck1Cc2xvijKChLl5UCyi3wqviq8gOC2KGiNqFpv6yY0W/zhGivI2lJNegrvCtbcrg2x4QQv4yvj/imXnpBxtYtKcmO7ukVvWqu2gql357oGCqvuIkFAYKs8whIbbvTAnJ0kTwH/fgXi3ii/0dFEveUfDmvikq4gQobwsEYZe+cbZQgQTnwkILKo99JrRcAk40vp6l8hQn/0AwQp4dZ8OXK+Z31wTLy/AFuJJYtymck2N6TxGvjrQGJU7loS4bTY8cg6oF6anRJfEcn+Ccc0XBSfOkh6GDrqVbLbuY9JquHTCOjTLCekNt1gHyHEWpZAJrAf768HnrIZYTMNfqdm9RtPqjb2GYByARRi5zUs6ghLsAGsPQc3MmO2eLUU7SgVP7W9hgOSnl7GR7ELJgzRupf4hzEGVsU9U9zUszUjrQMu/pCVSabgoKWfvUE9OXLSEBV6gVA53oWPvWT1vMcB5gywg6Sup8LK3qEkdHvzqZeW5o+CfGK3lZXMqTslyF2UDLgg3FpS29dTBsqvhGVOWk4N7Pvch2pYX10pBVhX5xVnY2SbTlmmJWPYNC6zAzl9IGiwuDj5G6JitNtSoQxDc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d10e45c-5068-461f-0004-08ddd44e6f63
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 18:32:30.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fL1TPSoCpk84R5Dght+qZKl6C5BvdNBCsf4ZZXnSgt+ZAdhyZjGu8lEAoxasjRE1LvqpOdf4BCssZkzrChMcFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6313
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508050130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEzMCBTYWx0ZWRfX+aPYf2JCBDZO
 oKklVLlxWdCGngbTZFTHkgjKMn09P5c9d/ch7on6PWOmNKtfNtNuO+cgLqzOrvZWc1IQnKRzI1N
 amVS7conHKjLGVRwNlTevArPoe+IHGvxJ1z6xSHfbklwScQjEftSDIPTEwVvqsbjF4lGq3mUwcT
 sreMu/tshlFgoLR6yBgQZ1d5eF00Va3nkDrwmaRztXKSw7FbPfWZWJjerCmlkbxotg8EpkxViw/
 KOGRE5UgwemNbEDL2oTVAOW/A3dnYYYegWzEj55xFloVf6w9xOfUTQ0j91f4t86vuhxUOs9Ft3n
 FSTJLYUtFx3h+jmCeAcC8rq5HXMM+0SW7x7tyo3DAtf17G9aSo8INOUPwE9q5i1CfAmizgo0Dyj
 McH9QE4dZDUqpzQTWqGE4FlnPzvh5u6hSybfbHdP3u58rPo9qsTeGrB4pUB3NZ50mUMAUYsr
X-Authority-Analysis: v=2.4 cv=ApPu3P9P c=1 sm=1 tr=0 ts=68924e42 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=BkdDMynhimL6Mw5XEKAA:9 cc=ntf
 awl=host:12065
X-Proofpoint-ORIG-GUID: HMDj0yxAoHnCpvxZhJZDoNZPuMlaGQZ8
X-Proofpoint-GUID: HMDj0yxAoHnCpvxZhJZDoNZPuMlaGQZ8

From: Eugene Loh <eugene.loh@oracle.com>

In commit e7eaa6216
("test: sdt:task::task_rename takes only 4 args on newer kernels"),
a debug statement was apparently added and left in, causing mismatch
with the .r results file.  Remove the statement.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/disasm/tst.vartab-bvar.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
index 875512989..e7e15fd51 100755
--- a/test/unittest/disasm/tst.vartab-bvar.sh
+++ b/test/unittest/disasm/tst.vartab-bvar.sh
@@ -59,7 +59,6 @@ sdt:task::task_rename
 	exit(0);
 }
 ' 2>&1 | gawk '
-{ print; }
 BEGIN {
 	rc = 1;
 }
-- 
2.43.5

