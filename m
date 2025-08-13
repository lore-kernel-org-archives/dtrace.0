Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F6A20D4E9
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100660; cv=fail; b=K6zz7NVtqSfiZ/PGJx9hH6D6qwEiYV5chBPrrS3STxMCcvQTfMvVob8rXDGEr+lt2WTOAssZPJNIp0prSTEi7zDKv7qSTHogOjepklQUOh8IXREO3XK54+POkBC7Fl8LD9tNjs6NvW/YTcZ/s0yMryYYGNnVer9UMDUdTbxsF1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100660; c=relaxed/simple;
	bh=h8MsqspLX4Lr8v/f38XLT2RqdHsf/wMT0vjR3oQ4dT0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=hwgpb/eFPEqPpp8j9sYW8bupdcRRaFTbc34bpfTZwA/vRPNU/4t1lWGSqL0+ZmRxdb6gIk9FoXuZ4G2lOFNUK5vu8Eb5LHjWNfTrV+8MwDDvK+UCS7i6TYp9SMjKBQy1pp7nwviTt9DmiOqyGur67kK0OsfBOsJ+GPe5ppJ82t4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ENsit1F/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=u0qPKqde; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ENsit1F/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="u0qPKqde"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DDNB6E022954
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=KQQBXiPn7dSx0VlDLDCpXVPtRtGlaCSMyx50Tu8KKSI=; b=
	ENsit1F/3ewUPNZFqXeJ+YDh/A99Ifc417CLheCGl3H9EsNA5TMr/a5Exk8rzFIU
	3sq6zBs/oX6xrmX2L/RRzkkFHPjlnTpCf7VbbBmfZ4b/wh3y2gcCLMwayobfC0AX
	00gvNKO86nEr8nDRQ5c5ag8eiaNwWWIJPitOvezkFEKw+dku1rVCI/WTIxXrofAP
	ms4s3bRN1cvm1NQ37WPB+AZHT5DaArtKjZHCH1X2M/0cdeLOnIDAmvG+IOkHejEN
	OBgAQ/Ut4dOYYpEuIcpvs+fznloC1tGRoHh/li7f1CmVK4G+A92tIxVDgbNPf+T6
	rHoMLKWK+OS5mvi2pN3dBg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvrfyubv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DFiipM030057
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:33 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbkcw0-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8zJGCKEugn+TMs4HVAMTTs0vzFSu2yVdzCSRr02xh4wPgeP0rXAhkBYGQtrtwcR17JTgN12RTf+6BmVowvljWh0jSdyZ9VC4RIrNsOeNWIpjiNfUSEiS6RpExCvFUVNphOWHXVZUVswpoW1DsmH0ShP4kRM2YovUzLmVI2/P0Qq2sbrCT/I3xvSgYr9kUwm+ThLIjQNwkxa30vjVsiyQtuRBk52/hBvbD6Xz1EgdXWy+1VlhTk7s/k9+/Xf/ooVrJD3j8+zTpGks+uExiLHHW0OeQMm3KWj+Rh70oE4YUuXXBvpSZivlh3+UjEC0BBNRw+RUaxeYsmJvkb4UtSNOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQQBXiPn7dSx0VlDLDCpXVPtRtGlaCSMyx50Tu8KKSI=;
 b=s3SZXP0keC8OmmJLyqmKNOjwA2ulCMAzuyXKAGlI/nP3EStflZRVMhGaVwZWdVQGI8fZeLLzLq32jpd3K6ajmeNU3oN2SflHwUVQnwc5vwWwgOMpUy9mCEXnBNnLVrbIKZTTG9T73jCTxTuSQEcKWMXuuZiRAgrGJns2bGUcsJ4m4mMWfbfVuas3qGFluG62re+B3rRs3yMRakarnHKoijSWK4dKFnHKKPEgFghBbVow8Sjo8VqmAloZJjVnVBtGhr0MzJ14tGs9tZ7c8Wa/5sVQizE7RkMKnaykWvH+Vxu3p6cmg1+fUov6ZVsTqHkHrRelgtMDSArLc003JRLbhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQQBXiPn7dSx0VlDLDCpXVPtRtGlaCSMyx50Tu8KKSI=;
 b=u0qPKqdeNHn8xFqQmrpGKpO8jRDCOSJqE//6FK8+Xkr8EuXjrnDCv+HxGPaD8sF7ROJxtNCNUNtOl7P9AxxepCR81qBRI7ajSObYMmR10m0B2tqyVBcCfyC7EmYlGQPHnZxpq64J+RIhAKJmuUvIXMBzDJtZiAEplBNFdgegIuA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB6222.namprd10.prod.outlook.com (2603:10b6:8:c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Wed, 13 Aug
 2025 15:57:29 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 15:57:29 +0000
Date: Wed, 13 Aug 2025 11:57:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/5] test: improve test condition
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672EDF946CB1EFDE82D913FC22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e12a51-0f77-42ec-5b53-08ddda821b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L27XehVWMJJ2/sjYk790g8fWx57KknJ4aUvC8jnEmdSX+nvC3F7t6KpLNF8+?=
 =?us-ascii?Q?wjYtHn+u+wnU3ny73+SKQszf+HvCZsiIshv6QPOPLSBztmezOWZ57CbNz8Qw?=
 =?us-ascii?Q?xqkzO4k3iOL3g4kpFh25qjr4yabof8emm+xbTOE7r2HeiHEMQ4dBpR6vMYxM?=
 =?us-ascii?Q?eaWgpscrQQOBSpxidijnNLh2Rl33//uBtzWHYNGwJdgYXMUXX28z8QJsr6sR?=
 =?us-ascii?Q?CegBkrB0N8nPE4W5v2xNqodJss32T8De/0O/j1hKvkPNeIlYg/24fLJmuog1?=
 =?us-ascii?Q?mRsHnSDQ7CEd50q7CLQBVYC3pppveWmv84WAuEpPJUgPIJM690tr0KLYYMWi?=
 =?us-ascii?Q?Ha70SOttuoslw30vSjKvDVBNLu11f+KEmN4hymssXI3kVjmnPATucj/u14Qk?=
 =?us-ascii?Q?apXaV3mW6Z14KP9LnMDjiIo3Xm878dsV3IPp4Ci3vcc/qWSJtsiHderI8AWk?=
 =?us-ascii?Q?WCyu5TXtsDyzLvcgoRzD5ueFNyXCbEvKSEB4p2nCT/caSQCwxXyEWwfUhB+h?=
 =?us-ascii?Q?d6+G8yCuLI/VJEFoFTgpE6VMMXg7DBDvmL5pzljEb+6Mb6b2MgHPesPEB7sD?=
 =?us-ascii?Q?EeD0ioQfpZ4SC9UPWo7HvqdjGQcpTVIAKhjXev5traqE39Jbyugq56oZPup/?=
 =?us-ascii?Q?1FejoryL3AynZTpv9xbo3InMs8tCRaLm3hH3vJcj+9ZWnpc9pAUng+23iSgo?=
 =?us-ascii?Q?2kyjPcW4NX08ZZY75P3zPWZWRD5cq3OrIpBB4zKHzZT28Iy5TxsxuPHIQos+?=
 =?us-ascii?Q?kaJj1oY/acM4cT61Osizjb6ViwMLjOoxQGGijXAx5KMMccK0qjHV10aODDD8?=
 =?us-ascii?Q?eMw26fqVCG3I6/HdicxSDguuiV7oW7MtQrfYU8K02TrhqPJG0yaOwMH0uuA1?=
 =?us-ascii?Q?4IoBN6IbDf71Bxdu/HLwdiyjytjIyGBFmjWDTE96FSvQkYGTglZ/ejn1f3Dp?=
 =?us-ascii?Q?F4VgjTS+F0OOAINx5xSXyb+6BvUO6nJdbNkCA55px/Jt48nVbx55vMEy3rbZ?=
 =?us-ascii?Q?S5c1Z7hvooeW/g06Wz9rOr1SDgSzXPlYk8ruiPDd4JWbQF2kDxlGAV+AZFSL?=
 =?us-ascii?Q?SeLQM2ZNDfjvnl19KX3EvOXy55rHz7FGqqvjk0FL2b/yjfZt0FH3EWqG+HzM?=
 =?us-ascii?Q?26XY2UZ1ADxw5t7uDoH55+t+XSyjsxHzmYqA6j5dQR82vZgRwnN5wSK9SxYf?=
 =?us-ascii?Q?8GCLWaGa3ZhrxiUw9Rcn9Db6B8IJRDFYbeDmL22P8R7DwXaaLcupoflfdYD+?=
 =?us-ascii?Q?ULTkM/mGmRyj3LXuCugrP0QFpbS+Y5ixvjhBSzYpyzBnI3BQl4ZJ8C6UEpVo?=
 =?us-ascii?Q?A2PJKeUpckg21hWtIDlccaljNLxFh9Al1zGAWI6ZW/FwgrgUFx6zC2R8Oa58?=
 =?us-ascii?Q?mJIJGLAx5LAiWfuvB/hpJ10RSGSp6qhATPq0BB2OR4Ep03zvG7XzR2vwVDuq?=
 =?us-ascii?Q?l9TATozKLg0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q6OQucLjfGNyJ24XgY5nIHwtsdNap/TenbGQ/eCJJqRjEW2KaRs5KtI2zUsR?=
 =?us-ascii?Q?8zisPON9PlFucZMkrFA+vFAT/evTdDGh4otzI4Oen24ipT5f2Ne1a9z/SvOJ?=
 =?us-ascii?Q?t+rAnn/p32HFnJ37Hih+enmUs6Kav6XoqO+uaUez1m2JHdYMYovY8pq5xEU3?=
 =?us-ascii?Q?EfqJt5FNDz6/dA7fXSFO4XQQmo/UMc3rLxwzf+G+ckr4exfwd3rPz8GlF1Ir?=
 =?us-ascii?Q?s1R5nHI/xa7I76heSNYR4TlYccGbsGtyUp1vW/TqgjGXVTxo2h44rI+71JaZ?=
 =?us-ascii?Q?3bJleqIa1th5VDNk9EbuoCOacuYGJc3K07kCsjJugSTl7/Jc+L/Uaz/QPSR4?=
 =?us-ascii?Q?9HH5AnSVOMprfE5KAZcnom9GerZItDDFkbW6zZQWvRTyb8HZoxVj58AduTlp?=
 =?us-ascii?Q?MQzwIJqLtTQQpvJYcBWjlpD31+UYlBYAZvc7pY486PuntIRBRgQX5xyse6lN?=
 =?us-ascii?Q?W4Xy/GKgqea3wQsS6LUgsBaxEgnBKZQkO3Y4DAxuUM1nLIpJwBh+JD/AKH+j?=
 =?us-ascii?Q?KJrR09z8XES/dw45LOYsZaeXn8NiNmkvdlJq7edWny3TQGCCjj3jroYAH/X8?=
 =?us-ascii?Q?KunO5BRSaTxI/f6kudTtd9RqOhHtBqEb7+CH6u1oVzXosL2BuzcGO15S098v?=
 =?us-ascii?Q?R4lH4224xWYLeAjdFDwCu0F6SjD8rIXEb3G5psHY+K9VxBeadn/DY+YDAoT4?=
 =?us-ascii?Q?wYA03ORLOe0UaB1/ZxFpWzZYBlht6lZwf5E9nuzM2aTNKKLv4oOuEN/9A2i5?=
 =?us-ascii?Q?k2ewh4Kpz4VvSKofp10u86027Gaxg68m9vVnmwMMedq9YFxSVrndxyVpnjhW?=
 =?us-ascii?Q?xG+9nNCFv3M3tum47s+aYML58Y0my4g+HIUHcWoBxbYxDrS2N2BXKE8v+vg4?=
 =?us-ascii?Q?UdlaPJsXn3MBAE86HljnnR9Uf/UzlkLBlO6iuhbniwrTuSB2noJpe01truIp?=
 =?us-ascii?Q?KmUCGCe7n3nEJ7+q4J/UDQNZXy1jjV0vgzvlm4Aa1br1p+7s8ladbRF/AhTf?=
 =?us-ascii?Q?CVFIdkmd7eej5Ef4VXHWGD83Ev8B+DFN94TVAcSnpR5Lf410Ko/IrutA8B9d?=
 =?us-ascii?Q?ro/ynJIfA4tVPIeZtpOS/n4IZ+plHrY/37qj1gLaUSiBbsXJAx4XGDshi0GC?=
 =?us-ascii?Q?EGUvAh4Gx26e5MKRbccteYfTL2cBPeCBwRg4bppicpRYHz+hZSLIgnyD85K9?=
 =?us-ascii?Q?fYP0IqG3ssi64Onsd+SyL75Zvcz9zQ3C4gLM5xsCFkh2hOcOoDBp4ZML6oUc?=
 =?us-ascii?Q?epNPotZ8z6LxmRZI7rAikMLUZw0C4pPi7rIt1kBWTPTy2BcXC37t3mufWwTv?=
 =?us-ascii?Q?6HJYwO5UdQZA5ubn6GDugzTVWU2gMpR0PYXLMvivBHJ9YDnII8utNEoQwRrf?=
 =?us-ascii?Q?+4HK7j8JJNybLK3909cYiT/LI+LRvIJxAgNiD6AHg1nIBmORSTh5ILaWA34B?=
 =?us-ascii?Q?SMGpFlUU/1Um2sU5SNolS7B2MP8b+7/v92is4Ktl8olA7IGcvUQgtgwC2ITB?=
 =?us-ascii?Q?eTCHsqxh7u5Ity2xGT+49480rU6stvkkwQjii67HQxqcnIc8qSh3ahDZXlGE?=
 =?us-ascii?Q?Mtju4mG2+vTWcA3Ewm2GmBNjNUBamDRjgripldDcFrTtfSEVCEcX8vL8IAz3?=
 =?us-ascii?Q?Jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	na8Ql7OklDX+bIup8QupRmfqPp6ZMQSMLE2cv0nPVrAwnPVawsnm4/AYOkGT5cItw6XoFRYjt6lSsUmQBqZAMzjnpwR7KvrmsHBEKSm7fg1VX9EBUEGHEjSCNJV/CY3VAGdABykc+HHgHLXeyP8VvbFZ4NWQUMtIP1TJgzp9DjboVLT/MmhtSCQuv0mnRSSnv3sDs5N6LpQ2AriuA1qUptH3odm1VPuKFZLO7sS5dHUHvQlhw78zofowmpHjJI3Z8Z5TSrPViuatSXFtgk2RnwFpi/d5Cqam3TKR2tzkATN3hGxAfgRrmmLVUTAKwmy2fOgHwOAYKuCai50BeGqLvAKJJ12Glh3Z6MXjp7hKUoEjZ7sXx0Zlb8PSd/M8yr5Dqp79+TIN3jjdM+l62icXCVrRU+NpE36r9q2fAYLUuiYC0JLA8jM+z/kekpRq7RfweQLnadef9l64uvFPY38LilpAk/HL3pzds20x+XTuKQfnE4XqXP/8D4apqO2soch/SbIX2y6aYXZ7f40Qsm6N6+zDWhZGdUwH4NcrVyWkP6ua3G4Ayf4ISOXhNnJF4MTlQZztT5xHmY1Y2bOQKQodFy/vu2wnqvezAN0ZL+L9PYo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e12a51-0f77-42ec-5b53-08ddda821b4c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:57:29.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmQxluMObnSwq0CZPB/3HAGUGlhB492QHam0m97xH3X6DjdUcU+i6ZsNnCLN1upiaRrOZWtCgo4weeeFqSDbPI4Hy0NPL7BxQZ3NOXhV+KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6222
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=827 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508130149
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=689cb5ee cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=C5BR2KKnep-uD2HKllUA:9
X-Proofpoint-ORIG-GUID: nLsr_wTw3GEIapPUm8YOfsHoQodKLsB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE0OSBTYWx0ZWRfXwqxpP3s5mH9N
 eqip5HliJWoB9v7BEiWPW7GlDbaiS91MPE8IEqIkgQ6lz15GF5UuVw64LNHIngk/mmMkhL5zyND
 tJ9Tajt0AS48UfyezYclTjH6ZclT6+R3zid09pE4lcvPnDP3p1BbYS9Cy6lqL4JTncbdRPxiwU5
 +iS4/AVjK/lzvIkNw0pFF3c5Su75res2jlPcMbEaXxiFnLeM1Wc0PvrnQfwci2SI/6Px3QChyBo
 xiL0fNFhNs9t06Lu13exSSwilNT2iA4vyozf4Io0QfZPQVSi5TQtMvk5Ob7UDG+QZBqMhC7SgA2
 gH3XCKj6VgQ94eYIco8hBHjm9S2AQMMYD9BF17i+/PPTAh8nhBeHArpUt5TGmoILezODA/UQTMS
 DU/TV6CUNLHV9Aeh1Z/w1AtyJJ2Jnq9XKbtOAV6XxWm05EpRrf1rbI1TEFaZa5SrGGo9Uxdf
X-Proofpoint-GUID: nLsr_wTw3GEIapPUm8YOfsHoQodKLsB8

Test with content that could be interpreted as a string if the consumer
handles things wrong.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/actions/trace/tst.array.d | 10 +++++-----
 test/unittest/actions/trace/tst.array.r |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/test/unittest/actions/trace/tst.array.d b/test/unittest/actions/trace/tst.array.d
index 9e0c410f9..e74c155cf 100644
--- a/test/unittest/actions/trace/tst.array.d
+++ b/test/unittest/actions/trace/tst.array.d
@@ -6,7 +6,7 @@
  */
 
 /*
- * ASSERTION: The trace() action prints an array correctly.
+ * ASSERTION: The trace() action prints a non-char array correctly as raw bytes.
  *
  * SECTION: Actions and Subroutines/trace()
  */
@@ -15,10 +15,10 @@ short n[5];
 
 BEGIN
 {
-	n[0] = 0x1234;
-	n[1] = 0x5678;
-	n[2] = 0x0000;
-	n[3] = 0x8765;
+	n[0] = 0x7464;
+	n[1] = 0x6172;
+	n[2] = 0x6563;
+	n[3] = 0x1234;
 	n[4] = 0x4321;
 	trace(n);
 	exit(0);
diff --git a/test/unittest/actions/trace/tst.array.r b/test/unittest/actions/trace/tst.array.r
index 52ff28ecd..90c6a2236 100644
--- a/test/unittest/actions/trace/tst.array.r
+++ b/test/unittest/actions/trace/tst.array.r
@@ -1,7 +1,7 @@
                    FUNCTION:NAME
                           :BEGIN 
              0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f  0123456789abcdef
-         0: 34 12 78 56 00 00 65 87 21 43                    4.xV..e.!C
+         0: 64 74 72 61 63 65 34 12 21 43                    dtrace4.!C
 
 
 -- @@stderr --
-- 
2.45.2

