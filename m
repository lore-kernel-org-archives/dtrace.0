Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C809E149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524704; cv=fail; b=U395090eBzpuRE5TZ9HGiLKokm4ySINY4QVHxqoMLSABviEU8Zk83MwaNOaTCUPmzWgHVGIZ8U9wy73hvrhNzLr1MWCRmg2PrhjZwcl1hweNPA+kF1Fd8gk1PWuE79riIkZ+0dUooqHV4WNUNvfz9db+z2ET+D0kbd4nqxxqFAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524704; c=relaxed/simple;
	bh=sGTr87yykwH8N/BvW01gKq/AQL6akB3YWIf9q9gIaq0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WUNhjhB4MVdUfrc1QYEEZ4+eyAZzcw+7/X7zo+XbA2xEChy3xyaGrguHa8iM82Vx5VWfiY40eRaxEZCM6ZV1yrNVTZUTQlx0KOCeMjUW4jAJwXMF7zSRybu0k5yyetcOxBKvZmQqHa07pztPclUdTur/s90UUfTr/w6yFMi415o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnST3026512
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:42 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3DskkYDujiX4KjDki?=
 =?UTF-8?Q?4atus+a4l9vbDHy3SRGOUy1gkQN8=3D;_b=3Dbi3EPnoRxCsnDX9RccJ+aE8vue?=
 =?UTF-8?Q?iQ40yesuKJvxxHRBPNfwTuEAKnsQi3IxNvh0euqj5q_NtAeOhPeODjnNqgzoBRm?=
 =?UTF-8?Q?N2ZvLh/DijZq2M65LmEJgU+yk5ufYx19quZ+F0PAYaFswXfF_T+qb4ZOwNm0iWo?=
 =?UTF-8?Q?I0Eb3LYjqWik8p3c6ncDrZqGnV3iqqJmOLa+6ijhb+3jMJRZKnNDTY_aCxu9xoE?=
 =?UTF-8?Q?CpKOZYFJDNwxqPBpZYVfvj+HbqHVwyoir661iC6T12CvV8kLRPoghu1+FDUG_El?=
 =?UTF-8?Q?lv6WHmZR4/oQB9AtpgVQcnnEE7kQp0EMIqoPYMxRY9pPQC8ECdDBjohDvJyCsVt?=
 =?UTF-8?Q?p4m_iA=3D=3D_?=
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv07wmtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:42 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454HgYip025226
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrt8yy2b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIa8AvwTXCw7jdS3OaM1JiOW8tdxBxTRfVgIyROc3VWo19Oku7OqAx3imBlukjDO17JaSo7JZmBv94709AGni+MAco30ptoZLZfsFWMendLlJnWDdOHBr3e3EqbMxNsrSM5Wyz3/DgU/6qyFcjJGjFZxJ/cUJ+QxgqoV0wXz50OxHWGjCfEcl8+dCfFgXQXqrmA8F8sfHtKTR2yPnTQykIZ+Eh2fM0bGF0QQOQBqcHkjugTU/xDFl6E0HA1q9ZTwZvBJnqfVXNPKM0NybB7rSpuub9fX3jr1QGtnNrOnwPNB1llXIRB7BWmdlBjNu4MYb7WaEoB/vamdhQc7rRUF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skkYDujiX4KjDki4atus+a4l9vbDHy3SRGOUy1gkQN8=;
 b=LVnqRT6V4wp3p8DN51KPtW6BR6HT8FK0NlQpZU99n5Zx8tNd2wXSRnE2tOm2K5d1jpYIm5TlFdp1Yu3xOlnuvmUc/f/pqa57jFD5PEQEcEH0LXp3BFLIH9mCfp5nRFwYpIHEF9LrUoB1I5Rea1UwXEerd+jWjguLiFM0oyMYL7vNGI0VYf3jmqVwZhwwGfV+tU44VeMJXUr5RMEG2jnGjJn3bHPMSG0sQI/WV9DW76AB0AERtj1PBshIXFFq8nQzeJPbKrFNa0MuV3aXsC6rUac+BSDaFi3Gq/joK0ZQuubxivwwgK7OoaD9vF4LVp0uX0Cd4sXAU1drSIK6j5Ej3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skkYDujiX4KjDki4atus+a4l9vbDHy3SRGOUy1gkQN8=;
 b=b6ah70yM5h7FIDe5ynvD1NdbYcLhVWXaM2Oklotp99kak+bn7SbVJYIsCIt+Abvr3kLpO1IL1hKTutIqdv2UXpcCwzhLC+lWg5kC9hzacZ+zIun7kJMMlTeJ4nykCBYxKUVbX5hcfOWMkmGGGnCZfmX+ULCryJbsIaz0HN3cUhA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:34 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:34 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/14] Let USDT module names contain dots
Date: Tue,  4 Jun 2024 14:11:02 -0400
Message-Id: <20240604181113.11505-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0025.prod.exchangelabs.com (2603:10b6:208:71::38)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5e904a-d2f9-408a-d50e-08dc84c1c47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9gjuuNEt2RucG3hYsbzYKQyNoFaTjbCZryUCpHxdXGazTLQCQTF2JHG5AmGQ?=
 =?us-ascii?Q?jgSSxoj8UaEQMmB9d/XwubKPEfpp4etMKI9mEhZ5UoPcpuriG3X/ge7KcQPJ?=
 =?us-ascii?Q?PjBs/R3cinJ+yfWbcGfQ9SNSwadoor/LMKaf40PNThNDz8C808FjYgFRp3s0?=
 =?us-ascii?Q?j4cWxXXGGPX8xzJ3Xnz1SVaJ2sEJQeLBq8RUs+Q93OB8WxELJcGKxyXWMnv6?=
 =?us-ascii?Q?5LXwdWL4XI8OJy0krCGCJZITFf7sjxQNhITYmE2cdkDWbCozoqQa40EugoBs?=
 =?us-ascii?Q?XwcFVKD6NIUyHE4AYeENl1FUZgj8vms4jwt9yqXwuSEhIuy0XUwmT7GG2bo2?=
 =?us-ascii?Q?VpXbHE52o03O6gH/rUY6YaQ8gonxXIE8NGpD2PL0tXymx9iuKmLV+LFhzSNz?=
 =?us-ascii?Q?m7g69ltKxcMufEFBMvvEUMw1xncqSNc6DcemT1WVl7/XD2va9GZub4BEt7pG?=
 =?us-ascii?Q?EjGjHc146QdR5bHf28sPWArTbXG47h0C5VjDRU+iHqVb71GrQ+mbM8QsVwRF?=
 =?us-ascii?Q?fqyHcSJOjqq7RN1PPFdHMRyluH4squBNRQYqQQfj4hSuOgKjval9hadD/lGu?=
 =?us-ascii?Q?1rjcjaSxmtwvzXF5oej0k2TAiW1WohOZXYkgQYUz2aAbCIQWAxABgfVbV7vr?=
 =?us-ascii?Q?u4ZHUXdDlSx62emMXEGFwf6ims79BQM+nnDuBaTKx+2mu/5dSgVvV8lXBgII?=
 =?us-ascii?Q?doWpXpHEUFlX1QEk6tPAfFPUsM5Yem9w9gAWOUsa1N/pHrelBoQ2tFteTcdU?=
 =?us-ascii?Q?4lqxBn/queqT2mKbhScaiTrEPH4leTbb8ONho7zw0iulcwuHM1rgX21I+xaN?=
 =?us-ascii?Q?I6nComsWKNCBqUAkNW1jJvHrZ3V2LABK+s/MF/QJo7Iqk5zsnnT2Xdr2ixNI?=
 =?us-ascii?Q?GD2CkuQzEB4GKRUcve0540FKegrMTjWbZ8kfcG/ZxxQSKcIUgJ+eynx5Sr9s?=
 =?us-ascii?Q?iPk9WXdy/odvykAL+2wiAAz/rygybIC7Q58/Nq9WHO2IqgXllsO0euLggY3o?=
 =?us-ascii?Q?sQO5HIButydgfV8RWzAX/Ou30WuCruD/sCfrZSiws9/DMwA+BaRkshGMpApE?=
 =?us-ascii?Q?mOPTFxxPNo7ixnEMcfxubtJtpz9Tbm35qhS3BLNCPGcv2VcZn0ADrneV/bbQ?=
 =?us-ascii?Q?VJHNUMeYh37Cx+2cfw71BfHZUQT5yspdRyfVEOEOdGRjmmLGLOehUI0lQMXg?=
 =?us-ascii?Q?LYgD12xk5UknJSHBhvUZn8Ql3kKTTH5TxuYrBiHLzPlAogjDaGuZqhQ0vQKA?=
 =?us-ascii?Q?+JbGRf9VMy26seOkKAmpjPrVVv8wlanszd/RMvdv1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XLtjcqXeRk2LNCzrODjYTfmuo1KfsuYuum69YVU/uST0+9VkKngZPXAMUlzc?=
 =?us-ascii?Q?Wa3lKrSL3rAuVxzzCBvccdAYnNdyz8NN0WYzGZ5rahHhF6i0VvL2Yr/mFPi7?=
 =?us-ascii?Q?mzZKdmdo/C8mNKz9iFK6Jwg6hVuU73qYPMPejZ6zfWKuHZlJo7IzSUw0Qi1X?=
 =?us-ascii?Q?80zDznBHvo9WXnojqeS2Q2gAt4lZr7p+ZGlLxsMk0UUhHBSfS5YfBu9fD09R?=
 =?us-ascii?Q?B/JiCfuij3VBtGZqCqYaBqJtJU5H/jHxJx2+vWpcSoRsSEZDCWcCCWb69nwW?=
 =?us-ascii?Q?riSyAxZJhKP70i5rjl7M39ZVOlAeIndwPfIjL0WkJzQHzrysbdQUE8Jzlj9v?=
 =?us-ascii?Q?r1gyjSPng7HA2ZmTHpgVmyDZkiT/msVlN5eMdPfxaWTBWTs93VzW84rWqSg6?=
 =?us-ascii?Q?imhOoBeiXJJdCif1hnkrU7lSNHDDJTvrazFKZeWNJ1iCQxF3yl0FpUfu6lOH?=
 =?us-ascii?Q?Y+16Lo+5ShokXX2pHa+SnXDUrAuPLC1X3lZgkpHKWMPG1AjVkNtA/zt+s3PW?=
 =?us-ascii?Q?NPqeUviLVF/tFBcKrW197ai/lfIo236MIXCeqz0GrSnRlmNziOC5ntQ1U64w?=
 =?us-ascii?Q?a9tALuQaoKbGaq+aAkqhj9OeHpZpi7vFGsBfR8azkKBlCVWXFd1XCaDrbS1P?=
 =?us-ascii?Q?bfbN/EjKdfFr5Wd7Oc+cqceKasWmivVW3Pp/+lQ9LhycipnMfLzJQUTOAybb?=
 =?us-ascii?Q?Adicck7sjdLtgn1YLu9gao/BYL7RKwX9sRZNizGRkAUOTxqmB95f6xM/bX8x?=
 =?us-ascii?Q?fEnJc67Jl6IBnoVB2B0csvvOGCvw4XPSjDw31ATdg9KZHfYLyC4wN0+Cv1N7?=
 =?us-ascii?Q?sbS26goqlDFQ7/IdnJTnCjvDyvaxnUz0R+cIeinPC0FKnje3BdWjP4fW7AnT?=
 =?us-ascii?Q?Jh2jYDodf15cxF5uB1jToQ3BjThtBoStIqmfGs6JJwjJaG+hylu9HV7fo4eQ?=
 =?us-ascii?Q?OzV/PT0KBpO5DXI1HZSB1WVcSDcCMRWqQdm7usnHu1yymLsJ9GL3AgmXQlj6?=
 =?us-ascii?Q?MdfoboCQIi/FM93v6fQ+dNz8caIBbjVbzo6YLHK1YkiQthGIa/IVagvSpa2H?=
 =?us-ascii?Q?4Wz2IOo6frrMMuSvNSZhFe/yTRhTAsXmTYlzT2TBRMmpd6jIIhZvEy4LFiJi?=
 =?us-ascii?Q?IHo+TDL7J+7sKpl4EWPGDFo4L34bgVAusYdFPJNEJEdVU9txtNb1jXbIe4rM?=
 =?us-ascii?Q?JNA/2Rxb2ygJngEuI9NEZTvVnnpAaP9aUHRL7Ksh2db1A+ePGpP+SGfGfmdM?=
 =?us-ascii?Q?EUDyoJRPt0UWnGq68J4FpHble0FWE5LLkJxfvUh8H6B4XqRGPtIdIs7YPXny?=
 =?us-ascii?Q?0788kl9zGcsU3VYqWl6CIoYIWpP2C3fjVJ0NaVRDaJWbuJIRcUVBUj6K21rC?=
 =?us-ascii?Q?3+JYL9fIYBnsg52cORHKJ7dgTKdi61MDNcl3+iYIBjJUV4o5N11i7JCtZd34?=
 =?us-ascii?Q?ljisPqicwMEGsg+wDuGfcbbsvoMlp0834e5IxERaTwZWlRpfrx2vVVw4vpzc?=
 =?us-ascii?Q?Ia81HdilIOq1YzSqXtYdX0p1S6fvAlrA6lt3EiJGtbLLhwleo6USgcAhX994?=
 =?us-ascii?Q?dSS7TzYZjexvHKCICT8OprsaABWdkAnukoG2+a4s?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	+/TafEzGBLjNxVZAbzWi4R2k49zaQAXEl1ayVqj4qrqn19duGaxlX1YNAZv0UJPc4jcKo9D0QCu0C36/AmvghiwoyXYb/yZhvYw3dRfxB9WeaOHOZpeBPofYR8geukHBlQbDhf3jC7Uf1QBVL0qurYX/YSh4shSsJuA9zeX52tIkw+9C+E1J/bDaKci6pyQvSCzsRjFJm6YH6F0pI+Rfv2aeeIE4RUMeF2F+dlqxtXOOviczInr+cd1zjheqfnUEAjt6e3BzVhSmwrwiVKgVU0/u1ddXgQvsK5FRg2j47ubw1Wx9uSnJJGV66NH0N8G9ByhUfrDxggTVv0Fdf1bizVDy3bD1ubYpOPOqbr1h6zgLO1bv3eBrgNc1vBu3MiBZZ3OkF22EnBAE3Y4GxM7InXO5yeUO9cKl8XlVasSK70sO/tKrMztP15Vjhk9f2NJqVZvvejhl2NOhJleZJyUwmLxD1VllnOhHDpvDcyypnhr/3qM3YvlijrhzvQv4R8lYBnB94eYyO7Rw1JaXAnGa9efFpTPGCv5WM8ezyfVO3ahjNakYEQF5hmBBorqumL44yoWkbWmffXvIQ4E51TTxYGusaZzbjPl8Tyo+OV5aI14=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5e904a-d2f9-408a-d50e-08dc84c1c47b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:34.0390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4eEOFIV79auc/cKSnefcMtTuPSR+IOyFIqrFNR9J7V4pTbxDFTyGb9kdtVh3a5qS8zYIRv9RY0gpKaQM6HuVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-GUID: 4AysQTZIWmmvojLMcX7oI6OQVrPLkp4j
X-Proofpoint-ORIG-GUID: 4AysQTZIWmmvojLMcX7oI6OQVrPLkp4j

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtprobed/dof_stash.c | 5 +++++
 libdtrace/dt_pid.c   | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 62418b66..44c67462 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -589,6 +589,10 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 							    mod, fun, prb)) == NULL)
 				goto err_provider;
 
+#if 0
+This does not make any sense.  We are checking parsedfn against "." and "..",
+but parsedfn comes from make_probespec_name(), whose output is of the form
+"%s:%s:%s:%s" and therefore can never be "." or "..".
 			/*
 			 * Ban "." and ".." as name components.  Obviously names
 			 * containing dots are commonplace (shared libraries,
@@ -604,6 +608,7 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (strcmp(parsedfn, ".") == 0 ||
 			    strcmp(parsedfn, "..") == 0)
 				goto err_provider;
+#endif
 
 			op = "probe module";
 
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7c7d7e30..93a7ce76 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -833,6 +833,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 
 	assert(pvp->impl != NULL && pvp->impl->provide_probe != NULL);
 
+#if 0
 	if (strchr(pdp->prv, '.') != NULL ||
 	    strchr(pdp->mod, '.') != NULL ||
 	    strchr(pdp->fun, '.') != NULL ||
@@ -840,6 +841,7 @@ dt_pid_create_usdt_probes(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t
 		dt_dprintf("Probe component contains dots: cannot be a USDT probe.\n");
 		return 0;
 	}
+#endif
 
 	if (asprintf(&probepath, "%s/probes/%i/%s/%s/%s/%s", dtp->dt_dofstash_path,
 		     dpr->dpr_pid, pdp->prv[0] == '\0' ? "*" : pdp->prv,
-- 
2.18.4

