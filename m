Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA2B148FF0
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908950; cv=fail; b=q8/y6dFuVI5ytfYReTFd2hZbrpU3pRnyNbfUmmdSBhbUDNBTLnrPl8lQ3ktVSfMvkxny+LEynbO5+chiKtrRAsLgkKb8xFXk7McIIb8/A6eQOhiGnjMgCiz4vr/bcayvDj1WMkKGMHUzA1wNJcdvgg4jrt5K8WrrfdbknOzuRGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908950; c=relaxed/simple;
	bh=8RkfAmq4MoQNoZ2SzVZebuTu0SmBvPbr8imm3PcKCFU=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XzE8XJYcP0SUcz8cxYage+ql+DzpNyVFwgwyAgxDp4V3Iw2WGsdbT3mrKSSs1KAq4NrXUQaJA/tB2eHBXxc/14XcL1QleYrl6VURyaygM2cvF0rEKsANxaprs3zl7v82jXj8IJQVNqsPAAr1I6SFV2pjjCZdt4cwOfHwMgaiXVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OtqgFA55; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WpeoVST7; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OtqgFA55";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WpeoVST7"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fnVB005782
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=37WidhwlNNTJgY
	Qmd4Y9jQT4OsRnA8aVBawmGAHghyY=; b=OtqgFA55thiCA5su18Ibb1q0whtGtk
	Ndqz455+gMFN2LOui8qdNRoVdVNxc9Q8bpP2lQoe/EdxAW0vDOaYgAIUOzYRqeR1
	b35e3AC/iWes3FmW6+sUzN6Nvo1n+P3gnC1PJj61eTjw17H2chFUlphF9KK9Fhgw
	v8ZMvK10KTX+ENPnyKNDhoRhdKefTLg8x8IhX5dYyqciKnH14eWUyZ9ixv4ilxSA
	/D33zr2x+6CAdCkEGvFhPGJ+Rf6HihJzIoSlu77uO0scqaVRe7VIcvBL2JmzAGO0
	u+Yt5Btif7j5dKpXr2fZo4UW/3gPVCxryEw5dBmixkyQ+O2OIl3zIg5A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu98j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T53pGV034817
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:26 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfhhv-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jUTzkNtr24iQ1ZOlS5lkl1bWIpVthYzHmhSuTFrMFr33FdEu5W99mdABasfaT2hjF6DsEhYBlYXZFhCVr0cGvfibVVRBVKikCcrTwaO9WMCQTHzJ686MzmY3B+BapIrT+yhGyJOY9n0rWRDX9PXIL8ZatC0PLIsRetIrLBhwOApYdNYnPsfrDu8Dh9P1CchmVMFJgdYI6dc1kij/9nIkenzEdO+kBt86f0xJYedYIdl9H05tgqdo/Ag9HhKXLEJqoh5h6IsvtiU1UrxUoNioxbkZEM6BKpkukss8scnpLVQAGWmtUi9C1MvC2KL/DN3G02mz98dmSHtGGJIR23qBKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37WidhwlNNTJgYQmd4Y9jQT4OsRnA8aVBawmGAHghyY=;
 b=FYDcNnTMIejnTQYQ4FR7zOXp77CtzArlMECPeE2gdD+kiw22eyq+gkEs1cyKTcVOP20KL2Z6zyyA0G++nPLFS09daOMCIs7YqE8J7SnHUbmExnUdgbs2S6kDIhLB+sZt3nxSesJKVGHX7ZJY0Qhq6Z2vhJwKGzTGMXUTr0vUtE9mztWSJIFzpndprH4ReVAkZvExjnub6PkVlil4xFDRGHgoAxFPSpclYB9urCvrbhb1tFqiPCfhXz1+R///K6i89PfwsI1yfzf0CqkGpOf5lQvUO6V8TVY4syUEp1vj7CJXal4cKZbK3aUq0rI6XhErCuU5eSs502BDwxwY3tJxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37WidhwlNNTJgYQmd4Y9jQT4OsRnA8aVBawmGAHghyY=;
 b=WpeoVST7Cchg5kZc1I4eOw3Go3kda7k2G7WedMtKfCibdrlpQ9LXpINWQhgAfA+bVWYjiXPPeL0DdU5qbqOu5IJu0a68ajZA4iM+rCJpyTq72+4ndJel7TAm7CG3owE3AyWoKXhN+cAO1Ef5O5RMx8S20dS9qEYaz24wun52gRE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/22] Remove unused "next" arg from dt_flowindent()
Date: Thu, 29 Aug 2024 01:22:01 -0400
Message-Id: <20240829052219.3234-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0226.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: c719ff28-4d30-4264-e763-08dcc7ea90e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TuvLufuWvT1j/KiB8Wlbtp3hSFpXTaNJGgrg/zhheMsNX4Eaa+qbFkh41gUR?=
 =?us-ascii?Q?+dzzzzdtAeOI/SUl6cCPU9GaNC2RCzRcxgxDBVU3XHvvu2TvyEOrO2/ffxFt?=
 =?us-ascii?Q?YobfA/lPvHcMdzvjjmoJMt2OVhAWOUBz2gIw9wH0R7u4g6L+JHjWuGoJttr2?=
 =?us-ascii?Q?+/XbZjDP6072Nj6HffIJRSguu0abxtZCQcVpec7LHJhQ10KPYej1bLH6YadV?=
 =?us-ascii?Q?tmn0PW0WQeFAGUjd2rECSno1f1cDonM5VDyLNzZVZ3Dceo0uDowBf1BNs+Hu?=
 =?us-ascii?Q?NtcBhT7Fskfmpem6cqcoeXQ/XcVwWcsn/f66S+Df5MuNBwipOodg1MzisNpe?=
 =?us-ascii?Q?1ey2bgloJNlWhx4Ot4bqS0tKx5GGedXQGUUMzlpd0n/7Pdxv9OG5lST4bBEU?=
 =?us-ascii?Q?rs1ZZNPOUSwiskaf5qhbY7q8uwm5j9mYyO1rooawr4YD3qBADGqAHpb5PO5E?=
 =?us-ascii?Q?8RCL6Hvde2TXn/pItsaunKOIJAVqUyCLIEpP9wZVOcKKWVXzHfLB5zstbq5o?=
 =?us-ascii?Q?XpsD+BCTgDlU1lwTN2/uGVU8lIsZWS9XrqDeNlm1TaqlPa0hKpfT7ThOOWWC?=
 =?us-ascii?Q?PinTfTUAcmr9iLoVYZjEa7QNphDyrj8V3g3VgPU1dt+3VsfNPOrM2lB7lI9B?=
 =?us-ascii?Q?lkvKs/QkZHvJ1tgc8CU8Z6tOvFs43FYWR9EKz8D2HTKvnzFZYzEXK2bOyLff?=
 =?us-ascii?Q?0zLaooW1y6vBnDMHVAgIc5laRjBFQmeGBpwlsE87yAWSbbf8f0b88xGw4Tbg?=
 =?us-ascii?Q?uYEHQOyyLZ8klf8i5+UlypfrGNAjqVBNi6zvkWMn577HtFgmU1NnWin11dXi?=
 =?us-ascii?Q?LS6UP9Xglts+SFOTbChDtcp1q5yLzbaiLa//+6eWuBTdvow+nt97rIuv9O18?=
 =?us-ascii?Q?zNiKjKaW2DJuAZmaBV5IDBjeGIK20PSIg4wGNMaTx6tDMS3PS5DR0O4mnsAx?=
 =?us-ascii?Q?rHMBX1/qyHUvwwZ2je+EVU9pi3qZvsPOQ3Tw69Yuk84uaSLuW86ji7w3xsBh?=
 =?us-ascii?Q?HWYRv8y5vRkqZAwO3Kx3OSDCTMmeMIuYc2xLF5dwHd5PJsEzbykUzTFXFcEr?=
 =?us-ascii?Q?gYvutUnMNnVuAQNU5G2W7IU5fTjjWPNHSJ6XUxhzi1mXO4gVwwU00vTuLRZ/?=
 =?us-ascii?Q?/o2Dwl9l8GBXdq/lNWsJr07kKmKzvRiDrtSxq75p4Ug8VM9vCLt04Il0NOdN?=
 =?us-ascii?Q?TW6V/dmZ9WlufGpY/EI5jLzCFH+ax8+qd4Em4JzloM60jpqv8fJlQ7PMuFrO?=
 =?us-ascii?Q?kELEHesQblqESNS/bgOxje04xBmJVpSYTcAdKUhEn9Kl38paRa9E5Jatp3qe?=
 =?us-ascii?Q?vPXu7DGyb7q4XzOAkdFA7yPLVD3ffuIDTPBl2GkSJNP/2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KqHeufsB3dZfRZgO4s/oioOh26sCT0NPqBWiLAuM02AQob53e8vMpyNzM7lN?=
 =?us-ascii?Q?wKPNKRMIHtQ6mOFnj5GNw4R8QWvsCKZCUhLlmf+gMr5+50zodNgHUZ+ftMsL?=
 =?us-ascii?Q?5Vmczh3ZbkXLUwLx+WiGRV6kBR9uZfk2DmZWSZACa4V0x1dgVUQ+u6B+Akbn?=
 =?us-ascii?Q?gasRuw6JsmYGPHEzk/i7Yx231dHITS+1S/g1Cx+wPeC6UBGOg1cqhME2gFE/?=
 =?us-ascii?Q?qhwOCmsnwlUACfvDKu2OMUaWW8Q7V8Xp10/p9FYOuet1vAyF4THAdERzttuC?=
 =?us-ascii?Q?QcVOBOt4z4gfw9VJy63kkSr6L7nvGnWtrPvYBVD4koSzGE7CFErDYDQopgHe?=
 =?us-ascii?Q?dVqyWFmAcsP37Qx/H31sWtiFsovtE1E0cSQi0bUh/epoBw7cx3uoq+8qiCTC?=
 =?us-ascii?Q?y6uguY8BEjDwR2FimyCZ3jyZ3L4+f3mNAdbFqdQxsfY2DqLjHFVKQWiIKelT?=
 =?us-ascii?Q?89mCetY2QlhYKgdflSRXNvDltL2R00w/oZi4MzohW6RjWMy9B86VLLwCvzkt?=
 =?us-ascii?Q?wxvbZhlJiS1al5WRKMkL0tcUWFgMbLV1v0IzxbJCqnaGKOP1O992OwV0PZNo?=
 =?us-ascii?Q?fLBWsUPuyivDgSIMEO3pxwInMLAxnNCf6gYQTHOd4ibpT/Z9CquSpwfgxYLG?=
 =?us-ascii?Q?oN72N+Z350yW0ry/0kh+ddmPTfnygt+ZyLhCNkf4rmxc6IZSVz3dnQ77mKKm?=
 =?us-ascii?Q?1j23zeFChhXLL3zlz6twBOVHOUmScHKkitTZq5foPzzkxgiH1EuPOFhqL/YQ?=
 =?us-ascii?Q?9fVhY5qD9BpPD3RV7ichsMNagyGFgrIS9y0yR/ubXjGkHdMRTMapFgiMlpxN?=
 =?us-ascii?Q?beiESMA664f4q7jiJBHPXajcEppLGtnZ0rAYLfLNJ7SScI7TQ+KnMZ6VaJfV?=
 =?us-ascii?Q?wyIno5GtmyIa/FWywcEZHBrM1ZtuMbJlmRYyc/EY2uTvZmVwrAsR4nTockxv?=
 =?us-ascii?Q?cFnYtwZbN/ABkq9oOovPv3pYhgc5c7g8kgtFurV/tcpYw76815SeWFElfSjk?=
 =?us-ascii?Q?EzxW3ki0q4qUaxVkSe7yU9cHUMbIa2RoSFJDtdZk3LntDWmqH6xZM9BS5Q6j?=
 =?us-ascii?Q?8/qe8lfdankoAmilLU6MpBudRS9BhyxgCMXKjyWiLZsTSZ98qk5eMmAv13hT?=
 =?us-ascii?Q?+Hx5rooSLRg+bhDgikGVaK9A7Ko67EPd0P0LQk3AaV0jN9Jx7C2vQasdsMRP?=
 =?us-ascii?Q?fKgOR7KpLh4IFe7SWxj876VHS7ZQN5Dv9xhPvvkVtasNkQaV9bgtJ+SmwpuT?=
 =?us-ascii?Q?Lt0nVF8eTphDpUQ83cfQuTt5G8hd299lJ2YGxCf9Riwxu0r6Hs3D+YA9E3mO?=
 =?us-ascii?Q?1oloAw5Ztktd6LUQSUrE9KwDfkevGTS73CqGMk2dLio31NjhSbeDXTVGKxzp?=
 =?us-ascii?Q?s//4zcTet6VcoWfT/3ah8jXxOpsS8x1glinfqEDbw8PHyO+0EbvzQVB12LV3?=
 =?us-ascii?Q?vPW4DM583hYIp/bJGLq0nWH5ZfBVKAaftYuG6pBItiY+KrANGwR9sz9lZNKw?=
 =?us-ascii?Q?WwtiR12btTwbp+j59ax5xYbpD67J2es8C3H2Z2nP31bPlAEUXQRXoi/mafbg?=
 =?us-ascii?Q?LUK/UT7EplJwMWCTmfzUs/bV3F+/B2GVjV7/1SVb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RM+eH+64xzx7I50FpN/dKpvtYngjzPWsSgZh0xacq54OMmxjy/nbLDwua5xw2i3sHwKHnsnCjB/rBtP1IbN6v37srdRIs5Eq1DuVSr2jcyR4l1LcrXv9SqzzLpfnpInQTxdFTdFJop7ACXfbyOUCAD9JC+HGGBLce0d6/+k+ryF3h0b86AV0MRyEO9o9dqkkNaZC5lM3UL/YJ+53fUYEAozbXFV0Tnv/L0iRjo/gpyN2d7k5cTG2IiZP1LX+7bfqTgO/Wde3SuC8Y98HAff9X8SNVLDn2iWraj5hu9ild+JYdr2QYE3wLCPK3aGsH0IVKjD+BxQHDTEmkPfvY2dG2t2Ia0oZqXA2A7R2xHctnpWCGeIuYY0mn++VY979kh14zLogLbNMT1FB3qwUVS2BQXEwLSPRufgJcbGZaDekqB2Bj1n/rgfzUW52K2vP9yjfPZBwG8anCNDuj5CnkihA9n8387iLaU7wpkQNBOQGttdSFz16FsbyXBAVmOREUSjH6knbPlMlLdJbp8M8MEfRBeIKNOL8+90ka6UR21oGUxl7daUgpiRBAAT6McHVse/uI5riUMaJC324nSln2GBdVEqy0EUqRCZSU+zssli/uR4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c719ff28-4d30-4264-e763-08dcc7ea90e4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:24.8199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nByh3jFv3sZTslxYbHo/yTJaTopGBHuiNtKECioqmvziSlBRPFrpuAcJeBGYIYURhLx2MWyvRkNPXpCPBk8DHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: TTmCdT5mz85Z0g2YNh0HXUly0c91XsdA
X-Proofpoint-GUID: TTmCdT5mz85Z0g2YNh0HXUly0c91XsdA

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_consume.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index f2d5cb74..6aa9812e 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -433,11 +433,9 @@ static dt_htab_ops_t dt_spec_buf_htab_ops = {
 };
 
 static int
-dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
-	      dtrace_epid_t next)
+dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
 {
-	dtrace_probedesc_t	*pd = data->dtpda_pdesc, *npd;
-	dtrace_datadesc_t	*ndd;
+	dtrace_probedesc_t	*pd = data->dtpda_pdesc;
 	dtrace_flowkind_t	flow = DTRACEFLOW_NONE;
 	const char		*p = pd->prv;
 	const char		*n = pd->prb;
@@ -448,7 +446,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
 	static const char	*ent = "entry", *ret = "return";
 	static int		entlen = 0, retlen = 0;
 	dtrace_epid_t		id = data->dtpda_epid;
-	int			rval;
 
 	if (entlen == 0) {
 		assert(retlen == 0);
@@ -486,21 +483,6 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last,
 			flow = DTRACEFLOW_NONE;
 	}
 
-	/*
-	 * If we're going to unindent this, it's more difficult to see if
-	 * we don't actually want to unindent it -- we need to look at the
-	 * _next_ EPID.
-	 */
-	if (flow == DTRACEFLOW_RETURN && next != DTRACE_EPIDNONE &&
-	    next != id) {
-		rval = dt_epid_lookup(dtp, next, &ndd, &npd);
-		if (rval != 0)
-			return rval;
-
-		if (npd->id == pd->id)
-			flow = DTRACEFLOW_NONE;
-	}
-
 	if (flow == DTRACEFLOW_ENTRY || flow == DTRACEFLOW_RETURN)
 		data->dtpda_prefix = str;
 	else
@@ -2327,7 +2309,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 
 	if (data_recording) {
 		if (flow)
-			dt_flowindent(dtp, pdat, *last, DTRACE_EPIDNONE);
+			dt_flowindent(dtp, pdat, *last);
 
 		rval = (*efunc)(pdat, arg);
 
-- 
2.43.5

