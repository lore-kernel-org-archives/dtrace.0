Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950F1B87E9
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831398; cv=fail; b=QPwTeP7ogSiLshXfGL79snE4ekLJJa4FEfY5aqOoqETz08JrX3PKhFis3cM4KETPKPjj7jTjZnu51b/LaI/HYypYzs+pBKL6pDe1MjeDlpSg5cv+lJtW8tcRrqWKlnN8xCkiCsDNYtl6A98YR4s061DBLYTc0qPIT7gsH1Z/uqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831398; c=relaxed/simple;
	bh=lZUDzRggq0LRJgXCE6O+8Z/N0kEf83Lp5fDcXqRjaKQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J8fThI40qcYj60EbOheeCzn/GtX+zZe4k3R7p5l1bM9YLeY5s5lJRwbz1HlVxuNCH5OZk/BESD6IUgYIHRkrinQSKTnrNQcAZ8mlP21YBlezpFgBvI395Cw9aZ7uOeFl2bkzaYaeD422m0c1wG0n3dBr8nfp57ubBr8rNSYXFa4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bQHrKkEL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aplTm3ns; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bQHrKkEL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aplTm3ns"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMj9Lu013808
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=35iJy0Tmegj5GCIvPG
	xSCNLJ1XBhDA/BqFyi0UKDckQ=; b=bQHrKkELPz+uUP3Eq9bV12uDeCow4539IR
	0m4txRUmg7ryGyRjsUEZtjAnv9SQKcWV2Xq2EzgHPk5xUaGIx9t1VBIuu/2StDao
	ZurQ2O8lC+2vdc4MjKAi8mlrrSl9jZoFY9KTJNVXTTh4AT0SrFjN7POmiC+3h+aa
	2PehiKf/r5q+pRoSLQ7DrD0m0AwU1UnqaLMTmizIFFPvamC8LvqDgKW8yPZcoYne
	FzWS6VtjdQBPG1ughWDxofYnJdpSGgiTSv7YxOvm+Wf+y4oNps3RU+COEcqo75Gp
	2NQrTE9umGOKwZtgabvSIs9rMwZEyvK8x71yEZRiDr6KfFAwSkhw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumnkby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4rdxK039375
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:15 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2054.outbound.protection.outlook.com [40.107.96.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5knuu-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8cZstij1zD/3uTXNUDe+SFeYz15DfVIaIh/l+VB8SkqCa+WVaF2Mm0JEGcuE2VoHr2hc1w0KPHR7ch1GRc5ACLXKAhkBeX5PVt9UOZQXPc24buX0ouJ9kHg8f9dMX69tH5ZEG6Y8b1nj2RBamHk2kZuBbDKwdm966pLgxAgZEz7m2naK/7//Rvm9dOghVSFWXTpbWdYghkpruC4wf3QI9BQjneqmSG0DrZIQgvMrPQxKG+euVE1BcfZ3LkDGmZjQLoY6frxOpxJAWFeI/+YVl/Junw1LliNlnOvtycKaHTQbokHB2hWlrjtdiEi2RITDRAwUOQwkMLvvfoT3rNjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35iJy0Tmegj5GCIvPGxSCNLJ1XBhDA/BqFyi0UKDckQ=;
 b=WfjoNtz1DSaqF3adMaEMcENEqjLRHDCbiIzw/jDOB5f2TbFwaPSFpZ8cPt0wadZoUoZhrqZTooROTdhQFU6DsS1Yczqh/WMXwQUdrF+3kREKde2Gztu7igNfAw7vcKchdW4+PrNAOf8AxngQYMkr1qAscVwuzmPRoUQzUqlqEICKrczPqt+u8lrrWTr0cM5t9husktOz60S/Y9mlkO0aD7KG/+pXViEOC+ywJ3G1KMZMJegvPjhhORQ6F47QDwpnkevm9eEtzZKKdWWN+hxkvPFc6FgnFods9FxVTyQ1zWYXQsmVKw/Z/y5hLm67y7nukY+kiGSLukXyrxxxXANGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35iJy0Tmegj5GCIvPGxSCNLJ1XBhDA/BqFyi0UKDckQ=;
 b=aplTm3ns6cFjIrHTDFW7GYI4s3dafmCULwUfdHTq6OkOnjMndv89bUKYtzPPnaBFWHB3wcnPS1CC6wsjLgjxs2Fy3sAXq8i7+gPGKaZb0rbOCQffdjtGri0fMMnrjQd/fBUVXu6gF7SnWF8d1B7kEX6wE5t6+FPlnDaq0ZCJWZM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6476.namprd10.prod.outlook.com (2603:10b6:806:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 06:03:13 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:03:13 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Extend timeout for many-pids test
Date: Wed, 25 Jun 2025 02:03:05 -0400
Message-Id: <20250625060305.15707-5-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625060305.15707-1-eugene.loh@oracle.com>
References: <20250625060305.15707-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0070.namprd08.prod.outlook.com
 (2603:10b6:a03:117::47) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e11cfd-281c-4e52-d0d3-08ddb3adf831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zl4zwTZ1DCjaEOvHavkX2an7sYoyXtDNTgGp/mDsPOF18ZqV9GDIbjAJplvG?=
 =?us-ascii?Q?rbcutAzTuzgClGdMQVhxjJaZ6aql9FYVlj47jhNTcGU1AyyT2lrwG1FhXxTY?=
 =?us-ascii?Q?VrrVZGK+XeFqdHH/dol/WWvl5EuKZuqWtSBpORbq6pWtjiuHP8bkKn78+NRl?=
 =?us-ascii?Q?EimmHEQR8x+z94hUuy8ptDkq7B+U6Fs9EehFFHBR4Jvw3zeJHzOvO34IrVpG?=
 =?us-ascii?Q?mqx2K/GXe0ZDtlfl65Afl5vTfIiQMAExXdAb+S+lyjXvzqsZG4YNotlqI7J3?=
 =?us-ascii?Q?UyE01RZiJRAG9eEwCmGpAsl7pOcDs/abDlcV04BrMRZIBws+mO89xb1Ti6ir?=
 =?us-ascii?Q?192LIQdEE8oy9XXIvkSLthcKbJdRTsB7A2i33plFAsC1w7iLi9O54lnMgCWd?=
 =?us-ascii?Q?YIMDxIyIG3ISa8CuZL5YaC5mB7EE0BN2MYUA8YgAGGjMyel7NhvApuMTHGSw?=
 =?us-ascii?Q?yllQELHipGThZRu3UsORhSMmrwzz/HsSigGVUyTs+phEWdit+AL13Qpn25X+?=
 =?us-ascii?Q?CLsoDjKwUXvqhMnQpoVGCeJrn39gfiZjVY5z5aDfpWPhS/4IhTIfGI9pwy3a?=
 =?us-ascii?Q?PKi3fhAW48X84aMEduolwQoO9cb6BVKGmXeyENi/Pp8iy4xaA7Z92LYK9tvO?=
 =?us-ascii?Q?EDzSn6wOPqoy3qWABvAQKCRJq33LrYKFqvCMMuL7/ZjNp4OBIxuV0eS/dpuQ?=
 =?us-ascii?Q?2GKf5+XwE0yHTauDEl1c1XhIOZNKwdlfkexKIvXr8GoMXdZC84XbueZAUwJ9?=
 =?us-ascii?Q?k8PmHzPRbLy9Ilt7j7m6gI12JKn6GOhogmespQpnZqVurNh18/gRQ7t+p++d?=
 =?us-ascii?Q?ICcmb3xG1glEtuVpZ53Rno6WBc/UodN1M+ftjK6rFR08/YtWEg/PwzOfqMPw?=
 =?us-ascii?Q?MPoPcM4Fgvz+wkEKIhFPnS/wZa8xPAj0ii1OSVceU+pai2RJ7uYyWTLTE7KE?=
 =?us-ascii?Q?geNz8/5qmkTLLbguDmPJTKEvEspAlye0bIjWa7dqEO0UVxObAWlj7JSPYGL2?=
 =?us-ascii?Q?c8b+uMcrTgPNWs6b/ZEO74TCUUlK8rF09o0BQXNMAUaceS7BcQvfP70SA3hA?=
 =?us-ascii?Q?MmorVHlZSrG5uA3eZBDxIp5f+mK4YfSz4/uNqQI3G1dG1oMX+/LkHr5klguV?=
 =?us-ascii?Q?SzFEs+8iYfhXMW2Rlzzsli88+HGtgA4Q5urU5Tg08nhMPmwjMDEVwNl1G/O7?=
 =?us-ascii?Q?7vdRQdeZIJmEbzSV3u6gR1YIGaZ5Eh9ktJ3vIuQDiAx9nCuP7j8VZQWahTSh?=
 =?us-ascii?Q?EGs0UZ3BEeZyClesl92EUxRCpe6OlRxSoE74GdkR2u5n+FKj81r24lv32sHa?=
 =?us-ascii?Q?3G2ZI5d0ZnvtIjNeB5T4coefHJ4kWdcvL4i2/MGTEWUmLZI59I0d2rvfPr09?=
 =?us-ascii?Q?mcd5I4Cj31p87lhAupmctfLwT9IfbEMSJX1AJw2R33ZeGv38Yc9kiZGfiExg?=
 =?us-ascii?Q?+u21yClQZVE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PPn2tJL4oY7tXMSviGDXaWle7knbJ4VjlyzJvsGudjt/CI9yGP/x5waLQkgY?=
 =?us-ascii?Q?MAFYjV0wK6nmqC5llYqLPuPHfUHukjkKBCed+ctiqOaQN/5ZL1UAbEKBQKaW?=
 =?us-ascii?Q?H/XQcBdfS+DR0LyJyG0tGjINh46JlYrfdLcushp778bFEwudhpZ2ObVNljFP?=
 =?us-ascii?Q?qeXZC91YEJtTXUmsc3CuGzZ8Q5nWEsVa0j5eaW4XDEz6WddsN6hRSDnkyG43?=
 =?us-ascii?Q?Z+GVP32m3ZvuaSUqGhJxbDpo/X2fuB6xf876zCo2Wn0D4XW9DzgWdk6ECW7F?=
 =?us-ascii?Q?d2b/CtFqy6F+EG+pGsvLMKqD+8aK+9AdIqkbKfRcVNvaKWY0o4Gnf9F8gmPm?=
 =?us-ascii?Q?GGqeyEg6MOH/ZmnBDSXiuzvfUXs722MB83Qzn1PlmDwr/tJZO7VA0utbTusU?=
 =?us-ascii?Q?2sKcDtvhNNgqeJqZc2xZVY5QnEuT/umnTB1MczSZxpSKMBK0RpNuO1I4gO3V?=
 =?us-ascii?Q?ZDLDl25JGaWO6fsbmZcbNuhzyBBjFv+WFKCV7cZsNEQg9pLkIcRozKKF5Mus?=
 =?us-ascii?Q?e8pwxS+OVaPH22/7zaA8vv91m39AEtQ1rsZo4I3SLgqYkAx33EkEQIHSBEYM?=
 =?us-ascii?Q?CCVL6LKiMN0ZBG6qcwbCnO/lydRwXkXk4PatoROBR6rASxeMYxL4UTh0d2TR?=
 =?us-ascii?Q?Tkq7iYIml9gd3MZb2DN6icrCz31UR3ZwcJn7qqf1P90zsO3vv6rxlfOXto02?=
 =?us-ascii?Q?g8MRfMep16+Co7Iqaqklao575JI+AoPUi06jjDXeB4xTSXcYmCWOeMDFQRsD?=
 =?us-ascii?Q?b6ggQKLzKeuUJHakWX8hWGSFU669krmUHLeEV22N+wkFTFxxIZHSFCAep2GZ?=
 =?us-ascii?Q?1v8u/tPFZcsWKlIZ1ngatLAs0sLW2jsaN4ZtkBZf5NlVbtDSm+rBFXA7dvD2?=
 =?us-ascii?Q?JO+8QH9Y3P9G9Jxc0h4RlPD5PQMAty0CA9a5x5+9zi2qD9Oen+323/rbvmMN?=
 =?us-ascii?Q?bqbwzbKChRosYvNuqDFEH/5hGxOwnNXGCDMB6pZ+qeUp7BCEsglTfa5QIQUV?=
 =?us-ascii?Q?jhNn/15EyhA0iOQAql3AB28Y4saekcDF09VNQeoJAveUZnh+CyFzBXJstxU8?=
 =?us-ascii?Q?TadNcRRxK9D3/7cRJAccmM3JMA+ubNFqVY6XMcT03OFUjovx52GyR1e4YAOw?=
 =?us-ascii?Q?L/cc6GkQvm/ZuYOjb0uRdODlmJeGKdQw0V1XPbQVMpPCf1ZpMme3cohtpxCU?=
 =?us-ascii?Q?CbDocqDij5p7bGiaB4aym6ylD2KBYdSJCU92cAxmCyhAp/4q9l32o260WdAB?=
 =?us-ascii?Q?305h3uUIbEdiham7AQDYg8nfbhMY1VWlsdof6EqtWj3lZajk1GT7bk3yHssl?=
 =?us-ascii?Q?SEURwl30Swv6MxTBpNBCCRiiaMWRbk1KGH+CbT8yNdHCFZouNScRfQgspYhC?=
 =?us-ascii?Q?mqxhpOYXTDgQRVM5MU5RHX0iVO16gRcRbPLQGGBBJbCn+/q/IksHyzVkVm70?=
 =?us-ascii?Q?JcPtEegVdnKJhdBMYJgGXAC3q7SHB/sawhHmVgfkIckpJUrd3A7QKf0hmXD4?=
 =?us-ascii?Q?wb9JFXuhv8+mXO3cfxQ/h8Vt9DZtJPyKL1NR1hUdXRcjRYNY9tr9G5vE34Gh?=
 =?us-ascii?Q?ew2rms96N5hCqJNnDzkrSwWITv8woUBDvFnJYwZO?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ul36nCm/SBJz9MgmD2A+jK8LRzS3SLQFAfcmmuncmiNEzxCvI16Ka4GWgT0DdhHlThz1/0tHcHDiwb5ysDT1R8N8+79GjuAaZf5LdeWhVC3DAqWpwXKAYpbQ8GOZw3MMd9zo9xDlpQ3ey7PpnX/EudVBIbRO/suN1cD0Jtv9iiza2CwV3mbKlqHTYn/2ha3Iheil7fKqWxFcCWD3p9Zw0zTJKBaJcVttD6xFj08Fx7xtnBwMaZjlQOoG1Qe3FdI+WeuDIhlhb8bR019fxYLckoB8E0i4CC6sr+EsNVAwrpox0K8JzOQTyWhjOOQyHshDwh/ObqKgL6mJ7NRxu9rOiWO+vpKCoUM3QT6NLNzJllcMXTGKoQWdqREJVNdCoZHZMx7VwxD7yKjPFlnUraONiBQMrtvs8eTJmuB/Uah0pL/92Beryl6Qg6n0nSURN/8lZq2yPU6recT7KPsgwsxJdmGVA7a0LnUfCW+IN35tLZqNw4c+kcgnw9HcjJCot3yWhtdu3I1qQypb2zPszs+Ol97nRAjNUVvYIbSIsmY4OpmdHrLX7C2X9kjoSF+muS0ItLSINqpQkMK2IxlaRr2x6fEaakipH9fZEMmv1lVjomA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e11cfd-281c-4e52-d0d3-08ddb3adf831
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:03:13.2961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XTKvEwpx63N8cMSKd2CTB5+7wskCC+BGeZ2jrTPi474kbdG9kM9gUOX/Nu0R+8i2IcV0cG8ARyNVMfioT85KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250044
X-Proofpoint-ORIG-GUID: X5zGx69E3VJgI-gNQqBsoMCU6ERQafMA
X-Proofpoint-GUID: X5zGx69E3VJgI-gNQqBsoMCU6ERQafMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NCBTYWx0ZWRfX7rYQ6hQd+bTC MNQUGdsG9bg+UJGcIz7tCJuvNKXqeHFwN9wqczq/WVtHMtUhHTIjF9xp7YIVhzKqjmHBgNSL83e qu6O9q9Fyh6F/PkHCVKuXc+iJDpfab6DLvw1ewNCnVv9JuX/u8jfHkYRNpbZDBbAd9JjCVICF1e
 CndazoAlU+XU9l/3/bWCDhvYpRRsAyhd5OgFQsfZvO5T7+6ykDuALZyVoBLHeSUpuQuzgbxK2cm UdnI0+32n9l31q2D80681DT4WqcEPF2yK+O371uDifLnfp9M+ksieXBBnYr7vq9KQsO9B2NcOil 6y08g9Qi3Sl2y1arfwKXJqZqjhdM2DwORXnOHVr75/cKVaGvDxefEkYF0gxVTKuNUlQrFl6GRZQ
 znOtXhUswURyUPk5Mths/dNAeqx7bohgg0X1gIK4HbXUWrjRQdxpxWwoyofwwtpPbYS1T+fI
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685b9123 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=m1awSTvZAj7HmyTW9XYA:9 cc=ntf awl=host:13206

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/pid/tst.manypids.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/test/unittest/pid/tst.manypids.sh b/test/unittest/pid/tst.manypids.sh
index 4f77564f9..38757d0e4 100755
--- a/test/unittest/pid/tst.manypids.sh
+++ b/test/unittest/pid/tst.manypids.sh
@@ -5,6 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
+# @@timeout: 80
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.43.5

