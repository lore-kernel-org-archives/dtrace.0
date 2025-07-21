Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735D028F53F
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753104910; cv=fail; b=j0H1xm3LD+V+iwxvwtO9b2TEDsLbvuKeWvdDhb7jQBUpKKVfZecbwFItXu0pVYkazUxxgVSaKkd7wWiJuS6lsIAvvNIkoEq3v809M1+lsX/Gt3HdDWYylCpmqv1rtBTOvkCCwf6zvBboljyupkTO2kJx2Xe46QD45lc+lvUoiTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753104910; c=relaxed/simple;
	bh=PH1t/wVschZMpoDKqqOw/x4dhR+jg7OGAlXUfsP0jeQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=d6eCCrlXX8RA3rLiYUGRtcPXbcuLJZxvtQk8vM0w+uOJUs3hrkjG69BG1mD1FG+CUeQENp11Yu++urOT6kTo1GIeuVLANqgku77d8/TB7vMi0lAH2nH2o/4z2jM03LfWeCYde8Jg9FkAJUPaXoU1GjPHgiAe66G2Qwbq3EmzvbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XdHpjg6g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Kq/MU/US; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XdHpjg6g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Kq/MU/US"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LCMmvf029314
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Tv5Rb6GRN2yT4FT8KN84lxNbrEm5JZXzuMmYvYZ0GUs=; b=
	XdHpjg6gszYWMgPhKx1cDP/NfR9nHbDanAn99ldyWoe1Zxwoz0ZxlJZUhfacGyWD
	mnLhqNmMqf5GlOu64tbEKDwXNJYsaYw/9kSTmyHbr7NNsrnIUG0pfxA2jc4sCtFs
	BG9Wl2XHqZjOQ7hdLvXqUbzICLNoIkay7M9PMdExsEnpHRoSdqcBc8Ef3IlXIhoD
	tOp2oXuQZMyaPvQU59azOgMQbogzFtAjTh268tWQp+EC6WH4Hn/V13htIjwhY+Tu
	Fa2paCEaBFpusTYtl5AVOgVn0Pp78mGCrJAZK3Rl31muKAOj2XW53fYe/j5S8fYZ
	beJvHAWT4+YQo2Q+NoM+WA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9jpkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LDABOH031494
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801teawsx-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 21 Jul 2025 13:35:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=orWgz0WyRHlDHq6LMLbcG/cO5mw5F8dUHzkIiRYcWy+pZuXLQxvUnWU3KJvLzHBmFzuqGKBkzhhQ7nsF4MDW/82LO3G6/KOjO0Fd1Z8AkCbVy6jM+g0FUi553Ws2Uyqu+gpUy+Unf2NHelVVAk4r2pyLElo22uo2NygUf/QFao0xs5GFLBNpgiEQ5hPauniOYVwutq5w4CQJbFk/HTVvUwgtUgXb2BJOnCTXNTjjxHeqxSwyF34rb9mjZGqMba/b0elq7Oi5jM6YbTwPn+VxYU9Ou/ZqsNme05nH59I+myLKmZY/hRWFXLQR9j6NNWwjwetEwu38EDLX37X1K0aAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tv5Rb6GRN2yT4FT8KN84lxNbrEm5JZXzuMmYvYZ0GUs=;
 b=KO0Bj/yy5NxWHXRSozff6ui1FtfBY7h8L2Zgk+15QeB+p2dDvIP3baoowQuA9Ni3+carxbOe7f+y/mLH/W9UQshzKCU+BNmVEvJ00gRC3LRSJMbsF+Go3+Q2XwJ9g+JftbYUFGnWUrO1sS4yOXqAKgYLoTV2FyiPb/GZ4CQkDLRa42lgo38mkppM0Rj9xO2mEZ4cii9Y1KPcsH+oSMA9agdjfolLXWTek2zCVBfVZ2jkmCV50GaVSF3CXgsSCEZyGsS5Lv/5ljvQK6NTFTqcX2bVlO7SDZTdrj5qu/18YrEU4UzAEUZmT3u5AX2yMJWIQtjECffvMrLMiWNkh38oHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv5Rb6GRN2yT4FT8KN84lxNbrEm5JZXzuMmYvYZ0GUs=;
 b=Kq/MU/USR/WktIvIONekQngaugahyucwL5rGhKlrbGmM10xyuuuVHAUzFFpAGodLNrTBG2gsUHpRfYWeJSCW5iHeUK6wUkdpThdR1oTLjOgipJEMFLbzHkSbjMfoEBiSSlU7RcueqmfLpjCrN5edaSZ6YxLD3byTZ7PGrieBCzQ=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA4PR10MB8732.namprd10.prod.outlook.com (2603:10b6:208:565::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 13:35:01 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Mon, 21 Jul 2025
 13:35:01 +0000
Date: Mon, 21 Jul 2025 09:34:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] test: change .r.p files from /bin/sh to /bin/bash
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:36e::18) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672FA7CA4991AE52AD88A9CC25DA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA4PR10MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: d1f20c9d-04cf-4011-400a-08ddc85b64ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zoLpwcIfA8l9bh7FKpgIzvisP355weYo0NVh6HuhZ9NfNjEH0GKbQhCHHdA/?=
 =?us-ascii?Q?Og9YDoz9JITcSnq5l47WDygYK02qI9kcdEMO6kOpto/Gw7UgZvI+sEgR2AJY?=
 =?us-ascii?Q?okORU6c3oPKXQxJ5eTXMdAGCkcl9sakWrQOU580cr9EW/bSpo1Cgmd4iafw5?=
 =?us-ascii?Q?b1S3rrBEpcNw5ucuewe+e169a6lf1npkvTkgMh5KT+o89q3+wgyfjc64eTiX?=
 =?us-ascii?Q?L8U/jNRW9zNO0WQViyMVpstPC772LXIqw0ZPu05ZhBfsCNR2rnD5SaZRYFCm?=
 =?us-ascii?Q?akwnwoDpjoQKWenoPYvOsqnGAH26ZQm46qqXWwUJzhrElS58vLt4xpY+E/PD?=
 =?us-ascii?Q?6HiCt2vdOOriOIlNoybqGZmZE2to07kjo76CUyrMem3F808fHV1JV0SqQIiu?=
 =?us-ascii?Q?vh1uPSFbm5VtCn19z9nW8meF8xIvYlZs+na06LwnLfm8g3tdk7aYTsBsvinS?=
 =?us-ascii?Q?1tm3j2tKGlYjQmMHkFXJ0oGlX+ZSGM8SKYMx82cSyyt7yeQ3JXUin+cmdHiR?=
 =?us-ascii?Q?rZBoWcWUAa/zhoGog9DqzZyaFWhb376mcb2sqyTOO+eYggKRtWlqvvBAUTf9?=
 =?us-ascii?Q?oW3Y+wIbWQu2jgSBPJz6H9fntemAEuRJ4qUM/V+8vyB3awv/Fb9vZnyEc5FX?=
 =?us-ascii?Q?bXK50e44fFwjf9ifF0GuGmOcj8feR9LBAzHFdYXZeJJdJZ6llgdK4RJXK2EA?=
 =?us-ascii?Q?MXXWqeMN1TeMupk/RR2sRrsi7jLJVKn2cb7ut1YSPKFFMidg3PrMlcKzMB33?=
 =?us-ascii?Q?FRJS8EybARkmhuB9kVjtqIyM5XF4YX1r1ksMiOfAOWCkNTKIgf7JiSUqpA/V?=
 =?us-ascii?Q?VgGgPorSy9zMc0KQch5WTEOTB599y5P4NeplOfO3EyKj7QHPCqmzHea6L4JZ?=
 =?us-ascii?Q?Ts74aP/YoEsF58PtmX8jF5mEShQoLqdCQX4gJ8icuo1EC1j7IaqSSp/zhgVG?=
 =?us-ascii?Q?NyORY0HS+hT6qDxPkGdlNQOkXMd1aJP4l2Ap4shcuVJ9NaTlUq9pi28WZoRe?=
 =?us-ascii?Q?nzBPDEGSnM4n/eKe1qDhJyS7nBNe39h6z6jdwKpgA4jJC8gX0Edq/LcJt980?=
 =?us-ascii?Q?mZmv4JAA/dMHeLCrFP39oR+viQ5VzZpZYpSxUyILY5kknqtDx453XW+ZxIgF?=
 =?us-ascii?Q?5Cwhz5UAYxSA0+RlmQx69dOLldh/5IwlvR3ZkYBq6WiozB4qgj8hUxgwKO5P?=
 =?us-ascii?Q?nSbfIY9nrBJcdc3R9RuaDWvKFOhxpNszuh3niMk2fvp+hzLtwrA0FpjaDUD7?=
 =?us-ascii?Q?V6bGuizNwuIwjslsIA7dH3qfL3fOupe4eiR/C/AbNBrNS+FYGmh3YJyC7h7N?=
 =?us-ascii?Q?8hGEEVKAa3onrSPsS45BI0OMbkNmuzy1XleMUiQfR0JCVMz9OpQ1Ty2yLS1i?=
 =?us-ascii?Q?xooZIfHeSttXA+6oWZMxOn1pbvViY3EnSJZv80b/umRUDiKMTJvqciFtWS16?=
 =?us-ascii?Q?2WZ+P+Nc7jw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YPeYssgGZlkhgNIcQaaREiSoepv9k685N14fnMzHgeMTXN6etN1J8z8AlZSg?=
 =?us-ascii?Q?zoFjLFhE303/qanjcvKoZAuLP28LWlHw+BDJv6ldQJ9mnMV8Sx+mDC9mThFz?=
 =?us-ascii?Q?kB79pN1+iKoPOAXxCbhFcdr5rxoxkOA2PUlPqLaKRffrW3lgU6XNdZOEOUAY?=
 =?us-ascii?Q?aCBrTcp6/OCjzV/zC9Bmnj/YRt9+i6Ai+gS/TO8Gl8h/UYx70ZkXHnpyHwci?=
 =?us-ascii?Q?eDIohntonBKRt/YeW5TS4lYfYHUu7T1lhOy3pR5+XWuVGTrttkEPSA9lt+oz?=
 =?us-ascii?Q?0cYoOHdpyJEr2EdGL1D20S2EgapEeHvS2/XqbTMDJIs3btyBS+7M6Ml0kvAo?=
 =?us-ascii?Q?EPJBaAbzeu51JuLe6Qzsp3f8pTcVKc6H55P2/8fKprs1oTI2aYite6t1YkaU?=
 =?us-ascii?Q?fuiy9cSMcQM88EvLfMV8w8GCbF+iZLxAgeYfSnAPY+eKpDFC7AKuDgAXRqX0?=
 =?us-ascii?Q?HjgL7j7VcefvTv5vjAR/CTXCuHrerxW811uHpD4bYzawIuG9ttBBs6/lMyQn?=
 =?us-ascii?Q?4JuYVvsZoWz2hdQx5X1keEPPJZDR/lE7+XvZt3Jal2aCjB1O1NcJFJ+KCDLu?=
 =?us-ascii?Q?JnrZyjhLxTi+yWurasjmxA2dpsf3F02/cnsq8skVKVV1hSgxI+W4c7zHoq7p?=
 =?us-ascii?Q?XhsnI5KDcu4cacQWKGZKJSP9qP3kdN+8VLhHri7Zn0Xn73JLqHpM8PNJbfQo?=
 =?us-ascii?Q?gKooMuthlBWKhQ90W8//gNz9HNcrHOSF/pNoAJ0Xw9+qwbmLMB9sbuucLHiR?=
 =?us-ascii?Q?vLpcnJdJncbXe2Ki0z36nxaWEOjORVczQwV34aimjeufVhbgQz1K3PWrR2UT?=
 =?us-ascii?Q?wc4+z9P8jObeziCFcQNHHvux0qLpDb3dQDTPWKjLeCTGBh/e7oa3xe20brpA?=
 =?us-ascii?Q?rkv3I7teLIrR88uvVbUPkfpAFE0b8o0N4oJ3/2dNA77fvffzXCIZdLpv9mj9?=
 =?us-ascii?Q?8HfGQQfooJsBeZJl3WvstZyxnqCL0YNFFhracjkpdt2lZlMpUjlI9qSfkYkr?=
 =?us-ascii?Q?M37Pev2420UpbqASSZhdmlWJBylBc3/6XLl3MBkJUDHApXAIfcEnGO1Xy9/R?=
 =?us-ascii?Q?Tw8tNAmdw/DEizM/nmR96SSIPs4GSPMULucUoRNE80wxxBMvk+0h82saY0vp?=
 =?us-ascii?Q?SBeOCOWodsMTtLJeRqKGM4+z1x4F52qeyggcEVz7tx8xeBK/IxiomkXhrrOQ?=
 =?us-ascii?Q?m9dm/dNK/ZdWdZ8dDV6A9uDFO2q2I9rKGS2l1m4GB6y9Ws8LMfmU7eAo/RXF?=
 =?us-ascii?Q?K4q345BQ9UbYvxvZmanYEa0Bb80vln6vwHswqNzca94HiniOZkTZQ/C1W6tM?=
 =?us-ascii?Q?/TDHXNJ7gGeN5GVfy5SMoH+GiyBmrBYZc78w4xsaZimpmLuLbH2iARJxpgPM?=
 =?us-ascii?Q?VQzvRA0864UepwT9+qtlk2KBmdy51xVgOb7NctRliY2xIAB4sledSfEDMPg0?=
 =?us-ascii?Q?6XJQPPv94SYiSYA4tBuN6GifWWVT2Y89b07PfeMgQZTJhb8BlwRfI7xS+i7p?=
 =?us-ascii?Q?+WC8BqGxhC4E9z8I8MrsK0my2D6EmNGNhlD3oDpHIlf0UYuwSwxcteJafa28?=
 =?us-ascii?Q?f46/SwmqGMkOsxtfz/CzJ9GKV0jZteeV/IBbcnfxEL2P6S9aPHzPWiBRlVgF?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GuGxW0jE2Ugf78HLDYksjp1vbIVeORgefsK+WC9sUKrUAY3k/H+4YBbTVrFrBEesTBF4u/c4wgTYrADxA2HiX8wG+G4Y4hU9kCV5gX93pfiTfx3OnLfvxyJ/e6RiLuyczuyaj66xMBYelHT+02VASB8LjkKvJzExzKvEbWCVWSF2JSbSSROO1yhuUX/e9ESxnTy7rIFZfCaWMqF/KeET2NBtFU8MGq+142Ldk/ktm34a8GlUrcLf3HlvQWN0J0HR0qsTJiNdFuEuPA0I7YWcoy4PKtMaKgxVLh+ew9FD1qY/Ac5bf4vXPi+j0Fj7VyGfnCkyHKN57EFmCPH1VD/RAiEhkZgSNaQcE4wjZl/EryIDi6atrdBsnFoDNeixbixvZjMimaUKbw8nSL6xoWd3NqP+nJsvkpx4t8choCsonXhLzL9wts/4GK8p3QywLWrrx5ffdeP8xT8ubfo7bNMB3kPV7fW+FcCKSGbmvMe1SXhZ69jex9jPzrRiBtEVXcDdbFMuqJ2MAh0H8QybaakX2dUhdvW2qfVvIRsI6FBJGP+L0RihMlXXxaf8AyS1wgi5qKV88fX1esPs4LLtBc5XOsXEFqaavrYQZY/U5TSQ0vc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f20c9d-04cf-4011-400a-08ddc85b64ae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 13:35:01.4545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqdIq6hNKGPPXVYOu4vvlDyqazCe2GGgw7E1m13bsBowNm1RgrBAlFkQhJt0MaPo2KAnZkQKrX0sBMxN+V+KuhC+a60yBKtgYJiQ6v5omA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210121
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687e420b b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=-pPozt6szE4o-0X8R4sA:9 cc=ntf awl=host:13600
X-Proofpoint-GUID: ATXxOFJCJSmxa6gi4mmIiL0_ocIUXtgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEyMSBTYWx0ZWRfXxspGbfbFG8eO
 RPY+iAOWD2SWZPh/Gsi+KBFx6fChVWAcPFC2kJ9AxkLhiVJyAE2vzwtQkGgvCHzisQFswuD9tAA
 L3hv4EtprGITal7OgrNFWeqfbMOvdsdmRCBZpOl/itl/VbQYyAainOfKNWHL6z7v9VG9OMotcKW
 1F6I48awGFPs9t0bZlVcIfitXUM6IrnYUJ2H+fRzpTE3vMz+BCGjLXsp+AifZL7RD3lN/kx1NFk
 qEly4f2uvWHsKpM+ATQ+xh62mFCsBh26+l+Omj+BjnIVFjbu+CdSE2XxDaSs7xRRUAHXL0xRviA
 68NW2TlyNl54UfeH4lodhEgQBrz9qtpbtyvBH/Rg6bKIZmUtfKBWjvuJNOX99jQGDGmAP8XVILX
 XVRobTZ8ZoJ26ihr+OwBjmkRV964iaPyVBiT26U49sKkGDQnHi3O4Q/LssIHqDYAYKTar4WH
X-Proofpoint-ORIG-GUID: ATXxOFJCJSmxa6gi4mmIiL0_ocIUXtgA

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/ip/tst.ipv6localicmp.r.p                  | 2 +-
 test/unittest/proc/tst.signals.r.p                      | 2 +-
 test/unittest/providers/rawfbt/tst.synthetic-entry.r.p  | 2 +-
 test/unittest/providers/rawfbt/tst.synthetic-return.r.p | 4 +---
 test/unittest/ustack/tst.ustack25_pid.r.p               | 2 +-
 test/unittest/vars/tst.ucaller.r.p                      | 2 +-
 6 files changed, 6 insertions(+), 8 deletions(-)
 mode change 100755 => 120000 test/unittest/providers/rawfbt/tst.synthetic-return.r.p

diff --git a/test/unittest/ip/tst.ipv6localicmp.r.p b/test/unittest/ip/tst.ipv6localicmp.r.p
index 904102ac..fd1ef30e 100755
--- a/test/unittest/ip/tst.ipv6localicmp.r.p
+++ b/test/unittest/ip/tst.ipv6localicmp.r.p
@@ -1,2 +1,2 @@
-#!/bin/sh
+#!/bin/bash
 grep -vE '^$|data bytes|bytes from|ping statistics|packets transmitted|^rtt min'
diff --git a/test/unittest/proc/tst.signals.r.p b/test/unittest/proc/tst.signals.r.p
index 7798fa25..4044a64f 100755
--- a/test/unittest/proc/tst.signals.r.p
+++ b/test/unittest/proc/tst.signals.r.p
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 #
 # Eliminate blank lines and the monitor messages emitted by bash.
 # (Turning off monitor mode should quash these, but it doesn't seem
diff --git a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
index 18171f04..59dc63b4 100755
--- a/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
+++ b/test/unittest/providers/rawfbt/tst.synthetic-entry.r.p
@@ -1,3 +1,3 @@
-#!/bin/sh
+#!/bin/bash
 
 uniq
diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
deleted file mode 100755
index 18171f04..00000000
--- a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-uniq
diff --git a/test/unittest/providers/rawfbt/tst.synthetic-return.r.p b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
new file mode 120000
index 00000000..7ba3ffbb
--- /dev/null
+++ b/test/unittest/providers/rawfbt/tst.synthetic-return.r.p
@@ -0,0 +1 @@
+tst.synthetic-entry.r.p
\ No newline at end of file
diff --git a/test/unittest/ustack/tst.ustack25_pid.r.p b/test/unittest/ustack/tst.ustack25_pid.r.p
index 6486f7ec..c0110e00 100755
--- a/test/unittest/ustack/tst.ustack25_pid.r.p
+++ b/test/unittest/ustack/tst.ustack25_pid.r.p
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 # A pid entry probe places a uprobe on the first instruction of a function.
 # Unfortunately, this is so early in the function preamble that the function
diff --git a/test/unittest/vars/tst.ucaller.r.p b/test/unittest/vars/tst.ucaller.r.p
index 8e03f110..23255a14 100755
--- a/test/unittest/vars/tst.ucaller.r.p
+++ b/test/unittest/vars/tst.ucaller.r.p
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 # A pid entry probe places a uprobe on the first instruction of a function.
 # Unfortunately, this is so early in the function preamble that the function
-- 
2.45.2

