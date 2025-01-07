Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3FC1A2399
	for <dtrace@lists.linux.dev>; Tue,  7 Jan 2025 22:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736289872; cv=fail; b=PKIshXUvDhjj0XfmY0ijl8ZZBhszxzaZi8hd8nw4wUxHtMmpo/E404X6z1dBVDOjB21z1IoHGJT2ByoFPwCOPwZ5kWmFhuwluagc/YQCACoNKOLsSQN4kJo52YtkEtaxSoksAzhLsDwlFpNMs10bSQO61l56wF0crBQGzK23DjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736289872; c=relaxed/simple;
	bh=0wj28nivRXkRMsI+wHOy+yXuO4/2R8X56llm9HRJRHE=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=QEe5ttoeryshLRDzTaR50K49Y+DWxDeL+O1Z+NqehWQioFukyCQMZG321whZ9koceqoXg/mn07BK/pplIxtZ2uQ4O167qIo3Y79ni5ypnAdz767q2z4MNzCoWpq352eIiIxPkxc6hnax07RLYqy82tAqbf5i5GjMcjTk5ixMgPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=epHl5O3C; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SUZ3X9G+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="epHl5O3C";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SUZ3X9G+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507MMh8r019587
	for <dtrace@lists.linux.dev>; Tue, 7 Jan 2025 22:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=4CXtXIA0gi8aF96pHuTcWbNxqd2+dgVBKk5c5NMNtxk=; b=
	epHl5O3CsZNWF9DIVEKmLQG5czNHNS+3iqzv1ZrrbWLygKOaZTIOC1LDHCjuvSYf
	lMU7JMouhd8J2xZeUsnk2oFQ0QmdHwmh0sxyea+TYIFzByfTDwamGFFKunWyZ7zr
	IJPvnxWQCjR8f7jiWZgSMGuzi4eZ+mTFOwNHCpXg7guwzfJ+/eq397gOM6JuC2K1
	nzau7y4WNg/Lc2LUQPStKKVzpueuKa4lFiYN5GrhzKQ3IuEKoQWVLZSQDjxS9lfc
	5yTkulkknhk2Jvd2X1/bwKJ2DaqxOhoQ6j602RPWHWrPfYsHETawJ1Qvba2+8OBY
	yzyzlnmbPakLwtSBBies9A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2duk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Jan 2025 22:44:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 507KJA5w010941
	for <dtrace@lists.linux.dev>; Tue, 7 Jan 2025 22:44:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xue8vkey-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Jan 2025 22:44:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFR2gWtHI0SFNgcJAw21lqysx7rGPJE0BIoYhKXbSga/zMM1ukiM5OicLXBPwfQm3cM6dqiu39knJReFd5RtqNsygk56FbQvDPG5dfGYnOQgj9n/AiP6dnC1Q5eqj8+srJxQNSbtDl3Cu1pjHTRC6KZziICaakSMAXhqc3rAj6HUvc39je2D7MoETJK7iTZzXwH/sD0q6iyWqFBqNrMxlk4KpZ8dfVKA14pI5AYoKYn3x7kO2mDvHEh41dYV0d1YI7sYYoft2d9gebooEun6bdlopKV5JGm1JqbbEDPaUJgDNivgj8l2h1Q6QRJ5F6rJOcUbd/OT8L42+TCT2f7o1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CXtXIA0gi8aF96pHuTcWbNxqd2+dgVBKk5c5NMNtxk=;
 b=kudPHsM88PRLpZuFwqXwMrZTR6V8/Av/7R2Ag4tCDhFBbQ1l1QV5LfgsxGd+LC0X47UMYhrGm1EvRpT9ITEV/HBCpfOR9jF7GfizkXY0QaGA2ZBdhWx54HwDrgfQkupwL3tZ42ukecDrcQXvFr5//ANyFoN/1B9ymdJ8MpQfObHSBbfWVKm3XuMLi6Z4cgQ/y6Pvz6B2oDfumSHqjjBV5AXB3wCO9SFhpENe6Ds6KXhQVLKRlaDpYsDVVkvzupfaDUJKF5aoHcUga06adMRmwHsKxUOvRveWrnC1LKeSHZ0c7nYnyu4cD9roVKDB2kKRs19Ydfox7j+mU/2jGK5xbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CXtXIA0gi8aF96pHuTcWbNxqd2+dgVBKk5c5NMNtxk=;
 b=SUZ3X9G+H25F0VdM3HnsKKDVYAlj2nyLGppCCsQV6f/ZS0xV+AGs/WqpQVXJ/vNmBZ/3iES5Rc3cvPmaM+JgURN0tQ1P1aOULe9x184Kc/mMskD2tzYg4rWmrR0FbHAOSkJ6bC+KFFHLJCQy/uTjIeXhRNq+YxtXi4ggEqn0o4o=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS0PR10MB6078.namprd10.prod.outlook.com (2603:10b6:8:ca::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.17; Tue, 7 Jan 2025 22:44:26 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 22:44:25 +0000
Date: Tue, 7 Jan 2025 17:44:23 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: DTrace mailing lists <dtrace@lists.linux.dev>, dtrace-devel@oss.oracle.com
Subject: [PATCH] io: adjust io provider for NFS tracepoint variants
Message-ID: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BYAPR11CA0051.namprd11.prod.outlook.com
 (2603:10b6:a03:80::28) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS0PR10MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0af0c4-734f-4431-5e36-08dd2f6cd672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qSYgTUBt/QvekowEKTuE7wh13FZhwNJZYgAuCWxHQwgY0WnRSl2agZt4H+eg?=
 =?us-ascii?Q?jEz4EmFIdaDg7eVkSMXmuTLOFunPDgF1kUiv0NgA9g+4csEVQ/gZKA/wIuwn?=
 =?us-ascii?Q?ha87I4DR5iXRcqno3RQP0H+UonedjUecjz7r7/7AptcjjPYRiI+qgBuXdmBH?=
 =?us-ascii?Q?bfxXxjnGt/V1jJwcY+2wzSzt1o4bf+mQ0VbCML/jwgRIQT2qC7LdG4Je1KxG?=
 =?us-ascii?Q?JSRlY+/u+F0/AQYcs1MKPjCIiaz6Py5bjzk6Kqy470PucfFlTpBl71HfCl38?=
 =?us-ascii?Q?OWJUU66GVwDR4qGof9ijmwPsIsc2wv6DsTAak6ZcgGrrHv84iWiM5NlhHQbk?=
 =?us-ascii?Q?XdUfMYailbtzI/o5gwe81yKAf+BiVRv7IGrwWSHDVWqt6z6FhzdfAThY+plW?=
 =?us-ascii?Q?igAU/ylG8DY4RwEyyKYhpVc9eyUy2f0HohTQGdilCoYTPG+jfgNlmPslXUcY?=
 =?us-ascii?Q?9/nWPQPBGryEIL4av4+FVKrGnm6+ogTwPzuaEBHySy+u49hmz0SorO5GgFTt?=
 =?us-ascii?Q?igiTy6mwpEIgk1/bjSp+9Gzf6Y2DIRbUY9fmSTUiGvEe3mHw0VUzGh59BT/h?=
 =?us-ascii?Q?RpPn+DFmvq0WkZ9+8hyTEfc+HoGPxxwLlhuCkzhE+AfyCKvtrPyq0UQQQWZr?=
 =?us-ascii?Q?pPdB9OcwMsUtlwlGL3QSMthj08D1AZVLn6/j9skmIPoZLlodI6dZrAnID3u/?=
 =?us-ascii?Q?U62maxpwtN4sGSRPNlYSxTJWfbO5azqSyPgEha1LbFYmSA+aBa0AmZtRH4Nf?=
 =?us-ascii?Q?KP+TRiIUbwlH1Dbi2A+nvL0i0W6QsnFkeKgSFrHwdUtzfszYl1Z+MLRb+1MV?=
 =?us-ascii?Q?N/jEo9vaGqUbJkHDwnk2tlPgamHo2pDmjUCmUQ7kKweHp6vxVvgT4lB8cBBb?=
 =?us-ascii?Q?4HKdurZ/ioufhgWm610Iv4funVGOMAapU4lBsOyi5l803bDh2y4+xJLLPPSp?=
 =?us-ascii?Q?tec768yQ6FC6tBME6erjnoyxor7Ys67eNgHSh5Qr+bXj+gJgHn/olE2wvUh+?=
 =?us-ascii?Q?8ekyRXBGiZW6U0506U0fhWrfj69F3gbyWctGpyYpbdWqoa1b7+h+OjNdFGnN?=
 =?us-ascii?Q?cGlibKtwAOIY6mUdesKL30EDZoN4TeSmimza8IX5CIx3Jn/IDCLYZ0yv1RMB?=
 =?us-ascii?Q?1qnNy97OpckQAEkouBkVzfKwPnZsnzo01Qv5+pAdFmb5ho/p7JM4hHZXHQxn?=
 =?us-ascii?Q?7SbljbermmgXu1RdgDwlirheFyvtxhWc/nNyfS5/x9IHuaXkQ5x0pd5v8bYq?=
 =?us-ascii?Q?dKjxTzCqeiw9O5yrgXeaYy2FMXYCO/C16gzE05jsW4LBp6wRVcJbwHybk3ws?=
 =?us-ascii?Q?xCbgC2w/VMMZj4gqK8sioq6ay0CLJmLfWHBfZ+WTU75L9MJ+pmHrOGOlY8C9?=
 =?us-ascii?Q?sfJ1V/bDIB+e0c1T2gulsDY4ddik?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DONlS3cryGDBFiZyCP38OACwC6Z6/FetfYPim2we+zzXhylOSCl3hESdMH6x?=
 =?us-ascii?Q?tEZ6bHUl1OAIBCvhEEa9vCiJ/pkQZBRNi3JfGsm5Ly0hKKopuZpqV8ra3Ued?=
 =?us-ascii?Q?dCqGnwfLYg8V4KnAxWZRoyMZ+ymao4NrmgxbdYUCquCRPP89OvdvXi4Rc4oR?=
 =?us-ascii?Q?j6TXIvt5XYuoiCdM6l+yfUbO93oalv1sFO4QSktlga4aWfO+yNGjew56fTqx?=
 =?us-ascii?Q?IXyKmeYp7O66fqUYa4XuFFmwrOkCbHRMGylcrWXBhm7HyqfkC+HmWGGzvEUf?=
 =?us-ascii?Q?ow9g50ZnYdJMbXMAIeravQumIgmzro8RAbF7iqcjV8hFuBUW2HduHqfyx0mH?=
 =?us-ascii?Q?lV6d++8807Fu0NjPClmluoNEqrWBEOkz4SVLLA+uurp5H9zbgbNXeKNtKqQk?=
 =?us-ascii?Q?HtHOHzra9cWQpL9PqmsUSa6VRIQgiIARMp+985FE8bFySc1jsaoaQMlr3Cqq?=
 =?us-ascii?Q?0v1nh4Najh/0bc+1+owkLPNTt7+czdW8wQe53sLQIwr+xp6FBudyOjB9BWVL?=
 =?us-ascii?Q?4iRwxAh3BRHrMbzxe21HXFTgHFwR6kfkUog/lpcVZvacUIuQiFUlqqJGye3G?=
 =?us-ascii?Q?jRvObv0+qoJIhSx2yEgplBYc/0aBdosfdKKsQApKGW7cln3i6/BvT8KYXziM?=
 =?us-ascii?Q?h8wy2t/iHbWYnsAC+26HTYvw8jBK4+Rag+i/8EwTAO2HUCKxsRTamjGxKQJk?=
 =?us-ascii?Q?Jjpm8ll2xeZEsj4c99wY1iq6e2y18vLiq+CeogLZMNRgOs/DlL7Z0YeAzel5?=
 =?us-ascii?Q?D+MqO+cpXPFLrhaYL39AezEeuPteN78sxGirf/p9FiVRARdXUUvMw+wYLtAT?=
 =?us-ascii?Q?poTMJamX500kFFdFSF+G16nSEVcUexQ404Lhz9z3TBclWtYD2XgPf+kx3CGx?=
 =?us-ascii?Q?hLOMAyYSk+27qHwWnCflZINA7fHVhpkLTkA1IqQeuKilPxZZvCjN7isPOftH?=
 =?us-ascii?Q?IqX6r9iMlt0ywik60QJpag7GBuq7K1ZpFntoBCMFkeSy0itgIoBRYOnNKEr3?=
 =?us-ascii?Q?TeXkFgU6X2jMBe3M2DlCer2njOqD88z4l1TPNdrM+kiedxCsxqfXDj5MiAVR?=
 =?us-ascii?Q?Hb1S9xSnjN2jmdqC3nH5XVY08fYJTJaFuBTP8V8MxU4fup0dCKyeij8LJ7Ql?=
 =?us-ascii?Q?6H8sQDddWK2zZlV4zqSNQFIFK6HbxBP3lJRjF7B5LJIK2XroQX4/11Fu0fbQ?=
 =?us-ascii?Q?t8q55EeoS9aaMme0NXhHimESDWjrc9ut56uTieFkB1I0UPNKFZNRhuiXXQc1?=
 =?us-ascii?Q?vlsQyMgYKig36hhTJCzUa1KeoSmU5tFTXGwccUZP4AyG+xyuqr0yOikVT9vi?=
 =?us-ascii?Q?m2yaQoqx3bn3uw7q0vmJGNWEWLMI0h5D0lPM+0/CSWNPKFniKUCjqIh7sxez?=
 =?us-ascii?Q?iNSzhWUWfNeL6S87HvHO4/SwX/MSl5iMqCmHNXEkaoen1BwMZPCuS/vl9Qxc?=
 =?us-ascii?Q?0+FuCJHV0wWGfFpKnMMau6Xy/p8ik/KFREVj7tVdmcKTjToVfaBac8sbj/4G?=
 =?us-ascii?Q?HuS62EjAWlgovGNfFOXqCIc9kHZG/PqCUvtxtjKpm+G+ozV//1ImBK05Pfm6?=
 =?us-ascii?Q?jrP45lECLhJf6lSCT2Ex8QIGEjS4JooYMi7xK3k1xenKoA8zwuzlvxMLJS5J?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6zDVcZo+/XSjFwm0/i0/GWNmwDGpodIpId3apytgb8pxVxmbibj2CE3AoaW9Yhqfs9Yk31/joNC4A+ko9x68sdgzsKQP9B6A7419iQgOQPBMU7/ynEQR1KHrYz/dVw87lDFwydodI/dZC+Vs+83H/jcKYSuZPCXLZxzTsCTtRfm7V8whJTGiIh2IqyNBFEpqVE/uiAPFgtiq1buJg+P+FyJQD5HvLutjln+oONSZIQVp/Z5QQMbCtNDqpWjOMYqICk8jTy93IPkMTts/uKv14Nh0dFITC3CX3rRRbc/lFdSFAiksyAevlKM6/eYgwBoZj7B9SR28GUlKHc0eUXrfqhaGsKmK/ptkLVsmvch1jjA2bx5tWXZykqA0dYiLTWXVPmPLrpBisaA2MOOc+yxY3oh51zclJ4cJG2Iz18nKnkP/N6ffZ6nOkmlR6MI5ExfSlwSFbRoQTW+4T6y1onNulK6cHLMubPRf8L2/FHL7X5LEg55JpYbf6TM+7xJ8ttkaFgnTmtY0s0Df1PS1PGukj7S8Tz7W4tVNLbWesnQkxxPG5pnrIuQrHYWxM7/1wbTkPenrvX/3khNqz52XXqdY3bIW96g4qXZlUHh7w3XTW00=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0af0c4-734f-4431-5e36-08dd2f6cd672
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 22:44:25.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Dk8rXCOj8pFxOWAtHhvv21fNdDLb2L67pgRiBH8eLNYZ2RcZowIj78xGwHQiCObmbs/rjyi56nN/BFw/ucqG2km51jh1l67HJaoootxtNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_06,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501070187
X-Proofpoint-ORIG-GUID: M0LGq6xeUv2Ss__KNKtvm_9Q0_7TdPgs
X-Proofpoint-GUID: M0LGq6xeUv2Ss__KNKtvm_9Q0_7TdPgs

Kernels prior to 5.6.0 pass 3 arguments (derived from the NFS hdr)
to the nfs_initiate_read raw tracepoint, whereas kernels as of 5.6.0
pass just the NFS hdr.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_io.c | 127 +++++++++++++++++++++++++++++++++++------
 1 file changed, 108 insertions(+), 19 deletions(-)

diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
index 385dc792..45cb875a 100644
--- a/libdtrace/dt_prov_io.c
+++ b/libdtrace/dt_prov_io.c
@@ -63,17 +63,9 @@ static probe_dep_t	probes[] = {
 	{ "start",
 	  DTRACE_PROBESPEC_NAME,	"rawtp:block::block_bio_queue" },
 	{ "start",
-	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_read",
-	  DT_VERSION_NUMBER(5, 6, 0), },
+	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_read" },
 	{ "start",
-	  DTRACE_PROBESPEC_NAME,	"fbt:nfs:nfs_initiate_read:entry",
-	  0, DT_VERSION_NUMBER(5, 5, 19) },
-	{ "start",
-	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_write",
-	  DT_VERSION_NUMBER(5, 6, 0), },
-	{ "start",
-	  DTRACE_PROBESPEC_NAME,	"fbt:nfs:nfs_initiate_write:entry",
-	  0, DT_VERSION_NUMBER(5, 5, 19) },
+	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_write" },
 	{ NULL, }
 };
 
@@ -155,12 +147,109 @@ static void deref_r3(dt_irlist_t *dlp, uint_t exitlbl, int addend, int width,
 	emit(dlp, BPF_LOAD(width, reg, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
 }
 
+/*
+ * For NFS events, we have to construct a fake struct bio, which we have to
+ * populate from the inode (arg0) and hdr->good_bytes (arg2) arguments the
+ * underlying probe provides.
+ */
+static void io_nfs_args_v1(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
+			   const char *prb, const char *uprb)
+{
+	int	off;
+	size_t	siz;
+
+	/*
+	 * Determine the various sizes and offsets we want.
+	 *
+	 *     // Access these fields relative to &bio.
+	 *     struct bio bio = {
+	 *         .bi_opf = ...,
+	 *         .bi_iter.bi_size = ...,      // struct bvec_iter bi_iter
+	 *         .bi_iter.bi_sector = ...,
+	 *         .bi_bdev = 0,		// -or- .bi_disk = 0
+	 *     };
+	 *
+	 *     // Access these fields relative to hdr.
+	 *     struct nfs_pgio_header *hdr;
+	 *     ... = hdr->res.count;            // struct nfs_pgio_res  res
+	 */
+
+	/*
+	 * Declare the -io-bio variable and store its address in %r6.
+	 */
+	dt_cg_tramp_decl_var(pcb, &v_bio);
+	dt_cg_tramp_get_var(pcb, "this->-io-bio", 1, BPF_REG_6);
+
+	/* Fill in bi_opf */
+	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, 0);
+	siz = bpf_ldst_size(siz, 1);
+	if (strstr(uprb, "read"))
+		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_READ));
+	else
+		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_WRITE));
+
+	/*
+	 * bio.bi_iter.bi_size = hdr->foo.count;
+	 *
+	 * For the 'start' probe, count is arg2
+	 * For the 'done' probe, count is hdr->res.count (hdr in arg1)
+	 */
+	if (strcmp(prb, "start") == 0) {
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
+	} else {
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, 0)
+		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, 0);
+		deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
+	}
+
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, 0);
+	siz = bpf_ldst_size(siz, 1);
+	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
+
+	/*
+	 * bio.bi_iter.bi_sector = inode;
+	 */
+	if (strcmp(prb, "start") == 0) {
+		/* inode is arg0 */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
+	} else {
+		/* use hdr->inode, hdr is arg1 */
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
+
+		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, 0);
+		deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
+	}
+
+	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, 0)
+	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, 0);
+	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
+
+	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
+	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, 0);
+	siz = bpf_ldst_size(siz, 1);
+	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
+
+	/*
+	 * bio.bi_bdev = 0;
+	 */
+	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, 1);
+	if (off == -1)
+		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, 0);
+	siz = bpf_ldst_size(siz, 1);
+	emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, 0));
+
+	/* Store a pointer to the fake bio in arg0. */
+	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
+}
+
 /*
  * For NFS events, we have to construct a fake struct bio, which we have to
  * populate from the nfs_pgio_header argument the underlying probe provides.
  */
-static void io_nfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
-			const char *prb, const char *uprb)
+static void io_nfs_args_v2(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
+			   const char *prb, const char *uprb)
 {
 	int	off;
 	size_t	siz;
@@ -411,6 +500,7 @@ static void io_xfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_probe_t	*prp = pcb->pcb_probe;
 	dt_probe_t	*uprp = pcb->pcb_parent_probe;
@@ -420,13 +510,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 * we need to synthesize one.
 	 */
 	if (strcmp(uprp->desc->mod, "nfs") == 0) {
-		/*
-		 * If the underlying probe is an FBT probe, we pass function
-		 * name.  Otherwise, pass probe name.
-		 */
-		io_nfs_args(pcb, dlp, exitlbl, prp->desc->prb,
-			    strcmp(uprp->desc->prb, "entry") == 0
-				? uprp->desc->fun : uprp->desc->prb);
+		if (dtp->dt_kernver < DT_VERSION_NUMBER(5, 6, 0))
+			io_nfs_args_v1(pcb, dlp, exitlbl, prp->desc->prb,
+				       uprp->desc->prb);
+		else
+			io_nfs_args_v2(pcb, dlp, exitlbl, prp->desc->prb,
+				       uprp->desc->prb);
 		goto done;
 	} else if (strcmp(uprp->desc->mod, "xfs") == 0) {
 		io_xfs_args(pcb, dlp, exitlbl);
-- 
2.45.2

