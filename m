Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E911A9F93
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766105518; cv=fail; b=VAGzSAWcSOmzds8XnNu9AfvZetV9NcsKdTMoOwdKZSDWgYBf737IBjf4EJOIVWZwGSbM6JRJw1FNTpVFwkC6xWg2ozgrTY2TJGZfXMI3vd7d+VfhreS8GJLZj941IIXlpQ1GrW/Miyii2EMtl5KzL6V/WyPGZ8qf6mLlzEfoeE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766105518; c=relaxed/simple;
	bh=37Mbs+Ta7+g5U+P0jubwRMjSqjdp7GG0AymPyWiPHpw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=B/LzmhDINhBw6az/tiiBXxI/YfFyHN6YcNG11mydUtR7AD/sjbnqVKKn0I5WCey+PYIErmmCCY42a5sOFvT78kJ4hqb4e0ftYnPTd0qjfeVDKGSPmZl83W0AWUDB8o0CJ8Wt9H9W0KGfsOgMVmnubiR3HvB/Sp+xqZAagMuWRas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qRHIACIU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BEu3zC/X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qRHIACIU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BEu3zC/X"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJlOA92386939
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=9laOX719im5P06vpIQ17ThZMnP/tLB+oOYzigcu/2Es=; b=
	qRHIACIUGe2+dJ6/af2QQML/GpFJm4DAjR5I9vVony05mmGIU1Ugqza8tr0lpCv+
	vjehhVQemsRooGDpD2oG0HLxNtzkmUwaHN4PugKtCfy0b5BBanpwcAWQrrjhkANF
	NKG9vKg7malOIFtX4Z6COvI6RJGeHSn1yo7xwMjsOFQkyO5zQnoD7fNR+onNwGz2
	rFWH+RtJFVcXlszZTOyW4qbFGkHaFVjGwqGdWYdzjo6jJJOS/cwPa/l0DblMPXQr
	DmJJeVG0hk6pDpuEODPD7YD+bKkcYANIX8Sd4A0MVF9aCGCNv5jfp3qH/q64TVLt
	HjFcJ7ulHoPyMG7mBFu4jQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r298bm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:51:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BINqF0k024008
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:51:53 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012004.outbound.protection.outlook.com [40.93.195.4])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtdh91q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 00:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZfyN3knOrMaV3qfTf/uEQc/oCEZwmuATPkoaOP/SD7MZxsc2l19jACjdjEfVbB+MntD0UxU2Nh6bQgqItH/4SOcS/N4OWXENJTTA/rfBouV8IpNbrR8uoCmOAEQsvUQ1/YYJ9w9vjHVherNS8khBBYZkAgCsIluxqQFcp8YjxL08wEW3++l0jUoWt/JPnzTvXCMe2fXBPYOj3L7ppvrwVmYWXyQIbCpNcw2jD7tWILbKem35UuB/c9UTpC6dC5Iq5LQKGOmDtaXlXYGf9NrxW9+BcOyX2ThN3bzDkbQSEUnir4M0qHiM/ShsRa4K2nROZLYdArFHPn1EEbVhAIMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9laOX719im5P06vpIQ17ThZMnP/tLB+oOYzigcu/2Es=;
 b=c+OHqKAm/T1vtjYLs+xdITK8oQLmuazqeilwFic1zMi8a3KObfEzMFVedPbDfFrnw6iaJoul9Hh3ravZvgEe9s/ideezVVFDqATkeHgIx5b1DOsf/0Jk+Wy4jhxglSz70DVEg//2uZfDRz9lPhY5j3vGQZJSq/CANuY6Y+qxMsH/AggYRR4/3q7fMtng7vSa8UNfW0+fVx+PCqGfdPesHn+qTWswdIWrkllkmDljdsAiolf6S6cCRvJ7fBuJy9/A54/IQAKLDxYw/pQ1wp5uF04r3DMz2cAKetjIolNLOeqA0fEJeEvG0a8WFZjFcofQ1nw/tk3sWYsgqxd9N4elLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9laOX719im5P06vpIQ17ThZMnP/tLB+oOYzigcu/2Es=;
 b=BEu3zC/XFihErs4ZK2yn/wLXwV+9HeiubkiZtoC3rc2TX6yeHh7PKsqN689v0daY5gM5ghPqXRkyoaN7fnvyok4nx4a398KbxiNkJhDoNnLO0iX1U43Ab6+xfXVhj02QYFued2Di11LJrAMfNZyiNxie6mqI3aZkB0enD/csfE8=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by MW4PR10MB6462.namprd10.prod.outlook.com (2603:10b6:303:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 00:51:50 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 00:51:50 +0000
Date: Thu, 18 Dec 2025 19:51:48 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/4] test: correct file permissions
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522B2CF26246FD7189562CFC2A9A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|MW4PR10MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 45fc9739-8157-4e5a-6999-08de3e98cb29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9cMoPcEObuuOoPyPqPfga+AwGA2CzYl0nRwn1R8Qi1teqxV+P7iz3zeFpudD?=
 =?us-ascii?Q?M+AtI1ZEd9n+VyNnAfj/ijxizSPFA4H0fHU5YWsOZgCb84/hZsWaVcafshTJ?=
 =?us-ascii?Q?ozxqiXQYQszBhUDQpPTDdBR6TW6bwQK0AaywNWa1yTJdNhEjSi1Xmls767SV?=
 =?us-ascii?Q?08VMLpLV7QWW9+MnchumghtyJsDgDfYASeCPW+JUjYXlsHYe23Lhu/PtR1vF?=
 =?us-ascii?Q?FLgpKSvIUDVEUMZEF20J4CSawqk7FLbbovR5I7u2L1r6qeseXwyi8DcJVpTl?=
 =?us-ascii?Q?AVGiAQbuFE+/5lVV8dCUg/KtSzXl1jFxH+8+7KTB0/AuTpZJUZiqW++orTXB?=
 =?us-ascii?Q?sfQvaOL5Rc3vRldLCppF9M287r0CKj4Ub8zi0IUHwfgF7LxtllxsQTFb0FLK?=
 =?us-ascii?Q?9JzJieVjDEu43UaQk9spb0H3TQpSpMnlMW2RfMFZ6wgNpbXRcvrpI+xvvylT?=
 =?us-ascii?Q?+dOmnMejpYHH7PcMiYfWsBmAgc11IrjrGKVg30G7IsRjI83OHOVJb9+oUf6Z?=
 =?us-ascii?Q?BxKk9drR/k0NtZCNJrnnjGamq2SWbe1oIJzsYRmuE+uwliGw4ewBhIVto6y1?=
 =?us-ascii?Q?xSu6x3ewutNoEissZAzWkRExhlbts1BbueXmHbrXWVKWjwUNCwrfN8ScPtJS?=
 =?us-ascii?Q?AmTO9yuQe5CXws905hldmX1g4Vpmu1GPYa5Y6c/at7VyIGoP/FAqoJFgAO1o?=
 =?us-ascii?Q?3fOgGyL1P9kvkA/5ps8asCFif/2eZcSsrRqyur8rD/8d7uhKCfy/XWQbmAhD?=
 =?us-ascii?Q?pG0Ih4O/V9DhQWAY6yI35efeaAINjhzyR3MXWki1/IGrh+4UvtDpMzuRLzO7?=
 =?us-ascii?Q?9uoSYO/0cNLOgp/EyVOqHUBlWf8X9jbE2qlQuwoEiXPaqjWFDNjCSGOv7GMS?=
 =?us-ascii?Q?ZRXp+332omrzHslbmHvu1BQvTuEgf/hZRGSDR4QidFuWSzTtVM9uAFp8NjjM?=
 =?us-ascii?Q?I7wK/kL4cdEC/DsObacGgRQpzIYEXTSVo5jzobmiFtG4qc+EmZHgXi72a28x?=
 =?us-ascii?Q?TuGApTZeZpl2JsLRFRMRQ2k7jRRQc+Wdi4VjniFTcuU3ee6RiWWk2jlaLJF2?=
 =?us-ascii?Q?0AOj5iOnfMHgL4vUgx+tQbGIIluL0WpoCK0N+s9/jbbmfaXVYb1WSltYe/1x?=
 =?us-ascii?Q?9bqIUl2SOwXzqQYPUXeiBqXeNKNsEz5qXlWnxzeqCUbdj84mbO+poIgjnRdV?=
 =?us-ascii?Q?s5+eWNPgrp2D7qSwT+Z8ohNc0jBtMLhSY6lhTygN9vR6acUjo+a6xBmkRCiW?=
 =?us-ascii?Q?uIL8/I4zUXUruathK6DeSvFacUDfPzNwoERxmO2pe6fmf2WKG1poPQUf6jjo?=
 =?us-ascii?Q?gQuZ7D2HhzxoSK8218+Djy8WzsLoH8akvFt2kAtzUafYGqYWq/A09dvl+Y5i?=
 =?us-ascii?Q?8s+A3GcCt/fLIcXU+F2gvpOsJhuUXIYW11foMVN3/hr8ZSlzVj0MB4FPirY/?=
 =?us-ascii?Q?z7ZOQbSHcmyex50ToYVdVwGPO81BCqVDzGeDN10UYkWzVbL0dMfEaw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k4x4u7ephlpNiuQhBl98Skm/wfpcIS26NWSVfZoAKYighgraA05QV/7sKtW6?=
 =?us-ascii?Q?JtjEX9aRS2I29BGanv8PjSZ6HI97NFYDb7ygkGmb+zQyx//MbaXALxHeDEl9?=
 =?us-ascii?Q?5uBFIHFyt8QowdQT1QvasXHa5MUIddZbj/9d9MlirHUkmw6VT2NMdaWNJbm4?=
 =?us-ascii?Q?3ZHaDV+iDWrCnbjVP3buRgKgCy8SeZLUA4E3CSLx7i4PuHXpVlwq5Naocn7X?=
 =?us-ascii?Q?gDLMKT7MRTg4hNBEJ9pK1E5fd/T2PZjLphSq6flyVXRht8JgDv5SOG4uzbKZ?=
 =?us-ascii?Q?uvvnpXcX1w2i4A7ZnqeN8MvojwMWZARYdciojfACzcGLSvMatN0v4dMRy73L?=
 =?us-ascii?Q?NZRkd5jbwFUIoUmQQmA8lH3vyYrE1JIhdMSqJqTZwZCD3xceISForwYWMAxN?=
 =?us-ascii?Q?Ou+nmHLmicAyJUJXBxBkfJFCT6/7nfqjoQwJW0UyHSQp45LxPLhT6qc+Qb21?=
 =?us-ascii?Q?lW42sAYR/9eQg+w/RPAfNKyaSbDunEuVheYSi7gqzq8w/Ok/LroQGyCp2Y4r?=
 =?us-ascii?Q?L07zj7UbdWTkmGPDuNkFRP528Hze7Mmt2rfeguxqcsJ58yzZuXntqzgeZrO0?=
 =?us-ascii?Q?TE3wOcRtLEheCkp5YfIy7ORoTLaw1M1yPaQ+d3/pwQA3EPGiLlK4SIxpaoot?=
 =?us-ascii?Q?fArUpbV0DFLNpKflX5/86bw5023msgqT+7TNm0eJo2rUjWAkIZFsG8uABVMD?=
 =?us-ascii?Q?5Q+HZ52TXJk4+TiFpecScsA1Mx3SzRS2WcvWMoFo5Lv5rRrcTajsaRy4bPhS?=
 =?us-ascii?Q?f+p9RcU/jTRaNRdwqJ8vuChWrE4q/QOXISN04s2tk1Q0n8Sv2yHMecRAvwxo?=
 =?us-ascii?Q?VlcYP7G8u1QC0eSSyO/5+t41Wx6O2tMrDCSCJaG2T+aiJ7DxdbvtbXhNzPxP?=
 =?us-ascii?Q?SpyDxsr1Zuj2V6ZDwArd427sgesdSVIB91Lpxu1bDOkbimQo675QXhlsi6hY?=
 =?us-ascii?Q?SqTZSi2/6AVuTFbkFPEsasDKfu4oQG4iHo185LbxeKlfLp2nW8knk0wsehl+?=
 =?us-ascii?Q?c6z5EvvQPmleuk40Hu1a8lb/DUY+6FSMi3p1NDMvoeI8gb660Cn+BerCMFTc?=
 =?us-ascii?Q?IFzq+mLnJTvmZni3SRdsEXl7Sxi584GCIdaclOmPG4nAy/SnXs5GFKED+O5l?=
 =?us-ascii?Q?2DXAuxqlYXp+kFxwYg4MV+0BIYsW6bmUFq2cv1/BXmxN30yOV1fCvkaO9HnH?=
 =?us-ascii?Q?ikoUxqOqi+Ajcme3ad2k8mFLUl1PRIK0bjmFdBuiObWYBtNDe8CZdIDV/KqG?=
 =?us-ascii?Q?pnRyBL/mkTuJV5Y5CZmrtpTnuxHmjLWli1E6/bJMOolxUJ0+n1/J1d8yoK76?=
 =?us-ascii?Q?J0T8pbkc4VKqe/AXfaligTamOzY/AHyRc3OleN5kBWymw89CDnGOZelT2XKA?=
 =?us-ascii?Q?E2JHzxkMetXFEwFpAoTdYr1FVGMtMfDG0+du5sh+sItB0EXUyLU+sU5ifHui?=
 =?us-ascii?Q?K0rdb033mMCXA+X2iGLc1YCAO7W7lNLGiZSmMmh7dR3wm67dm9UM+dohhnc5?=
 =?us-ascii?Q?ydksB4iJsHjwWvomPw6mBEECvCUTchOMFVnPPJXESF2AN7J8tbxDPXBGQ71X?=
 =?us-ascii?Q?O5HpLN1PS2f2h8hT3mC9bb3amXKBsR0xQX9ML4Myew2YuqrC1zyhlx7pDnY1?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gt6VwrgNUmp1+QZwfC9Pk7fUclG+jNVIgGDDbILnC9EFHnJnp/7lGyVhAOXFiHNe6zZKjniiOszwStMVwWrntQSv/pF+TNmwZd/iRXl1avwGH2/BfdVp7xRRSXnJvjqF3poM8ICL/HFdv8X0T554RxvISzJUHoy6fESOR8jsCek9sJZAqlbd6IHxdizno0yxEjsWTDLikxCkZj/aM1oMzEpLILNg5g8dZwAzqKcTJaCW58sd7ilJsw7ByEAIbLMvXSRpVHm+y8mzzDhdlYcgI0d5RWDZ9WGFVipPavyhaJpi1sFhWxdxzpmViN8G+whNSAoBtZs86MA4KLfTHLEW0ZHcuiif1eyXOQgMKsulux3H7QWUELxqyRQDT9oGNVt2nVaF6sKGEAgwtoOVixkMv+DUzr+dAOtAPaJjxzeI2KiMtxnIpnycQ1gQu7ItB8ufuvBImTt3+hbB1ko6ZFr4QwSqToWS+5bwc7uIQ5myYDYq5b2LHIUU/x+wXPft7X2etW3l23zM/Rk0RfBy8z7LbfV+gX8Q/LQA98BlCRPv7kIC+k5oVKl/fra+iGvEB2ektgypnX6Rx88mam5/RHO5uMDatbXQsblOJOOLh6HAREE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fc9739-8157-4e5a-6999-08de3e98cb29
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 00:51:49.9521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GX3QW8AMjW0a8xzko2k9Zk0DKBeOwhloOUhmBgbr9N7KnMGgWXcabstudsDxJSbm+JRj8KCL1+UQVK47rkUHJhLklJV0UbUPIm60O6lqtmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6462
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512190004
X-Authority-Analysis: v=2.4 cv=Ib2KmGqa c=1 sm=1 tr=0 ts=6944a1aa b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=kJ-620SPkE77TBOyd_wA:9 a=XaXBPwxfFXEC9MZq:21
X-Proofpoint-GUID: dupBQUdoYn71b0_eSR420epliKgxJ_gM
X-Proofpoint-ORIG-GUID: dupBQUdoYn71b0_eSR420epliKgxJ_gM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDAwNCBTYWx0ZWRfX48xfVCd9Fg1s
 Ae2dY73bE7fhcYlKr5zi1b+ifrehSRuJ4DVF5KGFnqi3dNWbAKMsCtYYToQXR6nC61pZyhZmBFB
 VikLmhzO+FnQuZ/fnlk+Dmin8fKV7qoJp5+B+6ZvVSQp68C11mwJrvGArtN1oFg3ub5B3zK3h6o
 yX+ZWMHkr2kuE2lN8cgq9Wgz0qWYAE0vAWY9Q4TLD6dNFN0qp3WUZx72b5KqA+Pz9wdjpQeQHhk
 eyXnxIaDALAJo+6vbPAU8L0/xPcyoxFWof/85MiV/TtrPxfh3dz0PwiW//jgpVYlSgJaPJk9kHy
 EOvtywE5XSgiS2y9z8FoxvFFEaOte44vEmiB6FPxjWcYLaMj25OV8sqCuxwpSAz/ibvsad3Vls1
 Mz3/LM2Nke7blENUXXNl1vhscEt+MaPC2UV7tune323Aq/wCHSHxH42To+O/6gkcwaCLo1O5U/E
 WDUSwf6yghUPy7o975Q==

Various tests had a #!-invocation while still being expected to be used
as scripts fed to dtrace.  Removed the #!-lines and marked the files
non-executable.

Various tests that were meant to be invoked as standaline scripts had a
runtet.sh expects standalone D scripts to use '#!dtrace' so that the
correct path to the dtrace executable being tested can be inserted.
Corrected the tests, and ensured they are executable.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/demo/script/interp.d                                   | 2 +-
 test/demo/script/tracewrite.d                               | 4 ++--
 test/demo/spec/specopen.d                                   | 6 +++---
 test/stress/fbtsafety/tst.vahole.d                          | 2 +-
 test/unittest/lockstat/tst.lockstat-summary.d               | 0
 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d     | 2 +-
 test/unittest/scripting/err.D_OP_LVAL.rdonly.d              | 2 +-
 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d        | 2 +-
 test/unittest/scripting/err.D_SYNTAX.concat.d               | 2 +-
 test/unittest/scripting/err.D_SYNTAX.desc.d                 | 2 +-
 test/unittest/scripting/err.D_SYNTAX.inval.d                | 2 +-
 test/unittest/scripting/err.D_SYNTAX.pid.d                  | 2 +-
 test/unittest/scripting/tst.arg0.d                          | 2 +-
 test/unittest/scripting/tst.assign.d                        | 2 +-
 test/unittest/scripting/tst.basic.d                         | 2 +-
 test/unittest/scripting/tst.pgid.d                          | 2 +-
 test/unittest/scripting/tst.pid.d                           | 2 +-
 test/unittest/scripting/tst.quiet.d                         | 0
 test/unittest/scripting/tst.sid.d                           | 2 +-
 test/unittest/scripting/tst.trace.d                         | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d    | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r    | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithChill.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithChill.r         | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d       | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r       | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d    | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r    | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithPanic.r         | 2 +-
 .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.d         | 5 ++---
 .../speculation/err.D_ACT_SPEC.SpeculateWithRaise.r         | 2 +-
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d | 5 ++---
 .../unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r | 2 +-
 34 files changed, 42 insertions(+), 49 deletions(-)
 mode change 100644 => 100755 test/demo/script/interp.d
 mode change 100644 => 100755 test/demo/script/tracewrite.d
 mode change 100644 => 100755 test/stress/fbtsafety/tst.vahole.d
 mode change 100755 => 100644 test/unittest/lockstat/tst.lockstat-summary.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_LVAL.rdonly.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.concat.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.desc.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.inval.d
 mode change 100644 => 100755 test/unittest/scripting/err.D_SYNTAX.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.arg0.d
 mode change 100644 => 100755 test/unittest/scripting/tst.assign.d
 mode change 100644 => 100755 test/unittest/scripting/tst.basic.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pgid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.pid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.quiet.d
 mode change 100644 => 100755 test/unittest/scripting/tst.sid.d
 mode change 100644 => 100755 test/unittest/scripting/tst.trace.d

diff --git a/test/demo/script/interp.d b/test/demo/script/interp.d
old mode 100644
new mode 100755
index be690b56..f4718a41
--- a/test/demo/script/interp.d
+++ b/test/demo/script/interp.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/demo/script/tracewrite.d b/test/demo/script/tracewrite.d
old mode 100644
new mode 100755
index 0c139ead..482f272b
--- a/test/demo/script/tracewrite.d
+++ b/test/demo/script/tracewrite.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
@@ -7,7 +7,7 @@
  * http://oss.oracle.com/licenses/upl.
  */
 
-/* @@trigger: readwholedir */
+/* @@runtest-opts: -c test/triggers/readwholedir */
 
 syscall::write:entry
 /pid == $target/
diff --git a/test/demo/spec/specopen.d b/test/demo/spec/specopen.d
index e7dbc3b2..6d3d79af 100644
--- a/test/demo/spec/specopen.d
+++ b/test/demo/spec/specopen.d
@@ -1,12 +1,12 @@
-#!/usr/sbin/dtrace -Fs
-
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
 
+#pragma D option flowindent
+
 syscall::openat:entry
 {
 	/*
diff --git a/test/stress/fbtsafety/tst.vahole.d b/test/stress/fbtsafety/tst.vahole.d
old mode 100644
new mode 100755
index b918e663..d7d6cc88
--- a/test/stress/fbtsafety/tst.vahole.d
+++ b/test/stress/fbtsafety/tst.vahole.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -Cs
+#!dtrace -Cs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/lockstat/tst.lockstat-summary.d b/test/unittest/lockstat/tst.lockstat-summary.d
old mode 100755
new mode 100644
diff --git a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
old mode 100644
new mode 100755
index 45c37efe..b54ba982
--- a/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
+++ b/test/unittest/scripting/err.D_MACRO_UNDEF.invalidargs.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
old mode 100644
new mode 100755
index b51e1160..93ddbd2a
--- a/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
+++ b/test/unittest/scripting/err.D_OP_LVAL.rdonly.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
old mode 100644
new mode 100755
index a4880cca..fe6fe34a
--- a/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
+++ b/test/unittest/scripting/err.D_OP_WRITE.usepidmacro.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/err.D_SYNTAX.concat.d b/test/unittest/scripting/err.D_SYNTAX.concat.d
old mode 100644
new mode 100755
index 8f7b210f..23caa113
--- a/test/unittest/scripting/err.D_SYNTAX.concat.d
+++ b/test/unittest/scripting/err.D_SYNTAX.concat.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/err.D_SYNTAX.desc.d b/test/unittest/scripting/err.D_SYNTAX.desc.d
old mode 100644
new mode 100755
index 34ae864c..baeb2901
--- a/test/unittest/scripting/err.D_SYNTAX.desc.d
+++ b/test/unittest/scripting/err.D_SYNTAX.desc.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/err.D_SYNTAX.inval.d b/test/unittest/scripting/err.D_SYNTAX.inval.d
old mode 100644
new mode 100755
index d3338cfd..bec28942
--- a/test/unittest/scripting/err.D_SYNTAX.inval.d
+++ b/test/unittest/scripting/err.D_SYNTAX.inval.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/err.D_SYNTAX.pid.d b/test/unittest/scripting/err.D_SYNTAX.pid.d
old mode 100644
new mode 100755
index 01044d6e..72d9dfc0
--- a/test/unittest/scripting/err.D_SYNTAX.pid.d
+++ b/test/unittest/scripting/err.D_SYNTAX.pid.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/tst.arg0.d b/test/unittest/scripting/tst.arg0.d
old mode 100644
new mode 100755
index 905fefb6..af7e8ded
--- a/test/unittest/scripting/tst.arg0.d
+++ b/test/unittest/scripting/tst.arg0.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/tst.assign.d b/test/unittest/scripting/tst.assign.d
old mode 100644
new mode 100755
index 9bbd8e49..527f3242
--- a/test/unittest/scripting/tst.assign.d
+++ b/test/unittest/scripting/tst.assign.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/tst.basic.d b/test/unittest/scripting/tst.basic.d
old mode 100644
new mode 100755
index cd7b716a..57b75639
--- a/test/unittest/scripting/tst.basic.d
+++ b/test/unittest/scripting/tst.basic.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/tst.pgid.d b/test/unittest/scripting/tst.pgid.d
old mode 100644
new mode 100755
index 8d82f2bd..99ec11bf
--- a/test/unittest/scripting/tst.pgid.d
+++ b/test/unittest/scripting/tst.pgid.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/tst.pid.d b/test/unittest/scripting/tst.pid.d
old mode 100644
new mode 100755
index 2d0499d7..dc3e3182
--- a/test/unittest/scripting/tst.pid.d
+++ b/test/unittest/scripting/tst.pid.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -qs
+#!dtrace -qs
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/tst.quiet.d b/test/unittest/scripting/tst.quiet.d
old mode 100644
new mode 100755
diff --git a/test/unittest/scripting/tst.sid.d b/test/unittest/scripting/tst.sid.d
old mode 100644
new mode 100755
index e4f1395c..48f45f57
--- a/test/unittest/scripting/tst.sid.d
+++ b/test/unittest/scripting/tst.sid.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/scripting/tst.trace.d b/test/unittest/scripting/tst.trace.d
old mode 100644
new mode 100755
index 148e5c60..bcc4b445
--- a/test/unittest/scripting/tst.trace.d
+++ b/test/unittest/scripting/tst.trace.d
@@ -1,4 +1,4 @@
-#!/usr/sbin/dtrace -s
+#!dtrace -s
 
 /*
  * Oracle Linux DTrace.
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
index 50bbf177..97c0cb6d 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
index 1590807c..206641c0 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithBreakPoint.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
index 47e248d2..38a92e60 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace (1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
index d01ab558..ab7c6ed9 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithChill.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
index 14cc1d5c..da6e17db 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 char a[2];
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
index 89592786..f57aba47 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOut.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
index 43a41440..704b3b27 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 string str;
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
index 3bc21b18..da4038aa 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 34: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithCopyOutStr.d: [D_ACT_SPEC] line 33: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
index 80a3204d..d0ccfead 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
index 3c120a03..7c15314d 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithPanic.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
index a8c1c4d4..7e98885b 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
index 136f5cde..6e85370a 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithRaise.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
index a0bca73d..2518cd04 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d
@@ -1,7 +1,6 @@
-#!/usr/sbin/dtrace -ws
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -10,8 +9,8 @@
  * ASSERTION: Destructive actions may never be speculative.
  *
  * SECTION: Speculative Tracing/Using a Speculation
- * SECTION: dtrace(1M) Utility/ -w option
  */
+#pragma D option destructive
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
index 8cdc6ba1..98725509 100644
--- a/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
+++ b/test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 28: destructive actions may not follow speculate( )
+dtrace: failed to compile script test/unittest/speculation/err.D_ACT_SPEC.SpeculateWithStop.d: [D_ACT_SPEC] line 27: destructive actions may not follow speculate( )
-- 
2.51.0

