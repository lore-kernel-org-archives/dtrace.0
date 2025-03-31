Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B871C84B6
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457508; cv=fail; b=LqV/ejJUalhoMqhfQJZ7nHBLW2hp8MrhszZe2u5TR1d4g0yLPwjql/qQLDbH3n9jQjHDErvKPpY7BapAwf0rS6n8yBf/PpNvOv2lusx1MXo3ALszcLuU2T43oa+fsH8SzrhJQ3PHkV3Xf9otEzhx8fpl6V1ByjdR+YHNC86ybrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457508; c=relaxed/simple;
	bh=hc4NfxUCQzv6xn+4BJ4Sv2/AhbUdEChDRos63Cwuwzs=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=kcuUDcWTbhmBgd8w1wgIeKmeBXTda0Zot1gbWE4lqWeHpsw9YRSPQ8vM5VGb7ZGkLdKFuo4ZgVcBdLV8JtR/eK81vd2ihDSA/9VwkMSUq8EFCA+bq09/d/p2A8gamNBDzX1gXs8hhjanriAlFBCai4UdbtTQgSWKYCZ9bhFl9zY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cH/ig++o; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gTNQNM8Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cH/ig++o";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gTNQNM8Q"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VLBuM8025014
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=zJYb8NX8P6IQRxsFvO9Bg0uP6ajRO5ZCi0fpPgUH0GE=; b=
	cH/ig++oGqnKeZkVtLkAikcsS6gnlG/cszl6JwXjRCpV0neNgOWHMcYhSghV90mN
	WEJm6mw9KAeng/NQfJtH/bdDAEdnyE1/faS6ir5JkicBZzBlw25RdA1FIWxqgqUa
	N8HxJ1Mc4sBatHsSM+SlgpxH5gGBJ5xHHUsijaSxpbW2vqVpQp1SOfIAKdOJeFy9
	RpXhNDOPvrOlzGoq2gkRHArNrZwtLfqI6EH8ILR9/a7MXJ8ZiqnrrJ5zU2eCRnPj
	y8LX/2WcmsCZzyzHGLZCVHEX1CvoMdQ6VY9EirgTkH0mAN5lyzA+ph6PsYm8nHmn
	jTf7gxZCtBm+6AMm8FZ0pA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7f0c6m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKARcW003379
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a86r65-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 31 Mar 2025 21:45:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSCCIoKSQF8j2Orc+w57VnTYG71smhoI2RS2XbIqSpwKFxoIvXG+6pfZyZx7/yLoNfFX20cTFwsSGVpBeyRfXYIW64+Dh+CL2q7zKagOAT97Ima8BJxK+bCLo1ipIEyuXO+3166+Tt5TvftLDDI8qozyXl21YSw+XUl1lEIDhygwza3wSYieHVPV1Cr71X4QDGb1hK+bgqPDwnTmEDGlqQDmoHKfdvrANBSwRtg6a04P+VzO3CQnEFn+YSk7hZ1FDawDL3vQAtr/HpQdmnNlzOpCiZ4OqVVgqhmY0CAsXN1QNOaUcSx1hQx/llR+bfaCifzWMEa+hTXfV+VuBZRs8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJYb8NX8P6IQRxsFvO9Bg0uP6ajRO5ZCi0fpPgUH0GE=;
 b=SE7QwwnUyrWZfrPikgvCDT01gF82kHQ7wDGWV9ZnQ6sXLiUY3YFHpo9o+nSHqRBs7bbkjNJy7IRTpfpSylopcUE9WOGeuihnZAmWv2A5392jUm2x6trTPpkiVxgOVWBaK7mZ6XUsTitlsmS0Q9O09UKxr3pyrpj6QbCmQON3YQ0ZOj4KbZliWQ/o1BoKfBvmKv6tYcngjp6Il2iR+ufaE9N9v66UCPHlU0P2NC5msk49L3gcit1Jb+bXeb5D4QIuAk7BGODA/TAaTMdrVzOmuwRGjMj4bENADGOC70x2mAZTIFjGnR/LXZB9pPg/gooNSiCuREJJIQzU0EO9bkw6rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJYb8NX8P6IQRxsFvO9Bg0uP6ajRO5ZCi0fpPgUH0GE=;
 b=gTNQNM8QCGjxypWwaMKe982qV2aCuPIvNlTAxq0GdWsTSFL3lGbBj4HyanqEAHVX9NxyUgWS3Lj95trAVq7Uc3SWOZgT07L1/ujZ5WMAuUnGhiy5U5604f8OUCLOK/UG//NzzBV1rlCHklRjn0uhz+agxmyxwQE9WD0cGKzqD0A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB6537.namprd10.prod.outlook.com (2603:10b6:930:5b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 21:45:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 21:45:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Add a cpuinfos BPF map
Date: Mon, 31 Mar 2025 17:45:00 -0400
Message-Id: <20250331214501.24126-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 2952d429-0cef-4476-5d36-08dd709d4ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AN486bZg8RFlXdfsRgtj5nS5DmPv6ey6EdJf6QrFNR9d2ipZuRHiyUm9pWIT?=
 =?us-ascii?Q?bfiZsHpq+PRTJZcubt+bDEBp3LnLTUZqTayytwSwPANtX5cS6ZyRXMkLNwAN?=
 =?us-ascii?Q?6azKXOp84DqfmWnMEueyqJbuklOeQyzkX6QeFzYa4RXsdsJJqtQ/fgIhXR9L?=
 =?us-ascii?Q?v9TFW88JzySfpR+aOUpoLRkntPriN9q3R05JcJuFDoec7agwgSF4HDx41DhI?=
 =?us-ascii?Q?heSEbpHKYEoWk+T2Av/zSUfvCxJIPkEJHV9nL1Z2nRmbhtE/XKNcySSA8NtU?=
 =?us-ascii?Q?3PuWDf8Un4Xqor7YPGYjDxBdnwKCSnaTN/i4yuc0qWXQLt/AAsYFFS+LE8Sv?=
 =?us-ascii?Q?gPXEz2YY3T2h/91ILA4H/cg/W/8WkoAz9NVi3kksmktwVfTlQlCC5poRMfwL?=
 =?us-ascii?Q?mYccpB8s1v7d1H4bF8pEiv2zBoX4cx39VSEUFPKzu3DCqrlyX0eZ4YS9wn/5?=
 =?us-ascii?Q?CIVM001wcF3ly4E673PMzwUKb4JXBFTbg3A+CF0n1Mp5SgUDEKWFIhlfR8c+?=
 =?us-ascii?Q?QLTwSZ9EtSTMMXpb4zsKhb+TIfF+nKpyD7IVqWodnVWhTr0UvG2Mc0XLzoHd?=
 =?us-ascii?Q?ncN0GBqyqEwWXx7gceKZg8aAc1B0piHUj4cERNhJlCknPbSBHNbougoovEn3?=
 =?us-ascii?Q?f/lEFl5aDjNKWXmKkeJ/RCF1ATebUPbLcG2KYewWuiC/a7ukSJa/XKkGR4Ut?=
 =?us-ascii?Q?KsSZssvPzdVCO0ULtmPXCmSzSU/kGPB8uAdMCLkY6pqcyplbjtTSQnZfZVz6?=
 =?us-ascii?Q?sWrRktGVR7fLs3MEnJs//iHzO0cc3ftCAopxxpr+T/Ke8c8P+tfW9LdgtwbL?=
 =?us-ascii?Q?sF73tdC2Y61jC0bMq+Uj23lZBfTnPVPSGn7JAPaPACnYRqdDUQx6dXZpIY57?=
 =?us-ascii?Q?9A2QuLoaAZsFWA4bEBEd/3pKkKqoNNZjhpk3vrnGFYjiiIHKLAAP2gQ5kMey?=
 =?us-ascii?Q?iECWYgMVqMXwfY3s4Z43gHPgT75U7MQuq89YoNJyvKVM24d3ZDqEeW6Gh+uK?=
 =?us-ascii?Q?hMV4j7lwI9s19ZRzRlgddwWxN656zhxccsrblvryPCyuGA41TDkoobjwYEc9?=
 =?us-ascii?Q?UQgYDWmIM7OfGCR+mLRLNS2ub0zHRpYFSmaK6aCh0r6uHzgoFgkE80Fi26R5?=
 =?us-ascii?Q?XHyTiZw20qN2H3UmC33eI2z+llyZP1nl5+Hab6COvRbvvxkwZ25mWevulUGO?=
 =?us-ascii?Q?tOFlOgjAg8BVUOVSS3H0e+QpMuChGnaZ9KaieEuyCh140mR4IAFZc8ccuPeg?=
 =?us-ascii?Q?qTyHXliA68RUMKjsJy23pKwtHJSz8i0Z6Nt+vZlvzt1RiP+mLWQnF649oQiM?=
 =?us-ascii?Q?mBk3lPF1KbWZ9OvxQKnuaa7tmAFMGBcFQzYnGZQZcVAtlC2jWkFTj9kuNk7w?=
 =?us-ascii?Q?woRkkjUNKqKWYNVwiA9fQi/qBHtm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Nxp8qPsCoXCE3VaVOBiGUX7I8a+Wj5iX1CSUJPVCi2HLGAmrdhr30MfxnDv?=
 =?us-ascii?Q?oFEb+oosvtuXavvYZ8VvHCZQEw9xTC1WEIAbBdSuSZB2OfREY2W2qXVjJ2on?=
 =?us-ascii?Q?GvkX11RRwac7ygNk41otmYFhTi81iURGZslmjn2inaApEbV/GT7QgV6IbysG?=
 =?us-ascii?Q?r9JIJ4hHBedtS5Ba+dD3bEAyIzGG2miKmfHoanUMdwL6kMiHSuV8mBQdBXi/?=
 =?us-ascii?Q?zYf57xKbZFaapMGHi38zvCJ/Vey9w83SE+AqTvmdKMMZ1F84dddKmLJhCPtn?=
 =?us-ascii?Q?nfJYPXlNzouAkaYraaYex8RauvfUTHeumefgpuJuCzOmSoMzDNjneO+tZyw5?=
 =?us-ascii?Q?XRH82UjX9mhoZgrjthxSV/HmiY+wptk7etsBj7RBkETMwiSm1MRjDGEh+rOW?=
 =?us-ascii?Q?Uzw4uvECff3efd23s50TXJs9/59Otk9Yc2NvakcMeIwr3K5BKffea4PnrY94?=
 =?us-ascii?Q?iNbb/YBxLK3+vAPUGuHMfrQPkxvkSvsWG8D5wFF5IHsucEalnOW/Ee3RDP37?=
 =?us-ascii?Q?Xei7jhCe9qGA7hOJVjg5qi4WMvhWSFtCN0NPDuxlrys68dJQIRJ1MKKaxM2q?=
 =?us-ascii?Q?na3X4vxA333ZKHX7vH+/B846k9Sw7txeZtOWlokQfcOFPme50e4K7cfozIsL?=
 =?us-ascii?Q?ObxtKhLzI6GuoVWht2UpX7RSElz5u5imMVcmRvhELZCGmUNgz7/lZPgZ+LvH?=
 =?us-ascii?Q?FWUNnBlw0XWPDSLPBY05TE/c/3k8p8wh0DzhECvwP/ynhHyPN9oF3+1uucWo?=
 =?us-ascii?Q?BLHNR5Q9TG3CAZAeeXXp8PVO+4SgZ+gVHixDhoiYsIAhUjSsq9OVpi0+Hqv/?=
 =?us-ascii?Q?y2tuYDVJw20d+EwKQN9+SnJz4F+Pll5shb1kPS9Af7RfTMiUTfIth2lwrpEj?=
 =?us-ascii?Q?zNi/T3g8RStK1W+pXq5utZN0rDPLEMvhDb4NE2cI+efWklFoIbZkSYP9ukLY?=
 =?us-ascii?Q?sN7dVOyFa48w2ByeNEmukR0pcvg525SXIhSUPo13FEX0VdtuCSgp6Yw2YfY6?=
 =?us-ascii?Q?UJP6VNK9n5i6VyOqR7JqX/QhwCMkYYf20JcctDuQjWoHUJNRvnBgLlF3w6+S?=
 =?us-ascii?Q?AUFXvHfhsP8nprFS+dQynKx6Wtwm0YUDPkpPc1CzAeY/IPV6P/+EFNmedp2y?=
 =?us-ascii?Q?iriDal6Wqekj8Umb475e3d/vI/gbfwrC7cNIVOWgNYEkRTl2XN7WYsO9Y6Ma?=
 =?us-ascii?Q?SFoH5kE8m5rncuYH3A7d0qKWlrHYn1OAXHCQ22CHa1iTAnuGwyIsEIaenio6?=
 =?us-ascii?Q?SEbJ16tnwHXDXFy49szI3iLKGVuH/3VkfaVuMt/MCj+sv1mqAymKNLwUMmw6?=
 =?us-ascii?Q?PVmWabF8nSPR3ihM4fcOozKcK/ffErSXzNIiXxOoEElMrPxB/yTv4WICQixp?=
 =?us-ascii?Q?dPoYh2GTJRdUv96a2pu98oO36Kmgssa9+VLjJvJbUPks12Vx8V/4XMnFyfUr?=
 =?us-ascii?Q?EIphu7lJ/kea5M+GogN3lTggvv1vUDRTOp0/DPW3USk97OlPxdJhAKCBfC5Z?=
 =?us-ascii?Q?Vpye7LybmPzz0mNCUbv6aNOMxzbDnFIwESqyS+2VDS3DYexXfzSj9IDCeHvG?=
 =?us-ascii?Q?OyQkStsZdJAUjJmOlpW5w4aUI6+6mz/FvvHDFSV0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1lxGceZ9QMs9kaAVVATuCV9bifla6ynVeBYBc6WhiOj0qlTBs/7cZ/cGR9W2GGC0QQRStvp3rcCtkoR19q3O+kP13RpxaeRyMraEQ5E2GU71T+RexJBmn76FxSG0zEsFg5OpzTPvqeqy5OacOn3rTIN4FFGFI8iwLX3SRxhMTNVZXTvm7fBuM4LZ1n7qH9cao9UUlakti2vTBJVYlIwt1PQWFboJTb5wz+Ju4pQN3ZzjGEWLxih6QXgjO+jkSYTo2NDZF8QPpQxrsl/bthMKwBJtVLbYV73GpuiL5tZa2xlezQVstZx2HMHVqUhcTqyC0/5xHUhmw7WqDsgXONn5Hl4gTbELMeZerKVb9Z8u5bT4NnC/lwp5dMMJ2xUeKqArTPdMwQVxpxm3pBEQkr3V8oeZZjGypxEJHqzQUTWZ4d9zta6phRK7zQtxBlQ5Am7ggKwXiR00Rplc4hA/ildmNfEJHzkV6vM8pbleCcfKxadEbbNuYaQ/NPnq2RkGfZSctknfT1zlL02Ihhj920Yi0Gi0lCYlAf4fHaoKzs1vohOuRDiWuUJ6uUpSf3W0FkW6ZB4379aPpHbJUz6JEioCSvbKFyR2TPaV9QU4g+1T8Ro=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2952d429-0cef-4476-5d36-08dd709d4ad1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:45:02.6079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/8PNi7ozm9C6/4vBM9lSrnPo0yOU4nc9jHi3T0/tBZhMtdmoBpmjBcZWE6egv81K86JtXxmX0UWU0XHGuefVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6537
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310149
X-Proofpoint-ORIG-GUID: Tsorpo6t4WM2IfbpTfmIQhpsBsGBgBZT
X-Proofpoint-GUID: Tsorpo6t4WM2IfbpTfmIQhpsBsGBgBZT

From: Eugene Loh <eugene.loh@oracle.com>

The cpuinfo BPF map is a per-CPU map that has CPU information
on each CPU for that CPU.

Add a cpuinfos BPF map that allows any CPU to access information
for any other CPU.

For now, we retain the older per-CPU map.  If desired, a future
patch can migrate existing uses of the per-CPU map to the new
map, decommissioning the old one.  This would include map set up:

*)  libdtrace/dt_dlibs.c:   DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),

*)  libdtrace/dt_impl.h:    int dt_cpumap_fd;

*)  libdtrace/dt_bpf.c:     dtp->dt_cpumap_fd = ...
    libdtrace/dt_bpf.c:     CREATE_MAP(cpuinfo)

and map use:

*)  bpf/get_agg.c
*)  bpf/get_bvar.c
*)  libdtrace/dt_cg.c
*)  libdtrace/dt_prov_lockstat.c

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_bpf.c   | 13 +++++++++++++
 libdtrace/dt_dlibs.c |  1 +
 libdtrace/dt_impl.h  |  1 +
 3 files changed, 15 insertions(+)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 6d42a96c7..8da51d6b9 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -786,7 +786,20 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
 	if (dtp->dt_cpumap_fd == -1)
 		return -1;
 
+	dtp->dt_cpusmap_fd = create_gmap(dtp, "cpuinfos",
+					BPF_MAP_TYPE_HASH,
+					sizeof(uint32_t),
+					sizeof(dt_bpf_cpuinfo_t), ncpus);
+	if (dtp->dt_cpusmap_fd == -1)
+		return -1;
+
 	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
+
+	for (i = 0, ci = &conf->cpus[0]; i < ncpus && rc != -1; i++, ci++) {
+		key = ci->cpu_id;
+		rc = dt_bpf_map_update(dtp->dt_cpusmap_fd, &key, &data[ci->cpu_id]);
+	}
+
 	dt_free(dtp, data);
 	if (rc == -1)
 		return dt_bpf_error(dtp,
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 21df22a8a..0f19f3566 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -61,6 +61,7 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(agggen, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(buffers, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(cpuinfo, DT_IDENT_PTR),
+	DT_BPF_SYMBOL(cpuinfos, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(dvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(gvars, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(lvars, DT_IDENT_PTR),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 68fb8ec53..a5e42801c 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -390,6 +390,7 @@ struct dtrace_hdl {
 	int dt_aggmap_fd;	/* file descriptor for the 'aggs' BPF map */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
+	int dt_cpusmap_fd;	/* file descriptor for the 'cpuinfos' BPF map */
 	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
 	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
-- 
2.43.5

