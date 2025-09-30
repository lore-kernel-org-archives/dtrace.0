Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CA223E23C
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 16:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759250872; cv=fail; b=Y5tb7/8HEYOh49aqSN+wq48lUS4lT2fzjd81jUisve8aW+UAEfhZ473H+czOUIXsQg8LCVU5iwbIo+im6d3z78oVWGd/F3ISJugoKLEoCXMVVAHTjeNHmbIUUF1WLQ3ccDxzZWBINZ0+8KqeqnvNs+ZVixy09r+bSiFKgEmn6iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759250872; c=relaxed/simple;
	bh=kZwo5hrTA2ibFBdn1h2yi6k2xMtw+qaSMXLweHSE+zM=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=i1oweAV2s3QiK6bDRo58xL2iX2d1tqsKLZpWnqnTKiY+GmH+4WYSfDXNXprfKntTjMuCetDpdEndaCTrqA6uYNwa8SZG0newFPlt0LFtyoao1eVaJ61bbRD6HJYH9pWghf1zbO59BCQaoNhxwjhLv5uEjQLY3Siq9oswGuWcKVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XHUK7Qlr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CT0lLMqO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XHUK7Qlr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CT0lLMqO"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UGTMAM008371
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 16:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=DjQX5d6BsXAUX/yVKU3iau2eLqHPIA5GE3YxL0iDOlY=; b=
	XHUK7QlrPhzTtSa3Cx3aWuH6iOKWZQggXd+XsBIKVBGFPfb8Xgt9y5iIZOeit8+J
	j26egeGk/g7JC3xdDVhjSkKef5YZuMc9ch8yTkfJIiH4c6y3YcioCw/79WzN3i7k
	gEtGZrDcjB3OryrwWfvNMA1njqzQitVfq/0muk1PcL+9BAa3Jt0X+jgW7+IcOaiD
	3rFhJLIlGrHeoRvvQ3+xbJmnqchf6+3VTVXPteHBOvFMdrGq9C0u2U2TfxomfWKR
	xlbdlt0DdwHkd8IPQQxl6IWh0BuOuZfb7dFrSgl9k5at/acHX5N5FDbtU37UzpF4
	5dvoC3vZzJSIxiieM7PHig==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gjs481q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 16:47:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58UFZ9n1002073
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 16:47:49 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6cemadt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 30 Sep 2025 16:47:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaM0Ro6FI6oX84dBABo0aaMdHi+WJlSIP3EmJShXmI2iPZyBfkW+fpK+AQ0FP1d0tiEPFhItPVTS4y+fRNlNz62PEAhbeoJDbwly1YvKt6cTNAuuMUykD+pixKssgsGUl0chtEbB6vi9ihrYkwR2bkOPGlFeVlZmrFg6WcqWxA5EUAXFhAbg3X7ZQrWBqs0NAcJWLfk51iPtZOhz2ZQ1MhXai/G4VVPmTOw6EFjuLF4H91cuSVZRzjAkunNwYnEdxN4m9Weqc/JG90fq04EyWVv2YHLZIGzXdp/H6IRmsxmP4R49reCNAXY+Q6L5QAAlY/OfcA/NTJZvqAsy8q+VWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjQX5d6BsXAUX/yVKU3iau2eLqHPIA5GE3YxL0iDOlY=;
 b=SR1GHlvmG6Ipyss3lroOSgCOIDuYN3ECYhv9FY3xRkDI9hp08AOMtKmEaj8GaU4EM5TTlqlP5cRRG7JCqcKyGkjx2c3otlcxmkeVUkq/M18zQJZUeJ/Efwve69RQruhA9sus20jz1w/nvsGRSaNZEpeyoW87/uakAHHDcmfwD64dHLNFIPB/1PG63EYltP/YhXvq5gA0Mtsxt+6T/DvBl1q8unsQpslgU3ZqsG1J2Dj0oSAxeZtC25H1jSlTZg4uNuNZsh5GQLxzRL5qW1KnhZF5Zg5BOMBifq4c1UDP8I3Lrs+5qvwdAhiw28+/3niXS3drChJoBKsu20x1xe4q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjQX5d6BsXAUX/yVKU3iau2eLqHPIA5GE3YxL0iDOlY=;
 b=CT0lLMqOSDWR+On6fPKg1IAQIzM+esww1LdPKTdgGn77rhIbmS8o/bsyBU0LY8BBoPkfWmFqOuNDs5dCWbU+g84Nc+5uoLCyMOMiHnCgrJvSRJ46Ry7XpahkzGXVWAASauex9aEZa48AUGhzAIe7MXDahTuANHB7jhdo5Jzl9/s=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CH3PR10MB6763.namprd10.prod.outlook.com (2603:10b6:610:147::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Tue, 30 Sep
 2025 16:47:47 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 16:47:47 +0000
Date: Tue, 30 Sep 2025 12:47:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] options: check *frames option values against system limit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56725A609D3CFEE2E6011B9BC21AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CH3PR10MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: be1c221d-729f-4a1e-3312-08de00411596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R0jsvpzazQirM0dinkyYEaztV/kvoG1ppVv3QqrR/ZynIEVmB3bD36U10jeP?=
 =?us-ascii?Q?5GNjtth76/ZvkLBLEAfFfJ6zyHNyGi1chedbwXG8krvzmCQQjrZisQj7MmVH?=
 =?us-ascii?Q?gtfDPaCYYKsnHLa5NocNfZPUt7djF2NLjO4+4RHLd7/tMzqZtX88VcatUhz/?=
 =?us-ascii?Q?QKf+BmCex+4/O+gO0D2Fzj1/X1wQQfuy50v5T9tnyGAuw/6rac9+sNa+gyJA?=
 =?us-ascii?Q?tm7xEIndaxi9nY42TMDhHU37SJCauNs5w8oNIGxyNEtOuV8TTUCqRAcuIwuB?=
 =?us-ascii?Q?21xfrKK4eDTchDtMWJGWgWhBvBq2Xw43CgRhGyRgxUW6IOsFqHjhJMg1yltM?=
 =?us-ascii?Q?NSZc+mckhoRMfTIsjog1M6u0vMGFT7XSujQUHIwCXg0gk/NSHk9cNQi6i81Z?=
 =?us-ascii?Q?tPt/0Io3E68cBPCOqHNVypzPDd17aEmYerSRdORyP79+x3QuqIoL4KNpIdMW?=
 =?us-ascii?Q?b92/ddlU23gPkdPVO3GgFN86lzkKXJyKZFd6AQTVKmxA3TDcGxDXQU8SOnnu?=
 =?us-ascii?Q?Qhpsy6xWTpJuA6TsDXMKdtI4Lc55B/MvpT4cmGnsXCXmJRP+2YBLtOFQt6hv?=
 =?us-ascii?Q?SvF+8kpSPT210X+ChqxseoJHtOFqD4Pq+iQmLjgVe/C7GnnF3zM9DUZRQUv+?=
 =?us-ascii?Q?LPkKrr77KeOjqpmLzbHYzAffmpIl1pQ2BxdbiZzFw84/558HoMAxgMUQ52Il?=
 =?us-ascii?Q?wl9Njz6CcgUH1CFAi84YesriG1lmSvwHnTDqS1Kcfh8u+n7mzfD3DwIQ8s40?=
 =?us-ascii?Q?ZjCRkbLyZJPJXaZUsxpdM/SDkWbs+njFxD+HRyQVVSV/3vebesqN3bhQ7M8a?=
 =?us-ascii?Q?1UDzFRQUuBXsHl6dw3SDTPphGTbkz6IbWEb06ztkmERzAtTd+lJ2wzaaxZDM?=
 =?us-ascii?Q?tpwI+kFMjF0qXfNmj0YWpD/bv3dIrzJnEKWonGdCi3VlR4S2zauba51fBCAY?=
 =?us-ascii?Q?VajaX9pQLEIZw3mrjdWDHk0wuFCwqWkab8xteNdPVot6BvXKTvY6QPgGVGzA?=
 =?us-ascii?Q?fMw3uYu0QcmpZBM1zuH6RwYazROG4T+KjCvUJrlXJBVrJrPOsxuAJPzP5h25?=
 =?us-ascii?Q?T8ja9oJj5y9cW5b1zNZK1f9m8iXDbqKYAwf0hueEYDqCoBr7WQA+rLIZ4Vuc?=
 =?us-ascii?Q?sdPWVDCRYHeeNC85Hi6gaWLw2jiHSrXAwC3HI4J1Cmn313ylmDeQKjoRLYV/?=
 =?us-ascii?Q?BrMN5pFxyhZilzX5PLOsMcVRLVW53Uqo1QkW5TxUIzSE9IuR50FnlVtDBSPS?=
 =?us-ascii?Q?+VTyvXdsQcf1DkOEbAXCzhVEnwK6SeG/iDgpC5P0JEbBZiXiXHnhB5Xlb0at?=
 =?us-ascii?Q?BBjrmdazh71ppclrx+Ves08KdB0zI/MuFwMYb6Be+12EsK45p9LAXcUefsjR?=
 =?us-ascii?Q?fP9l8Va0Isig2pe5ZCV3HYP8unVrbVlbiEakHxNEnVw7QDHLlxbSw87Ju++s?=
 =?us-ascii?Q?l8WvJp8OwizrBnXYrllR+M9+fue9ZP7v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TGT/8/xrDQ6rmbARXSADVpAuQ79WsYqbBjks9DtFWFzHz2rPpFLY5amKX+z1?=
 =?us-ascii?Q?uR/R2/fG0DVqaF81GtepS5kzvsuEBSsXtVZt3lsafSaSqPxBq5DXLdXJMnbS?=
 =?us-ascii?Q?gYbp5p60I22chA7BxPAOrjLVa+9qvUrFvnYHF5EvZaTUcbQY0LNX325Y1WUA?=
 =?us-ascii?Q?Q/1vQLyskyIjv98cMUoM9ny65zEQZ6ZqfU+czOr7fitojCG8aFmCdhPXTKiE?=
 =?us-ascii?Q?Q3RLT7PRjMRm+D0XvI32rM2L3ux6S/ovFLZN4QSJlFZcgEf8/k0/Qv/xU4Ru?=
 =?us-ascii?Q?hdFgajbSYEyzoVdq0j7WhCB+rh2mOVT+m+a2D4ZCEsXs7hn3yp11m0UkCwf7?=
 =?us-ascii?Q?5Ss/5iR7EaM4kxkZWW/7AJhLXnO8/+gzAvVux7hN/vYwHl6yistfbpd9wW7H?=
 =?us-ascii?Q?AMM+ei87bEPw4hps9n3NcqlGPykFlDwpL0ufpPB2mJseCtOMw2IEwjPdqb6c?=
 =?us-ascii?Q?eoC1kRYHI3gmW+djvjtmPbASOvlrx2ZUSW/sCEN38fFex6U7LTaD/Lb+UXIF?=
 =?us-ascii?Q?Ns74+VED8dBRER0/uhKArodpjBE5cZfM2pPUt6le8v01ePiORVK7lUjnoApo?=
 =?us-ascii?Q?4p/GbQnZiBNdX56l/7S/u97y24t2ha7VvfSCpBDKq1hIcOVN6CG4YXX/0wRd?=
 =?us-ascii?Q?a9C2CuEDyGG/TEdKzYZ8MdiDqrVqZRostFGAgOAV/UebUq4lIyc1hYt1Z4gS?=
 =?us-ascii?Q?mvaZjtNnuPO4+kFcmZwFWUqG73OMvmk5uKdHNNy/q6DBRVEmgkIhUVruny4b?=
 =?us-ascii?Q?Wy9QUTMq0wTHg2avvHyplRbqIC2Qjjwm35dz2Cv3BNhg23gY60APYtdEyOlS?=
 =?us-ascii?Q?nuODwbtblo5tWQcvC/i2pc8ll+5c/uD6q7x5z31DlJG9jX/+wb/aSf+13j83?=
 =?us-ascii?Q?8hzKFftOYFzqYis4fgxtOm4u8RjGeVkpfBvmbAg5LiGdsTn8vqJXGIKFZpwH?=
 =?us-ascii?Q?Rd7VU83/phaJqbjXwik2Ph6hx/AYvpzmE/wexHbrqh/jiINs4vte0dRWkQ3s?=
 =?us-ascii?Q?CQpmirsGWZ5QKH4NfINDjY6SU1DrFWRU+dOcEumxe5Lj/pBkZpbxi2XXUSU5?=
 =?us-ascii?Q?7lNHOWdnj5PJZuKRdEtVEt6v8qDoan3Z3GXUbdvhh9eJ0fKNRP1FAjRBDOsF?=
 =?us-ascii?Q?5Dm5zncI2MOFHxB9hag4vpTQlrvlewkrvOIiSRSf6lnK+HxTQ+Vnq52F4qoN?=
 =?us-ascii?Q?iBXtD8uRKQiR+BgjdInJmA1VydVzHdbElvE5faq9g9gEqxmSRrOwk/BQiHNJ?=
 =?us-ascii?Q?DonAdnGWsz/Ks+epaXTdXZoB26SqxtD3l09xmUbx8L7fExGWqBigVmcwIy6y?=
 =?us-ascii?Q?lnUlUEVPj5dG3DB62zQiSfW/Qyc3qYXjbFZ3u7uY1dBy4gCCAqgYe+dRWCTh?=
 =?us-ascii?Q?HTYACPqCuGM8jnl08nACwwC+ZuxkopW0xPG5rxCdgjYFqkl+VmnpMLSdV2A/?=
 =?us-ascii?Q?3cWCDXD6myAZgLspqnzDAurM7al3mo8aPkQ8jL6VvOyq48HX3FeE5IEGkXfu?=
 =?us-ascii?Q?jplApu+2lkJ4PS7uQ/AepSqPswLx4DvTi0L5nLe8yOceG6yY4ixTacWOwdN/?=
 =?us-ascii?Q?Xc8gLNJ8IDqATTmuch2AZLiLuy9qB7MW+ferQy2BhrmF0jRPijrW/8+hJHie?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eDA1vPK43frCVobjORJlQjxQsK9V4KTFuMCiTMXMjFKVS2G4tOI3vwfB3yV23d/JPwzW7EW06dAZKpkvUDrzgB0RG0h54iHAlzsDEA7XjZvZ+Zm85YxRjZZtSQzYM7FtXZX/tyDbwFIObDnRNb3T+auhj1NkpxeK6StRrt/J4c/FyfXoG5q0tzwo2dvQqO1gE4IMerZLqXkc/RBnrK6CrtYMlLjfQiKLwbXCjb7U3lWcumS1g7Eco41/XdjcXiATXGXhwZoQetoFU41XBuJDNmy8GhJqVyGQuchCHr/oSsl2yc2ZkFHkuYgD8UFkKGtx+/GrGcEDiRCv56EZo+PzfbSFdNKj4+bz3YTf+5FwqnvEoA8Lc98ot0IOy0m9BjVQfhORYxe4FAWV6WfHS27chV9aMX56q8/YRENKyLdfyx4rlUrZC23qJNGtK7dxvDsrk3S6DrftLtm4EWZzlY8hTTPdXS4MCUbSY6mQ7WwrPKYdHjjGfiCY6St8piKff0jyWmN4mOir7kjSze29L9X7yyIvVCRgmll3wzFL3Df+t9jHpOArUtkFi3qX5dCHZiE4aegxbM0o+ZRL5ncD4P021wA7cN07PLq8oD9TSib2CSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be1c221d-729f-4a1e-3312-08de00411596
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 16:47:46.9934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RZmNrxSMrmW/SNuLqmBWY8ZwC1L8ioN1cj3L0qBBK6jT2XFuBdx3ftLCGJOp6Ev+tliVnVQPZbzw4vvIbxC6BFuSSgSWvFOhutL7g78wieU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6763
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509300151
X-Proofpoint-ORIG-GUID: JhPZu5ZGBP8MExnHai3WHKQXXdeJqZI0
X-Authority-Analysis: v=2.4 cv=fqzRpV4f c=1 sm=1 tr=0 ts=68dc09b5 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=f2_rno3jsTBGW62fVtcA:9 cc=ntf
 awl=host:12089
X-Proofpoint-GUID: JhPZu5ZGBP8MExnHai3WHKQXXdeJqZI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE0OCBTYWx0ZWRfX/aBUgbFA69uM
 ud/am/7MRiWBBVhJp/jVPSW2kwxGfQjp8a2PgjNcA9QJ074Kfd2g5mR0HD1ZYUPBQbbeLDgMBu0
 ZQiYkWCV7Q5EFXiW2pvNiFBLNURLDfCQ1ocM88aijSAEhqRAEkBLdQz3ks0p287OVyLsbsSvmjw
 GEstWdO5k1uYNg35V/njECqCanSWLjHGUGSB7LnncCBTt/l9rYX58DaIRuuU0UrugdzztwZu5G5
 hx/z/jAWT0trpV/CyXuSIdM7gYnQJ8Y+tEZH6BjSYoUhubhNRtNac5PXgD88qVDgEtTg7GjKJCB
 Jc8+z429HL3UTIPrdozOD3e86pMpOTioEs09kzsJ1uF7rBXKi2eU4Nzs5ZrrA1z3zVG8TXU18VH
 5r2V9rM7f2Va/cxeJm8ENWvAfUZhVkhRlFWplw2cRePWJAfRWP0=

Commit 81e99397d ("Add support for the stack() action") added code to
retrieve the system limit for stack traces and used that value to set
the 'maxframes' option.

However, a user can set the 'maxframes' option from the command line,
which would allow setting the option to value beyond the system limit.

We now record the system limit in dtrace_hdl_t as well as setting the
'maxframes' option to this value as a default.  Options processing now
ensures that *frames options cannot be set beyond the system limit.

Note: 'stackframes', 'ustackframes', and 'jstackframes' can be set to
a value that is higher than 'maxframes'.  The existing immplementation
in the code generator already lowers their value to 'maxframes' when
needed.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_impl.h    |  1 +
 libdtrace/dt_open.c    |  7 +++++--
 libdtrace/dt_options.c | 38 +++++++++-----------------------------
 3 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 4dc4c9a7..723aac8b 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -310,6 +310,7 @@ struct dtrace_hdl {
 	uint_t dt_maxtuplesize;	/* largest tuple across programs */
 	uint_t dt_maxlvaralloc;	/* largest lvar alloc across pcbs */
 	uint_t dt_maxaggdsize;	/* largest aggregation data size */
+	uint64_t dt_maxframes;	/* system limit on stack traces */
 	dt_tstring_t *dt_tstrings; /* temporary string slots */
 	dt_list_t dt_modlist;	/* linked list of dt_module_t's */
 	dt_htab_t *dt_mods;	/* hash table of dt_module_t's */
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index ed0b14a1..ba5463a0 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -764,13 +764,16 @@ dt_vopen(int version, int flags, int *errp,
 	dtp->dt_options[DTRACEOPT_SCRATCHSIZE] = sizeof(uint64_t) + _dtrace_scratchsize;
 
 	/*
-	 * Set the default value of maxframes.
+	 * Set the default value of maxframes.  This is the maximum of stack
+	 * frames that can be requested from the kernel.  The *frames options
+	 * cannot be set to a value that exceeds this limit.
 	 */
 	fd = fopen("/proc/sys/kernel/perf_event_max_stack", "r");
 	assert(fd);
-	if (fscanf(fd, "%lu", &dtp->dt_options[DTRACEOPT_MAXFRAMES]) != 1)
+	if (fscanf(fd, "%lu", &dtp->dt_maxframes) != 1)
 		return set_open_errno(dtp, errp, EDT_READMAXSTACK);
 	fclose(fd);
+	dtp->dt_options[DTRACEOPT_MAXFRAMES] = dtp->dt_maxframes;
 
 	/*
 	 * Set the default pcap capture size.
diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
index 7508f044..97516517 100644
--- a/libdtrace/dt_options.c
+++ b/libdtrace/dt_options.c
@@ -913,40 +913,20 @@ dt_opt_rate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 }
 
 /*
- * When setting the maxframes option, set the option in the dt_options array
- * using dt_opt_runtime() as usual, and then update the definition of the CTF
- * type for "_stack" to be an array of the corresponding size.
- * If any errors occur, reset dt_options[option] to its previous value.
+ * Set a *frames option, ensuring that its value is within the system
+ * constaints.
  */
 static int
-dt_opt_maxframes(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
+dt_opt_frames(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
 {
 	dtrace_optval_t val = dtp->dt_options[option];
-	ctf_file_t *fp = DT_STACK_CTFP(dtp);
-	ctf_id_t type = ctf_type_resolve(fp, DT_STACK_TYPE(dtp));
-	ctf_arinfo_t r;
 
 	if (dt_opt_runtime(dtp, arg, option) != 0)
 		return -1; /* dt_errno is set for us */
 
-	if (dtp->dt_options[option] > UINT_MAX) {
-		dtp->dt_options[option] = val;
-		return dt_set_errno(dtp, EOVERFLOW);
-	}
-
-	if (ctf_array_info(fp, type, &r) == CTF_ERR) {
-		dtp->dt_options[option] = val;
-		dtp->dt_ctferr = ctf_errno(fp);
-		return dt_set_errno(dtp, EDT_CTF);
-	}
-
-	r.ctr_nelems = (uint_t)dtp->dt_options[option];
-
-	if (ctf_set_array(fp, type, &r) == CTF_ERR ||
-	    ctf_update(fp) == CTF_ERR) {
+	if (dtp->dt_options[option] > dtp->dt_maxframes) {
 		dtp->dt_options[option] = val;
-		dtp->dt_ctferr = ctf_errno(fp);
-		return dt_set_errno(dtp, EDT_CTF);
+		return dt_set_errno(dtp, EDT_BADOPTVAL);
 	}
 
 	return 0;
@@ -1194,19 +1174,19 @@ static const dt_option_t _dtrace_rtoptions[] = {
 	{ "destructive", dt_opt_runtime, DTRACEOPT_DESTRUCTIVE },
 	{ "dynvarsize", dt_opt_size, DTRACEOPT_DYNVARSIZE },
 	{ "grabanon", dt_opt_runtime, DTRACEOPT_GRABANON },
-	{ "jstackframes", dt_opt_runtime, DTRACEOPT_JSTACKFRAMES },
+	{ "jstackframes", dt_opt_frames, DTRACEOPT_JSTACKFRAMES },
 	{ "jstackstrsize", dt_opt_size, DTRACEOPT_JSTACKSTRSIZE },
 	{ "lockmem", dt_opt_lockmem, DTRACEOPT_LOCKMEM },
-	{ "maxframes", dt_opt_maxframes, DTRACEOPT_MAXFRAMES },
+	{ "maxframes", dt_opt_frames, DTRACEOPT_MAXFRAMES },
 	{ "nusdtprobes", dt_opt_runtime, DTRACEOPT_NUSDTPROBES },
 	{ "nspec", dt_opt_runtime, DTRACEOPT_NSPEC },
 	{ "pcapsize", dt_opt_pcapsize, DTRACEOPT_PCAPSIZE },
 	{ "scratchsize", dt_opt_scratchsize, DTRACEOPT_SCRATCHSIZE },
 	{ "specsize", dt_opt_size, DTRACEOPT_SPECSIZE },
-	{ "stackframes", dt_opt_runtime, DTRACEOPT_STACKFRAMES },
+	{ "stackframes", dt_opt_frames, DTRACEOPT_STACKFRAMES },
 	{ "statusrate", dt_opt_rate, DTRACEOPT_STATUSRATE },
 	{ "strsize", dt_opt_strsize, DTRACEOPT_STRSIZE },
-	{ "ustackframes", dt_opt_runtime, DTRACEOPT_USTACKFRAMES },
+	{ "ustackframes", dt_opt_frames, DTRACEOPT_USTACKFRAMES },
 	{ "noresolve", dt_opt_runtime, DTRACEOPT_NORESOLVE },
 	{ NULL }
 };
-- 
2.43.5

