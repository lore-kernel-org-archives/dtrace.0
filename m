Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255063;
	b=2HzMvNsWCsYtOFXbHJYnms3/bHjGtJqQ267tCgeyx/AsIZINatTW42q5uoJRoktiLAmZ
	 Xw1eo7F4plfOtD7agPuLu45m0Wq+kmKhQefHzOnyiNGwosiunpb8AAz7rPUfhTV4KREcf
	 8rwkfQXuwEv4IJfFcREEdUlY0+iAqhcb+8koQRBl+0pdfwvNLYAOln7+LL4f56EIedZAq
	 mBWwqZORt+7A1I9GnVF5MQ32Wf7sjWi6UsJO3INbQf3hGESUa+Q79XS28/4UiRj/U2qsY
	 2wR5LiMFg5kU2qda1qXFw9p2+OjfvvV4b3vMYbtl2gZ9jJSRAKIjboJyLyy1w0Iz4LA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255063;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID;
	bh=a0MhOWitS6FBRQH36QEwx0pubUpJTAlyVY8Wac0AQLg=;
	b=uiJDvy+WP5v6xFCZvkMW+JLTsIgp00hcOWb/3jFv1zeprvSAxz0uRgUA5pzCRwHm/M8r
	 YEQg5zIh86NTMEFx++bLqAfB9CWy8Tz8pXyRLq+xli4siIc3BjF62FVOgTqPOsCr2W/mS
	 eSDdJp1hqW1zhWdfzLlrllwqZ/9AzrZAnLr8r6447qaOQTJgBhaP0cYoS76O+aJ2WrMOG
	 QY/Gq3xwuDx2mdG8rB27nnzeNdA3F7ShKVZ3sA0y+buFaNsWncTWsSp1Vb+FsJUJXjnDb
	 agnkKdaLLVnekHkbySkMdze5lKnhAVRg/d5dQAlvZqnUMrnuL27HBHTC9RZ9670bkhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=YaRq5M4T;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tvdYOL7H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E9606A31C
	for <dtrace@lists.linux.dev>; Mon,  9 Nov 2026 20:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F6E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=YaRq5M4T;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=tvdYOL7H
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9EH8971240611
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=a0MhOWitS6FBRQH36QEwx0pubUpJTAlyVY8Wac0AQLg=; b=
	YaRq5M4TJhg17xGa43JL7vq8RVSLvub83JfQUVsFIxV6D/Q3zwzPLruzCFR5U57x
	QEVQ37XPqzyQnGenMuh4oaCskLfdZIfJZ3E7FVGxop6oBqAvNO2w9K45EVSKt1BS
	S3lt0+FkQMaEWsTiOoo4dwNzo1EkTmLqukMPr71IFclSMmj4RT5vZINzNx9FJqNP
	HdWz2tR/ijxVBaCeaQoyxKtJ9bN3ykJa5XKWVmVASLXPqRiVLPf4iZx+yt3C+PC8
	ZXwYzshpGolvEuQGeciDwu5mLmXl7Iy7vOuG7KDO8hBM2gZSd3N3n4WNWnw2XDCQ
	GR3K7rSicgcfzLPMMC/SCg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hstdbk1wc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:11:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9JPWS6554937
	for <dtrace@lists.linux.dev>; Mon, 9 Nov 2026 20:11:01 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4huhxb6js6-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 09 Nov 2026 20:11:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niw3AGdLsHQBDnoZNrOwOLk94HzLcJRnUfB4oIUgxClAeb25cJJeKuiyFSnNjS5/3iMIHSQAiRXTCrFJJndrkDG+IsS+6X5avOXvkQSLFnZZQ8jGMExLbjKs2y8gVyuRnWUUIfMbX1nIKUvSwCMITCM7AeOwzyiDNzvpZ1yhU9XCnq4admgjHA/u8rUxFtAc+FIa1F0LKxS0fdV1Ornx9fFKGWFmTiSCfbe7mjsp6Ee7JCtl12rWdHvvs0Pe/ZMzjr9iaRzQU+cwov0SFtQdd5OlrELy2Rcif5wvr5e5QtvJFuI4oA1lvi1woN9OBks6Uqnsi4mb6B2QBQ3zQ8t38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0MhOWitS6FBRQH36QEwx0pubUpJTAlyVY8Wac0AQLg=;
 b=krb9eUMRGjWJsfaz3MTW5+vLkq9XV0G/WaLrTXOL/8mABBTitMAdcrs9xbOZkLZBFOWhV4hMgG3h7WJrukbunOJsMozE8NVc2nAdES8T3qGo+UuCrom7CYR8UCKt5F+Hv969HpCWuRGFYtQG7uPOjgjtULVeIxPOGvqyABLmv+BLlOlfDFbg1E3GIuIlOE6KKhsOre++LUey4ZedbbOReoi9mFFFeEo+zTYJBRM7XsthPQ6vX87HwKjw/rOa/9fljqsf14BpXxUA6ms0SUK+jpIwzQpwU0zQbWM+2JDnu8bE9QxZhLgY/tXpT33Y8oh35ZjBFm53CppT79hXJZMg/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0MhOWitS6FBRQH36QEwx0pubUpJTAlyVY8Wac0AQLg=;
 b=tvdYOL7Hhjt+J20K0/BY4lWk9znymAoZeJOdHVDOGy0sZnlUenqbJhNnd/S6NgHg7TakwgLmiwENGlplyOIhnVhELra+FEoQhtKKo/k2sdEFtUprArsUi5EtR4XKUv33F2wj/J8Yd5ov1i82IVdkyd+SOU+ECB5ZCy42nAUESIE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CY8PR10MB7171.namprd10.prod.outlook.com (2603:10b6:930:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 20:10:59 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 20:10:59 +0000
Date: Mon, 09 Nov 2026 20:09:18 +0000
Message-ID: <8fd5fa33475c3e32350c81bd33746b26@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] test: change the type used in this test
Content-Type: text/plain
X-ClientProxiedBy: PH5P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::12) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CY8PR10MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5a3e72-ab0c-470b-9edf-08df3e9d91f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|10067099003|261102123227099003|56012099006|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	VhHQHTK+we9HlFtc/t1KYH/yjD1BMVO9IzClKavHHhEvcZnFc0B/e+Ax78VPEBxxeJQziczAbQDbeS1ujdcvSusWJ/iYRzZHG9tbQ0wQWksAI+dEUFxcKSeLIHZoWsttMMrPE0u3Wercem7JCvSfjxp5La2DwyQJfqv1ln5xd6VkbVtKr48UzEGZ/6+8wA14DJAdrc+KFQT+bv4539twmZiIQ8S9NBYrLrmLtp9/3H4DhTLdnoDxyZGVUUBQyNBRyC1G7lZDqTbX0WJleaG7ch/qIrfQG6IwS9aFgtmin1ewKX7hS9ZpVk396u0EVvvNYEXfa4R9/tjQJ97A+c3EfNbRV2dQwiHsC3bBcxf6hatWZyQ9wry3AOGl5VWc8n77uQbjvdu09TyeCk5KiCdtAJQ+jfOXcygjJh39uimWlooE0NmPfTfMlqPv4A9amSg3+kex49w59a/oKZfyiUgLz2ksFW57qX8SRb8rb9wLjpNRXzpPoKPd5kYGMKuKDaUvy5F86CbsXyergJVr3Le62C1KrMKr3Nas17s9/eJl1OIM3iXdzNyWF78KR5LOdo4NRf0gfrzDLnWeu8Td5gj3jWm/LCMgpwOKEqJZy1xAtt8lzoQm/bbudxUdfL9PZ6yM7wvkK0ZHYs8RuB+pmlimEjyo7EhRZFoDytftYZQk48I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(10067099003)(261102123227099003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Ct2+NkUpgVrBnnVY3o7EvBxwGzb9ztZj1P625S7rzTvo7qxrsCl0Uddrgct?=
 =?us-ascii?Q?LoHVElx3fdGiFveW7lrPx15jmo/WkXifE6VywAk8Tfh+r6cxlpoSNQaq32Ez?=
 =?us-ascii?Q?vGwtckCzWFSt5xS49PFkz1Auuk8tT4id8rPMQzLEl4vq2cTOr+mkAIONnoiV?=
 =?us-ascii?Q?lTfC9vsgVoLD1l3wiKn5R3Gg0JrbifZ/zIr2Dj8HdmEVNMsLD5HcHyk127+C?=
 =?us-ascii?Q?UK3+MefMeB1dg41BenPqCkp9Xr2w1sKrBb/XlC57r6y8rKaC9jgyhHuiPKR7?=
 =?us-ascii?Q?N7hN56LU2eqhU4ultJBMJ7Geh7D+CPW6LTDryEX83bNEAThavEo4Cnb3xE51?=
 =?us-ascii?Q?p5vUg8G2G2molB3TOifophkWpnuqmv8ILoXB1/TWtVHTHYb4M15/F2dOKchQ?=
 =?us-ascii?Q?JPqW5hYK4jlsIcCfzZGjHSdHnkNkwB6LgGrJWyXduld7Hgs0wVtID0Zu786p?=
 =?us-ascii?Q?A037RtI91jlC65YXPGlYYJoL+kZV0JvhtNoJ+Zk0WcnoN8nxe88mQ7NfHsmj?=
 =?us-ascii?Q?eU6RWuxAcCgUPZMYQym87sdblWs6+6pjqrjac63Zm88M8H2L2JJOPGuSh0d3?=
 =?us-ascii?Q?5KpXpN8eDWKjcGBEqdAxXYV6aT4fVAeKYFubIlAswfWIBDLtNBbU1PTXgj+y?=
 =?us-ascii?Q?CTBeaBbTYWQF04yCF33qoX6QgeCmIVJ+6PqLpJ9iHvQ1bZ02CgrsgF2C1i2i?=
 =?us-ascii?Q?AZjwhnIkvFTDWVjPPgDugICVxYhqPdFoGIkqmBsCrdJZRiLfv1DkBxdzinKk?=
 =?us-ascii?Q?HfdF8sTMkG6dizVgf371+ea/fNQwH/iFGvXnN5Bxuftx9dSwCc4VH6e4Dh4Q?=
 =?us-ascii?Q?y4ggnN79AkidUbMxhLojlL114eicDYc4oXrCkn2U4/3xYgr2Gsk2e1Cm9DJY?=
 =?us-ascii?Q?Dc/b+6H1IXmWvYrfiQoiec1qKkzC4YbVPr+j3ua2fZV3Z8E47RY88LJyDvbN?=
 =?us-ascii?Q?JNXPBlhrpz53DC9LpEON0+F403hdVKu5z4/0WmjwAvEHflnQSViIwjSMEsE6?=
 =?us-ascii?Q?E0z69JJJvFTAE6j8rzNXfbHPwUtd1Q6QK/rgCy11PJGIO3tgqjavv85EPc7T?=
 =?us-ascii?Q?QRk7blI0ci9y4yjBIK3iYT84h1gu7D+bV3SimlgXJtks6VvhVCOExr/FmyQI?=
 =?us-ascii?Q?1ZochqY7PONu40dLFhpmaoVmxl3jkWeWhx29idEs1/81sBXNQktRKzSmOC/U?=
 =?us-ascii?Q?q2S0ddHDkw/dNA+7pNFNFZVby+LiEpDLaw8+qwogebdK9uHrNYd72oyyXpB/?=
 =?us-ascii?Q?+SMsAxrlsTnbzN83cCCXQ38EYPkoaLrDb2vuumrhYilGZ+wGNC9LgPCDH5OA?=
 =?us-ascii?Q?Kfhwl72Vv6VAkh6JNDCnAIoYNvGqlAait3sSbg8e2oEwoLyR8yabAaPeeqnt?=
 =?us-ascii?Q?zoPYJxtikOMg2P+jimih+K5CTaklPxE9Zjvcpjlu2vHj0w912IHBAhKz2urE?=
 =?us-ascii?Q?URYxd3w5ZiiPInluyrzizYdfb6gqHqL7pI0BTqjOZ2Hr2r/L4UfoXncU8wyK?=
 =?us-ascii?Q?6hTau2qJAcP3Mas6VB4F+rNbHoJ6Yispc5HIzY8W0EGDnfh8+/dvyhqekFL/?=
 =?us-ascii?Q?8HZaOkyjubARg8UQq0itITmFTQLhMotQAPx273yXhx1gVi5KayaputKHWnNo?=
 =?us-ascii?Q?8JeRDEFDiNMVoTyrqoAMcvKs97CD3s0sA5xG8EbUm/FSPXXrAosRcUhrhrNY?=
 =?us-ascii?Q?Sp/2eBKScZgRMX4HrrX9F50OAks3LZl51EqI1FVdBSuEcRlScWuvN66JhhTQ?=
 =?us-ascii?Q?/tK6bw+Gpw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	gyDQQ9cOmk+rP9a0wPTxqpwYynwwdYaPuGTC+lI8/HkKs3nW6X2eUJVOKnHmI68Mi6L66edbmPx/yp3pGLSi3qIQfMjPmdvwuZm6DNdm4NQ87HicE2nVwCo49I/BjGNbzssANFqQCy1h/QtxjejjFO+5kNixui71gNSTbMB44bf03buoQcPklDRga5DtAPEUjG5MyJQTO6Z/24Tbya/9cpmwSvMA3vUAAPG5Kev6jyUVupOoii7TVQqHfP/wopdPA9SgUHRYeBASFeirb4APdl6t8OPTSqn0p/DSekPW+FJMlyQNSxy/JA3d7AXDaGUKLnZJFk1rnNe468CQoiHwRA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OUpsuuT3LW3hG4uJo1lVFpS2iviFH3dy8e+/QaaDYoWgxaI3rhcubNmergN6aqmm++niI7vRgh2B96uNzWYiMWqfm9LWYvtoNelK2PWB8mIcyXtSFv1oAq5+jxW0k7ORZkVIGMMpGlNQfVZMXwfyshn0VICBTEx8YkxjMas56Xn/0hZiBERF2aXD4twWTujdXPTUGBeLMqssc/99NzfatEg2BVcL/7tEWPr9NYgy7+FSEv/sNP/bBWmlXBsyT/qTnGJq7WhRGlNt+k7Nuls1dxfEkPUtF2AVCFVOYhwYYi6ZpswqO9Sd3DNEm6y74HZuIYoUc53c7f02S1HWalRguUa7bqIgZ/L/61cDWS/JOXG8d6PyCN78mmCqWuY6w/b+GvPYqKJZQWggzomagfi51GLlABcxYNucu1UyM2jRfvO08Pa7gVW5FxV5LdAqpeMMGtl8oq7k6GXR7i2LNl9QXTgdWyhAaTSXUAa6N647F6iGl3VBIjuoJwjBJ52E3ZZ7U3U48/7qx0T7Yi4EcCOyLLeqQvAg4dnwiNtiObB2qda8+7yhvsJe6wwCy07wgmR61yTVZiUbxBaigX8/0b8rBu9xtXMiCYqtJPLTxw2HQck=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5a3e72-ab0c-470b-9edf-08df3e9d91f7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 20:10:59.0392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xOq3Ra1X8TdLRwQd7LRXZhmXIkB5QFaTYicAmtbvlJgUmcDsc/jMxtbYEWjD7z+VdKDeOxX8WGVD0NdEqnsZo55PFdE7Li1n45G7c2YiIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2611040001 definitions=main-2611090080
X-Authority-Analysis: v=2.4 cv=cfBHPXDM c=1 sm=1 tr=0 ts=6af228d5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=2AV8Q-eUntRrC5f3:21 a=xqWC_Br6kY4A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8
 a=E10AhIlvefDPm6j8h-IA:9 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:12101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfXyjzs+KzrKEMw
 DGqn22OGhEwOivjReuOOfdxHeLjbaS/inPfEOwx1NFuAghKV121xxUiXA1hs5DV6mrJCcFwc7CC
 UD/pH5rUeN88PbHNDrxrHLCeV/kCKnWcENU3AsJItIL/4NTatU+e1E1iEgN6RQCmIbH2GqY5h2J
 ViUcCzYrMZPgUS+fq/B8X5D36HO2Ux7hh/VkIXDnvDssCVcQCHYo7bVWy7Jj23+ofzYQwFMbmFr
 Kk3zCInUVV7kKQmlZper03TwbBaf8uIK1cZbmGSFGeGtHULNz9J49VjvuKzcEkwU9uxBHvKdP6t
 4w/dVUHpaH4894gC6UF2nPsNw3lZqs2Ut7/Zp1rI7CUT3qphkC84MhvvJDvSZ3l8NVhkQnsjTi1
 LRDQkNlIIPMEXzdb1QpXAW8gyyOVEJGKJEkj8uKNBPPZlwNv8uJvUu6HDH7P/efKo5RjZI7Jngo
 t6sU4aUpwdkr53AI4QbCwa5xlMDnB9mPUmK2tdYU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4MCBTYWx0ZWRfX5vgl5zWhA04V
 hOrpEoZQpAwfRcoyBn4SnqDJQDjrm/wakaC9K55pliI+xmGmCO/9JzefnppqUmmQLUvQF87ZtGV
 iqBbszyHpIx9Ji5TnR+UlTQ1p6jYGVsD83VKBIeU//DFU4fgLWbA
X-Proofpoint-GUID: aQwsV29RONVBtiyFQmQOEwI-DEaZ5Ydf
X-Proofpoint-ORIG-GUID: aQwsV29RONVBtiyFQmQOEwI-DEaZ5Ydf

The type that was used in this test changed to no longer provide the
member we were counting on.  Changed it to use a type that has been
in the kernel since 4.10 and has only seen a single change since.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/types/tst.nested-unnamed-structs.d | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/types/tst.nested-unnamed-structs.d b/test/unittest/types/tst.nested-unnamed-structs.d
index 08146785..0e3df66a 100644
--- a/test/unittest/types/tst.nested-unnamed-structs.d
+++ b/test/unittest/types/tst.nested-unnamed-structs.d
@@ -16,17 +16,17 @@
 #pragma D option quiet
 
 dtrace:::BEGIN {
-	printf("offset is %i\n", offsetof(struct rds`rds_message, atomic));
+	printf("offset is %i\n", offsetof(struct `flow_dissector_key_icmp, code));
 }
 
 dtrace:::BEGIN
-/ offsetof(struct rds`rds_message, atomic) == 0 /
+/ offsetof(struct `flow_dissector_key_icmp, code) == 0 /
 {
 	exit(1);
 }
 
 dtrace:::BEGIN
-/ offsetof(struct rds`rds_message, atomic) != 0 /
+/ offsetof(struct `flow_dissector_key_icmp, code) != 0 /
 {
 	exit(0);
 }
-- 
2.52.0

