Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36DB186E5F
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887277; cv=fail; b=PREKm4I6tZi39vPKIrBUdGpTJG3t/LHCOmrrYMrGSibiPhFfBT01kuHcMb3NYDvDj0Qp8CUxysDFfzfbJloblnqN1Jdse1993QQDXAOMFqe7pgIjLLJBWHwLc8CJHyY5FA2uZo/rZs4p5jLdX8ktPS6/czPXq5iHUXp/YwZEcd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887277; c=relaxed/simple;
	bh=V25cpP7RVsjSo9g+jS0eb3//D7ecv7EtCsKNjSQh7UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oXZ8gqHk1Mzn9xHkFhwv4Ijj4KruVxyojppfwRkuxdncsU6jk1OFNYaRneNgh0vrKWu2AUK14oO9ObQ1dkU1DjTDeTydbWmODxYAndSJJwW5WQT7iFcGgoLVaSdlUcsUm4iRjBA9FEzTO7Dj++sFwvgrYUrBp/VAbz5101qkJ+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gXqpR6X2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J9s7S/lB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gXqpR6X2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J9s7S/lB"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdk8g007335
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=sM4beyuRPuMLc/sf75
	6k5dWvjk9hSwT2TH531VKHShc=; b=gXqpR6X2i1RDzbAJbBQu2mi11mvGOlht0q
	E6YTuFL37C0AQZn7/FrddquHrddiOq8R36Vz9JhilP44Dq4jnDGmb2gb1pFF4xzC
	tfzIekqF/8Pohm5yFKrhw8sf1F7+Itjsg4ZsOlwVShTXm3p462myhf0+iopBE9F+
	GpS+Or2+hmAJCxJALpmkg0vs0OAZ3sYFrB/9LH8TYzSDc88HGVkKqarVWSH3xIeI
	j0bQ/lZksXfmzX1Yr5XUTcQhJjtWqb2VCFFDynyKsdW3togXii/DrPQFuh3PCTKo
	nDT/F/0WGlJX0rBGQTeYpAKobTebT9LqczVn5KX8ANgb8V+UuCaw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uwtpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:14:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdPOW039335
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:14:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh66uu5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 20:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnRUFEvGUhQl1UN1N5uefWhwW/5W6ZzPqFRTxZts3ur91UdfRqQorGAMxZgUiY0+qVJCkAM8lgr27S8hhMQ3+vwwwseWEb9BIx9O+GDZgFf1D/HCze2pBkmp0AH469o2NWfW/SBJgowMumEq9ezJWsYSdRMch62+WUOi3VA2/1Szn1+FF/aP3JFsc7SRG5cQ5KmVjrgOUkUpB6Uq0NZWyFC8s6FiCvT88Q3+yJ8/ufwT7ZOHAXYpjjaMNXr2UZ1w6jTM3kaelBVtvqEXyjUDlJvE/iq9/v9pKv8m3iLQ/IGbsOvVlPpX0Wced9MDwtgj4zh9RJ63f3ZK1g+xyDf2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sM4beyuRPuMLc/sf756k5dWvjk9hSwT2TH531VKHShc=;
 b=EJMSRcj0cRDVHNMhXpDHEd6rnnVymZca5w48Q1iA8OHgLXwUQVpEkjBBMm4JFtC0fGpZwt8K7hAiknQ0atNpy3V24mMBb00/IBoDeu/6uvoDw23SpZAosJuHAagwbA7cPYgc2DBr8avuwO8b2qapBiXHQ9G8UvNMQ/UeL621aG72dOQEsvlxhbGdwNpjsT979WhCULA1cMIaTIbD9qkf1kmmXy87u+ssYlF2vUXvcs3SqucpTbViwKc8VIBERmk5PMWsq/bx8+Ival3Vyl7zrQXDz5llCBQkcmuenS9N9rZE4wK3BM7GV1BNusQXvK3xRrclRVi24Ccp6zEE+bbHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sM4beyuRPuMLc/sf756k5dWvjk9hSwT2TH531VKHShc=;
 b=J9s7S/lBdrHpgVt4GlUL5iD8oI1N9D+6wmk6am4w2FPMuhHmm66cdp8BASP2pa2VtPhTnAhuJTmFaR1F7zYKxCXGXeBZSjd/Q/w7NHWI6bnTrNExIQLZkD2JKW0D+q5zO9sWwAHgr2r8bMXBBlw3PkW7o+1zTO2vf3lVUeLhrjg=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by BN0PR10MB4869.namprd10.prod.outlook.com (2603:10b6:408:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 20:14:28 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 20:14:28 +0000
Date: Fri, 25 Oct 2024 16:14:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 08/19] Support multiple overlying probes in the uprobe
 trampoline
Message-ID: <Zxv8IeZgSnA94mYo@oracle.com>
References: <20241025195717.26135-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025195717.26135-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0484.namprd03.prod.outlook.com
 (2603:10b6:408:130::9) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|BN0PR10MB4869:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ad90aa5-82db-4852-06a8-08dcf531a108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B1dSTMuH4yS7nmt0ABFlgLqaSP0+bhK5G9poIs/yIMVo/lXZGlN7Uh7A0rse?=
 =?us-ascii?Q?Q4gJprB/By6Hj9WLFlgBX4VIVtNuMxGOGgJzqhdjhEvn7biCdETaxj/1omBA?=
 =?us-ascii?Q?30H48xS9KVrq9FjemFYVgvKua3nxYb1ncUnMOpKhS498mKARs1K1lmtyzFbS?=
 =?us-ascii?Q?RjBclIkF8wIthWgvBlfeuH3TszE6r1CANkYpngJI7p4anHIsfhfwMB9/AfKO?=
 =?us-ascii?Q?Y/7rok25wbJXQ+yRv1yHkX8J8Gy1sz2nzazYkjpX42GpcWrnRd9gZFPsCwXB?=
 =?us-ascii?Q?Hcf0Y/G8xRDQV+6NopUHB2nQavQTX9Cx3bzYh68nZEonEbIE1Ygg7EwY197z?=
 =?us-ascii?Q?TriNyfX9giDVqnSvqibCUcFrYKV1AqbcurmXrFQA2Flwlcswilp5G5rLDbwZ?=
 =?us-ascii?Q?BstDRDaewgsKGQICnkAoOsQS7iMgGDJ05hQ/j2W1KRdB1jEY3TaVOqo4BjxK?=
 =?us-ascii?Q?V1ojNIdLsOrfuJ45k8vB0QVoZwyZYzweTpu257vTwahstsFLeTCPKppxSGne?=
 =?us-ascii?Q?MiW8ZG51NWWNS6vbuUFXXu2oLdq1/r3E4NB7ApF0Hk6HmzYPZubVyqFTbJj4?=
 =?us-ascii?Q?/wkGqIfWez6H2t+SCy+cgWBlA1zQMLR5tHTlGHG4nmBwnWIopCok0zvIkXDc?=
 =?us-ascii?Q?yRQ6iNdGWH8mRE6MGA2sbp58dA6NRkO8iZBVJ6edUObPxpqVGnHvSf/sY0vs?=
 =?us-ascii?Q?E6HFZKkhdDyBd6mFG8SUgXIHu32/qXGlMc1U3ihOBOynXi+yEaM5JwLIocCs?=
 =?us-ascii?Q?KpCUjfj+kqw3oZATNOevcaM4+Qt/2V5FlKYxyuC50aX1/6c0TMwxwR1f0qIC?=
 =?us-ascii?Q?/LXrL6Dh0w/mGu1lw8sxAxqyBHr7Q9lp7XheQQSevSQVa1s71oLEpAD/XqJ5?=
 =?us-ascii?Q?JRNgo96kWz6Cw/zGwUVrV+Wo80Vg148VwAUJPTGeGAjkmRMeCJRJA8W45jJE?=
 =?us-ascii?Q?I0ClFVKT30ItRFOop5DjXWXVap30Nxb9wZQGWxK6qP0GJ6tavpZt/vAj/Fk0?=
 =?us-ascii?Q?ao/C2GpBMP0hfK+V9Twj6hYD9yOBK4jeHpWKWpKxtG5bTtnVT4tirtIndv6Q?=
 =?us-ascii?Q?81gecVsIgUB3PI8FWaiMJJxnn9GSiHJtMe0D/zhggaKnZjcc9/cCsj1hnNiC?=
 =?us-ascii?Q?KVjhRW34QFLchdbcqyRhd+ABwRuhLFkTfzssNTzOR6kX7nu5k1mrt4l5w0tE?=
 =?us-ascii?Q?wxcNAfbMFj5xTvC08/iogxCjHAyJFhPstAgY5b2Lh0gW9LKulNPdZzQCATXz?=
 =?us-ascii?Q?gA6p8RqRqojKXMJ/alH+mzEjkeRxgB2uw9Nv2GjUtmNyghOS26Q6WWo1Hzei?=
 =?us-ascii?Q?EZVp0ll+OlB9kQkrnV9VVji0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KPzAG4+Wh8rG23qlpXPtcpf2HxS5GmoE0jfDAK5je1Bt9METVE9wgT4ZGTRZ?=
 =?us-ascii?Q?c8roW5faS5yurTxvL+YoPp1sT1m3lsEn/2WVqPN0bmK/m3Xp5Y5LNoCza/Pv?=
 =?us-ascii?Q?UzA7avhKOVLP1HuBkboKyt/pLK2We0K2uORCN4/niwDqZtrC5oaiy3kaMqf8?=
 =?us-ascii?Q?P4dZjuMvr5T7PAinitsBd4c/4FKDBLQg79Y6ADkwLZJSLnVUJjIwnaBeVnS6?=
 =?us-ascii?Q?LQiJ0O8+Ub5ht/l/pLHdTMNzp7cVa++xy0AvHqUWIBE6dX2ZclKUEHgzc66j?=
 =?us-ascii?Q?IOVvBLHuCzF5+aU8Wh9A2qtvbTmf/vkf1inuH3juDP/fM2q+sD0Xz1eI9Lgs?=
 =?us-ascii?Q?offcCcYGM4ZA6QEEmP8px6M6eEGg5z18EJTaDCDI3xvx0GlLWGbkGU8cBx1s?=
 =?us-ascii?Q?fQQujE+aW6AaICZ5mzabAfHQZD+HPLrh+DK9d51Rkyi95qohZg9BcBn72JS0?=
 =?us-ascii?Q?Vea1/7/iEfcanMmhKAbkeEzTSHWV1gAEPUtXx5anOO6hmqbb2tUfFoS9Yly7?=
 =?us-ascii?Q?JBdrbLkF6awfkXH4foLuuv5Dugiu13M0kn/pdie+DmKniY66JAO0T/Cp8FYz?=
 =?us-ascii?Q?rtBB2Tyz0m/bW6AxSzGI0eJMEJ3Yf4RxuDfbHjPtpRUw/HfgZSbgZRjHZ80B?=
 =?us-ascii?Q?SfjIcF2pKn2FmsTsZ32AUpt84FK/9+CutuDoN0JLwM8VUJy+SgyxTozFywTn?=
 =?us-ascii?Q?83Gi/3eVz09YSH/oYe1FGcThkpd0APwsUzBLHWq8V67sIlv/v4lSs/U6Rb16?=
 =?us-ascii?Q?TMKcURHSc9UWSpPL4TCIVPqzqMie0HqoILoujNyy/3QGN1JebG09O6sNVmne?=
 =?us-ascii?Q?QB8QghoaxIr7cpwo+vP294gclZEVizlbJY6WkqJtyDmXzhfLXqHkS0W3wbrY?=
 =?us-ascii?Q?ymClQAWQXZKxh32kHctBIMLyZ7wteAnElU58bpakiU9u4GXlh+j2yOqSRMWr?=
 =?us-ascii?Q?ghRfBFLSZisl8WzHibGeZ+wifgOkyF3X/sIe59ntIB6U8CWNnk+r+d2Q4Tsj?=
 =?us-ascii?Q?kveDV6qD41iBiKjYw/VkIp8qorhGFan6GSMTOlI6J8E1LtEAkYy5P5ZU3cCi?=
 =?us-ascii?Q?RysEWKxH3Bt8Pk1OTOPsoXL/8haEQuH2ab/Nehr3P7LCLWuQGndi1xvLFTE6?=
 =?us-ascii?Q?f4ZuFqitBzlWlAzt34YF9TckmpWZ7hqW83gP+WN8uoMdi0uTJN2KuS8NS/Er?=
 =?us-ascii?Q?DbpQ+BNR9NV6h+PYfRhd+GOnDrxC0sHlO9OTPoWEVKrOPPQmFfXO8cl1slFw?=
 =?us-ascii?Q?9qcZrUQvEZOKgf48BPNI0vodA4ANHT9g3igiDiuCZxX6pe/djBEvd5ApKIMg?=
 =?us-ascii?Q?fSmt4sHJoboDXsOYaEkzHtWijzfue3KFNPDYRc+y6RQpF+IUson8FErMAmFV?=
 =?us-ascii?Q?PQzSqemlcI4I7adHGRL04a1uVJRcQG2XSn/0zZLgHg5qlhMQyBo2pd9TIr0F?=
 =?us-ascii?Q?JtQ9+gnxbkQpfMK0wH2ro8ozN9VWFPcspsH7B8shcpbSjTlEerHkjjnoSx6n?=
 =?us-ascii?Q?v/997WQ3YjrxXiL20sfklA/BALRMA4X/JLQ+3MnSJJ8V+kqSg7ByyYxHFOct?=
 =?us-ascii?Q?3HcpDZOAkyWL4KFxA8axEBcPllPBTctaN1gqvVMY+lwdWKSSZe7WQ98uXvuk?=
 =?us-ascii?Q?UA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xDV6kfW/831eOLAcWpueGQkMiuNrHiyZyt2IsVyZyuV1xZdq4LKI5xhs9s1QVFP9ZyIgiAxjaTz3ld+aKZ09++L8R7zff8PSCLBSUrCPkXsDEio7urd8/W6cu1f/73JdyM9o4G1B/xh7U6MZOYDAYvj3kXwQeX2VW9aS4pn4PvgiKtAt8nKzWwtNK5s08xOuEcrtYwggAGkS/+pkRCKWLU0CaQYNfytv24IC570qSf3SW94WrDS2u2H22sNwj/gbnhVcZ41Zd7pmCRRWwnfrf3efRSZprTH9HeclKowdiD/ATLioPGkJSKIk65tULfZKeNupHZCmaH5h2ZFIsiBL5X5SkteozM8zdIotvgRPs3o/M7N37n7n6V3kAu1NmriMbB8sy4XSVFbVC/Ymel03s+8CbxvGnWKckdha1DGoPlRXjjdGYfYJaNIcrNlFPcdiO4bC+Bw+TI6pGz+qmasOTvg85pPysk2lHyxLGxY66ifBM9B5xp8IxElGJLDbYSw9kIzwk42YPXWyxkaYkdeq1UzAWJ9idAPynb137BhwF56j1Z6E6J2+By1ehScia3FRoMxUvx/KgdE79pknibakDqYOj5C+vRK1Z4T9SOLpCkI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad90aa5-82db-4852-06a8-08dcf531a108
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 20:14:28.5474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSJt9qg99gLk9NE8/VH6kZa5Bx9T2NCQtNxOshfkGhCqXQDWYJ4cWjeeN5uGEDjI0j3lWtz2TL0mRc2bkwfgW3HOC3MFKbVvrSanOVRXI88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4869
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410250155
X-Proofpoint-GUID: 9XV9CFMBvi6WEcwEQ0VKybGbReFzz6hH
X-Proofpoint-ORIG-GUID: 9XV9CFMBvi6WEcwEQ0VKybGbReFzz6hH

On Fri, Oct 25, 2024 at 03:57:17PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> An underlying probe could support all sorts of overlying probes:
>   - pid entry
>   - pid return
>   - pid offset
>   - USDT
>   - USDT is-enabled
> 
> The overlying probes belonging to an underlying probe match the
> underlying probe -- except possibly in pid.  So, an underlying
> probe loops over its overlying probes, looking for a pid match.
> 
> The trampoline would look for only one match.
> 
> However, more than one overlying probe might match.  Therefore,
> change the loop to keep going even after a match has been found.
> 
> Incidentally, it is actually only pid offset probes that could
> "collide" with any other overlying probes for a given pid:
> 
> -)  pid return probes are implemented with uretprobes
>     and so cannot "collide" with any other probes
> 
> -)  no two USDT probes -- is-enabled or not -- can map
>     to the same underlying probe for any pid
> 
> -)  no USDT probe -- is-enabled or not -- can map to
>     to the same underlying probe as a pid entry
> 
> So, possibly one could optimize the trampoline -- e.g., by adding
> BPF code to exit once two matches have been made.
> 
> Note that the flag we pass in to dt_cg_tramp_copy_args_from_regs()
> should depend on whether the overlying probe is a pid or USDT probe.
> We used to check PP_IS_FUNCALL, but the upp could be for both.  So
> check the provider for the overlying probe instead.  (A later patch
> will move USDT probes to a different mechanism anyhow.)
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c          |  43 ++++------
>  test/unittest/pid/tst.entry_off0.sh | 125 ++++++++++++++++++++++++++++
>  2 files changed, 143 insertions(+), 25 deletions(-)
>  create mode 100755 test/unittest/pid/tst.entry_off0.sh
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index e0d7da00b..85e309915 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -754,38 +754,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 *				//     (%r7 = dctx->mst)
>  	 *				//     (%r8 = dctx->ctx)
>  	 */
> -
>  	dt_cg_tramp_copy_regs(pcb);
> -	if (upp->flags & PP_IS_RETURN)
> -		dt_cg_tramp_copy_rval_from_regs(pcb);
> -	else
> -		dt_cg_tramp_copy_args_from_regs(pcb,
> -						!(upp->flags & PP_IS_FUNCALL));
>  
>  	/*
> -	 * Retrieve the PID of the process that caused the probe to fire.
> +	 * Hold the PID of the process that caused the probe to fire in %r6.
>  	 */
>  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
>  	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> +	emit(dlp,  BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
>  
>  	/*
> -	 * Generate a composite conditional clause:
> -	 *
> -	 *	if (pid == PID1) {
> -	 *		dctx->mst->prid = PRID1;
> -	 *		< any number of clause calls >
> -	 *		goto exit;
> -	 *	} else if (pid == PID2) {
> -	 *		dctx->mst->prid = PRID2;
> -	 *		< any number of clause calls >
> -	 *		goto exit;
> -	 *	} else if (pid == ...) {
> -	 *		< ... >
> -	 *	}
> +	 * Loop over overlying probes, calling clauses for those that match:
>  	 *
> -	 * It is valid and safe to use %r0 to hold the pid value because there
> -	 * are no assignments to %r0 possible in between the conditional
> -	 * statements.
> +	 *	for overlying probes (that match except possibly for pid)
> +	 *		if (pid matches) {
> +	 *			dctx->mst->prid = PRID1;
> +	 *			< any number of clause calls >
> +	 *		}
>  	 */
>  	for (pop = dt_list_next(&upp->probes); pop != NULL;
>  	     pop = dt_list_next(pop)) {
> @@ -800,14 +785,22 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
>  		assert(idp != NULL);
>  
> +		/*
> +		 * Populate probe arguments.
> +		 */
> +		if (upp->flags & PP_IS_RETURN)
> +			dt_cg_tramp_copy_rval_from_regs(pcb);
> +		else
> +			dt_cg_tramp_copy_args_from_regs(pcb,
> +			    prp->prov->impl == &dt_pid ? 1 : 0);
> +
>  		/*
>  		 * Check whether this pid-provider probe serves the current
>  		 * process, and emit a sequence of clauses for it when it does.
>  		 */
> -		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
> +		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6, pid, lbl_next));
>  		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
>  		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
> -		emit(dlp,  BPF_JUMP(lbl_exit));
>  		emitl(dlp, lbl_next,
>  			   BPF_NOP());
>  	}
> diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> new file mode 100755
> index 000000000..f1a75b6ae
> --- /dev/null
> +++ b/test/unittest/pid/tst.entry_off0.sh
> @@ -0,0 +1,125 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +
> +dtrace=$1
> +
> +trig=`pwd`/test/triggers/ustack-tst-basic
> +
> +DIRNAME="$tmpdir/enter_off0.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Run DTrace, dumping all probe functions and names, plus PC, in a.out.
> +
> +$dtrace $dt_flags -c $trig -n '
> +pid$target:a.out::
> +{
> +	@[probefunc, probename, uregs[R_PC]] = count();
> +}
> +
> +profile:::tick-1s
> +{
> +	exit(0);
> +}' > D.out
> +if [ $? -ne 0 ]; then
> +	echo ERROR: dtrace
> +	cat D.out
> +	exit 1
> +fi
> +
> +# Generate the expected list of functions for our trigger program.
> +
> +echo main > expected.tmp
> +echo mycallee >> expected.tmp
> +for x in 0 1 2 3 4 5 6 7 8 9 \
> +         a b c d e f g h i j k l m n o p q r s t u v w x y z \
> +         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
> +    echo myfunc_$x >> expected.tmp
> +done
> +sort expected.tmp > expected.txt
> +
> +# Check output for probe name "0" or "entry".
> +
> +awk '$2 == "0" || $2 == "entry"' D.out | awk '
> +{
> +	fun = $1;
> +	prb = $2;
> +	PC = $3;
> +	cnt = $4;
> +}
> +
> +# Check that the count is 1.
> +cnt != 1 {
> +	print "ERROR: count is not 1";
> +	print;
> +	exit(1);
> +}
> +
> +# Check that we have not gotten the same (fun,prb) already.
> +prb == "0" && fun in PC0 {
> +	print "ERROR: already have offset 0 for this func";
> +	print;
> +	exit(1);
> +}
> +prb == "entry" && fun in PCentry {
> +	print "ERROR: already have entry for this func";
> +	print;
> +	exit(1);
> +}
> +
> +# Record the PC.
> +prb ==   "0"   { PC0[fun] = PC; }
> +prb == "entry" { PCentry[fun] = PC; }
> +
> +# Do final matchup.
> +END {
> +	# Walk functions for the offset-0 probes.
> +	for (fun in PC0) {
> +		# Make sure each offset-0 probe has a matching entry probe.
> +		if (!(fun in PCentry)) {
> +			print "ERROR: func", fun, "has offset-0 but no entry";
> +			exit(1);
> +		}
> +
> +		# Make sure the matching probes report the same PC.
> +		if (PC0[fun] != PCentry[fun]) {
> +			print "ERROR: func", fun, "has mismatching PCs for offset-0 and entry:", PC0[fun], PCentry[fun];
> +			exit(1);
> +		}
> +
> +		# Dump the function name and delete these entries.
> +		print fun;
> +		delete PC0[fun];
> +		delete PCentry[fun];
> +	}
> +
> +	# Check if there are any leftover entry probes.
> +	for (fun in PCentry) {
> +		print "ERROR: func", fun, "has entry but no offset-0";
> +		exit(1);
> +	}
> +}
> +' | sort > awk.out
> +
> +# Report any problems.
> +
> +if ! diff -q awk.out expected.txt; then
> +	echo ERROR: diff failure
> +	echo ==== function list
> +	cat awk.out
> +	echo ==== expected function list
> +	cat expected.txt
> +	echo ==== diff
> +	diff awk.out expected.txt
> +	echo ==== DTrace output
> +	cat D.out
> +	exit 1
> +fi
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
