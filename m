Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3B40DFC2
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776445336; cv=fail; b=DwZ/0b7SbiZx+YSj6LRDMgexA6Kk1VsJwc847vsWAn5vRfHiW0R8gYYJwdFcSduDuvAZSTC/l0tI3y14nQ1ulQgUqeiYUGnKQbV5CFyn1TmmLYYyjB6sn4ZShwvL6mZIyrFl+wAcVjPglspHRJP6/OWLZEO69DyWUSVm2nbEZBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776445336; c=relaxed/simple;
	bh=r9lSf6vLG4yEQHQxEBRbMt4qhlEMtkTzO2z39j7kTCY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=iGaqzvK1SaIs+ns08gkacDO3HU12X6j1OlZalCGFbc0nLOmH+Pe078RX6p2kX1y4EPqzW+2XbwD12KFGfK0AVTT2tMXePUAw71hbZ0Z0iaVPnSreoDDOf3XcfUBIVnTUa3gHoKZT5AfMUvOBVJ0n0dSvFea3KHusFGyFacZmtF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WTxRzstD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=smbd6Uha; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WTxRzstD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="smbd6Uha"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCVa6h3128946
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2iqcQFjGGQJmgpi9Qh
	YeVWjF7jgyK4bFLpp3PU3C9Lg=; b=WTxRzstDiqvSXo7EJKyS33/JYb4bsZhDA1
	Nlcd71Ozv6NZ89BMJwGxMhipg1Odvj37EhiWVJh9JgjCWSavrdphQQrpHIAMy6qO
	o+wrEVMstRb+gX/5DDNn00lHUgldQZjJZGIjgYfKWa6cCdi8CR0sXNGRrRVoxPzz
	d6jGjKcdPmaf8V62mQxlDA28GqBgJIoiMI4KW9N/mGTUVMDWjjyT8aOQq6vSTQGc
	lt9Ix38e/2HPI93bNaEeeH0g7Uiyg8kM/jQRTthjaNX4Pw1Pg+s1q14XxB6fUGiA
	XRzMfzx4+OFmtjug6BWUOO/jlMYohxy9CP7NP4UPIireEz68ga9A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4dh87mj8pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:02:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 63HGxSpB032282
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:02:11 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4dh7nrtdja-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Apr 2026 17:02:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V6FPA1vojHD31pGd+fROkqtRlqkk2nTEA9UhCKx39zrttVVwnwN3V6sQiEvdjXIKv8k1lEWHDrdNmuOxrIjFWfmX5HUmm4/+Mo0F0TMDBqWof32sib86sv6x+eBl2KcB79DRG69flsSlo2Wzc0NNiX+XmYT/6tr9IcAt3dq1DFkBChiS9/5cUut1ErIAcKkxx/ipV1KAKdjAHLbtFyLRYoHa4GLZpqB3Xl75JPNlqDmFGjUJzJS36Cf9XwO+XB4JlF96y0IGKdYdeoxs/qs/ZqfK6bABWMeXasqQSQm3h2Oe7QRIPwlIYRQosrrwp5nGY/OE7m9UCcnmnYat74kfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iqcQFjGGQJmgpi9QhYeVWjF7jgyK4bFLpp3PU3C9Lg=;
 b=XIQESkil/1jVjv8dY80ikQlqknDRqq+gHoeaxAmzHmCn0q6/hihJ+LBKItB7X4wIAEBXbaJ+zqzpmtop9F2YN/1QZ3BnxK5Wh/P2oty+yZ3G62d+HJPHm5hO2Z35juxWHsfGANDi3F4uO8ATmEjUrFviYnVBCVpFQxt3clMAnRHd9KktrS3G0Il2tOBe+448JdI7lMZARe2pTG4AsZkBKnP3dj6Rp/ghJhTBg+6AKeGea1eINpzu+XprOe9Jidz5zLLi2RyFOfxVQsTNinRY0fTTUfXu8b/nQ8PP5/W3FGkwjm7gXzzf70OdceYNMOl++QEWJd/FD5DJpSQP6Tw5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iqcQFjGGQJmgpi9QhYeVWjF7jgyK4bFLpp3PU3C9Lg=;
 b=smbd6Uha+cFHYgyL/P1BNw1ngKaUUBsRFhYur7CCCT4ZM5kCa4IlhodLP63/Al8nky9ugTNar3eijOiVDWAnQLWe4HzY1fR09GVWcTU7Z0GGOoDBv5h7DRVx9sNpyMk7WryIYZ3PN8KNce9dEeIZHRzrFj326zwwOQaflA1c5rE=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by PH0PR10MB5779.namprd10.prod.outlook.com
 (2603:10b6:510:146::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 17:02:08 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%7]) with mapi id 15.20.9769.046; Fri, 17 Apr 2026
 17:02:08 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/4] btf: btf argument to dt_btf_get_string() should be
 const
In-Reply-To: <IA0PR10MB73252238BD3B5AB32F0AB2EBC2252@IA0PR10MB7325.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Tue, 14 Apr 2026 02:27:45 -0400")
References: <IA0PR10MB73252238BD3B5AB32F0AB2EBC2252@IA0PR10MB7325.namprd10.prod.outlook.com>
Emacs: more boundary conditions than the Middle East.
Date: Fri, 17 Apr 2026 18:02:04 +0100
Message-ID: <87mrz1zfjn.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0056.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34a::8) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|PH0PR10MB5779:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b5b493-83dc-4f7b-7163-08de9ca30f42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IHkTEeIqo29aSqWUed0yA9DmaPIRUaU+1sMtSipsehhwHJGlGVt0KYYIiiAT+RHHExFxrpWZXb0b4S0vbu4dzWMLUCpPx4khvyK1H8MCXvADFYKSTr2wcH93vb8GsnmBrbNQVnju7Z5+2XSOFnrtpxxlhsTTrTYCQMBeqSDB2TWsH8XIlDv8OEwv5KIGur4PoFg4p9cEeAM1CzufI7gPTNs4n3CfC4uaGhJdvNDf+yx0APdnw7079dgOvsq4obeXQMR4PmM60lCtvzbjoBi1NWyNsQMsnh8K2QQbf41MPq/nJGJULQdPbIlFzY+VTC1edxi+nDu6iKNMKJ3ypzaqi4fu+UhVbDlfsEokEaliE4TETlClCho3V1GhHCBctwOOnZaMzAm2sqm9TlJovpBFx/YHvTHBV01/clv734QBA7MrAgnJbxNx8XFVwEhC74VXWZkVnogIIIFhL8WKXxqPm7fI9QfXdmx7QiELTbi0LRCkuTcyatPaa3NwfCPfRyYOSfF6JTmAxYKXgsxYm0cFinBt+OodOFkkyxEUsxFVruTMyG7CMEssAk3AmIaGYAS4GNbnvXN714UmQqHeRT2hTc3LSfpc49DnQMq03tLMZOmod/OuqOFvYeRhaDH7Ev3K/qHt2DNUwAOPzgh4RPKMPpPJrPkLc80jMChpCopoWTLxCPJkTmWVBth9Xmzce8Gdciz8prtGrF1klCgOWBrgkPob29oyWCr6ihOX6q41GFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wZyZryhY6K8aURc7wT4yjj86Ph2kYsnC0IoHU8+7P/Z07eHbWSZ8V9l4AvuA?=
 =?us-ascii?Q?THxy4MxI6l2qY//gHG4twKo1vWEjm009eDbwnmXZQTeC3dPUxMwezi853vLH?=
 =?us-ascii?Q?zeB9VMv7hgCrjq9A4XC1z3PgDvg3DUXzOuKYgLDKT20rTbHY6/W+aBWO6hn6?=
 =?us-ascii?Q?QFqeSp9nfxntHxesEyjNU7KPhRqCUZBwoOefhfCTBOR6i/eCVIyPJK0LyLF8?=
 =?us-ascii?Q?mBXK/LLqq2YOjbLOvEHYIdCZnNTKwN5tYkdkW+qw+qguwPPMkbNKxLBH7+6E?=
 =?us-ascii?Q?Lz90rSBi49VC5oH7W59S3EZaBlSwbJ4qbc8oY8yrXTI2QqAzaQqXJUJhQ0LS?=
 =?us-ascii?Q?XShRL+Kf5y85SQ2xn7edB3k114nR6BJBKX8/Ocx4h31YWHUTE+1OqzkPkrQg?=
 =?us-ascii?Q?8KSNcG6XJMd1kD4uXYw4B+P8yyr04Qywm88C/Byc9JYal+aq+RwW63HBoci1?=
 =?us-ascii?Q?rMiBASQMVOtcsDJ8h/cO4mZL2Y9M4qrBUx04OzOdW6a0w2WcTstFBSebr4ib?=
 =?us-ascii?Q?lqGDCgx8Qw50KceLDaKfjrKdV0O69HCpo30VX3f5aNJ+a0hx1UjC/c8aH/Hb?=
 =?us-ascii?Q?w+3JRiYSM+7y7978aP3fHoYDDLGHXr3+6gEQxjMQ5wccihDfqMV6cygh/TgH?=
 =?us-ascii?Q?UyeKEaQXlwk6uhZBylIrLttohMH+wnkqTPJhxN4RQH7+OmIL0Ce3aa2FlipH?=
 =?us-ascii?Q?9SCiEHfnbzLwNTUcUPuq3vT+nsyifZEyzFix2Hcr7nKkpw+aD+MeHE74pbqp?=
 =?us-ascii?Q?FHQnYMZHyKqCS3uDElddLD77cjD2jDJop8HOtH7+ZUZyJiPgGQQdrC4cwbIQ?=
 =?us-ascii?Q?Z33E0WKt8MK+VaMDsThp5Jlmn9qFSlVoJKi2ML4AfJMVUOGm26pr709/HGu+?=
 =?us-ascii?Q?FOfDzXIQi0SOqNXnWgCoNPiwUxb3cfUcDR5SMi6vbM7itAtr5oul9ohdK7sE?=
 =?us-ascii?Q?21Km6u7XsRX6RxkJdX0P2//8V69Gi0LHRlq7g2iUTjvrSuJi41N0uVcgYk8Y?=
 =?us-ascii?Q?TIYr6iskpC7E1gCOXmCepYOr2oC08emwMSOU4Oe4KCza7Tlkmcnbq5Jq+1QW?=
 =?us-ascii?Q?FzioZSfa+xJ5L03j/ctjwcV2kgp7EzKVxVU213hp7UNpd2jI9GQ6q2A7HrJ8?=
 =?us-ascii?Q?sYXc3QlMXh/m0vTNcT/3DWQJxZiR3I2k3y2pyIT6yAG2ddtIt2Abq/NC+mXe?=
 =?us-ascii?Q?cIskkLMDTh8Wp65C8OUWglDJrJNKsEDJU4Y1wQPb5w3Ve4ogKfhYrVkiC9CD?=
 =?us-ascii?Q?GWdcSJCJEfcCuevlqbCzwjYP0xVua9QTb28JwqqybSxta2Lh9+5XLQgPJbwx?=
 =?us-ascii?Q?GiR62eO5S+m2KApiq/s3acZcmOwPA+kUrt2AzM3LuxZcMnU0CE/KucryCOwu?=
 =?us-ascii?Q?NvBf+armwVp2O1jWFvU8l+Cu1pf7c78dgOpKACUv/SJrCKFSyUeAVmjqeIiR?=
 =?us-ascii?Q?F3DqvGf7M1+c4SK2Sv8akoFig5bLTPuokvxYr7lC/15ivx+PfmjYHrcNei4a?=
 =?us-ascii?Q?iGG8KYXB2dH5Ud4tKpSHrTM0tabbp49CegjhgI0xFfHV4sqSatslyX43zU4F?=
 =?us-ascii?Q?hA/Tr+uB097SLx3Ajbrj4Nonjb26nPkjZhxu/chBahfGOmgzKxD6hAg8H1r7?=
 =?us-ascii?Q?yhAoxKfPyhdps5JkXl7sEILpobDJTBiGWq4dJnIiiLJK9vRfyvyyAiQgRK6T?=
 =?us-ascii?Q?VNXFwOK7HzmNVF6y7DQJyg8+yR6TMGvrRM3oD6TM/ufn6v4YvofPI8y5SxxT?=
 =?us-ascii?Q?2/T15BR0Zw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	MuN82Vx4+zJNBjT13uVMX3NeUP0jiIDzoe3bPwnf1SdraPROdnDvtCp15SMS0XDpZlGe8qcPzdtAYQDzqu+2eUpPbIhilqIy8dIodVmA0gwnlGNDnpto1ySqdf7ZM+xS5mM1526eXfzUnMD2wERwqhukRkZ00bqgnI8URZAUkKrlf0DsrCyeoSj5DHVDBwML2eccv9KuJzO1fmR5vktkoFIeItmJOwmzLMc2lO82vAmJpZFG2jnMKPt7hgAWAfDN4aU/a000g/xoPiexQQW9xUq8dALeAixViZG0sDs3RwXrv2ckkR/OR+6YGkT6HNrOQxYr3gQaXFadTieu43gyhQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lheqChmGQ8IGj/8QRrYiiFFEVzokvwXVv6/EFrluNzkhmRvwlR01Xi0x4UtcxVeEOUdRGbS/WSCMGZN38tfUYt4a1ZH9Wwkcy/1uxX0lWqz5SwReaq/VejEox8NVjAuyyjA3dO2/ckaizVt2zSGU540Opb3EgSwMEtoBh7q2laYydHBY/fJZcSMqu89wHnlf56NH2Knhx0q7UzPR1v0hXnxPPvd8o8jZfonFTulptwfGPNM9HAj61z60IFbAfyxuQkmg7HfYdE5wlwKR+14hr7HMmnSoRUaL8bcGFAK9TzEuFy+ezhvvFmXlEyZ16/8otnGxlUMoMuOySHrqRg7MOfdvu+vVfsg9DkDaYn72kIGhPqR2ZzsNa+UTgIRucBrbuPc1T5aqUIgqGKyLzTgbUQHTvdzPYVG5ArE92AiUgyMfgSKGS7UldzRlGWjTINYqWiJCDJt+znFG1wPDOFMij03nF8jHzrkAOiYs+x43bYY5MCIMRzZh0xGJHCMzmDzob1Pfma03qWFo4cuy7RCpX5/vbo3LkIbgF4DwCw1Z9wVbGmNy6KjGb9yMFaFaXBDjxkfVVRTc/MnfID7raPc6IDB5jDyJ3PtH7C0yauhFVVg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b5b493-83dc-4f7b-7163-08de9ca30f42
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 17:02:08.5117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6w3jfhR+w3dyXSqY0Edt5Rpj54uK4QxTiKUxWgtnS52NR2BFk866py3FWdNr3boPF101F0fMpRxCaxbMvSFyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2604070000 definitions=main-2604170171
X-Authority-Analysis: v=2.4 cv=JKYLdcKb c=1 sm=1 tr=0 ts=69e26794 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=ResjdB9p1eACEjXsMCkA:9 cc=ntf
 awl=host:12291
X-Proofpoint-ORIG-GUID: Oxz-yiKbKdAuFeFiCAruBTuV5-kxolTE
X-Proofpoint-GUID: Oxz-yiKbKdAuFeFiCAruBTuV5-kxolTE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE3MSBTYWx0ZWRfX/Z4VZkhopvI5
 ctPKL1ypZVZCxOrb6WC41NNi/6p74BCi4UTGIYYBoejVssyGMRfVk/9/BI2ELfGQ+qVeXzzRdj+
 tUNataYAivxeyAWKa7V1BDJuSZXpyF//Jqj23LyZ6DydvSk+jPLv4v3nsgWzEEbAXn9gRH7A2Lc
 hzPuS9dLX+oTkpkM5RlT2MaZ+osJ12/Jr0/WMz3WFmTTf5cKrEG3t26CkFyRg1Icv6Wy8i8jPK3
 Ix0oNUO7DQOpxrLS0uorC5GPi7ijMbRnJWBcT9YeIVbXYvmL3jAKav0BGWB804g5lWrngKG9KnG
 N74ZLLeZxhcco8tzwPbpnANaRvF120SpVbaWzwmII7V7m9JucPHEHgcckOtMpvov52JlWDHhGqn
 lsXiufwR8UUsIeBa+2GOXu1Hi3y3/OcAQxRyXsvchJHobRwSrOmIOTWPbr+MZnNBPKBNbqvDWFi
 OCkPTXOf5mvpgwhjok7sloJT2pmCv4kKXTBubjVk=

On 14 Apr 2026, Kris Van Hees told this:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> ---
>  libdtrace/dt_btf.c | 2 +-
>  libdtrace/dt_btf.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index 1f6dfd54d..d08599192 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -849,7 +849,7 @@ dt_btf_type_by_id(dtrace_hdl_t *dtp, const dt_btf_t *btf, int32_t id)
>  }
>  
>  const char *
> -dt_btf_get_string(dtrace_hdl_t *dtp, dt_btf_t *btf, uint32_t off)
> +dt_btf_get_string(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t off)
>  {
>  	if (dtp->dt_shared_btf == NULL)
>  		goto ok;
> diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
> index 3e5f53622..d956ad940 100644
> --- a/libdtrace/dt_btf.h
> +++ b/libdtrace/dt_btf.h
> @@ -20,7 +20,8 @@ typedef struct bpf_btf_info	btf_info_t;
>  extern void dt_btf_destroy(dtrace_hdl_t *, dt_btf_t *);
>  extern dt_btf_t *dt_btf_load_module(dtrace_hdl_t *, dt_module_t *);
>  extern ctf_dict_t *dt_btf_module_ctf(dtrace_hdl_t *, dt_module_t *);
> -extern const char *dt_btf_get_string(dtrace_hdl_t *, dt_btf_t *, uint32_t);
> +extern const char *dt_btf_get_string(dtrace_hdl_t *, const dt_btf_t *,
> +				     uint32_t);
>  extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_module_t *,
>  				       const char *, uint32_t);
>  extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,

-- 
NULL && (void)
