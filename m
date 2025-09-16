Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299682DECBF
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758063315; cv=fail; b=t7ex90s5m8fcMcvvi1QgjKr4DlimtNjNYrZfCafU4UzSGJEoIloiJwaeiVnouA2g0mKx0P1xNuOLVFwZdWnU84q0TrDKfsLai2D8IjOaEDfnvHyyl2xA31YLwLhWmxLccIkLrE+zUCAJ7brF7Uls2Z65cyb6vRAgKHQSLt74Yq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758063315; c=relaxed/simple;
	bh=ZHZjSX8VrvoHC+pzzOQy3I4aVv7nldnuBuo9HaYKlAc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=C9S8XY/KkVZVvdXKD2/E6a4yNcuCeHg8bD9t+y5Ru42DwETu9Ta5JSqTI4xRs4KwJahx68WG28g9LRO/33QwPbBTBFHNn6INU2eQml50+XjnfjJ3DRck6C4zT79t9H3OrzWbCa9CeCiE6mm4qHYyf+/UA2UGMzQrYixiVBhTN34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=enL3yiYJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I68HxGRn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="enL3yiYJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I68HxGRn"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLZAWs012988
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=HW2xw9/mDB9/t7xKkUzGSHtrj8SqdqX0EWk7cFTJYmM=; b=
	enL3yiYJZuXOopUgrpmGe27rxCHwYkyp5bgf/WjOMw4wV+ofs/bHZicu1Rd2uG5P
	dzGHmDF+M/j7Obcn0HpuHM3K1YmeFPqtQGGuSqZtxa95TfThe8YCm386A31Hx7NZ
	jpZJpFYeJY4f679lW1ulb059W0G3ZpetERrHxJQ4KBBke0eF40fy4k2nKbYn4UTr
	TDk7ObnAjU0LE1ToBcw39DVCPTvPcvQ9dKXBQBwVtHKR2o/C0mMh31rzey2Q8j4n
	TVYjOYKueElo6pLmRBUvNYeW3A/CDkocD5PKm/5zIKIDRyx/ttTCJa7CDjci2sKL
	BNA67PlQnSFf+YwpioD2jA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fx9r2tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:55:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLP8P2001501
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:55:12 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2d8ppv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 16 Sep 2025 22:55:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJYISrtjqa1DQiP5y1Rnyin1DEvhoX3xtO4oXOHLT4RMsh7QmifWSNJp3tLZeEf446VIKNEhvaCw1uWUCwUsqNawPibufCP3AyI2gbtLRdGqAv/TzMYoRVSbY5I8qWaZFhLU4/2YeZBekAQBnZHsxXGmbHtUr9fUad8+wEVvIRSQ/iJi+qZ1agGTHvvReUw3KYo2zG/Th0Yse5iuJCAbxNdVzQ5zMPoWEpELoV9Je1gnJBiA9wiTMBNnE4/I1Kvqq4DVaY/iW3Gb+8t81cYGmhKhRZPhOd1LdDqVeFHiY4UFGVgZrYSGGw7eauGVWD1yRxyvZPZieJg0krU5NtNfpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HW2xw9/mDB9/t7xKkUzGSHtrj8SqdqX0EWk7cFTJYmM=;
 b=ZL57KYXXY2BPYdpIg7APfsISA8hjBoe+tXP+qt1LfbRtKClgGfM+9fdXuJvMbkkth1sLr7hkGpnEJxvkLPe07f8XkqOHr4iR58oVHlVUmS+DWxMcoxs4LCsBaJl20xKxMxDNv6jMqIvk7uRaMtegcsRZbDw3NdDC+r6IVZHNZLkdruv8H9cmapC+yerlxJS2k25Du29DU7iT61oltui2arDI2Ve1jiLPRLKZDZDyUdoY1EEZ4DXeCmzsy4m1E+g4DdmrlmgYbyrWZFY6viFmm789Q2Sh28L3jVhpglHKoOzu/wN/nWTLIXHoZL6BXJ7y+NwRrmxI5fMiCv+yhVaHcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HW2xw9/mDB9/t7xKkUzGSHtrj8SqdqX0EWk7cFTJYmM=;
 b=I68HxGRnVwsVkC1lZ1nmY4y+M4lV4rtXIkAwnqYdCa5NcMOx6bEbj11OVrPvRoVF9pdAQ3iPUaQOYsW/fLeq1ATlujhTrV3t8JTWKDlLllfbc+Ag7J4wxLmiCNirFAOEeIudpejxERXg7c9/WQxab6R/khhr5dHfI/doB4rfHgk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5074.namprd10.prod.outlook.com (2603:10b6:208:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 22:55:10 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 22:55:09 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Add trigger for more predictable run time
Date: Tue, 16 Sep 2025 18:55:06 -0400
Message-Id: <20250916225506.7929-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0020.namprd20.prod.outlook.com
 (2603:10b6:208:e8::33) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: bb07e1ae-a308-4153-72fa-08ddf574165e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oy/OJv2j9Cq0OfCpX6mtMzCpIiBs53cfmb0xSv5BjlqE8sPcLI4IPmRiDKq2?=
 =?us-ascii?Q?RkTaxPNImCUMTjKyvAycPk0j77ltJMMtS3bmPGs1zN4cgYxKHA2yjH3f65uY?=
 =?us-ascii?Q?PLyOhoAs1gSFeqPUPHxbucG86kIRh5hsKGXEdJXx34k51hfBXOZ3LOQxhdS+?=
 =?us-ascii?Q?hq6V6QrY4ywddTzf77K2OWZKsVuhBtFxQazWat/w/767vTrHc9/W6uSdpEIu?=
 =?us-ascii?Q?+JPp3nOIUlAkXIF4aGSbA+XGB7Q7iZ/asJl2F6UK/j9cnqlDOIM8Z0C5iX1s?=
 =?us-ascii?Q?nbgy3gTREu5hWZbTOG6Nu7hncmJBnkYRzgx9Yvn8BFWPc+CuDQpJ+nEvk0PC?=
 =?us-ascii?Q?pjUBrQ0GBWOX6Hr11imzGgh7BrDn9eYwoxhL1YLasfKrGW3iyd9+GP2tksYB?=
 =?us-ascii?Q?H/bkx5mYVPm5a6iKGylgZ1T8CZBIZopZXxTC3KXqSnuRug1D4qCNzZ9nSqVT?=
 =?us-ascii?Q?8TqtQCny2vLh+8rTqxQSJu1OVbI5cSMIjMP6k81NAresrzonIDRxdm2Metr2?=
 =?us-ascii?Q?t3hDAGmbrPEvKsb2P+yB84ohS1GbBd9/GGTp1cueDBi3bl32321RI23UrtOS?=
 =?us-ascii?Q?tBGjbsQun5ECtgref7wb+h4fkZFVbpI9RclatKFQMEn+lDJchLMxzRUw2c6j?=
 =?us-ascii?Q?Xyvz0bxL1e0Xk7V3w1ozt9BN7LxDTo9SV6OoFT1Ml8B6TnM0hiK+/zTAe9bX?=
 =?us-ascii?Q?3AulIV8xeorjbqv7EOYmzjW4T77cyX77kkuERu9zkQO58OL+w2K/cdZdyFQe?=
 =?us-ascii?Q?5ZqxGRL/L3WlRygcco0YBOKnetKdqBGkv3RN5R3P6++ZacVGeOTw2QyTi8og?=
 =?us-ascii?Q?4NbV84/9IPnaaPefj9DaypKWo7RcHNGZz40IXELjFVt30PUqmuTXjlCKxi2Z?=
 =?us-ascii?Q?LFGAJ8rkf7PgYUTylvxRHpAgx9SYfITp/TAfSFk9b9s8mqOkrRnJMAPo9Ju7?=
 =?us-ascii?Q?DhUQh1jJ7GJzF+8CHYdoAozGLJWiWttP9HxI4oBwjGGrLBAMbJeM/2rTvpi+?=
 =?us-ascii?Q?+VymqCFnxx2PVkBr/W39FuwJfpklSIBr/jRuOLv2aVeYqpRE+qDKFACVDSY8?=
 =?us-ascii?Q?OlphG2Y2xQZzF4D7VD6gsLgIcJ9lX2LXQ78CAc6KWPs+1tKX6GF7pmpwXM+K?=
 =?us-ascii?Q?0btMKSeB81WWQrWw3BWJLzZEGWIXRyRPQbr+6SYlip5QPTZq8y+JNujkB15g?=
 =?us-ascii?Q?U1538htMWgXa5P9d4Ru8XwKol4FMojYIwbo7PCCYWoFv+N0J1PXV+LqYc3hS?=
 =?us-ascii?Q?8uwz0J17tcFWyywAKU6g9WyOQ6AtuuRw04Aoy9fBGJiOQjWOsBNREaMB0NAP?=
 =?us-ascii?Q?/mkXITr44hOEABiK+dwYFmyN3xNDa/4NLxbw5a6RlpsdvPt5OsmbMPTOWe9v?=
 =?us-ascii?Q?koYASxX4JaFDub7JXg6uaZIu3aM3DDrasHX8AmG5onpPGm5fP0ny/6LZh6bF?=
 =?us-ascii?Q?bH9Ik8qUa5w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UTMgVcNul7L+7oXAoznG8fQijtsl+pgIEFCQlX/eWRumOi5tSP9G3vV/KT/r?=
 =?us-ascii?Q?PhNdeVgMee1bQqLZ/uxa5NE9NfmRY3ESc/6k9fcKDIiwQRaw7MFmvznQZUmK?=
 =?us-ascii?Q?49hZ8z3vj0iItuKGIcdbqDkgtF2sPdxBv4AW2AwkleTbFangPYKDVTnFr0po?=
 =?us-ascii?Q?olAjP7l7Kjogh0V86+M1swdFrIp0nnRQqI9vw6Y+A0DW+Tv3XPQbVniLdtR1?=
 =?us-ascii?Q?Z/IG9lIdz6nFfOzDKZmJ620kAR1eK/1wJRuFr3PdqbavocOZSUabCB26yYBO?=
 =?us-ascii?Q?D/mnDgXyQ6z5fVwGluUxLFpzkJHJS30/4PWyOTIylEtQRAuAFZ3jG4E1Kgeg?=
 =?us-ascii?Q?Lx4gKQR6aRDMu8QMvRuMhpNM8/ywgzpUVHUwdLCZpzS1mbvk7CsmoyiGrJqz?=
 =?us-ascii?Q?GLv09NqR6vecy2iQyjTsP+xxlWpYak7EA78I6CgYn2CNvA1rADTcjGw0nzrD?=
 =?us-ascii?Q?xgrtxYsRkclHDndfi9WMkP1Oc9EuUhzEHv2DLbV4+AXWX7bxDewGC+OYpKq5?=
 =?us-ascii?Q?UbzObjKFUU72BMWpuGk5gYhY14Rb1+WcE4WEDUqRtIXM+jFj+n8/vq/Cjlmh?=
 =?us-ascii?Q?4tgAsSu3QWOkU+3pPc6SMGGttRkiYAPEAe6YD8wvrebnEkqR3Qxj11h6YFGi?=
 =?us-ascii?Q?Z4F3B6S9BWGqm10Jt7IiAQzWXw/vu/BhkhJKdKNAfVoJXINOPnLo4iF3fBc+?=
 =?us-ascii?Q?ww4MYYqr2WBq3XBoKP6/MR1NGMQ+Pgo+twl7Wi55KXf+PqThcczG8/LcIIVp?=
 =?us-ascii?Q?3c2ndvU48DuR9SdAPdqgDxmyVRWNlP1Eu6biCKKCZwYfwzqLE2XmDmDLRh/U?=
 =?us-ascii?Q?+WQZCCEwYeyp7BKgwTkH7oflgGpNQOZWA0qGPAYYQFCQxGiTG9lROTLNO+7z?=
 =?us-ascii?Q?c86heC5mljcYEBC/WWPu2z/k2WM8IpNiektZQhB5BU/cr+9THQ2+WxoCGF2l?=
 =?us-ascii?Q?zHYX4Eao68N+vfb1gvpoicBejElIZgy3MmT091YXygdbWhjhyBp33DYAjdXY?=
 =?us-ascii?Q?4x6y+ttYffE4x7owHNUPFWC6RLL/tCf6UgOvTHPHf92JI01fPOY8ZioxQUrK?=
 =?us-ascii?Q?VsAzO/owLZ/DL8tLYruh6LaDppcAtmowwkV/KrVoSbUbqWHrp2ud2Z8G5f8v?=
 =?us-ascii?Q?U7jOjMkPaNhQXWnV0IBmmx+vUO+zcvxWo/CppK5q1pjdwE/AjtGHg5sriU7I?=
 =?us-ascii?Q?+UKEDX5j4XIQW5d2XtgC4NKZecrOcUnSqUkZAK/lN6BgtNjk3lXlfuseVds3?=
 =?us-ascii?Q?OQRG5w3cfIjkWiX9EgmEKl9wXihewUYPpKqrJRcZCMLWNpdG0ie32eWoenIz?=
 =?us-ascii?Q?vTre4wccGFEolK6VKlRhy4wOlV82U/md5L6Fe4Ym1BDIBWZhbsGaJoksGlUR?=
 =?us-ascii?Q?6EbIrK+qM1Q7T/CctUHFoNcITixtnCd0liFIb3+dlztX8YUikMvIcvhQRfT9?=
 =?us-ascii?Q?WBrSTGAlCCfCH3nk1+GS/yk9ceXdZOfVnu9G8RXbAzHmnmH0WmxScghFwZhP?=
 =?us-ascii?Q?WU12As9Mc3TcXMzr9LSdsuWZwsYX7N3hh598gWJrQ8FcZcGOWlOHnBXkNJIp?=
 =?us-ascii?Q?TMD24bG+4cl6zXywYHRkPg+UMqVJCOOhlSWCbgGF?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QE0x6Myb7iZAAKTREAted84OTKzN/cjp6p9HJSryZzXmpkMcjzmhgqTqPlVvOl7NnClAVgIlsGJRXcixudVbCN2Uz9dcgJytGCItMJjWHoroYnJv8kkn8GwOIwRpQuqi+dggg4sz3lC3gXJwPtTQaZgEEQHzVxckFnFfk0u6oFdOgg1G0mzWLM0EZpqCcr0U3j7Kn5vz9uOmyvWi19cKBJm6vxFeeOVxIfBxcZXQbDHVL+Ts+WBJCk8AGuvaaRLgdZys4k1qY/sDDjSRc+3KUHmuwF3xb4lQbg0s2IOXTfmV8SJHWAZyxAXNul4l5wqYwC0Cn7Ecz4RMFTx7d47iYBNrqozkHvWcH1sSaDlRN4WQtn5H9Uxg1rH81Hpd6Ej7NXYfzZ+YRMUrxwlkA3g+RW7ZIDPBVu8yY9jtc1yb1F70lGeyiGwyttuUH4z1XWkIWahLNJZMcQtJPrRDuvyVXJfkX7EiS0Fx+KpN2xY57PbGJWHX3W4K1xtLXye38HqUXAKCaV531jh4kf5+oB93+28NRXpHnVWzonFkFJEPPednH7QTXQ6yQzETSMzHAg3TV1Wi0IwmXQZKnVHffBmaUgnyQo7juURMnHMUvlSLeBE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb07e1ae-a308-4153-72fa-08ddf574165e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 22:55:09.8431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nurj2h9UupA6ktCfZ+ZMETTrqoEdXPEBoadsSAqCJeiBxlLfwVrafuQLboAf6DFeZ0yj1yXMUke0Qp7zODGIVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509160215
X-Proofpoint-ORIG-GUID: PJtFDcIpgl9q8Etm1vhGMSFaZ_KUyO-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy0asr/HnL1Xe
 gCQMqL4yLxGg+JFfsOGVCIEjX/NuBneGNBgKMmAZ6C3XzzBy5E/yuytl5EI6TLnKdbIGaFPaS/9
 AZn1ebvvNOp0xA4Z36wNd/v1TQGXRvE4EQYvi+hnThHU0e71gb8F5HeI1n8CHSCm/3111yFVoj4
 jx1FGd02SD4Df/C+kETZft9oR5QM4Id2IMMI9t6efwo4bAY4BK5zJBci04FEllCUIn7xHlHksRU
 46f50Ac403ayFuvJUJMZQ3fMVmpGrCnvYfJdrgv99Qh6aCdWhu/nZE0KJAr4LukyIpB2Gjtcx8W
 x7wcI7m9ORyUzmRm8iOwS4ajcm9y/4cp4n267ewaDSUiQCIpfJzN1TKTUENtGcPLjIBIplOllaT
 9fRJ5a2U
X-Proofpoint-GUID: PJtFDcIpgl9q8Etm1vhGMSFaZ_KUyO-e
X-Authority-Analysis: v=2.4 cv=C7vpyRP+ c=1 sm=1 tr=0 ts=68c9ead1 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ue7XmivHplJnLnhbcKEA:9

From: Eugene Loh <eugene.loh@oracle.com>

The test had no trigger and so waited haphazardly for the write:entry
probe to fire.  This typically worked, but led to variable run times
and even, though rarely, a test timeout and failure.

Add a trigger for more reproducible and typically shorter run times.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.argv-corruption-by-error.d | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
index 6fd1834e1..1fdd89858 100644
--- a/test/unittest/error/tst.argv-corruption-by-error.d
+++ b/test/unittest/error/tst.argv-corruption-by-error.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -13,6 +13,7 @@
  *
  * SECTION: dtrace Provider
  */
+/* @@trigger: periodic_output */
 
 #pragma D option quiet
 
-- 
2.47.3

