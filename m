Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E726D1AA1D9
	for <dtrace@lists.linux.dev>; Fri,  7 Mar 2025 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383311; cv=fail; b=daQQNdSWl8tmJPuNWQ2rKiEQbGntFyMXTJ8TZDarGmXij2iU3QgEYbf4DQOW61MIg02YdJexvmU1Vcs7OReu5DtWUbgKSyOLVpDADCsleHdSeuhpeXx2KzpOPNQnK6K0XEoTb4c016Iaus6XJMTVKZa6RyT4e0EmqtshJyQBkfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383311; c=relaxed/simple;
	bh=AHbkJHExK44nKclyFkBsHRjJJVa1KeW3nmRalMaN2YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TdN8MRmRBbc4SUSeVqrJ1IzuR63vo3CcTStt6Uz4hfV5O/o2hz5E4O90vaP0v33TA2T/Jtn31ocwAoV3Ki2vf1508NJYwieZ1GDEw6cvlCBzA0C/9H0+VmOk60ISewAl5Qew44dy5TZwwT+Xk/GSKs8umLaK9ueb9GYzwT6hDCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F1ISGSqL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Q02hFMYM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F1ISGSqL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Q02hFMYM"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 527LIKCG005638
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YFJ2TYkFB0WIKS4Jmrrq8eA3PEYK1aVvhV4KItu0YCM=; b=
	F1ISGSqLY4XRGuC/3o3nPrOHAueghWmFs3QOXmySvVqkT2cDU1jk1Itwg6IqslY4
	ZQ6IJ+N3dYfhoL4vyfON0FWA3+oFQh10955aV9kUoQvJBiqfETgIiSm74UfMlUCI
	xCQ7QSxnLROHHGQwjBkF0qlyZjlwOAQUp8utlnzlWkSVpd1sUymE7pBThkraacdx
	zoMUicF0SmCIYvQvClDK3I6p7qQtyCEY0wrtiXgrvM9ftnTE7Ct4yeIopWEc0t64
	MSioBx81rHNtxClbO+Myo42HZ1PupugTQ+JuN/RUUYi5xXZnCdv1uqkLNzrvdEUx
	ljDCBEntFCJh0LRZxhpH/w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 453u9qn9by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 527KE2vV003239
	for <dtrace@lists.linux.dev>; Fri, 7 Mar 2025 21:35:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 453rpe29pt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Mar 2025 21:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYltCJQPcnkKvGXfenxLtT152Lc5Jl8PHBdLJ9g2sdvqQxESe6mINuF7f+AkG83m1I9IKf6/eYCnJB5+T0+fKFu6qSRoKgkGakucfqhMC0/wytjgDDXVqnBknhJszf/iOJ28LC95bVc4ShAJ1fuLI1Kgdn3iVk9BNaOeaCPvZxNdoyB4WZOOfJBbwd4Jtelv24mOR9G34N0+5139ZRupYF8DU7TFCfFAA4kC/bCdTbKjUY2gn7oHGMHonp92OI8yHRwaGV2yWfL0NFSjY+oVmL4TewXGgjqrtSVpbWwfe8GDMdgFAFLXhLdQ+cvj/ZiRBdvmOqK+bVJWmLcWYDWYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFJ2TYkFB0WIKS4Jmrrq8eA3PEYK1aVvhV4KItu0YCM=;
 b=NR+jdRd9DGZSa5Aq89gR5iEZuXQXtg2qXo2+6sxlgc8Ani3J6VntzjaOYsbSkkGqCBTz6UU3C9szimHbTeozMvCQxV+eUHCohxfpTZly0Zdvm3UKaTu6FKC0U9JFTNw/5UvyzRQI0zkxNK1UIePyHkEpdXO5vYErG1Cu7lffV4OOfoTVj/xwbIK8c3aDuWK6/dVsaTxeuUTyvm09o4924RwVyH/Ir7ydvmbQozFeca7/Y3HtB58OcN8ROhLDZYC2EVIagusP3lnkWeFR3jUL60hojfQxd6dvxdeyZ1U2BrjQ1Y8rsuKEsZvVhuscByBQMA75k9z1yAl49LZev0nyhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFJ2TYkFB0WIKS4Jmrrq8eA3PEYK1aVvhV4KItu0YCM=;
 b=Q02hFMYMaZH/z0zkqAa3NW07QW+DaodlGk0sKd/9dMkRivfjT8lKY31zQ+Heeq0KcLKwfEPFgnqr5xPOPYduH4+/k/YU6sNkW9/QqaWooRwzxkyTzYCtmBuT4FU5GqDmgGzvqX6+HU3i67aR1pXK0BYLqQMQUFFsE+RsC4zSJ6w=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB7029.namprd10.prod.outlook.com (2603:10b6:806:346::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 21:35:04 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8511.019; Fri, 7 Mar 2025
 21:35:04 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH 5/8] symtab: add support for 'traceable' flag
Date: Fri,  7 Mar 2025 16:34:38 -0500
Message-ID: <20250307213441.9495-4-kris.van.hees@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250307213441.9495-1-kris.van.hees@oracle.com>
References: <20250307213441.9495-1-kris.van.hees@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::17) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 98c0a198-1749-44ed-e3a2-08dd5dbfec2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5/OPF/5UYDz81gKKeh6bBTP47rjyIElt5+BGIdjRREObqEc4b+LpmdPYlCih?=
 =?us-ascii?Q?G2Sa3NJlYcsO5kw6nBX24J6ikPm1nVINLuQJEei/IJgKxMb6A/Zk8tGGzAvv?=
 =?us-ascii?Q?Ziuf5dGVq/Jjy3ojdD2x5CGQZJuY862uAE6cuWo8NDKTpsf2L1k0bMNXk4qx?=
 =?us-ascii?Q?9uEVq7XJFrv/JgxRRzKIiGMXqnPlf1WPkD1PyrTM2ZYb6Ek9wgEadf+TP7wf?=
 =?us-ascii?Q?QjxgVmEhjXhnQ3RQ7HLPmmZTDzMgYsRMeg39KFQdXDzbNm8Pg1repAtOZfLd?=
 =?us-ascii?Q?TlMB40v4d5LPaO4JyPGy58K7z9IIjeiVDmCKAYnLsmO6A109FtNUvVfcqimy?=
 =?us-ascii?Q?hheWn2/0+IPWjoeFGJgWMHmS4Z3heHaK/99TPaxh3/gHHdukzNPjY7pXjGu/?=
 =?us-ascii?Q?YWoArRx3Vwml37Uuk/G2pFAuMJoW2eCQBPVURCS3DVEO0Ez1FEQ6xiO8ZyxY?=
 =?us-ascii?Q?xBeDZDUIBgqOVPgbPA+rhVtuPFwVAtYtVM+WeRrG/rYFNmfpShDyO2+jx7/n?=
 =?us-ascii?Q?fxKPq2wvkP5d9SSHnMcmAj3Hx8B001SrSj6atEnm0mqKTwhyG7Gru95Yoiep?=
 =?us-ascii?Q?ZH5v1BhHyOfXuVBjXwdln/6kFJyps/Ddbh7k08mRjsbHGBaE7tCAUm7V9ktT?=
 =?us-ascii?Q?nxf0/7allqkbpo8tZ7nZrb1NsT3G++AXFp91p6XI/wY41Q4/6gFX/RVA3imE?=
 =?us-ascii?Q?oCl+/YQe7SMnWT5yNAPMeFiPIxZ3biGQGQoXgZnYJR9aFiRpHbDDP2SZ5/Om?=
 =?us-ascii?Q?5rS26S5+dw3N3PxKoEGHWPE7q6dj2/0khRwssKVer89nxWp3nfSXAif1W88Z?=
 =?us-ascii?Q?nj7ra6DkGjwXzXYcRRL26L3FBSmGVB0jBXDU9mVCjhO5x48nxnnkL/lBK8C4?=
 =?us-ascii?Q?vETZLHbGIf+vb3diDYNvq9IV5G7fAR4qslRkHI8OHgCNvl1rwdNhfWb0yGDb?=
 =?us-ascii?Q?IR3kdlTRtRSdoJVqH35I22PXGpiwOS/KHmdMiDj1VOfmgW0u5vESBAA8zo+S?=
 =?us-ascii?Q?ifU+tZwvSybajM6hStzpXViSnKLgAnNqmih1/SADdNIYAlzPn5EsgEMJcw6k?=
 =?us-ascii?Q?1gT6I0HtPI5CUe4AoRTmhgBaiz+O1b7r2TBY7o8KLlqE76Fnpv2OMBwOUSQP?=
 =?us-ascii?Q?hboDrL9FVzBht06JrICcIXC3w6JBET9ntw/HWY/kc0P5SuNmT+5lENP+xKl7?=
 =?us-ascii?Q?KEpAJnANcWXWAynbUxxvOemAsfoxYtPx0Vjy5/6e4mtA3CSaSwCLfZR+LET8?=
 =?us-ascii?Q?bBquqUeBCH68AZVhiMZe6bO0pugGktGMqmByAj6MyzfsQswHD4UboaVDfUJD?=
 =?us-ascii?Q?9BgAtAG1R4p7j/Z85ce7tRzerCwgCgDbdrQzVdRsLdjxadQf0rBlnCsIjb3v?=
 =?us-ascii?Q?tt+UhdQsYHTuQ6QCxBMkZv4qzMy7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6qk2aDp5RcdoekvsNTVnMYRD4qXQ0RITgZRvIkXRcBnUYftdD3BZa0juXw0c?=
 =?us-ascii?Q?okFYP5kYrB3ZrXGuokhHGCzW2gZ3zT4BUq0vmLf9mFHjvLUNyO2LOiiFckz/?=
 =?us-ascii?Q?5nNUo+vz5K3unUIe3wDXYQoxB/aLjU2oYWWkOE8iAx+5OYhCTyYvoubRpmr0?=
 =?us-ascii?Q?IgETohj4mpT6EG20Kngtv4wDB9K2hQQL29IGv+teb0SoNYFuX7tYi52OpHHb?=
 =?us-ascii?Q?jziFlZYQO+mZ5DHw51mXGEJqHzyQNWF5s9bwGmHjw5ZmquQ4NUDey3I3OxSR?=
 =?us-ascii?Q?3mvhp6ph+f7MY411R8GuiJQDJ436A7As8ZyNHz9qdFPdSaedhvfBwaVKEKrj?=
 =?us-ascii?Q?xvxOvv3gKvU0vVug6zDNyWe4fI2lyFeULEqTJas2QvL2/tLSSVCAyN62Qukr?=
 =?us-ascii?Q?pUsehJrfr/pelFK9AS6jaD9U516hrLic1JDwEGsumbmq2gjYu72oaEYTuvYs?=
 =?us-ascii?Q?6U7keuenbvacYGx0jPtCJrDd9ZJexb7JHass5H90zBCPsCFD9zpdAtD+WqF+?=
 =?us-ascii?Q?1FZSb1ci1zEK+WMowteb43t0b0/77wKX2bZtnmaT7QR3fqZoDrZJjqZx06uM?=
 =?us-ascii?Q?FqFlHrEm5nfEkESUURRJC4fnUchteTjEvMtEVc0p0r6cjgR9x6mhYG9fM0Hg?=
 =?us-ascii?Q?Qdq0zsT+c88FnQ/z7fRmyDu97FCQXO5PD8K60i9D9gbQA3uxiRaNabltBKvL?=
 =?us-ascii?Q?FZcxJdF1ccxJWlkGavRjjglTRfdlOUoMMGY24Va1crUNRNuZmlHDwpZzc/l8?=
 =?us-ascii?Q?OGH1cXBxu9Y1HJt+DXO0+qLR0w3tM38WBIdrF2rwEw1A4DSh5z07bnCeP1LJ?=
 =?us-ascii?Q?/vPmabbDqgeVBgYyGVAcJRrPMguBttPL9TPv4mxzblxeXiwuOjDVcCFYcRMW?=
 =?us-ascii?Q?woJ6ZZ2hN6KCK8AFLdZ/B8I352P4ATuyUMIyulA/49W7/4uC/O5kJuoR7VtS?=
 =?us-ascii?Q?E4pXpY2PKVb5wJOGupqs8KDjmITu5D99xB89hiNhzGtKgkB4q9efudpeWLEk?=
 =?us-ascii?Q?rV0JqOI+Zc9r4aGFzqrkbYYxfWu0TPGsKo2bIhcb5F+aY0Oz1nSR1voVTsDk?=
 =?us-ascii?Q?bulTeDcF6L2zXIBl59rTmFfXdDAi78QBvfJDAYddJu7oVEkk+p41fhZXIUOA?=
 =?us-ascii?Q?2OvN1L6ZUPh3XKUPc5DsyxPrBUvNKZgIIGbWMJ+YY1s804mRwj+wQADwnFEV?=
 =?us-ascii?Q?HAaDdgDHCLFj7eT0PoqP1AtOCfMoJuWJ7e+GyM3A6alhKlSiJRxUgy4TAv/S?=
 =?us-ascii?Q?RkaJbnfCSfJjKQlziY/6XFasfUWVaBamovYObwsD34uWlJSZGOnymThi1XEF?=
 =?us-ascii?Q?lSMYtr8jKIkPeMJmA/mGVCc8gjPTtwENCz2v3oQuIJPbJmUf8wsdtgf4MAur?=
 =?us-ascii?Q?BM7aVSooseFjBWoq2Tp7b1U5zmK86mJTmMRzNebxO8+e5ZM82u4Hlg+ruVgW?=
 =?us-ascii?Q?dTyPWpvdi1s8yJZzHD5BqyGskv9P8nlBLPlFmGV6uDA316vliRRwJgARHGRK?=
 =?us-ascii?Q?375Ri6+r6k2zNwrBM+Lmieog+pKEM0GnlvBXR5JCBIjI/+bs1PapvGJs+Ihg?=
 =?us-ascii?Q?aiH4SF3LvUiKA6e1qO3FBnO5J1BGHFPdm9Kwj9w4MxkU729cZbjjtAf3+Sn1?=
 =?us-ascii?Q?3PSTQXfcOEetndGhKksWUJ0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VUEmFhL7jnALZZr38ADQsmN9kVJuGSB9Z9yo0ci/y9Lw6jzua4xu4pUTUlNS9wqaaF/4pjjpd2LAEBnjymAKm7RXcnwhJVdaNKSShxEEXXpY0UalUqf2n92wFvvSPaogjqthURF7ovIKT8plb9W5GSAI7VOa7plGcf41+Y/HOFaQs3UtwPS2S49a5s3KDqpYKeeWH2+EFZ4lYF9GdXn1XauU+IXxVVfGl0RTpt81y8zQigi2LQwkKfUBGDKhtVRUDzPdsOb5cMeJwO4FYAKTUTNSGLN/8OniV2a3LpA2LdlZ0cPh3UNuqPudF6JYqB+xV2KFpbDSQ8vlMmDHqOcEjQrzFD1y7Bfe8a04tlRP7iFZXS2yLQ1HuXkz/ztNc7Yf6CKs0dV7PTOPgfSUBV05OQyyuwv/ixtHzmpau+vnmMsvYuE6BIsGbrFzldfySsN8MB1Ld+Hi611ty6tkJLON3ZV95mtTlRU8GZMMb1y9sLI/K7lSKn/OquuaOxs2U310LJ1wO8HOGtIOtaW009x5EbpIL91GViwwmRfougGUCGScrZeIM4otPLai581eFSuVVYv/wCKVGRkFT3Kw6PPIdqsPA6k5g9yURpaEbDfUCNA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98c0a198-1749-44ed-e3a2-08dd5dbfec2d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 21:35:04.0107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gS+A7A9a2wVJI6Brasq5G1moQBOa8GEAhtkrpOIQivm1utuj4pUkPaATORTLlwximz8uqxL/rhLASnKJPPkiVzkKMzTmdvaSXa4nDFXatA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7029
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_08,2025-03-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2503070163
X-Proofpoint-ORIG-GUID: T158RGpiXxOVsHC0ZLt7vYR5-FZaPEUd
X-Proofpoint-GUID: T158RGpiXxOVsHC0ZLt7vYR5-FZaPEUd

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_symtab.c | 53 +++++++++++++++++++++++++++++++++++++++----
 libdtrace/dt_symtab.h |  6 +++++
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/libdtrace/dt_symtab.c b/libdtrace/dt_symtab.c
index db63cc88..4e46f280 100644
--- a/libdtrace/dt_symtab.c
+++ b/libdtrace/dt_symtab.c
@@ -23,9 +23,12 @@
 #include <dt_string.h>
 #include <unistd.h>
 
-#define DT_ST_SORTED 0x01		/* Sorted, ready for searching. */
-#define DT_ST_PACKED 0x02		/* Symbol table packed
+#define DT_ST_SORTED	0x01		/* Sorted, ready for searching. */
+#define DT_ST_PACKED	0x02		/* Symbol table packed
 					 * (necessarily sorted too) */
+#define DT_ST_TRACEABLE	0x04		/* Symbols have traceable flag */
+
+#define DT_STB_TRACE	8		/* traceable symbol */
 
 struct dt_symbol {
 	dt_list_t dts_list;		/* list forward/back pointers */
@@ -275,6 +278,12 @@ dt_symbol_by_name(dtrace_hdl_t *dtp, const char *name)
 	return dt_htab_lookup(dtp->dt_kernsyms, &tmpl);
 }
 
+dt_symbol_t *
+dt_symbol_by_name_next(const dt_symbol_t *symbol)
+{
+	return symbol ? (dt_symbol_t *)symbol->dts_he.next : NULL;
+}
+
 /* Find a symbol in a given module.  */
 dt_symbol_t *
 dt_module_symbol_by_name(dtrace_hdl_t *dtp, dt_module_t *dmp, const char *name)
@@ -548,7 +557,7 @@ dt_symbol_name(const dt_symbol_t *symbol)
 void
 dt_symbol_to_elfsym64(dtrace_hdl_t *dtp, dt_symbol_t *symbol, Elf64_Sym *elf_symp)
 {
-	elf_symp->st_info = symbol->dts_info;
+	elf_symp->st_info = symbol->dts_info & ~GELF_ST_INFO(DT_STB_TRACE, 0);
 	elf_symp->st_value = symbol->dts_addr;
 	elf_symp->st_size = symbol->dts_size;
 	elf_symp->st_shndx = 1; /* 'not SHN_UNDEF' is all we guarantee */
@@ -557,7 +566,7 @@ dt_symbol_to_elfsym64(dtrace_hdl_t *dtp, dt_symbol_t *symbol, Elf64_Sym *elf_sym
 void
 dt_symbol_to_elfsym32(dtrace_hdl_t *dtp, dt_symbol_t *symbol, Elf32_Sym *elf_symp)
 {
-	elf_symp->st_info = symbol->dts_info;
+	elf_symp->st_info = symbol->dts_info & ~GELF_ST_INFO(DT_STB_TRACE, 0);
 	elf_symp->st_value = symbol->dts_addr;
 	elf_symp->st_size = symbol->dts_size;
 	elf_symp->st_shndx = 1; /* 'not SHN_UNDEF' is all we guarantee */
@@ -581,3 +590,39 @@ dt_symbol_module(dt_symbol_t *symbol)
 {
 	return symbol->dts_dmp;
 }
+
+/*
+ * Mark the symtab annotated with traceable flags on symbols.
+ */
+void
+dt_symtab_set_traceable(dt_symtab_t *symtab)
+{
+	symtab->dtst_flags |= DT_ST_TRACEABLE;
+}
+
+/*
+ * Return whether symbols have traceable flags.
+ */
+int
+dt_symtab_traceable(const dt_symtab_t *symtab)
+{
+	return symtab->dtst_flags & DT_ST_TRACEABLE;
+}
+
+/*
+ * Mark a symbol as traceable.
+ */
+void
+dt_symbol_set_traceable(dt_symbol_t *symbol)
+{
+	symbol->dts_info |= GELF_ST_INFO(DT_STB_TRACE, 0);
+}
+
+/*
+ * Return true if the symbol can be traced.
+ */
+int
+dt_symbol_traceable(const dt_symbol_t *symbol)
+{
+	return GELF_ST_BIND(symbol->dts_info) & DT_STB_TRACE;
+}
diff --git a/libdtrace/dt_symtab.h b/libdtrace/dt_symtab.h
index 8d396c46..9ee60c38 100644
--- a/libdtrace/dt_symtab.h
+++ b/libdtrace/dt_symtab.h
@@ -39,6 +39,7 @@ extern dt_symbol_t *dt_symbol_insert(dtrace_hdl_t *dtp, dt_symtab_t *symtab,
     struct dt_module *dmp, const char *name, GElf_Addr addr, GElf_Xword size,
     unsigned char info);
 extern dt_symbol_t *dt_symbol_by_name(dtrace_hdl_t *dtp, const char *name);
+extern dt_symbol_t *dt_symbol_by_name_next(const dt_symbol_t *symbol);
 extern dt_symbol_t *dt_module_symbol_by_name(dtrace_hdl_t *dtp,
     struct dt_module *dmp, const char *name);
 extern dt_symbol_t *dt_symbol_by_addr(dt_symtab_t *symtab, GElf_Addr dts_addr);
@@ -51,6 +52,11 @@ extern void dt_symbol_to_elfsym(dtrace_hdl_t *dtp, dt_symbol_t *symbol,
     GElf_Sym *elf_symp);
 extern struct dt_module *dt_symbol_module(dt_symbol_t *symbol);
 
+extern void dt_symtab_set_traceable(dt_symtab_t *symtab);
+extern int dt_symtab_traceable(const dt_symtab_t *symtab);
+extern void dt_symbol_set_traceable(dt_symbol_t *symbol);
+extern int dt_symbol_traceable(const dt_symbol_t *symbol);
+
 #ifdef	__cplusplus
 }
 #endif
-- 
2.45.2

