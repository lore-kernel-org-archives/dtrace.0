Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F491BC085
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734737158; cv=fail; b=Oz+q9saxf7v5OsBlcdoUi7aGJddBJP3iNzTvaSWCVxqU4ZJUOioQFbVhqrFdm98rKAiPIcrN/pqfwJ22Y8Z70QpkNoXO7Ok4QoHTztcUYAnlEIIAm9m+hCfXuJEnW89eedRMF0ly40p5weGap2VpduO5NNBJAAawwpdRu04Tyak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734737158; c=relaxed/simple;
	bh=48gvWiRsDkEP0nV4lEhhbxFmU6oW6wUjpTCLusfn+48=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HesXlbFr94Hy1kvwda1fe82V5He53+MunoavGPUJNtfQiNJIUVUU9JadLrO4fQVrw6S8G19kPhMDtH3mADiGy2MaMROTZKSg4k6UADhy3gUU4XR4VyRWBWTR/gTu11Ur7KkTh4TK7S+uYiEOJNy3hVlUEQo3eJ53hlHFwmiWzqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OT+1qY1C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BBSB93hC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OT+1qY1C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BBSB93hC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMMpPw028320
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=PpWfiBeBx75yVkwT5lj/nCOVJfWCP+U6mLUMgPnfkj0=; b=
	OT+1qY1CsNhYNgCdoJFI1xsLHnNQvRVQ2swTk8WpXdNixyLkLs9pGgZ04fXaNuAr
	KJ7oaiBOeaZUsXvi9a7lMVfapdPDOHWjBRBkQTv1Dp/6GSVAJ8f/1wFiy44+4i4t
	MR3yWSwX9oMccMZFBsHblsgYke5RJNxb28i7V4QvFwA9hZwDdAJcoo0lOyInftdG
	+etpCX4WSMyzVePW34uYt1ecOCbfT1PbN0rzvQ1mjziNaiGtZCg+4BrpvGx42gpF
	Wwv+LCct/YQMnZ+DM6cjkFr0IgIGMdRtg5pW8bV2TQB7BxyEFsQNIWodjQFjDGye
	rFY/EQR6qYMD7IMIra/j3w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h0xb6amc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKL9rOk035291
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:53 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fd0u9a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 23:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMU1p3ZVm0f0YWbkLxA1LKYZGrgR6M4ha4rIDoJexyfrFcc1+xep3RE8iNsnGVI4BXAqC5ZEWIH9ykaxSkGjc0xL+7kZvRFo2UEQ/YTuC0jAz4as5j0Yhy3YUfarDmu1wtIfyzBVUuyMi6fdUqa6jV/V/yev/WRxvO3dvMBo0sE9rWS74BF4QLRxr/GxmHTJvWOpetdRMeKIj53rxlyUJxOsiEU5KcIfbT3GSlYFl3GGkuYSy5gj1fsEnQUsI9zq8KAujPj/u0pdj53TD7FMq3tJXLEs3Stkl/Wb7uVJ5XYfVMV6khvNWQviIp56+pnfGK9u3jesFEvoV8HIa4T0hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpWfiBeBx75yVkwT5lj/nCOVJfWCP+U6mLUMgPnfkj0=;
 b=tHwF6O/T4YqtD3o5821WJUm+M2dSYAJLuyswwYIEJzMR2FMiuaYZghKEu3EJ1G7HhvHI+5Oo9/h07r6P000rtXoce7YS93e1jW9aBqLQJVKA50uF2YVBa3n8NxtPZhz4JWRHwxgDZHcRkSfU1y448ZsQtqm1jOm0cBNXWN+ufiX+eogHVfJP+iRjR6T8sQh7XCfqQwMSRpyi9vZaS/Yj9d5XKsmIlU4kTd0p6S8+yyi5VLj+tJjiFqTJvV7LDaaqHex5wcqWs2y+FZH3478vCkuiRJ/F+cef/QZWuF80yLBu5BKpARSmPIm7j23ynOdFX5VDqTR3Ie/Ax6i/5AQsTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpWfiBeBx75yVkwT5lj/nCOVJfWCP+U6mLUMgPnfkj0=;
 b=BBSB93hC/Ty3H5/U91MwfnK6UNTEmorQbla4FbAGdMRh7ixb1nfX+WP6uh4d6vdu7t845nmqMXPfBkLM1tr8BrnnHQ3KdkxYPGY/EnV+dSXyTAy2wscmtRS4ZrPuBDnt4hE9sZ+FtsdwZyPu570Q8UO0fjZO1WOx0XQpskW3uBs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6798.namprd10.prod.outlook.com (2603:10b6:8:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 23:25:51 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 23:25:51 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 3/6] Simplify references to dtp
Date: Fri, 20 Dec 2024 18:25:46 -0500
Message-Id: <20241220232547.19043-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:408:fc::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b7db6a-472e-4ab7-951c-08dd214da45e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YJ/HfrgTq2QtpK+tGPNweYAugNuU9x+XRjOrUSmamYoNeX6FMCKS2kA+J6o6?=
 =?us-ascii?Q?vFWwTTwF90N0un8xCTTeuADedwpY7HJG+R3ZupQ3eRJhbD9G0bxaNC/XFfNs?=
 =?us-ascii?Q?2+JfjS/e0QHMFo5WkpPPZK6DWAYwrdUs2toXAV2XApNc4y1RIApw095FsLaa?=
 =?us-ascii?Q?YJ2C/C5SJs3V+HHQSJSQARjL4aw+zP7NAFIe/GpAxXNN5WuI7Df0szZYchqj?=
 =?us-ascii?Q?vtDQ2usHSOVSdDRelyfYfHF6ca05zbtSWA8AP+Aqpkr7RI+sqIqNsl3zfqcH?=
 =?us-ascii?Q?zr5xvzRUgXaD0oDisfFwP5H/NUYJdmf62U3RESq7M8W4FWmYzgo1dovl/0QF?=
 =?us-ascii?Q?Q3z1xW2F5pCdBaWZckp4MJHYweKmhJOtQTs/foN1yLdTvEk0kR0NnPXh0y/K?=
 =?us-ascii?Q?15kN+ZzcWdfhyW+RC1VkPvL/2AtlQd5GkhumZhGDPnXhYnZ6f97YsJGGrmYP?=
 =?us-ascii?Q?Ma+wtgujhLp0gy8ApN4fsrJeoDoHZeuZcSZQMvDwFwsJK6J3fjh+obtAvD0b?=
 =?us-ascii?Q?mSDd44suZwDJ9JkOA97UNB0DGuLOpdqSXgGhxftK5Q47SWyLWp6AKAeb79+Z?=
 =?us-ascii?Q?YlFCe04bp41x7XjQf/8SZRpp/y1ZhCEzmRbQcNvm+l9TQLA6TOBJXBSafqdR?=
 =?us-ascii?Q?7sxYeaH8GoIbzRAMI3vcnGVvLgwBMDckHFUzDBxUpuSBtC8W51NtzN6X6deP?=
 =?us-ascii?Q?2HhGot58dO3QuW2X0nSvESvp71b/FaPd5sgqsrs2XPjNnqFDf2aNcnfE+I87?=
 =?us-ascii?Q?1vomntwxmxkIwh58l8Kj3oALXfpOO0MAALgx4ciBXxOqQoUQeot0UDLqalO3?=
 =?us-ascii?Q?h4XALhib0SvwaCNDNHjiqe+uTZ9D95OZ2MRqt1DHL5Mk3BncMg/kg2p1X2d3?=
 =?us-ascii?Q?EGfX3nOSU+eCWrKGBQJeN2uBVo02n6HM5aKIIsKtDknk6Jqq4pxNz4XnuG97?=
 =?us-ascii?Q?qv5E63OhJcxVe+4wlp70oXGH32+yZceuhZUbyflzJ80xpolkP+3X7BG0JUpQ?=
 =?us-ascii?Q?SRt2GxcjQ1AI3zoLPp/B8bvc7/Up0hLdqjiBKfYDAuG2G2q67sNvGJftom9X?=
 =?us-ascii?Q?QvCGPWXNTShhn6TFJQN1r7FLw7GpkoB1oKL5wJgLz4TFnVSvhHssQkH+YRuD?=
 =?us-ascii?Q?nuzzdpL1cCHbV6EWUKd5CZzRRvSn8mw0mgWnVga72sIyL92me0Ve7k+cU5DT?=
 =?us-ascii?Q?IMLRw/3gQX0QtyucgWs7mbbKBr3MGascBDLip4ZblIdntFjOQPrp/os+cj/T?=
 =?us-ascii?Q?bi6RduY0tpYLm9VyXmHLFAtrMSovqbVR0NaVTZvtbVNWVXPfhy4JRm6K0XLO?=
 =?us-ascii?Q?IVIMJykTnW2B/LpuM52iCrfAjmO7UnpJFWrPRvEKZPOVu20YMiXDO8aDLCs8?=
 =?us-ascii?Q?rlnUDWduPSbqhvfTkGwftU9pnoRU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mk5quqg9lVMCYnQzq9XdAYFhJhA3hPJTRv85y0jOE2nq28pxUHBS/1ALLE+d?=
 =?us-ascii?Q?iMp+VPIam9bkGdWS/cLtAGgBHug64KCejLwb8KNh8sHx4P654sqq8WmRzdWB?=
 =?us-ascii?Q?JWsTk6yvwY3f95Ds/1FoFMWj/UFeYobhxjSQPQtBGADYBwH24+CskdwWASGf?=
 =?us-ascii?Q?cy1slK6GG0lDkGCpjhb9Jc77Lgnx/q9uaBSWncB2Amy5cn+2/+XlGhxXeVai?=
 =?us-ascii?Q?KPRiqwSwei3ZQrAXX1A0E0pL1pwfiYeIaYzsBn3qWbiLKI3pEkrOOUbDScR3?=
 =?us-ascii?Q?sp04isqc5P4tRv0xiQAd3YabzJ6SRvL35pRP7Dz64unhDmd8jLYdjVcMc0O7?=
 =?us-ascii?Q?4Qy+OctUDsdM3fjFbt8v4oLNd2MjTbxh0rzqBSdo3cpbg7Dz50Mg9QvFwtK7?=
 =?us-ascii?Q?mCoYc+Xz/NyKbyZFyKKJO6yuJzGrg1a8cRhZRZZKvAyL+E58ky5HjEl+OPzx?=
 =?us-ascii?Q?ps7RoAlRwc53hSGGEcQnabj+Yl35ogVclVd/XDJx01Q9gOcMTGIha7lzAk5B?=
 =?us-ascii?Q?EW96Tqet7lqn2Xx9ImqDk/Q+NJx0tWyVe/GVqjvjZqzMOfS5i4mOK/2t5Uaf?=
 =?us-ascii?Q?Ek4k+/5e2jeN7t0RDFeo3MvRrVFSSkabLQw5JEDqbv33yt9Lyos2rhwduC6+?=
 =?us-ascii?Q?WjEYvCulW02jj8GB+3/nzZPa+QyI8KEQtdzk4TJzhSfDzvxpbEuE97pfXsdR?=
 =?us-ascii?Q?mVLJE6FYT2qw9C+423IggY30eWALKovu5FUSZqiH+jCvtv/nZXOmpIo+nxju?=
 =?us-ascii?Q?t5XVLhIKW0zGCfLUgGjZz/4e7f2+X1ICXiSlCTD5VM3ERIDYnOWKGRxk/v96?=
 =?us-ascii?Q?MES0Lyr2cdyjqiz495nnZuYvon2CzqLfi3Pau+/1BZhZnmiuRU+kxiI3iY89?=
 =?us-ascii?Q?hS7N2poRXCTCHOLulAtpNx7HFtffCLBGtK9t6emgC8xqr4+1FUzOnTupGJKE?=
 =?us-ascii?Q?OEIO2xopHyQSXKTIlCF9hz1YcSvhmK48tXrpEy5/Erpto9U9ofWCOajwIiDp?=
 =?us-ascii?Q?r6UiMCk2sGMyaDoCdiEVpj5AEJZjGmduSzGixQq3FkYCuawReCQ9zpDzHyrS?=
 =?us-ascii?Q?E7o6C7WNwoSV9qffcB45cQlSTpJZ5B0sJat86+lzptzhPXIxhrKM+CM2lew3?=
 =?us-ascii?Q?7V6D+s4lPZbBgavXUC0rjzW9hs1WBR8B3aig0hg9UCyVme4mq1arOCeOzEuO?=
 =?us-ascii?Q?p0ZaXTP2LAgIk/72qfXFehtBhvzfx5MylAmF3d3IkqOuNphF/bSlXXAB3laK?=
 =?us-ascii?Q?zUn7VJtXiX7WLM6GQMNx0aUXdGMYmbnv5vpvRrS1dqLiqSo1P2SSHUbh2tMx?=
 =?us-ascii?Q?V1Y/MWy5U3k3OdrEg1wDrjUC0moBDs2UPOxCyq+EgWIJkwzwgW0DzlnGmnit?=
 =?us-ascii?Q?wvr33ryaBJ6pSsNSUSuZoMK4diRACNhI3wBGQjwPdBhz4W1n68juU47yCMN1?=
 =?us-ascii?Q?5NTDdjvbkZQwVZhmuwwE0bcm7dGD2viUjCH8L8+YMkkCfFChMYXoIjGNQtQ5?=
 =?us-ascii?Q?tTNEbC9x2ep3PisUqnttgLJqfPG4Orp17OH/+WyGqn5Rw2l6zxHwpIGs3IQp?=
 =?us-ascii?Q?Y5oRYOUGQXcEGlnij9GjHVyDW5MrxQXjw1/yjglJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HuQHkT/6YNTdvky8P/Ccu8pUaKcA0yVDt1n1bHyUupb5pcnKqABnvzjrzhRgYIpnNWWKJDEJ0vw6V++kVpmdlds77RXFrdV838SFaSYNjcrMhVPuWIyRAn0WPJIhEk/0qGtdojMaqzgiUNA3DobTAgDl127ndAx22mXOcD1ilIFFJtTlGbNFI8OtsxajabSo7Wr5XmuLBQxTe3EJgw/VE/KCIYf66AStBUE2uycqaBTN3Z+WFDdaLJtd/uz2gmENY8VfY0QhZlub5ZVmaVJn2zwKdT8qnlKbhqBP9BHoUmxx2p1hx/ah9tMYmHc9tlNzGVfumlatWw9HWvb17rsFUSVIxcHf69jiibZDMjLveQ3rKaXaHZjZEQxVOJZpimOQMMcwUDKX7prnCanoO+Xi24ztBXZ8slfk2MchSLx2uMsu7FWIoJttbzot6Uk/qDZeDtV2k41fD+H2ym8N4Ob7XXu5MuGhxw5PG1jkVwotQ1Y2BhbaZ563+TTPpfKznQEdb5WFSopGv7A3UFbL457GlEeKWJwgi8DYvr/nr4Mnjr1ONs/Wd7QIwOB4odvOFbpV3JGQV7v0vqnCem73+43gHy6WzK40eymCOdVTZ8OYofY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b7db6a-472e-4ab7-951c-08dd214da45e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 23:25:51.1915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wunKFW08U16Qva1QyBk4N5DV6yLwtjzlIMtOFwW1MFcvpdkz43Nrcy6gOq1uW5JnApRrPttSO9PjRVP258LI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6798
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_08,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200190
X-Proofpoint-GUID: 6oRKCBKjhwoda1tojUg8_VJqfOSfFBZ1
X-Proofpoint-ORIG-GUID: 6oRKCBKjhwoda1tojUg8_VJqfOSfFBZ1

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 940cce38e..a8a5050d0 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -231,7 +231,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 		psp->pps_nameoff = off;
 		psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
-		if (dt_pid_create_one_probe(pp->dpp_pr, pp->dpp_dtp,
+		if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
 					psp, symp, DTPPT_OFFSETS) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -362,7 +362,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 
 			psp->pps_nameoff = off;
 			psp->pps_off = symp->st_value - pp->dpp_vaddr + off;
-			if (dt_pid_create_one_probe(pp->dpp_pr, pp->dpp_dtp,
+			if (dt_pid_create_one_probe(pp->dpp_pr, dtp,
 						psp, symp, DTPPT_OFFSETS) >= 0)
 				nmatches++;
 		}
@@ -434,7 +434,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	if (obj == NULL)
 		return 0;
 
-	dt_Plmid(pp->dpp_dtp, pid, pmp->pr_vaddr, &pp->dpp_lmid);
+	dt_Plmid(dtp, pid, pmp->pr_vaddr, &pp->dpp_lmid);
 
 	pp->dpp_dev = pmp->pr_dev;
 	pp->dpp_inum = pmp->pr_inum;
@@ -466,7 +466,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 		 * just fail silently in the hopes that some other object will
 		 * contain the desired symbol.
 		 */
-		if (dt_Pxlookup_by_name(pp->dpp_dtp, pid, pp->dpp_lmid, obj,
+		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
 					pp->dpp_func, &sym, NULL) != 0) {
 			if (strcmp("-", pp->dpp_func) == 0) {
 				sym.st_name = 0;
@@ -496,17 +496,17 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 		 * dynamically rewritten, and, so, inherently dicey to
 		 * instrument.
 		 */
-		if (dt_Pwritable_mapping(pp->dpp_dtp, pid, sym.st_value))
+		if (dt_Pwritable_mapping(dtp, pid, sym.st_value))
 			return 0;
 
-		dt_Plookup_by_addr(pp->dpp_dtp, pid, sym.st_value,
+		dt_Plookup_by_addr(dtp, pid, sym.st_value,
 				   &pp->dpp_func, &sym);
 
 		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
 	} else {
 		uint_t nmatches = pp->dpp_nmatches;
 
-		if (dt_Psymbol_iter_by_addr(pp->dpp_dtp, pid, obj, PR_SYMTAB,
+		if (dt_Psymbol_iter_by_addr(dtp, pid, obj, PR_SYMTAB,
 					    BIND_ANY | TYPE_FUNC,
 					    dt_pid_sym_filt, pp) == 1)
 			return 1;
@@ -516,8 +516,7 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 			 * If we didn't match anything in the PR_SYMTAB, try
 			 * the PR_DYNSYM.
 			 */
-			if (dt_Psymbol_iter_by_addr(
-					pp->dpp_dtp, pid, obj,
+			if (dt_Psymbol_iter_by_addr(dtp, pid, obj,
 					PR_DYNSYM, BIND_ANY | TYPE_FUNC,
 					dt_pid_sym_filt, pp) == 1)
 				return 1;
-- 
2.43.5

