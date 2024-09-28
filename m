Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E08920314
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490128; cv=fail; b=FiEUVHt8NeJgx+dZS5EEH23/oXp9VGozbS4f2E6v6SFv66hrKGpRuReoXMJeu8J/nGD6vXG/IEiE+awpSfl2JO+uNC1MIlIr85WEtDHQF04uiE9Dpjg+4EIPdl0+wfJxEuh8R3Nc6itgm51yTd/zeuqqv8n33Sb+Ij1QFoj9FKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490128; c=relaxed/simple;
	bh=WEznpoE70N33VdPlGYE1CylYAAXbsqsbD5X0NNpaPZE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GhrV0FVzruQKXBLAX/9f8LEl5sq0pNJsYqoBI0FFDaAZ2i3O9s/PlfKETiJDeBVf+xgMTBgjAvxydPqjnOHo2cvOwwfcnB6RpeUfzWwVcD4HkVlVE5Y4H1uVa6PiSmJmHJUx9lFPpjvbWMWVdhAanV7XEJ4OK4CRhFRlFZrk47g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UpLLI4S2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CLEJONdM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UpLLI4S2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CLEJONdM"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1iMeA019762
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=yZ9VaxuJlti4B5X3ZEEcq3R8S1oj2lV2fahgu0f205Q=; b=
	UpLLI4S2n/gJ1X7KG3dJsQS2tSmf7LYdTBxdpWhjWV+7J9GnakcnCDwmR+hghSpx
	1J4pPt+hrCyUf0TVXukJANlcmvDH7kQTjy/mt1GQBuzLUCYacb+FP1Mn9KQhGDFn
	AY3NjkSWLVNw61lNS6nty1MrWte3xvLEL/ogoyOKLpZXO55IiH6s6mW0dbY878z2
	UtWgEoYCEKnh/mSokNwrim95ftt3iFxTtXZOz0HeRtvKXAbhKRGqi3VaEgoO/zj5
	eocZlsj6qZ/jpvckJ1mQ13ZS3bUG/9CJC7i466pj5EVt28nFsAyQjFu8FeFf4ooa
	epw7sNQvWIYyDY8RwrZBjw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x8d180vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XFJA026326
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848ph2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdYqTLKJWZay1sJ4gVBGvXRJ9I1Bb/xn4qXfnwbCdULF3kftsHxQzMZs95owdYisCSV8VhVlFeN8BEOH/YS9B4Un4R3OYdz5N/NxK0jea0vJY38ZdRxodFBXQEQlmm3BAvU0yI38q7Z9tcG3Fkpz2BLA4hZT1pEunewakiV30ubRa+DFBdf8Gy6WWxBJvMn9QmavZnCutuewgc8F4dVv8N5NbZ04Rxnxdn8D2JzYPbAMUTy+W/45kOVaMDk7Jm717OKuPTgBjKJopeOF1yG/sXZIVZWt/+rIhbfdxg1c+GB+PcgcSwaEeYIoAvx2Zy0M9Z6rysPEs1ZsJhmRPB0R1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZ9VaxuJlti4B5X3ZEEcq3R8S1oj2lV2fahgu0f205Q=;
 b=QFLlGhQqmxUx199RjtkW97k9hS3D3EDIYUl1j1zrnUVV6I27U3aRleYIuNCY6R4CtIWYncVF9oHU9jBFXL/jtkG12SyvFwSHAPbJQEFNEKpzrkLld+V0tdSNvUa81lOr7O9lTXBzcBW95vKSB6zk7FnhsdTMfjiyVoXbKF5COlPUGyRmmHoFWlqqJKN1XGfFa3cVl9scQOyCPKnAxReTKsVtzogzvW3VmLvCe09L2fTmB7V7HesOHSPpS3OtnsKRwDY/kFtu0QJhwxApgntju8r7F1GePUajlFgfB2Zj8117H75QB8ak6fAUGLVHPwypjZXPMXalkL0dw6zhZCUmAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZ9VaxuJlti4B5X3ZEEcq3R8S1oj2lV2fahgu0f205Q=;
 b=CLEJONdMptWghd4znyfv7GyU+3F2EjtaXcQSw+nKQLmt0jh6ufAnBGCxxHBoMqQNL9v9L7F944kbkfqF4Ntq0obg58s5V7yBpacgkdJqu/gIJLHkmGXYl8V1soLGyBFWb4ctZlrFTqZriCljWkF4w6X/bihpgQstxnTx01+3BZw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:22:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:22:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/6] Deferred attach of underlying USDT probes
Date: Fri, 27 Sep 2024 22:21:53 -0400
Message-Id: <20240928022158.9206-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0692.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 084601c3-a69e-4a98-d518-08dcdf645693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RuKBiYIjQIJA4m3AnMUNialecBFimGrjt0nM+vHj67FaJ6d++gP8+L2XB9aY?=
 =?us-ascii?Q?vgFYbSs5wUPtlTo1lf+5WuA8lgCfXPsp0A6MLKdHSb0+SaGLAgdlauGbAH+i?=
 =?us-ascii?Q?hX8POKiUJy5sydJab7rFIEOzo+8vSXsKAGInWib8Tbo7g0LC0ddmlek5S2rF?=
 =?us-ascii?Q?A+8VUrX1zxT0h8CrNrLrAJPp9n9pY0PapTsHsTijFMp5uP/y82y9DB+da6Ur?=
 =?us-ascii?Q?1Ar7EIUSp8FVI4cMC5gpPC4p3+HVeK9n4JuhW5K71ROvE0ExBEt04hGrPfbq?=
 =?us-ascii?Q?gMpFBiKN1SS+2tmiJ8ZsjPl89p6Li8+o3CCBhFLMthwhlpXqHob1A0ZMrHVg?=
 =?us-ascii?Q?mKezJe2BnPGPW1FfxMq5139DuyCQzb6l2z7Ah0Ooc5KPb982zRpNsKxVF3Uo?=
 =?us-ascii?Q?nAg+Uc7z5DEFdebeRgh0t/FBwX+nLFWyjtz84PNWKpShCmOmgSbRs40CtIzL?=
 =?us-ascii?Q?LN6No9J7iUcE9V+CwJNB7CoLVUqN9lxma2IxlaEpru6t8Y+wg+frTJe6+pzV?=
 =?us-ascii?Q?6T8RyN0eHV4z0lHnzTITkduSwaHhCa5PVmHXeCAqf7FqQd0mtwq+L5hWeZm9?=
 =?us-ascii?Q?siwADUP2pcEpz4szZ1TORlPHN96eev91HFWpGHv6LTK70ntJWNNXjsKakmSr?=
 =?us-ascii?Q?rZ1X4spWwE6mE+Dwm6ekB9LW1YH58IG4ad+1Eu8O7J3utukZI+5gTtZjGyrl?=
 =?us-ascii?Q?JXDNmqLbvKD/A+QOqHIn1P0LPChBX+IowGwl4zligI6iCQXRbO4nh+KfqJqp?=
 =?us-ascii?Q?kXwLkhdyFmQK0mpkRBQo2msOBrHDrQAE8drQHrGUfGgPTUWWjCtv0Sils8bs?=
 =?us-ascii?Q?Z36Y54S0CuDJM2ykOkYIY+O6VtMHVX3+9Hp6Eb0E349UY2PX6WfMhT/+T6yU?=
 =?us-ascii?Q?Gs1i2HMEpPFfwGVNR6TnUkW3W7Q/VNxc4x0SKa7Nji1lDWoAF+AydiZMjXZm?=
 =?us-ascii?Q?rN/Th8yDL2QxzmkAQ8aCJyTRi79oPNjV8EIKE93svvXM7P8SX6WGnZzpR0Ai?=
 =?us-ascii?Q?2IGE9cLbSNdfkHjkcwpMUMiRylBPpJ569CZ59h9ZBkkuz6vkOgSrS6+RcOnm?=
 =?us-ascii?Q?L5IWVCkVOt7LLvUo7D4595eEaLgGGH2/StpG5NTM5TPS2+RaDYMJewYjKCgc?=
 =?us-ascii?Q?l2wxS+g4WJSgHZxONa8O8k2L03qo2/xKuNmjIAODkHiMsHp/oZFA2uxZGyUl?=
 =?us-ascii?Q?o4MZrUo3WXciDaiwmeYCvfQOn+eo4RPqnq21bF5So3oaU07VfdZB7h0wbZpf?=
 =?us-ascii?Q?ict2kZbsZ2CEtvrX6MsN46XJJmUHIv1FPRHsXnyJCQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8ASoCkIfxqrNwpfBBvBkY1qDHOt7uO+dLf7QP/GKp5oQyXt4/G9nqQfYG8wA?=
 =?us-ascii?Q?WFn6c39DWztNP6Or2/+CuKGJIzj2HDli7ueb8PXGPORdWf5C1zZpPyoPcR4H?=
 =?us-ascii?Q?PFvgUw3313i9EUmPNgaLDqkrmrMLJxGKoNtYSkcKrY+ewpmxBSuJE4d4GmAe?=
 =?us-ascii?Q?wSAiJ2d4Myp8X9/UY4u4jzqThd+C0UWrKLkHzLHsB1E2HV5DKILV4JqtNceb?=
 =?us-ascii?Q?XJI2fqBTrglkqEwimDj9Ous+u8eRGaM2ZlA5KDu954XmF3PAnJ8OqstNAptV?=
 =?us-ascii?Q?pZCbysNc1rvMDQNyJ5sGfV8RumquTLF/4zo4oaRAl84f2yoIGjbpSh7lssrp?=
 =?us-ascii?Q?YI/mD8M9KKKyiGYmkr/MgFLbC453c9EQn3j5mCRZh2i06Zh3iiFEOn0fQvib?=
 =?us-ascii?Q?B63XfUN7B0uhXQTsVEuscbMHkR3I8VUWy13+9D1jS8QbvyyGCEv6oLzctrdX?=
 =?us-ascii?Q?CMGeot74sQ48hc+8pouRjdFrTLL3BSX5DAhsi+0RJf+lHOJyaUBt6Kz8CZlt?=
 =?us-ascii?Q?xtGpLik2p9wAi24JTCsnxflpZGVKxAEdm1nr02acOiKi3Ox8lWCLrCe8bVdL?=
 =?us-ascii?Q?gR+c1c5TItIn2K6IOnF7wLKngvvkDVm3mrr1t3SfO8qcbjB5EMqEzvXh3SUw?=
 =?us-ascii?Q?FKeGfvwMJ4bWz/DRONg1qpGIyQQeGMCQ8Wc0QdWBg/r3Xw4RsEDBspsHa9e4?=
 =?us-ascii?Q?FUs6kCHJwMoALKF13lgnbZh5mIO9r4eJit5KVjgG8sr4iyGSr3dRa3OKLi38?=
 =?us-ascii?Q?U1zSDedl3pX6pwGUGpCEHMQGmLAGfF6YviVcSCci29FRe5CFSaMT4St00RlL?=
 =?us-ascii?Q?Yx4AxOSbSDU9UJKHN4ZAv6t5M3FpmB/vRIy2F83p5Mr98JRV10uGMpfCz+y6?=
 =?us-ascii?Q?m38saZTa1urNerE4w2nlYSkzTeAko6zYRabfSe0ekX0liAOpxZ3gKxSzRHwM?=
 =?us-ascii?Q?aP6F47Q4a4LjtjNRsas1+k3w3tn+ZbFNYuWqaRQp6F2AOglFRWyVBtwFbx9E?=
 =?us-ascii?Q?NSwJu2fSAomWiqZl/nL8o+n+ryVH7CBldMZop0xKFUOnii3whAq77Yi50YLq?=
 =?us-ascii?Q?Q7/HIdXPFq80gyTq0oWMD8LhTYaypBfM9MKi5bX08WRAa3xhvp0QDTJA9jwB?=
 =?us-ascii?Q?drFDV3dsWo+ug/11sGqJiNMXgBFcFXJuS0v+ItKykWb9ozVHVH3J9Qy9hIrW?=
 =?us-ascii?Q?O4YHIYINhVuEIvUDJiwQcecpHKnueCH9BdYw0zHmo3LfqOTuAZXaS6YuzSF6?=
 =?us-ascii?Q?utgHmY1s1dZaJmuDIzEKirImtf/D1wnKkJ8znGJqPc1FFBs9ZinU7FfQILdi?=
 =?us-ascii?Q?JXQYc6TFgtWoGVUwLEZVdmuyI3FY8UJsJv5ScFMgPqs/8/eBivT10ejRI9T1?=
 =?us-ascii?Q?W9RPsVJKASbKPjI6DEfRNSPfJ0DQlRK4K0hhX69pJFY6Ml5EJZ7Osnr0FNA2?=
 =?us-ascii?Q?VeSkVnZ9YsGJ1U+U3ZjQgkGMmokBo2WQ7wSqRXzlpqwwoS2L6d69QCf0V0Sk?=
 =?us-ascii?Q?PEJ77CxRPCQ5Q5CQ6otSSFUMw/rFAobwz1xWrzC5rIW6fygb6c+jEBmkFJI/?=
 =?us-ascii?Q?ulXBYNHxh5kkrE+GQY6EBqrzTqW0PgTyroKf0LCh?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NrISxZvIdB5C9QoPOXj6LvHqY0wUys9uEJRvHJEnU7WPo9ac2cRDT+iPwapNOaqw+dIaPHSO49VTGjZLKWIK32d3N4HfF+hYqb030j3ltTdoBSiJHHysgKYn+uLQN5xn2VnKn7NORSpYEs3QO4KEs54/Q77egEXu6vZhLHfKn5DM5thHzGJlaOHvWAqlhX1H3KicrT+9an7Wp36LlqF9DoAJy1A2KYqByNOpMASnkIWmrjuibzIj3OZaP8Sua5KK3spSL1TVi7G/hH6xrlraFXzZ3DJEsvjWfRIwhTTAsyIGblhHbo5li3uu9HEJDfpcds+ubtodeq5MTTfqEhZ/v5ChbvmySXIC5wjqfF9sn9nQdlueKdw4UxO1He70st81Yo3THoGSkv6IUjptqJS20JTrr3n5DVuDMLXp2A3CUi/fEXzJQsl2ER65Cj4qVQNeyty2G7XwUQqFISKFO31ZGEs0mWrgfWVxf+/zIWKHyRcEesLOvGBXN5F42sUBdENAs3EDx/L4c4QTpY/KGtryibQyNuWSe9f9iaPMkI49qnB1t9ApDF/Icqp3hoHSKX1Mu3EDUU5EA9o8SfxgUqnWHCH3u+uhp3g3z24zzJpwj3U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084601c3-a69e-4a98-d518-08dcdf645693
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:22:02.4336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFAnQhSifsid3HEm6jQsJeLAETH2efLD0ZpV7Sz2bPL+WXey7m/uItjUowFr4fjSNPMLDw2iD6dYARB2Zg9lUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409280015
X-Proofpoint-ORIG-GUID: A6ixFBcK43Lwrak9ZMgzr4qbMRw8nfFI
X-Proofpoint-GUID: A6ixFBcK43Lwrak9ZMgzr4qbMRw8nfFI

From: Eugene Loh <eugene.loh@oracle.com>

We would like dtrace to trace USDT processes that start
even after the dtrace session has been launched.  In that
case, the underlying probe cannot be attached when dtrace
starts up;  rather, the BPF program must be attached once
the USDT process has been detected.

Therefore:

*)  Make dt_bpf_load_prog() callable outside of dt_bpf.c.

*)  Have update_uprobe() call dt_construct(), dt_link(),
    dt_bpf_load_prog(), and attach() for any new underlying
    probes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c         |  2 +-
 libdtrace/dt_bpf.h         |  3 ++
 libdtrace/dt_prov_uprobe.c | 65 ++++++++++++++++++++++++++++++++++++--
 3 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 90881e398..ab97be2cf 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1134,7 +1134,7 @@ dt_bpf_reloc_prog(dtrace_hdl_t *dtp, const dtrace_difo_t *dp)
  *
  * Note that DTrace generates BPF programs that are licensed under the GPL.
  */
-static int
+int
 dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		 const dtrace_difo_t *dp, uint_t cflags)
 {
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5716d2320..115adfbf0 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -14,6 +14,7 @@
 #include <dtrace/difo.h>
 #include <dt_btf.h>
 #include <dt_impl.h>
+#include <dt_probe.h>
 
 struct dtrace_hdl;
 
@@ -88,6 +89,8 @@ extern int dt_bpf_prog_load(struct dtrace_hdl *, const struct dt_probe *prp,
 			    size_t sz);
 extern int dt_bpf_raw_tracepoint_open(const void *tp, int fd);
 extern int dt_bpf_make_progs(struct dtrace_hdl *, uint_t);
+extern int dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
+			    const dtrace_difo_t *dp, uint_t cflags);
 extern int dt_bpf_load_progs(struct dtrace_hdl *, uint_t);
 extern void dt_bpf_init(struct dtrace_hdl *dtp);
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cf0a95fba..8fda85532 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -309,6 +309,10 @@ static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
 	int		i, prid = dtp->dt_probe_id;
 	uint_t		old_strlen = dtp->dt_strlen;
 	dt_pcb_t	pcb;
+	dtrace_optval_t	dest_ok = DTRACEOPT_UNSET;
+
+	/* Determine whether destructive actions are okay. */
+	dtrace_getopt(dtp, "destructive", &dest_ok);
 
 	/* Clear stale pids. */
 	purge_BPFmap(dtp);
@@ -364,6 +368,61 @@ static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
 
 		prp_next = dt_list_next(prp);
 
+		/* Handle underlying probe. */
+		if (prp->prov->impl == &dt_uprobe) {
+			dtrace_difo_t   *dp;
+			int		cflags, fd, rc = -1;
+
+			/*
+			 * Strictly speaking, we want the value passed in to
+			 * dtrace_go().  In practice, its flags pertain to
+			 * compilation and disassembly, which at this stage
+			 * no longer interest us.
+			 */
+			cflags = 0;
+
+			/* Check if the probe is already set up. */
+			if (prp->difo)
+				continue;
+
+			/* Make program. */
+			dp = dt_construct(dtp, prp, cflags, NULL);
+			if (dp == NULL)
+				continue;        // FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
+			prp->difo = dp;
+
+			/* Load program. */
+			if (dt_link(dtp, prp, dp, NULL) == -1)
+				continue;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+			if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
+			    dest_ok == DTRACEOPT_UNSET)
+				return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+
+			fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
+			if (fd == -1)
+				continue;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+
+			if (prp->prov->impl->attach)
+				rc = prp->prov->impl->attach(dtp, prp, fd);
+
+			if (rc == -ENOTSUPP) {
+				char    *s;
+
+				close(fd);
+				if (asprintf(&s, "Failed to enable %s:%s:%s:%s",
+					      prp->desc->prv, prp->desc->mod,
+					      prp->desc->fun, prp->desc->prb) == -1)
+					return dt_set_errno(dtp, EDT_ENABLING_ERR);
+				dt_handle_rawerr(dtp, s);
+				free(s);
+			} else if (rc < 0) {
+				close(fd);
+				return dt_set_errno(dtp, EDT_ENABLING_ERR);
+			}
+
+			continue;
+		}
+
 		/* Make sure it is an overlying USDT probe. */
 		if (prp->prov->impl != &dt_usdt)
 			continue;
@@ -454,9 +513,11 @@ static int update_uprobe(dtrace_hdl_t *dtp, void *datap)
 				dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
 			} else if (val.prid != oval.prid || val.mask != oval.mask) {
 				/*
-				 * This can happen when two overlying probes map to the same underlying probe for the same pid.
-				 * E.g., pid:::entry and pid:::0, or pid:::$offset and usdt:::.
+				 * Two different USDT probes should never map to the same
+				 * underlying probe for the same pid.  Nor should the bit
+				 * mask ever change.
 				 */
+				assert(0);
 			} else {
 				/*
 				 * Nothing to do, it already is in the map.
-- 
2.43.5

