Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532531E261F
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779147; cv=fail; b=rubcDKhZkEErl+FlU5q9IXB1EGOztR+SkWkerCh5mPEJ+v6k3jSj98bA4D/XKVRFCja10JmF2ZlmghveBz9ZcRXMjVpT4IuDoShG28NzmgDHS8CIbsJpbEhidfFS5C7XfS0sE/gyVUXTPVtI6mwnNSYkRvqHzgW7hPemDPn0JpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779147; c=relaxed/simple;
	bh=azjjxFXZBcXjzquA1dPcYUyn/iXEZiAYBA7+8K9tjwI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=KCBC+0yOYO5F0utmxaQe63oGBmJkL6hBhNjChgNiRrWD+yHQn3Ozs8soXlOvd2/FN08EHmCjLUHtVepPu+qopinNmuu3LNDjgFEFsAM7PPdPUu/IczkSr9WtEKzh9SfAIeh4ltSeWaHcZxmU0L0I6ym5C3b1pGmwo6a6SpjmeWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EQCyCYPv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=z9Vw79Vm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EQCyCYPv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="z9Vw79Vm"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OC1rjt005347
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=xr9mwwzcb6o+jYmd6o
	RkR2FFucEIk4VtZoCQUELV+MU=; b=EQCyCYPvcoTkKzqttTrNdCYU8pf0fViiJp
	4m4XJIRZlhXaCAGSDkSf7LUgZLiezby7ow3a959Pqzz//NWUZg6/msLNve3ntXx9
	Ft40vNMJ8WevrWfHEjxeGmdlR4TiTiBjD3j9/4Enoq8CUIyPrjgQ1PiS0kYXTBp6
	elRPUUyWQ8evA0JFikZbj7xVinwV5E9m914G6bwUSeIV0l1MtEjcjSap5zuZ2dNu
	d/+ZZzF6nAtsmLaWXnoiZy8tNcPEGN0M5CIx/mbZ2R/t0vxnJlQdLzJglq40tA2Y
	CSHNQzTGSe/smoJ9k/QkVNo3MU1g1K64ZAOvqYwmMlf02XAZ+5Uw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5asjqvg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:12:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OD2Mgg036111
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:12:23 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emh411w3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 14:12:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fG2URmRrYz5BEZt65xS/A8Jz5bcFEP9AU6XEnExRcQu/sQQdx+dvi9N+LyxKwLcnMhJpSOstLyjT9S7gKbxmIPhBZm80oqnvjNaUM3Z6FQb0GSRjbalCJYZlX+5bkZuWvRIMv7YGCFumTqape9RHn/j59R7YeTvkCf5C0sRlbwt/pywngFlcLddxgL62Qt3rAuGaNf2cVVtekH7k7ofY/hKN9Zd8QrNVAcNaP56RuaY2+Ufo7Bw5+Note8rgsbdb3vatJavX9q4tzQ1PzU/wq1t8NMefa5KghDs+AgKv+gOpjbXu3w3VTVgWAIOjZHiIpnK++S64VEOWufBhVgfq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr9mwwzcb6o+jYmd6oRkR2FFucEIk4VtZoCQUELV+MU=;
 b=gIgP41YPKBA82TbKuLHEXwneU7LZUVSZ433uEMQHEdYSMlxCv1m4/FGsDGZN4vbAlvh3kSxdZyBLCUZr/d97v5N4YC/laLZ7Z/7ilDimKFN/4AZj+fIHiHf42QcOqynMONKiFlzatiUhUF8ee6kUnVBYcmbtBhTbIS+sZ9FjFnXNODHGOv33JFkDS0qcfr0kOHtnkW4Vwkk5Ds02kZ8qQkNCw/4I3a+1pxvJntVRFASLLh6AXmEKf2w6EbEFvzu1Wtjl3E34j+gezBT6nUsxNssUPdFNsyLdJpvm4PiPktPo0kesviK1asYU31bqcfmoRh/2FF218GwnCAvD5QyO7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr9mwwzcb6o+jYmd6oRkR2FFucEIk4VtZoCQUELV+MU=;
 b=z9Vw79VmPMdrY6JXktp1wiWfbBJ5fm+B/VjIcmM/OTtHHI4lYWQelrd744vz6tORCft1Fo/2oiIHnEWcTniTK+bWXWBjeBjXozatjp9sVc1auimTMFDzhvo1gGqwCxfi4vQrTnX8a2Q6CSwZTdscCpKoDlz18bXgKMhPiFSKd0c=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 14:12:19 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 14:12:18 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/6] dtprobed: stop skipping zero-tracepoint probes in
 dof_stash.c
References: <20241018195808.270688-1-nick.alcock@oracle.com>
	<20241018195808.270688-4-nick.alcock@oracle.com>
	<ZxfdBruw9o1XK9Ll@oracle.com>
Emacs: ballast for RAM.
Date: Thu, 24 Oct 2024 15:12:11 +0100
In-Reply-To: <ZxfdBruw9o1XK9Ll@oracle.com> (Kris Van Hees's message of "Tue,
	22 Oct 2024 13:12:38 -0400")
Message-ID: <87a5ettwsk.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0087.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::18) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SJ0PR10MB5647:EE_
X-MS-Office365-Filtering-Correlation-Id: 018fdd00-f4d1-4d8d-5603-08dcf435de74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2iC+TwJsz8oMqeTKC2u/1QVF7xur8vNuU31QvVF963fhm/rr8FP1sTQF2+hX?=
 =?us-ascii?Q?rAvOBHuYplmZBzitfSfHqgqVm71ddAiMh3uKQb4PT+RNk6icsWoLYiQHmEaS?=
 =?us-ascii?Q?2chHE+7hOqpHwWfHA53ztq45nxLxPWlMl3CJxPBKfyCJ5h24TzQCLcStHoIB?=
 =?us-ascii?Q?D4g0aOqAXVZeZDXb5uH6H6fjbRYweDQBn/vUoThbByNR7RsVEy2zFKe/zD8u?=
 =?us-ascii?Q?kCaDAiqRZ+4uA4hoW5yA3YtHElSFp0NTw2BvGRrBeX2QzDY7ipndZepjLncA?=
 =?us-ascii?Q?ngx3sWQppFYwmHcOB6KkEcx4NUeTjrEAOcp5MbGgKciwW4xVKrQCAAEnrXag?=
 =?us-ascii?Q?eRo7uvuZkwMUPbuVlO9tTVGqE+2onoGsOnr32Xs59/4pKx2/oJSmaMtUp6v9?=
 =?us-ascii?Q?29RxjmbqY2o6FqrTfw9Dqcgg9u33Il6DekvuaK+toQ/7CWCi4ckdgGW3j0al?=
 =?us-ascii?Q?kDsDwZSqN/62KMMOVsl98i5PtmKddvDFdA+HTwF/V8s5Xw3l01EXbVrzVF42?=
 =?us-ascii?Q?IwCimkcrDNW6y4smj4gqOZ59yPSvAFtSIm1sEZ/y7Jf3AE4ENFZ+5Z9xCkFs?=
 =?us-ascii?Q?lNuRQFzeAPBJWC+98UGyvr6mMXIbKuXNVFJ80k2uhEBRbXHE6WF5TXZJafI2?=
 =?us-ascii?Q?Ay4PwUp/gC5KNgIGH5A/LLAnl1Dvmi/AUfMV0GkPCLkCCy9HPrfI+kd+6Enp?=
 =?us-ascii?Q?RKpLA9w8aNZ/EaoanTHHLuUHvQ7l28cehNv7KvrF5/0fuGVMfPPz2v1As8KR?=
 =?us-ascii?Q?/JejyGXKHFPmB+2kCEPEdJpB2jLTVbUXNye4e0e67GVMG4vtoBWasMvrq234?=
 =?us-ascii?Q?zqxU28MV9KtyQMttwzxOJbOTesAkZlwb2KNryEMILAY83tSJ6VdDRIZ7A5LL?=
 =?us-ascii?Q?zbhNSa/COLIA7AJCZYQEvfmmuLFTBgE/yWdVcOc+91+tOG03ortB8EOg0CGR?=
 =?us-ascii?Q?H9jimnoQNNkQmBnoI4YYvJqjRgjzyQYlzsI4qlgAsv39E6iN2ZUB34mCtAdA?=
 =?us-ascii?Q?hyEbtQ53BKfMN13JAf0ie4ptL3zUQOqp4vdtAYxzie4ufai9na1UM5/XOoSG?=
 =?us-ascii?Q?2PL/GSKqpOysKZ2Tzc2U8Oz+iyjAcvOfaLreJ88tQxKvmVCOpwTexAy2nwkn?=
 =?us-ascii?Q?T/AP7LRAFYfaPhGbMvB6mWF5R3dDngVsEgdCV6CirH3W4Uf+AgvBmAyv+ocg?=
 =?us-ascii?Q?NRobl6AFW5b+t3RV1N8VP+stGPtZfKNknGmZgiGGvEXja31A9sMjK3ghFGMF?=
 =?us-ascii?Q?mZ2Ci80/Bhw8ut4VkQgZpLcEsuFNi0uYaZnZ9xFZ+/2euPpdtqhNcFaCsHfB?=
 =?us-ascii?Q?3cGUwL0WjgtaOd2/SRjCquBf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kVAXvG8hgkeEW4OYC/R05Gxhpf3YfyE9Ug+UkEPbaVuVosanTP2c+f2CPYu9?=
 =?us-ascii?Q?osdYLs8FWh+z/9aPVykwOYf/+sCWtV60Bd0w35KjkrX6TymGpOQlkRWH0QwS?=
 =?us-ascii?Q?QC/7uj+bmgXp5mvF8VY8y7xR8FUbeHFpLM6PnBcda/gxDZrdyOsH0Q36TDmC?=
 =?us-ascii?Q?UGyZ+x/bhZBH5i57J/DbqQDkQL6yiRu/9ZMZZkcscGPDE6XCjaYGnbnVY4aA?=
 =?us-ascii?Q?5e3AH1FNa60XgTNxXJ3OKiwDQhk/8cSuOeHO+7aMt+YuamnsN5j2IGMK+raG?=
 =?us-ascii?Q?bew+5FLm9VXjmwp+NhLFdIbz5g2qmFOHeN3Q/+Wh20KzFhx96UHGfQA/KMdy?=
 =?us-ascii?Q?B032l902hf4WBM4cXVqw81SiCEsRhmweNndsPmDBfABtKVQdR7YEkcQdPk6t?=
 =?us-ascii?Q?iQdSiXYP26GqPm7ltVgMuyvYNhfnWY8/uPXGRTujUrBi5BGyDeEfHr4toimi?=
 =?us-ascii?Q?p3sx6xD2r9rphUUHZwGsbIZj3JtthO4brFCR8cQqx7BZ89AnfJg58/BNOFMH?=
 =?us-ascii?Q?RPwkeVDzDfUuJM8EXuJ3+WIywtU1H2/wB5vjBZ0RNM+BVaYf0chah5ttXpeJ?=
 =?us-ascii?Q?qZR4nldADJq7qqCtKcqRw+jRxKVWzxTDbD4pEluhHsTIRm/39eI3qUmtPkTt?=
 =?us-ascii?Q?sO8+D1oE7YCg8aKlt/KnXoNGcgk8TrQcexWtmMfhciI6LT1qQsleGaSG6nlh?=
 =?us-ascii?Q?IP1qnxR7LZnBdUNCIUFXu73YfqQPdG+sd/3ThnuJ0zoODLog3z5nrr4Q5iFb?=
 =?us-ascii?Q?r0+As8AeFDWT7LSdzLaUSqy7Q5lS0sCMDvQt7MmX9wBlXe7XEKLQySxYkeNm?=
 =?us-ascii?Q?Saogh/vEeyKyzD2qHvi5VPR65K3fFiwiF5BklkTfVREz+BWX/XREUEBciM5Q?=
 =?us-ascii?Q?bk4Yvp0vdeHp/uh2vmPwu64nEUGK7cp+2HaA+lvBrHnowFKSMN+s8sWvkPhH?=
 =?us-ascii?Q?HTvaHlUQt1Qg8jvDivabEl5T8NQzEKDZ+4GnBR4VbkSYAC2d5zFPNvhVLVQV?=
 =?us-ascii?Q?sYtjIa7aUjHNkVMdQCeo2mKaZ0yoiHaD+YD/dhapc8io/Te0xiAL7AAmf+6V?=
 =?us-ascii?Q?AeLtVXySF3cGbVALWJmwKFa9xXl6XNOl1f5RM3CfTkso8Z7AMT74VVUkJ3oh?=
 =?us-ascii?Q?5zFtyAre+tC11n92hQRxYpJHLstq9R/k2TSECluEUHEanaNiy6g0coJR0+GK?=
 =?us-ascii?Q?Y7yvfsM2W2J+KzoM78Tam4frNwlXAVc5troyos6009dXBA8hyOo5W175kLa4?=
 =?us-ascii?Q?1ud/cwPEpoKGeKXIZC7yLEwhnZIrldLbzKx7kv4w9rIBDEdsakSR4HkvmDOX?=
 =?us-ascii?Q?nComhA/1FuBRXdB6sASuXqqRE8b9izCHEBmOh9oSMkeHdnLkrLOXH7F+GKv0?=
 =?us-ascii?Q?I913mo4CSIzV5GMvbQQXMXvwFTK1j1LKYuNhpBgVXwUur895W6hkeBPRPnQg?=
 =?us-ascii?Q?KmzWkvOFk9JJy2R4Dcr/mSq3ywCetynuzZwZNKtNha18v7zYsNiT9qNcX2em?=
 =?us-ascii?Q?ZMyuB+dyahwX5d37knsWJ9eBbdfoxhvsVka6pchyxXM1aSxDzIjnIYnJIc/z?=
 =?us-ascii?Q?1FBHdOkGEZWIo2rm3PMsOT1H5sJtraMcb78fQ2p0iqy/ybKcG5HkOpzdTUMu?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W3euiCAbTeLxFdS1lRacEM2N3znaV8f+IAJGsA68cpmfKKR963tiFhQzNi7qGkssqKWp5qsEvjDExxImeXAy98+K7fful5Xh8ldeIQwmF1ryoJi7VjguyXEaC8gov+CfAlNBvHrV+f4T4vZqMmgSAe4bX49AF4Jd1aJmeD9IrFOKHCkAppKew5ztpjDxtYAhGAWqAC4Qu7akaPU0zdMDVtNIW4rOYatIj+tYQCB6OBOgdAP/ov+9q2vZUsvm+MC2+dhOUDL2q6GzdZA/edxC2CmH6AT6jT41ZfP6a7ldT6W+VvKiykJibif7ctuTaKBBmqYEPIxBtmNLGEpmYs2P/M9Dt+CkFc/K/4kbYBwsAjTlh3PiG4VKr6JW3PbZdMsKngwYxp04xcORHqwE4vTKrmDajVud9QNWIS+hLtJnrX0RCsy8l3wxhhYKEk15uAFydN0hsTC/a5npGk9i+Sb/1EUWv+b8rB8psTE5sZrWLbhcLU/k/cPdTE0WQqE9qpQbEO95XNssO3PiOfB8ZZpbkpSzxZbVv0jkhu0NkeIGKMoQblUsrgFL8J8y0S5Z1YJPdFcIOZPikXum49PI0mAU/5z3sj1pMdbA0vKWkmhUHU4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018fdd00-f4d1-4d8d-5603-08dcf435de74
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:12:18.8906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPhPTN1JXK0t1Nq671+hnQSIVPw4vSmXJFgB0GpZ80sPRx3HusSQ2CAciICbDIwv630bnFECzS6337ilsHoHbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5647
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=897 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410240116
X-Proofpoint-GUID: YNHnohjfdqGNsUfvUEsPh5CpwIJrlULv
X-Proofpoint-ORIG-GUID: YNHnohjfdqGNsUfvUEsPh5CpwIJrlULv

On 22 Oct 2024, Kris Van Hees verbalised:

> On Fri, Oct 18, 2024 at 08:58:05PM +0100, Nick Alcock wrote:
>> We already validate that they don't exist in dof_parser.c, so no such probes
>> can ever get here.  Handling this impossible, untestable case has just got
>> harder, because we'd have to skip DIT_{NATIVE,XLAT,REMAP}_ARGS records too.
>> Just stop considering it.
>> 
>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

Ack (adjusted comment to match the previous review comments).

-- 
NULL && (void)
