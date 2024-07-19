Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B286C3C39
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721423312; cv=fail; b=Od9fNcluzSj7kTx4SHgbslbJlYoxqUarqOMs0ZQ6x5EMDfopZ2T0dmgQ3gShV1miqVfAIXzmdbrm7SM6x3tR8TWFh5D4gw2ppb5vZl+6ya3NGbDlYicBWJteVxJFvmRVviEhn2QsoA3BdaEQucVsXnbKmIYYhClkWJL9LZ+DP78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721423312; c=relaxed/simple;
	bh=0MeVOlLQK4RsKq8MEkQyL8btHxibtgXQ6g5ic7LReDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CFp2oLKnqZSLg8k3kArelQ/sSPQ26lyUX75q9V3YHJs0l2EY8L+Knneyiz1j1metIdTlLibEdSNrWhAlZL/1KfZV7V4SAoNg4XbDPRxwGnBtTPML2DJLSfMg0JMYxpZPb/VB6YpEqgBWJ3v8857hXkSHvVebzn+voGqijPFNXJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NakzeRsq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Koqu/E3f; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NakzeRsq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Koqu/E3f"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JKFn2d026077
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=sy0kaNi26zfAYmd
	mJ2HWjHvoNiVh9iw6SGV/7BjooYM=; b=NakzeRsqnKJvOgB/0JLuibfA98Adr/U
	l7XM+EFX0LgY1aKB2CHjwK7A/tRkZA4kAJQ78j6/VrPKBnpp22A8pEJu7Pa60kpW
	e+BRGsTzyH7x/nOBeRbtns4V78uM3Z4nbLlcHgMA8FN9wIEbBjefrilIEoqr6cAj
	sts3qVloEMpCo7lo2vjGWkrTmRcuL6Uo0gIzo+HgajSy0y8+YwgcxDwDW8Od+IqK
	xSo+sQOyd73BpNILKS/ZXknwHWZ8ad48fVuCvorEXFdg/lZjpSe3+NB1JDNX4K1E
	8jzjZJWv+s4dHYoMB2fyAwlbDIQOIhZ1An4fbNQzb+Isoti2jNHmERg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fy1283hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:08:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JL7LfV039536
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:08:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dwey4rr7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHrjKanDHlJJULDJtDn+IXri0JfGcb7j2LuhIbo67ra/Ire//DmU3NkB3zO7+8HKdlbBpk25xPkWUP3Hg8e6S+WYT8Mx5Xcn3pA20/ZrnQwNTzDrIHq0Mcsewm7sN+bKqKfQBle37oc+ke+lLSG+qz5aH9BDYwRTxIfODMMmMw6kXJBbkq1cHq6m3//UwQw8n7DQJq62uqUY9qUklfAXTRdvsOCpOFWHNaRhFuoNQ64VGsqFSIAqSKwtMXSlQFUb66GUo5dKCuHcihFFx+ad9/TyqWlGy+EigHV3Zs/lBI9NMlIor9Lg7K0QvG71TYRNZWuKLCT5j6SOaYRmKcw/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy0kaNi26zfAYmdmJ2HWjHvoNiVh9iw6SGV/7BjooYM=;
 b=uIqGxCJYW47F7Hz6ymw+ypAb8fEJ0276rjl6HGqUayXIiRw8I75HujTwbRofgF/rFfWRn3bXozLWzvR5XZE5LEAPS/jlJq7GqZPeBScBI+k69hbPZgb3ay4FdKJZrX8APeDy+mbkcJNFFswW5ZhfoSMVCzdqteonuJfZaZyZjePZKNphCBhtSs2yOWNysrGwjFW6BJew9VUdAVLNcn5tHO3q7I2UIx+BqhNmKapz+bI9K69N0O9WEfoGlkZJOP3YrqfcBc4mug433UfAMJqVs5xpaW8uUCqeJ0ObT6PKGubF2d6J95E5y15Pn4IRjwJfJP1cSjFYYATb+GBxeZSBUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy0kaNi26zfAYmdmJ2HWjHvoNiVh9iw6SGV/7BjooYM=;
 b=Koqu/E3fQjAp67e7IJC/oxhj5UKg1ZQzeit6qu/BacIKVz6VFsNEuWdIFKl0Ra2IHbFjqHdoa8EnrLaebUIFC77CZCAK8xCTe62hawoaaPZ3/pXUjKEVfOXnnsZYGmjdQCUTAUWdOYLzYtXH/4b4YLT/XiJ3KaZ/CpXBqi4Tm84=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB4828.namprd10.prod.outlook.com (2603:10b6:610:c8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 21:08:24 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 21:08:24 +0000
Date: Fri, 19 Jul 2024 17:08:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 25/38] test: Clean up tests still expecting obsolete "at
 DIF offset NN"
Message-ID: <ZprVxS6lFNcuH5MN@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-6-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-6-eugene.loh@oracle.com>
X-ClientProxiedBy: BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26)
 To SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB4828:EE_
X-MS-Office365-Filtering-Correlation-Id: 4beb608d-b68a-4692-72c8-08dca836ed8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RZF5ymCqXz2//KwqkUjy5KW75IQFcIi6OtYFvYZ1nHg0OX+cemqrYghOopxD?=
 =?us-ascii?Q?lYAPtqGehEAcRO2VvP7q7tBVsw4YT0kWJoB4Xt8bs95s4JOVnzzd/3FCXMGm?=
 =?us-ascii?Q?M9DcrdyE9yojlhKgmA9DbKyBOk75/Nm2lqes9xTkUAxnxeF+I/1k0r8FVmzI?=
 =?us-ascii?Q?ks/TGVOWERNPVt0yA1Ry/xk9LWCdF4srsJaTNWUDONM+cyiWTjbeDW93X2g8?=
 =?us-ascii?Q?GOrhLfIo9YgpTu8f8/Lrtpr9t7au8QNOzDgqCq7p5d2RjDUvIVNzFkhIdjFv?=
 =?us-ascii?Q?jfyHgdtYSXBlIIq7xkEjHwfgRt7jfpdo0NMTXWmXkr+MMQ/3hLkWca9/pQO3?=
 =?us-ascii?Q?txdaBU2q5LOxs58NDVGnJLUliXG/hHniMn3YAfwiOxlUvz7tsaVvNqJWKOfw?=
 =?us-ascii?Q?54AeDp5Vl84D+oSBUelbRDIeTZUv8ZNAKK8V+YZCCZEnKBFj22mINmhwoqoI?=
 =?us-ascii?Q?74M34cCQJCRGfl3GU5OoI/Pu4gxcqiP8Cyu0DC8iPkXxdL92ZaRE0B5rNChB?=
 =?us-ascii?Q?omQtbeWSzrEzClxNDo1aWiXVQJiniRcA9krjgudvkUb/9bhWU9vmi3g8hmcO?=
 =?us-ascii?Q?oZdUpyHXcy896X6dHZOZ0bZSriFRMkY8sFRoeY1xOszupRT8U00sm9zj2/1M?=
 =?us-ascii?Q?tcm5ukf5gPeyLRBguIILt7RCWogIuszPQzj4JJAT29Jr+xhDx6l6BUd+luxv?=
 =?us-ascii?Q?nkaNeMJun0MvWpKE70np1VmPEjmYJUfjQqaU+izegxtRrO+fFVAaa9b3zzlm?=
 =?us-ascii?Q?NnUyyOpcm5X8caoHoyRCETsGapQ1WLUKlRH9zNpJi6gqXHrHTU3bBzCo9CdC?=
 =?us-ascii?Q?PJU3n5vZ/Ladn+G6wyzKO0h7ZxJkZqza5q0/mPiVfdqCcSznL+I4Unv5foeh?=
 =?us-ascii?Q?S6z/qesfpCnzsY52LmBtzYziYDwKjuojtgsKOgoemtBI1ndU5yw9NJ1J4Afk?=
 =?us-ascii?Q?FA1qTKQZMqA5MmIYY1G7lHT+pTTBkwxPBSeZzzQskpuQhq3884vcSnLr4ThQ?=
 =?us-ascii?Q?gYVVr+bLJBJ4RhLTdK+SRZEsGz9ZubgNpG2R4v8kZpjDtzaZeCGPQgxx+DIl?=
 =?us-ascii?Q?p0stGphLt00o3I7C/1ctRaXh8x/DlBbdFiMxNQpVY5iLkfuUpNekhUmuM9+H?=
 =?us-ascii?Q?2QqHMaIB7rMb7r4JZL8vrKqOr2lcGqrjRHjVoZMUBG2fHqWicD7Kb8bPtLcP?=
 =?us-ascii?Q?t/SSpmVp7UGrTqKOFTTvOb76QfAG19vZH6McIe40pCJZ147lkIfGLcTNwaxP?=
 =?us-ascii?Q?FfeYYTv1iLLSv8KGojg/1mSr+1DL6e0LIA0dhbQNAGxWS0n1k4PypyR3p1jC?=
 =?us-ascii?Q?b51M7qX5Q7uXBOci1DdqqwXUPPDjo77qX1glwy3Zu2kJr7wT1i48pDNKHGeb?=
 =?us-ascii?Q?PFL+6bQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6FMATzOkyfmt9URfvSaojwrkeZ3tK1JFQ1zw1WcTACB1to9fVr5SWvzl3RJt?=
 =?us-ascii?Q?tSVh8HHjNfbrmaLl7z/Gop7G1m1/PAuc0eJulU7ihMIoJ3s+rAiz81G9PysY?=
 =?us-ascii?Q?QDgOoDdVk/Y7Q3wL7IuZFsVEFb1OLefiT+Fiz1CMpfYvgIDUYb4SaBl9UbHg?=
 =?us-ascii?Q?RvsOTBheZ7bXcbuM10iEkeQI9jpMZT/OvWKbsYl1dmfi0g0BMF0Z9ghvedwV?=
 =?us-ascii?Q?W61Ntb6U80UQuUktbW26vwaBICE7n/5w0crDFcpg7xhFq8OhtamatDoDQmQQ?=
 =?us-ascii?Q?oPgxGBeYai0PUw/zInpcdUKdcqk8D40ocraI/ihJPBaxTsEhwuEpQzgodWKl?=
 =?us-ascii?Q?cLntJ+2HKyIaA0cTlwWRu0UrypO2t2KEap8VQzKrA32/b3+P9+L7r2gVMsmV?=
 =?us-ascii?Q?gJjLOZ7f/JdQzSvUXLeh3GRQgQvECqeMEt+KbSY5tjXxbUmzoqDWGbFYEEHB?=
 =?us-ascii?Q?RVgCoBeNOTdYz1qNxYKreRVYqdbPmsUDt6oM0hC3R6jOMEunHomF5XaUC7Gb?=
 =?us-ascii?Q?CTsDMe1aC+Co5IUGGMVzUG68z3ntdltD9Zy5/0fqDmKfVr7PDuG5iwwRinvR?=
 =?us-ascii?Q?pjl/yyvloHxB9XXkwKK6XzYEwjOmZvhgsDKiZK4Sb6D0mxiANwl3/TDbU7pA?=
 =?us-ascii?Q?ZQFnHs8EYddNAaRqSTG2ebM1XI9rkDNP0TZ03TKXzOU4wrRTvUvlUv8OzldY?=
 =?us-ascii?Q?/NUff6Tx0ZksNwYs8NtiUEWOyAJaV8ufkhTNDFjJXC0m0BnL6+LjWwbhlhBl?=
 =?us-ascii?Q?/3jSUr2SaPTWZijCMceN3E58PefP0RPLd0wxQYX/Ml6H+cBo6xHKtE0ekhoO?=
 =?us-ascii?Q?6UlvNF9ZpuiKf4+C+8qTabpf2oVHptjHmV0aQq9WTEd+nbEO4iQReS4fT21Y?=
 =?us-ascii?Q?WpRvgBopgQzCHc9bUAK+aAy6wT8Ah9IazWEHt8ybz1zmkWt/pKh1iTnQoAZN?=
 =?us-ascii?Q?Zvr7zd1LPtyCKJfYYUxXP52N2miWfXSuMlPRjh/LzScGNIHIluIZDkxZSc5R?=
 =?us-ascii?Q?ASfStBmwZqFII8D7p5LszF2e7Fvcp7KucaQDuhbmnuMYqTcDYz7l5D7FD8uK?=
 =?us-ascii?Q?d+MEjt0tRSuxrrT4WI2cNjC2lQDQ9JSdT6NgIfVLUe6r/EXvtFA07lSEoniF?=
 =?us-ascii?Q?ZVfLo4Sp1GSYkEF8r35skGhXlNVyP/NZy0CoTmG4lnheULuFFDX0DjdFvLeq?=
 =?us-ascii?Q?VkjqckKUrOXQvx73yUFvUkzBbvS7FVT+yZFw6/L9nA1bIKqXcdw5V+jL9Jo/?=
 =?us-ascii?Q?RILPnvvrCcRebyyXmzMpaTuN1fSrgqORZwrbRmueqkvtbksnZkdWHNOnRatC?=
 =?us-ascii?Q?95Jsl3yjG4i9BzBL5AcWasT8q2ZrMSMhF6WqZ1bDwTQ9b3Pvw1STk9h5fNCE?=
 =?us-ascii?Q?kpnKdd0d3AjFjBcJkxMIv6875qvdPlQioR9zOUErqn9ofsdGAGnWjQ+xaqIy?=
 =?us-ascii?Q?H5ydWVJvn4WBIjOHzJ1s1L/hjvlCwDPTYTv9usy8zMsTiEclQL0OY5B0ft7b?=
 =?us-ascii?Q?HtZoxdSgj+gQ7gOvsuO8H/KhwrieIi6DtfqfzboRzwr7xS63uQFXuU0NraqT?=
 =?us-ascii?Q?8TIMLLDhZy1Mnx8nE+sA7hffaxF9uhpuZy8VE6cdCVgDYsx56mjULRJeTN/P?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	D3TQCy5XKp3e8IC5ftyiBQB3JAVFxCWdHSW8cCKtyxUvbTtX83Nt0jGjPyXnuWUBlQdO2Hl8ZJ6APsgpSqiBksOMCkjhtbEC6kgZp3IFYPKtB9OBqwDl68AT6+M1sGsmiAGFFUWTFV2nubP96Uh10yZCL0tLbDBCz8hBHtJol6VEMl+zSujQEDx69CJahNORSuMwYl97edfd788devGGFH5KeAkpKrkFvhMuDqAPn6bDYelHl6i8Yuws17s3EXB/CpqREIeLCRpPN8kCGO0dXaKZn11l5hP43spI2f45mXyAb4fHRwAhbvSuw/uZhbGnzkdkeJwi0XlPrF1jXntiD43d3sm3zZ3xP+tSnG/G/h9Oc+Dm+s3282hqsb0jGviuJQ7GjTAjoMXeS20ti6LrFWUIY5GZgFibx/y4dUEB6axUnRrNajN4ea+fHyXUgw7qzej/2y4GGC7bDn9c824c/1b+ihSmgPEw4mj1svuw3zv0EEi6CXQUvQJb/oB/laZtWCSjMzqBx6TD64SOS3Cx5AuYjxfj0bGiMIpwocgNCYC/OQnoOej2ndKXLg/FJXvpChntO/gnH+fXceNkJU5o+ro5OSEEfVowC3qr1HtaHiU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4beb608d-b68a-4692-72c8-08dca836ed8e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 21:08:24.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PH1bC4ux8e84KhY95CqR+92xlpFrsHatpja1eXcdETciKej+0qVgrV9NQeAgMQ4LxCovAXLTb8P9g+fDRs+82ViCY0cWmYo1XHv83eKFmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4828
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2407190156
X-Proofpoint-GUID: GXYJAYQd1tp9WzmLzCl0C8lPMtvhZtrL
X-Proofpoint-ORIG-GUID: GXYJAYQd1tp9WzmLzCl0C8lPMtvhZtrL

On Thu, Jun 27, 2024 at 01:38:51AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Also, the numbering of EPIDs has changed.

Good catch on the DIF offset stuff that certainly should have been gone a long
time ago.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/demo/dtrace/error.d                                | 1 -
>  test/demo/dtrace/error.r                                | 2 +-
>  test/unittest/assocs/tst.invalidref.r                   | 4 ++--
>  test/unittest/drops/drp.DTRACEDROP_DBLERROR.r           | 2 +-
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.d             | 1 -
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r             | 4 ++--
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r     | 5 -----
>  test/unittest/pointers/err.BadAlign.d                   | 1 -
>  test/unittest/pointers/err.BadAlign.r                   | 2 +-
>  test/unittest/pointers/err.InvalidAddress2.d            | 1 -
>  test/unittest/pointers/err.InvalidAddress2.r            | 2 +-
>  test/unittest/pointers/err.InvalidAddress3.r            | 2 +-
>  test/unittest/pointers/err.InvalidAddress4.d            | 1 -
>  test/unittest/pointers/err.InvalidAddress4.r            | 2 +-
>  test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d | 2 +-
>  test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r | 4 ++--
>  16 files changed, 13 insertions(+), 23 deletions(-)
>  delete mode 100644 test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
> 
> diff --git a/test/demo/dtrace/error.d b/test/demo/dtrace/error.d
> index 5700dd33..d55fb090 100644
> --- a/test/demo/dtrace/error.d
> +++ b/test/demo/dtrace/error.d
> @@ -5,7 +5,6 @@
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
> -/* @@xfail: dtv2 */
>  /* @@trigger: none */
>  
>  BEGIN
> diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
> index d894776b..d3904f47 100644
> --- a/test/demo/dtrace/error.r
> +++ b/test/demo/dtrace/error.r
> @@ -3,4 +3,4 @@
>  
>  -- @@stderr --
>  dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
> -dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> diff --git a/test/unittest/assocs/tst.invalidref.r b/test/unittest/assocs/tst.invalidref.r
> index b050e436..20f131b4 100644
> --- a/test/unittest/assocs/tst.invalidref.r
> +++ b/test/unittest/assocs/tst.invalidref.r
> @@ -1,4 +1,4 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
> -dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at DIF offset 64 at BPF pc NNN
> +dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
> +dtrace: error on enabled probe ID (ID: profile:::tick-1s): invalid address ({ptr}) in action #2 at BPF pc NNN
> diff --git a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
> index 14654676..9fa54dd9 100644
> --- a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
> +++ b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
> @@ -4,4 +4,4 @@
>  -- @@stderr --
>  dtrace: script 'test/unittest/drops/drp.DTRACEDROP_DBLERROR.d' matched 3 probes
>  dtrace: [DTRACEDROP_DBLERROR] 1 error in ERROR probe enabling
> -dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 16 at BPF pc NNN
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> index bfc77bf5..c74762ae 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> @@ -4,7 +4,6 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
>  
>  /*
>   * ASSERTION:
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> index 3e7caac4..1e4fdd64 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> @@ -1,5 +1,5 @@
> -The arguments are 2 2 PC 1 64
> +The arguments are 3 1 PC 1 64
>  The value of arg4 = 0
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4 at BPF pc NNN
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
> deleted file mode 100644
> index 3944c138..00000000
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.sparc64.r
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -The arguments are 2 2 4 1 0
> -The value of arg4 = 0
> -
> --- @@stderr --
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
> diff --git a/test/unittest/pointers/err.BadAlign.d b/test/unittest/pointers/err.BadAlign.d
> index cd4138ae..e859dd75 100644
> --- a/test/unittest/pointers/err.BadAlign.d
> +++ b/test/unittest/pointers/err.BadAlign.d
> @@ -4,7 +4,6 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
>  
>  /*
>   * ASSERTION: This test reproduces the alignment error.
> diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
> index 4328aac4..187543b6 100644
> --- a/test/unittest/pointers/err.BadAlign.r
> +++ b/test/unittest/pointers/err.BadAlign.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 4
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> diff --git a/test/unittest/pointers/err.InvalidAddress2.d b/test/unittest/pointers/err.InvalidAddress2.d
> index 682ad650..b22f08fb 100644
> --- a/test/unittest/pointers/err.InvalidAddress2.d
> +++ b/test/unittest/pointers/err.InvalidAddress2.d
> @@ -4,7 +4,6 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
>  
>  /*
>   * ASSERTION: D pointers do not allow invalid pointer accesses.
> diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
> index d866eae1..187543b6 100644
> --- a/test/unittest/pointers/err.InvalidAddress2.r
> +++ b/test/unittest/pointers/err.InvalidAddress2.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> diff --git a/test/unittest/pointers/err.InvalidAddress3.r b/test/unittest/pointers/err.InvalidAddress3.r
> index 069ee1de..187543b6 100644
> --- a/test/unittest/pointers/err.InvalidAddress3.r
> +++ b/test/unittest/pointers/err.InvalidAddress3.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at DIF offset 8
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> diff --git a/test/unittest/pointers/err.InvalidAddress4.d b/test/unittest/pointers/err.InvalidAddress4.d
> index 1e2b4f62..586cddf9 100644
> --- a/test/unittest/pointers/err.InvalidAddress4.d
> +++ b/test/unittest/pointers/err.InvalidAddress4.d
> @@ -4,7 +4,6 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
>  
>  /*
>   * ASSERTION: Demonstrating valid memory access.
> diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
> index d866eae1..187543b6 100644
> --- a/test/unittest/pointers/err.InvalidAddress4.r
> +++ b/test/unittest/pointers/err.InvalidAddress4.r
> @@ -1,3 +1,3 @@
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 1 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #4 at DIF offset 8
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> index c23f9503..13032f77 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> @@ -4,7 +4,7 @@
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 d_path */
>  
>  /*
>   * ASSERTION:
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> index 8c601a43..54ffb47f 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> @@ -1,6 +1,6 @@
> -The arguments are 2 1 28 1 24
> +The arguments are 3 1 28 1 24
>  The value of arg4 should be 1
>  The value of arg5 should be 24
>  
>  -- @@stderr --
> -dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at DIF offset 28 at BPF pc NNN
> +dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
> -- 
> 2.18.4
> 
