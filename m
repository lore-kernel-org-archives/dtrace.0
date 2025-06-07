Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176321C6BE
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 18:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749322084; cv=fail; b=cgKT+LhV3V9uxo3H6ybb4QulX7N1YHChH+XMJdBdv/zEsszTze2C8ewcP6VUqJo5iuMmt71GrpMHi8bkUR6kh8vLaBPWY8eH3sHyq0WvL1nNrLRvWe3UeggOvzKdcLrmUT9fvyHxf374NJgD2rQj95v8pYYGpoAEfsd2lXQz7Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749322084; c=relaxed/simple;
	bh=aJeSwMFbQ67vhD/9mVegF8rZ3uzattnP9t9EEwWNZqQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=fq/lSrpOoQrvC3ezpVLVah8ahooiQ6ajD0s8gHXdvcxHe7STdYKQ25lVzdUTX9fR88qD4nneXXv+nACsnLcHuXQmctF0oMFmWJzZ4srWBPnuUrZcRLTKT9ELRMUVd4gRjjJIRC/sv+W614PM6xjaRZZuBZ+kWJfxLjcL+OxtU4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gOUX4WuD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IADvdXGQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gOUX4WuD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IADvdXGQ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557IeVZj028606
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 18:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=KIkeBKhSPBxkkyCkfC
	/cNZIq8WIDKWvWWWImcwYH4ak=; b=gOUX4WuDWT3ZCKlNwHaX8TnCh5eo69lkAq
	/19OgOlDkHAs/iXgmDRg4BhCJzTUtchTUMnOBMSzGv7aUhPUoaMR4fNPtykXg5O2
	D8mcRXffMKzHfghOD0OWHelPd+n+D1CWzOV+Bcb/A2X0pt8y81L5sywyJlfn6pU6
	764vQ061yzz/snixh3LxHBy+wqFXZPU3jGPx43mkdQafWGuZlQEErBumjnM6vILp
	V3KnhnBvYWSKMeDtbUSnW6pAUiqDv7Uk3gr9EOZkd2yKnqb+1qG+tQZGegnitKZs
	ARTdsR9emFIIZvVVubjC0/NePoScrBEh13Rfrrhf0Irp4PyyB1mw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1v0dh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 18:48:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557IPcKr021300
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 18:47:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6wm2d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 18:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7UELWmAf7QzOM9aVg5tzDR6zi5VvFsN+fmfyy+bSbCsA9ovZrDk247Cyh+81pwFtXtKiaqjw23PM4w2Ywg3r77jGh9mg7MUIvzBbFQqOOwvDQY2DWTpJ6V1Igt90IipDQJNDutsB4SGO0nEjZtVBBpLz2uxL2PxAbjzMPaC283WtVAkrwDbz56GhWCU0nM0wyeHZ/+1pVv0IiFp9WYFkQeg1z5TYQAp72A8sPjQ5N2iPo5AK+LMNPWL+IBjBNPdTPnA8PKwhJQ7ABEv7xUkYrqHz7ta1qPylEqJDLdTmyPrVXV/v0ReaZ4281FacC2HWZ6INP2griNvPxLNm8/zyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIkeBKhSPBxkkyCkfC/cNZIq8WIDKWvWWWImcwYH4ak=;
 b=ULYWPNXELjI7Xd+djWn3QJR3MFGvuV3zSwuNJEqfEydEy3yAgrTNXc4Xeujsaot33oTnK5gVZrXBtIfcjf1VPIZEQa/w1uULzpn9CzSpmCS9zehQRqY6pUM2oCqwxMJYzIBWFjdBDjmcL9TnfIFUmcYs1nmWKosktBj9fuCzIvWzUxunBiOazY+3SDZEh4XvD+AOO9gnKCFp+R5Pqkr9Zy2wTeC2BpXG1EjdydLauYcH7U6S1G7DjWG4gp0DD63cvvcwMyl4YcaXI10CPRo9vIfCBOg4REF6uHpUlckQesTa6eE25dz665jCNf1p8twcQekfS5uKcNXXQN7esc80HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIkeBKhSPBxkkyCkfC/cNZIq8WIDKWvWWWImcwYH4ak=;
 b=IADvdXGQ/dzHO1AaiDZub+rmnn5Lsj4Jj16jGh/cM7LbjEFVPdFAhp4SpKnPHQMOjXIuGDuQzvmvvV/ON4IMm2babZykWSGh5UAM5Hw6dlRFtX82B221+aOyMk2etMtwAC/cJ4wJf8JNomQccsKlJP/QGvF1QPCRaRwtRqEyUvU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DM4PR10MB6205.namprd10.prod.outlook.com (2603:10b6:8:88::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Sat, 7 Jun 2025 18:47:41 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8746.041; Sat, 7 Jun 2025
 18:47:41 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 15/17] link: implement USDT probe
 definitions in ELF notes
References: <IA4PR10MB83741578CA0D3BD0A3C50511C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Emacs: if it payed rent for disk space, you'd be rich.
Date: Sat, 07 Jun 2025 19:47:38 +0100
In-Reply-To: <IA4PR10MB83741578CA0D3BD0A3C50511C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Sat, 07 Jun 2025
	02:15:06 -0400")
Message-ID: <87ikl7jsmt.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0456.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::11) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DM4PR10MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d0ac8b-8556-4831-9ae1-08dda5f3c850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AUURBhkstEh+E2PwK5fn15i6Hpt7G/XjGatx/uPZZIenU3qu6foKTecXwHH0?=
 =?us-ascii?Q?zXFEhWBMYxKz+pO+Ji/bfMsPJF0jzgCaKCx0lQHMPW3wZs+7oTtd7qnaVjL+?=
 =?us-ascii?Q?No2ADMnlOGP9TGzWVrw4mj1Y7H7RZBlLC8TBUIwGzFUxfSvnFpG53+BMdUUn?=
 =?us-ascii?Q?FHiBgOWLsEhhQhhWPyg97lb/LBDU2V5xmp74+gTDkQ58vVRmmmkXqxKf4753?=
 =?us-ascii?Q?Ycvkp0qhA9r8YmsQXGhGY9ot4cR3EP5TsB1qcSQg9YI3eMIDO23Q7PHz5SYc?=
 =?us-ascii?Q?xYEfkHmR0j1ChcvIMlEms+XLOeTWaAZtBTpaut/syHxaAVlGnc8MNL/t5ZIC?=
 =?us-ascii?Q?4aNePCnxcm9pp9x6zMLQAnym40mVI+9tCtAn1FbdU/D864vHfomNYtpcxKxC?=
 =?us-ascii?Q?Vy14JvDTAKGEzUMpIqaHN378o51ss7/+jDbKaTO82I1MzTAY9jp24ys3VWGO?=
 =?us-ascii?Q?3RdanvnrY/JcMW/bgA36y9OuM9G+CiP0nXIO7nxSE/XbHmJ6+yDi+uptBstT?=
 =?us-ascii?Q?XpsHsPpObcGbt6FHj307SfwAl3lmZXtMvlGExI0+/5PHITy4qGuV4QzPOZ1E?=
 =?us-ascii?Q?XGeVXubfQnA+2Sfbn7JSJIO0NDsLReMt/GKIC4AJhTTJaOQhmD2MKgKu9YO8?=
 =?us-ascii?Q?bjkPkuu6j6L8ZKSoqCH+8lJ+vs0ocGrCQEkLpOBUcy3CaRu8hdThwagp3M/Y?=
 =?us-ascii?Q?YGNQ6f8tFEQe+bg3idmuFd8kcwRi5OjuUwyIn4TW6BIDX6O3UDKSd+T/iqbT?=
 =?us-ascii?Q?Y1WzGLMGxf9EbADsZBNBAm49qFfH+Osc0MOCBe6pzO+GHdD1RJhYXgQYdsSS?=
 =?us-ascii?Q?rJKDStKfFrWzQFXRTNoXpizA0Ysveddtk/05Va/vpr4AREEek/Xr+VjhtYDn?=
 =?us-ascii?Q?lFBvVsbEwRUbfEn/CVNLVxeGohLmzgnI9NlnekZ+Lu5omOtYlOi1DQak46Or?=
 =?us-ascii?Q?DQ0RUi/ALfuqJbGXRwejbYbXBP3LtbgO5gsDLboQOGXdjjXzVSjjNK5vMMVb?=
 =?us-ascii?Q?EpOYm0wuwtF/keaiB4U/J6j/LPEjtIuCRydkWkgEtzra9uzoHJnr9aOOQFd8?=
 =?us-ascii?Q?Gj666gB9dk04kJWOmm6pVE4+F28YKrAc8T8CZZMD3G8mg2OjfX+uk5MgMejj?=
 =?us-ascii?Q?srrZHt5nw36IvOjndvZRcxSx93TLrm8h46wGzHJkycNDu2ksZxzeYm4e3WMX?=
 =?us-ascii?Q?B0ds5xOPfOOws1zVuls49t4VW4T/aYak8jaghce4dYTR2HXzNvPZaBeLekAr?=
 =?us-ascii?Q?d4fQgbGPomoUv1Xcvq/l8fpp7GAwVI3UtEZRWuvRLWh4t5HzSVTtdDNT6wcP?=
 =?us-ascii?Q?ht0lAyhUR5OLHREfKTw039CMwxrTLM2PXwx+ZREgLNKXia399hOfvR+o3ko1?=
 =?us-ascii?Q?f7lv2/PIRK8J346WpFUlOIWIq6pO/EEzuLQTqy701YpkCVakcAHVHZokgAzv?=
 =?us-ascii?Q?8RitiLHjWpM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xh9eVFXAqmQznjd8RW08iNfIl7ygIimVgqypU80JOSjijz51iWvfu9h3H4PY?=
 =?us-ascii?Q?BXcN8qTx8iDkNvf9z7xHlulJqHWSFco+CjPY9GPMKII2iZcjIP9YYqSmyfKO?=
 =?us-ascii?Q?c99MyIiGnDtroJtmI4SASef867GT1vBOi8np5DeOVxkniBTGKyo+iQPXAVNs?=
 =?us-ascii?Q?rce5UDb39Cm3FTEZ6wuLKvYjMkVHxvWwCPs6pYeSM7CWtydm1iBNj79XBBng?=
 =?us-ascii?Q?95Shif1jN2sa7zzt0EKmCJmxw0uuB1TRW+lixKvTP/43FjHHNXgfoeXwY27f?=
 =?us-ascii?Q?VV+UiVlc2WyejUaaFIQdHWBlF9S0lGkT/pQR7LN7khQ2TJ+G9nmi9hMTzXXu?=
 =?us-ascii?Q?EXAH1IzYZUQy37Xn8YhrxgwXAHM0DxPb37Y/+TiFwzGzXhxuiR/dDx7Qgqdi?=
 =?us-ascii?Q?SuuM/xFSNec409IB90mMLdx9i5o08u+JYTo+ne6/YU4U7eMHrbQf1ja0ujol?=
 =?us-ascii?Q?rYxbDhRAP2O/CAipO7j3B4HKQViowxZ4E5BtyrPgfuBy2nxt1PoO8aQhQCr7?=
 =?us-ascii?Q?ULCvk4SF5UIGGHzm9XENNyWF9sceqeoscCvau5VEztyJUNRL7bV6XEkhxJHj?=
 =?us-ascii?Q?wR491tzfxn0lgdZrBVE7fqNXiZzNhZZc2gygoPZTOoeUdC3Rkk00dEHTvxqO?=
 =?us-ascii?Q?J8bJ8qXiGQVg0zwp8lSU8ewtKCrbnb6R2KYIwqnee6OQE0uUqmh4VowZ56Tg?=
 =?us-ascii?Q?m1BRttqRl15eEXJgMH4n0afIwDGpBosNYQ8XXush8vDpDK9Xm1Ek4HVgwQ3L?=
 =?us-ascii?Q?dskZZgX3WTE2n/6lt4bomwcPMCzQ081Fmw1zojbNKuknaROTPcEiI7sN446R?=
 =?us-ascii?Q?RZZRUDX459kIGgF6TTO2r/JVrluzcKZnCOae1uPOLAOfj3jFGf/DYlV+fMCb?=
 =?us-ascii?Q?t6iaUvyLXTlRZmFTsavmVbZV1am3V59p4cz+8ab2SxnXiuShy5fzI39hqd40?=
 =?us-ascii?Q?jGT+O4s1qXL6txMj2BuSe0xDEFECWsCGrguHoRh+E2ZKxFbvtDpPfmrBwm0N?=
 =?us-ascii?Q?nR15rZj/MBNbpfI3GU3/+n7DAOTf4EnB9gT0kJjytW7XNpvufQrbYT0+wNKy?=
 =?us-ascii?Q?s/sbLoy1kwlAaq70mNRaEIejoQ5DoRr0Sm/cVPSJYxLYop1509XizgCoNGFb?=
 =?us-ascii?Q?GBuUJJ4wggzOyZMZlqes058sviCDAFXU3E2PPJdDKCCu6v6nn7EeyR9lq2DA?=
 =?us-ascii?Q?VLMYwmwp4Fyan8evl1gbK13ZZbFicLBhlW2mAMtDOWeExO0Ya9ZrO+mphiYZ?=
 =?us-ascii?Q?+t7+EiQrx9h/hJb7mF9T/QnlThi2qRIDAx5Cmo0Ab/5KH1vNeZw/nms/I/Ge?=
 =?us-ascii?Q?19LioyT5pPRs+wlFWGLrM2L6NWmGFpsG4mp2NU0fs2raJXldiNdafJnsso24?=
 =?us-ascii?Q?kXcoNmfAi5iA65HbKKtIGnUKuev9otUDlbqdbt86cES6idqXIJoObuABAmk6?=
 =?us-ascii?Q?OYxI0NbcbrOYUEX8VegpUwEzwlYAPC032V09DYg7h2nZ3UI/cjlySuwVq6W+?=
 =?us-ascii?Q?qbjeGuIuieaaCNyyn/wK15ZdDlZovDZf4kuKufTAj1ckXelpjZs6pZvGgafi?=
 =?us-ascii?Q?maPwV43gwvfpsJtDYlXQwMr/5slQnAHYaDQz2haZUMRthMIRhbVo8GJyjc+6?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dOuwyyzqdcgBhqUPRYePHtg939rtuDbLmP3iPKQKGu6S5/Kofw60BD3NqqMdcQH2lL/Hn0MQ7veCTzA0EiM5RfIVWgPzq2jTtQ0mH58fqUwvqKtQI4dW9b6KTgu8KoZHjs6yfYV0pZaULyPR3m8Sc08HWu/i1ROpqcnIrsbE6bDqPRwVRXKP8K1xvwgBP80qBH3T4e4jPGcgH2CHLanLZq7jRx7Yumg2tKrVkT2JqzCN3b0pajmC7m0lIH8yCNW3HOVR4I9h9s2mljpZjIS92oylrd305GvWbE8m9BEwunP2gpGrAzGjQaJtKzo6wDbl0asjIgsRf4W8uznjc+qwM+0dso5t3tij1pAuaYPOM4sF9dPM/4N8Z5VtHN1hXlNZr3bq5Uh4ECxeu2XymVtbYvLNrClSXS2dP9M6byOKgXaFBcw5nCg4myy2x3EIeV3M4D2DXcZRU9Lg6N8nBTnjm9D3w/kh4r/Nmxw9OmUyNgfo/mxIrQ/1Wz0MVFudefBlcrzCbRBcA/6PeLEZcX7MxKk1Oia87Om5mTQ1ev+UIJ1FckbHX6V+y43suz/DmytwsLiM/8BPLO/7vUWlW4+XkyEAxWAl5/9SzK+rdN47laI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d0ac8b-8556-4831-9ae1-08dda5f3c850
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 18:47:41.3908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQtHEVP8O+tJwGyGvWfgVeKtlykzdpScI0HzdBSWMJIIt5TWGIplhDZ/g0vdtLVDVey9SFX/IqYChFHxi8Cm1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6205
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_08,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070136
X-Proofpoint-GUID: gE4uiVFKqm8TseQolUH9PEdVjF_nnGDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEzNyBTYWx0ZWRfX3qCKOhy2npXT e18fAQIh6E9apV1o7ss5+kaZErrundCP1+RlrJDBQ88gvGe/y6MiFNvYJyRYd7HHFJE0/qZ9/Ha /NgihMUJgDxwlEG/8j5rnZR4ZkhZwiePkMoHNlqpde771fr1Wgt04G9F7u9lKdM9b9Gvf7RLzBC
 VC6c2mDIg2aTGlfgamg+ucvNtqx5oVIqtO/fNsLeICvFXsLbSDtF0RYKy0pskxbpQABWcy9oKfP 6aQ/oziyO89UxUoV0xuEvq4+F/I9mcrK0hRqhBVBfqkeismpXMsi3amMyZvIZnpUfym8TuCfsvO h5YqDbrrDrw0/QfOPO1TBv/mHybQoeH2XUIM1vsKhIJM+nPqj6sxixN5YHnKX0n1ocCQqHsgu0i
 gjL+fM7Ujfn7XXdFGRABWzP7/lrVxBE7S4xvAFY3siPSbsN4braZTXI9lw3L5kgfBWuK0jSg
X-Proofpoint-ORIG-GUID: gE4uiVFKqm8TseQolUH9PEdVjF_nnGDm
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=68448961 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=g_S0C_GEhBkopLO7OUUA:9 a=W8W4e29Vb2oA:10 cc=ntf awl=host:13206

On 7 Jun 2025, Kris Van Hees via DTrace-devel stated:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
