Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D54D33E7
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395670; cv=fail; b=Z+WrExaC/PEXLCI8OmAL902jsoACrfkpcz4KwfCceCj1RZdRE/uokg2KlD3SJY81KAL9ZdCntrqRk29YbYhCFZfmyKEkXdoNIzU6v1xTtViHLRc1Si7c8NIHEWn4V9nqyOHiL9OoiwZrQ3wONJE4sg1VTxfAu+MxXy7zWu/AlN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395670; c=relaxed/simple;
	bh=sUeNYdEsDpMC2gI1t9NvaTtCtyBLn/ONUzn68Nwn5A8=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=HTPpXiTkSUyx3fHup9gtybRgpsevOcE+pMlCFTkqMMSq0F+Z0BoNBLFKNA0ppq7TycDMTU64ca085qc6jPQlQMQkMrzOkhQ6gThm62YgtxwvKW/24Z2G7mCEsNGf5h9Bp1rbo9zYZ4/f7YAb7wdRuRTnCNx9tlKsjVbqwxl/ztU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TcCKmizb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cXzlXZ2T; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TcCKmizb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cXzlXZ2T"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE0mXQ012123
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=qgwQGCiBaS5VTieW6uc1CJEH2Uk5I4HgK6aKk3c4N+s=; b=
	TcCKmizbNvUivKSJS9cBUg6aExCHTRe43In+RQ8puNWFujL4ENI3V/RAq6oKRVZN
	CWEPEAKsI9yfGNo8el7cNrhIaZXcegjMVZsZOIY6mUNeYZxuCiOLZyKQZfITFntV
	sTNgL/kTf7OCKdTRft7stWiBYq1OdW1IbsTlJ4eBxSqWxY3zoMmHwmGpuTe0qIa4
	wcOIlZAeZ2G/G8DBeNhoSLKWGSmi6G8Uo7uEtH7+CviJ99Aq9MEL0nKdaaT9sbZx
	mMZgYimYD42C1aNbFYkqkmykoBKU6BeKuEWY61hunt7eeH+QU61+a5V1DRZ+7CoB
	1qidfr2MsaBU289td8x/7g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1hg3fbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:47:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDDeXv022365
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:47:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxegyg0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=el5e1Cq6bKFUTX9arFEHoTJKXFJeyz7KO9PQT1BfGeSYP79TzF91i6cf/Jw/0tcohruTPq7NdwmJOJgCcum16xNwOkqCBZUIoCJCs/aYFAYD3x8DR9fsQ+fNvyo9FUr0kv4pNXC4FXmeMTMpxvPP9gk16Sbm9q4GnR9boO0zo+t00IoahofC9b6YC8Ui6mzCmFRFaI8MVcL6QiVqCAvHGGY5yYYpntXq/H1sGcFHJxxxzY+84vfNGLjC7Z5GWkk9Bv9sBHx6S5zdCJcMd5B2oXyd6y26Cz7qeI/nTkKqzHLKfXigDmx1mIWygtQA92vf1vNGAMGRvXIIeXR7dEvbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgwQGCiBaS5VTieW6uc1CJEH2Uk5I4HgK6aKk3c4N+s=;
 b=cat44FubaeSn4bbgAdKFQrLcEB/lGm3DkW9fQhhV4d5WJT0xjpVJ3T24eCkvNCPtjPN+L8hwTtYgW5C2fC9LPgKzf5zhWQhX/fzjmT+tQV0Paz50Vd2fvMfTdhB/bByrnGVQACX6a88M3vLu92WvSNmxzN8Jci4VHJrAwPYZIXwSvcZcOIKqhnEyu4jmziY1uZIrV3Nar1gsiWdOALs7x5aLghOo3ghuSRRwe8bG1EEtGuCq6VjYP1cYkEkpM2nwJYsEinSLlwBs7JAt9D6cIh5aU8qCpb3/gmbMEKFeJT+JzfrBf0KtYCgdNPHVQiDphX4Wo4rXSymm6mDnyc619w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgwQGCiBaS5VTieW6uc1CJEH2Uk5I4HgK6aKk3c4N+s=;
 b=cXzlXZ2TFcQtlPSAX73K/UlqyRrlmnwLnRbU72YEVhNz1Z3qaPzas/BRBnTtpGyWNaMlFPWHfr3HjU/GIcL8u5JoeMH1kE6yIrqzlNmdqN6Fu1sJlrtGo/q0AFFHHyoQubkKHcliaymT1ACPQYvYkRRr6SqWulsYUiOS11+BGpI=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CO1PR10MB4675.namprd10.prod.outlook.com (2603:10b6:303:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 14:47:43 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 14:47:43 +0000
Date: Wed, 19 Mar 2025 10:47:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1/2] Clarify how the usdt_prids key is
 stored on the BPF stack
Message-ID: <Z9rZDfeHDnXn4UcF@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CO1PR10MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9dcd45-3674-4635-ffde-08dd66f50187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z8n5x67yGpf9l69vtQjYYZalebWP2GiC/xHS4qw2Bp0B5yxwGCPNvjmh6yLj?=
 =?us-ascii?Q?gw+n0blg7pBYw5IsAyNYH8jPMEjB3/MaG3z0rpk0CP5p/7A03xdKLIvENzdS?=
 =?us-ascii?Q?XFYNqbGg8ZjZ/NdLuWpU89taJDVcmn/7hxFPoveY9GuaMoJ6f++wkLTwmA2x?=
 =?us-ascii?Q?vuU0mTbKLaqtPl1COFTvt0cwtWrKCAMNbFBPrZmGe8ppgLz8KszsPIcD20Nt?=
 =?us-ascii?Q?3porHPpEYRwMke2NbC2LKsx/Jz3LMtci0twrNdy6V5kCXSK7xx4R0RXjsNmq?=
 =?us-ascii?Q?omCySPGbamQSXQgmLakqS6b4s5I60b+OzDYCe2QRPjkUlCtnCqMKdhdq8cNE?=
 =?us-ascii?Q?qr7mn4XV+2Ip1Ew/p0jQDW3B6vSgOCIZE1G61cvtw8DgsNKpmR3efPg/vHfM?=
 =?us-ascii?Q?wUvjfDy25ZfKKj/wycDk+vLKRS4jIliZm9OpzS2IvcZBfMFYzxDm2Lak7q+Q?=
 =?us-ascii?Q?pckGgGIEJpjKKjj65umx/I4/D7rBVbgpFf7pS1C5cNc0/dZUEzml6/3oSGlP?=
 =?us-ascii?Q?9AtvYLx1ivdmEFJkz0h27UdFtX//iqWF5qq8rajWkJhWJfe29Zy+IXVslJLG?=
 =?us-ascii?Q?1qX+5lAcEpvQFyWFpbhlDXJB3vKnfRdWKjkLlWOa6l6JPx9lZXwK2qN2RTTW?=
 =?us-ascii?Q?CrUNtC7BmdlH6HYTJXMRIN83sHxNVP8S7DhGhZH5D87WgWQyXrwecuCATKsz?=
 =?us-ascii?Q?rPs2knmY8qBHzkK7PqCIXXe+ZCNJ68YYq1rSx4DvzBXenNlUkbf9xx3JDZpZ?=
 =?us-ascii?Q?ILxctJXIE6rwN4AQZTRCtuwdAkZOb4EfLHXkGRpDhco2nnP/fH9CeybfbvXT?=
 =?us-ascii?Q?5eUnFXRDxb9noJtkXK1cEc7umbiTk0B2WqRCr2rcpdb0H+PmPjVLUZ85zh4H?=
 =?us-ascii?Q?DUr8u8dzn7yOj4IdfV83pbnj4EZAtdlBkNrd8/98DQuqGopyUusEwRVoa3uU?=
 =?us-ascii?Q?rFGInZdHtaL257Q5YKqlYT49DcfmZvrbJ7Yjr2K6GL5x/VUE+oss8kRfM6ME?=
 =?us-ascii?Q?xGEuLUoyiGvHlwVL6A01B3DIVtBJHWOxszu0H031x9eUF0Lu6+hr7F4f05Xo?=
 =?us-ascii?Q?DpTYpPA80y/isFA6ASbYZIWbTjRYlFCXmPPb3ur05vGhRcHODhzcql5uZcCR?=
 =?us-ascii?Q?84Ma3kHtMph87IdJve4GeUyWBKjWUvj07dLn1+gUbei9nb6eZDPnUmJk8nqp?=
 =?us-ascii?Q?ocXd2iKQFYkCNdq9uyjVspFQrQn3N1rLq/PXsMtHCM+uXxFMXlf5l4XRaHlD?=
 =?us-ascii?Q?oeX/UPB1nEqRcZQUkkEgWcEv6iabKewDPT8qskMTtir2Rp67jVqToK8rLLdN?=
 =?us-ascii?Q?wy9MdEaJ9CKBM8EhpOEaDco2iJm5zCRfM3Q6RHB/nbo3wDvSL8nDTE5K/MSH?=
 =?us-ascii?Q?iPVX8dTP7GdjPP6yfTGnsHjc50FO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PzX+TMldsOSXakhaeAJiiaHy5GqTCdVgt+3We0yQ4UgjEjvi5yNBpYN9nHGl?=
 =?us-ascii?Q?MGjYUJo1Lp7Di1QVHagsQ9jmV0J7HMH0vkFBi1hr1c8nWjrd05SfDmKkHCqk?=
 =?us-ascii?Q?rXn4TSxPFMZ+ZB5IxYeZZ/0KrGju62Kts1hoayBzU3q8MJG22sxkulsV8F33?=
 =?us-ascii?Q?glVpPKvHVb5EiinIBZonID/NFDF+0onTda7jMYzJeyu+Xms5PzF2InBdhbwD?=
 =?us-ascii?Q?UVpwknFwoQmkPfPVP6X309ZNYMFA8Z7dNf/Il/I6Hfj9GsWo16wdSLW62pFa?=
 =?us-ascii?Q?MBowtPBEwUp5z/WWPMGguT+14YLKqw5gPuiuWAv8CJZCsdMDjrmt3HjAaUiF?=
 =?us-ascii?Q?cUK+8Ibe5lVPPGxPNurmMnjNylsftmQQgc/2UzeVXYp0631XL78NFbSQMXOk?=
 =?us-ascii?Q?Bov7VdFg9WAi0e5/2W6uysi7jqgFTXyFiqw2s0WNygzbmzMLRvOarVqq8HAn?=
 =?us-ascii?Q?Y1SZ2XcMeHSoy9xKklasQkkhapT4vG7D5DMRPzKs1CCnNzm71gLMqtCerqef?=
 =?us-ascii?Q?juF+XZdX85HI5NkS/esisWvLMtSOYe1bB05mL7vObJu8wxS11/Gm/oAjgq2a?=
 =?us-ascii?Q?K66VooJMKK+F/WQkbUWMUgKSwSrLQmfnlH6CuZ0bvF3M8cMqV9UutQcVQHCZ?=
 =?us-ascii?Q?4Y5jcNhKPlE8AUBqM/YPHiHTessfUT5dRocrHsxqwFIDG1lpouf0y3HVLqPJ?=
 =?us-ascii?Q?OG6dtxduflwLCNR1ceVg848axa1BxsZffIg5q7RJ+aL9VCAbybB17WHMEWDD?=
 =?us-ascii?Q?ZaHwImssjtLONzwxJzQf+PkHPUT9nWtvi7TPdFVlD1gHVR9T7Y2I/igGKOf/?=
 =?us-ascii?Q?vy/DmBhE9FIMRNP2tgGzezSCu10k6tQtMg1OXFKyX5mQKT8ztqllxFxEjOTF?=
 =?us-ascii?Q?6KCZpX+tFnY3Q0O9k9rVMFkBlm7xt2z94KABEnyChkBG23UKOVmGvfs/KAhr?=
 =?us-ascii?Q?wmXT0wx7L932yPGvxGrBlN/NzLeXlKH1w/lvNGW+MBiesRSNnWucoIqgXQ/j?=
 =?us-ascii?Q?dxaVQKh0gLU9KaRZ+c02Cqo8O9w8ELmxpELwibbSEk5SNGvDtPPuEBxUlhrC?=
 =?us-ascii?Q?Gf8ly9J+6t9IQ/IcvfUpr2wh8mY7istZQ0GoHyTksRdFQcBvgz3BlApAr4nK?=
 =?us-ascii?Q?ngea6w3wqeIIXPeeW0VKC1vby/P5Kd5AY/P9O+FOkLIoi6pKFXyJZryBZtlM?=
 =?us-ascii?Q?2YhFj43/MFvYKpXlWcpAxeXWtCTJRUYoeBSatWdb1pgZPnw54bCN6JQicgLZ?=
 =?us-ascii?Q?dVbY3RPLK1p34MjtOFnsPG5gddCARvwe9OfvvKu4tHCPtacwPPC6Rdwv+G1i?=
 =?us-ascii?Q?gaD4KPgEw5QfYV2EcWrdyaL4SsbBoWecrBkIiB50tllh0XxnypwPr18zToLG?=
 =?us-ascii?Q?xjvbtwSgiLfqGWRgK7yplKWA4+rudOu1gHYhhrZBpGfamgNlRu9ccNos3f1j?=
 =?us-ascii?Q?BqvvXxn4kA3l3hFwXn80bXSnZhwyF8eGtG8o33vh9dZSWWzqSY+w8NZYDwQL?=
 =?us-ascii?Q?EKjHdveGOO297U7wjxnVKee4vQRS4rt4lhoZCmFlhLvhcVSJ1r6w6A4QkUr7?=
 =?us-ascii?Q?6BkiIKWRELjSIXN2KAECKLD23zmpF7VWf12jzd8lpEVsoB4WROiShXxfznG+?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Vmc1s+ZTmZYUdPA/7VLwtHvHul0Fl0xx8pLF5VcMkoT8Nh5tELQWGoq7LV99QsnzjdxvhgupF5ZZBbdDwwJYDEqpgEj5QCOiqTZu2YVuX83T6wwJdkl+wKSF3kNWwEWRKK3JSMnzHbnazOznp+i/1DHeIvRrmMdRfTW1/bVBiJ4uvW9gEritLkPYFOqhQuW0K0t+Xq/Ae3XcRdCNMmKjsqQVrSVt5AjAgha37wDpwTGP6fV/9fg5YX+kNNzpada8k1AdtsktMOSJoxKDxxdiNDVszITfSQJmlUxwyHZevLPOnUB1Am4B2H1tB9M1kCm0EtZ5IwjDtGaHJ0FVCndTx+m4DK3NVi9OpWUSXwrgfuyTshB/m+3WYEFDhMy7KAz2DzCUr4ZSK+wBMgm+IhAXKQMWA1wbhi5rufxWxb8wpZQPr3N5fnGaKJPi0Rq9WfC7tkQKhGChqrTB0alQzawDrkhWqSf6dmKuCydmuJDNqUKDhANOfn73FDrm9tLRjfHtJt7Ztc1IIcNttS8a0Nq2AyPaA9RGTZkns/bNlfY2U0Yjk8rKrDObOAf/hIR9ScY4+6ljB6vp3rd8F80LmH5dP1pIHLkWt5l5sbwWzSJ1fLM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9dcd45-3674-4635-ffde-08dd66f50187
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 14:47:43.7181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7m16cCbLKi7Es4T7gBrc79ttEMSotY8Ty11B4T3zY4VTZHu/2CnfEIZxVSAjs5YsVAaUdcSbtVptFF67T43mCFYtg0STJhP85qSL+Pq6hNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4675
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_05,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190100
X-Proofpoint-GUID: Ydm7H9WESygQEPtuhQ9IQsfEFNifNqpl
X-Proofpoint-ORIG-GUID: Ydm7H9WESygQEPtuhQ9IQsfEFNifNqpl

On Wed, Feb 19, 2025 at 11:43:49PM -0500, eugene.loh@oracle.com wrote:
> 
> While one can access the BPF stack relative to %r9, the whole
> point of DT_TRAMP_SP_SLOT(0) is to make trampoline code more
> readable.  So use it.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 5d9f74244..f1323cc31 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -1015,22 +1015,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
>  
>  	/*
> -	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
> -	 * will be used on the BPF stack:
> -	 *
> -	 *     offset                                       value
> -	 *
> -	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
> -	 *
> -	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
> -	 *     ==
> -	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
> +	 * Look up in the BPF 'usdt_prids' map.  The key should fit into
> +	 * trampoline stack slot 0.
>  	 */
> -	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
> +	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
> +	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
> +	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + sizeof(pid_t), uprp->desc->id));
>  	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> -	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> +	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
>  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>  	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
>  
> -- 
> 2.43.5
> 
> 
