Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9A1FDA8E
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913597; cv=fail; b=diVo9XlgWMPvAGrb/oQqvmebT+6c47LL8aJt+A6Qo/WKMnWtIKuXiTZjc/p25RDLOycRH6LvM4/hRiJ7oACLFHOPGXQ1EsCVRIIuELYLXwV0SEH0EYTnMiFuEt1uftXK51gT+Khn2RYdl8E0TLZpb+t8+Y8m365xhwmnRN8jgZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913597; c=relaxed/simple;
	bh=PvK6IC8mspgXFNG66Rnbdqw2iCsgfkrGfQB/gisF7lY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dhAWXvhyqjw42th8HAvqDMk5Yyo6d6c4TKBv5nr/Lhu/LcDw/7DzcEZNDy+cWzh/n3RA6rGefLr5oenin5zshK3cER94LQ+K1ut13zuyM5tn2luWC4gpMK57WnBgfQjVePuPxXS06eurIS0axRRfoE76PRylsBj+aIyMMsgriu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZuLQYttf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iAcakv0T; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZuLQYttf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iAcakv0T"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QINJrv030854
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QZDHDEHxOnIE1GOks3
	Qy45RZnRggd6K6wwlaczlD9wM=; b=ZuLQYttf9U06JPtXZJ7qhSUwa+FVnJ88Ls
	MJGkzeFr6EF31TM4MrlitjrEIIC/pUyBiYYsP+6rMuhsNhN4pgbfNTN6LnHartGs
	RjxgxNskn9mS8Jok+PsBeR2p64qQ+FitohzeHHzL2RcGRMw3iwZSXvFEvM+4pVyr
	tO02iCtIy2+DJN7p55u/8cddeJj67lsiA36iZbleSbV7/b0yVJsC51u+VgtGiitf
	55ut06KmM+D/A1IA17CNr31rk0D1X4p8sBLaKPABID3qO7AhUEKfULxJ0p/iSDYX
	xLF/pZu+7X24geGz0DdVqxXhh1gn3yLxcHY8gp1tBdnANDTGt9xw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dyv182v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIYDfO023318
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:34 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd8m7f94-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usFYX32tWXCc3Bk0EuBao+vpFyaMKEvI/27TLULu9KB3GJnXqcuwQo/Efo21nunKYJjEe/+atYuVOL8F6EsKVu/CGdCv3q9IRYhLPKBChYaoNE1SR+hVj/qvlEFM9Q/doekCebprDKQZUFGOPU+UTb/1QhX+Pi1dDYDEZ0JdUZC6jb+9sIyAY+U1RlbAB/V/khPpo5tWYFTJol/usBwVvpf72+hiGvg4QBLiWFb+p3TeLcm6ES4k/9YhMxBS3rmN13v/A19RpyfGqz7Pzh4kCa8XX+NFOsgnRi0YlbtspUdEbnkyCIYWCCpLVaWzEpoYiB2MHdoRDxnRnXMK6z5xsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZDHDEHxOnIE1GOks3Qy45RZnRggd6K6wwlaczlD9wM=;
 b=HbTVOiz+LMd82n3e4MAA3kAmyz1ZbQ0qlV6MDTqCtd1WawMvpJ4A0/XUChLEGtbFj3FQ3Bt+7l8m5S/WsJKftubYGQACEIcJo/3Yxp0As24rBdxTKWIcKnOCG01W3uA5vMEHjzsoY3qVMuh/V+Up8I5alAAd0BGiAzba+wAHkRU4Y9MisOEl7FPx97JTDnUU0gaSWJxl7Si46Ak0HXQvrsAbDll6lVIyURAMB63ZEMHWdE3w8HfdAmwIX9LwhSeTlrVHRHDYj7E9bNcx0z8DJbPCAnVqbL8lIsa3gAvrj43Jgbmt4xrfwiFgr4MckLw2P3usH+8bznw9g/vYD895cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZDHDEHxOnIE1GOks3Qy45RZnRggd6K6wwlaczlD9wM=;
 b=iAcakv0TWe/lNXtP+XxNFH8GdMhbWnN1qSlek/M+0U8GBrsYvg1RyklrEQEzo9/vFL9hsJoGM58W6rNcP7l0LEqDvEJbOCzTdLEZUbbLySZvlATPeORPKD91wnYI+3VG5/ZK5JwJ6eez0GddnN1QPN15V3NtKFYuFAaqPN7ohGE=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:27 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 19/20] doc: Add UDP provider documentation
Date: Fri, 26 Sep 2025 15:05:56 -0400
Message-Id: <20250926190557.8485-19-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: de7ab9f2-11df-427e-cc61-08ddfd2fcb62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CFgiymtcLsrtdG7xO8ppFZUvsKDfjKcnJofvhhPaMj0bz6vxIMlCOnKZZ6cN?=
 =?us-ascii?Q?40AXZf3FMITFV38m4VW6YhRihDN3DGEkNCPFwL7qDMagCpCjv+mQ5SHKlXM2?=
 =?us-ascii?Q?PEtixPb6UkfMH1FMFM0F8hOaA8t43dht4/NDZ20yXqrKHwdqNSDE5hXNhYbE?=
 =?us-ascii?Q?0RM+fXqzLyVmjke3Q1GR3mDbryQZamqR7UyC6GOxqvOAIIz161kEAeygmmBy?=
 =?us-ascii?Q?oSddPtJrtr/Loc+f6C9NoLwIp0qWHLsS631OBmNpY2Qk9zkJHhejsu1uEnDP?=
 =?us-ascii?Q?FsYSBtUezD+MwgBZoNvTr+9Ky4w5g8cnPiXT3L/euvj/oxpIqEeswz4KDcJw?=
 =?us-ascii?Q?/xVXvhKgFY2dBFMJuU99IgWXdDPSgflUIyV7odM6TMV524mmpJORoJC97ENd?=
 =?us-ascii?Q?uTaeFiUScga7+ClDtzXyEbAzttxIeMvgK96Ii8ci2PDZJlark97yR4ZOc6bC?=
 =?us-ascii?Q?UT5RxbGNS6OPAeLWP6S5avwuvTrC4Rkm0pZahr9vIWJhZumiqcX0Qoi/Qtl6?=
 =?us-ascii?Q?1o5udkgBGEQdym1aPdxjx/rcQgzQg83dOGiaWt0ulxIos/a0qUPqskUCnrlb?=
 =?us-ascii?Q?X2KsaFyzSBHvMTbQNRtEAu8VoebzRx3+GAXctIrblUZ/M4ISuPeZVk2Ahz4+?=
 =?us-ascii?Q?HZgb7TvhZROAawvNgTvOXfodBrWmRkHONIgmCG3kSl/ri1az2lCwjzGutSok?=
 =?us-ascii?Q?B4MSkKK4baKT5hpOoSSZ5OCCdZsrhvYuUEwATRSF822C27X38ZX5Bpf+GDif?=
 =?us-ascii?Q?Sz3goy4rIq3FE+y+Cux80b9oAYNZuddI3ArNm7j2G389ieBwDmbKmwTg82Dx?=
 =?us-ascii?Q?/WiqQAryZ/hezwb2cjkCp+nLaUYvbA66f8xYmNfTmyTfzmEsiPka7887G0v1?=
 =?us-ascii?Q?nW2Je53LfdAkCigM0Sx6tD1UFdcFC/L39LrigVhs8KxLpdR8bPhnEPdnniqy?=
 =?us-ascii?Q?6dR/zq7z341gUoROQWAJOj8WvRPRt6A1h3Nc+AIZM+exBqg2DsE+cokwhA2Y?=
 =?us-ascii?Q?C2cdvWC8KLVv4W5I2fZr2b3RIIhwFhEuz5ogIuhJOKpUxgm5ByPgDW3K6ZHj?=
 =?us-ascii?Q?t8xJjdMZuhjlybHlOaY3b2NNIaDg2ER5uxdXWBw4UP1wqXWxSsinfpWFGlNw?=
 =?us-ascii?Q?pzHrvhq6FBJjmMa/cbeOlCEyFNiPHOHVLFSctBBkwd06H0JMc76yUeBykSSW?=
 =?us-ascii?Q?JkhGfMKZyufYbm2ibi9IVyWEF+hrDxMe5UMGqgEBfgLiu1aeyHPuztXGJtrU?=
 =?us-ascii?Q?4upMjdSt2tTpTMULzLf4XUsRJS4UAYpoY6DztfO5NMNP5tzCMnY/ZgfeyoPX?=
 =?us-ascii?Q?p3b3ZDZzKG5vjSKf8NMyyKENiHUWNeESCdRkC/WPubjpi8e/QGJytSKC0BM8?=
 =?us-ascii?Q?4fwwe8Wip/0Z8gOTfRGphsU1HayLlrxAPQOtQkJJkAvbh8M+uhv8vT8jCFFl?=
 =?us-ascii?Q?JwZw42si6do8CzKbCFmwyVzHoC4jlh/S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xDG8W4Sg9PPX9M+Vsllocrr+O91y7FC8h3SaQNVmIjembmiulufBj6d1aNzh?=
 =?us-ascii?Q?h5mbpf+MA9iilynrNBHEGhbBq/WffubNtIS6nNUaR6cn6u8/I0kUFcMT+L3a?=
 =?us-ascii?Q?u1Z5kb8cl5uoCVbPrOaN8rKvSIAhfFNcXR4flHzE5DsvTSeTmEnEMZpUONn1?=
 =?us-ascii?Q?otIkIiJqyyBZtADdyvhsWzMgnr+f+Lah+HxjZLDWRHf/ER4rVvYfxBGLN2wP?=
 =?us-ascii?Q?yXJ0FSu1WkWX3YPLyCzR4DM9TDcq/dI/p9sKUj4th/ocoBEHrliYZmdSSnLc?=
 =?us-ascii?Q?PJApspkk1w1yvbbytHrS5kONhWKwSZoIX2KRH6TmR5ABcp+q5LMU/LDi5yRb?=
 =?us-ascii?Q?WaYi1XZWTUsRLQ3fYzjUXPcvMjVY913HyI8yZzv3ui2w5XBR9LwTqo4lGIlV?=
 =?us-ascii?Q?/skcDB4eOz+Tnd+4aIlGFup/fcuwKbk/q8Q9PYAipEO5Rgc3xTJ6F/KkEAVP?=
 =?us-ascii?Q?seZOyo0WrPt0Tv/RUgXSsuoPB9ViYM4cbvfkT/M2fAI6SvHYSXh+AxSeVadb?=
 =?us-ascii?Q?DE1+reWAZ34RISwI+1pLs+bIVDZb3Gx+6jk43GOH1DYR5u4ewzUiH57Xrw+h?=
 =?us-ascii?Q?7eP6WeLJ0gA1ROMSV4qn8zMvrQU5Z1tLWO8+9zRrOe1lsPgEWwvyPWnzcbLv?=
 =?us-ascii?Q?kELVTrKIAvfDuQEkifvCV/y3fRnuxHwmA+yZad5u4aPookaNFft06RZWi5ZY?=
 =?us-ascii?Q?VkRO83iQR6dWktY2AGriSk5ZPynQFf5fpuAeCJlI2ylkSCOXwxEOHWxLdgXX?=
 =?us-ascii?Q?M+dcn2Ql1YRxfs+izdZfHwpTAq4GfylqSEDLKZB4zqqQ4eRGe80AkeE3iW0M?=
 =?us-ascii?Q?FXEnyYFhQ/fBE48er3gqGRcgaF+EL6l9F9nkXBIKyrlwXAfKKpn2wzvDN7Vv?=
 =?us-ascii?Q?nQnDXI5q48TsBfJlEGprYtrvVWNXZjITMRZBUbwqmW0nqzb0YeoTB5RyM/lA?=
 =?us-ascii?Q?17XzmmOOg3ph3zUw1RvaO6rIxmm6bMfoOG3cnOdbGFJ1DH6MF+6E3ej3qUwp?=
 =?us-ascii?Q?LRmRoFjSgd+QsgA+F6MpI8BGY/rv2lv0K0LLPal6Og4MLNvbCm6HOoIBIA/6?=
 =?us-ascii?Q?Cx7nwH44tqg6tzRENp7SGumxikd/Np89geovusN7Fbq7SZsut1Tw/cxhvvfb?=
 =?us-ascii?Q?xX+DRu608TP7f7y40Q8bQql+rRSjRKjF0g43E6xmdHsahKwcOBgzE+4hfnRd?=
 =?us-ascii?Q?AYFIJF/kRlNrNSjT7dM4Kh3krb4v3ylwPid+Tg26vqS3f5T/AKAYqrSwGx5n?=
 =?us-ascii?Q?jkyydmvUVgOvQERIk27/hGxuG98ijdaHmIrV6beKiIvbL5tKAomjepLDHFSl?=
 =?us-ascii?Q?EN4DDj6rpEUkD24XIf92TJs7/+VfhuqhZT+w7wPUAjXDjxyJNeZhVEqvg4uW?=
 =?us-ascii?Q?APzec7aUPhOWl11TYHAu9BQQUAIilpG+uqgEqZ5azCXQxQR/RY7xnvV1Ff0s?=
 =?us-ascii?Q?2NTRquE0k31BK31lMUkL/cxAuWfmoz6TLgqHjZUavv+hYcCBYMNzpXppdWH2?=
 =?us-ascii?Q?gemcXW0/nL4gSIfnG6YSLKIRi6G8uNel3Z7KhJ9e4b1kWxZ7UC8kXjTNhh4J?=
 =?us-ascii?Q?23dcCCxAZtLz4YW17AqqaxgPAV4bxFDYMlQtHQia?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YTGuME2icrYZgnj4NW87WOIIG31U/guYtF5IAXQw60t8CTOfFo2N+W8ZST5lTikrhhbbTi3fW42SpDEbdJ++3SVpUVs/EqsExt3RNRfOk4UcPdNVXtRIVP1bvXJS1B7Y+H9aYvgFH5s26mDceFSnK0PM4ho/H4U5v9nRQeD2Oyb5oZEXfHPf7YFxNAs8AS850UHdo4RqRr+Htao8mle7WK/GlHCyyC9btTVB9WJjw2Ei/fOnyq0q3G+iAQBM5KRKWOsTd3gunVXTo7BKb0n6JCjqD0LRqkL1EcOTDZl+CqOdtxiUC48l3NIAn3FYZMP93UWL87x3LL1PrVUYGma6iP/iN9b6HbmHVjdQfajvgIGhOJFje/3l1HIrGYHGCJUqy8+E0HxtEX8lwwQ5tDTIG0ECYKbRlMurFdHNba+74ftSOTS0SeB+wOFVnzIeI0aDQUrEcDvLlHI4mJqZ/m1cZw6rJFXQzv0bNRF0qybjrSSf0CHUKh3MngMUozT40l2883weAt/NzwV7aZIMoV1FBdTRUlZmNFcXjkQ77DMeocoHQpDAbNOAAgMrgI3xQQcnkytJYvZ/uCJ5PqVP0l5Rtr4diRy2sd35COhCisHGIQ0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7ab9f2-11df-427e-cc61-08ddfd2fcb62
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:27.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b1SYKAarFjn3Ti5QoHWq1s3GVXtmfJnz70kSruGw4CZZefK/LqY/S3ga0j8avBPmW2X0GfQNKGv9AxA3LTHNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-ORIG-GUID: wvv-p0QrGt2DzQ6hTbcHgQ9spBtt6aX1
X-Authority-Analysis: v=2.4 cv=PdDyRyhd c=1 sm=1 tr=0 ts=68d6e43b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=oNbTXTrsnSljPtbh4DIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE2NCBTYWx0ZWRfXxs1ZtSkq+hyh
 +oZLoU16GF+klekgjQN4cN900wXP+O/oFudCBjjgNFYkn8iI+0yypWDdGzue1zOKxfN1QvMTIzT
 xvHdGsGQXA+yA8qwgyPyxTV5IwDTUun+qknoPaMcGWmxAJykmV+PzsWW1HwVfsAhMzUt8+ekY5A
 5D3YfCvchvHPGUTmV3qb2rOIBh+lGFsACG/OIAN0c4QZXWc+1lX1fogSy9EnWPMyDYf89tuP6DR
 IIIssEt3kv1FaZQXskqqWe8q8sf3yv2piHSUaFDS6Cc9LVfboeSicdyDGiZHTGHhX9HX/OoAVKa
 eBhbqfJOiL6CoW47GkCxmF5qKfEXAikvRuXancltqFLe59+fHYbHQxhyxTmFcMH5WyVsXlYGQ1/
 DkF6O2EChMXEjYU8ZZ5+/PJL/FIh2A==
X-Proofpoint-GUID: wvv-p0QrGt2DzQ6hTbcHgQ9spBtt6aX1

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  6 ++
 doc/userguide/reference/dtrace_providers.md   |  2 +
 .../reference/dtrace_providers_udp.md         | 77 +++++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_udp.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index d47df094b..4eb682a8a 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -266,6 +266,12 @@
             -   [tcpsinfo\_t](reference/dtrace_providers_tcp.md#tcpsinfo_t)
             -   [tcplsinfo\_t](reference/dtrace_providers_tcp.md#tcplsinfo_t)
         -   [tcp Stability](reference/dtrace_providers_tcp.md#tcp-stability)
+    -   [UDP Provider](reference/dtrace_providers_udp.md)
+        -   [udp Probes](reference/dtrace_providers_udp.md#udp-probes)
+        -   [udp Probe Arguments](reference/dtrace_providers_udp.md#udp-probe-arguments)
+            -   [udpsinfo\_t](reference/dtrace_providers_udp.md#udpsinfo_t)
+            -   [udpinfo\_t](reference/dtrace_providers_udp.md#udpinfo_t)
+        -   [udp Stability](reference/dtrace_providers_udp.md#udp-stability)
     -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)
         -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#defining-usdt-providers-and-probes)
         -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#adding-usdt-probes-to-application-code)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 029f62c54..450adf9bb 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -31,5 +31,7 @@ The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at site
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
 -   **[TCP Provider](../reference/dtrace_providers_tcp.md)**  
 The `tcp` provider makes available probe at different phases of TCP processing.
+-   **[UDP Provider](../reference/dtrace_providers_udp.md)**  
+The `udp` provider makes available a probe at UDP send and receive operations in the system.
 -   **[USDT Provider](../reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)**
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
diff --git a/doc/userguide/reference/dtrace_providers_udp.md b/doc/userguide/reference/dtrace_providers_udp.md
new file mode 100644
index 000000000..b3e0c3d2a
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_udp.md
@@ -0,0 +1,77 @@
+
+# UDP Provider
+
+The `udp` provider makes available a probe at UDP send operations in the system and a probe at receive.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## udp Probes
+
+`udp` provides a probe for UDP sends and one for UDP receives.
+The module name is always `vmlinux` and the function name is empty.
+
+## udp Probe Arguments
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
+### udpsinfo\_t
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
+### udpinfo\_t
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
+## udp Stability
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

