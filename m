Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344B220D4E1
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730835134; cv=fail; b=F9RKqZ/LK96OE5biVsZIpoN6aiWI17U8/4vrp2jKrsb8mB/y8g/sQV/MeR1Rj/65Suj5zjNKpcdxQyTGb94SD/aPFGzIIH9uq3sKLmCyKi+crz98HJ1ZvAmppXF6rkx/A+591UuZFzKWR97Jr8hkYTgZeWtGu0qnMsFS4OcLCmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730835134; c=relaxed/simple;
	bh=5zhUHuvf+pZCooqoqH37DoR1webDBt0bKgzl6smuztA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dJEwe+zp8SVEjB3nWzDPkX7XgiVONLrNp2ROMWGxitHbRQVxuQgxkCQMK2hrAGv+hUYoQ1vRzpwHutNa6wArwnfCuqZjf+UTSR9WnJj9Qs2IXiQGgCr/V3tJ794vW42O0BjGUtC6jtALhXWdXcH3qhtV1unnHibmhsdLhmhMJ2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mjMl1dkk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xruMLtth; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mjMl1dkk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xruMLtth"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5JQvCV030965;
	Tue, 5 Nov 2024 19:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=CS/0/OZcG7C5K0/Elw
	Hb6vWrDPQCuNcvG/LZdq0tYfs=; b=mjMl1dkkhGM+8Xt7Glj6jf8oGDU0bxHX0C
	86UfjtZcpm5OHxoZVVmETLxpHJe/RtDozlT0Cmznff50GQNavHwwuiMpyXRdkkWW
	34weyeT4h9FZKcbHYZLpP/sCAMOecR5khF/b5vrrUvnaYIp9CklB3fgG5d5Kb7h5
	YZUyzo1Vdg+4gQhNXVwGzDHigFMeaeSHbjSjAfV1VOB1pJg03u+cJNARsOEPcfJy
	v3T+od5BqrVGXwVIddn1V8MIX8vLNrWiFQie9RaSV1HhuY+o/80A52uXv4hzLw0q
	ubRLthYPYkhiUN2HQ3YQd58bKKdlAWp2EMwDdLzuokm2RS4EYiFQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nbpsp8gh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Nov 2024 19:32:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5IDS5s008413;
	Tue, 5 Nov 2024 19:32:08 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah7k6b3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 05 Nov 2024 19:32:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nsr9zvCrYLOzJCRAo8wQl0DqHZsCtj+O9Wy63lXiSck/VV3I5/9k+sA/pQN+FSUxeXPN8lPEP1sCqFH4KHE0qPBM4FUpqC9k/o2b5PrCMHXKAAwVIbZi7vc9XBcgZtU5NZNlXCZU9ZZLsVZ24mEFHnDX7FIbN6to+6saDdf/yXztGXZi9fXP3mmy59vs2pj2zWs89pUuaieI8m+65gwcdAMN+ijaEqA3H7qZRqmFbGrecFhV6oftZg9c9FKO1UAw2b4mL8kPG/2ufaZNXFPF2+m7R8WxWy6e7Re2EA9Oqe7tHwjL3HBMZpFLXFOysElH/k+eo6XL78PTfKyjCCRaYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CS/0/OZcG7C5K0/ElwHb6vWrDPQCuNcvG/LZdq0tYfs=;
 b=ZdtuM2atOGsHiTsa4r7IqiySI5DTFxnoAkEQ0EyHKhNWl0pB2G6KpwG8EP11eQ9qo8C8b0xk0wCh9o4Jo2bRtvaGF3UtM0X5+mpUPuJdCTPtZoBrktZ/QSQoYasppiI02m1mhJw4DvNAHrrFdgxcjWGlS2h00yS4NPAo/8A9rX06Mnm3ETadBt03MXO/YQ2Wrx++ZgTJG9imCAjUKecpOuvqTzsotmZxM9EFSASjNbhaGUHYzTUlc2G2sWVm3rFh34Kf3k34XPPJk5DybaEufnudTYk0RU9IO+UsZUEYGEcZoMLG3QjWxMwvSfrKFX4POVGjHXr/DLENp2cquKdPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CS/0/OZcG7C5K0/ElwHb6vWrDPQCuNcvG/LZdq0tYfs=;
 b=xruMLtthqRuyAUtXb33zsQoAjjaTv4cvta3rdx+iyPzRhLnSQus9xHs8UrLzu/0JoehMSkrRIZdl9VHgV211dTnYDGTcoHZ9Wj6K7tENkO/M3tRBT56628TBHe7DpUFRf5zYsRi/xK7J0i2K4UX7pERYW0Sij/WbiYWLPREQk3M=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB4864.namprd10.prod.outlook.com (2603:10b6:5:3a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 19:32:05 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8114.031; Tue, 5 Nov 2024
 19:32:05 +0000
Date: Tue, 5 Nov 2024 14:32:02 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH] build: mkdir man directories before installing to them
Message-ID: <ZypysvRLq1jLnnft@oracle.com>
References: <20241031174002.260385-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031174002.260385-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BYAPR21CA0015.namprd21.prod.outlook.com
 (2603:10b6:a03:114::25) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ef7eec-1c15-40a7-0b60-08dcfdd087e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RHuVJV7u0JEPDm1aPBzNOxnGUBbjh43j6rrZaeLebBoWHBrxipU0ocpfmX4A?=
 =?us-ascii?Q?zPopFS4j7u/S+EDa8wWlLW2yg6cHVPsdFOMfSjnDzkkNzQDiy8abmC9vvcWC?=
 =?us-ascii?Q?Nx+Yzm27seFYI4G7UlUx1Cfak0h18iJpnP2pIqm/Yu9yIgU6thdFtlK0/q+l?=
 =?us-ascii?Q?1cSCSiHOjm6e5UUT0tfMEiwAx2uqRtDiOYAY1k5jXkYiOMgbIjJGsUUls9mq?=
 =?us-ascii?Q?0xiSjipKA1SZ1r6nOqh6COgojT0Kc4v7fQzzVI2huKbdP4/J4xZZfMQvYwPJ?=
 =?us-ascii?Q?98nfnruy1rkujoJdVpjPG9RuI0aIAbI+JWpb7ecDUaWodQ5+6x8pwvWMl4wi?=
 =?us-ascii?Q?LbGWN0dhzuLgXhvcWOx+EgykO4ppVPhj5BXbPRi6nVRtzCzPuBwyIEVtiMsE?=
 =?us-ascii?Q?U6HWi5zKE8f0hNVMklSMPIF5U0ipisVKiaWf/+5z5tns8oybi/LWAwDl8uzL?=
 =?us-ascii?Q?2nusEUbK+FAaFgR8AqB6cZa7itu5j/hOHFEiktoPZzxHYUOs+JWxt+Kxr5VY?=
 =?us-ascii?Q?BIPU9QK9CPykgWq0s/apGhE3qGfptM03mouW+g08hhE3oSw3vayxUe4riXBN?=
 =?us-ascii?Q?jF0uMonq5Ad5YHBDVXQZA/AfW13r36lVspJz6FT3HXvS0+cq+hiWzCXseuis?=
 =?us-ascii?Q?uYlwOYGJi7gzFtDrH5bI6EZHar8Jr8OfRKxvAA9qg3z0XDm86SmNEGtWWY+7?=
 =?us-ascii?Q?4gRXlZELOdhhSQRr3hj64DYlSHHQoa0Zk4kvRL0KKHWeYkBPtl1MUHj96qKv?=
 =?us-ascii?Q?UCvYib7+AELAsYIQ6rgGqcnSGJgnl4ile2nw0XS8LN2sq7wepNKz2tlZmeTw?=
 =?us-ascii?Q?fGMBQQoWuNNE9c3vE18JxzK2OsrCexH8xmOdoHyNr3+cpviQfMWitVpENA8h?=
 =?us-ascii?Q?MYifnT/srmd3DFBGHVJAQjLhNgdTn6Byb3HcOQq33aItlD0QI9YEQV6UrP+z?=
 =?us-ascii?Q?BfMJDFFViPZECLyObxbdUdAF6/gAcT7LLECxmXbD27Cyu/UWXf3Ig7wf7O/P?=
 =?us-ascii?Q?G8sHfQp4a2/xkXN+EqkDNA0B2sjS6MTd6rXTqcmRTvWJsfSjtfmA2bou638L?=
 =?us-ascii?Q?Yf8SHzrP8qHjC0kWpunpq/MmgOmRHR2gbVBX7hQBBL5X8jTj2eqBQj1pXxEZ?=
 =?us-ascii?Q?rGjZnScHv9FUFgWhEdzL9Hjht2dlURDs88YRlPQAENSQ/W5L0OyuTd1ERhb0?=
 =?us-ascii?Q?fq3QNBT+wFbnnekQSlGd9No6hcap6Gemj+M17xh+S+QOd0D7+/wGwYiEfMAD?=
 =?us-ascii?Q?dbb2GJuxD2GdFAtCeRQL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RyGwG7HJAqNxXBP+J8z1fG02B7JnoxkTCbopWeEgYSOvhRFBzgb0PROOqT3M?=
 =?us-ascii?Q?IHvdbnRdbE8mA/2QQFEGbNv1BJ3T+7M/116S7ckvINbzE/MssKP8EvxTADJ/?=
 =?us-ascii?Q?/HD1MJWwFE25Wv3dnjSMDmV5ZAPuNwnmlBoMZxMRDJ2QWexwZWl1ZSN5KC6h?=
 =?us-ascii?Q?TN3xM0BYoKLleuUoY9+XGk9mgQHNZvHsPZyx3Kk9zsmidjRrQndxlw7W/DTW?=
 =?us-ascii?Q?pMItuPTm36HgKEJL8xI0iTVYykArJVQAl7/GGDYSzQEzgpYLIvlIquCUwB5R?=
 =?us-ascii?Q?PNspdArKRw8h/YssAsy8STkPLiUyINjza2bkFBPPWGh/jfa0YAOhvYhSnKvR?=
 =?us-ascii?Q?BoL0Sh6c8LvG68+IXfwSvr2JsfUNxPDKgqqY6IssihXq5iDcZpqRwMXTTUyA?=
 =?us-ascii?Q?v/rVzVG0dGQ3PCGPU8MBKjisD81BH7RveH/xWY9qYtzV2ojrp4CGH039zmpM?=
 =?us-ascii?Q?ur0Z4wvifKGYzIl31DyZWLDSz5A7+UtNvM1yYEdNxXKEGtblxoxmsd288rZj?=
 =?us-ascii?Q?PjIuQ7ksa7PAeasQ9EXN9O95nff//+XC7ehkAqZPuajAeXR3aPJSwXKrxqpo?=
 =?us-ascii?Q?2KNr8mx8D57OS8FlTK48dAcCaA6BWWDAfhsK14V1vZ8XDIBsqCZu03XeJcFE?=
 =?us-ascii?Q?BqVEG4qCScnuuw4/Krd/9Dfh9NLo4qIzD71Ki+M8NZj5jv6VPXIh3FD6pWaA?=
 =?us-ascii?Q?1LFml63Da4sW8mPfy24aqzUGiiMzp9matJdjOc8epXUWwitcW9pYGOC3BEze?=
 =?us-ascii?Q?DboqZgC/rh767udCxabhOKXBBkgQNJzruf2g2PoH8CoQEvyIl59coOCV2Sq1?=
 =?us-ascii?Q?aiLmmNKepVPMZE15rDpUM1v83ncMot3IT6Uyknl/KscX9z+lSuaLHY9AIkV8?=
 =?us-ascii?Q?dqJZvvhQkG0Nnt3ieHri1987T1V2Odx4TZknr6dk+YIMGcAudC31s82hrT/r?=
 =?us-ascii?Q?jk332pQ0M1H4Rg4BkIz53Qv8HQp10GF400pNjGipwZfI9FCkhW9c1BmTRMPZ?=
 =?us-ascii?Q?lb37eiYnkGIYBOcU+A/JsVEfixEm2KKcnoxNOaMPxnLRkp9AFV68ueBTKmQs?=
 =?us-ascii?Q?eKgqPKkQfSda/G+XUfEXtK/qys50G3o6KyjxOGpwDM9t5gTri32111QZiUx3?=
 =?us-ascii?Q?29wNivPvEVdYV7TmPXjsaGrJkAr3Cixbi7XuJ4n8K+IOXhRifFmz1IKh5GGi?=
 =?us-ascii?Q?DJfX6yptyoBb3BrvEwRl+slQNCh3aV1Ytw9JKOjxhVK8i59PXseg9VS7FdPa?=
 =?us-ascii?Q?Gip7yvHO7GZ+CGPSDk1i/dzGA5WaueMx0SITD9ehg6x/oLnWvXTCkhUAbKMQ?=
 =?us-ascii?Q?hDmUuno0PmfchfrkFyF2YjrxlKTjXCvl3QpgaMfqojgYpHjZplHfoNEm9RAf?=
 =?us-ascii?Q?sA7jJ0aBtAqkWma8k4hXVUYkFImtW6h/f9Y6P73S4TgWK0xg0Clfk5PUKhrz?=
 =?us-ascii?Q?8PDFl7/CR+UuVyI1dhcmAi5W1U4392arYktPujLRxdDhYdRMeb3aHEOx1Sn/?=
 =?us-ascii?Q?KPwi8ReC5jIzQwWzNQH/CxR4P3+SyYNiyI42gyyYsUX0adghG7+JTP27dUoM?=
 =?us-ascii?Q?26K9/3m///Pxb5QLUuAHL5Papu9QPBG2Bl9mfIhHrNTGWWbD1++A/ClHmiYq?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ONU9E3j3XECUtkvwKZsIYRtM/J6k7hMrzBT1imr9PyBzBy+ID957mtblB5TBnpR8qZSGx2b9BKqYJ+mt6RqFP7rmYSKgTXMWm6pZZDIBFu6Cii1F+G8MSrs33P8t6NaF9Ibcj2bWFlUHfMjR6xwD78PzeSL1PehY3P0PCiMOMooAtny54Puc8nyV4Jq97upePhVh5kyZOp3Ne45yvHWc8wN5D5YC6NaHKc1aJ6IfPyK06z1lZhugQ6UALO3oOOHDcm+airYzyzseGeQw/MEIkf5sXak6orB4ldnNd8Ja475w5vhqb9KrfQ1+WfZYN5XhYmhZ1402pH3n5CRGwIYZLYsmFT7BCCopIJyCg6v0LCZaM71rewH05BouBtL3gnxzerbbjFRGz1tDW4LzkBJBsWHPMB8PVC4jtl9l/usPtxiKRCaYh9ED++bZKOGvcNI/U9i+X7eOlcH8fcDmIuoenekW9uERJu/XjEHSSJMH6q7Z74kIt6NtK7fMO0CZEHV0x3N5/tHZFhHqSK+Doqdp4nS4LLu8jzORPk6u6c7huRbT3t8Fouoizud1gahof7m10IWw5BszzpgwpYJqbOcPk+ZADtAE7WikqXAhEHbdQQs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ef7eec-1c15-40a7-0b60-08dcfdd087e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 19:32:05.5499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Y+Y2C0PpYYJfmtB8csOt+B4ug1zATqNVzJqt63YVP57vUhwEuDRQvCzQ4toqIYQTmqDrtKuRz7BqsyIUX0reAjwk9CqQdAub1tDbRKkZMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050150
X-Proofpoint-ORIG-GUID: Hh7sYgBpdt7WjSFodqiUOdcSh6K_9tZH
X-Proofpoint-GUID: Hh7sYgBpdt7WjSFodqiUOdcSh6K_9tZH

On Thu, Oct 31, 2024 at 05:40:02PM +0000, Nick Alcock wrote:
> You need this for DESTDIR installs.
> 
> Bug: https://github.com/oracle/dtrace-utils/issues/106
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/Build      | 2 +-
>  dtprobed/Build | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/cmd/Build b/cmd/Build
> index 38a538c1e3c9..98d0ebd7e5c9 100644
> --- a/cmd/Build
> +++ b/cmd/Build
> @@ -50,7 +50,7 @@ fi\n"
>  
>  
>  install::
> -	mkdir -p $(INSTBINDIR) $(INSTSBINDIR) $(INSTMANDIR) \
> +	mkdir -p $(INSTBINDIR) $(INSTSBINDIR) $(INSTMANDIR)/man8 \
>  	      $(INSTLIBDIR)/dtrace
>  	$(call describe-install-target,$(INSTSBINDIR),dtrace)
>  	install -m 755 $(objdir)/dtrace $(INSTSBINDIR)
> diff --git a/dtprobed/Build b/dtprobed/Build
> index 7d98ddf836c3..c43b62778381 100644
> --- a/dtprobed/Build
> +++ b/dtprobed/Build
> @@ -57,6 +57,7 @@ install::
>  	mkdir -p $(INSTSBINDIR)
>  	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
>  	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
> +	mkdir -p $(INSTMANDIR)/man8
>  	$(call describe-install-target,$(INSTMANDIR),dtprobed.8)
>  	install -m 644 $(dtprobed_DIR)/dtprobed.8 $(INSTMANDIR)/man8
>  	mkdir -p $(INSTUDEVDIR)
> 
> base-commit: 33bf8650bcfef147d464e8eecb66d552313f84b8
> -- 
> 2.46.0.278.g36e3a12567
> 
