Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28DAD2C
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365972; cv=fail; b=VbSyKErN1oiW9/nLs07CIxauBJFkLs8Rt3F0ugoLYLyr4A8JZz2oSHcrRgRAYgXYUXvXZoU9L9Lh1F3IavZ6ZMaXJHsc+hoLQIlCIU8m55kDe5zFnyAkENR/3XuFTiAlPepAkxUaN4onjUlR3DgNqINbYEGBy/so0DiZmyV0Cng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365972; c=relaxed/simple;
	bh=aiyDRIwrIiMf/e+ImVNDMF3VuwKPdO69r7jdG5dYiGo=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d8nCtdY2imoyI+z7qTbDNbEilzv2kbtu+Kf/3cRrDX00TUuR5C8zLMWA5z4FfCNIBhzAgZ1QOkCnbOy10fapqo7G/ghUL2NOtLNHuCtpOIrbkSRKVVPm5hVCvevqVo2aR83lkNg0ptSQooh4k1ZTV/FQYDCmSglR+LJoh4c3mrg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ehR15VvL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CGzKmY4Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ehR15VvL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CGzKmY4Q"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J61iRK019573
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=HXiVvo4Vn5fybLBYPy
	sO8hvQw8VtBS+LJ2OFqmPiB6I=; b=ehR15VvLb7valUUxKNMN+H3Zd6OMCDt3iq
	AYUDXuxhP9EuYB6wdB5ZTRbIP4NoyHnf2ADsOHgvTLe3tU/OOi7387Bb4FrEs72q
	pUNauzwwlCtGWzNRigYLnrUMvp8s8en+2IbUPHI5RdmLmo4D3A2s8IVNAtQI5k6W
	nXotn6ihRLeKLCU5r1mkx2oYxyrbpLwaB3S0jm3rot+Ptf1394xHhHw5Ex5csihO
	DoSSDMhWBZJbSTrclRXpIwyKIbrliBsNMWK0DRO6dDlA+dfK6kIUW8Y0nhgPwMZ3
	LFjBG5NsCEQoP9ockxK9b1RARKYceO7sapkYB/fF98D9EjanIvaA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1kba81b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52J52IVj009868
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxm0r288-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUHam6UlVTcWbnWbXJER+DYk3KFkNEAwyvzSIpcRAn20pq38/kVDH4ght+GkmOSAwQA5egRMrt7NVep/bqtUMIQJ4Fv7nfE6XVN/mqShlFfhNvEcibf57v08Mb0+Yt7o9S7d7EZUfW6ot+0/etCdCIl/XBc1WQi+pGe90+Oi6zEnwMZGA/s5NAUgWr/doYx0MzRANGqczySp+jAjc4HYBt7uO9ngcQFTTiwpQGH7DVDoSkZemhruPbJUHTwBaYuwZ2gDxmKYSfj3JDnEIvxbvZkeYdRy30EovM7zeCizkmf9dKUGyDyAYhpPrp8JtT1yeHehjBfEZK/hhe474ju9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXiVvo4Vn5fybLBYPysO8hvQw8VtBS+LJ2OFqmPiB6I=;
 b=WCYre5UWlhPgPxZVpJ+kEq9wgoU6YskL7NoeEG7qW92qQORL0Rcb8QeBpy6srWOsyyNNpbFr8K2LQG9HTYu/m3LZUS2OKmtsFHrm100d9cXqn/AFjzXi9BWsaxEff5sKHLCnd+ghjokzjzqtrUmJQg2eYzz/uamv80t7hZ07ct+h9lO8UwhCVFV2LFCWnJhe37TIf79BZ/Nn9GgGTxDbN8WH+VUOZrzMnqES2Ql+KKX2g74q5uL9LPdORHvpa8LlTZXaGjzFgK0/lpHW3BVszFUbktfjacrEq2B6psr/6/eeazV42bK+R4rmha5goC2Myvj9S9qx3Bds5zXfH/yWiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXiVvo4Vn5fybLBYPysO8hvQw8VtBS+LJ2OFqmPiB6I=;
 b=CGzKmY4Qs0BjAL9O8SN80Ieyab265fejOCasLsb4uBNrZGBEn5smijE1Zde/UbwxNVsuC+sHoI2YBoa6VivYHhnBNyI1Wx21tshNpRY4gMmhJBwt1KBNS0j2/v1ICusHY15jI7YHaltxA+Ppq9AD9GPKXn5NBms7FLvxUJA7X4s=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7638.namprd10.prod.outlook.com (2603:10b6:303:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 06:32:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 06:32:45 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Get execargs from user space
Date: Wed, 19 Mar 2025 02:32:30 -0400
Message-Id: <20250319063230.28171-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250319063230.28171-1-eugene.loh@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:208:2be::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 36035bd5-243c-42c7-81d4-08dd66afdc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SowlvPVnjysWO+mOepFrc/Vf4vOeWF2crBDx5irwRMGLq+tKxoKwmrEFqbcG?=
 =?us-ascii?Q?Atdn/N6SbkjpdKbcQo0OGSiFBU93H9Oa6E+azS2GNn7rphHpuSfx487bdNoa?=
 =?us-ascii?Q?VuCb6Q2NkJuf7nbQYf7cSJptiza+Zv6bRRqEsJe4VL6b9KEjBUetn52zvxIs?=
 =?us-ascii?Q?VX/yIh+vk6C+b2rNfbii3gHto0KEwiY8uaEEUoomXAPQmqaKspfXONmRdzE9?=
 =?us-ascii?Q?u/jxlmPQp8qtfMaBhZ1sRnvHLyBxjKYcGeCl3FTXWHPMGIGh7kBuhg4eLWUx?=
 =?us-ascii?Q?om8A/GhOtoaYs+yd95HdiQXbXTYmPW3NHz4lOQqCCzh9b0qesf5mfH+NCWDo?=
 =?us-ascii?Q?eFY1x1IWi41BQMpv25zW/vyvopkwAFGMUHLnwLl/QrCUDP65/4lneyanA8tA?=
 =?us-ascii?Q?i7Jstksyl6bC0Wfh11DNV/NBwakUe6wEWjVR8vSJwycKFmkx1Ory9k6lA4kk?=
 =?us-ascii?Q?hCyaNSTo8r9eSBndIr/AJbEaqRQHI83lu11gb32eF+E3XdSFFtPCS5FuRDyX?=
 =?us-ascii?Q?ggxpI9WGlLmjlwkSeElw5VxouJ/uPfiuvl4gqJkNBjJXqPOG//bQ38B82AQl?=
 =?us-ascii?Q?3n+23cdYqE2p1c0oL1QBh+/hhqIMru/NQu4OyzEPWWAZvJBgtiLlyFjbvT/n?=
 =?us-ascii?Q?S9g+cX9ljV0wtbInopZb0U8ol1wES9/jgc90eoibIZQfgEIX6MX25SepUNmi?=
 =?us-ascii?Q?5zDRj7MXvWgrXW3JAinpR8Z6lEtcqQgMVZv5M9SjhaYIDVTdUCXV7fCrXW8b?=
 =?us-ascii?Q?qnSi3ZBxdyzIhpwXADnxcPaobCpyxFMwBOyLg3j3ZHx/u2uHZH44y9aWYB3K?=
 =?us-ascii?Q?drnX4CKkGTK/vEj1yLPUy/g9ACYVXnmVdcEZCHRJxWQiOIfETkWUwZ2N/LL1?=
 =?us-ascii?Q?EmS6ILwtDlzaY6mFIhhtRSw1wMtPhYwG5X2ahQo4TnPvLpeDoF7dp5ee8oj+?=
 =?us-ascii?Q?s9Tk30ndesMXGbaybxOH2R7gVjm9p89JdTnwBY4vyZG3VoyBRqSCHDc37Q/j?=
 =?us-ascii?Q?gh+BCOzpHijYPfJCxC72PzmnsdARv2EfyJKv0a2/mU3K03xI/VEBGusqwcIP?=
 =?us-ascii?Q?EgmvUxjvI+0qizQblYpJJNf+eLR9+yoYop54nNBGeIj1bO2SO0eeFq3XMUZe?=
 =?us-ascii?Q?fCvUK/VowLZQ0oIMloixgCzEDecMgXmXCHCMuIftaIxQ1zjb+uVtO+8LoKZU?=
 =?us-ascii?Q?78tXImflAU+TTANhhKXdoIwxW2NT1GfF5GlFukFudiDhd8YuXQXyZ96hRbwi?=
 =?us-ascii?Q?UMtWTtWzNXXCbBSnc28Lkddeb81mrzWP+J//fbtbmuNrFJyMf+nUhN3Y86NA?=
 =?us-ascii?Q?vUxJm92z906D/dfACWHEOM5K+phewjFuv5cFaq9Q1cn0BgfrsW7kXDvBC0Yw?=
 =?us-ascii?Q?5e83Cy282DDZBO1epvvonM7O72tf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UCVBS78SVVpQDkkqM/JQjRjc/wgF237WdiPTzWnwFDyVXEUJlwSrSaVGXkC9?=
 =?us-ascii?Q?AOaH8vXIwvzmvBrTQf4cx/1SaThc9X3svNcZC+n9s75g/L4kgQKd/bS2c6j6?=
 =?us-ascii?Q?drPbTJospMy25L+XcIoDH7q/pyQ1TZ0KCFzc1NlyEUwI7GGVDRW785djaZXZ?=
 =?us-ascii?Q?1LSn9kT1B3m0Vlr3EFh24xChv+7G0sHKLMkVCu6713vXOgGJ2NJyflFCIcq7?=
 =?us-ascii?Q?MRDon+FCYXnfspZ4V4yHfK2p+uUKKPD6ptFNudCAExUaTZHTqB3ZcjBdPMZZ?=
 =?us-ascii?Q?8y2r6ugt8b762SVa2UfBz7Jl6yW7EI+opX8ZSemgfJrXSCT1m5AK21zyMPai?=
 =?us-ascii?Q?hMHOZ8OEoTOe9wXmwr0Rv9ClZHdxYGJJZaXBgG08R2fUSBP9yuiLMQmelL1Z?=
 =?us-ascii?Q?5/OqNsQCX/EC+p4692PEpYWEhYaIkCpr0vhIKzXLs97J2XV8R6lVvbwiMdZC?=
 =?us-ascii?Q?rk1AfSzH0+qscys8mUPaW4K6goUZIbC2HyVZlEsk9Org0Rj5MFJMVgKwviAE?=
 =?us-ascii?Q?HUeShez5IhqFk4rzlE8XUKFKCF5NqGPbynMwpSoxaHuBwJ4olS7medwRGV4Q?=
 =?us-ascii?Q?8AnSoLamNKkVjOFaodryi76IRYjqIUGh6hXOvSDINXUaeLNpTwiMhjhnVlIH?=
 =?us-ascii?Q?qI+ORxvu6rmID80h/GbducExjw1f0/DkiAKn5ep/NPEZpOInPx1mnAhfSuj/?=
 =?us-ascii?Q?Hp1iEIzh7eOfz32eTau+ShWya8JVpEKr2tZiNQ1tEZesx2izIqMhzP/zJ4YX?=
 =?us-ascii?Q?Zz/vETIhvC+8W9MBoW5WP7wc6t1WbSK8wl2BlfyN+08p/ZTflkb9nsb7BjKy?=
 =?us-ascii?Q?zV3JGC0ga68u5tGyVWGg3SVKb/EPVJ1yTEIowTNkzLdxZ9H5PWHsmvvfWrgv?=
 =?us-ascii?Q?RBbfhXzfTKqm6v6jlWgTHk9e7mWMqQm5vNgKRpHibsB1IXXLxjMCZ20CKdFo?=
 =?us-ascii?Q?VOdghGg4t/OuDuv6mDGsP4YIhFr2SqAqEnPTnz9EcftJpkLnXhQtZyjIk/bi?=
 =?us-ascii?Q?V9pzzOfSVyKI1X8fc9tfqVDKPksrDeU9/JXdSKIDSa2prIeOCk4fjh0DmaRC?=
 =?us-ascii?Q?teZN4bUZgnA/iYruKbCQIu/j6c/qk04J7sPiiBtREUbKmd5UqD1AqPHMXPUQ?=
 =?us-ascii?Q?PatS8nXRPS+ytmoxDZ3A0Li/ms8mWiKzpf7hEEIykWICIBFTvjdG+gA5Q7Rs?=
 =?us-ascii?Q?iUXCJiEz+gjWxf/Fn5jjztMgp8tvLe4qpMg+blQzfaCjZgSk/sNWcmOXAkUN?=
 =?us-ascii?Q?bY7ea0EAkoQZH1q+rz0+z8Zsw9WCwmA5RuX9xKtuGWwHIVTrZf2Wklb7s6QQ?=
 =?us-ascii?Q?Zd+A3ti2JieyUwsa2Z2zxzNLLkJ7LT130wNYig0plEtjNBtnfPKp/kfI635w?=
 =?us-ascii?Q?UVW8b2KpxkC0FOI/xtKxhwlzuPAAzsTDnCuVBuZS4HNqbkAqbf+awbhm5lSg?=
 =?us-ascii?Q?Cb1sE78pyOTB5yElGxcROEUtr5AX1KCpTw32mxZGVfzcsXuu2XjQVZumdpmj?=
 =?us-ascii?Q?GkkiBWldSFNhh1eayP2xTdcqLJjbZGGhahGU3qnazS51Cbzu0C+LlCGbazOH?=
 =?us-ascii?Q?XStfsBDrbYYflAVEMY6tX7kLj1dNKtW6wnvH4Bcz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PHptQC8l+tN7Xk+MiCeLn2RFtnHpA1M7crguWD95kCnwxz86XXno3uHbXAIsVPBSKjT0bLldtpoppMciYBETIZEoGMRwBMG4+/M0F/lYC/QeEnep2DyMrhWnoyLWH0LsMZYcCJuxP4vvSfLhLmy2U2qSEvPyuDUqicMfy2Ve6iv8w9zKwHJBhRQbgmw6UmI5eQOj5TQi/v4DI31OwF6BlvOvuyPTWVb3ojZHZm8fetJ4m/aBVDWLuTmpKgut8P4If3lUtMofTANfSjObS+6LUVYJFic9PPZVtReIxIaamwcNVax8XywDBBajtlVAgkU4jzFR51Fy6xBfsB5ISA+wZ9UGzGL+ZidyZb+Ey5E+rBqQnIUI2iKZRQ1rqJSZukLt1HJV12eQ+N4/3wuuaaRXA23W9QHr5bGH8ZDidSrOvKmY//nagu7JmBifRESEaLbCFjUQM0tkLObmMd0XtfFURCJxWav72Upa60wDD9LiCRbUAtocsbWp8yQb5trAiCi9v6lgrXHaDl8s0tIDx/M9Cv8pOFpK/UACQxRX3PvtL/IfgKQYxHGInT5qjPiPMbyAqmkcblIB+Qjkt8T+vRLFE8C9tpdtBA0y5xibCLyTPiM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36035bd5-243c-42c7-81d4-08dd66afdc09
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 06:32:45.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6z9tgJivqK4dNxut6N/fS+11OU6cI3hzwYaVuO0jWam/uoAxWu0jLBGYZq2HQAHzzlumsGhQ8KtKav6ILyVpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7638
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2503190043
X-Proofpoint-GUID: 6fpk0_zKA56NacJRtEFoaXg_jUkQzBcE
X-Proofpoint-ORIG-GUID: 6fpk0_zKA56NacJRtEFoaXg_jUkQzBcE

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/bvar_execargs.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bpf/bvar_execargs.S b/bpf/bvar_execargs.S
index 1c47cafb2..08844f15f 100644
--- a/bpf/bvar_execargs.S
+++ b/bpf/bvar_execargs.S
@@ -65,7 +65,7 @@ dt_bvar_execargs:
 	mov	%r1, %r9
 	mov	%r2, %r8
 	mov	%r3, %r7
-	call	BPF_FUNC_probe_read		/* bpf_probe_read(&args, len + 1, arg_start) */
+	call	BPF_FUNC_probe_read_user	/* bpf_probe_read(&args, len + 1, arg_start) */
 	jne	%r0, 0, .Lerror
 
 	/* loop over args and replace '\0' with ' ' */
-- 
2.43.5

