Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5328148848
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 23:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722037734; cv=fail; b=AGE9iIrR3aDbAngmtVTYEhd0uf947qpSmXhyZZFMcTtCTXIqa3zq2QzQWyiEW8Q3Vpu3BCJs0FUTza0OZQ/Tyr6/MpuqHVka5WYjbbhR9crPPx8mKLujel2nAPklzyixlMW8CebwtAu8Fc27SU1HAAIEC3c3pRTWKgemC0MeCkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722037734; c=relaxed/simple;
	bh=tGgXEuRT1RaMK1EDseXX1OllrLoKU07o/a5AO+L3bEA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=VNGHTk6+fYLd7kNcaqicjxR2W8yYYSpK6WjFrR82QIjhjWfb8/okx+5hHURvHMUzpIYFbJKYRuJf+p+XCpsfomVJXw593FkgMkXNkzJrbstLph1S0vFSHSHkGyyPM9LftqUzRlOEIWEwny6OzuxoJNdO26K3TJXRawvJ5HTQqFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gfCIcoKM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SUt4MuNk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gfCIcoKM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SUt4MuNk"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QMwvmx009377
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 23:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=hPK4cY79BRlkENrvg+sB4vYvGo1epCVB/NAyaWn5jDE=; b=
	gfCIcoKMD0yOE3vti77HMCaBonc1PYTc303871uYkBP7k1G+kTs63sdiu3w4cDVC
	I20I7+StO5ols49cw5dMIOIzI4aw+TjomCWB00uTf+GI5L9s81jhvlEBDUPT2gtR
	PLZzvP0JkBZCbghBn/2FuJIVldDwPtMI7vHpNPCBvsTgkR7DJR804wawyAm7zkZ6
	ESHE1zxyOgncbtZiBYbS6gFre0yll7E56lz4pYKJvwXALwTiTKYfS2Hy2h62WYvE
	qo/hhSMqUHMoAPux39hWJcW0kvNu2eWGhO31VfBT8/9BqvPktLkW+WaqgwyiGcZm
	Lh/fTOWbLJWfb/0KXrUOwA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mm600289-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 23:48:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46QLhP7N039096
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 23:48:49 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29w1rbf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 23:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyYuuLdlxwGjW8wfR8Ak50Y1xmoqigf6vt1kH4M6Nz5YGdLbfwsPZMd3TuzVAWhsRdsoo/kw2jLCJ8yn+qJzQBe839RvMrK5zy1Vt4c+Mo6cImlqH8KZcGPBYyWfZvb9sjtC8XXykDYV81OUHdsa8VQ1ybgymFvjJLg2ZhaP7Mx/qNbbXv0Aw0HgQB/4C1CPhbV5lqbopY421umu971iIqyEhCVxPS8f8EHLaKsLBTFddvVQeh9hg3FnlTcslJmcM2KEfYcX94reZJ/pkA5C8VZ1EsKPLNk5EvvhMDA/CBqlBd4TupP9TChVBz8GUdRQQezlVObvFIL8CMXrRy1QLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPK4cY79BRlkENrvg+sB4vYvGo1epCVB/NAyaWn5jDE=;
 b=aBbzA3BYnv7iUZ0Gg40RshekuwDRaPxezPcvLWHR3nl4X+Lrqsb25UfZgHDXTVRaPoZNt2yjUiPGEPx0o2oZe8fyUyk9mfLPqkAvOgKMb79IGFPoIWxavy/f/JUWT77kqf2sruzy4dPansjh8hQAPeEs1lz12fct0CDSNfwqK7gBJYq4tk53CVFOXNCT6+EhNxb0QeId78peqw2kMsMCVttWQUrC08CdhhANpNG0EyTKkUNzSIe5tLhiInYJss53R8HR/qiGYcxY2jeZHpT5wu+n/4sumeDEPPfMBVw0+dqC1ABz4TM+KHEZHUylI2nJGuouH9qqCYTtbCj5/ne2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPK4cY79BRlkENrvg+sB4vYvGo1epCVB/NAyaWn5jDE=;
 b=SUt4MuNk0UuRT3WBHcYE2AbbvRmc76umqN16gcAweipdwHKgnd9q+z6AinwbLvx4GVAR/+v2mmmaziEMJdp/hmAGAhyxqAc+Q1zPY720QOphEsimqe5DdJP14mZv5Uj9xQF5nkqeC+t1g3CsD8ExNvkOqaRFKzLhlmc9/jyONr0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ2PR10MB7859.namprd10.prod.outlook.com (2603:10b6:a03:56e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 23:48:46 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 23:48:46 +0000
Date: Fri, 26 Jul 2024 19:48:44 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: if /proc/kallmodsyms does not exist, skip tests
 that require it
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB62875BE51BC23A19B3D1C343C2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ2PR10MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: e7683454-66f5-48dc-6f03-08dcadcd7d3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uTNV2MOwAWFXL8BU1YAhcUOnLo9F+ZfY6K5Fs5AHP9Vel4v56TR46MKqmsw3?=
 =?us-ascii?Q?lgHvcY7xGKmg/nHe/AQww7FQCOruSWTNDwW+LHxEGICd2MyTjSJRmSONF4Ra?=
 =?us-ascii?Q?dzIveHC3ZU3jxwlTYM+KHhSCjMofljyrsrmKqc95ZqfJMTlwP2d0hH4XyE7S?=
 =?us-ascii?Q?SNHIXTVq4G6ptMijDbVHTk6m+44r76ABtiIhDw+VZDzdXtS+KWVlZt4L677Q?=
 =?us-ascii?Q?nwVzCKoN+HGctiV7VVfqQqpa1T/OZWJO1WnTPAsle97lqFjjiBfyBM4wnuUg?=
 =?us-ascii?Q?QXpiU/cEZ+iKZ3QLuV3jjZJcuh+2ZcXgqDeEpACxS7k60vZkf9QJj6owQZt3?=
 =?us-ascii?Q?1fGidkNm0XSdl9RTUEsIFpIkE+f40xSxdzK/GqkrYbNDkM5yqbJkUIWfJAJr?=
 =?us-ascii?Q?yQdF5bK+TJ+sKo/nmncUbI5TaFQ+LJTKtN4EqyFu3U7aCC6DWuQ7N/zUTRJf?=
 =?us-ascii?Q?86VlFIYUQm5Qz999E+2wPkoGeUElsOimP//v3zETK1EAql+i/9nmkXvsnmx3?=
 =?us-ascii?Q?538J34FHDiyN3P9j5q34Dw6x3GZHp4NhL9rDvXWwayWuxvEBfeQpDCuQSGqH?=
 =?us-ascii?Q?zkA63V/MU2cQj9v/5058RuND6jO0Yr3v64vnPrKDS0JyYdnhiJS2eFAQViuU?=
 =?us-ascii?Q?X/DHzwu2EZXXW+kB5rTSiXmlrlvABIcE/XY2ehQG4IEi2ACzQIlHPwKHufwl?=
 =?us-ascii?Q?TqE6MZzRkn03IwsA5qj3VhcDFUVgXe3Tmzy0jSpXKWT+BgE32+jb/3uqAXMm?=
 =?us-ascii?Q?6Rzm58cT+ZkFoO1FnCuNjUkVkWITvFxEIDv0ZMykq1Gynov+FfSHSm3z7uqD?=
 =?us-ascii?Q?QsCg0lcZK7MGMrBJSsBg6enKQ26dXMRJoi9TMnLxWejapZv0mFXFyu0JCMbq?=
 =?us-ascii?Q?xPuNUyGhMdAmSXvJJMSHqZ2M2a2uyZ9dZlFcszIrrCQEnfb95gsf0mfzoxlO?=
 =?us-ascii?Q?OS4+hLSBM3wTvB4IdLi1ETGgcCLvxSbVyPr+5k73cszDGVwehVvdcSQQ8NyF?=
 =?us-ascii?Q?8tiPSZoh566N2+7cP2NnCr7WLcAbv2mxt0EFkbtngO8+RbBQFe2XIyuA8lYi?=
 =?us-ascii?Q?Go5GGGmczur5hZzng+2SOgw8IOgOhhC7D0nb0QuCqJmiZ4FpUfSDoHSHFr2X?=
 =?us-ascii?Q?xjXRui5q1CvXk5EWt91id9l74/07biqI3sjgwj0TIbBa5opd7e/eH2N8lOWj?=
 =?us-ascii?Q?NRnrlX38aDhRXlkr80OVN5v9dIPmxj+/tCAuggk3gGDEZmQ9SH4cU/Vi9GbA?=
 =?us-ascii?Q?Ew2beNMc+dnwfmYMK0xRxakKoSvqnosqzdDZq5S4zlXnhGPWk0MnQ6KqExN0?=
 =?us-ascii?Q?u13prhNkfrDox2f7WidLcz0JWArmdN9B4Xju1Ra4sDOdl0J3+Wq1j/GIFlJg?=
 =?us-ascii?Q?5qgsrbg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?24l/l8Mq9rW/GWygLLUb+ePxYlwdiiBWQ3xQqHtkzREP9dS9sjdYuKQ208eF?=
 =?us-ascii?Q?AknsSOhJ3iA8t18xjXsMmKHtvAG0iTNPR6nhEPXHwOoL2hkAxPuqHXz8Vir/?=
 =?us-ascii?Q?N+SISr3vRfUad0THKIqGA2sXqFSN9g9RPIazrPfurfAUmVE9xnZbNaU/LChW?=
 =?us-ascii?Q?GedLyq7x574t9Tn1dmWLlJXrm6PizN75BSeoI7L9K3PIjdcqDhwaFEKEDIfl?=
 =?us-ascii?Q?eTZng0uoU5FhfisYojDCjuQCEGlk1rTQUkWp/rp2fz4G9aNbblRpAZg6SQQO?=
 =?us-ascii?Q?pxwtMtbmyOiW982T6t3vwer2Qnw18D5egSmpIoBFfggtE71bMfjBBtrjjlAf?=
 =?us-ascii?Q?UG9z1tyW3zLNU2MpU9C1Xu10DsPA+Wz50fSlJzuhyDrMqKxDHy8cfKngHdwK?=
 =?us-ascii?Q?6mC4KQr5JO9ncCUMXQdkD4Pidzchn9WyuGRrUhDfgFLQyyAl8zMEnFNsI6D1?=
 =?us-ascii?Q?mQjZuurrqSoHxV0OuQnIHgf2y9dUIguAjldgwa5VXdjRiIpxgvcUJ0zT1kI7?=
 =?us-ascii?Q?JrJStITDvdAIcyOX4GtW7ktimGKQeAhZgZUeWx9+fYGL/jA3xrn/BfRIoQrS?=
 =?us-ascii?Q?jiz59xXhMPLXrggxqbkUwAPvc+5csj7wV7aXZXva9v96/V3lKLs/OwxbgxL/?=
 =?us-ascii?Q?apG2+duR4xfxMEx4Dqe5Un4LFs12A8IQrU7pagXgZMAR1KjKf6C7nJk0RjCd?=
 =?us-ascii?Q?AdTGAPMaAfbJPwloUYgecsgDCMF/kNsgADrkWMpPPx/4EqUJQtZSPOfS2Ev7?=
 =?us-ascii?Q?aAxEQHl8HzKnX1KJQpAke5V+kMADoij2UZtGhCU2tqspMAOylaUC8akW/iQa?=
 =?us-ascii?Q?KiTUrQ9Xv++lUvfyzcVkkLwN2pluAFjcWjcO6u4M/hO2pxLklGrAqe9xAQne?=
 =?us-ascii?Q?jMDHsMkWLYWuqDmuG4p3W/8dffjuS7EGp9CtRj451WUmq2b3ljAQ+SfpHVay?=
 =?us-ascii?Q?jNnxazJlTmM4oeCoO4ojrpH25PexEOUO1iK1hIGNHReO/ZBTsR+2iRumipP2?=
 =?us-ascii?Q?D8B1JCOX01zalCzwMT0yO2s8PvDSrQMoQMj6YjmkJvFsmUMXv1t/UeRGlfIu?=
 =?us-ascii?Q?6n4KnYSYphyKCmnSbCgtw9nfaND/jUAQmMM6uy9uo4O/Qk43lKIUNKavMqL0?=
 =?us-ascii?Q?yZCcFjAGxwmjJkApa6QuyKO+Bqj5WMNZOrOnr9VZqa5PBlT6ri+6+JYfK81o?=
 =?us-ascii?Q?W/0eSlKpmk2li0OukUWdag0+ybIjqxGUj7ocNrO99wJzt6F849gf1szESMms?=
 =?us-ascii?Q?bmCc4Sj3RUy7X+YMVc2264uiQSNZ6uf9AsQApfbl6U9wLIp3NX9Ovpu4QAU3?=
 =?us-ascii?Q?8PX5Ei0Ttc3r9hGLUQl2WtK9myhwoH0le/XMwN5GETSW5+sHga7tYbcFGnY6?=
 =?us-ascii?Q?tJUbU8I32pEWGABsLBRg8Co63L2fnDp1h4z+KG5i9CR95tG1vCuBJL/cJlGo?=
 =?us-ascii?Q?17dUoQjOBOxvQvq02rCBUPWVlYIiy+O2KjImKOAs48VoLQzhUn/YeW/j12hv?=
 =?us-ascii?Q?kXxmPLr7NF2h1JfsdMLDx4S7QqM6yA/pzRsAuFBQisyk7oFuukuVN1J7RHgC?=
 =?us-ascii?Q?Wm/tRVJDvTFjCj7PcG8umFaQBu8m5TUY4HA2778U4hiiN/310ffMBx8WyLGO?=
 =?us-ascii?Q?ABJmp+ozqRdAUsmVAvJQKFM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OEj+mjyMSKDoJWEbLCTitRhqbAmvgLBZfkcgEvdGXj050WHm4bRyvxiE5vbWIMQ7C2ylIcfE+DWvaqoQZ1tadVfQgOzne0Q3xZpfeSNv4qKYlFcrdiTU1fPPL5BJKLp2ib9GMtxfWDkq3GR1Dm6AU5xkmSpV/jwNFn1NIXkGbwd+PNM5dul9T6ACdK/1jNMDz7Q2LFD9N1XQkgkzHB+01sCciXymI3AK+8anK9mc2T1HGykco+qlaUJfGTzEegEvpZsxCR1YqLCwLCr0xVxkPje321iYak3h28kZ1FyW8i7cSlfAW8vDPBPLSRaM47wIfkk7fXitbsbR+1LKM7RvqEpcP+K88PcLLgIdA8D0AxfKc8q4xtlFsvYRATT2CzTvPCBk5XPfEC0+OztxlvFPhb4tMvZ14Zg7WAy7cQTzy3jD0PjMog6h1BIEsS4GnIx78XckIYj7x7TCDwgTxyAvD9EtF2o3LE/szZ8dhbvzGe9+fE5GJCNj+BJpezZmot8KG9bEncO5HQfS3Hd1VXHiQgTO3GK6VRMaN8NtT1bxeQAto1WsWyjX7q79/+mv8AxA9cUppexe55E3IkmdFDD0BKWr/ZN+wZVNiK89jheyW1w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7683454-66f5-48dc-6f03-08dcadcd7d3d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 23:48:46.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGxaFjrpAYLCzTOsnXVqpEfu+3FadC2Uf/LxhKQM+6qi7HOGFjl4SNc7iZDFOGVUienxUGvFQWoI9/ou+71r+3Wpd/5MPm5aZlY1MzZn/DI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7859
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_14,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407260161
X-Proofpoint-GUID: 3QPQOebwQtNPYhAHj8SURKURpwOORVpL
X-Proofpoint-ORIG-GUID: 3QPQOebwQtNPYhAHj8SURKURpwOORVpL

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/aggs/tst.aggmod_full.x  | 4 +++-
 test/unittest/aggs/tst.aggmod_full2.x | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/test/unittest/aggs/tst.aggmod_full.x b/test/unittest/aggs/tst.aggmod_full.x
index 94239b47..955fb52a 100755
--- a/test/unittest/aggs/tst.aggmod_full.x
+++ b/test/unittest/aggs/tst.aggmod_full.x
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2018, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -12,6 +12,8 @@
 # often of the form __key.*.  If there are few (2-3), the bug is present
 # and this test should not be run.
 
+[[ -r /proc/kallmodsyms ]] || exit 2
+
 nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
 
 if [[ $nzero -lt 20 ]]; then
diff --git a/test/unittest/aggs/tst.aggmod_full2.x b/test/unittest/aggs/tst.aggmod_full2.x
index 2cc64c94..2e4c5900 100755
--- a/test/unittest/aggs/tst.aggmod_full2.x
+++ b/test/unittest/aggs/tst.aggmod_full2.x
@@ -20,6 +20,8 @@ fi
 # often of the form __key.*.  If there are few (2-3), the bug is present
 # and this test should not be run.
 
+[[ -r /proc/kallmodsyms ]] || exit 2
+
 nzero=`awk '/ 0 /; / _end$/ || / __brk_limit$/ {exit(0);}' /proc/kallmodsyms  | wc -l`
 
 if [[ $nzero -lt 20 ]]; then
-- 
2.45.2

