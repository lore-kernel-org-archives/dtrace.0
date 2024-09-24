Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03048136328
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727209590; cv=fail; b=DWb3W8BBBHEDj69jl/EVscSx/d26Hui7Ve0aHBLqdCRN1YelIWvrurkaMvP6B8gym/C94dXkA4Uz3JXZNfnnJgDu4IRpx8SXFhdtEHhc3FyEnxptfcsb4NuO33DawuNIvd/rHSsaG6E+1Dv1GA+LVOcx8OEey7vnZhI0zOGs7aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727209590; c=relaxed/simple;
	bh=Ur70aoGua8iPEiOlHC4vW3xHYcr3bTq0iKB4qogeSrk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NKGTHeqkEl1ddEnJz14FBVXzorpJqoJvAUuxYG0vdNg/CMvg8wJvXGK6O3EMz4dtsLU88AgiExwrxrEqCh2nTiBEzVtqXAq2bn6SsNZ/lMfJ27Gs239XJ/G5zN2HGAoUibLGy+xFayE88RfPG3jwAHO72fLFx/VJevYEvP9J7Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hVNyp+dP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U9z8uG8Y; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hVNyp+dP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U9z8uG8Y"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHMYId008656
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=/QU2OmEtVwdzus
	e6oZwbLO77YLf1ric7x6/pqjIFAr4=; b=hVNyp+dPpfEHk4NK/G1L1iKQ2jXgyS
	NTvfAIMjvvErfuEyKSUSRxI98uOZoIEwhEg9/7MHxLBQSN7xxJHA+EgI9Wp+PrBi
	bB/zOVEonIpo4ypRJM3TbjlAOTGeWMii3QKQUlc322M2VB0ywwEqOoPXv13Eh2mb
	ZHf2qBaw/YHnEV/ycabNT0KmQ1FqPS4lkMyiTTGYchTr2ETaWCNk9ok0aWdOblG2
	TIC86v/+Q6lDkJ7AfhpEZllJjx4+5LNFrf6dJ4mqAZ8/bCusqT6fvSqdELuaorcr
	45CXJcKBUdkYed6MxhmLEtZXlH6PY50JBHtuRBpG0k/opNrNRhw6u32A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41sp6ce4vd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIpLiD031285
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:26 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41tkc6bsjk-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Sep 2024 20:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tvamtft1bZRpc/4+dK/vBAbYEq2P6LJ3EVio/kByb6kj79lJuBs0Se6xIP9o5KRs4lCfMb2mATRSk3KhDiGSWq54TOA5mwKkNehrtGx1arIzf+1y10x1Uzlra7rT7RjrhMaCcsefUFuMBLr7g3Ps+q7/lbpUWcMJjizOMO+II/YAtjHDwQEGdalnizMBMWK4idv5c6mFTkZvXQ3QLPalohA5gOU49vhXYtXJFV09IIIs3Z+W1sy3ecGi41fb18dpD0jDYle4sOny2aYgoChStRM6jY3evM5ZnRBtzKNMgZBy6ekUQjhFn4zZSEL0ScP46utjtI7u7/B2bMHPGXn1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QU2OmEtVwdzuse6oZwbLO77YLf1ric7x6/pqjIFAr4=;
 b=fz7HlLudlyiCtw/c1OSA02tP4eumUCNC6V7Cy8oCujFA6yXnuHGgO021b+yzVzs974srFe5ssONclGtENl4W8qsHrFVLy/3OJkbgmVTWQZNAgNaQU/SyhhaCAFWyZvKwheEkV3d7YBwRU2eWl6IcZuMAm0RKGHksFtAUcyNs3jPcGuI/nay/TRiRyBx//R0xC6vVrxrE7KmeB+y8KkRzTg/uhWzVcxM3Xmy3C1re1eNopHddKGgg60PmmStKvfgBZpJqn1qETACZnA7+DSiE1YQi2o4HSIzfi1YGegxINlnl8Yp89Exvm1XxVpI0tB96M9+cFjBaEZIYwJV3t3XTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QU2OmEtVwdzuse6oZwbLO77YLf1ric7x6/pqjIFAr4=;
 b=U9z8uG8Y9uUVg4WP2w+c26rFGTm4q7xEsb0wBvWKZePEB5kR2hbR5qM9wHGgzYYfP07B9reV7yPj6rntWh9gdNjIaX8e9LLei20bQ3ybPAc1Hl8RqG7OZvzK583fxbudt1Ps5Fxdh2zuwJI12fMSOa/E/tdZ2yKQJntP765NUzQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7269.namprd10.prod.outlook.com (2603:10b6:8:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 20:26:22 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 20:26:22 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 14/19] Ignore clauses in USDT trampoline if we know they are impossible
Date: Tue, 24 Sep 2024 16:25:53 -0400
Message-Id: <20240924202554.7011-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240924202554.7011-1-eugene.loh@oracle.com>
References: <20240924202554.7011-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::31) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: 899a0510-7023-426b-b708-08dcdcd726a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bsoiQOrD0uCqGAGMrOqY9t16e1Ai6PI/olcHuRxPe7MqCegjawAGgxvPSz+m?=
 =?us-ascii?Q?I6MEhc1zTcn1qzphKnLa6eb43imlOdspMdYl29rYNvuu0RMf9V4y5lm6dKke?=
 =?us-ascii?Q?rMfBBMuSIp2vDgE5NJhMzV7Bu/2pYy24o8G0jY/dCPss/Uy+WXcuos7+CndS?=
 =?us-ascii?Q?wS6j2sJFaoMq1APrToyE6rLo6wjhh4vJvv4qx/j5Yp05jZI2bOEGiuWC0bw5?=
 =?us-ascii?Q?uLDU45SjGwyBStTXE/Fq30o3w1PSsJU1oFq0VcvBDun2/1Wj1wj9H2VfsaDD?=
 =?us-ascii?Q?7QKoHUsOCUnj186dpZhKbeTlJlNSCwJQZxiptYqRoxo3vdCPOARlSXjKkrXF?=
 =?us-ascii?Q?mEDiUO3obF5uOVnaKERpKXS/EiiEOOQ4j1HqAy81SE/AhAEXFYqu4nzOV5k9?=
 =?us-ascii?Q?KJQBLX4GU8gR/e5e4maKu/jeZFW41CIwg1GhuRhDcKn+kTBbwotXcHuqgYoL?=
 =?us-ascii?Q?jTGJA81Sia+Kk4I/e5kyYPXlV6WpKUkRVtrUdE1Za2dPm+Sb1cBojnCkFPVV?=
 =?us-ascii?Q?vjK01kW6EfvuMABZ8txTAD+qEnEAIIMTRr6/1xK5G52M4iAe7FVSF+3CPUhk?=
 =?us-ascii?Q?yiNIRUhL7mFask5dweap10iQDNGaIp7/XSx1O9mfUjEMn3hxtssji2Aqh6C4?=
 =?us-ascii?Q?/ifqMVWcBrcmpA4p5NKB3/IfK5QtQo6xM3itQE7xDO/rk2oVCBHPvklrKNr9?=
 =?us-ascii?Q?Ga4EHi98qZ7mKjp5qosKPbytPfd7pXl4PK0iMfEfS3FzfvlYP9jr0zehjJdK?=
 =?us-ascii?Q?7P5wgAjyXIQ3jR8OFHD4YOj4LQDsaILfWY0AmrVRo58B8DWqHItWSIU0vstj?=
 =?us-ascii?Q?oxnfRLqAcSIPJsMuxF0O7JbUi0EmyG/eXU/ievc3m+7ZMOjq+HLT89r7+LAl?=
 =?us-ascii?Q?V59oBxryqUOgyF6hMP2SBcSzS1skxVj9AdqdkqaJRP2z+ns2vXt+2A008KY+?=
 =?us-ascii?Q?jI8s0TZo48dC1Pwzbe54b1BdbITqbLzegECDyogCV6l8+EvtDO3Vh+mIt9aU?=
 =?us-ascii?Q?/JLCVhgVgaJOnz20wLo2RHZq06ugiLuhbZruPx/p+fTWDSXkwh0pF0TF4XiX?=
 =?us-ascii?Q?3cWm51y0TqqKLrQZMJK5VYO5U4fnZgHmzDJ+Y/3f2kt1VbAe+V3h9hCw0K/U?=
 =?us-ascii?Q?cECKpF4EhoP4wMPQAF+zplmsAMYYapC8PeMI/Z6u9kVzVIHUqQfSlw9SFNvX?=
 =?us-ascii?Q?UcmC0sxDHb7iYPleRTVliqsveAPEkD9ZUyfiZNZJ0/uqsa7Owb5P+Ku3Pc2M?=
 =?us-ascii?Q?ib5mLdd05Y8L6wjD76tfYXF312iss2e67diogVZaJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u+VL00S/1kHueVdju1xc9oicxF2rv31UUozWy77B17wujHUW62o+rT6CzlmW?=
 =?us-ascii?Q?/Oj9WVoYJjZ1h3jU+gTBhnP/usSe44yKTihILyO8gfxQ3N6QDSydbZYlGw1t?=
 =?us-ascii?Q?ABi1RdXAKEMHmUZEkDKXK1v56jVRziHJF3w6a7sSu2hUOWpaslBKn1QcIfN4?=
 =?us-ascii?Q?rIfq5t+OIRFZfW5oR5+oDFYtnHwZisykr/SGIs0wnyVDa7cbt+x3MP2SxWtP?=
 =?us-ascii?Q?/QFLHAd/P8bGV/9KZexLFgzynJaz2EEh3VsNliipo7+eA9VpLUYzvxBt27W0?=
 =?us-ascii?Q?1/4tMnR3Nx10xGytPsHCzF1OFg4epDZDiY/a34dQ+4p0ugQ5VovdxJFkotIO?=
 =?us-ascii?Q?5tAZoWhlzZNWCQxGJ7/X+o3XY+78xgZEwaCiXEmb1bdlTLKpqkWSPfABOZLw?=
 =?us-ascii?Q?CXQZ7ZJ3X/UTy7AwNJV03AJcYfTQzxFnvX+UlkoaJyYDBzpmJKpA+Ol+gM7+?=
 =?us-ascii?Q?u5pnv06P5zX17SzIrAkBcRn8FvQw/oV9vSQht125u4mke0kx/MLBNSwsjOwo?=
 =?us-ascii?Q?blb1J9fJhQzLXQihd+Cml/o/3bW+onGm2fibVAeWNcrT4XWXEshRTR9zaHUT?=
 =?us-ascii?Q?XG6IqIR38q0NlKOY2o2TnclCbVjWtiGt5CDZMTD77m9o3LiLiLr3ytgoGwM6?=
 =?us-ascii?Q?fURc77bdcRfU9V29P5xAN1FGQV7/tUP7Z5rtWwxX5OaI74RVLIZvg4nw8kev?=
 =?us-ascii?Q?1p9mGnLhEcY17Q7Vp+yhV7gE2pfUOJJez6JZ78SZ3flikyvtk3ilH5YLlFmW?=
 =?us-ascii?Q?IgidDLEATY8dROEMSqKxa3a4hlVppzhcxXji0G8VN4H2WJaGzxwJybqpc6Ue?=
 =?us-ascii?Q?pDFtSB7iE/P9Al48WjcSXt4SOlhtIq6gyD2HWf9Jr8YUpvMcev3sLOpuMv8v?=
 =?us-ascii?Q?JfIOulSXKe1iqP4P12uz3pnWfThURsjhr0aVzBclPJZHrYr8MBPvFOG7LdYr?=
 =?us-ascii?Q?i27m9AuRakFncf62GSnmtiKvMGTpkiXIu7sHAp8OTVOltH9bmcpp4gyUnVMD?=
 =?us-ascii?Q?oWvRwLxM/GCQ1D9DHWE3b5ilGok58gAU3lX63NfxYYlcK22OvPkwPMw1g3jJ?=
 =?us-ascii?Q?NpI7AJONPy4gNabeu6E5/8ah/z4GawmQmmYNXIwmO16ko28lj1vHrDI7bIfS?=
 =?us-ascii?Q?GEkJW3LZ5TZD6A8PQKnmWznIzBYjOSGuspaxrzd2Y9AlHcgPfX4alBrh5K8h?=
 =?us-ascii?Q?5m4l8pSVqZ9PD9JeN5F8xMDeP6JIFb2sCjaQhtryTFMJjW3Ln6hU7ja8Oefj?=
 =?us-ascii?Q?fvx9XuSpbAVx22PNN0WmFo2WKNk1LTMlC1hi4NqRTdxCkDVv8zP7Qtf7q6Wc?=
 =?us-ascii?Q?2Zl6CHxMJ3jNgyugbjedtF8zHvw5p83sYwxvkWBlqpm8B02+USb/o/VHHOQW?=
 =?us-ascii?Q?MjGEQPyTU9iZUunthuDcSLL0/hS3VItW52WFc+0utvQ4Vi/7qeDz2efPJkrr?=
 =?us-ascii?Q?V618xEiPTuc/4sRXoZTj8A335RWsMsyyukv2CmwgbVPNNEWeWH2MZFdKOLBW?=
 =?us-ascii?Q?mQG8+v1rYkw04v8fliowX39C7hWzIc98vCK+CoplqkG2cqUGEe1Xx+HOhTU/?=
 =?us-ascii?Q?6YGUlCtU3Qp2ad4dvfEzaaFB8oRjxIucoLwQIPnk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+2GCsrEw1OdSIeMEMeSwIEkw1Gw+I8nWp+wsXHKTf0x0TK3A7wVExP25+Rm6zgsFY7kI/v7VHxJU7kkAQFl2YDNuo+uQ9xtS5gLExd0SMR+gu0fM6Cj7oDyBlC0EmKcHuhDD7FGtvBO7waS13ds7Ie5iB9KabDlvS98bH+8GvLPMPn7PqyDZBCk2aEC37AA4HJOdbE5jY8nsJAMl5jccxL9Je4dwD/hKuP1SBqgIhMzraGHrPs13XSQCrz/brva9Mi3GTCywzdm96sl3cqwbrlOT9/OhatQQhxCGNPj2tlse9ERWRumFBOcknTpZiLONC7UG7rUSaHAdSALL55/nlXynNHl1pMwNWepuItH2C8nQYsxh9JGT3rVg4yE1anV67seHb2W2cBoi17iPnhEBt51+UkFKjU9FxdFFSo7raDMk/rh5P9KkoHmy5IMMG/zsOFls0/n4PlBDO0YKEn6b792vydRNdVD8vqdiGppTz0ENcnUAOFCkn3WHzy+5p9paxkBNojZuIekIODNviR+OLDX7hN7Sua8BE+HAGcwmNWxa56gHpl41V6m6GNJEtI3zrdtIGc0F3Fz4L9KBTlVmwTqkKzAQzzi+0jegl6/W6Ek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899a0510-7023-426b-b708-08dcdcd726a8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 20:26:20.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3C1Ed8jbaNmr28/F4w2wg2mwjhfCtFE/VboAGJUs6uIMemYN8/K3WqJW8vN7keYBnCLvRlWcC1t+wEoHHWw85A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409240143
X-Proofpoint-GUID: D4_KXpJTB9UyP_mfRcSyxB8bI5FEHe5o
X-Proofpoint-ORIG-GUID: D4_KXpJTB9UyP_mfRcSyxB8bI5FEHe5o

From: Eugene Loh <eugene.loh@oracle.com>

An underlying probe might have to call all sorts of clauses if new
USDT processes start up.  Currently, the underlying probe trampoline
simply loops over all clauses, deciding whether to call a clause
based on a run-time bit mask.

While this approach works, it can mean, e.g., that clauses are being
loaded unnecessarily into BPF programs, bloating code.  It also means
that the trampoline is looping over unnecessarily many clauses.

Meanwhile, it is possible to know in certain cases that a clause
could never be called for a particular underlying probe.  The
heuristics can be tricky, but that challenge can be faced incrementally.

Introduce an ignore_clause() function that, for an underlying probe,
determines whether some clause (denoted by index) can safely be
ignored.

The same ignore_clause() function should be called both during code
generation of the trampoline as well as during the construction of
the bit mask.  Further, for a given clause n and underlying probe upp,
the function should always give the same output.  The set of ignored
clauses should remain fixed over the lifetime of an underlying probe.

For now, conservatively, ignore_clause() ignores nothing.  Later
patches will introduce heuristics for ignoring clauses.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index d08bd2e14..51ad3b55f 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -232,6 +232,17 @@ grow_strtab(dtrace_hdl_t *dtp)
 	return 0;
 }
 
+/*
+ * Judge whether clause "n" could ever be called as a USDT probe
+ * for this underlying probe.
+ */
+static int
+ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
+{
+	/* To be safe, ignore nothing. */
+	return 0;
+}
+
 /*
  * Update the uprobe provider.
  */
@@ -358,6 +369,9 @@ static void update_uprobe(dtrace_hdl_t *dtp, void *datap)
 					stp = dtp->dt_stmts[n];
 					assert(stp != NULL);
 
+					if (ignore_clause(dtp, n, uprp))
+						continue;
+
 					if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
 					    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
 					    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
@@ -814,11 +828,16 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
 		dtrace_stmtdesc_t *stp;
 		dt_ident_t	*idp;
-		uint_t		lbl_next = dt_irlist_label(dlp);
+		uint_t		lbl_next;
 
 		stp = dtp->dt_stmts[n];
 		assert(stp != NULL);
+
+		if (ignore_clause(dtp, n, uprp))
+			continue;
+
 		idp = stp->dtsd_clause;
+		lbl_next = dt_irlist_label(dlp);
 
 		/* If the lowest %r6 bit is 0, skip over this clause. */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
-- 
2.43.5

