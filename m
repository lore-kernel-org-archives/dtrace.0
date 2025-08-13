Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E927A446
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755100662; cv=fail; b=ltnWDNMPrs+Tc7KZAcPE5LP0AO4F3sNGKGikoIHofz/vMehI4m2BzkdLAvVQNRx5bWpCPpnfpDJWI6t0UXmpYwV9d6Q+WV45PvV0G1+ce6aDNtNTTldgiE093SNgxKAjDJnrkz3ExX6BuyKkDJ/VYxVp2chWVz3OSzpr2nStZiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755100662; c=relaxed/simple;
	bh=9KlYzwWgLcL5xhfurHIwK1Dy5SDWhrlFIK1Oy5+8Irs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=P648/NbpZwoM6Oz8x7c3mCU8N7vtwaWbF6uDD+BT3lq9gE+nvR/KAioknJdHuArvkHU5Xnaf7YUPV/Jcz6oJuB6VPDLSp0W0lRSk8hdf8fn2yNf2BP8LJPqA7akh4SCpYGRd1QPYDFoG0nrONl91VooMJ93GUXhOBEFVkItMsBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oifMdUwZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zREHnsYv; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oifMdUwZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zREHnsYv"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DDNCDC030551
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=SC2Gi/Ru+sJJcLzPNLyYOG/Iqo21KzJ32CbBr4E0zGU=; b=
	oifMdUwZzw1b7Uy74Uh4ayggyLEJtyLo+r/F20MCar4lveIXJuabJkhDBSaHFnJE
	UFk1AA4HVfuM58U20vYjPjA4zx/4AK+2DcySyxOTy9OuqZcKdxs88XMzkdNz95J5
	IrSdY8tq6h4v9pEgKWZBQm3NIVxYwPV/b7az4U010hjNjf7FQW7PvdlQzK02M3+i
	41UIdTVzfzOb9UC6qzoqdvNyRDSh7F1yft0JvFl89pw3BFzxlJsDkHz1oKnovCWE
	EZ/aBcni6Tbv4M8NGN52Wm1RMqKKFdbld9BGwhYbBoe/GwdSOc2VueY/ihptdjGW
	UVXC7zCqC00c/kz2RDbHJg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvwytet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57DFtAa8006372
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsbd52t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 13 Aug 2025 15:57:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5OfT3p+yg2e8YFc/IMOQCEcvUeK+7BkGF54qeI1I3SZP6HdrQ6cs6oWn+vsmAjg/p3iyrSHzoeJzgAvqT+OCK+WPz0PIxUxWnTvRz50J5VTH7DKd3WA+doo48II7Ra5rd0kUKdzhAFxzUA8CsgKw3FFb72ccEJr1N6Um+P/mt86hNAPTsaH4NDjCDDPeXsI4Cjyzlg550+EK8qxP91TifMQxNjjjMSUWW+AD0cZud3NAccS1Jw0pC7OvfXr0m+8p3ckDMpVzvuCxpR2SQ1BpaPt7BsWWf+wjArUVyZPidi0Ln8GwdeEiJcGwyxeJ6NVfTC8phl/xOhr1Or3KpTNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SC2Gi/Ru+sJJcLzPNLyYOG/Iqo21KzJ32CbBr4E0zGU=;
 b=ZZixliY2FCSLQKBjj8Te4vcgXDnPO0dxHwZ4rD52Y6qD1AtSVCzdMDhdSO7BS54PcLRzO7xyiwLamFh+ZY4MoMwApsm6hYgl3IMqMA41H+NO9i31IgaHXm5zmqj8nw1hwUlpb4odgH2xsfFuSUcNmvu6XFvarqPfjVq7yNpE8yV4mo3GNO4lMI36X43W2P+GRmghsi6UznBEFd1RZadmeZrHQScMiWBRSn9oYWVvLGRSMi50O5AdiqYu6L4mpGswipB017wV9imBeUBgTTNz8KDWdkfNhVHb2spzk0LhIToaSJSeb+ZsYTcQWzkcv7QK/4kaCJ697Kz+X8vvlnouEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SC2Gi/Ru+sJJcLzPNLyYOG/Iqo21KzJ32CbBr4E0zGU=;
 b=zREHnsYvi50MspbUq9ry8bgj/JyoOZ6yqjWLCkof5c1YXlo6DPyOXzDTVx2gg6Emc1aepeClO2cCLZ/vz3BjknkFRIHHvzqmciXYr9U6gaqH27lSrPbQ5OCvQ6dISRVwAhezEq8QNiYnTw7TYdhEJeQ4tPmGa58ZkERCbJRvS6Y=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA1PR10MB6241.namprd10.prod.outlook.com (2603:10b6:208:3a3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 15:57:35 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 15:57:35 +0000
Date: Wed, 13 Aug 2025 11:57:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/5] string: ensure string size is handled correctly
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB56727E2012F343B19177481BC22AA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA1PR10MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a102f3-0e0b-48a7-3271-08ddda821ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fR2ADFWjpj4cGfgfFiS7MNxGmUa/Ncc0sS4yp9QkGRSWXahLYJliHEKuEZzg?=
 =?us-ascii?Q?iftg9JnHF58vqZrcNaniR1ifOA6yH6YRWhkfolZFIifGFyHUPSZuacUmB4es?=
 =?us-ascii?Q?VX2anPDUcgWyRL5tnmB4vlLU6/mMojt6b1bRK25vdt/ixDKvolHd9e0PUDAc?=
 =?us-ascii?Q?CYExsu+R/JrHuMl68nc+h0tB5WmoU+apeRxGKJqNIFUUfx67e5WdBNEGQtZc?=
 =?us-ascii?Q?vWy2yEVNy8VSALLrik+hm1Eibe8AnbmvGsAcCbPLSxkJDfw/1wapCr+KjF2Y?=
 =?us-ascii?Q?karw0+ZzMUROpBFCJm6OsEH5LQwbIzIYoQWWjROO24E93YUydpDXG2GewoE6?=
 =?us-ascii?Q?8G6g+xtm+7TUDBwx3AwaUVlW9Crnj4eSGqPm49FO0gbdVKB+m4ogHYqmRTNI?=
 =?us-ascii?Q?NbKgkc6GElfPqNU2IPeLivHHZwUKZCELGqFZtr80gsW86dIUtbXnCjOLb8MA?=
 =?us-ascii?Q?AyTmy5f0vojGQiOemffbFM/kE7Yl6onwyyyxKM9UqSdnzE4hqRjm0L29gI86?=
 =?us-ascii?Q?pvwmwIdEgUmK+HaQL32m7AGfmI6+mcrgjr2I7znHWWY7RMqZhh4adKj9WUCg?=
 =?us-ascii?Q?0wYJYXZNVuw9YxSIFMKNUM2lCqoJZW+mTMWj296/7Z/AR6noaSE4k9ALhIxU?=
 =?us-ascii?Q?EotSzn9vIuNJTQvPh9fxVZ5QjTF5x8ahvfdbOTsPXlPhhOytUFgiLppFRKMC?=
 =?us-ascii?Q?HD5td/yILD2jtbgiWFRW7MbbUhBz62zhvJ/ThdMA21nzFhWykb8NRlesdLwv?=
 =?us-ascii?Q?kuoW8nCH64ysU1o1+VvEiy6i/Ve2E9L0i3GrNxT/skTidbh0V5aXZFZCvaL0?=
 =?us-ascii?Q?dBODHxRzQGqKLC0JhrRiZ/dYMLK9D0ICt2vCls4v1JJ2+HbXLUWdP+zsGfMY?=
 =?us-ascii?Q?gqQi6H7Dx6KHofvrPgjUoaXMU1dD5c7FssQc2pPF98bg9X+Cwf66dV65elZx?=
 =?us-ascii?Q?O2DqjdYhJKThxOA03bMLGXu4RS+7SBLy/x99D41fbxwnoJYqg5qE/4jifAaY?=
 =?us-ascii?Q?WlBJc/txCVeCg41NGzOakCP6bUAiAoa8mOCoZQKPwwM+yYMFV2/7anZE0b/F?=
 =?us-ascii?Q?XzLMCv1xe9UW3S7EZDcf+QyjZLVozcgx8chGIFHApSvNCijRN4BCnTNFwHnj?=
 =?us-ascii?Q?U+YXT4lsQIhJKMPCAzawE4kf8YxT7oxrG7IrBAXXiplanXd+n7vuoloBtxCu?=
 =?us-ascii?Q?rU1UFZ0y+TJ7ZnRE6yDI0gwYQ9j1zNkTEdc64L/mqtDnC9ZJJDVX8DyUHIxg?=
 =?us-ascii?Q?rmPpkplinfrsWVIBiE1WKX/92AupdQHV5VvvfFzSdnUNHdEbvsFunDpYUzuh?=
 =?us-ascii?Q?cEm91vAKIia7qN+fp9jF3gMNwJ8zefyUJDlNcgitvmWc7vPtG7GMuxspA/lR?=
 =?us-ascii?Q?NUM3pfngHDFhVqpvu8ADxHWpAXtoIFGKT/JZJluCy6osgxTsdA5Wuqu4ElIh?=
 =?us-ascii?Q?9TzF7KkR6Do=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3qCEO1svOPNzKhcOjqnfcY65+lAC+thSTSgf0sjIrqMts1vmxif/w6U0axBS?=
 =?us-ascii?Q?sLUck+9FjLNnX8LrdcWcJ9JfORIZquQvfZQNvSzs+dGvvFcgq41+YJsL+5zh?=
 =?us-ascii?Q?OGLcZjKDQ5aF7SPwwrTDHSjVh6SaSU2ZyDap3XriXZmxWlTPmCLl/gF2DIRv?=
 =?us-ascii?Q?O5PmocURn4m7Uh+2ZztrbJoX263Db6CGb+Lkw29JqKKNoUZKgMswQ3NJCAPi?=
 =?us-ascii?Q?MTRO6Gfz1+sqv/9jDotlYxZruBbElY0OAr43dRyyOex2Uf9saWVg3D0CCOiS?=
 =?us-ascii?Q?7A9qlV2KsP8Fr2s6AKEMn0z6o8usxVgMTVk2u6GNFRoRRR79ny0O+MVM9F6l?=
 =?us-ascii?Q?MLvaJocqbJaBrxxbBYFrDXBA69gLXpNwkRQ1NSjGpRhdRA2FipbDMylri0hd?=
 =?us-ascii?Q?0/i0p6lR93uSM3TVqjZWfJPuD5HAJ85vQuo5uaTIsGPHkAuLhxgg4res7/FA?=
 =?us-ascii?Q?uEkxKCEQW7fzlM+wjp6ZYb8k8xGOIetipZk8y/G/iMJ2iOaPmwne33kpgXhh?=
 =?us-ascii?Q?fmBsdoMV06HehHSWok/b5h7FiksoeB4uRgxlzXid5tMNtH8OB4E77LZTwJSg?=
 =?us-ascii?Q?1z9Q9LEvr8BJVAbpRZy5PUeVLBM0lgvytCrJILqWOlSMKpujAKVS70mg3ceM?=
 =?us-ascii?Q?Fofr8KCqXN1SydFw5hYqXfZk2epO0BRbO4c4zd9lvR3poEStZlScRYbjcqSa?=
 =?us-ascii?Q?5XfC1BONRmZuomzFU1zCjGsdY1yPmhQdCXCRB2NsEdm0rMmb4tp/7BzCWvYZ?=
 =?us-ascii?Q?r5mcTqcXLy1Mz959gnCQbMkA1gNchIQ0IMjWjkzcixDPJEvdtq1plLpv36tx?=
 =?us-ascii?Q?XAHpqNgdg05d7G8tinEPh4pq5hHgEAPxxoUepIV1ROPh8aSDE0WjxZqSyYVj?=
 =?us-ascii?Q?gPSXAwgddDqprALkLSQLQnH6hrj10Wv8Y56uH/lJpOzLYb9KD07BOGdrIglp?=
 =?us-ascii?Q?RHMBbzwAHKQcfNS/gJq8yJbPsALmCOg1p8DNiWx4o639Fs632kyEGTQ7xa6+?=
 =?us-ascii?Q?fdgbC2q9YKeuPqAnFcDtaFns9pZNOJ9NI3+dwKpWXy3Drz+LhTN2Qpd/GqJI?=
 =?us-ascii?Q?l8T1hfM1MdvF9P8w7qmsqnPsaySsSjGwia1idv2Xec4H/PHVRb19VwSVwH2M?=
 =?us-ascii?Q?qPp2QrxJxShvYFI4QE+NPSWbH7R44sdWP47D4Gfq4UK4dJt44JdwSq3Bgguu?=
 =?us-ascii?Q?CRaw0QHVGDlJ2xSkonFDu9dEsWI/rp3kw48+9tly7JMOG0yoxPRP+ymiQekk?=
 =?us-ascii?Q?7M7fmw0UnYf5r0aa26H7gMiOZ4BgZE4xpgVz5gT8x4kUiCjYhUforGdr6odg?=
 =?us-ascii?Q?YEQl2Zse7LWnpIb7SEJR+rtOEX+HFSQqsXEawyi1AIgGAbG3EmG5LhfdYVny?=
 =?us-ascii?Q?F4E1aBmTmJ4plPWbohSckv+Jn556OOFRJhsWOqbtHqSk1OLTpGRC1aU/WRDP?=
 =?us-ascii?Q?CZO+7jx27DrqTpQegXIG2hDwQTdNnsYhY0MbzUJF6I+w/WTwSiOyUxfj9AkU?=
 =?us-ascii?Q?Uxa2Bg7ILVnFzy6mMdI1cehr4xPb4COYLyeFZvHjeIlNSKvfDeuJBU02YMQJ?=
 =?us-ascii?Q?QGTZVNGaikHS5UpB+nd/7wTfV9CRK9tVBN5fghhv7zhkEwPYfm3/eQwxoek/?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QxRKK+rTPey2Sgs2p7F/Xc4pBMKqv4yrxwyBJC+WQHDt94NLQZ00MOdfnSIg4pIUqW9XOyvQm7ask4HabKhHd7pQC3EGU5bURLZx1jEv6EtSyoSrDO5hK1NdWD04Pjdyx0bLX9MQL8zNSBJeQAnlNBJVNu3yKwVRuGrkfd9T09HnJEMelF0zA/gJ2UoMChMLUW22mU7VCJrJzddto5GczPHRNgIi3Jlam6QzxiVz3btjCXjPF0joEu7nCR6jfPv8Ah+AYKUXf8j9McJLZKNBXIZr3Tnf2wxolRQMbJGwL3fNgo8KsdEpqx0DhBmksQNdRuJ3Pxq0L7oUjLKSsAOPY2AuMhu+dgwbkNgVgGsz0AAg3Mtt6t/yOcA4OMSLYJJwm93Bur3FdhBuCIAznLnGHszw6NM1/AoW9YUK98Bo/62IWFIeWqrm83/rUCTN+GXT+5pYnwtT7CE1SxluIAoFl6S5GBOBBsHRlDj2JAQ5LDt41wvTqoVWSglcQD6L+DDVD2Wet/Om2v7xoXd5TEGFpGyUJTcZZtoKpiR+YQAxdV6CKH4UqWj5iEpwv5eqIdZWZrfKXkxzxwgK7alNZHqalcjK17s6JCL2ah3SSYhQsKM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a102f3-0e0b-48a7-3271-08ddda821ebd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 15:57:35.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6W5Ami/g0+42A9VtMubhD21UtNgWeFs5DydNl4tDlUywNxO0vho/GiFcaROSWd19kpUJpUvfknPMLkJ7nhrDpCcloUO0Vw8o0AVJvppYDtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6241
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508130149
X-Proofpoint-GUID: hwUJkUCk1vLU-EIWEcQktN_VuFUNls57
X-Proofpoint-ORIG-GUID: hwUJkUCk1vLU-EIWEcQktN_VuFUNls57
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDE0OSBTYWx0ZWRfX7VIFCytLIm+0
 puGR6Sgzn5A9daYuKHb67JYQKlAGrJmAvXXZkG56xcT9ZkftR93Vsb7DW0IMFKP1bzq0ZsyIqxZ
 AQtTYCaz4Aq8yyRNcVUHbGKVyADqGhfFeXYENOtFW8Pi1ZHTvaJq8ol25l3x6G/33qEY6w3ikWN
 XD1vdXqRMmi37QF4z2P9/BI9qcl56u9NKwbZ9hqoCbEwL44ShNYXW+H+M0uzsCxM5uJrVyqAvs0
 spEm+WqBu/ruXWgkgLv+V1CbPX9lbT2g6P/DOarmYbSzNsU7I+sO5SC6m9KFg7H70z0IPKVrB6A
 UsTE2qZ0fApADUs4nzvDJRhzC1NBBUjcjEOP5IxBR/Iu953DO5HyY+ChBR+p9MQVPXt8v9MYWzY
 /t5wcV+aUBoZYvwd+jpwdoySffKowdcJ0H0EduFt8DUMnoL7PL4d98lE7XDvBQ1UbU7HZmek
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689cb5f3 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=YIg59ii3cCfQW8IDRDgA:9
 a=zaDm8kx9EmDbiU77:21 cc=ntf awl=host:13600

A string is defined as a character array of size strsize.  Strings
that are less that strsize in length are terminated by a NUL byte.
This implies that the NUL byte is part of the array and therefore,
strsuze is indeed the size of the array and not the maximum number
of characters in the string.

Tests are adjusted to reflect this behaviour.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c                                     | 11 +++++------
 .../funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r      |  6 +++---
 test/unittest/funcs/strjoin/tst.strjoin-bordercases.d |  2 +-
 .../funcs/strjoin/tst.strjoin-capped-size-2.d         |  2 +-
 .../funcs/strjoin/tst.strjoin-capped-size-3.d         |  2 +-
 test/unittest/funcs/strjoin/tst.strjoin-capped-size.d |  2 +-
 test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d     |  2 +-
 test/unittest/funcs/strtok/tst.strtok_long.d          |  4 ++--
 test/unittest/funcs/strtok/tst.strtok_long.r          |  4 ++--
 test/unittest/funcs/substr/tst.substr-stored-len.d    |  2 +-
 test/unittest/funcs/substr/tst.substr-strsize.d       |  2 +-
 test/unittest/funcs/substr/tst.substr_nonDPTR.d       |  2 +-
 test/unittest/funcs/tst.basename_nonDPTR.d            |  2 +-
 test/unittest/funcs/tst.inet_ntoa_nonDPTR.d           |  2 +-
 test/unittest/funcs/tst.lltostr-short.d               |  2 +-
 15 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 88dddb087..cd9e7f4e9 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1741,11 +1741,10 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 			dt_cg_check_ptr_arg(dlp, drp, dnp, NULL);
 
 		TRACE_REGSET("store_val(): Begin ");
-		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size + 1, 1, pfp,
-				 arg);
+		off = dt_rec_add(dtp, dt_cg_fill_gap, kind, size, 1, pfp, arg);
 
 		/*
-		 * Copy the string data (no more than STRSIZE + 1 bytes) to the
+		 * Copy the string data (no more than STRSIZE bytes) to the
 		 * buffer at (%r9 + off).  We depend on the fact that
 		 * probe_read_str() stops at the terminating NUL byte.
 		 */
@@ -1754,7 +1753,7 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 
 		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
-		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp, BPF_MOV_IMM(BPF_REG_2, strsize));
 		emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
 		dt_regset_free(drp, dnp->dn_reg);
 		dt_cg_tstring_free(pcb, dnp);
@@ -1765,13 +1764,13 @@ dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
 		/*
 		 * Pad the rest with zeroes, if necessary.
 		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize + 1, lbl_ok));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JGE, BPF_REG_0, strsize, lbl_ok));
 		if (dt_regset_xalloc_args(drp) == -1)
 			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
 		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, off));
 		emit(dlp,  BPF_ALU64_REG(BPF_ADD, BPF_REG_1, BPF_REG_0));
-		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize + 1));
+		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, strsize));
 		emit(dlp,  BPF_ALU64_REG(BPF_SUB, BPF_REG_2, BPF_REG_0));
 		dt_cg_zerosptr(BPF_REG_3, dlp, drp);
 		emit(dlp,  BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
diff --git a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
index 5e7d49b03..8090daad6 100644
--- a/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
+++ b/test/unittest/funcs/inet_ntoa6/tst.inet_ntoa6.strsize_10.r
@@ -1,8 +1,8 @@
-fe80:7060:
-1080::808:
+fe80:7060
+1080::808
 ::1
 ::
 127.0.0.1
 127.0.0.1
-::fffe:7f0
+::fffe:7f
 
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
index 253b2d6ef..1ac5ffd12 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-bordercases.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=5
+#pragma D option strsize=6
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
index 625c786b6..44a6acd88 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-2.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
index 52718325a..d2982a70b 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size-3.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=6
+#pragma D option strsize=7
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
index fe5b323f7..b54fd2f29 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin-capped-size.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option rawbytes
-#pragma D option strsize=10
+#pragma D option strsize=11
 #pragma D option quiet
 
 BEGIN
diff --git a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
index a1816f975..2b700a5a8 100644
--- a/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
+++ b/test/unittest/funcs/strjoin/tst.strjoin_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/strtok/tst.strtok_long.d b/test/unittest/funcs/strtok/tst.strtok_long.d
index 1fbe415dc..254a65485 100644
--- a/test/unittest/funcs/strtok/tst.strtok_long.d
+++ b/test/unittest/funcs/strtok/tst.strtok_long.d
@@ -9,8 +9,8 @@
 
 BEGIN
 {
-	/* 256-char string ending in "XYZ" */
-	x = "_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
+	/* 256-char string ending in "XYZ" (255 chars + NUL byte)*/
+	x = "____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ";
 
 	/* check whether the last char of a long string is seen */
 	y = "a";
diff --git a/test/unittest/funcs/strtok/tst.strtok_long.r b/test/unittest/funcs/strtok/tst.strtok_long.r
index a752554e8..4b172ca1b 100644
--- a/test/unittest/funcs/strtok/tst.strtok_long.r
+++ b/test/unittest/funcs/strtok/tst.strtok_long.r
@@ -1,5 +1,5 @@
-_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
+____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XYZ
 zyxwvutsrqponmlkjihgfedcba
-_____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
+____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________XY
 Z
 
diff --git a/test/unittest/funcs/substr/tst.substr-stored-len.d b/test/unittest/funcs/substr/tst.substr-stored-len.d
index 97d2b0f61..fa3e5337c 100644
--- a/test/unittest/funcs/substr/tst.substr-stored-len.d
+++ b/test/unittest/funcs/substr/tst.substr-stored-len.d
@@ -13,7 +13,7 @@
 
 #pragma D option quiet
 #pragma D option rawbytes
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/substr/tst.substr-strsize.d b/test/unittest/funcs/substr/tst.substr-strsize.d
index b4d0cc63e..04eab4297 100644
--- a/test/unittest/funcs/substr/tst.substr-strsize.d
+++ b/test/unittest/funcs/substr/tst.substr-strsize.d
@@ -15,7 +15,7 @@
 
 #pragma D option quiet
 #pragma D option rawbytes
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/substr/tst.substr_nonDPTR.d b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
index 9d847ab6f..3e10af08e 100644
--- a/test/unittest/funcs/substr/tst.substr_nonDPTR.d
+++ b/test/unittest/funcs/substr/tst.substr_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=13
+#pragma D option strsize=14
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.basename_nonDPTR.d b/test/unittest/funcs/tst.basename_nonDPTR.d
index 4f93685f7..cecef827b 100644
--- a/test/unittest/funcs/tst.basename_nonDPTR.d
+++ b/test/unittest/funcs/tst.basename_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
index 500c53e86..f079c7ef4 100644
--- a/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
+++ b/test/unittest/funcs/tst.inet_ntoa_nonDPTR.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=14
+#pragma D option strsize=15
 
 BEGIN
 {
diff --git a/test/unittest/funcs/tst.lltostr-short.d b/test/unittest/funcs/tst.lltostr-short.d
index 969045667..65a5714c2 100644
--- a/test/unittest/funcs/tst.lltostr-short.d
+++ b/test/unittest/funcs/tst.lltostr-short.d
@@ -6,7 +6,7 @@
  */
 
 #pragma D option quiet
-#pragma D option strsize=7
+#pragma D option strsize=8
 
 BEGIN
 {
-- 
2.45.2

