Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DBA72624
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191545; cv=fail; b=be/CMBFC8MxanuPpjXj8oCEEqDFsMMREn+wZF6pBj/HniE2A6zee4Xv0W059WHWfMFg+0x8FRC4xaEPqrpfY0PI0yk66Qlbqrfea+BhVPu+nsJDT1Tp7utrJxX2PLdd+CRfcd5lARs4skjE121qC7hscGJelx8Z9gFGCNbHrQSY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191545; c=relaxed/simple;
	bh=LbBfJ+SrQkNm4QoyS4iQZjhTvS1+JCFLWQU7uwFkiJA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=h8DIEqBqgIuyx2Nf4oUP1tHmcuYvGDN7PLmngw7nCcgFQWT/xCjSoN0Ql8xdsjisC1uAD3znsgqSbVdN97SVaILD0Rd6yYn0kvxZAI+H6EtduUydfazMx2Rx3aaLLXXnWEif4bqaWxRBxq/PFqRclbWegE71WpSQLsnZtyqTALA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aSWJVTFQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gmTy4X9M; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aSWJVTFQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gmTy4X9M"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TCGo009172
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/ta2wPjsvUwtNN9W1v
	7+JcsOx+C/z48rB6rndPNIcNE=; b=aSWJVTFQarSqaJtnUWGMEEls0Alo7GX5Px
	3xUgWP9rtpM7smckGkRNuGsMEIzP5349r3HW3E4GzsV9Jot71jBTOJPL4itZcQaT
	SgSBrbVP3YrxQbWqgjp34uWYCnzgAot1wYbvQH6SJCFyHS/USfPffVJA6s0zykUJ
	CTNhTIwboyCZvPmyumenPoBC/Lz/AhIb9l1vAGyaYOPmuPxycbnC51I+LDSe/JUg
	rRHBcig8gmQyWu2L1nLsXpkvJ2EpyfJLeq5IT1t6TopECqOnEMuoevqpzGx0+Vve
	+COs3+CDQR97PIbbPPxhxg12LgiFItPeBPB614d6E1hDOy+FGh9w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805tx5bwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:39:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDT8Ln010414
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:39:01 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9bduk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aI8TrC30cdQnWGDX4MJ3jVu1cE2Iqqr3eTwtafWY7bNJhczI7gkmo8WVFEnUZ4wj1D2YP9rqqaG3CJjDFYSjEgApyDVr/IlJ4qrlORzzCw2f0BCUTEhslSv28nb494WfFHUExcumPI8ClIyJdfIL5Z0CfYPkwVORYJxee7jO6j3R0CcN0goOqmqUzutmww4hflFI8w4Dzr4oIwNh9tV68z68FO98x/6cXUH3A4xXIVXYkv5APNiwBPI641gLcIfs8gv4FsXA44nOKGzoPS3q4A4PQJL8skZjYtcwL3W8KHpRLGotOtMNReji5j2gHnfrP8NtaO+ypq3ZtRtD3cBKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ta2wPjsvUwtNN9W1v7+JcsOx+C/z48rB6rndPNIcNE=;
 b=MthpjdoyEXMG3EFv2CaFq1y0Fw9zw7AW4uycyHXJgYDRNgHca7wbkHFFoSPwbHexESi9cLL90aI4CAdOi1eSUhy2QslzmMpAQFLsJTgvMm9KGosA7XuyZgwJRDy7jGQARNIUcIJXIZog2D30E5b3v94SE2r62tdXu13zIRKD7uf28JAn4rn6Y/vLU8Vq+4UqnwuYIrHtl0ePY4d+18zy5m44FBSGhypF+4yjsxK3ry3XzaeqmxKShvhXSNrGCNsVx7and2MKBkL//LMwZM8sSwATH9pB3HFBk/83kXnkLHsJr/y5LrXn7pfl+OiOzfWKQP3oK7mYCARNDoqKqfMwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ta2wPjsvUwtNN9W1v7+JcsOx+C/z48rB6rndPNIcNE=;
 b=gmTy4X9MOEONd4FAS1bvZr/IrnbDEw0m0gEM/65UKfGg9o/XAwaE10pX53Js1JJR6CD49UeiBfPisY86l59S6qT/7gupZpuRguWKJ1Af13BXWJehzZHxFwkdj8YxMdeEPZ72aqCgsMDNzIuLfHupa60Kr7mGSr1DtZ/PHZHGIqo=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by IA3PR10MB8564.namprd10.prod.outlook.com (2603:10b6:208:583::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 13:38:57 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 13:38:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Wait for output to flush out in enable_pid
References: <20250628223050.3396-1-eugene.loh@oracle.com>
Emacs: The Awakening
Date: Tue, 22 Jul 2025 14:38:55 +0100
In-Reply-To: <20250628223050.3396-1-eugene.loh@oracle.com> (eugene loh's
	message of "Sat, 28 Jun 2025 18:30:50 -0400")
Message-ID: <877c005or4.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0205.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::19) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|IA3PR10MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 654d6a04-cfa6-4934-1a02-08ddc9251bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ETmQs4XbS0OyvGvQk6eWjkrohhRsrYH0GOLaCWoI49hMIhYKZ9ODDlbsdbxj?=
 =?us-ascii?Q?vHqDEzibVxVfc4cgyoT8+bGysiFsbC49QoK3NnKcxyzGPBno6E69oO2WOB8D?=
 =?us-ascii?Q?UFNT6TLYGhb5X62JLhApHKKvYkTWBe/H1WhszIVrtAy8ROvWkrZOcThmfWF2?=
 =?us-ascii?Q?xHuNZBwX0SYoW4VqK2DVrWsau14cqUz7iq+2JG5DiVbtgRKmUnsI508DQ4zZ?=
 =?us-ascii?Q?B8JtlWI1xsfuSP4mqpqOeQp2wG/zGtS2AxhH6HlAQ7yvsEU8sTA2gMrKxsMW?=
 =?us-ascii?Q?FkroyFqmdbG077VI5Q13BZNv5D5L4+M9s+6epbq17rhnmwA/7RrsBEzl4uuh?=
 =?us-ascii?Q?x7Nu6R0DF5csxfWlV7SKR9rhwGOWG1a5P1g8YmUl5lukL0GU1csliXSMHVE6?=
 =?us-ascii?Q?KqlvZpY6defs6QWttrsYfjFXGqCG5hUWsge8GoPrOiNpSpXb8xk4of1ocq+0?=
 =?us-ascii?Q?+5BNllUo1D1Qqhn5Lak91J4EJ2hsuOFlyxpz5ya8OIFSYt9sEW66auRMAjLe?=
 =?us-ascii?Q?A28uYRVF3ZUeMnASJ7MRox9sk2GTzEAfgnoDuDwlkw++fVAKczmryfs2eo4E?=
 =?us-ascii?Q?+KI8DvY7kumaRRO3X5Zj/RzUjwI6vznqAMxd7Q1ccNiYSvrScCcfLswZTP3x?=
 =?us-ascii?Q?jGKAIrKkuxlnOqGC/CdNGZy3MjZQf5IHx/m3dj0LibJjT7UKtob/w3tsReS5?=
 =?us-ascii?Q?e6vWCulK+BtssJnVPah+hMnBXr5dCaJUtFhKFHxJvY+R07taeQoG75LgSqc9?=
 =?us-ascii?Q?KlcjADiE1Nr0AOd2m8xY8lNO4I71uozY6Dy8odVBacJGHY57Y7RU3Nbh0CNH?=
 =?us-ascii?Q?0OQNPeqdGnMn0g+6nzej9NUytNlPSinefSoLad2J7cMt19gb/Sl596lPKtj9?=
 =?us-ascii?Q?ehr4J3KQbg6bUsR4mCDjAwx6kMNLArGu8blBRdG2RIF1X3TebR+77E/RSq5d?=
 =?us-ascii?Q?4JlJsftzx1wDZleqN/0NsFIl7rWNqClj1Z/5u/DRINcrPsWD/4Ds3Itmf1es?=
 =?us-ascii?Q?3g7NL6FSO7zwpiqAGebay8lsG7TrR9RnWWJzSkbeBsSXzlWu6mLpD5VuOy9q?=
 =?us-ascii?Q?O9JRqx61pDg5/7r3Q3tX/ryiiJTVbBQi99FbI7BSQNxNrRrH8ekDkAwzr/cs?=
 =?us-ascii?Q?E/LfY/JoiZ0SBaeV5W7vsEAyoFOMnGHvm3U0DSM+f59oGhvEKn1CQI4JwTAb?=
 =?us-ascii?Q?CEvNA/9/7M5tcuAv2eqe3eryn2ydn4NWV772Zayiq+MpQZ5mBdgZB32SeDw/?=
 =?us-ascii?Q?rRC4aDbMAY6XZan7G0WqiFywE+vzpfJTMDsNecPMT7h4aq4+/ACJRFSKrC2V?=
 =?us-ascii?Q?rghD5ZxY4IT/RO4mhwpJxxpTIgeB37FxObzxvqfNCjKR2YIiEEGGxobeEVbU?=
 =?us-ascii?Q?K19zhAzQvdlKCvK8X+8fszMKAlYhFpxjPXLZhn3NmrLsTZbmwHhlAZ2pdkP3?=
 =?us-ascii?Q?eQ6Kbu8X37c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oxbgT/0w24Y6mD59YnLwc1nRYPqJSmydNl5/TQOBBOUDJlk98/360otZcG9v?=
 =?us-ascii?Q?WMsKzN+rrC5GqFpiwGlcUK0rQE0y/D2H+vUvdptt2wEjzNy4pYsyoC0ADD94?=
 =?us-ascii?Q?YGaJKoUGSSuypovGqAJ075+oRECusKxc52KolUBKcTbf7CvCt2DcIW6lakPT?=
 =?us-ascii?Q?X7qX7wXx8B/Rr6pnczEHUZk8zuMaD7hTauSLf5L13QhHOpjeSpNoazWslbYX?=
 =?us-ascii?Q?TO2tXw0vd3//Fw9WKA9WpcHkVkQBYkfo5lnJ0/6opiMOkV+OD5xMOjdRlJfb?=
 =?us-ascii?Q?kPh190N41VuBL5MUAY/t1hpaKJy2y+JoyAaUbHutgCZujxSZNR88BsnA+Fma?=
 =?us-ascii?Q?hXwQyz3ONG9jCPswavdNF6POniZYE4wwhdagTctQBjX2Za0oWjc/rNQuiLW7?=
 =?us-ascii?Q?SoXSOpCFzNHV7MjPa9Qxg6SMbsCxXPk21AI/FylfWn68k2nP4UC5VW/GnNSS?=
 =?us-ascii?Q?gL1TrnWnlGDgc/cpadVcxOvV9o4cids/Ykoe730Kskp3o1ZynFaORxNXUt4v?=
 =?us-ascii?Q?FNtiFyFpQ9kMaMThyu4Rv67TNSdfInpXCXbCZR6frcAOL7XFO9SMVi7OwU/D?=
 =?us-ascii?Q?KImxjn9AnZpw7uH5z/4fmzIwkxQLHElkGaXMzrCdLNopbGoQslDgTy3cZsgq?=
 =?us-ascii?Q?oW93p40RaanFEDFEijXpFFWQwjw0pNVKfGD+j0JHaEDyR/NTHeSiAaVJVz3A?=
 =?us-ascii?Q?/vx/LGgbMGUntq3iyYZ84b0NcpfoJqd8yMoIZjGPK0Gtm1eNW++ZkEfRcnDf?=
 =?us-ascii?Q?zNct08JCp2mNfeuR+ZBB4uPPOdRdycuiTtzJNJS3DFTMmfwQ29CWaDsUTl5r?=
 =?us-ascii?Q?EiT3Mslhf4DEBD+esXlLzrf9efOXdBeVHZKfRJRkR8RdjbQK26In3Nv1KHGA?=
 =?us-ascii?Q?OAiPcOog/nLTrLgnjJhlewOTi6O7N8mwivHKQ8iGEVY7jJ/khc1ze6DcYA6H?=
 =?us-ascii?Q?vtjN+7Xp2XzrNNF1/XqTruNmBeIZqfv7sM6A6wP95e3yCPbkixA+yFVpbjDC?=
 =?us-ascii?Q?lpyGpMyq6xF0UwXo3N/HyIqSnTmAEnEIXqEjBCXqxaZxTJ2td+UZnXjoUgbI?=
 =?us-ascii?Q?OHOWeXMc19Uriafg2B5YYr2hgLC+S++Do7An6WmUPziFEdY3TtJU1jvX9Jhj?=
 =?us-ascii?Q?vpcVGFCTw0t2apssz9K0gk2iwqGhAUAmkzLBnNebXOOdcc39ufkdW6650qDB?=
 =?us-ascii?Q?YE6yZC9e2cre/MZWk2+bPyP/gd+8RsiyWdDIkH57ZN7cxcOmLOIHOerJpA5U?=
 =?us-ascii?Q?UZqhkk9jpil5QCK7JwJl/WWzkR44NqZJeXfm6Cbzg6DjEn1sMtBcajgRJe3e?=
 =?us-ascii?Q?qsddFN4SHkPSw7mFfST6tI2qhAZCDwzOdzqHUmE2WciaB/zyya+87rd++y49?=
 =?us-ascii?Q?8tkyY5UC862uDZekNkAjsxcEhYDNQ7LiEGBJvTE8asS+SdcRGKnG79QZYp7F?=
 =?us-ascii?Q?v5qmw0v/cDMfytB4K9WjqBh/O/WFEy+iPkUs/vAusn9eBvI3IL887tSRhG+A?=
 =?us-ascii?Q?pa9mMAb2Tq3CNK7LmCQnaQKD9l2r/VHEwO8gfs6Dknolj8byJTq8q6pkSq6u?=
 =?us-ascii?Q?Sdz0EkZsDEQqensLLu6e5/3ekBMFbVkKuZKwiUXDbii92NGTT4FdFMlqUVV1?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	JeOijdwsEvZeyH5h8kW2JVL8aX+onTpfb0binVFQQPP+JoUQV+XJ12/GleJ8FN1xCeILr291XVw4epg0DnnReA81cyV+THyFjjeb6Izf7am4ZhT+6HQzrd5XfGZMVqKu0nc4+gKBZby4CBevARcqm7CCHEawe6XtuDgRRjMjsH305zBtjqrLtPYH8rQXhePUSGod1ToYMkztsDH7NlQ8Oqo6Ceumz0BKnaVDtIkugRmDTZXgCz/IY0yIVX8oSofydZVtx3gYfZiFK66CLl1Hj6m2oTwYR/AH09Y7WhjkRX21hFaiF/RdfmEQsh5UPD4EoCHvpfZv3/eKm056fW/RsHccEe5yAGILqyZMJh16ht0oyMyOruGabzFkrckMoConQEV6He4g1muiHtLwK9fOvi23MxwCHqgx+nV1iORtU3ip11PPUILcF8Gg3S45BxkOHrHr67UPX0ap9+sxTq3ml/CCjZ9NV4uEm2y75GdUD6zQyYUzKPDoZClSw/wtRkr4UIptiDEjaI1jYuiD6KA3PJAsh8A0IiuwGT2A+a+PRQmqrxcOaUr7Cs4krWQxzEAzn2U+GBTK8u4x1ZQjikxX2t05Z9F12nUEqIehiRyDb2M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654d6a04-cfa6-4934-1a02-08ddc9251bd8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:38:57.5814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q4w+cSc4KDBOHyKMawrTFGp1a2sduxn8eWKvcJYnV5xHvTYUz2pMGYdcxqGdDNAKXkymP2xqymh2bfm3fcPM4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220112
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMSBTYWx0ZWRfX1EgD4oEg5Dn/
 qbk9oZQ9unBDTY/nU1cGYBxrjbEMdyEhQDLwqm2UHMb4LHJlnGN02iTIVdyEubs/RCkTlIaQdJ1
 uJb7HalPvEYeJyZSwukXTNfnOettUl8f2GYpTlPXfTDquH4Nwx9lkZGbdbFiaXgxpCfccP1fXmg
 xF5/0uAsByoIvCOLXTBjLaBTVOQa9RzFmt4BJXMc/LuQnTHCP8ahbCcsK0Oh2D4OJxTPJO14ioy
 RQXHHfZGT29bYAalIYwp67FYcfpJKdF3pX87lLhdFRQRPBbczM7o/yjmneMrpik5jvGCsquxhLw
 ftPEYG8YY3tU9XUK2W13ysQIhiGkeI42avVQI4cwAwB5r6b56M8Hv9BF232KE7VtQJvhaW5jCZX
 izhVn8ur3QLObEbe6F+akLCkLICV8tE2+55sjp1g+7L+4j0hKqJJytvBjQEe4WASMsR6jROo
X-Proofpoint-GUID: kCYTyi4EHhUh-4R6RurGcQu1dH8M6Ww4
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=687f9476 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=JNMSSQiLsJNwG2URaA0A:9
X-Proofpoint-ORIG-GUID: kCYTyi4EHhUh-4R6RurGcQu1dH8M6Ww4

On 28 Jun 2025, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Our luck with this test has been quite good, but it sometimes fails
> to show its last lines of output.  That is, we send a USR1 to the
> trigger processes to set off the final output and we immediately
> cat the output files.  If there is any delay in handling the signal,
> the last output will be missing.
>
> Have the processes terminate themselves when their last output is
> flushed; then wait for those processes.  Also, skip testing altogether if
> there is only a single processor to run the two, hard-spinning processes.

Yeah, much better design.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
