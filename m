Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764AA30DEDC
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512952; cv=fail; b=Fa4ZluuGqhM5/7InIB3j4/1Dfx+rsqvmAhQIP2kPeH/U7+JUFch/XR4zEw7FifkoPZIenMb2+h5xovmcaci1zjjT2ILLyg5vBhLaZhV5UZFeRArq7Tz8GvetQwDC/Bi0HxcKUbj/KGX9oDx/NICOf73nNfPy53lxHcu4oL2OqaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512952; c=relaxed/simple;
	bh=NQDOvZaxm9bmBe/NnrNxfxEO3lq1SY9UxzhmdxuUmWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dt1b2e0QJjvxEnSacJIHCAcgnFwqdXVWg//MH2Dp4No8Imb2VUCaGjcD9+/3Zq3hI0KP81ElDoxbQwJcsOrwQENW5emyTer4X2PPOr14/DFoPTsjK8HyzLnzNKnJE8ertnb/+VpQQd/PGONOmLJwK9hF7qbZcV/HHWRuMrVr1II=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n401my1t; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sbX8VCpC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n401my1t";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sbX8VCpC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FDdlCT2685997
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=rPwiPD/8fqIpdUzZHb
	CFQ4QQuaYzSU8dokkZAqKdLr4=; b=n401my1tNnMwhG0mjKbVqIJ954kHXxN31z
	MOi6DboaNm7Rj7gJJ6tcJ11qML6zDNirBI1tbvsAy91x4UJVt1e9WfdLFwSWYkk+
	BvoJqaGKt/lEhcThOIUOVJzMGSAcbxTS+fZFCjSgmboTbTHMnijt3k5JwMTIeaoZ
	AFoUlKaazTe50sqiyYGeTtk74ulgHmgyqR4YYLqcb9Ve65zaruiOU/Zs7hpd3wMD
	BGppnOemYOhzGOzl7uElFtsMourEh5XxPgt2xRxt+7dTDp4kPFgnha3fM4eqD779
	O3en+DHVFrial2Pt19QcXfsTbRwMmje/T2ZZLgQ8ZmsIR8UFkdQg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb8s6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:35:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FLOFnK011825
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:35:48 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7buhuh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Jan 2026 21:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQTT4YPOX0WvBsTiIwZYvAHdN7NVHaZ1UWgB2qgMRrSrN9ffI9poVPdcW2Biwaa8puO4i7RzCmyuprT2RFvAWw5alsPE28oyBldbkUfS/QA3Gi6Sqb3q6SseS5P2fglvSp+Sr8liXbSBNPW67jlKiqPsujTCHEQbqnofCxikTRCndLiXyto2s6iswlI7ZavdoYSb3jL1Vihewfhi3bHwruY6Q37XFBRUZmA3HYl+BMdOUqQQYHGMgK3GCenpw/kYZq+HNxCq9jfw2eyjV6V7r2mj/cjMHk6dQud7S4P3x6pTpw+T0jS5oL23Av3YT0mrZjOcamn/0/0DKWXFoiigpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPwiPD/8fqIpdUzZHbCFQ4QQuaYzSU8dokkZAqKdLr4=;
 b=vPvJkPxO7PKwmxeoD6Ew2cSOPOr73SnqzPrFMxEtxvpOraS329XRAVI/gtBbMW5Htn4RqGo8K2OufzUE2IZJBJ/8/9FK/18uf6cSJY8ZuczKwQyku++cerTYqDl3ven3nE/EAkFRUGRejrtW/uF4UR/uLu4rgah/dsA/DdhXtsgHbCeQH9GuS7WxZysflRG0F9ijOv4F5oOoa/ymIeQ2nithKnn7YyKdrrGhod46v5GCMma0TKndJZi6pQcrmHyNilAneJqrGYHzUK+jL5l4jDMt8ki7XGOIJ6bZUAVH/TYO7iDp7wstzBNM4OzHGepwNQNl0OMqf29g5mobp/Ulag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPwiPD/8fqIpdUzZHbCFQ4QQuaYzSU8dokkZAqKdLr4=;
 b=sbX8VCpCgS6EAs4oZaCR4GHsoS0Pg1HTGI4+GRCTf55YBJ1fCqbAxevMcGR86ySCfxW0mKN50CvAc+RvmfblMSLUSSyDIQxmiVdqHcqAkaInfE5P84TsNArNi2gSBrFCTeLxb8gF70ZGXgGVFSbQucBsPSAY7CIS3+6Q0+aNEFE=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SA3PR10MB7069.namprd10.prod.outlook.com (2603:10b6:806:315::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 21:35:44 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 21:35:44 +0000
Date: Thu, 15 Jan 2026 16:35:41 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] fbt: Populate just once
Message-ID: <aWldrTXBAla0jjKO@oracle.com>
References: <20260113214205.9159-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113214205.9159-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SA3PR10MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: fc12d384-16ee-49a3-cea5-08de547e09e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kv1JAcmBY1meKIpNJYGib1xXtRhd9deLffex6BGwAuXSkXbhGUWEHrBP/tNY?=
 =?us-ascii?Q?y4eRwyfzCTzxHJg7XME581h06Skp8nqRDGYygJrii3sKFGwY26oAbk9xOXJe?=
 =?us-ascii?Q?P/JqBQGRb/GRZ7GNZaI32QRtxLEeJSCw248mCUQtS0wBWPQMktwhrI757C9t?=
 =?us-ascii?Q?QF0aPllwY5dkeF9e9guhv2S0R7u6lAN2tSg7X8UhJ6ihiH00Vzc0McHhxF3F?=
 =?us-ascii?Q?llT9MaFgqlk69nlkQnKs2ozoEJLN6xCFQfEM81RAepDxDb5QROpfaofBOhE9?=
 =?us-ascii?Q?b6czN2JweOEDP2+cNhl4SDE5HnayWuM0ov4HtTKObjEWFvhKMFWx+x/kSd3J?=
 =?us-ascii?Q?cJpVWtrzz/e0cfVcNAYlwICXp+QgTEsCO+PpAwPYjXq/rMVYWItAWZj/dvlP?=
 =?us-ascii?Q?lKDnV/lCSpL7SNESEi9ug2I9DmIlUNqXhe4YA0d+dbhWQxRU2Wx5Cc8+6S8d?=
 =?us-ascii?Q?2jeTcwHcGsK0P8wVA8TJet6cSeyV44lcjy5t6dFupu5HSExed2RcY6l+b5sx?=
 =?us-ascii?Q?KhPvNpIInXCc8y5qJX2Z9kOV/sFqCznu61EVZrOtUN6lk0EgWFDnI4nfV6TT?=
 =?us-ascii?Q?4jBDXMGFfZvkpeq0QUMcbZlhToaCtshQhpTxvZYf9oP0pCggyPSrGme8/rju?=
 =?us-ascii?Q?tZ5lPbvJuYGCwyFgpkjksDSQMzcDSjkveZ++1WaxYRiCuItbbhiYDd+uajWW?=
 =?us-ascii?Q?S2UfDQ5EKYg1d1My5/Xvt+CwPmRxWAx3UfZN1bIhopiw0o1KaepTdT0U8TIB?=
 =?us-ascii?Q?bSQclzdcO9mnW0qg8jF5iWQpg29KhpLFgC4Zbe20Jl4gCisQa+65qNKK3oxw?=
 =?us-ascii?Q?BFgNV9uTIHaAFk4sClJDxlZhYUX8mKcBSlbdxuuaHUouzD3MShEJN521zjQ/?=
 =?us-ascii?Q?sHhUt3JWiEvBD8Vd4qMHE2lMT4hqY7mrF5MCUHHdinGpe5cr03BiZulgnrJJ?=
 =?us-ascii?Q?1jNFOpJEHnE4rIquW6769rOGlDPpYogEa1DrDnf36X6iBm9vRknKMxm2a0pW?=
 =?us-ascii?Q?ODOVIUjcxBWQQOqKSrWM36JBVy8NmVJm1DCuvMUO4fAgEDXUvt3Yn17pe8x8?=
 =?us-ascii?Q?TXbjnV6PZHJPKRoyWQK8a3pWRNir2LtZYMJ5NcDL0lvAROfevV0156hTMPY8?=
 =?us-ascii?Q?jBvU9asCQwu4ARlD3pC2gfJWaSTXyrOYgQ+X77AWdJ/E7X2xewOxK87di3/n?=
 =?us-ascii?Q?kY55LWM+6SyfiqTuAkvuGIwBSAmJD/JbeI15h+F4vOiOaebpT7CURD9KyEwx?=
 =?us-ascii?Q?vrwdiRmsc820FES12UfgobPWSjCMGaNxSKoN0zm/2b8vPgMcYbcRBDetG1nH?=
 =?us-ascii?Q?BcVWk707SpjQIpHT4m9tUrm7g7WqvP+7tHRpURzeXERZVfBWiqwz1gVhJHlk?=
 =?us-ascii?Q?IDiJrgI3UI52uBa1SZ0MXPLSin9Jb1+Xwj6FqcWtI/1RENwE6w+0ylN5m71W?=
 =?us-ascii?Q?xNcy8/THCdWZenEqzU4hGlXrx5uewkbXfNAxi/Och2n9KxoSS390GVLUYAJf?=
 =?us-ascii?Q?XvujeQKfcLRLuwR/E72NWU1Lk8ULqsNScWNL9oTlWDgUYp455YfPSgOvgZEe?=
 =?us-ascii?Q?ss+x6DFd8HmMynInIps=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xjI345mCPVaBgpmJ1hYcVIzlRyzkecIMBeNnEt21zXoYTYtkKYL4i65KaFza?=
 =?us-ascii?Q?sQ+aZ8ym6ElfTLL2tQIGPNv9x4eirdwSErEPWnrM3xp1Dc0yogETqEt2DRy0?=
 =?us-ascii?Q?vzCRg3TrzR6TexwF7fAdr603qap5n+LIH7op07CYqzVpgePzYIsF0v5Gc6DF?=
 =?us-ascii?Q?vtS427R0VRZaJg11dQpDkIMvM6p2Lol2SyCvuBDUGlIqcv+OHMom1ZTE2ElZ?=
 =?us-ascii?Q?PII3YDn6HY3pih9jdcNR0gakzj1mP6KR93mx/nTWKd+RakytBVKwpoL5EGdg?=
 =?us-ascii?Q?/WDa6vpJzjK67kElOCfTrBk77QVqRhzRnE5LgtqyRqrFyEZ2/e0tZNuSjGyQ?=
 =?us-ascii?Q?MpaiZq8RbLau8iOTEOXwSVEy9VXdQgso4slUCVIFhp/Vxa+bifJ0EKE5XZ7y?=
 =?us-ascii?Q?KSqsThykxW8wsoxjzTUAifK7qZCqJCgN0yDPrqC1mwBExyeBuKOceSwvUcgq?=
 =?us-ascii?Q?gbFValmtmNIPSqLlpEu2dfzEJz1OyX93qnlJ0ZNmqa+HiZgrwIZQSvNLUCiX?=
 =?us-ascii?Q?/07Qqrzwlann847FZqc/1gMoLF5RPexTqXF3RL/0tZDwcrzLGmSjFMHN1bmY?=
 =?us-ascii?Q?4OJ6nETbaq6SbsJfefSof0IlGldDMTZPTpXqclNYqGARWUCpyaB9VaMmmG2y?=
 =?us-ascii?Q?68+Ph2kbAu0LfhMYmv9zO2kQUedsxA0ShV+TwFa/rwZoMo6VbVt43p+CG3vj?=
 =?us-ascii?Q?BCYXtYQTdIU9jkmQvh79bB8p31GUiEsMjDzo5mb0XiSCGo6e8Z/PNP/pgci7?=
 =?us-ascii?Q?Bk4elQeDqwcxCTWcoaE34KZEyZZ7n/+s08J5c4axctruIhjZMcoDtE4oUkxS?=
 =?us-ascii?Q?0smJX2vY4oWWCd9lTqAiIH03ortRTlc/ByDU2czPGNVrmRA3nrVrNNRWtRCf?=
 =?us-ascii?Q?dMdKBp6gfjzUcljygFsqP2Q4+KW0ukwqNXfNIjG9dwwFkAwddxhbcfpJcubo?=
 =?us-ascii?Q?RcIXFwtgMptWC34by93Jo6AaUjr4A1lZulqElxmkL0pb6JMig/uX8aKbZgxa?=
 =?us-ascii?Q?W1UeOAStv6YaRTiBfWCl0NeRTNcazeupBL9aScnFWlwJvA6FBB4iSbfXKExa?=
 =?us-ascii?Q?SDEWE/ugvz4bU6+Bz9dAVRVs0omJDiSwKILlxwek0OuzA9Sxlk5G+WXkGHVN?=
 =?us-ascii?Q?H0HKcTzWL8MmpNfrFfPK6f/T1wwi3fe1VLiY51fQ7k0IzM5G42nXhHyNJ0Cy?=
 =?us-ascii?Q?io3tpxgiZp0+E21TsiWFosJyJaYolO3CkNKcqQYN8BG7sU5VYcNTWxR0tpt3?=
 =?us-ascii?Q?CXVaB+DRnl6JENDheHKRVU71rsrNJrQnuTUnBp8vwORqivP6J6gZ5hAD12NK?=
 =?us-ascii?Q?5b8RV4gNyjmOsaQarv5KMG43Zc74PXcr3IDf7Wk4Vvi+T0u3JY4+fntycGoV?=
 =?us-ascii?Q?tVU94rEhF3GSFsNMF5ncY8jETG/hXz8YEGWivFeAHCae28wZLZdaas3SN39/?=
 =?us-ascii?Q?G6M0eQNJ+CAU5ZuPU4ckvyG251SCrs8+w+rjfxDJO6+1lU5n5XvUEIFmMCCI?=
 =?us-ascii?Q?UqHVQA9UCRqu+3Iydnlctvs5++sPnpzK2Vs052M6xzssAu0gJACTaiP5SVVB?=
 =?us-ascii?Q?Bs7RT3G2vJjSu6Z4bONbrg8fD2kdSXQAw1J25mIt9yMQ8fxTCrz7FXnJb29Y?=
 =?us-ascii?Q?9flxwhOaLH5AvD9euuumIzCUqtWhX1S+28EBSL1/SgAVYOkHYZwAXyLHnVDB?=
 =?us-ascii?Q?B8Yj6/U5kpDCM8ZMSttRaR2jFznoAU0fPmpYa6ry6IchnFRby6TVUUGKMWD/?=
 =?us-ascii?Q?S3SJ9Z1Esg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0Nb5MXk5aKJR5aRoEzdnnZs4DXlkwbxkIErp/BvV2+xAVV8d0EheNGOoipED2PJtXw/C7uYwoXsE/5uJtEaBeWdwNQ7X8ksh1Cm61ME4Jd1egL550Tw7w1oQHiWKQnULsJrennu7UY9MAiiBZ3Rzx3FybWlZTkKSDoWpOa4/Uub1KSJxw7onrWJbv6gzMKmUIOm+mK6rxmkiRcjP+GUrtge57lYnEIAajHu90zZYubBrEdFVf8nDoxz4neqpbIKotjSyHWSWKHMsSf+PMHJoEJGxZLSc2lPWb1muH9bFpv6y8twA838oSAd5PaX86HL4WOT8Ye5R5+gFCFtPRh6wkQEhSYapO0KQBStPFT3j9Tr8rkLUXUzaeAOrvF4oAUski1wg4vNenifwtNs5gnV7beb9qZZWswrtgAudvjG7UXfWT9uwKxZYiz0QTruIjYF7PtPmy0/A7qkIQPpOZcJWkW6DjWc/L9kXVlpFuYPGnER5a5vww1M1Srri9c4f0Mc4QskeSB6mKwuYVos+8wQFKL3hh5Eq7CoWKHRM8nZpdOOgIxMh3a7fFfFyyiyRbKAf8Ojn1R7uVLQvBgN41PIFRXH2iKH2xPxqjUXRAZjEbMo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc12d384-16ee-49a3-cea5-08de547e09e4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:35:44.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KPA40YsBLKnTVpshpMA9O4wol8WoSX6yaccf0k/XiZSaPaJPOzNh2H2dLtwFA/kpNX4I3a9bvmqvHX1PNjXmTkdWPwxKFe++YIGI/4cr3vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7069
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150169
X-Proofpoint-GUID: hh0SKj605qoY-yfGexmOhVK-kzpIfOjH
X-Proofpoint-ORIG-GUID: hh0SKj605qoY-yfGexmOhVK-kzpIfOjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3MCBTYWx0ZWRfX7CYY73Cp3VmB
 623hxMVX0P0edlm8MFaSImIPPAurlG59/xzUwHDXQ7zuDvVGo62LxTWhH8awImXn733l7ppoEp7
 OGjEP8jkRQQbUxW4lvUFTDWnzTM42E+aUOFuc0MF9wIhk+CIQf+Qw0tV/caFrV878WrlEZ6KMy0
 tX8X+WfVybtG1hc4zizgcfKxiyPV/GEPAkRfJ+a7sFTMq/Tr3lYscutb3nvVSTCRrSB1YpZ5qC0
 7cn1o6zXEipkoiHV2W2vSRcvEaLUcBJcHkLPXyzhFBS0yM99ehyavUANpiAJ2fptxvf/u0Vb0Pg
 ktXLj+3tMDGWCGYbCYgGpgwLyqWALlUbA7NYz4ucEk3PXntrgZXw+DT2ET4ZO16d/FoResNCBO7
 2V6tTE43gyWeBVaQesq0sfuwv0PGqRgKHqLASaTVWohPQF7Kx8+WeZwbrQGcs+EjOKSHPVCjr4n
 auWe8HXKAW38UtbzXnQ==
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=69695db5 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=lZzFyU67SAEjQEVxNsIA:9 a=CjuIK1q_8ugA:10

On Tue, Jan 13, 2026 at 04:42:04PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In commit 0b7c5a632 ("fbt, rawfbt: consolidate code to avoid duplication"),
> the populate() functions for fbt and rawfbt were combined, populating both
> providers, but the function was still called twice.  That is, dt_open.c
> tries to insert each provider twice.

Where do you see evidence that the populate function is being called twice?
Only the providers listed in the static initial list have populate() called,
and while &dt_fbt is in that list, &dt_rawfbt is not.  Also, adding debugging
output to populate() in dt_prov_fbt.c (or enabling DTRACE_DEBUG) shows that
it is only called once.

> One solution would be to have a different populate() function for each
> provider.
> 
> Here, we employ another solution:  in dt_provider_create(), check to see
> if a specified provider has already been inserted.

This change is not needed but it is also harmless and can avoid future problems
so I would not object having this as a safety net.

> This also requires a corresponding change in dt_provider_lookup(), so
> that it will work even if no providers have yet been inserted.
> 
> Also, fix a minor comment in the fbt provider.

Thanks for this fix.

> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_fbt.c | 2 +-
>  libdtrace/dt_provider.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index bbe44a842..3feac56ea 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -228,7 +228,7 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  		if (!dt_symbol_traceable(sym))
>  			continue;
>  
> -		/* Function name cannot be synthetic and must match. */
> +		/* Function name cannot be synthetic (unless rawfbt) and must match. */
>  		fun = dt_symbol_name(sym);
>  		if ((!rawfbt && strchr(fun, '.')) || !dt_gmatch(fun, pdp->fun))
>  			continue;
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 848fdc132..9d75225fa 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -114,6 +114,8 @@ dt_provider_lookup(dtrace_hdl_t *dtp, const char *name)
>  		return NULL;
>  
>  	strcpy(tmpl.desc.dtvd_name, name);
> +	if (dtp->dt_provs == NULL)
> +		return NULL;
>  	return dt_htab_lookup(dtp->dt_provs, &tmpl);
>  }
>  
> @@ -124,6 +126,10 @@ dt_provider_create(dtrace_hdl_t *dtp, const char *name,
>  {
>  	dt_provider_t *pvp;
>  
> +	pvp = dt_provider_lookup(dtp, name);
> +	if (pvp)
> +		return pvp;
> +
>  	if ((pvp = dt_zalloc(dtp, sizeof(dt_provider_t))) == NULL)
>  		goto nomem;
>  
> -- 
> 2.47.3
> 
