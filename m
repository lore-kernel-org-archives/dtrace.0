Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAC32F3C03
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 21:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763586874; cv=fail; b=S6nMXNl4uUrWwQq27HOzP2bYSixku2wbptMjaMFxg6mOEr9JHE6yFCYyKCijAzpEy2NzcwJmU5dExuVKTS8A9//PhifHyLzzjJtDFKvFMM3xDLG2PXG9xL50sviSgTXK0QVXios/AM1BZqxl4lI4pKUOipx0TBuFws8W7K2xJh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763586874; c=relaxed/simple;
	bh=J6xreeG9miNNgYoULCDSm2lpSV7MUjJMF3hZlTHeOEA=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=jVoP3gCJ65N49gvLH254/DCmr86ZVQWBRcQUj2Z+X9OC9pUiOyrdv5c824S0pCN61321vtS8T1IKjh9cNdpOGZVEpg5O4eHhGkSNclO//rsQCasZzQaVAJC7IBnlMoN6cr/AnXSz2JUVWcVBdUaEFpUVXVzJtmdVP9ojWoZmwhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ASa1cIV7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rWtA5iQ3; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ASa1cIV7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rWtA5iQ3"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJJCHUa021978
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 21:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=W4sgkfBZXZSBhwc1KOgkw6Nt1m1ji33YOwttMIlGbNU=; b=
	ASa1cIV75EP1R6NrUAu6G/LxR1Wmn09awK9I9xa+/yWliGPEqp9WYJCjHSaxbCVc
	nxc2MiH1OffE4BdflQEBtMOf+yQIp72ElONkoRe8VewwrOyLvgwqfl22GwuN0h+8
	f1u1yrXVAQ2nK9bAFaCpFm6Bp8PkFZf+nli8UHQWv8+3tp4q+aTSyUXQL4XAqgeN
	rsHykRALU0RJmi5R/5NGmQwJKqmaW6cawytMCfCO00/LebY3Izq6lNc7o1RQw3PH
	lde/HcWkpqaZu0vs8hBQB2nMLypX9Kq3S3vJ3NNiuVRjxsOHB6b22Ybqmg3rxp26
	mzmoithHj1psRCyo26RwpQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aej967wu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 21:14:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJJGRdO040560
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 21:14:29 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefynfucr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Nov 2025 21:14:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwwYuCwGypvpl8LNnTrYSvmzFNcwnhdk138qQnU54kS/VlEVfkP9GbcSNUl1yQ6SjVswRQLU6nESD8/6TN1psKaz8yHh8ZKnjz34yN3by1GgIYVVUloRVVd7As8Zz7IE8jE/PL5MBO05FT7dzgu40QJaq1hd8LKrm/eVJ2v2KyW77W/Y28u+6lvFLJTjXEgLPCfD1yiVbTKD7cotSnzeA2zs5BxagyZj+tvVxGCMZ9RVZeiEvsUpE3Nj+/Uv7vJ+/23GSW5KybGTIinkX4kTnjRruHl3CwfnkEo5uHA+WwoSB4lJWI044dbP0n5H0/B2UqtfSfPZwWma952Qi3K3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W4sgkfBZXZSBhwc1KOgkw6Nt1m1ji33YOwttMIlGbNU=;
 b=qFjjK+MWv3WKFxQWJ2HqdoS8WdQB2xLE9XB3Ebes6G1fZFXgkYaj2n1ZL0EIWMLoXN9gZL3k5imvu+5AKNFsAtQIWTLLZwW2WWDa7GuLVTUsgyKoJMBzG11ki+21OCL+vDuusJxHr6lls8BebpOUivPfMsXH9A6wklo8dW9/a7TjhkJhv83CUTDfZAl3e/Pq/+C7uXcireeRSOoyBCJCjM/SQPwbz41LNHu66B74su7Aa1d1KjmlBB+Dsvsh1F2V5RTr8GeCDXzpXVafhryYSzjS6E9WWHmxWUJ6cewsLcTttlhNDLHkBewDrmGlkJ+IRWJu2vbckycK2TDawifFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W4sgkfBZXZSBhwc1KOgkw6Nt1m1ji33YOwttMIlGbNU=;
 b=rWtA5iQ3lTbHrV5NMJOIsS1kCXNK4EpjxFgsh6oRYmm15iX8g3Asz4qI1CC92GV4kfko+78djRehcDguyiazknfQ9DM7Aa1rpgrRwW04XqwKYWumMs70ksMvGZ4lesBsF2ixXpkl1/hWn/TtAQUhzeudCR70/RVomq7vboyhnCk=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by DS0PR10MB8128.namprd10.prod.outlook.com (2603:10b6:8:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 21:14:27 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 21:14:24 +0000
Date: Wed, 19 Nov 2025 16:14:22 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] spec: add testsuite dependency for perl-Net-Ping
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB3987DF7E2FC1582D1AAE045BC2D7A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|DS0PR10MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5eec62-8b83-4487-2640-08de27b09d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YC08v64MYMVqHIlVw1S2eZdDu4Sxg9S5bLWM9jCQ96hlW0Oy6aA6DtPcGt3y?=
 =?us-ascii?Q?xKR0z15eqZ4tGNHyR/uux9XW4cyV7kefGYJ2UIb02G7Hh5AFq08GfMH2UZXy?=
 =?us-ascii?Q?XOEF3cXvH+EInnGoXgT3o5+uhKmGFzY/QVq0uhg2UfpU3sZYAAN6mYiS3VMd?=
 =?us-ascii?Q?BjHgSgaXLr9kMAuP9Mon7WURgaDvnXB7i1ESwZnzaevUQkT9xSOrRMb5/6lF?=
 =?us-ascii?Q?tIhVDRz926C9VhzrwdTuYkO8ZFnUjSoTEAmhXYaVmnwdxOrEvhZz/kKpGteE?=
 =?us-ascii?Q?d37KXjyBYIv9kwrY6wiWEMJD7KG11TjchBO4zLxTF1uxO5PdodO3XDt8hsjD?=
 =?us-ascii?Q?QW4R7seR38XWzCWpTJw2ls/LGsO38RjSxtaDKIRVjAibpvDAfVnHX5seSZem?=
 =?us-ascii?Q?LZVa5NIXYc/G2+Zr/zNghT0gn3l4khVe0I0wZm96hgKffpxH3f56EVpUpljX?=
 =?us-ascii?Q?vjA9vzYIjCfMfpIAW9lNz5uEqhLNaDkdwRTv+j3BlL8dml3U1WNnbR4iYaKp?=
 =?us-ascii?Q?m0gxSRx20zvLDnQ2lcCqN+UDXDGvlugusnoGkiy8CX5sQNJfEpLF9W40CHsg?=
 =?us-ascii?Q?yH7KLe6n9FH4piYwLgEnz4YbdrsEKeyFV9YHehAy1k03/gYJ32RGJe1XbapL?=
 =?us-ascii?Q?3eQM66fBrPUD2chEy7OrxuwuNY5oueljs/ceVgepnW+j2d1XB/Ny/vU9eMsI?=
 =?us-ascii?Q?JFwOiSq5J1+ubZD0ajqb50XkFZjKd9+7ZK31zyRn2hFqYMrfoJdiTcxs8YXf?=
 =?us-ascii?Q?wygXpIId8kZ78pDAvq5yrJSAw+nHC15WH6TZiD4D8oR87WtjkDGB0QIE8QFB?=
 =?us-ascii?Q?Os+JcMFf+emfY18QlKokeYnDwdna8BHZScwHlGozM5vIf99o9spkiESGOv0Y?=
 =?us-ascii?Q?0pbKnjiXwrhCoIfbHEJ/BiW3oRUr3mj4U7tl1ug4IpEns8lDOY5mYJOLs63B?=
 =?us-ascii?Q?a3NKM8XTxniE3efPGwpCFRxed7G55JlfEdYeDgpl3p8eZsLO1IlUJFZPWPmk?=
 =?us-ascii?Q?od8XpxnTa4k/IPNHe3WNJyT36iNZUH0lGadLm+6ax0CV/TrX0YtasKBcUkE3?=
 =?us-ascii?Q?Ec11crJzhQgdKH48D3MI2ZruF1/e5t3O5afZQdCv2BGIKsuEgU0HXEH/Rjmi?=
 =?us-ascii?Q?xr9cZ8aUtgMuco3Md0xFTzuRv0PIC3qxOC4K3I+lZwUbe/8Y5n8qknSeXD4U?=
 =?us-ascii?Q?1LtRi8W2JxLvidt17p6csCuo/IX+u0DBYiSVkBPi6vhU0rHLFlsDn6o7yw6N?=
 =?us-ascii?Q?gqZncV6cixGLRplvtpjcpFaGcidRD2TePPZxXoeQjIehc4V/nq8vi37ElrLX?=
 =?us-ascii?Q?nUKLACSpb3ObnbuGQMvff3O1cdMZJhjeHP3GtFgQe6tlVJGJaLY5MVlbob1Q?=
 =?us-ascii?Q?Cn3cCrzedOeCG3LA+DaAOcdzeQEh8pzTaqNgqmwoK57DtZRAwf2Nt0tLyxVO?=
 =?us-ascii?Q?lIQk+WcdlfnWyuD0ZBO12yVHHQEQFtdy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZZZpYDIKWcTu7fd75V5sHwENaKW8g4eXakLDOvAJh87fjPUvXGGuz2pCm4np?=
 =?us-ascii?Q?Ugd+ulEtV8tKCz2pkXSYGtU3jbQ4CH15Sgx3yznDnD8SN/AWaEkhRtuJIYUF?=
 =?us-ascii?Q?UvVnvwp/E73T2/4A5gssEMRmhamLgFkuvhFCP0G/Xv1o9T6Xpc+b4nm1/EI4?=
 =?us-ascii?Q?Z3pMYJYRGpgJj+F7KjRSsFbpVXqIO/V/nciF0VBK8VbZoqeXVm6V9gs6/AaY?=
 =?us-ascii?Q?/FLesTRTYG7vir5LJCAtsp/RZzE42dzlFRvvfgPEpAoB4r0K7rhRsst8O06l?=
 =?us-ascii?Q?5jH8BJ/CJVrCGZvscUEKFO+HBISp/1UKx3qhS+Szf1gdMOp5XBWpLYKJMrAz?=
 =?us-ascii?Q?pKxM5QeO2IU9cYb/MGvDIOjy71wEvU2X/QVFvcS+zyJTYR+ruDzxmbjcgUXZ?=
 =?us-ascii?Q?taSin0/h3tmD0X+DmX9+08PVI6txsl9Z2auFDm6p9iuZErYZxzbdDOhvYyBW?=
 =?us-ascii?Q?EGccxNlzpBGenNO8J/skUqQYI05oE3Bg3AcJ1Dw9kAKTkIpIWCna8+LG7T5R?=
 =?us-ascii?Q?QMgfUhcb27VbU3VKeHNOhQ8zi1CPYwy3pIgMDih3kDMqWxYdh/gtobEaJdTo?=
 =?us-ascii?Q?rUfRUFt6xtp11Ko3dMrN83euyYDKVRwjqImBXCzembS2i890gAxphn26aKmn?=
 =?us-ascii?Q?07x1NdW1UMW0GqAuTTOYvYRx18u++3Guy9R2hwswptCNJ4T9Hbl4GJfm0R96?=
 =?us-ascii?Q?1n7N/Ti8zOiTAwGLozIn4NpmgmtfwdmHZzt63vttB4RZudcY4e6U0XhMDXVF?=
 =?us-ascii?Q?XFypx8kyP6wIjXorDmMPFMyKTef7tUbZf+ulgaThw86GxsbxIt10rr81N/65?=
 =?us-ascii?Q?QYpE7xUq+gVPa7o/YhYGeIQPaeMhqrFHiaucZpQ9K26gv1PEt82Jqat+R72L?=
 =?us-ascii?Q?dw76EmPe/c0rPQmHUpEWnjo2MpLWdk6m7O0hV09DoP5Ua4yAVfbdnAHPQwrV?=
 =?us-ascii?Q?T3wfZER3ZjHbGi/Ax0re3XjhtbfiTUcR0KQJ0yECbeGoyQSsccIedEbVEWHu?=
 =?us-ascii?Q?1q+tpbL/y1df8ms6m+CpACcqZQ9k3EDGEQpVxv5isdfUynAR8oMR/Bw9/IRc?=
 =?us-ascii?Q?w9rSPzR1Uq3Vg1x+jS6iLKHScX+5VQrc/KZpybeHmAphvjjBiOw8TGHMNrPy?=
 =?us-ascii?Q?IVbKst/1qHRpb1JlpD6cMKQwcK5Cp7QOAPHeoVHiznclkAI7QfkvkLz/YWVa?=
 =?us-ascii?Q?BBNwrI7X+CgX1YYDI5YVsOYQWlYosjb08IdSp4n86AHfUUEAtqncZsbTsWU9?=
 =?us-ascii?Q?mN2IdQBPcLMTkNJ3QNr86KHW4V1dPSM8l7s+tFC8qEjl96iNQ0nzNAVCq1au?=
 =?us-ascii?Q?nMP4MEtEG7i9ptfVrlhp56iaIG4EbYTsIVSptA4HtXE1oH9NUjHNMOsmbM49?=
 =?us-ascii?Q?kZcyqb1FnFosZf04DQ7iGce1U/BhF5COZsHxHmpzkBTiAj54+AG2qdMm76g5?=
 =?us-ascii?Q?U5pUjBT36kIceRuYFTC9H2uahmfS7s+FoIvxtcgjCaAKk6rqnnvdItU3C7O4?=
 =?us-ascii?Q?W+NZjqYN+iHToa8S4SDwuEQ+jYiwWOKQq87mjegUPRwnUSNgGoUEbkvMSXV8?=
 =?us-ascii?Q?7ZkGaImNmz86iXFUBWzSwbofk0I4Pg/jt+scPBh2G4A3RR+Dzn99g1HDsXop?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	twuD4G3XzFLV8aN33XY9XNxbcH+GaM/Sw45xK57H+KBvhTJfR80YUB+KzX3ncaqa8t7+HS7L/dez3sISAbHHkZQeqCEZYg0hE00WyruPkxY296XMJ7Ah1J37J79erBM9o6Knz/2fySp9kybjnMV4oy2eWfiR1rx/bZZSCckYe4Ia7HpBzt6NKm0LxCESydsBTXPAgCRn2NWYGXvJlx9/QpsS43dSGOOIPbom3cfnCiibwM0Z6EDEMsuK17cEiRn8EDf7Is/HquyGTIWBDWNtdfFhRK2KpDVhxEkQxV3mLD6qwDqES4LJmH3qmsc8ozfQQhyFsofKaq5wKVw4d/KZSNE+urViWphfqOrWX28oG74kt4635JqizRunGzgid5kCMWFLr50Ex3RRcoRKOdXdbIfMPbguFbpeFDjXHXHRIy2W4VBhGC98+3ft3f25S+dF77feD7v0dSfS1ZEVneOeC6sZ4912CRtkL1DU5T2klujrGD/ybGRqQZOmUTqdSmPvnR8MdjmWeDUtLWveXbpEliyaiNgDrX6bORPamNIQFx/2+/i7AMCcSHyo6j93AKwcB6CZuq8o+k0rM5Qo6UuHOhtUXTKG3pYYrB0UUliWLM4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5eec62-8b83-4487-2640-08de27b09d6f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:14:24.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDauy0nV5Xgh+9g6koWKvUriSxM1FDQkRth9xt6UOYawrE79FRxsTimqG6FRLRcBKlPxYZFBRjfDogdkkGSwMn+ks6zEw3oYcK+SsoX6X48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8128
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_06,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511190166
X-Authority-Analysis: v=2.4 cv=DYoaa/tW c=1 sm=1 tr=0 ts=691e3336 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=IDugKjVPkI-486_vcbwA:9 cc=ntf awl=host:12099
X-Proofpoint-GUID: 574FMgvNsZrJsUdN52-HcI7W2qlYLkwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX8avGkpPV0hDU
 a6gxVoFFSk+Ybv4hL+ZTWFjsJ8dKsvhy6YSMRmQsUs+41EL1OSuhsntcGv4LnavQwwl8xLxHYaD
 /cjxH1DHqho7K87jNOp21f33tM89fQwxGp/0NvRdTH51l922wGLJ/bYszaYEG1NrJXOZlfIzwKx
 4Yt8MHUWcLWGe/RU4oV+BUavSQYUIPhNvP+TeJ4u8iN3jhPsyuyqCWb/A4f0FnAoLX77R0FtIgt
 mGlEo19/er9XVxoD8CD3bAWWu80NSMaZ/yd9+JvDexfeteBjQVT9UI78ABV/jwY2HWmwWwgRKE7
 wwe7mq5k93CBYVDB0v25I+1AMZMx/FTeHvOKMynEMcssaEctihmjTFo+QVc62QmLJVH9trb1a6E
 RNkmZhbFdCmFuFeuhIJirpJFWGsYLAe+VAevbJm/0ZNxtvy+TRw=
X-Proofpoint-ORIG-GUID: 574FMgvNsZrJsUdN52-HcI7W2qlYLkwE

Commit 1e689f55 ("Make a start at reviving the ip tests.") added the
perlping.pl script, but did not ensure that a dependency was added
for perl-Net-Ping that the script depends on.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtrace.spec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dtrace.spec b/dtrace.spec
index 0905763f..4b20dc40 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -112,7 +112,7 @@ Summary:      DTrace testsuite.
 Requires:     make glibc-devel(%{__isa_name}-64) libgcc(%{__isa_name}-64)
 Requires:     dtrace-headers >= 2.0.0 module-init-tools
 Requires:     %{name}-devel = %{version}-%{release} perl gcc java
-Requires:     java-devel perl-IO-Socket-IP xfsprogs
+Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
 Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
 Requires:     coreutils wireshark %{glibc32}
 Requires:     perf time bc nfs-utils
-- 
2.43.5

