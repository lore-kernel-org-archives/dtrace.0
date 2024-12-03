Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82741FCCE0
	for <dtrace@lists.linux.dev>; Tue,  3 Dec 2024 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733249204; cv=fail; b=M4CW94kFazr/PviA88yIuv/gMnVkqjcSHkTf+uQjyfc/zq6Hk1irm7HzKBQSLOiVmhoqAwFHsQFAb8fQmVgO+++KDKugnWOIP4Avabw7K8L0fcFf9zqWCdZBiJ1y/O29ikFX5lUB9na7HMr8drApBL7rF1aUXxb1hC9Zwg/5uF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733249204; c=relaxed/simple;
	bh=/i/eOcziyBFAkSJUMjQmCmXAxbpjPHhYYN/sgqcN/XE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=ojxp2qPymh+krgPwF1Z6y4KOKXxk/Vx8CWJTe8RQfBi2kEVyOZLnzuVtSHjKUMfn3Az7b5wwPwLOXCcrvmwup1cneyH5qHrdAnOWncEE8FlWCzmyj8eApI+i86iqdmo7m8RoEJ2IMp7ESs+zP9GzW6bw9K/+NOnERZsnxU8Gxwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KxDdN07X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sFTeNBTC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KxDdN07X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sFTeNBTC"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3HuB2d000621
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 18:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ux8/K/70QHH/NkRExj
	6uCvev+CiwUw7VT3Z+X35Yp54=; b=KxDdN07XpX2LbIDRwfieUk1QUNBAVvvLqW
	3QzP7srnDQJ8xFqDWZDMkVmx0UrwBHf5eDpiKYcE+iXy3q0eR2Lli13LYz9SFmaG
	aH5HUh9ilnLHZyiPHu/MkGfowMlPhsq/Dg4kq2s6drAwAPpxHdL0u+6aWoE7Ye46
	EUqUdMJt6cTkAGxvGUi2x86UnVMjgSMcK4NYR0oO7TJt5aOOexLbPXXvLZDkPk8B
	F5rWwTE+M98Cc81X2EZQFtBR4FHmwlco6AlcIHv1rsng1e2ffNy0FVV2ukYbchyD
	spXQ63r+MtF56M5CHhijPLzzvyomQQXvvEAKDhdzWfOnCwRbG9Zw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437smaen0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 18:06:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3HgBRo031385
	for <dtrace@lists.linux.dev>; Tue, 3 Dec 2024 18:06:41 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836u8hpq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Dec 2024 18:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBurkqw0QaCwK5fi2uAp/7WFJyyUh506L3WMVlHwsGnHfl6RHXYAQWG7EKsAB8uQp0WN06pojDzWMGnzzTe6P1PxC7V6reAWQ/Iuk0y8nNJFuqAKYesr9JgUl3tVAYlt1eNnus3rBDeGJhppthnY69Gqa+/Y4ezAFoFBu/qucvd5IaTQ3uV5HQ3J1RgHyboSaiYgf4UfprLc0yEVq2rzHzIFr6kgX5fjU20WvKPZW4X/QV45pSz7Z2nFvtw6hV82l7swJfIVOOGO9EycKi1vqg0Ej2e5Nk5pRuHfYGwfwlhdk6z5J75tXXC9syLtda+haP1W2q+4d6LK4/gRpgBUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux8/K/70QHH/NkRExj6uCvev+CiwUw7VT3Z+X35Yp54=;
 b=GLU+0mDKWBMRVNGEwnN7DeCRBVD7z6mgTnEGxvDBo2kKpu22jCoNjx3eyiXMLyNC8wdy9RwmIjbJtdbSZdzNegYRQ9LZ21Dkq/BZpp4URsogWd6Xnf72vqqI0NHUSG+OF97tMHGxSHx/bpJdLialB9RZtuS0QKog+anDVGaeTNZ+5ETCNjSpPFYpDvqC0o5vyv3k6wrHnMz9dbNtdcAoxvWSPi353QrBiFxj774Pix23Dm5gOqJNth80SFazCrouK8VSYVZEl/lSWbq/GIoZ8GVlQFzweaYSsRD7uypbtYGVhodfAaEhuzVm+4ca7pPj2xdDyog6etJUQEs1cCgHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux8/K/70QHH/NkRExj6uCvev+CiwUw7VT3Z+X35Yp54=;
 b=sFTeNBTChcOLMX7N2l9O2eAMxrtPDaFCtAh1yuVp5r/SkeEqjFy9vhvyGeAKyTDFAk0D8MzMxdD7LK1UY4zyE35TqOXxOGZ42OD1Xgi9fC0lOcs+wkfW4XbaMOEjZUVIyFkYWbeNLMO4dK3NHmCzoMiu87+EDW02iJJuZ9RncEo=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BL3PR10MB6019.namprd10.prod.outlook.com (2603:10b6:208:3b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 18:06:37 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 18:06:37 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH 4/5] libproc: guard against Puntrace() of
 terminated processes
References: <20241203113610.75104-1-nick.alcock@oracle.com>
	<20241203113610.75104-5-nick.alcock@oracle.com>
Emacs: anything free is worth what you paid for it.
Date: Tue, 03 Dec 2024 18:06:30 +0000
In-Reply-To: <20241203113610.75104-5-nick.alcock@oracle.com> (Nick Alcock via
	DTrace-devel's message of "Tue, 3 Dec 2024 11:36:09 +0000")
Message-ID: <87ed2ozlnd.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::25) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BL3PR10MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ad72d84-49e5-488b-5542-08dd13c53ab0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dKZbdP8nrOzF4pasq9Sjc82QqdVNs0zVg7WR2v2hlDgZ2vA973PRsK5jhFx1?=
 =?us-ascii?Q?/t8MD7Z2xlCBNc0VkJW2VKSmct5dnXs4p0cgFjkcTvIdXzvJIL2nU8EdBZsQ?=
 =?us-ascii?Q?0OQUqAgehzt+8ercwuReO33FkXxhWsjk9YBk+Cx0s/+aKL7NDJimQwqakXtx?=
 =?us-ascii?Q?BDh+iVZXscCk5adounp2Dcgp2QUJ78q4vzzmtMrKKyeiaAA1IoFO8JFxecLe?=
 =?us-ascii?Q?W3X85xTFiqVpP4d4KvAq0/FJ3ZtCUjdiZY5Mp2O5rKP+Gz5jKcTaBnRWCslQ?=
 =?us-ascii?Q?v2/pynljN85+FUPQS+V+w/922GAUFTnQI+jPEeYXiNq7OaSF8QjKaWTF6ssV?=
 =?us-ascii?Q?KRAGqWybioLxGO2iH2hChPHqSSIUbLxYkIxxG1Uio0W9xzhChrjx6pTDpRYi?=
 =?us-ascii?Q?lR1EeHyKxLGpRTYhOFTvp+9Wu4bd47ya7Z7EgiANPTB8mqBZM4heZuBNdLVG?=
 =?us-ascii?Q?kVDO//TvONmM5aPrP0knG2XUic1JbxZN5JMrwMu3yVzztBFqT0x8iT1+C7Nw?=
 =?us-ascii?Q?pd60jFfO78JUkTG542Cmr1FXVbGA/tDhkhwIzT62fw2O0NRLwZ9rkzomp0Xk?=
 =?us-ascii?Q?oPmd+S62gQPvQP371McUbZYRqvZ02cOuHdxy2j08n+0Tk8g2kE47zMPCK+fl?=
 =?us-ascii?Q?BROU6MQes7qpF7knknaUbOWio3qewMRrsF9gk2N6xBWlA71KR4RJwOf46YkT?=
 =?us-ascii?Q?TXtAdnng5WsyuXyj3jyG2TWVJxavjsgy5qvHutezyq8vEhykI4UoibV1YTZj?=
 =?us-ascii?Q?yfq+Aby4k5wom4zPiG+Q70yjjYXe7W5HWPjtPHW2C7Z3qf7UXVyumeGzraYp?=
 =?us-ascii?Q?dvnhaEz4vzFFQCwWVbujxJKe47Vzk92aWS5zsoPgPKXwWzr0nPFNUPZxKI0d?=
 =?us-ascii?Q?Bx/Rq3un0S1RHGSnRyM4xQAR1mgHJ86QOqQwN6owMIaZO2VEXIoFWUmrAohl?=
 =?us-ascii?Q?VVXc3iOdd06ahqz84HR4NFc+ynx9DBrquh5GN+sGYQ4IydqAIheC7zzodMs2?=
 =?us-ascii?Q?XnWKz3AAFyhuUMtzUYFbvQ844o6TqqTOWTKd5p+5sDlQ3afeJ3zbcwJuP+CW?=
 =?us-ascii?Q?R2H91YLEmJdwTgnBSu/MNLXXyeRoAWn2nRHQr4CpuxE5/ujbLZS92ccQvwXu?=
 =?us-ascii?Q?c4WOrKaOHHgyjsuIKRmYM9WjEvN1yoRgys9q/NnwpPz0ZA7yHnxV1gFDSrLk?=
 =?us-ascii?Q?o8RAe6A4JEOvu7oUumX2INeDhZ458sgujH98TCiN6E6PHXdSjWRb/4UuXfhm?=
 =?us-ascii?Q?Bdo+MbKJkjlLm5HA7fhH5HqNNrUqZwohVB038jmKyb8j6Ekvh5lI6vJygtL+?=
 =?us-ascii?Q?oWVRsLEsd1JQB+nQlgldFEXSwZMbnspmCIOdfAKpo3gF+A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xYE9Vq2Q05rr5okSuwvP3hqcYu9CZZUBKH5CHpkyyikZOiUAdYwHL4jqoMTt?=
 =?us-ascii?Q?6nmbXgV/JO/BZwIp5GoMOA0GcHAXpScQIXL0Xpk27+1uYfSps1sopfTxW3YR?=
 =?us-ascii?Q?rekrdEJN0oQAGUjTJ0xA+GjU++t993PeDl/d5q5UgNZLljFR5ChYyosc93SE?=
 =?us-ascii?Q?OBvyWBg6MjaUiwCHNFfc/ZT73DyKrPlukh9m9y7fUYQbYZvTrMdM7Ue3y10n?=
 =?us-ascii?Q?fRXRiBuUXUEPCftvhh79WOJkC1llRe1GUQmlFL6XYaJHXym0RrKqMS0s9SZd?=
 =?us-ascii?Q?QVs/r254nljowQmxSrcvs8hVvL/OlYKOvUgVnElBuLzr483R0R/07avcZj/p?=
 =?us-ascii?Q?jASH5N0rx0Z2/aU0NPDp5uH9/qgYTbEexas/6lX8I5D5EcQltP/GzxCd7WPC?=
 =?us-ascii?Q?hhT8xLMz3QuMLLacRD8nMr/fcrZH2Q7u8Q0vnbYFEQ4Jo+78t4t3NJEbLCDO?=
 =?us-ascii?Q?aV4HsQpEwSMgNWs02H1qxMxG8hI35tEBWlG8ZnzsL/vlTbZPLgElmp0t8oMR?=
 =?us-ascii?Q?1X7WmUQGSe3Hn7DA7+igLKIJf3+AsrPtqGBApd6Nt8Puhm2l4grRDIPCw8zG?=
 =?us-ascii?Q?kEB5xXlegqZguNreBmaoH1Es0WorYnBi5cG64+Ilw6ljB1/kylUe6/U/PbTD?=
 =?us-ascii?Q?fUwt8jVdE8Guy5dQ7Ho+V+Lb8jQOMhZzTHbngpnxkFgNRHnAqJ+tfImWvf5w?=
 =?us-ascii?Q?omBd5QIJ1QccWkP9rX1Eg0RrrNpAjdhsv4E2oeWzx7QecpqeAkBer+dcU4Bw?=
 =?us-ascii?Q?9pXoyxd9s6nKP84uM3aJw5gSZXjZ2ZKrR/iUflKNOX9QlJUCV0NWPppLLk4t?=
 =?us-ascii?Q?d+Qzcm9yXwu9SmXw9L2cg7h0MDbxnnQ7VrlyWKL5dxIo+QOFcRAq6DQw6hYn?=
 =?us-ascii?Q?b2Th6YQ3J0BWG6lZw3lqxUgRP8iWXJCGrKvlWs5kJyVYVnDv3OHTuXZFhvsh?=
 =?us-ascii?Q?axoi4GmVUpoSZMnI1dxRcluSpFdlUaixEpmJpTibq865Nz9paUXWl7ncWyvi?=
 =?us-ascii?Q?BCyImbNwczMDrdSI7AQB3FKN7YqsZyaSRgl2mt617lf/m0KdDwEmw2dqD+w/?=
 =?us-ascii?Q?YYg9SyoiszZrAM/0zd0yUJvMbIZX2yrqdmvDmrdwDPIG7zM/XSxAKJeFx4bX?=
 =?us-ascii?Q?g/TxQSoZhcaCtV2g7Lgtb5jCT3Qt17mtJN6YHRV6HwCwI/UzdynbCfQLBTqz?=
 =?us-ascii?Q?J4uk+nCeh5NOUB0p53zN7ShIqWzTTQybxTPvrQf4OcXXEsLNvh9awZ73N07E?=
 =?us-ascii?Q?djH+ienWm3v3XEbFa9mcNqQfaDTZNJg2J24BkiZEb4wDugd+QVNi/KzTvWC8?=
 =?us-ascii?Q?qLFVxWdraF6lCbkMKHsfCh+QyXV6CXXz649JWILygXNGOvo6plGxWzMqrG/W?=
 =?us-ascii?Q?Rs4qVGmRECiy5FWeTeNaUw6wE44p7hR2Yy/nWTu5X6cPUyowtE6GEn6EW/tG?=
 =?us-ascii?Q?Mi8f6dJabtjhQyumI2JwGoZFHpIrbblUdHxtNdSiL6n094LUJkQ0qDeMDYKq?=
 =?us-ascii?Q?gjmXw4wDlKaKEVSuv8BKrWsrJUutvrlpJwtbHL4esrzTmVE3CdHcn6qIed3J?=
 =?us-ascii?Q?0d+m9DBiJWpBD+JRJe67ZUP82kGcL+HjfX7UixRbjtfd3lDrt9rdxiKKQVf5?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	b3SIEmHVN54Kc2/xfAkqw+EztdKVXV6pG3Ss30c3lZSlSvoE482HhEQ2ziRWxeOT7iUjeZCqV05ZYXpxSuOdF3h7YPlFP0voJh/r4yapEhMZ2yAluo0QkRukTSapE+2SFSmh29pSUli1+wVRob5sw9kkG1TrTwiYkwnWNSTmP/XMYXZEukB/oRnK7PqceTGElrtYzJqQot5Oj7rTUF/MEfaFdbviIo4VqeL6ktP0lUBiIRT1r43myjWehTRONG3k5zjEVXk9GGK8zbWf6sAePudp7p0IV4C+5miz9yySzMazbHqrbPeA38iyN76WpHj6uihsNqM0YJUk94xz1gsGBqP3OBxbJChhu5w97QnhyeMlLxUrzZ2czrrtIGGefil+i7dtVz08PuL9Vhp+ZVtyysekPs4ApFvIjPolmBSOoUSdPKfVXGOBdgMs6MKrUB/6RmmFJPv425ONU2j8/+OI9LB5sN/Pk8okx6FRhzlMvXjM9qF4+ckWsiwKTlutCjFOmg4D5bV9J4vcpw5RrZ3A0ms7ySaaqVB6KMBaa3k8nFiihOktg1rCmTWS8lTB4p0I8PwYDOR1fpP6/RoNjxo80I3FO3FKn2/8p1F5yAmYUsE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ad72d84-49e5-488b-5542-08dd13c53ab0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 18:06:37.3622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqR/Jb6DGARb62lQ9tJ3exW1KJ87eiOpqSLJ0C2yKctr8IXH/YXWx+Cz2zaLhLDOYrPUkUIvQZjnBpUXlTKElw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-03_06,2024-12-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412030151
X-Proofpoint-ORIG-GUID: 6jNoZ0cAutpYxnbk95USdMIwbhm99zjN
X-Proofpoint-GUID: 6jNoZ0cAutpYxnbk95USdMIwbhm99zjN

On 3 Dec 2024, Nick Alcock via DTrace-devel spake thusly:

> If processes terminate while the main dtrace thread is doing something in
> libproc, the process-control thread will clean up, releasing all resources,
> including cancelling all ptraces.  Unfortunately if the main thread is in
> the middle of a Ptrace()-related operation at the time, it will finish off
> by doing a balancing Puntrace().  This is of course now unbalanced, because
> the process cleanup did all the Puntrace()s for us; it will then try to pop
> a state vector that has already been freed, yielding a crash that looks like
> this:
>
>     at libproc/rtld_db.c:1934
>     at libdtrace/dt_pid.c:987
>     at libdtrace/dt_pid.c:1265
>     rfunc=0x40419e <chewrec>, arg=0x0) at libdtrace/dt_work.c:377

Oh yuck, what the hell happened here?

... gdb backtraces start with a # character and git filtered it out!

Fixed commit coming right away.

-- 
NULL && (void)
