Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEFE15575D
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 19:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724874099; cv=fail; b=fj9wtUCJHhAeKUIx0e1DIUzjTcvEWq2FJrD5Dw17i01vefcS0Dn7OJ9ByByGigLI8otmY7Bmq+VrVBkVDGVSCRgz6MZevJTpqkFmI0lOft/soU2yhEyYhtyWV41SAmAUgvkH0LpBiF29Ic/FaHjMytERPBPSkI9wwutfl4CwnaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724874099; c=relaxed/simple;
	bh=Y+4fsAu6tQp3oDXgz2vaTiq3Ig1Hi2oIGBgxCMZSP+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gRt36okvOhetPeomEWXqq9vMYhXgiB+zLUCgqqQXSFvhD1nRpOwhfs2vjrAKFo0nVFqswFPSN/IjSRoPryFfaXnfYrjIDcpKh6+RG8UmdwJC1S1/D32HrjNrFkHK7gAN3T/yS2WC3iH90kIUXZ+uLGPRl/eUloWZvj6lin9l9Tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WC5orFps; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xOrzjuJ5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WC5orFps";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xOrzjuJ5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJYO81013600
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 19:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=C7L45jTzq3dVmAh
	hv7Vp+bzeybTkNriCZYdcItfW0yw=; b=WC5orFpsS83w18XPngFV7zzRo7Kk+U/
	gdC9TdK1g/q+bfftsoIzbv2DRYXie6bG1D6NZz/FxbNDHYVnu5OmokfiJyS/WVkU
	WTQUjtWLeTW+h4GYYSfqSKWUUNJeXJOdeSXPH1Yu62odXQo3njFn5Y5NBHsPGbae
	0MLkKf8Ddccg6m8Q3/B4JvENe6G8jBr5NJUMgwGegssrtNDpor5LavkCKkzolnqA
	IqfilGqjmIlrw08+PfIOwUH72kNUHepPAsZ2gj6Sf12jWcg7eWtMtWZBoPbAa2yd
	LqGLRxBOcy2zXKmrYvbmYsuCdADWrMQGI/bUhfnf25hcJnxioVFoX0g==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pus25y7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 19:41:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJKGcp020291
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 19:41:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418j8pghq9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 28 Aug 2024 19:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFMQYGnFU3UXOFD3p70n7K3xwAzMlq2hZ77Cyws3zk0Dm/D/Mp4IY7puhc6IyJaPIndKuXb5GDmOaNWhUes//K2dPbY6KZQi9mMB0Ef3CuuzmXBM3MN8+odbI6hp6/GTLKa/BSAhxgvC1Ch8yw5xZEYoEJGzpbRcuImn9u4skbkQDmbpwqXJyKIbFoDAFYEdmloQPum/5Njxo45QwC0ixsGLR3VKTnQ5VwHABqeufBW0qsqNVbSedJgYAHedvDKV7qJeMySzJqMibcFBVp+EjB3rHkWEGJyXZtbRiitkdGF5PoxX1jswribcxZonDo0s8CBLaLty3bx777YBlJ3n8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7L45jTzq3dVmAhhv7Vp+bzeybTkNriCZYdcItfW0yw=;
 b=Rp//OpQK85ymb4WtnDHMfqFGRMfHUrHJo0unHZiXoFsSvMKlGwBNAz+Aqf432tB8TB4NzEhF9z4G8/HK+P0+BlkF4xwVsGpKomhWtBCqiiAcy8rEfrbbWq1dd6NE0/UYJnCyO5LUOlZoJ9Y/GJLRaygV7dsm/2gafx5pFHM6QdIo2rHlrmfQdNJbG8GfwhJoE7EBrF2QP0EkyxGO2/UEDMbJ1SHE9sYLgRTZE8XeNC7jDCNuLhZhSJsDa7bbXlifPsiuCyIjW7gHJ5Aoh32jP4s2XQWRezJPohftRRnLFq4LMUObn7b0crac/pyjAVYFAqnNLwsFMRd2OoDQj7HWDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7L45jTzq3dVmAhhv7Vp+bzeybTkNriCZYdcItfW0yw=;
 b=xOrzjuJ5gMmePF3aBnTyomx1UJR9PWo73rQNqJvWt5GoYmOjvAZziJSgw5aINREEOJoMeOSD4H/5uvlY9apV60dSf2d0gFiOcN7+v214m7647AkIcIe7UJEWdZbxZ8oOB7FZNtuZMPKpZrKCveQiKkUXakDv6QEoqmpMpOFvkdU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BN0PR10MB5077.namprd10.prod.outlook.com (2603:10b6:408:12e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Wed, 28 Aug
 2024 19:41:33 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 19:41:33 +0000
Date: Wed, 28 Aug 2024 15:41:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 28/38] Remove unused "next" arg from dt_flowindent()
Message-ID: <Zs99akRUMOAfhqx9@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-9-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-9-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1P223CA0022.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:2c4::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BN0PR10MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb6ae69-3078-4c5b-87e1-08dcc7996ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QZHSkGZ8ZUUbid6HNtpOS9HwCDPu4HoVZIQiPplZDuxK8koGV47YCs1MIlzS?=
 =?us-ascii?Q?t6o5KW0nHl26rEWkiF2C0zX0mzUr+R6bRbP4M8j1j6e1YlbNd32kaSfSiSZc?=
 =?us-ascii?Q?tzbLyNZLxZx50YrqyT8+V9Oi2jCk3+EOYi462h5lTxMkW5LecX5ma9xWoIo4?=
 =?us-ascii?Q?n6V2pyqZSAlFc68woVtt4U4Ms8fTrqwpP4dVN/L6UL+BdkAXodup0vDyc3BF?=
 =?us-ascii?Q?0227/QyG1DLkbEgSab91KsPBpPapdTyB0i+P01jvnQZku5JACJGA+Xyc38qF?=
 =?us-ascii?Q?xvxTuZQwz0JYPHoMAbkneY0q/zvpZi7puyvs49vVKOHsCU8FiJCyUHG5hxci?=
 =?us-ascii?Q?gdXNQeB3U8aUuH+o+jZfgfTjQ1hPEIhFePGT9wwpXB/mWuXOTUfRSyoo2hyg?=
 =?us-ascii?Q?FjqfmDBISAQbZy2Ct1ZY9Gr13ZpOc50osH9M1NNFI6n1d1p9hjwHqSz3K1wb?=
 =?us-ascii?Q?WzkFRx5qAjwq9cJVEQGGnlGs5xzFZwp0YeiDx1vPDazjqaPnG/I8sYzQQC+e?=
 =?us-ascii?Q?TdxB/RDT2zmTNIMlHE/L+4GRzfyqJZPewr462K0rJx9szeGRdjkZwieZ2NMI?=
 =?us-ascii?Q?6Y0HDKMZrstafQjuLObU0z+tMPkxy3MoA270yMCeZy2Vda66xoN82hC3jn35?=
 =?us-ascii?Q?g3w1dpBME9upzTwQqeKDvT89NCU1QFbsi3Lt4h2C4f9CgXoDy+WA155cI0iO?=
 =?us-ascii?Q?FA184lJGx4k6nY7tgtFXJtJBeNY1M9rBTu1jXbEve4EuojLtEYuCQclj08Vm?=
 =?us-ascii?Q?+NndrEBvlqP5e50ss6E3E7DOxjOg8086jSzxbApYifcwqW0L2xj+u7XJf0dr?=
 =?us-ascii?Q?1qR1d4CKU8v0//ama+2XnmacjxG0ZbK89d1QO4JqTofF8BbjNlzpS0RvlTp9?=
 =?us-ascii?Q?qiUT7hReGGbvnoHN2u3Z7ZregksF5ziTPSDF4m/DKT9jTm0JMZLDnnnUB1Ur?=
 =?us-ascii?Q?YBTWvdWSpeFdF+u3uk5K3YpAYgXf7GAt1BaYCMbeufzhXszRQJT2GOgz4Z4X?=
 =?us-ascii?Q?f6xbp8BLgdoJ08N5Yi2R/SD08J3PWRuth7Fyb2q/DDgCkIxYn4pJxDwtG1u9?=
 =?us-ascii?Q?0myaXH0O36BkS/xbfGxuNwuCemICN3ZkpOzKLyV7UIEABBkc4IPlCwOAO+Yc?=
 =?us-ascii?Q?yA4102z8fhyvkJuRBGBIRio25U4SQssM6d5svqIBV2e+nqdPU15SoDmJ+L2w?=
 =?us-ascii?Q?Tc9VuMseunqW6F2bE0VUSCIjeuVY4Q+oF9wOqcj81EDCh89Wh0LGZiHZWP7Y?=
 =?us-ascii?Q?qWKYKRJyJZpPuW0bGlWTPZSW2w7CrUOpfGMhsZeLQB4RCjkbUOTxu4Hz/jZY?=
 =?us-ascii?Q?8eTNqATgaJQUqRaAkqngBsEAquvrXyvYKhQoQV5zMEG+Cw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S3OzDqKLctXZfbGR2PKld+GRqDZUDO8CApfQn4oNOsxT8Mdk/ypsikNN+S9r?=
 =?us-ascii?Q?1QqQ6t7Nb8GS8omzcwJoI96fuDesoovtFoxLXidVyeWbBnq+UI7WAaVVv8rz?=
 =?us-ascii?Q?XDCT3Fbl6yYkbbfoNA1TPwcU18Qqg97FmWHY3lOrUSEw01IKUrN27OczINyr?=
 =?us-ascii?Q?zIfoX0ScumxI2QXg58BTL+cJ7f4AZ7yAWO9EGPdVWShIbWT4PAfQdPFTtQ/a?=
 =?us-ascii?Q?DHsCuc/BfpSVPS97+XX/BjhuNprdHu5w9SqeQUi5jjX1kQCNidYYrZuv5luh?=
 =?us-ascii?Q?8bSWKckvtkMTCIM2wWUZNPdty89IKSa/L8JCmsk/lvZg/fXw/+yEj9lOjYR2?=
 =?us-ascii?Q?EqvY5nqiCsqOOnpO3IV0BxaZnZcocXHklD2CdLsZxsu3LAvd728HTHIRoBr/?=
 =?us-ascii?Q?RWtE9RSTPsJNIivF0zQ552Fm5kyF99E+/UcI4jzk7jCoxxssShpmQgPLP5Ze?=
 =?us-ascii?Q?Nfxzol568JOKttawKhZUZ/rJ4zS0TIdsEXh6uwSwcRJ+MVwyEd6MNm4Tk67Q?=
 =?us-ascii?Q?4cdGT540Ng/BlRy2En9kNvjGMTrWoRnVPaXh/KHGyOTdWM/lVBs2H7MmU1z0?=
 =?us-ascii?Q?1ZthvUXExHTXKbbktR9lpNFquT68OAHDOYP3mCtuTBSOKN62MtdOf5qGUjSn?=
 =?us-ascii?Q?KyzjNl6xos8xNQft8UG2/YVVg9lWn++Mg6UT5fy20ldfIiP4HYaOgT8DVytJ?=
 =?us-ascii?Q?r14TkelGpVs2I6H29GR1ioNV0VGVZVCHNaNQQdaXgUUsetd7sP0nkHQ4BH4B?=
 =?us-ascii?Q?NCxfoo2KmVw45LjTRl7N4YeqMK0+/QkfA+jNoUqD6Kw+DKUzoy7fd2Pj1ezf?=
 =?us-ascii?Q?CYO6Iie8gJP0rgqU6LcedB7qFJ6Y95aSL2bQSa8zUzHoz3oAsMSMGLtBslqT?=
 =?us-ascii?Q?NEykJZfxFt1pvnRkh5EIwNdvQaFEmXaNEtCLXeoKI3ztD7bitXmbTIABjU1d?=
 =?us-ascii?Q?urlKQsIc7e2AtF/okj6aHraQr3JPyJuhZmDr7OCQ58IIh1FWFz5E6hrnydHx?=
 =?us-ascii?Q?kpEmos7TEHyMYI1pGIiNE3gjbZUnZL8KWr2mJI9soMn9T/PvB3Wqnoc/Y3Qo?=
 =?us-ascii?Q?cewI8P41fxE/g5EZQ61LQhWAFkgpjcUYC0a6A72vA8PbwpxCciBYpYkT7QLX?=
 =?us-ascii?Q?CECiA5vJm7hQ/7Rg8QA0ZnyH/REnYOn7SWSr3WLGbN1hQq0nhvCjJAwA/CNl?=
 =?us-ascii?Q?4gwiAQj2N1Qz4/ViBL+LkxsFt4m/f9iAFev2xPpUzIJLDngFoC5QfISs2sER?=
 =?us-ascii?Q?3pRLHFzvDs71RPnsGM3qXG0Jnq3VY/POqyaz2tIeeL4qkiv5ikHTRHoZIm7g?=
 =?us-ascii?Q?68+Kcv0ygzH45pAmFMtanYl4Y2bm5rLjRnEK9pXzqdmJGnqHoJMow6sNadop?=
 =?us-ascii?Q?6c7ZuGHm7CbjBZFXj5R0k5+9gikQTSck+OEYksGxmow68LeYXIk318j0rYuS?=
 =?us-ascii?Q?7uh74MitLKxijJw4HdmZYpbgLGfFFYyXrRuKkQoJR4/io9gTa+bIKn4aHHOR?=
 =?us-ascii?Q?3lGoA+ig8O3LJc6MgVpUGbjga1rKAKN7vXW/HFEaP3UlAwiTWjyC8YSv4rV5?=
 =?us-ascii?Q?12MGenAcsVDVgVqPoJGQ4NnjQreJIqmwM1+qkrXeIZfmb1ulG8pSYRYrO9O4?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FPf92pDqsuHY7RdKhXLuEu0+i66dDwtF4wCtorkxrLeyrdGVCgU+NOytuPcxJQdiTng4w2v6ro++pJpgbskRBHPw5Kq71boyY9TxgisSw+Uft0nnjnBmbY4G/hC2KrORe+PqrBjWygwTsTAkZSIZzPL7iMFXGxYwnEqVi2m7FC0Y/7hnFM+1Fk5GIeHBIOTfngZy+eFQ5Yw+NsPvvDCZqOEWpeEL4s/2ZVKT7KBqShiy317eJFT+N+xHWRQwPIXu/FtQJwqsBz7OrsMkCJJr8lcYQm4uoq5LF6OfdFw0rjaYtPAeBzEnXFB2nr3OSC455NobX0sCTlh44iclFumwtBrdg00DuWEdvxNUBx+h0809+t/DZk9TeBH4rgNSVZPJT3iaSyyf3j5RHAVlMFhkyVRZjyPE4+N7xRB5/pWnDG2zRqOvLTvykzR+G7tOl5qDmkGssmJ1m+ZyepKR3Jksr5r36vG3ef/pjva2V48HzbJ+fm5m4W/+Swfbam71pNchtWWP1SFOYKYJt5XeRcu3wBYUP0pyxasSL+Hless/oBhH9eZseFX4AuSUX/6UCixmS/ekPZ+5fucFwTggpMfqfqlPJ8D5HdX5n3kepvOhz4g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb6ae69-3078-4c5b-87e1-08dcc7996ba8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 19:41:33.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qo3ooJc3AjzlhCzlczPqYRQfZpwH8J0ULXU59Feoqfkplux0qPwFV0xLafe1k/nH237fNZeB1qXn4LVtxx3kiFZja0wdnCBY3cNHIueYWGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5077
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408280143
X-Proofpoint-GUID: kaBahuIr72fBgbLAY0504p-oiOwfmjOh
X-Proofpoint-ORIG-GUID: kaBahuIr72fBgbLAY0504p-oiOwfmjOh

Lookinga at this - it might be that 'next' is not needed (ever) but I need to
look at this code again because I wrote it a very long time ago and I cannot
recall whether I reworked it to never need it or whether this is essentially
something that was left to be handled later (and forgotten).

On Thu, Jun 27, 2024 at 01:38:54AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_consume.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 5fb636fe..7dfec72f 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -432,11 +432,9 @@ static dt_htab_ops_t dt_spec_buf_htab_ops = {
>  };
>  
>  static int
> -dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
> -	      dtrace_epid_t next)
> +dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
>  {
> -	dtrace_probedesc_t	*pd = data->dtpda_pdesc, *npd;
> -	dtrace_datadesc_t	*ndd;
> +	dtrace_probedesc_t	*pd = data->dtpda_pdesc;
>  	dtrace_flowkind_t	flow = DTRACEFLOW_NONE;
>  	const char		*p = pd->prv;
>  	const char		*n = pd->prb;
> @@ -447,7 +445,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
>  	static const char	*ent = "entry", *ret = "return";
>  	static int		entlen = 0, retlen = 0;
>  	dtrace_epid_t		id = data->dtpda_epid;
> -	int			rval;
>  
>  	if (entlen == 0) {
>  		assert(retlen == 0);
> @@ -485,21 +482,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
>  			flow = DTRACEFLOW_NONE;
>  	}
>  
> -	/*
> -	 * If we're going to unindent this, it's more difficult to see if
> -	 * we don't actually want to unindent it -- we need to look at the
> -	 * _next_ EPID.
> -	 */
> -	if (flow == DTRACEFLOW_RETURN && next != DTRACE_EPIDNONE &&
> -	    next != id) {
> -		rval = dt_epid_lookup(dtp, next, &ndd, &npd);
> -		if (rval != 0)
> -			return rval;
> -
> -		if (npd->id == pd->id)
> -			flow = DTRACEFLOW_NONE;
> -	}
> -
>  	if (flow == DTRACEFLOW_ENTRY || flow == DTRACEFLOW_RETURN)
>  		data->dtpda_prefix = str;
>  	else
> @@ -2343,7 +2325,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  
>  	if (data_recording) {
>  		if (flow)
> -			dt_flowindent(dtp, pdat, *last, DTRACE_EPIDNONE);
> +			dt_flowindent(dtp, pdat, *last);
>  
>  		rval = (*efunc)(pdat, arg);
>  
> -- 
> 2.18.4
> 
