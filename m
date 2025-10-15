Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB025A34F
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760544795; cv=fail; b=XKReVfbJc0kjlItF7LMH4ZJtHMkew49qIvaHyyoatLgHpEfjKvQM5hGjnXR40dkYC7jd9mCt7vz2dlXftZ7mpk+fU6OT/RfmkRXhplv5L4+rSakVJmyoe1Ad+cdpD6l2FnaPgx6HwuFmBPiICAcLdMsAkKzsJ2bdfG2a+KzaeKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760544795; c=relaxed/simple;
	bh=Ld+LCkfzBGwkK/oz7dQAZEADjiGvjFypjAL4L9LhnDE=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=fqS2L62oZCOYxxpVHMmM8GRf8ZDRXph3FMK9AVyhTPic0JHcU+bVmY5yrBiVKEa9fAFNUvSNdEAUE5A730T083nKvKrMxaWnkiWBgFCdIEFdihkBo7aOLIOuEEGWgyO9ImL2NU25QNUVeISVffCyq1xQzrWCCc3QdPFNfkFcNGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aBMU7DC+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RuwIy++T; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aBMU7DC+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RuwIy++T"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FGC8cw002151
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 16:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ikL7+GEgLxzxkyevJI++WMIut1wrXdGU54+fZEb5CHI=; b=
	aBMU7DC+H9oNMaJ37RWe8Sa/zfThmTCc/PR4ZDAkl1tuOix1eLZVL+21OieLtdu8
	+Dw8DpTVZ5isD8OKBu/V9TJsbvNLjoZkuQwhEvhGr1ETXaNratWXlfdEk42mqRwN
	C+Qv3EwvzKW2tc8yPRtBZXqFfZuy3L+cLCMSmFAeh5wlybJTQq7r/M8IvKc+0fW2
	MmqAgN1pQzEpkhD+67jXQOUehr/AxnMF6Rh8VS0BlwxQBZaqFAgNE9GIZgd1CiuT
	uNkapIROWvC5/KJg22iY315eoogQ/iGQk30yqBXuYKtuMRqyL88CUgDhdv+vZIzg
	QXJ5HWW4NMO4Bb/1usjVOg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qeusy066-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 16:13:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59FFp9KY017998
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 16:13:10 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010046.outbound.protection.outlook.com [52.101.201.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpaa46q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 15 Oct 2025 16:13:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Emr2UbZPREWTgUjo6m0yUu5gtdW3NgcDri3HI/bykI0o4m/QunakoUF/XNQIY9riQeHbTZWN/PsLta8sU+20N5awqilj0sHGjo7Q+PSwSKXeJydj5RlCEvqwLCQUOmJze5dYr3uGpp4XqLEqT81idoOvwUwghqSStuGMuXVFleYfEAQE2B1X3Qd7bTwK4pHbKMNhk14O21GRfNVdXnA5CATBx2HwK+aSLhNPGEvgRJjL/z/BCLdVJ22Zm1S+1RcKqCON5M/G77NT7j9EbMvbRNiq0HDleWxcKfz7osVThPLJtSG6v2iXp59IOTBqJ5FuOyvAJuOLuhV+zp1p8WV8Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikL7+GEgLxzxkyevJI++WMIut1wrXdGU54+fZEb5CHI=;
 b=xVLWVsc27H1F6dbcwc4a73CBQAxawJRQVHlVar+j/xAekvIr82yil+ubBqbHbt/46X0pTFmGIUoqv3i2QrCLytN3Uaj7Wj5res3OlFPAnKY6fe+I7CxXyQn5s12XUdTARX0FqKZV/h2LbNULZCke+9iDjeRF16jOPjEA7jyRN5Dlm+UWCmgpj9i+lWyhq/halC2Jwm7tOJB2d4r0RjR39DpXgGBA1IHhqZg1GuOmDfcTGeM+BA/U9vw+HnpN/jeAmgdhPv+g6Ex2wLi0sacHVv1EGBP8ALzV4z1v7V6/D3df3En1QXkLTURzwTzERkryobsUxAfdwsPrYgRqf5rAuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikL7+GEgLxzxkyevJI++WMIut1wrXdGU54+fZEb5CHI=;
 b=RuwIy++TW/yQIJrJd6IDHorxLptECluGm1zqfVCXQKRQNgS8OabJxoCuMhhCQcrV4GntHA7uP+LyVu8pq810iDuhnCdwBQjJXcm/yld/ckRs8Zk5TahWB0UQW9lOtpPQ/uKmH5suY6XW1PAeArwaBN0I95QUXRFX8tk/rdAds2s=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by PH0PR10MB4709.namprd10.prod.outlook.com (2603:10b6:510:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 16:13:08 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9203.007; Wed, 15 Oct 2025
 16:13:08 +0000
Date: Wed, 15 Oct 2025 12:13:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: skip D return() action for kernels without support
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB3987606C19FA5E4C88EDC68EC2E8A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|PH0PR10MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: cc661abd-e03b-4ac1-0639-08de0c05ba9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gseylwTlDsXUeE1jD1YQ1mRrxDsLRzvl7ygiSAHIS3r+yP0yirq/5GobvVei?=
 =?us-ascii?Q?0XHUDbSuvWwqEqfTE+9DxA5S4lIjJ5DygDwiyzAT6BOI5fZS4DYnYI578381?=
 =?us-ascii?Q?UwVtasyJyitlH/Nxox6JrKcuPYr3rvaeWsda9pTNAfwVUZO50d7s8RhLwBdJ?=
 =?us-ascii?Q?19bDsm6xj2nnR+8oslhadP20k7E7LkCkwwJm/OcKxV2Tj4Te+xV6uTDIPRSv?=
 =?us-ascii?Q?YoYOB9CWgFCxsXUtHr8bds4oHvFwNl2GgQljIvOas/rzZS/P53AaFHHyM/mJ?=
 =?us-ascii?Q?WdS0T/weCtblXoEqkfdehYsP6/Th+cU+L1+XWkeUKRaVXuTtjFNHeje+DIFh?=
 =?us-ascii?Q?fCxjMLxLG5h8G28NBY9T/WJqFJocuHkGPMg2ckDlhjC3RppwKZM0s5lLUVlz?=
 =?us-ascii?Q?FHJNVHyrfL1MLiI6huWOlVMteySWoafIAfyTx11MCLPwtlZmoDJckKdlF5AR?=
 =?us-ascii?Q?QuziUdWchna6p62OOytWu5FQjkxAfYuIaH13pwgaooAI4UByRsSCXgQ5Arsd?=
 =?us-ascii?Q?mF5QwlSTB9OyfdH9ct8TlNzuUwtWvvK8nKkgAsbJJkr6WlwvOvdpgtTPx5ir?=
 =?us-ascii?Q?9parXzVXqjzWaj3KhudLSQTKt53UCn4K2FUXH8CLxWad6BXQXuKBJ94CyX4d?=
 =?us-ascii?Q?GNFL6CDKgS/rivSvBhEUxys7XZAV9az5o04DKs3PNxBSNPPy4hicArduiVvj?=
 =?us-ascii?Q?afhHIoHqMIiStuEf1HHHYZygFKJZ4s10X/MTTTy/gN9iDAZkycS+TdbWOrQF?=
 =?us-ascii?Q?Rq4Vx57c6wD3ncu0BL6f2zTpGubbytoYuYs9BN6+jTBwfEMEMlXkglLAyUwd?=
 =?us-ascii?Q?erWC+olrTSVtw09WYljYer63RZeF45d8WYjHa3MUcx8L1GPuRwha3XJUoO+N?=
 =?us-ascii?Q?JwvyiQVjAoxWOqXYR1XatczUoafxcClDMO2Xp0V8LXEtiJX3XJOxIbyGPgHV?=
 =?us-ascii?Q?f/aQ7Xjpfyt+ZIxowj1idjAp38+BQK6XNuqe+9vjLmFe13DOlIbd/3gg0aFQ?=
 =?us-ascii?Q?lMHxlz59lAczwlX2zigBaqWD4WTPUKZDPvcbOpB3dsFSf+YZEk2vVnhFzn9z?=
 =?us-ascii?Q?ihL3PCc235XdzInkvrfRIRj1XDKUr5frHvK6S0WN/ezVKuzXbscZfhKlOdu/?=
 =?us-ascii?Q?oSsrnr32xTj1cdXpeYOLBircloBrSskG8Kj/tfWFZTv3ZpBYsa22ZS+LU5c3?=
 =?us-ascii?Q?6ZK4r2aFHGQTrw5domTeOoskuhQHbY1ArOZy3QposhN7ojDPp2o0IBpkz5II?=
 =?us-ascii?Q?j8+KVvD5085zVuXUBfAlijJ7k+NgRjAFzbHBefyveU+8P+7FiBJxs73uKeER?=
 =?us-ascii?Q?2zSMM8UkuasVf3AnPC6Fxy9Zo068V1kSJz3irqNgenI3lKKANIAcV0/XgnUA?=
 =?us-ascii?Q?VUfES0R6N1EbPxVy8EyubQy9yq0aAzYV243N4Nw8RbkwYG7B829zQPlPmsdn?=
 =?us-ascii?Q?kFU4eO3OczjI/nZg34/tIWeQ5dCBcvk2PAKbY7jyZvR1CjD/djcAgg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BpbfttlmFuWCKYoqd4B8ZSITXxnO34c6uzBxKcTTJ/IOiWL+r4THzEtYAG4n?=
 =?us-ascii?Q?U5pFJSuxWzyTR/VTPzPYphcDnbFNIOtiWFu//deRlN5xDCQSpNN7bM6J9luJ?=
 =?us-ascii?Q?bQYMF3WdPYbCkeEdrqVd4ZvnXWE0xZHKzsrmw6oRt1BZpKEGjZjI1QVbOS+G?=
 =?us-ascii?Q?VBAE1fEWsQ7snhgTVXbgeTJ8RiL7VZhvIS4n/iDmqJVVyZx8GGIX0CWZx5fz?=
 =?us-ascii?Q?U3BPrUS1xplwVpGJ7ZokfQazyt0AeUFh19ey1Ftx237SVgYGi37MsAsbR3OJ?=
 =?us-ascii?Q?uOxoE80l6vpAPdyT6pnUIr+axfplu50eqHGXsyN7PI0r7RivrMUzu9YLKvG9?=
 =?us-ascii?Q?F7i++igKSZt/zkRj4M7LykKb0QluG/Qk+WMUVLJ8buZAIuBZcOLE8fqq/qhn?=
 =?us-ascii?Q?3q3M7ukAn6ujyLQSS5OJl4eR7WyNTtSIMMvLhPq5LiP1lGGqWAxYRuiT5G4L?=
 =?us-ascii?Q?ra8Y+qc/wOZ3yVwd3GnyE/Y+HFtFdjZDsaXP5eZrZZy0aslMrqdTMfFAoSup?=
 =?us-ascii?Q?o3hfcYHxJlteBJpH86Ec2OXNt3YeJh45dlabExBoNYAivd7PsyOwymnAxfn1?=
 =?us-ascii?Q?R9wXEUbZlY08ZmNinM3ZQpBoLcZQJ0/CybK1KAqivEBlbq0N37jojkR6ZR2j?=
 =?us-ascii?Q?N+RNpoy317LJ1w2A6mnfQ+QDHTbYBTsZ4VaD8H/OwgwteM+bMAV1j3aemcfX?=
 =?us-ascii?Q?kYiujOIoGhGuFfCAndFF+CImKRzd96a2zNvbzIoe67R+4adCpHShE+UZ77WR?=
 =?us-ascii?Q?5/hSAH6fZf/bARw/DHzktRcYdcM06HR7mJev2DQFcePqnOPARhnQjK3QleFV?=
 =?us-ascii?Q?uLksCj2Xng9vKuSyE8Mjpi5pdKocTpf1TOUKf22KydiCHl8GSdXRc2O1WeZ4?=
 =?us-ascii?Q?S2OQ3PYAUAUt/llEu3JD+plgbmbFbkWnolsAqAf2fYZAR7LwCPveKQSkhoeC?=
 =?us-ascii?Q?nwUCl6KmI5oMHAzoP7iacuoYLD8mRLGpYo1W1Gg4+XdxztcOx3upwJESDsuQ?=
 =?us-ascii?Q?KZKxvG2oZFmsqCCHZbcMhwJZSnGW8wdUIqHwLju/Z/SYgLeXrSK428hjmOHm?=
 =?us-ascii?Q?c1hwxSIQg3rU/l01b/udx+raif+LpRxex0pdxFyTGdD2KdOHFTrFL8DcX/QV?=
 =?us-ascii?Q?wEANXKxJA6OphC531kj8l/ZFd1X1mb7HPJW+oINVy6Ef7QEOCD+UG5KTWAA5?=
 =?us-ascii?Q?oOdEk7CFDLyNbp0ALTquc1k+YRZrCnCMz7TTZNPG+UrUcweBQNq/uDesnhu7?=
 =?us-ascii?Q?w9oRaxYPtCj7DiQbMRs2Gim9xS0/ULiIXvNVjPppCbiZsT4rrqI9fTNpieTe?=
 =?us-ascii?Q?tWSG1gcfBy+/w0ITUOQBxxhKApd1nODwZ0es1vaBjH0tAMZYXwLVS5V6/qj1?=
 =?us-ascii?Q?Ux5K2G9RHoByPAYNLlx47r7gQXm/FDbHmgYEteaT+xPVidEt+sg6TfRriEDv?=
 =?us-ascii?Q?b0pEmuStFSkbz9OgYnHlsYN/zmgXsKo51cRxBCG0DL4p7dGyL1j3F1vCcXhA?=
 =?us-ascii?Q?bO3Ra4ZH6V4dhUJkbQkYMB8aa45j1MWjM+gTse9CSo7sKnrUZe66MM6l0ukj?=
 =?us-ascii?Q?aH+PI6M+vSS6IDLPM0Lpj7OYDImD1Pe9g5TeYxnZWEz8WbxOH+k+iKwfRSeM?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+wDUeh1o95AJyThb9regTh/ShXi7XXqyiaB5XKlrqKiScpYgO7NPg+QGLY2eZm7K5fbW/SQMg1yCWeHfch4Bnh28ogNOJbC9bdO6H2XxkibzAv7jeiEP46tZAHZ79dXEzjRSc81EcPGYwYPYxM0y3TBNErhdwD7WDUF6BkwkqazJle9tIJ+XjwerUXYii/OrtDShNnp+D1kMiIpqd7UTHP2kie2N/R0krcmfKgVc8l4pDFG64WGUl0hWlDMCp6pH15KNjE2yHL+BF6kZU/49JqJUdYCfHhT5W8uVtl0kHHkCpOhA2UHzLRxUiiQmhwsiB85jx5mW962b0IAFhh9mgl/yzNd3W+kZbhWKQu2MDr9xvtXO6hHonnEUScTcQf0LGzz273NtwUVfmgJaKGVzkJ9/YQsaU8SxTfOK+6w6sYBNrJhWAaGRarUSZIekgmrhy+ePRm+Xg2g7IfMJ3AliUSXnorW45m4w6obdxWTdxNRYC+FuCLbPOfxlKqJ/A3xyqcEzAPmbV7uoXd1Lc+jcy+J/C0ynSPWTwC6WRt675bCT3matjYpHvsPbzO0dm/893KjXqU6ZFqVyTagjFviLo2bp41O0hj8XOnJhC3hJMK0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc661abd-e03b-4ac1-0639-08de0c05ba9c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 16:13:07.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ts4Erk5iWJN7QC80XyYe/GYskdrKcXPMjR0UGMvXVtlyNHbyXqvF6fGbiVyVzdoccapnKPcZ/FdBCGExmNC0uz/ZFz+izNmiOCiPrZpPIyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4709
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510150116
X-Proofpoint-ORIG-GUID: 7qKqWWGSgkhd3PnUtVL4G8t5hDpgBZoc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX1E2AyAtqpxYj
 x0Fia+3WRWTyGntQRJrV2ZcI5yxip/BZQxDZnPak3Db4dmmUjEwPDc2/MwMqvYb6kFnGup2hh2w
 vqxV2kwUxYJChtfrqE07nixhoZmNS9dzn9alDkkNhEAAhxY5Hbf0x2U8wYYWhXub5Egxup16gAi
 jhMWJS7wPl1hK0os5EPh06ceELe7X45mUVEBDCXYjCINX2jm2pk86tRen0rLKNGc1Auu9ml84tu
 v00ZMp15zSMfT1EjzfpjhEr1832nMl0/Fsd5pTJXWQtHIxb6eHF+mJ7Ccd+m9y0Rn9r8v3Mkyz8
 HvfKAlimb9hDbGNqOVwAxYh9XTaYUGI+YW3ZW1pRYMxUkbiySOVTqLPJNgN6H1E68UNqGPl+N6y
 wb+GQQd8ShRf/VDbwsqBd6mgBaPYvw==
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=68efc817 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=89gEZP9hIgxAmlgaT2YA:9
X-Proofpoint-GUID: 7qKqWWGSgkhd3PnUtVL4G8t5hDpgBZoc

Most of the err.* tests can still be run, since they test other failure
modes.

Suggested-by: Eugene Loh <eugene.loh@oracle.com>
Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/actions/return/err.destructive.x    |  1 +
 test/unittest/actions/return/tst.destructive.x    | 15 +++++++++++++++
 .../actions/return/tst.override-getpid-entry.x    |  1 +
 .../actions/return/tst.override-getpid-return.x   |  1 +
 4 files changed, 18 insertions(+)
 create mode 120000 test/unittest/actions/return/err.destructive.x
 create mode 100755 test/unittest/actions/return/tst.destructive.x
 create mode 120000 test/unittest/actions/return/tst.override-getpid-entry.x
 create mode 120000 test/unittest/actions/return/tst.override-getpid-return.x

diff --git a/test/unittest/actions/return/err.destructive.x b/test/unittest/actions/return/err.destructive.x
new file mode 120000
index 00000000..36e16002
--- /dev/null
+++ b/test/unittest/actions/return/err.destructive.x
@@ -0,0 +1 @@
+tst.destructive.x
\ No newline at end of file
diff --git a/test/unittest/actions/return/tst.destructive.x b/test/unittest/actions/return/tst.destructive.x
new file mode 100755
index 00000000..3157408b
--- /dev/null
+++ b/test/unittest/actions/return/tst.destructive.x
@@ -0,0 +1,15 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+# Verify that the return() action can be used on the current kernel, i.e. that
+# function error injection and BPF kprobe override is enabled.
+
+if [[ -r /sys/kernel/debug/error_injection/list ]]; then
+	exit 0
+else
+	exit 2
+fi
diff --git a/test/unittest/actions/return/tst.override-getpid-entry.x b/test/unittest/actions/return/tst.override-getpid-entry.x
new file mode 120000
index 00000000..36e16002
--- /dev/null
+++ b/test/unittest/actions/return/tst.override-getpid-entry.x
@@ -0,0 +1 @@
+tst.destructive.x
\ No newline at end of file
diff --git a/test/unittest/actions/return/tst.override-getpid-return.x b/test/unittest/actions/return/tst.override-getpid-return.x
new file mode 120000
index 00000000..36e16002
--- /dev/null
+++ b/test/unittest/actions/return/tst.override-getpid-return.x
@@ -0,0 +1 @@
+tst.destructive.x
\ No newline at end of file
-- 
2.51.0

