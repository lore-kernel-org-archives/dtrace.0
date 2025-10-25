Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E727815D
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 06:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761372323; cv=fail; b=hlIl7Rjm7lERuqlM7xO5qhFr5eoY+yYmFXY++D/I3l+mgW/s/HcyxO+LwIl7QipDCA599J4iGC7DjaD9MJaAo611m6bdz6jq7rpFAVhywgvgHNa9xDp57ix04wuw8+IukSFAstXa22oPJ5k0ccmO775XAexSpkioIfD0seZkmmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761372323; c=relaxed/simple;
	bh=OLPvlXCIHUXw4tQPJa2KMT90SZfPjJrBFveFPhNQKrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kOEU3u9RXBJmAkpmKi/bXv3/PusKjTQtMwb/2U1tB3q0dJ8YiGz3KogjLFnecLmyb914xfFAH7xQGg+csyvkqYZJiKSjYmD8j83sgw5E9sn/PBE8pK+XyZpDi/5lYiXg9BM2eMkGoDir4m2KThtKKolrI+2VQuD2burYaaOyOr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bOWta3Qf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kFu7B7jc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bOWta3Qf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kFu7B7jc"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59P3vatN002045
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 06:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=3gGy4+ywhf9eBQHs7f
	UTOxIzfuNyqnNBEgoBI7X66dc=; b=bOWta3Qf0MxtHEcO+DqoBRssTm0itkkyqM
	d1lCwQHBjLIXtqIfQ3PuCuu6VSjrKUwYy+COp4fT2NG9Glb4qg/OxKgyjA2goZze
	BmuqR5PN+XHkavOEfIuIq208MDWd58yOrcT7ISCK9KeXSWZxqu+aFf0iXGR523Jo
	1Cy18+vsWDEItA6N1Q6bwMiJecv/n+RWSKpJurDlUdPcfKVr4vZK1yypaKDNRBUg
	xCA7gKvbiaNHgOlVEOvlL/E712cv1sKPezZThfjVTuspSmYJ03pluIdBrdkj78IK
	z3inQPJIm10pV2bb9fIOTGieKECNVkTUie05nZJaF3ggzjLKqutg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a0q3s0354-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 06:05:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59P1Y5xC027288
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 06:05:19 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n0545rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 25 Oct 2025 06:05:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrvHSANkgm5cya7+Skb8bwhXIJ+2kLawdkvIVBhsWX3bQDDR1X9QDnjL7CFZZ+3zFijySemA5oqj9zIbLHz9xQL4xzvhCdoRuIbGXuLNt16mtt/o18R4knQ+vMgsmy/HO06JqCxL3FF0Ot/FxI+ClfCvruYtv5quUYZIpBtuaeAYlMEewVLV70Fudxrrv4nRgmlxwdrCVR4wWPfhLyEZiM5rCfEOafAP/ouPvwIhIOF468HQVUyPVZR9poHQysp4DrSFWGudDHEpsC8Z01d4UgoUAqibfbWgg1KtO+tUotsN54BobIM2STDGTfGIAkJrdz7KPildsMuMnTZwRKQhug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gGy4+ywhf9eBQHs7fUTOxIzfuNyqnNBEgoBI7X66dc=;
 b=hfSf4lWmhVcMErXP8Wtg+uVL5TOVv1BPLgP4wYn4bT4QcOjEQIzG/dGbp5gvUEIA1MUNVXyoZwm5TpPIRLWFWq2+VgYdA+proEdwduqFqnQiBkR1JRlDmvEUJG4hxrv5RDbmROMkvces3frCojfIQAUHnA4AAX1NNnNK3h17mkuFGf5L6IoR5DnikA3E2OKoTqdyHi/mpZF9j/xBxJlAjBthqrRTOgRzQS5+QSqE3K92IOz07ediEeJTXGhn1E/J2968KRCcyq0stuioM3dtZ10w5eW+z+hlQJ5gRHKrMhGSBlgh9qqI2zeerXLvZX5++nrvlpCXgIoDmebB0d8R9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gGy4+ywhf9eBQHs7fUTOxIzfuNyqnNBEgoBI7X66dc=;
 b=kFu7B7jcKZNpim2Egloc2kfCJX8gf/d+bKj6gxOujLEgW+im8IFaFFvFoqK9z4A3SSBLJwZGG3wDrHQRWfruGnKu/pGRqIMOtqd++3Q1hvBkniCZf2GgtwtCY0tpXOp9hvxeJoPFVld2Ayecuu8MrrZoYGDMhxcARlIEbqqRiYY=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by LV3PR10MB8130.namprd10.prod.outlook.com (2603:10b6:408:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Sat, 25 Oct
 2025 06:05:16 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 06:05:16 +0000
Date: Sat, 25 Oct 2025 02:05:13 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Bump up the version to 2.0.4
Message-ID: <aPxPZG4QJkAwS7fu@oracle.com>
References: <20251025034446.5894-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025034446.5894-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|LV3PR10MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 035ccda6-6095-41aa-58d0-08de138c77b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Raqie1Trdf6NUuDny2zKgt4JGUCNNKiVdFwVQ2HEbUSbu27F2j9dXzmW0ZM6?=
 =?us-ascii?Q?sm2vybw+gSyhTHeZrfV1+k/OJ39OYuxu2pkk3VTHjVRMzaD2vfET4pbLx1cd?=
 =?us-ascii?Q?TOp4rzN+tqe5hGP6Z7hESzT+QhZoY0Urhfn+PiJrkf3seR3Cjfub01mILMgk?=
 =?us-ascii?Q?Dl8MVRR+aRXJYSqSp8xhHuunCta1Nc4BBz6fnkYFFwCTv4a/Qp3iIuKFa3dk?=
 =?us-ascii?Q?tj4INCuSbumEvu21O9Pat4T1vUMpD5ugM2UT3gw7gc1K5/1UNM6b/FG0ClWY?=
 =?us-ascii?Q?21uz1PAU67EoAjgr/ocDJyCH/EjEP3Injnmu8QnZlF6V56brFxym1HXIIwRF?=
 =?us-ascii?Q?MfhfxCWUeiknkik7gfCsh5FD8E/FkMRoPvA0cjLFAaUSNh9pcKcWCMCqlGHc?=
 =?us-ascii?Q?jTogCluQB004h2UxOLR4mEWUtGcsVdkArbfVuIuYRHcalK10lC4wfn79dwP6?=
 =?us-ascii?Q?pe5KgxxHroxsHgSZWN610Zagnlecpm+ur/SO5dMde2r9RUccPFnID7bsoJdt?=
 =?us-ascii?Q?6PFZM9H0byJ/NZl/66h5px6OHhlmudynAds64yyQaASx0wibJWiTXRyvZ19d?=
 =?us-ascii?Q?DnZG0I/dVAYBa9NhxzfArii9saIypCuuPSvb9/pqQVxAywhznFJUf/fpKnOL?=
 =?us-ascii?Q?CNSgvlwcx+HlWAfL31Ae821WxsHcFF+9Hr2ZdEa+yZqd1JNlU0CiYvH9LJZF?=
 =?us-ascii?Q?KVnbdKS2qDrDwprfi9jlXzsznSeLNxU3PqJKxMiyWSFDiVPfUnzarPj+4tbW?=
 =?us-ascii?Q?VH2l37L77iuFCZnGwpJtahx6MZpZTlbszXrVfpE5E/0T4gKn7TY2b7X/Z0R+?=
 =?us-ascii?Q?ba/iq1PWNM76lrtCufwM1CnNc/cSeWiUtt9TvJ7pD1Tvgqy8xPmVmJya+Xkp?=
 =?us-ascii?Q?ti9DE2exjzTABNBthEu3EpsCsk4ejzNiU4zWrNCvTzJtNocyzkKobLeWJULA?=
 =?us-ascii?Q?cToId6mT2Cr18HveT0VaqW94vvXQt1fUswtbR64ogjryKrwl+n7yP9EscXcq?=
 =?us-ascii?Q?2Wxzy/EGfUqPR35BishMDYOiWdeX+Buw/E5/BKBxMJYI1y3YjPerfhgRnrFJ?=
 =?us-ascii?Q?s/OXhelsQcCaPc6ZL9Tsm991isSiPyM30bQM/UDDytX59PtONVYFZYE/S27j?=
 =?us-ascii?Q?Yk+3AGZUT+eUp6I9ARRSCd0DLfe8C57OuwpsCoiPGZCM2Z1/vylTBiNl8Edw?=
 =?us-ascii?Q?m5x12QIGiVM/gNc0cKLoSh5IgQKObvkoPx+eif53P+gSfBOcbgU69kKRU3l9?=
 =?us-ascii?Q?AUl4cQ+aqsfgIvXa6gGRaZvUBh8RCQ9MOYQurcA9k3y1Sc/1j06Dfg6T+plE?=
 =?us-ascii?Q?uJKe8AuLzd1kdYnczjK97NQSMHslINvIsWDfMzws10idbtZp6VDFZHMmef3M?=
 =?us-ascii?Q?blh3KoHp0enRNhyEFXUX3PLy6Bq98lwMtmPZwSFhwrNPODX8j7/9iW7um3an?=
 =?us-ascii?Q?NkMAe/TzZcKiS3alAvPDQs6MkX15RHMo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qOWmim7XjJ6od3olbpK5kywvNzb5pE4sfddpi6SopCS0ey7y6B6wgsIBTflU?=
 =?us-ascii?Q?yNN8P9m2864lTEv/aNTOeiOLf9hzjnhAIXimn9uQ+ajjEi2O3J2dpq0UNplZ?=
 =?us-ascii?Q?uQoNfRHp5eraU309rPikScVwW8NFIeuH1+2wYMVYiLNdZw2hjMed/mpr8cp2?=
 =?us-ascii?Q?9Aodt5VVVp8FvxmTOVQom5GffUYvaV6yG6XSWvOp7QPsG9F4NnrmEz7IQBM3?=
 =?us-ascii?Q?doYSag1ET+nUNA3cVk08jVz/38fmm51mcmI874dGqmyX7vTsPOhyB1Kyxd31?=
 =?us-ascii?Q?iX++lJirKz71GSmLtJU9UQt6w1aJ8wAF76M6aBPjGITAUr4VElHzdnihm/tb?=
 =?us-ascii?Q?Rv352Lt+5KvXUL7bG1EQwDtK3+0yMw5+uGgZ6jNvg1rDKExQ1NRoYNmwcNOB?=
 =?us-ascii?Q?c1u1H/MEI3A9AMf1PJX2S53vL2q6PSoXtWGl11ZrlexEY9Ki5fYgM4NGvxZk?=
 =?us-ascii?Q?tC9pthtH6i0C+wRzI1mDwd9aeq59Hxt+8u7Z9l+c2U4OL2nNXEliZh2UXJ4H?=
 =?us-ascii?Q?Ppd7BpQqq2bIQk+QrgiivkmPdjZtJsL3pInZb9O7iLSY7io/dIDjj0aSbXXa?=
 =?us-ascii?Q?RBLyUnyLmL3ESgGG06309P7cXsYBBJL7Qpq7QsgR+x4DyX2KqY4NfupuLzWn?=
 =?us-ascii?Q?2SliVv38VuUkjx11P24AXNfZEeXv/zyq0t5Irp9zJOs/yF5hLCj6H2W83cyi?=
 =?us-ascii?Q?/YiZaRPK69XJfVWrOFie5P+HrAfGNRPikGu0aj+HvwJgVeUr+T+So78uJfMv?=
 =?us-ascii?Q?0DiuKVVmFOhum9lUg0Xyz/DQJlZ7CVAxXqGgEZN1w/CPBJusU4DuCKq37FF9?=
 =?us-ascii?Q?6Biue4cHbygrV5/rq/6BXAW4Mp4cquqifipsyllx1nDx3Bfb89LTGgHYq9NM?=
 =?us-ascii?Q?RIr9yoDrxidB0gVz5siwbBchC2njqRxtlGXpoGbhfQrrV94mjUHhbcWLPvs6?=
 =?us-ascii?Q?X6BN7Daz0x47KUItrd3ZbQWq1NFxts5p6kxWGh3Hw7pkzgvqUlYipQZYM4nl?=
 =?us-ascii?Q?av8+Bh2CbMmdJ3Sc5DQwGv5CZw5i0z+LJUSeKWafpuLX/4rR4/k2V8+2QvD1?=
 =?us-ascii?Q?79TLSa9USa44fEaw25ifjs98xEjYZhTMwcivxqQYnqS4UcCtQ4iK+ZoMFbZW?=
 =?us-ascii?Q?VtZ3SWJIQg0Rn9GYV/IjbB+KE1auyKbh8pKwkKxu2BohYJ+DYYBujWD4x5Qp?=
 =?us-ascii?Q?5SWctyZm+cAHJGCSzvonPWUDeCppPsGB9e1BaLx2IjboI2J8TJcTLvgCvJzK?=
 =?us-ascii?Q?i8FBfVS2lSm9z51LY6CRS2BcBYP18zYG+OwlFWs1L6lMsZV5ItyKsDKm2QH+?=
 =?us-ascii?Q?C+M0Rh1JzjP7yjyabOVgWI7lIWmJ3D/rcPiLrJXp3jHrfJ64N0WV3kdO+X+R?=
 =?us-ascii?Q?hQH1c4WHoCznp895A/ixekg4kO0q0Aqt6nzhvP1Jk0u8r0FnweoxB9WUDGru?=
 =?us-ascii?Q?CfEea9jnef+EUips6a5dZacMpzdiCw0KWUxKjEOF8QV1CgiyZSzPy61yFqqJ?=
 =?us-ascii?Q?yA8/9Ro28AV9m09HI2LCOCQ5fuFHAjTnznZ+xk6r+2xj1Q323EuDEk0MKUPU?=
 =?us-ascii?Q?s/COE+3fucnLQ++Wxrq03bgU+2uJ5+P/3Cb96a9Rpv6cmEyiCTvzC0NNGf5K?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ix8Syw01EBXIZNjv9nJhRaUqKDZlbUPh17AZclvE5p3MgvmJ4D4YZk+Kff4SFoReTP/6Tl6OEFCRTrEIPwfKlnK7uLZRGfTDlNCIvjdwZUCkGmAh4Pl5UQmk8BhdJSXxkTQRKctIbAcayJjotTP7LlrqlsUJiYVgmCxRXenrW9wAAvPcTnF8POvLIj7TOrLy6buOIQs4UTQPMbU52QVj43UZmQLi4C1bjy+zMHzqGQUIKF8wimcHNfkx3y1eQHP9zbRe1JL+oOvzmABbSeE3l8xUWRlh61IPNJQPMdPXP2kn5MZ9mqWhNTb7T3wPClGFGCeq/+9xjsTrkulm9s1cpT4FP4SiEOSR53F3ZvhEjSiyD0mx4fb+0q/9A7ttfJkc/T4J/X/hjJg3vQ0buoDlSFBHwsrc+OFLZfmfwW04sIR27P8mcsHnFwKtUNf48WaU7EiTF0S34K32BjhxhJFxkSEJWbrWiwTdOg3g3Prg9gSB6xOMENstsUbwqSYS5V6bDAizP605m5IgOzl1MPB3ThioYsgg4wRPF3QHHihGxAYrfegwmaQ3tku8YBOBj6xpKpp/Ew1cmA07ddgyLUoDbWK+pXeWkGXoEcQtwKNw7ns=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035ccda6-6095-41aa-58d0-08de138c77b4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 06:05:15.9547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /EkaKK4lf2Z8h35vaTiZWPlP/8ibjXCIuLbTnV6t6DM+pU/yrtzpcCvDjAtmp2jQBPfJafvubA8doY2d4GXceR4IiOxrNCVwk7t7db2EqEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-25_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510250052
X-Proofpoint-ORIG-GUID: M9k-pdqCVMS0u_mDGGnoX9_KKzvYXJ0V
X-Proofpoint-GUID: M9k-pdqCVMS0u_mDGGnoX9_KKzvYXJ0V
X-Authority-Analysis: v=2.4 cv=Q57fIo2a c=1 sm=1 tr=0 ts=68fc68a0 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=2zgB_bcaOIDh9SdLY8EA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:12092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAzMSBTYWx0ZWRfX1eWnNq/RY/Sp
 wWDUVdZIURqS7FZxf7+fn0PVYq5hLXW9JF9CDbMlexx1hQgmp9W1Z5fPmYTy0JU9EUD9mTbwp0O
 0Cwbr4Hcv8igXyJ2jry9hGnK4H7mTNw3mVwq5FqjyYKUK7bvMSnpppwxba6Jq3g2iUtpnicsvVZ
 J0JC3SSIDQ4Z35NjIdD1o8DbCZ7PRmKNziGSA5R5NB3yYR/BzoBAoS98H50VufSa7m5llZFLpMb
 tOYwDLmhA3CnRdMBU/0KwsK43dFZEygN5dIgcIOgPzVpHyVZlZ5iKIvefCRFujRS1hl/dS6/abW
 0cPS8ejdsfqNWRj/ep8SdFBDZ6y/0A9R1eMU2ampqOr4gsYyK3MA/S0bQ6jrx9D4/qxyGeGzYtv
 X/Lg9BtDcI9wrscuJpTT4WlRGqKfpLZvNxjcaN3XWIS4HqadMwo=

On Fri, Oct 24, 2025 at 11:44:46PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Note that test/unittest/preprocessor/tst.predefined.sh checks that the
> __SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
> message, and both of them simply use the last entry of versions.list and
> therefore will be consistent for in-tree builds.
> 
> When RPM packages are built from the .spec file, however, _DT_VERSION,
> used for the "dtrace -vV" "This is" message, comes from the .spec file.

This is actually not correct.  THe value of _DT_VERSION is always provided
by the GNUmakefile, which takes it from its own VERSION macro, which in fact
is set to the highest (most current) version of DTrace based on versions.list.

So, the version that DTrace reports is always provided by the highest version
listed in versions.list.

The version that is specified in the spec file is only used as version of the
RPMs that are built from it.

> Append a 2.0.4 entry to versions.list.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/versions.list | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/libdtrace/versions.list b/libdtrace/versions.list
> index 8986d2007..8d858f0bd 100644
> --- a/libdtrace/versions.list
> +++ b/libdtrace/versions.list
> @@ -65,3 +65,4 @@
>  2.0.1	D API 2.0.1 Linux (BPF)
>  2.0.2	D API 2.0.2 Linux (BPF)
>  2.0.3	D API 2.0.3 Linux (BPF)
> +2.0.4	D API 2.0.4 Linux (BPF)
> -- 
> 2.47.3
> 
