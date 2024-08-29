Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A877B7581F
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908989; cv=fail; b=XMZhUeJudmtx3heVdADvjGvpuyZRlyOgynzk9j8QC7jC0EdanpbY3qZDptUSftzmmfThcgBeAPjtRl+kMoPA46PHWgoR78pFDGcwpRSit2lJCF372UZnsKKwHOGZaosdWmuEYnybQ+1vdvyxCIHKp+lmYTi1fagYGo6NWQt3Z5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908989; c=relaxed/simple;
	bh=ZTMMM6InOZ3dMrG0LRMS/IMSWWqD9Lc2ggHokJlV4yA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c8RaBk70sh4b7lOjhivlbQh4wsgr28TSsnAz87UFGaoEGVbOHKrqLttpiP+UzK76NuMWxzg4KC30G/t75XIPPIuG3+ILlInvYEumNfZjxe246Ep0dh6B573RuOsCE4GVvPru9gnb4e+SKe/eG5NMwJohO9rRnzyesw5ReNgYLz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=icPVo+XC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nXJWV2Wv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="icPVo+XC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nXJWV2Wv"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1g0TY000310
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=POb9IKtAgqwcOb
	o2cpdWFhceRlgtP3D7ponshJBC1MI=; b=icPVo+XC7xHPqr4cgTFyQp82dumvf9
	rGJ1LP+6iU06UlIJeIo1t64l63EZGYawIwP4aPbx/wSpub/xoqe/N0FSdOYC3rtU
	ZNxxKubf/U3Zsj6BIytSgEyfXliaGkp0FlPAsABk0Lx1EGXD3sVjLDeYUjHi8m59
	hfGM3GwFIOkGJPsFvbbABza9uNm5ckwK3QQyMIfsWkArozZMDfDqqJ0qqGMUeIJt
	GGb3rXqF1aeWoHfR+/1RDtXiCCkSMDKAUZ2/e2wQ3DhhrVnHYH8l7on8MQ8Ms8NE
	PY5J9Ms7/ng7WDCg3V3/jtalzV2tHFCr0lUK7l4z2lQs76Hd3Ni9vIUg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4TmF2033131
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w8166-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:23:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvtNaJzt0GbwqTbXoVGQiFWgRRFfMyRnZZ8PBhxpaf7oaze6wAJhSuoryilNX+g7ywxtRf2Bo5b/sO8XwN3bOiD+lRvZRAaSMitkyclS3IGn/WCLOzrouW8AnsVXP/iPmJsUdLc2Q/fAnQUbFl9Ln6p2DVkbSSSEgTjnhUiApT9/bG4uCWIYnCd1bmoTiil9QhQe+gz1ekbmXIyANbHTUnPEoOYvfmEZSR4vv3VlMPAZ2xnLr+x3ZPKKvK7phFhhpCu59EkKB3+AaKIBkoROHZVjMkbVYcZWXRZl5672mW0+B0gcph/Ri3zzkRt+w7eQ9NDFWuPn2fC6jhYzhgomdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POb9IKtAgqwcObo2cpdWFhceRlgtP3D7ponshJBC1MI=;
 b=zLzqBp3PspnMe2DtsLOfnnYa6BlmauK3Y591074TcFo9vacmgAImDOQ24ENJ2rF5iVjx8/urtAR1QwSmbL3JUQLkVN8tincSlAEBFq/ciPQ5n4ekDkMErG0HIBJS+X569hrVN5TbS9aL79nLFLJe5sres77qanFsOZUnJJpT/InQRl3jlwoty0wvCZdjI3a1ccXKahI8gqDmS+atEUMw1a3HGo9KyngJPq3Y86PX07MjJwdxErtGs34COXuQ7EdhaSJX+trCCaZro2BddJwo7RWcXh7aYwNHiRhiXQlsvKnqemgU3OZ14WzhviD1iKT4zsBaRMrPBFaXkIUWzeZZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POb9IKtAgqwcObo2cpdWFhceRlgtP3D7ponshJBC1MI=;
 b=nXJWV2WvnrJKsnIxg3JbFnMhlZQqly+T/N0KnSZBafepED5v0SypzLPM2SIyksAyHOb+uVi7lS2721EiqDaUmZXHJQxJeTu8dGv0ELzX4c0Pw9XeKr8GKWGdvlKNaiWURnpe6gF/xL4UNUptfK470IE6oGy2W03oC2HSM+guGS8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:23:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:23:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 18/22] test: Remove tst.DTRACEFLT_BADADDR2.d dependency on specific PC
Date: Thu, 29 Aug 2024 01:22:15 -0400
Message-Id: <20240829052219.3234-18-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0694.namprd03.prod.outlook.com
 (2603:10b6:408:ef::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ec4cfb-a1c9-4af4-1bc4-08dcc7eaa779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w9fDxzW1p0fXSWlCSnVfuwjp601lWRh0AaG1NmrTgsUrEAbj6KdjFAq0OJhT?=
 =?us-ascii?Q?6OCHShyQMH5CMA3EU8xIn1frEEew7zCFwxbxr6G4lzCmzJQ9LeCgSvaCcYdK?=
 =?us-ascii?Q?04lEw9RCWBNECB6E5SCzZkTUb9dIvwF5QdBnBYn0ikwVnt0y2O77beayuAMU?=
 =?us-ascii?Q?mRM/W11vLqflkFMFC2f+1iAuNYBj4YqXhNulezuylq6cVUpCzWQSymLvrN49?=
 =?us-ascii?Q?kkcRsDAeyIKHE7ZBPqVcZwr2TeN0IbusxxcceR41a2wbtzysIVYHQwNiYefZ?=
 =?us-ascii?Q?Z2Ae55fErI9BFFFJqp/PivJ39mgrVJBl2D9KUIVocBFzK8qrYTTRoMsCfpra?=
 =?us-ascii?Q?BifnQX6eFw2WvGL+EVf4MiK2rm4J1PoTJ4Q4XaKilEnXTAObL7BVIT1+Z0uC?=
 =?us-ascii?Q?X6FkLEkl/C5bqyU/091sHniFIrhBZQV83OSeYl+inyeEttqCWDKrMM1YILCk?=
 =?us-ascii?Q?QDA8im9+onmJZl7WQPypZWP/EE60BSIWvU39JPh5SKzZXYR2QCFrdlmC/WeM?=
 =?us-ascii?Q?zSraNh+anUy9835T41iHs7yEVnkxAo1WtD5pgE2BcSsUGzrzbzEVrNrmReVL?=
 =?us-ascii?Q?6lU29arJO9yTpx6uV3YgIuaq6RWjNlld/rD2n53Pp0zRsApZAca/1g8Tpc18?=
 =?us-ascii?Q?oLZOYnekC4vgBpSsv7jyj9AXAnjhK17nO+u+L3r4JFwatHIz2cE0otYopMF3?=
 =?us-ascii?Q?dmOtY98L8jZx4Mh7JDNhxXdRkBXvFIoEhvEtUlsImSvsx3h6bpJE/h3+MjM/?=
 =?us-ascii?Q?1HfzVfDy67KNkwiI2PFSiNlSGhvT+9nfk9peImTufXSYbMy8IDGAZzW1X/Ba?=
 =?us-ascii?Q?Y+1x4oYmwvwBdfNOWw7i/jAKE+V+0SHWlP4xLPZVUdryHIq7yEMlud27DUun?=
 =?us-ascii?Q?FIn5QE8RIQ+DQca0vW9vX/07lVQlfbXTUYF15ROetEmMIeAWJMSvhmoFUEPh?=
 =?us-ascii?Q?7o5Y/zgIRNr7eOdPpSxACJqEm505Zs/0p+IPIkCIfSeafFpURgWiegVb3SqD?=
 =?us-ascii?Q?JCkxv8SWftG0jpaaGQgON43Alohx3qgx6wDPtl0UtupoaFaZmD4kXrhDsl7Z?=
 =?us-ascii?Q?UFmgM05wSOYqLNZYW17rHl/9XVCWOI2NXwlwTFgcKe74oXWJLbWEUu0IT+fE?=
 =?us-ascii?Q?WKnrRe7PkQ2lJNxRHjAVlFs0DIZRnwygyL7Cg8vK0rpBALcE4w2jehVUZstC?=
 =?us-ascii?Q?9FYzZwffxget3XvTzpl4k0e5H2OXknPph1PVsmT8gPC3/hNtCPyX25Cmnes2?=
 =?us-ascii?Q?HzDP/Bfyhseq0XkZaywTNkNMc/pxUnXSm/2/5MOi53JbkJ7MYCIqsZhhxK0v?=
 =?us-ascii?Q?D7E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LABpFbWd3GF5gdVyekNkxKj6U+SqT+sXs0Ifo13iCVW0Fokb2M80G8W6UuCO?=
 =?us-ascii?Q?fWNlPvlxQ7QPFGQErgPNsF/uT66CSQs4MmffT6iF4I+WXt2kwzSjpSYwdjWN?=
 =?us-ascii?Q?NDabsOctl12izTNbeTRmfTYZli6TWKnPNLA2CQh1tQkQRJAhUkwdahP0+1au?=
 =?us-ascii?Q?EJxrCMWzJHCy8wR4c8yOV7KXSzB/rme15aSFEDNfYROYxsLPzvmUGBivMMnj?=
 =?us-ascii?Q?p0LVp448I8BkRLcLFtZQQLcm0yQCfZbUZciiHgfdedfKG/bS8RLnz+Dd81od?=
 =?us-ascii?Q?d42liH7KH4taG9vfUewk3rBCaWJO6iXP+3r/k8hWmwyE2o2v+6UhUDQk3jsV?=
 =?us-ascii?Q?IXZSOtgTAYEP/7HW+dZuaJFMLE2D0kUhesxcNSLqHfmekfVGgWJUT1dmkT+H?=
 =?us-ascii?Q?UbOBlgFtnEK+Uo86mJTXbnM2X1mYdoM86L6LUlJbW19op71bNPOB+tkTbv6l?=
 =?us-ascii?Q?oPg9w5Y9jAfWmOspJYIZTBJQOLYmgYDdjXd65piABKQB2+qSuevngjuEi+T8?=
 =?us-ascii?Q?jSpkFtiwSaYLgEzeww0xEoirgJOhKwHPUN7+4ZLy+QlEDAZS4OFCUQ0w9Vjr?=
 =?us-ascii?Q?pY1wXp3hxTy//DDOmiGIsCBecYQUXOPX38C1LekJwQenDxXhNfmqc13qaZ/B?=
 =?us-ascii?Q?Cs80IO5UbORAOvPx5tI96yM5cZ0Vejr4sd9YhliRO5fq7eEjFKo21eGtNmj9?=
 =?us-ascii?Q?TQdu5Lm4u2X1AmWLlOAkYTlwu9sgnVNkUtHhYf603Vy9I/xiG2RACdbWVsJ6?=
 =?us-ascii?Q?15KHe6guqP4/r696e29j7Je4i+8qxcOWnKGFmAbh9f3fgV6g4N8EVwvxlOJT?=
 =?us-ascii?Q?nvq0Hudh0b6CdyKbx1DA3HURJ6bRJmd4alTap6yO6QVUmijHn0MnpHSpzL10?=
 =?us-ascii?Q?zQOS1mOj0yk0bFKL07U28Sp7i/TTstr03UQvw0wDzHZ3K2ggL0EGawVjd5mR?=
 =?us-ascii?Q?mbMyrJtl2Xx8vQIHJl6A6Jp7BM9t17xh1W5EE4YQyOP5QqqZFLAz1uYuBHeW?=
 =?us-ascii?Q?rVEQFYrNFJiA0m9Fcn3DfIMAoaAtOUfCpZAFCFO/CoqG5Cchva7w7zqwT7e7?=
 =?us-ascii?Q?j47USSUZZd4mV7HQ3VhN8kn+L5BilD7sBD8E0xSbaDENS3/gWJAgEsgdEu0J?=
 =?us-ascii?Q?ByMGk+MKBfw11SWFakUE1feOOUbMesJP4BxOxTJAgCUQY3mrEu7W+hLQZgrf?=
 =?us-ascii?Q?D2CnLf1f82+2LIWSITA6wraETT9xY/MX3bhTHIB1iMWO09tGfpcpa9rcFN6v?=
 =?us-ascii?Q?y/+GAmoIzLdZCSS4pZne/TL32y5w+1x3Xv6RgNFnb0vrOPJf+dDNH/20JsGy?=
 =?us-ascii?Q?/gz8l1/sVza6d+P9rlQj0qZoLwvX+curv9i7b9Y5qSxrYgxZjpl1Mj1mVnrR?=
 =?us-ascii?Q?D2IPCwNgceR7u3vyVimvUQfoMRSYyHfRXQZzSuqUyTrnf/qH8A2YjtLnTSIU?=
 =?us-ascii?Q?QZnYZatm2KGzfuGPcyTI2qdhfsfXhEZfWB4wDIsAYdhriqxkLhNW9AEJvR4C?=
 =?us-ascii?Q?cXETBrUN1zkI38bvPhkfwOMj9NQgrwuaAN1TKSq7FY+WievOdKT+Kc0QdPFT?=
 =?us-ascii?Q?yv0p+P5SKalBv8QaehH2EyZ6TpW5Ab10oix3pqsD?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KPZO6hpI7ACafDeCvsIdy2wZCeZgtvihdGA6XIjU+JJRgdRNRBmfkZvoSTOalOk90iHwfCbGQLe3m2yFhtxGemO0M/ai/IZ1YGvoAu3jaSe7WgdOjD/3LMb1tL3oPTN8aO4sDwESKXmYl3NpqAJpACZDYkKGd0QZkh+EHltyl7Gqs2wpRXLPy9jCwE25wYdPgAgnfaCacu7w5LXUqm7Ha+ZgOGT0oDzRPkGL2Dg9RCz2/jCXRHDzJwuT9fnMM/IS2tnRbPL7nSRuezcK0yY8AjrjIA+lcajH37qd+fUngoSWBgN27VWEfvLySwIyV48+fuikl1IRhz83M0GvMatG9l2qG6hadUCaqoZjj8ox985OB95tK50BLqRzaqaieWW+3/gFrlR4VyQi5iUfUiM4FAPfiQsVUgG+dLyMz8ZG+kRnwi3yc8aKckRZastuo+3bkZppbumONhqSNc+QxiD1wyJOFwmLGynTsEAoTRrbb+Ym9ou/ZGXFGqcWEk0E0R2mJdUiUZVq2+90K0RnuvHAg//fgblq1BUYmQC+IsrYVR0On0N5o/Favc8b074RFCp5y3hPFT1YiN8ylIDOYBXH87laYKcAcVaoHmIlvG4TW9E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ec4cfb-a1c9-4af4-1bc4-08dcc7eaa779
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:23:02.7234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHm63sPP2iFD9cLr2/F2PNgMPuU75/B83ULOycU1ATXBB/gHfUB53JQT2IweagOiKLaz7OglPvLF5wmUBk2dIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: M2RkTcfdxI2fho1JfIErvcdvJMXcR909
X-Proofpoint-GUID: M2RkTcfdxI2fho1JfIErvcdvJMXcR909

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.DTRACEFLT_BADADDR2.d | 12 +++---------
 test/unittest/error/tst.DTRACEFLT_BADADDR2.r |  4 ++--
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.d b/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
index 23663f3c..a822e63a 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.d
@@ -1,26 +1,23 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION:
  *	To test DTRACEFLT_BADADDR error with non-NULL address
  *
  * SECTION: dtrace Provider
- *
  */
 
-
 #pragma D option quiet
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u %u %u\n",
+		arg1, arg2, arg4, arg5);
 	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
 	printf("The value of arg5 should be %u\n", 0x4000);
 	exit(0);
@@ -28,9 +25,6 @@ ERROR
 
 BEGIN
 {
-/*
-	x = (int *)64;
- */
 	x = (int *)0x4000;
 	y = *x;
 	trace(y);
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
index ada685d6..6c5fa119 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
@@ -1,6 +1,6 @@
-The arguments are 2 2 4 1 16384
+The arguments are 3 1 1 16384
 The value of arg4 should be 1
 The value of arg5 should be 16384
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
-- 
2.43.5

