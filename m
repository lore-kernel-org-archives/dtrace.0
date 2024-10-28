Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE971D2796
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150309; cv=fail; b=slww64b+rts6xGarY29TOEB/NlGENkMj9hu6SeVIdu9hLen+9J8rz2h+WcAbSFlrf3ACqK58HBrKhhd8dfK9XVEOOj4eaatuZCBK+2endaQ3HcWm2AagbifUSy2AXkGTw/rEjdLMYjCxHP7Yv/pEe8cKv+/HusVV/5RJpyX8/k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150309; c=relaxed/simple;
	bh=6Swv1cJbvNHnjV8PVHsm0BHOCBHnDCjp7Xb9Q/xc92c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Te9FhP7tUHA0hKM2eqgU3Glocdbg5Qs3ZtWOJARRpYQreuQA/+JxohsVEQmVD5WulDT36nNNU5HuPTi/gbIQM57/dAPtRxqIauoUmEAPb0t5Phdo2zB7ksRFprDmU5x66QI+JgyTg18wo4LyaX8S+utZAOg5aAhoo9wj52Kfto8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MmOMbgsk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y/bKC9M3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MmOMbgsk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y/bKC9M3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtaMl024336;
	Mon, 28 Oct 2024 21:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=zlwHFcjZ+gnDOCGsBzUDso0GzBGaNi9EONfrAEdXTvI=; b=
	MmOMbgskJWjOrARItEXhLz8W0E+iG4Kpqjfyl2kAmKSUnMq4CMs4MdYDI5icdZk3
	Fuy8T8NzBb5R/Xt6jmjwDNjEw/VxCUFYwtS0AkqQe/GGX0j4pW/goIBVGz4hy+ek
	cfF/hzsVMihX29bbjtOqjsvtBjOwrAFl9ujWxf0FILuX+8ydei0DO6utE+f5sxKO
	IM0aL+pCUSb455kjsEz5oij8Kr+1HGpxbIE1MH3pR/mNk5jFj6oeDED1E8VOJsXG
	/BNbRQQYFY3TDrPZosCxLuzSxESLqdp3XvUwDjlr5ws9tITCPa4ylN3dOpTBruzd
	IhwqGsK0Hpp+UIhDRrUUdQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdqby76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKHFi6040322;
	Mon, 28 Oct 2024 21:18:20 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnan3645-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Oct 2024 21:18:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4ErwfyctQVBjkSsRO+bSQ+c3A90MwGyccEnIaVHnR14JvUVuudYXuVBiYircZO3nhocNGMadecgZFRcO0JatjldWEQbQWBBW39j/d4aEd/WiuUC94qLau+ZVC92Mck32Jmkz6fxlrqWpAODEoizf7wx881fhXfYTJ0o/FrjjXStSH5U3dUWAtR5kbKbtDWKBET3knDE2fW0jW1LK9GHu+7LP0+6lIJ3Bknq2izwx/uif3lbaFiV18hTQ+fifxkxZ3cD5aLXL+mVniGsthQcFPoJGTqXaatGSzvqarII30LirkvBUuyBSnwHj8EbeDQksfeV4/juHPawot/7Y/BH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlwHFcjZ+gnDOCGsBzUDso0GzBGaNi9EONfrAEdXTvI=;
 b=R4qs1ctv9+jcvEZ3UCRl7Z241fQVYB8XY6Ylb2mX/1+Xwwbd8Sy9jCG+IlP1LduyiYRNBvMW+w6pNucAqfmGBlnwyLye5PAMuQHCa6NH+TmgfMkOFHL1KteddtniU/yAxJYxa1KxVa7TfpiboFycBr3WqOId3nq5X4NrErKYd8jQr53XQfU0TDulHPxtnRPq+ZFV9sJQG0Z1ZpexD5KVxhnQJtzK9iUvJ9/F2aARsM95BewAoReI4UGRt70ZnlwTT21BxEoLVbyQCpysO2AT2aYIgQFKrcciV0nXx03Zd+koqTJ5fRJNm+A4s5Tcp5hBsXTJBEuD3H0SBv8TKRDTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlwHFcjZ+gnDOCGsBzUDso0GzBGaNi9EONfrAEdXTvI=;
 b=y/bKC9M3Ag6q02y9I3Cxxg+Y5zENWAk7qazR1rm1RBZOaXCOISOH/Vt8Bxo3iKvigdaXERtEw3Il6FgHJqE5Kb4MgUxJB1S5NQ/+UxMNPV0/I7Wd4KdeJL5xaIelCoy1UQfdDAE8WAbbxbuCifHWmy9hZgdpcpc38YrzDufJ5rk=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH3PR10MB7354.namprd10.prod.outlook.com (2603:10b6:610:12f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:17 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH v2 05/14] probe: improve dt_probe_lookup2()
Date: Mon, 28 Oct 2024 21:17:54 +0000
Message-ID: <20241028211803.458685-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211803.458685-1-nick.alcock@oracle.com>
References: <20241028211803.458685-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0020.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::9) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH3PR10MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e62b991-40cf-4a2b-9d0e-08dcf7960a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Njm8W4X1W9sdWBYo7tYXFd9C4m64hdszxmzUIC8/ybBA+wXvj+C4pnUGuoU?=
 =?us-ascii?Q?eLzBiZhjwOOeW80c50RE0BR1SxgAmmiY7irutSxqwkEIB/IBU2Uokj/z5GNr?=
 =?us-ascii?Q?rYfUhT3R9L0mS04t5VBQcWiDwb2WM4rA71zIpvxQqZ3wAjltoISFZH6gFin+?=
 =?us-ascii?Q?slBV09BQxuAeHTztcnpNzdQQq/u0Gd2lo8eTZCFj+4+NvBsKVCz0KC6hCayf?=
 =?us-ascii?Q?J2XsUJBrP9KogPP88x8dyIZkkf28MhuS51kX5WluAlS/tWehpRHiZij4icYf?=
 =?us-ascii?Q?latSeHa7Rh2FTBUwh4eZAkHlQpDirgoMz6+/3ITLuz4QOlrvwjo1VeB57tsf?=
 =?us-ascii?Q?k3DccGwC3IarOVS9HLJ3GxfYHlitGE1FFIAKHsV5DlyONitrizbIZ2nMhhzd?=
 =?us-ascii?Q?UdfBP4C/IliwX2Gztg2pLbvyH2vf4RPaP73i0xA9RQRbQuhnS7mhZMI96Ulu?=
 =?us-ascii?Q?uCBRN4Ocv8vFDPoxBlupDR3RLCroF5eBJqHqoHMj8mXpFYfqNWzZpq0REAJ+?=
 =?us-ascii?Q?mPF5mxKNPVxa8wOGJ0QKKmtQPGCBD10ZtSTPWttga69KfjiPVnaF4RtxlsSm?=
 =?us-ascii?Q?k8/68P3gD226Ngp0zCKYJ2oGkv2zmkNl/NXDOqviJm6nX0JUoghVf+gktyDp?=
 =?us-ascii?Q?HTGbU1DSdswvBH5FkBgZFnvkjdJZVv3M71S3zx3FGl95k8PFp4qVBGTKGxig?=
 =?us-ascii?Q?7LIRo4LdbUbphwtopGIQzo1IINtXmKgm/yA+8xHOJJCt9H44yuyWb+2Qc5Mx?=
 =?us-ascii?Q?syuhne0LuR8YXhuWVB7d9i6W/GzSczUVEGAiYH/KiSge27zDrGY7IbWNe8wR?=
 =?us-ascii?Q?U1KrmrrtNrxTKyJywO9XO/7YW60YqABrshdEa7raUaTYix4JXW0YR0Ca0Xdu?=
 =?us-ascii?Q?Vifm1Dw8TLHJJQZb3Ct9WQhFegmiNBnhzIhwDfjcVIA21GfHIlQV9WDlsMKV?=
 =?us-ascii?Q?99FjWKesFHyJ3w6w91PGxbkFoGJCN7tTV6wIJK+9DZ5JEt/TDwrdlT5FOCnt?=
 =?us-ascii?Q?YSUX443figbg4DhDPCfMNDp/zZp2gcruRz3zuIPpFUWRmFSVXam6bAsOTCLg?=
 =?us-ascii?Q?mqitjTG/vcloqPokdLBA1Km5Usx4kHKXbhiAdQpoSUTy+ZMfqU7H3j4ILvxs?=
 =?us-ascii?Q?8GtS2tRSQ/gWpVwlU4NpcemSiVjJQ0lq+hAKnTlVF3g1N9GGLStrhlvGrI53?=
 =?us-ascii?Q?GbKemAkS1U4fX2gT9OdFUTwTa4YbfmzDKWQ0YhBjqzMNyoob1TxGe/USN9kN?=
 =?us-ascii?Q?sSl6rMz3ao5t4raaglu2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rrBxT05He/YjWfMtGsDPAB/Ejp3X5buyd9tXWYrqPpVrRxRGFjSkt740DaE4?=
 =?us-ascii?Q?Cgl/mUJiwidYxtWt30hVZmEhMekqISLKphXJw3c8Yhv/O+O5M/jKIEQ1BeEY?=
 =?us-ascii?Q?jfQoZwnERYsOOx2yk2mRSW8772iQNBAPIZ0uVB/GM//o+8Od57ANJ+jbVGwA?=
 =?us-ascii?Q?gAtDcccKc+F1fECJXLyNtrhaL2hiD3Cc85xpgCLVvFlUaevyTdyGeR4/vrrG?=
 =?us-ascii?Q?7bAImUKQOR305qn6OmZlEQQvqvaL6/MsZrOpKGGaF9topyldjYO44QE07M6O?=
 =?us-ascii?Q?wmxNQLmgiCFkEeOGI7oPW8vr1lJM+xutvSIUF0USx7XdcUhORbRCJQdsnB5h?=
 =?us-ascii?Q?DsH8jD74NmDYbZUp6cupw6hzJXAyRHx/y+QvpNxibkdiHCxqOrxCG7KHJNuX?=
 =?us-ascii?Q?WtCOHwGwmTKtXBloOUy/8sRfaIOwDxlk1ufHDvxaetY7j4RDVaTxTNzjUBsE?=
 =?us-ascii?Q?XRzCwKcoA6sr9DD9cV/lMQnVcMSM99wh3ntKmJ/8AgWNlP32HL5XiRcKoOne?=
 =?us-ascii?Q?aYFY8K3hW9dA1CzJ/pGb7CmyMhP3laA7qbhEMc86XP7TzdGFruhP2h7XUgby?=
 =?us-ascii?Q?gz/hoOMXTXz21OPa2iC/e49Kx54rGINikjsdesiUBcrj4Y6+9naSvgTd4YON?=
 =?us-ascii?Q?3yiBMIpAWpbCwDjeYUTqsL+byU8CRiaJbOjYiQPKdrmy0fKeA65G57RlwkWx?=
 =?us-ascii?Q?WHlooJUH7IFhIKA72XCx5i0WW5knEIxqJaqn68M+r5K6OWZCoHXzwV1riKzD?=
 =?us-ascii?Q?y7s3So3NTXabEbyeGInWXnC1WIuXAXtSEDcl/qIinvZErfFmvBppB1n2kymj?=
 =?us-ascii?Q?ewp9FlqxIeFB2zXbT7tAB5e9ZZi825Vc3SP5++2BpIypneICfXziklV4wzyg?=
 =?us-ascii?Q?lF2mgmDSCQYISc5t7Zq7fX7ECscQlNtsMQyVjd7ZMxayo+Z1H3/Govs/uK+r?=
 =?us-ascii?Q?qSeq+xX3+M/PPsGbSXc74y4KFU3Oc//vx7OqZg9b9hCPvhoSYmoKCGIdPo2W?=
 =?us-ascii?Q?XWX9xzfOIeUBVAgunlM17nQosfEOlNzbxqVmMI/Wp7zNd8Dttla4sCMDKY0H?=
 =?us-ascii?Q?BXgyZoI6Wy+SMk/R3tva6n6jYmotus0hSJlFEqlTYybfhqE4rrQD12C1yc2O?=
 =?us-ascii?Q?9bKM3TukWIGHRX4AM76euattHPAIZ/Ivg59s83HSdSfq2CS7KK9/9Qj9bvhc?=
 =?us-ascii?Q?to3OFfz0Zdrmdg0TirB7YyxQ7OeQsZnlXClGL44iio5c+WodAtY02KXz3TXM?=
 =?us-ascii?Q?uq21DAL5fgmSYO4mzl25MhrzOI+0gWRrx2f8BFDSUpJZ0aWEwZCgOJUAxmtM?=
 =?us-ascii?Q?Sr34yBdwOCK1ZOR/9eNNBWXVmKuP7SqnmgJqcQ0DywfV9NYf0tCZSWZ/Fs1x?=
 =?us-ascii?Q?BRPasXjIs/gdNMczc02UXVURGZKVUMcg9dlOCp4NmTf4RGCB72IL7QJGoo4G?=
 =?us-ascii?Q?+5RCcTRyO9mRX8C0MZ9UrZmjMHL2dORUTUSTMxsYVHi+r5diuUkEGZvt3BoD?=
 =?us-ascii?Q?IBJwMi9yIllNoykvMgi33WvDQSBPCoBBJjuvaWNWz37nvazAsIMndE9DWZSl?=
 =?us-ascii?Q?3kAGZveWSQhPm3p88593WMMEkj5YzVQAjEKE3rfX2etlkWDqbJPO7mqGFFaX?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E/XspTIC+aYm4JMaLOrArF4fgDIAGVmL5Mm5sTs9pVU01IUTwxpU9tC07HJXC89F67vQMGYwy8uBDQbLB+GOsOM2+22EeE5JBEnUwLDszUpOfHnaAJa5kYqnMUy1im2TmaWTua9vW29BpF1CEl/fUtFkhGb43jiznn56QT5y4TjQsipxkxpUASvMHHAqCrVIZ91a5uXxTJmmgXEgOxoPN7PKe5U6RpFoRQ40HhvfAl7C8EdgGIlllVwZ8RuzBqHFwxEgu6HGrZsz6WOTmHqTqITbBu0KHIqNW+p5X+zDKZ3rGwbQcwUuh8Lw7IBoKRVDrHueZDIf82n4M+j30GibPIQpMpJSfgLUhfmqYM0/WRMZaJWqDo4NyzjRHsrg5O4aLd5AykNtkG4gf81aaG4d/uwaCyiawW0G5wyUNt46szsHy0ahGpYK+I79nlKeGlnAtxlU6WRZqkJDIZtN996y7tQ1NkahoFUsN3HW+h5pj7aOxmG2PlZD9vtZgjVv8Hl2btrefbaOS/AwodeLDKyEjoB74Av9EOeXZDF0UZMnzQ+6FMbcSP5VPGpC15aOLk1QP3dFn0mtXHdD0s0uko7jWMo4lF+xe2gzhYTJFxpcTTA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e62b991-40cf-4a2b-9d0e-08dcf7960a4a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:17.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gGr/7mfaS85kXwhNpHOPNTKCh75KlvZU6gAvxwJdwobFJrsjCT7Y1BhWy+uIy3g6QN1+8dpOzoXXo2kCCKm7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: hJh4_Xp5JlDjw8TjsJajJMAi-O4mK_7j
X-Proofpoint-ORIG-GUID: hJh4_Xp5JlDjw8TjsJajJMAi-O4mK_7j

This function had numerous problems:

 - it broke _FORTIFY_SOURCE due to using a function that snprintf()ed
   with a size of INT_MAX, into a much smaller alloca()ed buffer
 - it claimed to call down to the dtrace kernel module for a probe
   description (long obsolete)
 - it invariably leaked the probe description it constructed by calling
   dtrace_xstr2desc()
 - it did meaningless errno testing to determine whether to return
   EDT_NOPROBE on error, which more or less led to EDT_NOPROBE never
   being returned even though it should always be in this case (there
   is no other cause for the ID hash lookup failing).

Fix the lot: while we're at it, implement a dt_desc_destroy() to
undo the strdup()s done by dtrace_xstr2desc(), and use it additionally
in dt_probe_destroy() instead of an identical sequence of dt_free()s.

Bug: https://github.com/oracle/dtrace-utils/issues/78
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_impl.h  |  2 ++
 libdtrace/dt_probe.c | 44 +++++++++++++-------------------------------
 libdtrace/dt_subr.c  | 10 ++++++++++
 3 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 340dc1960c5e..d11ad2839f8e 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -759,6 +759,8 @@ extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
 extern int dt_consume_init(dtrace_hdl_t *);
 extern void dt_consume_fini(dtrace_hdl_t *);
 
+extern void dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *);
+
 extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
 extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
 extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 686e2a661253..f84581687caf 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -172,24 +172,9 @@ dt_probe_alloc_args(dt_probe_t *prp, int nargc, int xargc)
 	}
 }
 
-static size_t
-dt_probe_keylen(const dtrace_probedesc_t *pdp)
-{
-	return strlen(pdp->mod) + 1 + strlen(pdp->fun) + 1 +
-		strlen(pdp->prb) + 1;
-}
-
-static char *
-dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
-{
-	snprintf(s, INT_MAX, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
-	return s;
-}
-
 /*
  * Lookup a probe declaration based on a known provider and full or partially
- * specified module, function, and name.  If the probe is not known to us yet,
- * ask dtrace(7D) to match the description and then cache any useful results.
+ * specified module, function, and name.
  */
 dt_probe_t *
 dt_probe_lookup2(dt_provider_t *pvp, const char *s)
@@ -197,28 +182,28 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
 	dtrace_hdl_t *dtp = pvp->pv_hdl;
 	dtrace_probedesc_t pd;
 	dt_ident_t *idp;
-	size_t keylen;
 	char *key;
 
 	if (dtrace_str2desc(dtp, DTRACE_PROBESPEC_NAME, s, &pd) != 0)
 		return NULL; /* dt_errno is set for us */
 
-	keylen = dt_probe_keylen(&pd);
-	key = dt_probe_key(&pd, alloca(keylen));
+	if (asprintf(&key, "%s:%s:%s", pd.mod, pd.fun, pd.prb) == -1) {
+		dt_set_errno(dtp, errno);
+		goto out;
+	}
 
 	/*
 	 * If the probe is already declared, then return the dt_probe_t from
-	 * the existing identifier.  This could come from a static declaration
-	 * or it could have been cached from an earlier call to this function.
+	 * the existing identifier.
 	 */
-	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
+	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL) {
+		dt_desc_destroy(dtp, &pd);
 		return idp->di_data;
+	}
 
-	if (errno == ESRCH || errno == EBADF)
-		dt_set_errno(dtp, EDT_NOPROBE);
-	else
-		dt_set_errno(dtp, errno);
-
+	dt_set_errno(dtp, EDT_NOPROBE);
+ out:
+	dt_desc_destroy(dtp, &pd);
 	return NULL;
 }
 
@@ -387,10 +372,7 @@ dt_probe_destroy(dt_probe_t *prp)
 	dt_free(dtp, prp->mapping);
 	dt_free(dtp, prp->argv);
 	if (prp->desc) {
-		dt_free(dtp, (void *)prp->desc->prv);
-		dt_free(dtp, (void *)prp->desc->mod);
-		dt_free(dtp, (void *)prp->desc->fun);
-		dt_free(dtp, (void *)prp->desc->prb);
+		dt_desc_destroy(dtp, (dtrace_probedesc_t *)prp->desc);
 		dt_free(dtp, (void *)prp->desc);
 	}
 	dt_free(dtp, prp);
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index d6aad7637fb9..72631b33a0ad 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -175,6 +175,16 @@ dtrace_desc2str(const dtrace_probedesc_t *pdp, char *buf, size_t len)
 	return buf;
 }
 
+/* Only use on probedescs derived from dtrace_xstr2desc above. */
+void
+dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *pdp)
+{
+	dt_free(dtp, (void *) pdp->prv);
+	dt_free(dtp, (void *) pdp->mod);
+	dt_free(dtp, (void *) pdp->fun);
+	dt_free(dtp, (void *) pdp->prb);
+}
+
 char *
 dtrace_attr2str(dtrace_attribute_t attr, char *buf, size_t len)
 {
-- 
2.46.0.278.g36e3a12567

