Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4FD215C6F
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729889348; cv=fail; b=aAyFEuaFVVC/M/CgdW+64bftW6LGcgc/6OOhW3UothtXUTUh4G2TJ85FLWxKsAPV50Iez3tbmE1gz2f6o0EACYCSzkp6qGaQ7QWvB5zDgX7RGW1Bp0ujkeGS1Y9PuznhOTYzuCdwP4+SjYMoBFnISApBtcpSvAQZg8krdhweXXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729889348; c=relaxed/simple;
	bh=BfuQfw/3k7PJP2YWejCraSkcz+pL1sAiJ/q847t3k6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GAQx2YbRf940qszmI9aBdx9J28/hEC6phbPzgUXxkpUq1rnui3p1Sw3/oq82pKDGoR8awTuSknStILXKI5LUW1/B+rG+ln7nbnGh7x3RRqPisx6CrrI5KYKp8lgNz6na73FPwcjCx4q2gjgN0PLJMhwzeSWUWBt3uCoGRdf0m2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Gw3U1mrY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wRjuJuMp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Gw3U1mrY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wRjuJuMp"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdTDU007212
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vT8+FAous6WEQHsGxv
	0QFJ7XlcLGUQ6PJpnFuA9VS70=; b=Gw3U1mrYIan3vK83ZhfpBD9gNIDxMRGQbN
	B2pnBT0CFYJ2bPHk5ngMi22YXClecVSqruwvTR1RftjVHGqvTksY9B/5eh0/lSit
	r5l6DOzJZL6a7CWGTtoOirW4lK5FbUYv7aw2LvVmAnJ44JMpNDZlIHYwbnYFIzMg
	iN/sFy2myqaEM64sArIE0h2zROsy1F4i7Ou85qDlRC8zAtLlyA/HNcgC1C5t6nsj
	iKTgyFGxqlE+h0lxQ8BOdGMy9IeSFRRrxguqmamhugrcmHehwV/VLkcZfUE/Dt5a
	SR1+YwKr2bhsqgcsdWbMhZqe5fJcCUNy8Pq4uMwFUPyNMgPo0TgA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uwvcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:49:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJQEGN016482
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:49:04 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emheb89h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+e3AVo4M/O/B6CMla+VVP0Hk1BbagS4GjGdkSqantGlnPTXSMYyCy75LYmMULJF5Ekk+Lo3QDowjgGuSX6SRVe8Iwf/jx/n3mZp1UIXJNMyfFaZmqKarPqNdEHK0LjUkP8Ff+2YmwaJ/AffouXct7+v385kjOGeDfEYfpt0DbH/FXOneQcUPDR7D8YuhTgPMnpVs7rFl/6gNDUawdz6Cq7RlTbfoNs7BWsEsdkghv3miGbuTQfWI0B4j3dnWdX3OOb3YkLYUGxncn9XPhdocE6cdzRh122Q4Vt0WNrryh+g+59ZLgFFyQemsi2y9E6P8HzUY7U3QvDXAJ+OxmN81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vT8+FAous6WEQHsGxv0QFJ7XlcLGUQ6PJpnFuA9VS70=;
 b=cFkIlRdgryk82rNhQh94mjKfuASMbz7ayzJ7Z7VUiy5IVI3GHgyE4w370S6+VXOWMpYv9GpU6rfix3IPBmnB61KvAi31mSOhy0c9IHiZiFtvw+a/M2KlSnag58LF10Tc1uJlx+Cl/bnWhlnu6f5aUyyMHswSLr6sEjOEvfLAJ8YrSzRHIegLCzPIbJ3jfFy6qAjBtjf2IUxsA5UTnr6wj0yU7ALfmsQvy/6D9EXJopF/g49ds5tcWrzA/BM7TL0BJHuZpfpuFFqfXcskRaW5/T4pZ5jL0r3PZIgxoruHaqRFEjFMUDyTZ0KZQkGfDAN0xPr3GO4CIy7Z1oDSPowxWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vT8+FAous6WEQHsGxv0QFJ7XlcLGUQ6PJpnFuA9VS70=;
 b=wRjuJuMpMfgZT8SgYN15tOOeh9tLrFRT6MJHLlx+U+RiR80EuM86iyvO/0JGwq6QPp9gbZZYNtDp1TaCeuPVYdDCgmyAb9yEBnF9+Y+DjklpQ5mKeG3mqyf2rl0ToyaoCi7Y5HEAEuinOtqrWUsYmpUBp3bpacQV/h3efawVL08=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB6726.namprd10.prod.outlook.com (2603:10b6:8:139::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Fri, 25 Oct
 2024 20:49:01 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 20:49:01 +0000
Date: Fri, 25 Oct 2024 16:48:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/6] test: Correct long-standing dt_flags typo
Message-ID: <ZxwEO0vlORreviPk@kvh-deb-bpf.us.oracle.com>
References: <20240928022158.9206-1-eugene.loh@oracle.com>
 <20240928022158.9206-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240928022158.9206-2-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::11) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf7a71b-7cf5-427b-a050-08dcf53674c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kAzFZm1zCg2MeY51zL+Mo1ORzRqmV9PdUR/XKQkePZcS7RQtj5k4EPCCsT9e?=
 =?us-ascii?Q?cFJbSO8vj6THNSHXlCnOEt/MTViUbr7uVlocUMo/xuI/MGANUiRwu0nLd3gQ?=
 =?us-ascii?Q?2ba2QXI2AhkYoVp+8VhXBLpECfD4/Bk4OiulYS8aokOKXf7GURRPp/vRTrBB?=
 =?us-ascii?Q?2Cbi82Q2ceZVV4PqETIDOyuUpZ7MbIr7OYyuCgKUCYS1fGqVzreLYepd9IkT?=
 =?us-ascii?Q?P4uD1XcbLXoCniORhmtzqtkoPdDfMYG3A0WYbgUTSpOv2p8cjnAmWk3hyLBw?=
 =?us-ascii?Q?p7T/ov2W48L6cmjO4Nmv6aZLhnh5R8OY6/6WKWh4cJ9VXriWbIoZ3bugsgzh?=
 =?us-ascii?Q?Kd57axrfw/W0b//BMIUf5qISHFlbugpTBIPZhmVi9++3gFoRtZobkPXeo2ub?=
 =?us-ascii?Q?/Wl9N4+NhhHYYTutmnv6mu2XFZnKw46ZJFN7OxhbHMeChSP7MoesKkIpfpGF?=
 =?us-ascii?Q?+bvz+WRd9g9CjXfptBz4W8b4PL96O9uXOVzzORx1cCrn0ko/aZR9hx8WEMFc?=
 =?us-ascii?Q?p4u7tkeqlX6Yzkg4IkouL3yQJ1W5kG/ZijZSOOa+WirqJL2uYJ5LJk1L9TMn?=
 =?us-ascii?Q?GYTxqF5rGN6e41x9pJUcSxdgx419OZQl6vkN5m2tbC71bPmsLjCbSwKDK2Lc?=
 =?us-ascii?Q?uar6Z7I/t40+mtXgISJaseOBCAuxDcJSYm67NKsLdMuwVKMhQKHT6S4yaQEQ?=
 =?us-ascii?Q?qj7b1M11h6ExffkwvRrznIVIuEzqBMdUxBxUl59r2QWldOeeV9LTDQJgMmhF?=
 =?us-ascii?Q?2aKMRVp5R857z6XGlPheDI+OH1YnXJ1LBB3BbX/+1YQ0p/AsFfwsOVLipNB7?=
 =?us-ascii?Q?TYoSnKbxGNhuAnL1UijfpCZIULQdG3ZGZMPnduH58WJk6TVax8efCqHGUdrj?=
 =?us-ascii?Q?LEpmeesReSejdgZhqAiP/GVPVCeShyL7khUDJw6uHQLghxXM2eV9QHehKFoh?=
 =?us-ascii?Q?hyobwDqH6EBUsidFOy92i/N6e0MACdPrEptel7mZqOFeOPBVxl9AkvRMeKbZ?=
 =?us-ascii?Q?rPAc5QheGIqKzlCECQOxPKcl0bQXpzfZaytN6ehaGGqGDuV3PMitUYpbeqAW?=
 =?us-ascii?Q?dUDol/tJR+W9rg0cxLAHDM/QAhzhzR7lus98N2PEozSDrO6ANQ3fd5bNeFA1?=
 =?us-ascii?Q?t31/IyQGo3AhE8l1Ss3ozap2YwQVMsCiNtBks2Bd23uFdTKWIGU7UJ99SvNT?=
 =?us-ascii?Q?n95758ymwUMKWwdIMfahPqhzGlJHS8/WeMmrCaN5qwFT11gKo2W4hkahes7G?=
 =?us-ascii?Q?ni2Yko3jSC7tuW6yi4cmLpZY1DVsGSNRdCmvjGyTEaq0F6f+YqQBp350EG2l?=
 =?us-ascii?Q?L5iztY+8KeehAZmBwXka4e2X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c2PjQ5KbSeFoxMc5Fi2LKX/VYCkO6XPz6i9E/HoOtt7iSKSKLUy7aBXncIpb?=
 =?us-ascii?Q?BVKi1RreAlIvhsl/T+9RZWC+dApptBubp0T5My7TL4JKg3Pyp3TOdy2pUzvb?=
 =?us-ascii?Q?nypRJQRdnYsKoEAm2QZF/LUjc4b0dKwtGUxCyHUNMwh/6aC0kL16w+1Nb3EM?=
 =?us-ascii?Q?kyG8nhNg1KDpHLVWpaZ7UXguBS7C1CdrAx4Nd/jGLRfbo9ny2P1hYBaNlfnG?=
 =?us-ascii?Q?ToC7cMeIQd39VDNhqp/P02Pd42rtz2eBv/5m24TLA2hDUtVc8iqbPA/xQdAC?=
 =?us-ascii?Q?/ey0XvTPEI5oXyyXwi4b+51Dke7dQUlpZnoP9jiR6quhsZn8OPu9Bu2jzPi1?=
 =?us-ascii?Q?2SLvZ/zeR0xoyn1rcoUXfzE03yr4xfeYgARCaVoNhB0eZlAFTizRXhrVg/Cj?=
 =?us-ascii?Q?2kKQVbwbP9Sp/5iu2CUovQ9+yJcG5qze7GMBN/5GJvmZ/jpA5vHnvbNZQqDZ?=
 =?us-ascii?Q?gniTrANew0TXWlCyO+2nqqCweNm7M3y7SadNGgkKXhf86vv8GINIHXJFVyk7?=
 =?us-ascii?Q?voRwn3k1/zDMZLxS4K+i5469TIjQjqLm7m9FGQt0Lcyn5jUall3HRnzY9PME?=
 =?us-ascii?Q?gXGS63P+XPb6R2o1aNMhLLcAFuaJIGPmNqjijdM3HI5vad6yd6+QygYUCEQB?=
 =?us-ascii?Q?qz/y3wGzF4r478v/4RKaRkVhZQLVOjROpdx41dAAo8nOXtDwuqoi5Uj5TjU/?=
 =?us-ascii?Q?H0TlXn150y+IdUdUPvwO52lMMBMyt9ONs6E9reqMSLAy1x5nUbVEDXbsTL5r?=
 =?us-ascii?Q?J9PrXMtkMSWoA9ZQgpo6OJBwN8lmC5J22xHGUzU6HAQI3/Xd8UU6up5J+nuq?=
 =?us-ascii?Q?v4sP07+uIA3E2wVO5l8bAyXj1FP+JxOOQDvu2QYpLecAUfdErmETc0/3F6Dw?=
 =?us-ascii?Q?rJ0JQd6L/yMRjE7RuC1d1g0tX7eVpRZdHbSkc1k1/qN8xFZYs/PNr7h1u0W4?=
 =?us-ascii?Q?cBt7L+HMNUO2INQnzLAMlaOt6OEV/HkhuS55glr5lnbGYmDT/pInz0eNmPey?=
 =?us-ascii?Q?8QuccGoO8y2oe/yBe6E7PY60dQrNvri9JB2AjsflbSI56FOsdF2+Q+yVlo+Y?=
 =?us-ascii?Q?36G7ElbfB1wne3d/5Z2gTuP294m0sVoteLm93M2vUQQi3Y2TL6ZXeTA8EzV3?=
 =?us-ascii?Q?2Q70lQ/jxynDppZviNy7o/AKBHi0g8EWOI1Yp3UXsab2lzffDkAk15bhoBb/?=
 =?us-ascii?Q?M4b6Fnwdag94Nc6Bqc6JM7oJQfcvWioAXQfiLas9X4fNZ1VvFIMpmvCbfABR?=
 =?us-ascii?Q?xV+FFum7kincXFSzB71vOAsulqn1wgK3W6Z0Ghpmaht4IRXYw4txH1FjqaRR?=
 =?us-ascii?Q?KfyWu1pLbEWg4NYNuYvnenGC05zjzIdSMArbJo7GvQTn3TLVqOfVreoZkJnO?=
 =?us-ascii?Q?rOZllxsTgirJ01wKzC3PC7UIDH81IsRc2X0XMZ2mWNPwBJSOmoFLYLg/9suK?=
 =?us-ascii?Q?PI+BnUeGZR40OQsAp8XKByocXA2jg6ZDGEkriX5xaI98CstAvzSnaRNbtjes?=
 =?us-ascii?Q?Mrz3YtYUly0okl7Ln0diBmo2zaYeKTuBJWq4AKB+4Y6pUvvtNVp3PnTUpdlT?=
 =?us-ascii?Q?mPx4o8P5Fj+F0DLxTHoNAsLlzZXjfH8i1GrdPgfGgQa6PUYyXu0g6aTWz6+o?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FrYmEybIsoEMch/Y3SSz/vcMV6QU6J6Tl9opAHroNMagGAD+BJJ4DzEqsJ9OTE6RhElbef2lEP2TC7DyxIU5FHMvxhm378t7YJ8IMuP4LDHZUyiqr77s6cOcmzt2qwR3Qzrm0IHNReB41OG6mIYD3CI6OVma54J3H0BIwT/9lAB8TUnb7ppe6n+sOldudbLF354ss0I3uc8G8SaN0gOD+7ZC/BwkZZZS0aFdCDjWVX0gJ1qv61tdkFPG2ng39k94YRAPiJLjbOeWng9vtcMRo2QLCR/hrCqXiHYGXfFWsJ0ecYUW7P/s6+t9SdpiTOiPz+e6AbrWhLbldn5FMmUMgVqDTg4dUQDe7fpiszbvg7OZeKiPCEcX1mk7K4nfXtY1618S/V4Gt9Cbdm9LMnAm5OrXTsf1ko2ypbJr9dGRl3+6bP+uh8WUhOqIJkkeluKO9tjRHgsCfHnV8Er2GHyxEOHP0VxrkI0v5bJSDrDtMU4B3yGNYCccxQyZkyUu0L6dxn2FFtlx5APglECbB3qy8apnS3spB8rdSO0ZgK5e/hDuMpQEQK0jMjTl2iCRcMER4agXH2MNV7KFLbvpXrEVUjVJLwYv9Ru2CIMKXg3X2uw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf7a71b-7cf5-427b-a050-08dcf53674c1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 20:49:01.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8EVoF84I+tANdkL9gFb6WWFwcnVpzQtOYDMBf7y5N3SUvMYnyvUh+D0ORAQAg/NygCjQKkkU5eNaKC1cl8S9rojMTYK0UvHRI28SbRI/GA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6726
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=991
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250160
X-Proofpoint-GUID: ZP8y05tGlLKlhIOC2NCcaxb-UPiORkhQ
X-Proofpoint-ORIG-GUID: ZP8y05tGlLKlhIOC2NCcaxb-UPiORkhQ

On Fri, Sep 27, 2024 at 10:21:54PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/ip/tst.ipv4localudp.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/ip/tst.ipv4localudp.sh b/test/unittest/ip/tst.ipv4localudp.sh
> index 0e357c3d2..4ee584400 100755
> --- a/test/unittest/ip/tst.ipv4localudp.sh
> +++ b/test/unittest/ip/tst.ipv4localudp.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2008, 2017, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2008, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -33,7 +33,7 @@ fi
>  dtrace=$1
>  testdir="$(dirname $_test)"
>  local=127.0.0.1
> -$dtrace $dt_cflags -c "$testdir/perlping.pl udp $local" -qs /dev/stdin <<EOF
> +$dtrace $dt_flags -c "$testdir/perlping.pl udp $local" -qs /dev/stdin <<EOF
>  BEGIN
>  {
>  	send = receive = 0;
> -- 
> 2.43.5
> 
