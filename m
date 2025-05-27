Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A317A2F8
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748324609; cv=fail; b=pgHXN17BDh44f3S1xFd20w3X4AQ5RqW8+9Ka0b1o4CTmyFI/6ifxUIHIx07FxIOMMJrBhtAZ3iY5uCYQD0pTAddSxS7ACap68ZN4tYOadLGCLl3Nb7KSjHPe+KALeNwbVWJRy8klFpMeXWLgmSasM/4HXQMjdBjoHZi6iP5xrwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748324609; c=relaxed/simple;
	bh=l8lz9SdcYe5B4rXOxDV3s3WWa/3bJwQi950SQUrFyc8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ds0lQqb+5L6Yc5YLpXINIKrZHWalVuu5Dgv72YOFn/eIvErGcZC7alC0WVtz5xUxWuHvd7zrCEwBqz7BL9M1KIYqB/BTYDNs/JKj5Bl6xBn53umwop1xnjRmmkQv7/ppj2eS+Bp+xtShUf5Mpg5CKHTPDzbt7UHhWFm9CLrW1J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bNzNVmzs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ohle4GRm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bNzNVmzs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ohle4GRm"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R1uE7f024065
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6G5M/u5B9ReK6OCfaP
	t9sR/Pt/NnxBkt2nRPVt+TXgA=; b=bNzNVmzsZjsAijW1M8Yvlz6kTuvDUPUAru
	zlGMPc33pvVwE/+foyQBqZIEOG6wHNP9iOlg1d0CmCOwVRaIfmjU1ftvI4zGFEUJ
	sJ+Q91DwmEWM4WL6y8QVlyiLEUH5uDF3FZcDe11tyyUPnuxWqSBmlsJNfB/qAwKp
	Wq1LXHPrtPgyhtpQQo5E7c4fylJoTCrCbbB89sWuY1Kt1TvcmW6O1pIIsf9hracR
	/Xh5QzWI6NodBB3SnvBYyC54fYXhG+6phG7cV3LUri5aZ1EAKY+6ASUNatXMjM7k
	Wb7vqfBrVxgNKjghsc0STp8E7CwMmadO+jXcqCzsWRg7LcEGYGSA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0ykte3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:26 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54R4KCTK023901
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j8dgtf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 May 2025 05:43:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtVN81O0RzppmLNZtMcN1J+BtrdLnAjt0pEongK2SfdrloU0zh+s8yFpmA4CX/44ybOcwFgpL+bWXCLiMR8ssGZCoTAXuWXgBdjxgaD9tnborKolT0vjUyoprJkytiCtx45rRsY/LFdAAqdJHN1ll3DT9igHqqnuFL7iCBlU3zaX2guCa5Q0sXIs+rrH28HwYA64ntGW07ZqxKCKMilHlcR485bhQ6VtH834kBXAWbpZzJSl0osqFbvDG2SUazgD7HpgwHuN5lpf+qdyVQpz29DF9sd4sT5ffHlbs/PFdJ0dOo9ebW1KAyOF5Ksi8we5H65NOFeleMs26C4h2QuVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6G5M/u5B9ReK6OCfaPt9sR/Pt/NnxBkt2nRPVt+TXgA=;
 b=YHdbl7/okvqXeSFIrcwws1vU/Sb0bxRJmNrC+/nkIVfoaCCdmDO9teXvghrebdmQNGjXeRgJTdpcH1k4Ea0LAxXCFJTN1jIpXwB5b2Q+CClfGHn6XluPwjErSND8HorTdPk/5DYJMS/e++R6yoWQShSqKSknBvJUEwa0nv5DHKNKaedldXfkYIbb2VLEDFgsTQYXG2LJG7Qvl5JqD7PvpTk2a+BIBnJC36dHZ30yrSQ7g/xniqnSgvszrzXGdJLzROrowAJKt7TEjTXoMQkDAdPNK8PNTwX5SZQ7Ls4UxsZ/ALy+8aiSxZ/KBczY40nyNVlAgPRrqkhL7lUtibgEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6G5M/u5B9ReK6OCfaPt9sR/Pt/NnxBkt2nRPVt+TXgA=;
 b=ohle4GRm3ZWL9IpkuKTp8a9dp5S8c5Gn+VaBwYUQmDPM0lcki/bZbHyLLMO80uIOm345QE+hgivr4+B/4tUfEffdgzI6TO6VJlB6nuIIVelIayDPNVxDwfxr3f0yV100QEC/9hM9J045rLxJ4z8pk1wgw731xYk6ywhSID9t1EU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA0PR10MB7275.namprd10.prod.outlook.com (2603:10b6:208:3de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 05:43:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8746.035; Tue, 27 May 2025
 05:43:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Snapshot aggregations just in time
Date: Tue, 27 May 2025 01:43:13 -0400
Message-Id: <20250527054313.4849-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250527054313.4849-1-eugene.loh@oracle.com>
References: <20250527054313.4849-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0037.namprd16.prod.outlook.com
 (2603:10b6:208:234::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA0PR10MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa7f400-cf1a-4b79-229a-08dd9ce16481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bo1P72LEZ1QHoYbCb8HwLV769WArG9LNG0+aKf1YjXtKxnZz3rW4V6/cBovt?=
 =?us-ascii?Q?Yfto/V7gNTN+rXh+RoCIQtsIEy23uLxSuPmhR+88KYWdmzeB/nx/Utr2ziiE?=
 =?us-ascii?Q?KF5oGzm3+bmoBBJZv5uCA5gyhBxWn9dcI44gdtlPP+8YHppeZTwhacvejxiB?=
 =?us-ascii?Q?SQiY9w9meCbZk5SZjmdmAOgxqVHvTOXNxabLVt3b9CJjmje4qIyWY7EBGhUG?=
 =?us-ascii?Q?23yqKS/mzsj5TO6x7ZW5ByynkqGctmtVFMcQ6rbV2ozMlAYbYXMqurraI7L+?=
 =?us-ascii?Q?8xzpXjp0gMnbgMV6vC2YnCBGfmp6PweI5IOIWbL7aaw2VLrXcbw22hI2qS2m?=
 =?us-ascii?Q?rDSX3UrVmy6g5R8TR6KZX1TwLjKf3Kw7viBE2Vl2R9bEEXvyTD2SyzQjhMFg?=
 =?us-ascii?Q?UUgGiCoBu69ouXdq+b0e/1UPchA3CZM0P9NiPZDmUSzyvzInqWgcaJSH7IYk?=
 =?us-ascii?Q?2uXapuskexKKrT0CKiu2FsdeiI93kAB2d8b1qnpvuchL21BOVjL8fOnerXyC?=
 =?us-ascii?Q?GJ3t5Sq7Xu8IDUP2aqxljuUmjGmUZcvUbatjFppl+8UCwdyktJ5aJsTKZFwd?=
 =?us-ascii?Q?f1kRT7YBU3inblcIpVFRJYID+pFok7LMRsxJla4IzQcsIVoglMwna/Chuc0Z?=
 =?us-ascii?Q?YNJz7Dj8togzOhrVCfxEcykLFYDxBUxBEd/ipuFh8UHZDmTGM6/SVk6wgrTi?=
 =?us-ascii?Q?KoI358iOidnST0+914x1vKRgsNAqsCzSTOX7n6ghmISifnW7Cap9iSBARCcm?=
 =?us-ascii?Q?/tbz1zycg8sOvonVnxMlQJaR3waptLIrXckKnw/DtqS8NogkaR/sbmchZb/j?=
 =?us-ascii?Q?ZNsEQsjSGxLBjUx3Nz/Iy2hOCuPRnJ45exYqGwWTRu8u260nCWcYshLYmjR7?=
 =?us-ascii?Q?eYMKKsY0Wyi9CAwK6tYWbD38TDF2TrTMXeXZRRSliqW87G1kQZ99qs3JMQtu?=
 =?us-ascii?Q?OJtx4USrhUyYsNMvkVH32ZDPu7F5Uo6+bVVpZv334es2iz/Uom2BeEeN5krV?=
 =?us-ascii?Q?/wg6M5YZt7EwTkfLq3McvuwZoFjHJWsiToDChh5BYkliXVk1KliXe8ROfUuM?=
 =?us-ascii?Q?LJjv6VbO/IPKTHVdJRcRvWdNX9sE1szmnZOekR92dlfmPngBYKV+ejy5Cxyi?=
 =?us-ascii?Q?ltjw6TD1M8vv4XFmLpzwXDOc+HXTxhQ4ZbxVv2H9+5p4zasHYvra0eqwZ29v?=
 =?us-ascii?Q?DEVonHvjrdAlimUqaBcrhax0RCZvNIDDBYDH/C7xcjotVbz3pKcr6Hd3flOY?=
 =?us-ascii?Q?UKifSWOjihI1sUwVWlT5fd2KNCuV4gdEgHS4pFUvTwORX50rmR5srNLFyEkx?=
 =?us-ascii?Q?vOuAWpZHwJ9z47RsL5xhCN8dBJOloPH1j+1Kgnnpzba6JSVFdnCHft4DoIYi?=
 =?us-ascii?Q?DVmpSMzZ19IojQ3iCqYlFIgsKE0tV5wqxSjzul7te6dhBE/a2SYqvqb1sfMD?=
 =?us-ascii?Q?s8FmPpusHVw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bSuT4+YoI00BptjtY4Z7DEfPADT3nfXvlExlpn7t/RmFot5C4aGYSaBsai3r?=
 =?us-ascii?Q?Kven+S1cZNSzF7PDcqVQJvaGctXtaY8meWpXAUYziTUbycEZlHUOQ59e3TF5?=
 =?us-ascii?Q?Hk37zLv1o70dNUOR3zN5tJVM+F9Pa0EkcDVpb21Lt85iF5BjMHRs6RYUt3++?=
 =?us-ascii?Q?I+LxnrH9lmN2UrQV/cxsXAcOto2Yw+eSzocomteAblv9i4eodfop5DKB3ZJ9?=
 =?us-ascii?Q?2VpAF61PnatwdGCV/q3JQE867fgWVo2I/aZdWpO0h9PfiXFd++cw4Jaq/W3X?=
 =?us-ascii?Q?BJBE9iaDU5O1mBWfCMHyWLjZzQijGds4n05DInxF5yJhcC4oc7w0qP2kbIPu?=
 =?us-ascii?Q?CoFY4MVKRiriNBORKtDN6ZMm4X9+fWCqvlyoICbbBQXm8D8ChIbJkoqd6r0I?=
 =?us-ascii?Q?bRdFzTIZGxSHFop1E2mSP4dbFA5+GNItkvJhzPUbly8XSgpE85H0zZK78VUA?=
 =?us-ascii?Q?VhzCJmj0USUKB/jGvtc0jp/Tki3aDVlybpRNwKL1Z8oZuMLT0NhHon/AoYvJ?=
 =?us-ascii?Q?KY+gQWtvsD5FfYt32VndP1oRzWiXZSYyeyTPhqBYQys14HzYgFXqmKovVvxH?=
 =?us-ascii?Q?dJhLkQOJH66uDtM2BZxk93GE7RVXTzKoLir4SRnkHjgWHhzwPy5wnC7D3DI9?=
 =?us-ascii?Q?/PPI2HI0scsQHaAZ/GK05Zj7C91muaZp9EAIRgdzFeP/6KQ2hF9+rkXa3Ypy?=
 =?us-ascii?Q?FTPo/kvT4V0FKOVGqiHgzxXNBB5Vq3Q3YOnBksguZtis01ZfHn4k+dab+ed5?=
 =?us-ascii?Q?Y8rm3kuCpdOiIsJN9OrxVyZpzRU4sZWHRC5wpqPMo2dHOh8Daltpatn/Kl2O?=
 =?us-ascii?Q?+UMOdc9J70z4FcBBOFK8nWvLFbuf1Mm14IXpsb4dyhbyoNIoaly+SSXwcySa?=
 =?us-ascii?Q?XZ5TBlt0uvYkpi/B+sUPf00mBDGD6Lw8gtbpotkzNInPDSzogP2kZ6sPi7Ug?=
 =?us-ascii?Q?hmgP4Tw8mlUhsqg4Oun3nK1gDy63SzWIJP+na7M3Pg5oJ+J2hipb4KNK6aHq?=
 =?us-ascii?Q?X5WGJ290+v5ibME0SoidIwCyAuOHXnSEc+YAIUwcCroeCkgvdg2F8EFQqn79?=
 =?us-ascii?Q?7tC2n7oK7Zyow3g9vrHn8OLBvIr8+yds76kLqC2DiplXFeU9zzsIRlPRfkRL?=
 =?us-ascii?Q?Y2itFct3Kjca/fgDdB2mzbCHgh+NR4NX6eDPzeM4VUQat44Cc1dpKLlKHKnP?=
 =?us-ascii?Q?A3KRHSz5OtHisxR1sXbiued+EPiE63XUZi1apx7BCjDRPZduKdpYHrcovEl/?=
 =?us-ascii?Q?prTbWduZaLs9CviJ6Tv7PaQxlYCeMh2v8qszUIsV0YC/00Ui8LnqLgWh28BZ?=
 =?us-ascii?Q?fdi4Nps4Y+EHjuqwtCuDZCHB6STbS1PQwwAjG7cURm29cvwEf+LpLzMVxDze?=
 =?us-ascii?Q?vTRtji8OwZt0RkKS2V534O1yV2TEINsARcooAsPUi8I7R8bg0VFYP+xYudIC?=
 =?us-ascii?Q?PSr1KmR3GOCqvMrDSUR2gr5L67Os9LcQJIi5OBeJiELcPeqqytGweMDw2LuJ?=
 =?us-ascii?Q?RcPPE9HTgllQGqIOYQRNUQjRD2Gn3dldpTyFznrWHIHkMsF+YZrmkWf5tcr9?=
 =?us-ascii?Q?ISIXiWCgdDUNnm4GWBjjfL15RNd0GfoXAUsEaJPb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X965Bah+uU20nBNKc7/+5K51KoN+omhw9R/ph25U2V6MVZKUUr+bpcbjbY3kUQA7Q8YB75/pQHkW8SRIBGjBJqH6oiWprX4OMj4yxJ0JpZsx3v9NEePlGt5JIxf/GTJywmZUerAPQKvJ03MPJLarDd+BLQ9nCoNa5iTR5fj3aYu0VyoYMxyjwficQbGAJxR7S5RYA6oCtzvulUok51jq6NUL68YadXmm+G4rthW7l3yS4JlNuvS3+vjJ0ZWhFRCVTXXBYyK4aJukjOL9XrBVYrkIwdHV41RpHiQT4CmmK89636/rbZ7xrdK7D24uJdG+RnRLvfyeq+HPW7nGzrN947V+wDWSp37TM3DrSMIZA7s5dgkQ+u0pM/54udpBDQG0aYnqsbz34+qBqTbVtoGP/vwF/8xfzV3F4idlrUmp3O9TREbJmqGjkRGi9YVvdInbGLZ981qwpigSsz7YGuvWQr3BOp8L5lEIOMmhQyFfdjXgZo3PIQmcSciyQ25GrTKnn58BTngv0bvm7Uiu6yNAmuWWdSaleO0HTFzUSUfH3Om8B3dGNsESXqxcSEtQBiRC03igOwivlhK9AuSrZ6+q9SWdcQ8r/XLhHucfbRwdr3c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa7f400-cf1a-4b79-229a-08dd9ce16481
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 05:43:22.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQRhGw2lwllyHiyvG/h6QN+OnsBRVUen7+4ZaBfa5sx95y84gTBBiBuFrF8DpolMqQCK16NB4RBp2PRsyzNY+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270043
X-Proofpoint-GUID: uFWwZ7Bvz2eDNxRjj7rs7JAutxEAsvE6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA0NCBTYWx0ZWRfX7G0EUNC+9tje SEbw5OcmNDc7M5GeJwb8d/8+8t+1BBhlNkvpGT82HpgcCh6Dny4bkZoIF6Ge8Ol8T+VbmJiaPsk 6N/HDIRkf4+r9ivuv4CB7ttPvvZUeIKu/7YqsuGRhYLZtPbiFYodbKRl1PXCrwqvt+G305KTePw
 OqaXzQ+j5A72hedu36rLAx43wPpcnRPQ0XSex4H49mORcjAM8HCiWtVuQCOxlekRxrddYFBqXJG M54uPNuOHYkPujX5ZFZWtfkmHwLWFm93StzrfcQWmu0x5AFXA/WwpdYqUpolmwSnWSGqw5VRDGE qJzIESVcU8bLXim7VOckPq8k7wldRY2yPnoKDTHSzA3V5doWgsFOGxM0UbUGzhMjF2aaieW0b/6
 T44iskPL/qrWGJItILAK8qFt3jJDMa7z+5f0wcUp1RCce2LEsagfYXaXOAiZgbKi2PmoRl96
X-Proofpoint-ORIG-GUID: uFWwZ7Bvz2eDNxRjj7rs7JAutxEAsvE6
X-Authority-Analysis: v=2.4 cv=N7MpF39B c=1 sm=1 tr=0 ts=683550fe b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=9uz7NJUUpOu5VGdL6wcA:9 cc=ntf awl=host:14714

From: Eugene Loh <eugene.loh@oracle.com>

Currently, dtrace periodically calls dtrace_work(), which in turn calls
dtrace_consume(), which among other things calls dtrace_aggregate_snap().
But aggregations are kept in entirety in the kernel's BPF maps.  There
is no need to snapshot the aggregations into user space unless we're
actually going to do something with aggregations.

Snapshot aggregations just in time -- that is, if there is a clear(),
trunc(), or printa() or if aggregations are to be printed at the end
of a dtrace session.

Skip the aggrate-slow test.  Just-in-time snapshots mean the semantics
of aggrate have changed.  A fast aggrate means nothing.  A slow aggrate
means we are supposed to use stale aggregation data, which would be
baffling.  A future patch is advised to deprecate aggrate entirely.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c                 | 7 +++++++
 libdtrace/dt_consume.c                   | 9 +++++++--
 libdtrace/dt_impl.h                      | 1 +
 test/unittest/options/tst.aggrate-slow.d | 1 +
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 40c1ae44f..6c1b642ff 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -817,6 +817,10 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
 			dtp->dt_lastagg = now;
 	}
 
+	if (dtp->dt_haveagg)
+		return DTRACE_WORKSTATUS_OKAY;
+	dtp->dt_haveagg = 1;
+
 	dtrace_aggregate_clear(dtp);
 
 	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
@@ -1901,6 +1905,9 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
 {
 	dtrace_print_aggdata_t pd;
 
+	dtp->dt_haveagg = 0;
+	dtrace_aggregate_snap(dtp);
+
 	if (dtp->dt_maxaggdsize == 0)
 		return 0;
 
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 8f50ebefc..a91413672 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -2353,11 +2353,15 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 				i++;
 				continue;
 			case DT_ACT_CLEAR:
+				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
+					return DTRACE_WORKSTATUS_ERROR;
 				if (dt_clear(dtp, data, rec) != 0)
 					return DTRACE_WORKSTATUS_ERROR;
 
 				continue;
 			case DT_ACT_TRUNC:
+				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
+					return DTRACE_WORKSTATUS_ERROR;
 				if (i == epd->dtdd_nrecs - 1)
 					return dt_set_errno(dtp, EDT_BADTRUNC);
 
@@ -2519,6 +2523,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 			func = dtrace_fprintf;
 			break;
 		case DTRACEACT_PRINTA:
+			if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
+				return DTRACE_WORKSTATUS_ERROR;
 			if (rec->dtrd_format != NULL)
 				func = dtrace_fprinta;
 			else
@@ -3113,8 +3119,7 @@ dtrace_consume(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pf,
 		}
 	}
 
-	if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
-		return DTRACE_WORKSTATUS_ERROR;
+	dtp->dt_haveagg = 0;
 
 	/*
 	 * If dtp->dt_beganon is not -1, we did not process the BEGIN probe
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 1033154d9..2c376f59a 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -405,6 +405,7 @@ struct dtrace_hdl {
 	dt_percpu_drops_t *dt_drops; /* per-CPU drop counters cache */
 	uint64_t dt_specdrops;	/* consumer-side spec drops counter */
 	int dt_statusgen;	/* current status generation */
+	int dt_haveagg;		/* FIXME: figure out a good name for this */
 	hrtime_t dt_laststatus;	/* last status */
 	hrtime_t dt_lastswitch;	/* last switch of buffer data */
 	hrtime_t dt_lastagg;	/* last snapshot of aggregation data */
diff --git a/test/unittest/options/tst.aggrate-slow.d b/test/unittest/options/tst.aggrate-slow.d
index e2a0f2cb2..cd91c0a6c 100644
--- a/test/unittest/options/tst.aggrate-slow.d
+++ b/test/unittest/options/tst.aggrate-slow.d
@@ -9,6 +9,7 @@
  * When the aggrate is slower than the switchrate and the pace of printa()
  * actions, multiple printa() should all reflect the same stale count.
  */
+/* @@skip: aggrate makes no sense */
 /* @@trigger: periodic_output */
 /* @@nosort */
 
-- 
2.43.5

