Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8442B33C9
	for <dtrace@lists.linux.dev>; Thu,  3 Apr 2025 05:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743656583; cv=fail; b=HPOBUxfrANewurcZ79tj9QmPcojFlO1MGU/UT2oiFKSqVsAMRNKCSSQNZs1yoJkAHh/puDEioXuV5bKppcr9fxKMLXl/G3Kdyz03cevjhyBNTzIyxpSQef9DgP3Xuj085bENMwueFd8UoyUgq0CV1kvN9aRfwJXR9OLMp/JWHNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743656583; c=relaxed/simple;
	bh=0RKgqaGvM5pQeSynZKAsake57ogHh1JAbklOJnQ+Vg8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DAK/trQyUDbTZGUyxkIqLlMiU+n5WM6pvCq+yTbKXJo9Q5vRKwNOGruEGuBMkNECad3t2m0NZuKxzoUv5f5guTd539y2q2rYQz1z1Fhe77SQPLIRnN52HXeHuUiosK7yeMpe5wQklMWNHW9qTdzfcwNkPxTH6pVhFwPJLZvxDDg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SQvNbsK1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A3rVQ/bR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SQvNbsK1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A3rVQ/bR"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532NMpNN032017
	for <dtrace@lists.linux.dev>; Thu, 3 Apr 2025 05:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=+xMl0JnsgZtfbrtTrZn28t5VxvDm7sWHyMfAMQf0TgY=; b=
	SQvNbsK1F7Dcx0pKjJzXRsrRLUCxAKVVUFbnUPG9Atjc0R3Dbtk5wcXYsNbrzHGD
	hgKK3GVnXEdgyNGobB9t/0bePucBl4O2mOmTg4nGh3TjcEZ+5ggejqCCwJG2qomZ
	7BjxOiQH/G7yto0S5CmXRmFAdOSjKtmlfK3H0qIn8os6AMs/+J5XQlcuaC3+hqd5
	C4fHzGD9o42lE09pP+tfCnag22nC38Ty9h9V4swF0ZCGD0wg15jmRvpgNbmByhbY
	WNXn76mrdS2Xf4fGACkmlFHb3SgYAxPyeHGZaTKA6yEKxFl07AHVjaVP2CXoYQHf
	fyym/JNMy6odqk78y+HWxQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8fscch6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Apr 2025 05:02:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5334gsWj010910
	for <dtrace@lists.linux.dev>; Thu, 3 Apr 2025 05:02:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ahun8k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Apr 2025 05:02:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FIYghxr/lYv2YcSg7xjumVWGt7EZJ/8nJfJLyZr2SzWCZWE8Lt1DUcOtksw/XtUMKY3B70elQwgvEmoL5/t+odLdGpvNOuT7YgWL4xFqkxUD0YQpcga/i2lTvH0boyE16T42jouVnEJc+yU5fFsGydepdHtQlafNgGuGZKTJBJM3DmVKHoWA131W3nGPGRgAk8AMp3rVKJGP0UUpqBKGEF0RJ8ND/xdSx5OmmXqXzhYSI7aHizTmU8OcUGl4fH5ZabNdvM/3XD4CTNBRV+7Xtor86nvCbxeiYD7/O5q6FPAcZ12hT6nIK851MmWtZV0ZVE3DzJq/at9wffAJpN8IJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xMl0JnsgZtfbrtTrZn28t5VxvDm7sWHyMfAMQf0TgY=;
 b=aa41WkW7kx7OnsOV8PzHadqg1Q008JMLesSEGuoAAghFJkJWGC5D262EorpFWFEUCZUSSyDpupKM/pANeleUuXmRnfyUFIFGGNKhJ8xnrRdoUi1I5kXPDYWIGiyDcdw+O4mk1rrEv3azWCEFUJ8e2sfqrgGsPlP5FN9NG5jSqKW84TYAYpxwcTvzZ6HbyQ/yaiOt/YrrJkS1lOGfs1MoDlT5Pj4i8zGS4WNiae98yvnO1FpEb+pcPykLMd9uZjhEMSzN20266RLN7NTCAAGjDWYssrPk8CEW3joLVgSTlL4Aem0pN24ng5i2BO/hPol1hYnoX/vFt8qTiZIOXhstow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xMl0JnsgZtfbrtTrZn28t5VxvDm7sWHyMfAMQf0TgY=;
 b=A3rVQ/bRMfRYznJ/f9Ii4fKsF9al36tvoSPNniTqmjjssKybxitH6rebmR5GjliXAQCpzrD+AN7nLImFY0wRdRV8gzqkFsRWy7f7c43qYIYXoGGOnnVwffCAIJUHPoL9HpZv47lSh/4NAWjJ1g38Mxw8yAo750wtgZSwTVJygwg=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6601.namprd10.prod.outlook.com (2603:10b6:510:205::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 05:02:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 05:02:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 2/2] Clean up sched provider trampoline FIXMEs
Date: Thu,  3 Apr 2025 01:02:52 -0400
Message-Id: <20250403050252.15239-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0067.namprd02.prod.outlook.com
 (2603:10b6:207:3d::44) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9ef95a-02e0-49a5-8a36-08dd726ccb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N3oBOs/s2g0624et/AD2rbuFNMOVvZqUBUuz/WWNwJxHEuRAGT4GgmPAs7TE?=
 =?us-ascii?Q?QltHEzUGZHaOpQGcaRR/FJtdARIb7SQS5UBSLsZsUB7qW2O45styaoOWQ9pY?=
 =?us-ascii?Q?Dj7uXctoiDbGCykMF48rhAUJrUQRhWEXWe1nH7y3q/3XLsHDeN6M0xw7BC2Q?=
 =?us-ascii?Q?l8hLJP2/NnQxj/qqHzhn6SMzAOQkFa3p5z0KEyMuuMtGRGfX4/TTYGLwwb2s?=
 =?us-ascii?Q?IU71RBgXL5Q9Uamxnx4uxmaLVcLFWtfww52woj+8o1l/LKP4iMmyBC71YZTP?=
 =?us-ascii?Q?jGJuoMzDuR3V9L5Yb9QV1A/a0Bxuj3X3MWac+dM1BqHJjNHBnRyX1cm2RyYD?=
 =?us-ascii?Q?gPnU/NkXRe4EMvOYpzEPthsCKuCpoPOn2LGrpQ4vFX6DHbve6Ew1X/O8RhrH?=
 =?us-ascii?Q?hbQXIoDwkERFItbFA9+FLvU5ktZkoY7Eo5b3qJtJG546ySNAsHif59FD19Cu?=
 =?us-ascii?Q?lvsoeHfyOTaqbwHki4Ecsz3O10TDrYaTAN/MiBB6YGMmdL1sB2mr0yWcPl5M?=
 =?us-ascii?Q?7CMu49i6Ne7n2OKcoEFYWTDFR+eb81dATVViTwvME0CyuW455PMtzVmF6Ln8?=
 =?us-ascii?Q?+UpMmPmvh4Y3frgVB9AlvxrK+FgK4Y5fWBk9hWmJj/gUYY7Wg2Vw/zOGhwXs?=
 =?us-ascii?Q?1I0dnY+/6fSbVLgIBB0/7icgXSeOdXN6blqpIolVBlDt+dcMlQAcnnDx/gty?=
 =?us-ascii?Q?/BPyskzIp+Qp9F8SvPMXNpSNf/2g8F1SVuPx+MCtO/+cQIrj3zGTzzuDXHKA?=
 =?us-ascii?Q?JZ/4PIeoyr6Err/fOmTEbP17AcTZro7d2Z3YrepNRDaK99CCwThI12QSmydz?=
 =?us-ascii?Q?Ur7Zw+u/G/2yKTUUms9scTocF5dkL0wS6BpcLP1EyACDHFddXzcGhkmj4ceI?=
 =?us-ascii?Q?AG928QeBe304zMmK3fsmjbAPKxnfJqcShzU11+JqAFCW8lv6elmciuPmDwFx?=
 =?us-ascii?Q?m9AsTGX7k+4DCCXtANzSlQmQ1KTE+9AY/cfVpHbshcwUhVSbyEaHsfq25VEy?=
 =?us-ascii?Q?IUvL7BTylZXDDSwTk0gpbPRg4quvlzl6yqa06GkanjOyw9aXDnqhMfXAus3H?=
 =?us-ascii?Q?0XJznkeYn7m+ZWP0dNR1Z09A+nHverLBvtNNTxcXk7TfgerGWHBtND/5QxuC?=
 =?us-ascii?Q?/URTx2Ljye8paEOSKxLMmJ5Xd0JJIp6qSKoUQCm0w792nvp8FJuON6rToqg3?=
 =?us-ascii?Q?HFUcNOQv8cWTkXGjUwsiQpRBkGdlmr/ALrV5GcyAL0zFKvN7Yw+/8IXHwN3o?=
 =?us-ascii?Q?fGiadVBmp6kDykpMaw4gIWApXA/XKFOMi9aqPXv62v8EX/jIJKz4mWIbeFxZ?=
 =?us-ascii?Q?0yf7Es2vc4PNcdWJwCF9pjC+AsQszbpIoi58LlNuou6kCVdze0dBTQNPZ8Vd?=
 =?us-ascii?Q?t+kgEIjTcyIxTcoqwFpWHIv+5zAT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DrFZ4XwsvxMBbedvGpv86DhCIx4lJWWsfabjbQN4RYKxtohdsLLR0jfURzuh?=
 =?us-ascii?Q?YOYZJvlvB+2vTICO/j3ThUZiw/t7ufH4Z9dnprHp1PyzdrlmhLUnmH0IEny/?=
 =?us-ascii?Q?pEJ73wGtGOBruOgp5+3GiDx9aHMUcM+4AEMHCrn9E/7G5lEQQRTouxnKS8ck?=
 =?us-ascii?Q?jcEq6eN4HbIqO2cxuk3DiqEU5Z0VJdQgWuDeEnWKdqm2m3wlv9ZZjTRxmgmG?=
 =?us-ascii?Q?0SkfQI7rs+brSfbZZLMbedCXXtl864ttD/JeIE5opKAyqGO+oIrJ7ssqH4vK?=
 =?us-ascii?Q?3PquxVdeOVJpU/Yod5pAPvdYbqZ/oBZeFyN3C79Gwh8LccGssVpFH2aVCI0V?=
 =?us-ascii?Q?4fkUDS9o+SKlSxAbcjTg4IOtYQO0bklBq6/T24ZaEMLtMbPvl2z/t26cjGkS?=
 =?us-ascii?Q?B4o5BNJAQBtvRuO8xDUjwb6sx2J7A7Nix9HMaGqzTgF8VjnyXRiPcDUhuDOU?=
 =?us-ascii?Q?RbunGfOIIAClQTbONxzI+BA2Vq4Xu5P7AtOhk4JOGHltasOKug6PjGZMDR2y?=
 =?us-ascii?Q?bMV+CnVkbtGQ5sdpy46gLol82Wi7HYxhS9GExmqEa2rpJjMZ9RbAa3nDzUFW?=
 =?us-ascii?Q?1BPggwymuTsAzHu3pXxMxI5kal/P1InStmAeXhuh34HY/7AQA/sbib6xrhHN?=
 =?us-ascii?Q?gY5EdOgpoE+tThVgLrJYExWyHzMNnhmh3/uwT3ejU9nW7YYUAWg2F9E8RIda?=
 =?us-ascii?Q?b7+6xNPlL/0pNyIMIxM5wtwGfsyximSd2kWsOlmQaYG8pwQfoFYFIsTumlnq?=
 =?us-ascii?Q?L0vcapSaMv0OHbyA61WSunlYMWjwgxQQPoTLg7ii5vC1XO+uRhYN1ov/iFc6?=
 =?us-ascii?Q?fjGPcjI/JqfurrtqYFaZEKNLCeVKd7sGnnoEqlnOxQ0saM68/SPMQyH7ImbI?=
 =?us-ascii?Q?1lrcjnxHIug+ROe9B/h1J7bK80NhxKEydzYP2hl+ZAZ2SMqiFW2DNBwof7vU?=
 =?us-ascii?Q?ZMAdl/is+fo3vYNJZhm+Sgv5TXntMSOAlnc29oHwzzs4qHeYplr/fyC2XCwf?=
 =?us-ascii?Q?FcqOw7Dvc4uYC/NEehm9WCSJbxfW2ylPgQZOqpsacouBm/A+k7gcksMwFgYi?=
 =?us-ascii?Q?6mr29EFZaqISOMYfUzeJnLXIisxpS6Erh11gdne+JBAQ1t3GSiu7CxHQa2kz?=
 =?us-ascii?Q?Mf/rAdPdgDPkIo1+zucOgZ2l6ZAnAkfFCk097W7trc8dCgd8/rn8orC2mTGn?=
 =?us-ascii?Q?J4tsN3/xz/7W2iuz29UgcSD9pn4UDSKhSHQbakk9Lhx0nI4Qbz5i6NLfeLvC?=
 =?us-ascii?Q?bC73T+X8Zexu/TAsza5YTMSxcSoj+C9nTLYN6eo/Uqf4GIvRg8iQvXyGQWKf?=
 =?us-ascii?Q?qCyQ0qnt1cSYFsTtg01SfVdm9TBpYhWl6uhVKRJi24qCOOR8/6QLZzZIDuEW?=
 =?us-ascii?Q?oYyZ/yuVufxCAk57Hyuvx2j9/BRtbPbIsyXNFzmc9PRJrgNaDd+J0c7H0oIY?=
 =?us-ascii?Q?L6U/BqPdgNTRAg8iQ8eCfrnKZRTa45sayNxCu0P8BXRAeNY6tHNdIINOH+Uq?=
 =?us-ascii?Q?pG/KHAeWlv8ZN2eStBPpnY39W0ic5JeVDZTwGJ9aZmGwdNjFOC6n0xfOZC0s?=
 =?us-ascii?Q?bZ+W/cUwMviiG7/U3ceUGpT53QFfje0c90tRJX+n?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OdjQACOzU4d9LuFkt6qHvYQUGPIirilyAfU3bQ1R+CAhkdchAt+hFoxVnALV6N8LrcUUp2/UzNVhfBB5jz7NUxXIuBJWAghYur94NOUEUCO5TpMQP/702eEg+aeG9VKZ1lkpy8GKoH34yE8VuHxncbU6qW8F5FcoqSGXkpwde9RdhxY8LhbenPYVi7eUy6myZs62eYd3FYpxfFi/qpOVJXSBzprTYtFTAK/Kz6UAeW0nDjBZYD2QGVFCIIj0aZUj0i3f4pfVzNJuEl2PtASyze5J/6lf4XPSaZ4IwebB4ugaKKtmG+lxsIN9Acj8caxww03v10UspK0WWZhf/e+ssztZv1m+jQ7rd8EuV0PEyhqwUoOdprLRvARB6xRpxrycQXTjaMCGo31OBRpfYdGW+K3sqLC0p5+hTMt3wqLyni/lioLz2eKssD7QHpxrl/rAsvNS2mslYY4Lr7fOfpQYMpn6dW/5KO6NJzWf1ivEF/sEV7RYchMWA44XVGib521oBJk4ChGQhq6/v8WztYc/s3MGSkmfb1FiBN5RRS5uIPGvRgzAgMkYcu/NI8j0NUuaeba58skvUwo4K4tZLUcedpOHU54gyWwHFqaGrq0SZ7I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9ef95a-02e0-49a5-8a36-08dd726ccb33
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 05:02:54.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20w2LjslrDL8b2q3qgmkBIpLevqHCSH1i122uKa31W4SS+cAQHbB2kV+zycFNvdU+f44UfnrZscrDtMwPsrFOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6601
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_01,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504030025
X-Proofpoint-ORIG-GUID: yBX4F-JkcjXlfTzmqo_GJg2G0IeCjaae
X-Proofpoint-GUID: yBX4F-JkcjXlfTzmqo_GJg2G0IeCjaae

From: Eugene Loh <eugene.loh@oracle.com>

The sched provider trampoline for enqueue and dequeue probes had
pending FIXMEs for providing a cpuinfo_t* for the cpu associated
with the run queue.  Implement the missing code.

Since the cpu associated with the run queue might be different from
the cpu where we are running, it becomes necessary to access the
cpuinfo for some random cpu.  With Linux 5.18, there is a BPF
helper function map_lookup_percpu_elem() that allows such lookups
on per-cpu arrays.  To support older kernels, however, we change
the cpuinfo BPF map from per-cpu to global.  Also, it is a hash
table rather than an array in case cpus are not numbered consecutively.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_agg.c                     |  2 +-
 bpf/get_bvar.c                    |  2 +-
 libdtrace/dt_bpf.c                | 34 ++++++--------
 libdtrace/dt_cg.c                 |  5 ++-
 libdtrace/dt_prov_lockstat.c      |  4 +-
 libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
 libdtrace/dt_work.c               | 20 +++------
 test/unittest/sched/tst.enqueue.d |  1 -
 8 files changed, 89 insertions(+), 53 deletions(-)

diff --git a/bpf/get_agg.c b/bpf/get_agg.c
index c0eb825f0..e70caa6ef 100644
--- a/bpf/get_agg.c
+++ b/bpf/get_agg.c
@@ -21,7 +21,7 @@ extern struct bpf_map_def cpuinfo;
  */
 noinline uint64_t *dt_no_agg(void)
 {
-	uint32_t		key = 0;
+	uint32_t		key = bpf_get_smp_processor_id();
 	dt_bpf_cpuinfo_t	*ci;
 
 	ci = bpf_map_lookup_elem(&cpuinfo, &key);
diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index d372b3445..d81c3605f 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -67,7 +67,7 @@ noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
 
 noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
 {
-	uint32_t	key = 0;
+	uint32_t	key = bpf_get_smp_processor_id();
 	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
 
 	if (val == NULL) {
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 6d42a96c7..d6722cbd1 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -761,37 +761,29 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
 static int
 gmap_create_cpuinfo(dtrace_hdl_t *dtp)
 {
-	int			i, rc;
+	int			i;
 	uint32_t		key = 0;
 	dtrace_conf_t		*conf = &dtp->dt_conf;
 	size_t			ncpus = conf->num_online_cpus;
-	dt_bpf_cpuinfo_t	*data;
+	dt_bpf_cpuinfo_t	data;
 	cpuinfo_t		*ci;
 
-	/*
-	 * num_possible_cpus <= num_online_cpus: see dt_conf_init.
-	 */
-	data = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
-			 sizeof(dt_bpf_cpuinfo_t));
-	if (data == NULL)
-		return dt_set_errno(dtp, EDT_NOMEM);
-
-	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++)
-		memcpy(&data[ci->cpu_id].ci, ci, sizeof(cpuinfo_t));
-
 	dtp->dt_cpumap_fd = create_gmap(dtp, "cpuinfo",
-					BPF_MAP_TYPE_PERCPU_ARRAY,
+					BPF_MAP_TYPE_HASH,
 					sizeof(uint32_t),
-					sizeof(dt_bpf_cpuinfo_t), 1);
+					sizeof(dt_bpf_cpuinfo_t), ncpus);
 	if (dtp->dt_cpumap_fd == -1)
 		return -1;
 
-	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
-	dt_free(dtp, data);
-	if (rc == -1)
-		return dt_bpf_error(dtp,
-				    "cannot update BPF map 'cpuinfo': %s\n",
-				    strerror(errno));
+	memset(&data, 0, sizeof(data));
+	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++) {
+		memcpy(&data.ci, ci, sizeof(cpuinfo_t));
+		key = ci->cpu_id;
+		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, &data) == -1)
+			return dt_bpf_error(dtp,
+					    "cannot update BPF map 'cpuinfo': %s\n",
+					    strerror(errno));
+	}
 
 	return 0;
 }
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 6dcf4cd3d..d83b1c2ce 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1243,9 +1243,12 @@ dt_cg_epilogue(dt_pcb_t *pcb)
 		} else {
 			idp = dt_dlib_get_map(dtp, "cpuinfo");
 			assert(idp != NULL);
+
+			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
+
 			dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
 			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_FP, DT_STK_SP));
-			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
 			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
 			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 			emit(dlp, BPF_MOV_IMM(BPF_REG_1, 1));
diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
index c73edf9be..8b2cf4da2 100644
--- a/libdtrace/dt_prov_lockstat.c
+++ b/libdtrace/dt_prov_lockstat.c
@@ -121,11 +121,13 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
 {
 	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
 
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
+
 	assert(idp != NULL);
 	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
 	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
 	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_BASE));
-	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
 	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
 	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
 	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 3a218f3cb..a548e679f 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
 			       probe_args, probes);
 }
 
+/*
+ * Get a pointer to the cpuinfo_t structure for the CPU associated
+ * with the runqueue that is in arg0.
+ *
+ * Clobbers %r1 through %r5
+ * Stores pointer to cpuinfo_t struct in %r0
+ */
+static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
+{
+	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
+
+	assert(idp != NULL);
+
+	/* Put the runqueue pointer from mst->arg0 into %r3. */
+	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
+
+	/* Turn it into a pointer to its cpu member. */
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
+
+	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
+	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
+	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
+
+	/* Now look up the corresponding cpuinfo_t. */
+	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
+}
+
 /*
  * Generate a BPF trampoline for a SDT probe.
  *
@@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_probe_t	*prp = pcb->pcb_probe;
 
 	if (strcmp(prp->desc->prb, "dequeue") == 0) {
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
 		/*
-		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
-		 *	  associated with the runqueue.
+		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
+		 */
+		get_cpuinfo(dtp, dlp, exitlbl);
+
+		/*
+		 * Copy arg1 into arg0.
 		 */
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
+
+		/* Store the cpuinfo_t* in %r0 into arg1. */
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
+		/*
+		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
+		 */
+		get_cpuinfo(dtp, dlp, exitlbl);
+
+		/*
+		 * Copy arg1 into arg0.
+		 */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
+
+		/* Store the cpuinfo_t* in %r0 into arg1. */
+		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
+
 /*
  * This is ugly but necessary...  enqueue_task() takes a flags argument and the
  * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
@@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
  * outside the kernel source tree.
  */
 #define ENQUEUE_HEAD	0x10
-
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
-		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
-		/*
-		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
-		 *	  associated with the runqueue.
-		 */
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
-
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
 		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
index 498d5332a..2167ed299 100644
--- a/libdtrace/dt_work.c
+++ b/libdtrace/dt_work.c
@@ -37,35 +37,29 @@ END_probe(void)
 int
 dt_check_cpudrops(dtrace_hdl_t *dtp, processorid_t cpu, dtrace_dropkind_t what)
 {
-	dt_bpf_cpuinfo_t	*ci;
-	uint32_t		cikey = 0;
+	dt_bpf_cpuinfo_t	ci;
+	uint32_t		cikey = cpu;
 	uint64_t		cnt;
 	int			rval = 0;
 
 	assert(what == DTRACEDROP_PRINCIPAL || what == DTRACEDROP_AGGREGATION);
 
-	ci = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
-		       sizeof(dt_bpf_cpuinfo_t));
-	if (ci == NULL)
-		return dt_set_errno(dtp, EDT_NOMEM);
-
-	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, ci) == -1) {
+	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, &ci) == -1) {
 		rval = dt_set_errno(dtp, EDT_BPF);
 		goto fail;
 	}
 
 	if (what == DTRACEDROP_PRINCIPAL) {
-		cnt = ci[cpu].buf_drops - dtp->dt_drops[cpu].buf;
-		dtp->dt_drops[cpu].buf = ci[cpu].buf_drops;
+		cnt = ci.buf_drops - dtp->dt_drops[cpu].buf;
+		dtp->dt_drops[cpu].buf = ci.buf_drops;
 	} else {
-		cnt = ci[cpu].agg_drops - dtp->dt_drops[cpu].agg;
-		dtp->dt_drops[cpu].agg = ci[cpu].agg_drops;
+		cnt = ci.agg_drops - dtp->dt_drops[cpu].agg;
+		dtp->dt_drops[cpu].agg = ci.agg_drops;
 	}
 
 	rval = dt_handle_cpudrop(dtp, cpu, what, cnt);
 
 fail:
-	dt_free(dtp, ci);
 	return rval;
 }
 
diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
index f445ac843..28dcace8c 100644
--- a/test/unittest/sched/tst.enqueue.d
+++ b/test/unittest/sched/tst.enqueue.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 #pragma D option switchrate=100hz
 #pragma D option destructive
-- 
2.43.5

