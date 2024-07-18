Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8AC6F06D
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721285704; cv=fail; b=Ng7Y7TpyTRihUuDN0zMRPrm7rYhbjuTiZqMfGrSwOv9jb6uvk7jlHBXV9TkRWS8PCi9dZNaDONX+WnlR5piI5ePuFbdEhnfzx5Xyoz63sHKzHyofavsCmJZACLqncJNaA0kfwEvI8zh+DQmIfecW6AlgnhJ4rxj12CZbAd8Q/9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721285704; c=relaxed/simple;
	bh=NZEC0VGnHipwk5dm4EDnsSarnafmHh0hBuAVlk54Yr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k2pF20hHaBUuzyB9xEG1AdIrAdS7EU/x7xjsBCRv8eQuHQS9yIedS1R9QchcPnlmRMwBwrwVfT4VpGihEhuO+H5uThHzERRaBr0j30rLE/54WzCFxswdVoz/3BntNJ1CP+8JsLxNEKAkIQqfkXvBcFk6XWYgknNXVDvFqrRr5uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fXvKmrMM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qzAqiq0n; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fXvKmrMM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qzAqiq0n"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I6fBAo001892
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=i4cek2bSR9vV5XP
	fXjppkwwJftBIYhVc/L6G3a3zIb4=; b=fXvKmrMMC0NtW/SqPCZDy32uTIMNmDt
	Y5B4l1Fk32JOWGww5c+DSWb037XewLBNT1k0rHdHwMoEDJFxGuubiIA9woxco34L
	ELzBsi27k8QJiNwrqfseOa01mFTLcrjWnglfrlebCYR7CW80i9Ce5MUtd67Bifxo
	/uGkmJR7kjNvuqQGqjljle7YMBlGmlCj0sti7GDxgqvwNWfZZv108YMHoOoe/kfA
	4s6WDH0jS9WO1DPI2f79jY8VxwFlVUd5hDm3aaewA3i4iIQ124ySvQSF+qIGZlDY
	awwSlOY3ycnDHA4DoqWg7QqOUSj3L/hlwJCheY9RDOU3wG7CcmoaX9g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40ex01r0jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:55:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46I5iZrL004531
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:54:58 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf01hvd-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:54:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZLf2UFy9iFumK3XDDtEPZyNsi+ZfxLxnND5OZei9ORudaL/Nteq4jUJ7DX4sS64oe0V8yTl9f0w/BTYpvDKAmg2Bkja7QewLXC0V6Clzngivkf5Ukm2C3hj3Wtum2+GN8QYXrYwxCTC5nDmUdAesnncwSxZkQIz6EI/MEZT8S0ip7/TOTXolEXHkqhk50EYDxaG7XYBHKs0DMKi8l6lQ+u4somYCdJqmDmOsN0JC+HEZbR/AMobAl/CGJOpULvnn9J8faPiqkJRlWeU7/8/sPoYAEtuSI/g1m/wOfWiSP58LkL0U+MRVpItnMlRSpBmgfsz27qcQxV9g86uQmXIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4cek2bSR9vV5XPfXjppkwwJftBIYhVc/L6G3a3zIb4=;
 b=uxkibslu7sAK6T0/S8HQMmbhJ4/R1cge3u/o++NQwmIPqHD3v39ZyHfgfRnomEFhXqd6Wv6H9Kbny+V62nojgf3U7ndJTBqKtpp0TzPrK4u8J37vfUCLIj+z0vYGc/erlgU5jvZfqYXj5ga2FzmvunyAglyNL3QdWBE40KlP4yv1krLYKybX7XCihKSr2IbHjd/WocxX7qzJfZW0KuUjq50zK2Ozp8aXIuZ3LmC+r65Ihgw8ztJukQQ3zjRGexFspY5q9lutwL8P71Nl00zPLmIIDZu41gRm/PPZkrMgzC4IlBD9qGlKzoNxyuBwL4DwveQCjr4zTwhkYYoKX766UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4cek2bSR9vV5XPfXjppkwwJftBIYhVc/L6G3a3zIb4=;
 b=qzAqiq0nKk9f2WsGVYpfOosq/qwg8lUimPpHoLiW/VNylWK1av8CHPPVi33mNIK9XlDoUZxmYgkT+bg2okbsX//uy/T++aiQiv5e2WUYrCFkOu317gdO3VVAUmcNjyoEPnwAMdPczmQF2Wtn/6qv9A2mQYWFnzgoEXvQFnaaLU4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN2PR10MB4158.namprd10.prod.outlook.com (2603:10b6:208:198::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 18 Jul
 2024 06:54:56 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 06:54:56 +0000
Date: Thu, 18 Jul 2024 02:54:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 02/38] Move dt_spec_buf_data_t and dt_spec_buf_t into
 dt_consume.c
Message-ID: <Zpi8PvuKB7Hqj460@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:2d::31) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN2PR10MB4158:EE_
X-MS-Office365-Filtering-Correlation-Id: 0922a36a-ad7f-4846-eaad-08dca6f688b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jl6TydRZb3LweCDlvBjbQ3eSs0spTVFX6b8F3/3K5efClKbx9bhluB6nW47Z?=
 =?us-ascii?Q?yf5JoT9hB8fPU222BaKSU9jUivR1VrMkGnPsAQmft3tNX/PI5EUbgysboR7D?=
 =?us-ascii?Q?O9H2jx1ySN0hwx5Rj1NY0RXijgmFgZT48BNx0epqMiu6h+99khwmLc+s5hBA?=
 =?us-ascii?Q?3EbOUA8pNtEUamTAubBm2JTDf1QcDFlV8/y0SZh2n1F2LCE4cD52FMwCFL3H?=
 =?us-ascii?Q?HxQKxGZx6qydTquIV/newlzpG8LBJpmF5SLIN6aTdnD+p3iDpJsuVr9NxrV1?=
 =?us-ascii?Q?rD37gAuvcm0TjICdDDXmH+r20ZsrXUHuvApzIghDCSRK3c/ND2QKzgHmb/P1?=
 =?us-ascii?Q?zwHUJ1MuTQyY1jrFH7jGCermoyv0S0PQz+q0+EbKwP0OMIP2NAYZtFP3ezp6?=
 =?us-ascii?Q?Spp+o751e5wr15UIf9frDgCPt18+iig4UbissZ9JgBAh+vbQzEsbvGNhDCNz?=
 =?us-ascii?Q?KGLDFuR9w1TLSI5yscwu8Rh2cFGcVFikjy8CKjrfHN9jya1ZcBfMnJhGWlU/?=
 =?us-ascii?Q?ukp8ROhYHSqBFm8DGnSBWVnrKzDKvCJaA2i/bOZzb/GeaLnWqbR2z16G1x5L?=
 =?us-ascii?Q?/FuQ5ggvpYUir7gfCVeFXAWYrONCFmJloQsMSa9WQHBidSYW2BytEVC7Cj8B?=
 =?us-ascii?Q?8Nc9anaoQEdHQtxJ6N3Qbc+uP9SVe1VTMZhngiHr6jPW9nBzOrBPUgE69Y4x?=
 =?us-ascii?Q?Xvml+ZY/nuXUJs1M9RLUPqYn7DDLlows6Ybl2s5InzO6OKyeG9126Jmj+uHu?=
 =?us-ascii?Q?iOWnOnMCt270XUH4s7n8W97ynkVhvpp9DWbvM5/KhEOszlUcAmAq1dB7fLVx?=
 =?us-ascii?Q?zgV4PBKk/dANDvZqhvLMNyBkeSuBUOVNM6kCZiZ4GikC8pCFADRGOXNXfMd9?=
 =?us-ascii?Q?+vRZXB7urFfwsyIHyicf+E0dmrgMkzRXJDlsM70YGe/mHkf+FdNt2YdJO+vg?=
 =?us-ascii?Q?JZdIApXsMvdLh7rCJNWomhK7CDhAdui07ZMzs1F7fZvlk+Bpx8D3656+oACo?=
 =?us-ascii?Q?Jw753iY8BGEtnI9D8wfHb0I5xoFrqwmXmbworlBlfczoxIW4CEDzXdL0+OrD?=
 =?us-ascii?Q?ltkAGIUxvcjNKco5yO+Xq8CGKkDbtj1k5zQjAlQL9yKuaKpUVQWEMZelab4x?=
 =?us-ascii?Q?W8ixDmi+HQ9iIHjrPcAieMsVTvNPQ4yJ6lfJMDEAS4c9OFnoYD2FgJ9OK5Kx?=
 =?us-ascii?Q?UpEgTFlr5eUrMsg10lXbKZyxOYvvmQK6Gdi+0suwKSO0DK7BA8Eb72ejUr/5?=
 =?us-ascii?Q?d1Nr5z5PX31zT2bP4k+pL37BBq53JQLrfT7Fu37ug9XKjqUXA/F2QLesBzw0?=
 =?us-ascii?Q?Br45P+Q0wAEfAP7ie0lxyNhp4GrQokPWt/8PGuynBrvGtw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x8hcNOU6fOEc0RXLAPBHTEI1QiNIcmKsQ59L9IHbRPeDmrOCbXwZXI4ZQdel?=
 =?us-ascii?Q?ahT9njlVO3jzvacbADQBzGqf08i3j13shQ5h0kDH7rV6YmUExSkT/SMWx7Gm?=
 =?us-ascii?Q?JNDSuOaHk84lDjSuYeFOgExwfj/5sxLSksWbTfoRfc6C7PLO/pGYSaBtVplq?=
 =?us-ascii?Q?24ykryXHDvR+CoOrNrVXnWSdOh56vCQsANT4u1jN4iHmZx6ry3KFVmOem5AH?=
 =?us-ascii?Q?0lmjfbcRinaExo+0XfmUktxGBUGgZDYfqOPjhbFtx1ftLe5s4PzX4OrMj+q0?=
 =?us-ascii?Q?PuquKLtCDobNHloIBFVftUiHzvcVY5Vtxq60jnrF7QXyAXm3pD897sAQXJiW?=
 =?us-ascii?Q?2dG+Aumn5m/XPy9eNzRTQ99VvovqH1zDfV4bjdGn9Buqu/lcOhFRFFbH4gfF?=
 =?us-ascii?Q?yNHomUjjRtQd+koGurBuCxFCQMaf8SpC3hdAVxnSmcjPIzNghGx/ikmC/oG0?=
 =?us-ascii?Q?a/e11skwh2nHrhzvwJvt25ruOnur0CETcl1jQK3F3ysNHOq+l5wh0Kpj6aN0?=
 =?us-ascii?Q?qdKckPHoHQXkFKAQpjfYHjFaeFqF1YJRaNrdEtGgSyiD7AH+LvRS37yc0KpE?=
 =?us-ascii?Q?W9UwtaafJlpARIA7H6RBHQg0/5/HQQWD4n+u7ZT+0KOKmndpjUOESXmNY9I+?=
 =?us-ascii?Q?CjBbeb+rRsO0930t1l2L6M7c/8ORMtVTRUGb2m1M4o3u5qce9QxXjbOGefzj?=
 =?us-ascii?Q?bqb6SfjikJauymvR2DfindJU2WQqUSVjpgFRv8ozNS0IPAPF2aKyeOgmwDN0?=
 =?us-ascii?Q?BdMGPFWHvO9AfuZfvWbZDRqgetSco61bVEHGm92/IgVqAsuC237KPyGVazQe?=
 =?us-ascii?Q?1CA7o95pMDoBBhU1ST90bHnzE4VB4gaGRMVdhbuPsFO3oORdaLIs1WnfzDrv?=
 =?us-ascii?Q?kZ43MJZ+WAItMhO9zwyQwjNYkGqw5yjzD6OT8YWyvwm9q9aeb3fFDvoINdWN?=
 =?us-ascii?Q?B9rDqEmIs9FUN3MSprSxEdnShgSJQUWZhWdiw+5KHgCJWs+kBZGShCtzyhii?=
 =?us-ascii?Q?ZTbzC4lNadoD15hmU2UdbGk4NOJNLdMyBRkpPG3kq+gbz3QWNACVGEfdw8ZU?=
 =?us-ascii?Q?31tvxsyV7+p9i6lciTyftuUxKUEhy6eYCt3KQEi50GPAnM2LqSsJ+aHgYmaT?=
 =?us-ascii?Q?GOdLhvdIclDXLAqIS7No7dG2jRO1ZTFiRrfnr/59ORuVNlVfz0FACHy2etA3?=
 =?us-ascii?Q?lB7CK6QJDw7/1Hvu6jeJUaUgQq4ma4R1WiZSsMtSsmMCBOizJjLevgS2q6+N?=
 =?us-ascii?Q?z5sny0UE5Snx346fIcgMSrRxWITv671milFuj9Hb/hP0wBwUyJQj4/vZUXS6?=
 =?us-ascii?Q?jTm2Lx9dahv1Y8dVLVEttggVq5cCjqVxvebSJB35Ry7wPZacAV9/UxHzfTus?=
 =?us-ascii?Q?GY8gVItrswxwWBSuC10XLY05MFV9flg+VYHsxKb3FPgCV2YBjpTWZEU2kJWW?=
 =?us-ascii?Q?lYSjy6B0eOvKmsojh2oxL793xpTTNbD4VHvrN2B2VcFdpRcGdnQkHnq9ogSU?=
 =?us-ascii?Q?bCZbwDjQPMxgvF47fBXnOhDrIp2j4qyBO5mo98zwlSaoBxf6LGXVbMdK1kCS?=
 =?us-ascii?Q?bbfIcPOKM7zIhUbWpRTfFdm5QKkwW1qNIeg2rgIuoaGgeU81yxIKckqLfOhz?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	NxAU9RDtrDlanpfJlowANlE9uNlWxYrFX1LxLltWAcp1ItgKYXhHYUpONqEMXyXoxpK17EpVqpK1jSUqG4T5nGmSKADQLFzERtZaHBu+4boWqIOy5Of7u2MdC2iN+rhvJFbV6kgOkA6r37YJs6F4mBdpA2EQB8zIu3ZXMk3bFN9Tx6Y9IzUyglNb7rfquBxnn2b3/ltaurIJlkfV/ibhCZf7LUGYLeJyKXmB5rNnrPCCqYErnKCQBzG1ncqv1+g4O5y2L5axD+9aTj0BlCzdnAlKtFn80WgZfGJpBqUk9PkgrRYr73faY2g8IEAPAWPH5cIUzZSAj8ougr6GdbcRqTIlhT/50X+jFVkxfHzOEgvDi9lbsqf9EWIgRY75PARJwJWcj4++vOihnvYYD+bdB7vHihPqYYWt7MP1mMfP2UZq8fEDkMVPspPtLOIO3w+RznNsSxFhArxF+OmqRmFUn48+Dc7ufLMXWrnvXe4W7IgmF3WSYy6tAeTKSLPN+Mq9D/ndP74OTB0WS39bRM98mfBz9C/CGV+GiRI4fOpDWLVfhclvnzZfZmqlegWXwf+MU4x/ftGhUBlzM1Dk1MVQDBUgdm8WwZvOG8/CvWXP4to=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0922a36a-ad7f-4846-eaad-08dca6f688b9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 06:54:56.6979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iKUbTh3/WZLxVHvPyXOSQXfnCLIx2/YqMYZ9sxmS+ffPujSYHOGccL9H7pxRLDu9AUbS7DVV9epuoJsAvIy2x5iw45bpldc7bjAExc9YTx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180046
X-Proofpoint-GUID: PJMpZPTw3qy8pfIJQN7Msmsi5FpdJXgn
X-Proofpoint-ORIG-GUID: PJMpZPTw3qy8pfIJQN7Msmsi5FpdJXgn

On Thu, Jun 27, 2024 at 01:34:19AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_consume.c | 18 ++++++++++++++++++
>  libdtrace/dt_impl.h    | 18 ------------------
>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index dec2314b..5fb636fe 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -27,6 +27,24 @@
>  
>  #define	DT_MASK_LO 0x00000000FFFFFFFFULL
>  
> +typedef struct dt_spec_buf_data {
> +	dt_list_t dsbd_list;		/* linked-list forward/back pointers */
> +	unsigned int dsbd_cpu;		/* cpu for data */
> +	char *dsbd_data;		/* data for later processing */
> +	uint32_t dsbd_size;		/* size of data */
> +} dt_spec_buf_data_t;
> +
> +typedef struct dt_spec_buf {
> +	dtrace_hdl_t *dtsb_dtp;		/* backpointer to the dtrace instance */
> +	int32_t dtsb_id;		/* speculation ID */
> +	size_t dtsb_size;		/* size of all buffers in this spec */
> +	int dtsb_committing;		/* when draining, nonzero if commit */
> +	dt_bpf_specs_t dtsb_spec;	/* bpf-side specs record for this spec
> +					   (buffer read/write counts).  */
> +	dt_list_t dtsb_dsbd_list;	/* list of dt_spec_bufs */
> +	struct dt_hentry dtsb_he;	/* htab links */
> +} dt_spec_buf_t;
> +
>  /*
>   * We declare this here because (1) we need it and (2) we want to avoid a
>   * dependency on libm in libdtrace.
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 01313ff3..b5408c1c 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -269,24 +269,6 @@ typedef struct dt_lib_depend {
>  	dt_list_t dtld_dependents;	/* linked-list of lib dependents */
>  } dt_lib_depend_t;
>  
> -typedef struct dt_spec_buf_data {
> -	dt_list_t dsbd_list;		/* linked-list forward/back pointers */
> -	unsigned int dsbd_cpu;		/* cpu for data */
> -	char *dsbd_data;		/* data for later processing */
> -	uint32_t dsbd_size;		/* size of data */
> -} dt_spec_buf_data_t;
> -
> -typedef struct dt_spec_buf {
> -	dtrace_hdl_t *dtsb_dtp;		/* backpointer to the dtrace instance */
> -	int32_t dtsb_id;		/* speculation ID */
> -	size_t dtsb_size;		/* size of all buffers in this spec */
> -	int dtsb_committing;		/* when draining, nonzero if commit */
> -	dt_bpf_specs_t dtsb_spec;	/* bpf-side specs record for this spec
> -					   (buffer read/write counts).  */
> -	dt_list_t dtsb_dsbd_list;	/* list of dt_spec_bufs */
> -	struct dt_hentry dtsb_he;	/* htab links */
> -} dt_spec_buf_t;
> -
>  typedef struct dt_percpu_drops {
>  	uint64_t	buf;		/* principal buffer drops */
>  	uint64_t	agg;		/* aggregate buffer drops */
> -- 
> 2.18.4
> 
