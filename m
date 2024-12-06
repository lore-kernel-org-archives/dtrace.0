Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667D51FFC69
	for <dtrace@lists.linux.dev>; Fri,  6 Dec 2024 20:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733518294; cv=fail; b=nI5f9M/6YPIEij9shDr5yPiWdqCzeTk8Rfcm22gqAAN8sr6EIghEiftiI0TMwXMi8ghBFDTJLvwxuthg+sEuyRnkbZW3bRPLTdO+B5y6VIRf/0QvldGbzRWftqAZ0FBP77R0HogRjNfzfZqHiYHdAzd2Ek9pe3gbASABnIQSQkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733518294; c=relaxed/simple;
	bh=f2jLKbTy+fAWepdF5bNdCrjfKrkDMSCNUQzVL5Kcl6w=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=nOZhZgobwy4F4SSAkNTiBdvnEt2Xx+Ys6DBOEqGLNCiwf98AZJJy5yVCoFIG2+BW0YGUoEfBNiK65fH8jz3DCGs+RunOsskCWDnoFjLvpfzTOlTMrVRf1+B3HWd6xauk5WXDAXSdSdBHA1wRo4QNzWX4lLXXlGZ/X3nLs6FipUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JU7/7gPz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wedwANo1; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JU7/7gPz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wedwANo1"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6JNMQ5007236
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 20:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=6TOULdd4/UMOSeEUOIjAmEsxjK5TIphJrhuGdOsb2o8=; b=
	JU7/7gPzwsoSpTPgbqVz960062/NK0V5aGxZAkeaELXrl9UUSkNLkfZv12m5XXZ0
	FlPGdj2bKNeIUaJsKr8GeWMVkdc/6jXw1YfbzDw6GCaGqi8n1QO+4GZsy8nKEN/u
	6Z3NWtUCk3A4Y2FNgQc5za1d4wi9kp8ESAeCqVJHLXNN6LyKBXQ77+hQzcspwl8/
	is1odYA3+DajkRAduJ9Lz/mBFKpbm71Tx4aSo8qtOpXBNmej+/xHRUlbJMhTgGaJ
	f6RiVtSA/vyx9SRAKdvoQpd42EqMvKEXeesNg2p9b/KlPHpLhfk6IG+8tw2uKmKk
	+YPFlGyFr+bUEYaJe9PM1A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437sg2e80b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 20:51:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6KMUGW040067
	for <dtrace@lists.linux.dev>; Fri, 6 Dec 2024 20:51:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836ynt3v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 06 Dec 2024 20:51:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQMlGOWhG8GaXSGtLugCDY8V2xclcjnMh1kUX1y+jDXlUmKCVvpYx/EbjpIty+SuUWiYPAZYkfzxzQANevBNeOaECme9q5ez31zKDMVaswuSlMmtjEKjHWnJ8MkgAoT7q3Sc8OCd2RvTGb9ZBeKOPthctqis6JT57bL2NOYq4x/1jEXS2A0uCulJtOE4lHkY/2LyLzjzUkyZ4mTe+BEm33lkv3xjLIDr1nUKQZI3Yihr+FUGQQTkMpV34wI/Ls5JBelDqk+OYjyewQZPPVOdFV92tgxj3JXKHYqfl4C2WNTSfhUX83hRfzpMS57Vs0eFOp4AenuN7bEWR4LkS9F2aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TOULdd4/UMOSeEUOIjAmEsxjK5TIphJrhuGdOsb2o8=;
 b=vVx4B3+53vqMNONlMurjkvbGMtS+3cX/QDQclXA1P+JcLy3/MatZ0JwmYc1mWNHLbqMdwFxeUub3BJYKCNsykp47W8Fu6n7J+0nMktD1RadGDGRJRThAnTm9xLDOTtPWLK7BVm+w5mWAUqzE77Rotppvi2uJVvzCn2L8AOLKJn6WB2y7WdV33mLJG7ntYkLfEHz8XVgfNNRkKhL7U87oEizL0JSwlwg7m8YXNoGDyJ7tSVYbBuRHkS0fZXAgxitmRhgx1lEbsDsEKq0xxotCHi5FWvabhGCD7h67liL/XqHTdQ7MZ716MXDcXw21Ar3ifP6jdXQ+bKv6d+sQSOSlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TOULdd4/UMOSeEUOIjAmEsxjK5TIphJrhuGdOsb2o8=;
 b=wedwANo1F3bTELlTKzoxJQhDlB2ZAhU8e41BQMC6XiY92t376AtbM0AZEt6moyWxksJGKE0sLNxpASjwC/xdV2Ehn3J+bQMWfxXUZjjWnmjoAoD5yzdeVQPwb/O0rDWmpHgSq65dUnOpccbMYMh5tAcwa+J/ULS1RzthQkLDCoI=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by IA0PR10MB6722.namprd10.prod.outlook.com (2603:10b6:208:440::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 20:51:26 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 20:51:26 +0000
Date: Fri, 06 Dec 2024 15:51:24 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] tests: $dt_flags should not be used in .x files
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0449.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::34) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Message-ID:
 <SJ0PR10MB6350AA58DF71BC3D2E4191FDC2312@SJ0PR10MB6350.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|IA0PR10MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7a0afa-18d5-4731-c110-08dd1637c056
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MqkA7m/heh8WFa2xUZ5gwUlzmKwQ2N2KTZ9fRu6VCTb+p9SYs6a6kkjy4eIu?=
 =?us-ascii?Q?13Xj3UDpefSYSRn7PHMgV/9TOcDVxOxp33Q3rnVfJe32EF1zKYVhpBzOSPvi?=
 =?us-ascii?Q?m2Tz6dcUDqixcf58P0SI7HhdJlh+UOMT3ENMeL/sJBTz7H4UKDc4f28kT2ZU?=
 =?us-ascii?Q?xZM30Xxh5aYpaYLUPbcAjT+GfnCKU7xem+ND61+6wTdg6c65gNecw1xZsBzN?=
 =?us-ascii?Q?g1CnMY7gqu1lmEDtkfHK7M73RoP7fHlK+3wV+vnOUNLqO+EQnA7xYBIcTuM9?=
 =?us-ascii?Q?CxS4XSK4TpS6DpMFIt3ThQzXDpER4c7WbWiurNtMXG9d6Lp4cmN5SZ3Vxw1l?=
 =?us-ascii?Q?dFrL3c558uHk9lzKAszphiKdX2knsKmDL04KUc3PaK7F6dV+rq4PrpEK45qN?=
 =?us-ascii?Q?CSp77zHXRvm7TjnZs/A5gxZX1AqvmGhpoOf9ckPT6aH3H3e8iQgQAW9THAN6?=
 =?us-ascii?Q?vp9LlvGeDQKcw6AIb9fXuK4/IOnX7uYRQLlb+JIZ/KIk+Yw0GPcdxiD+bqYe?=
 =?us-ascii?Q?CKLS9IRwgDYnAdkKxqFwlbcTw+mCqy/Xh/tY25LtnZRVI+lq2ORIJRhq1KJv?=
 =?us-ascii?Q?D1zUd5PLCdxE35Lq/JsTvzLxe/hdD5JFtvHsoCMAB3xskZDG3N/E33IybPDO?=
 =?us-ascii?Q?vJSKO/66g5IKGOj8v/o8BWNPvZ6JvrqVXTUeQcXYuF9rXHc5qzYu6Hsd2HIl?=
 =?us-ascii?Q?8axaw4PW7Q5FPDUvl3LNYjfH3l0Uo7NfTThZhZhSKyQnSeJRWWnFAzAtSmx9?=
 =?us-ascii?Q?Nk/1dx79n9/0Cz/+eTrynXJHaUtzTMgX0ftTc1qsQtudjagCHmDAWyJ9gNdM?=
 =?us-ascii?Q?WVaKbKyYCpIy16BsYwKU2mvZHImbn2doeUXxGq5pruI2jaSk/NLW2eDj4oLu?=
 =?us-ascii?Q?RQBEiVJ/YM1BDymZIrTIgDtG3EtbSxldLmMy52yEHIkhyePIwxO91QK3picM?=
 =?us-ascii?Q?hLi5FV96CBQ4no9v2SZUK9HmfBC48pMTg4TvqDFwCN0S63Bvg5v7L0aWuP1Q?=
 =?us-ascii?Q?wEgeUTF//i7MNJerwoaxIGfk43gQmqDnM2albBciUQPZf1yBj5jilndyM1Mh?=
 =?us-ascii?Q?t1EKPPqa0pNYZpwt6dQEkd3M2TaYclVby1EwuCtI3ip2SyGTs3tfgEUDoCPm?=
 =?us-ascii?Q?uNjy17QRzOR/CZ0Tohy4n70RHNauvYje8X/drRElH5JIq3F9Ifi7cFfLnQqC?=
 =?us-ascii?Q?8JB2YCXfXX1sLQM8FWafU0OTpbp+NI105580Woyu1Et1/ZUI+lcnoI8ak2wc?=
 =?us-ascii?Q?twQSA0tfqsd1BVpFQti+KC8Rfq8UNVywzJoyAzNKbsbZXc5rKlgJncRKxFot?=
 =?us-ascii?Q?Jc2hEzA5ibFcS/hqrWxYb3kUKVp2Rbdrc3T/ZLwlOMohhQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kcIMIlldnIY1Ait6tvo3I/IlRf+geik2s6ROmn/HmiTKqkG+SrsCJcf88c1k?=
 =?us-ascii?Q?FIMM+oLap482IMaFv+yeJvURJhxuX2YnT0+dPKtKxI14Vc1bysfF9jYmv7hR?=
 =?us-ascii?Q?NUM7haJ2yTJlen3/IRkekH3B+ZqWQrjQS2H9uw5KbqNmk+4UMX2Gcz6IM5hG?=
 =?us-ascii?Q?PWhphxMjATLO/mY9ufFQYE0mVIepd/0T04fvZ96eUunj84U0HIVkOaBAZzV/?=
 =?us-ascii?Q?YgE7XcWk546kxPUI2DgtC9Gwg9WBqOQfgBpu+l/EOV06F/9UJdeIs8B8u0ih?=
 =?us-ascii?Q?2iD/g5GEV73Q2kpTJn8Yytn5IE/8yesXqjcUlPBQcY4cLt3f2YX5dUQqiKp7?=
 =?us-ascii?Q?CKUZaLKdmF4FXKuddpnABUMG+StuqtLhKCtO+AQkm550fu+NLH0z//VibEly?=
 =?us-ascii?Q?me9xIZZF8xVzKDjmzDh1UZjMMqkD1XBwN4rDx09Zf9+Ng+7JueFxvEn1CjCi?=
 =?us-ascii?Q?xriIPt3eV+b7ft6tjbYEaNSnlZ0b89mrUr/fURfBav55d3zr0gOhnFjTlHxK?=
 =?us-ascii?Q?LGvvVkdyY0VS62wuApDRM+ZRXON5p4uATmTIUIGOAdp1+35TTAxMoKcZIndC?=
 =?us-ascii?Q?seIXd23AyiaEgv/PBvsUsCujT6akS1luzceb3s+lZEX8ecOUXJHkLhILdBew?=
 =?us-ascii?Q?1ymBIsbhO9ken2+tCVjwC+FGXsYXm9c7wmGphlVH/q2fMaLyOcJnWoMgXTOT?=
 =?us-ascii?Q?iDpWrM82JzKaU3/+gUBEigAZzkqhJ4HTyq8k6nMiUuhuZ6S+GLdnF59Oemrw?=
 =?us-ascii?Q?YGLIdnVipKUMoSMGHvSdYI+F+f/rNm3qKSdSIXY0YAG7Mv1fa0kNFmJhQlh+?=
 =?us-ascii?Q?p3i2UgszFT64yIyFrXDoTtoGri/KabnpdIXBkFhZEEpYioQD84L3tNlltkzt?=
 =?us-ascii?Q?giLf+4n5XCi1+GhA0ILX8XWp2sWgdtg/NhnllvTzRVePKsLis+7nB6bZDV7h?=
 =?us-ascii?Q?alEc5RTRlvsk7/lVQN+Ebfrdh0QH7eymehHppuHmCu6yZkA3sGRavkp0S+nE?=
 =?us-ascii?Q?Eyc3GO82kKAJ6MpuOYT1gcBAiynWdBeWZt51uH7dBqdDnPJdHIBfrS2cdS6V?=
 =?us-ascii?Q?JxBGIPTBsV0kEr4P5bJXMkZ3TX54YbqnCh2Mg9XJSg7GU1EvIn8vEcQQXJXt?=
 =?us-ascii?Q?oaKZScDwM80z1uGneAoIGDQk8lUSRTr3g/I/jBt4dp1Y7CnieBpR264bMr9h?=
 =?us-ascii?Q?XZ/qEMlGreGIENDbQTGNi6pjD/j5MyWnyyl4iQQMr205Jqb5R000bWVY+nBm?=
 =?us-ascii?Q?kt8b6jk64iLBzC3Fs01u0WJaJ4CeHDRKDk8yuyexPjrXtsLC8WMXXZS5WYO5?=
 =?us-ascii?Q?fdcZ+7FSfGLo0E3lIydOlyuMdV0mgfOS+mlHRi14A3BFvYcig+Vk+xkKC/4o?=
 =?us-ascii?Q?QLlvhmpkJowA3rh+Jjdf1aq5UFggW5dZZnP6zpDjgLXDQX5zkhzWNDCI69QH?=
 =?us-ascii?Q?urlElcdMckbH7jZjfODuX39R+VeVc2DMzveFqwIxCxZwaN/+ulzHgxPiE0dB?=
 =?us-ascii?Q?3QxnWjTtx04arB6ofMPlcs0VZaJxCYwh0e6REb513cd5y2W2r5HCuLdLktKQ?=
 =?us-ascii?Q?G5w51ljfuLeQc9srL1iJGj27oWmwDemzCfhEx5D9woOsPoQMw5j5SCghnOOO?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YGJXYgpGFq4d1d3RgGxrZ4SbbEfbHV3AW07z0Djjc4+KIOoJHFfBtY2jO7RXmKnbM+YewQCia+3QwBHNIrqkuxFLhHqY5T/bIv3i95Gbcmv4RRyuzgo1SIAXswI09XQlWw9EWaEFx50Y12b3J8bmJj3M9jFdqp0IBPdr+oFUbHQ13xFvzeH8b0nD2trqRIzjYGxHgNo3rIuZfLH/HU63Z+dijSnWXDm/DrkbXIsSaT2mNq8G60wgrWrmfb+m966fm5N8fhKLN+SnXiqyJUjRACQokS8ubk3SNaiUhvlqXQQ9CKcwQA//U47GaAE81Fa3VdgLFS4xMHGY+Xacv7VmUx3+qBoTFlfzQRHki9ziH4xM2iv813GOBBaAdJMvxHcmcxeMs8etsfpSSyW4DxcLMbZpK1UKn1NcvFRtqb8mveCly1q9STYttduB/c5XKCYayTRh3I6jGgbYslbuTFsCDFVDBCKoQE/VnUEn/nQGgzrFKtzAQ4ttYuqfKsZ13sXjl3duRGAUhgcAGK/n/wpahV8OKrzlpwRMSRP/XziacnNJco5kQbJyaTJv1l3t49NJk4bAe/bjOfidz4QApaNUhBVgBNJDEQidCJaRnwy2vI0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7a0afa-18d5-4731-c110-08dd1637c056
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 20:51:26.3826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLfNT/9JgNGrvXK+miYrz4HW0WVKbOx64P5YQLkNAJnbbTtJDfIIHmX4502zAQX/umfTyucdWe8wMvHvcTnuUu35tVW+LTOs1otl+XWgSPw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6722
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-06_14,2024-12-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412060157
X-Proofpoint-ORIG-GUID: GvZyGQF9Tvy21Jl0LKeWbGczubBFxSCf
X-Proofpoint-GUID: GvZyGQF9Tvy21Jl0LKeWbGczubBFxSCf

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x | 2 +-
 test/unittest/fbtprovider/err.D_ARGS_IDX.void.x      | 2 +-
 test/unittest/options/tst.modpath.x                  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
index ee3e214b..35e10c72 100755
--- a/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void-void.x
@@ -1,7 +1,7 @@
 #!/bin/bash
 
 # Skip test if FBT probes do not provide argument datatype info.
-types=`$dtrace $dt_flags -lvn fbt::oops_enter:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+types=`$dtrace -lvn fbt::oops_enter:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
 
 if [[ -z "$types" ]]; then
 	echo "FBT probes without args[] type info"
diff --git a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
index cc2b7884..46cb9d0d 100755
--- a/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
+++ b/test/unittest/fbtprovider/err.D_ARGS_IDX.void.x
@@ -1,7 +1,7 @@
 #!/bin/bash
 
 # Skip test if FBT probes do not provide argument datatype info.
-types=`$dtrace $dt_flags -lvn fbt::exit_creds:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
+types=`$dtrace -lvn fbt::exit_creds:return | gawk '/^[ 	]*args\[/ { $1 = ""; print }' | sort -u`
 
 if [[ -z "$types" ]]; then
 	echo "FBT probes without args[] type info"
diff --git a/test/unittest/options/tst.modpath.x b/test/unittest/options/tst.modpath.x
index 383fc956..928f00cc 100755
--- a/test/unittest/options/tst.modpath.x
+++ b/test/unittest/options/tst.modpath.x
@@ -9,7 +9,7 @@ fi
 # Skip test if CTF info is not used for rawtp args[] types.  (If all rawtp
 # args[] types are "uint64_t", this is a symptom of our using the back-up
 # trial-and-error method.)
-types=`$dtrace $dt_flags -lvP rawtp | gawk '/^[ 	]*args/ { $1 = ""; print }' | sort -u`
+types=`$dtrace -lvP rawtp | gawk '/^[ 	]*args/ { $1 = ""; print }' | sort -u`
 if [ "$types" == " uint64_t" ]; then
 	echo "not using CTF for rawtp args types"
 	exit 2
-- 
2.45.2

