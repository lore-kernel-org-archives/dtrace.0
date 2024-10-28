Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB47F1DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150344; cv=fail; b=bIPDiDmpH5rG2C70dyLHXYDpMgj5vtd6eWGDC+24o73KpYN6+HmEPz+ZFuNWVHc6pcCMHA+So09P0rXdKwWj4GXB33mwb2NW0459XPRCUZJBt6euA+xDsAvQ0YdJq43rZSJwRPZb8H1PFR8RsMKBjdPnTI8NGYZCxvfbaRA6bRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150344; c=relaxed/simple;
	bh=tGGlN+4c+2xkKGV5wucOU3tqAF4aCqwJPC/wPWhzdxs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tqMWCLNVq+ykqfCNSvkctRJjLHFMtep1LqmDW511/MejkzQVOdKFyS8QkJGapqsmjheKfFvg3IYhtsofnGP764KchPFfiRuGBLE3T8DqroeSqW7ev9j89yUtLXnd42z0OS51vyuc7lAZSk2uWc+NBDTyCf2Gh/k7vL37/76WCws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gGA5Vvm4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l3Rn4Ck8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gGA5Vvm4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l3Rn4Ck8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtbaO031955
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=2WRh/Xpp3agaUMJ7NeYLZAq9d6qAw1RoixL0AYamnqA=; b=
	gGA5Vvm4WWGH6k6U1L1ec173KQV8CaNc2/rlNM2bS7d+QRIz+ASTp9zVW/KOpd4s
	YgP585g6GQh88Us762KO/xsaKkGZffyk4FmRdgvXO2FEZD8G/We1ngPQMOUbYvdQ
	zEg9c2+cL1Kkg5dcKSTHwL6KXpHmYeySCxVMdp8dzUcHkhT+XawtXqd74EzaYJ2d
	mLm3RLNPf2XFI6M32C4GY1RGhTah4D6M1pQ5/WG0raozJn/WuD9M0PZWK5n8UWrl
	fXkM31fBGGg+sdca3h6MBCYDHojvr4SrxIeqp2vgQ43VD3vPMdR3QcZ0nqw5SZi4
	ksQhW52xsLZd9nGspp7Ksg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8v0x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SK25LJ004804
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2t7gs9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXY+uIR0njQYxmcB+mBZjsofzfwcBlH9Wvg187kyKIOETqg13/HmBPDJP79AvI6h0/hzJi+9fpCESn51Lt7snTYbIOH5LeUYHX6tqIvD6essU0ep3h0l79uZJeU+9nOPQIEGi2yFoOUIeiLtKWfuoZDhIKDfYtPTqToOptVut16DZ52Veo8qbvC5/495q3JZVe6UirJAU/hvzs+XBlgS+Zpaug0ATKwzV5aVE5zJuQ6/DaWg5wWFf9hkbQ3uhxaeLCmv80klW7nvGHmop9CZw4K5SrYH9Tj1BRvTEllK/f6qgKF/H2LoLLYB2fLmdwoxBjbhtjOrYeMxnU0jf4d6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WRh/Xpp3agaUMJ7NeYLZAq9d6qAw1RoixL0AYamnqA=;
 b=tQFy7Ley5p11BdmuOAnlXpozkdO3A3iz9fSj8U6I05a22YcqpS23/freSLU42NuH9KwgZDMXYy2EeYSPXtM9YUfbpSMnguXLTSAEUGjU7fgt4DViNeycqSjWInRr/jJa6gOOJ5NzvgvNdK+IASOTUtg+UKLXXmczhaHcho9yeijQ8Q0kYNtnZ0nLKKpqvk+qAP2Z3gBeNXv4R/SwFRcsVuSN40VItJtLzjg9rseEClHPuTDlbki/kUSeT411kWtZSfkcwcBSM8NrBkRKmvlYh/RbZOjQNZNvJd45mp7eB9GA4Y1r1bCFOdytuphbaTCdWBHQeJTUZfCpAsUqFskmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WRh/Xpp3agaUMJ7NeYLZAq9d6qAw1RoixL0AYamnqA=;
 b=l3Rn4Ck8sbelTkXigBl7Ygi1lD8bBehrRmMDgkx8y5IuglxwPExcO5HJl0rD9JxX0V4JRSNSFQ6QsYjW3kMzcgzao6tvp7GRn2BzASsNWSjzv+Y/GSSe3KLanBPqdrxeFvMdMKckrZeqr4Y5ts8HxsJivt003UvmGbwAPF1Q+3w=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:18:56 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:18:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/6] usdt: get arg types and xlations into DTrace from the DOF
Date: Mon, 28 Oct 2024 21:18:45 +0000
Message-ID: <20241028211849.458862-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211849.458862-1-nick.alcock@oracle.com>
References: <20241028211849.458862-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::23) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c0a53b-351b-49dc-87f4-08dcf79621e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wLQ/CSyq9I1aWg07KI6cy7RKAkOycBzy9+5+pj5ooa1OidGzaX+zcBceQhLC?=
 =?us-ascii?Q?Vo63zy8I97NxepsK/+ZgB/REnzIXoQug5lZ2h0kItYevnl0TUNEpgIWf8G7P?=
 =?us-ascii?Q?IeXu/Ne9jGBndbSuHnCgCYQzziCdV71d5pm8JqizvWEe4ivswufjrnUetTlT?=
 =?us-ascii?Q?ShufCZmIcy55SDKyaW0RL4g8fvPY1Y3WnaRvfVblNGQ5PL+rD2pU1LSm12nr?=
 =?us-ascii?Q?qyMugCNXbIqeI2eUTRq3HMe54l1BMHJHCn1yZ5pOPc8HMtTf024u+wVyWxvj?=
 =?us-ascii?Q?TL5hcxZaj/SmMSS2Fr52Brnr670HZ0ixm4rgudfvyxMD1YkeO9xvzlf2FGsG?=
 =?us-ascii?Q?ZH71L6Y8RCxlOAnkvzCTcEkX2pwSOOiA2q2hRB5X4+O2FlKATRR6x9xIqEKZ?=
 =?us-ascii?Q?aitCApJrMUOIRS5w1KOHLxA0f2XpymXVx7hRbbk3QN+qbbvcoLeR9LLjGnp5?=
 =?us-ascii?Q?zTqTx0qyZDNn7aRXcMU/9BNTIpAIgy6MyoevBM2HDVC2bPYiYpxUgVxAVrRy?=
 =?us-ascii?Q?r8URGL11ybsP5VIXuqoWT+uG/sWqjBg1JJOMLJINdAYAOc5TCLLgbQL/9paW?=
 =?us-ascii?Q?IGd69LVzbNuUpIkXetrGRS4KhEW3fWTGgo2YhpIM9WXD7qVrq6+sb/UseLkP?=
 =?us-ascii?Q?/mHoMft5SiAd7hciU4XRvUv+80UmW+WXJZyGzghE4mXaDsVU1fA4D0LFeMpm?=
 =?us-ascii?Q?No9kyb3hoxvycHmosFbBEgvcs0UnLRxXWvdfazhnL3SSG0j7PcWAB6TwdO5r?=
 =?us-ascii?Q?qhmitO94wKqXffd6eXisO0go8pBPO/cuBhTwtHExR9khkbaRP6VBPOAfOThk?=
 =?us-ascii?Q?pKEbXYdWJD+WGGcvMC2mCimdwGV1t8uGiUJS4XdikHjTDzunAkXfezWHn67j?=
 =?us-ascii?Q?G00qOmOiG3ZhOhxt7Esmdi7LPr7hXfjDy3HzPhxCBPF/nJ3MIH/fQ7oTzQDY?=
 =?us-ascii?Q?zdzwmdUmYCSzVS4AHI409uon9q56zLI2wKbUlnPztJTQ/D7CYozkMjqA3w6+?=
 =?us-ascii?Q?6VH2rS90Cy8rt+XD1brBb1HzdzNmIbNtt3gphbxg2Rio2mMX79SxFJQJpW2a?=
 =?us-ascii?Q?sVFiHLDSoHmXuXEAab3A49glQSSa+6waieEWFtN5gX4cbs94Fsk1ttVxEbFC?=
 =?us-ascii?Q?Ui7tseE6q/5aL9MmGO0nzYMXpptINjRCV6qYtvoL898jisNIFTnbT5zuOiTF?=
 =?us-ascii?Q?7dbjCUxaWS45+8PuYKno08YQ9YtnlK5jQMyG21/x621mQtZ76mJJ0rc3r/yc?=
 =?us-ascii?Q?8X3VO+WXxYeTmprr3POr65RWsaMrxiuUyMrfuMoA83J5FK20DfRGos/AHiSg?=
 =?us-ascii?Q?IV5haujG0OMxIjB4kiIFyzzR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mM0RZyPJSqclCueLasrgL9HnzONZod3haMG/QxZdSjWs/hI39Jc/a3udLb09?=
 =?us-ascii?Q?ecjBcHw0SlN6FaJhq2U91tFUcEnm1Fv6WnGLeMQG4WRXeFysNQ5R38VHxMHw?=
 =?us-ascii?Q?gHcxDh3hDZfDprLh9A74q+990t/gknhRr8NEqfQ7bxiTpS5vjKri21sjzLwT?=
 =?us-ascii?Q?1jcl0V2tgi5uUQ70KG971CzGf+8gr4LyB7rwzUbVTHHpAT0BJQ/sgjSZkswq?=
 =?us-ascii?Q?isdh7VLbGKao2O6trODjVS1MgRrO6LV+gcWDUJTefT07XneoSJ5KIbaFOFxA?=
 =?us-ascii?Q?BzCM1Bc0nvh1CM8MPVAUHlfZaZUV4GvIhc4tgsx3BxI5Gnx2HMqLZHqk3eVf?=
 =?us-ascii?Q?gQb1jgdPWN+XRUK68/R3CK4zyk1PhmhRSF1pc8qdC6Y7MV03o3FgEL/b2c/R?=
 =?us-ascii?Q?pITffqQj2CHk5YlRUfOTy/X2lbcJL6VKfYYAFyNNF8xom6+aPjbjhBNRNXBg?=
 =?us-ascii?Q?R5H8Y7LAk2X9x+t1n+LPe6PeNuEYmBUv21PU4UmZiR+Y6OeuBR4q97Ap1cIV?=
 =?us-ascii?Q?ZaZHGCL5W6Lj7Gv35kyhKm8nvPm5kL7FpUk3FqM1Pj3/G2pKy20I8B1fM0QB?=
 =?us-ascii?Q?zdRug2XKju0juRi7bshMWkjhJOVBfQT5FwXrJA0NF2FgALQibAW4Jutuo9Dd?=
 =?us-ascii?Q?XgD3PMNRpSAHGP4Bql67alOLVLxETp4nSmFfJYhd1lMmzRs5/VrNaJ/3QNo+?=
 =?us-ascii?Q?P34xUM2KMS5ZqkX15nc6aO6NXmBPd/V9It+jTVSN1gzVdrqa4zQDk0TChwqS?=
 =?us-ascii?Q?AOmPYjWLtcSIwEapT3hkO3uqpXbVYuBNaQ6lS2lqn1jMAGQBo0QqSxrYPoU5?=
 =?us-ascii?Q?A1FhGuEyTkrkjRzRs6XBjxc+25G3p+j8xLMIjc5Qvwj3VEhTWtOa+sOc0yL+?=
 =?us-ascii?Q?kpVTrXHIwmQtrRCFpbZN2CY/4Hb2koN6fKkZNdWvWHyqE3vZ33/y1TP4gHwo?=
 =?us-ascii?Q?xtVIuZ3YrOPjwzSecqVrOqFCjSk1QSJZec3xzriOQKRgs4kiHhfYTA86rAp6?=
 =?us-ascii?Q?aPL62hpDLaO8HLIAhoZ8hj+BvLLO8Bfl7Ulfx/hDmIUYpTwnMdDIXeyVoY9l?=
 =?us-ascii?Q?TcMhd35o6W2BX7oXxdVEWZTimAVQMhnGQ863SAb6dwPfvGvAzZZhHkwIeRmV?=
 =?us-ascii?Q?UctdbO8BIDzTRspU2yj3qTYUXMeRKGbnh1SJqvBrQfUxGA4n4wF8EmquxrXf?=
 =?us-ascii?Q?nyc5USfHzg/pAFtUlxazG1YVvaSYLSozUED+wOQ6awGhRT+xFvCKn8oGuxYl?=
 =?us-ascii?Q?kvshzgsT4qQEWmsT523Gd+f5QmHZF6NeMficSlq5AiOXmqQ3vrWtlth2fMNT?=
 =?us-ascii?Q?ex1suX/NiyRc4+hc5fIfxxq5LIb/AV9CfbtMZPzHyZZqJ4oqj6YT2PiDAkuk?=
 =?us-ascii?Q?LKULkiydr7AcYiXleyV4/AOZOwcQcSnFwenTfBWevxUAsEjKTk7ihjhCsdXX?=
 =?us-ascii?Q?lMmb/LG9lS0Uu2J8Hd99A5azmKZdvTvPTW/Gh0wy1SbgofFBdOI8TdNOonNW?=
 =?us-ascii?Q?8P/J3Y/ijyHzrcs1yifL+QGjHjuKKwMyLWDRsm9+PF1D1Egc1uevRNmyMVPG?=
 =?us-ascii?Q?o3qE6sBd1Vu39k7isFq6SBBkINSk8rmID1hHXnk7RmDm06/nR2QazWKN+NWI?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZcADAz5TXwlQtAozRtXWzNqTMD3ICRN39Uq6ZX+SSijVm1D8aFJyaXDZM8rqutc7aau/MfJS2UO/rC/ga/XdOPPYIGy5X/XLbF5+v6m2DPRuIESlP10C/jVjbaN86sUEg4z4LDv/4x3CVXQ3VgVyPm9i/HYrMD4py1nw/R7r1x9lkHIuyuAbq73MLCGWQeQFxUV3N1SkqYUwPsMF9JRtmoUh775n+4xNONYfVLUlBK6kHQAncbwT973WxtL+gGO2Wq05XdysAezbhhb473yQIhHdpABVneTzWf4/YEZz+/L5WoDaSy51bO5N7vfZjKgmnRRVSDtffCBkJv1PdDzOShc1ZsWKUPnwJ0xH+rKAJMtUHnzLVwc3BaFBKF6YNxPfVxwlIpnsW9lRIiCBTLE19pCohS7y2nnhyel17Xut5Rz6irbq/rd8fT1/xvqFt2s90NT7+adQ5ny9LaXa5bOEuAIiImJlDiXIgHo4wRFaF6lbAWIosfuqOc7aPa/5QVnyFwVNgTke27a0yf9FGV0o9uExa8cszrNH7vOPKu/2+ospkChDwo6vfaZ06h1NDcInzNLdIK/NJvXfh9Zdu9gGO5WPGL+whNl5/81giJiJa/U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c0a53b-351b-49dc-87f4-08dcf79621e8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:18:56.7561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sK0SP2tI53yXfSi8hHlusULgFCQx0RTzR9EBLRrxTPfmAqcn/rmh3pIxd5oeJES1kYRSmBiJXfNcwid9DRQg7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-GUID: rvIFYzuJXw2bokO1OrpF1pNrzgmuNNlv
X-Proofpoint-ORIG-GUID: rvIFYzuJXw2bokO1OrpF1pNrzgmuNNlv

This change propagates native and xlated arg types and remapping info all
the way from the DOF, through the parser and dtprobed and the DOF stash,
into DTrace, where they end up in the pid_probespec_t for USDT probes.
We don't do anything with them once they get there in this commit: no
user-visible impacts expected.

We bump the DOF_PARSED_VERSION since we add three new types of record to the
dof_parser_t, all optional, covering native and xlated args and arg mapping
tables; to make life easier for consumers we emit them in a defined order
(documented in dof_parser.h), and add arg counts to the DIT_PROBE record
that precedes them indicating which will be present and how many args are in
them.  This means we retain the property that you can always tell which
records within a provider are coming next purely from records you already
have: there's no need to make decisions once the records turn up.  The DOF
stash hardly changes: all that happens is that the parsed data written to
each per-probe file gains some extra types of record (it can have
DIT_ARGS_NATIVE, DIT_ARGS_XLAT and DIT_ARGS_MAP entries following the
DIT_PROBE record now).

As usual with DOF_PARSED_VERSION bumps, DTraces that cross this change will
refuse to read probes added by dtprobeds that are on the other side of it.
(Restarting dtprobed will reparse all the probes in the stash to match the
new layout, and newly-started DTraces will pick that up -- so this only
affects running DTraces picking up new probes, which DTrace cannot do yet:
so no visible effects are expected.)

The code is a bit repetitive, with nargs, xargs and arg mapping all handled
separately even though the code is very similar.  In future maybe we could
unify them (but my attempts led to code that was much harder to read than
the original).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtprobed/dof_stash.c   |  15 +++--
 dtprobed/dtprobed.c    |  10 ++-
 include/dtrace/pid.h   |   7 ++
 libcommon/dof_parser.c | 145 +++++++++++++++++++++++++++++++----------
 libcommon/dof_parser.h |  64 ++++++++++++++++--
 libdtrace/dt_pid.c     |  59 +++++++++++++++++
 6 files changed, 253 insertions(+), 47 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 0e639076f655..8bf465678217 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -59,8 +59,10 @@
  *    startup if the dof_parsed_t structure changed.  The file consists of a
  *    uint64_t version number (DOF_PARSED_VERSION), then a stream of
  *    dof_parsed_t records, the first of type DIT_PROVIDER, the second
- *    DIT_PROBE, then as many struct dof_parsed_t's of type DIT_TRACEPOINT as
- *    the DIT_PROBE record specifies.
+ *    DIT_PROBE, then optionally some DIT_*ARGS records (if the count of native
+ *    args in the probe is >0, you get a DIT_NATIVE_ARGS: if the count of xlated
+ *    args is >0, you get DIT_XLAT_ARGS and DIT_MAP_ARGS), then as many struct
+ *    dof_parsed_t's of type DIT_TRACEPOINT as the DIT_PROBE record specifies.
  *
  * /run/dtrace/probes/: Per-probe info, written by dtprobed, read by DTrace.
  *
@@ -640,9 +642,14 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			break;
 		}
 
-		/* Tracepoint: add to already-open file.  */
+		/* Args info or tracepoint: add to already-open file.  */
+		case DIT_ARGS_NATIVE:
+		case DIT_ARGS_XLAT:
+		case DIT_ARGS_MAP:
 		case DIT_TRACEPOINT:
-			assert(state == DIT_PROBE || state == DIT_TRACEPOINT);
+			assert(state == DIT_PROBE || state == DIT_ARGS_NATIVE ||
+			       state == DIT_ARGS_XLAT || state == DIT_ARGS_MAP ||
+			       state == DIT_TRACEPOINT);
 			state = accump->parsed->type;
 
 			if (write_chunk(parsed_fd, accump->parsed, accump->parsed->size) < 0)
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index fdcdee14f851..cdb08a65205e 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -795,16 +795,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 		if (dof_stash_push_parsed(&accum, probe) < 0)
 			goto oom;
 
-		for (j = 0; j < probe->probe.ntp; j++) {
+		j = 0;
+		do {
 			dof_parsed_t *tp = dof_read(pid, in);
 
 			errmsg = "no tracepoints in a probe, or parse state corrupt";
-			if (!tp || tp->type != DIT_TRACEPOINT)
+			if (!tp || tp->type == DIT_PROVIDER || tp->type == DIT_PROBE)
 				goto err;
 
 			if (dof_stash_push_parsed(&accum, tp) < 0)
 				goto oom;
-		}
+
+			if (tp->type == DIT_TRACEPOINT)
+				j++;
+		} while (j < probe->probe.ntp);
 	}
 
 	if (!reparsing)
diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 0129674adf0c..8eb8a1708d04 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -35,6 +35,13 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
+	int pps_nargc;				/* number of native args */
+	int pps_xargc;				/* number of xlated and remapped args */
+	char *pps_nargv;			/* array of native args */
+	size_t pps_nargvlen;			/* (high estimate of) length of array */
+	char *pps_xargv;			/* array of xlated args */
+	size_t pps_xargvlen;			/* (high estimate of) length of array */
+	int8_t *pps_argmap;			/* remapped arg indexes */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index d6631a1afdcb..b234246b7c3c 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -879,12 +879,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	return 0;
 }
 
+static size_t
+strings_len(const char *strtab, size_t count)
+{
+	size_t len = 0;
+
+	for (; count > 0; count--) {
+		size_t this_len = strlen(strtab) + 1;
+
+		len += this_len;
+		strtab += this_len;
+	}
+	return len;
+}
+
 static void
 emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 {
 	int		i;
-	dof_parsed_t	*probe_msg;
-	size_t		probe_msg_size;
+	dof_parsed_t	*msg;
+	size_t		msg_size;
 	char		*ptr;
 
 	dt_dbg_dof("      Creating probe %s:%s:%s:%s\n", dhpb->dthpb_prov,
@@ -893,35 +907,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	if (validate_probe(out, dhpb) != 0)
 		return;
 
-	probe_msg_size = offsetof(dof_parsed_t, probe.name) +
-	    strlen(dhpb->dthpb_mod) + 1 + strlen(dhpb->dthpb_func) + 1 +
-	    strlen(dhpb->dthpb_name) + 1;
+	/*
+	 * Compute the size of all the optional elements first, to fill out the
+	 * flags.
+	 */
 
-	probe_msg = malloc(probe_msg_size);
-	if (!probe_msg) {
-		dof_error(out, ENOMEM, "Out of memory allocating probe");
-		return;
-	}
+	msg_size = offsetof(dof_parsed_t, probe.name) +
+		   strlen(dhpb->dthpb_mod) + 1 +
+		   strlen(dhpb->dthpb_func) + 1 +
+		   strlen(dhpb->dthpb_name) + 1;
 
-	memset(probe_msg, 0, probe_msg_size);
+	msg = malloc(msg_size);
+	if (!msg)
+		goto oom;
 
-	probe_msg->size = probe_msg_size;
-	probe_msg->type = DIT_PROBE;
-	probe_msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
-	ptr = stpcpy(probe_msg->probe.name, dhpb->dthpb_mod);
+	memset(msg, 0, msg_size);
+
+	msg->size = msg_size;
+	msg->type = DIT_PROBE;
+	msg->probe.ntp = dhpb->dthpb_noffs + dhpb->dthpb_nenoffs;
+	msg->probe.nargc = dhpb->dthpb_nargc;
+	msg->probe.xargc = dhpb->dthpb_xargc;
+
+	ptr = stpcpy(msg->probe.name, dhpb->dthpb_mod);
 	ptr++;
 	ptr = stpcpy(ptr, dhpb->dthpb_func);
 	ptr++;
 	strcpy(ptr, dhpb->dthpb_name);
-	dof_parser_write_one(out, probe_msg, probe_msg_size);
+	dof_parser_write_one(out, msg, msg_size);
 
-	free(probe_msg);
+	free(msg);
 
-	/* XXX TODO translated args
-	   pp->ftp_nargs = dhpb->dthpb_xargc;
-	   pp->ftp_xtypes = dhpb->dthpb_xtypes;
-	   pp->ftp_ntypes = dhpb->dthpb_ntypes;
-	*/
+	/*
+	 * Emit info on all native and translated args in turn.
+	 *
+	 * FIXME: this code is a bit repetitious.
+	 *
+	 * First native args (if any).
+	 */
+
+	if (dhpb->dthpb_nargc > 0) {
+		size_t	nargs_size;
+
+		nargs_size = strings_len(dhpb->dthpb_ntypes, dhpb->dthpb_nargc);
+		msg_size = offsetof(dof_parsed_t, nargs.args) + nargs_size;
+
+		msg = malloc(msg_size);
+		if (!msg)
+			goto oom;
+
+		memset(msg, 0, msg_size);
+
+		msg->size = msg_size;
+		msg->type = DIT_ARGS_NATIVE;
+		memcpy(msg->nargs.args, dhpb->dthpb_ntypes, nargs_size);
+		dof_parser_write_one(out, msg, msg_size);
+
+		free(msg);
+
+		/* Then translated args. */
+
+		if (dhpb->dthpb_xargc > 0) {
+			size_t	xargs_size, map_size;
+
+			xargs_size = strings_len(dhpb->dthpb_xtypes,
+						 dhpb->dthpb_xargc);
+			msg_size = offsetof(dof_parsed_t, xargs.args) +
+				   xargs_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_XLAT;
+			memcpy(msg->xargs.args, dhpb->dthpb_xtypes, xargs_size);
+			dof_parser_write_one(out, msg, msg_size);
+
+			free(msg);
+
+			/* Then the remapping table. */
+
+			map_size = dhpb->dthpb_xargc * sizeof(int8_t);
+			msg_size = offsetof(dof_parsed_t, argmap.argmap) +
+				   map_size;
+
+			msg = malloc(msg_size);
+			if (!msg)
+				goto oom;
+
+			memset(msg, 0, msg_size);
+
+			msg->size = msg_size;
+			msg->type = DIT_ARGS_MAP;
+			memcpy(msg->argmap.argmap, dhpb->dthpb_args, map_size);
+			dof_parser_write_one(out, msg, msg_size);
+			free(msg);
+		}
+	}
 
 	/*
 	 * Emit info on each tracepoint in turn.
@@ -938,18 +1023,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
 	for (i = 0; i < dhpb->dthpb_nenoffs; i++)
 		emit_tp(out, dhpb->dthpb_base, dhpb->dthpb_enoffs[i], 1);
 
-	/*
-	 * XXX later:
-	 * If the arguments are shuffled around we set the argument remapping
-	 * table. Later, when the probe fires, we only remap the arguments
-	 * if the table is non-NULL.
-	 *
-	for (i = 0; i < dhpb->dthpb_xargc; i++) {
-		if (dhpb->dthpb_args[i] != i) {
-			pp->ftp_argmap = dhpb->dthpb_args;
-			break;
-		}
-	} */
+	return;
+ oom:
+	dof_error(out, ENOMEM, "Out of memory allocating %zi bytes for probe",
+		  msg_size);
 }
 
 static void
diff --git a/libcommon/dof_parser.h b/libcommon/dof_parser.h
index d3a6836f15fd..8f42d00551e3 100644
--- a/libcommon/dof_parser.h
+++ b/libcommon/dof_parser.h
@@ -15,10 +15,19 @@
 #include <dtrace/helpers.h>
 
 /*
- * Result of DOF probe parsing.  We receive a provider info structure, followed
- * by N probe info structures each of which is followed by possibly many
- * tracepoint info structures, all tagged.  Things not yet used for probe
- * creation (like args, translated types, etc) are not returned.
+ * Result of DOF probe parsing.  The order of elements in the parsed stream
+ * is:
+ *
+ * DIT_PROVIDER (at least 1, which contains...)
+ *   DIT_PROBE (at least 1, each of which has...)
+ *     DIT_ARGS_NATIVE (1, optional)
+ *     DIT_ARGS_XLAT (1, optional)
+ *     DIT_ARGS_MAP (1, optional)
+ *     DIT_TRACEPOINT (any number >= 1)
+ *
+ * The dof_parsed.provider.flags word indicates the presence of the
+ * various optional args records in the following stream (you can rely on
+ * them if it simplifies things, but you don't have to).
  *
  * On error, a DIT_ERR structure is returned with an error message.
  */
@@ -27,7 +36,10 @@ typedef enum dof_parsed_info {
 	DIT_PROVIDER = 0,
 	DIT_PROBE = 1,
 	DIT_TRACEPOINT = 2,
-	DIT_ERR = 3
+	DIT_ERR = 3,
+	DIT_ARGS_NATIVE = 4,
+	DIT_ARGS_XLAT = 5,
+	DIT_ARGS_MAP = 6,
 } dof_parsed_info_t;
 
 /*
@@ -37,7 +49,7 @@ typedef enum dof_parsed_info {
  * start which is the version of the dof_parseds within it.  The data flowing
  * over the stream from the seccomped parser has no such prefix.
  */
-#define DOF_PARSED_VERSION 1
+#define DOF_PARSED_VERSION 2
 
 typedef struct dof_parsed {
 	/*
@@ -59,18 +71,58 @@ typedef struct dof_parsed {
 			 */
 			char name[1];
 		} provider;
+
 		struct dpi_probe_info {
 			/*
 			 * Number of tracepoints that follow.
 			 */
 			size_t ntp;
 
+			/*
+			 * Number of native arguments that follow (if > 0, a
+			 * DIT_ARGS_NATIVE will be received).
+			 */
+			size_t nargc;
+
+			/*
+			 * Number of xlated arguments that follow (if > 0, a
+			 * DIT_ARGS_XLAT and DIT_ARGS_MAP will be received).
+			 */
+			size_t xargc;
+
 			/*
 			 * Probe module, function, and name (\0-separated).
 			 */
 			char name[1];
 		} probe;
 
+		/* V2+ only.  */
+		struct dpi_probe_args_native_info {
+			/*
+			 * Array of native args.  nargc in length.
+			 */
+			char args[1];
+		} nargs;
+
+		/* V2+ only.  */
+		struct dpi_probe_args_xlat_info {
+			/*
+			 * Array of translated args.  xargc in length.
+			 */
+			char args[1];
+		} xargs;
+
+		/*
+		 * V2+ only.
+		 */
+		struct dpi_probe_args_map_info {
+			/*
+			 * Mapping from native arg index to xlated arg index.
+			 * xargc in length.
+			 */
+			int8_t argmap[1];
+		} argmap;
+
 		struct dpi_tracepoint_info {
 			/*
 			 * Offset of this tracepoint.
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 62060b5921b6..e4dc5368897d 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -866,6 +866,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		uint64_t *dof_version;
 		char *prv, *mod, *fun, *prb;
 		dof_parsed_t *provider, *probe;
+		ssize_t nargvlen = 0, xargvlen = 0;
+		char *nargv = NULL, *xargv = NULL;
+		int8_t *argmap = NULL;
 
 		/*
 		 * Regular files only: in particular, skip . and ..,
@@ -917,6 +920,47 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 		p += probe->size;
 		seen_size += probe->size;
 
+		/*
+		 * Assume the order given in dof_parser.h, for simplicity.
+		 */
+		if (probe->probe.nargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_NATIVE,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			nargv = args->nargs.args;
+			nargvlen = args->size - offsetof(dof_parsed_t, nargs.args);
+			assert(nargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+		}
+		if (probe->probe.xargc > 0) {
+			dof_parsed_t *args = (dof_parsed_t *) p;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_XLAT,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			xargv = args->xargs.args;
+			xargvlen = args->size - offsetof(dof_parsed_t, xargs.args);
+			assert(xargvlen >= 0);
+
+			p += args->size;
+			seen_size += args->size;
+
+			if (!validate_dof_record(path, args, DIT_ARGS_MAP,
+						 dof_buf_size, seen_size))
+				goto parse_err;
+
+			argmap = args->argmap.argmap;
+
+			p += args->size;
+			seen_size += args->size;
+		}
+
 		/*
 		 * Now the parsed DOF for this probe's tracepoints.
 		 */
@@ -967,6 +1011,21 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, dt_proc_t *dpr,
 			psp.pps_off = tp->tracepoint.addr - pmp->pr_file->first_segment->pr_vaddr;
 			psp.pps_nameoff = 0;
 
+			if (nargv) {
+				psp.pps_nargc = probe->probe.nargc;
+				psp.pps_nargvlen = nargvlen;
+				psp.pps_nargv = nargv;
+			}
+
+			if (xargv) {
+				psp.pps_xargc = probe->probe.xargc;
+				psp.pps_xargvlen = xargvlen;
+				psp.pps_xargv = xargv;
+			}
+
+			if (argmap)
+				psp.pps_argmap = argmap;
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
-- 
2.46.0.278.g36e3a12567

