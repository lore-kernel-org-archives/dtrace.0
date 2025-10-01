Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC92D6E5E
	for <dtrace@lists.linux.dev>; Wed,  1 Oct 2025 06:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299871; cv=fail; b=ACi7lN/YqQvJvsRSLxpTDECMoxtLBTB/deaXvxxw0ngw8/3c3JmfIxQzn7/rYtL/LcOMHCMKKTaXNeY4mTp5Am1tLegoxR+Mb39J/cX/ryXC/NvJNdZXomiZ2KDGtGvmG5WRe3T9WPIe+DEbvLDmwb2rA14lj/zx3BaR0RXmG7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299871; c=relaxed/simple;
	bh=alyNAxvtBuM9LtgZY1EzaN5byhlGkuXPjLLRVYNaG1Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hQeawxPbExVtblGsNbrVCUr1FR3bFHYVEBlJ16xY9CJ6wYDIl2pGTo31me835HXana17V+cS41rGJ6IxqgVUVlikvwnZjBd5sk+MU3XSRoj8h/3bPTp68qDpV23Hz4RKNsec/feerjC3zPXYZujcY6impKzApgLPVTpjRMDfdXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TYfgzm2J; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WQqZ3Tt6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TYfgzm2J";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WQqZ3Tt6"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UKMt6s032661
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jCpKkmqi+5TeyLR3A9
	qoKSaN9Sw5saVrh7HszY9Kt0s=; b=TYfgzm2JEvuM+vqPk70LEgxC9Y1gQPSchc
	klL7FjT1Sgd4rvRQE1/KNFbdyI9vgUaB1EOXQOsQcU4ugFg3bDP4GLN63l+iaHUS
	lTqBNSxLYOMw2o2OSLaEbyzihmOaA1zNDDW9bWNA3Jx8ujPKZdqf7G8YXBDNpVgO
	wDMFVPHFQXX6V7OYtHiSAlg5BHDdVkib/QO0Iy/GlGhRAOMsbc0Wlvgkxqduwkde
	PLV7fHHewDvFyD531ZcdvWX184MIUaGlG9pihzG8cD5UTTUffMIGAiku45/FaIOa
	7ILw+OFqm6lX8FgBHQTxZvX+L/M2GhRIp9Fwi5PJuUTIcPnebZpw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gksx8wj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5913G5Xx000671
	for <dtrace@lists.linux.dev>; Wed, 1 Oct 2025 06:24:27 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49e6c8ugec-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 01 Oct 2025 06:24:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqcJb9jNshyEl99KoV/NOUxee4E36LOiDFy955fvO/T+rhs5m4Nhu0+VPcf6TJVcKoUHN1LXaCdW9CmuOekE3e/v1OkBP8MWv8c2NNgSxgdKZaZfmfj9822+d+O0gfDk3PshI00rl+IRpACOcq/Ll4ivC2jYEaqTneNwNs+lPQXoE35Ajwl3b6l9BRfuVhk54a5ui1xfs936yEKGYyiLenEIo4OtmPNwMgZfsPwq7FsYnNC1BJF8MPXqBqm5e/QBCAn+6rMpmmFnMGCRJGqMWEFg9EvVDi9S90ygY4PAqKXQh8knipSbf17ojaoQT11usTlGA+JW2MftyUNxXXrj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCpKkmqi+5TeyLR3A9qoKSaN9Sw5saVrh7HszY9Kt0s=;
 b=iH/nWVP3k+gQ4n1aydw+juOerCehJ3qLyip0inVhHS1lv15jzoucPcZl/hAEgkjHRS3Gs9z+6sKD3vsMKD1mYMaK6guLDX4AfIS3nU7q4EA/m908wMVNSXMkszZaH3I57kIo/QWJKbHzKLVSefHiEX7A41VexwIZFKn+2mRxJ0CQEkp2MM3DP9HJWed9QOU5CICLE5Ogoq5bqJS/blVUzraP78pKOFOuZfPHzHxQW/17QJoHPt4yn0KqjomGtxTO2G0FJDGwctefNnH3RYlcTTKRTTocZFNMHf8yGYPMK+KK71M7VzetCUmUdecncU7NGOauRTelguksBdIHzoCnJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCpKkmqi+5TeyLR3A9qoKSaN9Sw5saVrh7HszY9Kt0s=;
 b=WQqZ3Tt6N6Jm0mzQN/wVsPLYrz2HQNySCXtlP9GxVwQXssg3bMs6DCSUGCyNMzthDMar2033f2HcHDxeCz41TNqAyVE4zsPW7QuHPy8QPrL4XzZeFB+MOgeEc4coGhOcGHJatvfH2hGEbEwMgcDMYe5oS2O6lmlm+sdODmPyISM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7078.namprd10.prod.outlook.com (2603:10b6:510:288::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.21; Wed, 1 Oct
 2025 06:24:24 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 06:24:24 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/5] test: Fix some ustackdepth tests
Date: Wed,  1 Oct 2025 02:24:16 -0400
Message-Id: <20251001062418.6902-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251001062418.6902-1-eugene.loh@oracle.com>
References: <20251001062418.6902-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0052.namprd17.prod.outlook.com
 (2603:10b6:510:325::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 55904561-de45-4777-43db-08de00b32a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fu4QnHQhIqUoeHVug5h658VYdAavrfLMD81Mupde3HWYbjLus8gJffzYj3VH?=
 =?us-ascii?Q?BrvZBCFBQWIQDgin886NPLpb/HSFVVS++qQoqmsenjxMJZWmYPvwZY/7dAka?=
 =?us-ascii?Q?GBKutQBzmZpjQ6LsOymHl/OZ/MPes0KNFNweK1VwSD4F2w7cWQ7XOntwrmh4?=
 =?us-ascii?Q?BQax3hn5BGDsYCgyYX/gl+L7D/ogc8762feLwFRYJ+2JKwhx7LiVfKIPXS+R?=
 =?us-ascii?Q?DYURBx2R116zwMD2OXd617fRnu445B6sfBUQziCuthDKUkiuU7wa9dRJ3g7k?=
 =?us-ascii?Q?2gaO7Fhp+zF0hLoOzhdsS3+9JfgunSp8l065j/qr28vlNj6IKoZmhC5tWP+V?=
 =?us-ascii?Q?LHReh3LpBieOLCBJhi+HXRWLeHlJ38swPrZW6AqdfkJod7utWP/PM+1IkaHM?=
 =?us-ascii?Q?ts3vwJak3d6PNNDnBWiN4ZuvQuFpCJ1qs5BRvw6m/8x2Emn08F+nA3aHFuqy?=
 =?us-ascii?Q?kVC4jkiFTGoV35FjpR6CqrpBui5EamyAK0aVwk0jCRqGBLqH6U5TdOBZVwFs?=
 =?us-ascii?Q?aNjNGiq3yb8BcaxVgZ0MqB/ArTotJOXIEzqHJ9rb1dQ4eFDqUHfjWvMQYfJp?=
 =?us-ascii?Q?6nxUnabgHyC/B+gTnzocYIVI5xw9lIn/ny5xAbdRjUu8XlIQinOGxIYXo8EL?=
 =?us-ascii?Q?qQKAZ/f4qdc2iMMMxBIGco8FJQWosk8WUQhkmY3J+3ivuoR6vFPFrawLK8TH?=
 =?us-ascii?Q?ePykfmt13rl1cGiplV8ujkKAvLBrEAMqV5uj58cxa1bcZFb/dZ2HgQ8Vy2Fl?=
 =?us-ascii?Q?uS0p7DVODw781oqQo2eq5jaZt5V/GAadd+lnVGSJORfzmQ1lKyWVj8F1S6P+?=
 =?us-ascii?Q?CWRztiUFZ55+j+diFFvUU4Mal0wV2Cw59EIyXCObzjOp6KoLKxHlT/pDEG+Q?=
 =?us-ascii?Q?a3wnbcDIEXdBQMjxPIiQDKsGrnviOY28tN4xXG2tKWr6y5VLEfnDaYni2TTg?=
 =?us-ascii?Q?06VeP8K9l8OyWF4lIozm3EwRvZ8AoAkVbOw6Rylv0kc7qecapuKjEmI80T8r?=
 =?us-ascii?Q?7tp7nQOEgTM/69ZHX3Neqt/6H/XksRCOWt19TB6ZN8jA1KLmrP9zcgMRLOya?=
 =?us-ascii?Q?ZUJsv+lcbrMN4ORpVvSpKynyziBjeFpU+Po3/wpXkvR881M37iIUdm/ka4hq?=
 =?us-ascii?Q?c2e2KHzj/ihmj3h0gTmljeo4+MwcxFbsSoB4bpInHMWpt0j8PXdfqDL0Z4OC?=
 =?us-ascii?Q?MK/cBAr2JkkLuQlgifyqPbJBKflQQDYfecNDCR/JB7jFOunxAUbdDvaVq4SS?=
 =?us-ascii?Q?gWvsMFe3oGY8J9YPVVnAEc+YSvD1BrWfTKJSV/D4I2Pl5i/chG7zDPDW3JkL?=
 =?us-ascii?Q?I4MT0Yfz/GcYKNusfSVVwOcDC136+yOfP4PRKg2z0XLUXdYL/BXV3d6PiewE?=
 =?us-ascii?Q?O7n8m5iKcacHCzAZZPV9MG1ZB3yBbHZn2U9hBlXfky5ozbbTcVsGXjadSOQF?=
 =?us-ascii?Q?FoSIkWJ0dUCYVQdOM9sUmDwSaifrQ5t7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S+njm+01IN9lXoOSu8qf0pyQ5YsbCvnTLLOcJ3rYyrh0C4AIN4g70Ge1g0jN?=
 =?us-ascii?Q?aFj81LnUdnR/f9sTGKhxmXeBJP7GBQQr7ihTIqZl0vVsq5X6wjcViIhnAh8L?=
 =?us-ascii?Q?glDAfebFD0aFKjgf+2QzGGYLWMtd8PLSqBaxZUD9+RyV93vAi71TrpUcoy4W?=
 =?us-ascii?Q?zwb8OB8QM8CZKThaKe0F8CcSQZxe/1Ou0m0R9b2Bhf6QuvNuErIkNSDZZvga?=
 =?us-ascii?Q?xotqoRXmhiwc3WlvGDoOf2F05QAzo+zPZw72DrBUqIrPFe5CyKob1au8m3M3?=
 =?us-ascii?Q?SXXJa4zD0gZVAqhhqm3TFglDQxASKhCTZ5imC+QfSaL+s55Jp9HwdaqQMMi2?=
 =?us-ascii?Q?ekG+O/1iDcLAkDgTlmT2UhEw4oBpXAJ40yyGe7O23Lw/s4S9m/8vqrUBHtKw?=
 =?us-ascii?Q?KU8Vc7tbIySx5857bT7dNQvEBtHbTIxcAyjxayKckn4g4DJ/wfHXOo0DjNfq?=
 =?us-ascii?Q?ye1yGREuQI6NYtQeu4uPlTpOhuKJ7XduUTp7bm+QeYK2ZIr8ARVS/YxExlPR?=
 =?us-ascii?Q?twz2qQQJzF3GUF8aCey6/claUTLqOtuh/W6iH6uIZpC8oqgzCddHmqrLTR1j?=
 =?us-ascii?Q?hWUTl/RqDKZ3enkXWkG8ZstbSthdhZtr73Y4Oy6pZDsQ58yoqYIwbswUnFfh?=
 =?us-ascii?Q?iCf4x08sffRMt1C5infhAuWLqGWdc2RzLc106BVpvjSHVb42IuGx3Gt93jtP?=
 =?us-ascii?Q?puNGI3f9kPfrEpwEAyH90mL3m3gLLV2xly74ZTkOVFJkbNPgaJwXOrUu77HQ?=
 =?us-ascii?Q?4qH6/lCI+5KtB7aBNCDkbTBI/hXrm0GAeg+ru9Ftfovapo4S72qsboXDdT0o?=
 =?us-ascii?Q?gRShiCvR3qLG2aoKTjZSibHGGp9194rlSec2bwhsajiZ9yefkAxvbZSSXD1V?=
 =?us-ascii?Q?P7kSf9VD7gFijYpVJRBHozy4wHvS2scU9gWddunYDJiYHc7WR3USwOYnBUj+?=
 =?us-ascii?Q?Yt9GC59QOtvc7rHsQ3fZxdMPPFgHzp9JTHar6/U3TqHf4xvzRO0OL0+XSPQT?=
 =?us-ascii?Q?gsbK+tFKAg9b79PSTcNa8ApNqOa+Jc9CAyv63yPHCgJF0M9settMP+fFUK/K?=
 =?us-ascii?Q?+lWqi/EAl/i59vSVlXavxCmxJV+xLqvDY2iAdM2TdC2AVStPfKLQt1L5SQ3K?=
 =?us-ascii?Q?kJQS3U+XM0Sbj/K/qcI3ZydQLZDMwSexKfZ2oqVeQhn5kNU7SgHjj/wPcGud?=
 =?us-ascii?Q?upsMozJ186jxGoZdrc3Mh/9AvNUyVzvrMnYS+euDKlVRAdSW1KS8qppFI3a5?=
 =?us-ascii?Q?ieUvcyV6q6/KH9Pnh6ZOw07UhiVDXVFH/fmka7R77cHuGEKIkj9V1o1GKMe3?=
 =?us-ascii?Q?doa1VZ7E2FMWBCAzjuhgFdgWKZUeZ9bMb4HXUtg0O/vpXa7OBRNoXJoGMq1v?=
 =?us-ascii?Q?+oUdZ657diWCpZX3vAvz4nrd+4JT1DovlFhucDpqqHk7MfCFrgM6/X/oTtra?=
 =?us-ascii?Q?FgvMVgdI5OXb+fCZS0CZBqT9MyGFoUGl0PyRUnhDm4c4Y7rJcmGq1Ol+BxVS?=
 =?us-ascii?Q?V/vkgkHuOBmVlexExu17MdNJBvcgS5y8WSOpsPhkTaNtTN6HUfwTab53b6+3?=
 =?us-ascii?Q?f9vd8krkRuh11ovaXo8daXusbt6qMajYjWjWt9y7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RP0vOmVdW+Trtv5ABzlaSAiTIcWn3I1MXY7g7Iw3066xosYh0hy3gduBjpZWG5+Z/zpL2QkZuupFw1nVjaNRufJ2yzS0TRacGXscT/ak2U0kbkEPpJMi1bapgk2+5RYk+mk+XowiUhS4U3Xo1Q6npg5kAn95MQGs2EVqqnUeVqhRzv8e1iaoOKFMAKb0vD20TLBzMhWFNOBK0HOSWfHcuVK+VWs5vhNNWq89Q0L3Y88g0U55LlI4kIlwU01zyKGXWuOTP1PRib84+SIFyjJjcht1Sb+TcT06FgcqlHxPFj/ToBcIelYhTlFqOPiD5OE/HC9d8xEDFYHuRbKoD/SmHB5WpSRXmeaPZGtnVqcaRCQ1XpR5lZGCL7VDZGH6r9MXvayJ2QdHjwA7OdYbp1oNo667rKIwgADOEcfDtPpgNc6xGQk5oAQ9s8rsv+djDmTcOBLy/hgLpClb9p8P1bqoBeVbloiSmeL2f2DiGJOCjIUwrd/EyF7IrIqVXRqM3VgH+V1fdBvrYLz1OUy7vsPHpMWq0ftfNnpBTH0Tj1+8zJxrLwpWUMR29/WBW7fd5V9q01cqmvw1W3RbIDJtWWmVt8AAhCZsznANYNwvdpSPNHo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55904561-de45-4777-43db-08de00b32a7e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:24:24.7072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KXiKO55zVEht0EoaYnEfv432sh70ai4fEXPov916EEpvHfIFrv1rpUm5QszhKiz8cwsYDP3/kOUeZZmIVlDFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7078
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510010048
X-Proofpoint-GUID: v-Mi8xVG_o7i2Gqtx73RKzpv1Rv4G0qd
X-Authority-Analysis: v=2.4 cv=N4Ik1m9B c=1 sm=1 tr=0 ts=68dcc91c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=eA2J8QB2lB-IZPYvhDoA:9 cc=ntf
 awl=host:12090
X-Proofpoint-ORIG-GUID: v-Mi8xVG_o7i2Gqtx73RKzpv1Rv4G0qd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2MCBTYWx0ZWRfX51/d5VSfs9VY
 3jI2DeiFXTUgUygZvXnIWD9slFf9+8QfI8c8/SDWjDBF8sX3jGOiuNF5TuwKan5lVI1Ac388HHw
 uO4K8mxJm7wZBWEhEfj8RmlmXZ7UOA84UJCqrgUZFUaRumm24hLqjBsJ7WyA5zPP2F/zdediDys
 9lLYK+zXHwlkvJoi/P/A4J3Hv8Y8WM1XkdRYEvu15ocxNI9HFf5XC9Df9S/QSVMI9cWcnN/C3kw
 +smQsv2uCgQxNlbiEa6gVIhZ6SwLmIQeBbSKRujs6rCYJ+GHwa5O8ma9O7ZB5/qkNcwKrse+TkS
 GN85X2tXs8bFE1/avDUk++V3hFupK9l/dtWDir/yzHd625pu2wIxkOUvaoA3ehbZF7LaDtRggR9
 jl8MVMGy55iKoRvs3/Gp6AEAzMXSkfqOUHymyt1mqZuJZkRU5f8=

From: Eugene Loh <eugene.loh@oracle.com>

Fix these issues.

Issue 1.

In commit e48bf6a23 ("Add support for built-in variable ustackdepth"),
tests ustackdepth2 and ustackdepth_big were introduced and their .r and
.r.p files were links to those of the stackdepth2 test.

In commit 842eabc0e
("test: caller and stackdepth tests for fbt provider"), the stackdepth2
test was explicitly renamed "fbt" since tests for many providers were
being introduced.  The links of the earlier patch were not updated.

Issue 2.

The ustackdepth_big test modified perf_event_max_stack.  If the test
were interrupted, the value was not restored.

Issue 3.

That ustackdepth_big test only checked that the stackdepth was
consistent with the reported stack.  While this check is good, it missed
the point of the test, which is that the system limit could be
increased.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../variables/bvar/tst.ustackdepth2.r         |  2 +-
 .../variables/bvar/tst.ustackdepth2.r.p       |  2 +-
 .../variables/bvar/tst.ustackdepth_big.r      |  1 -
 .../variables/bvar/tst.ustackdepth_big.r.p    |  1 -
 .../variables/bvar/tst.ustackdepth_big.sh     | 34 +++++++++++++++++--
 5 files changed, 34 insertions(+), 6 deletions(-)
 mode change 120000 => 100644 test/unittest/variables/bvar/tst.ustackdepth2.r
 delete mode 120000 test/unittest/variables/bvar/tst.ustackdepth_big.r
 delete mode 120000 test/unittest/variables/bvar/tst.ustackdepth_big.r.p

diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r b/test/unittest/variables/bvar/tst.ustackdepth2.r
deleted file mode 120000
index 5cc8498f8..000000000
--- a/test/unittest/variables/bvar/tst.ustackdepth2.r
+++ /dev/null
@@ -1 +0,0 @@
-tst.stackdepth2.r
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r b/test/unittest/variables/bvar/tst.ustackdepth2.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.ustackdepth2.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.ustackdepth2.r.p b/test/unittest/variables/bvar/tst.ustackdepth2.r.p
index 8320b603c..e50f12822 120000
--- a/test/unittest/variables/bvar/tst.ustackdepth2.r.p
+++ b/test/unittest/variables/bvar/tst.ustackdepth2.r.p
@@ -1 +1 @@
-tst.stackdepth2.r.p
\ No newline at end of file
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.r b/test/unittest/variables/bvar/tst.ustackdepth_big.r
deleted file mode 120000
index b6a2d6bcd..000000000
--- a/test/unittest/variables/bvar/tst.ustackdepth_big.r
+++ /dev/null
@@ -1 +0,0 @@
-tst.ustackdepth2.r
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.r.p b/test/unittest/variables/bvar/tst.ustackdepth_big.r.p
deleted file mode 120000
index 0e8338907..000000000
--- a/test/unittest/variables/bvar/tst.ustackdepth_big.r.p
+++ /dev/null
@@ -1 +0,0 @@
-tst.ustackdepth2.r.p
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.sh b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
index 777940ec8..e84850c02 100755
--- a/test/unittest/variables/bvar/tst.ustackdepth_big.sh
+++ b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
@@ -14,11 +14,19 @@
 
 dtrace=$1
 
+POSTPROC=$PWD/test/unittest/variables/bvar/check_stackdepth_to_stack.awk
+TRIGGER=$PWD/test/triggers/ustack-tst-bigstack-spin
+
+DIRNAME=$tmpdir/ustackdepth_big.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
 orig_maxstack=`sysctl -n kernel.perf_event_max_stack`
 echo kernel.perf_event_max_stack was $orig_maxstack
+trap "sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
 sysctl kernel.perf_event_max_stack=200
 
-$dtrace $dt_flags -c test/triggers/ustack-tst-bigstack-spin -qn '
+$dtrace $dt_flags -c $TRIGGER -qn '
 profile-1
 /pid == $target/
 {
@@ -32,7 +40,7 @@ ERROR
 {
     exit(1);
 }
-'
+' > D.out
 if [ $? -ne 0 ]; then
     echo DTrace failure
     exit 1
@@ -41,4 +49,26 @@ fi
 sleep 2
 sysctl kernel.perf_event_max_stack=$orig_maxstack
 
+$POSTPROC D.out > awk.out
+if [ $? -ne 0 ]; then
+    echo post processing failure
+    exit 1
+fi
+
+if echo "Stack depth OK" | diff -q - awk.out; then
+    mydepth=`gawk '/DEPTH/ { print $2 }' D.out`
+    if [ $mydepth -gt $orig_maxstack ]; then
+        echo success depth $mydepth exceeded original limit $orig_maxstack
+        exit 0
+    else
+        echo ERROR: $mydepth does not exceed original limit $orig_maxstack
+        cat D.out
+        exit 1
+    fi
+else
+    echo "ERROR: stack depth does not match stack"
+    cat D.out
+    exit 1
+fi
+
 exit 0
-- 
2.47.3

