Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911C4146585
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 21:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755551613; cv=fail; b=digKUHb2DHog2JjJd9MOdq6QXbazwhoB5mwX9NSaHoGP6iUtbAI1uMZmZZQNrRquNqNeYufnGwcqMgJHvxM4uXWman04HnVJjbEKxYybJw8yqWrJJAsZwTWsukA29r9KoOpn/kCpaTBClzZiuZpQpqfJTgx8oYHHcxRyE/KGCEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755551613; c=relaxed/simple;
	bh=ZeQkCE5NIVf+wusV2VKXweYztdN7bokSY0uivF8IcVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oAK7zxn+Bfm0LSAVLj3SZsoCuA9E1cTYC9OKMdOIxNmYhXX1jx3Mnq3Zdbf/0hEdce6BL2OKtRRVZ7bpzTMOmrMKtxjAgrXqKd+lXVxe+BECdDX2HbhUilMqCih5wI6/YHf9IWkGkd1+MH15zZjAa000FpVrveDkSfkjevdwuiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YCwUe0Z6; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MwxnsejO reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YCwUe0Z6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MwxnsejO"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IJgRCk024889
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 21:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=MBXGJ6dsSBWDPoqOEuZ5aWGCyytU1pbsTTHz+RpfM9o=; b=
	YCwUe0Z6gBzsuV6cfv0DaEn3hqiZXWdWAQkp2Ume9qlR6XmdCe6ZuFDOgONrvi6H
	GJlwDvKu6BJ3jqskSzdeL5DJhPP6zGM1rqCVk9dmY4t/5XKgfeBIRHslwGFXoX5Z
	PaNSKut1850PFZcOqUrh2esrmmk3lY1F9x5bgvoydv8Bc1EMOO9figrySXAKJmVN
	Nk8o7klNst/XYAx/3CmqNoLeUl0xmbVOf2MVeBRT9rU+flChdQPyhWatbhILmm9x
	rahxmnp47COLdlJIVWKkvDbi3vWf4rhXz0KhbK/o7rjsfV6baxc6gu4CgcXYs18U
	0r8kPhu20mR2Xc3jK3mjJw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jj1e41ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 21:13:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57IK5H03003653
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 21:13:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48jge9j0cu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 18 Aug 2025 21:13:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obxUYuGXIpwY+l1sTDaCr9Fu4fOgAXAkzrMwPlAeoP2SU6S9BhiiIr1bX9IVmP0oNofAmF1GbTxtG1K+XC8ee2V4ltDbOXu8YHJzM3GPZq0GTQc87NGjZObdzx5xE6++Tw3Obj3PTf86P5T/D0LJHqoJVH5yx0G9qsiikBT5oUKlLmt7qCheqSOc81V7P+zAMx5AudhqECR6TuiODGKGqXOeQu0MCxn4YytbF0tTe0dne+OFsmn+B6yle3A3pdDJMTzebe4J589KkaegGqfTczh54bwjJmYCCm9N41NdoqYKESjuKNsvAbXlPF6oXd2lKdjUg51n8eT7GYBxjXsoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0FM03Dru3+vsbSehuoYblLTOwOi9OURR7oRFt6wfPI=;
 b=aaNHOwVFUBbhxGybjKHYUInJYKMGv6IJgfyzfYSbngy/BK10EDRtAPAOtCF6yv9w9uSZ8jipXf5ijfTCuMqrSyEQPwKQZGwub4CUFool3t1gEewHscRLPXZ9HtcqopUjUEZNOg92S4xRKht09Htnww9TWskLqveqpEyOKuDOhgkRIDebktaT9YNwRNMz807zN+yxxDwkQIWu37k+ruCOr4lX9py5ocxbMO/J7IDDCTOOGqNLOfkGOF1taF92QkqPDJ2tZ6wpDz4cx8bKBMCt3qlL0W/CZttNfNWffC+Bs4A8Ua5UMw5v2e1CCuJQTPgvj9c7h4cmQMvnjsgoT5N9KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0FM03Dru3+vsbSehuoYblLTOwOi9OURR7oRFt6wfPI=;
 b=MwxnsejOszl5KAywW3WCHcRqJyDbrE7i7JZSfoBTWtL0Koj6rSIgcdK6iB24wq2zp/xJ6gtzsy6pWZclb94h6m+JStqPOZ4J1rPHTCE4mTs8c/n4Qcrh6o/Lybobw+eDwq9IFH+r12sOn6xtplkkgmKLT7xwvWh8ceUiwo0UqJ0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CO1PR10MB4737.namprd10.prod.outlook.com (2603:10b6:303:91::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 21:13:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 21:13:24 +0000
Date: Mon, 18 Aug 2025 17:13:20 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/2] Refactor the versioning handling
 system (consolidate data)
Message-ID: <aKOXcCwgy/DEXqI3@oracle.com>
References: <SJ0PR10MB5672EB3042EB4FF38F34FFD6C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <0a298885-a398-8de6-8001-03ca7fc2ecbb@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a298885-a398-8de6-8001-03ca7fc2ecbb@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CO1PR10MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: 849270d7-09fd-4c4a-da18-08ddde9c10fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?wFF7YsFBTd1OLpAG1kcB/xiRf+9Jb0QMsllbklmetVLMdj0lPUmNXYmT4h?=
 =?iso-8859-1?Q?9EZ2QNhunXmD/R+MMvaVph4x0Ypc7XOC3nCOamhQA7wvphPKPibsgoN7E3?=
 =?iso-8859-1?Q?6Lk+DQIuBYXlpRWviWZ20+jlqmSbFKXvoM1pE0lRzag8ce5McWs3DHkjzF?=
 =?iso-8859-1?Q?0s2+tCOHHRsKMd/jyYX15/cRMFnjXl4wdWqXaRjaLcClNBkqgCv0VeXag6?=
 =?iso-8859-1?Q?1+dKHuPCMxL29RvNQMA3c2NKQ6hTyk/XX/GtH04/BQ9NKJlMMdP80NNoZp?=
 =?iso-8859-1?Q?tlHw42mFFGUYzTzQxjLBSDKtENr46ou3JYbb5jykIrtBeHnQwZE4FcFVJn?=
 =?iso-8859-1?Q?PNHrwv1yqzFJp5fnuj9qtVdy40iSVQPeTQRTVcCC/2GQNFPi0eq5OIgkVK?=
 =?iso-8859-1?Q?55glC8pY+R20Rs7AkHEWzSmnTbBZzSefK0CAktJ0+EEnwpwRUmor2Ao31T?=
 =?iso-8859-1?Q?ATEP6NknXNII5vCRt893afXj87pogYtoXFWhE9kgShKRZOdmtD6rbUFdjx?=
 =?iso-8859-1?Q?1HyrsgpUbyQOK+fTaEdlqZgXItynoHNSUXC30Mvs1lqMMNU34Tef1CBGF8?=
 =?iso-8859-1?Q?VcRr24FOMfIOzijcrG3Xk8pj36Q+EWaPNzP7kqVEb67QC2mJcx8f7Yg6Ex?=
 =?iso-8859-1?Q?tmwYD9Md5bqR2KGJO2PoXqSm1B3HaVrxlGZUsIZoAEIT4CSnmL9r+KdIx4?=
 =?iso-8859-1?Q?kiXz13enBJdKRiTFzNhJ5mR7yoXtRWyVVRgwr+ZgfugpNeAfOSu2djq/Nj?=
 =?iso-8859-1?Q?ha2wn7+y9bLrYqxrAMrgQ6+pC+0eZEIi3CYguywzQDRgo1PGgLHcrIr7m7?=
 =?iso-8859-1?Q?TpHzGP+Tqs+wCuAo6dOkcFAtg08Rhuuxn4Z17zoY8aQSyVNotr36TOcZfp?=
 =?iso-8859-1?Q?A5J4OeJnpeZqgJNt9feeJHGWOFRdXv0JBv9mvX+9B22LzlkyQTl3GNoKY+?=
 =?iso-8859-1?Q?BpM7k7jOjsZIt7F6niEfGNV6DBLBcZkLITGRNsD+MIrNoxkf9eJ4unjgEf?=
 =?iso-8859-1?Q?+Ru1b5H4W9LrQC/snDeZXdiYEWmQjTb+ApN8F7WZV51I0HOeq8xHROtBDX?=
 =?iso-8859-1?Q?7U7aYNiGLyX3aU2CTgOPMsvezf08ENeXzeZYe/2JLcXG6wGGeHf9yGIzIP?=
 =?iso-8859-1?Q?mK/RAuHgUQr1bVXf3ditt/MkiYDuVeTAgwJWHPS/hHmwwPeQjMM1EaAmzP?=
 =?iso-8859-1?Q?4FYyLEGfmtcLJC9Ouj7ilO+VOi/DDBU60yDoq2lcWSgm8nR1vhEWWBE+db?=
 =?iso-8859-1?Q?seUNQOnLupqdF+RM8x135WqxE6ZclhDOJnxZAnXHGBUb8ukouWeAh3sJ4v?=
 =?iso-8859-1?Q?HcCSIbYLHfWjq0IQ1hjTG9lJ4RIbyAtbzLq21UQnRqUSbyrV0uenSdlY8A?=
 =?iso-8859-1?Q?SpPu4NEk8SY5WsxLLASyApRxrEBsFTIeoocAK0etepUPf85aYP59nO93/M?=
 =?iso-8859-1?Q?HHu2rCqKoZIeg7IX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7URP7T8B22tf2W9iDfeTCdFc46UqSd++txOpRoovha3HIjunZp7sflCNrJ?=
 =?iso-8859-1?Q?geDdHT2a6J5eKtB8KN7XbyE5Yo5LwHWBkMP9AxDHsww2uTeRa7ty2hmD0V?=
 =?iso-8859-1?Q?fLN+sYev5e7DEQI79gTweSjIwzOh6zJ6iYlxzTVtm2HRFXktzRC8c2hS6y?=
 =?iso-8859-1?Q?GZUTrCBX0Pw6CL2oKKY8fhFaHLciol96yM/FJkawilUxMkjOHqtz4umqxo?=
 =?iso-8859-1?Q?oW5sO04puwuHXyuaDvvqDysNNJN29O10FNg8la+AUd2YPWyj+LMhKIMThu?=
 =?iso-8859-1?Q?VkGZd1medMO62zHqWoyQNd/9bkAGlpNdQ3QNL6Wm3E3wVKhLv27rj99cDn?=
 =?iso-8859-1?Q?78WJt1QBDJfTmh3D5M3hW9k2fp0jopX4tMBH7QkAtajhznD8BXuISJwsIe?=
 =?iso-8859-1?Q?dkW+6soXW14HtQf59tVEOhOAwyzwtKjZEqsOKPZp8kvrjRw4cKMkqKi9+i?=
 =?iso-8859-1?Q?G2OF+OkoIivYd+MdOHwQwAA9rktKWRMBZNR/fVyXbvdZhtLWze17bqidVv?=
 =?iso-8859-1?Q?zcehhbjNtheCDeQZNj2ROl7uziNjAmM9Kq6J8Quhfsn2waTjIVIB/bjXdw?=
 =?iso-8859-1?Q?7UCmZvjiFoQMi37ymE7AXFeunTZAdPzE2hRcenkoIgH+y33Wp1Nm71PrAE?=
 =?iso-8859-1?Q?384JLpJhEuJ0eGQJbOL5k9i4NKS2tPsBjM/D+ok7WqnepTbFDPPp4s736B?=
 =?iso-8859-1?Q?hSL63l4ufhFxmI2WgXvR3jdSVFY3ZkuzKOUBG+EeYxbKhfiCHwa34rZvPd?=
 =?iso-8859-1?Q?pJqWrqBSeS3gzIjKW8Q6n7moCEO6Nd2fbq0AFb+badXTJwSoPJkq9C4L+D?=
 =?iso-8859-1?Q?JcaNSKxIj/E5PIJinZY0uA5p7EVQuddIMd8TsYoxhr/aFzbssp0NNDecT3?=
 =?iso-8859-1?Q?cwpq/wDyqp2N5ctS8Anj7w924mO8bkJhfJcZ+tiormKeJmGwSzaq7R/o5p?=
 =?iso-8859-1?Q?tt1y2l92A4mFDPwGKBdtSR2WkxTAPKokIDCn0HsesQ5S4lf83m/CZT32iM?=
 =?iso-8859-1?Q?CUNP9k1k9prIsdxS/Tm9PXo4TXujZWRUMX50K30i+pdyYRnfk9+U0Mc85q?=
 =?iso-8859-1?Q?K11KZHO5o1Kd/iu9hAZxDWSHh+T6akGCesprWQCezSgeVnIPbPafykKEDK?=
 =?iso-8859-1?Q?8sU99jOQdNNjK5fyAxHFXA9gnBBJIwxjz1RKW1F6FoNRAOTTLERiPAj9da?=
 =?iso-8859-1?Q?8RW7Jj7UqR7zlDFDVPM6arXWZlsby6IiDkqtDW/OTzSqJvMgmUsoYC5o40?=
 =?iso-8859-1?Q?dWR4RTsrjoUO40h9jNf+/fv3TmxS1v1oHrb35WuMomb8DH/8iJ0Akdqdnp?=
 =?iso-8859-1?Q?8P24W6PfJQMCy0LWmuLQTiEFNSTwfdPz800zxAggI+c+mnQ4oHceuSyYD1?=
 =?iso-8859-1?Q?j/277u1ctkNXLlI72GeCxLsNPT9+PWL15J3V1KqvrH/0WoGVlHZZp3LMHK?=
 =?iso-8859-1?Q?aVgt8xz8AuPBJSXYRv9LgkZG5DHDFmRvowsI0e0KvbQg/Rpuf3RXXtLoLZ?=
 =?iso-8859-1?Q?BW11aNe+iWxz12WEITXXiC+NU34/5Z6TG4nKKvliXT4ws40pH3eu6bsJ4A?=
 =?iso-8859-1?Q?9c93UuGrL0qgaiGBQBvdDEDOMEH/4tnpvRwQfbEUycRw9vvuRQPkcLGBXT?=
 =?iso-8859-1?Q?5f3utjteqSV4/ir/mtUnvTrjGbkqIfGcVmVuykA77M1TFHU8E3Lun1mQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RnMyN4i9TUIx//CtSnSyVxldZs/Q7Zm6zzmBSz193Gzy6v7cz+YaP4RcwlzYWbCY7OjmIdgWnfgKsz2pH5pzquWEFOJhicBSgIRJ9SSkpgbnFtX7aB4bZSEAJevx0EVdNHrAT0NXY5D/hDPfuFdUOEZI0xD0sCJDzO1r5EorMDBLrW5qvGXBd7SYLN+J5Ost3PNXAgkQ5KTucyGjgOWMq2WjZQ0e99d/17r/h+kgFMGn4T9puYktV8Os9v5e6cLmESVk9dJ0HzlWZakXw80eojfGG4N034z/xHKOKh1CqjjmKgpsyiSVwjBD7EJWB5CpK6T9n8jvF+99Kw4Su74IY3bb9Fg+1iToh/QfEDGqjAK9sX7hAEBY3TwMt6kYncOxdG3TpekRgexpw3/q7bsFWRmfqf7NSHNhuzEVnv1nINhL5DQ/fLjOLnHRq702eT5FcqnbZMinRBQeaI0M4N764W/OF5oshueZ6CR564euBjvyyP8aNKcTdVzVQoY6rkFHfj9yz6xHZFynz7W3oyCNDRKr2Qbd4zbLp/cqrGj6YCd8DTWaDXKKGGVGWXM56o6C/CrzqFwrXUmOxds+r0UO8tCZe4hyXPzg+8H3RZT6VMw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849270d7-09fd-4c4a-da18-08ddde9c10fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 21:13:23.9090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZOQHwtwWfW/U49SJjheGZchpbn6BGIxylOZjDrgBYQS0+isehA7qQNdonT4jW2Ir2VGKQa2yxwYSxiveIYgNzCPgUpv+KTwwC3uO858Q2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4737
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508180199
X-Proofpoint-GUID: JmeUyUrmwP776mNnpO8xT0L-L8kTVhAh
X-Authority-Analysis: v=2.4 cv=dN2mmPZb c=1 sm=1 tr=0 ts=68a39779 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=55VsL2JnYxJ2IC_cI3EA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE5OCBTYWx0ZWRfXwdQwdGMl1181
 ggJNpZnuD1glZyjGFLh0jNoNWeWzvdh55HTGDfraJ2seZUcORgCw0w/zFqKdV0M2aPpZEr6j5vG
 JyEnlfPZl+FAtNBtigY/mGAm6v++hMry9g46ay1Hq+MfMkZM1Saz/Dzzc5dNJjOePd4gcgulBDc
 mt35FKD1W5SkL3KSJqOBnvq+adGvlYb0m9h0OJIZQ8ZF4+iSLqQ1cEOVcXjJ9Q/nwCQtdQYlPYF
 sTUphffWwDD3LqJLGiqWFfkz2vjQw5jnHDhUkYcr7Dr+jIco/sYNjs1wqjjlvXQ0530EnuTgyui
 saGuSs44WQ8Pxt1nF6Tk0ytsZP8qKn2Ij9ruldWminKtyiq6TZJOSPLy5oK65SEgvF2yffYxwUX
 xhvALAl/AbF1kyZQzvA7bjUcuOY7kWj/e2fbVBbUDjX7hUH0bJLmJqmg4/iwEZBUV7uQY+gc
X-Proofpoint-ORIG-GUID: JmeUyUrmwP776mNnpO8xT0L-L8kTVhAh



On Mon, Aug 18, 2025 at 04:45:31PM -0400, Eugene Loh wrote:
> With this patch, I get test regressions:
> 
>    test/unittest/options/tst.version.sh
>         Diff against expected:
>         -version is 2.0
>         +version is 2.0.3
> 
>     test/unittest/dtrace-util/tst.APIVersion.d
>         Diff against expected:
>         -dtrace: Oracle D 2.0
>         +dtrace: Oracle D 2.0.3

Test with v2.

> I did not run the test suite, so I do not know if other tests also fail.
> 
> Should something be done in libdtrace/Build with
>     libdtrace_VERSION := 2.0.0

No, see Nick's email on this a while back.  Library version is a different
thing.

> Should something be done in dtrace.spec with
>     Version:      2.0.3

No, that should be done separately because it is a distro-specific release
thing.  That should remain separate because (1) it is hard to automate its
value, and (2) we have to change the spec file for each release anyway.

> On 8/15/25 23:46, Kris Van Hees via DTrace-devel wrote:
> > Rather than having multiple data items that need to be updated whenever
> > a new version is released, a single entry in versions.list will now be
> > all that is needed.  The mkvers script generated the necessary defines,
> 
> s/generated/generates/
> 
> > and is also used to return the most recent release version to be used
> > in GNUmakefile.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   GNUmakefile             |  2 +-
> >   libdtrace/.gitignore    |  1 +
> >   libdtrace/Build         |  7 +++-
> >   libdtrace/dt_version.h  | 83 ++---------------------------------------
> >   libdtrace/mkvers        | 68 +++++++++++++++++++++++++++++++++
> >   libdtrace/versions.list | 67 +++++++++++++++++++++++++++++++++
> >   6 files changed, 147 insertions(+), 81 deletions(-)
> >   create mode 100755 libdtrace/mkvers
> >   create mode 100644 libdtrace/versions.list
> > 
> > diff --git a/GNUmakefile b/GNUmakefile
> > index 7ad857f88..03687bf3f 100644
> > --- a/GNUmakefile
> > +++ b/GNUmakefile
> > @@ -14,7 +14,7 @@
> >   SHELL = /bin/bash
> >   PROJECT := dtrace
> > -VERSION := 2.0.3
> > +VERSION := $(shell ./libdtrace/mkvers -vrelease=1 libdtrace/versions.list)
> 
> I think to most readers "release=1" means, well, release 1.  How about
> renaming the variable.  Alternatively, just say "-vrelease=t".
> 
> >   # Verify supported hardware.
> > diff --git a/libdtrace/.gitignore b/libdtrace/.gitignore
> > index cf124ba1d..ebf6ac9b2 100644
> > --- a/libdtrace/.gitignore
> > +++ b/libdtrace/.gitignore
> > @@ -3,6 +3,7 @@ dt_errtags.c
> >   dt_grammar.[ch]
> >   dt_lex.c
> >   dt_names.c
> > +dt_versions_defs.h
> 
> Great.  But dt_versions_defs.h should also not survive "make clean".  So
> that also should be added (in the appropriate place).
> 
> >   errno.d
> >   regs.d
> >   signal.d
> > diff --git a/libdtrace/Build b/libdtrace/Build
> > index 164023bbc..a3c3a2e1a 100644
> > --- a/libdtrace/Build
> > +++ b/libdtrace/Build
> > @@ -73,7 +73,8 @@ libdtrace-build_SOURCES = dt_aggregate.c \
> >   			  dt_work.c \
> >   			  dt_xlator.c
> > -libdtrace-build_SRCDEPS := dt_grammar.h $(objdir)/dt_git_version.h
> > +libdtrace-build_SRCDEPS := dt_grammar.h dt_versions_defs.h \
> > +			   $(objdir)/dt_git_version.h
> >   SHLIBS += libdtrace
> > @@ -129,6 +130,10 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
> >   $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
> >   	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
> > +$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
> > +	$(call describe-target,MKVERS,$@)
> > +	$(libdtrace-build_DIR)mkvers $< > $@
> > +
> >   $(libdtrace-build_DIR)%.h $(libdtrace-build_DIR)%.c: $(libdtrace-build_DIR)%.y
> >   	$(call describe-target,YACC,$(libdtrace-build_DIR)$*.c)
> >   	bison -o $(libdtrace-build_DIR)$*.c -d $(libdtrace-build_DIR)$*.y
> > diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> > index 8dd252b08..5c1528266 100644
> > --- a/libdtrace/dt_version.h
> > +++ b/libdtrace/dt_version.h
> > @@ -13,83 +13,7 @@ extern "C" {
> >   #endif
> >   #include <dt_ident.h>
> > -
> > -/*
> > - * Versioning definitions
> > - *
> > - * These #defines are used in identifier tables to fill in the version fields
> > - * associated with each identifier.  The DT_VERS_* macros declare the encoded
> > - * integer values of all versions used so far.  DT_VERS_LATEST must correspond
> > - * to the latest version value among all versions exported by the D compiler.
> > - * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
> > - * it along with any suffixes (e.g. Beta).
> > - *
> 
> The comment about "any suffixes (e.g. Beta)" disappears here.  More
> significantly, the ability to have such suffixes seems to disappear.  Is
> that a notable loss?  The loss of capability should at least be noted.
> 
> > - * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> > - * explanation of these DTrace features and their values.
> > - *
> > - * When adding a new version:
> > - *  - Add a new DT_VERS_* macro
> > - *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
> > - *  - Set DT_VERS_LATEST to the new DT_VERS_*
> > - *  - Update DT_VERS_STRING to reflect the new version
> > - *
> > - * NOTE: Although the DTrace versioning scheme supports the labeling and
> > - *       introduction of incompatible changes (e.g. dropping an interface in a
> > - *       major release), the libdtrace code does not currently support this.
> > - *       All versions are assumed to strictly inherit from one another.  If
> > - *       we ever need to provide divergent interfaces, this will need work.
> > - *
> > - * The version number should be increased for every customer visible release
> > - * of DTrace.
> > - *  - The major number should be incremented when a fundamental change has been
> > - *    made that would affect all consumers, and would reflect sweeping changes
> > - *    to DTrace or the D language.
> > - *  - The minor number should be incremented when a change is introduced that
> > - *    could break scripts that had previously worked; for example, adding a new
> > - *    built-in variable could break a script which was already using that
> > - *    identifier.
> > - *  - The micro number should be changed when introducing functionality changes
> > - *    or major bug fixes that do not affect backward compatibility -- this is
> > - *    merely to make capabilities easily determined from the version number.
> > - *    Minor bugs do not require any modification to the version number.
> > - */
> > -#define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
> > -#define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
> > -#define	DT_VERS_1_2	DT_VERSION_NUMBER(1, 2, 0)
> > -#define	DT_VERS_1_2_1	DT_VERSION_NUMBER(1, 2, 1)
> > -#define	DT_VERS_1_2_2	DT_VERSION_NUMBER(1, 2, 2)
> > -#define	DT_VERS_1_3	DT_VERSION_NUMBER(1, 3, 0)
> > -#define	DT_VERS_1_4	DT_VERSION_NUMBER(1, 4, 0)
> > -#define	DT_VERS_1_4_1	DT_VERSION_NUMBER(1, 4, 1)
> > -#define	DT_VERS_1_5	DT_VERSION_NUMBER(1, 5, 0)
> > -#define	DT_VERS_1_6	DT_VERSION_NUMBER(1, 6, 0)
> > -#define	DT_VERS_1_6_1	DT_VERSION_NUMBER(1, 6, 1)
> > -#define	DT_VERS_1_6_2	DT_VERSION_NUMBER(1, 6, 2)
> > -#define	DT_VERS_1_6_3	DT_VERSION_NUMBER(1, 6, 3)
> > -#define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
> > -#define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
> > -#define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
> > -
> > -#define DTRACE_VERSIONS	{ \
> > -	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
> > -	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
> > -	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
> > -	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
> > -	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
> > -	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
> > -	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
> > -	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
> > -	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
> > -	DT_VERS_1_6,	/* D API 1.6 */ \
> > -	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
> > -	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
> > -	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
> > -	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
> > -	DT_VERS_2_0,	/* D API 2.0 */ \
> > -}
> > -
> > -#define	DT_VERS_LATEST	DT_VERS_2_0_1
> > -#define	DT_VERS_STRING	"Oracle D 2.0"
> > +#include "dt_versions_defs.h"
> >   /*
> >    * Interfaces for parsing and handling DTrace version strings.  Version binding
> > @@ -112,8 +36,9 @@ extern "C" {
> >   typedef uint32_t dt_version_t;
> > -extern const dt_version_t _dtrace_versions[];
> > -extern const char *const _dtrace_version;
> > +extern const dt_version_t	_dtrace_versions[];
> > +extern const char *const	_dtrace_version;
> > +extern const dt_version_t	_dtrace_vers_latest;
> 
> What is _dtrace_vers_latest for?
> 
> >   extern char *dt_version_num2str(dt_version_t, char *, size_t);
> >   extern int dt_version_str2num(const char *, dt_version_t *);
> > diff --git a/libdtrace/mkvers b/libdtrace/mkvers
> > new file mode 100755
> > index 000000000..c45617773
> > --- /dev/null
> > +++ b/libdtrace/mkvers
> > @@ -0,0 +1,68 @@
> > +#!/usr/bin/gawk -f
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +#
> > +
> > +/^\s*#/ { next; }
> > +NF == 0 { next; }
> > +
> > +# 1.2.1	D API 1.2.1 Solaris Express 4/06
> 
> Solaris Express?  Is this a vestigial comment?
> 
> > +{
> > +	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
> > +		print "E: Invalid version string: " $1 >"/dev/stderr";
> > +		exit 1
> > +	}
> > +
> > +	n = split($1, arr, /\./);
> > +	if (n == 2)
> > +		arr[3] = 0;
> > +
> > +	code = arr[1] * 0x1000000 + arr[2] * 0x1000 + arr[3];
> > +	versions[code] = arr[1] " " arr[2] " " arr[3];
> > +	next;
> > +}
> > +
> > +END {
> > +	n = asorti(versions, idx);
> > +
> > +	if (release) {
> > +		$0 = versions[idx[n]];
> > +		if ($3 == 0)
> > +			printf "%s.%s", $1, $2;
> > +		else
> > +			printf "%s.%s.%s", $1, $2, $3;
> > +
> > +		exit(0);
> > +	}
> > +
> > +	for (i = 1; i <= n; i++) {
> > +		$0 = versions[idx[i]];
> > +		if ($3 == 0)
> > +			printf "#define DT_VERS_%d_%d\tDT_VERSION_NUMBER(%d, %d, 0)\n",\
> > +			       $1, $2, $1, $2;
> > +		else
> > +			printf "#define DT_VERS_%d_%d_%d\tDT_VERSION_NUMBER(%d, %d, %d)\n",\
> > +			       $1, $2, $3, $1, $2, $3;
> > +	}
> > +
> > +	print "\n#define DTRACE_VERSIONS { \\";
> > +	for (i = 1; i <= n; i++) {
> > +		$0 = versions[idx[i]];
> > +		if ($3 == 0)
> > +			printf "\t\tDT_VERS_%d_%d, \\\n", $1, $2, $1, $2;
> > +		else
> > +			printf "\t\tDT_VERS_%d_%d_%d, \\\n", $1, $2, $3, $1, $2, $3;
> > +	}
> > +	print "}";
> > +
> > +	if ($3 == 0) {
> > +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
> > +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
> > +	} else {
> > +		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
> > +		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
> > +	}
> > +}
> > diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> > new file mode 100644
> > index 000000000..8986d2007
> > --- /dev/null
> > +++ b/libdtrace/versions.list
> > @@ -0,0 +1,67 @@
> > +#
> > +# Oracle Linux DTrace.
> > +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> > +# Licensed under the Universal Permissive License v 1.0 as shown at
> > +# http://oss.oracle.com/licenses/upl.
> > +#
> > +
> > +#
> > +# Version definitions
> > +#
> > +# These definitions are used to generate dt_versions_defs.h.
> > +#
> > +# The generated file contains:
> > +#  - DT_VERS_* defines that are used in identifier tables to fill in the
> > +#    version fields associated with each identifier.
> > +#
> > +#  - DTRACE_VERSIONS which is used in dt_versions.c to populate the array of
> > +#    valid DTrace versions
> > +#
> > +#  - DT_VERS_LATEST which has the value of the most recent DT_VERS_* define
> > +#
> > +#  - DT_VERS_STRING which provides a string representation of the most recent
> > +#    DTrace version
> > +#
> > +# Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> > +# explanation of these DTrace features and their values.
> > +#
> > +# NOTE: Although the DTrace versioning scheme supports the labeling and
> > +#       introduction of incompatible changes (e.g. dropping an interface in a
> > +#       major release), the libdtrace code does not currently support this.
> > +#       All versions are assumed to strictly inherit from one another.  If
> > +#       we ever need to provide divergent interfaces, this will need work.
> > +#
> > +# The version number should be increased for every customer visible release
> > +# of DTrace.
> > +#  - The major number should be incremented when a fundamental change has been
> > +#    made that would affect all consumers, and would reflect sweeping changes
> > +#    to DTrace or the D language.
> > +#  - The minor number should be incremented when a change is introduced that
> > +#    could break scripts that had previously worked; for example, adding a new
> > +#    built-in variable could break a script which was already using that
> > +#    identifier.
> > +#  - The micro number should be changed when introducing functionality changes
> > +#    or major bug fixes that do not affect backward compatibility -- this is
> > +#    merely to make capabilities easily determined from the version number.
> > +#    Minor bugs do not require any modification to the version number.
> > +#
> > +
> > +# Ver	Description
> > +1.0	D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS
> > +1.1	D API 1.1.0 Solaris Express 6/05
> > +1.2	D API 1.2.0 Solaris 10 Update 1
> > +1.2.1	D API 1.2.1 Solaris Express 4/06
> > +1.2.2	D API 1.2.2 Solaris Express 6/06
> > +1.3	D API 1.3 Solaris Express 10/06
> > +1.4	D API 1.4 Solaris Express 2/07
> > +1.4.1	D API 1.4.1 Solaris Express 4/07
> > +1.5	D API 1.5 Solaris Express 7/07
> > +1.6	D API 1.6
> > +1.6.1	D API 1.6.1
> > +1.6.2	D API 1.6.2
> > +1.6.3	D API 1.6.3
> > +1.6.4	D API 1.6.4
> > +2.0	D API 2.0 Linux (BPF)
> > +2.0.1	D API 2.0.1 Linux (BPF)
> > +2.0.2	D API 2.0.2 Linux (BPF)
> > +2.0.3	D API 2.0.3 Linux (BPF)
