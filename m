Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C90205E25
	for <dtrace@lists.linux.dev>; Mon,  8 Dec 2025 05:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172483; cv=fail; b=gkBbp4gXdDt1hxPIbss3Ntu0fJk6hRLEwWsLeydfl33TRtoeZqAYjU+kHxnXDOzexh9uODcA7ckmUQ+VNbU8N91hTDyDDx/rn11aMTzvTJYLIMiD3utoZXT1DWkCImwghnpFIc+k7gm0ilT8CqLwd2oUoRKWaZ7iJ5htN0jxzQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172483; c=relaxed/simple;
	bh=j1eMQ7UW/1kwSBC1i4ePLc20VWTXmBUDvTqmXLkg5Dk=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BOdEccSE6gU7q8RdlcNxYzhjgf4WM0zZEK3BmmY6efC15oqffZg2+aHI7wn9GyNBOJzHOHgSqFwD4QOI+FbrHYRWd8pkLcwFKeIBVugMJl7JmGezDSMh+edKiSiMK4RVApNtEtBQM+yxhC+fhV+ZF4wftE5qgB0BU6rbWVIKFFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gBbD8S00; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yLqUQBNu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gBbD8S00";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yLqUQBNu"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B85K1u91751150
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 05:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=iAQR99PRLW2YziPITq3sdGo74MODEifcHtBAwccT0r4=; b=
	gBbD8S00LyMCnaBNE2mztSBdpS/uFtv3ULpw6GvNjrVQ+tpk07wWfDcfF40W3xUF
	vwbkbgDXJH3wi/MKVSVDC8DHGP5K9Rh9FF6KMJWUDGLSokZ+7qfhHYkAt8nIlRSG
	SB+QK+iwmsAsgB1whGRUlHx9iOsYnW61xkHCY3eN+hSJ/rg6A2HsCJUm8xeuwaz4
	K/fp2jy1+dilZcKFK2ff/EbVKabAub33zQHUhC/ca4pOy00WZ9+eUC8VsMZca/Cy
	5zQsEj3+j1cslA6erQW5Se1E/THXd0vQVURD7qt+1I6U40DQ1BbG7noOk8RrV/vm
	iP1AGaxKvvDKDLciALHB+w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4awreg00f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 05:41:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B82HJ8k040639
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 05:41:20 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxb3dpy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 05:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9RSp3IV4yrecTOf8qBdWGry/CYPRt7MEkI2j/5kVjES37aPA3XYV/HHyqhadS12POeJ+7bxluFTubYVvmwMpDJGFp/E/FR0QFc71YfGBSK9Q7FscFErU4CmssYXV/l7+kLy1zWx8KMn/QYMwXt5E490zy8TcRtT0LMRSXTRNaaB+qgi9kgIfOveA576KpjeWvwXr3Mpstcw2xP6XIeE+bl+f2quKoAYQ65HAjzaTdzfr+YQqRCLC34uOVG1Z3+dVObyR/V4Mf1d9hLB7Niyq00ZG4oNA2DOFbLYqSvM1+JNpLe2dsngbWcNT8WEw91QaGi5WRKvSI1FTZLLvzVWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAQR99PRLW2YziPITq3sdGo74MODEifcHtBAwccT0r4=;
 b=qcVzbMkqIlQ0Hb/ZotFT23bGeh18iABwkvEb7IwsgjZvsIMLGbPjhSXxzAlUjIsHW8fWNprlg8T+OURLGDq7rA0winc4VEVGThBL3DOWAL7L1GzIM1h/N4YXxpwPgz7BEbjOjEgWqKq3Xvcu+uuQBjnpR/GffwWojYRXiW+LB2+rtelt+gEzuEwy4y5PVKuIcfQyFcH+ih+ezSLn1411BI4UzCBzaHxkYRD6T3q4XuMVP3ZRPZxhMYd3H7xziy25rEMUu27wYqPiCRMmNH9wCNChV9Niwssb6aOxUk0yE2EOMdp8x2oPIPqEyd19J+ebhzLjWNoaEbtq7IFPZbelfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAQR99PRLW2YziPITq3sdGo74MODEifcHtBAwccT0r4=;
 b=yLqUQBNuvWyNfP/t4aegSAK9/ugxiDz9jtGCKnthglMwQxfBK24Vehcjs22Vs5O1X6TUbZhfu3Tng8nqRAZpEYuEvYUPID//AKQjXZ2KEppnsZAEMV138eCRaGfLxsTT3WVrOCe9ADl2dzHN9sULWncposOWSDfgZsL/V6W3EzI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5120.namprd10.prod.outlook.com (2603:10b6:5:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 05:41:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 05:41:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] Fix comments in rawtp provider
Date: Mon,  8 Dec 2025 00:41:13 -0500
Message-Id: <20251208054114.28036-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::16) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 8440a915-221b-48ba-4916-08de361c6813
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fPZdB/WNuNVHzH9qLbU/AP9BulJcdfWIpFjGhLJO5ffs/4gAQt+qi7z/KuIv?=
 =?us-ascii?Q?B+otYPUda1/8+5wY+s62OoA1QGKVg/H1ZXdql+6WD/hFK+KpCQpgIbPWLjWt?=
 =?us-ascii?Q?TzVfhvMVsgP8f4jreyZJ5bheXx/poDrwNul9HVP3C1DUwsf+CKt1hTvYadEz?=
 =?us-ascii?Q?vG0kUp1bdGEsOB8rX7LBaFAUWokXj6Y/wMhpVAdmVW6Ay/GvGnFywiu8NnD8?=
 =?us-ascii?Q?BWgaPe5caWI0Kr8ztkhzedQqp6VtSMKvR55Co6jn3AvhpAA9I7mlzcHnTf+f?=
 =?us-ascii?Q?ryIUjteXJR7yv94GupcLM8GIrkx2Ah4DE3ju5s41b0HJDlS3LXQ+6eqSEmbM?=
 =?us-ascii?Q?/PS645Kz04PZ4gemrDtGzY1TQsv/NHEJI+DMUYtuLEDE+qhQDguyW8PJ3oui?=
 =?us-ascii?Q?S8chKzitu092a5skFU0eFILNtKjW76NstzVWHvEnGWoaTzAL9BmVHQbk3yVX?=
 =?us-ascii?Q?MxQ+42TFgH9j9cYR9loiCmoFS2vEV94SRAgIfD7Hi5MrLt1+8ci4H+VaS6my?=
 =?us-ascii?Q?zw2i7aaM58lvuUep+bBNTwwYcu+oXFzqdrUfCKufvcdTDJzsnVUiFqyjkxOB?=
 =?us-ascii?Q?FRYjOsKVby3RWaH7aE70WktdZ7EJQ2i1IWf5+U0UM19Z/9B2G3Df9Egp0r8Q?=
 =?us-ascii?Q?UC1v0L+7Q09ONtb9hsM1Se/ZOJ6tBSu24P+uk5BP+aRr95WiFZjBDbL8KsyV?=
 =?us-ascii?Q?wmnhjmJWxqFharkFlenC74kAJrcYvVWIKYW7uUJOq/4cv8956Wx8JM1kmsA9?=
 =?us-ascii?Q?g5fJhlccSKnxrruZ+oHO0a2pfi3Ogrhkeyn0iSesMKXIen+LDtNdzVMeTZhx?=
 =?us-ascii?Q?K+xkyky2U262ooeGGKUlYz2cyZ2+8RhUSnmZeZGBUdoj4HjUL0852wzyYQ8+?=
 =?us-ascii?Q?K1nrvr9rNxmFqZ/A1Z9ebpnDTuoWC/SEf1RRnfRvlQIimQvO8KO28i0heo4O?=
 =?us-ascii?Q?C1uEO3B/YqB/IRNYaSTgTPvTWTkTKQKR9Dk6HwGzr24Vh0ma4j2np6vIW3c+?=
 =?us-ascii?Q?dcB/WLdKa6B6nRUG818F+/goOPPRoTDya0ATdh8QI6+ibclvwB77kvOCcK/x?=
 =?us-ascii?Q?GUZD2BxYok93ZwFwWahsfG6PWT4StK6vc/99KU+Imt3UlYgXTVxNirq+QV0A?=
 =?us-ascii?Q?cVmjJa1QNfGFqZAif4pAJnqco1W/EFZn1yNNUDsygnn9zkm9XDeDTS59DXd7?=
 =?us-ascii?Q?7ZPmiV872TQNVkLSGBzFnL9s9JTDNOX6pC3i/H5njGf97EDbB9U/5DX8quqP?=
 =?us-ascii?Q?PNGmgBPmJhCI4TYiyBR7x5oFHMRoqtwUryeuwglemfz/V8p7ZXt188k/Q6tl?=
 =?us-ascii?Q?17eXj+tm3CiBhOnDtDuMUzmkHtNwAJeiyQDdQ0r3fw+tu4u9YlXpKuMXRGwT?=
 =?us-ascii?Q?vyTIZd6Xl0LqM/8Xr9JG1D2/+oc4HgtUlhG2cbVcRyOplWaUME6wA8dh862N?=
 =?us-ascii?Q?2zAT+49mxyP9lLn74USIBS2ghlmDBQFq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hropu4DHL/LTi3rbTpkb7pgmOA8ZpuIn7rvJMUtpIyP7khjzgAy3i81x7CSG?=
 =?us-ascii?Q?uOd6s4bdmhxxy0Cn7Fwkw1L8az8NXcAz2PZVUiEcMcDsUku60QXlMsURjk0z?=
 =?us-ascii?Q?uRPYkKiRenRfrAQXTate0uiq/ujbVnOX4vyjgapopQ47mMjtd6ftnN4aZNnD?=
 =?us-ascii?Q?R8UZJjOvXAp79LQe+tHIqjtO7f6wOu49VoLLuWGslfCh0Rsqmpa/bc/61Nnr?=
 =?us-ascii?Q?tbTKa8rkdzU7O3UUF/ZPYzMUR8WFy6zUi2sEB8cGzCl1PQsev2QANyaaxhag?=
 =?us-ascii?Q?+c3/fXhcK/DPzQeUFpJ1W3G29bjOgAvkxsg45T8e2gDvZ3FiMcczoW1CPrAf?=
 =?us-ascii?Q?fpqH62VMKJInBJF+NchI6e41nBpnqPg5L3HMGGqaWZWikkP3rgNkZ2SVzNtr?=
 =?us-ascii?Q?3SOxCNGWojj0cAOlVgmu8Vi/oIHC+U8YN08RlaLM4HvHLLABZbybkCoBCTzB?=
 =?us-ascii?Q?i+wPKiuOa6pcvqIM3/o691Ne+W/aJm8JEOkM1uvCie/VA9FVgk7oocIcvohE?=
 =?us-ascii?Q?s434UHEB2kcKpki2u/3n+eQ4LWEuRvIKoNrl1alCA5Rut38b92EC8sncwJ6e?=
 =?us-ascii?Q?OhCMSh6OV0MF8ku7F6RlCkvLHr+s03X+pNBXpmhRy2Jc5gOCxjzajGriyuj4?=
 =?us-ascii?Q?4J/hzW4vMU4aA+LMQQfyzrgPY9AJI/ASgBUzWfkmppYyGWdvr+/nEuxnQ26t?=
 =?us-ascii?Q?JkS3yHGvIlh4oMo5wB+ZYJdGd+nnOtaLBsCbzrd3Tc6KUa1DvkbLjVM3dU/0?=
 =?us-ascii?Q?L9G3WOvYM88qqkbYujKhmFv3APRde03BcEYjFNn1vtjhqjipyosGd0Jx/Fol?=
 =?us-ascii?Q?gcte0Rw74kshEXioO3m1CI9NTi9ayquXpQP9GIlJRvl88fgeKj3ScwmFpFA2?=
 =?us-ascii?Q?X1nbN1bD7WigUxvUxCVDfG8/Y8g7zXnUQ0Gz8h+a+LHCe951+RBJONOiUauB?=
 =?us-ascii?Q?zoHreL3sPAR4zLrZ6uVIFrVXtsuac5tCT4Jja1I2/Ye4vwio1Wr4ivo3/UHr?=
 =?us-ascii?Q?1JEdlqwHTjhCIvMk0tQ9/bNuko6GSy9cYqcuBrytWbU8VcLs5J7TW9rMrnYW?=
 =?us-ascii?Q?VIcgiAbR4Qu98nmYGZrRl199mfFeoOxCsoaC5sbZoXrDFlX4OWnKDKfQ2m6v?=
 =?us-ascii?Q?mo1hKEd6FRjc+8V5sv/zKnt9XFrRRUyYe0GChmfRArH6KO6Y++9ZmItZzvVK?=
 =?us-ascii?Q?AqwnD3EAjySC9jUQdx1Xa3SH4S+7uwPVNEGEUzNI1dP5CpjJsLOfDldKMA40?=
 =?us-ascii?Q?eLq3smXIEmoh9IgvkDgqBeXbLVANp/6hV0AUSlvw0gwR3LCjMofBYcxkDC7f?=
 =?us-ascii?Q?K3+jFU4JQNyOgwZ9bhbiQsizLQ+g6D4cBSEa+wKus4WJXXJSVA+6rd+eucFz?=
 =?us-ascii?Q?HCMpVYRAfO09Bc5BrQrGlK0+CuVaQGoNzmwqy9A0EJgwp22qvwiD8t5T+nwE?=
 =?us-ascii?Q?aRxi38FnG3/DqiNJeYldtDDvxLDBv7fflGJr+iRsf0BHlebIRLMmZNxg9vdK?=
 =?us-ascii?Q?seQMaCBzpYvhNoEQJVehk5vgBm6K+9fo5PK2pLMKEe4aRcj651A6mm7LESWN?=
 =?us-ascii?Q?DbmN6+RPbTNaDSPqSBO0LSTnjHO9qHkzK8CaXVOr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	96ltaXWhbSk85FHjePhjvJIPLlVhwvz6hPZ2JOaFTwMZ1llS0hUDAdGKgjLNws7t92RqbMkGSSdDtouO50aIjfw6PucM7EPPQYAw11rSjAZmkRgbp9zgbEqkBvoUMRwmD3UziyuhOLzEIlb2mpFGc48m6jt76ygEpfICFAxuCF/r1i3IPXcsxQpFqXOKKxmzaM6ODGKWVMltcXgSsPJ28+mxhtfnCLvpClM4FHuV1uYnj/YeEXW8qVdL4jpSaVc8dPe/U+6WaL/n89PSsIqiXtWPI0Z+mHKL5XDDZ1pbsfbRKAy6O9jogvU+TYhTPMVajKeRE5yjS9h8NSg3xOnjLAlYxCpQW/1bO+fv0fpmxfb9y25ZQlFQ8Poqn0RcSriTlqLKt/F/IWNIf7K73+VhhtORQJmbvPY+Or9acflFScyarMAuhgULFcc/MSj2Bw0P05ue/OkgXjXuMnwIlj8Gi5DZkPzCQ23027x3eznhqPdn16bfAzrakkCjQoTxvr6ytM6+pxDoDt/YFsw6HPXKdzkoU+E1gkmfgETOQaDkXlFA9XQA8fcXAn0kKWYRqZd0/FIC2SVSHOXNq/l40yAeVe8RifdCeU5m/WCwEhaQyek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8440a915-221b-48ba-4916-08de361c6813
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 05:41:16.8314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT1LYQSdw9ZoceCqkrS+ByWYjZ1leWV2F3/lvUPbYmORb7XGMjFZFsYLLFvBvSEd4DyEu9dM+T/83l1aOhvt+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512080046
X-Proofpoint-GUID: C1oExOYVdspzNL26JxptFxxLoFsBR8HE
X-Proofpoint-ORIG-GUID: C1oExOYVdspzNL26JxptFxxLoFsBR8HE
X-Authority-Analysis: v=2.4 cv=G4oR0tk5 c=1 sm=1 tr=0 ts=69366500 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Ym71XylyXDVb4s4yo9YA:9 cc=ntf awl=host:12098
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NiBTYWx0ZWRfXwGb4mQs9JBvb
 KXbCZivgR3EQK5LhwAL8JKZ8lCVChEksTEXm7JiyU0KuLOW5wCg6ruxIRhwsWs5Fk9EgRfarUkB
 0GianHCpcc7cJjMckc4j0142Fe/qHgHNp2emB9ydjd0yswl8lXlym5dnolgjR/GzCAThDSl89rS
 J4/fhrZbrGfWpjsOSrGR2Ltv9+Y+aL9RIvC7paY81xviwl2OvcrX0kHCXDSDVGl2BUWJNOu+GV9
 +Yxsph5EZUNkT00UUDlaDXO3Lb/5P3oTD0feFTMcv7dEMQ76/s4NVn4sFCYo5ykXmzhOjnw2nxC
 jb4gyuQWgc25gGdBZwCRyPwh8lKI7UhUJsjSvNClexBJg5jWfLClBVx0k2jcPuem7IJ9gxqUFzj
 OqDKLCspGPd9vjsg2hDAnLPX/d/KBM5H+NhySu2c58FxsJ/ASkk=

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_rawtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index a36bb51f4..709f7040f 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -118,9 +118,9 @@ static int populate(dtrace_hdl_t *dtp)
 }
 
 /*
- * Generate a BPF trampoline for a SDT probe.
+ * Generate a BPF trampoline for a rawtp probe.
  *
- * The trampoline function is called when a SDT probe triggers, and it must
+ * The trampoline function is called when a rawtp probe triggers, and it must
  * satisfy the following prototype:
  *
  *	int dt_rawtp(void *data)
-- 
2.47.3

