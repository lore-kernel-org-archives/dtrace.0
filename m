Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BE8171A7
	for <dtrace@lists.linux.dev>; Sun,  8 Dec 2024 00:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733617756; cv=fail; b=P2COMQQQWSjveohVfpHamabzpGvP+DvgC83jDheKnUAfLPMPKiMzmSF3wNxBiZ6V51HqY5JJT3rETBINcQTlKktiYu3MVTmqazBbhvMPQVi5+0jILWT3FddEtKR7lJlddrjFVvvmlo5JdE3g9FlLjuzRMUT+Xq2Ui+lpJoIkl/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733617756; c=relaxed/simple;
	bh=IRsA26fCI474F2xLC+zOKDcYztY9omDLZZsasRl79cg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qc0v/oNXjFqj8nKccc0cLtdcc9A/KHG2dA+lLobuWu33JDFp6DbyinCdHCDj1PE+YdCGZ4EHWMuhS49ApNsttzulWVapDPxhiAX67Yma/YDb+0GzRuTnsx1+b9aHCRB0FBfWxTelaFaqHSlcMUEQSX8fg/HmRBbaCpVRvUKF/70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DtEW1sa8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YdAyM4v9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DtEW1sa8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YdAyM4v9"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7NSx1O016281
	for <dtrace@lists.linux.dev>; Sun, 8 Dec 2024 00:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=SWN4RNtko9v7+eO+HN
	dv4JPgFw5NmGAkyMsKAt1cyLw=; b=DtEW1sa83D52qpzQsP+JJIqjgOOEVuHdFr
	zxtCUgfZLVZaBANXPh8LIJYrIQfFg1K6lo+WpOEChQzMgxodQAx/p+NwhYxmOI48
	252FlbKKD6ONVB7oUieJGn9SJedNlb2rtLfLyha2eFrlAyi9j1uhMFHddcV9YM+s
	1CVdBA7Z8zK9Hsw3O1QI1ylp8bfd3maoBX+Ldi5Y3isOQryneiF6Jf6+GviMdt9i
	bEytoOyLkWnYjY6acqiq4ungffUZW829J5jXbKf9/q24RwpTWDDvH4MXJNgp83dc
	6MIZdtdjoD1bE46b/xyg0ATBj6JoHYi6p81qYbCbFEG7WAY+cjIA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43cdyss1sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Dec 2024 00:29:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B7LWqp8019260
	for <dtrace@lists.linux.dev>; Sun, 8 Dec 2024 00:29:11 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cct62vj9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 08 Dec 2024 00:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrLgj5uxTXHDm7HVSyz2TDCfOfnksTDz+HwP6dcPi7nIJ7s9SAyNtoVB7dSPhA49cw9yWaf2eHDoYAZZbUeWMtUDM8WWkUUUTRa7HfJVKpcRuplCHjXdFC/cRGNAkA+JBogEmoguPqCvoVY3YxOaP0bXe6WYuGq5jeBlV8n7mDd1jfnlgANuuWNEBSI+j87Ub4S5N+nRxV1g9boO4vKsc9enlXPinvHpgW2kFkkJDZh5eJuQs7caMfVINDG4cNAVT9v01rZ8Z1txnZ4ltin1cbjjCSciDx60psU4SfHlu/0JOT5cBNHB55CvopAxZIB1kwntWjVY+EPfM309EiuR7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWN4RNtko9v7+eO+HNdv4JPgFw5NmGAkyMsKAt1cyLw=;
 b=XSO/E1lpcJg+osnT6KMs1uZ3Fa6JSJWsNUE9fvuLkpM/fEcA/ie1niBHQIQ4zxp86c1H1B05bTw3vbSsTvtuwWAyQwhkP9iDnodH7DDSfesm0c8Um4f5hNpEws/URAuDXlY6mxD8D8jLTXLnf9ViCdtqBM7kGc3jTR5eujsd8xTUCZ5vfCdfi9duWo2uZl8USYGKbNGabZXvaI7eODW1Yvxxq9Qc7+A4wUBCJLUbFIOEHQEHy2jENhza5TnMJFIbXBNoUsUqpaEhv+OGkbrCL9QuTAco3Q/W3kpjTVPmUEJUAYrlbTDoLsxF9WJCIGmBN8VL1Gc6vO3/fNsaZ3F/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWN4RNtko9v7+eO+HNdv4JPgFw5NmGAkyMsKAt1cyLw=;
 b=YdAyM4v9VxGnhWmYwNkWTNlaWTY50XOWi/W73cGS7omN276qewwEBB/13XrvprQWTOhux3ViU1E3KQSOAMjQ7HGDqr7dyUZiwGJ8qJU71fUaPa8wAFZ65MQzoMEGUrI2IL/J8x+spaK2j08lnXOMyl137ZrLqZ3AbWj1kKdAym8=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DM4PR10MB6253.namprd10.prod.outlook.com (2603:10b6:8:b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Sun, 8 Dec
 2024 00:29:08 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Sun, 8 Dec 2024
 00:29:08 +0000
Date: Sat, 7 Dec 2024 19:29:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Clean up tst.errno2.d
Message-ID: <Z1ToUrUEtcy5otS5@oracle.com>
References: <20241204065152.2899-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204065152.2899-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0423.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::8) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DM4PR10MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 48224ee1-36e5-47bc-3150-08dd171f5495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/KbTQfAyicdyi7ChtUyJq0BC1MUMn+hnAIaRRQaGETpNgYlG9NH9szKwfkNW?=
 =?us-ascii?Q?Wwb8kJqFjYCNonDfGiGrNfDey+CKJZivcB3ZNJ1RFejwZ8vdtWfxnK62LVyn?=
 =?us-ascii?Q?zxrhZNIdfmGU3POLcNABFjq0ZtUAYZYyIMYandvodsUZ+ISeOyPuQCY5p8+4?=
 =?us-ascii?Q?6nfOjlzPOqfJlgSFiGADr7gLXMVbhU2YjW/HIQqV+hCOXips3yCVnJLcSKjc?=
 =?us-ascii?Q?WAcwLvZwf4aRcbM4EMLSHHD/FbIy7XCqFVBlnzPXMTedNLSzAdz+IscbzZQi?=
 =?us-ascii?Q?1GaWTJGf/eEM9VkzOCM/OYWu/SffhkOzdSF8cQrjtJVkQXMiMWpKiKtHCFtD?=
 =?us-ascii?Q?G1mMx4LPEGD1+aH+yr52wCkiCV0JH5ZguoIwiWnKh/UEtwSF1fEE+ZbToKrv?=
 =?us-ascii?Q?Ly7qz8peQsxx7ShpgTU4dgIkd8ZhmDRT/x1Ww1TaKw6HT0JHcV9oAaLAbE2e?=
 =?us-ascii?Q?AA2K0MDb23amvfbn9uu7N9aBF/R7hmy6tcN4sAPaom88L8m8EX1iI6mvJIjM?=
 =?us-ascii?Q?enHvVr6EWAaw3KHdKjM3OK+6ws+q0y8j6eITITPoQCdstl9GWdjJJPMpxd1x?=
 =?us-ascii?Q?TZ8qOy8A8IN5fuj1m5atg6V/Fp+aNqBm+aH2+2NKQfjjmy9HYPvmtpPIdtS9?=
 =?us-ascii?Q?wvJb4GhpZ4ZLy1jiP9sdRjvxxSlbMPLUjIbm6hPy/MAYgACjVPLxZyJ/DDWK?=
 =?us-ascii?Q?b2eTphFR/O/vJSTu8N59BsL5dDzHOrdynbRJLEeJPF6RBbRx+q1ReAkzd512?=
 =?us-ascii?Q?E2hNtBy1CmWTl4WLlkaOE2m6xYZYwGZx4aE761VkxL7dbDHK7Vyy5V8IgLeG?=
 =?us-ascii?Q?PbJwLfyea+fpqVuOciesgt8XrxOr2osCD3kwHnJo47KiEwKKnRUth9at8FA4?=
 =?us-ascii?Q?1yaETkndc4XEeM6rca3kfHvRjU1dP3OR9TScUEm9x33s4xHuouRgh6+Ppp1t?=
 =?us-ascii?Q?M85x9/FKUNvsiGhUpgI9N4nvPoWcBNc1z96XRhwX/ai3CQREUfDYOdhQM4QQ?=
 =?us-ascii?Q?jIToVwhM6r69Q+Vs2hFcs5fTR2Fx7xITidO6hHxCN+PdcB5QybWF+3Bo9+uH?=
 =?us-ascii?Q?jz97bW8ZypZkbltZ9THbG5KWIbBSSL4im49ypXFGoFy86zDb0/7lReSh8WqB?=
 =?us-ascii?Q?lSNqY8YVcLfIDOJd/hDysToZwMqZz7KifXn6tJpEnOxR86IEF6pHEu+HBL/r?=
 =?us-ascii?Q?0dnyDgL+zNBw3Q3YHXRD+uttPChAkJ7SMFw1a/netFxZsSCaGvwSGUUco17g?=
 =?us-ascii?Q?adr92Cua7CZ1CDJTZ+exP+VKrImY0PRLUwnhy+Tww0Fo4wh7uyzTHxcCmni3?=
 =?us-ascii?Q?Ejatymym3ycwZzEf0E4NPbjsPGsf9s1NRz9itfBzYdO4qw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WP4eJH1lYxGVin9BCMJWu0DobqJzVT4dZQcQVKaKVKrYh++tn7bXYzWKWVmO?=
 =?us-ascii?Q?JUf/j3iyMSumuwTNpiNq3Be2CvIt7ZmDFE6C3O2TLFgDv2ZP8HBaAkTTqjkV?=
 =?us-ascii?Q?2QoXKxc2lVfRQGgDI+eLunRz5ncxEg0iUVE+ozpKdpY7TGsmNmZTE9B4TpSg?=
 =?us-ascii?Q?o6EOMLcckr+wfEGxaVoNM46gw3xJx0XixTAkeGAFSk/RU5Arp9ty1YVkTELq?=
 =?us-ascii?Q?Fnj0g+0ZaCQ4/CQVeNOER9KT20LiSy2ig+oW820EuN+UiPXijJcSyLhw4gnu?=
 =?us-ascii?Q?IkS+WJT5HCNWbiF9VT4lJJNysYrUt4szhZzJ/hcYIqgG/1AffWwJQ5WZi3fX?=
 =?us-ascii?Q?4Osu/A3YGT4XzALn9MFLLzuB95rSBYhOT2LZ777EgCYB2w+bi70j/ril3m6W?=
 =?us-ascii?Q?fSnbB64XZF9g6NaRIHuIuQr/s4/kaSKTFj6nQnhOsK9oQ7xW8qu0kff46ReY?=
 =?us-ascii?Q?HH5keRmRxjx59/UafJ5Yrlxm8jCoHPCEmmypWexipCFJpCBDSIDJKDpEWlEZ?=
 =?us-ascii?Q?36R1HU0Nn/JUqjbHNfzCBffkhpJ3sUbmfRTjGY3wodn26jEtmEgo7kb8fFvk?=
 =?us-ascii?Q?MZqRKJ/YuDEnYTCO3a/93GWKMf9uo4rr//jkOjtZgJ/lPIDbjdGWOdYDcd78?=
 =?us-ascii?Q?e7Uwpuv3X95c+APvPSWqKNRa3/tq0Bnm/AVMzYG6PbMwsvx5wW4aRbEhdb23?=
 =?us-ascii?Q?j6ICtYOXn+HdcjTQQ0liQ7HKXBSNGmaN/ooIvv2kwqCJSDWa47oodTvIxSiV?=
 =?us-ascii?Q?Fy/UWk/uRbhuytzsBTANpKIzVXVv+SVtT5PMCCpCB7jpIPs/myTmaswaXU1Z?=
 =?us-ascii?Q?ufT6efsEjiEdQg7KyY2JXlJ8h6w2wYlpOXzN+7g/E2YTjSqXBOn7HLdaE322?=
 =?us-ascii?Q?Pd80IAHLK18fAu5BVHWhvYwoGrZ7T6mFf/lcOOqjIS2X+2iLUJBGRAMGil/g?=
 =?us-ascii?Q?b7PMs0I5/Xz8Kv8pzgTydUZXojR0GbqYPeune3h/iNZF/ySRweFZRnd/W6Az?=
 =?us-ascii?Q?ACXn0mPivGYvhNxX0uARGn/6PoHW+tbBv0Bjws/n7hhP0fZukS0Mqe4SZw3x?=
 =?us-ascii?Q?UwGxNWHh88nrH2GDGa7/wIYzwRVOUzjW18SGmNrxlvNxUFmgkC7xKD0/BXkb?=
 =?us-ascii?Q?XcOBNb/30Wk0JbNbEn04wm/Na4EsayUSLUrKO6mk6dYEGGBOE3m2m0gbGrX0?=
 =?us-ascii?Q?SuoVxcThxzWruknSoCeS4eW8Rrmyp0AiqfGzSW1TWNEZOQkB2gE63Ah8a2PN?=
 =?us-ascii?Q?AduT2k3VkvefF20C9LDE+1uz8igFyE7nzAq97CgmQFMDmaFAb6Q1suOTrOkn?=
 =?us-ascii?Q?Yg2FIHtQiCeYnhkecKdWVK3hQDxEu7HRdV4oiXftfIbv+OYeZ11TkI9NwhZv?=
 =?us-ascii?Q?MMJpEQ+nffe/CE/Go6oIYFrIzU+CgyT5FoTBin39YUJmViUt34rpFH8/A+Qw?=
 =?us-ascii?Q?Gulnvj7CMKi1u35C7/+lMTL/Zetp0f0GiE79lpTthS/SD4BZaZA6pjlsKaq/?=
 =?us-ascii?Q?c9YzQUqGJsMGr7JDr4aWj8oGOBtwSSr75QCrxyM06pm9/jOq1XPp7nzNi2+1?=
 =?us-ascii?Q?FVsFS5pF84ZlOuicv1C71/haLGO7ReiJH3N7sDPq3w/2Q4Woti/sNsSIqLGe?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tU5I0+x5SSQWk8WPWgwuag3K273Qthy0x690hlTCbirctOQZ0BHzuPLgdkL09judwtVutWx9dME0EXX+QtVTVmdK1Sp9IBt95r86agLk6taymIp+hq042leriD1X5tbQJl3cClaJlyN2w8oBgTRPusrnLx63Ho20nSqffz6ICBvs7gpGTlBik/BMF3+wl/GEp1Thnl6pD0i9OnUmoOQEApmFGugLuOLN55WOAZS5tFtAj8HayBVpvnmX985+q7ylCdN09ttr+7q4WOfrEP+PCtmEfpUyMrXMGqy8vNPaX2sz0WwwFYblfLbhbEUvW/tc3TcZCj0TiRIKVxjMEKZnKpjvVErxryIJjyGJr0mfJgGEDYBqkSysRKSTKJxZnGdLUL98HpMbEljDW5VhYXpx4r9fmyFG30rmMG01F/0Fu1L8K8C0mmuBu9aoeKoTQEnz5q46C0O65CQ/l31F4rBAhqDTZYPEbMkaVxI/U1zbhkr0lIWjxzgw1xChGiMEvh0KfHB563wBTGzOHdmhap+W+Fwp597i2fbm+tQFojVeP1lJi3xNo5cOGOqcRbkTCS2MvoJSGtYh7K/UM9+PY31fMMDHguD6OS3v7FvrGi+vClE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48224ee1-36e5-47bc-3150-08dd171f5495
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2024 00:29:08.7836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZamBNzsUcAVyjs4rX1SEsQV2MmmHtZIFLMC7HwUvuZaAWIzTLgbM9pBcv52I8TLrO0xegHCv3DcuzsQlJr8r9Z4pIQUWaAjuDdHOL70tKmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-07_05,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412080002
X-Proofpoint-ORIG-GUID: C930ON2rqh8tPZwdAAmmUQ7BEZGjg4Yx
X-Proofpoint-GUID: C930ON2rqh8tPZwdAAmmUQ7BEZGjg4Yx

On Wed, Dec 04, 2024 at 01:51:52AM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Check only on the process of interest -- that is, /progenyof(parent)/.
> 
> Check that self->fn has been set before applying copyinstr() to it.
> 
> Add option zdefs in case open() is deprecated, so that the test will
> run on aarch64.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/builtinvar/tst.errno2.aarch64.x | 2 --
>  test/unittest/builtinvar/tst.errno2.d         | 6 +++++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>  delete mode 100755 test/unittest/builtinvar/tst.errno2.aarch64.x
> 
> diff --git a/test/unittest/builtinvar/tst.errno2.aarch64.x b/test/unittest/builtinvar/tst.errno2.aarch64.x
> deleted file mode 100755
> index 5c66540d1..000000000
> --- a/test/unittest/builtinvar/tst.errno2.aarch64.x
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -#!/bin/sh
> -exit 2
> diff --git a/test/unittest/builtinvar/tst.errno2.d b/test/unittest/builtinvar/tst.errno2.d
> index 22fe8b4a2..939f4c7d7 100644
> --- a/test/unittest/builtinvar/tst.errno2.d
> +++ b/test/unittest/builtinvar/tst.errno2.d
> @@ -15,6 +15,7 @@
>  
>  #pragma D option quiet
>  #pragma D option destructive
> +#pragma D option zdefs
>  
>  BEGIN
>  {
> @@ -27,19 +28,22 @@ BEGIN
>   * Record file name pointer arg1 for the 'openat' function and arg0 for 'open'.
>   */
>  syscall::open:entry
> +/progenyof(parent)/
>  {
>  	self->fn = arg0;  /* 'open' arg0 holds a pointer to the file name */
>  }
>  
>  syscall::openat:entry
> +/progenyof(parent)/
>  {
>  	self->fn = arg1;  /* 'openat' arg1 holds a pointer to the file name */
>  }
>  
>  syscall::open*:return
> -/copyinstr(self->fn) == "/non/existant/file" && errno != 0/
> +/self->fn && copyinstr(self->fn) == "/non/existant/file" && errno != 0/
>  {
>  	printf("OPEN FAILED with errno %d\n", errno);
> +	self->fn = 0;
>  }
>  
>  proc:::exit
> -- 
> 2.43.5
> 
