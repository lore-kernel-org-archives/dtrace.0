Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673C1DDA20
	for <dtrace@lists.linux.dev>; Mon,  7 Oct 2024 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728328213; cv=fail; b=QQXA3akmxVjMBmy43P4Ydpn4IgQh1JdTGyykJF8tNz1Bzkmo4Ha8AcSYkXp5V5RR4M+dPjVWipkETt0MOLuqpw/gSxVdzexCXSsxz+wDtrhtB1oMS2BQXsf4iQp+bjFq0/WkUe+nfQ05bgbj3rFO5+asZHF8rQTi3Ot0fbvKB3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728328213; c=relaxed/simple;
	bh=20P7FssyF53Ked29qIFSUXJNlShYoR3htJQtWEZ0Pjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lg2g2tN+DHwxohTu9pky9K6QPcSS7EpnApsTExOnvu8NW+oJqpQ1nhgUwQ9bO1MVmWHV799eYwf0pTKC8I4KjOaGvS1onoRnWOX5GZGoXen+UZP/o5NyTwTTFW5OgJ4gmMe/evLaGn6xAEzgQQeXfxLxXfRDztK8Meaownt2fWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wx3rywyz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t+vxYvtd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wx3rywyz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t+vxYvtd"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497FMaZx022215
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 19:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=02iDgrq4qxaQAaJMzk
	9+BbLCVC2z90kjqYRzU1+O4sQ=; b=Wx3rywyzRYHSF2M8paNNDJOJQs5Isl1uSH
	+x8Ek9K/kAiYi2VEwiD3exlsMTpuKdtUO8cOVrP1twGUEOxzFd2kiorMjVQCSuub
	Dd4hoH1SFbVvTQCpPYRBIAA7ZIocuk+xZe963NuKhbHXKR+CiCSZPjJFkZfCwphI
	3XHJx9LQJTCd5MtXBVD6aFso1HGUreS0de+Wp8cCxKiujXF8ztPEHE/t8FR7JL9i
	sKnpVTHYwFSVBCtdxzkgF1cVOCrrbr1pi53ZcsAM4fmApxn3QVJhcPNqTCekPHJG
	XlsdO82PlBbYQ1RHQckJw44YeZQB0eIjz1YMTEiVEy/YZKgTNWZQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 423034mbcb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 19:10:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 497IbYC9003108
	for <dtrace@lists.linux.dev>; Mon, 7 Oct 2024 19:10:09 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422uwcfsa8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 07 Oct 2024 19:10:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsk34L94FeaDamTxedYMK5LpGquwGrhtOc2Vq65IG2TW48hYJnW4aqV2mOaxSGGEGBDZIg/VADeGCd1RaDmkW7TlEni8UXnvmxjSWUXK7ptSabmEbl3iwxpwpiycNH5d9SaJR85NuI59OS+KutuvEcaOoDJPWc8blXZYkXNbrOqtoKt18jqilyyBxb3sg5gv5xqJyAumBRlQpAdfXwII6xu0wXBVf6v+fKOx+ZDbdB1JQWFxfQ9bckcGCOkh4EBl+Lh8+jtU6BGCmOeh3K3ehmzKWMX1yynFLLeSUavaB+fALRYiqlSKotWOIEYKJdALjQ+YMD96GlkEalhzPCBMUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02iDgrq4qxaQAaJMzk9+BbLCVC2z90kjqYRzU1+O4sQ=;
 b=oeDgEGXIM9OwL8wbJtpg7JeeARqpxUcrq0vUjEwUHyTxDG/90Q0GCyE3JaVZFdiwXnhaTOQRkI26+7mCjkNStWIjC/UE548I6Ws9HpOx1qhzGsQCm/rrgdLo4z1ymVOa0steRst27uNIdgTuADYZ2rqe2uwEnJDgFkbyLn6YQc8eyXhb6yu7OmDXuG5cWtVWN4F5YUQsjL8vk75QzasnMb11BrH+0BhFZtPMmu1bgOyaRecXzFVFs1aDElpGlBS7ZPXZDuUNG5J5ewEa0gqrPbPXn5D7kvas9u5Kt2V1uULLI/fsfIVHrit9JGP2VWlJbb9fOEQECqI1KEfLbcxi5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02iDgrq4qxaQAaJMzk9+BbLCVC2z90kjqYRzU1+O4sQ=;
 b=t+vxYvtdFWDpy255fEhol/eGGkuedfhWJwAmL8q2kt3lSA40zfvzV6s7DaTgjYRh+0SD4kEe5hYWgzlGs/2Xf+RYY50JS6ZjGZPYFL+ZwZIcnSyAGXjSs0n0hiY6BAfjy3G5RuoOu3daqalfoEKou+Y1BpWIerOuKYW0hGwABs8=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CH3PR10MB6786.namprd10.prod.outlook.com (2603:10b6:610:140::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 19:10:05 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 19:10:05 +0000
Date: Mon, 7 Oct 2024 15:10:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/2] unittest/sched: remove dtv2 xfail
Message-ID: <ZwQyCsh6OEy1amp2@oracle.com>
References: <20240628171634.2801954-1-alan.maguire@oracle.com>
 <20240628171634.2801954-2-alan.maguire@oracle.com>
 <Zq1Rhz25fVX5eb8h@oracle.com>
 <Zr+pbCfu2apcbDAd@oracle.com>
 <Zr/utNV5KswtGN3U@oracle.com>
 <3a029e65-1c85-4808-bdf5-683698a1c85d@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a029e65-1c85-4808-bdf5-683698a1c85d@oracle.com>
X-ClientProxiedBy: MN2PR20CA0043.namprd20.prod.outlook.com
 (2603:10b6:208:235::12) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CH3PR10MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 573edcc2-36c6-459a-7f6b-08dce703a722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L1aTWX/e+bVRfJEsFTCM9PXnXjemAKQ2S9uFeG9XuroQipDELsALUxSb/e//?=
 =?us-ascii?Q?DbSbnfzP/jQe9i157jcCEwGDTxh/QxU+1x5E2285VyWECiwS8nlkjr2plxxq?=
 =?us-ascii?Q?na6NxISzY3OrndvEavBAbmANIY2G1DDuA1WQZy1kFf5mmT7JSszQ/Djy7CpL?=
 =?us-ascii?Q?c7GgWlTL5g9uUSvN0eYC6S0Lfi+yXGX57FYSvpdLwSLfMYeVzCId2c8pntIB?=
 =?us-ascii?Q?Zt5sr7OxFXw11lQdIVBqIy8zLBG6wAgd5ezY7RJw9qKGu7r591l1Tz++7ri0?=
 =?us-ascii?Q?tSSNwsCuFQJoPVfSOvS+wQbHrBbt8cHtDas2joymeTSRwBWJC6BeGTTP46RZ?=
 =?us-ascii?Q?6v6S67WnZ5wUHtu8NmRImmmlmzP9dwLPjj76y0O4TmzbMVbHxr0M+w8jbbbq?=
 =?us-ascii?Q?pJpN2n1HuYEasfXBFvrCAjqEAfarGJk/qASpmKHBB+XHtfVYm58blug8cwxN?=
 =?us-ascii?Q?e7R0z4QtVd7D/UWSSFujbAZnqqZlHhUKGZYWe8nN+kMmdLac6+9vBbMX7YZZ?=
 =?us-ascii?Q?cikMg9y35LkcPLYOf06ZyQzK3hnkXJfRBAYQ6AFAvZR8LQnv1i5Rc6UYnltG?=
 =?us-ascii?Q?x7Mr66rh8BX5liwPnpo6hhH9t2TttxTj/IbeVzdC4FyttYYMP5uwOd0KownX?=
 =?us-ascii?Q?7GREbaufVJOy81lj4t4QjO6JSH80G5+/hQjHEwmlV0lgEOYG3mUG9PAqg9CK?=
 =?us-ascii?Q?usj8loXftwAJLjk6/xE/obbEzLO3esP8xq6H/slfuMQKlLS7v5lqi0YC1QEn?=
 =?us-ascii?Q?N8ed1QPQuSsxEjMiJLccTqiLEKXzLjnOhzrjtYtgJPK/5qhiZJxpRirnkKdR?=
 =?us-ascii?Q?mICmmdrltrypDwujmk1bmrhMGt3xojEpB9LD1YQcA1+/ZCsOBB4oA3yckhs4?=
 =?us-ascii?Q?OnSFtG/qorz2P0aIyIsKz4MSPvTNhE9/7Aw0ys3aw+CnMVjHLdStxbhzo6/5?=
 =?us-ascii?Q?n3ws1PLoSoo4uuq1sPk8sZRY7Ql40DCStuVNBOuOx2bXs1TuRaa3U3Ds0juU?=
 =?us-ascii?Q?DYy8pCzKwJ2QCOjJgA85RaIQu0WELTYJN9fhHKfyg54rZ4/HUVIUZkWXUCpm?=
 =?us-ascii?Q?qXfe5NpRrh1kMNnDWeL0gUWJl9MEIHBeT2lapcd7ASlOCogF+JuHCwNA/1S7?=
 =?us-ascii?Q?RwIl2aWSjEDuVCV6065s5sOmJo7jbbP8ETTzrgiR6uiLXEisJ/X9b3TspXOl?=
 =?us-ascii?Q?IgeHZjMQvDU2YtvRgP1USIPRvqUtB/zQnY69aMxqa8p/BKIq+InKFBPRtLNZ?=
 =?us-ascii?Q?L8GpAj7w+vCu2xXhIu1u4LxNy2WkBycj+uIZDk5Z7NVXipvUMwm0hDOdjXMp?=
 =?us-ascii?Q?nbA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Gv9FFTjhJf4QRGtGjIuBz1QB9cnUFwmhnsgs2Huh+w+brJUbjgDWC4kTg/l?=
 =?us-ascii?Q?i7enRoPM2sKFGL4vH2A6IROZSVwhSva2Gc97hzZytc31yn0dM511jao37uAX?=
 =?us-ascii?Q?6bXa5XatPw/ZIiA/CXbEt5G20sOHFB7DbQ5y7X/YwRH9AbSblJxQkqutWZAN?=
 =?us-ascii?Q?BUNZyPRv7sh4cWT2Mckgkk6Kq/NJ8DMh+4xsVP6TdwcVqv2qi9uT0GlkpXyD?=
 =?us-ascii?Q?qCItZIuttn4ZaI5j4H0xl0rbbEKWHO/ZOm0QLdjAaMUgCAsxDlohiQYciTMS?=
 =?us-ascii?Q?TVUihvaAkxVPD6A11gQuns8tf4PcBi5+20iZqdKOyEIEfd9Ia4P+MFDxPDfu?=
 =?us-ascii?Q?3+LTG2shG0+PypsxMGCzIFqyCXecAjzX/buj/vAIIeElRAHpuyT3mwNmnTjw?=
 =?us-ascii?Q?B2Mb66OB2+6uU1JOhXoCY764LCqZrOEVr3V4l8d1wSawErEpXMPmy4P7AxC7?=
 =?us-ascii?Q?0620XbTzc7UPcf2hrjuy7j0mGZf5FYa8OK+amSh73S2Dmh8mPzm2V1pwRmiT?=
 =?us-ascii?Q?kf+ZELJJlLYslHqUAFJzLoCCXD+0lsszmL8mnRfunL6U6e4zMg9Hu9AN0zp0?=
 =?us-ascii?Q?LvIbZG7OvSYNBgl8PK1n1/vaYbjYqwWbtXlZFjJ70Xl2hsZCKx904QWKcJz8?=
 =?us-ascii?Q?1XD2tAqwuvtEzqbINOoPVnX+RjqFFfeMXE0h6/9sChpmWPkYCubB2C6mDANt?=
 =?us-ascii?Q?j5I36D0mY1H78UmGMKgoWRzH9L8A5be6UwOQvzHT/i0HSbp+AoGrtaXwBzJo?=
 =?us-ascii?Q?oma8TNGS52osaAr5YBh96dsDgvhpgkjL8qZF1f/+t5UBdrWvP5zSPOPGRu7I?=
 =?us-ascii?Q?w+nxp8B8xfluK6oW1VE1zG1EG/zoFbxSxmQRSdVXy4u217fP5g3QdOnxUYGg?=
 =?us-ascii?Q?uYdzzVCp+RfghLo5x9R7a7DTxLvPV8nycGzo3Z9GUoY5xoGC2iVr5DpUXUJ/?=
 =?us-ascii?Q?feInhWJ14w7KcBHS+vGaZx7cUTXXHjXrqqWXxlzo9subOo7cAClHCGYdmRZz?=
 =?us-ascii?Q?ozXp9KNqq0Ducj8ZPXZIalU0coftn2jNN+ByPHaaJnfPQekzMFouo9Gk5eqX?=
 =?us-ascii?Q?5SiKiKxfsros6dee09hw+w2SqT8+YqqxnPEx5+OSR6V06fiBSBrCPXCRuRF2?=
 =?us-ascii?Q?e/SCD+IrOFR4mccTjmKiL//GYvfd6H0BxoncvW3hVMQ5GxiHQn5e2GWPsY+E?=
 =?us-ascii?Q?t0GFytzC0noD3PwkoyoBUeFTUb/r0NI9YWF2D45LiT1AnMNk/BUg3+IpIA+b?=
 =?us-ascii?Q?ujXfzEvfcAbtQbn7k8kvmzyUtlKuq/L+ZGX0V99Shuckf/xAGeFZL4OHdArs?=
 =?us-ascii?Q?QkHMUA5WPaKroJ9Xb/WVwXvVWmVhVolpTdF5x6VtAlqVoi+Jvm/XBBnJv8x7?=
 =?us-ascii?Q?dKlJFJ+/NeEfYOx0WNyiCXLpsvlxWCYJ9vhfBv9MU7udonpe5yLRoVI8Rhag?=
 =?us-ascii?Q?7TtQllWnCw+cFQipCyp5/L33J8emkKqVm6MUGNF46h/p8FDo6iKpA+fGKsAv?=
 =?us-ascii?Q?kAKKTvZr4GExseO+BFODXBLhn/d/9iSVe3eUh311ifTzF50VimtJBLfGpICi?=
 =?us-ascii?Q?JyDUOMxOkyVkBFaMVnwcHxi7Xz1669RcbmBrXwfULVIWu3cBOTQ1A2y1qvBT?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V79Z+qtkr8g0J2vCHyH2TZWCHWt44Ah2FpGPGSosa1o2pYU8OZSJRbZDSy8hD115oQv+RZBAa1Hv2rJ2ZJEYBqkGLoIRbPgXTiHqqAE2IjGhtOmIWtcSy/ft9zsbHduyD0PI2Yv0jzdB2Ef5XUwhsloG47k4sYU7U7FliPiweGWokFDrwFv3yB1wB3mKDFOcJPXJrxL2daJKZrVNOlMgr2pJpsxoI8z5+GrrAhxruTOUjJ5RgxVziwEEFr6NZ6hq0m/vYa1BiX2Ql6t7qofpirQlIkzf7fOv56tnWZoHTxc05RJFQRxJfR+MI3eG7r5O63jybDR9qIht1RKrhmS0APppf4WQsFyaCveBEZw3z0LCfNzDxmQWrsQK4V5EQkevg4Sz8Adkn8TFcAJwXU9zzKG+qZG8fjE6mQFRuPecLgqqnbPAdHYthmMLBvIH98KgTQlwgLb//K/RWwhEA92Vj54z9ITeUnKKvSjhsvCy1SxTzkstKICighWaILckKScHQyPkbgCkcWKJFtIx4GW124tcr4OYrYj+APiXwKfMngNfqlDutSAL4itZCJJVSlkXu2Wphbi+QrTqqrd5sP1FearaSeoKwBIRjjPZi6/xwo0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573edcc2-36c6-459a-7f6b-08dce703a722
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 19:10:05.6346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eN4TyK7sSY1TrqkuZ6g6gIomoswLvLNmUskLsnNr6+SjysomIySSdc6/GfjTFcZdGuDRJWK/ALTBQyJwqpzgi4ATzk4ccZqEaKK3ozeDMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6786
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-07_12,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410070131
X-Proofpoint-GUID: WkTacz5YrbSWqeNykADPSGAamnQNGgfc
X-Proofpoint-ORIG-GUID: WkTacz5YrbSWqeNykADPSGAamnQNGgfc

Any progress on this?

On Wed, Aug 28, 2024 at 05:58:11PM +0100, Alan Maguire wrote:
> On 17/08/2024 01:28, Kris Van Hees wrote:
> > Problem found: the OL9 UEK7 kernel I am working with (and possibly all) does
> > not allow an FBT probe on __perf_event_task_sched_in.  The failure is silent,
> > causing the probe to simply never get enabled and no error reported, so the
> > probe does not fire and causes the test to fail.
> > 
> > In other words... the approach in 1/2 of this series does *not* seem to work
> > for OL7 kernels.  That is a problem.
> >
> 
> Thanks for the report! I've root-caused the absence of the function from
> available_filter_functions in UEK7 and earlier (upstream works fine).
> Prior to
> 
> commit 79df45731da68772d2285265864a52c900b8c65f
> Author: Song Liu <songliubraving@fb.com>
> Date:   Wed Oct 6 14:07:32 2021 -0700
> 
>     perf/core: Allow ftrace for functions in kernel/event/core.c
> 
>     It is useful to trace functions in kernel/event/core.c. Allow ftrace for
>     them by removing $(CC_FLAGS_FTRACE) from Makefile.
> 
>     Signed-off-by: Song Liu <songliubraving@fb.com>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Link:
> https://lkml.kernel.org/r/20211006210732.2826289-1-songliubraving@fb.com
> 
> 
> ...kernel/events/Makefile removed the ftrace compile flags which mark
> function entry for the code in kernel/events. In UEK7 we see
> 
> ifdef CONFIG_FUNCTION_TRACER
> CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)
> endif
> 
> I'll try to find a workaround that doesn't rely on function boundary
> tracing in these files to work..
> 
> Alan
> 
> > On Fri, Aug 16, 2024 at 03:33:00PM -0400, Kris Van Hees wrote:
> >> Running a full testsuite run (and then also individual test) I found this
> >> test to fail on my OL9 VM with 5.15.0-205.149.5.1.el9uek.x86_64 kernel
> >> while it works on my Debian VM with a 6.5.0 kernel.
> >>
> >> On Fri, Aug 02, 2024 at 05:37:11PM -0400, Kris Van Hees wrote:
> >>> On Fri, Jun 28, 2024 at 06:16:34PM +0100, Alan Maguire wrote:
> >>>> ...since tst.oncpu.d test passes now.
> >>>>
> >>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >>>
> >>> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> >>>
> >>>> ---
> >>>>  test/unittest/sched/tst.oncpu.d | 3 +--
> >>>>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/test/unittest/sched/tst.oncpu.d b/test/unittest/sched/tst.oncpu.d
> >>>> index d2c2ce57..7a33bab4 100644
> >>>> --- a/test/unittest/sched/tst.oncpu.d
> >>>> +++ b/test/unittest/sched/tst.oncpu.d
> >>>> @@ -1,11 +1,10 @@
> >>>>  /*
> >>>>   * Oracle Linux DTrace.
> >>>> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> >>>> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
> >>>>   * Licensed under the Universal Permissive License v 1.0 as shown at
> >>>>   * http://oss.oracle.com/licenses/upl.
> >>>>   */
> >>>>  
> >>>> -/* @@xfail: dtv2 */
> >>>>  /* @@timeout: 15 */
> >>>>  
> >>>>  #pragma D option switchrate=100hz
> >>>> -- 
> >>>> 2.43.5
> >>>>
