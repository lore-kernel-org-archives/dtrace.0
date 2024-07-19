Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903651B86FD
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721424867; cv=fail; b=OGAXwOFxqPHCypsc4fTJ8GlJ1qoGIC0JKJy095ptMU18sYsl+KYlt1bnTP4XWjq53pF8J7IPrinr/gdfmw38p2D7zlqzuZcWn2/Dfa/P5vDvGgjx/mYeAmXuvTGGIG8Z1ZuwpKmnhIoZCkTnmHnVM3RdcTL0TXMF9N+OTM/wTqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721424867; c=relaxed/simple;
	bh=JpQoaEOK8zNNxNf9gxOC3JdNFZ50VQKMDqWd3rWOREE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=huYe4p2F61W7UekvMYIQAhRaH9oUejVLdRVUCIe/xsrcvfSSoySAWGb9Qj36FBTyCkZxB+O7+TePY1PlOAAbUGAAA7yQwkRGRKr0a+uv3yZ2DJJ9mOjmbIjIPb1bwUIRaJUlohDnm/UNkgSEFuv9T9+jsEGS3c8nvR85sj0s9Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IPbMq9H8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CPYSDOwa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IPbMq9H8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CPYSDOwa"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JLUPGS014071
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=12gbC2Y+sNLceBu
	pwatZP9b3mtR6/pEiEA23/YmMLD0=; b=IPbMq9H8xMqDFnNNEiFTU1kVNfQw8a5
	7JMuH4GkwvPFOqq9TavRTePxXenR97mz9vGzD4MUoa+0Pas5T6YnIXMlojQRIl87
	4Um9G8zJJorxKvKsp6c4S20CSLlnmeX9QWDSTlaq1dxXFmTqC5FrYsWuw5yHIZbQ
	yZahUYQ6WVd2RMSRm/tEo7cIMQ+RRhBz87YkTxJgesLdMP9ZkPtTxldFWsrU7YT+
	pe55tRqJndZUYkhO0YLKWd/TP8O4IFKE1APINf8/wFwaoe1Ji3qiWKQrwa/sDybK
	aHkC6Gi3hyERkZTcRFu5tcHiF7pUxIaRl1G3djUxzXoDiWJ1nvwvMqQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40g045007w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:34:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JKT74f003738
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:34:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf287xa-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 21:34:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vgw0Ce4qX4VVMJZvXc1buBY74ljRLyqHdfZTehjLLE626PFeLsI/IECzDlZ0s3oX24na5NMXrzOPDLWlS+2I0RmSIUCjdysFqBS5rjNdyy0v1DVGwFFTZEyzG/xGexUBtjpfiCENURCfKrxo19eYHlISy3PQMR8drrxkkq0STyskDynorxKXTLPdRyBsK+wKhlNv9rI29zmKccX8IkhF721faxmShUhsll+taycgvWsOQ6TOtbkQyjCtENVLx29UDMqf8xv48dRqUEwsKfveYssbir+I/XOSgRcdBlHlisSzzYVdkho1a2tlS7x+MFWT4eMwscHqyWwmhPwh91oaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12gbC2Y+sNLceBupwatZP9b3mtR6/pEiEA23/YmMLD0=;
 b=yk3POKN3vqEaZbbaBbhjOhysubpnNEW3f6Sbv+v1oEc3b1we/MpDPiL2t88RdVecHj86oXaKiZcZwaFCawHn0G6P3mv5QQUr63U+f7JkOeGrul7WH15cVvkFeZeGzPSi3Ahw483HYDUNhrjwoBD5LQiyu1OXlBuJf3X+GcHVv1Fra8yTWNolNjg6BFFLfgdhvzCboyW/1lQYilzsS8wj+kVVEH/JS2dWe6EFeIr/lc6PXzjHk5wtq2Cg7TnVBZCuqVlg7zjvglPE237st6odbSIANrik/X3cUZ45aGuUoABnMRdSYDz1HWvlmlRFNtphyBIqT6RUu8v0PRNfWAWqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12gbC2Y+sNLceBupwatZP9b3mtR6/pEiEA23/YmMLD0=;
 b=CPYSDOwaV0yQm9tJjWYsC0gsn4qP2WozKIzxSFuLNHy0Wgara0DZlcAr+vajJc9Dka4/bT+CloQ2FbVTwN/1H2afAu/1duvP+nU4kolgzfqGeqOjxYFXOivm2GcJY+riWbleYlXoZ4GBwrDpN6N6oqvVePXvqmKPj1pJQT9yYmM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SN4PR10MB5624.namprd10.prod.outlook.com (2603:10b6:806:20b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Fri, 19 Jul
 2024 21:34:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 21:34:20 +0000
Date: Fri, 19 Jul 2024 17:34:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 30/38] Allow relocation on BPF_OR instructions
Message-ID: <Zprb2ZiDYTWEx+Iq@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-11-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-11-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:91::15) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SN4PR10MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 30569c7b-2c32-402d-eb24-08dca83a8cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z4HsPNAkESDcRFaLDpcHRVCWFHICnCJcm2dJU3RSFM8nqd4jZol749o9G18o?=
 =?us-ascii?Q?DMSWBVG8f4kKxM/J5w5oHq/mwOUBDpRreVk/43vW45iUMgtMsPMtRmd3QXUE?=
 =?us-ascii?Q?zr6rCShE555GvsZS4cz3ndq4Ltuu9/SgBhW5KRmQWW9lUQfpdRN7YhUhlvsU?=
 =?us-ascii?Q?EQgMcsAr5lKK9yRLlR5xwkbddy0Fpc4vJ3kviuMMGB5eVo/ApgvHFE/j2ZyJ?=
 =?us-ascii?Q?mFXEj2ZpYniM+/G1kWJ0R7OKNdNeQACuUe7lJ950LNh3iRlIW5ogFHlCWMp+?=
 =?us-ascii?Q?7HfmfTcXhFWofK4E001XhSbW6t5UxQmzBoKV7V9v+EOILftvfqF28c6oZr56?=
 =?us-ascii?Q?sva4nlI5SAxBTPEEabMA5iknjyTwGryLqVWrQDflpEE71Npb4g1nWOCAuUzN?=
 =?us-ascii?Q?NxQR8cKMMCQJsYP8MjtVNt1mVupuOqWyf59p8fwkn20ffj+pPpEwKLkMAnPT?=
 =?us-ascii?Q?Hza0cb7kl1dlTCWPYw54ID9FBIzxZ/5Sc2BidhRjM+gFqjMqUKkAQ3UhiyCV?=
 =?us-ascii?Q?XPC8VKaSF4unqIlODeK2NvOy4PlGBdshVeLhKzJXvtavxRgrF5Mu0xGHwGr9?=
 =?us-ascii?Q?u1WEAeMOs3y+T1iSDkaHV2iKaPoClfrjWzM+SFPUj4+VUcYrRWgYG8AZjBpk?=
 =?us-ascii?Q?t1CJ5DN6jduJKs7oaF2+xxD8HfqeNfnjqTkXwpwvQVILlLo1Ifw5I+lHhBFe?=
 =?us-ascii?Q?KCNdoN8qdhNc4UDHtn6wRpCjJtAlINT/o63e783FL3CNgvSTWw0OwuBUIulh?=
 =?us-ascii?Q?0UuDFpkiaDooAL/+USXhdgsNm09fixsiCWtjx6wTPcITDo8oQcycLSIySaFx?=
 =?us-ascii?Q?HCTyMQKd0JnkCScJ+tDjpvg+M6nL2lc1Ae+CwzAyuRjNB2jzPW8y44/3ug0q?=
 =?us-ascii?Q?hRO3NqsqtVg3a93vfSvGQwNhfhe2LzDTKo4przj6fKMfkHUQIP8qYTZzdSUH?=
 =?us-ascii?Q?QMT9WebNCeZ3bgwFBqC6PbaXWlYBICd1yyZb7hNUTygV6dPixJusR8TumHPQ?=
 =?us-ascii?Q?AXvUIKBJw0jnuNKFvr+Lwi4HZsYsdPkJWP9y5hHT7/boj+yJjfiqd3AEYLfj?=
 =?us-ascii?Q?YQ3kCUpA58x/Bsp2zVE8n7q8KwdnHjZdkeZMrZ2XhjeeE8OU3b7goIrRLUtE?=
 =?us-ascii?Q?Y6wKoxOy8OGG6F9dHp//owxsNbpjNpUM2Zc+tmDJlOuIPaetma/adKM0Jc0A?=
 =?us-ascii?Q?gE06THKO4GUheqO9X+pd38V22/ITgxIEf6kH5yotylguSynaaNMJIc5zfPqq?=
 =?us-ascii?Q?b8/YfXPgSvLcCi7BzTqGQzkbwQVCpWAKUBHSIiVF5i6SfR8ykVZE9P5tX2Ya?=
 =?us-ascii?Q?TErXGKdVfOYe3wJr8kWB+OQ4x9yY50MQBsTxvuNZKIgq/Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ieLsoQaj+Um0aS9y/HQEujmGHiA4oz8zABAdNJcapSAI0zu1CX/2i1BYyCqe?=
 =?us-ascii?Q?zPE5lBUdzGJZzn7Xf0iD7tugiYhXXgDneS9WJ9W+0g/NSXL97sLLB1Ah8sey?=
 =?us-ascii?Q?SeC/mt+K8NZVqB2wdxmp8TJJbTyKOC75ZSbOvFF6GFOS+p3igMFQsgTrT1kp?=
 =?us-ascii?Q?Ypr7KaGya67A5tSrl+5MdY/+wu/C8t+mFn1lvDZ9h6cMzOBTPRFrVveOXxIx?=
 =?us-ascii?Q?sNMllN0+2NWP/9KS/WpMI/9W6N5r+viD4tGdejn/Xd/9/ASPKWblQA7L2xna?=
 =?us-ascii?Q?QBxOPqP3E2ZsM+jbA7AJnwJIMsBiOK8ASJMkdKYISbkAEMnAxMN+ypL6eCxS?=
 =?us-ascii?Q?EQD8/mFnaabtii/WscGD0KhuAAszwBPMc7nH+DXkzU+BEySOeCsKJQaovU9E?=
 =?us-ascii?Q?t37y92qf1v0PQ1gUpqQHlWO14cVzAzRtbArXC8sL7BNmlfQFP0mewkeXDyN+?=
 =?us-ascii?Q?HBcj239npy3YMvp4pAtCk7t2KkIJRpMgCA/u7MRz/HpNtsGcnbPHhgvrK+cS?=
 =?us-ascii?Q?ilhIcNfMgDXCYeflxLZT072ZQ9B0tG8NVJkOGBtcJYvnBpCYHNGEeA1Yg/IH?=
 =?us-ascii?Q?tq9EvmrIDu8W4tV7av7vQIiAcH6lRAXFrBcZ7DVGOboM9kfmuzslqjsARTl6?=
 =?us-ascii?Q?PCbcATzPQ1bLhopYJuYG+yrM3sl9T4TgerwC0fWmGlNf8aWDoSzu85Gt21CK?=
 =?us-ascii?Q?dHnoGQBUCaXWBSzStoQCu+q+weBR8wso46CP/QgIu4yJousBPjSsk9w2BgQ3?=
 =?us-ascii?Q?bPxT73l9VpvHQc3AqVD4OAR6j1edJ4PrX4B0QKiJ1qiKTP42zBL2ID0n9WXx?=
 =?us-ascii?Q?Jthp0BxTR/3EZbhlX3N8/FYKV+ZkPoR1JKphCtZLM5B/dXHfpAspPesff9Tz?=
 =?us-ascii?Q?1o0yKiCoaiBg0TjVZRz5tNpE0oadkRXlwQpSiHNkymkJAccElDtHVTi/lc9i?=
 =?us-ascii?Q?8bkQn7Lhp06JIoKXr9PCxLoT1vZY1TsCnvxyDkM22xFm9ZiVFvU5AsR5FHUG?=
 =?us-ascii?Q?BNmxBtU17D1AOcBmXU5q9zF2ry0Z9WU0DC1fxtX7FrvRqQBUEC8vH6TLlr+O?=
 =?us-ascii?Q?j/nodk/82o4DrspGomSOPwvZCSR5WgGBoW30k5sgOqaljf8J/zChmsGdShKD?=
 =?us-ascii?Q?fNTarOhdxUPxZm29pwJj9LV7B3YRWDn5Zn3jxW3Pfi3GgYTaWYaJ943TjPu2?=
 =?us-ascii?Q?EwrN24hQxXGpgzPSaV0L8GzxCS9M2keIRdAeUVA9LyUjVKpMC4XHBXbbvXur?=
 =?us-ascii?Q?yzJXrmpO0zTc8krCyW9WSGKIiJEDvMWUpg60QWnyhRKkciGg/xXU437ZdjFL?=
 =?us-ascii?Q?PQ8+NVFReDf5FfjxftwdAE+fg5DEJQckDKqb2CGxDT6T2cvrqVOt4dfwScZZ?=
 =?us-ascii?Q?7nTPqBpcCZPxGuSE7kG7mvH0fzHugIpaHzCPEMBHLjjkQ1j9+3SxDDrTY9ZI?=
 =?us-ascii?Q?qye0fli5cheSbkJl62vrjppDsTm2fikGxYaZ0011uxqRoV2MAKPVdhpEYDrr?=
 =?us-ascii?Q?+OjZ8mapZftPTaWsZ1UEI06wciA/E64Q3caE3d8g07V8DXsaswjhJhrodMG3?=
 =?us-ascii?Q?x/xg5cEG7eCCxlnV7sVxEN9rttiEjp4fl0DzJoomswvZFz36+7v066RQWGMF?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	ptAJ4If367Kv7GUuRpVu714UE9OrSun1w+HIj1FULoXVjbNXYWw9YjoENe7mTe886KVm43Vkup7ymBgd6vkAQD1s3Ognxi5QDYrJq0q/VoEq/6He+fjDIO58npopMbKKGAJjx1JyAPywuKaLoM3E8k5O9IstmzsrO7/PhO9DqIJlhqfgem/hsTeuJIT++6Mmwvsjvb9aZrJBgObMnLPdvhYz6q5Us22498UyzibDSRkCYDfpKS8H4zHZLlf5kG9qiRyOTFYcP9+i3fmUoTdaDnMVKo9fxDcZxYG5AaK4lrdBllDW30KEsbWlyunwUsTrPYfhaS15h7Zp4Qg3CPixy/jyjClW1A5SFyM/irxpdqAqMBXpFyRsPaEzuvo2mHnG5Fk766f6vXL2PqA9AOPDGDSC7iPABBQ0dL542WUsYIYY31uuJfbtunrzO3jhfymTf3pQCeTktII7nF/9Nf+5SW8NpC4jagjXqkzQa4of5UU3y2Wz8CU//5RrlPjXd5mHAQt0E5DfuhOIffapLL1de3KCcm+7gsXOBwAlqoqED4HnygO+qaDEISrPBQrguQ/m6svSORSxFcKRLKbxRhmRewsuckDwYdFIEPVTUAJY/Fw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30569c7b-2c32-402d-eb24-08dca83a8cc9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 21:34:20.4645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFAgmmbLuhoB+SCr8wdpgY+0ZHnjUUuapvV/8oflHQw1PZEmWz5bRQXjImuy+tOseR6MbsXeRvQwc3s8dqrWTEnHDKHLXk3E3CgEGQ9sjvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5624
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=902 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190159
X-Proofpoint-ORIG-GUID: DUAycoViu1hFjKkUJt4fok_zFDfc6ESJ
X-Proofpoint-GUID: DUAycoViu1hFjKkUJt4fok_zFDfc6ESJ

On Thu, Jun 27, 2024 at 01:38:56AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_as.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libdtrace/dt_as.c b/libdtrace/dt_as.c
> index a634b855..4b397f51 100644
> --- a/libdtrace/dt_as.c
> +++ b/libdtrace/dt_as.c
> @@ -280,6 +280,7 @@ dt_as(dt_pcb_t *pcb)
>  		case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
>  		case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
>  		case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
> +		case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
>  			if (idp->di_flags & DT_IDFLG_BPF)
>  				brel++;
>  			else
> @@ -492,6 +493,7 @@ fail:
>  			case BPF_ST | BPF_MEM | BPF_DW:		/* stdw */
>  			case BPF_ALU64 | BPF_MOV | BPF_K:	/* mov */
>  			case BPF_ALU64 | BPF_ADD | BPF_K:	/* add */
> +			case BPF_ALU64 | BPF_OR  | BPF_K:	/* or */
>  				rp->dofr_type = R_BPF_64_32;
>  				break;
>  			case BPF_LD | BPF_IMM | BPF_DW:		/* lddw */
> -- 
> 2.18.4
> 
