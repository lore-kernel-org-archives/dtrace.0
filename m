Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AEF1A0B16
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476657; cv=fail; b=P9ZqKVmVTVxQUSssNLw+7wgCP7nARxk/ErXsuIr/bhZto4wVCwoxOK27vhDUXRzuUFZndXuFRgcjroPsBg96nbqAV3sTMRdmH2phcv4sbSuPA5oXXpJyMJFO3G507AR5rzZfvJ4awOOQvsNoE5Zp9e6pRqGcQRNWgVKIv+ajIpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476657; c=relaxed/simple;
	bh=zeAW2aZhxBGe9jLeJVQvbjNQDVCoyqkwSo8tchMso/Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S+ajSE5pfwEHL6rxS3VJ+8KSz3SGsN2/YZBpHEs+XA0gmIQ5cAHaTl0HPbei4zGFGCDMfVGAWLugcfckHPrUMAVNRZfi0ig9VQPDyzFklwKgRxp18sZzPbBfVMNz/umeh2P4H+MRckln7a90gD4hWepa2t8x0r1jxNiYbQArJ4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VW5DXASI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ikSpg8bN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VW5DXASI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ikSpg8bN"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EuFxP018982
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=DXO2sqQmb6NHg/4vCrlQmhBvCynPvmfWkA9enVBLNYc=; b=
	VW5DXASIW9RvtZoCUP+mo/vxYAhv764RPnE5xLz6jQZwI6QqTGleKsK06DfIBMeI
	l1QTfimDuK//vCcYjVLVVdrXQmW0a84Kl2jsVYN8UNyhg/Pg81P/5iE8zDIU33MF
	HN+6cYtT6IbG6Sb+oLEkZGI42PXujMAY038s0kezh2PtPTDMmfglUMpyeXFebYfV
	Ci66/Xcgfql6SuQ+cyrzkx4DWRCucQ/qiRlCujrY/zlup20oA0k0j0no2PqBojYI
	8Uy4hktmd7wQtMnMQ3zUjzKow7k04elfzwih/mXAFEFOzSzQLEW1k9CBvgCGdAwQ
	7zHJ9FId0+38QjavRcamDA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmmpe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1FhYlt011821
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnagq52q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njxWpmPl3/ucyvZ8pJKnYw3L8APncQIewF0COCMZFVt2iIf8WkDARoah8QQ5s6faqEcQIRnifgZk6NY2a6UUiKvnRJaaYztAmMv+iAqtAxfYiCexw35Z8D3jmJlrpJufCav2pGfDUT1hnAmhxnIL1KJr46Kf9ipLU5bnwB/Lvv9ziIzwRkIIvCv3plUmpQ+Ze2ZFYEsGXyM8LUf65S/PMHr4mSbNwlPU3GbHk9GTUc2RK69pJS+2WQsjjm0g45iODPbHE7K61cpdNAIKeeDgYRNOMTwoGCWG2L87S9SqRuvt0NeQOZaNdspZOpNiBPIjDixikUYDtITq4NcuPbwbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXO2sqQmb6NHg/4vCrlQmhBvCynPvmfWkA9enVBLNYc=;
 b=RisHXpx+SSgKLHZd2endTPBTBPudn9v0mDmSU7CvR4L90kLklW/bXiLAid8OATWM2KMrprNUyzlLRUTncuPjd6Asr8jUlSlgbIpmg4MfxdYgfMGELwfOAlcc+c1UYMFLHFgqw9wXBSFORCz+inNP/TZXgfo17EqWB4s6RVZ7Qot4pCuqb5X+dL2gfb8MBW5oOo2fGOfhbwUjlSfLC4ne3o+MDh/G/BjZwAE8GD3f68VhbMT3258uTv7H39Q7fKPx9nWEKm5dgR1ghroQIP6IKD3NJ24TPrhSC7AqcAKgks8o1pBtGQIur+5pQgOCRhipZoMSHR7inXxDWh0lCTHmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXO2sqQmb6NHg/4vCrlQmhBvCynPvmfWkA9enVBLNYc=;
 b=ikSpg8bNxeOxt/6ZmMCXN3n07dYZsrwx1hWHXbt0G3UxtJUIb/mU7FHWVyfVpUlu7Z7ESyduq7Kc+3vpwnzmieRHEy2tCt4g9yM1G+k4t0Xk0LWPTF6S4tkXJe6lNCZGAPMd243u9qoOCUKAMCspfRfnof/pETmEv2J8z6fjwok=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24; Fri, 1 Nov
 2024 15:57:28 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 15:57:27 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 3/5] cg: add argument mapping in the trampoline
Date: Fri,  1 Nov 2024 15:57:10 +0000
Message-ID: <20241101155712.397674-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241101155712.397674-1-nick.alcock@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0421.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::25) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a870dcb-7704-4443-6158-08dcfa8de285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nntISGByCc/pUQcqAoCg8Y8MajMjunYozYKLv4eT0pK1Vu7pRuVISeDfnwLx?=
 =?us-ascii?Q?YemMUaTc9RTE7I+DXchO+PZZcg08ASgIEwFDA0QsgAnPzbn+TXL6Bw+1WIOV?=
 =?us-ascii?Q?8D3zgnyfSf78c862rf5bNX/sfNhQ0+1b8fYVz7+w6/thpVaJGGofetBAblco?=
 =?us-ascii?Q?UlqUS5c31yTDgDNvQSXmwT2039OnxrX8+8ln9KkxOhoEoGT7Fhshh099+C2y?=
 =?us-ascii?Q?m9tWcZdKgxYSsnYrFKR2fLLS0qC7mo4KEbl30MwFn4zaz6S1iipFZmkNjphI?=
 =?us-ascii?Q?xcrQrmWKMSpsgFSB53ukJXdmg+m/jlREwCnuQ8YX6PUfc8+w6JnPkaedE2hX?=
 =?us-ascii?Q?qU8uXOW34pifA61MveLqaY+g5zETJPFfPWc43m4kNeF4j2pPkyRVn9FcvikK?=
 =?us-ascii?Q?vEoYWAtL9sz5FagR5t8KOMaU5zxqVMQGs2c1wxE5Y7FLnS4cS97buklejDCu?=
 =?us-ascii?Q?Jw12skJC7SiH0O9juINO5+YHPUSRnMnGVTwgCeWi0YUpS4sjZiZ3ZfxTpyXC?=
 =?us-ascii?Q?9h+wzJB1mMJn7zrCaTnKc8lP8rq8dfoDiQlVCqdmziV6lB9MPnilmdP3Cknx?=
 =?us-ascii?Q?jpJl0SARYIYeGuDp0S/IbfZqgTnxEW/B032+iRXZC0AmKCodWJiCJuXkNMvA?=
 =?us-ascii?Q?CN5/bdvK6o8tCOKK1LK3KcawRAg5xIrFSJ0kC5UUfTronHa/Lo2vTm2c47ia?=
 =?us-ascii?Q?Rmogd/Iu4aamvKXfp8ZxmEP+1a788mdtOLZt0l6uY1Y9Dmq+DapCUUb0Avle?=
 =?us-ascii?Q?7YwFkrEvMUL6qJ7mjv3XcBijgpIKEVcKMc86K1hVNSv1eYKuFHw3Su+MvkST?=
 =?us-ascii?Q?ShkzHT5gmLF1eRhRmdYKk5CWINTCLbM4FrlX0SRO6+tjKej6wRaDs4T3BYhW?=
 =?us-ascii?Q?9Gp6CHSeJOtblHFOkVCaBD427I36YPh7oE45S6gRa/7XFrFX2BQ3b7Xu9Nsv?=
 =?us-ascii?Q?XY2++YuIOBjOgNu5FVr7bRvIXaQ8LJothLqdS7/zGqhHjSqI8xImXmN8k/uG?=
 =?us-ascii?Q?Z4hrsMlweEseIZdQ8Fpi0eqINGAppShK4VKBF3z/fUa8Mmv/9oAnbW77I9as?=
 =?us-ascii?Q?uk6Fbpx6rNVWVYMlsgzHPwCKAERFnvWsW//yvdmfP66O9p/eRUG//U3jb6k3?=
 =?us-ascii?Q?48c25nhES87GiIHawtCErGklRzm2kC07L4YqfRT1/KZflmjO8ijvjh2kuqOc?=
 =?us-ascii?Q?NosFB1VihBBJmxOaPiJjfcBPkEr9ehkGjhUhkeFQrdA5mUThP1lRSPpQ2+ZV?=
 =?us-ascii?Q?gWamLRmWLUYm3PmicFdlvfY7gG3qPnKf0de+cR0h9fuhGe5evtEqPADG6Dhc?=
 =?us-ascii?Q?HemlQeHLWMtHNafUokFjA+NB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mBm5mvYUMcSNYTVEgMDc3fwT155dTW5leqk/CxKNUCmkzATh47BzeyKjbCwn?=
 =?us-ascii?Q?6vglji4mS6G/CjyPTI+olWLS0Ue7uLAMdNtcdlOXQuLIwGqg96R2HjtzACKn?=
 =?us-ascii?Q?D60XNVyZ4LtkPvwk4b/HKFhYhU2nkdxN9/GZeUhcGghU3DKrYTEd1n78eZ74?=
 =?us-ascii?Q?Z0lssajDu4ZYuAP+k2T7K0Y5Jw6GXSS+h/N4KI2pNkzaq0QPwh+jQ0aCn2b6?=
 =?us-ascii?Q?yCN8TXOFghNQ4Owt08iVf6b1zS82V1hqkpCQBYqfcbtKofkWIrOyAuleolUF?=
 =?us-ascii?Q?tEtXGVjDBvnUZsWC0E6aw+IaTsH6iSde1aNNw1122uM5twJPgJdoI9ISK78O?=
 =?us-ascii?Q?MpUr6kOG/Pi0Mo0bLeQPI/C8psow5MuKk1IYRoikQepJzvHWTmHOiQN8U+SI?=
 =?us-ascii?Q?SpVlf5ruaw4w0ybIJEaP46HNr7c+V88Rvi2uGynFGP5xKXHZaHJoyfk+FLKG?=
 =?us-ascii?Q?IHXPSH7rGQapyU+KQm1YcYh6HJ7wgWMHT/n0SGEGXU35K4mXma4wOGUGWhrT?=
 =?us-ascii?Q?FUFJyTRDWmdhZIUeOwS1nTBI8dL+ZrSH8vzWjLmHbfXJBo0iji4foTvRRE2P?=
 =?us-ascii?Q?0Adqq46JwHLL+oHYcEP65+6LEBQNQ5hRXYuOwgkg3QNtilWQfqcuyaPJbCK5?=
 =?us-ascii?Q?VE32MTI2avSzKdQQgAhZtO9mSwZUYzBhdqA+6ZR3I5Q6iEe3wopusZI7URFY?=
 =?us-ascii?Q?JDo76N1Xed2kgXT9vVDwdscPdTBQSRuJFEVwRDLHONJ/pQytp0eEpS0psRqS?=
 =?us-ascii?Q?lWMZJNXcaQ7z76z9ATZ098hi+iBcrs5a8+rWBSGvnVp4Y3+DcGMM3isrBMXE?=
 =?us-ascii?Q?JHCgw1soCX8EcQaZylLGwkAiIMvUQ1JUptLW32Xm634tVaW+QL9fDLZY7lkq?=
 =?us-ascii?Q?wB1Mo2k5+nzg3SzKJBkk2Kl8AjlVqiYFV2B25/k4kEdzvAz8fSrSiuqnx5Cl?=
 =?us-ascii?Q?pdryXDkOiy/kBjRGkPdwetaNzD1+z9E6pyR7V1kSgOGCS6V4Ctoy+G15MgvO?=
 =?us-ascii?Q?iLQAzzburvqeY6tGfNzoNg6JIjF9jLXTDpNfwr4RVhGqmh/Wg3RnQf7vykp9?=
 =?us-ascii?Q?gtqA56g2EDgbt3NlBRirrGU0DgnCtfbCqsZMCxKvtMwifdmynNiNyfhQ8/Xi?=
 =?us-ascii?Q?6mC6ka+IC26gvZm1mnG9+d29HkfZ8zGkiC9+95CaI2zvgwbSS7skWwrjI/vy?=
 =?us-ascii?Q?isYXBQyTvgUdR664kY35O0aBy1Pdm4PHGQVrztgcrDJ67+FXf2rh+I8xmEb4?=
 =?us-ascii?Q?15v7HuJ6edT6Y2jeHqvrd/MO11ygMbGU9iUtekKzllIQbgCt1R58Q4eozXU9?=
 =?us-ascii?Q?W2Qjh6MLDuljMGgzeu50Ju+pEMoFZ1VPWAzoPGhIspPLrFniecbqEc5NhPez?=
 =?us-ascii?Q?ei9iex7FZWSODrIGqWEpLSKpQ9QG0enOOGQbJ1PVJ1HvRCmE6tFllQJgyMXK?=
 =?us-ascii?Q?CIGBjAjehYRepHNWh4UyfVF1W2LLXMF+kPxOxmqdgrBtf6jJMA6OTra1+cMH?=
 =?us-ascii?Q?P+4f0mKNVdjflTLm/PLA4phf006xqVnWNi4f/Z+z3nRfKIEKOJ40jO8ZOR/D?=
 =?us-ascii?Q?q6CJzqKAdTqLyFBoNexIBu5VZLIOcQAax7udRY4h1J/wbYq6k0aWdSHF7AAR?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E31gkyjLYae1PR3bWIH0f5ENc7SPZ+5pQM8eNH+IrCrMHqSHvFQDodCwOxnxX8p6qtVsUs08BV3qP9+jXlI1qRBJWG6VseRmne5dzchJI6nKR/NqLqNzNQcN8Qh3FJy81LI1EM97T+uHs1Sj4TZ0WhQyZIltIohmDrc+pGyaTLsXTsgEHPSZqf+WFr1NruPr5NVHCI5WAzRJu02mK3qDF1OiIb6JtHvPF1MGGbZwqm98lL37phrNELRzhYGML2do6Ed1EhSlgXk0GvS82M1h1MAWACQJjS+yrQVX16uxuaVT94zz6Dk9H6lQIIAwIVUE8gMgftqvAi6RwMcEemseaLIsOWw5rDXXrTUvytIkCxHFOotoWx6AUK2fj1tFt1666DUDA809Z4Do0KN7DIvR6VH8sU1l+DKu5DA+DMkjQ+F2FpUaYUG5KFb2B+3ljumRAEOGRbJ3/Xuq9WYBMt27JwNTJfkL7Y6e11KQz45D6Swf5H9GhO91T33yB8q4odV93tcWnliCcEcl8AVY4wKo5xoSZp912pCorx0RKUjIm7SjLxlbi+vqXGmkMRThIhoWRn2os5UBxcf6df4ywSC/l4ZEZMwD1wM9iuc/SmB/Mj0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a870dcb-7704-4443-6158-08dcfa8de285
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:57:27.8755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8uswsMyxNgvJcH7mP9zR61IhIZVmcPI2vDOhVRVFkUFhY7xBzPcKeLExo2aG+b3Qj7mSFtxWWsdc88oy8HSSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010115
X-Proofpoint-GUID: SQo7NusCYVS7AhrIGVknVa0lsYYSDmwG
X-Proofpoint-ORIG-GUID: SQo7NusCYVS7AhrIGVknVa0lsYYSDmwG

Before now, argument mapping was restricted to the args[] array, and was
implemented in dt_cg_array_op in the same place where we decide whether
to automatically copyin() userspace strings.

But existing DTrace testcases suggest that arg mapping is also applied to
argN for USDT, even though this is inconsistent with SDT and arguably less
flexible than having argN be the unmapped arguments in all cases.  Add a new
function dt_cg_tramp_map_args(), which can be called from trampolines to
apply mappings (destructively, but it keeps a copy of the old args in the
save area so you can unapply them if you need to).  No existing providers do
any mapping, so this is not yet called, but it's about to be.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c | 36 +++++++++++++++++++++++++++++++++++-
 libdtrace/dt_cg.h |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 39c27ab0ec0b..b90757bcb5cb 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -831,6 +831,35 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Move arguments according to the mappings in the array of arguments given.
+ * The original arguments are overwritten if necessary (but saved).  In effect,
+ * this changes the native arguments: the caller should adjust the mappings
+ * array accordingly, and shuffle the native arg types to match.
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i;
+
+	/*
+	 * Work from saved args so we don't need to worry about overwriting regs
+	 * we're about to map into different positions.
+	 */
+	dt_cg_tramp_save_args(pcb);
+
+	for (i = 0; i < nargs; i++) {
+		if (args[i].mapping != i) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(args[i].mapping)));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+		}
+	}
+}
+
 typedef struct {
 	dt_irlist_t	*dlp;
 	dt_activity_t	act;
@@ -5060,7 +5089,12 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * array index according to the static argument mapping (if any),
 	 * unless the argument reference is provided by a dynamic translator.
 	 * If we're using a dynamic translator for args[], then just set dn_reg
-	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
+	 *
+	 * If dt_cg_tramp_map_args is in use, you should apply the mapping at
+	 * the probe_info stage, since the effective "native" arg positions will
+	 * be changed.
+	 *
+	 * If this is a userland variable, note that we need to copy it in.
 	 */
 	if (idp->di_id == DIF_VAR_ARGS) {
 		if ((idp->di_kind == DT_IDENT_XLPTR ||
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6a8c5..fb26c125adbc 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
+extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
-- 
2.46.0.278.g36e3a12567

