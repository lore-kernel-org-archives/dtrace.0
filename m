Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E044225797
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 18:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424893; cv=fail; b=YPfKZimcfs8wH8n0XSTz2rkkqzlrsf9/bwZ3EcauooQ8JnPQzMO2fzmQke/ErOFPl7jefDZikfWGcNf111F1TZKigBPO2ENM2Wig+tEX9xJyRcZTPfE8wagoIyHD8z+DlmxhBEz4vHDJjugF/Y3I8sNN7U5RCGbd6Shdx+9qQME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424893; c=relaxed/simple;
	bh=rfZfPxSuE352Vgk9SmLHfxCRjjnLIRMY4CDsmxOFlR8=;
	h=From:Date:To:Subject:Content-Type:Message-ID:MIME-Version; b=OMqKV8TCsuahI1/sH5f+QdG3VRLrp/1WAUWgG98L9z4zUjXtJQA3dq7Xwy95uSOwlPtAHnzopRORyLiL5nOM2gfgzBzZD72bj0L6J4ZWCyu3t5wblQzdUvVxYMOIEyvChEjFCaavBc4czu5Q5357Y2Jo11LuI4uTMU1ZwbsTu1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lgMHAv+u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FeNW9ZX4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lgMHAv+u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FeNW9ZX4"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5DfffL011223
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=EW+FOTwyAwpNNdy9EurwSWZqAyda3gTmv3wCmIO4HWo=; b=
	lgMHAv+uWILa4+GYw5OQ3GlFi4ORp9fWJ00lifbMD1KZSfCp1l6uB5Q6RIEO1Ux3
	oZf0481VVVpC/lWZKlw+y9yYXUoTBm4YH3NI3DDPjDtfIes/eADinT98ALkbP1R9
	+hJ9xe6E8UhwNzoeBKwEBzRcPf4XjL/uDmzxEudbauXOM1f3h/A/gKHhDXRjLcX6
	NnldJ2sXXriZcRhlv8qfzknLa1IWlrqZby6FZLhLBDW3IQztDPh1Osxmb2hOkpAX
	P8MgFpF9U5u9tKKFgwYC4F6iP8cC62OnB36rwPcudXRQap1d9OigOGHESwhDPtrR
	dFDSaLm5GCVUIs3IoD4xjg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbuxaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:54:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Hx7U6011686
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:54:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 437s5ba8qh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:54:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXzUeOGgk/xyxfZ+xr1Bx7Jq7rexC7txnc5TTQ4a7PewvjCIA8Mf6ulAS83x0e2dj9IeAOLMR/MAuKG9L9shRlCqXgF0czufhvPCRXU5BGo3tG0dYWxF0Scs6Db6cxi6drr06LTQS18VRJwaifh4u+5T3kT+jtXM8sTuJxnzIbB9zmP9+yFhyQv6PWIU4b4sv5ASgUhadAIynSa5ssGI5gSJhTD2vZ+vKwG424h+CUXs5vm5jkHKpn+4yOA8itE6Dbd3C+STAmTjD0xNBi2IHB07fSuoC/98/4LkAEZRTjAyz+CvscpjTh6hKtXl0bEJBBz7f9Sovlx2CQiGGTAUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EW+FOTwyAwpNNdy9EurwSWZqAyda3gTmv3wCmIO4HWo=;
 b=Pwk98o5HQfTuZEeARK7g4tGmyp1b3F8exez2+87OBUKCdXjUHgOrGY11hdzAMmkiVS74tU597Yq6/90cGVXuk8NDlTSYLupQN2w/4httSGAE9C/sDzpnhb3XEtYLeGtw/EEKRW8lG62/dCaQz5InzytZ3H0amMhzfGrNCZiUZNic1pLw3PfIqft9IUxFlS/B6BxPX3VXcSZKenW5Kwml1o1WP/S7ujuYWKmLfeMXpUCWiKha1UUAw+4V9x4T1y76aY2zS5cvjqduThvHzEZSAze/2Pz6bHjJE/ryNk6sT/sjLV2JdLwdX2XbzHdWZ6HW7Rmpc6gzcYWuAbhJiPXNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EW+FOTwyAwpNNdy9EurwSWZqAyda3gTmv3wCmIO4HWo=;
 b=FeNW9ZX4HOHejbIRIKm8WY4lnW7taQ47WL4Lgpbx68SO2S6iRCMHjUx1KRBsaiegjJXPdpfuFFPynXER6e+L4iGyJ0D1NFZhGUq6emJc733wN8SSropcHxh1Vn4F+HCE/Mcsay4TotLhdFdx+7dIkOpMoMvW2/7Go1jOULJ0VxU=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by CH3PR10MB7282.namprd10.prod.outlook.com (2603:10b6:610:12c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 18:54:46 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 18:54:46 +0000
From: kris.van.hees@oracle.com
Date: Thu, 05 Dec 2024 13:54:44 -0500
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 4/4 REVIEWED] sched: fix on-cpu firing for kernels < 5.16
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0431.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::16) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB0037E689C858FBB02FD7D509C2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|CH3PR10MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec73339-250d-41c5-142e-08dd155e4981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y7JsTLp/x63PbQHjWA+fUI/y9F9nHl5LmvTjROYgsnDVhEBWFV4ABHeJD3VI?=
 =?us-ascii?Q?yCELGvsdwKH2PJp9bzR/JAt4j26hA10pA4VJSAo4tOXAgfZOSXULuHSdAhhr?=
 =?us-ascii?Q?JccMihbGaEuibY/HgXs3wCBY2VuZfXxG+Hk2ejb2dxrleCvp1WiSnsNxciWs?=
 =?us-ascii?Q?CK1Lb6Wf8ICq6STgzTKYj4yCllNZXVkZyZYGtY7C6CFatYVKiInnRdtE5uXZ?=
 =?us-ascii?Q?liQ4wCXQoOCoWuCs5dmCSv3evXmpCCAL3mfg94u+hDmgGFx9K5oG/OQLUe/w?=
 =?us-ascii?Q?3BxEHdt9g84J5DgmtvLSS9jiR4iq53VH/ooRe935oa1sg9YHZxoyaXUWgZPr?=
 =?us-ascii?Q?WRTu5eWuQh+7XOFhAm3SaHAO4Hixr9T5KOyZTKho6dbPkwNmtVyi4ilxBCbP?=
 =?us-ascii?Q?tmdVBLGLwXH2uVbYkO+VCdIEOyMXedgkxeGP2pbU5YQrEV862ZEemJGpctBc?=
 =?us-ascii?Q?BMlzpvJBXLhu+ms4IKDjXZYF0OEzHx2/UKcrDDb0fzoFrtBvcfcunaR4xxGi?=
 =?us-ascii?Q?DacjB0LtCtDrmOmCCy3BGCOL8nR61KgT/W4zL3PAl7A+JUjlFmXF/tDEkin6?=
 =?us-ascii?Q?yZPdHad1rAauQ8ULrbtkfU05hDkuDbk4Ym2/dbJaXqvzx9mnO1tTBUPqQV5O?=
 =?us-ascii?Q?YRuKibvJEE725ER5SlRjL0iuI94IUQJgj4W+4YJPbVkXGANrsqL3ZaiqPKhq?=
 =?us-ascii?Q?eDBHSuEkHYzQMgNcinRP6lp8HWHdSmHjg52F4yaisQ2GvFo8J5UgBguzq/JD?=
 =?us-ascii?Q?X4LMdZRA5GK6HI/J58joqDsk93f19d12uIylHsW9SsLimFpq8vKfEnJ3sqDh?=
 =?us-ascii?Q?pEaCKf/BtJRDkE4Xdgt4dc+LS9ayUOE0S1O+SdJNtw+EnbK1IqZaBlzs2vaD?=
 =?us-ascii?Q?ifuJNjXRUHjrVUWxAYh4xC9jtm3tM53qo6kmPELNQXlgTKcRU8UORb1c94Ay?=
 =?us-ascii?Q?yZQg84SCUQEfuZ5ofIhCvvfpEEWoGgk1G3eg7XNj9i7qZHiVZNKcaNnFQ1Zi?=
 =?us-ascii?Q?2gmsDTF+t6wkzHJu6mYCixUXv8Bds1HeH51WWEilIc3FlwaiVDzvEcEd2i6h?=
 =?us-ascii?Q?6SbZX7jsHJnFgEcdtnGPtkcuvLJ97UJW38WGEpNwR4hZhKuqavVQylUz9qZP?=
 =?us-ascii?Q?V3trmCU5IWReIHodJoIoY28xZAqWPNrsjylYvdxLwA5btJnLeD8Q2SrtO1ct?=
 =?us-ascii?Q?vFSQxGDDPB9Io3WOQAoGvz5CqT12QlbZOxT9r8q7Imsman4siXsJWDicGiZU?=
 =?us-ascii?Q?Gbi5vomghzaMl7BsTxWy0nUcWKboncwXgNFKHkeFpYUH4R0EAOR6Pg7pdFXc?=
 =?us-ascii?Q?JkDmu+N0LO92WpLITyo0sQB5r6X+nh55UARJDrd6Q4XzBg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xhpoVBogZq26LO/oqmp8T30Z5Softd/phDjh+rFAmADRiMuW3rs92r4vDeqa?=
 =?us-ascii?Q?wBfroDgEJzYrNZeCiq0NmeOxLlBA4iwFG8bMjD+gg2ITi2LTgAc+dPRlfhFk?=
 =?us-ascii?Q?Q9MH/6ISpNEcmUBE9ek3HOnVcUG46NODw8iwTIxTeIyFagQAGBN66cERet1l?=
 =?us-ascii?Q?B20HNoe1b74LxXswdxKjrNYHSDXKNeGSEgGNmENh2+VSgEYMdukV1kB1ORmE?=
 =?us-ascii?Q?MEl8k9XAZswQjkqZYb4mwzFwZweOXn/MW/UkblgwAg38UJBTMHjIjJAaSgbJ?=
 =?us-ascii?Q?JVBaG0rB8+T6oKG7iEEPQUWxCr9hDsfZorDRxQDxenz5BOnyntoiLrScTI6p?=
 =?us-ascii?Q?Mz9za8rhQjQU8YDvGNYPWQtVkbZtIC87PJ3xg/3qYRUt2sbg7yUyrdH1N621?=
 =?us-ascii?Q?jk4OOMA08rwqWGu9epGvB0kVenqqMAMkfaOknPMSeHBHZCFzRLNS6CR+gtdK?=
 =?us-ascii?Q?5dLxJFVmUZkTMGG8TY6anT/XsvieqhXsS6wCbwByzhUeWTY0L8Z85NyZwFkl?=
 =?us-ascii?Q?aqqhDJShcvFE2iMTRX3/VdcXCb7bWrSnOzBfHV8MlkZBdCj7PZvANWGOpC8f?=
 =?us-ascii?Q?8K1VnJSxW3jrmUSNhhXyUgWs3Cymcqap23BtMlQ5iWnolVRSvs6JbhSO5Dsy?=
 =?us-ascii?Q?PHYzkouPkGvkgzF0upJIbD3AVgrbCFavm458wMDCLsjvKASJUV/rXO6v0d9u?=
 =?us-ascii?Q?yF5zKwnrZe0LiJA7ljb/Ddfn3mTxyG209amufdEd2Vh/dTim8smo9RDAilB7?=
 =?us-ascii?Q?h4WY3xMY903oEAlCzjl1/ZKGS8D4IfTSzHKUIrbWxqbeGibBsc/8R8aKVQ9z?=
 =?us-ascii?Q?LPSjP+9GQUjdTcG2zPDzetGAunHTjoRbz8aVroLJNnm5DGFPtH+xABN/rOgR?=
 =?us-ascii?Q?OtekOFn7Twwkj3o0qYyU8Cg+eVsPq2Repa+P/kzkmRv2UD6Nu+PCSMELWe7W?=
 =?us-ascii?Q?q+CXuXL8sfSTB63ppqdlHPK+DE3I2G98YzRqj6pAMFIAzNi1hcAxnrDrUprV?=
 =?us-ascii?Q?yB8PGzKLzSLMbkTQ0Km14X4SGonF0WykuMlpVevbQHw9ZcfHg6GQbFObWXH+?=
 =?us-ascii?Q?FxxIF2b3CQezwr/0dspuYI9DrLzb67DccBXannwUutPuMX1aISQWnEA6upZ0?=
 =?us-ascii?Q?JFnMZSYaOAOFBVmvZATXyAK0/nL8Cb1f6c+ThOPqdYf44eoDcMuD2ErBT4RB?=
 =?us-ascii?Q?+WPSIKu6v2D6sjuxep4ognkxxLfOLYly3Av5fAaQ1Y0ZfYYDRNFrMURTKd5U?=
 =?us-ascii?Q?dHNv98zrSu+ZxdT1yXVKGy4wL0S4cNERuAUYJHkPnl0S+8YAi5G+xJUOHh1C?=
 =?us-ascii?Q?koqJpijxFT7eydGEx0Q9HN7DnYq/YsOgd9xfPpHjycMGqR1rljH8UOdnuY3k?=
 =?us-ascii?Q?ktMugMlCkRD2yzw1qiPl4gqDUFhWaHfBXju1ZUhOEE+FbWDM1PY4Dipx1VxS?=
 =?us-ascii?Q?IgfCXD1utTKeP+DUGMFtg9LxbdNoMSjLfKQJwUc9OvVaIaKiFhxQy6AAdVzU?=
 =?us-ascii?Q?xP+uO/7Zf3fLBMXWjM/UcnsYAkl6tO2wss2eFEhrbEPunoyEHEDmQ816t2eG?=
 =?us-ascii?Q?mdlq609KttoHgfQP43zmDXiGx2GbjC3bg9w4FKowMLB1W3c44259GhSGp1FB?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UhtkC47woLctgSyrwOhVnPNbqRj5N4udhi4LWVf49fpBbAtdN0b0+AGAOs66nmqvW+xCGRweypY4SXm8HqHb8uVzcSb4lVvrCytj26BF7aveTsvvtJChC+z4wCvhmpzm06NoduWjkLTcVyV8IEnU7sZp23VTZ69o2QHPMZfV0sDKyvxARzsc/F7CJVQRZd0tak+eQdURhZgTeJRc1VO6aw+QphCQ4jlIdD3cFbr0+KFUdptsRQQB4sttpJKOItCkyOfRmbC35LHrNENxNv3x5zt9AXooHp1AqTjOneBw2Kck6k/ZUfez6AccJCKZ3IHIn9ulADe0Z5bzjBdWEyHq8qY09ldAdfkj1dXcRVC2AhZOTGPpU79yIoWiXR6X6K6F4SJV8WsQ2RlxLMsfKy9GJCBBWPjrg1rZdpmsBOx5+OSqUzeb4rH0orfOJ2gegqC1qDPva7WHBa2U/2lJmrdhrzhpRyPc/GAo7fsq+k9q61U1vHpbnJhokWzESjFtUyUquazvaYk1jCWFSpQ6FxusfL2AAwSQ/PVdgw0EUt5fAOLR9Iqo7O3sShixdCdB5mdYnaDmO6ULwne07VZyh4yxvcU3Vu2hT/J8/XkQqPsQpRs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec73339-250d-41c5-142e-08dd155e4981
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:54:46.2061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rje9RHdHzBBkuRguZMcG+TzZe1M0zRwSl0kLomrdHIHVLl6OUa7idaJ7pCpu10JzVNsYFMpcPCIzdKk2But5xNIhTc+Q9acN9zLnyTj36NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050140
X-Proofpoint-GUID: 2BQz9dp-svKBzkjn3mIJY6aiZD3poO6d
X-Proofpoint-ORIG-GUID: 2BQz9dp-svKBzkjn3mIJY6aiZD3poO6d

From: Alan Maguire <alan.maguire@oracle.com>

The solution for sched:::on-cpu firing (probing
__perf_event_task_sched_in) only works on 5.16 and later as the relevant
function is not in available_filter_functions in earlier kernels.

Instead use fbt::finish_task_switch:return and
rawfbt:vmlinux:finish_task_switch.*:return (to cover optimizations that
result in a .-suffixed variant).

Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_sched.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
index 4fbd24ab..e05ef246 100644
--- a/libdtrace/dt_prov_sched.c
+++ b/libdtrace/dt_prov_sched.c
@@ -28,7 +28,9 @@ static probe_dep_t	probes[] = {
 	{ "off-cpu",
 	  DTRACE_PROBESPEC_NAME,	"rawtp:sched::sched_switch" },
 	{ "on-cpu",
-	  DTRACE_PROBESPEC_NAME,	"fbt::__perf_event_task_sched_in:entry" },
+	  DTRACE_PROBESPEC_NAME,	"fbt:vmlinux:finish_task_switch:return" },
+	{ "on-cpu",
+	  DTRACE_PROBESPEC_NAME,	"rawfbt:vmlinux:finish_task_switch.*:return" },
 	{ "surrender",
 	  DTRACE_PROBESPEC_NAME,	"fbt::do_sched_yield:entry" },
 	{ "tick",
@@ -157,26 +159,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
  */
 static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
-	struct perf_event_attr attr = {};
-	int swfd;
-
-	if (strcmp(prp->desc->prb, "on-cpu") != 0)
-		return dt_sdt_enable(dtp, prp);
-
-	memset(&attr, 0, sizeof(attr));
-	attr.size = sizeof(attr);
-	attr.type = PERF_TYPE_SOFTWARE;
-	attr.config = PERF_COUNT_SW_CONTEXT_SWITCHES;
-	attr.freq = 1;
-	attr.sample_freq = 1000;
-	attr.context_switch = 1;
-
-	swfd = dt_perf_event_open(&attr, -1, 0, -1, 0);
-	if (swfd < 0)
-		dt_dprintf("perf event open failed for context_switch: %d\n", errno);
-	else
-		prp->prv_data = (void *)(long)swfd;
-	dt_sdt_enable(dtp, prp);
+	return dt_sdt_enable(dtp, prp);
 }
 
 static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
-- 
2.45.2

