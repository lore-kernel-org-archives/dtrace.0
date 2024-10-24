Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57D01F8182
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787919; cv=fail; b=fAuOe4bupM61deblzOBhHxwChRW7BHGOBe7H5ZFUothCS7TuU90wesYBkxF3NvNm5CcnysguZjFbwAC4Ww1RPwnUiDpccH5MS5fWyyDAsIbJXIGKBp4e9lvIZWBuKQZw63LrzzqqLeAvyTG5C0aKm+Z8g8FyC5auZQ74UGXxeQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787919; c=relaxed/simple;
	bh=xG4qK9ZariVkbMQOYFZuwrrIufCMAjqSyrzdaSKqGeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DE+pbJrIa8DUjym0w/CmMwyAAXB7pU6jrBDZfGoqjAS68oEmmq35CYjf6IfHZv/Ss9nWT5pwEkK+L5vge8JqOMUcfsnzyVTvk5RLQltyjCNHxzW2PObcL0O2ZWgpZZNPF2eLvWjS0yaHpCJuMqeT97iJ1R6liUSGUeACgEJ1jUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L6wfYklz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nlRT0zee; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L6wfYklz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nlRT0zee"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OFu0ws014390
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=/JyJjMtNLD9jtnqrdc
	QWfgZWrPvXrI/uej+cgNgTGMQ=; b=L6wfYklz8NnJgjEH1C6KfquHbpvNRj5C5j
	yEFI2BixBvmDl2J10oL7+L7vs2UTbcQg5q5JSnJ9OBppeW1g2n/KujpJTMIeT/kD
	kOWneD/4qinLNepTxful3v+y7aQ5ylYh1+CEb8d2c+aR0gUHqjI21FQFj6vxb0Gf
	+J+q2HiVnXXsf3FzKPP+k4hdFXdMuxN7DYVKiijwtnC+kl8xk8zqpj0pddhQqWBw
	5XUNJhG4Ow9Gzzt6r4PlWUnnygTRaeFvnzIxjJBrXWwaT+EXVD86XQtyvn6PX2jm
	EWh0GZD7cySZw4w7GnwJMnsTu50dX5agYeCY+/iVLC2q46uOndkw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545b8a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:38:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49OGbmLS025359
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:38:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2042.outbound.protection.outlook.com [104.47.58.42])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42emhb73a7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Oct 2024 16:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOuhjHfODWfwa5b6MKxN47dVDNIvG7hY6cABtdjUiNtG8yHvThe+2UR1QFokkZQogRHCIPKn9mz2Fyv8djrWZuiBXZnLxKSXmv4gJhYsfFCMXRQ8uH462hLvWmJbbQLAmR41idKtjvp5wtTeXs/DSjMmMA0twQ0bHfElxIAT2HBRYoMqAozKWqQ8dmXQo+xa+mSxtNL9hUpHBJrRiBzj7Zl5+qSipXziVy//T7hwac0xaMLRplmHCUqIy4XHAHybFNJBenBXf6nLwqLsIY8H6rWSr8Wgpbosw+S3E8Iqj5+aJPWgXCEw012mK2jyAuKnVZ1GvSYGUocw3qgHX2UEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JyJjMtNLD9jtnqrdcQWfgZWrPvXrI/uej+cgNgTGMQ=;
 b=bNlkjC3ZJxDjF3p0H9fCtXMJU23DDFpJpsqprOhM1PxiQZXRQlo4qR2CcCZYHvKZUtN0wG/6q5hzzQbWFtowG7LZenvarNO4L/QNSr/dfvjdL+1StiafEUquiIB2ij5fZzOVQMYrhAWwRegW6U0FJRZxPFjA+YGHsT++M3X3R1hq/VxUWWOWpCWYHaoTx8AmXfv5C37EXD6tvKsscTEuxLY/pIEUr5u8GKoVUyxCbFSBjYYDlszKJqNCcIW5hSR0Iw0aBktGZPhQqOh09nW9tiLi1OFQuvUBWv90jW3mq1Tmk0FOnRUiKf0QKIUpwyYyODp8fMWZGynvXXE6JlTWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JyJjMtNLD9jtnqrdcQWfgZWrPvXrI/uej+cgNgTGMQ=;
 b=nlRT0zee7vRF1JaJSAqB/QqZ4TZ5MWDckBFN8Liog6rBQhitoaGCYv65Ip4/pRYXejgXHTSSRsoJLMHlTsXQmEdjfKmnm1buUX+Og88vNKnkPaAFokvdxwVJrm65vQ5VjcFiH3dAbXk/zSXv0RqaUDvyM6sayBI6arEmtcGw5VQ=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BN0PR10MB5095.namprd10.prod.outlook.com (2603:10b6:408:123::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 16:38:28 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 16:38:28 +0000
Date: Thu, 24 Oct 2024 12:38:26 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 11/19] Support USDT wildcard provider descriptions
Message-ID: <Zxp4AmW2HB8G0CBd@kvh-deb-bpf.us.oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
 <20240924202554.7011-5-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924202554.7011-5-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BN0PR10MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d4eff3-0043-49a2-a99e-08dcf44a49c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wU/RqT6bPSrw3cyYs4nuec0coF6Y/Fxe4Tm1H+FOOSHAxso99ALn5jB17qYT?=
 =?us-ascii?Q?7m64QQsPQBKpIpP2Ru6mV2awFN/vX2PMLOI11lQSziadBkJSMBwBMOaPswOC?=
 =?us-ascii?Q?+dTxSQIKU7XL4/O/3eaKVfpaOKgmcr4sOuOT3os7fimmvfE/bVrY9mng3nH9?=
 =?us-ascii?Q?DKVfjryfB97lwlj6N3S8MxlHnQ++USA47XlWAUydZ4qLQBOCkk9tK3isG17c?=
 =?us-ascii?Q?lZH+Hlif/n42GimBZrcf5JRkLZsIc+m+vb9BwB3w4GJYDn4v6fZlDghdP+z0?=
 =?us-ascii?Q?5n9BpNFU/0PmO7ex25+Qd+yNtUerujkWDggOaNEXWrAFRUVjX8lnczpxGE/w?=
 =?us-ascii?Q?8D8s2q61/K++IL8i+vZn9z6tlRR0Uj/Jq0K/Ac4FV/1/4UzuJOM+Wf4mDh4M?=
 =?us-ascii?Q?wLl1AzsnGhblT1eensiGKOP69DwCFpHhmwC1pDt5sT7+4m0SmqUKgqYRaJXI?=
 =?us-ascii?Q?WXHvl0e3UKxAlV4m1u0RBv05vdWssVFJI63kkv3Tdhme/NNH/ggPEdiLQdaQ?=
 =?us-ascii?Q?Zm+/TPyplWwnL5eE9PP1ODND7sXAcO585Dp50Yt1VFjj62cxKm0qlqX58vm1?=
 =?us-ascii?Q?HvBSUtklhkwG0C1sDQn5bb3+nhOKKSK+YSSX4k0xltk0m1n6Xi95CDiy5NsH?=
 =?us-ascii?Q?fUpGVyQ+wDsgOO0vrZozT+AzIO56xM9gTA9JRQq57aYmSXPD5NLqhFlJ4U2t?=
 =?us-ascii?Q?aIAjMxl5zEEdSfBZJcYC/g6e2pdESI1MXmieDo56Wa33LSjaKXIQEaSt0NJB?=
 =?us-ascii?Q?QvMESdN9CgMOe1OVp9K19+QLsv40A1eVGfhE/Ti5i0y7HTYbxyObSJgBVOcg?=
 =?us-ascii?Q?9QiHDtdo98pE16CBjjWAwoIZYA2TgfeIqsaQpMa8tcg+wMaNJ10JpzwK/wII?=
 =?us-ascii?Q?lhoPSAGD5TLyLqH2ewsZDlxEM2n8BSQKwmeh3cUyQ0falYXACmfbc8YSGuLI?=
 =?us-ascii?Q?06iudrMr64czXFK/kBySzthhPTkVqTPM0fjRVIWlszsoDVZT61U1DJqhSRTi?=
 =?us-ascii?Q?v1wM6jn9tIq7RaalV5o4zGAh9/0R2cgdEwRKYr+fxVqbQTAQ5HJ0tiZm2xsZ?=
 =?us-ascii?Q?RX4baIbtWtFlgRpmPzxMQviToOuZo5Id7TrogfhfVqLIh880pyMP+SxajrT/?=
 =?us-ascii?Q?cjXNNK26NQ6aINZYwM6ze32xxViXeVkYvHxGjNt8c0xHgzVZZIiLY4Mg1L+Y?=
 =?us-ascii?Q?+4BWNHAyvL6yitqmOqMSpM1df181MVkpB77OLaMC2NLMac13TzKT+g+oMkFy?=
 =?us-ascii?Q?kCcnjZ2SvDse0EnUsCrvsEq36D3sZ0bP01qxSErlMzB0Mv/QY0Altx23L3Op?=
 =?us-ascii?Q?nLj41X73RHP3VVjOkruIvyUY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SSfnNvGwDYTIdfOS8nkIYJTtSWaJ5yEQSkc/lrukoQ0uOm2AMCHXbjhdf7Ki?=
 =?us-ascii?Q?U0bymmUqSTGi17wlhie5D2H/pCurcRWBuh8hsH0VDCmDy8wZiiO5Mds/wtus?=
 =?us-ascii?Q?/QkpDxJTjF9JbTDm1RbET0SoP2GTDd493eToFH9+mwmMMLy1LpgAQhqNsPc9?=
 =?us-ascii?Q?OWhbZP5r5H5Xf/83A97+UoY4ApEykucGAHPa2RSusI44TBuGPsDCRCUmx4j5?=
 =?us-ascii?Q?KFb5GQ5XWrC85IYKfmtCTjhf+4DySi5uRWx6hH7XowRSQlM423K24JHdhh2a?=
 =?us-ascii?Q?glA7i9GxzX3qUiR4qLVsETu+fmjt2XSNgw6wb1wAp5XXCrSYxy30VDUAsJol?=
 =?us-ascii?Q?NgcTRzxzNUPRJIxFeanmIb5ekaPLpsqPdmgyOo41qdAWiWRXq2KC81eB19gv?=
 =?us-ascii?Q?q4bkonuRh6vvdOf/UCE/utkfIv7jxwKrK5lX+DAYTi5e6f2vOtoOu8WDUGMF?=
 =?us-ascii?Q?b968k84R1eaai0tuFelgKmBjRHG++oImlaSyBYPsTNY3eUwWn8TQeP8mjJU8?=
 =?us-ascii?Q?d+g/8ra+Qv76nGCIHJAa/iXajNycCppyiU6jhG2X+r6e9+y2/9tuVIij62MA?=
 =?us-ascii?Q?WwPUheGVPNtfSwau+w3Httlr6P36xNIXvmJBb1inREgGl2EXYEOdC0uFOPjz?=
 =?us-ascii?Q?rStWWLbVtRcTnCHqZUf68TLnvY3YDYuczqSPTrXxxTwE+keo9JfThKrYG+fw?=
 =?us-ascii?Q?5JXvzmrwAbGITqCw+ZuDyfY5HTc/klUJ/eNDSsa4By0S3AFw2bDWbQSjEBsr?=
 =?us-ascii?Q?fFds4+xYi1MjkjMCPWZBJJd1A/UxCkuyQooGpUE2DfSzfsqtyAYXbEhOMNSL?=
 =?us-ascii?Q?wg5Hrh7O7LVwTh95C4Cpsq8GJXy9Z/pzqAUwYlJ5tpyj7l3kSNsdrxvpNvD6?=
 =?us-ascii?Q?zNqhKHMpt8pkliBUsRfpNOyaZ8GPF4PFm/3guNk+oo6GKXi+GEgrb1SByIDp?=
 =?us-ascii?Q?JjklpFDxSmzmfBsvHfz5zQ/ODfuw3vRGRYXhHG/AYmm/oLKP/NftYEJ2yXzd?=
 =?us-ascii?Q?7AXlGgg1CzfrlRAsrEHpgMaa7F0jMUpHtSgUXV9ro5GHgDec9UbbXJWD8V1P?=
 =?us-ascii?Q?i3wQT4DSsIjbxpBDMcDIGbTIOonwpYHAzaYKMr8Ej0FLdOJcIBkooH4ZYyL2?=
 =?us-ascii?Q?qHyfGDf1fLPurW8n73s6Hq3foey3MGskl9FXyWvFvcFHZhBt1Yv/2gzaNsgf?=
 =?us-ascii?Q?z4WHu6UhX+2yc4NZZFzaxi21Mg2RpsUtv9Vp/q2cYIG0xva9gTjQbcHK9bmR?=
 =?us-ascii?Q?pH+vtzR/ioykm7m7GTvmSv1EVSHJur8voIq9uYQXCUZ07LjBlmYfibkZVZYY?=
 =?us-ascii?Q?tvBewPUET/h9NtPI4CW1kbLMnjDG9QP9v749s5MK3TpAzI2ip1bi4fyWSfyx?=
 =?us-ascii?Q?kl7mXUc1Ry9SydWCgLqUVo11uukHdvBnjArnabtXu2YhO1NV/wN1aGatgXMo?=
 =?us-ascii?Q?7nGdVJu+Ov6ME3/SJW1iK8YD0EfKp8b+2+C/nk8K5A7mc0arjYu33KcuY1bB?=
 =?us-ascii?Q?6vtBaeaKADqvm/sswpY6JFgdn/BXN9BHtcLu6NtWogU8jSe1uWXuB93v/Jds?=
 =?us-ascii?Q?NvT83+Xe3BZ3YX/Ykag8XJ8NrKXHF1UKD/816rqvaCDKACrtC1DQTPRUS3ud?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pWlLsa0YMSv/9SMlvCIN9rLozZbqwnCB2ezg5keRjtPM36XdbFNTzTJnzfz4GXAlbMhOsSxEtDW0OPv5DCiYxGqTycvXq9a/Tw4Xfzi1xzNaqv8IsvdtWZWXAnMJL/xZh4YnJc06ZvFn5zGxhOc9ya5RTm1LMe+7H0sq3TabXMvI5Qmc/Y9S+u96I6AQc4m0a/vOrgZNvIl6nMVrvfHLb05teJ+m+pGgbbE/FsUAx1wAyZwx0BvBSympmvu8wigDIwzXHuIAgQdq1rIK2dUje5aoGos9Pn3aJ4Gx65HFJUsiuM5H79omcI6c/vFg1raQI8t+9eqjxn88EfZzGjBfRB8lYqJXeQkYj/1YEXKGBHQ5Zo79vYA8iXpd/A0xMlmnS5UfSM8NEgfPlOXUiLdUepPP75bGyAJZSO3S2cyxBkfvEJrWicnaTiE6Tntu1tOi8Om07zmgCyJRGd7AaCGFwY9hArukcy+KrEayV4sPhe3mlQRpL2/g6PH18Kx6Bxd1fNqvqL2KfyDPNpIFebU+sOy9dsQSdokt/YGaUUSAagZw43v55ii020GsrYNB1GMT2qo2i5fNrSuRHfI2QnG31wWyuUA9zgNvDYsJo972Tpo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d4eff3-0043-49a2-a99e-08dcf44a49c0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 16:38:28.3501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFz82ba6vm5AE2p+lsKclXkFvY4exm8mQUeeaph9i2aG5atHAb4qaBaAzad4Vg/9DRe4ilrChLLI8TOWGVP8CywV5OC/4ZCHp4KVyVQZo5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5095
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-24_15,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410240137
X-Proofpoint-ORIG-GUID: ByMfWRn1E3Mw4LrS_Upek1A-M9634m1g
X-Proofpoint-GUID: ByMfWRn1E3Mw4LrS_Upek1A-M9634m1g

On Tue, Sep 24, 2024 at 04:25:52PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> To look for pid probes, whose pid values must be specified explicitly,
> we can require that the provider description should end in a digit.
> 
> For USDT probes, however, there can be wildcard descriptions.  This
> includes a blank provider description as well as a description that
> ends in an '*'.

What about 'test*1234' or 'test*12*' or 'test*1*2*4'?  All should match
'test_prov1234', right?

> So, in dt_setcontext(), expand the criteria appropriately.  And
> modify dt_pid_create_probes() accordingly.
> 
> This is rudimentary support.  We still need to:
> - handle globs in dt_pid_create_probes_module()
> - add process monitoring / inotify
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_cc.c                                       | 5 +++--
>  test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh     | 1 -
>  test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh   | 1 -
>  test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh     | 1 -
>  test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh | 1 -
>  test/unittest/usdt/tst.forker.sh                        | 1 -
>  6 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
> index 12104fc21..62482a70f 100644
> --- a/libdtrace/dt_cc.c
> +++ b/libdtrace/dt_cc.c
> @@ -273,8 +273,9 @@ dt_setcontext(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
>  	 * On an error, dt_pid_create_probes() will set the error message
>  	 * and tag -- we just have to longjmp() out of here.
>  	 */
> -	if (pdp->prv && pdp->prv[0] &&
> -	    isdigit(pdp->prv[strlen(pdp->prv) - 1]) &&
> +	if (pdp->prv &&
> +	    (pdp->prv[0] == '\0' || isdigit(pdp->prv[strlen(pdp->prv) - 1]) ||
> +	             pdp->prv[strlen(pdp->prv) - 1] == '*') &&
>  	    ((pvp = dt_provider_lookup(dtp, pdp->prv)) == NULL ||
>  	     pvp->pv_flags & DT_PROVIDER_PID) &&
>  	    dt_pid_create_probes((dtrace_probedesc_t *)pdp, dtp, yypcb) != 0) {

First of all, I am not sure that combining pid and USDT probe handling here
by means of dt_pid_create_probes() makes sense under the new scheme.  In fact,
dt_pid_create_probes() may no longer be needed because handling them separately
seems better.

Then there are two cases:

 - For pid probes, a provider name must have been supplied and it must have a
   digit as last character.  So, for pid probes you can keep the original code
   aside from replacing dt_pid_create_probes() with dt_pid_create_pid_probes().

 - For USDT probes, there aren't any restrictions, other than the ones already
   done in dt_pid_create_usdt_probes().  So, a call to that function should be
   done here without any conditional.

> diff --git a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> index bd0552dca..99ae995eb 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesFuncUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> index 7b9c6a5fc..5ae087fbf 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesModuleUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> index f9b1d8bf8..5c0509d89 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesNameUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> index 644da2ac2..6eae82ed9 100755
> --- a/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> +++ b/test/unittest/dtrace-util/tst.ListProbesProviderUSDT.sh
> @@ -5,7 +5,6 @@
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> -# @@xfail: dtv2
>  
>  ##
>  #
> diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
> index 7cfa9eb5f..92513eb5d 100755
> --- a/test/unittest/usdt/tst.forker.sh
> +++ b/test/unittest/usdt/tst.forker.sh
> @@ -7,7 +7,6 @@
>  #
>  #
>  # @@timeout: 120
> -# @@xfail: dtv2 USDT wildcard
>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> -- 
> 2.43.5
> 
