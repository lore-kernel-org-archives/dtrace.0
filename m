Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACF0340A7F
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188105; cv=fail; b=tcv4G2nOFEMH3yuAjJo2EBGd6kYGNTtNWhiaLRn4nezsWVTJZ6K4jkzkWRzI118LMohkW6IleitHKa44Qnv4UpHr2drTiQz02ANfYuOWpzSmTRoI8YwaT22/J0MAjRl37fbd7KdRJ/lreM8Cw1SLY2xeBSV1KprvhiM/WzCGwqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188105; c=relaxed/simple;
	bh=6bO94ucl0pDTM/qUmUP/VoyfzEqbmocoC6g37vORF0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UUobCPidX+I58HQGWdBAxfMqFn6hZZVfB/WQjrhJrcoINw9CcYMc/n8KrPK+uoqo4O1kaz2iwnt1B8+xGFtYL6vsTlYTHttaRBv9awBmX4nKmMYZ4wklSL85tPjRPaM24h7+K5V5Rd62cvUrF8Ru76g2fwvCmfhnA5q8LXacM7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AkQt775Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hj9dJJpW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AkQt775Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hj9dJJpW"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQJuTfj3082359
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vn8iCI9lZnwVjlcIY8
	VFaGWaiqaiTC61JrP0FMI7fZU=; b=AkQt775QRJ6BY5STAHWpW5bhojAUsHn2d9
	MOrMeN98LgfsvFxqy+SI7n2KGbUtEIfLyEMyELSyRRd7fPm1HAfTbiOp8a8HxIMX
	UuTGYG8ukeqsu22y9u+JA3ZFYgeYpXLhtmg/2WXTuR/Jl7sNaMhTLKp1PdNsRPbt
	cI2UVRAGxfH1PIl66HmXdxUEImDdTMx9XwMAtJ8kAy19sopm3eTfEhc9ArJZpcl2
	y8hHzZvmtQx3k2b+0ZVqYK54iQrGjCIRWFAjqNlb20jGgYtk9hpltIwrdyyy+HuB
	7g9GOMhsgEMp7SMggJ5p28MvC/ISZDS0CXE/n69Mz7Kv2kqbcBJA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak8ddngry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:15:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AQJ9Osa029663
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:15:01 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010019.outbound.protection.outlook.com [52.101.61.19])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ak3meyvax-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 26 Nov 2025 20:15:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+z4E3f+u73MlTAX2gUaOh/vknw+0FJT4Nn4nt9msUcWYIRd+9uO4Er9r2/bEQGLZBDygO9p0FtLfUUNrqDGhLmMprhDZUxl6PBjbx7Is0uU5BA3cDVOosuRSSBGUdK/RVGEuFT6YOehuAqyar2jfEdFWy5iSz3772Gnkxc26DeAW3YF8ozEaMLbY5w1G7eshSW9icB/iMgqqs/0O8le/ihW1qQZKtqoubVWw1TLHKtzO/qb/0X1Xbbw1UswOmlFjGS4HJ/Pz6uRjMnvxcLqy0mmlP8Q2YijfyH8sLAzX0MZ3PFou6LvL1lIayH/OQrwXBgGlSsplPRpbt/+M1n4sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn8iCI9lZnwVjlcIY8VFaGWaiqaiTC61JrP0FMI7fZU=;
 b=L4I7oVmO+xr7pV3aKJAInWG0iOZbmbZjbNWHpaIvamlyRoSS4eZ3zG6+mZuAmVyzP0miBlgPKR3HX/vDvOKOJI6pAXJ1UkizUAnhiJZmneG1CZi5vDsL9MS7dEh9XvILuT/isqbzUHZClwE7GaoiSGeafXXDI9dMhHUah8BjAw9kw7UH7DxSdFkSozqur/5YE1I21agyWyLEOAPLhAv+pJ2SvTdG4whnJo41ShsZuGrdgLUxiKuuK1ONUlG9uVZWPltgIwi6Bu80/Bc9aDqrIxG9DbpUikhNUqsY4pfSb5hk48edoI64P3GQAWzgUzDte4APmg3Ri/LEu+ZbrciHmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn8iCI9lZnwVjlcIY8VFaGWaiqaiTC61JrP0FMI7fZU=;
 b=hj9dJJpWbhjXpnor2tTi1ZNbYkV0ms1yeXS7a+2YcYdxO8n2w2h36hqFbMy/32VqLVn5ed8K6DOzGrpa1/dbp683GsCqqGJLQ7G8D3VTCEE7OEheEqmkUlIv4YUNlHlMSLtX231AR+gUXcVl4tmHNyleXm8aKUHBJ2IHkO2CVpI=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH0PR10MB7098.namprd10.prod.outlook.com (2603:10b6:510:26e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 20:14:57 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 20:14:57 +0000
Date: Wed, 26 Nov 2025 15:14:54 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] doc: Add include path for sys/usdt.h
Message-ID: <aSdfvqGrZuXyz8tm@oracle.com>
References: <20251126200258.32436-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126200258.32436-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH0PR10MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5b5125-0056-4da8-17a8-08de2d287839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8tGg5X57zB3T+qY9yEafs6hDXOaCkMH0I/93cLzZGJpOismdR67cisqX3lLD?=
 =?us-ascii?Q?go6ez48tLMKY7TBbK9+N9mxuiWVwoExabaQfTm1t3ME6JQPXNlqJJonxy2bS?=
 =?us-ascii?Q?2Qu0JxSd4VoKp/q9LJ2qPhb5V8JKWMniUdIxy4bDmpbO5uaFOfMEaUdYLooW?=
 =?us-ascii?Q?BUBbKtLh1px/PEC3W9ISpzSBsfYql62d3g2G6PKarbPF9Mfy42kq1MnErUz8?=
 =?us-ascii?Q?IrfT3Acd1oqMVkdGr8mqJcfvuyMapnRZAlq8/QO/DLMsamkf1pwvNYv3TTNV?=
 =?us-ascii?Q?fi0GgZX8nu10ovAf5sKONd9IiDDOkijvVG7dkUPUBk7L5nkukLLFwV8XjgTd?=
 =?us-ascii?Q?jQK5lif9C0KVcOjqLW/s4vBbByyfbCVadOaTKHp47Zf1z4oPI2uZlQc4M1wp?=
 =?us-ascii?Q?e4xCbr90H7+Jed0S3JXzQL3D7Aup+jwnpSP72zkIdF1UcpDh2SXqEFp+JkHt?=
 =?us-ascii?Q?+8uelbCK5R/ZtEJG8Nekf7ajSOwrsFTK4EcEB7s1OGex3jv3WR7vlr/lm80N?=
 =?us-ascii?Q?JzC8ebpqgXS1o+PfniRBbVfU0gyzQkqNLuSIRzqSow3laW37RrdDguZkZREV?=
 =?us-ascii?Q?dU/kEZFq/OSN1NEmaBb57XMkoiw80XL/kCUtNz5gt95B22+emhMGbpHzNf7A?=
 =?us-ascii?Q?XSXljjFTIu7gxO+N7aqu8l1y2iKwczf0Nye77fSdAFmL3WCS4lYMtCTps2pJ?=
 =?us-ascii?Q?RSKCleibohumWgXnDuAFYJSi4Sis4A1jgsaJH+7F5C/JgM5h6Tm9hopHtMS4?=
 =?us-ascii?Q?7/+c/eC2velZ8qbLBJdhhylejPQLD7az35a16PX7aB1UMAYmNJXMfKgmcwq/?=
 =?us-ascii?Q?qIKqV61E87ot02MAjFKYB/LPbaXg27u+amHqCI+iQU8puwyGNU1vkHONVB7x?=
 =?us-ascii?Q?FM/NUPcrpTJkn+gz09P0r6e9Xsy/5f0fDHzQe0qygxD+GDGKYMdVpPz6ly25?=
 =?us-ascii?Q?AI8Wa+wTRIiJBXmefnuuFv1eBkOjj3VYyIq6vCiFltAT3HwxYMqoOhuver0D?=
 =?us-ascii?Q?YUFYWi9U+4aO4L1SLzxKDOsyHVfiRsYVjogmIQPX8bAxqeAPZD+TYKC0SFoS?=
 =?us-ascii?Q?cl6wco/5ZIm8MO2as6kumPkQ66N2KoDCKX/gklVLdfV9qKs+jTcaaUylBJkt?=
 =?us-ascii?Q?39e9yvXJghLiXHj+4Mc+A3OFYkrTwCdesBQsZlI/pHhdG05yPQ+RmyRCp2I/?=
 =?us-ascii?Q?VBESOKMuWmEWUQlhrNu+OwObusJadjqD/RkkQ2zvmCwGg2Agv24JbFx9RXpW?=
 =?us-ascii?Q?8NQfoEM3BkrKDpVx8wYSRnJQGg8tfgCBshZ9Ximm90SAzYAlqu8wqIDQ6EET?=
 =?us-ascii?Q?/6w1EjrofAT7Yidy4pBPZ2oGK7fHAH+RNwV3nSv6IU1gedrxVrGbfR4gmPBa?=
 =?us-ascii?Q?5UqFySyVuVGd0p++NXbxf3bxfYqdT3ImYfumO6RhNJVL6/Of01xLBvJ/X0Pq?=
 =?us-ascii?Q?eoOSvIjTtBm4+VPlhFwc/cNH3imFKowY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/bpmp5tAUYT1l56Q9DsyuOx47k6epXrtSJv9W9S7Ogp1DL2Vfg2v0/1gIep6?=
 =?us-ascii?Q?D+BPDMGgpaHT3QyzgiVSQ/aRInLlPKNn6Mf1H3b/zUBU+hqrbQaWok1xpdKX?=
 =?us-ascii?Q?oxTEoN0TTXrwwRwP4/KxCcspBJp7RRbRxzmk2J7ZsBW+LSCpqgQARfqDiFza?=
 =?us-ascii?Q?HVM2+KbxAj54JbpioSLh1Y+pNxWxeVyARWGaJ+zuw0eaxnkE2V7WumUjOa4w?=
 =?us-ascii?Q?HM4mZQeADFeeidjnzOIMiTnM7Nhg+TWFPmcQb+tijPvO2o3THVYwaWTSuvnx?=
 =?us-ascii?Q?NatnTXwFmLD6z9Jsus8KWib1oUENbNOTY82OuqAFIBwGsEGkbuikFNLXi/oJ?=
 =?us-ascii?Q?+es+NeUggr7CktMaPqTeUBodULjFu1Zi3dxomYrE+taoN/0TuqswKq1qqnPx?=
 =?us-ascii?Q?ROaQedH/rXI/AMmNCNgxJekglSNo1B+xa/poo6eFsjCAluV4Fan8EKfCqrOy?=
 =?us-ascii?Q?biwVSTkeaN4mfBH20DOKLSibtCbE8I86SrhTu8QFbk9RY2pfrEP2f/xyDNDe?=
 =?us-ascii?Q?NOSXa+JH5sCVJoLFyLVonsimLVwc3QYgQRQy0bIUUEeeWsCGPP4qRm7keSo+?=
 =?us-ascii?Q?GYA5auzfBck4Pwx0UYjhud/enBH9Jh/KWEAbFVBMEbplw63+nx3mP2PY1ELC?=
 =?us-ascii?Q?fwJg/dwQHgSMwxwQvyvsO6BJHBTdACZ5lcDxlkNwMf4pajcKXqIsLoOcmlgp?=
 =?us-ascii?Q?VgcdZzy10wDbJfkf2JUSuAlssfeNDjG3XIc/FwFKe/1V/a4zL9yYpE/BQdID?=
 =?us-ascii?Q?M4hWyF90PH7E9jGfPreeY8V6fmkToKAlgMrsbG4PKPymF33HFxxy8/p+QZwy?=
 =?us-ascii?Q?EZVLWVvYNmKRv+wTzsA/lIEWSZw9FMjEaZs2FPlJ3cpdRPx5nm1LtinNiIvT?=
 =?us-ascii?Q?2FdJ0f7G0z2kOo4NCRxWrPDRSPhFq2h3dV942bx6bCGDo8owS8Z2IsjnCZ5b?=
 =?us-ascii?Q?9gwWRHut+ebOECI+/nU2ae0ppKqPNqHgITDl48Yj7TUHQMBz05WxS+dQWd/n?=
 =?us-ascii?Q?urZ8aj/IgjzZffuc+xBOCPDsp0SMjkKsNT2wsC/PklEhjNeeC7TiPuQ/eCPk?=
 =?us-ascii?Q?m7OgWVCfXdOo9F6A8VNNb6dArn9y3FkTh5VqGmFkC5gMxUq8PvExgw9+hXHg?=
 =?us-ascii?Q?tL4Bn7aIt74ZPYUl77MHiykIJ4WalYt1tP9qDkm7ym02t87xxT3M7em38gDs?=
 =?us-ascii?Q?6umbUZto/FSBqy9958vJOlcJQ6e+nEFljy17NTL+kIs+kb5gJvJO1EhuRkap?=
 =?us-ascii?Q?mhXSLXH3KUSDm1mpYZpIcBodQu2QLwbBbqPCpeckGWzLDmq291oxqn/ccphC?=
 =?us-ascii?Q?Le0SYh3xMS47fN+0pD3aaqW5LUOKFQu+2GGpF5J3T8PUe3SjMIolA21osxTM?=
 =?us-ascii?Q?Ks9URbWIlMYBDjLWhj5hdo2faT4axOHeH+1WaW60TTJeanRlTwCnYvb9n7wb?=
 =?us-ascii?Q?VY6nRaQMNfauFIIW3TdmTA8I9Enn2HgCibcfwPpX9Ie5JKAU/zaXgTaQuFIA?=
 =?us-ascii?Q?nGccpuTI8ig3Zf71hgsLhjBCB9AxtswitSjfTNKzCXtDDewez3Wg5ThKwaV3?=
 =?us-ascii?Q?B4TeNFtg1te4Z0UFg3lCg6IObOj4oEw002N0xtoMv2gFmb+eJY6XP/oZxEKO?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hLZ78fMU0qoWsoMY2wphWGiK0LTI9uIO5hgYPE9PKd0seBTc+PTKj/WowOKX4s76lW0uG9dPz78GtxVgmY6pX60evX+2+RJ5QTHAgFBqPz/MYlBS3zV3YjAs5m11YC7je/XLcUD7yiXSsLDVzM9e2ygQjEOtBVVRanKuW/5A4C0CslU0/BrjVoOeb0usIjlVqeiUpNdMWtEMctOhJO0R828dpIkRNRgh9jHnAJMZBBaeUul9vwNCnv53Hmi0lK4wEoFjWvt2qP4kR5p4qTmvzzBgZ0hd1uOX0mVl9OlwssEgeFwQSGl1UXCrBNI1fbjsex0U47YqmErltp92yK0vrczsbUJ/V9TA+PlGkS7fwWsKu+MIZrFVXdehJvs7KbSiCyOWqn+NLOXExCIupinf/4VLV76s1CCxt8YNjww51S0B3/9XyjTmF4PSQdvCxOoj5n0IyqeI4cuCGlxlQSW9Jvrgm7dVXFyXyV5ambBx2OoF6irX1Ku2eAVptc1vv3L98gzI42DWHTVbwSpz1EF0uXbbeLrAqNwPOjkHste47hWcZFJsXhaGcMf5GGyPS+JbcWs9yElfHSaQg2uq0LjSWrNxwkB2jH15eX4ac8J8/yw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5b5125-0056-4da8-17a8-08de2d287839
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 20:14:57.3462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFl3O664QcFF5IADdtOAUwlj+vrv049aS+NC4ZOYbeji1olBbmIfsdakv+vAOFAWK6M/WXGlAdJfezGr3uXWiR4D0VC3CWpS/86DqaIcwO0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7098
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510240000 definitions=main-2511260164
X-Proofpoint-GUID: 6_VELGcWa1dZf_IfkQSRnywfz-KxkJv-
X-Authority-Analysis: v=2.4 cv=ObqVzxTY c=1 sm=1 tr=0 ts=69275fc5 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=gy2Ro_FX9eGampgkbCQA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12099
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE2NCBTYWx0ZWRfXwcwRVahTG4jp
 l3VjtoauOuSAKK/jxC2tElxGcSLG7DFFc/R1hYoSZDFmQT6SF6rjeNWdAt/KPIZLSvE2KoILink
 5YJUUHkICAREeNxhSO3qjuiXLY3sLCooFou4GTXW+o6b7FsqDYcfTN659MqJ/jfxxmls1PS7TZg
 XyfRH3WS05be9IFSMIcwwG/q4dw/BaVXn+IX7uOc/1JzTuc942zJ+G4akm26rqoQvbmywafgSM0
 zlIQwcuie0FHlO6+VSFRa9JXU7bU7k9BYS0gtkL9iW7t+wX6/55YoNI1J5ctgY3muO2PLPjbTBs
 HRCu//e+fUMyudHGrClCGPzupMrYaRKGbscdwNCnR9pGcwGBhSFRVUVx2A68+XBv+/4v8sCHk13
 SwBacaiDfghgW9QQrOGWQGtj3x6E9zbKI1Eq/2pvSS2jOn2V7Zo=
X-Proofpoint-ORIG-GUID: 6_VELGcWa1dZf_IfkQSRnywfz-KxkJv-

On Wed, Nov 26, 2025 at 03:02:58PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> When dtrace constructs a USDT header, it includes the header sys/usdt.h.
> 
> Add a note to our documentation that /usr/lib64/dtrace/include needs to
> be on the include path for this header to be found.

That is only valid if the files get installed in their default location.
It would probably be better to suggest that people use
	pkg-config --cflags dtrace_sdt
which will yield output like:
	-I/usr/lib64/dtrace/include	

This would typically be used in a Makefile to populate or add to) CFLAGS.

> While we are at it, break long lines of text up for better readability
> of the Markdown file and simpler diffs in the future.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  ...ticallyDefinedTracingofUserApplications.md | 109 +++++++++++++-----
>  1 file changed, 83 insertions(+), 26 deletions(-)
> 
> diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> index e8298dea8..cec7845ed 100644
> --- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> +++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
> @@ -1,17 +1,26 @@
>  
>  # USDT Provider <a id="dt_ref_usdt_prov">
>  
> -Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
> +Use the USDT provider, for user space statically defined tracing,
> +to instrument user space code with probes that are meaningful for an application.
>  
> -For example, if an application has `put` and `get` operations, you can insert `put` and `get` instrumentation points in the source code, even if each operation is implemented on several code paths. A DTrace user could then enable such probes to trace activity, even without knowing how those operations are implemented in the source code. As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled. USDT probes can also appear in shared libraries.
> +For example, if an application has `put` and `get` operations,
> +you can insert `put` and `get` instrumentation points in the source code,
> +even if each operation is implemented on several code paths.
> +A DTrace user could then enable such probes to trace activity,
> +even without knowing how those operations are implemented in the source code.
> +As usual, there are negligible performance impacts for DTrace probes when the probes aren't enabled.
> +USDT probes can also appear in shared libraries.
>  
> -USDT is for user space processes. For kernel modules, statically defined tracing is handled by the related SDT mechanism.
> +USDT is for user space processes.
> +For kernel modules, statically defined tracing is handled by the related SDT mechanism.
>  
>  **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
>  
>  ## Defining USDT Providers and Probes <a id="dt_ref_usdtprobes_prov">
>  
> -Define USDT providers and probes in a `.d` file that you add to the source code. For example, a file `myproviders.d` contains:
> +Define USDT providers and probes in a `.d` file that you add to the source code.
> +For example, a file `myproviders.d` contains:
>  
>  ```
>  provider myprov
> @@ -21,17 +30,28 @@ provider myprov
>  };
>  ```
>  
> -In this example, the provider name is `myprov`, but, as with the `pid` provider, DTrace users must append the process ID \(pid\) of the process or processes that interest them. In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids. For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`. In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented, even processes that haven't yet started. Or, as with the `pid` provider, you can use a symbolic pid, such as `myprov$target` for the process started with the `-c` option.
> +In this example, the provider name is `myprov`, but, as with the `pid` provider,
> +DTrace users must append the process ID \(pid\) of the process or processes that interest them.
> +In contrast to the `pid` provider, the USDT provider descriptions can use wildcards for the pids.
> +For example, specifying `myprov1234` traces this provider's probes only for process ID `1234`.
> +In contrast, `myprov*` traces this provider's probes for all processes that have been appropriately instrumented,
> +even processes that haven't yet started.
> +Or, as with the `pid` provider, you can use a symbolic pid,
> +such as `myprov$target` for the process started with the `-c` option.
>  
> -The provider definition lists its probes, along with any probe arguments. The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
> +The provider definition lists its probes, along with any probe arguments.
> +The D compiler converts two consecutive underscores \(`__`\) to a dash \(`-`\) in the probe name.
>  
> -This following example runs command `./a.out`, then traces the USDT probe `my-put` on that one process, displaying the two arguments to that probe.
> +This following example runs command `./a.out`,
> +then traces the USDT probe `my-put` on that one process,
> +displaying the two arguments to that probe.
>  
>  ```
>  sudo dtrace -c ./a.out -n 'myprov$target:::my-put { printf("put %d %d\n", arg0, arg1); }'
>  ```
>  
> -The following example traces all processes with `myprov` probes, even if they haven't yet started. This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
> +The following example traces all processes with `myprov` probes, even if they haven't yet started.
> +This example uses the `-Z` option of `dtrace` in case zero processes match at the time `dtrace` is started.
>  
>  ```
>  sudo dtrace -Z -n 'myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }'
> @@ -60,15 +80,27 @@ void foo(void)
>  }
>  ```
>  
> -This example includes a header file that's automatically generated. The name of this header file is derived from the file name that defines the macros to access the probes. It defines macros that provide access to the USDT probes.
> +This example includes a header file that's automatically generated.
> +The name of this header file is derived from the file name that defines the macros to access the probes.
> +It defines macros that provide access to the USDT probes.
>  
> -You can place probes in the code, referring to the probes by using the macros, which concatenate provider, and probe names, and converting to uppercase. In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
> +You can place probes in the code, referring to the probes by using the macros,
> +which concatenate provider, and probe names, and converting to uppercase.
> +In this example, the macros are `MYPROV_MY_PUT()` and `MYPROV_MY_GET()`.
>  
> -An optional optimization is to test if a probe is enabled. While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions, setting up probe arguments can be expensive. In this example, `bar(1111)` and `bar(2222)`might be costly function calls. Therefore, for each probe, DTrace also supplies an `is-enabled` macro, named by appending `_ENABLED`. In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe, to help minimize the cost of any work associated with disabled probes.
> +An optional optimization is to test if a probe is enabled.
> +While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions,
> +setting up probe arguments can be expensive.
> +In this example, `bar(1111)` and `bar(2222)`might be costly function calls.
> +Therefore, for each probe, DTrace also supplies an `is-enabled` macro,
> +named by appending `_ENABLED`.
> +In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe,
> +to help minimize the cost of any work associated with disabled probes.
>  
>  ## Building Applications With USDT Probes <a id="dt_ref_usdt_build_prov">
>  
> -The `dtrace` command becomes part of the build procedure, which can be thought of in four parts:
> +The `dtrace` command becomes part of the build procedure,
> +which can be thought of in four parts:
>  
>  1.  Generate the header file that defines the macros to access the probes. For example:
>  
> @@ -76,25 +108,38 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>      dtrace -h -s myproviders.d
>      ```
>  
> -    The previous command produces the `myproviders.h` header file. While `dtrace` requires root privileges for runtime tracing, generating the header file doesn't have this requirement.
> +    The previous command produces the `myproviders.h` header file.
> +    While `dtrace` requires root privileges for runtime tracing,
> +    generating the header file doesn't have this requirement.
>  
> -2.  Compile the source code, which includes the `dtrace` generated header file based on the provider and probe definitions. For example, for several source files:
> +2.  Compile the source code, which includes the `dtrace` generated header file based on the provider and probe definitions.
> +For example, for several source files:
>  
>      ```
> -    gcc -c func1.c
> -    gcc -c func2.c
> -    gcc -c func3.c
> +    gcc -I/usr/lib64/dtrace/include -c func1.c
> +    gcc -I/usr/lib64/dtrace/include -c func2.c
> +    gcc -I/usr/lib64/dtrace/include -c func3.c
>      ```
>  
> +    (Note:  The include path is for the header `sys/usdt.h`,
> +    which will be referenced in `myproviders.h`,
> +    generated in the previous step.  The header file
> +    is also found in `uts/common` in the DTrace
> +    source code.)
> +
>  3.  Post process each object file using `dtrace`. For example:
>  
>      ```
>      dtrace -G -s myproviders.d func1.o func2.o func3.o
>      ```
>  
> -    Again, `dtrace` doesn't require root privileges for this step. This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files, linking provider and probe definitions with a user application.
> +    Again, `dtrace` doesn't require root privileges for this step.
> +    This step also generates the object file `myproviders.o` from `myproviders.d` and the other object files,
> +    linking provider and probe definitions with a user application.
>  
> -4.  Link the final executable. The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime, for example, when you use the D function `ustack()`. For example:
> +4.  Link the final executable.
> +The `-Wl,--export-dynamic` link options to `gcc` are required for symbol lookup in a stripped executable at runtime,
> +for example, when you use the D function `ustack()`. For example:
>  
>      ```
>      gcc -Wl,--export-dynamic,--strip-all myproviders.o func1.o func2.o func3.o
> @@ -152,7 +197,7 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>  
>      ```
>      dtrace -h -s myproviders.d
> -    gcc -c func.c
> +    gcc -I/usr/lib64/dtrace/include -c func.c
>      dtrace -G -s myproviders.d func.o
>      gcc -Wl,--export-dynamic,--strip-all myproviders.o func.o
>      ```
> @@ -168,7 +213,12 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>              tick-5sec {exit(0)}'
>          ```
>  
> -        This first example, runs the `a.out` command with the `-c` option. The `-q` quiet option suppresses extraneous output. The D script is on the command line, and it prints both args for the `put` probe and reports the `get` probe. The example refers symbolically to `$target`, the pid of the target command is specified with `-c`.
> +        This first example, runs the `a.out` command with the `-c` option.
> +        The `-q` quiet option suppresses extraneous output.
> +        The D script is on the command line,
> +        and it prints both args for the `put` probe and reports the `get` probe.
> +        The example refers symbolically to `$target`,
> +        the pid of the target command is specified with `-c`.
>  
>          After five seconds, the `dtrace` job finishes, ending the target command.
>  
> @@ -184,7 +234,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>          kill $pid
>          ```
>  
> -        In this example, the command is already running with process ID `$pid`. We refer to the specific numerical pid that interests us. The `dtrace` command doesn't, in this case, end the process of interest. We handle that separately.
> +        In this example, the command is already running with process ID `$pid`.
> +        We refer to the specific numerical pid that interests us.
> +        The `dtrace` command doesn't, in this case, end the process of interest.
> +        We handle that separately.
>  
>      -   One more possibility is to run the program using:
>  
> @@ -196,7 +249,10 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>          ./a.out &
>          ```
>  
> -        In this example, the `-Z` option allows for zero probe matches at first. The probes match later, when a USDT process has started. After a short delay, a USDT process is started. At some point, the USDT process is ended.
> +        In this example, the `-Z` option allows for zero probe matches at first.
> +        The probes match later, when a USDT process has started.
> +        After a short delay, a USDT process is started.
> +        At some point, the USDT process is ended.
>  
>      In each of these cases, the output is printed after one second, and looks similar to:
>  
> @@ -217,10 +273,11 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
>          tick-5sec {exit(0)}'
>      ```
>  
> -    In this case, not only does the `put` probe not fire, but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false. Therefore, the `bar()` function isn't called. The only output displayed each second is:
> +    In this case, not only does the `put` probe not fire,
> +    but also the `is-enabled` conditional `MYPROV_MY_PUT_ENABLED()` is false.
> +    Therefore, the `bar()` function isn't called.
> +    The only output displayed each second is:
>  
>      ```
>      get
>      ```
> -
> -
> -- 
> 2.47.3
> 
