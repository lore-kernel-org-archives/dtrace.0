Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C310481B1
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909183; cv=fail; b=bLE9NfOlIeO/mVRlSlREnConSktedkIjThIijoGu1l8M8Ex6hcUAtbSY2lunqMI2FL6Sdm4Etec48lDAn7KHKs4i+stSWMFwKkoKAjKDhz7ltNC/LVuz6qZ+2NMaI+H5pASYACD/2LITGLV53Nkje4UzmXoUrL/aNk9SKC5qpkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909183; c=relaxed/simple;
	bh=Xbct6nIGMd/TxZpVw1GBIcAUpb4OcgBoBpon/EnCTBM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e+XU+R6xZNFOUpHlXUYbZ2RxF3JB1rzUC49wH6DtbpkSazF5QZhAlHBJt+JKiFM6g72rx4Sz0kBn44j0pu+fyYvO7phD27cBkIUg+OqlNoI3m9QxQMlfr4XBRVSBLw41h2cnGtm3tET33F5y26l/uMdoVWmL6bO4KHA+JfuSsO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fxo1tEvz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xTo4GY4F; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fxo1tEvz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xTo4GY4F"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fbDf005691
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=DlWV1ukG1w25El
	wneGuHMkEvHPqvfSZc5SttLGJ20Tg=; b=fxo1tEvztAYqeSBdEBl/EDX+aTYSsj
	0d52NNBmXMJcX8SLt/+MV05Os6VnXOVq3hlfEFsjr92wFotRdhb0EKS4CrNFTlAv
	bCnLooUfcNJwHNLJukHEeDobA5CFCoafikitblcsd2AnhHPcC/NjnCx/ev+omVu+
	u79sAR68vul2zJOyEI4q2mm6P4Hmy5HAjYdUXBPC/iVc7WK3iBc3/JFi68Zx68aF
	LSab4u4TZUYqu/fYGBdtRs085tKoal7vhmuzhm1LIyXbJLT9aByppboHKttoL/Lo
	PuGxFLL2Z//gWKMDYJdkCTBozqc+3zQI5nOabbGX0Nh8YnZqxLk8iKVQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu9ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3s1wL031752
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w8511-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9TgwWOR+iMKm2d1SFiJMMFS5k/scslAmh8uReYzoPdQu4OVyvOe8Cas+pI7Ah0UB/sMdNi2R/GEaDfT+DCvsfB2UlO7bjLfjJIq6F60D/Kc+KGY1ne9BcIyhZockoNtKURfOT8a+8/6uLz7Su7idJH3npVU4jERvrIp8rWf4o7nOW/FFbXs6NvzvyMoqBmg/lhKA9cmOIanyDEB4cCRiYXUELaLfHPRVhIwEX2p12/Qbw3wZRRNR6WU+zxr7fu1biS2o9L38EVn9mV0CziOJH+JobN/EbDdWamTzQw2EcyJaZh0v9NU9PWrip7zfw3bxes62P+XvW16FCM6yHs2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlWV1ukG1w25ElwneGuHMkEvHPqvfSZc5SttLGJ20Tg=;
 b=KdLwlBBAWIjRjZGlh8a/JsA9TM8FZt37NFCya35toLkC+eGqwf+CIO2YR+k7LixoJnNi9J3n/B+DAqQJirO1EJHRtUN7uiaMcvKqZzc9XjdBRuHUNqMbTN/XCULui41Cv9M+sJ0WJZixIoxK2UiSwqzIr6OWfqg0myXzw6/hK3YTomO09Q7JSCTuC1kSItM2ReT+pE1uTPmlyjXW/1SzCMO1m1WZinLC+hAvqMaH8GELCfKEd88eRcElPHKUNGOIrkc+U1Ue02xtPukQFxjqG4KJ2pItmw3IqenABWu/yuqN6HFzgJWHSJ1Eq7wpCaq6g2UKNXaAcd4wv6Pj6NymMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlWV1ukG1w25ElwneGuHMkEvHPqvfSZc5SttLGJ20Tg=;
 b=xTo4GY4FY3lDCazAtVAXJj2DAo2Zcw6MnqpKy7tRWe5WSPFHOJOUPJqjqpkZZGLAEudV3cGmHO2JCmDk4G3Pr8ZSXczPMep9ABxsc0ax6VXcdfAU2uQvEmMu/F+a1w1V1ruBffulE+zoB/D3d4CIgt0Sz8zK/EdJpTGQW1Wzw2o=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:26:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/19] Add flag to dt_pid_create_probes()
Date: Thu, 29 Aug 2024 01:25:44 -0400
Message-Id: <20240829052558.3525-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: f3db4b08-0480-440d-54bc-08dcc7eb1ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2UkSUhU7lQ6kofCWJAyPvPaXQzShYW1bIe07ClM1+6DX5S8J5MdELNoD8JYv?=
 =?us-ascii?Q?lYWkUkMh1zGDpPXY6gsIv0rgZbcjlS7N2hKT+1DQaeOdLH3fRPUmIXRF48oa?=
 =?us-ascii?Q?RRyQwbKlGasbh8cIuROO338w71ELaPLzDkatVsjhkMaxrvI6Ljq4GMkFdVmx?=
 =?us-ascii?Q?j5utilMN1mzlBukSl2zMemX4GpRT+PxHYWy18E2IE1iQaIiaSUiVQsFNnZEU?=
 =?us-ascii?Q?kTNy/jVzGl9Op7f6Rt8viDktYs3zV0+t3i+MqZY5vDLE6qF0ikLhIy9kjRM1?=
 =?us-ascii?Q?BoO9lfRIZ9YErI5IxMCZc1freTWdn2eCZSSYE0yrkNgnI2Y5V5kqex4QJRJJ?=
 =?us-ascii?Q?07Hg0nUHJM8BJeGeAtoex/lIetNTeLZ4I2buvqbDt1ZhD8pXVboqn4l9IGzm?=
 =?us-ascii?Q?wVWhx2ZDucQ+de1nh3GJKtPcA2qK3JyCSOTCzfEmIhN6nOLTeVOcJF1cffKJ?=
 =?us-ascii?Q?nW8lmdswt+D+GhFV/qBkSDGQdPNdh/SVyOQ0i1ruPEzflMqvduibnhj4spRk?=
 =?us-ascii?Q?opdi2o9Nyv/WR7NiewRlPfJN1DOnOBM4/OKQB/+OVf67UjF8qBCIJV8KOf2g?=
 =?us-ascii?Q?HkuTeXZ5Yd+6x1edImTIlliZP79te8rHCPOhj+86fF+Ssx5Br7ncFqqsvcJ8?=
 =?us-ascii?Q?gVXSK8fp0hOqLSTSoNWId3u4FoJFW2o7bjeRkxpsZXMequD45H0VSzXxgFNR?=
 =?us-ascii?Q?qYUpETeo72DG4Ks1+7b13EOqL6KVK6gQ/EwGdSja7XbfIEnLJZK4YWDRgnSH?=
 =?us-ascii?Q?Qvmw9UGGFNijiVmNPrOhI4IO8NjL914xg0SaKy5db+MNJ7MsNQgqDdROkr49?=
 =?us-ascii?Q?o7xuMR9f5yy6YIhAGRfjuBdFoDU8ZmdVwvKitWs4Tt5eSuyBpKGj6AgfbdPk?=
 =?us-ascii?Q?sPGh5rELHwcxse8H5zUxpRz7InGVdNCteftukT8cP/MfqiEaDuJHOpAHFmWD?=
 =?us-ascii?Q?NVwqWqhcfvqr6ad9zr3GQKTf1HfoGebmcgR2LfsdQD0O+YqXT9lTndESQ6ue?=
 =?us-ascii?Q?45GxYsso0vq7j6QR2N/r0JgDveV93oga9d+XWmxhh5ShGGpHo0xcBrPt1Zcb?=
 =?us-ascii?Q?d3QHd4MXnilRR+DXBVS/medUiHSJzVSDILg5N7b1Y1Jt8lkHpCcxYKV3MoNi?=
 =?us-ascii?Q?HIq+FP1bIm77MEXH8goQhxPNy18J6aX7vrbEV18oFAPW+pbLw9lBbONH0IpZ?=
 =?us-ascii?Q?n5vL0tDu814Qvc2V33bkLVdHtb4UDYEGDHELe8IudeKMi8Zpmg6q92WGqusM?=
 =?us-ascii?Q?6lFvFziSRqCp5sxF5lBJlEklKDEvOEH9KKA9aO/n1A5l5PfFeuwCA6Vf5jLW?=
 =?us-ascii?Q?nxEJs+C8dSiWGnAd6t83aczFaWlzRn1iF3qwSI6SZf/nqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZGRKoKzZRGHEt21xMNbvEBkFA40NggTil1SS5A/hX0WlSWdFqReu5/iqpOkX?=
 =?us-ascii?Q?Y7BCNJfhOscI01qxUMFnQaZriJ39E1zPiqFOACWa21Et9ljOYUZQzuwqvGWW?=
 =?us-ascii?Q?FlEhXJc83wXm4NVI28h7ok57vNj1k4PeAGGQIn1M3QzGZjFt5MrSpViQODw5?=
 =?us-ascii?Q?pyO7LpRGrdzFgo2eppyjfGbMwacm+2lhzzNRrGEwhHxG+Q7NHEQ/LkA3v7nl?=
 =?us-ascii?Q?H4OSJfBFrxmB0MmWmFRZXhAxBM6izXwMHC2BwtoY9wuJLqd7+BIGw6xkZXNT?=
 =?us-ascii?Q?1I5xVGpFVem6taN6tOqSRb5PD6VbuOlN4ShoiR+fjxyns9SmZ7jiOfR8KbfO?=
 =?us-ascii?Q?MrMh3gkara+/gVQ1GRoC8ns7BIO6ASbbsMZoo5W1rvDet4hxHULRzBSTIzI8?=
 =?us-ascii?Q?z0+oAH1j3WAgscFAeUxaHviysvOt/0khKA7KIElo3fLDU6nsHoUahYEYDvQU?=
 =?us-ascii?Q?1cdYll5f/szB/yZ1f7iFw34PYrvJ8F+KBmj2VMPc2gQIKCxoR5WhZWx19o5I?=
 =?us-ascii?Q?dOJSk3JeqP7qE1YuJMtwck75j9c89jHcT55XfFmfvtgoAjqypnbkpxjYmJwF?=
 =?us-ascii?Q?00VK+0TArw4JyNA6f9qK1nVWa7r2YsMuzApxPjayYIC7aLDdgvRKmh/flREs?=
 =?us-ascii?Q?uiK8tDXMwsSxXzdr52Xj8SEWoaONBm8AQtD4o9oNo9UdHh3lU83LEEErXTXs?=
 =?us-ascii?Q?kgPhKTwI8qDZSLpdJU76eTLyk0YBZ5yBl7zO0s9LmE4ylJD2PlBcXO+HvULB?=
 =?us-ascii?Q?FWib8Na4V7Os7XB0bg+HXmQo5pFdhcdrfUz2uW5kamwORfZiupyg+/ulO6UM?=
 =?us-ascii?Q?40Ke3pqQkJNmjlsROd+s6sufF6Arh4VVGMobrm+DSwxsm1vSdKD6vcE5NIBO?=
 =?us-ascii?Q?MiFw8XN3cOxOO+2hpEZOLrSdeeeEOSZBfyFEXpsqjlLj4bU0Hoy3Cynu8npz?=
 =?us-ascii?Q?r1nlcPGDGOlf6BXHuW+Hag+rYQHWg8tpWekNWO8FfM21Oyzl0yVcIEJ1kqa1?=
 =?us-ascii?Q?t3tgUgT5BZlAB3IVJYO7+qErPq9mYF7ddSghh2RaIBgy/hv8tryX4O0nBvrf?=
 =?us-ascii?Q?Czi+YuX/eIXauQ9KhFnXaIhU66SnAvipBnbjgYXBJKw6TgNUmFd61+/PLlB3?=
 =?us-ascii?Q?M7VdoZHMpPshZ4btEydvuzwS53Zug14DxWz/bi2Adw3r1BEXFVLKJ6Tl4mz+?=
 =?us-ascii?Q?R6x87vM2fowQwESJo9DAkSuLYG8hEW8qZK4s2lsn+yE47BqiAGlakxknPvQd?=
 =?us-ascii?Q?KO3X8BfwZNq9Q6rhfuu9DjmYdxWNyYq6dpmc4MxHulp1QqLL+fEhn13s1uDF?=
 =?us-ascii?Q?cZ/OJzeo1SmjhTYU8HHCEIaeIM5UZCwpnpwgkaumRr1GWV23yCDB0ZH/HSY9?=
 =?us-ascii?Q?6xmAD+V4/uzavlThpei+/gWaAOoeOXRfaLQexzMVED0WMd7j3IE3fQZ7HdW9?=
 =?us-ascii?Q?EZ/vf12h9MoM6QZseKBq2/E5IighO7zS+dn+o89n2p7AE55PSx6SJFHmz96r?=
 =?us-ascii?Q?UaqMbZtq6vq3dNwJ2/59iCMWmrHXrkfejvwSVCmVcnjIET0y0l2KjGdgX5aO?=
 =?us-ascii?Q?LPZe7DFaRuzvf8sADgSY34tBzzB5Y21JArkUlaos?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PMnUijEvJa78poUAXh1dC6/1gPEl8jRndyvPry3GqWuQdsWqRwmhVVhDoUOTYtTjgQZu59psxk7IRmj/egsHFGqlSGm6hQ7qBgHgftNalPmPJnE4AGySRdJgQQNvYAnAQ6mk6dezICV1u+b+i5YgG/eNDGmjBvfl0MQq+feXqo38F1MVz9yXUz73vqQd2CcRHJ4614uJVBZ3VQuwyCVli1nr0KI9RPbU7qZvrmn9FeEXcjxyb3V0sNuGuGrlj3qnA7owuQGhQmQX1VeCFUdzo8778ecS5vDR9n5L9N42tgYal7NHyjIrG9Qgq7EmmoEQMzHJhmxPlH3FzFOOHT2oNEA12Muu8TUjABVRTMaITVtfNI3GlOQ8P5+iA9FMVdkALsYXimuBe3vWKARH07sKQa1x+ystnHLKVk0HRmJJfOvNeHPUImH68BXY59cP4Axy6q3LvG2dbJehqOHg4KYhbdf9l5P2zA/YDDJG16ruFLgvi1LU1H3bgZSZbM93zfZjKc7iK1GuJ3eEcMmkHlklHItn6vMs2TJgJPuTl0s9FcWxzOYrGvb70aetJ4blthUtGRlU34Lxey+zVlzHWz9kVrgTK3ZrYmEvv8Uzp2takmw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3db4b08-0480-440d-54bc-08dcc7eb1ba2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:17.5182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsG7zIqrQn+sWaqiQBk0aoG7JTt0aXxV0TQEdeohapwWtYprWBK1RfxMpxnw+Ql5CIpF5mur8IziAvyxV7NdhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=862 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: NkPw4UM8kf1O21GHUJz920BksDSp1dPg
X-Proofpoint-GUID: NkPw4UM8kf1O21GHUJz920BksDSp1dPg

From: Eugene Loh <eugene.loh@oracle.com>

The function dt_pid_create_probes() creates both pid and usdt probes.
Once the dtrace session has started, however, we only need to watch
for new usdt probes.  So add a usdt_only argument to the function.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c  | 2 +-
 libdtrace/dt_pid.c | 4 ++--
 libdtrace/dt_pid.h | 3 +--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index e66d76fb..cfd4d3d1 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -282,7 +282,7 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
 	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
 	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
 	     pvp->pv_flags & DT_PROVIDER_PID) &&
-	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {
+	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb, 0) != 0) {
 		longjmp(yypcb->pcb_jmpbuf, EDT_COMPILER);
 	}
 
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 996543b1..3f3453af 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1095,7 +1095,7 @@ dt_pid_get_pid(const dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb,
 }
 
 int
-dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
+dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb, int usdt_only)
 {
 	char provname[DTRACE_PROVNAMELEN];
 	dt_proc_t *dpr;
@@ -1109,7 +1109,7 @@ dt_pid_create_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
 
 	snprintf(provname, sizeof(provname), "pid%d", (int)pid);
 
-	if (gmatch(provname, pdp->prv) != 0) {
+	if ((usdt_only == 0) && gmatch(provname, pdp->prv) != 0) {
 		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING) < 0) {
 			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
 			    "failed to grab process %d", (int)pid);
diff --git a/libdtrace/dt_pid.h b/libdtrace/dt_pid.h
index 497c7751..dc200f4d 100644
--- a/libdtrace/dt_pid.h
+++ b/libdtrace/dt_pid.h
@@ -16,8 +16,7 @@
 extern "C" {
 #endif
 
-extern int dt_pid_create_probes(dtrace_probedesc_t *, dtrace_hdl_t *,
-				dt_pcb_t *);
+extern int dt_pid_create_probes(dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *, int);
 extern int dt_pid_create_probes_module(dtrace_hdl_t *, dt_proc_t *);
 extern pid_t dt_pid_get_pid(const dtrace_probedesc_t *, dtrace_hdl_t *, dt_pcb_t *,
 			    dt_proc_t *);
-- 
2.43.5

