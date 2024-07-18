Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792F71BDD0
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721285955; cv=fail; b=CsMdcDomAAuewlAYLVUB8KSADzpuddCiE2IewOZie1sLT7yAn0HkWe5l95W6EQvo0/He/h/EwG3dX0iloICDBanZUX5/6oYs17cbNpZ2ubaaE5VVhVlQOYUTmHt+ekGP0kLQVpgTpG2LmLlTaWAq/wiJzEZl4Kq1TOqq2tZoVSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721285955; c=relaxed/simple;
	bh=B6Y0p66qFBJAnWYteJJizJUXohjxFzgEPPHJSKaQ4M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OZ3Pv10Xta6idEOqD1t76ka4DF7oJY2Tf4QcbNRbC4tv8ydyK+FHsj5ulpAR445FVWBycpl/lBIOUsrFL4QUFlL/nlRTTheWoYJP6o7COE5LGxIHf+Y0l2Ghi3bIU2dynGDswwEuON+QnTXGIjyDBxlWOxgBd+ci81EWYoE1sUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bRhcCyV+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ECKq8xzw; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bRhcCyV+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ECKq8xzw"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I6g3ZB020660
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=Yrr/FoEMRdNZz6p
	AguJdG5XQhZjRhVlMGPQhlv1S63M=; b=bRhcCyV+b8oL/+9vNUKhnbKcRqM7Ls4
	KcwXi88DqdFKM4IvRh4PK8Sx9/Xd4gaDZ1CMQS91N66jvIAjfzOyepLLuy040IRG
	8zATLFaQGvNtrVRF5yFHLpIhF3VfKrCWAHwzWW7kPSR4zUyt2pMP2lguhY+eMpm6
	3iq6HECnnD57hwtPoNtP8ZdW5zTV48s6BVw/QlsyBl4FYMg27Ao27kJjxyQMV3Er
	qKtwpt6/JAIGJJGHsiAu/g/HM/YjrfKcB1dZaIXGa3vYUwiBTaQyShP8nVGhPRZB
	yFoID4LWftZ3D31F6QpPnE6josjTLJO35igg27esyrE7opYqORZer1g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40ex0280u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:59:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46I6T2BM021734
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:59:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40dweu85st-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 06:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAbJrHkNwUemIogpYCuMAlVaTQFiora3BP/8GK5vKJ3egMdvQzdnTptdwFk2yC//2bjZ50ttRIXCAkwYDYKvzWJk2CFf97uStsg7l33BszBFJGtkCXXD/sHFkoCtaNQwCQawjJZ8SCQiNJJf6v6UVNs+zZQqCjsrzWuzHcc5zwp/lyyzwMlrqNUbf6HXWOZt0xVokKKyXQKoZ279HNlvXhBZnfLtjI+Td/n4vdns+zxoEGSMJBnI0xAy7n2ZVCDGnAWuF424x24YuBu7cyFmxOJ/71Vhvummnskxm04oa+pTVLkeoswxs7kWAQuoUo+C9i05WJj3DtdpXYLO6k9b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yrr/FoEMRdNZz6pAguJdG5XQhZjRhVlMGPQhlv1S63M=;
 b=Bwq8gEZ0fVZsH2WxID7KvbptPi3sZLmGFGvXW/YVR7S50CWy0O+9pAaQoJtm+tn9zy4oQaDBVCf5n/QDIV742oFweenusv56/6jVZnjpriPGd2OCyq/r9bmDMPCKUkHJiY08WvCGZw9pslvXmSObq69pXY16tsko4GUdU76ktnImE645vnnjje2gifN+A9DiDdYbERiRQ+tiygKgKsaNWCJj+bF5MWSYTFXduXoO3eqejKVO4p2Wmn6bR9Ns8/RRtqrS36oNE6qgVSYdR5MzSV48/YePRmNKYv5W+IMCMLnQ0bRh/H4efOaG4pptGP3RatzCv7oG3yXxKDuhCC1C4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yrr/FoEMRdNZz6pAguJdG5XQhZjRhVlMGPQhlv1S63M=;
 b=ECKq8xzwPSH2KjkIRsAyxAwQo2HIE07PjkjtLHMFXzuoRkG+r4aBYEc7NZSqLrmbW2L6B03a5XlEaSdP5IcvwBS5SbFUvZyhmPhV8JUiIyYf/dqXGqvSApaizlPGA0oCSuQMgE77f1KklDDd3hdMxurh7G8EW1PopEz8UeGNOP4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SA2PR10MB4460.namprd10.prod.outlook.com (2603:10b6:806:118::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Thu, 18 Jul
 2024 06:59:08 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 06:59:08 +0000
Date: Thu, 18 Jul 2024 02:59:04 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 03/38] Get rid of apparently orphaned status[2]
Message-ID: <Zpi9OH+ylUA5fjf4@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-4-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SA2PR10MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 3994c05e-d037-4891-b5db-08dca6f71ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SWhX4HT9awISVxsh4X8rNT5hWemJq6AmUjyH8C0/oh3OVU2I3+/leedLxNee?=
 =?us-ascii?Q?L+uHx2AYDB/xeICdBc1w2dETBflLfEshHFEaeWfmSUp7pMRX/cx0My8G6joL?=
 =?us-ascii?Q?qnbtBUpKiF+jkOSJAY15xTX66Z73S/tvkrhq6tpSxtsb5jL58cqN4PSRhwzx?=
 =?us-ascii?Q?6DQ1um7E1iymwcW7/TzZ2zVUT8WIHAZuaby6eqVReSjN2uN+ln4B+nUya52X?=
 =?us-ascii?Q?Di4CbzV2tUuUVfCEP1pw+etxosEyIpRLMR2vqC6eNSIfS76t3F54E3woEtnF?=
 =?us-ascii?Q?0K6oxYDKaK2iPi0x6C4NFvga7E66cFv8XtRf8VgieUeHetZg986p4a+OLxIv?=
 =?us-ascii?Q?OqYJ0gEB5oPQSVyETULy6QyGyqBxt6wVEbde05mn2fYtxPE4MbyAduDFDEfC?=
 =?us-ascii?Q?cRbnsS5TLWbwaMFw4k2A//VbBkU/5ADSGZq0pMJb+CV1lcxBidannPWZUsfE?=
 =?us-ascii?Q?zaVYDzBdg84FeACdpd+y3ZFktvbugfgd9v333Yh/SUdPr+Tw9Mnp3bYXbGD1?=
 =?us-ascii?Q?jw3Fx9UruRSQx/jabwwkWXatz83hsFYzn1RAZp2YKMsG8Mzc6BSC6nu5fNY4?=
 =?us-ascii?Q?rtT+h8Kn0WAFsyrh2pWDhPZ6Cxh8O/Y42VYr/KezQ75K/z4ocRfjNb2rXmUl?=
 =?us-ascii?Q?+ee78g1G0MAlRSnlCYINTSMVQ3q4ii/4Hi+tLsVh1RhFhAa2fo1uH7+xVk/N?=
 =?us-ascii?Q?60przgrruT7eu9YjHxYlKXC5yeUUXfA+W4eXPTsDJfbF+ZFKFXhd2Xdz71Z2?=
 =?us-ascii?Q?UDopGryvMlMnVCRBA6aCNc3WdNwWAuzjA13/h1yGnwun/DfBTUBwzgmGqRCb?=
 =?us-ascii?Q?KKYHfcgsFMg1fV8m3/JQCLRbfoc7yq+aBtYEk7orp5pZ7T702c6V09dzzo7j?=
 =?us-ascii?Q?aRImT0EODVBXEndf9foAUmoI/KNnBPTVJlV1Dv+w3bPedR9L+HVoYpZ05irg?=
 =?us-ascii?Q?g03OgrRAnw2io/iJmwUgQma4ePtbWY7nDOXUPTfVmJ6ngUoCgWlEuXm/a9cH?=
 =?us-ascii?Q?GZHNCxphxgvalJiCxxuqZawl7IdbQsvFFbt8Jt0tklaOgDsCMq7ms6qGXlTt?=
 =?us-ascii?Q?F8+Rcm6df6lLosMTlWG7gEv6caka4k6ZIGjWgiajcXZ2qhb4VO91/wt8OiKE?=
 =?us-ascii?Q?FbK0JDXM2qgTpDfBZUC8pEkb/SBTXb7KBtPFlBeiBiuJsoyN63WesJp8vpZn?=
 =?us-ascii?Q?chzPvjqJ7uGOv4dLX4LCAsJtdb0PNdHBmLrbvip4EWMUnF5Imbo0OxGP7c2i?=
 =?us-ascii?Q?H3l63On5WGX57S++BJMRCkb0cu5VYCS1RF+m4euD+Bn4S6awDXLMYb2c+ScF?=
 =?us-ascii?Q?23iLmcA2unKq4WiUlyZBVyC+4UvwvWQw7D/m4qjA3eiqNyc4ZnICBpDKNqAf?=
 =?us-ascii?Q?eifNjYM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v6gk3zN133Q11BFun8DEDQI+kfGGMXp3pMM80sMUBwNov4y92pCt2DMDuGl4?=
 =?us-ascii?Q?Od62ROewyHrFPjBHtntN+LXcTr26qHe9u5xYb7m/LNaljb6gCd82TMw417IA?=
 =?us-ascii?Q?Qq3pek/WD8S3z4AJWTCNmKTlNERtPNYjOFxOT3hBtzVeoh6dNpj6r9iNoACx?=
 =?us-ascii?Q?gLubAIRRls82VxTfqF3f6KIgPrdG8pHtV2F0X1EFN5ZxufJjv0Z7rJYbT1D0?=
 =?us-ascii?Q?HeD9TjgrPVYtjRtYZsbWnnKlkzFnHLStcS9+DRAF2S1urQpttfumdrZzjKze?=
 =?us-ascii?Q?PlNx3fhDPC7P4CY6qLXAVVhXK53wYlsk1/zlPtdeNofvAlFidDzeaQYt95vH?=
 =?us-ascii?Q?3U+L85axOBV62l2qgV58Q70m2BhhsNf8zE3+VMmpzBtxcPkJh5Z3xUrVfBAW?=
 =?us-ascii?Q?yjNr0QEo1Bg1oNW3NMCxIrV9+z8SjKU1Rihw9pVVaVz8BM7Qt5RN9Ay1MdMJ?=
 =?us-ascii?Q?5idgJAeU6qa4qYHYcDOgeSjzHhqjMz3AjsH67f+6WNOsrU02dHJx5qOhZjfy?=
 =?us-ascii?Q?6V7yDgeN++is4ZrINi4JCsCwSid5ONpo+zKQbwx/vbgn0M5ouTeeRl0F/7p+?=
 =?us-ascii?Q?SSa6KDrqRZ9XdIL8RJKeZBtnjNNCi9uetYuSb9wDhcw9sxcuZPU1PRuYbEFh?=
 =?us-ascii?Q?u4UCwSHy2nCyeugcJQEJt8a6hiUipdaq+jGR+1n6R5ITXS6ejh9iHM+32Bs+?=
 =?us-ascii?Q?MIoQoP2VAUDdDK/ynft5lpnzvUL1fIUrInGxkBgjOn4lY9HZcglxihCiKdzu?=
 =?us-ascii?Q?x3KMSl1EJ9VPqQCQwUDrC88kDfuYQ09rYKplRz57pVZWxslZdf2AjqdQqTbN?=
 =?us-ascii?Q?3r+Up1muNUq03lX778+Fe9VaP3PWNsON0L6YgogoHDOoNZjAaH8EXwygcgI5?=
 =?us-ascii?Q?CCd2jx/VrfzVD3NIlWKgG9Sb7KqI/Skok9xtHy+fj9NwkGw8FNZEjITdx2Z4?=
 =?us-ascii?Q?Cnw1nwRtWczwHzF+EuFpTBLjy1c+Zb9MMbl/jKwMNkX08ykLf3G9IBuhgpUN?=
 =?us-ascii?Q?MUTMmkztZIUXEv5OWZGf5QYSAZKh+Asl6Q6WROhf8x5z+DJL4yAU55kjNxKI?=
 =?us-ascii?Q?vr6y3stzQhJzGGAgJraUrA/l4UWV8sqWW+p+Q0VtrMp50D40hL9ELwwDCb5r?=
 =?us-ascii?Q?cizs3y2bFtHbU6ffq0Cw5jLS/23hrOtP7Bp2u4TMzxFBnzLw1/E3eTm8JRnd?=
 =?us-ascii?Q?uSUWTwLo0EhtwRaVZLC+SJdoQ0SPVyXZH8Ml/ayoWIuWmcutcr6fHrdwrumP?=
 =?us-ascii?Q?Fe2v/NY9eXqFcpysAwy5D6PgCVyfzatHN2s0dLJatIYGXuDDODSB1zWUmBpl?=
 =?us-ascii?Q?LkZNJ/xYmW6qRc6QOtOn3P4mXpeoFvE/EekGGHQ1iS4iHqdts7cO+SghSkEj?=
 =?us-ascii?Q?6ZkSWoT/FtO3fAP+NTjWPpU2kGeRxbNiaV9LA3rzDPqaOZzL4jFTm2rWEvFm?=
 =?us-ascii?Q?bNVQ41ggS5PNJFWE21I3YZSQh1Eb+X28yuCSFyQyzLPRAyM4zseK/Lw3/vA2?=
 =?us-ascii?Q?hBUXu8sPrppLaGKoulQnsfqoHZ2/EUo9FiWW0J7x/iEQD8lRVOL3/agTBCg2?=
 =?us-ascii?Q?9lWE8acFcvlK4CoUwrwNtREt4MKiqs5DEbRN747orCmUZLzrIeFHfxX1xrvx?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KR8ehr7jg8cJ4biFfDWK5RVmnbe+hCKRG4CuSrhkvPVt8n7A+1/exDgKELoKW/W/45xest4cVQoP+FCFwj/JQsCb0A+xYn10/kFFk1/wJQGWz8/ACvsBQinf8KUrNGTStWyKi+bEhIh8Lf0jznBAsKHjKHwskQQNijSvYjd1DEHVBKPyhHkjsHJLZwBzsaZ6WzVlXvJNOvRlUbP/sYJmqnK67ott+SebnM0XsMWzhmiKMYEXKkb3O5tYwtmH0beFKmXETcdPRNzLYKFdAEYwRRknJhMvfWXs08gp3uiv59XD6hmjoQEOVNcQQe30trsBbng+Nk3LKx8lmDQ31RC4d+UjZpsf7xkXX2h3Y2wOtyTR6OQK9VMGwgwIhc3YTPHxZtbkOJuUU+5YLjVCjAQiCqePGq83zmyNDxOrrdh69evuFeH6hiPs2zk8Qa5zSF3a9luKvzBDDBQX2shkNiePTeUwSnL0ZWkmWh4WmiTrth5jKEhzeG3zCSaPBecjWr1ZaVqbNPo/EnfD6P/Nxy4phHR9e4TaXgq+SEwn6azMibdJieCyZs5CYuRBmjPTDb7ub/uM9q3k0bYpda1+lS9IIFDpEoTTQdYKY4pF969n7U0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3994c05e-d037-4891-b5db-08dca6f71ea7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 06:59:08.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fglx2GzxTugFtewygTH/rC5x6jAxvEqySm3Cgyh5tWA1ol0z8c5NaLbnNLMnedcKe1owdrE/CV91peZZtkZTacqRywE7UzrVB0XV3ErKpT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4460
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_04,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180046
X-Proofpoint-GUID: AD_tLHW-uf3KtbD9cCV_SBNvlUKQRI4Z
X-Proofpoint-ORIG-GUID: AD_tLHW-uf3KtbD9cCV_SBNvlUKQRI4Z

On Thu, Jun 27, 2024 at 01:34:20AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This has apparently been replaced by the dtp component
> "dtrace_status_t dt_status[2]".

Not sure...  Even OpenSolaris already shows it as an unsused local array.  So
it is certainly deprecated.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/cmd/dtrace.c b/cmd/dtrace.c
> index 9c820686..ba1c22c5 100644
> --- a/cmd/dtrace.c
> +++ b/cmd/dtrace.c
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2022, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -916,7 +916,6 @@ main(int argc, char *argv[])
>  {
>  	dtrace_bufdesc_t buf;
>  	struct sigaction act, oact;
> -	dtrace_status_t status[2];
>  	dtrace_optval_t opt;
>  	dtrace_cmd_t *dcp;
>  
> @@ -941,7 +940,6 @@ main(int argc, char *argv[])
>  	g_argv[g_argc++] = argv[0];	/* propagate argv[0] to D as $0/$$0 */
>  	argv[0] = g_pname;		/* rewrite argv[0] for getopt errors */
>  
> -	memset(status, 0, sizeof(status));
>  	memset(&buf, 0, sizeof(buf));
>  
>  	/*
> -- 
> 2.18.4
> 
