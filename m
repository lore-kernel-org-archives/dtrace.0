Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2341D25570
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726336872; cv=fail; b=lJAXDLTTxz9OkTNqDKFxUIQKlcFjkP/9WJxwnpUYQ23DsSv/1SpnC9z+xR/R11BmsuQv8o4Vu0vT3y4nHc3eiGy9CwoYAFixL+yjLWvyLWypywE/+Gs9Z4woujW6FgAPJCOr4uo6rTK3xDv+8tpruJfol2KGEtzNxaXOTOin0so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726336872; c=relaxed/simple;
	bh=HM9aJxyA2guBOaTvU8ur26+v7WFkfMWB9VX1V2gSPXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ofpwni0i9q51Wy9Q3k+Vj0oYXoKv1tAOFlzMTKMeh3KsTL24CRlfa2DwYQgoetF2ZsvokAny44HRxvI+QEBLoJKIid6ezchCmmvAyuoM+g3Av9jbYMaFSJTwBqWrgaJFmH5EoLn+s5CScGjHHRcYD+PbTsih6525fu4AYKTbwYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZNiyT+VQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QK3x/Oze; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZNiyT+VQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QK3x/Oze"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EABbNe002134
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=rNeIzvvcJIg0dPc
	LNegyKRSpcnJh6MUc22ky/Yps2fY=; b=ZNiyT+VQaGE4lztJO11TesVSs7ZtwIv
	C5JfVRG//uU9x2cswBtWR3UexrKWqjTsHhZxNMDwdIlLhn5xcgTaGe1p1G4TE42M
	+INryMOF1aIxCTIYaVZFK7JsZOC9mOHWvGF6xb70dxE86b0W4Ik6ERoXvshPyBP9
	gn7T+Bu0Tj3DNrtDh+rrSEVgIMKH4eVsW4HhOcH11ygdDr3woy5S9npr9Jx0AH+Q
	exDoEaF9eIZ423flFDL+RgnTrSmwHBrDoK+bpJwq3/WdfLpOh/n3B1DKwks6h2L3
	sjzxbI71bouhEvwG1JW+MJklPrHPWomFZOh4qpQ5PoHlJCercnDfZxQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3scrnfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:01:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEAFJi000812
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:01:06 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6pfq8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:01:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw39Vp/u+Al27JeOUHtf/o9oYoVL5bsKu4yL45JRYuEEjURdP8DJ2W7AZYd3HUYWM1C/tfApvaF6vQ4CEovxL699ArjtOPeDQyi9Vvao9ec+dGnko+vijGoI0nukzbItQNHyu88l4krB6jJiWuDvYCNaf/PR827NtypEqUiUSXFAMJvz7QRQAogCxWCOIwpNeCuyY0+mpuPGf4Pr1NsjZuvaafcsLE3oBJmNfXZOF2kFGWjquK3Vxvs5rMnV3C36nLbZFVh7PEzljsy8lkPWZzlDH0/xl6Ikn2Fm3seSZ8wdQIRnuYPW0tI+bqd1h93sFV2TuVUTECR1kVCHtYCe0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNeIzvvcJIg0dPcLNegyKRSpcnJh6MUc22ky/Yps2fY=;
 b=VfeWA/MN5iFTE/ym2WDT1PEuU7AiVEDW5HUjIsirxO8/Ap0NN6x9PjCHOqA11m8/L1VDJEPC/dRYF2yP1Xo+3+YncTsSTRKkD/1oYG29ZA5L0EYGNlwC2Kj6vPPCSvs8vrDdpcALgBiKulzA0H1iV6WNj28/W3lKNgiA9HYJyEL1yONcRJ4rye6rlM1o0CrOL56zwlTQVIWvx8sE6pFfrbrTsIdpp25YyVPTcrmbEqOPSH1WIRrUfntAL8uVu25Kloi4LGxWbOQoJc7jZRbNJOnwN9ikh/OQxGsR50p5UL/FGlYbe7M0LI8uVlzaNjWjSvPpaefiAzM3NGS5Ma6woQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNeIzvvcJIg0dPcLNegyKRSpcnJh6MUc22ky/Yps2fY=;
 b=QK3x/OzexkOU6VOHf09c/caFWRFf5rL0ugIWNRgvxS5Bhc5O/GscZ2+kJhGIhTbHw+vfcxgFn8SY8u0eacVI+O3iXP5ZPAG0KcKhpEWwgml939B3stOI8r80o/ZkQajGKs7oerS6TwIEmLPo+4nS1m9XOPbvf/I3ZUOPJKwUgPQ=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4733.namprd10.prod.outlook.com (2603:10b6:a03:2ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 18:01:04 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 18:01:04 +0000
Date: Sat, 14 Sep 2024 14:00:59 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 16/22] test: Fix the speculative tests that checked
 bufsize
Message-ID: <ZuXPW/seDQJv2dt4@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-16-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-16-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::8) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4733:EE_
X-MS-Office365-Filtering-Correlation-Id: a7819ca9-2d85-43fd-f7d0-08dcd4e7330f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BLh+aic4epsYUlocfotNPLhW/FL5ALhlSVpLfMGu+zDzWHV7BvQXmqNVSWoy?=
 =?us-ascii?Q?QKCJ7qbJ7uwOPWgcleZwDDF2xZWsxFE2F+tNSsm+x2QNq/dnMfWqLK/z15T1?=
 =?us-ascii?Q?79LBEUBa6o7vQ7TPu3vxYnOErP1WPnG4f2ErmE36N200ylNygeTOoOY92HwU?=
 =?us-ascii?Q?UPuLYxM6W64RKXz3PRqCtY2bTgbHnx7uf7nhY3ECemDoBi7cCQFzSR/t/kQH?=
 =?us-ascii?Q?O3xtfedNl1XJgH+48eTxqnzMXqUW+lErd7kB9z03IgvUs2gKctshjGPrPOY2?=
 =?us-ascii?Q?PuEZsDLb1gtnpi99w3tA2mQIqJfNpK1OQGWdy3UteUMt4zMQNOpxabySwxFG?=
 =?us-ascii?Q?6QNL0KOE2vQ5KXDLL6//StvPLlQrtwFf3s4xXTmuorGk5FBVmx5ky0yRm7uZ?=
 =?us-ascii?Q?KFvHJ7JQtDE4nA3dqH9bwoyMbCvRYFTbpzQKeDtWgf9TXsrWqwbBspxvVuLO?=
 =?us-ascii?Q?/WtHLUNj109Dv/mHM8jrtCyX3F+RkR+gt5h8bdzJn2m0jRVymL6hTAVSiODb?=
 =?us-ascii?Q?iznd7IsVKFFsNLK4BMmDA6jE42oTeySCLeLGfz/9YphtU0Z1PSFznJiZe052?=
 =?us-ascii?Q?Ax+aKqUFFUNxphihcw70RvGkT9cyvS0J1x/K+hmcOjHiOqbZWOBPeTRWNf86?=
 =?us-ascii?Q?wBTzV30uIHJnnXuwg0OomI62AHDW9iNbW/EFHtk0oBZdTedbdkibSTAY8eRs?=
 =?us-ascii?Q?kLYmRpZ9Gz/jtPylWF7beVZYZP9CgfbJOR5ZwHpA54G92AFU5KAiOC+oT98t?=
 =?us-ascii?Q?e/ynhKya1UEw8q2z1OI7BM016c2A4eX3dkzOxOlO5NMzKZ4SEa8ib1hGA3z6?=
 =?us-ascii?Q?KSYpP0lMSSMCikb+BaWXE+dUQqpE2rIy1YulAG7ux3zpS3rW2J4jWxnNUL5V?=
 =?us-ascii?Q?zLggr5Kfv6Pek0ugVRTbaaJnGe54GlWHVzykwsPjMx+ysEocQk12U0ZgQ4QF?=
 =?us-ascii?Q?0m8SPG4krpaMPlU+6NC5clfnbGmzETR2+AysGCrJSZpJjAa8bT3O8mq42M4L?=
 =?us-ascii?Q?ypfxgebsRsGXz3XyMxybasxZZOILe3SbxyRI2uTZxpms6lE73mpXp6L7ssUD?=
 =?us-ascii?Q?ryz/K49gkUUMtMeUM29Vhl63SSO9w3PltvUpbOZVNZdmSUPnypCQscp4OOPZ?=
 =?us-ascii?Q?bd18ZMVyP8itntzzR5L/2GXKAcMyram8roknRSiYGYLsPi2X6rLQ0spjH7ev?=
 =?us-ascii?Q?CioTXTqwI+1do4pcjzTqvLAiO8nOrxTsyi8NX4TRBbH3eN5Cyl0WCBoXhp81?=
 =?us-ascii?Q?4cA3aoeeQFO616keRyFSOym7ovflYzpviGZHRlAxlJFX03oNVeYIU1vaPMtk?=
 =?us-ascii?Q?lq+dzfJ3i97nXT/4ogUgmjntcJyaWVHTqUxKDp2sKKlWTTDSPQxMx5kwLCdm?=
 =?us-ascii?Q?mL2KxXw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?148WwNDnV5/1LNqzEZHf8e5tHmpcQuVqodQk8+N//GTj1tP6OVvpqQhWL6Ma?=
 =?us-ascii?Q?5tX8eG6GaP6AERIcv8tXg3nqSyedIXfaeY8yMSlqeReRtMTabkgnkmUiFcAj?=
 =?us-ascii?Q?RkWvR7lKkfevSMitACscG7+5Nlr/ouijWaqPMvw4CFIS+HbcQebw6Eqfy4xl?=
 =?us-ascii?Q?I9/A2X2xWSnB1To4bQ2bgh1KnTB+w2b5cn10JbacXBMdbLA6kTgtGHdergNi?=
 =?us-ascii?Q?Q57fgiUUx41jfiXL+5PFXyc8RhggqOVmIli6p9Zmr2AMfDNTdwEjZwH15RSL?=
 =?us-ascii?Q?dmmGYpqESlCxcp/TW8sO0NCU5He02C69AMsFrLWz0KNCwQbCaC24K4C5cmvZ?=
 =?us-ascii?Q?jt0AoTvvlztajst4KOEiujIXZJvNl/rNoIFeyXP6N9BbKv8ftgEeIGUH1Gr7?=
 =?us-ascii?Q?2TaF7H88Lo/D002Zw9EQ0EnzaLejTy24Q7Rb9dExFtpjhBVXpjjydgP/7k14?=
 =?us-ascii?Q?AIalSdxVKIDRlffFcMBJvfTu+m8Rk7IUP/Ll5QgmCusxyB2R+McR5dPBeo3E?=
 =?us-ascii?Q?QOEhnjg0RjNqetLkEMhsLPkzg7lyGjmXZejJQyIICeRCnMEwEtNssbbuiZou?=
 =?us-ascii?Q?AF5AruIy+TQM0/2rx8oLwFyKoewbTZbniP44x6erkGk1yamPD7bzvBKSWJ0F?=
 =?us-ascii?Q?lsNbaeIY8rALDkkCrPiReh4ScsNv2IlnCX7ErVY92CYbN1B1m3/UvxE6hRTo?=
 =?us-ascii?Q?q3PaBrdTiYxHYZ2NralXVLt+1O2G8+i1nPeKupxSSrIbS4xbZr1NBuMd2jOT?=
 =?us-ascii?Q?flYXmJJolFMVq3sw5VP51rC6DFC04FO1+i8fyFP/s8j5vz8o5DRTgozg85rV?=
 =?us-ascii?Q?wYDzva42J7dPPyhhytSxz6dl1c63vkt2kFwLtygwIuGllTjQ3gUkHlx7KHdw?=
 =?us-ascii?Q?9eVMSq9b8HWD+8ZtzPkSpSPUHOzpeZKL94WuJgPOTDl/dk+6jKFYVS8ZDKac?=
 =?us-ascii?Q?zF9kNknlmRDVaTW5EjE/WVOObnl8a9cvtLpnVWmKU5/xYFf1qXRam0sJ3nxn?=
 =?us-ascii?Q?8sZk7iq2z5AAllaDJySheZeyZHi9zRhSYgeXka76ZU6iFKeVTkulTxQ8TsZn?=
 =?us-ascii?Q?/5q6jwTyQZZOm4xzgZKx4kdUBT+hqCqkJrVCwQ9HW4gRYh7JPbthF0WNVzF7?=
 =?us-ascii?Q?kwhBSvpsM+bRMp7qTKjyV7Ds+mZMSnN7Ud38VK5Zvn8N78a8vIhjLsKTQr+w?=
 =?us-ascii?Q?luRE+WfMNj2mm6xMpwn1mj8iQCzza8MY4uMk0T6xWNFFr6MaZEzb/COoLgfz?=
 =?us-ascii?Q?MSlX57O1YC9oworTOYREAm696k6Kv+dG/lcufXvNBONHC9ctipR7/xjN/q1B?=
 =?us-ascii?Q?tBx7yqFzw6WlTqOLeCqQcQI5VmUW19hyP5q/VXnIzQa8zZxUumCy7LVz12pl?=
 =?us-ascii?Q?kHKmPdDbm8tL7ccmFJ1d5RZnFbJzlL0bT7zj/veAtvhGiQE0Lr3BfiX4AQiE?=
 =?us-ascii?Q?sPmsmikHEZEMr5x7cagkKp0nqLLPwRddromlyRrr/mz751IDv+c5SHj5V5bR?=
 =?us-ascii?Q?y0tfTUIUr6L9s8krmvjJ4AJ6hCFTnJpfiofGskUY4+2eg/krsZmZSFlD2M4/?=
 =?us-ascii?Q?xoEySkAESvZtheX/v++P2uXxVAzTmh/ZoXFOQIB5olkfg9I8lcJ4RObUaEiH?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	38Py2XmQlRCdM67kSfWlc+0mPk7OpH0xyxwSgKV2R0qimaHr51jcxzOEG3MR+GDwFnA2juytYTyUDn3zP2Af/7RPxADnlB4x5ru141BMpfZG4L2A6XhhXIYoUDXCuU06nNXUxdSIGqfSyOA7vqthWgryY9R52j59JZjkGiU+32Ul5BrApOY+UYAZMCcRuewrEi4RjIhbYr6JxhbI4jq6magKgvEcTK7XnE1s1Ix6fFj2BlP++dXrbQbQ5M7dtwTGA/+dI76xH5+2xNyvvH8wkWbeZjQsg2UOe+G+S5kzntOOtnzaOIWR4Yr6IAzlKK4eQHIWFtWQDA/66m3/vMLTp7E0ZIj5nrtr3ZzWC4Ikb4MvwxDHl2UJ2woUueS3aLpXdAm3bB+IWKNByPsaEGvNqf8vZ7sHmtZb+Xzdu5TAutMBeVtDMtyuqbwqLNUqOCGQUnRYi6LKofHFxGYGvpmlaGMf3caDPliRS7ooZHXPZgvLmn6Y/ZoQeKxYUdzNRiA4/laO2dvk2Yr2m0d7U+nBrPISuAaJPlNZMkw5w3+bFQLUksPf2OuNFT1SQxcwE01US5FG1BEse6eGihRYLsahpkf1wM1Nj1UnDUxy3vXaSoQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7819ca9-2d85-43fd-f7d0-08dcd4e7330f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 18:01:04.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwqpWGiJDhL8tGGmYdUBrKIdWTgUCblic3MmXD47srSFVutQilSx/9ULfMgcIj6lwQWsfO7LV4qVj3RJv0Su+wmQ+6vdpu1Q2maHTnO/A3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4733
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409140126
X-Proofpoint-ORIG-GUID: pW97C-FdzKfGdp-P4STpXuhk6hDEjejs
X-Proofpoint-GUID: pW97C-FdzKfGdp-P4STpXuhk6hDEjejs

On Thu, Aug 29, 2024 at 01:22:13AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Ever since speculations were reimplemented, these tests simply were
> not testing what they claimed to test.  Among other things:
> 
> 1)  There is a simple dependence on bufsize that is independent of
> speculations.  So speculations have no special role in bufsize tests.
> 
> 2)  The messages in the print statements were not taxing bufsize.
> (A single default string would be enough to exhaust 60 bytes, but
> the producer wasn't passing the consumer these strings at all.
> The bufsize is being set by the implicit ERROR probe.)
> 
> 3)  The various size ranges described in the comments do not exist
> and were not being tested anyhow.
> 
> So remove these tests, and just rely on the other bufsize tests.
> 
> To be fair, there seemed to have been no other "negative bufsize"
> test, but add a more straightforward such test and add it to where
> the other bufsize tests are.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/options/err.bufsize-negative.d  | 24 +++++++
>  test/unittest/options/err.bufsize-negative.r  |  2 +
>  .../speculation/err.BufSizeVariations1.d      | 67 -------------------
>  .../speculation/err.BufSizeVariations2.d      | 67 -------------------
>  .../speculation/err.NegativeBufSize.d         | 67 -------------------
>  .../speculation/err.NegativeBufSize.r         |  2 -
>  6 files changed, 26 insertions(+), 203 deletions(-)
>  create mode 100644 test/unittest/options/err.bufsize-negative.d
>  create mode 100644 test/unittest/options/err.bufsize-negative.r
>  delete mode 100644 test/unittest/speculation/err.BufSizeVariations1.d
>  delete mode 100644 test/unittest/speculation/err.BufSizeVariations2.d
>  delete mode 100644 test/unittest/speculation/err.NegativeBufSize.d
>  delete mode 100644 test/unittest/speculation/err.NegativeBufSize.r
> 
> diff --git a/test/unittest/options/err.bufsize-negative.d b/test/unittest/options/err.bufsize-negative.d
> new file mode 100644
> index 00000000..ac194dc8
> --- /dev/null
> +++ b/test/unittest/options/err.bufsize-negative.d
> @@ -0,0 +1,24 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The -xbufsize option sets the trace buffer size.
> + *
> + * SECTION: Options and Tunables/Consumer Options
> + */
> +
> +/* @@runtest-opts: -xbufsize=-1 */
> +
> +BEGIN
> +{
> +	exit(0);
> +}
> +
> +ERROR
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/options/err.bufsize-negative.r b/test/unittest/options/err.bufsize-negative.r
> new file mode 100644
> index 00000000..ea3089e9
> --- /dev/null
> +++ b/test/unittest/options/err.bufsize-negative.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to set -x bufsize: Invalid value for specified option
> diff --git a/test/unittest/speculation/err.BufSizeVariations1.d b/test/unittest/speculation/err.BufSizeVariations1.d
> deleted file mode 100644
> index c6e29b78..00000000
> --- a/test/unittest/speculation/err.BufSizeVariations1.d
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION:
> - * Verify the behavior of variations in bufsize.
> - *
> - * SECTION: Speculative Tracing/Options and Tuning;
> - *	Options and Tunables/bufsize
> - *
> - * NOTES: This test behaves differently depending on the values
> - * assigned to bufsize.
> - * 1. 0 > bufsize.
> - * 2. 0 == bufsize.
> - * 3. 0 < bufsize <= 7
> - * 4. 8 <= bufsize <= 31
> - * 5. 32 <= bufsize <= 47
> - * 6. 48 <= bufsize <= 71
> - * 7. 72 <= bufsize
> - */
> -
> -#pragma D option quiet
> -#pragma D option bufsize=41
> -
> -BEGIN
> -{
> -	self->speculateFlag = 0;
> -	self->commitFlag = 0;
> -	self->spec = speculation();
> -	printf("Speculative buffer ID: %d\n", self->spec);
> -}
> -
> -BEGIN
> -{
> -	speculate(self->spec);
> -	printf("Lots of data\n");
> -	printf("Has to be crammed into this buffer\n");
> -	printf("Until it overflows\n");
> -	printf("And causes flops\n");
> -	self->speculateFlag++;
> -
> -}
> -
> -BEGIN
> -/1 <= self->speculateFlag/
> -{
> -	commit(self->spec);
> -	self->commitFlag++;
> -}
> -
> -BEGIN
> -/1 <= self->commitFlag/
> -{
> -	printf("Statement was executed\n");
> -	exit(0);
> -}
> -
> -BEGIN
> -/1 > self->commitFlag/
> -{
> -	printf("Statement wasn't executed\n");
> -	exit(1);
> -}
> diff --git a/test/unittest/speculation/err.BufSizeVariations2.d b/test/unittest/speculation/err.BufSizeVariations2.d
> deleted file mode 100644
> index 8094cd0b..00000000
> --- a/test/unittest/speculation/err.BufSizeVariations2.d
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION:
> - * Verify the behavior of variations in bufsize.
> - *
> - * SECTION: Speculative Tracing/Options and Tuning;
> - *	    Options and Tunables/bufsize
> - *
> - * NOTES: This test behaves differently depending on the values
> - * assigned to bufsize.
> - * 1. 0 > bufsize.
> - * 2. 0 == bufsize.
> - * 3. 0 < bufsize <= 7
> - * 4. 8 <= bufsize <= 31
> - * 5. 32 <= bufsize <= 47
> - * 6. 48 <= bufsize <= 71
> - * 7. 72 <= bufsize
> - */
> -
> -#pragma D option quiet
> -#pragma D option bufsize=4
> -
> -BEGIN
> -{
> -	self->speculateFlag = 0;
> -	self->commitFlag = 0;
> -	self->spec = speculation();
> -	printf("Speculative buffer ID: %d\n", self->spec);
> -}
> -
> -BEGIN
> -{
> -	speculate(self->spec);
> -	printf("Lots of data\n");
> -	printf("Has to be crammed into this buffer\n");
> -	printf("Until it overflows\n");
> -	printf("And causes flops\n");
> -	self->speculateFlag++;
> -
> -}
> -
> -BEGIN
> -/1 <= self->speculateFlag/
> -{
> -	commit(self->spec);
> -	self->commitFlag++;
> -}
> -
> -BEGIN
> -/1 <= self->commitFlag/
> -{
> -	printf("Statement was executed\n");
> -	exit(0);
> -}
> -
> -BEGIN
> -/1 > self->commitFlag/
> -{
> -	printf("Statement wasn't executed\n");
> -	exit(1);
> -}
> diff --git a/test/unittest/speculation/err.NegativeBufSize.d b/test/unittest/speculation/err.NegativeBufSize.d
> deleted file mode 100644
> index a0154ccb..00000000
> --- a/test/unittest/speculation/err.NegativeBufSize.d
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -/*
> - * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> - * Licensed under the Universal Permissive License v 1.0 as shown at
> - * http://oss.oracle.com/licenses/upl.
> - */
> -
> -/*
> - * ASSERTION:
> - * Verify the behavior of variations in bufsize.
> - *
> - * SECTION: Speculative Tracing/Options and Tuning;
> - *	Options and Tunables/bufsize
> - *
> - * NOTES: This test behaves differently depending on the values
> - * assigned to bufsize.
> - * 1. 0 > bufsize.
> - * 2. 0 == bufsize.
> - * 3. 0 < bufsize <= 7
> - * 4. 8 <= bufsize <= 31
> - * 5. 32 <= bufsize <= 47
> - * 6. 48 <= bufsize <= 71
> - * 7. 72 <= bufsize
> - */
> -
> -#pragma D option quiet
> -#pragma D option bufsize=-72
> -
> -BEGIN
> -{
> -	self->speculateFlag = 0;
> -	self->commitFlag = 0;
> -	self->spec = speculation();
> -	printf("Speculative buffer ID: %d\n", self->spec);
> -}
> -
> -BEGIN
> -{
> -	speculate(self->spec);
> -	printf("Lots of data\n");
> -	printf("Has to be crammed into this buffer\n");
> -	printf("Until it overflows\n");
> -	printf("And causes flops\n");
> -	self->speculateFlag++;
> -
> -}
> -
> -BEGIN
> -/1 <= self->speculateFlag/
> -{
> -	commit(self->spec);
> -	self->commitFlag++;
> -}
> -
> -BEGIN
> -/1 <= self->commitFlag/
> -{
> -	printf("Statement was executed\n");
> -	exit(0);
> -}
> -
> -BEGIN
> -/1 > self->commitFlag/
> -{
> -	printf("Statement wasn't executed\n");
> -	exit(1);
> -}
> diff --git a/test/unittest/speculation/err.NegativeBufSize.r b/test/unittest/speculation/err.NegativeBufSize.r
> deleted file mode 100644
> index 9d7be6c0..00000000
> --- a/test/unittest/speculation/err.NegativeBufSize.r
> +++ /dev/null
> @@ -1,2 +0,0 @@
> --- @@stderr --
> -dtrace: failed to compile script test/unittest/speculation/err.NegativeBufSize.d: line 27: failed to set option 'bufsize' to '-72': Invalid value for specified option
> -- 
> 2.43.5
> 
