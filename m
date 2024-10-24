Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471DA1B85DB
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769919; cv=fail; b=qi52/oys48CCBz09s+h52c4SH+ursOjQTMdpbc1zdTqTNIMCZTsFjPP5SfiA1cYhrRhSCzdtwYZGVNPYEG7/XKRF6pFIBuY8woUbIAWeqiI4Mu7qlC36CdHaBERPQIhtRjTsTPPrWafHTkttHz3VtJvmNG3DDitA3jHDuyXt1nY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769919; c=relaxed/simple;
	bh=1ygaBgd87Nu58lmkKtRrUSzpXdYXorQN7QVodj2oS+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gFINar7wZEcr6hYvblLjM5h0i+y7ElRHXT3VFOQ4YJvmJivq3unBsdF5LNxoWhWetBlkiJI4wJE1l+84GQ+ZPU7kTTxrL3dd62+KiO6NYOam42AAcxsJg1tEdkB1JjGWcpixVnhaKvWTdOnPQiz38IIz+3IirDq8qk78FpMQPWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eHvzthcL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=a284jd0Z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eHvzthcL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="a284jd0Z"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2g3Ei012663;
	Thu, 24 Oct 2024 11:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=D8nPCDtALcdzjSg5br8eo1verjvEKcKMWWvz8fWBhhk=; b=
	eHvzthcLk8pl14XXo29KnIOVe510v8qyesocR1e9gYdbJgv+2aXYZ4/cTKDbRI9x
	UPgGLqQqESgLDYf3iFoOaZOVVf2jV1TPTIfL50dQeJJDap7sYRFXmAZZMYGEMs3H
	QP8sOWSHS2GwCtKQGDF1H8B+voVxus+xp6UpSOKAovOVXRV9Zv5PsxPHZ+PIPncq
	243scnP1tT65P5GB7LACw7IJulAvHEHbUVa6fjA8zQHQ3hdTEfI2fDw5dLxot4g7
	+g8IHc/qBPOTYpzPRJgKpLmVj1I8oJjQHbf8WB6E7samvYHzNkC1rtd+kutCg6S0
	h9Au3xRPxVandUKQu21fgw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53utb9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAUPNg027356;
	Thu, 24 Oct 2024 11:38:28 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh45ych-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBzVxnS4vsQBSrrI0TUaF06kQYdXR32tOm20BuzOcY6gXeBCrKq8+qK77tSZ6QguRdQLXgNMZc9CtkghhTJsbt/cgBZ/dojAx8acc4dH3yjyvZnEFA8ZCsWYNmiYKyJ1TH42msmjSypCoDcmbw4o4kaFQjYjrMSrANKi4fRRHmPuuZaF5HLZQkwgkuNMueVyUAF/kdOS32coCsIAccXBcdbj1CD3FVWvXd2mo3mxfFZg6Wrua54YKMJi3It5SBWTvR0E83FOBc2R9tu8gOmXD7ZuEVDEyBceS0RnxsuXE4sYDXSlfPxqP8Zm2L6HKRulLXztthxikf6NMXMmyAr+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8nPCDtALcdzjSg5br8eo1verjvEKcKMWWvz8fWBhhk=;
 b=Yinp/zwCvy8L3z81vTHPLiy7YsxkPwimPLiFuZY/NMRoNpWdmcOodOfyeHtHju2U+5Gps5xVNHAA5Iy+F2TAbaA1SDnlWQRNkh94BmWRmiFh2nl9h3v90CtPrOgzbqdGbHmSKrSMF6HUO+6opDVF6fUROOGynG2tAtFqjcl4wuw+v42xp725n1XYSXa4HCzumUS1QR9u/q9Y3Gt8929jmFTjbecTVP4okAy/NGsJu4xXAeRKSwyFYTOXjF4nO6ef6pImHlXwuurIlLTr0nvw5MOG48HE0vqRW+Gy73kLN2zRV05g7VBZ3a7pHX7L2lNAbIilePrEIAUQw2B4L4BoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8nPCDtALcdzjSg5br8eo1verjvEKcKMWWvz8fWBhhk=;
 b=a284jd0Z3Nf75L3++4gYvyMQ5lbEt3W0z0Uf2UrGgS9L0BbW3x4voLAQMDtsbp6gRchja1ee3RtwpWwroL4FdVzouQo8tXJ0i6y2ZPpjOzRyGnXrUHr/Ftc8An87u1BZ8mmAtbKRamK+/JTxk3ddYaK/81TCXxfvqISB8iddrUI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:07 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:07 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 03/14] configure, build: make valgrind optional
Date: Thu, 24 Oct 2024 12:37:47 +0100
Message-ID: <20241024113758.182050-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0588.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f56672c-a63a-4bdc-a4ef-08dcf42054a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lxWb5jr6T4eGmseUfxnE4A8UxbvExcoHpFev0rKROv6uBKqldLVs1TiiJaN9?=
 =?us-ascii?Q?0Dii0d3yEbJnSEGI3aMz0KYoU8qwBryl4e8Pe0keVEAOH+3ErjpbtKPc2Pb0?=
 =?us-ascii?Q?i7viaazaO41acZERdubqHX5sSqyGC7cVr0KoXqWc7VHkk4k/h3idhq8AtkFW?=
 =?us-ascii?Q?1wqKIKhuK4fo7MAl4vp990XfznStnzovfyYX1yX/1S6tQdytwXo8WWk5tB/s?=
 =?us-ascii?Q?pEIEFYdNcEDFkrbVNIPTgR0IUb7Zq7w9sL9cccYjpRUnFGfF+RfYMm2tYs9P?=
 =?us-ascii?Q?BUa0oHIHRrF+UofTvMlSRKoJwpbBlxlYUIS6/Q6spJqtscmlMDvZu4yc+3x6?=
 =?us-ascii?Q?+62FeBxx0fcb80DEGMvhkYW/8IOHkZD65A8s8gRjTex79EFB3vyG4zhDRx2R?=
 =?us-ascii?Q?dVTfRKnKxm4sAp6pGhnthhF/yrj6qvICPkgooTZNgtZ8gbflOl7h2aw/qfUG?=
 =?us-ascii?Q?ldh6QxlH7L3/SnyRGogBf7TTdslz0nUf7EWJeGmwbcbbES3n0yRvmTcyuFxx?=
 =?us-ascii?Q?Yh4L4HG7e9707vcTPCqBUxSjTwMbpgflO/r/raidLpBV+VbbNxJy2mpCv/kR?=
 =?us-ascii?Q?OgfW0LWWUrHnvwTC7bIfwimv6IWMbRJmttSgf7Io1TA0dOAsSuvWFwVQJbZX?=
 =?us-ascii?Q?O7k2vQj8TfDre5UcU73soRNfBZYrmM2y/3/Zefki0igcVtoeEF6dG02ts5Tr?=
 =?us-ascii?Q?Pka+a7VvdqzKkElontR6/7uVNhXGclqptzT+qMuqFAUKRKP6rVSwa4NKQPrn?=
 =?us-ascii?Q?0lqlP7yLTkBPhFoOo4kfhHafP1Ac63hr/bgFVWYSeoV0bfnDPhCSkVnfOi4l?=
 =?us-ascii?Q?u2dMqO92+bLIpSNLGGgQ9I9B9TjoWbCHAWtvENriSPGo5ioZHzpeTLmAQTrS?=
 =?us-ascii?Q?s+sP2b4Oh+P245caqVcH94azzumH31Z8V0QAck3J5oX7cNIqR0bWxKkQS6vC?=
 =?us-ascii?Q?QlOAUokXfEDrLGGBLOMiZMRIScOTijX146/zHe87k1orAplnNjLipkDC5m0O?=
 =?us-ascii?Q?MXOPfEMCOFIgZ1m30KjiVtWWfwV7H8lbs9MZYAXrmwVxUOBoUXqAnCgRls7M?=
 =?us-ascii?Q?RAgtM3tCg66SEKN6PqWcy9EIc9RMygvp49tzSbFCPkF3pnhO0xexz9M5gcAK?=
 =?us-ascii?Q?3eKXHJajgb/NdSCMOhLlU0QyXuZMLubNprL5D+fvsp24TpOH3g2sWJntv+MP?=
 =?us-ascii?Q?iqmm8zE8u0SpUUY7uPbnMbpmFdRTrA5EPFut0M2p4fDanBHYyzYMWiLrU5tn?=
 =?us-ascii?Q?uEvhtojp03psCd4CNNDU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M7SWcm2H4VGRdv56zdIKmFI1AsgqkGLjnQIvAU/ZPA4uq8pXhgbrnFElyIKz?=
 =?us-ascii?Q?A0tobsOSy7FoFzVDMp5tqIoLBtOLuEG37hK2fwOnF9fWQ1/e0yFOeceyER+E?=
 =?us-ascii?Q?fCXJiOHlfLfd/vrRbJoMT25FDjWCnNfACjFCQIlqEh0MWzM4oyK3XVFMX590?=
 =?us-ascii?Q?92Z7KlKbEA2m5Z5ATNTk5srJKjIZzZPgGgaE/v0Rrwga4ndaM9JFccn1fEQ1?=
 =?us-ascii?Q?toQKeNZX6inS/0AutJzBtC0RGrIloqgee/kQP0K7JgEkOv0p8YcaL8IStnJK?=
 =?us-ascii?Q?aQ0lGmdFEwXbN/bjAI8NGi4dcwa+Ukjaevw93bL9VgXZlbnOCZT47MJzd7yl?=
 =?us-ascii?Q?ToIdIgF2mM6VjXGwpxTKPUmwFyId0xobhTlZ3ptU3mi/DzLk78SC9boxHAhK?=
 =?us-ascii?Q?WbpDRiHb2FcDyeya8J3nDaGLO9iWhXoKTK+EOKopx2bCmZZ2fUZxcC2LLpES?=
 =?us-ascii?Q?jYR/XjE4jdp9CtyvYKxjrExkORt/ul5v5SSEETWR/Joi/SHwWxLwk4Ml3MTO?=
 =?us-ascii?Q?+ifFLG20QXj/GYXgpeMZB//IHCx2GMm4FaCDinX+Fnj6DVcVwq4aMLTN/TFt?=
 =?us-ascii?Q?kPOWZvF9BIMJ93P4dNkM1IPJ1Sq+hPxNJgfdLWE/DIrs0XPrAWzPcfYFFjZn?=
 =?us-ascii?Q?26hH+lkQiJ9u2gpUOItWV1yAOMiSXNzz/CQRwq2nE8K3IPm/USaYZZKHfQQw?=
 =?us-ascii?Q?2h7PbUEvrMXkzZZwL4HR+H5n43k1U2CTolYQCrexc1maPYYEEm4SorLLPAhF?=
 =?us-ascii?Q?sFSwJkSGNM557sLymgc7ZtuugRd1UrOc2MVZpV4qjk8r//mwlNueDkMBuy85?=
 =?us-ascii?Q?6/Eys66ueN3oFDNN0xaUVj844wNuyXjnwmcyIYCf6JAOMfmc/+HmC9S0sf0M?=
 =?us-ascii?Q?QCRgOloWxz2MtrKIm/9XJ7Z2ignB1d4nhDsdqsn3/GznPPi5U9GWKIoOqkpV?=
 =?us-ascii?Q?COGH5dZ9bfALCKF+pAIfP0klfkgrrGQjagf9lX2FVuYekBETaZ9kTyBh9CNF?=
 =?us-ascii?Q?QFW9z2S0CLjbqrcBRZMzRvpTYpzkv/kcN7WJ/ow5XzUTQxrI9SbR54HOCi3q?=
 =?us-ascii?Q?P3/ZB/Jk0vW5E63L6RQ73ptt009jEDIwtqf+1Bs1ZtdCNOTsfEzeiqKHjvkI?=
 =?us-ascii?Q?xvVgWAhFsxioyBvWAMeImZy98JsmMoGteEztg2rYIDo1MDqP1la2rjvEg0vY?=
 =?us-ascii?Q?EdtSQustg/TRFkbHiBQiPrGNm1L+Ds/E5/8965dH7gslGd+3oB1wXweuaYoq?=
 =?us-ascii?Q?b7okHwrgrWi6yqMPQGqn1VTajsZUmhBJiLBPE1cHaI6rWzRhrSNoETyKELI+?=
 =?us-ascii?Q?L2h0ugufLRrPlY/+SOAaVOpxwbMCIzt8Jjpp4EFl8i5/EHzqUhqRRIE8VPdI?=
 =?us-ascii?Q?gTujd5rL14rF9xVR962ZW+QVDpX4IqIBCW94CpZOtSbXXzCNQ3eSBabN+c3T?=
 =?us-ascii?Q?+d6AUe29qHuNa+CDLE9urw4uGXdBwNUCY6Dv3LS0gtGdVP3ZhJpTnHFhi85i?=
 =?us-ascii?Q?ku3PhFoPHv9M+Xa9M7/HMmGY8gRpOhaHTiBO5GNvFHEzIy/6guWhJLoy7PfC?=
 =?us-ascii?Q?e0KYs1b+kttTG68c8AQ0AhqZzG2ORhGOKhkKQbo9bggt/EBjmpp8gwxOECpl?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K7cy+fVeFbFnAbEbIrmYblrj9h65ItLT5JagFwTcJKkOzZ8K2qSZRgfuAR7tyFlxuZvKzc3zijMBnbzRTYuG1sswrLdEjVpuysQ9f0ASOHECAcm0wN0CwHOrSaobeLdYZDL9Hsm+QKkrDVIcbEfma7OOXHC+MgeEcCeU3dHMRbC/UOQ0l+Z0GA2xFTpARXFCXcL8XP19U26uz83Arj+IzBtvZm96wGrtoapb/YtTqaS0UL8Szvg8z6sfp9EDzYa1Z4tZ64bHBvFAuRq/QPVlzQlSDKTrOWVTF+A0Ks9tpGR0+fyAnDj+D662ESgyhNCcTzojFmerHXHxsWE3n3ELTrcCSFkb6EZWa3mrzjM4FlrXCtzIMDvit83e+QR4X6XeB/W9vpuQ+fbzoaBTJ77atjpzQ6WGO/Wrm/97lCcC47Ek5q8dVncnueBvd6Z7RY1hGyBE+WLedblnwTikU2SpeLEy/9axkoGirNLyhUlgFiNIny7Jef7oEGuFHxPFQzPR8fbYYpyTpTdNgYS+Ehb3BGtmTIN6fKArYvdhqnMWvhr09TkGS7IEVUBuy0Tksxzazr6wYvbJ0Rah/2DGILJwQvWlZ7s5Kow98xmIfedfco4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f56672c-a63a-4bdc-a4ef-08dcf42054a1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:07.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AD3/yc9QfMmBtKXlaWIz6HfSjHkEzdo9VKntaKuvlKWc1xx3HOj/o8wDZpx/QkH+Q0l3kOgHDOghru3HXwV2HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: A9x0rXvtucO06Z3h2RRIjQsL__duqJzD
X-Proofpoint-ORIG-GUID: A9x0rXvtucO06Z3h2RRIjQsL__duqJzD

We fail building if <valgrind/valgrind.h> is not available, which is
ridiculous given that the only reason we need it is to make valgrind go away
at suitable moments to let us drop uprobes.

A suitable new configure check (using a new check-header-macro-rule
function) lets us check for <valgrind/valgrind.h> and disable it if not
present: as usual, defining HAVE_VALGRIND or passing it to configure will
also suffice to override the check (though since the code this enables
doesn't require any part of valgrind at runtime, I don't see why one would
ever need to do so).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Bug: https://github.com/oracle/dtrace-utils/issues/80
---
 Makeconfig          | 36 ++++++++++++++++++++++++++++++++++++
 configure           |  1 +
 libdtrace/dt_work.c | 18 +++++++++++++++---
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/Makeconfig b/Makeconfig
index 346078598624..752bd79b01fc 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -163,6 +163,41 @@ $(CONFIG_H): $(objdir)/.config/config.$(1).h
 $(CONFIG_MK): $(objdir)/.config/config.$(1).mk
 endef
 
+# Generate a makefile rule to check for the presence of MACRO
+# in HEADER and emit an appropriate header file fragment into a file
+# under $(objdir)/.config.
+#
+# The first argument must be suitable for a filename fragment,
+# for a makefile rule name and for a #define.
+#
+# Syntax: $(call check-header-macro-rule,name,macro,header)
+define check-header-macro-rule
+$(objdir)/.config/config.$(1).h $(objdir)/.config/config.$(1).mk: $(objdir)/.config/.dir.stamp
+	case x$(HAVE_$(1)) in \
+	xyes) echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
+	     echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk;; \
+	xno) echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
+	     echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk;; \
+	*) if printf '#include <%s.h>\n#ifndef %s\n#error %s not found.\n#endif' "$(3)" "$(2)" "$(2)" | \
+	       $(CC) $(filter-out --coverage,$(CFLAGS) $(LDFLAGS)) -Iinclude -D_GNU_SOURCE -Werror=implicit-function-declaration -c -o /dev/null -x c - >/dev/null 2>&1; then \
+	       echo '#define HAVE_$(1) 1' > $(objdir)/.config/config.$(1).h; \
+	       echo 'HAVE_$(1)=y' > $(objdir)/.config/config.$(1).mk; \
+	   else \
+	       echo '/* #undef HAVE_$(1) */' > $(objdir)/.config/config.$(1).h; \
+	       echo '# HAVE_$(1) undefined' > $(objdir)/.config/config.$(1).mk; \
+	   fi;; \
+	*) echo "HAVE_$(1) must be yes or no, not $(HAVE_$(1))" >&2; \
+	   false;; \
+	esac
+	rm -f $(CONFIG_H)
+	rm -f $(CONFIG_MK)
+
+$(eval $(call make-override-help,HAVE_$(1), presence of preprocessor macro $(2) in $(3).h))
+
+$(CONFIG_H): $(objdir)/.config/config.$(1).h
+$(CONFIG_MK): $(objdir)/.config/config.$(1).mk
+endef
+
 # Generate a makefile rule to check for support for OPTION in BPFC and emit an
 # appropriate header file fragment into a file under $(objdir)/.config.
 #
@@ -229,6 +264,7 @@ $(eval $(call check-header-rule,DIS1,disassembler(NULL),disasm))
 $(eval $(call check-header-rule,DIS4,disassembler(0,0,0,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO3,init_disassemble_info(NULL,NULL,NULL),disasm))
 $(eval $(call check-header-rule,INITDISINFO4,init_disassemble_info(NULL,NULL,NULL,NULL),disasm))
+$(eval $(call check-header-macro-rule,VALGRIND,VALGRIND_NON_SIMD_CALL0,valgrind/valgrind))
 $(eval $(call check-bpfc-option-rule,BPFV3,-mcpu=v3))
 $(eval $(call check-bpfc-option-rule,BPFMASM,-masm=normal))
 
diff --git a/configure b/configure
index 42e496b97a7d..0c9fb309c494 100755
--- a/configure
+++ b/configure
@@ -169,6 +169,7 @@ for option in "$@"; do
         HAVE_FUSE_NUMA=*) write_config_var FUSE_NUMA "$option";;
         HAVE_CLOSE_RANGE=*) write_config_var CLOSE_RANGE "$option";;
         HAVE_GETTID=*) write_config_var GETTID "$option";;
+        HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
 	*) echo "Unknown option $option" >&2
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 11335345a6d7..c6de15414481 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -13,7 +13,9 @@
 #include <port.h>
 #include <linux/perf_event.h>
 #include <sys/epoll.h>
+#ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
+#endif
 #include <dt_impl.h>
 #include <dt_aggregate.h>
 #include <dt_peb.h>
@@ -187,9 +189,11 @@ beginend_child(void *arg) {
 	read(args->tochild[0], &cmd, sizeof(cmd));
 	if (cmd != CMD_BEGIN)
 		exit(1);
-	if (RUNNING_ON_VALGRIND)
+#ifdef HAVE_VALGRIND
+        if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
 	else
+#endif
 		BEGIN_probe();
 	cmd++;
 	write(args->frchild[1], &cmd, sizeof(cmd));
@@ -198,9 +202,11 @@ beginend_child(void *arg) {
 	read(args->tochild[0], &cmd, sizeof(cmd));
 	if (cmd != CMD_END)
 		exit(1);
+#ifdef HAVE_VALGRIND
 	if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(END_probe);
 	else
+#endif
 		END_probe();
 	cmd++;
 	write(args->frchild[1], &cmd, sizeof(cmd));
@@ -300,9 +306,12 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
 		}
 		if (cmd != CMD_BEGIN + 1)
 			return -1;
-	} else if (RUNNING_ON_VALGRIND)
+	}
+#ifdef HAVE_VALGRIND
+	else if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(BEGIN_probe);
 	else
+#endif
 		BEGIN_probe();
 
 	dtp->dt_active = 1;
@@ -344,9 +353,12 @@ dtrace_stop(dtrace_hdl_t *dtp)
 			return -1;
 		pthread_join(args->thr, NULL);
 		dt_free(dtp, args);
-	} else if (RUNNING_ON_VALGRIND)
+	}
+#ifdef HAVE_VALGRIND
+	else if (RUNNING_ON_VALGRIND)
 		VALGRIND_NON_SIMD_CALL0(END_probe);
 	else
+#endif
 		END_probe();
 
 	dtp->dt_stopped = 1;
-- 
2.46.0.278.g36e3a12567

