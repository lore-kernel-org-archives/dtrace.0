Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558FB7581F
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909193; cv=fail; b=eeoqEONoP948AbNj7fcKVg9wDQ8/OsDxUZT1G6tMXl80JEQ0Sx+0ppgyx+ZrV54g8pJGxnQUbQE7J6FeEev/Swo16qF9y9PN7T1bKs0azq0zyin+GIKtZq75sSLkiky6VTNTSsZif51AUbI7rZCNq69NVR+QpzaF9lEAwDqpb+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909193; c=relaxed/simple;
	bh=1K/mWdqCEGKNdCBzw7Tg/7EaQjY+SpwN7GnA9K9jit4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lg86ZVb3zKuoNKOtiNgc0MpbVkYv76gZ6z8E2szXFbOIWTT/01PX1qNQjyhH+wxEObHCpb4Mnd8xYQQ4LLBTAviH4yy39muXzQFkuGWt1ohIxCEIt4x7kCfyW+tbKdwJm5eqP+wGUoKCX6O5Sk6W0XlHjIEFawS7sOHLfoeHS3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VQSKIPw1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=swxe+tK5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VQSKIPw1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="swxe+tK5"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fsmf032708
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=4EQoJYgFMQg3hC
	lkpsi2GcOwzS+SffTzGCKj/v/ASfg=; b=VQSKIPw18jSGarIT8NGw70YR7zR9yX
	fgkOcczzqaH9gwB82f0Mi4fYuys+DoUpZ3h+YI6AtuGr48B50PhWI7+gYJBR9zmo
	CPAu+4CykjC6VSM8UW4v/CLPhMATXazY/lq77JFf97A9nIm/Ce8kYRPsQKpM6s0R
	/mltDdGxRuWUncPd2kwjFSCKHJEOkM2sgFSyFditaET5bXN8yaV4whOZBYi++VvB
	b6I6eY6ep24Pn4vKrMM83ht+V0uX4aEmeDwcSTuNkSq6WwIkHFBafDQEAJObaL1v
	Qiqrw772G7rg9sPkv7vDXsRthPvlUfIgUdA221JqquBuOGpp+bkYlVoQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukuba8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5F4dx034714
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfp7n-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTLlPnqeEcrw30WUHuNb45gR35rTvRNxu3Xt9uyRMy/CI3Q42v78XGtmsa1bS8BeTL4hCF9DkIwJ+FM6CNMJ4RoPLLDH9cQyqgzU/ZKFLvwO4ZnejUbg3cwBHy3BmpZKQ5aWrAI7NKLuCAqJ0iPApplcL3q93x9YWJeo6oi3chVHPfVb97Y1s4QOfhUdLLQu9GIDJ+UdKtfZ4HvOLgTd3mznco88DzbDV8xXWktDECtwKYRXQ2FQzNR0bw8H9dWX1NTEgKv/iPJ59kzmDeOTC5K1HLvyI5AARxIiUe+nrDXiT8ZK9azgTwQOBf3r31mjGyTrv15t41kbjg6Vm+SlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4EQoJYgFMQg3hClkpsi2GcOwzS+SffTzGCKj/v/ASfg=;
 b=HwZdOvgKvMbLYF+pcbKVwRzQZ8h+50TYWv+Sr1jkCgfcrwFm/yQGJv0vG1kXBVyMLCP9TqzIsKaoJ4CLeMK+h2EvQ0ijJSpnOOTygyygbTD24gjYkHIiiu8PLxv9+8bH8xowyQvh1im6NIDdicanOqL8nPqW+ertYrWnTwG3PD5I0ALt6Aa3HvpiCXHx0a18z6s+RjrovOMCVrV2guok8YeGidwZGiYwkLrP00oX8ZnngYpwiwV9N4tyYh5OcOmtFNuexsLUYK8XAQTvIRFFqAk9XlKoDTBvzna04o027vbCMyX2Z7R9+nCLCb6jbneZeiLyB4VZ9iFkPpjOjHAO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4EQoJYgFMQg3hClkpsi2GcOwzS+SffTzGCKj/v/ASfg=;
 b=swxe+tK5NZBIZKkUmoGoBQjnka/H8vyLgaUh29TNFK21nIgUSfwNhOh0rjCbuC5HAs9BeC8eN2Gzthc3qMEF64MlGThtCu17mTXc3emZwxz4GYntaVkGvBxpBpFzWX5UaQ4c9wbYpO8vKXtT3u6wjSGwhq3t/Gd0KMyglWdSvqE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 12/19] Increase size of BPF probes map
Date: Thu, 29 Aug 2024 01:25:51 -0400
Message-Id: <20240829052558.3525-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 427013f9-669f-492e-615c-08dcc7eb220d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4AVR5gcKCgV0jMOmmh/rB2F7MqEqwBM7chphgEGGrLO9WAM7MldUTNuwpNW2?=
 =?us-ascii?Q?Q6RmdEGU64H6KOlfQP4BRnt6fHv6yi0ylShWrfkOL+nf4nb7PH1xxOos7PC4?=
 =?us-ascii?Q?uswimAZwTO5KRqSgzKRhP9iFzmxcsC7rRoVK0im/axDdMukSNNdqpWeELlRM?=
 =?us-ascii?Q?fw96RIpqRi2g3O91WFdWQgYGWjHOf73Tiru29M9Dn92lGbTxwLkbO6XsZPDy?=
 =?us-ascii?Q?YoMRphCc7+MpfxTPxRMUjwJr09MNbnpj0mO4aDHMJvYQ3aNLXYIqwobRroCh?=
 =?us-ascii?Q?lleK8az/LXal20m4PDI+pedegoeyZ6qfZxVsa73u1YF7gyze+iBuHfu0Idvc?=
 =?us-ascii?Q?ZZbVv+2WwuUFn3iRAUDfm3ctkSogKCkGjc9a0L5Wlw5ghgpV9Qpnv/DhTNaf?=
 =?us-ascii?Q?l4aeVMUicp8ujxVEzlP78d5+4mOWMAUNjUfWJ79g35z0r3YAh5cXEGUsS7Ac?=
 =?us-ascii?Q?YhaIyhOHfHm0Altf+do4p4eH5kOgavon5PYjQ0Ccf9Pq7wfjhyWhpqEtoYiJ?=
 =?us-ascii?Q?lP9D0usEwTOsI1/dk9LqS7dFF4SVWdmp1eEBL8qou3kjDWjRFr7u6PkIIw0m?=
 =?us-ascii?Q?kUtVZ4M3J/zySisUOL2qy0mLm8XG5Nh1z8C6uN3tUa7ZBGcbdPtW8fXn8l8K?=
 =?us-ascii?Q?BwlXQSCV8vpzEW8jmiUmm7UmttueAIqtc9V+vudx/tnqe3pH0MjAJzSTxdBH?=
 =?us-ascii?Q?XC4daiBalsSQ0p9uh1lWNjbTnbzJCx9fTXdUdHGOmZkrldO3tnksczpemC7t?=
 =?us-ascii?Q?uvvTqep0VsQw92gjRhNFLvZ2SnZSOFISk6mJEVuloYpFIvdRyFlQ5qQqe5gn?=
 =?us-ascii?Q?ZJq+UqlTbpsj19fLvCUhZsFkGJDV4NdJ8/v1zAB3dzTQo6fShTUD8jhpMrM1?=
 =?us-ascii?Q?uzXz7lO32zLcL7//8p9quPXW9b3Ea4de3TXRUF1whM5PFah/g233P+i7jX7I?=
 =?us-ascii?Q?2QBAWjGeIhO1yUWLDJ/95gCeXaMmuBxWRZZaR4tj2WbVMfuuAep3WOu5m08n?=
 =?us-ascii?Q?u7lnMeE/Gv2DjLp8LxDV3e333T27fuZo5h4EplZEABYmKfrTRVoxx/Isn/SM?=
 =?us-ascii?Q?oOSDEvQ/E3MWilCyCIcrD7QcDYBd7EsxmeUcFnIKkCyVmN/jMtWA1DIuttGv?=
 =?us-ascii?Q?zD+NJNckx5lWtAAZp3t1qfrX7R3f4k/KZpH1VoLQdTvPuAyjAun1xbrSOpmP?=
 =?us-ascii?Q?S3bdH/p9hXsPfi9QVZp4NiyHxrIfnV4PzqL9kZZ9XYd8zJT7OpvqyzJ4GBvH?=
 =?us-ascii?Q?2W8V1YDNsopG8kV2xAMMI4u3VpKCOrthrhlDYoJURlCRygrCn0JrRSJVIYhK?=
 =?us-ascii?Q?Ee3y3MhOkXFqV1+7AVNK6KgIVdzZ4Okaj82oRKBlt9w+5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DUz/xXZ2FfRHPYJyou7L1KGB9f/qhxqjPthJiDl2T52bEmHzAQ8OEESoLpoH?=
 =?us-ascii?Q?S0CFMCGbzTwIi2q8EPow/SwwUzN6RGk3iTjwVg3p2F/JJlIJeJfRHl4aLDso?=
 =?us-ascii?Q?UbSWOKP2EA11buMs77LNKdnzK+/2JyETx8MX/jntB9+yJcYH5IRadAfBRTvo?=
 =?us-ascii?Q?LGm20KWzQlSFgWXmqiy+TVcq/t71kergsBMpLHpWUrzCw5B+Om03ShjlD43x?=
 =?us-ascii?Q?PU6zZuTQk7NYuZGKJd8klxDe3G5eLz07psZhrv1q6l9zTWFPp7choXEcdZzq?=
 =?us-ascii?Q?dOg8cHmIUg/5fr9c305aUP3gFNqCjl8RWnGTeamTANHM3k62KnKkv2pg2A/z?=
 =?us-ascii?Q?V25ZdYokhtIthAoEwx9A3sM+EFnxbpXFm6fha2t9baat8BZDwZW2hzbA5Izi?=
 =?us-ascii?Q?2hkWFEWv+YRMGWgfk4XMTyjq5LCtF0h/Ilquu2TMbDkObHQxVFrx8n0QCSAq?=
 =?us-ascii?Q?6zviV2dOpBRedCR5ePyXdLuZLz7PaCYkZafdo17oJz4hf9gJfxRv0ElmwJ2f?=
 =?us-ascii?Q?e9ryxAHR2/Lv/ZB7SEbsc8PXj2RGvO03ROWEGEvYw/RxSM0zS+oEkJYX4KeH?=
 =?us-ascii?Q?ysVtPwCaHeWBvgXdQa7zZRGyNt7bGxobGTgk0XawDj70RhpPXdInq8wo7acF?=
 =?us-ascii?Q?KYvgEs7QDNbkCuTMjsPr2fV40ezR/MBt9XlwE+g4dUTCYyjETzVd4XNCj1Jv?=
 =?us-ascii?Q?qSzOwbQefEju4UR/DEPR/IWNuS/6Ktnowz4rcYOcvu2D3AD1T3F4bH8XJ8cg?=
 =?us-ascii?Q?LnCEh8C+zNcJ/YyKAb7LzWt07OGV6FHc4x8a6xjQHVkXC28PVrC52pb+jEJW?=
 =?us-ascii?Q?20VZ9wL5LNPdHkl8KNOmBkzJojV7/oOmgbH6wsPP1ow2PhfxnhFkNKXceJvR?=
 =?us-ascii?Q?uF/6gDch3p+OGAHmOsNKsgytS4DWgXfAWcaHWLlWC+OiXhLYSMDGKjads8hs?=
 =?us-ascii?Q?MjcGr0EUDEA2AUy8FH4GabNYbjjCNrgmeIgo+yZ7h6DPbYLTYnAblToamI2b?=
 =?us-ascii?Q?dA3Ls5ST1TRAo8OshkIadm/Eb0t2T86Hnme2MzbSwshSjSMXUmurFusakVKO?=
 =?us-ascii?Q?mMrwy49uKzLdZDjBPOddk+DWAEXbg23TGUY0/6b0ix38olWSyAELl3+vZcxx?=
 =?us-ascii?Q?JmHpnqL1FvXq8Ou1qgE1D2jEmBbp9NbFvLu1GW+TlflmeWH/9r2Au0WDxMY+?=
 =?us-ascii?Q?vs6o1iyGsWr06ohho1mQrIAsaaLG5ea255l3tiUOjjgjQd/uA/3qX1sBQMhz?=
 =?us-ascii?Q?LANAN5MiTsTzcVz5gRVhcgyHyR3YbQP73HEgDEGur0g9Nj91soeGQJErgYSF?=
 =?us-ascii?Q?IiVULawlR0AIKiwqTMovqm4gjZAvpluA/xaUa45zd6LmWgROcBtx9gpBO4of?=
 =?us-ascii?Q?IniBoa2pYj99sEktCnR2olr7wPiHzmpYdl0DmHCre1Lq6SYLzx2vYub1S6vO?=
 =?us-ascii?Q?RuNDu9RayA507z94l0w3tUXoUl8YkTv94lfraX5gmgjsl2suhMtipzO+aNqg?=
 =?us-ascii?Q?7qJDG79LwTObQT9qVg9S45fJ+7/gOgc376xpBFHSDM9ZIO16IemrsYJM3TlX?=
 =?us-ascii?Q?Be+lyaiYbUK+vxOx9jtFRVU4+YDjlB/6Bxv/zAqY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fVKNN5Yl2kbNxohwhz5eWW+msv1KIAffcNwXyB+kPgXvWS/tYTyzHl81OyrmyAStxN4vzelgHA7MFFc2SnfF+ryB8IVd+1N3hqTmEBsiZ+0HytQmHucDx4y88fcDsoc6DrfFm72xfdFs+Mas7QRyH4IP7EP966/k8g8K6GQ73VgJBjDpn70dxuAH23ABEs7Xv8upLv5oyBgFUAgEenPMZJPTxQOULYk+GtCYUlZ3d3LrmxVVkWStoD2Zp5+L/ijFdsoIcKPS8LIiTTWftKpCleHu/yBNmyCzeOXcnzinm5768FFS0xICmwjHK29s2oB8sKQXp6SanlnF6Fyjjyz2tpAUXg6Fhbrr5vcks7np+KMcXwqfQg1ycCyOjdfEdHkQPFsR3Ezq3xgdqczy/1wRSoQIgJwAYR9/uJOiKqnUzDiCpbEitQ7u0VKOeUZlUsYPvVdRIVbLwXlwYYE73tMiv+SXEVKdGhiq4xtNwnvMlde1dYCaYEDhVShmZQiAYgip8ja1PJ4T6QOGa7g7HIbpEl56XxlQxcfaPixixxrmW9NrJhPRHsHUXJcBFI4cbB4v393LNEbmpSBRDqnBprjhZC8BEMGWos4nQs4omEo1nrc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427013f9-669f-492e-615c-08dcc7eb220d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:28.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2T2/MrEJnRQkPRfdP/W4lJcxOSCXlq54lJk80WKcccTOwnyj8PIlb6kQyYLV/1DSqZgpfi0xPhywsT2SppdVug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 1hZN-HR6uXF7RiKTVFJKui5QinwfSvWn
X-Proofpoint-GUID: 1hZN-HR6uXF7RiKTVFJKui5QinwfSvWn

From: Eugene Loh <eugene.loh@oracle.com>

We are going to support discovery of new probes after dtrace is
launched.  For example, there could be a pid or USDT probe with a
wildcard pid specification that could be matched by a process that
has not yet started.  Or, a process could load a shared library.

This means the probe map will have to grow.  For now, just wire in
some headroom, as ugly a hack as this is.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 70803e3c..75e48962 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -920,7 +920,7 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 
 	fd = create_gmap(dtp, "probes", BPF_MAP_TYPE_HASH, sizeof(uint32_t),
 			 sizeof(dt_bpf_probe_t),
-			 dt_list_length(&dtp->dt_enablings));
+			 dt_list_length(&dtp->dt_enablings) + 1000);
 	if (fd == -1)
 		return -1;
 
-- 
2.43.5

