Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB8C288A8
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 03:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305599; cv=fail; b=cCo3iZ9kF94Eh1l39YcWfsfyf0bMPCf/+l5XmklfOepEGFRmDC7QHyprw2j3I75gyyNRLCS1146wPas09VvEyzpL/k/4aQxtt8nPCuT5IIReQjTO0AiAIAoneMnnY2h+pO7ZLnrwlC23vxd3MwOb7570a28LWWdvAyzvMSioVqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305599; c=relaxed/simple;
	bh=Mt8rg19zCp/hgzoJJldn/t8boxhcnKE6HJG/iv7U2eI=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=DmO5sY8WqZyjSGK3pRJe7oACy23MBf2zG8RgwO/9edpFRW5MHpjsIx2rnFoOxHxK+CX1Lu31PBtonVAv/OclFfyhBRgzhnW/wbpCQX2I3kRXxKejFNpuGhkJ9aSTdVv3quIP3JFsJpRijh7IMg8Uowl7iPgr0pNI0F3xRQeSUig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rQ/kXpsi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ARpyYymP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rQ/kXpsi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ARpyYymP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J0fiHV017417
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 03:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=cNqOPlRw1URZx8GbDpIQ2NcPTAf21D+ecXekbBGwVEs=; b=
	rQ/kXpsi5xHJBnVqywRnFAv2I2kbLeeZK83Q8mBamYBMWM0yXwU0V9yP/DyaGSfz
	CtLZMTutsFcwLSGBh+Kp4Aw+iXc+YcWd29tjcJkViWToBZI7sbV9cefhLusstyTv
	CjnLi070o7cGJ57QQ0tJurUZwXNfepBcr5kSSVtbX5fpXm0iVjlw8zv1sbUrarJi
	j//aFhn4as3Ukfv1yJht8RiHDE/bm3ovBDnsm6E5M3Z5KwxQTJt30dJHnWiugYlc
	2F63xyU5Xp/V21UJokK5JZPGRQu4hsVVOAEzCcfWymLTtmmEJhjeBOeMP/tmlbOr
	IYpFnAefAhCkuIizTQDZHA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r85kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 03:59:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55J3AQw5032079
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 03:59:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbe69y-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 19 Jun 2025 03:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJndz5uYgOJcPVlJKmXXpFRIeQZnljx31yeKVY3NEoXcKKEk3zCnpd15Xg/dy9yxXC/a0vsvTfy3FdWVGiyoF/kE7gZHyMqQPAulxotHv3nU7GSwzz46nk0sMD1EU6lgJUuO80foEpmPNNOWZ+JPzjdZbVUXdU6eJTjdn7uMm6+cslWRwqJB0dLoKWGJQOjAutq7uNoiGFK2ZMrZ/L1qQ1OV9HcM8249WoeAlBOujKAdn2cAQB7nuWO0Dh+HBKH6gB7ykTKN22Mo7ZSlWnvpJWWZfUgGCFBIa0LkmYd+oovSThwAbVmjlNCfisHtd6u8WPlgqe180YKIP2X8LPA5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNqOPlRw1URZx8GbDpIQ2NcPTAf21D+ecXekbBGwVEs=;
 b=Ab4uMytDA2YlvCWbhYdJxXCSAOFpmG8tGuffN92hi522chJ2KEgi6oIQSOkQQrN8bC1PlbsMd3Ns59MNYYvOuujTvFgfWcKmR1wjWqx4Vr8r4+glWsJ9ndBHcfeOQjybWM9PIVW0sT+nHny5DYhqfbL7q7MT5QXqaNCSgSSWF9S+R+WdXerW3jALQcbLXigTRIVnLlWp7i1JEqJau734pQEklTM+lpnnp1d1XGrjJxQvY+5qNhTg9vDo3zrnmrKeoiYDAhQUskc/8XpkFBsdAwNpidSZaQQ+GdsoeDIUwlfNffDJlhfaGdu5e0ZeNXwk3ADB2IPuE+JkNfkZpRrFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNqOPlRw1URZx8GbDpIQ2NcPTAf21D+ecXekbBGwVEs=;
 b=ARpyYymPSPRwOEaaBzCQxYEpDTU6yY+BWewkh9e1xjioGyiEfd4vO8DOts/mAiREwv3oBjjmMYrg3wyz9uB1B1UxfB/9XXmVDAYwW41lrg0Ae+vZgBZjKssAC35Fm6pEJ2rjM3TbkglWOdz2tA8f9CgRzBOua1s43ohaVWsvqyY=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA2PR10MB4539.namprd10.prod.outlook.com (2603:10b6:806:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 03:59:51 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 03:59:51 +0000
Date: Wed, 18 Jun 2025 23:59:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] usdt parser: fix memory leak in provider and probe htabs
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:208:36e::11) To SJ0SPRMB0016.namprd10.prod.outlook.com
 (2603:10b6:a03:420::6)
Message-ID:
 <SJ0SPRMB0016F8F2EEDFFB5FFC6BB811C27DA@SJ0SPRMB0016.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA2PR10MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 95ef650a-e576-44e5-9508-08ddaee5bd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W65oIkuk1SnmU402k7CcKYu37hoHtok83YdMZsBss2ZdkxAZnngh+1Wp6Gbv?=
 =?us-ascii?Q?7RoO45ouDc34PGX5eshiocjqErKrPsEkX8OEEuFauUjr/7jXDsxMPu+LNKpP?=
 =?us-ascii?Q?4s5u7uPR1FW/SySnCcGdcERzN1gFL5aHlrrR7qPjSFY2CklYslhG44R+dF/z?=
 =?us-ascii?Q?iHYT5x0I9SeLsXBqC+fruGUQq7I2N4kwRQznxcMvVABbWcH6mwuWmlsBBEfP?=
 =?us-ascii?Q?EmBoWj6tt4xY5si/ifQwB3EPStV8veJX4ehO9W3EDEvU3FqCE+a9BNGQ6NQ3?=
 =?us-ascii?Q?L9skAuPABTU78/88VzRRSchpSzN0t/LUAD/1bwKRD68UX0NLpniFDxweUaAd?=
 =?us-ascii?Q?mihzXuWc8OO5XteeK0CBpU6uehG2HpR/Uo7v0C121XX0Qocqk8l9WKWPnE9f?=
 =?us-ascii?Q?qgf+5cWxHk0Uw9S1UwaPSHhHUGItq1ohFLxc6KoBmP0L+76UEt0hBmFjPObk?=
 =?us-ascii?Q?N7tmTbO91o1r7VMXq17F8Dl7DTKlGgyHleMA3D4ski2cJCDtjXIChV5mZJrK?=
 =?us-ascii?Q?K8+or+fbWz4JH61/m2MQm5DvbTcU0tLvQI5b4TJA457h0OpTuNo6asy1gjT7?=
 =?us-ascii?Q?IIsJAIB6gDYzh3rzvY8G1ffrfpCGFqJcsk44HVBe3RpaZUO+ZIgG7QYUmGfu?=
 =?us-ascii?Q?eKqqBSrcn+5dS/Xqy5heh0RsoDmfjP92udI9oJonLSl9ha+96csh8C181JwO?=
 =?us-ascii?Q?B+THdbl7lPtBzuf+iY/0rO3SAEuZ5fS+KYu5AC8vlJM8eebSpNArR/B/XfPi?=
 =?us-ascii?Q?k8aMlBvU2IWuEYDGP2IjpBlRzVU1CPL3MgQCI/JW8j3oEnN57hSO1S6QB7+j?=
 =?us-ascii?Q?gjdcvqxdVtTuZ7X2fCJP2CCuHSqb0AQMffIqyzlpMNV8wnF1e03707lWiBlf?=
 =?us-ascii?Q?FO8Qtul+UZu+u4ElUQiVcztmEXnFhSSatXF85EGwMhyAxug7eEy3IXKFH8zF?=
 =?us-ascii?Q?EqwxOJaHelgxlLY1DuFHge1ipL2LR3sGFlsG15mSzvWIYwTrHpk4D9Nyej59?=
 =?us-ascii?Q?PcGluJg9PtC3LGkkvwykpyPKhKzuzjwl/WVI5oFiMzUq79FpUCBJ5JmRwUzM?=
 =?us-ascii?Q?YSg6kvTPvTbB42pvoPSqDSVG+UP+CFPSbDH4XpGuJbi2ttC8YhS2Cj2TbCzj?=
 =?us-ascii?Q?hz/WjR2fJXLGejQtakGpMGiRC95xGZFAirbHWPvSsJ85Qa4JlbMHDq8475LN?=
 =?us-ascii?Q?L6eBkWUUQ6w+N8tR2zgjBn8yEr81cYe35T/T1wzhjMnar5QtOOyyRwOGzWVl?=
 =?us-ascii?Q?vmnFl8HoFBd/2ORo+JNYjdMVOcQIQmZgcBOeNJZ7gc01PQoyc+f2UPORWpz8?=
 =?us-ascii?Q?8zD/70UqByIYceS8hHDDKNC/D1m7Z6AgdntdJQCICVg6TrzCRfpQ6VFbt9+r?=
 =?us-ascii?Q?coZ2nE+r8dCkmC7nqjYggFtl/sZVP582HcU0cMrBuT/r/uSt75lN/1YVVKoH?=
 =?us-ascii?Q?iakRysZRwtk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KBcehzVCDzQMdoC/HH5G+7Clycu3gBBVdNMBaPqcMmZ8d0fRbRbL3iY4+lKv?=
 =?us-ascii?Q?PH9boOnLpuZvZKjdvSpTVaaLfAg2v5VCHySOQpJYa+o570fcbTrSIoinVkxk?=
 =?us-ascii?Q?KgdvT5kJakUH8VLkdN8+VZ3P6bhG5sQpF+u7zsOOmPRpuIGiDNktitC20Dsb?=
 =?us-ascii?Q?fFZBne0pvlkQWcW2+j/wX84xXGqMw++svXGwT8TaJepjASjfkr77ON2uaGTT?=
 =?us-ascii?Q?b6qvjO5lu22L9OwlBH2CH5ZBgegeh97qFAYGTH7MN5WUQKkjGxQaiUVH0oF7?=
 =?us-ascii?Q?LzkF4pllBi1PBsqG1GALK7gzfR8op3j09z181zIB2ljz4zIkNlw8//lcs7sC?=
 =?us-ascii?Q?EL983ETd8SQhrYSp8ZQz5JWyfOIY+Eg1HjGJMGzr4VrtsHVj/XnIzKxH7YaD?=
 =?us-ascii?Q?BK/YpCjrBI+2hLmlE50KEIRTidkBZ9da5kqHXypYe3JdP400Rcb2fqQOgl7V?=
 =?us-ascii?Q?qNNxDy7FA9VzmrKxrt1Mf2YQYmIutbA7aXnyIaMGa+as+Btb60422eWjIvBV?=
 =?us-ascii?Q?+md1sxov/umYZHkKhtfp51WtZHa7KJU8NButbxUYe/Tl0rsNSiAinx/vGPw2?=
 =?us-ascii?Q?9ZDJSy7x8oURzIYreHRGhSa7Ig4DGUUeIwdICym+XPVSBQoJ4mXpPe4pRyhl?=
 =?us-ascii?Q?LMKqCR9lJ7E9ZTFN9cQbrVeYq1awBd1wOEWV9u5MlkITpD1kVgNuc4VgOva+?=
 =?us-ascii?Q?2gPnE9lXrRH2OraCQWNiVOwo1qZIl8eBqwx+33pkbXwV7FidaaruoZgpHNBQ?=
 =?us-ascii?Q?NdZ7Z3mQESn36PaQY+GYea8F2UWPYBbmopQ27W6NpSFbgAl26n3Pi39V8yMK?=
 =?us-ascii?Q?NiwhLerp42wPl6vfyx5BnTPDozzLpAGX+FZJi1fQ0afFaZdWrYlijefMt3R8?=
 =?us-ascii?Q?cWEjAMTUuw3Ggbd5TmP9BXEulNoE6qoFTooEvL4s0A7umqf3jx9lf5/udZCT?=
 =?us-ascii?Q?dOSQJ8JFW1DDTdLZ5ziE2b/9BDfDFY6LWTTY2wx1xB1mjPecYrWZYz/vgujv?=
 =?us-ascii?Q?Sey8F01DKLwNZdONms0kgWlitOvu9o/BLTMYf8vsqEV1AYsqkITqm4wxLQHC?=
 =?us-ascii?Q?Fdv1zpc8bw/wtMysU4eznjqWv2edAoqv+j4TH7CecztpIPKj4dSn/Rkw7en7?=
 =?us-ascii?Q?mK2/BtFGOPh0HNhy9uJg5TMnYcf1O33DaBlV9L7oeSo7ljLU9XJOjvIWR3Ph?=
 =?us-ascii?Q?YKwel+luYXe/FnWyJ45AHybV4ROiICaZx6WBTUqTSMb4V/0WuhZ4qrCN3+x+?=
 =?us-ascii?Q?F5W73ZtXvJQio8igML6fn1gixjWJu8q2R3GhwN+02IYp7un8/vBB7hMyZaVv?=
 =?us-ascii?Q?cxqn/YBJdDGADgykYyHnF04Gi3ey5pZOcRq1RnOfoF/TvnrN709wZuwoh0ZA?=
 =?us-ascii?Q?Q2xddOCgp9sM2RB8cGMXRLhz+9OECoiH6q2aFb+s7+TtHsgzHFXkCm0sJ+Lz?=
 =?us-ascii?Q?2cKFSuv3YDezFwsPCw5Liw9VuYok/wsUSuAM1fWhlmklGF/lsrw2zb3/vBUz?=
 =?us-ascii?Q?y653gfin8h8g5GykJ8xWd3ejiuL2QZEcGzoxBuX8YX2UoP7O4QGVtjXX0IbT?=
 =?us-ascii?Q?v2q3YyTL98i/Bevg/bD8j8m8rsVyn89h2g64IM8HnoI9u11HKL4PknVLmTCP?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4rTTe+eyM0Qf+glP8agSSGW6V+i15Zx4uaHs6mSfw/cF9twDlJORjVvMmJVyPhfoQ8/A5yQ7sQJvoAtIt3heopPgDsGxRDUuoqz7tCql+yKE68JOAe+fvC6ZGOrgUW8mHsr6tcvmPRSxvyBaYb2sOGG45X1aRQHbaHszTixplIDmeXwOWFGhGVeUytXZg2ZARUadVILkoTHyvQ2djcKGUYjr4NOROguWi+kfL9RmK0vd/PTNlKc3w9pBPV/aXs3kvUQibCtTrtpyP/FhLfGFxfuDMoOw2TTOU3wLKrVq+OxlxZxORtFXBRTtdj+oWN1pNfdTYWmmbaX28RIrgdvtttIb+WgmR2wE6K/7CI83OD/8kwkBRzP4BjE+LWUTS4Ti0YEtYxzai+UDhKiXrZrWxpBMRGB14BpxQrJnT/UI6l2vNemOTTxbejrRevrJZyjHtu/gvRZXzBtB0zdR5+qBzSNX7k7CPJZBm4TikPlQ5RtJjXwF8UGuuGyHjHtuT8EJUumca0dPp4UBw8UfhOp8Xiqz0+Kps2mRmDroM/D3+UFHK/QFdHzcsVufUnghiYb6Dcb5gj1tcjcVd3/UP4itbPCaUblNjtNz0cGqTghIIzI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ef650a-e576-44e5-9508-08ddaee5bd6b
X-MS-Exchange-CrossTenant-AuthSource: SJ0SPRMB0016.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 03:59:51.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTZSQta9qBxc8+TEpogdUUCNg3Sq0d/b8YcoKi4sX5ZORidI9ivN8EKT76XtmQV1vKeaD9h3mF6iy8Ki5NWlzAmB4PzgiGeawneRay0/hwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4539
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190032
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDAzMSBTYWx0ZWRfX84Zm0pkovUd5 Df/9xgzYCXhazkKMpQASBKnX/pq+2BqtYz4feCHWEH5JJ6iZUjBN1iNK1PSLjAhDQhPH/kjc/Ts OD6xBJr+6wP4/hqNF65lA7/eXwX+A5buC3FrBEe1s5TS11V+F/QgLRnTT6VdZZXZbNwYHRdVEiM
 ekcy97XhwLI5bs+OBpjmQHp77PPvNYZ/J4FMse6JuMMWjvnIysd8q99crTMEWXiAZ01CPqiqJmo sJqOF67G81iDyLzGGvtY2KfsetnldrOy40QOP/c/r2xII1B1Ty+FQ+mWBe77cYjImBqQGa4qWkw pl/wTKN9WkM+rhd35hjLMqxMQQ9BFsP7TOmESUs8qQdkejzhqXd4mYOFygWs/0Qew+n9H+7JsMH
 SugC1r6xBo0sMetgQaEPAp/7ME41tRzhqiLMh7Kw5X7cIbXOWuAI7hB+6GdS4A7c5+PTmDh+
X-Proofpoint-GUID: 0E5hhRojOdP8n5NO2CXxLEdqhzKFofMs
X-Proofpoint-ORIG-GUID: 0E5hhRojOdP8n5NO2CXxLEdqhzKFofMs
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68538b3c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=DwvmlXFD1viV8qUF_BIA:9

The prvmap and prbmap hashtable implementation was lacking code to
ensure that entries are freed when the hashtables are destroyed.  In
addition, the pvp->pmap hashtables were also not cleaned up.

To provide cleaner data structures and to facilitate cleanup, tracepoint
probes are now always removed from prbmap and either added to the
pvp->pmap hashtable or added to the list of tracepoints for a particular
probe.  Therefore, when the prbmap is destroyed it no longer contains
any entries.

So, only pvp->pmap hashtables can contain probes.  If they are function
specific, they represent a tracepoint (and may have additional
tracepoints linked to them).  If they are not function specific, they
provide a probe definition and they will contain probe argument data
that needs freeing.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/usdt_parser_notes.c | 82 +++++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 17 deletions(-)

diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index cdadf4b2..c6fc3476 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -161,7 +161,25 @@ static int prv_cmp(const dt_provider_t *p, const dt_provider_t *q) {
 }
 
 DEFINE_HE_STD_LINK_FUNCS(prv, dt_provider_t, he)
-DEFINE_HTAB_STD_OPS(prv)
+
+static void *
+prv_del_prov(dt_provider_t *head, dt_provider_t *pvp)
+{
+	head = prv_del(head, pvp);
+
+	dt_htab_destroy(pvp->pmap);
+	free(pvp);
+
+	return head;
+}
+
+static dt_htab_ops_t prv_htab_ops = {
+        .hval = (htab_hval_fn)prv_hval,
+        .cmp = (htab_cmp_fn)prv_cmp,
+        .add = (htab_add_fn)prv_add,
+        .del = (htab_del_fn)prv_del_prov,
+        .next = (htab_next_fn)prv_next
+};
 
 static uint32_t prb_hval(const dt_probe_t *prp) {
 	uint32_t	hval;
@@ -205,6 +223,41 @@ static int prb_cmp(const dt_probe_t *p, const dt_probe_t *q) {
 DEFINE_HE_STD_LINK_FUNCS(prb, dt_probe_t, he)
 DEFINE_HTAB_STD_OPS(prb)
 
+static void *
+prb_del_probe(dt_probe_t *head, dt_probe_t *prp)
+{
+	head = prb_del(head, prp);
+
+	/*
+	 * If this is not a function-specific probe (from a prov note), free
+	 * the translated arg data and the probe itself.
+	 * If this is a function-specific probe (from a usdt note), walk the
+	 * list of tracepoint probe, freeing each probe in the list.
+	 */
+	if (prp->fun == NULL) {
+		free(prp->xargs);
+		free(prp->xmap);
+		free(prp);
+	} else {
+		dt_probe_t	*nxt;
+
+		do {
+			nxt = prp->next;
+			free(prp);
+		} while ((prp = nxt) != NULL);
+	}
+
+	return head;
+}
+
+static dt_htab_ops_t pmap_htab_ops = {
+        .hval = (htab_hval_fn)prb_hval,
+        .cmp = (htab_cmp_fn)prb_cmp,
+        .add = (htab_add_fn)prb_add,
+        .del = (htab_del_fn)prb_del_probe,
+        .next = (htab_next_fn)prb_next
+};
+
 /*
  * Return the cummulative string length of 'cnt' consecutive 0-terminated
  * strings.  If skip > 0, it indicates how many extra bytes are to be skipped
@@ -252,7 +305,7 @@ parse_prov_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 		memset(pvp, 0, sizeof(dt_provider_t));
 		pvp->name = prvt.name;
 		dt_htab_insert(prvmap, pvp);
-		pvp->pmap = dt_htab_create(&prb_htab_ops);
+		pvp->pmap = dt_htab_create(&pmap_htab_ops);
 	} else {
 		usdt_error(out, EEXIST, "Duplicate provider: %s", prvt.name);
 		return -1;
@@ -715,30 +768,24 @@ usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data)
 		 * tracepoint probe to the provider.
 		 * In either cases, argument data is copied.
 		 */
+		dt_htab_delete(prbmap, ptp);
 		if (prp->fun != NULL) {
 			ptp->next = prp->next;
-			ptp->nargc = prp->nargc;
-			ptp->nargs = prp->nargs;
-			ptp->nargsz = prp->nargsz;
-			ptp->xargc = prp->xargc;
-			ptp->xargs = prp->xargs;
-			ptp->xargsz = prp->xargsz;
-			ptp->xmap = prp->xmap;
 			prp->next = ptp;
 			prp->ntp++;
 		} else {
-			dt_htab_delete(prbmap, ptp);
 			dt_htab_insert(pvp->pmap, ptp);
 			ptp->ntp = 1;
-			ptp->nargc = prp->nargc;
-			ptp->nargs = prp->nargs;
-			ptp->nargsz = prp->nargsz;
-			ptp->xargc = prp->xargc;
-			ptp->xargs = prp->xargs;
-			ptp->xargsz = prp->xargsz;
-			ptp->xmap = prp->xmap;
 			pvp->probec++;
 		}
+
+		ptp->nargc = prp->nargc;
+		ptp->nargs = prp->nargs;
+		ptp->nargsz = prp->nargsz;
+		ptp->xargc = prp->xargc;
+		ptp->xargs = prp->xargs;
+		ptp->xargsz = prp->xargsz;
+		ptp->xmap = prp->xmap;
 	}
 
 	/* Emit any provider that has tracepoints. */
@@ -754,6 +801,7 @@ err:
 	rc = -1;
 
 out:
+	assert(dt_htab_entries(prbmap) == 0);
 	dt_htab_destroy(prvmap);
 	dt_htab_destroy(prbmap);
 
-- 
2.43.5

