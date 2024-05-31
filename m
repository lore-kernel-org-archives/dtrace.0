Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4720D7D40E
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717182002; cv=fail; b=BgNWnV3+xGqgCIRLMGIhYvQq+WvEhBIBuGpNEb+FNw5H/oNbpjEqXTj23MAOGRYev5KuqD6jdK5bALT9cPgaydzwKImO3HU4PDOSDF8q4Xm41tckEUMorjlhXBUTwRLbnGxyLs7v28vDFsl4xcldIJ8qjkg9FrZmelRrUg+ODwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717182002; c=relaxed/simple;
	bh=V9swJORDbTwXnWJnyw9AUN5jnlhp5mm1yHyY59JGmCg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NMzRUBnbofmKLlY1+aa1yrpLbu4cCvL3FhvnLqNlF3cxGBPxLF7UmuGrcqtJ2WTMy6KQExIyrRQSHI+DJX8gqRh84rBX+3Us93ug1OlIZIedB6MNHxcMalh8HL41GpQgXkseM+qB3MfXdPbP2f7U/5UTG57qDM0FuJobcIPrG1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VI1tSk006956
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:00 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3DCUO8yib6kOsgqhnn7I/MAybWt/ZtAgK4+dkkA3zwdos=3D;_b=3D?=
 =?UTF-8?Q?b4jJX6LmBqwn9h14h9JOXhmeV7bmllVu/Fxf5QT6j1pBVL9vwjqccsKmbI2KJoF?=
 =?UTF-8?Q?NWB7J_dM34PQEdZXc5zeehy2kKAfxRymaw/2OK0GK6pWPTEMdRGSf4IiyIV6hjQ?=
 =?UTF-8?Q?vg3iVyMWgKT_C4aIkXmErBtempkX6n6JxRHjiLvCvdAlp7YrdD1H8FbeAz+A5tV?=
 =?UTF-8?Q?rLqB09rA7LBj6yoSy_J60KGRRrUvPhP7oO6gyvA8oQMrJQcDy8xzzAw/mZgo+Tg?=
 =?UTF-8?Q?naiAFd17+IJURkXVrWoDsM7_3HjQiTQ9FU7Nd7eS5iLAAtoiPDHvlPe8/zrvTRb?=
 =?UTF-8?Q?XpFmOpYrd8uc67VQOGVha2BGSU0Iq_Zg=3D=3D_?=
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8g9v0wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 19:00:00 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VIsDNb019312
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yf7r2u8wv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTO2jm7KU/dSaYhs6C5qRq/NmCtf6GXYjXDUbc0dhMm3qw8LsIofoU7dHI8+gKgF8R3+FurvhghWbAPoCaATGIBMWLQu+jjqG+TU+xFdH4OAfyzNL9FYRgqgdpGKoVBdbD6xG6M4G2K9w7aDmTMK/narH4J7MkBS1IiaicH+hsaOwpk8E0OFtQmB5RjoTSl1tExBFwTaEsVylGSWfuYjDfpbvDKhuI4SCocMVcluHV4mu+22N7HAz4LDMLlIOKLWMYoV8WkFxFw9tE+WohdQQpCJ2hCKicn/1ofdesaDpIyM9jZn4OF1Qy4CRiPIcorUXy50tb66uGRG9w4nazOWMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUO8yib6kOsgqhnn7I/MAybWt/ZtAgK4+dkkA3zwdos=;
 b=NYYeN79SxHwF8gVK9FtMx2YOApO+Dzfh7tbHmrOduMR4arqwSGcFTdyBbpy0tzqsn0137KgimhYWkh7MbiYWwCMn0x+uqvJ+dWfdZhh0YNNs4JJY+9YxM0sj3CTdmZ9h9o6kCMlz/KST/NIbG8psh7vvnLCCuZY+NrZSMdOAiHonxhYxaUQm4OX6Gdxn+xZJ/xI/y4IWl4ru4lVqPsai2x1g/qf/OxsSPYRyyfBoC5gzZz/GWk3iBYjH1PHd2suXm+l9OcuFkO/HlEtts6fqqw/UGKRNLoRB8m+WVFf6Wx0KUF0ZHvHyZuZGboSn6m8sVT42SvGWB4F+LQG1G7zGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUO8yib6kOsgqhnn7I/MAybWt/ZtAgK4+dkkA3zwdos=;
 b=HbEK83FLpTuvVLzzbOr2CQtA+zL9O0tMiW0c4uqGwhdq/5ry0oSKtdpwVYSDAI6ew79GmU7cKx5GBfg2xFbJmMn5h+L2cUkm0OtDifqQKuVG0Q7O9wPXymsffaXL2BlFggsiEU6u0MtIvxYlFhonP4EJOKft5z0NkLaASQuH/HM=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DS0PR10MB7955.namprd10.prod.outlook.com (2603:10b6:8:1b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 18:59:56 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/9] build: add a pkg-config file for dtrace consumers: use it
Date: Fri, 31 May 2024 19:59:25 +0100
Message-ID: <20240531185928.363245-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0236.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::15) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DS0PR10MB7955:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b133c15-e031-4747-8b0e-08dc81a3dce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tcKgQo9/zdLj+ykqoMnqunLqU7TCFSWQpIwg2EkH4AkHYM3XD5J0eyrs9rmL?=
 =?us-ascii?Q?W79wg3Dip7c0rf0DZsIodX/pyyLjhTRWKUC6GkAcD4FWphj3zSCJZBeZ52Mf?=
 =?us-ascii?Q?kS58v9of/Ha9AzM4NQspRt5hFSfPbNaIzeIoVeE+NpNvk6MwLij3Lb2BBLoV?=
 =?us-ascii?Q?39R8qpWjDNn0PrBzF7S4pwKaimW0ixZr2NR/rWEvx+ktxX2bBz/S37gJRtfH?=
 =?us-ascii?Q?K4OMM5HUHvf8zhfKqTV4EY6clHqULsNhFdbpyY5ZMP9I29ZSwqWEVFWSBl+e?=
 =?us-ascii?Q?R9HOfAH8PeN0uprwPH2PFxAnM2OnK9lr2tves+VsS3VADL5C3aQTWHHpeVVS?=
 =?us-ascii?Q?d9SFqoUlFFp6NrHLhXOjHGsHo8ifFoWmDwHucl/ciJVsvvuApqjHZzXIRWw1?=
 =?us-ascii?Q?UiOswAjfTg4JWFbeENf7huSxQhCsi9kV0/TNHt78w/zMY7iEpl533a+JwUCh?=
 =?us-ascii?Q?U4INWcQGv7N889Q//yQtZn/7cUqCSpjRP/PSe1KTV43Jhqa4ac53VGxoqDE6?=
 =?us-ascii?Q?Z7L7jd/LEwxzFVEmjMyDchifbKFsCvXeCYnSOIYbX94Vgm2r/Sfnt/KFrgoK?=
 =?us-ascii?Q?4rukAYVR2qEmjLAb3EAhADSLz6Oa3/Oj8BfhY/I7TBkHT6UNW5FbtfrG3PbS?=
 =?us-ascii?Q?7WoKKwlHbRZ0tLqB2AdvDP4TbXUHgiUWh1oRRco+/WvAKayevKN3XF+vLAIy?=
 =?us-ascii?Q?TSMO652leV2sgsmDhIcjBWjl08akAMsb62Y7rM8iEDoNJfwdghHc5USjA/oL?=
 =?us-ascii?Q?cHKEEjkmpBGSZGKA2/ZzxY6Wlx9PEAAUhNyK9BgEdZ0wjucqZGHk6/tvlmox?=
 =?us-ascii?Q?LUIpfRIEKf9usmuJjzlmBCqanak8b7K2A0C8sPfkgEDzsS7xOWTUgVZufk3l?=
 =?us-ascii?Q?23qVAOj4EWW4q7mdR/7oqgZekJOc5NGHMocgKe+AlbUimMNSHn4iy4U6yC3Y?=
 =?us-ascii?Q?9W0vyFTzlInl4G9sY+6AvcVAhAxa9cuHWKVt8ZoF/UOIpZgmVrpy2yV8fk01?=
 =?us-ascii?Q?S4j6F/66dMQXDjtWPo9xo6EMmanZMOLhyVPP4t9Zwm57G0aQJAWhJ0jiiFVT?=
 =?us-ascii?Q?W6hOaATkB42dC0OK1EkTPTB7Qh28aoe4ZaTfp92808ZbvD3TXHVTcjp/fCeN?=
 =?us-ascii?Q?8H95tKwMxp6nt64GzUyjmygLXfZ1wJf3O4CioYqPHG/HSH4PECpBGiIdnXav?=
 =?us-ascii?Q?uL+p9w1xu7mn4muf3n7PD99ZWg4XIEjzBu6Cq60RiCCMDRbpI7YRtIsAaU3q?=
 =?us-ascii?Q?tUquanW9hPoSg7lZ/QWg9pipB8pUc46k2e3g5YeIpA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TwtKaSC2bIR/CsCicGzrleSoA4voFfJiZf7wjVlEmQADF/K3ZdgY1kSNqtwx?=
 =?us-ascii?Q?jB+4RAgGHbzB+1xecCtSzONyg1BQtKbxdHs5KBoOtyIhemvMWQv498p8v/rV?=
 =?us-ascii?Q?T88Z/7Fni26PeFR0623z3F5t4dPDBGdvCOwHQlvT2HbSNvHUNJwWt7sWJxHy?=
 =?us-ascii?Q?Fe9t0TBNQjSu7o8QMg/Udk+M+UwdlLoqxVStO/BFWiuh6OfmHCcxCIglHTFV?=
 =?us-ascii?Q?U5Ut51KZZsnWKODdVNVKyc2fX0rnb7ClBf9MJtfaZk/CnjaPMyx2tHgVDs44?=
 =?us-ascii?Q?9MsSRbPegEjxBHEl7eGLyIJI6OW/H+Fg5jGuTdOA99XACoUgc9/hEkWwoQfQ?=
 =?us-ascii?Q?380G4vrU9b097eqqR7Q0/FUIVwIo1qb/x6Xocf1FVupOyOTrmdmlezQ8PS5r?=
 =?us-ascii?Q?mCH63fXVx6cOKs9bKuCWrHP6x8K2PzZEY73WZcf/kExfusF+n/KEtd2nSwx0?=
 =?us-ascii?Q?KCeKqYUdDdrcNo7KGgeYq+FKkpn0RZgPdRdVkdB6dGH4ZF+B7e+Wkk8KQit8?=
 =?us-ascii?Q?eVUVRTSSwkORRPEbWyX/lPQwDeKc7zojq6/aufaGo+G/AeUtOTSTh4RvVP0T?=
 =?us-ascii?Q?Dky++zxfvhMoLnmdn9UsE9bK1+bqb4+y6H/G6udiAQB2j1EJbxDkcePDOqhS?=
 =?us-ascii?Q?WFYa+zFaBcMJLv3pJsC7si6xPZmT7PH9Ag5PQ3qVE9Na+YHalB5M+4EwU/1A?=
 =?us-ascii?Q?v85eS+Fo7qjqR4wW0LTb++gBKlfJPxxJJ9ENax7orQykzKkOyJlbHs6wuubr?=
 =?us-ascii?Q?DDQ5XGH6VMb/G+l1skq5r7wN8BxgXEIoT+KtTxkkwyQoWksIZCR7eHU6p70O?=
 =?us-ascii?Q?aulaF105B8wGlohNbLPVq+DwWYAnjJWLHEwPew24VdT6vkvtpc90KVlhHitt?=
 =?us-ascii?Q?IgwaQ6KO75tuPFDbVrHxwf6P/rP6MOZYCQ4gfS6Pom0knl499qRePoPn5MLF?=
 =?us-ascii?Q?nsBYP85vZ17HTng396t6gICbY1es0KRbnkAfIivvzrzg6wOROsKQujwKC6cF?=
 =?us-ascii?Q?uiS/jTll7wPPdFkvlzPKHVJKv+knFBNx+r1KGc5F+fxVB876q8EX+r3WYA+R?=
 =?us-ascii?Q?VsB6BeJ2fON1RYs7HTsOUIPz+cUSUg4Qnfx+C3WBNTwMsCQLfO1zeR4M1lk9?=
 =?us-ascii?Q?pzjypVwmydzpcsOMTg9jm8cM1u6LZEBJ+dXJ4EmSE4j4Ti7hy9+SG/Yo0Z4F?=
 =?us-ascii?Q?W40VqpYca9LStvL89b3dNQ5HvKraHQc9bcwVToB74F/oqByOYjW40nRdwEPA?=
 =?us-ascii?Q?ybRlzHqsyZnXNiZArNV9QnVGJsy6J+tBMEG8lhYwkqrXU3lZLQ6DfMoMpQrX?=
 =?us-ascii?Q?QFtNnB9AsfjEPmd3LDTQ7Br5L7leXe1T0lSuPj1BOhZ9BKwM2FB+I/UdiOtp?=
 =?us-ascii?Q?e/iWpAmQvrSrgyNAUc11iF5JiEb7DhhJnhYYg5YZqcPgIs2PPLNqfkC2lVWW?=
 =?us-ascii?Q?h79RnADuRpMRlVR1POSBFmnJa+3gyHmcBzwoZVcTDJYOVVKWiyvidYIfGMJt?=
 =?us-ascii?Q?G1GsbBUYM7Fs+P4QpQVRcraXeMNH82FNt0FzLlWAsL8suw6OPKLCSnniv/Kf?=
 =?us-ascii?Q?jpr+sait6oZwS+h2jUs71atmPCqalkSVmPYzik5TWhObBAMi6nO7vD44npQE?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	CMH8v7/Lz+FcOKwrCkPCuKVxkOrnXaxXrhrhvHILQj6gnCMaOSGhkgy159iy0+Ib+kn8Umi5ARrb+s/6YeK3LpSr6njLySnllcu6vd2k7Pw+CWU6beflPfmvJ/CH5G01CFhuPOZVSldQOkk2rVqkRpPjewycCk8DN86KfPbxMMviwyGgc2B8xUrZzv0zHDYsQ+jZFeARcFg+gQAE0uTr8AyUq/+UneCEWwK/l0sn1w72809owN4cnW6VtN0z9ft2j2uhcYA57jVYX1jFwOlci62YYeGGuFoj6KgwPDXgvkXDVOhlUHAuW0tzA8n17xEFQltfgXde7SxCD8sbUqUyi0PMi8Vz9uBe9LsPxkwtkG5C6NxyR4m5S7GKgPrO6rnWBi8XKO0XHbr33Mil1cfA08QOZoyJRclH71uh94ieFbvuSsmi7L8z8X/FkEu4V1sJqmAjUJ823FioTcte9VXFvnfagPpOCs3PJ4VMVTczYDqTCDx6t67RjD/bg4MhCOtUEB9Hf1Zs0oFDgqCyJBvzzZeWgchYlrRVDbgEOlwCZyM+rJHSYWQxWzNnJo4Y11duBoT6SCSOfyWmFHPWc1SHXq1ApE5nz1UxXLKIeEKCEps=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b133c15-e031-4747-8b0e-08dc81a3dce1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:56.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFXL3j13WuFfsU/WzsFsH6/fiO78e15ly497TT0Do13fM88UBOdUhdib76sjnobmh7N3tVT9nsbKPXJQXjNzOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-GUID: rZRXe_9RVRGicZHAs_yz4pELvIC8nI5Z
X-Proofpoint-ORIG-GUID: rZRXe_9RVRGicZHAs_yz4pELvIC8nI5Z

This lets you relocate the include path anywhere you like: users of
<dtrace.h> et al should invoke $(pkg-config --cflags dtrace) and
$(pkg-config --libs dtrace) to get the dtrace consumer header directory and
-ldtrace invocation for linking.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.sh       |  2 +-
 uts/Build        | 10 ++++++----
 uts/dtrace.pc.in |  8 ++++++++
 3 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 uts/dtrace.pc.in

diff --git a/runtest.sh b/runtest.sh
index cc9703e12c161..817f4a90487d9 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
+    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt) $(pkg-config --cflags dtrace)"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
diff --git a/uts/Build b/uts/Build
index feafa21369f2e..7948e9f2d084b 100644
--- a/uts/Build
+++ b/uts/Build
@@ -22,7 +22,7 @@ PROBE_HEADERS_INSTALL := common/sys/sdt.h \
 
 # The pkg-config files undergo a few translations with sed before installation.
 
-SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
+SHARE_PKG_CONFIG_INSTALL := dtrace.pc dtrace_sdt.pc
 
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
@@ -34,7 +34,9 @@ install::
 	mkdir -p $(INSTPKGCONFIGDIR)
 	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
 	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
-		cd $(uts_DIR) && \
-		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
-			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
+		(cd $(uts_DIR) && \
+		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
+			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
+			-e 's,@VERSION@,$(VERSION),g' < \
+			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
 	done
diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
new file mode 100644
index 0000000000000..58aa46fc75c9d
--- /dev/null
+++ b/uts/dtrace.pc.in
@@ -0,0 +1,8 @@
+includedir = @INCLUDEDIR@
+libdir = @LIBDIR@
+
+Name: DTrace
+Description: DTrace consumer headers
+Version: @VERSION@
+Cflags: -I${includedir}
+Libs: -L${libdir} -ldtrace
-- 
2.45.1.275.g567cb0950c

