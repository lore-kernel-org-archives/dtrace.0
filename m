Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF321A42D
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733520; cv=fail; b=aWKX1a+Da3WTmXFXh1dXF2DdIeq6AathNVmBFCCkap+EzUv8p6sCMboK1lbyZFEDUJPlRTxdoUk8EKKCnFqH3wsbfGQEYW7iNo+dxdAdRfNe2k/i4quN1eAL/uYN3Kn3XiI7yAS6BbPM8EZpuDF3/JsRo9LO6c+3020tuuVWmuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733520; c=relaxed/simple;
	bh=Jy0KLb+Cb/qQ1B1aVN/k0a7M4hFASC8hReZnATcbz6c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SGIg2GdFjsTqn91kCSBM+OEPs09ndTT7++EW8ew3jWdlTKByf549OOFKuF4HXoWKlhQzFIxNG4KS3eU3SMBKeuXGjVXJidPmzPhmejP9lRfe1zOYG6OJO50tXUB3HnnL1ix+7zryZlK3D2qQrlp8oKN9ugUKZHLbqi6+FgqAE0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IEkmj2Po; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CramwZ4A; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IEkmj2Po";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CramwZ4A"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKMMnqQ030998
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=xXWGPFCIK1QaclMddB
	Lt8Tk5hWA0Yh5lfCXcs/x1juc=; b=IEkmj2PolTeyLoYj8X0BFc8V6QFvK6+9DN
	O/CO8ATOJeiFjtvlUHBYj3REt5Dp3i8iuH8y0UzHbhGrBRhiAnyFGJ8M/TjCaLD/
	nyJc2CwQyqgkHmZjjZx/1kzfKmtV4z6XfTWTpGBooZ64OC15HZxEewu1Gq1PpyZ9
	iX6PxDiIwS0bL8Pwmf56iILQiRciUV7/GfOiFLbUmC1EBdS3J0MvQPHWB7Kfd4jr
	YvILiazE5f+pJ25xjl2tigk2z3lv08QwfV4E9vbnemQfqL7jBHsWktjU9SK44IfE
	TnKo8VpnakA5T25EjRAvbP8MQKxJaJ9iCS8IL1hNraDRBiMyDrig==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h22cx45m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKKjUUq000637
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:15 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43h0fd2cu4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 20 Dec 2024 22:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mS1ZkXxU+Dr2b1FqkkncSRNHwOrZRiInljr2AcResX7Bk4/D7kUvudwdB6sHOc7qbLLt2BATHKYXtDwSkBUDnxBTY6L7yhxf1Fz7ST3wcquj8H/+fALMfJrKR2ZPIUL8p6rgCKjulHXnn3PfZgjLTmdra7OLtg2+gpf9ohv9FRnqqnwQg1jHgkrT4zkdEgDYglAWiPv/TTklYlaTGF+imodx6neCfS7nEG8Zmqro03mfSFRZqsQZKCJ4Iw00jGrblWiLjNQ7Y6D/hWt2fioeSOn3pTwTsW0p8UHAH53v/siaSIqg3ZOC+lLrdtxT4p5NxKAJCvTz8VeAi4buZgz+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXWGPFCIK1QaclMddBLt8Tk5hWA0Yh5lfCXcs/x1juc=;
 b=HFlE2zu+imDIQ86rqVx3NHz4XDUTh0nzVk2QOj4LQrVD1325pGDwxKlrg8s8qUU4p11ZTsuiF4RZFgJK2Bc5eSc7UjfZpVz5Y1DcA9Qr8zjVsotQKDB8sgc3mGWaytaqJU/EzhHITUwIjq2AMn6L+/JLHEpCebsnsSKP2pMjFBfpLpk6wbzwzz8dXT8rtU9/8EPcVt8bem9rai4dP42AvvQhweDhLTq+1yMBgFHJoHdBh3fPR2Zte7zQGR6j2qZO+EvIAP7B1nJ1FedYqwxSgUW6htHmwBHzQ6nIYxPkMEMCDamqXfU6eXjaxRTR+HJc6XpnAjeaFInd1AtvhWoi5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXWGPFCIK1QaclMddBLt8Tk5hWA0Yh5lfCXcs/x1juc=;
 b=CramwZ4AfDZhYncgXRc2AM8OeFPBXllZ4dmiLP75MyDmoN2t6Yn1ycptqQ61vuk5EaQNlafjYiUOrk3bjo1VSOQIeVzcryY7k4GDr0CGTFP+4v1noK0/1C/FPgi1/oXrqgeSPymreVqdoxQjMg8sgfs00gXrvOJ2rTAOk0AhRfQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB7412.namprd10.prod.outlook.com (2603:10b6:610:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 22:25:04 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 22:25:04 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/5] test: Embellish the USDT multiprovider test
Date: Fri, 20 Dec 2024 17:24:52 -0500
Message-Id: <20241220222455.18351-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20241220222455.18351-1-eugene.loh@oracle.com>
References: <20241220222455.18351-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2c634a-0239-474d-dfdb-08dd214526d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cTq4xTXX6AQcIxxplrozDeUzSgmnm8L4syX6M4m1NkIAAiGX8r0O/3Opwj2g?=
 =?us-ascii?Q?EdI001ElqsCklB7qvmNTLwlQXWuQ8HffGBXMfpIjLcYwBudaXU/3C6ndjn9e?=
 =?us-ascii?Q?Hf8mT7Zjp2JC+WRVWmsjDegJwe2GBM5oSUobr2kh1LlJsmLRHwE1tv2BDtLb?=
 =?us-ascii?Q?ZlFrIMDF7XewtQsFUJiMBD2eBzzw1M1RhnBxyDoa+hA73If/lDleVnlj7Ypx?=
 =?us-ascii?Q?u8XLJx5M7ZZxjwG+idZEhskQRJXmSD5ZOI+iNPEhprV4+6NEWA6FQULBXyMu?=
 =?us-ascii?Q?+8yfZ7Ge0BrVJs51aFmV20aNyz8J20uB/ODQG4xLmdf1ncceU4mOQlwqQQGW?=
 =?us-ascii?Q?FWHdX5tT6+o6UcIjKgUomvdRuqwE8US1d0TjTOanLXdsMxVqkEIrY7HFHSDT?=
 =?us-ascii?Q?g3Q3YT9/BvurKuWHN6SqoVEfpkS29x+go5xeJ84LUC0/RqIFF51EuehRF45a?=
 =?us-ascii?Q?e3imchdd5hCuB+Szgk8RyKioCWyVS/92yB7MTpGirHkKsDBNgMRzHv3zZ+J6?=
 =?us-ascii?Q?ap+NmSeIhqCVM8yBjNGT4TtTs/wNVo8X07rnFnZXznz3oTKrH/etOaBktc95?=
 =?us-ascii?Q?BRyEIWHGdjhYAcjzD8keWZqCpbloUxL1fJUFAkl8Bozww1ku3TtYTDBnfaQE?=
 =?us-ascii?Q?9jKLiVB3MzZG1mGnc26cDKDtRXLKyTPjX5UTgX0HxWpNOyM3MejGFOQD7WQF?=
 =?us-ascii?Q?P5F7tZOILu9+SPYHOGUudbK9mCeBWdiU3u+pJFVaOwsAKmiGfddZcwQGzRUr?=
 =?us-ascii?Q?0xT8/6xJ3IAMKciee9LfSRG85756xd3NQ0qfPHPBjl8yuar3fJ6BhqNFQ3PU?=
 =?us-ascii?Q?YIqyyeoeNbI/+bPXLdre8+/gBwAuad+WsRhLgXKBmB1C0fBfGddkImI1Iuw2?=
 =?us-ascii?Q?l/G4x+mG7M7DeCsZuOvhrwF0nydZJ4LQGGSkOSqiAVGkFsTWNHKlgkARaxMj?=
 =?us-ascii?Q?4yiivH04ysIj24sca9EA0pIRsveT4ZU3SFVSTOxrZq9pEEchr8xJeAhXei1V?=
 =?us-ascii?Q?jCf2pcxA1Yc8WYs90PUio7FWQ9/HfSPx+EmxpRGPjGLM/3upNyVrcSZlmV7s?=
 =?us-ascii?Q?OqlKOFTHjqzVYCTMxeihKei0ChoyzGNJTe9V61qjgky4iJpdsK4jeKhh67XV?=
 =?us-ascii?Q?rRB/7UXdbIsBmlUMdqKs8P8OsenjAc7q8MbSseO/ZhFjBtIG4iVRALhOE5Cu?=
 =?us-ascii?Q?jx73MZXjXgLRj31KcgytN/M4aqHo+gMNUzQ5Q08EqT0pBPZova7F3XOTVxqU?=
 =?us-ascii?Q?xDQEGWfed8olCNPKevQWBIVD4JwWy9ilH+YguR7E1CsYO7vrh/NolryxGHFq?=
 =?us-ascii?Q?6i+3kYPrHAhcRU2rQJWoNgLtuhK4ApfE3PB7KbFEyO59zma/FjrLQ/mRdmzj?=
 =?us-ascii?Q?jLRcVELagTAWgRahzmufPJ9gH20O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kmgsNZBlvLoMCSuCJzcxSily6kg/Q9QQRJnbIL3i8xhHczMh5l5xkFWh1WcX?=
 =?us-ascii?Q?AtrhcyTJcpal3v6046d+9eeMDSYZnbEhLBc6G2i3ko8597VeFCHE9nfD6bmW?=
 =?us-ascii?Q?n5M6UGwPKEE/cxfOsqMTDTA4dSxpAUg3SaZybPo8eQ4/HhiCyt9TOfWJXOqT?=
 =?us-ascii?Q?5XgWLFRQ93u2hbXjb6Zmh725Q7yopcZA3TL1vhD2dWvhwQYRupf9LdEhxCi+?=
 =?us-ascii?Q?OWGtSd/OmkSFJAFHFXE40s2OGByK1snwGUNmac02rMTzi8VOB1BWtY9aAaPg?=
 =?us-ascii?Q?reeY+shoJ7cRbo3f12rTi65kRZAfXSL5YGsT/njksRk2bGvaKTxuObPlqyKb?=
 =?us-ascii?Q?SBeNyo71OpkpCn1opWdGm9t43W78+4Kj4yJg8hVvovUNWepeHiCsGhFYTyMh?=
 =?us-ascii?Q?y914Iz8mOtqAihPAbOI9A3j6qIhQdKFDIlQn9sTIeSAtFLhXG5FaEAujgA5e?=
 =?us-ascii?Q?DwA37sXVsoLXJp/VPPaXMV9N35eXAexzJ1QNQ80VZGpnQQbntYsj7ZqgExPQ?=
 =?us-ascii?Q?/HOlG+7sDaoQEqLudQdx6DBOiH3kCQDs+jbB/0d7UhNa0B6Yr1rCKC0PiI+v?=
 =?us-ascii?Q?25wvefDwOdQSktPcbLt2YZ/bc+9zKZwZ4GGA46SJFJfGHCaHcBeCsynwA6zv?=
 =?us-ascii?Q?G4XTc/Y0pbfrmJF0uLMfobf3iqmKpOTTZIN0AED99mbig+XKcXJkpDv+CeJK?=
 =?us-ascii?Q?lBjQLfQqiK83UwCV0MR7BczKWMlVC7WluulUIIObkHi2iUASgtnG6vThvhAV?=
 =?us-ascii?Q?wPmVS/uerUCJMxZEbIJSZJtt/PmRnVBlQY3PWEqgWbj8W/rgOGcLLVR3B4tB?=
 =?us-ascii?Q?NB+rlEjMOlyVQlC/Bc4vXxIonU28r7gYFFxFTGlhmz/Rb/bhDK4RBhHzZxqN?=
 =?us-ascii?Q?SMRdn2X1sHxsN0uIITJzKmUaz4fJZBPqAhtqF7gj/4CHQfAtgBKvb3ABBNg+?=
 =?us-ascii?Q?4IVSXaT5036958J45jBrweE2m8hpZKwOLGorgU4E5+KTNHGCn1xemVlx7JEk?=
 =?us-ascii?Q?NEEI/tUsEZoFMhFv6B2XmKLbB934/Le/SbdVWfXWRhP3XyxZIlFZ0JIQ/POs?=
 =?us-ascii?Q?ZgWVHAC/89LIH7zHT9jAr7H+Mcv+J2JRV7yq9CEhfNP/x2CK0ZqQE/z3dXk3?=
 =?us-ascii?Q?JkL70AJ1FqGEujFH7OmSMDIh0wnlmYIF3PzY+MeRYOhrr4QOXcvSBa8sn8YP?=
 =?us-ascii?Q?Wd3vTgooy5+ng82x6OjtMZ1KmoVcZ6iFksCEcUuFrVAzjERqFJ+kxQaqmmwy?=
 =?us-ascii?Q?dEV5ddZhE9xeVCsjqY+P37HkA9p4T9gyiwUB6tkhrTDo1VPjTEdW8bED949z?=
 =?us-ascii?Q?s/57ArqxcdVagj6bM2BAJJTa7qqgkmwU4qbE/wg6crMecCRgCSm2Hw+KXfVx?=
 =?us-ascii?Q?EBD+skjGzLKjnCIeUQC1okDooKPEFA3YFAG4GAQzk9irD7ifAZDefBebj9D/?=
 =?us-ascii?Q?J5YhuS0cuAB98ltxzq5P8oeHRg8GohtH4xUiztMvDPtRDaTgHCDovD9qdQyg?=
 =?us-ascii?Q?1PCMBXPuIIc+ETzcPJYTjbyAqOJQEmffzquRMTgT1codn9yARVF9d4AT1JqN?=
 =?us-ascii?Q?laJo/ufusATmbkg1xnrkTKRNO8WRb30GaMfzJgPK?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aqzcCxJYnqMcstYlIRia9su3GgoyCDbeqL3dC/W3PJyV0vO2k8MgtWpxgp148LQWtqve8pdCqPuazklDK18ZVS441GqeTJ4RQVQTtuhTc+wQLzoQG3gsrHn7FnHB2n6XdFajKWrA1VT1ZO7QaXbmyZqaZMnbigsG0gPRsJQ4cK4uuZldQ2h+1kgXcfJTrIhQmlS4gTdZS/scjAPkrF4IAWG88ozbfxNHWBL9KjHiCqoD4UkAJcarEkuWBEZ94YG4IPCJ9z5B1oenodiMfwoF5PivpdiS9hbeF1uStFaXwvF2/uaHIyJs/E/xv3GiUj2pi2gHlondWE520yyS+fee8sqBAQJeljnSxuXEs7HLtbAH2boIZQlbbNmCqJctS/P62doL9AaPsv5kardWgXijZK/ekKtYjQE4jgzPY+RkbpPRAGUtFXQckbAkJgYo/YimtzJ6WcUULj19KklhELe+mRuFGXZ5/EGVLTr40mJRMS8AkWo3n4pvwHDEaGtnLfxCLvdwhw/aL2gYuj14VHPmqiYGRW3PDsi74B/FDejErWHAtXe95tI3+Ih0/og2dAYigy/dCliMPorLcHZJqtXItuN24uTlRd/OIvyEcZF5rOE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2c634a-0239-474d-dfdb-08dd214526d1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 22:25:04.6470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aQXuv3LWmrNX05X4HOhPKWXvi3cv609twF4oPrIsvzLIy3y2NtbBgb6SUBAoV4QvwHPhX/z2hp9aHgrO0xA7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7412
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-20_07,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412200181
X-Proofpoint-GUID: ToZ1BbhpfKE_i7m0pe5BlpJjKegsdRx4
X-Proofpoint-ORIG-GUID: ToZ1BbhpfKE_i7m0pe5BlpJjKegsdRx4

From: Eugene Loh <eugene.loh@oracle.com>

Add a probe to two providers, each probe with the same name but
different arguments.

Do so in a new, separate test since the older test used to trigger
some crashes, and we would like to continue to catch such problems.

Add -v to these probe-list tests to check attributes and arguments.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/triggers/Build                           |  5 +-
 .../usdt-tst-multiprov-dupprobe-prov.d        | 10 ++
 test/triggers/usdt-tst-multiprov-dupprobe.c   | 25 +++++
 test/unittest/usdt/tst.multiprov-dupprobe.r   | 93 +++++++++++++++++++
 test/unittest/usdt/tst.multiprov-dupprobe.r.p |  5 +
 test/unittest/usdt/tst.multiprov-dupprobe.sh  | 11 +++
 test/unittest/usdt/tst.multiprovider.r        | 65 ++++++++++++-
 test/unittest/usdt/tst.multiprovider.r.p      |  5 +-
 test/unittest/usdt/tst.multiprovider.sh       |  6 +-
 9 files changed, 214 insertions(+), 11 deletions(-)
 create mode 100644 test/triggers/usdt-tst-multiprov-dupprobe-prov.d
 create mode 100644 test/triggers/usdt-tst-multiprov-dupprobe.c
 create mode 100644 test/unittest/usdt/tst.multiprov-dupprobe.r
 create mode 100755 test/unittest/usdt/tst.multiprov-dupprobe.r.p
 create mode 100755 test/unittest/usdt/tst.multiprov-dupprobe.sh

diff --git a/test/triggers/Build b/test/triggers/Build
index c50c265cc..3b5df3ece 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -14,7 +14,7 @@ EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie
     visible-constructor visible-constructor-static visible-constructor-static-unstripped
 
 EXTERNAL_64BIT_SDT_TRIGGERS = usdt-tst-argmap usdt-tst-args usdt-tst-forker usdt-tst-defer \
-    usdt-tst-multiprovider usdt-tst-special
+    usdt-tst-multiprovider usdt-tst-multiprov-dupprobe usdt-tst-special
 EXTERNAL_64BIT_TRIGGERS += $(EXTERNAL_64BIT_SDT_TRIGGERS)
 
 EXTERNAL_32BIT_TRIGGERS := visible-constructor-32
@@ -210,6 +210,9 @@ usdt-tst-defer_PROV := usdt-tst-defer-prov.d
 # usdt-tst-multiprovider calls USDT probes based on dtrace -h
 usdt-tst-multiprovider_PROV := usdt-tst-multiprovider-prov.d
 
+# usdt-tst-multiprov-dupprobe calls USDT probes based on dtrace -h
+usdt-tst-multiprov-dupprobe_PROV := usdt-tst-multiprov-dupprobe-prov.d
+
 # usdt-tst-special calls USDT probes based on dtrace -h
 usdt-tst-special_CFLAGS := -fno-inline -O2
 usdt-tst-special_PROV := usdt-tst-special-prov.d
diff --git a/test/triggers/usdt-tst-multiprov-dupprobe-prov.d b/test/triggers/usdt-tst-multiprov-dupprobe-prov.d
new file mode 100644
index 000000000..04ef7245b
--- /dev/null
+++ b/test/triggers/usdt-tst-multiprov-dupprobe-prov.d
@@ -0,0 +1,10 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+provider prova { probe entrya(); probe entrye(int a, char *b); };
+provider provb { probe entryb(); probe entryc(int a, char *b) : (char * b, int a); };
+provider provc { probe entryd(); probe entrye(char *a, int b); };
diff --git a/test/triggers/usdt-tst-multiprov-dupprobe.c b/test/triggers/usdt-tst-multiprov-dupprobe.c
new file mode 100644
index 000000000..2d5fa5fb5
--- /dev/null
+++ b/test/triggers/usdt-tst-multiprov-dupprobe.c
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * A trigger with multiple providers in it.
+ */
+#include <stdio.h>
+#include <unistd.h>
+#include "usdt-tst-multiprov-dupprobe-prov.h"
+
+int main(int argc, char **argv)
+{
+	PROVA_ENTRYA();
+	PROVA_ENTRYE(123, "bar");
+	PROVB_ENTRYB();
+	PROVB_ENTRYC(666, "foo");
+	PROVC_ENTRYD();
+	PROVC_ENTRYE("baz", 456);
+	usleep(5 * 1000 * 1000);
+	return 0;
+}
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r b/test/unittest/usdt/tst.multiprov-dupprobe.r
new file mode 100644
index 000000000..69764f6e9
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe.r
@@ -0,0 +1,93 @@
+PRID provaPID usdt-tst-multiprov-dupprobe main entrya
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+PRID provaPID usdt-tst-multiprov-dupprobe main entrye
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: int
+		args[1]: char *
+
+PRID provbPID usdt-tst-multiprov-dupprobe main entryb
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+PRID provbPID usdt-tst-multiprov-dupprobe main entryc
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+PRID provcPID usdt-tst-multiprov-dupprobe main entryd
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+PRID provcPID usdt-tst-multiprov-dupprobe main entrye
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.r.p b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
new file mode 100755
index 000000000..5d11db2d4
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe.r.p
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+# Remove banner.
+# Replace numerical values with generic PRID and PID labels.
+grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe.sh b/test/unittest/usdt/tst.multiprov-dupprobe.sh
new file mode 100755
index 000000000..80b147974
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe.sh
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+exec $dtrace $dt_flags -lv -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprov-dupprobe
diff --git a/test/unittest/usdt/tst.multiprovider.r b/test/unittest/usdt/tst.multiprovider.r
index 60a15c01e..873bac49e 100644
--- a/test/unittest/usdt/tst.multiprovider.r
+++ b/test/unittest/usdt/tst.multiprovider.r
@@ -1,4 +1,61 @@
-ID provaPID usdt-tst-multiprovider main entrya
-ID provbPID usdt-tst-multiprovider main entryb
-ID provbPID usdt-tst-multiprovider main entryc
-ID provcPID usdt-tst-multiprovider main entryd
+PRID provaPID usdt-tst-multiprovider main entrya
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+PRID provbPID usdt-tst-multiprovider main entryb
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
+PRID provbPID usdt-tst-multiprovider main entryc
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		args[0]: char *
+		args[1]: int
+
+PRID provcPID usdt-tst-multiprovider main entryd
+
+	Probe Description Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Attributes
+		Identifier Names: Private
+		Data Semantics: Private
+		Dependency Class: Unknown
+
+	Argument Types
+		None
+
diff --git a/test/unittest/usdt/tst.multiprovider.r.p b/test/unittest/usdt/tst.multiprovider.r.p
index ae8493e3d..5d11db2d4 100755
--- a/test/unittest/usdt/tst.multiprovider.r.p
+++ b/test/unittest/usdt/tst.multiprovider.r.p
@@ -1,2 +1,5 @@
 #!/bin/sh
-grep -v '^ *ID' | sed 's,^[0-9]*,ID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
+
+# Remove banner.
+# Replace numerical values with generic PRID and PID labels.
+grep -v '^ *ID' | sed 's,^[0-9][0-9]*,PRID,; s,prov\(.\)[0-9]*,prov\1PID,; s,  *, ,g'
diff --git a/test/unittest/usdt/tst.multiprovider.sh b/test/unittest/usdt/tst.multiprovider.sh
index d5b72c2be..e84a24b7e 100755
--- a/test/unittest/usdt/tst.multiprovider.sh
+++ b/test/unittest/usdt/tst.multiprovider.sh
@@ -5,11 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-if [ $# != 1 ]; then
-	echo expected one argument: '<'dtrace-path'>'
-	exit 2
-fi
 
 dtrace=$1
 
-exec $dtrace $dt_flags -l -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprovider
+exec $dtrace $dt_flags -lv -P 'prov*' -c `pwd`/test/triggers/usdt-tst-multiprovider
-- 
2.43.5

