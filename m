Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909BA946A
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825298; cv=fail; b=YGu7P6+FuWIIn/C5TrX/vpwo2343z43X+BXHA6E3U6G9+NBNakhdhu96KG4CFMwtqW24MB9lO1I6ZiptPt6ynkxmo6IxAq9aAb3iRKZtsTFpO7EWGhdJ3NR7qwRPetOEp0wxw8jNTChJvKieGAY6fcwh1JagiHfOo4l9ySb4H6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825298; c=relaxed/simple;
	bh=oOVxbRpCAksVSwJGTFsy4rU4BQrnsrNbaZd/ZEECaM0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OLK82WEDjsCDRBRJ+GMEq5eVsMChwf6qfQsJNNysj6eFy6KVHjo+q3v+vtgbdP/wTDwp42GuWeOkdf+kpRyEfkv2QL69htHcNA28n1qqzEBOH7GGNMPYV9Hs62QV/q6HDofkWYtGUlplv7CDADPyi7y05afeWBD7dVJjVIF4SQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DGaun3Ye; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sqk2iuvU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DGaun3Ye";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sqk2iuvU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMifMU030643
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tBRaaaBTH3ex0in4SL
	vJOzJ2W+YS+0a9gcQYIfGrsIs=; b=DGaun3YeN38Mt++aAaV0peqeSzsD2T1QK6
	DvMihdMdjkOOaWuekEiKIzHSFCJCG1tr2lNja7b6pHCJWYdACw7f4kjuuEM3wx91
	xsk58EZY3zHLnTrr026HNstFjcl6ZVwJbJ3mF5oul2B1coxgAysP0hSpwtNi5vbV
	YaH7ystEWYBoE3N9TtqtE4ippRUD6INXOyY+nUfnlJWH3uGmwC461E6270Ddx9ud
	ruQp1Zo83THBTFLDvxZxv1PGUsgRLVqNCiO39kJkpbGLME/JiSuZW5VB0a1bq/My
	VXlvC7vaMAVCfpbfXYOxBfec1c1GY2FDWJToRq4VcZ/C/RrV59BA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8mxend-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1wdX5005009
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hm0h-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/BjWRmhPMy95bAJxj7W0V2MLq/FFfpDRRVj/b+Ozt6Q+kH0ixaeHs++QoRD4Kc8F4l1Zn1iG11oQD2adDnCrtwfeVdeMo9EhAFJa6QBkT8vySsDqZXrREv6/Y26DJfyYovjtqCmbZsrP3ig9ZF9hoyRMi3LmsxD/J96jQqku7l4x6eMjc+3OAlj2a66sTagUTzTcI9LN8kHliY4Lk7OW1PPfCRq3E9JSsmgTLfFkP4RrGuN4WwoeBd6r7NRpGLbc20nOqmEq8IF6ExlGEac5R+tpsn2hhUzmqFHE6uYJSLRJbHNORKWfhFnoqlR4HDPS5xtHX3q59XqNZXPx9yd9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBRaaaBTH3ex0in4SLvJOzJ2W+YS+0a9gcQYIfGrsIs=;
 b=BoHGyA4pG7SbUzOBTY1u7EVrv8r9iZdOv1RT1G0ZFucKqi2QDrR3Hjh1hvTgaW0ElzwH5VHebeo/ocFIFHNeWJyHvLS41jA/v5JbDC0ep20CiaJKkcqNp3AVVn/4+Jn+JLD2js5mjK2K95yw5QMdTwiUZwXSI9I5o+FO9sUIL0j+bSCjjjRXz3dIMdyNoMuEOPoCh2QFHeDWvP3eMdUW38gdMRCZrQgbwuMqMpPMxKOjfHRvpTn4N2ym9OaZapZPsyG63Xu8rzh+7SPUgODyc+PoXEaTy9ITW2KScyJhSgOHE3ZZdTzA0Cmat4T4LowIh8tU1oMX6jiyUg9+wwyB/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBRaaaBTH3ex0in4SLvJOzJ2W+YS+0a9gcQYIfGrsIs=;
 b=sqk2iuvUSjOw/NNNuLOO1NxIstOjoWBT/7ACJfdmtJTsnaNUq6hz37fjgmlJSxWFg5tv5iHE6Y6SMj+cg1OLIJO1GdeVJOHsazWztJsG3zjLNCmB3b9F3QVpAe96IACvDjYstU0C6pRZa4E0TViyCEUyb1rHjvbvsIxJ5mhtiNw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH3PR10MB7564.namprd10.prod.outlook.com (2603:10b6:610:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 04:21:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 12/14] test: caller and stackdepth tests for rawfbt provider
Date: Wed, 25 Jun 2025 00:21:05 -0400
Message-Id: <20250625042107.13571-12-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:a03:333::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH3PR10MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af9d770-4c38-4ead-895f-08ddb39fc136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oz219rw2adrx2lX9M1xMUFFHGh1qaVJ2UMCBFKnUKmRZMEqOGYNvtMvXWmnj?=
 =?us-ascii?Q?KwANv30hastfaEYBAMgtsVOFiMvk+WEzW+4gEvsZY3mh5zwubMcSWuBZxuPS?=
 =?us-ascii?Q?ugq6xhrKby9J0KNGk3T4hxUyx0diFO6G+N/dohh9CLOWPrSen8B1Df/fsHIf?=
 =?us-ascii?Q?ClVN4hfumqiBNOP4kD6UVJPjJED6oJAWrL0cjZ89P0MQR4gQEudsyJjlcapI?=
 =?us-ascii?Q?Zu/Bqwh+B6TSHj/xR8uBDjmNgXP3UFFdpwFD6PSRIKJxMwDwEoOgxcaTUE/W?=
 =?us-ascii?Q?hsTHSWe2cET+89T2CqiJEtLPq9NxLWtBJkvnQGoR6m34ljbSkikhGVMd//lX?=
 =?us-ascii?Q?ITbhn7KqVCd6crW3WnAxy5M5w6HHqCQft3VOStmybLznH2kZaHc3Qwzn6Yw7?=
 =?us-ascii?Q?tJHS1A5b3wuPE31UOUvZLj3R/mbtWTDKHy8fz7Et2CjB6WpojyDb/ZulCMHb?=
 =?us-ascii?Q?s3gXQ3OA2ibaKSDmeQ/aQNbcXwc3t6Exwg7WmwbnME4nKiaC4BARzoFbcMCA?=
 =?us-ascii?Q?iOv9xIc3G4FK9N9Wz1yokLc3mUQXaUSsVp2/ROboVF//z7X8PiGqnVe4PkSx?=
 =?us-ascii?Q?H9quJQshSBSgQ6gVS/aAQyJtwkLrRHV1JDZ+yA2yZwaqtT8ktaSdk6ncsOBz?=
 =?us-ascii?Q?DjZrlhZg0nUZi2z4Brijw1r1UE7kKkHvCwkyuRcbB9T8zwRQPjZg0VrSjWiH?=
 =?us-ascii?Q?z87O91augRjZS3TosNRC4HJnMLnF5aKB1xwxtXKlynvENACkIkYRCat0pg1d?=
 =?us-ascii?Q?qMDRx7wNNCPFYVrFbSNLAVvtwOZLDU5jguxl4OBtnVXecYoy7p8JDHavjlxv?=
 =?us-ascii?Q?FV7UnQGTfVeprYd487ZJ2x7mrYK6WHxusafddVZpt0HIETFoTLC7RpwEL7j4?=
 =?us-ascii?Q?KZLlVqAjvSyD41Nz+X9fdAaqi2pFWWWkPPEgA7iddDOubFQ4t2j1Ky1E5j45?=
 =?us-ascii?Q?ILDY6UjmAXJg4rQzXm+UFm2htIlDAwO1L9+n8XeHSS+H417Nop82ghu18TUB?=
 =?us-ascii?Q?+JgXeTmll/IM/uCr966cCTJ+tZ0/tsKrxGfHR5rzFlc2qOBA4Uvuz76FO0tx?=
 =?us-ascii?Q?pFo/5WNZNoUjZ0t1I2tmPnJ1ueclUi3KqAPZjlIzyDsI6f7GGg9B60MUg++/?=
 =?us-ascii?Q?981x7dgysmEt/HSV86+D89Fl3Jz4I/86AlVp6F8mzi6qtj+7qWovTW08xkB3?=
 =?us-ascii?Q?jldeRI17PaAmAiQepTlilUIXwkRx28DRuX6fstu58YP0S6F80X3+APO7A/tv?=
 =?us-ascii?Q?UMS/ZDRQZMiLR/J1E9S402ByjgBa8xnLRXDwbtKdgHGM60swUHcKduvuCHJ6?=
 =?us-ascii?Q?WtA41Zl5IqHCXNjj2IbPNg5xxhLjE8Q4w3Togo9Y9IRUcVRA1eA2TWixYoXe?=
 =?us-ascii?Q?X5jD3ckdEC/komJ1+rHieliKoZfBr8t6A4bnXKzSMolDpkq1+0hSVlg9b7rc?=
 =?us-ascii?Q?Nt5Q0Lnr/s0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JEd+9TK5RQCppBSfhd5sfYIAKXqCsdDsqp1hvj2KxOAySgxCzzIPAWHkBAKZ?=
 =?us-ascii?Q?YhvaUMRwy+PWlbZeFepsDs0FZB9SK317fgHlwoU5oMkauVfPdQct8eSYGPYE?=
 =?us-ascii?Q?BpTeW59vE7inIACLWJODlN5GnOH+kKxrAeSQ5JwbAUZQUfKdT5bbAScLMHF5?=
 =?us-ascii?Q?rHXa+W3zy56L6XdS7bvx+r55RUrzCHk5nbR3QWd0rIHRM6Mzs2laoPjS6DT5?=
 =?us-ascii?Q?42Mpu6bA4SzVB92Vf/7E6PGhNMILYPar6Vd+0m/TzdcjniLxo326isxJZtNC?=
 =?us-ascii?Q?p8eaZUSeYE1D6WsB5tB+2FHYge2zU6eVE6h37MRZ3ISCQdkhZG/gEer/aTTi?=
 =?us-ascii?Q?wn+RxfcPVv18gz6ELiElNvvTPJV0grSrDjSNuVlS9c91DYiDCnf1B46iXJ++?=
 =?us-ascii?Q?IWWqcgDZOCQqvQUupw09enVf/kOhoEhrNHxTIVoRL4qfO6SOnyLE6yOUh64G?=
 =?us-ascii?Q?CiuQay2ODP6CPplGRqfLPsAWZWZh9Ab6/0i8lI4gLwp//yihfS/SR60XjOfH?=
 =?us-ascii?Q?2D3CRMcrNCwNUsOsXLIOhC4Oq6wkEYdw4kPtHKeK/OUGFffWtGUqApFwFZAD?=
 =?us-ascii?Q?Hb7Ybo6rV0c8PMLFzmaICXKSzdSx6oZRECbGwj73iZMC47oOVEhdbfWeF60Z?=
 =?us-ascii?Q?E/hjJcXvT8XPteEcbJcZlI4MvjEaXv/cdoQokgINfeF58lROlW9j2a0E0JTi?=
 =?us-ascii?Q?XM7f+6z8T30TbMqQHccr8qEyRsH+Bb9w4b4hIO4qUDdtyz1OdjAKpcymLA8Z?=
 =?us-ascii?Q?d2LZEln5Us4FV6e2SmdjmJO7VkY03rUxkwfNyAqkZvbeXzHAGcshixTSysBV?=
 =?us-ascii?Q?2bcZNyYZ6/+pNqtflqa8xcvVvd9XQ9oiMN95+11Mr7v0+DJ06bWjKr/m2+7X?=
 =?us-ascii?Q?M9fiOU8lyNd8cFkjkQBZeusT1SnDledeuu53cjK2s5tZWsZQN6oNtYxKcVvj?=
 =?us-ascii?Q?4/DzzbwLqD6xK5xHe8JwLpmRbR+oEhuB97G/gYgEncA/2k9FBhcyQWQDNux9?=
 =?us-ascii?Q?lubx+13wsV05e7KQyXRzp40TAj7wk5DQHJZWkuefT3vaHFethntZOCsQhggU?=
 =?us-ascii?Q?05xo9EcROjuy/g79Hi1Pmtz9I9Ut6y2tcif7UhI/5c9vsrPt1GQCxRvTj1kw?=
 =?us-ascii?Q?Ef8VyboeEQ5fttc6gm+55dPaDmUqYGboVjq87ZsG9NE/4ilsO+j+GRnP/ELJ?=
 =?us-ascii?Q?gct2EOXfUxVL6HBvmeVQEWci+sl9Bgy4m1nK0tflo/doeq4YOLDHL4FxvJVL?=
 =?us-ascii?Q?gN5bM8YQG/2OGBCKZSlXhezYa5nijj+UoMn7/YVyGiHzV7Wm26vw1Q1vJOF0?=
 =?us-ascii?Q?z018GcTCv4JgfaUBZ2qGZooHIwYhkSVV5KbqEH2oRfxFD9uYxDOExZBJazDO?=
 =?us-ascii?Q?X9v6x+RMTfr/QDCYLkJvOYrnEUMorWwW350roLb1kF+enVOHShg9BUAWTBnO?=
 =?us-ascii?Q?pvqduiOq8jGwWIi4S+JUQbyaC6VfDhJEKZNSh0DpY0hGbu8Ou6YdZ4f0bYsd?=
 =?us-ascii?Q?YjtaGXLuWeP/Q5DhrQbULvllyfdosoKlGKa1rqcmbAznA82Hq325i3jNIbet?=
 =?us-ascii?Q?XgMFMI2XVYY8x+cHapOD9hvAEEfLRkYiAxjjPazK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tN7rJ0eSv3DkWrXOu8WSoXxOivkvvB8SXt3TJczw0xNF6ex8VJk5cz/3w+PhYBe2/Z1QPSnF9UT1r2JKw21KK6iFL07Z2jukTRYSs+S8TeT5cJPOcT4B+jlfwX0zVif62ir/dFhpCvB5fTnHryim8jpPLBRwYuw31DNZY9Q4tzzzTYIWw717W3ozzbdeqltwcFS7LxVYwxnQOvnWx/F+j1y8zWJXFqaoPJbYMNu3uQ5Z2LJ6TX1LB0BQHmV6QP4MYV5TxyTrsv+PYdzO0XxteXbTepcwPS48md8PZmI4EN5QvQFpUTb6HPbqbe05F83ry16jZODQXleaCDqCje8u8gUHPKdSr3cynbBg08+N1AxAr0RT8QY6g71riSt0AnIYuRn2SLu5UlvzP2nsW1D8t5i6J9qr9ai130rjCHmXcvJ0NZT5K1QytT/+9vjYsoV2y/RbpxzGxgqbAPS76A/+wF/c6vPQmUGrmBSN31fB3hm9DoNATby7BNVUPPITCl1bD8CwoVojyEWJfzI/1r6cd5aWXxZqsD8JwXZgMBqmYKp0y0oaHS63zNb/kn6PtNtob9TpfPGapu7xNy9onOqlZirdgCt+mwmBvNh6KmHjA28=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af9d770-4c38-4ead-895f-08ddb39fc136
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:28.0434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37j1djO/e62JzGmNM5YaoqOTqbQCEBpvQWoHl6+k2uTEuIQv8cSJuvXfq+oQgin+NlHhEghmEbUd+CXcoyXbug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7564
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Authority-Analysis: v=2.4 cv=IcWHWXqa c=1 sm=1 tr=0 ts=685b794d cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9
X-Proofpoint-ORIG-GUID: pY06RYVpTq4lW-A64wOiVQvaTTKe3Kkd
X-Proofpoint-GUID: pY06RYVpTq4lW-A64wOiVQvaTTKe3Kkd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX7vHYtgplFBn5 +eJHkHU48rtWZrBNMcfmyL4jZPGeibrUR56dkKwtKvt0O8RaTn08ch/u3JstY95A39+pYs1fWT9 OsdIUQl9QEQk+zehXlw4BkMiIdtY2t1/EqORteiPNrATz3XIepPNevh2KHQXR0XdX18mXu8VXkT
 t5CSdhUBruFWv5Ua2wwtnHEH4pQ86NDyd7RJeyqVv+Ym+v6GTdyVQxQSdJaIfQ5YwT/yylSc36L wnpb3qfx7l0qP7y+x5oJHaXpN2PmoLKGiFY8KIrImvPDG8+gChL3zAj3Zo1JcMAMoQLcWhgpxr2 qZhc+9CGJSIjQUykTr4yLrJV/5upKAvkVyg65j/Uq/rKIH7rI0wl2IMak3li7zzWtg91kMGEiqM
 LEFHVpE5r7xQ5ABYr+C7nZ77U7uyu3ZBM1OwVT8iu4m6OS9CHzvVHz5zwgWIeQffveGNBCP2

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 .../variables/bvar/tst.caller-rawfbt.d        | 26 +++++++++++++++++
 .../variables/bvar/tst.caller-rawfbt.r        |  1 +
 .../variables/bvar/tst.caller-rawfbt.r.p      |  1 +
 .../variables/bvar/tst.stackdepth-rawfbt.d    | 28 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-rawfbt.r    |  1 +
 .../variables/bvar/tst.stackdepth-rawfbt.r.p  |  1 +
 6 files changed, 58 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawfbt.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-rawfbt.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-rawfbt.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawfbt.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-rawfbt.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p

diff --git a/test/unittest/variables/bvar/tst.caller-rawfbt.d b/test/unittest/variables/bvar/tst.caller-rawfbt.d
new file mode 100644
index 000000000..9be644ecc
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawfbt.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+rawfbt::ksys_write:entry
+/pid == $target/
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-rawfbt.r b/test/unittest/variables/bvar/tst.caller-rawfbt.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawfbt.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-rawfbt.r.p b/test/unittest/variables/bvar/tst.caller-rawfbt.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-rawfbt.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawfbt.d b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.d
new file mode 100644
index 000000000..1c0afffe8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.d
@@ -0,0 +1,28 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/*
+ * @@trigger: periodic_output
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+rawfbt::ksys_write:entry
+/pid == $target/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-rawfbt.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

