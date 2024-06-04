Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA313DB83
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524042; cv=fail; b=oEvKQwKWxAwPW6TavpkVURITWWo8IybZk5369KRgEaiMOgJD6a/IarkHUf/rHTUhDkr/Lpqdw5fZUh0bZMSp0yFMBe1P8cIAvSwNQmxISSghacYuRkus4G8lXA/cOZ2vo8MXs2gT3A8e5D+iQhfvRVkvLgMGDaneYSdcDMfRkDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524042; c=relaxed/simple;
	bh=CcB0VN4YMe3Jmt3nMpm62ZfwC1BwiaJTOCM/1qUEbu8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qM/0Smct+SVei3Es8CpTxRYHN68rY5FRDgzjskzXtYmUrw9gmI85vtdFA/L9FPeURXxQefMfChdSTKIfl2qdSHNwtQFbxMI012YCWur5zoYJ/jpa8kbfzotq1sgK6zYNDnwWso3+udxJjATYH7TJJiF7rpv4BqHCVFQbjJKWmlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454Bmsfe005884
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:39 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3D6OtRSasXNsnRXEd?=
 =?UTF-8?Q?e8Ej4TTQ4o6Ppm65BfeGedIlheXA=3D;_b=3DMkWE6SBlAUNFm8+iT+TcGa2CnQ?=
 =?UTF-8?Q?r5By7xMu32ac8iejX4qtt1jKWm0XeQBFijISCq/oZf_MUcAhJLNppJJxGFHfLcP?=
 =?UTF-8?Q?4lCvOOiTxoDmN3J9J4lairTWfacgu3BJivryvBbKkAhkDjAe_x4VX9NGqv2dT8e?=
 =?UTF-8?Q?yUKpLXWpbJDEPj1hYQUjZmM2Cl58cEmMTqovp8prhSblbjmfBxLSos_FyjpiosY?=
 =?UTF-8?Q?XL4XaSgELmfmWZ8ewVArkoA12rIa9JM0BJ2SsBYQ1HRYhw0f1voAoj6SgIO5_xw?=
 =?UTF-8?Q?fBkkKNdgJKbA5VFeYD0Cio8H39blTOke2FfnTiiu5E1swkeTfHcYYuvLc6e83/X?=
 =?UTF-8?Q?bx8_3g=3D=3D_?=
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfuvvwjca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:39 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HPx2q015620
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:00:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrjcp974-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:00:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd3j5G5rwJfNnnODAKva1OCKQPC6NNELGx0YEHFMe6uhF7QgTmNzpYiFIU2YFX884h1juZKyu8Je7Jv6c9zbYl+TT7wFtdnBFvyxq9Tl6TnjB6Iey5veUKJ42v7f6QSHnu6cNN4ZsV1A444J5gYsug/goqCY/muMsmW9DkTog/65SS7ytZtvWuCyWZaRLFiNiPPGQ7gZ7iw+4KHfvvuU+AJaQ1hOg4cCZXaAnoD9ZkDkDh69D0nYnnXZ8j8vemhc9Iru7YYlc+mdMKUa70T1Wq8Vk1T/ekbzQ2nE/Oekql4AfbNV8WSOCci2ddex1RnOTDhm9u/v8rGwq7JP3xkHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OtRSasXNsnRXEde8Ej4TTQ4o6Ppm65BfeGedIlheXA=;
 b=M3iwYV2MVti9RcJHuqi9obaBWJ08zqfUHdnVm0ZFR8KtI3P7R7l7huiXJ5af2jzSkj2Zxze82n2pY+srOsHPhcR861nMuhmi2kUcLyby1O8T4GHm3pAfOzZ6Ujk56B3dFnUGCt0rlXr7B4uiMT88pZ0X4dEp5NG6TFsHPjv2ciz2w2njV1qdcr1FK2NQQWWK82fvz8F0OkowBoOW41daIyWqeeCwnrnkJaHC6Q7OkE60swwYX3GU7U6+XK9z7Fhtmu9NI7+CcsHqCrdK3nLSVhacFkLCWkUSP9xd1eEmiO07bmpT//IUsL0OOOTn8gh1DZhuZ1odIuXfrRzTd+IhBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OtRSasXNsnRXEde8Ej4TTQ4o6Ppm65BfeGedIlheXA=;
 b=o0ZC/1LKOUozTKkKl6sGKqU5BJHvP4AVRfWGHHz4AG465BEZerqLKpRatHr+BEpv11Z8FzQ6v8MGbtcK42T4Ioh+eimzHWVk7qhP388oXRXik1DklwevEcNZr0Ew1u1U4rnIPTFA1SomLfrfiljYe9mAzOEYslwDRRrHCFIdA/U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6574.namprd10.prod.outlook.com (2603:10b6:510:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 4 Jun
 2024 18:00:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:00:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 8/8] Turn some leading spaces into tabs
Date: Tue,  4 Jun 2024 14:00:08 -0400
Message-Id: <20240604180008.11331-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f19b32-6742-497e-b680-08dc84c03bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?exngMXnHNnRZ8JbzF4Xexkzs62B3JaaWK87dq87eY3Xzd/KyzcYE2WSZNg46?=
 =?us-ascii?Q?7XYhGX2yOW3ia1D76Ss6QDiuBH7d+twxw1r0+hwKZjAAjHyvh0CuWx/Lsong?=
 =?us-ascii?Q?XIXGRB5fDUgYRKgewea9Lg8DZ/vGHMZKXpRYFJcZyIyKmhNqiNRv7xBoF5Al?=
 =?us-ascii?Q?Kd15jUs+oULKempXi30nbGy+Xil5IK+/yJbx02fSlP2CXBXFL5NuFmqjqE+r?=
 =?us-ascii?Q?EIcRAG58qiO3hUTsVVWB5RHbcxaOGqZ4QPIiTokWvlGWy2Mm7qcwdcXILqkM?=
 =?us-ascii?Q?+m21ZpIRX+x6o0tsGTentmYkF8APHZUhT629QisepWjTU3sWl2ZZ4w/4mxiG?=
 =?us-ascii?Q?V+3YgNMzLD/6EJOVpXwisj0lQ5Lm1qzdJPst3nGQzt3F/x4UUzAio7zuo9nq?=
 =?us-ascii?Q?mCp/2Kb83jPF8tEkLax1sX2PCvxuz0hGMn1rTJ0mb4pndmcWeM+tQYUKvC3g?=
 =?us-ascii?Q?43y72QO0DKfkEiDGPS/uXISutkzaUUTuA6WYp3ncagVDqkvEH3792RVFE4Pz?=
 =?us-ascii?Q?TpgQM7LytyccNH2KV766FXc1pfQkO8JK+bk3fUuwFkQlX83RfNyoNkX/XM1t?=
 =?us-ascii?Q?0rjygHFrXonOz2PTqxVVrOjUm8fSTuHUQz+1dcoRnJgnuKQkT4XZdGhekMKF?=
 =?us-ascii?Q?VxIjbKSsOwxIu36108Zustih0/UYaXjtCIfoOLMhY8TwsuJetYnebGctyq0A?=
 =?us-ascii?Q?GX9cnZWnnhHxbwS3EuPpppvXzWQn/v77+UVIjNcSnnesl6Nic6wRinaqrsDU?=
 =?us-ascii?Q?akR7B/SfHS1cXnUxLbDCx+5uJLQ0gsV0hINmi2yhJFOmz8/FscmO3ZVsj+jN?=
 =?us-ascii?Q?PdAG+KV+nxtFV6ZfvqMpoOlgohVWfWImpZlTfFdmdBLSOuP26ddnJiF0m2rl?=
 =?us-ascii?Q?QuNMt63MP0LvtWvUfZsRaUDJziJ8yy3Zstd4p6tRbSAV/Rhbi+nm6+i97wqK?=
 =?us-ascii?Q?K3eVjIWIAS5Bzyp5hZAFUs85VK6CTjT/sASjppI20SgltgcQEgPB5wUKSAEn?=
 =?us-ascii?Q?Zd96eZgiUs3cK1h+tQeOyKmfvcYa4Rx4lyxOhkAbCCobqUmPYvhMcRg66GV2?=
 =?us-ascii?Q?DVjUPKRwwoFbnJ2jgfsXFrOy+jjIOSHr5ZD6zYg/tZCJKgWJ68HHMvNiOBFd?=
 =?us-ascii?Q?Fc10BNqgDjVz6HtWhngYrwlfZKQP7emGCi5WxqOJmD16hr8n9Vj2qySsYp3/?=
 =?us-ascii?Q?8hbxV51izgL/PbBQuRtixoBjXDM496aijPcjyFxPUpVr/KQJjLMbhuq+AnxD?=
 =?us-ascii?Q?Q44vPYZ8v+eHQYf6pOBsmiT7bJ0pJgSNh3psmzeBYu1iMhpdKf8EZAsSZFDT?=
 =?us-ascii?Q?fnNMREHnmCFgVAySpy7HB5WQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EQ96czMhnd4MkARxbnPXCUgVY4XtAE8V/5UCWiZ+hF01ccZSRqnvUtWCU7ZH?=
 =?us-ascii?Q?dlh3WETQm6MfRKKXPJgDMSMzG0vuOFcBRDu/AGwe162ioGB3yJ46czOnRDK+?=
 =?us-ascii?Q?AjkvKf9L7hn6/zSxKSgvSYTYGKhrXxjbUto9DPGnSmL8wPykH3AAytcEPhY0?=
 =?us-ascii?Q?gb1v3k50+qVNnkGgX5BoO+RjgbunZkPYnJbkgsoTi6VVJml1MvRUtr4DvcPA?=
 =?us-ascii?Q?zOyAnaPfvmY/X02rrYtDEtydFFqY9tzZ69eQ1awUVUk0sSR3viLk6snGocYO?=
 =?us-ascii?Q?G8Df412BxlxdwMzWv+PlZ59I7Bn3WSO0vczJWqHQsxu+EeMNcbpQSPkXMnet?=
 =?us-ascii?Q?zn+mMoyc3CKo7niabD9k+ZC2Vj0tqu8U7UIwuAEZA7AmasWLQz5JiOJ3SeKr?=
 =?us-ascii?Q?zkud1fAW88Wg+UMI+sAyVl1ksFc7yuMwiQ/r6Ji3lnxZm8z8XCmpjcZmEVms?=
 =?us-ascii?Q?+fcLIaWA4NnTB5n68m9IjLVOojjBwzbN2eWKz5VHa7/rhUkSaS4nkzn7j7C8?=
 =?us-ascii?Q?q67aKuC62u+/ADvbz1Yao6F5gzWgBN3feruzvUMYKV4o04IE0kc5Wo+OCYME?=
 =?us-ascii?Q?ZflSfNIa+ale+6cm0uAFfSgd+f5Mcd5rTUebawBJbe0ydnwnU/P19leAOT+X?=
 =?us-ascii?Q?BMgG8vJblOs4PZvgEOmLobSnEDYW3W08gmGU5UD/CCdfLfpVjGRInzoMrDDR?=
 =?us-ascii?Q?dS4gMjFiUBRNOUybg5BTeHMW7Q12GkYKQ8dkP0wWi4Og4aEWE4DlJoO+Lczn?=
 =?us-ascii?Q?pcY8VaMsIXQqsXIemQwIjDeRc29tx2G1N5zNikFYefill5Ifh6gTNccnu09p?=
 =?us-ascii?Q?aK71KuhsIjx2+87f2/ipK1naVf235BKTDUsnQsV8O2AAVpMCwMW8AzfUODKd?=
 =?us-ascii?Q?kRlDaNyymvXiAONpgphg6RTIKzhKp7UwOZzU/loK+AINwVHvwbmV7e/Z9bas?=
 =?us-ascii?Q?+yeF63ky2omf0UXQa4/W+waR7lGsK/BVLN+jJ6UdkSGX94q36tJ0Gdq7La9E?=
 =?us-ascii?Q?hN68BxM+6nw0pOTS8Rn9LEaxpVPjlzY6jHH2pRAi726WPHzHfVmGTLbaDnim?=
 =?us-ascii?Q?TkBvfn2VM2zV643aNCFDUQVLpldyeKOdHGrQYj3ScKrAnEKr5aqPJHwLhfwx?=
 =?us-ascii?Q?TjAX0dSjI/qFBXG4nM7ivWkwoaccD++53PrD1nqVr3YUpd/+PnMmJVROL0Ei?=
 =?us-ascii?Q?C3rzyAGEYsqS1cZqyxQfRiKL3IWb5VcAlNcbfoo5KwOgO9du1wmVdxtf02FG?=
 =?us-ascii?Q?sFa2qllgjjRs7cwC1MyMaYbMRRnXNvn6z/JcN0F2O02uIZtrvOjGbS1YbuAy?=
 =?us-ascii?Q?fWQWRJz8tl6Ki4g5I+kyG1mJRsLgMBx9CFTppcJIdqiH7z66mcybSlQfpkmS?=
 =?us-ascii?Q?+m3jeANTvap18PHG7cs0+g1ufToPHdia/cHtF/5ToYS0Jgkvlopmwhw2THxw?=
 =?us-ascii?Q?mJJpjw0608hKDZ7DwyL4EmDzDsbRI3GDWt1Exmy2RdhKzUEh8ixSccL/LuAJ?=
 =?us-ascii?Q?wAhXHvygfYlcJyHLfPLlvVpt6Ak0aRauI5yVAZkMAfa0Ji8M0b0YqdpAXeZI?=
 =?us-ascii?Q?wd0oXsYIrocxuMalgbpAixkcKcpjlaJ+4Zh8NGEc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	yMK+gV8etU256YwqDcA7MrLJ+rsrDmohciSv6bJMq7ZEjFIAETFGReXiPnLdH8MbrbHzZUyJJtsiVvJABIN7BDs0WtE6qLjTB+29keWbBR1srNgz3L1jXMmI2CCxiwBbxE5OO6cb50F6dv50brD6GhAQe2n7RiyChTXWiQqZRnxZxzE1MIv+8UZioHaOeRTQtHAnPopfCWi5g3jWF/xvLBYpaDA4SiJ1QXjMhbyGmNJ8Xpe33MTxtPQu24NN/sl2UFc0AibCTUn5lhl4SZ+/UZerjzWnEmogFaEVPpsw/WxwDl7hwKzwvtL9zWQU9KDu9vf4GbRlZALtJClYCUIQcOzkRWoRHfhsFL9GjQ3WBgGL8vEkB28DRZGbhK1ciwWV+0B34RHMJugP2E5JtQ1G9APELPZFq252uAQVWAh1iCkjIs/v7GEdSSs3ZJrNNpWwxm/Axve+UcaKJpd0P98wEwAkvOrB0Wks1wZGcaVZUHxpQwTWZuUrMdNl98NuKACPf+sAmuwDAqaKVk9buWdAUlSdKYABegp5TEXETCcpQZ6jy1naWssyAQfDpVpzf/OLtvyOj7F7o+Ljmytyv01+Oer/nbzHrphMswfZyD+pNug=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f19b32-6742-497e-b680-08dc84c03bbd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:00:35.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4goMuPM9OB/Kaau0T+H1HCK+TcewO9XPnsaatj9mXgvbAWhZ+8sGwWHcq8yHblFulLzTcoyLcRI3pCIb2paxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6574
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2406040144
X-Proofpoint-GUID: EKiDfRB2-iqFrqJFfeUcioviasDG6dqW
X-Proofpoint-ORIG-GUID: EKiDfRB2-iqFrqJFfeUcioviasDG6dqW

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c | 2 +-
 libdtrace/dt_pid.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index e1a09215..71c6a446 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1140,7 +1140,7 @@ dt_bpf_load_prog(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 
 		snprintf(msg, sizeof(msg),
 			 "BPF program load for '%s:%s:%s:%s' failed",
-		         pdp->prv, pdp->mod, pdp->fun, pdp->prb);
+			 pdp->prv, pdp->mod, pdp->fun, pdp->prb);
 		if (err == EPERM)
 			return dt_bpf_lockmem_error(dtp, msg);
 		dt_bpf_error(dtp, "%s: %s\n", msg,
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 02ed7511..7c7d7e30 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -905,7 +905,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 		provider = (dof_parsed_t *) p;
 		if (!validate_dof_record(path, provider, DIT_PROVIDER, dof_buf_size,
 					 seen_size))
-                        goto parse_err;
+			goto parse_err;
 
 		prv = provider->provider.name;
 
@@ -915,16 +915,16 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 		probe = (dof_parsed_t *) p;
 		if (!validate_dof_record(path, probe, DIT_PROBE, dof_buf_size,
 					 seen_size))
-                        goto parse_err;
+			goto parse_err;
 
-                mod = probe->probe.name;
+		mod = probe->probe.name;
 		fun = mod + strlen(mod) + 1;
 		prb = fun + strlen(fun) + 1;
 
 		p += probe->size;
 		seen_size += probe->size;
 
-                /*
+		/*
 		 * Now the parsed DOF for this probe's tracepoints.
 		 */
 		for (size_t j = 0; j < probe->probe.ntp; j++) {
-- 
2.18.4

