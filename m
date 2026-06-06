Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5226B75B
	for <dtrace@lists.linux.dev>; Sat,  6 Jun 2026 01:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780709951; cv=fail; b=JBY7XfTZ34O8oe/9/ur8t7q10v7Wbhk5eXBUIs6FwoQ3gLp7U9gzxZ/uOrIuuDq90cmWjUz9A45V6gfQnBz5B5ldjVdcYC37KgjWoaqwJrv5juXCUE36BoBVoSyuKd26klBfFCCxizNGge4Z4JI8CYn7FxHNhPeoQg9nx7xf/+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780709951; c=relaxed/simple;
	bh=qpBAAlFfQzkv2GziaqBq0fRKcDGCVLYYArZ/PQjaSbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UTI+daAun3g0qWtUIaihLsf3bMJHq6fUcVpicd+nRBXjgWXe2u9Dd5QEDWcXJzeJPLUBFI0g76MDEQSkmyfwgh5eDMwtYKARC7kCCIqskd2VnVYejDsx0NRTKfTRl/iZGgzbF+KeXR5HaiDpi3aycceGTGWy9Rgyufhr5e0h7uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kefBtgJl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YMxNTDer; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kefBtgJl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YMxNTDer"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6560Mwk91767068
	for <dtrace@lists.linux.dev>; Sat, 6 Jun 2026 01:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+SMy8/lTJwC6EkjftB
	ZVv0zeMMtvP3gJm7bYcGF14II=; b=kefBtgJlQm9JzM2QRo2yZV+PHVqNT21/2Z
	ihLxqKo0/jVxiAzZGrozwGzHgD5CtsnEmRMWNJcsFYIsFX5Nyl8ek5EIUfh4GQSm
	7MNlobDZf4BDGCp7RX6Bwb88JWPrKYHPdkJlFtrXCMmyvoaIchfed24rY+Wqgs20
	m4IzT9saviuA91zCmoPT6BJTctj7RR5mk4kXwyQqNyDvyk/xzp9zeyke2rLNjjrk
	cSRDO9oGA/kr1TYvp0vxxV6i4BkymJZpE4djefbKD6XiUO9UVUZGlIrOkDMvItv5
	tprieIEb8ptB7LgtRoZOiE8mb5+VJgW9OnRZlbXEMfsxPRFDUVMA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efqxdk73u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 06 Jun 2026 01:39:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6561ZFrE019669
	for <dtrace@lists.linux.dev>; Sat, 6 Jun 2026 01:39:04 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0m01bp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 06 Jun 2026 01:39:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXQgevSQUZEaEStjrQQesCzQVPluNQ0PLLu5KIoafDdEa3eugMXvgISAgUh8T1tUXiWarMeGRa3hynQA39Qw5X0Bv2QozyX3MP+FRdo5mRJpRvsCCCWpn05sx8PEFLN76VXiaz9k+IYzDAubu48r8+u/ke+TVRgd+UkzxrlU8NIZ3+7yUrULEPG42Et/q/8w0Xs14qozB8EozW5yQyUI8DqZB6+nTb8EJH9ktQ2+AX668yRyYmLXpjkDhvFsGe6A/+XYwV2Y7kN4NbnDJ17yqqqqYWR6VzY0p9Q4+LLm/0O9bcftafuk6UA8rh/D71OSF3N5d4FkcWgoWCKP1z1bVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+SMy8/lTJwC6EkjftBZVv0zeMMtvP3gJm7bYcGF14II=;
 b=lrbEJtrkMs2UOtcV2ExzMa737ekLTCotdtD8uSj0Bn6ARkFwFAJQsSI3GyWku7AjLUz7ySoyRVZsgRRn4J1hIt08UU/b0tKgOebMMqgJRxGiFimsmV9gpsg8FNZzFttKTOUWg0TSn9pDtpvqVuJo7moMEXULcNGV3u7A3FGW0EsqFSv1Ygr2PvDInpG85FFcXtoc+cHZ50+zyJq7g8hkhL9oLvlLv7hF9B+vEkur9y1IfZSY9few/c6rOnxdOwr3vYnfj7jtAgwfV+cZ3KxuLFN5zS0WUAzFFoVzzJLPRDuExJ9A4e7TtNJt4tONJPkeU1ItECVtxG4NKvP+yg9a4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SMy8/lTJwC6EkjftBZVv0zeMMtvP3gJm7bYcGF14II=;
 b=YMxNTDerIBJOEIXuYvUWtL6kq2Pu2lxSN4l3ILgllSZV5eyTpSsWKe7v1pTsiqAzLSe1KrnK/1zNZYfyaXJj0rt9+iPhAFzWVF308b1yzzgs4KHIxBayl+Inq633INHGYhX0d+4VL4fl5HYv9zR8J821H8WNX/jCqUhFgyo/g8g=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by LV3PR10MB7842.namprd10.prod.outlook.com (2603:10b6:408:1b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Sat, 6 Jun 2026
 01:38:59 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 01:38:59 +0000
Date: Fri, 5 Jun 2026 21:38:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 3/6] dtrace: add 'probeoff' variable to
 record relative offset of probes
Message-ID: <aiN6MK8VV1Hh8ZRN@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-4-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605221217.1211791-4-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|LV3PR10MB7842:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dcc9ba6-1293-4a20-e30d-08dec36c6128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|6133799003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zIcNKVOHiXxYp4pGWzJT1KmaXamDYuCyTUI3VSODr24LNqYF1CRnAQd2P72LrArx/ZadRUJC6xlleNVWu6Jc5WGIv2ilqShik1Nyktq6Hh8Dmhb0Kc4m24XsO/joBPmyKsbg32vcIZphaYNHmAsfJ3wllcK4uTO8XlSlOtbGf53UEt2KYZzw2e65RkSB7Np4+/+LbrS5Nai4NmyeVO7qKOHmOfOwPXBkih1gGtq9uxEkEroCfdTG36Gqw22tPYnkj5TmD80U1KLTQAowonsnWDX8xHTM0oJrqK0IepBjceYkPmHv3i6jdkI6k17Nya4U2S/06z622c887vmjFAyKo36lB2M2cpQd60uYNBwmrVjyGEJ2lLZ8VaqPXp2H6xsmKiMCpw9eNX0CvjHQIPJd73XvAV1DwlXFFrRQDmYF6gE0vYnAaVgWqqO6ikMQgJNQdwavdm1gyqeX3MmGQehVLGyts/r1HCpnpKZJb8kAX0C2oX6vQI9z30oUuVPSDSMHV7nGiqZW/AzOkIKWI9ZBom0pjySx1EN3cKH0xRAs887hrs3xqrRNhtoZZTUVd4kyQqlKobZrHluXz4f5rFFTgyV3TuNu+xJm0c6ztAMIvrgKXH9CUskq5PDZK7Azm1IgO3YYYh+Xs5zISHwX6rkrPmSnF4rker26lhP/HB378lRaijYeS3MqNUe6NhKMhAK8hA8Z95+vvrExoodp3fCdaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hnsqY9u0wxAgbNVWAEkd07zgFUzpx0TXkvITYR12JsVzauAbSz52D15lbEmW?=
 =?us-ascii?Q?ILBOUNto94pGA2J1NL1Kobqg7+dPpJpZmHmIHCIgeHfrWK+jhJCwF71y28mg?=
 =?us-ascii?Q?LTPnAAObag4dU5IOGoHtumpfwmmb7lL5x6soAaHoWd6mzHFrHRlN/nzxwRu+?=
 =?us-ascii?Q?RVYYmiMFVUCOFIkWZwQNx/omqpVosDtn4bPmWfmAKLM5gFiz/mT20+a6+poH?=
 =?us-ascii?Q?M8uirsAvNqBRa7ET2lV5QGYjDsaxwGeD5BgnlbfcEVOT8P+knB0lwO7k/oqJ?=
 =?us-ascii?Q?62j4WarBCxXqhWO1KkXsvz/YNwDiNiOl/X9WoWVUJC1IApH4OubgSLSr9Jjp?=
 =?us-ascii?Q?Vsf+X6i6WSgJ7B1IyHavQdGtvkdd+BTzEQkmm21+FtTYvSEcAej3v/dBWUE/?=
 =?us-ascii?Q?iwE7WQpYot0avz96wYB1liwpR6LtUT+THHcyqg6h25OJYUBtESYKUXrFfx+w?=
 =?us-ascii?Q?Bva5aBJyyffotWc/aui1cpdcFYmHahNGbSW7A1sBiXtP3CIUyGSsaIDmd/Jl?=
 =?us-ascii?Q?TFWxJ5ZjGmAaPKanFVxpAqavOoTzN3hzDh0HeTokej/w/Y5zsor+5UcaC85i?=
 =?us-ascii?Q?tj0s1iusdOFYLyTNgWVn8Vic9RNV1usuIfxggEL507jF/NNyqplokf8SstgA?=
 =?us-ascii?Q?r23ODeFV8MlAjj0SJ6T43QZg5mSQivFNeUi75zhQwj6kpLKxitzGYHKbcZnM?=
 =?us-ascii?Q?MmbvI/MZJNfKNMJWaWytZjI3l6hMJi4JWu/l8wSGfjSIW8q2WGBtjhYz5r/t?=
 =?us-ascii?Q?9D15EslPin5GHEaSTd6Yc4KrUwVCgCe0dsPAoBOgP4E50DyCl9QOzxMz4yW1?=
 =?us-ascii?Q?jNexCZbtiAvisdzyH153cxvbzmf+ZM6RCssxMlmQTqvATintQyaZFMVQFg+r?=
 =?us-ascii?Q?J55jFSP/QOdfsogUToiVOg9pxeGslsNY5arLEXHd1w2X6meFaAVbGBdyW8Id?=
 =?us-ascii?Q?FsK6DLxWi+2qT7Ctkb087bKSu38sBDKimB3HIfgAEkbJCnteX3l/9fj2LJHb?=
 =?us-ascii?Q?Q6RlVzE9A/OMjdGa5IQ5stfws1unXUVFqA1XuAQb8Pygxwp0eo8ANmlUTmuS?=
 =?us-ascii?Q?nFXZddX94AQLyhN3f3Ri2P1K7/Xi/jxT+C+cDBdqvjN/1K07pPksmM83Fbyk?=
 =?us-ascii?Q?zTSLPA7504fJCIvwUZukFNMSPAWcGJy0GCe1r6tKygese4ZFUFH5p6rC6ZHm?=
 =?us-ascii?Q?XG+f9Zad2WdWnxt5+iYtUC3X6z/cuF7/9mn/oWpGS36Prmh/Ob9oyK2JYSL8?=
 =?us-ascii?Q?20meDGqrXw/OYQ8dc9FVmII8ATMxpaJ3D4oyNU1/307ChZgHVDFb+LOlkEC9?=
 =?us-ascii?Q?UPqQgbNam9At75c8QwSlwaMmcIY16FVOQBM/0+XOI/246Ds3crRk3IgTFXlk?=
 =?us-ascii?Q?CWNTSvYWCtY9GpE+NguU4iVEZGzPia17h6zg4Vx2sj8axyozx0JEMtaR9gJb?=
 =?us-ascii?Q?mWYQLOmAVfMuWVMNkdUU+nr6Gva2/P/R0QhBC+mDZOh8t9LnSjFvu8s7f6gr?=
 =?us-ascii?Q?hLd+KfY6NVNypdEfoWSKDZtI6MRqf6mYwB/vudFn9PYMM1bI5nLUpYS3w31R?=
 =?us-ascii?Q?JisXPfOkl4K8p/kU/Zu11lawX5F78Sr5qsNensKGzyIiVVtutXLgg4WTWcjB?=
 =?us-ascii?Q?wgM1PHyCBxnk05HTA46r7AhauGFYWE0xdtkTnmgEf987Tp8LbPCIqjDJ/UM2?=
 =?us-ascii?Q?Sh1z/IWr99o0WHd8WBRIuVaTISYSe1hDKg+45qgK99ltfwmG4xcCpzFwIr/u?=
 =?us-ascii?Q?/r6en7LKxg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	ThKPKvQDztE2gqO+KI8e/B1NmiUfOBbvYPxOah3JpOi9C4lJ+n4LdXvLbk88NSdabY+lN9IRfre6bGXda54jv6q8r5iVq985CUfyQcZAF0SRVaglkoFzG36GgWlGKfvIb6DHJCUwzdtepKNSPT6RdGHteOx95wY78cYUXjDE5R6LDORrGZM9Id0w81+WdnlxRHMhArLx7QmIwIZYdOGnXq6cAo83U8zcPocHh1YUOM+uggZQqJxxwHHBUSFSlyoPk66/Tda8ICWC4QaN+8VYG3Ltf+NegDDJSHL3XQuDjvYPNR9gW6pl9f7xUccZz6s5QA9gLIjZZuiqrzOM1jCLoQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B1aQS8bMiJ7z2O94U3n/2zBSFokrY+pD1Ew8QGRWBmtrjEdAM97yozlXg32sPRbUeKYnhhmBDSvtBLPwr6OHse8+YLdfXJBIsNeHcOPqaQ4OYnwYhmSYUw60W33bFKGrETSBOftiLOWep4RAjBvMUS0yHk/DyOY7ohO8D2lXcqhbds6aIrtNI4vAUmwHXDrUCH7jdQ2N/Yr0CDcY74QI73C7DffyntPA7HbWXdKKhkUZBLLguVh8vhbaEspB95VTzhe6puO061ks9geJgHw/bf/cO4/vIdD4XsY24z3cFBxPJzNdC8nMf03qP6RRMNW518/BovD1JwwRyI53beLlCrP3qVnDbzIgZmUBKc1RdTfmNULtFixwT4ZQ6HufZxIFr+GLK3fhgcX5kCa0UkMqHGAJ1Nj5U4A4dgJuo9GdX3NdPYNSuUYLFgWETFoO1984h5EeS20JGibeu2q5tsotVPOEKQlazRwVBTV/8YXPo1k4WFCpM7vc9Hdiqd5o/911tdQOXz6Trzm64m+p5201Td6Gsr35fbV71F5heZZcNZPxCYqa7zTt+HmttiizNGJ/EgVhlZac2/7X822KcW9YALMIe4wNUqdCSesZCTswf0c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dcc9ba6-1293-4a20-e30d-08dec36c6128
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 01:38:58.9295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yexy0oNDy38mlXD23ch7KSCF56qLI9eD9LK2430Io1g8HX44RmlH7lUeuLOdU1dpQGFfv3di9toQXb8EYrD1MH7DDpmRLdQSaJhOFAL50zc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7842
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606060013
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDAxMyBTYWx0ZWRfX7Ho9SvcNoBmJ
 4daxinbqNDUC+ud92WXGGu9pV380AsCZEXECIL7KjNvRW5RkVEkWtd2QYONqggPTI3ZDFEN3LXp
 56hd2ZSnkVLz+IIF4kC1S6HPuwqgclShIDRc7REKl0tpj9HUjjFFCwveL+lEQNLkJ24URuQm+H6
 E3ko3RHUdgZf2UdjBqRv3FssOjTP/QtpBaQAWC/TtEv31kR/CKHaTCH8EdQaaGHBvOTvkoKgbLX
 F3l0B+l5Szme+V+3Lkld/S++gqzhmnWFbQF32mJdlbngKEZuTuSVdSUZGyTAr0E2qoWF0laFKOL
 /vw5eh5q1Yks9SfJXDp+dElXrGCkrHrEgG3og3QAe0caxRi0u1uGnjj9lh6KTim/u71vUSAmVwa
 NzEMvUr4tv2xI0c+ZeFmew85jxMk3olKBgsIf0EHPWP19QgjPR740nkWUnySbYhssrUuCo2U0Bd
 a+guu+5wvBxIiZV6uXuOiLp/HYz50HzNZsmbftSI=
X-Proofpoint-GUID: lywFdiyuykCnQRrWv77_f0cBcgyncX_D
X-Proofpoint-ORIG-GUID: lywFdiyuykCnQRrWv77_f0cBcgyncX_D
X-Authority-Analysis: v=2.4 cv=Po+jqQM3 c=1 sm=1 tr=0 ts=6a237a39 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=yPCof4ZbAAAA:8
 a=4YXoO5yByS81s8JWjWcA:9 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12312

I think this is too specific to a particular problem.  We already know the
address of the probe location (the current PC value, unless it is a return
probe).  What you really seem to want is the base address of the object that
the probe fired in, and the proposed probeoff is merely a means to get to
that information.  It would seem more beneficial to add in functionality
that can give us that base address (base address of the mapping) directly,
and then it would possibly be useful to also have something that gives us
the address of the function the probe fired in.

Introducing built-in variables like modaddr, funcaddr, and perhaps even
probeaddr for consistency might be a way to go.  Or a (fake) array similar
to uregs[] and rags[] that can provide this information.

Anyway, I believe we need to think about it in this direction, because that
is more generic and certainly would support other uses quite nicely.

On Fri, Jun 05, 2026 at 11:12:14PM +0100, Alan Maguire via DTrace-devel wrote:
> Record probe offset in machine state and make it accesible
> via 'probeoff' variable.  Having this is valuable as it will
> allow dynamic computation of runtime variable offsets by giving
> us the base address of a library.  For example, we can determine
> the base address of the python libpython3 library via:
> 
> python$target:::function-entry
> {
> 	base_addr = uregs[R_PC] - probeoff;
> ...
> 
> This will handle ASLR and will work for specific targets and
> system-wide probes.
> 
> Since uregs[R_PC] will give us the runtime address of the python
> probe, subtracting probeoff will give us the relative address used
> at attach time.  For example if 0x7ff925cd7f0d is the uregs
> program counter value and 0xd7f0d is the probeoff value, we now
> know the library base address is 0x7ff925c00000.
> 
> Once we have this, dynamic resolution of variables becomes easy
> because we just need the symbol table offset for the variable
> and we can add the library base address computed as above.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  bpf/get_bvar.c               | 7 +++++++
>  include/dtrace/dif_defines.h | 1 +
>  libdtrace/dt_cg.c            | 5 +++++
>  libdtrace/dt_dctx.h          | 2 ++
>  libdtrace/dt_open.c          | 2 ++
>  libdtrace/dt_prov_uprobe.c   | 8 ++++++++
>  6 files changed, 25 insertions(+)
> 
> diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> index 99a6503d..2b53b7d1 100644
> --- a/bpf/get_bvar.c
> +++ b/bpf/get_bvar.c
> @@ -203,6 +203,13 @@ noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
>  	}
>  }
>  
> +noinline uint64_t dt_bvar_probeoff(const dt_dctx_t *dctx)
> +{
> +	dt_mstate_t	*mst = dctx->mst;
> +
> +	return mst->proff;
> +}
> +
>  noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
>  {
>  	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> index a18614d2..edb98f06 100644
> --- a/include/dtrace/dif_defines.h
> +++ b/include/dtrace/dif_defines.h
> @@ -163,6 +163,7 @@
>  #define DIF_VAR_ERRNO		0x0120
>  #define DIF_VAR_CURCPU		0x0121
>  #define DIF_VAR_EXECARGS	0x0122
> +#define DIF_VAR_PROBEOFF	0x0123
>  
>  #define DIF_SUBR_RAND			0
>  #define DIF_SUBR_MUTEX_OWNED		1
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index e97e9abc..1bd73e11 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -288,6 +288,11 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
>  	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
>  	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
>  
> +	/*
> +	 *	dctx.mst->proff = 0;
> +	 */
> +	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_PROFF, 0));
> +
>  	/*
>  	 *	mem = buf + roundup(dtp->dt_maxreclen, 8);
>  	 *				// add %r0, roundup(dtp->dt_maxreclen,
> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> index 5bf21345..797c8fd2 100644
> --- a/libdtrace/dt_dctx.h
> +++ b/libdtrace/dt_dctx.h
> @@ -30,6 +30,7 @@ typedef struct dt_mstate {
>  	uint32_t	tag;		/* Tag (for future use) */
>  	uint32_t	scratch_top;	/* Current top of scratch space */
>  	int32_t		syscall_errno;	/* syscall errno */
> +	uint64_t	proff;		/* Probe offset */
>  	uint64_t	specsize;	/* speculation size */
>  	uint64_t	scalarizer;	/* used to scalarize pointers */
>  	uint64_t	fault;		/* DTrace fault flags */
> @@ -44,6 +45,7 @@ typedef struct dt_mstate {
>  #define DMST_STID		offsetof(dt_mstate_t, stid)
>  #define DMST_TAG		offsetof(dt_mstate_t, tag)
>  #define DMST_SCRATCH_TOP	offsetof(dt_mstate_t, scratch_top)
> +#define DMST_PROFF		offsetof(dt_mstate_t, proff)
>  #define DMST_ERRNO		offsetof(dt_mstate_t, syscall_errno)
>  #define DMST_SPECSIZE		offsetof(dt_mstate_t, specsize)
>  #define DMST_SCALARIZER		offsetof(dt_mstate_t, scalarizer)
> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> index 30b8758d..ca00788a 100644
> --- a/libdtrace/dt_open.c
> +++ b/libdtrace/dt_open.c
> @@ -240,6 +240,8 @@ static const dt_ident_t _dtrace_globals[] = {
>  	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
>  { "probeprov", DT_IDENT_SCALAR, 0, DIF_VAR_PROBEPROV,
>  	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
> +{ "probeoff", DT_IDENT_SCALAR, 0, DIF_VAR_PROBEOFF,
> +	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "uint64_t" },
>  { "progenyof", DT_IDENT_FUNC, 0, DIF_SUBR_PROGENYOF,
>  	DT_ATTR_STABCMN, DT_VERS_1_0,
>  	&dt_idops_func, "int(pid_t)" },
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index b1b852ce..d53b1e43 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1392,6 +1392,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 */
>  	dt_cg_tramp_copy_regs(pcb);
>  
> +	/*
> +	 * Record the uprobe instrumentation offset in the probe context.
> +	 * This is the same object-relative offset passed to perf_event_open()
> +	 * as attr.probe_offset.
> +	 */
> +	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, upp->off);
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_PROFF, BPF_REG_0));
> +
>  	/*
>  	 * pid probes.
>  	 *
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
