Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344736D9E7
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618600; cv=fail; b=cRC3rjmFU+udHe7PfFfkAXmCy7BeupHOvh8NnoY9Z5gNzGPUqUAaetog5Luk2quKNeifminMy1T88VROcUZzHfj2u7OFzqHSz9QwvLyl8OTyoiZ38JcXlTWPJSqWBCgodb2lH3J1Z4cmVo3rn7H/bWebK2zC1imV46IkychC3AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618600; c=relaxed/simple;
	bh=h+DuCuWQZS3Kxjihqd/kyLus/zvnySzUreq9bzFOvNo=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=KVmM5NBm0/OphcVrDZosbUf5ickLB+vtM4AdwSNe8YE316NUJR0GtQBgd/5LrhMkuebesF4rD9UdTnYTU/BWgXArrnxILUtNyIv8SqTHZc4EIKHI80u6EhiWBmMZafbNYxFJjjkXTyxDpDYJVcsjV/bmkpmiA16HQzLc1EtEtcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VzWPuYPB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ShsgreZA; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VzWPuYPB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ShsgreZA"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDj2NH1697533
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=VVs2JuxXrZ1tZCrsejETALr8ilwiitw30N/zbYPyWmQ=; b=
	VzWPuYPBfbF22XIAtiDIAGMShKIxEJFh+tobq61iJSo7OuMr1q4k7loMWIeDJx5Z
	MfI70liiKd3xbW18zJ1l9/MAXJypoTIUuZF1qHWnc20eCo5+uE/6jURDBkvmbPOF
	Zr4cwZ4UJTnR+xKEIQj4yH6zE6eTY6PqdBsXW8dnCngcbWNfbV5/v2FNg4W1Cc7k
	aPombpL/8dOFzMau/rlejkhXkZwQYB26ogcfe1Sy7Y7B6J/BWZyPHeEvEV4wKHud
	c/BwxEvinYVHrS3fX6vqZx0eAfZL6YOS+aNUeTwjJU4Nh18TB+Rk4bz8lFYXBJFx
	twPJRSlSFiQYsa+gWVCkRQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4fbbauv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SHoPXs018940
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:17 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012021.outbound.protection.outlook.com [52.101.43.21])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gp2q1v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 18:03:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJbIlDAl01sGV7ROu0dSGKCxN7OYxv3BZqQgd+ebMZi2utJYKpClVNV3ZXAGADq7C8bW7pE81tL7EKWecH6lobBSVKlsl9mL//PZDYqLmzlbp4FfnCbC/6iY+MbV2/zsKBCbK57Jw5fHgfXXDX+/p2gAYeP/msiUYnNEo86ahCZfq8zYJRxBNbVGxVjyUklgEjTZOkaZOxb1yNODXVY3otiAmvnHRm3PFIeiJ+t8IKFCQpbGRY1Tv2qP1iBPisMdyY1Sl1RltGtTJhHuTnptv52rg7hcSlne2Wec7X5mp/cEL1/IlGiEhjaaFizKgnBK9GFuZQKizzOJJcOvQoWgnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVs2JuxXrZ1tZCrsejETALr8ilwiitw30N/zbYPyWmQ=;
 b=T10VjbvORTMmQrx6OJEfB9Cm7qtM9vlZKtYaLXZaJl0FbbH8WHwCvq2SYZNTbHigXd6vb+A6Iqi0WPBccPhngmUe5tpjTmsprChOO2mzXg16ewf49Pvm3qSLnBLQCliLlj0XXRkyPzwwO7cj3uiyPf1RzpR4PrQ3YhtAW7ItqyK1VtkaFMJ2jYxrIMfIPZZ9oRg+wBw7tPiuiYvNepbj90+YkAYx+Uh3nSB+v6AkiYS9aCGjTj4sfuoZHbSejZrK+5QbivlMAtVfPsE95HAFfIVOD6F6KjdJLmbT76zbtXk3NtH0baTnt4l4h6t5BSPoGEw3tFfiXyy8MAHIvtoYsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVs2JuxXrZ1tZCrsejETALr8ilwiitw30N/zbYPyWmQ=;
 b=ShsgreZATG8Y2bIcsmBQNAbFei9MB0/Q9wzB+VFq6mZZ5L4NxG8wlbxAkGXy6MfE2IIN1bUyIO7FEN3y+CuVDTi1mg9QuTHAoPf0XAyO6ZxWwyH0ckc+1/TTDIPy46mhT1Brd3++B8xSlLQZVSt0699NZZdIo6IzBXClOA5q73U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BLAPR10MB4948.namprd10.prod.outlook.com (2603:10b6:208:307::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 18:03:10 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 18:03:09 +0000
Date: Mon, 28 Sep 2026 18:01:54 +0000
Message-ID: <fc105162c29955947d9ad85ce981a739@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/8] list: add dt_list_empty()
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:a03:333::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BLAPR10MB4948:EE_
X-MS-Office365-Filtering-Correlation-Id: abd375ce-c2e0-4b27-dd46-08df1d8ac109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2XJFcQsYLz1KguBcOAUinPjcbmyMrBT+VAX1m+MV9SRqHnptp7Hb1rllQw9EeiRyIwEmm03L+H09TS3c1Pp64B9wsEbpFvefndCvFDUv2YFrXJ0BZHToonzG9ySD1ZxRh7R/b+2YRe5BBujlUkO4MTzo2iYVSm0U/FjKefBeVFAwYAEGMkUPlu7FbYKA+mTbYFy5gQ1oWww7E9cxNHvNEphtBD7+uMKy+rN9EiDjC4Q0A55/SPrO9PFZNa/LGiHZMAwPQqPSoCu7g+FZI4iexMB1Z5vmAOPJoXo8dnJIiyIsQRR4fg5YQZ0wDxrodgg+atJaWpYhRvgyXGeu8N/N0LbXCGYH2NlB9IIt3iiNuTw2S93qEz6tMcZ1lyJzHJiwfgusFU+dUTV2t0SqRW3ipEqdlU9tKGxu0Scz22biZ98Q2c1kPi5HcosSTlow/5cIUg3RmRdAhocHHEa/M1PLXlPnCIo96QguFJ75VCTNaTGN5GlvSPVj46d+ciWKKsoIZojcJy6tCnjDg5Uq3CklK+TXGwcvcfly8A/sVMX4Yl/IYD7zm7l6M2zm+77bBEYICtJg8DJ3bnD5+ytoxerdhEeADub/NszdQA43pWWynJSiUoxeAISp/qQZpnZL3Oh3IEnoqduKGstM5Pa2HtGLGE3K/kKDbECMUmArHLCrL2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Y1fJzzaaqTOAI8n/BQ2WlOQG3agMV3UokZIF59w8P8iqWo6BcAvcMXIC5Rh?=
 =?us-ascii?Q?JnCKNzyKsqgNPwj9ZyyYJ0Zk9ZVIaIG9L3J48I2vb49gzj5+3haFFg7D09YD?=
 =?us-ascii?Q?eZA3HRu29esLvoz+OHe1VuL7S+vd5CriD9xUsorPe9Kgw6f35uaSnfSyCP4y?=
 =?us-ascii?Q?BCchE4aHPyMr8ukVz6uCxYfNKCSL0rn+Yuoj+AOE22hAEiWlPIlhJ6UoPMKX?=
 =?us-ascii?Q?FJfQB5OGwofiNbD+j2rl8qjLDoWQ5aUaecpvLB2jFF8K//usU0MU0n32P0zp?=
 =?us-ascii?Q?CzV/BPYd1iqJ0xQIcdknYduHdNG0hhdjplIU+XSpbkfGKxE19HN2al3Pe6Og?=
 =?us-ascii?Q?nFkoWV+6sSEQ9Sw097Ns47y36/hw4rddj39U4StUffmmsGL3Me/LsXXOjmoR?=
 =?us-ascii?Q?Bo7g2+nIe+OgieM/gfAlLgPYCSlLfveufPY5r+NZ/aYwG9A9+yTxF2g8f3/v?=
 =?us-ascii?Q?dbFYRbIHGzfWPiyxfL3NBOUxfswLdQhXlkGkHHY5ToxswAOrM4Bnl5HETvnN?=
 =?us-ascii?Q?JBW9/MmKN0j9hRI6oyeIa3iH244cm5wdVGc/upMqkPkpF//0fBQQoywVrTWU?=
 =?us-ascii?Q?7iAeq8DAD8QOCw5pk9/lrYiJPFHu+DDuVxwaQJeeSu2TbaLZhPq6iKZcrTfj?=
 =?us-ascii?Q?draMQuDHmMNXogy04gbR10raL02JrTn82jr1WyIZK0+RgtnRFRpOdu5dNAAq?=
 =?us-ascii?Q?yRiNhYBELYZPlzc9y6azrvRBxozIfqWV6GTHaM3J6Oa39w48kL2xqhqUlz1G?=
 =?us-ascii?Q?xG7oKxFTW+GS9Sga0PXFm7iOzC8uLkbMjDGH+ieGeJ2ho165xjHgl68y6Y94?=
 =?us-ascii?Q?+M9tpcFRMCMjMERouE47g1YOx/XZ2TOjc2mvET8no56B4Fhq9FOOVSMUZmth?=
 =?us-ascii?Q?7KKNAMLEg4l6pNxIZXLnK+Khln7ilo/+bQ3U+s13C2Ke2mwrfZdbn4kNTIQO?=
 =?us-ascii?Q?TuGFvhIxmdASZIQVKpSA8OW1CXwHCXTaoQYAhbp1D7kIWCBX03p1fbE6u85S?=
 =?us-ascii?Q?rhLzJ31rtlofaqRODP23CGrcK2XL30aBoovhip33Sox/CBzhfmIPlVBKon/N?=
 =?us-ascii?Q?ZL/mYZKnvJu1aOJTojKW9mejlT3EBF0o6ngYIzYKkan8IQXwXgYxJblU14eD?=
 =?us-ascii?Q?DT/Esbje8zo8ucRr+ow/oyTHOcJJH3RNojWjS8ttpuGnogFH77g8zy06hxmu?=
 =?us-ascii?Q?5zYaiw6H/zEFqNqPRSny4p966Ldhq/hSjWM+6D/XHD+PNz57Lw0oq1xLRviz?=
 =?us-ascii?Q?aIU224Hnf6aV4ALV4vBFJP6QBsmZ0aWhaRuQXJYtojx5OQGhjmSGummTgEf1?=
 =?us-ascii?Q?U3gFR5Or0jaBlrxVxesCEGYVEefuYvRTU+y51EVqzo1Wa/ONnBoN7FArALAm?=
 =?us-ascii?Q?nxrU9xKyr9UW/YS+lF5TrDW+oJ8MXiN+jvGLK1qUm1YKEEqPUpENg8RmFP5+?=
 =?us-ascii?Q?vZI/mKqcAXLvQ9rhJ6IhWXqn6ayA1UXfOo6nf2YJmOQa/SVxm8JeIXJFVqLL?=
 =?us-ascii?Q?+c8KCll3gU9H2PuJYtGxbdKZZVFY+QgCdzoJXRM2VQ228sh6UfGaNN5XKTJF?=
 =?us-ascii?Q?OPtF15IvaGUHldBaM51SpuYFdQhwhuUzTchsX72iNEnazaPrdlMb54lvbAfC?=
 =?us-ascii?Q?hQeHXB3X3OnR7H/NwdUpKtZrOttBBY8wr2SoIM8HMZTEr0zLqCZ/eA3xeDNp?=
 =?us-ascii?Q?PEPMs9Tp7RG0NzzB3QNAX6lnktoFtpdjXLUZX6G9rZCKLIySGUwNObiujqy5?=
 =?us-ascii?Q?i+dSn8/UrfhhW9LE6jfW4X0QP4Ur3cs=3D?=
X-Exchange-RoutingPolicyChecked:
	28Oetw5TqSUBVzIh0fOrOh59ESdSF0ovtKCBCBIC3apX8ayi3gIMJT5xF+5vAo3VXr/V2lUhq7FrsesYGx4wKx/m59IwG3zJ2gNb+D7Gg6gmqCtPiR4HHHXfHZvTjLDV1WoP8JFVLIHkyWkpq0IJtlVZRD0SiQu6/qG85mjTO88adaMgjAyBD4KvXqnJ85lU16FJJ2flJH25ZeKPpyLM6ihLivVjYwIWPt1O/INLUI/WWFZs9wF4nfV9tuIwtGMBSaaEtFBLyu+ZMdoaSUDq7l4x2hPXbcFC1Me3VNa+vSixqjTt9g59haCuuHoOJ2V2PXl0vz83tfPs22TWJKlwag==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wTHXaQRxps5Umpl0BRWfQSX720pxYGt/WYTRk9VNGqYsrxLSCnh+l2qBLZE7UnfEA7tHJgn//glRB04o4NLCTbs95sQiq7FyhjZvRsvBS3/2tSeifAE48LlZYKLNmiOKE5y7kRfbQVdWbNFVDcL4Ix32T338JR8qEYDRkE8MKDXAyw62pmVPQGLeKX4dYuSKeB4W6vzX8LwnEQT+FNW4LNU1oA8QRG24FlJcLpKEZHlbH6i7F14Y51qBD/vdjPGsoFed3t5xImKfQ9huNBTXOYMEfe9tkjqMNm4zUVol0JZeDAajKvrp3Ou9vp9bbexaeS1fsrWiJZEmQtfWaTl92jWmYipYRvFtFvX8Vgye/QobWTjkKYNVq22wP2Zl2Dyv6mrWvvEePz7DkrwV5kHF5CF7kRpYIsH+DHA0hJ/dACm/72Fh3VCN/CbHFeuiGR3EYlSqyHF3EdvRYy9tyIt5wA+OnSIbOkITmOz5WNFiSjj6E5YuYMxIPl2PZ1J0Sfq9emXvcEtPZjHLzYpUEaba8WI1Xz1YMsi9NCJ0zs+nD34adxGDAIyM7qpyIoUC2oPexzNpcX2T5yEJRq0+/xIYXdOFazR+X1MUteXM7S8srvw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd375ce-c2e0-4b27-dd46-08df1d8ac109
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 18:03:09.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LycXcQGEKqx4X9BTUcbaI46KpD2CLomr4DmLTImbtmelj5NQBDZN6WzZqSTSK7+vxcufPlCQMVHxCi15er9kiDIdrn0NRmCQ6HqEKK80IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609280071
X-Proofpoint-ORIG-GUID: 5ZHjI0p7YOALVhrLHrQ2s4d4dnCSGWyf
X-Proofpoint-GUID: 5ZHjI0p7YOALVhrLHrQ2s4d4dnCSGWyf
X-Authority-Analysis: v=2.4 cv=eJCGH3p1 c=1 sm=1 tr=0 ts=6abaabe5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=WX5QslahZ-zN1zRnSu0A:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX5N+zbQru1S14
 dKhswGZH1YsV4SaDSBmRt9e7ScqJBUZQ6LGUzPL/Lm/W6iZPPrVnesVnHcYN026VUF3+uTFHI2V
 w0e/NzjigXFNuEHOPPlG1EzzZZDtHt+jWJNAUWVGycwG+5c+XGy9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MSBTYWx0ZWRfX6sG8efhzqzyb
 N8TCJAeM43TxyG0szZMWtzsVAbeE9pN2oPMVtgun7bnPt0Mn+UsqefBmIipAGdZ9QeKQvYylUJp
 uWN8vRZHYc1CEmUD90H0reqb3MKCqfKwle8SE0nyFSNuIrjJLkZYKXXqJVo6d+qxbwGMuM+qcGd
 9m3SD3xQadalUo3hVGF9PeN1uMyZmqrCQ2WuAPE6j7LFHor4kbNGk4Qtsr+4G7lwBKXS8nGgJvQ
 QAFqgRMhwCywQ2JAiWV7ygQ5cfz8Y1HeP7j++lARP8iJJbnvRZfiMbedNBALWolLkVBit/XN4mX
 Df0Ba23TydM/6nYCmStyYk0QuAgO93uwCzDDQVA+H+klhTGIFtDcmxPjLHsJAwrNheeQu2RV2n0
 uufvkmLsA7VfZ8wyLtCE9wecek9oP8+t/ZVWSJpjTfd8+PAq4Sol53FrBOGkvvv7JVHXUhtnG2T
 XysifGaNrgPhWN9zWXcnuolqFp91oQbxMq3WAyow=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/dt_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libcommon/dt_list.h b/libcommon/dt_list.h
index e6d4c863..ffe0b963 100644
--- a/libcommon/dt_list.h
+++ b/libcommon/dt_list.h
@@ -19,6 +19,7 @@ typedef struct dt_list {
 
 #define	dt_list_prev(elem)	((void *)(((dt_list_t *)(elem))->dl_prev))
 #define	dt_list_next(elem)	((void *)(((dt_list_t *)(elem))->dl_next))
+#define dt_list_empty(elem)	(dt_list_next(elem) == NULL)
 
 #define dt_in_list(l, e)	(dt_list_next(l) == (e) || dt_list_prev(e))
 
-- 
2.52.0

