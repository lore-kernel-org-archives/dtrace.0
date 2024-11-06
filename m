Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754931D88BF
	for <dtrace@lists.linux.dev>; Wed,  6 Nov 2024 11:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730892611; cv=fail; b=idpSm+HJ2dScHWFYErpHd8qHik7apBm2E29jNDlTuIYDihRKZJ6cPY8CnwefGfO0hlAwZVGOhs4Z3q35LdoDKWVSBwG7M59M6cqIZ9m9Il51vxs+EkHGJLyDfCcg4K3rFkCWM60BmiKWdcqPxsCElujFrxetcJJ7bOaBfqZ3FHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730892611; c=relaxed/simple;
	bh=2CIdcoXRnYxyWGUbaFj9cNfbF2cMx0GKvo8hl1XEHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j02WQmXbWzX0itb/5gAn9M++FfVhIoMJMZURUPkINaXQzCV90RMdGaDjToR7IjpHYwKlidYemVq72w574rYiZN4DOOKcpE/u+ZmFaWbn2FdmkKaemtclIdleNx9GiYysI6jGIspq5HkODqfLMH3NUkqXm5/b3fqBv5f8811mQOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PysG/vcf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wxTsOT6r; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PysG/vcf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wxTsOT6r"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69Bf1V014854
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=; b=
	PysG/vcf9ETMS0EnnlTdRFc3WPkc4B170sgqf/Gi5DstsgMaPz6nNcpekri3OTR1
	WXs8IH3TkGxPEzBat4OZEi+UO/dCB0P5YlUQxq7qmupivqMddFE4ezSxNAboxn2R
	EXKjrYwJcBy16eQ1x/wbZ9v1hApxshhqgLdbYG3ZrC4lqOc7hYP6tJSJKUYlpLrl
	dtdNZ6edMAoG0tmVuq2ldF4zoi8pLt/7u5Gl2X8/ME/fa8M9n2KNe9LDV9+VCeKF
	+j7VTCY4dqVtazKA/8patKMgrm4VMbB9G2G+2j/o9qLZIFLnfMNb/VxCh0cxg5Jh
	fwUSyt1R+8hy9MjB/sidqw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagc7kbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6BKeBx031416
	for <dtrace@lists.linux.dev>; Wed, 6 Nov 2024 11:30:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nah855jy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Nov 2024 11:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qki+SdvnlWZMaoavBZWqqBHrZ0dOVoLr5fx0w+e4k0T5i24xUkUEmwUvtUWe4CjQS43xYUW7/fxEgW/QQpZUXrUAaY4PMiR0MH/KZ86nIsz+FO4M/tvt+qcJBOBgccyE2hm1TMjpyGWUmvUHaZdywJes4qNDuSzMdhRsNCnexrM8sqVhPam+RRrgywbCfbrkcxAtKNa80xOMk1kKjIeZ16EqBXDpwmpOqPDWm0jp604ybzRrLzH5+DmH58wggvHoxHDWQYb7rW804qtAIkOZgxXz65t9crwq+KQe0J1GBo3kxjKthVQUqvhXSSJysueIyjHdxPfusIvJBSse7ff8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=OkcY1MzAtzrNP0X8A2NIsNxsgSYR2PyhB3LSY4yoV3GQNda2i9ERyCLo/rt7lwF4vZUdDiFop+WiiUX6+cZQoAHvlpThjKAUxRo2BWTa2UqZBBcB+WQ8kVGZI2DoqA84eCzpFiBomw8wbp1INQh2glBwN3R2T0ljVwnef0R6xSnMIFduWs5qjuKhwYHgp/1bE0lXdgPTqmvLPWwkEul7eQp3e8pubBSlT4qMli0GU8p9g8G8q5azGhuTXZRMsAX76smnG+fCZ6pXXwwLsND/tXgpPquGUo9+XJ7+RgwKm/69Z2Y2raaYZ2IRgTAs9R3qMrMXfL7lMm2dAnn0q80cBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=wxTsOT6rkyXSZoIcZgmb42il5GkSDUqYR6Qi1EQBa8kwKjcczD7KWHuNM/JZhb4BHLkrSP86YPYCPZLsMKhGJ+s4OGOvtZD1t4H0zlbRPj1oxxAzg3Rfj+odYyY24GMMlRRqMMkvpYY8PMX4PtaaGOCUXddH3FKqs6hZju1fC5I=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by MW4PR10MB5837.namprd10.prod.outlook.com (2603:10b6:303:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 11:30:02 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Wed, 6 Nov 2024
 11:30:02 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v7 2/6] dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
Date: Wed,  6 Nov 2024 11:29:38 +0000
Message-ID: <20241106112942.264351-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241106112942.264351-1-nick.alcock@oracle.com>
References: <20241106112942.264351-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0195.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::20) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|MW4PR10MB5837:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c866a2d-e900-45cd-ebbf-08dcfe565ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qPRkilV4kqvroPHGIYvw+57r62dp4blKMM5Id8atx2YGYCHhTz/lVEdnzjP8?=
 =?us-ascii?Q?YWvS1/sLeSP5JPEJwGEokwpW/l3PAHzjqHIzHDfe/zg49L/YMXJiAN/vkfuC?=
 =?us-ascii?Q?W+/4MvdPpt49BF8BZypmLsmSnF7QdhFjh2yGQ9SlXE36Z9cJrGnRSQY54bwB?=
 =?us-ascii?Q?gtHhoIQHFX/u9p0kCt0/CVzpbK7DOQlEHLF0b9zBBb29ef4athc8Cmb/x2QR?=
 =?us-ascii?Q?w454J5h8qX5HgFI97NMDBWZfZ3CwlavHlUUQhvfE/lyTJeqwlfZ7t93dqPJA?=
 =?us-ascii?Q?cm+te5ZSnPswkufWe5QCbkoq5pmyx/wWGcL72ns4HLHVZiQaYfPsuNYPGuWC?=
 =?us-ascii?Q?X8q5O7/eAF+5hJBedv16MmAuy3qX2ecalpAdgsYQE74CDiLBrKVXh0FdGp6v?=
 =?us-ascii?Q?TjEIwdOGktLhBhJdhwOYUx//KA925z4pleO3pbEcACLkitvgZrk5DPt/SOGE?=
 =?us-ascii?Q?ezXUeQtn8G668JZIlrssem+XpFM05Tkp7J3a1XVsTfWBm/lRWl39cfrSkldZ?=
 =?us-ascii?Q?jnLTkqKfss6mKiciFnnTD6aD3mI+6lteX1PCTbvfpnmbfXhnY5gLO9rMuXn7?=
 =?us-ascii?Q?GnX7kEF/YukwWN/YrSEBAQY/IcAEnPG2d69hMQUCkIlln8qp8BAAq++X+RI9?=
 =?us-ascii?Q?DAoaMpE6UejL3i2OwsrvQrtw8aMRhQeQyB2XPg1S7i9rcTYZ9yldWkolTwch?=
 =?us-ascii?Q?k8n7rx7ivtjLbphb3wkH5DJcPhxn8WkzMHiiayt5s1p1Qir0snwP2UXSaXBG?=
 =?us-ascii?Q?9Pw94AQGZRCRri+ybDsPodZm6nO9mCSi4kVodIRkNF5ikAtFoDnjJDPl0v37?=
 =?us-ascii?Q?OAnLJmrBQTVP3DuD6g/Ur4VGdKrVwvxEBpzi8z1/tlmh6fW96kBbgadd9yM1?=
 =?us-ascii?Q?FxetVG6S4BDmhxy/F0TL+l2OM95UWFisDG7se70kql1bv+qQSvccjjyhu2yE?=
 =?us-ascii?Q?Ln+Mu5Ny4lmxvVrKLa8HTuDa9Tp5yNw2Ux+kEoVQragysSQpHgukRoyZgUeB?=
 =?us-ascii?Q?O4sCF5mniK5UuJaqngjUnC4J1b2aRbTkiVyFucspti3oz1NhDy2AxGyhCMg7?=
 =?us-ascii?Q?b9eucAgZS6+biyHfFrhHYltKBrrkRN7unhO5jiQzE/OakN0YiBmrkzqOPFY9?=
 =?us-ascii?Q?7hcBs7/R8ze9UnxCAA3fBDgFdgNsTy6ErzsSbaZWi4mYFUGza+9ib3W+gtY0?=
 =?us-ascii?Q?CCca43d4vwJ9c8oJiXygP2WwvmYXSqBkToRgXRadRJjByuvFRG6kPgCIS8hG?=
 =?us-ascii?Q?/WYrGA48zavndMO4DLuNZS4in7JS11eUhUMcVtcYcY75XLJczYozhVjPrAC6?=
 =?us-ascii?Q?4Vw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CQ6e//qAmx+vgbL7YFN8MiGOZ7cvk0bHpjFAFCAK5qz6DGrP7X5ugzUW+h0/?=
 =?us-ascii?Q?74tTjA+hjQcSyO3hCBbWGOaE84kCqzu88mz748b0wjGHI1egPFUa80UxIFwl?=
 =?us-ascii?Q?5jw65iv3J5DWbnJs7Ota0ggLEIE/iYq0qfCKMyQ8AIQ2PlqyPj18O8VMQSV2?=
 =?us-ascii?Q?TQjczER9ZqElXG4gzg6h5a7Rp5MW2pD/DcM870fMfMcQd4OmJ1q1NskW5cD6?=
 =?us-ascii?Q?BnznpaCV0hf+m2mpTxxxMBCQVXWTNd92HEDVhUOY1+pD1NptFxhCeL4XeD1D?=
 =?us-ascii?Q?JHBmNPJeOYIw9/mVj6LN2SToiCsqIrXYU62GoqaDa+kkL19bXOjBUaPoT7ME?=
 =?us-ascii?Q?Dldn/oo7EJJgGjIixs6a7RgsFvR3NPOL9KPEgTnIzMqWqFici3LQmAjBhXDb?=
 =?us-ascii?Q?MH3+KFB6Gwn4Uy0TiTUysD0NKZ2i48//49uBzVdrmWTc1aSb3BGg1gKsH9Yy?=
 =?us-ascii?Q?MV+9jq5drb+Hd2pZ1aqxg07Jorel3L7QrCrZnNgq9jdiqmPYfwbkAGFDVHiY?=
 =?us-ascii?Q?T9nbVYEo762uGAbfbS+FY9iE/akZPeBAIXaa/wvtDJwMq91Q6K6ziiEjvNZI?=
 =?us-ascii?Q?o+f8uVVLojw5r3/FkLLTLnYfqSyt3HUy8xwkMyIJO6tFic+Adm4F+XEQA6Pu?=
 =?us-ascii?Q?aFOYdBMtgFjXHipIDe79XoTSPuhUChUSOgWCqkgbOtK9JU5/lpwTjw9qfOpS?=
 =?us-ascii?Q?VrsKucD0kMsOHmYMpIevxUuvNmnVEmJ7VHXYJvrLknmsqmHlwh2Odqe9ZuNr?=
 =?us-ascii?Q?JxQ9SXzGB1TnV37TPKTXaVO5suzu7hKR71o+uAmZ5TOaeTm8g3XjS9/QSAZT?=
 =?us-ascii?Q?Ps0ykGGTbUTwYc1F9EtuUEPu5TEz6JGBJii7KvlIUJHurmeB2huwYmIeqwSS?=
 =?us-ascii?Q?GfD+ZlONQ5u+XrQ+ypAUUKjF4twoc1G3DQRoeJ+wFqAQRN/mMkrUhOWHKl6D?=
 =?us-ascii?Q?gvuK3WzD/hLCAsUMdnZXRg8KxSKjzr1Jf5dMBK2HtnFW05wRsms2EDVKB38Y?=
 =?us-ascii?Q?ykhK/DLRkTZfxZkBZWcWefC1w10wZwGIxT7giWUtbjHriLOeS7kYGFmy6azt?=
 =?us-ascii?Q?8mWYBs4lgyU4tNqGlU2XgadFh9Fpy9qG4HIJMUyBP+vOO6zw8OeDLinA5Gf5?=
 =?us-ascii?Q?VgEBjRMn2zr6KgAoZthFO33RBjSiiuVndzmdA+S81PTRLNL9Qb+oibqIhA5d?=
 =?us-ascii?Q?5JKN97+7iD9H0O7Ul1/XarUa22sPBZ5am/iuXLSqkB6ZMFGKOzJ7kNTSZiVZ?=
 =?us-ascii?Q?wchibYRaSfBqiJ683Pi+bWa/p0EE/edSBEIqOeBQKZ9aJnRES5230wL4qJOo?=
 =?us-ascii?Q?IMrbAUd4wzvEBc4+mnZnC/wuql1JveCLuqi/0gHZtuN8nt19Mq4Rg9Np/9vX?=
 =?us-ascii?Q?7o9596AZwSqSbnr7xI273hZz1pB5itih9ow/1GOly2+MYRU4bunpVMoLo7Wv?=
 =?us-ascii?Q?3ZUq13Lc08madVz9P0ASMIlBQkgZCxGMDjHtBH/yOtr8nRF0KTZ/uwtvwZJW?=
 =?us-ascii?Q?pjbeXb8vExCSK7pNIRIr3Z0p5MsRA/k9OjXJTtr2Oy7V4IDr2ydFa0NHNyq9?=
 =?us-ascii?Q?dNTnDArgQ2lojl8jrkEFiJ/clXMXnJitI6Ut3mlrw269w2lMXW8igvuo/WZB?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W5JARqIj5FWo0hXW8t2kXvSwW3MF5L4vNR6lfCmi9Ii5CDldj9+4j/O10mR4lsEzQKtZ7PXsgmp9w1Jd1L8KWIAVdU9QxSdPCfQMwh4bvZEsMkIiLIvxYRxVk2mdGzy+74a1e4+D4OcL1AqVHvvWC1WtHK97p8R/YsaVXh7jV9Rs7oSdK/wlBYnJ4j/atNbJdpAXLhc419VG2+/OovVrZHyFF5VLhXV92wjwHkyu9RTf7DGcUB2sYalhM9j9++10Hd0rhO9UrQB4pIMZF7z+1HTlt8nwtDIJlzJmxSfGDD6iewdrTXNZV9rMoesqUxe3ziOM+zPVRcxXJODN8TkDhGhXDRPkMcYwYMsBS+z+bIuYo1cDD7okIXDdrYq+laKl7wswqomULxyGZUG8i9so6rtwNQLyKq0Lh8kAvSYcWnVBpQg7agUADJsIphyLYWjjd02yi/Yp+94u+Up4RwC8sWUm6mYcaVeLkQmnc3vD4kjOy6UeotGDiCRMyGModTsrPGGVePf1Yi6qqsuhRxEI7jRMCyOUYGgK28r9l2N5N7X+hAZ8G90a4OsBd5QE8FtYBILNNYm3uJGZzeXBZo0GtuIxphr2J9SC2GzATJXJs1M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c866a2d-e900-45cd-ebbf-08dcfe565ae1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 11:30:02.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iX9e6rr0UxiongN0s4AeGH6HIgQGzsFSLJDBdNNR+lO/EfZEpwViaPwiSZFp+7Ph/rcUnp1Z3wGWDIGWgomYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5837
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-06_05,2024-11-06_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=879 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411060094
X-Proofpoint-ORIG-GUID: -tccHHtcbWv5GRo4tYAdEOnOdpUXzC0C
X-Proofpoint-GUID: -tccHHtcbWv5GRo4tYAdEOnOdpUXzC0C

We already validate that they don't exist in dof_parser.c, so no such probes
can ever get here.  Handling this impossible, untestable case has just got
harder, because we'd have to skip DIT_ARGS_{NATIVE,XLAT,MAP} records too.
Just stop considering it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 8bf465678217..82fdd3174759 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -586,12 +586,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (err != 0)
 				goto err_provider;
 
-			/*
-			 * Skip probes with zero tracepoints entirely.
-			 */
-			if (accump->parsed->probe.ntp == 0)
-				break;
-
 			mod = accump->parsed->probe.name;
 			assert(accump->parsed->size > (mod - (char *) accump->parsed));
 			fun = mod + strlen(mod) + 1;
-- 
2.46.0.278.g36e3a12567

