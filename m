Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F11D0E01
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290141; cv=fail; b=YTQreGQ5M33dqXm2RjrZdtOCowgCyPljeR7musL23Su3gOBG/UabVHflGIh/QDpmLdsgxShvu1yzwoQ2OS7HstEP0k7rnzJrlrv6Vxfh+4NZ6bsrIAB5kvFxDPiOBgFTrIM4XXTokm8pDsdJ2YOsNhlOtgvVBtmRr/QItxXNSp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290141; c=relaxed/simple;
	bh=FYqvjBxhDPZwbo5OqiqvwzGoT/m5S/dWks8ZdRExe+E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SKbupP8eUYD/Il1tTXu06aLG1SChbXEytWe5OTBZ7Uxt9qlH0ThOLUWAIUcJ0BjLAmtee7f79GxL/lOkbQxU3daO6SGQDmsM3DjAWW8vkhh+6GYWkOYyP1Bwrs4DquUN5Z/+Ja7ZJr1M8CowXX30TJl9LUfYr2h7P4u5RilrsB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T9JOa6AU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=y2tlIHn2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T9JOa6AU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="y2tlIHn2"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fddC012570
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=pXcCiWFNZZMlIj6t
	cPghJYg4fE29umftlSZMvQEg/Og=; b=T9JOa6AUGw+Kr9f6Ftt72HDK4f5cvqIU
	hLFPDwbtypNdd6DruDPdMoyVg535UDvKDLpwOvvAEWjVleQ/p1J/LesWGp5W+uW+
	WfdnSLi9mwH58+lHWtuv7CGHRsit1XRXv06pBMEpQyNvGICG1GihL/OvhCc1j7SI
	17ggNftKEanRdJ4vVQlrS6djmlrWR5bR11unLjI+eV5Ui9NcaA+ODXzRAJ0loKiD
	IfWItkE1BnCzuATGSAsp+93Q7OL87kzHdVdpaXzOc4VtOuUV8yE7MhzRRpnHYEpk
	r07dRDnlUEwaVS9r3wusBi17k/WJt9x8UDRM2JuIPxr9YI+4XKYdyw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grys7v47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:08:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9tG4P011891
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:08:56 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnadx55k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:08:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwkyiP0Q0y8h6+0yYf/OXiPD/9Z/PPD7SVM6RzJBzPx/yywqR8eEq4zvVORVjWANTBtM2sib+YNIvH8xACNIIUhTVm/3AShPwRWoKxGQ/8+t2OK2uNtGw7VXJx73J6sduTA5DzJlTwFVpr0hv+RseNVvv9HlkWxfQn0OUkheyjf7gYPWIJYPwEQv6vf3pzf+tJxI3siSG7E1HfZ1sQFZN3TV7PNrripBknLqwAMG9oahr9QgT8oCos3N9XfzKizEGBkX0KxDt5bQhyYKQ0FYBur0oed603350jnBUw/IecHoApA/gB6x1Ziy/wdoyPHhvQwZVOZ/EdHynXGmd9ui2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXcCiWFNZZMlIj6tcPghJYg4fE29umftlSZMvQEg/Og=;
 b=ndvznrKW+UuQPmbwHC971dwDkfdohCgacmFfNxc/bQsGg5lH8kY0TlWDdWSMoqT2E/kgfNpX97Q2chZrkej5OcD6fodHdfKDcq+TKQFheh0Pi1vzZUw9PGTqiH2R6wp9/0TLDhI3pAu7DL3kbFzG2hwxZRNV3Jsb6OrphovPRDVWZPAgg5r8+34M3cfuY58gACxaelX065rUYcqO/tj8WkUGP4M9DF4c9KWxXrB535ZfnHgHux3Iq/KueENNnUlOABmVZmB5PYGJ4+9UuYtRkvi+Z8n0TckwxeT/EjjdfJ+7u79DZUKTjNh9/vZ9km1pkZcyryQjBIZxfJi0tKwdbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXcCiWFNZZMlIj6tcPghJYg4fE29umftlSZMvQEg/Og=;
 b=y2tlIHn2ZmeqhpxymczrL5yVWbBUIYKI3fFBIs7n6xKts+blBoHzt7L9kFjo1ZHkhy+deeDvjCfT/bBRiKZt+s/DXn8fROEDdbI++nfC2VRCQ2vxXBGXYeLNPG1zMUsrGEU4t6deszy5Mlsua3kI86xhdhx/fq3rRBEGsYKVenQ=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:08:54 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:08:53 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 0/6] usdt typed args, translators and arg remapping
Date: Wed, 30 Oct 2024 12:08:44 +0000
Message-ID: <20241030120850.256884-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: c923a6fc-80d4-4fcf-53b3-08dcf8db9f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WbG7xyKLvgXlHKyhotghBCCFns3wIb+u6kxFuqtawQLHw6pQuVi0STsJeaKo?=
 =?us-ascii?Q?ALKV5aAqTqwfpBncp/C4147BNRwyjVBLK6JS8PtmzUSI6JTYgj508ktM7FmE?=
 =?us-ascii?Q?NmR/r7gzP7A9Sa7Ytx2nJOKhFjmmYgehFzlWQZMg6k0lCIMlm4cIIXYw+4al?=
 =?us-ascii?Q?4lGMZrQ2MvpEkZoVgm8aU7n1Q+ldyELpmxA4TRiJxaRRGulgbqiBhe3ehvLE?=
 =?us-ascii?Q?QViZ6FJ0TmtSrWIL004HRzxB0wAUQIDeFIrmD00EALB/Abk3lbM519Nkj2K+?=
 =?us-ascii?Q?W0PYWzHfQdAKXuJkzwBalXfta+jxyb8uEVTaGA3UdDi+FZExgF7b81m6JCOY?=
 =?us-ascii?Q?K1Sq/TgH6HQy0DkEoB5lDRUkRtFVUS2jORBD0fgd9/TrHVZLGrMG0HNGFf4C?=
 =?us-ascii?Q?ViDmdcjNymyfCRtqVdjmrpKkL5ZdV9cecd5qknAIr8Zxr/dd0+CEaYcPOWjt?=
 =?us-ascii?Q?jvtNIhecPtCzwXmie97buRuw7EifStSFh7LP3Whsyw14gP8ilQelebxygkHK?=
 =?us-ascii?Q?0j2IcJS3bkfEJC/hxiAceTLrXodxSxpedRPSPy/9iumG3g8PsVyAfG9oyJBu?=
 =?us-ascii?Q?IP0Eu8H+fsJfsSiwGW2ctx7MOoSn5WzoNmlFHhlGzajq+2ynZ9nDx4LEIfuw?=
 =?us-ascii?Q?T4MIHUDG3m1vc2ijgrMlOZCw9J3WXd5GX45RCuCguedWapzDag9RsK1bJrAB?=
 =?us-ascii?Q?OsrwgmdCQ5EAxqVBPWiA0eUvjX9kAVFEOm4BTEFgNqVq7N4v6R/P4iVggrIA?=
 =?us-ascii?Q?tyv8WsbEqlwWmrP4Hewv40Rg/9dyFy77Hlbo1zdjMsu8g3SVi4EKD82wISLv?=
 =?us-ascii?Q?gcjV1gnVPQFz6R78t0fRCBdRjl5nXKseZoC1eqhoP1WrnTL5f9F4FGKHXlYp?=
 =?us-ascii?Q?mUB3PGjXv9EtOmVjAL/E13jVaGYE2sumSzzSIfkDoxcdsdYtyF07G25nKS9P?=
 =?us-ascii?Q?LyBTTqnHDETH+McaZiNa7aVXLReSknlTOAGKj8j9dhXgvo8xfCW6vHIpHTW8?=
 =?us-ascii?Q?6gSIXdC0zwIvnntcAz+4C5/hjL5nixIVbWpsGef9mq9kZ7Cw04+7Yg6fpqds?=
 =?us-ascii?Q?1ot2Bu+FH9bKivdqhcFg3APuy6x1e8RSlIlp0IoGmvNQm7s9TnUUcrGYDW3u?=
 =?us-ascii?Q?k5+xUoACU55gR2H0CVbkSQEFkx3r7gCEPBnQD+NV5p6Syd8v1tRDqOAe5g4w?=
 =?us-ascii?Q?Te+gBAEe333SDg11SdkvErdHulq3InNOONE6TwrcUBbBizw3VoFgiSw1BpHz?=
 =?us-ascii?Q?982RwZMi4G365Er+BGdFFdkMUdn+uK4S5FfhGeVs9klfsxVqCIUrvmNwT3E7?=
 =?us-ascii?Q?BJpZicbkLwndecE2vEDW28/W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w91BhG4K3rm3ffT88F7kKJhKe/dNzZO1Aa8pLEbsCISwL7id/MReGAvkEe3o?=
 =?us-ascii?Q?vnjJ+8aymOKZiugUTgT87n+BLstBCHiVYmmF8pXqqGp67Jl1zUfkR3jDInbf?=
 =?us-ascii?Q?RY/amhZ9K6wDaSRuJZOD6T0Y9Eafy68L4Q5+QJeJvw0GGySnI/UwfLBwo0xg?=
 =?us-ascii?Q?pa/JwtnAOzdNG0r4ZhbnM08pD+rJSIGX89NXLObfEqG0l6dr66gvY05nhgjB?=
 =?us-ascii?Q?gGBYTaVZPKENlGwFB1AYD5YkaTdeLf1YV0UO4GUsTlfAxRE+axITbVjRoDVl?=
 =?us-ascii?Q?XSIOb3RJUoUtEd7N8AuHC/w7DkyzA0bOk4txVvTMGyCkLfAy9gNiP3DPH3PG?=
 =?us-ascii?Q?IdfeHv/RkkfmCRq9bngSy+C2btjL9niqzar/lyyQFOfU40kX+9OdWR7668tv?=
 =?us-ascii?Q?b0Wd1tvSYe6zSQ2chDIATmcjf8xn3uovIwmJZ7Ox452pmcd4yUPu7a/qkJD4?=
 =?us-ascii?Q?zqIj3Lxya1HaYM/KeR2xWxZSuiHzL74Bo75WTTwiTpESl0k4J92GwV0jpjtS?=
 =?us-ascii?Q?TgNQn6Q+Zb1Maysnn1yG11cYPQP2uUdlyB2KbbK1FlNI/UbLmD7TVal7ZK45?=
 =?us-ascii?Q?FHhBf4H1jjxginL5u+x+6P1U9jaEgEE/IBIsA0NNliEoggU+V7Gu3lIRJn6M?=
 =?us-ascii?Q?OGLXKxApDGEwpZ8yc5pz1FvVZBrYaX4QeTqSX504P49xT6KvlMZ/poQea6hG?=
 =?us-ascii?Q?bQF4IoBJZvkv43DNBoBdAu3nJhyocMYl4b+bHi9knycp8DE7cjQKAAHwm36B?=
 =?us-ascii?Q?+fFOWozS6boPYE2UzYjBjw1KBh4ZQyAExcHUy01Y/wzDWOHuDK8AF+2nRD7J?=
 =?us-ascii?Q?KN2pMW7oRxBMoZc796QuSSuN3ZM/GtpxV8hrfaulMXmW5M6RR7WzPl2QpnXy?=
 =?us-ascii?Q?GImdsk5pBCNmMO8sZ1LAXc8ORlgsZ+8fN6F7U5weCt7Q+BGFXc5tfxZtmSp3?=
 =?us-ascii?Q?m/jP4CXuEEFXmBVkX0bRZHzmzzuxey69wgGhsFeWsQzr0bP2pQcm2tqZsXEk?=
 =?us-ascii?Q?cB41RI3ZByvHZg86D/bh1jGcakJ13zPiTGVfxjPewMwEf9trSk9jdTOxlxgq?=
 =?us-ascii?Q?H8Fc0H9stelCrLzq14mHwp88gDrfmB2ri6dlKt6mDVl9TV417g7JhL7PBcbR?=
 =?us-ascii?Q?Hgwyn8VNt3707HG3M6LX/j3mo2G8crSqhHzV4X5aoc2b74RxRx/ZGgLspjN+?=
 =?us-ascii?Q?+d6FYyby4437O8nPUV938xrwvaMqNg0uSni8qzKk5hd6ZlsKU8IX1eFQBx6w?=
 =?us-ascii?Q?NYMVkmtC8qxvFG3iSY+je5Gmd+lU94mNFVadLivplCt7Y9SB1/i12IyLykXf?=
 =?us-ascii?Q?hyG9qh9o5cXXsaGrtYMsItMEAR8EGDAGL1A9ldFTVWO18feiT3WQ2iAXG1Kx?=
 =?us-ascii?Q?ET6d4JUZUu6y1w+ahADTD/BgSJ3mwmEvUE/rEHF5aEDqbDBoT3tjZROJXUiT?=
 =?us-ascii?Q?22nqC16+mJaCCsN91RBLn0FsSFrJFHwi2qJcDDM4XP3SpPKXDWVr80J5dwHK?=
 =?us-ascii?Q?CVJdKLGBCbRcf7wvuLx44rsbZUVYsyhNgJQweVXk8HdukncmVvaMOrP74rIv?=
 =?us-ascii?Q?e7t+jmS4OkMRjptIT3Nco+lD5w4fMDOaaLYEM0OFe6djX6niKH/8RCy2fTgZ?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XjMEDMgSyJVlTJsSaLdu4TCFX4/FS7GTx8mKuIkRatLATxnhfXG2b/4b0K8lFU+EkNGf8gsTnOdzcVAs4QmThjWXfEUTuRFMmljwE1Xks8ku2aIZTv7yj6D+FRPbp/9PoC1Mbbd7D0ukiu2U8Lf3hL5V/fakNpPI6Vlw5LS6uexwYphwby+f4LbvbiXNXOkvodoaDkj7/2EfwPqzIAHwbMoR5a0n0Vr1Ncuv2drFHqJ1KPpXk6FQJoISGDBaIEZXaHnJpHVeciPISSMriN9ah2uvQeGpDhq2sqlgQLpM8EBdHfuOVD7bczTWocCgfhTfAlWD1WZBB1IQlpcc4c8vU28GJDT1zVwLwl5i+Ln3ww0fGbVs0iGCGd6EuojZygvh9zFwYvUQnzqt38kQ3YpJMIwlccbDwg5/nhm6mcRyWxNp1xHjwcrqbNmqYJzFvFh9IyBpRPzRQ3Sl3nJh4tDZgzusMrVWyTBB3bJDb59oOkBgMzLiq2ScKnJZHcLZVAkp5KxVoDMySrl4sT5FsGDu9zoC8lRXKI7VQ2Tunh2cGdk7yKVLusNylWq3ulKLwMD0LvnyfpvirdxW2ZyNxI+qeOO5ILxA7+9uDEUq9+FSHaM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c923a6fc-80d4-4fcf-53b3-08dcf8db9f87
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:08:53.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnSOO4CTZKdU1ARO6Vfl92HisPPQAMlJlsYA1SYlGioPT9mKqMT6OacR+HLR/DbExbLKcgubsv3hQ/YFyyPTOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=902 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: dA0KTT8vIOgKtoeEv4JztMVrZLHGKmGG
X-Proofpoint-GUID: dA0KTT8vIOgKtoeEv4JztMVrZLHGKmGG

This series adds back support for the probe foo (...) : (...) syntax
in USDT provider definitions.  The dtprobed side is routine, pulling
in the DOF and adding it to a new set of dof_parser.h records fed
through to the DOF stash and ultimately to dt_pid.c and eventually
dt_prov_uprobe.c: the end result is that the DOF for a given probe's
remappings ends up in the dt_uprobe_t in more or less the same form
as it was in the DOF.

After that things get tricky, because we want to remap not only arg[N] but
also argN references (the single existing test for USDT arg remapping
verifies that this works), but the SDT machinery depends on argN being
unremapped!  So we do the remapping in dt_prov_uprobe.c while reshuffling
things into dt_argdesc_t's, and tell the higher layers that no arg remapping
is ever being performed, then do the remapping in the trampoline by
physically reshuffling the arguments.  This seems to work without breaking
SDT on all supported architectures, and is surprisingly simple (at least, it
surprised me: multiple places where I thought I'd need hundreds of lines of
complex code turned out to need only three or four lines).

New tests are added to verify that USDT translators work when types change,
when arg counts change, and when there are no args at all, and that dtrace
-vln produces the right output (all previous tests for USDT -vln, translated
or not, are currently disabled because they all use wildcards: this new one
doesn't).

We also fix a couple of tiny error-related bugs encountered in the
course of development, one in usdt, one related to the print action.

Changes since v2:
  Populate dt_argdesc_t's in USDT probe discovery rather than in
  probe_info.

Changes since v1:
  Adapted to review comments (all comments but the stuff around
  trampolines and arg mapping, which I don't understand well
  enough to implement); in particular track xlated args and
  mappings together, and move from a flags word in the
  dof_parser struct's DIT_PROBE record to an arg count

Nick Alcock (6):
  error: add missing EDT_PRINT entry
  usdt: get arg types and xlations into DTrace from the DOF
  dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
  cg: add argument mapping in the trampoline
  usdt: typed args and arg mapping
  usdt: fix create_underlying error path

 dtprobed/dof_stash.c                          |  21 +--
 dtprobed/dtprobed.c                           |  10 +-
 include/dtrace/pid.h                          |   7 +
 libcommon/dof_parser.c                        | 150 ++++++++++++----
 libcommon/dof_parser.h                        |  64 ++++++-
 libdtrace/dt_cg.c                             |  36 +++-
 libdtrace/dt_cg.h                             |   1 +
 libdtrace/dt_error.c                          |   3 +-
 libdtrace/dt_pid.c                            |  60 +++++++
 libdtrace/dt_prov_uprobe.c                    | 168 +++++++++++++++++-
 test/triggers/usdt-tst-argmap-prov.d          |   5 +-
 test/triggers/usdt-tst-argmap.c               |   5 +-
 .../dtrace-util/tst.ListProbesArgsUSDT.r      |  34 ++++
 .../dtrace-util/tst.ListProbesArgsUSDT.r.p    |   2 +
 .../dtrace-util/tst.ListProbesArgsUSDT.sh     |  83 +++++++++
 test/unittest/usdt/err.argmap-null.d          |  40 +++++
 test/unittest/usdt/err.argmap-null.r          |   2 +
 test/unittest/usdt/err.argmap-null.r.p        |   2 +
 test/unittest/usdt/tst.argmap-null.d          |  32 ++++
 test/unittest/usdt/tst.argmap-typed-partial.d |  49 +++++
 test/unittest/usdt/tst.argmap-typed.d         |  48 +++++
 test/unittest/usdt/tst.argmap.d               |   3 +-
 test/utils/showUSDT.c                         |   5 +-
 23 files changed, 759 insertions(+), 71 deletions(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.r.p
 create mode 100755 test/unittest/dtrace-util/tst.ListProbesArgsUSDT.sh
 create mode 100644 test/unittest/usdt/err.argmap-null.d
 create mode 100644 test/unittest/usdt/err.argmap-null.r
 create mode 100755 test/unittest/usdt/err.argmap-null.r.p
 create mode 100644 test/unittest/usdt/tst.argmap-null.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed-partial.d
 create mode 100644 test/unittest/usdt/tst.argmap-typed.d


base-commit: 8a1264bf0e818c8624be250eb5174714b62ed93c
-- 
2.46.0.278.g36e3a12567

