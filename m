Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389100;
	b=X9lSzoWyjxLTwDwSqJIsMH98HtXfsgQAEAegLU3cpQkNrbyTSsL+pc7OhXMm5WF9a7bz
	 pM6a+76WZNqbcpzNyIG9c/RBNWnmKSpvDdCR6dBcx41qG9hcXoZaw3YD/X0D0Dc1ZYfgx
	 ELqkyY16kUtBHZ8mH42WKwCjwzb7CEowufVqyuV74gS7YQU1i4YQ38LGoeMeTHY5R3wlQ
	 fSb+r3Z7wRjWg7T9+Uoo8/MB+0dg5e8+PujW5nlvmHGMS6XzKS4mnz43MSV8ippko/2sI
	 QkmG48DQ2D5ueuwD2e5GyXKvSx/cmzF2ZLDziH1ExXxS3iLseytYxuJtGaTdlZaZ9qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=rjRMpbEjG1zAz8bKIm0U4Iqq5gGcWiAAGf7dUXWX5bI=;
	b=eFMDSzMBVG171Rmj583Kc0sCvfZ7jPoTcsDQAXJcH3UkIMm+RQVQ1hJogAHlTBovNkoP
	 7JD8CxL0h5t+fKOTjh4/7EX4paBmIL3NGLO5EgpdXVA1GkJPtbnrDZV7FjRE39bxWDLgG
	 VVZpyIWjE45HUFa1aT2as4lwBp/OXBdzLF4DvAlzcnOrdC90k1xNhAGNgulffcmQACqpG
	 DmGUiuem5Xau7KWSSdCIauQnBcGQcCkoj1bHF/6S8wEuhdLze4LqUOJG1/bAuUe7wNvEZ
	 ZKW7Caw4LO9vMKpSuAf7fSCKHMKZMn97osoVMYastBBTmZOloeCawEwXFyLHoBuPtxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=hU1KBiOI;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JUepSrez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4867B606A31E
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4867B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=hU1KBiOI;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=JUepSrez
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXYCw3604778
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rjRMpbEjG1zAz8bKIm0U4Iqq5gGcWiAAGf7dUXWX5bI=; b=
	hU1KBiOIU+lx0Ff21lCdwSvrBLjviataw2YmUNvQoMQX/rhMoOl6nMniIU9iVk98
	pBUp0wEQDPwwhOyEWc51AZrfB1i9JelKAW7LVOLsKQOLyD9SH/NXlDuiM6mpUqb5
	LeVphgiAJY0gXf0u9Txjxqi2MZqMLKY7GQI8hMeujY8DjYi537bRSgpVo0MeDHFQ
	ButX3F6ULSRT5OVVwc2RKh+sloTmZyEP8T29WsBuTfhcIfe9RT/oSbpvTcgrY48n
	v3KDcqyLOnkQEKwhw4o/W0DltYPXndeM8iisxvmxY4f/nP/hGVRqFC6UscBjFtfi
	ue2TLawiJGkPx07S0rpKng==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5s1cc2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UI0I7U2476920
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:18 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hn04v2wh0-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItxN7FjqVD2vnJGFp5HLsLVhQ66x0xdZzPMOU7VhOkhYM+Mbnc6Vc8qrC/3Oz/EZ0hPX62qM9k1Pv4UvhwrR76+Htlt/Ze0gozDCGoS0U7dkiHCt7DPd0bwxWOJP+THAZYlFe9RooE5HmSvbiAEkzmRn64eoWufXqXB1gG8rX0i6qhCRcABTC1TxjIJ/ZxUJIlUlx00tFzjnhuSbYpRiI5k2A9lMxtudrxf1+YOvVtk+BE86BAkSxx/aMZlBr/hnDVPxiIMmYUOwdsL4hEPOWu8ykldTKBrdP+vdu9gEWMOvG4QMzvhXQ2+hRhKZJXoDXQA65r6SMHkwL41frSasJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjRMpbEjG1zAz8bKIm0U4Iqq5gGcWiAAGf7dUXWX5bI=;
 b=xtqz3G3x5i5IKaUUmlWyWcyLAYskZSu7FiGazDVJ2hqNsJuNuESP6MqpbQtddYeco+QYI1TTxfz3GzhTXUEiItsQmRBnIvaPzj+kQtEg6fewNcSy9HbgBcsRPJp6qf78TWl4dHXC6QFVfI1hcclAWXGwlGivmWzQ4Nazoxj70q+sZTMPdMgQcNDvjRi9tThTOzzm4sJ9uDL8iILzugf6ouY7j7amqffAkwAxrHvNxtnh5lNtaw7HnQ8Qut7HAFvTpaF5caPVS48ZgVmL/uit2d6dEmWPkrFnHEDkdfbXpExpU6GPCav88qumw+pUeDi5PLqj67a1cDhFD1g5eL3t2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjRMpbEjG1zAz8bKIm0U4Iqq5gGcWiAAGf7dUXWX5bI=;
 b=JUepSrez7Ra4Z2Ew3EbbPxGYPS+IwNCJLMT+SPCkiIzvvl+WdqSpLvEk23DYtZ4DboWww94ONBpEgzQOD/M+3KS0rO6MbygwxcD1Bdlm3iC840bw1T+stVVDJFIqAIgSRk/R9pcS3rk4eqhUV6/c2ja3m9b5rqWOXpnX++WZ9yk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BLAPR10MB5108.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:16 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:16 +0000
Date: Fri, 30 Oct 2026 19:36:41 +0000
Message-ID: <aa68020442985d905ffea22f1039e4eb@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/20] libdtrace: grow module address ranges geometrically
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0107.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::13) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BLAPR10MB5108:EE_
X-MS-PublicTrafficType: Email
client-request-id: 1bb88eb2-5913-4de4-84c1-e0bf5bd90c4d
request-id: 1d402431-a773-4e26-a83f-08df36bd57f8
X-MS-Office365-Filtering-Correlation-Id: 1d402431-a773-4e26-a83f-08df36bd57f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|56012099006|10067099003|261021123027099003|261021121427099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	8INHRbl6peodoocYw+5QmsdFxTLKkCMACUKCcm3bH6YkzE3yHxJbjAeEXIOVK3dpVDRa5hlDZY4jUN5Jd/1t+h5/Mya/YPyiJFOgg7CX3zmUrzbCn/WFPLG45azwg0FWKGYtU5ppXaJo5hNyzvMfeJnvo8cdaKI99asupr5uREqipqxqyGsutG71O18q9TVlGPoV9k+9G9vw69TU7qlhQjyE8whpsxRQhFRYQiMDTWnBJ9rbjpqWfZTv9BqtK0e0uhr/E3HM+3dZ4dSnZBxPIqvNUNpt3fyFZBWNY+B4qykFk+S67WhAG4NUdnox/Tjzs64KejnGlDro1L37UhOXs28PhG9OyC8CcYw/WnEC6r9n7oTb1fEGuKM1O8L7sOQwGyTGxhHTj/Qo1Rurm333oZ1sC8A/jhtWSVlDv+erSgf9gBfMcoV5EZR8LIvssSDJkQk8dRCWfOjNUQFwLuOYY4/3RtSGiaCPYFUbCVZiIaLe75okIFT9AbWMsxCb5spgEUQUJvHYVmYkb6GGiGfn8aBxjeOXkHJpYCfQ/Z+tU0KkeVo0On8wg1DyHpGuT2h/Y13jDTkEovEP/egMmXXZaXta4Fc4WmpXNekIlHHlCICA0IFHIk4ofuLwr/aXdo/PE5PLelpdZoxyQrujJDAZbIpgCBmYhnVNYjNunyLDh3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(10067099003)(261021123027099003)(261021121427099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AobfBMKgB8C1pAdEL604bAqn19Y3TlGxjQRwxl1mBgW9gZnD2qBxT8d3SdW+?=
 =?us-ascii?Q?oitAoNO5dHepFMUaaFJjo8SYRCcdYY0G62jpGGssYRggpihrt4wIRkyAZ5zU?=
 =?us-ascii?Q?VOVDkG3nymgmaodl7/J3phPX/Qu6Zm4CKIrrteBsKJuc+GCBCJ7YIskWNsXg?=
 =?us-ascii?Q?kN3WcwhiRK73+LufDcrzQRDsNy5C3348BNWwXs0t1m6t6N9z8oS581M3lTQU?=
 =?us-ascii?Q?aPPPg+ZmFBCAmeizGdm7AdbcpwuSn9MyCFicieYS2XeeQdLwMlG3A78xby34?=
 =?us-ascii?Q?LWVVW39qxrNA3eRw2qsKBX6cVznxPTmJYd0bHur9YGUmkQ6Ya2qp4nCbpxa6?=
 =?us-ascii?Q?h6pZBXxUwwAtuAe/qbTbCpEjzwHv8rKorCKCyKLWfuKo3VAIKF0XuOu0AUpb?=
 =?us-ascii?Q?sm5C/jzC7Zfbxi2JQzUkgNMUquzYS5pxa995McMb75zStx3D7dIE4Croweyo?=
 =?us-ascii?Q?qrD1zKqnx8akvab3oV9Wcy5p1YMa7NHzh8aubLKJe08y35tueRyLAM/EUED+?=
 =?us-ascii?Q?8wWkHuOK9qUUatKl2KJCrucvfzmZnbAdYFgrxd2aTtoulBqhxMHhMSpUY24q?=
 =?us-ascii?Q?Af5j7p+/Oeqi+mOMm5uRCDUhznECTTYsdHwj9Lb9pl8HYgVK4pCaz4yAois2?=
 =?us-ascii?Q?P7oRIbr9XERvfO8KLoj8KulxCWIWSeGMg61Rdw4xpGCEBIkeC8fXUrBSLg/H?=
 =?us-ascii?Q?ov8gU2zcdQlPoDF5otKc/jymX0pRUie9Jc5n0rt4bt01Xha77HCfxLn+ukpv?=
 =?us-ascii?Q?0MreCdpM5T08aQR0ktnx7nHMpEbVb8v9AY6wljdZaJrujGufuNE/DjbKhV/x?=
 =?us-ascii?Q?WNdXWeoJA65pq1sc4lpGws8Mo368bw5FOu0t7o3CRFWpRJt/hhr6kdxp6LhE?=
 =?us-ascii?Q?IzQaFf3Wz/0D6DVeOLI9nEKaMhmwrafe/+7V1Z4txFvlh9LNkXTi7Gv+w09J?=
 =?us-ascii?Q?zz65A+K/v/wBAoxb5P7oAC5yDPC1P9v6x6gjlHXJfL+B06ZIIp2lnfJWtDgy?=
 =?us-ascii?Q?dai7+byaV23HGia1rzIp3JCmyNSwBIxizoBXoNzib5/i+xIebRAQXj6M15it?=
 =?us-ascii?Q?EXfPjuIRrZumpOnSQCUzqqyDYypu5Ww0h8Ssn4ZN3jpkOkDAhYP2Ty5nIp2y?=
 =?us-ascii?Q?IOf+distlx7JBlu4aSzdK7LlzmoYEG+jMyOPiNuYmM8+1Nkr1nH9J3ublFsU?=
 =?us-ascii?Q?esTooCjKRSlFaLeLb8u7NDyvuVUvFjfpWTv5KzDTG4hCoaLltduOoiSBbwK/?=
 =?us-ascii?Q?4TNdWxr81npnN/QMCEF/IbilxgWcSBvJVkKHYC4gbxkz2gTtzk4iK7/gzu15?=
 =?us-ascii?Q?dYZp4qSqzJ+rjvRC3d16WNJ4FUC4SyYF2YShcZx//VpzgxMxeTwhkgWnX3am?=
 =?us-ascii?Q?XddFwuS6/GLkmy8xWDmnTcqHkOz2Ejx6kBGwE+tZy2SXC8lxQJ9c0g8HNI3A?=
 =?us-ascii?Q?s+zzcJZNyS3YnRzg0aHpcJDwxnqT9u4m7KSqmjfeOv7uFUwCIFv9rH83Nzt4?=
 =?us-ascii?Q?IvW6bkcXpNJWRZf1Hl3m+hCCwLXEDMwHjHlLJXQQBnWAd26JFRZ8cRmbIi9c?=
 =?us-ascii?Q?FTkOolqX6eKw7/8vyOy+F+Cv3oeURu5ZFwvf8qHbRKBZmh1XSiWrDP6bVSox?=
 =?us-ascii?Q?fJgiVxx+7ChDaCJyHmnre7SAZ/eOPn7kOWMKdpvv4n/mg74TBhyi8CSPvV6/?=
 =?us-ascii?Q?TBzMbHmAxN08GUWHy/jNfaBlKNqxz+Z8zt54AUwaQzO/iNv0VqI3B1SvMRNl?=
 =?us-ascii?Q?9vwNG8aEbBZE6LKILHyJ4V/TJXFG39Q=3D?=
X-Exchange-RoutingPolicyChecked:
	CaoRA2o7n7BMXlcJzL9W8beYxibSo6ng3p7/+ZcNFGET3OoPXQVQ2FE5D9PefVTadKB2ZZWp7nBASJwuOKrkAWHufpJOzhpnbGBKpSwM3+M9Gprq2Hqo9rh4QS2yKQOMFFLzhw2pCsZWSRA54fV19CIsikRS1UAsFBfA8Paf6vcEPrxKkPwwXcdWt8sunp7pPCWF77DvZINnZFeVjRb68eFqQDVyiyobKQ/72IrUPu/6ePmsrmIDj6lIMc9EAXRgdMkcP3DRm0z9qNE/q8WC3GWv5ZpyREkvLvTER0R3Kbcpd2Ptw5fl6KrgJZNrUHek03RTU3HGriJvMzsACNOQrQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lVTkcHuV+RMYfB86or9t2nArXSn4LND+CjDW1iAPzIIAmmMKJgANrzVJomwtOopro5T+vfAbUGVgJSCmxd/QC5zb1rn6yMWWMCAsbWtXqoZMbqhGXdk9rpdAFaXqTKwVfnBWkPxPkDEQWMXQ4Bo51Eeq3QiD3N2ncklQID1odbT31/jkJSVocjXZUzX3JwlKm3Dlw8Bnzfz82FCWxKCZ5/8RFs0Uhw9bPFWN3kh61dwsfQq1ah+TsnB1VvgjF4YWUiIjn77JAc4db/LfWH3tjJnta8HgvvU32ljYG2lwWdx2PaB6UG5/8dbH2WwfkFuFuGqPIanksGSJ6EpeDQ8WA1+50zgpYm6rAiJxgLHu/917gl37u8PfF/7M9zf2s4lK6VoevDrWH9IaIGSyB9SzRiCcWSAcV+ckWmOxSrnAYhOrXOtA9R8stzaS9eZmxz3UM72egvDor1cl0xulfBBT4IHkYHqZD9GQQiX1QB7r2aYvjx4kAxH9YqowjbdVpTfSshcbsMw9mHF7WNVS6lEPTQyN7oaVzwQbRWZNdxhFpl+x/7MgU/mB7cErTiemGg3U0/37DdlNO0yIRDfmqbnuBT1Rs7xKd+itCG7rymWNk80=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d402431-a773-4e26-a83f-08df36bd57f8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:16.3321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsQhW8lMDHpTDg1g8AsOmiJAXzcem3fbqUfDXrSPh4guGXfYpjYsFF8a3uYxIIa2AOeeka5taYIHXiMcFoQm+e9ky5gz7Txoc229g3Vo1g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5108
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=BdJNQbt2 c=1 sm=1 tr=0 ts=6ae4f22b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=eUenSmu9bXNXSxdV6NIA:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-ORIG-GUID: 9QRhNvBynwjHflQy7gcSaH5KSBAzjQI5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX6eJyM4lh4NvF
 X31vQWClf51xS1QdUimK/8vJB2uLxVbbquvNxmNqnyoK1Kb7fjRXFja7CFfmbjAy3sXsVmCJKOv
 PUWgA1jtMKYtmon5XZMOmjyDqsu3sTlzOXKIVNPW5MWNHFPHlIX0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX+pNRdURYKVea
 a60pqqnXQ31+TOZhrkG3MYKn7jCrPVcAjk+6sxWdv3G9asfT+xFmsgG7csZhUaHJFkmov0YAsJ4
 wv9bQ8qLQu36yH5pAQ5hu2wphOpuCmMQmLdVldULAcEWD/vlaR3hDwyWxVy5KGd/78g9nlpU02S
 7luqgGyRle+o/0z5zxktFFOwZvS81nSNh42NOGYLfFD7hp1R9a3BJac5i7hqu+lzTESF5XV8MQP
 ZyU17YCph1zTMmJrikqyi0wPPgvCRTaGqm5orVAv5y59U7d6apjpCACU8PL/S9sYSblmCQV+VqE
 xYro2fcbKsicBMcOE5EdR7yWfskk0vBxNn4ct3yHeEpwOsMQz6ir+YHGbKPeUH9D+PQyNMs3zeo
 z82BsNK1dSmJiOIx59txOaiplVlpQgCuj4BYNHhpQ+Hy0beyIdtHDnCG92zCnuVRVkhwmKht35X
 EhYooid6rULu8PpbjR6trEs9FJmQpSrgR7//OrLo=
X-Proofpoint-GUID: 9QRhNvBynwjHflQy7gcSaH5KSBAzjQI5

---
 libdtrace/dt_impl.h   |  2 ++
 libdtrace/dt_module.c | 21 +++++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index fcdac855..f89ce2bc 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -149,8 +149,10 @@ typedef struct dt_module {
 
 	dtrace_addr_range_t *dm_text_addrs; /* text addresses, sorted */
 	size_t dm_text_addrs_size;	 /* number of entries */
+	size_t dm_text_addrs_cap;	 /* allocated entries */
 	dtrace_addr_range_t *dm_data_addrs; /* data/BSS addresses, sorted */
 	size_t dm_data_addrs_size;	 /* number of entries */
+	size_t dm_data_addrs_cap;	 /* allocated entries */
 
 	dt_idhash_t *dm_extern;	/* external symbol definitions */
 
diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 6868268e..7cc68968 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1141,22 +1141,31 @@ dtrace_addr_range_grow(dt_module_t *dmp, int is_text)
 	dtrace_addr_range_t **range;
 	dtrace_addr_range_t *new_range;
 	dtrace_addr_range_t *final_range;
-	size_t *size;
+	size_t *size, *capacity;
 
 	if (is_text) {
 		range = &dmp->dm_text_addrs;
 		size = &dmp->dm_text_addrs_size;
+		capacity = &dmp->dm_text_addrs_cap;
 	} else {
 		range = &dmp->dm_data_addrs;
 		size = &dmp->dm_data_addrs_size;
+		capacity = &dmp->dm_data_addrs_cap;
 	}
 
-	new_range = realloc(*range, sizeof(struct dtrace_addr_range) *
-	    (*size+1));
-	if (new_range == NULL)
-		return NULL;
+	if (*size == *capacity) {
+		size_t cap = *capacity == 0 ? 4 : *capacity * 2;
 
-	*range = new_range;
+		if (cap < *capacity || cap > SIZE_MAX / sizeof(**range))
+			return NULL;
+		new_range = realloc(*range, sizeof(**range) * cap);
+		if (new_range == NULL)
+			return NULL;
+
+		*range = new_range;
+		*capacity = cap;
+	}
+	new_range = *range;
 	final_range = new_range + (*size);
 	final_range->dar_va = 0;
 	final_range->dar_size = 0;
-- 
2.52.0

