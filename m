Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE132F9D98
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756369; cv=fail; b=iTT7gEJBjS6I8vvGkopg5yM5bClEs6qSdPAQXcmasc8jvIV4+A2wXg39NVPPlgA1gWYkO+ZTA0Mmx1+buq1dLXLv39YwkgIY7ddpdLOMT2PodjJZAA3jlR7Rr2Z/UBVF/WotxFVQjnbnJMbtoJhLUcHWkUNiHvJcyHVK5Qi9dR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756369; c=relaxed/simple;
	bh=uXPjxt+OiCz89DSybxN3LO8lnZ9KrH6btrH86j8spHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DrXbpmeJNmpshjntsfhwN+IODFm/x5cC9vprE0kTBayQG6lbqkvW7BMrE+dQz1Of1y3g0ALVLHm2z7TCsL6qivepAI4i7jU7RAzK+MKh1XbXBga0LifL2TRwWVt8qdlAEaugQJ8BMS4Sf4FF3Tndz1+Md9hRs8h3JDMnvfnPG6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AEbABmQO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r2USeHdE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AEbABmQO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r2USeHdE"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AH3Gkf3924293
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:46:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=tVpWZHmQuGRxk5mvEh
	9PZBeTPic9DiiNIfIwLiA1ry0=; b=AEbABmQOv2UaD4JTVLWv7WJEwjfepOuziC
	8uXjFoP4i4nzxtpyjcEtETLI6UzC61lR4WwRFqq5MH51onjxmvnwcA1vhkU53Cdm
	tuCzZD/zDK1I3R1XkyeuCXMI7nk9roDUmTj6T6v3mczewIyhMyIb/adX0jamxBhv
	RZzPnwtPPNh3Jt1YSGgvL8xYVsEebRFnsB9/O8BKkjvcFl2hQqafhQGyNL7kANUy
	kaPSAm56lo9WmVMf1js1Sq8btOWj06r4dO0J02u6sVHPhiRl3TUOs0BFivUbTqxB
	pD16BTGYTRvmKour2XCXWzKHxGbTR1bg/Gb9/+cUV2QQCQHuyvAQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c88qt0e9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:46:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61AK1vxA033527
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:56 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c825u3ab6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Feb 2026 20:45:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gK5WwvWUeEsl8FUVmce7pbcZACV1I/Yz4KSk5WKkiXVIoZPBVQnefIAbR7Rrce5lk4JJD98sz48hdiRAwyvnVf1uWRr49TY69liOUE9aarQWJIaJoDaOG7sm5CPVDunLn1QnZy8GWjldZhv1YsXRn8GXk9WhtmmvAD+Usw3GmB0jz65xY3Ky/P1fqC97E7Rh22jr9+bN1P+hfobaCmQVRcoMhGBfI8Pgfw11lx59OtttXPk3/u7xFkDluXu4m56vZQAjePOftY6XjrTamWnkD2od+SPPtFf75TK3hRRvl67aMPKF+NIufdmq77+gjVKgCbpkeg+Dbm0aLKELlGb7Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVpWZHmQuGRxk5mvEh9PZBeTPic9DiiNIfIwLiA1ry0=;
 b=B7NWAuTI82qbnMUCcnI4sGVKrL+pgpKZfucRpUWatdGHNtifVTWL+tH/hGrgQhUOKUv+XF7DfUG1nr2sO0XiDO0a/PE4hwjjxSU7V5BYRPkG2i74uZG1Cp3YTKglTolxr50Fczfs4BFylQ5tlws8BkNjeRqdX/z7ASJxJOjLbcjPnJbKdSnputXGQoZIAS+Xkn/2vPl0KQXkj5wHbrS+26i6FtfQkcJBQ5JFdG0h3nnxPFDADpRFOE/NxUuw/mv+AdacAz1g6JYeunvisN6ue8552BUAEcQf11183Go73Wq3DtYvO9SD9xu8cK61xIu7WAmUzVJAkqDKV6ym33ySkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVpWZHmQuGRxk5mvEh9PZBeTPic9DiiNIfIwLiA1ry0=;
 b=r2USeHdE3k7J1hixHlnx/6V9dyhhUgfP9rzdKBkIJjMkLh+4Xg1kbRjkqWM/hPIC9xk/4FBqFAAp8wQmM8Z7ZQ/6n3yNNyUkHW/EmswEoeAwEbxEUbF+GDbPDWOYaq5CQ8KoMLPTbZfyI0j4i2X0UwJTskOlzp/WlWTP8l9job0=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CH0PR10MB5097.namprd10.prod.outlook.com (2603:10b6:610:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 20:45:52 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:45:52 +0000
Date: Tue, 10 Feb 2026 15:45:50 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/3] NEWS/dtrace.spec: 2.0.5-2 release
Message-ID: <aYuY/hFooQ9dNfmc@oracle.com>
References: <20260210201637.8863-1-eugene.loh@oracle.com>
 <20260210201637.8863-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210201637.8863-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CH0PR10MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb223d4-4d3c-4e2b-ce3a-08de68e5617a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wR4NKmJPsMVEgUtLu6etMfeEEYNdBU3a/AmS9HWdnJAgf0UFMQZ/fo190/QO?=
 =?us-ascii?Q?Lk0UrTdGU7LIcvmS+lFjTQNb1zbhA2P1I31cCJTU7gpLRkIw7FJExAcFu51r?=
 =?us-ascii?Q?VbtWnLlR8Dty5ltIFEM+aXMOfXrUPvA4OXza8fH+Jiiiyn6othePCX8loulu?=
 =?us-ascii?Q?heCS3bG9w55Lr2ezG0rFCzEx8CvjzaJybL3OodLCtYyakJ2TZe5ZDPMMp9L1?=
 =?us-ascii?Q?CVMTgBQQyasgrOUUx3NpUKOXuv/GGBj3a9aiyKqE3vbEL7mX9i/5BdXceNcA?=
 =?us-ascii?Q?IsHP7xk/dOD9XOlmmomN8kt926M638tLSK+tCBWh4EUbeeeq803yuYnIq7hT?=
 =?us-ascii?Q?R/bw+70Y/OEVxpQSHBZM2op+Pg+YPD376FWCfLM1HvXJ0dV7+9IEhxJqTsKR?=
 =?us-ascii?Q?Zw/lZcgq/L+pq/l8r62386tq7tqePHVHc7HhKG36u79SMuVCnam83xL3I9Qc?=
 =?us-ascii?Q?DXPQ48sGqeCtFA2ADlKFfETLWZXbId44+NMmf6RKUy7azJQ8TdwBol+4j70o?=
 =?us-ascii?Q?r7S0qSw7R0nFH4U3U2Hbl3Ugt82tFIUMPQjdrqxGioJmgm2yc9OuW1jnkBwr?=
 =?us-ascii?Q?gl/80yWUWZmGDCg5pxAydeutBIz+saz4GtS2Usi/ICrchoTy87iPZGjJJDZs?=
 =?us-ascii?Q?Mnhcwkfi2sogCSWLjJcbNLV3uolRzgEofBF0s1Yr9OHteIlOEuVLLgV+nAYM?=
 =?us-ascii?Q?mwZlZr0oP/xXU18nCv+5lUdRv2e6B6BN14wY4RxhT6nqT4hkC7+C8mKsvGO+?=
 =?us-ascii?Q?V5ki6WOIEmsC1d4qXOq7OSiWHf/+AmVyyN+DYvGqiMtSFMq2OHjl/WfqXWTD?=
 =?us-ascii?Q?AR47SJvBGyvViGTrQjxQyzvkpM0MBGiZlVghcRfXvqtEJv3rGwOsNY9EJTEQ?=
 =?us-ascii?Q?5PJzQ4zw9BBeyGLiJl1O1uiOHansBOtCHUYJ06dCxF2Ql7aQPi157NA+6jLY?=
 =?us-ascii?Q?+4uIBTDhF2C0CGJPkKT48L3oqe55c3kgw4R+/Mxhz/2Lhh/NnRPR0ytoBDaV?=
 =?us-ascii?Q?22hZNUVjCZTD1Kw/baF+sg2zZWKhxdeQVwAaEBmxWEGIx8sQIMpA91YYIhUh?=
 =?us-ascii?Q?ulnQTzE97+ytQdqeUvrjC9DQgKgnAYD9eq1dgO6vBSiW5/UpzldcdHaRRU77?=
 =?us-ascii?Q?zTdVzkCbtDgtQ+HlLMmvVF68yexRBVrSoTSZyh1XnMqtIKpcQAkyHf8SyO+C?=
 =?us-ascii?Q?eDM0iCCmmT4QNAfVpDwepSwoDSPFz2zTSt6biQJ/jMMJeaL3tmsc9UrMenIZ?=
 =?us-ascii?Q?sY1AErxrPpFUfLXor0mzGPJ9izNnYkHGx80bef2L71tI/th5eJ1lmo57n9HZ?=
 =?us-ascii?Q?44CsCoWFl8tT4F0kc4PhfShGPAqc8uLKKVXPB+JDfrBBfoHCFh2bmBEc21O7?=
 =?us-ascii?Q?X3KhfA/MWtiyuWMkfRUqaTyYVhYgKUF+aj/9C81keAWNlJXZI1xD+4EWzXNK?=
 =?us-ascii?Q?1/Tl4IymktLVGbQW3BN7aY6oZl20/s90mwz422k8xwjfhN3FPeXirpRNdduF?=
 =?us-ascii?Q?Vfb06DhNHBaSAg44k7LifD6DVaq1h2BGjwX0yNsW9wBF3MnpKHbYJOLqQ4TV?=
 =?us-ascii?Q?MTW5C8NcwG3bV/G8PvQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HDpI9PP2QEbHMdBovGJZ06u3uZ233CHH7lVBSVtibh/LmuUWIg6A0fLhM2p9?=
 =?us-ascii?Q?hWZpM+Pb1Sxzrv3WTh8rmPm7n0xO0yLz9yfsBcYPU7bgaI74FTqLHuEwS9MH?=
 =?us-ascii?Q?62/HS8awdkk7MjGaaLU5zv1eb17RxXIcIlrVq5jjS0p07swWAPeIpEMfIwkA?=
 =?us-ascii?Q?xbtHo3MzJpO/leZ8x7geH1zUVCsEHjs/98dhdY8j6W7zy7D8uTHvCwu/fZYR?=
 =?us-ascii?Q?4p+pwYhvjEiTJR62LH5e8s/xlN5KjvOazDsweKzWoGbrTusNE/p/3vYSfkDs?=
 =?us-ascii?Q?ZYeTnH4XGLEbvaKwzcWqKgvuFV2chtcRWRpNSHOiVb4BcGmNQoIkluv8Bwq3?=
 =?us-ascii?Q?00HTZU3G1edfpiiX10VLPyuD1PWpOW49UPnKy4mU4IlxNFIhAND0brEpg8yF?=
 =?us-ascii?Q?sInJzymQz4lYm6VEVkq6fd/bdY20fXDIEE+7I9GYrU0VeKE8M8DlyTWd5RsA?=
 =?us-ascii?Q?4zurUwj9bAD4WJxfuVNBaYqbuYx1W9SGo+5h5NASIDWron5MWlvVLwrZMhTw?=
 =?us-ascii?Q?udXk9cl7g2Bi/36hDrZxvOe7E9Yzq2JlJRFlHIr/CBVKIFcyPGORDD9Y1GRi?=
 =?us-ascii?Q?01P0pQXQmVAguvVHFrg1Wyq8tkBUEseWjan9leNPEmyChoBYan4t4/yLvmg3?=
 =?us-ascii?Q?t9lcETBvRc1Kehoi6KUuo11Qjw8YsaKs4y7i4I8UUbTv82H4LaT8wjC2rDKK?=
 =?us-ascii?Q?LAujeeuI3eWV7fQPRMmVzetN9M+fT7qcmuuWMpu7nomSs9BYAIzckldld+Lc?=
 =?us-ascii?Q?WRNir+4fmITbcONslIxHiogZ4JkMPu4orQRam0TZ0lrRF4bZdR2tQ0KUOXul?=
 =?us-ascii?Q?C9Rj3m5FvHf03nDZfpaAPS4dykRTShh3wuTOhvqwzHpUdB9jkMF5DfdCZXcg?=
 =?us-ascii?Q?no5p8VJywiEybhYz1X2iu84A2QlamANsF3BmmSOGWljyQtW0a+UmMRkw0hzj?=
 =?us-ascii?Q?jTn3s4YwtrSbT4juZ07UaSz2TU0jDND8pikvYADXPHhbJFCcy7jQlBHyHcbD?=
 =?us-ascii?Q?RtlZKyO5N5gHvdxFuK08fuGB9L7RjdVJGH9eOMgTr8AfNtBjm8UWEbMHZteC?=
 =?us-ascii?Q?8S3eVrzxFSLgq7iSc4YEqWQ5VY5IMqERSXoJutESBgdZMXzQqupAK0vQxMzs?=
 =?us-ascii?Q?JaoOClA1ArjW+8FNjMofFGTkBPqXtV9K58KRlXcM0M4bEIWTU1KKrRJdz+Ii?=
 =?us-ascii?Q?YgUf7kaf0DoLNDT1lStaWTTZ/EtTqr/IvuYUi4Yfm8v17y+XarFjOc30vVPe?=
 =?us-ascii?Q?T9ZkcpECmHaF7Jng2ATvQKCv6Go5YYh2MgqfJ760D5fBvCEKtm9v0bj5JEPC?=
 =?us-ascii?Q?v47r4+ngeeqlq81fkzBAlioqlZ6JPNHR8ACT2STcBcfmfLNaoz8leoC/VjAK?=
 =?us-ascii?Q?7/lIZjOjWwYaYOu0GFFsSc24R2qYzFOHCXRzrUcXAnkvpANiarmZTpojzpfb?=
 =?us-ascii?Q?NiGvBc4gJrjwhBXOwlhANdpoqOINNBJlAIZkSzPHAV3eucbx215Mqk6PlVBA?=
 =?us-ascii?Q?ltvdyzjnDTDiIfF2zv8rPnHnaIVOjMnVfSVTxTqX/zGNlft5vmXvJqajPuU9?=
 =?us-ascii?Q?GH0ClmAo6wYea0ULEJuqDGmn0ceq6huU6ixfa11tnfpZztLittchdrSDtPNS?=
 =?us-ascii?Q?iP+OLtZCgVe92fEHd/EdDcbujtxCFmdIx26G2B4IkpXqWxfBsgcIVWhikRwY?=
 =?us-ascii?Q?85Tjs/hl4tOZlQ+DAc4mmKM+4R8jCDz5l9DodwyGhP2buMwzfKcawh9C1Sm/?=
 =?us-ascii?Q?DpvQto/VtA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eRBCtr/ZOpQLH2YyTyvzO82d6mhe6ZtmpOzASMUvMW33l1/d0fx+MTA6J70yFTOF9uSs5aTNA1WL9S1/5zv364/4tfk3+N262EYOcaMSdTDIWA2LaSxPvqoq3lYpeZIkdcJEAonR5ByopLsCY45eA5ewhbmevuedJXNmg3Ti5lpWBzEX0qhYNMg85PZq30koNLwxNl12DWrKDMJOtjniSReJumMuunnZOcx0Nwan5fj7rRqx1ro3syPsEGpbtWreGzmbMA9ltYPpIvHRKCvgkK+8d0jDNbMQYbDhCYslCJpUja5y3MbRk28uyc8XfElHhxdLbV/VQ7BZzzaS7nD0icS4KGMzOdrFRFHrHlIh+9js/nkTEfEy7CHM/jl+0kjLiB6OeuQ5EN+mcpMYLTlXiFpXxXF+fi1G4SKzOBTnRxVRfiHFj540lypy6z5Z3dI1UDm+tn5ftNAEP9rczdc864vrF3DhJ0VUnIrwo6tZIKcvm3qRjsrwvv3+NEHfxR3/WrmOl1othg9quVqHyPbj5pz4Zfb/vmOHjoTMrs39EJxHCKMzAIn9Fr/EUV6pdSShlm9eHUE8Xv1GwMTTMAHNH8rmSv2+B1IjN8L4huCyhNQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb223d4-4d3c-4e2b-ce3a-08de68e5617a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:45:52.7110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WkT90nxTar+t8mVRdf9pePHTd1K9R9dQI7EJu4eTueKYfhlFbZtEx7rXfznChwbLhEmsyiMst9B7VDXMQE8wpeVLhBxss/g4TacmkdKWlf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602100172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3MiBTYWx0ZWRfX7xewsUvhrYju
 cxKVlS3/zaBHLSfMzVw+jCIYi1GXcfpHKuMLAx8R6O56ruIWTmNZdgGCxROQBJ1NIDMu/xOQjFh
 3y7/3nUMDBWSIZ9sfcWSXdP+98LTVucOHrwYWzMA0Jq+gKAyggNz/mUpJ71QPjdLuR2wFlSmVEm
 1KAt5BjtsQXR3I/4RfAh5NbQqHK3Yr3OnIyRnL6mdg2+N04mVl5A3+LFAPfsxgXQFQjBpflwG4k
 8KMP1jDZlIIWyVdmhxWHd86DkjMsxZ+Im5+UD8xoveki1eTDcFfcipJeFXGIK47mAxIrmS/Auas
 JDRpCcTX4LnJRHvt5mhe5XaOOB0XAw7rl8/Th15VqotePAKuT78VDjkxdM4eiPUcYq+SEME2E7o
 5RiS3++Io/4sbOkS+6Y/LfGx3LaJ9NEaXtr8RcV/00YE0Bl9rvk6we64lntScqTEqryaB+fKLLs
 b+tnMg6dly7WlHOX+wcCkVR1OMcK1ordQ0mRf5n0=
X-Proofpoint-GUID: BUJjq99LIKW4V6XvKId8597mUlM4TiXH
X-Authority-Analysis: v=2.4 cv=Mehhep/f c=1 sm=1 tr=0 ts=698b990f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=Wc5RPNBxG3ELe9NNJloA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12148
X-Proofpoint-ORIG-GUID: BUJjq99LIKW4V6XvKId8597mUlM4TiXH

On Tue, Feb 10, 2026 at 03:16:37PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Update version to 2.0.5-2 in a few overlooked places.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  NEWS        | 2 +-
>  dtrace.spec | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/NEWS b/NEWS
> index 9c62e523b..c76ac114f 100644
> --- a/NEWS
> +++ b/NEWS
> @@ -1,4 +1,4 @@
> -2.0.5-1 (Feb 4th, 2026)
> +2.0.5-2 (Feb 4th, 2026)
>  ------------------------
>  
>  New features:
> diff --git a/dtrace.spec b/dtrace.spec
> index d6af5a80e..54d8f1239 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -230,7 +230,7 @@ systemctl start dtprobed || :
>  %{_libdir}/dtrace/testsuite
>  
>  %changelog
> -* Wed Feb  4 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
> +* Wed Feb  4 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-2
>  - Implement PID-specific uprobes.  (Kris Van Hees)
>  - Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
>  - Fix argument handling for multi-location user probes.
> -- 
> 2.47.3
> 
