Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9AE22173D
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721849; cv=fail; b=Nb0aazo/ETVtPakl2ohRdVENAtTdg2ScqNOdKtJylIzoFlpyIO31EIu8heBN1nOKS7Mqr/uFjOQhl4tOjn92mgG1rif4nrHxGSi5R6YOtW2ik3zV9eYXFK43naojvQP3qUfobtiqnHagY9Og7ZCQJFqN0PMe2qGwfLCEEVqO7Do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721849; c=relaxed/simple;
	bh=fzTkIvZOzpXrjRpc1YrpDnaYp4lWwLDXevrkNke/N3U=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Z5/JXEzubsGVxX3yc1SmtwWozXzvo0t0hWO3QHx46goxZP2IhvBQErMoY+oySIJ8VAUgTQCtS3ToFuMRTOqIcYyrOn15jAMsgzUr1UgvS50MPcW2CYCRS2KXlkx4aBwRE6cl/z2ypBHcp72z03wlief67wOwi73hyEwifKNcdtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PZQl/D2F; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UFlp25Fm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PZQl/D2F";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UFlp25Fm"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NLfmoo016721
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=fKz0UPaCkGLflp0qikZ2Q/H2pYS6jpatISVd12JDMo8=; b=
	PZQl/D2FeJPuzQ0InioeXfJM7D0DeyN1yaF8dVc2+h9ofoYlrf6ZSmmxcVYe0HVI
	OgFdKnsLq6Z/CccaDuwlqWI2nUWiV/YKPuhLOhQ06xTFjHBvDn3oWhlbuujhAgqI
	XBZpg55pVeVw5WtTicFiQQW5DYeBSERwLqV2AdEMIeAVDtGcuNDIXmKEN49JR6sI
	oaKvXCwY8SIVmcFe00SxUuGIG/QrHKVCi1aEh7X1V89NA7eBk6tbaWzPKPbx+ooV
	15ka3J/bCg1Jp2ZgsAa88uCVZYz0rruZZNCTmT2aLskz9t2MTI84vbW61a2OydBa
	mpj4KAVG+SoJ3pWEcNwJ7g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87uxtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NLC0NE031951
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:26 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehppf2p1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 23 Jun 2025 23:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fl+zZMwMIJyJ/b8mHG80bJ8HvJUQZ8Ne3HaXZr/vC6cK/PMAvRoAOZLjvOVkDz85ssNg+qkppxBtMQpnGKRA0ks2jN7L8h8kNSP3jgZBdhciGCiYCvBSQqookIdRLEgi/gl7OLgy+evKrXxK3J5Ht4BJ8WUvLxkhOVQf18IVaTfvTBMPus/E2/4B9GBpA9Ovrji3A1uQTBoN4Cn/h9YdBO1Y/4sAZPYEGJtCd/QH8ossrEGWY9lCLASR6wNM7biSLu9bGsnHiu1URNweG19i3g4n90r0mqGYo1GTuRJLFCnLboBh7XdYhIs55LJOVDh/2ew7DcKyl9F+Sb5Vrh07tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKz0UPaCkGLflp0qikZ2Q/H2pYS6jpatISVd12JDMo8=;
 b=Kk32lm3ZMv2CuZ11hC7AksbGuXdTouYm7erPTgdLhS79jtsjNv3vPCfgAT18mqE+Kt3idnTxw4UfR6NScouhvx4CArN0hJJrhyYL1Gs+S6P7BpvwHQ07f3FT7ZDWhb0smtxhfTkQdyO0611mhbajEett6D7ZevxXIiNuQXJDT7uzLXWa2VUCUNRu4l8SRhFujpp1w02jAfgoHiKXpu13sE/TSaGeHrkE18uEpvZY+r+ssykQtFeJAts5QsQ/frEfvCDeMWcrpNaLN1NiLzGydtB5nraBsJ9qsTgVGebpdm7LW/kSJYJdH6ULQS3R8qzY02fwv/eSwl311obklNVLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKz0UPaCkGLflp0qikZ2Q/H2pYS6jpatISVd12JDMo8=;
 b=UFlp25Fm1V+BHu3Un09UmV/7VN20lRrdrU0v6nJ04VXFbM0LzGihY5AxngnD7jnk3ZNFoDHJWaqBJYu1oA9mYTIRb+rH4xIqphF7imEm0ST+TjQTl+zD7DtUUibmSW2T31C4NRSILBlHNa94HgVBO9i5q8st2F/McOPfLgRrAIA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BN0PR10MB4872.namprd10.prod.outlook.com (2603:10b6:408:124::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 23:37:22 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:37:22 +0000
Date: Mon, 23 Jun 2025 19:37:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] dlibs: report missing CTF and BTF data for vmlinux
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672A28ED52DBF398B01EBF8C279A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BN0PR10MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: a85d83e8-87ee-4037-0857-08ddb2aee712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dORk01PTEghhEe4y4P6ak/0QuPTpw27En+2k7GQ13enaYB7zq/vo+blZ+Z0J?=
 =?us-ascii?Q?GdAf4o1mg5qtp3uzCh/41K/IsM0J9NHR/iDvy9IviBBT42tmLh0A68+PqOMA?=
 =?us-ascii?Q?Dnv0mBgSxZfy4SXSw72YD2vztbIbQHxJuJEgyLkWNqY6lw6XQY89zdWBWMTL?=
 =?us-ascii?Q?pfzFvFvMNX2gsU/DGdq3uhkUX9KFTOhTxB8toTJ5UoomTf9QV+bmBT0MxU7J?=
 =?us-ascii?Q?L9c69eSbvujhD7en9wSBLKTYLpfS4PcNK3Fm1K6HTF7BszoR7+DX08NSzYSi?=
 =?us-ascii?Q?vqNhuzqpYPppdR7G9TtU2Spcu+D5GMKdYiHZ7ONk6dD6LaE5SQ5exHdA5/yc?=
 =?us-ascii?Q?o0c8jeA56rV5ikalPUaq33AdSKEsknf0U+cJZWXZ+PwZpNFfT8UC+RJbTbwv?=
 =?us-ascii?Q?8iL0SGAbzeQ5DBQfNJa3GU2xEtrnyWkZnaUC9ZzuJ4zGUcuYRO21z7cnkEY0?=
 =?us-ascii?Q?1W1iFfc1rkKXqUorREPlCFuDL8TMLG45kIBYihxJhrnYEUppW06nuRYKdC4R?=
 =?us-ascii?Q?nSb9L+fMLQGesAz2atNEdY2/sc9qazSsihIEPiamINMidjRw2SRhhtFm8l/l?=
 =?us-ascii?Q?w7sqs9mx84exMsSFCmXGdqKECkP2DUPsxrqc0bO6zDKLxDE3VgcYz9afH6ok?=
 =?us-ascii?Q?n+/x34NQb5KD6j3f1wdghKLepK8bE8qLEfmsL2XGH3oF/aTkP8sEgq8heMcY?=
 =?us-ascii?Q?8Ev6OUo/6cSyNAHS7Aqmpm67mq8rdRLD6msFT8WT3Zm6fYpJPGcshNHFnSr+?=
 =?us-ascii?Q?em/CYj4DaYyWAk7/I18uC0lCedgLXc35Se7JhRliTadf4jWtUdIpiOecAtI8?=
 =?us-ascii?Q?l4WwaLMyS36QIyecG8ipH5NggWayFA8loaTg9nUUwHvC5KX3OwqY1+KG0hLD?=
 =?us-ascii?Q?uk5rXJZihoCvANarmHUw3f+SZ9p0ILpKXURgDFWKSXYTKfXjmiat238OrWFx?=
 =?us-ascii?Q?fsAWj2uw02REdE8gWV23EUDET20FtDyEuuvSZCCSlEGZ5m40OcHIjsgvHTTq?=
 =?us-ascii?Q?gaPlJxycrzLJPlnkmNH28etQP2vD2DiqwkBJyZT+X2EuuKwOFnt4D9zJJQab?=
 =?us-ascii?Q?pj5LMV9/I/MXgSepnWlnBFctvTHFtuqmrux4CiQFlebvUjoWf0Lg5fefBEaF?=
 =?us-ascii?Q?zcXwzCUY1xffqkkwa8FspORBKzGePjT/CWqSgBCMo2wHBL4hYfDaNN1Po68T?=
 =?us-ascii?Q?dCUlhTTod6WMiA484O4FbVsny1B0EGap/KNtx2QEdBb85lYT6FDIlloqQ8cA?=
 =?us-ascii?Q?BmZdp12ytiliGlRhR/p0rvOShIsgkzh0DwtXnl9czAKstB8qfD6JjAFsyh89?=
 =?us-ascii?Q?SaeURzhJdvbwu5i1xVNz7TtChbQXsvNyZskGHdFhBdBtLj6PBnze6I+2KhBO?=
 =?us-ascii?Q?/Pzsc0fWWoDxhTSAYwh8CXuXhS5QVE6KdY8j4ipfzkIFklmyFJoKwxslTxCE?=
 =?us-ascii?Q?38DDl+s6Z0I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uYPFqgEVnTzTxuXhEUvzfiv2OWyagSPiWbSkEvacoRu3wQX55NfCoFnLL4XS?=
 =?us-ascii?Q?8Aygtrlnxi2nmuzPj0dk7oD4L+jDHdJWW3Fwob9w6BUuT1HMgKdNa913ES2o?=
 =?us-ascii?Q?mUtLjpPD18/hpq5PmdtLN+LXX33BqW3nhstXrrPjmfHnHkpMffmcDRHSu5os?=
 =?us-ascii?Q?pKOVg5xEV6aUJWyjarW6AF7NRSFHiV1rZW0lytRZzHFV3jyJyyis07vnRWFc?=
 =?us-ascii?Q?nbQg2WmgIVIC/ItH2s+MWfCyH+YmgP4SeEa42bYR65KgOrMZBGtYspwzuzyf?=
 =?us-ascii?Q?jQkanMu1LMJ/2WTbGVPq53UcbwW+5Upbcwe7ThuRf5DphBgpMKRFgcbXGsBp?=
 =?us-ascii?Q?IENI0KZDAy2FtbzNRjjunsmS/1f6BWmc3ZzrOFExeaAjpvpj7rpBHtHSuYq3?=
 =?us-ascii?Q?yp1ALqmuoh6IKh6/RcxGUA1pz4MW9JsFQgXsl5VoRF9ICz44+PwiCQx7D63h?=
 =?us-ascii?Q?MALtEPZSJDI5xB+F4Sw1v5xlVS4Idj5vwGKqXYlxhHlCWCiDh2Qx/4UbeuWS?=
 =?us-ascii?Q?wMpUvYAoG6IFg3hLiiuAbfNdiwYLH8XqDTQVdgK5GOyVp5kZvuqjD8SUdlqC?=
 =?us-ascii?Q?ySVA/pD9pKgm903zGqDEI/HsH9A20siRcv3gauQttYRK+8MGXujqBqn3femW?=
 =?us-ascii?Q?vvZqZXoRDycGl1GG3Y4qJXiw3f6tNpwu9iYAr/lw2srKETuIX5rKLTl410ee?=
 =?us-ascii?Q?ZE8B9CK/yux34HFkxpQRTJpxRWyBmR3P10gIavk82fi4acc30n2wSkvRR0SK?=
 =?us-ascii?Q?mXQ5BS14cOwf/tGEuTZUlREGwJKOJnMlrtnod1X0lUsi0yc5q4foCpUIKsNv?=
 =?us-ascii?Q?5TK5Yjv2ZcXlsL+9CbCqARcDj77h8JchaPoAxeevDpIformvqlwK/a0WIehg?=
 =?us-ascii?Q?OL5Us2h1TddGzolFu/vSkqPvVMRnlLtZxI2XgMDxuVVr1d25Y6H8UXOdf8EB?=
 =?us-ascii?Q?BxO0LP9HHfEjEsjLY/mpM+PU3SrwNpnEZmt0nz7klco5ejvpORoDIs5lwAwT?=
 =?us-ascii?Q?HFwAzxes2JjjH261gEi00C4BgFtzRm+fzxB1PqFNFSq/V5rMvaUYXzyfWL7g?=
 =?us-ascii?Q?tAo4nkPggN7n9OV45qhxThdgx++lP2ZGOd+wfm+4Kgnf/7SDSQ9Yc2vz3E6E?=
 =?us-ascii?Q?K1UWR6Obg6ryCNKyZJINYsf4Wq6ny30j0LSVcpuWFeCOiahLGqmlGsucJ8Y1?=
 =?us-ascii?Q?qmjncB/mKSId5FcW9W54aeWpBIqy628EBBktEc5NFURbAXy9OJcXONiAj6+D?=
 =?us-ascii?Q?J/IHUO1BhLb+gxbGWq56FMv0Jji/BE1aG58qGy2mSewyagPE93FjdAOW5EFl?=
 =?us-ascii?Q?QSPq70F+xGXfAd2UlT0UhjmBCNuW7tEOX+BABsolpPZ5O3VDG8NWJPUQ3FNB?=
 =?us-ascii?Q?fT0WLIWRA1J2ejtw7a3Hc/SUwFxz5hb3urbdS2AwaN8H28TLkbIW7u4m+5eb?=
 =?us-ascii?Q?j0X2Kyu+T0606RtQaQH/bRAPEe4NFs9wXlZNyZAgsC6P63qjAKLpyKjS3VQm?=
 =?us-ascii?Q?URMLiDSoZknOIVVQjptJax8kJSq2LccE350nLlQBV6v6pgKAAVWmCGQzI1Im?=
 =?us-ascii?Q?iW3KIKl/oKRQYq+MDkX40Mtzt0SCMauMOzkC+66E6NNKQENvju37qF+lDuBi?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1XQJCfFyvniPh7GfyMGsjOdYWfAQGkbH53zwBLNJRtXfQ/xUpg7SJsu2eXUu9jAPWBVyIWQ2lszQ8nQw6tUcIcCNTYmj/WI5ICgRj74y54bwBpjFH5SQe6D0W0mQFBKZzyOIJeSN47Z3r0STnqgedeRwlu6tHZ/NK9eng4KWUvuP3QZ/Acwp4Notp1c36jb8399h4/VEqyQGNHY/kyTYgKsEfk6WPQlrYuF+w7JKUlLx0hfmjRcP8BoDJSYSbgm7WDNGVFqSdu0+4XK2pIsSK/XrTLKQSju+UfUIPKSZJzmJBMnaMrxBPmhfmwrUw3vu/2GyOeZZd74znaIJmQY1nfgl3Eh6Gq0+gHvldraf2QHBfkWTOeWE18lgbkn0IoN0ok9AVbtMLoNMZsviGlTzjl7l3naI+xiDT2IyMKcmT6zKslMUbGI548tAu59o1pBiaZN+LJ+3R+X7opprQJc4oVA03guRGWnLPSiqOrdquQYMCxgtF4UVIc+xNv50WG8PCuckecTE29qAxxTNmbtpyKQXuijdHUpWm5U9/HpqmsK2K9zdIcxkAxopApNe9dedQ4rcRhGu92yhRTLhb9qa4QEit2Miz/ObQikPoK8B1gQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a85d83e8-87ee-4037-0857-08ddb2aee712
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 23:37:22.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcObMf/ApiXJ/Ov6p825kKULBzDRucIbKjaQYdIZja1NkEB35iYSr+9yRIlbGJ91fF8twTkf94gqv/saNwu80X2m+ZBIOS85LgFAqMJEwwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4872
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230163
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=6859e536 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=RzNz8Y1_aOokrteVT8AA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDE2NCBTYWx0ZWRfX1p6Q8z0mVE20 fkas8vKwMS5LDDDmg/9qaKK1SlHEOf2RX6MYFxA9qLKK2AQSwBzTA+Y9wbo8/hUByrkIx/AMm5S 56QZrOxWFEp1Vl7UP80YPshE2vV8B+fJbBKbukWeRyNP8Z3jlc3+xqctHlHwapTs/u3jyXn2Tbh
 LBL75kHQNQWU9zMOKDhyjXgwUx7MvF+szf79mBZFZNVwPPdIEOeNnMu/7DX6YO7jg9H2P4fVtMJ sni62mtlE5U8BUoAqDdimNz5+KwO7f0LZjjJNA5t3f4MM/HUYDSdzB169kWeYJves2si+rQyhWG GM+4rkcX8CZfWP74nZP+JbQRpYwZkoiQ4pQ+Fm027oiaQDa+RW6rZd1G29he0PjB88qqYcwSSda
 7QbsqzeNcMZyMAtHBzJEjXZtZAykiwksRyL2QlzUWaUyk3T18mSsNEKcMkVWsrydFQJtjm2D
X-Proofpoint-GUID: Jxg62oU2LMkdAK6ZgVKta95gZHaNCkwu
X-Proofpoint-ORIG-GUID: Jxg62oU2LMkdAK6ZgVKta95gZHaNCkwu

If the kernel is not compiled with CTF and/or BTF enabled, DTrace will
not work.  This used to result in an assert, which is rather harsh and
not user friendly.  We now report a nice error.

Doing this in the pragma 'depends on' handling may seem odd but that is
where the initial type data load is triggered.  If for some strange
reason no dlibs exist (and thus no 'depends on' are encountered), the
compiler will complain about missing type information anyway.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_pragma.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_pragma.c b/libdtrace/dt_pragma.c
index 0c97edfc..d29e6e28 100644
--- a/libdtrace/dt_pragma.c
+++ b/libdtrace/dt_pragma.c
@@ -202,7 +202,15 @@ dt_pragma_depends(const char *prname, dt_node_t *cnp)
 		found = dt_provider_lookup(dtp, nnp->dn_string) != NULL;
 	else if (strcmp(cnp->dn_string, "module") == 0) {
 		dt_module_t *mp = dt_module_lookup_by_name(dtp, nnp->dn_string);
-		found = mp != NULL && dt_module_getctf(dtp, mp) != NULL;
+
+		if (mp == NULL)
+			found = B_FALSE;
+		else if (dt_module_getctf(dtp, mp) != NULL)
+			found = B_TRUE;
+		else
+			xyerror(D_SYM_NOTYPES,
+				"No type data (CTF or BTF) found for %s",
+				mp->dm_name);
 	} else if (strcmp(cnp->dn_string, "library") == 0) {
 		if (yypcb->pcb_cflags & DTRACE_C_CTL) {
 			assert(dtp->dt_filetag != NULL);
-- 
2.43.5

