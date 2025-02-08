Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A43243363
	for <dtrace@lists.linux.dev>; Sat,  8 Feb 2025 23:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739056888; cv=fail; b=Hk1HwkZnUNysR3vCqZkHyvH0CvHeJMwo0dmuE7H56za2a7pK5CsdGiMmErJJUoHvF9++VN1NGv+avqnYPQgN1YZETBLOh+zJu5yFFEFTDVShuTycMH2XJgjKkhG98DvRMvwrBCAK+/OCtHKk1DrdkK9d75TEJhr7nPVIvFFIh7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739056888; c=relaxed/simple;
	bh=i8E9rIFv6vdRHPVwQQHmenM1ViES+UssRU3zuIBCN6g=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DQy+rmpv9b4Pto6oJL6OlBki8kU2CrqkW6cBw78Rp2chLlUohACufUseI46ayRD4QXlrcSXb/4ZLAYPXbMJC03j7skmftdGxb7bfV9sTf6ssbFIyfAfh1A5HlHoFlM3ASLY1x6Cm3Ri8lKTbUdMl5G0mrGh26zfdeZkMBIEh9Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K5AGTMK5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kXsi2KKG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K5AGTMK5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kXsi2KKG"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518NAFJG017654
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 23:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=XYDXlD2weeV4G8/IvglN/e/9k3iUVe9KlNZNTAkUGAY=; b=
	K5AGTMK5OYZqYOHu9ryl6stXXQvuaOD0b2uvRddcPYNwYJguo8FhW4Uj9sa+NwTR
	kg3/PKwROR+eDT3UzD7hWsRfx6KoCdvcgWjCwonpZwVrqHK/8Db1fGkv6ksjN/n/
	ZxcaxpGUN52foYhL+Luf5wLbrgHIsc18Wam/v6TdHj/RMabH4ySPNUK/7CtFON2d
	FJgeRKmNRuinLrR8j954d8m7kbUn9JCBJa6LkG0sv2ZmCWRyUKIDBEvdcVTeIrcK
	02reMf/Urp1mqj3S8GNBBIWJx9kfCgWaGnLU9vBk8igupO5EF8bXSxh4/FdmHtYq
	oXV/rUpw9i8O3PpVxNuG+A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tg0jht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 23:21:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518KFn7Q002709
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 23:21:25 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq633de-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 23:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFiM+W2fhbhR5uYsVjVEAn7gXbEIw3VL17e97Xd35cZ1JhO/ZFYdZT+RtkopPkENXnnrv/7VWqMWMJeX1T7CMhJK8UWnS8nRwuaQPeTuZLsLRlGQ5M0JZNzM/cIQ4uoFJyZsImTQ3GN2hif7DeiXCKilLEemQYDXIZ4vHEd4ffxxKOFi385zgadU8Zd48PPa5EWDBHAUSccotEB2nCRSCM2R2ytkwaywkH2+mwvsjTwlJPGd5bztaeh7JmvobC2ycHYKq3QHA06UdN2esS+Td2FZk1lxEF1xYm1/RMwDHq5gmgh/qGi8yc3QudlHjHbujFgnQwl4J81hZ3GHasXQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYDXlD2weeV4G8/IvglN/e/9k3iUVe9KlNZNTAkUGAY=;
 b=SRzWw9Ytbcwt4gTNKCbBGFbPHspOzbOWrKXIomlUOROo0zLihT7uSK5slFAqqhVnp+saF2fKQTgYVgRxEPKlpmCyOTdip+iyXquqyS0qrnfVdxzF/oz8S8wJ3c3UEH5pfsFoh339FIqQAT+Rd5FCn35268YGWZPqqA6dhyvP80bt5rjcfyfA7eEeQOJ9KWIi+8KeYWAlTvGLpBXdCXQo+za/RKELKXX0mslqqDU6/2AcVnCY/LiUiF1mfHZ0Pa5V+rAOE02Qbej1yR77oqoamtx3DAJ0K/WPV9l3vjosGAVfLco0UQ2Rha/aORo9QjfuKesxbeNkSQOhg+1bXVn5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYDXlD2weeV4G8/IvglN/e/9k3iUVe9KlNZNTAkUGAY=;
 b=kXsi2KKGVeNWhwa1WUNGKatiNxApSuuL7MnlHxxbkyHbCb1ZGll7MSwOM1X5SEfF9yVrrG/MYEGRMe5y7iNvh6tvp5fqMEueI9PmOIErS/p8ZiNf1wo1/rZNQubSeZREjXO9SEA32hrPv2sFIzotqBbrpMHGHfpntNrNDpCCEsw=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA1PR10MB5972.namprd10.prod.outlook.com (2603:10b6:208:3ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 23:21:22 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 23:21:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] test: Allow more variations in expected fbt kernel stacks
Date: Sat,  8 Feb 2025 18:21:05 -0500
Message-Id: <20250208232106.27146-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:208:329::14) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA1PR10MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: d192ec8a-676f-4681-ccbd-08dd48974ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9TpmkAq9SzKIdxHsMjGShr21eO6DtlBADUs3K+h4+r77xKfb4UIqcoPtDqKM?=
 =?us-ascii?Q?2OMH9JWF2+loqgT1QCx06qpGojgPHMHUIdYuyYuQxYcQiBUuO3KaeqYIM6Q2?=
 =?us-ascii?Q?7/0C2yphItsXD07al/u/K9d9rIyE3T8/pjCCmFRDniW7acHfn4k34rjgeLRl?=
 =?us-ascii?Q?Ol8/u9X007cOa/Yc+u967NyYeh6/PHSAIvSxjJKDwEcHCVHpHYhKzTofvCoi?=
 =?us-ascii?Q?n4TDuWAhtVVBi30zA/IymgeIdBl6xWUZpuGSAuusQOr0P8hTMbL/HIAwjOT9?=
 =?us-ascii?Q?OMWSeR+mcbasEfLudSbNAZgQKBnbXRR7CZnth9tA21II1zg05N5mrpdX3Bju?=
 =?us-ascii?Q?TBFpMB+uDTu1g73gKM65ynODwdEzzmSEmM6thOmVao2K31Scs5rgvOASww7m?=
 =?us-ascii?Q?lenhlQfWhIz+104zyPd7EoinXBbp0TVO/+QZxNySdubGQj1IMiAq3Rra0+pl?=
 =?us-ascii?Q?ZYNJiARTtX1TMTrRE0UcfHeuF6l47lv8LwIQb2VDQ8ymM5pwyA9zrlFY/IgD?=
 =?us-ascii?Q?DjNepOUbWeuIoH0UGdVSsLqKVVP0w6aET9gcXAbch/dauE2Etsy01Pitm7Mb?=
 =?us-ascii?Q?i6Kpyj/zpUFt3Lq9nDIOFH3XMc8HRVx5tAF1typxwuAcw3Ah5z17dIHJjIdX?=
 =?us-ascii?Q?iitIsH/bBLQU/eJAw+vwYxox0yzoo51Mlqt+uTwzoWo+rr1LztV5RxFF7bxs?=
 =?us-ascii?Q?uvIWVb9VZHhAaUG9/l9cbae60OxKxalGqQt0XgjSnZdIwR3OrGcFjmURXhXn?=
 =?us-ascii?Q?7Py2JwRvOg7nO8byE5Ouz2tBtUynIDBjc2juUHEVVAyLmDNMLHNqjaV8qp+c?=
 =?us-ascii?Q?kPN+qqYVf8bubED3HgZ7Bpa6aF4f5fuvNJnzD8EPbE/fZfiEMqlEMO5186Yr?=
 =?us-ascii?Q?f81Bn4XxdQFtmsvm1+CJJ2kAQ8cY5PEiLpIYvT554ihctPQ41LJMnkMNn2bs?=
 =?us-ascii?Q?h0SYVf6q6FRj+j4d5ZA0F0t3P6hqQIA/UtEVEMXLQfBvS35LZTPyXWcwhiek?=
 =?us-ascii?Q?A8hV0e+L7yHvYKjEFRV+2qmhTZlb5PJbwO6/R6FCHW1v8ZHe43seT9vFWuYU?=
 =?us-ascii?Q?RYC1lQyCY2F9Cd4ssj5LaiPfp+fnVZaSlvkaTQaAz6wouvBGaZOtuXcvPQXe?=
 =?us-ascii?Q?zYzi5dS4AMKVNgRlxLmWnFGmgWsqcyr4CxYDF1O+VQKjDbxBjZqukKSlnpMH?=
 =?us-ascii?Q?HLLWmjDQj+nteQhVLoLGbpqg/DOfh4pb8VzFI7FCmmvDIrL6Gpcs+nZyUacS?=
 =?us-ascii?Q?nBVqWUfY0q1wgr1BOjWMQqBvRcoJ+VEpk0m8/ICKCdJ2SV24Tu+GTQSDuBWW?=
 =?us-ascii?Q?szhR+tfZhaLn0O76R0fUWILjZUBLYDy05QWQbCBZfBOmjNzcxGHeEmNr1r1D?=
 =?us-ascii?Q?RW4AyNmnqUURQ0389oBQl2nXlmjN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?//ivB1jmUq8JzueYXHuOlDy0OkKiujkBMjG3KMAfznhMMENrK+nsR9ctQMGz?=
 =?us-ascii?Q?0RMscpoOuckDCHB+KfVA5UBKw1YMjkstI33AczxLwgSE4CPZTGu/1M8WVoKf?=
 =?us-ascii?Q?PClx2VzVQ7cTVzgEydA69QWOV6Q2/T0YRBnGeCIjytgg3bxG9Ew+Av36IsfF?=
 =?us-ascii?Q?sBeQ2EDDpsyFrl2zR5QPpF0prMGqTZKAzlOVN0t3hkvx4xrlWAeCyufaq/Tb?=
 =?us-ascii?Q?j7pyWOWcpsnGpp15YX7AQEcQFuT35RCmZsLJqOiXO/slFCNjK7TJvhcunWxH?=
 =?us-ascii?Q?B/YL75n0fh0XkoE7tNVSyujjO+lg2MSD/Hq/z3Adpt0ixDQUh7reSDGZM8Zn?=
 =?us-ascii?Q?yGonb4FQasHYaZwPc2cNdaxfxtgGkdXQGLk8rTYra3SuwsRgN4bZYhvIGtRG?=
 =?us-ascii?Q?xJjy9reDmoITVqlU/RESlh0/uqYHTzV8ivmcy5yfht2cfCpLoJ3SevHo2hL4?=
 =?us-ascii?Q?k9DUyvhEHh82LkG88j9wSi5T+t2GAOYqoHvqEoO+bMVtCxwM53KckYdPXSN/?=
 =?us-ascii?Q?Aa1nKrlb0RklqYTSMeZ0OXbADiqEObQbvf4NLGPRZ1JEHsoh/HxbS4B2uV/h?=
 =?us-ascii?Q?Trot5PlXO6OISSkAKJT2VmQsl2dG8CTM4F2MSffBhm+vT1FGOJcZ0FeepqW+?=
 =?us-ascii?Q?qlDuhbQ4MA0/U+h7e89fAXbSiJ6dL7MC21UDzOIBHw7PQHFKqX9tuRp9lhIY?=
 =?us-ascii?Q?TJEtGo9zTGUb2/gnNvIv6LUs45iIQD1/Z1pnLQqt4NeoDNISQsn+7uGDwdf6?=
 =?us-ascii?Q?6xHllYTXtXw/GTpWYmdRXgK/KcxErTeHBfIcT115+C4GG6Xf2qBMhzOtOCAc?=
 =?us-ascii?Q?zfw3v6fVP55auS9B5NyzXjenTU2Buh3GK8fYwCbmVWGxcTfLDgUh7EaPS8aT?=
 =?us-ascii?Q?TAJubJnpkhvm/0bUPVA9r15kEWsFNq5mmhvcBWULxWXH+0pklgQ7nn00dgwt?=
 =?us-ascii?Q?3JQFjzsYIg+DVOKiPR3taA/RGAEIIAMVplU8+04GfknPWDiwu82HEK/L7Qem?=
 =?us-ascii?Q?BAByaWwNATfaPa7B4i0VU9pkmZgrNiTaxkPfkPSKIpp7uQLWC3Db2agZpXOQ?=
 =?us-ascii?Q?ZxwR9dQCBv16NgtNfKqwvfintB2iFMio1BJMMlKTcD5z2rsJexVTIo5z7ie7?=
 =?us-ascii?Q?8uyJFwzrzZciUITmaAV2H+o8ZGVFXOJed9S4nv5SApbru8ixKDWNB9qbhnAy?=
 =?us-ascii?Q?6KVg9VPWUXSu2t7/0PHnU/rTkgezZAesc2Sp/1tVFom3jBY4pNzMjR6NgQHX?=
 =?us-ascii?Q?ggk4ktffvTk8G1h61PheG/BaJmjm8YETVBhIoccjHhHs6qScEkA5IRJJ6klv?=
 =?us-ascii?Q?wZBS1JaycvkFtakMF2dPN69PfEcq6u8FLxd5P9iIIXe+AgNw4gHQxIBAN+a3?=
 =?us-ascii?Q?R/mUrgjBDgRj1UB+16sWLrFN7TeTGUO27BkRa7tcWeAttw4GL2KxSri7aMnX?=
 =?us-ascii?Q?4fAdRmMwCLf879JYJ7AJ7tJbRHVJEjPJbPTwi51QydBGXehffcWFSlk+JueN?=
 =?us-ascii?Q?D+/pLRT5204Iv0/Srdh3AlAFXV3nVoHk+xVG3TOx3WVAIt232D6u7aBRdh+z?=
 =?us-ascii?Q?u4+a02ILmm8EMKTZwcXY0a3VK348L7ouAzAbGK5K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5V6y90FsnHoxjeT52zU1Oa7BOtdTSPHX4rjiuy7SM2QtwpaqjrZyEV6SHVPJcps2QVgZs8OK8Jf/UZbJlZRvE9jqTcxJndAbZcRkB8rK0zHUW519ZkX0Tu7pLpxPPtURe+1nJvZNz2+lxkESV6OkzUQWYL5SUjrsPS3m+NXL1K+dV2OVfnfrpynINbJqKhY+8mtUIXYGJWa9gOiGM5ryW7N3zoOnWpIQ3b9bbB2SIzYL0j4Mb3pRMpxei09uB+HQybl7uLYeu6sYqgXqAUxQRB42+XCzCzW8gRRM4Yrtvt7EocFJYU3YoWWIvTEdUFMN5SglvHx23R1xC/+2BSHk0N/JwV7E1vRHRrI+hNUzLQ+R+onz/lfyyLDdu3uJ2YCOVc7K7OWWvNGshZj8KKBz2giSPWh6QaPCHWDEjz4TigYGvc0Yqr/SJYkd+5lL8abpHo/uUQKCj9Z2ZU+EQcQCOw6heQ8ZmlIi+ZlDeOtLIPs5DyMY99vC/u+DKQX4M0Y2NfUopsGOUG7JIZmB4w4FDDajQ8935klTtnowi05gpH/aICwsm8I6gEv2hMbyzcDrHDa8lCPXvrWSiONxXmt28PI93dKk0O5vF6ci06LDaR4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d192ec8a-676f-4681-ccbd-08dd48974ca1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 23:21:22.2001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OuUyq1hT4Mxef4CC+As8ZNzP8uh410i56phHNeVVW2EvLfEEXtrMYFJfK4ZLLJC6GntyAAIP2UMOEAlkNt6L1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5972
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_10,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080200
X-Proofpoint-GUID: MWipzFm1xjGJ8u-BlrNQjPbFUIZ8aBtB
X-Proofpoint-ORIG-GUID: MWipzFm1xjGJ8u-BlrNQjPbFUIZ8aBtB

From: Eugene Loh <eugene.loh@oracle.com>

This test checks the call stack upon entry to vfs_write().
Unfortunately, these checks require some maintenance since the call
stack can vary -- slightly or greatly -- depending on processor or
kernel.  There is a competition between ease of test maintenance and
strictness of correctness checks.

Adapt post processing of output to allow new variations in stacks
seen in UEK 8 (currently Linux 6.12).

Orabug: 37459289
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/stack/tst.stack_fbt.sh | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
index c365e14d6..8a0b7999c 100755
--- a/test/unittest/stack/tst.stack_fbt.sh
+++ b/test/unittest/stack/tst.stack_fbt.sh
@@ -37,9 +37,18 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-# Strip out blank lines and pointer values.
-
-awk 'NF != 0 { sub(/+0x[0-9a-f]*$/, "+{ptr}"); print }' dtrace.out > dtrace.post
+# Strip out
+# - blank lines
+# - "constprop"
+# - "isra"
+# - "_after_hwframe"    (x86 starting with UEK8)
+# - pointer values
+
+awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
+               sub("\\.isra\\.[0-9]", "");
+               sub("_after_hwframe\\+", "+");
+               sub(/+0x[0-9a-f]*$/, "+{ptr}");
+               print }' dtrace.out > dtrace.post
 if [ $? -ne 0 ]; then
 	echo ERROR: awk failed
 	cat dtrace.out
-- 
2.43.5

