Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478572FB097
	for <dtrace@lists.linux.dev>; Fri,  5 Sep 2025 17:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757092051; cv=fail; b=D7ej7CglNVPpNjWJOEn7iVt78xiaO+/xeo7StBWygvgP24IE44LFIwWrY5pzeRnllJJx1vRslM6V3kht0NaznCLWQc8u9koCLp919HQrF5wRNfyYLf/PPj8r1Y+d6Zh8WLgcBghJzM6TLjQsa0CISLiA7DfwMKqUI1FYrwrJZEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757092051; c=relaxed/simple;
	bh=7MwPm6LQnCzFQ8SlPxSr53hTWJTSYbV6PPF4zjH2pKI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nd483ToLQQafZ4aVu66yRSKuVrd4hsz7KDu41n7gNEfx1r94KHxivHk2JYabsYPUOw1kwRAwkOlOnfG9im9vvpdoEpJ1ZpbO6BrjmFnAX0Jn01yTYn5ex2AHNLP2KLaOHtYekTjdcqL5fSxrOmRcEmLD/AxU7zTKBLqBY0hTEx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pW5QNozr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J3vHCxf+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pW5QNozr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J3vHCxf+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585GrOml001249
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 17:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=O9btYv8WMyqH3e3yYL8keZmkq06n4tWEBQCzP547qKA=; b=
	pW5QNozrMgLoUEhe2A1sisfSO4MCKchVRHNvuzgk62VYmjkQKbVfKQ3KV1cxHUwr
	OVmb09v+Q3mP6WnFUjcUykmHBCggkwLDibwYQYkiCXjbCB8GlCXixi/HLFlMh9CT
	LoaYsNzkf4Mofm7iTHOEE0z/vjeN4+QXv6UWX77xKYLDBZu/N3ozBQIGNxNjSa1p
	5kIptHJU32R+UCaEJneYgyc9F5ZsvAJ5bHPYNiGywgUjYwfqqasH9Bd+Sv1mX6L0
	mmqOBX6MJneGKnmWBneq2e4LA6I30HK125Od2/7/0UsvHhMt65SStKMXpIsQrqnT
	Vy7Gvh3RbcppSO17sr621w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4903sg00rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 17:07:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 585FcuSv034372
	for <dtrace@lists.linux.dev>; Fri, 5 Sep 2025 17:07:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48v01sdru5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 05 Sep 2025 17:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fENDhdMfhD6Yj2yg122AuNXIOdvN2Bj6BxpagkICqC8JIi8wGsnkXBa5sareyH/Xp+cpWPmiOZ7WG97Azo3ZQLE9CAzNAAmhrmSeFANBB6W0o/77TdnvZaHnViGTIEPRV8n1tmINB0WDVFTvIi3Gr2QitEL4NzJCBEfaeGF4l1S1tB4qQ/+wLAbMpZAQa/Nyv3VtnpT6EtoADChdC1p5No3UQ0nSYm7ImF0msgRGJmt8jOP5uPWdmrTSlt9pu033hBaNRcc2iZ9KgzsJSt2VVNPgqbs08PQ7U7R22rpy3tGc1C61pktAhsh8BC0dRNVhu3hWhhk9p3p0hiLAsujigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O9btYv8WMyqH3e3yYL8keZmkq06n4tWEBQCzP547qKA=;
 b=oIhl3HBhMkQQPPhJTCsP/OkS4Nnygj1keBpavWaks/ySOGF+i/+Wq9tOFvMOQjKjANpYtQ6LccMmV0siN/dBXHGFcMFB+YCmBLfwK/1UAiE2A8Xrp/tXcJNYb2MzOV07TsBXpTtCiLtWJiMCRfDBu6DlD4Ss695N+ro3fwME3Th8iHS3vRSTAtsPYdZQrQhQj6RAy2WRyXHq/o1Rtm0qumricIgnXj+ucF9nYFLTMqUoK7t2B9E78LDCZwMxhl9bibS/299AzbUkJ1dBm3CquDCH0O9oC5z3HqqDU/9+FTE6kWyqNzYIpocgOXcbLouj4A5yECbyUZ9UgdB363FNyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O9btYv8WMyqH3e3yYL8keZmkq06n4tWEBQCzP547qKA=;
 b=J3vHCxf+GU8ZP+vc8H13jeoJCXguSzdsDiIztDM+ueqa2mn/LMDtqvxz8+8O5C4ZMvYDX88IQposRbL3wGBxM1VhmVbA7At6w6+ujB3XqlY6xkhmNKGltRKPTnwE6Vso5AilKNuwmMIhTmFSh5rBWSeqSUfcIiawlnKWb+8FfKU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB5990.namprd10.prod.outlook.com (2603:10b6:8:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 5 Sep
 2025 17:07:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9094.016; Fri, 5 Sep 2025
 17:07:17 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/6] Convert ip6_finish_output to rawfbt
Date: Fri,  5 Sep 2025 13:07:14 -0400
Message-Id: <20250905170715.11981-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 26fd182a-0122-4035-f72b-08ddec9eab1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OLZov9OqsG7IzD3M3JKv6tImdjQ89zsMQoGjP2TMPROK1jkWhH9BOaKdFtCE?=
 =?us-ascii?Q?nI4aBpjV7mVSdZa8SWEHRuwzfVQfsV7UiCnQd4bowXnn2ydxAg5Vbw/u5XWC?=
 =?us-ascii?Q?8uKg6cKZHYk95ZWuUFjQ32bJzewCmdF3UzzPQ+wm4qALpY5G7eE/beaeY5wh?=
 =?us-ascii?Q?7E4qJxpxek5wfEE20PWCz9u79DyQCGGE1pVLkvamWuKiUrvSbugz/G4nG4LV?=
 =?us-ascii?Q?Vng9lAH7SCcfwtkIMgqkFJIA/77rmjPUWYyVm75fPJau1jxobVqgCN1ItySp?=
 =?us-ascii?Q?0YGkqDEeQlNarS1Dv4HINpNi/9EA77Ql+qgQS+3NpLflxiA0fCKuZquKx+ft?=
 =?us-ascii?Q?AAdgxiixiT/bBf6YhNcXXJs7LA+hSoKstxr1xw6DJo3o/9sBUJPKagJqnVMB?=
 =?us-ascii?Q?Tsnh0IZFnlue6TZEpc5lnXhC1Ip9ro/YDWO6f+cIMKbTAVM0hMIYIKAKk77d?=
 =?us-ascii?Q?527mcc5cuRW+MFNqLTqdMIW2NRSRt+/x7t1CaZZvI/27Hk9YXBYKLreIywJs?=
 =?us-ascii?Q?Ck7qDsP74Zntp4GPsWBzgoKufkfjCHM5853vo10q4zTcU7N5ChNllFFRzKIC?=
 =?us-ascii?Q?eFkvnAxgoU9qkeuK1RSvCvZMjilD1CPBtkl3gcQjlu2uOoQFoqoVXKAl43v0?=
 =?us-ascii?Q?dIzkIpW4VxqIkOEDjeURZk6uRNIMXQTDb4jTE6TAHqkAeMEXS/MEzsI83WJz?=
 =?us-ascii?Q?ULpjbIiP0iUDwaRyN/9xhqv6fZW4w4ezPyh+mBamf8WqOxDjqhDz1y+/Usxn?=
 =?us-ascii?Q?fXt4ZVBQ1PE2tfLV0hbFI/BmSir489m0GV6Mp1EIogkqKpzYiMZnLJpN+J8g?=
 =?us-ascii?Q?CDxytCFaV3wtH7JaqH/q7yycZRPo9UoU6DPrrYisqbJnIrDkWW6lKkEyKl3s?=
 =?us-ascii?Q?NnYOd5nwkcOz2DM3ldPlKbSOZenpwg40+6j9vYkwHYuz+nTAYQ0gOZUy40qv?=
 =?us-ascii?Q?aY4sQOEJt6daUc7WL/ejzVMegVKddHYQhH5RFffgiLqHhtX0Me6L0dAe7UQQ?=
 =?us-ascii?Q?TZW8WJi6lPPoxpkzUs9IA9wVvyUoH1M8T4Vt51tETE2pdKDKV4mty/swqd3F?=
 =?us-ascii?Q?rTq7TOnLiLylIiJ2xzakKlyQ5zPFoz9C8Qka0CG38oX2F9kfOjFCfIraqTZ1?=
 =?us-ascii?Q?l84j1v3NN0jFhscrFhY1binKgm6sQDuuHHxPCWtFhcL9dCB+Zp5Cp/fb0qLU?=
 =?us-ascii?Q?4aPOBDhV015hzIcXgoTEiu1xbKWMmWpZk0/q0iCNwBFdUy2VSZ8L+2XjtJi0?=
 =?us-ascii?Q?RUhpouiXbbWnOXGInUiZNsDp6QwPVrFmLz8Wc00YoZCC0w20U+qEeGdswjR+?=
 =?us-ascii?Q?51leBGT/g8QFkkHnqfpzE+uHYnTGLv0yfQK0JcaMzFjHS9FdnNE4L5Pz9/nN?=
 =?us-ascii?Q?Ci9uWk7rMfJ6LurYprDUipGl4OWAemyAiezCF3KZqChDlyoSgFm14EsHovZ5?=
 =?us-ascii?Q?F+Dkc5z6c+Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G1lY/zNKXC3liPhcF5tZE4LZPUzfnM2HFnwymk9X9dawh3WOEMGUCpjukDMQ?=
 =?us-ascii?Q?6HV7yTduX3s9ngR/vRdrWL/EvA6nlekmAToLw2wNoRmnY65EE+3SaX4bvXnP?=
 =?us-ascii?Q?jn4z44Pli+gy38R7a/hW4rApruxdh0t1kzkGpPIq+NqddTDYgkYbd97OvAdP?=
 =?us-ascii?Q?HFMPtLNx6WCLKzDEG8voDiiANjQElS5M+u92t3DngW7ba/HDliD86YDn9sWe?=
 =?us-ascii?Q?UTTE/+y4yv6AaCwZxffVwg8QKtiwVBp8XUA84Oj1gVWLFI6/nTPwDSmjsl63?=
 =?us-ascii?Q?avJcYEJpJjgu1dhd86qaPFRCAvIDlh36cpkvekFmbbc2pK8jorrLIhqUK3kl?=
 =?us-ascii?Q?CeI/pjTXyGPpINTnsd20Ttf5dLpjoJv/yQgdObd9cj5s6H2KQcU1QxbKz+oz?=
 =?us-ascii?Q?O3sJ+iVmfVMZU05rsm1GA4uoPgm+i5heqeaRRbDyBJqNsqscMxJcX/Izs6pY?=
 =?us-ascii?Q?SFlEtMwLD46wBCQe8C2RKHlbdsMo58kP1CtqmsZjJnMEphpvRC1JT678ML+X?=
 =?us-ascii?Q?KT8IvZTjigjn48elpYG/uhrZTDORgJeLsWHoHQ5bj5twRU4zMgZEL06gRwvt?=
 =?us-ascii?Q?WpX05cNCfLiNPlcOtm6hySvVwBZSKujkDlkNZ+POMc2bz0/2DZh21XQlaiMn?=
 =?us-ascii?Q?uk6OJxMcRB95ghu3i6j/sziKSd+8HJq5BAVAU6svPGxxCPkMNv/4flXjAZIR?=
 =?us-ascii?Q?XsX1a9r02WeaWwB0ZK+hrHicbsY0dSXI/f30HVNJOaiZ23dn/2XrFn1J7qgE?=
 =?us-ascii?Q?PVGB/xJ7JGyEEtNZC+zOWFrIvlN/+DGwtreyni89dqOQlfuB9PIPhEt8B9Hj?=
 =?us-ascii?Q?fOTShOLqNu4o6OFA3sJHBOSETE4zY6xxvBhihj/oXL3SKkJxyF3xl455JaT+?=
 =?us-ascii?Q?XnqJvFIKKFxlmRlnUZVb4rgvG1PPhNay/ZVv9x08YLio1JHjNqgGAqg62xRk?=
 =?us-ascii?Q?eviC1cX560HTg+rZ6vlsUN9g+KL1rxCIu4FxUvJWdgXFfqD9Z8RYT5kpsRDm?=
 =?us-ascii?Q?M0pi/k6E8USSihcDG02kvq6Mgpn7eMRvb/MB0/wH9TdbM8r5v027qwkcqS7R?=
 =?us-ascii?Q?R4LAgLGpgzW1qyFUwsgkMIeb58cf2QuBXDvXmbo7ZIP4id/McIn/qTSMpOpm?=
 =?us-ascii?Q?Bdb3QbtPtZbsHUBMBUJFmSIno71YwWO7FF8J+N/gRTfA6c0sAWHVulT5UAFb?=
 =?us-ascii?Q?syKrjZsHNeG9VFxMfmA4lQGL5KgOQr0b5Cy9HeOpiSFVF53tVszlrbFu+brF?=
 =?us-ascii?Q?XOf4QQfrw6ZCHrwN+1sntoU8XEIrVwZZRpOYmQ4qzbTqf2IskjlTHaGThCK1?=
 =?us-ascii?Q?Spjcd3zeANg7mlZCBYdFhXeVDPltWydHt3Hv5cZHWEvDqDqGgubZYrPGVNlx?=
 =?us-ascii?Q?cA/aD4ccXn/J7Cbg+z2kVEC4PdZ47LeeuNKfaIoClrDhBrfLasubV+y16mtr?=
 =?us-ascii?Q?BhUVe3UJJWyKDLqympkVYq66YfBkPAZsrtR2aFzh7DNqtAN2seCDkfXSinbe?=
 =?us-ascii?Q?uaOM6e7ph8Nb6gpAlTeFBSOWQQbN3ljx76so8xreDrByGRqze7qNKJiSsWKu?=
 =?us-ascii?Q?6jPZMg6y7BFpoUFpbHyR7omzOvzj6a58J22tind7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WeL60NfMRDmGxw1QgbfuIvz2ZJzdhGCMeHubfDNN6ecYN/HEz2T0sFhzLWh4WHCE/ya3AMchFVfJl1eosPgQ+bNsg2mwi8EKA+YNIlgIs0K405y+fh1n3udCafOfW2R9WYaPqkCUezFLyWROZljas7nz/d5qDOWM/6gZhBHPcpiqA8FdhDShhd/TCazo2ilBnv1l22l74CqbvIBrTgNPp5NyBhC9y64w4fW2ieNCHyIYu1Pe3oNMqNNgj6stv8aTPkfi2CxbtRbSUKJbw21yd6SsaVd0Q2SrKppnwXNJyVPImreb/Uib1gkFklF54L8ugt6m0jAG7s+hjY1PuP9Eu7AP7/B+MIWPEb3+fMLRHTexGNFeAUdwPxEEebbzi44AV0gCtVWiKYbBTf1CLhW74MwyzkKyHRlKbxMJ4n77EB47SN283VstHNH401Dw14ZeRCFAgXeiRDZQ3WQFbYscJu/JjinHM1XKJP7PO0mZQ/3iKga6QErhNumQ+pxE6g5gEuZ4QOSZcPZN9Kc3DnjTK7nfmkgh/juvbex/4DjaHv5c3rKqgGCIWpLNrZ+n3/3USH5zcHeP6CmXy4lr2E/52+hpLcvjKIgfW+VFk+KLTS8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26fd182a-0122-4035-f72b-08ddec9eab1f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 17:07:17.9230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: baPomhVLh18lPuAOmbXIAVx3wRH1Sv6UQ/TRsNPRncUNxCGP+tliFa+XVz786Qz9ewaPitiqykvGtFF5IeA28Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB5990
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509050168
X-Proofpoint-ORIG-GUID: kR-Ym3fH_G16FegMfd6MeVUlwPWyoTIw
X-Proofpoint-GUID: kR-Ym3fH_G16FegMfd6MeVUlwPWyoTIw
X-Authority-Analysis: v=2.4 cv=UYlRSLSN c=1 sm=1 tr=0 ts=68bb18cf cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=qWgwPIQmfNOtk-7Qan0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDE2NCBTYWx0ZWRfXzf57gmLB4jgs
 Sf5I9p5ZSYBhP5O0tYMXAYI8kes6XjNN0FBImsF4+ZG+MQstumYjRvghp5304407/RZP3kFazOU
 hBjjfqEPSHRXtuFevDQFGOGqcYHsNAFUudI94K4xX5C/DQg4c41uw1XpW6B/nSWtADmliWBKTx7
 qGQiqc/SL0jebSUTXFCis8qUZyHVJ5hQp4T9bzhCcC26v2hRxag5la42+wxVX8TbD66L3BXTSMo
 2DwnHMmuH5wv2Z3+Kofb6oEHfQYT02AAjUzE+uyKX8LB+Frr5NwSjn0vg1c+eCRZL+H82HYqCt6
 /flwlkQyjtola30QZhPcDsXUXUDc3n2MDeS1LIQ+XJxXLpRibbsDf6ougvmcCs4IJNDE5v9Syw3
 CQGfGGUu

From: Eugene Loh <eugene.loh@oracle.com>

With commit fe2101e55 ("fbt: implement based on fentry/fexit probes")
test/unittest/ip/tst.ipv6localicmp.sh started to fail.  The problem
appears to be that fbt::ip6_finish_output:entry, which is needed for
ip:::send, does not fire.

Use rawfbt for this probe to revert back to kprobes in this case.

Other fbt probes may also be impacted, but this case showed up in testing.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
---
 libdtrace/dt_prov_ip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_ip.c b/libdtrace/dt_prov_ip.c
index e0919806..5384346b 100644
--- a/libdtrace/dt_prov_ip.c
+++ b/libdtrace/dt_prov_ip.c
@@ -25,7 +25,7 @@ static probe_dep_t	probes[] = {
 	{ "send",
 	  DTRACE_PROBESPEC_NAME,	"fbt::ip_finish_output:entry" },
 	{ "send",
-	  DTRACE_PROBESPEC_NAME,	"fbt::ip6_finish_output:entry" },
+	  DTRACE_PROBESPEC_NAME,	"rawfbt::ip6_finish_output:entry" },
 	{ NULL, }
 };
 
-- 
2.47.3

