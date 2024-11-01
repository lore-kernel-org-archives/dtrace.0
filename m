Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AB25634
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730476652; cv=fail; b=XSmeqOw6MND5X+RWLxezRjxwuMaYAsQsuhopyccj1+nBgUr6sjConxC/OHys/0F3WzF355tGrJ5ixsmu50AgHKbt6B7QWIMC/FyCPSjO4LJgXs1D4pLxbro6RqGYPWKp1VGaTSgxuntiexyHB0y8IVAeZ3fWOibytYUqu+PrJqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730476652; c=relaxed/simple;
	bh=FgcwNyqTElJBkaz9RzEzC/L3BirsKdtD2eVdvQEyBh0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b+joZp1dDIRwi3uwGsH87uEq6O8BA7TYFYxrMg0h3M9OZKxhjgtRQpkersewvC8kbQ/4bsdzoe9UZJr2ef4X+SpK0G6hoy4F0GJ2WIsouOFARtu7WkMYXzOy5qhjWxYCEEWzzvFPMnIIZCZOExvyWiIJl5GJPdONDhC3QYuM6Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=h+wJvNhw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fsCh+80y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="h+wJvNhw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fsCh+80y"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EuFtu018964
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=XCbXf6vsIe24Jdr+UYjEJ2nIcQB8siEB+OsBs7wxLu4=; b=
	h+wJvNhwzPXyEf06yOEFrO+4m4OdnZpKDCWZpFha2RA7Rcp05yIu7gajLCdmMaZQ
	coZbO6EdVJ8XrlYONuyiVAPl/D8OOWolc6bzobJRMe/2Z8qxvC9jie1J8FEqyhV9
	aoH62wdGSnP/oU/t61I+NMX6ZalZvHjStpB+yZyy8sDv733YpFyRSi7yXgK/sUzS
	u1RCrbn97EO/jimUp1p/9I6VlQhUMFJBp59KPU1nDeeHZH21qj4Ih2aMJfvxrVJV
	QQTPRjg6wC5Hi6KZWk9o3wIlSnnxJfzgGpliNk1Cyk0ItBpHtnidJMv4M41vKIlh
	NZKuddXMuWB0tV+5YFi4HA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmmpds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1FEn37040216
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:57:25 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hnat32vt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C04uS/KKfmnIXT1CkZmLzPzihzNGyK4bZUvWYwcawKWPiLTHMC/kZJKiVCAVV0qYBAXE4fMBceNc7Q7sWkuDIhSOmACBIvqK/oU4Xk3vYOrEtyTLWj+R1nLMVXEYOTf5n+IYzSFMHoh3PkJILYqwJssE5ruR1NHu7cqFlQmDWEz5ENztFPM9dFK/jWTigSve0HtdV6NaITEecgDgR6N43mkH6OGPJhn1w9nlUE15KPuZPSGDKI59OHqFRwTywstVkCV4HiNR0T4RSqhoHW8YEFM1LDzqZ65HOpx3HmXRrIhAkgWqkCVUoJjs1zqmzRUzCP2ubKRiB3EaacF73eGTeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCbXf6vsIe24Jdr+UYjEJ2nIcQB8siEB+OsBs7wxLu4=;
 b=MswjQ1COFBzXuQvi5dVltp3N1BB7v46HOncUNheZHKRsDqDJZWnNO6xi5CQVdZlsxoX0kYo55O+RaZI0KV41rgde0JDnanFIH09pAY9p5CCeO+Liii98drUCjLH2QzEzWYWl1PvxUn5/Ik4FpoyQIPKsFy4W3OGZGxDU/MES6FZJsQ+BOXkxTp7jyqaRJdehjEuj4DbEpRhqaG2LqsuiYJHG805/DxWBZpR63RDzEPtfWGfRIYSShOVNYlrRZbwsKlA6QM5uj1t9rxKgsKDGeZQD5Voo8AesKzdkF6o3xN7BJ1EH2F5YWwnHop0WsUKU+IhaVxTS3BW2JFqOBg1kRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCbXf6vsIe24Jdr+UYjEJ2nIcQB8siEB+OsBs7wxLu4=;
 b=fsCh+80yvV+YGqspRjMrFAwEx4wNfwN4y5nWKo2yGscQV5OivTno4PsYRIaPbWlpkLybj8LqsBZcrkzD+rj34hBXMhTO8/qprpRuYVOXdX2tfCDhZ+GkkSPsqdDU8dAr0U/RrFBDWU3y+jQlXc0A8ThI4q67M7Ric3K9x6QflL8=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by BY5PR10MB4177.namprd10.prod.outlook.com (2603:10b6:a03:205::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Fri, 1 Nov
 2024 15:57:22 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 15:57:22 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v4 1/5] usdt: get arg types and xlations into DTrace from the DOF
Date: Fri,  1 Nov 2024 15:57:08 +0000
Message-ID: <20241101155712.397674-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241101155712.397674-1-nick.alcock@oracle.com>
References: <20241101155712.397674-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0145.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::13) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|BY5PR10MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 773f68ff-6a65-4c8c-aaeb-08dcfa8ddf0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Odi4MK9j8ZaeyKnF8F06sweEKZ3u1i67enKY3aN8Mk1NMM6s37TnOpGr0Lx?=
 =?us-ascii?Q?wDIfk9YyPllM3DD3JxVUOcjD1rhuJF4tCH5zZZxNWOtCHdMwIfCm/GLnRmr1?=
 =?us-ascii?Q?XDPli4sND8s8ZQR1vl7rTGWOWQw5BDb66hGyUp+jR/P72pBZS1hn7udXpPxC?=
 =?us-ascii?Q?bfxR/eHXj68D0SYKBfUAVdAx2VFAvhM2dqv8TQ1N6Qycqr93l6xMlz+76CT+?=
 =?us-ascii?Q?FRTAUOJNQtkyiw1Xi4oFoFV8FQB+CSDzaehMLYrFK1503/NDfUnBdS95AFus?=
 =?us-ascii?Q?JZUfJSYJIjJwAtpK/geytLiqj9D4/nNEL72Zdz7fok5LVoNew5qOWZVCDQpd?=
 =?us-ascii?Q?u01UJ4KZuDO3hkXu6hqnTH0R3GndH3HIcLx2wfnD7RDVk5uJ/EvKLT/WWcZA?=
 =?us-ascii?Q?ozH2skBVluNqZ1VjsJwAeZOEUTwszua1qmdewc5MB8KIaQIAKOuXmCPCUi46?=
 =?us-ascii?Q?aZx6h2uKkj3GQZ9BszgnWt86Qy1Zkzx51vDASASvJBI7HKd6pA0bS9Qp2g/q?=
 =?us-ascii?Q?kUQB7JzkaFd2MA0wawBtEV6EwSxhXkdwW1JonUkNExh0loAmB6ctCyPg4zO4?=
 =?us-ascii?Q?VG6cmuWYWhx8Dy+ye8551WgpLk5Gt8pVm85Kl787A9E4b8zGp+beuG3JBiep?=
 =?us-ascii?Q?SepU1T9dmtbwLbpra0aXREcNEKS/x7sFxPjkUD6X+PuTI7Jq0fkpE/DIn0DP?=
 =?us-ascii?Q?EiMY+2FiO/X6sUbm6FPhSq2Xdo7a26WKgMpOSabBjF+rqGOGBFYgxiVWalZY?=
 =?us-ascii?Q?uL3cG5VkGbDrL2BFWCtk/L7VY9383jg8Lj54AEG6Zkmg5v8dI8U8WspFV30I?=
 =?us-ascii?Q?zM1YggJRjPhPiFXK4F6dZ/JXBmDURBPsIB0dYF6cRMgzcxk+dbskaZtL6nii?=
 =?us-ascii?Q?ssyDTiPjredxIh0JIun3xxcfOfRNeHe8RritaAzcDQm43LurJ7AhTV4EpsyR?=
 =?us-ascii?Q?mXyCljjLCzdSE85UBFVM/m8EZx01nGMQRt29us018FBKVb5rmmIMDoQ/sBHn?=
 =?us-ascii?Q?mIBjak4GyHJCKwwyK7LTxddxUvDivQaOYOO9NsSsPCMxdlHSHkH7hZV8QamY?=
 =?us-ascii?Q?7BSo31L5UbnTshUKvlA8LzejYadVF55pcGzeNyHJJtnnrbDKsG70IbwwmfSl?=
 =?us-ascii?Q?ag3xEshd8CCLcja9FMKuSUrBz1BIikMPqpybEMMkRV9V4gWLKsDDxPJcnaS4?=
 =?us-ascii?Q?u8BrBr5oCtXwv8zLV8jF80alfJoFfUcKu8jr9C/rcgVw/upEMk42xJT4P6MH?=
 =?us-ascii?Q?lg4LiXkwd3XujwtZx7pjKg9uOhxRelyvlhWI+KqQK8OZMkLjtI9JZL8b6Zes?=
 =?us-ascii?Q?Xz5gxH5PA4gld0tY2BjUWDon?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SedvC2ZqILfU4DkyqQl89J7xoaWjg4WB2SOnx2wWAAqGUV5wYKdj+OqAfsHQ?=
 =?us-ascii?Q?uhfXEjIdN1hSJ4zRW6JIAn299x2om/8bN2a9w/1iuXwMz7RYOurryoBhWI3k?=
 =?us-ascii?Q?m9cbIBSlyDsxyAtrfm0pkVHS0shRf8HuJq2S0SB3VMSlNL8Hmwu6Fl4eQ7VA?=
 =?us-ascii?Q?iZT+yTE99EkHENG7JdpYQTM6NahimBr6GYwB0VEN2dmYUPz3NghI4b4O8PU/?=
 =?us-ascii?Q?+N6fdPHJlmMfzdAVAh+ASzntw13LiFpxJKAuLDnLfFvdUnttmSVtTB7i+qt1?=
 =?us-ascii?Q?ogmfgiZstos28X8F29UiKKpZtgDJRPDG6il17Q6T2X742RdQN79i4CMM+eeq?=
 =?us-ascii?Q?uAopkrkWcZPna+SYafV0QBrBgVokwA6ivhXmgCUt7dQ3i6a58/fJNFDTHwUn?=
 =?us-ascii?Q?InxAMkNfL9ZQA9Bp8IDoyggYNNlOQvtLQp0AhT3V0LqBSKQBYwqicNP1gCM3?=
 =?us-ascii?Q?OyJyF8KwSMN0Qi7AgUE10nfZu2tm6HlBi+3JeA8Lx6a5hcfqB2GLhEiFDHxX?=
 =?us-ascii?Q?SuA9Z/g/ys8277+k12iQUfwgJWMhhkkRODIGI3NgpcBw3GwcqbzLQ0BccrA8?=
 =?us-ascii?Q?2B/2COVaR24n1Jo38jKGkZUYUZGVVQGkhAWghfpaWtJWEhPZ7+bGQUNGnRAU?=
 =?us-ascii?Q?OIUR4SG3k/a83hG+5JepjO0JtRmbeIpAUG9dmtS8U2GybHLWsdtjBsg8ks+I?=
 =?us-ascii?Q?NBiM8hdf0ObNZ/hyLU3jx3MuJdcgUCu2IAyPVVsjZWwsrxTUGIEQxWRI3BKn?=
 =?us-ascii?Q?IAs/jxe90luf8q5wvuLCEpOLAAZZWHjoZNa8ZHq3hr3a7P/fh0ziR8FdKrVA?=
 =?us-ascii?Q?jjneWX7fs0+vbzhEDQOWAyDyhvwr4i3oq+kQ/JBbmI0FmVQhgyjrDdFEvTEU?=
 =?us-ascii?Q?ZgKoO2r5ab3LNPnBWcFfiquf/lPbypICOvyVtkDKtmXT5tkWA8cx8kZAbFMS?=
 =?us-ascii?Q?YxX0Siao51YtBxdGrypkObXEHju5K7nvNR/Y0mJeICyLRh2aZriXNy3U9A+z?=
 =?us-ascii?Q?le8kVn7dvYQEi6exLKWRhq691H9U+uPTlHGLYTrsDXSGI8X7e2VQdu6xpWuq?=
 =?us-ascii?Q?VB4/yydJBot98c/N9OjEEVGQtPndNCSOvgBGbLicVJSnbyC4WVb3Gx0fkMFV?=
 =?us-ascii?Q?x/KcL1au6aExmTEQCcJRM775cYB8cWLDb1+WuoS1elLBbruPejRiwsWLnMsv?=
 =?us-ascii?Q?QS6PNWMZqWG4HyrqtEToXuUtsZv97VxNMtuWj+3o3vMb+N359H7dfeQbUmTM?=
 =?us-ascii?Q?Xj8/8w8FeaikaR8L3ECXV1m9f4q1qMp60+NWtg3je3rUxbVYScJejgJ73QWV?=
 =?us-ascii?Q?8RWDTNwsGzERD+LVbskqSbaX9rn8PVJPHPVX2AQtrp2gKtXjtNLUy6DJ2/4C?=
 =?us-ascii?Q?gX7TuRMWkpgxzaDeBMQpPqXfe7bPxTXBNa1x9OK8k7Z5rP/IsjXvSuBz/Syt?=
 =?us-ascii?Q?MGLsUT/SDgFP9DH5JbQDcf4bnU8ISpTRucW6E+KWGPxr8BtSntm9dZN/Al1q?=
 =?us-ascii?Q?0aIbI5w9kKBARvl/BU7eW5c5viJl5QF4rdx6HEeSPvWpdJ2Qtf2YNgDo452D?=
 =?us-ascii?Q?pVT2ZmrOCtJCXKKUu4LF+RcCEyGjn+gXO9jDk8la3S0y/mJH40Oucbmf4vRS?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9Ng9hsQQI172ScAAV0rBabLspROeEcM+7MmB9UTwCgiQheke6nNjbVfusVDlJ9TK4AWCRV0kibk8LYl/reEegnnJ7D++dBrFMNuY2Bcc+2wpUdrUbHPi44HFZV1EbH2PiOhDBKd8xl/v/J8NqWmLITk8q+Ocz1bQkK11GuRLCgCFH3xZfNlOrgKEasTNw1zkfCWbqfHbtu7lwcO+O2w03AsEICxqLlsRurEgH0y70TMdvCKn86rvJhPPY4PTC5gjtuJCrb2iRTfDAUjZwChugX4HSlZbwS4Hula4M6ICTJpzQp8KnEseEoILhSwZL+Hj6/T/7ghgDr23KMgK5bcXPpC8ewIwdMKUH+SX9VZ221HPRrxEkwiBMyEg4G7cP2+lYzmyXV+R42uQE54u1/eSjPU54xfLJTe4eBP0r70d8nrl0EDUZ7Y/31JGq1f0fKO3+QV7Hc0kk3le8Imtu6wQ2/jIctJBMDHVlH1cuBJBxFsmGd/TFYdzseLvbas/51844hB2RSrrktMqyTFQwVYT6fQKxFh/E17r5juwNGg7agHrfrvFKaIaZ5zkkvTcvONt8LAwxxAaqBCxU5+XDdP+tts9Xict+WAN5vAHs9jIreY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773f68ff-6a65-4c8c-aaeb-08dcfa8ddf0c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:57:22.0756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pVcx/WKvxzO1sVplylipnIBHzA0sY0rgs647nbYpre4teDdbGKh9/A4QpzBSpEBxQ8lmITlsocsWyOxr5+nPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010115
X-Proofpoint-GUID: Pmv58F5w1F1PxXNJ0mg2dyD7klpMPa-2
X-Proofpoint-ORIG-GUID: Pmv58F5w1F1PxXNJ0mg2dyD7klpMPa-2

This change propagates native and xlated arg types and mapping info all
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
 libcommon/dof_parser.c | 150 +++++++++++++++++++++++++++++++----------
 libcommon/dof_parser.h |  64 ++++++++++++++++--
 libdtrace/dt_pid.c     |  59 ++++++++++++++++
 6 files changed, 256 insertions(+), 49 deletions(-)

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
index f4c6be1e045d..2ca39b26f88a 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -791,16 +791,20 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
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
index 0129674adf0c..25bfacfdbfe2 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -35,6 +35,13 @@ typedef struct pid_probespec {
 	ino_t pps_inum;				/* object inode */
 	char *pps_fn;				/* object full filename */
 	uint64_t pps_off;			/* probe offset (in object) */
+	int pps_nargc;				/* number of native args */
+	int pps_xargc;				/* number of xlated and mapped args */
+	char *pps_nargv;			/* array of native args */
+	size_t pps_nargvlen;			/* (high estimate of) length of array */
+	char *pps_xargv;			/* array of xlated args */
+	size_t pps_xargvlen;			/* (high estimate of) length of array */
+	int8_t *pps_argmap;			/* mapped arg indexes */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index d6631a1afdcb..dd3a6cd2b887 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -807,10 +807,11 @@ validate_provider(int out, dof_hdr_t *dof, dof_sec_t *sec)
 		}
 
 		dt_dbg_dof("      Probe %d %s:%s:%s:%s with %d offsets, "
-			   "%d is-enabled offsets\n", j,
+			   "%d is-enabled offsets, %i args, %i nargs, argidx %i\n", j,
 			   strtab + prov->dofpv_name, "",
 			   strtab + prb->dofpr_func, strtab + prb->dofpr_name,
-			   prb->dofpr_noffs, prb->dofpr_nenoffs);
+			   prb->dofpr_noffs, prb->dofpr_nenoffs,
+			   prb->dofpr_xargc, prb->dofpr_nargc, prb->dofpr_argidx);
 	}
 
 	return 0;
@@ -879,12 +880,26 @@ validate_probe(int out, dtrace_helper_probedesc_t *dhpb)
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
@@ -893,35 +908,106 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
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
@@ -938,18 +1024,10 @@ emit_probe(int out, dtrace_helper_probedesc_t *dhpb)
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
index 41a87955ec1b..71ac1754d343 100644
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

