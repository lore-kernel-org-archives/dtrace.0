Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0461CF284
	for <dtrace@lists.linux.dev>; Tue, 26 Nov 2024 19:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732651062; cv=fail; b=Ql+P2Psud1Z5tUyw6mNi8SxSub3+7fwxmArJ2BckbT3M7jSkxC3V9vdG1Mf5h0L7Jelpx8M7wK7maEuL8rs4fa0i7f1m+utb+WH3qJHJgwNRdb8Xh4ZLlH551f+vZKvjG42M1l3pmlKLdzcHPLrg6aQ+XdAQ+VW0kc+vGgVlF14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732651062; c=relaxed/simple;
	bh=oUDC3upsObeSwZWFyG4W5XiipJxCyZjlTdmpVUwdEZ8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=ljumObeYl75cKG0dxqGD5u2QSoZlFJggqlI2FXIaMa0toks1i/SL7HEYQdWkRydsHUNiZCqgTnWSry+/Bl6uDKELJHJReIRhEHwOUa+4o0SpppnQRFdaAYOcVeN7S36CoDNwysGqwj5oKcM1FENFw0FMLVVVOl6tlEGpq1k/y7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bgoyjUZ+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QPpxi74a; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bgoyjUZ+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QPpxi74a"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQDLe0M014076
	for <dtrace@lists.linux.dev>; Tue, 26 Nov 2024 19:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=SS2n13dqbw8ZqsdtaCdT4fLsRWPlfo2VxrWKplLXRP4=; b=
	bgoyjUZ+bUomz3zvBAontP/k4qcZVjO6xTW9NhWLQl5VxKbUDSqBq96ICRHMiERn
	2veAYVf2pAIfEv8eXRT2mndB8MEq/6H+BehZuQc2IHVpcasXJI7nro2FaTBbniS8
	K5hT97i9i7Pr5EFgi/KSsO4mcHQDwxi/ZbAvWQcjpu73yjHF1L4233AfRllQq/0Z
	CFdzUURwq5kEYdOQgSKEsgp3jCDxsNWUUYd0Rjr7mxnhc8CeGyicyCvlYxlLhcMb
	PdduZYrP3oBcsQSFkQ85arqkyDDioMHn+wIyAHzRSFWbfEhUa5iXYTIdwd5NP4jA
	0oiHaG9X0XtBuBGgxuXXvg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43384axc0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Nov 2024 19:57:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQJcX7k004482
	for <dtrace@lists.linux.dev>; Tue, 26 Nov 2024 19:57:37 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4335g9eax8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Nov 2024 19:57:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OM8DzKjhyrcQCPLHo7hAXUdZka3JB/bunID2v/b1PZEDkjpQ3KzlbfGisl8bRfBuWfa1Pbgng5aPMV3BzrleW9uTzTNylUr1HhaK+eOLOWCnm2wzTQPPuNivV4YYanPqsC0pxJzsGClSGdAGhyA7TcNxUVBwYh9MAqjekQhDs9BHcKsLforsXUm6U5QjbzoCUcIXVpJg4UZ9uQV84+4g787CgE64YRWzVgxdGaCFN+06/0uJcGkAl8Bnh/2wEpdEjaNFbaiGv71mfjK0/DULAIxL+J+O1Ifmi+i72/oBoFdpdiWvSwGWmQ4JnvHWbGFSbrtgdlXmuhmz3WRaulShGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SS2n13dqbw8ZqsdtaCdT4fLsRWPlfo2VxrWKplLXRP4=;
 b=E1e4oO7yrBZ2img+Dib6RvvNY52HNHQqXj794Yg/dhaiIODttEWsFSt7zWPzp0v8aXWvxp+7JqCdPoXoXwOGkg6Fcra3InlCiSrUvCADDSpLBc3RmtF+FMaJIRho+6MQVuV15NjHU0LB+wlpQjOghsvWZaTL18uNWprOOYxa9xKAQrlDO4MBS/hytH568RXlF5LxExF3ZwXnI+sHzDVhLBGJV3UTsrcmByXH6YJowXwj6hKheSjkh0cBjggNY3mBK9ZNcncekTZXtqkGj88X+gfkyKYnU2dwbbPRwvZM9PUiC3BF3gsNr5I1rpHAWw7HaguRULNAnoGIuDlSuJTtKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SS2n13dqbw8ZqsdtaCdT4fLsRWPlfo2VxrWKplLXRP4=;
 b=QPpxi74aiHbl/vdKbCmV1JtqshW07xfF2IFTXptV2g56otLdTfRFuEGXbNwoCgoYL7Nnsv+WxfvZ5maiCBdmyLP89KxR0MvmaVnT2TbiQg/VfdRbwZKBUxbk9m3qCigx5fJ2ReTcKtExQB3EW02R3uWDGypasKz72u1qwPM8XeM=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by PH7PR10MB6353.namprd10.prod.outlook.com (2603:10b6:510:1b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 19:57:32 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 19:57:32 +0000
Date: Tue, 26 Nov 2024 14:57:30 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: improve BPF feature check
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0424.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::9) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Message-ID:
 <SJ0PR10MB63506F4EBC8C84440D13A431C22F2@SJ0PR10MB6350.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|PH7PR10MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: e790ef93-fef5-43f8-6835-08dd0e549091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EYRkTAzMMmUEb+ko5IQ/Yg/rDYVevF4JWPUqk0alsL4bOR/BxRqKZPYCTr1I?=
 =?us-ascii?Q?nq8oRwAlPGW9ac1lF9s3WTdKtBurTXMOJ2/CIe7N36avamctyjERE5N1nmmi?=
 =?us-ascii?Q?156aAx+QShwcsTJ74U9HEuNqItrE2Td9No1RcPSQTomUhtiLvL98HgXgleL+?=
 =?us-ascii?Q?ac0xzGe4XkL/yZJn5SHWVlyvYoLz4uy52dCxJiKOTJ72cXJccyvHg3J9aFKQ?=
 =?us-ascii?Q?STeUUeq6LalvpjnXznPgkNvg4y5xeq5TnY2WOhKw+EiqJCrYwsDl2lT85jmo?=
 =?us-ascii?Q?hidiGB98INLEWJMzK4Wse3oOyG828kQs8Zrui/tkqDUHdMoVR8mU+HBYsQud?=
 =?us-ascii?Q?rs3AQARsKE/QitRAVYxhFvPWmDEute4uXsrpV/ISmIJ+Ip9WrUG5HHc95usF?=
 =?us-ascii?Q?BLc7qTitO8UaR3ui4Dk+QWUGK2b5hQn5XECE79BeMRs2YvBeT4yqvbYPJQof?=
 =?us-ascii?Q?kfA1/Gz7T51MWLjrPv8f2vGGUHrQnjJRTwO/hnEEqDr7oFXyAQVgT2ImQCKu?=
 =?us-ascii?Q?6NZP3XwAqQKGyP6VMVARpyBHbydAW/u0k3WQfau9kJ/4XvnitPjOt0iXLww0?=
 =?us-ascii?Q?UzmXvwVXf9RVOoMta8FCpHy5cT2j6maplMBvelGIrX7Z7Nfcsxz59VEy5LfN?=
 =?us-ascii?Q?jMoHGxiMMIkUVcq7Co0smkSLRkM+8HXoxCC+h6/3nYs5pkS7EjM6MYSS4/GD?=
 =?us-ascii?Q?J2RoKc3ByJl+vrhG7HtSmiE9Ph5H6tCRjaOAP9AE5/R5XnvuJTti2vCSuF5V?=
 =?us-ascii?Q?GG/YM97JbuEaq5DbJ5r3H2cPPW/kRr9XOa8dG/OJUiHyz0FzN2R2nkXuuHk4?=
 =?us-ascii?Q?hS2A303u6GTpDUraERwYb3fb3QUy7f3USE1iVFOZxmEa51L6g7zN87cKbAfy?=
 =?us-ascii?Q?KY6QjRPhBp8AUXe+Vc4O4JlgejogpJJCkG2e8fKTiTXhlGFg+9fTigbJ1Fzc?=
 =?us-ascii?Q?56yeFZuCjrbZqBMJPitIoq5FfbU5v/ookhjz6voHyMg77q8psJdJS5idRpxk?=
 =?us-ascii?Q?XP9AHHOv/zxAULn/hk7fdbgZXJpmPXCcCIiFnaS4ZblNiBdzt9vO3ILW2sp4?=
 =?us-ascii?Q?sJdMEr2o0k88EuvwpZ/WFBCi/HQycw+sxAEcQPKoVBQBaYTY1F6FfCP72XxH?=
 =?us-ascii?Q?hvvPjjSZWlh1odnlaVie3l/J3nnT5/pZZu7yMbdzgVoB+uEohFc5mcniSZxS?=
 =?us-ascii?Q?QaKASftoo9iVUZBLCaeH6dXMnGP7kp9hvPeTUfR5zPkT+y59R44lK4cuC2GQ?=
 =?us-ascii?Q?J3X/n40QqRIAakrkZpNVqPTf9X+LPWPOdmFzmVbz5mWp2i2IKLgj4uBFE5Kf?=
 =?us-ascii?Q?A/ODivwxps5tQpj3HU4YcBlRdDAFqu0US74ruCeeKC41jQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VJHuamiyPH/Ife+UdYRlrFIogtaTyXb9QlxmlMG/KiLiN17JQiMesMIHcliI?=
 =?us-ascii?Q?+TCj0dC0uuyuJXtlzaD2sxnQbB5i3efPTCh1bSpB2Gnc+E9J2vhHa3eHnkSZ?=
 =?us-ascii?Q?5BTSKFRvzAISsXTWbItg07GevwnVgD0TsoJCCympjnYoAuShi44bZfBNudpW?=
 =?us-ascii?Q?1fuFicbGIjmAL/vobpkAouBEt73KtTat8QHBgSUZdu7Ruae5lh2HjrYtvt8/?=
 =?us-ascii?Q?J6Gk5WBVMyey8Cvzsi/xYGlnwWdV4w6Va9FZtzltQgCDVUOZfqWNXSX7JmhG?=
 =?us-ascii?Q?lHmqMTppWKDZ9WLaIO18WptQeWhTlKUa2mxl3GeX4zy+eZyhcsE961TO9blf?=
 =?us-ascii?Q?jfAiVbFHrCLFanmy8HyLUq7sFymiquivGCt59Rg1GGgJ7+KFES4OCVt7qSVI?=
 =?us-ascii?Q?8QACDZkIKCL3Ryb6pVBdbsNjnbkxO4flD5T4aRxC8MeKeLgig9DBCnU4UeWf?=
 =?us-ascii?Q?qWtB/tsSwA7FY4o3ADwywoS467v8vv/5GH6sBMskRXjSH1HLYw3RoTvETDqv?=
 =?us-ascii?Q?UBIBE9MvlFgzpmh7MUGusRjSBYftG79F086WDyeAzLbRwkg3hYH3BgxqU2fN?=
 =?us-ascii?Q?9H/VjDIZUZ+20oiOvU5toPGRsZUPGjVOP/XE9BGm+h5TkG0i3cBSGDeC+c+X?=
 =?us-ascii?Q?ix4rrFxFEzYb8TRvPO4dlkM5/R0hb4RHPom2jQYYpbQCWyfn+0BltaF1674l?=
 =?us-ascii?Q?EBvdSb0ra2G/EY2Yao8/8U6ap7bnA1PgCwvD+LRl1qyQRnK0x5wTD4m5821i?=
 =?us-ascii?Q?QTUqBKofpqnXKFsHnN133Qq1ptdWPdB6mvvMllx71Wi3cwa5JOfZA5xayih6?=
 =?us-ascii?Q?j3GqJ78OD7ITL+hTR7JCdUulkf2W8pivT60Zw6qp12XfIk2O3z6R9T0O2LLZ?=
 =?us-ascii?Q?ppsvX1lDPgccKXoIsdRIcKqoph1xUpr8psHtujhhXGHMLB4UanmebRbfaZK6?=
 =?us-ascii?Q?SRKre9xWXuOnzO6sxrenv7JrgJE18zHnCBb2RTZozM9h20t4f1DKf4/MKfrm?=
 =?us-ascii?Q?2/MgIJp7LgzBIUvDCsigesndRxJNly2fts+htV6Laa5SL7rLt8ibTZ8QTBN7?=
 =?us-ascii?Q?po1579JBwmHrM3wDzDuPjUAGooRQbeOl5IEpqirdMadvp3CITDUoqrRXapLG?=
 =?us-ascii?Q?FhcE+ZK5nRdvUtNZfZkspmYdS4cg5wf6oR3o9zClKKiUusqUFSxq/bLzoCzh?=
 =?us-ascii?Q?fA3kGkQShNS1tA0zmcOmSJOdQlBhbUe5XPwQ5Kh8hD/sPCiiOFf45Cjb9L+u?=
 =?us-ascii?Q?BUkOW/V+rdzIwz8Blcpf5soX8QSeXWoT5lhUuVdHfKORUN3tGSZicoYroyYz?=
 =?us-ascii?Q?X0HtkH4U3LJ4p1Tqz0TfPBiv8g53wupo/WM8vKxzTvNdn9cVCPHROpfE6qq6?=
 =?us-ascii?Q?4xlokRaujbwRp6sSxuNp6Fvb+kq0y4vA+hOdeEbNj896yX90sd392RQBXmmi?=
 =?us-ascii?Q?C0jLsnSmnmZY/6y+uOAGsiOT0nNvdxC5DFpif+353XvEjYtadQBrMtdHPQi2?=
 =?us-ascii?Q?NWFstDS4KT43Ffy5uFzargxg6xfs/T151tniUe4ndmdt3EReliN/JtPAjO7C?=
 =?us-ascii?Q?A66uOr/wFimxd9530VyIGa7YX3r2RiI4+CT0aDwyXy7e6HWx028f0LQelhr1?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qDcNnmg334T5jCN8kgFjzBRq+nMXLlNt6lVmbtIxwmI75z56OlJ/dNXzaD4PFM9a8Z5jJDw0AptLGRSTAJLeBpGde7bqoGxWuY99Vks3RIeY4GZDyewFEeHsAAjLaXrO1lF/JQ5TuRedXEAuKn9dUbivozbF5lonR17kKPSdNcnj7e8Uz8V3zTKjF8gMjIMJK51S9TTPOZWU2VfRJs6rKBjgUDMcwUBJO1PG5jWYb1HaNi47NzWhfQjmC/JBS7f4MEYcBBGhTihj7ybC1FgtPNtTlmq2U40kZdZVe1phgxirQAxYs3t5lTpJcdLvXOno9DDsaZFqV9qCyEe4xj0CNRbskGWIUnTBCwWm+XgIckURUVsjzj7H73bHSemELhjfAnH8WyEFcJX4OTY76kMc0JVu2ubjmHkYOEi7b+HeSFxb20Ht4cVaTks+NZBF6Rq0Ej9lnLoaWL0jjjzD/8DF6GlXOh3fiUg1t5CpUqv8+HzLkOsXvdgj7HdXz7xcgAOzzKRsrdK2QissTRVs83Jn2VpcshlN4vJa5BaxpmBsbH+8/lYkXa4FWWpAEfs3bhFV7WPnYNa7WvzbYUo2FLRuIvk062BNHkIPCtgCndNqRd8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e790ef93-fef5-43f8-6835-08dd0e549091
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 19:57:32.3649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6SioFVbWEYa78c2Gx8xLLNdYVvqO2M4sKflGyYo09YcnnfJdyWairgRp2/mzqGUzk4SAUYYr4WbfS4qas9e+ClSNJSB4i/c56Cw7fPUxNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6353
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_14,2024-11-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411260158
X-Proofpoint-ORIG-GUID: Dhsn4vvsnJ63O5ESZul7TEtcxWDtAWVZ
X-Proofpoint-GUID: Dhsn4vvsnJ63O5ESZul7TEtcxWDtAWVZ

The check for BPF attach types was trying to attach to bpf_check, but
attaching to that function is rejected by the BPF verifier on some
kernel versions.  Use bpf_get_btf_vmlinux because that function does
not take any arguments and therefore should always succeed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 2a946f0d..662fd81a 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -488,8 +488,8 @@ dt_bpf_init_features(dtrace_hdl_t *dtp)
 {
 	uint32_t	btf_id;
 
-	btf_id = dt_btf_lookup_name_kind(dtp, dtp->dt_shared_btf, "bpf_check",
-					 BTF_KIND_FUNC);
+	btf_id = dt_btf_lookup_name_kind(dtp, dtp->dt_shared_btf,
+					 "bpf_get_btf_vmlinux", BTF_KIND_FUNC);
 	if (btf_id >= 0 &&
 	    have_attach_type(BPF_PROG_TYPE_TRACING, BPF_TRACE_FENTRY, btf_id))
 		BPF_SET_FEATURE(dtp, BPF_FEAT_FENTRY);
-- 
2.45.2

