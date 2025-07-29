Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41044C62
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 02:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753754836; cv=fail; b=IWD1N20yzRAcXVT6e0yoVvhTiAQcW6Pyitt4OZLPp90f0oH4moUNcLbsUdCFwaTSMEqO1fVClbLpvqzIrs4oixLTdcs86Rld8/YsOF5JPF1Ukv991wGbC4R+REfT4oJtgdMPSPaReiaFaPnAKTGM55ipBKvYPGcvxaHivHPJpEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753754836; c=relaxed/simple;
	bh=wuTuLLXluqLJz/D+oSqG/keZxp/o04M5I/6TNhZDyYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oT86494Xw1KVWLP6KMWAnbGdyQ2Bx0VnH3RsqimE8FT2Zq5p7xIwerjmJlYCYEJtGv278OTUiD8yJkLY4wS6gXSmfEczI1aVpv9wjxOoIC4UG9iEt0xA1pe9ff/MImfrYmSkQBLw+Xq1b1DZGcO1etibKAviK9hFDNq9cThy4UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nvUDR1FV; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=i7lWQv4T; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nvUDR1FV";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="i7lWQv4T"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLfqba012581
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 02:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=qK0dQux2Sf/DDgC/Im
	Oo7H1S13V2mSHAfS0+Rjmd9J4=; b=nvUDR1FVE3/UGcb5l5NLPhj2QLW6Fbg08z
	NsSXA0ssqVEen4UL4vhP+pZRxMHkoG71B9QbGHfV7LNZJnIWCg7By7kHDMJkCpgw
	qgTZ41aHe4tz/vmPzzDTqgtQz7EaDE5LlzMPrL5o48TMm05AUV0Mt5AYUQKC+8h/
	Y0aq0OjCKuQNHlrYOQAEqZ0QA8j5KuPpHR2wB55oYza7VRITWexJqnqjj7ybp/gX
	jy/2pyz5qKGPtaTKQ+s6lqsEehmDZzWNpI0TZ/jbviGBdOS58w3g5xe9hZyFtBSF
	Fd6Wgbo+A4GMv5+LFQMeUXwBISLVBVQQHsmaGQ1CkilnWffcGOhQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q2dxu66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 02:07:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56SNXR9s010380
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 02:07:12 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nf94ent-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 29 Jul 2025 02:07:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhCQrJwvWmhI7wMKeB/prnT5cfXSX/1zqTDlZ2YeqbJXN2if6Au4rGSpczNmPyuH7meDA5Oi0B7p/PhwPnpovI/tSiXGYxrUeUYY+U3E9xXHo/V9wzK+7IR3SPD3sVZrMjmsrc/+6JfmDhZNZ5kCpYOBvqa4IYWXddnpuu5vP/s2VambKtY8tcZy30zGH6SFsriSAU1gDlATvQ9OkY99jD7DV9ZmtgnmBsAeQzUTfUMsi10xzHeO5Vb15YWrJESmva4I0tg8AtGLzg2tEXaRojpMUYhfsvZa7gY/++LtNJhKimMOh7rRlMQnTr7ibiYb2xNLncluysF57Dqo+O5sSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK0dQux2Sf/DDgC/ImOo7H1S13V2mSHAfS0+Rjmd9J4=;
 b=Jp86daotN9UJ7VRYPEY2+57cFYRVszvYZJodQcn6GoGiCRpO3jRBxxvDkvMw6vpqG/EDY9aJPbYnVK+JK+bxgaqiiuSN1LHYRCeA5wCuUFJ/tjdX3tjam/OKN+VMGXP9sTstOzZxvfNtNv7mIMvayRyfh2ihns0SP0MfItEFNs/QY2REuFe6ipg3+VjVAhFmRJszKntRsqI+Cukjdq+lR+lfDwh3xhMPPWhzBjDR+evB0awaM9w2/Oqc6w5x+UVPAFIxOYifT3OMR8B/lQgFjYRdulUNBButcFvzzOprvYyFLf4nnT47SspSg+qnbZ8OmeeY5Vlo3eDFWTxhRz6cAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK0dQux2Sf/DDgC/ImOo7H1S13V2mSHAfS0+Rjmd9J4=;
 b=i7lWQv4TBpQ7rfdN61qZJ223hbXi1JHKMtSiCt9GHCGpzDvdQF+QG3M+gHhBf1Nize6j/+0dztr3RFn7PVywJri5I3ZCu+P4tFyxJh6gfLRCWtJzMmnxjFrGx5RNXMVlorK6sWTxKvu4ZNiBI8YTxjjDMuxvL3cDp2/8YSj4A0E=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH0PR10MB5707.namprd10.prod.outlook.com (2603:10b6:510:149::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 02:07:09 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8964.023; Tue, 29 Jul 2025
 02:07:08 +0000
Date: Mon, 28 Jul 2025 22:07:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v6 7/7] selftests/usdt: add is-enabled stapsdt tests
 using semaphores
Message-ID: <aIgsyUvMfwfauSZO@oracle.com>
References: <20250728163611.1570773-1-alan.maguire@oracle.com>
 <20250728163611.1570773-8-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728163611.1570773-8-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH0PR10MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: b6192912-2f08-4082-ddb7-08ddce449f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8LJkL1oNYnZdHs+ugC7ZVCgJNpOuIxB8OBg/TAI6iyIRuvpt9i2LOWTSX/8d?=
 =?us-ascii?Q?9UFeRsqPoAiTbplz0jp3aXCbBA5OkV8gylhxelTpNCYXtxz1MPQHTAZdpNco?=
 =?us-ascii?Q?QYHcKwTJGIj2Ja7jxirtgWU/NMZ1/np9BvtMVvJfSJpBfLMC/reX+avLWDaQ?=
 =?us-ascii?Q?wxwwuC66f7QMlemgPQ3BccM9DQKqYUB0B0HCEGjssQrEkbeJ1x3QOrRwtFJA?=
 =?us-ascii?Q?743vyKLR3bqUYfKue7hbrBFwTDED8wEEQPjtDC6RguC57iTdi0v3GF+rcLmT?=
 =?us-ascii?Q?7m67A1BwksxrUKvt/G7VYbCdJCrPXgmqMHYUqGZbshgc4a+5vgCLzanjBi3Z?=
 =?us-ascii?Q?TXgsugbikskg+4SawOwRfxbgxKT3DAJMGjnZmoy7cJJxb0epcdCqN/Ebfv91?=
 =?us-ascii?Q?gwlly6IXxYkozqfSOvodt0uLplM+MxfwHvy+LgwdD2dr2vLuYOT2cC8D180V?=
 =?us-ascii?Q?2nW8iSTiwjJnnBrsq9N6Tx8TmTaqhLlWh3NKygMeBe5OY5/87esAIgjEl4VS?=
 =?us-ascii?Q?ojqPYDob6FkyJxB+SrZvwwxMbCQfGXyyQgj//KqW3xWvWprTa8I05I+/05Ym?=
 =?us-ascii?Q?5m91OBJoiuoCxu5k8+nq7mrpXKcFWhRwNSSu1y+sSk/voNe1dbhr5ZR3rzSn?=
 =?us-ascii?Q?aZoNeb7AvfRosz/ktZ8CFsbem7CvB/+UdCeBKUmWMKEaaclWYeXt7jATleig?=
 =?us-ascii?Q?9OcXJ2ecKRMm9I35FXNcSWJtMgG2/+Eiq4v9h67s/jrs0t0WIzUy52rRHmES?=
 =?us-ascii?Q?VPMMdC0BMrKD3aTYFn/5QksBMPXGIvWJESZ36lSFv4F6zVzWHYroKqYOFdHc?=
 =?us-ascii?Q?gxeMkl09OlDlq3kFaUTz2leKlkQBQ3ML9K9nqajAJKJiNbdsHRDwMzVvi4KA?=
 =?us-ascii?Q?dM2jyhIwOlijDze0lZi1voNTPj7m6TjMDyckkSo9doOwTW5/eIWF34yWEUyf?=
 =?us-ascii?Q?C+0EjmmEK1ZwPufKpzC38+05FL3/GBldw1b8la/zHY5eiO67G5/cb9AcmNU0?=
 =?us-ascii?Q?wv7jkMn4OEge0ISHl4GpaJfs5Frt+x+l5q4m7o93NgdgY0hqPbSm1tN5xenl?=
 =?us-ascii?Q?4hHzpjBvIuW9FV50gPnijSenmQRlRGj7H2anDYfpLHmYso+7BbG1fPLDISKM?=
 =?us-ascii?Q?OGfRorvIz5zDHqjXT4lLR6d3eBrPpDSB9+GRWWpn4jh3o7Xf+SDip1LGAJwW?=
 =?us-ascii?Q?uZMbVT48s978j5nD8uIvr4dhYvFDM80yeHdsoFFWWQhm/kNyKWXRtHm95eJJ?=
 =?us-ascii?Q?KlB5dWMQP9f1nbbLPFlTSGuaXitGX4XzpQkWZbcc6axasB3Z2UVnh5/BRMY9?=
 =?us-ascii?Q?mzCLnh9jNUM87CH9Iv3YchuPCem4y4g1/5kg2Oyu6k1b4WAbTV43P9S6zqFj?=
 =?us-ascii?Q?f2jJoAKqxCCEag/78towAvfByA3G1ECBgvyluy9IJI6IQO5bpS0Qwzu0YhGq?=
 =?us-ascii?Q?fK2RwxuJaOk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a1QlGuWosGKNS+MhleTOfKqyZ/CpHy3XuzO25qDq7oQRzJFt3X2xu5oKP5gm?=
 =?us-ascii?Q?73595ANBQN670WDFS8SXrrT9I4jBb9sDYdEh7smYOikqNH4TlxRP6TnrE9bK?=
 =?us-ascii?Q?yGCyk9wFpkDCHUPg8vRNq40ONiHJ5+CZpVdNqHhh3zRMRkl7ny0HdK+qZJK4?=
 =?us-ascii?Q?hwWET06hQINTylHFLiFw6RD21+hLr/6En/SyCAHMg5vynwNkm5oMakq1+bBM?=
 =?us-ascii?Q?K9OaO0QVAKRLQG088lpyATRCryc8hDVvPAWwhkjxwbxl2RjYY1XZlhS/0Mlr?=
 =?us-ascii?Q?KHs7H5h80OPA7XVTcYKJTAMazr5nj3e3h3XkIlYPhGdOO6iPtxu9il2PvjfE?=
 =?us-ascii?Q?P2QsG9mF9YDbwqy4gxgri7D/lDe86wyiHm5XELSBMnS3xd2EqoAxAaPPkqON?=
 =?us-ascii?Q?MPky8cqjZ6ENRL0LdkajmRAJrBuzS9c1cB1zoPyKU1UITbiOscVmPHk0q0XD?=
 =?us-ascii?Q?M408dwVnMbpjFN1YPbYLltYRJTCxVxM+jQhy6lX7snkYlLqUj+Y/KukbU8el?=
 =?us-ascii?Q?vRhL/5qU7d3XhL/kWrUxcyl1wJFFAwt9SURz1I7U5HvwZpARjkjaSwDc/hzy?=
 =?us-ascii?Q?XyMBiP4OuBUxhhOVNvmmXsiptCDf9iWZbI3JiTsVPJO6WKuxx5jraVZDBL/j?=
 =?us-ascii?Q?7/LzF3CmggdtP1VfD0GKXYUrQTCwjiwd6kyq9c9V75JxyqYJZZujm+k8RCR5?=
 =?us-ascii?Q?ukPatFRm4zDFJZR05iSlqgYJ6w8HnnG0wUkJGdwzpErGrzEpwYV717a6L8mk?=
 =?us-ascii?Q?fJeGR03C5kslNHrQSKrFx01GquQd+ok0BpyjbbCOQnP1oyQIuRz8vccsntDC?=
 =?us-ascii?Q?fUvXuwM4l3R5gjoDIK3VbwvcoyqbHuqqm4FizpFWY4Kgv0wWqAodFJnh2dh0?=
 =?us-ascii?Q?RvzF81pmSR44ljSlB80EzMZw/OL0OE9VEL2mxxEZMSfMwGRXKwzOXBB3EKPM?=
 =?us-ascii?Q?20qkCvuZS4a+ATRUVTXoiWZH2nY/Sc75bm5rAABCxpo7xjS3UR8zP9BwB1Ey?=
 =?us-ascii?Q?o5k/ivv13YYTS3BKv3mrgxlD+b6dMtNJ7839LnAKBbSrlNQWgYOENfZe5mA4?=
 =?us-ascii?Q?Ha6SNOGxV4bSlPyx3bxqijfitPNgAjxiQrvQQ4kr86ZRiJ11+/eekNbZt0HQ?=
 =?us-ascii?Q?nYzklYZdvAb0c/37333bBPM4wN1UbeQTsUF7kI8BHdc5lXKmaY89IO3i07RG?=
 =?us-ascii?Q?P1GpyTiblGpGkRW+/JVVv6SakIQze8311CmBaOjkxUpYuJqnPobp01Ymseyv?=
 =?us-ascii?Q?dp+7bX3k6xtnICBFrbPJdeQ2lm4TZ2NnrPBqkE217Gc3UNXJKXzFcStBSSc/?=
 =?us-ascii?Q?fOGv9iu8IkrrzfAvu886IGMKr1B/vZSyejb9NTE+e74y71WywVdsf8Hfrp+U?=
 =?us-ascii?Q?u5t9We1y8xqb/EHqxnorHKk3HDQ/GJyP5A3VITY1bXEAPRC+o+GjYIWzjpi1?=
 =?us-ascii?Q?xjnik1361ROMM7nphF81P206FS+tsHZ2hgtfFZGMTHab0or4yIfFcyqxC9m3?=
 =?us-ascii?Q?pDpn59k7v7ktH5gQ9tX5sZ2ViVKKKMZiUL9uNX14Cm9s/X8g1clxH339f2yH?=
 =?us-ascii?Q?ZanyK5gGxJdfUtM+pWlFxNYOMbBwoqRxB+I/zS5Q4YB8SNoRY854zaO2DJWW?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HLbYW4ZLGbBghbcksTI7mD3KTOAm6gMlvnqQWj5hL6jK37a9ZQhyKpdsSJIXjFF0cMywllMJsWfVdjBhkvitmaSxEbzP7A51rd/o1DVg3XVhIOg28/gE+CzFai+WJzw5I1DQ69jdJKWBNdN1UvOpYoSY5smwVVWc+mq/P3k+zRtfCaj/XQ3yHF6gkh5miyQwvEP5S9FfcR00kV3L3LdWe1K8dvVQEw32333Ut+YjKqS/HnUpQY3kNcINlOMXVuu+Ya2Rv5khFCA963Ud4WAi+RJXnM+JaBRz8hw2FiHh5lcXirs/bWo66MMqQI3TNLLvTIKyTShGW6SAE+tVNwMl9ZlPTxIYNzpUbmIoGrDNKvKm+rnyToH75hpDaM/OT9RWXwGf4JWEmSsiS1BObZ/OJkf5JUZu9uIjk10aqQhQFwkUHcHETQy1Cuw4jM5lAjpdHrF0hpKpwgn86eT/193EB7s5CPqRneJhPxrW8N8R5W8vcZ4kPhZrotxMeXbRU9+H85ezIBtnbB4EnofyrkN8n5PZUeZQ/FHSrn2HS5m3beTyb19sGhgzFqaIqYWO6jNRZwG0kDIljvIX/+tDqedi4n15KDICYJ9Oj1VlqEVjG3E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6192912-2f08-4082-ddb7-08ddce449f38
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 02:07:08.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZaIE3D0ly/Xavsu9OPFYvN3y6sJVFu0RSaPjtW9SWuFRVjZH340dppL06mG+Em3ncgoRsfW+mS/1xf4taDhEN0rfqu2NImMEnLrHXmbMbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5707
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507290014
X-Proofpoint-GUID: d3WRIuuh8PBj2iVZhZZFB6Caxy6Wj4Zq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAxNCBTYWx0ZWRfX/+RnulkspS1F
 q61UgwVn/DifGIEbDtFnnZWuIHN8X0SbzA7NNRI8GVzwa1h1fnxIJmXvM/rfR8N5puq3yfzjGan
 RXmaylfzD79Xy1BMnN9S6JKUk+c02LH6pKW+9T8ZaI1B0jyRDULpGhz736EZTt/5AaD7L+v9JdW
 dxm/g8GsZv9mSUDAvsS8nXcJi1hoFeKxGSqQdVW6W30D0tBUSilRvcG911lZfvYCa3FYLUv8CRb
 V/CeVy3O76C85WhhxgRliLwnm5taTKQo4gK/48VVeKE14ruM7/FIrLrHuSYIN/vg5ZYwdiqPqAR
 VZrp/4M3aqDFxdTMvlk5UNzQN00/qs64BpKuwoVPjEzluYi3v26cIbBlmWyPOM20yOVe7RBqkLc
 Z5JzwKDCmnkhWLY2iTOj7tIx5odOXV0cJsK/7UmosaNWr3fOjHkWP7UEchrbpf5/IHN0/9di
X-Proofpoint-ORIG-GUID: d3WRIuuh8PBj2iVZhZZFB6Caxy6Wj4Zq
X-Authority-Analysis: v=2.4 cv=A+5sP7WG c=1 sm=1 tr=0 ts=68882cd1 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=gswdlJ8OmVGtHVBCj4YA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13604

This test is flawed because you never initialize the semaphores.  If you change
the code to assign 0 to then, then the test fails because the probes never
fire.  That makes sense because your implementation does not actually do
anything with the semaphore, i.e. if the probe it relatees to is enabled, 
nothing happens to the semaphore, so while you do store the address of the
semaphore in patch 2, it is never used for anything, so this test passing is
actually accidental because the semaphore initial value is (apparently) most
commonly *not* 0.

On Mon, Jul 28, 2025 at 05:36:11PM +0100, Alan Maguire wrote:
> Is-eanbled probes are implemented using semaphores where the
> semaphore address is specified in the ELF notes and passed
> in at probe creation time to have the kernel reference-count
> probes; this allows us to have argument assembly code that
> only gets executed when the stapsdt probe is in use.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  .../usdt/tst.stapsdt-notes-isenabled.r        |  14 ++
>  .../usdt/tst.stapsdt-notes-isenabled.sh       | 151 ++++++++++++++++++
>  2 files changed, 165 insertions(+)
>  create mode 100644 test/unittest/usdt/tst.stapsdt-notes-isenabled.r
>  create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> 
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> new file mode 100644
> index 00000000..db6d18cb
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
> @@ -0,0 +1,14 @@
> +test:main:zero
> +test:main:one:1
> +test:main:two:2:3
> +test:main:three:4:5:7
> +test:main:four:7:8:9:10
> +test:main:five:11:12:13:14:15
> +test:main:six:16:17:18:19:20:21
> +test:main:seven:22:23:24:25:26:27:28
> +test:main:eight:29:30:31:32:33:34:35:36
> +test:main:nine:37:38:39:40:41:42:43:44:45
> +test:main:ten:46:47:48:49:50:51:52:53:54:55
> +test:main:eleven:56:57:58:59:60:61:62:63:64:65
> +test:main:twelve:67:68:69:70:71:72:73:74:75:76
> +
> diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> new file mode 100755
> index 00000000..99fcc844
> --- /dev/null
> +++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
> @@ -0,0 +1,151 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +
> +# This test covers all stapsdt probes fired by the STAP_PROBEn macros.
> +# Arguments values are checked only for first 10 arguments because
> +# there is support for arg0 ... arg9 only at this moment.
> +
> +if [ $# != 1 ]; then
> +	echo expected one argument: '<'dtrace-path'>'
> +	exit 2
> +fi
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS="-I${PWD}/test/unittest/usdt"
> +
> +DIRNAME="$tmpdir/usdt-notes.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +cat > test.c <<EOF
> +#define _SDT_HAS_SEMAPHORES 1
> +#include <sdt_notes.h>
> +
> +#define SEC(name) __attribute__((section(name), used))
> +
> +unsigned short test_prov_zero_semaphore SEC(".probes");
> +unsigned short test_prov_one_semaphore SEC(".probes");
> +unsigned short test_prov_two_semaphore SEC(".probes");
> +unsigned short test_prov_three_semaphore SEC(".probes");
> +unsigned short test_prov_four_semaphore SEC(".probes");
> +unsigned short test_prov_five_semaphore SEC(".probes");
> +unsigned short test_prov_six_semaphore SEC(".probes");
> +unsigned short test_prov_seven_semaphore SEC(".probes");
> +unsigned short test_prov_eight_semaphore SEC(".probes");
> +unsigned short test_prov_nine_semaphore SEC(".probes");
> +unsigned short test_prov_ten_semaphore SEC(".probes");
> +unsigned short test_prov_eleven_semaphore SEC(".probes");
> +unsigned short test_prov_twelve_semaphore SEC(".probes");
> +
> +int
> +main(int argc, char **argv)
> +{
> +	if (test_prov_zero_semaphore)
> +		STAP_PROBE(test_prov, zero);
> +	if (test_prov_one_semaphore)
> +		STAP_PROBE1(test_prov, one, argc);
> +	if (test_prov_two_semaphore)
> +		STAP_PROBE2(test_prov, two, 2, 3);
> +	if (test_prov_three_semaphore)
> +		STAP_PROBE3(test_prov, three, 4, 5, 7);
> +	if (test_prov_four_semaphore)
> +		STAP_PROBE4(test_prov, four, 7, 8, 9, 10);
> +	if (test_prov_five_semaphore)
> +		STAP_PROBE5(test_prov, five, 11, 12, 13, 14, 15);
> +	if (test_prov_six_semaphore)
> +		STAP_PROBE6(test_prov, six, 16, 17, 18, 19, 20, 21);
> +	if (test_prov_seven_semaphore)
> +		STAP_PROBE7(test_prov, seven, 22, 23, 24, 25, 26, 27, 28);
> +	if (test_prov_eight_semaphore)
> +		STAP_PROBE8(test_prov, eight, 29, 30, 31, 32, 33, 34, 35, 36);
> +	if (test_prov_nine_semaphore)
> +		STAP_PROBE9(test_prov, nine, 37, 38, 39, 40, 41, 42, 43, 44, 45);
> +	if (test_prov_ten_semaphore)
> +		STAP_PROBE10(test_prov, ten, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55);
> +	if (test_prov_eleven_semaphore)
> +		STAP_PROBE11(test_prov, eleven, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66);
> +	if (test_prov_twelve_semaphore)
> +		STAP_PROBE12(test_prov, twelve, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78);
> +}
> +EOF
> +
> +${CC} ${CFLAGS} -o test test.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test.c" >& 2
> +	exit 1
> +fi
> +
> +$dtrace -c ./test -qs /dev/stdin <<EOF
> +test_prov\$target:::zero
> +{
> +	printf("%s:%s:%s\n", probemod, probefunc, probename);
> +}
> +
> +test_prov\$target:::one
> +{
> +	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
> +}
> +
> +test_prov\$target:::two
> +{
> +	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
> +}
> +
> +test_prov\$target:::three
> +{
> +	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> +	       arg2);
> +}
> +
> +test_prov\$target:::four
> +{
> +	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
> +	       arg2, arg3);
> +}
> +
> +test_prov\$target:::five
> +{
> +	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3, arg4);
> +}
> +
> +test_prov\$target:::six
> +{
> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> +}
> +
> +test_prov\$target:::seven
> +{
> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
> +}
> +
> +test_prov\$target:::eight
> +{
> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
> +}
> +
> +test_prov\$target:::nine
> +{
> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
> +}
> +
> +test_prov\$target:::ten,
> +test_prov\$target:::eleven,
> +test_prov\$target:::twelve
> +{
> +	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
> +	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
> +}
> +EOF
> +status=$?
> +
> +exit $status
> -- 
> 2.39.3
> 
