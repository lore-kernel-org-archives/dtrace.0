Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E80210EC
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722022570; cv=fail; b=d3g6O4OXOmxo+l6lJf3XH2Q3YyUs5RiCDKAy45z0hSuPQQq96U+t0Zu3nYvufHuYf+qAD1tZTOxokLRvfn2I2cnrhq8p/rZhRy/N6aIkMW2H4FN5gKjflL77H6xuo7FVThBRXFM0dt4uD/tlnfIf7XdBKw1OYiK1So+S1qd1gsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722022570; c=relaxed/simple;
	bh=FokAID4CdLcte0Da8NhjZ9s3wTF+YvYDRfcx32ZAEoc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=CNxbQDNwmpRkJeh7cQNXBY027NwMzaF/YYAqvWM5chkXMCewNKZqm2XLcOPQb9t+5lvqhtCGM9h2CSm1j3/YL8tqouZfHBYmdMJC/d9PV8mDIfypjzXWsd4UliITD+M3AL6Ys2pnN/KjL2fJXU9sbVvqmRun5Dk3JXWkc81mD7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aud1sOxI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qFzesaeZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aud1sOxI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qFzesaeZ"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QIMJNU007857
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=o8r+9hEjjKxLbPEll89d/3hrpyc5ZnepvfYIqlnJyZk=; b=
	aud1sOxIfAC0NumGhcKPzus+oQ8Y81/Q22q0XpQafFYwPLcE17TYgxz/aCBkMD4J
	oMQ0PyqB/+CIX7NDueK+N8epXqQWEc7rjv0yzc/bmVTOucBSDaGdjrb25ZazRd+C
	09k+YMuIDTqp/XVaPkboMwSStucJRBeRUmcI1mMlLB1tiyrA1lYs6q0aI1L9L2vk
	pa9CTAQliu9B9m2RyB+WBcaHta4L3bomFjt2OW6SbWezTbd6/rzDHoPGQbr5xSH2
	IFa+sYqGVb73f6WJQLCmF/9AcnJTVzQDjfgQ+DezCkP0T5h3b+NpklmdO6SRNCcp
	s9vbgbM4BAfY1e363ol2Qw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hg115yy3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:36:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46QJR9SW013486
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:36:06 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h2a631gq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Jul 2024 19:36:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDHyq78NNVA/p0ItJ5jQzj2lfuBGm/I7cOiDHtJtvhIRaqplPZJ8kNKQYBlKDTSL3VyZV91N+kLWCXcWrUMu3SP/gxztlt7mBcGsdtn53oyTWorY54lkp9cwU/11enpW7oE9R6s/IU/uQTaFhLE7C3Wa/HX+8HBso9JA1DIqFNUQbjcJPOZcIVU1M6Fs5BLE0dZcAO7lFdENO2nVfqma8CKDvopKX3nQkhTNN8roFAFz/fscxOvzFX/whSGoOqks6gvTYugq+EWQr6hj9/dg6lhqGQ9IzPqJkR0PWAGeoWD5kfreDywbnpLvEFhYljvsPclKYcvIadjiJntqUpHhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8r+9hEjjKxLbPEll89d/3hrpyc5ZnepvfYIqlnJyZk=;
 b=JhuW/RWxOxnFCmnEEPpqLjPR/5zptLSlBK/vrnnLCdrgVlpL07peQb3Ys+YKZyQUZqw/f5kWpf7P+jvrz3NBZxT4Xl42RepJTCgcvP2rYQ5cuTwP9kaUXPA27kf2pPkplyNuMNkJc8CDzfqVCYusJfQCBaxiqj9WxX+Zv1LTh5WEG46IN9FhRdL+UPtU5QqozPRlDOKVW95s9QayGX+ZRcrNkD3ggFx0OKf6S9RiHuMazPCnxtFQ3652sCF697Ei0im69Y8x2u8D0thX3rHPu5MXJJ7CtNLK0n4ObDy7L7QnNi5Q9p2l7M5Ttaww+Ns+GOTdUVmPlxGbICRVmskb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8r+9hEjjKxLbPEll89d/3hrpyc5ZnepvfYIqlnJyZk=;
 b=qFzesaeZpi7pxKLhfUfX6HmOu/MutCS50UeR12a7PhZPeBHVA33/BZgy7gwA6eC7MQCN03IedRPjQUp5dEG7GXWc4h7R4JLap92WbIwe++q+Q0idblrpBiMm/8S2aFS0ZVMMVFuUilHAh2Jy2saPLDd/VvKaMyfTNEoE8JPvlVc=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN4PR10MB5639.namprd10.prod.outlook.com (2603:10b6:806:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 19:36:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 19:36:04 +0000
Date: Fri, 26 Jul 2024 15:36:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] btf: remove useless code
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0004.namprd18.prod.outlook.com
 (2603:10b6:208:23c::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB628756B0AA8967FEF09F30A1C2B42@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN4PR10MB5639:EE_
X-MS-Office365-Filtering-Correlation-Id: cd11285c-f83f-4fa1-1563-08dcadaa3044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jr4LxN9BPodMpErO4sVxRff60Cbi+6X04WPO1yHo0uLDRa0wEi/YRexSZh2H?=
 =?us-ascii?Q?xuB6Yd6cbkd6ZN/XWjGFBo4MpQRCmxvpljjTOzM/DKBaIQga8qLgww1/aKv9?=
 =?us-ascii?Q?0+uvfRc6BCQsDllG1iKPNariXOIzZ6pRwCQu0exDdhSPuHlO6PEldkn9B65E?=
 =?us-ascii?Q?qZWRDRhSYUjWRmFekIiVVbs8EeyHVNliCr3SrMXvc52Fih1GfV6C1a6+Hxsb?=
 =?us-ascii?Q?g/1cBGfAsPyoc6m82+KNEJObpfEODeZL8tOTqdQWcehq/mxZ5LXtymcfppKo?=
 =?us-ascii?Q?sKolBkJNc6qjPDrTul0M/0QNoT7zt5jtoj/B9mwHXjD5wrg1rSsRjvqYkW1T?=
 =?us-ascii?Q?Zyyk0z5k7eMgQVlL26uauxO4UIFG8ttrG1y8QKpZtOMpcEEWInmgOIGpLqcm?=
 =?us-ascii?Q?28ZV5TWUVwc18Uw2VhyV7ZdlqauZkBNJ/VpMqhevL2P2RPbdvCeVTktocUKI?=
 =?us-ascii?Q?XRAXdZdW1mDmdh9Q46q2tVwmn2V6KPPiYnlL0gYJX6J0dtgExMMwhguYGdN/?=
 =?us-ascii?Q?/kY1QaEj/3K8B9hBPprxl41OWDslUGAqK3FQCHcwbg0iy4ppwSoepOvvP8Zy?=
 =?us-ascii?Q?Kh6FCr9cMWLvBv5dybjfh86WmkGR6hUSM0bOi0lT3/HCIXKHG9/E1s2Nx6HH?=
 =?us-ascii?Q?ehFyP7sk6iVZxrhdsv8vKzPQHuxzAYVt3hryE5zCVRaNmNVZJxlXPWEqwFRx?=
 =?us-ascii?Q?Zw3W1GyvowEnFinv3yUEbIdFAEmGCWIM787JDgXKrKHve48GuGTTqdekocS1?=
 =?us-ascii?Q?a30TI+himtPO3s+0BVVbqUSLbN6vpLYKbza2UfpIz5OuswmP8Fq/9XeeLjE4?=
 =?us-ascii?Q?o7nUNK7vbMB9+Qq88fwPFuPusFAwscgvXXVToKNMEXajBhgER7Xu3ZHPJKfj?=
 =?us-ascii?Q?Rxnuy/SCOcR/pgvvjHa6A0fT3ePm0VP61wTT3nsCC/9fHt66m3C66GrioSs1?=
 =?us-ascii?Q?bh9NP1v1A6IImnVvzdnr1WO184tYAUfNZUSFVJbPOjiOkxKJX6BhgbLNeGvo?=
 =?us-ascii?Q?ySvsGoXm+iCjydAxYZgV+ImgEOF/MyiIaHsY/Z9oXGNGv6dgfdi/gfzYRpx3?=
 =?us-ascii?Q?NqwvvGimR/OKm+562nuav+PZNJRk54vk/Oy2xKouB10vVH1x6wjsAVooXPHC?=
 =?us-ascii?Q?4hwx2wzQIrbXwaIanaIHCl1jNVUHdqA7V1HiZ/eo/ZFDAKSP2f9gjGK4BukH?=
 =?us-ascii?Q?+TdUEUVlXVzQNEYPdF6MlIkT0yUDLCB26/Y1HyutBXuPpmxswdGjAeds1A3L?=
 =?us-ascii?Q?gjJGyziRhEenbFIDh/Y1CLLX+oNSbnSo5PYJ53uvhYZ7HngTqTA3o7uUxu3b?=
 =?us-ascii?Q?LSHIa/RXh1Ra5HhC3JNtH8xMSVdHwJXjpqZldeFtTtwdiA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrW9gsvoX7asQa1srP+Nj3l99TBEyoELZ787mXCNSdMmvb8MiLTCMATFFhTK?=
 =?us-ascii?Q?pWzeAjspfdqVRcwZP2hbwXsqDQ3UsYBu7TcfZrTqNVHRMxyo222/Ihgjycdm?=
 =?us-ascii?Q?E/louxcrPmIgy2RlvcQsynCtSFpc8kGoYIcBOk3iav7JpQgQe0QCvyhPrrvM?=
 =?us-ascii?Q?qC6+ealcP2bpuuV+yxmzc8k0rueFdjqrUwZqdHM+FMQqfrL4JbjmB5ZLjMqn?=
 =?us-ascii?Q?+DwandbNtIhvvAEn85lxpUdI2HYoU2hKbEyJkzOo+ASqIBWqQaizeqylXmPB?=
 =?us-ascii?Q?RzWFkDOjlSwKDTAJHyNmI64P+sbfQSFK1M61ekvWNVgqJxwn8ib1FcGH5cia?=
 =?us-ascii?Q?jagwejiKTw7zEdulfTrsFb9eRXu6H4QdyfDO8dNyoTEHZA+Q2OyedX+TmFWg?=
 =?us-ascii?Q?G3UfId8H4L5+GJ6xMHiNrIlm7xyJcAT4QeiZhkmUZ3vxGR+02vdEERUNDAHe?=
 =?us-ascii?Q?zMilTBzoXKp5djieYTUjPPs+kXOOfVLVxWWPIcyQ+nX4MzJxa+vfJ3jgQUOF?=
 =?us-ascii?Q?QzbXo1pPyUgmXcMSZ2QjozlEnP5qo5J2LKOx0BhZnixoTbJir/+LxL+OjEID?=
 =?us-ascii?Q?j6yQPQB5y9JCeR7iRehUdbmBpCBB9nkdmhepFuJmxRdHPGthc1DIZgvU0yX1?=
 =?us-ascii?Q?5x4TlPufavIkLTZS9oeZ5UQ1S23xmfkSaxSKi2WZkV8lAARbHd1rS3zlGNd3?=
 =?us-ascii?Q?888ZsOFSV+SUNmxwXtpbOaVw4Jd5pVKNzRaeKHOSPz2ExhFrWslqB1qQ4jTi?=
 =?us-ascii?Q?N9IipShKpzOuFVS10qJBOtxg3ehMW4oQqGMFXTUdOnGD38GJz75fYbscQvla?=
 =?us-ascii?Q?Y1IyKLkMe8wE8YHyOBYDAOU978jI902qqY/r2JVnB7Z2a97CSGy7fnP4tOyj?=
 =?us-ascii?Q?NI7RHx92FM9auWXHLI4cgvj0VVj+inmllbb6r7L7slFRc5fxTX3b7Rbtk14E?=
 =?us-ascii?Q?scQ7hjKLRc1C5ZuCQRHavj6mNPgD59MzInuWdA4SBfZWReOVeynoZ1cDMjLt?=
 =?us-ascii?Q?s5bSFSMtg8QFjEGYSlk7AZ5a0ahz/djWudhxzArDM2mwEQISaTR0DiqXMUh4?=
 =?us-ascii?Q?dQCh9umFqCPZdxap2rPu9p42giGq6KpVyTPuxwGSw6yu6mI6sy5/bqV/5ThZ?=
 =?us-ascii?Q?MI8urA0dRvlMF3FKTgugb7a0MksVjtDdjUn8RkI+ll1A77NhwB/cUJxlErXI?=
 =?us-ascii?Q?/VH0zVVIU7t44S3ZXYn1tl1P4I5a7DQYRsGvGerQNe5eX84HaCNT0YYqEY8M?=
 =?us-ascii?Q?cMM8HDgRhieqtLZrDQWEotyzmbLcdSShr4eikZjUwzLUSmMVW4eVJlF4rTXH?=
 =?us-ascii?Q?I0o3DeUi/k1WEFGszHRg4BJMmL9tAsOlgFlOLVg68UQyfY7NN4oMfYQBL5yk?=
 =?us-ascii?Q?C3YY8BP3uHCmtah7C4NL+5eJ9mxjLEhkuQvPMlLK4Vv/V/QUvdgdMixltgyb?=
 =?us-ascii?Q?ad7U34bp/vbd6m0kmEbCOBGa9y9NdhcikaQqiU6wkVE6LTJQwkyK8a0xy/4A?=
 =?us-ascii?Q?XX55k1K+3jh+w9Sf0ruWwV4iiGdWkpXVq2FGO0dAaSQGmwujGCbt1Tfqq20p?=
 =?us-ascii?Q?zOpkvPkbNDHV3qiZiqQVu0xiy645XULLQcKE3Cr5PPDnuiCY0v4GEUGAKOVk?=
 =?us-ascii?Q?8YQtYZqcl8jcIKrrhlCeOeE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NTF+2HrM2yDEVGugE7JVYdKo9ZkHUD4oLhPDadrQfCDyXDlziizf8mKtfOy2Sw6i7naiWO0UlH0R66QiW8E3e80XBvbh++FZdc7j1OTtOBhMcqVB+cCl4+HgjPIuJ11Q4k3ZJ0We6Akk9Dy7VTXXmXPRVFs5f8F6qaEspBJCnaYQ3qWvg+KASWoc1Cbmnr1JGxl4nTA6L5NdlyZchg5VGBN253MYnyAtY2rh8fiX/pUXdFJQfZlrO9YSvCIkqvVOSJ62rLDSei9xvLVGUUqpN2oFu/jNMisLrJVFeZweaWxbZxcrzooLdjcjknKR9x2JNqSiyfQI/ZDEZ/P3T0FGfDY1Isi7CvSwon1/KPc5rcevkK/kNX2Cl62RYxnGWjlROKqIr7TNpa5DrPQunCstOkREQSrJPJwYyKXuceltSrpTxr91ZZFAiIChjti0z7pFnNi4+FQdy4uekOhWtxa0Gomk6RaKdw4+pC3W2tFAs8CIq5ttt4sp80HOkhrFJFIzC/iOWIUJ4OeZIxowj4vRY48Z1R1YcKkw5jviY7FBdL+betLelsZQfB2Bvx6ubxj3cLIjRbPdLUjmIUgTM1GtRYyzQsKYW4J6HlvfuS6BWhI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd11285c-f83f-4fa1-1563-08dcadaa3044
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 19:36:04.6190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N7vZokKYaDVjkqbgAD0xEpZlKOvTVdLDGYaKajqSkaqoIo/qPtJLcmcEPbXVnbZGL7798oVleIEWmlR+oC4QamKtS00JAXEDo9mKzF9mzvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5639
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407260133
X-Proofpoint-ORIG-GUID: _qj9t4EZgJ4V9PLGSR3b1t4CirfQGqwB
X-Proofpoint-GUID: _qj9t4EZgJ4V9PLGSR3b1t4CirfQGqwB

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_btf.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 9e67fd9d..3b45be1c 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -407,22 +407,19 @@ dt_btf_add_to_ctf(dtrace_hdl_t *dtp, dt_btf_t *btf, ctf_dict_t *ctf,
 		switch (kind) {
 		case BTF_KIND_ENUM:
 		case BTF_KIND_ENUM64:
-			if (snprintf(n, sizeof(n), "enum %s",
-				     name == NULL ? "(anon)" : name) < 0)
+			if (snprintf(n, sizeof(n), "enum %s", name) < 0)
 				return dt_ctf_set_errno(dtp, ECTF_NAMELEN);
 
 			ctfid = ctf_lookup_by_name(ctf, n);
 			break;
 		case BTF_KIND_UNION:
-			if (snprintf(n, sizeof(n), "union %s",
-				     name == NULL ? "(anon)" : name) < 0)
+			if (snprintf(n, sizeof(n), "union %s", name) < 0)
 				return dt_ctf_set_errno(dtp, ECTF_NAMELEN);
 	
 			ctfid = ctf_lookup_by_name(ctf, n);
 			break;
 		case BTF_KIND_STRUCT:
-			if (snprintf(n, sizeof(n), "struct %s",
-				     name == NULL ? "(anon)" : name) < 0)
+			if (snprintf(n, sizeof(n), "struct %s", name) < 0)
 				return dt_ctf_set_errno(dtp, ECTF_NAMELEN);
 	
 			ctfid = ctf_lookup_by_name(ctf, n);
-- 
2.45.2

