Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7771E9067
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290388; cv=fail; b=ZI886H8gyiS3IKpyDier1xDU95LUXjAPSxxvdWGNSd9iGyg+kZ88dZAPZ84SAJ9hxle1dQImGsLKVqznf17uh0tRoJ4q8b836oGj6BrLbAIk4Sk+S/sKLmL1YxbyrtkCfTrRj3P2r8BtsFGpbHrjPIe8AlQN34FrtSM/9Yw1RTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290388; c=relaxed/simple;
	bh=qfSWzm26hE80JI6GewHH07L+4vC+JFynmpT0z2Y3AMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nICw/Igv1wNo9QiX7MyoRM079zKLxw/94YPF6ZQKS+fPqSKx6AyYVxWtXMnGBUV/sqwGAqXqKxv6e7VAnrR7XOtRjRHMOmoU0f0RVI1KKxhj98/v2TCk8PL6wLRY3BKvUrZ/ywwjmpIcsc8staQX9cjk7SLjxiE2Bu7KiVB0DS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dx3iKMGP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v/Gu54X0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dx3iKMGP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v/Gu54X0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fc8r021240
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=ZWPiPa3urJQF/2d6jvuz5i4NEo9E7VJrdD4aTIJ/CwM=; b=
	dx3iKMGPMnfyRhjw3rj0R6Pq4tfLwPcDTAOCrLJlmDUNXqOAVSK/L++Y+O5/Z81G
	BnjGtnMPGcdIlSyjqG9LmXM36JVuAzwimkFZUVVbK4HYVZnC6nBOdu8cndB2zJBX
	XN6BWqMof4o1Dy7rLMJL7t8HoT8SY6F2h8/fflZoYvVz5ke+BfuVgAggBtrhcpSh
	KFfVKbtvMRe6PP28XldLx1QZv4IL2IvLcwKoPTjdf6TyD2uY3AGK+Y6cFspskU8x
	IPIAtvCKst83MMKbIJFeXL4awdJmPv7DMO3CKYAXzhLDoOH9irvcMe73rwpPBqXN
	jJTttm5M9700KCm8/A4TWQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8yu21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBnCNr008385
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hneb0msk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCEbpTbiCG1Em73IwTPpemtME7YdJ5JgsldEF7A9vcA21P7THaUzfGZBb4dOaZBknxVIP3Udeq5K9zHCaW/CgQ6P1tCy8XX4my5mOWwvPYrl5FRk1ORA0+cRToHaUvZCYFuHlu82uQfgKM65I5Y5HgawPSP5VDUQ0ceGXNQaPkx1rueiQDZMbgwhjhitGCe794bndUzG9tLIkF3kkXtiiTqMH/WrGZeIyqJcOR7XvQma6x0s7JAbqM5j7Ix68Oa6cIuYN+bVHvsAUSU6oaV+q0kmgyCySKYN9qmOTsi4XzjPP+/6OO2kM+7dvbfpuodoCbq6mC3PfghoCZppSv4nkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWPiPa3urJQF/2d6jvuz5i4NEo9E7VJrdD4aTIJ/CwM=;
 b=kjy86ovWtmLk3fXhDNgGLy8DpwL/7bHRQ8RBK60bbRplxWiH23gTn9dWBNQDCM4iY2CXwBfWF+Zo8ccfR1Do89nMohAi8PM61NkU3kW7zst3d4+OAJ1IKg18OYsHKvAVbPNyd4DoD1eSMeTKwdOIXuiIwv8MtXQkQz9UuEEBVMRWdH7D1NlD5HeNyC6UOfD/9xU60zCJx+wfTTIQodFUszPOFU/ih7+pFMp0CBuzcsQimj051piNJ+T8wYRFIloPcb8qdYqHFa2nR2DWp9NTggZlqtZnOZYZ3feNuWA6gAgf16h1GYwjp0PWywB4mUvkTxFm3jFHln9cXDeI7MI/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWPiPa3urJQF/2d6jvuz5i4NEo9E7VJrdD4aTIJ/CwM=;
 b=v/Gu54X0Avlyh0Rqwg3VZ3zoaxms54aXlfmn6LNPCfrdEBI3cf3qpgCbCgeeOK4U+jA/xDktTKOCGOVnBFteWUxmNkDSoAcT7o4wfsj2g9VcmwfB1FrZN1tAnN48qb+N5veKaFRewOkWbhwuLauD+4QTP63R77sVNko9CPVgr/o=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:12:58 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:58 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 08/14] man: use \- for option dashes, not -
Date: Wed, 30 Oct 2024 12:12:30 +0000
Message-ID: <20241030121236.257803-9-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: d9d6969f-327e-4905-130e-08dcf8dc3152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1R8HQbuG8GBEND6DRCeMLhSGeRPvFKr4xtpH2+wodFfzLU1A8OwWBB8XqC1+?=
 =?us-ascii?Q?bUg+uDatEjodWuLqBpbFrvDbzBVkldzmWaVk3GaaawZK/O6FyrVW0oKb5WUM?=
 =?us-ascii?Q?xyfthl0JFTCGF7NYDFibAvuvaTjdSlAphuESLdhB2ODpBxIMp65u5xasvw77?=
 =?us-ascii?Q?XvUxb0hIj7JN+HHjLUVsd6LjtSJw8De2IuSxhfihit7rzf8YuHrT3Tp1uja5?=
 =?us-ascii?Q?Jl/nbtBem+viAcQHmgaFf5m4C06I2ImrcQZUiDxamG7A0p6U9SKJw8aF3zLJ?=
 =?us-ascii?Q?85cq41T/QGSfmtblqgv6xxRTkkMveClVvOZ+gEl775cZ47FWzgrJzqTpgeAV?=
 =?us-ascii?Q?1n9DCqWe2hDF4oMzIKk3T3GQnGfJABYDWehLtEfT1rnedufq416GpoqowwLs?=
 =?us-ascii?Q?gZ4+9iuudI4BP3/d/9oKV+Gt1H8qaYUR8KbPBG2FMGPtEOlPRpUsVQgBFNR/?=
 =?us-ascii?Q?AOhBbinlWjdemOCL9wBIkUS7TnszMTvxx0Zq3tVr5R7NG+k1B/mQMjOhLloT?=
 =?us-ascii?Q?KkAlcR60wcNfA6FK726MYzZDmo2i0gjk9r9r7xSOd+Yy3VhqjSXAVfNcMT1n?=
 =?us-ascii?Q?yjGHbhkM3Pm013nTlqGTMtSv9P3lj76pO98/r6PdgoIeSQ9OyS4rT3sa5rDN?=
 =?us-ascii?Q?PFbzo7S7u64Hmr2H4oGaksFzAG8R/AmNVbqRC5z0UKlGOpmhgY/DaCqKsHiV?=
 =?us-ascii?Q?bwvYaWq+1A/5KRM4/S0WXKP747Z01xhV0XVvEburfJygQLPoVyebewuGLwS8?=
 =?us-ascii?Q?k5LANosoU4kWFdLWTYpBh1Y7Dhi1nkrj10spJYwFj4E4y35Wd7MVWNIoqvV0?=
 =?us-ascii?Q?isYhT4Uw0+fxFh2Aq4TmhPHH+43rZ3ACRdNA64Ikmua5At9ZNfxHUZXAS8Id?=
 =?us-ascii?Q?L0DjF7KaxXh1wpYe6IPrdfAdyeO3cE2LkOLpLMHNHuARo6fQuwiRXdGJ/zCV?=
 =?us-ascii?Q?r1G7OBesAfPJ/l8cJG43GAqP0fmbbVUX1CM1lk4J59/FMkFmJaIXezQfSMpN?=
 =?us-ascii?Q?sPZMguaU2z/eF+s1ejAM4/2jXJ4TrdywgeuBznVwFtROW8E/WUO4g6Iluane?=
 =?us-ascii?Q?deafC6UO4hDDwCpUrkLdEt3hUAarR400CtOFJKGlwVL8NL58v8n7YfJrlc1B?=
 =?us-ascii?Q?wfZGSs5nbOZq5OHina05/zDE/0cDBnElnH9U/u7pVDxh6vuyP7CFoZXq1WYj?=
 =?us-ascii?Q?ANIbsRjimka8MaKtZrUpAU549uQK/Hqczn9lCd0BNP1nClJpDoRn518JpDLF?=
 =?us-ascii?Q?gSdDD2SEbjvkQtuVs2Tg9fGdaD/Ecuw5Sb+RKCJgZg4q7LR3NeDoV9xWSqnj?=
 =?us-ascii?Q?2fr25wnU7JYSYxpbbumaTFfs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEtX+jhAYP9Gc9WCSn5eVqdt7oVhbQbBTiG92EahbClEge9UKjj5mldUvRQ6?=
 =?us-ascii?Q?G9SpTZxurQdFHkvom2l/bcQvGxpQF7vKEvSzbMuOKw5XvDWFex64GYep52MB?=
 =?us-ascii?Q?CeydZSWNuRHDbyG3hL7HH9oZCm6fzTOLRh25cVgkmmeqAeSRwAIgRbFYkMRS?=
 =?us-ascii?Q?Zihgilu84R7+Nt/U+fCGuZRlVj77h1FPZjOz9IqI2jJNN0+G5Z52vcB03WCd?=
 =?us-ascii?Q?UdfM23Hj1zxiuZakNay9wyTzs7DIn6flqBOya2Vedd01EyxQPxp9nHadjd78?=
 =?us-ascii?Q?lD+nJGPtaaiXrr2xsOCtzm3vgnUVOLHc/LNzWKGQqh8O9uOzNmp4aVHYzRA7?=
 =?us-ascii?Q?s82zjl0Axq+rj2anJplu7OXiLbxBOsU5iqc4ohzrTgUijGXE+ET8xZFK7d/q?=
 =?us-ascii?Q?fQW5i/M9Py/9gvhewb9N9VMYEhKLmsdnavwIH8X6WrfUTdQPzy4xJ+yOLyOY?=
 =?us-ascii?Q?iPnmQr1kUJGDUW5G52Czvzsf4iOcjli1IaOl7vYeTxyBe4rWUlbpu+KnEPaG?=
 =?us-ascii?Q?JL5VOVu2xCoHO4dIftXu3EzN/JIKk0DImD5hy1g1tHDDltWwf5OMUWuClEAu?=
 =?us-ascii?Q?jSfmd+TBWsl8+O+BRjSa/9s4z1X6tmn6sQl5v4MGTMauErzZyk6uLlISp3JJ?=
 =?us-ascii?Q?2Mq3bKBdVScHpnHzuCXccGwiE7BiYjQbJym+CHPRvIAO+RwejpoF5LcAq3rQ?=
 =?us-ascii?Q?7do74YUYBjuiACNjRhcS5qEe5RrA0brK9bdSnHONWyyes5zgYleYTjHSLejt?=
 =?us-ascii?Q?b1PD/5C0OxQLL7G1doRwTfM3wudSqhOdl8DWKUGs+aRl9rG2avH7uj6ok+GB?=
 =?us-ascii?Q?xI1NGDxMWV1fr8Firp+2wqR6K9E5s0wYheMeUCExfDO26KNsLGCJXF8EDaRN?=
 =?us-ascii?Q?m4uFiJzG8ETWval+PMTLfONiuBBGh23lJIXrAxANiLt8cOGA8Z/PU6a1+JUu?=
 =?us-ascii?Q?bL1BQZ3hQjA2J+fzpeQoyXAner1Q7F0R6LhhiAYk137vY5JLlwG3PP+m4Pxu?=
 =?us-ascii?Q?dkFsFkDfOm95/sO1DSl2Ohe7gXZy4SSSqAbytY2DO1fn0CTBmKipej/yfCcC?=
 =?us-ascii?Q?WEjtpyyrPuItG+DKMXLMhPYUVNzlCIQAV3aBj+n/38+2uwL3c3vXZkrjRYfz?=
 =?us-ascii?Q?ITxXTat4ti8Bv/x0oRmCFNeXje5F4W/lZk9STchIthh9Qb32KK7EUrq+lpwN?=
 =?us-ascii?Q?zQxWVaM+JDKne9Kz+q6cvrYR+yUjVUe3KMT5EDMhJjZ8XYk/H9OHcjmVzSCQ?=
 =?us-ascii?Q?e6gxa90PxanpfIn5+OtC3VqhKZHDeFdWah0F3H4k3hiYhsM2g4xR3zSY0Vw9?=
 =?us-ascii?Q?3oAJwOuz4J8myKp4E8geebwBXFdUmo7QKy5Nztdzw+TWUC4N00zYMBKAaTwC?=
 =?us-ascii?Q?cTZ0z3KjQUCg4riFC48jxKCYkXBsI2ETLvUiZsanGKRW/SoxL620Qip8EzTe?=
 =?us-ascii?Q?FjVzC0sbojJqQsz46mlzRddBzq4yjkhmFBn+U+XcHcS+A80FbZE/jV7LkMO2?=
 =?us-ascii?Q?D60B+1IwWTOnsooDMUZYVHBqushuQoI3GpoOb+iS4orGq1CvptTZeh/Ns+2z?=
 =?us-ascii?Q?oiOxIAhStSOwoGcE5dSlJ5YtMMsSWi1Mbo24H9BwI1td6LIkpQtwEw4FwTYj?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3TlVNIBr6uHxuh5sWJiSjgNz9cSsDlmTx3g5SFnqjm4RMBrr8Clc4ZcvFdUurNYNeGU1XMbcaws0tIFMaThPu3DRAWTc4nv1VTVgABTYSTLSsi3LsIDuruvV6zVfAGJj/YDSCQicXJL6q5hyNAjPWLqiXtiU8dCBPYclnaEHIURqaGNTr51bJ2NAXv+JDCNx455UH/7uPzkYMNrl2KAs6j9a0xa8pGCI5iTlTTtCqaPinlL2SarRI3nVcmf1R5WtosjrK3czKbp101IpYIrqS8HaD0rdf5KmZ3wFtuWyHgnDFObRFF5uTpRyvy/dOH1MxdHo8PAcXN0gVWNfN4xT87qT9Lbzosq4IhpLU0k+khlHSEPGNArF7is1OyA9bdSlJ4ypDf3u9SEk9GAOEQ8wOoAJg0g3NMY1uwf/LreQiWa8P/mO5Iy4KsUSfLzd4kz96fve0wNkPXKXtpU0IRXcwEHxZKpvefU2Nb6sfg26t5OoogHdBtFQvwhMBftI5fICqxRa2DUwDaoom8c/l8b6P34MyzhQF9Wu0LFKNJUSBvdRreuOWCHQ+GWr8+aEsXqQhKQ2BYlqM1nIhSnNHCvtO639OaJ8QX+OuKMjIP35MKo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d6969f-327e-4905-130e-08dcf8dc3152
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:58.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5GaS8SS4CpwPhBBJMFd2+YKcILBZWTiaFFzNt/MaZ2q3QhTVAv7HEz/wwZzjUN82a7bG4i0YzFeAiO/vhadag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: 8AmTA3ujtLPOuv57HnvdjjtDoGHQKt6B
X-Proofpoint-ORIG-GUID: 8AmTA3ujtLPOuv57HnvdjjtDoGHQKt6B

- is a line-breaking hyphen, almost always wrong for options.  (Its use
prevents the option from working when pasted into some terminal
emulators.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 cmd/dtrace.8 | 116 +++++++++++++++++++++++++--------------------------
 1 file changed, 58 insertions(+), 58 deletions(-)

diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
index 940ddfc65d1a..a53632949e72 100644
--- a/cmd/dtrace.8
+++ b/cmd/dtrace.8
@@ -57,119 +57,119 @@ Options that generate program stability reports
 Options that modify DTrace tracing and buffering behavior and enable additional D compiler features
 .RE
 .LP
-You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
+You can use \fBdtrace\fR to create D scripts by using it in a \fB#!\fR declaration to create an interpreter file. You can also use \fBdtrace\fR to attempt to compile D programs and determine their properties without actually enabling tracing using the \fB\-e\fR option. See \fBOPTIONS\fR. See the \fIOracle Linux DTrace Guide\fR for detailed examples of how to use the \fBdtrace\fR utility to perform these tasks.
 .SH OPTIONS
 .LP
-The arguments accepted by the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, and \fB-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell. 
+The arguments accepted by the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, and \fB\-i\fR options can include an optional D language \fIpredicate\fR enclosed in slashes \fB//\fR and optional D language \fIaction\fR statement list enclosed in braces \fB{}\fR. D program code specified on the command line must be appropriately quoted to avoid interpretation of meta-characters by the shell.
 .LP
 The following options are supported:
 .TP
-\fB\fB-b\fR \fIbufsz\fR\fR
+\fB\fB\-b\fR \fIbufsz\fR\fR
 Set principal trace buffer size (\fIbufsz\fR). The trace buffer size can include any of the size suffixes \fBk\fR, \fBm\fR, \fBg\fR, or \fBt\fR. If the buffer space cannot be allocated, \fBdtrace\fR attempts to reduce the buffer size or exit depending on the setting of the \fBbufresize\fR property.
 .TP
-\fB\fB-c\fR \fIcmd\fR\fR
-Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+\fB\fB\-c\fR \fIcmd\fR\fR
+Run the specified command \fIcmd\fR and exit upon its completion. If more than one \fB\-c\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each child process as it terminates. The process-ID of the first command is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB-C\fR\fR
-Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB-D\fR, \fB-U\fR, \fB-I\fR, and \fB-H\fR options. You can select the degree of C standard conformance if you use the \fB-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB-X\fR.
+\fB\fB\-C\fR\fR
+Run the C preprocessor \fBcpp\fR(1) over D programs before compiling them. You can pass options to the C preprocessor using the \fB\-D\fR, \fB\-U\fR, \fB\-I\fR, and \fB\-H\fR options. You can select the degree of C standard conformance if you use the \fB\-X\fR option. For a description of the set of tokens defined by the D compiler when invoking the C preprocessor, see \fB\-X\fR.
 .TP
-\fB\fB-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
-Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB-D\fR option to each \fBcpp\fR invocation.
+\fB\fB\-D\fR \fIname\fR \fB[=\fR\fIvalue\fR\fB]\fR\fR
+Define \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). If you specify the equals sign (\fB=\fR) and additional \fIvalue\fR, the name is assigned the corresponding value. This option passes the \fB\-D\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB-e\fR\fR
+\fB\fB\-e\fR\fR
 Exit after compiling any requests, but prior to enabling any probes. You can combine this option with D compiler options. This combination verifies that the programs compile without actually executing them and enabling the corresponding instrumentation.
 .TP
-\fB\fB-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
-Specify function name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-f\fR option on the command line at a time.
+\fB\fB\-f\fR\fB[[\fR\fIprovider\fR\fB:]\fR\fImodule\fR\fB:]\fR\fIfunction\fR\fB[[\fR\fIpredicate\fR\fB]\fR\fIaction\fR\fB]]\fR\fR
+Specify function name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function\fR, \fImodule:function\fR, or \fIfunction\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIfunction\fR are specified in the description, all probes with the corresponding \fIfunction\fR are matched. The \fB\-f\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-f\fR option on the command line at a time.
 .TP
-\fB\fB-F\fR\fR
+\fB\fB\-F\fR\fR
 Coalesce trace output by identifying function entry and return. Function entry probe reports are indented and their output is prefixed with \fB->\fR. Function return probe reports are unindented and their output is prefixed with \fB<-\fR\&. System call entry probe reports are indented and their output is prefixed with \fB=>\fR. System call return probe reports are unindented and their output is prefixed with \fB<=\fR\&.
 .TP
-\fB\fB-G\fR\fR
-Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
+\fB\fB\-G\fR\fR
+Generate an ELF file containing an embedded DTrace program. The DTrace probes specified in the program are saved inside of a relocatable ELF object which can be linked into another program. If the \fB\-o\fR option is present, the ELF file is saved using the pathname specified as the argument for this operand. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fB\fIfilename\fR.d\fR, then the ELF file is saved using the name \fB\fIfilename\fR.o\fR. Otherwise the ELF file is saved using the name \fBd.out\fR.
 .TP
-\fB\fB-H\fR\fR
-Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
+\fB\fB\-H\fR\fR
+Print the pathnames of included files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-H\fR option to each \fBcpp\fR invocation, causing it to display the list of pathnames, one for each line, to \fBstderr\fR.
 .TP
-\fB\fB-h\fR\fR
-Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB-G\fR option. If the \fB-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
+\fB\fB\-h\fR\fR
+Generate a header file containing macros that correspond to probes in the specified provider definitions. This option should be used to generate a header file that is included by other source files for later use with the \fB\-G\fR option. If the \fB\-o\fR option is present, the header file is saved using the pathname specified as the argument for that option. If the \fB\-o\fR option is not present and the DTrace program is contained with a file whose name is \fIfilename\fR\fB\&.d\fR, then the header file is saved using the name \fIfilename\fR\fB\&.h\fR.
 .TP
-\fB\fB-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
-Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB-l\fR. The \fB-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-i\fR option at a time.
+\fB\fB\-i\fR \fIprobe-id\fR\fB[[\fR\fIpredicate\fR] \fIaction\fR\fB]\fR\fR
+Specify probe identifier (\fIprobe-id\fR) to trace or list (\fB\-l\fR option). You can specify probe IDs using decimal integers as shown by \fBdtrace\fR \fB\-l\fR. The \fB\-i\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-i\fR option at a time.
 .TP
-\fB\fB-I\fR \fIpath\fR\fR
-Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
+\fB\fB\-I\fR \fIpath\fR\fR
+Add the specified directory \fIpath\fR to the search path for \fB#include\fR files when invoking \fBcpp\fR(1) (enabled using the \fB\-C\fR option). This option passes the \fB\-I\fR option to each \fBcpp\fR invocation. The specified \fIpath\fR is inserted into the search path ahead of the default directory list.
 .TP
-\fB\fB-L\fR \fIpath\fR\fR
+\fB\fB\-L\fR \fIpath\fR\fR
 Add the specified directory \fIpath\fR to the search path for DTrace libraries. DTrace libraries are used to contain common definitions that can be used when writing D programs. The specified \fIpath\fR is added after the default library search path. If it exists, a subdirectory of \fIpath\fR named after the minor version of the running kernel (e.g. 3.8) is searched immediately before \fIpath\fR. (But take note: dependency analysis is performed only within each directory, not across directories.)
 .TP
-\fB\fB-l\fR\fR
-List probes instead of enabling them. If the \fB-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, \fB-i\fR, and \fB-s\fR options. If none of these options are specified, this option lists all probes.
+\fB\fB\-l\fR\fR
+List probes instead of enabling them. If the \fB\-l\fR option is specified, \fBdtrace\fR produces a report of the probes matching the descriptions given using the \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, \fB\-i\fR, and \fB\-s\fR options. If none of these options are specified, this option lists all probes.
 .TP
-\fB\fB-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
-Specify module name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB-m\fR argument can be suffixed with an optional D probe clause. More than one \fB-m\fR option can be specified on the command line at a time.
+\fB\fB\-m\fR [[\fIprovider:\fR] \fImodule:\fR [[\fIpredicate\fR] \fIaction\fR]]\fR
+Specify module name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module\fR or \fImodule\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fImodule\fR are specified in the description, all probes with a corresponding \fImodule\fR are matched. The \fB\-m\fR argument can be suffixed with an optional D probe clause. More than one \fB\-m\fR option can be specified on the command line at a time.
 .TP
-\fB\fB-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
-Specify probe name to trace or list (\fB-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB-n\fR argument can be suffixed with an optional D probe clause. More than one \fB-n\fR option can be specified on the command line at a time.
+\fB\fB\-n\fR [[[\fIprovider:\fR] \fImodule:\fR] \fIfunction:\fR] \fIname\fR [[\fIpredicate\fR] \fIaction\fR]\fR
+Specify probe name to trace or list (\fB\-l\fR option). The corresponding argument can include any of the probe description forms \fIprovider:module:function:name\fR, \fImodule:function:name\fR, \fIfunction:name\fR, or \fIname\fR. Unspecified probe description fields are left blank and match any probes regardless of the values in those fields. If no qualifiers other than \fIname\fR are specified in the description, all probes with a corresponding \fIname\fR are matched. The \fB\-n\fR argument can be suffixed with an optional D probe clause. More than one \fB\-n\fR option can be specified on the command line at a time.
 .TP
-\fB\fB-o\fR \fIoutput\fR\fR
-Specify the \fIoutput\fR file for the \fB-G\fR, \fB-h\fR, and \fB-l\fR options, or for the traced data itself. If the \fB-G\fR option is present and the \fB-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
+\fB\fB\-o\fR \fIoutput\fR\fR
+Specify the \fIoutput\fR file for the \fB\-G\fR, \fB\-h\fR, and \fB\-l\fR options, or for the traced data itself. If the \fB\-G\fR option is present and the \fB\-s\fR option's argument is of the form \fB\fIfilename\fR.d\fR and \fB\-o\fR is not present, the default output file is \fB\fIfilename\fR.o\fR. Otherwise the default output file is \fBd.out\fR.
 .TP
-\fB\fB-p\fR \fIpid\fR\fR
-Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
+\fB\fB\-p\fR \fIpid\fR\fR
+Grab the specified process-ID \fIpid\fR, cache its symbol tables, and exit upon its completion. If more than one \fB\-p\fR option is present on the command line, \fBdtrace\fR exits when all commands have exited, reporting the exit status for each process as it terminates. The first process-ID is made available to any D programs specified on the command line or using the \fB\-s\fR option through the \fB$target\fR macro variable. Refer to the \fIOracle Linux DTrace Guide\fR for more information on macro variables.
 .TP
-\fB\fB-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
-Specify provider name to trace or list (\fB-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB-P\fR option on the command line at a time.
+\fB\fB\-P\fR \fIprovider\fR \fB[[\fR\fIpredicate\fR\fB]\fR \fIaction\fR]\fR
+Specify provider name to trace or list (\fB\-l\fR option). The remaining probe description fields module, function, and name are left blank and match any probes regardless of the values in those fields. The \fB\-P\fR argument can be suffixed with an optional D probe clause. You can specify more than one \fB\-P\fR option on the command line at a time.
 .TP
-\fB\fB-q\fR\fR
+\fB\fB\-q\fR\fR
 Set quiet mode. \fBdtrace\fR suppresses messages such as the number of probes matched by the specified options and D programs and does not print column headers, the CPU ID, the probe ID, or insert newlines into the output. Only data traced and formatted by D program statements such as \fBtrace()\fR and \fBprintf()\fR is displayed to \fBstdout\fR.
 .TP
-\fB\fB-s\fR\fR
-Compile the specified D program source file. If the \fB-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB-e\fR, \fB-l\fR, or \fB-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
+\fB\fB\-s\fR\fR
+Compile the specified D program source file. If the \fB\-e\fR option is present, the program is compiled but instrumentation is not enabled. If the \fB\-l\fR option is present, the program is compiled and the set of probes matched by it is listed, but instrumentation is not enabled. If none of \fB\-e\fR, \fB\-l\fR, or \fB\-G\fR are present, the instrumentation specified by the D program is enabled and tracing begins.
 .TP
-\fB\fB-S\fR\fR
+\fB\fB\-S\fR\fR
 Show D compiler intermediate code. The D compiler produces a report of the intermediate code generated for each D program to \fBstderr\fR.
 .TP
-\fB\fB-U\fR \fIname\fR\fR
+\fB\fB\-U\fR \fIname\fR\fR
 Undefine the specified \fIname\fR when invoking \fBcpp\fR(1) (enabled using the \fB-C\fR option). This option passes the \fB-U\fR option to each \fBcpp\fR invocation.
 .TP
-\fB\fB-v\fR\fR
-Set verbose mode. If the \fB-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
+\fB\fB\-v\fR\fR
+Set verbose mode. If the \fB\-v\fR option is specified, \fBdtrace\fR produces a program stability report showing the minimum interface stability and dependency level for the specified D programs. DTrace stability levels are explained in further detail in the \fIOracle Linux DTrace Guide\fR.
 .TP
-\fB\fB-V\fR\fR
-Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
+\fB\fB\-V\fR\fR
+Report the highest D programming interface version supported by \fBdtrace\fR. The version information is printed to \fBstdout\fR and the \fBdtrace\fR command exits. Refer to the \fIOracle Linux DTrace Guide\fR for more information about DTrace versioning features. In conjunction with \fB\-v\fR, also reports information on the version of the \fBdtrace\fR(1) tool and associated library.
 .TP
-\fB\fB-w\fR\fR
-Permit destructive actions in D programs specified using the \fB-s\fR, \fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options. If the \fB-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
+\fB\fB\-w\fR\fR
+Permit destructive actions in D programs specified using the \fB\-s\fR, \fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options. If the \fB\-w\fR option is not specified, \fBdtrace\fR does not permit the compilation or enabling of a D program that contains destructive actions.
 .TP
-\fB\fB-x\fR \fIarg\fR [\fI=val\fR]\fR
+\fB\fB\-x\fR \fIarg\fR [\fI=val\fR]\fR
 Enable or modify a DTrace runtime option or D compiler option. The list of options is found in the \fIOracle Linux DTrace Guide\fR. Boolean options are enabled by specifying their name. Options with values are set by separating the option name and value with an equals sign (\fB=\fR).
 .TP
-\fB\fB-Z\fR\fR
-Permit probe descriptions that match zero probes. If the \fB-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB-s\fR option) or on the command line (\fB-P\fR, \fB-m\fR, \fB-f\fR, \fB-n\fR, or \fB-i\fR options) contain descriptions that do not match any known probes.
-
+\fB\fB\-Z\fR\fR
+Permit probe descriptions that match zero probes. If the \fB\-Z\fR option is not specified, \fBdtrace\fR reports an error and exits if any probe descriptions specified in D program files (\fB\-s\fR option) or on the command line (\fB\-P\fR, \fB\-m\fR, \fB\-f\fR, \fB\-n\fR, or \fB\-i\fR options) contain descriptions that do not match any known probes.
+.
 .SH OPERANDS
 .LP
-You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
-
+You can specify zero or more additional arguments on the \fBdtrace\fR command line to define a set of macro variables (\fB$1\fR, \fB$2\fR, and so forth). The additional arguments can be used in D programs specified using the \fB\-s\fR option or on the command line. The use of macro variables is described further in the \fIOracle Linux DTrace Guide\fR.
+.
 .SH EXIT STATUS
 .LP
 The following exit values are returned:
 .TP
 .B 0
 Successful completion. 
-
+.IP
 For D program requests, an exit status of \fB0\fR indicates that programs were successfully compiled, probes were successfully enabled, or anonymous state was successfully retrieved. \fBdtrace\fR returns \fB0\fR even if the specified tracing requests encountered errors or drops.
 .TP
 .B 1
 An error occurred.
-
+.IP
 For D program requests, an exit status of \fB1\fR indicates that program compilation failed or that the specified request could not be satisfied.
 .TP
 .B 2
 Invalid command line options or arguments were specified.
 .\" .RE
-
+.
 .SH "ENVIRONMENT VARIABLES"
 .LP
 The following environment variables are consulted:
@@ -180,7 +180,7 @@ Print CTF type library debugging output on standard error.
 .IP DTRACE_OPT_*
 Set a given DTrace option.
 
-Options set this way are overridden both by options specified via \fB-x\fR on the command line, and by \fBsetopt\fR statements.
+Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
 
 .SH SEE ALSO
 .BR cpp (1),
@@ -190,4 +190,4 @@ Options set this way are overridden both by options specified via \fB-x\fR on th
 
 .SH USAGE
 .LP
-When using the \fB-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if , for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
+When using the \fB\-p\fR flag, \fBdtrace\fR stops the target processes while it is inspecting them and reporting results. A process can do nothing while it is stopped. This means that, if, for example, the X server is inspected by \fBdtrace\fR running in a window under the X server's control, the whole window system can become deadlocked, because the \fBdtrace\fR tool would be attempting to display its results to a window that cannot be refreshed. In such a case, logging in from another system using \fBssh\fR(1) and killing the offending \fBdtrace\fR tool clears the deadlock.
-- 
2.46.0.278.g36e3a12567

