Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0075822EE5
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721327654; cv=fail; b=Rki5kFMp2o3vqkwSyIBToXqQUGXcVUh4zoFrMy0UYjyVgqU1n22IEDJ6HMYB1aWkr3rd7Zxdh8pePtkDjMxJjgv+iW2E1JqjtZLK2Z0uGVPYYh56ulF85FbSRCnzA/m2ValrOwyTT2aimLNaXmQ6/r0e7XhSgMgLzXocpYjplEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721327654; c=relaxed/simple;
	bh=8DAws4gogSruBdK3u6jJclWZKsWPLSKc9FjOl5lnIl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JhgD07I9XVq7a3EieG+K45h/gSLHORXqXb7ZpewAz2vPl/73B9+m/t37HDc92OeKmxzyDBkQbQ/dXo5P16Xs22aYjg4UlLQd6fqZC8pCwLApaNxdR5EcmebKPrFt1Ham2jD7M7x22dAgENJ66ICLK5FkE4r8JFgiteQCvO3nAXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lq5J82gB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kH5LvOOS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lq5J82gB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kH5LvOOS"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IIF5Ss029949
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Czcgkd02iR1Pwhz
	aNDDcR0DXd7mfKHotrsIfMImYCkg=; b=lq5J82gB3t8AllffiGFDit+DfLuZYf2
	sDbz/oxAYVxDGpOj/jsLB4ukTjCqY/HJjMOo2tNSsY5gzXpwSs0hfShUX9nNiMQS
	DhPFCxZjrgaSS+K0DrKQej9sXX7fmEsPeuD9AESQxpc8dfju37dMGnlmj7SXFJRW
	UJQXbj8gEC3AqHaoojCzP7BM3v24K2bBHWW9xAj7xg00mk80A+J/G6wtBMZLE4v1
	YTvhGuv2cbCeUrU3uxKqy4Kpdyvnlo1eZ/6z/zL0qtj4L2z1gkvnQRNs5FWSSURE
	NgsNAcC31C45KRpeowDNKtmDjPcz3+0ALauEyyTuLhtYD5Z8s6vpXGA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f85r01y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:34:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IH0QYj031714
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:34:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf05qm3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:34:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ncmk41CBwB1G2uk2hPKjH011yCR6YqyZ4NL9q+gsC0jNYLH9xnrOLixDqkXWNL2zHiB8BO0cDFc/WhkZU7QhYhxUAXVDY6pctFngovxFPzTiw/GJRSIrtVhHSAnU1Jski/L8hj6Te9PUr+KjIZTU2AwN11XDhb0z/J6mOOJZUJysCjdRZLLO8RZnhx/l6EIR/49uFdyLfC06B6j21gTDf2laVhgDXj6NU9Gad/M+Z1hj3BqnxNZnxI6NV8YUwh6+tXDR9dnkWMcz89HiraUGY4PCCs+1MMQPxHFDzAr7XA4J9xVLc1oQ4gjt6mrfjsK20R1Im4RO5MFJNuQWoqL3pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Czcgkd02iR1PwhzaNDDcR0DXd7mfKHotrsIfMImYCkg=;
 b=r9nx3W0iZJBz9nxO33qyqlt+h7f1vFbmss1zNpK2S0IxQhsE49Ud/brNPZQF04LVXUKk13X3gRSIipUjCVBGAmCh/RUuKWaO+ilzDyDHej4QOjnxm0qblIF3aWBgtrHUQZcRDBwEBa9SkVMo5tFyh4xEdRE4saELXeSG7nTeiQiVEB4gHTAZga/Do0m4Jhm7cmtSZViyy4ke01L3LeWhMiRGcNweZDWuwOUfv23cIm31W9Z1ehurl6zLlijCtDshYB2o076srWkoWpYWpaB4PFxf6oL2MUSeKb+CWkcTtvn5spmfmge6jbQeI7JL3ND6zwvIoM5AURJNy3aOneGOIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Czcgkd02iR1PwhzaNDDcR0DXd7mfKHotrsIfMImYCkg=;
 b=kH5LvOOS9UMLcX0nk5MU/wNt0/wMWzaJJrwOs5msB1PyzWxlFT6Kuf+U7jm+j2c+buCRiAc5nxC9f+x1MDMWKrFlCF982iJnFkwwNWBP0mOr27f26LSG6EupglTwjnvnslBsPdO1g+AM/7lrZLYdeX+0ZTTgy8oGz85u9XMx/WU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7766.namprd10.prod.outlook.com (2603:10b6:510:30c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.35; Thu, 18 Jul
 2024 18:34:05 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 18:34:05 +0000
Date: Thu, 18 Jul 2024 14:34:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 06/38] Get rid of unused dtrace_repldesc_t
Message-ID: <ZplgGyezU2FfyIiu@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-7-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-7-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:208:32f::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 1303be08-42e9-4fbe-b02c-08dca75833f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?atYlaF+3lYZXbQv1lWrth24SPZrNLr5E/wojNFTp6Ef0GD6HAtnpiQvT0W/Y?=
 =?us-ascii?Q?Xmkitp6X+OvHVgalky6QWm93AeQy28Cxy3yoKfUDb1Xs5E1E8IFB9mM8Ve7z?=
 =?us-ascii?Q?J7rulhSeBTtNJb2pRRdb5CYgkS4jnSqBizRV8R5q865L0sncH594A7jZKsgA?=
 =?us-ascii?Q?pKlrXeuRGXdrZ6ZK494YoBGYSO7ycaooGM8DkJN+nlC4+wdZIfHf80RrfJdZ?=
 =?us-ascii?Q?uNtUsRhjxBAj6yq0QENJ916xVNK9ygGD2y42wflIrlgvAhBRAxouStdIHIrj?=
 =?us-ascii?Q?MFLbWH2GZrw/Zv3EseP5WfKyQENGutuTkmRw3RXDX7pcSyZVd7UU73MubssO?=
 =?us-ascii?Q?DUrQK7lvfFOlS71RK3wihHXkvCirQkehiUmnPXvQTdZvMHI70WzxQYoR1uZq?=
 =?us-ascii?Q?Hzx8gDYMkVWArqdzgf5n5x7Z98vTfC+HRgcmIr1F7YBh4S0/3dis5BIa8BuE?=
 =?us-ascii?Q?O4U0o9r6JHlF9myVjV9XGM33SRflfwCI1iI+556qn02pOQPUN67ZEF43BHBf?=
 =?us-ascii?Q?S6kQKPtvQkkiA33UeSYtNFtI+ytXah7eAyWTpH76elvln7Zt02ULWSscE3WP?=
 =?us-ascii?Q?2zcYvk51X+2DB+9GWguhKeB0piuHYU+tLKbQm4AB8y3J/wnRCy+ESI3bto0S?=
 =?us-ascii?Q?aRH2ADxSs1MapgUDS0g4c66c3taHD6V7DxRJyqZ849iH07WDbRsBgIjoai1C?=
 =?us-ascii?Q?6XprDJssNpnX9TKcDAIs9C24pQeJPSgaE/Mhzb0k8En4A2vS6u8hstXWxICc?=
 =?us-ascii?Q?bz3k/9j7R2DaRVnAj7O20NmF3RO4pXrwqu34wIF0bIDQIeSVn8h/YdhHuOlr?=
 =?us-ascii?Q?v/LVucphM4I5jOwLr5zeWUoeoOCa0i18rX8avzkNCtrtGVqjgXp0ms5AdnHt?=
 =?us-ascii?Q?eZo3LOVJkT1kwV7cmD8/8k5cT1AP7KKbZo4tn3VeWgWnM2YqolmP4rKezD9Q?=
 =?us-ascii?Q?OJA4QH1Hmk16KnU+A1METyxM8RWl/7fplMttaD2Y2pBGwvYweKG1Bzy/6gsR?=
 =?us-ascii?Q?7SPSCnQ5nI83pvnhnE8ZHi8u/bYWzgpW7VYwcwEr1dWA+Wj5XQEkBxLiXdIx?=
 =?us-ascii?Q?pCeP4+r4uzVNIZLoI7YTbBVdT5cMgAWHNRX88aEtFYJ4PdkFY8Qzyx//mktU?=
 =?us-ascii?Q?jffF+B714g/rYC+s4ZoixWi27dKtvif/bZeRzsJncJnMgejCMG4BvlOsSd9/?=
 =?us-ascii?Q?E8bxzMW5vblUzYIKf2BKq/UID7FIpg9xW1A/PtSSyGsMezwmhBF2xaxsHh/Z?=
 =?us-ascii?Q?5ItKoZJ6XjQpr+QO/qkpP0QNuU7yOfhZ97oNkF7oXLpctBDbAYNsUU5dZeeY?=
 =?us-ascii?Q?umh0Ugz3bLRknIqFNeOkwn6O9x3rETu9HYZCMbno6Z7sVg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0+bbqBn4Br4s/qlinb67Xi6DUd2EISvsO9ZZSjdD5Au+1OFKeZ8YV/cCOTRy?=
 =?us-ascii?Q?dlWCs5JWkc2IkuW6XKUbclzfrxIHyoO3k3x6cZhAVz5F6994hCsNheSjHdnz?=
 =?us-ascii?Q?maPcJuHy5T+NWhvTRtnvuwCVKJouz2aoyk3AocdpCms6BfhesoIMqglObGUk?=
 =?us-ascii?Q?LAF0CBZ4MWXEL6BSuQXZwKSr4rPAgYaG+uEQBDtxsfd+4LH6iCT4akSVrJ/j?=
 =?us-ascii?Q?dSoS362SkSLvRhVfPUvr1t7kDlmQ707GX1J0mWcn4qQVtnIvbnkjB5ox/Wly?=
 =?us-ascii?Q?UMglNuB0jQO7y+NJzvcmnJzuxaQL+kEejVQFxFHKc+PncWQssjpypYlduJMU?=
 =?us-ascii?Q?tpHOEQKs6wGL3dicnNaof3eszYkOAMKl9hgjfGrI+DclWAxxQhi7+WWgIgcC?=
 =?us-ascii?Q?vXHOmuFHukhsl7q/UX4YhFNo6K74ri+CqZtMMfySi+7tgKbAC700pBVFjY+p?=
 =?us-ascii?Q?PdIwrZAjP3xVpk+ybWpOD8ykBlkL/+k32ahYL9NQ204GbnREykT48MJqv6I8?=
 =?us-ascii?Q?uapDwbq6yalJDanC6F80CMDUpXjyZvSrstiBXPiCvJ2pc4IDAvooNfTljx//?=
 =?us-ascii?Q?VT/rZUY/FGe20N5UVar4l3zlAepDHaD+fgOC1HpanQiotE7K1a9opDv1jVs4?=
 =?us-ascii?Q?4ccC7kY++3iV/Mbn79z8aPh0dvWx9+/fw368MFHuEnONEL/qEqkPIIqBKoBJ?=
 =?us-ascii?Q?YcXOfWDwajQF1aryD9UYI/8LgcmSddPj6Q0eIvm2wDkFwb3AiCNduT7zx8kE?=
 =?us-ascii?Q?BzG/6581FtwABIDsbEtvCKEJz9GI6epsT4gz2thF0o3h34X1rOdV5D/dxhvJ?=
 =?us-ascii?Q?ExHShrHIcpP+PjzM0yzckOu25C9RorR2V/MbkgZrQRJaA3nIcO7NAuI7ld9b?=
 =?us-ascii?Q?ewAcMu9htyVG+8NG1WVT9aFfTAxCqgpk7VtqO/uLORWxu8mLv/CUzJeUs2Z6?=
 =?us-ascii?Q?Uk+BSWdwZboS9wkYYa+WVdhBMJxT2XbuCe3yOGAAwKj1M3SnKJlHSiaezcPR?=
 =?us-ascii?Q?4KHBbWWbOyyLDwF5mZKMe8OJ5SyrfoU8mUIQhWlRUQFTYRE4pmGtNiXExvyJ?=
 =?us-ascii?Q?5g/tlKcoctN2GDMXD64fZYhTJ+sEokAIxWSY7fhORTTVAYwvf3O5TP8mmxlR?=
 =?us-ascii?Q?iTyHWUUQzzH47CDxMFuQDM5dvEScF2FT2EgsAZ9sDGJsMUc6XzPFsV/WZ+Pr?=
 =?us-ascii?Q?+LvM+huaXspDwDTEK8WmUaER+jPceCjxJI0TYfsy5Xx6plLOaBkSNj6PzIkk?=
 =?us-ascii?Q?nG0XZNWvkUvIMy8o5h9PmyAgIyrn9G+WTG3B2doAzvo3hBdWtON0+BrNJP5E?=
 =?us-ascii?Q?pPRkvEdDYosDiyX0TmD61npi7QJpwyt6UQ5aTZ+UrxDp9Igd2HCEESdIVFX/?=
 =?us-ascii?Q?xoZUmCnEasr6fjFsBTsPqb9qs728wr0AF0iM1v7rSwAB6a5Z7eWeg1U6o/5m?=
 =?us-ascii?Q?G50nI+GwsorJaDwRbf20T6KdCcJyHL4fkfkRPdFJpH8uSFwMomRgHyrhnYyg?=
 =?us-ascii?Q?Glh3i3Fa1nqDJnuXM9BPZsjDblczO/ly/7I3VKaEBaCGcjzFjwcM20/8OkpF?=
 =?us-ascii?Q?b/p1GspgmAedzTFSGe15RvSPLydICvZTMkl9H5ITCYNotDkZd/fhvVEokSo+?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	bwwmnhXkApe2wyaIeFMx0S837BwOg2o5JgbaJAAe7yrxhMYDZ35RLetjozQ+R2hlbjGr2LC33mpjrm9lXft1OjvwoburEgwicn25vZx6G+rzw+2NivHvfK4AQzkS4Y5GcM2YV6V/CBmUUli0DAyCfljASe1yFngsZd+AWm1pbWpVfLXmthRAG1nExVvLxMAZd2lgVJ1nwblXVrPsR3BKbBcu22msnl9D/1vOyqlAiRYszCfmNGB3EnupLBd/pK2F4xLCWe4FEnuwgnMp4vrSITF5U2GRk3Z0bwrlxV8gvcYumvoluXX9WX5C6nzGIdLO/yv/S0QEAwDYRJ48C4uJs3yeBMDSlNsoZ6o49SN6N1YdBqIbO8oXzqOcsWHo1s/pAOfnlgnRmBx33lYAQFNvuhm8s07MlvG5fR2L/7GlqW9WPe8nED8NHW7ZdB9+ddBnKkDGpwRRnm2Mfd95SsU5ip/v0qfb4Iratf64pl0LyCchHPVSzsDfqcon+lqMDE+ep5kAGFyfHG/sKRooGKEjnvPzJ+hQ4eOIPDrDUjNJAbaO0V2+zUi/aAXVuANeUgj0YVxgq9PD65SiLEwSQA+x8+FsHCZvHNaSqk9Dqfsedn0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1303be08-42e9-4fbe-b02c-08dca75833f6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:34:05.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtRFXO7+QSetnFVGNywF7k19AAR7FQ+18SElD3wq7vI3Zx6z5IXNnAwLkZrloL+gP/LigOiD6H6bQ7d/DHGzvOl/vn2/uMlTazIktjE5g3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7766
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407180122
X-Proofpoint-ORIG-GUID: 4uGNPiQBEfXeg3Cj8FQbTqG4MgsMzPA2
X-Proofpoint-GUID: 4uGNPiQBEfXeg3Cj8FQbTqG4MgsMzPA2

On Thu, Jun 27, 2024 at 01:34:23AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>

This was only used in the kernel code, so definitely no longer relevant for
us.  And it was tied to the DTRACEIOC_REPLICATE ioctl that apparently was
only used by mdb, so even less relevant to us.  I am not even sure what the
expected semantics were.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  include/dtrace/enabling.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/include/dtrace/enabling.h b/include/dtrace/enabling.h
> index d36a73df..f1ec444c 100644
> --- a/include/dtrace/enabling.h
> +++ b/include/dtrace/enabling.h
> @@ -43,11 +43,6 @@ typedef struct dtrace_probedesc {
>  	const char	*prb;			/* probe name */
>  } dtrace_probedesc_t;
>  
> -typedef struct dtrace_repldesc {
> -	dtrace_probedesc_t dtrpd_match;		/* probe descr. to match */
> -	dtrace_probedesc_t dtrpd_create;	/* probe descr. to create */
> -} dtrace_repldesc_t;
> -
>  typedef struct dtrace_actdesc {
>  	struct dtrace_difo *dtad_difo;		/* pointer to DIF object */
>  	dtrace_actkind_t dtad_kind;		/* kind of action */
> -- 
> 2.18.4
> 
