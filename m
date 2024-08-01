Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115391B374E
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722531045; cv=fail; b=cg1Jf13QzBIgPteI5d1dar/TBAi9nZDXPa6Y3cvuINM3EXyZJWdtuVXEtaImSB3avGpf/rR3GxFqm32MAsMjPEIQDTlpGq7jzmp5zfo4S0v7pWSOWyPD9MRz3jc5QO7slyBHMzRDJlx56sY8lUwba0Ey1Pg/8BANe5QKVQCaaLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722531045; c=relaxed/simple;
	bh=OjQjIwT3zTvOKfbtsK/fs2YXJ6Jy4kcrmPAjLACWXMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QfIZLrcc+VkVwGtPVC32DnWB0jkqAFd6Pe93VSe5LqRo9hUSxy5ZyBWl5FyL+zWq4IrmHW1DtQeJiqwPpnGbm3WKgqcxYEgoOmZ5Af9bWyUMG8CpIUHe9TLcPIQ7+NC2wXAuMy/jiysGNNa+OVOyUN1JxHvh6tGZq+4Vah9ecvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IWtVjJ2R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OMiD1G2Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IWtVjJ2R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OMiD1G2Q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471FtU6l028555
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 16:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Wi9uedswVrKOC8R
	MsL4QRgW/iyMQKOZNdl2jFC8QQIQ=; b=IWtVjJ2RIYmjJDouUZE3qGTHLBiHP1m
	79i/ASuZloBfDsIJTRQHuhV7QQPvfavy1cwmks7FB9Vh2nR9l9wgAt1/EWU7tjBe
	N2wpbmAby5NoNlSSXBVNaCcm3+3PzbsZatvTAe4sOfK0ECIAitW5VPL2nhghDbEJ
	DjvNHaGO4tuLbxNPiAqMMBhAG9oqV6wjoUqbY034qImkR66FWS9NG4R6OZsAsT3q
	bfI86HuBUYKJGWS6BXmx61xOoFk+tvBkZjWdp8m3sRb/wsQcZAgy+AZcW6LFs6gJ
	OS7eojc0IslTbWqhkswbAEoqERBIzzNPJOWs6p8iRNCLYDjNZQzroJg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyj8nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 16:50:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471FLhZW005879
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 16:50:42 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c34pbg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 16:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EW/byfDg50tz4HYg4iEpsMNRS6HzAcnN5AM7ZGkV4MPt4eB3+EjT7E2Txwq5cCdmeGzq1IK6osr+kOxnvKb9+Sg3fCXIdasZWuHcd00ExuHNfyyvcEywXHxHy69bF6qiWkJOH8S2RMjdQZF0sJhXpHH4t2N30bVzZbcW6txIioHBnBsKbDYBQkXTE2UqVScv70q+aTE1zQk8qhNRH7ZDohNGXH6vXkhw836gsi1dO6pdCslPDaG0w4QH0itXCAdEwDuKhgWosGHS7cL4Z5CuSaetrm1n98gfTk8B57uCIDDuL0f8Z2H5SawDY1uq0UHMEYxlIKCYzrn9bkclJkWkRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi9uedswVrKOC8RMsL4QRgW/iyMQKOZNdl2jFC8QQIQ=;
 b=wzVUZaDmbd/vYwABls3wkoQJbkkOi5qDAEIH4FQQO2jqTd8KD61HcWAeD01wEINEsLs8ppZ5aqv0nN82p9fS3/yc0wot5f+NJ4uLd5PQF1AczVeZQV1g/z+yGDHd9ALwtRyyXDtzNDxax6heLdljKV5Vg4SdfzBQUwULgYgP1geUoNOlyOcBfeP93u+dMwXYHGCSfHwMOylSiuguRPsZDrsZ4tUB/EH+v18MwZQb+QZJvvGKtNGNgvVnqvo3A/koq7gDu3ra36Roonk7DMDts/N2g766oRsjR8Cj2OlyJXl6GyPbllDTx/9fbAWGUK4fCijN6fGruPiRcBTJy+vghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi9uedswVrKOC8RMsL4QRgW/iyMQKOZNdl2jFC8QQIQ=;
 b=OMiD1G2Qf28KfL/rwQpxVh4eyk43P72F55xvsfLj8krgmeFnftKio2Wt/s+psGERRI5QjInUCfZXUJy7k0W0GiTHhh1iDNKgtR0hOdY1ta20n4lYvlRIPCYqet/lNfh1kMjtBoyth+Ykc6SEW2VkTG4Qb8omtuHyO3+lvPHZRgo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4589.namprd10.prod.outlook.com (2603:10b6:a03:2d0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Thu, 1 Aug
 2024 16:50:39 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Thu, 1 Aug 2024
 16:50:39 +0000
Date: Thu, 1 Aug 2024 12:50:36 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [PATCH v4 1/3] print() action: identify ctf object used for print
Message-ID: <Zqu83Oa3H8zKyw3l@oracle.com>
References: <20240708145404.1673045-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708145404.1673045-1-alan.maguire@oracle.com>
X-ClientProxiedBy: MN2PR16CA0008.namprd16.prod.outlook.com
 (2603:10b6:208:134::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: 188fc396-aba2-43f1-a0e7-08dcb24a129e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lppv7RIMz4v9IxTcW5BSpjlUh139ynUYUNkN3ubugztrjqZrif/8yNOi5rhp?=
 =?us-ascii?Q?6B8JUXxWD0+AacfV8gD3Kd3JCAlk+0vYutYAQgtbDBc7Q451cYVfmXYCtSL6?=
 =?us-ascii?Q?HrD6dmWHdpr1Q4m979MFLthTRf03B2u6ZhlVx1P7lyr4JiYr+oL+4Gf4gN0k?=
 =?us-ascii?Q?FTQvl9wK80zJinlfZRiACzO7ZHRC/jlAO8NFM7nc+IetFEoYl28+H5+Md2Y6?=
 =?us-ascii?Q?SDPUmDhVEs2Fj3jXIDEitTDa11MZefjtuxUrIrd56P2wypB26/RCOzVf+j1T?=
 =?us-ascii?Q?ExCfw8GswuGGTgHAc2Hya2TpqK2hnPV4A8gp3nM9HpCyQq5T8UOE5raPzPN7?=
 =?us-ascii?Q?tSrBFkn5yvTpEUSGUclvLtW7jit/LSXG8nuMfzmmsmkhaUewGI+1PCDalOrH?=
 =?us-ascii?Q?c2Z5YHUqk650+QYcHStKndXtN4BHRnz39gHDFBwINJZJYMLkGF4GGRapf8I0?=
 =?us-ascii?Q?Z8FZGgvmndDOuDlPp8FLsjC8uIzap03Bp0jkU4Nmb3aTd7Autn6bqFvYGbyr?=
 =?us-ascii?Q?PtMWAZR3LvMg96bWfMKSR7QPqP+qjd19oEZPwkoikvMlSwRr5MoLsZdKjjyv?=
 =?us-ascii?Q?6GY2KnYhvpRh04fq1GR8vszbXrm+SfTs7GqDFkFAFU7S3zvPWfowsVgEE/Hr?=
 =?us-ascii?Q?/ghIGUXB9tbILzBA1uDIyyeYS+RLF9ngnc26mrXUbKhrtQ014FRblfqIuoV4?=
 =?us-ascii?Q?cEp2zcgOKJrfscNjaL0cUHurBsVI4EsF4zG9lSPn/ski7/vvb+KvLxYTnicp?=
 =?us-ascii?Q?UVizYl70SJ89qS6lbft1Snn4TG/0fxnLOtWiFLEGQ7Za4mpEN3I7v1WIN/FT?=
 =?us-ascii?Q?uf+Wew8I4eAbiGBg+PtC2/5cOkZllY0fXN231R+nIGkm2Cl2dK+8E9T/tTHo?=
 =?us-ascii?Q?b2QzPoTZK0ylNgPFb+kaCyzl5JikuWrAFB0TS2sM1sLEu/mSdHSeWXSChFlg?=
 =?us-ascii?Q?YfU71EiWjU45tbraziLXWCRzGzJwx4q0xMtvGB14N06n/c9yNsCLnokGXVxQ?=
 =?us-ascii?Q?xUAnX3pkck92G09k/2RKEmQdMaxQI0UK7rjXP7YusqXUGB8/DzpvWAEveIyF?=
 =?us-ascii?Q?cHwY1BTrwABkgGL2j7HeRLafXCnvF1x++PZxNS3MYm4KCJOh5uJgCZhUTBNO?=
 =?us-ascii?Q?8vf/4MeuAq8cvzoY/krzHyu1Fl5mc8VjeY3YjhpcXnrX5KRWYs1lfwxVOVIs?=
 =?us-ascii?Q?KzTUPPzdCoWu/4uKob0TwjD5jHk/dDi6DyEvbr4fIDSBHWJIabRH1VlC9l/J?=
 =?us-ascii?Q?qQxwM2D7Ga1C1axoV50c1FzzXYJVLKiIJTGMzCFpqs75KE4w/qMInm40vk6l?=
 =?us-ascii?Q?aALmpqqaBcat1M6gjv5NVkBMp7DkM8jRYsE/nOgcA5ojLA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HemDHVBvqg25FF0+0E1uQ2Obi9w0s792vyAXNakjcLw4uFumudE4LifUCN3g?=
 =?us-ascii?Q?KMNUxYJPcpP0uL9ULj8eGxeU9MigmFqGdTxew4eGLbdy/Qsr2wxwkWIF+8sO?=
 =?us-ascii?Q?G0JxkB8uRXCxFzp4+TmNSwRaikCmB6LaaSQ/DRcVj0TKIjtqMEuUBxFYFfb2?=
 =?us-ascii?Q?go+amAKVHG7NJK00ELxElJ4i2jAbA5SZo8bR65OIOPOdaskGcslDKovXuiK2?=
 =?us-ascii?Q?3+4/c7vDaIHKo0Uvj/+FveeuFpVMQkuP1LzaA3O+d9yXvKkrfzx+ZYSdGHEo?=
 =?us-ascii?Q?ljuVS0nzHI9IU9PXRiZ7b//LQtLEBHNTC8k7HDYzvdPHR3QwULMylFPpjrBX?=
 =?us-ascii?Q?E7i68okU48lkzIsQVxSIsrqnCnvKCDV8inEMvLoe0h+GUL7ZivgjsasdaY4a?=
 =?us-ascii?Q?1533IavqcBXhxvO6j7rYG2NCn5jlOME3LRBEPZVOZS4E4e1oLTPO6+lW/25z?=
 =?us-ascii?Q?LVCjP1U02DnBLVwNDuzTTdlsKyHhnKHtG5zlb62JodhBHuKjlIgtSAnSmNKr?=
 =?us-ascii?Q?HHVtdQiTPYCM0aQlEYa0e4wPDNZCm8Fu3efCsuERPp+W6Qb5Q0Gxh+1tSa8X?=
 =?us-ascii?Q?asWXxNiYQXqgELA36TtUHmopjoJeujlAR29USgZPR9wsLOU23uBYaK8aE6gS?=
 =?us-ascii?Q?oKxCFrMxP1MtOwE8cl7dNG2mgZ7epSxE9Aa4eXeQkThqmQVtGmH2DiVdxm0S?=
 =?us-ascii?Q?0E7YWHgi5ApAgJwXH6YK5hcIpg92vPGR/qRCrN/pklONxH0G9xbyW8k0XmBI?=
 =?us-ascii?Q?goME3Bp99AJAJ77a+xXDP0UT8ft/PMzNbkfod1QSda3IFNvkogfFnOv6JW2z?=
 =?us-ascii?Q?s0gS4Mthoujt6lWVqHs9tkJaTgOeJzVBE1rj6G+opSRDpZHe1dnc/Y9ts+nH?=
 =?us-ascii?Q?YKm9N5O+ErdNVg+lC3zXpUebC7z4Va5b/u80dEqswTBGCuoFoqD1zY12BaGb?=
 =?us-ascii?Q?lrjHU74E1COOSU+riqnOZ45tKqqSliw0oLUmxBxtkVWt3bXyqCy/fX3uYOpd?=
 =?us-ascii?Q?Fn60Q9ohWnPLAbQKJL8XNLvRkLPTKKfdhjqVARR+CFCiLjnVs+M0ytwvi8ks?=
 =?us-ascii?Q?1eK+uLXfEyOIA8eXfu/0k5zWq52vfQikaK6tFcIRC2FlZK/TwleVHU8xm8Xq?=
 =?us-ascii?Q?BjLn84NCvqd+ZiLdkqP0BUbo8E8Ke+nWJfOq65wzJ+83PoeecGjgEkE0fqd8?=
 =?us-ascii?Q?F4mYzxnm5fanTkX/MaNtEhplzU2ZOmOql9iwzyjzjq18aBifiOoRJxZ+1TWb?=
 =?us-ascii?Q?fgOe9szfJPpxwbRJQzEnEpMwTK5FC+NeXeRruT1Dk/qGZomemIatFWVwT1oo?=
 =?us-ascii?Q?svHDcA6uEjqwNcKUwm8qNM67+qScxleJBTp+m0unExTrnXPue06ThOkUpVAW?=
 =?us-ascii?Q?OsD0DO3kp/enR4BXqTVhOuiXiqoeqRF1rO92/tC0b+iIeyBIBTZrmLTwvOZB?=
 =?us-ascii?Q?BKAFJu6QH3CAjDss0clzYuB5K6uBmG6hxu0hJ7EWbCqEC6QO7eH+bKiM9e/o?=
 =?us-ascii?Q?Jnw3t7g0TWDmYNxjaakvCdnMScXhMJX9hPqHhGbbRN1Xf30l8Ftj14dMmojB?=
 =?us-ascii?Q?LhoUGwAxaV9SSIz85phXzGecDPKBETqwT7dsYKTqskea57tbvNuKxXnnr1ja?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PGqRP5eaCcclHQa+IdqJpn8ZaS+iOqw24I8J8OZAySfVPJSIq81MSRVFZ2nNGQRp+DJe86sw65I5h6hd5POUou+h2giRA6GJWxzUsPQmcdRLFs9kCOBmc05IC4WI0uRsU1yh0uVAf+VKqefuKWmY+xY+W3hObxOxn0zRvYaX61ExvUW8wMAifxvyerNgw7sF7SATRvbNR6rCfK+P2UGjhw/NUrUKioGgiem1yPQoGJjEc6LngwlVHUpoFTSodEf7lyF7UOV3mthRCxh1GOdyfEo6T1VeZ3vVKSJFwIKqnk1uH+1ntwMhoC7/AupzUPs5QiHF5llRChuB2e16epVlmekvsq53P84pyBzu/xXTm+04oqsshnS7L2mEfFNJZa1mcXqhaZ5OyuOXsvF2DfYXx345JS/NP/fuzc2LGBQ09WLW6uD10SenaOcBn8DRymbs1L6hqe5jLEsJD8XTNBSjYD5EIruLK2mw+fWGuewXeEpq42apdNo0J5Q/ni1ntB/i/UC8CxkHzd4c899dVv8ldwSXFMOzo3kzDawplzbrMopogSOt7ve/K3uI65av0Qb1NsJoQN+0nXni2DWMzjn9SSpU7bBxFTAanjO5rIfiYc8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 188fc396-aba2-43f1-a0e7-08dcb24a129e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 16:50:39.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b37T9f4MKyBM7Z3hH+095Apbxxu7MSPrF3PKFFiC1m9z0bKiBSzNslwgkBcX7vT2NahdMfZAOjTNI9/UnuSYTYBzkr3TkzHY8uJsY8+/XaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4589
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_15,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010111
X-Proofpoint-GUID: ddbpj7docVhysmIM5AY_Lja1ANfIjakp
X-Proofpoint-ORIG-GUID: ddbpj7docVhysmIM5AY_Lja1ANfIjakp

Small question below...

On Mon, Jul 08, 2024 at 03:54:02PM +0100, Alan Maguire wrote:
> when generating code for print() action we need to identify source
> of CTF; is it shared CTF, cdefs or ddefs or another module?
> Rework the print() action to be a printf()like function under the
> hood using the format specifier as module name.  We can then
> do away with dt_print_print(), calling dt_print_type() directly
> from consume.
> 
> Suggested-by: Kris Van Hees <kris.van.hees@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_cg.c      |  8 +++++++-
>  libdtrace/dt_consume.c | 28 +++-------------------------
>  libdtrace/dt_impl.h    |  1 +
>  libdtrace/dt_printf.c  | 28 ++++++++++++++++++++++++----
>  libdtrace/dt_printf.h  |  6 ++++--
>  5 files changed, 39 insertions(+), 32 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index a1c24e37..2eb2df9c 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -20,6 +20,7 @@
>  #include <dt_dctx.h>
>  #include <dt_cg.h>
>  #include <dt_grammar.h>
> +#include <dt_module.h>
>  #include <dt_parser.h>
>  #include <dt_printf.h>
>  #include <dt_provider.h>
> @@ -2838,8 +2839,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  	ctf_file_t	*fp = addr->dn_ctfp;
>  	ctf_id_t	type = addr->dn_type;
>  	char		n[DT_TYPE_NAMELEN];
> +	dt_module_t	*dmp;
> +	dt_pfargv_t	*pfp;
>  	size_t		size;
>  
> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>  	type = ctf_type_reference(fp, type);
>  	if (type == CTF_ERR)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> @@ -2849,9 +2853,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>  			ctf_type_name(fp, type, n, sizeof(n)));
>  
> +	pfp = dt_printf_create(dtp, dmp->dm_name);
> +
>  	/* reserve space for addr/type, data/size */
>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> -			      sizeof(uint64_t), 8, NULL, type);
> +			      sizeof(uint64_t), 8, pfp, type);
>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>  			      size, 8, NULL, size);

Why pass 'size' as record argument when you are already passing it as the true
size of the record?  That's unnecessary.  We can clearly get the size of the
record from the 2nd record's dtrd_size.

> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index dec2314b..e6880703 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -507,7 +507,7 @@ dt_nullrec()
>  	return DTRACE_CONSUME_NEXT;
>  }
>  
> -static int
> +int
>  dt_read_scalar(caddr_t addr, const dtrace_recdesc_t *rec, uint64_t *valp)
>  {
>  	addr += rec->dtrd_offset;
> @@ -1983,25 +1983,6 @@ dt_print_trace(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>  	return dt_print_rawbytes(dtp, fp, data, rec->dtrd_size);
>  }
>  
> -static int
> -dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
> -	       const caddr_t buf)
> -{
> -	dtrace_recdesc_t *data_rec = rec + 1;
> -	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
> -	size_t size = (size_t)data_rec->dtrd_arg;
> -	uint64_t printaddr;
> -
> -	if (size > max_size)
> -		size = max_size;
> -
> -	if (dt_read_scalar(buf, rec, &printaddr) < 0)
> -		return dt_set_errno(dtp, EDT_PRINT);
> -
> -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
> -			     (caddr_t)buf + data_rec->dtrd_offset, size);
> -}
> -
>  /*
>   * The lifecycle of speculation buffers is as follows:
>   *
> @@ -2562,11 +2543,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  			func = dtrace_freopen;
>  			break;
>  		case DTRACEACT_PRINT:
> -			n = dt_print_print(dtp, fp, rec, data);
> -			if (n < 0)
> -				return -1;
> -			i += n - 1;
> -			continue;
> +			func = dt_print_type;
> +			break;
>  		default:
>  			break;
>  		}
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 01313ff3..88b31ce0 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -789,6 +789,7 @@ extern int dt_buffered_flush(dtrace_hdl_t *, dtrace_probedata_t *,
>      const dtrace_recdesc_t *, const dtrace_aggdata_t *, uint32_t flags);
>  extern void dt_buffered_disable(dtrace_hdl_t *);
>  extern void dt_buffered_destroy(dtrace_hdl_t *);
> +extern int dt_read_scalar(caddr_t, const dtrace_recdesc_t *, uint64_t *);
>  
>  extern uint64_t dt_stddev(uint64_t *, uint64_t);
>  
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 50842216..d794dd47 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -14,6 +14,7 @@
>  #include <limits.h>
>  #include <port.h>
>  
> +#include <dt_module.h>
>  #include <dt_printf.h>
>  #include <dt_string.h>
>  #include <dt_impl.h>
> @@ -2235,15 +2236,34 @@ err:
>  }
>  
>  int
> -dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
> -	      ctf_id_t type, caddr_t data, size_t size)
> +dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +	      const dtrace_probedata_t *data, const dtrace_recdesc_t *recs,
> +	      uint_t nrecs, const void *buf, size_t len)
>  {
> +	const char *modname = ((dt_pfargv_t *)fmtdata)->pfv_format;
> +	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
> +	ctf_id_t type = (ctf_id_t)recs->dtrd_arg;
> +	const dtrace_recdesc_t *data_rec = recs + 1;
> +	size_t size = (size_t)data_rec->dtrd_arg;

Use data_rec->dtrd_size.  No need to use dtrd_arg with a cast.

> +	caddr_t addr_data = (caddr_t)buf;
>  	struct dt_visit_arg dva;
> +	uint64_t printaddr;
> +	dt_module_t *dmp;
>  
> +	if (size > max_size)
> +		size = max_size;
> +
> +	if (dt_read_scalar(addr_data, recs, &printaddr) < 0)
> +		return dt_set_errno(dtp, EDT_PRINT);
> +
> +	dmp = dt_module_lookup_by_name(dtp, modname);
> +	if (!dmp) {
> +		return dt_set_errno(dtp, EDT_PRINT);
> +	}
>  	dva.dv_dtp = dtp;
>  	dva.dv_fp = fp;
> -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
> -	dva.dv_data = data;
> +	dva.dv_ctfp = dmp->dm_ctfp;
> +	dva.dv_data = addr_data + data_rec->dtrd_offset;
>  	dva.dv_size = size;
>  	dva.dv_last_depth = 0;
>  	dva.dv_startindent = DT_PRINT_STARTINDENT;
> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> index 9771c4a8..4f4386a5 100644
> --- a/libdtrace/dt_printf.h
> +++ b/libdtrace/dt_printf.h
> @@ -108,8 +108,10 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
>      const char *, caddr_t, uint64_t);
>  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
> -			 caddr_t, size_t);
> +extern int dt_print_type(dtrace_hdl_t *dtp, FILE *fp, void *fmtdata,
> +			 const dtrace_probedata_t *data,
> +			 const dtrace_recdesc_t *recs,
> +			 uint_t nrecs, const void *buf, size_t len);
>  
>  #ifdef	__cplusplus
>  }
> -- 
> 2.43.5
