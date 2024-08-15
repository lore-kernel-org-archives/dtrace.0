Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA631537DE
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723763100; cv=fail; b=fA2W/LYsN1q6SHwdWdGpXjWsLNI0s6TroKt3DlXS2YzaTrOwGc88758/PhpBjc1j6BnTA90BLrU5tMljEcu2BktLa5S1KFMKG+COUXmGurXy+emuxZjrHphjX57L4FCriuRTy/Qpf7cUVc+DFsDY1mjmrjK5qxaT+O71uLbaRks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723763100; c=relaxed/simple;
	bh=BexeqKzvASzGH8qsStz0OYG5bqCDni6uq2pHeLcIp+s=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=m702cMp+LxWsZiYbPynh/S0juBQwvtoALiAI1xfQQes4b9Ch2EIXt4hjTq9CSIdYzEfxvHTfhlDuOWVRLRFoZvk6j78JfUgiXlyJNKxAJtb8qpQggS+Dpel5MiX4ATLGu3Zz06fqXcrnpFyzwcuacCze8d8PbDvK1lPpE2srmhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WeOkHHEQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VRAv21mc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WeOkHHEQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VRAv21mc"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FLwA2d007800
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=lj4SYLjx1sOe0NiKf+RbfinqvL4yTXliOjwzcADTvaU=; b=
	WeOkHHEQvjyyx1djN10P8C7/hoR7jpGEPkixuC7ndBE60JicVZqX4LQhzxczwecY
	+qrRPANJUtAhwJLsiAmaDdHby1hZN/OqjixsjudcejAQRg16R/Znhi+V3sNgiaLU
	3foyM5rbkD7+UEsYF3xR4B3Mil6KMjl8C/AXpf5gQHN+HO5v70DFTJpxkhPthhn1
	yNlAGsAWl3tZw+O5CD1aF3EgeA/FbhHsrq6x4Dk1AlaWaXSs2TN52hX4iiYgVaUP
	RfmoIQNR4unSlKoDRno6J2Iqg2Tn7oTy39hXRGINS8bB6qYeKkXSy8sFmg92vjua
	9Yo8Zwx8nXNlKg+Rf9ahyg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40wy033pjn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:04:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47FKaKS7017737
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:04:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40wxncry65-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 15 Aug 2024 23:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUI7+22rOxM6FucuTltX5rURqNeaJBBO1R05NhbyUXrc8SzwXrsw4SlfvSbJEhxRGlUCM+wF139sJU6gAnRmtkl3DgJ2xZeUXawR2lVOM3d8W0N7QSQoktgJ0K0nUjXLLaLko94DJZ3A+T4MKHX8l9/cNnWbYeXJLsRk/7d+btv2TzaV1H5qLdLNrT98W/xHlW+u3t00k4iVvrJNqKU3lI8lHn2o/C3jLkPMXG8ChYdgrhGwGH/wKYuN7uzOONkM1pbTp6LNbGgyQ8xoyHe4H7ZDIVufjgfhzrJgSQHI70OMmeIibmwsmdd3s2JNj9QfzCAjzi4WkozDsaexdSQE7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj4SYLjx1sOe0NiKf+RbfinqvL4yTXliOjwzcADTvaU=;
 b=vvb4TrEqhZ+1WkSwYz/t6fqL17SgP5QWQmiTmo5NLlES38DIbX/Rzgn6qoFkKToCBKVn1GdFRK3Nl7TrH0GwJpI1T6j20qdj7/VnbvbIk5LBDVZLbIsuOq5oVfTe1VgDiFwnOAGPwh99tK7tNYQuL5HPJQtwLjC/iAXquBaVy4+BWy5TmMPnPxwmiQl0aBJFChV4/lts73apiLS5R3k7J+QbBm9YhZ2nQ2x8qtX9NQWIBwEW84a5FNDxppfxY7i+RPr6hx3yPscjGWcomH87Y+yJZasfwr92ZP+2hOcMygpkZkmw96HpBvWpRshez9q01fp1pVh8FLmpFw5F7pWk5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj4SYLjx1sOe0NiKf+RbfinqvL4yTXliOjwzcADTvaU=;
 b=VRAv21mccL8OI9eN2wDGLpzmK4wh+a0lgPoTGA9g5NHLpoakagVw4e72ChKVdatii/ymC6G1X3EnvI+cMjkxCNk3oQU3gkHZdaDKu5uvzqiMqlHFN2RADfbLkctdmxCky+FI7hUEqRWgGZZ5Q5vrHQ4QcQ0ykUxROzx8P6R+BVo=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB5831.namprd10.prod.outlook.com (2603:10b6:510:132::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.15; Thu, 15 Aug
 2024 23:04:49 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 15 Aug 2024
 23:04:49 +0000
Date: Thu, 15 Aug 2024 19:04:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 REVIEWED] agg: move aggregation declarations from dt_impl.h to
 dt_agrgegate.h
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:208:32d::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB628754E45D8B3B4B48135C49C2802@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB5831:EE_
X-MS-Office365-Filtering-Correlation-Id: 779acf92-3bf4-4c9e-58aa-08dcbd7ea9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P9WUCKHUgQkFgwCZjwQLggIwN2dtUgFn8OTwe1rZTJnf789mDt/ih2Py+I9k?=
 =?us-ascii?Q?b1AcJQJJPw5HMagDCMPr7DBMTnz+hApUhBuH2mIEp0OV5+tOb2XAlFghaJEF?=
 =?us-ascii?Q?DRX4uM91tSiszLKSltHop6ZSlOblLBgN+ise9mRLHEJL5b8iHa4cQzi5audI?=
 =?us-ascii?Q?lPCYZScFrLMoItVgnmebY+qRleVj6cHR3mHf0epjYoh6ETnojACaiytRq750?=
 =?us-ascii?Q?ozv4eaOrxn77E3oE1qSFZ4tpCc+clLTp+BUPbGHLlPwC9MzrMMLSnkMTbi6V?=
 =?us-ascii?Q?f7uS1BZKh2vKqwjeVXwFMOrbHmX2hf3k8E3fZwfn6uLAIPw78Ji9LpJ4Ocyz?=
 =?us-ascii?Q?4vMKPjhXcF0tmEgYu8pVJpmzJ52E4dEY3r24QabYN3RgQOOh9fyiuaOqm0ov?=
 =?us-ascii?Q?93B8tGHioceh3kEtYW0/6D37cijBkGCSpSak4x0OXnE/TaUv/pbWxaHfFEcC?=
 =?us-ascii?Q?hx131i+FeAM4myS8QcYxbchRFwqXPOgXpMgSCjR1n9/5fOJbv74e/6AqTT8Q?=
 =?us-ascii?Q?33uqMGhNpZpkF/JSafK8jzpTUGCmpUhj5LITHPKrJz2rqS800IgoX22mAOvr?=
 =?us-ascii?Q?ZW/z7aECQ67zQQQsImvKmuZyKIY3WJb+SAdHOVRZ5JXsxnYfLjoDB7ODRLjQ?=
 =?us-ascii?Q?NpnOUWDp/buyzzDJg+G0GQvRmFBbC4pbszkAvA3t6hKFRU0GYZRyq0KuIKED?=
 =?us-ascii?Q?uJLSzSVDaPc/Dwx0OmCC7dxfJ3XInfOEgcQq1JQEo74n0HXf1UaiMF2n2G4m?=
 =?us-ascii?Q?+VLFjWxcYQGT0zbo19OyDHsLFK4smWJg5YfsDDdEQeK5xpzDMHRUF+PNbFN4?=
 =?us-ascii?Q?oXeoF8IKV8G0M0phDKiKiqnr9d02gBUnt6fhugVvSYJiChbLOx70RjT4zrxW?=
 =?us-ascii?Q?93RxB+Hl5+63AwmDowyzRbf15oIICodCys2AEkP1qMNSFoeAw9qfWQF4/ibA?=
 =?us-ascii?Q?Sl0hEwKd33wEjJecDRdBPgN72yINPUiMCMSLt3SjA04+lJgtvi0IlmdLgvMJ?=
 =?us-ascii?Q?NZ2KJ1n/tJSd1lLSQHQbLar7vqtmk3IopGvLvtBDwV6LsTaQCp7nXOJnavgd?=
 =?us-ascii?Q?lsEnmBaxxUnXuLYJG874DYBoAln9E+8zPg5fFSossIAf/Uv0zbHFsgCfAbRY?=
 =?us-ascii?Q?jIZ01eEhLath7sJWkqw1+QGN9kznVQHIZdi5xWHA9PfxRPIDRjJURrHv4QjL?=
 =?us-ascii?Q?AVGASHpH+vLU2KnzBzdUwT0RoMZ49olfPaPatB0sLa8vBQpn+pR35SrA34sx?=
 =?us-ascii?Q?rQv5m8RNq5Ty0PXTQX9K2cl9MZ4OyVLX9AdAZ2aePV+Sp0neiTha7cAQWhLH?=
 =?us-ascii?Q?rXpZyjVp9xn/C4wx0BcB4yLwbv2rDkukkmVgglh/1Haz+pdI2KF951uDPHiY?=
 =?us-ascii?Q?VLq8OeQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e4ssqXrtfu5rnWYV4L9RFvr6otrqDRf1JzITtcW5VBLEmbqCp0mfFKhhpdRn?=
 =?us-ascii?Q?kBT2UtmkIVEIIxP1A7NhnI+m8yvvM01F6FBvbjsBAp4U0sOG52PbUVfWFn92?=
 =?us-ascii?Q?duliLaQtFd6Soc/YwZ9NK/QIjxkB9hvSaC9bJbRpYbjpOEaenwj27X4SOPCy?=
 =?us-ascii?Q?YgxnTpTlF8ZYdtyOCDyheUn4Fm7DWoOhVsryi1TaI2LzAjkQpcDeFCWOClJZ?=
 =?us-ascii?Q?MNvGBZvCEcnwhToZADcj13ZGUwHSOA3PgN8/StdpJEkwI/yRWBLtppGfW/h+?=
 =?us-ascii?Q?QLtiOzJYHJtWakyGNszS5r1CSSL13s+039J76KNPaz2Xf05FGQgrlXVF0a7L?=
 =?us-ascii?Q?QmnEQfMD8+ihn9Bm6g/MVWyUtnEcEchtecr8ddDiyWNjqTQI/99h6u8YYiVJ?=
 =?us-ascii?Q?L8vp8NuXjfAGOMojYJwHEttqnNnp1Qcd0J8+XvLBwasxE+6uD3ZyKbSF46Vr?=
 =?us-ascii?Q?mydX/IZ7TGwRpcpc0S93D6k0s5/ureEaLihG0ztaknTGz4yq7DXGF80A6w3q?=
 =?us-ascii?Q?3/uqVp4hIQuKCg14pd7BcL10BGGvaFiPipgnvnk+1D3K+leab2K69WdjBnVW?=
 =?us-ascii?Q?v3UasXAPget9ImXhayzo/Dab3/dKaX6307NiFh2mGUTdjDddOxEQ0uq/vNBP?=
 =?us-ascii?Q?DvX34asyCfQQm9euV1cR3yNnf7wIxz7y7EqdKh2ZrXjIgwnP2RClXF7PRboJ?=
 =?us-ascii?Q?aHjmCDb2mVpwXlF0TYqhDfV5BQSrfpOelkHCnNK9w7hYBfaOKTzmzH0mB2QY?=
 =?us-ascii?Q?D2IiTm794tK64mMDwJeIHnFk6iWiyjmpbwZ5JlLrjynXAHCkbezfGvRMUZ5j?=
 =?us-ascii?Q?ICTn38nhBRzMnGeLVreVi7gfHYWJMSsBhB2K9N32bd7cI82nzF1UCJpxlh+5?=
 =?us-ascii?Q?TY8YONWTmJtxTNwmoth3dV2tbjQCAjVc+AWtokOEwrHRyMXKpXVEzINm+VJD?=
 =?us-ascii?Q?1tJNciuhM0+ieKxG6VNCZT698ZcV6JiBtW3yKmATEIh9oVUcQLOFGf11a53q?=
 =?us-ascii?Q?sO82JSca9GG1QLxogG35A+x3kYcr885UzFdonE0uwNC7z9ROIM6OXnvTYmxs?=
 =?us-ascii?Q?Vm/9w3aftgLNIFlALBWyaZx8Xja+obAHY5plO2AjWMFIOMX6HdrmPNrePtD2?=
 =?us-ascii?Q?ho2XCJMFuBfGw5AnxVLqtRpcJHpbLr+d3i/QGO27u7odxZlcwDB47ee3zV7/?=
 =?us-ascii?Q?s55dEluda9Q1jMDPM1+ghlKrhFHdCeqMdNiyqejwfk9ZhZYRK7uHf4H74UOn?=
 =?us-ascii?Q?9Xxp/8gy/9K5wTbb5m4WDOR+AKX1noGGCYPgfB8V8gNxDDL9BKKg86cEhRDX?=
 =?us-ascii?Q?r03YAFhHHTtX+uPBbjideRsNL6/LfT1dcp1LgtSXgSSXiLV3fKWsyNx6IkoB?=
 =?us-ascii?Q?6tvswxujYxSQoFc4Xio5gOYn7sZwU1wcuMG0TeEvlPMYgpuQt+gR1lV9VHp5?=
 =?us-ascii?Q?2UJ89HzL98aB8jgLtFMrxJtVFIaYFCMXrC/fA1jZWANGpOY8SotZiUIawsh7?=
 =?us-ascii?Q?TZyLSAII+40djIvOQ1hWm7roUrGCvKd7JPAR0b9ZmsNNqCdoIbMLoB5oYEOO?=
 =?us-ascii?Q?aoFmyg8xhquGI4uQ5foHg+p6NcTRkSvwSMPcknHHoLY2VYkAROjj1+QhB//p?=
 =?us-ascii?Q?1UPKtW/OjpmTyAcOGHs1HAM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rKmPbHBweVxZCSxmncGCJVackX4x06i2Mm9FOgYvYx30NU0xPQUEuptWsP0X0i/exPuCFWQHpj9b+zf0VYjxE7cTt1s9peCQD5UzPVL2m9EZqP89XtTfWeUSQD5lwbkmd+pWyVg7gAwNZXW/ZvKO4ExzslHtf/qq3xWMMjaUtH4BaxbtGXUwAT5CPUboL7nZtQQfPPSGIUudIfc3ACJqYAwGt0xq1Bkfwe55OR4wVMaA5YY3CTQstlNMlnH5ek6zq1I7P01atetfHAZmih9M9hfgPq/5l5bUchJTQ9FWCwJgVlAzRjK4mvr42CiCu8/WVp5jzfh3vgZe34V/GXMBrNDabwVVpGiLvyltT/JAnNuc9ShdkKdrYjqx6/f1W0bUskrwFg4kUvpbME3RXQRtS5G5FN10deIK+9d6qywFnFxFNzeVIlLAG33wpTPW2VYxhhM695SCTyb7XsxgosgsJ5/7zg28JC0Bgu/KtWVpRtgJi328zbrxlzB04I0B40r08XaMptYYPLKcsjC7sSbtHCVgxj9fKk/zVsCjB1AULPi2zNxtEoVER8yTbIbVmHC/efi1rlDLvhNMphNzpOWGE0CGKSKgqvCkwnqxHq68trM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779acf92-3bf4-4c9e-58aa-08dcbd7ea9e3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 23:04:49.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LrGx+Brfo4jJOJvBjbEw7NQ3tjXLYbK62KzKD65yDsizkTYmqS1XyENoF2zrPqRO5HmRldiSAPgdvluqS1qoInWx87ArgJg41dc9kZCFxUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5831
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_15,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408150168
X-Proofpoint-GUID: okBvozjfhcr6ruC6KeYH8hDwuMyQrlxP
X-Proofpoint-ORIG-GUID: okBvozjfhcr6ruC6KeYH8hDwuMyQrlxP

This also changes how the aggregation root is stored in dtrace_hdl_t.
Rather than storing the struct inside dtrace_hdl_t we now store a
pointer to an allocated struct.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c | 64 +++++++++++++++++++++++++++++++++-------
 libdtrace/dt_aggregate.h | 52 ++++++++++++++++++++++++++++++++
 libdtrace/dt_cg.c        |  1 +
 libdtrace/dt_consume.c   |  1 +
 libdtrace/dt_impl.h      | 56 ++---------------------------------
 libdtrace/dt_map.c       |  1 +
 libdtrace/dt_open.c      |  3 ++
 libdtrace/dt_options.c   |  6 ++--
 libdtrace/dt_printf.c    |  3 +-
 libdtrace/dt_work.c      | 13 ++++----
 10 files changed, 125 insertions(+), 75 deletions(-)
 create mode 100644 libdtrace/dt_aggregate.h

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index 6472360b..329b8ffa 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -16,8 +16,32 @@
 
 #include <libproc.h>
 #include <port.h>
+#include <dt_aggregate.h>
 #include <dt_bpf.h>
 
+typedef struct dt_ahashent {
+	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
+	struct dt_ahashent *dtahe_next;		/* next on hash chain */
+	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
+	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
+	uint64_t dtahe_hval;			/* hash value */
+	dtrace_aggdata_t dtahe_data;		/* data */
+} dt_ahashent_t;
+
+typedef struct dt_ahash {
+	dt_ahashent_t	**dtah_hash;		/* hash table */
+	dt_ahashent_t	*dtah_all;		/* list of all elements */
+	size_t		dtah_size;		/* size of hash table */
+} dt_ahash_t;
+
+struct dt_aggregate {
+	char *dtat_key;			/* aggregation key */
+	char *dtat_buf;			/* aggregation data buffer */
+	char *dtat_nextkey;		/* next aggregation key */
+	int dtat_flags;			/* aggregate flags */
+	dt_ahash_t dtat_hash;		/* aggregate hash table */
+};
+
 #define	DTRACE_AHASHSIZE	32779		/* big 'ol prime */
 
 /*
@@ -34,6 +58,21 @@ static int dt_keypos;
 #define	DT_LESSTHAN	(dt_revsort == 0 ? -1 : 1)
 #define	DT_GREATERTHAN	(dt_revsort == 0 ? 1 : -1)
 
+int
+dt_aggregate_init(dtrace_hdl_t *dtp) {
+	dtp->dt_aggregate = dt_zalloc(dtp, sizeof(dt_aggregate_t));
+	if (dtp->dt_aggregate == NULL)
+		return dt_set_errno(dtp, EDT_NOMEM);
+
+	return 0;
+}
+
+void
+dt_aggregate_set_option(dtrace_hdl_t *dtp, uintptr_t opt)
+{
+	dtp->dt_aggregate->dtat_flags |= opt;
+}
+
 static int
 dt_aggregate_countcmp(int64_t *lhs, int64_t *rhs)
 {
@@ -503,7 +542,7 @@ static int
 dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 		      const char *data)
 {
-	dt_ahash_t		*agh = &dtp->dt_aggregate.dtat_hash;
+	dt_ahash_t		*agh = &dtp->dt_aggregate->dtat_hash;
 	dt_ahashent_t		*h;
 	dtrace_aggdesc_t	*agg;
 	dtrace_aggdata_t	*agd;
@@ -621,7 +660,7 @@ hashnext:
 
 	memcpy(ptr, data, size);
 	agd->dtada_data = ptr;
-	if (dtp->dt_aggregate.dtat_flags & DTRACE_A_PERCPU) {
+	if (dtp->dt_aggregate->dtat_flags & DTRACE_A_PERCPU) {
 		int i, max_cpus = dtp->dt_conf.max_cpuid + 1;
 		dtrace_recdesc_t	*rec = &agg->dtagd_drecs[DT_AGGDATA_RECORD];
 
@@ -658,7 +697,7 @@ hashnext:
 static int
 dt_aggregate_snap_cpu(dtrace_hdl_t *dtp, processorid_t cpu, int fd)
 {
-	dt_aggregate_t		*agp = &dtp->dt_aggregate;
+	dt_aggregate_t		*agp = dtp->dt_aggregate;
 	size_t			ksize = dtp->dt_maxtuplesize;
 	char			*key = agp->dtat_key;
 	char			*data = agp->dtat_buf;
@@ -692,7 +731,7 @@ int
 dtrace_aggregate_snap(dtrace_hdl_t *dtp)
 {
 	dtrace_optval_t	interval = dtp->dt_options[DTRACEOPT_AGGRATE];
-	dt_aggregate_t	*agp = &dtp->dt_aggregate;
+	dt_aggregate_t	*agp = dtp->dt_aggregate;
 	int		i, rval;
 
 	/* Has tracing started yet? */
@@ -1104,7 +1143,7 @@ dt_aggregate_bundlecmp(const void *lhs, const void *rhs)
 int
 dt_aggregate_go(dtrace_hdl_t *dtp)
 {
-	dt_aggregate_t	*agp = &dtp->dt_aggregate;
+	dt_aggregate_t	*agp = dtp->dt_aggregate;
 	dt_ahash_t	*agh = &agp->dtat_hash;
 
 	/* If there are no aggregations there is nothing to do. */
@@ -1149,7 +1188,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
 {
 	dtrace_aggdata_t	*agd = &h->dtahe_data;
 	int			i, ncpus = dtp->dt_conf.num_online_cpus;
-	char			*key = dtp->dt_aggregate.dtat_key;
+	char			*key = dtp->dt_aggregate->dtat_key;
 
 	memset(key, 0, dtp->dt_maxtuplesize);
 	memcpy(key, agd->dtada_key, agd->dtada_desc->dtagd_ksize);
@@ -1171,7 +1210,7 @@ dt_aggwalk_remove(dtrace_hdl_t *dtp, dt_ahashent_t *h)
 static int
 dt_aggwalk_rval(dtrace_hdl_t *dtp, dt_ahashent_t *h, int rval)
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
+	dt_aggregate_t *agp = dtp->dt_aggregate;
 
 	switch (rval) {
 	case DTRACE_AGGWALK_NEXT:
@@ -1281,7 +1320,7 @@ int
 dtrace_aggregate_walk(dtrace_hdl_t *dtp, dtrace_aggregate_f *func, void *arg)
 {
 	dt_ahashent_t *h, *next;
-	dt_ahash_t *hash = &dtp->dt_aggregate.dtat_hash;
+	dt_ahash_t *hash = &dtp->dt_aggregate->dtat_hash;
 
 	for (h = hash->dtah_all; h != NULL; h = next) {
 		/*
@@ -1302,7 +1341,7 @@ static int
 dt_aggregate_walk_sorted(dtrace_hdl_t *dtp, dtrace_aggregate_f *func,
 			 void *arg, int (*sfunc)(const void *, const void *))
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
+	dt_aggregate_t *agp = dtp->dt_aggregate;
 	dt_ahashent_t *h, **sorted;
 	dt_ahash_t *hash = &agp->dtat_hash;
 	size_t i, nentries = 0;
@@ -1428,7 +1467,7 @@ dtrace_aggregate_walk_joined(dtrace_hdl_t *dtp, dtrace_aggid_t *aggvars,
 			     int naggvars, dtrace_aggregate_walk_joined_f *func,
 			     void *arg)
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
+	dt_aggregate_t *agp = dtp->dt_aggregate;
 	dt_ahashent_t *h, **sorted = NULL, ***bundle, **nbundle;
 	const dtrace_aggdata_t **data;
 	dt_ahashent_t *zaggdata = NULL;
@@ -1829,7 +1868,7 @@ dtrace_aggregate_clear(dtrace_hdl_t *dtp)
 void
 dt_aggregate_destroy(dtrace_hdl_t *dtp)
 {
-	dt_aggregate_t		*agp = &dtp->dt_aggregate;
+	dt_aggregate_t		*agp = dtp->dt_aggregate;
 	dt_ahash_t		*hash = &agp->dtat_hash;
 	dt_ahashent_t		*h, *next;
 	dtrace_aggdata_t	*agd;
@@ -1864,4 +1903,7 @@ dt_aggregate_destroy(dtrace_hdl_t *dtp)
 	dt_free(dtp, agp->dtat_key);
 	dt_free(dtp, agp->dtat_buf);
 	dt_free(dtp, agp->dtat_nextkey);
+	dt_free(dtp, agp);
+
+	dtp->dt_aggregate = NULL;
 }
diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
new file mode 100644
index 00000000..4f8d09bf
--- /dev/null
+++ b/libdtrace/dt_aggregate.h
@@ -0,0 +1,52 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#ifndef	_DT_AGGREGATE_H
+#define	_DT_AGGREGATE_H
+
+#ifdef	__cplusplus
+extern "C" {
+#endif
+
+typedef struct dt_aggregate dt_aggregate_t;
+
+#define DT_AGGDATA_COUNTER	0
+#define DT_AGGDATA_RECORD	1
+
+/*
+ * Aggregation functions.
+ */
+#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
+#define	DT_AGG(n)		(DT_AGG_BASE + (n))
+#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
+#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
+
+typedef enum dt_aggfid {
+	DT_AGG_AVG = DT_AGG_BASE,
+	DT_AGG_COUNT,
+	DT_AGG_LLQUANTIZE,
+	DT_AGG_LQUANTIZE,
+	DT_AGG_MAX,
+	DT_AGG_MIN,
+	DT_AGG_QUANTIZE,
+	DT_AGG_STDDEV,
+	DT_AGG_SUM,
+
+	DT_AGG_HIGHEST
+} dt_aggfid_t;
+
+extern int dt_aggregate_init(dtrace_hdl_t *);
+extern void dt_aggregate_set_option(dtrace_hdl_t *, uintptr_t);
+extern int dt_aggregate_go(dtrace_hdl_t *);
+extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
+extern void dt_aggregate_destroy(dtrace_hdl_t *);
+
+#ifdef	__cplusplus
+}
+#endif
+
+#endif	/* _DT_AGGREGATE_H */
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 164f9e5f..cce2535c 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -16,6 +16,7 @@
 #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
 
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_dis.h>
 #include <dt_dctx.h>
 #include <dt_cg.h>
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 07856746..6ad73324 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -14,6 +14,7 @@
 #include <ctype.h>
 #include <alloca.h>
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_module.h>
 #include <dt_pcap.h>
 #include <dt_peb.h>
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 88b31ce0..bfb2cbb1 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -83,6 +83,7 @@ extern "C" {
 #define DT_NULL_STRING ((uint16_t)0x7f00)
 #endif
 
+struct dt_aggregate;		/* see <dt_aggregate.h> */
 struct dt_module;		/* see below */
 struct dt_pfdict;		/* see <dt_printf.h> */
 struct dt_arg;			/* see below */
@@ -197,24 +198,6 @@ typedef struct dt_kern_path {
 #define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
 #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
 
-typedef struct dt_ahashent {
-	struct dt_ahashent *dtahe_prev;		/* prev on hash chain */
-	struct dt_ahashent *dtahe_next;		/* next on hash chain */
-	struct dt_ahashent *dtahe_prevall;	/* prev on list of all */
-	struct dt_ahashent *dtahe_nextall;	/* next on list of all */
-	uint64_t dtahe_hval;			/* hash value */
-	dtrace_aggdata_t dtahe_data;		/* data */
-} dt_ahashent_t;
-
-typedef struct dt_ahash {
-	dt_ahashent_t	**dtah_hash;		/* hash table */
-	dt_ahashent_t	*dtah_all;		/* list of all elements */
-	size_t		dtah_size;		/* size of hash table */
-} dt_ahash_t;
-
-#define DT_AGGDATA_COUNTER	0
-#define DT_AGGDATA_RECORD	1
-
 /*
  * Why do we need (only) 4 slots?  The maximum amount of string arguments to
  * any function is 2, and if the result is a string as well, that means we may
@@ -245,14 +228,6 @@ typedef struct dt_tstring {
 	int		in_use;			/* In use (1) or not (0) */
 } dt_tstring_t;
 
-typedef struct dt_aggregate {
-	char *dtat_key;			/* aggregation key */
-	char *dtat_buf;			/* aggregation data buffer */
-	char *dtat_nextkey;		/* next aggregation key */
-	int dtat_flags;			/* aggregate flags */
-	dt_ahash_t dtat_hash;		/* aggregate hash table */
-} dt_aggregate_t;
-
 typedef struct dt_dirpath {
 	dt_list_t dir_list;		/* linked-list forward/back pointers */
 	char *dir_path;			/* directory pathname */
@@ -387,7 +362,7 @@ struct dtrace_hdl {
 	size_t dt_maxagg;	/* max aggregation ID */
 	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
 	int dt_maxformat;	/* max format ID */
-	dt_aggregate_t dt_aggregate; /* aggregate */
+	struct dt_aggregate *dt_aggregate; /* aggregate */
 	struct dt_pebset *dt_pebset; /* perf event buffers set */
 	struct dt_pfdict *dt_pfdict; /* dictionary of printf conversions */
 	dt_version_t dt_vmax;	/* optional ceiling on program API binding */
@@ -593,28 +568,6 @@ struct dtrace_hdl {
 
 #define DT_ACT_MAX		31
 
-/*
- * Aggregation functions.
- */
-#define	DT_AGG_BASE		DTRACEACT_AGGREGATION
-#define	DT_AGG(n)		(DT_AGG_BASE + (n))
-#define DT_AGG_IDX(n)		((n) - DT_AGG_BASE)
-#define DT_AGG_NUM		(DT_AGG_IDX(DT_AGG_HIGHEST))
-
-typedef enum dt_aggfid {
-	DT_AGG_AVG = DT_AGG_BASE,
-	DT_AGG_COUNT,
-	DT_AGG_LLQUANTIZE,
-	DT_AGG_LQUANTIZE,
-	DT_AGG_MAX,
-	DT_AGG_MIN,
-	DT_AGG_QUANTIZE,
-	DT_AGG_STDDEV,
-	DT_AGG_SUM,
-
-	DT_AGG_HIGHEST
-} dt_aggfid_t;
-
 /*
  * Sentinel to tell freopen() to restore the saved stdout.  This must not
  * be ever valid for opening for write access via freopen(3C), which of
@@ -828,11 +781,6 @@ extern int dt_reduce(dtrace_hdl_t *, dt_version_t);
 extern dtrace_difo_t *dt_as(dt_pcb_t *);
 extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
 
-extern int dt_aggregate_go(dtrace_hdl_t *);
-extern int dt_aggregate_init(dtrace_hdl_t *);
-extern void dt_aggregate_destroy(dtrace_hdl_t *);
-extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
-
 extern int dt_consume_init(dtrace_hdl_t *);
 extern void dt_consume_fini(dtrace_hdl_t *);
 
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index c14a0bb1..60a2eca2 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -11,6 +11,7 @@
 #include <assert.h>
 
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_pcb.h>
 #include <dt_probe.h>
 #include <dt_printf.h>
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 5c922488..77ffb6d2 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -28,6 +28,7 @@
 #include <libproc.h>
 
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_bpf.h>
 #include <dt_pcap.h>
 #include <dt_program.h>
@@ -740,6 +741,8 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
 	dtp->dt_nextepid = 1;
 	dtp->dt_maxprobe = 0;
+	if (dt_aggregate_init(dtp) == -1)
+		return set_open_errno(dtp, errp, dtrace_errno(dtp));
 	dtp->dt_vmax = DT_VERS_LATEST;
 	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
 	dtp->dt_cpp_argv = malloc(sizeof(char *));
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 997f11a2..2f7917a0 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -20,6 +20,7 @@
 #include <ctype.h>
 
 #include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_pcap.h>
 #include <dt_string.h>
 #include <libproc.h>
@@ -27,12 +28,11 @@
 static int
 dt_opt_agg(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
-	dt_aggregate_t *agp = &dtp->dt_aggregate;
-
 	if (arg != NULL)
 		return dt_set_errno(dtp, EDT_BADOPTVAL);
 
-	agp->dtat_flags |= option;
+	dt_aggregate_set_option(dtp, option);
+
 	return 0;
 }
 
diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
index e999498c..21ec7411 100644
--- a/libdtrace/dt_printf.c
+++ b/libdtrace/dt_printf.c
@@ -14,10 +14,11 @@
 #include <limits.h>
 #include <port.h>
 
+#include <dt_impl.h>
+#include <dt_aggregate.h>
 #include <dt_module.h>
 #include <dt_printf.h>
 #include <dt_string.h>
-#include <dt_impl.h>
 
 /*ARGSUSED*/
 static int
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 69a86358..13483301 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -5,12 +5,6 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-#include <dt_impl.h>
-#include <dt_peb.h>
-#include <dt_probe.h>
-#include <dt_bpf.h>
-#include <dt_bpf_maps.h>
-#include <dt_state.h>
 #include <stddef.h>
 #include <errno.h>
 #include <assert.h>
@@ -20,6 +14,13 @@
 #include <linux/perf_event.h>
 #include <sys/epoll.h>
 #include <valgrind/valgrind.h>
+#include <dt_impl.h>
+#include <dt_aggregate.h>
+#include <dt_peb.h>
+#include <dt_probe.h>
+#include <dt_bpf.h>
+#include <dt_bpf_maps.h>
+#include <dt_state.h>
 
 void
 BEGIN_probe(void)
-- 
2.42.0

