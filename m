Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103871C75F9
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 11:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769922; cv=fail; b=ZDj1nuVHJCPhNPxh/K12rO9x5OnQ80Wri596v3IkYeNiGKbcqlQsPDIAaeGQqN42dvuqwBsN+Tyiy6taazS/+niYiMWp+os2bE0AXZTvXqKC5Xhp3RfVlDp9BU+SaN8ioe3yAMdIpibi503IdH2qph6A5DE1iopV0RIrWhV+hGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769922; c=relaxed/simple;
	bh=xymR/rjdl4qu1LInGbHRVTEKyFiT+g5k+YunNABLoqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aYOSNTrrD+6B/tGz4938ZTtyhmmePWsO52JF27ICno9KQN7p7/B+71I8CCfLSkgbR17qH7CnVI878EUyPGavtu5EzrSNliDhMs74IWEJCqQ6cDkvkLotyCpyRo2HEjHwK2eheOoq3hXi1zoJ0M+6ZfLJKI2YdpZWCnZK/7cuiEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HgurANfv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BxhB5QJi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HgurANfv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BxhB5QJi"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O2gAkL030658;
	Thu, 24 Oct 2024 11:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=2OHJGHyjZe+IZWZiYxK3+zhVGY7cvTMdrsFuIjtLJUE=; b=
	HgurANfvjSIzKig/OfzsZz2DpnMdJpjJIYHWovQEvmuHGe4Ptv5fipdX1pLcFoRk
	D9iIqR8FmyEpCeBU8jEu7O+Q1Npio4n1Fej0F8ln/AF+nWQc4eBk15NH8ANC48L8
	TWAe3UpGLbJrx0m+K+tja+VhnUoYMavckK9DStKjtKHZHeyqNc5B4cU1YbQIx41K
	vd160CsqkleEZjS74wwWRNFWiOHJfwsZb0g3SKfwkE+Xz2Tg9As2jkf6s+8A3/77
	an5fYnfhsafoJC54TY9riOKKnMVk8vj1QKd9jNKMsun3jfbfv5q9hDDiqK2r+3Kh
	yoHxPs9II4WoWIEyg1MbNA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asjbyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OAUPNl027356;
	Thu, 24 Oct 2024 11:38:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh45ych-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 11:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ud/wjwRO1GH34RWFIFbtWAHmKnvroynjDz3KZC+SUUTZ1RR0Mx0QNMaZYd7Dw2GmKEUQWBVh7vhD7kVLH/lwl+zSiiWUm92dsJH7OScMXwo3Ff3hRQ7ezIonOBsQDCiJSBBEwcDkNhk+QSSRmfEH8kWuavKg62foIdC2OKmUqxHKiikb09oSQYzIHT63hewGUQiN0lVFfXr/UXw1tLw7Pel/mY6yq6YL9fP4c3KeZXPYveN9iIMnw8a6bmd5aROZv12KIjqf9+zDLwIjN3dAElMq8636tCPe5xcqCc79x+K2bbAhl8tW3HGXGMahw90hKEhiAqyNCgnzDL10J6SjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OHJGHyjZe+IZWZiYxK3+zhVGY7cvTMdrsFuIjtLJUE=;
 b=QJeDDDwwU+VPMpG2ZUg9Q57jXMnmFJ4vD69D7JeriRXRDvQl/aKQ7g02k4gvWv6KJnWauOulSzDiEvX1ZOATb3o+Y6sRenl137iSdV+I2c6EEg4ZyVtSjPr3lb/KozIVFnkyXSSe+m0L68vSNBpSohIho8UlRFuP2YeGvW8wiw8kx0SfXUsjAsUn8nA+nHLB4x856nygxYs9bf/LVLJO7pH7eOXEpmG/MAygXxNKwxWfsw/h+fGix9eG7cRf9acv093bqCmz5fekKX4ONFSfFmXcul7rBNCb76IjQhrBmhUZUmcoktRUfcItgd+ljWLeDDHcDJ9Ewc4wa7x4fXQR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OHJGHyjZe+IZWZiYxK3+zhVGY7cvTMdrsFuIjtLJUE=;
 b=BxhB5QJismNOG/9SHUhaT3mOKl3vb3v4+41wLlDAFGWHRY+Dl34DU369H/abC1sb6b6H5H5aEh+9qZx3UbFNmBLCZ48FBZjokBriS6KumaN59zQ99d9tqe8BrcigKdTZAXz7TYsyzjFqErwxab3bJObytu12+dry3feYPP3Y5cI=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:38:12 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 11:38:12 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: sam@gentoo.org
Subject: [PATCH 05/14] probe: get the size of the hash-lookup key right
Date: Thu, 24 Oct 2024 12:37:49 +0100
Message-ID: <20241024113758.182050-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241024113758.182050-1-nick.alcock@oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0594.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::23) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f7cf34-5242-49ce-b589-08dcf420574b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lp9Cr+ibXcGxcAWyvfO/FuHtmDvLJa9MOZHde2Qwa5barFE5rkhGsrypVEcY?=
 =?us-ascii?Q?dA9+9yMiIzjhJoChdV5nAUorfeJS8wtWsG57qwCYJoQCICRuvw6Mv3wzgebF?=
 =?us-ascii?Q?eVqO9nc/prFmRWzOfyW+39MVkprM6I0BLloMWUepZjOw1QDB0Rfht7X+YVKB?=
 =?us-ascii?Q?quujCKe45OmVoWYIxSzJHLAHWhUc7H6bkg9E7n5b1t5/vUQLfLk1L0fLu+4n?=
 =?us-ascii?Q?yzjHTzHq6r0MKvL0G91++ddk/9agWHZhF4WKnRY4Eq2jpqDfQzPmO8zXj3ss?=
 =?us-ascii?Q?qrxh8IHDnOBxeyuCNBikszBUPJPvkRm49GfXV4EOk0zbuSzAQkni414pbJGq?=
 =?us-ascii?Q?q40SrpeC+HuoAB+QeBWtCkW2gFYE+S0U/1+wjcnKDTUh1VyzEm4AE8CqWXN0?=
 =?us-ascii?Q?+lAcwgr9jRMRSqxDVXzqljWzReKDAtlnKiJC98rvjYnOUwxKsPDiKGgNaeud?=
 =?us-ascii?Q?2JmmK19xQgLtlgmVOj0QzS+T1N4GTlnMl/y4wcK+PAMUF+KYezB2cXtTRsU1?=
 =?us-ascii?Q?SvBsSq8Uy7Wkq6Ggn82Zl6EEYqOG4xyShs8fxH+wEjtL6y4tqNOcCbEog4bj?=
 =?us-ascii?Q?oo/MA4C5kWtu6sn2rDPlY1MdoxxHINL3oWHxUEuE1rDfV1EtAIvljYlyMs3C?=
 =?us-ascii?Q?AjM46YUHwuZm5FqRKO2x+PRVfE0Wg7j+s5alj+PwCtR3T8JsKQ9I57OiNhQm?=
 =?us-ascii?Q?Ez3dVSVIj5EtsCAsQGVA5vZ54H569Yg0/ipTPqdAzAIoci8ymKvFZNKvSG4g?=
 =?us-ascii?Q?gr+Hrz7CNe8HtX4PiV8kmO+lOblXjq48AI0F7tZxOXNt/AWWMOE5gULT+b8u?=
 =?us-ascii?Q?5bVF7n4QEeNpod/LYANBfZiGZqd2+sMcjoOuWAEmNjewHNx1JSZ3qc+Kq+hw?=
 =?us-ascii?Q?hprQLdNac5eFhP7SIePVag41wJrkOVVuTauudOBQODKigaZ6GG1ILMGPJao0?=
 =?us-ascii?Q?HYz9QrEaLPMKXxSMMnQSuaE7gUxbSxYZ7ByDw2v1p/5amoGn2WvZiG9WahmJ?=
 =?us-ascii?Q?ndHqBsmxT4j7qwjnwh5XvkMG+IA7AQ6c4cOdGQDIJfmAh9dMpnWW65ljZtel?=
 =?us-ascii?Q?Li70xlKhSnNZqLxFsyTSbf/qQUhFTJwybIYnJ+Du3ocZxIjoj05WF8NfdJVL?=
 =?us-ascii?Q?Bv8ti+e7paWJZEke2vaEpGBzx3BkIr8pMfDrwg+orqHpcC6njB7gvMuyXztt?=
 =?us-ascii?Q?FlXpTDCAsB5ISmfjxGBx3FCFXxJXqqrO9pTBFxGBNOaiw24JG9KJJ+F9VLQA?=
 =?us-ascii?Q?Pz+VCKHv9eEVpvoGnCZK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DadElcQhTR4Me3tpOhwP5EtZDYZwN2PAmUlzaw8wia+ObcEGb/sE9IjDiqHc?=
 =?us-ascii?Q?u0wgwNByZxz0OeOfbR76s+KjzQ440TJ5LXpREQM/5NvYXY2ZcBIn0JWBbvLA?=
 =?us-ascii?Q?zI6brP1KY2blZLBRz+ugoSV/lCYvSUsO8RmqNEetNFnRuB+p1cjmGH2r+/Ht?=
 =?us-ascii?Q?t2L/Y/bZMTpsB08ziCiMZqAeAobJkfmvGfQ5R35a6RJVzfdAStNkuVhGfJnR?=
 =?us-ascii?Q?rDyhjgOZ3gc8iH6o5XFZtGl/rZdaG9Emqr64QqAOG5bxLAXvHxguGryUKXBU?=
 =?us-ascii?Q?OcpplOb5TjlPwpaLFirWoRT7MfRyG8BM6ugMevl2sMdxHKEgZFpGlFWVB0Ve?=
 =?us-ascii?Q?8WdvsfmsC6WQKEvkpPZOp2QGjjvoEGwIxYBBTI/5Yr4XXxNvsTe5qdmFZE8s?=
 =?us-ascii?Q?y8WIewvnmiEvidSTs0wgqQBDQt83Jo1lp0OTgp9J3Jd5gAVAqxRUJwfyF+gF?=
 =?us-ascii?Q?uM06nKANq1xSauZMLap5uxJSPKUgGUt1iU5OiR+4VhmsxBmVkxvOmTNe2kKs?=
 =?us-ascii?Q?xDoxuFMlkqWYIWwKSxojiravQXodNPXEgvxbWxXzeosnrN+5CGUz467fYCId?=
 =?us-ascii?Q?tDjw+d9u3dRC2nv/jl5H9Vcmbfha3ikNQo3lB2DjOLbBTNoEVq0HsQ2uwFzm?=
 =?us-ascii?Q?SnrxBk9Bog8WjitflUAA1UdAqn/TzFge+EFGif//2wGSXdYZSK642ob5BotH?=
 =?us-ascii?Q?9UepVimoyzoqmLlSdnAd3TRHTqC1demcmGMMirNSOIySkvEMAurZr/E6Gk3f?=
 =?us-ascii?Q?/Ofc7c//zN0W2anvZ6PrO6RUMqT9mMC2dLZ75TyxIutOyMz8l++A5e7voazQ?=
 =?us-ascii?Q?5QPN7uaoKgmWeGGG1+G4rhEK1auvn+3oLMSwc+VuL4A3/nzpW+wKd35/xpOx?=
 =?us-ascii?Q?mNTd5XP0TeCl6w7ocPZLpH8xAy0uQbGDDr7agQl+MEo9veuKTKZjW2c2+8qu?=
 =?us-ascii?Q?ht8HgkiUGAgDbEcG6fE/nBDweCry4q2W2vZL2iehCLnKXRbNpo6YHV2g36+2?=
 =?us-ascii?Q?tZcv9EV2JvIBLyZQj/Cdr9KrCw+ZOKQu+KLVTo2QT0DAHbNI1IJpGKt8qIh2?=
 =?us-ascii?Q?OtzeCp1btKhpkQyh61tdEDi9DBk6mFEv5X5wJgx1wn7gTwizeEodGCcrzv/n?=
 =?us-ascii?Q?+RoUINUn1B/4DwtsJPzVUAIXd2zGjjFl+/5MRHr5RPHSzmhdaeuxUw+Y9Uxl?=
 =?us-ascii?Q?yW1YQ2KfJv8ulPGa4pXTeSMFTTycjvCce0YoAy41zIhBPETfoYTBVBPCRC7C?=
 =?us-ascii?Q?bfF/U+VjZ6PqVxDvnwfrI3jhZMGtKnjMnJSt3R8S2Cj8+gfrHCfDK6fbXX/F?=
 =?us-ascii?Q?J99Tq2oiav+8Q+LjK96AMUUpKDEU7VqKnKJ6IezmM0Lmki72bR0Y1XtOEnek?=
 =?us-ascii?Q?OvgQ7BxB7e7NSe7s/2P+//+wLFYNzRy56h59UKeRJAI09yrGl8aJ+J6Y/3St?=
 =?us-ascii?Q?0ucCEu10dnexvP8i6xUVjUHvDlFPTe0QRPqtT3C+T2mpEBgi+s8mFWtPHTg7?=
 =?us-ascii?Q?w/9tWMJAzP9E/9UeqqCBWJSXyqQfovqyDpv9OBo5yawdPKdCPM+WBekuYCoh?=
 =?us-ascii?Q?Ud18PXGSk/6EF6ak/iuMB69mxh1nWMu7ANhg0Qx0FUv8tGYXG15OOfO9FiJT?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0RXKL1tEPrpY5PRfyGtI6K5Gue5TxNEcY2QWzkB8acXVOWKAfmI76W339u/A7Z8erMIJaNlUcwybw+/8cYo0eL49cRVoGafqHeWnDKD5g9ynmZLonHMsGmAK/nxUNjdyG2B4yWR6JvCYhTsEaBqnrThQPoA5ADo67Kl9U7OY0EnyGT+cUj/JgUUTPkouuiyqp8oiXJJ420ZGxuHukaMV5vKuAX/G2D7kcrNX+oB0Id8kSrfSnbyTHrRhNG0N8pU/m2lN3d71Z/DMGh84sWXsAUFu1RwecfYpTZl3zZi6K7E1rVimYCVPIVsZ62OXfp2LqMD27wlk4GOBZdbJPPpEFjJznPzeXeKdZfr3gc3HCk4Mm5d2S1PVkSpv8pYqAB3kmiusdFciQs9mJlh894CmvHvSUlppDwTE7JR0cMBG6Jw0kmCa1EYHroDdje0jMEOVyDuYGTnsw1TtM3gaa7Wr9DvVvgvKz87xQkKnq10KcKOWG/L3ma6WM6rbzU9fGafzLhASQ7WWROaPANlLCgsbLA5X2657vBUBa9rJk48TEsdJVhzm1MgbfMUwNCS8gX/oYybFv/nZ/UJAPB3kKiC208vyxj2/zlYKxRHUsjGYLtI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f7cf34-5242-49ce-b589-08dcf420574b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:38:12.1257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZqY56mnBemBZ5NhZFCCwQw+XcC7CPmYgD4xIYBMHjJ+aQJbIUgqVUnOAtLMg0AScAINOGcLkdmWsXOQLvwFMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_11,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240095
X-Proofpoint-GUID: NE8FIJn3ZAIGXu24uf4GoC6exJxuV9Zi
X-Proofpoint-ORIG-GUID: NE8FIJn3ZAIGXu24uf4GoC6exJxuV9Zi

This was allocated with alloca() but then snprintf()ed with a size of
INT_MAX.  This makes _FORTIFY_SOURCE rightly unhappy.

Passing in the size we actually allocated is trivial.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Bug: https://github.com/oracle/dtrace-utils/issues/78
---
 libdtrace/dt_probe.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 686e2a661253..bb1773ee60d4 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -180,9 +180,9 @@ dt_probe_keylen(const dtrace_probedesc_t *pdp)
 }
 
 static char *
-dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
+dt_probe_key(const dtrace_probedesc_t *pdp, char *s, size_t len)
 {
-	snprintf(s, INT_MAX, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
+	snprintf(s, len, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
 	return s;
 }
 
@@ -204,7 +204,7 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
 		return NULL; /* dt_errno is set for us */
 
 	keylen = dt_probe_keylen(&pd);
-	key = dt_probe_key(&pd, alloca(keylen));
+	key = dt_probe_key(&pd, alloca(keylen), keylen);
 
 	/*
 	 * If the probe is already declared, then return the dt_probe_t from
-- 
2.46.0.278.g36e3a12567

