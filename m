Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B962C25F98E
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913585; cv=fail; b=DpsyUGthVVvl1R7nLwpjGjx/ft5ZbT97xU/iX336YE2g3tWzO1Z4Li4curL2gtKp6WsXLcRSMXYsraQncnIl5ywunPBm9gVeQEOehTtL1JgNQh/EBNUiOG5CXnkzYa/ooq6VZFrnHeJCq7EcVPqyFYVIJr7/brvHoAweLk8gbso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913585; c=relaxed/simple;
	bh=MV57S00wPpczC9MqkFZR+Hyag7VA73wS2WZVCxNCw14=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SjJKOou9dRo94vwEqqaPxCVO/OXKJWV8L3MZhaBxwaJfvk96mzjtqg+9lQULRXUrzNZKcW18ajWOPBr0hTsUrXkua0dtGGFdPUtNdJCS2LzFf6tfDSQYeIskSQ7/Ij+UJIVHf5F+Yh/j6bx0TpWwdxCsLVukZilCDzTRBAbhcao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Po5Pof0n; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hkBCVPry; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Po5Pof0n";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hkBCVPry"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIMvEX025288
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JjOYXLUfxzL4UcDDYJ
	7xX5FSnyQ09HhkkWf/REA1/Nk=; b=Po5Pof0na5WxNCT/6J3CzCQow035GdNPHO
	2x3zE+80LALs6IgylD0nVbl/DKj+8u7xl918IBg8lHgMNBRTrAedjgAgsoewqte3
	Fur3jhyeTN+Wi8it41nNFSLEbIqRc3p1+LK5btc9p94lD3w11A1t1zvm2F7ja3qu
	zjKdO28qmM5Jydu3oNSFmFOtZiqOD/RX7AvDn5cFxTH2dzMJB3yL09LfmE5fRKhj
	GFm5IWhM5sgwc0hQgIbK4qzjDHTwK7ev9H6fkfSh1sdQj836ZfLwd7whcIkxVB64
	3fAjODsLpcIRn1H8jUpubr9YDkGaT1d3mwhTq592N1dhF8pR6pdA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dygc04ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QHrj3L020763
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:22 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82xnvu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrGO2CajM/VhpGfYLGnLEF0uE19wOohWgh78C+qMQUdZGRrF1Of7M3lzxIh4NgTpsH6hh7VJ9EvxVHI7WnJQIwvZyE+OwS0s7cgxkTFdBecgMHNR3OirUDmKx6lq4Y5YsNxPMqGcO5V4O0UiyXbh64EnSvKBKuliHWvBs2sZYMwkhKIPcmqr6cBY8GUZ2gFLCCp7eJLwxpA6iH6+30Mqc3lyg3zipOkk4RnwtgmW6b/dWljHLeywiOKmU4d7genz/9xyoTfPvdNLW2KjKDiDPavamcgJanagjqYTiS/M2u8ERn9jI+wHdzvIKBRWAM2Nk9LZsN4hCEnrJuLm2iFfvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjOYXLUfxzL4UcDDYJ7xX5FSnyQ09HhkkWf/REA1/Nk=;
 b=hzCdXHUhkbbWuc2T3lubyGGM68F1rfvHUrP12ghMNSDY+D3hnUZ4vS/FbGTo1qXY1c39fvXW+X+NG8ueey7EDln2OJsQ+Dg0sCd0dom4gElZULTNV/0Gl8ALwNdN0irbWktXwzTbEc2BuAcPJI9wCrqRqMdzPn9ikl8fOnjVZEIX1VZbQjoQ1MLTyrU56pnO9km7mxZA/w4sjvhSKY2oZsiKdwVXj9+AtVDuSjPn04uKnxZDuvrthSC5ZsVilEt9YE9mOoF7BN7yib2QvKntVh0Ju5bD42MrB69Zj4qUaE3RDwLoz+7zrwIGI1Z2wqltE0CGMZMlr18QkR+x4MSxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjOYXLUfxzL4UcDDYJ7xX5FSnyQ09HhkkWf/REA1/Nk=;
 b=hkBCVPryNdw69/cZnpXu3Qag1slHJ7bkLfbruIwt3lKdp/lZtI+3o6FLsACe4JKu5cmp/Qw+2tv69MRzQs0aYssHjcosetxid2wwxLXhAFIPq40GRFfCEoOMFP5NxL1kRsuxBNQrCcInwTKUdzl32WLp/0lcLUwoLKpPUG0KDSQ=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:19 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/20] doc: Clean up the table for string relational operators
Date: Fri, 26 Sep 2025 15:05:50 -0400
Message-Id: <20250926190557.8485-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0a3706-0901-43ec-98c8-08ddfd2fc666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IGhHVwSBfGKFcjqOdxmiqoLHi3ktjQm9CxHrN0Gt98tfKGrZ9CfvbcoXtIDn?=
 =?us-ascii?Q?VE8PuoPyvi9GKFZXboD1s2AK8uNPTM4NY9cP0l01GN8HDFKv9NX1nB9kQxK6?=
 =?us-ascii?Q?x0eE51jZerfsXHZWZGwemT73YCpZ2Kc+6wPi6LglqKpCSl2sGuoVXtT/q2/4?=
 =?us-ascii?Q?7n1UxOfbGqCvreCpDkoQUotl5G76pzLfTd2edInIj4N3hySiGJZ1O6LIy+Ea?=
 =?us-ascii?Q?9VAF+1dwObaHlE3n53Mc0SsH/mEORgNR8QJ7hKR3ronssbRbViCDEG0nOgZL?=
 =?us-ascii?Q?esXHhjg7VT5LCsdWs7SUweeB10zEcRCv0wgy1zVUxUX5htivGxc5hELM/ujP?=
 =?us-ascii?Q?9tIvR0EQcPV3Tfy1rCpu3VVPivT5bSpnkvjB2h3EA99vEFyq2pRX8B5wLF+v?=
 =?us-ascii?Q?A+kOjkmH/fDSi1xQnY1DWo7/3ZSKV2iU/0IZ5KvWLldgczH24CftlW5knkZs?=
 =?us-ascii?Q?eDTjXliZkuW/C68btcrDPte6pzRKaERrUCSjqjCO8ksiCT3Fz1IYvtyGUV+d?=
 =?us-ascii?Q?/idZRWZERTTKXtdveoJd4YDSZHWKHSOtuTL0vSrME8kDV4G3N4JMAuayempw?=
 =?us-ascii?Q?Ai2+1yvbxFhYPMkNSS7nYPkS+gvXY2jj5jXbQBWSmqh2i4Xzcw3juFC5hJuo?=
 =?us-ascii?Q?SFt7KVFInlfVooe2Lzq7BVwBK8mgkw0eyCsE0FKL5pcitHO/p2lWhW2KReA2?=
 =?us-ascii?Q?d/3nEvzNkFsGN33S50iuPIotJuvCh6iNKUJxbcBdHsD/XtYqCynfz1AN9lnH?=
 =?us-ascii?Q?ioZxvyYp6i2/5El/M9gXMAW2rfllgUnpPJHTr89CW+xopZrTLg+oriRr/bp6?=
 =?us-ascii?Q?6NHzs5REermvZmh/NG0eTvXbx7iEy9ubBWlMPidOugdrq0//eG6aWmfOs66H?=
 =?us-ascii?Q?fBsUkuVK1JyugJaiZosSRMI2aWbZF0Us9SdLYZ3mJWs/JiZi8Ro/vg36Uzj6?=
 =?us-ascii?Q?wEUpj1THkhOvNBr4sTedduQVk4vuufKdckQNrhj3ZbcGdKlSNjyL1mTogWOj?=
 =?us-ascii?Q?Zz/2URvZROxCpdtb4nxu8rP9ehFv3MQ5gdLgxo4YhUqOfrpmlCaiv/d7pEuW?=
 =?us-ascii?Q?t8Na4yqErh1wswKS5dqJlZ30e9PQBirHBUWMcI1EPDWDKDTn1kWNNXg1eL+M?=
 =?us-ascii?Q?HVD/ZYxHY4iAIdp9AHt9IV0XKxMKUPOhKiMELms3/NucR3aNk9M7j7MyNCyn?=
 =?us-ascii?Q?rpxl1QrrlV3PzgZb/hgZchnVsm51yQuTbFi2lvaFei+T8xHXaifBA+H0b7WZ?=
 =?us-ascii?Q?VORLOdyguaYYm7vZ0tSJPMhQCFg8joUYvoSM4B5XUgiY5I49zO2qU2jBAU2O?=
 =?us-ascii?Q?Yv96/yWFOU14cyqclt9waYwyKhtpcbc6tQ4E+Ubb5Y+tXEnoS3o5jll8i7zV?=
 =?us-ascii?Q?ojjmDKibgF6GYsai4uDiqZXyfPgyH2HW8kQhEBNB7txrJObl2erVLdWOiKqB?=
 =?us-ascii?Q?+lsTwdNBCeByH+RJMIkjbGi0A8ALxaaE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jSzdNu8lJMbD2Qr2GRa4v91y8TakwAaLeJD+UiwH6xInxzqnGOLrunoei19a?=
 =?us-ascii?Q?DtkeSPSgGkmWHlgyHWatdJDb0bBk8Ftvud2LxooHzrtBo1JWN8jeOh3Uk1i+?=
 =?us-ascii?Q?pMLLWKbbdu6B++Ctl4i4eFo8vdTPe7mVToFqIW4hswfouTWISHe0AUwhf6Ij?=
 =?us-ascii?Q?jqgMx+gq0vdx66l7rCQokE8cJpp/tJFq9XoRxNXfkhc9tZmXgrrx9uvkxFxr?=
 =?us-ascii?Q?/cJhDICzFAEQ0LR8ORQDSTc9VRXfsFQKb6o9/gX2p+j4w+X01oen8iF7xXt/?=
 =?us-ascii?Q?FaUJZzEjMN75yNAk8eecW3ZmuL/JHg3I2Me+YNLQ8wqE3A/1i43X3HFtKvHD?=
 =?us-ascii?Q?Z0+3UNBsnv7kvilGh2pIQapfSzEEoVrquVE4g7393pMtmoPxz/Lkv5+IGufe?=
 =?us-ascii?Q?9WtxJ69XFhh9IrsW+2snSxWLQJal1niC8uYXgUTxKTC2jQTRz8SYFQnAa3Hb?=
 =?us-ascii?Q?Q/l8OLTB4Ek3SB1zfb9vyQO3RLIIA5D1rPFgi0Fcc7RA/KOWVsYsuzMNl2gy?=
 =?us-ascii?Q?Cz+xMGy5QJg9ym43BRl4vEuAlRi987FNsldnlZxiVUMp96VYAxegLUpJQ/En?=
 =?us-ascii?Q?eZAVFzMjKC7AVu/jEEhBoZHgoq2jdTj8VdXYBXgsj0x8hGcvSpmAhIB7YGam?=
 =?us-ascii?Q?ef/GxV6Sr2xBX1Xe81zE+6p2TumfC7kQh6ZwMVvAzcd4eT3m9Sug4V4lOZ1a?=
 =?us-ascii?Q?nxKQ1IK7moo+1lr2+6j+UGSovn3P3i4aVDt90Tze8SxUMlFaAUeboGrIET8E?=
 =?us-ascii?Q?Rn9eNVxBNnTTK30nuXlkK02Qpdk+ISVev32gCfm5yap9F33rUIGwsYeepfba?=
 =?us-ascii?Q?aEBzKppPh1TjxyeCFKbGucFYf9MqCOnS6jGKUCPbub4Gwhhz1RBUzaojBGIw?=
 =?us-ascii?Q?ncWZD+OuN9UH3dNVbgMWPUVDWKHriODY+QC1IkbVOwhV5HDapOYhsZCeA6KG?=
 =?us-ascii?Q?9DhKWILfLtDaFP643sJLd+ChTZiGeiXZoIxNomX9kVIaApTfa5qmNHgQWr7T?=
 =?us-ascii?Q?Kk0MfR6Avls4b8CbihT1cSFy0bcFrgLpfR2PR9g5nzalItnLjEFR4H8jHRkc?=
 =?us-ascii?Q?8hTaUH4/464hByc3xr0aXbPdGzuarK6gZpcY04dIPYwNV66u3j4PyvIHgYKY?=
 =?us-ascii?Q?y6cokgLO3FFYFfO15Kj6HYxgfZea5LUPd5g9haOJLsswVShZluBvAnu6tH+0?=
 =?us-ascii?Q?qhciVOhJmPMSZc9mM+H1Zz00KYiFEi3mNPWtHijpS7jhmI0mL6uNDmvT5O0e?=
 =?us-ascii?Q?7GBVIWol63GmE6TMx9M3D08Z6dzM2NPGGN9hIaHucuWzYSIPJg9Nd0YRRfX7?=
 =?us-ascii?Q?PHz70HYduV28nDwimRTpQxqvhJtmjVe2LEBhm4twof3pRD+xGrygbulhCvfR?=
 =?us-ascii?Q?Jgzopy5WUNxxr8Hu0yEk43PNXHUGIcLhS6IQVwudu9OTSeDv4VmP6rCYuCYv?=
 =?us-ascii?Q?TEg2QfAh7uCQvm4idwVM/ljjmMv2/fmt/xA9ksl9qvBMUYsLxkqnR6j0XfaW?=
 =?us-ascii?Q?1ugGugRuOIvzVFyYNzlgFFPRuYL8oMa46/73ijj3u2nrpO/VQj/qLrSRowtE?=
 =?us-ascii?Q?rBNzQZNXQvyzA7BYOO1zVvk0ETl+XojQrOVgdIP0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IsHsYiAlwZp4aJNOjQ1MfO16S48p3yCOcd7ANXSituurLZRzUApITwB53oK9W6gvXW/J0H7cd34bt79Tbb6/8EnMoXH3DSgkrbBjlRJb1TA+8FqiXKBP8ELajS58j3IR2Bdve/fGMX34FRGPZV8gWB4WTduBRqGOz7QBt9jIvlJUf7WweYaHtCt1hJIwikyojXPkotrUPdy2q27tsWMQCoHRWIZyDBCdFJ5N1fYoftMLC6iP/EWjB+BXULOxdu0OkEKNQLscgp5siFjPQjcQbpDFKTQ4g5GM91Y2A7BbTHaAQktSZffR5hws/GFJZsd8k+nL/30elaSWk4IpzlYpig2V/RFssYPJp7zV0OXRSgUVG7wS3YvrBOyv9awXdXqgrdnQIWOTmahbh38a6xUF/8yiiTdPftPvSFc1cxN5oJBymIfTSzfCXL9OWz7UzfQL3ZlPyJ9p+kH4YIMu5kPxhpOaGA0vwRiM9V02KBijjFaYJXRaW5VT9a9JEAThN8sQhda6RzL1EVM+Ov2ar/e7u/10ERy9gLy0u/MyoHrd+/PaiqMOohky+Sl/fjwZSixLa6ZVGBa5bGe32uGpv7Gc0cjNvqwbsKw4yO00+5o5Glg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0a3706-0901-43ec-98c8-08ddfd2fc666
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:19.1542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnBHjTjTOihwYRRoFhscT54HNq9hRpDgf+Yh3ZbmTKTSDJ9CcjZvItbvo6FqTeisboLhxGk1x8nSXxc+bYME9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-GUID: YGZSmr9wS8aefovWyaU87AFryIMfertr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE2MSBTYWx0ZWRfX1Ei6R0xrYGcW
 WiAZ42RvDXbWDtkyyyteVTsvFJYZ6Gd+h8HCAdqlVq8dWqQvrvhvJVMqNnrGZGi4ftaLwz1+JYG
 ILhxRCUjLP7goG0irDPKhiJR14fh1B29SyoV5jn/alLScY0knl+nNrk1lpK+mry3TfGfhREi6tk
 2gkspeouWlicJO5oGpPvI7M4liTCqvuWeidbye/SdJjox3KB4HDtZR56z0816lq1maVhow9oDdY
 g3KyMzJVT6fVWEDaJmaWQheaCixZVSMeqSeH7oeoe11UJL+UarStGSweu45mD9RvNUhPSvDXyzW
 Bxza0Ipjxlj+RD+xc/9/OoBxCCpZOesn069dslIo8w9WWuVe6R9fR6XOPBVx5KBAhA01E3uN6q7
 nTQlYkAwcT+FADpmqBH1fYZZT/RClg==
X-Authority-Analysis: v=2.4 cv=N/Mk1m9B c=1 sm=1 tr=0 ts=68d6e42e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=rwta7QN-Za_Tw03s9CQA:9
 a=-dUJT0I-3oGLVzB2:21
X-Proofpoint-ORIG-GUID: YGZSmr9wS8aefovWyaU87AFryIMfertr

From: Eugene Loh <eugene.loh@oracle.com>

The text referred to "Table 1", which is not otherwise identified.  It
included a link using an undefined ID.  Scrap both, especially since the
table immediately follows the text anyhow.  Clean that up.

Also, the "String Assignment" link was missing its anchor tag.  Add one.

While we are at it, for better readability and maintainability of the
source file:

- convert the table from HTML to Markdown

- introduce line breaks into the very long text line

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../dtrace-ref-DTraceSupportforStrings.md     | 72 ++++---------------
 1 file changed, 14 insertions(+), 58 deletions(-)

diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index 38ddc4c08..af4e9de20 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -80,65 +80,21 @@ Scalar type expressions, such as a pointer or integer, or a scalar array address
 
 ## String Comparison
 
-D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons. The relational operators perform string comparison whenever both operands are of type `string` or when one operand is of type `string` and the other operand can be promoted to type `string`. See [String Assignment](dtrace-ref-DTraceSupportforStrings.md) for a detailed description. See also [Table 1](dtrace-ref-DTraceSupportforStrings.md#dt_t14_dlang), which lists the relational operators that can be used to compare strings.
+D overloads the binary relational operators and permits them to be used for string comparisons, as well as integer comparisons.
+The relational operators perform string comparison whenever both operands are of type `string`
+or when one operand is of type `string` and the other operand can be promoted to type `string`.
+See [String Assignment](#string-assignment) for a detailed description.
+See also the following table, which lists the relational operators that can be used to compare strings.
+
+| Operator | Description                                                       |
+| :---     | :---                                                              |
+| `<`      | Left-hand operand is less than right-operand.                     |
+| `<=`     | Left-hand operand is less than or equal to right-hand operand.    |
+| `>`      | Left-hand operand is greater than right-hand operand.             |
+| `>=`     | Left-hand operand is greater than or equal to right-hand operand. |
+| `==`     | Left-hand operand is equal to right-hand operand.                 |
+| `!=`     | Left-hand operand is not equal to right-hand operand.             |
 
-<table><thead><tr><th>
-
-Operator
-
-</th><th>
-
-Description
-
-</th></tr></thead><tbody><tr><td>
-
-`<`
-
-</td><td>
-
-Left-hand operand is less than right-operand.
-
-</td></tr><tr><td>
-
-`<=`
-
-</td><td>
-
-Left-hand operand is less than or equal to right-hand operand.
-
-</td></tr><tr><td>
-
-`>`
-
-</td><td>
-
-Left-hand operand is greater than right-hand operand.
-
-</td></tr><tr><td>
-
-`>=`
-
-</td><td>
-
-Left-hand operand is greater than or equal to right-hand operand.
-
-</td></tr><tr><td>
-
-`==`
-
-</td><td>
-
-Left-hand operand is equal to right-hand operand.
-
-</td></tr><tr><td>
-
-`!=`
-
-</td><td>
-
-Left-hand operand is not equal to right-hand operand.
-
-</td></tr><tbody></table>
 As with integers, each operator evaluates to a value of type `int`, which is equal to one if the condition is true or zero if it is false.
 
 The relational operators compare the two input strings byte-by-byte, similarly to the C library routine `strcmp()`. Each byte is compared by using its corresponding integer value in the ASCII character set until a null byte is read or the maximum string length is reached. See the `ascii(7)` manual page for more information. Some example D string comparisons and their results are shown in the following table.
-- 
2.47.3

