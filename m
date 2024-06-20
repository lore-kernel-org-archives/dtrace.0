Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA31B0115
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718906127; cv=fail; b=LfcPs/NSNlMz6McCxhOmguWC/J4HUSJXwtVoQfdZ4imVnuXup+vdx+wwfbiXq214SHiftFGY/JFoJJ8NMoh6G8A/GPfS4aFWrart1mqu5E++GLpA6hHHwNmAzUTVtN1dbQoxh66Q+T5h0SNkoT01TcAC/hFjiiS7h4UcgpCswZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718906127; c=relaxed/simple;
	bh=1/xFtSgLUpHpbIX9NUIqLlruHSafyYk6CEOtv52RoUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nPlzNbeMdhx880fRa/O7Sd4kT9D6bQ3U5OEt4eALKKHBOJ6vedDZn6F5ZRUIgTHKLXY2k8s8N1RX2x/zRc6YDxuroboYOq5E3BX4XT8jIvhmvnpo8Km+GRJODPilURwGycDaz4FV/WoBHt+sROY/ObwonhheTHiUDrnoQ+kLd6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JSoxAtTT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DPDPnSCv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JSoxAtTT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DPDPnSCv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHAhg5015010
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:55:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=BnJFIUuRSVE0aGn
	Po7ZOnm85/WE/D6LauIIK/edeQM0=; b=JSoxAtTTVMWvQ0goBEvlM2F4ytOWEAG
	F7bJT93+77m+WvGSKn5YmByVGNTeGu2zYKAF39pEUHDMU4jLDk9ySsde7B+nX6c5
	o1AxsjUnDOSG2/xLXxS2A87OtQaZPLHathuW7W+pd3kgW5973j+m1qScHkGxWYGE
	Ci0hnTO5B81qLoLwm3sNvVmKfva4a/DqrM4lpUJSw6r5rTyalfC2503nnnDl8Jxd
	6Fb6GsvfwIXoIHXb5QSap+/TOOvThBaz+Jk0VjDDp4mfiGMWITepI1oX1pybqU4a
	6f/M3kTHN/lKBnoLjAFmGShctP8byzrM2n41d7Pr0IQezkpnLvhwTTQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yvrka02pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:55:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45KHE5PD025429
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:55:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yvrn51j3p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Jun 2024 17:55:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Owuzyq+vPHgaUbJ41ircF9EbEKO9o+KndOAgJ/kdgQeSNYZS52Mmp4Gh05UPGiZh+HOH1VlT30v/Wlt6BtZGk1bOtrtpbCRWaPrxGswT3lcoTz8Zk8Ahf/8/v+b8YxLwYqDnFuEOwSy0IJbAaxCj+ESEIzP95+YBx8ycTAzl1aDlkePksmS8zPc0HTGw7wH3eeRqBt/fAygANjJfRq3iwOhtooA8jw0rlXy+saSGpHmh050416Jrvb9AiGZ0MjEVs5WTWoIwC/wdkHhOzUMnNc1IaVGLP5/Y8SPRg5DI6rrNo+WQxhUZ1jmRS0vQnE2hBPQ/9sEFlFchFTOTSCY6Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnJFIUuRSVE0aGnPo7ZOnm85/WE/D6LauIIK/edeQM0=;
 b=Dvqha/iqu44qd2Kq4x11DKUJjj9sIDEQLgDWFAS+tx3ykg6xL1u6q0BHxF+twPAAtJXTyp0z430+wa3E3IJm5cMBLyXqjs72PbPdqwUH4DDcheLQLBURKEcDZxt5U0erKNYoV7iYL0vYY70lj36rGtHLj1iMTUKOrfB7d7/KctshvnaImlgwjMbE2LLP0+V1c1kqo9cS+8vGWAXkZGG0gU3lc6EmuOHeA/B+0PH8kfLBUJ1XMqIegjhRP/oQ3MFonPItvy2E9MqNiRviCVMotvTGBQztiwUk+YdkdihDbt75PWAFTChrKWqJuoLO7fn1fpbYWjEGQ45INmwBQBAUog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnJFIUuRSVE0aGnPo7ZOnm85/WE/D6LauIIK/edeQM0=;
 b=DPDPnSCv7OQIceo4bcOrBYuV288ukCOGgvmjY8CO5Z5UFb1PLUF8X1aMeNp4/92/V2UNe1+K/XxJysjonyTQ2XAGhmHlXmO0bINnUwkHnRaT5m9btWrYZWyomayortIpr/hHWh6yng8t2wJ+WAoh8IzDiI3/0v83TivtrayJ3q8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA1PR10MB6028.namprd10.prod.outlook.com (2603:10b6:208:388::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 17:55:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 17:55:20 +0000
Date: Thu, 20 Jun 2024 13:55:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v3] translators: support 6.10
Message-ID: <ZnRtAmWKoPKcpVtY@oracle.com>
References: <20240607184155.316904-1-nick.alcock@oracle.com>
 <20240619132109.5566-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619132109.5566-1-nick.alcock@oracle.com>
X-ClientProxiedBy: LO4P123CA0323.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA1PR10MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c9b01c-8d3a-4ffe-8b32-08dc91522683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?baSxopI2mCzree3GUrSOh2DrHeYxNUsUrod8aWt7SImrzKmUH47iyWFq1pkw?=
 =?us-ascii?Q?02xp1bqdfKgR0bBnH0ULmgb2ibuSKUOKYicBXaUVP9qDtkGKtPqIg/XaThvD?=
 =?us-ascii?Q?jMCxuxCuUxbLeqpYzY7xBGZ4pdze6jIDELnpq93MgF4913ghiMegY7DIi86U?=
 =?us-ascii?Q?Fwtuvhd7iYsp5/Riqz9N0yOvtq/IssMmBZUPSEtn8mF8KAP5wexA5zcAKzWW?=
 =?us-ascii?Q?SGsq87Yt9Y6nKqfREaWyuQPUUQo8f17bfI+5Ta9YkPw2A/kYlyPPoM1DQsk8?=
 =?us-ascii?Q?zo4IFiIQCk0ypyDy7kgI2stdccQvGQPttu7o0nTIi6OigzZIvlC9C+KQD47n?=
 =?us-ascii?Q?TG9d6GfGPuVjRPKQfBBpdgifqAvfv7JsTwDholv1uOh9BjcxgkvZSAXkRghZ?=
 =?us-ascii?Q?Zsyrtyam2ZMEEZykpAP2pPOL0HAqrwLaJvCY+HZpvK7A4nu1bByqcIZhjMf5?=
 =?us-ascii?Q?kx/xYBrpAq2VGCkDweadSGWWM4b1PMPy3AQrvuRw5UohRCM8EnMxN5Y626n6?=
 =?us-ascii?Q?45WypzjfnqqgCnruYlq8wCc0gDpJ8Odwq9UWS6A80ot1s10TG4mmM+1AIpJa?=
 =?us-ascii?Q?gFDcJvW9lzvkzWDxR92dWh+Vabu+pp3qyHzKXPEX/Z9RppZbfnaOybJgcpj1?=
 =?us-ascii?Q?7e9g+MUA84Ll0l+IZVH/FgxJZUQKJoZKmspJU6g9QeC2K2yT/CRarYNcG7sL?=
 =?us-ascii?Q?4+CO/7MRGq5r/JquqBzY5BoUJJVZ7YGV+LSrx4Awc6hHUONgB1n8rC1S4ryA?=
 =?us-ascii?Q?+p/QcL51iTCJLktr34D2SLPnE6qhs99SXp7ngIc9QCm9qlznYbLB7npGENAC?=
 =?us-ascii?Q?a7NoM9LmgaeyZtXARLIST8HwsLrM+YcgHOvhzzI0P+5U6eNm+Aqq1ZjWZsfR?=
 =?us-ascii?Q?w0YrDY6ngNFZNNMxis/vG/P2jzB4hmAKeMQib1m+rB5AGuXPxOyrF4QfKKur?=
 =?us-ascii?Q?gd3t4mIcJroxOdoHvS2ygfq9/tocr1F99YW3mD0u8KxNRsqOGVS3e4VjaYXy?=
 =?us-ascii?Q?3VCcrIb5pfECv3MvBCPDHpW8SAs6O4+1yOll/AtZ+tQmYhCOllwN5TgWyZW8?=
 =?us-ascii?Q?KUcd2ZYEQrJc3SCqLY5nF2hwO/RudaFE/m4SEqbRfvGlr6atn7NTU0Kpv5Lx?=
 =?us-ascii?Q?dOcxr9teobNaWBwdj48vVeNVgpaIY8rNpk53Ft3Sc2EZxB2AgCBx/0dTMxFA?=
 =?us-ascii?Q?0+46cHfjDid55lY2Y7WFchnNyvUW3Bj8ko8le0NmvKb9KQOKEoFwC/xyBaCv?=
 =?us-ascii?Q?OQKu8NtmL6YLDel/x3v9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vdHg+s8FYER0SIJ1wGT2pSnfpaTGFV2Xfsm+GpvBTBCB9GQWugJoJKx8It4D?=
 =?us-ascii?Q?xmudpWiXhWzawzqdyTbfrGzuuITM/voNqMkceEgqONk6AeCKv+BR44oE9Hgx?=
 =?us-ascii?Q?xO9F0FH3zdByituhQK0strO9noNv9onUexuxN0qYcC3LUK4mhh+yARG1Dcaa?=
 =?us-ascii?Q?gBBcNkINY2vzmt88ADxj4F0qQZ3sMYH8emih0KaEb8hMF3mj/V78cqRjk9Ik?=
 =?us-ascii?Q?A+kyezunH9DLFHb5fRSTFVM7uo4fcedMOPHCD9sTHebSpc6+tvMGrby2fgi7?=
 =?us-ascii?Q?LRcT/4cYIGkKLK+iLMfWmiy+fx4p/mw1dQmnp1gDbXqI4VerFppNC0t+1R4g?=
 =?us-ascii?Q?Nno8KPrn9lj9aMsLYfzjKiD8EQ37kDWgw/eeQNpsQqPIjG9Xl2S6L7Uvvjv8?=
 =?us-ascii?Q?ydMz/xi59Lkc430pNjx5bCIuU7Kb8EED+T3gEPRfWRPZMX8UTdoNKp4zrLkS?=
 =?us-ascii?Q?Re9h1DdY9q0eFOEPoVS/lsU6sNf9TT+pUFxHqnEAnAe4do6gige7efhFuPZS?=
 =?us-ascii?Q?PmDRoHwkcJFWTpNhw+UmbgWjJ860aY8Z5kivxhyRA/kmWDC++kRusn/ur8MU?=
 =?us-ascii?Q?KCPCrDa/3u6VGzMTMp9uvQ9D2gzoU3lyEETBQXuCuvAliBUUfQsThoLHc6YR?=
 =?us-ascii?Q?VHpmM2Z2dOJhO4Me+w7qV/0chTtvg5sAXZFbHE4oej9A/2T1Eg47r/SfNCyj?=
 =?us-ascii?Q?rA/nC8W7HEMxeT3uhLYuzcRj/ZqFy4l3xLws6TJ6+EyEJznLDjaemd6oKN98?=
 =?us-ascii?Q?uCHswzR9JH9Saa7MlC9zKgCql3BWb88HquwsUatG3T2+y1I2zrjxxH3u0fQ+?=
 =?us-ascii?Q?P6G+X8oVMelZRQdz229gpUSJS8w82rGUH0Rnwmlnqgc3vj6qlmCulKbpbqZT?=
 =?us-ascii?Q?T8UlkFlTuQtJMsQ9z7OLG/HVUfH+2bzcIkHAfJeADl6PVJTDyTCwZGUopYG0?=
 =?us-ascii?Q?UYC3COPz66ArzlYIbZpPlp2VyS8dzntUxl6MSgzIQVi5GsRtVnMgtgJN5VuN?=
 =?us-ascii?Q?8vF7K15XtGbZy0EGFPZIwN96CPN2NGU8+t323os6kqHSni71iKwtI/KpRy1g?=
 =?us-ascii?Q?F0d+yNNpDduLKXUk1QxYJub0h8+N6H42DsypFiXgFq684p6P/IJpDxGkiv6F?=
 =?us-ascii?Q?PkpC8BMEOZv1pAe4Y/AuOn81skR6Fy1GNjDTmFrB86dlJ8fye2sRLMZ1hGqP?=
 =?us-ascii?Q?9RNOaijHpU0D8htt6049cyLDoKQRTWOU1/C5kFhT4lgATDh989k3NQ8KxqX9?=
 =?us-ascii?Q?i1h/axzC7T7WkUK5yNxgTPknRthYyDTViP0PJF5ybdFPtxX8RqZbMbtRU6f6?=
 =?us-ascii?Q?XtB105PKjm+9eDNLCXVO882eI+ba9IyieWLHRBQn8or7VaSHQVa6ycjKW+Q3?=
 =?us-ascii?Q?QJlEbPPm74N9uL5iFNd0Cc5oFP43IcrW2B1wqk/bYgQ0Qts9c5E/SlpFgfp2?=
 =?us-ascii?Q?4zkQg1IVB9FVxDTT2PsMFXXsJ/Kl5xBBSIrLyG7VqWzptust2CFEtesOoI92?=
 =?us-ascii?Q?p8/ClVQDEtsDOf7lZKj//veg21J/xYRiXfDIUZ7Yq4WWbBlhLzKSE6CokhCh?=
 =?us-ascii?Q?EZfe3i2XATqtIHYrchAnDkKEVb9//dXW3jsm94okshdqADRUD9c9GFYgaUcT?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	/5vfHs7CHcuZzzdcOKhSFH++GDz85/ySM65otjaSo6YkfkXBheh/r5ow52e5HJoKejop2waZap8lb2wPT01CjJYz6do7qO+lMs3ksJLAQ3ICYM66fI207xEUftGsdIjEwI+0m4aYr+I6kVeTjsfg40DL8EDyzLPuHHfAgDMLO9HrURE3jdubaqLt8QLAzQqqhig1zecgs2w66Q7kN4zGkGx8VGgEJ1oyrars0DxuVcf/HOZTRSJRrrDMgrmntPoFEXa9VcCrsBMIbMCrZxZLDrkJ3wvzLaNZTan1cdfpCMoaAeDdYCmYlv37slikasQ70LZeY9wy7XGDnhMKwIn/TpD5Q3t68F69guHcraxvK76OMSegHe7cFvZLmH3FMenNSqHPBl4mUyumFKSjcV7F9gu/Fb3im5ZH9YGfZbk6QxqcmOEHL/l+eM3nOv1kVOnAdnXKu73tv9eTF56TtpJ2hNQpKtrRCMIJBEV0YU8rUMCcKthEYcDnJzX6U0V0u/NfObiCg2yo2Hwq1OqtnQ1GPvTashcs193SQDtv67GxoOxixTDLy8DIE/HQgPKJVy+Hyg3lZeVFFCwVuTbyXscQAfJvbtx4aNKZmL6guv+95rk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c9b01c-8d3a-4ffe-8b32-08dc91522683
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 17:55:20.0204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYrJEQfm1m08R0SsJoqBdg2taVBHPEfLiYk4S5CwOSnaerdwOY87EVqnPPy2AX9SWOifW1tUKj/1s8LtjsB2efjMvW0Fx0iWyg7nPCvo/RQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6028
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406200129
X-Proofpoint-GUID: wQcD0o6qZ4ir8XwNsugPqfQu3liMHpHj
X-Proofpoint-ORIG-GUID: wQcD0o6qZ4ir8XwNsugPqfQu3liMHpHj

On Wed, Jun 19, 2024 at 02:21:09PM +0100, Nick Alcock wrote:
> This changed the block device into a component of an atomic
> flags word (so we need to change the .d.in as well to pull in
> the relevant #define for the blockdev portion of that flags word).
> 
> See kernel commit 1116b9fa15c09748ae05d2365a305fa22671eb1e.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/io.d.in | 6 +++---
>  libdtrace/io.m4   | 8 ++++++--
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
> index b3da517778264..f44f53f092dce 100644
> --- a/libdtrace/io.d.in
> +++ b/libdtrace/io.d.in
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2012, 2023, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2012, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -69,7 +69,7 @@ inline int REQ_SYNC = REQ_SYNC_VAL;
>  define_for_kernel([[__bi_rw]], [[(m4_kver(4,8,0), [[bi_opf]])]], [[bi_rw]])
>  define_for_kernel([[__disk]], [[(m4_kver(5,12,0), [[bi_bdev->bd_disk]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev->bd_disk]])
>  define_for_kernel([[__disk_chk]], [[(m4_kver(5,12,0), [[bi_bdev]]), (m4_kver(4,14,0), [[bi_disk]])]], [[bi_bdev]])
> -define_for_kernel([[__bio_partno]], [[(m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
> +define_for_kernel([[__bio_partno]], [[(m4_kver(6,10,0), [[bi_bdev->__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,12,0), [[bi_bdev->bd_partno]]), (m4_kver(4,14,0), [[bi_partno]])]], [[bi_bdev->bd_part->partno]])
>  define_for_kernel([[__bio_part_dev]], [[(m4_kver(5,12,0), [[bi_bdev->bd_dev]]), (m4_kver(5,11,0), [[bi_disk->part_tbl->part[B->bi_partno]->bd_dev]]), (m4_kver(4,14,0), [[bi_disk->part_tbl->part[B->bi_partno]->__dev.devt]])]], [[bi_bdev->bd_part->__dev.devt]])
>  
>  #pragma D binding "1.6.3" translator
> @@ -98,7 +98,7 @@ typedef struct devinfo {
>  } devinfo_t;
>  
>  define_for_kernel([[__bh_bdev_dev]], [[(m4_kver(5,11,0), [[b_bdev->bd_disk->part0->bd_device]])]], [[b_bdev->bd_disk->part0.__dev]])
> -define_for_kernel([[__bdev_partno]], [[(m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
> +define_for_kernel([[__bdev_partno]], [[(m4_kver(6,10,0), [[__bd_flags.counter & BD_PARTNO]]), (m4_kver(5,11,0), [[bd_partno]])]], [[bd_part->partno]])
>  #pragma D binding "1.0" translator
>  translator devinfo_t < struct buffer_head *B > {
>  	dev_major = getmajor(B->b_bdev->bd_dev);
> diff --git a/libdtrace/io.m4 b/libdtrace/io.m4
> index e837ef65b86f7..d57225c911059 100644
> --- a/libdtrace/io.m4
> +++ b/libdtrace/io.m4
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2005, 2013, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -11,7 +11,8 @@
>   * to replace those tokens with their values to create the finished io.d.
>   */
>  
> -/* #include <linux/buffer_head.h> */
> +#include <linux/kconfig.h>
> +#include <linux/buffer_head.h>
>  #include <sys/file.h>
>  #if 0
>  #ifndef __USE_UNIX98
> @@ -43,4 +44,7 @@ DEF_REPLACE(O_NOFOLLOW)
>  DEF_REPLACE(O_CLOEXEC)
>  DEF_REPLACE(O_DSYNC)
>  DEF_REPLACE(O_RSYNC)
> +#ifdef BD_PARTNO
> +DEF_REPLACE(BD_PARTNO)
> +#endif
>  #include "io.platform.m4"
> 
> base-commit: 454c6d47bf408415f7eb52ea701779f041aa6957
> -- 
> 2.45.1.275.g567cb0950c
