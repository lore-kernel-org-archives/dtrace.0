Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A418CC1B
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838079; cv=fail; b=i2OrVIDcIVIQcg1gJRzZFAl7sMemmmnXo4Sp2OcGfvSYhk9q43B8LXMDJ6s28EyvTbiKJfQvggkP/0KVDxW49YtgmNNEkNula8bnz7SzN+yt87dG3uEnRGSZNRoXmTDRTvwSjh2QTBQbe6Av9/FS+qHvaqV5L/KrcL+ZUIEcDes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838079; c=relaxed/simple;
	bh=SC/SJ8zTaSCLvEouQjRAoCuhyki8tnvhovSHLVHSrME=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jA2R8kUi7+auORBBQekIIHCrkeX9jOMoBHBR8XP3Sp3RtvuQGhQQvzpqEdIRWqTM7VOSHi2iBgZwaT+smI9Qx8DDL/gy9a1dTwz9QEQPFFkZDpZnJhCnyrsTSh2gbOG1IhbmQrmlsgt7PYLibCetcajoijd3UzzyJo1GjPDAsC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CdKDT9aP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QQ9/k5Dp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CdKDT9aP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QQ9/k5Dp"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fgBE030112
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Wfi3iPo5vKMfvZmm4V
	e8YnijZlP7/7r/33UF2r7hJbA=; b=CdKDT9aPdF9qZCpss3qfbOnQofOkgCTbTl
	N5jm4a9GtTuAIJ5E+J5UnNQWBa0L79AyaEBZe+li1+/qw6cYMWbxcUuau76RJbFL
	XEFjR2Z/dR5I/qY9kd4O0/AYvQ1l8EyN6P4TccpkkEShu0KBA72EdhRdC87lA3zi
	jNMYXFtzN+YfbCyWxvftvem/zlT6tzm0Y+jBqnSjYeUcOP1xFqIOGv24tX+rSKtj
	99/R5r3j2sVOm/yZP0cGSCgpDXAZcNJoTabpSLEoV1nPfX4f48LZ+olszx90Qp8Y
	eEjAQ2yOi1HUzsx4YE8j2Xzj8D9ViND67qWkjIdpThOKBOav5dqw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uv8yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P4rtOs027393
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh5byjy-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 06:34:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXCvx37ce3KaYXD5vEbfFaplxtUEyL17pkh2Qz/zvImKCZUV6iS9ybmDkE6ppUX/bsBjy1yMFg4kFmbVarwk3Oxq7jEwLmrOsx05OiDG8OkCE4ON2w9tT9DVbfun5ucW+gFE598j6VZGxZW3SMeKOt/1HSjp9IZVOBejKQE6wWisO371/AGiEXv+dSjiUO1rXN7BxFKNFkOCY5bkDW/042FhWZIuAVQWx+FMIfOYgm7fbfDyzoDC2nPo/P4y+JTe/UW0p7snC8jy0rFb8jlAJ1peW/qnWyebmxGjx/j6QY8up7+re8AslfTOrGOkz3mnLjKzC7mebyPPa0tcaoCwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wfi3iPo5vKMfvZmm4Ve8YnijZlP7/7r/33UF2r7hJbA=;
 b=V/45yqfQr4dMZUit3YHKcUbDQ0yf/ShTW/5aelDsQt7Cgu9IHLtEaPnpwA462f57xAZRUI6nQkpBXkZCbkV6JDysVDWgeQ3L/ajaILsLW+Wf1U/tTyu8Szs9HV0RknDGYLXaLsPAPAysDDMHUubGdve57IDCktJZ2IHjBg1WTO0oPb4b0LkLvAYHzxCj2dlX5dyLIkD1kMWcaIYL6UK2uQQnbZnjcYsNlwQ0WPXh05et2OvO8nauQU98HkpIvvEcDcQPoEqpG8ZXPsAQIR+AVBsLi3xM9fl2XRxx3eQAZ3+CNcieFaOh7NPayZ4PvEQ3mWdbrdKBCTlRHtVjmyW4cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wfi3iPo5vKMfvZmm4Ve8YnijZlP7/7r/33UF2r7hJbA=;
 b=QQ9/k5Dp1kLLM/Otxbd5SMPBZDMQ1qpFn3IPvM3JouxAhC+5HYOYfBOVIffd/OG9dr3oHmI9qLZAVVs92RdjO7fI2XHZQ3wK3/ZkkP5YUGzO60FuPUNtr0GReE2lfErKxe92eZvB3NZS4tCE/S3APQFaq8QXPBgMEz4DhBgc5Rk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6532.namprd10.prod.outlook.com (2603:10b6:510:203::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Fri, 25 Oct
 2024 06:34:32 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 06:34:32 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 15/19] Ignore clauses: some clauses are impossible regardless of uprp
Date: Fri, 25 Oct 2024 02:34:23 -0400
Message-Id: <20241025063423.20479-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241025063423.20479-1-eugene.loh@oracle.com>
References: <20241025063423.20479-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN8PR15CA0070.namprd15.prod.outlook.com
 (2603:10b6:408:80::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: bd018873-7ed8-4264-9587-08dcf4bf15d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k00yzoLDdcgnkkl2pUn3WQIZPkPCUxAkmcoec/7r1FKnaVvDLUfEcKBiSK4X?=
 =?us-ascii?Q?+sbC0W4Rcc/ga/LgyeQHUz8imNCwrcBA9NYcIqGeCLCJN2WPIlfcqyuNVbIj?=
 =?us-ascii?Q?Meu9R5CeTitaTgfiubjklBS7c/oCZdWEEqYepkhZopyIsTzjL+ehI9KRAx4i?=
 =?us-ascii?Q?p+Sa5VYfm6SipijwQ/kCMse3CYaCF06JbvgYDgwDZ9MoeOtHaBGkYPiSG2/m?=
 =?us-ascii?Q?znLUFx85VkjQ2mJtsOe4JcXAkj/ljhfAvOtqlYX6ZaMoDk8+PSrVGSaq8bME?=
 =?us-ascii?Q?sCqHrUPr6bi3C8mdXkB6B/5nGr5TpHyAYYihgwPgTailUpEfgHEHgGrcpfYI?=
 =?us-ascii?Q?xVvbp12PQN1j8s8BKnQggAMC5/tDshV4gOFMmfVElSELtpkbbnRz41frQm7e?=
 =?us-ascii?Q?NuSSdgGRhwDAQTA+5ZaC+/PLykCeZZSQYksm6ehsKVTqvRVf5/5cKZGozemu?=
 =?us-ascii?Q?u0u906BHanEywnn5FJohfQMeaJpz19fwr3HPvuYOfVTUqIIyZ2mgHIj2Q1Js?=
 =?us-ascii?Q?5tC942yRXBA3F06FO/MWeqe7kxyk7n4e6vjAjggTJOBc1lYUwHT/auL6izfq?=
 =?us-ascii?Q?qEetUDXy1n8nk0zL6T7ZmIRYsYQskl20vmbWgwNWaT51pdUYKtwaIexB2+3K?=
 =?us-ascii?Q?HQWhyeChDKMGhJoDmYIQR6gKt2u7olyummbQr/GyZbolJCydbS7TPnUsJbSu?=
 =?us-ascii?Q?pkou5vWPercL+tlYurE++H8jvBt+yKKzesjJlocRiG8Nkc+NKkwxQAh7jg82?=
 =?us-ascii?Q?tj24n4BPdTQUb+VH+53uVQZfZ6r9kF99K/zw05uno22H0H2LiQV8ccH5Qd8p?=
 =?us-ascii?Q?a3aDnYUnhjCfE2fEET02paRnCoD2iWE0VOdgGZRw9a6gbhhhNOQJ2+M9iiEb?=
 =?us-ascii?Q?RxhIqVNUOyWVVlWB1vhNAy040CoNSMDkiioJU+Mlw0JXWfQPoHKGUAMNxAbA?=
 =?us-ascii?Q?uD47mpxitnDKUejC1Qvn8e9L6HZIqyHhQ7tws8Plduyba/PEG8HuqfTG74A1?=
 =?us-ascii?Q?H+NzuiPE3tsQk33LUUEReaqOS3hnXci6ER4aJ6B8shQg2j/yZZtuQcgrt5UY?=
 =?us-ascii?Q?5jYK6q0B0ST0ieH7RyhqhLa+YpVS73/QSXpSTEt2ESsi/om+/xpUg5vViqTv?=
 =?us-ascii?Q?x4gfFespJdxu2VMqXCQFtuapD5uUTaHiXGzzLcm4jBRWTOJRP1ZnrhfQ2drz?=
 =?us-ascii?Q?iHsxhXQyI/FFAEJ+y6y0WbjYPHWxhVJ1PWjlMgh9e7H8ztB4dzchTuv3DUif?=
 =?us-ascii?Q?rlGp1vt8Qo4FZSUv4jEhTIO9EkFEmmWqTj0F/bTN+8vSkqRloK2ajmY2HwIh?=
 =?us-ascii?Q?uo6zProQX6/jRLpFY2thpysA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xJ1rfa/PjSroEbub+/MTTknsq8x/xPMiEhMel88HJHHNwXjNdNjCoVGBREBN?=
 =?us-ascii?Q?QAUU16swziN0mo2hwa++QrWx1x5jkt5da6Cxdl1t9Mv/xh/nnpZKvF1HwWD7?=
 =?us-ascii?Q?uVJeLZXczL8kNe/LDSXFmO6wGE3RP88wUpK7lirnayOXjYKB87v9QvKY4s8h?=
 =?us-ascii?Q?hpomqo4pJJmg9BYPOrwR0gnFZEsKw26/zo5OeDIhOA49KeY8phjxeGGkU+k4?=
 =?us-ascii?Q?ai6SM1oABtdvh+jh4EkE1O6n1v6j5Uh0H5ThV4TP5NI3zi2FYMR6j9ci3wTF?=
 =?us-ascii?Q?jBXlLlxmZmouLoM5Hmi6azRk6Bixw8aSo5QZzNgo1PT7Or5fE2m/KO7F7kwY?=
 =?us-ascii?Q?SIKFrhYlG5G4Vwn/TMgEaEaxYpcjsmwO5DTnDBfGRHXKZC6n2yhqwdy2ciGz?=
 =?us-ascii?Q?dAI7TO4uZVm9/z0TlS360tP7kZDrMa1PJ3RWctiYsnXMRoeIEWq51KVGx82z?=
 =?us-ascii?Q?qm/Da6ceRrRM51CdPxEryFkW9Hs1I1RWN1VhDMtHHNL+6LjRTgemWzZNcnuO?=
 =?us-ascii?Q?j2Vqwh0g5ULleVeu70f0yJ71nhD69tBQy4MpZwpGU66LezRR3CrnDQm2Q5TX?=
 =?us-ascii?Q?8nnbIv0L0n61uZNYH/SXHSPDHaX5Ekb5++kgP1jZZ9hxT+x255gTJZ62dz1U?=
 =?us-ascii?Q?P24Yn9RtFRzrnKS664ie/yaWZXMdBrboP3MHaQf9PXutQF7Mmv4rky+iNpdX?=
 =?us-ascii?Q?braOC4PmwfhprjfMTklciwjVH8pg0tac8QwgcxScbcTJ/LTUs4dy71hHLPj2?=
 =?us-ascii?Q?KiW9Ktz/6X3Z8BI+lCrb9qPa7mDAaGz5vfkNDCWUH5RiYyJsFhoxPXfo3dSv?=
 =?us-ascii?Q?svYKcTrE9gSZ88I7MzYYxmyHvDmGK53FCbZg29mjbXueVoWSiqrJ9PSeeahF?=
 =?us-ascii?Q?evwns5TVFguV43epwyngMnLzpDrmF4lRm3XA2zCPFhH4Ykex15o6M+fk2b3G?=
 =?us-ascii?Q?xM+cT2wUZQHDke/ISKzl7tHb9nbyvrPGI3rJSauAePsVBlTC5rG+unzHUdBw?=
 =?us-ascii?Q?JlzSJbVT543go8JifdJ8AeTdELR8Td7Q7UkqdwFMUamV4mg2n4SrYDWcegSL?=
 =?us-ascii?Q?U2ktdbNO/sCzDGs2NdtnV4mx+3J6dcL6eWZPDv3bYTPzgz28BOav7EPorEGQ?=
 =?us-ascii?Q?oKiEkgq3vPdr8sIzsNg/lM6hjXMRvLrnHMF5npWtDY3evKPgV+fvNV8nPFeD?=
 =?us-ascii?Q?9FDJuJSHiPNSObhQFYVBT1Ad3NiIbO9PnvyDwZlITrh2kwuJ7SeIOvpLSLa6?=
 =?us-ascii?Q?XmRe1Rn50qLsTIDMRVCoFsXryZID8nQfN8JV3nJ+NgTNcCdaYXJvRhaElHPV?=
 =?us-ascii?Q?dstOET/Hfn8W3AMVKRjpsaN+LjkX5xriv/SLcPu++77s4f7Hz3Rt7VCoLOJe?=
 =?us-ascii?Q?nriEK+q3hOk/z+o0FVKk8Zgwo96hqSokjoF8RREyjczo/pqOZNrgY/jWAVO/?=
 =?us-ascii?Q?3b9cPXDU5RcqTvpkzRXD/W0chUlBqxwYYDp43HTrhY8y64A3SoDWQdtHoPGM?=
 =?us-ascii?Q?Fh1SMuMoVyq/AdbtyvGRsPVmVwVRCm9XG72WarQPT02ALkMpKQxSGHMncKIM?=
 =?us-ascii?Q?lYCBfYe/jYdOdCKIloOv1J/e4Mqm4+xuGFpY+iJx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/TiLUWgYjplEHuUuxY3xjg1ZyD0xt/EvCRDlch9lXKRq5JDFPjpi63KWn0wqsb8dIyFWYO0a0Lk+y456e2Yy0yO6Swl8/+vdPa1YCLmUbk3HpR5kC35491KiC9td3Gl85zSKe+ltLeVj3uifqt6985VFav0LLQSrHJ7DGae+YvZWfQginoM+cutS71wonNq8hP1EGmwhfZhLzeh0sIzVZsZdqcbni5baoFatTN+CvrsHT2rAKLpytTFhBUm3ogyMM3bxrKNjvcKw11zgQofiWWCc3kWH2NflNjdOPwcWS0oeeCI0OgV6Jt+IyXiO1iwib/e7EoONFYVv3Y5DBmAnpZnrYn/zJzqBsbwFOonp1s3vGRmKrAR8aXvFWr9tvgobV4VLJ/ftyV6Eui6h5kqWlSPcQrJU7qfqxKu+iUhu8lQOchNBI8+X5a4pKp8j4ICqQ/fQprn0lkZjTEJOPb94h9DoWWrPIhCgA++fb2K0imex1V8Dv6QSgGUzsGwiZMzWB8VG9k6JfNNjyMyNkpg9Dr/de8Xq/wfxJJ1g/jXMaq+vK4U1e+Wx+qrDexWfO1ChZxGnog6a6ZMNnncX3wmxO5QQb9SnvMOJTp0i1svtCzU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd018873-7ed8-4264-9587-08dcf4bf15d4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:34:32.2885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9DjoXO6372gUKZwqYD0fNIq53IY0kML9Y+2+Ax4PrrVj77M/Uwz1dPQ/DZlY0j5BhHOGWb29zDiCN0cSuVx4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_04,2024-10-25_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250049
X-Proofpoint-GUID: s7PT-IY6UC1f_TWvJ5UGv84tNz5DIO8Y
X-Proofpoint-ORIG-GUID: s7PT-IY6UC1f_TWvJ5UGv84tNz5DIO8Y

From: Eugene Loh <eugene.loh@oracle.com>

In ignore_clauses, for an underlying probe uprp, we try to
decide if we can safely ignore clause n.

Meanwhile, for some clauses, the probe description tells us the
clause will not be called for any USDT probe, regardless of the
underlying probe.  For example, "syscall::write:" can safely be
ignored, for all uprp.

Add clause flags to track a statement's status.  Specifically,
a flag may indicate that a statement can be excluded for every
possible USDT probe or included because it might be needed for
some possible USDT probe.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_program.c     | 15 +++++++++++
 libdtrace/dt_program.h     |  3 +++
 libdtrace/dt_prov_uprobe.c | 53 ++++++++++++++++++++++++++++++++++++--
 libdtrace/dtrace.h         |  2 ++
 4 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index 45da4f206..23b91fb2e 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -20,6 +20,21 @@
 #include <dt_probe.h>
 #include <dt_bpf.h>
 
+int
+dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags) {
+	stp->dtsd_clauseflags |= flags;
+
+	return 0;
+}
+
+int
+dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags) {
+	if (stp->dtsd_clauseflags & flags)
+		return 1;
+
+	return 0;
+}
+
 dtrace_prog_t *
 dt_program_create(dtrace_hdl_t *dtp)
 {
diff --git a/libdtrace/dt_program.h b/libdtrace/dt_program.h
index 5f57e3615..5f11ef3a6 100644
--- a/libdtrace/dt_program.h
+++ b/libdtrace/dt_program.h
@@ -28,6 +28,9 @@ struct dtrace_prog {
 	uint8_t dp_dofversion;	/* DOF version this program requires */
 };
 
+extern int dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags);
+extern int dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags);
+
 extern dtrace_prog_t *dt_program_create(dtrace_hdl_t *);
 extern void dt_program_destroy(dtrace_hdl_t *, dtrace_prog_t *);
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 11ff01051..9ca190b72 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -27,6 +27,7 @@
  */
 #include <sys/types.h>
 #include <assert.h>
+#include <ctype.h>
 #include <errno.h>
 #include <string.h>
 
@@ -37,6 +38,7 @@
 #include "dt_list.h"
 #include "dt_provider_tp.h"
 #include "dt_probe.h"
+#include "dt_program.h"
 #include "dt_pid.h"
 #include "dt_string.h"
 #include "port.h"
@@ -270,7 +272,53 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 static int
 ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 {
-	/* To be safe, ignore nothing. */
+	dtrace_stmtdesc_t	*stp = dtp->dt_stmts[n];
+	dtrace_probedesc_t	*pdp = &stp->dtsd_ecbdesc->dted_probe;
+
+	/*
+	 * Some clauses could never be called for a USDT probe,
+	 * regardless of the underlying probe uprp.  Cache this
+	 * status in the clause flags for dt_stmts[n].
+	 */
+	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
+		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
+
+		/*
+		 * If the last char in the provider description is
+		 * neither '*' nor a digit, it cannot be a USDT probe.
+		 */
+		if (lastchar != '*' && !isdigit(lastchar)) {
+			dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
+			return 1;
+		}
+
+		/*
+		 * If the provider description is "pid[0-9]*", it
+		 * is a pid probe, not USDT.
+		 */
+		if (strncmp(pdp->prv, "pid", 3) == 0) {
+			int i, l = strlen(pdp->prv);
+
+			for (i = 3; i < l; i++)
+				if (!isdigit((pdp->prv[i])))
+					break;
+
+			if (i == l) {
+				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
+				return 1;
+			}
+		}
+
+		/* Otherwise, it is possibly a USDT probe. */
+		dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_INCLUDE);
+	}
+	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
+		return 1;
+
+	/*
+	 * If we cannot ignore this statement, try to use uprp.
+	 */
+
 	return 0;
 }
 
@@ -453,7 +501,8 @@ static int discover(dtrace_hdl_t *dtp)
 		stp = dtp->dt_stmts[i];
 		if (stp == NULL)
 			continue;
-		dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+		if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) != 1)
+			dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
 	}
 
 	return 0;
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index e636c5065..20672d3fc 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -161,6 +161,8 @@ typedef struct dtrace_stmtdesc {
 #define DT_CLSFLAG_EXIT			16	/* exit */
 #define DT_CLSFLAG_DESTRUCT		32	/* destructive */
 #define DT_CLSFLAG_AGGREGATION		64	/* aggregation */
+#define DT_CLSFLAG_USDT_INCLUDE		128	/* could be used in USDT clause */
+#define DT_CLSFLAG_USDT_EXCLUDE		256	/* could not be used in USDT clause */
 
 typedef int dtrace_stmt_f(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
     dtrace_stmtdesc_t *sdp, void *data);
-- 
2.43.5

