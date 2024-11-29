Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3C0198E61
	for <dtrace@lists.linux.dev>; Fri, 29 Nov 2024 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732888652; cv=fail; b=RttzmkQ1qA+UxYU8rxN2RPl8YoJSb5vJcRQ9uNjiJutPtoTwrs/VV5EUF+9ZbbfDRzMvcCN5Iwu4pHky2fCS2pFXyTtOrGb+nftbPsK/9NpWptgjG6ryCw0ko2DDhlMIA3SORiBkq5OnxkQ4k/HLIHXYU10rp2GS8uVB3RA8VyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732888652; c=relaxed/simple;
	bh=Js5tUwdjda84MjUYtb/0+RJeMQTEjyX2Z+n6sq8R9q8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=l5+dQ/8AvjahFVH/n9YmrGB8iNjm7QEfxL5fAteG0cTiytweUNBgGFiea06hEBcvx514V5R2qDJK3qFq6uGlI3suxnKCSQOeKBjvxbrA6OMd0mYCIBkL/1R4l17pfhnlLYn59yXY9SG1sxty4UxEPz3RHrHLRl4/JJ/4PX79nPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OfXZ7V9k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yGk6EsSP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OfXZ7V9k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yGk6EsSP"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATDfcsP003466
	for <dtrace@lists.linux.dev>; Fri, 29 Nov 2024 13:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=qTOxEgjCmir/ZEh+B1
	lhGKdLguLjMTlCUC9tHgr/IVg=; b=OfXZ7V9kRKGljhxR6kBVYExRbIMw8pjsM1
	SrpFCfj8T4SLtG32kgKMfVT+b0LEcfC7UXIatR54AtBBaA4GFt2h1OpwbVJaKz2I
	4pzb7Xzcls22C8e16J0x5/zx5UOtpZueJopKlIayx5HHWAJgFfH9wEMGVzVVmT3W
	HgAE8il7nkTyyNBjyp0Vpzy/E/yFKG8PTtHNI6k7UE7/jJR5GD1ulOx68AOgdEWG
	OAwgKxsozv9HW3mC8CSyU3KrpD/J/c4weUb2QJ5XtiE1wpU6RCykBSgG6WDylYiy
	+++RUjw1OFTPM3UgaQH6uuroxKnbxGZzLMsbDPFJMW6HXpg77S0w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4366xxbbh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Nov 2024 13:57:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ATDjcsh018044
	for <dtrace@lists.linux.dev>; Fri, 29 Nov 2024 13:57:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 436706rhxf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 29 Nov 2024 13:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH66RnAL8iqYft6RhsQ4Ta0bbFJJXqa3Vo4fjeBj+s4KtA9VPQXspV0dU+vT7UJdR24MwNSsBieai1FlCiBA3qkkc9mXtizeNkdOWUP//cUT6Yt8gLJo2CO2b07qkQ2kieTHdX934eU0QfNmMliLkHWlVlH0CFKghg10mhMrsw6VPJ2dAV+pUBTxqsviMLNJhOKFuHng2+1yJY4DOIaLhL7KdevKoAcT53n4vrsmdtpdNOY7V2RDwkld/MQIaGGxnqpGH2qDBM4qv6OEJP39KlM6J5wW3z07av+9PzwOkfC2+nsNIz0hABm1u6lomzHabgzp62gmOlbHPAYEnQE68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTOxEgjCmir/ZEh+B1lhGKdLguLjMTlCUC9tHgr/IVg=;
 b=ljv2rsk6LoCp3INaNrtQgyXpizVjvRMSxMIaiaKTJh52W3gINXwYSUGK3shAJRE2elQC3tq/GpK41Di474kSwhW1GoTGsi0iNUMswmn41Z6ec1B8tLAEJ9O5s25rAmEezsaLLc7w2Ithgsd8pd6cDupJ51SVI7Yj6qfU4o3YFVwP4LnI3WnZTSauiH7KqCuniF11kcQ2LlP7NrBsmYjDQxtVBOV91gnDktvwvn5NFU24iSpj2wor5a5eK4GXMr8oLXysDPYk0rw/Yvo0MY+EYbfLnp5R/tWES655V93U+vVVVXmc9/kyxEn8uj6Zbv1yM6iVmTr92JE8jNpRU6Yk8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTOxEgjCmir/ZEh+B1lhGKdLguLjMTlCUC9tHgr/IVg=;
 b=yGk6EsSPee+G9x6ELJh/wtlQ1W29mV4PrIc0KTX2HtDFfAy3R8q58DAek4XfCRYYWSTueu4hvznhCudIrHzhA/sL55j4SaN2e7einincnSCs0eHjT6pxyzRppxRaITDQc8nsIsQdD+XzEfD/5aueWQzjkPp5SS0hKu0YOKO9OCA=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MW4PR10MB5752.namprd10.prod.outlook.com (2603:10b6:303:18d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 13:57:22 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 13:57:22 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: eugene.loh@oracle.com, Kris Van Hees <kris.van.hees@oracle.com>,
        dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 1/4] Tweak self-armouring
References: <20241004044355.25870-1-eugene.loh@oracle.com>
	<ZxwHW_cxAA4x41bZ@kvh-deb-bpf.us.oracle.com>
Emacs: it's all fun and games, until somebody tries to edit a file.
Date: Fri, 29 Nov 2024 13:57:17 +0000
In-Reply-To: <ZxwHW_cxAA4x41bZ@kvh-deb-bpf.us.oracle.com> (Kris Van Hees via
	DTrace-devel's message of "Fri, 25 Oct 2024 17:02:19 -0400")
Message-ID: <871pyu5eiq.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::9) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MW4PR10MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 64906a49-56b5-4401-0826-08dd107dbf43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eiQmpXbGj+aXu4TYyke8+onYs9IxjTzvISh5N5nrK3ts45zWkKAm4ja9zMp1?=
 =?us-ascii?Q?AIGwYxCCA+d+hp/pOumisOfft9TKLc9a9qRUZPd4f7cL0ikZJyCFldGDsXbm?=
 =?us-ascii?Q?hxnJT5xxIpP0BQhap+FFRlwx71dOFNdsxuQAe+BElxaac9eUB0ro+W4oKVRN?=
 =?us-ascii?Q?WdKFbq4Id8Co+UsMSlik13uJxPRWE31kGVvjdVIdKSzzy8aFlp+Mk+tWXiXk?=
 =?us-ascii?Q?lCESqMWHAz+zMclJ0ckgVCNq556V12FFXMqSNdpHGjfsX5wcaPPydXxdZwxB?=
 =?us-ascii?Q?LXSkNDCG98aL7/d0Ge7PZJUK7G7DR3ul1yekRJu5KlNkqVpbV2a6xk9jVM0Q?=
 =?us-ascii?Q?Q5saQlwaBFt1+zqnw79tZZgEouiBm0e2bshbOr0GUuFMcRRiyTTyEWek4f/w?=
 =?us-ascii?Q?FEkoLU8hgPWH6KzaIspHh9ep3J7WMYnKqNFXiNBpPBs+qJ+dP2OorFPBVNnP?=
 =?us-ascii?Q?ZPHUyyX9C59g4A1C3/Qa9gibilqQEPbpGjvFdvoq+1syCsBaRfCjIS4Wpo66?=
 =?us-ascii?Q?M693MfA0ftJC92l5XnChNd4d4UhR2WAGZCRHOS2ZsNb2p502qJjVG8OtfZS3?=
 =?us-ascii?Q?q/DWfuTrJzj0bqdZbatWDakuvv8z8kINb9BoYOR119ENxCPxVeFP58JsiN+V?=
 =?us-ascii?Q?jc8F64gIy5kPcaRrOPmISBar+Vhj97k0vsul4Wicxcxe4CZ6m6ep4iKeM4Bz?=
 =?us-ascii?Q?At6fOs4tGYFBtMMmhfVJHopn983h12LBT5hfTX7I5hB6jGrjLFREXVUQMyQv?=
 =?us-ascii?Q?JlIfzsgkb0D3Cbkt8HmYDUxdVA97wKPgA5bt15XQ/jo5BnloPYhvJn4JqmA5?=
 =?us-ascii?Q?tKrP55XA2iv3nCfjQqjjeWhBQAjBhM7OPY4bmy009IxkSSAmhpj2bZSrQv/c?=
 =?us-ascii?Q?9esApZgQUr3jq6JT7rRbmeI3rc02/5RcN5S2WrY8jD/7+br9XldsjBU6VpUY?=
 =?us-ascii?Q?qYzMid/Derjn5G1bdLixGT9j4cr7SYaR9XQlYLeBfObji4kEbKZeKwBbyzwg?=
 =?us-ascii?Q?Hpw4moffcsD39P0fF0i9xK+B3qhHjouDp3koj/H6L9W9/gsVbnjD9u/TEy5u?=
 =?us-ascii?Q?cF8yqiYaafPTe2+ID8AjWs44gquiBOMKGM9GsPDaBrP1tVsZ8Gk3utfA2SLt?=
 =?us-ascii?Q?EfWIGmCsbBTv5gH7+NyToU3IbVhP4KS9EcnIm+4aqUPgLYOOhfVsbh0+bOfa?=
 =?us-ascii?Q?HQKB0XbPzXN5jDdhMEn95bh3ZADI9nXyLcx/tPHadKcUgsf/rtfb0MB6QHbV?=
 =?us-ascii?Q?6mj+d6lZQu2iYVEj1uPJoYzSud57u2TkY+LmP9NtHDTBz11E2cRl9HJcyBlx?=
 =?us-ascii?Q?0oxLt6Z41KXHS1GCOChgOC6PQbW68VXMT4ZhDtMMZXa9tQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P4SSTANvRuptKUXV7v+UDFKzrfGTfvffMWYzD/429hEiu3xXZCW27LFU/5Mm?=
 =?us-ascii?Q?p3fw37nF0CoS4lrKf5bueQLDppjo421yc27Ch4niLD40hNIkscX7Lkwojlxj?=
 =?us-ascii?Q?Drco9Z8ds8H8sQ2oi2kLqcfavkeLzp/DcBI/cz+rz8smP2T63aDBc4xqV2wP?=
 =?us-ascii?Q?RkcQLZ281iFpHHvmLwKjxN2A/ZUApOUNbN8/+UJe15XuXN6U7lP+g+nZrelx?=
 =?us-ascii?Q?o0eqGPx4d0gx5sGfaUtM6hWWa0EvFoW1LW5Lg+VV4NG5c561qwdvGYRNcNI0?=
 =?us-ascii?Q?1qicPPMpmz43zo83EFUTB7af8Ag9/rlfWmbhzlL4sYXrKDnLr6BJDr/DZBH/?=
 =?us-ascii?Q?oO+DqxZlEHbT4fKDXv5vGHKHq7lxKeDhX4qH1zQ4Q2qr9SaCXmg6KbiJrsy8?=
 =?us-ascii?Q?ojgYmld/jHXxoancOSjPEA1cI9ehKkmBC28kf+w39pM/BcUlRUTekufYluJg?=
 =?us-ascii?Q?7Po7jOV5zMtsSBmPjnuyhGhK+MTluqueyMc+/1eE6HK9EO4FY2PhS9vAkxZz?=
 =?us-ascii?Q?UOGL+SlgVwJCAYA2F163LGsThthFHxBJyQOSyqPX8IC8g5WZG/3UMM9bRpUd?=
 =?us-ascii?Q?+XDR9+o77km4guC56CDb/r4KyKSczFTRwLQodKdEaXIUUHHZtlY/QZheKwUa?=
 =?us-ascii?Q?Rx2BhtE7VDNakHsm+YrjDXuoLjgWWU0lW3+coZkiiuxNafLr9EdRvbjqldBW?=
 =?us-ascii?Q?ppLne2cME1VuzaBoOgfgarX2LtMdUS4Gw5+N1mY2J5ZunWqvojnIeQCSmKsa?=
 =?us-ascii?Q?9nlUv7eHRydOUB2VWL22NwDBhA0Zv9UYG56YUnYpYBbYxBh15kTTBVz0nrj0?=
 =?us-ascii?Q?a6QTFYad+Irn3qHsgmSiogO6qICzMJjCikLVx6yweY/mgzWBuhdc6o1COBqp?=
 =?us-ascii?Q?IfY2YUL7o3b8eWN4g25RffJU5wnFI8o/EIKYqX0C7tBGep18OMllkiY067N1?=
 =?us-ascii?Q?rPzmFEgyH5/FxJeJHuXGWlLQlDP0GRxqyinaCXN9LPLu7VU3N1L4W52Ssq/w?=
 =?us-ascii?Q?H5ay40ptPHbshDrMzscw+0bD3XBzAey4UBJTD8WNgWm3EuW1O5y6xo/9mqiz?=
 =?us-ascii?Q?sY95LbxZ/6ktRgz7iT7NchBP0azXBeUuIdvsVg42RdsAU/oMwzxVkyxtLL/W?=
 =?us-ascii?Q?6teIGd8WVPCdUTe/sTH3qDY9Yua6SIekqiX0wtZJsCWfD8qqN1B3EYt6BsUA?=
 =?us-ascii?Q?fbzWARJi6AeJZCM0odYTdGe67kzU/DzubX/Qco7stACNyQwmOlaObTBr43BF?=
 =?us-ascii?Q?CKYtGK6mydnkHAN3CBldpreSSC2Bprse1vu6LF3Dw0XRhRI31RT/l9Moh+cY?=
 =?us-ascii?Q?+6jaZ0YYZo5Yfq7oOweGP2tM9CDKTYcyeMuMy2xcXqrlUdEV00RsGhSIjzTU?=
 =?us-ascii?Q?pQQoJ/a+tdIP1K+gKsiREbPMMrcxAn9mZbkXPQsEzbpk6AEyhrjUa14/bxIk?=
 =?us-ascii?Q?yb/1zMX3JknxuCCy42wE5+xkQzcuialvTvVesE8FFuG7DavTEBLxjUHyAFJc?=
 =?us-ascii?Q?xfSsq5rIIprOo7N14MgGNKpiz2IOv0QUaC5Xjc6QYFsgaPn/9L+q4fXoERam?=
 =?us-ascii?Q?fErejHiWY57uB8fMJoawxI13U1eET1GrErwzmYJ1w345CtlWUy0lyhCypKev?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aAKjY6GvDF8e5Dovq93UtSeLDmwjBhrMn6EB9IFqColhT4ka8o9CJUtTY/nAC+nCINDT/VYlzqKgphF0XWlxSkhblCdbpMk5vShM134DuhwbC98oOkVRlUAx9eRAtzKxGGYeFurgwoIDNnGAMHNevoJjfCtAlG9f2u20PvON8XvdYUc8VAU/sK/GpZpO4xqzyuRVArXHBuEZyLLMRDIQBJGDnwAoxEuMYXRXKyIdxg2+PPqy0dbm0V3j1J3vc7+ZCsDXWgRGobWHWhFinbDqVxMmaoSiYyewCtw7Jx7elpb+bIaNeS5EDLImUKvg8rVZX+5+chwbNI4Z9gNsrySyn5kQ+QK57xQfPeR56UhuAUoiENicIDKEvQGepXA09s8u7t1QR+CK/NBs0sc1zKLpcyK40lohqNUzFaPDDf+hIMuPzoeQh1cwUvLyhpPtOKI0DXDtDhWWIl/JZQ5EcJhb+JgVmvrnH7tIzKvLffwRBjnPUUfr2zr+WrmzrfPhR2A+j8HlXYHb3W8LnyRMGbpmWmxU43+sRujvp0u2oRWfre88hW6mOUwlVRmDtbnyrZKwaFEJG6EInTqqE8Ri6p3QAAAAltbxg/3cwlYEcqdE7Qs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64906a49-56b5-4401-0826-08dd107dbf43
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 13:57:22.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XujjNIDkvs+hd4yOpRpP2v446nu3IIsj3HitKihUZ3qVsDJlz8o2GJaZG/FJoegxoUVaw91nt3mBlprlTcmVCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5752
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_12,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2411290114
X-Proofpoint-GUID: xj1cO6b1qoGzFCK-cdyOvEjbznqxE_0C
X-Proofpoint-ORIG-GUID: xj1cO6b1qoGzFCK-cdyOvEjbznqxE_0C

On 25 Oct 2024, Kris Van Hees via DTrace-devel spake thusly:

> On Fri, Oct 04, 2024 at 12:43:52AM -0400, eugene.loh@oracle.com wrote:
>> From: Eugene Loh <eugene.loh@oracle.com>
>> 
>> Commit ea592d60 ("proc: improve armouring against self-grabs") has no
>> tests, but it breaks test/unittest/usdt/tst.multitrace.sh.  The patch
>> makes the following change in libdtrace/dt_proc.c dt_proc_control():
>> 
>>         if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
>>                     dtp->dt_sysslice) > 0) ||
>>     -       ((tracer_pid != 0) &&
>>     -        (tracer_pid != getpid())) ||
>>     +       (tracer_pid == getpid()) ||
>>     -       (dpr->dpr_pid == getpid()))
>>     +       (tgid == getpid()))
>>                 noninvasive = 2;
>> 
>> We change a
>>         (tracer_pid != getpid())
>> into a
>>         (tracer_pid == getpid())
>> 
>> Changing that == back into a != makes tst.multitrace.sh work again.
>> 
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

It's better than what I was doing (which was definitely wrong), but it
could still be improved.

>> diff --git a/libdtrace/dt_proc.c b/libdtrace/dt_proc.c
>> index a052abbac..7c3eb2a24 100644
>> --- a/libdtrace/dt_proc.c
>> +++ b/libdtrace/dt_proc.c
>> @@ -954,7 +954,7 @@ dt_proc_control(void *arg)
>>  
>>  			if ((Psystem_daemon(dpr->dpr_pid, dtp->dt_useruid,
>>  				    dtp->dt_sysslice) > 0) ||
>> -			    (tracer_pid == getpid()) ||
>> +			    (tracer_pid != getpid()) ||
>>  			    (tgid == getpid()))
>>  				noninvasive = 2;

What the previous code was saying was "if the traced process is a system
daemon, or is being debugged by someone else, or is ourself, do not do
an invasive grab"; in the one case because stopping systemd or the
system logger, even briefly, seems a like a bad idea, and in the other
two cases because you can't be debugged by two people at once and
because stopping yourself is an obvious deadlock.

We want to check if it's ourself in two ways: firstly, if the tracer PID
is our own PID, we are obviously ourself (this is the process-monitoring
thread itself); secondly, if the tracer PID's task group leader is our
own thread's task group leader, this is the main thread asking.

Unfortunately that's not what the original code was doing (the
tracer_pid thing was indeed wrong, we were saying "if we are debugged by
ourself, go noninvasive, but not if we're debugged by someone else"), so
your change was good as far as it goes... but if the process-monitoring
thread ever decides to monitor itself (perfectly possible with
suffiently-wildcardy probes and a ustack() or something), we'll
deadlock -- and unfortunately the tracer_pid is 0 when the process is
*not* being traced, so what that change is doing is going noninvasive
for *everyone, always*. That's what the original's

       ((tracer_pid != 0) &&
        (tracer_pid != getpid())) ||

was all about: if you flip the latter conditional away from ==, you
*must* put the != 0 back in.

Something we're also not covering but should is that we want to fail
when asked to do long-lived grabs of ourself or a process being debugged
by someone else, or for that matter PID 1, *always*: long-lived grabs
mean we rely on getting process death notifications, etc, and
noninvasive grabs can't do that, so we *should* fail.

Also, we should define "ourself" more widely: we should really refuse
ptrace grabs on *any* DTrace thread, because the amount of proxying and
callbacks back and forth makes deadlocks horribly likely if, say, the
main thread gets invasively grabbed.

Fix coming shortly (before you get back and read this, assuming you're
guzzling turkey now like you should be).

-- 
NULL && (void)
