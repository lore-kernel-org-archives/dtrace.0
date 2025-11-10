Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7255241C8C
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788486; cv=fail; b=XW7zsEa+Vrff5w92rako+/AiuFajKCJ6HdpEPhc0Ml60a+aj/YWBXqHJDoIEXZg9qzA8HtOvqZoszrCmJrp+Kn3WJlQMXTpwRh0yQEfAK6GnfuZgFs4mgmxWVDvuQgFSb8LSybGCcO2jeXnbtQsTo80jpkfJaikhrM1A5X4fYPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788486; c=relaxed/simple;
	bh=a51xUhk4PdXzXcAkRXIUx3kojf9vf0Zq4zPSYJoeVDo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=scQUhUL5ur/C/j7SfnuGDyWuBfvqyvYQEYR7DVOP4lDypI1obuwLcIrZGaPy6tC0Ynx+DSMv5twxw5cor8VWr2kk8WcD4kLQTe+72L4HO+wnrkZLBlwk1Zw4N2/M1G/V+HnSPq+29mjMew+r4J3ye5Z6fcWAZYYi7+KlqX+Abd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AZ2m1NYZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dWeGdexA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AZ2m1NYZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dWeGdexA"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAEgBEL030179
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=3+w4UKvQQOjz5lGVsAG8iK2A/Oz0f7/JXkaCuHiyerE=; b=
	AZ2m1NYZtkAJ6hEKt/4Bfn62LyJ+Kp6blT4fv3elbQYS276hI6kqlGifME2dHXjr
	J7KO8TtVZna5qaIK+sW4oxPXvzRtPgiqyvuW84shO5mk3iagn/8EsNmbnm/LNpDp
	gQtF4xVR5DcJUE/Be1dCojWiFZY6u1KXABIrE+2LTyIax6I//MxQn2zxIMJUVnRR
	D9D5ERS1eSiCMCzl8ifljn9sjsevSqU4cagjc/e5DXM4DjyrWe5IGxJW0MB131op
	vAC2mgH95R7Hp4gvKC5l+/3DJ0EhjzK6syZKIj1+B/BSKZTz/vZXcATrq1YpMzux
	kK4EXow+UKmyFM/s1hypxQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4abhjx86nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AAEHEwH007578
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:02 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a9va8t96x-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 10 Nov 2025 15:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEw7JvHW7MhXh1TaickMKV6UYi42iuQ7qfdP239dqloQlENYG1BsPlDfW1ieX7StrtIdX5p4kcqwLQqPlot7c8AdYpyYoTTOhuVuZSZush7/AkpbHuIMC5MPMSLJiJbJnMduY1MCFNGZB83qNLjlrQ97xEppvcP6rfjSE37+6kFq1srcNzoEDeFjRtUvuf2aX69zMtqQwdbkis6YhZCkKy7QsfWxRCczf3Fy8eOwE2iYRLdGNS7U1NpZX3O+JrDBDReodd2VW/QHRQXItym7KAOC9ybuPO759D7H3Qvq6Xfd94n65tckec5kL9fHqhyguvsyFi+fTdzFpbJzotwSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+w4UKvQQOjz5lGVsAG8iK2A/Oz0f7/JXkaCuHiyerE=;
 b=J5j1U+VqDNcRpnEDBD4vbaMIwFzzSoGrPdvROPmPb7QeaA4L3wBYT1N1GpNbZ90eG+ZChebBoG2CfkisIZ+K8VWwbpZDyZIJtECbKIXJENiGLeJBEbdWEKq71ScZLfx90R+5xnvhL1uuXLFZpTjVkljXjWvOwmYgzd5kcjqixl1Dq2y7RUB1oNTJ1mkuzdQACatimovde3jki+dExM1UQl1wLjQeWpcNvsppRQqP36KjDHrEGy6TJOJ07KiBIgMETsCp8QtQhow0EtJMSeOqRybfsacAYw9ndTmiwwfB3bpwr2q08NbJO9ICIMZZW9vsR9vbvmpT7vsK/JuZaAw9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+w4UKvQQOjz5lGVsAG8iK2A/Oz0f7/JXkaCuHiyerE=;
 b=dWeGdexAEsRXQcq7hQ7H5+dCfA9hdKx7vRCk1GJ35GoFFpcqKK+qSOmvqQudzztvmuQzv4eE+lHRYf3J0z4RDs/7Mx5OUDwxK1A/nFa2k/FhXB2y6zSKERO2ANO3dX71DFIb3ukkawXoNFW14/XL2ql8vSHVYwqFfGYKWbUo86U=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:27:58 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 15:27:58 +0000
Date: Mon, 10 Nov 2025 10:27:56 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] test: fix tst.depth.sh to use proper trigger
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB3987726AB973C7AE7CB6D4BDC2CEA@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SJ0PR10MB5672:EE_
X-MS-Office365-Filtering-Correlation-Id: 4955c451-759f-48be-ac66-08de206dba37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Cj3lKYjAdaOFHKBQL5BV63nJMy32xf81ioFz8NC+Yl8X+JxEx4fB4lWwbE4?=
 =?us-ascii?Q?p1+Z3+4wSa9SffkQqXvWCcMCJavB6+WChLCbaBYW0Rd5TNbdTxhGrhNDF2aX?=
 =?us-ascii?Q?0a8IWUaW0/LxTxUFA4duc9Bn0JBs9zaRm5hSmNVQQpWoGoHTa2szSmCjP/Sj?=
 =?us-ascii?Q?Ef1OwXRqWAqSiLfxRPKyTZBJRYXfHs8FXhuYnQR6uzwdWtIwiMsGGIvQHCkA?=
 =?us-ascii?Q?xtKD4rgGJcgGWPhqySiCySHHzioYzzjU7cUkt2Fvrvxu/x9yrJuGOBry9Ec6?=
 =?us-ascii?Q?9f/tFV1KZFx4tYJhFWAgaCXnrelLAnFS/jvgnOjIlRTMTvYwgRmS5CJAfi0c?=
 =?us-ascii?Q?9aqg3lbFxu4GbJcr81lq0VNn+SKviiB7Lb6V2nLSwK0RxHIgzG1wQsA2Upax?=
 =?us-ascii?Q?a1Krj0lykhQ7HJ1riXFB0e+pW0Y1xO3a7JDz9cXKvCMTqpYL9s+8m4cGrBNt?=
 =?us-ascii?Q?IljV9BRBNh7fqbstgWw8Mis+WeQj2+KWpAbgA5O2IKgyntR4QNRPLz6YLs4f?=
 =?us-ascii?Q?m99FpDgR3uI7AGJ8nUjaFOIlhHJ1ITj81uqsiU1gSTBt6jPkuf7P6I1Asbyj?=
 =?us-ascii?Q?8YKCUBX24C+6xm/I5vXYCBT8Rvs1aU/KTOOhz+UBu8+g+1TDa30+l/ikmUe8?=
 =?us-ascii?Q?3wzQat5Wzh4Azn4Z5182JFlghW0VQhxpBF+5Uynzv2MirmSZs0hY1c55Sii1?=
 =?us-ascii?Q?Hj+hdztst5GmsuxmEU/Pp95vzM5s/NrNMD3CExPKm0kZ0ClCwr4MQE8p15+B?=
 =?us-ascii?Q?KU/2KZ4RhVO/5pxrtI7nhisvh+s+XYWvFnmV7prRwYDEQ8TLbQOI7rj8evK7?=
 =?us-ascii?Q?AZryxphWtsh/NKncjczWiEFdi5s1E27+iOL0GDXMkvmWiXjqHI+KvI6mDK1r?=
 =?us-ascii?Q?bWW5sfOdeVgl2vHn/X7rHZhHYPWPJIdrpTn2mPLrHcpX+99kmygErKD+zbEI?=
 =?us-ascii?Q?SsxdnSQwJD3S6NbUsQUiwy9j/Ce0HO+iykrHj8nR0BATTTQghMiG4kokRwZc?=
 =?us-ascii?Q?fSBejSU2vnQHNGUivlUHPutQlTkKgcaJjWVuBmSSaZNkLaBX6nhJ5VyFkmMe?=
 =?us-ascii?Q?bbpdi3Gown96+ZQ1tmj/bF8AypQnDz5NhTFUUvw69JG+tA5YshJ3CpCz0lKp?=
 =?us-ascii?Q?ATJGXTutsbzbd/iu8JpZEqHLiGl7fhiP+gnm6oMDaPFhxMLt8QDDwq3MYaae?=
 =?us-ascii?Q?WCEt1v7+SMKJu6CsyOBx2wQb73tRp722qqgQwTYimqG9AJ3u9YPDrFZJIK+6?=
 =?us-ascii?Q?ZFsHpyIsLeFW4H1f+t96krEQdizqb31wf2GZZM1GxFDL0sS3uKQfh54s03p9?=
 =?us-ascii?Q?841onogNCubF+8c/f2+dFjbbwZgHevI4SczVFAAJhX8fMXcNDT1cKnx+zwtt?=
 =?us-ascii?Q?ldK1JiTherFSyHUuh65/ojgA6dFqQAb8Stt12cXC72Ba0psnijCLDgjz+ZDK?=
 =?us-ascii?Q?bGbz0KZia4oQy2uyf1KVQ4DmhKks4W5L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0WBBffeuO6NCpVcSSAhPXVDy7ib40F6nWc0WWPl9P9jPTzcirlq5PPIeO1gK?=
 =?us-ascii?Q?OfqDSmL+x8E+3jrpTfqBfje/rWfXmFWGvR9Lyh9osd+aHYaZy0TaPTcbVLqo?=
 =?us-ascii?Q?qVsxbadI1WMs9vJPXT7Og8Dx0Cj5xq0nGf3VnVAtRwVWodD7ssVnXSX8kQHo?=
 =?us-ascii?Q?MbtgCyUiDB9JaS96bsYQ/x6hQe4KkSiDoonBbPVr9OVqu2MZHL62RCWPOZa4?=
 =?us-ascii?Q?g8ZvKKuBHCTxGQ41HZHk4EJy3hZxiabrXp3BKbjf7+dop3jmYQ4bJKSS5NIJ?=
 =?us-ascii?Q?BUMbT2v2RcOabP5FDc4V5GNk7yYlYwetUo46+lCRQEjm6zA+EzAty5fpnfV9?=
 =?us-ascii?Q?KU/MeJw9vCnVEOI0CjrG0wCZUPMxVeJIk2RtLhhHfLkrQbROO8jFERrwBNDj?=
 =?us-ascii?Q?Ryl4GjUjTHOylEkPUfBhbb3ZXFqyE6d4B0zxdJSis9F6rtVY9qZS0gkSM0tr?=
 =?us-ascii?Q?cU66PM/NioyFVKXddnaLAHlquIqHwOtupoXlZmxfrJXWpqbxMbRRxT8U43ew?=
 =?us-ascii?Q?f9YzjYYBnd0CF0n3xc7ERhzja0RFFEUKDiqqaQ0I6+IYivbVs/HHkQkRR9Og?=
 =?us-ascii?Q?1YK/kqIBKE03K4cufc1SbK7lAGiTDEQfBSdnyFhkw9LcHGodN+lXN0HReaGc?=
 =?us-ascii?Q?nTNqFhggUJuo9nkuOH29grEbY9HSNikF7o87Q/ko7eYw/UjImZ8HwpirNR0e?=
 =?us-ascii?Q?gSyjAW1vb+D18TEqWl+oKQGzl6E/g+jpeWu+L+75zRqgl2wsVp3JhTfHo7iN?=
 =?us-ascii?Q?kp6KXW1UIbdknOXWUAd7QUYPiHaJU05bQG362OoPVcKwXw+1f7uymECorZUP?=
 =?us-ascii?Q?ezyrY14b+MVsc95hj+GVCEZrsRl4uiepuJi1yXgcnmNNovEt513kpD34DP75?=
 =?us-ascii?Q?2Jn2nekl0brRB4r/MwUb346E+swGAFn3v86ss0nPoybAi1uxEoVidcr5Q0M8?=
 =?us-ascii?Q?8fa2tIWmxMm7E5SgJx70gzADCiqFazaSkSGE6LYCwsMwszBnArI+x4ogIO71?=
 =?us-ascii?Q?D17Ndim6cRkhv9vz/YXMHTnGEYSXRVBGSbhW9NkH1+wXiAjs7QS4osyqMc/r?=
 =?us-ascii?Q?KrkYXe2VuM0AFCY31LMWlC2esI3CREwaz4RUo/PK2if9YcycyoXNcXvYOmVM?=
 =?us-ascii?Q?6UD32epMjj0VSB3P10iTOU8MzfBr2VfKX985lFlWFk5TXBmDE3oLaZaR6JzT?=
 =?us-ascii?Q?t8XOmlXboF88opBsVZ7e+gBS/iE6GzkfMAaOvoYdonArcxOf74daa2NG0lIC?=
 =?us-ascii?Q?QUqpBQLxDZXgPZFPH7KkJn5OIGJoNbYiYLCFawiSQnc+e9eKfMK1wnrnG0yo?=
 =?us-ascii?Q?+GzvZxOGwDVj6U3+tFYToa6abqW/uPxSQPebiuTMHra639PPx6o9XpAUxpcS?=
 =?us-ascii?Q?ZT3un1o/Z9zpuE7O6UQ/6ZC8uSYK3ps7OwCBco0YmWN8a+wPOT6qkgOavPTo?=
 =?us-ascii?Q?zf+/Ltiapkey9kiRaAcksFED518c3HXrVx2u2ZvVUKu7QH4QVxftcJN4DKk9?=
 =?us-ascii?Q?T/wG5ZDrzbkjYKRQa3+iNrfbv3gbVVQIlU6AQPaizmoQ01bYKXsEbwxK/whG?=
 =?us-ascii?Q?gSN+tzFadtwqqljo/TFwf38hNjHAMuSjGWsuiTDJRXQCm05tMNLwLN7WJsex?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3yOQpCcZxXP4u6MgcI3bgQrr8BOA/pDlGEHa2BWEY3uhraonMBdl4vutJRZZgvDrU3Ahg0EOqaaNgbtlT7L/oCQujMM8f1wi7CHGrIvbJr17JDdDpR2598CLcJBrzrGJ6PCu00Ir7n2BZr17C4rTNpoGVwSQlXc1ON0ZxFXFob7GBZ0pbnqMw8y7G/2gHnieFM6qAxKpOpDxrKypVvD/2W6XU/gpRQiLaJF0g/5Wnc+lMM7Rpkf0RIhxaK1wMWfza7ge4LmLH4YuJqD9zHhOuL90xMaUF/uHMs/n8dFo4rfzg7EO+ROwHbQ+Udn425bJ/ztL21HnySvlW5jcxyTcuB16Q0+mD64TtBiy+KstJ9GMrFi4h/bylIlb3xeDVHw7VsLasGgXollDH3S681EAryyJuCSvVbEG/FRSbk9bvRzVeYOMBlMl8AuL3u44rSb6LuDbrVUAbLsSmt32iM5PR5q/Tt47M0SKN7U7CF2DJOXlDkTstkF82o3K3zsnV8Odt5VkKx7EbCCMi87jCqU2cml9WORXcgo1szSHioRP2NUN6+WdyyQrD1jupk0H23gm8l3xx/k9b+TXuF52GeOJR7qM4Sq6A/87Ksj2pTN5Y6A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4955c451-759f-48be-ac66-08de206dba37
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:27:58.1686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FminFPdyaa6hUOSw858tYIqMN/RK5HFqeWm956u773AHh97OE90dIp9N8+GpwQWYOd+4/it494oj976mm9dckGJFGVkKQBgATDUpEIF2ZBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5672
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511100132
X-Proofpoint-ORIG-GUID: 33DNQYXVp4LcLIBERvBSJLHzz3Q73S8C
X-Authority-Analysis: v=2.4 cv=JfuxbEKV c=1 sm=1 tr=0 ts=69120483 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=z9BLAHLh2dIjcKMl2NAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEyMyBTYWx0ZWRfX7XxAex2CGjRo
 fdDGI6fg3AWKNxgLOomI8GAJ3Z1i7FDJAM7pP6rVPKsjdtWHtvOggB6iFrKqlTW1Y8iWYwp7Jrt
 RBdLCIFZUdFq6rDH4pH3UuhhsEi7iyPvgVEkKEYF5OIrMI8HX1sAG8i2j88lUA3+wNaQMbR/JcZ
 9CjvEsx1BCDq4WZgap3z0zzZsKjY5gtZzokgvI6GLk4d6DUQij0KUhWI+PFKwWNSe4Ie9LKmMB4
 qFyhf7wHjLqnjK8Pc0bnijnFRIslyF6M7l/SXbP6f1//7c4NxVzhgO4+Cyms8eZzL+DQZTS5tGG
 s6Ly2CPObIVcU4JZAo8nAxRlhlok24l5P83qSUccatNmWc2YkAoRMOhj2afT28t3LjjzyFR5CqI
 rkCLMe4oxhTR4e1zpx4PEXvbcej2lQ==
X-Proofpoint-GUID: 33DNQYXVp4LcLIBERvBSJLHzz3Q73S8C

The test used 'date' as its trigger but that caused the test to XFAIL
for the wrong reason: date does not have symbols and therefore dtrace
failed to enable probes for it.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/ustack/tst.depth.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
index dec16a3a..977d1b42 100755
--- a/test/unittest/ustack/tst.depth.sh
+++ b/test/unittest/ustack/tst.depth.sh
@@ -16,7 +16,7 @@ dtrace=$1
 
 rm -f $file
 
-$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
+$dtrace $dt_flags -o $file -c test/triggers/delaydie -s /dev/stdin <<EOF
 
 	#pragma D option quiet
 	#pragma D option bufsize=1M
@@ -45,7 +45,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
 EOF
 
 status=$?
-if [ "$status" -ne 0 ]; then
+if [ $status -ne 0 ]; then
 	echo $tst: dtrace failed
 	rm -f $file
 	exit $status
@@ -78,8 +78,8 @@ EOF
 
 status=$?
 
-count=`wc -l $file | cut -f1 -do`
-if [ "$count" -lt 1000 ]; then
+count=`wc -l $file | cut -f1 -d' '`
+if [ $count -lt 1000 ]; then
 	echo $tst: output was too short
 	status=1
 fi
-- 
2.43.5

