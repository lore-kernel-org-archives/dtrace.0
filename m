Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44315AAB8
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109127; cv=fail; b=q3A8EEwZBIyJ7o2/AK6KWgnnd229Bah2F3XjkaZyoX8zK2Y5jbVx7yXRnl89mSUhhIhY9n1QY8FsUkKXLVPgZxx+3WyZfQtT46qrlFOjJ6e9DfIkUiHg9aPxm5YfPL8vzPb7/jmKiTwThJ1amRZqD3RkRbEWgc9cHYjydB8hZBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109127; c=relaxed/simple;
	bh=2Gkv63JPAfmrApvg+tu+MPk5FOLKJsOcVSW2DrqhrvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sWci1sdD1VPUXG4r9bu1LMa6StLO/sUBsYmZyBERFjSXbSI5kev/mkxy+eC8N8MaIPWpGmoMPBUKrfuimvUQnmOUCmCJg783vJ1E1yfD7eOhWo7BxsIThn9ZyO9B34JGRtu5R4jVmDP+kK5cPYp9F+4pbppRkCB5Fet7eGr7a+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X+gH/lcc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zWvIO/FI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X+gH/lcc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zWvIO/FI"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKHUj014732
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=jIx2Fq0m1rOoaoN
	aV1FJu9iXj2zAFI93UNpxbXvaJ/k=; b=X+gH/lccgUG+qq3e/f5SRzlOoSFwYd9
	m3q+gHU1wostP16MIlsIDtX/VwWuro+gvmTmwdhq4RP2rX5N9CLPZbaFXZjAiG8G
	rmEgQjDdKDDpuQF0EL4Q/mwxTPlqpgSXXpbi/7R4fv/o5EwdwW5t2OHfLCDfdeM7
	ylxbDM4c/oo6tnt8ZqdGln6HdFhB++LC1SDL0TpePUlrGBR6dSrNufVf1JArtphZ
	ku55yfodItHqi4BAsNpHwGgmxp4noeS6m5ci//lgrXaxb9jT/rDAcACIcYKI2qnO
	HJ9JLEc6YE00K7jMsfWs7NCFDCmZl1JO5vZWlHQ3IIe+IqzGFDXw31g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6gbstc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:12:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMx6WQ027546
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:12:02 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414faw0awp-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQWrT5mjT78GaJOkTQXoNnB1dlJ8d/52RESz0DMgrhsm1v7jWV4Pw83Yjpe5VKk6CVSn7dNGGKpUw0ZhyHhou5FWY3EwnmZ+ykB3EaEGbVBdEaSozkpZT7ENc/tHvZeU3ooeSoiCEqMh9zgJMkgR3qDUEXqsZwTOkcriDXozZAIXFH9a2b2P1sz8M10MsEF8cMyCfUlKbz/VLMQbXiHKDi0S6lAT3dYQrSOMjDtKWp0Ft30VH2JKaxBRDTPvlVByys1y5DAMP2wNb2t7O8awLxyoz2eRYjTN+5X5fTfUDL8mD3taIfeGZt+5ftZTk8H82jVzK9YAV5e0/K7e+e/LLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIx2Fq0m1rOoaoNaV1FJu9iXj2zAFI93UNpxbXvaJ/k=;
 b=bhHX4ppzp9dthv/mGX+yw/9tCsIEYyf6QN7+9/I7NvVGfmCGu/QwyvWyKKewxVSNbX3n1JE1WefoXslm/4zsyJc6bOLz5MSXracx88djasnA2/GfIKju8D3VSJRmYjGCKK02VutfhjRs26PSfP9tBc/U8wEoqf1BteRAxC4lb0VZaPWXI4Bf3UxLBVoav30AGWwogW2rRUlG23AIuWIS/LCaiHnD3R0npBD+5MWRSYL0DTHZc+1RpT4Mvsf7Raokbdd7BQ0kkrhuHVm+Gnsa5/ePB3Zf68pT0B/XQVRyrbvYM2u7sGYbt08CE64DG4vG1c6LdV9Wmiciu/jr52NGVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jIx2Fq0m1rOoaoNaV1FJu9iXj2zAFI93UNpxbXvaJ/k=;
 b=zWvIO/FI/iO+uRSLVH/DBKT7PwkNqRa9y4Enw5jhmZi1vYNh+GXyMS+jzWMMkimV3RHNWL2ca34vDD9OKTb9lH/1U4m6qyI+2KiBXEYI6Kh5rv+hBV4btK9bVvPEYR6+nwhAjUIkny+jEDQ3UQ9WtAGODw75AzPVmwgic+PWh/c=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Mon, 19 Aug
 2024 23:11:59 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:11:59 +0000
Date: Mon, 19 Aug 2024 19:11:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/8] test: Allow aggpercpu test to omit some CPUs
Message-ID: <ZsPRPUXZkD8RRWGf@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180008.11331-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0304.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::9) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 29017834-b789-4146-5ded-08dcc0a45411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FqgPsvIFqMCOR+yTqDORiBQRwQf8OFqd+LYwRJPlXqLZ3TVmNfl45bhawf91?=
 =?us-ascii?Q?7iPOMyVRg2RqXjxPrnn13KbGgst1gbEZS1dE5JZw+GJ8wCmHpWYFLBrbRjSy?=
 =?us-ascii?Q?Sw8O3Q0YDau1EJNOdLentWtbBafwb1GHXmUEIneYtcVl4O/aHaAc8ZtAe9Lp?=
 =?us-ascii?Q?UjzR0EdjwQM+/shVCNaC4BGtqD3E6L+VYSLGDLgW14fjGSV+zTvhDNKeG8NL?=
 =?us-ascii?Q?pzbJGp1spb3iZ7GjMuIHiG9kD4857lxhzYSk5SuzaVwHSByiZbNH6B2x3xVo?=
 =?us-ascii?Q?YpLlFOosqTm9So/nuWWxNn0A79zWjNrLXZT3HWJCnK2PZW93BMJlE0BN9q5+?=
 =?us-ascii?Q?Z4VDCVGTWEaerAUutZfsEfsuhdDH1VW8if0OUuorH+8RBaiaVXV9G/EmxAuA?=
 =?us-ascii?Q?lAwNSkj6ix2cIh7csOXS0i9ALPbRjNlQPBDZAtaEevG3JhWSxGnsNJt64ksq?=
 =?us-ascii?Q?lHWzfj1IAxScTb+bUr3UlO8yqMoks4YmmpUy0xSDtJZFfXhau6AJLJ4GqVbq?=
 =?us-ascii?Q?sBfaR2o1pFkOUB5ZXgr1JY15y0RUyuONyYjGsonLi9bM9bKXFuvhvN3OYfHy?=
 =?us-ascii?Q?2jOqrgcXW24GKytT8ONUAJfvFmRvH4VMrjHw9VsLv6KOEg+rtanjVNlWUd1x?=
 =?us-ascii?Q?WBRpy/UzBDhgrH6AlhKkVp/tn99IOVzOHiTpKkIMdvnXUF8+0RBM3mgZ2go0?=
 =?us-ascii?Q?C7E/OttWHCkEobWo4iEhMLRMJbzltVXs0MGJTg12v+eYnDdLmKNHWIO02TgR?=
 =?us-ascii?Q?a4kp51u4wbcBCGpKPNbS2vv5+POObi+yIvnycG+OD5vQFobpawJy41gXBgMF?=
 =?us-ascii?Q?rway7OlvYThAaOeeT6kf9PyNhQoaCynKr9QFIybe10goFhYCgy5mwk4wDMyT?=
 =?us-ascii?Q?gLy9jeaz692BYfMqERzPxPkIypx+f261KbRAbSGt9c4ZVu+hHlYS/wX40LeC?=
 =?us-ascii?Q?vROQty/2lUT75qaqY0Vsrykac7wV6cI40dFg0oKYgialGXt8iXHLP10bsyQ8?=
 =?us-ascii?Q?hDjaVzhvbZ+z2Vl9CD//lK+kVjU3H6pe0re8ZyvzeUgWKQMrEOattWI5Idp8?=
 =?us-ascii?Q?kGDRozJw76lo9MtOGCW/xjUxX2j8K1uwdxg1TFOdxSXmgbB5UJK1MFSZ7YLi?=
 =?us-ascii?Q?NKpC58iuZeLlyRLeYZP5O7z1PTTimDeW+LDJu6GeUW58K6M9p9uihSJ6E2Zs?=
 =?us-ascii?Q?D8SOFMv/OZ9xqQo7CGkv86wR4viBJaEJ0f9J65SHwy30nQ73aSF69ZOFyvbp?=
 =?us-ascii?Q?67vy+HVjieuQjBTKO7B9Lfmiq6WM8aUQUi5i6ac5boHVt775Tv3le3X9hhpu?=
 =?us-ascii?Q?yGuwlvuX4UNEq7+zAZysfqDdcFccnmXjXrS/H+tr8FHjUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QMZMo0HMDcxpM8xOTi540PYmpI1wDYnFVLNeiZgGUc9TJpylPCcYX9N5/KdK?=
 =?us-ascii?Q?s6SCBSzPW/SyAvCom5eM+5bJ4Ob1Qcxi1kfw86hij6yLPV3jeQ+YuaAOFFCI?=
 =?us-ascii?Q?vcze8Okdfr/moPhLdSRyZekZQknM5Z2YNQcIWpnUAA/HXkZnk0XAwBrEcXPS?=
 =?us-ascii?Q?qpZx+t7It8HdnGOYvN9n82+/WPEfUc2dqtc56KAJRzPdvqkKY7hRCIY8CzQf?=
 =?us-ascii?Q?+WtK+zUDbrd+dhM2RJEJPGeFwzxLrLZwza6QR4kun3nTOJmrEjkG/sWT4OLI?=
 =?us-ascii?Q?iU9TR/M/xWNIjgvK5PRHLLKA98VI0FBq7DL7JabCq7cW9HO0j6Cqq2rz7q+X?=
 =?us-ascii?Q?haEgPTkgw6SoV/cZ8wfqZjzf55t/+zYhZa7klHClayU6jqzMUsQObti3Y6tl?=
 =?us-ascii?Q?BEvCL2qraVC4hsyStwPc3ja7mH4RdQz2hXcFSILtFzEyn/Xs9Oc3FEvCMmAf?=
 =?us-ascii?Q?Q6K4z6pxQ3XRge0FnCQtOrzGoXLVCl0Oh4uyWLHfmGO8E07C5Q/f26JSdURp?=
 =?us-ascii?Q?7NO0rDX9gau/MHTWLe4xWdKjTZuYbAU2Iyvfi33jyJCzfTtBHIMDKtQ8awnV?=
 =?us-ascii?Q?HpGnttMEqBpdY0zIm4rZ3WXOlYrCNNxE9MMftqP68WCbWiQ7N6xxHfk7ow6C?=
 =?us-ascii?Q?u0//XtpQ0BWNQBU1xMGMoysMNux3mM5l6fHDBnSWuSo9g5cXX4IfZWaclOSV?=
 =?us-ascii?Q?T1J+vp7n2lgo21dDa6PZsRx2BOQ8WrwUYov2Xsv6cMWeEXdyTp7cXZ0/CN5K?=
 =?us-ascii?Q?Cf6QiqrpO5IyalCnVzLi45lDlzPB4njDXbK6mNWssUIjjeT9KJAJDkrzd9zP?=
 =?us-ascii?Q?dLhI5wCUUtnAbpuArp6rfStxZYqbqlyLPJmXODSFd9tTUd5zROWzWPWtgseh?=
 =?us-ascii?Q?WNzeYjIIECeeO+z0Eb1ekW9xQl9MGiT7gVFyBi+ART9DL2PbH9NDqI8WbD2b?=
 =?us-ascii?Q?laLz9rtVj3VdD4mGJmIc5cUz00O/UKK6z88rhdLiDJ5iU+DxHFpHBev6d2nC?=
 =?us-ascii?Q?AY8L8jdGUowJnEd+LvhAfMxDVMDzdfWnF6SsJUKpQoD8c/KG4UeukFpaypZI?=
 =?us-ascii?Q?J/9TnEOHzLwuO+TLPGkwlg08xbz1LeBysgZTamF5aM79pJ0mqMIE6DgmIhZJ?=
 =?us-ascii?Q?TgMMm1yU2PBKoQ3fCSYt0X8dcuKRs4DnhVf0hsGO/5e1AL0gP5MrDRrXYoXB?=
 =?us-ascii?Q?JN1ytMufvNUP6yOBBNHN4mqJF693AK1zLpykJ3LRO8ACujyMHxRWkVeuZZZD?=
 =?us-ascii?Q?tcoPNFf2HNNraZet67lA1zDUJxgYqHDn/sdR7JlCJhACA8YGpbHY+XJCDmty?=
 =?us-ascii?Q?YF2BPVnyRgzeWzJnrgKvmdJE+YzM5MIATozKomF5mXWByetEKxqljmc9OORo?=
 =?us-ascii?Q?ZiqnxJOkoaZxHnaGIyGHtnLfijZJcUBN1K9UyMZPu/U/aPDcIXDDwTUBuh4/?=
 =?us-ascii?Q?szDWY/cWmUwnNi/FC4tmRRFEOddv5yMiIh5ohopCCJ/uUklJ6xA4uDvKP8AY?=
 =?us-ascii?Q?yB0W8bYmZuw7PzOJIqyhvBhErzkwebe7nMoBQB7xXUUEgGq/CfYk8YVUmcRf?=
 =?us-ascii?Q?D2xLnKBbkB2dpCtLKlbU2SFbtgwSdjpx7WkX+RfKcOJkdHPfipL9ddP9kffW?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QpbtO4KUSRYUON025ICpjw3tj1MYTQTyn2CPR28YL1KNCcsZbMQtNnqyRjOh0QGsAP4sP0JUw2swZh4kRUzwRo6PLgBZ87HyjoOR5Z0ZEh2K261KmKqWIAMX5g65X2SaFrNZ/qI5FAsyBO8U73nX+T813OOe2x9DHrEGTF7/p2YgqTKda1V4FCSFIVqImo0NibJvu9S55Jm4NMpemUz5NrTRuUK+n1TJfFx4J6Tqht/3BvtFLwGbyGoQkj8k7zvSp48tIDRXJ0rCQlseVhsYYBfIRKjx6WmXYugKyhLmBt+5lm8itf+pRdka0z6IFz7XFSVliGfHpAwWYKJ9jiEuOut1t/ik18sWKNEUGf3WTFQFiJrugHxUBDgmMEJwZ8mBKYB/G00qw/9kKnOqiGTPoaDN/S2sSZkmNpq0LptFK8WR3kY/mdLTpR/4XbkzPRomPLzS4yK1VVn74Ph5aIl72ILoDzPSjhpZhq+OkXPwO5yvuBKJdrH97ZPgpuBM6yuX0mZiUx3l0q8/4X8Ezc+ZTqx6JXNprJhzPIo+KxTj7ROI6iQb/0XU6n9ZxmR+YgrHPgGkxsfWM7wh+Y038LszDwP1wCI6GtPEzUvpTSIC94U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29017834-b789-4146-5ded-08dcc0a45411
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:11:59.8421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goCgrEcsrRm72BYTOq745ci9b4hBaWgOeC+gB0DMjPYDcrUynnZVaA7C+luahb72md0Gjsvb1FHKmXTpawEomW3uGN/lW7mKNIR0jhnpFq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190155
X-Proofpoint-ORIG-GUID: lpH3a7fW0Aqz-ib4bt68FIKR-e3yplpY
X-Proofpoint-GUID: lpH3a7fW0Aqz-ib4bt68FIKR-e3yplpY

On Tue, Jun 04, 2024 at 02:00:01PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The aggpercpu test uses profile-* to fire aggregations on every CPU.
> But whether for good (offline CPUs) or bad (unreliable probe) reasons,
> a CPU might not aggregate any values.
> 
> Allow this test to skip over such CPUs.  That is, while a BPF agg map
> might have the correct default value for the aggregation function, it
> may not see any anticipated data.  The quality of profile-* probes
> should be checked by a different test.
> 
> Also, when computing avg() and stddev() in the awk check program,
> truncate results to ints more often to mimic the algorithms in DTrace
> for more robust checks.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/aggs/tst.aggpercpu.sh | 62 +++++++++++++++++++++--------
>  1 file changed, 45 insertions(+), 17 deletions(-)
> 
> diff --git a/test/unittest/aggs/tst.aggpercpu.sh b/test/unittest/aggs/tst.aggpercpu.sh
> index be74890a..6092bd17 100755
> --- a/test/unittest/aggs/tst.aggpercpu.sh
> +++ b/test/unittest/aggs/tst.aggpercpu.sh
> @@ -46,7 +46,8 @@ fi
>  awk '
>      # The expected value for the aggregation is aggval.
>      # The expected value on a CPU is (m * cpu + b).
> -    function check(label, aggval, m, b) {
> +    # The default value on a CPU that did not fire is defval.
> +    function check(label, aggval, m, b, defval) {
>          # Check the aggregation over all CPUs.
>          getline;
>          print "check:", $0;
> @@ -54,12 +55,38 @@ awk '
>  
>          # Check the per-CPU values.
>          for (i = 1; i <= ncpu; i++) {
> -            getline;
> -            print "check:", $0;
> -            if (match($0, "^    \\[CPU ") != 1 ||
> -                strtonum($2) != cpu[i] ||
> -                strtonum($3) != m * cpu[i] + b)
> -                printf("ERROR: %s, agg per cpu %d, line: %s\n", label, cpu[i], $0);
> +            do {
> +                getline;
> +                print "check:", $0;
> +
> +                # pass is +1 for pass, -1 for error, 0 for skip CPU
> +                pass = 0;
> +
> +                if (match($0, "^    \\[CPU ") != 1) {
> +                    print "ERROR: no CPU to read"
> +                    pass = -1;
> +                } else if (strtonum($2) > cpu[i]) {
> +                    print "ERROR: skipped over expected CPU"
> +                    pass = -1;
> +                } else if (strtonum($2) == cpu[i]) {
> +                    if (strtonum($3) != m * cpu[i] + b) {
> +                        print "ERROR: wrong value"
> +                        pass = -1;
> +                    } else {
> +                        # right value
> +                        pass = +1;
> +                    }
> +                } else if ($3 != defval) {
> +                    print "ERROR: wrong default value"
> +                    pass = -1;
> +                } else {
> +                    # skip over CPU that apparently did not fire
> +                    pass = 0;
> +                }
> +
> +                if (pass == -1)
> +                    printf("ERROR: %s, agg per cpu %d, line: %s\n", label, cpu[i], $0);
> +            } while (pass == 0);
>          }
>      }
>  
> @@ -99,13 +126,14 @@ awk '
>      {
>          # First we finish computing our estimates for avg and stddev.
>          # (The other results require no further action.)
> +        # (We keep truncating to ints to mimic DTrace algorithms.)
>  
> -        xavg /= xcnt;
> +        xavg /= xcnt;             xavg = int(xavg);
>  
> -        xstm /= xcnt;
> -        xstd /= xcnt;
> +        xstm /= xcnt;             xstm = int(xstm);
> +        xstd /= xcnt;             xstd = int(xstd);
>          xstd -= xstm * xstm;
> -        xstd = int(sqrt(xstd));
> +        xstd = sqrt(xstd);        xstd = int(xstd);
>  
>          # Sort the cpus.
>  
> @@ -113,12 +141,12 @@ awk '
>  
>          # Now read the results and compare.
>  
> -        check("cnt", xcnt,  0,   1);
> -        check("avg", xavg, 10,   3);
> -        check("std", xstd,  0,   0);
> -        check("min", xmin, 30, -10);
> -        check("max", xmax, 40, -15);
> -        check("sum", xsum, 50,   0);
> +        check("cnt", xcnt,  0,   1, "0");
> +        check("avg", xavg, 10,   3, "0");
> +        check("std", xstd,  0,   0, "0");
> +        check("min", xmin, 30, -10,  "9223372036854775807");
> +        check("max", xmax, 40, -15, "-9223372036854775808");
> +        check("sum", xsum, 50,   0, "0");
>  
>          printf("done\n");
>      }
> -- 
> 2.18.4
> 
