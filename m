Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA4718A92F
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730092728; cv=fail; b=UafRvFcsQS2vit34vkp1Q38+G8g3Ped4Bcs+7N/7yXzePZ2KwDznQmGbFOrZs2NUC6uClU6FUzWVWKX39XDy7aTKHZqFlt54ginpUF6LvTbvZe+COJhTvtSvilKefv6i0oc9mCnbdr8fNUG7SWWvhEy5lvLWma/wW0u5x4tQxMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730092728; c=relaxed/simple;
	bh=dMvMc6DVR5Pf1BsRIpmgRuqXDXljpFO88IN3x4fmrME=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t8V55kOgiwsxUvrl0HU9WIParQjUjW/+F/nrN5jZDa69rE1g//82BivDFGLGJ+WrYx4mEIbKRfIp8jPFWwOXMvrvPLZSXGL95arkJiYOlJwqNPYqVWSN1YhRG4GQJlYFfJjObTl9L9d1r7J0uAJVsu2J5paROd7Wms4e2hTUw6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mu1cWCDM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bxCk/V3A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mu1cWCDM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bxCk/V3A"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RIohhO016080
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=l8DyDeqXdMbpNV0CkJ
	8de6FLMezAfPjyknj2S+3oFig=; b=Mu1cWCDMAxiNrB39/n2JnkJy8CQYj+v5Zi
	8MJ3FnMQsmGgGTXDRxk1YC348qU8aAVFwo22GSIVhG2Oz2ChuQamHQqtYLw+9Lab
	JvfKnXfD3HTnr25WPx//LU8PEI3rqjMmg3JtLN5ViP3kHlpoUS3dR8B5FXWGB9F1
	K/OAAvcQRLOSvRgwaojTweoO1BdTw7tpOE4Z8M+6dKhl+9JCBIUpK0HeWpdvu4uv
	13rmTs0O/BpswH24WC+iIoaQqkZqXME2zzGolC8HMumQDZxBW4q4GAQoBxZdKOjB
	51larr26ESHejYbLkKwMIzncS7BaSCZ8cgkaX+fS+wNaEzAs9z+g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8swwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49S4WNN2036058
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2046.outbound.protection.outlook.com [104.47.55.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hna66p39-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 05:18:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzM8OQgLf/WT0qeUCWUbsifTW4yAvMNzdRKb85mVOtiP6eghTnvJz77297PH6F6RlUIiYJ69iz65lb8K/YP+yz8vzNT+E7aHZG0ffdBN0YZKb403UBgOUniUkgo7tgiJfPvG488z0fkCAP49Ol4CgkobGP1+aST6zsN/yWdoInnNBG4n5IPfyMest7KYhTxVWyu8xZoQZfC0Z2kyki8Ucxl9d4o+biMndRNaqoKScc1WyNnUmlajoG+GJ2TF5jgSB8D6pLOvoEm/CuslrXwJPrhnPjO6M24xu8ikJGvtNOy4fpyT7UGo33xRSbvqqDFARBUHvTRxgrrfk6Oxs8/PSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8DyDeqXdMbpNV0CkJ8de6FLMezAfPjyknj2S+3oFig=;
 b=iUJ97eF4U3w/o2UL4d582DWDd1gtRDSB5Cq81lmj8yQNrlQS3ItvEu8VH3VUlQ7s0swKsJHsDA9TkXx0pPxI2jnP5NLDFCQ86vNp7fF/2MA7mZRcjnmNpQCtAfEOB5h/cJ6GHFyu4biNfj7KOL8LZ36oE0z4XDrHxT3LB5892dhxdUC8CtXL7/myD2m/FHwNEluxwDTpEaUMP/ycQYTR+1W51FYD4JxIZzuLl17c9yuV4Gpvg+GrE2ZyA7WOdSxJHO8I4LTco+mtbG+5lEQPLvMm+doneejy28p3MCh7ctJ9+0vnyoEQIuC4lWSnXDlmwUbBrCk6U8kQISkUCBYhOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8DyDeqXdMbpNV0CkJ8de6FLMezAfPjyknj2S+3oFig=;
 b=bxCk/V3AHLarBj5CdZBxtXrzutvWzdvEke8M2lTdYop12cRNXyLvJQyRXBnqvPbjh6w16AQdheflZZ532nDRHbO0nlaY5Ic3sl/tVGPr6BEVZyy6lMBDAad0LVgotaRt8dQVFXKoaPt+UA7cnWChEUsQAusQjsOdBr792qBjELs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5757.namprd10.prod.outlook.com (2603:10b6:806:23e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 05:18:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 05:18:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v7 07/19] Create the BPF usdt_names and usdt_prids maps
Date: Mon, 28 Oct 2024 01:18:36 -0400
Message-Id: <20241028051836.16792-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241028051836.16792-1-eugene.loh@oracle.com>
References: <20241028051836.16792-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: 410a8e69-be16-4d2d-7525-08dcf70ffb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WqDEBnfiaUQ8PwyQ1rA2+VO7pyoslpyWjCW/egdVOjHKiqpZ9jol3UcOvVDc?=
 =?us-ascii?Q?jEDeJKPn/p7CQ5oJdkryA8ijhfPVOZO56EekjgiVyUxj2jAHzAuNAbnuwrjw?=
 =?us-ascii?Q?KacU4ld5x9oK9aY/xYQGaUZxZlaTm3hi7vqW1Pz2D21+P2TIY1NJS4v+BaBS?=
 =?us-ascii?Q?6rEmPQv5IrvX/I7EQc3zN2ESeL7VyvIOSbH/7znah9ILqItfJ2obl+1QEGKP?=
 =?us-ascii?Q?AEnhmz/A6vm/uHMUBl4P96mcmrRfftPkjeveCssHzSBs8N6LeL3ww8TvRuOe?=
 =?us-ascii?Q?lYzsLHN28Nnj+LCwKGemHHqYDdVGNKrh7Kn13er3V8XPZ5M3qhXhns2/gzjy?=
 =?us-ascii?Q?RQUCwk8sUj1MyIGJoF3KidygUoeVhsHR+y+osohMCGAXoZgMrWh/v0KhkWcX?=
 =?us-ascii?Q?OD9Xe3cIirmzLYx/McGwW8G0vUZLyB4joHokaJsf14uIlYEqdEiYfO2To+l+?=
 =?us-ascii?Q?2kCEuf6yfGzaS1nmcSj5uB2Pa71PASwuAHVhsk1DFtUlCGR1mQdVEDyFCzQd?=
 =?us-ascii?Q?1Cqwqx+8iA+Jr/IuTArLQJutByk3GAfUpdeVrFmdCrzWKNojloN3qcQhZhwp?=
 =?us-ascii?Q?YgipQb76k8Ro6Kaeq05oHzo2CRw/048vaLyN4CAY1U5U8NCfg99UFlQV81K8?=
 =?us-ascii?Q?CK4CJN4CKsP9sSVfandgggayb1K5fvi888LdTvx5D78K4cKO86dQlIf0R16a?=
 =?us-ascii?Q?gTDYMN7iWkEU/mocWS2K2hFUCsEoiW6PIu8sxTdVukyjQeMhThul6Z8A6yOI?=
 =?us-ascii?Q?n+745HqkK42CamVPJXCxggyhDx3hcnWeC/1KF9yyc+QC5z4eoiuI1xVxiTNZ?=
 =?us-ascii?Q?OKnNrafVPGU67/wuWlT+DhI5Caoi/XPFnP1bnXrlGQKqBVUSE63URAUlB78n?=
 =?us-ascii?Q?y/Wuaf/6ISzmfNeJgTvolpp2qO7RuFgKwsr8f9ZwDl5bDmcwVQeAtSEiysw8?=
 =?us-ascii?Q?WSgep992525D0Y499W8QbhPjSiyQS3Z435ETeR/IoMnOMKkMNvKCsWSsk056?=
 =?us-ascii?Q?p5jIxrMq1MuXnDG5GMar/bXI1vrZhw04KtcxOym76og4Bv3oANl57LnX2+LE?=
 =?us-ascii?Q?1dT46tnwgyIKX351yTADVx0ayhUMLCnJePPAXFdrsYlxTA0eesaQ0BD3XGFs?=
 =?us-ascii?Q?SRx05hr2LN4k9LvXVTdQgUFZcwxti/49Q0g8qIjx0ElbdgNlRX1ViDbwOLBz?=
 =?us-ascii?Q?qrL5PDGV8M3BohjxgOySgEpN0+sF9b57FJAibk5Z1czFOOvyouNFNF5OElpA?=
 =?us-ascii?Q?z78FFmKd5Y2TF/AmxP9HyGfs/XXi5SFTXu/sLTrst3RVHTXl7R3yb1CeKjNF?=
 =?us-ascii?Q?k2aeJm0jr6xl+l5dAcCpATxi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ymPQ4rhNkNUIacA7osYeMKocGp46ERpsxMlPWH7VWKSGtkkA2NUuB0h0pToB?=
 =?us-ascii?Q?uZbMFYYO/o4GiL0USJq50ptpB8rASIGlxQBcNTpA9+waPh9psZ3jexkFrI/C?=
 =?us-ascii?Q?k9NC+dqLOoPx6fVjHV9XYx/HYdSEGCIdvs2EKS3EIoD/u6L+GY37y6dDaXz6?=
 =?us-ascii?Q?AHMGYSyBiDRRZJ9OHpyMd38JG/j1vLMa5wONV8F01vVtzlXlNAhWcLUjO4IC?=
 =?us-ascii?Q?Q4LW5yOP/59rt98dOXoaSqE0FIt4/2o/smkXySEXXe/ihhCnjZrjzP5wisrT?=
 =?us-ascii?Q?54wEZ1Qg6yNLKJTHbb2s/mq7Np6Ph55p4L6mcJuklZBn2hRYJ5csHUcvkHaU?=
 =?us-ascii?Q?xyanEbv4fTJElU/MvyUJWYWYIznVQCEIOCfGGedRrRz8PgUHU9RKdSClL7Vl?=
 =?us-ascii?Q?uIbme65tRNJxEGjCTgBteTwuc8XmNPv8VW77DPZuo+H+oUSfowWCw30iYhWX?=
 =?us-ascii?Q?JcKUS9wqXC7UKiVAN+2j7AKO2yavX9wOUQpPNo+Uao1S4gUz0Z15Ah2fBq7w?=
 =?us-ascii?Q?RX603LjgmbTTa7PSbDQWdfFsH+njo8UKqWyo2fSLC02mKYBRs/WlqBLWFURU?=
 =?us-ascii?Q?EoOYUYnEzG9dAF5JIvIT3UT8IPWzJW8cqiImYlw93TmyF+uv+3JCItq4DaUB?=
 =?us-ascii?Q?naw14Gkemc69pmgyMfnK1a7DJ0FsrYkyIqJbjWDpDbfym3mlIlL6qiBgCKNg?=
 =?us-ascii?Q?qpc9HWRmcQYvGHm1KutppFavCb0PXuicyotL1LeR5mXXrUodAAPbNNeXgNG/?=
 =?us-ascii?Q?9EFUgP9n98F6NXoSqXTonE7b45eGQdCdTQhouXwGR2g4xLotF2N2Hb6gaJlw?=
 =?us-ascii?Q?GH0Gh/+rshilhS8DY1DYuPRmFtriW8dK9H7BNa2EHSPyKdSepyGO9MHGbtNx?=
 =?us-ascii?Q?grwK1YnkKLuB336RegUxO0OCwl9ZAkqF+6tsHrn8rO92EKkNOarJc7zCBMSY?=
 =?us-ascii?Q?4+foNFg4LiTNiYVtl3UUUW72XZfMChVyT8CEFi3PLynRCKbXwspHfJkbCFF5?=
 =?us-ascii?Q?MAuIJxs7yaJUCc9mqGI5/MHHnnd0dCDZP5lV33I9Y2q9loztnGDjcA5OmUDQ?=
 =?us-ascii?Q?BFELjZCHYyfUbuEJyHk8CgqlPRU/GoNnezbR1k4GROGGNHQeQBE5m0I+ZNSk?=
 =?us-ascii?Q?sXUhxfRge24StIU8P5NutRW27srwne/geHScpmkjUihm6hA57CniNBK5kInS?=
 =?us-ascii?Q?v9MD+PNE6V+YSfRXupEebw9PedepLqtu2owf+wTb/yvPzqnh1Nrr5PnWFUCj?=
 =?us-ascii?Q?Hp2oKVL5dPUQxT6ffgU/AnEfxacauCKCdxjdwiOieQUCi+AswUZfYdbBIIUz?=
 =?us-ascii?Q?IUv09lvs0x6EsIM/hZthSuKiI0JwPTIM4QO+shm/CeHS82eiU9wZZWjfep2r?=
 =?us-ascii?Q?HeNPHZ4q5BBJt0Mm1echP6heZPjgj2HHWEds1hjVvva4f/AXJwufGdO4eNB6?=
 =?us-ascii?Q?TIBQBcoDDmyD3r4odNaD3y/+pSqKXI/qRhRIpmhW0XIqFzdDl/FXAyUJCpEl?=
 =?us-ascii?Q?kUGhueB0ee/uiicQZ0acvPQiIQ6CytFD2GRIFxMd/v4m+o9Hn25frLWXbG4P?=
 =?us-ascii?Q?r/AGJ65vsP0BsKmOahTR8RQAVubTKsa+28qa5Ig6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U0yMN358T41tgn3tcXm1H2N0MBo1KCGiWUQLx4qpxTqllASHB72GS4MIAKL7lbA0+DCUsaTgXGHilb7SeH+dDH6TeLNtFScMjvFzPVO230lbM2sVL02YDYeTACpXDYr+yOFTGSkfGsh5qKyu5JCYXG2j4dQlUDNibj+i6yenwtt5A4tMGCY/XmQFDkGQ2D7Ru8JMPoReNdH7WRZV7AJQChwE+pv6fgb0rhsZ3ENj5KSy8OZiYDqlkBVLa2+LlDvsRoSfOj9WFyWKqnyJz+zrvKB29tL6+P9jYaysbYEZv3lBVT1F89hNuI7KXZpU2rzpMH7N2+G+ejD2LmFB7DovWbKM4JibNfA2KS9oSF8sGme4NseJcYiybSCeFUUh8rXRKRUfBalgjV8y5WblEWcxyiCycNI4gsnookXPKs26xn6eagXOeLdbKu3PakC/J1qf2V8N3XIuPhee7SLQqOZxyadTMteDTPJZyLwOGZhrH5su41MSxyN+WTXjltsqi6ptP+PG4fhwrKUhz0WqhlwcGtfBoCzo3WMyZI2y6B/dwqTESJkjcFKITSc3mXc87x72s+WL4nhg9wCt056rLDiaFFkmeNWTQ3RJ28NdQlkBvrk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410a8e69-be16-4d2d-7525-08dcf70ffb6c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 05:18:39.6158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgvrYwIoqhZzuFAduD2KbqOn35d+OfoHvxRhdwnTsQzOMZXlP65falgtRMiq4sHms/16C19r3+LhaCPjUF+7nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5757
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-27_08,2024-10-28_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280043
X-Proofpoint-GUID: mP6yGr1uUlDu0a7nHeQLUjMmeQYJdZJD
X-Proofpoint-ORIG-GUID: mP6yGr1uUlDu0a7nHeQLUjMmeQYJdZJD

From: Eugene Loh <eugene.loh@oracle.com>

As USDT processes come and go, the set of overlying probes for an
underlying probe will change.  Hence, we will move to a scheme in
which an underlying probe program will walk all possible clauses
that any of its possible overlying probes might call, for each
overlying probe only executing the clauses that apply, using a
bitmask.

In this patch, we create and update the BPF "usdt_prids" map.  This
is a hash map, where:

  *)  the key (size: dtp->dt_usdt_pridsmap_ksz) comprises
        - the PID of the firing process
        - the PRID of the underlying probe

  *)  the value (size: dtp->dt_usdt_pridsmap_vsz) comprises
        - the PRID over the overlying USDT probe
        - a bit mask indicating which clauses should be called

As USDT processes start up, we also add new overlying USDT probes,
whose name elements must be retrievable by prid for the built-in
variables probeprov, probemod, probefunc, and probename.  While
those strings are currently in the BPF "strtab" map, that monolithic
table cannot safely be updated by the consumer while the kernel might
be reading the map.  Therefore, we introduce a new variable,
dtp->dt_nprobes, that records the number of probes at the time of
dtrace_go().  For a prid < dtp->nprobes, get_bvar() uses the existing
scheme to retrieve probe name elements.  For newer prids, necessarily
USDT probes, use the new BPF "usdt_names" map instead.

The number of new USDT probes that can be accommodated at any one time
is set by the new "nusdtprobes" option.

The size of the bit mask limits the number of clauses, currently 64,
an underlying probe might call.  This is relatively easy to extend;
nevertheless, that work is left for a future patch.

We also want to be able to add new underlying probes, even after
dtrace_go() has finished.  Therefore, make dt_bpf_load_prog() callable
outside of dt_bpf.c and call dt_construct(), dt_link(),
dt_bpf_load_prog(), and attach() to add any new underlying probes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/get_bvar.c                   |  72 ++++---
 include/dtrace/options_defines.h |   4 +-
 libdtrace/dt_bpf.c               |  38 +++-
 libdtrace/dt_bpf.h               |   4 +
 libdtrace/dt_bpf_maps.h          |   9 +
 libdtrace/dt_cc.c                |   3 +
 libdtrace/dt_dlibs.c             |   3 +
 libdtrace/dt_impl.h              |   5 +-
 libdtrace/dt_open.c              |   8 +
 libdtrace/dt_options.c           |   1 +
 libdtrace/dt_prov_uprobe.c       | 336 ++++++++++++++++++++++++++++++-
 libdtrace/dt_provider.c          |   1 +
 libdtrace/dt_provider.h          |   1 +
 13 files changed, 455 insertions(+), 30 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index 37f29a591..ceb700bf1 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -22,6 +22,7 @@
 extern struct bpf_map_def cpuinfo;
 extern struct bpf_map_def probes;
 extern struct bpf_map_def state;
+extern struct bpf_map_def usdt_names;
 
 extern uint64_t PC;
 extern uint64_t STBSZ;
@@ -29,6 +30,7 @@ extern uint64_t STKSIZ;
 extern uint64_t BOOTTM;
 extern uint64_t STACK_OFF;
 extern uint64_t STACK_SKIP;
+extern uint64_t NPROBES;
 
 #define error(dctx, fault, illval) \
 	({ \
@@ -122,32 +124,52 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 	case DIF_VAR_PROBEMOD:
 	case DIF_VAR_PROBEFUNC:
 	case DIF_VAR_PROBENAME: {
-		uint32_t	key;
-		dt_bpf_probe_t	*pinfo;
-		uint64_t	off;
-
-		key = mst->prid;
-		pinfo = bpf_map_lookup_elem(&probes, &key);
-		if (pinfo == NULL)
-			return (uint64_t)dctx->strtab;
-
-		switch (id) {
-		case DIF_VAR_PROBEPROV:
-			off = pinfo->prv;
-			break;
-		case DIF_VAR_PROBEMOD:
-			off = pinfo->mod;
-			break;
-		case DIF_VAR_PROBEFUNC:
-			off = pinfo->fun;
-			break;
-		case DIF_VAR_PROBENAME:
-			off = pinfo->prb;
+		uint32_t	key = mst->prid;
+
+		if (key < ((uint64_t)&NPROBES)) {
+			dt_bpf_probe_t	*pinfo;
+			uint64_t	off;
+
+			pinfo = bpf_map_lookup_elem(&probes, &key);
+			if (pinfo == NULL)
+				return (uint64_t)dctx->strtab;
+
+			switch (id) {
+			case DIF_VAR_PROBEPROV:
+				off = pinfo->prv;
+				break;
+			case DIF_VAR_PROBEMOD:
+				off = pinfo->mod;
+				break;
+			case DIF_VAR_PROBEFUNC:
+				off = pinfo->fun;
+				break;
+			case DIF_VAR_PROBENAME:
+				off = pinfo->prb;
+			}
+			if (off > (uint64_t)&STBSZ)
+				return (uint64_t)dctx->strtab;
+
+			return (uint64_t)(dctx->strtab + off);
+		} else {
+			char *s;
+
+			s = bpf_map_lookup_elem(&usdt_names, &key);
+			if (s == NULL)
+				return (uint64_t)dctx->strtab;
+
+			switch (id) {
+			case DIF_VAR_PROBENAME:
+				s += DTRACE_FUNCNAMELEN;
+			case DIF_VAR_PROBEFUNC:
+				s += DTRACE_MODNAMELEN;
+			case DIF_VAR_PROBEMOD:
+				s += DTRACE_PROVNAMELEN;
+			case DIF_VAR_PROBEPROV:
+			}
+
+			return (uint64_t)s;
 		}
-		if (off > (uint64_t)&STBSZ)
-			return (uint64_t)dctx->strtab;
-
-		return (uint64_t)(dctx->strtab + off);
 	}
 	case DIF_VAR_PID: {
 		uint64_t	val = bpf_get_current_pid_tgid();
diff --git a/include/dtrace/options_defines.h b/include/dtrace/options_defines.h
index 80246be8c..7a49b89f2 100644
--- a/include/dtrace/options_defines.h
+++ b/include/dtrace/options_defines.h
@@ -63,7 +63,9 @@
 #define	DTRACEOPT_SCRATCHSIZE	33	/* max scratch size permitted */
 #define	DTRACEOPT_LOCKMEM	34	/* max locked memory */
 #define	DTRACEOPT_PRINTSIZE	35	/* max # bytes printed by print() action */
-#define	DTRACEOPT_MAX		36	/* number of options */
+#define	DTRACEOPT_NUSDTPROBES	36	/* max number of (added) USDT probes */
+
+#define	DTRACEOPT_MAX		37	/* number of options */
 
 #define	DTRACEOPT_UNSET		(dtrace_optval_t)-2	/* unset option */
 
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 856110306..2a946f0de 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -940,6 +940,41 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Create the 'usdt_names' and 'usdt_prids' BPF maps.
+ *
+ * 'usdt_names':  a global hash map indexed by PRID and whose value has probe
+ *                name elements at fixed offsets within the value.  This map
+ *                is used for get_bvar() to look up probe name elements for
+ *                any prid that was created after dtrace_go().
+ *
+ * 'usdt_prids':  a global hash map indexed by (pid, underlying probe ID).
+ *                The value is a probe ID for the overlying USDT probe and
+ *                a bit mask indicating which clauses to execute for this pid.
+ *
+ *                For a given (pid, PRID) key, there can be at most one
+ *                overlying USDT probe.
+ */
+static int
+gmap_create_usdt(dtrace_hdl_t *dtp)
+{
+	size_t nusdtprobes = dtp->dt_options[DTRACEOPT_NUSDTPROBES];
+
+	dtp->dt_usdt_namesmap_fd = create_gmap(dtp, "usdt_names", BPF_MAP_TYPE_HASH,
+	    sizeof(dtrace_id_t), DTRACE_FULLNAMELEN, nusdtprobes);
+	if (dtp->dt_usdt_namesmap_fd == -1)
+		return -1;
+
+	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
+	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
+	if (dtp->dt_usdt_pridsmap_fd == -1)
+		return -1;
+
+	dtp->dt_nprobes = dtp->dt_probe_id;
+
+	return 0;
+}
+
 /*
  * Create the 'gvars' BPF map.
  *
@@ -1045,6 +1080,7 @@ dt_bpf_gmap_create(dtrace_hdl_t *dtp)
 	CREATE_MAP(scratchmem)
 	CREATE_MAP(strtab)
 	CREATE_MAP(probes)
+	CREATE_MAP(usdt)
 	CREATE_MAP(gvars)
 	CREATE_MAP(lvars)
 	CREATE_MAP(dvars)
@@ -1093,7 +1129,7 @@ dt_bpf_reloc_prog(dtrace_hdl_t *dtp, const dtrace_difo_t *dp)
  *
  * Note that DTrace generates BPF programs that are licensed under the GPL.
  */
-static int
+int
 dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		 const dtrace_difo_t *dp, uint_t cflags)
 {
diff --git a/libdtrace/dt_bpf.h b/libdtrace/dt_bpf.h
index 5716d2320..6518de663 100644
--- a/libdtrace/dt_bpf.h
+++ b/libdtrace/dt_bpf.h
@@ -14,6 +14,7 @@
 #include <dtrace/difo.h>
 #include <dt_btf.h>
 #include <dt_impl.h>
+#include <dt_probe.h>
 
 struct dtrace_hdl;
 
@@ -54,6 +55,7 @@ extern "C" {
 #define DT_CONST_ZERO_OFF		20
 #define DT_CONST_STACK_OFF		21
 #define DT_CONST_STACK_SKIP		22
+#define DT_CONST_NPROBES		23
 
 #define DT_BPF_LOG_SIZE_DEFAULT	(UINT32_MAX >> 8)
 #define DT_BPF_LOG_SIZE_SMALL	4096
@@ -88,6 +90,8 @@ extern int dt_bpf_prog_load(struct dtrace_hdl *, const struct dt_probe *prp,
 			    size_t sz);
 extern int dt_bpf_raw_tracepoint_open(const void *tp, int fd);
 extern int dt_bpf_make_progs(struct dtrace_hdl *, uint_t);
+extern int dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
+			    const dtrace_difo_t *dp, uint_t cflags);
 extern int dt_bpf_load_progs(struct dtrace_hdl *, uint_t);
 extern void dt_bpf_init(struct dtrace_hdl *dtp);
 
diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
index 0dd36b16c..3a42ee5ad 100644
--- a/libdtrace/dt_bpf_maps.h
+++ b/libdtrace/dt_bpf_maps.h
@@ -42,6 +42,15 @@ struct dt_bpf_cpuinfo {
 	uint64_t	lockstat_stime;	/* lockstat: spin time */
 };
 
+typedef struct usdt_prids_map_key {
+	int		pid;		/* should be pid_t, unistd.h? */
+	uint32_t	uprid;		/* should be dtrace_id_t, sys/dtrace_types.h */
+} usdt_prids_map_key_t;
+typedef struct usdt_prids_map_val {
+	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
+	long long	mask;
+} usdt_prids_map_val_t;
+
 #ifdef  __cplusplus
 }
 #endif
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index 4202771a9..fa16f8e5f 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -1064,6 +1064,9 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 				nrp->dofr_data = sizeof(uint64_t)
 				    * dtp->dt_options[DTRACEOPT_MAXFRAMES];
 				continue;
+			case DT_CONST_NPROBES:
+				nrp->dofr_data = dtp->dt_nprobes;
+				continue;
 			case DT_CONST_BOOTTM:
 				if (boottime == 0 && get_boottime())
 					return -1;
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index ba4d4abef..07d22afdc 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -71,6 +71,8 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(state, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(strtab, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_names, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
 
 	/* BPF internal identifiers */
 	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
@@ -95,6 +97,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL_ID(ZERO_OFF, DT_IDENT_SCALAR, DT_CONST_ZERO_OFF),
 	DT_BPF_SYMBOL_ID(STACK_OFF, DT_IDENT_SCALAR, DT_CONST_STACK_OFF),
 	DT_BPF_SYMBOL_ID(STACK_SKIP, DT_IDENT_SCALAR, DT_CONST_STACK_SKIP),
+	DT_BPF_SYMBOL_ID(NPROBES, DT_IDENT_SCALAR, DT_CONST_NPROBES),
 
 	/* End-of-list marker */
 	{ NULL, }
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 340dc1960..36afa4c68 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -319,7 +319,8 @@ struct dtrace_hdl {
 	 */
 	struct dt_probe **dt_probes; /* array of probes */
 	size_t dt_probes_sz;	/* size of array of probes */
-	uint32_t dt_probe_id;	/* next available probe id */
+	dtrace_id_t dt_probe_id; /* next available probe id */
+	dtrace_id_t dt_nprobes;	/* number of probes, at dtrace_go() */
 
 	struct dt_probe *dt_error; /* ERROR probe */
 
@@ -389,6 +390,8 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
+	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
 	dtrace_handle_drop_f *dt_drophdlr; /* drop handler, if any */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 1f586fc4f..e1972aa82 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -797,6 +797,14 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_options[DTRACEOPT_SWITCHRATE] = 0;
 	dtp->dt_options[DTRACEOPT_AGGRATE] = 0;
 
+	/*
+	 * Set the default maximum number of (added) USDT probes.
+	 */
+	dtp->dt_options[DTRACEOPT_NUSDTPROBES] = 256;
+
+	/*
+	 * Pre-processor.
+	 */
 	dtp->dt_cpp_argv[0] = (char *)strbasename(dtp->dt_cpp_path);
 
 	snprintf(isadef, sizeof(isadef), "-D__SUNW_D_%u",
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index ec53358b3..377b396b0 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -1137,6 +1137,7 @@ static const dt_option_t _dtrace_rtoptions[] = {
 	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
 	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
 	{ "maxframes", dt_opt_runtime, DTRACEOPT_MAXFRAMES },
+	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
 	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
 	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
 	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index bb172ace2..8437a7ed1 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -39,6 +39,7 @@
 #include "dt_probe.h"
 #include "dt_pid.h"
 #include "dt_string.h"
+#include "port.h"
 
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
@@ -63,6 +64,11 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct list_key {
+	dt_list_t		list;
+	usdt_prids_map_key_t	key;
+} list_key_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -82,8 +88,15 @@ static int populate(dtrace_hdl_t *dtp)
 	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
 			       &dt_uprobe_is_enabled, &pattr, NULL) == NULL ||
 	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
-			       NULL) == NULL ||
-	    dt_provider_create(dtp, dt_usdt.name, &dt_usdt, &pattr,
+			       NULL) == NULL)
+		return -1;			/* errno already set */
+
+	return 0;
+}
+
+static int populate_usdt(dtrace_hdl_t *dtp)
+{
+	if (dt_provider_create(dtp, dt_usdt.name, &dt_usdt, &pattr,
 			       NULL) == NULL)
 		return -1;			/* errno already set */
 
@@ -123,6 +136,321 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+/*
+ * Disable an overlying USDT probe.
+ */
+static void probe_disable(dtrace_hdl_t *dtp, dt_probe_t *prp)
+{
+	list_probe_t	*pup;
+
+	/* Remove from enablings. */
+	dt_list_delete(&dtp->dt_enablings, prp);
+
+	/* Make it evident from the probe that it is not in enablings. */
+	((dt_list_t *)prp)->dl_prev = NULL;
+	((dt_list_t *)prp)->dl_next = NULL;
+
+	/* Free up its list of underlying probes. */
+	while ((pup = dt_list_next(prp->prv_data)) != NULL) {
+		dt_list_delete(prp->prv_data, pup);
+		dt_free(dtp, pup);
+	}
+	dt_free(dtp, prp->prv_data);
+	prp->prv_data = NULL;
+}
+
+/*
+ * Clean up stale pids from among the USDT probes.
+ */
+static int
+clean_usdt_probes(dtrace_hdl_t *dtp)
+{
+	int			fdprids = dtp->dt_usdt_pridsmap_fd;
+	int			fdnames = dtp->dt_usdt_namesmap_fd;
+	usdt_prids_map_key_t	key, nxt;
+	usdt_prids_map_val_t	val;
+	list_key_t		keys_to_delete, *elem, *elem_next;
+	dt_probe_t		*prp, *prp_next;
+
+	/* Initialize list of usdt_prids keys to delete. */
+	memset(&keys_to_delete, 0, sizeof(keys_to_delete));
+
+	/* Initialize usdt_prids key to a pid/uprid that cannot be found. */
+	key.pid = 0;
+	key.uprid = 0;
+
+	/* Loop over usdt_prids entries. */
+	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
+		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
+
+		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
+			return dt_set_errno(dtp, EDT_BPF);
+
+		/* Check if the process is still running. */
+		if (!Pexists(key.pid)) {
+			/*
+			 * Delete the usdt_names entry.
+			 *
+			 * Note that a PRID might correspond to multiple
+			 * sites.  So, as we loop over usdt_prids entries,
+			 * we might delete the same usdt_names entry
+			 * multiple times.  That's okay.
+			 */
+			dt_bpf_map_delete(fdnames, &val.prid);
+
+			/*
+			 * Delete the usdt_prids entry.
+			 *
+			 * Note that we do not want to disrupt the iterator.
+			 * So we just add the key to a list and will walk
+			 * the list later for actual deletion.
+			 */
+			elem = calloc(1, sizeof(list_key_t));
+			elem->key.pid = key.pid;
+			elem->key.uprid = key.uprid;
+			dt_list_append((dt_list_t *)&keys_to_delete, elem);
+
+			continue;
+		}
+
+		/*
+		 * FIXME.  There might be another case, where the process
+		 * is still running, but some of its USDT probes are gone?
+		 * So maybe we have to check for the existence of one of
+		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
+		 *     char *prv = ...pdp->prv minus the numerial part;
+		 *
+		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
+		 */
+	}
+
+	/*
+	 * Delete the usdt_prids keys in our list.
+	 */
+	for (elem = dt_list_next(&keys_to_delete); elem != NULL; elem = elem_next) {
+		elem_next = dt_list_next(elem);
+
+		dt_bpf_map_delete(fdprids, &elem->key);
+		free(elem);
+	}
+
+	/* Clean up enablings. */
+	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
+		pid_t		pid;
+
+		prp_next = dt_list_next(prp);
+
+		/* Make sure it is an overlying USDT probe. */
+		if (prp->prov->impl != &dt_usdt)
+			continue;
+
+		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+		/*
+		 * Nick writes:
+		 * This is a general problem with running compiler-adjacent things outside
+		 * compile time. I think we should adjust dt_pid_error() so that it works
+		 * with NULL pcb and dpr at once, probably by using the code path for
+		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
+		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
+		 * already handle this case.)
+		 */
+		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+		if (Pexists(pid))
+			continue;
+
+		probe_disable(dtp, prp);
+	}
+
+	return 0;
+}
+
+static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
+{
+	dtrace_difo_t   *dp;
+	int		cflags, fd, rc = -1;
+	dtrace_optval_t	dest_ok = DTRACEOPT_UNSET;
+
+	if (dtp->dt_active == 0)
+		return 0;
+
+	/*
+	 * Strictly speaking, we want the value passed in to
+	 * dtrace_go().  In practice, its flags pertain to
+	 * compilation and disassembly, which at this stage
+	 * no longer interest us.
+	 * FIXME:  Actually, we might want debug output (e.g.,
+	 * disassembly) for trampoline construction.
+	 */
+	cflags = 0;
+
+	/* Check if the probe is already set up. */
+	if (prp->difo)
+		return 0;
+
+	/* Make program. */
+	dp = dt_construct(dtp, prp, cflags, NULL);
+	if (dp == NULL)
+		return 0;        // FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
+	prp->difo = dp;
+
+	/* Load program. */
+	if (dt_link(dtp, prp, dp, NULL) == -1)
+		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+
+	dtrace_getopt(dtp, "destructive", &dest_ok);
+	if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
+	    dest_ok == DTRACEOPT_UNSET)
+		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+
+	fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
+	if (fd == -1)
+		return 0;        // FIXME in dt_bpf_load_progs() this is a fatal error; should we do the same here?
+
+	if (prp->prov->impl->attach)
+		rc = prp->prov->impl->attach(dtp, prp, fd);
+
+	if (rc == -ENOTSUPP) {
+		char    *s;
+
+		close(fd);
+		if (asprintf(&s, "Failed to enable %s:%s:%s:%s",
+			      prp->desc->prv, prp->desc->mod,
+			      prp->desc->fun, prp->desc->prb) == -1)
+			return dt_set_errno(dtp, EDT_ENABLING_ERR);
+		dt_handle_rawerr(dtp, s);
+		free(s);
+	} else if (rc < 0) {
+		close(fd);
+		return dt_set_errno(dtp, EDT_ENABLING_ERR);
+	}
+
+	return 0;
+}
+
+static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
+{
+	char				probnam[DTRACE_FULLNAMELEN], *p;
+	const dtrace_probedesc_t	*pdp = prp->desc;
+	int				fd = dtp->dt_usdt_namesmap_fd;
+	pid_t				pid;
+	list_probe_t			*pup;
+
+	/* Add probe name elements to usdt_names map. */
+	p = probnam;
+	memset(p, 0, sizeof(probnam));
+	snprintf(p, DTRACE_PROVNAMELEN, "%s", pdp->prv);
+	p += DTRACE_PROVNAMELEN;
+	snprintf(p, DTRACE_MODNAMELEN, "%s", pdp->mod);
+	p += DTRACE_MODNAMELEN;
+	snprintf(p, DTRACE_FUNCNAMELEN, "%s", pdp->fun);
+	p += DTRACE_FUNCNAMELEN;
+	snprintf(p, DTRACE_NAMELEN, "%s", pdp->prb);
+	if (dt_bpf_map_update(fd, &pdp->id, probnam) == -1)
+		assert(0);   // FIXME do something here
+
+	/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
+	/*
+	 * Nick writes:
+	 * This is a general problem with running compiler-adjacent things outside
+	 * compile time. I think we should adjust dt_pid_error() so that it works
+	 * with NULL pcb and dpr at once, probably by using the code path for
+	 * pcb != NULL and augmenting it so that it passes in NULL for the region and
+	 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
+	 * already handle this case.)
+	 */
+	pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
+
+	/* Even though we just enabled this, check it's still live. */
+	if (!Pexists(pid)) {
+		probe_disable(dtp, prp);
+		dt_bpf_map_delete(fd, &pdp->id);
+
+		return 0;
+	}
+
+	/* Add prid and bit mask to usdt_prids map. */
+	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
+		dt_probe_t		*uprp = pup->probe;
+		long long		mask = 0, bit = 1;
+		usdt_prids_map_key_t	key;
+		usdt_prids_map_val_t	val;
+		dt_uprobe_t		*upp = uprp->prv_data;
+
+		/*
+		 * For is-enabled probes, the bit mask does not matter.
+		 * It is possible that we have this underlying probe due to
+		 * an overlying pid-offset probe and that we will not know
+		 * until later, when some new pid is created, that we also
+		 * have an overlying USDT is-enabled probe, but missing this
+		 * optimization opportunity is okay.
+		 */
+		if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
+			int n;
+
+			for (n = 0; n < dtp->dt_stmt_nextid; n++) {
+				dtrace_stmtdesc_t *stp;
+
+				stp = dtp->dt_stmts[n];
+				if (stp == NULL)
+					continue;
+
+				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
+				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
+				    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
+				    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
+					mask |= bit;
+
+				bit <<= 1;
+			}
+		}
+
+		key.pid = pid;
+		key.uprid = uprp->desc->id;
+
+		val.prid = prp->desc->id;
+		val.mask = mask;
+
+		// FIXME Check return value, but how should errors be handled?
+		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
+	}
+
+	return 0;
+}
+
+/*
+ * Discover new probes.
+ */
+static int discover(dtrace_hdl_t *dtp)
+{
+	int		i;
+	dt_pcb_t	pcb;
+
+	/* Clean up stale pids from among the USDT probes. */
+	clean_usdt_probes(dtp);
+
+	/* Discover new probes, placing them in dt_probes[]. */
+	/*
+	 * pcb is only used inside of dt_pid_error() to get:
+	 *     pcb->pcb_region
+	 *     pcb->pcb_filetag
+	 *     pcb->pcb_fileptr
+	 * While pcb cannot be NULL, these other things apparently can be.
+	 */
+	memset(&pcb, 0, sizeof(dt_pcb_t));
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t *stp;
+
+		stp = dtp->dt_stmts[i];
+		if (stp == NULL)
+			continue;
+		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+	}
+
+	return 0;
+}
 
 /*
  * Look up or create an underlying (real) probe, corresponding directly to a
@@ -782,6 +1110,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.add_probe	= &add_probe_uprobe,
 };
 
 /*
@@ -816,7 +1145,10 @@ dt_provimpl_t	dt_pid = {
 dt_provimpl_t	dt_usdt = {
 	.name		= "usdt",
 	.prog_type	= BPF_PROG_TYPE_UNSPEC,
+	.populate	= &populate_usdt,
 	.provide_probe	= &provide_usdt_probe,
 	.enable		= &enable_usdt,
 	.probe_destroy	= &probe_destroy,
+	.discover	= &discover,
+	.add_probe	= &add_probe_usdt,
 };
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 5f9766183..dd17627ba 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -41,6 +41,7 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_sdt,
 	&dt_syscall,
 	&dt_uprobe,
+	&dt_usdt,
 	NULL
 };
 
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index 384d4fd33..8f143dcea 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -88,6 +88,7 @@ extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
 extern dt_provimpl_t dt_syscall;
 extern dt_provimpl_t dt_uprobe;
+extern dt_provimpl_t dt_usdt;
 
 extern const dt_provimpl_t *dt_providers[];
 
-- 
2.43.5

