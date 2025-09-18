Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37C283FD0
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758200521; cv=fail; b=NTf8G+Wgbkbt6SRBUw7wEXtemTKU2dNeB/ykkpYe32Y9Qj+saP0cr2/A0WmTj5PPrg9a6mbv/eCMWDhLfwU7NxBPZZA1RYg2ltygs8C/tbtwLSfWgFeYWmapDt45/KNNIrvuiVMIDj+/pspj6HddSV2hu3roVjSp373JG7xzm5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758200521; c=relaxed/simple;
	bh=DWV6yegXsTTzs52rCec1bbWiI8dolhfgNpgdxRhcxp4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=UCuqG7nroaIWACNwbijJnbeV2GkvLeCMRay/+yBc7jXJtKVhChGUDpYOBggc3WRPiz7H7ZiRKG6uoAynOhgDSjp1r4lN4l67BC3R23Af8PgCDkmM0iuXQk/tovaIC0liWnf3iohVeqpRmvEY7eWAu1LisE6EB9USQridRi39O0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dao40r9g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zgD1A7SL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dao40r9g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zgD1A7SL"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I7hNQM029860
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 13:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HT39IEF2ON3oYMU+DT
	Oc2o+eZ8AGOCIVlXZCcgqBvpk=; b=Dao40r9gUAlm8qjbHGogzHJBzipPhtGoGd
	pmvRLP8f1iUJYRbcGI10w8S7i37yvgaFp9g6Ougl1kFl/Mokff5JWRBhMdm16tdH
	DPh+rAKZaDXs92iK9FxZ1YFQiaoNgFI7LHu4tBPBehTXJfrJgYw8p6RA7Ix6DR4R
	gqCMt27BdkURU1SaeZnbSIcd2iV04l7OYBFi8wBKeqHym4OtFTS8+dQv1khcDaJE
	TA/3xYza5b3/5G+2pYEd5sCfIiwc9cf/0KWnGTKhCsw97c871qqtBmYz8tToIZVK
	+Ffyw8/XAYqe+fZACDbQTQdd4KGqj5cYmiz7O+h09L0ll9n0mbEw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fxd3cfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 13:01:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58IAsw85036749
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 13:01:57 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011058.outbound.protection.outlook.com [52.101.62.58])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2f4812-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Sep 2025 13:01:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4iWjUC2K/Q9VDzfeS7mbLReUgU/98Am6bfA4VC3NCkiy41cA1KYttuAHWSVCiCCz1axQeinNHPbxzxP12RFiIqQtVOrodGRlFTlTCOmBtHczXegZcJouX5zj84eiSKVLv+LNg+kDAq1Br9CLycEWr85xg6XM22grM006MwGhIBLLrsxtPokNa3xQ46FHqffPU6Jbv1h6zWl0dFGWlfrWNBNGTqXyhqJ8rMTch2a3Ct2J/FNHRNEAhvUGoJPA1Ca9c7i70Am3nJEyFgYDtBRpFLmkHXVawV4/CrkopDTDQeRMhw4e6LQtjPbHTptVrc4WHtQS85rdH9r41VyZFfuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HT39IEF2ON3oYMU+DTOc2o+eZ8AGOCIVlXZCcgqBvpk=;
 b=I35NY3mGvDjW8JLgjsSEuknbkYAd5CZ9z6E7BOWGm1rMCHiW/u1wj40AHmGAiJSUTZIq+UCo5wTiBfZoz+dzNE3CgLTapUS4PVwYCUceYg241ZS2z2w8YsyIVVyb/eSMVvrehXVJSJS1qST/CMgE6WmmPP5CfCwUiiQiNlVU3LpJVYtOfMyR0NhDEg/NKbJNplTafLRyGHIwm/IBshuCZZz+62IvmgVVXwkhf3/OFs4A2Ko9ip9ZgN+Jg1R/dEEAJkaP8NZK7FH4n+tDnWDSkqTMSEhd9JCBSkJpGkV+7wWKBEeL3XVMkrkrEjUb4bsP8DMwUu9eKhNCfUCfJR5R0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HT39IEF2ON3oYMU+DTOc2o+eZ8AGOCIVlXZCcgqBvpk=;
 b=zgD1A7SLHwbhjjwE4A4poch/G4FlOE62CECoga7EgAD1Ces82jmgJUJnZwcebTNf5D+VCbwK/rMUyZ67ioAk4NAV+bGns0OAPL7v131fmt4eT8NHh00y3xH+t3woB9xeTCP8Dgf2Cp1JoDpZ3yOhOZAg8Cpe0Qa7qph5Sd3K8Ys=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CH3PR10MB7414.namprd10.prod.outlook.com
 (2603:10b6:610:155::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 13:01:53 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9094.021; Thu, 18 Sep 2025
 13:01:53 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH v4] trace: print alloca pointers as actual pointer values
References: <SJ0PR10MB56721752C4BEB7A65080065EC214A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	<87h5x1p1dm.fsf@esperi.org.uk> <aMrT3t15+evn9bBR@oracle.com>
Emacs: a Lisp interpreter masquerading as ... a Lisp interpreter!
Date: Thu, 18 Sep 2025 14:01:48 +0100
In-Reply-To: <aMrT3t15+evn9bBR@oracle.com> (Kris Van Hees's message of "Wed,
	17 Sep 2025 11:29:34 -0400")
Message-ID: <87zfaroqwz.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::23) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CH3PR10MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: feb140b2-c74f-4411-d5ad-08ddf6b389e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zi+YT1Ky3Vb8IV+RxycSQ2O1cq6UFIpO50ASs4Y97sZXBDwJvxlMDD16s6hE?=
 =?us-ascii?Q?s/e7qjDQK3u3Zh0NPoaqTCQCjLYOUhxea2O9i7TYcoj4lKlTl6MoF5AOq6E/?=
 =?us-ascii?Q?3vas5GmepxLQIj8t5Z6gnXMAadkHlUgXPb+H2Csg05wSYUzYqE7e+bIpI0/g?=
 =?us-ascii?Q?4AAPWwWZWtsHC7hCp75cD1RRiQ3IBP+95ahtVlfnljqlsWPoarBMoECe0Zbb?=
 =?us-ascii?Q?jJz4epSWut9cWXKKsaTjmKzx+NcsyFdNrqHTDjr9k7lcDK/t/2ZiRRwEcmjS?=
 =?us-ascii?Q?sFhBZm0PVcl2LEKY67wEVnfx3Ybw/ux0PD4pf7Kn6y0XAcWVYOTvgkXCWaUn?=
 =?us-ascii?Q?lUzOVBTmcDP5tZH5PxgzyAKBiszeBd4hSLoQhekEcxqPkttkkpJtxlFCWGS3?=
 =?us-ascii?Q?FWwaMsrfGLJdWkav3946FpdSpjPl+qQJ8xwF62mcdmmbYG0RYsTTZqkXiOeC?=
 =?us-ascii?Q?c4dPgmjcPLnJBdLMcNzIQG2tvyZhS4kwmS2wOPJM1IWWWwA/SieULI3NBSGR?=
 =?us-ascii?Q?rucyGat+b2VukculwjUexFDzudCQC1YKmwMu1nQdz2iafM2iiOGCcAPR0+wU?=
 =?us-ascii?Q?ZCxDRXRacd9qX8S0GNrx9/NCrFXkHp4kXrB+gdN3kS7ywce3U4wtpW0kPU9y?=
 =?us-ascii?Q?fMKSkn5eKlW5WKzG3qBgcHdV2Ve/KzhZDahu+M7rP6QGwXanAc4Mkbo/M7M7?=
 =?us-ascii?Q?Ror6wh+5UKkDMd9njssN9fxeslJ63BCnSrrk4OM+Cb9+oJdeOYjkL4SyXea6?=
 =?us-ascii?Q?xrI1vekGbPHFHhmel1e7FQNYD9YeixPo5tcRca33dqfvP6nQ0Nx7duj69rMw?=
 =?us-ascii?Q?bLamNXTzKfdAN5pWj8/j5P/R8vD3RWodmHHe+K2tbm1boKjC8XThiYXyHe/7?=
 =?us-ascii?Q?JPvdqm2jxOCbZBiLk91aSrzTM3IejNsBGSIQrVt5pEtuMMI1yuiSAgvmmw7Z?=
 =?us-ascii?Q?pA0iQaGGYpz/52M0IosZXEI7YNQRwmKHG4DwO1s2EgjuoaIHpL2BrgyyNM2m?=
 =?us-ascii?Q?Tq+qCBVYeNWxZv4iFdycnpy+d2P5PbdsRWmW22lLbhv6KS7/Nr5n8EAhG3v8?=
 =?us-ascii?Q?7j8hLu4maUkCbEx9pCdAwVskWu3AZ5ioOnwmU/LQ1PGNjiXC+ZeVus4ZP/fk?=
 =?us-ascii?Q?Q1P/L6UjMYYIfrRdBQJzf5isd7PQF6pcqWjxnNnzGfonluQtzHUP+bDxSsAd?=
 =?us-ascii?Q?hJns/v5nnokvqVNN/QF0PWNub1+IrpCBr2UDm6OyhynsAPAwJgsyHKqi7gyq?=
 =?us-ascii?Q?r1nq728Nujss9bGHqL2DHD1ObiizZKPMFF/xaXildjS4rYargA6KYzriV0ia?=
 =?us-ascii?Q?6AxYyd4JPPjgCf/QWFk6A7Kakxy7ow9zQpVxAKN0WXdhhw0R+xjZ3Okie+MB?=
 =?us-ascii?Q?WKgUhttbgz94bWbBDLYpz1oxZ+VC7ntqgUzXhxWdBtK4mNTlF+YWSkjnKHTl?=
 =?us-ascii?Q?krOL8z87bMM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+MH1K0vPp852EY+2sKegBYhrScV4tlrm8DMYXxi7WV1JF/9soj55Os+r03lG?=
 =?us-ascii?Q?plwHYB+T8q3BjQ5I3v7/qCZ4R5HFZrafXc+cVXj1jNh+soeCcwve5Um7OqcX?=
 =?us-ascii?Q?B4Kyow1dDPYR+M2G3v/GQgSvYWfIcgq2zJDhFSCayA7YV4J6KxIp+F5q3nLm?=
 =?us-ascii?Q?J6IGnZt8AjKfxjmIxcXApfnMpeYkcrufl3Dca3VeoGDPEYd9luXMqMUJohpT?=
 =?us-ascii?Q?Lx0DbMfxMoOuX95qmfMrAsu09YqxZf5bW3dePEWMh0LLpiX6u4e41hTCMYD4?=
 =?us-ascii?Q?fdwGKOolNhh1pybvliDz34xLH7cR5VDBrnUvdRjOB2mE1kigB6ZY8TMGMnRb?=
 =?us-ascii?Q?G+uPfkueA9hMvzJ2+sPCtMBDMnbhNRohyz97fY9hz5/VOueRH0C9AYQXCX09?=
 =?us-ascii?Q?GydrgHoLxF0SMgvE0JPvVArqYqso0oR4cIqgxZM/fv4r9HOE9kTIYuclJtCp?=
 =?us-ascii?Q?xuW7MyxLTgbuELTYaAoal3Mb53vtMiqoBGP5FJaDoeZPwCLJnnC2apaJCdJz?=
 =?us-ascii?Q?aAyjEPBHS8xpejpcPuTFbhFL0ZquOOlouhZvWD7RlnU6qFvjP5oQ4spxHOeI?=
 =?us-ascii?Q?vOQOG+sfAJJE3ItHGEgh6KgteygOP19QBqjt2ccYP+I5ZJx3nky82Cfneogo?=
 =?us-ascii?Q?oU8cfCF1VRW6OOYOvYkpbxr0aItukpbfGBEOFTppkuh/+AHRHCQarTluwo37?=
 =?us-ascii?Q?TkNplZb3NcoHPrsQHi4BsgeNZvCz4SpoJq4i1CY3YGPN4AeAi0MqOyqtKoYB?=
 =?us-ascii?Q?6BxC/j9KzNtD8GJdX5E8akO4W2hWKU1QcCCF0zGU7GEtq4Fa8laPeGzwUfoP?=
 =?us-ascii?Q?1Nt25FVRd1LAkdfC3F6ZoSnWk2flb1P3heZcVnPaVc6JgDmANLaBRjFlwBHh?=
 =?us-ascii?Q?gfKymxEHambrOyOWOrw7f1RChF16HjVfhH1jPk4LFw+Y4aoQCNTynajzjgLM?=
 =?us-ascii?Q?7Up5QfIckzfEJnXtOjiXulg4qrtq/J4W0Rbcv8KKvl/0nGL49Vwaao7jyWZc?=
 =?us-ascii?Q?FDeDWTglAUklJi81rmipAlsUkifSwBTVhBs2N1CaJ2W50P9h4stlSFiLoYQ7?=
 =?us-ascii?Q?nB8uaXTO7khrIVp5h+V0Pm/mcjeXBNcPsTOB2fsO6JYo42EFHZgXWwNRbQAI?=
 =?us-ascii?Q?RicoAFeux3DrpZGlbjuk5ENVyxH9YrONzWWGcE/4e91LO5569Sj2YyUlXU6o?=
 =?us-ascii?Q?lVI5l44KsLDOg4FMRLVI3a/qr3Ai1ySPDV8H73TKwendQTyyBUWczdbFhKGc?=
 =?us-ascii?Q?nfY51461EJIzy74JJ6PMos8aSUxLYUP7Uy2zokSYntLzXXN25LV6y/m8/gLP?=
 =?us-ascii?Q?nIkxsvBeKaKxxsQ7hg1ba5i0Si5DmnnfjWAVYWiQKaxJSuILRVtrggKKSWsz?=
 =?us-ascii?Q?Ax0Rs3kUCGd/RvYF05UCm8BDXHV1OMmdO/m/ScWlVSCHvFFq32mIKJTJycv7?=
 =?us-ascii?Q?lAYgVgtJcXO4izLSdcaDWaRRgrX36Hx0rSCF6KUpCdvkL/SntezdI0GkS1MQ?=
 =?us-ascii?Q?qRq3gI+BV2Bzdo3m6haMpsk49epcdg52vzKBD33+mtAA8sBy4qNg4UU6kelg?=
 =?us-ascii?Q?nmP57p+fMnNLBuzZOkRzZ6Ur5imFu5JW5zTFZFFZoyxMyY8QH0HoI4q5erRT?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1iOumnt4Mx28jcmx4nP+PKa9YoKe22S+J/qGPOT7DOBNjFSkOLbB9693mF0keG0cddFZp2HWWGU+cvGPtjEtIcYwEuvWn5EkEu1THv9braZTyTvvJA39yNzQTWICE3YXRlBoV9UeGOn0aTEECh/CuaiX9PM5qGJwVFEiBkIu5TuDys+kUh7h4qt3xkPKoxRe/mKBZx2Tvl9406RzFCzYTZZl6tAYgPQFWDnpM38VHIP+Y9rA2U2h7vtrI5UT1d5PcUdRi2D3f7YUL8pf8EbyaXYlBzv67tZPS53hugB8L0hGimxzd6Jhgjx7aeC6Xr8uMKE7grCbSr5p51vHCKdOfgFW2h0wu6Na09Fygj0HYashCEP/dpWNxODG4l/I41GqRvun3qyn9zeit7wp8Pla0z26AS3y8MRW6Z7EWH/83HKYs6o9+/ghewOMkCvzq5rneNZGPhW+fy6fp9JnWlVKTklJU0+j+9Gd9DA33tCPkxdAWEW1cFxW61acAF0+vxZIIF/a5Uh4UpyMswSjbfy3qw8mBJr0JzDUL+zutU6b1exOScEDmTq5EV/qzg5VleQAyETFQWfnyW8Cy7/IxIjiFCW+Tld7QjP4y2rvv5ZxKoI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feb140b2-c74f-4411-d5ad-08ddf6b389e7
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:01:53.2991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V8LaLAjtzZ9vrXbgRAvgDFh+AqobL5bGr2z6GAV2bri7vkYKojFikomRgHPGF3ggVBr3Y9yWLpX91zxVEmmpxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7414
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509180120
X-Proofpoint-GUID: OMFg-RaCQm1d68BJGyK7akoRNT46x82o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/YQGaTTg+aT5
 6mksYFIQ7UPvUrtNaS0anO/YAiYZL6hlyt4BfvdLh1BgKv9KjFbfecwOBIrJU7jZu9fCQPD4fdG
 KIrX3eK9S/8jPI+hIrLt0gkkkSBXDLThkDfGpQpmI0yeeU/lenwpxzNGKsHlPlL7kQzBYZ9WoTk
 hbvImtxdJeTkOIZlUwSO7izaodp+w2fNLvjw4eYVzy+sfl5YHDCPMGKPteV7zuexI15ZQQYbpRu
 J1VDq0yVkAA1qcQYQEZD6Ql5hqv1k7UViE3weX40GR9bO3CxhOp+5jW3ot73D+bIUoN5GromiMD
 kfOvwlh/anCjPlkiPdafm8pl1RfkdmJmVMfyQk7IRVckV2oM2b8benNOmAGjwc/08OPXa9OCvE6
 sHBgA+w5tFI8/AyM71DMpSDAusz79g==
X-Authority-Analysis: v=2.4 cv=cerSrmDM c=1 sm=1 tr=0 ts=68cc02c5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=wPaC9LkQhKwVU9mZ5n4A:9 cc=ntf
 awl=host:12084
X-Proofpoint-ORIG-GUID: OMFg-RaCQm1d68BJGyK7akoRNT46x82o

On 17 Sep 2025, Kris Van Hees spake thusly:

> On Wed, Sep 17, 2025 at 04:03:33PM +0100, Nick Alcock wrote:
>> On 16 Sep 2025, Kris Van Hees verbalised:
>> 
>> > Because alloca pointers are stored internally as offsets into the
>> > scratchmem area, they were printed as small integers.  They are
>> > now printed as actual pointer values into kernel space.
>> >
>> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
>> 
>> So... the change is to generate real pointers for children of alloca
>> nodes too, and scalarize more aggressively? I don't really see what the
>> second part has to do with this change (and more specifically why it
>> didn't cause problems before now).
>
> It doesn't cause problems - it is just not what should happen.  Since an alloca
> pointer is a pointer into kernel space one would expect (and legacy behaviour
> shows this) that printing it would give us an address value in kernel space.
> Without this patchm we print the *offset* into the scratch memory area, which
> is certainly not a valid pointer in kernel space.

Ooh true!

> Because of how code generation is done, it unfortunately requires slightly more
> complex logic to know which values to convert into actual pointer values in
> order to store them in the trace output buffer.  An extra complication is that,
> if we are storing the pointer value into the trace event buffer, some versions
> of the verifier will complain if it is a value that is marked as an address
> into a BPF map.  That is why it needs to be scalarized.

Aha, this is saying "if this is not being dereferenced, but instead we
want its literal value" (e.g. for pointer printing) "scalarize it to
lose its mapdom". Presumably we know that the result of such a REF
operation will never be dereferenced, since after scalarization we can't
dereference it?

-- 
NULL && (void)
