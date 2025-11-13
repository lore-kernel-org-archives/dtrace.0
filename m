Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7D27B345
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 04:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763008526; cv=fail; b=G/+INg/+T3nbzJ+tFSR9jgPXzv30GMOYdT/wVXlG9DcseHOlNq73TPMNdEuutjAgDnMuxhWnRnZQIAUChFjaxuTZAdOO+u8Om3WeLlEFudtxysyW6ehXkS9OfTlveCgCqIBY39Hqr15OZo3lCWWzXqFqS5g6zFquN0Ige1oqNrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763008526; c=relaxed/simple;
	bh=Y2pSOB43+VYLGDcty/yTOpjHaNUhg1juFge+q5zAhTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jiygCIg8KHALonBB+ciUn4isNjhrmpD7Rf2NhrlUfolTgTCkf4LdzUrYe7949eTesrDXoNoRfr/2F6Hd65+c+jeysPYlq052e8aXbnTyseje3bEnDIau2Lq5Erf6li642yLOi40PvvkqoLEqDYuuijgUeReTgrtwd6FPIyTI4IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EVWIvFgG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rp/YPnMX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EVWIvFgG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rp/YPnMX"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD1gSl3004506
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 04:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bKrfRzjZIJ4USt9snx
	1hLMQPyGCla+PFmSPsVvJQytg=; b=EVWIvFgGkG2xh4yntZNqQerC9fpBWq4kQY
	d5/ENEEoqOg6q4ER/tzD2cNsdufeQoJBUvQc0vM9GUmWsslas5xt403znlxDLXSv
	YiBA1TRpV9NJIx24hGicncJ8Xh129IBlnkrvX9/ejiFgtxn1Q9NO1UeuQc3NlLpi
	JoFJJuGKUh8a+yXIViPP/WjQq9uMOp7gEDRES81wYk96elMOlljmPpQc/Hxy+FES
	IJhZ/qzwYUA2bNlO3gsf7r4nMZITUXMTUriVnO8h9OG4bI+UoLa9MZ7XlLkcxBsf
	VY7blBKrVI6VCWRzlVCe9eCVMfPBkb4XtwrwVUFJyE0MEXb7zFug==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4acxwq0y9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 04:35:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AD4A1bq032492
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 04:35:22 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011055.outbound.protection.outlook.com [52.101.52.55])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a9vanc6m7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 13 Nov 2025 04:35:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nN+KJOAq2SZuTMiZl4Fh7137NCIKeI8PaA5jwcJnwvYrR/kgCrMvH9LWloR7JOsNCOYdzH+fX8ZbUa8INMz6BzjRpeP1+CD9PmpPHUU0ioZbnJGFl5XPuq/DuNKINzIpdNvpKctNQ0vjhv01dUiONNWT/1tCXBoscjgoDZI/dD/ieWGccOhD6q9fkuK6c/uEOdii639LHpTteWWA7fgyUQOiA5aX990ihcnvDw49v2O3/OWX62+HvrdJ+NLXQhewZd3yd5PZhJyHgEuT6HnYK+Vz63eSb0ix6gIq0rSIT0xiiYyNY1XJ3n2dL1Aon08jnvGVdacBIBFyGB49VFvqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKrfRzjZIJ4USt9snx1hLMQPyGCla+PFmSPsVvJQytg=;
 b=Z0IBw5eNTwI4JulwJ/ennsEdVUtnqS490idX+yxFI2b0kCz7I08cmzQ8M2Jl1haYqwG7a5iL9T2ul0uwqJclWxZTwkqpwPCMIna6mUi6PeIgscvaKQS9Na5I1fLcXx3GzrDUKMMG/ZkGrdRROTBEssjjpv00N9Ia2rw9+iSeaWrNxF1/4xGRud3IkTQXndT3MnQkuQ43xfnYR6p5zYiviCLHeAegK05D5jOVnvd7439BzViO9BAyQTIEYK8zWfAXsZVc8bTYwktxqgr47QWwyDSZhhvAEeFrRKfT71FC+B75WmRgaLsLTRWgr7sDE1QUfr9KR+7+IXHriLAVWxPVqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKrfRzjZIJ4USt9snx1hLMQPyGCla+PFmSPsVvJQytg=;
 b=rp/YPnMXYNAAy7hZ1obGFF4D+1U8I55F2104C0xAvcBWbbRa3DEs0e6L21a7BG03XuDsh0rBSGpZeEda1vHbJvSiNLRg8WNmLiruo6ryLBUCUh8RpbKmfW7BRdtdbT/R5yBdx+R5acUar0C1xyWmD13uR+hVpi2aSrtkNLvfYF4=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by BL3PR10MB6043.namprd10.prod.outlook.com (2603:10b6:208:3b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 04:35:19 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 04:35:19 +0000
Date: Wed, 12 Nov 2025 23:35:16 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: Skip tst.depth.sh
Message-ID: <aRVgBEdxCAs2d/a3@oracle.com>
References: <20251113003555.26580-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113003555.26580-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|BL3PR10MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d8e7af-6c92-48c9-61da-08de226e0cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Xac7dXNYKJf3S3nHjuGGevFdf5Ym6pdS45d8SvSRKTIofrRFkdfoo9TEN7g?=
 =?us-ascii?Q?y/UpZR+e8Kw891f0uqhftwzGI+DaC7nhMHea8Ie8J+x1vRrziatIhhG+2Afq?=
 =?us-ascii?Q?WsGj6DoIJ7Z0jotcBBxRsO0xHk7YvsO86XyiwEFgOF+NRvDfVsL8FNx6K0zN?=
 =?us-ascii?Q?Sy4TB7ir9UdfYWx8cDjNoohMq+SIFhM6zvIzn40Lx0DVb10x+d6JsLsF+lSp?=
 =?us-ascii?Q?KVjTwFsm93CWrCeTKpM2EBV3aNbEhKAB7i8/paMjVwNLITfutVnPIuxp/NO1?=
 =?us-ascii?Q?avLjKVI/raMjNdj/Q/W8uJ8u4trIr9N64IY1ehs155eNsyVxFO93gMf3q9C/?=
 =?us-ascii?Q?q6/X85ZbB/RKLgtmku7o5+bmwra8jAI9lI7ha4b3LTi9KEeSDqidEVyLSZXi?=
 =?us-ascii?Q?CTkW0syNDddwMCaMq3r0MGzLNZfakxN4PcLx86inEuw8J5N/yj8I7LsYVmmS?=
 =?us-ascii?Q?hw97w/P0ZjnNP+KZWwMdWv5eQeJ3T3gWh5tLohGa06zDa2djxraQ4sNl6nlc?=
 =?us-ascii?Q?wCg3ZeOhW2iTJVoltVkWU9mQCZDFPXveLrT0KYYo/RBk5tOsY217f/zb5gaO?=
 =?us-ascii?Q?9Z2QiCWuN6rsZQJdE29hVGXHZlUFcxQjlpahTcgcaIMmLSbRFZcBxlVGRkaF?=
 =?us-ascii?Q?uW1Y+BMF9ttUEq395lzv85X6/sP7A//p7GkNfV0ZtsL8Y40ktIK1JyUm5nhg?=
 =?us-ascii?Q?INfmzgkgn+ya93a0B5ZhSUMAd7d/ebqCqKR6iexiJbIFFiS4gVeI9FqtCTta?=
 =?us-ascii?Q?PUZ9nOF30z4j4HXDQvESXpU6HWyHPYWzfudlUjaLhHhsEB3lQO3qWnHRmP+c?=
 =?us-ascii?Q?GQOfrN7EovGly3Fxb2yr0pR9xYFhzCIkmZdIw039cJ3FQXUxZz6xzvNs+JYj?=
 =?us-ascii?Q?rdEShoZ7Vxw3HvHTE9QteVDg5BHBzWnee7o0dC+DaUGVpVhkt8UskIunIRCy?=
 =?us-ascii?Q?R0AzOY5P0d5e3IQjlXrC80UBKB6UOhsNCl9Y+AbrBlUOBF210qy2WW3BP+VI?=
 =?us-ascii?Q?2Kl4ZktzW0gR9/B1TB64SZOQpY0B6wD8ZnmFzdV6Yp0CYiwIkJX0TF8QfyP4?=
 =?us-ascii?Q?9fDrmG6ekd8puCym20ZwjUCZ9O1xwdYAvNCBWQpvAorqnNvLaDb7L2Py6hGL?=
 =?us-ascii?Q?358bPN5iV2dEb10cAs46O43cHEyaSQo0+E/c6HAbgn68RlWSuCcp/E43FY4f?=
 =?us-ascii?Q?eIogqV7b/mLfBS/Z2Jx4EZU+JKg32aYsZq75XWprd7T9Q64ExabWNmZAVU3x?=
 =?us-ascii?Q?iwr3mwMjmM6QJd3MFKazjRvblT6i/epgabZuSExoBQrgQb0BqvRgN3txWcs3?=
 =?us-ascii?Q?RAt0vERoECrniunSSe4mq56kDgbSnTjGn01AS11BKos8gURm13AWLAQO5rHx?=
 =?us-ascii?Q?Px4sKdL9xzpXSDv9JxB6xpfL7hG3h9AmNNNWU33attIF/pdyA2Admt2eHVBs?=
 =?us-ascii?Q?ixquMsMDBVcKu/CWJ2XFsX/4OZ/j0+1nfjtx9BQYKm5p0z32+Sosbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EAcGBeOxOf/dhYtAFRx467nUEpFrs5DvOR8N8uJpOr6GDawTF6f0kr1VVyzU?=
 =?us-ascii?Q?V1+bBcHLUHV0n6lqWqEMNW82Dse6EeqeHf4fO8KLzETC1g4Ywy4Z3ClKFT/P?=
 =?us-ascii?Q?wS+JTjwzo9LmcGHBI41Wv7WgiZLGbTjIb8QjGznpyvq9aH28pjMo/VymOUvl?=
 =?us-ascii?Q?qgQjHxpcdJYKaBXD78Vk5VTJzMNc+3p2UM5yk7ZRGe0qihxm7AveJFzftC96?=
 =?us-ascii?Q?W0g9xphhJhl60rWwgHbw2PO2DKKFD/KhGQOQzMGySSY7e4ZD1cOj9vaBr5is?=
 =?us-ascii?Q?uNVu1usk3jjU+q3l+wooIszrpnaD51WbtqN2KN6MauRtlenHQXwokodUckop?=
 =?us-ascii?Q?txs/lf2yAlKMPKaCYNvne+Kb7mlImWqtFQ90ZBcRs/B9GM1Ta9r2shH+Qh/f?=
 =?us-ascii?Q?1bVgz5pzOjADbx4VZXtEO0+cG+nmNFMsu9XjWMvT4mo6ve8g0tUTANXsSGjy?=
 =?us-ascii?Q?m70VGsMETLwe+6AB1mQdIYxT1mNqAc7zoiEOhshp5N6TiJ9OUxqG7LFluOKT?=
 =?us-ascii?Q?UX3rLozy5Rl/sz6L6U1VZsRFQs04uV9f1kiZPosUUXoBbnSKrpS3sw8RhGEA?=
 =?us-ascii?Q?GZEUEg0MX5VfeAXPi/IiZtnyJAofYuAZ1ndjspalkjTk9H8Q2q4cvvWuYy+K?=
 =?us-ascii?Q?EE96qs48uGPwK4yEuyT+Nkg/A9ANRHx6bQXme9pgu0Lza7DdXj7btpjJiWeL?=
 =?us-ascii?Q?ouOF42XKbQ6/XZIAdnGnoW1SooQqctFKmMksd9TvgvTtvTpxgT401WT18xTl?=
 =?us-ascii?Q?S8DTeqggn24ThNTpcCWzzArU/4nF24YBQaJsmCJYIGBr/3AeqR3WDLXhqyEw?=
 =?us-ascii?Q?nxYs2nk4SKMRJM10r0h4eK/SG3IdZFgY++6RPrmB3xfEVAuBYPny4tDgJORc?=
 =?us-ascii?Q?qiMqC+ZZcwW5xq8kOvkkDLAyzDt+wnH8z+NEvf2TDnTuJNjC/LK65sSMjcH5?=
 =?us-ascii?Q?F6Z7Z2fABZCK2usDB7XEaZC/6cA9j7GNE/0n05ZUzFhXg7O7pDG31whYrpYb?=
 =?us-ascii?Q?TC1LCKxlndMGg5kG8MHcwxtUYvQeh/hQ1HRKKgSxCMiZSb/tWZthMCUOC1dk?=
 =?us-ascii?Q?Y7vM9yAYzmdK7B3mr0/tKmy2wnfsHW6aTJICKjcDec7o5cdK9VIIK873r0xl?=
 =?us-ascii?Q?MYyCRERN9wS2X6tICSrS5u5StOtFYnRRWvTvLcsUDYWpTqEXDf7hmUKqQn8x?=
 =?us-ascii?Q?OUrZkXsfDIeryyewEZHTTTjppJ85n9qQen1ORJRX0zvwznfjLn1n7TLT3SaM?=
 =?us-ascii?Q?Bb/D3EwMChqjnYsQED11y1scLRT8/NRj3uDzhQIXNZlYX4QOz7YGIVLtth0l?=
 =?us-ascii?Q?gzujJsMBLOAXMkKTAHDQN/SuRCBfUecu9CegUl9otRS4mdS1X/ISC4qdPPBU?=
 =?us-ascii?Q?gJpvGFEHqL4zPWzwRV0SKZXK/acZLXlRAi983f3jFPt1eqNPpNopZ22PZiZq?=
 =?us-ascii?Q?uJETyNqnRhZvEutZ1aoS2atSurTmbyHOK+/CBqDsQ3lGg6j02BKJry+Yz6x+?=
 =?us-ascii?Q?XwnGMpKddah+169l2b9fhBzN8WhnZtwZpgTMDjQ6IXXxzfWdDiHWpBf8TUdD?=
 =?us-ascii?Q?Tx9pn2dtM/p8xkc1BCQp2b0uorl5cNWh8YP4cySfrNAlDPpNK5puDaRzXKHo?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d3Lq9N3h0pRYb+FuuaUCLBXVn3dnX+b6PZiGq0YmXvNqqKQQp/N1TDsUE6EOosf3bz8Kp5u5LwL6cXg/mN5XUpghTp+f7dAeySMPU30RuwdSk91RmdJmuO2smThUk8oAho6Ynr4uFsMvtJcvR+NITbrjD75MoLPDVwYXPJBjp7kU4nO7nEr0t1bcOO/hC6bIplpaSdNrg0vLr8R0Yl1fEDYPuWVZK1by1VSCXiXDyRDYZTEHN77KRBOL7zUt3A6XbqRo3yCDb3eqxypxz6Lcjh2UwK01tSnjMSma8o99mdhsc+1prktAP7TVrdAHbCuY2qytxOsMlHcWHiKVW3RHoqq5PNjTOTjCFctV6RF3CeRqVUx+kX7CyGbEwI2wlixszMz9AAkYI1IojRYYQuBqZZOb9L/nvQbeCja4WD32WQL0DzykY8BSS2eXgH2EvdY1OKKks9RJ6gye1HXAJSKdbUPBIvZBP111v6pH9XG2fEshqS52BM1s5fA2DzHNp9y+Tvamto/1AtUJ7TrpFFrwdNTgvjwD4TaDhNmcHRpktMmSwWCtxWdHZse5vX/ICpFsLm9NVsDq2PbTuJTnSkKASom61Wq7hnOZz2fveOZsbIQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d8e7af-6c92-48c9-61da-08de226e0cd3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 04:35:19.2607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YShyFdpuTC5tVXP7vy3ddthV4yO+QJqVGbhmRLu7npLWETJ7eqYeekB/KM8MEwYr6BzP1jM1aXrP/UvDj4dBLdBbbbq1DyaYhiapPE5hfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6043
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511130027
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDE0MSBTYWx0ZWRfX51O8H8VjTadE
 XSbMjkcfgMGYE9eMFW/39TI5iASc2mFs2hqZHBHZZLU6D1jNexhJ7Meg6k3cFTwio8wYp/mDXJw
 YYG5wIiPtBb2H6F8a3ZuCPbzgLDKkRbAgg3OcJ+5fCHw0Zh+MqRurdT6eoXshlAFrz/tLnly7YE
 jN5kAjgpWlImlpaAFALmr4PNm1SSzr1ONcgD9ETZqBzORGiyBKEFpC8Rk6UeTT7jNGjfRxpePt2
 1dFCGn902uTo7lNYH8LPBLT4OoDj1erZiJYBz4Jh+JKNLhBKLj2GNmZ+IcQEWCBWVys5IlIaQ/e
 HdV9PbNbRWB9rXvXhI0LBKpAwUSvzdkuqfLxgqW+9gySc2KW5MeIU/MMoAUQuq8WAs7WSUOiPQ3
 xLbVWFel0wrzxTA1x7MiVqzPway6UkvtiMVqmTbAK+wqCNPOtFk=
X-Proofpoint-ORIG-GUID: -vG1ezqb9LkMcj_5-Y1Xf1bWGJJOmUCE
X-Authority-Analysis: v=2.4 cv=RrjI7SmK c=1 sm=1 tr=0 ts=6915600b b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=LCzTMgVYQW7u4Z6TO6YA:9 a=CjuIK1q_8ugA:10 a=8Y6zDpjSdwQA:10
 cc=ntf awl=host:12100
X-Proofpoint-GUID: -vG1ezqb9LkMcj_5-Y1Xf1bWGJJOmUCE

NAK...

If this is causing havoc, it is identifying a real problem that needs to be
addressed.  That is what the test is for.  Given that you (in this v2) now
identify that we already had some other test that got SKIPped because it
causes issues with a large number of probes, and we did not look at that with
the 2.0.4 release *because* it was a skipped test and thus did not alert us
that there are issues in this area, SKIPping is clearly not the appropriate way
to deal with these issues.

We should retain the test as-is, and investigate + fix the underlying
problem(s).  Hiding them from sight is clearly not effective enough.

On Wed, Nov 12, 2025 at 07:35:55PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The test asks for very many pid probes.  E.g.,
> 
>         pid$target:::entry,
>         pid$target:::return,
>         pid$target:a.out::,
> 
> If it is successful, this can wreak havoc on some systems, in some cases
> leading to 1-2 dozen subsequent tests failing due to cascading problems:
> poor test clean up, triggers left running, persistent loads, pid=0 not
> running, tests timing out, and so on.  These problems require
> investigation.
> 
> For now, skip the precipitating test.
> 
> See
> https://oss.oracle.com/pipermail/dtrace-devel/2025-November/006916.html
> 
> Incidentally, there are similar issues for
> 
> * test/unittest/pid/err.D_PROC_CREATEFAIL.many.d
>   but this test is already marked SKIP, apparently for the same reason.
>   See commit d9423bd79
>   ("err.D_PROC_CREATEFAIL.many.d causes failures in subsequent tests").
>   The current patch simply seeks to apply the same SKIP to another test.
> 
> * test/demo/user/userfunc.d
>   but this test is marked XFAIL since it needs a trigger
> 
> All three tests should be resolved when the underlying problem is
> tackled.
> 
> Orabug: 38642080
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/ustack/tst.depth.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
> index dec16a3aa..4a67291de 100755
> --- a/test/unittest/ustack/tst.depth.sh
> +++ b/test/unittest/ustack/tst.depth.sh
> @@ -1,10 +1,10 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
> -# @@xfail: dtv2
> +# @@skip
>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> -- 
> 2.47.3
> 
