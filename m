Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794067260;
	b=YYim6p6oLyEVf/VdPT+5glKHWeBXsR4gkM5wQvLliW8dD6IqMj7GjNKBa3QfUm3d316Z
	 T2txbivjp22d7c0krXLQBvzn4aH/1pX/WNhskFh7tmbYRoLx+jnY8OJxkn2WvqbLkeCEr
	 o70EoHnBkCRzmpgcw4X0ZmUObWwwENvb8eATvNVOwaWtqSmy023DIhzdigzWfWGsyUYH+
	 KFjX6IZXpLQUwIudFKlg+X6/ic4y2gb6ujwTmPKLOL1urnRgePgJnN+5bdfR0OHjqIA42
	 2XejGotsMZ542cegU5KGmLLWJYzfHedLsgbryFeRPscF2cWlLhHk3A+mZDAIv8h8MrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis;
	bh=nCIOzPSx7+zxwyITu7s9N411fen2L3waxPjzzMqgPRA=;
	b=uNrXlo3Q+8P+z59DcRU5jrmNN3uoGUP0pC/SJWB9Uj4dJWrZ9e3G6zjgrTReJZ0qiWxD
	 HouORkURPWX3Q4UFAA96rh0uYpBBZge/QI3QxlzM37ZaIwrPY+hdELC8l4PKXG2hp9l/K
	 h2w+xyREWdoMToZZKECFzmHLnCwHR1WIyiZfVAdo6eEt3z6BT0ZfHbyzNa0VrWuaNC4xO
	 LkoIhGt9jK3DE0qAs8Wj6w3aKCTa4M22pH22CcUKCdncYtqeLahOdpYdn3PDzmnNuIICr
	 otVolF6L0PfwP9QLdijMrWzS0QjwVzE8YEb6DqzD3rS0EQXSO8sA3Su20tVx33+/YAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=EEW6Rmxf;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PCCehFjx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843E606A32C
	for <dtrace@lists.linux.dev>; Sat,  7 Nov 2026 16:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D843E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=EEW6Rmxf;
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=PCCehFjx
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7FxvmC3004763;
	Sat, 7 Nov 2026 16:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nCIOzPSx7+zxwyITu7
	s9N411fen2L3waxPjzzMqgPRA=; b=EEW6RmxfuGHPDIF0rTnXBXHIHosuhGu/Kw
	0bnVhGF+OHPYkuTwH9iNwhduYN67MdbRqjsDk5m4xOM6I7YsYW4WuMoy9v67zM7V
	/Eyixv3xeBAY1YRaKSS/tfR51/B9lPd6pxovHuWvFZM5GBzF0ITlCmLWOQsCWV+d
	m+ev+sXdbFyC/QEnVLcu2oEIEddsPIMiRFDKyhsf/dFt0kr1Zj5wl0YCC7BCMEPJ
	f3PcfsngwsrVuFPUpGgW4/GwIFzYRLpX02jBHqlWikpUu+7Scx9apNRh/kSirOtE
	v6LZqJ9ag0EC9dFXGAIlcrqocrnxzNJaNYm40lgD/37Pdh4NF/Uw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hstw9rbvr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 07 Nov 2026 16:00:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7F03V43601381;
	Sat, 7 Nov 2026 16:00:53 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ht28xe1dx-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL);
	Sat, 07 Nov 2026 16:00:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdbHyN3SY6ls2WE3O/I9F1tsWU4996bXplYtDLfodmW7GGK/1A7Den9jOo7ZfFGG77ItPQkZcK4qIPG8Sl54t6Mb07BWuX9/zu4wZxOvgo5qkw3HdPYB5XhKNUMM39MhUP+HZMSKAqF88HJTP5bOhVbrB4s8owrwDYDWR8kWxg6vTy3yg0dk1aaMWg3DJ836SWC0vWr59DeOG2oFewHzMOL59ER3OQrilSFKRR17Nro52ClKUYv6tTgMApu/mbH0qL/6hf5ygL28eah+l1UzQRRm/uebrODQKUDFC/eTHWFj9zvn2/CASJUXpHOf8Bv9X9gABHtosIZPRxMQbzpAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCIOzPSx7+zxwyITu7s9N411fen2L3waxPjzzMqgPRA=;
 b=wK9tNm1mMrg7RPJ/+zPYd5nH0q0Z4PndoyUvGon/2jKiuJ/m07/BrBHYVdJC+fTZrqwO2651fHnt2+RGqcx+4syHjCbBaH2byqFWr7sY6Nt/KXnSOgs6DrMrPu3U6vg4xSnOwX0eVVfBt6d6ZOUUiy4smc94mR6zh7EirnYDVwEfO51YAREmexRUXcdz58g1nemCzoJyQoqEXwt9wq2CL0veYyQELZY6jek49aqyOgO9WFfN3o7IbPLGYSoDN/DTmBhBkMcqY5FTbJ5YlaThaptWNyYFOj3AbnOGIMw6lYA9NMTaQunAfA+ia9o78zw5c6QRjWZw+b8aPnNdz4rW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCIOzPSx7+zxwyITu7s9N411fen2L3waxPjzzMqgPRA=;
 b=PCCehFjx1jeZimxLZsmtlYFacnOacOm3Asm+SI09G8+3PU8W6fkrbpWO6A0Owv9fPADD6h69JTWI24Ki6Cgkn8Myh9F1Be4toKwsgTGK9EI+jlAmWIJmvvW8qZLfJ3Ottd0cfCJFtRY6F6lOjmHwpAqWRL9KyULVlANHGIi5/DE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by CO6PR10MB5553.namprd10.prod.outlook.com (2603:10b6:303:140::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 16:00:52 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0592.010; Sat, 7 Nov 2026
 16:00:51 +0000
Date: Sat, 7 Nov 2026 15:59:10 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nix <nix@esperi.org.uk>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 10/20] libdtrace: retain descriptors for cached module
 BTF IDs
Message-ID: <au9KzkbyxnlvGB62@kvh-deb-bpf>
References: <56247e0c69f34acca1cc8c20ffafc4bd@oracle.com>
 <87a4nmt8si.fsf@esperi.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4nmt8si.fsf@esperi.org.uk>
X-ClientProxiedBy: PH8P221CA0037.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::8) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|CO6PR10MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: cd76cb6b-e364-457a-d172-08df3ce84c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|10067099003|4143699003|56012099006|261028144727099003|261022075727099003|261022105027099003|261021121427099003|261009223027099003|261021123027099003|261026121527099003|261026140227099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	fL/j/qgUkyf2OCE6zYKleO1J2FiueJo6stihu9tz1SILY2MtQ+4dQKmk80vnGz1qX5Su6JFWbChM7Xyz+mtl+X/cU0Yz6S5FuQz5pLXbBWXmm/oGHd476Jz09WH3DFMxxlVuXWQRbpW/upohElj0L13fA1ksDhyBHxipZjjDCp2UzUbdsJigQXsaiXaysv+AzrSq1mAPC98oytdkjQn1Sw45AP8sdhUhstqma4enFjrvt8lN6vTzrab8PsEd7/wrpVlXrZShfqqk+D8LB4lPzOUMKkNd9YH+JmrqYlT7ofGyP8tjMwdXc47a3ogY9qPWUF9EWhR2Rq8ePqagWyafTJjKKKkCjNRGLob8lrH6BAmhJRpnN7xt/9V7whPjES/Elk1TVhdWCAMWvXvVqiNSnoWHzwvC+BVwvhLRxiG9IFYRGZkrgb2NqLTVOKCJc90ts/Iu8ALHtNxBcUk0KLMG/hutl0srAyM2+5mlsWHiMKhJIKW7O4AMpnGX1SCZuXEQ+/9uFRiIvBEipnYVE58anrS4qTI8gcqkdc7B9E5RHYvcqJvmxe++JcCNQsmS9KfzZv7EHjN1Npzpv8KSNMYoQmLHNm+BebYHEo4PI6qJr6GkdxJcPGmtp6DpuGy4/cnEqWJKuBifh53R3MHB6Kq0VeDcPa6GwrmRfbhVTbGQ2ic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(4143699003)(56012099006)(261028144727099003)(261022075727099003)(261022105027099003)(261021121427099003)(261009223027099003)(261021123027099003)(261026121527099003)(261026140227099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hq+dqB+EKdZiCvgtahpa/KQZhZ0mmdp0afdLYa6zM15cI+pJNLroDDsOHMqE?=
 =?us-ascii?Q?mEy6QoGhvYS1BYLGmHDXV4zS9C1vqo45Lm/PTHeR0ujwfc3sFe7M3l2tTOWy?=
 =?us-ascii?Q?HaiHJGJfAuZ8NNY3Cj11uEcOYAucSi6xBMs+pD1B3Wjx23BSgm6aJMpcQZEe?=
 =?us-ascii?Q?SAgxCo07ztDg04Z9YeZKlNUZRcwDY6u0079xWovRq/JObXMtu+9QMv/wEQaS?=
 =?us-ascii?Q?6Vu+Xb4fiaNvUU0j0vi6eRDU+enqAeER9byXpb3B48bAjB98oUvCitz1PNUq?=
 =?us-ascii?Q?Q8faduPIBndwGB45M+Y1pyxGu1S3PYA2S8uoih5gNM8pFmljuQSgkCChB9Dl?=
 =?us-ascii?Q?sGB0WVQl4QNP1QNW80CuT2abPSrBOf3HftDVu459D7jmZDZzFoR4eTo5VyAZ?=
 =?us-ascii?Q?lwpxhvpkBheR7lILxZNcEa/utQbGxBh9UbdqQ3DOhdwGiXUZak4lW1qC4yiO?=
 =?us-ascii?Q?e+KUPEYTRKftuI7KRyln0mB9IhJdywKOra2POH9l1YLUjgy3B8oj2PgErfpC?=
 =?us-ascii?Q?YgOuRm8lhrXtmntRjdwYSLOzuqgdCPjS9nK8tC/SDCLUuAiLMVxIhabfjvOn?=
 =?us-ascii?Q?YjDKWt4hHF0q/dzL9SYUPk4EgbwXd0kte/5AwNTTVgiMS8LZya4pcLWDRsxF?=
 =?us-ascii?Q?5I8QlmUO2LgdTe940PKXiM3qQUxYedcVdHs0HlZD/Uo3yXeH1XlWfWogMQQY?=
 =?us-ascii?Q?BqrzM/P2gtwVS/+qcBgnXAuycV7YhOwFCvw+x69JPJqXsIknyTyIzq4n7VFf?=
 =?us-ascii?Q?1Ul7UDdtxXRK8MKeKHAO1t2Flu+bN11EZtpfYjJR1AnlAqnT3+pPi9RPhcUE?=
 =?us-ascii?Q?BY+ai7IqrV9gd7w7rBQ3TFdSr+6Xj1SB/EvQGxb12UmjkVo6x5uAVm+jJxqr?=
 =?us-ascii?Q?nYWxouexDJeq96otutIT0h6At/D3OdA0JK2/9aB81pnwir/4I61bsrAzLlmm?=
 =?us-ascii?Q?ISbKSagvepPslKl4vefP4zZr7hQykQvyu0+p6bhwrRupPURAw5QXgwRxfnuQ?=
 =?us-ascii?Q?hGB0uCJtzZ3NQ9rs6VuJazi2Ec5HFrqQ1/zGzgEChoBca8J2iv4kC+vt0s73?=
 =?us-ascii?Q?HaOxHNdfyA/uI3725ShRf7hT0zIQnQ461TPygUOFFpucpm9ekjMf5G+2Rr2S?=
 =?us-ascii?Q?5K9cNx9Pzzc0X1YKyGmIg2oWGZxqFYGP3qAVUwpSJ7rqYHOWYiEb8of3Nhwm?=
 =?us-ascii?Q?tVApXU13r73Hq43rftsp4wndyhdggBzc0LQwm1xF6vBip4E3KxvQXel+zqt9?=
 =?us-ascii?Q?zEJQKDy8kbSMgCCeBVSzaVqyhNIDXuH3/g1LS2u2CWlGe1+UVxlWYhDeW30a?=
 =?us-ascii?Q?MJFgCKOViTYHXPS/7HGBTXkct3b0bj1ksr76QWZWsw+RRaRhvoK2itiaZ/gU?=
 =?us-ascii?Q?cTHVX6cDwKLCceqe/abuhBIibLaGxdA89Sd7wrULW0IXOBEKxZP+XQ+FberZ?=
 =?us-ascii?Q?ODjGgQjKDhP/U4BQ3DfNq1pczmK/gMxQpcpS+DzcEsU8WFSBkFmDcGNMnBMM?=
 =?us-ascii?Q?HFGOm4Hua9cvsF0ipQxvE6lLtJrapciGDBZqETO8dOVOuTV3nMGiJwG6ENRU?=
 =?us-ascii?Q?1J6r1kmMd8SoOd4XNwuoet/qr8oftOGhz6GkVWHI77Ugd7Bi0Doc9W7AlQJs?=
 =?us-ascii?Q?L1i2ZUzyhpTUa1wjZQ7NQFkgIpnNAbdsb8u0m4E0jVAEldNcGQYr1l0DJikU?=
 =?us-ascii?Q?oB5bjWx6eccVrdRkCMs7Xzhl+k4VfJHi+wRYoPtgGhwvi5n/8f0V3uyXDbgH?=
 =?us-ascii?Q?pA0hHqgnXw=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	K1kUWzgP1lkfHF7wqgiL7ekbv59FJ5bZfgszHhDmHQJVhsD994cyLKocgwAnPD3IJZXH2r4zsU6mCs+aJDPr/zBXNKOut5FGetGSHR1JcW62qssiF+5mXzG7pSP44gl1DycARSqR1HjHZfEvRoiq/g+TdRRPxPOwLj9bjSqew1btwYfyjnocDnCO6sRFtSmNaSigA0Rh4kLtxPsRSG0D4AqFA4SmkjCLjLulSmFyUaijhNTuucMPF6JaZj4girujkkDgcjNqIvlSxm6RCVr+kmkDDl3COvq9KytXXoCJN/Vz5rSYT6HWJHSEmf+xFZSACSe3JtcjlUkF1bYzbRwblA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RpIG0yFRYh49BucVfXvKrekCLgRtplm2PhYHMwwyOPmM8ry3F5aVPPHHaEKR75hi9+W1IrZZffFAZiCIbWzoZ8PdiVlGrFenlr+RcLMRisCL18/R43d3cVZiMB5WQgczVrbGyGziJG8pUt4hl21DdIDnfnogU3k/nosUSwT0ZjDcbBsbfVFOgx4VZjKrF2VAu2KJIwFjiVU1X2Ryuhnm0kCAatNsiRKP7F1jKW+VJcvs9RpINNdmrRgH4B2U6J+yqn/DU0I0O1la6xDS8mAepBda2+K4vCORIgmStRjNy6wEXp4XLzFtf2+XHNsoxHCWWFtbAebOdpv9Gn2m6aNcgUsYEV8IErV69Ms0nK6W/d64pZ2HM8bmqf3AAmZb5iR0VTShTTCaKK3SYxhdtV0qUas8FiUeHD1LQBwqr/9WPN/N5mKC63MMDK9fc6zmg41dtRceyW4NbdRWDDzqZW+t/aj8Jj+fnoeXQko3MMN2YBmtAW0ui+y3hxkYpE8jCKPwl6zo/21orJzJk/6yu+l/eH9klxGhiUjMsXHpjtUPdDbusTsYkyQyG+35rUknaGlMPXs/Q3OjTu/DzYbR3/CO9qYSr49zD6/BFb9ZUr0F3E8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd76cb6b-e364-457a-d172-08df3ce84c1e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:00:51.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npC/db/uwX6kT2I5aA87SopbFhgKoE7E1BkTkoTxVJVPcRTZIw85eUvpG5GvYJvkI6oHu+UdG5ZQ7yYbxWt9Wk+l98guceZTFbHz8Sz1Oxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5553
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070063
X-Proofpoint-GUID: oBHGocqOYhzLhGtfALnfeAUt56Hf1184
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfX1AHNZ8veCIBz
 V0kOO72sY2yg7FkkywRixuDhRznfWdTHRaxNc5TDBdvoSTi3citDQ5GfxwAPf/aUoiiJTIIo6VA
 +blbIaCX1csDaDCfO/xNRWAx7L6gHYlSGB/3EIvdX9kwdJlaJRTno6ROLsMoN7CzqhQZxP5N/PZ
 zaz+7YfW/C0kf9UCO0sKo9B01rCd6erJO3P46WM4iCPL6RRktik+F/+4Q5h3fxbN9nctxdpHJRV
 sRTT77yaY3Z3j3kdTBNgHqkOksHk2yiEooP7D5lyn4BC26MRoDIXZgJ+E+m1+LdbWacgC9u3POs
 99RddpqVnWf0sv3N/E8v6ChNwK4wrK548YM+8JYURyqwaDzet3hQEHeaCy3Yl3kMCl2/sewUV7c
 FfoP3Q1KZQyGaVyLOheEdPMRRei1M9Wjb+0Wf1F/d2WNZSN58o6pALAY1OGdLRNPs7do/PN8dwx
 XjDvXCNZBkHNEHYxnwVOM8KTNSO+/qzoIZRs8D5w=
X-Proofpoint-ORIG-GUID: oBHGocqOYhzLhGtfALnfeAUt56Hf1184
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA2MyBTYWx0ZWRfXwRmg64B6pQEj
 2262aiNA4540yX3H2e/B9UmyAOpvHbzeCaRP4IDnkyJ1748GXx5DCAmXnO2CDRdQVzPcz4878ox
 cQLiyxsmKiNVEHK1nJAvWN8sJ9oWkPCxa5Kjw7wm/QW4XjY1MiX6
X-Authority-Analysis: v=2.4 cv=EZVd0/mC c=1 sm=1 tr=0 ts=6aef4b36 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=zvZzGT8K-0DiNL7FIF4A:9
 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12101

On Fri, Nov 06, 2026 at 12:59:41PM +0000, Nix wrote:
> On 30 Oct 2026, Kris Van Hees outgrape:
> 
> > ---
> >  libdtrace/dt_btf.c               | 79 ++++++++++++++++++++++++++++++--
> >  libdtrace/dt_impl.h              |  1 +
> >  libdtrace/dt_open.c              |  1 +
> >  test/triggers/module-discovery.c | 11 +++++
> >  4 files changed, 88 insertions(+), 4 deletions(-)
> >
> > diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> > index 617b0128..727e5f54 100644
> > --- a/libdtrace/dt_btf.c
> > +++ b/libdtrace/dt_btf.c
> > @@ -1479,17 +1479,67 @@ dt_btf_lookup_name_kind(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name,
> >  	return id;
> >  }
> >  
> > +/*
> > + * Retain a descriptor as well as the ID: otherwise an unloaded object's ID
> > + * could be reused and a later enumeration could mistake it for a cached one.
> > + * Only IDs assigned to modules are retained, bounding descriptor use by the
> > + * number of modules discovered by this handle.
> > + */
> 
> I suppose just not reusing IDs in general, and having them only
> increment, would end up using too many? (I can't remember under what
> circumstances they're reused, but I didn't think it was *common*.)

The thing is that we have no control over the IDs...  They are provided
by the BTF subsystem, and we should not make any assumptions about them
in terms of wether they could be reused or not.

> How it interacts with the earlier change to never remove dt_modules when
> their corresponding kernel module is unloaded is unclear to me -- is
> this the bit that ensures that an unloaded module never gets reused (and
> instead we load a new one if the module is reloaded into the kernel), or
> what?

This really has to do with the way the BTF subsystem handles modules and
associates IDs with them.  OUr own view of modules is independent from
that.
