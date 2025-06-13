Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C55C7261F
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826343; cv=fail; b=c8RtqasH6+lTdFjW+oxi5YGOQnalWBNIJdrJgHU/LzWzIH8Vq71l1LkwQnmSIXWjmESRwteVqWyj4awID0YL51Lwa/OWqB7H94QYoPlE9couuM0wYdx5I+MbPiiT2gNaXbQ9CacetBT2jTNI52/6XI10temg6c20qQEnWYXA1M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826343; c=relaxed/simple;
	bh=wVPlKqkXSO5mMWLr+75kAHeSlQJU3Vdp7g09E3yd1LQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=crlJLg4zygE46kR5Zl5qKANSYbgiw+lecurEV64lzNErXiL/qbLKf8FPBQMxVpEwfB7aA8fXGEV2qiX7yyZWoejreibTOncHn1XOdIF9J7r1zMlUofZw1x1W13nAKKm0aGwim6qtx/BUszitrMtrTDta0hGlY3CpxWHtElQ6Fdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D2jXnnPI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J8QHZy3n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D2jXnnPI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J8QHZy3n"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCteOa020279
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=n8I+Dqb5DZf4GWVqg+
	+oxR7tMI9TMkhBhfAtVj+YZIw=; b=D2jXnnPIO3v7l5h/6q+EalzJ0NRHSirtqv
	zhqHluLxrvUxvNWpIjE83fkxyE3XIZ3rTH+ET1WWWCB6zuu5kf8aq8rs+k1phYn/
	nY5Dr1zWxYj1yeIfVwJcPXqrIO6quhgXe0HdPUvt7IORlCeKi4nn3rLnZ1U6WNoE
	Kxd7YdduOs0tK2CDAg4m9c8tj+S0Lmn8ov9ZoegeslBn8rhdm3Uhn8SYPQRtC2WZ
	S6hgAarga2/lU1ElE5IYE5zdAVnHDgWtmhgiI/CjgN5hBNoQu5kPUl+HxKXT336i
	ZLZ+N4GPExDQY96OrlO+3ghCxArxAh2X9RFDz+DjSWV6k2HxTrVg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474bufbn9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DDxfbO040736
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bve0ajq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Jun 2025 14:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbCXagQyRxtWGrPWhn/tbWTQswv64m4gkLyYLmcyxC6IYfOZwF+tPb+cGdcfl6jZmbMHcvTq89Fbed7XNgEzZ/h+qgseVvpFG+wmGuV1n4NfN4zQ4U6pPIp46S6rQm1lzwhH1jT9z6lblu1hiBY/Hb0op8QeBWMnsuey8JHd2yq5h/hdioWPGSciSzt33Ue6qkcNBYObQiORHmzcdJWSwZeZWRuYK01z523URozA1UQ/tWjrDDyzy9Jw1d1zcTJ2kTX7/Qs2a8eb+O7RjQPoNL0xX5J2QADWB7xutIl5ZfL1tT3iRGekUKSH0AYRQvFyCGH5f2N0jE+CW0iloN+qRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n8I+Dqb5DZf4GWVqg++oxR7tMI9TMkhBhfAtVj+YZIw=;
 b=likG97y16do5GQAAt5sNvJmQE/Y7nsa/oCllpnePwIFK6Gxefj4hoTu9pUyz1DleSl0cHMyEap7xqgaPKEcwH0SelwIgzQc9WAhyw6/c2h4PMz/UNAUVMh1TlR6rvRoKjuKAu5eGYKAgfHoF+dUpuyFg8qyRFu7B79X6P6EeQBq2xV50N+/qrLth1XulXQqxEy0hkwO4qzgaZnkM3Vo4L208KHHOWTomQTUxQTi1CBbuPPWPVd2h+biQ6qhybtG4a7Fs/BDeyD0CGySjzVVISe8yvjo6QPhmvA/SDi9/xlicVy88yJ9CIh/CarPwn+oljTjtCDuihqNDrh14B4Q2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n8I+Dqb5DZf4GWVqg++oxR7tMI9TMkhBhfAtVj+YZIw=;
 b=J8QHZy3nUCrJBWqtmKMGppeIlmQFZCdLSrKDHVdpPjA/pwmej20hXVqfocM0zRYKIO5SZ1BTBV3PC9YlV+GYsngVFsUl6CLXIOFnM4ZDdvQRuIxYpM8EGAVOyWiDMgzFHlEwPdtG8KEBGOkcbM0xdg/rXBlmQC1/26mgULFUF0U=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CY8PR10MB7267.namprd10.prod.outlook.com (2603:10b6:930:6c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 14:52:17 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:52:17 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, eugene.loh@oracle.com
Subject: Re: [DTrace-devel] [PATCH 09/14] Test: caller and stackdepth tests
 for profile provider
References: <20250522180118.27343-1-eugene.loh@oracle.com>
	<20250522180118.27343-9-eugene.loh@oracle.com>
Emacs: because Hell was full.
Date: Fri, 13 Jun 2025 15:52:13 +0100
In-Reply-To: <20250522180118.27343-9-eugene.loh@oracle.com> (eugene loh's
	message of "Thu, 22 May 2025 14:01:13 -0400")
Message-ID: <87qzznbso2.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::9) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CY8PR10MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab1f932-ca6b-4b4a-6654-08ddaa89e401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q43RFPPhKV2FsiWXAu1RBX7/SDPr+C0l64JsbT8b34qgtT/VwYg/sdNyzur3?=
 =?us-ascii?Q?xhgIjacSBQ14qzorlcorWfAV8ASkUa9tR1Tx7lpsmII6ZOCmlHBX3FvmqMZZ?=
 =?us-ascii?Q?O8Z+kNN4+e4pGMKiTUFxIxDcu5gEbiZt3qC8kholyf45g/RROBgRz+FkfbqU?=
 =?us-ascii?Q?9W5lblVETRKKL6IvQd/xEKCFzzOMl38sdepX1IY3uK/i1ThV6ShTAXR+lT/K?=
 =?us-ascii?Q?AC7t2LfhASNiVx+MbUGHrXTk/Ee5cMaezBykD5oJmxiKe+9UteWZZvaCwDGg?=
 =?us-ascii?Q?EmVS2R9nBAEdKbs1Z9D7sWIDWqkHF3geG0pFIr5JMNCKz2ATlv5dNJtsyWTm?=
 =?us-ascii?Q?XxkVPqzbulT7Be2NA7o6ij5Uk9GoqMXP6wapfE5H98cGUsloRe7XK542DKFW?=
 =?us-ascii?Q?PNsDF+TlBVEmzHSupfjfc2DfPvzsFOqCZqff9PGO0RztiNZEDzFHnpFUxFJI?=
 =?us-ascii?Q?N1bN9OMRQoOxlG9/Nmmh9dCwY3LUJvpxa6uhTEElGkKLxhM7nIfT8XECp+t3?=
 =?us-ascii?Q?ytPoiPFfPJL1oN8CIpjpPO1km14+NukVRcrjQ0Xu+TtDer4WsLFjR3b4x9rI?=
 =?us-ascii?Q?uXfADB3caOXN4Jvgs20aVBkXD6Odn1x98gmoVhPfAMo+VOuy84WY2Z1ccy/p?=
 =?us-ascii?Q?7TtNGxEGxq6VH0J6TdQSs1Egs6mj9nAk1jVYIk7O9LH5CQBOhzc4ldQ97P1v?=
 =?us-ascii?Q?uN8zD96WAMvgZUCYMuHw/V7hKKYvrsEu3+O/Xk4NgcykbABJWcyXvRm/FxFO?=
 =?us-ascii?Q?9Dn1YeiEAQjenDAZuDQeneuegk67Jquwem3u5M5xFUODZQQOltf99jj1jvT7?=
 =?us-ascii?Q?pujQHxY8CWjJYrfwzsxZa1upP5EU5X0zUNUPcqvpI110P5E++d4mni4zVfF9?=
 =?us-ascii?Q?ThIgiuNAFw9NAFynu6bAcaGDMLnmErxNrBS6XMnTxs7kTBlFJDz0uFo4xBXa?=
 =?us-ascii?Q?stn7Fsx6f1gtmJT/9sN/pzFHKWFBM32g+krWQhL19LbmDgmhyn9I5Ts4PGXM?=
 =?us-ascii?Q?F0ttuP8oUolOV2cLg5XHCky7CkeVSpuFhW2YAiGmtoEKg1N1pKamohgGCtQs?=
 =?us-ascii?Q?NOi5dn1DrcWUBVKuCC+6gTotcO2399mhOvg2GWpUML6e+YXzsR8jdRZw9Klp?=
 =?us-ascii?Q?NbQhy1elw/mwLe+cWeufDyjX77seIuerFk+21Fats5Mo+2SF+dYN8gchyY3u?=
 =?us-ascii?Q?vd/fVzCyPjcspSOaKIrUJGBuhdWbNBtf0PMGasHpzcPZkvqF45syhNOzOnJ8?=
 =?us-ascii?Q?T3L6uy2SHx3Oh2+t/Dyce5e6L9KE2FSS2QEEmLiXZPcwvmnpTGkcIpC5N4E/?=
 =?us-ascii?Q?bR4Cc3d7nMY3zpQcmtfRqnOXDr1S2pPzb3X23D2xvm4cFwnWZuHI5LW6Cs6K?=
 =?us-ascii?Q?HCk7f4j+C4natHzEFLDESNXrLuLG07DrLNgXk5gNiLy9lZ80sg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzFZdzOelrP5dG2SZP5iCf0VbGMUXmZew8wZ0Y4yP5icfep8Lc0/MWpSVFyE?=
 =?us-ascii?Q?vJdUoshih7dd2laoKnCGyVYMsLoXaub2x9gVz8OqAOzwb8zBuMzn0AnC180/?=
 =?us-ascii?Q?fWghP4jQL+AjZ/zYLbxUFdLz477Z3kmsBQXvfZrp5ub+i5rJaMmZtfg9Tj84?=
 =?us-ascii?Q?8DPg4y7b+euGPVrRr5V3ukeS7SXfC+L3rvzy3GV6fS5uJPGjWnIivw6/oGWm?=
 =?us-ascii?Q?wj9woJiz5hE+iIG+ldRkFp2R7JWjcdaZCOebP2fYJSvX6M70iUPS9LtKYsEx?=
 =?us-ascii?Q?Wi8bTqmHkOcPB/F2gX7cjRPBJPruGsE9Rgup+lyRukQeMlUTddnwRQ6+iYTK?=
 =?us-ascii?Q?4ZZSAtHB3wqZvZ0tnd3/PBhKWiVTOJNvS7MJSwG5myeCHzhNurGaLbQP3m/C?=
 =?us-ascii?Q?cgf549NbGylOPvaiKZU2ch+sSRR9sd7u0C0Halb1qhfDJqtEMGb0rd2CaVNN?=
 =?us-ascii?Q?nNO0VESIPXiiloD9GcPo4rWPw9liEB5UAVuOtpkXLAtfpo0UUWPI0AxHmtkF?=
 =?us-ascii?Q?FW9iHqXHyPD4UdRbbvVQizg1NrLgLV9+17Hjb8JXgm3sXhIxIaVPj+xOdkG2?=
 =?us-ascii?Q?fgymn9ALIAm1krNd/2aBNTXIlLKNkIQUZWofdgUzGAd075o19QSn7cq2rGXx?=
 =?us-ascii?Q?3WVq+EJGCIAGHfnF3gkcF45PofZgY+DM+9Curq3+eP5OO+9BP7qIrrAcfO+o?=
 =?us-ascii?Q?rsT8N3s7GoBISlTxclrFZmlgiYWriF/6kzEIymQcNfwLCU2YSVs3Z+QSiF/k?=
 =?us-ascii?Q?207tqSFgeG7JHcVa27xbEy6MVA6f8VPsyqScG46gi0rypACH8x8sIMXJapuX?=
 =?us-ascii?Q?x8CcgxXiZZcja0/CIbKUKDfpHejwcJR1TLFjJ6lT0rjByqS0Gl+VOUf3J7aC?=
 =?us-ascii?Q?x2VJlQxu86k6PXnzKPQ2m/A0qki0bgm04llWkK9V966jdoI05XD8DCK5wIBq?=
 =?us-ascii?Q?H8Ibxlzt825aW/l0+s1wbGRaXJjzmC7o3gxIvMS/SVU1d/3x7nD7SmXfInLM?=
 =?us-ascii?Q?oHGTbAxPPNnAsJOAMJgA2j1EURWyBckpB7PF4Ob7tTzV8OoQAe4QofIojdqU?=
 =?us-ascii?Q?yjf5UbxDX3C9B0jBsaXeARdm9pGyRN/Q9JSBZsjojQefbUUWA+3nfOg0YXYH?=
 =?us-ascii?Q?eTaJjG6HwlxAyPqR+VYHOUIxQCCLVUAOrIl8A3HaerUBcAYiz5fu/XUjccp2?=
 =?us-ascii?Q?Rd70sAiRXhw1teAmYs6sBfKw++tatjH/dAOH4uhmxOdmNJunIT/izcc6Zvrl?=
 =?us-ascii?Q?DZ2fZu6Z+msBAhgtaT+gMuZJ5Qfm+czxncv7vMP9KTtbZe7D8PR7MlKBGC5N?=
 =?us-ascii?Q?ANFRfP/hl+EXBnGdQojGmnOgVL3jX8zfQFHD/HCV08pgFQDo6ApIw8DD2XbW?=
 =?us-ascii?Q?KY2Dr7Wxl8wgDDNsMlOgboJXnY3JFNbKEfK6uVpmGXcI03+5otUIdT5rwvBd?=
 =?us-ascii?Q?TYczaxWoDPVF7mDM9kKNqfWguOlGdCywlk5daXy2ohYfyHKBKCIl/URqGqx8?=
 =?us-ascii?Q?//qdhXFNr9ban+4jYJ5tU1D4D4NhiGe0ynSY+Y4QEJ103oMy8Ks1c+LsNHHG?=
 =?us-ascii?Q?HG930GRwkFtdJRU3JFal7JkSI7LCTkYEyXDx8XoS+l0WImz5prK+FcQBKDPo?=
 =?us-ascii?Q?8w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3k4huPLP/gKZ19DHmIs5DZPXGdKtIB3Ib+T+V37+23mNg2LoJdraXG0cjj6l0PH9FUvU0VdtdGOvCp3fi9hoL5P+xPqbH6EA1Kh6oEqshze5Nky9qbjV1iRmW2eHXdM3iyror1e49uYp4aP7YVSAaDkMX/bjv/SLwX2vQeIw/SRrQ/HYZLyJeZ/YBc4zRN7rGjf5fqFBojlhiuvQPNus1dXlCAC/FKtzfv/drVS21PWb8JoNslxzuBB/DonjVMJw/0bev1IIVr/eWWTNIBoYAzbKIGrVwwjFgsdXMfinBxw6Nr5lXKBLqthJ3d7aTp5XyipQRz92UiyAS6Qap2Zz1aiVDjj6b9XS4AVA2uG6h/U1OGeKJ1Cm1YFYItAkWrqVlYxJJdluiZVXdvu+VkKFZgdCvA1S349HeKUcyIR5pgTd0rHctvwNdJCLCrmhEmdhQ0zEXpNpb8PDr/meVl1/x07BkH2V5CWlomv7qZYp6UYWwg+CEL08r8zXWDkHG8GA+JxuqqNnt206Ykcb8EvfqgnCKWqnon9/WvRxaSSxlwllB/B3HaIVxbuA88qfls+RUkpvi1Oh9TUTTfn7hbkrbjjneJnoyMhUrAalzq0a6aI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab1f932-ca6b-4b4a-6654-08ddaa89e401
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:52:17.0097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VQfPgklwMtuWiA5pr/vciPHFertmLYLhEtZ2/uB9ddfjk5zGpWxGIWb7lpYaMdyBYjkvoO7F5NGItv6IJVB/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7267
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130107
X-Authority-Analysis: v=2.4 cv=RZGQC0tv c=1 sm=1 tr=0 ts=684c3b25 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ttqUlfu53Zy3l2AAJ6wA:9 a=bQS9OzEy0soA:10 a=as4kufAtOCVNogPxCcYs:22
X-Proofpoint-GUID: 6mkQVfPx5XEjUFIC70qMPEafrqAXaG4I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNyBTYWx0ZWRfX3gVP4hsgS1FZ 0qbPJVo9cjXDwSjLGmwL1PNx1yufPsvkGj75sY5J8j+U6IP4CGSgwQX9ivo9BbfDO7ygMZRlVbk e2sVtc4u3IIyp7S9w1kt+JdvHUsNtVizfdXCUPYsG7qu3r3aD+mFdIuYgHy3Xm73/ed0DI3zCVE
 RrzimR+HDVpihRy3rap7tPy+tcwewH4DbBPQsdDgnWUMtodfVclGajDdNPzRTM07kUU50HtCr/k kiK/BpgbtNh1XIOm5UzPx+a9vipfFLlMVIs506n3by2JAByZAyToComslZ6M7r61IZrfb1vFRJS Hnbx+LuQoGZYmlfPa2EvFJ6u/rFcf6X6JHK2JE27CMdC7U/vK+wpkNHaHGZXNtQ4mbJBR0HrEl7
 +WLr2HZmm6TerLpTzaOjIbuhbdoPeApuSu1gFxBpnOitexqguv6WiysViMyaEA1PGM30Ux7G
X-Proofpoint-ORIG-GUID: 6mkQVfPx5XEjUFIC70qMPEafrqAXaG4I

On 22 May 2025, eugene loh verbalised:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(usual caveats regarding comments saying what these tests are doing...)

-- 
NULL && (void)
