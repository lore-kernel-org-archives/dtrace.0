Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5793027FB35
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528192; cv=fail; b=SGFvOzakTGw1a9cAmsTfm0qS2c2hWwIMP6mgNEUEcpVLXp+ihvvNTghrnjaUd5o/4fTTGE/Uh6rkWpzRXg2gLaVNbaiIpR36LuO5WKmlNFPqs0N4b082PFjl7aQdW1hNEhM4gK2COyhH7bFAVsNZuf3bOuUQrznHds87HSbK6bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528192; c=relaxed/simple;
	bh=g0ABCwqNnNfJkjDNEe/pFviqcKVvHVpg9k7cmW6tR3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=chnWM/mLx5J7GuUJDhn82HHfPSN9qy9zbLhAxUHqCyUfuYDeIruOmha8a7faJxCoKOWE/JUGrUKTjfJSD0/5P5YEkOTWfC6siTRIVxN5vGQASWkKdploDlGeMkAuVK9kUWajKZzLnfm2K0LvLTklPxfiqbdOBb+6unM2zzhZw6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E3Ml0pTo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mWg/TCOA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E3Ml0pTo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mWg/TCOA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBEIkn3713709
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4zZPrYLw2Ww+ET/LQp
	EXw2JhQjxVRh+Joy+Ur2M9IEQ=; b=E3Ml0pTo6upJVmE4nlyUVct+5lXE0R3nWO
	fj21Q+J62Tc1xe5pn2X8gvNa1YxznSTHiuZeeiz29V++LQgWy8eJcsxN7Q7C3gFo
	tw5vM/0kSy55dMJSUXMSDihDReFelIm2swtLs9KeeKQlQqwAXLk3bSOR1dJkqTfX
	3GBlwueHSTOSFflrcVCNkaqt3EBiHHPgEbkhUcTusdTv5TuersglN1IWhJnjl/Z7
	uQ7qQ+McTxF7smAmm/9e/nNV4dg/cq971b+rm7bQvxMo2S2EfALKBkBQYtVN60FF
	25tq97FmS3B25qVsEjSk20AQsn7Luc2FW2qynjYwipfqPTE/smxg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvny6v6tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:36:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60RERFXg036086
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:36:26 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012056.outbound.protection.outlook.com [52.101.53.56])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmhnunxh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 27 Jan 2026 15:36:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=StIfH1pCztsi7ylhjHEzH3fvxW08VWzESowYkhT4iaBLpGAXaBINXlBgfkdxmIFPV57eQApj2fnWS2IJ/UtuL+ONkWfsn1QknMtjIPY9NkijILn8voxC8Tl9yrZpQZTZdwIJzlQyCsFQByVyUU50ZB+MUavZckceuxUtDC2I6KAKpY4uuuUgnltQ3F+Yk0B+FIzzF5B2LabvvwRoOTWeGGi6xbvjwu2zxC633ZZ7ZGyJlEpJbX/geGhb8H9KISST73RBAW54QhImwM+rre4+Mnyd570LC4tnXXNr64JVYoVLa8inGH0n52yPMu+iTsX8UB6XQz2kQBKMYyTeR4OhqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zZPrYLw2Ww+ET/LQpEXw2JhQjxVRh+Joy+Ur2M9IEQ=;
 b=PO0193LjFWy4POV3vIYrWSjK4D1Vx0/GoAIZmk0Q+dQZh8i2viTXZRoOY8yq8+cYskrWu1u+EcyAClHrtgrzOuhI4RA+GRAHn1C33rVrp6rFQlZtBGHtltudLGgYtluKC7lVqgJeLLwM49mrbIfwRSoHZLBy4IwJF64puAovwkE+hSftnGXjN2pfiVOje95GJh59bNWVthCO/VlkG5Iw3GsjfaBZLVqj97NzBHsl6JrJPqZCdst0YMjlSxMBgJAoNFok9qxCvjxUV3v9a1L+33ym0U71ammJGKmoIuzhO1MZaMwhfiKoMN6BbFZW7TD9Dv4845sF8fzBv1LigQzYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zZPrYLw2Ww+ET/LQpEXw2JhQjxVRh+Joy+Ur2M9IEQ=;
 b=mWg/TCOA8K7+IRzvQn7VZL/cvDrU1t4BGVQBsbd2dJaD2sdFiCGVN6q1I/iioDZu4EIqRZ06UvKAzeQTvTJ1Ph6ZIDXg5d2ea8z9AHqSIKCLRQiE/hKAF0cUJ4tuZg+FEY5LHL8CluaT/oc2u1eCf/f6TbBusx4CMs81qKyRzSE=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by BY5PR10MB4194.namprd10.prod.outlook.com (2603:10b6:a03:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 15:36:23 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 15:36:23 +0000
Date: Tue, 27 Jan 2026 10:36:20 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 2/2] Use asprintf() to allocate strings
Message-ID: <aXjbdDD8vhoPLnQR@kvh-deb-bpf.us.oracle.com>
References: <20260116225734.23447-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116225734.23447-1-eugene.loh@oracle.com>
X-ClientProxiedBy: PH8PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::6) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|BY5PR10MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: a8508c7e-13f6-4295-5606-08de5db9d3bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BCJO240U0z2lW3ZuiBLCxSpjvsQQC4t9bgVdAoR/A679dAKReEVuR+lT7knF?=
 =?us-ascii?Q?+M31sIngTwVH8BhsdwpmzG2wu0ZqPzycPkYsGsKO4bfoiPFUZqtl0hTdU8Wh?=
 =?us-ascii?Q?DUiaIF5QhdZpFDaVRb0VKzn+dITkMJApxnGOiq3u106chR9teDFU3SOBmgn+?=
 =?us-ascii?Q?HbaArLma9XT/HuAZOU/S1s9uRSzEeHe/TcU7ruEboyE/7/BSeFxAnFKKYd3B?=
 =?us-ascii?Q?DLINJTUvg5ccVR74PP0Qv+Wxbmqp5ttmxEHIAEBuAOO/jXSZCmF3OXGzIk+s?=
 =?us-ascii?Q?YUunwLHXxaMmsjto/U0FRhisS8Yy0Y5cXvwUv82Qwvjm6Ry7YG9Ieeo38qo6?=
 =?us-ascii?Q?ODXNaGFyrbAfKQ2x+AltpBin+2fFv8keFftNFMWhwiB65EbP3RPhjnTDuNm3?=
 =?us-ascii?Q?a1PW5aNaiNYxNrqoo+0/rmXNMjXX2UfvYd7DDsY0FsAIokuXtIwZvN/HLCZ5?=
 =?us-ascii?Q?h5i6Ey9liujQaJaFrKhF1ZdWYQhYgCkCiBMBPVIpsPbAIt7SmHE5ylw9cC8e?=
 =?us-ascii?Q?ynNE3Mj6FZBn/H8Nd515OVyoX4xeWe/NS2PauDbgu6Zu+RzcbrP/fNmVY1Im?=
 =?us-ascii?Q?SddB/uPO/DuvNDMoVZcgyL3w7GYhOEyxJ+OGP1sOWq14s1SSiIhWrW8lu3vw?=
 =?us-ascii?Q?5kvBj9UZaQzIdU4CQPmiljc+b/IQHLDUtxfIHASnrQYbDuPulC7ntLqNSPc8?=
 =?us-ascii?Q?UjtNW/o6bSUO/n3TCPcou7Fvq0sl6icwaV1IoJY1yemCuwOUTYOg3/KVv2gi?=
 =?us-ascii?Q?wo9342Y4vNiDKO44J6upLV6gvAIeAagcGOcYwXJJb9sz1yOo4+iMWfxMSdOi?=
 =?us-ascii?Q?GfQImOJ0IfhYriwhWvFgT0IZBiqshZnET86VQq1pXQbDDbYReF9DmWRR35BN?=
 =?us-ascii?Q?bWi7Ow+LuxDwSkPfPDyAZ8dD7DtPzfEgGz+1p694+A7BH5jJTjNumZ28C1jp?=
 =?us-ascii?Q?m7pwZPqUX2ae67nxDpAFb5V68ACPItSNkV4Qh93zqW57cCjWXg9iPBB6g4uy?=
 =?us-ascii?Q?QSguKE7lwEsvN3livpWxe2igHOOAYc9s41/gaZXVDQyFeTZoZae5hNdBqe1c?=
 =?us-ascii?Q?XkrMPcfWhajEAPoTs5XYXod//R/yD7Nn0pPT8nTRncFRc/soXZJ+0lHeSd5A?=
 =?us-ascii?Q?COG2HhYZXswvnH9cMfAKnHLQn7TPXp0BGhkkzIGLVHSPoqm0iRe3xZ/1KxyS?=
 =?us-ascii?Q?H/NLpB4aIhFLgMETE54zCtq/G58hARCRWl3Jcgxteajt381ovHzrqF4tJQBN?=
 =?us-ascii?Q?gAOTdsqha36g5Gz8Zs+uLpjbKuOoclqK4T5WfS8eQSc3hl4tNSdLbwf63NbP?=
 =?us-ascii?Q?bjfX1q54d9DeK3jDpxqlzjGZJ2l3ZeBdSDg+zuqJQW0S7eo80ns6Cf61Xdvw?=
 =?us-ascii?Q?0mKU7ZawF1gSjjOYQZT4Da+TV1Wvw5uKgrgYLqrB6e0QM0/mjLnHEVvv5ING?=
 =?us-ascii?Q?KCX/7UlNsWQCrkTn0ov+dNYDfmKEpf7Mnpm/YCYaBPFZo0l8g5CUPHwvchXz?=
 =?us-ascii?Q?FWcxqQoMU1osABHUdM9nHV+isNZJggfGpa02BfyBVGDcCpEEQZn7i1ZCh5/w?=
 =?us-ascii?Q?grp/L25nYbmqLnTmNuaaWUGaSTUA/aMjv7Clboh4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4rIkDWvh4A6/zwqEU8ccMqO71GxBxJKly5Q8Y7i9x2tNtlBOIGx9MD93MdLd?=
 =?us-ascii?Q?QzrKY4+P4C+8KFRUU6myqa+nKl8kQ107edEdUv6ieg/FWVM4CxER5IQm1tmV?=
 =?us-ascii?Q?vTnRqI5whxbaGppbAu6YEF+dg0FolSWUoOz1qEGHUdJV77j/RcNpJOUlC6ao?=
 =?us-ascii?Q?jfSlMt+iZO1EYwJqgDEIUP7/OJ0ZrGkKS7tFUQk21sG2XEeOe7bEfF8RX7LZ?=
 =?us-ascii?Q?SQGLjonslB0jrABWtaVLrQjKiegPtGAdm9FkvL6g5H3yCZAGKQsPHb564XA4?=
 =?us-ascii?Q?ZoOCTIIbX4Y9fbxeSkWci+pLg4LKlgqVEPvCRFMKsvimlz6qsJXmbAifa8za?=
 =?us-ascii?Q?niRX3mI8MI0Rbopjvm9JsXvEn5fg9LbFtZDDt5zHkobnRcsjXkkIF5wPzBkr?=
 =?us-ascii?Q?DGuI77R2uXgsLrhinmUPLV36+MR7Y4dQXFDcrcGiIO/VBQU/Sg22gtwesStU?=
 =?us-ascii?Q?btekMM/n3b4Sx+lqdcWRILg3R+gjOke2vdAvFQIlwaTDJZXuLXX3pqiygiiS?=
 =?us-ascii?Q?ri3P0T0wHsCgbMQSz7STcRfmOZEEHomsYs0nRJnk210BwpVomdh8wdItq1jo?=
 =?us-ascii?Q?qA+qMypWx8fOtiERuQn/KUISc/08APK4dJcUda8CQlO0IWC5rp0h0lYZcGKd?=
 =?us-ascii?Q?neP/+c1F8ywDlLXa0bljfcFQS4BbSzEp8eebuO4C++7ssnBFMB9Ii/6KQNEz?=
 =?us-ascii?Q?/4qOR+iJ+8rFxECE5Fwh4bGCmRR7whKIjbU1qJ7scMDlW4mWaTK4BuJrIEvU?=
 =?us-ascii?Q?M2Vs8uKD6Lq85C4nLPSYqmPIkexrFdiyZ/xu0iABRfpuVEc2nVBFI9NYLD2n?=
 =?us-ascii?Q?+J8GJLaydrk6RswkeG6LWadADobrfkE40nwkpo/TeWrX92hbnFwJzzogn/Dc?=
 =?us-ascii?Q?E4V4u/Nf/LbNefNonylTViFQHi+TH2p2fNqfllhl2c8cXoszJYrrMvAfFKds?=
 =?us-ascii?Q?KlV8LH++fntTPU6LQyml7zVq/aQyHgKpjK0s+zV9YttXL19pUTD9AA9MNjyb?=
 =?us-ascii?Q?dJZp70MhXKuwxktODNMyeriLOPi1mvHErBRoAvDkIYl8OW4PfWGol9XQKVQs?=
 =?us-ascii?Q?I+kNOdUg3BEItyMZifNf6yvvRfeEjpw53OScBntdoLqxG1SH5Sr1f8CEdvih?=
 =?us-ascii?Q?x8wAtQsrRF6YtWkFynWoZX2HmRzlKuPHb0wY8VVT6brE0PzpoPtEz68ejBip?=
 =?us-ascii?Q?0QOlk2f/Ekxf4xg3qiW8775cuV+aJSU5ILDSTeToVebMetXjN0m6jgWK1Gnp?=
 =?us-ascii?Q?gkXYW8B6bXZl+bsZOcLIoJRYiTG9E51khANDtRuML28hzFO0175Utit/J60n?=
 =?us-ascii?Q?6ecF/UEeSs9m1ajgwT6fLerqy5uOVlpauHPPShsQe90JQa/IsfPqvZSDs84y?=
 =?us-ascii?Q?betX5VfQG3Mv+PGwqXxRXVvSPvyS8Ivm/E/cKWjDug/sxikXyCr51asZ8DFW?=
 =?us-ascii?Q?1yUAegwF9f4+Mx3d9SPyAzjPK1XbXbpQeVFytql5DnAWtvQ2qTm0rr5Rb5Wl?=
 =?us-ascii?Q?QP/0QWwMfyzvZC/2MPt68mhY2CLC9CKJ2W1mIzdgPROs6ZydiZ1SHv4z0non?=
 =?us-ascii?Q?to7pNFYtA389KOqlVUo+M6ZzvzcVq9Sz0IC5Zyusp+tL/V2UFwE/FUdPCm8m?=
 =?us-ascii?Q?757ssAhm6tFx6XBPQufsbrV6157kmY93BdGw1mlsKVC8DQaPaRtT4F6XSgUt?=
 =?us-ascii?Q?T7kGj5irWC7/tV5nOuNXZgPAcZbGcbxMvi/6qXcDxGOfso7jKBtAuX8o2gbq?=
 =?us-ascii?Q?dh9VF3cNgyLTG3ZaL4AF3B2ol/IHMkw=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B/IXigbTZJYPy8RKCTVxsPNFb1PO829XJjVsWXF76mSSl7WRDc7PooqprJeqUXVmBJEh0v/WxGHjWcbZ51U5uRjdAE4yFjt0L+3ZbxqQa0jSANA9q1LvLvX5nTZQlQM+5tAJOIofNdhrQBr3Unyeqs9hTUupg0l8AcyLBIp//CJXI8io/dhMn8K7mYdSuNdtL9YFV4syuo1KkoKQBs2WZnp6ZfXtURrsyyNpfwwg0jEc6ARlNzxFlDm17IZwdsR3/KEhW74S3EhHN3rclLAJhxi8mNj8DaqtRjqcYgmtHQ5K3wpvPYPZ6N5C2MUKZuSXAYOWM5Nb1+1lg7pt7YcByJTXa4ASnLPshlk8yzphC6idufO9XTR2iP18teAjGKbFjsyAsQZ01vM0XSdPz94kZVKHTJczblChr1TT7IGgOcO7ljgmmStlxsfTNQ3LC47XcI3A3Vq9ZvFjz4mK1Vj6ov7Fv/4RjzrdSuLJs3/SptpevKjsp9UZY0nTlo8qfVNJ60H+WcH+Akol4tRSggEE4uTUpP/Zuiv5FPnagnvP0zhvXrSh38IKInRsLu3gXjJHm3/05cYj8+ADOD5DqtNw74MQP7YkY1/MmPFrZFf6zI4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8508c7e-13f6-4295-5606-08de5db9d3bb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:36:23.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kPnO2eLX88/bs9CvJJVRAlX+ViXIjFthCBOoh8ovaU/lYsiotGJcfT/WedV6A2OeaEGVJ2MnOu76J21eKUr1PgWVnJG19nMDy+BmOPGF0ZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4194
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601270127
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyOCBTYWx0ZWRfX0W22uTYk0Svs
 9HCWMKPBkB7e4L3pxFm39+3MMMOW/9I7RpSoM23zpz0ecMqwejgynROSWOoL1XRrVOckzrjc9Ni
 eOpZJys5irLXRNBwllA6LC0SMIQIopinjKYp3JL6v+vEe5nq/AnpsPilqfmwekiFSGwBwbwM93/
 8PXYSdfpYgSBtFP/ING1XuLaxrsvso9INers7Ua4+Hjumk8uZMaJud2lsKoIZR1UX92H9znG+uU
 G3lJi8OKwdQFyJ6lw1gxiX/Kq/iz2WEgNmnHPYS2JxU+x6Cx3JeEarvUpQOL1CPUyi+S4l3o2B4
 ZnISFR8hkiE70fQZpKUKC45NVfTTDuvcBNcdw9kwliMYlinT4cqFqchsZdqJbX2+CO/l8cCYEId
 q24/9VtYPfmmZulaMaLdt2dyhvxesYUVryIt8iJAXYuz/dtWC/EHBgicSGS72nOvd+CYDO0I66H
 b2WkbVKUfQUsbzLIbbVziPWKBHKmB/s3arwoXOeQ=
X-Authority-Analysis: v=2.4 cv=C+XkCAP+ c=1 sm=1 tr=0 ts=6978db7c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=X1sNy9fNYcfBV1ktc6oA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12104
X-Proofpoint-GUID: mt0NvpGfLmPB8urbuXry6foUkMGbI9_8
X-Proofpoint-ORIG-GUID: mt0NvpGfLmPB8urbuXry6foUkMGbI9_8

On Fri, Jan 16, 2026 at 05:57:34PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Earlier patches have slowly replaced constructs like:
>     int len;
>     len = snprintf(NULL, 0, format, args) + 1;
>     buf = malloc(len);
>     snprintf(buf, len, format, args);
> with the more compact:
>     asprintf(&buf, format, args);
> 
> Replace the remaining instances of the bulkier construct.
> 
> Note that dt_conf_init() continues to compute a buffer length and
> allocate a buffer, since that buffer will be reused multiple times.
> 
> Further, dt_probe_tag() keeps its current form so that memory can be
> allocated with alloca() to guard against memory leaks in the event that
> ctf_add_typedef() fails.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_link.c        | 17 +++++++----------
>  libdtrace/dt_prov_dtrace.c | 12 +++---------
>  2 files changed, 10 insertions(+), 19 deletions(-)
> 
> diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
> index c9e0ea5fe..ffa16d9a4 100644
> --- a/libdtrace/dt_link.c
> +++ b/libdtrace/dt_link.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2008, 2025, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2008, 2026, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -416,7 +416,6 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>  	char drti[PATH_MAX], symvers[PATH_MAX];
>  	int fd, i, cur;
>  	char *cmd;
> -	size_t len;
>  	int ret = 0, status = 0;
>  
>  	/*
> @@ -426,6 +425,7 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>  	 */
>  	if (pgp == NULL) {
>  		const char *fmt = "%s -o %s -r";
> +		size_t len;
>  
>  		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, file) + 1;
>  
> @@ -521,15 +521,12 @@ dtrace_program_link(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, uint_t dflags,
>  		}
>  		snprintf(symvers, sizeof (symvers), "%s/drti/drti-vers", libdir->dir_path);
>  
> -		len = snprintf(NULL, 0, fmt, dtp->dt_ld_path, emu, file,
> -			       symvers, fd, drti) + 1;
> +		asprintf(&cmd, fmt, dtp->dt_ld_path, emu, file, symvers, fd,
> +			 drti);
> +		status = system(cmd);
> +		free(cmd);
>  
> -		cmd = alloca(len);
> -
> -		(void) snprintf(cmd, len, fmt, dtp->dt_ld_path, emu, file,
> -				symvers, fd, drti);
> -
> -		if ((status = system(cmd)) == -1) {
> +		if (status == -1) {
>  			ret = dt_link_error(dtp, NULL, -1,
>  			    "failed to run %s: %s", dtp->dt_ld_path,
>  			    strerror(errno));
> diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
> index 1bd405b81..9ef001a33 100644
> --- a/libdtrace/dt_prov_dtrace.c
> +++ b/libdtrace/dt_prov_dtrace.c
> @@ -228,7 +228,6 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  		char	*spec;
>  		char	*fn;
>  		FILE	*f;
> -		size_t	len;
>  		int	fd, rc = -1;
>  
>  		/* get a uprobe specification for this probe */
> @@ -248,16 +247,11 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			return -ENOENT;
>  
>  		/* open format file */
> -		len = snprintf(NULL, 0, "%s" PROBE_FMT "/format",
> -			       EVENTSFS, PROBE_DATA) + 1;
> -		fn = dt_alloc(dtp, len);
> -		if (fn == NULL)
> +		if (asprintf(&fn, "%s" PROBE_FMT "/format", EVENTSFS,
> +			     PROBE_DATA) < 0)
>  			return -ENOENT;
> -
> -		snprintf(fn, len, "%s" PROBE_FMT "/format",
> -			 EVENTSFS, PROBE_DATA);
>  		f = fopen(fn, "r");
> -		dt_free(dtp, fn);
> +		free(fn);
>  		if (f == NULL)
>  			return -ENOENT;
>  
> -- 
> 2.47.3
> 
