Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927D299944
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483895; cv=fail; b=BX1LtQpiGKQoK8dvYzmmCN3iZ9+yqiMJnxzTDkgMPB2xMDccxjj7kIBmqYDRo8FJAgCR8IqQwp4jTEVyE0CvXTwHqqdzTw5F4SA3YmQkF8Mu6jHQgXmR67blRF+Iv5Vy1hvTi4hblEW+TVMduhaI9hN6iYcv2Kg4yswjRSTDWPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483895; c=relaxed/simple;
	bh=gtfMRVxJwfTAOHyFqoqw/ncuHVi2GPGYs9Q7KP/qIYc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=oO5uZCCTDQ2SwLSdG6fqegvyO+Hi2bu3zxgAY7JcNs7TTxVdpSIozEUxkKwkNaGMJ2+PClQi8Z7XoA6tIWEsS6ZlXA3HgD9ySLSfv4DedOAt8uh85Za6yBWijDAD8D/M5DtFio5UYxITxCndmkKDBNvLnmNjOd2oFEZOMZr6Dq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YtW+h6on; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vMFY8hJm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YtW+h6on";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vMFY8hJm"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIDRxY5014644
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Apu1qJCJkcwkSl2yka+uCPhTIffgcBwNag817aJcg8o=; b=
	YtW+h6onYqs5co6Bj6AGYrahGd3K1SonnQBoXDN+0sIbBAuqpi6wkp1Nxedz7ANs
	msf7ShiJgZkgby+rw/UuSAXYP+FkzwjLltKMVT2jCEwW2KRJDK0gLnbipx+GsyGk
	OW3ag1PAb/yR0yYxiFgvPRoQ2jvk0UI65JD3+jYn+czWJ2DZ6ENu97sO2zd0PMlZ
	jzOtgec9mSgbGhhr6fgHfHdU2mCiWV45naI9PHGaARoLPRJAp1v9hF4MtdgGVHsb
	mFy6IhNxEmB1MykmPJkr/x6Atqxpg0hKgnMqJJh/XpeKAFLsN58uLZOHI7VGDGHM
	xSrdgT9aXzFhLpHlyYZt+w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbbdbcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIFXDSs039958
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:11 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefykpgqx-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM/JxqSEurk0qSnfXjSDgPMnhp4i/Mx9extyk80ey7pTj8DDxJDcv2aW3X71oQrye9iKmRzloM9NVP0/rMMltZmSiXk6mgu6ZrsY/yG22Su8bQ07jOsedtmKhrC4RSa9mElRdj9w4Cf9egjtBaFuQew7nxrCf8fFeKL25MwizwvrAXJU78HAUDeCWndgy8ZjjvE3ok46oBt0AHWNNOo+psQzAn6E3jwP1LFnpz5rrwYAqOqTuLT64ppj2xtcn8SaE+pUznSwMA6XEdwSKe6bb6Il2aFq/r9rKQWLzmT3XD0XjXJoji67+Bb3zf7NrDfbhik0bpr9tjNGMwcnBrK2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Apu1qJCJkcwkSl2yka+uCPhTIffgcBwNag817aJcg8o=;
 b=WwqvnlO9qY5sqnQZkaKHo4SKSAmXN7lOTbePpfaYO0/i+DUmFDlLjmnwYj3Vjgi7N3L+lmuXeXskyQ0OZIxMP6Thbl1EBGr2Yt39f0kVH+VdP2Y4SgxL2fCjLyWX5kpdzQU1AfZsLU2GpO5s7oMq7mpTIPkiCKaBTmx4Hjt8VFow8LeME6hz6H8lEecJo6y4YJCt5HOCj+Dbsi2MWZoz6O4EJ5dtGhuoGdD8lX7cNBBumEeDc+xMaRX9VXLvq49gfj51BS30R9gjQby2D4UqmJcu5h/W5eDj9izX1+gwYbdmnXchP65eSAKkncAxlwf+d8AMTfgiwJchjZ7WQLo2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Apu1qJCJkcwkSl2yka+uCPhTIffgcBwNag817aJcg8o=;
 b=vMFY8hJmCJSReC790epqs0TK8t49isjVyiZYfoabWmUp2EE1tg9OQ45bF/SoZB/SkxkIDpNcepV0OcceyOrWGItJwSr1Rzv3RxQ44mbvIA/btZ9uK9Dg0XgVUG9Sl3MygzrBryCknGAVTgieIvwfdLVXI94qshaXeqCnTeoxljU=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA1PR10MB997631.namprd10.prod.outlook.com (2603:10b6:806:4b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 16:38:08 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:38:08 +0000
Date: Tue, 18 Nov 2025 11:38:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/7] tcp: support non-libctf environments
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB39878BA514CC155F59584E20C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA1PR10MB997631:EE_
X-MS-Office365-Filtering-Correlation-Id: e042297d-b46c-452e-b288-08de26c0db0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9MIPigAZCpqljywb4r8wFOELtfJlqkLJy/DFoEbQdkw46VtrBP+wKddZTbX/?=
 =?us-ascii?Q?3T4ofNENkFZrxr8F8yAERe3p3jAvPKca5EGuQve02ByLZWQgzHLk36CoMwl/?=
 =?us-ascii?Q?Vbsp1EW8t2O51Lv+aiL0sq9CS5D/1ra1NPh5z5TGTMz+xP2AKENUqgLKR30L?=
 =?us-ascii?Q?psxCbyeJiZioQG0++K5eEN633pTJWBCYHMvd3N3MMhpH9iN9hHcuiDJOJVwg?=
 =?us-ascii?Q?IYLgKwgkNoXSJsF8cq5k7a+CD501aIY0TxfWoYlQwUO+haG14VW84PcvtnlW?=
 =?us-ascii?Q?UGFJtwAgr52GksP32pJU3C2fst1fD/62hOR205ry5zm1aZukjWYU4W0gc6uY?=
 =?us-ascii?Q?wrrCWsuguyIoV8OtmIO7aPoriP9KNW3o2X9qTlNpIooEwyA1gI3X4JOQ5BvW?=
 =?us-ascii?Q?ZBCOHqyem7fnjET+QPVCuaPOtgEYjJ9RksJrgz2AKJxQms0UaPnYj9NivjPo?=
 =?us-ascii?Q?ieiTSUOCr0dsBvM00dtx1d4F3ZtHBzWspriqDEbMeoA9Nf8P15mm77soelpH?=
 =?us-ascii?Q?oaZks31KTw7geey+qMBePj31iJa5y3sBoxsCHyaFWdyOa3441azVKBD334Vq?=
 =?us-ascii?Q?jutmp2LbK1E4P/ZATbflpXD5UD90RQ2s0e7LRxiIThI6gD77rZmuPNAfgnDY?=
 =?us-ascii?Q?38tp6LmI8IEb4tA/seL2q/ttehfLf5gyzAEw5F1eqGepk8SYCfZnDAAvVBIb?=
 =?us-ascii?Q?HKhi99DQ06Kan2kmE3/8iZgJZx34ZmFy9To248V1U4Rjd1G+4eK2RALHnFqT?=
 =?us-ascii?Q?2AT0xG8fC9SqWaKFhZJ3t8xr+0Hx3kZv4Vv4WRE0MtnVhn9CCt7KgweH77EJ?=
 =?us-ascii?Q?Y5xviCi4oY4UHv1y6UDaFoWCgbuNW0BHKKy+ZY6g4rQ9iZ4mLIix6eWBcXSk?=
 =?us-ascii?Q?etmjoLXmpo/UA1R7dqx9CjsslQJscJGLaywI2UlIseAHREvY1SqV9eUfR/Ou?=
 =?us-ascii?Q?2kYbyHHqLfZErtSte/iQM7SvUNqNfpiY5GQ7p1jnCbuJYav9ilC4RPNzSl14?=
 =?us-ascii?Q?qimbezfUlxpP+YQ2GFKQthJ5/gQiLEVhK0PVvhNrdrVABwaLT2uSx6CCy886?=
 =?us-ascii?Q?01pY3oJNDTQVojern4tTE0umaUpfmdtXA98LtYd/Ut+WSycM2Nxo5SOT1GAy?=
 =?us-ascii?Q?kmJgot0uojNZ/P0P3dOCeG2yAzXoDbcGvlh3l+S4WC/Dwxca7+KggmRZtgYb?=
 =?us-ascii?Q?rtNCgThjokGtlqII9X9LG4Wbw570n/l8zK0TMPp7quWAU30+ZXdWNAJTVj7v?=
 =?us-ascii?Q?12OHRubkGLR7Yn1mAJpKq5tQWRYVMCgn9rJCRG8daln+OwAAcxkMu+27x/v7?=
 =?us-ascii?Q?WPOQzDsjG9U5qhxCWF73du/y4/arA1TiiFMlZDO/I3yGfdSoL5ucJt9ZbGd7?=
 =?us-ascii?Q?Uz51tMoXvTfevUUY3WMHrJ4lPZ2kvOxuaHnYlePxSGM0tNghxfBlhxM/3r+W?=
 =?us-ascii?Q?8Xc/l8G1WN2KDQT/pv08DPGM8GImIU7p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QUBw692qJ+1peYSXuvHy6X8QSjG0ooC2XDyMfKZaaX9RensQuYwdmbQ3m4eN?=
 =?us-ascii?Q?rjDvyrL1fv5mO2iVA1LhKtEtnhZgReMzxXIRQOdy2OrjxhOFrZOzI1QV9d6J?=
 =?us-ascii?Q?UJgLFDQp7e5ltrBhRAyb8uTP5O5duQpQfRf3mWZdnvojdPbWkGc/6tcCYVAo?=
 =?us-ascii?Q?tyk5CGjn1QpLxcGxcazaVbp08H1YHXvJatzb8/bctsKrsvR1vYbao+wuUfxD?=
 =?us-ascii?Q?N5LqWkxhZvlfBpwsgOSpmiTtgIBQfhFhn1Ui22fExag8ikjyzOcGT4/O08jK?=
 =?us-ascii?Q?mUnd1xWtKnR678k0Fr0T8YOuc2MYYuRep6qP+zwPrKjuGCjkRj0dtpOP5Q/w?=
 =?us-ascii?Q?hPqRumpkOopO7Z4CDSOUsdAtUjDiFrmiBdtS9/UoTDKTEhyecdMlSdG6agK1?=
 =?us-ascii?Q?799L21Q/empEAeR/dhzTPZ+VTnNbVMZKAbekr7IltNw6CxKAlVUEnEVULTXV?=
 =?us-ascii?Q?mo2PRLAO1dummC8nZbwipkLtZ54qqMgGiO27pzo9a/6N9V6iU1dBBU3gz5zI?=
 =?us-ascii?Q?eRzw/h3RHJPJ0xqOYlfqMPBJXjzKdstEn5Mc+8qwjDRKY74wWUpOy1e/LLX5?=
 =?us-ascii?Q?WoD1bA/UgIi9QD/FGEuOI2AQi8MJf2HQ4XjG4tOag9Yc07hDLvk97nU850JC?=
 =?us-ascii?Q?Dg1DtaZzCEfnOVqfaKZDtDVJv36u8XQnTn9pikvP1pWqljikcK3TKlzle302?=
 =?us-ascii?Q?zsCm1WuF2yYSU2CKWRfzNY6R4GXJ4zyqdSovPpRubLBdpuLB+KKplOSlSXyZ?=
 =?us-ascii?Q?GVyjtse1IyGHaTZflsQnsnoMgbCXNBiDzlbj/Tj7cesTuJ+CwN9SAJyPD3A7?=
 =?us-ascii?Q?YVG5tUt74Eyc2T+q2PpNasaWwSf4KDO5fOhZM/3YRBAIQmaGv0cnNTp5qXPQ?=
 =?us-ascii?Q?8Nm8fLsaT+tG/6s9RdOqinLXp84XYYtP9DWMUj3De6HUME90rzxC8i5iO4ZN?=
 =?us-ascii?Q?6GeKwr/e9W/pg3hQbxwDitPr5ylFXxJfnXoEVd4AJETVDTxZNm/eIVP9oyFp?=
 =?us-ascii?Q?o7te0MSX0Ci1RirbHtBGXqN96IU1ewGspdiMX4+FqWzUm82/i8X+QZCEnceM?=
 =?us-ascii?Q?pO+9Y708SWXBEpvCw30j+UIto+ml/pIxoS/Ip7ysTZ/pOOC4GP0wUBHr+yhu?=
 =?us-ascii?Q?HaWmBdHctD6gAobFO47UIKwLUWkkS7LTeMh/5/6HX7fsiu670t1jARc6JzPg?=
 =?us-ascii?Q?xGhpIpaiUvvZR3y80yLfJEOysUIUy3eNl9y3WHtbhHMCyx7A2za1b3agl1Ss?=
 =?us-ascii?Q?B0xX8+9Zt7FwUfDJD5pivP8aciqEdYAP78qqkysjMtwqejLoDumA20ipBx2R?=
 =?us-ascii?Q?G8UkukG3mkW3qVBEckJ3JWxP31h5r3/q74PL+0KqC86rGmIHqGNhTCoJcFee?=
 =?us-ascii?Q?IB5obOvsGMTXlfLfk9ToiW1DUThLtGaiHi9726+1qH/kpWhr1Etsj2msb1MX?=
 =?us-ascii?Q?XwG1SNKmFOZYZCxmds1vmEFUaY2np91cdKBlOER6ipWW41WhWPlZuzstyOzl?=
 =?us-ascii?Q?PznINdgD0fwyT+gIcQrRk7Tzkw7dQrDGo70Bat/uvlHNW89W46RUAW37rc5z?=
 =?us-ascii?Q?z3n9tzbfxn9YUbRl/zTwu4qT8EkaF2mtbtUI1FDE6RApZU+Ui1Z+BXTn6FOS?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oBQX5fdiX550X2xmyvFW8iocNAqO+33ENT4r7kNqJ1mxV40/cxAkfoCYFQhrrbhOg0atelz/UA5E2RxjXYNi+QJUCd9ilk7jZ2nC5OWFkzGNfN45/2i/Y/Hw8LMWDuKqN2TTi7Kky+xjXDLe1SJvUS6nkyspMT0T1tonTmSLONC/skhCpoLE3tmeNWZg1KMpeeILBcS7Ti1Y5RQnd624MMrFNuZ3nJhqhyQkJ5sTNP+vssnr0f7th61DcTBZ70Wa3fVE+QbMu1/r9qwMsu0jsspn7M1wrXnJYAdJF7YNym0NiL2+cfGoEZHeg4u1TvqQLbKB/Y0ocgzbP0mYbwV2ouxPDPzI9lOfMMAeMwd17u4OkCs7NADEvei1O+PLu0i2yJ6bEjbSJTFiPZovG4sKSDaFH3vGYZhyvWh6G+GbFHBVgRP6aHPZY8wEES0dYc3Z8fs1IVg2pL95AD/i7A2DPvm8pW32jBOfEVqej+UGK7coklTubN19DquYHKo8YxErL1oD3zH74pSe6lEb5MsteVfB1vzSUqvkdDJ4z3W7CN79h0L9ErkeJ0S1tHlVREAV30BCDYmpATrnf5ObBzvPtEUOe7200rg8AmPIaNTm1YY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e042297d-b46c-452e-b288-08de26c0db0d
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:38:08.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSpflmsDnwlhu5nVqL1LsOTNLTa7wu6NxGvOKeaHFvpe4yIk/mDfIZHpnBjUv2UyJFX6shepprjMcbM7jGjI42IUpQjeHyGZfQ1RdVup9dk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180134
X-Authority-Analysis: v=2.4 cv=BoqQAIX5 c=1 sm=1 tr=0 ts=691ca0f3 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=RxwRcaTVtwej_NQ8ri4A:9 cc=ntf awl=host:12099
X-Proofpoint-ORIG-GUID: Ln3sTQc963ipuXrhYepHnQ22pVa9Lbjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+XWbmjMgR0FM
 O0Sui0Z36PQxbmJJrSpaQXGfgeCBC3L2b6uLBTfDUeIfu9RhOCpsq1Ep0lVXY1Xv9eIK/CxDidh
 0J/q84SjatWrWG/eGWHr2ptP9oB1owx4tYK76HROpnqBmT1zzgtK/KMLdhJkkjtcZbi8GdG0Kdy
 i+mCYuM1+T8K+y2Gzvn7q/b4b5ZLu97Wc1mGqiDZGs0ZcRf1zgex3lSDApoQFpiMIl51TlR7OLo
 VRIeKPncEmaGmhZNOCucFupXy5Vtl9dw18RXHec4TzIzMWb5d/hoBCRcJ2NCcPrCKYe4MJAyUxv
 QUVLh4AAhyXY23sRfyp7b/j8pEAJdMAa+CX7BWfD0Qo1RYZdIngLcY/yzL31rD516eiWO/xr0q1
 8L6zQDTVj6YyWhJScdcchQ8bK83DScWVR+IGQYRT/Re2I4vN0Uo=
X-Proofpoint-GUID: Ln3sTQc963ipuXrhYepHnQ22pVa9Lbjp

Commit 0fa93b3ac ("tcp: new provider") and commit c08a5fcf2
("tcp provider: support tcp:::accept-established in absence of skb") both
introduced code that uses ctf_func_type_info() without a pre-processor
conditional to also support the case when libctf is not present on the
system.

When libctf is not present, it is assumed that the system is quite old
and therefore is running an older kernel.  Use of libdtrace-ctf (which
has been deprecated in favour of libctf) on systems with recent kernels
is not supported and may lead to unexpected results.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_tcp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
index 44ed2bc9..319a84f9 100644
--- a/libdtrace/dt_prov_tcp.c
+++ b/libdtrace/dt_prov_tcp.c
@@ -262,6 +262,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 
 	if (strcmp(prp->desc->prb, "accept-established") == 0) {
 		direction = NET_PROBE_INBOUND;
+#ifdef HAVE_LIBCTF
 		have_iphdr = 1;
 		/* on older (5.4) kernels, tcp_init_transfer() only has 2
 		 * args, i.e. no struct skb * third argument.
@@ -279,6 +280,10 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 			have_skb = 0;
 			have_iphdr = 0;
 		}
+#else
+		have_skb = 0;
+		have_iphdr = 0;
+#endif
 		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
 		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
@@ -305,6 +310,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	} else {
 		direction = NET_PROBE_OUTBOUND;
 		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
+#ifdef HAVE_LIBCTF
 			/* Newer kernels pass the original socket as second
 			 * arg to ip_send_unicast_reply(); if that function
 			 * has an extra (> 9) argument we know we have to
@@ -329,6 +335,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 				skbarg = 1;
 				tcparg = 5;
 			}
+#else
+			skarg = 0;
+			skbarg = 1;
+			tcparg = 5;
+#endif
 			have_iphdr = 1;
 			tcparg = 6;
 			skarg_maybe_null = 1;
-- 
2.43.5

