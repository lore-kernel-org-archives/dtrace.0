Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F592AD18
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 04:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730350159; cv=fail; b=X8A8MXyOASvliBZTBx9sx4WO4awaPL3jr3ff1RzvyGOEq+tbaQFpflcDl6L89su8xPBvz7WUZengeHiGg740rEIT57ARwCAuued2IOTg867i6q57F9/NtzNRjTQBoS7HBRwomyzdBMnL9GDRn8mPyP8rDKp8hxNsucErO5feBKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730350159; c=relaxed/simple;
	bh=u4OWglakXbpB2+LLD3HXU0cgznIjZKt8Ll1GOt2G3BE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dCRPGUCXreoRLgw90QN+3xDdWZi4mtjKMfcaLOpbJLYMEj3VzZh35YqXod/NeSTe+Hg/17bxGGP13wCEEXkjmRL8Ksj5x/ybbmA9Hq/rVLXvjyQvSXcGFeVjpmK+1Y/3hRyFi0B1Goh2pWOUNbKWKadAJe6/K8ZWT+h56HAsy3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=a46bxtTY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IvsmlnnY; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a46bxtTY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IvsmlnnY"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UJBaFE013019
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 04:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=hzmYAfOs6Cv5hxEk0jHrza9hUCfw9ZCE7roH+qDVJEo=; b=
	a46bxtTYbq06Km9rcXT8U/xLeWqz3lVuAxKB41g8NSOY8WoNpz1JLaGO+d4xR0uX
	nwduP6MhBrQooDX2NUsqYs+glQdAOnvGVs75AIrNU81pPS0gh9TQ+wDUq3P4Oa20
	UBOZQu+7b5NA5JDcnJbKG4HozhEIFQgQHsKFV/mrsFLO19E86cbn07HmqaaC2npy
	4RI/ubsyq3lrFxPTn7gthwN/NbGXFtEioY8KZHnZGU05LCP0glyrk0y/hghf7J96
	w+1NalpzlBHA7a8NbuNnta9TuxqlrA9oz27AyA/1NICm6GxwBJlGFzR+SJgj9aPJ
	U38KeVcPJqlZ8V2Zi48tPw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdp9hkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 04:49:14 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49V2FZBu010127
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 04:49:14 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42hn9061f9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 31 Oct 2024 04:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N28x5JWoV1Zv59LqaNwyQRiv+Z68WPY4HPlJGI6/RnAe54vB9gSSOkvQJD+ZfI14eyry0taXHov7EcYDpEZkh2/XHtz8fpp1fhgcqj2nPmrAfpziUNHsFh+WB+jsiRVOK61MxQII+JjB1KQT28VJQRmFi2GcsZ9LUkhnubDYhtdXmQ9N++pZCv1wxN51tGqp8Al1qQrULNdh32kJuaN3OZZk7FvfRmBniMY3gtC8KYruKvsUzDqJehH5LwFiYJuyK7Fd0ZkTcZ/yFbu8U31Qi+NSZM384HD44HJHe6Thxffrg9X6zdExe8jeNDERW+prIGKBvBFq5q1yHNUtkvHtmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzmYAfOs6Cv5hxEk0jHrza9hUCfw9ZCE7roH+qDVJEo=;
 b=VCFSTe4TbCC3jYq1MNHPj/mfsUcfBoULL4LFjL5QXrHZcY8KRTKc1Nu+cTs3NGsWwt+evzNcVSZqiSRMumFyd8ISd0KxJYQLioPS7kmVAy44a18VByxC47YXVvZSdzPvzl7IKlFb/EBV3sA0P9dgXOyMbiibYPka0MyOHKlG4Q5z+aUFSt/fltHt1hYSYijl+/5RLmqp+GiAKRTjg1DTewBfHj5tseAXQ9INPvF7M7o/HabXZAJCOJVfWf/1hlhTK+5lpXFzgkUYJi5ZzdaEiLyjdXKLaXL5nNYHJGOKM8M2TIOEspK8MfYWYPSl65jXtf21CZ84eoa187iX4ivXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzmYAfOs6Cv5hxEk0jHrza9hUCfw9ZCE7roH+qDVJEo=;
 b=IvsmlnnYT6GB7N0oUjlnBsNmiE+8WYQC7d5Id0GOQ/bkBdF+vPuCstikWemWOlmw+hpWVbSAtCDm44smCaarPihfm+4wou/ctaFFA73GX9+clqACFoZXBpDGUcQSZiSp1a63jd7LaY3O3CFSh13L3a2s9pf1Q5snNzFG74OE0GQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DM4PR10MB6134.namprd10.prod.outlook.com (2603:10b6:8:b5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 04:49:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 04:49:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: Disown child pid for cleaner stderr
Date: Thu, 31 Oct 2024 00:49:06 -0400
Message-Id: <20241031044906.15804-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0306.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::23) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DM4PR10MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f9ed01b-cbbd-41ab-727b-08dcf9675c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aVAYzPyvORoYhylTauHlLchdR65A9m/llF++BatT9mNBbxLUJ75pjRD+Yl9c?=
 =?us-ascii?Q?DGcuVgxM78guuXdHbyChUlaRzz0XQdq/3Um4MFDrUKl11P9BbDJUOaYIKun1?=
 =?us-ascii?Q?frpzDC3pnKrfhgc3HDUYwuswxvbC2CnvSwCycjqxcbVHlXxIO2UAf+CnAcL8?=
 =?us-ascii?Q?ZmkoqE5lze/O3zhUTjAh8wwdSB1BYS+TJGgGNokM5gzW300CgA4clF48FOm9?=
 =?us-ascii?Q?Wg9tak5vVNpG7cbQkb76kAHUxhvO5lUEXKEITm/QSqOqBqDUrtM06ZbimpM+?=
 =?us-ascii?Q?deosgvZ+D1I+pVh4tszP+qI8PGziAbf77S7KikKDoBx61RhIuHoQgyFb0Zo5?=
 =?us-ascii?Q?hVkQZa3UvTGXrz62h0goJUwjH8CF1rIgTKi3bBSRVkthlINnibcXvqH0e6Yg?=
 =?us-ascii?Q?UVR68d/Qiq5vxt9KvCFC//NKyp9vm/sIPwEq259RVU8WxN29WA/fZ2UHMYyc?=
 =?us-ascii?Q?uymqtIr2hRHYxHCiXTs+bQJ/KlvUXSkehoisuWqtY9I0AIBp4dV1XwaE1Pi2?=
 =?us-ascii?Q?bHJHSPBt+6XJkDEqK2Evpgmu8F7XDeuZljpBdLjJ/ZnNP+IP8W7NBqX6GqtI?=
 =?us-ascii?Q?80TUuM+ub7xm3uJJmdRhDjhMOwdgskp8C8qSSsCqwkbGdvmqxr2AVmLFIIm4?=
 =?us-ascii?Q?BVdnTEvI4Xw9e7DzZ6dTMlmHp98y2kyVBdD9n3g8H/eejgUVbyaAfQGwvfKn?=
 =?us-ascii?Q?GBobPQ7vDv0o8cyQ7wHu5DRSG3UdzWnUQ+H00CJ59+Fn3rvECNKiORXT5/Wf?=
 =?us-ascii?Q?TAg0XC6Weaw45vmiHaAQIPvdmR5+5uZM3h2UAtko42dIOvD9oHP8ANXb4gNI?=
 =?us-ascii?Q?+YssVjs1mP8sHqF4n/3tN7uEQP3uqpASBQEO+z/YwbmcEsGrSuSLG7AR6he9?=
 =?us-ascii?Q?h37FsTvBl3FDRkEqP5stWxYIpJfF/BU/i6VglxKFnjOLdT9Zzbkoms98zyli?=
 =?us-ascii?Q?2F3Uox1dQ/uDes96rRJTLClSIPe+lKxaH4DkfNGQ5QpiKNSVGJP+QPhzsONU?=
 =?us-ascii?Q?5hvlIH7jgw1faH4TUrroWcHMHI/rlRvQHB6glyDmwsu6GcD/8VJdK8tmWBM/?=
 =?us-ascii?Q?DavDywLz/4GT6dG486XZDLJidwjuNbFY688vYIuFjLHghrc5BVyBz0TqKQvY?=
 =?us-ascii?Q?Mu7YVG13/X+rtVzvFx/o+/IfEiEoJsjOIKDEsbbPiWNxHlrIAFKLx9cH+jtf?=
 =?us-ascii?Q?an8eEdmooAYzaUCfG3b5lSam5ibllCfCDrVQyvQD6cEptgbvtVKeioPg7QB5?=
 =?us-ascii?Q?A4SnmDSTB2wmEHHusqi+FOYvD7Ldw2hU9fsuY3VegcQGwHM0EryOivAMZxZ0?=
 =?us-ascii?Q?02rXgD/FfAumGIyvidbZ70zk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y9cEMVrQOROdYHbRZajhBC/F48rWNwCKgtAcmNtIlxI6hJyQ3qbNU+71ebJz?=
 =?us-ascii?Q?haSieOPnSdeqHWPRogeUMtzzLVW4oXNwQIYG/JFPF3u56jn6esMdBfjwh8jH?=
 =?us-ascii?Q?nkj60RXdCRkwGvDdoZ6gVmZl/hD5bpvOFaLSFmwiGhUPRIL6QxKS52yXCMHt?=
 =?us-ascii?Q?umvKzoCtGemstx5xxliUJcWTVNjPVR0T5oQz+wm82gJBvGiwcCPcfYKOcI7d?=
 =?us-ascii?Q?BlIYOaa1jmAzhxwmktPkeg7Ubywug25YbTxZjxp89YY6mG7G7Fde8gSU+1Sr?=
 =?us-ascii?Q?Oi1ihGEcrwOrpgk5Caou4PhragzWhGnkJztB1T4cnRm7btQSA34j8v23H7GQ?=
 =?us-ascii?Q?A6w+7XLXLS5DiJTeIX2kDylle0q21ktf5ndV1GG2yE/KcOr7emFx3YpGG34y?=
 =?us-ascii?Q?TDl2TF3jI2TcjwmoYX42+B/a75Mb5rAshPx8sJPzKdhSVHiJcVy6jjUfc5l7?=
 =?us-ascii?Q?yDK72TMJkup48yMX7eSj8cTbYptbqEwvOYd1XT7oGsJDGCunTjMNzwlwVK2L?=
 =?us-ascii?Q?n+fOu2GHWqaUAW/2vsx1vr1kinCeWSmOH9EyXw+udggE9SEJzhhJjBuoiG6Y?=
 =?us-ascii?Q?/LkNBmQznPnLwoxYnjlTGIvPeYWKnFQOVoYY/wQ3uNIPoGDCFGBQFBszIGnO?=
 =?us-ascii?Q?FN/fkU/WtjkMEF6g/1A7utB3ggXx92y37j0JsB7D+TeEnu/pU4cQPKhTKbrO?=
 =?us-ascii?Q?XxyFxn2SfYqz0q4cReo5WPJ237SRH7zGNPH6ySbos6VetVS13yNpKzlI1t3c?=
 =?us-ascii?Q?9kpt0faZQuk+uV/p3lr3Xk3ne3AyOvwMtACJuiQf/aOFLBLvk7UNTfAd+wiR?=
 =?us-ascii?Q?Kp7MxCDTaC/ur+zSJPPB18ZQ/9NizT4IUHmkOP5MjEdtzOQw20Wv5hHxuwUS?=
 =?us-ascii?Q?epB9SZkjGQc52DzhJ6nLlgLz9kzOM90XXRqokKhDfBecPHL6DD7VF17bdIWX?=
 =?us-ascii?Q?+2UL9lkVTbbGPfBUmq1UvlsbgH7h6MSJBCuNp9MWYKqjIQXTFl7oafx8AIfW?=
 =?us-ascii?Q?D9ExCd/QJMGhtZ5/8iieyKBIILglHvwM3ul1nGqPsqzP6h3+YD8c5VGjYptc?=
 =?us-ascii?Q?rZECKBlmy1TNRYwSTSHZ5HU8+7cEIpEV/SVeeTgyeONbZQ3EgtTL0PBOzxt2?=
 =?us-ascii?Q?PFFD/wL5gWvu8ad1q1h/9sPguhzGgslRZdrKTamdPwBDlv7TgCGNi6QNw6Wc?=
 =?us-ascii?Q?R7E1VKJrNmuQL5qBxlY2ZEYuGhss326ORvchwG51iwVAoOZYVdg6A6rE3Syb?=
 =?us-ascii?Q?RZrLQ0ObWw3c1KOAiR68C4rjKiPZsnumDm99vu1TxwRTgJY8446nUKlT+Lba?=
 =?us-ascii?Q?INYmwXvsOSPe6dMlQ8dnw1+KievwgVrRsliFIfOOmwMMqmjiI6US7aTRCzOE?=
 =?us-ascii?Q?dBKg1KJY7JFwoTqJ3Olpakz54YJ4QfSsTjMkTFKNQDmWSCnDJfDeuQDTQGlQ?=
 =?us-ascii?Q?oNIjUvHFna664IwSri/MA98CFO244QwpoYTrq5qXK/65D7iaZ8cYBYSchZvy?=
 =?us-ascii?Q?reGE0r75zTN0/QKcAy9RGludWcQ0/O0eMPlDjen9HdmZsASrk0BA6Kdonu+e?=
 =?us-ascii?Q?ylV0ahBHUX5ta1bL5bLnPkfXiPtzo2IAptIjSAKq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TefLVmTONf88lR/lg0sFwDvzYXW2nrWuxtJI5dw38Ob6iUjBTCBEPiDJhGEhFYci4Jny0faCDFGZn56YvR0tHASq+gI31+HscR4u2OhBtJ2ySM56Mf6XE/hNgMONhf1z8ok8zE9ujpUFK2kCmjMLQ/0TycYDl4FoJ2MMP0BHz4Z9uTK3QZAl939HbNTd7NS2UpewsOwUJ3TvGE81swLYTc4qJyqIXY5TKcpiFjIaXc/Qar3XtWDWOp2cFZOTv9li5McvBkNOX+/PFCC5uJRu2cB3Z9R/uS/MW2ZlwupqBZoYvIgMdnVunYv4bnLAJunJBPgE+apSnXFAQvBPD0ImsSyF7WgUOxQB2fejZy9SbFjY7ibfmCcjWaQDGtQFyHn6ADXK6tKUmiYwCvgrXoVBQnd8CALITDYlvbV9SMsk1bowsM7jEq9mHFYa6d0wM7fwFT71HaR7Fvr+Fj1qJwIb/PRm+9qC6b5fjsNEnhxF5s4DJAAn7PXzaflozjXXlwOTMiYFqHix+w9UR3yaA12yE9T0ox6+G5SPb+ZTmUiFyLNPu0FAjydabvpvi6JY3+46El7mu2zb5+w5ZkKfGYPnQGCozT1Y+5ZN7fI0gFgjehc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f9ed01b-cbbd-41ab-727b-08dcf9675c60
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 04:49:10.8983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5pkHFm/qNWqYBQUq3PKE5LcBLjvAhIlE/52MbDLuGZ4PfNGPgEyyB+jYaMkDBKn/1zkz4hQSjDrjibnRIHFFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6134
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_14,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310033
X-Proofpoint-ORIG-GUID: Xiq94UXEWTxh6cJI2biiME6itrsekZ51
X-Proofpoint-GUID: Xiq94UXEWTxh6cJI2biiME6itrsekZ51

From: Eugene Loh <eugene.loh@oracle.com>

The shell can report when a job is killed, potentially
polluting stderr and thereby mismatching the results file.

When a job is killed at the end of test, appearance of such
reports may depend on timing details:  does the parent test
or the child job terminate first?

Many tests deal with this problem by disowning child jobs.

Disown jobs in a few more possibly problematic tests.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.dlclose1.sh             | 1 +
 test/unittest/usdt/tst.enable_pid.sh           | 2 ++
 test/unittest/usdt/tst.exec-dof-replacement.sh | 1 +
 test/unittest/usdt/tst.nusdtprobes.sh          | 1 +
 4 files changed, 5 insertions(+)

diff --git a/test/unittest/usdt/tst.dlclose1.sh b/test/unittest/usdt/tst.dlclose1.sh
index ee4d95f3b..b65e4de5d 100755
--- a/test/unittest/usdt/tst.dlclose1.sh
+++ b/test/unittest/usdt/tst.dlclose1.sh
@@ -200,6 +200,7 @@ function mywait() {
 
 ./main > myfile.txt &
 pid=$!
+disown %+
 echo started pid $pid
 
 mywait 6 "started"  myfile.txt # wait for process to start
diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
index 91923014d..bbb7680c4 100755
--- a/test/unittest/usdt/tst.enable_pid.sh
+++ b/test/unittest/usdt/tst.enable_pid.sh
@@ -142,8 +142,10 @@ fi
 
 ./main >& out.1 &
 pid1=$!
+disown %+
 ./main >& out.2 &
 pid2=$!
+disown %+
 
 #
 # Run DTrace with different pid probes, each case is its own "epoch":
diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
index 9f30bbfcc..f9cf6bdb2 100755
--- a/test/unittest/usdt/tst.exec-dof-replacement.sh
+++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
@@ -81,6 +81,7 @@ fi
 
 ./test1 &
 PROC=$!
+disown %+
 
 # Wait for the exec, then list all the target's probes.
 # We cannot use pure dtrace to do this because it doesn't check
diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
index 50f18a6ca..4b5050ff9 100755
--- a/test/unittest/usdt/tst.nusdtprobes.sh
+++ b/test/unittest/usdt/tst.nusdtprobes.sh
@@ -121,6 +121,7 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
 		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
 			./main &
 			pids[$immbr]=$!
+			disown %+
 			for j in `seq 0 9`; do
 				echo testprov${pids[$immbr]} main main foo$j >> check.txt
 			done
-- 
2.43.5

