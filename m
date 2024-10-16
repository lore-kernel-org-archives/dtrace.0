Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CBE208D7A
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729094517; cv=fail; b=NSz33v2eb+0DC+12eEy88Jm5t7m3DE00rwRqF7IJjJxeVrcvUf2hjqkx/kbxEa5mz0Sgw7NVuWl1LaZydC1FliwtVronFGQocH+EUrToeL+MUndjy2g+OK5S1IKrlyk2flGPJ85xRlLeNqSKc4PO/ao45b+4t3m2K7AMgs/BjEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729094517; c=relaxed/simple;
	bh=HxRELpoQagENpwflD7mIYorJSm0GFWunPRHYb3mHh7c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SsxCTa58wf7kxprkEN7ibVccqMlNAXCwaM9RtCz8hsFGyS1KNm+VQEHeAMemR7ezeQdJU/8IRSwR3ICQ8iJliT+U8eTYYBB7qBKU9n9uToTYBSGVAj3zVmqcgLRQdeS5zmMSLO7fQNmn1NjXQX/07Js8Q/VkNZM84LG5j/rtFLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C2adL53e; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=M+R1Mnm8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C2adL53e";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="M+R1Mnm8"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFfegL001498
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=of/OStl+jq4sA/WN53
	K3b7a7DMm2qCbl++ucVQgvAIA=; b=C2adL53eTnvCArky6mNSrKH1zllaLfvh4j
	hdvvu25OWesOdXMtiIbmn1u7+1WWbDYM2Us+tN1R+E79M9L1EquCAhq1v57W21y4
	27F2KKJ8vAjlVzjYCXv8BlNMiJS44vP2OBIdKQnkCa2wy071P7l97I8XGZ6UYbYh
	YZE7nvUik7V75VoshgNgYSMCwMQi/dVMqmOIFgptn8Z5cEElKf/dF7dc9YjF70uO
	6PggnQumyeaehawPqRcX0iAq7qrKMHAlrrP06ALpv4T5VaoR9baMRfAlCJ56lMTY
	m5AKnNuVOOkCnOCr35rXfrUpdar5DFIZXmUEdmYlVFsNKzmRZXCQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427fhckrk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49GG1MjH010363
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:53 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjfbbj5-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Oct 2024 16:01:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6w8g/VKnl8vxpf9R0aqDZv0Af8a10qCyGBxbODgguDkWGjaHIvwJxk66lTTAh1P1pfOe5ZhjA+Oor0po1ONbHyRkcLZawdwaUgx97y8Ul9yZ1aX/ZhpO0mwVeJqQ/bTqdBhWfJPyK4fZL9a43FLFzDjOeLkYDIudp8UcPCkybmlVx2LDC7hYuLj7OVO4BapvklSVfFdoaOuaQ6Rl277dXaY6VCWZtT7UM5iL+Dh/kc1S1ajR/LW5p4CfDmPxE3SYFMcIVYd3+fIqimOkttlsz6vJJUfaw6Dwp2ziGLiYEB70xteJvR/vsSGgxWkM0dToaT2EDruzNwGffNye5pX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=of/OStl+jq4sA/WN53K3b7a7DMm2qCbl++ucVQgvAIA=;
 b=NFDs0v6ks1DEpXX0IET887xiFiCXI78WntP8mijBBQt8n/bpxRpJACIF9RQnH4WN0Fe+VN2GUe3z+o0nCS8nr8sDlo+TIqLNH3UWp5YMUbha124cVsnO+jjlNg+La4nAANnwO5VMDjW+bg5/4qhNnb0XfZVKiaeHYqtbS5fmKAWsaXYIgM6V9vpj5XoG1HzH6YXwWbOpWf4imB0vUPQiuAcrzSFxEM97WUbfSaGYnwsP6oHdddQm8j911NpCkZpaMla+e7w6oiZN8daNIbHoW/0wrIkaQaur3g9kEi0I7U4f5xfaETCOX0ZQs3FMY/QsW350tQZmzg8cinZA7hQN+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=of/OStl+jq4sA/WN53K3b7a7DMm2qCbl++ucVQgvAIA=;
 b=M+R1Mnm8V6fLupcW++cyCaqAmMzi5nGEKEIZ9vSkH+XAY82IIwTmZftdJspAMj8SLi0UYBIn0wMFIXTcnUtet2xptBbLJbKE/ftJKGHTu8vDFl5Ac4Muf9rMqnH+bChGn5E3tVsBvv7Ksd6ZZOY17wYM4ejKheuZUE1sDyXvRHo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB5673.namprd10.prod.outlook.com (2603:10b6:510:125::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 16:01:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 16:01:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 14/19] Ignore clauses in USDT trampoline if we know they are impossible
Date: Wed, 16 Oct 2024 12:01:39 -0400
Message-Id: <20241016160139.29589-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241016160139.29589-1-eugene.loh@oracle.com>
References: <20241016160139.29589-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d5cb01f-a96a-42b7-bc37-08dcedfbd627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M1+0yoOVVYlbTfADzZVWrKAC4B05vgN07R/zs9e7fLMmbLDE70rpe+dzUpmf?=
 =?us-ascii?Q?foB4Z4xWy9S8y2q+fZM+cjCdGLS2GCN7nVi+EDe4cnplRDKI77U/u6fClnmh?=
 =?us-ascii?Q?nd96XPZJgrZI6+OMgE3H6GBdmiVpqNtB4i4zcznjtUjQqoB5DXrwqkgyqHh/?=
 =?us-ascii?Q?07gzh8JXF2VejCDZUT7u+JE5CkQ9+7EyPoqU9DZsFti+18BJ8g6C+LgWXm8g?=
 =?us-ascii?Q?/3UTyxxRRVoUJPr7tgS+Z1KtzqUJ9I+Df8/D3yj6Q0S94fc5RCa1R2McjXd0?=
 =?us-ascii?Q?lauyrySUnv2d0dxwxnrL2R43o2kBN5OXB8Lxf561PQ42YZ41qbeZ1YvGb1Cv?=
 =?us-ascii?Q?53/7DiToGd5N2X4ex0zuk4uVzVFHlnjKi7bLgdFU5xE7c66U1z8B0/4791vV?=
 =?us-ascii?Q?3vr0sO7IQiFC4mk1oe80y2uCM+KTAfOFku5ypfSl24BXX/3HL51W+08rzIjf?=
 =?us-ascii?Q?qiDetG6ftoSS3UGx7xKlEIZ27qhNKMjKAqdqdWQLPxHn2xFu6OPTsXG6G5kW?=
 =?us-ascii?Q?slfSmkcQqLnt5Hb1Yeb/n9E7JilusXpNNJMTsGE2LsSW8Wm7AN+cUsJmwuZW?=
 =?us-ascii?Q?rDHH51ZLE2oWqGRr45G6vMtw5tUx7Rr2+IdCGbdUEheDirUBkNF8LQcAQsax?=
 =?us-ascii?Q?h2OsnU8HieRukxIB+WPBgHp6Y1hPeOoGLh/f79+4hwk8X8c+U5NYRuNcPR2o?=
 =?us-ascii?Q?LmkVQKHg6PttzVsDXeQGvxeMgxw5v70fSXhi/nQu4vH77VqzXijCaw8o2Tdh?=
 =?us-ascii?Q?y7BULMGEAAbpl3XwiiI0YbVUk1RctxEFT384l/Wo389C1Jw8vBbplbPJWPhu?=
 =?us-ascii?Q?glv2QlPj8IWMWP7V88Oz6ZsdTEEiAk1zXZUAHvOVY4LKvZcohk8aY5zCmm1p?=
 =?us-ascii?Q?9JO0IFfwBhTHkhFyHJ4i8LN0owWPRd5q0BUaTsdC1vFzeIz3s4kN8arUn9+z?=
 =?us-ascii?Q?Wdio6IdVm5vVYpp6U92LIby7VrW5219WEvG33ii8Ic8wK8B4gNSZSeo9rqq2?=
 =?us-ascii?Q?81OSW+gH1qv5pqoBigYQKax51+22wMmRXEL6tqHzkqD6dWKKoAwmMHfQfVla?=
 =?us-ascii?Q?2XWfxuWEOub21UuYMm2oChAUl14KCWA6tvHA53fZQiwRhpgBnOlH9gHKKDtw?=
 =?us-ascii?Q?wnQ4iaS+X6TNH9MJ3lJWKljAfHvzagWW5iAcmRich8azIqmMsljQXZ8Ckplp?=
 =?us-ascii?Q?tc/nCmVl1TGfwkiTpgmnZMdZwlnNosgqm7SEltJAVYRXAV7ZirvvpIeEJERB?=
 =?us-ascii?Q?3XaD8NkiJ6UmK0Gbs97sv/Cv0+dK7hCqziXYtOU5FQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JPHsL0D/WyICg+ZEnmbQbk/59+PTt3NLfKfF911EjJfd2LwbYH9MPU3ygJdO?=
 =?us-ascii?Q?x/BjuI0QqvDMKyDbDzzZaJfMs4clSEWjtSBaTi3bG63+qjPzsaSHlpk0dy84?=
 =?us-ascii?Q?2SVJN1p5jcatS7HIB1m1kgzwVFTWWkrEX3aleTuiM8mLd88/z2ZegiPG9JUz?=
 =?us-ascii?Q?XTVNpvEjYBJ4KlhNOk9UBzlBOEuwRMlkMX67mb+/UcUnCMGSz3nVqZUiP0Uy?=
 =?us-ascii?Q?thrk+vOAe6sAsibF9VgGv1D97A1uMfBGSsE72lN+6t8YbrTLL6vWelpgrfKo?=
 =?us-ascii?Q?YptgRuF8MBpjI2g2QnIOekJHScK6BZN9f7Nr2ofCmB5pmzeICYEJEzevdhtL?=
 =?us-ascii?Q?+s3HQs9eKMFZybz3o8u9HwDkfwcTY0WXef7xTlaV9jb6UnIBc6eUXkJL4Htr?=
 =?us-ascii?Q?engwFyT8W1XiyJ1fOLpujM/18Y25Ganrr/QFTRsnMEykMTa2swpU9hwZuXwX?=
 =?us-ascii?Q?J0Ia3jH7UTsnJTLo22YFCWnQz78hPd8z6kGUqIr8Uq+BqOmPxOuyXEkYKjKe?=
 =?us-ascii?Q?EQPyeiZU28UHrB8HMcQWdCthb4Uvcr14X0BpJig0Q+T8wnOTYzg9eb98i9FJ?=
 =?us-ascii?Q?D/zTmde8VxqQQGmpjyUt9xturUq0A+7g+jVcOLvHAqEnS2tZ1vQOElx2yaaB?=
 =?us-ascii?Q?PtnpA3UTifsJUCGxbXLMsbXyY5x0EwBljgRIcG9g4a7nOrNHa2Fj3dXN2ucU?=
 =?us-ascii?Q?XS3Eyim/Q9ifqG2VSCZdzKUSL2DU6pcffgqdyN8HSKpdK9B+jdzX4G+hRyPq?=
 =?us-ascii?Q?BDzc80rCnrhyVFCELDLHmF6ZtlGg/8WK/ex+nvJaI5OAN9Boo21T75jKmUBk?=
 =?us-ascii?Q?515V/kmeA6NiDI918N8q2AdZF89XSjxtEaQeY5yukMnVVg93Pqx4wYh1MxmV?=
 =?us-ascii?Q?8AiGl5iJRV4TN6kWW5N1wJVnmWlYA4YurEUo567I62WoqKCrT/0WQ0hTaUei?=
 =?us-ascii?Q?k5UntduQbwgdfy2DpZni0OGIMUEEtoB19altybl5l2+sk/y7CHfOfjsnVW+n?=
 =?us-ascii?Q?wGBPlXX/IevyH1LchKMHwUNWi+YZNgelwyWXkIfNKjmYZ5q5SZYpZo8UySSH?=
 =?us-ascii?Q?NWC7AA6xNgomXx2qRNRmNjVGcGVWVxb1w+SZhfPzf10eLTwe5ZnzsBFqsPgA?=
 =?us-ascii?Q?mPrkqZFwpXiFoEPOtiTQ0jUEmMHz2bDPaRoqPzLOLspzYs1gLjKg4B0TEeE1?=
 =?us-ascii?Q?PdLCn4kNTHZYI7ag7y1TMGNVCR22WJRXHWLEczyZxvQ9tnECyJPUo3AbmMSu?=
 =?us-ascii?Q?llkqTbR33skyMQAu+ldAeoqGhVKkg6Zpz6dY5yC5r5C1M7sAyJt4p+8wkBhX?=
 =?us-ascii?Q?LIwHYCrhCTqxgF3i7m8kCKOIvGS4SRWIeE4MSvYPMTtAUdchdz4YqH50ZAqu?=
 =?us-ascii?Q?OuM0l0zHVaCXuj1RsRQ6bnT8vyJscjp4Lufn/3hZhMIgXqUvQrPiAafVU74W?=
 =?us-ascii?Q?o4N/30i1E2a2wGeC3SbNwXvK+0syKTQkiKlT871p87m3fcSIHeTXFz/9O0C4?=
 =?us-ascii?Q?RmMNc+jVPvWpbx4lKfBQRlw5ccSaHUKgLn1l6BJeGrdu30bP9qalSeYpXeew?=
 =?us-ascii?Q?VgV07xLiKbO6bHnXr30v6GqZWR8p1VG3vBJzcTSc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fy9hJGEsoim7pyrWq0rh0PaisgGaofcnANvxAB0cRabI1R+sMPlMQi9IpRD4xTnJNJEuHqWpeaF+hv+nr/9qIDcgDwNzW8pw2uS3ee9dDdKFfJ1hhjg6giEPWad3yCVigBkUlnnWkVOGX93g7EMQrdrBLB+0U1jSn/dmgIrjQ0whmnHOpUCfHwneJb7VgZh47eCoC9s46lxVSiyFFMndUR0L6vBrEKXXq20XCRl4cp/HbZOl7jmERlwrQx/YYe7KW76XneIQQ36MyUPQxrqjWjTJ5EyR1NjGGfg4KCfyPy5b/EaKybOx13PUDEVenN329/7hzQbQ8okEBPchEl49ayHPlHPGldCA2zzB0v/5XTPrWfueAIPTl8dbmqh31Nb2fTx0x4hS/mKd/x9CSqLD9V4z0Mi74jrbE9g2rX0g+CuuvyARwNemdU0ZPTPB0AV3UXx3hxNxsYy5/7qNT4N9uspvCm+RWp10VhPrlEIl5qmSJcGU/sQxwnA0Em1wGuMCelwBsLU5NFzV1gtiubljzz39bmvATw6zYc0sg2I05lwpZO/VBYFv5T9oOgDKceOFnwaRjtMjVOnb/sg2KFK5xsnc6wuPyzZcn0V984QGgSs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5cb01f-a96a-42b7-bc37-08dcedfbd627
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 16:01:46.6524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+K4XLb1D4Yv4XIlIXcioyfAuVnZPt+5gkb/0nBpa4uGf4dcZFsnVF0U9XxoIdpsYYPRmggHr98L//antsjSJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5673
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-16_13,2024-10-16_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410160101
X-Proofpoint-GUID: mDeEU0CkCzH-NwMB7Lab4v_stoXyQIVB
X-Proofpoint-ORIG-GUID: mDeEU0CkCzH-NwMB7Lab4v_stoXyQIVB

From: Eugene Loh <eugene.loh@oracle.com>

An underlying probe might have to call all sorts of clauses if new
USDT processes start up.  Currently, the underlying probe trampoline
simply loops over all clauses, deciding whether to call a clause
based on a run-time bit mask.

While this approach works, it can mean, e.g., that clauses are being
loaded unnecessarily into BPF programs, bloating code.  It also means
that the trampoline is looping over unnecessarily many clauses.

Meanwhile, it is possible to know in certain cases that a clause
could never be called for a particular underlying probe.  The
heuristics can be tricky, but that challenge can be faced incrementally.

Introduce an ignore_clause() function that, for an underlying probe,
determines whether some clause (denoted by index) can safely be
ignored.

The same ignore_clause() function should be called both during code
generation of the trampoline as well as during the construction of
the bit mask.  Further, for a given clause n and underlying probe upp,
the function should always give the same output.  The set of ignored
clauses should remain fixed over the lifetime of an underlying probe.

For now, conservatively, ignore_clause() ignores nothing.  Later
patches will introduce heuristics for ignoring clauses.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 0289c9223..a3c04478c 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -263,6 +263,17 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Judge whether clause "n" could ever be called as a USDT probe
+ * for this underlying probe.
+ */
+static int
+ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
+{
+	/* To be safe, ignore nothing. */
+	return 0;
+}
+
 static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	dtrace_difo_t   *dp;
@@ -388,6 +399,9 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 				if (stp == NULL)
 					continue;
 
+				if (ignore_clause(dtp, n, uprp))
+					continue;
+
 				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
 				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
 				    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
@@ -862,13 +876,17 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
 		dtrace_stmtdesc_t *stp;
 		dt_ident_t	*idp;
-		uint_t		lbl_next = dt_irlist_label(dlp);
+		uint_t		lbl_next;
 
 		stp = dtp->dt_stmts[n];
 		if (stp == NULL)
 			continue;
 
+		if (ignore_clause(dtp, n, uprp))
+			continue;
+
 		idp = stp->dtsd_clause;
+		lbl_next = dt_irlist_label(dlp);
 
 		/* If the lowest %r6 bit is 0, skip over this clause. */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
-- 
2.43.5

