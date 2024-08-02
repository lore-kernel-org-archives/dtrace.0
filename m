Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D55136353
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722615508; cv=fail; b=Oal4TjMqSv0hnITcdI/EBIGJcjlqzs9LWqpyrAOfIKklzfa9OlQlHb97f24TWXYlvJyI3v9GV6AbwKau9beUHOsXo3R2ZMbYpqucoPa6hN33jdnKc/PF3mMc5g2nX6iRQzUVz+EMx1jKxw1cmuh2Y9kvV9DOjq2z1yksuSXp+aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722615508; c=relaxed/simple;
	bh=LUpWqBnaUBcTD/inlGnC/+5kyMKULrzOal1sD/MihRI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=sBOxD7o0bxL8lqiE6mHseVdTM616m8FgCaKjYmDtrXXK/fkwEYLelNreJ8St66EMHzYJ/UzBFtK7llCVoBYIZVZQesFdMbmJF1tpUjqwPKsIPmksRxzGq31zM3QOgKUJKuF2CxQSkQ9Xt8xarM8E5/FQqMsa6FjdI2qU80acPig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fTBm0qFS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VoCyQrtl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fTBm0qFS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VoCyQrtl"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472DGREt029920
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 16:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=rsNTDEjq9NqckbTy8a2r4S8v1mEFG7/jub5CSzSZZdM=; b=
	fTBm0qFSDz7zZQyeZwZMAyWjzk/zd7/yeTal0U/ZhxTRpM7aQtsD36zi4r5GCFu5
	9PuxRt6EJ/DyJlgbRDMQYgXogsARlaMkJYHd0xGc06t5XL+iLhXhC4U87ikyMevD
	4zrM2begM3fXiodjB9VUPdELHUi3yQNxp7/YyiMVFiRBCmlqjlFJIpmGBDXde0/0
	gPBnynIZncpvN9dNboiBd0Omwmj1JJemZXaefRQOO/cpz32X6arykdU1ZTk3DNFB
	4KbWFLX2X96lgHd4Kumq4KXd9EOygB1ohHJsY+WDgyPkENYnzUTvrVhLkt2GOc5G
	lytAq2jnRC+wwy5BYmiRmw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjg5hjq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 16:18:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472FxhaO002593
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 16:18:24 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c4ctap-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 16:18:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcffDHgCz7B+xUivsdRyq+CR3gqaCeCotN3lG54OOQtqjA9jRa0TUTP2DeH9Q4+7FMIT8U+VTdl1rJkb3wIqYmzn6one0km/1sOFBxM+edsqay0HXqBf9LPoV37nPPypXdelyzp39wSj8W7zcE/rWgSpcwIEsDli9DX1qJI+2Eb0ZPywwQtYBKdgD/SI38pZtsWVJe9F2O6m2SqYrSNq3zCEjLQopOij1pNq2r6SutcjVtGvWwcDM3B2fQuP9I097Htv/vyiU7u4Tlvn6JUDrZpG4Mnz0cJy4M4rhWWQYtd9l0jdAGZrBbXwaDdxNDqRuvn71wV8XcAGiKZIJXkeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsNTDEjq9NqckbTy8a2r4S8v1mEFG7/jub5CSzSZZdM=;
 b=pHssWLF8RqKF3zqRZdgzz7rQUP0beleMLBOnIpXyXtMI7b0d3GdGaY83t26I7ou6KCMTtqEBXIPG4ipnGbKNU7E5dGcY1VaXPazKMQ/SsNhFALiyks84ZKOIUibhVFD7meOcbRhloGkLS3pWQKSDc2sMAj155b4t1O979jYw1PoexQubj8h2Jqr5ADYIcqIGdRcW35r42gFfGN+jcmh/Ts+/X8cEN5ksFLhMat8nYQOYFHYaX938BQBAUYvNnaZ0XURjJTRnbEYE24J86Pzw4USy4JvrQIBUAoIwrWRS/Tk4juLLo7mrSAqDJN+pFepTxTiDg4cK2ufbm2oqS2gcNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsNTDEjq9NqckbTy8a2r4S8v1mEFG7/jub5CSzSZZdM=;
 b=VoCyQrtlcPf9tPkYQ+ISRW6eWqys6dMn4sOzaAQR9gCiaHik3/mK9aAh9GxnGFehb2fE0gTVAB+EpQH8fJhQtiMSGKV719lov6VAfxpc2MwikCmFNI4TNY1/O6T+FLBVO81KDgAVFgSRqVPzCgB3btbfKNWRQbmK21Xc+fbylD4=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by SA1PR10MB6662.namprd10.prod.outlook.com (2603:10b6:806:2b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Fri, 2 Aug
 2024 16:17:54 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 16:17:54 +0000
Date: Fri, 02 Aug 2024 12:17:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] bpf, fbt: do not try to get a return value for void
 function return pronbes
Content-Type: text/plain
X-ClientProxiedBy: BL0PR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:91::29) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Message-ID:
 <PH8PR10MB62922FA5437EE36FDD44AB34C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|SA1PR10MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f6c35d-64c7-40b7-e5c8-08dcb30ea9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HTccWAq+xM2RLXpecVijc94RtCXY1/VKvRGHwts8nqtFMcNsGk7YDHk7cwrs?=
 =?us-ascii?Q?O6tMAz0Z4mtUzkbHKj3V1tQhmBvUQHjcGqcjTrvYEBRakzBXeUT/o1DMVbll?=
 =?us-ascii?Q?v5eSylYhm0HizXEXAiKJaq7Z1G63AhAlOoN49M7uODW5TaHZVDmeZpzYOC20?=
 =?us-ascii?Q?rWZRa8Zrg3Ef8Reyjm464lekjomt2MZgpNUGTfnYXveLkb7nz/NuieXlCepA?=
 =?us-ascii?Q?tKo3/R89HJLkF7B/JkQWVM6hGYMMUraGnGCjmMKVTvoZO438nKLClmCY5/Bi?=
 =?us-ascii?Q?0sySpDuFkkP6XmpFbsMDBmObVfWishNL3KlCtqxa+nj14zpOv/I30HDDTNGu?=
 =?us-ascii?Q?NeXeHNqpeIOyEKsTxxhFa8iV6QxncWWW0zMqx4ZE2oQVH5VMSHRucJ8iLlp8?=
 =?us-ascii?Q?8DoqZY8wInP1b2x0/g5VgmKaUjnvOj/a6DOLQjvD8cc9ecyROubzEyKW891E?=
 =?us-ascii?Q?9NVlure6TGCKyf1ynEjkkT8tDjprHJz0DeJdPwVaMbgYBrdx2KvrCYHUdMrz?=
 =?us-ascii?Q?2WpuQZf6BkRpC9ZvCgvxXfzzZSUdNwRqghqotZQsS+UN9kDejGvNCXJBOvYk?=
 =?us-ascii?Q?pnAYwGUzbJz9QAMlnGM0cQjdA43PPu5Piaf7ZuXL84SVHjL1iKmGtfAi1o0Y?=
 =?us-ascii?Q?rkReU5g1OHKSzzMLRQ0LYQestnmVfyv6jALNx0gKOgBcZoL/FBIIrzdttp1T?=
 =?us-ascii?Q?+LSXbrUjprgavZPGlinrnRvFuOTa3I6dAEbbIhCPLticCGZNFKxMWMQB1dGb?=
 =?us-ascii?Q?mDykOoCly0kLeRc0vm52S736Q45nHS//v61NP5sUNOANo48IOVQmLLPTiB0c?=
 =?us-ascii?Q?t3Yjs02SjKsRdotCDOQqsYF2xb9QojVy7LFatBAN0z4oAqrgAFp9UkuuWWEK?=
 =?us-ascii?Q?TYNVkNWMZNqgCxE1YjzNWyfGWzhgzlF9EnFKpk9Wppix7howlEaz8neVR4fR?=
 =?us-ascii?Q?MeZTCJsD+vAlBgcq0uZ6TrVa+OmIWeqU2TWl2/x/ouNWIYeqX9u/PciI7qnU?=
 =?us-ascii?Q?hYYe/oljZ5tOkGv9n/4Yk688t8/ZyWXDlLTmnV7iedaZTZPHpxTn4eAA1Mys?=
 =?us-ascii?Q?M1HO3yIr9fEoQikLNE9jTiRuuVDsrtHROpjwIm3vFPJHVeG87XTRFrKImxow?=
 =?us-ascii?Q?kme5qpvjC+NL38m4r5q/j8myDGYbTkkIL/7Di9pKoogIkZOe4wmGtc4DDPGe?=
 =?us-ascii?Q?byy8yrNgx5EVNnSUffn/BBHDmisrEwGyxk80rHI1NeqAVpLXZRLcVKbuBSp8?=
 =?us-ascii?Q?E3y+xMK7zKZ1yqJdOtShAXgp3bZxtYKDK5t4tk0LXq/9pGxTG2qi4jmTSe+Y?=
 =?us-ascii?Q?UkdaCfc2PIAQzF2PGkKmhBsJQbV6/w3At5wB9YOw59Q21A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uZ0IzaP3dIDmKIazyo3U3d58VySo59to6kqQFN/WLxKoraVxFpPqpPeZKVvv?=
 =?us-ascii?Q?NDMqp3b6LOOd/dFsK1bCr+hqjrEwac7p6oCUzlakCfh1hPXgafphxYqPlblm?=
 =?us-ascii?Q?yHYQbeTzYnX12cQAGknTlKh7RQgrQd0N0heYlN9dei1OcIQRSyF2EyI7nl7w?=
 =?us-ascii?Q?W2IAC9+O+uiWwxnrdT/LTjDKyT1zs9hDKbjEkIN6Srjf8HDxTo9XvImJAiaO?=
 =?us-ascii?Q?fsPEuMicI2Hl0ubiQcNgHEPBWMbI2Uuw0f5yqjkp1xBVA8DpdWIPeu3cwfLW?=
 =?us-ascii?Q?swbV9I4TvcWVwY3wIYQliLKHo4GvKFLooD5pZaskeju2ifB7F4VIuLFAGLLa?=
 =?us-ascii?Q?uUJlf4p/nNdX7+fyvr36Dk0N8jDCj+bdk+RWYb8Yh/VArIfg5YoZ2Tq1mEie?=
 =?us-ascii?Q?sfb7Zdx7Y7PwBNOseEzQjvm3WxIpibxjdMqTWlOjlBPOxlQcJLV8GWlEWSeT?=
 =?us-ascii?Q?dTnzKgUVtg2ao17Dj/EYh3TvLynHMeTI7lNWhfxdNvdzDfPOnl+KGyAa7Pz1?=
 =?us-ascii?Q?dnIAOVZt9UjUFflfdh/ihZhu7sBNqca/73khVF2iyDHaXo+jcOZ9KCQD5mQA?=
 =?us-ascii?Q?E6WMwcTJ8HCEg9nrmJxWYSlQH6DVq0fczWKA/OKK4u4sXKMAvO4VAFGDXgwv?=
 =?us-ascii?Q?BstLrKbjGr+GjbpbaFrFtPFpxT0PVsFS6+YSbzJta8ty0XRx58nByr5UgQ8o?=
 =?us-ascii?Q?XOJaXlwR1GLQm+V/VvfDJtw/l83OsFCuBzNDuGCatbSlJqFFtYODUbS3cURL?=
 =?us-ascii?Q?Yol9RHD4yXue9PlgGFHuP5GupoRkIx/mB8hBYEtQ15khS09BlY02VojZQZ41?=
 =?us-ascii?Q?rGL1fKNkX9XovSqUefclls1bnk0+ajJ6Vh6NdRfKAqM447NVRowb+BM61NEY?=
 =?us-ascii?Q?bRpJJ1Ifi5elBS4HI7fLaOS49VlCALlQJwk5tpfmOk44FoUWoqSmIAuVOQzM?=
 =?us-ascii?Q?Ns4llU5FB1TmXaVmZvK70wkA51zL9l2Xk3DpRwOmSBXdwsE8oi718Gl6xOmT?=
 =?us-ascii?Q?1q25eDOLHRr0/Wf8AnzbrrFk3G0L1FWM0sCG22GyKXleM96oA58cUAbylkCH?=
 =?us-ascii?Q?kpAunz3ntNHOhSq5dEhoue1h/ouHl0fvM5RN+wXamXEzIuenb5i6ia2IwANl?=
 =?us-ascii?Q?6/GDTck6WoJVDIupAYfuXalyRSw7nB0ieYbQKuvjsMqZh2jNctPMgjag6aBc?=
 =?us-ascii?Q?/IuLIke4v+Z4Uj7D79aMBct21/rHlKzRhj1C5SFR5+5IrF9bQtHoI+FJ5/Oa?=
 =?us-ascii?Q?12Lbxu6LE9rpD2jFy25c3Y5Pj3BU+wHjTP1sGI+jnOQ8E/PBPgTKQ6N0XmXo?=
 =?us-ascii?Q?u9xHyYOGeGjI07SmD3g9PfJG9I9x+72LbzaxSTf7Fi9+ZjgCzo5o9FLKzLeG?=
 =?us-ascii?Q?9hZh2kGAXlUxDnZrfhVpZUytm4g5dYHN6psqkczjRw9Cl4SpZLZgNQK3BaH4?=
 =?us-ascii?Q?WXk+QkpzuZIvylKaWLDvXlNEWf+b6VZTvQcJInAelzINrxrnCLRzEtxY00Uh?=
 =?us-ascii?Q?w4iLTG9+x4AfN6xVV5GO0qsYzvvrEagPjCBbu9Q5cnh+/UwhKRKRKmcx68iV?=
 =?us-ascii?Q?ws/MhH6k2DlpFgVj4hLd/yBvyovhsf9hDFK76B3eaK59ENv6gNOUuZTxOi/7?=
 =?us-ascii?Q?tT+UhNWW8RaPHknMGB+kxqA=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r841jX9F00hBMiRYTCIaS64Roql03rhnvo8r9+JA44XmKPOkKay1rI07xjX/XMSCMu6aphsXzXZVk0qdXdQ2FCy/d5QQRk2l5mBm1K1IC38aelb5NwRan80zA2P/wrDWXox3G5FC8TLLS6hf9RwGU0t414vt3PMKT5HVYhq9BaaLVecywhy+AIKfKPIfhYxxSXLpOJ+1SSMnPFE8qrQ+jfBaHzj6YGWxxz7CyxQCg+gv/HciK+cn/XuiF1x1mEnBPzztqhU1wXiPaTRgSNoDrhZDH3sQ/Z8xa55cFCM7euCusuaAvquXy63rD16AO6p8nRG1a5w4Ty503d4IeD9o4OT49+9ORcjKkEDeKOrejW+vUppHoOFhc+NTqUwPjAifBTng9AXuF5XYrZriwufPTQORlZYiJvLVq/Y7vMDU1ZvyqvrEA07Gg7dm2BE7ObXuX0R9y6tANOXBK3gfgRHSshbhpVXTyX9++IgY2nb1sx3xHWzAwImYGmDtiKxUrxbAr/3VEHKrBUZuU7/P4eBbtmoqJybnbPZ88AJpDSU5cKaPK3Am9tzu6taKCvhT1NG9serNuPrxP8nSFpxzd77MTjJURI5k5SGWyLSTcvfgcHc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f6c35d-64c7-40b7-e5c8-08dcb30ea9c4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 16:17:54.0242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dTFxJ4LxO917IXAnp3Br78574iqO9IsUY/jYBl4iHqxaej/eBVrZJLm8HHmsN/I/uhgRBJckDwXbzklXOciXqh5xWL6UlzDAnOd8pyQ1bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_12,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020113
X-Proofpoint-ORIG-GUID: b9a71KvcAgDxS-GL68GCpHKnm8vjOscm
X-Proofpoint-GUID: b9a71KvcAgDxS-GL68GCpHKnm8vjOscm

We were trying to access a return value for void functions, causing BPF
verifier failures.  We can determine the return type when getting the
probe info, and set the return probe argc value accordingly.  This then
drives the code generation in the trampoline.

Reported-by: Alan Maguire <alan.maguire@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c      | 16 ++++++++++++++++
 libdtrace/dt_btf.h      |  2 ++
 libdtrace/dt_prov_fbt.c | 21 ++++++++++++---------
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 77366df6..e905580f 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -980,3 +980,19 @@ dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
 
 	return -1;
 }
+
+int
+dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf, uint32_t id)
+{
+	btf_type_t	*type = dt_btf_type_by_id(dtp, btf, id);
+
+	/* For functions, move on to the function prototype. */
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC)
+		type = dt_btf_type_by_id(dtp, btf, type->type);
+
+	if (BTF_INFO_KIND(type->info) == BTF_KIND_FUNC_PROTO &&
+	    type->type == 0)
+		return 1;
+
+	return 0;
+}
diff --git a/libdtrace/dt_btf.h b/libdtrace/dt_btf.h
index a7cee464..e05b30d0 100644
--- a/libdtrace/dt_btf.h
+++ b/libdtrace/dt_btf.h
@@ -25,6 +25,8 @@ extern int32_t dt_btf_lookup_name_kind(dtrace_hdl_t *, dt_btf_t *,
 				       const char *, uint32_t);
 extern int dt_btf_func_argc(dtrace_hdl_t *dtp, const dt_btf_t *btf,
 			    uint32_t id);
+extern int dt_btf_func_is_void(dtrace_hdl_t *dtp, const dt_btf_t *btf,
+			       uint32_t id);
 extern int dt_btf_get_module_ids(dtrace_hdl_t *);
 extern int dt_btf_module_fd(const dt_module_t *);
 
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 461d5e35..80c3db20 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -199,13 +199,15 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 
 		/*
+		 * Only try to retrieve a return value if we know we can.
+		 *
 		 * The return value is provided by the fexit probe as an
 		 * argument slot past the last function argument.  We can get
 		 * the number of function arguments using the BTF id that has
 		 * been stored as the tracepoint event id.
 		 */
 		dmp = dt_module_lookup_by_name(dtp, prp->desc->mod);
-		if (dmp != NULL) {
+		if (dmp && prp->argc == 2) {
 			int32_t	btf_id = dt_tp_get_event_id(prp);
 			int	i = dt_btf_func_argc(dtp, dmp->dm_btf, btf_id);
 
@@ -240,7 +242,9 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	dt_tp_set_event_id(prp, btf_id);
 
 	if (strcmp(desc->prb, "return") == 0) {
-		argc = 2;
+		/* Void function return probes only provide 1 argument. */
+		argc = dt_btf_func_is_void(dtp, dmp->dm_btf, btf_id) ? 1 : 2;
+
 		argv = dt_calloc(dtp, argc, sizeof(dt_argdesc_t));
 		if (argv == NULL)
 			return dt_set_errno(dtp, EDT_NOMEM);
@@ -250,13 +254,12 @@ static int fprobe_probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		argv[0].native = strdup("uint64_t");
 		argv[0].xlate = NULL;
 
-		/*
-		 * The return type is a generic uint64_t.  For void functions
-		 * the value of arg1 and argv[1] is undefined.
-		 */
-		argv[1].mapping = 1;
-		argv[1].native = strdup("uint64_t");
-		argv[1].xlate = NULL;
+		if (argc == 2) {
+			/* The return type is a generic uint64_t. */
+			argv[1].mapping = 1;
+			argv[1].native = strdup("uint64_t");
+			argv[1].xlate = NULL;
+		}
 
 		goto done;
 	}
-- 
2.45.2

