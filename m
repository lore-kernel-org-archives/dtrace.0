Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B246263F36
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103413; cv=fail; b=C02oAn6VOUmQO3/4bUsmenb4ga9aQW8YgareDlv1EYNxCQQa+Q7plgKYAJeb7OUBkEdU6y9OKJ2SJIDK982rhsW+zpKleIWZdnR32k9qX6WWPgI0OpV5xb/5pzCenZQKygu10bkmSGY9f2j3pw5uPGYTN2AVd5nJhFEEXnDHJRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103413; c=relaxed/simple;
	bh=9bG0ylkA99p/J5j2Xv81VUfEMv1NgZfqJSAOr2qeNjY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ijzJXtO6qXWHJGlEwBD2qhLIAib1B69y8LG4ajRsE0qHBV7vZyru43psT1yyerE0zZH2+5XiFVWIwiRic5tyIIza9VjGVT3O1wtaydOu4TZBxAmZas/D3a6wN20sLXceDN5cIehbkg5XVAUfheLkC5plAIQWu4+Y4R8piCsZOkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qhwT7Ys+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IjsIGmtN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qhwT7Ys+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IjsIGmtN"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NUuM010936
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=9uteqQ1c0n790LMHt3
	GUjWgIR8bqScVELMfRkIu2tao=; b=qhwT7Ys+fM0eJVExDbdr0pijaxDMVhokBr
	obQFP4JbHuW/dWVos2T/4nohcJwylz9qz4lpKq1Nul439yhVIal/JdFtBYj6C5Ef
	n3avCeF3R7EL57Z3qnbnt/rt6PK57yVSrt4z+cUqp2awxDR5C4/amJLnF/xit1Hv
	+5jO9pBAkjW0V921GPW4wAInIuKRg93y8vKq8+fmB/a1L23LMqnoYxsvS+PJbrdW
	/99ZqvFCXIu2UBeuCz1rYwmkeT6Kf3BQ1FLMd4IL8JW7uHyg5v6gF6XK/ffDXUTo
	6d51hSrKRioJcn3efQfG/TKHxBB9JbrB1GzdcfLgfwBDcSSVs7eA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2ypxsuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M0mkC1025370
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj65-15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rb1z2ODuO+cbPHaLZMxy46yoV50KnDYMWsFWHzFg0IdJf1QUdbW8NESgeN6xR5HWFyX/a30Dl0TQY0J+x36+uRQG7ElFmWa5cJnSl1Dqpuf0UFg1p1+8XE2bcXWvP92qWyL5h0hN5s3/+hXmsKOJCsaBb9FtFobrnTjEK/loVc1vqFH58kfCPH+Ehm279TkK5JG0GkZi/3Co4Ls1qjIIDIrzaTUnVhyVpjwOZCGoXdJbFWQRBB/arL/fvpRgbXQnhnnSNLoqzm1IoCK/3+lTYW7GLTRjrfOBD4bSW/hF8rSs0TfKN6VX7RBn4ns1BaZ/a0yLHvtt9VwXypQ57uV9IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uteqQ1c0n790LMHt3GUjWgIR8bqScVELMfRkIu2tao=;
 b=MPRCYEo52B3M5/fcD51BHOen+BtEcULvh8gPxp+RMLQCeLdxcwZ/cOuHMPBR2zlodTHTpxGGa7tEiT3WL5k0OeNrQqeehC1l4/u3vDzEGmCF5rCFLBOu5MX9wCZNrbdwqpSlYjA+p8qODvfuesq4yEoGHh8EW2/5Gmwjz65rzuVDrgUJarrLp0QqD8DwH+PQSZKZqQaWs2JYBRX7xZb+54v5qo4GNa3nvCwtTWMheVAjMx4F2p1ePgx1t7rS8b8bVp42a7/C7lI/DCJnPyZN5TPtXHaM5CV0zG2QRclwUD6uyNAymv3uXev3SOsE+F1zSSwchYVI72kcc9iyzd639g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uteqQ1c0n790LMHt3GUjWgIR8bqScVELMfRkIu2tao=;
 b=IjsIGmtNtwCUdjdLUaS8ja5TcAdmu3SbV2w2cdU2yWdHpZnDEs3TsQv/dTarklCvkOcIU4Y9Z+0bpmXEanxSrJDh71H6CuFAKXfP/+6FPMoDqj/yKCtc6gwVg46pmt2VyRW3tyfXPGyYa2E+p3v1F0IpgDfBTGrQqKf66CDRsco=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:23:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:23:20 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 19/20] doc: Add UDP provider documentation
Date: Tue, 21 Oct 2025 23:22:49 -0400
Message-Id: <20251022032251.2010-14-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 044eccdb-1af7-4c5a-5b32-08de111a59be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PXg6k11WPtd65GYik6Z3+ICbGyEUVPhB0D/dnyvjVCMlEWtb9zRoo7kViq85?=
 =?us-ascii?Q?hI0zYeFLflELpufZla0Nv4ugL//CtL2Geo80ma+VT/C0rkR9beq36OShDQGb?=
 =?us-ascii?Q?IXLYfTBjTE0iI+fKNPyPYJ+4XoGCVfIg0Ycf+MYNiXIYhIyZ02j8sbZasWkX?=
 =?us-ascii?Q?jnbqNyDbIewlldMKbdN039g6Kqbviro+3n1SzMBXrjFvCODZ/eMiunpG6e+i?=
 =?us-ascii?Q?P/CC8sECSHtWj2pG4OVddSnmKD6+mtE+grRg5e7OMlAl4Kudk72vDHVFOPfi?=
 =?us-ascii?Q?4+CAGihQfDO9AVn7JSPJUWmZTIAyUxsbVpWM8XJC2s3gqfkae/DtCbTn9P9n?=
 =?us-ascii?Q?N/uRZp2lTX2AWwKaWmvh+6AMYDsKSJaHgn/Z9IXWZvmi2TuvDRRv0zPyzY1d?=
 =?us-ascii?Q?cSJufwYuoftY9cThYOw0yR1Z3on7wtH9CS0XRiXvwegptZWWt1i1lzWkFXVg?=
 =?us-ascii?Q?R2w4H45UjEiuFPcVZnIy4ztIx+UIR40Kr6mLjOVlfxjZJoY5+vF0IhDT2lZ5?=
 =?us-ascii?Q?YQkQc2K+CYsl/yk3S/MpwraN2JK75ZOTfoEG7VL1YnJ/o1LHEKxp4S/6Rh8e?=
 =?us-ascii?Q?B8WBdknv5R2BRhGJiLQN6rr4EnzedQyrAPI9G8zYu1nJKbiJ6By645G0geRP?=
 =?us-ascii?Q?u6m/sxtXWFnuhYocgMHNtXoTsBlHfkZYfXMuT3/YdsAsAn0mADUpgkHnGEPm?=
 =?us-ascii?Q?8Ax7bO0iayEfFMqEdjb8v31wc5rllNKYYkPU+jerwYT54ofW4UOVM/b0cpMK?=
 =?us-ascii?Q?yfzEBngV8jXjuJ8UUU+FVZz4ps7etPdQW3nW82JIuim8qJa0qdgRkDQJpXT6?=
 =?us-ascii?Q?R9LjPC1SqgQVXBbaggaeEHs0DEz+5Uti+l8tXXOtM+7BwgWzcZGEcjoOc6eX?=
 =?us-ascii?Q?LOJSItFyPjVvTCERRv0QttahNzTI1hVn33vJaeda22SUT/EAMj+8EFIup3hC?=
 =?us-ascii?Q?rV22m8Rrx21bDJHwpYdn6EgBTiF9jKnYHCgEEKfMmiStqe89lR27EnIeSAAV?=
 =?us-ascii?Q?UGh6YVWekdo+gtQx2g04M55taPPPtgFhwBcRTM85v+6ogZ8BCZEaxkVNxbzy?=
 =?us-ascii?Q?gKQe2TSg3b3mImr3TZQRw9OAMn/ar1ewEFtX38+t6ahkL0bfciLX6IuctEP1?=
 =?us-ascii?Q?QomW60Unso0o7t7zxBtzlZ+ziaEgMVHgbybpGJ4VR+OHoqAWIoHP6nzUbqPu?=
 =?us-ascii?Q?ZBTyzkVIEs/OQtFfMhc1KaOnyGUyYDJJOv0xfk2rpr525rDvJAfHO8H7Wb1S?=
 =?us-ascii?Q?s8zwq+o3CVG+CF/DzcDHRz+tyGBNJDbDavZSv5lXC244dZp7Xxhf6l6n/SVn?=
 =?us-ascii?Q?XeKf7vlxiqsX8yyy5vWWfD78LJJPAL6ZlX+vDKTQYzGj9V+2vMShsiNAkK9y?=
 =?us-ascii?Q?KqRZKwaaSIqK7pgLKTY0MWKtwUGhtFoFP0/0xYVjWskbjpDacvJjfZFqIZG/?=
 =?us-ascii?Q?ZJf0zWxiebmset7Ydlb9FDQ+5fLnbcUh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5HeqJBjse6zl3yIfKTyM3FfM6OllGXGGhXy6BJFDvUObERhFQCljwgIWxK+f?=
 =?us-ascii?Q?DrsGOFTxbLeAzQAQwMgcqw/IUAp+pISdYd+iE8z6uksIwhOTCDZC06gBXOrf?=
 =?us-ascii?Q?nT2OwZioU6IwTYO7rgp7qMdXghZ7s330shuLJPV4SoHffx4DCmg5DT04yt0s?=
 =?us-ascii?Q?Hk4J7f5cSh6kPJEHzlCihtaFYDVOa2dbLp/fL/3f8GOEVVq9T2yVFoL7aTCz?=
 =?us-ascii?Q?TQPZVVmmgBGBgbC8Ko+PuPVnn1fnqQvAHJrQMn0BPQ+lNdb7XvHSitDd68gQ?=
 =?us-ascii?Q?gbAqNQQgvDuDN6ADsVuKnfYQDJMUrtYCQ6OKHF2GLcPTmcf4qZmi3PSWfmG1?=
 =?us-ascii?Q?ymf9DNg9+SahMOHRuDX+YHEre5rulG4zSFe7WhBrcR+doHO+riVLWFUh1R3X?=
 =?us-ascii?Q?T69oSITphlbhYkMFbLweL9jy2OReagArYQ2ww7xtGjdX20Zj28JIOI4ms/Oz?=
 =?us-ascii?Q?uGVCb7zS4vlsBrr34Wiy5soeI4RjHgnbG5qzSPXV2Dq8gQjNXQJv7OAV8+Xl?=
 =?us-ascii?Q?fMakrZUuV8hwGzPKJlbMdEHP9utx89mOtQrbgNCCJAKnlJ+Viya932EC4Vsd?=
 =?us-ascii?Q?l35preBBKQTXBVKUHNSOk7phscoczRtNnTK9VyN5nmSOJmPJUOvvqvdai/Q1?=
 =?us-ascii?Q?OSqPMzmdz+auo27S8GRryHRHorSp/wlpR9QELrsc9Tv1mgck/8NlA/FVSxA2?=
 =?us-ascii?Q?vzYNKhmWv9w50EKex7J1W2sxmpre1rznp6EbygzHstn9uwN9WlczD1UfGrVY?=
 =?us-ascii?Q?19qcszfbtAS0e8tdQERw3PLPA+4baftxsWbwFpoRBlmh5JdC6H9u7OyuxKcX?=
 =?us-ascii?Q?7gYzHx+71qMLldFjN2PF559SqrKJftKJASZC7yb3n5WeYkyctMLdfbG25oHD?=
 =?us-ascii?Q?auE6BBPKSHB4L0fKzDJZ8ubH9U3oZvacjRMKd9WXenfJTaq5rKC1+ZkNWhlU?=
 =?us-ascii?Q?kUzh3dtrV0R9aie7ugvznOnOKvinUG3A6xDdqku+p2HO2s2GHrwGfBjVP+9X?=
 =?us-ascii?Q?6J5ycSxmonwvuLseVbprwO5fxsjpr8N2TCU7iPrT6mg/7fZOS5/Fgos3fGPq?=
 =?us-ascii?Q?egP3RyDr4HVM4FdpTDKC/hzyh0eTOEQilpaya6kn16MCSzG44wt1vRsA/i+b?=
 =?us-ascii?Q?8qcJRDW8CHXT3ZiVUqvJEbg38T1BmioHfA0QfcSwkUxdRl+2SGALvC2wlmLs?=
 =?us-ascii?Q?Q1SuR5rIPBhOmwqY6izu0vfl5I+ymCgKwKpUjUM6j1UWjvAr7ZtILvfkwiKt?=
 =?us-ascii?Q?9o9eqsuJmn/KpZwmaNGkbAYTt2lnqG472T6jxt9z48B6mTndlsPTOLQLY0vD?=
 =?us-ascii?Q?b63xCVoPYy9+jYQj0W+fhX/nbVuhZ4iJEF7zOv5nZ0sr5pfknC4VTP9ZPgfV?=
 =?us-ascii?Q?JlpAYPBgh4FxqG5aW1Jjz8VwhxWGFuUQjpQIjk4Pdb1PxQdPBeik3XYqVXrr?=
 =?us-ascii?Q?I0ksIe8idtaCE0uJIo+/lJ2/A7FeZmrKpEUaWfTf9PMJpVR8sET91gltykrs?=
 =?us-ascii?Q?JdsdzUNKsS6/pSNZgxMLiKFfXczQA+aW/rjFR/Pk7APh9is3ftSSIXqVPZFH?=
 =?us-ascii?Q?9aV1RSWj0SWkMvu+Mddl1UUi3XZfIgN85RbhdVsp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y9ARGdjb6A98aQnsQYrMEked7dBKc8EWmJ24CRzxdndXFqHFI8sPRMmcWJnLhkcRBl3Fz5m60uKDqktZkAnH8nK92KWB9oOX591QaKqdnlguPVpEVTlAJCaW6L01UU3valPJWxc8VbScssBTI+NUmsVg94bNPSIInJFXBiscUnPhxF7UGbmRfZL3QNI6s/hKxFSla8PNgWKcLzH1mCS1zG+MQ16FBNUyC4WOnqYuAaVIVTRateVFBfU2cZVBp0E9t7D+HPyY6h0QP6gQ0agJ/GtKsaYT/QrHi9EH8apf0SrPzEc0IdDq2xWsXU6T39TAYIMK2rpGXabe+7zMGbslyfEg31s8YnfaIsqVzaaval9Bp/PWd9+MzB2QrfhZKpW+lF8VljNAWHOhmXZuta4PMMSBQy6YO2ZvfVutPmczR6Mam8oxdxboGmnJ+M+ZKa8To1b5VzReIvNaF89UMFP7KQrmR9nqtBFHeOHSBZPySLkFwbTgVuvVnPaA6UoHD4NWJO6c1pk1VSAyBJHaQdujQU096RrB+FVw9auY6wvMQoeQb3b7ww5sj2yto6x0nOx0UJ1sFunNVLz1iFBkk3A3pDOLgdaIjQFP8PvXuUtiJPw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044eccdb-1af7-4c5a-5b32-08de111a59be
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:23:20.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhUjZetY0WnaNK6wmTqi+LaW8FA0XHrX1hBZvekmhqYFFI5RVIWEt0ZON6bvDFSTDozERB9Vt/b671V9PZdrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX8ZGlCITyZwW+
 gd0nGQCuVz0ykntVBWMi5jN1buEqjFRkZLS44haCYbzRNP8laN9oMYAfUDPrI6elDSfDDryRun2
 TEofIkGCtmmNkNEspohmH81MMWI7Ot2QnrrcxKD5pSFeyZ1TG8nubUWPmBSL3CGqIEIqG5nK/1a
 0suYb84TV94cD8G896OjQQADYrr8E0t+MC4M+GldJyW/HPjOsRPMVa5K32oaLUmB3OusQON/h3D
 rafw/M8E0mRXO/x+9uvIh+HTBsg/BnkA7gYVxh1MIb7Kd/NdmEPiJaA2i6LXNPoM/5r0Teb03K2
 7jR0Dx/nC5cr1QxkCAfGDdwtT7Fu5fdbJjNFzKHeYhYxiRoyNqldGtyvHBbvufCtDRPs+17/dUl
 OtKRATnywqzdNGTONaMOmvaiE6xHhw==
X-Proofpoint-GUID: WDk6lrXwKXRLczjXJEQX2nfpo3CVdIod
X-Authority-Analysis: v=2.4 cv=Db8aa/tW c=1 sm=1 tr=0 ts=68f84e31 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=oNbTXTrsnSljPtbh4DIA:9
X-Proofpoint-ORIG-GUID: WDk6lrXwKXRLczjXJEQX2nfpo3CVdIod

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  6 ++
 doc/userguide/reference/dtrace_providers.md   |  2 +
 .../reference/dtrace_providers_udp.md         | 76 +++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_udp.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index fa9d9d021..f86c8b9e5 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -266,6 +266,12 @@
             -   [tcpsinfo\_t](reference/dtrace_providers_tcp.md#dt_ref_tcptcps_prov)
             -   [tcplsinfo\_t](reference/dtrace_providers_tcp.md#dt_ref_tcptcpls_prov)
         -   [tcp Stability](reference/dtrace_providers_tcp.md#dt_ref_tcpstab_prov)
+    -   [UDP Provider](reference/dtrace_providers_udp.md)
+        -   [udp Probes](reference/dtrace_providers_udp.md#dt_ref_udpprobes_prov)
+        -   [udp Probe Arguments](reference/dtrace_providers_udp.md#dt_ref_udpargs_prov)
+            -   [udpsinfo\_t](reference/dtrace_providers_udp.md#dt_ref_udpudps_prov)
+            -   [udpinfo\_t](reference/dtrace_providers_udp.md#dt_ref_udpudp_prov)
+        -   [udp Stability](reference/dtrace_providers_udp.md#dt_ref_udpstab_prov)
     -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_prov)
         -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
         -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 7da634d2a..f11bacb2f 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -31,6 +31,8 @@ The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at site
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
 -   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
 The `tcp` provider makes available probe at different phases of TCP processing.
+-   **[UDP Provider](../reference/dtrace_providers_udp.md)**  
+The `udp` provider makes available a probe at UDP send and receive operations in the system.
 -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
 
diff --git a/doc/userguide/reference/dtrace_providers_udp.md b/doc/userguide/reference/dtrace_providers_udp.md
new file mode 100644
index 000000000..455f91e4d
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_udp.md
@@ -0,0 +1,76 @@
+# UDP Provider
+
+The `udp` provider makes available a probe at UDP send operations in the system and a probe at receive.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## udp Probes <a id="dt_ref_udpprobes_prov">
+
+`udp` provides a probe for UDP sends and one for UDP receives.
+The module name is always `vmlinux` and the function name is empty.
+
+## udp Probe Arguments <a id="dt_ref_udpargs_prov">
+
+The following table lists the argument types for both the `send` and `receive` probes.
+
+| arg       | type           |
+| :---      | :---           |
+| `args[0]` | `pktinfo_t *`  |
+| `args[1]` | `csinfo_t *`   |
+| `args[2]` | `ipinfo_t *`   |
+| `args[3]` | `udpsinfo_t *` |
+| `args[4]` | `udpinfo_t *`  |
+
+The `pktinfo_t`, `csinfo_t`, and `ipinfo_t` structures are described in [IP Provider](dtrace_providers_ip.md).
+
+### udpsinfo\_t <a id="dt_ref_udpudps_prov">
+
+The `udpsinfo_t` structure contains stable UDP details from `udp_t`.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/udp.d`.
+The definition of `udpsinfo_t` is as follows:
+
+```nocopybutton
+typedef struct udpsinfo {
+        uintptr_t udps_addr;
+        uint16_t udps_lport;   /* local port */
+        uint16_t udps_rport;   /* remote port */
+        string udps_laddr;     /* local address, as a string */
+        string udps_raddr;     /* remote address, as a string */
+} udpsinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `udpsinfo_t` from a `struct udp_sock *`.
+
+### udpinfo\_t <a id="dt_ref_udpudp_prov">
+
+The `udpinfo_t` structure contains the UDP header fields.
+Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/udp.d`.
+The definition of `udpinfo_t` is as follows:
+
+```nocopybutton
+typedef struct udpinfo {
+        uint16_t udp_sport;     /* source port */
+        uint16_t udp_dport;     /* destination port */
+        uint16_t udp_length;    /* total length */
+        uint16_t udp_checksum;  /* headers + data checksum */
+        struct udphdr *udp_hdr; /* raw UDP header */
+} udpinfo_t;
+```
+
+**Note:**
+
+DTrace translates the members of `udpinfo_t` from a `struct udphdr *`.
+
+## udp Stability <a id="dt_ref_udpstab_prov">
+
+The `udp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
-- 
2.47.3

