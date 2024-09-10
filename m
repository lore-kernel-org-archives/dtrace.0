Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5618E1E
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725942802; cv=fail; b=m8rxux6uh2PaSzGc5gKJZga6k3fBjXfFNk0htg1GCS1qvfHrYEqYU7fwtOgWN+kxI0VXby4gaeNLe+7+O1NXpFeNVQj/GT4EclfDzwF3PjIsnTkYQtGOHFVwvH5SSvROfFBIW052bUH0k5BJ5+Lvc2tCpuWuz1NNGAdy3Znh+Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725942802; c=relaxed/simple;
	bh=am+/o6lHnsDRs2OsqQo+PXFhjQcYKXOBWxBeXPOAh+0=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=TxEIyWb2alWN2D30C3xdt6Ff9p/zaU0BE0Oj2E6hCJIW64iZzsqSYH9cL3YPN5RBGwbFCum3WaMPcUIS7SgQBL1NQfnlsoM0jBY/FuRm1xuh2bos1k2r1cTp7kvN2z5gXnm5fX/RJ31yRR6s06AKcJp2jjk7lOK5NFPhB8avdd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lGYohHq6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R0svukJW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lGYohHq6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R0svukJW"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A2tVZT020451
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 04:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:content-type:message-id:mime-version; s=
	corp-2023-11-20; bh=OBZPhb2lf1tN39BZB0yKaMa7hpbBY6k1G5A3HOsp1Po=; b=
	lGYohHq6aTq35T4QIgvGU++DbOU7JigkJyOMwrjOyRJaIgheY+8DPMibsYbd66Rv
	8lNgnRD+rTflc/SGt9mWX3wHjxu5R1BhK6A8Dmn8mdoHK4rr/V4s1ttpsq99wvhO
	cVo6zrXp/vSghEBziOmuluPmCWD+jP2DnWmXy/CK798fF6LUqC9e/kBzAToq9+nY
	xYkcwIVnVpU3gnhWxOj5f9gTjCMHGjd4q0NoqBxqFpD4hCIhU9zlyaz7ExbaYEoq
	pkElvVv6HjR9Gch96PvXDCpOLbk96t5y1vrRy4/kZAXdjzzXrkPEt5EnImwfmf9G
	6oT1y1OwW0uQ8AyIBQKkCQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41geq9mgng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 04:33:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48A1c8qO032452
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 04:33:18 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9eae3v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 04:33:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYNy0gKqaWQBVdwXbu6AHM6M6aKwMMAPkgbgjMwyrpcn90SU83vpxd+x/CVO2clOrJm0jrSWKS9m/sgcuOVdGHBu8cZmUWfJOGcGDTd3QAZDL6O3txQFkCYx1zW0q51mJgfSj7e07uFZ8AXSGvJxmnKLyn8nsY39P+4eSIhAkfGxJvZFdbTUUjtCXrAulSN6v/P+E206TUQztHofJ+em6f9eEBzRaSbUOR2rJMU+IDRkOdsxbAIqKJFI1GgrZAhM/DEzjqPiQKCd02hSUFHOXSP5BQafaWIxoBnt0I/Rd88DVJvpWsi/GPtgV7VvS/UU6Z6CR1kgI4OFK9wF3w/zmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBZPhb2lf1tN39BZB0yKaMa7hpbBY6k1G5A3HOsp1Po=;
 b=Eo+Q4v6jeTpthlkk/lDPMAARrBeaI4Zr4DYzgShdJ5j1lxr57VwHywugYyDU6SkWyCTf5kvJyMLh2qX/AWntGB5d1rPeRvfFqFe/KdRzYkeeS85Ee7U10f7L+cbl7jMSSTp90G3ssKxuAfCdOq/y3g8mbJoCNridTEk96bUwEus80IU1TvaMGDU9p/cMK5MvsytH5xxHgzwRM/yxlAWIHU/qg5P7lm5JTAzl5DWw/GZkorIp0cmmocX72i0xsHFbXv23JwYoqfOxUcqZnMh5naY/vXgSZ/vXULvft/HjGpE/3oGgj/hoZE8Rtvy674VWz/vvjlebaYD6ckcdCkiPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBZPhb2lf1tN39BZB0yKaMa7hpbBY6k1G5A3HOsp1Po=;
 b=R0svukJWohjBZO7d8mr+/KwO5iarc2atJ+AoBNudia+IWYONhKsECgkfVA7N8SoLQvs0QzzAHT0tJwoAL2cIr3cwD67ycEGM4ne0i4mThOOOJqiBPMdkKul2MMiwplcgOZUC20mXD6vTF9w3oLMckteAaPi6loKcjmjyVRTEKIQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA1PR10MB6640.namprd10.prod.outlook.com (2603:10b6:806:2b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.12; Tue, 10 Sep
 2024 04:33:15 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7939.010; Tue, 10 Sep 2024
 04:33:15 +0000
Date: Tue, 10 Sep 2024 00:33:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] error: ERROR probe firing should not corrupt probe
 arguments
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0262.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::27) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Message-ID:
 <SN7PR10MB6287064DED46D0F4E2F055D2C29A2@SN7PR10MB6287.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA1PR10MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: 07bf3d68-4015-42df-d2a5-08dcd151afbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ktAP9hFjWazvLp9B0dlqzI1YcrqkBxToRlFVxAqP/7DS+NPgmNFlzs/1L/15?=
 =?us-ascii?Q?l58t6o63oIDNF9sBaNVc5m1VaEWGwVtc5alj0tkzm3i3GWf2v3Y5Nm87CMBo?=
 =?us-ascii?Q?+f5Il9olM4HEDDwflWM9xYzen1llAKA6YY8t3zr2w/4mx9RRcfWux/HIiW8g?=
 =?us-ascii?Q?oaXPTO3U5ksewOlTqrvbNdZ/p9SHA6BD2W9yg8OY6scYwchw7Odf9Ygm5Jbs?=
 =?us-ascii?Q?rq0SfU/l5F6jcLIPKg4WGEXWlouO5d8guW1i1rdRswuV2Y50/b2QOABCtfhc?=
 =?us-ascii?Q?WiqjedRCPUrm2CSvw4Mtmzx+31c/1Y0AeEqtrr8VomeHTXr+zg+3UGlYVEb2?=
 =?us-ascii?Q?KWA3XJrZCLc1Qf85SeD/DkqX2RTVTpirOyiDZ7IuThBAjGY8Gcw9CDoF8MYV?=
 =?us-ascii?Q?mwCr6Xj1zLTs48KWcy+vN1EuXqAjg+pMY+UPAFEjP8sKlQgMWO7dOwPJOVhL?=
 =?us-ascii?Q?di2Q9O5dJ2Tm47uUjrs+lylFx1zYSWqeAE004M8OIC29zHWeXA71ds9q/VB1?=
 =?us-ascii?Q?o5dM2bWMY/ZSskO4MVSvURb39XPu1Uy/znVion/GCAp8/oAhfLqpdUUnLBKz?=
 =?us-ascii?Q?Hx2yUVJOtYhSYLTImd332JvbajkUUwyk+PUcV7H0xCPicySqNt2po+RnXklJ?=
 =?us-ascii?Q?byN6cV092jw7kdPhDrc5g0jL3WjVi9ZXTnwRrUXEnhNuvg3Wivi4xcqZdml1?=
 =?us-ascii?Q?YrnT/Kx+vscTsq1q9qOTWKX23dTollc/6DneT64n7VaaR+dueVCcTyJz2Yo7?=
 =?us-ascii?Q?soZ0UL99sqkd6qSSrxxRNaSgKnyur/n4ohvp4eowWprtngy2bld5tl038+vb?=
 =?us-ascii?Q?2V/Pw21NsrbJe8L/Bc0QV1rY09psjx40QqqwxdXc24R4r6D+d8QI16H+4ZBq?=
 =?us-ascii?Q?6HNE+0jGi2zmAJyeYAfJa8uFWyYyln2YxGdy9NjzIb7mai4MvM0Xg+AgVotV?=
 =?us-ascii?Q?C150CI163HEVNSA8nSyE0UTp4WSK9K6Hi8dW0uJ216lSd9BZJ7ZUi5T2oMYO?=
 =?us-ascii?Q?wGGDs4rbwrBTci0kmUIBHFUi+yKQRp/tAa2kZX2DHp9fWqShUGMNTVw+Zcne?=
 =?us-ascii?Q?MBhDvL8eUDPom5NPHDHwzWUJJOTTEyFAva4/FymUdBhAqNHRIp+N3XA1IljL?=
 =?us-ascii?Q?6fx99idWD/6OJYEhdSooJZcMI/JFE0qjSI2C3Krw3kSXvBVzT7HGxdUbM8OX?=
 =?us-ascii?Q?yQJH/NfldZxX0O5+ZpF36chSZwo94+/fty2oISVFYu9oRQ7W7L/lYn1l3Foy?=
 =?us-ascii?Q?bzAYz6Fiqby/zzBtnrdtNu50+mZvMh4DzUZJ0sBCko/q2NIEaTCUSzXp8A5z?=
 =?us-ascii?Q?hSQzrqEPAD4UXKikqYcxe/Y12dFl+beeuQ0GCUAdEmMvQW6/+e8PaVOiKyzv?=
 =?us-ascii?Q?fMhna+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FHkbuwy459kGoYpdbsWEgBFebYoczIk+XNCj9C876tX4i+p0kBmYQ6rXZJXM?=
 =?us-ascii?Q?H4KJgSzflvtFmyjJkhHO9quWAjwv6bYCoxsjzmJdCpRW73k0Ydg9hAmy3uAo?=
 =?us-ascii?Q?NA1GcbBGUYxCwu/kITNy9iQW5CfaYf5UB0hr2Arm08OyeJiaZGXlaRAIsdb/?=
 =?us-ascii?Q?tMuQ6H7lZJVc52lwKTuS+4Fmk8Qv+JE4iD6Mt3Po7MF853U76GQ/jr4sPG01?=
 =?us-ascii?Q?4pyW/hqFoa/7R738DXdmlnEVpA4at1ITVoxu3kme2GXh8L4wzLfycXo0IHTH?=
 =?us-ascii?Q?1Pug1Ir+cYZYYHzIKpOLKD5FVlOVR6s8MWmVicJDcvPnLv0DNBSplPMjPZxE?=
 =?us-ascii?Q?LGUbt7BXXXGKDSBT8WkCPwoINEMClHfYrV89iZQ+vzP6NwRLwYC0AnYT2+La?=
 =?us-ascii?Q?PKNfX8qifIBAA9MaqEUVSI78sbUdElg7yHkQiEXsXSy7Eh9bD5vNNfOyLh+F?=
 =?us-ascii?Q?nDloLXLblq1UTRFYzX8rZYdvmHfCoR99GYiYWQazqnHMTAm5eEhSxxPFAuDC?=
 =?us-ascii?Q?wfl+wWZ78PGUtIIqWjeTE5Sxoq8+f9zw/pqQyeZTRUR0dqWTCS8G+JleZg6N?=
 =?us-ascii?Q?3BD6Hjt4KmDJMDf8xR6TuaEZwz/2UcsSyNZ+lpayt9mu4xUd+vUWUjiDeq0j?=
 =?us-ascii?Q?4ViKusajtfcXm66VtoQtP9rIMbmXTmO++sXnsmC+sAkuuSwHnRBEhD0ojXSC?=
 =?us-ascii?Q?9hRJQvF98Qey/5UDO2Xf4jeB8F1Rs7B9bUJIYNQI05zgCiGW7tmnecUT9Vsm?=
 =?us-ascii?Q?Xl4LfaSbvjd4H/cmBIZIyUnkz7ISWnch6e5ep8BwrG7BDOne4iKHCVVMp/UC?=
 =?us-ascii?Q?vbxp62LXpNvO1cjvlscL7QXRPskpWQhHUaum+BMSIWvaz2eH+CA0QYHjzkUJ?=
 =?us-ascii?Q?VwZ0BI+3zxsgKKsBYs5WV1DihyTYWabgkyt7H5Y2s9dDQXsB0S8P/Uu64yn1?=
 =?us-ascii?Q?EU1RPDNsZ2X2l2w4bfFfa8+BAGSuo+e0tmFpSo1SoRbR9lnCaoU81OPD/o+L?=
 =?us-ascii?Q?5FpfZdAXVX7IDba1boB2b808/LXW6PPf0oBKbvqAjv88hf3SWtu2ZdjVFX5I?=
 =?us-ascii?Q?KdH7vQAFUD20GzioHcyxyedTa7lh2VcjvAWSx1zePYUYZXh+zjSB/yhNV/JA?=
 =?us-ascii?Q?dEqVSEz4TLVuOnvsZ6OwJS3jUUjp2kRbb5jKVzO1xCz3ACB7sTVS4u3YQpyV?=
 =?us-ascii?Q?3KFe1aNq/gZHOFdr9RS4pUXVUltpggNufdZ/Lx8IMbMgNRwbxqpZdP3DoSHM?=
 =?us-ascii?Q?esVr5XpoaR2pSPgZXexN/KqTK/5pNw8NKJkDv6Ipx+CKddXdGVRw/y+jcu1o?=
 =?us-ascii?Q?ujBJcGH2l9LYSE0/kmYkbBAxR4J4OSh8fULtOnOyZ1hK2g5i7DZeQuQgF1dd?=
 =?us-ascii?Q?KdytFyKaYXIH4t0YpKax8o4mq52+C4qZBWGGj0VdJdDMpoPLXYm/refBRi1m?=
 =?us-ascii?Q?4djgb7bcRzrP07nTRVl9pLjJC59lUQD7QArL0jtzFzuSMlUoc8JNlukKpxjl?=
 =?us-ascii?Q?0DeSTxVe7Xy0FXHRheo0B5XvDVdl8JQ3as3+jrwh5Ju576ckRsCJQdcqKBwl?=
 =?us-ascii?Q?K+O0LBGEklpd55nekrA65E9kwhVZrhY6q6zofkCiWFV+WSUySMRX6jN9gecx?=
 =?us-ascii?Q?YbvA5vlZLlCcz/W/4XHcOng=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PBXdcpKtwp3oDJI2BYj9+d8B3HxtqGox7ZUMi9Ai9lTa6Pj5DHd32r3cLf8/aD7Z3nyYr4hfTd14WqieHi1uNhpgh6gsTSm7M6rufrD+UwthodP3t71ShkpIhN5rKytSr3CdCh4DCH3WIyKzs0ifXYkH0VN9rs8N8lzLo3yKZFbWdhIZdw6AybROExpDfacBQkb11Q5krUrqk/Bb2Yv87do6bzgIEnEKPzGsZSRaEkKbSP6Ho28wW9Q4cs+0zxnGK3fwe9AuJtGx/I7ItIj7Z3tjjcQGAKWp4KlHE1xATQ+hFSuYtwvWfNMEzGr36SL7zUDbDe+wkS94CCcjdvDRJ7sMVHiAX6y5bJ7llZ/zw1q/l/Y+lcfuwai7yH/GEZDQn58r0IFZJpdnoWvt4i3cJ4s1NdVIM4njm/h961bOpFBtGiUkKfDYZx/CCk8C51RZQNmkGcoZA6LzGTOyEh/VUGtRh0VNWq9QYl4pz0oTfcT73q4MKuR0rUjO3u3f3vBTtwxBAzorkvFWv4Zr5+5li7QNT5kq2Reuped91VpUJ1Hkx3/Q0efo/EMmniAxCG+w1K1Th8SC2rMdafGNnN8QD7Z8C3FaCY75RulbGwZL7I4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bf3d68-4015-42df-d2a5-08dcd151afbb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 04:33:15.1331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBYbRtAiA+zMZu+DBFkqfu6exApAd4LnJ07MlYcGOb5GlGW9UKJEZQGbCaZxd4S3mWPNW+iXSR5nf9wF4EeWZipBHMWCj2exoB7NzG2HgxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6640
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409100031
X-Proofpoint-ORIG-GUID: wUvKNDHcYHrqa2LRVazNSTylasPTI8ym
X-Proofpoint-GUID: wUvKNDHcYHrqa2LRVazNSTylasPTI8ym

When an ERROR probe fires due to a fault happening while processing a
probe firing, it was corrupting the first 6 probe arguments of the
probe causing the fault because they were being overwritten.  But since
a fault only aborts the execution of the clause it occurs in, those
original probe arguments might still be needed for other clauses that
are executed for the original probe.

Save arg0 through arg5 prior to calling the ERROR probe, and restore
them after the ERROR probe finishes.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 bpf/probe_error.c                             |  3 ++
 libdtrace/dt_dctx.h                           |  1 +
 .../error/tst.argv-corruption-by-error.d      | 48 +++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 test/unittest/error/tst.argv-corruption-by-error.d

diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index c8ddcdfa..8d631704 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -26,7 +26,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 			     uint64_t illval)
 {
 	dt_mstate_t	*mst = dctx->mst;
+	uint64_t	argv[6];
 
+	__builtin_memcpy(mst->error_argv, mst->argv, sizeof(mst->error_argv));
 	mst->argv[0] = 0;
 	mst->argv[1] = mst->epid;
 	mst->argv[2] = mst->clid;
@@ -36,5 +38,6 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 
 	dt_error(dctx);
 
+	__builtin_memcpy(mst->argv, mst->error_argv, sizeof(mst->error_argv));
 	mst->fault = fault;
 }
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 1422ad24..9f33f1fb 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -31,6 +31,7 @@ typedef struct dt_mstate {
 	dt_pt_regs	regs;		/* CPU registers */
 	uint64_t	argv[10];	/* Probe arguments */
 	uint64_t	saved_argv[10];	/* Saved probe arguments */
+	uint64_t	error_argv[6];	/* ERROR probe saved arguments */
 } dt_mstate_t;
 
 #define DMST_EPID		offsetof(dt_mstate_t, epid)
diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
new file mode 100644
index 00000000..6fd1834e
--- /dev/null
+++ b/test/unittest/error/tst.argv-corruption-by-error.d
@@ -0,0 +1,48 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: A fault that triggers the ERROR probe terminates the execution of
+ *            the current clause, while other clauses for the same probe should
+ *            still be executed.  This tests that the ERROR probe invocation
+ *            does not corrupt the arguments of the original probe.
+ *
+ * SECTION: dtrace Provider
+ */
+
+#pragma D option quiet
+
+syscall::write*:entry
+{
+	self->arg0 = arg0;
+	self->arg1 = arg1;
+	self->arg2 = arg2;
+	self->arg3 = arg3;
+	self->arg4 = arg4;
+	self->arg5 = arg5;
+
+	printf("%d / %d / %d / %d / %d / %d\n",
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+syscall::write*:entry
+{
+	trace(*(int *)0);
+}
+
+syscall::write*:entry,
+ERROR {
+	printf("%d / %d / %d / %d / %d / %d\n",
+	       arg0, arg1, arg2, arg3, arg4, arg5);
+}
+
+syscall::write*:entry
+{
+	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
+	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
+		? 1 : 0);
+}
-- 
2.45.2

