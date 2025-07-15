Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0944239086
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752609078; cv=fail; b=ea8Emp6ybk+7zWWbqoeJWz9tX/+fsVJMx8IjkXzyV4Fc/af84wz3RX/ZX0P7+MCB7BkkfVRhqZX/8Cy/cl5yx8e+hBhvHZ7zvXpdPjE3vt68tEtomlfYbFC73Kx2zFBYAulV3pMr4R7A3j53r2Pv4LzAynSjB5pz//nkP1WcMjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752609078; c=relaxed/simple;
	bh=5uRDuVu/dZPk6D9kcxwA877s+1l8PVqoEAOWhsekkyI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=W2ZS7i1Oj/twDEifIxrb+NvDkBQqvBD5t0lIk6cVX8mP/mP8lpiqZ61LH3H6mS8qPLARWkcP9M/Xum4S1vZMeCdh7NZELyHxQcIVSZ6i4hxPwWn4DWXUkhxkz1LY0VdGuv9Wqubyb7rCDmxuBNMRMP2J19E/sBdYjZHJN7SHKbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IRAibHBt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rhIAy1sd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IRAibHBt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rhIAy1sd"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FDZD3x025894
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=4uQDthaQIGrf5ps3A0Xe6gvSrMjn9H075EVB6X1xyJE=; b=
	IRAibHBtSWvws8wiMkRAnBEffOUlPvO4KOd8O1D56zxLPjeyu++3GAnyC8acsjSC
	26wAAGspk2gzR2Et2DyU2pFC51O4u+JTtyPcCJlMHDWThzhzJTA8r9yHSVB8incH
	A5nLIEQf4rEPEoiSWrX+cQwFjWG73C5pDMVF0/zPLwdvHr/ROqOPmhCCgRPv+FHz
	KWV/RCOkB2Zw5yH2RgZeFnPLD5mI03Ffvw66yAMYsCHRalFosqFK7gU47utp1L1S
	z5CK9bvjeGuu4oKzImgnlWVyGLexSve8M1mbiq5gNYA2B+ROm1QqmFulOSVF06Sa
	N22ys6FrrBZ7ZONLNVj5LA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ujr0yem4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:51:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56FIjjaI013526
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:55 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59y5yt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 19:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9623nGZHS4OxoS2YCULsrqSoQ5xfIPKvVuthqv/D8v9IlEbOShj9FLItVWKTpFfyY8PM+XjUIG/XBMbPldJydts8MH2j5/Tg6YQyYpvHgFz1LinoxFaJRq5B3w3CT8WjTKYsIz9YJM7mptAJyHsgM8X90da8XyTP4gmGScBviLIKw7rdpxaSxDJKDcnqS4jj//0O/unLfuMsROwP7owy9qm4cnsPMaQ71PngsRETnB2dxNv1NnoCUAdta3FnJQA7i8Mo6uN7E2kHSCASUYSNr4hHiFEhJ1iNt+DitpfpnCygLB95uqZ9FzAWZS/z8I9bgr+grbhQkZO4Br/Y44NtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uQDthaQIGrf5ps3A0Xe6gvSrMjn9H075EVB6X1xyJE=;
 b=jQADilEWXdKRxFEQlu9IgX+KG0FYpz3UjvMF5+uBLnmI8Gh4FmAdoyYgMfiwCZlwbC10bfEd0MRVXtOo0/H/ohnlUDrKuGkIEv5TT7xRxqJb1ZG8UlRHj5tKxr8C0tI0YsjUvTSml/AVU+efeo+POm0KvHO4sud6gyKmbtaVjTwXFjKFXPWCqzcaW2v6qqOLBZkV+0esuF5QRNrtrhsO5rfIG19F1POM1abXOjjdV7EF6CQ+wb1wDvUzMUzpp4rKdqr58vzo4pTYgw8nLfGBSR9edLsY9HGwz2QN7FwAAm/KUtCZxUWfrTTmYhf/cE3FWCXM5xZZfIFZ/X9hJ5HPAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uQDthaQIGrf5ps3A0Xe6gvSrMjn9H075EVB6X1xyJE=;
 b=rhIAy1sd6xoJsYDitC18Bmt2H+xdl2i62S39VLpzXkHvV9/cAXHPRNbcwNfrsn7SyGwGpGFpLpzJ3jG9TfP8tms2IFl7hojAQDfXNhNtnJHcnnhsYUOoFKte0om97kKDODSvPRP7dDoluSJgPAA9Al+R0MGiWrAGg1O7VE7g4rA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 19:50:52 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 19:50:52 +0000
Date: Tue, 15 Jul 2025 15:50:51 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] cg: optimize ternary expressions for strings
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672AFCDA4B6377F37D0C949C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BY5PR10MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: dd61d3de-89e3-4433-864a-08ddc3d8e7ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M1a0LsY/aN++t3WVBfTRIgE7bZC0RgPSjfbIS1omIb6taPpE4wnKkUSB5cYs?=
 =?us-ascii?Q?ZEEpPBKpQ+2uo+Mv/rlKjRVYohkxlcQAfvJU/vjumnE/1bOC8CnSDSqRTHuQ?=
 =?us-ascii?Q?mTBpqxfJagd7zhYMdK+U2TvpD6yPYjktsIivy6D/0nLzCZu80uHChzKJ/3uC?=
 =?us-ascii?Q?P24TuoT7XlQlrc6oDN674G4gBpF8c/afPJYPTFQN8xjYMEFzGvD3C+DN5KNd?=
 =?us-ascii?Q?YFIG+DLD7lNxBR93WyOWXQjPPCxNIfLCjMJItiYBkpUjmD7cMXT8S+eBM/pa?=
 =?us-ascii?Q?gK2YkXUzR6hTCsTl2YXLEwjr0isQgCP9tRdxyCA0HKUS8Z+lvb1Lrr3zEhyM?=
 =?us-ascii?Q?N3XZhAR2VJe6cAZdR+akd+o44iv5oMZLYS6o5tVY92Df0Upo9jtzoTz/Eaka?=
 =?us-ascii?Q?lzpfKbbaKcqKbGhUbMCx5mdjVN93NEC6wuBAh2VHRsFLfm0tDZSNlYQ5MK06?=
 =?us-ascii?Q?tHqhgO8HBLztd8xObb/IjiD07S2gC4TmhiGGyWqDbTdCQAQpAOiqcMOwwwf6?=
 =?us-ascii?Q?mk4PZp9kl6r7miMVm3oY4BnDRFn3oAHIZ+Lmw42YZkFjT9GxU5QLaHedOUGl?=
 =?us-ascii?Q?0u4+T6kjti/oTLkJ5UyHgoGHzsulWHcT7htNdACKICIiyd/AJm4IXq189rA/?=
 =?us-ascii?Q?Q0qrv7e49Y9UUFR0AhR5e80xPSlgW0TppWdXV7/ghrO/bxj+dFVpdhvQZF96?=
 =?us-ascii?Q?7C9FlN+XtogPEc7JM2/3k7AGrQf/SEXL7lrexABHBIlBdkAEVqh41C5E4Spx?=
 =?us-ascii?Q?UEOB9NFvfe7kORXocWaOf4jTc2S2mkZbYEqwAp/BvGEdSRb5Mne2ftLu3eso?=
 =?us-ascii?Q?p2mjxW04E5PpwaN/2fLzeCXI5lCCRZ+Liz/3KO8T1YthxGOT2xNESrlSHK8K?=
 =?us-ascii?Q?DqlfQWexLPfBhhV+Kghap1Uv0+uQNqS1nkzZls4sjnErDpfvD/6PJqW9AqUr?=
 =?us-ascii?Q?ogIlJ4RMN5xPaoYkMeyTi11Ug4PZPNlHDAo/bneD7aq1OVBiMaKhF5esCTtu?=
 =?us-ascii?Q?g1ceOrZ20ToZgL3qnKKxiGaPcDjSKX1w7jXN0z8y/JuDUIMqeQ6CvWUqeeCd?=
 =?us-ascii?Q?3Qd3Fdl8qvt/a1ol1/kwZ2mz7hJqpro+Qh+2bN66XyjoSNFEO/88MGNKrxqz?=
 =?us-ascii?Q?iw1mZx/NKwPzOH1iCqdOdhlICsXv/7Vf66QBN4qhQDHKoZLXVA3GRHQI8PVA?=
 =?us-ascii?Q?HQxU4zeaLmKz0YC5GdF8OMH5JqCSgJf544+4MxovEqoQOpqUDYXUKbgh8V2A?=
 =?us-ascii?Q?w92eiC28zCP6EyvkN6YYpRQkQJhOikFFLMpbEqo3FkND8ljClEqUigRBDL4L?=
 =?us-ascii?Q?PuLyt0AiS7JfeyRFlYd7TdJuU0qICOn4OaXzqNWU2kutx/lN/LiKwwKsJXFO?=
 =?us-ascii?Q?VAOsDgvF9WABOyY8fB1CTe5nHykY8se1QV1mp1BKd1EdAumV+cc8y3KCBdgV?=
 =?us-ascii?Q?oTAWXvl3Kms=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aQPZxRRvCiBj/yYS/8dttH18TiYzFlinK9ISCopyjXm39NWb+usQdA2HBHg/?=
 =?us-ascii?Q?Eyfu5fTX6y+KWmz8hY8sgoKuGfeHgPYvlDFkmQ/XHccQU18hW9m7RWeheX3W?=
 =?us-ascii?Q?Rgt0EKG6oIa3e960Jx8VH4eJG7VPILTzN5GtfLlh1cw+sHqPfyy5WhAI+UlQ?=
 =?us-ascii?Q?RU2aReRJutH43rn7wR3pBi0/ALhy+AP/J6xRK65AY41fWitFmfaH0c5aYM1F?=
 =?us-ascii?Q?ku38RVPvb8fYw9TNtiYsOCpn+xf2LE/eAvM84Ht55Nol6h/+5huTZMJN8CZx?=
 =?us-ascii?Q?1knTt66sGezURa/lfw7wjD8y5JYivGcRzn0+T67dAFGEi1CfTR+7NbRL+pnn?=
 =?us-ascii?Q?6JtB21ZPLXNChlkNNMsIqASjxTgw/3Gn/fK7eQhw9NJGBW49zQKlcl/nhfE9?=
 =?us-ascii?Q?mxnOpo6swyU72VFWRg4O6wDoptqdwfKepPH+ANMFHZt/+xxur6xZ2UQdvKXw?=
 =?us-ascii?Q?HZlUHIBtmL1SmAY9CXLh1ggcME2Wwerig72g1rEGjVW2C1k1PcIW/aQly8Yt?=
 =?us-ascii?Q?GGZqPF+gRDmQVEsXCbwBuetTLkobjz+tChDBz+p3+V1BPamcvsFRDENNZGuK?=
 =?us-ascii?Q?mmOCbPrQetHWpqu85OH94Vj0r33eZ2xrnKil48pEIRxucBoYceE5Jkx55bg1?=
 =?us-ascii?Q?LSE1EBnMeMlJSwh7icKhsVIfzL5PsYHPlWlWSW3L8CokfBPSZzbgQJ8dsoUM?=
 =?us-ascii?Q?kh/E2jZR/8roVJ0OYBxA2nhB3MhdI3E4bRWP9fjyFqjmpDahCiJMl7PxnxgG?=
 =?us-ascii?Q?B2MzhKVIZLKZKtZz0UOHTF9CLUzQaYqTKIK6+cOTj1uhPnUQ3Pyl6onsdiS6?=
 =?us-ascii?Q?fsa6O1MUSaK57jkHzXrTbsEPjmFe/ND77rG42HwieGEjaRAiY5QRk9wIiJ59?=
 =?us-ascii?Q?5bRX+mI1WZFxixjvm2h5GYasrwSRQTtsH63L6fyLbzrGwKSsEoHR2QigGSWC?=
 =?us-ascii?Q?7VmKPbxJAW9Lz6GTmwV03ZNrT7nfpq7VCEpKdg14DnKTKuoj+cc5NFGKbNjE?=
 =?us-ascii?Q?n+QeqYK+BuAYNuQBhK2c9LjTkU1DL0XU49DIZzJYq0pm9+CMQm0trgFtV3+C?=
 =?us-ascii?Q?ZgB3vmS//WprXSraiiD+5+eZuW/Hu77+qqmRm3YGAZg6Svms8aveclD4PohU?=
 =?us-ascii?Q?gM5HHB7uFqgxEkIISWIAsKo53ml5qbs4Hh/PKJtWT+tIxoXxHWGoxkbPilxe?=
 =?us-ascii?Q?8B90PNqaBwi3CZHmvcr4UclkTmKFger2O6Gd/xXhpdBsBa9ORIEQ38a34y2H?=
 =?us-ascii?Q?sUxMu2dxAcvP/UBMp65pC/6BsSL3TgrIMPKaNpGHe8JfgDRJdvzba7RPNB1F?=
 =?us-ascii?Q?TveEdl91VTmxJQYQMeZ3MrrRxsorodU3qjwmt6r3W0AUuAjgO7RsvCYxQ4O7?=
 =?us-ascii?Q?h9ufPdeKk8f/igKGIWF1u84QA/jhWvi6+VsfkcJ/Yg2L8bwjZuaGelsZ2W7m?=
 =?us-ascii?Q?XveVv7Zvy9/2OE7d0KFg8u1ZN7VEps2suphmkZk/AdqqHJGh6bdx/vTtg2ja?=
 =?us-ascii?Q?F+0Hupe7Q/bosSMtmBgtmE1Mb6szVmxZxDRFVs/zcifur8/ZN0Ma/amVz+cH?=
 =?us-ascii?Q?c9NQe57gviOu6jPGMFyXBsumfiVlrL40r765REEHtF2l4oW1qDd8lBic6XnW?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g99d0qh9WOWyDtW8Trq0bPnvruvAUh3tLsSx79Ri06JcJSTe/Q2u9H0mHXmdpi22RXqG+pRHCuB2JfnCUVhlxulF3RtwVDUvoBlsMJpnDOxncx/wdSA9JOQC/tQu/0pzmzmcgZmw/Nm2NQYZMJ1N5r/Kr/4WqSj/YC33gRzlUhrdLzcT0/7nArklMdCDpusMNGumSvjJXpBvph34B61JGFPr+uv9PLWkd7G0CaHJ1Xzkazwrv6tUktgci6/YbpDnNv9YBwbsODlPDvTsXNsPfvNS9UaO7sG0+1IkrY2mT1XobpPKMtk3jZ/jlXa2AfOu3hEVkeyXZchjEjkFvjQuxfvzQe1tLrvAximUbNVjg9xJ6Hut1mcQmoTZisChRfrvUiuADoimiQR7/4kabzRzzf/092WnE7w6W3Vsf34LpiF64WDbynQW6sfkdFE0eeyPMe9RJP87hv5+OE5aVtWBJlQKE1cA22lE3Kc5oTjGHLZFHvQ8r2mZ2IRqmf7nhQXI9IoYo21JkLgAcn4bl9ks2rE7YN1xHvzhJ8GZ8GxD3S6XMWgE3XTWT+R8G7Xir1YId9Q1hMy9g+42OF20+7Xni2le2UQmV7KzN58EBMJsO5Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd61d3de-89e3-4433-864a-08ddc3d8e7ce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 19:50:52.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0gTVGQHoJRW7qVpUnTxSSzsPu/8ic2kG+SH5U4J0IfiiW09GAoVD/igKA6lQ0jtm97qBTla/n63IruX692oLft0OI3sRjsuitpQlb/oVE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150183
X-Authority-Analysis: v=2.4 cv=d9T1yQjE c=1 sm=1 tr=0 ts=6876b131 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=bJL_jAfMm_8LntmPFRIA:9 cc=ntf awl=host:12061
X-Proofpoint-ORIG-GUID: _Je_2FsXj-s4_mwNTuS4DXP97B9Q7xHG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE4MyBTYWx0ZWRfX5Uv1zp8kCyzF w6BqkpUqZ7EgZy2XrhDc1tg0GZbZc9+KK2pjUo/6MLcMFLTmAn8WyvvNM/xkR+UkJTImJoQ9RE7 7QDaIPPU85fH/gvAHy7OWy8qbY73k9XbPiv696ztVvLVTTmpNpHgsH9G+eQLktgw2sR6L4jiYgW
 izU3nlLYOONvuwvja1avauZUsZ4wVSnGrB3eaTMuY/0gD1zGR/GMREMYWLZJ+YNse9JmyCQLWyo vCjKuEAHoOUOZGCXyMfTvXwgYaD1JevyeWRAom1oMbBsj+9HIQ4FsWcVEy4ihz5sH0sWoEobX0P N06cWKuJYeAE03/xFTsdTNrPSBKwMGH7ZyhVDBD5NPztacHwrR6322s7NiUqoRjCNUPzBWv9gVk
 YC1gNR96HxOCxeXhESddz3m1yKw8r2PZLrYZPlgb1igDVXc0PX7ZF9nUQ9F8zz/MXFpAIE4J
X-Proofpoint-GUID: _Je_2FsXj-s4_mwNTuS4DXP97B9Q7xHG

If either size of a ternary expression has a tstring value, it can be
re-used to store the value of the ternary expression, reducing the
need for tstring allocation, especially in nested ternaries.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                             | 56 +++++++++++++++----
 libdtrace/dt_impl.h                           |  2 +-
 .../codegen/tst.tstring_ternary_mix.d         | 30 ++++++++++
 .../codegen/tst.tstring_ternary_mix.r         |  1 +
 .../codegen/tst.tstring_ternary_nested.d      | 26 +++++++++
 .../codegen/tst.tstring_ternary_nested.r      |  1 +
 6 files changed, 105 insertions(+), 11 deletions(-)
 create mode 100644 test/unittest/codegen/tst.tstring_ternary_mix.d
 create mode 100644 test/unittest/codegen/tst.tstring_ternary_mix.r
 create mode 100644 test/unittest/codegen/tst.tstring_ternary_nested.d
 create mode 100644 test/unittest/codegen/tst.tstring_ternary_nested.r

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 6c7ad076..11c94a5e 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -4630,29 +4630,65 @@ dt_cg_ternary_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * dn_right).
 	 */
 	if (dt_node_is_string(dnp)) {
-		uint_t lbl_null = dt_irlist_label(dlp);
+		uint_t	lbl_done = dt_irlist_label(dlp);
+		int	left_is_tstr, rght_is_tstr;
 
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, dnp->dn_reg, 0, lbl_null));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, dnp->dn_reg, 0, lbl_done));
 
 		/*
-		 * At this point, dnp->dn_reg holds a pointer to the string we
-		 * need to copy.  But we want to copy it into a tstring which
-		 * location is to be stored in dnp->dn_reg.  So, we need to
-		 * shuffle things a bit.
+		 * At this point, dnp->dn_reg holds a pointer to the string to
+		 * be used as value of the ternary.  It needs to be made
+		 * available as a tstring.
+		 * If dnp->dn_left is a tstring, reuse it as tstring for the
+		 * ternary value.
+		 * If dnp->dn_left is not a tstring but dnp->dn_right is, use
+		 * that one as tstring for the ternary value.
+		 * Otherwise, allocate a tstring.
+		 *
+		 * Either way, we copy the value (a string) into the tstring
+		 * (unless it is already there).
 		 */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_0, dnp->dn_reg));
-		dt_cg_tstring_alloc(yypcb, dnp);
+
+		left_is_tstr = dt_node_is_tstring(dnp->dn_left);
+		rght_is_tstr = dt_node_is_tstring(dnp->dn_right);
+
+		if (left_is_tstr)
+			dnp->dn_tstring = dnp->dn_left->dn_tstring;
+		else if (rght_is_tstr)
+			dnp->dn_tstring = dnp->dn_right->dn_tstring;
+		else
+			dt_cg_tstring_alloc(yypcb, dnp);
 
 		dt_cg_access_dctx(dnp->dn_reg, dlp, drp, DCTX_MEM);
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, dnp->dn_reg, dnp->dn_tstring->dn_value));
 
+		emit(dlp,  BPF_BRANCH_REG(BPF_JEQ, dnp->dn_reg, BPF_REG_0, lbl_done));
+
 		dt_cg_memcpy(dlp, drp, dnp->dn_reg, BPF_REG_0,
 			     yypcb->pcb_hdl->dt_options[DTRACEOPT_STRSIZE]);
 
-		emitl(dlp, lbl_null,
+		emitl(dlp, lbl_done,
 			   BPF_NOP());
-		dt_cg_tstring_free(yypcb, dnp->dn_left);
-		dt_cg_tstring_free(yypcb, dnp->dn_right);
+
+		/*
+		 * Free the (possible) tstrings for left and right children.
+		 * If a child is a tstring and that tstring is being reused for
+		 * the ternary value, simply set dn_tstring to NULL.  Otherwise
+		 * truly free it.
+		 */
+		if (left_is_tstr) {
+			if (dnp->dn_tstring != dnp->dn_left->dn_tstring)
+				dt_cg_tstring_free(yypcb, dnp->dn_left);
+			else
+				dnp->dn_left->dn_tstring = NULL;
+		}
+		if (rght_is_tstr) {
+			if (dnp->dn_tstring != dnp->dn_right->dn_tstring)
+				dt_cg_tstring_free(yypcb, dnp->dn_right);
+			else
+				dnp->dn_right->dn_tstring = NULL;
+		}
 	}
 }
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 2adc1252..c6d9e782 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -222,7 +222,7 @@ typedef struct dt_kern_path {
  * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
  *   and a terminating NUL char, or STRSZ + 3 chars altogether
  */
-#define DT_TSTRING_SLOTS	4
+#define DT_TSTRING_SLOTS	6
 #define DT_TSTRING_SIZE(dtp)	\
 		MAX(P2ROUNDUP((dtp)->dt_options[DTRACEOPT_STRSIZE] + 3, 8), \
 		    72)
diff --git a/test/unittest/codegen/tst.tstring_ternary_mix.d b/test/unittest/codegen/tst.tstring_ternary_mix.d
new file mode 100644
index 00000000..0123c428
--- /dev/null
+++ b/test/unittest/codegen/tst.tstring_ternary_mix.d
@@ -0,0 +1,30 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * Ensure tstrings are handled correctly for ternary (?:) expressions.
+ */
+
+#pragma D option quiet
+
+BEGIN {
+	a = 1;
+	b = 2;
+	trace(a != b ? "abcdef" : "ABCDEF");
+	trace(" ");
+	trace(a > b ? strjoin("abc", "def") : "ABCDEF");
+	trace(" ");
+	trace(a < b ? "abcdef" : strjoin("ABC", "DEF"));
+	trace(" ");
+	trace(a == b ? strjoin("abc", "def") : strjoin("ABC", "DEF"));
+
+	exit(0);
+}
+
+ERROR {
+	exit(1);
+}
diff --git a/test/unittest/codegen/tst.tstring_ternary_mix.r b/test/unittest/codegen/tst.tstring_ternary_mix.r
new file mode 100644
index 00000000..72cc85c3
--- /dev/null
+++ b/test/unittest/codegen/tst.tstring_ternary_mix.r
@@ -0,0 +1 @@
+abcdef ABCDEF abcdef ABCDEF
diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.d b/test/unittest/codegen/tst.tstring_ternary_nested.d
new file mode 100644
index 00000000..8cd2ea60
--- /dev/null
+++ b/test/unittest/codegen/tst.tstring_ternary_nested.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * Ensure tstrings are handled correctly for nested ternary (?:) expressions.
+ */
+
+#pragma D option quiet
+
+BEGIN {
+	x = 42;
+	trace(x > 1 ? strjoin(strjoin("a", "bc"), strjoin("de", "f")) :
+	      x > 2 ? strjoin(strjoin("A", "BC"), strjoin("DE", "F")) :
+	      x > 3 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
+	      strjoin(strjoin("U", "VW"), strjoin("XY", "Z")));
+
+	exit(0);
+}
+
+ERROR {
+	exit(1);
+}
diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.r b/test/unittest/codegen/tst.tstring_ternary_nested.r
new file mode 100644
index 00000000..0373d933
--- /dev/null
+++ b/test/unittest/codegen/tst.tstring_ternary_nested.r
@@ -0,0 +1 @@
+abcdef
-- 
2.45.2

