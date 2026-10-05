Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E89B490BF4
	for <dtrace@lists.linux.dev>; Mon,  5 Oct 2026 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217806; cv=fail; b=sx6/SIV7tl4Wt0ws0KWBi1sVj1MU98TW9R/fIHU4iJIHVvJxKqyrKh9thZdT7rbbBck8VxViFeTXT9wCW93KCRkGQ7+HyftWtxpRJ+zFwXdInbhKS2q5hYFrc3TLU12sZUr7JGlR4GQHth+lUtsaQZtZ1ngQuxSJOI4m6UwK2hY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217806; c=relaxed/simple;
	bh=0S2+WrBf69czsUSP2O8fXDg678hXFAUoh7Jt54J+ZSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qnqpWRhMyOoHrr0O6lEPWIAKkKs8X/tIeasERRfwi86FmE9iRIYuZW8G31LgTEw3PrMkiIkznDmNOp6aPFlClyGeIxbWiM9JDjgeN5RCj4LCAM5HFlk1uAgcoNKmK/JpAqeNoP8dPgb5OYBQNovhTHgL9/2BkkTboYEFa8NRvmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KGlCGodv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LppxbCZV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KGlCGodv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LppxbCZV"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695DVUgp108312
	for <dtrace@lists.linux.dev>; Mon, 5 Oct 2026 16:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Usk2her1bGybKmy5bj
	le3TYUF95nAHtkN8X3ON2Xvi4=; b=KGlCGodvhDmQFWMaWWuavqo0qpNnqFpP4i
	ILs8hWTbOoN9/FZ2zIOsevWritzhtdPBKZfJ6DZWIgvCTSHhFSfALPlzPibS4ust
	w0PCoQzEuu2kasJqhg7+9y9s46nTgvlerBrblLbPAjKKLzNbJH/s+6uJhnzLdjqT
	+k4PzjcVeku5lQsiWLUAuerPglCWX1gSGfTQ1MTUErHUGnbgn5RWwPtpSxCNEDSV
	7KcExvRuF4+otuyQx7aVut9msvVuG22GrjyLBoZ34CRa7L8wdlAtG0dmKgmNQ6SI
	B86hMWIvXXCXqe5JPhm6INNrBt9eepxArcWlRFguW/bsPNZZM5pg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2r9xtd2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 05 Oct 2026 16:30:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 695GLquw031644
	for <dtrace@lists.linux.dev>; Mon, 5 Oct 2026 16:30:02 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h4cycwwwf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 05 Oct 2026 16:30:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5KWOY/PIuP/tuR700q4A6Nuius3Bro/mc9LXe6keljc72a7PLO6STAqhPkgzFN/gfmNEEPj+x0SLjfBqwb84rANDvT4kCuzqzOG7AB8P/nYOmpsSIdRoLO2pU/DlN633LN91+g6lStF+kNd23DoMfVCuM0cHHE/ke/fTL4f0URf9E+KuMeiqCESRJAZO2gPFtluHfmKzi49wqoB9fFokfiPCEDMEKQNpcnQoxexPiP4vTcjoqsmfSXLRugEq8mZrmJy1c4wO33EihHPFRnulZxTjH5iWq+H31iN3I7LZo96e5YeA9uDErseQMUnJu2KRdJiFWgxCelpB8Et6pMjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Usk2her1bGybKmy5bjle3TYUF95nAHtkN8X3ON2Xvi4=;
 b=CUnG07iVt5oFT9jukyK7cJCctJKb20KKPIiPuqeQJY8sZG76io3O6domOpD87T7MjsoW7FMNk0OBz25E81xjuJjFmbd/YDgq7D9ZF1SJ/8AVoKGeL13KXpwjTGhPELucxhX1R80BulIzhRHF/hKHw6v3U5jU4jbByANi/MuN0nc0rCjbh4F1CDF4YMXv8PHj78E7FpljoE6JApn8ZPTSbmHsjJdT13DnUtWGIkget0j/Xgccovz1fvyCcDqWD3l43CjlwnXA4WEZ5Xaa6DU3TuXMobqz300lqXSv7KTf3BHOjpXjpiM5myMwfQvbwjHtjY01gUwRtjSP3CN9Vke1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Usk2her1bGybKmy5bjle3TYUF95nAHtkN8X3ON2Xvi4=;
 b=LppxbCZVUUPJu6gKaMA1aI8GhN234bwrlhpE8DShJoKtMSYDRg9f8nR+06eXzO6Im/14bK75inI3ZaElyY2ingi4RmezKXY/vziZNosj5zgchJ5qOS1QWC2fXrTLXk84NFin0Q0omMl6rYPUArItmBRYRhrRSJml8DTAd39C8fk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH7PR10MB6309.namprd10.prod.outlook.com (2603:10b6:510:1b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Mon, 5 Oct
 2026 16:29:58 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0496.008; Mon, 5 Oct 2026
 16:29:58 +0000
Date: Mon, 5 Oct 2026 16:28:38 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 11/11] test: Add a test for the PCP
 ManagedDTraceScript interface
Message-ID: <asPQNnYoMDTJviCl@kvh-deb-bpf>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
 <20260821161100.41710-12-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161100.41710-12-alan.maguire@oracle.com>
X-ClientProxiedBy: PH8P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::25) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH7PR10MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: db24c038-cf0a-496d-93f1-08df22fde5b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|4143699003|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Wc91+6vjIiFZL1kv5wSRNdnP5cLoWkk6lCcgG3HcM6LUfFrkWSgwpQBHpaGXI/U+yzFiaUda5jWQk7kVOYhUr4ztkWH/kQKlYf7/4chi7budgHWzaHqTXURvAYwLQm8tRrylVXbqH4SjeMMkw8E87hUIJQE1qypE+tqmahJTyfKKJaOyvWrI8Ed7Vybk5sKwgTrzSAU8yoCx7lS0z0X6M+6OOwv8vuFje8D1BcnQYTSL7UWKVmgVr8PpJDQ2n/TXGlfFvzvvdSxd3IeA5QBy3410yBdDE3V/DIuGsCLZVaNt/kSL+mRBPWWCbyFl+Azi7edm/+iM2zBO4kOwIRNUco7+dJ+rvsfGkOuI3Xp/aBtzQ2N+SBRSBTDqPh68MKDRx428VaUor0ulYevOb1QO355Zwz3DQKpkMdeYUaxSme0nIqRi9V4EIyf8SJGvQkzB3vjf82Bd4GlXyuSWFBPdg2GuVe2hhTyJqxYEaWtOdvS/ueTmbvhL2RE75dQ28LhDNk3HnsMVEN/r3tdm5V3x1WMOsAHF/LYW+GZoJaXOmr6CbKf8pyQAfYIpj9PeHpiC/KFgmpPdsyjqIgiBwz0AS+mgV5YiT2yf94KC+AXcOjQMHDgIW4sY8+dwCyEmOzoRiW1gEiVRw4OgrN318rjaZjWOvIc/9BQ2N5orHnotacQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1cG+vsxWV6H19HFtk3SgbjMzrASXW8aCGcnWf1s3SL/g03yTZBbHVXgDj/SQ?=
 =?us-ascii?Q?1SyYTfmVN1lKDh0EDblhnJ/d3oO8kkoaA/gnK+5gzqJTVmwQ33EuQ6dRyJ8j?=
 =?us-ascii?Q?GoKLsZ1TaY6skHoqGAVq/W0r1oz/2Fpup5f7kwr+IG+IhL0n31GmZfpCw35U?=
 =?us-ascii?Q?O+f/k9tlM3HxoI5l6hlvq08vVRMvP4t7DciG6NMqfoZdZv6EIx7RWT5sfiUr?=
 =?us-ascii?Q?yPMP41/kfRNBAVLHF6DrjQUzbMReXxBCryebvPnNCSLbDxYaozksyWz4AtaV?=
 =?us-ascii?Q?ApEZLKjeGNtsoCK09ZaMwJ27lSrKHbj9E4XB5+BV8Kb70KBIQu/WPJ/rahuz?=
 =?us-ascii?Q?uLetJi985baPB3LGSWx6HSeyPrXpA+GhB+1SQQgp8shAl4K3/hL0+yZCzTmE?=
 =?us-ascii?Q?Lq0DCa46L7QbbNlXHIcY4UzQ5uidYpEcB+VwbsFK2k5m+rv1Mog1lN5R/AUK?=
 =?us-ascii?Q?2j5eaXo1pjwU6i50EMZtZ9r4KHydcBa5EMCTRll5bjtPgGiUeKH8KmzloSRw?=
 =?us-ascii?Q?166ofHnUUJyWy7B3LFjzNqvIHnna8/+/5mk8YGNdAx3qbTdh2XIQZjopSYb2?=
 =?us-ascii?Q?ldfsbnJnHPathbwGgzd6ApHyHTKlhtIWVQaUExILK+EjNoz0JyWvgvCIVnFH?=
 =?us-ascii?Q?fEZFh7NXpNhOaZxdHqZjudNsMIK7AaekVrIrD1fbtRIf7IMLgnvsg2GmVpiN?=
 =?us-ascii?Q?c8iYtcglX6r1R6W/6VN1HyhRyd3w0w9Y2h2PUkKO6iV5AFoPCKBNG0uniEKL?=
 =?us-ascii?Q?s0lWkW3G/qkCZ7vkjy7pzKLtYDsh0NrrM/dFd30fH3X/fpc9s8+6cRf6KLFx?=
 =?us-ascii?Q?4yKnN8g1LK6INOLNsLkLm7ETfNnPyNF508FemmdWEiXF0/nCKMGpC8zlnbI5?=
 =?us-ascii?Q?PIefO7d9/VsPQY5PEQU/SfzXbSxLXUFOJhsD0TQyuiOGo319QUtKwwQxyNih?=
 =?us-ascii?Q?Kyu/uNcADqaskbV2eR4MLMhcWiYnU8Pw7mCuYUjebvDc52FDPl9o32SvZWIG?=
 =?us-ascii?Q?fddb+ePzW8KDVDA+CMj3pm1Lt02RjujOADjsMmPfo0YW9JTjcORqZLMSiFLT?=
 =?us-ascii?Q?H5q5vdhYXDhfRViVoRGFG01ki5jQvmcMJ7M8spqGtbbP0teLI6nMITz/aDNV?=
 =?us-ascii?Q?PoiuFdNOeRUVZHEUhpc7R6slaVnd5hPUNqROOBLEY0muA18y740Fw7+97z3N?=
 =?us-ascii?Q?PLXqRGIHwNHi1WyYEnj16dQZ1Ve38PoDNSAp/w//yog2kla6+Xa4hIrv3qq6?=
 =?us-ascii?Q?4f8r7WRQFevRK9Bp65uLi2p2Zp4fzFN5VS69lasHWJWA5u3WTY1W7si2c7wd?=
 =?us-ascii?Q?SQeZLNYc63L0wSwhA3pb1iqHuQ4TD6eiq0FNowg2VyGKdgWVi04ogUuhXC12?=
 =?us-ascii?Q?YTEplMtW35UcqPZTyJQ0lRBytnoTeINPcWZs9OQcb4Of8v1uIbh7yqqZLxFz?=
 =?us-ascii?Q?axb8r+1rO0KylB7a/J+Ow30DpbQ5DfCr6Rq9r+CkfyoOQs72qY1GLvFey3t5?=
 =?us-ascii?Q?ZmNzVsrnOu2p8n3G/zpyqOH38oKS4fQe1iyEJ+7H7EdOpGd1zWnnzCjOz0of?=
 =?us-ascii?Q?MloR1AwmArZMkpk/lUPbQKCzyxY5WOrUDn2D9D+JWo47hXcFxAwypd3pw+9h?=
 =?us-ascii?Q?tX4F9LG38btIzYeDS7wtJFp0IIdaI8Qn1Cls8LzrxDtQ3NgnUpEJq2bNh/uc?=
 =?us-ascii?Q?GDVEslqAUwZ7La1TzBVTf+YbG52t/XN2bFGxE79jMANyTlWfJ8zLhmu19oXc?=
 =?us-ascii?Q?BX/O+GY56J/JE0zYIVV1Ktay/bfUnkw=3D?=
X-Exchange-RoutingPolicyChecked:
	IUjd1GpSdwXLmO1aBD8AgEhwFyx+ndOS7DFOOgWFyponOc7+BLBdfyLZ/SsOhu8ukNtcmeiHWXb3/EsePdPWjStVdLOljYvkxGBmzVbjLMxKWKo6fkVUe4F3tdaHQRJOichZhyFYIrq/gtugYlZEPgqdSk4mLIlndBHcv41Xf5H2sIhHqTClr64rjthB6Xrj3Xscocg7IovvjOn2D6yigdnh+Qn0LDzbAlrP2+f3YLm00iLtQAkPw1S8o8je3sdnKiGqfdX6cwgzqsz7unFzhkKkRHh6NgWRNvkyEgDfPYeAAAlaOcTK8UBdYiFtKB7FHUsZCkNv6QSKY5jHdS2SnQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qqZrfLdYmeSlpaYg7wB25rF0LTPIFGzFXtSnlkhMs9JQ7OL18vybqyGqON3T+m8NYvADr1bKwr0bHz/kYIbPOa+hUZQ/8YrOjeU6GXwDAwwdFQfzR/qosYdwKzS1CUMgXRxojbHosdPjCoT2QzDMX3KWOP/O7dN16r+VNGDQxFWoOfL+Hp2qoZsIX9kOFEeKQlXJUoUXvnvPB0lZaJi58Ilf+XrbhtYId7FjbHqn5cszFAPupw+JxOCrxcWEfZoSOtWH4MFnNzseJuCMg4HIqLPScEtdZ1OHuCoVZyOW87xjwtMHYF5cwl5Z9CDNEHN5a7IojOB5ZqqEcYac3GGCahwATH/n1PV5MiuZ28dlzWEhcqKyqUun7XIWMbQ8ekpQVTV+89tzwaSAQzAZhmh9qz5VwhJV4QR6zTrjqnzbYMqVyTkg9odN3kjDhFjycxSxTyJG3RsMzq6e3HKFcr4H3VLDFMnn9J+Ofl2oszCkqyXghKLjG654kD5blh6ATk/ohnNIEcMm9E/7uiD74IE3O70NxELu8NA7HhILso+F042y8GcTf2wc8rtF+75MPLtM/Txk5M6MFp/g6OWg2IIcBOQFBUdFIcK6RqluExvv6us=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db24c038-cf0a-496d-93f1-08df22fde5b8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 16:29:58.6853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnFi5zEwEMpl+PobXEDUg1WRVKQRww7WSvAX5tJBYnUPpHHcLAPNER25aSV3RBS3lbx7FZmpxjiD0inMHdhjIB59gdrUJw+VgYsdO6WvoQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6309
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610050064
X-Proofpoint-ORIG-GUID: zJxfTXePSkpssVQEItcr1wcPhLL23xMn
X-Proofpoint-GUID: zJxfTXePSkpssVQEItcr1wcPhLL23xMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2NCBTYWx0ZWRfX0UUGiYCIDBN8
 hcfYfBn5ALxNwErcvS13B/30P2FFN+TpjN0j/1LavDNgLkOtD72xvydp1fnuQpUsOk5vDCys0Id
 g53QLcWpvo94wnbhombcOg7gFPerHgd5cYzGjj47OUs4FDrXjMgihZX/CDM87H//xcWcQ9Biq5C
 kjyPh+Spl/nqGkPf5yPbVdikezRJ3r72td8xQObfHvJ53jUT00wnzctGYOH8FVLbauoetXKc42W
 f8A78R94uP1dNlfvkAtsJFuA13FafRgr9e20qObXCZlzAQPjySPTerT4ySunNJ0KRnF/hlZPvz4
 VGGwIIP94GbqiALqWDbF7EbduVZ9hh8GgwFnkJYuYSP2XldRkYY/SUsMk4FyTrwrfpg5NApSMEu
 7Nzd94G8AZnLKkDujrf0idjTPvd5hMvwnAM91rHG+XM4BDWjT8WXPBYIhhOY/vnWDVpniQTb8iw
 ibP2HclB/ItL4VTBQiCfDX3yBMGoVlH+68BVY2RQ=
X-Authority-Analysis: v=2.4 cv=QbrzLcbv c=1 sm=1 tr=0 ts=6ac3d08c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=-Ggh3c1wC5ya6hZpzQ0A:9 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2NCBTYWx0ZWRfX67dJMfJKdmx5
 UPa09sEVbaFqO1fq/yzscxbwvCs2Zw0XbZScTAJwtVDc7sODTKxbUgRIqE9USTMHILWogefqb4x
 K9iovcMSDlx+D2yoDPOI0VxFM8AtlGcAoe70yzFVDdcakzPM5dtb

This should either add a dependency on python and pcp for the testsuite,
or there should be a .x file to exclude this test when python and pcp
are not available.  As it is now, not having PCP on the system will
cause the test to fail.

On Fri, Aug 21, 2026 at 05:10:59PM +0100, Alan Maguire wrote:
> Since tests cannot rely on a full PCP configuration, do
> limited testing of a ManagedDTraceScript, ensuring that
> we can create it, start it and that it collects data.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  test/unittest/python/tst.pcp.sh | 69 +++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100755 test/unittest/python/tst.pcp.sh
> 
> diff --git a/test/unittest/python/tst.pcp.sh b/test/unittest/python/tst.pcp.sh
> new file mode 100755
> index 00000000..acc68854
> --- /dev/null
> +++ b/test/unittest/python/tst.pcp.sh
> @@ -0,0 +1,69 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# Test the PCP ManagedDTraceScript with a real DTrace session.
> +# @@timeout: 60
> +
> +if [ $# -ne 1 ]; then
> +    echo "usage: $0 <dtrace>" >&2
> +    exit 2
> +fi
> +
> +if ! "$DTRACE_PYTHON" -c 'import dtrace, cpmapi, cpmda, pcp.pmapi, pcp.pmda' \
> +    >/dev/null 2>&1; then
> +    echo "DTrace or PCP Python bindings are unavailable"
> +    exit 2
> +fi
> +
> +tmpdir=$(mktemp -d)
> +cleanup() { rm -rf "$tmpdir"; }
> +trap cleanup EXIT
> +
> +cat >"$tmpdir/test.py" <<'EOF'
> +#!/usr/bin/env python3
> +import importlib.machinery
> +import importlib.util
> +import time
> +
> +loader = importlib.machinery.SourceFileLoader("pmdadtrace", "pcp/pmdadtrace.python")
> +spec = importlib.util.spec_from_loader("pmdadtrace", loader)
> +pmdadtrace = importlib.util.module_from_spec(spec)
> +spec.loader.exec_module(pmdadtrace)
> +
> +created = []
> +script = pmdadtrace.ManagedDTraceScript(
> +    "tick_test", "profile:::tick-1s /$1 == 1/ { @ticks = count(); }", False,
> +    {"quiet": True}, ".", None, None, [], ["1"], 0,
> +    print,
> +)
> +script._data_callbacks = {
> +    "create_metric": lambda entry: created.append(("metric", entry.metric)),
> +    "create_instance": lambda entry: created.append(
> +        ("instance", entry.metric, entry.instance)
> +    ),
> +    "update_instance": lambda entry: None,
> +    "remove_instance": lambda entry: None,
> +    "refresh_metrics": lambda: None,
> +}
> +
> +ok, error = script.start()
> +if not ok:
> +    raise SystemExit(f"unable to start ManagedDTraceScript: {error}")
> +time.sleep(15)
> +script.stop()
> +
> +entries = script.latest_aggregations()
> +if script.state() == "error":
> +    raise SystemExit(f"ManagedDTraceScript failed: {script.last_error()}")
> +if not any(entry.metric.endswith(".ticks") for entry in entries.values()):
> +    raise SystemExit(f"tick aggregation was not published: {entries}")
> +if not any(item[0] == "instance" for item in created):
> +    raise SystemExit(f"tick metric instance was not created: {created}")
> +EOF
> +
> +chmod +x "$tmpdir/test.py"
> +timeout 60 "$DTRACE_PYTHON" "$tmpdir/test.py"
> -- 
> 2.43.5
> 
