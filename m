Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2F94A00
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908954; cv=fail; b=SEtnGOaReL6uJVz2YO4zsqMpWhkSDT1c1HDzuqW0tjLE225c8AvncTAXPqxzFCW48fhsQp7HiOTa0WAyTgNfSTui+HCQn7mcf70hf+aMRVHYfNIZxoaciuiQvknmrqTXee4aDow4bFJt9qalXThi4TqhpwXn/1d+r8qCRve+zt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908954; c=relaxed/simple;
	bh=Fvw4tTn97fUIfaaCTd8nG/XrzliQ3Ngil2Yzl0LVbi0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NJbQJb2buyzBg2q2FZ2OEu9T6+wAGXX17KLaS6pM+9dIdcBEXxZfrg13K35KmfxHWqSWNq5ky6Rb0Z/qkrudfbcbNH/YuDpTicpIvnjZIvCvx3ccuecjlk9X/Wj40hhi4GPQdhYrnxn3qt3IVME/ZWWS/VZQZx4ACZXwoOstc4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ajCwD6n+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XjSCVR6P; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ajCwD6n+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XjSCVR6P"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fZpj005683
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=gy5TGFkNLVAelD
	0k4E2TjY73RGjQ0Jgsfw4gHvgD/YM=; b=ajCwD6n+CmH6j7I3lx0qrgzLguaKGG
	eeuzUOLO9nHlTVmihkJ1+5GIE8aCdSxji5PZlKKOee9cmS5d5L1mSnDzN0BlMdV0
	kfOdoY3MqSLfNsu4TyKBSmQRqWSITThkKzRPR0uxaUm0y6kOAc/e3nD7bLshyhTD
	H21stxJhH8biv9hKKwKYfRc0x9W2DywzpPb4Q/AMybAmTeC4J/Ze+7rwkATE/zht
	M/W2kz06JQJ5rLVy98CtDdDvLnzP9HW2wrkhxKfqDemyzqixdj39UFwWDDGjuGqk
	CJZ4tgrTj6RRiCLVB12FRPUCctB+d2nOBxvKxhHBRly2+YIbmzUOYbqw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu98p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T5Be7f036491
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:30 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4189jmrp7f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ea1Kp9IzZ/DsZui8pgqVrbmx4VKCvLLZElsX/Y9PvsLh0wwtatKybX3IrylsLU2X0P2IEeCXGnYNOwb54DuO1quegpI3FLkienXGadcaLbJI7ZeXsKrvbOx0SdKJXaZjPCWj4e/Ett6FcVmv9zngN0iPw8tCjJmxdmtmnpLTIk+WcuN/bRAYSDuLcaNBqbQ/HMylhPmAXbM5IjQGaD0EHQPTOVErGT0ZH3LXQqHn6cxEPWRnDYS2z7hT8gXsmBaTLvq/FXruiN4ONYGQZxlJ2e5NAmQDvyQYkEx7b0IMY0FYFbOGXNLGm/ZbwzkbPBb7As/6EmrvHU9HqGcyA23UBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gy5TGFkNLVAelD0k4E2TjY73RGjQ0Jgsfw4gHvgD/YM=;
 b=vyjqMvTylG/6S0uLaKvkH5S4UJna9pvDPut3uubTxAQg312B4qst5Xs0MDNYKtR2v1I52ktBslVPAJDvZsSpXy6PYKCXzpvHxdZJ8IHGW5eQ4ocByH+JAfoQyL/fW5GoPtolft3CpHMpsDtX2SkvwHLp+H89t9/83a6DtpngJzh1u/ArBfSZGSBGK+eFumnl/1MKH6ur9uR+735lUxU8pDTV8oycOXS+94KvIC+0wElLt5uj4Re/KA+mfH1iFc7BnX5jB9hJAhU3Vb9gKoxQD7YdsP2RZBUYJlAI2+YwzIW51fJF4gzYpqCuR8WWlRv448EjboS/+Mj+riM0/Acyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy5TGFkNLVAelD0k4E2TjY73RGjQ0Jgsfw4gHvgD/YM=;
 b=XjSCVR6PTppnkwosaqXIX8nFlj0OeFKGf+zOjwNIzdb/NLGliiuhbP2WX+H2PjjouL4yHzSpvh1Oz6PbW4ANTrofRt3JmgCAyyXTfGWc5GgGwoRGSmZxC2np5k6STNYCfiI6zusSmyfGew1hKpxIydavHWEi0qnLwHgobPkV5z0=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:28 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:28 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/22] Fix provider lookup to use prv not prb
Date: Thu, 29 Aug 2024 01:22:03 -0400
Message-Id: <20240829052219.3234-6-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: bb87ef96-1c43-4a08-7f8c-08dcc7ea930d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TZRhoLGcrpGJaaVjRN5Hpv1rcOp6IWI9JXzAkrOpSBxVb5qbErLOf8qvXt0+?=
 =?us-ascii?Q?+gg5wjj6IH0NZqWdwI9g2MN0f3tn7DIHlONdtiA//o4giUNPUjPB5IBB9b9Q?=
 =?us-ascii?Q?JnVKQsnOIZsn4PcH0NmdK+nUoqfFNgNReEEFwGEnDsFVFxnIb8DzcBlcet+X?=
 =?us-ascii?Q?/h3Fa3Oo8SeAGgAf6GpehmdYiVOmFsgogLptyvWobEWYq6U7j9ZJtnxynHt3?=
 =?us-ascii?Q?Uw+yTX1mt3Yy2o6/+n3P8DGXh3OAa/qFxkTBLKsnLDx4ji1HxPJ6dvkDC7Ar?=
 =?us-ascii?Q?aiTEwenIl0HueXRPI2GTIQbzEfHs+xQY62aGf22PLaiKeF/0+tflqe9PW/Bc?=
 =?us-ascii?Q?A12IgzAqEq/TjHH48Nm/CDaT+h9gvrIsO/eCDJP9PdVAjIW2ktgOeBW81hZG?=
 =?us-ascii?Q?KgFuMhtKoi9l/FEvfeyiaaeBtYN0fts+GRMNX7PO2c28GRZ8mLLQbLIdeVVB?=
 =?us-ascii?Q?82k33Q0yOmMzQHG8NMm9sFn8n/1NJQTc3Ujv5XWDXH5HmolRfXY/sAm0m+gt?=
 =?us-ascii?Q?jI42UVgW8YqU8TPBWkDha0FyqKOMwiskMR1FEFFe/VLafOIEm15cAFVP9VQ8?=
 =?us-ascii?Q?2sD4LClQP9Oo+iZcuW3J9GyIRIYs+dNMSCHi+wWpvfXi/7hrv+3uMgn/A6xI?=
 =?us-ascii?Q?3K5R+32N+V7A1fBRWxKJsRr9TrTQuwUHYUtDHwAF0NVrF0fRUVnzmsKXWmPN?=
 =?us-ascii?Q?miGnE/8TfqbFYrrxKOKoY3ey2+CmzggKc6YNA7NFmZhW4Gl6Leqi0wwbACyY?=
 =?us-ascii?Q?3SSS0JfzxJ5s/KOLW42GTP75a1UybX0L8NrXq6BYu+YxWtyX6Bg3Lu2yYTbO?=
 =?us-ascii?Q?RXzeA7oj2iZ384pjJzXtgjsvpru0R4cdsKj+SDHGKwfungwYHmxctEMZZ93k?=
 =?us-ascii?Q?cvQvc80P5oa2OAPAINvFp4P7Mk5KMTk/CdldX4sfGu+/3HpQ9SSjlsy7NvfV?=
 =?us-ascii?Q?bByxZk0fr5+6D2LsYmD7lm/pGfPYvmYtvsXKqm9yCPO4dvcQ8ruMbJZDAvn7?=
 =?us-ascii?Q?RPzNo1glrSXW+T3/JfuPEFU4w622xLEUvnSK55IMjVClnT6SRaEpenpQyrF2?=
 =?us-ascii?Q?tiN/nD1SZWQ8fLvMXxmvhUBTjfEFs96ClVYe3Ynd0pVwvw1ot8L12fdrcH1v?=
 =?us-ascii?Q?zcRIZ6Taj4Ecrk4d0+LG73sXsRhqvD3SIFw/aaHnaUTvk8qaNLOFeZm1PWfe?=
 =?us-ascii?Q?dutRM3drYWYdIzMr+bVqm53Ar6c4OgEzV8qKQqWQojNKRYYxk6nxV8UyzfI0?=
 =?us-ascii?Q?WmXMQxs0y8TgbxPZJ2FZXYCbLUK8NbVF8nD5TNLgIB3KuQf+cWwXrWxVCtdL?=
 =?us-ascii?Q?LbVPocjgd9XXVSXby82DeNliISxLgw1pb5FoQi4MGpdKeg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?axp3prmnNB56rvrVAY7HRtLbqSSdfz8+S54QuLOVIsWcHpwhb2NnfZLLpati?=
 =?us-ascii?Q?EST7UfbeYeGC4PZwiA/AwrmehF2LZnG4NwgDS7U2AS6Yd4LIglRRJYfydu6q?=
 =?us-ascii?Q?zOWnh7lPLh6TgOWJlzniUY2A0BqadH7PA3rhPYTW3I6qD2tjYA9w2h8brZgs?=
 =?us-ascii?Q?kuZQnip5/lydHIN5v9aPGQZjomb9VaJHig6KAtEJmI40TEHpbYliHrUAS7Xf?=
 =?us-ascii?Q?kyX7vUtBz/p4pzL8OgByqqa6BSxc3J+wORQSQqwIW4xhP/pPhe7v5NAUt+YU?=
 =?us-ascii?Q?jFEEgS43MxEBNIi2WvIVaSFRHf+2SJ8q55oCAsOLi6/9t4p4RKEzZ+m5P5KG?=
 =?us-ascii?Q?Dg2vSEj9Ihz05pQ5GKPKOn2QUiOE7bOYvy9AevVcVBTM2neZFzF6wuPM6a+K?=
 =?us-ascii?Q?RY2matUDoRFwSIicpnt0WhofpqJxHDl/kIgUj1Gu6lZkhXKxZcCayE0DopZc?=
 =?us-ascii?Q?GG9jVqq68aS+meZUQw6SuKnoNYECiwWhowqI4HYuiJ29t5gWyd0Mg3F9pGmm?=
 =?us-ascii?Q?CuJKOGGpk11+osdertrXC/u+/5nZn6Bv0Hoz4yrr81Qa2GQgP+yh8G6J/PJw?=
 =?us-ascii?Q?JhOBpR0sSLaOTEOrabfkpFlVo9hcgPkq5/HKBxdoIji9n328v72Vh7SGa9hl?=
 =?us-ascii?Q?Ohxw7qi6dBYkY+3v+cMFguDOqQb5VcZXgW2L0zbCEZxenVIxluofUkdBBqKR?=
 =?us-ascii?Q?i2g7dxB6gJn8/qAjbGWB2geUeHRO5CCNJlOEDLL/dk4im77hwFowIhyANIaH?=
 =?us-ascii?Q?4gQA2cPPlJ5fE6dI5fkyIPu529mkcJemjRE/oIHxLWJgnkgPaDTpSjQd/hNB?=
 =?us-ascii?Q?P2oe4nunkfuE7PUnOzcvIA7Gx9HR6OFKe7Bc6ko8J4/4wn5Smvijx3U/PO4a?=
 =?us-ascii?Q?sBFvJQxnFn+MzA01lDZUCqDjF9SS1HVgkU1RkgEA/JlESbR2b2ufacSXAEr4?=
 =?us-ascii?Q?2Hc3JO2ahWNykLdvnN9Wmgkh02IUQeig7WFZMTkzF/vQ1GcO3dMRCr+R21Ix?=
 =?us-ascii?Q?73VVc0zVUlhMvKN0zRKEVVxq1R7fwlaKplWbB84jHC1p1Jg9JXS4Zok/luuF?=
 =?us-ascii?Q?gtvXYEny2BTY/cgmDHekAXQeipjYbKv5zkp8Z6DvcLl3WoEIcZ1M38bLpds2?=
 =?us-ascii?Q?Apk7wedSo/07PIpc8yoy4Vw7yPxnpATeS+CSTb/uV1Ap9FvQ81+jq/0VZHIG?=
 =?us-ascii?Q?cn5iVPbogIY2F9RsZzQ4UOaFYnhvRsPLOboyUkaKY9X5yFx9f/y4osvz9DxP?=
 =?us-ascii?Q?4HcEkFGzB5V4ITvb/rnHOaDWrqbEI1YlPcFXPth52lhsCk9MToNN+JkOenD3?=
 =?us-ascii?Q?YRkGm0tnkUgiU/1cqpul0SjrA6K5purdxAqT/g/3xUmFdNMEwVHdDuOGbu0h?=
 =?us-ascii?Q?j5/YGcS4H+eb6QpQCVPgpTnAN1vslVKARtedDEFaN4jUhTQXrWAzmu+1yG7c?=
 =?us-ascii?Q?4nVnDJd9erRIHzWjwvnElR2QDT5mnZ8mrh68d6JlEiDfCKBHfYkPr+YLtYqG?=
 =?us-ascii?Q?t4r9llxq2GHHvbb+GWRTjupKUrWC4YiYVJPBY99VMJsPbV8JdRooJ7U320bU?=
 =?us-ascii?Q?/UTooyt3qpQfWJVgl9gZBmzzdCy0rHAalPXx2n01?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	a1i5peNIZ2QJXPIIUnV8RAO6+lJMVzMzlSFpwifF51h0XbJBnNUvTGAfjWuPcocC77JBDmq5Wbe5QTRQUk8+e0Es+3I/RLuj19iOTrBLZC/v978+JU8t88wnxsB1afu+GhALMf7jDvwbEp1gIcxw0SNA/3hFVp6Erjgi3D33bkhRXUWjiZTs9aZRfIbgDY6wuKpRQpgwe9f5GHm45RVAVbvsYV+nGUXV1+SAqKh+SrBmIh4Euol4ZhIe2vB0XulwYngbC5r7+XMj3mrrCzBgs7Y8t2YSSIwQnU5nF6LEhjAi8lPh9P693Tmj8KgCy5ZLYwoEuj/2SaqGDCnhM0xLQWNB4j2+xufvrRA4wa/J+aYEB4lLL1OmCLBRSpS4rKfXgmRVmw65Oa739EG+awE4wHeP/Corzq7NywiDylUySOCcNISFlK5GuN8p2JyAJ3R8ByeXjiDo1Cj7TJlLF98Ln0UI10VgOnxn7fAwby/mG8lhBsb9RGHmxwGile5blyI6YSnQfZa0za5lHHj38Wpr0eBHUqmX6bQvHptRnz1PNAWtDnPlFDFXvsPmTt/nXecQ5swh04BOHHMjdBtpmvOYUeW/6EWkyIUiukQ3OSfNVx4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb87ef96-1c43-4a08-7f8c-08dcc7ea930d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:28.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mLL0RFEblOK61IUMHIS1Eva7khnpwq8UM9YlXxySSvhcS1XKpDZtD8ZoilbHUonzNY7a0xjvHquZDq734PuJ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: RpBfMgmFiN-WRq23ZLQMPNoqzOtEOihU
X-Proofpoint-GUID: RpBfMgmFiN-WRq23ZLQMPNoqzOtEOihU

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 09a9ae58..cbde6a48 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -247,7 +247,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	pd.prb = prb;
 
 	/* Get (or create) the provider for the PID of the probe. */
-	pvp = dt_provider_lookup(dtp, pd.prb);
+	pvp = dt_provider_lookup(dtp, pd.prv);
 	if (pvp == NULL) {
 		pvp = dt_provider_create(dtp, pd.prv, pvops, &pattr, NULL);
 		if (pvp == NULL)
-- 
2.43.5

