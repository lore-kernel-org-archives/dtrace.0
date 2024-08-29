Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E61446A2
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909189; cv=fail; b=XPmHfSg0l/RKpUrvDF5bU4vVkk0f/1MnnRDeTmh7LQFrfEiwNlfgjemf2kVV5t/6AvqL1+NJ3oPovwBXIrzGo5Fbng2mI5Zue3J03ToWoVO7fFoNNcrStVkrYGAODd/LZolfg3/ZO7ftDHKdniP73UKWp5rnILCHOvTDz7tFbdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909189; c=relaxed/simple;
	bh=n1JGHQwv8M+KAMzRZvON4l2fP2RKWhXTFnX38eLy9uE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uw36kCdP1WLafGgSf34DaYCZhmNTg6NriitV8u/0DG5qt7341hXRN9tSBdH4K3D0yBB1SYLMp8T8ur2lcCzrTMosFL3y8D7DkRqixsN14qXVKpWZqTIJMhyU7+6HcCBfBL17lGQ3ZPBz1OTY1GkjNv60Ti9HnDoMkfyAU26grP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=j9BIizRD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sqi2zC+3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="j9BIizRD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sqi2zC+3"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fnVi005782
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=L0wRzXy2eJWpBC
	xrVDC3wr7nETprghfD03pDFs3sMF0=; b=j9BIizRDgo5Uwtr11SiN+fmkQRgkrC
	JOdmyqzzrTKDQJN4wOHV7XXu4eskk9avGsPXzfWTDjcGeQghMUv6Av7hZFyUlYng
	6QGhWEaoD/l9Q2B/zvMkdvRdk7ILnl/T5VvhxPaLrbjCZhqokasQF9wM9IRpRjW+
	m5IU/d6GqeDzAJhbKB9anJ5S6lpU9fmuk7Ru/tGhCQQNZ02T9AzsQ+E6zzKjE8Gj
	DLYGlhB7fSXwFpgRyB1YXO8mvJetZR0orBy9nhMk/4dJdtT47Szu57CLdDH2o/LP
	7/obODYQfVIBRNMPJCmRrvm5stEhwPH2yMiGIYsAW+3JZGf/aj2EBu/g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu9em-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4Bsjt034954
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfp66-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlMLA3CgDewbHlhzJfSmtIPXo3YAeCdhZ9NPlp2tXJtW4dv0BSymmcKiRdpBdrVuciMjYfpdfnYfFg5fwle4cSff0tfPNMCStEDRsKmLSCEeFTQW5QumWUlTJu3zXbHMuWqi1yUUD/NjZr7f4g70AiR6mCMSCWc/6Xv/dBZ/tILQ3P3HgYqw2TllKNrCpzgsLhhiY4yQB9PA05LbjmmRbXaOUSUNEbKmvJAQ607e9jZJHGhPpPI5pAqIRjdGD1PmKXLwyrJgK+Z0Xx/Nzw/1X+18H9+TJPHYXz48VWiMOf4XPEpYOsIgV0wnbxdwl3XZc23/V1LhbEUUzsxDgiieQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0wRzXy2eJWpBCxrVDC3wr7nETprghfD03pDFs3sMF0=;
 b=T3SPoGMK+MfG9/7FubhkneHwuAIcwFxMPoFefqoTiBNubc0BJ2C5UrRue/DB5Yc7i1HFmTABIoKJsIimw4vgpj1r/BSZ0UEdusvm6eoMX6ke5b/5DUIxi5P1uCkDjuqeMpRRb2QwDce+LtDwXKgGs7H53qIWObL48vm2r3zfvTFrpWNYFVHTJmGAiK2qlP8Wscbv3JNmSYglxx40xpmSXTKq3ltBenLUApEpqNRz03e+Qkd7UYNzrGPEjmx6ZaOWaVMCWXIA2T9jUERCo75pOl3GBdxgi0UU74lR7o3xJIMkHtu3fMZcxozSmQ4DWpYMazAXc/mqoZaNA0205okZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0wRzXy2eJWpBCxrVDC3wr7nETprghfD03pDFs3sMF0=;
 b=sqi2zC+3wwuSTdMrS43MjxSVfNEfncvhBcV/B4J/7U3GMH9yczKdAouYudH6Lg6LY3lU1skXcSrZZJd5R/fvcfYOUZukGutrQZlI1NfLKPz8mQ98RDSfbz/kmEmTPNQJJgzfDv7CFS1xLyDFtn1N5mBTc7q3oDLD/qapDLfVxbw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:18 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/19] Allow for USDT wildcards
Date: Thu, 29 Aug 2024 01:25:45 -0400
Message-Id: <20240829052558.3525-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 849358be-5c23-4b74-b009-08dcc7eb1c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FcXVzd9+VteJmH3KPeEF/03FI9eqDWMszCLLOcfUW68so7eyf32yWs/43Ni6?=
 =?us-ascii?Q?LxJo6r+1D6zZ79WDb5PfsanKC9ACbPmEVrWzkwVdvsFcZfR8oKOY3/Gpsm5m?=
 =?us-ascii?Q?dRiy6zReLE5cGFWYouZECWCrZwQMcxVugNYj1jferDufR6oFk8/BWQ720zpq?=
 =?us-ascii?Q?KQd3NALzghQ8qXLwYRWL/2gB0iqKXV6Z1jDUkXzJqrwNL/xC++FUhbsVfOvc?=
 =?us-ascii?Q?i5z6YSW1Lf3X2WymRQLAFWf2aYC3CUwJjERHHtgtlUWPS5u0ssogYO+kWxR+?=
 =?us-ascii?Q?l+oJK7+rWtFXPhQzXO2C+hO67iZoWAksx4jobJdoIkdC/LIck+aq1wNWAloJ?=
 =?us-ascii?Q?6XltyoElrB+obQlgvJggUAOjrYI3tq6mIsXzWXbqiyos1uz2yDvoYQ0mZnge?=
 =?us-ascii?Q?1h+zL62ffzpUR0r1Njdqvu9Y/3SGRX3UdHcFVTlZVQkg9EdPH8ai8IadB/zs?=
 =?us-ascii?Q?Ot8B4g4wxxziZ9DQ954bjSj9FpXLS8uDuO5lK3gcejXWDcg0CLWoEflRA17u?=
 =?us-ascii?Q?FZ6meP2HAje3UGlfPvCAsYNMaWjoGGx/5Ll9MRnwKF2WXYxiZ6Rk49LrOnr8?=
 =?us-ascii?Q?RSLc9bDXpewTLlB/zEcgS3hqtPLrddVmy+wZKGtQH5f8YCZVWj/DJyvArLoF?=
 =?us-ascii?Q?1XBfTkfEEVZav59WJWL98P5W2vxdcz9i63O3ByIYbxONWP/a1OE4SBweAJlU?=
 =?us-ascii?Q?OyneVbkiMvnlmuZW/a9Nx1LIQBNwa46AcZVEXU5SEvKVl8aASBu4dcWfkafz?=
 =?us-ascii?Q?euiuFwuw3+OuQgfWAJszU9N361IIYO2mLdeCgi9l23xHAmoIKNMdAl/nvDyJ?=
 =?us-ascii?Q?NP0SzepP2qIMLlHjte7u0a5TvQqfOaBXdX3dl684IjvlqlrgSoi/l7MZ0hxi?=
 =?us-ascii?Q?L1OXHhiWevXK8MY7w7U/aguRrke59PAoCvqK6FbnulIbHSiZxxQEiwHBBgFb?=
 =?us-ascii?Q?yfm6lq/GroB+qcf3r3lmDVd37GW1xPg2YBdHqYv+OCqrXzdX3PTjtgw/wUFJ?=
 =?us-ascii?Q?wvySZISjZMNJ1oTom1pMjneM8ZHPEZotwhjkZHSUz73KiuejIUPHra63I/kN?=
 =?us-ascii?Q?ebx+mELsyXzuDvXRSNYamW+6V2dpB7+nkxD+eu5tlKsWSoAQe2h3c9HL+Ch6?=
 =?us-ascii?Q?ffAL8DSMUvE40c24uNbDq+NzVOngmjyqXbD/MtulTlcjQZ4tzlLC0x+qTiwN?=
 =?us-ascii?Q?1M1RIeiZ8sxM8Pe1LDEqEs9MmXjB3p++xpxdjqNoJsXuFQPJAQ8iMZhi0EKC?=
 =?us-ascii?Q?Xmp6aVKOHkdOVvnI6ZaBiafeEczfl2SDPUUw6nKBCbPGHA7SxQWAougtPMlA?=
 =?us-ascii?Q?Vu0Os0ienVuYz299ANtx83L/hVH9X1gZKC59ysqcKdvKTQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p199hEtv+c/siXtiHAlrqzZqcmiAaIuDqfzHEKjAwgdxMt8+NgA+vb0BffQu?=
 =?us-ascii?Q?dJ0bH3qfKReH53z+KHPl8eUI0d/cXuGIIEO7DVFPkgWWCznsKs4SF7vlre3U?=
 =?us-ascii?Q?EtsuQCFgzm5pZyj+SDzXlnMS3b+e9r46/zeXTmt0AcTQxMN74WsgJ1Vd+Tt1?=
 =?us-ascii?Q?jQ7uI92VW87e611oAxWLmr5+z/HPkoZkPfCHE70EHN54tvwRgHtRC9/WmvTd?=
 =?us-ascii?Q?r6CatpG8R1I3DPLPmpaIkhVj7DlBzZ/Z70y8/sgsiNOj9Of++Q5G/O84YghX?=
 =?us-ascii?Q?45dMd/p67yS+b7fg5I5XGygNUx7M14FiCC2IiSFLZZJeAnswaFxJqdbrc+dg?=
 =?us-ascii?Q?V2Xt208h9L0n8hyNHVJEN05mV1LFmup5E55TNTj3YYUnUy1f8Kj5EJXWKTD+?=
 =?us-ascii?Q?k+mnj0G4RMese8Ff7LVNe9IcP/YlOnyaT8N5OxMyDZpaBvG70Aek8Zrgozz4?=
 =?us-ascii?Q?e1Q39zaAePAkiZki8jcZzxi+/FFQeKz3+lUm6bXqphVZFicIngBBZ8EeHNjB?=
 =?us-ascii?Q?UHLoxAKq/LYSJffJXlJZJpFkxYg651pt77u5fve5N4A0tpDwLJsbubgpePct?=
 =?us-ascii?Q?exW9eL97HKmv0YyTyU11XV+7+CPZPzSSx/URoSU328GQ0784cj/hduGZTE5E?=
 =?us-ascii?Q?HAhIhPG0hXRl7WcCR5i5j1CBJAm5GNi7hJKFUcu4/zx16hYommz1RYU+FagC?=
 =?us-ascii?Q?z0TGbXnKLIt1PKzr2b9Xff6BPggiktXN+j5e1xdFmEL5syqVSJ7PopSN70+2?=
 =?us-ascii?Q?wXKX8a4BlZuYaigf+lPHqZIz1dR6q6a2cH/34NILQi9AdjfHSMttMgfEGf5e?=
 =?us-ascii?Q?pWnx9v3+iBu+w9Glcq16/TzOhDhC8PtuavLPG/7ie4hQN2zvQ4OWHpiqCnU4?=
 =?us-ascii?Q?xH2DVw+VXRfT1OvuEB/LXc9tGYs/3dQOL8CH/3776nZEsxafm1BuJLvniTAD?=
 =?us-ascii?Q?slv+WkK0V+BHwjFFbm7MHrQ0zmcVlAsmE5soJsogWhdOUYMBIkfyMCH5vtRe?=
 =?us-ascii?Q?+fJWYdJ/GDxN0XdNAG3H+8gAOxlYjA/BaQfU4sfGo15msZD5qWYgS1heK4iE?=
 =?us-ascii?Q?N7T9cjteUISSlPOTjSKqgvY8K/z6wBS3oWPN1e/QAMCQrkcAZ28I5Auu0Ynr?=
 =?us-ascii?Q?hQPLHXA9pvJdMaHGDinP7nVTXeWMuuRoZOKP5hGWmM5X48VEbAtBi/bgB6bC?=
 =?us-ascii?Q?19gnxMulym8JcocrS8UyyQhOlzWvv27pXagRKCarqUiVteColJTs+B9CKFtQ?=
 =?us-ascii?Q?TYh1UC2b33ST1C3Ji95/eabVJtnrgGDY6fsADyCIT6w0zYTwlmnW+uAffaxA?=
 =?us-ascii?Q?M9B2BSO1NRxwK3ZQAoXj7cHwGm1o0vfYXwbhzUAJSpBYmswjuDI7e5I68RQw?=
 =?us-ascii?Q?rbslq9dHC/xrCo8Aaf+Ir+bV7vAu3miV82BeuYmpCKoIP/HPS8jW4S4p2qXK?=
 =?us-ascii?Q?+5AmSG+lGlyTxpPFmlukEbrYv5cd6L1Eg2eQkLov4ZeKD9VawZSFsUceFJmZ?=
 =?us-ascii?Q?dRDCk3Zmacp2+EvpOaMvaPdy/hi+Fw5JUpCbYMEZFgt5Ec+bF+qwM7/MZDts?=
 =?us-ascii?Q?8aV0+LOE32bPBB6/nt1mhAL0xWFf+qSJClVsfPTa?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	73uT6QpPw8+Y9oHoWZo/OOHcH8WEoqZ8IepSGRx7ibWTxy0kMxLitmk1JgkM/TavpvIcLTodoAgkWB1GZATDaJU9Si+Yh0MgyPMDUNosZRqSupFDpR2Rgpq+nUjoUZryyQLPQS5D1WVrs/RPU48IwqfEeZHj5AN5HjNtUvZTjKTwmUgLESWrst+1XFDztO8CSxehtelwBZMfg7KvDLKbj5a2jh6oZ+0ROrC2qJUq1wd5x4VIfPHnoOlWi5Wf/0wMFUARbEnZ+UcpkFLtoyvyU83ovqYt4UgPCPg7g+pbkZ5bhpSVlOvx328bqsBzWNIGRHlTT3BlfNEJrfxkTgvx9HBGI0VsnCAwJR7b699/SuXo1wp7nlImzSI1C+ZiIy3uTpnCItt3WBp1ZhDI3996rJ8nP9X/UorcDTrvfiNtkXnVchMzKQbkRyQPmbZFymLBcYGLaCw6ap46MYqmXSpqvwGj+sFRCmal7QKO6vLrF9mXjs7ZvfDmBeVdl2wvhBY1esSH2pG2B2nkpQuWAY9GIhrzkTLnzbe/90NHOZqLNFOBSsk+rQjE/a4jIBDlNv++BRpYD3wzc5IO+Mh8sdL1wy/Vp0xVrSvM2tCZ+EVpuoo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849358be-5c23-4b74-b009-08dcc7eb1c64
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:18.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPDXV10iyYZxvdaNpl0ZmR5HeFETB7RcD6olvhw3OGcFUOLd+xqdEbi2H3DTZoVzxWvWXi/o9qOewZy1YKTqxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: 8D9DC49OzWOPNxDLXDImh5cZWvK6gLKT
X-Proofpoint-GUID: 8D9DC49OzWOPNxDLXDImh5cZWvK6gLKT

From: Eugene Loh <eugene.loh@oracle.com>

To look for pid probes, we can require that the provider description
should end in a digit.  For USDT probes, however, there can be wildcard
descriptions.  This includes a blank provider description as well as
a description that ends in an '*'.

So expand the criteria appropriately.
---
 libdtrace/dt_cc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index cfd4d3d1..a9934d10 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -278,8 +278,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	 * On an error, dt_pid_create_probes() will set the error message
 	 * and tag -- we just have to longjmp() out of here.
 	 */
-	if (pdp->prv && pdp->prv[0] &&
-	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
+	if (pdp->prv &&
+	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
+	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
 	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb, 0) != 0) {
-- 
2.43.5

