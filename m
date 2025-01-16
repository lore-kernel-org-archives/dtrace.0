Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A713B58C
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737066164; cv=fail; b=HAk58TMuXB+oCRoEK6LcZZ/dxtqZ+M6yVCFnRXmpeiHyMRy8JlcDEiwBfANO3tFKFouu79h997Qo2Ljpyp4EttOFAxmjJ8VtwAy/hf3aKPkv8y4Jf3un/kNCMtgO4csJRccXL46Cfkr4XrvZHerIE8jjCNGkft07D5cSORN6is0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737066164; c=relaxed/simple;
	bh=sMLkse/4rcKjmWv2uv1Nb+kBi07rdY62h1TlMh64LM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jgh2d0k9jnmzMR0QfQ1pddGgzUBKddycQSdobPJmMid6sMnjilrY4MaSG+eeagRZp0PDGgUEUYtJzvpBPttHpUm+v1NI6fd3+U8PvqU4GMdTqQ+ujYbYE5+psx+NyVaWv7d0vVO56ia8cR9+Y4sNC2rp1E5Sra12WjNUU5VdDc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i4UsU4wN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hnaVq+3I; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i4UsU4wN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hnaVq+3I"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GMBp8X012157
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=MeYcrv0u5bmU0e1WCg
	BSgiqj/vlXFzu6sWKj8zfll+g=; b=i4UsU4wN+Tdc7d8ahra0ihT9MJJkVpYIXM
	La4YglBojkdi+0FRzH39IJqr48m9fHjchIhSnZuIHpAf2KrZCq9C3ycpoOLaiVkF
	vi4wecNzrJMgtwCdJXxUbgqjSG6Z68gTMccG+ulLVCFyoW+5gTzIckbVDu477jRT
	tZOwOoi3YdAjGAnOjoME6AEmtk9B1t9PEG1W6mS4CaayF7xkcLezaIUEdw44hRj2
	scwH640J+pjsLQL0Peun/iAtyMxpfzsCaQ9Yb8Ky+RPXrCo3+r4/XufhCQ6ZsQyY
	DxZIQXmoIuQkMbNYGiYxHmOln5XieHIk/D15xMpncMJusEypYOaw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4475mfgqxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:22:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GLccZ3036462
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:22:40 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3c06th-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 22:22:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0Q4DsER+lFi6I+Hi6T4HK+YBOyLShZQNwNZgjxpX8Hk6Y6REZVX2Z1EQ/wAg2X3WhMcfR2OmPClKCllTIudyaiwePsNVUhnA0D0Eobvpr3REUyTUxbwjFp1VYr0OJZGplBosgnzVolVI5jRa76OIBf8ytZknBnquqx/mnSeL/Wp6lZ9GxSBNth6cHd6b8N99/llmmGuTT4y51r14BZBN95TEqbeURgeGZ2tCqjcM8vaDSYLFbK50bI17pzkrvuf6WOT3IcGhdOLO8L6DyRby13bJ4DUeA5TMHqCUOXOwLqJzNJzyEau0CMK8By/JFmFbN0pobnnYhqKOBsGg/xz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeYcrv0u5bmU0e1WCgBSgiqj/vlXFzu6sWKj8zfll+g=;
 b=A12AOh1Q1mfzdRnFBR4PkGIyPI90tvUotcElq+OOJbXEkQn7KMDWe2r2Y1wL6PfHoPtXvtMemq8kbfy8tWrJ7rQm2lPj8/2w/R4vHcBNCIY9YNgovQPGL+BS0AFe3UsB3ZJl1ffHTvLWPtu/p7FjlB8VnAZbZAp5EjgnYo9zurzI9P+MeQCKgN29Wkjxqoqk6/Lu3ubn8yjzYryfGuvxCev6n3L/y2GptceVRM1e68ZNxw9VJZqMctftVAfOhFVeTvkMPKl1H2uCsKp158j9w0+U0LizfobxChA5pdlFfOZk2tAI1gb8zg3oMC3Yvz/yEIXGSs8vvJ8DlxvLYHhCMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeYcrv0u5bmU0e1WCgBSgiqj/vlXFzu6sWKj8zfll+g=;
 b=hnaVq+3I9gk2KqFFG17nqtmE3UWNavXjczjBGpjwFNw3EsypJEqg3K/AMSp9s4WG4bETZ+8lk3Ofa/VrvEszjBSZYr+2n0imoQIoyT3x58+loeGCkxMxbDv/jRxvBlYhBh3l4CoP3RmxtLcPGsQ0zeR4rQwupnIaLXepzLYvF7w=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DM3PR10MB7971.namprd10.prod.outlook.com (2603:10b6:0:b::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8356.13; Thu, 16 Jan 2025 22:22:37 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 22:22:37 +0000
Date: Thu, 16 Jan 2025 17:22:34 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/2] tests: do not pass -flto to the compiler or linker
Message-ID: <Z4mGqmxNh4M5uSDy@oracle.com>
References: <20250116215418.417155-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116215418.417155-1-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DM3PR10MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc70a44-fc7c-4fea-32fe-08dd367c4807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x1cvM4aorKWYjAqweW/5N9HXWEHhHR+O3eMfyNnWAzbeMpGrSgU5ZGj334SJ?=
 =?us-ascii?Q?5DybVEk9aHjaBLQdBSWWXBCwD+VpXGBB+5/D8PVdqTJDZwZb4NtGQ3DQ/52c?=
 =?us-ascii?Q?7fXQLxFpwngawCu93wpGnPMZNPs1Jq784gMP1cgVy0btGmuigBpTxCqCyx69?=
 =?us-ascii?Q?8wKGGM+JyZ0yam2yVQ3+V+PqtDBvE0oeOVapw311AHbVRRiTYVi2rCIMDtmu?=
 =?us-ascii?Q?Md4Yw96OwRtzj7QbbSTEZvAeRRXpxGR068TH9WMZoMFmQlphihDmcppZNms7?=
 =?us-ascii?Q?ITBfE0Xngx5Gu2WjE33pojosWo+FMC87xQVHS9J2QqmOe/4yNnWJZ8dHLxVD?=
 =?us-ascii?Q?+eYOfKDyFF696+7fn9Bsv3Z1F0pxuEdjjCQCtGwMKSZLR4EnwViQp12cyyBa?=
 =?us-ascii?Q?7AqgLH/dHZVBeKIm2z5A08MPOdUhBl2IZz/pL0CVVeX3koye7ZGIg+nM9ueL?=
 =?us-ascii?Q?xTGMYOIpfEJhpQIZ+sTvRkHRV213eRNfoxgFzhwovcIp+D458CeWl8IyF7Fk?=
 =?us-ascii?Q?Ob9cpcNXDv08H1Zx+N8Mhe/I6+Dswv7tjv1s4eSMnQiV8j834zCeOhlI05Bj?=
 =?us-ascii?Q?KsvKBMZB2ljYrjGid0dgnY9WDaXExTHNJj0g2zBpWgnO1gIA1p0nHEc3xBI2?=
 =?us-ascii?Q?FcCM/eAcLDO0NQNtbk7gwQkY4n6h0U0Z1CBYiXYnk3ymlcrcJFbbCdD9aNBK?=
 =?us-ascii?Q?8Kix8RGhaQcZoLo5vK9s0vSm7wdyWwZsHRDIK5bgMKQrXh2IcpTbQ+G3o4/Q?=
 =?us-ascii?Q?fvmqZKz3Z9rdnpPLAFeico11LVZubRfFYRX1yyVK535LT5cSVO9PqXCRB35t?=
 =?us-ascii?Q?nVRGZMUqKKprYgVQuY3m6ZJtyXCpc4iwLysVO1D/HBSi44ZKm86MANxAv8cR?=
 =?us-ascii?Q?JeBJ1pgOuxksCfVE9S+bADakbVQNZIcaQ/Aqv9wbUwPtZ+WQk+9hdyleI09W?=
 =?us-ascii?Q?GjQcYKGMNaCshS8p3zGvJDUYqjQbELkB0C31zH9y1tFVGKI9/OQmKfs6NAEs?=
 =?us-ascii?Q?pfLIWhp7+j6/m4LC5NP6afqrFpwkxu6KcyaZK/xdI2JvZRS0xEjvAoN1Jhmw?=
 =?us-ascii?Q?pg4R0n7iQksiduzCtFLCw3YzzzmfXn5F0rZ2jopiP34guj7U5FYw+ZsyXpzK?=
 =?us-ascii?Q?muKoDgfeI+Igm1Nt9dNXB5LDzfi9yeDDayHpE48FoS07edsaFhMGzWz/mtM4?=
 =?us-ascii?Q?rjdeXMQL3NBidILtMPZURFC73Chp8y3GNVTiGaaOgl+deoWmmjHkFZ/v33G+?=
 =?us-ascii?Q?s0ss/Bhi4YJTNiU2A9D6FQ5arCDwjgCQ4mP6sXbX9nsEro1I8/4ISyqWP6s8?=
 =?us-ascii?Q?rLVzYFd6OOHeFi6GmnntiavpBwp9gJc+oJcpAchiUfE29oZWHxI7DCI239rs?=
 =?us-ascii?Q?mc/M38OoujQSucOKNKJ3k9pxS2/z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n10MRezl4NIoFgOCqxOwUAUu41rDNMHTU1ZYdsyCcVgdYdUTiKPVNQt6qGZO?=
 =?us-ascii?Q?VArKJseVkv7B+THljJd60HEcAZnvZOZBsT3lfsc/jB1/gqcoUJTa8bSku1AY?=
 =?us-ascii?Q?168UtyxsvPaL/HGBWAk8ygDasI9rWzI7qsAwiQtKf52YKtlnVIHw8jY/M5cQ?=
 =?us-ascii?Q?1QvJOrEYBWQwYTQju6VV2xcq+RQgm6eB2oqaQ8ldEHQBkEByVZAI6D0bm+/G?=
 =?us-ascii?Q?PqOEQq7HH5wZd+Q7Ms54PQiUTBuMTQ5MJYc7ZxF1wZONUjVUpqbY7/onmJjh?=
 =?us-ascii?Q?OKf+Qsdn1x2pG1Mhs53YMWMDV7nrYZEjhkyw5qkQsqT8PiEVEsa6CTeveBuS?=
 =?us-ascii?Q?TBmfzEB6yOzQnEO8cp8FxzTtb5mtXXMDG3NKBUzSUnSIUzvnghQVCw30bcET?=
 =?us-ascii?Q?OgLr36c6QlcR3AoNR95qWyplXZMITD5j/Rub8Nw4y38bGJKdh1IZGkpTRLMK?=
 =?us-ascii?Q?UglN8//E3Fp1DrnxdVzpBJz4UTb3dVdQuBPsqfcjRdOxHDB14gd3HLDHklBF?=
 =?us-ascii?Q?bfiyOOBaQGNBXSV3v4PyEFK9J7TzN3SyJNru9jG+iiT6CC94n2FMS00Fgspz?=
 =?us-ascii?Q?/gKLCMcQBvIwmFC2RY81BZSm0aNatvO1pAKizPxTJwDkYyjx0DRXwoaq5Psw?=
 =?us-ascii?Q?Tj5uVUfSlPZTPfCZwZYYEx4lnNwP/bSwk3LlDcgui23Nv5jz3650Kq+2aGTn?=
 =?us-ascii?Q?9VHbIndVzk8gYk1mIhs42/45MYU4ziLnuEiFUXoMAoO4t2s8JW+Mx2VOxoiz?=
 =?us-ascii?Q?/KX3JDnGOVdVn0Wro9z90rNWVDJ/FO08S/HYsYn53QOxacVI/4NBGOulkYry?=
 =?us-ascii?Q?W/n74rL8ZUKyx3MhI0Z7h5SYHcoZSr6aOW4qcFtgiBw7XWjNPIpc3iSHx6Qk?=
 =?us-ascii?Q?guWRXtxtUsOx0y9JwQHFTqLepQDCNhzwDfARex6GRu0OiHHNFR3xuDHJKrcz?=
 =?us-ascii?Q?ZjmZQwz6QGR5aZkBvXhljOlkl8ZIU7ZaPe3R27OjgoaJ9TEYW1iux+Ii1FwS?=
 =?us-ascii?Q?9W8C6+DiuJHfIl1ftq3ZAcIdq9xeyZ3DLNTEwwXJUPHFln7KgJiIwzJtlDkC?=
 =?us-ascii?Q?mnonWAPed+csTIJwp6J4zLbf3LRDV+LinFIGMZ0sxhijd+HV1MmetRPTQ+1L?=
 =?us-ascii?Q?zk7RMEJJ5NcKkQ1/fUwF4H2eBnWwo4fxNZJkNpqMwuJvpJmYpEctgG/6LvDW?=
 =?us-ascii?Q?bLOnXrlk3ysuh74c7L17YsaXOKuBLSEnKUcM1DpuEba5rCFFbchk8Nk2GNVW?=
 =?us-ascii?Q?utgX466oOBuAq5PEBFbYNNUIbZRTLpkx6dFO4Wvyl65WgtagXVm1DbQn6p4D?=
 =?us-ascii?Q?x3RU9gPOyzoopF0KJXldL8PVSv9TZzi0X4rVqlgbu1QNALFtFrAZ6VdB2rwz?=
 =?us-ascii?Q?lO0uJJ7t3MRf8fd8eAWfb7LKfv5E5nUhXZWd8ZYEURLcEaaDeCYdKegpd2Qb?=
 =?us-ascii?Q?OgFwP1DAWP/96MZijCDzdhz1d3t+qNAS4v4P2D0QTjlUDi0uTrej++8JguCP?=
 =?us-ascii?Q?C84cWVnlPqWyJvTAN9v/C3E/BfxwI8e0G5VK/h8UnUIayPLMrrFxZSeCbgmK?=
 =?us-ascii?Q?Qb67LVIsRSLHG9yjB8raBm40E38lrhpagGnRFhBRhzzCi89roVnjayldcrqe?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ll1SaFwHrCtKLJpZGXz2Un41FrdPaGyZDr8SwZUe/9sCvW/6z00zWi2/Bcb0YdreBPLmMV3Qzzrv5IALN1uM1xnLroGi3TPNm3vQCmSUwv4ao2WtOJs3G6dMXRKYYEGr80LD5l65IJf8uDOix2HFWv42ZIwpKthgPRj0qJSrde1ncqrj1bgXQAYGbFsIs6qDYH+mLa1tS27rN0CselRbLyRFYCrhCB9jOmajwIaihT6etWtl49ww7m1E8wecUjwPm3HLo2kIjJrB61ZfBWD/ETYNf9LQRKm4vqbyGnoETDhqckAjFAhYcoH2bHlmkXaYkUxAT24xpy8eTw19yOoNWxG2LG4CvPAcSnyo5QYi0SgwjZKRgdIQIxP8vYgBTgJshJ6woIZXbpKbRdhg8GI0NXK0X7mYdWO/M7k6HyRDDuKcGhc7rczr+iTJC7SQaZbwaZeIxluYUHNPHVROC/3AeeUVZemiSdUFc6g4EPwNiuyqsG77No8SUs7+Hsw09W9TrqPmUtV98q9w5rBiIpYU6ldPDxlmR3iYrfzdBZNs6rLTJ5zVf0vUPMR0fUoITtstYD1UfOo1iRwxRFfvL81vwTdLDNSf8E8i/k7V9WCytcU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc70a44-fc7c-4fea-32fe-08dd367c4807
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 22:22:37.0869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EPbL1SuGCR/1zTyND1ySc7aVCE1JvKh9WNi9O73kmSQhJXG/z2zfTWRHBOWngzC9SEa0JT/AXuVku9RDSYIGef4sB+Sc6EE9KpYI8fLbf2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7971
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160165
X-Proofpoint-GUID: pPfRaUbvcZVBz4wsAcl9MWW7D6Uu3q7X
X-Proofpoint-ORIG-GUID: pPfRaUbvcZVBz4wsAcl9MWW7D6Uu3q7X

On Thu, Jan 16, 2025 at 09:54:17PM +0000, Nick Alcock wrote:
> We don't want to compile tests with -flto by default: if the distro
> compiler automatically activates it, turn it off by explicitly passing
> -fno-lto to all compiler and linker invocations in the testsuite.
> 
> (This is a bit fiddly because this is the first CPPFLAG which is
> not also a valid flag to dtrace(1) itself, so we have to split
> a variable up a bit.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  runtest.sh | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/runtest.sh b/runtest.sh
> index 94634f80c2ebf..1cb5be8213396 100755
> --- a/runtest.sh
> +++ b/runtest.sh
> @@ -589,8 +589,9 @@ else
>          exit 1
>      fi
>  fi
> -export test_cppflags
> -export test_ldflags
> +core_raw_dt_flags="$test_cppflags"
> +export test_cppflags="$test_cppflags -fno-lto"
> +export test_ldflags="$test_ldflags -fno-lto"
>  export test_libdir
>  
>  # Figure out if the preprocessor supports -fno-diagnostics-show-option: if it
> @@ -1085,7 +1086,7 @@ for dt in $dtrace; do
>          # Default and substitute in flags.  The raw_dt_flags apply even to a
>          # sh invocation.
>  
> -        raw_dt_flags="$test_cppflags"
> +        raw_dt_flags="$core_raw_dt_flags"
>  
>          expected_tag=
>          if [[ $testonly =~ ^err\.D_ ]]; then
> -- 
> 2.47.1.279.g84c5f4e78e
> 
