Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132FF23C50C
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913583; cv=fail; b=k527vrWkGebPKrUQBr3VhriN+csnTsRnsHNzwsuzudLfxF9bJWfl1pQcEu7eY8SOg/0zybf6JJt7KOiGOm1J91o1XXuuwqG60UbRZ9NL2F1L0kLPp2fsz9BaMsISvxeAeojq66oMzBGfXJA3GJpmnve63KHZkJQLXcs6SIZtZdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913583; c=relaxed/simple;
	bh=A3Su2E0bNtN7Cf/aaC8Vkz7BoAC82JTiLy4jQ+cIBxw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q7XhojdAEbzzREukao107Bw218EbzyTRxygIul76zbud0U+KwIwjTxD6S6yNq8F7UJNp7DZD6enFD/spBVCh2F5snkxZRTeu5RJTidioIo7ypzUfMHw41pvEHA55/syBeeNu00DAlIxvygmO8AH30QjwCm7BqpsJbDsOqlkGckI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J+KyesWK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I5LDRPhj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J+KyesWK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I5LDRPhj"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIislN014269
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=82DjhqY3HVeJAFPsPA
	3aZoY7Jw3DkUv352757hhQlaU=; b=J+KyesWKYEHgzu4CPLqUkfsVQ2YMbgphdQ
	hh3woMXRX3eBTG5cmjvN3IrYuAJNBvTY33iu/9GUcG99mOTmxQJ7ABzw/ITHwC3T
	FY7HzUn/nY8H+RDt03ts+Au4hbky51cB7HHN1rZh3vGMdlC4w9I3cVawEtB55G3Z
	anuhs3rDdzZccBRM4CMUTW3ai2uFUHM0Mm91j/PHyjsL55LdUYgEWaUc8O6sihrN
	gTG+1qoolGaVDfY3WAfsB/Ac1MwLKcEwY+b8uZZOCRXxemlXRiRbAvZayeM1Lc4R
	OdBj0B0LtmCH+6FQApJqNOchzPW25RCa7MRzOpK2uBL8/qSnmjqQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49e0cfg0y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:19 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIIYGl020865
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:18 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011027.outbound.protection.outlook.com [52.101.52.27])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd82xnvd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL87+w+dieJGoY+dJa6DkIH/2+Uk7uEn7K0Aqa5TT7NkNngTa7JSkgfEnKrj4ajsZBmGRzyDMsZ0FruWhwypuKQyUncNnBTIjJbpgBeNjOUB7WwbA9bYO9BH/kVw5E48zer5nQcUGnu9+7eUvGODHGrhClnPvnHy1X+jg4cddUZ4Yw2K5D1/qf67HFukKZxDvp96HXrEAhrq/LM4s1xxWYTyFSxTkWtHgzAc+SvlahQKQbDc1h65eKOZWuYeQZmqg1J/JRsszWV4ZXdPCgLPS6qtIh1fSyYWcxkmhRuSCQM8kUTIfykPTFKGulOt8RH2bD6Q3N0G/A6Kl0qNIOfzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82DjhqY3HVeJAFPsPA3aZoY7Jw3DkUv352757hhQlaU=;
 b=e08AudF038jpRZF/588VF53MHCm8RYPXYDQn69cYU4WSsn1XT/bZieMsgDbp8aT7MuUHDoKBgWNFgqxWPxg6hddh5noYrvr7km1xNMJcWiEeD82NBHObDz0CG5MIh7B+2Djf+bMjTJ5OzfWg2bgSwJoEWFtRRQNlLsS/Vk50i2/KU0oai0d1R5WMq+/+lvHV/y835hQoOoDPkqiP2vRphQbo4BI8DSiySAPn6izrjKiNjKXC4O01x9VbebO7mveesVspqQejZWK5au+mTNgUUTNbGBfFtgZTB2yPxVe7mXVO1k7wkjcYs/UJ40i0ZDb5fP61rMb5T4hoQF4lHZL6fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82DjhqY3HVeJAFPsPA3aZoY7Jw3DkUv352757hhQlaU=;
 b=I5LDRPhjkmwGH/hqXq3zODg/2Pn5+UGrc8aym6LPpofC76Ps/j0Vm8KwChJsgJ2DVCtguc9rT0plYLQ8vArskqTtbbPdlIHMXLg5fcHime0Iq9J7dDXIv8PRrN1Jcrkhsez8GXqSABknr1fIA1gy1c4604wy44HolQDoabQx1F8=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:14 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/20] doc: Fix anchor links for explanation/
Date: Fri, 26 Sep 2025 15:05:47 -0400
Message-Id: <20250926190557.8485-10-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0127.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::12) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: aaadc6c6-d58a-4d5a-5e28-08ddfd2fc38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B7r/QjzUyIwPCNfGPmWHCV5CLyPo+Wa2M6ZHVhnMRwUpQ+pIG+KSFfdRs9ko?=
 =?us-ascii?Q?v50e5FzpBiYD7JMruoqbIkCCl6x6zp3HEjmtt26KliyudYl2RlAvSnWfyeZ4?=
 =?us-ascii?Q?x3LthJoge2TT0XrXhI7Mdhsjaq68P9vq3rV8Kp2jVd7pYqQ28w30VTTsDryt?=
 =?us-ascii?Q?AnI1x92qm0BofoH+wytjGlmUWhl1977MivlM6cy0ZUcBP3rAxrp7OwVoTsnf?=
 =?us-ascii?Q?Rn4oqBFQ19T2XcnQ6igaMmIRArsJ8jlOZA0NOUsXHa824sTwgZzSkcyd5JCa?=
 =?us-ascii?Q?zlKx4gcJfWYhjNDJ2hd/Gk8/kA/jbhk4X4LH75g1a4DjewJkr2erhWw/DQAH?=
 =?us-ascii?Q?xJOdhWdBKKdq/WOEez078qNnMkxhv6DIQd2xZPrDycqKS+C0CAbkbMaHoWSw?=
 =?us-ascii?Q?QETxeNxoZrMmu7fySoZIqoiB7j+9npYTL90gByvPnBwhPpozqDDki+mZ2tyR?=
 =?us-ascii?Q?7yyADcPw4FvfHn8vnEbZ6RtcFkRagcsFC1ZFThu29oosmu1Yb7un1Av3cJ90?=
 =?us-ascii?Q?VvN0bqloTjDDX7upUDdTr5DIx7haGxew08/KbqhsDk8tLJnC1flqKkZctgEw?=
 =?us-ascii?Q?VuGp2LN5zffRjTNJbVg8/M/BYe+wb6iaO10BzLuS/ABG1uelTmdungw60dPu?=
 =?us-ascii?Q?bNl67yxrhiHBCs6uQfWVkJwd/CU8UogKiTesVDAXzGQ623Xf2ryQSET4F4nO?=
 =?us-ascii?Q?waoeq7l/CNKdAqLftPWarcE2V/vVJAYAgnj9R+zIzzEIVI5dUomNlaiJvX2O?=
 =?us-ascii?Q?p8GRekDA2iIgoPtsQ6zbr+iFPf1DWsll6lVhDjl/eUJ9bMPoX7Gfjub2noP6?=
 =?us-ascii?Q?lB5o7keaIBBJQleZ2/o2AZjjrBbH4ZcCbbvvFc0iQmF4mRlYHaaKM/QSUOCG?=
 =?us-ascii?Q?JMzckW5AcsxkjGODsnHxh0h3ZKQ2y7PBS8fu3W1nX2XXjMbaTCm9VlBNCMCo?=
 =?us-ascii?Q?pniihNyQnBa+OflyKOz8AHzvNHVio/jgC8LCjMcfM7oKsB2s2LIX0nPW1G+u?=
 =?us-ascii?Q?Q0z7x6KAtAlgt226fMj+6sIELOk31kdUZfxoopPpEK2GlNIU9Wy6q57roBiA?=
 =?us-ascii?Q?PQP2ez5Yomlkx9/hd64cA5UxHqW2QqFagogcgEdGsKwQmZ+ma0ZY8rDN6Uo6?=
 =?us-ascii?Q?1xeehIpblxjgbT4b85Oh7tAirVH7WPesgGBSxYFzjSqf5EKdfNVE5vCjKHP2?=
 =?us-ascii?Q?Fs2f7/Ftcf3Lk356bMKMiGILGOeZ2CDycmeU1mWB9jd2trHS8NemJBmBd2x0?=
 =?us-ascii?Q?/NEv04sW5CzaHds4f/htVoY91qQuSaFO8iL6NAi4Kao8jjNG4xT76IpWEFIO?=
 =?us-ascii?Q?CvhFv8OcjAFG+pj8rPlW4uIcwiTkeB046l8cQ9MENmnkwHj815tDGo+AEWXc?=
 =?us-ascii?Q?t1SQhcv8KUlo2Hom+YQyB4EXXvuN39R4f+fpMESQaFWnddlkPwczQm/3w5Pr?=
 =?us-ascii?Q?lmMLq7SBQcDGM7/1G/1xqEoDd8V2/1f0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1RtGfppJ6pdnbssBn/zeoOTkmmFYLXy3C18UUmJB59z7JG1H655p6CTco2PI?=
 =?us-ascii?Q?rHgd0MiSr5CvHCH3EpF9fTowDd6QmR8MLvblRsxFi4tJvdZzeZf+4skbZd2Z?=
 =?us-ascii?Q?2cnVQmlsp9ozajiF084+LZxqhc9Ikf9bdx1hwYdqNf75PxGoyTUDBqhEbqQN?=
 =?us-ascii?Q?6iTgvce5fEaZy9YQFcUucqjp3lz8hDKaGpQhqpvzNI2PDfzUpwdmbTLF2RIh?=
 =?us-ascii?Q?Bxbf4kJQVtRdQ2VYDM6uILuNfuD/K7Yb30jPubWPtTW05OU8KLndkGNP4+Qd?=
 =?us-ascii?Q?qwBpEAP0uRnquc1OKHUqpXp4dl9opRHhcnj71fFyH9DiPHAGYSAD5TxYMq4A?=
 =?us-ascii?Q?uqs+lx0vKdKmWaEdP+fzCfgPq/iOetGWayyxs7QljLrHtU0P50wddFpxlW3k?=
 =?us-ascii?Q?jdAeh03VZ+VjrIUt58EXOfxq5cYvyUBz+jwG8drsd0o5rxuDK4f8MHgEPmux?=
 =?us-ascii?Q?j0tJZgz3zFZi+rdDGR/mnyOkr++ZgXjgLj0UBeqMHeHlQHoG3pxPsTfrBYnl?=
 =?us-ascii?Q?rL0zIUPOzZzctB6rVIwwh7h9ccpCxxgP76XRFpLfCpBW6//utSNPomuI8zS+?=
 =?us-ascii?Q?dbm9eBP7mTNNxAuAPZ79ORfxJ5dbDEpkcw5u4U9V3HBRWDzTRrSvUHE9g6jG?=
 =?us-ascii?Q?cS4S0db0TUpafms/OjBk4Gas93thvzsMlxByJ6JIOV+WZNAFaOdxb/FpxnPL?=
 =?us-ascii?Q?6Lj2oDtWugyQkOw2gER2uq0nQ9b5YfnEJ4/YzkunS5EQ7ku27/rnD8jaBTtv?=
 =?us-ascii?Q?hdqYs2GYvPWUnOpPUV9GXrrUyAJfRbN4DS71A4FltzWlXbEGjNDtNZLXKneU?=
 =?us-ascii?Q?+AdB73wu1RHIiRGIQffGqTUZYZ0xRV3Y1/oiqANimuNPafInDvxXPbtJXgJP?=
 =?us-ascii?Q?yoOOu3MXbUQ2MmOIEZrTPPWO8Oj/EUZH+tpXiLULRBdYAvTJd0t9YzBud7Mw?=
 =?us-ascii?Q?+JeX78lQR3zrN1+vdjlzUA9bvz74MUj3wGqoGl/C7iQ7g9wEu7R/P3abWTKF?=
 =?us-ascii?Q?1to3cL8HGPWlz8Nasbfej+mvPcBSK3GjWghGHw32xI0iSwpWJ9IM8QSFp3e0?=
 =?us-ascii?Q?k7rS6p1BBPNvTyxIHFybVDw9U1EiCwpNAUxbUOtGnZead+iDasTrBbYURWcA?=
 =?us-ascii?Q?7SLja6fiD3IMhNkbAHVtKpysnpQ47Rxd34fhTVT27ZYQOKmpzXI67rYHDa7v?=
 =?us-ascii?Q?DA0nWUMljlRkCWSIC1PReledlUilUa5XH6A/C/6L1B2kR8C/UPtHiS5dOh2U?=
 =?us-ascii?Q?xz61wJSGLBVHwVPSFZV+3RdRegiYS7DsE9bFo24XnuKGarNOB3206DdtY3AW?=
 =?us-ascii?Q?ZdN6GUgGOhCFCycSUa91jfDJDhW0oWeij86GdfBZNcPTCMqBMmpTKDbJ/3y1?=
 =?us-ascii?Q?GAnstxhwcJIiWXf3w8CNLzko+k0tT2RVyWT/LtTABenVrQPSkhWt+SeFLA4g?=
 =?us-ascii?Q?NIm8+MTCtbVqtxSVRz/LkAm4/KxU2hnr0ygM4D+4kI6pp+/F+P34hboxnfYA?=
 =?us-ascii?Q?2r5AQXdTYayFqBOA4POXk2SMQBweaIrLmis/UWla/t2IHJ0RKIR4lDY75qlL?=
 =?us-ascii?Q?7UuMxuuKKbNiASVylvE8f+QvpccnQIWOk9pzt4c+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fhK5FwR4fguuT0T8kNzoDua4mekPRyqLzcnzx2UYUAzDwc3W3+8ISMXdo0kS2avLQkLdM/vVl5IOcrDiy5OmL6EBxXgF3dMKzXknbfcLWKOv1JtXJ0cgmbmZyAYgYJRaJTLX7WycPE02c6DPBAO3XYUYBAT3rvqdPn+WmVB86DjiHt7zv0piXb7qj2gy0QKmpciVkEM/kKi4QdZjyQE11FeS2u+j/hH7M6E9gHS5zQjj0hy++AEhJVx/TxbIPTL5jmiemCoHBvmR1iqBkVMnd/5apaoZCfnCmekVPX/Rta1yHvMW6x+40EAZdK2WyN3srnIt5LpQctTJGg0a+qDoMh99haoQhHtTyM/C7J50FJLQ87SLQ8XUCo2hu5iQqm3aQIv6XXYAPpE59f1iytPdY3rVlP4STkN9gcTUcDzo0sNRbMiAV2e98gc9QC+aRNRAwHZUTeZhZjDE47bJ5aIYz/i8yfBPVjS55gZFOC/LK8xV1bk5o8nHmhpkA6u4zSPa83eH5iEjs8pQGhnveWHZTFr0Z/V0R6s3zGATdIfmc9GbU0jkgrOkvfQfwvtbRokqzEYsMSgA2RepupJdeB2kjMye3ecb9vBG9RO5GdwHIMs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaadc6c6-d58a-4d5a-5e28-08ddfd2fc38a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:14.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXdHSzK/dZXi/6VshQp+nxC4svNC9Dwpa2sNiGLThL2BbxXa8GK7RJQueptrbGhSCSZl5KMmuaYL8Of0uAGYiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-GUID: 21deYAaEcHkN6h8RL0OzabhXkqriIZ63
X-Proofpoint-ORIG-GUID: 21deYAaEcHkN6h8RL0OzabhXkqriIZ63
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE3MCBTYWx0ZWRfX3fz1DgVxv77r
 qsqhtObKq3rLGYrWaoTA9of13d5+XHxMVNoO9cOPUG6lo5RdXsceEy756H1PlT7+m5JjzPK9oY+
 fnl6mjW0R7d4Jsklj0jh2SwCjYNHSJqMosPZcfX/KVhdcMzOQuchDdeq3Ss/YESjVRuWRkVzXhK
 7mUvm/ohnYfWNEaWKY/XoANzWDOU3dlUqsVTKFW0aB43HCsOPfn/2CS22zGpm2LI6YAr0sgeGGH
 q5K1Nk6LAaJakv9ZI6QMZVtcNnvB4TEAThhg3dd4QYdjDqvp9wkYleW/KE3h8b1XYBSPHJMR1e7
 XWejxF14Fc6F+vgR5DXfKTVzah0Ba96lu940gpBAIdPfKzw029elHWZ/lESPSl6YK0j8wkf9ocu
 RlQpuaK7Wkl7McBtmQTFEBTVtKEd6w==
X-Authority-Analysis: v=2.4 cv=S/XUAYsP c=1 sm=1 tr=0 ts=68d6e42b cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=LJgdDvRoxDd0BoBiPIEA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../explanation/dtrace-components-and-terminology.md      | 8 ++++----
 doc/userguide/index.md                                    | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
index 1d7a35076..eccb02f9e 100644
--- a/doc/userguide/explanation/dtrace-components-and-terminology.md
+++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
@@ -7,7 +7,7 @@ DTrace is a framework that dynamically traces data into buffers that are read by
 
 **Parent topic:**[DTrace Concepts](../explanation/dtrace-concepts.md)
 
-## Probes {#concept_terms_probes}
+## Probes
 
 DTrace works by using *probes* that identify particular instrumentation in the kernel or within a user space application, or which can be used to identify interval counters or performance event counters. Events such as when particular code is run or when a specific counter is incremented cause a probe to fire and DTrace can perform functions that are bound to the event in a program or script. For example, a probe can fire when a particular file is opened and a DTrace program can print information related to the event that can be useful for debugging or resolving an issue. Equally, at the moment that DTrace starts or ends any tracing activity, the `BEGIN` and `END` probes dedicated to these actions always fire.
 
@@ -66,7 +66,7 @@ dtrace:::BEGIN
 
 Probes aren't required to have a module and function. The dtrace `BEGIN`, `END` and `ERROR` probes are good examples of this because these probes don't correspond to any specific instrumented program function or location. Instead, these probes are used for more abstract concepts, such as the idea of the end a tracing request. Other probes, such as those made available by the [Profile Provider](../reference/dtrace_providers_profile.md) or the [CPC Provider](../reference/dtrace_providers_cpc.md), also don't include module or function identifiers in their descriptions.
 
-## D Programs {#concept_terms_programs}
+## D Programs
 
 You can bind a set of processing instructions called statements to one or more DTrace probes, so that when a probe fires, the specified statements are run to perform some required functionality. The set of enabled probes, the statements, and any conditions that might be evaluated when the probe fires, can all be collated into a *D program*.
 
@@ -102,7 +102,7 @@ Wed 22 Feb 11:54:51 GMT 2023
 
 The program probe description matches all system call functions at the entry point. The program predicate evaluates a *built-in variable*, `execname`, against a string using an operator. The clause includes an *aggregation*, `@reads`, that's used to gather data about the firing probe. In this case, the aggregation stores a counter that increments every time the probe fires and the predicate resolves. The counter is implemented by the `count()` *function* and stores count values for each system call probe function. See [D Program Syntax Reference](../reference/d_program_syntax_reference.md) for more information on program structure and syntax.
 
-## Aggregations {#concept_terms_aggregations}
+## Aggregations
 
 *Aggregations* can be used to reduce large bodies of data to smaller, meaningful statistical metrics. Many common functions that are used to understand a set of data are aggregating functions. These functions include the following:
 
@@ -121,7 +121,7 @@ Although you could code an application to calculate an aggregation for a set of
 
 DTrace aggregation functions apply to the data as it's traced, so that the dataset doesn't need to be stored and the aggregation is always available as events occur. In this way, aggregation functions are more efficient and exact, and avoid overwrites. See [Aggregations](../reference/aggregation.md) for more information.
 
-## Speculation {#concept_terms_speculation}
+## Speculation
 
 While predicates can be used to filter out uninteresting events, they're only useful if you already know which events you need to filter. Because DTrace is often used to help debug particular system behaviors, DTrace includes a set of *speculation* functions that can be used to trace data speculatively.
 
diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 57425becc..8a0050819 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -14,10 +14,10 @@
 -   [DTrace Concepts](explanation/dtrace-concepts.md)
     -   [About DTrace](explanation/dtrace-about.md)
     -   [DTrace Components and Terminology](explanation/dtrace-components-and-terminology.md)
-        -   [Probes](explanation/dtrace-components-and-terminology.md#concept_terms_probes)
-        -   [D Programs](explanation/dtrace-components-and-terminology.md#concept_terms_programs)
-        -   [Aggregations](explanation/dtrace-components-and-terminology.md#concept_terms_aggregations)
-        -   [Speculation](explanation/dtrace-components-and-terminology.md#concept_terms_speculation)
+        -   [Probes](explanation/dtrace-components-and-terminology.md#probes)
+        -   [D Programs](explanation/dtrace-components-and-terminology.md#d-programs)
+        -   [Aggregations](explanation/dtrace-components-and-terminology.md#aggregations)
+        -   [Speculation](explanation/dtrace-components-and-terminology.md#speculation)
 -   [DTrace Command Reference](reference/dtrace_command_reference.md)
     -   [About the dtrace Command](reference/dtrace_command_desc.md)
     -   [dtrace Command Options](reference/dtrace_command_options.md)
-- 
2.47.3

