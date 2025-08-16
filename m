Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A874C6C
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755316020; cv=fail; b=s/qq6U+rCIIIP8i4pLWQwkaPCBp37bdiy9MSqzilgaJlYQsTviNdHrKLbo/r6syS4QiVdTZsbeLJYYOR37NsFBBAQfbBQuranbiFygC/7FaLnQ60w2ONb5y+1lbmk70kVkg/Zdg+loThy+Bv+Wxh5mKXg29vplRNADaplhKivts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755316020; c=relaxed/simple;
	bh=xJc2lsiSX/k5HiCwMs6HjkbeVPISG683BQul5upbHeQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=NZbRY1vsFGifTjwu7tfUKAn6OtUN0fuQqNdQsIfVVSeuwREE0SzZd5PgXxxNx3mUgGW0fbbV2TtHbb/DxzcSLKvjjjVKkv0QmffRMb5DDFN0KG6mOaHGJcKlxuleKF2A9fRJSoIygIkVaOTCVjEqbqXpph7DhbMgI6VPwWWDRuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cNdVYx69; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ASe1vr6U; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cNdVYx69";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ASe1vr6U"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3g6KB016334
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=2fnsIn90VkcWKRmz/zkkBXgFoCV/focoiDd/ftQrQEg=; b=
	cNdVYx6910Ec+9EpsoeywBSe52XJF29WdAN8GWuXLcgqFaNhpapkOeT2HstCXPpm
	Uj9pnaFBrrrWT4V7WPZviNZlI7yocjCPeGPe+u7FRaJMm6Mq50g1s3f3+Z2Uv2+g
	ds5gv2/DtwnrdkwUe5ZoEg+gZM2sXnIjGBGlkZv8IKy8rFEab5XqBw+TqU91p9WO
	H7zIJZepO+6yC7T0rpIuDe4kYpGZdTySvAQrbjOuwmGnF9olS/TxXku5gDvzk7wa
	1qpqNjTYmKEcOmU2mceTp4GkKz7JjX0mLS82PC7R8amB7KnblA4VkdNsrKItDHGM
	pa5EReCE8o5Wx2JfYeFOQg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jhkur168-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:46:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57G1XcHN023511
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:46:56 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48jge6tqmr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJR0iRYrGPnxUXcGazWeRpBKNe/dHqsqg3G9cPONb55PAtkUQxCNIH8OwLbs3pU2IDiOz66qJiYbxdsattkHMJ60ZYxMHSxBj9iGFfKjLp6BDkc7QeGGc7v6UL9Uh1ao9zNcS1xGO4wju/4r88+HbzgQVtWTYxuiOd5p6cvSM2nE+Wn9sFIgMchogQmbYQZBVMlMjr/gKk/SzTfRxeqwTKNY8i42lZXY0Hv3zrUd71AH+CfULoWpVRuJXGt/Ge7rnQ1L4nv2vG1wAU0rVNMh+8WoGOABCSW1z/So7vhF0o9omJnlxM+1WLocPqdPCCFnzFWhck3NdZyV7mtvobR8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fnsIn90VkcWKRmz/zkkBXgFoCV/focoiDd/ftQrQEg=;
 b=Qgph/E6wLfw3Qpj5zGwwEoP666addN/xmi9LJXvnSRr617e5miYX1Tvur1FrIWBiN8ccp3ctoipSvDP0bv89okEfsBuIHQH8EuYj74ZfQ1fhGgMKZtK/S0XAKW3P9jKhIOrSR52UHFgYbrmt8/m0QujGApNGP4G5E0w1vnxQOs1IL28loNr1AtoTDYTcp0JKjCNsNFopoYuqYvezuNvLAu7oV0yWBEwZib5hyu7m3Te/pzchWXg2U0swRdu1xiIXN9FqJQSjjNSGf7NtHAFuMMRd6u7bOka1gdsLMD+lV5bpDistEqOeTsr+z8q4WHLwYVNiLOOuEYkWnWv+SYmFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fnsIn90VkcWKRmz/zkkBXgFoCV/focoiDd/ftQrQEg=;
 b=ASe1vr6UzDbKODu3GJgpv5NNG9wlc5sALVgs+f4+ICLIiLdOCjc1Y12csgCdI6uQA+kLfa2aCkFIHqzx2SlNfq6mda0xRt4c+p4QHfZhqBxpXCJ9Agld80aJyaa+nSBsAFLv018SaOvkWvKi6/W59vXwL6V0bWPYTSoi7FlqlI8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB5892.namprd10.prod.outlook.com (2603:10b6:a03:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Sat, 16 Aug
 2025 03:46:52 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Sat, 16 Aug 2025
 03:46:52 +0000
Date: Fri, 15 Aug 2025 23:46:51 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/2] Refactor the versioning handling system (code movement)
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56720FDBFD11C3DFFF3AD2F9C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 69738479-5dd4-41a1-7174-08dddc7789af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Zf6R4bY69e8nPoyrHHm11jX66DXmgQq6gNGU/+LXIantNunOesnBIOMUA2j?=
 =?us-ascii?Q?tLHmNPhVzCrcxKXFOCBGOMCihxs07CGG/jjIhzl7Zeu1SpgIqdYnWtYkwhSe?=
 =?us-ascii?Q?8sIBfO4qqAHHhicZzR9SWOOmgfnSxEYOKJl6pMgZTysdkbk2N2iPrP/Hq3Hq?=
 =?us-ascii?Q?muVYMoglN2ZCEG3Z4WLtB4Tt9euf096RL/2E/3yxr2hc5St31MWjlgdWX2ja?=
 =?us-ascii?Q?d+KwS2spUs0APewQcesWGPDaZTUHxRp6PhbcSujfgcEnB4sGbF0BNNDoR8zt?=
 =?us-ascii?Q?l3dCXKzjafX3eg40zRff2lw69X5h550FVMJgv4CmUjH/HDwMflGTEoPJJ7zN?=
 =?us-ascii?Q?xnbZ6Iz13a/1fSdMjpF+OgnfVgftCfWDpvywB/g3On3hdKznVsZuhAF0fFeN?=
 =?us-ascii?Q?7O3vIYlJAwkWQWEK+NiRtLtZ4cbXPN+oj45mDwyYmQMd5Fou80vZaR7UMQRj?=
 =?us-ascii?Q?5XDr36DPmQlkl8m6DSd24441Aa6QglfEBury17k4GLhqDP79YldTmbGGcWOK?=
 =?us-ascii?Q?Y2XMSKFX3t2DbMv4NP3o7fOpulYRSzTgC48jOAVazfLcw9YjXwya1L+dDsJZ?=
 =?us-ascii?Q?o/gohfvpslrzL6C+IeV5hxAyTnFQrQ0Z48FgU558nsvGrvPniSDyoUObzFdT?=
 =?us-ascii?Q?aan8fngM7m6njFnt3E9yDgwrhNQ+tYRFXO2O8jhaI9Dhe0d8875wuQyEPIzh?=
 =?us-ascii?Q?10E+KWQD8QaLs1uOmwIYPm1K2FtMl0eNcrkRepuPNit+zdEPhmWHd5xQsO3n?=
 =?us-ascii?Q?01H93efPnhP16iZpl8t/eKDAnye9zOD8KDQmRah5zUSIRgq8/zMFkThrvCJx?=
 =?us-ascii?Q?ywGJ4K866uANfwdqAHLqrJkarqlDZUeehJRH7uolU1mRiTK2PqmwB+57sV/8?=
 =?us-ascii?Q?8QzLsm2pzELm0oeQY0E0cVX0YDFOTH+/X1AtL+N3xbim+urx2RYuGUECNNgs?=
 =?us-ascii?Q?tkBBky11NPjJpHN37aWzYfL511EjnPu9AirpsV6WiG1/l6AAetxALb4aVTwc?=
 =?us-ascii?Q?xCOmBtJYECkvUQ0LyxECVFAu29mYYXvpTdP3jh0Kk8PEo2uU7F128vMv3W6X?=
 =?us-ascii?Q?Mh+D6LK+qm8bVr6hA1UYv8QzEsUYH8wB+dCjlwYwO9+uBLT6iGbBdJsDfRiM?=
 =?us-ascii?Q?06k6JC5IEkKCNGWf+IHBN/fWMDQaf4QAuJ22EMjhfe1oRaE/GKpQriorJmoi?=
 =?us-ascii?Q?Zvi3HcXwLD1NwCEriHa9bgctaKY1ZJcjzeKIi6Qa9Xlpaa0jNEPvnfzJ9Gq0?=
 =?us-ascii?Q?dK3vf5sVxUZv0ivpB5DLsAS+QRR6L4KwuuMh/xJIKkgisaup3B8MZD0TJi6f?=
 =?us-ascii?Q?QEnPZrrOy8PkTjudAl5O0RInlr3+mOP7xQqvHsEJ149C2OMc4GNsTocu3Dtl?=
 =?us-ascii?Q?I1ayai418DnB/OPiLCl7evqwV1D+8LjCUJiLEWR2QnhhzylFE2AhOcQ8Gfq3?=
 =?us-ascii?Q?+0wLTNIxqUM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z+HP4lOiIuXvqHrLpVd9GEnYQunr7pv/VUZ0zRjCYLgW8TB/0BdVc7w+PckC?=
 =?us-ascii?Q?WM/LvifId1BjPazIO6sGZ8LytBkcTrFzfQwhA3SuDbaACXhGghNgP1whEyOR?=
 =?us-ascii?Q?2ZrOV73lXwarBX705+WJ63TepFxc0wmFEDFxCkGW2jMGZUrBV7/hHYxM1UBM?=
 =?us-ascii?Q?UuB+A3P5cK3hqudHfawm2sk9QsIEeslRuAz++/uJ7+5SP3xfYtPV/UUC2+Pd?=
 =?us-ascii?Q?1VAvh3g/qG8nDQDEEGnuzFovTWagln/3fNKrPjNNICj/NBIEuVs0e2xgK4h5?=
 =?us-ascii?Q?7xoUDongrwup0dopcLWWGfxQ2KYHQxDPBIfCCbJFt6kxSG+sRsWfVE/Zrly7?=
 =?us-ascii?Q?FAk883DaltovmKe7vSsmjsM020dRpf6DRmMiaXSUgmp0/7aDVmv3XcdX11G+?=
 =?us-ascii?Q?2kBob8o0vqQkSHqxhgUUxsE6K5xuJCwF6tkBpcXRRJvZ2tbnZKDkDe6NvJP/?=
 =?us-ascii?Q?eMCt12rUvN+7JuM2FLr8u6RTyqXymyLq4hxFjjQ0EIzRwwfxYPLqWH/3MU8p?=
 =?us-ascii?Q?RtDdFD082mW977gBJT6t1IKITpz5jjd6zsuaN+XQDOB+Ab1Ts/hf1M8/XJDH?=
 =?us-ascii?Q?Y/p8UfysVabkb+5zrq8GMM1gzMpI0WSvM2HrNXPuktFSfgWNu7xVhljkv3Ed?=
 =?us-ascii?Q?uWQ57yrvilHIYk04F7dFWmqHkW9eqH/BL3S+lCYa5St2IXoxwm3koduwuba8?=
 =?us-ascii?Q?CZsgsQr+q6bLUOPM+h1YEs8k44yQg4PItCxO4e6usDQNInkxCbzZlwCgefvN?=
 =?us-ascii?Q?VYlxQRcgOlsStEyThQtM77UzbshFfCNfP63jCJrBtRfi3p/3X/aF9yrxCTe9?=
 =?us-ascii?Q?iUhpeC6RYiYejDR1mKrRSaLvaGdaFVh5te/CsvIr0EfjeQCYvSzJvUh4ESbO?=
 =?us-ascii?Q?t7JCFC6kSYkXHkkJCi2LofkrhLuhNBJyXk0HFxDhFMNUQDYz7KCznRZFK/CY?=
 =?us-ascii?Q?6I2HcEyaKRPXBk7LdpMqdxInvyo6TR8DjVYgJ70AV70eAduR9zdKjSHCMNbT?=
 =?us-ascii?Q?jD5DtKeuRIINKPAlRSHCp5Uk+OII2gZ2as+kuPXAam5zPUXVq145vkvwji7l?=
 =?us-ascii?Q?Hu3FXwZoNdajanDwl3x1II9yrlAl+yQyzQ91KcADLZ+9fyRrXmjdq0RDMUlK?=
 =?us-ascii?Q?L7D6xBsI31yWIlmHxfbvpnqNTJK1m2NVeSA5rdCCCRoEGeLl8WzLElHJbd+I?=
 =?us-ascii?Q?89q0ROSibK7coITWYVzdrFI1iHPURbJyI0Uh68dr6M0D6HHowOd4OnfOqPVP?=
 =?us-ascii?Q?AZdlbIy/zqFXnkTjy8aIaef0C2Ae/Ru22dU8g4ZMVIPyru/vQn8geohMiUen?=
 =?us-ascii?Q?kE88h+TbiNPpCCVcPfmN/gbWroYIJLGeh8qxXJ4rsFCgMhzGunASDfQdmGjw?=
 =?us-ascii?Q?zJtBijhxlRr2G/BfiejApgmXo6aVf/NABqaT1xZ9s3bS7xLpeSagY4U1ZtT4?=
 =?us-ascii?Q?iGcEyJkUx0VmMn11p3FT+wUnfKL6sjOgit8eMoP2k/oM8645JpAU89OSfX1J?=
 =?us-ascii?Q?Hg79jBKrpioqwqNRUAZuSnJkAYEjoJVp9QQGGB7Lt9xTwDhFKJ8xPV/ELQ5g?=
 =?us-ascii?Q?lvaMmDiPHv+v0B2G5Xp9VXD/3AL0KWxOYLAME611ndXufZxd7R9IgnWNmrdq?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IMfJroAnnVrSnE6kwZtnodxBeltKxavBWXUhe0+xs6yHNpy/3lplWagI96ze+OpXvvURRqJm8WaYGm2wl9aYaPqTlK52/LiPAObz44CKAPBm4w31OQVHG0S8nFi5fyTipiCo2oCKCXHsjYXnlnPyaRZ+SyWAlAY7uDzTT8S+VVe+RNvRQwp4iX9oEKXFSIi7sBsZfMnpfzwH2VtgCyOMN+rh91Jg5PdKC2REDMfynzSd0E2AriBlZenQNWvB7W8TSLgAgGFW+mAsXUDSdNlUhQ/8UZEHhz/sR5emhq9qHRbhM6BjXyju+DiABTWAEgIHqnGI8GaVT7AjxFyPjdI7Fa/yFon/j6cN0DqaubZAhtQxxkrMjr/0vRcEjDEWEndIjG5yau8F3NJH/G/eyexhCG+1nNaeFq9fdeXoLNsWSwHkqVDillTvqyIJiYoU0/YzrYS/2rwzNeVywhI18W6KS33947102DqX/+Q6ytvpfBP8XFdjPiOWVDg8uSaRopDYpxXCIdOLuOcKjhR5s4CuhnYvW07HW5sJnHCHLv6ewrI5E8xl/tVnxx8T1hIPdtYzEqwV/9clOvB6t7g1Sniz3XZaLCX5Ww8iPWBHJ7hj43s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69738479-5dd4-41a1-7174-08dddc7789af
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 03:46:52.6907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qZVuC7JxDX0/gXrjIJ0HbeD2in/zvnLQxc2Hl+54aZGkgg+mTIJr3Z6zeONe/HboIDzJf+3l7e8kTAg1KaNt6Xw1C3B0T1B0+deOck8/fro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5892
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508160034
X-Proofpoint-GUID: lt5b8g6fC_rwm29c6uxQc7dvXpyCbBSt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzNCBTYWx0ZWRfX0PqZ/ur6U54y
 +HHxS62H4iQZH+0FQT7C6Mkd6biQc8A9C+718vonLlxEAw9aXnQfQpqlKYZVygX6jvefy+cncA2
 uC6kxYXAu0wjSNJ1NPOiNYhbtqCyAc7pNBEwULhY08YFvHyVyBk4ey7WUuGiXolKuUMoQ+pELpp
 JhDSkCYTzWqHZ7ccNOf1QnDUO7IqHxiRaqbae6RjR6Iqy2HSrdTELWqDAEVF23XmOVDSp7FI/Cb
 7z6EyQOb4qeGGY24k/gco0QiFN3lqhAehh9cRmqygG5fyOlbHBL5xCZr3NX5klAJCoGogzH0QHx
 riFgWv/6JGzm5huy9lhzOCDBtQoR7t8tET7wzkarEj1BACrPC6vN60EIZGnyHg47EQj16SEZbGo
 u/y5y7k1afuNHIWCOwyRMnfAh2yP+b5JHzk5T0UBbCEdcbPCzbFaWp1GLcHeDMJyJcI14qY+
X-Proofpoint-ORIG-GUID: lt5b8g6fC_rwm29c6uxQc7dvXpyCbBSt
X-Authority-Analysis: v=2.4 cv=HKzDFptv c=1 sm=1 tr=0 ts=689fff30 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=1vgPQKVssIXUClFPdlUA:9

Consolidate all versioning related code into dt_version.c and
dt_version.h, as a first step to refactoring how versioning info
is managed in the DTrace code base.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build        |  1 +
 libdtrace/dt_impl.h    | 47 ++++++++-------------
 libdtrace/dt_open.c    | 19 ---------
 libdtrace/dt_subr.c    | 80 -----------------------------------
 libdtrace/dt_version.c | 93 ++++++++++++++++++++++++++++++++++++++++
 libdtrace/dt_version.h | 96 ++++++++++++++++++++++++++++--------------
 6 files changed, 176 insertions(+), 160 deletions(-)
 create mode 100644 libdtrace/dt_version.c

diff --git a/libdtrace/Build b/libdtrace/Build
index b0862ffa0..164023bbc 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -69,6 +69,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_strtab.c \
 			  dt_subr.c \
 			  dt_symtab.c \
+			  dt_version.c \
 			  dt_work.c \
 			  dt_xlator.c
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 1220b211b..7d8e4432a 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -264,8 +264,6 @@ typedef struct dt_percpu_drops {
  */
 #define DT_MAX_NSPECS 16		/* sanity upper bound on speculations */
 
-typedef uint32_t dt_version_t;		/* encoded version (see below) */
-
 struct dtrace_hdl {
 	const dtrace_vector_t *dt_vector; /* library vector, if vectored open */
 	void *dt_varg;	/* vector argument, if vectored open */
@@ -657,6 +655,23 @@ enum {
 	EDT_PRINT,		/* missing or corrupt print() record */
 };
 
+/*
+ * Stability definitions
+ *
+ * These #defines are used in the tables of identifiers below to fill in the
+ * attribute fields associated with each identifier.  The DT_ATTR_* macros are
+ * a convenience to permit more concise declarations of common attributes such
+ * as Stable/Stable/Common.
+ *
+ * Refer to the Solaris Dynamic Tracing Guide Stability chapter respectively
+ * for an explanation of these DTrace features and their values.
+ */
+#define DT_ATTR_STABCMN { DTRACE_STABILITY_STABLE, \
+	DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON }
+
+#define DT_ATTR_EVOLCMN { DTRACE_STABILITY_EVOLVING, \
+	DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON }
+
 /*
  * Interfaces for parsing and comparing DTrace attribute tuples, which describe
  * stability and architectural binding information.
@@ -666,31 +681,6 @@ extern dtrace_attribute_t dt_attr_max(dtrace_attribute_t, dtrace_attribute_t);
 extern char *dt_attr_str(dtrace_attribute_t, char *, size_t);
 extern int dt_attr_cmp(dtrace_attribute_t, dtrace_attribute_t);
 
-/*
- * Interfaces for parsing and handling DTrace version strings.  Version binding
- * is a feature of the D compiler that is handled completely independently of
- * the DTrace kernel infrastructure, so the definitions are here in libdtrace.
- * Version strings are compiled into an encoded uint32_t which can be compared
- * using C comparison operators.  Version definitions are found in dt_open.c.
- */
-#define	DT_VERSION_STRMAX	16	/* enough for "255.4095.4095\0" */
-#define	DT_VERSION_MAJMAX	0xFF	/* maximum major version number */
-#define	DT_VERSION_MINMAX	0xFFF	/* maximum minor version number */
-#define	DT_VERSION_MICMAX	0xFFF	/* maximum micro version number */
-
-#define	DT_VERSION_NUMBER(M, m, u) \
-	((((M) & 0xFF) << 24) | (((m) & 0xFFF) << 12) | ((u) & 0xFFF))
-
-#define	DT_VERSION_MAJOR(v)	(((v) & 0xFF000000) >> 24)
-#define	DT_VERSION_MINOR(v)	(((v) & 0x00FFF000) >> 12)
-#define	DT_VERSION_MICRO(v)	((v) & 0x00000FFF)
-
-extern char *dt_version_num2str(dt_version_t, char *, size_t);
-extern int dt_version_str2num(const char *, dt_version_t *);
-extern int dt_version_defined(dt_version_t);
-
-extern int dt_str2kver(const char *, dt_version_t *);
-
 extern uint32_t dt_gen_hval(const char *, uint32_t, size_t);
 
 /*
@@ -828,9 +818,6 @@ extern const dtrace_attribute_t _dtrace_typattr; /* type ref attributes */
 extern const dtrace_attribute_t _dtrace_prvattr; /* provider attributes */
 extern const dtrace_pattr_t _dtrace_prvdesc;	 /* provider attribute bundle */
 
-extern const dt_version_t _dtrace_versions[];	 /* array of valid versions */
-extern const char *const _dtrace_version;	 /* current version string */
-
 extern int _dtrace_strbuckets;		/* number of hash buckets for strings */
 extern uint_t _dtrace_stkindent;	/* default indent for stack/ustack */
 extern uint_t _dtrace_pidbuckets;	/* number of hash buckets for pids */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index c67c33f47..509f263d0 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -44,25 +44,6 @@
 
 #include <dt_git_version.h>
 
-const dt_version_t _dtrace_versions[] = {
-	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */
-	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */
-	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */
-	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */
-	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */
-	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */
-	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */
-	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */
-	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */
-	DT_VERS_1_6,	/* D API 1.6 */
-	DT_VERS_1_6_1,	/* D API 1.6.1 */
-	DT_VERS_1_6_2,	/* D API 1.6.2 */
-	DT_VERS_1_6_3,	/* D API 1.6.3 */
-	DT_VERS_1_6_4,	/* D API 1.6.4 */
-	DT_VERS_2_0,	/* D API 2.0 */
-	0
-};
-
 /*
  * Table of global identifiers.  This is used to populate the global identifier
  * hash when a new dtrace client open occurs.  For more info see dt_ident.h.
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index d5dca1648..40b66c7d6 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -369,58 +369,6 @@ dt_attr_str(dtrace_attribute_t a, char *buf, size_t len)
 	return buf;
 }
 
-char *
-dt_version_num2str(dt_version_t v, char *buf, size_t len)
-{
-	uint_t M = DT_VERSION_MAJOR(v);
-	uint_t m = DT_VERSION_MINOR(v);
-	uint_t u = DT_VERSION_MICRO(v);
-
-	if (u == 0)
-		snprintf(buf, len, "%u.%u", M, m);
-	else
-		snprintf(buf, len, "%u.%u.%u", M, m, u);
-
-	return buf;
-}
-
-int
-dt_version_str2num(const char *s, dt_version_t *vp)
-{
-	int i = 0, n[3] = { 0, 0, 0 };
-	char c;
-
-	while ((c = *s++) != '\0') {
-		if (isdigit(c))
-			n[i] = n[i] * 10 + c - '0';
-		else if (c != '.' || i++ >= sizeof(n) / sizeof(n[0]) - 1)
-			return -1;
-	}
-
-	if (n[0] > DT_VERSION_MAJMAX ||
-	    n[1] > DT_VERSION_MINMAX ||
-	    n[2] > DT_VERSION_MICMAX)
-		return -1;
-
-	if (vp != NULL)
-		*vp = DT_VERSION_NUMBER(n[0], n[1], n[2]);
-
-	return 0;
-}
-
-int
-dt_version_defined(dt_version_t v)
-{
-	int i;
-
-	for (i = 0; _dtrace_versions[i] != 0; i++) {
-		if (_dtrace_versions[i] == v)
-			return 1;
-	}
-
-	return 0;
-}
-
 char *
 dt_cpp_add_arg(dtrace_hdl_t *dtp, const char *str)
 {
@@ -949,34 +897,6 @@ dtrace_uaddr2str(dtrace_hdl_t *dtp, pid_t pid, uint64_t addr, char *str,
 	return dt_string2str(c, str, nbytes);
 }
 
-/*
- * The function converts string representation of kernel version
- * into the dt_version_t type.
- */
-int
-dt_str2kver(const char *kverstr, dt_version_t *vp)
-{
-	int		kv1, kv2, kv3;
-	int		rval;
-
-	rval = sscanf(kverstr, "%d.%d.%d", &kv1, &kv2, &kv3);
-
-	switch (rval) {
-	case 2:
-		kv3 = 0;
-		break;
-	case 3:
-		break;
-	default:
-		return -1;
-	}
-
-	if (vp)
-		*vp = DT_VERSION_NUMBER(kv1, kv2, kv3);
-
-	return 0;
-}
-
 /*
  * Compute a 32-bit hash value for a memory block of given size.
  */
diff --git a/libdtrace/dt_version.c b/libdtrace/dt_version.c
new file mode 100644
index 000000000..e9ac88bea
--- /dev/null
+++ b/libdtrace/dt_version.c
@@ -0,0 +1,93 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include <stdio.h>
+#include <ctype.h>
+
+#include <dt_impl.h>
+
+const dt_version_t _dtrace_versions[] = DTRACE_VERSIONS;
+
+char *
+dt_version_num2str(dt_version_t v, char *buf, size_t len)
+{
+	uint_t	M = DT_VERSION_MAJOR(v);
+	uint_t	m = DT_VERSION_MINOR(v);
+	uint_t	u = DT_VERSION_MICRO(v);
+
+	if (u == 0)
+		snprintf(buf, len, "%u.%u", M, m);
+	else
+		snprintf(buf, len, "%u.%u.%u", M, m, u);
+
+	return buf;
+}
+
+int
+dt_version_str2num(const char *s, dt_version_t *vp)
+{
+	int	i = 0, n[3] = { 0, 0, 0 };
+	char	c;
+
+	while ((c = *s++) != '\0') {
+		if (isdigit(c))
+			n[i] = n[i] * 10 + c - '0';
+		else if (c != '.' || i++ >= ARRAY_SIZE(n) - 1)
+			return -1;
+	}
+
+	if (n[0] > DT_VERSION_MAJMAX ||
+	    n[1] > DT_VERSION_MINMAX ||
+	    n[2] > DT_VERSION_MICMAX)
+		return -1;
+
+	if (vp != NULL)
+		*vp = DT_VERSION_NUMBER(n[0], n[1], n[2]);
+
+	return 0;
+}
+
+int
+dt_version_defined(dt_version_t v)
+{
+	int	i;
+
+	for (i = 0; i < ARRAY_SIZE(_dtrace_versions); i++) {
+		if (_dtrace_versions[i] == v)
+			return 1;
+	}
+
+	return 0;
+}
+
+/*
+ * Convert a string representation of a kernel version string into the
+ * a dt_version_t value.
+ */
+int
+dt_str2kver(const char *kverstr, dt_version_t *vp)
+{
+	int	kv1, kv2, kv3;
+	int	rval;
+
+	rval = sscanf(kverstr, "%d.%d.%d", &kv1, &kv2, &kv3);
+
+	switch (rval) {
+	case 2:
+		kv3 = 0;
+		break;
+	case 3:
+		break;
+	default:
+		return -1;
+	}
+
+	if (vp)
+		*vp = DT_VERSION_NUMBER(kv1, kv2, kv3);
+
+	return 0;
+}
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 290945874..8dd252b08 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -14,24 +14,6 @@ extern "C" {
 
 #include <dt_ident.h>
 
-/*
- * Stability definitions
- *
- * These #defines are used in the tables of identifiers below to fill in the
- * attribute fields associated with each identifier.  The DT_ATTR_* macros are
- * a convenience to permit more concise declarations of common attributes such
- * as Stable/Stable/Common.
- *
- * Refer to the Solaris Dynamic Tracing Guide Stability chapter respectively
- * for an explanation of these DTrace features and their values.
- */
-#define DT_ATTR_STABCMN { DTRACE_STABILITY_STABLE, \
-	DTRACE_STABILITY_STABLE, DTRACE_CLASS_COMMON }
-
-#define DT_ATTR_EVOLCMN { DTRACE_STABILITY_EVOLVING, \
-	DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON \
-}
-
 /*
  * Versioning definitions
  *
@@ -45,9 +27,11 @@ extern "C" {
  * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
  * explanation of these DTrace features and their values.
  *
- * You must update DT_VERS_LATEST and DT_VERS_STRING when adding a new version,
- * and then add the new version to the _dtrace_versions[] array declared in
- * dt_open.c..
+ * When adding a new version:
+ *  - Add a new DT_VERS_* macro
+ *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
+ *  - Set DT_VERS_LATEST to the new DT_VERS_*
+ *  - Update DT_VERS_STRING to reflect the new version
  *
  * NOTE: Although the DTrace versioning scheme supports the labeling and
  *       introduction of incompatible changes (e.g. dropping an interface in a
@@ -56,16 +40,18 @@ extern "C" {
  *       we ever need to provide divergent interfaces, this will need work.
  *
  * The version number should be increased for every customer visible release
- * of Solaris. The major number should be incremented when a fundamental
- * change has been made that would affect all consumers, and would reflect
- * sweeping changes to DTrace or the D language. The minor number should be
- * incremented when a change is introduced that could break scripts that had
- * previously worked; for example, adding a new built-in variable could break
- * a script which was already using that identifier. The micro number should
- * be changed when introducing functionality changes or major bug fixes that
- * do not affect backward compatibility -- this is merely to make capabilities
- * easily determined from the version number. Minor bugs do not require any
- * modification to the version number.
+ * of DTrace.
+ *  - The major number should be incremented when a fundamental change has been
+ *    made that would affect all consumers, and would reflect sweeping changes
+ *    to DTrace or the D language.
+ *  - The minor number should be incremented when a change is introduced that
+ *    could break scripts that had previously worked; for example, adding a new
+ *    built-in variable could break a script which was already using that
+ *    identifier.
+ *  - The micro number should be changed when introducing functionality changes
+ *    or major bug fixes that do not affect backward compatibility -- this is
+ *    merely to make capabilities easily determined from the version number.
+ *    Minor bugs do not require any modification to the version number.
  */
 #define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
 #define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
@@ -84,9 +70,57 @@ extern "C" {
 #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
 #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
 
+#define DTRACE_VERSIONS	{ \
+	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
+	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
+	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
+	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
+	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
+	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
+	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
+	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
+	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
+	DT_VERS_1_6,	/* D API 1.6 */ \
+	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
+	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
+	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
+	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
+	DT_VERS_2_0,	/* D API 2.0 */ \
+}
+
 #define	DT_VERS_LATEST	DT_VERS_2_0_1
 #define	DT_VERS_STRING	"Oracle D 2.0"
 
+/*
+ * Interfaces for parsing and handling DTrace version strings.  Version binding
+ * is a feature of the D compiler that is handled completely independently of
+ * the DTrace kernel infrastructure, so the definitions are here in libdtrace.
+ * Version strings are compiled into an encoded uint32_t which can be compared
+ * using C comparison operators.
+ */
+#define	DT_VERSION_STRMAX	16	/* enough for "255.4095.4095\0" */
+#define	DT_VERSION_MAJMAX	0xFF	/* maximum major version number */
+#define	DT_VERSION_MINMAX	0xFFF	/* maximum minor version number */
+#define	DT_VERSION_MICMAX	0xFFF	/* maximum micro version number */
+
+#define	DT_VERSION_NUMBER(M, m, u) \
+	((((M) & 0xFF) << 24) | (((m) & 0xFFF) << 12) | ((u) & 0xFFF))
+
+#define	DT_VERSION_MAJOR(v)	(((v) & 0xFF000000) >> 24)
+#define	DT_VERSION_MINOR(v)	(((v) & 0x00FFF000) >> 12)
+#define	DT_VERSION_MICRO(v)	((v) & 0x00000FFF)
+
+typedef uint32_t dt_version_t;
+
+extern const dt_version_t _dtrace_versions[];
+extern const char *const _dtrace_version;
+
+extern char *dt_version_num2str(dt_version_t, char *, size_t);
+extern int dt_version_str2num(const char *, dt_version_t *);
+extern int dt_version_defined(dt_version_t);
+
+extern int dt_str2kver(const char *, dt_version_t *);
+
 #ifdef  __cplusplus
 }
 #endif
-- 
2.45.2

