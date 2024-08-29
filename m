Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620F3446A2
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909182; cv=fail; b=uIUSQcI0JcLBX65GXCqMyW97AugLYoAwHwBNphtZH/bTtA4sBwvrigBiUw52BVIHH6dSX0wcMnIVQW35zLWJuc9ev7tvdnJbKsUdz6UvazAyT8/vqZghOiJl7yVCw1fIyBatmKvd+0QdfHhIDgLmbU5+4OcGlk2a87D39vA8yHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909182; c=relaxed/simple;
	bh=JfYpA2EXsXnSw1i4U5TsVgsZtSHRYv9HJPZqkQSvXC8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kmxEfLvwdSo3opmY/ReVyXigLVCWB3AJc3LUjMzznHkn8x3ziT8fwUHu/f6Hu5WOQdv4BOTimd115EdzJ9PRkX9fjYPeyF9jGwT54p7v4XUgSgJF2m7JCGp0pHkISyU5wcGqpFSVQ0lwFTCvp70+RLLXb+f7kP8cONcMBmNQZDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lZdXV40V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=l177KxnZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lZdXV40V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="l177KxnZ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fZq8005683
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=e6i7liw2Cyjs49
	LGTqFQedYa1SgbRHOU8oNbS4O1tVc=; b=lZdXV40V7n5DlKysP/mQG70Z+rak0y
	wLsn1Zs7TQkUdOR1mKV6xQaLFhJVIPf4Wv63seuCg3B7IYJFAinKrl/N5lagQm4z
	O5dRN7N3uy+Sbg9z393kv8gXxY+I/bjvim+1Qn6nBis5zmUFz5PfpviW2w5FWUvQ
	2GFPCTWzx7CGoQDtyCjjzg43NO9dpiq7QbULxUThLDGHxdvanTZCnSOX75LLaGSZ
	uUd0o0z7V/v+kzkOEZVfmfJqsv8xMHr2baoedlaUkyYLZv6SzKD7yeIWLkg/V2Yo
	oigioFnPXqTpiuj5H0ahxfNKqHv/5IYFWdZjypZlis1jk5/UhB5zB60Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu9ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3s1wJ031752
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w8511-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/oSYBybZY4PWxOpw6JfADRmtj7Q3CKS/j0kztnFYY+HijH8zzVesp3y3PGFRaUjwNX3SZML3R2Cq936qsUypGarhP3eR6P0Nj3nBkjfkcESxnQlAAEoNr9ZKkhECYg+AUsmXZA3e7OgP/p2VAoWFI6WKPRTRNIctKOzjHeSRvd8rIH0zQUwB1M4VcNs31kfOLmY9+Gsmt6nKUTPRTpI/L5cGx+WhehwoUECj/SxU1zvu1+6u9jrbJm8BFaAYA56Qiw26Q05et2r54Az0pTpYqzX+YVMOIzHbPQWmx6gRj2nwZzJMhTkapAM6aHo7954fMOsTk/b02XWiPBwiMAMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e6i7liw2Cyjs49LGTqFQedYa1SgbRHOU8oNbS4O1tVc=;
 b=v3m22AeFFF3upZ5j6rlIajLvSVw10hrsDAdgECqbshEqRQhgi1tOpzlvRn0oYzhPANWYfTZDit1l+ScXCh6kY1wnjrVZMsgXpwYWcGvc4WiWRthKe9HFa2pHQZ8Ve4W1RUMJWp3QYxcM5geY2yzbeKeZT9G1vR9p6ijDmslaW/nHTR3HAn4UZ9NbxiMfKME3N89fBfQXzqdTsqtxwAeg78+UCZJO430XMakvHY06XpzsGEkA65Kp6vFGVCwPVN5qZ81K9theHRjj4LBid7DhYzb+r+Raznwxi38eBKSK+ef6PkGJx1iKUeZIDVFdtv+m4atT6II4dRbDDaYNh2uplQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e6i7liw2Cyjs49LGTqFQedYa1SgbRHOU8oNbS4O1tVc=;
 b=l177KxnZuxSI/yXjDjLt9pHSlmlk9ZlyDRp1Vd9RiHdPmvnYdzNBIaCbwBI6oUPs1c5bSI6uMAmp9ty7fUZdaPjJJaYq8gd0pGCLd5DFrRGvHrNLONuU3W96Wt6FQJzodkpP+hLQwQLJVO9nf2CrcOYZiu/DUzlY60KAxbnk8Es=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:26:16 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/19] Eliminate dt_pdesc
Date: Thu, 29 Aug 2024 01:25:43 -0400
Message-Id: <20240829052558.3525-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::19) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: a192a08d-825a-464e-49da-08dcc7eb1ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vSXEcO1w13fEFbh7LrrNMEXJ5rNY4lb+UrD08CosQNbuvmBsvMxdi9MZ7Px7?=
 =?us-ascii?Q?G2DGBiSR8zDAInjsRP7eEyaw3eJx1ZiKn3T4sr+kJKAjSQcRRbgMvm68Uf3D?=
 =?us-ascii?Q?s90DrNqhO26JMlgJprXOs8xIoWBwshU4sn8qUUcC399967+NrDFD93QmYIBO?=
 =?us-ascii?Q?9N1ytRxiiZuiaeVUiKtCQDAE2Vd6+ccmu9nNwl4KTc5z71QDo/2tIEoVb/UF?=
 =?us-ascii?Q?ATQk2Z+julmS5ivVJdp/3CEf9GktBDcvRs6e5lx2y9p+idepxdt3BK8mB14b?=
 =?us-ascii?Q?EY+kGWnm67uIR6Kt14EFMCl1UaYsWvFkVtv+fwiJF5yTrT+LrZU0X7kAnbyP?=
 =?us-ascii?Q?xm4HRF3WMg4UUzOtjmrvtVt+Va0cyUlDGIManah6Od+lN2COZbgkOOMy3ftq?=
 =?us-ascii?Q?uhIguma1L5gquj3VsQ5INnLfikvW6WL7MPXeFuFmqM/lcTWEGvQzos8jUuQk?=
 =?us-ascii?Q?VntxVPwqNpGzwmI6Y5t1iHv89B0S7sT2a8b+25JObnpZ50u42d34exry6BaB?=
 =?us-ascii?Q?xBYee3jcDUAIm//snMfRUTpHtyvES/V8n48s9nczEAxwIWZ58dCxo/Qr5mXp?=
 =?us-ascii?Q?R+oS1UExxrsz45bA+Mc4KTJbGwR3Lq1O6NNMrA3tf8qSazTBjUHfnCDMUYVr?=
 =?us-ascii?Q?ffHiyc7lx17d2stGGHR0hz27/sUJ25KKCncgnsIbUqODp19WDB4h7E/4jXjy?=
 =?us-ascii?Q?gSWmZsz8Vfgldv/drWRiWKMEIASdzhkJCbysLnAn3a2ppY/Bxc38wPWhi3+P?=
 =?us-ascii?Q?j2wKAj4KA7ylemKhLiGNr/PFay560jAimw18gAQTvFLwulNFRu3McnKvFhTB?=
 =?us-ascii?Q?X3ipoC4kqLz3XRj1Hnq0gIsuq2XjIWqqOH+81THLbiStaUApotkvfNFZT+ta?=
 =?us-ascii?Q?DaMg10mqsxrlLu+jtGf16Ft+3nqJg8mcXx7m3pa8jwSqhu5cgZzuqZWFt7hM?=
 =?us-ascii?Q?BGldbf4WicmfSSdV0HvWbiKZwFyg/UlApsdOuigIiYkspH09DV5P713gj6Pt?=
 =?us-ascii?Q?WhDjSB3TJBMLcqo+4zainPIWHMjplArx+kMoQTsYfUnBdnH6MZLwzNtFGI6I?=
 =?us-ascii?Q?oyqEE2d+Nnzje4Us4/NVt+m8QnSdqbLce+sIN+SL5UQkVeqnnv8444CNkDLd?=
 =?us-ascii?Q?pXDOcndOqt+goWwql87VelCav0ahDapB2BZO4mHBTeaAGqjY1l86H6DuygbC?=
 =?us-ascii?Q?2RcQxXJ8Q+98bqk6Jqh550dD7YQLSyu7Y9sF+ZN5gLbtG3dAj3Tj5JuK7iKr?=
 =?us-ascii?Q?eBCXimRDCDRsBpyafN2eDXf9L4964KiFQbnpTDJMdFcWSojPg6ZRyMRwbK5o?=
 =?us-ascii?Q?ZdEVS3OFDbLgN+5eif+v5r2Na4nVhEgzX3Z3+Gzio+q2Eg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VdSRWnpXRv4CXMg5o+Yxqui4NwR95Am4zEkU1aOYHiR3G4pm2EpKhS19VS7Q?=
 =?us-ascii?Q?6Te4K/t7oQQ+juIkbhTiK1o1TeYWp0fxmU8Nbj7xWrbAfNYyY00Sn5xjWcEN?=
 =?us-ascii?Q?YKCsiGijfC9kOrK+QuLOBbUWx1TIozv87sE6GpDhIgK5qgX8p/4CvxOEUNHy?=
 =?us-ascii?Q?5feb0T5+C5994MdP4BYXaAeTEVyyL0vRciBeSIbL4qFF0gJT/f4ihFxynhVP?=
 =?us-ascii?Q?Gz4j378p0Lla27SA/J2o/I++wlKghp/8W228sx1L5+bMz6N7Ca7Q3sDdmGVh?=
 =?us-ascii?Q?tWqyw4AQ1k7n+IJpudz2B3Qs/Iv/K3eHkp1H7+MH+C5rpj+unGjTEexTXrJ9?=
 =?us-ascii?Q?hDbvU3U4qRXGA8vbf6d/wYsYFZy7HTomnxGDlQ54lWSom+ST5ehUdfV3LNtf?=
 =?us-ascii?Q?i35Q8Jflo7d7WSjdKKyO5v8Ig/q7sxBhZVtvT7GCG4Fhw7/nO1es9mifAuuW?=
 =?us-ascii?Q?veOXn+6fby0IPBl2IdJwZHHQER0VivN+DOVudjq+m16Is4r900bkr02GP1sl?=
 =?us-ascii?Q?I9QGUri9hibLl3CDcNGP3Kg9PQSEIMy0K1b6XDBaqpyOQHaHV17z4ullxPkk?=
 =?us-ascii?Q?CSsUWFfdyESoj+reGmoKqB9uQK8hmVDuskHnv5gubo4HVJxjfwG7IvhfSPWI?=
 =?us-ascii?Q?UFYksniHgrSt8fUWQji4POTqDt0N8ndi6R6gBWNUqyh94E/mTp9pA+ODHb5C?=
 =?us-ascii?Q?L64aTllGaqAqVqeWWQnpWEiDWjfCfAqO1WsNmwTeUnwnSZgHspsWcu/yE9dS?=
 =?us-ascii?Q?dSZMhq3f8JVIAM9Vn8CaRdL3NB90aEyoCi01mcFqnN+anB1F9wX6eOQ9pgMk?=
 =?us-ascii?Q?W0gTfmcuju2vH2OEkAQC9EcsAP+vLATVVybdi1r+fyyfQaRsllEH2qXDOsbY?=
 =?us-ascii?Q?u8W+gK03kgVdi3fCxt8BVZKczRJkn2MZhxTibuNu/9xawLjCCD/dzvVwXDVJ?=
 =?us-ascii?Q?LzpgPK2Ksl05/VMUSTJasUluM+r0J3/LTGVsk2cLhlO/BVFAbL7t88zEPwZ6?=
 =?us-ascii?Q?7/6wfgnxiICHdW+IuDK6+2FMuICJABjClHaEjCrYkIjFFpiXdGaSuUsYSNSt?=
 =?us-ascii?Q?PjPuCEAQWllg5M74McQ26vu7b35FKMby0w3GlG2eN9eBbspDCKxRWZ4CIsMi?=
 =?us-ascii?Q?sJpRl+C5Zye+MoGHK5oQ+Rvp63NRmQJ5t8/LTWC6fujGlKIs9qmAXz7c6tkh?=
 =?us-ascii?Q?gY3tsbz8vzjOnJOebogO3mZ8M3JB9rqbPhgxCHpW4FkP4yaY4KDRxafJdvAS?=
 =?us-ascii?Q?2Pew6bzah1KmAMnOpzK+haVIwy5gowiqd2MLp1x/i6rg6/Ltbnk5K52zxBaU?=
 =?us-ascii?Q?5qIjqThm2VGrQ/dnTWaFQ9/uQlUrdKnurI64rzTbIHEtrC3aBBh9EmJFTd4O?=
 =?us-ascii?Q?B5RwcJH+SKdWBmYZErS0r6EEPcr2QSTqtfKavSqj8gWKHlDWiIwuNgD/u7yi?=
 =?us-ascii?Q?FrgU8VY+bp0vXv/S9Jl0O64vlk3vMIZycM4plhc/Og9gLz7zhvvB+nzmci0N?=
 =?us-ascii?Q?aKkKB2ee0y59mIiTBRx7uw8tENIU89iWLH06fRpnvIbcj9tAk9mhQKJyGBDN?=
 =?us-ascii?Q?pYZY8OQ4mRqCb3+OCYfYNGrZUdpe8Xwdti81MXjS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oA3dDpNTPPtDZD95qzyxWO/huGDsmANjXx1ObjwpBDPfLsu8Cs4nuTR7sgT0CkNNkcpVNKtXXZjPAWtflfUPWmtVNfolRKSN7gZpw2CBtjmlWGMGWa18WdB2P2Df1bNJpuCQigyn6k/vFub56YUFHP4Iave3o3bLitdFmVgwxu7wmmE86jHVLlQVMH72ndiwDpucKascLz5tvFxSIjWufPY7NqPYUbNQQ3PJ8yFngWLJCrOYM57Sia6mhdqbbcXZHAdhJQNtpeiUytohbQfqRk4vQddHLEoLJ28tvkMTYKSlwGqmjCeJiG5T9cm+CuN9RRirsjMTC4bqCkzUx8OWceLIrW1J/cnts6iD8eHLau7eu/r+uJWFhag/Aoajze6N51bmVyxh3AqSZOjaQJLvrfM/fMTIEke+pKrYWRY0MGHygRKE9gKUIJYfDfnF04925MtZ9RsoYhaxiC1voS8z3NUuTZTkVAyItsEq/N/D6RubmKTG1IfXEHhYsHF72KZqUadr5ZiJMGU6zTlJft+vfOU/8A2QV0ThPndGu9YXLFqKygDxDLyCh2lYTKt3S0Fi0u5QuUodhEYM63er4eaZzlhG1B2xgRqvM+ESIdO/cHM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a192a08d-825a-464e-49da-08dcc7eb1ada
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:16.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +jODOJub4tXVfT/Hz/Dm9djBfGP22xWadgv13SDHvF5ezwnhuRk8C9ZajBMYUIHtVuzh8FkoKNEKsz/geQNnFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: GUtQ3trNBtK48_rKer6Urd1zHFp7YmGD
X-Proofpoint-GUID: GUtQ3trNBtK48_rKer6Urd1zHFp7YmGD

From: Eugene Loh <eugene.loh@oracle.com>

The probe descriptions dt_pdesc are superfluous and are
eliminated here.

Consequently, we also no longer need the last args to
    dt_epid_add()
    dt_epid_lookup()

Nor so we need to track prid in dt_link_construct().

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cc.c      |  8 +-------
 libdtrace/dt_consume.c |  3 +--
 libdtrace/dt_handle.c  |  2 +-
 libdtrace/dt_impl.h    |  7 ++-----
 libdtrace/dt_map.c     | 33 ++++++---------------------------
 5 files changed, 11 insertions(+), 42 deletions(-)

diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index cf3c5504..e66d76fb 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -959,7 +959,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 	uint_t			len = sdp->dtdo_brelen;
 	const dof_relodesc_t	*rp = sdp->dtdo_breltab;
 	dof_relodesc_t		*nrp = &dp->dtdo_breltab[rc];
-	dtrace_id_t		prid = prp->desc->id;
 	int			no_deps = 0;
 
 	if (idp != NULL) {
@@ -1197,11 +1196,6 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			case DT_CONST_STACK_SKIP:
 				nrp->dofr_data = prp->prov->impl->stack_skip;
 				continue;
-			default:
-				/* probe name -> value is probe id */
-				if (strchr(idp->di_name, ':') != NULL)
-					prid = rp->dofr_data;
-				continue;
 			}
 
 			continue;
@@ -1218,7 +1212,7 @@ dt_link_construct(dtrace_hdl_t *dtp, const dt_probe_t *prp, dtrace_difo_t *dp,
 			if (rdp == NULL)
 				return -1;
 			if (rdp->dtdo_ddesc != NULL) {
-				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc, prid);
+				nepid = dt_epid_add(dtp, rdp->dtdo_ddesc);
 				clid++;
 			} else
 				nepid = 0;
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index e3ce2d3b..88083b19 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -2211,8 +2211,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 	pdat->dtpda_epid = epid;
 	pdat->dtpda_data = data;
 
-	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc,
-					 &pdat->dtpda_pdesc);
+	rval = dt_epid_lookup(dtp, epid, &pdat->dtpda_ddesc);
 	if (rval != 0)
 		return dt_set_errno(dtp, EDT_BADEPID);
 	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
index b1ba5f9f..79ecbac8 100644
--- a/libdtrace/dt_handle.c
+++ b/libdtrace/dt_handle.c
@@ -150,7 +150,7 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	 */
 	epid = DT_REC(uint64_t, 0);
 
-	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
+	if (dt_epid_lookup(dtp, epid, &errdd) != 0)
 		return dt_set_errno(dtp, EDT_BADERROR);
 	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
 	err.dteda_ddesc = errdd;
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index a2ae84f6..c2b18b0b 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -345,7 +345,6 @@ struct dtrace_hdl {
 	dtrace_epid_t dt_nextepid; /* next enabled probe ID to assign */
 	size_t dt_maxprobe;	/* max enabled probe ID */
 	dtrace_datadesc_t **dt_ddesc; /* probe data descriptions */
-	dtrace_probedesc_t **dt_pdesc; /* probe descriptions for enabled prbs */
 	size_t dt_maxagg;	/* max aggregation ID */
 	dtrace_aggdesc_t **dt_adesc; /* aggregation descriptions */
 	struct dt_aggregate *dt_aggregate; /* aggregate */
@@ -774,10 +773,8 @@ extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
 extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
 extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
 extern int dt_datadesc_finalize(dtrace_hdl_t *, dtrace_datadesc_t *);
-extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *,
-				 dtrace_id_t);
-extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **,
-			  dtrace_probedesc_t **);
+extern dtrace_epid_t dt_epid_add(dtrace_hdl_t *, dtrace_datadesc_t *);
+extern int dt_epid_lookup(dtrace_hdl_t *, dtrace_epid_t, dtrace_datadesc_t **);
 extern void dt_epid_destroy(dtrace_hdl_t *);
 typedef void (*dt_cg_gap_f)(dt_pcb_t *, int);
 extern uint32_t dt_rec_add(dtrace_hdl_t *, dt_cg_gap_f, dtrace_actkind_t,
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index 87ce5707..9011da5d 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -92,7 +92,7 @@ dt_datadesc_finalize(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
  * description.
  */
 dtrace_epid_t
-dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
+dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp)
 {
 	dtrace_id_t	max = dtp->dt_maxprobe;
 	dtrace_epid_t	epid;
@@ -101,27 +101,19 @@ dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
 	if (epid >= max || dtp->dt_ddesc == NULL) {
 		dtrace_id_t		nmax = max ? (max << 1) : 2;
 		dtrace_datadesc_t	**nddesc;
-		dtrace_probedesc_t	**npdesc;
 
 		nddesc = dt_calloc(dtp, nmax, sizeof(void *));
-		npdesc = dt_calloc(dtp, nmax, sizeof(void *));
-		if (nddesc == NULL || npdesc == NULL) {
-			dt_free(dtp, nddesc);
-			dt_free(dtp, npdesc);
+		if (nddesc == NULL)
 			return dt_set_errno(dtp, EDT_NOMEM);
-		}
 
 		if (dtp->dt_ddesc != NULL) {
 			size_t	osize = max * sizeof(void *);
 
 			memcpy(nddesc, dtp->dt_ddesc, osize);
 			dt_free(dtp, dtp->dt_ddesc);
-			memcpy(npdesc, dtp->dt_pdesc, osize);
-			dt_free(dtp, dtp->dt_pdesc);
 		}
 
 		dtp->dt_ddesc = nddesc;
-		dtp->dt_pdesc = npdesc;
 		dtp->dt_maxprobe = nmax;
 	}
 
@@ -129,14 +121,12 @@ dt_epid_add(dtrace_hdl_t *dtp, dtrace_datadesc_t *ddp, dtrace_id_t prid)
 		return epid;
 
 	dtp->dt_ddesc[epid] = dt_datadesc_hold(ddp);
-	dtp->dt_pdesc[epid] = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
 
 	return epid;
 }
 
 int
-dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
-	       dtrace_probedesc_t **pdp)
+dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp)
 {
 	/* Remove the PRID portion of the EPID. */
 	epid &= 0xffffffff;
@@ -146,7 +136,6 @@ dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
 
 	dtrace_difo_t *rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[epid]->dtsd_clause);
 	*ddp = dt_datadesc_hold(rdp->dtdo_ddesc);             // FIXME what releases the hold?
-	*pdp = dtp->dt_pdesc[epid];
 
 	return (*ddp == NULL) ? -1 : 0;
 }
@@ -156,26 +145,16 @@ dt_epid_destroy(dtrace_hdl_t *dtp)
 {
 	size_t i;
 
-	assert((dtp->dt_pdesc != NULL && dtp->dt_ddesc != NULL &&
-	    dtp->dt_maxprobe > 0) || (dtp->dt_pdesc == NULL &&
-	    dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
-
-	if (dtp->dt_pdesc == NULL)
-		return;
+	assert((dtp->dt_ddesc != NULL && dtp->dt_maxprobe > 0) ||
+	       (dtp->dt_ddesc == NULL && dtp->dt_maxprobe == 0));
 
 	for (i = 0; i < dtp->dt_maxprobe; i++) {
-		if (dtp->dt_ddesc[i] == NULL) {
-			assert(dtp->dt_pdesc[i] == NULL);
+		if (dtp->dt_ddesc[i] == NULL)
 			continue;
-		}
 
 		dt_datadesc_release(dtp, dtp->dt_ddesc[i]);
-		assert(dtp->dt_pdesc[i] != NULL);
 	}
 
-	free(dtp->dt_pdesc);
-	dtp->dt_pdesc = NULL;
-
 	free(dtp->dt_ddesc);
 	dtp->dt_ddesc = NULL;
 	dtp->dt_nextepid = 0;
-- 
2.43.5

