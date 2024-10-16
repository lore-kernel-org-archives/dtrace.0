Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729BA208D7A
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094511; cv=fail; b=tJo8IbXtQDd70D8hX6b2zxyE9XRyefdmuR+TuvY0+kmm7ldmN5OIowsQNHZqFc+XArA7KsXqsS9pPS3GFcrk0Mp6vfU7EJvxcDqRXh43kGPAcaPkKkSyvXw9Z7myXS/HSQM96dJOJuwFHddXWEIUEfFoq8NHrzd1pVlHYOaGipA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094511; c=relaxed/simple;
	bh=N7Qnhpjms16BOOxOVrf/nMFN93C4cr7NLLvPvgoWsH8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QCnpG5/8qY/ZvZQSRz7jIqhT+YytyHZXqj+4tGb7L02vVZwDRUsF+f2aQXKMy7BOoQW+zcvmCT34QZ/cNVr5U4DSWBcdy39eYtPIEzCufrACkw6GLBNCdQQwHi1XrvDZglo1UY9LzF3Qd65XRowXuOqkbDRSv/zavFAJ+uiZ7dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j6IrFa4v; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CJs4hKdQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j6IrFa4v";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CJs4hKdQ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfhe7007385
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=pD6sqrTUHHMdJUutqG
	UHFeyWL4qSAzJFm/NAt4wOvjE=; b=j6IrFa4vqppHJ1xzKzQO+qL7w0eUHVFpyt
	L9zX4FWxH0ykdkD5ElFsCiunCIxvX6n4OSqqCZPCmgSDKOX1cKFsC9oJcXMfeSYb
	tiKPPQxNm2T6Uitk9rEVsjNYAjUZ9hfcEIhMXQvNUxXcgMEuWA3dPEX6eD8BQCMl
	lJKkHxuih5yGMZvBlGOMBC1LQ93iVBnyRED45/qtuDvNuYDY8GKiggTdDvbIA12c
	AdZy6Z+LWqhKe4Yda2yOeXX8IIvbne54g+mARqgSWQFiCEAC/osRSsgFt9ax3Rq+
	1IC7PnXLdQP4MFQnpRe9Xw8ZBIrXWLvq8EJqJZixA4Dbcqbsrpkg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fw2m9hw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GG1Mj6010363
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:47 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfbbj5-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn6DGftlRAutFViJ0ZrHdPiZa6kEtCURczxyE9W+vDwi34K4evqcL4+IvGHVSAVg5foW1Ar9StPQugbrgTFTZ8B0cYsxtnXsXgla33H5HBmMwrd68iMjIDwc07JBnhNmv2ukZclZa/32mb0igp0/UTjGKpEnHTe0Wc/KtChB717h3F6AGnv6IcL7M+7nlwnah5riI61i3LNMZdFilS3CKgHdPF8kEbSOCk3kzqa6yoTMT8irVJJ0AWUNxRPwqeT16xtEacUmn/aRGmW5sLwQ37tn28Kz6KIyekZt2R5CetNqN7N3FYOjGKnI8mk2Xv3F4wS8WbmDleCfOZ9NZfSrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pD6sqrTUHHMdJUutqGUHFeyWL4qSAzJFm/NAt4wOvjE=;
 b=KEW7yxrMGYVhb5d2G1L7/thKg2/wf3C2CT21IC0SBcE9lkmfOuf0f5y9nLickWQQInJllT2DCtDelF+pQyKEUepq/qg3KjbqMOp7D4lLXQgs7I3742ZJPlH1VUBqJH4wJnT6pkP2PPJwgHPqjIf6bP+6EyauegQ6fjho8/4QX7HMZ46MRLFVOBb17XOpU3j1iwnNmDOAZqeiGOy9aR5FSlo3qcYJFosD+p78n0fJ1GRSVHghH1Bk+vvDa1GZk5dv7Swwg9FS810pLr1pmBA1/I+XSnDi4GcXlbWMEhjoP5BcwlLBEc5RG6RTHYVwX786TL1DNWV4LS0SaP4tAXfIyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD6sqrTUHHMdJUutqGUHFeyWL4qSAzJFm/NAt4wOvjE=;
 b=CJs4hKdQ5FlrLUneCUABMgm9NZNoMB9PJ4xLiFhTjwmSfX4x3QraGayxski9HFoj/FRBYQoCZ5WMj3gUAkskLfTjEgz5dn2prud6+pHNieuwXyuPsgHSFYIzAzMpaODUhaAUk3VRnJle60543SevkJQhIdI6N+YZA1liJSb/Q2Y=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5673.namprd10.prod.outlook.com (2603:10b6:510:125::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 16:01:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 16:01:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v6 07/19] Create the BPF usdt_names and usdt_prids maps
Date: Wed, 16 Oct 2024 12:01:37 -0400
Message-Id: <20241016160139.29589-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241016160139.29589-1-eugene.loh@oracle.com>
References: <20241016160139.29589-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1e0e2d-ce8c-46fb-61ad-08dcedfbd42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?myxT6KQG3KEoMG/0PdzbwSemjejKacdvb77DF9kBiYafCzlCfk9wxcaZTWCn?=
 =?us-ascii?Q?Zf//3WcJADRN2w03tOBl4ZtZEZXYPtJ+ChWiqCOQHKjFmCGpDav98lfGd8ao?=
 =?us-ascii?Q?BQ9ESS2BKpYZqOdfj653sI1dcBuSwWYAQ+fOPC7z93//9tfu+pAw7SbicILn?=
 =?us-ascii?Q?13NAIIomkSvnPIxIF7i1fE1J7sTXfCO5q0bJDYRW2uIX2YWe0eKTHWYuHzP2?=
 =?us-ascii?Q?G+JGl6M/1bAtTCZXvKv2WBx8tXhTo/6Xe0fcI39hkDRk7+SICH4H8j6Xc4wk?=
 =?us-ascii?Q?7hazjzU3RdGwLi2bBtHfXwtsTFRAFwS4GURzLZ5LpApPZ1vf40WTQwd+Uo7y?=
 =?us-ascii?Q?wnHidckThGL+lyWg+v3u4KDLvAuqGNVnKgaAXHW3y01kN2sRvJ8C3mLPTj4/?=
 =?us-ascii?Q?DN8oDfXJ6mkY9xJwGVs74b8kLKpncW+PTz0cHWGkSwy2Ii1esIV6HBfsWR/Q?=
 =?us-ascii?Q?CjsU841/QpJja/0lRQQQl3LsvwFMxBG4lljlBbRa6B9B73KlkolSxAMkJ8DS?=
 =?us-ascii?Q?dCCp0N0Hmki7K2bW7PDVrzXJGicoqqSM8YfyTHuys25XUX5dwnpYi5wv3VjV?=
 =?us-ascii?Q?NKGb4JV83N38wCL56071hrMscAxRSf1bITTVUmvg31TsNg4IyEAI/Euhmdk3?=
 =?us-ascii?Q?2jRO2tmyNsaDV7MF3HKEMLE1tgjDX2kd02C1uN76vpa5CT/RrdRoR6jz09yi?=
 =?us-ascii?Q?esb8KNCZy1Hmlha1H1OlrQRBI05QRBQlOcoYW7UTYqlkabyQeVXTivdw6cAf?=
 =?us-ascii?Q?hsosr6vspj2lmoNu21hjHlMrfWmiVTPBi863/A1zIF2xtZd4S76QV/UQWrof?=
 =?us-ascii?Q?AK7ySthZ6ejl3zs+FjCpXh3+vylcLtGnSjNXHBNXPPSjuN8FBYhqPU4Ub9LV?=
 =?us-ascii?Q?rV67xlT5fAjrPzhdL08WgMk4pge2EhoDv3rZF+UC+WwkaVD6RIz5ZeXkQYGo?=
 =?us-ascii?Q?/vbpPn9RSuMAuhcMRG9VOubA33dC5l6OobZqlEPbim3rDXoIEKFF1f94j7Vc?=
 =?us-ascii?Q?pyASoEePCOCfeCib0Ify5Qyt2AwxRyc75hENNdYzzy4lR3RVVTQwXior89zB?=
 =?us-ascii?Q?2tDj9WKtp377RCfQd5kYkFakLNeUOZodKsUAsCDDHCQHlgUoBjc+PnnzuYeS?=
 =?us-ascii?Q?XQlE20tNq3Fs9CHdzD4B3JVhNkSHZDM1zNI8afM7M5LowvROqlQatJtFTdo/?=
 =?us-ascii?Q?sviDI4jCivza7GxDr2902+QMbPtSOX2fkIGPQhoJ+Bg4TXoFvNCqbWMkEdWV?=
 =?us-ascii?Q?PJlkbVyB6VdfPCkUEVZOVR+8o5MOV1rGx5sLJjz71A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Sf4ULYExk9pileFaBKroXpthqbvSEUo8Jm1pK7AiL0m4+q9isqeG5yiiYIc?=
 =?us-ascii?Q?qJXcMYp5vnxYAKi6PCkQcU4CubeCYZX2ZEsU+DkwUNkRFTDUhhEGlt2DjJZJ?=
 =?us-ascii?Q?F3qEvnOP2F1EVw86SyEVODjw5+Ex1iXu/0hViHr5a2VJDZcqtruHlTLBhUUF?=
 =?us-ascii?Q?EgaoOJpQUBTX6mcbrTfmDf5KBhY9wMLcci6TRBd5DWfwnoRGFhcFB5U0jYUn?=
 =?us-ascii?Q?SOlbrIcbtB+RSyCkSKfK0+eYw/WFnpzISOLF3rKt9EdjX0C89fg8EvMKox0E?=
 =?us-ascii?Q?hElbh1wV/3JyMOGQWcPGWuaaAh3TbBGPBcPk/40sCqZSRyYTuJer2k+/dwW+?=
 =?us-ascii?Q?gPmidQrOa1liim+SF2T1dItuZ1P7rQhTmhxDRWjoMoIMTPKePcWARp6rplNP?=
 =?us-ascii?Q?YU/uR3rQzIbIfXEG96gXlK8bz+BefL/eU2Ggk5UtjtwcqxAdR8BwTYFVUS3l?=
 =?us-ascii?Q?1f5BRNNV9XW6CcBI2MsLEtuwH1NjC4xLTkCn1ArwbqwiCHg8rf4qOFx1MBgS?=
 =?us-ascii?Q?ZUDxpv5s2I7LJjP++Opg+IssI5uuPmkd/0C6VcG/3t4hIiy782fdblWx6O1V?=
 =?us-ascii?Q?98b32mRRftkiY1UI6Pg8KhzATidxjHJ9jzETsd1/6bXjpPomsGujKq2FAS76?=
 =?us-ascii?Q?PKzTpUO6R+VeZpNy/mkbmtGETf1cp+f+Wx4gjFb2FZwgr8Gp9UbloClRWbDB?=
 =?us-ascii?Q?cjjkoxmymLsGaU8t8ycp9tjx1hbd5lxJrrQJhOEp+Mfz7nrC5Xr3H4FRbfY4?=
 =?us-ascii?Q?NSTWTUGKUJ5KvMXZ1q9YhWCpdicQfDzdguqW2V6zvKNjoNNpUtt1fs8JQIzR?=
 =?us-ascii?Q?HRvNz2L/NEEM/lMKqB41SxyhtXQ/r+ATWYWhDMHF8naupw+TL04pHXvo8qkP?=
 =?us-ascii?Q?YramcHhgumTtHNxMxIHdkJHotsoGRDjSJEPPLPtgtavFin6pWHgouqxTW1L+?=
 =?us-ascii?Q?aIHNMqmgiCuBRUQ9XDBJooG970JklX+KEw4+7kXPIwPn9826c0LAYyhTvg6c?=
 =?us-ascii?Q?aEyNqgwXdoY9oFhl3iH6eCdYzYOvkXVQi12ZxI9p3gszlehgb0fqOJhr35sT?=
 =?us-ascii?Q?GjTzvC2CP1MNSrFvgwvBV0EzZpIO11OVfKmbN79wY9ogDJFBgjJT3939pySa?=
 =?us-ascii?Q?gvWzDLIzFhGk6Svp3LMJPrruYG9zBxe0KYkeRL/6Mht7VoyI0Ukg/f0oEUYY?=
 =?us-ascii?Q?/sktMj42IFfLACEdOmnWXV9uUP2/vrYouWamQZTwc5zFhbyMw5d0YsFNoGyz?=
 =?us-ascii?Q?FvPnb0nMvPSwm26fdx0GmHTxnLaXjYDP7Lq1JmI6MCKGa8axL5DQUebcx6g6?=
 =?us-ascii?Q?fV+lCd3gUxOT6gOSdKQtnyUxou1NfdSVWKh3DR5MJ+iC/CPcsYSGBgyCObi3?=
 =?us-ascii?Q?lZxhg0cNJY30o1BLb7NkF/VDZ+XnvAjazDaExQCfyGmbQ4PSqdZ3g/3E/SL7?=
 =?us-ascii?Q?hAEWRUKDTMf/+p+ZKPGcDnVBhU2lDfgJCm3kMN3f5NPu2FaSWCQSaw7ZfTLO?=
 =?us-ascii?Q?gw2cj6qQZg24ZtjNKAolLcZv0s5yJS5dN7MWw1tG4UUQpx6N5vohdQJogLGJ?=
 =?us-ascii?Q?1veOzZVNev28bTPH045LTztqTy3VzR1BSf1CI4aK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vOzl/9wLhSn4Gt5dGryI6IxjYwKZuyV6EYX9rQ3ohQeoEOz661rKO/1AEgcuIDyfPYWVwRWnRVkQ22E0EnpbK+eKr0gAPXG0q76BkLSk9/eKAPrpsMP/gw6psUjn26QLvyQPIgHwiIAosLVOvb2EAXe2WCDUS6iR9+IsOIlt0GaQnrdQQCgea1NhfF/pq9Rf70hoWeP6Yy/sBNz0uxciXvF5XDMMdZSss09Zkym3lRKKaGv1y6Dk7SkpGCP9kxk5FedQ7RfcPbn3Z86RH/OPlOA8ClsAcxn7YYf9Owv3eE0BmGQ46loJf35THYE9OK4XVvJQA7tMArhKFkHVvj2uBrv5GQRuaR/9lFT7CyRQ1NJSSjQVhE1FfG42ZspkgEz72XWu32U8oCcZZeZmWP1F/7rCu+UuOzhKhHIl2/dFJnDa78W5sE85fCwVXc9drrf9liusqcreoN2siqsTkfEaojsYE7+/0NwCiGb8b5RWEnOGK2wSPdfcLwBOWPcMaPCNezEZ8YIwtlpUbjsSt5AcuRSfNaeVUMofd2altrbrWeadW+Zng3uzToj9ToAlje2BcuIu2gnltddLYFCI9Ry63EB8pj513Hwekz5Sg6aI7mk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1e0e2d-ce8c-46fb-61ad-08dcedfbd42f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 16:01:43.3424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHZtiG4L0OvhE1rP6On9Z4qgOPQ2WvPpu0O+v+5364FD/vIsNiiRzIZupnIva+mmi+ebOOxp6Iaeq0hbOFTZFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5673
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_13,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160101
X-Proofpoint-GUID: KMWHuW_wM1fXWkRzwGiK9Fjuh67fAEoG
X-Proofpoint-ORIG-GUID: KMWHuW_wM1fXWkRzwGiK9Fjuh67fAEoG

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
 libdtrace/dt_prov_uprobe.c       | 331 ++++++++++++++++++++++++++++++-
 libdtrace/dt_provider.c          |   1 +
 libdtrace/dt_provider.h          |   1 +
 13 files changed, 450 insertions(+), 30 deletions(-)

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
index 7a36b6187..1024867c9 100644
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
index bb172ace2..ceb331719 100644
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
 
@@ -123,6 +136,316 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
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
+	/*
+	 * Strictly speaking, we want the value passed in to
+	 * dtrace_go().  In practice, its flags pertain to
+	 * compilation and disassembly, which at this stage
+	 * no longer interest us.
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
@@ -782,6 +1105,7 @@ dt_provimpl_t	dt_uprobe = {
 	.probe_info	= &probe_info,
 	.detach		= &detach,
 	.probe_destroy	= &probe_destroy_underlying,
+	.add_probe	= &add_probe_uprobe,
 };
 
 /*
@@ -816,7 +1140,10 @@ dt_provimpl_t	dt_pid = {
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

