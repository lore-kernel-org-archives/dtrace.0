Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15E7F9CB
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 01:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751073583; cv=fail; b=bCQ/HJQnJzLMg0GeDeLLv0cHcztvbJn3KjV051Bxny//TraURy5IjtxE1q76KZYVEQIpuwoz6buomO45GI1V7ojwU0uG2y0SStl25Lr6WRbxrCD1c9DgKuwVj8kc3QhBIftIbSD8NPVX5Kaov74CI6/+VrNNtFWBMUpmB+ykrFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751073583; c=relaxed/simple;
	bh=CiQlHI/7JEQvcP43HpOEDwQ3CqbCIH08gTZ6Prv1gKA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=eRNVyDleKaVwWwe+bpkGYTlaYqVGziekoE9w9hqkFQjEHX0mDOcCuQLI+/ALbhYykUd8/zRbL+RxEF4jCY/cVcS+q82Hl8QNJAkP6IUo0V+19Ux4XF1NzOpZWwome/zFVF1F2PGnNCjLUGzsRkLF+QUujBQhu6fkj9BBYFaRxc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Cvre5ly1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=poRBolfI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Cvre5ly1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="poRBolfI"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0mMdN010608
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 01:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=fSmwkUp3GgwHEHrS6p8dgg7ZPBx0SappyHoNg/eki8I=; b=
	Cvre5ly1uWKXE8osZGn1/zYQq6FR5XGdxFxmOB0y58qTMvPHHIAppWq8UOQoAYdl
	8fWY4jtM0FqsLyAmWe5M+4QFfvomBi7KT+9s8RVOWMC+j8I02ei+b8VqeiFUxVu4
	LbiHLxpdt8MINjkY9SFd4bAQ3Rr1djuDf00PZcH1u4lCRekT59NCzFFT7eR9WWgt
	+DmSn/RCUTlLp4ArZNqvyPdBYZ1M2HN4CW843Gp6ElZH2UZQI72JNRc5UVGMU1F4
	NGURO0+uL9PMt3Ws/kRVyNw6bf506mZ/Sd4IRy79FGEzyDWPsxwmAOSaXZNdd/ef
	kzyZEEiMHKiP2+3sPs8ihA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt5utae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 01:19:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55RMeDk5013301
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 01:19:39 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr9fwb3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 28 Jun 2025 01:19:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjrI25bbR0m8GIifHwNaQwHdRqCaT7pKAmF9uSMM4QKKOU4LCL55mNI8TqFwuUl89lAAkOjYPedz9oGFVpwoO6fHD7QLElKSu/oKpfuUc3Fu3PbmYozaj3HoB44VmoruCzNgbyuEIcEd6YL1xBEOu7uLXKvVIEPiIHCDnHkqMjMxN9XzNAGgVo/e7Pc/sq8VuJxImxlZgSXxIELWKaE1b0Cj4e95BkyiHocwOI+GV9nF6Hq3rRct2RUtgZCr8NcvzeCOzHUC2BgvkaIG9EOrUZHjHP9JEEg3yaAT3g1y1jCzrdfRdtvRorHqLttbgC/LFE09+EmfmQdJCBEWjlIrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSmwkUp3GgwHEHrS6p8dgg7ZPBx0SappyHoNg/eki8I=;
 b=xAnexHhAXSUa89WrlJ5HWJr0HmJXae+N6jhgibyT013EeSYrUuEFO6Y8dgRmY2yddp39hSurCWwvSMRHP2TGpDNZsRE4yBYCiLrdhlKwUmyWJDlMDjVt/oymeh/XBNs7P82OozYifkPQW71IaJ/hLFsv80MUH4KOQ98yQDSTeIACVkEz6JRobnensMhcUvfyfxib78JqSiFWDpkXdrzGeZ/POipBvHecezkEJJS9ZGg5ut5A/mTYwYWIEsZvtIkvDAQGRhpSRTOdVpcBqTBQhpHy478op8/cMPLtnIp6BhQhE+7eZZoaMRt0VdNzQqqtjaLtuEUxjL3CueK3jctnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSmwkUp3GgwHEHrS6p8dgg7ZPBx0SappyHoNg/eki8I=;
 b=poRBolfIN3Ux+HmDrpyr72HhHfE0L7kdkQuF3F1BQZugdwy0amJwRK3yEJ+PS/k5i+P50To+wvF0iM4NdJhIhkc+f4r0UTJFfi2N+qedreMrLlpuNnJgc/S1gCV9Ybdh0ywqL9jcYD1gPP+6sBJhDY3rBQAy0WGyekpAUsdlg80=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7637.namprd10.prod.outlook.com (2603:10b6:303:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Sat, 28 Jun
 2025 01:19:35 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Sat, 28 Jun 2025
 01:19:35 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Make sure all probes are listed in default case
Date: Fri, 27 Jun 2025 21:19:32 -0400
Message-Id: <20250628011932.23469-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0377.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5200af-f990-4e86-f3ae-08ddb5e1d7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aJXN7hLSxNC//cmoQSjRMXL8CUYwISk4uXtcQzjtR2oyJNlnUaVFQA1vpNJD?=
 =?us-ascii?Q?BzzBlOkl8XyzpofKHFuBhIwfjljglAOEQuHIPpsvdGXuI51fHlSYTsg/xMOK?=
 =?us-ascii?Q?NADiPiZIsrdCnCQXxBQ6ngfSOUzOwngj2JpA2Ciln7dLYxQapNXDSPUZUf05?=
 =?us-ascii?Q?HerJcUYvKirGyB5WcQVotuVGPHBBJRshp2Mu1cChUrCFrFlGjG32N0r54UcD?=
 =?us-ascii?Q?nBvM7/3uAVpER3G1hmItiD6hCDKGvkSRAfmq7QLNjmVdezwDfycl+8vxHm0P?=
 =?us-ascii?Q?gDuh4UV7aM39uwJ4cX4Zz0i5ZAgbb/SZF+W0EPS9mRP71+32v+9dX5qo/yh1?=
 =?us-ascii?Q?SUIzkyF2NCdRrIDOmncNYk/Iny7wGFpqZbdWDvT+4NLXAdk6VVpk8sX883S7?=
 =?us-ascii?Q?cpbi9lzv33xuDhaiQdFLdMzTb2ZsOR/0VsHX88UCrRdwe3rTFvSaoM6IX6+F?=
 =?us-ascii?Q?vP3SZU2MBWhgbux6/Up0cNhddumF/ajGnJHsCUv4vnS6rGHh+iDVLjoYXWkR?=
 =?us-ascii?Q?RhhX035sozY35LLc4D+ANTWXEG8rDq4lWgPJDy27SmTHCkQCZ8/MZm11N1vt?=
 =?us-ascii?Q?e91JEyGZ15iRZYmQUpAKtTi04eRsmyjdIhPZDazV+VgfPutQO2WhRTa6B7gH?=
 =?us-ascii?Q?hLZhvnrtPPw8uvuqT0f0BsLUntNieWNDESiZYf1iQBMhALdaYQTa3eL7uCaW?=
 =?us-ascii?Q?0yrrl84BaBZErKVEXC9JfoRnoBbauN9oiFKVGSPSbSqf5zdUfddwCoiJIHU9?=
 =?us-ascii?Q?3FBqvcdQqAy/Q+9nSDFFbvegwxruc6WBg9Xn3ghzEX0sO6LV2V5mVbVuukjd?=
 =?us-ascii?Q?6xbZpgIiIlZJopej6dugKpEIbOAt19g3lCE1BxGHfJmwDSdyFXd4BoHdaCSG?=
 =?us-ascii?Q?F5tvQ6oLOmh4Dyn6c2NWdQ+x2iTCiuTvNN7DZrxZMAy4Fhtim1lR3fy0USE0?=
 =?us-ascii?Q?7owR/xzt7og9Rqdesmekvu5F1hPhqFaYFJmOV6Ai4MikBFY3VXWrx+/+RpvZ?=
 =?us-ascii?Q?/VaeFV0OYCtRdCVtohU/CvMH1htYk/frnxqwT12I0PDExsUB2Z4oQVeA02iU?=
 =?us-ascii?Q?vzin+o6rwyHDDlb4UxokNKYqoiFFokpDdnFwyTx7l8Ajo7sNgHQYIgbIXI21?=
 =?us-ascii?Q?qpvhqn25i4inuNk0GsWoa3YFf+3WzvBapQ6sh3X9HD+Jbc3xJjbD3ZkK9Sg3?=
 =?us-ascii?Q?a9KYphwqeN3m0Rk1peZDrVBPuvfs18GoNlr1eU5iSE/LNyYa6C5BTPcbfkqL?=
 =?us-ascii?Q?o1YWzNm1ulNXAIRyfsJjPYjma3x1/gYOwKA2p+7vR2pWskqaYVdBv5JHFEr+?=
 =?us-ascii?Q?yxbZJtzm6OjBmMKx4bW4Hl/3RQhGp4J8e7FcvKnMIF7gTHsJSWQqMhUmIj6X?=
 =?us-ascii?Q?sWxv1/eR9UsUxMg6L35dV/RQXNKnc6J8V3rNZbqiY661SZLl/xrmDIp33vJD?=
 =?us-ascii?Q?goC7ALfvn3k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eGanYGezLVHNK1ZltgHKsSks3bzxNVryseOBirnB7w/g3TfsMS1UTzZaZC3N?=
 =?us-ascii?Q?z3Qa3hgTTiQamPtMYc5KRdAEgBe8jv9UoVSorns91LNJityaRfgAAYRaqgek?=
 =?us-ascii?Q?u7A4c47ArGO6mrihuWTzPeTfOB0aOL3skmOUJQGwB3L+DVnsmFwA2JcjxaCr?=
 =?us-ascii?Q?bEmM+En7PpWrGbOS2sFuXF5A3EXmyWQzA8eZyGUvNVibHqhBsOiEjwKQ8/Ab?=
 =?us-ascii?Q?0uVWYIvV7W8a0enauF7iX9LC7ML5V+9NsKPp4eGvCTZs9hlRah01HGaiA74h?=
 =?us-ascii?Q?Y5eWVmg7xWwaCw0ellEO1oB8OXkeUH2+/ZA8ZlK/ePlqwEejofIJjyFkoJt6?=
 =?us-ascii?Q?Ru+jiD/70uEkK3wm7QemgsP9mBYRz4VWw1fwqrFVj8T4HVPYLTWhgdcdxLBz?=
 =?us-ascii?Q?fT4ClFtD3vhJZZh5MnMiy00yE6yFCJitcGo0a6TDNGmyCOWzYWmO7I9ZLVjD?=
 =?us-ascii?Q?rG3L3KRn/Syr2dbOg+6ZO7DfzY9VWK8So1wh4Yhw0jiHLtHjRmlK4fynDUCO?=
 =?us-ascii?Q?DpO7k4UDbXqoQv7DkXtNNiKBVRkwxmfFD9MbUa6Jag+gK9lpn/nFEltKEEmM?=
 =?us-ascii?Q?lyQ/loNmljhxwX+RQGEJEOP7D5Eex7bphOfNNj6poLPkvX9uG9ePhJcZPv7i?=
 =?us-ascii?Q?JK4Zvdqn9D5F8ccoJA7ogWB1Kk6P5XoZ+ADhHkFPJX2zF0MCE10i9JrM9X1a?=
 =?us-ascii?Q?S6iBF9fthCki0UxqcdgDwAlTUv3ggg+X7jnm1HaY1vZGAlDbIw3Rl7ezZeza?=
 =?us-ascii?Q?UqO3wZKnyVA037Oo5XswglVt2+BUM6Tqren98Q8zEcKpLGM2w+vaNSiJj+2R?=
 =?us-ascii?Q?epu/qjY3lYQWBvs/4qPhXbEDhPfjH9zM1snEuRr/3nZCeiZ6G8pcKCs/rVjp?=
 =?us-ascii?Q?bNkdJPAcbVfLbn0gSg5OkAOhdjbv7lHK+N9ny1BdEBpSJNyRm4J3EZK9t+HS?=
 =?us-ascii?Q?zK9zhhFlCtglce7TdUXrLljOjUVXqmPZlbqum34uJqfrStnEgzVD6gUxndHP?=
 =?us-ascii?Q?q219+jxYAB4OdSUfWvWksdkWhTjfAcclFZojtsXSXiK+DdXWf/xLHjR2gBka?=
 =?us-ascii?Q?z7hcKedcboPDYAViGN4XMvW8lLp590QyUJ53MdftmN+gqdYCdrwe7sfQMY3L?=
 =?us-ascii?Q?bbWbGdlgHIzDJNjGlFLedQyezug8CnPqJ3lihtJ9CT/dpL7i87PqfDU4kfTg?=
 =?us-ascii?Q?huLTgkrZNKcJLgx6FkQMVxtdpvSU6t/pedOAdr8Zzvli4ppUuQC3HsxEixnl?=
 =?us-ascii?Q?i2+P1f6Z0Or9NeDRwr8xt94YBY2Bzl25LbvyQYij/f1uP3YRqKnUgm5k7r4q?=
 =?us-ascii?Q?LusHtivxEPpoJ5ZK0q+eyv9NxMiMLUvBmgnEb1k3GMVm1pI0jlqqv0Hg7QiQ?=
 =?us-ascii?Q?jHAk/5g3Q7tk9lAFtCoUG6TENgcNGM0ugjj7OoWrEcP7+f3kmSQ6NUCHE14b?=
 =?us-ascii?Q?ZeKR591mZL6WCuc8Y6RWjwdCO9owt0G8hmiMqpB8HRjir5tt79rmzaHtVFGp?=
 =?us-ascii?Q?hyx4Z1Wf+es1iW8Mx5eilkFBiNJnKVdlAvvxa1dY4YPNCtmH8V8EjGTuXOKk?=
 =?us-ascii?Q?GADCr0xjWjhglj9OQQI3i50T0EBcAIcMwdiC1zxG?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mU8v0h40JIWkCqywAlIwWyxl04N4oz9sFc60m1DbayoVyOZY1sEd7RyipzdIDh1PQXE/1hityjjRFaJo5Vc02e4IS3L5Hl0vWZ6h8iyT36V2O2H0wwY4o65WV8gXoWJhx6B4iKkLFGRa1TMH3jyTcbwzRokrQPVmd5x7y+VdZfI2L6pMW/VIuUwMztF7qdyY/V4O/0aKqIPMsNGpT2Pewa/sKzOAm+5+kRAy/rfuTJGY7oEnvc8kJ1/YRUy/kDSHcsBwccA1b7y5+AGbCJkt9WRlzjlTM6O61NtvrHy2mpYYfxmhheagJstpa6PslqxCvFHhUyj29SQWXkq8bj65UVoxwHFe271mpPrnq3azDDGVySoB0Pzgc04PVEL+klH/9ZgPpZhu6C8ypYhtv3He0OTQZ2iTGcUYSae9TEuKdPwm/hf3KXSM+vQ8W0w4bLsBASytISBL5SuT+F06PqizibqN8CSyr1B+jwCGcR2tOpaTc15Xq9dW9CgNfO3eEf1bl7Fhphvr3Y+IfxxlQ21WglO/eEo0UEk8XJk8OiaqdOfWO1yIABZIH0T4fdW/ehTKBcsa0ZUUkOT8fpkSJAFuJ139raAAdlqjWBgNEQ2xRP0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5200af-f990-4e86-f3ae-08ddb5e1d7e9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 01:19:35.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DJ81D92oBX3olplkE/fKFEjwFbVc9+N+ycZosvYPli9BwziFPwodDJ+kUKjVu4TsZy6c2Cmgq1G8hzdHQPZ8yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506280008
X-Proofpoint-GUID: 0l0LJRl9Y7qd81ojRKplcw1vkV7I9aG7
X-Authority-Analysis: v=2.4 cv=PMYP+eqC c=1 sm=1 tr=0 ts=685f432c b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=V3SoATIoaGlUVTrDMlIA:9 cc=ntf awl=host:13215
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAwNyBTYWx0ZWRfX9+b+LckeK8YF K8w4pg/5L0d1MTzHcjOa5+mLXOntc9qebgUSiUmEtbIzOAtm7ep950mfr0zPRrXGudMLHgeRoms czUpdCeQTR/LvqF+6KxlczrMmq0hQP3lR6MYtTcDC5zE4pi8GfRQnk/RpvIApx6JSJ2exiohKW+
 HTNccEHuwAM3gVw4mhgQAJhlaUvYh70cxY9QaqmFYsFR4ig67iOSnkdO3AfM/79J2mDdCt1Nq6c cSkmhjL+ZV+6kAY/vgmos3VvJSAZCMRVRahye+YfW4dFYdWWasJvKr1VDPnJSQZ2kqFMvI/u9F4 tFFtIdx9jJN9SxepVBzdIwFma1nXbQZC/rH1RMZepa4ispWJFO+9BhGGfQArWE/hbyvYF1r/+VM
 ExgaYO4AMnisYvYIVPFFNVVVHR7xUpn4T5F4y5oPnlvymqHBJR0GKiQcaSdZkcXNuJDVRryj
X-Proofpoint-ORIG-GUID: 0l0LJRl9Y7qd81ojRKplcw1vkV7I9aG7

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 INCOMPATIBILITIES                           |  2 +-
 cmd/dtrace.c                                | 11 +++
 test/unittest/dtrace-util/tst.ListProbes.r  | 13 ++++
 test/unittest/dtrace-util/tst.ListProbes.sh | 82 +++++++++++++++++++++
 4 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 test/unittest/dtrace-util/tst.ListProbes.r
 create mode 100755 test/unittest/dtrace-util/tst.ListProbes.sh

diff --git a/INCOMPATIBILITIES b/INCOMPATIBILITIES
index 035c3675b..bf55019ec 100644
--- a/INCOMPATIBILITIES
+++ b/INCOMPATIBILITIES
@@ -8,7 +8,7 @@ Missing providers
 Difficulty: Medium
 Likelihood: High
 
-A number of providers are missing, including pid, fbt, and net.
+Some providers are missing.
 
 
 
diff --git a/cmd/dtrace.c b/cmd/dtrace.c
index e0e778db0..ed517abff 100644
--- a/cmd/dtrace.c
+++ b/cmd/dtrace.c
@@ -1443,6 +1443,17 @@ main(int argc, char *argv[])
 			list_prog(&g_cmdv[i]);
 
 		if (g_cmdc == 0) {
+			dtrace_cmd_t pseudo_cmd;
+
+			/*
+			 * If we are listing the default case "dtrace -l",
+			 * compile the string ":::" to give providers an
+			 * attempt to provide probes.
+			 */
+			pseudo_cmd.dc_spec = DTRACE_PROBESPEC_NAME;
+			pseudo_cmd.dc_arg = ":::";
+			compile_str(&pseudo_cmd);
+
 			if (dtrace_probe_iter(g_dtp, NULL, list_probe, NULL) < 0)
 				dfatal(NULL); /* dtrace_errmsg() only */
 		}
diff --git a/test/unittest/dtrace-util/tst.ListProbes.r b/test/unittest/dtrace-util/tst.ListProbes.r
new file mode 100644
index 000000000..a04669843
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbes.r
@@ -0,0 +1,13 @@
+cpc
+dtrace
+fbt
+io
+ip
+lockstat
+proc
+profile
+rawfbt
+rawtp
+sched
+sdt
+syscall
diff --git a/test/unittest/dtrace-util/tst.ListProbes.sh b/test/unittest/dtrace-util/tst.ListProbes.sh
new file mode 100755
index 000000000..84f363443
--- /dev/null
+++ b/test/unittest/dtrace-util/tst.ListProbes.sh
@@ -0,0 +1,82 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+##
+# ASSERTION:
+# Testing -l option gives reasonable numbers of probes for each provider.
+#
+# SECTION: dtrace Utility/-ln Option
+##
+
+dtrace=$1
+
+# Decide whether to expect lockstat (disabled prior to 5.10).
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+if [ $MAJOR -gt 5 ]; then
+        expect_lockstat=1
+elif [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
+        expect_lockstat=1
+else
+        expect_lockstat=0
+fi
+
+# Run "dtrace -l", print the providers, aggregate by provider, then confirm counts.
+$dtrace $dt_flags -l \
+| gawk '{ print $2 }' \
+| sort | uniq -c \
+| gawk -v LCKSTT=$expect_lockstat '
+
+    BEGIN {
+        nerr = 0;
+
+        # Fake lockstat if not expected.
+        if (LCKSTT == 0) print "lockstat";
+    }
+
+    function mycheck(lbl, val, valmin, valmax) {
+        print lbl;
+        if (val < valmin) { print "ERROR:", lbl, val, "< MIN =", valmin; nerr++ }
+        if (val > valmax) { print "ERROR:", lbl, val, "> MAX =", valmax; nerr++ }
+    }
+
+    # Skip the banner.
+    /^ +1 PROVIDER$/ { next }
+
+    # Wrong number of fields.
+    NF != 2 {
+        print "ERROR: wrong number of fields", $0;
+        nerr++;
+        next;
+    }
+
+    # Recognize some providers; apply sanity check on number of probes.
+    $2 == "cpc"      { mycheck($2, $1,     5,    500); next }
+    $2 == "dtrace"   { mycheck($2, $1,     3,      3); next }
+    $2 == "fbt"      { mycheck($2, $1, 30000, 300000); next }
+    $2 == "io"       { mycheck($2, $1,     2,     20); next }
+    $2 == "ip"       { mycheck($2, $1,     2,     20); next }
+    $2 == "lockstat" { mycheck($2, $1,     4,     40); next }
+    # nothing for pid
+    $2 == "proc"     { mycheck($2, $1,     6,     30); next }
+    $2 == "profile"  { mycheck($2, $1,     6,     30); next }
+    $2 == "rawfbt"   { mycheck($2, $1, 30000, 300000); next }
+    $2 == "rawtp"    { mycheck($2, $1,   600,   6000); next }
+    $2 == "sched"    { mycheck($2, $1,     3,     30); next }
+    $2 == "sdt"      { mycheck($2, $1,   600,   6000); next }
+    $2 == "syscall"  { mycheck($2, $1,   300,   3000); next }
+    # nothing for usdt
+
+    # Unrecognized line.
+    {
+        print "ERROR: unrecognized line", $0;
+        nerr++;
+    }
+
+    END { exit(nerr == 0 ? 0 : 1) }'
+
+exit $?
-- 
2.43.5

