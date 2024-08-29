Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CDCDDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909209; cv=fail; b=a+r+arCr6J7u0E+LlihWeQOuLwNV08gjyKqrsuWJXNmSRHUD14NH9kPL6evAGiE8+bt/lWnTnCASe677qAWPuOsF2vQuJeBzYN0MY8nhPeJUusZC/pkk8xJ8JpFzJ2mVcg5fOSO4jPrIjK2u7bDJYJkrZxJqxNmaAq6fYhc+c5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909209; c=relaxed/simple;
	bh=PCAB1qQ3G3thky5TprB+8r/8o/Mx0pHsuuOhCo1nTuY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M2vcDXKgmGSGY2B0fEUuJh4ZfTb/JTlfrLDXPvPsd79Hpliwct8nAFXOpqmd3cTKa3X++hJmNAYUvWELKHhgV8H8g3yGGG4tUU9NiAFpColKXeW5YAuxKlh99qpTBIevL7y3lC5yhP0KgkKivMNU7BSmhjMoI/wQaDCikTdo0wk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cs0R+Apx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FhnEm1Ri; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cs0R+Apx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FhnEm1Ri"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fXFJ012341
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=sZNuQIC1X15dsC
	JoZeR667AlBQTRGwWF1Ni6irPUtI4=; b=cs0R+ApxSX3EoibT0gEpyhDjtadhR+
	eft1WmjyVtf3mcLgNxWAAdmQXsMVDqnKAS7eM0puuTIKdnnC69Vvit4brH/DBnid
	ggVFcXL1vcQy0DQ/T/5HSe5qDD6Z3colzCt3i72iv/DxQQulVvvKzNvMvjt12pAg
	Eo7m7G7gwjreFC8KpMA1R5PfT71gUW8i5WXc1KDdh66zfhg8KCDxcBxeQK3D9J3D
	FZuGd/R8OmaYxuSeSDkUC38hrFcAKt+75wDPUr/CdEdpiDjFTZIis9sLuseUf1I8
	emAsCR/adHIbF048tovFxQedB/ifTgSJp8RcBVxvDM3IAM6aK/gH+mWA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukk76k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3Umjn034856
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:45 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2043.outbound.protection.outlook.com [104.47.70.43])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfpe4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sS9AU8LYa5tWGvwW1C6YLoXhIrYcriWA9vAKj96ZO0lhHxR7ehFkuAk7JWMveyfTPMIZ2t6CFZ35eFd4P1A0A3v2DFDouS6+VqvXONzEm0d06S0ZDAolQlXt8RzP6A61rFXuSbehTump0jj5XbZDbazs2lYz/kbhKkPoKDDGjjtVjFMNnTKT5YjaoTWPt81WjU/SfYqYffyRzaqOQUZ9xxF7C1PkW4r8ciojdj+B+gY1xgIvjk+UUnOlv2GrbmssYeA7OFqlgi3HxBebU8qIqyvwCwOAM7lrJEikOgLi4HeawPIOa7S2ItJ34ZVPaJIsM4D99g1zLdlaeWzQnS4y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZNuQIC1X15dsCJoZeR667AlBQTRGwWF1Ni6irPUtI4=;
 b=vRnMm39RBDe2T8+fxHv0QBA4zdQzvr51mTYkC+m1AblDjF/fQgzIe4mDlxVSmrKRv7RynK7AN5nuDwxPpnn+bIfJ2TuB3swJgVcITnpvOGV3qf7fM5TmOJvDNZbH+8AjMFQA6s/bDd+upiPfKFfHlDm1N4OPctxyQw8wGPLhJvXDYhl4iqCMiz6Or5tJeQJX7BgDFN24wsjvzbbaCUFSlPeeov28a91PdpXcIkrUWPaLWh2BNjPVMmukPItuQ7BCXcSxJYzuJKq8gZTPRK2EGdRkZEO/G8WfKlZJDjDS3syJrz3stMZXZ3V98AEhYj5PbkSBLqB1Lz4WYZjvcAWwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZNuQIC1X15dsCJoZeR667AlBQTRGwWF1Ni6irPUtI4=;
 b=FhnEm1RiBwhgil+JV4oHOZo+9PAw2eGx6sVxDaLQo+w15NxwVgjpbj5OX1k0kZ4gjdx8ErG1ZXlTnyRzsbsZGJ0yzIkuMUHPKZQc2VEKMQxXAlE4Rgs7m26UGH+mhMD5V1s3mOj5lCNpBaNSCzsQr4m6DF6RJXhaQOdlqIQpZG0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:42 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 15/19] Ignore clauses: some clauses are impossible regardless of uprp
Date: Thu, 29 Aug 2024 01:25:54 -0400
Message-Id: <20240829052558.3525-15-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0456.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::36) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8a7664-4681-440f-84eb-08dcc7eb2aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VEaIr9VmKHEDbTizY/yUVrfeM0q6X6NA7yxdhV8fjOeVxEawHj+dR63w1xEq?=
 =?us-ascii?Q?pNv+fd2Tm2pRadHCb7A3OocNeySwq+vEmysSRfQVHKAzqx6SYg5qclp6adeb?=
 =?us-ascii?Q?Um1i0h0PLX8qs6NC1NjJlwvQrRgI5O+KJFMGnZf7HBKwNKoyvkoS1xL8SNJV?=
 =?us-ascii?Q?6PbuxVS7AjbauZ8qp1tWufEeECxOmm+A2WvIU06jb2sVIl14hX0nKvxKwNKx?=
 =?us-ascii?Q?TgQmb6FUglOvcWwgEUgxSUHCfBiXJQ4eKTtVw1BfuQ/nZSV+QvL5oGR7Tqo1?=
 =?us-ascii?Q?KJ0C+mOreriQOHSI692yw4QTNVVkVifu++1rr9dFGKLvjSu1ZL0j1L3ZCsH5?=
 =?us-ascii?Q?lIJuxFy21jHifgCRRQFTjVz9NeKp+Dku7NwMDUdSyUWXcrhYqXRLjze6jDn4?=
 =?us-ascii?Q?FJSylG6oOYEH6SZ6pW6qk7P1ZFX5zM4sVmFUAa2n7W6JmugdQzUwgIcjsCV8?=
 =?us-ascii?Q?gy2LHoLbs/f7RtY2MQX55Yqn3FClplj04S7XLT8L7PB340M3XDWFwThiDVR/?=
 =?us-ascii?Q?qMyf9v36blZP6G3O1boCE5MTaD2orwySsXgKR8tjafrVll4FYhrPpSGRVaO6?=
 =?us-ascii?Q?gTP/gq2uZGf1EkV9d+RH4rweE8ZKySaMyZltS2SLhkqF6wo/rWXSTdLSN6kr?=
 =?us-ascii?Q?hoCttBJxeTH0eklQOohw5AYsbyGPjmdBpJ+kaOcFDGR4lYTOm8bBkFJ56CDy?=
 =?us-ascii?Q?z9HE2E7oWJAwS4+RD1fdQEY/IDne9n6RqjPTzyTVYcXqhKVLzwK47ENh4Ba/?=
 =?us-ascii?Q?xpISSZdw56nsTGN6bdzNnc8sG9y3f+Md4ch1FFLOSNy60YX0uKMTkwiCxpXj?=
 =?us-ascii?Q?sced6/PIbeHygpzHEVB6yRIsN7r+4XRbqiwOyXZy/jcYVqai34Text62s8oZ?=
 =?us-ascii?Q?oYUBrEcxv95E+wQNygMhUXtjbnqJAz5h1XSxr9K+O0ryRHgHp6TmYxqWV8Y5?=
 =?us-ascii?Q?N7szNYINWD5q0+IKG4OBnlPRyczvJtcCykM2eLK0QDk8qwo5gnknAe4v/BLI?=
 =?us-ascii?Q?55AA4kndz9flgj4BYFogTVzOvXrI9wP7t7ItlNLtyi36jnBSyL1HJ+F834+F?=
 =?us-ascii?Q?OZGnkPvQwkK9UJ6XSAxUMC1U9ksIpswfangRDN6vlH+MCeVyCUsULD6FhXgP?=
 =?us-ascii?Q?ypNb5SJxK4NNltjmFwNgtQ7cTCHv2BMxvj4lzvc6wA5UTfLGiuec/OprreHG?=
 =?us-ascii?Q?CZnmhebmsE1Ann+wkplilP/P1D4oNh670rKzIbBOxqQAMcVJbnq/d+Rv7Lxw?=
 =?us-ascii?Q?GMrvHhOOgTi2cPnwl65UZBgCv/h7YA77LEdqA0ZYb4NxiHR8dAhYivEYTA2r?=
 =?us-ascii?Q?h5+pvVm0z5dxpv3rr8lUhRfw2MnMaCK4Kz5NkiV0QA7ocg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZMlrNNV67oH5TiC/LsM3n3dyBNxZjM/ugosJ/b9K7KyJU0nD4CQYQ3A1kv+R?=
 =?us-ascii?Q?pFsWMXZCew/2jqf4Tmb6EO+d7IzbvcxRt0ZS+9Vrsmb6Vl++LrB/PXxrkm/A?=
 =?us-ascii?Q?j7ZCJ6mQqEE/2mTF0stVIphMZ/RlrDzavznbWr8B3kyCo5WA+wH1rxUFqvP0?=
 =?us-ascii?Q?iP75mFuCLxt1zNt92+hUVOoYsKkvZ7HI3YkEkjbOsFJrlcdUPlLRLG7v1x7/?=
 =?us-ascii?Q?awAAvivudA3K/I7kiqaN7YKEVQH2DCb/coqri9clkq1fpBK4Rvl835KMTN/A?=
 =?us-ascii?Q?mUsUcyiCsLN/FD8xlenlpZgquEzamgTgATtsRUyQQPtSYnGXEWYQ5CHDI1ck?=
 =?us-ascii?Q?dnDwPHbgoaFsDIsBqrYgtc8wbpfpXxsIy5cFA5udBORAOQROAGfjpEpXuE/c?=
 =?us-ascii?Q?V8MhwRkjBIOQK/ynE5vb4vl+n1u2k7FNh/Xh+smfLr25rtXJXWXwSg3qbhwL?=
 =?us-ascii?Q?pfu4URQ8xmc2zuYu0Q0ZbXusT0eKGp6OCFMzVjuYBX7KJvsieRZCxMNQwUpO?=
 =?us-ascii?Q?wd00PqOGyBrfb64ph807krLMT+GKVLG4FWh587P1hfs/W1R+3tXHqerZvVkA?=
 =?us-ascii?Q?aDbCElNEv/qxiQEtl3s5B8vr+qW9cBlsj/UsZ4HHuA4z3tOYFBLuXSiEJqzb?=
 =?us-ascii?Q?ffPQIHbf/+q9XlfCIy1CaOaFJle/bWK+ESjotsy6puErplSJtmGpvVRYeX+2?=
 =?us-ascii?Q?Sb5+TnpevPXJXIrrlElIlIrINbn2sXKwe1BrPm/6cBZK/usz6lo2yot028qo?=
 =?us-ascii?Q?hUANfgmABHZy2SU9dgc9anbwbEnibZHXRiAUtqefoBStd45XEBC5YLanfWAJ?=
 =?us-ascii?Q?QjYv7ee1zGnqHhTswqfkiNsA5Bu3n1A9tVZtI7eYF0KWQINaEdH2+Ob6qVWf?=
 =?us-ascii?Q?EJu6gIezmAUqaKfAv9/LSXC0Hs8AOgeBeoSQICpyF+pvL4Em3C3fLRx0T252?=
 =?us-ascii?Q?qIKU7QbUeZCzc2eZwerwPcbOlV7hwHx+9dWjGrNuBqV3r8szGsI7tCbIk4Tw?=
 =?us-ascii?Q?Htd1baXR7R7uiCgRESa3xlodGKjqjOCegePSG3XfWT3cWbOaqajodZ9VEAW6?=
 =?us-ascii?Q?sFWzSl7S0y0zpmpN+3RnyjCO8QvAH8mXNG+uLUSMLTl2gfQeR4QiOD0Ns/YS?=
 =?us-ascii?Q?aLuQSR5oh0VlCRJuPdpioBiFDyVf5fISkDuzhU+6reGkAeslXboRvSG2bu3a?=
 =?us-ascii?Q?vMKve5uQmCQhhzZf9GKtbV1Wq17frQy9JO1/rJmRRcAPWphB8wtvsIc79nVl?=
 =?us-ascii?Q?ztzvNfOBr1dV/0nhTNMHqwuNM5jg114og7/QzRIARKkxRjzZz5vHST6pMoFd?=
 =?us-ascii?Q?8LMtg7Wtvik86D3VAwRRAflE/JDlheV1rbjHt+4KL9tImOzSZTVgSrPTBs5c?=
 =?us-ascii?Q?9044Q8YxITRVYGwURKWkCOg40d0Qma+RiYZH/diIvcvMiKEjO3u3C66+ZMMd?=
 =?us-ascii?Q?H85HpcUcKBkB6Jk70WOD+Tvxd2HrJYD6SAVL72sT7x5h5WBLK7glSKGvinr0?=
 =?us-ascii?Q?o6+m6EL6JFznLC30yl19gONdWzcVVZpLxU3zL3Mx9QfyEXboYkfMFldS4TuN?=
 =?us-ascii?Q?TzCDeegEkWJjEkvRdzT/wRTtVKgBM/V39oYVHE+0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HBo7sRH6/u77ss2iPlgvEsTGgAGCT4eChd33E4GNfq87PWu8nJyqwhXuyDA8AijyPSbv1jQ6wldAxlraH2k8ycongXg1aTGjWbgML35hrn2walVZfsC0xo4nfbMk1Bvq4B/yzoKgl9PNMIYo2mWIb4jUTviMlGUWiRC40bDwob/Y1/ZBbzs8bt3ILSoveVWhZT0m/au2bYqFZSSOGpBvV8UfKfIzmQoe/lUl+pGMe0KzLw/tBfBmOWu4HN4WyiF3faBIPK4lqPCdwc1tgWnWaRWZd3bYImRZ/sSnCsA0mMls6YKyqE+kgcAz4z8vLjASuZ58mFtH8YmttKzUaGUi9OVKdSSFhDmtZTZq8LgQbMyaAkRJwLaiA06Bg4b/42ds6pFthqwHSZ5a9cYH+Dm7jWyFyZc4qF8eKvfzR1uFZkFJgwsYrg4lryXBeD/f7DWsoB4z9662AqOs6tyJL/OEcEGF2MsX9tE0+QvCN5Kkqzm1dXihd30QVB3JfxZY6xskJtprL0sOw4q0MiPCXiale+KeT7pgZMQNjid4qjD/lIPQQFjIBEjjOOw75cacBaWP3zOnbK6OsP2+cXuFUnV6Ltrj3jQpww2+PLLa4yA+nks=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8a7664-4681-440f-84eb-08dcc7eb2aa5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:42.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdzdTuY+1U9l0NArmehOA1uVQKpNxo5rVbM7dJsIWi/z44ok2l76iii9WUgLsgh6A95RRZFgUOjw/i/8Ds6CJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: Zkk_bLsBvnOvKVT7UTM2bnkUzrlCB4V3
X-Proofpoint-ORIG-GUID: Zkk_bLsBvnOvKVT7UTM2bnkUzrlCB4V3

From: Eugene Loh <eugene.loh@oracle.com>

In ignore_clauses, for an underlying probe uprp, we try to
decide if we can safely ignore clause n.

Meanwhile, for some clauses, the probe description tells us the
clause will not be called for any USDT probe, regardless of the
underlying probe.  For example, "syscall::write:" can safely be
ignored, for all uprp.

Add a dtsd_usdt variable to each statement to track status:

    USDT_FLAG_UNINITIALIZED  not yet initialized

    USDT_FLAG_POSSIBLE       clause could possibly be called
                             for some USDT probe

    USDT_FLAG_IGNORE         clause can safely be ignored for
                             all USDT probes

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 56 ++++++++++++++++++++++++++++++++++++--
 libdtrace/dtrace.h         |  1 +
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 883a3e9d..454c53dc 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -27,6 +27,7 @@
  */
 #include <sys/types.h>
 #include <assert.h>
+#include <ctype.h>
 #include <errno.h>
 #include <string.h>
 
@@ -232,6 +233,10 @@ grow_strtab(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+#define USDT_FLAG_UNINITIALIZED	0
+#define USDT_FLAG_POSSIBLE	1
+#define USDT_FLAG_IGNORE	2
+
 /*
  * Judge whether clause "n" could ever be called as a USDT probe
  * for this underlying probe.
@@ -239,7 +244,53 @@ grow_strtab(dtrace_hdl_t *dtp)
 static int
 ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 {
-	/* To be safe, ignore nothing. */
+	dtrace_probedesc_t	*pdp = &dtp->dt_stmts[n]->dtsd_ecbdesc->dted_probe;
+	int			*usdt_stat = &dtp->dt_stmts[n]->dtsd_usdt;
+
+	/*
+	 * Some clauses could never be called for a USDT probe,
+	 * regardless of the underlying probe uprp.  Cache this
+	 * status in dt_stmts[n]->dtsd_usdt (pointed to by usdt_stat).
+	 */
+	if (*usdt_stat == USDT_FLAG_UNINITIALIZED) {
+		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
+
+		/*
+		 * If the last char in the provider description is
+		 * neither '*' nor a digit, it cannot be a USDT probe.
+		 */
+		if (lastchar != '*' && !isdigit(lastchar)) {
+			*usdt_stat = USDT_FLAG_IGNORE;
+			return 1;
+		}
+
+		/*
+		 * If the provider description is "pid[0-9]*", it
+		 * is a pid probe, not USDT.
+		 */
+		if (strncmp(pdp->prv, "pid", 3) == 0) {
+			int i, l = strlen(pdp->prv);
+
+			for (i = 3; i < l; i++)
+				if (!isdigit((pdp->prv[i])))
+					break;
+
+			if (i == l) {
+				*usdt_stat = USDT_FLAG_IGNORE;
+				return 1;
+			}
+		}
+
+		/* Otherwise, it is possibly a USDT probe. */
+		*usdt_stat = USDT_FLAG_POSSIBLE;
+	}
+	if (*usdt_stat == USDT_FLAG_IGNORE)
+		return 1;
+
+	/*
+	 * If USDT_FLAG_POSSIBLE, try to use uprp.
+	 */
+
 	return 0;
 }
 
@@ -267,7 +318,8 @@ static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
 	 */
 	memset(&pcb, 0, sizeof(dt_pcb_t));
 	for (i = 0; i < dtp->dt_clause_nextid; i++)
-		dt_pid_create_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb, 1);
+		if (dtp->dt_stmts[i]->dtsd_usdt != USDT_FLAG_IGNORE)
+			dt_pid_create_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb, 1);
 
 	while (prid < dtp->dt_probe_id) {
 		dt_bpf_probe_t pinfo;
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index a23052e4..2de7067f 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -151,6 +151,7 @@ typedef struct dtrace_stmtdesc {
 	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
 	int dtsd_clauseflags;			/* clause flags */
 	int dtsd_index;				/* index in dtp->dt_stmts */
+	int dtsd_usdt;				/* flags describing USDT use, see dt_prov_uprobe.c */
 } dtrace_stmtdesc_t;
 
 /* dtsd clause flags */
-- 
2.43.5

