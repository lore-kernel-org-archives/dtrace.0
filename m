Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862CF23A8
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540224; cv=fail; b=QQtvB2rr2rKj8gMwB6fqQPdeAG3IfZix6E0Rjypy7ybE0yiUZPvZ7rZVU3zQOTN5ZveArLAESHCvfFvBzUyqkshuShiXKJUgg499nk9077L9CPC1I++WuHI4Sk6eeTGHOBzniv49hJqGmVJc6ufvyZAvs/f5hTLhDdV07zTCoZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540224; c=relaxed/simple;
	bh=9+Aop0VYU7p7PdjSZ3aONLkk/e1qGYZovEvv4qwivjU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JkTlALu/47yqUgwbkJZTDpRlpWk2CH8oWsfdjuGyKTBFKXVT2phkDPnn96y5w+zCNViu18bcm72I+PCQ9qDW6gCihtpBfenhaMWZoP+rYMv72hPLO+nph/DYPii6MkQEu3PbzssWwnJl9/0JGYouBWz9QAUEtcJaiNG78Nax4Xc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BWZWJy+X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LolR9u1g; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BWZWJy+X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LolR9u1g"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKBXvR013654
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=Y+mw+L4qm/2LTA8ggrA7TBGRYQcgdgFcagghBXyN/fA=; b=
	BWZWJy+Xvf4fKxFmZ+rnOdgMFmghZ27rpZBOTI7Sk0ELkt5DViwo27j2w3kYyfFS
	LC9RgYqVvfqsSze4Rzo81+i0u7qPNf9yMupDdxsJEZuSTJH41ED2nNhr7Pzb4hE5
	CPFfIkbZOe+bK1Z9LfgjuJxlpIW7vgybyMqKsngeRCSPQxhcBlqsWe3oCnCDZB5p
	m5/gQwS0Hu8jeNiUoqJyD9yreI4bpKqLE0Xo7Mbg2hJytIOFtYTFonn279cbaEh9
	mEltSUX1XFJAOu2HO0HvvqC6e7g+V+q0+2VaK6viszlWTIKPnbr2UZ3Uti3BiQe7
	Wq4lsUhuVrJX97RHikC/Bw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn70f959-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45S16ekX017835
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2b4na4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8Lj0UWrEFdhmMgdg9EJARnwpbXpOeVL5Fv+Wpm2n7x8ytQdorxybqJhH6yW4sOnEzqBnPHxaSNmZKc3zwAiOKZSSMmzye+xuOv/MxVjxmjGnDSeU7/eeegBww5dAXES+I7Wtf08VNRcApSEqnZPuNHpS3Jm9QNNsKlZEjJmrryOlSmurNRkkh5b+x79m9hiHsvnrLe040NYSDNiIaJCq+R10YD/0DUgZqTCIfj/vNUr3XOE8+sdO7eg1wrVLASvzstZHfTb+2VDXBVGCOdOTYYRp609T2uvJjZjHTfalWinwThBaQfKCM06ky+RM5hJb+qb1403H1khNZcWChBOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+mw+L4qm/2LTA8ggrA7TBGRYQcgdgFcagghBXyN/fA=;
 b=jX6AhECiur2k0OmK9DYc13V1olhn06Ur4fQDMeRd5TFQlAa5iNQuBt74xeIhBWmgORXYGtn5EszT/wS5llbP+BPfGlHhIv+LrrpqdaWzaP3wjwpZ/+BWKqYOnHMpWRhcm1CQ0m7RzceoaqlsWYMjCiyLuwQsllqdcxATe12MqpW6/UtZHSDZr0NhLrgA3CoGbFgDuFoIpXI2TdcoOFI1gHUip7UWTQKdN2L1vcaojvNLwp8AztToDbNswcoG2UAFO8BaSYPYWKirOEGatNz+BkYs8i+syr38igVzz8GAACzWxZi7lFo7ogwI7+YnFi0RkWcglOra/Vw5Id/Q2leRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+mw+L4qm/2LTA8ggrA7TBGRYQcgdgFcagghBXyN/fA=;
 b=LolR9u1gDctCVcSz9oJnVjiQShv2vA/mfiCr+EeB5LqlDtsbVxhIOHOaEgmQkzG3HNhsKhJlf5CnRcjz+6cDyBsZS2tGgrhuroLXXn5g36MjTHISj8zUxuH0ot7XawRF/eT66yNr68fj7SiRONGcy5fC93GlQApj87OA8JeHXZc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6671.namprd10.prod.outlook.com (2603:10b6:510:217::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 02:03:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 02:03:21 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: some v2 patches
Date: Thu, 27 Jun 2024 22:03:11 -0400
Message-Id: <20240628020316.32544-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c1a1c4-2fe5-48e7-3b46-08dc97167c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cCNgYaR9bfIuu2CxhR1j1lJ1MRO+lDdPEDjwviFqMIoxIOwOjnkMNFb/PFC4?=
 =?us-ascii?Q?Tmcbi7JbDHiDswufbOdxPt46p3Ps7/XVh1G3l7JiCygHwHmUjHWul5X6jNC6?=
 =?us-ascii?Q?kafFGi7WyfIJWYussDMFWLN08E/mI1HNWNzf+0C3njEzISMxdRsocf3tJjwq?=
 =?us-ascii?Q?0BRC6tcRj8OAf474oFI3G/jt/ZwTlgMMyNj1e7E1fqZ0okbb1f/ed6ISs4Nn?=
 =?us-ascii?Q?0IX0llc53lfDHM2dYU9EV3NTN5HJtxv070ZaMWWVwReHjCqUQXT+uHDK8W6v?=
 =?us-ascii?Q?zJ5qW/gw+zhvAloiXHYg3Igt2XU49zi/D0uV7x5m3Re2qdwL80g9eszvisXb?=
 =?us-ascii?Q?iFBE27k4+9pCVzOTvVT6sus0a7LoMCLg9/f1Vc6+ovlizMWwoj5tmAcfxYEi?=
 =?us-ascii?Q?RwY8DjszFBeY0SDn4HmK1s2C2+37ugJjtBrrPV/EmgKrahdAjbJWh5CM5xZb?=
 =?us-ascii?Q?sCHZna1KMrOm7rJ6ARtkSH/P13LR9YKF5xveQ8AQUVHhOFDy/KqP6h0cGc8N?=
 =?us-ascii?Q?FArnfAwWxOOwECg1E8AsCl5dj9Mw+/EAKv1QWkdCz6RfCWbbt57af5Untq1Z?=
 =?us-ascii?Q?B5ovfkbQkA0k4meMXjAYee6xOB2LUV0wsTKwBPSqt1b4ipt20tGCc9UkVcxw?=
 =?us-ascii?Q?OhhGn4cjXE/PQBaNY3YW/2AFBopDXn0ifUUUhKVbwji1eCk0hS+HR2IitsnI?=
 =?us-ascii?Q?0MwEYS9nxxOjVR2KEhmWCZAnPfy3hgymqj4/8Xo2niZGlrNqXhaUYMLPjpJh?=
 =?us-ascii?Q?ILbMIm+5gJl3pRTn2R+jzCAYSyKrpl1QwM3vvMau629GhPWc/AUyVaNvGWYp?=
 =?us-ascii?Q?o/8M3mZjnGg34xYe2oCFYxSq741IM5sLFVXmuI/R1wQcCiRrAszhMfsTDWfJ?=
 =?us-ascii?Q?1MempYHN13hkwHgAwJSZ3dHh4w//LDzD9w23CXbGtPWjPxcH7eXZfq+QASmi?=
 =?us-ascii?Q?K4Qd9czPyVAQNLgc3MFgegQL2VKSmYBsVvnh+BPceUOVp9oDakqMrjOiCpXF?=
 =?us-ascii?Q?W3UcWzQw7ntaVKiwdO1xqcAB2HE5UogV9FjhWmKWOw0cvLfkvSyLo6zRNQwC?=
 =?us-ascii?Q?OasxtSssLGZiuzT1YQDyobLK68JOhpFUWPEfyz5Ohqq/1Ik95xkEGunbhATw?=
 =?us-ascii?Q?yaASMPyJ28SOoc9OCfZYvupbgmyqkReF5OkOIUs5G7+VU+OL+6zKLPMY1H87?=
 =?us-ascii?Q?RDgEvfXd6MNWBxKjIs/mF4E/BAhUE7E2mrrr8x41szh8DKl/tTreALIXoWMZ?=
 =?us-ascii?Q?Mqm8M/sZsI9p9FK8HOc0bzHAlKTYqS+WHiJiLOlfXXA6Iim8ZIJ+TcAx6Xt7?=
 =?us-ascii?Q?3mlEAzOeKlOYwVkyGgsTRc24A5bPUzO0gadVGMIVR/jXJQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Xb3m9LCHFE66HpAeK5YIPouJwK14XuhULvfgs3heATQwAul6qB0XkUE0s56?=
 =?us-ascii?Q?6yeBeqKfZs0cXQ02GkASXaWqsY8hitmj5mitAlGSd8R8w+0UmAnu7WEJHDmV?=
 =?us-ascii?Q?9Cainldv/HUZINKhnw5FyhdV73eC9njuvOC6IBzLeGsWNU7v1dD7FLlq5enH?=
 =?us-ascii?Q?Ro19y7CWDTNVQIlrhnM2JMRel4puOaf6ALquOuLjciyjXIsaK45EPIphjiga?=
 =?us-ascii?Q?MDzvS+XM5JzEIxGZ0f+dVH61Yxh5g4q+4/Mt1qEyaDTCcIcM4Ybk4q3BQRP6?=
 =?us-ascii?Q?v5MmKAgHPx6/Q9K0mZ/7r7cgf2FLGnN1e71YD1LlJvskvkQKYR4nBjdM5xjU?=
 =?us-ascii?Q?5eiq6OSxQqXwtV148v/swkMWjzocgNcJ2XcQ35eGOEhR6ZuvNgYc6NE0r+N/?=
 =?us-ascii?Q?qjehIFHhJv1PygCghA0tCBo9FFGusy97OttqtsfxbrexrjZua5dvV5BhqhXW?=
 =?us-ascii?Q?vjGZLj6orERfd4hKY/ZQ4EQKR0qeks9CK2pyYF3N38jbq4AY5/Pjm/CeWG1G?=
 =?us-ascii?Q?CcGpHDXprDZNzNpND2z4FFDcdW+Tp/M/SF8biO4ZOS0bJut5zaGk4kOMFckh?=
 =?us-ascii?Q?Mh4Kw4K2tVD9d3evA8Mwi1sJQy1R4OYFYaNJbmyx5+iKEtwQ8U3nBr2Fxxuh?=
 =?us-ascii?Q?CQDYGY3klpjTjK+2T93GgFL62vdfd+Cp47Jq74wT2dA0V5b7lr0QCrOGgKCK?=
 =?us-ascii?Q?Nm43rBKqXXjEXn8e+kyDR4s6PJmGmy5MyqDDD7F+LeU72xK5wyL4pWTmz3ix?=
 =?us-ascii?Q?wGvb4xA8xHN4/VtoDKIV4ZDzsIal5dZ7UXZO3oy/XdHbWMDkp05jBpwJQwB0?=
 =?us-ascii?Q?UwZp094s33Xy3ciCGzZjJkjTVW6bf2rr4gwLL1RJXDzsVjDr6tusKzoJhixa?=
 =?us-ascii?Q?W3Bnxk7XyArehBnGx5029R47KrLYM3RSCB1PVxVkBuHD5xlERr5nSM/BradS?=
 =?us-ascii?Q?wNyxWsZK/4qRePkCOoLRdSiJVbjgd6AWtHXgIQRktVVtCBfldxnQDbXhAtBq?=
 =?us-ascii?Q?uTJXEuA8qDBRSJo7sMg3fOPCWg7rOtrE14O93R9ac2Gq9yJlu89PZfqgJDhk?=
 =?us-ascii?Q?4FbXYuKrPun4xBu/25qXBjknnMi2CKd3ZJJGeiA1UQsHXTHjVAvJAFX3g7xb?=
 =?us-ascii?Q?5TZ0H1680yA/SgSeZbiSht8+zRiL48ugICf3NjRLl/QLeC6nEPIr2OKQKy4Q?=
 =?us-ascii?Q?FhdhhuOsXAcUfwnsQ03NvbfHa8gtcLFL3b+aCnG61v0zb249Ip119FuCKxXI?=
 =?us-ascii?Q?VvKGQlfSIpnQ33wuy55wGrzgvVOmgFJIExWbCaIGvYoQ5xrCy4fFDcbu9eS9?=
 =?us-ascii?Q?pLd/BFMIq1iOdfHHXenZBZZM6XOO1EygWQaTnrwXwfmxtw9RKuo5rT1Y+r17?=
 =?us-ascii?Q?SC7hD/KnrYNOSG7Lq9UORwAu5UXCbq91FQKtRDbMGfoeX0fgNfhpM5/yh+6x?=
 =?us-ascii?Q?8jwnh37VHGbXc9/c8M+EzcBjfDinJUttI77zR1bt+KjjZRpU9wQiRqv1nCnG?=
 =?us-ascii?Q?7VYwHhPLPQw38OvlnWPFyt0U4MbH+QcclkS4Z9mq4qEsQqsHzcId6C6917tu?=
 =?us-ascii?Q?XUOWUVJ/QD2ePyn6FGeaA08VEpPvNVoOF/tfjCkv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	w1+xrY7i3YvFQwxFyfu0NPk9/p35LECDnYXZf3nbqK+0+8t2JzX7RJzo1obv2Me8by5n3/FpynBLkSyPpsYlmyUkgBqo6oRS6dgWJ77gqNb3tYnf9Olp3Wl1AYfWztL4pd/S81M6Zrirvw0j38jQ2ilGAvsxpCupUOynNfqwvXNq1SvMccAVDFfcdR6HfDh0a4jG+SoD7YVeSdcRry3RTekX/jhKXS/qn7H6eL0AvNjh2AvoUVaTI6Ax4KwB8Skq95MGLc2vZPtXsyJwCWfyGH/BwY+Mcr3Vyy9eU1xkhi/ed1DmpBx7L0KMROMYvshbThyQB3J7/a3o+wtMLKrF+W+1MbgV0QD7YNdvR72GdlE9dMqtmsZpwgkExNIknWt/gxAETL9UgBF5rO/f0b1OW363Q7NdyxRiEJyQUSdroUSkWwYNSkhsZ32iYWFy70AtmcLBNJGX/7+2kZDvmZSK8D2kVrHdckGvplDEB5vPT+4be+V/1HKxbqF4qBksl8Pg3sksm7MraQ9NenxiEv6pVMgkk4CdbKL83Pyn0TiMygDAS3C2IoOZ9FjTMu6bcslCWndYRhNpj4DWLJMcsjp7Ce7ZrtntK2ezLh+eVMARGqo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c1a1c4-2fe5-48e7-3b46-08dc97167c5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 02:03:21.2661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B7lBbz3IME8Lg1ptFklQrdIIIg+c92Wun7nTwFOp/fd17HP0CjsHEbJe3m9070DyFfkOdUeS3pOO8c5PdXTOAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=622 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280014
X-Proofpoint-ORIG-GUID: eVuKQriHiUWf1ZR55viC_whkR7fbP0og
X-Proofpoint-GUID: eVuKQriHiUWf1ZR55viC_whkR7fbP0og

Here are some v2 patches.  (I suppose they're really v3, but let us
ignore the original 14-patch series.)  Notice that two patches
underwent name changes:

#29:
old: Allow relocation of the ERROR PRID
new: Set the ERROR PRID in BPF code

#36:
old: Inline copyout_val()
new: Simplify trampoline_is_enabled()


