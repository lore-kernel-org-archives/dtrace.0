Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACF5296BDC
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 17:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754934861; cv=fail; b=Y1umE2lr0Qjrt6HEVF+AqtQ5ihzIItE6fb3JqJ6+Mu7ufp0Pi0j+Lk+9yQxBIA4dwZlmeyAxoSJ7TjwAZsnydcygbvfwRkE6EsF3KwmkVnromkBAHBexjnFakybgXza7i7y9dpVP+Iod+t3Ap+rQa51+h/Hc7fBpQ+vk7k6PqeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754934861; c=relaxed/simple;
	bh=XH3+dSkj/ep7AT3/q7/+HALy3DZUO/MlTFO7R6rR1Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ABKVmyQwRhVtcUb/KCkqIYCgOhqne7Lnrv9w208pc2aS+abGfSdf0DzNcsIR8R/xdtbiNBQpQdIUX4wFvr2et6i+gyDoey2h4j1dzckm5ykfSjSxhhPLRFeQwK+qRRUZ3hYVCMZgFPumNNPhyUhna2pVPwWFFVPjNH+2/f4cGMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=R6DqaZNQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=c/sdDtam; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="R6DqaZNQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="c/sdDtam"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFN6JT030837
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 17:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=5x/a5npH6xQUgqw6xJ
	97yenSyGSfsaXYe69hyj8cywg=; b=R6DqaZNQ7hUGurHBopEAnhWL/aV4v8MV6t
	U2AexDkoo2I82Oz7VryP1otX2/JjzkoF8wFkfNgnKwHjIfugmapI4eZmHBvxY57a
	QMAmRyJd8gz2FhA9sw5WrsaIsbNsvRGNxNgQ2IcxteR3Z1G+06+eNX4+t3xsp5Fd
	KO1xTAmqm/lq4lESBdibhnWGt2Mc7Z9dEte9lmtMqsbZKBE6EFjIFKgekTKPfVNL
	BjDXJ7CJL3nCefSDmxheFiKYlwI7cfXs3jkn7gtgOCmxs5a7l6J1BCa1skQQefOD
	suDhDsKvoeuQLU86FeGj9IeEqJ9BYWfcTZlV1SKYyL28BrF3JgHQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4b5vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 17:54:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BH2NTu017475
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 17:54:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs8xkhg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 17:54:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJ4Ol+rP5yiRM8yrlfzQiXthp2mPWC3h1gNw2rR1QC4ou3yCRGENiSB4Fb/pIFId9FpUyigvTMGVOW8AsJ2VdDS+leftRZtYb0ojnsNXAoJBDwgkXJWKtuQgKPWE8YHK0OThQEBD2MvUrx93gggi/G4EWSs8nvkl/9sX/KFGG/tiBw5DS/UrGZ2DWT08gcjNRm4KPL7nWmU1rhXkkXXE/4qjjgga2Vqw+jW62l3/0qkuTRdgTH9/VtQljU+4UQvzmCV/R0XE/m3OQoPmgcLfx8Je1QQYj7Jb+oB9cjH3PI0PMdZgqQsM78VrlsVpHujXjxD/T/KkfUtInxucId+grQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5x/a5npH6xQUgqw6xJ97yenSyGSfsaXYe69hyj8cywg=;
 b=r3gD/uwZq1Om/Wd9ZrVzYdSZusW/6Pup0BB4oPjHXs9J+TfUQwS0kN0oCHR0dVKdcP+dfsjvK0ZYgVsK1HiMQSrc6J1TvXbjeaNN7XvWe2fPlvmBjrTW1yATjtK47oQyUfSSdOsFOm2Beu+/30AZ6nS2vyVxqekhdDCnLexbrKz8OL5zItKFNtWMlYftEvD7GzVdyNkXW4KJf8NCyEVsQrTkn6GbCtYFNuSxlutg9hRxbMCsgY4HkEBzv4wH5MdUwgDZrTHN3lrCZlXZPIPYFX1z6n83OXf1Ge8x02ScB2csXWYwqJaRT+TIok30FshauyTjO3wRazKB9aHyD9wVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5x/a5npH6xQUgqw6xJ97yenSyGSfsaXYe69hyj8cywg=;
 b=c/sdDtamRAjKOvA+qxalKBxpUfqPiOe1XOPd//10MomkCyvqCdv6t9FudfNsBsVcrPRw+wXJSLGK+9eiY8jc/Z+M4RbqXoaYFS6E2ePMbc7DwVAFE4e73fIY9GF8mw50LXweaUcovBZ8ps3b5MoNzMMn42ZvHkmUH2YCcmw42X8=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BL3PR10MB6068.namprd10.prod.outlook.com (2603:10b6:208:3b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 11 Aug
 2025 17:54:13 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 17:54:12 +0000
Date: Mon, 11 Aug 2025 13:54:09 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] No uprobes on ARM autiasp instructions
Message-ID: <aJouQe8qUJSIPKD7@oracle.com>
References: <20250610211042.20522-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610211042.20522-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BL3PR10MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: a4175dcd-44ac-4189-8832-08ddd9001458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PmoN/qUGoNnwIy7djm2s6cIB9Wf7odtSa3F4NaF4V9V92lHWt5Bxkwq69RAZ?=
 =?us-ascii?Q?TYXhKMrm5xcdmkvrcrMfCQwi1dX1gInWwBQ+kiLYt2nOUg/y0jfANTH/eWr0?=
 =?us-ascii?Q?tHfVqoSqIubwCQOvhOdDGwl99lJ7CzY6hUd//p6Z+FGw6mPRVO88i69WCTzj?=
 =?us-ascii?Q?XV9/atsVJk6EYalhHP1GzwhrRKmxWKFJjooHXkcDZn2co7OhfCZsWPfSDEJL?=
 =?us-ascii?Q?W2C8MXNMF3CoeS2zlitOsnuFnGVyYNyjx35b1HMUPApW5MXOaq7F16QKLXi8?=
 =?us-ascii?Q?SvbRVc4LmncCG856cmL0HIM0L3qwUdqReeBZ5H3Jsfe4GAv+JDffBAqej2mD?=
 =?us-ascii?Q?3qCNRiOrrB0LwUBllf18O+BeePodp955j71O2qWz/oxQxzOiu9Xe9jXMRbqE?=
 =?us-ascii?Q?7+nff6937gufPVZBvk79ULtjQ0WoroHCmT3Ta/HPp8OT5X++AaqDYjyzH9cB?=
 =?us-ascii?Q?fIIjjNhi6gGxudG4aUtDKCkEi7BXZA/ifuv6iHQaF6lY9/ACzpq/Tir8J3zb?=
 =?us-ascii?Q?pNaf2/tQGcnlN4GDdPFDNOfMnRyvYFQ/daCPvgOMkirUYMisv07orIgl/gVW?=
 =?us-ascii?Q?Rsb4zu1twc3oCjuvGPb+PW6qi1FSgyZkI4qkvQMeJ9CexAkFUROCCQnWQj+v?=
 =?us-ascii?Q?0f6eeD8pLZn9BS6ATdH3ar/lsUQHg0gAXlcdMs1jZ0SVdCGug5fGuraWP4Z2?=
 =?us-ascii?Q?eMJKSeNVenCHN6Ph31l34O3oN+j0EQpRbHFtvxSyQGud8hKE2eN+9mb42ScT?=
 =?us-ascii?Q?EnJIxyzxFGjLnC+6AdHcwuEjkshnrNON5xOs992qJaFskylpyU6fzhg38PzY?=
 =?us-ascii?Q?fxHGeXpecMHfvla3hJ0id3/wNxHzpJSfUN5i8bYIyYTQpMPqBPExd0bIFAF2?=
 =?us-ascii?Q?48mKyIFnLCwN8iw24JZwApBfCf42dCnBmakja8b4SELOI8F1csvJ7ltrP0iP?=
 =?us-ascii?Q?pTHwBpSXMhRS7Nm3TvjEHG+C9LUgS3UO5lgRSCKPIcyaMKYMgzYPYxPGQ35e?=
 =?us-ascii?Q?Jo1ZHythBqOPyI5HMQPdw7EzWcc+SLuXNIE+dArb8I7fXByQWIDCm28P4Ftv?=
 =?us-ascii?Q?m3jZBRCpJxPnkXKWv2ST6hc+KiROuu68/DVHdG5Gi1fbVd3Z8oiPLf0Sx6Hq?=
 =?us-ascii?Q?avv0X1PnwPZvOwLwepD7wsaJKYF2/pCS+Hj0psk3GuGhQ/TZyplFeMnQW4N5?=
 =?us-ascii?Q?qq7Snl7c/QxNxmUzcx3TOEaBc7w6uE/be+XhYzqaZTWi/T9AnBUcFoiaF3EN?=
 =?us-ascii?Q?MKJwZzGnZDgQk8EPClWmoBAsh0xKyA3hKvvqzvdFcXjw8T4KuOLzJ4TXK9Dn?=
 =?us-ascii?Q?Vl6F3DAEVwAoShNcC6lGqYocqE45dtLwrPV7NomLoFMdfIA8+9jRiUvBsDqY?=
 =?us-ascii?Q?OgneXmx1fyZZ8huKeFJeNgmqXMpNErgZjat6/5rmzAmOmoqWMdn6/WgHuLnA?=
 =?us-ascii?Q?p8zZ3dCVlds=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KCKU/h0TRjnGEERXZ+o19tgYWK+pFktcE57R+WW2WgPbkgbbwJrM/Sqiqb+b?=
 =?us-ascii?Q?3ydLo0+MXrCd/jYHGEBCTUSDj0VzSovqmKZ+7FJkcbtpVuY3vmR6rFWUkcV7?=
 =?us-ascii?Q?OQ2LIlKN03QRhLPBwAEbIIQJWCr/VjuYAQBC3Is+7d4T3hFKYMxDQuHp6Vbf?=
 =?us-ascii?Q?kE/RtfG0d5IytcPEvIS+6xItCbdzsd5B5AlJX0IZGmnAh4RtnZ7nfMAxmD6T?=
 =?us-ascii?Q?tEPufDVDLTWsYuCMWpNZ+BMfEKfSWfZu+54De1MXEBqPGI/D6ics4RAPWIJp?=
 =?us-ascii?Q?lpRFxHQr5JOvluPTW0IDlvLHd4gyFdskgcbqxX678lPOpc5N89ivNcfOlcdZ?=
 =?us-ascii?Q?nKJFWR4MH0RjGhN4+JCfidBWRR99+AiCY8ZqKkSQX5GiZuU1pHhnfdHrJ1VG?=
 =?us-ascii?Q?sKSpxlJXSqFPRwvZDJCJnIUu+Nj3i5O2lvC4cFc1yDb6BXjE01fEO9808wBT?=
 =?us-ascii?Q?nis9waFBRgoD0DgvbMrNxJozz4Fm11xv9BVag4G0sBz35wrAU/HjdLPtKk8B?=
 =?us-ascii?Q?y2T4uGdT3TyPTqmFd1SEJiVzdrh1ebG3vP3rPpImtiTCtSWYbLbmTLmKRVBI?=
 =?us-ascii?Q?lPUQUrC9kOIQBbB3mVIuQ4kcPgAgQ1dvQs+/J6WhvdzDHmE57DJFGDB9T/Al?=
 =?us-ascii?Q?eYskDnVsKhUZ+GQjNx5KxHdHXxXnZCfAMl0jD5xQuAkErcRN5ainR9EAZzuS?=
 =?us-ascii?Q?n2VfTnuMZxUUtqbLb6jLCAm6+dD6xuOiATN8y0HOPxMIxUvpj/Yf2ovk0q+J?=
 =?us-ascii?Q?iwBaSbkKz5ZCeow5W65lc+9MIzbgO6K+yPfDxDCPBBXpovubtWaM+Fj7HT/O?=
 =?us-ascii?Q?YY6Xy3BzODF9wLwV17MCUgKh3MfeYwieQSAKu0fP5mV/YWOKJ+6utksQsiQG?=
 =?us-ascii?Q?oaiZ/WPpmwirYczbMis2SI29UlrZJw5ZpN2W28dsFpg5rqAuFmeTfka49TwI?=
 =?us-ascii?Q?msv4D6+hRaDIWBXVnWRYF3cbAJ1N0VRv+TI0Pr76gVCBdZMFmRJ33FKR/Ond?=
 =?us-ascii?Q?0ByEct/jCvmKy101JXsD5SScb+ICder/RHRIY7aOaZhD64BVs4DDe5RTfkvH?=
 =?us-ascii?Q?AXBNF+vsLxzxhVubJ3z6z3XO82+2rNFVthhKNy9CZ3tguE4acNuDDfcklnj0?=
 =?us-ascii?Q?AIFB//WSy0djjIwQjqLFxSd6DU1e7Y/clPmU0TIqvQljw5y0qShvDpWxPViQ?=
 =?us-ascii?Q?3GwMGVHmT0TIJ5kmTfyNXcX0lVt9bIG1yD8viY1ZAoRo3gySDcRTh8Xtulba?=
 =?us-ascii?Q?d3S3XMStVvtWy9WH2aAiKVlPHltFH/lJa+tm07zOB/rKxMasUPWDI3dhOyMD?=
 =?us-ascii?Q?alFu0+WfW8k7go/YQiBkX8iLViuH0rvbcMoJ9E3S0kXEZgl4+mfc7S9fP8ma?=
 =?us-ascii?Q?bHBVTUlOEWnNG3vLurFC1N9p0OuLyll5umMZ+sLZ0V4+3vcfTBphDeZfXIn7?=
 =?us-ascii?Q?nrz/5zdkfpRDSLrIJ2vKgpQtE3R3uXRTB31BdvVdqHKvw95Uf56Qfr9RxKty?=
 =?us-ascii?Q?T8UyNDYbzUa58weJOTfxe2zZlVOwA4kbDWGbbbYE7FPOu04GOiwexO1xyQlm?=
 =?us-ascii?Q?SD4e0vg4ntYjHJDfgHXC7jLwa0TM/Q9s0cgIrrL51JJkHv6xVnbh/WXMqP8O?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	91uhCtm3vbXQWpSNizeDdA1RpWkCLgePEVf4t91DxlrsaXrfywHqRRcv/CzprMf+5r6Y0K9tY0qfW2AkX8KHuh1JEOPP1vPjbJe66z1Px/uocCuspk9gB30hb9ogHOdXGgXeiMih2mICaQMMiUanypy7caraFCItaBwpLOCpUfp/YrnKJcC+rjFkvKnHFZWtJ9H5TP82aQ/2AXZ1uGWj32sgl0ZFUNq3vXsseXMyXxmagj4QtHgtxqzdxV42xvErmajORcvRVgczXjujZupnUYPKHfVN78rEYPkfN0CxzB35cFz+5dzFxZWkO7AB9E4nHKydcO1Lqqng4GzUyWBXqMqluvRavXBOgLFPxmuaZ1Fa9vX8RiyRxphOBNcmqajZzQzxpxGbeN93PqNpNRnaDb+fX5LdS0PCNQBKuKfRcBMTDc2togYL6KJB+JrUjqnlNWe/IU17bTg54IjFzmxGErT9JOWib8x2HmMERnnmuLSpQCy7DqT6h5jjIy7uDkIv0u3YlBBShZLFQ0XqK0I9Smf3tP4uyM7vYRgAHPFW+c6XgE5dmlATMyl4dBXZ9QwxkziAkSKmTiwY766W+RJZBXKyYQqLjPnpncAhidai/Kk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4175dcd-44ac-4189-8832-08ddd9001458
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 17:54:12.2972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mE+3SylXAPfBqgwEMgKrTaNxr0pH571n4bG9Af+OI190rmlCz3CAaWxjaJzhKh/JzSE7zD2zaT2uJUN5o4DQmZC6j6hmxVxBz6NKcV7JHSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6068
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508110117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDExNyBTYWx0ZWRfXyE1v5hPbA2lW
 5aq0Z/PIDi8c7lKeeK7gqpvuJW0z825twqbgpwveFAhb9/gS9FX7ihZ3p33jdAS8MVFQq5QKDDN
 Ut3JpptXwg3FHV1ZZ1s3pZlwID8ev9VZxzQUmC/fhc9q0MPOgM3Z4OXh1ATb3djxxpT+ieSkgMr
 k594xdcxhLsRkdBAc0ZxIYEcX9QDkG/R0SmZkxBy92RICzhc6YsFe8tnHgeciCtBqL1LbiMcAT1
 qZpX+5ux0NDeJRIu+ygV+IHcS0yjDm+8k0acJxNVV1lf5wFnGKXSZpSeYCEsH0oH/Gh2uayqXIt
 kpRkUT0JNICtS1/PYRF2Ythe4HJdIFOhockkam4OCxRtS8ig52+qX3GHFPTipQoV9Eb3qbPhTUY
 4pVmwgDY7poLxtgAOceMvEJMFmXCwT55QwNFg2PEkikzLbwA9t1zriNQMbjpA6nGe8HowNu2
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689a2e4a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=sQe1Wb_97zqpmrEXR0sA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 9jbFAnL_wyHUrDyvWLTePJ32eovQTf1j
X-Proofpoint-ORIG-GUID: 9jbFAnL_wyHUrDyvWLTePJ32eovQTf1j

On Tue, Jun 10, 2025 at 05:10:42PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> New compilers emit autiasp instructions much more liberally.
> A test like test/unittest/pid/tst.entry_off0.sh, which tries
> to put a probe on each instruction, may fail.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_pid.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index e2d4e540d..833e9b647 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -279,12 +279,17 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  
>  		nmatches++;
>  	} else if (glob) {
> -#if defined(__amd64)
>  		/*
> -		 * We need to step through the instructions to find their
> -		 * offsets.  This is difficult on x86, which has variable
> -		 * instruction lengths.  We invoke the disassembler in
> -		 * libopcodes.
> +		 * We need the instructions for two reasons:
> +		 * = On x86, instructions have varying lengths.  So,
> +		 *   to step through the instructions, we need to
> +		 *   disassemble them to know what they are.
> +		 *   We invoke the disassembler in libopcodes.
> +		 *   (On ARM, we step through 4 bytes at a time.)
> +		 * = On both x86 and arm, we want to skip certain
> +		 *   instructions.  So, again, we need to know what they are.
> +		 */
> +		/*
>  		 *
>  		 * We look for the Elf pointer.  It is already stored in
>  		 * file_elf in file_info_t, but getting it back over here
> @@ -298,7 +303,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  		GElf_Shdr shdr;
>  		Elf_Data *data;
>  		size_t shstrndx, off;
> -		disassembler_ftype disasm;
>  
>  		/* Set things up. */
>  		fd = open(pp->dpp_fname, O_RDONLY);
> @@ -344,12 +348,14 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  		/* Get the instructions. */
>  		data = elf_getdata(scn, NULL);
>  
> +#if defined(__amd64)
>  		/*
>  		 * "Disassemble" instructions just to get the offsets.
>  		 *
>  		 * Unfortunately, libopcodes's disassembler() has a different
>  		 * interface in binutils versions before 2.29.
>  		 */
> +		disassembler_ftype disasm;
>  #if defined(HAVE_DIS1) == defined(HAVE_DIS4)
>  #error expect disassembler() to have 1 or else 4 arguments
>  #endif
> @@ -390,6 +396,11 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
>  			/* Newer kernels do not allow uprobes on "hlt" instructions. */
>  			if ((unsigned int)disasm_info.buffer[off] == 0xf4)
>  				continue;
> +#else
> +			/* On ARM, we cannot place uprobes on "autiasp" instructions. */
> +			if (*((unsigned int *)(data->d_buf + (sym.st_value + off - shdr.sh_addr)))
> +			    == 0xd50323bf)

Are there symbolic names we can use here?  From an include file concerning
opcodes or (worst case) define one ourselves.  From the comment, I can assume
that the 32-bit hex value you give must be that instruction.  But is it an
actual 4-byte instruction without any values taht can be set for different
uses, etc?  Perhaps a define and a comment explaining the value might be
useful here.

And perhaps do the same for the 'hlt' x86 instruction mentioned above it?

> +				continue;
>  #endif
>  
>  			snprintf(offstr, sizeof(offstr), "%lx", off);
> -- 
> 2.43.5
> 
