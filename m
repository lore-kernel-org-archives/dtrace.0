Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059E11DDA17
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738164829; cv=fail; b=Z9GPeGixsupQ0MTf6Kj+vDF+ejHtNr11NKVHdm0YJatze2BJUr3u3fadUyN4EbSLHiVUE0U0x64fYMqMHUFwppSbsZFL5z4Yvx/m2Ej18Nlm0hiPOSjKAsqpI8t5fn34bjvbs2D4RflkbRu8UpkUP+Gy1SO6Lbbd14fmbw8JPpc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738164829; c=relaxed/simple;
	bh=KI/0t5tlB7XRixoqKgbmcU4otX1Adyqq4b1To1/d3DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ARN0GnTK6mizFs0s2gHCEJVclK+yYe7BeOBeU7tJsBUn0gJip+bE1EWl6R0+48sMlQrvxSiQJolrI0zk2otOZXB53mhT1uNqIrYVVh4COlXglR3TR8OtzyGHzrUk6xE8STtyk0uEzHnWWQd5EBE51xYSOnDFXmfCyb+g/3PD+G8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Oue77D8J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=APqGAJXV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Oue77D8J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="APqGAJXV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TFMtoD027813
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vAmxVt4Bw2PVmCpp0J
	VXwHxUz3/O789mJmc0eGKQi3A=; b=Oue77D8JGuGgF5tN7Wqtgk5kZsiDNfAa5F
	HTo49ZPfjTLaPXGjsN5KQMKrzJ4uXGCG/2nVeqrShuxtsYceg3bkFprjwKmd5ix0
	w0w7yEqfDe2lzVLWwfALj4cRct++3mgrydTKovHLqTkuMRQX7ZRNgnBauRrjk02w
	KZgNbFAniAwK/3iFDtC3e10gdeFkAjPXoejww7XVbIIFGNCr5Bgzy0LE8kUlyL48
	oVm4JGuroossuxEQZ0jZgEjLyJhzW7j+x8VZqTBF4dVcRFm36jd4NMtShPiEGfqd
	Gh9UfLRjR82Z5nxoX0dMIaaZTqI9HxvIqIr2sKO74qbNg9cgWbQw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44fpfe03np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 15:33:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50TFHSgi034141
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 15:33:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd9und6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 29 Jan 2025 15:33:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdCnmhjwhC4QiCa0GDeze2njEHdxnJgvt3jMYE+9LnToo/E6CVv08Mpv4xafbJrOg4hcjd55zZt+Ux8GS2mwx/k8EPIwnTyYmRkqfu5M06bzrXdJW58QS7HCms3Fsx6CA0eyu4uiBoAL6jmZWaFdz7T7ps0qYko0V6q7Q1X+H5BfjriMhC0TaSUXFrkF0tTPzctY2qh8JdJbHsdfgN8TN/k/KCVWyZFiHk8XIWXg88fk1KwdLFLfLgdS7wkFewjPesCBJSmGk0wQ8E6uldg7FxKKGcKEjrt/v2Bj6PzG7ibHPLUIeHDD/T0IUEKNkX7coQsYS13kQ093FBxcz1d75g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAmxVt4Bw2PVmCpp0JVXwHxUz3/O789mJmc0eGKQi3A=;
 b=sStubFvRvqZhnsDRkl95SHY36xikuUdPI/H3aitC4RLoCENfSjdj2yl+aHk97KbvC0PG80aGwy8SbN/9tAjgsLPyslfq1GTSz+k3jFuaciNN+AhwTl/UqpIV5qKSDTteC8F7nB0tLRQ3rti3DK14ibXkmS4IIZM6KCvKJfvbRnbSRWKbkUA8Y1USNMHuuCfakM0l0ZUZk9wQpZAFCwKcz7HaoTWHj4w937mzOJufQ4WRGZmXd4tHoVaADKICBYtOVn/vVIR81Zz9zWWR62vwVcIglUDSae/y/IW2Mk5uwEff/k3GTX9BDG2+TRea7vxHchJ+BnedDRnlkAD8jbBHrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAmxVt4Bw2PVmCpp0JVXwHxUz3/O789mJmc0eGKQi3A=;
 b=APqGAJXVdUxSfCCtRkcmRMIUmqKUPK6UKiLPAbcI1v5xk/UjLWmOdxPFiEdiyq2G9R4zxepmDBgkXy0Vdndwj4FueDC2wIe3g2fRq6FfLPcAf4bNnvJrQus6xBPssFmoAqwX/NrcZh2LdSE2QmXBJ4QOGw3zxScj4+Cxfwl4HuE=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by BN0PR10MB5093.namprd10.prod.outlook.com (2603:10b6:408:12d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 15:33:42 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8398.014; Wed, 29 Jan 2025
 15:33:42 +0000
Date: Wed, 29 Jan 2025 10:33:39 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 0/4] ELF note-based USDT support
Message-ID: <Z5pKUy5EOa7U/Ita@oracle.com>
References: <20250129145522.512341-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129145522.512341-1-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|BN0PR10MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: f5154e42-1de8-43b7-5007-08dd407a4f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kYCrSraut0kcJjCIn6FhCLrIzsrZ9XvU1MAVJ/WwnWjfFKLyuGnS5Xpy3ALJ?=
 =?us-ascii?Q?vB+/EJegax+fNfweVGCGsZ5VIvtb7V9Zadrd29Tizlg4YNty/XV9tbCWwlAl?=
 =?us-ascii?Q?FFGOzvdRdTS8Rd5MnzC0HS29+Vk8q7ntzK0GQSYMR1vhwb/lBU2QBbXfwX6M?=
 =?us-ascii?Q?6e9vunz3sBQ8vz7Xt6T+2xYOVAOpUErR2jYEiFxb330s0eEy8wmzDvGgdv8+?=
 =?us-ascii?Q?u92QpcxKn3d9qvj6XEeLfb2eGB5MUM2QSv9deuwn0zvbdx/0kC2+IE5jvekp?=
 =?us-ascii?Q?FYP1raYQj33n4apWcSZP16BiHpDis1FDMwzLbg0RK6Wogkhfds7WiXJxp4Vf?=
 =?us-ascii?Q?CGcHesEal4cY40N5UJqEHZzEprStkYW2CBBY+fZTtiPUk5TGEjNDESP+Zq0m?=
 =?us-ascii?Q?xqTZDXP/GcCU6yiUbKpsn72KwWU7WekEjRQmYuGaMiN2/v06/d2xGVVkgQtO?=
 =?us-ascii?Q?oo73tevFtASQvZxOf5rp6uO2SBtiab8qDDwZeOC671J97/RBD7D013A3GMj6?=
 =?us-ascii?Q?NjpqJSh1Hqi/fZgitfLLAaNKWS/gQsTYO8c1rGtpWJMO6P3cfozSwAlir7M9?=
 =?us-ascii?Q?LJoIvZBMShjUnmm6ySyZedAQDs0wTDstivTZtcKCZxe9hH7VX0kYUzBb6sAV?=
 =?us-ascii?Q?kmk/doRPlhPkbL0SHO3BezK5KqtyXI/UnQFLQRxRxI+vHgovlHMiC8n/4qvW?=
 =?us-ascii?Q?B+ZrMRQ5MvXajOHi31uabwgwNQ//8L9qgiHjCzvTMwDZJlCkZiguiEYk0jY4?=
 =?us-ascii?Q?2XyS3io53OT8swaIHMWGPocGgA57ULFxyA9zPNYeZBVUGZCDoUI52ZVkh0ME?=
 =?us-ascii?Q?T5VGQtTvUy488hAvMiWec15zP+KVCrWd3zLlIJ301oUfVgbIwE09J4ZckK6o?=
 =?us-ascii?Q?mYPNOPeDjd4l3ESy76xAucIvGnp4cnSyVxeVsNRW6iHD3iH5hJ+b4QV7hQjM?=
 =?us-ascii?Q?w1645rdvvfSgZwkY+Jjx3RzRIKyeZjBf8J57ldFHm/trQQ1cQ+Y99lLWFZf2?=
 =?us-ascii?Q?8IViBYVR+/qgCadfDVXwpqLszBlfahjqh4z0PnVite+qLm5BPF2UAqqEi+Cb?=
 =?us-ascii?Q?pcA4Vk/wiMcNzMxRBkCGJeDweCZ9vF+mD0KkR4MIJVE6ZQs9G0tc6Cax7EUu?=
 =?us-ascii?Q?vvajzYFd4BUj24BBMkmBuNjznaku1xv3TE7QvlyjdWVzzwLHWyI4+vmrRd9v?=
 =?us-ascii?Q?j+dpaa9gyiwC2YIicN7zk2ZI9c792hGGQ+gk3H/5PbC1dLce5mc6G09kKKcI?=
 =?us-ascii?Q?6oq63gMn7vExMC/2lMpU1nLN+q/iIp59yLyUX8rqcqwnwMN02nZFm+ZsGNXg?=
 =?us-ascii?Q?YFo/zklReOJ4yqtbZKOOP7KbBQPYYRkI/wdYx8wxrFRidgbEjHf+zoEHToyb?=
 =?us-ascii?Q?G8V3Qw8qsSC35hpwtPMS3E6OozW1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D0VKUkehBsWJi9/fKAMFPjofmbJK0TU2cEhb6XMPy4GYEwrug/l2FxugNx4D?=
 =?us-ascii?Q?anHY57awPIXBQdDRB8Qhoa0vu1TOT/MywqsUcCvQHld8uCn6mfnmM+sJZri+?=
 =?us-ascii?Q?fjIyYLtuM4iwXyQOxIlS0043B6KaQo1wOThpJ2Zjnf5N3zIvQ5Xm2K07JDOi?=
 =?us-ascii?Q?uw8gkb/kXuE9DxR7qRyU/kaJhnGBFZvUfoDByrSi4zOfUAEIAiBLUaw5Lftf?=
 =?us-ascii?Q?/baIWrv1vTslPUewnOOqDK9UdTdnx85RQBDIHlO0CKzze3jytOMpniWg5qWb?=
 =?us-ascii?Q?oz2yMnVxDITf83TC3cfbd9LdDkcsGL41h7cRU0CHJtEnf9v9kzJFxSzQmKXe?=
 =?us-ascii?Q?F6/v7f2500WS8wib/u7NMohkRzWJYd+GkJojbTYpXkHxTzPiq025DQZ0GbsN?=
 =?us-ascii?Q?CABiLt7+2naBQ+ja8yZbjGI2UqbNf5pttoIiuJSD39FoYzpSZXHxAQEpxJZn?=
 =?us-ascii?Q?S6PghI7I4AMU/9v45E2Ur2bclMaV9odG2650t8IExomI4oMOE2PhG/lhVmK3?=
 =?us-ascii?Q?3AZHS25lYAoi+raTWG9FWwY69nEYwMCFXXJ9b3lm+eT6r9dtRDMYIWg95Bjk?=
 =?us-ascii?Q?8SQVEJTeSMHlRPdn8CVpNODyRxLwQmPlHfiHZlS5APpA0J4xhJhMWvqowKkO?=
 =?us-ascii?Q?IWbEwpqA2fXs6iuTap5I/eWgeQ43y4994n8HFbinbpfe71wwII7S3S3uk2dV?=
 =?us-ascii?Q?amo7Id+R405GuUSwS96XVVZrQja/dpWkbMD4hBLteGo/rWxx60hcgsG1NOHP?=
 =?us-ascii?Q?4q5n/hgogNd+NWHbMtlrIRPhKT2PfpmUeVgcls2zFSGE0JwsKlkD+fbY4QU0?=
 =?us-ascii?Q?aFIiSfkkbo6DqnIkRdb8eyTyhvG+yxjxyU89LsYNChiGQbtHd6kjjSzhPoJx?=
 =?us-ascii?Q?IjRXGO9v4lPil7d775soTCCxnjRp0tVDxmq1MsyTyiTrsN3rimxhpykeOC7w?=
 =?us-ascii?Q?pBiNu6U98BFvOIE4jfaPswF+v92jc+Cvf9VnsEjWtkFz8LE1Ayy7CLcrK8uc?=
 =?us-ascii?Q?vHWcQMDJg/TxNOoz81lG6+ukynt7vFaiw0M8LBgMrzO89AihVQefRt6TKiRF?=
 =?us-ascii?Q?0xULbWHwGTm9jZLr3JHAPySi2IkpqPB5B4NwfLmegmXyfUAE5WvJgMarMeDm?=
 =?us-ascii?Q?kjCb3h7Muor+wK5nA1KM1kDA2G1TbtL07NUF16InMACvz/Uhp2K0WzPFsW+c?=
 =?us-ascii?Q?Ud91iE7awd8WaSFIIYedZJVRFapR136fxe3bdm03ZF96MX8PxlBrfFHzA75W?=
 =?us-ascii?Q?5u9SJxnFZhZiBQ4DOoVk/ZnECCQlUxPs++XSF6Fbz/Qu3Wq8NScmEO1zH51E?=
 =?us-ascii?Q?Q3298XbJ4t11DdalZ3govFY9Mh4eii1aBr1Ru+AIMWHlmcbW8cG01XFM/eAM?=
 =?us-ascii?Q?mqWrWCMAxsEaqxDiPmSbReMRllG59UWJ0h719l5i19R4U2HUPQxNsi5hnNzZ?=
 =?us-ascii?Q?ESAae6k+V6RTDf65Ey2g6o0qUiwdS9LuQME4U2l14AtFj9VL58lCX+xp+AAw?=
 =?us-ascii?Q?+Tq4SkCOPHIeKHyYLaHUP6od0yl7yjikG/+BbzGmleGxeVBsR1Fo4rEotaZR?=
 =?us-ascii?Q?42XrK/qrHmPYLnxqssFVhr2Qleko2fVYHlS2Qy3lUnY7yt8guMMtY9gbhfkz?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Tfo5Gh6KtYDYfS2BiTuMZFSn4eTKbPXmOk+P6iYjPEoc/mNSyD4aAj44dZL4le3y+T1vwK++dQqQE+l+0UddVEHlgHaHnfDBaUWxVB8TZvi/R2inAWOGuknS8izKZdSJx7kMLLI6im9Um7a+0W2QBFo7d7Fv+Qkhf34J7HTjzsaLz6cHDlW33vR1eHJPoQYjqIvbS7YL3DFOMNMWK8+udEtA+R3ijsX5D0s5eAO3x5M+1pp1wZJC/f9s5wjIaUo+yALdAEv92oYqKZQjTTlH1BzydachSV2Meh3CGo5GFr35cvFgtIXuqt9wBJXMxpBB/ezK3uLZaYVyKIFERtoNJZZizYf2oFe/iWSzSsDAT2A4eEmlElnG4spq4nkMtIp1nbSipNvD/npBe5IjA396S1UMlnWKBjn/KX3aC6t2YVkyaCN++5D3l771xyNemtnq7srQGC5D4iIpYikbXkuuRm+mYE2R2Po4tMEb5PpP/OdaTBmYXAm65iD+hCtvt3jfkKX2UZg1V9FrguTTKsxgTz/6OsVl7JI8HSXcDHpASGgJ45qWuqIwXLbPH/fYvgtOlKViDmIsfkKoLUUWsff61djl1S4360RUZr+Atfx2/z8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5154e42-1de8-43b7-5007-08dd407a4f72
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 15:33:42.0952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/ITkoVYNkRiU/k0Cul04F//PavvS2dH4z1jL45ug5eA1SNTkzL34eanKcVIw6R4RSdiZTWzl3L0mtZOU+WagSJIi30S3liohJcSTtmzYc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501290125
X-Proofpoint-GUID: 1vtFWtGxxIhkKnv3mcwIzo0TlWjhpmYv
X-Proofpoint-ORIG-GUID: 1vtFWtGxxIhkKnv3mcwIzo0TlWjhpmYv

Thank you for rebasing your work on the newest tree.  That will certainly
help review them and move things forward.

I would definitely rework the commit message though, because

1. DTrace has a specific understanding of what USDT probes are and how they
   work and stap-based probes do not provide the same functionality.  One
   example of that you already point ay: they are not discoverable - i.e.
   they are not registered upon startup which is why you need to refer to
   them directly by provider name (with embedded pid).  I think you need to
   be very clear about the distinction.  Using STAPSDT or stapsdt might be
   a better choice than referring to USDT.

2. I think that the commit message fails to highlight that this support is
   to make it possible to trace programs (and shared librearies)that have been 
   built with stap style probes.  I don't think it is in the best interest of
   DTrace users to build their executables and shared libraries with stap
   style probes over DTrace USDT probes, especially given the significant
   advantage that DTrace USDT probes have (see 1. above).

3. While I can see the point of mentioning how to add stapsdt probes to
   code, it also is a source for confusion and thus is probably better left
   out.  Since this is a compability feature, surely those wanting to use it
   already have executables with such probes or know how to create them.
   By including it here, you also introduce the very unfortunate fact that
   stapsdt uses DTRACE_PROBE*() macros even though the probes have never really
   been DTrace compatible, and it is only with your proposed patch now that
   they could be used in DTrace.  The systemtap project shouldn't have
   piggy-backed on DTRACE_PROBE*() in the first place because it causes this
   type of confusion and complications, so I would very much prefer not to
   highlight that mess with this patch series.

The stap probe support is very significant because we unfortunately do have to
live with a world where there are multiple ways that such userspace probes
have been implemented.  And given that packages are released with probes and
people may want to trace them makes this addition certainly very worthwhile.
But I think it should be clear that this is for compatibilty/interoperability
purposes only.

	Kris

On Wed, Jan 29, 2025 at 02:55:18PM +0000, Alan Maguire wrote:
> This series adds support (patch 1) for ELF-note defined USDT
> probes in binaries and libraries; patches 2-4 add tests.
> 
> Basic pid-specific USDT support is added; i.e. it is necessary
> to specify the target pid in the provider name such as
> "example1234" ; future work could add pid wildcarding.
> 
> ELF note defined probes are defined by including sys/sdt.h
> from the systemtap-sdt-devel package, and are defined in
> C programs via
> 
> DTRACE_PROBEn(provider, probe, [args...])
> 
> See the tests for concrete examples.
> 
> For python, go, etc, USDT probes can be added via libstapsdt [1]
> and associated language-specific bindings.  This allows users
> of those languages to add USDT probes too.  For example, the
> following example program adds a "pythonapp" probe "firstProbe"
> using the python-specific libstapsdt binding:
> 
> #!/usr/bin/python3
> from time import sleep
> import stapsdt
> provider = stapsdt.Provider("pythonapp")
> probe = provider.add_probe(
> "firstProbe", stapsdt.ArgTypes.uint64, stapsdt.ArgTypes.int32)
> provider.load()
> while True:
>     print("Firing probe...")
>     if probe.fire("My little probe", 42):
>         print("Probe fired!")
>     sleep(1)
> 
> We can then trace this via dtrace:
> 
> # dtrace -n 'pythonapp503211:::* { printf("args %s, %d\n", copyinstr(arg0), arg1); }'
> 
> dtrace: description 'pythonapp503211:::* ' matched 1 probe
> CPU     ID                    FUNCTION:NAME
>   6 286628                      :firstProbe args My little probe, 42
> 
> [1] https://github.com/linux-usdt/libstapsdt
> 
> Alan Maguire (4):
>   USDT: support ELF-note-defined probes
>   selftests/usdt: add test for USDT note-defined probe firing, args
>   selftests/usdt: add test for USDT notes in shared library
>   selftests/usdt: add test covering different forms of USDT note args
> 
>  include/dtrace/pid.h                      |  29 ++
>  libdtrace/dt_cg.c                         |  47 ++
>  libdtrace/dt_cg.h                         |   1 +
>  libdtrace/dt_pid.c                        | 466 ++++++++++++++++++++
>  libdtrace/dt_prov_uprobe.c                |  19 +-
>  test/unittest/usdt/sdt_notes.h            | 504 ++++++++++++++++++++++
>  test/unittest/usdt/tst.usdt-notes-args.r  |   2 +
>  test/unittest/usdt/tst.usdt-notes-args.sh |  51 +++
>  test/unittest/usdt/tst.usdt-notes-lib.r   |  14 +
>  test/unittest/usdt/tst.usdt-notes-lib.sh  | 145 +++++++
>  test/unittest/usdt/tst.usdt-notes.r       |  14 +
>  test/unittest/usdt/tst.usdt-notes.sh      | 121 ++++++
>  12 files changed, 1406 insertions(+), 7 deletions(-)
>  create mode 100644 test/unittest/usdt/sdt_notes.h
>  create mode 100644 test/unittest/usdt/tst.usdt-notes-args.r
>  create mode 100755 test/unittest/usdt/tst.usdt-notes-args.sh
>  create mode 100644 test/unittest/usdt/tst.usdt-notes-lib.r
>  create mode 100755 test/unittest/usdt/tst.usdt-notes-lib.sh
>  create mode 100644 test/unittest/usdt/tst.usdt-notes.r
>  create mode 100755 test/unittest/usdt/tst.usdt-notes.sh
> 
> -- 
> 2.43.5
> 
