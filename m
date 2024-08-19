Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4007415A865
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110493; cv=fail; b=cPNXeyIHlfl6dakEQUxK0egC+z2lF0BiDAPMFRVW3VW9Z90vCIrZch1Gy5Jwti+4aMXa6EZ+uf1ecoAtSITtTzlwLAJmNqODqLzxqGDKwfwuA1paAea+aFoagQUerjE+AyzpPIPEZ7fnFvnlGkLFh8Y+rSgALtvdGNvYMSxT2/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110493; c=relaxed/simple;
	bh=h1OrgVwMouJ7ez5CCMOFquxkjjAhmIrkN7tGrUj4Mzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Em35WpggN6LnVbfZVF+bvOc1tQ7YzbDrzQRbodiGOvn0g58nJIU2I5vCgLQ9pyWiOZtb0FZ5Gx1mW4hYjM6DQ6uz2e1OQ2fT7CmTuJko3UYQfVciBAbbux9nVkAbr9fMLJyCBLxyWza8m8tD7bCD/EfPmMUwnvmYH1Ybkgh3Qw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PEY/fTwB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=swySmejf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PEY/fTwB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="swySmejf"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JLKLpu001731
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=9wUDNg/e72763qG
	RB+hTBJftyL1qJydj3/EzgmmuOyk=; b=PEY/fTwBRRRTQhRYx/KMiK3Owx5OgAU
	OIyEcLeBxRBR5tBeq0vZZuvncLynNHVMZ8IB+nILPPGL9i9tIPL0zszmx+lVFf02
	VT0wX3+rRDzi1mLV7AlavpxkwG80akYxI3sh+MwzheYdplwOCHwF2pmeHtJaoubU
	bO0cLwtjcUw/lPtKfHmMrfCuh7NQHO9XTUCs+y3Ex3bvIj1MLyRv4rdtKi1XXF6Q
	ahCG+M4SyZiBJPpwDErCSrSZYIkMImeM59Ir/SqUbd7nBE/vOthp3kf2VMmowoZC
	Ci6ry/cWylTO6YivmTb79tdLA03AaHapNScObHXRUEL8pxuAv3GDwjw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m67bs4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JMYxWY033184
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 414eyehb71-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 19 Aug 2024 23:34:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOPJeyHv93NcnMCr92klO7PIiNmt2iBpGB3BZKRraIuQ7OU38WBh8RMPjV17G3LPaca12lSp7MU57NhKi06Qd8r8YI34bmUVXX3r+zS0cY3zbL95Ik1H+Lo3q5jn6sq+J2QsuxxPU0cGd60qeWQivFNxcMsRFxHPXI0PUzHEvpi7iNNGrdM1DrvFqKAThCCiEHpFEWj8NA3JSlOvaQhPu0E6s24m4/VPVzaYfY11aoqgCLG5p88G1+UZs+Pg7GG4XIELViT6JK24Q1Yqzugnaz9c9Maej+G4vAJZq19Iq3I8N1da9FKbtklWtrgAnhtCAxm08Ke24XDrKznoVPHDlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wUDNg/e72763qGRB+hTBJftyL1qJydj3/EzgmmuOyk=;
 b=t5M+4D97yMq8+mtRG1rr3ALGo2ror/6VgU2irhClA9Oj1MSZ2PiuqUkEb5mtBEoXpaJM8qKQINucvuhQAAw3Z4X5fIKDdQejdSNYDtA/y/G9rlkO1SmzHxko4UKaJCD7rckMME5XmPUlbbZzmDQ/U2YWBiWSX3r8/PXyW/fXRW3l34N+3VbeKB91vgZUcvU1tmRSE6Ob88gMG1+cfa9SOKrQmhCThwHvb96u5/JgcuViB3BnkLMlRRYpm48LDZa0ECDFAztxvmiZQkVQRlNt0mSbBX1Pg5DALBdWWLCUHMypGxTn42GysZi35oz5rQ+h3+gnoRkvAc3+dsE+PiYxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wUDNg/e72763qGRB+hTBJftyL1qJydj3/EzgmmuOyk=;
 b=swySmejfxhS1vqMU1U4xfJKY0i3TKO+YEy293KubJdITgjdInHARAurNyP2Ub8UDHaP1k1LNVmrWX6S+d4IuBrDByZFeOjr8nPodebvUEIouGnfWjNKM/inJFs0yw8HpDOO1Fcx+22XvC92YxT903SAGEJrbJNOtKs9lZ1B52HI=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by SJ0PR10MB4446.namprd10.prod.outlook.com (2603:10b6:a03:2d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Mon, 19 Aug
 2024 23:34:45 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Mon, 19 Aug 2024
 23:34:45 +0000
Date: Mon, 19 Aug 2024 19:34:42 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 7/8] Clean up double semicolons
Message-ID: <ZsPWkjbYS6DsLjtm@oracle.com>
References: <20240604180008.11331-1-eugene.loh@oracle.com>
 <20240604180008.11331-7-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604180008.11331-7-eugene.loh@oracle.com>
X-ClientProxiedBy: BL0PR1501CA0017.namprd15.prod.outlook.com
 (2603:10b6:207:17::30) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|SJ0PR10MB4446:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7f7a9f-ec44-4774-24da-08dcc0a781ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Judl8cpMCZ+kLxhtPxkfC2gKDujfA75Utve/VdzoQuSvgNt7B/Rwbn7Y3/S?=
 =?us-ascii?Q?DQhqh9ej+ObQVXFCk+xBFGhxrzUQaT2fnJK0l3QVYualm9s4R7uAa2YWpIQm?=
 =?us-ascii?Q?L24owVX0Tm0CbnXlsGB5FKYWczvXc5M1Z2fts+7zFEUwGjjjfZLF+QnliCnR?=
 =?us-ascii?Q?Gv9scaEyZLlLlIx5d2rXKh1towHv0jiBWGPjU+GZxdsnREs/x8cXHyZNx5Uv?=
 =?us-ascii?Q?I/yl3VK5BuvZdAZwFWL8SvOMMvU1SckCmmeFKfHmTYS3qmPRDtNt0+tiRVug?=
 =?us-ascii?Q?qZU+TKrLAOH2kQOiv2xBEme9LCMoQhYysJgG+MzrPjpN0E9TGK1SWKei7zDn?=
 =?us-ascii?Q?LnitUbuTlombkmLnTQv0qbcr1gLBM9ykfoRkZBi9cLvXBMY80NyF8cchd8cv?=
 =?us-ascii?Q?sdgVree2cOqWNrkloZFuCQOoIgmqZgseKHvSWL/0TAchSuzXi/yOm70bezxJ?=
 =?us-ascii?Q?9JWCtDqDDNdXwAptrrGFKsnf5yOd+Yf+uzOyIprygblbWuUXRU28WhNxTfRL?=
 =?us-ascii?Q?bjlnJ5ZHFCzGPd0cWWBST0tSzzbozFtnXPL5jnG8VRHS4KWzwcXoql6eAZjA?=
 =?us-ascii?Q?VQdv2F2Mrr8lxduwHL47PNUDYtFZaMuBq5yXBZhGYo1LY74TAf9DQLNoD4iG?=
 =?us-ascii?Q?y8dewTbUqvJl4+ntk0S3cY2qn7eWAtn71xSXO9d0gZRjNkdKXifUWp3aQGNX?=
 =?us-ascii?Q?H4PGB1TzTeJv4yDSwG3ETjwJg7GDCTxsw/w8ze9BJvU8EOxALpiDKx8NgqEQ?=
 =?us-ascii?Q?koc9AZy6Ayn2Alto5EpCDgM++xeNaFl1nSu9Wdv0Wr3r4jo/7ejs25GU6tW5?=
 =?us-ascii?Q?MIEcVyL2MXxJe8Y05IKM//GFjZYMHK6NOtBzQUaZpwY43wCvrqvFUU1PMKQK?=
 =?us-ascii?Q?71I6rklfl0P7COE+TdpCHb3g3cHjIdYdexASqMfDc1+OW8ZuIeW90r96XNzA?=
 =?us-ascii?Q?V/PEObyEn+/80KDCKpk9ThIqoT1qvgNvjwMiDAifvyDAzjL3lQHy/rYki1+X?=
 =?us-ascii?Q?4Q/+UoHCNkx5mrTnwEQzfUuV3to/GwoDGLsnjP3Pgpsp4Mp3Sx+cHRoMFY9f?=
 =?us-ascii?Q?AgXY93EiOZcirVj3OrTI1jMinPyDMF9PQ9McW7FiseIEhf0CfwW3m5TFs8kL?=
 =?us-ascii?Q?MUi3UOKwVz+0oayGTb/mKF99WutHb3bvPsc7EPuuPl805x38kMLoi/YroWii?=
 =?us-ascii?Q?CLSVOkF3KjfunmgnjN9tkcr6p1m77zYbyymCYeIc5nmyUegK22iL7upIpuew?=
 =?us-ascii?Q?Kl8NmCJBD6sqwI6gElN4L9Y9Cj+szhI2cw9FGnyXqzVzwtWLqW3XXRlJAoyY?=
 =?us-ascii?Q?yr4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HYL7dLgIK/gdZRIW0jozPMGXr8H4HpdmUwjku8+XxxGONx7rPNpEkhV0CWeB?=
 =?us-ascii?Q?v+r2GsNXQLyeHfh3N33ryaz11d91Wd/TeCa8xqY7nucmy8nsJXe+EZnUmgFE?=
 =?us-ascii?Q?PJGl2SJobatZsPgMr0AriU/mP2uMqwl9Md175TepTKrag6C/wk2/TYDC2/T5?=
 =?us-ascii?Q?/ZCRAP063qeYEW0YFocSocuwmfeum3BMKipJlp9lmo6Or6XSc4WvXc9LcyRD?=
 =?us-ascii?Q?f48XRCOp2AAJ1IwjtaFhHrrjhgjLLmbSOQXb2RuiEhkiWrmH0W/KhMC41pti?=
 =?us-ascii?Q?QHDEusaLg/h4bW1YgQ629w4tUgzD3QB6W7mPaiPZRiDgOW0p457gHpseYjr2?=
 =?us-ascii?Q?IRi5SblKqOTVyGB8ifSN+B/9dSDqqs/b/p/HQL6AkKSomwicRh69QmxrWvAd?=
 =?us-ascii?Q?BJUvxaLHfhbmMSX9KNn8/chzTGPQglvzOJ0zc297r5WUM2yYH376Tq5jPpXM?=
 =?us-ascii?Q?11Ki5tafOEaYW0kJp+z/dWw3TruEPkXkKKnB6yCWVM3MrdVpa00CTlN4wlAG?=
 =?us-ascii?Q?1JtgxYLYJ/oJhRN7UVlx5QWKMLyhRcdO1Guro2zLeJzbJpm6JJ90TmTb6Ks8?=
 =?us-ascii?Q?veDYI3K1cXw431fEyjCzJdc3vXdBQ8VkanjSQQ6xqePMrLnU1wNklRJZC/rz?=
 =?us-ascii?Q?W272h2hEX5RAARDFek6oqgiFAK4jPVnFt0sOxhh8DkTYmOw7jDprIdGzQnco?=
 =?us-ascii?Q?HWCbMwxAIkA1bWCN1gn5bjdAWvWqLNVVLW7YIosq7EY9UfTmPf7PRs1+RXvE?=
 =?us-ascii?Q?Ai7W3nZ4ViJZo7LyuSF8+G7cKIUUDIr/W3Mc8set3CgpD6tznN9w0dFrMHo/?=
 =?us-ascii?Q?oxO9NTYOIOC9LdGllOZzsMR50/s9IGrbu0fA6JpOc0wUdlJDjcj44/Fo7Y2v?=
 =?us-ascii?Q?QGTlCO3VkcaYNFCelCeeEvXDQkItdaKZDwyBQz04nEbavsh4aPJkeyWPAmX4?=
 =?us-ascii?Q?H9fn1/itbmQAF+H1ql1dMNE436sbo3UOu5uPROeGYnHS+oFw50VVbunkU1ih?=
 =?us-ascii?Q?UTXMv9DwvRA27En5LwC5CUi3+ALaP7481p9/Hn2Z675SF/dwKUgbxx6XOl/k?=
 =?us-ascii?Q?GrzLOx0nT4Cnw7Fre2NAkIi4wWOYo7hhEhnKoJsypcU77Ph6WmLxYPfuFmLj?=
 =?us-ascii?Q?8L4IxORFGrBYnM7UDpzZJWlW5qIMjv/p8W+PnzFJjzmdr5daht/vzKGtkW7c?=
 =?us-ascii?Q?Qt8Wv4NhiOA9yaMq05yrpCSkuDQNIwrpc4iR1J6UW4IJzy7G8EY4ID+WrEhQ?=
 =?us-ascii?Q?A++hqAxdibyJGjFv6A7rOtN0CtHLK9TfeGylMNo7/Bn99z50qZhiBoO4lKnv?=
 =?us-ascii?Q?NqxEFpZEn/VqTjxx1BPHqVC1OYuANBUFRBDdOCEPoFMzGlc/qM6qMbiSmglP?=
 =?us-ascii?Q?lWoqW7z5cyYTNTWw2TO4/g/NQcjTmwoCEyRes9A3EVgjhdXa8IUskN67Cjcg?=
 =?us-ascii?Q?Xn7oJbt7SKdhA6dDMh/jA7ojt36rCcL6ukWe8FygjsUfeg8CXD56uqWW9eW/?=
 =?us-ascii?Q?rfHF3QVC5M4tMuv59Zc18vBYtV631jOZlD2vR/WsFrzGWv2ZgI5MKj469137?=
 =?us-ascii?Q?NinFYQdDbiQPqZFHDHeB5YfC/qe2l9qQAjOx9kh5vAKookjzn0bhEAaVzyAN?=
 =?us-ascii?Q?5A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	O74JRgDQDPywNvNxiuywT70hCEDH1D8mBvYvXJ8yEqdfzNxYQStsYoZVRRcX6LokyHvcLvskgPQDEwAYKbJbR9Gxq2+tpjZJSUYbxUVyWOE8K6/MUWrgH8/VM0lXRySCPO9PeIID++MP2cvj2OyqYNY/2M0ytAfAR8EvnRPYVvUo0u1ScRSyaaPxjy7Z38OS3tvgpJrRB8fU2A1rHC2+N7g9bdDKk8yEwZesZMFD77TZ+IO+7zBI1hMuMe7/IKZFsTgfXPzNBf1puGcaqoOvAjgLwoNRnOY2IF8dkmSbb+E8YQ0NJJySeQIBa0pRUlaEjz6HW963tmEUuTvUote60FlEbgiyekJ9nNZ8mMI3KSloYibbw3pFT59IMw0kZb9cmb4XXXCKKg/AqSVBTbMRLK/ucRgAGMXDpp+5KYbp8yGQwQDaf7g/gCSEmeJp/ZgeBcmI0dyRcDDsY2uG2SrtCQB0OxexFIG7MUejFVjusckA5WYrYTnC+UsB2RxjYIokxMR40UmB2jgU4JDEl58T7/KUpNESnMtQAvMuYdGhHV/N5Sj1NDv9wiMrRbUCbbPWvT3YF6uTDpkoldhvghZvqMZXlz2ik1Op07scNCrYi2I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7f7a9f-ec44-4774-24da-08dcc0a781ff
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 23:34:45.4004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0sHABmWSE9CrMqpxXscJZOzXOrw+vju7Q4xpyr4prAaaQDaCCYiIZYTNQFXZVOppIl0LOshfzBjLBXSu/auflZScijePqkazsK+aTbDtl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4446
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 mlxscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190158
X-Proofpoint-ORIG-GUID: -U148snY7r7NqXl3EiQjWcpVBgHjCHTs
X-Proofpoint-GUID: -U148snY7r7NqXl3EiQjWcpVBgHjCHTs

On Tue, Jun 04, 2024 at 02:00:07PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dtprobed.c          | 2 +-
>  libdtrace/dt_cg.c            | 2 +-
>  libdtrace/dt_probe.c         | 4 ++--
>  libdtrace/dt_prov_fbt.c      | 2 +-
>  libdtrace/dt_prov_lockstat.c | 4 ++--
>  libdtrace/dt_prov_profile.c  | 2 +-
>  6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index bbdde35e..fdcdee14 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -516,7 +516,7 @@ helper_ioctl(fuse_req_t req, int cmd, void *arg,
>  		gen = dof_stash_remove(pid, (uintptr_t) arg);
>  		fuse_reply_ioctl(req, gen, NULL, 0);
>  		return;
> -	default: errmsg = "invalid ioctl";;
> +	default: errmsg = "invalid ioctl";
>  		fuse_log(FUSE_LOG_WARNING, "%i: dtprobed: %s %x\n",
>  			 pid, errmsg, cmd);
>  		goto fuse_err;
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index fc2cebf0..e166d2d8 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -6562,7 +6562,7 @@ dt_cg_subr_inet_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
>  {
>  	dt_node_t	*af = dnp->dn_args;
>  	dt_node_t	*addr = af->dn_list;
> -	dt_node_t	*tnp, *cnp, *lnp, *rnp, *anp, *xnp;;
> +	dt_node_t	*tnp, *cnp, *lnp, *rnp, *anp, *xnp;
>  	dt_idsig_t	*isp;
>  	dt_decl_t	*ddp;
>  
> diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> index 4f8730b9..e1099d75 100644
> --- a/libdtrace/dt_probe.c
> +++ b/libdtrace/dt_probe.c
> @@ -1345,7 +1345,7 @@ dt_probe_add_clause(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_ident_t *idp)
>  {
>  	dt_probe_clause_t	*pcp;
>  
> -	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));;
> +	pcp = dt_zalloc(dtp, sizeof(dt_probe_clause_t));
>  	if (pcp == NULL)
>  		return dt_set_errno(dtp, EDT_NOMEM);
>  
> @@ -1395,7 +1395,7 @@ dt_probe_add_dependent(dtrace_hdl_t *dtp, dt_probe_t *prp, dt_probe_t *dprp)
>  			return 0;
>  	}
>  
> -	pdp = dt_zalloc(dtp, sizeof(dt_probe_dependent_t));;
> +	pdp = dt_zalloc(dtp, sizeof(dt_probe_dependent_t));
>  	if (pdp == NULL)
>  		return dt_set_errno(dtp, EDT_NOMEM);
>  
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index fa888ed8..f9d81d9a 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -367,7 +367,7 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  			       EVENTSFS, FBT_GROUP_DATA, prp->desc->fun) + 1;
>  		fn = dt_alloc(dtp, len);
>  		if (fn == NULL)
> -			return -ENOENT;;
> +			return -ENOENT;
>  
>  		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
>  			 FBT_GROUP_DATA, prp->desc->fun);
> diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
> index e98287ca..c73edf9b 100644
> --- a/libdtrace/dt_prov_lockstat.c
> +++ b/libdtrace/dt_prov_lockstat.c
> @@ -288,7 +288,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  			return 1;
>  		} else {
>  			int	kind = 1;	/* reader (default) */
> -			uint_t	lbl_reset = dt_irlist_label(dlp);;
> +			uint_t	lbl_reset = dt_irlist_label(dlp);
>  
>  			if (strstr(uprp->desc->fun, "_write_") != NULL)
>  				kind = 0;	/* writer */
> @@ -337,7 +337,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  			copy_lockaddr_into_cpuinfo(dlp, 0);
>  			return 1;
>  		} else {
> -			uint_t	lbl_reset = dt_irlist_label(dlp);;
> +			uint_t	lbl_reset = dt_irlist_label(dlp);
>  
>  			if (strstr(uprp->desc->fun, "_trylock") != NULL) {
>  				/* The return value (arg1) must be 1. */
> diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
> index 86fc03cb..bc224348 100644
> --- a/libdtrace/dt_prov_profile.c
> +++ b/libdtrace/dt_prov_profile.c
> @@ -261,7 +261,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
>  {
>  	profile_probe_t		*pp = prp->prv_data;
>  	struct perf_event_attr	attr;
> -	int			i, nattach = 0;;
> +	int			i, nattach = 0;
>  	int			cnt = FDS_CNT(pp->kind);
>  
>  	memset(&attr, 0, sizeof(attr));
> -- 
> 2.18.4
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
