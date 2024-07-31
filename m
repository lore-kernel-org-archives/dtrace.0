Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304DC1396
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722452528; cv=fail; b=kMJRa+ERirwd+hDKgVdT7hCpTXJraTr7p00Aegp9WQMviPm3HFSgOm9ssk4Zhyc4lCcnnRINc8YUzBgoagUMc4bAoP+vs39RoajC/F7fBSTIz5qmvFnjPIgZ8Yzyd0CsmIkbC6OCp3HNdyArvED6Xesz7LUBqgRhQ+MySj8cwzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722452528; c=relaxed/simple;
	bh=oXgB8o3bQx7+4YqgFwFSHf3eD8wJmi6lNOqvrpYLplI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=WVTXNVo38H+eM+TKx+LXoT/AHwj55EY8aY+Kc71W04RE33NC6F60EK2+UVs5/WHpt+UmBvryKrHkeqqHlKQ8b2KV5omwEJzaxUqTzLGKFpzzn5pVX+MiRzWPFLejm5ijSGCwTvLkm2Ow8bH/atJo/n+kwoRwqW+2xEn6rVnUaPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aRn7HqW3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jgIIey8i; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aRn7HqW3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jgIIey8i"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtVrg020480
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=wMO30L5KxCgQCUFvDHTWyjLRIwoKes5f8rla65VBBX4=; b=
	aRn7HqW3+f5S2hVBua/vhI5baIbZA1dXlhrtB/g+b8z+5zfsliUIv8YpIgfxHkfH
	TVurAZ1ygnWHWymOigTN2+ceu3HDFwk02Mr9s6eVlNzqUsqyvZlSf0yGAHfuk+KA
	SeZ6HPUEbtoslUi7bpEfPgPh9EiY/AQh3BxJdPRMkAE6aEpZQA3ne61qqtde+ejQ
	Nej5ZZLiTAg4+gCiI/KRT8OTkKDzLNpCgGKkVj5sQlb5LDorsT1cQVcNneJQ/uUN
	njXYNjCbeJxxaEHqMoHj9w0DKydGRDsIrja7pWWbnOW5y7EEFVlpWl3ErOcSAaMG
	rg8Fs4X5fgwV6hNSs0QK6Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqfyg46a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VIl773030804
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:04 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40nehuur65-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WswLLRmW/lJJpSqHTSTMBJyGbZ1Vaq86QfVys7G8QRToetjBYXtJ2iyUPWWQtI+PhuaArtQs5s+fwHp5bDRMwK9ZGCYTVMMhcb9K6E6CwI1/0O/YKro4QBPgpcX00pVWhSvZ3dIvulAVd9r9+SlVC2daBhwMlgR8uML8esubJ/DkfuQERABotT4CuGIrj3cFG5fIFnxZgqGXQg2iX8Aekl+w2NWIboYq/JyTsRxW6ZXDn4vPrErYVGjmAu0Rfg82jiR+W4Gt0qOlUOe3vu3pgAoT1lhNgX2pfDDXQdHGkBUn+TuwAEB34g+lX4hKl09qhouDRgqEv57aPfHSuRYvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMO30L5KxCgQCUFvDHTWyjLRIwoKes5f8rla65VBBX4=;
 b=yXJGQm0OYCrfFCqjNA5lIx+Klmwp9ONOb/QRQibyFn1c7QYWfsL3PBwCkjbJDviAwszdKLFU5uoJW5FNTOhi14R4uQSSrs5LieL1E7ohsth5FRH1nyl9U00A4qOkkGhjpEBUu1NdYUx4bXGFoel92BxxQwtpJYTXjTRBvDwDcLTJgaVcTZLZLBsAhBukA/dShGpWmO7kMb1XDiCEiA5UjesM5eH0aCmH3GnfMVIxM8jVFm/7uXVK+cdiqO70vvTzXZDnTXU1ae/PlEoJU7CQsS3+E/wLv6G/WEzbzc/sVI2bdriKNq7c5PUDo2ImWPySgCTZDzSJcID5rU9NoanJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMO30L5KxCgQCUFvDHTWyjLRIwoKes5f8rla65VBBX4=;
 b=jgIIey8icq06otZtxaZPqNgN+nNwPvAdHqOYG6LaYwaonVTq3fdjxHvSOf8hGB0jVMSf5vwaDFTGdx7q+UKbiUf8Qy6wDkMj8wqS+rzrVytbpVTTDmG6fbNlqSCckfU148MGQIMC6zLZUeAkHVw5/4mW44uy49sStdHZxRwGIvY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM3PR10MB7911.namprd10.prod.outlook.com (2603:10b6:0:1e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 19:01:58 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 19:01:58 +0000
Date: Wed, 31 Jul 2024 15:01:56 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: remove unnecessary dependency on /proc/kallmodsyms
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0296.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287DC372A5DEF4375CAE9E6C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM3PR10MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f3b663-e56e-460c-1a45-08dcb19340c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T3QXmLAfMWOfThEhcbMhEnyAfyZ9QdxIepySdy05qbgIowYmdlM8caMVSYlh?=
 =?us-ascii?Q?QLox7O/n3mN7U25x33rtV1+XHupy9fnTFqyr8MVdYAkPNFKT9JCKDSW4Uzkm?=
 =?us-ascii?Q?rbLNczCZ5/Wlx0tAxkGPm+lYnbsBdehVkYqt1MylwTSjGohj6pifVfEnJx+6?=
 =?us-ascii?Q?PSQd5WBTYjp+7Uji7v3DxNBW9gRVErd/pL7ZIBqo3RnOmHjlMSvSQ5rU21fj?=
 =?us-ascii?Q?ZjHvCUdGBMy2u4kAJxmkcFeLujbuR7E5U1uFKNY8Zwz5Cqu2TwxWdb+S5XQm?=
 =?us-ascii?Q?cmiRNdP6gna80LESA5Yf4PRD+mCbSR2ym3DdPOzAeTcswBPVqVcQ5N5sjIbv?=
 =?us-ascii?Q?OZPnLE0IXsh115Em4vtl8SUdpIqecjCA7Mae5Px0cxcOtPCgVlGHhRHSmbm0?=
 =?us-ascii?Q?HEMyEN3LUVe3+ZysJddG6HMlntUbV9b6hPLG4SePAm1Cxqg9D3LDFbLdz/ux?=
 =?us-ascii?Q?wMKEt60X4sXZdAieHFVIIgv4/x6qYxk2aePN6Y9qnapXub+tGzmUgFFn/Kpj?=
 =?us-ascii?Q?MONJSutcRsqu8yiYmFyreGaRaSIaSFIm8e7b0PjZIczjIqRe5F1Ui+VdKkYh?=
 =?us-ascii?Q?S9bq45pzqokXeiUaKYdR3ESJEP7qhHMojyw8aAEjbtoDt1FQ/Y5/7dv4qWcW?=
 =?us-ascii?Q?s++G/IKg+YOcD1qu8LnWIa7/Bk4sr5CIONuwlVngmjlVrUO8AN1xVY+C8eAo?=
 =?us-ascii?Q?9NW2gXj057HukMz+DkqFUPBrh8TTCELgTNRd58vMA2G/wuEVMCkvcrsW4uIM?=
 =?us-ascii?Q?79TaUq2qzUuCoRsmjuLmYvCl2EwULbvJ3o6AAturQ5geWcXBUD5rl/EcotSY?=
 =?us-ascii?Q?1jkux0GuLwpN0uh0go3EZt3Cexb71QlibtpMrSbcS3A09H7zduAqTdtaNO3E?=
 =?us-ascii?Q?y9WKgay1SCvQLC8WIL4DfA+QOU8wqJms3tFJbH/SdB5QkpgOgVygIHDWw6aM?=
 =?us-ascii?Q?q+T9c3U2UknszZXdshaTbFqdFjIm3IjKnNsT/KuSf/XTje6hzHSQPAE+uhWb?=
 =?us-ascii?Q?s0vVUk0YPsNzg1ejbW0EzoxNDYNgDJUgnI1dEgS8h6EEhfWZtfqgMl3aSdjs?=
 =?us-ascii?Q?x4jbbuHIHNODXKwaVqXBDnlnqHY9Q0n1Sbuu+jw5jQsyH5ek82Cb4JEJyrbi?=
 =?us-ascii?Q?L+lyslMuDGrUFUyRpNRhbs0khoTC+5vopFPaXz2y3WyKmUTeftcIN00Ztlu/?=
 =?us-ascii?Q?b+WTSksdUNbC1Hv/Dr87YcEtmn5GV8LaT6/XGGK2rO0MDn81kA3z9pew1WRG?=
 =?us-ascii?Q?KRQ/5HUNWQfeBINqyeXboGdFD0RdgyWguIAct+7T06Y+27bP5HtjBjJEf1xl?=
 =?us-ascii?Q?5d1ubW/v7RQrTWe972+111KiVP+UwA2Xq1xDcaCF7r7j/JlV628PX9UEAtcO?=
 =?us-ascii?Q?yX4euNc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9i/8AWbvuspPEH5t1GB5HVx+6Sg7B0XstLPXZ+hPALCEv1ZNjgRDHbG0D+je?=
 =?us-ascii?Q?wJxgESUBprWsEkT84x1+7mqiQqGIGdQN/86S1fyDYOlXrQqEs6wEpc8WkAhL?=
 =?us-ascii?Q?/PP4a76EV2n9kvutUfQ8nKmLhGT2q9qV7MOZt4ZbedeUonk9szBMTnI+o4Ld?=
 =?us-ascii?Q?Pdp55EvDv3YLyifJppiw6HxRezcSj5mEGQk/VMooPnzDC/huTEPQCk0IAwIG?=
 =?us-ascii?Q?Bq8/DCpda234YPL6aEGThtO71mXFlpUX7qiL//60risrvquekv710RML4vsa?=
 =?us-ascii?Q?VEi04xAVh94fjF+s/r2iSQL6yYvsQrWcfD7W/Q84+bINjuopz0YT8dZKQZLT?=
 =?us-ascii?Q?B1HWZyb1LvxdeoUrxMLDizBH1F/XA6sp1rH1XQq2H8unrhWdjPRrPK8x9Aal?=
 =?us-ascii?Q?de4MJh/pLWoOO6Ayo66p1OAk3CXYIYmeVTGfc4wyuOEh/m6MxiCqz4c1r0WI?=
 =?us-ascii?Q?CuL7slbCx3Srvfppq7ptHjnZDyO+qgBoiX+RO/jbokugRuT1/MlMYvpaNBo3?=
 =?us-ascii?Q?/uZL8H7GSKu2Au+Qth1S12xcj0ZfNRh2X30lyAZ7JFWIcykmKfXteZ+9mcVz?=
 =?us-ascii?Q?M96VL1Nnr3677Fej+KJfISRUVwP8N9bz4PDRq9D6x2jVA1gHY8OfsMheJLu+?=
 =?us-ascii?Q?MFCaeOrbN/Er9ee0sySvEmnbgDv1WUlKOBDMiVyPC0eMbrxUDaEExBt++tqI?=
 =?us-ascii?Q?+HPtP1vJigiMSXlZ1wVe6LZZA0o6dE8FNi6AIYuOQRmulhuiEVBrv5nZElHn?=
 =?us-ascii?Q?Gb0yBGwRFYNamg24Qvyz5yngP5ve8EQb1uUnwMueeot/rcI4GTahYxWIEoog?=
 =?us-ascii?Q?BjF/payjsupI9FUPzcz9nq/Qn2ezq/gg7F6qUZvqjSu05ZLZtewA+s7cRDFk?=
 =?us-ascii?Q?8jCN7dlHmTFDkO4BYpLpN1ohK8y8QS5zFeWny5tRJkOJ2yVrd70yQLtcWSzw?=
 =?us-ascii?Q?uh3GIZuoPTdw9XMrsM+xnoQFDD0LW8QwomyQDm60IdKmM0Lx+rENR4/0Uace?=
 =?us-ascii?Q?3dLIdjqnvoJZNtAVxzAWt0oTcOfNZ/R2P0guQP+/PxBp/QuqzXfaux8eNJyD?=
 =?us-ascii?Q?iNcp+LhPWhqPHfEEcqBzR4VzTgcRKXE/RQUvEsWmbtgbAFiL84RMT+XHX78z?=
 =?us-ascii?Q?JxFYnJZ0HfQDx2O5C1z9Vpgjoau4BAqqxvvIJR/0wz+ngV4GwML3QIsKw/wx?=
 =?us-ascii?Q?+MHuhbukhddhY5Nxhbruz27eQHh+S7t8ZF6Y/YuvT9aI+pakIu37TTDmfRXJ?=
 =?us-ascii?Q?dh8zNikfNYKEnwaRuC6U/23lYIEoCeInPmvTzN/RZRhaXn6Xym9EOieroHhQ?=
 =?us-ascii?Q?j+Iu1XFkrud/7K7cImzey86UuGWb7WP2THR04LbHln3VWkNQBNnuj2lzB0ps?=
 =?us-ascii?Q?RX7dcyoESgzJ2l1vc1wIK+E6Q2TuDimsPLEI/QEfLMu1lFhGOG5+a8ZAFLJX?=
 =?us-ascii?Q?fKXuqijDK7pZBA5MfDbjboDJvMfA0xrMElltwWe+iFkslfurMk0A17OaNo/E?=
 =?us-ascii?Q?Z0bspC0CLrk2vq4oG14OLLgLdQyswoOjzjt0GhxoZ6L6T0JFYItyG5WEqUWe?=
 =?us-ascii?Q?+xMBTUJtwFd/t3ZGnyKoLfHqYFi4ppOOtnFxpzYAs94O7CIPoHsOTzk7ZR89?=
 =?us-ascii?Q?2Imhi30SFHl1vHkr4LdHWJE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xw0Ztos0e6gjXNVZmxXWCTE39Bn+ZJyLrkASmekawsGFYSHsQ1TjrZIOhf/3rHwl1k4gf+39mhTal46gXkLprEx5obuBLuuNLclbKFbJvq6sd/d8VrW3RsvupalhDZCQwH6VudEjWpLoFATF/SBmnbeaQtDjcYUuUB1zpps2CILoC5eOL+huDkgv/vwLVfooMVHSLTdMgLLCI3Tw3xR82PsZ/7LIJ5AXhBBBqbR+R6BKZcOBpAsEruEJKk0B0QjbufknQCGTDxDNeBIOdAnGA5SlTzZ3wyIz4XitIftHfIpDg/uJ3km40O+1Grc0iNsfuqYXZxKpJ6JJbRrXCKT6BKqUtMM/hh0M5QHf+egdzEmnceEm9j63XrzzbNYTEVkUQ2bZZkbvqk+RgtD0Gbm05WqFgHHiy3zCmisdo6mVZiHFnan/1Suwl6YBg6YUuggmULykmvfF8YGhU38ItUrnkAIF8asWt6s57KMBM4Tc7bwetAq50l0+qFPouDF1l0zuCW0Dq+BER3gJf7qw6GNb/J6opPKSPF1pSN2PwAI6RyvQraF+puK57SuZMrUbubW54TqZgu6FGlKz/hXY5FEAvMcloxCjjDa4ntptNgUl2L8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f3b663-e56e-460c-1a45-08dcb19340c4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:01:58.5241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I0bDF66/SpTeq/Sxos5aVa44MAlUMb9NrHVWiQ6QFALhFsABnrmKm1Cv1QeWhPeG1M2dbd9AZmcLpajfHBAg6ltMFM0h79862+KggLjEkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7911
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310133
X-Proofpoint-GUID: vKn1xZ20wovPoiZvcHTVH4ZgZ1oh7tKm
X-Proofpoint-ORIG-GUID: vKn1xZ20wovPoiZvcHTVH4ZgZ1oh7tKm

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/actions/symmod/tst.symmod.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/actions/symmod/tst.symmod.sh b/test/unittest/actions/symmod/tst.symmod.sh
index 340baf53..f34a538d 100755
--- a/test/unittest/actions/symmod/tst.symmod.sh
+++ b/test/unittest/actions/symmod/tst.symmod.sh
@@ -1,15 +1,15 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
 
 dtrace=$1
 
-# pick a test symbol from /proc/kallmodsyms
-read ADD NAM MOD <<< `awk '/ksys_write/ {print $1, $4, $5}' /proc/kallmodsyms`
+# pick a test symbol from /proc/kallsyms
+read ADD NAM MOD <<< `awk '/ ksys_write/ {print $1, $3, $4}' /proc/kallsyms`
 
 # a blank module means the module is vmlinux
 if [ x$MOD == x ]; then
-- 
2.45.2

