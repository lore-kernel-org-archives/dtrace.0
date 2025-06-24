Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7D6145346
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774505; cv=fail; b=pRpZ36pCIKd6YK4id9go+lMH7xzO2DTVe8b3VnF9xf5XNTUKYxgMlmTiJv9k3MzBgU1xZMRorot2FUNc7t1aZMdA5dz6KV26xifY2WHifdZFiqJCGtinzAjgfVaUeCowFvAzDWicPuF4nSR1vq+RL0LUlrgU7QF+HNOCcUGAxQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774505; c=relaxed/simple;
	bh=97EMyunMKtrCJyPjnz+FKbqIWxmS6ZV3sKZZxddr6Xo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=hz+t5dYK0gQ/BPHNBg3SjLJ89eLemh/Dx47c0EFqyj9OPwjBLOwWrcK52Ms9FlEex8fRKmBV0gwxREPhIdcIaLeUJzI30K/XHP96GCrPu65zg7yDd08RwqJ6FNOinILqUHyDJ6W3FiPxg5gHmRMiU+F/RxWxjHPkbA44WGfuWTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fcrIxAgm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HNlOO+4r; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fcrIxAgm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HNlOO+4r"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OCiI35006420
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=yhKsjfD4TKi6yQFmV9
	qB/G+x9zew/VSaY7vqpAlU/ZQ=; b=fcrIxAgmCv76w2we0ZRqXXP0ZFEfq3IidD
	vaYnFeFZeISJ9m+itZ/CGMqc3yPXYWoxtyja1l9Aq/YgrJDvCvzR1Zr3mk44J/HY
	g+0zEf7mHM9moDvUdKGxMQQZcA3rmO5hbmvxBGvtlmx8ZHDmO7byz/0bmkrQbJ8M
	2eD+WRCQ1Wy5r1stbh0Zw76axbL4u8lVjMmH8foEWUNLu7STFXasUt0qB3aXtJQ7
	1hbJYiT8N3JLrzB7SRXm5NApM9WQU7/ljvQ4eWqQPrKm5IVfO+5h2F+bJYCP1d+w
	MTePo8ppcXo6iJoqURU5/3vGezRJx0GzRGsZPyj4dh4wbN4dW9QQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y57wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:15:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OE3BaB024158
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:15:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkqq0qp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 14:15:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdUDhr/9XjbkvY31WRb1ZQ7DvOWs6KwE/Uq5frvsesJwa2D4souw8Ba96HdoQJq461Ug8je8lXmxmmdKnsiOPSs8b+2eYaE2x3+co8O3xU5KmcxfyTGy4N+nRbNSGKVPO18LJCMw5cUUwxcNo+CiMJH1gqnx2NuOlLJdN8hK3d2m0nroQsLzLWaEZ4MAqk5IJKAAx8YfmwIgp3nR4QcC+v/T+mGmGhzG4hzN/HfH43UQu99L3DCYtJdHLlQyGErde4aMlIMsKcS8JMC9vJgkZsWTnWcYP081/jIqHQ2to3xKbKMMVWzLRYHhA83Lja2v1i3SA6cZHffP0s7ar3gSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yhKsjfD4TKi6yQFmV9qB/G+x9zew/VSaY7vqpAlU/ZQ=;
 b=Tt/lOSG57aWJMNKTY4seoRe2iS+TfCq4OpaouRqrJZpncQqT/0AzQUfTJijXUjjpvpDyrhUpPg9RNzPHPeYBL7KjGJlXV7Cjp5hbfnxeiEdF2YbMDdnmBtsRJhvEAsyc691ZPS5ah4ZcG2pFtx5Uzn6luF8iyQfwABERHvD3piKU5MPQAJhRyPrF/7EAmGo4F3Y+vQ2no7yo2wDTPJwAfqSaUx94ex3eKwJLiHB8C9ojg3rTYd0WoWXf7cF9Bdne4sNyf6AnENG6Bd7Yp9b5vWcr3/VlRGt8UBaeV8NPGeCqdg6F8LVrsAaeYUZXyv50SHJ3zKChVYhg/mfeax424Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhKsjfD4TKi6yQFmV9qB/G+x9zew/VSaY7vqpAlU/ZQ=;
 b=HNlOO+4rNFvjWE0NtSW1EUJfaSMq/0d738xvAbAz7hISUfXfsh1lqSWqFdI447zX/7FjP/8QIQ5rI8YXdTTKaN7XGwic7ZRbCXekOW4PxrSWHivJt62HeuOXEQnb/I1vOt3cu29RHZnRuqK453SPDWcJPOTaHsM2Hgud7TKsvyk=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS7PR10MB5901.namprd10.prod.outlook.com (2603:10b6:8:87::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.29; Tue, 24 Jun 2025 14:15:00 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 14:15:00 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/3] options: add -xbtfpath option
References: <SJ0PR10MB56727ED82C9679D8556E1820C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: because one operating system isn't enough.
Date: Tue, 24 Jun 2025 15:14:56 +0100
In-Reply-To: <SJ0PR10MB56727ED82C9679D8556E1820C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees's message of "Mon, 23 Jun 2025 19:37:17 -0400")
Message-ID: <875xglql9b.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::29) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS7PR10MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 4825b397-78f7-4ae2-e980-08ddb32980fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sAevgUIoCfo6VdTiWiBYT45pLshdTcE5AnzEtvdPQx51Tclldwv9LVBwZmEX?=
 =?us-ascii?Q?I1v7ELXxKdSRiXxfNSrHYMa6ydrRhqB5Yu8BEniRfxcHyMynWMKZ2PW5bz4Q?=
 =?us-ascii?Q?pAvc95JfqdJ1yGhs4TEqgVryB8AUIym0SU7gDX+mWgqxwGWTkv5S/7bczIr0?=
 =?us-ascii?Q?1+l4oKwloBj0nDOW8YrJNz2hxox61/g9MAMAAKrm0oo6cvpymB6/y4X6Tz+k?=
 =?us-ascii?Q?2ksRkLK7cJRB75ZQNx/P2aCLXpO2R0hLOq9ALICM6ezR/hEhJIVaKI4my7FQ?=
 =?us-ascii?Q?jxab9BZDd63cqlhQWTqt57Ou+JXKYST+w/QyYR1n7AOoGGoebTEb574vwcmr?=
 =?us-ascii?Q?tp1hfOreoWqHlH0f1W6ozYaitePx2TwqPt9eMHSuzKhUHG/4n6MHy+ZHDtFO?=
 =?us-ascii?Q?97iN8H0uZyQBBS/BDs9Kso9SugrMG38fjzDckp/Ml8sqVukkluXjAAliug5j?=
 =?us-ascii?Q?fkKVyyNjg6kiW8Vo0sIDXULsyjB+OBU2WjsXYBfJ6z2qH7XWcDYu77MATMAm?=
 =?us-ascii?Q?KTK+mYHXDk7gT80/gb95ovSWT7B0w0yqGXsMES3degxDu1WHC92HwdUItI/R?=
 =?us-ascii?Q?MdIM+ADL76PLfLcFd7LkPB4ZsknEtrILER0+SHBUQEmlrpBcIYG88nuP/Zjg?=
 =?us-ascii?Q?0y22h83Bw2BiidXk0Amuw6oMPASKHT4QPyG6/5XzRwXYhiL0a05dkggB+PYG?=
 =?us-ascii?Q?0UZBivMzFNcKAbxoa5Z4lvshafQ33M7Gu+5Ztxj1fsG0CO7kFeUw2Rcc8+R+?=
 =?us-ascii?Q?a2qshn4qOJ5E/HiFuwMAgVfkD3cTgET70RMmIFXb9GGnvKpS4L99/mnrfEaY?=
 =?us-ascii?Q?ndyLEACoyL8ur5myrwwAnc3JtUv9JmyfhkyHJtCVdQejd7JO/Ooj/sHIOY0w?=
 =?us-ascii?Q?Czqeb12INrXs9xAf0pRfm4P6xtFpoN+NHbSkY6mhxoMYvs2LQiUMTRLyUmVe?=
 =?us-ascii?Q?70SIKydFI85lHs/0Xzr9YA40MWWqdaaVDNxBI9+3qC6wmf0HaP+0tLel/dNh?=
 =?us-ascii?Q?LI6NEQftp0CtKgA3Hu46UYPSJH/nb6Os37QfW99MLYHluRZ2IsU70GFN/CXy?=
 =?us-ascii?Q?3WUfgegU0ZPaohw4836YteIqR6RM6MVCnkRglXqLX9hvv99Pl5F+EIle0BmW?=
 =?us-ascii?Q?jkNX5DR1cXTl1utRC3lMFBKQiEZrNdlWg1vUUL1oWxVJATF9QFK2JSs9qzYf?=
 =?us-ascii?Q?O+nbZoJq+Qhc3m47kdfuoNjSZKNSGbSpOw0/MOir7kz2tKo0CpNDNXqD5gj5?=
 =?us-ascii?Q?rH7fUOmzNj3FPIwxZYm8Phm6/EjBzzhID2AaTe63QAfgt5TtIoGXnO3trsOI?=
 =?us-ascii?Q?BUk4BWPNzJywsxKWd0YOSLcDCn4eVxlbs9gt0Ds8zf6IQcQ4KjqHo6+VUBYS?=
 =?us-ascii?Q?QpmAT0L+jm1GT+6fU99g0Re4IPvxLXb4rzxTwmu5OIfdwGK1bYNoFee6jovM?=
 =?us-ascii?Q?kDIRYq9Rw74=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2SJeRtnnXB8iuMnOLnET3GX2P+rez/JAX/k15dRUiqJLT2zf60llsjSLHxa?=
 =?us-ascii?Q?W4tEltjIv+FCbJJt1gNEqeDIsixiY+cKllbnB+5dMc2StIDA0E9bCFEDBO1U?=
 =?us-ascii?Q?DEAYmZqCwY5tDUf2JzpTb+zXoLSZ/lvu72KrvyhW5MfautFWJ7uGpbG9QrEX?=
 =?us-ascii?Q?nSyAeR4SL09gW2xlM5g0evwffaYShAmCfxps8la6LM/YjQ3JetlmsCzTOmIA?=
 =?us-ascii?Q?bVamepHLSTcU/Qspc2Tp/SlPFDUEcyLIgxnlPR4ynWRty6v9QkmzrGkclDT4?=
 =?us-ascii?Q?sVzUHYd4JLLTxRv4QbrcuEezCVaABy0RSFFZhJfEoTd/cFllG0WCBvNCRsJk?=
 =?us-ascii?Q?3YmBCOUBbhszaPka2LKPAT1y2M5jWD/Dy0azUeYMb93zp9xbXeutmPlgVQFO?=
 =?us-ascii?Q?Gk+WLdu9MTe//6kfrlx6q+IHiauEI00+R+/9oSDu7pOhOP/XLMjOIdeSZ06b?=
 =?us-ascii?Q?+CMUbEZdiuMeTSO0N4g2MYhMKDySi+ZyHKC5XchnYLd6RMmWGcu5FsxUCgcw?=
 =?us-ascii?Q?GNJyc7q7GHSFVTk3Vkm6rXyIv4DstA5LfOi/GAo1EwQuRanYWkRy1wxTlazs?=
 =?us-ascii?Q?YIpBxv1CU2GUI9pXl1irVnPO6fOFaGXkgqcbdDCuX+Gece63uvBzW+1fGBp4?=
 =?us-ascii?Q?ezmlSCZ+N+CsNhGkRRt36Yp1V7jrKAIDpepwlYPGNKeTkAXEM0Sv92pRs1LG?=
 =?us-ascii?Q?gmYi00JILsfKKjf43eiriItLZD9k51XYZSEepASquYantaLveq71mIdtGUvR?=
 =?us-ascii?Q?oApminznnSoYU3zFyPaeC2Ol1B+KDA1cFj+QUYAQwYgmF+gVFhlwtVrZZpId?=
 =?us-ascii?Q?tmo/RA7TR6pMBwivfJ70zGClSNx+aIob7l7q5nx0PcvOaCl6t/g9wK6rmdPf?=
 =?us-ascii?Q?PEEVbfRvnrZfu6nB2vjgZWAj1RLzxgtejSTHbpI1YZfCCwlOI00pEJJok6qD?=
 =?us-ascii?Q?b4RB5c3n/DCLryXJk/uIBeHdLTAfG9lO1WZBJqyd9Po1eANXJrB7WyEZSHKL?=
 =?us-ascii?Q?eFoNtCLnY963/OEEu75v28WjCzreOouqADp0qZwUtd3pDMAi9Y7pEGXJc0tN?=
 =?us-ascii?Q?MsX3Bq8ki9boAdY9t5aPdV4ZJI6+cl6kMc+H8S6L7va3ECQxaAeEZnv1Vd2X?=
 =?us-ascii?Q?BRF6T2y4AEWmTh/rVuly3LN0m07ksBPp5wdGxxJeI8pNPq8FIE2Lic8Jvb+x?=
 =?us-ascii?Q?G3zj080qVUDdIGdgwgr0s3+pdy1Glo/OBEqRxr+EiFvvv2YHV43W62/jlinM?=
 =?us-ascii?Q?3HPdD1e7eaTzJ+/Cnfvk88XxN8Esr10WBRBJaV/2niFcRGv2u6w+qmywHSl4?=
 =?us-ascii?Q?BSlKoHGDU/TAE+wlCxwuSz+jAzu0htz4FaIjixtBQWO7WrKzuMdB/LUj+6NV?=
 =?us-ascii?Q?2rmjcdemPOKdWpl5f0M+pG51MdVh1KiCogVXsD9Usgw2F10FFJyhzjiUiFNn?=
 =?us-ascii?Q?JopYLvmpYsODJTlRz0SS1zeXRG7Nc2a7h02iYMP+fhihXaec8Mmq98DnOzGf?=
 =?us-ascii?Q?ANEafAQzBjvBp61LJ1tq93Ts6MnMLo2hJRSfvPK4/qnmWQ/noDZMymOjmjfl?=
 =?us-ascii?Q?pwLmAYBn1JTLjOX4OQqvNWW7/AnV58mGR3oxx10UlTtj3V/MZ0jqAJSf7mBF?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a4jooQ6thzZEN+fyyX58tzw/0dYgHdmBlA8L3L89HOVhnPR8t6RsyOiLp7FF9zppajwDMWlTA2k4eb1EwX8Swmp9RayAgE0p9Pr4Hln1UohUJsOT/GjPPxK+29/roDRx5PhTrUR/RBWlshHADduj5QutIRrloMdPLpRZcM0Zddjz+/3mBbUosb6xiZ+o3qt1sDregqnELe1JTlcfCmplMClshqjigkRUo8jFlKSJeDv85cCPS1HXIZ7MGpIXS8g2M+CxpefcK1JzCvDLNeMnX4lkK7FcBrZwg591mItBephu6tI+xkoyKyf00PmS//N+yXn19hTEmmpuClFkqVo4iadQRu39EWThhIPFtBDph2mENJ4ZjGHAiuVaLVEcnN95X55369o8qNleJPet5ZrsEVifpyB2IE3CUuCqUz6NToB/VcOSDsQ2hALSVRA7X0Sxd18x+t3mnl0/UErWvMGg8U4dqFPDprdxxsJ5JuVeCuedl3USSlhfjaL/HgzYD9motVfi1KWNbR5ve9OkXQ3kQVnz8yRXn4HzJLV94XVNynEZ06qw5kuieplnflDA1W0EKTagajaPRMMG2gfj7N3c9cYRDko76QK4Hssfsk22g/s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4825b397-78f7-4ae2-e980-08ddb32980fd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 14:14:59.9553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtXaOgGuNz1QBreo+TomeJtQZtUnNdO023RiGd6I1Hf2XS0GqFUDktDHn+fMgJ0ISBkDHRPF2b/X/zStHmsOjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5901
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240119
X-Proofpoint-ORIG-GUID: fL2BuXL8INh8QgjIomrIhBDP085U31DB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDExOSBTYWx0ZWRfXyi1u5nmDanOo hLHa1QrHXV97a8UNbBKvQOA2KWD9/TGE9H//dQJtfx3BGMl7+SiXVWX5hhn0Xd3urImggqTZ9l4 cBlo/hSw4veXh1vWyDJdM+0iHdz6X8dhwoMAEQrwF/2oFSerDrCZbf2GQXBcZbe2+Cek2mLjXPU
 O7JENlLGo4aozHkZS9BVJJAfTeM6vXa+BFLTBCdJgHktDozPQd3ckCv3Py1ukiWdJ1nDhrfc7QV xcxIfeq+EEtmQb//+ecTFcfM3lFghMMTR0BDF43eqLl1D0ddXkQpTeeQBZ6jFXGW/gwalGCdXIF dr7bqi29M4A8dqgbHYeokc/fLXiz5mqJpm45JVDawrla6WB511IQ2Ik3UadNT3Wk8PnkgdIqTxs
 D1zWFV8DJJlaP08LlSqezouhkYuSuz95n9W6OblCRxhVjrqSKYtazHxL6lnWt2pgVIHbc1lU
X-Proofpoint-GUID: fL2BuXL8INh8QgjIomrIhBDP085U31DB
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685ab2e7 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Qu-r6guqxG7CtNLQqTcA:9 a=zZCYzV9kfG8A:10 cc=ntf awl=host:13207

On 24 Jun 2025, Kris Van Hees outgrape:

> Also move the initialization of BPF and BTF to dtrace_init() to ensure
> that the -xbtfpath= option is processed before we try to access BTF
> data.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

(I've wanted an -xbtfpath= for a while now.)

-- 
NULL && (void)
