Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7BF2170C0
	for <dtrace@lists.linux.dev>; Thu,  7 Nov 2024 18:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731003397; cv=fail; b=MnvkL8qzc0LEW710qi7wOUEaCucazJyUjeV30M2cV4aapnw+Mqew6+ydD4mQATmdDH4K1UYTf0w4Flh+91jcf5BR0y1YZ0M8nJbu685LYNCJH0wDBRIvsVTDoUiogFr/C0Ec5w36k0w/2QB/z+jaRHkdJgygAOUQSA4OJDNSivU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731003397; c=relaxed/simple;
	bh=Q7WqI5An7WCDVzcPK6NVbvUJmaybwgDwXGKmJ/1ZeW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uWmJ28rGQi1ZHyi6KkR9sSbDCEovZ5vGpSf5kTHN0DwgAGfUOh2hmTX6fYH+VHoih0Y80mQVOaU5mF944099Rx2UIgIJ3997Q4Or6X60G/A6G8cjux/MpATaSprPWuzyfOEkT4+lZksc2uyQFJeu9E7WBnTaTpwoRYhaQjhQ7k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EPfBvLr6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i5+UJrTZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EPfBvLr6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i5+UJrTZ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HBWgJ013484
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 18:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=UgWitqgJCcDBcLSnxq
	Vjn/y5wXdL97MEvmzFVTCB6kM=; b=EPfBvLr6QxFockbjMb61casxY05ynxAGDJ
	sp2Q5jNXbd76Cu7Yrmy2tbs5d694zzmg5GG1sMZ7mhbK7wtONlWThwHjc7z0UlAr
	/1I7ey2E4XeGTApqBqANbZ5i5f1vAvfcJFrTtgw6+JyCUpIi9qZsLvSrFYPCJCIV
	JJeue2ANTFuMqeG3Ra5yjfU8zfX64DFuV3Km/g6VyNE5Bkv9y1nRf7vRd0mkT/lx
	W4QZMbUtIWhhRNw4OlmF6jfqklz4962oiUI8G9h+K5pA8M68+cjJd0ejx2i7Q2mL
	XRL71DwGzrsjdCYyigUY7N7VE12/yZRBsv1FF97RGZat81/ixKrw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nbpsu81r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 18:16:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7H2GnI036479
	for <dtrace@lists.linux.dev>; Thu, 7 Nov 2024 18:16:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahgqnbe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Nov 2024 18:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0FsdP0Him+mVEV4Udq1TNISghwCcgZj4ldRa0c0hyAI8N7TP/4TPwuGtolCtQpf/8X+YFnzIJc+wWiuDkk0aXZQmScmBjeIgffjqEfZAAMXwEb2GWJS5Kc/N96jpbNdtnwBg9VLjGeWPQv6Oiv1SHCLW/pu8KJrbvsDZ+mESHcrt4hkOtrWJbA2nj+FsptiHIjyrmTjV8mFI9T/vsv2GJKwYX3iUaOiHemtkAmFoV/R/QhK9yt2InyFUwN4OdefyrtTcOAZh2R4q0yXxuok1GXKOxwo56ihKrOCTFqQjbXWLiyEH0+teuOGxWzL3V93TkcTvHTRjmWgpdz0vIOdRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgWitqgJCcDBcLSnxqVjn/y5wXdL97MEvmzFVTCB6kM=;
 b=n0Fgevzlbm9V3yRVEEGV+Y4I/o54QZ5W9odUMED3RD6Cldhj+yANPN4Sszkt+aCUjr3iB733kvIxoFzyuhwdg3bcroCXT3WbPMAkA/migESAbWyr8L5+I/uszCpcTYFtl1QqmsQBQ/gxdCMqMPMD8K5vXoVcO6q7gTmVQyRlW1TnZWuA6SFVnqxNV4afIO+CD5RHpZI0lEgO8sjL4xPZb0JbpmD26RMeslkl+9lPsanslieAHFJT+Onf04AqYUKSjVSG2f5ADuJekvpTBy8DizgRVgETZTt9zDczsngezBcg6r8c8ktkSnIjjK8nBAka2xt2PTDKeqCwr3el2Hwtzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgWitqgJCcDBcLSnxqVjn/y5wXdL97MEvmzFVTCB6kM=;
 b=i5+UJrTZtyah9qLl2pMRZziPMji1ap4qE6ht8pO5XGx2oQdSWH9JY1psI3jEf6ZE3uKS1w6c/DiL/rniFdeQzwSzuthlaLK5Me0iGtHCB+LSLa+bSVho5vPZ2G+WXepMQp49RoO/jTEX7qODlSnVrNAMUgBX+836Q8FKQkHgN6k=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BY5PR10MB4228.namprd10.prod.outlook.com (2603:10b6:a03:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Thu, 7 Nov
 2024 18:16:13 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8137.018; Thu, 7 Nov 2024
 18:16:13 +0000
Date: Thu, 7 Nov 2024 13:16:09 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Allow arbitrary tracefs mount points
Message-ID: <Zy0D6TwCsiTMv81w@oracle.com>
References: <20241106164656.421931-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106164656.421931-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BL1PR13CA0405.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::20) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BY5PR10MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 8784a799-939e-4232-e608-08dcff58430b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DeWAA8wcXKgv3hoN81+P5fY5h6p86ko7cAZeQDH9Z/D3CIau/lIAfml4jhHE?=
 =?us-ascii?Q?to+1GMbCfF6GhaRDCQTTGi4YIqwdCj188ZCg2W5KzcgXWeaaU624xsTWvFcp?=
 =?us-ascii?Q?Tavq1EhiOiLry+ORlJXJ7PT7f5UN+cj2qJysh7JsuhnXMTyqi/NfaSMwPXPX?=
 =?us-ascii?Q?wNUEJMfFau59MaxKvPc8OXNoj9KE3hJ1KIE8myIUBslnOkBpxkr2tH13DMBA?=
 =?us-ascii?Q?88/BFAkwDDuA35j3zoi8MwoAQNdc0stt8Gblhl5TCYA7aaXTQZmF6UEMj3wK?=
 =?us-ascii?Q?y72KuISayAgq5yHntrHQvCk1hE8V3xmMSmUYJacX27rgcEI3GED9XrHFzJx+?=
 =?us-ascii?Q?gJ4rgxv2OYpdz4O4aJFFf64f6Pp7oJBlKwZ67GO39zHnwVVyZvWbOhroc2An?=
 =?us-ascii?Q?pC6Gwp/aP6BzwVNVIcRxTh4E4dNv6eCd2Mc8E9vbajUlpdfyXnbnzLI5HrtM?=
 =?us-ascii?Q?qJGgP3RHJLhduqZeCyLcPio7xnYoTgZbRDhKqyNZUzZXV/jUxj01UAPH8gqb?=
 =?us-ascii?Q?zuoDKc6zdYSVB6f6PxaPwKusm322AzmYzjaBCfhNTh25B5kv9KFhcYU1Wa4m?=
 =?us-ascii?Q?z0tFpwoUTWasBb4rcxa24RQDUnjbeeA3h9BXZDdXK2ZyQsx/8haSqC+EU8N/?=
 =?us-ascii?Q?ndKORZ+jssmZhPxnhn3baz6yvDa8fX9SEwq9eSTZgkVgnO20vAAZEbfBQZHR?=
 =?us-ascii?Q?pic4P0CzPeXCJ0cbpBp4qcKX2yZXKNf/S0zA+UkPWZMqzUWv12e1fBHxh6hf?=
 =?us-ascii?Q?iy1PcasIb8gWunvHA4f+/qfYiXaOi2Hq9UbSEwK+I+o1l5g5BTpVoyXoVsVP?=
 =?us-ascii?Q?k1qC+EwsVpRNOfeJatmrXB+Pwh3Lm6G6NDWaN2Xsnr7oFXXOpObaF+yHzcH7?=
 =?us-ascii?Q?C9TCQXp1kKuvzkF3/yC+vBY7Fs75tfWy2B5j8s3J1WMOcI+2mFZgFeduME1b?=
 =?us-ascii?Q?c/fLoQDK2a+43jeRPWIgO4sdQs3wFC3/2vQ0pedNaf0yTdeKA3I7VRunbwNV?=
 =?us-ascii?Q?6ZpJCIO8w4DCNRcAl80tGVKZ86bVROn3t8k+OL8snoJYWul3TBLRatwhLFAv?=
 =?us-ascii?Q?ejoBYKNhOKEAqBfOve01IqqDWliDz/Vf7PYnX0enMcm/D9bwBkEGWI9vaBda?=
 =?us-ascii?Q?ISN76Pdr1jDDRN+V8yeAUlKtv4LrY2n90vGONefzGe23iXtEnArepP8pTAPJ?=
 =?us-ascii?Q?xrPoxMOxrJdBnNhcJpFEJTaMt8o91YE3UbAyHleeiO9eHSKIuwT8hJrfU9Nn?=
 =?us-ascii?Q?Jpqcv1sJJ8WgWvq8qJPAqxFAbO4buiNB/RXBmMvapw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xjXgMSSgOlrt7CUfqVh+6cYna0tB2vS9b8hXhR3aWLel/FXgL3N9yuRK/aJ2?=
 =?us-ascii?Q?i1COJw2JuPlbfrS8+qKjY0db8cvOpkt+X+MG0S9O8mQ/Zq4S6KAF+skdryHI?=
 =?us-ascii?Q?SySQVdpYRvnd/PGJRUAoIwmgtZzyx5JW6+LKhoPIrgyHQ7VfHndR3IMbzVyv?=
 =?us-ascii?Q?i3Sv8fQNELUJ8kBVHo0u5wkOyJtHJMtK8UHZSGlVk+hsY/YBmiBhBHGbajMQ?=
 =?us-ascii?Q?8vrNEMa7S2TV2ZWN9ozkvYbBKG4g42mP+ZHW4Nk19MC/slsG+hq5Bll5t31x?=
 =?us-ascii?Q?zjLZWU+Li/k+/zBwqb9d4wvQCwpDuQRL230DBMnvum+gckHzsFmj7GYxroHA?=
 =?us-ascii?Q?bLUH6j1INx1SjndN6/HVFoj60vR3k2ZctCussK+2qXbpBkuAHIMXvrvANMc8?=
 =?us-ascii?Q?MT6eIs/RPztULQPWJHAtfTmzaMS7mmkO31JARv4fJQ0UeXhGxOD9kb5YhdiI?=
 =?us-ascii?Q?0DqaITrFQ7q1+HepuZBDrYYIxrrWNZ0EOqCFivNPBUeASy6DzvJddJXY9+AY?=
 =?us-ascii?Q?hra1Xp+0rB7AahVG0p5S/0fqcg/PJMSvxk7Du08C8ldn6OIBMmkq1GVR4mUx?=
 =?us-ascii?Q?PVLKiTSECflBcRS0bntiuSW/fPv0Vr5FeNFOhjQqBOr1wblCmMDxKlbx9bLh?=
 =?us-ascii?Q?/c5VWiGldz2aaMvtfnPzzCw4KrI2R5KhO/Piif3NR+zH1C5PVRXipkO9ThSK?=
 =?us-ascii?Q?qEsgHxzIt0bS7TZGq2HtlZ/9w2F+xMSS5gRhx516RqQDSxgylgXkGV6lSEGy?=
 =?us-ascii?Q?ljdaH7IWjEgMjOrgghsGwPRS28woq0CKPtyu6XCg+prHTiScQDrvKAjCD7TD?=
 =?us-ascii?Q?5OBVQmy81rRq9pVWxnCFywk9AW+rHquXLbENCA2MYYZ2/MtcNgvcEqJ1sx9H?=
 =?us-ascii?Q?LiR1In2UoTcN+x4V98uIITGVyUTzEoYQDu7NWHWMr3BsNF0jX7Gy9mNfUfVd?=
 =?us-ascii?Q?odTdVNiv9jsK/E+i57QDFYavUebvIeuxUJ4vGvsWWZrCNKLFmc3eqhbY9z8A?=
 =?us-ascii?Q?xJ/tGmTCCw9soGLtZcYoA0pVP/Je3olZ6rg8bC+dh+ZFVh+4WJxnOh0jIFOx?=
 =?us-ascii?Q?8dveO5tlzbyHxXVylB9bFEZIbnFquFiBJdiQi9LYpH73g+58afUH7QHs8p0d?=
 =?us-ascii?Q?amKqzPvlyd7pRjKr3eTLNaJ2DPM9CiILI2wiwUFYi1TztCBTAHsuVBmHu6WK?=
 =?us-ascii?Q?6n+A6e6QFb9iebWQFV7CkZNKsaoQL7I4TKMhOVeSlGHRjwZF+Bov46wuU7ef?=
 =?us-ascii?Q?kReubRH/ALKCgC2F0Lga8Vo/7devTSNeFGks8KEZ8OB8+hSuiWGsJMap8RUs?=
 =?us-ascii?Q?ElDIYWg6Q49U/nesHdrzWAw7NN9vEMmg8frONwYQaM3sftkhjVQUNXoB/EXo?=
 =?us-ascii?Q?3E5aYk9/atT8LFFWU56C35cHtw8LO/FhwKhhiXMp9IAbF/rO/JEp55k3DZTx?=
 =?us-ascii?Q?UQz4Ez0PqDJ+iyADEUKgYPEtHYP+uEaHG+D3VrKWgLoEoThCN1tekvemu+44?=
 =?us-ascii?Q?AnXYPc7V3khyoak3U3uX3+FzfgR/a2TigwfN6+8/hnjrqM4f05xrTm3xrLUi?=
 =?us-ascii?Q?7POidrvRcuajFwmV0Q+yq+XMZrZpHWLsB4UQ86swUmw3LbdJD/kz2nIkAxOL?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MFuGI+0+CnpPgIO2qOrJvgbEWCiZ9S+wketov4stswav/zeW/68Ggi0tyAcSK8Ehg3NqPUPY1ymwYmBjkYa56LVHOUW4nIYDvJPgLuPuQXoVt4doWtG8eyE/iW8tIUHh853DL1CZ4edsw/sPUinOcSMOQbql56YR+LtAiOekllDvxjHqbXHogOREZoqy96G3GJzxdrASaqcoK75wnZQeOVbzicCeUS6AriUSOEBiD0/cpKQlkJ6oSiDCrWISCdcMxDF+NfumknrbxUGbo9DgnABPYWLftIH3/BzLL/2vQcTJeUbr4UqDBl6v9sJs+anCz8b+YJPUm8yWUGJBOL728ZPZ3DXOGnw7M0SFW6B9hmU6xySpBmS/QkbDoebguiOvs5STfSk0ZV8ZB6/Euii46LvPEjCucfkjB9GaOTHyp1VbWmwb/zjxFLxn3QZI2zUwdskcvVLf0EM5Cun85SM0N80P1fD5rrO0o12efaYDynUVR2tAytQN/fbRGj75Edq4C3G0bFk/pp9YTRprFctQvH1WiVrisRcmRx46SVGWaAgyxOMxzEwMJ5iW8/xgCxA2YhPPeu0JpJDyX28bW33TbVOanUXkSB5vp6mOmDdJ+PU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8784a799-939e-4232-e608-08dcff58430b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 18:16:12.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0PU9M3m07ON1+ZsCtAiihYD4uQtpRQSUZCjpbvcjDDv09lKaz3GVSJAhNVDgVTfTCPT03TyQqfWFOqjU+f5pOYdXSX8EJyHarWRfEtjPQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4228
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_08,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411070142
X-Proofpoint-ORIG-GUID: ngsGv7R2vQBhkaU2myOJXGbE8ljMahsG
X-Proofpoint-GUID: ngsGv7R2vQBhkaU2myOJXGbE8ljMahsG

On Wed, Nov 06, 2024 at 04:46:56PM +0000, Nick Alcock via DTrace-devel wrote:
> So as of kernel 6.3 (upstream commit 2455f0e124d317dd08d337a75), the
> canonical tracefs location has moved to /sys/kernel/tracing.  Unfortunately
> this requires an explicit mount, and a great many installations have not
> done this and perhaps never will.  So if the debugfs is mounted on
> /sys/kernel/debug, it automatically makes /sys/kernel/debug/tracing appear
> as it used to, as another tracefs mount. And of course there's nothing
> special about the "canonical location": it's up to the admin, who might
> choose to remount the thing anywhere at all.
> 
> To make this even more fun, it's quite possible to end up with the tracefs
> on /sys/kernel/debug/tracing, but an empty directory at /sys/kernel/tracing
> (I got that during testing with no effort at all).
> 
> All this means that the existing DTrace hardwiring for tracefs/eventsfs
> locations isn't good enough. Instead, hunt for a suitable tracefs mount with
> getmntent(), and add a function to return an arbitrary path under that
> directory (mimicking the things we used to do with EVENTSFS defines and the
> like).  Return a pointer to static (per-dtrace_hdl) storage so that we don't
> need to clog up all the callers with dynamic allocation: only one path is
> ever needed at any one time anyway.

More on this below...

> Tested with both in-practice-observed locations of debugfs.

Since you mention that tracefs can be mounted anywhere, there definitely should
be a test that exercises this functionality when tracefs is *not* mounted in
any of the typical locations.

And I bet you meant to write 'tracefs' here and not 'debugfs'?

> Bug: https://github.com/oracle/dtrace-utils/issues/111
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> ---
>  include/tracefs.h                             | 14 -----
>  libdtrace/dt_error.c                          |  3 +-
>  libdtrace/dt_impl.h                           |  4 ++
>  libdtrace/dt_open.c                           |  2 +
>  libdtrace/dt_prov_dtrace.c                    | 31 ++++++-----
>  libdtrace/dt_prov_fbt.c                       | 40 ++++++++------
>  libdtrace/dt_prov_rawtp.c                     | 10 ++--
>  libdtrace/dt_prov_sdt.c                       | 23 +++++---
>  libdtrace/dt_prov_syscall.c                   | 18 ++++---
>  libdtrace/dt_prov_uprobe.c                    | 52 +++++++++++--------
>  libdtrace/dt_provider.h                       |  1 -
>  libdtrace/dt_subr.c                           | 52 +++++++++++++++++++
>  test/unittest/funcs/tst.rw_.x                 |  7 ++-
>  test/unittest/providers/tst.dtrace_cleanup.sh |  9 +++-
>  test/utils/clean_probes.sh                    |  6 ++-
>  15 files changed, 187 insertions(+), 85 deletions(-)
>  delete mode 100644 include/tracefs.h
> 
> diff --git a/include/tracefs.h b/include/tracefs.h
> deleted file mode 100644
> index d671f51adefc..000000000000
> --- a/include/tracefs.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -/*
> - * Oracle Linux DTrace; simple uprobe helper functions
> - * Copyright (c) 2022, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -#ifndef	_TRACEFS_H
> -#define	_TRACEFS_H
> -
> -#define TRACEFS		"/sys/kernel/debug/tracing/"
> -#define EVENTSFS	TRACEFS "events/"
> -
> -#endif /* _TRACEFS_H */
> diff --git a/libdtrace/dt_error.c b/libdtrace/dt_error.c
> index 213f0d9e1385..f6b41bf72b9f 100644
> --- a/libdtrace/dt_error.c
> +++ b/libdtrace/dt_error.c
> @@ -98,7 +98,8 @@ static const struct {
>  	{ EDT_READMAXSTACK, "Cannot read kernel param perf_event_max_stack" },
>  	{ EDT_TRACEMEM, "Missing or corrupt tracemem() record" },
>  	{ EDT_PCAP, "Missing or corrupt pcap() record" },
> -	{ EDT_PRINT, "Missing or corrupt print() record" }
> +	{ EDT_PRINT, "Missing or corrupt print() record" },
> +	{ EDT_TRACEFS_MNT, "Cannot find tracefs mount point" }

I think you could make the identifier a little shorter (EDT_TARCEFS would do),
and maybe the message can be "Cannot find tracefs"?  Especially since the code
that throws this error goes through all the mountpoints, so the issue is not
that the mount point cannot be found but rather that tracefs is not mounted.

>  };
>  
>  static const int _dt_nerr = sizeof(_dt_errlist) / sizeof(_dt_errlist[0]);
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 68fb8ec53c06..9d246cef2e7f 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -354,6 +354,8 @@ struct dtrace_hdl {
>  	char *dt_module_path;	/* pathname of kernel module root */
>  	dt_version_t dt_kernver;/* kernel version, used in the libpath */
>  	char *dt_dofstash_path;	/* Path to the DOF stash.  */
> +	char *dt_tracefs_path;	/* Path to tracefs.  */
> +	char *dt_tracefs_file;	/* See tracefs_file().  */

I don't think you need this _file member (see below).

>  	uid_t dt_useruid;	/* lowest non-system uid: set via -xuseruid */
>  	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
>  	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
> @@ -643,6 +645,7 @@ enum {
>  	EDT_TRACEMEM,		/* missing or corrupt tracemem() record */
>  	EDT_PCAP,		/* missing or corrupt pcap() record */
>  	EDT_PRINT,		/* missing or corrupt print() record */
> +	EDT_TRACEFS_MNT,	/* cannot find tracefs mount point */

EDT_TRACEFS, cannot find tracefs

>  };
>  
>  /*
> @@ -713,6 +716,7 @@ extern void dt_conf_init(dtrace_hdl_t *);
>  
>  extern int dt_gmatch(const char *, const char *);
>  extern char *dt_basename(char *);
> +extern const char *tracefs_file(dtrace_hdl_t *, const char *);

As mentioned below, I think it would make sense to change this to be:

	extern char *dt_tracefs_fn(dtrace_hdl_t *, const char *, ...);

so it can operate as a *printf() style function.

As mentioned below, I think adding a function here would improve things:

	extern int dt_tracefs_open(dtrace_hdl_t *, const char *, mode_t);

This will open the given file within tracefs and return the fd. 

>  extern ulong_t dt_popc(ulong_t);
>  extern ulong_t dt_popcb(const ulong_t *, ulong_t);
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index e1972aa821e7..e74b11244a35 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -1317,6 +1317,8 @@ dtrace_close(dtrace_hdl_t *dtp)
>  	free(dtp->dt_cpp_argv);
>  	free(dtp->dt_cpp_path);
>  	free(dtp->dt_ld_path);
> +	free(dtp->dt_tracefs_path);
> +	free(dtp->dt_tracefs_file);

Don't need _file.

>  	free(dtp->dt_sysslice);
>  	free(dtp->dt_dofstash_path);
>  
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 34b5d8e2467f..221a46bd50b8 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -23,8 +23,6 @@ static const char		funname[] = "";
>  
>  #define PROBE_FUNC_SUFFIX	"_probe"
>  
> -#define UPROBE_EVENTS		TRACEFS "uprobe_events"
> -
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_STABLE, DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -229,11 +227,12 @@ out:
>  static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  {
>  	if (!dt_tp_probe_has_info(prp)) {
> -		char	*spec;
> -		char	*fn;
> -		FILE	*f;
> -		size_t	len;
> -		int	fd, rc = -1;
> +		char		*spec;
> +		const char	*uprobe_events;
> +		char		*fn;
> +		FILE		*f;
> +		size_t		len;
> +		int		fd = -1, rc = -1;
>  
>  		/* get a uprobe specification for this probe */
>  		spec = uprobe_spec(getpid(), prp->desc->prb);
> @@ -241,7 +240,9 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* add a uprobe */
> -		fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
> +			fd = open(uprobe_events, O_WRONLY | O_APPEND);

		fd = dt_tracefs_open(dtp, "uprobe_events", O_WRONLY | O_APPEND);

> +
>  		if (fd != -1) {
>  			rc = dprintf(fd, "p:" GROUP_FMT "/%s %s\n",
>  				     GROUP_DATA, prp->desc->prb, spec);
> @@ -252,14 +253,18 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* open format file */

Replace from here...

> +
> +		if ((uprobe_events = tracefs_file(dtp, "events/")) == NULL)
> +			return -ENOENT;
> +
>  		len = snprintf(NULL, 0, "%s" GROUP_FMT "/%s/format",
> -			       EVENTSFS, GROUP_DATA, prp->desc->prb) + 1;
> +			       uprobe_events, GROUP_DATA, prp->desc->prb) + 1;
>  		fn = dt_alloc(dtp, len);
>  		if (fn == NULL)
>  			return -ENOENT;
>  
>  		snprintf(fn, len, "%s" GROUP_FMT "/%s/format",
> -			 EVENTSFS, GROUP_DATA, prp->desc->prb);
> +			 uprobe_events, GROUP_DATA, prp->desc->prb);

... to here with:

		fn = dt_tracefs_fn(dtp, "events/" GROUP_FMT "/%s/format",
				   GROUP_DATA, prp->desc->prb);
		if (fn == NULL)
			return -ENOENT;

And apply the same changes to the other providers.

> 
>  		f = fopen(fn, "r");
>  		dt_free(dtp, fn);
>  		if (f == NULL)
> @@ -289,14 +294,16 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   */
>  static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  {
> -	int		fd;
> +	int		fd = -1;
> +	const char	*uprobe_events;
>  
>  	if (!dt_tp_probe_has_info(prp))
>  		return;
>  
>  	dt_tp_probe_detach(dtp, prp);
>  
> -	fd = open(UPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
> +		fd = open(uprobe_events, O_WRONLY | O_APPEND);
>  	if (fd == -1)
>  		return;
>  
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 21f63ddffc73..7d81b0f3e87d 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -7,7 +7,7 @@
>   * The Function Boundary Tracing (FBT) provider for DTrace.
>   *
>   * FBT probes are exposed by the kernel as kprobes.  They are listed in the
> - * TRACEFS/available_filter_functions file.  Some kprobes are associated with
> + * tracefs available_filter_functions file.  Some kprobes are associated with

I would keep these comments as is because TRACEFS representing a static define
or being a symbol to represent that this component is not pre-defined is quite
equivalent.  CHanging it to "tracefs *" doesn't really make a difference.

Same in the other providers.

>   * a specific kernel module, while most are in the core kernel.
>   *
>   * Mapping from event name to DTrace probe name:
> @@ -43,8 +43,8 @@
>  static const char		prvname[] = "fbt";
>  static const char		modname[] = "vmlinux";
>  
> -#define KPROBE_EVENTS		TRACEFS "kprobe_events"
> -#define PROBE_LIST		TRACEFS "available_filter_functions"
> +#define KPROBE_EVENTS		"kprobe_events"
> +#define PROBE_LIST		"available_filter_functions"
>  
>  #define FBT_GROUP_FMT		GROUP_FMT "_%s"
>  #define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
> @@ -58,14 +58,15 @@ static const dtrace_pattr_t	pattr = {
>  };
>  
>  /*
> - * Scan the PROBE_LIST file and add entry and return probes for every function
> + * Scan the available_filter_functions file and add entry and return probes for every function
>   * that is listed.
>   */
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t		*prv;
>  	dt_provimpl_t		*impl;
> -	FILE			*f;
> +	const char		*probe_list;
> +	FILE			*f = NULL;
>  	char			*buf = NULL;
>  	char			*p;
>  	const char		*mod = modname;
> @@ -79,7 +80,8 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
> +		f = fopen(probe_list, "r");

You can use dt_tracefs_open() and fdopen() to get a stream.

>  	if (f == NULL)
>  		return 0;
>  
> @@ -363,16 +365,18 @@ static int kprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  {
>  	if (!dt_tp_probe_has_info(prp)) {
> -		char	*fn;
> -		FILE	*f;
> -		size_t	len;
> -		int	fd, rc = -1;
> +		const char	*kprobe_events;
> +		char		*fn;
> +		FILE		*f;
> +		size_t		len;
> +		int		fd = -1, rc = -1;
>  
>  		/*
>  		 * Register the kprobe with the tracing subsystem.  This will
>  		 * create a tracepoint event.
>  		 */
> -		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +		if ((kprobe_events = tracefs_file(dtp, KPROBE_EVENTS)) != NULL)
> +			fd = open(kprobe_events, O_WRONLY | O_APPEND);
>  		if (fd == -1)
>  			return -ENOENT;
>  
> @@ -384,13 +388,17 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* create format file name */
> +
> +		if ((kprobe_events = tracefs_file(dtp, "events/")) == NULL)
> +			return -ENOENT;
> +
>  		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
> -			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
> +			       kprobe_events, FBT_GROUP_DATA, prp->desc->fun) + 1;
>  		fn = dt_alloc(dtp, len);
>  		if (fn == NULL)
>  			return -ENOENT;
>  
> -		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
> +		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", kprobe_events,
>  			 FBT_GROUP_DATA, prp->desc->fun);
>  
>  		/* open format file */
> @@ -424,14 +432,16 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>   */
>  static void kprobe_detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
>  {
> -	int		fd;
> +	const char	*kprobe_events;
> +	int		fd = -1;
>  
>  	if (!dt_tp_probe_has_info(prp))
>  		return;
>  
>  	dt_tp_probe_detach(dtp, prp);
>  
> -	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
> +	if ((kprobe_events = tracefs_file(dtp, KPROBE_EVENTS)) != NULL)
> +		fd = open(kprobe_events, O_WRONLY | O_APPEND);
>  	if (fd == -1)
>  		return;
>  
> diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
> index 778a6f9cde90..6e495afef092 100644
> --- a/libdtrace/dt_prov_rawtp.c
> +++ b/libdtrace/dt_prov_rawtp.c
> @@ -8,7 +8,7 @@
>   *
>   * Raw tracepoints are exposed by the kernel tracing system to allow access to
>   * untranslated arguments to their associated tracepoint events.  Each
> - * tracepoint event listed in the TRACEFS/available_events file can be traced
> + * tracepoint event listed in the tracefs available_events file can be traced
>   * as a raw tracepoint using the BPF program type BPF_PROG_TYPE_RAW_TRACEPOINT.
>   *
>   * Mapping from event name to DTrace probe name:
> @@ -38,7 +38,7 @@
>  static const char		prvname[] = "rawtp";
>  static const char		modname[] = "vmlinux";
>  
> -#define PROBE_LIST		TRACEFS "available_events"
> +#define PROBE_LIST		"available_events"
>  
>  #define KPROBES			"kprobes"
>  #define SYSCALLS		"syscalls"
> @@ -64,7 +64,8 @@ static const dtrace_pattr_t	pattr = {
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t	*prv;
> -	FILE		*f;
> +	const char	*probe_list;
> +	FILE		*f = NULL;
>  	char		*buf = NULL;
>  	char		*p;
>  	size_t		n;
> @@ -73,7 +74,8 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
> +		f = fopen(probe_list, "r");
>  	if (f == NULL)
>  		return 0;
>  
> diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
> index 675e0458ca4c..717fd62f0c3a 100644
> --- a/libdtrace/dt_prov_sdt.c
> +++ b/libdtrace/dt_prov_sdt.c
> @@ -7,7 +7,7 @@
>   * The Statically Defined Tracepoint (SDT) provider for DTrace.
>   *
>   * SDT probes are exposed by the kernel as tracepoint events.  They are listed
> - * in the TRACEFS/available_events file.
> + * in the tracefs available_events file.
>   *
>   * Mapping from event name to DTrace probe name:
>   *
> @@ -36,7 +36,7 @@
>  static const char		prvname[] = "sdt";
>  static const char		modname[] = "vmlinux";
>  
> -#define PROBE_LIST		TRACEFS "available_events"
> +#define PROBE_LIST		"available_events"
>  
>  #define KPROBES			"kprobes"
>  #define SYSCALLS		"syscalls"
> @@ -62,7 +62,8 @@ static const dtrace_pattr_t	pattr = {
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t	*prv;
> -	FILE		*f;
> +	const char	*probe_list;
> +	FILE		*f = NULL;
>  	char		*buf = NULL;
>  	char		*p;
>  	size_t		n;
> @@ -71,7 +72,8 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
> +		f = fopen(probe_list, "r");
>  	if (f == NULL)
>  		return 0;
>  
> @@ -192,12 +194,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  			      int *argcp, dt_argdesc_t **argvp)
>  {
> +	const char			*eventsfs;
>  	FILE				*f;
>  	char				*fn;
>  	int				rc;
>  	const dtrace_probedesc_t	*pdp = prp->desc;
>  
> -	if (asprintf(&fn, EVENTSFS "%s/%s/format", pdp->mod, pdp->prb) == -1)
> +	if ((eventsfs = tracefs_file(dtp, "events")) == NULL)
> +		return -ENOENT;
> +
> +	if (asprintf(&fn, "%s/%s/%s/format", eventsfs, pdp->mod, pdp->prb) == -1)
>  		return dt_set_errno(dtp, EDT_NOMEM);
>  
>  	f = fopen(fn, "r");
> @@ -215,6 +221,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		      int *argcp, dt_argdesc_t **argvp)
>  {
>  #ifdef HAVE_LIBCTF
> +	const char		*eventsfs;
>  	int			rc, i;
>  	char			*str;
>  	ctf_dict_t		*ctfp;
> @@ -227,7 +234,11 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  	uint32_t		id;
>  
>  	/* Retrieve the event id. */
> -	if (asprintf(&str, EVENTSFS "%s/%s/id", prp->desc->mod, prp->desc->prb) == -1)
> +
> +	if ((eventsfs = tracefs_file(dtp, "events")) == NULL)
> +		return -1;			/* errno is set for us. */
> +
> +	if (asprintf(&str, "%s/%s/%s/id", eventsfs, prp->desc->mod, prp->desc->prb) == -1)
>  		return dt_set_errno(dtp, EDT_NOMEM);
>  
>  	f = fopen(str, "r");
> diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
> index 20843c6f538e..869e8e130c42 100644
> --- a/libdtrace/dt_prov_syscall.c
> +++ b/libdtrace/dt_prov_syscall.c
> @@ -38,7 +38,7 @@
>  static const char		prvname[] = "syscall";
>  static const char		modname[] = "vmlinux";
>  
> -#define SYSCALLSFS		EVENTSFS "syscalls/"
> +#define SYSCALLSFS		"events/syscalls/"
>  
>  /*
>   * We need to skip over an extra field: __syscall_nr.
> @@ -61,7 +61,7 @@ struct syscall_data {
>  
>  #define SCD_ARG(n)	offsetof(struct syscall_data, arg[n])
>  
> -#define PROBE_LIST	TRACEFS "available_events"
> +#define PROBE_LIST	"available_events"
>  
>  #define PROV_PREFIX	"syscalls:"
>  #define ENTRY_PREFIX	"sys_enter_"
> @@ -71,7 +71,8 @@ struct syscall_data {
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	dt_provider_t	*prv;
> -	FILE		*f;
> +	const char	*probe_list;
> +	FILE		*f = NULL;
>  	char		*buf = NULL;
>  	size_t		n;
>  
> @@ -79,7 +80,8 @@ static int populate(dtrace_hdl_t *dtp)
>  	if (prv == NULL)
>  		return -1;			/* errno already set */
>  
> -	f = fopen(PROBE_LIST, "r");
> +	if ((probe_list = tracefs_file(dtp, PROBE_LIST)) != NULL)
> +		f = fopen(probe_list, "r");
>  	if (f == NULL)
>  		return 0;
>  
> @@ -196,14 +198,18 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
>  		      int *argcp, dt_argdesc_t **argvp)
>  {
>  	FILE		*f;
> -	char		fn[256];
> +	const char	*syscallsfs;
> +	char		fn[PATH_MAX];
>  	int		rc;
>  
>  	/*
>  	 * We know that the probe name is either "entry" or "return", so we can
>  	 * just check the first character.
>  	 */
> -	strcpy(fn, SYSCALLSFS);
> +	if ((syscallsfs = tracefs_file(dtp, SYSCALLSFS)) == NULL)
> +		return -ENOENT;
> +
> +	strcpy(fn, syscallsfs);
>  	if (prp->desc->prb[0] == 'e')
>  		strcat(fn, "sys_enter_");

This and the following code in that function could benefit from simply using
dt_tracefs_fn() and doing a free on the returned string when done.

>  	else
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 205014617586..f8752eaa3843 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1116,13 +1116,14 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>   * uprobe may be a uretprobe.  Return the probe's name as
>   * a new dynamically-allocated string, or NULL on error.
>   */
> -static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> -			   uint64_t addr, int flags)
> +static char *uprobe_create(dtrace_hdl_t *dtp, dev_t dev, ino_t ino,
> +			   const char *mapping_fn, uint64_t addr, int flags)
>  {
> -	int	fd = -1;
> -	int	rc = -1;
> -	char	*name;
> -	char	*spec;
> +	const char	*uprobe_events;
> +	int		fd = -1;
> +	int		rc = -1;
> +	char		*name;
> +	char		*spec;
>  
>  	if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
>  		return NULL;
> @@ -1132,7 +1133,8 @@ static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
>  		goto out;
>  
>  	/* Add the uprobe. */
> -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> +	if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
> +		fd = open(uprobe_events, O_WRONLY | O_APPEND);
>  	if (fd == -1)
>  		goto out;
>  
> @@ -1153,8 +1155,8 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  {
>  	dt_uprobe_t	*upp = uprp->prv_data;
>  	tp_probe_t	*tpp = upp->tp;
> -	FILE		*f;
> -	char		*fn;
> +	const char	*eventsfs;
> +	FILE		*f = NULL;
>  	char		*prb = NULL;
>  	int		rc = -1;
>  
> @@ -1163,7 +1165,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  
>  	assert(upp->fn != NULL);
>  
> -	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
> +	prb = uprobe_create(dtp, upp->dev, upp->inum, upp->fn, upp->off,
>  			    upp->flags);
>  
>  	/*
> @@ -1177,12 +1179,16 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  				  upp->flags);
>  
>  	/* open format file */
> -	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
> -	free(prb);
> -	if (rc < 0)
> -		return -ENOENT;
> -	f = fopen(fn, "r");
> -	free(fn);
> +	if ((eventsfs = tracefs_file(dtp, "events")) != NULL) {
> +		char	*fn;
> +
> +		rc = asprintf(&fn, "%s/%s/format", eventsfs, prb);
> +		free(prb);
> +		if (rc < 0)
> +			return -ENOENT;
> +		f = fopen(fn, "r");
> +		free(fn);
> +	}
>  	if (f == NULL)
>  		return -ENOENT;
>  
> @@ -1251,17 +1257,19 @@ done:
>   * Destroy a uprobe for a given device and address.
>   */
>  static int
> -uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
> +uprobe_delete(dtrace_hdl_t *dtp, dev_t dev, ino_t ino, uint64_t addr, int flags)
>  {
> -	int	fd = -1;
> -	int	rc = -1;
> -	char	*name;
> +	const char	*uprobe_events;
> +	int		fd = -1;
> +	int		rc = -1;
> +	char		*name;
>  
>  	name = uprobe_name(dev, ino, addr, flags);
>  	if (!name)
>  		goto out;
>  
> -	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
> +	if ((uprobe_events = tracefs_file(dtp, "uprobe_events")) != NULL)
> +		fd = open(uprobe_events, O_WRONLY | O_APPEND);
>  	if (fd == -1)
>  		goto out;
>  
> @@ -1297,7 +1305,7 @@ static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>  
>  	dt_tp_detach(dtp, tpp);
>  
> -	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
> +	uprobe_delete(dtp, upp->dev, upp->inum, upp->off, upp->flags);
>  }
>  
>  /*
> diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
> index 8f143dceaed7..4598a380b950 100644
> --- a/libdtrace/dt_provider.h
> +++ b/libdtrace/dt_provider.h
> @@ -12,7 +12,6 @@
>  #include <dt_impl.h>
>  #include <dt_ident.h>
>  #include <dt_list.h>
> -#include <tracefs.h>
>  
>  #ifdef	__cplusplus
>  extern "C" {
> diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
> index d5dca164861e..6ec03b503a66 100644
> --- a/libdtrace/dt_subr.c
> +++ b/libdtrace/dt_subr.c
> @@ -20,6 +20,7 @@
>  #include <assert.h>
>  #include <limits.h>
>  #include <sys/ioctl.h>
> +#include <mntent.h>
>  #include <port.h>
>  
>  #include <dt_impl.h>
> @@ -998,3 +999,54 @@ uint32_t dt_gen_hval(const char *p, uint32_t hval, size_t len)
>  
>  	return hval;
>  }
> +
> +/*
> + * Find the tracefs and store it away in dtp.
> + */
> +static int
> +find_tracefs_path(dtrace_hdl_t *dtp)
> +{
> +	FILE *mounts;
> +	struct mntent *mnt;
> +
> +	if ((mounts = setmntent("/proc/mounts", "r")) == NULL) {
> +		dt_dprintf("Cannot open /proc/mounts: %s\n", strerror(errno));
> +		return dt_set_errno(dtp, EDT_TRACEFS_MNT);
> +	}
> +
> +	while ((mnt = getmntent(mounts)) != NULL) {
> +		if (strcmp(mnt->mnt_type, "tracefs") == 0) {
> +			dtp->dt_tracefs_path = strdup(mnt->mnt_dir);
> +			break;
> +		}
> +	}
> +	endmntent(mounts);
> +
> +	if (!dtp->dt_tracefs_path)
> +		return dt_set_errno(dtp, EDT_TRACEFS_MNT);
> +
> +	dt_dprintf("Found tracefs at %s\n", dtp->dt_tracefs_path);
> +
> +	return 0;
> +}
> +
> +/*
> + * Return the path to a tracefs file.  (Statically allocated,
> + * discarded on reuse.)
> + */
> +const char *
> +tracefs_file(dtrace_hdl_t *dtp, const char *fn)

char *
dt_tracefs_fn(dtrace_hdl_t *dtp, const char *fmt, ...)

> +{
> +	free(dtp->dt_tracefs_file);
> +
> +	if (!dtp->dt_tracefs_path)
> +		if (find_tracefs_path(dtp) < 0)
> +			return NULL;		/* errno is set for us. */
> +
> +	if (asprintf(&dtp->dt_tracefs_file, "%s/%s", dtp->dt_tracefs_path, fn) < 0) {
> +		dtp->dt_tracefs_file = NULL;
> +		dt_set_errno(dtp, EDT_NOMEM);
> +		return NULL;
> +	}
> +	return dtp->dt_tracefs_file;
> +}

Make this a function that takes a format string and optional arguments, and
then uses vasprintf() to create the resulting string.  Callers can free the
string (hardly an issue).

Add a function dt_tracefs_open(dtrace_hdl_t *dtp, const char *fn, mode_t mode)
to open the given file under tracefs, returning the fd.  Returns -1 (after
settinng errno) if the open fails for some reason.

> diff --git a/test/unittest/funcs/tst.rw_.x b/test/unittest/funcs/tst.rw_.x
> index 29c581116154..7e178778d900 100755
> --- a/test/unittest/funcs/tst.rw_.x
> +++ b/test/unittest/funcs/tst.rw_.x
> @@ -1,6 +1,11 @@
>  #!/bin/sh
>  
> -FUNCS=/sys/kernel/debug/tracing/available_filter_functions
> +TRACEFS=/sys/kernel/tracing
> +if [[ ! -e $TRACEFS/available_filter_functions ]]; then
> +	TRACEFS=/sys/kernel/debug/tracing
> +fi
> +
> +FUNCS=${TRACEFS}/available_filter_functions

How about having runtest.sh determine the location (not just checking two
possible places - look at the mount table), and export it as TRACEFS?  That
way tests (incl. future tests) can depend on that.

>  
>  if ! grep -qw  _raw_read_lock $FUNCS; then
>          echo no _raw_read_lock FBT probe due to kernel config
> diff --git a/test/unittest/providers/tst.dtrace_cleanup.sh b/test/unittest/providers/tst.dtrace_cleanup.sh
> index 4ac59ccb4315..08b47a057783 100755
> --- a/test/unittest/providers/tst.dtrace_cleanup.sh
> +++ b/test/unittest/providers/tst.dtrace_cleanup.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2020, 2022, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -14,7 +14,12 @@
>  ##
>  
>  dtrace=$1
> -UPROBE_EVENTS=/sys/kernel/debug/tracing/uprobe_events
> +TRACEFS=/sys/kernel/tracing
> +if [[ ! -e $TRACEFS/uprobe_events ]]; then
> +	TRACEFS=/sys/kernel/debug/tracing
> +fi
> +
> +UPROBE_EVENTS=${TRACEFS}/uprobe_events

Same as above... if runtest.sh does the work and exports it, this can use it.

>  
>  out=/tmp/output.$$
>  $dtrace $dt_flags -n BEGIN,END &>> $out &
> diff --git a/test/utils/clean_probes.sh b/test/utils/clean_probes.sh
> index 8292b3096424..16e98b29b275 100755
> --- a/test/utils/clean_probes.sh
> +++ b/test/utils/clean_probes.sh
> @@ -1,6 +1,10 @@
>  #!/usr/bin/bash
>  
> -TRACEFS=/sys/kernel/debug/tracing
> +TRACEFS=/sys/kernel/tracing
> +if [[ ! -e $TRACEFS/available_events ]]; then
> +	TRACEFS=/sys/kernel/debug/tracing
> +fi

Same.

> +
>  EVENTS=${TRACEFS}/available_events
>  KPROBES=${TRACEFS}/kprobe_events
>  UPROBES=${TRACEFS}/uprobe_events
> -- 
> 2.46.0.278.g36e3a12567
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
