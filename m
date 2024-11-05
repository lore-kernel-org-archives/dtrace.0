Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276211D90A4
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825804; cv=fail; b=gYogeqPXPcDTsSq6tZtDWZeDcefaVmdYdM/zvQyySHZWw9+xMSsWaZGEFPrZZY9SlJUsjAWizlkftiHpKyWE2gSM2tNGbiwO305fOOprOmwvt1btr9dDl8fdE+6sHl6rdj6rfjkuosY95JkkCN7uSGTJwBPTPB6hO9rBpE3YxW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825804; c=relaxed/simple;
	bh=p640lvHu/RT1Hm2+cZlHTSbshwlewcs5iQd6EcOgnxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=phcD9GNqwKCvP7O/o8RK2McivuXF0k+/imvNN2AFi5TTS6xdxDV71eM5NQt5fobgB4FUsLekuSS+gCF7NbW4x5elRgqM2KE9HbOoG7HV2KFM7RyK1VpLkY7lqrfmXL/edYbJkVd71KvKLHnMhS/wEHA+XUq0otkk22HTBfgUin8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iuXp0Cmp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PdnxZvJP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iuXp0Cmp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PdnxZvJP"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Dibx9030068
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 16:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9RAWk0fOXca4r6UBAE
	b319ZySSZPFGFiDWTj4lB6Xa8=; b=iuXp0CmpY56GHIRSidySTYPfu19N9FkdPx
	/bqNuwfrzGMk696XbXKgj7n6bTZ1NOw7K/+7GIILsjS/wsbR7P+Q3l8OPPp12EAq
	TdG4yvk35UcOuKW9azpbnmWdsGtFoDcMgOCT1+RcWdG8T2gomrT+yeLGLW8svkvF
	LHf7e1jr4E1LUfKiatkwDtldgWNwzypalW0F4Rli6HuGEAd1cvEOFpiaJzwtsAWg
	Lbjc0UCEyeorf6FwHHhKy7dRq8yy4dVwy19vf5E923V0Jcupf8L4aJQARVf2BSBl
	9cTXoy0V6JxBWepaKKLkSVjbywCMx2FsqjsjALvY/SrpuqHJKtzA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nc4bwx8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 16:56:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5FnS7a031493
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 16:56:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah74k92-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 16:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eu0aNq+ePKCBDHU2H6MB6jpH9QIzeodjWa0YGQfOmkIBYNCvAp5ud8eszq2Sv2trYr1bbv7HLXVtdUmUsRSvEh341FM+f8MnoQiIyjt3Rkxcu+GCQ7PB4mijBqKZVLHf+jlJeoEs0IZdjr6wHNIQQVMVN2bmtjJqjiR/Fo5ER9rNh+17cKO6NDrbWDLG9fPxmGqxH80wC11wmTghmJpnqX+osbuHai/LB65bs+6IOF+bM+k308GdWD7376FVs422EwY7Kl2d0AMJFQexFCT8nu0cOFc55P0qUUPpwXX+xtT6f+xeSN1QV4dlTEciwbwQBxckRtJ7WdwVLqeSloWXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RAWk0fOXca4r6UBAEb319ZySSZPFGFiDWTj4lB6Xa8=;
 b=qnv6ixkut6U7F4f8GmS6KTKxgZ2tjBJs90SsGgYLXbCIxjclJfrqnSuX4JQqZEP6tn636wacDNo17Zd1ha1GvkEjksBYNjgdprwRyOO2tRK6mWg27okzldUoiKEwlXj1ckqHIPSmKLfk06VI0c7Npd1N3Lue3OdUQt4uKOYedY3EjBuiJU32jGEfalY43uOXcckgwGDvN7EZHv4dNb2qzi96aFO4W681avAkMm1+9isOx/769X/A2Qr7/iLlf5zlY9NCC+FcmCvwVSUCaAhFbTFPH6LLRgi3tSPikJfZsPV8PnublPFpxgkUuKI+xwHwVeMjaDfWe8LPYRPHkRFwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RAWk0fOXca4r6UBAEb319ZySSZPFGFiDWTj4lB6Xa8=;
 b=PdnxZvJPUXD+MZjSFIqXmZI+DrjwTL86j0Qyv8heJefSckj1of9fcNzXweFeoswe8JwZByT9Iuv6dNcm79JnMcttrxVBzyS9OvsU/kTTDr/i3oqbYMm9vWQnXANRkhY6NRcXp8QQ0VFksgKhreiQq5g70x/spxXhgR9uym1Wa0o=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CO1PR10MB4628.namprd10.prod.outlook.com (2603:10b6:303:6c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 16:56:35 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 16:56:35 +0000
Date: Tue, 5 Nov 2024 11:56:33 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 1/6] usdt: get arg types and xlations into DTrace from
 the DOF
Message-ID: <ZypOQd2JYFq9I0XC@oracle.com>
References: <20241105000608.333229-1-nick.alcock@oracle.com>
 <20241105000608.333229-2-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105000608.333229-2-nick.alcock@oracle.com>
X-ClientProxiedBy: MN0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:208:52f::21) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CO1PR10MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 572473f7-3251-419e-0442-08dcfdbacec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gvs0KGsyTemg7IA5ARceh3jKb2ElmTUDjLqbhrbCsOPaTFuR2U5GEJTBoz5W?=
 =?us-ascii?Q?s2NfQ/Burwm3jflWe8ocYEoZQ/T3c+s93zZ4DMnTMcsOfUEab2oN4RAzVfpt?=
 =?us-ascii?Q?7kqUD/nCLx8c/EcBlpwm56jXOOO+Mo5XIKAPIeRHBuXof65BHFACBPBRG6G7?=
 =?us-ascii?Q?NW4OcVtF0JE56v1fqd3cYoOz+lqtU/FNeaxwp8rnq2R+4MvP4s2o7a8WQT7z?=
 =?us-ascii?Q?ul2UM8D+naVxRkjgvRduql9smJFfT34OANeT0OenoILrm484uH8xCThcKsd/?=
 =?us-ascii?Q?c3i7qGmtQdDvCfzDWHUbYtFiT2C7ErL68Q4NjmxH8eoJJFY4JlUFIWVcSsbv?=
 =?us-ascii?Q?nKt0zX7Z8LAxRhbqkXZUWnFRnRA0LPpyKZTT0O0RpKJtQcSp3aNZ4zyp/qGA?=
 =?us-ascii?Q?3aJt7sGObEyxJLkmGJ5zeFj5SNAzPK9qsyzQxv2Di7UHQ/DFgWQ2JXZUYxhT?=
 =?us-ascii?Q?Ls2hmCzQTsuihl35Z30cUEmyktUOix/KPfKB4LMIqXTOMqu6/leCrksR/ex9?=
 =?us-ascii?Q?Dg/6k9XxTbHl+R2YEDNIqYFue3w8lTaVHasch/fuRVYnAL7UFo/Sbi/lGNZE?=
 =?us-ascii?Q?aEQWBuFU6acZbnjpOsvs9HfDF2XFiZoOnra88Ntywzwd5cIWzDJQRtRggJwG?=
 =?us-ascii?Q?zD9ndOTriFUQ1nEgj1nzt0ui2WCh7QST5llIhiZV2/NAQBARJM7ltyPVGW68?=
 =?us-ascii?Q?iqs2EcdkMgQPt5nUFmT01ai4JLKocVC4CJmW4Ucw8+65pNQKmQmhXATmduS0?=
 =?us-ascii?Q?k/IjVEHxWAU7oREhRiaKnKc0NPHqSSaFQzDVCJmqnd9HvFw/vw8JeFcyk71w?=
 =?us-ascii?Q?uRHrU+rqkX3DFX4hWSdKpLuzRauDAuRwJkwLQ61EZGw/RP/oSqxrE63syG6h?=
 =?us-ascii?Q?1NSYYMRN4QD1+dyi5lKPz2wVtc2+lRB8pv0z72WJXMInRoBczrKAd5XqXD9H?=
 =?us-ascii?Q?eDXix2fXnoXUBfLNvsc2YNGVKmmq88HVDvK4s8xQnhkXXVxVdgIY6ZmPlhRe?=
 =?us-ascii?Q?IKuTxp7LwjDMWkn0z1YxQEpazwCmbO9SJ+Gbup80SDCfTfXKRBgVIXn/WKGy?=
 =?us-ascii?Q?HYjsKwa3JBZiLDbY6x80Mzax5oy2FfN4m66we6TtKEccicNws7DUxS9z2Tq2?=
 =?us-ascii?Q?b61mUZq4XdmxeaYWBmbCEZI20Rm1cmfAcTBdTtEwZd0WhFKdYAS8X41tiQqO?=
 =?us-ascii?Q?2XVhO24KP6YlFXcHr5HOK7GCBLQil78dpF0umluZWcGvQU6JqSEYEduvSHG2?=
 =?us-ascii?Q?OtcTJDLrTentBopWMBSTGDo5QWcjxgLi6R1L/DA1uoBPmnxDGm6DgKX3WwWp?=
 =?us-ascii?Q?MIx2GvVoz/XLc6zfkLKofqqr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hm7RKwaq0e2poJoKSLPn42ycupN5NaL4yH+vBI5V1VQPtMrGEMnPNpdacv+Q?=
 =?us-ascii?Q?oWjsBn5zFa2/s9CHiwLcEa/ucwJA+vCIuHw5D9XMcek1dRxSSSNGpF6FA/dO?=
 =?us-ascii?Q?xbgHCA3fwCV4P5AsDC3488cSlbPJy9VAPyVS42inFTRGtDJ/jFXJ2XROIZ5m?=
 =?us-ascii?Q?+dp6M4RY+Lu/Nb81RD4bqrOkzpYNFByrJgZpY7c/Wy7IhXrIYdwTHNgcLcnM?=
 =?us-ascii?Q?UMznhI395GXI7Ruq68Y1k3INSEbi54qoJpO9fvRBXTuVGMMQhv8a4RrxiAom?=
 =?us-ascii?Q?CejcWzNok6YrElYGhaWc+CAT6+F2Q4j/Yt8URLtVE8U63yA2qvOs0CZ65S2Q?=
 =?us-ascii?Q?bZLzsMaHERYJcPl12nGNQj1B/WieOKEL35zoJFrY+Wy5KBfXMAHyJIAPPkel?=
 =?us-ascii?Q?wAVsmb26vU9OURHaEnFumphgfe7zbnLsCwLUvGn7yysX7+Q61wcxqXd+O3Xb?=
 =?us-ascii?Q?RSDaMA6ZHvhAxMl1vTl/zKaBiV1EHynZW+PbpF5N1YzZ7KlaT0zzR2vRnbBC?=
 =?us-ascii?Q?yS9ZJ/2pvG5BVvEI7bK5Inl8MSTRjb7ul0RnqfGIvO2ooAkidUQlrSYbtfmd?=
 =?us-ascii?Q?U99FyIiQwVAvSOdG4qkVMjWeLOSgtSXiJyPRKFDnehYK0PHBTdKLmF6q6oJL?=
 =?us-ascii?Q?YSpQ2ZXDqWCQh0ckXnWZJTpiSdZHxZ2YLOYceSjg77DQkVQFUoiNPICLTQXw?=
 =?us-ascii?Q?MOrkVe5dInCZRYXeKpf1LjRvidL8hWIl7Cx6PwgpJ6s4lIBe9xX58IfqEt5y?=
 =?us-ascii?Q?eKOOClxy/MNWKW0M17SMes7R6KPKfeo2HQ8Y2pojq0uaH4ojIE9NdErV7h1O?=
 =?us-ascii?Q?JnaYxF1LQoJGkayHa259KMhTo4nLjZE0mHG7FxDf8IvWWmCFZUhi4OAQpZDr?=
 =?us-ascii?Q?LCmKGwjLJFZkWThkmccHPkH3hg4gu56/kXIp7+weBxUYuyMxMiuv2yhOv/i5?=
 =?us-ascii?Q?vGfG6P39n43MTZYY/8UrGgebaJR1D2Ca0eRW/KbSZvCHApag80PbWdBXpBZ6?=
 =?us-ascii?Q?lEwG5kfHHYGESXPC/cPv09Wkqx1VvLXdbLjzYQ+UEa3/iXlzJnDJ02Vpw8+o?=
 =?us-ascii?Q?gLEEdYDIqU5thdERckQBD09CUAF2R2inh89lfZc0msmeyUCwwP2FBhltjOZh?=
 =?us-ascii?Q?Sc1P7WPOeLpIeYQXi2hnW7XR01L2bLyMP4WO/ttCC+MNI6yJIuCz7nj52iQ+?=
 =?us-ascii?Q?vDtLG8aeAfpypcO8w7zkLyTm+eiwXj42GBD1YgSL0iM8YmLI3B1LkvVYr74E?=
 =?us-ascii?Q?K3Oq+FhdHfj4UzDYKvnaxg7ZqCa6c2x1R03IqOeHj1O/whY1sD3UCS2dawd2?=
 =?us-ascii?Q?sQCTKkEBx77AWxkwHD/cPtEk//KEHRCHcFQfpYkt4sjbVe8HrBI2T864ubaW?=
 =?us-ascii?Q?vhwmTX6C9iwOFAaWRE2NhsnpFzhnjnTyYaBustrCpd2z9O2TPMySy4nJ3ox2?=
 =?us-ascii?Q?EJjerZMfawjYfYJWHIMW8M0aUDuPhbKOSPPYKqdERMQng9ro9z5OeDlyH/i5?=
 =?us-ascii?Q?aiVLS5ObKoiq4yBZfjMWP9OEKoSzwHeuKwGr+I0YeCCji26QNM62OjJWskOi?=
 =?us-ascii?Q?wWdZijQLvKLAN50u/fqaML39oDZ3lSLL6E1plSXNGE922inqeTFeQSMSQloH?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2mzKH5oMXTXBuGQ8/Y5rxogcljVZsql9tLzsiuop2BsdWlkj5hB1XH32D5Q8CjMHrVfqftR0GXFqvOddLFygRD5/35lqlow1ZTN8BEyfLMd4yVKTz9kbjvCRyn1XLWgQCj4XvKDC+Ztrkk7odbKE/HBWzj77ArQv6Z2MH3OmDvzgOFg3DoN2uFAW1BvwCER7ONVTWGAxt1AiGKlLw9TTD0skQxcRGMofF/gRyOsxvLz40M6qNBB/YX0/7AJc8fOM2/638a116KrEiFHehCEJojBveG6zv3fYUTEiuC37IgH2pxHaslynTNiNXzoBNpg2+ufe316eftsBSD+QqKwIt07s/p6VjoW+5yNOlV/EQZ/Ps0Od8ze49uEMiyYg+dKS03ir9skgtp6EkUUUmnq9rjDKgL1ck0ZUmlGQv72QLWSXMF3bE6YlVynDf57O68hh1yv1ZLo06rxemJc+WPclAP2+5C72uxp3Qh8ponyEmHTdgXZmKClHtQZR1RfKA2jJTadfRI4/44KEIfke3OsDv1TEnlCkFD2P2XpqKdntAqb8NayffefiyXpdpsforLZ7fI/qLkU8CwOKtYAbiSViXutBM45XoK94uB0xPoGhw20=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572473f7-3251-419e-0442-08dcfdbacec4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 16:56:35.6274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlmVKsZFhJ2wveUKhECfCQhKEV2ZlrRLpjO2z7d+MOXvtv3m8qJM6bAIqLr3BXNxb920COnAEKcPHi44s9fWZAexWtO+7It9gS06+ldQfhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4628
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050130
X-Proofpoint-ORIG-GUID: p4hh-J9s7hs2MQFdDV1var7uuYDRLipA
X-Proofpoint-GUID: p4hh-J9s7hs2MQFdDV1var7uuYDRLipA

On Tue, Nov 05, 2024 at 12:06:03AM +0000, Nick Alcock wrote:
> This change propagates native and xlated arg types and mapping info all
> the way from the DOF, through the parser and dtprobed and the DOF stash,
> into DTrace, where they end up in the pid_probespec_t for USDT probes.
> We don't do anything with them once they get there in this commit: no
> user-visible impacts expected.
> 
> We bump the DOF_PARSED_VERSION since we add three new types of record to the
> dof_parser_t, all optional, covering native and xlated args and arg mapping
> tables; to make life easier for consumers we emit them in a defined order
> (documented in dof_parser.h), and add arg counts to the DIT_PROBE record
> that precedes them indicating which will be present and how many args are in
> them.  This means we retain the property that you can always tell which
> records within a provider are coming next purely from records you already
> have: there's no need to make decisions once the records turn up.  The DOF
> stash hardly changes: all that happens is that the parsed data written to
> each per-probe file gains some extra types of record (it can have
> DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
> DIT_PROBE record now).
> 
> As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
> refuse to read probes added by dtprobeds that are on the other side of it.
> (Restarting dtprobed will reparse all the probes in the stash to match the
> new layout, and newly-started DTraces will pick that up -- so this only
> affects running DTraces picking up new probes, which DTrace cannot do yet:
> so no visible effects are expected.)
> 
> The code is a bit repetitive, with nargs, xargs and arg mapping all handled
> separately even though the code is very similar.  In future maybe we could
> unify them (but my attempts led to code that was much harder to read than
> the original).
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dof_stash.c   |  15 +++--
>  dtprobed/dtprobed.c    |  10 ++-
>  include/dtrace/pid.h   |   7 ++
>  libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
>  libcommon/dof_parser.h |  64 ++++++++++++++++--
>  libdtrace/dt_pid.c     |  59 ++++++++++++++++
>  6 files changed, 256 insertions(+), 49 deletions(-)
> 
> diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
> index 0e639076f655..8bf465678217 100644
> --- a/dtprobed/dof_stash.c
> +++ b/dtprobed/dof_stash.c
> @@ -59,8 +59,10 @@
>   *    startup if the dof_parsed_t structure changed.  The file consists of a
>   *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
>   *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
> - *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
> - *    the DIT_PROBE record specifies.
> + *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
> + *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
> + *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
> + *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
>   *
>   * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
>   *
> @@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
>  			break;
>  		}
>  
> -		/* Tracepoint: add to already-open file.  */
> +		/* Args info or tracepoint: add to already-open file.  */
> +		case DIT_ARGS_NATIVE:
> +		case DIT_ARGS_XLAT:
> +		case DIT_ARGS_MAP:
>  		case DIT_TRACEPOINT:
> -			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
> +			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
> +			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
> +			       state == DIT_TRACEPOINT);
>  			state = accump->parsed->type;
>  
>  			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index f4c6be1e045d..2ca39b26f88a 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
>  		if (dof_stash_push_parsed(&accum, probe) < 0)
>  			goto oom;
>  
> -		for (j = 0; j < probe->probe.ntp; j++) {
> +		j = 0;
> +		do {
>  			dof_parsed_t *tp = dof_read(pid, in);
>  
>  			errmsg = "no tracepoints in a probe, or parse state corrupt";
> -			if (!tp || tp->type != DIT_TRACEPOINT)
> +			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
>  				goto err;
>  
>  			if (dof_stash_push_parsed(&accum, tp) < 0)
>  				goto oom;
> -		}
> +
> +			if (tp->type == DIT_TRACEPOINT)
> +				j++;
> +		} while (j < probe->probe.ntp);
>  	}
>  
>  	if (!reparsing)
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 0129674adf0c..25bfacfdbfe2 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -35,6 +35,13 @@ typedef struct pid_probespec {
>  	ino_t pps_inum;				/* object inode */
>  	char *pps_fn;				/* object full filename */
>  	uint64_t pps_off;			/* probe offset (in object) */
> +	int pps_nargc;				/* number of native args */
> +	int pps_xargc;				/* number of xlated and mapped args */
> +	char *pps_nargv;			/* array of native args */
> +	size_t pps_nargvlen;			/* (high estimate of) length of array */
> +	char *pps_xargv;			/* array of xlated args */
> +	size_t pps_xargvlen;			/* (high estimate of) length of array */
> +	int8_t *pps_argmap;			/* mapped arg indexes */
>  
>  	/*
>  	 * Fields below this point do not apply to underlying probes.
> diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
> index d6631a1afdcb..1792a8bfcc84 100644
> --- a/libcommon/dof_parser.c
> +++ b/libcommon/dof_parser.c
> @@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
>  		}
>  
>  		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
> -			   "%d is-enabled offsets\n", j,
> +			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
>  			   strtab + prov->dofpv_name, "",
>  			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
> -			   prb->dofpr_noffs, prb->dofpr_nenoffs);
> +			   prb->dofpr_noffs, prb->dofpr_nenoffs,
> +			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
>  	}
>  
>  	return 0;
> @@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	return 0;
>  }
>  
> +static size_t
> +strings_len(const char *strtab, size_t count)
> +{
> +	size_t len = 0;
> +
> +	for (; count > 0; count--) {
> +		size_t this_len = strlen(strtab) + 1;
> +
> +		len += this_len;
> +		strtab += this_len;
> +	}
> +	return len;
> +}
> +
>  static void
>  emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  {
>  	int		i;
> -	dof_parsed_t	*probe_msg;
> -	size_t		probe_msg_size;
> +	dof_parsed_t	*msg;
> +	size_t		msg_size;
>  	char		*ptr;
>  
>  	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
> @@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	if (validate_probe(out, dhpb) != 0)
>  		return;
>  
> -	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
> -	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
> -	    strlen(dhpb->dthpb_name) + 1;
> +	/*
> +	 * Compute the size of all the optional elements first, to fill out the
> +	 * flags.
> +	 */
>  
> -	probe_msg = malloc(probe_msg_size);
> -	if (!probe_msg) {
> -		dof_error(out, ENOMEM, "Out of memory allocating probe");
> -		return;
> -	}
> +	msg_size = offsetof(dof_parsed_t, probe.name) +
> +		   strlen(dhpb->dthpb_mod) + 1 +
> +		   strlen(dhpb->dthpb_func) + 1 +
> +		   strlen(dhpb->dthpb_name) + 1;
>  
> -	memset(probe_msg, 0, probe_msg_size);
> +	msg = malloc(msg_size);
> +	if (!msg)
> +		goto oom;
>  
> -	probe_msg->size = probe_msg_size;
> -	probe_msg->type = DIT_PROBE;
> -	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> -	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
> +	memset(msg, 0, msg_size);
> +
> +	msg->size = msg_size;
> +	msg->type = DIT_PROBE;
> +	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
> +	msg->probe.nargc = dhpb->dthpb_nargc;
> +	msg->probe.xargc = dhpb->dthpb_xargc;
> +
> +	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
>  	ptr++;
>  	ptr = stpcpy(ptr, dhpb->dthpb_func);
>  	ptr++;
>  	strcpy(ptr, dhpb->dthpb_name);
> -	dof_parser_write_one(out, probe_msg, probe_msg_size);
> +	dof_parser_write_one(out, msg, msg_size);
>  
> -	free(probe_msg);
> +	free(msg);
>  
> -	/* XXX TODO translated args
> -	   pp->ftp_nargs = dhpb->dthpb_xargc;
> -	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
> -	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
> -	*/
> +	/*
> +	 * Emit info on all native and translated args in turn.
> +	 *
> +	 * FIXME: this code is a bit repetitious.
> +	 *
> +	 * First native args (if any).
> +	 */
> +
> +	if (dhpb->dthpb_nargc > 0) {
> +		size_t	nargs_size;
> +
> +		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
> +		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
> +
> +		msg = malloc(msg_size);
> +		if (!msg)
> +			goto oom;
> +
> +		memset(msg, 0, msg_size);
> +
> +		msg->size = msg_size;
> +		msg->type = DIT_ARGS_NATIVE;
> +		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
> +		dof_parser_write_one(out, msg, msg_size);
> +
> +		free(msg);
> +
> +		/* Then translated args. */
> +
> +		if (dhpb->dthpb_xargc > 0) {
> +			size_t	xargs_size, map_size;
> +
> +			xargs_size = strings_len(dhpb->dthpb_xtypes,
> +						 dhpb->dthpb_xargc);
> +			msg_size = offsetof(dof_parsed_t, xargs.args) +
> +				   xargs_size;
> +
> +			msg = malloc(msg_size);
> +			if (!msg)
> +				goto oom;
> +
> +			memset(msg, 0, msg_size);
> +
> +			msg->size = msg_size;
> +			msg->type = DIT_ARGS_XLAT;
> +			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
> +			dof_parser_write_one(out, msg, msg_size);
> +
> +			free(msg);
> +
> +			/* Then the mapping table. */
> +
> +			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
> +			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
> +				   map_size;
> +
> +			msg = malloc(msg_size);
> +			if (!msg)
> +				goto oom;
> +
> +			memset(msg, 0, msg_size);
> +
> +			msg->size = msg_size;
> +			msg->type = DIT_ARGS_MAP;
> +			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
> +			dof_parser_write_one(out, msg, msg_size);
> +			free(msg);
> +		}
> +	}
>  
>  	/*
>  	 * Emit info on each tracepoint in turn.
> @@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
>  	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
>  		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
>  
> -	/*
> -	 * XXX later:
> -	 * If the arguments are shuffled around we set the argument remapping
> -	 * table. Later, when the probe fires, we only remap the arguments
> -	 * if the table is non-NULL.
> -	 *
> -	for (i = 0; i < dhpb->dthpb_xargc; i++) {
> -		if (dhpb->dthpb_args[i] != i) {
> -			pp->ftp_argmap = dhpb->dthpb_args;
> -			break;
> -		}
> -	} */
> +	return;
> + oom:
> +	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
> +		  msg_size);
>  }
>  
>  static void
> diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
> index d3a6836f15fd..8f42d00551e3 100644
> --- a/libcommon/dof_parser.h
> +++ b/libcommon/dof_parser.h
> @@ -15,10 +15,19 @@
>  #include <dtrace/helpers.h>
>  
>  /*
> - * Result of DOF probe parsing.  We receive a provider info structure, followed
> - * by N probe info structures each of which is followed by possibly many
> - * tracepoint info structures, all tagged.  Things not yet used for probe
> - * creation (like args, translated types, etc) are not returned.
> + * Result of DOF probe parsing.  The order of elements in the parsed stream
> + * is:
> + *
> + * DIT_PROVIDER (at least 1, which contains...)
> + *   DIT_PROBE (at least 1, each of which has...)
> + *     DIT_ARGS_NATIVE (1, optional)
> + *     DIT_ARGS_XLAT (1, optional)
> + *     DIT_ARGS_MAP (1, optional)
> + *     DIT_TRACEPOINT (any number >= 1)
> + *
> + * The dof_parsed.provider.flags word indicates the presence of the
> + * various optional args records in the following stream (you can rely on
> + * them if it simplifies things, but you don't have to).
>   *
>   * On error, a DIT_ERR structure is returned with an error message.
>   */
> @@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
>  	DIT_PROVIDER = 0,
>  	DIT_PROBE = 1,
>  	DIT_TRACEPOINT = 2,
> -	DIT_ERR = 3
> +	DIT_ERR = 3,
> +	DIT_ARGS_NATIVE = 4,
> +	DIT_ARGS_XLAT = 5,
> +	DIT_ARGS_MAP = 6,
>  } dof_parsed_info_t;
>  
>  /*
> @@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
>   * start which is the version of the dof_parseds within it.  The data flowing
>   * over the stream from the seccomped parser has no such prefix.
>   */
> -#define DOF_PARSED_VERSION 1
> +#define DOF_PARSED_VERSION 2
>  
>  typedef struct dof_parsed {
>  	/*
> @@ -59,18 +71,58 @@ typedef struct dof_parsed {
>  			 */
>  			char name[1];
>  		} provider;
> +
>  		struct dpi_probe_info {
>  			/*
>  			 * Number of tracepoints that follow.
>  			 */
>  			size_t ntp;
>  
> +			/*
> +			 * Number of native arguments that follow (if > 0, a
> +			 * DIT_ARGS_NATIVE will be received).
> +			 */
> +			size_t nargc;
> +
> +			/*
> +			 * Number of xlated arguments that follow (if > 0, a
> +			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
> +			 */
> +			size_t xargc;
> +
>  			/*
>  			 * Probe module, function, and name (\0-separated).
>  			 */
>  			char name[1];
>  		} probe;
>  
> +		/* V2+ only.  */
> +		struct dpi_probe_args_native_info {
> +			/*
> +			 * Array of native args.  nargc in length.
> +			 */
> +			char args[1];
> +		} nargs;
> +
> +		/* V2+ only.  */
> +		struct dpi_probe_args_xlat_info {
> +			/*
> +			 * Array of translated args.  xargc in length.
> +			 */
> +			char args[1];
> +		} xargs;
> +
> +		/*
> +		 * V2+ only.
> +		 */
> +		struct dpi_probe_args_map_info {
> +			/*
> +			 * Mapping from native arg index to xlated arg index.
> +			 * xargc in length.
> +			 */
> +			int8_t argmap[1];
> +		} argmap;
> +
>  		struct dpi_tracepoint_info {
>  			/*
>  			 * Offset of this tracepoint.
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index 41a87955ec1b..71ac1754d343 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		uint64_t *dof_version;
>  		char *prv, *mod, *fun, *prb;
>  		dof_parsed_t *provider, *probe;
> +		ssize_t nargvlen = 0, xargvlen = 0;
> +		char *nargv = NULL, *xargv = NULL;
> +		int8_t *argmap = NULL;
>  
>  		/*
>  		 * Regular files only: in particular, skip . and ..,
> @@ -917,6 +920,47 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  		p += probe->size;
>  		seen_size += probe->size;
>  
> +		/*
> +		 * Assume the order given in dof_parser.h, for simplicity.
> +		 */
> +		if (probe->probe.nargc > 0) {
> +			dof_parsed_t *args = (dof_parsed_t *) p;
> +
> +			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			nargv = args->nargs.args;
> +			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
> +			assert(nargvlen >= 0);
> +
> +			p += args->size;
> +			seen_size += args->size;
> +		}
> +		if (probe->probe.xargc > 0) {
> +			dof_parsed_t *args = (dof_parsed_t *) p;
> +
> +			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			xargv = args->xargs.args;
> +			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
> +			assert(xargvlen >= 0);
> +
> +			p += args->size;
> +			seen_size += args->size;
> +
> +			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
> +						 dof_buf_size, seen_size))
> +				goto parse_err;
> +
> +			argmap = args->argmap.argmap;
> +
> +			p += args->size;
> +			seen_size += args->size;
> +		}
> +
>  		/*
>  		 * Now the parsed DOF for this probe's tracepoints.
>  		 */
> @@ -967,6 +1011,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
>  			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
>  			psp.pps_nameoff = 0;
>  
> +			if (nargv) {
> +				psp.pps_nargc = probe->probe.nargc;
> +				psp.pps_nargvlen = nargvlen;
> +				psp.pps_nargv = nargv;
> +			}
> +
> +			if (xargv) {
> +				psp.pps_xargc = probe->probe.xargc;
> +				psp.pps_xargvlen = xargvlen;
> +				psp.pps_xargv = xargv;
> +			}
> +
> +			if (argmap)
> +				psp.pps_argmap = argmap;
> +
>  			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
>  				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
>  			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> -- 
> 2.46.0.278.g36e3a12567
> 
