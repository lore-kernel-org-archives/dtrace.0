Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6824190058
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147549; cv=fail; b=ZUI68srVphHc8aR9xAw4Pj+gAm1bzLaThnY4+CBkUcquOWLDNnLZRWJeZya9wCtFNQV7Y/e0vKDE9BQw8HKmGBJlGFyTbL+MZGlplabduo2al6/+t4kp1Q6QaqPNGqog0E9rebl28hmdaKYWxbGwYyrsjnmv5DrbDCew23lk0eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147549; c=relaxed/simple;
	bh=9wzEp8FXnPHARJm7mWexOS3e4b0tOaVegtzaC3wsW60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZOhHfDba4vyqJ35Ptr5YXmtmdbXNCoHZ7M+pZ80e69l7TFJAYu1hS+fBI4Gk8ShBlHVGZumuQZUWuFNtny4YwoHsbMhxqKi3dZks1J7qLhkly/ejXMw7qOyhPFb8Auz2/6at7seDF4g05SkVA24XnglpEZHrBqE+6Q+iWl7W7SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JHTNFUbb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RPs3bxR5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JHTNFUbb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RPs3bxR5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SEta47007132
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=agKH2VUfcoidFeQOLS
	ZZEYx9TIi140Fle0iLTFSbvUg=; b=JHTNFUbbo025uUWfz2y9I65PpK019NO4fj
	4eOlCd1cEyvbWKwLZye8MFh492+zcU/kdQHmHMxv+S7EjZ50DacStUXDGTmgtjtv
	G2QyvDD6ILpNVBUTwnUH4p9+Hra4ej4Ny6pDEKK/qA774tsfg9LjvMpq0AgWnt3h
	gE2GGe0M9ciqmAbm6UHn3zzzvbE1r/WmygEyuC1vK2+HoEQqmc+NM7SV8myUv5Bp
	lcsoUTC1KOp87Jqszq+yF1Py2xncU8sX8+F2+BFoxiTElnz6uQL0F6avPBolPIgr
	dDbYeaSPiUGdeUK7yrniocdFf1lfV0w68kb9HRfxAX2MA2AEUSGg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmbwgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:32:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SJKA32034894
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:32:24 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd6hdga-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 20:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qat70z8d7+P0k7AXihQN/1j0qpqQ91V+rGdc9yzb1WbHPbfVrvfNCBmJjv3cVpk4sF54w+QEimC9R4GiiNfI1ZWk52WkkGwgylGd/5Yu0+dn+86It/AQy2vvVT9C1P1q0Dt+vjyKcQcxRVjo4aABG6B/M1Cddca6qxWATMv+bk3D/TSavy+Is6HxlgKddkGU6jLuiY0/e3zew5fN9Q20db9IfeJ3ssxE+I6gV/hmOJzB15HwWilBRfkXKz7sxxwaUHtvf4drRu1eb16tkwlvj0FEn4vp7JxfekhQGqJh+hUqM429iWQlW8auNpCd4O0mhnMKxqejECPyHfjnMJSpaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agKH2VUfcoidFeQOLSZZEYx9TIi140Fle0iLTFSbvUg=;
 b=b7qs+eKIXPilRKI0XubPxOmoHQJCW9IcnQdisMkzuqocdZ1G9+2LO1/GGrp99jNU4QBVCXexGR0ExfSadcj2BvGhfSGI3b3qtVMoK7mRDwPPCAIgjHdrpZc4V7Dzz4HRj1FgJGo1VM97LOFdprWDTS/wKuERIR7iYk6E4FuXubDkQwZYyvQVppYsTnYMvH/PbjikcuPHROu2DdTgcGuENTNawMN7HphRnuuronQUoH3TnPgOeRlN2RDvpkjrxFjumZRh8Bhm42LMD3Lv0YOcqeEO7YzDZvZLzvx0iESbGEkVuTz9m0r5UDxCgZlNWT42G/lqYMOG7jN6yIzr/IxZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agKH2VUfcoidFeQOLSZZEYx9TIi140Fle0iLTFSbvUg=;
 b=RPs3bxR57O9p9UT0XnG5u2KNqLMVzyXjBd158EQ8oi9enNDnoscty7tA08Kf8Me9QlDPhxGhHzQswyW6pScQ6dGIl+49hrlpgioFmc3ZbaWUbPxO7dc0UBsgMLqqkw+dSOsL6Hq2feWPuaE/SGAu5NnEynYjrbfUCtS3hGQ4XUU=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA1PR10MB6415.namprd10.prod.outlook.com (2603:10b6:806:25a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 20:32:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 20:32:20 +0000
Date: Mon, 28 Oct 2024 16:32:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 4/6] test: Add a USDT "deferred" test trigger
Message-ID: <Zx_0zqN7ihoTnMbn@kvh-deb-bpf.us.oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
 <20240928022158.9206-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928022158.9206-4-eugene.loh@oracle.com>
X-ClientProxiedBy: LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::23) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA1PR10MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b22816-e6db-4a39-61a5-08dcf78f9f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TgDpfptFiyipzXqd9VjzeJxYMdDzc0wqV4Dsbn0Zbul8YaqmeFkb2izGAg+E?=
 =?us-ascii?Q?0Tu6eeDPpAS4eFOjJfkjaq+Fsj2udepKnfev1O0HCu2FI0pSCyof1FiQr3uy?=
 =?us-ascii?Q?zm0IwIjR1Px/hCVpttiTckKjownzIXpyg+oWkMVZ8NmZO0iyutGy/KR41/vs?=
 =?us-ascii?Q?P1b61jbM1+JJt2hEfxaTOo/kQmw86XqqCdjHXT3yg+OQc7KDKsVw6RcRU1xV?=
 =?us-ascii?Q?tp7ZgOHBo+bEOXAZd07/7pQhjvkhBkguV9cWC2S0DUsNPm0EiF3IO13yPJLi?=
 =?us-ascii?Q?bLJVwNbGZhuh/zstDwA07NPbzNmbrbdab5m+ZS5fdkH2syrqK6H8KEuLA5K5?=
 =?us-ascii?Q?BYklsnLk55z7F+mRmGvxV1ecqTIDIq0CKrFTwFgh1gCtGmSm0CTp28RJMoR/?=
 =?us-ascii?Q?TttWBPKwCoPIdHtjrDxqsbhaE5srhCPssqHI1qOmunZDK8nzTc296Uk1yMxT?=
 =?us-ascii?Q?dYjlNpeUkDO4ylsyDogHDXiu2NTg5kilmfO34Js/srfUTZuiLLrb/Q1yuVc5?=
 =?us-ascii?Q?K4VUV3DCoRidjv2YIGXccKi01Y+QsB2xr275T9R1+JafNTs8pNnoGf8FmpWF?=
 =?us-ascii?Q?ufmvGF7GFAbZCtBNE7vNGPEqTYTrVDXLAiUJELF9GRQTIG20ZhpivgtYKkw6?=
 =?us-ascii?Q?zcN5j+7tCWmWQBID4gYIKnIYSg7QORHHDQfU+fHJ+pYsfZ2RvHdISM84UMWd?=
 =?us-ascii?Q?QSl8FZn1DYpg4R4Zu6rmWgOiSxlteGqD9IA/Q+wje5EbPy2RD78QKNr4Sm9n?=
 =?us-ascii?Q?d0cUmRuhDWgJuz7b4U2lM48/PKKS+r1zmlJdF9atvpzURLuJMkOzEvloYXj9?=
 =?us-ascii?Q?kjY0iIiJFuQ4zGf7N5ssWRjh03B2wQ1LZGUc65GrF39Ia1GfjzObxCsFNf+o?=
 =?us-ascii?Q?IQEaE0xWhV/xsjzEkX7yD6db37izfRgu4REzKO+jlOkAGgLKiFS2/mPpjuLI?=
 =?us-ascii?Q?OkopAfPO3G2u+uhYJogdkOWf87s2I0V4YlOl8PcChooBY33Fx7m9JrKDe9uw?=
 =?us-ascii?Q?aZOUbz2FYI9mklVoKR1bgPRJMmGFhd6SPrFQkz1ture8vIWm+GPfly2Tv4BQ?=
 =?us-ascii?Q?FtQmuAGj2kT3aMovqIDPwxAktk6mfiXNql2pb/80YAGz7aCnIQQyqArBszyF?=
 =?us-ascii?Q?zjPKEO2L1/BUL8KsS2GhGrOfrCo7iGYskPh4QCqrbiLqbUlJ8AajoCdS0Zxh?=
 =?us-ascii?Q?IfvgKDXXcQ/syAsgHjFXFi1+n7AIeBKjVCAkg770nlc76AVYuLc0Su3CS1pI?=
 =?us-ascii?Q?6KjokopnvU0aXO4ugQsxpyuijYpZtBKNknAej2lMjpbcQIoWBLuX9hhVelBs?=
 =?us-ascii?Q?WTKGMosd29d4cBqI6f+KlrrN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KLScDgf5BZjbGnUa8HRVfllB5DnKwhXjaWPmCZHNEcq2Bh0/LOPE+AvZkzct?=
 =?us-ascii?Q?NxYxLsQCZXe0GCCI/I+Rxpl8sndlz6AUQ0cQtUturUV5TmF90v4rDDJBIV9z?=
 =?us-ascii?Q?uks0zS4YvMK+ob/vIncd76Pn7ysV8oI1GjdhuMRYDV5Hq9OFEsq2mmgyaOPk?=
 =?us-ascii?Q?BI4iKcNO1UaKW2Y+Hi3iP/RcatrUO6UIUsLD8NOWF8OxL8ioBm3av9JeK9NR?=
 =?us-ascii?Q?Xt0qh3CgREadEI9JSCLQlyJJmFLepyXNldQZanPDLgnDaP+BbQpnF3HGRCY9?=
 =?us-ascii?Q?r+4UDjvxz/QPuviTEXeeUZtDhOs0yyY+gB0GhDD5Wwq64gtg9cTWr2jGvOTs?=
 =?us-ascii?Q?WJZrTlspZv2P+/AuQkWonOnmh3A2iabAvipJZa9cvReC3kvVvXSfk2z1uqTq?=
 =?us-ascii?Q?E505v5etP+CtadlywLP2iEMPvRszafU7DF27Lhhxsg+lktmwWWKq9HQQaQ6m?=
 =?us-ascii?Q?cCL2mmXdfMXId4oW6EFy0MlqV98JpEHgKJ0pf/K2Jr/ysZXLRBv0X3RyD4Vb?=
 =?us-ascii?Q?+3HZ8RcJxYFf9CUtsG3DKrpCudxIZvqOWOOYy0Qx3GsxEpw6mi2S8PHMC77X?=
 =?us-ascii?Q?u9vvOpYyqBX+GZFiSfPB11FzSP3Ky5J1UrzWAYkBfhWROSIoGYROR2UyMblm?=
 =?us-ascii?Q?vBYk0j+7YZIF5HCd7KmGhq082gmU9QXDFsm4XIjycs5Xgv1Jzdh33F4F8H6f?=
 =?us-ascii?Q?3/cClQle7Wvi75d6xtG6lm1GWhPQg8EaosFlrWMCRtEbjjBPVBhgk47tjzmb?=
 =?us-ascii?Q?kXGGmN5MCmwRV9u9et/W40K8V/Da4F8F5ytJOIYvIFNwlCoKkFUcTbcL+041?=
 =?us-ascii?Q?CyktxGzeruP8Wp1zU7A9+eoxtkWjD6RfLsIfrT4ywRjjkIdA4hHz0UXOrWo3?=
 =?us-ascii?Q?tU6/0luLYjCjWmYoZWIznzFiPkl95yvsQb8tmFeAHXjUAnI/0DN4CTGRM0Q0?=
 =?us-ascii?Q?VYPepXyCrByXriDmaPrUPDDPjETLUFNimpztL9MdH3OxUX6pnpOY1jzLLa/V?=
 =?us-ascii?Q?Z2oYeYvtrKEbemS2fbklHDLSXMi5V9TtlMCA1w5T3lFFZaY7ly18ROWBp+2W?=
 =?us-ascii?Q?3Qi0c00tdK9HHhi9ygbSbrxDDIJc5rpsoOW3hgOWK9+EfCBeHETVE4eccG6V?=
 =?us-ascii?Q?KtumV4HkH0GdcyQG+VpqnebRjirUdXuUngp+pKN65SC3igZVo23QxHlXKpPJ?=
 =?us-ascii?Q?QUTsFKDkRyh2ZrZzlIFiZlduRt6I75GDvl99r8zN6Mz+eykJ/eynht9M0bFE?=
 =?us-ascii?Q?cmwd4Y1IwSgwKTLFUGRy33EU8P/AQT1EhdjrvvWnXVxpC/or7b32lKaksgRG?=
 =?us-ascii?Q?DihvsKIePLDn5esOEblZto1h6nFrrmD1HKtzlmwHoivyu1svOd94tMVq38N6?=
 =?us-ascii?Q?7SN4UVB5Vh0KaS64lykzOFjcUsRa87/dFjSyDuMv6ZGCnxRZhdynZsX39kw8?=
 =?us-ascii?Q?LEfZemV29voW7GDXX1yGF7NpMIUjCYxGT8RL1R1AJeLjIrqo337vCNoCu3d6?=
 =?us-ascii?Q?7E0Yc7sUvSES9Poct7MQ5ZO/N1A7heNgLMRlw4eFu1z1YOmaqq5kotT16LpA?=
 =?us-ascii?Q?/X8Hdpr5aU0ntvpqX/dWAYs4IzdoAttxQcDcVV39OsinqlPZcayNBUuoQile?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/X27qjBuZvKGbPxex2Pni/it/NWbt2eOvnKFFK57DQcs1bfEbcIqnwJOrL0udyOksUBGPXTYR9B2phcA5OFgiRqyI7nknc42dE4NWsO7aNKJ4UNvglx8umYvsmuwI2jLRcFaAbins2V12FS4aIcT8ASzz13ZgeqOUNNKgzRcdsq1EJU52TG8sHDr5wLTePwrXi4S71z4l6PasWTPQl/spRClOSY0olwozowYBJuPqgNzNxZruF1Il/Ol18wMqzE+ANjFEqIm7hYqWi6jMuaxTFcRZJYiqmENKOq+i9xtrvAz5QFcF8eqd75NiKk/KSDuT/Kkv1M5hTokexuWP7A46Ci/U7CkHPSdwL0owOwVAw91G+mEjJQCKDfyhEOF1k8RqybSNFqpM3/jcHUrvgLtGKwZQW/736xd5G9JVvrwXxVWQ5oZRjw5XxTQZCqtHKrJwuH01lK9UU4bVxL+Uv6y68PM/lhe/LC7S4j5FGf2CjMYtzoZGUYaOjFFlf9YYxGUMa4vGce3vWf6XFEC6s3wXtudVujPdV0mVcFwCZvcXXPPQEY+IWiV2DdyHBX1JCSzOowCaojwq5XAeMzShasnMl3iDtTkDTZ+ANIhmUTXN3o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b22816-e6db-4a39-61a5-08dcf78f9f2d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 20:32:20.3662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2esQY8XRMboMw0zoVv+CnoskiAMAFGKiElWNuCxYp8yVz0PeEfw8RdwCucd2bHhe3H7A0uk9D1P3yFBZUpcheBsxCr3JZ09UYB3AHCXVSJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6415
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280159
X-Proofpoint-GUID: YMJwUBF9YprG8Da0uIaPfDQ1R4wFt6aT
X-Proofpoint-ORIG-GUID: YMJwUBF9YprG8Da0uIaPfDQ1R4wFt6aT

On Fri, Sep 27, 2024 at 10:21:56PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> After a dtrace session has started, it is possible for new USDT
> processes to start and for there to be a delay before dtprobed
> and then dtrace becomes aware of the new process.
> 
> Add a test trigger with USDT probes that waits for dtrace to
> discover it and send it USR1.  Once the USR1 is received, a
> short workload is run to completion.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/triggers/Build                      |  5 +-
>  test/triggers/usdt-tst-defer-prov.d      | 11 ++++
>  test/triggers/usdt-tst-defer.c           | 79 ++++++++++++++++++++++++
>  test/unittest/usdt/tst.defer-nodtrace.r  |  1 +
>  test/unittest/usdt/tst.defer-nodtrace.sh | 49 +++++++++++++++
>  5 files changed, 144 insertions(+), 1 deletion(-)
>  create mode 100644 test/triggers/usdt-tst-defer-prov.d
>  create mode 100644 test/triggers/usdt-tst-defer.c
>  create mode 100644 test/unittest/usdt/tst.defer-nodtrace.r
>  create mode 100755 test/unittest/usdt/tst.defer-nodtrace.sh
> 
> diff --git a/test/triggers/Build b/test/triggers/Build
> index db80b30ed..107b3b4d1 100644
> --- a/test/triggers/Build
> +++ b/test/triggers/Build
> @@ -13,7 +13,7 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
>      ustack-tst-spin ustack-tst-mtspin \
>      visible-constructor visible-constructor-static visible-constructor-static-unstripped
>  
> -EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-special
> +EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer usdt-tst-special
>  EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
>  
>  EXTERNAL_32BIT_TRIGGERS := visible-constructor-32
> @@ -203,6 +203,9 @@ usdt-tst-args_PROV := usdt-tst-args-prov.d
>  # usdt-tst-forker calls USDT probes based on dtrace -h
>  usdt-tst-forker_PROV := usdt-tst-forker-prov.d
>  
> +# usdt-tst-defer calls USDT probes based on dtrace -h
> +usdt-tst-defer_PROV := usdt-tst-defer-prov.d
> +
>  # usdt-tst-special calls USDT probes based on dtrace -h
>  usdt-tst-special_CFLAGS := -fno-inline -O2
>  usdt-tst-special_PROV := usdt-tst-special-prov.d
> diff --git a/test/triggers/usdt-tst-defer-prov.d b/test/triggers/usdt-tst-defer-prov.d
> new file mode 100644
> index 000000000..a4ef8323d
> --- /dev/null
> +++ b/test/triggers/usdt-tst-defer-prov.d
> @@ -0,0 +1,11 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +provider testprov {
> +	probe foo();
> +	probe bar(int, int, int);
> +};
> diff --git a/test/triggers/usdt-tst-defer.c b/test/triggers/usdt-tst-defer.c
> new file mode 100644
> index 000000000..2df5401b2
> --- /dev/null
> +++ b/test/triggers/usdt-tst-defer.c
> @@ -0,0 +1,79 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * The main characteristic of this trigger code is that it allows deferred
> + * DTrace detection of the trigger.  That is, the trigger spins in "phase 1",
> + * waiting for DTrace to detect it and send it USR1.  Only then does "phase 2"
> + * run a short workload to completion.
> + */
> +
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <signal.h>
> +#include "usdt-tst-defer-prov.h"
> +
> +static int phase = 1;
> +
> +static void
> +interrupt(int sig)
> +{
> +	phase = 2;
> +}
> +
> +int
> +main(int argc, char **argv)
> +{
> +	struct sigaction act;
> +	int i;
> +	int nphase1 = 0, nphase1foo = 0, nphase1bar = 0;
> +	int nphase2 = 0, nphase2foo = 0, nphase2bar = 0;
> +
> +	/* set the handler to listen for SIGUSR1 */
> +	act.sa_handler = interrupt;
> +	act.sa_flags = 0;
> +	if (sigaction(SIGUSR1, &act, NULL)) {
> +		printf("set handler failed\n");
> +		return 1;
> +	}
> +
> +	/* in phase 1, loop on probe "foo" to wait on USR1 */
> +	while (phase == 1) {
> +		nphase1++;
> +		if (TESTPROV_FOO_ENABLED()) {
> +			nphase1foo++;
> +			phase = 2;
> +		}
> +		if (TESTPROV_BAR_ENABLED()) {
> +			nphase1bar++;
> +			phase = 2;
> +		}
> +		TESTPROV_FOO();
> +	}
> +
> +	/* wait for probes to get set up */
> +	usleep(100000);
> +
> +	/* in phase 2, just loop over probe "bar" a fixed number of times */
> +	for (i = 0; i < 10; i++) {
> +		nphase2++;
> +		usleep(2000);
> +		if (TESTPROV_FOO_ENABLED())
> +			nphase2foo++;
> +		usleep(2000);
> +		if (TESTPROV_BAR_ENABLED())
> +			nphase2bar++;
> +		usleep(2000);
> +		TESTPROV_BAR(i, i + 2, i * 2);
> +	}
> +
> +	printf("%d: %d %d %d %d %d %d\n", getpid(),
> +	    nphase1, nphase1foo, nphase1bar, nphase2, nphase2foo, nphase2bar);
> +
> +	return 0;
> +}
> diff --git a/test/unittest/usdt/tst.defer-nodtrace.r b/test/unittest/usdt/tst.defer-nodtrace.r
> new file mode 100644
> index 000000000..2e9ba477f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.defer-nodtrace.r
> @@ -0,0 +1 @@
> +success
> diff --git a/test/unittest/usdt/tst.defer-nodtrace.sh b/test/unittest/usdt/tst.defer-nodtrace.sh
> new file mode 100755
> index 000000000..e5fd2855c
> --- /dev/null
> +++ b/test/unittest/usdt/tst.defer-nodtrace.sh
> @@ -0,0 +1,49 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# There are various tests that use the usdt-tst-defer trigger.  As a
> +# baseline, let us run the trigger without enabling any USDT probes
> +# and check that the counts are as expected.
> +
> +dtrace=$1
> +trigger=`pwd`/test/triggers/usdt-tst-defer
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/defer-nodtrace.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Make a private copy of the trigger executable so that we get our
> +# own DOF stash.
> +
> +cp $trigger main
> +
> +# Check that the is-enabled probes are false when the USDT probes are not enabled.
> +# That is, nphase1foo == nphase1bar == nphase2foo == nphase2bar == 0.
> +# Also, nphase2 == 10.
> +# Note that nphase1 will be undefined.
> +
> +./main > main.out &
> +pid=$!
> +sleep 1
> +kill -USR1 $pid
> +wait
> +
> +echo "$pid: undefined 0 0 10 0 0" > main.out.expected
> +if ! awk '{ $2 = "undefined"; print }' main.out | diff -q - main.out.expected; then
> +	echo program output looks wrong for the no-DTrace case
> +	echo === got ===
> +	cat main.out
> +	echo === expected ===
> +	cat main.out.expected
> +	exit 1
> +fi
> +
> +echo success
> +
> +exit 0
> -- 
> 2.43.5
> 
