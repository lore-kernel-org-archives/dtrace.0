Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7723E2D7387
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787870; cv=fail; b=cRTx+De7/eQzfNs9w3qcjP9bbQPBCidus1LnE2ZxnK7z/3YzqHPm7e3CmFhDkrAVQElRjDOp/6ICXLPKbzvr92ulmjJviuqQZCFhuYxpTdqBJm7yWSRvZLkuvgOebzd2FLBECTRrL6jnRNJDXmov1KcU3eck/a4oBh+k/c3svWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787870; c=relaxed/simple;
	bh=73MCKF0agdilhqYrwSH3WziM5kEtQoGRSu/6frRQEdc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nG1x4cOFlYgZsxLDcjI86zOpa7EMhX+zz4ForjbfbUz2ST3h+F5kJYE4wHqu8O1JpCsukcxmhJyG0EwVCkMvkrt2ShJKXz4XEwbGCKb0QY6HMm+DD2JQFcNxsehKtnF9cQ9IR+l/x3bvLPh6XqZMjrz0EkvraccVY0d0kxlS9PQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hyDOyyeS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BwLdhCok; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hyDOyyeS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BwLdhCok"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596LYxoj010360
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lof4FODS7hq9b1c+kv
	ZxvO5OiGy6D0Ck2asCkCdYENs=; b=hyDOyyeS7hcpQfFs820BwLErh1G5oURVnG
	R5A/Hb6N9DmE/g4vHMz8NjnQAhap29RBkpZNvPutAIQt/AWM7vpCW8imDSD+PU15
	HGx/js/yfD0ghx6mpxcrOKwIkJWGAchg5WF0iV2epudcFC73rv5/Lzm5X2YX0sFR
	awgXfLiJncPXfJVXIcncvtnOqVbWwJunRTBFMsCRMjSbSn8K0mxxVZXe6FnjN9Rh
	UNX6MBwf46QuxfyICNCQH61C1dbRGJNVPnyS1o4nWr5SKEOV61iV8LMRoiDzpz3l
	Yo/NoB6ehNyREQKT5/q87gCtad6DzPxWmf0px5yEp552xg9cVVeg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mnt40140-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596LWssF034923
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 21:57:46 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012042.outbound.protection.outlook.com [40.107.200.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt17dq4y-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 21:57:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8hmUEqbQ2I04l/sW5Y9lqFKnwEo+fu6Ar2JE8qbUUPJ+hz6X/T3fkeN0upb4ZJre1IEHk8xvOCCfC1O4LuvxbWfGkyFrp06Wson2uMHhkFTgOiPf5fohXBNDh5itmpdh+gd45vS1OmzQPciHADwRaZn21w/j+0IIa0bnrjIQC+uTy8tYraEI+01IO5+TylxEEfWZBzqkpkPockAKF3H9GcsGI7xKzhyljAIucE+WHoG2fFBrFN/XsYC7t5n44znjBD0fpbXMxfpCCLkZFHsignOEu7r/IFCDrNnZt7RSboA29pvY47hkBNhoH47ZrmX8lDaK7xI0XUiaKC++PCtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lof4FODS7hq9b1c+kvZxvO5OiGy6D0Ck2asCkCdYENs=;
 b=rtKka/avv6g+Lfgqhsrl5OOGQT5MduvChwzEnTW09C8SzU0zo9LoZbs0DQS64KFFTGKgreDa/JJ1MqFM1tczTn1BZKuEBtemR7yHZ0En9zADUZjLW2br1MKO9Hdb5jXuZ7Xlw+sXEzy6H6lnDKmtvOEN+G6LHWa/qtDn6Aa3Z9ywUgELnMAaniEP14eckQpblV4yTe7I4dhf5/3F5fTP+hRR4PEmvM11Tt8ffJHofMp1J+0Msdf4rCOaeNhP949woZx3fYJfZbLbR6ebJZjjWYAxC29ozBvH86TOy4UEE5YHk1z86lqsGEveIRuHNjIB+/TDeaBb7gRkczb4pDXxvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lof4FODS7hq9b1c+kvZxvO5OiGy6D0Ck2asCkCdYENs=;
 b=BwLdhCokDY3pESXFyd57DPrg3nYIYdDPpQv4tsMD2v/BfGguWfk+lA1nbLfAis4MlkVYJqLCAdRqWpZPlDfu3/JctQsgD1aRqsEGMNgBu04FwBtlY2cOGyB2gOR0LAxCgleyfcJb3v5MGsOeNs5hoilC79ZilOiZsp3DPVIo1h0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB7997.namprd10.prod.outlook.com (2603:10b6:208:500::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 21:57:38 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 21:57:38 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4] test: Skip D return() action if kernel not configured right
Date: Mon,  6 Oct 2025 17:57:26 -0400
Message-Id: <20251006215726.8893-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251006215726.8893-1-eugene.loh@oracle.com>
References: <20251006215726.8893-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN0PR02CA0038.namprd02.prod.outlook.com
 (2603:10b6:408:e5::13) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8048a7-2e41-481a-8576-08de05235da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fELo7QsZp9zl/ei0AvN0fJ4GNE7gUKUNhj+TUfXYagDPKkxmJM8VD6Lp+bu?=
 =?us-ascii?Q?HknZ4XGpOF140FmJVxrMd8rcnQefMi8F7g94XpjCTHEZg0ld5pMjFDgsFpPg?=
 =?us-ascii?Q?OMIW/JJouGiqO6nCYhXccd7YmLL2LJDZr3DuF97IxIBlpiz0a13yjU/RnvMV?=
 =?us-ascii?Q?aodJTY529IcGtgxgph5pZm9gGSM5Opv1CQPo06uCt5kAUq3IirXdfze9VhyW?=
 =?us-ascii?Q?81W3tZX2S9JFJ9SihDWWV3h+gHvgJ5u4MrBDWTuVENUbmNPHQCVzLCODgZQ5?=
 =?us-ascii?Q?xhaQHmvMJNIsC57phY+KGtn5NkdaXt38OW4jBc3EKSgryS4nCVdeXOQ72NJv?=
 =?us-ascii?Q?uBqmR0FeX0Uo/4+21Y4hkuFxjY6ItWt+JnUZwVP04Yk4hS6eD3dS7fzndtbE?=
 =?us-ascii?Q?+CdU3sbkkgLqkVzml3H+I+vYCe1OqZwqP1XuYYTN4GQzN22clI1LYLO82zpr?=
 =?us-ascii?Q?Viwx4lr5TIvjsIytemrqhTyAEIrHuXSg3YRI/ZQ0fys/5PMH/dXlJBDBtf8g?=
 =?us-ascii?Q?KGVRo6BsmVxp3WE1M79LuCze5Dk9IxLEA7zU7VIaQR9ZOCQtOu+15ZDgBSIZ?=
 =?us-ascii?Q?Z8dVtCA7r7s22J4o52pgM9W6d5u6YSvK9aTBx0EuyXzhMxf8X8gsXEH3Cudo?=
 =?us-ascii?Q?qDKsX0Rwbur1mOogDuA6axuazCDfoset5sSBVSgp3Fp3NdLysdDBOGbgyqZk?=
 =?us-ascii?Q?YyVpUHRzwWJcJVkNqKVSA5i92zEY/JZEqSbeJ/mM7KzkP+5ol242UjXqY5rI?=
 =?us-ascii?Q?E7RA2ejs81DP39XiD9pXhCkyDmCZD3LD2qYwLUJheO7RbAxSeFR4BSJ2AkKw?=
 =?us-ascii?Q?9k71RGotiKqq2oTavZOk403xp3Tq3dicyPsHbS/EfzZIhwfD8c/4z0hk5UYX?=
 =?us-ascii?Q?kOJ/wLUZ0R0ZKQP9UE7Z8GOrpaJGQ5PvZAzfchLzBjVX4bb/oOoRh8tGE88c?=
 =?us-ascii?Q?YUFJavvGZffoBV9RjEzWLmhItNVwVWV9W3Twnm5ylwovZP60wf+xrVvOsRgy?=
 =?us-ascii?Q?pEXwGhPgp2+VHnfRfxNlAqsW59PFjWA3198SsH6sQzJLT3KRQ8HdpaWKCz8a?=
 =?us-ascii?Q?2aL1jL+KjikoP7cGVrIpMRClidR9K+vY/eL2qt5QMyznrM42pQ/bLJWGQ9k9?=
 =?us-ascii?Q?NciFTeLdPRu77RKSuHlbSGEExonjaFmwEdqRQzu+WPYRlKUkKn6/kkrKocq5?=
 =?us-ascii?Q?urZQtlAl7AtKCCnS2G6rujOOgeCrfekjcJNCZ88ztXpBpCWM3vF0X22qWcKm?=
 =?us-ascii?Q?s4cL3HYYQNlKTg4OvwRWSwD+fo7wa+qBcw2DnZtm1jFC7G3vQWxWTw4xB5Kh?=
 =?us-ascii?Q?DY90XK0D7AVzn4SNePrOio1EYic4ApHInonp+Z2yq72t/y3G6fMqQMY5qkl3?=
 =?us-ascii?Q?ZeZmsyNPjSMf3sjFU1Ld4DFPD5mdMZt8JhqH3c4OVj4cO4X9jg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xd6iksHskBGdiTFjS+UYWk8jPuvLYG93lOUGrKoa5O50T5QSZEm5mFFarLJY?=
 =?us-ascii?Q?oFmRcjcUbNKDfGGVb/7g3b1Xt8sC/pJJ+B5TbXtriY3vyKC9UIog+gPj37sJ?=
 =?us-ascii?Q?A1+xVe6NoJUpl73RkkaOJsNKcc1C/6Wi1AQt0s8KPgzKqaoqmz54cZv6VHef?=
 =?us-ascii?Q?jynnAiBw8HNXbF+dMJdhTdSKdMQkFUwwsiDcv3DTOTcpyZXGKsBOFyQRhzU3?=
 =?us-ascii?Q?5a3SiPogp2V45uXbfCGJt/D6TnyEV3ETxK0WghGEVffuUQxa+ugiFeqZTTM5?=
 =?us-ascii?Q?DoqzbiZeaiyPZ1wJC3eWdP6nCGDqQJqzcjq1y4IiANo+jbE32Q1Fw77LB/3O?=
 =?us-ascii?Q?/ai4ltPg+Z0i1vsAIsH86ANYqH0F84l0gGhzCl/FPbTcVp9RexhGMN0q4/vx?=
 =?us-ascii?Q?fBhDzZ1A5ggqE5k6kE/hq9GTGMzyKz+zoKJYAhPfzPa6q2YowMO41/8Xr4hN?=
 =?us-ascii?Q?lX0u9CpuleyibzPPG7A+B5joVBB+NGoYNc/75iA4dWPfZ5vPiEPszOEVKL+5?=
 =?us-ascii?Q?LvrDzCRzk0i0p86TcFPofICnE7i3xZrSp/zFp2dnZA8MorW2avDLedg6XoSP?=
 =?us-ascii?Q?m/YjKYrloQuX0Qak5E7cYoZJqtRXfenaJl68zywt/B4kWtltTU8a6DspQtVV?=
 =?us-ascii?Q?GWJbDlSzfGo7w7rQR4V+KA6Hv0LNpEUbBpEsLut/Eq3JvVoFrUq97/pflM+l?=
 =?us-ascii?Q?LwKdKUQi4yP8uNTWukQxRVJIAWc+/vEiihJFopygOK72qoLBixB5KDJIeDGM?=
 =?us-ascii?Q?8L3zczSxHIuY9XE7HYZ4/zoe0u6MvtIUkNOazA+xZrQYpngWHX2TYEezlcwO?=
 =?us-ascii?Q?kF/ZuoNX2AW/YywF1mL8nW3zila6Ok2GAZ/JqnEFra+IYuUB12p7MPEKxCZc?=
 =?us-ascii?Q?5Wfgo9J2ja/ZMg4wK9CHC36tB5mRUliB2rO/LcCmt+XJaSlZXLpKlaIf4hI8?=
 =?us-ascii?Q?LPy61o+jkKxH5ppybulk26vzYaRuC4ZXookxdZV/fo6nAu3YAcsKhEGrayWo?=
 =?us-ascii?Q?A3wGWz8edVlwjNOyW3Jg8BXzc+J4tRPIHFHLjlDRft7pd+YP/b7ozjv4B5UC?=
 =?us-ascii?Q?0HvA5ivRWWK1ruMZ7x6UQK0Bc1z3xlL4ffJZENUgyJQq3SilcKe73Y8dlr/x?=
 =?us-ascii?Q?BZyU2/g9UPl/rlz2NvSUB19++boJVU1OHDW+YhpwgBeOccItVlwaoanXzDO8?=
 =?us-ascii?Q?6xda/zYRJpxx1YE5K1ZeJYdVpudkt4BJupZwo4dTTzypQ+I+9y3GrdG2XXQb?=
 =?us-ascii?Q?qqnZRoguRMLbQkPm+IZynRzbuSqymhrfUWZ0UWbRTx4cZxwaZ0hy3NzLqjQR?=
 =?us-ascii?Q?uaCfcWs9MrjlRRjb13xHVH8WNBoFtEMLKIHIJfAQinTkfBAg2yA0NdqPHI3f?=
 =?us-ascii?Q?H9uO65MCmPBstP4H5tQ6l6jDcEzg4fbG2WYZcTZUyqJV+31lfQtJliKRx6vn?=
 =?us-ascii?Q?lJJAT0QBboDMdT4mL452nsAEk+54NZE70BV0v2EYFH0ksk/8Aa+z1xbUA025?=
 =?us-ascii?Q?/cRTkbq5wMEIPXUF4E8nd3JdSAa/qinV95M/P+Ju5FNDGOYcSz1t3rSJ8R9q?=
 =?us-ascii?Q?bk0tgpG8u7nYCEqX23FsPPk62Fv2r7efYh8B9spC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	q6bE4vMfQBSPKircYXKwk3MMc0NHWvkFSVuEIOyeEvGRFaQUVh/bzaWjFFUhbu3X3yVTJ868C3jrPmxNlQ3P36xeMu1SAxHho2VLpOIKjhNdPgSJRzD7JxdwYCKfDcE4kRy87b3+vq9FS/BquAVloH8fZe4AcUSfryBc4GHQD2uLPRJe1IIqkOwvBE1yVxzF4ixqL/DjCNOQ4+FZytZqObmm0y4j0oRT+AhvfZtPrLUf9wsw0gKLZAuirCGUSfyu5aOQQzb+dyyXs8ByOOTkzTcmjQjGF8bCN6Jzl2e0LIpUsgV7J28sOzc4reDNKfDEtoU7WJkU/9nBlsplyWQJTSdHGZb+t+lf7ECQSnn6UbySgKWuCGRsTUue6maXRU99iKL11y+eeBCBk5hksTd66v3YxZuFMO1dLmLzXs4GbeGSzWOtS8B6w5qqVzk5+1qg3BYm/pAfDLu6RBsF118nNHOXiAssLawVVrYJ7sPWhdVjeG+p+PtWTrERv5WDq3swJcNVA0gWMC8QboofPNohWS9E/FIQPmsfbGlQKgBOyjoV+I7z1CM9ZxhNTipLfRrgjR9F+/1jpq8N26YZM/ktgDOFu0grqMxgUOpd1L0c+lg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8048a7-2e41-481a-8576-08de05235da1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 21:57:38.7668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++MvZeUj5rShlBvicXvNlFaUj4+cSD9o5Cp2K6L7TLQJzgrH538rs4ZosoSP0fmsOyyG23rIypixBIhtdBURLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7997
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060172
X-Authority-Analysis: v=2.4 cv=XbuEDY55 c=1 sm=1 tr=0 ts=68e43b5b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=a5pi9filAAAA:8 a=WRq7EF1z9Pdj5qcgLLIA:9
 a=Mgsi1gaY6nDYMq3LkgpS:22 cc=ntf awl=host:12091
X-Proofpoint-ORIG-GUID: lTDztpx2sx6Wp8meKY3DVmIXbhRBUXWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE3MCBTYWx0ZWRfXxktyAkEXq4Gg
 4vuWctHvSguOUI1WI7pHBwCYBPt/g22a099NiydKHUwkd1BRsMUCtan8SGR2VVXQurHUZA9Fy2Y
 JZgx8zZiSCTjZ/tsogN3zf4Bg+KcwYrHg6Xv45D36+0oz+g5HAhk/ls8fItDuexO90axTD8bfk4
 bHyRNflDwHAVStOEoIlbCLd9Nbo2m/9IP6DCnhAJuiQj9r89Ms4QPenoRzaYYe6UU0bIHD8cNPx
 rZhcXVXha4a8WJadFLhr6iB2D2ODbV2DXf+P9ujkQV5ylJalg/T5sgOxaXVOmHurbaXPDTj5xH9
 bgnQ6tRACiTZ+N433mFSKtILwgVN8EPEx5SsSPXNe1353BBCiQLUFE8BKu/o3FXO+KxMEe/juey
 8d8TBZ0upTBF/9zTR82rQphF8JfYAqx7OlhwIwoPbWreKwqB5tA=
X-Proofpoint-GUID: lTDztpx2sx6Wp8meKY3DVmIXbhRBUXWj

From: Eugene Loh <eugene.loh@oracle.com>

Most of the err.* tests can still be run, since they test other
failure modes.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../unittest/actions/return/err.destructive.x |  1 +
 .../unittest/actions/return/tst.destructive.x | 67 +++++++++++++++++++
 .../return/tst.override-getpid-entry.x        |  1 +
 .../return/tst.override-getpid-return.x       |  1 +
 4 files changed, 70 insertions(+)
 create mode 120000 test/unittest/actions/return/err.destructive.x
 create mode 100755 test/unittest/actions/return/tst.destructive.x
 create mode 120000 test/unittest/actions/return/tst.override-getpid-entry.x
 create mode 120000 test/unittest/actions/return/tst.override-getpid-return.x

diff --git a/test/unittest/actions/return/err.destructive.x b/test/unittest/actions/return/err.destructive.x
new file mode 120000
index 000000000..2cb5b1159
--- /dev/null
+++ b/test/unittest/actions/return/err.destructive.x
@@ -0,0 +1 @@
+tst.destructive.s
\ No newline at end of file
diff --git a/test/unittest/actions/return/tst.destructive.x b/test/unittest/actions/return/tst.destructive.x
new file mode 100755
index 000000000..d54bbb2fa
--- /dev/null
+++ b/test/unittest/actions/return/tst.destructive.x
@@ -0,0 +1,67 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# For us to use the return() action, the kernel needs to be configured
+# properly.  In /usr/include/linux/bpf.h, we see that bpf_override_return()
+# needs both CONFIG_BPF_KPROBE_OVERRIDE and CONFIG_FUNCTION_ERROR_INJECTION.
+
+# To check kernel configuration parameters, check
+# https://docs.rockylinux.org/10/gemstones/core/view_kernel_conf/
+
+# Look for a file with kernel configuration parameters.
+
+file=""
+for x in \
+    /boot/config-$(uname -r) \
+    /lib/modules/$(uname -r)/config \
+    /lib/modules/$(uname -r)/build/.config \
+    /usr/src/kernels/$(uname -r)/.config \
+; do
+	if [ -e $x ]; then
+		file=$x
+	fi
+done
+
+# If such a file is found, look for the necessary parameters.
+
+if [ $file != "" ]; then
+	if ! grep -q CONFIG_BPF_KPROBE_OVERRIDE=y      $file; then
+		echo need CONFIG_BPF_KPROBE_OVERRIDE=y for D return action, not found in $file
+		exit 2
+	fi
+	if ! grep -q CONFIG_FUNCTION_ERROR_INJECTION=y $file; then
+		echo need CONFIG_FUNCTION_ERROR_INJECTION=y for D return action, not found in $file
+		exit 2
+	fi
+
+	exit 0
+fi
+
+# Some distributions, like Gentoo and Arch, use the configs kernel module to provide
+# /proc/config.gz by default instead.
+
+if [ -e /proc/config.gz ]; then
+	echo try gentoo
+   #    zcat /proc/config.gz | grep -i <keyword>
+   #    zgrep <keyword> /proc/config.gz
+	if ! zgrep -q CONFIG_BPF_KPROBE_OVERRIDE=y           /proc/config.gz; then
+		echo need CONFIG_BPF_KPROBE_OVERRIDE=y for D return action
+		exit 2
+	fi
+	if ! zgrep -q grep CONFIG_FUNCTION_ERROR_INJECTION=y /proc/config.gz; then
+		echo need CONFIG_FUNCTION_ERROR_INJECTION=y for D return action
+		exit 2
+	fi
+
+	exit 0
+fi
+
+
+# We cannot figure out the kernel configuration parameters.
+# Go ahead, run the test, and hope for the best.
+
+exit 0
diff --git a/test/unittest/actions/return/tst.override-getpid-entry.x b/test/unittest/actions/return/tst.override-getpid-entry.x
new file mode 120000
index 000000000..36e160027
--- /dev/null
+++ b/test/unittest/actions/return/tst.override-getpid-entry.x
@@ -0,0 +1 @@
+tst.destructive.x
\ No newline at end of file
diff --git a/test/unittest/actions/return/tst.override-getpid-return.x b/test/unittest/actions/return/tst.override-getpid-return.x
new file mode 120000
index 000000000..36e160027
--- /dev/null
+++ b/test/unittest/actions/return/tst.override-getpid-return.x
@@ -0,0 +1 @@
+tst.destructive.x
\ No newline at end of file
-- 
2.47.3

