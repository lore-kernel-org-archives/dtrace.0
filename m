Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F041A0728
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518586; cv=fail; b=kMM9VQ3attpNmgjWgtejffsoOBj7TsVlLdNmXy+rSXi+RoMBMo635WNvpVp9s6HlSRPIvjhdJCkLjt9e60c/CPrLwOsPUwOW5bkIX1g6NLNkKcr+KGmUfWlBzxEnk5lzhs/hzXW+TIwK6mwO/fYO3CcfUr9WZyUsmlMMIBZOAI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518586; c=relaxed/simple;
	bh=mO+nnZm9b3VaypaaOpiDV8zZVvYKMfo98Z+K3Fei/4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lnDjxBAuEiOrVgLRSNVD33CIer6A87GZiVv+Cwgl1zSgncwkrvUmNec3kPhtsNCXEDhe4bbRbz7iCeBkgsaSlOvoqbdTwq/t/4mDIcvRmCDF6huryKD5t7/g/JLjVXhp3E3tLBfcV7grMTXmJLAVtRUfNSl6Zqi0oHVpohm8w90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M9UY/qp8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WNR7/LnZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M9UY/qp8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WNR7/LnZ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717trUG023473
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=hhjwoG/n6uogq9PCD92MuTHoHOgD8oc/qbXYeJCHCgc=; b=
	M9UY/qp8FhN472e0TTOwhs4pEF+l60P8Jfqwb5RFFAuJGgD5BfShxTa01JfWQ4uU
	6ITv+gNe42+ldO2Mcp2SOYI19JQ4DRUbtQvNf8MDPV3rKLGfed5hmKoPyViErmM8
	NixatkmWZU7p31Kd4VYTUkeS6bBtC8UfwRLkig4Wyfjb2n6iN2lDC3U3o21hj7gy
	+h7IsBj8rn6ZagRKCI/yTYGDZ6pPykiwkjspIHUVNCsKdxMZYVAf4V8CZbwDBndT
	dsKUuMvEWpUoLrjPhEf9MxPh4zFw9B2fT9j7BQ356yis8qw0qc0s5Ts/70y8fdGF
	7Ogcl45i5epcleL+/WH1mQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqp21u7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:23:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471D257g029016
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:23:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmpt0mm1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:23:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kf8GPblUoOAukNBXZyRfBurXWfd8OzdWQZGFmnqbfKGD0lUWmAJ3IEXpzpA3VUUOKgQpoOVzT9OUpMz3YWUlt2iSsb7SnxAy7nmQynx8AcuZcwSUzsCc+NlzO/V0nlpapuDxgycU7Uco6aVlFxHiHYec5SJaSLVGGStXF46T2fjETK+r4Bmw1R1BtLD0OwUxac0spIEzVYpaiZxV2Rz22EITM1lGE8Ad3Lv/gTfMZuLUmcYSk9jzI93ViQNnGO6n+Yy6AFVviy2gBKpducYlEVJC1p49DfwuHTG/BUt9TzHalPmolbHVrf2wx8Td1jMCDy24mM301h8/hb+TSY7Vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhjwoG/n6uogq9PCD92MuTHoHOgD8oc/qbXYeJCHCgc=;
 b=oIncYgyB2qJaD5pINX/d6Fxpc1ksg72SAlGUDbrlzglScQJgPJn6YZr71KBmlu9fyyOE5X8BXCDQ3nTYETv7LkaIKF/xdwgJA9WXos+GE0gTi+Nd67Tch2l0BFHuyAHOFYr7XqtXhL6X7gVP9ELZdB3YBaKlzFFv2dcDXL3e8qXV7qbUdXHx3PttNY+1bjdhsb3EJoj/kJw0CAwxDRrtIl1W6MtQpgQOkzo1qQY3nYgdAqblwn2VK+iqISJtffc9TG2owTWZ5vC5VfAu21qI0q/sFmq866K6P+CNZpUPIlDAQDH+RQMskAD5QF8Xz7Fy5Nw4fFZP6bKdmtBhuFV00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhjwoG/n6uogq9PCD92MuTHoHOgD8oc/qbXYeJCHCgc=;
 b=WNR7/LnZeQUNlpXkqXJS6gHxrrTjQ1oUCN4wfGaIRkjt4GI8kWkW+osY6YBlthgJl/5IuN9XvIm6B7fSo5royQtGhYKugNG6iHs/foU8hOscRz0L0WTQ42tDrWPI5KIPQSUukWX3npyuvSWzUfOhY7v0a1Ls9t9Sh4ZqbogbQOI=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:23:00 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:23:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 7/9] runtest: remove obsolete kernel coverage data collection
Date: Thu,  1 Aug 2024 14:21:54 +0100
Message-ID: <20240801132156.286780-8-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::16) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9259f0-d73f-47c6-5261-08dcb22d1098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f0621EiZ3D3vlS6JZlUK8+RMUooasmuFcMHmcE9e5R9jqIZl3iUbLHwZx6h2?=
 =?us-ascii?Q?D722huaZn2DbYWYPHe2WsFQ/HwGKxkuknrIqlVKg0abZ1Y+RuSbb2iUbM2e7?=
 =?us-ascii?Q?l10LoiJjy1t8wkQpR6h3yshZ9Z4CUQ93QOtnV+50UXlkzmkk8eHsgHPvzKZ/?=
 =?us-ascii?Q?7a3bKcVYQlg6krsF78yfj+OuMqRVMivl9fBwrISwbGB+pDxqeL9o6GrFv42s?=
 =?us-ascii?Q?3wU27i1uo3m6tl4vweVHsmdxYmYnx013kR4Ae+1FeUb8sNTOXVqtZoFKqAvr?=
 =?us-ascii?Q?Puz5NWu+qBHgfyUHSGF7K2FUL05gLEPcWue1n4O2n7CkcnOwpFBDsaiOfYnY?=
 =?us-ascii?Q?z5o2K8RjqL8Vb723aZ5F7Mn2OjymGL4SrkE1BgYmUhBwurBql70trg4Ob7pN?=
 =?us-ascii?Q?kJqrSBdc6pPk7JL7EzZdhWK4ftNLZwBcfvGI40zXZz7Y1N8KyrSpFy9xUqvd?=
 =?us-ascii?Q?c8AZvLglSMMaKrTg91QlX48nyi5MqFhaRUv80DHaB+HKXCOqWUWl/dhiP0/3?=
 =?us-ascii?Q?ybXvGzgBQm6xwBmqnHp8x8SvsVCoVVdLXnZ2h8HWgOAZGwgQp6v/Q7Oz8gBt?=
 =?us-ascii?Q?inb7yTAKbuXh4p6nKWh8ulJn2dPEvTta9LmvpL/92fdauIZvOjAD6vsQ+dmK?=
 =?us-ascii?Q?kMKa78tBgWHBMZ4QxxTFDr6BDa22ozdK/UlIC1beFKl+7PuT6HdbKtjZ7dpy?=
 =?us-ascii?Q?XAG3ic96yRJ1VLxAadRY/NDFrG+RZ6ZqVqDaVlO8IFjYE3PFkKZIakuXwuoD?=
 =?us-ascii?Q?y+8cCoFObXgtKaWNuLO37cZ7EXcF4Wzaten5k1uN19+pOhlN6k3sATI8PDNY?=
 =?us-ascii?Q?UjE100/wiMSLCqZ5KYbDjK8oVSP5o4in1bGtye2riflSX1XmvOQK+Uku2A4X?=
 =?us-ascii?Q?Bp5cV7WnqgR5Niw0dRJ/btYePbty8xDFZbB3Pti2/KhBuIBZk0U7/LnQ+Lf/?=
 =?us-ascii?Q?ArF/apboKSRsb8Pz29Fh5Da08Fi67zD1GXAkLMAqGbJ2kL3UQra/m+6pU1AY?=
 =?us-ascii?Q?d0nsRlEuIxL/F6sFE3RerFiOnixHGBsQKOFBaKTgRlGtwKSMzqUsPX5EvVUD?=
 =?us-ascii?Q?tW7lqItP9ifipm/tUEegeG2RMTcTvGqzwHdwVZmVT4uOkagY678BOqG9vK7n?=
 =?us-ascii?Q?JTD8Mkxrq6nryBMR0OSkxdJJ+QrUvU56UStWOhhejHzgfiss67Fn5c8qBWBy?=
 =?us-ascii?Q?flOyqrJ/3cCL9kV9YOADcr0LUV8YwCF9URuzUmbh2v66FafiEMpQhU8yLEnJ?=
 =?us-ascii?Q?Z1d2D0H1koIkEaRxxdXueCywDk5NgfHVaK2GOZzoUuMkFafH06YjHOUf7IEu?=
 =?us-ascii?Q?OG/dzfKG1LrWeyo1YfpWuK+SXFp9jDwLJxCm5vuUHYCVLg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yJzutPWUnIzYexxh6OqDzwbPOQCZWdgv4XxW9EV3IBzf3BgiKJHFcFXr0JKd?=
 =?us-ascii?Q?F6o70N2oUdUq8475HOqqk3KiZDz4h9jmu5GaR/6JJUYvqd3dDEJh/NXihBsj?=
 =?us-ascii?Q?7/wcMogafrtoC7se0fxAHAoQoW2KgHHO03fwiEvaOdQFcLFCESzhdtu5gcjp?=
 =?us-ascii?Q?yKzDp7Lj7+V3exEbPj+fGkV3XI9QlgS6LoKRKCu0aWIV8pcSWsRthUekQ5rz?=
 =?us-ascii?Q?126054NLGZcEdsYu4cE6FdWCO9QbCurdHVboyWcsoRHbPcWLDKWL6Bmi4qRn?=
 =?us-ascii?Q?Z+ev0CA2tEMFqs9l03WVHbktgoBzs0clSM35biqCQvzb/wSm1sofbJtBJjzI?=
 =?us-ascii?Q?W+lVREDllKA9jfuZb0EXWz+FpOmhsbqUuEbrMOIkjNtbzADj80qW7XUdhMRD?=
 =?us-ascii?Q?BqIEn6gr9O21ozMx7GH4yNMxxBHhnxttr6MN1wjqpYJ0g0mqHvONdyZ7R0h3?=
 =?us-ascii?Q?KQVqCYjZMk4N8AE59lospo8DIduUHjwnlWoR84FxuBdq6en/kVZc8XSf+cne?=
 =?us-ascii?Q?VDlPRxemrrt4BwLMDe5cR6cHMmPkmeIp1Xxr42eQyRe4trjw5oN+nkTrqVZM?=
 =?us-ascii?Q?O79QKDeJF0JSHwD+NNQTyP2/xG98BJ5z7rrAJ0Nj4dQcCrMTI0RN8Jf0rjUn?=
 =?us-ascii?Q?vvcfgIDO3oYnmVcLz9cUIY+epnCJlH4MgerKyL80l/bvkpSiAJzqLs4ZRpYg?=
 =?us-ascii?Q?6lHpraU+nRHeWnACPps8A/2JQskQQHsl/2wLsXbkSLHL64NMwh4CTQtEl8Ej?=
 =?us-ascii?Q?b/GLfryObN5oJMnq8yZnqBeGIl6Eh6WD83vZaVJU5hmhUZXbJNFXZRdQdlap?=
 =?us-ascii?Q?r0vuCfvXZY8yJPJ+h7Z0u4tgSwLZJ7KrkYxzQnLjn/YilFhggw1LE11weAXV?=
 =?us-ascii?Q?UYt49du9Uc8+0nD6xChj/XMeWBLsgmgBhDMPbx7qXmqDv1qGxkDMvoFXRgEe?=
 =?us-ascii?Q?H46tCPH6TiErJzhaP1VwSf04CZaog6T6lUmdO83PXZCMQg9EiB6oZHhlVn1U?=
 =?us-ascii?Q?QEkpkxoCAAo3LyThShYVp2AFB8D6G8aVTqD5TPK2R/bFa3JCXghpYo/ppvR1?=
 =?us-ascii?Q?vKJB4ql81Mv37+qhdh4HL/ytszHpSY/fwQ+WIYg1gliB26cR5hbxhiuX0SrP?=
 =?us-ascii?Q?dHvF8FXhTBtc14Te9zYAl9CQePJUPPx+93rSkAWCyfoop/o6fQlTQ0SI/TE8?=
 =?us-ascii?Q?CObzGy6J3i51HLoq0u3O/cEwg7AhTP05jFlqfp1VpANurMjTKcCOn1W+DLxh?=
 =?us-ascii?Q?fxX/RrLewrS+XLtvtxlzA5z+FBDBWt6pQcLycYGTtJJS9fpr8SaazGWH30PA?=
 =?us-ascii?Q?t1CK1BycKgD+ZoMTElJc+dHRvs2CbaHjDDaFo7vySMYIfR3sV1Yz4VzajuGy?=
 =?us-ascii?Q?iKommSPtdUzwh1ZyUEd0nfUgz1/FQr7XInHc36tOrnQLftyE5GRLblOyeFtt?=
 =?us-ascii?Q?hTw70rB3n7rb6KCqHI0np3ZhTN4cAu78jAk8PZ0DfY2lp4bmrCoV58I4gaWa?=
 =?us-ascii?Q?ZieZkZQRCKZugzXD10f3wBVhjfV9dNjo/VCOwbLRyGGRAFILuZ8dAlxzqLb0?=
 =?us-ascii?Q?rh9ZArNKnxK14vsUQLpwNIUrCbdygEPmAb2bxWFa1Mi+4+oQZroDeGg+wr+5?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q5xK1/GtfOelgg2D0qc7H6xVnBKK1RYSvMsDDf8S7nN9Ptb3QRnSUlqooJnkR/bEfTOa3Ehp05NM24ILV1GsiP3sRmZB+EL7h0xWbfEvTmlfFoCKIkaQClYhQkyvb3zyH75DHn1Qn1h/mxyDmxxGujy+xEl0r/6plVkW5wbCj65roFN1PQrQ8KzSjGAyuMEF3Ly+vHjZIzM6lpZXh8FgiqQBX0sHEZVN5ufgtGewc2pYBijDHTbDKtusjJO6Ozy805beUuTPpdkxbVWbvFuk2wEG71xlyARLGtz5bwVzEe5cxDSfEvA0bKLNhJ+UvIvW2wArnYu/WqF3JItKQq7pt7hRV4IdewsVe9RLrxi5UGyPEFdSTiJqBvWk96fF0Ao5hlSKxmTMRA0gfzmms0Fx5wx2sj0UcgxBQV3x8M8UrSc9IKFKxzNSrNlEkM0snP6a6HYHRAzPDfyx9r7Cba7UfjTrv92A4zzEFFKvFRSDw5UG1aXyW1JXWdsEHaG09ERpTfCM6q2JNYWqr3fUAXDhKhqnzm/KPsq0USAtOwFntHZ5b8ntwmXrhXogWZM+KGujlouHtB8uvp4T7B5VIzT8TF4ktq2ZI5iQ47hBLWSAm8o=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9259f0-d73f-47c6-5261-08dcb22d1098
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:23:00.3251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJf0hfz9XgMLPWrJIkb+QUCs4yWFwAQEjT6uJv+PtQWTs1dHomLFtCqRLUw1z4Pd4H8EYkFhD2ljMj/9IVzjsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: 7lvBQaXHg14WaEaE4Hv5v_1AzAiLAjO_
X-Proofpoint-GUID: 7lvBQaXHg14WaEaE4Hv5v_1AzAiLAjO_

The DTrace kernel module is long dead: we don't need kernel coverage any
more.  Delete the example runtest.conf as well, and drop loading it, since
it served no purpose but to point to the kernel tree used for coverage.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.conf.example | 10 ----------
 runtest.sh           | 28 ----------------------------
 2 files changed, 38 deletions(-)
 delete mode 100644 runtest.conf.example

diff --git a/runtest.conf.example b/runtest.conf.example
deleted file mode 100644
index c92aa6b96cff..000000000000
--- a/runtest.conf.example
+++ /dev/null
@@ -1,10 +0,0 @@
-# Test configuration file.
-#
-# Copy this file to runtest.conf and edit it.
-
-# Kernel build directory.
-#
-# If this is not specified, kernel test coverage information will not
-# be available.
-
-# KERNEL_BUILD_DIR=
diff --git a/runtest.sh b/runtest.sh
index 817f4a90487d..16a1a77bd394 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -21,8 +21,6 @@ export LC_COLLATE="C"
 
 arch="$(uname -m)"
 
-[[ -f ./runtest.conf ]] && . ./runtest.conf
-
 load_modules()
 {
     # If running as root, pull in appropriate modules
@@ -644,15 +642,6 @@ if [[ -n $NOBADDOF ]]; then
                  --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
         fi
     done
-
-    if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
-       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
-            rm -rf $KERNEL_BUILD_DIR/coverage
-            mkdir -p $KERNEL_BUILD_DIR/coverage
-            lcov --zerocounters --quiet
-            lcov --capture --base-directory $KERNEL_BUILD_DIR --initial \
-                 --quiet -o $KERNEL_BUILD_DIR/coverage/initial.lcov 2>/dev/null
-    fi
 fi
 
 load_modules
@@ -1592,23 +1581,6 @@ for name in build*; do
     fi
 done
 
-if [[ -n $KERNEL_BUILD_DIR ]] && [[ -d $KERNEL_BUILD_DIR ]] &&
-       [[ -d /sys/kernel/debug/gcov/$KERNEL_BUILD_DIR/kernel/dtrace ]]; then
-    force_out "Coverage info for kernel:\n"
-
-    lcov --capture --base-directory $KERNEL_BUILD_DIR \
-         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
-    lcov --add-tracefile $KERNEL_BUILD_DIR/coverage/initial.lcov \
-         --add-tracefile $KERNEL_BUILD_DIR/coverage/coverage.lcov \
-         --quiet -o $KERNEL_BUILD_DIR/coverage/coverage.lcov
-
-    genhtml --frames --show-details -o $KERNEL_BUILD_DIR/coverage \
-            --title "DTrace kernel coverage" --highlight --legend \
-            $KERNEL_BUILD_DIR/coverage/coverage.lcov | \
-        awk 'BEGIN { quiet=1; } { if (!quiet) { print ($0); } } /^Overall coverage rate:$/ { quiet=0; }' | \
-        tee -a $LOGFILE $SUMFILE
-fi
-
 if [[ -n $ERRORS ]]; then
     exit 1
 fi
-- 
2.46.0.277.ge12b8151ed

