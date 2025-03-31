Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0C1DB12C
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457610; cv=fail; b=Ue7HfSi7CE+4z+kfFbdfCim1mN8Dqv3gpRhxyXWyLb4ARz1HZODHa/dBqPjRFdS6xIO9gsNpwtP5woI4EMLs6OAEmHpMV6gAcjTmAIG6Ae4SpOwWdoc23cvLVtOts8EB6QQFXiHQYZwPqWnciWnyS4VQ35oLq2mY3GlaUXQe1pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457610; c=relaxed/simple;
	bh=y2JkYbIrhmjBHgkUL5G8uzP3RPjSillBYWsYvdqI7i4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NJ3wrATi3mLJOzbdAeUcKnlXHvSsQdzKyqlHgefQLa40Bda0CfwTeW6NMoPtcgaDw+tpXpHU3SjLlFyXr8mvfW0WWGzVsefFMITSAYE74/a2GulhYKKFjeAUa3OgE0cDisNRLPs5KusFRyTd123BPcjeFR+D5cmgdpWaTkU1sCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L3yVASft; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ulgxfDy6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L3yVASft";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ulgxfDy6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VLCBbW015407
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=hFRWNzUzsLhVOLwv1AW8oeNx3NuqmeMsLnlFNSh9C+U=; b=
	L3yVASft+BeJFNZtF4YFNYvw57v4ePRDEYs1JnGJhCXttyWmYv8yiMOS94XpfIX3
	MTgr605zxLd3d46PLSYAEwvNNJRLB8Nw8m9YOOGMCsNYOfeSj406TWfAf02W9O+b
	gikkFPbumylZwPk58CugCYqOWRUthEaDKnDDV7SVS5ZWPpFOGWRnWYelKvYd/OUc
	LYpkw+KnrvQv/0Otd5IAPMqzmUhf3RCALBZ4+AqGEHMGBMVjLQtHACs88rCI6hB6
	Wo80XotBJjYdNujlF3yrOv0a09xkxOVJ4fWT+Nl8FUMcsvAxjMus2WxltonV2fOb
	WTUJp2vncw3vMFlsvmR3Vw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p79c46uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:46:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VJpQ6J002643
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:46:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8pce2a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:46:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRs1WXcKibofS5zPCWECYCUehw69BSOg7PfeUSDyUEzA8adNnvyvPNneyNcl//RPfTe/ruF2ilgPxGggMn1RvjHT8ndPWFmm/Jvax0j0P99iLvqPR2DTbAYeFgtti7srHvU4rSCS5BtfiWixCapvPZdyvB4AkEVR2GfiTHNo3STR7AzOdQXp+gsG5tpk9DvV/DVhtDdFjIdvH17iWCE1izuadae4uVXl6a0Zkrkbh9fIDwispk+jdMimF81LlJnaLgMpbhisALcxrGiWMfmCuaPqqQwwGsPWmHoNH5Y75fpU3NDdci/GhpevL6mFJqFU1A/NCVmgYSAYyfMW5Nb7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFRWNzUzsLhVOLwv1AW8oeNx3NuqmeMsLnlFNSh9C+U=;
 b=RYs8q2LGKLpOvxJDQ374zPKrDLnCdTRxsVM4dJQlSdltNdc5WOuHtAYMTJujqDUy+F829qu3PdlRRplDMhQo52R8YE7PLjMcBkm37wuLzx5ZEuxrBU9qE0J4cTJCcy02Y1N7rH99scipv063BhSk3h7VFkzLROktGmTF1PHRIAQvxQ2cMI+TstbfCqviHSEsYFbDC9gompRFgsCmiCK3WASLDwXMfskLcv26UePfF+OUyf9WKE8fHh0U3vVzp7Vcw4kDbwIWT+Vjp5NcUG2s3loyNF8P1YMFdQhSkBFXgk+v2JGrRLHguGunbOStKRq1mPJtBVhcI+9ba1eVA1/KxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFRWNzUzsLhVOLwv1AW8oeNx3NuqmeMsLnlFNSh9C+U=;
 b=ulgxfDy6m4ls82MegIT4iqqKHixEJ0Q5WnFqtC+cJhldZ96YmqWTMtwdMFxKE8MDLgrR8GQd48kwgTtfZgk+OWJT9xoxsk0A9Js9u6QnaT7fnmf+MqqCrIhRnTzKI8s6NZYtEi5JghlDEzPFW+aCikIwaYTDRx88rMZuUuBV56g=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB6537.namprd10.prod.outlook.com (2603:10b6:930:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 21:46:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 21:46:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] Clean up sched provider trampoline FIXMEs
Date: Mon, 31 Mar 2025 17:46:40 -0400
Message-Id: <20250331214640.24230-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAP220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9b6989-c81e-4bae-0837-08dd709d8733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q1U1zC8B69XPxRYQiB9U8+YJymv8KHBBJV4bz0WYMcMOQ1WEu2dPNMGS+a1q?=
 =?us-ascii?Q?17bIiga6cBtP7I8yFzztYdu8VeeGtpJPV09rFLBTb6Ga1igEz7pE/amTHK2U?=
 =?us-ascii?Q?YJpuDMOgh5i/sgw0TeCPAgdxqE4FwzVFs/rCsquneqBBSTFEc8ZkWItrgtga?=
 =?us-ascii?Q?yaFgmaM4a3Rf2F0ep+eFsF/ry/NBCMermgk/fuIW4TdqE+wu/U7citng2yds?=
 =?us-ascii?Q?ncMK+ri/V33NwZKDU0grPTvA0GKRjKSbsI02Vhmwjr5QjlvNuQW0C3Pllw9S?=
 =?us-ascii?Q?S7Zx6fGWZ8K0jAASGILOlDe/HP4UZ50o5wwue4/QwB6e1xvRBUounAS3L37d?=
 =?us-ascii?Q?oAh3Zq5HKgK2WaHAkaWd7VuCGdZulMPlqjFOBhX2ggoTPK23Bosb32qZpODc?=
 =?us-ascii?Q?kmySz9mjSY/c18Rt3nZ4gxTtqI6ROqYM+h1aNqQlkAZIRf3wpiSPHVulyboq?=
 =?us-ascii?Q?osxgOkOt1ZNytfr79RWgXLECUFtHB1ErPcU80ZKWhE3G3SOBrboF3lMZXUWb?=
 =?us-ascii?Q?aRpNUHfz8LOpemII516z9dkfdosSLln6KYLU4esLIj/p6uNfjw5xUJXjnESJ?=
 =?us-ascii?Q?wZXq4cCS/i7pvuuj9Ra/0CFgylULaYRn2ou5qE1Avlr8DOZRpXtOq1LLCPyI?=
 =?us-ascii?Q?E5YxvokgGendbmINzKOe82ggz95ZRQOwgLvXgWzN2PHJC5xtE+RXSflv/Xd+?=
 =?us-ascii?Q?rbqzrVymK+5hUxyH/itUgN4SZDMQI9aVjmt/LF2Z0nolp5dZTOyA/nEPyMRJ?=
 =?us-ascii?Q?8WQyiyqeqUZxIhR+cJz92nDVVuRz8Datu8S+5debNHy2vPuHDxqw2vkAgEZ2?=
 =?us-ascii?Q?U+BURujBungpLUyQlT/O7LDsGadroWUm8l0NenMNYxkAN8G7aRJq90DF1LEu?=
 =?us-ascii?Q?80ft8CkKY3aWWwqFUsSf7LUbRmfqwAhznzlyuNO/SfJsACJJJJzHAmGk+0Rq?=
 =?us-ascii?Q?URQ/BYlu3llBlY3eRivBumFM8vKhxSLiKge1kuaTNTcMDlDNWfcRfPw1xB6m?=
 =?us-ascii?Q?YZMQFwlVEynXNDPpyQrD4YBfT3nhhEXp8s+bn66a58sL4xD/vp+uk04KzXuj?=
 =?us-ascii?Q?CqvVNV2Uy4fx3gNPjSGDvSa+iBK6rFQU+NDeVEPV0yFiwJdxMYov05VOkvrZ?=
 =?us-ascii?Q?QA6FVJhOWh679Hkp3miyPkRvwRopOPPk0BwmYoVncAlP9YdkcfoUluXH7hY9?=
 =?us-ascii?Q?Vc74wYDj0YH8gE/NW9TEOexxqE4XWkPBmV6aYIwrK0ZcvBQC8VWGoKT/aCl4?=
 =?us-ascii?Q?w2JkzIZtGWdRzSd+KY8ZQ1JFzNz+3eoRFxEO7Mm2mPq7MA3hA0mGt04GWE8h?=
 =?us-ascii?Q?/mgKYAh3Yh/aIw9IuZF6/CJtKVzKIpzVWEvZfabx6zwJmmCD9UtEyfzgz1+T?=
 =?us-ascii?Q?C5ckMSLWyimw0YqPnHOvtH3uB5oH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3qlPrRARVMHib+dRIXP+c+4AsWV4xCLV5dUqIsYCdn/UIT4qo/Y2IT00owIq?=
 =?us-ascii?Q?vKm66QJm+iPFQYeuEpRmqNvrWm87iWij6ixMKY76s0hWf7W5idWNARvwp6Ld?=
 =?us-ascii?Q?BSpr3qQNKFlSkS9yefrs9pN6/33qBngkMfL8ycOUlMMplufOIIDkMvP9idDe?=
 =?us-ascii?Q?DGYukEMplmnF+DDOZbrgbcvoFrpOfjzIBEvLV5YaxqOCeT8/vpGFRDyDVib9?=
 =?us-ascii?Q?8j0aJPSWcBT8YgoMBfXBMSNq27g0yySgmP2yEt2V6JGtAM8qx1iqSLZrzgI1?=
 =?us-ascii?Q?HE6dqnr4pisuSW5jBmI5Kos24ud7hRt8ta8zoc6obkh1GNVF75DlEh4EnQNu?=
 =?us-ascii?Q?Z3Kcl1z8bqXvm1jtZFtn3H8e9aiQUTXN5jEvaLtZj5SeswoUB3rs1D23DJID?=
 =?us-ascii?Q?ceWu0Fgpk/BEQ00ZK2xXHuf27iI/fVVIAvk839vYZW0CIcBXV0rlysA8/m4D?=
 =?us-ascii?Q?IPskLTyOEsNquOTJi35IXThkvUaN1KyMwIcNTuhRful/gyD59/IVa0VktetW?=
 =?us-ascii?Q?MdUOkHsZPcXxYg4djqQCCJqHc9sKzJ0p1w2rgTXAw8u7cPBJF5vhZHlHpuDH?=
 =?us-ascii?Q?/EhKT+xoZ3OwV+wZLd9tHDFOGh6vkBEkE2gZpf4+xTgntpSQyEDvvh7aX6t3?=
 =?us-ascii?Q?E/U3P0Ft0OTATCD6WI9V06vxq9p5U3goMyuaS98u1cwwioF0rDz0m6cTZqLn?=
 =?us-ascii?Q?C19awygpL5WWDCJqX4r6fXuAXsohE7ovDaLYwhwUX5vLqgU9ecXjiicLWQME?=
 =?us-ascii?Q?q+LSTxNgAXPxbKeSYdylaqo1ttwSwgxfkTStWxhSCipaqUgn4ba4m1WHnS2Z?=
 =?us-ascii?Q?WMEIKgBazCz045goOK8rnDvxVB0BQT9X3bshpi68avO2sA4D37WexF3SlSJ8?=
 =?us-ascii?Q?7NnHi3uXU7kGqHeN1fsPHUCJ+A5KsHxfK/JagqpGNlLVjdfS3Gx8zl/D1iuZ?=
 =?us-ascii?Q?xaJUupZGrUX6lTaVzbN3rT1kaUwKDUoCKE5lrA4anlK2ELsWI6Zsyb1RsMg9?=
 =?us-ascii?Q?9Z3q6hyMkeLQNHWPOP/cL/DknZACdK/93B5oEiCbI0FTcke1xlkaB7GrnX5F?=
 =?us-ascii?Q?fs+Mq73j32C8PloGR8S6Li4dsGSJBveLfha+DIsMM4jGXEziQhUeB8xIBkH+?=
 =?us-ascii?Q?zAdM2i792HV2XZddWXDdndExRKQ+CYNBVZJkbDmzUwQj7KMcQg9nYnbkUr+T?=
 =?us-ascii?Q?x4kSvtCEUQFOBEFOhYuASXCZDc38CfGRyeBc0+XNVvu63DbyTrNywVUqwS2H?=
 =?us-ascii?Q?ZjTIj37fU86l1p0RGDMmA6n0kOehJeQCz8tkwZzNXqYwn/YqGN9bsl6rHSUo?=
 =?us-ascii?Q?/g7FJNMTJsLscV1ZTGdQnIaWgZie1jQCp61fumKLnV8aVfbdh9n63zmYji6q?=
 =?us-ascii?Q?SgHq7MS2UezspUs0HPGwkw9aJiOeaVmxeXQQhyf3cMl8ySTriLk7jcMGcn5/?=
 =?us-ascii?Q?Hda706hqgOL+6CW1YCzdeXQ/d0QN3nOZYud8jY18KTSAjYEIZEl/09a8yshE?=
 =?us-ascii?Q?QJCRMHfccR1XKZB3zKNUl4pSkidQF/QSb2SPnzeQPzeKPjJlhHxvJlBLth15?=
 =?us-ascii?Q?gMHkM2USOoAqieG/EE0PVV3e77HA0SkGJ8NwJHPW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SEFy/qFC1/kp9WBwBiJWB6MOWpQgTLnXBe4YyXI7eDJyvA7I0REoOCCVFTqRrfVeo79+mv9JdxIYUdtiBwZJC3KhGIS3Aa/1HtPzJTaAiqsj8v0teHvSm7eEoXSz2XH9T8HK6bnpefCa5+Rt2Dvpc4huNj1NemQjkcKt9WCZboq8H3NBwtw+ofIYCTbbXQNfieIsmSFLAkqbEivgRymgALnXeEYw+0Sd7G3hmQPQ5qyUT44LUBsk4zrJqs2CGi8/xupMgWMIzHKHWKVDDHJP40FLKTi+mMRSbwTBk15BUg97gA0jDeW98eTeBRBj1Gt94gfHHvJGzUvncF4PvUGQvwr4uYo9TU5Ifi3Y9XnfFBmAoKcAHjZ1fH90GUrDe3t3ULnry5233KWZ7MuzgHZRNXVILCYbUfPDD4UighKIDYZrCL5od1+M5kNVicZGdRB81jj0y16UOLBrrplkp23vrv2RE9yQiMBzvTPMBG7C5SxmzSUbQryc9KOasLTPIO3OEYLnndPAdCJgBf659s2BvDbQ5nrpyrB/YhOVoLdGUTx4hVhXfDgRtNtd6INB3kXVFFA3fnLF/CV0dFOyb/5AdkGD74HsaeF5/Zyfu+ycy1I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9b6989-c81e-4bae-0837-08dd709d8733
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:46:43.8105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YT5oDME50UBEmfaJNoMfudUH/CJDxBSm5XJd7+vt2T3vP2LfIPijqU8IoV7gno5JB5vqIlBhKiugg5wjBaPEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6537
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503310149
X-Proofpoint-GUID: nJobKJySV41JPWksdCr-MfAPK956jtdK
X-Proofpoint-ORIG-GUID: nJobKJySV41JPWksdCr-MfAPK956jtdK

From: Eugene Loh <eugene.loh@oracle.com>

The sched provider trampoline for enqueue and dequeue probes had
pending FIXMEs for providing a cpuinfo_t* for the cpu associated
with the run queue.  Implement the missing code.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
 test/unittest/sched/tst.enqueue.d |  1 -
 2 files changed, 60 insertions(+), 15 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 3a218f3cb..8b9bf4a70 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
 			       probe_args, probes);
 }
 
+/*
+ * Get a pointer to the cpuinfo_t structure for the CPU associated
+ * with the runqueue that is in arg0.
+ *
+ * Clobbers %r1 through %r5
+ * Stores pointer to cpuinfo_t struct in %r0
+ */
+static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
+{
+	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfos");
+
+	assert(idp != NULL);
+
+	/* Put the runqueue pointer from mst->arg0 into %r3. */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
+
+	/* Turn it into a pointer to its cpu member. */
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
+
+	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
+	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
+	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
+
+	/* Now look up the corresponding cpuinfo_t. */
+	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
+}
+
 /*
  * Generate a BPF trampoline for a SDT probe.
  *
@@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_probe_t	*prp = pcb->pcb_probe;
 
 	if (strcmp(prp->desc->prb, "dequeue") == 0) {
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 		/*
-		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
-		 *	  associated with the runqueue.
+		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
+		 */
+		get_cpuinfo(dtp, dlp, exitlbl);
+
+		/*
+		 * Copy arg1 into arg0.
 		 */
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
+
+		/* Store the cpuinfo_t* in %r0 into arg1. */
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
+		/*
+		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
+		 */
+		get_cpuinfo(dtp, dlp, exitlbl);
+
+		/*
+		 * Copy arg1 into arg0.
+		 */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
+
+		/* Store the cpuinfo_t* in %r0 into arg1. */
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
+
 /*
  * This is ugly but necessary...  enqueue_task() takes a flags argument and the
  * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
@@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
  * outside the kernel source tree.
  */
 #define ENQUEUE_HEAD	0x10
-
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
-		/*
-		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
-		 *	  associated with the runqueue.
-		 */
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
-
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
 		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
index f445ac843..28dcace8c 100644
--- a/test/unittest/sched/tst.enqueue.d
+++ b/test/unittest/sched/tst.enqueue.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 #pragma D option switchrate=100hz
 #pragma D option destructive
-- 
2.43.5

