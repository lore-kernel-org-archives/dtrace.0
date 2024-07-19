Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7970159168
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721421797; cv=fail; b=u0PR/iSj40PrQADb4GuL90DMNhQOxOc5EULWcpEyEEimdznGzK3Oy8S4Tqjp2j9LGQudEsfON1rcVBkGwJoPANxCRW00ukyvC+UFgFFKGukLbQKIIOZ1r7M9kNgpDMrUZUiCZhklPECPrAjGcktapuwz6dzZg+32jgvsQxqHv5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721421797; c=relaxed/simple;
	bh=mDeQR5/sAR6fNtkTunkiTzBpd7zWhnC9bkyMvfmCKb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KCCR0xy6B8aBMmiL44pi0r5qO1WrEHUUwf+UeoysSE94EvzX+aL9kmubXHp7NKODZMRWb7rc6+EtWGld8MJJkKrY6zSD8D21gGZFKOFcEzKNDiX0TL2oOudHwQxv2Zo/78FdVwgtsLOM/1xqs+mrBo2gyBMYwwCiDWUZSe8wtjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ki6oAFzY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dk3rMuoz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ki6oAFzY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dk3rMuoz"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JKe2dk014110
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=tyrHxAXSHx09lU8
	noPmeGoxpepJo89hJBxosW86zj1Q=; b=ki6oAFzYXVkoV38mwIcJKELjwZJEro5
	c9eIiZ8y28diJnxe79KwNIck7z1blrBqNPYPYbfrXEqUzv4kmfOdtRviyTR57PiT
	Dp48J3D26rOXgZt6dPBMWTnXPQOKZ9vDednKJxtEpEQBP74HWBSIgqekqI2e5Plw
	nfiNfPMPrMxbgQva3ED4IgOpoSOKjsfkTV/B7PvXK3ULF1LpoXVLBuzzVvwGxIxG
	d7VVqAZ73cl7ijksB0t9OkDnwjwUXxeW6PhZyBVL9+JVfEOIWK56t+KKp8OYsv6N
	KAwXsLkTPZtjZNUzfLGwpFFLq7+RDZaiJRUfaQ5xPQJHdQRRYEwedTw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fycq0071-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:43:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JJ0SOj006959
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:39:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf1pkvh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 20:39:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOexxO95TGHRG/0jgPBqOqAEeP64Ef8xqGeh7jLAMd2aquQeJVU/dUpvDb7nqV4xHNadu72Luua8jEkScBQg7gYz7q4RfSdYFkbIUaIE6A0jJRcKHzefpW1MCtxJPBjhudCozMVJTVXUriun6P8CTZenRIpwftu3GQ5HEIctFtZKd9xoQIxLXAevaSMxSCWN2yu6zGBD+uZAVMVqres2Zo/NzrLxs9SV6D3AjhM2UYR72bOPw88KXGSESDNtpI1wmG4KWSY20atVx0x7LXa/RybUe0cCMQ877oFmpjerzZ0KTE53MDStY3gjCZbHMd7Ix0qcmpQKcnMa0VQ4wN1HdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tyrHxAXSHx09lU8noPmeGoxpepJo89hJBxosW86zj1Q=;
 b=tw2ohltygBa3u+JiSdMTHC6hj1dBWkN31pxOIuO2hpee3xuegl+gOcziPqYBy/OgD7PtDM8M5MzdqPZfzdr3uxN/lfQeaqNu8Bz1sSXrt0ePBigGJn+wLm/ZGCAwTfh9L5RymHe2B8Pv7ZUYBeANuNuUQLo34wW1QTy6h6AyO5ERXz2yzKzBXkQhGEDTexKLvxBvZ1s7s1vEeR1jt/IjB5jZwg3LVduU1qtmvGKs7HLn9jsnroi77HTPT6IjYUWSMYvbJv0NdeUTVdGvSCvs7+hLC+fp2UEHl0CPnFjkni0YMgxaWbFEhysxFr9YN0p1uO41515UDF87XLlj5CCzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyrHxAXSHx09lU8noPmeGoxpepJo89hJBxosW86zj1Q=;
 b=Dk3rMuoz2lLmpX9a3PQv0PTg8JnF2bjffBBhMhlA/BpHv8OvB1IpdqhCSUh+2JcLMnjXH8Oyurw850xkpcAiIvl1VyPR3lVACo8qEut32OaAXts6LH5A5uRaeqf/6A/9pkv3ZTzcANrf9wtffB0kKG6OnGvcqrpacx2dzkRQMyY=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CY8PR10MB7171.namprd10.prod.outlook.com (2603:10b6:930:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Fri, 19 Jul
 2024 20:39:38 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 20:39:38 +0000
Date: Fri, 19 Jul 2024 16:39:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 21/38] Add some comments
Message-ID: <ZprPBx3piy0tGlLr@oracle.com>
References: <20240627053904.21996-1-eugene.loh@oracle.com>
 <20240627053904.21996-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053904.21996-2-eugene.loh@oracle.com>
X-ClientProxiedBy: MN2PR14CA0014.namprd14.prod.outlook.com
 (2603:10b6:208:23e::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CY8PR10MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7e34fe-5332-4334-147d-08dca832e85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uUINe8UloYmWo+bLoZ7JLKD5Ew0IWL/Lu7ZX1MiqMWss2gulDmGhPRq+6bWx?=
 =?us-ascii?Q?HDxtqCDrFoti0aT9LmdFeDhe0Q+chXHGJzh60tbaJ3QdwkI/pPBUkY2G1OvT?=
 =?us-ascii?Q?j37MN5pJ/dRIYoBakgO26SZQ6aFXsqOQ/HPjT4f/KPA0Jp4FmkYcTS+K7P7D?=
 =?us-ascii?Q?DpEI72FIur9/fT28bzILMA5m8flssUtMc1MQ7smYbab5rJpLIOC5/VxfuBhG?=
 =?us-ascii?Q?qN5DgX29d2v3K6KkN/AqpgcHV5c5olbYM4nYCm2lpGdQkobjSFtzfIwxFxo0?=
 =?us-ascii?Q?kCTuGM6OOdiQ6kfS2fbDDeAC7taj5jSLCfPYtVU8iUKKwUAf/Q8fO0SaXROu?=
 =?us-ascii?Q?gtqpUQA5B6V81e2id/8+ByM502D9Tk7oR7VlZT4N/CW5SF+JVZkwSeBmcZ5m?=
 =?us-ascii?Q?Qm8AEKfgEfPlZf0w8wKxf3ZANOoVmyidhwDo/q0iFvHI2X4SqzA50o3VRrMl?=
 =?us-ascii?Q?YpcyEX0GmSAMJrIZnC2ULdNF8O9eBihDSOP6sMSvLYnBR0FTn1DNhlJjGJ6H?=
 =?us-ascii?Q?DBPb4N45Lj87XZvQn8XkOFDccCYFaXf3/aKNBnmRpRiSSCpAACjXXJA/5WIU?=
 =?us-ascii?Q?nfvwkHqe8hXlNSQuAKeY4oOsayk/Od4jjNbnL93kEY8VNvb7nFiACPRlZmXr?=
 =?us-ascii?Q?WAxLzmQIeD1a1yfCOWbx820IlJp9Z325Qyd3ezgFlkmj4zMhwALWetf0hgni?=
 =?us-ascii?Q?EE/Vm40uepvBd0MWGpq7bDslmNiFEapM27pqPiMAqs36IUrWVtedWtLeq4Fg?=
 =?us-ascii?Q?O1hAePVWad8Gl2L5H1E+haDVrzXRyXnGUb56kmSKkoIY2JLsdIbUTFCf8Buu?=
 =?us-ascii?Q?LmwrKPEGJSlj0QCbmvczh5f3kfXnPEE13SIl18cVljWqTXxHOo3Q3wYzS9Jg?=
 =?us-ascii?Q?Aohsgde9shyYOjdcO58DsmNYxdKYWWjNTuOBtCdnb96ZUimrMTLXswXNXBFT?=
 =?us-ascii?Q?PLrgIjCuGizSpssTkacguwS22WFsJp9fC6SL27UpgWL32ROod8PZ26d9kzVL?=
 =?us-ascii?Q?E2drJgjAb2/KbznTgP8N9rSMXlaISR917keqL4R/hYuuqwL4we71gkz6ttk1?=
 =?us-ascii?Q?RiZ9ggChXwir/72NLQdMDoQ/EboyxgOVnTz1phUtxMBGCPmaxhTNTUKQaGX2?=
 =?us-ascii?Q?gld4k1xQhrWOB7iZrw+HJ6tjV87J5UIYVxHCditFJk6NZqBwNw4b4j0R7pi0?=
 =?us-ascii?Q?eL1y+ZkZnT44qPWb/15yDR651PLVNHNv9u4g61+bVJviDEKdx+1xb6FeAgog?=
 =?us-ascii?Q?iFVIdmnB8onagyZgy9twpWrT0M6W2zlX3ejhyrblfl7+8UulRKtVEfUkLB7h?=
 =?us-ascii?Q?Tl1t5jXNlb1VEGKuBAIJgZ5mlWUBTSKR7p053Vv0kRdibA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WG5Vgn+S82ToRTEcY4rodwMviqG5NG+fUceEBHQGsN/Jov+nnNi0vQEFkdD9?=
 =?us-ascii?Q?RFii5gK3fnGHyKRiLxN10ztlA88oLzLX2VHs3R7Pi2JqhVVWJcOb14Ffd7T3?=
 =?us-ascii?Q?GaS5PcdoJZPHzIWxU8jc+xHaqUKCDiSB+iJgnd68pipp4+vhOvGdu/gHAIWP?=
 =?us-ascii?Q?P3AA0WwMnRKfw7j+bFIHJAuEgwVTs/poTrGYaDXmP9BuFJaGVkPfizpLC+TU?=
 =?us-ascii?Q?hF7c69MHkw8oD2L//G/gXPEI6CgYYxrdrhJibACAUXHbcJQYAgNFAMqVlhn6?=
 =?us-ascii?Q?kBkT9mRahlg2Og9qQ6G5WJmmChcsry05kXPdSvvRUqzVJZ2m584hr8gKRwxi?=
 =?us-ascii?Q?Zr7SUlH2i9pRDzXNx27YjveuXZE3CU86jHyU3iy8qCPNXn8XRUEYrCiM9pIO?=
 =?us-ascii?Q?waVgPz6MMdmXhMCVJheWwgCh4fcVBh29zccExlrjlH6yvTY8Hhi15p8jOL/c?=
 =?us-ascii?Q?3FpYsDyYWNqULYggvIEA+mLQIpYN+FY/9/pkFE+Ovkv99PfoeJvlNXI6oZQn?=
 =?us-ascii?Q?GyqN+4tgyS1w88+awxuw5LxH9MpeoMOj9iE5818PO6kH+c93fNXUdd17dkkd?=
 =?us-ascii?Q?l60dbCH/6f4xzgheZHNDAvx92fKjrGrHjylsoQn6E4rUm1k4/7RMqeq24sZT?=
 =?us-ascii?Q?qRh7Wv0uiSK643iHu+pFhk2Ayno6WRQcoNKt5lZEEMxbOpJ8MsuURtNULGYR?=
 =?us-ascii?Q?zmLO/ywiZJjp2pQ82PR0StcwX/nmshFEhEIA+XMhLHJCT042Z0g4npJRPbl7?=
 =?us-ascii?Q?0/8PQHhbXfcRVO9wwIGBu8/BVVequ7HdUlqElBbRQw/Rxefbr5tZ/EciOIWD?=
 =?us-ascii?Q?avLtmeP8gY4hlTHNssf7DrrYTwmjc/I7TQICi5C092zhc9OfvdCgKxIMMwnz?=
 =?us-ascii?Q?src+SH0GnkPledL0TojDm2wARigrWWFUZQ+y6StkioJd0P+H8oB2aRNvdiv4?=
 =?us-ascii?Q?dXiKav/202dGtTjgsU0F2GhlDpuVg9pp9mLS8+KuwHZNL7nGv0J6+RPkjbln?=
 =?us-ascii?Q?yrzh/Q/oFDsL25khJUnHy8ZGskiGwzJIYlLhd97c+yG6cdHHTFV/tLteiBxY?=
 =?us-ascii?Q?1zzOYYzcrHnZivOhD4i5alAC0F+xKknnmFJWdh36uviHTFvW2Hw68NhG20E8?=
 =?us-ascii?Q?B0agLrzCrEM6lQLLe4M7uJO77ui84y53FkVD4eA721G2aa7XOS/A0RAjma6s?=
 =?us-ascii?Q?/McV2eE6gtp7OZWyAQnyARaDx/88DHHyofV2CFn9rP2OqADccIx34OUV54qq?=
 =?us-ascii?Q?lye2IoHK83IHgsCCjZTjkW8SXOQbKTzb89CvPAq4EbdYVz8Qg93A5ODlM02o?=
 =?us-ascii?Q?adkZptGpmJ72j0SCVE++gpD/nmxHhdvjH+/weHPhMmgBHQyo0pjOLfw5KuOb?=
 =?us-ascii?Q?8Fa0DOL/wthBfVzDvo+PVCtGy46hPJLUGI16mhZ95bNC3byHR2zvsqdxtL0Y?=
 =?us-ascii?Q?+5m3uxhjNrhqtlZ3gWEUtXoe29j5fBooQibpcrDV7n4FtWBXAfKVi2L5DCjt?=
 =?us-ascii?Q?ZJbbGQFVoFPLoX4d4VbyyY5T3jsA8YjndwNoHnMa0VnQldiJ5uspriRqZyCF?=
 =?us-ascii?Q?UZivlrTaU4S12z/NPS5aVerWgfikyr3/SKJd+sk5RZ9Th7vCJYEK0diicBGh?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	YW4Q4l7sSo+bcYXqkGDBlLnpbnZ6+UNVNZaUzrGz06e+hBlIoeP7ncwuNs2cVjOJkzQ5zZZjea4LWNI1G3t3Wa81BUmaSoHQDDypJrInp4vfX+6pyVi5L3akatzYKWVm77p7CML52BHcNPVxQ9/Tt811scIcR+FoIcVIJZvIq5EuHDemqjos/GkuJD200HFB8qgDzVA5q7IwbNg2CK0mjcXCLgyOof4Mh9RGISd354rTEAOofdYIAnVtK5Ge7pZKcaIs8Su/MB/3vCFCWCsTtJ78HfyY9779XBDnyvP9roJLxOdjULoKMi1k69di2Mi8RbWe4AUrVmhtyUsAKByIs5tb9J1X0hh4eKMCO8JXW0SGGdV8P/Ap2QSqzapNjGJ/dYdXaUgZytAjLdfK5+JcvhvbvAIXhIfyC5OYFoww75bGIzLcuu1M27EmR62KyL2ApYil0p2DbTo/l2rFuxpH9VlaVBP6w7X4LpRlmYvmoLsD64HkfFlPdNL4FrlLgN8j/TfIu1b7cFDqqqrGxWHZx9z+NcXccEjKJgUQjyI/3y7VTewy360YVb3vawajjrAGs9i9RWIfL0JrahV6e2kQq3Bd9qdBM9bMmf9hiFWgGlc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7e34fe-5332-4334-147d-08dca832e85d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 20:39:38.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFhwpof3XSFppn/Dv2umJQxArW8zDS7+MJBLYgQjjZx5H+W95q9sE4ByCqU6uGNuKCw2+fjWiEMkTMTAxzRfN7VVlfibwcXk8Dm1UHAX290=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7171
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_08,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190152
X-Proofpoint-GUID: BogaojUh_b2NT9TmYu2ZD6lu46MWSEyx
X-Proofpoint-ORIG-GUID: BogaojUh_b2NT9TmYu2ZD6lu46MWSEyx

On Thu, Jun 27, 2024 at 01:38:47AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... with tiny suggestion below

> ---
>  libdtrace/dt_prov_uprobe.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 5dbd75e3..5f0c56db 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -295,6 +295,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	/* Mark the provider as a PID-based provider. */
>  	pvp->pv_flags |= DT_PROVIDER_PID;
>  
> +	/* Look up or create the underlying probe. */

This seems to contradict the function name.  Perhaps rephrase this to say:
"Create and/or lookup the underlying probe."

>  	uprp = create_underlying(dtp, psp);
>  	if (uprp == NULL)
>  		return -1;
> @@ -302,6 +303,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	upp = uprp->prv_data;
>  	upp->flags |= flags;
>  
> +	/* Look up the overlying probe. */
>  	prp = dt_probe_lookup(dtp, &pd);
>  	if (prp != NULL) {
>  		/*
> -- 
> 2.18.4
> 
