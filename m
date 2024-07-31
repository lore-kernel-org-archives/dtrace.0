Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBFA12B71
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722438234; cv=fail; b=HedEDnCtHuuhUwdm8SHOeVqyYwtEdqNkkZihUXk/8tPcYytHC6lknOlywvJ5wVimOm2tf8Pl0aQRUPimFyi3ZUOmwxpMIti343D/9GvsZmngjyzt/SCRjku9urfGhd7szYiZ8SnalOprd0/hZ1JGO08vgPslaqF1bCKqUYyFb3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722438234; c=relaxed/simple;
	bh=UmoIBeJ/N3yShTTomWXR7nv2ad3oWJ8aSLF66Tlt4p8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=LoLYf5mI7Bnxwc6Xzi/UPsoTtA485CBtMlyKrLuUNio4/y8PSCkCIp4VALwcKhqcjJiu2UE4WvsIp8pLw3QatQs35mhYsmIgU8sCyZGSx2aFxr9AuQG5W9SKBSPmBH/zest2mBO17kPNoz+ZaXlr7+i+BGtmpyMCNODkqfkcZkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=feQiiv+m; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aFUUM0wT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="feQiiv+m";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aFUUM0wT"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V7u5wk007741
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=sJ6OsdAL0N5g4ZmwQ2sn/QjQd1W5FFmzwIpmqputiUE=; b=
	feQiiv+mubxC08bo/o7uSA4gblNbaMrsCvPKdyoy4R7KbVoXlSfP2HT8UEyot7rY
	IStXxMVC36iEvdZ2tUaW6BxwiO+UkTw0tnYgtEAUnQc+wyFf8Z8OktqUMgcfOEwU
	L4gc2RLEYoTYXh+OUCs61CsGiuBpj8Y8d2lstZQDXRNRT/ebP/I1CdtYy6LUpy51
	Xk69NL9dFZo5Po7rlwc8GQySgi9OLoJIJDCrfsYlhUHPVB5+NnquUeU+0eGTGbiA
	PKglPkBxG5yMtKpk/5B3Buqoy1o8Lo/GrVyfo0ZwWOLVQTa2QV6me7QOl+BDfJJH
	LZWBU1pCy+3HE+oaP4QwvA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mqp1ynaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:03:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VEqj7D019062
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:03:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmsc7ns-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 15:03:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMVlcGijaDm7231zLwv3e9aj3s3hTmWydmCMudOGkPX+AhwV9pL1EYITEgn2Z/OAdU/q+FLpzT6o113qje2FIbb/yZxJ7Bv7OzYd3Dm0zGrj3Fnq0T255YtdhYcwfxtzPEyzAKGw/VOVwKzosmOg6hT8YGHBluDo4WHaq5VKniALYBUF8QeWc74SKEVfc8Z8W84TUbpHocRq8J9f5rnRonOC2f5YCyh/Kn+odjQWkeZ9bc+mbql//wDvX8Wj03G7jb6MFj6JscYTGEX7TWw0jMLj+4Z34gRTknH50RBaZY1fbuw95r+kmsoLtaa5STcK9Js2fCGrhVIJhOjMl5h8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJ6OsdAL0N5g4ZmwQ2sn/QjQd1W5FFmzwIpmqputiUE=;
 b=YJoYmI9QprqmsGJaqjhIQx1RcA26f+PyD2QvtHgPQEcNezhaOymV0RD3OWNwx6IqIdWzh0J7R59a6Y4LpwsoZP4IMlN5wZb/+31B+upJre0Y220fp9vORHybwHGi9HCdqY+8c3P7tWMKB0D1b/I7RtnPbM5+BGEfn0xnvxwf9rflQ+jId/d9AHmOEYr8Or71JQJyoN8DJuCbBTy1uRWpg6E6KkW40mW8+LpVRCd469h4BzJWIDzEXj35UMkDTM+spsy3xh3FB1gASw6ibfJzc5WHBi/kWBa1n2O6v4+TcSgBegZlYpdY2oMKRdo7SSlzoOYEdGC+bTqdOdFsNPGfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJ6OsdAL0N5g4ZmwQ2sn/QjQd1W5FFmzwIpmqputiUE=;
 b=aFUUM0wTGalJrrZx8yPHBeftjhzfUBtc3H6u3uWjolvAI0LyoCGpXCXeor1mIOix4wlmTqanFZ9tKw+LA7sLeK5i0zEPqiljV2ODp+pDEkYF7QhOkdDrei5954chKRFqhCeRGnfktcvnTMpW8RGXqMwWeZMXTt1Yyz55a+r61QE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BLAPR10MB5028.namprd10.prod.outlook.com (2603:10b6:208:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 15:03:34 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 15:03:32 +0000
Date: Wed, 31 Jul 2024 11:03:30 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test/triggers: ensure bogus-ioctl has a reasonable fd
 limit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:208:32b::24) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287EE29B21318FADD0A8DD1C2B12@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BLAPR10MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a42236-48bd-40f0-7959-08dcb171f17e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/LGIzM7d9+e7rBfGM/46NL47h9kMt/F3v5x8oizNa6+JEP2JtNBQnjQsJKAT?=
 =?us-ascii?Q?DucXqw8P+ybh56Zov4/CSjC294n6lx+r1liGbkNMTFBXlpZrAPEF83WJQ42s?=
 =?us-ascii?Q?brmcEzOrUY0lW7BaXxzCCxHaL+kQ5nG6VDBuY6SOHL7BRWG0bdrq0/eZQC6s?=
 =?us-ascii?Q?FUyaau/+hqad4GRwWYKD7RtIlKy00tpSjGjFv8QBJHSGc9YVrAGFQeYfm9Gw?=
 =?us-ascii?Q?vra48vcS/7VZEox6Ifik87lgs7UMipaEvdny2XpQjfjjcdpCzXOVxmObzI8+?=
 =?us-ascii?Q?sGc8YG1aOFU+s9KO4JxkV7z3zK472hfsZHh5yoGgnfozqVCImtJPKhy3F7cN?=
 =?us-ascii?Q?DMAOF7/hev3P+wSHE6C9ALTSj1PcOAJUbia/eZEWsLR+BK4s4osXa2Lmh0wF?=
 =?us-ascii?Q?vXXc6wYeU7i+pAnawS3KfwfE4fsTcIg868macIEIBi/tDOyVuCBOU9qp/0ES?=
 =?us-ascii?Q?uqp1oGZ2fnbODpcJcJpd6h5sXv4C3G6/bLyIgnIa/88fnL2shFjgaM32pLHJ?=
 =?us-ascii?Q?xkd2IfzydGX4fWjEdFPfIvUipk/upFb0+WU/BKUvjE3xp3HFGKWFb1tQxhAv?=
 =?us-ascii?Q?TJISyE0UyCotbaC3IHTlEhOfu7tEuCQdKT6coQR1tzYKNo5lPQEAdBNW+7bw?=
 =?us-ascii?Q?PeeZeLIIvppSefl723fg9y5J/aesADBwZnkbM86nWABS+MkkAVH2ECg6Ctcz?=
 =?us-ascii?Q?P4KNexZWLelfsNBEounsJIn8OoT3fEzDPIJHOcQqFNqnQy3TX9YnMIfdl7O3?=
 =?us-ascii?Q?ks+Smqm2YHrJueVX8BV8bmKFtHdF1rfljcSVa0OEW0iS7AGGdFC+j/R0q1zr?=
 =?us-ascii?Q?ELsuMJl7oZmNVFcvcHTPRnsySzmGemXRgoSDAw7cjjjHVLZrXpjmBRpldvem?=
 =?us-ascii?Q?M36TGWxrtFJ3aeZOSIo/xXCjf86lcB6WVU6y16Fd90V2OTvGQcnMg38Gec0S?=
 =?us-ascii?Q?MSafxzI41m72lwjLOxo97+FDKKUVXjfz2BxheogwzNksJLmiNgVo7pvWPSqf?=
 =?us-ascii?Q?esp46d9I8M18j8GgX4bIwiBKS8aMrUSzhKqZ0m8VMrvtn06yqvso2ur4qW5U?=
 =?us-ascii?Q?UiAN2TGudpFQMe8O9BbIOObPlot8iBnB5GV3KN/4muZ39Tdp4q6QvYsS1+ZD?=
 =?us-ascii?Q?YR4bOgySy4EORDBm3UrH7MQP4m6ufhbrEVklyL+eW+VBH14BHwkcxhX399sA?=
 =?us-ascii?Q?egbOJDiqchRU46N2gKMGBKyLo0TBFMC8z7QQv6uokW5SECSRrH+ch4seyFsR?=
 =?us-ascii?Q?esRkBajkFQP/umXJkpFLqCghgp7al3eQaMQIAlExpnf0xn/gAOSQbYJ3Qu8g?=
 =?us-ascii?Q?E9JOk+8ZZYZJ9mdJYrgR+rRS8DwYAQu6ULKl8hupn1Y9nQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FPt70cFAi65XMCFo3TSrt/0KhDaW6IfqZm11Y84+fZESTVd6AxKp6ZKieCVH?=
 =?us-ascii?Q?DsNNmcMGtP0QgU9tDUVeBZ3GzWbF73QBC4P+aDaTeqzRGnFEXSbl1Y6uRDWj?=
 =?us-ascii?Q?wz7TMF6Vle+fD/d6VIJdtGtHYA/kHlBedF3y5X8jJ5hREaqmTOBAJ5qaVOM4?=
 =?us-ascii?Q?SNVucUw1fRfcSo8Fg5QXcCc8db7HLnkvbcrwM1LLKXDvrOzF65OTG0v21Daw?=
 =?us-ascii?Q?VSmG1XTxmetkebK+7J5+4wC18BHl6UUn0I8X06yEGb7/CrS+aAhq3rw0MgYm?=
 =?us-ascii?Q?d9ife92708p/vI1qZpX2xeEc3qR+pLzPtHHp/+mpEbRMxOMHM+8Bs6iFsN1S?=
 =?us-ascii?Q?K4G5+/rMa55+zRVhFwDFPbEGK59THut9And5bMDEX0PFR8A0/I6/6jFXdil4?=
 =?us-ascii?Q?S8gMdrI0vMowMnZ3kT5aHLhFYMB+hkzEUNP3J55CDFP9z4tv5i7vcI7xW3yk?=
 =?us-ascii?Q?+pSaKGsfDm9RQRgl65qn/7VatCwghtsgajIaVRM2KcectY3XJpmx9TRglMH7?=
 =?us-ascii?Q?7mVbjaNABgsRyvU3HE844LAeM9ZD/d4YpF1BXu4hZ1PGPeoLPj4RdLbZ0dli?=
 =?us-ascii?Q?+IbUGunfpwHfD3nUkxOI3nTKYlejR3Gq8vgBnAXRhTC2zsiC1EMbRgvDUsmq?=
 =?us-ascii?Q?nF4yZ6ufvvsdl/TP/PYFQQv5geeCzHCzqJ8Bs9V9xss0jD040/w+GGOKTcul?=
 =?us-ascii?Q?z0658rwnGuKaiZYH1CEdhP3RXeux1ar6bs+uq1dAKJN4OzHvaIUgc0aXMYtR?=
 =?us-ascii?Q?nC/LydnSwNUsnwAj4uzcOKHlgjZH43dt/EcCPW0ljh45buSuZ1XZ5c2JQwcU?=
 =?us-ascii?Q?kEQMs7oHhCQdp/77CW2Q5XybMpridgu8al6QJkQne5YL0nGU7WoPhs+EZeTa?=
 =?us-ascii?Q?rj1AXs8Tgkl1k0FH8yCAJK6R3WD3Lcj2mgZPip3qisrDdSFY0aTnUeZ5In8h?=
 =?us-ascii?Q?qDIvTlxdroIcqHmYvg+fl0hVmX9HdUGLD0CoZLkO6ff+hnQWNzmpk7v0HJDA?=
 =?us-ascii?Q?r792m50ASHQlmkL1z8UzkJSXq162YVC8CR3pOZOYM7tp0vSMiNHcyn7RFTo+?=
 =?us-ascii?Q?0hYTjNwRqrK6hiyXnXRxMRsINOhUiCnwHLZx6A0axqLgHoPrTlOc0Wj7lZBA?=
 =?us-ascii?Q?DRhYOCUk8bXDNZVmh1FzUvQQ6BHs3AI8ZFIacoUcawTd3jLW0iqPSJgpJtL2?=
 =?us-ascii?Q?/GuUtcEbtZJmUvGTjWdQ0z+A56+OiasVpsXO0BrqfmeamCNEDCSbbhLWXbO0?=
 =?us-ascii?Q?3Ot5RS0z7HgvZYk7HaxZJQnlyhuXhy6zEuplcAE/ZYJSNNlrIV1MixYKMRk/?=
 =?us-ascii?Q?qngqAMXQr9AjIJpm28pRkMGDI4BllKegYD2sUtMb/N8p7LYzIFGmP+mvRcHp?=
 =?us-ascii?Q?X/ZsICr9NeGlw9cCDv+ioDH+Qfp5JyHH4WrMxQcE30pY83Px4QaTJKYP29ph?=
 =?us-ascii?Q?LuT7dQvwi48llZGht3S5vgoxTv8a+QOHzi+0RUG0qvL05AYQ1DEZK/zPNuOh?=
 =?us-ascii?Q?koPuuTG62KaNoAcOQJ8+iLzHZij7OiY6ZE1SUZtwaknqiRnygRLjtXqSdwF+?=
 =?us-ascii?Q?/GbyXCXf5mw+TRDVm6UpIyBAPWdnYchu7mZa3pLAnVZQmi4KSn8xEUbPSBhj?=
 =?us-ascii?Q?mNzAjMAuPz8FJTsYhRvBZQ4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tOIxD/HGtfFRhedpGas5x4ttpm8P+03BOY5qSEkDw+4Zl/wCyrrnenTXOgqr5SUbuGQH/WUXFzK2r5zwxaCUkSntBEcRIsibBXPOZGIFU4jF5GzGkgBS38+a+6oD6h1zu69gk/8rxrJ92kYGy6G6mPNCIQdBrxmeXz3BqWdWiPFE4AGHDCs+FacH5SrbtVwMgOlMzugsfFpn5JjuXfhHFIqhPHhBSjxv9Qt0qhhNWZGEcVbjKVYCgdPs/sUruxsES6x4DLaQ7APPEcXfu36cRhV3ldYYpQdpdK4HirZW8LnhW8WRozFS43scxU6R29q8Thjvb4B6FYBWTCXmHTKVgF9m+YdfllDnbbb/R2T5CebFi44B+qwdS9LhPXhQ8DJGyxaxUugHuVMncR4ye/PygHZAkjEeiuaUSnQotRUmJ+kLzhFHocDEkSJfJjEorS4g7xaD+mgWu4ovmbHVfmD+2ZX82itoIjbRDmpj11oisuIl2/uG56iCJq7gGJ/SsBtoi+N3PfppH+RZ9dD4ahO7bD/lquwHG35IncpA7To6LODgM+sba3KHYkcXji0yx7kpbU4WwGpNTSk9eMP9BGywKtYZtVDBxrDFRmjPeZ9UJNs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a42236-48bd-40f0-7959-08dcb171f17e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 15:03:32.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mB1L1tu2FmV8tthZPgviCMfGTqPv5+tGMUypRjd64w2+FSGAPpqzvXBXrgB8U1aEaYHJnjTwFfAQ2qTpY3G1A2o80WbfQ5lxYe1YSWxEOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5028
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407310106
X-Proofpoint-ORIG-GUID: jmCgDjlOrxw7qvZlimg5Y1ITyJ54nRVx
X-Proofpoint-GUID: jmCgDjlOrxw7qvZlimg5Y1ITyJ54nRVx

The bogus-ioctl trigger has a loop to close all possible fds, and it
was limit by rlim_max.  On some systems, that was such a high limit
that the loop was taking too long, causing tests to time out.  Set
the limit to 1024, so that the loop will end in reasonable time.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/triggers/bogus-ioctl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/test/triggers/bogus-ioctl.c b/test/triggers/bogus-ioctl.c
index 25933229..f1546445 100644
--- a/test/triggers/bogus-ioctl.c
+++ b/test/triggers/bogus-ioctl.c
@@ -38,7 +38,10 @@ main(void)
 	sigaction(SIGUSR1, &act, NULL);
 
 	getrlimit(RLIMIT_NOFILE, &rl);
-	for (i = 0; i < rl.rlim_max; i++)
+	rl.rlim_cur = 1024;
+	setrlimit(RLIMIT_NOFILE, &rl);
+	getrlimit(RLIMIT_NOFILE, &rl);
+	for (i = 0; i < rl.rlim_cur; i++)
 		close(i);
 	n = 0;
 
-- 
2.45.2

