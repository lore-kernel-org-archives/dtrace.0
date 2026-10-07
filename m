Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144F644E672
	for <dtrace@lists.linux.dev>; Wed,  7 Oct 2026 09:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365298; cv=fail; b=FrXjn4CzuCtG7SeLZXMEZ8zBxLtS0oL7gkEwSaLcvxUOPgU8Q/yVhgZiScC6D5kYqUryb7i9aMIv/fRyKIzR4jlTnIEAuAXc8+M6hB2cHcjA/a6qXCNw1xhDAEjwBBE2wkERq/cQ1TXFXRvHbQQRmYa0cdG4TRgNMAfGF7EJXBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365298; c=relaxed/simple;
	bh=qfAeNmjB7rsKURZWVhtKi9UNgRzLy8422t5jiAefuZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q1qL2cmGNRa+f2LNGGxPMOkFS1RHATTa+ZGVJzupEPyhQw/XsxuR3zY0F4PrB4CbRF28nzk3VJ5W+zoQdWD66y6IacG9t5VMjh/I449cL41wKewfEEsKEloz5+ay4RwI6Ih3hx0QEAA8LsH6VFwKj04/ORn9CmHKjoKZrAWJpQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PXC0Dib7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z2OmL5qM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PXC0Dib7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z2OmL5qM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977gfKj3557902
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 09:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jJUbOWRgDhrRJmUzMF
	J3xUv295vrUysQq7wOl8jcFPc=; b=PXC0Dib7MpTAaqQwu7evWZ9V0E3yotnB9w
	JX+JilfYMoYBi5wpSGkzLQIVQnL+Me81JjRPrk4ozHztb/64XHxsEwkFMC6+BwGB
	/F9N/d8bxNiY9vQCSf0l404HMKZPCkbyBwqTxVQN3rUCA3rAarA4U4yxVDIKufUH
	UAvW3PngnOJXz8hxurkpqYmPzBKKn98+xKv4to7mwhS3MNaZQOejdTm/joL22/aB
	btfTlU0+zUXRvfRVpeIYpur+4lmOtnl6XZw3kcj20sYZSTylx8qcjlcKSNhPCp23
	nTBM47EYFxbrwx9aH4yaPL3lo8CclfrB1qNkGBfCAkYgAHvwtCvA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2srcwgrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 09:27:57 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6979LBZe034707
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 09:27:56 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012065.outbound.protection.outlook.com [40.107.200.65])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h4d00rh3j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 09:27:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoB8QsZkFYrGAxPxw/S61uI3G5N73eC+MhxFO2uLiNYEkZ5mLAmJPFaoOsss0DXJpMaX1TeNgSnd8Ts/5Qmh1OgVN5ShtSSWHsJ9cb4ISHNePwEjZdLpVA+/zMoh/soaz6AWCIArUt6AnNJOqa6b745MT1hIgctPxzDCpsL49awE/6RFLzPct33Wgxxr8MLZhB/j/ANHicBf84a6c1B90AvHfrDSXYuEa2TPknekfmqt97EJHLKIhQ5PCH8RT4tYQrF96/OY3fV101H7YV+tITgLqhASupi1yEyxRRo/NsgHc5rIdaHs7ok6iC1vGWprAeZ536C8FnYm1lKlZydNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJUbOWRgDhrRJmUzMFJ3xUv295vrUysQq7wOl8jcFPc=;
 b=EEHi8Jb7xmy3pYYOgGMFI87CyKcRK8bqAPHvjAuEXHwlKQrMEHoE+NjXLISyJoW/gOEPW1qSDgbMLDUlJQZYWs7b7caQ67GfSTLFIiu7vmpJN4gYrgWFpUKzAcjMprxrxMjmr6+Xx3sl+mGVCn16kacsCLs33qrc17dl1iat9bOQ02rWoEKq4yUIrIasdMXPZUCsxvQngeFxulQefNc1RgvHqkWhgWjQtuw/LvK8wdI8Qa5YsLmdwKPiHdg92QMgXUBG9bRpf9CHWPMDKWuRJViLXemClIliBl0rNKh8agtkxtDhgy16M/kud22u+XnhNtQjuoAF6MqglfrEmOGx9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJUbOWRgDhrRJmUzMFJ3xUv295vrUysQq7wOl8jcFPc=;
 b=z2OmL5qML4bOauin6UcTub3kCPU5DWSxxSF8LkxexwDr9udZw7Uh8TEKFBOT6p3PEeSyWSkUh0D5kPHJ0IS4tG6TUmd7bqw72L6cmUEAG82K2I9Bb/QV4H3BAVv0G1iP2YsgXkKp+NBsiIlQydef6s8rmrZTrwhWcVIWlniMAzs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SN7PR10MB6666.namprd10.prod.outlook.com (2603:10b6:806:298::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 09:27:48 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0496.008; Wed, 7 Oct 2026
 09:27:48 +0000
Date: Wed, 7 Oct 2026 09:26:25 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 01/11] libdtrace: Support multiple DTrace handles per
 process
Message-ID: <asYQHX6jTS4G8Jm5@kvh-deb-bpf>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
 <20260821161100.41710-2-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161100.41710-2-alan.maguire@oracle.com>
X-ClientProxiedBy: PH7P221CA0053.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::22) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SN7PR10MB6666:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a1f37f-8b9d-4c67-836d-08df24554044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ykwbXVSuD5wzdtj4PgPbUnMc6Cbb2uoykqsACyxai5Xuh3RkMGVIRUG64vpPbz3IOQd6P9x3Ek3uKtWIfupf7M7Gh1PrccFcTSNBAL2B9pS2SAbNY7XfRy+4dgS9EgglsWjN7mB4jQGOqAQZLdtZngKegi++8g6Ea4jZVP+Md8rETZ6qaZ4XpH+StNG3HE3Q4+SVJy4VQNywijSUgayuwIFPu+weRsZcTduQ4BpPU/DOqeMzkazCvDAFPba+cvh+exv/0EMD6KGgolwLJSpqq4XZpGzp/HcpZpf1Z7FANpPrMhfZo9clFbM3a8YzhPUe27n/nRBZHO8wsk4Wp1I+AEOsHiDKmmK+k81oJjjvEurAPM8I5vw32s5b4YBB0HV8lCLNMcU0wYut1eLJWw3NkSVCxrAjSRyL5ft8w0UzwNP3sP13Qj7RjGck8PPWTlmP6gi39fVZd7X+9HYq9z+1AsRP4qLvgZabLdIJz5xwnFXoiMkmsdRiXPYYSOdrpdg+i9nUXRZRvnD8yErot0lnudRBd0r67vx6AcSKGQ9ABh32uMD/+7KRaEHilIXbsq/Tm72HeKB0mAbs9A9kXWk4d7dxxMgQdff3V154jvGQ+1zICipGwaNc5kzQIjK+OZKrzY60kyhm1riw/mUBQ6D3h/dBuHOK/lF2YX0ymMYd89g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GYGkr0FBlTeKMjimPNTNVmBkLC92b2//02NvsHtRPGyyo+2XGZ2wbl0Q1MrS?=
 =?us-ascii?Q?2tgsidXEXLamOH1XojxGHk65n80MunHzrMGfIlERy4ahG54a49LPWBTnh/VV?=
 =?us-ascii?Q?nYGgRjMzCsYBxI3Yass7XCtZ9vI/OI5VOzuMv1ywB/E6mgO7lAOf2X3ZxTCl?=
 =?us-ascii?Q?ZKafeVzd5IDNX0mCiC76v1L//eHRccq7BWlZNGiWxXsNiQt5TGGoRCQ6goce?=
 =?us-ascii?Q?4ET6RpHl8+p/LeRwuH6Kj3Mz8bRupbz0SOEZmFnv1/S/Bn6Ag5S0VR6Cw61p?=
 =?us-ascii?Q?VicO3rVmgJKPBcYrkbQDxoxe636WG44XGr8DxWOEf5eAbPw5gcBnWdXLEAtj?=
 =?us-ascii?Q?Xctv3zdSR4nv4/p1XvkGnWCBx0smOaaXToQllQ5B6sZz/R/PRwWwWz4AYvoh?=
 =?us-ascii?Q?VqwgfIWx70lBGjoI3l4qmP+axjM6+ORH5C8Yj4plyT6qEvMQPAMGTZnGKRMr?=
 =?us-ascii?Q?z+h8ursOrAmJTWR3gIRik7Ztl2MczuHGBRKon+t0kwLgPU0Z2fHWPwpBUQEr?=
 =?us-ascii?Q?GYnqj7T6BTuww0x53boN0JHoJ0oECAbMYWuSGzGNWPe1jxiYGTbLsgMaa79z?=
 =?us-ascii?Q?pjqmzECFQRBKxmlJfL4LpQG5Xp1wc9zIyERn5yVh1q++x6jDcWQv/Uib3ZLt?=
 =?us-ascii?Q?v5+tc5dNTbupRDHGJrc4vmErVnKIggnO4/FBncPzKAHU7gs2OVSCoZRzceR3?=
 =?us-ascii?Q?Np6HPMJp91C2ylJmJflx2Bxk9yQRXl15lLJuARbsrYAvMQaLd4Z8d5JGpi4z?=
 =?us-ascii?Q?1tG+YYRr5rWqAtJVg14OzbRDp0EpKBnf61DpBr/64ZLrDfrJYxOzK4U8kHtQ?=
 =?us-ascii?Q?y/LK/WkIGj61nlTZfT1R1CO+4Igx+sXSor4Rs2lFOO/xFN7kIkp8HkIzzpSE?=
 =?us-ascii?Q?gExTYkhRjDxDcMNf/4bwV7rgyjL6s1iCCN0NcKirVTqSlpnE/qf6X6TS0GKx?=
 =?us-ascii?Q?PcX1mfpvc4pRmcro959W99go6U7MWPtkfRrUZRL3KoTST03bRfzC+56JlUL2?=
 =?us-ascii?Q?m3mUV1nD1OcTMYn8G/d4EcKNXhU9zRjZ+zHrnsw7PYdikpKOntlv5EMQUyxx?=
 =?us-ascii?Q?lghRYd+ykctegUVVn+VIJCU2eqiEfwa8oVyhVNCWH1JT6akBMTNiEpogtzrm?=
 =?us-ascii?Q?dAt6JtKQO+QNE6VITlQ07YTqfCEtJ+bCqZ0tWdzTxC7IdG9uqt2MDHvW7Ctx?=
 =?us-ascii?Q?KtkofTcfXJ6no2RLk5nny/SrFiBj7efE1edH20yvSuaQvM64wBoONRGPaXmn?=
 =?us-ascii?Q?F0xL6cV/cjI/Ow61WtV1bNHjBSf4eHlt6U8/pQAxHsXqcrbrGCQkpeHCRgDE?=
 =?us-ascii?Q?HJhyRXptwV7oe/KOXyv/bM7rJKEjL6PCEt1UoiVI8+G6PnxMe6dcbdkEJMkD?=
 =?us-ascii?Q?YxMZdqVb7SwQEV+4KorMwnQgLsC3w4cyYPn7ZebDTQou21/ym99REYu7R7vW?=
 =?us-ascii?Q?ESxglZXOyLvBIQy+qENG1bgHhCzk1dZ4NymcgplOkrQBFBmcMeoHuvDbKXTT?=
 =?us-ascii?Q?TeJZMq+i1rEeWzI2BTor0l4fhZeCKZHgtGTt9GWUltw5xKH1qNCfMZQNFTg6?=
 =?us-ascii?Q?vFVnCJLFIGupcJcOoMN0ln9WVcMtR4xwnX6PYl1YqP0YvFuCJ6MMcdkoogCZ?=
 =?us-ascii?Q?s3Q6xZ8SYZRGZ98qIuutPm+X7wMJhy4HapIWC/mFSNOP4DX2bIlqJO+UmHkC?=
 =?us-ascii?Q?ZSc19dsTI9GjjG3uiC1ilfSFkHlFFeaEnQZP5maf1FPoWZLA6DwonN8dBxbz?=
 =?us-ascii?Q?z06+CMP1Y6Esb+uULfvpz2CcnohvFcc=3D?=
X-Exchange-RoutingPolicyChecked:
	Vonl0xB0nY2ibY0xInpMnjn4eLOQdJeVLXFCZzL6A+Cuv23GpIj+kQ5i7cg54UztMyOz5zXMVSU7m7lV1F0TFteOsj5+wVTWjxIFqMt8Yo+ph+nHX9D1Tgg2HJ1P24BoyHAP/S6UD+DgUYmSEJQSrnQZX9bsVhtrbsTGY8Pw2GRKw886DTYq/jDr2sULCo80fvYKURO9+ras86Jc+Z5iPLRyn5D3PURLGdxcqLln3kd0oiVs/O1rxOHaih2ZBR/NhKisLq8yV3jaut0kqfEnecE81624Q4QDNp2LrjhLxBAtEu1djPUB/Npbyeb1Uxg9izNnq/nINbGjB+DTj2X+yw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pbQOK0Ba1UBStDPhqIq6j3XSuXtKIfkhYOga2x1rqJkpzRv3+nsyvIqQ0bKoskPk+0SR8wvwz22VGbH8cXodiErlwK5Pa6HXfkZf4C9ZnWp7hha7qtJBrpoc1NgGuSwwY9J3Gjk8NnJ6dDtAE8Z6qkPaf/gSPAMC0JXiB8kKhBS1PbiDoE40a1P4QiGHw8FAdV3X3zsyu0ZqtM6uH+8JtYC1qL9nmVDrf4TErWpYuYgaeK/Q2MwhU15keO0e+lBTHOi8rDnHTSC0qs24xUKDR2WZGLu9zOeUC6b5u9U9uI2SVh/Ma7LZ1xVQBn5FrcXix89uFjmSpU7jCAXSIrrwC6zN1a4g3D6ETN6Fd6Dn+L+8hYxDD0s6jQOlyOkdx1L/aY1tggtj+9MeJ8u1sw9yY3JAXtlXCXw1EohMemFq2Lb0qRtZHOUVIsW/oTsBRSqZnpbuctzn2/RyaWra45KBSQAZ1pkRTIs9BLK7qTVZMDdQ3v9peUTbRa6V8dSqQTVp+SJzSjO/n4UO8zJE8s1WbY48QdETKY5LwwilpVRcCJMvkaDNA4tWC0wHYWCHlMZfid/G8Ezo8R40OtnK3l80xmiGyDiMqRfEjmyqHw1io+k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a1f37f-8b9d-4c67-836d-08df24554044
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 09:27:48.0754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Avwk7fL7a6wWe5MSZTK9YMX35JZB/2vE/FG4yBEpO5F1ITC7HjZwxJIcB9zAFHHHB4FNnY1jVaqPkoMeUervBfEUJAWP7VbAPG2QA4csRvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6666
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2610070037
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX8iL8dxSBVc7e
 T+Wxy2CxMIpy7T+vgo0ji+A8d4z6jZegzU8MEGc+w4JLF8UBIi/xu3b8rr2p7O56Jv7iBfhQ5BE
 8GTGYTw6Nl4Jh696+h2pGIxcrXsVyyjY3mWiCXVhUkqh1y0cdHCT
X-Authority-Analysis: v=2.4 cv=d/dgWhjE c=1 sm=1 tr=0 ts=6ac6109d cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8
 a=FKZW_cQK_TKYGcRX5HoA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: pgNdQhxCmhRALHNid4X1NOYTZNLvpQNB
X-Proofpoint-GUID: pgNdQhxCmhRALHNid4X1NOYTZNLvpQNB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNyBTYWx0ZWRfX/EX8u0c+VClI
 Rvw6jbn6+XpAJof4QwlE+9l/c5sBkjZHqPpMNNfaER/nY7s02RNUWpnW46tzA1wMlpcCbO6IAN1
 B72hXn3TppwAelpV+YyB4XPUWOcZ3VOigrDNitkS6B00a90zimCbDqn9wZAo3Il/2M8hhJH+m/S
 Y5cVjC7T7LTUnCCj6LvhghcGIKgP2TkFAvIY4TNNE6Z0x9ZZ4WC+igi8PJJxP8vJsR4Bxvbie1n
 /YAlxK0qdUogJFJ6LUK/ZOYqyx3NXjZdNX9TosZYV8KfSVDgZJCgfMUILwRBvFVLtG1GUngCgtM
 e7FJUi+eEyioeatU2siQfUQ9Tz5oGpV+vUjgqE6TfdXRgSnGS4FlUUrPNYnE+jYvN/I352UGzOE
 fpQN2TVxVp1MsHs/5d4kcGq0ryPqtfqFb3Tl1KqSs+6wAJMNAICICdaVvUuY8Duej7sXmgt9+SF
 0pXEJ1//kKO2j56hWLQ==

On Fri, Aug 21, 2026 at 05:10:49PM +0100, Alan Maguire wrote:
> For use cases like PCP we require multiple DTrace handles
> in a process; to fix this ensure we tie global map creation
> to the handle and also allow BEGIN and END probes to already
> exist.  Later work can capitalize on efficiences like sharing
> kernel type info, but for now this is enough to make multiple
> instances work.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... with a small change, renaming dt_gmap_done to dt_gmaps_done (which I
should have done rom the beginning), and moving the dt_gmaps_done member
in dtrace_hdl_t at the end of the other booleans rather than putting it at
the very end of the struct.

Thanks for the patch - it certainly fixes a problem I introduced when I
did the BPF port.  Making libdtrace be able to handle multiple instances
again is important!

> ---
>  libdtrace/dt_bpf.c         | 6 ++----
>  libdtrace/dt_impl.h        | 1 +
>  libdtrace/dt_prov_dtrace.c | 6 +++++-
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> index 146a66e3..be8a4229 100644
> --- a/libdtrace/dt_bpf.c
> +++ b/libdtrace/dt_bpf.c
> @@ -25,8 +25,6 @@
>  #include <dt_btf.h>
>  #include <port.h>
>  
> -static boolean_t	dt_gmap_done = 0;
> -
>  #define BPF_CG_LICENSE	"GPL";
>  
>  int
> @@ -1076,11 +1074,11 @@ int
>  dt_bpf_gmap_create(dtrace_hdl_t *dtp)
>  {
>  	/* If we already created the global maps, return success. */
> -	if (dt_gmap_done)
> +	if (dtp->dt_gmap_done)
>  		return 0;
>  
>  	/* Mark global maps creation as completed. */
> -	dt_gmap_done = 1;
> +	dtp->dt_gmap_done = 1;
>  
>  #define CREATE_MAP(name) \
>  	if (gmap_create_##name(dtp) == -1) \
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 5282efbd..7db2ba93 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -433,6 +433,7 @@ struct dtrace_hdl {
>  	dt_list_t dt_lib_dep_sorted;	/* dependency sorted library list */
>  	dt_global_pcap_t dt_pcap; /* global tshark/pcap state */
>  	char *dt_freopen_filename; /* filename for freopen() action */
> +	boolean_t dt_gmap_done;	/* global map created */
>  };
>  
>  /*
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 4b788507..8118ab23 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -243,7 +243,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			close(fd);
>  		}
>  		free(spec);
> -		if (rc == -1)
> +		/*
> +		 * Multiple handles in a process mean we may have BEGIN/END
> +		 * uprobe events already.
> +		 * */
> +		if (rc == -1 && errno != EEXIST)
>  			return -ENOENT;
>  
>  		/* open format file */
> -- 
> 2.43.5
> 
