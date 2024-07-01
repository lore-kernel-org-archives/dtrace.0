Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF3B16DECC
	for <dtrace@lists.linux.dev>; Mon,  1 Jul 2024 16:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719852644; cv=fail; b=irlgnlp/vMGgGEtxEwpGVEiamzrF4ZTa7vS5AtkN0izuE/wGz1eHc+Fui5177ISDkTtkerRT8yFcQJ7BTWj/r3qdlD2vLI55nHlNsL9dCVdKpm2rOxCV+38f2IlWP0cGbgqU39mnxWLM3PbRDJxabQUj5oAgDPVpixRwdxuLqvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719852644; c=relaxed/simple;
	bh=t/nLwRikAkRCeg/YAdlJ4qwiw8hAo1Xg/UUBjYS1OjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eF/jhXJ9sewRzoRmgvoJNOm2DLpfd239dMpJMw9e/AGC5bbu2CxeWASFyOTD5+neuLPdHBBWm3ipM2xZdsx2mwwcwGnKvYLcM2e2+C6gJhxwkAiFKFUhvWYYVQO6taGTEHvv1e/7i//uJbMo1CDUWabTdIsc7EpwiJityp+1M6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cp9O44bv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I78EIuQ/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cp9O44bv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I78EIuQ/"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461FteZU003702
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 16:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=fbox4vFb4GwGR5K
	nI3QViIJWupYAnGSoEaJ4RKWhl3I=; b=cp9O44bvqQ9AOL+AOh4ekXpdVJAV2Uo
	L4Cu8nJxmLEwgWiA8KL1GPGWUL3eAyJDl4WnIRfOIjllBeHqzDEgLaD4SEjz6Cib
	argjbiBC0c1q0to1ANxP6pHUEjdKUmj1r4wL+2LbtmY/VoiN01u6bfSN6lz6I3zC
	BJmLCtP3ZWh0O0JvE47rZUl7mXUn9QQafq2jf3D5//zq7d2XSlBHS/6m++/YnA77
	f5RYS7EQ/xFH8oyBFMn4ZC8+dsaCZRjBt5Q5nRw2n8YJtReBamnhwxchTD8O6igO
	foedLHqG2/O99oAQo13p+p4lPlti+MWd1+o2wEW4uGCd9u9MPIt+G+w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 402a59402w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 16:50:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 461FxVlZ026086
	for <dtrace@lists.linux.dev>; Mon, 1 Jul 2024 16:50:40 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4028qcsgpc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 01 Jul 2024 16:50:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0ilBd1Ygrb+xG7g8m5BKHDg2jbm/RuAH3ta2SvdETDpmly6Dw77vuTYAA8o6mmdkFP1BkX59qSbXhxzhUIWPouFMrYakXzKeIr2hBhEymmkqYGQYlqp4RLBQ9lmQZgYXo1ajExH6cdtUCQ7vrSV+uAsDM/9Qyc1po7L7256EKH5VQUxTOn8Um547f1LnyBt+MVRWlt2cFIB75wZSZymby3ZHevawoFt7kZS3W9w82+gPwXrw3WabJB7DpoZnbIFcXJ+hHODWc0f8EDQIkbabbLIt1pRl1qBzdNHm2zSvGkpZMac4m8FUXR1YMVUVzfcYV6+5wc+GbtVD5GRC0uPfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbox4vFb4GwGR5KnI3QViIJWupYAnGSoEaJ4RKWhl3I=;
 b=SwKGk5Lq4P6nNKE/8a5XQ1voYN4tiSGYV16WZuoXJXPmRrrhWecW2vccg1ZZRvk/w9dXGFxtx2xB6QQWTaja4HFczX8YconTQ7CC2n2lxDZ1/uTgaPzbIgD968LNyLnlMA9uF01Nrb+lXDg0ICHX6uatiDssRLQLHPhyZJ+u5pWxMe6dMIVNtocjeVnxNB3AeitC9DMQjG0+9hBNYI29ZED8iqowcItaJUeKMEkKWcyy8Fee21tlj5dUrAh78/joBJi0tCqRZUN1slalc0bo1/TE8+nLvtBOfflnbMJF0iHLfKZns8oDkErcNclc2jDRtOovxNWUgiS5r7+a3d2qTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbox4vFb4GwGR5KnI3QViIJWupYAnGSoEaJ4RKWhl3I=;
 b=I78EIuQ/YryRjX9oQdNwGp7Crifv01kP5r/SUreq395UxT5ouwvM0m84vRGbPleb1TDjRBjxSqv2xKvNLsnFEu6oDQVORCZhzhkgCzRQ3z+rO33aT3u2AB4yG/g9k8LJyuFQlva9vqMa7hc6v6iCgxIaojs4fLERi+8xS+v5nH8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH0PR10MB6959.namprd10.prod.outlook.com (2603:10b6:510:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 16:50:36 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7719.022; Mon, 1 Jul 2024
 16:50:36 +0000
Date: Mon, 1 Jul 2024 12:50:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
Message-ID: <ZoLeWRMOnCoecHmx@oracle.com>
References: <20240426133327.578092-1-alan.maguire@oracle.com>
 <Zn8xVd+r8SzmLGH9@oracle.com>
 <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fd33071-54a9-497e-ae90-4daa63eafad0@oracle.com>
X-ClientProxiedBy: MN2PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:208:23a::35) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH0PR10MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 5240b125-7ea9-4a00-a5cc-08dc99edee4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RWknHIwd1q43bNcB5CZ0IXLCSEEZVqh/upzg+cyqgGVUzR4jVZANjzd4GesK?=
 =?us-ascii?Q?Zn00Ja5uE94pH9LOqm8QfkM2gCAVBXxB4sKDwI0LZqkUAZfgBb2f64mVdSjw?=
 =?us-ascii?Q?EAqLFxnYMB/tWbk3fVWS7PNLRiKa8Gh6qgFK2UkVY9O1XehV3tXQwhY9tCbx?=
 =?us-ascii?Q?i74VhEOVZaY87+8XMdlT1iAr0g5Av4NEUHeaSLp6gK8qGuuW3LG7nqub1mfx?=
 =?us-ascii?Q?tD8ke/fs66QBuu5SbrZcADqKtybEMcD1QdFeGJzlMqPjnchtoqZku8lZdQ/A?=
 =?us-ascii?Q?ovVkhjwCZr7Pbhep1bYKJ4zkUFJ6SBPt23NWbtlrS73d9gyARYEn2VI5nGD1?=
 =?us-ascii?Q?H/BNrnDG1p6Tihrqe/VUCvrkemVdNKKLJxxWsXmA9t56hvUjGKbB35x1dOrP?=
 =?us-ascii?Q?SuY5ul+J1gsuSjvdgYS1DmpVO1YYgO9psuxdmsy8XPMpsmzHSQQ7NHnzjUsB?=
 =?us-ascii?Q?NepHqAkFNfqqI6nj3rRS9IUwlA+AGsTVyNMO/4iWuMiDyPrHODof/qroIZDO?=
 =?us-ascii?Q?UvCnHa3gu7lT+MyvT5CijkAcU+cVPCVz9KxazqoZVGDWlwq5TOlrXLiToE7f?=
 =?us-ascii?Q?aJFLPxa6JkIi0lzPrFwlbu2vnSmF8ANUpq0FOHdHsPk6wATa0Y3dwhav4FTP?=
 =?us-ascii?Q?98ou9cSBG3jHhpNTEXTtcfviZgucwzWXTsKxLBGG5DEiZ3Gk6Q4UTuTEBCy8?=
 =?us-ascii?Q?2kT3HkChGUoJ2zbO1hvDp+M5nsj46sSfbkcWpVJN+juGBDaMOZqFsmTJV8js?=
 =?us-ascii?Q?k9XDHI9vHvU8nulO7HRxWOrpNvd+CHCWT4c3x7O916oI0R5hepdQBBhL9T60?=
 =?us-ascii?Q?RuPtZbKduU6VSJn82ibIp3BfRM3TxKGTz6u0vbv6RNnJo00WNTt2UJ1FCKYo?=
 =?us-ascii?Q?JAlMnkw10u1XCICc8natDjMdhSZRBX3kx8Q6TW26QbfSXqF4FRgK4Qi4ZSlr?=
 =?us-ascii?Q?08Bh4CEUFkCizBiMEnKCyys5ypuE3Y+rNbFHJC5gLJoRvvqxL2N+Do33hSL7?=
 =?us-ascii?Q?6ShE8HZtkj1VZm+eb8Sqdv78uCsh5tRd20Sq45lcgnPIgjSKoQGE22HJwNzi?=
 =?us-ascii?Q?fmUgUsJo/OOVfFnOaAOEgH78gRXcNkDCveknnM4SrryALZbUDO2WNYSZYkbT?=
 =?us-ascii?Q?vPPMTloS73N/nhJbx+tduJr5PzCu4FSNBuVeDzLegqLOHQADYJIrVoiZKa0R?=
 =?us-ascii?Q?+dG9+4qXeuQhz/0xQTYPRrFuiUzDYJ2LPDQky7288XJb+C5C5exby+yow6du?=
 =?us-ascii?Q?qXL48IKqgvWlZK9QrrZD/x1z7/FGc8YSuESFk4P97pQwhdSjIRnQ0pmvrO08?=
 =?us-ascii?Q?+iOBo5O4QszZRTGByKbi2betolAvGwJfk5+FVpiHSLFZrQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p7MttIoCUbZCC8b2C29el+gdFbmfym9Ft0LrkRUl+8G7zWMpmjNZtKaLnP98?=
 =?us-ascii?Q?xAasXSkcpwqU66MJtgg1sLqs3uIlzAMFZkljewjsXvkV0omrASzwazOkYI/y?=
 =?us-ascii?Q?+SgM0rBpA3V/fW1zF03FL7yzdGZT8E4i6KNJ/aPhmZ//mngzSogyRnd67M19?=
 =?us-ascii?Q?hS8T64tt/T6s+6Hvfx778rOfTaUuhIm7gxmvDx1gNS8EF2J4t0IL/0FdYljU?=
 =?us-ascii?Q?YSPXDSxLCZELrGfqhrCIcNIYGG3Val5daGU7shtU5uTOzIoU/kowD/4f4Vom?=
 =?us-ascii?Q?xpgPWUG5xnGxYvWZkEFnXGbISYjnARrt1z1INBTLjGePprqyFkRwcgBrRVKj?=
 =?us-ascii?Q?eH7IkcVpaTFzGTHhxocMPjdx77LT/N2UfSmP24ljUnwrkDxZFgVwmulaWIR3?=
 =?us-ascii?Q?YiAdKWrugaob8jYuaxkXeklqnxzgodDmR+jl8xhs1XuMcm7fG59n/VRWq5ZH?=
 =?us-ascii?Q?6CFC0PPSZO0lh+iMa0SY9XxZ+fpp1OOg4c2khRfyBAMPB+mmRrk3asnnkWCv?=
 =?us-ascii?Q?fZtOZLPlu37AMoZBJ2gdVtFoiDestyQHkjc+trJ514Ooy1pr5wzu4F+PgAZ/?=
 =?us-ascii?Q?OE730E75Nx5a3AyeRePhQhUm5YZZLvTjvISQvWvjyejN2MLgbwMOW95YDdl5?=
 =?us-ascii?Q?YsocfA51beROZoMTvu/equA6/I2ic5EIUWCWZKDRjXgaep6PgbFYqbmfjiLo?=
 =?us-ascii?Q?RpeX2pDW4Y36iTOZ/xiF19xU38zOZc77MNJb+1WxmZHFLf+H+1MYg3SI7fBK?=
 =?us-ascii?Q?a/pN7vY62VrIS0Zgx+pHw1Ugk6HNOWoIkdXVDM5dN6qlL0XlEbeXCKHQM0yS?=
 =?us-ascii?Q?SE3kY3mSV5jVVdy32Mi6Hl3ABtZhJ1S0FdaFL1mW2VLqilLsLSwqbv00sSe0?=
 =?us-ascii?Q?LA19GvXRW01p5xsRlF/cgtNyzKCOjj/viQjuNnkgFA1bNhy/y3FCoI3x+YvD?=
 =?us-ascii?Q?lWL4WSu8yTmRyaTJJ+d/jlnAAv4J/S0JMXlu/PpnjjwXtPb39hjdcQzeOG9x?=
 =?us-ascii?Q?9+0y7bG/oZyhqsg+yZVkSSAZNn/y1S2bBCg/D7KJJnCgvIvLg3kFAeDGoCh/?=
 =?us-ascii?Q?lLJ4THEQV6JXwGdkZDIKIUj87hgR/R5aD0zQyfedv+HWCFJXZ2zzDln7vxsZ?=
 =?us-ascii?Q?Zqq9D6ClnSdBAFbqZAt92TYQUXERn3jYy5yzj+GtfAnaijhm9x10Cp1HITr4?=
 =?us-ascii?Q?uUiaYLF6d+NBN6IEb5ZwME9p/lZGO5rbxryFLw33EJX9P4YhtIWC+zEIECQa?=
 =?us-ascii?Q?m1hJi6OAOTtwVkl1hTRdGxg+VTqg0J45AfEtzWz0DKyN3fVXcz/4CAUvHtWb?=
 =?us-ascii?Q?M2lPdye+czdXzSf/QwkCD0pvHynhuQLVfLxHXSOQDzsJVGQUNgnFpQZRC2DK?=
 =?us-ascii?Q?/FA6R5jGLmyq3Sv/G4zbwDo1Dfszatf6a0B+rCFWpicA3s41Y6odfLWcs9Jj?=
 =?us-ascii?Q?NrRBY0drvS2d2cZFfwgBfOy9nn383f1j12K64o0s4PILK1lsaELwRiXQdh0f?=
 =?us-ascii?Q?z9NKbuye04BhuJv7xku28qU1juquz5ZkxoASVajeBF75lIIDNSpWoeo50rub?=
 =?us-ascii?Q?i+WXQ6qwKmBwlNvJkuGcbggfmE3SJMUkwW9UVv1PK121nN7jtCcNrL0UWzax?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	vh4/l6qQCCh7ZqX196zy/zIinmyV04dMwO+Bv8vZDAIJ4KSOXo2i3mJcvr5469dqJUlpuN4jUNyjx3ASsmiMg4AOhTCjE33wpzq2FSPGM9H/YiySKOHoT9Bg+VlP0mPRBgUjzbYlCMCC8h76fn72ysfUKj9jOemxWDq4qgQeLCL4VUnGDrQKRSMx8jy04qMYnLWISOVoz7ZQptjPmwQlLG2vkGwk8vegdZQ4CumiEI2cFipca4vS4YpBsg8mfkuCfIfqqNUu7IfXDTgFrPOf5cJo0lwuuHeUra5JSWyupahxFmR6RHhYqtumaf/1OmqaWMMDi1cfRx4uTC9anhyrTjvxBss3GeduAPfCY8GGj3qWyKNhf3L7TdkOZIE+KOTjDcreh82EOTZGl3Ns7YoFi9Jqk8mQK52TR5jNKrCWliLAVQ5Oy0pm4YvA/B0Hah7cqsAgRxs6cxa2c6I8tA2jxQlMKAS7XdGkso0VytleY229Kxs5PmdNyqKrnA6eFu5lnA7fKZJlnZRxiKrybwhH9PfwUKKHORrpYCKHwga+XlBsknM+AdHOXUSQQB6evCLIxOGJsnAu+be+ATdwhjx4y9zyzqDHs4R07FCg2KkbN90=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5240b125-7ea9-4a00-a5cc-08dc99edee4d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 16:50:36.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9VNzV7PCEJHmwWkVtEzMNj7t/HFQ6Qqq1Zw+zEjP4NS+znJpX0LlY3G7WASaiD4ahuf8f4IJ3rQbdHzygPYVaskrWA5CIsU8zGI8UwRfuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_16,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2407010126
X-Proofpoint-GUID: 7qdQ4zqxUt95uviqqyseBBoA4XxTBkMb
X-Proofpoint-ORIG-GUID: 7qdQ4zqxUt95uviqqyseBBoA4XxTBkMb

On Mon, Jul 01, 2024 at 09:06:32AM +0100, Alan Maguire wrote:
> On 28/06/2024 22:55, Kris Van Hees wrote:
> > Looking at this again, I am wondering why we don't just add type info to the
> > data record?  Since we know the type of the data items being added to trace
> > records (and type is expressed as ctfp and type id), we might as well store
> > that in the record.  And that would make this entire situation pretty much a
> > non-issue because the record would already comtain all that we need to know
> > to consume it and print it.  No need to pass a module id.
> >  in 
> > If the issue is that modules could get unloaded and thereby some pointers
> > might become invalid, then perhaps the solution would be to always copy the
> 
> Yeah, I think (as well as modules going away) the other worry is record
> corruption, so dealing in direct pointers is too risky I think.
> 
> > type to the D dict (I think that is the right one - I always mix C and D).
> > And since that one is always around, there would be no need to associate an
> > id with the module and pass that.
> > 
> > Perhaps doing such a copy is the best action here?  And we may need to look
> > at other cases where typed data from modules might be stored, and if there are
> > any others, they may also be subject to possible issues when modules are
> > unloaded and in that case would require a similar type copying action?
> > 
> 
> I looked to see if there any CTF APIs to simplify recursive type
> copying, and  I couldn't find any and that's my worry - this sort of
> copying could get complicated fast. The other issue is size - a lot of
> the kernel types will pull in a massive number of dependenent types
> (print()ing a skb will pull in sockets, task_structs etc). Duplicating
> all of that in the D dict would be expensive I suspect. The other danger
> is introducing multiple types of the same name into the D dict might
> complicate things for other consumers of it.

I mistakenly thought that we already included code in DTrace that performs
type copying, but I cannot find it so perhaps I was mistaken (or it is more
obscure).

But then something else occured to me...

This is all compile-type-known data.  In other words, none of this is passed
in the actual trace buffer.  That means that we have a lot less worries about
how to store this information.  So, look below at your patch and some comments
that I think make it even easier.

> The worst case scenario in the current patch series - that the module
> goes away - means we can't print the type info, but that's not the end
> of the world really. Certainly in the kernel case most modules tend to
> stay loaded.
> 
> > On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
> >> when generating code for print() action we need to identify source
> >> of CTF; is it shared CTF, cdefs or ddefs or another module?
> >> Introduce a module id scheme where the module id can be stored
> >> at cg time for later retrieval at print time; this allows us
> >> to later look up the module and its associated CTF without relying
> >> on possibly freed pointers.
> >>
> >> Under the hood, the id scheme uses a monotonic counter coupled
> >> with the hash of the modules name; the latter allows us to quickly
> >> look up the right bucket via dt_htab_find_hval().
> >>
> >> This fixes an issue encountered when using a shared kernel type
> >> with alloca()ed memory; DTrace assumed the type was in ddefs
> >> and it wasn't so it wasn't displayed.  This change fixes that and
> >> all tests continue to pass.  Also tested that it works with
> >> kernel module-defined types now:
> >>
> >> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
> >> CPU     ID                    FUNCTION:NAME
> >>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
> >>                                             (struct ieee80211_hw) {
> >>                                              .conf = (struct ieee80211_conf) {
> >>                                               .listen_interval = (u16)10,
> >>                                               .long_frame_max_tx_count = (u8)4,
> >>                                               .short_frame_max_tx_count = (u8)7,
> >>                                              },
> >>
> >> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >> ---
> >>  libdtrace/dt_cg.c      |  7 ++++++-
> >>  libdtrace/dt_consume.c |  7 +++++--
> >>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
> >>  libdtrace/dt_htab.h    |  2 ++
> >>  libdtrace/dt_impl.h    |  1 +
> >>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
> >>  libdtrace/dt_module.h  |  1 +
> >>  libdtrace/dt_printf.c  | 12 +++++++++---
> >>  libdtrace/dt_printf.h  |  2 +-
> >>  9 files changed, 72 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> >> index 27246a40..30cccdaf 100644
> >> --- a/libdtrace/dt_cg.c
> >> +++ b/libdtrace/dt_cg.c
> >> @@ -20,6 +20,7 @@
> >>  #include <dt_dctx.h>
> >>  #include <dt_cg.h>
> >>  #include <dt_grammar.h>
> >> +#include <dt_module.h>
> >>  #include <dt_parser.h>
> >>  #include <dt_printf.h>
> >>  #include <dt_provider.h>
> >> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>  	ctf_id_t	type = addr->dn_type;
> >>  	char		n[DT_TYPE_NAMELEN];
> >>  	size_t		size;
> >> +	dt_module_t	*dmp;
> >>  
> >> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
> >>  	type = ctf_type_reference(fp, type);
> >>  	if (type == CTF_ERR)
> >>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> >> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
> >>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
> >>  			ctf_type_name(fp, type, n, sizeof(n)));
> >>  
> >> -	/* reserve space for addr/type, data/size */
> >> +	/* reserve space for addr/type, module identification, data/size */
> >>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>  			      sizeof(uint64_t), 8, NULL, type);
> >> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
> >>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> >>  			      size, 8, NULL, size);

Here you add a data item in the trace buffer that will actually not store
anything at all.  That got me thinking...  And then you store the data size
both as the specified size of the data item *and* as extra argument.  That use
of the extra argument is unnecessary since the size is already being added
to the record as dtrd_size (which gets its value from the 4th arg to
dt_rec_add().  That means we can use the dtrd_arg for something else.

So...  how about you do the following:

	/* reserve space for addr and data (modname and type as extra arg) */
	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
			      sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_name);
	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
			      size, 8, NULL, type);

And then the consume code can perform a module lookup by name based on the arg
that is attached to the 1st record, and get the type from the arg that is
attached to the 2nd record.

This also avoids the complication of modules possibly getting unloaded (even if
that is quite rare) because that will mean that the module cannot be found and
we can therefore take appropriate action (unknown type so just dump raw data
or something like that).

> >>  
> >> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> >> index dec2314b..432b4e12 100644
> >> --- a/libdtrace/dt_consume.c
> >> +++ b/libdtrace/dt_consume.c
> >> @@ -1987,9 +1987,11 @@ static int
> >>  dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
> >>  	       const caddr_t buf)
> >>  {
> >> -	dtrace_recdesc_t *data_rec = rec + 1;
> >> +	dtrace_recdesc_t *ctf_rec = rec + 1;
> >> +	dtrace_recdesc_t *data_rec = rec + 2;
> >>  	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
> >>  	size_t size = (size_t)data_rec->dtrd_arg;
> >> +	unsigned long dm_id = (unsigned long)ctf_rec->dtrd_arg;
> >>  	uint64_t printaddr;
> >>  
> >>  	if (size > max_size)
> >> @@ -1998,7 +2000,8 @@ dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
> >>  	if (dt_read_scalar(buf, rec, &printaddr) < 0)
> >>  		return dt_set_errno(dtp, EDT_PRINT);
> >>  
> >> -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
> >> +	return dt_print_type(dtp, fp, printaddr, dm_id,
> >> +			     (ctf_id_t)rec->dtrd_arg,
> >>  			     (caddr_t)buf + data_rec->dtrd_offset, size);
> >>  }
> >>  
> >> diff --git a/libdtrace/dt_htab.c b/libdtrace/dt_htab.c
> >> index 478c728a..3c167cb5 100644
> >> --- a/libdtrace/dt_htab.c
> >> +++ b/libdtrace/dt_htab.c
> >> @@ -229,6 +229,23 @@ void *dt_htab_find(const dt_htab_t *htab, const void *entry,
> >>  	return ent;
> >>  }
> >>  
> >> +/* Find an entry in the hashtable, using the provided callback function as a
> >> + * secondary comparison function to differentiate between entries in a bucket.
> >> + * A pre-computed hash value is passed in.
> >> + */
> >> +void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
> >> +			dt_htab_ecmp_fn *cmpf, void *arg)
> >> +{
> >> +	int		idx = hval & htab->mask;
> >> +	dt_hbucket_t	*bucket;
> >> +
> >> +	for (bucket = htab->tab[idx]; bucket; bucket = bucket->next) {
> >> +		if (cmpf(bucket->head, arg))
> >> +			return bucket->head;
> >> +	}
> >> +	return NULL;
> >> +}
> >> +
> >>  /*
> >>   * Remove an entry from the hashtable.  If we are deleting the last entry in a
> >>   * bucket, get rid of the bucket.
> >> diff --git a/libdtrace/dt_htab.h b/libdtrace/dt_htab.h
> >> index d39ae65e..1ce5a80d 100644
> >> --- a/libdtrace/dt_htab.h
> >> +++ b/libdtrace/dt_htab.h
> >> @@ -100,6 +100,8 @@ extern void *dt_htab_lookup(const dt_htab_t *htab, const void *entry);
> >>  typedef int dt_htab_ecmp_fn(const void *entry, void *arg);
> >>  extern void *dt_htab_find(const dt_htab_t *htab, const void *entry,
> >>  			  dt_htab_ecmp_fn *cmpf, void *arg);
> >> +extern void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
> >> +			       dt_htab_ecmp_fn *cmpf, void *arg);
> >>  extern size_t dt_htab_entries(const dt_htab_t *htab);
> >>  extern int dt_htab_delete(dt_htab_t *htab, void *entry);
> >>  extern void *dt_htab_next(const dt_htab_t *htab, dt_htab_next_t **it);
> >> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> >> index 2dfb64d6..2bd1dafe 100644
> >> --- a/libdtrace/dt_impl.h
> >> +++ b/libdtrace/dt_impl.h
> >> @@ -136,6 +136,7 @@ typedef struct dt_module {
> >>  	dt_list_t dm_list;	/* list forward/back pointers */
> >>  	char dm_name[DTRACE_MODNAMELEN]; /* string name of module */
> >>  	char dm_file[PATH_MAX]; /* file path of module */
> >> +	unsigned long dm_id;	/* id of module */
> >>  	uint_t dm_flags;	/* module flags (see below) */
> >>  	struct dt_hentry dm_he;	/* htab links */
> >>  	dtrace_hdl_t *dm_dtp;	/* backpointer to the dtrace instance */
> >> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> >> index 1e730426..7697f73b 100644
> >> --- a/libdtrace/dt_module.c
> >> +++ b/libdtrace/dt_module.c
> >> @@ -35,6 +35,8 @@
> >>  #define KSYM_NAME_MAX 128		    /* from kernel/scripts/kallsyms.c */
> >>  #define GZCHUNKSIZE (1024*512)		    /* gzip uncompression chunk size */
> >>  
> >> +unsigned int module_idx = 0;
> >> +
> >>  static void
> >>  dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp);
> >>  
> >> @@ -50,6 +52,12 @@ dt_module_hval(const dt_module_t *mod)
> >>  	return str2hval(mod->dm_name, 0);
> >>  }
> >>  
> >> +/* id is combination of hash and index */
> >> +static void dt_module_init_id(dt_module_t *dmp)
> >> +{
> >> +	dmp->dm_id = ((unsigned long)dt_module_hval(dmp)) << 32 | module_idx++;
> >> +}
> >> +
> >>  static int
> >>  dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
> >>  {
> >> @@ -150,6 +158,7 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
> >>  
> >>  	memset(dmp, 0, sizeof(dt_module_t));
> >>  	strlcpy(dmp->dm_name, name, sizeof(dmp->dm_name));
> >> +	dt_module_init_id(dmp);
> >>  	if (dt_htab_insert(dtp->dt_mods, dmp) < 0) {
> >>  		free(dmp);
> >>  		return NULL;
> >> @@ -193,6 +202,27 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
> >>  	return ctfp ? ctf_getspecific(ctfp) : NULL;
> >>  }
> >>  
> >> +static int
> >> +dt_module_idmatch(const dt_module_t *m1, dt_module_t *m2)
> >> +{
> >> +	return m1->dm_id == m2->dm_id;
> >> +}
> >> +
> >> +/* High-order 32 bits of id are hash value, low order the module index.
> >> + * This allows us to limit cost of search based on bucket size.
> >> + */
> >> +dt_module_t *
> >> +dt_module_lookup_by_id(dtrace_hdl_t *dtp, unsigned long id)
> >> +{
> >> +	uint32_t hval = id >> 32;
> >> +	dt_module_t tmpl;
> >> +
> >> +	tmpl.dm_id = id;
> >> +
> >> +	return dt_htab_find_hval(dtp->dt_mods, hval, (dt_htab_ecmp_fn *)dt_module_idmatch,
> >> +				 &tmpl);
> >> +}
> >> +
> >>  static int
> >>  dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
> >>  {
> >> diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
> >> index 56df17a6..68dadfc6 100644
> >> --- a/libdtrace/dt_module.h
> >> +++ b/libdtrace/dt_module.h
> >> @@ -18,6 +18,7 @@ extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
> >>  
> >>  extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
> >>  extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
> >> +extern dt_module_t *dt_module_lookup_by_id(dtrace_hdl_t *, unsigned long);
> >>  
> >>  extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
> >>  extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
> >> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> >> index 50842216..108adc23 100644
> >> --- a/libdtrace/dt_printf.c
> >> +++ b/libdtrace/dt_printf.c
> >> @@ -14,6 +14,7 @@
> >>  #include <limits.h>
> >>  #include <port.h>
> >>  
> >> +#include <dt_module.h>
> >>  #include <dt_printf.h>
> >>  #include <dt_string.h>
> >>  #include <dt_impl.h>
> >> @@ -2236,13 +2237,18 @@ err:
> >>  
> >>  int
> >>  dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
> >> -	      ctf_id_t type, caddr_t data, size_t size)
> >> +	      unsigned long dm_id, ctf_id_t type, caddr_t data, size_t size)
> >>  {
> >>  	struct dt_visit_arg dva;
> >> +	dt_module_t *dmp = dt_module_lookup_by_id(dtp, dm_id);
> >>  
> >> +	if (!dmp) {
> >> +		dt_dprintf("error retrieving CTF for print() action\n");
> >> +		return dt_set_errno(dtp, EDT_CTF);
> >> +	}
> >> +	dva.dv_ctfp = dt_module_getctf(dtp, dmp);
> >>  	dva.dv_dtp = dtp;
> >>  	dva.dv_fp = fp;
> >> -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
> >>  	dva.dv_data = data;
> >>  	dva.dv_size = size;
> >>  	dva.dv_last_depth = 0;
> >> @@ -2260,5 +2266,5 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
> >>  	if (dt_print_close_parens(&dva, 0) < 0)
> >>  		return -1;
> >>  
> >> -	return 2;
> >> +	return 3;
> >>  }
> >> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> >> index 9771c4a8..8d55d82b 100644
> >> --- a/libdtrace/dt_printf.h
> >> +++ b/libdtrace/dt_printf.h
> >> @@ -108,7 +108,7 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
> >>      const char *, caddr_t, uint64_t);
> >>  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> >>  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> >> -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
> >> +extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, unsigned long, ctf_id_t,
> >>  			 caddr_t, size_t);
> >>  
> >>  #ifdef	__cplusplus
> >> -- 
> >> 2.39.3
> >>
