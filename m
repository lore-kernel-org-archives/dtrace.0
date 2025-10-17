Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877DB288A2
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 02:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667682; cv=fail; b=XM1jI/ZdwCdbBgdRDZiokHb5/ag1UPfsSwp1ecjApm9WlpIk3Lt8Xj1u748C9m3Xc4ARRNCq5l6n4OGR7d4xLutQsePQrUrUkVeRoU1JOblW6jP5gtU8VgSnd5eBvgRjYvTwGRQc2LQbu6yJQy9a4nrgDLugLqWK0PZwTkY7oAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667682; c=relaxed/simple;
	bh=SRIb9AmFJGxVixGvluyPzp4fDrPTJ/PQkNn0rDhoIrg=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=C65848QxfseZ/cPwUK+kTMuhOeMWtr2Cv7Iyit2x7lr4MAFpma3EYEwEcEXWlcDUpiVTYc9lT01SbeDj35cYvmR5ettJJUR2pYZhcUmNgN80el29scTQGIofG3K+5RYZez3pwgEO9rmeAm8yv83vsGtD5dzjVn7WH3knhTTzpBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FbPhu2jv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=d+tOmo9j; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FbPhu2jv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="d+tOmo9j"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GLu9ax021323
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 02:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=S5JcHfD7eEYamaerHJvtpbHDuQdZ/RGjD2fay1V66Q8=; b=
	FbPhu2jvK+qZu9uA1HusfrM1cRI63Eh0/TVDk2NqgVVQr3uZYOXDHU8ZgkTZkoF8
	ZRWEYJX+Vz1A2JJlSxHYSYjwrK9q/2ly4Wcbhs0h4hjFS3rT3W0oIgj0ctZyYk7C
	ZbyoimSRW0/wUXq13DbFBbKBQ/E9XbQ/mEZKkdtEBFJJ1DCXYJfX5RfyFx2BVoGV
	lG42XwH5liuKC690gQbKkyLcMAlYNcMVA/0TZS6p+wWSw9KEJC/2tWilo5F6A/LD
	Ns9ehH2LhvpXP3DPQg9g9Egfytpp46dWMMqgFmNXaliFvza7az2Z/zMu3gedOZwW
	0sW3YlNwiaCxoT5gSQeoaQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf47t1n7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 02:21:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59H0ioWJ024833
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 02:21:19 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpcfs93-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 17 Oct 2025 02:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=crDUBXyY5s6WanNrkC8AGf7OrdWayavGGnPiAx3slYSHjJ3+mhO6V2Z2hF+ZU+OqSELCZmYZmL61Wnb7o+gBr/bjR714rZX2dNDkGJSov61jvRLq4L//wM5H3tLVXxLiR+eA814iftj7XBe+rYtsC9EBBkIFe2R3WdaHJ9V0nApl5yWPS31tgQRvegMbpYP993JRUokno/+0S9RQ/gi8sfWnKqinm9roiw20AlWHLFvYcibQ7UjqjAdPCI7N8eR30kGX4NTIXdWKAQW3FXZWE3bLVvh4kRkUAJG6ltkDnDwFdnNrOfpdoobucu0047U24HcTGZvOV+0g/HeDSv5mVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5JcHfD7eEYamaerHJvtpbHDuQdZ/RGjD2fay1V66Q8=;
 b=ZJGOuHD6wFeljSFCATL+35JD0Vm8jqfTN1bCangLhVC4D8YE4oagA+Lp+xq0wABW9l3YLbGgTSHNoeW7Io4vzBDwdVOtzhVD8RcpM8BLlF8ecAmUvis3+tY3mdb93t/wRinnTGoKoycstap+us2ABJ1iBnha5rqHMwZ/n/KFIY0G6zFUFLDbjIJShEaHuBYFF+LrkSQ5iz4v3eYBk48+XOwoAC1iFOOSX3aNjM3jchp+TaDdkAazDM4ArO6YpNvzCrJS1Vd2sJhyf+O0A8Fh/WWfD1IvMlJ1G556YRjgH2IlQ+NTzONdDDO7nY2LP5Cu3zpZLKEkT2WW6ov6rVVrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5JcHfD7eEYamaerHJvtpbHDuQdZ/RGjD2fay1V66Q8=;
 b=d+tOmo9jt2DKk+XbBJdw4DM4JxBuexMtCEjc4nrtxa1eCG5XUPTacy+QmzYjDWoUO8rgQJV4Q7tLU+pRFsH11QvHNzUt9MwktluJHvIAON/fGDiaM9nGHbHSaHJh1e279zWhuYHBKxyBay42AOHQU+W7dd6jQOgxQHyEsZmFWmU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4613.namprd10.prod.outlook.com (2603:10b6:510:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 02:21:15 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 02:21:15 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Use copyinstr to copy string from user space
Date: Thu, 16 Oct 2025 22:21:13 -0400
Message-Id: <20251017022113.16738-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040AC.namprd05.prod.outlook.com
 (2603:10b6:518:1::5b) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4613:EE_
X-MS-Office365-Filtering-Correlation-Id: 04558240-997c-449e-a6f7-08de0d23d8f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4J2LWOdnDQL8Y4QyCVm/5qUzvy0hnvLmguQXa8/ga8WQWq5Ov5Lf6tPqSpyn?=
 =?us-ascii?Q?+gdoC/Hz2flHWoFB1UYvrWdj21AiK+TPjWhvRkuSOim17UUpkwye8mlTVmBd?=
 =?us-ascii?Q?x+tjQU22Blo8aIgtaop5mrMLFnx9HO6KyrsDWmIAelPCweJM9kNJxzkU5Mkw?=
 =?us-ascii?Q?tp59tjtfcQopa0ZZV6Sbgup8WgsbO1dqsIJSycXTvtqQYmXNfAmuAgcyOcdD?=
 =?us-ascii?Q?eLwgQeNS+xaHoLqxrqdG8f9jNP1SzaT9UUev32rlVx/0qG7TMVCZ7SC7AjyT?=
 =?us-ascii?Q?bOVakHgbRn7ChreTewt02Mku0xwj2IE8oOxtp9QhkfhfoPHbnZ607R8ROe3B?=
 =?us-ascii?Q?Nq9x03wu7eo71mbD+Wt/D1ruMjJOL07rllHeJxhXX0qfP6SQLEQNW8DhBz2A?=
 =?us-ascii?Q?XJetauVBr89uToNv9SSUO+PH8C4EkHY2+QOLQHLvGIEcKr2/WDDM01BKrBNB?=
 =?us-ascii?Q?XMfJWqmplWjkvDTJJAOKCOxmM1ymREJn8/41LeY2MFmpXy7OFa+Gg5zM1RRC?=
 =?us-ascii?Q?qWrVN3vZEl1yu2Q6Ljyg5H0Wnd6ulbuQhUKcQoasKnyaAPdMJm/NAzJF4+Y5?=
 =?us-ascii?Q?ETUZGJHOBOmgrg8wuXvUQSs2JSOzPBrQZMkgJICD7/9YFQQPGWBifeJkhTRI?=
 =?us-ascii?Q?cGURtpY912jj833n6LlC5fYUPngHre9uJErCY6Os0I7MIGP7W+vQ7FdJHZ3g?=
 =?us-ascii?Q?hX2qt+P9G2ABT4rjuL58XA667vpb7+4MePqDcWqpU/tJfClM5C+Q0fqhfRDT?=
 =?us-ascii?Q?mPN38qNfrn/hZHltU3KDLhicoZ3fYV99IVev5rG8eeLXFOrhhGuq7a3Pv3Xq?=
 =?us-ascii?Q?WY22y/LR3thfim9Z+87pdVKqwKOT11CD+OHy6dR65XlGSaorUKUMgLsdCQY4?=
 =?us-ascii?Q?yPc92w48Fagt/vLSJ6226hobT/B7uBnjlo1KkSy5X14+KhiFQyBZ0d1kscwI?=
 =?us-ascii?Q?IHzTN/kLtOEBdT5CnBq6ArmHKLUCV9K0geM0GeRsVHIPPJ/I+6mw0DBfdIR1?=
 =?us-ascii?Q?1VZMUzSreqFWZTE2bEYs6RkGFJ9tVy3aYAcap/KGWKWTQ18X+R4hGOFxpFb6?=
 =?us-ascii?Q?ew3VKouuJIwWU/4tpPp9mu9q+Jq9RZWYPBXb+66xp/BaNmGdKchN3MbsSOEN?=
 =?us-ascii?Q?r8S9jZ1DsYrCP2JbWQeUUJYuOjTL8rIm0QNg5RgG/Fzswf70ZuPDdX6tAhpc?=
 =?us-ascii?Q?zeQ3oM6IFXO9Cs5wDzSr1cJ+nE9AJYTfiOMfncMDllBSYprnV/iY/yt02ho9?=
 =?us-ascii?Q?trO4ghtQoGcIOO24w7pwZ8ggaXbmFgXLdvP+5IgUJ7buWJpznngfMZ2rc9f9?=
 =?us-ascii?Q?QhBw4fuj9T+V1A/SXDcu1TrXhotCqc5EK8Xr2FEkEFccFP0TuCG1QPrWXyIe?=
 =?us-ascii?Q?76gi44LP+WKhYLIP+91fCWvuDRDlNv4etaKl/sgGw0TSIvBokhfdhoix9OkP?=
 =?us-ascii?Q?i3zgTK9t+XongKLs1tWVDcHodo2qbL3j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p2wP114atcT/WF6eTIKNBl9BA7xbFH0bQgMi48Us4nSUFaAzXZMUKrqltL6z?=
 =?us-ascii?Q?rlf+pUt9xIXZBQGG79TyhyXgdmNMMPzKyOYAE279psUk+fMTJ8iFQIDFvCjJ?=
 =?us-ascii?Q?52qm5ujyg+HPTLrGBLmPQLHL2oARYzNcMhOTlQXMUeqNCKGWLBnz0/pbP8K7?=
 =?us-ascii?Q?ZZMnvmqXzNzQ4UfSTLclPuOn7aHzSGFiYwUFtFjbag4vWqFWMvWd56yulwr/?=
 =?us-ascii?Q?LjSM8oBwcaAdW4mzmTjlfXo6C8mrzGDhyxpeOT7wVoM0m2YWUD1b6n712RnV?=
 =?us-ascii?Q?y1eM0WPZ9rOfX2YivCgaNDwHSDf/tJWpPN4zMYSK1RR1AKGmEEI5jXjfedp3?=
 =?us-ascii?Q?Bzgp0fI0/Ihgk4ni/gQBwu2wcR0u5XYNsuEzxobcBDoDxjbiuqxSBNte+hqS?=
 =?us-ascii?Q?XSsfCmg7+pfaO0zg6wOL2LPLyZfzugKszSjSSi21sm++ggCx2xf1jaCQdstB?=
 =?us-ascii?Q?oouqXDors7UFMYBwCSpqPMg1rdBvB1Qp2J8bexM9i/8YwND5XFau3Y89D5BA?=
 =?us-ascii?Q?+aIW0USLWeZ6960cRL4P5UFXpTSclpq2fx270HqyueZnzFRS23Hib1blJP9k?=
 =?us-ascii?Q?qRLNS510647QoHQ7quUj9DlGBUItbQAZR3BSpA4Zipx3ahDiVmRf69polDBp?=
 =?us-ascii?Q?56AWJeZwRzJzodxndQKm1o2xJw5iVaCLcTyH9YDPvtweBZ5tEyYb7auzqKEk?=
 =?us-ascii?Q?st4DEhRUeTCRY+WI6iWnQDP5/QrBD1pUHhBN7abD/Nvpj6h+H8iNiK3WW9Ef?=
 =?us-ascii?Q?+5LBuBS/p6m8HvDGyUaiZ/65NTz2Xu8Qq2E8THuC2QnaWi29H8R19YrW+Thu?=
 =?us-ascii?Q?U654HkVzFjcXolQe8ZzaZ8QuQN3MQp3uVgMHYp8toEL2v+lOGHHtzQQjUUtZ?=
 =?us-ascii?Q?azgDx/xSVQp1rQ5cKSQ+YM72K1pCwLgbd/NofAtnQQzo5OwP61cZccZB3tcB?=
 =?us-ascii?Q?TJCifwHpUFSOaJ24tGo31WAX+nIH0IU4gZV8RK3KI1r6xhDsGQSDixypJ4HS?=
 =?us-ascii?Q?gXEeQzJNp46osyLzSc+RK/OYdrcUMxxX6I1WzG9mUqOLcpefBWjdPU0WGbQa?=
 =?us-ascii?Q?U+YN6iXE+mk30X/R4mklt6WISzKfsF0tRXyqCxG59kSBSU2G9gg4DRE2j8CQ?=
 =?us-ascii?Q?sUqoMXh81sJfagxs4A8e0VYO6J0KrRW6UkuYWiYsrPcfubELQ9Cj4CGOQ/+b?=
 =?us-ascii?Q?AhbesYUXISJgq0qZoRFhs+dTmXlwYkLjzvUrUnPJr6XPeLhrVOQyuCUSe6+h?=
 =?us-ascii?Q?/5pCT8rmbY/E9TRBKY9t3GjK668/xIdf4vakI0PWn1eBm3VGdc8whdgeJ5q0?=
 =?us-ascii?Q?WzLaP5Zh2x1wKCjHp4uIhcqXD1QoZcNHlSbIONDJsUOS+A9u2mYL0xhS+qXo?=
 =?us-ascii?Q?xciZdIvG3fzyU6tkj9wKfdTKucVm1q/GIaHvslGd9IcHL72AvWpO56tSDLcC?=
 =?us-ascii?Q?FKS5jjahMalMIUwFX5josaUlsjD+FT9qxW+iDQnz8HBno81dHLKcg82QzOSU?=
 =?us-ascii?Q?y5OypAAJ/Ar+G5TEvlQ96xKtK6lT8VFgOCRAehR78vLOQmepauMsftKeRUiH?=
 =?us-ascii?Q?+jRCZJEmdPLsaMAqaCkeUjPkGYsqrzGCRIcnIDc6?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W0cWeY3EPwyKQCE8J/0wr4rmEUEXexM2l96Cgr3I6xMer25WMxJV3WPFDzCOWp5Egi4Vv8n+KjSlFHEny5Nfvp4BFVpchE9NEB4czLri9b7W1t6Jd7dAbexYmD7EiB5jGEn3k1jAq+2fiZnMnXHiXYAMDPvqGn7yYWHgMAcacXuAQQfhxUHoOmgF0yo19GPK2QlhlRyOkf0bJ3C3Ylu66POTKgsBlDopDXVagd1GA3OA/9c8uo9/GKtCOa827BUi/IW8pys6sGbzdRo630Jc+j1UKwN3MCdfnSea2qWWmyVOvbVvxNDgipXntsi4d+IEjNbkg0W8I5hen1+zOpbNxFUqSaADxUQijx+sTsehBkJAsDM3Xuzpa4zZRSX2tsv2ZdJUdACn6h+DDhoMRObzShSMsgKFOolpl3JS4fNhx4GGO9EwXhkliJG/vKf8bsVBuHq7TZ1xnQhuoOmZeEkRoMgkhp0x8X1S54h7W48yRtoeY2JFGbsSO/naurOrmovZrzj20nSo0YhFz4XSlbyJRSwraV5BhabqsbXxk6imM3renVJSXTUKtyQkn0QgpUwGvcfhYUvHBv1ouZiIzgAQLYl+eOkIolZi+8clk7ztZ3s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04558240-997c-449e-a6f7-08de0d23d8f0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 02:21:15.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Azg1mHa4ULbKbC8p6NET9VhleEE1EQO4u+dHcx+91xPqhFzvvOf5FRVenaFboMxlMlEbYIeWsMTL/XjdHF7uHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4613
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510170016
X-Authority-Analysis: v=2.4 cv=SK9PlevH c=1 sm=1 tr=0 ts=68f1a81f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=O_qMISJal_XZNEAwaVAA:9
X-Proofpoint-GUID: u3QIzAe_VUdD0l4aMSLRoq8SbRmUYkKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNiBTYWx0ZWRfX5bP2Q/M29AaX
 zvI5KLUIqqFbPbgc1kAbiQYcm1hF2BSDChfLz13P9cWF1rMzPGI44kK15o2rIhti27GlFKvJ0NH
 hY7xaagA52icRtfRJI9vbmLj63jeaspCGWRZhf14zG72b64nEwpfbfy9Td3fAQmMl+0Y+wigEnm
 7zjm4pMhitxVkX3hjHShrFtwfPWQUwNViEO/rv/5b6OWBXCKGO0CFsFBnTe8yTE5/+0cZOqyNsq
 1i1SS6wFSP4bqaILvDaVM6q5xlOqLRjU6gkKyJnowIJKxMoKgtSSxTJO2zOY66UrzPGa/G8pCuT
 7X0zbOJgMuROXYHfHjINjNatAzKj8rsnowvcXwomI51MfGrzXOH6K8NcbeCRSaLoeeI11zktUEI
 Is/7vv9RcsCNgxkv4cl0lcro+8A7Xw==
X-Proofpoint-ORIG-GUID: u3QIzAe_VUdD0l4aMSLRoq8SbRmUYkKk

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/proc/tst.exec-execve.sh   | 2 +-
 test/unittest/proc/tst.exec-execveat.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/proc/tst.exec-execve.sh b/test/unittest/proc/tst.exec-execve.sh
index d3f84e0d2..b70f0a6ea 100755
--- a/test/unittest/proc/tst.exec-execve.sh
+++ b/test/unittest/proc/tst.exec-execve.sh
@@ -42,7 +42,7 @@ proc:::exec
 syscall::execve:entry
 /ppid == dtpid && execname == "parent.x"/
 {
-    printf("execve      %s\n", stringof(arg0));
+    printf("execve      %s\n", copyinstr(arg0));
 }' -c ./parent.x
 if [ $? -ne 0 ]; then
     echo ERROR
diff --git a/test/unittest/proc/tst.exec-execveat.sh b/test/unittest/proc/tst.exec-execveat.sh
index e4b9dfa5e..09a3d9338 100755
--- a/test/unittest/proc/tst.exec-execveat.sh
+++ b/test/unittest/proc/tst.exec-execveat.sh
@@ -44,7 +44,7 @@ proc:::exec
 syscall::execveat:entry
 /ppid == dtpid && execname == "parent.x"/
 {
-    printf("execveat    %s\n", stringof(arg1));
+    printf("execveat    %s\n", copyinstr(arg1));
 }' -c ./parent.x
 if [ $? -ne 0 ]; then
     echo ERROR
-- 
2.47.3

