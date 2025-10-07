Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8992DECB9
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759851542; cv=fail; b=M2UhYT/8B20uJbS+1+3+PSxwGqUMGtN1EwJ9RqFAXXqLuEZza0kJ8va58p+NTRf3gD42xOzYxbxARbuGAD08SJKJDH8NeYFbd+ZpIxUUxMPOTNA5BEE0FNLAF7aP42A/Xf3AQpcjr4xTyIza2vi+HbeVjcF/Z3GLT2BDvljd8GA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759851542; c=relaxed/simple;
	bh=U3mciXOCmIQTXKNTLGQc5g84t4zhPSgHL8AEfIYzMh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oKPjGSCu0iNf8A62rxy+9TJ81j4ASRVgsLVGERZ3JLgmqxAuq9T29doG9cUTkBfRO3UCc2bRyrGXX5VB0ltNxDg7KEfKum3f9/OEhsvfau7Rr7Btw6WM5R2mhTp9xlgvuJAi2AyHBDZOgL4XUxRt/dGtb4tcBQeOZU63CF4HBsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NzQo72Ux; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fKqiftnm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NzQo72Ux";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fKqiftnm"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597Etu0J017141
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=WCpcDqTUMKOxvwx7RH
	rTQOgQl8aPbd2zTwCVj4svhpc=; b=NzQo72UxDm84IfbA2Z/4Rl/5vQhp1UJeSd
	bGdY/cHUKiXn6dXIPuk65qsie3BCekFi/zeSl07yexVzP8E8UpjgIBdacxALPgIY
	I/abZ+mnB6u//qoG9KdWO7TMtwlN1Q1PnD/17KhsmQEQksukOxxQYsLyu9i/Die6
	iYfv54JhxxA4dkzwFQcU4Sut06mCbYHrkpgiAqwmRG0RvFA+xGVThciD7BTArpYQ
	qlzjjnLF5mtL3SXmYIZHzXURrKnjdNopXCiCUcH3Q3LD17tBcMB+Np4nYGNLDA3X
	p7Lpe1wtx1KTpiYHtIrLAUPW6fAeJndOXQ2nJVXsnXbX0p04m7nw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49n4nvr608-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:38:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597EShQ3021442
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 15:38:58 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18m2df-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 15:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euPGxYuf97tgRs4K7JyC+rdrlIezd2nhGbQMGVn1oO6Oe6XuMUHoIHDDqyyb1vuPees78HffenSGx/HBQhSbz8kc0qdXdRDKieTmk+3C/PPpqy0CS7ZI0n1olEGVJ/v3BBuDLJP/0TQAykfYP9J4uGmHe1z0UozA1/kgiPAoxnSIApTy7S29SuGLxjsOUs8rsLcQPxOwhfwyyRGrv8gVzmD1syKLJUNTZqV4HwPXCD83UVzXM/XRGmVVCq3Oi5GVuhWzWkjaOskIHhNULEiz3+Gq0B6ZlrUI6sh42ygiFx1f/zQnaNqpBAPfqyIj50YwHkuUvfKDJ+2jrRvJIXM7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCpcDqTUMKOxvwx7RHrTQOgQl8aPbd2zTwCVj4svhpc=;
 b=jc7/INgkWPHJUhYXKB+/O35IGQJYyvU3muYp0ZwvAowQFpWBwQ8OtixhHOklPhUJ6FPKyqgTOXAJSdCitcg5nBrkFE7V/ZkTGz9oVxxvzyGO7iLggVmAVAU1gD20alcwBXnRdG9qWJ0I59iiZM897A4kkIq9TeSnMC2JLre1qG+hwPdPjgcHM5d0wnpcfNIp6pY0Cm+gvlE0DYrpYqZf6Jq31PoBHAK2hFWKfYb4mMaF60SMO1fz1Kuogfp5TZwseT6CshR3b0t434Li7vPcmwIXq7TAeic8Yrvj2zHFtNHG3jzu4XdIb2M+o+zdGaMKkRYSMiY9XgREuMsHiozo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCpcDqTUMKOxvwx7RHrTQOgQl8aPbd2zTwCVj4svhpc=;
 b=fKqiftnmO/IPni+OPyxWpAg4jPc99OLf/tjbwS0kfARIPrNixMnEesZddhVGCRV3keEtLp42Dy7yOkLT7R8kMOhuctypyhFhisDaPdRyZV3QUU/UKR2nGUnVNXxLp6nRLuun/vEdtw7Akb47K7Lzb2Jl5jrHLQs8L83fUXzxoH8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV3PR10MB7913.namprd10.prod.outlook.com (2603:10b6:408:20f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 15:38:55 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 15:38:55 +0000
Date: Tue, 7 Oct 2025 11:38:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/4] test: Use syscall in case of no
 execveat() wrapper
Message-ID: <aOU0DIiPaRiTpG5D@oracle.com>
References: <20251006215726.8893-1-eugene.loh@oracle.com>
 <20251006215726.8893-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006215726.8893-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV3PR10MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: bba65768-623b-457a-cffc-08de05b79ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?giLub58VO1++9dvCS3GQz7Iof3XovdQg7Ad8yUXUDqZbH94cClQb0NFqTeYV?=
 =?us-ascii?Q?hNkpPK12zFhGSrdcFxfAdySgbMgGz8HgfpsY1VVrLiZ6IFI0nkLlgcD19fI+?=
 =?us-ascii?Q?MKBGj1MHociXUNHXP1CElLDazEObVALIDsMdx6PS/ivbKR+HamxIFgLL4Lu4?=
 =?us-ascii?Q?G6Sw9zt52HfDkYp3WvFOolQN7tHK8DE7el4h1BUOI7HYrfPRitovJrT77Oh3?=
 =?us-ascii?Q?cX9VKpQ53DSYgY0tbwi7opU9koox+ADukznVVebVOn67QYttilRC5pOdVkca?=
 =?us-ascii?Q?U6eFWwKZgjm0d4uHHKpZl6XkAFKASzwW7KImkHp8Cc0zlNTbwXM/zBoSXA46?=
 =?us-ascii?Q?s95wicoTHxpl7qYs23vXAQcjNnxLFMSEVJHzL8F6OQg/3npi+7xAJj2HUgRp?=
 =?us-ascii?Q?DATDf2G3u7CR83F5j2BNbAUfFLleiISlegCGx3bcPXtJThYP30RtTRMFAzp9?=
 =?us-ascii?Q?7kjXQ33Xrg0SCsoTvpV4ZFlf38Uw3qnqyEnDb3vf93l0Rbx83fLnD5NKF/hj?=
 =?us-ascii?Q?YMCwcI+EbazUlaacQ2lsTVxTRrgS4jc4McLSLAAQ0tYXX7O632828+sN2LK+?=
 =?us-ascii?Q?BgTg8kUzyhNA1hFXgcDhqWjMWbQDQu4TN9gH7Zwg6P/rwA7u85uWHjdav60o?=
 =?us-ascii?Q?min3nIGmcqfOUm8fAKuOsyP2sPnoA2IcU+5HSdRd8kvWNLjz6Bb8i+DuPSp0?=
 =?us-ascii?Q?KtvhXHl378g2IIUW566f4LuXjM5FZvTlOO6ZBheG1uADOJTGkWbNeYpAkC7B?=
 =?us-ascii?Q?zQOtwLvnl2XmSrfCIvQWE1QHs9vI4T5d2V7Ca77hMUQseWuz6yHKx3xtkyBL?=
 =?us-ascii?Q?gR98NFyGxOoCGJMzORJvQMM7WRzHacNjIZINfvDxcm59UicVRqAS4IjOGhjd?=
 =?us-ascii?Q?GgcCjzmYNgGrIzJ5caxCNTwlnuvdm97CsiyBeB2ekPCo1XOU3K3UyJKgNGek?=
 =?us-ascii?Q?LRuT+m8hHXMhA4aY+pR4ooWr6BhheNcba9k5E42RqErdD2wIwdNyQZ50rqLB?=
 =?us-ascii?Q?ZOu5Q2UD4dkBC9ZXosATNi49IgsMlyU6jAsT1YTSJT2gdwPUBX6f9dSBOJEJ?=
 =?us-ascii?Q?1zhZPuVk424kweT4SPEB522WVZF/vT7iJyw/ZtS+LVvlBcAKCFWYRMRLO3Bt?=
 =?us-ascii?Q?lfRFs6ObzwPYV8fbyCvTFzC1kwzDESd2y2WLwIrG3V/Q08lF4++aQXiE/yKx?=
 =?us-ascii?Q?iGQvrx1vfB0YzSFurQqTTMPNdVlYnj/KUriMwiRBhd7w/D04fLjIHjwQq5Pa?=
 =?us-ascii?Q?UYs4MnvzDQtiAJXiFTViKlywXi27ZIPTMH9NTvTHr4Tzw00+0oYmZVV8EzJN?=
 =?us-ascii?Q?j8FbLesOVlBgm61maORqYYOBNFY2TZZ2j8Caf3i44UMNdapb2BzBwOyEQlFv?=
 =?us-ascii?Q?VOpZ+kX/yYSs+iC6LokKB/YobxycZFTzscRmo+39WcQrsI4nqSHX6cZQFWr9?=
 =?us-ascii?Q?7IKItPDH2jf0V7UQ2CxzAft2DZgF6pU+Mv1yXjD7fcjTOxactlrFGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E6TylM8LiL3nePXHUq+LO9fmc+5dY9XY7xIb1nwpteqpQNHWW+NT76FTd8PQ?=
 =?us-ascii?Q?06xVkkSjdPoph+1ijAaEs7sk+yJQwWhXgAqJehPFBnQ79q8Vzmx3XU4tXd4j?=
 =?us-ascii?Q?7iYEhS7ef4bV+7mS5IQBh7Jvy3q1dAkWkE2Gj9sqphuCXmd4sfKGOqWlvj9M?=
 =?us-ascii?Q?Cts91F74Cy+ViIy81iL5Ekgy5wQn2Dul282LfCoZ+vXu8LMKqVjFr31hFuxi?=
 =?us-ascii?Q?iRnf4yBZITqryIA2oS5AiCQdls/Je/jHtDV4nG7Sw7cavA7IyGz+cx2lkawG?=
 =?us-ascii?Q?kOfXzYNcoYN5ulTvt4HE0KXPHdAXLtc/+6KQLCXG7BzloDvu70JL0hChLKi7?=
 =?us-ascii?Q?mL6PXvAKF0/WyzbBN34JFbgooMnEHC2duQCD8SA0t8BlJNkBFx0m6yuSNpBz?=
 =?us-ascii?Q?jUIW8w3YITzKDKcewGke3iK1xwwQDEHfiQPP6655y3LR8vgxMU5jlNfbenIX?=
 =?us-ascii?Q?iB7WoCSwHWKxj1YS7CMLRR+I/j+y5pAFEH8whaC+bZGaT7FZD4kDTm5OphYb?=
 =?us-ascii?Q?4+Ez9zS1wVKYkG3PgAxdeEzTmPi5oqc6GBIsUO+KN0hAnQgecroGBYXnOvph?=
 =?us-ascii?Q?yqfeus0Q5e4Z5dAgKyMOifGWgySGACHTDs4X7zHUibJhvOH4o8YFP6sIQ3bL?=
 =?us-ascii?Q?7jYFz4DE9uHGO8NKKqvlwewF8DHWgguXudajChgWrJFDUyRW2MJ9jZQs964O?=
 =?us-ascii?Q?sJzGqp+Y7lPrzfUdBGArXWvVdcQVWrNOBtqLWxKo/kFjKKY+I4UA1mHmYxNc?=
 =?us-ascii?Q?EqZx5p1uPEb0KGwP0XFm1la0u3EBuR0z11VpBSg1VY0c7Zb4IHBaywbD3z6z?=
 =?us-ascii?Q?e/3bSlfadSPsIuJD60AyQtYQEYRd6RnAHAeuxaJqyN1n5Zx+pJ6AQn0eovwi?=
 =?us-ascii?Q?cjxhiSt7ZSftYQOBmoSBSlE4LmAkc8ysEEdjS1aNFCXa+yUxengWIn9MJR3U?=
 =?us-ascii?Q?gXb7ph+HvnuqzGIsAvuFnd7Jxo5TFP6gMEBt7K63h0mVtuD3eRgU/Y7HHaEy?=
 =?us-ascii?Q?hSW1r7eB2NCi0gA6PFdk3nCN/rwPrKoiVSfYDtCL3o2POVogkTAALZEQHWiR?=
 =?us-ascii?Q?kQxnRX1j0oYyuApRZ38ZvG/2rosHBLzWRqLuEOEOm6QZgDv3Ncc5wGRmbqxu?=
 =?us-ascii?Q?cUREizn7zKfBznkzeL4fsPtoZHJ0LkhuedOwlBaDctZCihyMgAegDPrlJyWL?=
 =?us-ascii?Q?q3w1KOsMpZytBn8Cl8gx1gROqpldM6z/QAZyuXLAA23UCojX2/xOhzPX/Q6S?=
 =?us-ascii?Q?jSLxjNxqtQpyUz/aOKLj+oB7rjgD0JV/ROt/PT56eqpCCtzKLF6pPG3p6QYi?=
 =?us-ascii?Q?uvXgtZkVI+DrnKrVy+iGCF1+I6LOo8he4Jev1JOLuSjkbLIT5eLdWFR0R36O?=
 =?us-ascii?Q?5cCiuRZ+d+Y0zRbXe9hL0UJ6xGG+6luZllv4m0MRvT4Khn7LVadoDqJahmvU?=
 =?us-ascii?Q?E895Ug5KaBubTps6wejSZ9ksO9xoOxaZbszaPPNa3kKCpAWPzc/KUf0hU9lp?=
 =?us-ascii?Q?N9aXXrCh4ldmkdULP+7S19YzR35y0HElfwHUTd4srjAkikoYHxwYmvbjv2K/?=
 =?us-ascii?Q?vIoOj3866iqsDfB0njIhcLFmCQwf7bms7eXxzemR6phJ9lnBfHyXNY0keyT8?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dvfy/CIX2JWmh/sFbsX/WhH3FjddfSjynQOXcHiVkMQDRgYKM1JgWp7cQuvYodh6xma6vEnxRsrE/6ODpM748xPWdt5KX/cZI9fpBKj1184NNon4gzHY151dmbIYrGDWaLXikn7vZkBPy79fWzZ3JjDb1+G6d5yNR95PMgctHoEKSx6isEQ2M2JLjfLcdMpJz2hnHeyTr8Wq+3pWJ+GGH47tDiPGSFql78UjFCr4yPivJlKq+Z78+McaTCPshvVtKvLVhPefu6Tukx4/WZaGNrUgcoYDEGAkKR/woYyaW3CfAZ45lADZVHVc6OuDKYk2USkcdQotaCScMiHV80d98tXlKouLT+lu17MLNX4z9nn0BN7hY8vBOgp4ppiYAuNIsOHq0Au5+YSnt58av18fuJiDmegj4DToD98zcND2ECFrfzejXrJnBcHLPLb8hLNXSTMiFV2qdsWkiaxugNa8fj+2M2vcGXYkAYjNUXDDZ9TG/qWSROsT+GtyhU2mICH2V5YUhRO7q+kWTtXngnhi2rXFuUPmFZbC+/F0c12XLgTKSkjKBobb6c+b+evpdFuYGR0cazw2meleNfZAHjKMGVfgPpRTOoKWvAIhOE4j6TE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba65768-623b-457a-cffc-08de05b79ff3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 15:38:55.5432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLvTvCujYHJm7hbpiYNeot9T2K17xupzK70sA2vGt+c/6e/GBH+KrE0mGoW8NE830lkbWRUaDPO/KrMHdAt7A9MMT++rS4JVzmU1fWRbQVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7913
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070124
X-Proofpoint-GUID: dIiKkIT8PpPZnyv309o3csthloRle7RE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDExNSBTYWx0ZWRfXxGgNsyfil+9V
 hqI+edplOMeFpJmPu9OWPxNGeA4HDqOl+QpgGEazSz6yEZ89/xFEJh3zsjHP7ATqYVeM0MzDP+N
 m07sc6mWw8m0Kv0pu6hOTkXpaS36u9taWiFqfG6VR2FG1o+7HmBb9PUqE9LuseqBtGVbs99Q1uG
 SevzOKyInuyPevBHxrqsHthk5E8pkDfUFf3V655h7+z4dWqH8P/JU6Bt0NEpaTN8qJLnhRSZsgu
 Sd8hLY9yAcdpWSA19Vy3wzETNcmy13CmTMAztpUxDkN9GyVA+ytrd0O3ejWDXo28/SZLk8Ne57k
 5FtuAYNhA2pnVx1TSpJrugTFaS5US7gy34eg0oTMCd/sAqmp1MuLZIztF7rihk9XTve3xh7sshb
 BjdysB+na5i1RDdH83/uMEBkB2P/Nw==
X-Proofpoint-ORIG-GUID: dIiKkIT8PpPZnyv309o3csthloRle7RE
X-Authority-Analysis: v=2.4 cv=Y6P1cxeN c=1 sm=1 tr=0 ts=68e53413 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6mTWHuwD_vXiDxj2cUwA:9
 a=CjuIK1q_8ugA:10

On Mon, Oct 06, 2025 at 05:57:24PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> While execveat() appeared in kernel 3.19, GNU C library support
> came later.  We are still testing on some systems with older libc.

Wow, we do?  I am curious where...

> Do not assume libc has an execveat() wrapper:  use syscall().
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/proc/tst.exec-execveat.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/proc/tst.exec-execveat.sh b/test/unittest/proc/tst.exec-execveat.sh
> index db68a5043..e4b9dfa5e 100755
> --- a/test/unittest/proc/tst.exec-execveat.sh
> +++ b/test/unittest/proc/tst.exec-execveat.sh
> @@ -17,7 +17,7 @@ cd $DIRNAME
>  cat << EOF > parent.c
>  #include <stdio.h>
>  #include <linux/fcntl.h>      /* Definition of AT_* constants */
> -#define __USE_GNU             /* so unistd.h will find execveat */
> +#include <sys/syscall.h>      /* Definition of SYS_* constants */
>  #include <unistd.h>
>  
>  int main(int c, char **v) {
> @@ -26,7 +26,7 @@ int main(int c, char **v) {
>    int rc;
>  
>    printf("exec\n");
> -  rc = execveat(AT_FDCWD, "bogus_direc/bogus_exec", argv, envp, 0);
> +  rc = syscall(__NR_execveat, AT_FDCWD, "bogus_direc/bogus_exec", argv, envp, 0);
>  
>    return 0;
>  }
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
