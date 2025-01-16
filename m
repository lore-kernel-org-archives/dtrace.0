Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23801153598
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737064474; cv=fail; b=jtGqRGIxzvIjKIrSBgNBgHEyd6r5rqfWUehNYm/6rQNhT019oKnyZ7EQ5hKT40b9p/uxy9L7cibZDnSgMDax3jfNH3IcH9ZiDzUSVPqUSuJ7Ea5DF8jnFtEXeQBlLwg/qp0Q9U5yh3xgl7L0CXMGpW1Adr77zfXHqiZXgBqGr3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737064474; c=relaxed/simple;
	bh=pGQsgveFjVK/MHN8O6nM6cdpUy1Dxgbh5b8rPBdF0Rg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OakeXnKk69q0hkiijJLvCZvs/yAvoRJPK0m9ooS6AJeu6eNYCOkomgMRftLZlHA3Pnwq27rMR006wpCiMs6Ocd3f4dVXIdh+ZHH3GdfqM4+rH9mUzdGL3sjYMdDd6eXnpoeR+hVtwNj6aKSLJqOBVxKG5Abi2M26Ce0uuAW0Tug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FjL61/jY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g2LNzGzn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FjL61/jY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g2LNzGzn"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GJDl5r027937
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=dSEsqlxz79+OlHTgm3btj4kMRnhBgq99Nmy74qW8zXM=; b=
	FjL61/jYeVOwqBKdoUIBmymwvP1G77WxxAhXzImeb79LyhfgY+CGxhAS4EXKrEHh
	T8KhQN1omGrcAAiE/bXWmfuaAe6pHqLF7/5MYEmLQ5STQHhqMzW3SA7eLZDs6WPp
	BBTjYaggfi+EPaga56e67WSOkEEvcm4imqn7NMca0dbFXU1QCNtyblf4oCpkQYdO
	VK1GoBYr/6KZ7X7Y55aj0pLoouCamyUm7pYc+fFHMmJtns5rG/1RwtSUQGiXuWmG
	sPn2f4PUZujt3AvettQAwXfJzCedsCu8YsjXHBg7orrhNalxrtv2NhVDpnaiV6SW
	OTPoA8paM+qGCwwz14G3+A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 447830g98b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GL0k4Y038715
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 443f3bcq3s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Jan 2025 21:54:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixove4zJZLq5smLxT5fuhgV109AUX6L4GyfFx/5AlUWLLDvyIDwZ7Y24nBqRh5ldgeJkqMe8o3+99t6sskEs8iwlFCPdJU4/hatgz/vsYw3Vq+e9XAlETCmcyZrJP7haBPJJC/rEXbbCpcNsaSwcBchja9qcZDuhQDVsjOEo0FH6QP8bRhn0Vl0GVlStA8/2pH+Y/2PJ01QAbjxu5Hau4E58ZIIKuEQkGUKfWHyOrmW4vRgxFYVcG0w87RVO+BvsNfi63J4oS4bp95ox8uKmNiSNmA65X5nbVjlXnme1V6uCQ4NtN1VOOdnAogS22x7ZNzYcQKCCw7cSIIazq6R62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSEsqlxz79+OlHTgm3btj4kMRnhBgq99Nmy74qW8zXM=;
 b=TPYzBUn+foT0MEduHBmaGjU+Jnd3/5MHjB8jBce57WzZNPJhlGcYP3dSMSw4hpUBFWldLPaA0XCuC7CqId9lR/unMoKExV4WTEkRaKP4NdviHCVkFAM6HiS8xJrzfwh/ouRSJGMRKVgCdmZgsx/cJ0k41VHbFbCdilERZM149awhGaeZH4s6uKkQZg5ysFBE7h7qdCS+M+G/qIPXobzwuu+VWKKbPjrkijY0CZ3RjH7RTrT45EDQaMKR2C5H533er8JX2dxZO3Hn9uQO+v39YPsSSwjOkyuDKAj3491YnaflkviLuYtbuy5ZS8nXjgfSnnNm3CGr/fKFkzpclLxJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSEsqlxz79+OlHTgm3btj4kMRnhBgq99Nmy74qW8zXM=;
 b=g2LNzGznxx0b9vj/o/t1KSLve5EkAonHiZYZpuYwugMXLKgyv/4ffTrXR8v9ED+mZBLSe+iWxj1hFAJpF33S1ZuerlXGe+kWuG+CQHBn2bfaQVB+Hxd6qPeW7U7Kkn1/BRKQqWquVVvfzrEbMHB5/5mRHbW6Kk4SbXggy9dz1hs=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by SA1PR10MB6367.namprd10.prod.outlook.com (2603:10b6:806:257::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 21:54:28 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 21:54:28 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] drti: do not compile with LTO
Date: Thu, 16 Jan 2025 21:54:18 +0000
Message-ID: <20250116215418.417155-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
In-Reply-To: <20250116215418.417155-1-nick.alcock@oracle.com>
References: <20250116215418.417155-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0610.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::12) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|SA1PR10MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: f808bddc-2f69-4d58-6e29-08dd3678597d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R4OckdZbZpuDH3Xh5LCQn1YAr+Ps9SALrgymMho53pkDBBVQJGIpb1gQ67qT?=
 =?us-ascii?Q?ntO/4AlFTCaGD12IuR83emvSe3YB2lUG1lAybT5U4GGEb7Inie1Tug2Pc6Fw?=
 =?us-ascii?Q?Y7/r/3155FITMF8eeraEkOl2tGI+VpGQVhGdc6kxvstWCjXIdsCjcyy95OJ/?=
 =?us-ascii?Q?6GtDYajrwX0r9JPdCgUSu2fUq0kB8DtEpRNzsxrg0x4EIUeGovu7LGn7OnfA?=
 =?us-ascii?Q?NfXHo0yJ1y2n7osBpWvRM8Ch4dbl4qAA6RsPUKsOYA05LlUsbll/4GkOhAWM?=
 =?us-ascii?Q?01fU9xl7cVuxFpCvBd8P2ZBKuatHr+z3droUSK+G9BsxS8dxsLIseYRxU57I?=
 =?us-ascii?Q?2Nf0sPVed3VBrJ1IjkZEdHdtVmB4rsbnCZmJ8puj2timsqv1MKZsDR880aRz?=
 =?us-ascii?Q?qYQi4+/R4Akrlx60W+A0MEZAvZGQYTXPu0vPsvegt/+8v1opM5hgmsZYmSDp?=
 =?us-ascii?Q?HNzG2cXRnBjoI59HnnilAxnTzcaQMWxkyEJ7oaXJ3C9k+rmkl5J9+z791jKt?=
 =?us-ascii?Q?rxF3Mb2IsCsZWVsRgDIrtjhnsugLZzulfGr7HJR2E0hWUnd/1tmzRoCP3U0n?=
 =?us-ascii?Q?FScTWnV7KHEaZPi/tOqoC+ElLFGYZey7H5Tqoc7AbPjsuaQHZIX2mteBlEHF?=
 =?us-ascii?Q?3KZng5XudiwDVqq73fymw83OSdfbd/XxITX9GmWF9xpJTs4PMfQxexSTvrAM?=
 =?us-ascii?Q?4z9EXhAr0TwzAbT7KoHwMnVPWbGn4p/jj2S7gyWbiWBvd2uZaWkr22RbxSft?=
 =?us-ascii?Q?79O2NE53/t/Po/c/QM+ZmUY2LYVhUeNv4pN/yQDgbNjPmzmsWD/gMGKrNdsO?=
 =?us-ascii?Q?ZgB1Mz6l5iun6EgGqGR5WfwBsG8VDO05Mu6NKRTGOpHC14Xo0SLirplDGl34?=
 =?us-ascii?Q?+E6yUVq7Ew8yFqfmwFQ9jwVc9pLZqDN62dbYS6qh13EySQu1EVA8hylOsdPE?=
 =?us-ascii?Q?7UGjINnzZK4URQj9sXrdk5JrAG0hGNjJZnX+2GnN6w6fLTFOeRytCzXXfkGO?=
 =?us-ascii?Q?+83QPYgOS/cmG2tW/jxbQPyUw1u23KF5MR7PUHjwTbVPOT2YIMqr0OJg1Csc?=
 =?us-ascii?Q?vY5k8fJO9if8UZjmHthZT7msNT0a5Xv/q13jULXD7x70yvdktWASKBoMatpw?=
 =?us-ascii?Q?S4M2K2QiMAUl1KJSe5jYUexMMMFVk8KvIE15OIIVTXp18uR4S3pd3yIkznbY?=
 =?us-ascii?Q?TMHJSm5Gbe88sIvaf1cWIGtg4Wgo/s3q/g87F0jqdB1sRKvUE8AUvhowuucR?=
 =?us-ascii?Q?P+6la0OGcwEm+8A9x/+H5ZcAz5ZtGUZ+ec9JC6u4GxDUJ5a9toYq+IqkZ6Ys?=
 =?us-ascii?Q?kO3PKM6hwkSw7dXEh5vpK4Ln65m6zbGp5B+U7Uf8TzLUf4Oe8OQqtEVrdnSn?=
 =?us-ascii?Q?mW/5mLgeRGvQGV92V5K4uEuRUG+T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zo69UswwB2HqBLVeh9Pee2QKf11NTL60y+6r7p7xI8JNbiXdfMA2bsHkllOs?=
 =?us-ascii?Q?gy3zOwlthrfNhYscEt1KQqxGHfWcSKtfkpdvJ4fOaqivKl5FPQPqIBe8EOf5?=
 =?us-ascii?Q?D0XP8F4hQj2cgIijIjYtamus2TCZTN81QCz3OWqo1N4IoSgs7xPOEicCHeJw?=
 =?us-ascii?Q?AzLEDMjvRNSef/cdXTfuHMY4Tyh9CfQIxvjarU/IUOfFwAEz48R52qa6XsDn?=
 =?us-ascii?Q?WV9YkAV2W1ZLgXFCPwqCc77t9wWwDOlutsMhaVLqGPWD+ZB87Af/XygeXDB4?=
 =?us-ascii?Q?gI8S7v5BlWAnIGsCepcxa2ugUdzdPtCmMAK3tEa+XKOsqV/z8yexJiorF2Xv?=
 =?us-ascii?Q?4QzHHrJ2Rca0NoDXPbvoCqx89GOpyDx7b4h2AHsEdfJUf4IvS22/yGFDeRue?=
 =?us-ascii?Q?o3fXVYXIi7sMzOEN723g6B8Kt6sGjYwps5cutztRBfkQGvc2pozlB4HPDWrZ?=
 =?us-ascii?Q?k55mktjcI81brN3/jc8K5A3Ye775QjGaZ8tgR+O8IIIrKO9Ki40gUlaOU4Nh?=
 =?us-ascii?Q?g+cXPi7Ko7NF8VBKEOgDR3Ro+mHEC5JguXrLSStRTLH35QQW57FpOQ5HH8u8?=
 =?us-ascii?Q?FdFQ8YVihL2JkmH4KfeXT7OAsLzkV/6S61kmqyBpSXiGdhfOBTAtseB0qmxP?=
 =?us-ascii?Q?N9BIjeWw+lg+mNpLk7RqHyPTCGkK7ctmX2Pk98HIzmbRYn/HGkjxnoK3Wdtk?=
 =?us-ascii?Q?BYy9DGpKS2nhzHTZF7OPzKRVScd1TMHvMIAom6LVMWidNll82Qknjiqp2Xhc?=
 =?us-ascii?Q?nVN49fTWi6NEGeQ4PVBLv72sxMJCca6Jsvm0TLHhqD0dEN4JHULGYrEjMmVg?=
 =?us-ascii?Q?VVLABIPEub4+Ddt7/DPuXWmeDo5xBoy0s1UUQ66L0TC6kOShTCyeEL3xjhj8?=
 =?us-ascii?Q?gNgbE47vvFL9GAuiJZe2ZHwEyF/b/TTwknGKZnPk+n09U91DC2YK+AicpouY?=
 =?us-ascii?Q?xmpIK51Qv+VRDa/IHdYgWmLxFSzMzOqtjaaorUOAQgv4ExfD/ZdY+Lgu7dhz?=
 =?us-ascii?Q?986rZDs9udA5bPeXTeWGvBo1aMvHq5rmXYMsjp+BD58vesK1t6NTzMrfk287?=
 =?us-ascii?Q?+DSV6tj73IokZEIQeIq37G+6R6qiRvc5xihWpqWaKN/2WkF32czZ4B2LokvV?=
 =?us-ascii?Q?k6WmAMJwkNfffT91EhgA8ItK9QaP9H60qIKnABFMg6BY2T+z0DsmluzB+iMg?=
 =?us-ascii?Q?B3H8mK51sKLYh8ZYNAlSael2SJZd+nw0m3LhzRj45oGK342r5jCxZZtWA29p?=
 =?us-ascii?Q?muzmfng9ViHRZ0GIEdnqnzssgqJBDq2LAzVlJzTgjMBocUU4a30HDezGwLfW?=
 =?us-ascii?Q?MxV8lfPjiY0Z1YQlDc9LQjbz/BOWxDcGpfxIDXHZv0ove1X2gQd2zrrPTIHY?=
 =?us-ascii?Q?+hC1+2cDXKexIOq3NXEkIdkUwPZEqj2G9W/52wT2Ng84ceVDglOwcNClKO4/?=
 =?us-ascii?Q?KTC3PUV4lz5RQt6JgrfNe1L4KEB+D4bcUVmy7tk6LNgPFgL9ZhixiI9rF5ps?=
 =?us-ascii?Q?VEhMWAmmsD5b5FI9bt7ALJbZfNMdOb9sKCnRod81oFLq5hMrL41a4inYMpYW?=
 =?us-ascii?Q?yuqDHC+DkGFEaqBopc9sNI7Y93vJEuHXmR8LWN9/KGa1Fmd8EAvrnE7suRB6?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2DaJzOI3kNWWEWJnVyKwy2YlhXT7uM0mMlOswsUgRay6JphmluFSHO2ff5qCs7z7so9BUbGDq0g5D7OJuXOXT8ZzSxtl2c9OLK23o1fgrasRvT6BCn0Kk7p/POK4ZpVyr8W9uIvJkGeZIwKmciMtZ+oA7cIviFXsY/8F+r3vFqmxsbnRXlpoGVdUKxohTG8ckhl4+U9lFEDbvNkCvq6xLbd9J7rC7QvfDDEWK14lKzxJbmllXEzHZPrR8HKoudVR9OAN9AFkGIPELMadOt7YeAkLJFxqtuQQGZccS9elbSDgICxMaZJHB0Cld5lbWlBe7BGy2rBnWt1dpMkgTa2XpLvmCZe3rgW7g+yDeCCcwmPEZPD8Ufc5ogS7lwPCgHihLRMp9J2+qtbN4ycjtFVDjoP52fk1pmX8Pz2vmc1ClKRySrr3pDhOJbl6FOPhHWL7gsSIHzza4ZasyQ9l1/5nLurVWQPIQXhnavugEd+0hYZx21cz6wfxwUYM/9vrbdq8bUS38Och4Y1uszKc5ulzKpSVwowVcd+Y+gyXYJihHdNcEdRb4wsVaSs8MDCfwW7Z8CELttW6t0hYgQSdwCOwndinjblUqOI1gZrb1WPVyuI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f808bddc-2f69-4d58-6e29-08dd3678597d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 21:54:28.2659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISNOnYOC8lThREGNF9oAtnWsQ0ks2hqks2eeZN67J4GYYkh+Ec6WVJolbEbnoOvorpuKHG/60rLALd/Uomw6lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6367
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_09,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501160162
X-Proofpoint-GUID: LR6nKIdr-62UhlzZIYBSTGtJcQ-lzB5N
X-Proofpoint-ORIG-GUID: LR6nKIdr-62UhlzZIYBSTGtJcQ-lzB5N

drti.o is shipped as object code and can be reused by many compiler
versions: we must not put LTO IR into it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/Build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/libdtrace/Build b/libdtrace/Build
index 722351591aaea..307d7e8bf6434 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -122,6 +122,10 @@ dt_prov_uprobe.c_CFLAGS := -Wno-pedantic
 dt_debug.c_CFLAGS := -Wno-prio-ctor-dtor
 drti.c_CFLAGS := -Wno-prio-ctor-dtor
 
+# drti is shipped as an object file, so do not ever generate
+# LTO for it, since that is compiler-version-specific.
+drti.c_CFLAGS += -fno-lto
+
 SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e 's/\([0-9]*\)\.\([0-9]*\)\.\([0-9]*\).*$$/\1.\2.\3/'))
 
 -include libdtrace/$(ARCHINC)/Build
-- 
2.47.1.279.g84c5f4e78e

