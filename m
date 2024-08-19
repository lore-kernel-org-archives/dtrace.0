Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F983C6BA
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109312; cv=fail; b=hEwP/UuFay21moUCdkDPYu4SQIg5LHeXwa5CdSDkqLCvQB4O5fVSVQUr1B/w5ZCvEL67MUh2EdghVsIImzi9IHqN+CxBWXs5reU2I8yyEsLXKBr4ir1ftcFu5/2e3SHJdNUkI7HhuXCzeKqqUk9BQKReHi41mOFy2O/ZraNzJJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109312; c=relaxed/simple;
	bh=QniL/7GbbLJsny1E9+3jTteeeDNt1hwFgyGiGXaQqMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PRNqtl9YxyFSeBzsl7gQMVMywweUQPos261NWr0YPwhaXs8iPsxxR61997yH74s017wq+vxQcLwRiVA+eqCikHmppwYDgEgP6FTTEC+WgnypmPkCqrlVCzfFoVvjRVPC0xZ9VBQ6hDjCnBA5zqfUgiWo1gSLhm1a34Gn+Z35Fdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YRowuibI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=unG4QWsl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YRowuibI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="unG4QWsl"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKHTU022332
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=IuUF1hAaijFImFU
	LDL5XZPntIjVcY/bCNfD/dktfrno=; b=YRowuibIxkRiC1+lVAkZsT5SnikFOhq
	eoN+CcuEocROvyVerDhiqoXjzxcHy/3t3LCEAazOYFlSDGbM2f/B5HCmjc4tutUs
	awI+GzRSRTOUTib74BGyFLWu3aLedARixV34ljxX6kJGU22qZlYKmDR5b0mdW1Zp
	EEB/t4Zsnmbi9OA8YDA+XlHKUqtYaKsd2My0eAonz0otPTPqQaefe7L/lHizp9o8
	Eu5pB/NQTy/gfp7capDUd45w4Oct+m5kQiI12Gi+rV1NSaXWzKh20NtzhTaHRFZK
	nFTdCXgMqF5kk/7ZwDfmyfJ4lI4Ve69NU3MASejkFncdSQq/ZHnJtcw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3dkuru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMx6HO027567
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 414faw0dam-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBRmFLUXEGD7u4pWK7qOIoydAomvOjE8zYcum77RnUyAgENBYwmRelhxZwgZbyDi6VnLMuE2C5pjdFRl+gge8zCKgEaMgVofkbGegkQpqGSbM8H5jX+EN1644uuJCZgreBQfy1m9EkZCdNCzidojBEwctYlowxLGGL9PpVdUZlgtUuxRoYo0lXVs4qE9JdC8MXWyleGHc24ugpRTI6t7rK1NxQRO/kuIKMXmfRTtwmXWrz1bMxpY6ZigLNe30A4nVCEiMXc+eIbYMilwn/YWe45z+jVJHUdBZ9BizSr+l+/wfrzAPDyhlzjHfSobAITNr80NJAmgt45ez/oZNr30Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuUF1hAaijFImFULDL5XZPntIjVcY/bCNfD/dktfrno=;
 b=PrUyV/ysVt3d9H5G6D4A9fvjW+9MWtzhiTkxEn8o0V8ljrmQVJR0aoMQ7OG9EOZP0W4sqZVfUC/rYcWnOlfk/Nz/QPKoUkA3cbW4tviBs1tmrWDpSekOVuXTqzImLtRVWYqXdwAWtj16+HY4f+ZlSGvJJ+Ck0RYG3OSjr8o1/IJk2Kacglj9WzF2u9YhOmXHAsCntDcXUiUhYIqXQxKtulNn+YMvCsjf8bZIuo4QFKhDCN8IqDZsnMJ3Wh8AtCrdw4Rfo1Y2436lQBdbw9SGUGC9NfUY+T0BfK6NYmfvsaGC4TEp9bmtcnVUhz0POdxCnvy28Ikkr2J/n3PTwDRy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuUF1hAaijFImFULDL5XZPntIjVcY/bCNfD/dktfrno=;
 b=unG4QWsl5h2hL7s4sTS5ZDlUffAspEWIII2u4dADvGWJm0604ykEuBps0jhQcgcLFkDEnSEG9OkG/K13UZZfEhDOp67T6o3IAV3uHdvebM6HvWFCPK0gJbo2uNJ7DrIOP+Znd2MKfouITar+zG8jOzOEqgNAZb8kRdS4eSPweBE=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by MN2PR10MB4269.namprd10.prod.outlook.com (2603:10b6:208:1d1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Mon, 19 Aug
 2024 23:15:06 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:15:05 +0000
Date: Mon, 19 Aug 2024 19:15:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2 6/8] test: Check dtrace return status in USDT
 tst.forker.sh
Message-ID: <ZsPR9mTFKe2jAfqW@oracle.com>
References: <20240627052516.21220-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627052516.21220-1-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR12CA0022.namprd12.prod.outlook.com
 (2603:10b6:208:a8::35) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|MN2PR10MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3dc5e4-435d-439a-85cf-08dcc0a4c2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pyNcyRedt1nrsh/ATlERkB8/kbOFGY2NI6pf9H4/770Cyuv+JoK84D1ZzKz/?=
 =?us-ascii?Q?sMDlAZOKSXuLI0slAb5EKh6DG/aV8VSvoVXUhqu5k7aiyNje5Fi7Sfrv8v2c?=
 =?us-ascii?Q?f12LhsCk2IrGuaamgf/GlXunlm1tOFimdmwU9dv2X/yHycb6iBRQBHhJplH5?=
 =?us-ascii?Q?uSEbdFAJvytwvELhZ4hhMqZPcrDkXeIypbpEnu40SaXKWqo6L9sHwkGcwqUv?=
 =?us-ascii?Q?+cPOA3cOxv+t6UzMhLMqKSh2PPOPpT18Hf52FYohAeinWv2BF11QfcbgjlJI?=
 =?us-ascii?Q?T9XVrj1rqQ9VzU5FMPLpoasdeQDvIv6rmBTbEtqS6exy9AmGBZtz+GrFq6wt?=
 =?us-ascii?Q?pONAxHmCUFcBHn0gp/bzasesCahb+XKdzB4yPbwB3e7m3g4NCFWXpOGT6jZk?=
 =?us-ascii?Q?ASVkANml26SWIPqxGKM6Y9WTdforCvElCg7cOjH6HZsr2Gq+B499TjpRU3pu?=
 =?us-ascii?Q?cmmE0cre0cZbymhpd/A61enLR5tklRCyY6LZAj7+TzYoa0q3WzstjoW+U6sT?=
 =?us-ascii?Q?ORbZnEKPAl04i3JH7MvvdhlknVMhaRVbeS1yk/sfOwkQxvC5o1rAZRvH20qN?=
 =?us-ascii?Q?+k1Z/03QTJNXhBamdbzeluw5n0D2G2IaZ2WdQvX4F2scGjoCCXpIL3AFELO/?=
 =?us-ascii?Q?TEXQH25JsyHIc6ONMOQeAushXqlPS9Hibt9K7LZ75dJh4beW2hRDfLN/JoOw?=
 =?us-ascii?Q?bXPX7qJ8clprLQyfzoj5yHvyTfB1D5MZgT9xDiRhlk66XpgTQhaQxy/XOsuj?=
 =?us-ascii?Q?K/+yH3QpH8FtsRoBoAY6VBSsai1rvXm/8QXYRWk1piD7QremXNS4PKRZUxWP?=
 =?us-ascii?Q?m3ocinihGQfMNTXHnUIyDXL6mjeWLnjPlSftJrfe7V8NhfjPGSrYZ43UtSib?=
 =?us-ascii?Q?qQzZJNuv6ww1ErJDoTn8Sh8DxH7tl5ZuypAGIgDLb2w1XyzqT/gDE3Azhb7u?=
 =?us-ascii?Q?gx1yMAwZjJWMcJWIcB4tZIVrFhoIyv5eLGX8Ox0E+RSJJO1bSLddwH5LzF+J?=
 =?us-ascii?Q?CQ90QmwzxXDMNNgCFcRuzz+lGctFaIdP79rTf2bFe+4QKdADiAJd55a4k/Zt?=
 =?us-ascii?Q?PkUhKWnwLtub9jZrw79XIHEu6Wajo7UgzK/xDPvfwQHXdhk9odppW0kjZq/A?=
 =?us-ascii?Q?Yb+50xaFrenunuybNyOg45drUF6FfYyLvNNT+pwdrOjKxQYoO0JAOEXyqWIx?=
 =?us-ascii?Q?PxGe5zdxBmolRuxEOjrgBazwUfYjPGKhtxzNFWJnHDPkmng9+AKFWZS57Z1h?=
 =?us-ascii?Q?hvFiwIaEQmCNIysf9mCZVJwmvkjxaw+zQgnNRLOH/ti8TsFooN6bb+u5srds?=
 =?us-ascii?Q?XVg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q6ZbrfwWKLF1XaAfCcMGugvkxsFhuUUmzMaUsBZmy0R0S14oZvxLyDYQPuPu?=
 =?us-ascii?Q?BD5kAOk34C9c8QGZt6bnxUwgt3+uOHw9KUJ6mLg/z1rz4jP0X+aS4s2kS7a4?=
 =?us-ascii?Q?9dtZRI2hPauvo7WOs+E4SuiUZ+jhxVC5g9USmGhm+GlJLZ8q6YE/MEdv1RKu?=
 =?us-ascii?Q?NUUocpxSpS/Zv8OQo+3MBRuLhzZ3jzS+0861L0Yw1IqXxXcOuTgC5Jzhr5qT?=
 =?us-ascii?Q?HK1zzzZKsPFNEYHqDdyO3NmjfV0aH1QELrMzrQJr/VXQKnJiv57esoMkiQZp?=
 =?us-ascii?Q?e8PrUUmA7dCiAhCwhhbDQtUsuIQwVoReto4VP+T1O4bDkwv8r+eaVSqHBojz?=
 =?us-ascii?Q?JEEiQSpgNggWl8Q0a0E86QxuOnUkebQBoNj9WwMzpEUEoo0GBHUzENfGaCml?=
 =?us-ascii?Q?1BzwvtutxGKHkmUJ0Lfcifa34is8tr7k39CPFjhsIWBWD2TnJw3IPBzOgBoY?=
 =?us-ascii?Q?hzSRWFl2G/+e/IWynwfQknxqhkWvOY1ShnJTnpQi8KhhJmcBxpbFL7VleNKv?=
 =?us-ascii?Q?hV+1Bh8zTr+3OL1jainebvRSwDVihW8bylxs9X5JZXkdGNf8ts7SgKXdG+vm?=
 =?us-ascii?Q?SJgO94js9trt9ANWwu+ajqS9atevbtV4qfbcCP0vzhMgvcLMn2tZQkMiFNtf?=
 =?us-ascii?Q?5PndMX3zuuuwJUI8e2Oqy382KJ3iTyAjEjJtZZk+GnE4aUehaMD2azxZoXBJ?=
 =?us-ascii?Q?J3kzXW5iB99K5bFmdSActDVTDzf1om3pv5JDufLKyIekQeH3mHUHutXVh3ac?=
 =?us-ascii?Q?qu6Mje37lACPhxuLAoMivslzL10qdkWUQgwrpmWjvzCbA0kZX4zJ9+LLrmew?=
 =?us-ascii?Q?+j3Enp0bZp0omZrZQDdiAJiFm7ZkGdyX0U2ANiv+s0k4f0sLe42HUd2vZfJC?=
 =?us-ascii?Q?7ib9P998g52+GZzRQzmAv1/8gFGHzY2FiB6lUMq4j6F5b3+D2GTInlUyYxJE?=
 =?us-ascii?Q?vkUHCcOa20Jj2a3dOl8GPIFy9vuVyK4QSfa+n0mWfGIdOKJc90gCeXcwF3Tb?=
 =?us-ascii?Q?GtWqtdHJtxEUfSxRi4k0OJNEELNYp2Q3eylKI9z3QS0gAqHYgE5ifL7EbSaw?=
 =?us-ascii?Q?h1ENk6Q2f7HEoFfZY8A/3JsIzmLGGXK78/nOpQDL8cwoxgN5EcEQlZqe4k/8?=
 =?us-ascii?Q?rKf3hBFw11zh18tGHhcwln0A77da46vcCoacYNbPcIpbzZqHLaj8k6xeNand?=
 =?us-ascii?Q?lOLtzugvg6T2WAYKr8OZtG//NJkkDiL6zg3xy+8kTYf0hx5oVSnZfvXQ2IYq?=
 =?us-ascii?Q?HJo/Bo0l/aMD7O7IskyQDutJhdyFFPtCrurtDAh7fo8ucTdNc0TWSS9IOtYa?=
 =?us-ascii?Q?CAP0Nsh0C05qBK9e8RLDgWcllY7De3r9Xm0jPQLfmqxplCxQnBHgPMnjY5jM?=
 =?us-ascii?Q?FOaKFsK/Q3p4uD3xQE26jV3Cobls1urG6Bmx+vR3vw9gbIEh0bdU1NS0Ktmu?=
 =?us-ascii?Q?20/XBOrTcRo63CWvpl+aszNd+K8zMfxA1Vah0qVOi9P5BIRhniP7dY++hqSn?=
 =?us-ascii?Q?6X20jxoHJBVmpwOyTvMffj5NIXbRU3Oead8VOpmo1vKxwRQODesQ1jnIwL/C?=
 =?us-ascii?Q?LQRrwz2qwa8PwcnL7XEjrU15un6EsZd5Cen9pVfamt6DVMK5gXy/KgBDIaKY?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UPNvEm5izEiuBPyzgDD00zf2SjN7oy24KsMPmSxRXO4XFgapEn3zhamea8HS1YWkgJ77OAS8H4ATVi3FWFMRIpCqqq+lhPXswHxvG9KsFlL68P2UYMUEg3Syt4hoeOug3fsnw8PqRocpKQ460jP2jeK4xFCPvt5Nm2/NvwvqvCpSgqaUCV0PYUsA6iipNsurxlO0ceMEalpEJuCQ6AVR44Pu+gQwJR8XHN2TVw6spt4hydNbDoKjsp5Yc3BxHrL8maxzVHtgLTtW4lJqi02iqoYPxuoWmqwJM4KvAlTH2T/pbrzhVf85aikmdhCjEmNrY34nhlqgrY2gSphmnCHR2vSuSPsnJaA2lnyhHnLCjZfeBiBtSqo0Q2WnDaUCVFOPPd4Uhjxv6jvjO37ppmLJoF8H347aI3T8mtYrjc6MBjZ8lMxFZOEv0d61WVlys4QqvOIpdzuLvgW/cMgrDFb46Emr5bhnlLzG7juZbpvKPM/hNOlSl6epx/owaDURgeeZmTbv9U+Wq2zMcKS4F2GLTr/au2EMM4FFlomCFRxAM1mrMVnYP0ALs9Zubdkq7yvbJiy45b47vd0d6WzrmKHvOBJKrl4J0yw96tc4Of+fZSw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3dc5e4-435d-439a-85cf-08dcc0a4c2f6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:15:05.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGz1t4xuSDwkGC9ggpCB5k02mIvGYCeSGNfsuEGigPWgLP1yUaKRVnWC6e+dMk1LXJJ3NhVGga37mKs2IDp1Kf82RRSYWOSXPM4/BsvkiYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4269
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408190155
X-Proofpoint-ORIG-GUID: Vs7T0PK3fAlN2uPA9dAXJg7ZQ7iDBHwJ
X-Proofpoint-GUID: Vs7T0PK3fAlN2uPA9dAXJg7ZQ7iDBHwJ

On Thu, Jun 27, 2024 at 01:25:16AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> This test was spuriously passing.  DTrace failed to run -- many error
> messages in the log file indicated as much -- and yet the test passed.
> 
> Check the dtrace return status.
> 
> The test will pass once USDT supports wildcard provider names.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.forker.sh | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/test/unittest/usdt/tst.forker.sh b/test/unittest/usdt/tst.forker.sh
> index 018a6572..7cfa9eb5 100755
> --- a/test/unittest/usdt/tst.forker.sh
> +++ b/test/unittest/usdt/tst.forker.sh
> @@ -1,12 +1,13 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2007, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2007, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
>  #
>  # @@timeout: 120
> +# @@xfail: dtv2 USDT wildcard
>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> @@ -32,6 +33,10 @@ while kill -0 $id >/dev/null 2>&1; do
>  			exit(0);
>  		}
>  	EOF
> +	if [ $? -ne 0 ]; then
> +		echo ERROR: DTrace failed to run
> +		exit 1
> +	fi
>  done
>  
>  exit 0
> -- 
> 2.18.4
> 
