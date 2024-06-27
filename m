Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC3B1C2AD
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466521; cv=fail; b=u9ETv/f0pOCtNAzNbHE4GEzo/BvpL8tl6fY+C3JnZ0XCpibCswjgh1csHTmB8hFMfvxM49C63EnoKfL162YertoJlwDR0e0tgixWCfwEQyO2iyePLCBhoOWSB4GL2FAPBeLnaLofIFIq0RsfMbFWboFaqqo6dbLeDBOCdy+2OjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466521; c=relaxed/simple;
	bh=qavNaEPx7Hv62+gFNTnHyBAaAYaHzlH+FUbaGaeORGk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y83Vq5m1shsbqAgcJ6gqelINct2kR8TBTdO3m1T45tGLU6TbD1uE4EpPDSx6jsBaemCNrrWsxEikZWgh7/eRqitK40pOQFGOuwmZ4M1N0xmLr1/atoVT9iCnU5R8AIlWYUdr3U8Ewc3rBJ6iD4+F+UJ6d9r7RPwqZ21Sp7KqKOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cNMrMRnd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hcTGVHjN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cNMrMRnd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hcTGVHjN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMTRq007286
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=XcZ8135/SYJLi1
	tTnM4d+5K1gXCwm96KrNean6E/qcw=; b=cNMrMRnd6oi2H6y0Nc3vTbNqpanHVh
	yjvCYVbLb5HP/Oijo054Na95ueSA6uThkL8qJ7/IIotcsfNFw5dB+KMNYVpPTrr5
	qizlgvMngXajVEB+k0S8t0Ps5VakE+nlEV9Z1WvzL/oo2WdSd7hZqYtTJPdZVatw
	lwtMDQZC36FGN/g7zV7/AmXR2WB2e4IGS6Ypre2KNH8H8Dy9nyB/3H5yE/LxrET7
	4iqFPrTPH/JOoAkhgzk3EFB74a8Y6XXjhUJl+MDxpiK9VveGD4uvcqGc8pYKJmWs
	hnRJA6U4pCuEcgIf0eMJb350UqStGYbJHam6oj0sFD5N8bQK3LmspY9w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywp7smx5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R54FLu001367
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2amwxw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mv15NR5/JoKJX7hM8XKXZeh78AzQD4o1hjnyNeCFj4h+r7OC6AfxCqZzRS6V53TQ72dQXBsQqXRLdmvy94xrVucyd36hiog9y/EqgskvuGVQUtXnjYKI8io2Iy50x4OogGOUdrIW5hxHk4WjNH33cjQcnCiw6dCEn+nctWFWOVfgu9LSLNWynqpyjx9VlBrG/mjdZz2u/iZb9ph+OZfuYSg38gt6m0H1uXoZLO+S9jbeX9erAJ/vhaw0Y1LF2ib7owAy+CBv1EP3fWj+AzrkwAINpYIuRDNnbFMzagOGjT5oTCWd33hAIHJtqvkd1dEyhAc67rBrZtybPKf5TvlvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcZ8135/SYJLi1tTnM4d+5K1gXCwm96KrNean6E/qcw=;
 b=PQPrMrVUrtfVPVaToQRz/jJydvLT2EdmtXQ45kgn1hesI4GlHr+HGzjSZZZKuAa1h1eLfJzmngfKqABtu55tmve3C5HFvMHrG4hyYEEF0Ae0/1O23bxfzyBCAO4nrUAXlp4wgwCRb31hdF0ISxtgeXLFQ4bkgVTXzJmVCfaqU+Fpebv6mLY1LZt8JA0C+0wjQqYlsH8VHoilSvi8kNycPeYEv2n6DPwybKwCxwMtDOiYH/CqsnZR/U6ddPFJoppvtdJfVtlziG4+PsIrnUjzz7+MxPLZzSLRoo0/GUOVBflKwa9UOmCQCTXiiXlHUOIPc3ngTCysKIc1+oxh9iZKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcZ8135/SYJLi1tTnM4d+5K1gXCwm96KrNean6E/qcw=;
 b=hcTGVHjNCW3Os6iXUQbXxuYkzuUhI1a8lt6sERgdXfhTHotJPgmM2qd2WcTkhn/aVw0tpLR+TQR+AkuZZNkHOZ5gvqM5tB6AunUC+LWLmIUysUSV/N68DIgovNBlEZ/ALJR/5l+JrJUAEoDCUFHD9Kv4FrOxx6m5rzbd1b67AfI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BL3PR10MB6041.namprd10.prod.outlook.com (2603:10b6:208:3b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Thu, 27 Jun
 2024 05:35:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/38] Get rid of apparently orphaned bufdesc stuff
Date: Thu, 27 Jun 2024 01:34:21 -0400
Message-Id: <20240627053455.21567-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BL3PR10MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: ce06e2c1-a28d-41c4-5e31-08dc966aeb68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2QA8zILadq/1/V1yroz44WQ3suAWCuZQ0aXt6+N4kZNlxfLMqo6cdxtXZeKY?=
 =?us-ascii?Q?4NpIoPRmk3SR50SUEmSwbdbKiFxPq4mTnL4Wzxb7iGLrVAig1bhr14sNgKcz?=
 =?us-ascii?Q?ciEcIizZATinJLEmdRrMqiKvtEMgWk6kV6mAJFSfDSp2r0szFfnk+3NH5ThJ?=
 =?us-ascii?Q?Ly/aRZ94cr0eLX1D9DxaUBVCHLhzoXXacBcqe/ss3gute7UyYZlgwnHLIt3N?=
 =?us-ascii?Q?ORln2Lm+H2zfBE5hja3nfEyKT5Fb9NSufrA+Xt2mDkJIsyBAJ9lbZMSpVaPr?=
 =?us-ascii?Q?Fke4VyiLGLp5wtaZ8D15KIqQAEtIoZw7//PmIlEaw8ZO+TCQFdEpZiMngGKq?=
 =?us-ascii?Q?E58cImdtVMA/mHIl1kxV+nbJSxW3PiCOhb60k6CFIODrDk/sg6L5UBd/fbGb?=
 =?us-ascii?Q?Z9YtaX4lqlSJU9HFrW89DiCOsDV5XOYwSgIgR136neRvvZRP2BWQXpfc88dl?=
 =?us-ascii?Q?+feb7NFBy9s0ampKlosMHeFGh+iEnapOSiUoeX8CtteypQn6c3fZA4+KwVwK?=
 =?us-ascii?Q?EgD2bjie6azSXSYHTMsO44CTNKgtLF07Q+dwaHvEPjvIddrNmaeiDR4Zigat?=
 =?us-ascii?Q?Dm7yiFPKsoboFT6L/4sRatZxx9HKFNC1K9YDyidA2DpbBi/iwH3LjWR7V9l3?=
 =?us-ascii?Q?wqPH7itPFLLCx6FQyfWShlM3w/HLEi0lYRum6PvVKl5RjHLt86OxRu4E3u/T?=
 =?us-ascii?Q?ZAoyjMK5cFLi1LxOFpzChIJnGpqkWoFQRrSEGsD6SP/71KCkH30yKtO5xGbI?=
 =?us-ascii?Q?qCNiT+AMcA93J4IY3rD5KLJy5SuNqPDaY3lpejqJw5Fy2++W9gjnVseUK8LK?=
 =?us-ascii?Q?XTkGIuRS8QsF1IiBWIGcCR8PpneTG8/zf6RYuhxWSeEb3aizEu8CVjcOJqZG?=
 =?us-ascii?Q?ZCEys8VT+76ZlvdjlVHMlNeD4t3gBFzQh2SmV0YKfDuHZMoNPT3/VWs8pRUV?=
 =?us-ascii?Q?QQ4l23t1/hfH92cCoi8zdt7zbzRjO0wsWp+Q/ufWrIk9AMSyEeOhRopxkl/+?=
 =?us-ascii?Q?3KVEOUnfUqHbY93sRoujAroQCC5kGJpY6gYuDBqI0yKc3mo+LFXpGjy0VTNu?=
 =?us-ascii?Q?0MaruGUAocD1yuzQ+AR8imUz8GYsTQma98CsBMwvkLC4H0k1U5gm8TUAqNgL?=
 =?us-ascii?Q?RihiBUo2LQPh52pzMYN8h/mNvJ7kZ/ohhZSz4Z/3LDMXqgOztAExT82qNoDj?=
 =?us-ascii?Q?wwofFmYNPZ6Q2WmQFFOOYN2lHlTZ+kqidofO99ZDl0krATpedRE7/DtDV0zR?=
 =?us-ascii?Q?cRAYKvZcXhPh3oM8rISLabNNqNEq5iIRWIHIFdD4YKdDfmuvIJp8ja/3YpGj?=
 =?us-ascii?Q?JyMiqo25Hfl5tLDDkrO4QLHi?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TEhs0ckMRPQeEig7v6iYdD4p4dNcr2y9V8RUPYm9jbz1AdnA/eDoAwjbRtPf?=
 =?us-ascii?Q?j85MbA1fn9lNUZSx+DOvAu5XEXp02wD4l7dvs3pKLNUR0j8jjXvxSFpbMNUd?=
 =?us-ascii?Q?p6SxK1hD7fxtc4/CizoeYqtdpQ2epJ3ICHP4jv75t0xMNYcoXXSYQ3nk7yu5?=
 =?us-ascii?Q?aTS+8AVkCai0cWkNBpVeQGj3DBgRoQmLSgIBwSq/vaUzBkuFKui642nLnRve?=
 =?us-ascii?Q?bbpYE7CL28Pra1N44jNYkqjiMl3wrKo6qVLcM3r492Qw0kb+yZOzFQyQNusG?=
 =?us-ascii?Q?0/2LBizU2cpYsEaSY/bIwWke97USIsRuJ2kHxzOTlBd5UIU6Nmb+iI6P28+k?=
 =?us-ascii?Q?v82244BLxpSV1UV0qOy5XmnI4+99f6EZdOX1dK2XXOa3kf006Tvio1vwDOFX?=
 =?us-ascii?Q?wK0wUN7ByL4WCrqk4w2bs3O9XSii44204zJb7uPkGC6YCYzcw3JAEikDpuhD?=
 =?us-ascii?Q?utMkbJNrvGCj3oD26OLk1WjrXasHY6/jG/Nb+TSe3RZ1AvASzz/ey7YCX4gZ?=
 =?us-ascii?Q?495ttW0yLgHsIZPxIntnqiiVqF/5MYoi0cynGT6iNw0jHT1pRwzxCOB55UPl?=
 =?us-ascii?Q?zUyp044zQL0GeI7+1YG+ZJaXhaXuVcCLsfgBmTRU6/wf+rBz3dfcIFdf2bIN?=
 =?us-ascii?Q?47uDxo2yPE7HtmQK5aJZehXrLu1e15A2qpje//AEjCLD11IZ1XiLCOns6YAQ?=
 =?us-ascii?Q?Cn0vnXFkHpTwSSLqeYsx0P+GvLiI3RfeVchW7Qv8M9TiYP5dNxZlVlbkQz6x?=
 =?us-ascii?Q?1qfkbXwjnPbo3YQfPjYvN/ogWZcCinY9OIR9Ik7fAfjbCXiqIZeTLPdghvI5?=
 =?us-ascii?Q?ABA0vYvJoyJW/GWB/aB3/SMLBYyn9jtAgFkFzuN+Qy926rZnTFL8//uN/SHw?=
 =?us-ascii?Q?JPnYoiEpMxUMEGC5YlM7xUibEZaryaGS8aBN2rAJgbZFjq2+EqxHbyVEA6VO?=
 =?us-ascii?Q?7oyrZbnXPOVZZZIYgJgBjaf/6UEChBnd0G5niQaEQgPxbiTkqYZ0vKABSDR/?=
 =?us-ascii?Q?hLaAuRoTF+djI3hzgHmtKAO+jUDAU+AAyIUZdyenyUT8qI3QhTZoNxvzE5ZI?=
 =?us-ascii?Q?Nk8/HanMoLq14DEtaDJc+kbkuK0OakHMyEzhU7MiYnVkd5WY3ib74155BSW3?=
 =?us-ascii?Q?yswfDsjK/hzPKq5iEGwxoFeAJUd58SEDeGfYT0r95dKS1Icjm3cQU1aUbPs9?=
 =?us-ascii?Q?ayfkdznM87xoGNd4EsPyCFYYEVXQGahm/7mVUCSqx7Q2F5Y7pE+hVQM1eif2?=
 =?us-ascii?Q?ivfbTxVvHt5+pKolo5GUhUrmm+w+Tb0fhAae3x2mlMQDFX04qTqXVaVNb5vq?=
 =?us-ascii?Q?YormJlX+B3olsX15TWaFcFdApzgxaJHlbEDDXaXs36aTz6v0iUWq0H24yF4w?=
 =?us-ascii?Q?431pJV/yLPLjjNka0Ya5IKs2Sh2eU5xQ1YZgPD+ILXKV35yiC1fBMiTUPDL7?=
 =?us-ascii?Q?Bdsa77TotHLoxVKh12orYhsbn09dQkVB8fQ9VmcQy+uRani/GyGK6aR8N5cb?=
 =?us-ascii?Q?Q8206az8q7fNyYIdeoeDmWrkzO71J7sXxzymrvze288y6x654zb3hYPs77uw?=
 =?us-ascii?Q?R2YXG1HrmHJbC1j9Gqoc5nvfuhIHnZEydyjjvpN9?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PVzcBIdj01SXU1VWLTicxh0zDRNaeOFfv5sXoxQ6yc04B4ng862hBYe8lRFSJhY4tWqn8OLmxdDW3s62NB4jaVfrRIdltbgIiQZj//aNsh/WzzxvGgD+wlr+YB04gw0fFjABEGB/Jn21PemFwN0ZosWwQ4waQEBwUApEtk4qzvFxyIZgDeIiqrBs0MdikVpRYN3E1QceS849jiN9JS4gF+ZyPZCsH2bqEMRGiTqxw1D5MUj37SrZndaaoeMAuco/uBin5udf8JQV/cWpVuzR0QGx+YEgb4N3CLbUqCD3uARTe62th8Y5jJpJSOovMvKMT1PJNSzG9HWcByssKiXlC3YdErCvDmaRqSKZFh6aCUxgTvjB1iDRso8hqV8AVS4V9VxyKoUGE5qHVEWsMwLv1GLaP2KPB+KZZR7Cum9z03gRrCapw0pH3cNmbJGiX7vp1m1mQhHcUj/wQlRKA+fmNA+8Cm+Xz9sakm4JXQox8gPFjFp1YFnXR3EzRGVj1ZW+xD2tuoTmZ1DhdPou5g3xAID+a/wBqFcDN+4C8zQ7MpvLZciZ0Q6QZzQj0sOycGbcZL1giPuZBRBn99GcX7Sz5J7TNKqKq7BWLDNG38JiN1g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce06e2c1-a28d-41c4-5e31-08dc966aeb68
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:14.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpsJbbFJ1glUur2pkfQfYWqc1JHJ9KB2nf1C4l4aOHIa2+t7frg4pv5zB9nC9MJNhze5TcADUsjIH3j6PWrUpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406270040
X-Proofpoint-GUID: TQt3T71g1f7JG-AO63xQOYJ0XDk7DYMZ
X-Proofpoint-ORIG-GUID: TQt3T71g1f7JG-AO63xQOYJ0XDk7DYMZ

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 cmd/dtrace.c                    |  3 ---
 include/dtrace/buffer.h         | 42 ---------------------------------
 include/dtrace/buffer_defines.h | 20 ----------------
 include/dtrace/dtrace.h         |  3 +--
 include/dtrace/ioctl.h          |  5 +---
 5 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 include/dtrace/buffer.h
 delete mode 100644 include/dtrace/buffer_defines.h

diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index ba1c22c5..af354653 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -914,7 +914,6 @@ intr(int signo)
 int
 main(int argc, char *argv[])
 {
-	dtrace_bufdesc_t buf;
 	struct sigaction act, oact;
 	dtrace_optval_t opt;
 	dtrace_cmd_t *dcp;
@@ -940,8 +939,6 @@ main(int argc, char *argv[])
 	g_argv[g_argc++] = argv[0];	/* propagate argv[0] to D as $0/$$0 */
 	argv[0] = g_pname;		/* rewrite argv[0] for getopt errors */
 
-	memset(&buf, 0, sizeof(buf));
-
 	/*
 	 * Make an initial pass through argv[] processing any arguments that
 	 * affect our behavior mode (g_mode) and flags used for dtrace_open().
diff --git a/include/dtrace/buffer.h b/include/dtrace/buffer.h
deleted file mode 100644
index 6fa8c769..00000000
--- a/include/dtrace/buffer.h
+++ /dev/null
@@ -1,42 +0,0 @@
-/*
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- *
- * Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
- */
-
-/*
- * Note: The contents of this file are private to the implementation of the
- * DTrace subsystem and are subject to change at any time without notice.
- */
-
-#ifndef _DTRACE_BUFFER_H
-#define _DTRACE_BUFFER_H
-
-#include <dtrace/universal.h>
-#include <dtrace/actions_defines.h>
-#include <dtrace/buffer_defines.h>
-
-/*
- * In order to get a snapshot of the principal or aggregation buffer,
- * user-level passes a buffer description to the kernel with the dtrace_bufdesc
- * structure.  This describes which CPU user-level is interested in, and
- * where user-level wishes the kernel to snapshot the buffer to (the
- * dtbd_data field).  The kernel uses the same structure to pass back some
- * information regarding the buffer:  the size of data actually copied out, the
- * number of drops, the number of errors, and the offset of the oldest record.
- * If the buffer policy is a "switch" policy, taking a snapshot of the
- * principal buffer has the additional effect of switching the active and
- * inactive buffers.  Taking a snapshot of the aggregation buffer _always_ has
- * the additional effect of switching the active and inactive buffers.
- */
-typedef struct dtrace_bufdesc {
-	uint64_t dtbd_size;			/* size of buffer */
-	uint32_t dtbd_cpu;			/* CPU or DTRACE_CPUALL */
-	uint32_t dtbd_errors;			/* number of errors */
-	uint64_t dtbd_drops;			/* number of drops */
-	DTRACE_PTR(char, dtbd_data);		/* data */
-	uint64_t dtbd_oldest;			/* offset of oldest record */
-} dtrace_bufdesc_t;
-
-#endif /* _DTRACE_BUFFER_H */
diff --git a/include/dtrace/buffer_defines.h b/include/dtrace/buffer_defines.h
deleted file mode 100644
index f81c22f1..00000000
--- a/include/dtrace/buffer_defines.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/*
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- *
- * Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.
- */
-
-/*
- * Note: The contents of this file are private to the implementation of the
- * DTrace subsystem and are subject to change at any time without notice.
- */
-
-#ifndef _DTRACE_BUFFER_DEFINES_H
-#define _DTRACE_BUFFER_DEFINES_H
-
-#include <dtrace/universal.h>
-
-struct dtrace_bufdesc;
-
-#endif /* _DTRACE_BUFFER_DEFINES_H */
diff --git a/include/dtrace/dtrace.h b/include/dtrace/dtrace.h
index 8f28c9ba..7fc5f5f7 100644
--- a/include/dtrace/dtrace.h
+++ b/include/dtrace/dtrace.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2019, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
  */
 
 /*
@@ -21,7 +21,6 @@
 #include <dtrace/enabling.h>
 #include <dtrace/metadesc.h>
 #include <dtrace/options.h>
-#include <dtrace/buffer.h>
 #include <dtrace/status.h>
 #include <dtrace/conf.h>
 #include <dtrace/faults.h>
diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
index 75d02464..a2a3a93b 100644
--- a/include/dtrace/ioctl.h
+++ b/include/dtrace/ioctl.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2019, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
  */
 
 #ifndef _DTRACE_IOCTL_H_
@@ -10,7 +10,6 @@
 
 #include <linux/ioctl.h>
 #include <dtrace/arg.h>
-#include <dtrace/buffer.h>
 #include <dtrace/conf.h>
 #include <dtrace/dof.h>
 #include <dtrace/enabling.h>
@@ -22,10 +21,8 @@
 #define DTRACEIOC		0xd4
 #define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
 #define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
-#define DTRACEIOC_BUFSNAP	_IOR(DTRACEIOC, 4, dtrace_bufdesc_t)
 #define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
 #define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
-#define DTRACEIOC_AGGSNAP	_IOR(DTRACEIOC, 7, dtrace_bufdesc_t)
 #define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
 #define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
 #define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
-- 
2.18.4

