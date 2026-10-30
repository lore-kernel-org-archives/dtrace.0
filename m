Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389123;
	b=Jvs9MMdu43WIJwg1u+9WpA4fXz1/yTnb1ZRvw6KXE8BYjb/d6RM1MZ9O4eLkYZ6zBv+w
	 d5x6m4MoBPL7Vmv2dW1X0Ty/NLH9yEMrAtqxfDHTPzwyke1JOUtxfUwVaDqOZ+BgUzd3T
	 4fcm8WfZVvXG3qI4JuBHp/wHt1G14bzrLQvGVkbvXhE3KNLoCRI76JOWglNmIGoHDIibq
	 x6TwvbX+LKclk72JdVyeC3w4MsoZZp1zcrxenv4NBGD080d1PRIWP0LDTq5Vztwy6X92Q
	 kQPsCqT2NRkWtW8vg14Mx7xbOM/s8fOzQPsoCyvczpofSLr8p6o+WJ9j62/HlvSTqaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389123;
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
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID;
	bh=alBtKG9+qxHeeuVA36UlEd4oATOoBAosd6CcLs4mRzM=;
	b=nFFYJHap/r3dnSkDkTo14ncRrMdsVmpoF2+2hYpxNWtAhmNxNSZ04fi/rko2dt+XKHIG
	 dYxVjMBh90ZiijYDWB/PlYWrvXkEyyCe1PofF4mTqNj8BW3L7EqCo6Py8zDyY99bQwOLm
	 cJJMG8MDFVEdflt4BBbyDZZrYAVHqfR9MX+PnPJgK70XNlHgXKc2SOlouYbSunNvecsEf
	 KL57BIG5S1QBdHOtfyFuokv6OOBrtedPXxuHpYHte6dVCXxl0QTiu6bX7Jx7tp1pylSKF
	 zo9HjT5ZsKTy0rfffrRpkvDMqvbSoYrU1CcTBEMWQBt7hI+VcgaLJf8H3vtFNlWoBAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=jBsvCA69;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wUNKywfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27949606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27949606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=jBsvCA69;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=wUNKywfO
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXSBr3605283
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=alBtKG9+qxHeeuVA36UlEd4oATOoBAosd6CcLs4mRzM=; b=
	jBsvCA693Yxs6abd460XAq6Iuiznisf3ad2YXK4BDBovApbFs9QTt2WDmEoMhCqY
	I92rCyvlGEamdHU9EzRsSg8H9o/UKsRu0govXW0wUEVoc00xp5uDf1Zk3pPBcoDr
	/9Kv1sDn3Syg+5y3bKinOfuoJ0VP5P1EEIEWXgz4Wm5EMkj2RVGIMjmNleKXxzSp
	j9Mhp33Y1zI7nF7XL/lh1NEIzFOcgE9LUZrdyqC1tsGTVp9raOgJ3Ig7nA/44QlM
	J2cCK6IuSq56eRa5wuYhRce/okN3eCnrZPsPzZL1v5nafrTYXDmOacVh6s1T9qEl
	NiQA9C10h/OiKAN8kA3nGA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5msc3c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvq332444470
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:41 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012030.outbound.protection.outlook.com [52.101.53.30])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hmxs4x4a0-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyXJDJM/ojMUA9A8zV1BYtk8sGm/weEDitzMjCMwwNozyu9AUZstjCY4Hd4JDvjzQ5tlUDYRAyFwSmjarokXsAdotuCX6u6ns1NolQx//3KRUueNWI4ffkIJl2mnr4wKfZVp2x7uYG/4H9dgXg0xya76KPZkHWcZMX6p1tl22MyT1y6Sqz7iRHcGELGGpYi5jsk6YFHR5YW0f2z0BHQNhErzjwkWlnIMZYZH40p+YvEs/VWm22Ppsr14z/qfGo539wurcm65V9JsVpxNGJAUUIckN09Pk+SWq+JPjsULtuB6xZvVrMJD+DkQiJ/qO3yzwl/eUwgGzH9dn/2Q1DovUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alBtKG9+qxHeeuVA36UlEd4oATOoBAosd6CcLs4mRzM=;
 b=s+ygsEVnpjhxkqphwd9e/H6Y8kEfaQqTgKwN3oEeKJOYQDH4yR/T7j8/N5BNSj0BNo+mJQCk+pXu4PDX4bL4oOPBZwt3n6QY9+pxLL9t3h1NdHn3Th9f2RgTcEWQeZS/2WrNSGKTkRs2z77p0PMuDhGsermSjjaE+6lbUDjrWVOiKNhPWuFVosLHxlTsHIZq2yGFVAO+Q0zx+jHhH6C36hCfvW7XocOdbgIOr5qZ/g5cSbH2dIKwsqdNAH1KI3WL7s35GMDjH+KCwdiRqmKNikkvzVyc+QKCp6vQJHSgLXwVWUINj2LIXV7kX7JY6qAw6UkzzeiJ8tHES+4RI6eV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alBtKG9+qxHeeuVA36UlEd4oATOoBAosd6CcLs4mRzM=;
 b=wUNKywfOTG4Hv0R9TZgeiF9H/Hab56/tW9vbnXWiXNqk9HXt8h8FehnfvCaJFObDcUQC/xB+DsaRowk+J7GBV4ryScT7dvzet80E6/J02NrrN8BaP2RygiLR/3SJb6iyZy2ZQyJ+EM5zaxj94uPe5ZSnXUHsFigwyuCxzNMwd/w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BN0PR10MB5111.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:39 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:39 +0000
Date: Fri, 30 Oct 2026 19:37:04 +0000
Message-ID: <48eb9d0eb1ac2856fe443912ec9a335a@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 19/20] test: fix modpath test
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0079.namprd07.prod.outlook.com
 (2603:10b6:510:f::24) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BN0PR10MB5111:EE_
X-MS-PublicTrafficType: Email
client-request-id: ad17ed3a-8761-453c-9cef-4301d95002ec
request-id: a6af7a6a-52f7-4b93-1412-08df36bd6592
X-MS-Office365-Filtering-Correlation-Id: a6af7a6a-52f7-4b93-1412-08df36bd6592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|56012099006|261026140227099003|261026121527099003|261028144727099003|10067099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	cqtEuVTkz/7phOrVi1NJYY0d7IhroLaAyQ3ir8lEQWJ8hLdxHbdXo2tSuwKdQHHhc0Kha00fOuU9ldg9NV/CgzsCkjCxZAdWeRBWdXW9qyYBobt6SAISj8kJYHSeqwwCqDoMWGgNMLCDbXJJNGuZn+O5Yjflu5KvA3W8Il1LA6ZgXxxmlaRuYz6f0P4wnODu9Mq5/eGwxQ5DnF1ZvFq7RjUA3I7uRVQqq4UXeI/HJUZvcziafwTlGzhrzA84JTqJgtNI89M/dt1eYpn6F/Tyt/DPQ1k8unYkWjHsGqxU7N6+tOLBODrMuBDDh8gqtLFP+ktXUFMHNc8jFtjUqS7XhizhfF1pbEDEAO71qMiMDQ0T9Z1wShDWxZXWZ0vdcddoSBaEyOVwtYxETdDs7zqPryKSngRYiehDhjhiL4Tvvs1COBigSCTvpYm5K1sr5RZpMmFxtEYHIj32pzVZGJkSVhhrWpW7xZmZD+meW9bXO5dhtbLRYVWz+lDRZ//usLLvlPg9nQfKMc16iJadHnhBj0fagWC5jduJMUhs5MrEbKu5kgr02TOP4XbYqt7Eaxwvo/3GjHnnFvrHI5+BSaPeclGuJWb9Ztk5KlsTDP/2YSuo0yw+8NYAca6gs5lPHuACjU5TWdKZF44epmKhHfPOnYy21FlmAzil47ODW13eV1U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HHrtyAWKFNsvrnZ7Z7Z34dngl1cQ//qid2mEkdR6hHOuRTxYmxk7P8OgTaZk?=
 =?us-ascii?Q?xsnJB+pyXTetI7kMsq5KqVbBai6pbmY0WOU2qqQgdlTQsXJtsuSlDS3A87I1?=
 =?us-ascii?Q?lpOQUtkagI6UL7uFhG6YpvL2WQymO8mLm9GwF8EeC3ZrsCPj6EKe61eDQKLJ?=
 =?us-ascii?Q?+9pJ0AdCfj9IdV1naECpYtR+9Adm4/pmQNCdXOM0jOZkD64tLUr1B3axeZ2y?=
 =?us-ascii?Q?7HXvnuVX+0BsK8HsORv9lMdTVnT2nJbWRceDkTOUHd4guzUb7Q7mBmykLZC1?=
 =?us-ascii?Q?jQULXyGr+JgjEXuIsx1K0m4XzWTD5VE7SNY0Xp2JjYD1eYEYW6+qBU94vY0i?=
 =?us-ascii?Q?TRju6brTG2P2lrP/WyzbC+EH1abD92mfUyZ08ZZ+xYVB+MvjbBH9X4e1CufH?=
 =?us-ascii?Q?qx8XGgG/xK/IkTy/XiRUcRWvRt5wWp5vM+s5e2D5r8NJfR3KG2XSaZxVf21I?=
 =?us-ascii?Q?MFKQnbJn5cnyL8Nqq7mqBso/+rv0VgxIxPgUAFnUaogcg3TqDvPtmJ5Aal0P?=
 =?us-ascii?Q?qpSOwxxpHQVMV8h22tN/rtpGE7YREcmglNkf+Os4SDDH/in5aGoPi6flAXiX?=
 =?us-ascii?Q?fuOnhsO4YMEQOn3usNz46n02JnFJlTEPoaVclucnLeeXYEHqQnm///w/f3nC?=
 =?us-ascii?Q?Wop7j542xDCoLHYC8CpDXHKkhMZtnO7XEXvqyTC2SeuhMZFTx3FpDE9MJTxy?=
 =?us-ascii?Q?8Do7QX6gtfd0pZCa3ZHlk83y1lSn80mQOGFmfSNgUJcWcCccBDZrFVI6iBfq?=
 =?us-ascii?Q?r7i7H5134AsiENS/QgRC4kib34/S4bgdQe4d7/eYRV8sgpOabWZgaLMspIB6?=
 =?us-ascii?Q?F6hGwQDTIgY1kJzio/q13xWU2pUXa5l+ckXcRAA5ohdXvb5XOsO6z3Cco4wM?=
 =?us-ascii?Q?FLJs/ui/wxcK8TZyMXrpiRew1QaMKDhqidCTEJT9TzQMcKxVjkFc+5NB3ZE/?=
 =?us-ascii?Q?g2wlcp2cCeXrk/nBPrJ95XhaVfLu0B7kZbGHn+caffkMZkXfntPZ3wCvdYBp?=
 =?us-ascii?Q?ZFcvgs3v1ISrZ5n0w9oJEIlAtkrFq/4FuVHZRTBsP7yVlon9UpV8SGJs92ex?=
 =?us-ascii?Q?oSvbZlsUOH4gkBqY/7Ejps4/IOYcL4zzJTc4kWRkAvh75dbEOv9O/6vp87WR?=
 =?us-ascii?Q?XpdU2E2sdpykdCAd0GK8XlANYPfrjH5Y22eQHuw4iQCO41tRZYvB6qbRHPu1?=
 =?us-ascii?Q?gEth8Xj8ZaVl+nF8SsQKpnzXE4+AKQlhJ8DDHYV4WqgGINTt49tUPogBrL2b?=
 =?us-ascii?Q?1BtoWBmjty4tRexVSESLhbJJeKcOt+GU7lN8DsnDl7rOP24I06/CQDmvhodo?=
 =?us-ascii?Q?k84EoPSbyGaSNKgQCNz17WWnMn8mBC1tRkXxSGc9tPM3TmegIIZOcn1l5XBr?=
 =?us-ascii?Q?f53ThHoP+5SqLeF8nvbujxQOZVxJP5jT76vZvV7iQd+YNAtkNPYVzji7u88V?=
 =?us-ascii?Q?UkA/9eWPULsk0aN9m3UyrAj9WYA8AJErcf6Lel6wYzH5r3B/Hz4xymtACSNl?=
 =?us-ascii?Q?ym+hN8sB9OIOK2z6wXMAomIy5UDTEU50g7SSntFZjjbe6iH5/9e3RJHcSz0j?=
 =?us-ascii?Q?V1EdIMBg4Vl+AqN2zvjaljMGR9v3J66fnOiaTsECexa7j1vPMRCCQnK1qyG/?=
 =?us-ascii?Q?rgA4hXIRo0sY2jF9tRqDvEccnvDuLNrDWLoAqpKebjZWiHjNMI9fO+2J1Gm7?=
 =?us-ascii?Q?0P5fwm1CNuYECHgLTwCF/U7VAUYeSUxJxrtwAXI1iA90oyjkvzj4mMRszFYC?=
 =?us-ascii?Q?ZGhpEeB6Q2Jz4uXF69XL6jrAQjkgayQ=3D?=
X-Exchange-RoutingPolicyChecked:
	aT5CItRLjYv3mDS9rTvXIXh+dhwcRJWfl8QDDuj2aB6l4wMkaTJVRzGU1g2Y9PeD2F7CzP3BPuklDvjG8aoNobCjaKsdWjHLTyyBVlCmehMhz+k42lAMlDoPbAC2gdTGl+nLErQKrdXKNIzGeCO7+VDRn/1DRfa/ZPRfrFZEeO033Y1pL26RkrA73RQAbUgo1k55RepXEKbEKxYQHxIJzSwNYt0rahNFty+UgUHtfQy4E3diQa4vLUB/m3BrrjLLY7JREpX1tLrmY5jH/RwO3q4BfO2kVGYeRpks859QSizqySi9Yz9eVB3P73IaS7mwGPmg91OKmWC3bVuOCpfrWg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DuyVrlp97iCDRJ/eDGPAoTbg49QigPWmLePuVuKKGbOfi98LdB+9cwYoS0Kwa88YAmQafrk9KyZ7OpoxAlzBgsGwN6mBcoLrXKCrwwcHb1a6YaH1Hmu5x4fQXMM74rPpYiH57KOgWTH9c3gVzBBPosB97D7neSj4PgDpr2s0bu7qfA04wQckXBUrawMjK9KaLyFuoFM8H76fD+mm72jgQBqt+OQysE6qMvdNYmZkBA/Hc+nXd/XSMSapSTGUTCt4cJtKBriNZhBq17PVQ2tb84qsSxGZZFoc8FcRtlju3YrWmi5ifyBrWkRuSOGbVr7+6Jn+/NKNdrW8elpvs45AtX0PpVTF44a0o4BoMWdbtSt5oqKqm/rEbR8WxFfGlnwy50kvV9lFhXsyAEsbp5rQfy47XyvFcjwJ+lzTqrLm1wkZ/7z7IXEmPj4sV+ruIA05X8ovdtzMYWASV8gfjCyXWhe+hn5E71S5vZ0g0hKwPC/OC11NeXk6Ud/AfMBGsL5lMGoFaQO961NcuH4yLq03JkSUPFBTnTM3P5pl9fipDaJuL0CKH2ub3hGzxXSBX0Pm1IHXkIbVfkYhHTpgNnZ6byWJLISTw7Y4FKvn/NAwWo4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6af7a6a-52f7-4b93-1412-08df36bd6592
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:39.1989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hkb7q3V+c9jRrhhX+1N3kBXaOy0Qp3WWiHidY1jMS5xCAodRDiDJGSFi2Vq2pAGpMlYJct8KrPIVkcJnKmQuvMY+6Ehod8EB1neSaoqL1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX9q2TnPJA37gU
 9kNZePrFOP+buXkCVZdz+k06TqxD3RUaAswUxI7J5PL7YgzGn/1iqHdFngQSJmtcAk/y6ooJeT5
 COMxh84rltilYSxCJ8wMArnbkzLoe3VYgSOb71PDuYcgSK1w5cxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX2FvBCDAnsz5O
 RW8yWrDGhitw/OchL5UlnLuADVVUnUZKJJq78ngwJ/oiCLeP8lsIMTRF3y3Ym4Us+TNi6IsTv6C
 jUM/TgGGoD7uy6HCF3368V8AXSQAvkX6LamrNwbJeKDFu4VSnLjHimvq2q3UOj5dZKE6X6a2kaS
 lAC6rpklEl4M3B29OWxOJ9tzoSHX8KR6HYIn/LDBMqIa56nm8u4JaakS/Ye8BXUQhn+gIXoBKgu
 UXyVysbL0VOLpUp5hPUvNe7IWOiZfMywgYZ3TpV6cDQ6IgglJJ2J1j3WDqU7mKQrK0kK4iJejg2
 8qc6wbp7E6OXs9SCz0+OwL3hd/EH/YOOtck9gGptQFqr/pCYH7cpFVF3QJYXfH4vDuSPOvGQVP1
 qhKktw7Sl9Qgn2I92SjSnlUmsGQVoO+fOxnXIrJ9IX1pl+6PzcjYwOMYruyUbMBgyZF8aoN1Hrq
 AHzKSsVzyhu8Nqiu240mz+rtS3J+sRCCe3hrXaig=
X-Authority-Analysis: v=2.4 cv=TvFzFzXh c=1 sm=1 tr=0 ts=6ae4f241 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=yPCof4ZbAAAA:8 a=IHs_E8pzVQLeIgMBD5kA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-GUID: 0biNbHtynRd-2m7_wgJ2UirdudPPEY_3
X-Proofpoint-ORIG-GUID: 0biNbHtynRd-2m7_wgJ2UirdudPPEY_3

The empty CTF case was failing because BTF was still providing the types
needed through the BTF-to-CTF conversion fallback.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/options/tst.modpath.sh | 35 +++++++++++++---------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/test/unittest/options/tst.modpath.sh b/test/unittest/options/tst.modpath.sh
index 7060a716..b9d92e8a 100755
--- a/test/unittest/options/tst.modpath.sh
+++ b/test/unittest/options/tst.modpath.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2023, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -11,6 +11,8 @@ dtrace=$1
 DIRNAME="$tmpdir/modpath.$$.$RANDOM"
 mkdir -p $DIRNAME
 cd $DIRNAME
+# Exercise CTF archive lookup without falling back to BTF.
+dt_flags="$dt_flags -xbtfpath=none"
 
 # Create the directory where the CTF archive will end up.
 mkdir -p mydirectory/kernel
@@ -25,11 +27,14 @@ else
 	echo basic check on DTrace passed
 fi
 
-# Verify that modpath directs us to the (empty) directory, with no CTF info.
-$dtrace $dt_flags -xmodpath=mydirectory -lvP rawtp > empty.out
-if [ $? -ne 0 ]; then
-	echo ERROR: empty check on DTrace failed
-	cat empty.out
+# Without CTF or BTF, listing rawtp probes must fail with missing type data.
+if $dtrace $dt_flags -xmodpath=mydirectory -lvP rawtp > empty.out 2> empty.err; then
+	echo ERROR: empty check on DTrace unexpectedly succeeded
+	cat empty.out empty.err
+	exit 1
+elif ! grep -Fq 'No type data (CTF or BTF) found for vmlinux' empty.err; then
+	echo ERROR: empty check on DTrace failed for an unexpected reason
+	cat empty.out empty.err
 	exit 1
 else
 	echo empty check on DTrace passed
@@ -49,30 +54,22 @@ else
 fi
 
 # Check the amount of CTF info we got from each run by seeing how many
-# rawtp args have non-trivial type info.  While nempty should be 0,
-# nbasic and nfinal should be substantial and likely identical (but
-# we allow a generous tolerance).
+# rawtp args have non-trivial type info.  Both nbasic and nfinal should be
+# substantial and likely identical (but we allow a generous tolerance).
 
 nbasic=`gawk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' basic.out | wc -l`
-nempty=`gawk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' empty.out | wc -l`
 nfinal=`gawk '/^[	 ]*args\[/ && !/uint64_t/ && !/void \*/' final.out | wc -l`
 
-if [ $nempty -ne 0 ]; then
-	echo ERROR: empty check turned up some CTF info
-	cat empty.out
-	echo got nbasic $nbasic nempty $nempty nfinal $nfinal
-	exit 1
-fi
 if [ $nbasic -lt 1000 ]; then
 	echo ERROR: basic check turned up little CTF info
 	cat basic.out
-	echo got nbasic $nbasic nempty $nempty nfinal $nfinal
+	echo got nbasic $nbasic nfinal $nfinal
 	exit 1
 fi
 if [ $nfinal -lt 1000 ]; then
 	echo ERROR: final check turned up little CTF info
 	cat final.out
-	echo got nbasic $nbasic nempty $nempty nfinal $nfinal
+	echo got nbasic $nbasic nfinal $nfinal
 	exit 1
 fi
 if [ $nbasic -gt $(($nfinal + 200)) -o $nfinal -gt $((nbasic + 200)) ]; then
@@ -81,7 +78,7 @@ if [ $nbasic -gt $(($nfinal + 200)) -o $nfinal -gt $((nbasic + 200)) ]; then
 	cat basic.out
 	echo ==== final.out:
 	cat final.out
-	echo got nbasic $nbasic nempty $nempty nfinal $nfinal
+	echo got nbasic $nbasic nfinal $nfinal
 	exit 1
 fi
 
-- 
2.52.0

