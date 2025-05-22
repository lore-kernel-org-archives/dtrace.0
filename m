Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A63415F306
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936912; cv=fail; b=giO6cviitZ5rD32qaXVoIKeHKxHhaWOZlyvUW/X9T2N0w3YfP/dDXJAU8J/QiGmOiIsYoHa2odU4uQgqeERVa2AtIcc9nfyWXajQer9SAwW+Yrure3YuCj9/NxdhqR3FXNUlOoAKo63s4QN+xLePkoydS6pdgmYo55Q9IohnWVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936912; c=relaxed/simple;
	bh=9G1dXlhk8jN3MX+6NPzMWQxaP8Q4KzbyY5DsAOPVrBs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZyC8puqIvYI1+cd+CibL/MEtBv2P4ePQyhjLOCfwLNgSQcqQ/nc/hMkZkaTrBPbrqbp9YVEesblR9tdd9O3/2JF7Yp1Ivy6hdGxqiDzZRN1R0jpbMn8V44Dyro/BHhG9QJWz2eSYZPeg6sq8HsXxObRpOU4pzOGYbiq0tma8M7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i/fRspvn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jddYKH11; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i/fRspvn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jddYKH11"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0rTG014482
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OCkPG26tDha+fuiNzy
	stY61yguXbEvxW+fWt4/TDhzU=; b=i/fRspvnkGoiuxCvFD/lrkhBMlywtc8/at
	NvkyXR4dp6e8oFrQQKMmVSJRVXALAK8MK/VU+s/1WXIiSrgw8XTD0a3Ad6rInTXB
	fMZ4Pwki/ZeqrukRORD2+G/YWP5lnVdFZdJNNYmz0S79WF+imJm+wr8y76+JNQdT
	q5t+n91CtRv9o9xVSxwfKcZTpaw2AwKQNHZctlzsyqXd/a+5wE2FK8RPKLVwhUnO
	JSQeFRb+cD/ZE+ClfnngFkVquocGd/Gf/JQXDRJRaFEkmIrmDkS4LNU+0nPVU/yI
	VnDrer7zY9KTk3ypcns1HY8oZP6LEGhl7I7NmAjtPI8X+MYGiiXw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t78389y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHVcuw011282
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:48 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rweprwxy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKiIK5Q9EDJSWLZiLl1Pd7j6H+d7oTvX/2KWFwhL/xNhvqD4+Ml0bPTTqv1sq35y0nCHw/2FYQvMWVpB7Fa4xL3rf4Xe4Y4W8DEQFxsBY9sRgApjRz2AsjxBs0rvIZ9EsCI0jy1sNsMd6rj1p3GOC8RNzjsCNtgNs1F4SqLnjrNFxqgtKSen1M5TjKNLndMUkOixrsH2FNfYai+qPQ1Ac/k9TryT7PW/v2abk9uwADUsuqoLmWJ44ZbDNKggfAH01vCh3QYAaEUlggxrxmO7HF9h9+XhCldugUQgHdF4cLvK7Rw0uDr6Sle7pexbuGsJ4NOL7MVrzk1jnBrEGoRtoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCkPG26tDha+fuiNzystY61yguXbEvxW+fWt4/TDhzU=;
 b=BGnjE/CInzIQ9a1MuUhzJyC/6wD7EUU5ldQQM7fbg+Pjm67jJQ99zQVJyWfqw2p7ur6nuyW0cV2ar4i+JgXYuOGO4IboX0TWF/jD8zOZ7Rutl5na2AHGzXWY1Ss1cfqaQnbxRcVcb8u8l95G1OLjZhAe9q1hUxjXMC65LD/umTpE/MqtTD6h6qMQhNKKUfRzfToFSOo2428LiwiwG2YXX6tXIhOtOwieLf7qrNAvpCAV1vFemTMTR5mqqVhf0Oss59EL3KmHNV+c49Si6VWM8rqW4JYbaB+2sHhKRRpFIa/N0ewqbCorLCSiXIVbULF3s4cgUSd3XnemsgkUlTak2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCkPG26tDha+fuiNzystY61yguXbEvxW+fWt4/TDhzU=;
 b=jddYKH11YZXilAgZg/WNES1//EedWlKFoawZtAItp5UnC3itatYu0xo0DSyXrvwsfPqkRNv5tXJ6wGeLSu+Vh934CL86SYnzER4haPACJn0l8B6DwOIsIym97+1qu8QJvKIWVfxpJSh8MZ9XeZssSS1KuCENWSVXUakNkNwqoRQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:45 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/14] Test: caller and stackdepth tests for ip provider
Date: Thu, 22 May 2025 14:01:12 -0400
Message-Id: <20250522180118.27343-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:208:23d::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: de2e5549-4096-4d95-60d4-08dd995ab727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8svJlDx/gnp5poblbvCovqCFePkNHMxL+N793N3RdZ0iM44TXnDG14yWE5+F?=
 =?us-ascii?Q?Vula+rekKGuyDqlNbfiWWh+UtyG9x/Woo58Uuvj7BID5h2CuwfSUFhCQMLdM?=
 =?us-ascii?Q?tt1LMsMOnR9gzBi5573/+dWt/cjCiUF0zjpavz+9qRCcxigiQqErPEw8vFbO?=
 =?us-ascii?Q?tXFsePeAfr5pKNkymkM+qpy/+kuL9k8IIE9moqF0XT2ZHimWAkrBT3F9Ic3+?=
 =?us-ascii?Q?76kvC8sCeHHzeVHGEwrFNlJkfbiitOeVK2xtO/z9SxOzCgV6BQ+icwD27Dz0?=
 =?us-ascii?Q?0vfBs9Da5AXoTR1ChB3nmXeWFxCBnMsNbfs1QCDr9pPw51F5fHqGwgqpcnjl?=
 =?us-ascii?Q?8O3C78AoYb7NSnhwGJWOnEKXLSWDGy93UoEd7tyiJhQrhsCYhdOLtq0zF5xG?=
 =?us-ascii?Q?/D7uPsqMQzSIypKtMs01jl461B34A4bsxjDunnEgmXqceKG3KLXpSFzEg2H7?=
 =?us-ascii?Q?GBNnXTltRL/VXMhTsJ8C1qVyDlHwGax2nBGft/L3TAKnN6zy4wwaplstxJ96?=
 =?us-ascii?Q?Bl9ayUfbbEEEjLDK9d3HWAyT03ZxmQ4ENtx2VPJvrAUMNQWuRXDJ1Ejq/Q4s?=
 =?us-ascii?Q?m1CH+VF+M/AB6OwCNbNGimiE+bi28wX6c4Ec+97DVF3ZIX4W7CKhMc7c/1cC?=
 =?us-ascii?Q?GUWZotQfkNY4+LnFbBXEoHJ6O9ODKkaHpYD7mUOYTlkbXnhbixNL+qX1LTle?=
 =?us-ascii?Q?boCPpR1wpttLjS1tU0B9K8oQGEgrozaAwt0r7vh0fZfiGDG84vehqZaLJEUj?=
 =?us-ascii?Q?8s3q5+v/Ih0z0lWvBEHFSezyujHOu8oKNhRVpG6Pcl6cf1G6GdofrcXVax4Y?=
 =?us-ascii?Q?9igUz28h2lgAwQ9uLeEwAzhQ8QQa2jnhhrEuw96Bq+WHY7vnNVI3587oQuyD?=
 =?us-ascii?Q?yMgPGA+oi1oPA2oTP/RTj2wJliGdXjZ+DQypY35UiX0QB2eX0CJQeMFQYimq?=
 =?us-ascii?Q?z2DmtGPKiICPuCSptqS/FdZwF96Lu5oy//YpOEKaSR4Mp2l9XdxcMsqfXYy2?=
 =?us-ascii?Q?hxSwq4MPfxCQJN5E2UBsOSFJfleqTqacXZmPc0kYpzGFuRFPsd5O79/xIGON?=
 =?us-ascii?Q?WzJYHla0rfSJ/XFR2KAUTH7zMk+xsej8TuWH+AP+mgavNBPWZGQtr/cnMzcd?=
 =?us-ascii?Q?jeUuloNotw0anVwjdY1ks6rHTs2JZ7UfOMkrM4mqJbGmmhWh/QAVZ+iC6Xbt?=
 =?us-ascii?Q?0e1/lLfbjqDMfdrU/WSKe5oicgqMxeVBSqUNLEca9lFHFaq0jSt6IgRHgirs?=
 =?us-ascii?Q?LBrNeBLptzMO2lhsEi11k6CLhkLPIEYfCuBDxql9AAHBYvk02wwJrUSOhuXH?=
 =?us-ascii?Q?G0jW//Vp8iwqIMb1E+kkNVN1R52RgrgcDE4wJ+6TuktHDrOjnZ9p+5p3UNG9?=
 =?us-ascii?Q?peDxo2xgc1rzkRLN1AsbhkKGYyk4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RVYveqt61QcVmI6g7QP1E7sJxFFds7AhtKcw/orFSn90+PMVg292whFn7fFr?=
 =?us-ascii?Q?SAHnTv0YSDiddDqCsafCasUunrkk7vRbPPj1FQeq/Xhy7AUIIX3iccCCoL4i?=
 =?us-ascii?Q?fKLPrf+3x3j4++qv+AWJrisOIfsVACtO8nUWyVmE6SbXFFOcVhrDLiJN5FjQ?=
 =?us-ascii?Q?p1NpfZMwAHUJME1qLj1ydUdwXKA5DvSrbF2ld1Ra1Z9psxFYDf9DhSDxBbta?=
 =?us-ascii?Q?paU5eXYQw1YT4crwykf7GaN6RHdWFiwO6XUAPS4IxbAR7jkCDIU1nXbXZZNM?=
 =?us-ascii?Q?vaTol00+9Xk9A5J0zR4RzWbAfQdhHFaHCPhNqOxl9tmXB17ypekyU9hKFh/o?=
 =?us-ascii?Q?7y0shezc+GzMr/I9bYWn1bsHehVAE9bSb7TlnNIH6guW2qiifPECCzYx/DJw?=
 =?us-ascii?Q?/w+wsyaNhn2RrNip2ixZh8Atzvgc32x/WSRbEFb2L+Eo9AQ+ztbadwBqQHYc?=
 =?us-ascii?Q?xSBOgaL9OTRpbKjPG7PK7fjr5W7KyMDV311TMW3by+rcO0K/MC1hbMqTd68U?=
 =?us-ascii?Q?mc5OYwFaOt2BDg+Q2PQyEZkV9hj/Obu/e3YiMAvbrL98XBGKNOyrc5NfegEd?=
 =?us-ascii?Q?43tcl18FrUxb23yrQJwKYWWCaBos+1OcAjOvpDjQIZWN78LV9gRLCxDQ0qRW?=
 =?us-ascii?Q?K0beZvZBVzufdNSjtSEv6Y+5OCLxjLsJQVHC6RLcE5bBgCPjJ0ZYQsBJzX0Q?=
 =?us-ascii?Q?R/fGPeiKMUDnh7yq0JzokDhrFK7+Gk8P3/gk+2lww+R8lHvE+R/PHPCqc6OM?=
 =?us-ascii?Q?8j5iPAVhTbkEFDsKMxF/OfXk80i4XSvI3V2h1Hw2BuIk5irmdNkUAPn7NxSj?=
 =?us-ascii?Q?4w+xGW989SqNm9bc4m0dWvBt1jgYLOHQ+7jZY1MJJ3RP9pAcYXlu9y2nqaIe?=
 =?us-ascii?Q?ezFhE1f2yx4v6REymZQDGXK1UluBoNPz+NcjZh1nOXyEPDG7F9FlMAscNJbZ?=
 =?us-ascii?Q?4JHVCC9HLSiCzqC4F7DITd+heyWyfKsII/kSyDpYsfOtByQJqGRYjh+vkZwu?=
 =?us-ascii?Q?O0M7ZXNR9u06OzMu4xFvMNTchx6zc1+3w2RkGkJ2sPu21bN37l/8jH/MFhn6?=
 =?us-ascii?Q?HEPoVW3OwBJeu+W76wrrJmP2HlBY0Lq1qPuKOR1AIBIULlNenCaXJmkBZdJq?=
 =?us-ascii?Q?LvChdCOPV3qqEPRtiIZmCbae2ys1A8AhG72Y0au6332mtGfOR6W+IWKHrPWC?=
 =?us-ascii?Q?HBB2rPpftcCRLugSifZiCT8rh1SGRPLEGNNPvF78yLFK8fY7jxD4Qyu2uurS?=
 =?us-ascii?Q?eQRmrZyU2tSRatuQQAyyubRtqtTjRMN8n+QCjfhQwir3skI9zxMw22MeeZL9?=
 =?us-ascii?Q?GXnvMCYSrBix8DFSEuM9G4AFGZ22uX7rO020pFODRQs03iIXcNkaoYGNTN8t?=
 =?us-ascii?Q?CafCaBehs+e6VB5Pg5xPh6rkj07UWDMMoLf0SRFwdzNAIe8t7Luo6UlpKBS1?=
 =?us-ascii?Q?XtKXwkXLDcSMNEjUbC4eJuPy6GYfpsOsSrY6uVbO1yjWHB0lm0q7fMl88O19?=
 =?us-ascii?Q?QwGI7uNTR9LKVKIqqMwUfIM+LlAAI4/1PUJ99svZXYZ5EM9TcOYYu2adSQLE?=
 =?us-ascii?Q?PE1jQFGSRWdt3cACEgcefsL8gBZrhOkFinYGNE80?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AkMq1FiDHAIynzDqk0di6tW1amn+htbybOlFLnjr/QAf2rRMma+7WKXx2jYJCyfTp8aNTidkqEY70tjsVnZSgZKaG4akD0WXeDy9OFP4E93zwxj2iyqGeXJIYi3Ak2UZInxBiQw+hGUmAW92VLwSyLTpG7JRqFPBQZXAUXZDzpaBmcPYY+2O80Rq80r1wnsEiW0Luu63tuOk6TQ/PBqOmzGWGiRCphcLqlxjdcUozVTglv5igTBq7TYQw9kxEsKqhCfcbaxjrrO9GS75En3qhF14rmh3Jp815em2XiJoX+ljVMCUcY5wyQUOHoeEtOT5omQ5SHbo93DpZEdqoY7vffVv9LWZCFIE3d3Sdbp9KnAN5vhhrDqSAKHld0NmhK8eMKmA4W413rDHfgvtBkBNe1xO8OnzyLR9RRNA+MbvHpHNIDBRQNWFqvp+Rrg1WPAhWDeF067Dyq0It5eKYTMmAr/YfWUi1sCChWTjONEiKikyfvQv6JQn2Zwf4QiYiu0I9vzMD2S7oZ4pwSZaIbWMN6n8vhFoKRmt3Mv6gH9l2QqfqAeEWQsJdCFEvQAjFdGMeEEvwyMOlkdvjA86er5kWF4F2E+exQ+aDUEWcT60JFI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2e5549-4096-4d95-60d4-08dd995ab727
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:45.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnKv14XoajNXSxVKhgc08TWvPghbfZL41whkAj3mT6pvLBvGZUR7cFHGrw7eGAY44PlumcscOJuvY6jHUEGjZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MSBTYWx0ZWRfX8KT4wlCc69P6 DaH1cBX64rtwPM7v3jn7sv5q683xLXMdyGabnpEBr3kWatK+lVvCOERXzyjSJWZAnulHWdO/wa7 M4rnUP678xiSAB2jEpJCE1NgNztIn/vmJo1juW7FOiGzN8zOZmwR9jykvamqLZKsBPssR0IzxZy
 wkMNlYwahefMrUBcDKThbddPQTswGaNJCmZQpsHWo7wonoUmw4rKJutHpVxBHRVQ5O+HBpe26Gn NV3Is1EONmx9lC6p8vam7WTsKxm1R22yu/v5lLFzk2QiUkiSnAO0WjxLPUZhhHXz+Ukl3YRhPPq T3eEofhTmcpAP6n+onXFrjRHCZtf5Gy/8mP+VDsDrOTUWpAIdJrdnGl0DiWbALcUdF+Wq2TFUYS
 Cdlxrnwyn3VDctqA4Fbo/aMhxdToUUkFPHch3dlDovCQo9manPc34e8B5irlJ/PG4H2DDNse
X-Proofpoint-ORIG-GUID: jeOzgDqkkqTbuqcuM8DmbaCvSLFpaPQa
X-Proofpoint-GUID: jeOzgDqkkqTbuqcuM8DmbaCvSLFpaPQa
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f668e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bDhwisDuBmVT15BRJb8A:9 cc=ntf awl=host:14714

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/variables/bvar/perlping.pl      |  8 +++++++
 test/unittest/variables/bvar/tst.caller-ip.d  | 21 ++++++++++++++++
 test/unittest/variables/bvar/tst.caller-ip.r  |  1 +
 .../unittest/variables/bvar/tst.caller-ip.r.p |  1 +
 test/unittest/variables/bvar/tst.caller-ip.t  |  6 +++++
 .../variables/bvar/tst.stackdepth-ip.d        | 24 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-ip.r        |  1 +
 .../variables/bvar/tst.stackdepth-ip.r.p      |  1 +
 .../variables/bvar/tst.stackdepth-ip.t        |  6 +++++
 9 files changed, 69 insertions(+)
 create mode 100755 test/unittest/variables/bvar/perlping.pl
 create mode 100644 test/unittest/variables/bvar/tst.caller-ip.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-ip.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-ip.r.p
 create mode 100755 test/unittest/variables/bvar/tst.caller-ip.t
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-ip.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-ip.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-ip.r.p
 create mode 100755 test/unittest/variables/bvar/tst.stackdepth-ip.t

diff --git a/test/unittest/variables/bvar/perlping.pl b/test/unittest/variables/bvar/perlping.pl
new file mode 100755
index 000000000..97c9b09e9
--- /dev/null
+++ b/test/unittest/variables/bvar/perlping.pl
@@ -0,0 +1,8 @@
+#!/usr/bin/perl -w
+# Oracle Linux DTrace.
+# Copyright (c) 2016, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+use Net::Ping;
+my $p = Net::Ping->new(${ARGV[0]}, 5, 56);
+$p->ping(${ARGV[1]});
diff --git a/test/unittest/variables/bvar/tst.caller-ip.d b/test/unittest/variables/bvar/tst.caller-ip.d
new file mode 100644
index 000000000..83dbcec5e
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.d
@@ -0,0 +1,21 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+ip:::
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-ip.r b/test/unittest/variables/bvar/tst.caller-ip.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-ip.r.p b/test/unittest/variables/bvar/tst.caller-ip.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-ip.t b/test/unittest/variables/bvar/tst.caller-ip.t
new file mode 100755
index 000000000..836d283da
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-ip.t
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+testdir="$(dirname $_test)"
+local=127.0.0.1
+
+$testdir/perlping.pl icmp $local
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.d b/test/unittest/variables/bvar/tst.stackdepth-ip.d
new file mode 100644
index 000000000..eef942b5b
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.d
@@ -0,0 +1,24 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option quiet
+
+ip:::
+/stackdepth > 0/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.r b/test/unittest/variables/bvar/tst.stackdepth-ip.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.r.p b/test/unittest/variables/bvar/tst.stackdepth-ip.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-ip.t b/test/unittest/variables/bvar/tst.stackdepth-ip.t
new file mode 100755
index 000000000..836d283da
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-ip.t
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+testdir="$(dirname $_test)"
+local=127.0.0.1
+
+$testdir/perlping.pl icmp $local
-- 
2.43.5

