Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFAC42A94
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742569508; cv=fail; b=hh7rzZxw2aRO0+OVgwNRDxUDRXhEUaT9ET9pFhD9MpNkqKyi18qsykgDKPGUZoGEuCeWXpW5RnKgbFLSYZMLZBa/Xxi1xKNlYPMpdl6RQkQjipbozFvFKO09eRg7JS43D2EU1pTRFk99N/B1QCLHRCVs+5Ca2vb6vj9hu4o1zmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742569508; c=relaxed/simple;
	bh=V5fc/hnxOAjlU8S4ReRorivmNgqrNYt9sitdSwaEZWY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=ppb7fX5tvl5dfSXj/tWf+Cbg8UXnLQI5IKMa0AqrbVz/ctX4tGmdlFkmw0esYeOppzrfqVCnKHgbUqQMDg7O6wKE+OkYYPmQ3pe613CrGs9FHG28/h6O2rEvyyl8DvD5CzKTO+publlZY2LeBZuKZweJovycNDufHPh5d4v03e8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B/nZiakT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IW0xqOrY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B/nZiakT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IW0xqOrY"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LEC0Gv009580
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=D4sDaoC7bdQkeVmk3V
	e77U/+HpBd59ZkzXccxH7t65U=; b=B/nZiakTN9W9HZY6QLtESIObDN9MGtWcFc
	EUKcUJGn4KA44hCp64+dJ4SGPpvCziOkiJyXBhm0bYZal9fz4xw/kV6JucpUiKaM
	R8S/IPzCA9lQow9EYLA21A93lS0gY/QvMBaNPXEl2Fx8mQzKTbCYVj0HVQBEWZgd
	qSX/S27FhqZWmgYDbuMzUlKvnAXlOmjHXth80588PE+t0y6MbEmHvR/JxwYxZFji
	wTAGEWSXuPj7wq4mAFBDRbZILtOdAYPtdPmao8IsebNKsYGnkot3Izz2W0Lpz+ii
	WG3Bc2KVXh8vAe5wAWi8RewGlSnt5kE0ooAP9t6mDboDbt4hWN3g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1n8rddh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:05:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52LESscN024496
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:05:04 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbnxjy4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Mar 2025 15:05:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dg38NyRZa87oJe1bcsNsEzDH2MsSbVvZ39fbzsV3pv4ivTZs7eU6nId2SqgrMUlsMOQgBiZupQpl0TLV9A6E05RI+cmbr0vuY/O0Wge5e9q8cwSXO7ZO7oM49tHToycaYhiGwm5AKmfv8NiVMtA6w92d8a9py3bO/dhMrUJ8ptE3xSetnkFDniWDC5Viyjc6eoHkGiQGe4eyeTnnxEB+PcFMzA4i5kgY5UHmtRdGZ8xnk3y8kGctXTzwqiVj9P5etgvPyMdfWeR81ZTLZ8jeYRos3p69o42cxCIxmp3+E3j0EQFW946xPAmvxoY7yOmEId6odm5P6fczX9/32qc/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4sDaoC7bdQkeVmk3Ve77U/+HpBd59ZkzXccxH7t65U=;
 b=K0Pcoc6Dytmq1izcXgLPxSrZkhMKx7uAvm5gKy+xj1xGUJ4TXlCfhFmZ9MGdGPE0r/eOmXwvxCChLEhBge9nqmhX8aOkfRoZoGxfJUqeosZrxTpnxKltyfHh8OJeKA29YBMIqAr+VIrGhnBr7tYvBeQAX3PLwEq5kc1//ol7YzjnEI0GvEBHHyuK7+RNydMDyU+2+psD5ih7VsDtLnmWZfURHs30rRYI6Z881yBbz2lrttND3aftfk43e/TQRmRnCpFTJac1DxO+JoPL8vNwTYSHPyvFS3D7+8H/9GH+OvvWWX85pMRs3DnF2wHGxEGCQc7vZGMAPd2jznQaTWkoHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4sDaoC7bdQkeVmk3Ve77U/+HpBd59ZkzXccxH7t65U=;
 b=IW0xqOrY6UpyzPpoQSJftLqmALqygvfVr/yn5CPVqtExYqMYL8Uk+Ita2BzFFlUaXbhciJ3v/ClKm6AA/IKVTOM1ZETuVbtqaOKrKrS0PQC80wCjRvfnC3nECqmkWiQou+MN/TL4YuM5HcyPx+BXr4Mxx4SXiafeBnfSq8OeVxg=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by PH0PR10MB5729.namprd10.prod.outlook.com (2603:10b6:510:146::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 15:05:01 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 15:05:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 1/2] dlib: remove obsolete
 dt_dlib_add_probe_var()
References: <834ff39378a30c154da54c67f4093dde.kris.van.hees@oracle.com>
Emacs: an inspiring example of form following function... to Hell.
Date: Fri, 21 Mar 2025 15:04:55 +0000
In-Reply-To: <834ff39378a30c154da54c67f4093dde.kris.van.hees@oracle.com> (Kris
	Van Hees via DTrace-devel's message of "Fri, 21 Mar 2025 10:42:21
	-0400")
Message-ID: <87msde4e7c.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|PH0PR10MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: d602b485-e721-472e-89c8-08dd6889c0a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5X88wqHsej5LMbV9k8epHFs81yCJWYumwUFDEwm7W8JokJZu5MT4btKOxlxU?=
 =?us-ascii?Q?bLSLlUAO4Mqo7kX7K+3LNUGBL7S/bUJ69AqhJvvCm3PoAw4/Tj+QHUODhqNx?=
 =?us-ascii?Q?gPvYTi+3R3md5C38C21ZeT2yjajg3SMqsUS4GmuzzQX6MmvJOowzxZqyI6uh?=
 =?us-ascii?Q?Y9Wl+k4mwTsM7sr939k1k2++GH7LvWjooUyPmQVCENSMc76NHCKfHwKP8gM1?=
 =?us-ascii?Q?Cu7c7zyY5lGxx6PST9V+AKp5PxhDbYeNXrFr+pMt8fN4YEcBpD/4xOhBJrHK?=
 =?us-ascii?Q?T72rVLqWA03wLF52x3LAv2UTb69tJmPpTxEm0zXg0yU/3cyCPRamGrKUvJ6R?=
 =?us-ascii?Q?GrM+OmhsQ/8rmYNdQFq3FCalcRK0n0pXf3BRa9iCErjF2fIa4TqsCff5XM7z?=
 =?us-ascii?Q?QZ3v8PpH1UsbTSqau/CMhQ5/6jiCcCQTl8oHDNq10cTd8Faw84+0YFOX0PA/?=
 =?us-ascii?Q?HjRlknrWu2GTQfxVEXf0VKsfz7NGXty21BD8bwZAnaJsbltTTQnoUhV93/9v?=
 =?us-ascii?Q?6/nhYhGEs6Jt2N1q8gsQrz3k72PJ1m2NbBH+QwQw7nUm76PItIwGElE7Pyk/?=
 =?us-ascii?Q?H86jXAApC2tEiMczXx6MH6zhQFsyvhOoPmQM3vPyw2wWhtuzmgVxbwR3To8l?=
 =?us-ascii?Q?ViX1gKtitbN52rIxWQsyzEM0QCx1NXAzFjMw06SlKbBaakuaBJn33niUTTdh?=
 =?us-ascii?Q?tTFphTThYv2SqQ7VxUL8+nqGo8tlKArk7bp/wqL+r0Ogz+SSkBYEkTLISvns?=
 =?us-ascii?Q?zsuuy6MhI8HZl33dFrLnUO1dYHTOy4bfLinvstYbOkLd/IVIJHsbQAriJtZi?=
 =?us-ascii?Q?9Vgd0LC2tKIZlPjplCsDFD/evdMMXZeO2zrQOv80WGKYr2frSpdxavWxuNU3?=
 =?us-ascii?Q?wL9Tkwrw2kjcNwXlVis1S7556B/5fOMtyW8XTuIcnZiQH9PQIxYRA/oXHdG/?=
 =?us-ascii?Q?Fg3TmzxPbWs3EmzfJw+X27ixGJSBfsTNoylSmgsyyPFXKsRotwFHQPaYptXe?=
 =?us-ascii?Q?T2uL6KM/784HG+z/NpV4vf203U+BmY0wmxsAn+r4B8H41+cuUHnwj3ImLY3E?=
 =?us-ascii?Q?6LL+PGgp/sghdkajINcaKsN2O5uW/4yUHGJS3asFc1JqWfoPBrhrddzDJA62?=
 =?us-ascii?Q?YKkTEh2Rq52VAMA8sNk0kjmEEt7hsjbWVPNY6UQ4c0HDR6W9t9fZvspMN7NN?=
 =?us-ascii?Q?czt+nOvacQo8JbPJnk3CCeEt1Zi81i5gzhD5Juf/fPLJKcTTuHJFEW05L0Vu?=
 =?us-ascii?Q?4i3EAOzxm+CHanIPTVZkUvbgxxjh6vhK61dzJ0OAlUohcEhluZUP3Q7IUpIJ?=
 =?us-ascii?Q?pv6EO54/IioAmF25irgpZZRvjGcBMcUOt3ai2gdY+BeEmwTuexxyf67qmLsm?=
 =?us-ascii?Q?eDxlEl0RvxySWqyHczzbY/YCbbUD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k/IITcnlmiKljXd8/lDRCYzhHUskrLddgpcIDrbAjvYu0G2XzlquFpjC2BW3?=
 =?us-ascii?Q?S8j+khcR5DWoOkvwBiA4P44E1c2WypFInw9f6m8aPGHJ63M6k9+322nWKwLn?=
 =?us-ascii?Q?9q+BPBonp3HtUCVs7/t5GjLzNiL1dGDUq64GFNhz95uZO5O9UDpOxiZBkjgX?=
 =?us-ascii?Q?ByN8DcndVABytO04u3cv878YmGRM/9Ss6zhHpIZUVBtIOASflwN5QWe5W97/?=
 =?us-ascii?Q?pkXeNdXAeMM8wczPjgYS+xJRk9PmXAqh4ZicFD2+mQGpSlGYVMvyJ9759KbS?=
 =?us-ascii?Q?T3CO83dg6FEcjAlGzl2UBN9iCate+QDkZZIirgsBBJ3jsoN0U7Bpfqjhpcew?=
 =?us-ascii?Q?6c8im0ckgK3yP4yCcg2X4O87YlJGQlVvrAF76l9Kdnq6e8TKA38JUSNRuvgN?=
 =?us-ascii?Q?EPSlq2fMzPH5VXme3pmQW8VMtcsTTqqGzw6AyiXKR8+vXtKOqd1R+TIZbzxu?=
 =?us-ascii?Q?qAXddwkNEUTvCWOhgcvf8ROU4G2Mew50oQUcx/pu4j3flP9orvcmlAe0xPrd?=
 =?us-ascii?Q?mYBxY8VkVOKGfEZxIdpsWRFHaB9IgvnxH5aUgzRttoC9HSMxK0fQyMqkxDpw?=
 =?us-ascii?Q?4nfR6bMagFbY2FnwWPeTO5rx43FDHVA3lU+ZfKPcQG+jYQCDiEAp7hx7zQlx?=
 =?us-ascii?Q?W99V8mZ9dsACArMp8kOIOYQu1JJSwFF12cENC5CbO5McC43GJNSfigEs4srB?=
 =?us-ascii?Q?OG9zBeSbaTSA+v5HzF2C5fvxpvXF/rQPvafHKBGXz4Wp9r8t7waOc3dJsXoP?=
 =?us-ascii?Q?jUlHgUn49jfPjibVDn8SPxlGAZKIf8sFs9mzoUb5CrumaoVX5BLzpy8jAOFF?=
 =?us-ascii?Q?lSqLE8WuKyLggzFJvlELLIQ8itgkAAUPATYJi6NUzwpwh7plX2vftQLMkZ6N?=
 =?us-ascii?Q?VlO03x1YOIsNhh8AblLC9nVJR2FE1aLwh9IxznTzB6W657NyzfFsZ0e3+zyV?=
 =?us-ascii?Q?l52CtXaHIwn7ULHtT0AkAOeKTnwHL5zEAd8zp35SgpgXri/ukuu94XKt2zji?=
 =?us-ascii?Q?xZJTvNiyI4EA6omfVd2ZS0sL4kbn8Pnxv1SLN7sogUZQDHwGvkYv1WO9Cwh2?=
 =?us-ascii?Q?nogxPBH9+tcgJzpRJBghZycf/eA2hziN0vI5DqG4eyZ161X5jHVKyBBJTy5h?=
 =?us-ascii?Q?rjPL/xuyEgQ0fklbtqwdtmPESdU2wqX9UtKqVjNszkUbwgv56VjVbWkUBF6r?=
 =?us-ascii?Q?Z7WEesqbwZJ9niboJdUbbi+C6o+gXPKYsxuOeoRfOP1HtehZYYDo2ffNW5QN?=
 =?us-ascii?Q?H1Xx+m7RR4froAMr+xup3NlJzazlnbV/lNUi78tENL5F5z86vlb92m6VgMCp?=
 =?us-ascii?Q?TjK6HZtK0YRLa0RIemv0FQXdrHPNqaPJBdTZuNSqWlFYklkTKUho8D0Gh/Ve?=
 =?us-ascii?Q?2Wv++DdNWJeOqfC6j9yUzoN3+Z6BQ6PGqKQV4U/35KFIeEIWtoplQToKBpjk?=
 =?us-ascii?Q?dz7cauUDNWXQCNTdNXqEa1nVJk2UP8zQAGdJuBBxdbXuSo6KBcIDbZ+Q01D6?=
 =?us-ascii?Q?2PccCkqcKT3mCMaY70ygYDnwG3RJmM9XEl7hGT+JVy4EzqgH77MBrvg2H8dP?=
 =?us-ascii?Q?XFYJRgjKaW1zMUpPXII94HPr5qJwzUmhaSMr9/ZVmZjM5k9LP7o7PVHc8eTn?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZgiCdtYOqcLHJkudWJ/gOcGy1dhQf1lztw5fN9VgYmKtBnLgF3ZmAS2FXxPmGNM3ILucxyYIwjag1PAaoEsLBRMjFNq8zc59U9NPgInM2NERToiHM6Ze/nSRkqg+XFczlmL5itloWhmDMXAeM408XRLUibq2ivxqoQrwMC8Ge/1F7uRVlbnzFgMEdpOGTwXNgYodho65I6omika9PQaWw4bKvf7JrMdps9ZwnViMngFLn2iXpe+Kbldwek8xSFupmLbiDhq1xjacndoqbwwbOcHv//CrYbaNnySBUZooHs8QuEynjBOB6wTZZbO+DCW60kY55dEN5FTH8EbbDCMr1+mOnhqOyFkLDr/P6Qk9SjMCCkKlAoago5EzRC6b9j8W6CNf9oqWfM5B4Z4RmBUJA5J27LnTo0zJjHgCpNFgyoYGQ63U8MoiQKBSS7vAAVR/KgiAJJRxzDjZtElvKIznpsMl9hDkDAqlTNNjkBfHL3v2SLCFu352sx2If9uAOF2xW+icn3NXSYpMmArYukadQUWGtrYCUwPG5YouVZ1A/T0D7UFT3Z+85OftWfZ0RVfTOW+8fjvZlP8n84BxlyXkR6i0GLNqp0b7pQXF9itoJ4U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d602b485-e721-472e-89c8-08dd6889c0a6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 15:05:00.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vYTYQgA/lQcgHPH2SKvTZrzmkUTD4NRKoJ5Q1fSwF9RaYfo+eIoFyn1mISNLjHUxU/HWFyNS5xt01naEjZOj0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503210110
X-Proofpoint-ORIG-GUID: F5oxGimFkZyja0Z2FX9IWe0LelIY6D_R
X-Proofpoint-GUID: F5oxGimFkZyja0Z2FX9IWe0LelIY6D_R

On 21 Mar 2025, Kris Van Hees via DTrace-devel outgrape:

> The dt_dlib_add_probe_var() function was added to allow for relcoation
> processing filling in probe ids for dependent probes, but since the
> probe ids are known at code generation time, there is no need for this.

I guess this is removing a relocation/fixup which was always the
identity transformation (prp->desc->id being reset to itself at reloc
resolution time).

If so...

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

-- 
NULL && (void)
