Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A313D51E
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 05:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756533355; cv=fail; b=s5RMazRh8utUKGtIG+BcGI7wwSqkTVQ7UFbtYP4TsicSHml+7GNVWPkI6HSN11TOqAr6kwFNtlhpRkEx4//lq/NiUcmRIgHKjnKyMoBGU/qM3jDvwOX3YGn0ptNapVWUWaTtSoC1XLXhqrCuvuKc9vv2kt5QsX1aDZK+tJIojdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756533355; c=relaxed/simple;
	bh=Kts2CfXVPRumftKA+Q6toLqxhyH1AsM9Ai+pDlrucVc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=WqZGBwWmomjUTrK6GRTe+iAHvKD8qeX7lD/Xqp6Tjqi/6RVe1k9NmacrZSaB+9vxc9xhQHj1cAqYasSZ+VvhGqCHpjEv6tpCtXHrFRA4qp1y2LlSEEWcQjz3nuHzYIIMLgsHXugRTLX3suUWr4U7uvZiFtROrp0h2CGPVqWRtOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LJ6IEbDZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tuRTq5sx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LJ6IEbDZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tuRTq5sx"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3gNIl032028
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 05:55:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=yv528xfW7Q2H1ei++52QcMay2rgZtzW83+zFoHmH9Ug=; b=
	LJ6IEbDZw92bK5T98OsD30bxOxkqT7EsOY51Lp6a9gM4v2JtFmYLYHleqQg7aSzT
	E/O0gH7pv8T/VV18puWzUONmpBeDNFCj+cYtnca+iKRY/EDSCfdva55AvItgEgq9
	TG77/sXYliDHfe+BrYFQ0lrk58Sba3ht7kIK5HugofQ5N+fJkOL2I0NryLQeIXJ6
	C5VZHkUa2DSx8e99SBmaKhjArV2G/eJ8yZ+XZ8FBMxuX1p7GHaQ1g8WfrnbZlT64
	On7vq2RogMQg/h8cM3UPyJdLJttBlPz/L4eGDpDkMP/yZricx4vF0HCNKRyLE3tZ
	P0ZbLHXJzOhMs9kCFle9Iw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48usmn821x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 05:55:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57U3hoHm011685
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 05:55:51 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrckxc7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 30 Aug 2025 05:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgfuoRLU8b44XmCTo945Yy2KEDR8X4LdvbvpIBLzG4SYXZydCkHOjL1mqFk5wqUEKuBgZBlChA/seH/o5o1N9gQ/7AxINTWWod6RtU4oWkrmT6s1DcRRoK+qm7+5qk368hV5QTQToIKooUyU9RsLPbcUbK+Q6TVAVa3lmjCZWGMUWjI6BXYMc4Hg08VGz0CiDnSC2yvq61cXnzPd/abi70iqo/pzfcibOvWQvo2RRwyscc/c4K8lXEYuPZrunglSWnilI4Sp8TPHw21XTmO3Rgb8VPW6oDmQZmBUxmI1fMgVO2BOJwK3LLkrqoQJCJT/IaS/u+iyWeiz3q8A3xtxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yv528xfW7Q2H1ei++52QcMay2rgZtzW83+zFoHmH9Ug=;
 b=qXG5CG7w6e71I1jQ75GYE4tG4YotAdU4ZxyyO0E6UZysPuG1YWXuuEfMz71vz7MOp/lZoPkckyRazJ6/o7bYUOttVbwzlE5F9S3I35faNfmzM2fXVEUJOjM3yr0d19+UMmsNR55DEL92oYvDdwIpS3AHobqDhIXpzq0SIWc98p9DXGPcKKOCQYvU8+ACFt5KBVyU/KhvJD5XG67Y+Xk2L59Mhoxe6b8Js9TshLNCKsh/RifQgg25vQqGSou6+jvGXKjk1QSySC51CGnpQuxpoAYIlSAv47+pPCk7g+8GRwiM+6exkv8nPihj93c89BQTBUKhyUVLXjQNm7u70NNgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yv528xfW7Q2H1ei++52QcMay2rgZtzW83+zFoHmH9Ug=;
 b=tuRTq5sxxeEZ9jOlctkNzKGUjR3UjU7exgivO7S5MTQCjuQHFY9q66HprQgiclGBNpRKh9qA4bO9d725AxcnapTguXpyuZgd8Tumg+cObkN8k+z9PWpRcghSgpuyZpmPF4ogZi0dAGp3iXLJR+TnXvbDPymLButXNQHbPsiC13g=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by LV3PR10MB7819.namprd10.prod.outlook.com (2603:10b6:408:1b0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Sat, 30 Aug
 2025 05:55:43 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Sat, 30 Aug 2025
 05:55:43 +0000
Date: Sat, 30 Aug 2025 01:55:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] alloca: fix subtraction of two alloca pointers
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567210C6329527665030B8D5C205A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|LV3PR10MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aee6c32-ea91-49cd-40e5-08dde789db0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lk0KQtxPzuCXKOLwJUYXxxqj0QUPJ3XBIfmpomhRTB9TXuRVqv+H1tlHRPZX?=
 =?us-ascii?Q?JuH3qQxWlfz2urERgVaocz5RmpFmiyyH+F+I0lH0wwQbjzAz4PO9yyowfKcs?=
 =?us-ascii?Q?ezmhHcn8RhsNGv9aE4WqvqolNINxrXsQ0ykcJ7neQYQg1YITGnrNqVxhcHCf?=
 =?us-ascii?Q?Luxh7vTMEYOBZfsflqyCv7kkiTuMxnOEs3MJk6Otm1T0G02xU4ZwQw86mjSU?=
 =?us-ascii?Q?jX7Iq6vRZjZxJ7kZKcKvHNSn2UEzTfo5IInc1Lfv02Ec46dQEgR5VVRtH9EI?=
 =?us-ascii?Q?UIJkfvR75gi1yt/DPcnACcWda3UaDOyIcne6qtHqQO+U7wA6c8b7Gub7TS5G?=
 =?us-ascii?Q?QPrnRYBswdPhjH74l5SWM/XIyzu/i2WbCSDV9wLSHREPsQ0OsR86l3CV7+E7?=
 =?us-ascii?Q?ACIPeYhzbaS3SSyqxeVu7lkCr8di9x3QMhkYEixpMuuEpW3qs35l2LNvwAll?=
 =?us-ascii?Q?hs70tjHnbLq0L1tyozT7kw+xVUCEPOnFeswfoJ5kURtZ6xyHuVJdxtf3tnrl?=
 =?us-ascii?Q?PTGZKBJoPpucwE0SAN2n21sXaDKaX1Yax5sw0yWsmarG4P6gZBfRCH8S7wE0?=
 =?us-ascii?Q?6GfDquU7u4EZV4Oihrm2f7isXbmqopK6czFDqPwNvLOzCIjiFrgttXjmYh41?=
 =?us-ascii?Q?BnTob++UMBQB80/2iKrdeR9NNa9/k16aLdGCFwQw17OxUEtstqyY6HBHZWKN?=
 =?us-ascii?Q?4QOc7Ph2N9JHubvxho1D9WhvKW5QIiQtgzvJtJ3iRm/VHpJhcbp/5WNzCsK0?=
 =?us-ascii?Q?qktl4xuZMR9casGKtWFtf92hulmaLH64B30vMsO14ihduVl4lyIqFpQZXyIy?=
 =?us-ascii?Q?7r/GCfyEWTIfD2m9cSJkO3xOD4pfsTxC6RszWv+835NTu9/L0P7GaeA93a3t?=
 =?us-ascii?Q?wqYY8q2a64mWRNE3Ss73Q33n1Op2wtXKq9l6hfWYh4RwVGdFamIAqLTr5W2i?=
 =?us-ascii?Q?Xz4y66SJSe/9SufA/n7BzqqjJa1eqP8QueBRT4HgafLZeMtwulqBU/B9dJvn?=
 =?us-ascii?Q?5LTf/K71Sch2fv/9pcT265UyAyeUmekjKGk/PaL4KDu5PWer1a9nno5S8Zc9?=
 =?us-ascii?Q?Df2LjPxeTtfKdugTWJ6kdX+HewwUIITc0whdz9PTpVyIuRIXl3H2/uzJzVY7?=
 =?us-ascii?Q?svRq42/b12WtBX969gCmtpfmewJOyQM3Z4/lXmUD+vv4tm46h88wpPSv0aqw?=
 =?us-ascii?Q?Rs2mPnKCBs7eQBP33xvMD319OKCYxKucRtWmV8q7F/I21K39bTP2BTnJf0FX?=
 =?us-ascii?Q?t/pZbDbO+gNl4PtV9SlOSA1MmmMWLbh+HpuT7jcmhaQLponL/+1DW4H+vdFA?=
 =?us-ascii?Q?ZMKt0BH7leNRGZZHw0hf92nWm1ppRuBpjxwjNc2xAZDqfk3u8//3MAU5Tbtp?=
 =?us-ascii?Q?L6xpPmnpSXOHnqBe55SXRmEHMAsYoB2FkmPc+e0D/Y94gb63HwJw55+ov7u3?=
 =?us-ascii?Q?KEjgVGPlzPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i8HaQlbzwOBK/bZRsgH6ni6BQOfmdlRlET24KPqXDCf7J5Lmm45Emmq7aMct?=
 =?us-ascii?Q?ZK3pcR8qYKzVIJamfKfVx8ybS39u7N8Okbwu1aNHZJh1PRCWthq+3aG7qa2l?=
 =?us-ascii?Q?hiZVH1ZNTGjXxIx6r6qyWqVW+v+EcCigTWwZSynHd+YekA6XGuHfhrjr81o2?=
 =?us-ascii?Q?1a/gsVd07v1oO9K15hQ7fLiuhKldHPSdGyVhhWsBr5yFdnYCydDytXXU4k4q?=
 =?us-ascii?Q?13OUfnOXSYpu+JW454xl3CH1ykdlktGDsaolzUg4ceOXEhAhmlr6pobcwbfN?=
 =?us-ascii?Q?vocKy1+LZHvVsJeKVCy80na/RvlEW+qhfg/7E8O+rgOK5+TSLQVszfZYGDQ6?=
 =?us-ascii?Q?+URqO5Xbq7D01QDf00UabnhaOu3xaM56k4PYozHE+DpZ+dSVzLqIdpw/LsgO?=
 =?us-ascii?Q?BBe1WHwbdPFQs3i8SV+CGvR0clguExiZuLriivcnaUZ706323o5xoFYC7ikI?=
 =?us-ascii?Q?TAuM6R5yWgCUGOlBkiwGDcfVzkmmns3um3V25hK3cg7Bi1lK2xMzfF54I3Jk?=
 =?us-ascii?Q?8OCRoKrEspjDuwIk1e8JJLBCmlQA0T9h/cjyL8YKLyYt9/ObV+eb5r5g2Dd1?=
 =?us-ascii?Q?l6YczsnLr2WtRX4oCuWBchuNq4pIBfHR6aZHuIMboa0u/1rRnoaRoUys7Jpi?=
 =?us-ascii?Q?WrnlVlKioWYD2dwUnTfskcMQNaczGe8qnjRp8F1RzYwgKSg3jZB7JF2XX3OH?=
 =?us-ascii?Q?5NbYwEnS7W4Eal6gfYlpgSJZUda7rUsIU+xOUaLvouN/mh9l4cX9ZuVP18sG?=
 =?us-ascii?Q?htWknei6/d88k8n1d9ZuTZ+6QP9FAuXluMDvHZCCATlFOIAj9PZCH4avspJv?=
 =?us-ascii?Q?nazr/dGLQKA+q+xN0cEZuXU06As/hE2RdV1HQfeolG24IGcm+paM0qwM7oMH?=
 =?us-ascii?Q?sd7xoMfaEq8LfLV+EqmwG6kT609P8ykiBgsmmoW6dLXn4cR28prHjmIaxrIo?=
 =?us-ascii?Q?FiUhSHdqQuKdZUejrpAlQjjIbsexVE47IrbhPGq8nWhddCbtuQH1TG5h1Qsx?=
 =?us-ascii?Q?5OmJ4IHngMbkrGoT7vdP1BtmLezB/xqc0xScMESR7Eg8Pld0nXGAa4ySuWOm?=
 =?us-ascii?Q?vHWnbhdYaFqSFMq5bKii91a4sOHV/tia92XQUbAG4DGBTeDSjko6GeqFdTke?=
 =?us-ascii?Q?yo6gQtr0+ToAweaWBvk3XGs4K5TqGJYUMmkhX+ZRwYilZgqYXOcHKqaCz4eB?=
 =?us-ascii?Q?eQFS5qRjckzmjgg875UriI1usWRkas6w8k9baDSpbvjXQ7QKjfNzAPgmoJeJ?=
 =?us-ascii?Q?DEe028qp3U0LhaZQTuqtKzgz7a7LPnB+l2mHYh+2ROhRRNk7H3TabYi6XEAf?=
 =?us-ascii?Q?DsRj1u4cH8arIBnB8mcMWcZ/96Od01lPsacXGfMeCQnEKG+Qc0SSOI1KOWOb?=
 =?us-ascii?Q?PcbYRwhRQlcduH2rLEZc/CwM3/8gJYrG8XPnWkpDUQEMy1qJLOpxpSnCuPj/?=
 =?us-ascii?Q?p216ukAK9tDG+ATmERBeYbR8HwCIjb+9cXuGWf8GkALiPMwk5MNM0t5bppn+?=
 =?us-ascii?Q?VsJzdOne71xMOMHh+Uw5KskgCYI7X/qO526Or7HZ+FGPL1oLBUAqRTj9CnOY?=
 =?us-ascii?Q?jgPtDL03qkuIWatir4jT8/g+kqOozhSVeO3d/yI9FkPDX3rJdmL0hwmgh4hI?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bIfgPkmDimj9Eg3a9dQvmrWYUB0amNCntlqJDsoWAQoPFFT7UFaDNfDeExuGhC81UE5iB4rGYN3u2SWM9iAlKbofaJd74LQNyupXqX9+xuiNBDi6ic+S4kfGUvsQyY+wVg4qz4WoTpqEFBpMduRcSYYpiH3zd0d0GYV3xCURMynFzvrF0pnn3HLpKoNwOG4eHFIsGgSkBKpUQEnOAA878ONnPQGzJW/sErvvmmPVixWa+w8H0o5FyvGVqKtVW43MyiIRDAA5RXi4Ci7zOqLC/6eLeOn5RW/hfFMnnPXrDlY1KuWrH50vS2MKzF55FAk0KkDJzVCOFyTWsZoufOsJFjRqrfJjVt75DWSkIvUJyKsUvbXcutpisfnc9Iou26aKUNL0udV+KzAOgL7fsYq3LnHsuQqiRkaE7GqbX8y0x+C2pWpemqd4X7wU/5PgfFPzD7mCOl6nGbj/DNnK+g3idLsIKdd5YXwBAmIPkA02FC69M834/BNcJupw+q+Xpw51nktVUYzx59lL8sCPlFNQCno7gzICX17rVC0XCgpujMpjzDI7KN+C2wkdCqcpr3HusLwGVYja/vAkqWTJ2oYwLOwgh80euUNuQBglBMfxSnA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aee6c32-ea91-49cd-40e5-08dde789db0d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2025 05:55:43.1885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us09eKO42h66aBfs2JnVvcOuE5pCnQsP40ln1bhNTOhbbNchFRLIkoYt8pqbK9bors5zyG7R42LWHlzBH21WWcf+bMptpDraqYVOTP8NcTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7819
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-30_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=849 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508300051
X-Proofpoint-GUID: -3QZxMa-JS3kuQiwLj1gEcIdr0FQTpvr
X-Proofpoint-ORIG-GUID: -3QZxMa-JS3kuQiwLj1gEcIdr0FQTpvr
X-Authority-Analysis: v=2.4 cv=Of2YDgTY c=1 sm=1 tr=0 ts=68b29268 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PNEitc65Yvs9Hittix4A:9 cc=ntf
 awl=host:12068
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX8bkf4NN47YPy
 J2lo35xddSW9cOXS9rLOcdXovsrSllUbtrs5GdVKaVxUF/YHwy6x3SHNCBNLh4x0anU6hxDdJuD
 rnW7F2NyfmlFb4sF8Qk5WH8VJaEX45E+XiI1zLdA1euiKnq6JO4gQHSMt9ZT0uTAavI7Iqt//J/
 lwNmS8C48MTo7+cMRUzF9nDDiGRyX3mcEfRtZiisprEZ/Uzt40b3Tkm8PclD8Rfz5AOC2ZDZz+S
 1ILc5J4i3cZSpmtQLlb/5YCMcFklemMP9ebjaZmF4EaMi3VD0LsTusFQSq3A7uJI3oO1gHqG9nw
 Uz1s2U1u0HVCXNo8oD3cE+uOcWQbVzzPO6TCQzUgtaL6yVVaJClWKFRsdwsl9g3KN8bB+YIm5eY
 kCcuHL5eqVHUus129R5GWfSA7Eh1/Q==

The subtraction of two alloca pointers should not be receiving the
ALLOCA taint because it is an integer value (of type ptrdiff_t).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_parser.c                         |  8 ++++-
 test/unittest/funcs/alloca/tst.alloca-arith.d | 29 +++++++++++++++++++
 test/unittest/funcs/alloca/tst.alloca-funcs.d |  3 +-
 test/unittest/funcs/alloca/tst.alloca-funcs.r |  3 +-
 4 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 test/unittest/funcs/alloca/tst.alloca-arith.d

diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
index 65baa2603..006b4b6e1 100644
--- a/libdtrace/dt_parser.c
+++ b/libdtrace/dt_parser.c
@@ -3618,7 +3618,13 @@ dt_cook_op2(dt_node_t *dnp, uint_t idflags)
 
 		dt_node_type_assign(dnp, ctfp, type);
 		dt_node_attr_assign(dnp, dt_attr_min(lp->dn_attr, rp->dn_attr));
-		dt_node_prop_alloca(dnp, lp, rp);
+
+		/*
+		 * Only propagate ALLOCA taint if this is not a subtraction of
+		 * two pointers.
+		 */
+		if (!lp_is_ptr || !rp_is_ptr)
+			dt_node_prop_alloca(dnp, lp, rp);
 
 		if (xflags)
 			dnp->dn_flags |= xflags;
diff --git a/test/unittest/funcs/alloca/tst.alloca-arith.d b/test/unittest/funcs/alloca/tst.alloca-arith.d
new file mode 100644
index 000000000..6a7bc3354
--- /dev/null
+++ b/test/unittest/funcs/alloca/tst.alloca-arith.d
@@ -0,0 +1,29 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Subtracting alloca pointers yields a plain integer value.
+ *
+ * SECTION: Actions and Subroutines/alloca()
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	x = (char *)alloca(1);
+	x = (char *)alloca(10);
+	y = (char *)alloca(1);
+	z = y - x;
+	z /= 8;
+	exit(z == 2 ? 0 : 1);
+}
+
+ERROR
+{
+	exit(1);
+}
diff --git a/test/unittest/funcs/alloca/tst.alloca-funcs.d b/test/unittest/funcs/alloca/tst.alloca-funcs.d
index abeaa0463..a716d27d5 100644
--- a/test/unittest/funcs/alloca/tst.alloca-funcs.d
+++ b/test/unittest/funcs/alloca/tst.alloca-funcs.d
@@ -21,13 +21,14 @@
 
 BEGIN
 {
+	base = (char *)alloca(0);
 	x = (char *) alloca(8);
 	x[0] = 'a';
 	x[1] = '/';
 	x[2] = 'b';
 	x[3] = 0;
 	printf("%s\n", stringof(x));
-	trace(x);
+	printf("%x\n", x - base);
 }
 
 BEGIN
diff --git a/test/unittest/funcs/alloca/tst.alloca-funcs.r b/test/unittest/funcs/alloca/tst.alloca-funcs.r
index 7a618a62a..96708b76a 100644
--- a/test/unittest/funcs/alloca/tst.alloca-funcs.r
+++ b/test/unittest/funcs/alloca/tst.alloca-funcs.r
@@ -1,2 +1,3 @@
 a/b
-8b11/b/b3a/b//baba
+0
+b11/b/b3a/b//baba
-- 
2.45.2

