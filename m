Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D693939BF
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135810; cv=fail; b=A6TE/pKziLWhjYD8H0NlgUqLIEauijB8oKd1sSnHtJ/+445DqZS8FAl6K20d835XyJNmJ8DMpwFMBsCm2Hfo5xFNakYjGXgG5IiW2KL1R54zMK4rJKXeWwcKeqy5TIdYAEQpV+hqQvrflKbfXusNhiXZvPvnx6+Lyg5xyJrg25c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135810; c=relaxed/simple;
	bh=e/MfNPLph/1lp2lYoUK5Ylmr47ohbeCZdgQzPFAmm9Q=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=HsZX5H6evJETAqfFHE3ZSWbPc8OnTZlal6tLV/SQJnQ0QqcEVOM7vQivEXUv1Brch1Y8O2Aav7duzQ2kYml0q69DbaafXIkUaIbkODnZlVV1jmGv8ZPUVKZMp+YlSuqxETiJCputgtcI/cBRXhSevd5Kyc9qqj98fxSQeGlkYAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O+nbCZa6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=K0mlKl/l; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O+nbCZa6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K0mlKl/l"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Dp0dL3635941
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 16:23:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=s1MKr65xzzA8UzHzWZOS9jIQ9JszA2qZRbV7iwRS4QE=; b=
	O+nbCZa6uSjKKdYrE+1TbtOLP05DaBoOHzhHl+Nu7M8R8VdKvKZNlPTWtaRyuBMW
	wr0YZ3zNea5XokU+hs63/W6GCVfw5CRy8V9SEAyBugDYeo3IhaWU0/xM78qV4VbQ
	nf+bmqVGbIjQDCIlXSqYoLYMnFOJ94ZVidD6Oq039QJW3ZC4dCOgg85W/Dq4U/cD
	e5g8/cg12X3GyF3tD9Y2lNwKf23WYO03e2aHVRqx5/ipkyE37lPlhB9hlsYbhg4/
	gernnEzP6Jwq2/dNx5WDPkD56J3ojcXxH7AjDX3W38n3It74bOGlM8AqmSBvv984
	xAdUEjavgCVx90cAniBbwg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3j8uga63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 16:23:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613F2kbm001964
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 16:23:27 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186mjq35-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 16:23:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpzrV4It7McjF/EqLL81G0cJynr0gW8Ubogql50Om9atJ2UlTkaHRiEDBoHdvHo8x20fY5K8tgbHaEXiJQJseCwNwTXtVDr+iny18lm2E6WHUP8kdPnKmfC+kpISWilAG5WvolWNAwu4O7n4ioy+EJsXksgGu4Vg8mrOuRTRDk5+/D/sJiWxB31Km0Iry38wAPX/Y1YSXIw/9FyKPLezwrHpsR3S4Lf/hNu0w31Zpy42QZczG3AmO9H94v3EIf/YOMkLDTCZqVhgN5+46E76hj9uwax8Womha7O67rmO/jVxKvsDruTSjEpHXNYDqNZliAWk1zyZ73i/omrTb7Bozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1MKr65xzzA8UzHzWZOS9jIQ9JszA2qZRbV7iwRS4QE=;
 b=ruFRI6OGoaLRfKhMrmXN4fcq+yHJfATQZCuLxrMHffuIuZGuTsxqCCeGahrn2T6dSZycoNR25xO3ArXYCWueD04VvWe+uv3D9ENDOtldzTAMGhWCfZn84RBk3FRPwN+pbYhv11KY+9T7Nqyq4N9+AwsSnWYkNEHQojdSzbYt8Mi6IHt80DYWaPhRSYM3NnMXyRB+rPFHYjZDzbPpsLZ/fdBqcnevFwZW9lhh668/Sp/tgSQytfq8c40+PlHVIWXUIehsz6KQ1ple+vFIrd9bPqJinMRnTL2hZm0STwUrOnm3JTW2KcqfCmUkAKksDz14bErzBle+vWJan6cWkmqKPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1MKr65xzzA8UzHzWZOS9jIQ9JszA2qZRbV7iwRS4QE=;
 b=K0mlKl/lbMrfIcdpDjpfOOVZ5c3FveKIDKP2D3T7xek9GexSkFVcZkDKnVuxlvK2p1zoaIfOSsW1djcyab4s0ovNhZKcAVZrUvl2VyjusAKbeiJzzd1CDFXYQBgQj+eieQ+rs/JLv3NYLMpgA3ulImdKIik0Ftt4pR/UVj2D4dg=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SN7PR10MB6617.namprd10.prod.outlook.com (2603:10b6:806:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:23:07 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 16:23:07 +0000
Date: Tue, 03 Feb 2026 11:23:06 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: fix missing attribution of patches
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB75227F1175EC886B4603D47FC29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SN7PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: debe946f-a661-489b-4ca7-08de634083c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rY+w+UCess72h9IiZS70VOj1QDQs+QANCqEs8cM/9IBwVt7UlnBLUsrPp71Z?=
 =?us-ascii?Q?xTgvw3+8XybZnc9mKLuHTYWmjuIqJHusViXPeFTMQGiyZCI9G3wtvdubKeHr?=
 =?us-ascii?Q?eHHHZK25OxZtd9xY1XNhFs0e5vr+faV+z1hVVAHsVC7BZ6seR74qwPPIlu1i?=
 =?us-ascii?Q?e0EcGUg2r7iYM5tW2ux7KZTajr+sxQ30QWVKAfnA3xRjRHpWVjinbIOxkwe/?=
 =?us-ascii?Q?/I62jQaEMxdI/z0uo+QphCuPR8+3C7/y95yAYJgUcEFQquLLjX2iGf77nTHO?=
 =?us-ascii?Q?uTTdOTtyEaeFY1bzdOrEdhmIDHYfCTGJCBfQVMZg6SqxDVH7gHGmtnYccLFb?=
 =?us-ascii?Q?xwXMO9Onqf5WbhM3Dv+lq5eaxR7X8l/cq7ns45eu2c38EhKxidemJh0PuCFr?=
 =?us-ascii?Q?xZGPPXqB3R5DS9XcedBjbIjhY4fHke1Eiq+nBbReAoPEhTyk2d0mkU7i9aQG?=
 =?us-ascii?Q?LaHnmGOryGJRqHGFyGR/MD06iLa8g0+a2xjVc1GO7MBtL6WSERW7rWIiPFhU?=
 =?us-ascii?Q?YyhfBRWXaj8T4WAO3OZXGT2F+7C+cSfS+KfFVM8wpLXm6SSd5AVl9agF1Lx8?=
 =?us-ascii?Q?TuB4VHJdwMbnW1qqJs1VT9BKtxDKrIS5vvMY4ziWNDREUxLRi3fOsNfLEr+r?=
 =?us-ascii?Q?KOPW8VSQXsDGkzNdNA4PmT04b2qzPneBXoLLuYbC3meHCI66W3RBzkztaVHN?=
 =?us-ascii?Q?+ypNthUlgxa3Y1NcEP1UJXxnyPDWiFHBD6MzXJ1IBfaK6RXgjxBitdl7KlcE?=
 =?us-ascii?Q?+R/cIbFaPx2A3aaEkhj6EZG5Rg3yI8V9o1tX1VrA0h96gmleTVPA/zDS6ABn?=
 =?us-ascii?Q?Z2VoKj6l8H6aplrrM/dGy9G9ydH+EhzY8np/VBt6oZQIpX3PZSepsr9Bm1mx?=
 =?us-ascii?Q?V+7QV4m59N+1bfcwVIw5PUyc9AU/4Cmn+BMkyAEKyCAaELqOEIQ8Ss5YwIH3?=
 =?us-ascii?Q?hDI+f6TSnc7G2JWxWniBe0Agpp8GWXR1/Qli6bAAVz8fwGVye0Vs/vGfXNwm?=
 =?us-ascii?Q?ZxGl67HRMbUTlEPTUqK10WeqBj7ckjFKAE8JDRB7FyDGEMQXzzlqsrzSepAr?=
 =?us-ascii?Q?aNDY5+ftc0XfgPIFWFTj5AzzmTOb8zcPsNMU6OzsZ4sRoD2q5h2UAsbkQzqS?=
 =?us-ascii?Q?R+ruKia1pUy9gX2twDfAbD8KZJe2feaOs5VyCnp5rhmQioFREinqh/KTlosh?=
 =?us-ascii?Q?vF9SBixXVLK8Nj7zaoGFxwTbVv7e+XCzwD7zaS+GDlw7RpLAezkbG4Xk7Btq?=
 =?us-ascii?Q?fOqG4ZurASNn27I4r4+3NYDfcm77JrbisTotISgjwSuRnsv0H8HNRTAZztZW?=
 =?us-ascii?Q?i7EFcMPpshvAFGAZRcZyFU+J51iMc7Y1sgUoRWKcjGnwr9RhgoZzy8IHhB4K?=
 =?us-ascii?Q?moNE7D0NwG7GtMxfOUaSc9HpjOp691QbYAsq2oI0ARNNfBDdBkTlJUnHBagV?=
 =?us-ascii?Q?2+Let4jIgj/12To3cBrjSXTfaBN2uEphbxgM5om/E/QgcyYWQPFjurzhQBDb?=
 =?us-ascii?Q?Nboo2e5MI4V7+HjTR9hAhybCOcoK1F6lhhe6msGpuFnGOb3qWmP2DdYUjyyQ?=
 =?us-ascii?Q?uwAqJzN3Uj4dYJhuL/M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Av71locLoDFFP977N018QUjvNDl6TUlVE8zNFnqrXuYs3Ac2ygW7BLcUsjKg?=
 =?us-ascii?Q?eWRxday/J63rQBesRnv9+2FnozcVj4hhJ9QLi3sFCshUqsNS6nKGbhTnS/0j?=
 =?us-ascii?Q?r7GQMuOn9ngycTJQCqZCj245vqrRub1yxI4XZzzSYe7R4dP7iWl7yjaF4m3u?=
 =?us-ascii?Q?nfGYzCas7r3jEuTsm0JBA6tPTKgwnaG/uLUwAzlsbfW1R8grGHcPePya+i4h?=
 =?us-ascii?Q?ZZskIXSmEDSYJLRG8aJFSaERF6Vw8xnA5yn/0G3gfJnrJg1d81VHSs1a9dMW?=
 =?us-ascii?Q?gDREkSGckd8+KyncdD7EwAgvS8yLoK6TYrq9b6OK57EHeMuTJfi5PAbquXWJ?=
 =?us-ascii?Q?i2ZybPiReRLCPmt79UJVMKrsQ2yx1ZmI/U5AokZqIWT2sVujekjFovUOYL6K?=
 =?us-ascii?Q?BlAtPuHwlyk0Qjtqc2w58mSVyFaBszOkDUaqHy8l+7v8bFOfMvqfUr7iPPTy?=
 =?us-ascii?Q?IOt5adpkSbbnyqGDWoO3FFTQyK6uUmXCUqwcE30PTwFfVjExwVDlJBQb6oj1?=
 =?us-ascii?Q?oUc094oWLHVCkVp3X0AiopwRWDMCVEEvOcbkyF62tmhDYTAoWoHnzD8PRSWg?=
 =?us-ascii?Q?JeRsWxT6awYMoOKu08F7qdrNktLksBnqsuv7tDaWWIlbnbC96zkRPBt3QnKC?=
 =?us-ascii?Q?+p2qH4xj2RQsR9ufO/m20CjHvJ5vHEwYSlb2aK96D7KYg2QXcnoNC7x/wrDb?=
 =?us-ascii?Q?uLruPMYRa9LuVXlI1Nj45cU0yeUbvPRz8UL/uhoTlazWHYbq2MMG6H9NCJ7E?=
 =?us-ascii?Q?vOtjI8ktbgZ/PdHeuOnot/Ua5jYii/sB/yvitP6vy3kGt3TcLiMS08HnLNrQ?=
 =?us-ascii?Q?b/2a11GGHqDx9qFESsJP7v9bLvkOxGpQvmIF5Be1s6sYyQ/LhTgq5vC7BdEU?=
 =?us-ascii?Q?HfFn/klXYNsRE5litRh6vp0uifCMveH4IzqAdFFBq97aqplxHl5wG2bkuQAa?=
 =?us-ascii?Q?taMT8Fes0rNXOBeIiCXr7qOkHaNdT0kpyDHdfrwJbCENFTCC72jZUMOrpaIS?=
 =?us-ascii?Q?8QhRbwt14lPexV06rDwtw1Ok9kJXhi993g7+Rrq4CyLEP1/hefTt24Gq0uNQ?=
 =?us-ascii?Q?ZS3/6Td05BbhIRIbLiiiHfg0a1E9L9fVlNJfbaotmdaXMhBFJHVfzB6XpUei?=
 =?us-ascii?Q?KU/IXeZ93QwnFKv+g6UYvpPItNgQFmdoXzyhee8H6Bmbs240jGg8yFQVYXRI?=
 =?us-ascii?Q?mXj2LiGi6Dcw+Llok0g1rLvUfwiQjs2D5mKGVPg+pVDFCgCfvsQogsLrlPF1?=
 =?us-ascii?Q?mGt4uybfknnV4pQ0oZDfDabu72j/4jSlFLu8UOenEgrBi51WVWEFMoWPQY7U?=
 =?us-ascii?Q?cbM6LeyfC8Aiz9YfJz8x9blv6ALcwTxCO/0Y3F1KX/Ej3i0Pa9O4C2bsxiDJ?=
 =?us-ascii?Q?ZA4zhk1Nuqpb290iScSnqvoLuVC4Ngry9jWvEqELdMwXDzv5LQYaeYecIAMp?=
 =?us-ascii?Q?7dMAQ9Kb9ju40QJKlRKLgbTU8TLjq3VPPJ7FZHCDvUm4DdMyyHl79IaLvsON?=
 =?us-ascii?Q?etsMC3zox0bDEmKS/w2nrXTbR3/KZHYpXeUgLciMzum+KS6kBqNxF0Ek2RHq?=
 =?us-ascii?Q?3fCLrOFgV2/NqkUawPCc1wxjczmaWbNqVipYF/sZ4SON2/Ra9/eyEvYDTxy1?=
 =?us-ascii?Q?fTquJFwHg6LU6rsIl8VEJlN0tmjuslprCEUw6HESYfH+XLM4H9yqoSb6FxNa?=
 =?us-ascii?Q?MdS7r3lgAZvcZNW5nhq0FEi02P3K2g+egCUWe3JvZu54LRCziwJmkzwMXpoi?=
 =?us-ascii?Q?WiCGoUOaDA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OZH3oY3cKOolWVwGRDkgz5AeNkIBTFbUXJtI5t/+ujEUFrg3/uQzH+pNwS+ZgsE43gv/uV+NSn5k5KokBW/wtfaQ3cGA4ZhK8dzIbFlpxcyn2hr5f4Q36XzQJiy4mLrRJ5o14uaYs6eX12b9lYcw6K8RrfB7yJQnQ+MfM5tcmDpXaNECH1NXX0zgd3vKvgZPu9s6kxE8J0ga1IEtmSduArhsxW/JqLvziyWCjjePvn2cLaEmB/kD58J7a/pIQ+rB1IPxWj0xTOnj/dDVsfy90pErOzcXRIvbIc93OWJd462lS322HalJvJeU6+ZhegHONGmMTFFGr5ADJPNQlGOJRPUgiNz7HvTEwDZDQ98EVFXd1io793rJ+FKWIfcBzrnYWFt5lzq+CK9UhQzHgG7mGQd8nHpzvFo/AAeH3u31CXounS24c0P4IdruFJooE5nOsOQyA0VqcEot8JPfDKqr4Npt2HuHEVk4XbWsxfQVsCPAC7Odnd9wea7Q35uDMFOptEv+OsfXMt6KXnxPmbhvpQ9H0lxJoSnC7EcHC2u+/ExwYdrWsihsymrCzOqwfsSlpqJLmFCL+IecvRyrqTKrLEaOfL/95e3fn7QWFgseuG0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: debe946f-a661-489b-4ca7-08de634083c6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:23:07.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TrzayEm9AwIxZZKh7lS5WebS9fpLmiqabMLvR9/PCoDbhL9Zssf7QqE7WgowcxtrMBwh5mR55DLfcyG7EMi2FLcItOLwpSIMdN31DS/Humc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030131
X-Proofpoint-GUID: WQHqSr13hpBTu0JNRtd4Q8onTvwmT1sB
X-Proofpoint-ORIG-GUID: WQHqSr13hpBTu0JNRtd4Q8onTvwmT1sB
X-Authority-Analysis: v=2.4 cv=BJS+bVQG c=1 sm=1 tr=0 ts=69822100 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=PrRoNXdMV8jhObifQFYA:9 cc=ntf awl=host:12104
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEzMCBTYWx0ZWRfX4LI/EapR8Dfp
 LHSCf4nODXBstWUTE3floeEcJeRabIKjtW4U3y7msC8r6gVRj/M+LTrN2S4cpnyCYVTdV6nErJQ
 DAqvCWpRDHuXGvD6p5C+abANE8NeRfzgZr90gCLTZlM/zbT9+V2qtcFCA/4Y0oHIUfb0aMKxy10
 Fjb24G2UXd6Q/1nYaD1nfHchkGiKANikjaiAHbUwdgmW+IBKc2VY5g/ItluVcWtOp9mPcIC8SRh
 mFNMKsKEqq0lHm2Ta9teyO5DTa0gUzH0BgnujAZ/y7j5BlN2gIP4wX3Db37jWIvssA65MuZXOd8
 90F3cctBoXqY85p4u1hCRtVQFtBEra6bmAeKmwKPkem17tGyqd3R3aLQaJXI9qDyDZZ/qp1ewEr
 P9fSDtnf9OR9al+TbjVMypmRlVlWuC4j9gf7ovpkRBLBw0V0mh3gjXorW/4BZ2g9F9Wnj0tQlmQ
 0nVS/b2wZaAPKXT1dK/pr405zvesDzz+KyStGAjM=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index 6f0b0135..4d470cf9 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -231,8 +231,8 @@ systemctl start dtprobed || :
 
 %changelog
 * Tue Jan 27 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
-- Implement PID-specific uprobes.
-- Allocate the buffers BPF map to fit highest CPU id.
+- Implement PID-specific uprobes.  (Kris Van Hees)
+- Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
 - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
   [Orabug: 38776929]
 - Fix prvname so that both rawfbt and fbt probes are seen.
@@ -240,7 +240,7 @@ systemctl start dtprobed || :
 - Do not convert "__" to "-" for stapsdt provider names.
 - Fix printf formatting with non-monetary grouping chars.
   [Orabug: 30430270]
-- Discontinue -xversion=V as an option.  [Orabug: 38615307]
+- Discontinue -xversion=V as an option.  (Kris Van Hees) [Orabug: 38615307]
 - Add the DTrace Tutorial to the git repo and install package.
 - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
 - Update LLM context files to forbid "if" statements.
-- 
2.51.0

