Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A36199FD3
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769531644; cv=fail; b=Uzrxml179sXw/GzN2XALj1ACGb/pWYZACsY2k//a0TkQ92Ho3ORXOeHMww3Wlyts8ZXRTwhWu5nCwLhTP0AEft1faAOertDyCF+oVEjj23WWuizV9Se0eIEbw/6nY7r6FNINcftUDnEX7Z177VRMyExtFAx2L1X3FbEmtTxjEmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769531644; c=relaxed/simple;
	bh=f6fsxhLD0XU39A4YinYxazUYhrKD3MP8/JsOBKsl1Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oQSD4CKxm1x/LZcHG4KbyJOCSrbcwlaYDju9yTuXRdyueuglJZX+ZbysGl6t2wFK4nV9FHLvROtSDH47Vqj2zCeSlhaGDNP/fOr5OuHs9Ceoj7dgmuH0Tf8U3BvzuRw5mmaIToOFhBmYuaoOlLoFC/xLtXCdvMPaHctMP4EJxI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jt0Rij/H; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IcxvQk1n; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jt0Rij/H";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IcxvQk1n"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBFNQM3331101
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=48M9d9a5JrVQrmNtuF
	TBaf1xv6x8hJUL4pYy3zOfWbw=; b=jt0Rij/HldPFgv3tfSCRTNZLucL4ZY3QaQ
	7zT59Y/XAsvOS45LW5z5PrOL6K3k6XfWWjjbJzSADWy5NnctCZ1sjCTRpRXqJ0mO
	mtA0Af9iVz/Fu6H92vORSk92T3epOMZpJfr/9LB4iBYjfsP7hU9QOk9ZMQigHMYd
	YnTc7JM8E3l5RvzZjiOFPSP1ijEeGgQzuXwUWHHncPztNESedRcAqlv8Mo3acJDD
	mSKEJ7giYFkeW6GtmvSA5STmOgWNbyUK+ljF4B+HDlzU38Oz5gYrUd/z3l9Jv3id
	Yho3cyOmjLpFrMzIcYTEOsz4S9j9s0QWfpV+GbrKAq4wqo36Em+A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvmny4cgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:34:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RGGI7e010007
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:34:01 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh9p38w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 16:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOJTHGoTbjOQ34iqg1p9gWoGV2vC/huQj7TenBCmyQE6ApniPTrlMUIkgHuDFdkShMbWlPPJwn0ku0E39PyyeoXdd8cb0HCL/vZGUbBOnaEUmlBXpyhHD7JQPCJIO2Q11WUKNikfj7I3sHwqG3OJt/3tcl4bF5sePbDyxMEIX8ZoOzGHMSyMoGjLw0GkLh9jmXsuNXcECIE42hfZnH/b/JtT3fwlIH4OfJKbZHbcfDcmLiBOOLkOwJFFUudx5gD6mKaYJUgc1G4pgM4lmLLDNoc5LQpk0+B3Lfr/hAd94a71OSs2NIBFHTmAbqdy5f3H9Cje7WGaPeNICkW8khxvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48M9d9a5JrVQrmNtuFTBaf1xv6x8hJUL4pYy3zOfWbw=;
 b=ijNxqn5RKgX1J94sFvBBTLEgkN323Gi+XTXa9jcM87VA5lkmKTvKRbWGbVXLBJy6rsJ7xP2orr6bDB4hbtxzJrjy9CnIqorsmnzviWh0udPlwB5uwn25m4TkEpLykkRlpo7VmNJcPM/bRkiPlQwod5MXMcmNmHqSL//1CjoNXRjZMQ2Msoln0ZRaQ7foxBdK27Pco3lDWaVAxLAGNL+YOotzhYPFEnoDuAgv+fBNwj8BESDvJOKcA572KoULQLDiwLeVa4zkhUTJklIUSuDtqOgL5zDSm45ZFZser+mBdaQ9zPeeGh+m+vaSwfMqwQ0w9wcvbryHVbK3l386U61oeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48M9d9a5JrVQrmNtuFTBaf1xv6x8hJUL4pYy3zOfWbw=;
 b=IcxvQk1nMX/KGnjL33LAOCwuEY1KJUwDHJs18KtIYRLTA7GRcI1rttYZA2QmkVQtc/cnGO84QMQ9fdofhrYJpnyNZr41prN2rGXEB/CxmegKhgSRb5rZcYUr+pa81/Rcncyk9Cb9Kp8ZRymH8Jb6hkwOJhQ8ZAezFllqV6lJuT0=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by MW4PR10MB6606.namprd10.prod.outlook.com (2603:10b6:303:228::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 16:33:53 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 16:33:53 +0000
Date: Tue, 27 Jan 2026 11:33:51 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] Support deeper version numbers (e.g. 2.0.4.x)
Message-ID: <aXjo7yTmrpxJzvJk@oracle.com>
References: <20260126234150.20939-1-eugene.loh@oracle.com>
 <aXgScYsIu94O/Me3@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXgScYsIu94O/Me3@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|MW4PR10MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: d746c135-cf95-482a-8c10-08de5dc1dbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GeReyIrODcLFO71YaCPdGlV+mwiOFCKxDwl32Q5SFEZ2RulDuQOHFSEofGDj?=
 =?us-ascii?Q?GWa3LoJfMBQrukA9gSgL7DMhfcVmNqjk1cZMMPCxr7J8ItTRsBBgOqcb1DAo?=
 =?us-ascii?Q?jxEn2a3GMNGPMsX00QLY1gOjPxbQ6TZqph9e5O5o4RjyvVjdcIWerXxof77K?=
 =?us-ascii?Q?4hB0zWZkfNvUerX/pH4Kflqakv7KRQzoLEVcKZJBLuJRZQm09fvsdy9+qMCN?=
 =?us-ascii?Q?toogSvuAH7IS/zHWHA0mY7EVglBg0stNXYucyvyWBEuTfofrcqxOs3Pg0lEQ?=
 =?us-ascii?Q?p8Y0W3gUZtohEXZrMr1A1ncG15f05r8lRG20LS2BpKA0GbBtuc0hBnYswgHs?=
 =?us-ascii?Q?aBWm3EB8jL3IW+pFY7AV2MHTZHl7fWt8NVC2Pg54gGM1wkXN7D6WeHvRx039?=
 =?us-ascii?Q?j/hmHlMwkJzr5Zfz6GovzoOMMRzqNJjoS3SLP13/NYIU6As+sqWbdrlR//4V?=
 =?us-ascii?Q?mLRRvxlGSDYednWMMYWyJGmLs0zac/moF8KZNMGoMgmCuteocXpEmH+ODl11?=
 =?us-ascii?Q?TAdZ0Y2TBWKF1oeF2J93s031RdKI5+5Eojw90v0p97u9y64+t6Qrb0XSIO6d?=
 =?us-ascii?Q?KPsYVOMqdwwgwdKeYwtfR45qa0B4AG/OJT6I6SUkGzlGt4skELxyKNy+AYdc?=
 =?us-ascii?Q?R5JOvBjJVnGOD+9lf5UfIyMYla69qDvVlZ9islRHUCSo1mOSa+CURS8p9TV4?=
 =?us-ascii?Q?zx8+ZFQGRLwz5tusnvkZEedw39bXm19luNz0NLK/rRfnQFbVXuqM1KYtXLNT?=
 =?us-ascii?Q?x6DDHDEjEVdM7vez8BpgaO6UFPnxC0IQMocC+AIkNZ98ETtkrA0yYq6EksRR?=
 =?us-ascii?Q?jcAxzaDXdRXUT//2ASZKkrTP7rzNqUN3lRTerryQTcROhf/3ac8YUg+KwxOO?=
 =?us-ascii?Q?RctkvMoFnAtfoVrsKLoalXpqrrSKg9kosTtTCIdZJwRo8BdTBMdoxkIZaxJM?=
 =?us-ascii?Q?K7yWemXHHitffZG8/IjbrPtk2MHxaiUVEeBqbaLIdjTbr3QPlCODimMqd62i?=
 =?us-ascii?Q?9hU63L2XvMfRw0l7kesVe0c4r+QkwKJ1XXE+PYEVVfAim47Ar/QAat2n1+iF?=
 =?us-ascii?Q?/Now+h3CWcX4VWPmJvZ59E7HQr/pY7K0zKezNKmb8HjJHw9jtJ1M8adca20h?=
 =?us-ascii?Q?5X/OSjyDVyKK8/yFrCa9MCKngwSlyotbvxPS4BS4YHiy2nzstRVJ6CFN46zu?=
 =?us-ascii?Q?yP2NXWuLHGMtwcM8vCdQ7olg7sL9YWay9I2C/uOUw09exlPgSmzDde3EiUrZ?=
 =?us-ascii?Q?I1kLd3pOAhrdXO+B/0llYNksGfoHZpNOUMygT4GSu5L5UrdsnfURkSfSuf7K?=
 =?us-ascii?Q?uYw/ljSoHwLhihqptWleKikUTIeahHfaolYC9fffCLtwtyolOCMZmyrZUKr3?=
 =?us-ascii?Q?excnwdpM0NFlUTWETdj1g6eqGDJBRFa6LMUCjRiQkbUuh2h1VM0sC3Eg9k/D?=
 =?us-ascii?Q?al5svdf00p+m3TT7YOxrk3+FQEE4aklqrh8y+11zMSA1y7jDmc0+TjvCUlIW?=
 =?us-ascii?Q?qW0+Ggcmz7jrvBWV6veLWFSow0WszpaOM+jqSfB2OjTpkitTS1ftVZ/q80yN?=
 =?us-ascii?Q?PcgwlAmqluH6No0Yw1M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wqD8x7urk65E9CHum1ib0k6JpFLlSMitNjc3MPBhXijWDP+30MaVZZzOtTqX?=
 =?us-ascii?Q?X0WhWFfWrT2kCqmKWiptZV/NHB7Gn3aR5XdGlrteupVPmK5gv9fgSnfdKEr7?=
 =?us-ascii?Q?dbshYdrWSijr+v3kdih9t3YDN65+qizThRq/YZ2z+5ElUMQiyx1gw4Z+rKjh?=
 =?us-ascii?Q?/EylAdUwPPBx15t9oQAng6hYVPRsSqK8l4r1MRPQsQ4hm4RR4wQAIxa4ht+I?=
 =?us-ascii?Q?DrY+ZtyeB5NXPMp8SwwWE6gfcCwMha7I76uNoLTuJNFjAmgUCJjGMDP9fZty?=
 =?us-ascii?Q?F6erw1boQjLx5FFcXKJcNB7R/YdEcpUhhYSmhRwpd9/xb9onyp+XuVRXYy//?=
 =?us-ascii?Q?c1uecT+qHfNOAY6TZB7z17xww/qe420j62IobpDau4FWgvb7gwbQjXu+IOQp?=
 =?us-ascii?Q?kUMcSV74chStB3cf5IsaJnyQCLGGhZiioBXjAMUFq7DjPhdj0C2jhc8IVDSA?=
 =?us-ascii?Q?8xAFkm05YnAxKTI0Bna6l3yzICDxwwH7lr6jrejAlj+YsPfeouhl0/HjDA5f?=
 =?us-ascii?Q?iG6LubRu/fOhDBfEBdFArdIuXn4tt2G/MV6v1IltjZlmVdmRRwf74uq8Kk7M?=
 =?us-ascii?Q?zmYXhEVP04nH4/pzInBeW9pLKKFv/sLo3o5jPQ33u0DYJajWA4Yxbc2et+U7?=
 =?us-ascii?Q?Fo4U/q/MbmFVIVIxEYccKdX9/+7ooY3EFVDG/ahuUVtpb8g8i3jYE9GgZvIN?=
 =?us-ascii?Q?pZY2P3rYjB5tg8nchXSCJRIIIhQWXudFM3HEZWVNZlzU2IlxWg8eN/PA9Bu2?=
 =?us-ascii?Q?n9RFG4iG0DXBYb7epi0GqN/YLYhH0Z001ghJ9+baaMAOQYKPPgJPgjgkzRg7?=
 =?us-ascii?Q?cuZI+zhUxKTXX6WjcBCGOXBORtc3c17PeiD+w+Hdd4zSgKobjS/rdAUfWIww?=
 =?us-ascii?Q?zx5cEj/GPwyicp8KW43tmtQ77+or97Dxkzwb7nECArQoaoo1lb0IokyBNIB+?=
 =?us-ascii?Q?8o4ZEnk2vbvjHgQbNtX0ac+SInb4yaN5H+3Sbe/Qdiu/5oQy7WVPucdtqj1A?=
 =?us-ascii?Q?jwZCdLLk4i7wHWfdGT65fT/L0FxJFinpfMtcitqy1bREhrKdwogDC9NLSR+V?=
 =?us-ascii?Q?q6thxw0LIObbnDvq1c/1JUzj7UAypLmMJYbw3uRN2vYy3cwCxEL/cMHeABGL?=
 =?us-ascii?Q?IKG6SxiAKj5yS7rCTdREJl2HM1UGfnVn6sLOYw1/3ZfTwz2FtN8CF6GaXGk+?=
 =?us-ascii?Q?YCQa3HR9jiLeMjuKTQmifafxqVxhmCI6E47lF8AUnEYSWFMXcZDntUyQbkE4?=
 =?us-ascii?Q?zB+v/hrGNNuJQ9yl08mahbtYZQSj/s/kOZKoz9vAtDZZRDHIul1v0xgV5/q9?=
 =?us-ascii?Q?eR6evrGT0CqCuue31goWXASN0n5dhzO32CQwGPJo4pYKkOGY8TAKb3jDnzXC?=
 =?us-ascii?Q?eCwDvOUzbjEi8dnZ4DX8fkKuWbOL04oC786eKsmm41BR4Jgex4ikQy3XQPWO?=
 =?us-ascii?Q?qzfeCYgRKBG9j2yyN7ktIxOPWBi/ZX+Fw9iHGRVHOGxX84ofn2zpd/zca7ta?=
 =?us-ascii?Q?kLI/2Sb0EqpWD3ZA9oGLoqReqGlHxge3r64uWZDnAAGLvgkhIIJ5Ej4+GRcM?=
 =?us-ascii?Q?AyEe/rWjBhnBVo/1Img0sG+gXviHWitvtOjTv2y0ytd4r7UIBwC/eri0165M?=
 =?us-ascii?Q?iBG2lmJ1NA0rJzoC4q8kNWnkm1EYVfrm0hLgF7c0h3ARt6Pr1K8xUqVxkQ+K?=
 =?us-ascii?Q?ql1E96McCnDhtrKqaRRMOBbVhKhMXYiSQqrVz+B/bh8wAVOqGS7hZMacozb+?=
 =?us-ascii?Q?31WU9vQTpOgMHRdeEj8cME/tm8nQPR8=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FDVtto6MNgeQxBFN21ynHWYoQ9i5De7/PqWtEUkSKVasex0yzz7UmxARf+xrntTCr/tjlKluyGLa+wQ13E4avCqSECZLlEHm4P2VShstOoTExVgrwMM9mig4phJGTsMkixYXFjcBMsM4pBmambUUHIIhAiLTWTig+QrzNsWr49ZmKOivKELwJqYFgNaAtE92TxEZul2Do6LcIW27y+6Bz0nOXAgdgLhYzXTjuTPCq8z4orxPvEdniRagalaxLpSSMmeUbfdreLP2W2MPGBlSggrNGoxDqNKsxhc7oIRdTGyvc8aGftb7S1Tj5uam6htkflTwlatLkYvWXGBPNkR0XCse40bf5rBbhDBNU3JAFiIoSKEL5+glrZbgTFnQrK3eNyT+bdi9F6GE+mRfQh9ze4m9vOvjsyHY8zS6kMvY/pb7eHNEIuccNkY96B2kCn24EuBpM4wHpvd5x2ipteP1QGq6wBdZdZ9u5OGXBftsQ70gHYo8AyH7eGzQrjE0SI+aS+aA5lw/sLnK89E2lkwPE8PvleznFgKe2zc8LzsMXrh8bk4gssJ8EopQpLtveOsrNrUHRYKMrec7Tq0VHN4kjNxvvSEJ3Oc4onQ/t6nhZAY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d746c135-cf95-482a-8c10-08de5dc1dbdc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 16:33:53.3310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gfedan/9cmJpanEbFnjz5m5gsu4FdPnAZBephz5v5FRLNDFEm5zRtWD/3KRIY9hHqYtQTueXG9wvs/DBz6Yv+VV9iD4MGnZFooUzRu2gKiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6606
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601270135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEzNSBTYWx0ZWRfX9+P9tgPztenm
 6ib4LSliTCzylhdi7yBfYPdmVv1Qv5BZ6nprp6Y4RTmSJ9VG1wySvIQl9RHEFSChCBj5j61+Gna
 VYXO7RXin1ryKAtvBO2ALsvqBP/5+FsXE9yxRAbbM2e8vgYG85was1aGXALpJQRjtnmzFZuwBLl
 rjNiJe1D3YXWKKvAl3oAoDlLmE3phO+OgCSuwPz01un23Ay587Bd4qdCO6eoqIkJfZHWTXIoj1H
 UyWxY9IL3c5nBiU9oW50dmtvL48vwiOl8VT62Ek2aEBb2w02/bUM9CqZYtm/bFZr2OJQ3PRlih1
 rUN9Rp4KRYle5gPZS4RdNo7xRMld0QYn6YtKhoLl8iPjI4VIK2MGwctuAn0o+goHVeMR/eBl50O
 vXim61o9dg+F0ZVWhZsKsBCRhxaYgufjLVauTEnkItsKeQZdEfRQSB3p8pp8r5+evv1gIAGXV2u
 0yThq1qSRTd6yvEyuHw==
X-Proofpoint-GUID: PM8fpCxM-PZgpby4cOga2NcV1qy3CZw7
X-Authority-Analysis: v=2.4 cv=cZrfb3DM c=1 sm=1 tr=0 ts=6978e8fa cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=I5Zgkr24-y1xtxlckEQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: PM8fpCxM-PZgpby4cOga2NcV1qy3CZw7

On Mon, Jan 26, 2026 at 08:18:41PM -0500, Kris Van Hees wrote:
> On Mon, Jan 26, 2026 at 06:41:49PM -0500, eugene.loh@oracle.com wrote:
> > From: Eugene Loh <eugene.loh@oracle.com>
> > 
> > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Woops, I was too hasty on this.  More changes are needed...  See the following:

        if (current) {
                $0 = versions[idx[n]];
                if ($3 == 0)
                        printf "%s.%s", $1, $2;
                else
                        printf "%s.%s.%s", $1, $2, $3;

                exit(0);
        }

Obviously, we need to account here also for the possibility of 4 digits, and
then again in all the other places where we output version numbers.

> > ---
> >  libdtrace/mkvers | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> > index 6f9240320..087c09169 100755
> > --- a/libdtrace/mkvers
> > +++ b/libdtrace/mkvers
> > @@ -10,7 +10,7 @@
> >  NF == 0 { next; }
> >  
> >  {
> > -	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
> > +	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,3}$/) == 0) {
> >  		print "E: Invalid version string: " $1 >"/dev/stderr";
> >  		exit 1
> >  	}
> > -- 
> > 2.47.3
> > 
