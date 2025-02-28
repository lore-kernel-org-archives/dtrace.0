Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5FC18D63E
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740712772; cv=fail; b=aYMYL8XlFflceMrYO+obs1diz1lQn8c13T0ciomGaHAFqUgNxL+qObQyv7dIjen44aivDDtQ16JTZQ2mGfxGQyyvxZbf+tR96DolXbfXMhELlvBbpmWeR8zHDSjjLKUKzBY6VPuO8jk9qYLK3vAb84abhqVsu4q1Dk+Lj/xF/Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740712772; c=relaxed/simple;
	bh=tjgFxMwPREZ6+cx6Si0ewXi6ahP/eV02zESS92tB530=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dbUA2VcfjWFEpJdlCSJI/z/4BALjnN37PySYS4UeyGqSaDs2qQZt/qBPtj0JgSkPdDOxjR8ieMblD5NaqAgKDBpLWEks6splmPt/yf+4A6hmQLzuJ0n+q/6OpasVxQWaWq7y80WDyfsrZYoouZgIW3qSKVL3ki0gKakwFxQRPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T2unJB30; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=r7VYll04; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T2unJB30";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="r7VYll04"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S1C8uW028869
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=azG0guIk1G79Qx/p51
	FvezrrznCB9xw5ALwAPbazjdE=; b=T2unJB30UyHCDfluBczurdLbSmYOnHDRFB
	YfcIS64qziVv/u4Z++lglGeq1NhuSJidCBm5/QlGpoFxHw4Hu86yt/nV0oV742zq
	FfpoG4dk1SkeCWgQmwRY9vosJpmTwSo/oHLQTLGf+PkcGpVS+uDoSWpgsOuqsop1
	INJyzgQsA866qM+ZYY9+rclbf/+XEFnpV5+HbGOlEKdqBRtw3fg+syOTjvT1PeP5
	lP+56cMb7i5n0g64Ysgyj6R/FNCDxh51qMGKgATlAWOgLXU6l9ErVH+kWxTSK8Ca
	T9Kj9az6f9WFt5cB2rqlTpq47/TOyOfCg0MZgGp9SkIngBSVl41w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451psecrt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:19:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51S0ZvsW002691
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:19:29 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44y51d9k66-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Feb 2025 03:19:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCK3pwOPFjia+p2v8op1HB4ztTNktKhSqgR8BZH+5zkGdlFjt5a9gcBj5OKjC3MD8oEDP6IbwBPhQwtUe6KhFH22ewOk+fSd7hvZ2Od/vraZPpYSlOSuYhRD7WjV5H6gZ1GM8mcDMauek17+Mr9AgpIOUEwClXqZXyByRYXmRHJvDe91QJNYFQaL2Z8jK+JHVP1qmM+xjdLGANg/cl/LWqRtoismRisHBlQB98Hbo4BKcmqponnNAtVYDL01qKN95p3KV/TM8SOEB2pWAhwcieiRIk7JvUWcqwBsaF1CtxaLPUF4YHpXjqyhIeYOfcmdc1Y5ZAUpnxdIJfn/7jxmCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azG0guIk1G79Qx/p51FvezrrznCB9xw5ALwAPbazjdE=;
 b=acc449WD6RMiLhQCHXdIE/C0smlkJJ/3jlIi0CGMIyCS4TWc3FkfGLIaDTcyzy2ijxSQ8wS0DMLrG1EW8uzvfV1rXKhi0l3HoNweJZonBihBhbbKc701nyp3zIecC7eluJUAKfN0EVDJrvfZyBU/CJ8Ag/0N8NoV7YzqdU2UR3lrqeZ/fjE96qU/HtfvY0HbJVviLWPckm0TpHGahXQBPabKNUPgX8H/j7Snpwdry3ej+nVVecEvilvlt/tRiY3GYo9tdt6E8oWymaIBIKeOxa/B7mXN98VaZ/hUPeTTMUHItOyqTISbWUVZRerqwcNdt7AI2OMaBjWuZVWx5BCnjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azG0guIk1G79Qx/p51FvezrrznCB9xw5ALwAPbazjdE=;
 b=r7VYll042u8QovWe+YDrOyrVtqMJkSJaS8zYaNxr44CwOhA9zrhLDsyErybylHILrZp3Sv43LG9e8xnQTWjxVPK3q1W+VkGrXvzoeuerjTrpmJIb+A9Pt4Pq0HnOF4jR0hik9IJF7BXn6uyBWqVLOwBDCcNg5BKYlOFQy2OonkE=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SN7PR10MB6617.namprd10.prod.outlook.com (2603:10b6:806:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Fri, 28 Feb
 2025 03:19:26 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.020; Fri, 28 Feb 2025
 03:19:26 +0000
Date: Thu, 27 Feb 2025 22:19:23 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: eugene.loh@oracle.com, dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/4] Eliminate DT_VERS_LATEST
Message-ID: <Z8ErOwkTNsVpjI+M@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
 <20250208190622.23484-2-eugene.loh@oracle.com>
 <Z8CVjWt27pWGpPyG@oracle.com>
 <Z8CZeWljSdAozsZH@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8CZeWljSdAozsZH@oracle.com>
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SN7PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: c5102fec-739b-40b8-d4e4-08dd57a6b49d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vNdBF9YBrKFOruEcGj23IDChqgnaAgY8H0FDy4nrvoU1mYE+I5QF+gu3Jfhf?=
 =?us-ascii?Q?9gWgStGrMnRcYJL+HwMO4A3uaPeADoCzRLBLxISfw9hUGDpMwvdO3lMIP9qR?=
 =?us-ascii?Q?f+0q3FJjSG+UutOMGcN7zI6OjFiytO+kM6bYUn2OcV9z2xVJ4beB1hf0z8ka?=
 =?us-ascii?Q?0UFFuECaANSr6HU0p+cxvn+wCj/Ao3JUg2KAps0d96M9oe919Z3w6X6R/ISf?=
 =?us-ascii?Q?1/+CnIsnQ/uCnfCE3SXQhTyTLXJMuYS/7aYBUsR4Q0DWVgzKTYBlpscHRpdL?=
 =?us-ascii?Q?zpWNshg9kb8B3QHxP/q1TWz7jUQiEPzwxD7TPrqXbhr8WmX2xN5wpPX1srdm?=
 =?us-ascii?Q?fx6MCC6gAXTXSWC5ZAkGO+i6nFTI7CUXs2fPppi2ou5x+dIed55nzTT9XSaq?=
 =?us-ascii?Q?BDwvi07JIO2XWR2hLWYp4khxQSTUxrd18Ej2PHLqmV2HbcusRH9KuUNVd16W?=
 =?us-ascii?Q?WuxASJV6gpPcNBw0OYsw6353iKbUSV+9S4L0VsGZ2uW3w+Ec12asPnoRtfh9?=
 =?us-ascii?Q?9chYAyQo+mgPSWD+zuGsdLYMtCdOf13uzvK3Ijjxz/v+dqwihs6bXdV8vAId?=
 =?us-ascii?Q?NjS2ojBNdUkChVrglo/D+RAWc7kZ2vsnCcTyPpGfMLp6I2jnL9gQbf/nhmZs?=
 =?us-ascii?Q?G1CSiS+8ifYT6uxStlUqR4jzIE4/wDxBMy+uaogq5UOvfTxYemKtfPLDUxEd?=
 =?us-ascii?Q?mtibixRZPGCfVpKeihV183SNV2a8bAnvTbsx+RlU5Ai4S03ToK2K9+4/ycPL?=
 =?us-ascii?Q?r/knGbmspJOivZp9hFhZUDHjUH/xQd+MFGEITSjbcC2139PwpYKSl0O85RJQ?=
 =?us-ascii?Q?EP1h5WK9+wK6fC0VC6NgCJlRCYPG2mMXsrSDTxNjbnykY3IcwphYh1Lc4WkN?=
 =?us-ascii?Q?3mGhqeZiOB6NoDs9ZVabbhkuliBVH1D0dJ03+/ls9Isg3pdJECuMm1plI0Hj?=
 =?us-ascii?Q?pNS/ceBlob2EVIduu+kJQNTSq13CJcGJmyUnrdniM5XlOXmBq2plgzL6l+rE?=
 =?us-ascii?Q?N+B9Tt/xPM5eQmp83ZPVow/AjznjlRhCO1bEk1paFXIzsYSG80svrwho9XtJ?=
 =?us-ascii?Q?ZF1vpx0z4eTEd8HZJos9rskjfkOGiWVKrBhtAl9RHb0Bfjfnd3wYyx8i2ZQS?=
 =?us-ascii?Q?tT/+BNdNaxmB7hOUmcmcOes3DKCDx6C5pYo8MON5rBxL+J3+8UyLFXPIf/d2?=
 =?us-ascii?Q?wxbGGmTfAm+9fRDk3dIgGLK+KTc7PlFN/gZg9Nvv7Z1qxHMX5K+0N5nqybUu?=
 =?us-ascii?Q?JpUG6EK82GF3LQBlYDELpjmJ5rVghHGGzqisd9xQuE3wwtvB3OKcoRkHmfEm?=
 =?us-ascii?Q?QZHpVcrD5q0PScRAGkoZxnTTxd8524FDTX6T/pz99Kqm9S/7gs5Wr7zApUm4?=
 =?us-ascii?Q?I8S+HgmxRHiiK20veVyY+qeyFpfC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0pIDkgbjYm/CEzSf0zHBeIDXhOd8ldyAqZ5H6vAMolbK/V9cDPk2JG3d4cst?=
 =?us-ascii?Q?wTD0pVwPci8CJX6zTWPFFD7q1m+HQa2S7UEmBl2bhieaduNiv4A6RVYJZhEl?=
 =?us-ascii?Q?DAnHT2RIzTGXEf0p09/8SzgMH3q+6+WRZe6qgORkg10+9h2GiWDDikch/ejI?=
 =?us-ascii?Q?Ioq5AHUXEtdpAyuBHPvTq4GdmXVqKsMcCEKN2DBcuppYCf2bITs1CJC+GDY+?=
 =?us-ascii?Q?uoiinzRXs9SFNlCL0R+pqk4YtAZ9cY6ybsw6EAeqYzcOMtLBDXH2s5NHQwgz?=
 =?us-ascii?Q?11RxKWhWMDXFpuJ+b2QDjOWiBsCfwM8NKGa5UkqOHzuVjXN18cwdyqyZKOzT?=
 =?us-ascii?Q?yehEKah2SZONQuQyWb+HsAyR/tVqBj+G6xc52Wkgj7/PWsZ7z3xjlqad3FTH?=
 =?us-ascii?Q?KtGF2GK7TjtKjtDoTkDaRwVEokVYVFozeL0wOjPurLWF4YSCNJz+a3uOZH7G?=
 =?us-ascii?Q?82XEy53VxXLKa7CFUhVFKUk9stVwFaE2aihqmaHAY7Vtxrx3YsCaVYb1BqhT?=
 =?us-ascii?Q?+SIqgP20Vq8KDTEDHeEwPPuaOxVb88ZVCI0/tBAOYzvJJboXLu3418AwsvBn?=
 =?us-ascii?Q?BlUI+Y73zQRNO6H6UZs6+X+nXpyRK2RpPiSkQedS5UDf9Y4+rEIbdSVKdcvM?=
 =?us-ascii?Q?bFeEM96zkEb2lA7rCMvsJjms1dUCoq4BFBECzi6u8s6889mlDDpx1N9ANJbI?=
 =?us-ascii?Q?lbfLWH8kOj3m/keGpv5zVGXduyJtUsrXwlouX7hKSxDnJ4JDIQUi4bSa0Rv9?=
 =?us-ascii?Q?SpQ4Xhskr3kD/1LD2mo+j1en4rdTyxb0SLwCqrUOKTbwLkQqL1vTtzUUXKMO?=
 =?us-ascii?Q?Lqo9YHYr1w/Q4wLcg0QGMwNeVgfqcO9OgXiaZDWpjBkd9LLnpoDv1pIBUDzT?=
 =?us-ascii?Q?0aBk0qeNTpv8FEw3r9EJV2k6jl1ccxfWxgHSH34MiyXAub1maMbWxt/jz1V4?=
 =?us-ascii?Q?rtx0ajPV+PiHGj7G21R1AT+QFJ2PafF6M7xeiu1kcsLiGV2fa+1YxeMvGmYg?=
 =?us-ascii?Q?sWl/Nv/FzYCg3658LrUQvrzwlKKSncKc0KOVXebj8RYizUkq3NZEfKo9UUmj?=
 =?us-ascii?Q?vfMBCai3Dp07L0juOS7V/2u3Ku7ddpxl86rkLUJjyXrNdOl4Cd3Bd3IzF4Lv?=
 =?us-ascii?Q?PAunFM4I1Rag8bcHa7jEad8Kr6X2bzscnh1OYYA/s39t8MfM4UZKvaa1HOMl?=
 =?us-ascii?Q?BsdxoYSW5CoJ9+P+Ir/5sTZyiRN+gKieh4APVOsBxNcBg5CKnPKYWOUtFVMi?=
 =?us-ascii?Q?7F90n6L3HTUtnE0g/OAN2A6YnLU3Reol+hlW/G8hzFYABes3uF33ZQa6d8aI?=
 =?us-ascii?Q?bnkm5QuhgEBb5OLC82zRHJrWcHY37P+1nZYtcirT5OKrYA+VQN8B/5MqVZG2?=
 =?us-ascii?Q?Dt4tklAOVZ0PI2rATkvU3ePTfRh3491fmbfxg3z5A1hC8bmT3RlHxV405N1S?=
 =?us-ascii?Q?FGVujPnF2b2liCSN83a5mtlo+xbLloJTNmNjaOHN78y/+w7gGg96JSpl+AmA?=
 =?us-ascii?Q?USWd5dXrMeAVE7AUqkgw+5RQ+ZBDkslKp7ykitZpICjyViXG5p9637JCgAxz?=
 =?us-ascii?Q?XBB1bZL5KZ9JBG46CYEQNO9DoWTFQmvSLO3OU0juZAlFG/GSX3i8L11uIC5Y?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HfZgV3UYbodKgYFT9uG+JpFd6EvefOhHejo/0g/MdXa6KIXRp1yJoyxH4F6vaY6JdsPIE5uq3IctY/juW6U51iyfI307KsOOkAa2zxjItNWsAmSvP5fAaIz9pKXJely6dYsPfq7uiCWXjAvdIicudTwO6Jfr5tseoPKYBj+qH/dH/UaihW8UCBisjAkcDGIXRtHcLKb7EBzwTJ7bbH1BpUJmCkxL/s9luqnr3lmDf0hI9KBm5yv2H1EHhFho8B6Wnmm6SyCSOnG97uch7H+ZMiMFRAv2Ibamerj1rOy28EJ8sjDzNwIMAga3T+1bJHzZKmKWsf1Rgz6/pF5DCW50+Ssg5YeOBoaMxLQbZzzmCueOXYsHB0u3ff9U6lVHyZnY6zxAJQzEJsqn90MBys+V5iHr9myb267wS9OSGcQMOgYn5HLtvJ0RYeqFks+aCcoxGqtjZz+aoLuxpI7gsWXdV2SXafUqyQg7rt8oxxgzM1dsdOr/C6x00R7uOL5wwi/Hvr8JUsHwi6nUnpB7UKjN3e6NJB1jZ3o+i04J5dVvc+BZUuknCWV52kHoQldieuXN7iIh0DGg3eEUZLrvzfJoKr0tzlAOQk5ctlkMPleKeMo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5102fec-739b-40b8-d4e4-08dd57a6b49d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 03:19:26.4582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BAEiuivdqTgQfGVWUrFmsPOF4F4WQxda8S0FIXxNP9wXvNk5p6stOfgcyBmEs3m9Ok0Oah0hq9k95WmtJsJzsFmmPUgM4c3/iQsWg4/M9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502280021
X-Proofpoint-GUID: VepxoEuqnsNnWK_k_xt0y8kkvwfbHRKI
X-Proofpoint-ORIG-GUID: VepxoEuqnsNnWK_k_xt0y8kkvwfbHRKI

On Thu, Feb 27, 2025 at 11:57:29AM -0500, Kris Van Hees wrote:
> There is some overlap with the patch that follows this one, and that got me
> thinking a bit more...
> 
> I think that we should rework all this a little bit, and have dt_version.h be
> the sole source of version number data.  We can put macros in there that
> provide all the version information (strings and codes), and use that to
> populate everything else, I think.  That way we reduce the places where changes
> need to be made (somewhat).
> 
> Let me muse on that a little and I'll follow-up with another email soon with
> a example of what I am envisioing.

See the patch I just posted: 

    [PATCH] Refactor the versioning handling system

I think it might accomplish the same thing, i.e. consolidating the places where
changes are needed for new versions?  I was going to just do some prototype of
a possible solution but that one didn't work out (it needed to expose too much
of the version handling to other code), and then I came up with this idea.

Open to suggestions/feedback/...

> On Thu, Feb 27, 2025 at 11:40:45AM -0500, Kris Van Hees via DTrace-devel wrote:
> > On Sat, Feb 08, 2025 at 02:06:20PM -0500, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > Updating the DTrace version number requires too many distinct
> > > changes.  Eliminate DT_VERS_LATEST, since it can be determined
> > > on the fly.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >  libdtrace/dt_open.c    |  3 ++-
> > >  libdtrace/dt_version.h | 14 +++++---------
> > >  2 files changed, 7 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > > index a02058871..b4d160359 100644
> > > --- a/libdtrace/dt_open.c
> > > +++ b/libdtrace/dt_open.c
> > > @@ -721,7 +721,8 @@ dt_vopen(int version, int flags, int *errp,
> > >  	dtp->dt_proc_fd = eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
> > >  	if (dt_aggregate_init(dtp) == -1)
> > >  		return set_open_errno(dtp, errp, dtrace_errno(dtp));
> > > -	dtp->dt_vmax = DT_VERS_LATEST;
> > > +	for (i = 0; _dtrace_versions[i] != 0; i++)
> > > +		dtp->dt_vmax = _dtrace_versions[i];
> > 
> > dtp->dt_vmax = _dtrace_versions[ARRAY_SIZE(_dtrace_versions) - 2];
> > 
> > (-2 to account for the 0 sentinel value)
> > 
> > But this will only be accurate if you also add 2.0.1 to the _dtrace_versions
> > array, and then you should probably add 2.0.2 to it also for accuracy.
> > 
> > >  	dtp->dt_cpp_path = strdup(_dtrace_defcpp);
> > >  	dtp->dt_cpp_argv = malloc(sizeof(char *));
> > >  	dtp->dt_cpp_argc = 1;
> > > diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
> > > index 3fd1b3d1e..bef3243e9 100644
> > > --- a/libdtrace/dt_version.h
> > > +++ b/libdtrace/dt_version.h
> > > @@ -38,18 +38,15 @@ extern "C" {
> > >   *
> > >   * These #defines are used in identifier tables to fill in the version fields
> > >   * associated with each identifier.  The DT_VERS_* macros declare the encoded
> > > - * integer values of all versions used so far.  DT_VERS_LATEST must correspond
> > > - * to the latest version value among all versions exported by the D compiler.
> > > - * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
> > > - * it along with any suffixes (e.g. Beta).
> > > + * integer values of all versions used so far.  DT_VERS_STRING must be an ASCII
> > > + * string that contains the latest version within it along with any suffixes
> > > + * (e.g. Beta).  You must update DT_VERS_STRING when adding a new version,
> > > + * and then add the new version to the _dtrace_versions[] array declared in
> > > + * dt_open.c.
> > >   *
> > >   * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
> > >   * explanation of these DTrace features and their values.
> > >   *
> > > - * You must update DT_VERS_LATEST and DT_VERS_STRING when adding a new version,
> > > - * and then add the new version to the _dtrace_versions[] array declared in
> > > - * dt_open.c..
> > > - *
> > >   * NOTE: Although the DTrace versioning scheme supports the labeling and
> > >   *       introduction of incompatible changes (e.g. dropping an interface in a
> > >   *       major release), the libdtrace code does not currently support this.
> > > @@ -85,7 +82,6 @@ extern "C" {
> > >  #define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
> > >  #define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
> > >  
> > > -#define	DT_VERS_LATEST	DT_VERS_2_0_1
> > >  #define	DT_VERS_STRING	"Oracle D 2.0"
> > 
> > You should add 2.0.2 and update the DT_VERS_STRING also.
> > 
> > >  
> > >  #ifdef  __cplusplus
> > > -- 
> > > 2.43.5
> > > 
> > 
> > _______________________________________________
> > DTrace-devel mailing list
> > DTrace-devel@oss.oracle.com
> > https://oss.oracle.com/mailman/listinfo/dtrace-devel
