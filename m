Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC10D8C1F
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726338581; cv=fail; b=a1+7R4sPrY2UJ7IWdjaPt3zP4sFP7LiS9mydegZ+m9c1DXBCY5tsqlPm86BYgMbHheRrGo2k6+6xYyHFEJWVFwV5W7OWI/I+aNvAuqj6TdhEtASTYReapBGDjb9s9LM7io5KCa4yBNP4GVQ0qcM/vwrNy1CFPsum+1gGfB7qozI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726338581; c=relaxed/simple;
	bh=AvkdDI9roXqbAifww6nk2yFBGirz84SAyqzkYCVT0NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VNy/zcbBaCi7/jeNjbXr+YHNzqzPjGZyQNtWFJW48mGHhxb11RvyDH+jE5pOauksz34Wfpek3nYPTKtxivaJL7+eLme5/UbWf5QOvY9LWXPNNBkYge/NB0zZxK+OBZcy/CfP312GPOtScV4W43V9kAzKp+3I1mI/+u3dbS4xWOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ClSB3RZ1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tK6yLOCD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ClSB3RZ1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tK6yLOCD"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EAC3Hu002494
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=qhETQ5LC+0kszT7
	2+UT5wGVBoYzz1a1EZXZ9w5UHXVI=; b=ClSB3RZ1WJpBoLsbxEj705QcQgXch8R
	CYQhP9NnrEoqtpPvVCcnoCBjtsVjNsJ4d9NGa5riMsE0HcLdiQD4Hsw4XjG7Ustn
	zVk/s8/VRh8+3xRR7kKKqdT5cI8KePIExf4HrpYqMsNNC8EPNDIKNxhK7kduq58Y
	wEsvtaBGd1X3wbp3zyuKbYn3E4EUuIISAOzArLuXw10efFkSttbzsFavtaUJEAnn
	vD6herq8JaYFz1qYSOS6y7mNCuv5OV/D2sFiV7zaD4cs5kC14xokdWEZ2/rPIeWE
	cnht+LOdtJhmwLbyaOSPSXqsfC3N+XteRP9ITuaFbfLagE9ukk8lvLg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3scrp75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:29:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEXXA6012925
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:29:37 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6nvyk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:29:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiGw8IIpD9H7M8L1CLB5UeRy1gQsDoiJVP4P4LJPCY7Os+/AqpByznny02op3fITEZfRCgcsoSbUvCrXq3CIgFK1t5aXEqcqmKqnGY4QSCezwJRGDBcqPsqeeX85P9RmcpowMfHcS0ZeL/f0aaibzRyKl82CFRuIwdm742TA/K3MBVbhwSYqmJj0BHsXYhMdixAR0HjNAA7ZXDiew1zw2sxPSoiP+MJePY8CVI2mLg8WEOjY8ozEIozdLtdZQFdwGI4b7EA9bCh6Y5XIi4BcFSnZij/eNc2os/RO39tsHsUrIy3Xzd9BoD3U5TTu7+BJeZWJRzFZGKGAjt3xqMJDsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhETQ5LC+0kszT72+UT5wGVBoYzz1a1EZXZ9w5UHXVI=;
 b=ov6V+0+sJjFJ9Gr9ByeEPRoqbpQmvd2GjrM4GP7n5FgBSbbwsM98dhQeK0VTpFbe45V/49OiwHg8KwByo6TrGpUnhw/zgSpf11oKSIrTbwpzxNTl+d0T37VO3kNwC88Mhise8x1p36eQ+6MQZLDd9r8+Dt7DjD5k6iPBY2ix1igjNfPHeDS8UGdn3X1EyuMbMhejlglLlHkerVdIUd0qnWYC/I/1XU5XefoaQj88notskmIh6fnIovsYLeXyJq55y9efJSNUrJ1D0kJxzqNuUd31kOsqHnoq2/sJtSHBeU9HEpL9nZ+2kgJzqAAlXpBwMEusAucty19oSe6rdGYCJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhETQ5LC+0kszT72+UT5wGVBoYzz1a1EZXZ9w5UHXVI=;
 b=tK6yLOCD73Nmet2vsCynMQiE3nn2iCcl0AYr2eZE3X3c+3X6m+pnMS7S+IXRKDkACJOrF7MQaDMHMtmDPvy7zsbgJs3P3M1H4AhUlKHk/i3rgopHD2TMiUlo95J1jiDLelKMRiEi8GdCW+TRe0e6GVn97zFrRPPRZSOzVIPprrg=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH2PR10MB4392.namprd10.prod.outlook.com (2603:10b6:610:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 18:29:32 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 18:29:32 +0000
Date: Sat, 14 Sep 2024 14:29:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 20/22] test: Annotate some XFAILs
Message-ID: <ZuXWCAex2rOYfrOI@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-20-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-20-eugene.loh@oracle.com>
X-ClientProxiedBy: LO4P123CA0447.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::20) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH2PR10MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9cb4a7-cd7b-400c-f3f9-08dcd4eb2d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cLE3Zg0Y8IpxBtBg1Z19BRkyaxXCDjW0rlw+H4MFlwHboPNpEIF0KE+1htUB?=
 =?us-ascii?Q?UNAZAdpz6LkqupbcizSSvm6yH2eFKbFoE7fpXKz32y5XCGC/CZWDNDJpOgE6?=
 =?us-ascii?Q?mBrYvqETaSvYY9IpvsX7sJtBs4MMk30PHCfn8ekBGqLfgfIRMMKL9g2tw+xT?=
 =?us-ascii?Q?fhGgdtC5vn41QpfntjOIMy2C79wVJ95G5J7qMaxlg+WeNyrgSgMrTARTIypy?=
 =?us-ascii?Q?Xi4L37EnnTVvlhOh+OIUQokZKwvVssvXwFbmcrhhIw7cqaAMk8FeEfy/CVgg?=
 =?us-ascii?Q?o6FH8UiPGLVJ3iy3duvWD/TDll3Dp5rrSTFs1bXMwNcotU+MJV3Fhc2c2pl4?=
 =?us-ascii?Q?viGL6E8xXxfTC7f33DfkCiCMlbSaLALkl3Q3XU7mRgXz0rKWnLM3Lxvps+Nq?=
 =?us-ascii?Q?biiqrB6YVztXiN9EH2lDcjUuzJtPniMudfk8ul+57/Le2bg5Ls8ajsxtRFkL?=
 =?us-ascii?Q?As7K8k29Zw1xL2AkKObXTlEmkVIePlxEVcM9ppARpCkG+3el+5sIWoUFWTvw?=
 =?us-ascii?Q?bfHRjrLlF6tJkbf7e8iObeZdAiwDM3qm05jaUiLHdwcc4P3RWJvehdgFoJlL?=
 =?us-ascii?Q?uZq1AWjjIW6t4N2M7XzDSbboKhw7te2XnSr34yar9YLn5t3q1H2zBspHvsk4?=
 =?us-ascii?Q?FtHf6MBLFEvCIo95OpAOcdDJAf5KNUK7bnq/+AA3poAXVaybLw8eT1wMJVAh?=
 =?us-ascii?Q?BopmU4SO0+n9wS2tmNl6AQ1swb2OATFSq3utxQi1eesUDDaYW2Hnf1sNm7TX?=
 =?us-ascii?Q?V9PEy/q2Yt33ryZ7zk3ewLNNBFZvbs/rkr6kM80eaE1L2zc2jAIIWw0/H7eQ?=
 =?us-ascii?Q?w4+p8JvdY1wmg2ho3t3bAdd1bun/9pznO2sOl0vr26akNpvuxw5oRy3apywd?=
 =?us-ascii?Q?HvrlVAUhm4338P8Lr3W+YJoH1mlms0kf9ZgXh+TjylLes2ChjQG+NNJYrrcH?=
 =?us-ascii?Q?j8AY24c6lPLBogM3aosRedwbHd6X4HbyER/AEy42E8/3WL7r5AhOUbTOd2/O?=
 =?us-ascii?Q?yQmWMpmiWRnO6KlJIRVuIIYsK0QlX9xdR5TgrF7oaQMG+oG21HN0prpe7EZp?=
 =?us-ascii?Q?YlTAqeXj1ouFYw2bsuhyYj6+d/egbNEoUtjdtNrIOK87vuWY6F0DTGuGwm3/?=
 =?us-ascii?Q?svYPfWzck98fzga9N7RtsnnD6fhnyaFptUTcSBVjy41dFx/UBFyRzEnC+pqD?=
 =?us-ascii?Q?nx43DHsACmwCgsKNqQJxiDqx8Vv7yntVbfJwTleb9pdDZnb/UgI4yzYg3S+8?=
 =?us-ascii?Q?MBCzvoVXJ73w2+umWN5tMMrtsnYkUmD5yl93KwsHGj2l31tf5Pc8oJughgeg?=
 =?us-ascii?Q?NvmCRB0raM5//B/g4J2l+NesJ3WPqxeHa9Yw8rtlRBP3AQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oYC/6BxGwLgVzx1hez06FFh4IAjoWiRh3HaOSc8Ux9v8Fh8vLhKsRyPpbjAF?=
 =?us-ascii?Q?pWd2Zmwh3xUIH8XNwHwlRn6tOqdTuJjXeAn+movixMAYIoYGtVBY8jumexFt?=
 =?us-ascii?Q?7ixC+JdHHuwieUwcXrwB1Cbtb8vvrpG1Lk+rytRrhtrITuXOVvUtHkQWxy/H?=
 =?us-ascii?Q?6hVzv/MzQmcsXK3ymf1acYPsP6NnyzcnkZdJoAjNLUC6K1xqvzPKiPvsElhQ?=
 =?us-ascii?Q?CSRkNjXqhreNENuVZQGSlkF4uYNOA7F6jRpiI2sLVcEWGlGiB8pX2AEpzEzd?=
 =?us-ascii?Q?QqLd8zHEBVxFQUAVPRV052tP4N4shhttyr3IbvbQ9DiU0peS1f6xJpClUTJX?=
 =?us-ascii?Q?UUWQXFdhSeJW3mEol+CDpU5KWUt/6PSzJEJhVGowY15l6lRA+0PtV8v2a+vd?=
 =?us-ascii?Q?RAOcWr9oZbdjuj503QpLIowJ8MnhSanbFr37W+AlAStTEHODtWdT2PVc4zHH?=
 =?us-ascii?Q?nw2od+PfVGv4Yu2uy/P4KO9FkQNo5b+tvQdL0GRjrTrDuRy/fovLZVO+UaQF?=
 =?us-ascii?Q?C7XNixcZNZ5Br7dajTLsN9+IwHq6YA7YIuK6XFaBGKK4it3keEHAOuj7YfM3?=
 =?us-ascii?Q?eKdt7R8gqozkhlAzO1OyjLLCBGcToil0Ue8fwhpMMkEZq734MFqIFK2nYOA3?=
 =?us-ascii?Q?j3eePTgUk3J+5+K34eYjVlNwgcggm3muV/1ZoCUZ4WxUHmVQ0Unx2pSz93RZ?=
 =?us-ascii?Q?vuFhHH+JVa5BlpDTEX3FQYOiVf/j+H/haGt/j+MeaClq0vwUo5IwaM/Kxz89?=
 =?us-ascii?Q?EJ1t32rWUGGEVar4zAbW54n/zyYP3ILeFiDYehpckzSXPJDEZnDA8slyLYdk?=
 =?us-ascii?Q?0uyTxS/T/T2ol1S+3JyGiBpkT7ylJ9w/Eu+NoRl4aSD1UcEEu6u1mgbXvF+c?=
 =?us-ascii?Q?0ftq4IGmgPRCiFmX3c0fGJwMUUhl9jzD3yVStQ/YA93cGpYL+v7aWypBVUHK?=
 =?us-ascii?Q?YDGrScOMNG1fsg/psLcp3tkecpSHh3kfQAqEIyKSRKzHGdKIJbSWYukmEJZk?=
 =?us-ascii?Q?5AAnZj4+CWBPu5TINQM3APs/vbNpuW/wQTRZfTWU4lNY4aoY197O4ZI0cTyr?=
 =?us-ascii?Q?S2DyDKZaPfolRstJQsiq+GgNY9viTDQ9BKTaxMDCtqhT3abI2lz0hyqkCrgZ?=
 =?us-ascii?Q?XaL/UArEuUx8LVc9r7JPzf4+usPlgqOSbCHJvqqpUvyp7Ra8Y0J9rVuzOVYg?=
 =?us-ascii?Q?LkgsKMZJDyHhIlBpA+dnHOZiTpfWqbzRUf+TuyfSPtTRlTo9cRvAC541Wlk7?=
 =?us-ascii?Q?djZoQWviL4zIZZJKLchekbqNp4tDkonLpBugr98ycFzNDD3OEKbPtlbVkmQG?=
 =?us-ascii?Q?Zh3NKAdIEE+3FwK1mqPFagcxB1xXFe25waDOTHcL4pBaXWE48CzXinXx68At?=
 =?us-ascii?Q?+GjNwk9Pqea6UEIIQXwF3RQ30Y+pLqFYN1sBPy312yKc3kXEMI6yrH0d4cYD?=
 =?us-ascii?Q?4/di1pv0OGeoO+3nL9+I7EEqHHRCnkddAWpXSXSE+fvNZtGHtQC4/aDftw4Q?=
 =?us-ascii?Q?jkn8ms+tbBeUKmSDtFiycpNruoMXJ6qnv9LPGO543qoX6oobIjXYRnvIt9ZD?=
 =?us-ascii?Q?elSny56Cx29D4kLxdVfoGsmkA035m2/bnDKFtAtp2W5y5VN8QzaIp8xtpgzU?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BCdo/hJ06ukVGp/AO2F8sBokkC/unz1ByyPsMiKYTnzRojqBtDyMBUsUAANUqfny2juyC/hPNO1xVx15m7t2QD9vKhlNq86/WrbXCPXTut2gCjQ/a43Ciky3w6vBQ+eSpoilO03Jaaiev/BTdAdTDQfZJMK79dNakmSt9ul+pHdDK76KSSsRC0f9RHmuNOXCem0C2OHIbczl7GPzBD7vV1tz2jPgBRqefohUMs7pKSUUhkPGBTxIzC+SLr+2X1T70guTYwqIIaD1UqzKLskAJ+JZuZ+Sqcg7wP13QVHkE2zngLgW56NDRQe//4+uwp4lJPhoNM9GHg7hpUe7/y+UCayTH3saFVIKUxZ++U8322zQbOLf+qRBs/jZTzASbKB/8e4osbQeycCYNDj3N3ETmC2KWIl6IlR1oQrMJVK4AKqX7V3NR3xyi8Z8XzMGfadnUD/k+M3JaErFQ+1tRFKcVmFS6NOJhDsH1Gx2409sUAKn+irrn4IQFLlWqj3Z/DmsLs3x3p7pcyTbSASEw8gsbXZ8JW44tlNuNsMkHO4CYkRDle6wxspamUvs4sZ8hxnWb3NJefx93YohUqOgjMmA4jfJGKa8Dw3xwZUG86TiJgc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9cb4a7-cd7b-400c-f3f9-08dcd4eb2d6c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 18:29:32.6137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56ecDpkLH4lF9+2LrUShZ2cRWzdDCndz7fJWDRGEAoryZEtwoGb2LvB5i4o/40Vqf+AGFNlM7VXlR2odNIv2kleeoD+qHH+qHOXizTsDS5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4392
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140130
X-Proofpoint-ORIG-GUID: TYhwCMI4qnyhiL-bel0qbbFGqY-Yq4vr
X-Proofpoint-GUID: TYhwCMI4qnyhiL-bel0qbbFGqY-Yq4vr

Partial 
 Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

I am applying this for all tests
EXCEPT test/unittest/lquantize/tst.32bit-bug26268136.sh

That test is supposed to exercise a reported bug concerning overflow.  But
the test commit message is being updated to indicate that the test does pass
with BEGIN or proc:::start as trigger probe, but fails with proc:::exit.
That would mean that the test verifies correctly that the bug has been fixed.
But it also indicates that there is another (almost certainly unrelated) bug 
that causes bad code to be generated if the trigger probe is proc:::exit.

So, this test should be adjusted to use a trigger probe that works and a *NEW*
test should be added to exercise the problem that is being seen with the
proc:::exit probe.

There, I'm applying the patch changes to all tests except that one, and a new
patch should be submitteed for review to address the issue with the one test.

On Thu, Aug 29, 2024 at 01:22:17AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/assocs/tst.invalidref.d         |  2 +-
>  test/unittest/builtinvar/tst.ipl.d            |  2 +-
>  test/unittest/builtinvar/tst.ipl1.d           |  2 +-
>  test/unittest/builtinvar/tst.vtimestamp.d     |  2 +-
>  test/unittest/builtinvar/tst.vtimestamp2.d    |  2 +-
>  .../lquantize/tst.32bit-bug26268136.sh        | 29 ++++++++++++++++++-
>  .../printa/err.D_PRINTF_ARG_TYPE.jstack.d     |  2 +-
>  test/unittest/printa/tst.jstack.d             |  2 +-
>  .../tst.jstack_unprintable-bug26045010.sh     |  2 +-
>  test/unittest/variables/bvar/tst.ipl.d        |  2 +-
>  test/unittest/variables/bvar/tst.vtimestamp.d |  2 +-
>  11 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/test/unittest/assocs/tst.invalidref.d b/test/unittest/assocs/tst.invalidref.d
> index 0ed17959..34367c6b 100644
> --- a/test/unittest/assocs/tst.invalidref.d
> +++ b/test/unittest/assocs/tst.invalidref.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 no support for index of assoc array; last_cmds[1][3]=0 dumps BPF */
>  
>  /*
>   * Test to ensure that invalid stores to a global associative array
> diff --git a/test/unittest/builtinvar/tst.ipl.d b/test/unittest/builtinvar/tst.ipl.d
> index c2b9850f..41a89b00 100644
> --- a/test/unittest/builtinvar/tst.ipl.d
> +++ b/test/unittest/builtinvar/tst.ipl.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2: need ipl support */
>  
>  /*
>   * ASSERTION:
> diff --git a/test/unittest/builtinvar/tst.ipl1.d b/test/unittest/builtinvar/tst.ipl1.d
> index 1b489229..654b16ce 100644
> --- a/test/unittest/builtinvar/tst.ipl1.d
> +++ b/test/unittest/builtinvar/tst.ipl1.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2: need ipl support */
>  
>  /*
>   * ASSERTION:
> diff --git a/test/unittest/builtinvar/tst.vtimestamp.d b/test/unittest/builtinvar/tst.vtimestamp.d
> index c9e2a112..11ffae7b 100644
> --- a/test/unittest/builtinvar/tst.vtimestamp.d
> +++ b/test/unittest/builtinvar/tst.vtimestamp.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2: need vtimestamp support */
>  
>  /*
>   * ASSERTION:
> diff --git a/test/unittest/builtinvar/tst.vtimestamp2.d b/test/unittest/builtinvar/tst.vtimestamp2.d
> index 087a11e3..68a57ea8 100644
> --- a/test/unittest/builtinvar/tst.vtimestamp2.d
> +++ b/test/unittest/builtinvar/tst.vtimestamp2.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2: need vtimestamp support */
>  
>  /*
>   * ASSERTION:
> diff --git a/test/unittest/lquantize/tst.32bit-bug26268136.sh b/test/unittest/lquantize/tst.32bit-bug26268136.sh
> index d5f143f5..91f4b65c 100755
> --- a/test/unittest/lquantize/tst.32bit-bug26268136.sh
> +++ b/test/unittest/lquantize/tst.32bit-bug26268136.sh
> @@ -5,7 +5,34 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
> +# @@xfail: dtv2 since BPF verifier fails, see test source code
> +
> +# This test passes with BEGIN or even proc:::start but BPF verifier fails with proc:::exit.
> +#
> +# When the BPF verifier dives into
> +#     uint64_t *dt_get_agg(const dt_dctx_t *dctx, uint32_t id, const char *key, uint64_t ival, const char *dflt) {
> +#         uint64_t *genp;
> +#         uint64_t *valp;
> +#
> +#         /* get the gen value */
> +#         genp = bpf_map_lookup_elem(&agggen, &id);
> +#         if (genp == 0)
> +#             return dt_no_agg();
> +#
> +#         /* place the variable ID at the beginning of the key */
> +#         *(uint32_t *)key = id;
> +#
> +#         /* try to look up the key */
> +#         valp = bpf_map_lookup_elem(dctx->agg, key);
> +# it tries to look up the key.  For the first argument (dctx->agg, where DCTX_AGG==64),
> +# the BPF verifier shows
> +#     (79) r1 = *(u64 *)(r8 +64)      R1= invP(id=0)
> +# Since nothing is known about the first argument, the BPF verifier complains about
> +# bpf_map_lookup_elem():
> +#     R1 type=inv expected=map_ptr
> +# In contrast, with proc:::start, we get
> +#     (79) r1 = *(u64 *)(r8 +64)      R1= map_ptr(id=0,off=0,ks=12,vs=56,imm=0)
> +# and the BPF verifier is then happy with the bpf_map_lookup_elem() call.
>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> diff --git a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d
> index f04f9778..d2fccff7 100644
> --- a/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d
> +++ b/test/unittest/printa/err.D_PRINTF_ARG_TYPE.jstack.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 jstack not implemented */
>  BEGIN
>  {
>  	@[jstack()] = count();
> diff --git a/test/unittest/printa/tst.jstack.d b/test/unittest/printa/tst.jstack.d
> index 4ef1ed58..7a404a09 100644
> --- a/test/unittest/printa/tst.jstack.d
> +++ b/test/unittest/printa/tst.jstack.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 jstack not implemented */
>  
>  BEGIN
>  {
> diff --git a/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh b/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
> index c5fca2a5..e6d8b43c 100755
> --- a/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
> +++ b/test/unittest/ustack/tst.jstack_unprintable-bug26045010.sh
> @@ -5,7 +5,7 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
> +# @@xfail: dtv2 jstack not implemented
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
>  	exit 2
> diff --git a/test/unittest/variables/bvar/tst.ipl.d b/test/unittest/variables/bvar/tst.ipl.d
> index a61e3b5b..7e2a432f 100644
> --- a/test/unittest/variables/bvar/tst.ipl.d
> +++ b/test/unittest/variables/bvar/tst.ipl.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 need ipl support */
>  
>  /*
>   * ASSERTION: The 'ipl' variable can be accessed and is not -1.
> diff --git a/test/unittest/variables/bvar/tst.vtimestamp.d b/test/unittest/variables/bvar/tst.vtimestamp.d
> index dc985ad1..b72eb8a7 100644
> --- a/test/unittest/variables/bvar/tst.vtimestamp.d
> +++ b/test/unittest/variables/bvar/tst.vtimestamp.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 need vtimestamp support */
>  
>  /*
>   * ASSERTION: The 'vtimestamp' variable can be accessed and is not -1.
> -- 
> 2.43.5
> 
