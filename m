Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80889210F8
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727490133; cv=fail; b=BHI3NnDLDKsB//pkiNhCfxUwmTAVzByn6KO9xxFk7XybEs50NK2kJJvlhyDvRuYo2i8uGBfS8HxrxUQKElieQACZgYhv68g6CESnUYs5KgbmJ2nj+HQ5Ikzt+UYmgOABbwQk5TcPdnnUDMOSNnB8+9y+2Do/RN6XnA3lp3y510k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727490133; c=relaxed/simple;
	bh=2LAX08u4PAzMkQXv0WNnnru/HygV8tevxpYvEu7kH0A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TJj/o2AvTS94+Z4dBPBm0mGTeK3Zc4QVu3ksnJTSD1R67/IY1/b9Vn/4tQtT8NaFyblYq5UuZ6RXW+34E3ATTopAcqsB0y9lTRRHsZjfKvbOSJnYErf4Iw++niQXcezl6M4FptIr1VfIrvjoUSs1wC7hrxHEBPrN7O/ERmJgdp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mjZo/XHp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qdqgROqe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mjZo/XHp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qdqgROqe"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1qJ70014034
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=SmQLuTmOUhsW2n
	AydFzP6mTdAlJdgmdyFgJhS+Gvyo0=; b=mjZo/XHpKoCzuJmrlXdDL4wPFNxhql
	Lvt7DsfTyCfWKXhkh0JYB3+sWMxJYGuvnyo9OEmJ5NwNfqJ6qwmN6im6oGKz+suZ
	kWRX/XspzQAuiBRZjfX4a0aEPSwwj8rE8IIasgjqt0Kmw52q/Xjye4cHyjFhixGC
	p7HNtE0+hPMAmDPUr96s/6eSD3LCa6PIbWWKHS/BsDCIeCltWjKzxd73Fjcpmz/b
	NhHLU8Rqdnn3v/II6qej+krLR+rmTRvd9JLLwPfcc3LuUwJj/XlExkAniuvbzDS6
	lXx6zdcLLhpt8aT/vMeBY5yR7t5ykzocuu5HWPfnTKHNNfn9wAXN4bTA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sppugykn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48S1XMbc039355
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41x8848pxj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Sep 2024 02:22:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5aJhu/3Fdy6T5H3pWuxwZ06PuAII98vdztnec8SCWD+rDctfrb/ATEXQSUcDyvco2tipsYZYosq5nlHNutoQhXpc5mjrZTHsH8fjaIpliwKYDvtm+5hrps7T/oWqlJqU9ojbhX0I8SKxta05TfOLXOBex5cGQI0FxN041vFBgI7J82NHjAxlAXoPEEZCCOOMDKUZZj7NQYI4DJam3oak7PFQF4uKsct2Jlia1VMqycNVZr3JJhwkiRudKG0rsd8nLYr4PKaRW5Mt5kbapRJEE9931TYA8Aaok9Hoh686GOSxJAYt0d4c4fRswFYZ3w4Fzc/Kcz+gkom53RptdKvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmQLuTmOUhsW2nAydFzP6mTdAlJdgmdyFgJhS+Gvyo0=;
 b=djZ9AF1IYsBWRnyfax1Ov4H2uiyfo3YviCfP1TzejOXUkfeLNhHw5RdsRErPsEb+f3wVq7Lx4vu4I5rWrZ8ktyiCk2q76pDwMDo76ho/hw8oaiCytRULc3c0v5HuGk17CT6945tkSNEvR/THjQ6p7qImx5i+ktFkO7x50KpHXLLMJGar5ugKP+V+nOA4c4GnKqVsRHA8N+rHf4U2HY1OsNt695aXcimOIJZrHmGvaE/aRjvAPQNZUnydmrKmyGDYxHSvvbHqnZqh32T6+2bgwDWF68t0xfnLWPOAaRPTZltpr/4E2VynO8p3SXqc5Z9wmi638O+CYv2SLBu0LrrmKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmQLuTmOUhsW2nAydFzP6mTdAlJdgmdyFgJhS+Gvyo0=;
 b=qdqgROqe5AjOxsHPVem+/ANl32LK+vIKYtepiV3YM816AEgB1ZouHITlCHxcLumdPgTdNiYUfHx7CVUxu+H2IECAsH+9DpFkZgRQqrfI+GGhV/ykSqC2Nj902xF6iVL4THgVZcQFjbROHqdY5RcP4Cy0sZcVXeNoWkM1pHbQ0DA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA6PR10MB8206.namprd10.prod.outlook.com (2603:10b6:806:441::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Sat, 28 Sep
 2024 02:22:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.009; Sat, 28 Sep 2024
 02:22:07 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/6] test: Correct long-standing dt_flags typo
Date: Fri, 27 Sep 2024 22:21:54 -0400
Message-Id: <20240928022158.9206-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240928022158.9206-1-eugene.loh@oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA6PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6f574e-8a8a-4fdf-ef5a-08dcdf645958
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fID/hGEsaPia535bBIWJO0voBQilqdmC5bEDBvGGH+j7pMtPhb8UWw7G2FKg?=
 =?us-ascii?Q?JcKHWzbm0jJDorkvASLz2OEhCiaLoEOhwGnoznWdYc4S9lIDOfKXICTcmFlX?=
 =?us-ascii?Q?OwIFrGzBll4vo3FyPj8c1qZvaA4Mz5sDGpKZbqO5v1cFo8zj9z9o0xLKbs52?=
 =?us-ascii?Q?rydDNTHPFZzYAj5OmQU4C6Cp7JiasHO26Wzk92mOZkrK66qLRkPNhmevZ2nP?=
 =?us-ascii?Q?0iCfXw87HaWJhrZUGGMNj9+3RVcL1Kad11TLacANhHg6n2Jcjd5V31S9sKBb?=
 =?us-ascii?Q?PvIYE1/ecNY0/VOsftQDHrZZpdI8MmzM95kEINEgTJZ+gGVUEI41FRVreIGA?=
 =?us-ascii?Q?nkTAyoqL4VQCcRwTbuIduSM8vUZ9XVMOGzhz8DbtHTtLPI9I+mkSROKR1pXu?=
 =?us-ascii?Q?Mfsg91m5sXf59gVDVF3nUaE0UXZFWZbQjpw3c6TJFc2CouQ9RI9iahV+PE/Z?=
 =?us-ascii?Q?6ChkrhcyBJOvlPbdCwpAyb2tknoDPIZxbKd5XBRN2rr3sxRrwghFC/FfXoOn?=
 =?us-ascii?Q?NcoHCjHMz/7zAr16H5Zm79KzhpiVDxeOayNDbD9Fu0VKNWx41dTsC9dHCgHF?=
 =?us-ascii?Q?1GX1Nc7P0DdowyJ08du2J5IR/JNzZ+b+c4u2aKF3EWh4QVs5uvIiHT2OhO0F?=
 =?us-ascii?Q?7f2HHAyF+SzvJkNAeKvwodL8hEMMrOIxn+FPpXdnBp5QuXG9ady4Layp57/Z?=
 =?us-ascii?Q?m7OjIustXanFbO7TMBHndguCUJQp+rkBpWUOX+3y0fQThM7zlfd6HpcpVoJR?=
 =?us-ascii?Q?WzDkLmALtw6tceHWh1/IvVAGmKOJ/CMq8OaoF5khXJiNmNH8NBrroKBRuZgV?=
 =?us-ascii?Q?/uXbCYH/DMMmj39FC1sNeOLHj0uNsFe5tZPzQ20l4da7uXzq5ndeU/HPKld6?=
 =?us-ascii?Q?rDQ2UzkzmrKRazNyX7LAlL3rLXvQkc2EQoNl2ZdSsJhEWmd08vJMz0LW7EhF?=
 =?us-ascii?Q?aO16xPzEz+KRIVhi4vx1BeSLJGuMm6t2HltyL6WTbbtdaerwvj4ZFz5woJir?=
 =?us-ascii?Q?aIO37Nplipf/qcGU7XjpWOb5c4FFdiEaj7DfpebtdBth76ElZK6tQjKYl9OU?=
 =?us-ascii?Q?w9NxHkE2RWZ1Zk4I2plvn0WowcBlyiTeHphyoRICfUut6ouuGxQbt+ZCtZT0?=
 =?us-ascii?Q?ctvBMGEB8X6XhyjZfZhVzo+N8f6WTlVzOdQLxtjAELjTHyz/A4a/YE23LdRY?=
 =?us-ascii?Q?Yzkxeuvnnhg81Cup6SROwbo2o/gvi91Roobt0gaQjnyWTCvUedZxly5duBAF?=
 =?us-ascii?Q?dUruAMjoq0MXqr0XYE8MTp1GOkKJGsNdx7gp6cEKqg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yzXSVBvIRq3i9seG1P2yIqmkgkNCXisqI3PxI2vUpAvsDVX/x1zyEA2eP+Tu?=
 =?us-ascii?Q?dtm5j8X2S1WEtfD2zmvljnfkIXJdjYuRxVU//4Kjd2PloHs+byr3mc1UTW6B?=
 =?us-ascii?Q?9pZemweCTzfHmn+X7W/Eskb0rNtHfwA83Y0i1IMDUg2S8Xf6wowair53cpiX?=
 =?us-ascii?Q?Lz8XG0lKaQORijxAvwiwbyHKZ+TZfTIkP+i3eKvhfx9a5HqNPRoyl6ILg2p+?=
 =?us-ascii?Q?nh62Rex22iJPgdSyPhw2nPrUGf5G1qRwd85gbQ5OITjLpHYkuamXlP+3yxt3?=
 =?us-ascii?Q?CVQKsZCZex3WElzNepEMUp3Y19ruxkUC8n3oNSBjgu6GfhQcUCzq7OazkmXk?=
 =?us-ascii?Q?LkO7rczOB0ckf50PfK/RCKKjEnptNaKmtGeXwVNgD25NAIah5HNNKlsGY5e+?=
 =?us-ascii?Q?DqpI5Qk4gpr1tgdiFA5qJKhaLyHRMiILMyyxG47JTdafsK+BZMxxLi0hoCCg?=
 =?us-ascii?Q?XbX9XldZI28tHCx7ReMLZCaJbRvekpYW+gWVTOQ6Ptd/IOeiqc/zwX52DBJw?=
 =?us-ascii?Q?CaAmTX1xBrpD25qx2UjyBFakOanOOcSmhU+sJeJcHgmy0aera5sM84JYOdjY?=
 =?us-ascii?Q?N6UD3T4OOQbG1oeRrrO98uG30XAa1eCDn4OYj6rK+uPh0ayjtAJbqg6A2+gg?=
 =?us-ascii?Q?/nWrxWtoKEN2oIy5mlk7snLllpFHKJugib7l068JEOSqTPZo/G3Xiq7+2jw1?=
 =?us-ascii?Q?RVV/uMQn1yyGukv7ocE9bSaTlm3X7U8ejWwl9lpktBUb2nn5F1Hiqa+Bt9zg?=
 =?us-ascii?Q?X+mc6mB7gHsnZlCN09CkQ1Cl3pdKMn/BXYOEyUk5XDHbul2WwzC/GqRDndr7?=
 =?us-ascii?Q?1oYIiK11GvRnd4QAL0Ho2tdOXDn9Xq3BMS3peY2z4LMXWUn2LpFDKoX4wE8n?=
 =?us-ascii?Q?HDEfKGzLOwWCEmLXje/6gdeW3mKDPOGfWOJU520qpzUsjxfl769AVkfhWrCK?=
 =?us-ascii?Q?xNjLCFK9QafZ0lRgCbXCtOX6+QxgEllFIR39xe1AvGaipx6WDIkSK5tp2rUh?=
 =?us-ascii?Q?mTjaZjf9Af6Zfvd3gSDuXPYT1XPRwoxHyW8TMyMLGQSwTraXKWELl0MlYtL7?=
 =?us-ascii?Q?2M5ZmFXPmqwARoLdOV51vb6uyKYx+ctVwPT+Ks71vjUfJ74y8QdgRoVwT6uX?=
 =?us-ascii?Q?SAo+hlVoFwT/wr6nthLjLQZe10gRDE8Pw+jMqPj7gcmok25MZqtMFkcKwoVG?=
 =?us-ascii?Q?MRcnlx91Li9W5JI0Z9fBgIygF5Q9JtuJ1OCh1+rAWjaFvn8TsIDwoKRhiOI8?=
 =?us-ascii?Q?YuHDcm4wOg9bteWFSMczHYOiKEvqkr6fV5169c6D9i6T6sFrZKW3fUuY2BV9?=
 =?us-ascii?Q?fsCMJVvySPYcVYyqC95GwlOVUgO5dmJ0A+uDmnEN+YiD+tIg0CZadwU94L8F?=
 =?us-ascii?Q?PZH+qFDQw7Ed7efSfx3wy0Qe6z6PNivQQ/DZ6GecA9sr7gK37s3vhS9GJ1bJ?=
 =?us-ascii?Q?WT3aDra8tn9tLqw1RK7EXDkRJVIPGbEEzDnRy9giU8L/O4lbWaujTmSkDu15?=
 =?us-ascii?Q?TQwU7OlNtqF89E4q1eDRvKl4c8i5UuaB1iFSW8fj31jnw81+W67y8jhVT6d0?=
 =?us-ascii?Q?Sra9UBZVVv2et2DYzB66HAKZqvg2SI2iPfsoMqWL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hk63rY+MT2NYYNj9d9YaRUax1Irsk4cIJYYEcz5YhpswBl6EZeZrbSko1kYwvdqscEJH4XArjZdXwOD7plpVvhigkJ7d6AtIV2nwyDeTrhrta6tNsCkO8hMlHdyQwCf6SucBH9IPjB5JqxrvMuVkKBMyHCJrgjIDoX8eA3Z5HaiT+4KoMt98u20LuLHgejnT0wtIGMOlnZK68n3f8G7gHHJaIgu7j6MihMn69ogBfpmgcxMSTzhf1B7/jMGcUM89qHRweVHvWc9FZLjJYL4+gmhMX2zKdLgRsXpDJwlDjnHamq2hmHmOj+zcc4ko88GPHy0sDyr7HGyDvmq/+mAK/E+VBQRmlm2prt8YeQoQ5tyXCTtf4VJ+4rlKsjWjPcvDwPj27bSiWomICNdaG16DZmR/cG/iWgvi2xz1l4YKQ3fq6BzBsOZ6m14q341DaIqAH0KLI2fUOjcWUgcJT7zJMWepNRuOKqQqkxSiMJSeiZN9FZcEvL86U5P38Kcfe52RRJ7VDGt5Qfy8uS+K8SZ//CQXZQT9FdyM9DA+asib5euCWviaAmZXI7l17Vamnanj/lDA+NgyuJFNXcyrmjJlMHCjGjOYow1yY6Gsw6+XDhw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6f574e-8a8a-4fdf-ef5a-08dcdf645958
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 02:22:07.0932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lSBG4UVGre3SpXJmJ2ZY+Vs/vlH5JTtXOgT+bTM7KYkwQO8y6y6AlDe0FWsbEeNefofewpkW9mFmFpzIc90MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_08,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409280015
X-Proofpoint-GUID: VUlEJhCkGhZ2ObFTkoxXVwtzhSIDgjPO
X-Proofpoint-ORIG-GUID: VUlEJhCkGhZ2ObFTkoxXVwtzhSIDgjPO

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/ip/tst.ipv4localudp.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/ip/tst.ipv4localudp.sh b/test/unittest/ip/tst.ipv4localudp.sh
index 0e357c3d2..4ee584400 100755
--- a/test/unittest/ip/tst.ipv4localudp.sh
+++ b/test/unittest/ip/tst.ipv4localudp.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2008, 2017, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -33,7 +33,7 @@ fi
 dtrace=$1
 testdir="$(dirname $_test)"
 local=127.0.0.1
-$dtrace $dt_cflags -c "$testdir/perlping.pl udp $local" -qs /dev/stdin <<EOF
+$dtrace $dt_flags -c "$testdir/perlping.pl udp $local" -qs /dev/stdin <<EOF
 BEGIN
 {
 	send = receive = 0;
-- 
2.43.5

