Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5854A00
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724908948; cv=fail; b=Fh01HLFgKoquc+mf1WXIt21cQ08VDtcO95JxCucXD4w1cgdk5eJwGhLf2ztxus7+XNYw3hAvdNJJDxK1VyLXJEsOMw6EX1U8x/s1WNZz1gShZBDrZq5ftNzIUJrzsyY8/oSHdVfAPpaE7sTnDfCQKOYd4GKTYemTeaJGZTJO4aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724908948; c=relaxed/simple;
	bh=Pc22OCTpdVgxFWbGmix+u2cU3WdXE+crVM2LFcl7kDA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ODghEvUmzzWdResQpU6IBHYesU0b2YWOmI/z1SirrDvsS5afABT62XjuSiQj5UN6wx8XzjcPaVF4hRXuaKaHdXhi7SjNU6AAg+5jsaovWUz+AFINlB68BxuHlExzWzlbuAKbLlVGmvoL/Mo1c3jckBvX9OhobzmpPAyihl6dR88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Oowp2CL9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aPwuRWPQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Oowp2CL9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aPwuRWPQ"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fw2I000304
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=3+9oMUOwe8sModyQbowthjU9TUeyrlNknLBU4UBh/Ak=; b=
	Oowp2CL9kA6aM1Vs3jiXLoKAl3S0vMgL1xjjPbF/qMuyt+UujWJETCIHw1ekyQ6I
	xjUnyjQf7mwzDW0LYPvP7tXLgRnssgdUanAyb/R94t4IQe5UP9Ebjnljh+MzJi//
	mZ+B6q5pzl2l4fvz0yVeJMrCWdM+Qu4ODNXn82xG2F1gjeRgaZF70f54r9q6ODiS
	pTsUWQ9J4o68iIdzltlnd/rt8s74uwkuYbscj0btSrMGYD1JV59moyg0aBJ0d+SY
	pcZFT/A9ctBNQfHg59YnTNW3NhluPn5ULhh8Nn7aoidbvwCZNH+LNm/zHqR4lNgh
	EE+Aaop0U9L166GfU17vYw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukub41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T53pGP034817
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfhhv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:22:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkjI01fymF3O2a6rMDWOhlS6rCi/N0EzdfubPrGrFSISZ/pWZLqAQ6E/Ef974GyL8oD9XtIJo6kf26DkJNKCSF+pTaecshy+JD/5+y0DNUpnN9lPdnyG5HbnuGhCMA+3EKmBmDecaWPN25X5qp/bsGjkZuKIw2CJn4OM7WO/z6nCmjl7wEGkGoDwLnLTGFZuf40ZTz7nBP59ORiiLwJs/gCZx4Gg6JLNrSPczCmgLWJcHMj17N83Ei3iBdT1rgQS1MOUqh715HzVk0G1NRPQtxJnfm6/Dru92z51XFFIbyDwaLvHCbyj52rPDCy1XfD8n4XyzgQL0w/+QYUbOGEUuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+9oMUOwe8sModyQbowthjU9TUeyrlNknLBU4UBh/Ak=;
 b=K7uGfIFshWcCluGDGGaRFuNdEVjxbai2Om3db07YdicPAAoWtIp5DJYf+qWB7SeEW0J49qFrRYcmpTIa8CjO74pUC3G6bDsdB0/89w8Z9k7WshV0aPBR9rhVQM8ye9pznGba24fLwr0IzTHABlbeQjaweb18qHzzswPN6x6x95FgTriMu0zrRl6FDSdQ0vidJati8mmRi3vcgv9gyB/Qvely5giU2oa+HqUuo2+3ASkE3lsua7QhEb8E/5HUUrb0GdLibZw9BPKgW2ofxgGnUGSRww5oujGPEGOkxYNHESKlVd5e+oYQNYDWX1d4LmwY8nadsU8FQDgpmt/+ln0aYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+9oMUOwe8sModyQbowthjU9TUeyrlNknLBU4UBh/Ak=;
 b=aPwuRWPQ2UO343Ae22XR+W5wE0jrRHOwy7Dot2pjFVqajEFG8RdCcoWqx/cmP5Mbz0u50/GvYWAPvrsZtvlw/XwALrgSyQzR3VgCjf8z1kNjjmQHsI9DDBuz/XqbOXF5GrcWkgKXZVo3Fy5Bx/jyvdg7nmv1MSsFNLKqQYKpWGo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ2PR10MB7656.namprd10.prod.outlook.com (2603:10b6:a03:53e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Thu, 29 Aug
 2024 05:22:20 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:22:20 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 01/22] test: Handle dtrace:::ERROR arg3 specially
Date: Thu, 29 Aug 2024 01:21:58 -0400
Message-Id: <20240829052219.3234-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ2PR10MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbb7de7-7c7e-422f-7dc9-08dcc7ea8e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QEPEV6aMcolm6CqDsuhPdx5xnTJJIvQ9S3CBeJRMvNqmvi/z7nqpMKPYq9Y1?=
 =?us-ascii?Q?VQDZkNH17yJUiwF/Jh91qSQR+bYqzAWgr/lyLUBRBKQR7FTm/LZcYjy+9MTW?=
 =?us-ascii?Q?TYItKrxs8GGRf5JxAnWw3D3yWDHj1S7xShtR1E3bizeUgB5mS3UX9Rw0OfLC?=
 =?us-ascii?Q?yA6pfuuiat0z7i8eRmykaolRQjTbwMC4DWf4V7kWdRnBlzOoZa8iFiB777Jz?=
 =?us-ascii?Q?giC6xoV8HgNK38mBP6+QMkZ/DzdoADS5kbNfcr7uIJUpWDWbZmqC8Zc4RBxL?=
 =?us-ascii?Q?8MWvjDIaDyH3fOEWZ6NHYOoSD0FQklFMt/01uwVRliLg7dmzOcciZTvVTtna?=
 =?us-ascii?Q?VIyCe3+WWQez7CX9sDgiOwB4JkR0jqjT7lhGyltGQ2HkZiO8CSNrzciSpTW6?=
 =?us-ascii?Q?OfpN1vt5a86fx5aWxrV5S5CRxkri52Qo0J6vPGBApwShg26h1RZCCvzytn8K?=
 =?us-ascii?Q?3SpwWuEm50oyr+EeeonGyoK7hds0ZT03NXHOoSa3Qcpb0U6GjkzXIR9DYjxp?=
 =?us-ascii?Q?QKOjyCsrQmug5LetjW0jYR+Fo7qTio7rIeuRf2beo+w7Sq/HC6JxAi6rSGC9?=
 =?us-ascii?Q?rtB2UQPoAnalLEIZVRmiwG12A4tAJOGaFV0DEJd0vap9iOZ9b3lY7tLd1KDZ?=
 =?us-ascii?Q?Mezn9eZdrpcy80tPuulyJVZ6d9fUpGAYU6DIbYNa++cZ3N3Cf9P36awiirF3?=
 =?us-ascii?Q?/K8EWIYhWpJH11N2+U+5b8KEzdZLZ0p49smLeK4CJPDS+zHW+vTcMEnFdykW?=
 =?us-ascii?Q?0D3Oxt5ST48Y4iVopuLbQBSVqbz3sqnRC2c+spdfUQNq3BfLWkFQdQH1tsYZ?=
 =?us-ascii?Q?RCyqDE9GDlCQh1jR/ebYaGJmR7D0EZqwFBmIR5zPvCRWK13fhKY4vRZx3izp?=
 =?us-ascii?Q?QVEyLQ2GoBba8MvnA3I/S5jM93gvl/dT5fKSiwhbMXMK1i02FJkZ/0fTAvPP?=
 =?us-ascii?Q?CefUgWyXtE4X2VqyupGzqbslwbVoj4ewyVh6IoDC3SDlTOon+/L9dDLZBw/u?=
 =?us-ascii?Q?r/ESUcivv/8pNuGEu7StdUah+8TNbY6Y2d6MiAd71CDAzA51BRDxC+tfCQhC?=
 =?us-ascii?Q?8NRwlb+2rq+vRqbili8cCKCsVBjT/4iC5f+fsz1+ZhapDhTpa/009ae65Rrq?=
 =?us-ascii?Q?6GI5A63z8J9aVg3+jl+X7kJAIAP0yc3cNFyOubTKZvJPTBgrfsqRlrA67fSy?=
 =?us-ascii?Q?auIT/E6leu5S9G6ZN3me7ecveGu+pFhL5LO+sXvdEsSNwhfPexb7jAskL9U4?=
 =?us-ascii?Q?0yOhxFAAhyKPeiPTrB7vwhScVtC0zWOBPUdhVn/jNaoQVUwOkxdrNYjsV0GS?=
 =?us-ascii?Q?6S8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8mDu7kqmNYMIdA3lcozI3lvxBzFci7F+tiwupWWcHnfyoPlv6BTZKIOXR2BV?=
 =?us-ascii?Q?4NthbgXsviPE12+jDvOYzCVp74NhwK+lCDCcRW7TOzmRNlwSP//opfpKW/va?=
 =?us-ascii?Q?7Juwi8fEL2Vn6kGde9RSIf6I5C8KI3njKmgnmKTs3TLf/YlD+4E73P5e04IA?=
 =?us-ascii?Q?xMidSq+4Z4D9Z9g4LluJNjVQ5Q2hc/pfUk7iNQwopTIiMw6yX6BQsx+holS9?=
 =?us-ascii?Q?LMFZX9IYLXrLIozAPefYtt5L0TcdgULoVLQwwIFUTP+Q3k3G0RHxAFEbfSg7?=
 =?us-ascii?Q?NWtuRwPOA++jMEMryvNjI3NCnJM3O4ilLrtSjpGIqoKdRm2MbWfCOJksIryZ?=
 =?us-ascii?Q?MMoO/ihQ5AU4F1Lmzx5pawttMGwZY96ONYuQebtVvFbwlc40zAn6GJTI9QX3?=
 =?us-ascii?Q?dQL8b8C2lbnU6DNjJRBPMG95dyp9ba1UU2ZrktW+Jt9KoYm2vyma8+uiGkjm?=
 =?us-ascii?Q?KjANEHB9Gx4XbLu/TXHHs4ez8uIsNkE6CG8aG1zYk5afNT2XjHwyGge869ba?=
 =?us-ascii?Q?oUJs5EPhl7ThYiJ4UQ3HaFKW9d1S1GtQv7P2xI0e76qlr3oj7p/amIz1+pjy?=
 =?us-ascii?Q?9jfEksGTfT+4rf1hBMToJXvwDr7zJEI0i6ucC958533fvlGEqn18NHOO6yvn?=
 =?us-ascii?Q?2JdmHSTSAY9S6FZPTGaS3v59WqvJKwdGJiuvmCJZcjEc0GNGrWmZ8GeAFySU?=
 =?us-ascii?Q?nJaa1aWUWPPTOldXeE1djjlwHvKg460HRadvUBAifaCTHQcA0f/Ti5Tiq6dn?=
 =?us-ascii?Q?q/QsrTgW0i829OGISIL8lYiR2mcXdlnolDXw/vrG59WHjZRUKUZ3d0QtjqJq?=
 =?us-ascii?Q?9ngw3Or95Q+iba6cceQWnkxIUvNIsUZSlxMilo228GZ/79EFX00O2m/SARUV?=
 =?us-ascii?Q?qiZ23fT2N7l0iBNIIIwKRobCIFlSY9/2kfNFuBuSbWILEz8uc4v0bpr5Ix8o?=
 =?us-ascii?Q?aWwQ2O8w2id3m1pXl7F6JA9co6eYUAsjF6o2fGgCwusKhNl2rY1vaA2pfLzQ?=
 =?us-ascii?Q?hsqLYXpDIjgAnwO9conxtNohQ8jIdjCzigBqCrxNvN+sVaZFdV1dDOCCg1dH?=
 =?us-ascii?Q?fIoawbGbzdlutXF4VjOKG4rQbCJ9uC959KSVwvuuzfzpL0TZemqZXTf9121L?=
 =?us-ascii?Q?AL6rP2L6qV8mEAECtr9sGQhOkhuSmgonkRwQPd8ZQvNu5zax4ZumyfxyW28T?=
 =?us-ascii?Q?2CJSromYgKDFGQkYOHGfdXDuIn4AZvdc+3q922JjEGBRQFv+zyFr8tFIm21e?=
 =?us-ascii?Q?mEt47f59YSJo5gM67uNYNDRFB5ZpzbSq9a+qVfl9Q8u+/vIj7K1KgFQMA7sJ?=
 =?us-ascii?Q?hLTBRGlvCLHNi7pZiiKATYrPjuZssyq0iQ/0qAoM5WMWKsG1vt2vNFzUevzu?=
 =?us-ascii?Q?MlZnNKS6bsnGJPE8c82lRH9+SUy81kuIMjSD6ePG1NWp9sFq06oX6M7IwEOp?=
 =?us-ascii?Q?vrBHsKCSVyIY3O3+/m2OqIB42fBjb57evnOyymjegQPvWpFYJFd74b1Cnh7Z?=
 =?us-ascii?Q?gbFCCmffNwfbpJtN+DrjKzpEZOBczro4sSyB2XjWbmJC6Ag45JgNOcCwSxpz?=
 =?us-ascii?Q?O6/4GPmOj3ehFi5IcNWKkBC4MjAIqQU0DmhOvf0F?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F36wr5AyYXkQ6zIyUC1PAWSk7wpJWA42St9sQbNQ4UNA4nx9OYwmNvVkcc7Gmen2ta5KWja6WnnyjKlTnuG+SDDMl3gqYOHd19HGCCmfhqYtj/IIaTY5IP3PMVMVOSfg7pAaDUonyaEJL7qNFs773WROH72xo3Ar63RtTLEja6gUL1dfqwYZ5KCxaGRmPev3za5i21NLHtcQ81JKa4oZC5a2mi89DS3g7aJKR3Ahv5zgiUXrqg7gc0BdunVeTBnYThL+rona8H+Pl3M4xPRXU8YBk0M1DHqmZwJx0ioH5Zy5vmWlEdVR92/QMlLJRldu7u/tkJrhyIDJGUrcv2enUist2sntzNd0unWVRzlp8JQKWY6A89Dq0nujEpMBu2ZaF5x71PC7yqMv6lQitopmNSLQ6QcItp+D5XNX0WPPAz8hBILQ45WPDlM4OLP1qnGDcfv+V3VbO5KhxnHttPiMCeZXnQd2L3XO1sbL7xIwxoxpLvtOv2cT5axVce+Bk+rD44tpcJeU5TfXOX8CP+qjeV28yvSJuKyrZJTaToDOg2ftLm9cR4UPkXd1FFqnS/u27H3jPrnOzvHqWpAmYtsbVsghFfKD4CvYAVZKRtRzA2Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbb7de7-7c7e-422f-7dc9-08dcc7ea8e4e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:22:20.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 503grdxFbVHAsiY1Aats1AsQLM+j5QNoM3TWPmcUrOV2qjYprPaZiH7+EhOlLr98AQCKJYTde8iCeTtAAmFtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: a_sMZSuQv1xB-lDSMasBfZnaUDDekLu4
X-Proofpoint-GUID: a_sMZSuQv1xB-lDSMasBfZnaUDDekLu4

From: Eugene Loh <eugene.loh@oracle.com>

The ERROR probe's arg3 reports the culprit PC, whose value can vary
with minor implementation changes.  On the one hand, we do not want
tests to be overly sensitive to this value.  On the other hand, we
do at least want to check the value is reasonable.

Therefore:

*)  Change tests that dump ERROR's args to omit arg3.

*)  Add a new test that checks that ERROR's arg3 is reasonable.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |  6 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  2 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.d |  8 +-
 .../regression/tst.DTRACEFLT_BADADDR.d_path.r |  2 +-
 test/unittest/variables/bvar/tst.arg3-ERROR.d | 92 +++++++++++++++++++
 5 files changed, 101 insertions(+), 9 deletions(-)
 create mode 100644 test/unittest/variables/bvar/tst.arg3-ERROR.d

diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
index 001903ff..bfc77bf5 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -19,8 +19,8 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n",
+		arg1, arg2, arg4, arg5);
 	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
 	exit(0);
 }
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index b11f6c99..3e7caac4 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,4 +1,4 @@
-The arguments are 2 2 4 1 64
+The arguments are 2 2 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
index c23f9503..ec519f4f 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
@@ -1,10 +1,10 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
+/* @@xfail: dtv2 d_path */
 
 /*
  * ASSERTION:
@@ -18,8 +18,7 @@
 
 ERROR
 {
-	printf("The arguments are %u %u %u %u %u\n",
-		arg1, arg2, arg3, arg4, arg5);
+	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
 	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
 	printf("The value of arg5 should be %u\n", 0x18);
 	exit(0);
@@ -29,4 +28,5 @@ BEGIN
 {
 	d = d_path((struct path *)0x18);
 	trace(d);
+	exit(1);
 }
diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
index 8c601a43..be1f6d5b 100644
--- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
+++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
@@ -1,4 +1,4 @@
-The arguments are 2 1 28 1 24
+The arguments are 2 1 PC 1 24
 The value of arg4 should be 1
 The value of arg5 should be 24
 
diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.d b/test/unittest/variables/bvar/tst.arg3-ERROR.d
new file mode 100644
index 00000000..6c2f5206
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.arg3-ERROR.d
@@ -0,0 +1,92 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: The 'arg3' variable can be accessed in the ERROR probe
+ *	and its value (PC) is reasonable.
+ *
+ * SECTION: Variables/Built-in Variables/arg3
+ */
+
+#pragma D option quiet
+
+BEGIN
+{
+	nerrs = 0;
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[0] */
+	trace(y);
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[1] */
+	trace(y);
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[2] */
+	trace(y);
+}
+
+BEGIN
+{
+	x = (int *)64;
+	y = *x;                       /* Error at PC[3] */
+	trace(y);
+}
+
+ERROR
+{
+	/* Record the problematic PC and continue execution. */
+	PC[nerrs++] = arg3;
+}
+
+/*
+ * The problematic PCs are likely to satisfy the following
+ * reasonable checks, though it's possible that some radically
+ * different implementation in the future might violate one or
+ * more checks.
+ *
+ * The first problematic PC is expected in the some range.
+ *
+ * The next problematic PC is expected to be PC[0] plus some
+ * delta, including some special functions that are loaded.
+ *
+ * Then, the next PC is expected to be PC[1] plus some delta
+ * that is smaller and narrower since those special functions
+ * do not need to be reloaded.
+ *
+ * The last PC is expected to be PC[2] plus some predictable,
+ * small and narrow, delta PC[2]-PC[1].
+ */
+BEGIN
+/PC[0] >   100 &&
+ PC[0] <  2000 &&
+ PC[1] >  PC[0] +  100 &&
+ PC[1] <  PC[0] + 2000 &&
+ PC[2] >  PC[1] +   30 &&
+ PC[2] <  PC[1] +  500 &&
+ PC[3] == PC[2] + (PC[2] - PC[1])/
+{
+	printf("PCs: %d %d %d %d\n", PC[0], PC[1], PC[2], PC[3]);
+	exit(0);
+}
+
+BEGIN
+{
+	printf("ERROR!  PCs do not seem reasonable: %d %d %d %d\n",
+		   PC[0], PC[1], PC[2], PC[3]);
+	exit(1);
+}
-- 
2.43.5

