Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750BA23A9AE
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765517681; cv=fail; b=JFYAvNOKWtsRsqZjxGarwKAIawbQOof6sfAnp+HKNOAo/pk0rK+9cStHJeczNxbnxsJ2V9X4ETObPrxAEpHFyCjQR0jKFPeocGWE3bsHk6uLVxXgPGld76qpdxX0mF4vZWqJG+v7kYcWxPt6lWgQ9zlr8HaPcKr0AQTqPh/xRiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765517681; c=relaxed/simple;
	bh=lkVH5XVjm7/5edYQ8mnS2ePalw3Bv1I/VnxypVuyjqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qkbMc8MnN6n5pvCBt//BYrVkv8TcfjClToqhJCPdSVY5HES04kuTH23B4BC6evzbI6KnZAEFw2Ltm5Y8KT57SzBWQAZkR/7sXgCvxa8zmCw6233PieSskBOTsuUwwUFu/OUrJEvT7riahPSd6aFQXF7YsBBVeEKL/UxV2A6Al6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cIcqdmY+; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DOiKvDJ7 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cIcqdmY+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DOiKvDJ7"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BC1gOVa2870381
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tCxcf4+UCVMdzCiRlsl9NscEP62vtiFyrqEAH/sbMvg=; b=
	cIcqdmY+bn1MJr/giClGZ/lvYky2enB82pOV8IrWpfUkF5If6Cli58Apcc78UjvU
	Xoh6ZtbWZOpbdtdb3Q+zwwK3JtO5bzjJoo2eazxFnaTdTcPDSAtIHYOVjxl1ArXi
	aXTGbpV8Yr/urPaljJ+iUSG0fyKbirZrG7NA0q+Td+tGXcJ+SqgbLBo57NrQRu55
	xJFxuUXecN60w7dqtGs7yMfY25au0slVTSBDwvnLKIZHEGH7CnLSY9NAIiNv59kG
	Wf+oXc7++RNj9dzpQ/vGxpHVxEV4h97uqeqQO5No4BtU0K5R7NxGf9ORgHC7fhMh
	/QyUgwp4yt3Ji4rk0KTgAQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ay9y33627-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:34:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BC5APM1017515
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:34:37 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxcdxd5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 12 Dec 2025 05:34:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5z/SuZL92VDenB/TVXyANWZrLBmEDJCxjJ+mRVdgWspUUC3nENYeEdNvdWdaSTfnzJmVfdfNrjld5fm6xvrgSdN1PUhrAeb9GB8ubpe82z1L2Nmb5mJpVDviiVTqF7kaC4eaeLa1kce9Z3GAigYZDq0F+zB/kpggfdLHiQleM1cGDgiE/gH1klEFi4uxxc2OuUe/UZhej/gIlqxAnBW7LrDFQ4B+tz+HU0VN1EzcplF6DwdnyKBZh/tVVAlBpv45w3GqctvJiZukQrbQZ3mKSx83967vroobBe9PJO8FDZpjH313qPyFN3Jz3WvK3aW9pGdJj2pWVnoT7QXUqJNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lUxq1i7EG00Pqp6c3OL6QbGT1vzpViEgeDZKUeewO8=;
 b=sJ2jl2ltRRNVra/Pq0A+GpwdCz7u+1wXrNcE3fii5aV3HL+49rj6tMrar/KN3cLxbX0GM9kc07CxqR2vK9A7iI9aCn6M0HJfvyu9gfij91KKCfXOrGXmZoucwIcJae9h45Vt1pM6jXHoOhnbi1tZBXsZgu36y2q9JdX1WSprQlzlcBIAP/LH3OFZj/b/ZCA1CgQo45imjY9wA2SrIsyitB4sRvfCoqMdcgPm2Lvab4aW5d/v7I5HOUJ8DZeuOsuuCxQ+Eh6lwKJsHOaA/2d/kIlKen4Vio7tj/aWsJAjN8PCuTL2xF8ohbU7x1ejTYLXUJdNYWtSekgdHDetLjB5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lUxq1i7EG00Pqp6c3OL6QbGT1vzpViEgeDZKUeewO8=;
 b=DOiKvDJ78YG6LLLjSxiD/cMyFck8SDPGLBA3haRspR8lk8mm2tTPSRu+dVkwy8uE3KXj6vz6FFYW9eJ/nUGJcTG5Bx44iSFXkpjEGVfALcw7AR2mgTemMoky5OnNcur8BVSVT9qhyHwaCZNzvXLwFRGHWquAm9jrAxL4bawgr4Q=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS4PPF415C917DC.namprd10.prod.outlook.com (2603:10b6:f:fc00::d19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 05:34:35 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 05:34:34 +0000
Date: Fri, 12 Dec 2025 00:34:31 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] bpf: allocate the buffers BPF map to fit
 highest CPU id
Message-ID: <aTupZ395993j8Wu4@oracle.com>
References: <DS0PR10MB7522B465E54B5F7C69B0609EC2A1A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <31311402-ac1d-3c3e-4e2b-5e0ae861deb1@oracle.com>
 <aTubzAk0Ls/rv9vk@oracle.com>
 <0d4939ad-ad66-4b84-753a-288b2096d212@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d4939ad-ad66-4b84-753a-288b2096d212@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS4PPF415C917DC:EE_
X-MS-Office365-Filtering-Correlation-Id: b4df122a-f6fc-4ac8-45f0-08de3940214b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?nMZgISRcJL3a5aNvxBVXjmPZ40Tu0q91iC0xHzzSpqc9EnF9V0PZN3radz?=
 =?iso-8859-1?Q?tSJA9P9+7gt5dCjZTmA5BKRwzP9GzSoK0+fb+Xw9zmgAKvM3spc+5ZF+7b?=
 =?iso-8859-1?Q?AijcQNbKUZkYRSltGaTfQi5BmrUipv6sEE3ZKvCYtSEaGQ+O1VB4tXEK/U?=
 =?iso-8859-1?Q?bx3fnJHLP4RpcqCrT8fOhsdufuRPn5GqPI84VCkA2UMNmTh2Gwx0seuGDP?=
 =?iso-8859-1?Q?7HN+T34VWt4/ec3FpIqgfMBAjW12nBiRDbvW/2ShK5lpi+Vg+LTIojEc3W?=
 =?iso-8859-1?Q?TrayhFgd9AkLSAZ+NWTYjSTcu7zQPRDqMUFRie3B7lb3/HuDT3R9Bl+oBG?=
 =?iso-8859-1?Q?IRJqa01PvnrTT/tjSlSfjXzZAfg10n9z/Gi6zzZ8w9g1115H1lFPrQr8+C?=
 =?iso-8859-1?Q?Tcgc6u/sYXvnW1dJ0OTfLaRbn84hNv4Fc+ePX7iPsFdqPLArz1KDeU3DWz?=
 =?iso-8859-1?Q?tA/XdbviSeFXwMXD9H0JFf/FIzc1GBLmAl4zG3AKEM4nF+MwzTiVil89BW?=
 =?iso-8859-1?Q?hsYUHuD8q5n3apqc9RyvDS/RqBqoZx/P1KU7moi0q8MxYigyNFhcUYCECM?=
 =?iso-8859-1?Q?E0qZ1wuuT/4zlfsGuK7Mj0vcSuQpO/L6uQCwwFbow/S1hKfiBgTFQoVfIy?=
 =?iso-8859-1?Q?8kqD9LrmfQbD6wfkWzsSvrz64fB1jm2VRhzpX/MU/GykS+zlwgfC9LkqSd?=
 =?iso-8859-1?Q?HBk0ULxtti2NYL5BqLHj4XIUGpv/+FuPjgUJrYzliepUwxmuzEGJA7oFui?=
 =?iso-8859-1?Q?dcuS4RmTwkbstchafYWuay2b3lHsm+uuePq+xrg+g6ZjyKMdw1T+dqTDde?=
 =?iso-8859-1?Q?YvbslsyM4IKZz5ccCUu87xtBJsTYAdM2UB2fQvcxBPuObNIZMeePfnUR4K?=
 =?iso-8859-1?Q?jEwLFIj6aT4ZdzN6ZsiNpEn3JqvJSnM3N62j+R4r2bsg866O0nM6k8UzfE?=
 =?iso-8859-1?Q?/XDWuS97U6STWAaYBwBBEKQb0aQsS/EEDzamUx4Qp7cSKAyknbakIDg6xL?=
 =?iso-8859-1?Q?UrYXVSQkDO75fOcPHgdegQWLBQVtraMUq+yfxzdl0M0maZ6FIYNUdraYq0?=
 =?iso-8859-1?Q?1RO8rg11uXdcFZWRD2VZzapE6akJ5TiPiDxJ/qzdhlSofXoj3y/cLQONvL?=
 =?iso-8859-1?Q?PQX/9vipmV9ONCPgj6P6NX40ZYiD+Ne3lsf+gi2dY+078DgN1nyJ6Z+wBU?=
 =?iso-8859-1?Q?34mmqE0Uld9l2wwuRQfWjjb0/BrddChWwjlfkeSEvdPcZYnzogsPpN52TH?=
 =?iso-8859-1?Q?HYHLg2SI0k4j1eoX1BAx7AepBhqoDkueUYyvRJjehGnA0TvX5eoTgpIsDX?=
 =?iso-8859-1?Q?+BZLpfHeWXiw2Jahh1zBAj7d6QY8u5d7mfHqYODZoj5tQpRCq19IYxuRWO?=
 =?iso-8859-1?Q?RvFZ/KE/vnv5FM+iB9sZN91DrNro3GWwbm82GNxDItjbX4S5b1XeFZ3oos?=
 =?iso-8859-1?Q?LWI1C8Ck8saPpLwLxDbjj0nPnt+9IbkDrH4Auatb/dFaTzgis9sztA8l6k?=
 =?iso-8859-1?Q?KGDlw/EUK5vthTyvn/1nn9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?QJmhdo8hPSJz4O7HnthB4hgAKxlqXzYh1tlyJ5y/eCERFSJwwU2RH8wnzd?=
 =?iso-8859-1?Q?KdKKVbDKIW35Ze+/DFgDHFqUA6WYZCLx4ouE/oG7EJ0pW5WZc+lZDwfx1j?=
 =?iso-8859-1?Q?+9xIEd9wmmFFyGNZiHpO0ZOAS1yfuHrRiATucZ7JfThuzoeP7lfK1uWIFZ?=
 =?iso-8859-1?Q?9xqLUJwS7uR6uECA+Rgne0muRY9eXgfxDVZjCNYJw9PYObIuaRJJ95wTFZ?=
 =?iso-8859-1?Q?87sKZyiITfIZzORnxsBloyWueny+RnVodbsmRFfy/0LsrGcjBx5OPmDhOp?=
 =?iso-8859-1?Q?BLoNpwoOqp0mz0OtkaRWBuTar/wApqh7JEW1HfKp6KgdahNmW4KOEDJBzx?=
 =?iso-8859-1?Q?ZpUcYIaXv9ZQmw/3R8Yb8NoizhCLauvNfydPb1w6ugvCKc3MAaCr98STI+?=
 =?iso-8859-1?Q?e7g6xklq3pGf+4LhDsG4sfJXmPQhwARkfA40GZiQxERkLkC3q671/XKcDY?=
 =?iso-8859-1?Q?Dvh1VaHCQXWWj4QUrxtLiXQZVwrJAMbbJTrZUKsRJey3QtBqzhbPVrc1xi?=
 =?iso-8859-1?Q?fYl591kxKm2qrJgQQd/xqS1hBfvOILfZfrJUnf+isNswbcXYqphPMWYmoG?=
 =?iso-8859-1?Q?9g4PM9DG0NaKBe999tFPTDz2F7pUvpyCfgUmt+zfNmVY2hHfh+eTJbH/zu?=
 =?iso-8859-1?Q?vWnj8PSid/8WnJ18lwivJpd0yDNmiiFkXZmel4lAL4wo1PbYGuSJoL/54c?=
 =?iso-8859-1?Q?4eiR6F1yyv27hdJjButuz7/3RXkbTyh1RiqoS1OVJ3f1MA8pMU5aDPSZZf?=
 =?iso-8859-1?Q?GH/S3wfR6dRYJW7HJN6iiRrMZ3D4NgAsln+35kvEgiUi0NcqdvrsYAssAP?=
 =?iso-8859-1?Q?tlLk7uhDHaFpjT4eKeGdnrNU0X9zPKp2YpHUC0bHXL8fv2J4zObPjRFwOF?=
 =?iso-8859-1?Q?/cBSkc7q6FdA2Ku6kQSzRdDM17ri2htZo55RUzsF5/GBAGRMbm1gNdFTWl?=
 =?iso-8859-1?Q?C+nrThM9zkXuNvkcm/GFUAW0L8lvpAL34NzNRp4cBjVtAV6J/GS+ivPDV4?=
 =?iso-8859-1?Q?ITW4UivzK2kOsuWoQcMaFMU1LhMwaKKCNlU0oUUopOGYvMwTT1r7eUsrlw?=
 =?iso-8859-1?Q?EnB/YkzqgMIv6rs6jazMjNteZwA00LIXolpCC+9m72mOXt4O+GNEgBcMUs?=
 =?iso-8859-1?Q?i0RfZdtP+R6B+JMc00bI7+KihBLmFlNV0Z3pBFJdk3dqsOlwOvxGR0HXsE?=
 =?iso-8859-1?Q?9HK4sG7znXAJfrC/kFdG4VLkJlnwL//W5slFhyZ2gZRDwvA1davf68id31?=
 =?iso-8859-1?Q?gzMCRcoJWXR9qmjdl35CqiHmvNKEn0LxIi7RiA6qh8KixKirkmLIwXEZSr?=
 =?iso-8859-1?Q?nYKxqcGcnvlQ2pIPGFMIG0wfCnux9+XpLXZ+yP5DRgst5Tl9zrKqddEs0V?=
 =?iso-8859-1?Q?OrE0AYPHReyaroo+2tzP9x3gxX1C4qBBsF9N2tbUoBWazhISwhDg/KeAZ7?=
 =?iso-8859-1?Q?b3C99S0ZZudEtHwEJ0l3c3jJ7Ed3+N5g7DUBxY7F92OCKXe4GXkSNuHDdD?=
 =?iso-8859-1?Q?3mYkUr1I1dIqHGwtiZGmgpNKxg9TAES8FAniSzi97rhc5OPUs2Y0X8wLIm?=
 =?iso-8859-1?Q?wzoT0iopwXEYLMFvG+W+gJWS/lNOTDTQHScMphZvw68+cent57v6GERroN?=
 =?iso-8859-1?Q?O0Z3CnlgTcE1E7GijbDv0/R/7pw7jkNGnDFxiVZ7617fgCj4Bmeoz3lA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NioVmY1MIzqRqGIJuMXVX4RHQycaOirRjFyv5NcAubQGm/K/W185zpN3leRlwHIKWMXvCMmOSy0aQmZAUG7gNRVl/elnqy6GhmG0L2YgEe4BvqmHDeK15m8HW9qtKeLx+5caEiHdqpS+93bELGOFjVinj8N19LWp8fqAwscD+OoGs+J/7WKVH0m4YZOmupq6Q6As4+4C31IvukQLP8nA2PgIjDXALJcS5bdY32dm1hpBmTNWGTm+qgEBnNRzOQTG8pWnj8yPb6nKbfodPiSWx+7DqHIfCJrtCU4iMlCVf1HBiA38YW28EauxUl4OD4P7nTTXvcVGYlOu/mWOqWF9TMpvsVVafLjp3HgSQ0wMb3b3qUZFa298q6aem1dMVRuektoChUjZNiox1wY/BXh4SN7bf5OARrhPLczead7sxMdFFgjOnSqf1QxKSGa3tFG4xflOnq+0ROeWdwkq0CWZqxAM9bUVHAYa+u6BVj1JfYRKTtQGXOJCeHcJP34oCyG5iASuSV2ia92wMgLM75QiuVF5yuqOyRt9qUJ5qXIpMM07QB4SsmOUJeStJzR6pWd4mmsV+Py4pk23EQBk7bTjxIMmwe+g4MJN5wedcxUlSZc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4df122a-f6fc-4ac8-45f0-08de3940214b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 05:34:33.9209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCcc/Nk4ikjVDteoGlEVMdMvq1vpjj6wUvxCEThV4s+8Vu+rtIALEYf39xM+gEnajRqOkSae4KtfHdBZtq22FfkH1vS5XYhsv7oI1dvlnzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF415C917DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_01,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512120040
X-Proofpoint-GUID: FUAHKvnCkTLCOccmEf8RCbEqrysLVGEz
X-Proofpoint-ORIG-GUID: FUAHKvnCkTLCOccmEf8RCbEqrysLVGEz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEyMDA0MCBTYWx0ZWRfXy14Ek/ZGUofV
 s3h7iAdvdJUIdDVjflR7zUeRQZ1iWeKKzW3akf8fGS3tTsg44Dd0ZUf+FwPEnFCf0V7Qd+lw98W
 TogHrxrEITpTuTmhUhI29FDndVWNmxzIq0hdtQl66K4vX25UMVqYvPCWJAzqiLGToVlsvHxA1ex
 FtzwpvT/O9a0jOgmFfXTL7NUchmZHDlEc1r78tRwgkeFmMVDJZaHa5wYa7HLpjVR+i4THkI3oRD
 wEHTZZvdvEw54x3PSwMwKR93IydjuEadgdi3udh6hW5h+zlxDpivMcBmFZs8ylvlLvN4UotH2+k
 HS578rdh1ea7iEi8XbXKCjDqdRCub19ZzIzX9CTZAzkNPtqblNpM6FjhpCfDGvpEcYtYUYO4ruq
 4ZqMC1FGGiw8HHHrlJmuojtAVLTzTQ==
X-Authority-Analysis: v=2.4 cv=YJeSCBGx c=1 sm=1 tr=0 ts=693ba96e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=7iiBrIxIuIbUdaTtZpYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10

On Fri, Dec 12, 2025 at 12:14:20AM -0500, Eugene Loh wrote:
> On 12/11/25 23:36, Kris Van Hees wrote:
> 
> > On Thu, Dec 11, 2025 at 06:16:37PM -0500, Eugene Loh wrote:
> > > On 12/11/25 17:22, Kris Van Hees via DTrace-devel wrote:
> > > 
> > > > Even when less than the possible number of CPUs are online, the 'buffers'
> > > > BPF map should be allocated based on the highest possible CPU id because
> > > > probe data is written to the bufer
> > > I guess a problem here is that we do not test this case.  It would be hard,
> > > but I suppose we should change this situation?
> > I am not entirely sure we *can* test this properly specialized configs.  The
> > problem came to light on a configuration that conveniently demonstrated the
> > problem because of a large gap of unavailable CPUs (0-127 possible, but only
> > 0-7,100-127 were online).  Because in that situation, it is quite likely that
> > the CPU on which the events we are interested in occur falls beyond the end
> > of the buffers BPF map.
> 
> I think at some level we agree that it is possible to test but that it can
> be hard to do so (automated, regular, etc.).

Yes, but quite difficult and very specialized.

> > > What are the chances of our at least writing out what is per online CPU and
> > > what is per possible CPU id?  That way, a future developer would (hopefully)
> > > not have to reverse engineer this stuff.
> > What do you mean?  What is not clear about the current implementation?  I
> > do not think that there was an issue here of things not being documented
> > sufficiently - I simply made a silly mistake in the code.
> 
> Maybe I just get easily confused, but it seems to me someone needs to reason
> through the code carefully to track what is per on-line-cpu index, what is
> per cpu id, etc.  E.g., the "aggs" map is made with ncpus (which in that
> case is max_cpuid+1) and the "cpuinfo" map is made with ncpus (which in that
> case is num_online_cpus).  So for someone like me, it'd be nice to say what
> I should index with what.
> 
> IIUC, there is no documentation, let alone safeguard, that these per-CPU
> things are being addressed correctly.  Instead, we are to read the code and
> reason locally about whether that is right or not.  And then we do not
> (regularly) test the whole thing?  That just feels brittle.

Well, yes and no.  We have BPF array maps and we have BPF hash maps.  We always
index CPU-specific information by CPU id.  When we index an array, the array
needs to have sufficient slots to support indexing by the highest CPU id.  When
we index a hash map, it needs to have sufficient slots to support the *number*
of online CPUs.  That is where the difference lies.  It is not really an
aspect of our code, but rather the nature of array vs hashtable.

> One thing I do when I look at a patch is ask myself whether a problem that's
> being fixed needs to be fixed in some other locations as well.  I didn't do
> that here since that's time-consuming and tedious.  I guess it's a question
> of how thorough one wants to be. E.g., "We fixed a bug, so we're done."  Or,
> "We found a problem that could occur in very many places, so let's check
> them all."  Or, "We got bitten by this problem, so we really need to test
> for it."  Or, "We only have so much time, so we just need to move on and
> hope for the best without thorough code inspection or regular testing."
> There's a judgment call to be made.  Certainly fixing one bug is good.

Whenever I fix a bug, I do the same :)

> > > It seems to me that this patch is an improvement over the status quo.  On
> > > the other hand, given the limitations on what we're doing -- notably, the
> > > lack of regular, automated testing -- that should probably at least be
> > > acknowledged in the commit message.
> > I again do not know what you mean by this.  It is not an improvement over a
> > status quo, it is a fix for a genuine bug.
> > 
> > I also do not think it is fair to say that we lack regular, automated testing.
> > That is something we actually *are* doing (i.e. the build-and-test robots we
> > use internally).  This is a situation that primarily has not been detected
> > until now because we don't have all unusual configurations available for
> > testing at all times.  A system that has this gap of CPU ids in the list of
> > online CPUs is not common.  We can look into building a system just for that,
> > if we can, but it is the type of situation that hardly any automated testing
> > would uncover.  You simply cannot test everything.
> 
> Is there regular automated testing on systems with gaps in the CPU
> numbering, that stress the case where the sophistication of the code to
> handle gaps is exercised?

Ni, there is not.  Simply because we do not have a system that has that kind
of CPU configuration.  Simiarly, we do not have systems that have CPU configs
with multiple gaps in the list of online CPUs, or have just non-sequential
CPU ids (no ranges), or have a mix of singular CPU ids and ranges, etc...

We can always improve testing, but this is the type of bug that got uncovered
because it was in an area that is very hard to test (or at a minimum, very
resource-expensive to test consistently and for all possible configurations),
and someone happened to try DTrace in that configuration.

So yes, *if* we had tested DTrace in such unusual configurations, we might have
caught this.  It is unfortunate that we did not.  But unfortunately, that will
be the reality forever - we simply cannot test everything in all cases.  There
is no guarantee to ever have conclusive testing.  That is not a reason not to
try to do our best - but I think we ought to be realistic and not beat
ouselves up over not having caught this.  Those things happen, and even when
we would have tested this, there would be fair chance *not* to trigger it.
Now that we know the situation, it is easy to see what was wrong and think of
ways to test it.  But until you know there is a problem, it is quite tricky to
come up with all scenarios that need testing, right?

> > I can add more details to the commit message about what the exact problem is
> > that is being solved.
> > 
> > > > that corresponds to a given CPU id,
> > > > which could be part of non-sequential CPU id configurations.
> > > > 
> > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > ---
> > > >    libdtrace/dt_bpf.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > > index 0a57b7d2..6568a572 100644
> > > > --- a/libdtrace/dt_bpf.c
> > > > +++ b/libdtrace/dt_bpf.c
> > > > @@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
> > > >    {
> > > >    	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
> > > >    			   sizeof(uint32_t), sizeof(uint32_t),
> > > > -			   dtp->dt_conf.num_online_cpus);
> > > > +			   dtp->dt_conf.max_cpuid);
> > > >    }
> > > >    /*
