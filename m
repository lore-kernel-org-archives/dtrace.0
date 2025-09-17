Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7DB1A9FAA
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 02:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758077346; cv=fail; b=FBUxdD4krg+IYZ8BBi5A4U2Q2qmRMVs2A3UZfEUHM5DjVa+pnawNQBCC+pzIX+c+3tK2vHJUoVUB+ezOO7kpaUmBsvmhCm4gF11BiT71pDo57a0OqbqjEnMBvVikUZ5JHYTkT2Kr7sQBVtLEZqFOTFsWEmaZHnJ7gwD275lNBZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758077346; c=relaxed/simple;
	bh=GEtZEXanHssh4eyYIRv4vLsz/d2Q+2B/WoVYpu5kHJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WTMLhUDDbpCz8ASgqj5iCVV2KUhlO6uwSGUkclO9IGp8RWyJcrDSVaUaU6Ac6ie5eMGfc2MongjbsN7VRVAjknoug0SiQukwqxHPluF0X03mTugoGF0/ey8+nA0C9Fby9RxBFLMuZj+YehJaMd5IWdwnZ95rv1Cr53QWcans5F8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kG332zW/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0ENHRsCF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kG332zW/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0ENHRsCF"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GLYwoE020120
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 02:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=GNIcX71JNF4QNxTP3A
	aBIyeIjuY4ZlJhuS1Tleavc7w=; b=kG332zW/rLH2Uu7VxYzEzkfpLbXhaIHFPQ
	JI7V06UPmLXnczmuNztJ6hHLD5u0OHb9fYM1VPuNFxOhVexs5GoPkltCHOobF0wm
	eQb74jFP6KBDfJZr/cvgYsdb+pLggYPMBsyBhr5rzxcPBJCBonyTOWFLTSqWc9tu
	dtQghVjlID6BMGX6aDpSoc/wEmWQL9kCLDfNc5YQ2zXQUBOOY9fECak2PPXjrMIb
	8JxJAfsjwAfgmamrZ3eruSFwQKdnCEzVopWTbWMAmaU5VC+ipiFjSaSAxeaqa/zL
	0kLTXUgztUfhD76ntLHP74SGDWekd4uTkk1gO4b5tdnL3ypkzfJg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 497fxbra2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 02:49:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58H0MR49001703
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 02:48:57 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2ddu55-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 17 Sep 2025 02:48:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scTC/5guSpMHA9acMzC67wVPrho9Cbp1FviuJnkU906s+L9N29AIpw5/ueINHZ6Y7k5aeOZdxp/UwBqvi6ES4IJZW+MpoBYqK92UISML5nLCCLWo65BUmS5+DI6JdipxgHZdf71X1VEG56TZYTR+LuKQ7N231h/X6isi1LVrsSnxjdc12asBSl0wIPPYPjpcUnB1gOGotnnbRLPlmqdHfh1V8n/Hr0GnSyqtQ1vpzY6fGEGojlfyfeAiSioaDDtpCfXNKelIHW7GR0BQhPJimEq/TVdug3XLn8UtikrLl/NNJl93JSWlJ5O0qSNkqyLTxND3k2DHbE7kAXpBS/nHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNIcX71JNF4QNxTP3AaBIyeIjuY4ZlJhuS1Tleavc7w=;
 b=stth1loCFjA2YbotiPH89MMsNJprixa7IGZimC8w6FIjyTxyZx7aXcgkqBh82ySDBqsP2qg6eY+b94ox6QLxh607YfJuvnQpLOjizT63YJe5PedeG1/jozcIiuNxwVkeICFztlxg/iSv/O9n+ZUIyVHf1IZOiffDx4kAZTfMNjbiwD7RoRada5Z/dAT1VuIIZAe+20KdazJblq14PR2sEaIkbOr2AtKKU3GoUU3r9icgtRrJqbY985nGyZ391TFMjNb04s2guQ5bL3iumSpB5kHTJbYwwOAcIHY2XMFdZhudd8Okk/DQCkYgmhlNAnwG5wYFMKy1F5xjV5SEUAqe6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNIcX71JNF4QNxTP3AaBIyeIjuY4ZlJhuS1Tleavc7w=;
 b=0ENHRsCFCmyPYqW8IVdkd1K3wt2kQkn7wsoPzn3D+nZVxU/egahn4EMr23jcioxLuAfWXa9x08EgWKxqrzs4nwQDBXuz5g0Qk6xoAHELpiGr2gwCfGiKSvYabo/VGlcRKIsuBoap7muJJArwmo9WESzR5tWo+eZWfn1/ThBpiCo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPF51A640DE3.namprd10.prod.outlook.com (2603:10b6:f:fc00::c26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 02:48:55 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 02:48:55 +0000
Date: Tue, 16 Sep 2025 22:48:52 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Add trigger for more predictable run time
Message-ID: <aMohlKuLsP1+xrEV@oracle.com>
References: <20250916225506.7929-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916225506.7929-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPF51A640DE3:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be6f8e0-7930-4acc-a680-08ddf594be1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qVPI/ATFyu1QYleh3mqKgfgtLb+V3Jz8n8MPxe19i5MVHIOLWHg0gNvhHF8y?=
 =?us-ascii?Q?KLeARMGbGT7E7dM71MtvI+/AdWrZS+xOsvF2dkFY6Dw0D+jSH8mpDAHYUho9?=
 =?us-ascii?Q?WQ8hbyHAaT+amQzX6eAG9n1PG5QEoyXnq20lI9TPgzRV66/1rK24DjPhBXAq?=
 =?us-ascii?Q?PsQZytK12ZscWyV2S35q/GlyA3Hic7PHT/GJSVQ/PhD1dXvEDpGEnrWGYqSM?=
 =?us-ascii?Q?pRHVynMBBiFxOkvA8BEuWU0BnSzRnPwY9cDOzjZOSOM9o442Lt7kB/RIGz2k?=
 =?us-ascii?Q?e/r2Ixeni2yLOih5GFRKiXwbFwKv+xVJzoI3+z0eWWQ6TOydLt0CB5YA1fMK?=
 =?us-ascii?Q?hH/AQMk3/tuHVEH2tCJ47au7Q+82yPJnAPc/5cbWzscaqRHXaLJpa2SJNFTd?=
 =?us-ascii?Q?QdMoCHxCzz622vVDUVLNXe9Hc9ItEcRJavsVc9dudeSWe3iMDDZlI8l+voZW?=
 =?us-ascii?Q?6f9S4N5KcMLpr2Z9QZdhIWP/IAiO3Obei5ussRhRzLtoIYCIZjra+hVOCNig?=
 =?us-ascii?Q?EfUu7xfMWDxIg6E6hLefSBlP0NCYazi9RGUC1Czt3uV3RiiDiZwAww9XCJDG?=
 =?us-ascii?Q?We0lHAihFIa4YXhuXSOVcnRE7QQcuFd712N3s7NcW2QmQpWw+cga3+ZVV6+M?=
 =?us-ascii?Q?ofi23R045LKlJBhQ7rAo247TNlXNRGir+cdVWJWMw+AyqssNzk/3Pd7p5f7a?=
 =?us-ascii?Q?W5FhMH0JDfpYAaYokmMePyhqguRrsh99gdeNLi/HUtce+dS6AgXbnf5qhqh4?=
 =?us-ascii?Q?bKqkInhP7qfRbcjbe3EWxPECEZteoa6cIG5sTKUdF4m0gQDH3kCQdol1qtcs?=
 =?us-ascii?Q?0xm3l66SNBnWw9I4/q+NnvUyFvv6FEatWpp5BsXixfdsPzRSglNZGYQhghcO?=
 =?us-ascii?Q?VTOUWuHAo07XOe1cIB3z8QUr0Uo/yFaoGdPA8gVf3p6g3nVSiYb3YkBdpAQ0?=
 =?us-ascii?Q?uoSuzmlILciXzg/CeTlKmI+8tn7YebwkOIZhiT/Iqgd2BIViwLN4hczcAzpm?=
 =?us-ascii?Q?DBHACdr2nduQvMFwn/WKlG1HRORq9AmnToBagSNGv7sk8C3WwCtSDjAKjKpz?=
 =?us-ascii?Q?jaYnlyzsfjQs1HF15Op0mg0Hh9p+J/a3938+3IVatVC/A+FoVSupdZHbYPAC?=
 =?us-ascii?Q?VK8M0anWioV+iziNpizTKhrgRJvLCVBzKTjzOoAnsMOJ0ABFDWwadnsaQeI3?=
 =?us-ascii?Q?+1XVOsm+VaqSeTec+zNZutCYhFtKbFRrDHi6/NXNiA2pRFW0ZELOusJFqhVd?=
 =?us-ascii?Q?DKWINxocW9+IDoyRvjcp3zRHu5jcdumPYURBrTiA+f7BFd68tnlA1jyCRvvL?=
 =?us-ascii?Q?qtrvmS+9XXKkIgImNPNta4H3BpW/B67SZaRU8pRMnSS9rAE3BRSyJv/TFjbT?=
 =?us-ascii?Q?FwUUYUbEvMFm7NQjE4i49aK64eI10K9qWsr/9w4imET1Rhjx75t11OBvPS2Z?=
 =?us-ascii?Q?/bdI5YTDPJA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?foMHy6/col1e0kjeq8MZAyhGD8YYNhwIrY3mT7KPgy+ERi3ejPrJ6PY+5bQm?=
 =?us-ascii?Q?UHBEGwwPuhk6ckjGMcZyMx2/8Q/92i+i1a91o0rd7DfWGbfdEOYQoZXshEyv?=
 =?us-ascii?Q?rKTLnvZjCJZWxnmV0vH1f1d/d7RLmTqajh/tuQOA+YlfyFnMpetettzqHCXL?=
 =?us-ascii?Q?r9+zPBL7QkECRhipZaQNz1RV8QuKSXncsqi0I5PgUCg0X6E7H04r1NsLVExS?=
 =?us-ascii?Q?G4EfqDwnzisWFnfkSxN5E3FkxLZa9DAWd0mxMtFd+EkypNQQucctFdmZzXao?=
 =?us-ascii?Q?ln3JTJ3yzf9/jnHbqU8sPB1lgMXq3WcRLU1NUJ3vLlFAzOczG8rnN/zcRX0I?=
 =?us-ascii?Q?D7QD82D110xRh6dlxfVcZbHMZ0r9iXkNpNCAk5/zetFfB2aySCUbOD0YeLTC?=
 =?us-ascii?Q?7p5KrGicyKar0Dn/ie7xK2lbK9/NDT2VS7GAUNH3iZAxgnwopl1qFYvSZWOq?=
 =?us-ascii?Q?w3I5lE0vQ1kDKs9GD3KPUiOE1OREQu88n1J2bK6U5giFO3DTH5eGB/yHSlPt?=
 =?us-ascii?Q?bS0GyeBPaRGT5MyBDFIq2H6O5dCwEPmWb8jLSrumU4Czn7PDNmFmPaih5wz2?=
 =?us-ascii?Q?GDVefom6dASWWsquDmiK+wPReSqdC0vZDk81cKVnuhJw30V/rpPP7K4fyD2A?=
 =?us-ascii?Q?dkwyEnHEfZudymoonM03yeNWr3i0yTly49j7yxJ6VC/8w+ZvSukJeQc9dMsO?=
 =?us-ascii?Q?vgV1g9Uy+I7o7WogHTjPItt9CTZIqvOFvOTEY3lC4KGXfeCULxWBKQdTbWD/?=
 =?us-ascii?Q?1LOnxb8ggnSlUNVawLKzB7TifE0IT1Wyyq1fBjyhowGzgRbyg/mu5ksS2Fku?=
 =?us-ascii?Q?GuedEd5/M97KUVnH7BVIA7HPNEW3aVTNf2z6ihw7R1emDxQHTkpmMeJVdHI9?=
 =?us-ascii?Q?5sxJSGjPzLWzWWpaX+cD+ytZvAmRfCZPKTFGuhqkIefaAfG+Hoe6kVmQni1t?=
 =?us-ascii?Q?MH3Dp2IqcmDoQ0uDX9Sq3ljGHXIDgQNnjH2DH/AVMxpHoaGtlSUbi12wssoB?=
 =?us-ascii?Q?yVQWIPqK9ruh1AapHIQ7hliOnKeszidkbBi65LNqMoQ8rWxDNmuVWfDnobnv?=
 =?us-ascii?Q?FBWyuGsRQ63yRv0ct2K5Ceqww1NrBwEEgeSKUsOJ/v5qPQGV6hkbB6mpFWWH?=
 =?us-ascii?Q?pbEIwBZ2cU3SVvSdzUDXPGBqdoHqowRkVyvlZ9JzaHzQDevYGQFP3Gqpq4Oh?=
 =?us-ascii?Q?/iy8QdiZySBmWTaKVcnvVXyGTqG0xXc3NrBDemX+RiQteLCxs8h+CI3Cq1b3?=
 =?us-ascii?Q?3G7b0OU52fvexbQ3f2M1wVn7199nNLllRUy/QEHOXl7FyIy98HCW+Qbxx1G5?=
 =?us-ascii?Q?1FCmLPhJ19SicvA19xpx6N2xZD183qKfsQs5fYfnYA3JKXsLGDuOkj2UwCSs?=
 =?us-ascii?Q?LgDajVDf38+Sjw+8JUr8RhdIrgXewh5z7ChhRDQp92bf13ns0vUrLJV33gZ5?=
 =?us-ascii?Q?51hwr77lvaCYUAA3c5IKQKWqbA+AVPbFbVkA4itHIs7B05IBNEE1Uhr7KOnC?=
 =?us-ascii?Q?txCVfs84fK6UlVkgdh4uFcg02rCWwOPNPBaLrapmTTSnY92xuoKfGCQvW8dg?=
 =?us-ascii?Q?adq9cjxQNB6p5DADcHhFdkZobMDvmbACPbUGRHt3OU26J1dGbH+QbV6eRvLe?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/sDWbX/BrtfRzYHPNrBpKO5srSg5BvxX9ax3xpvwbDp5TvGZBoJRFr8PLTdx+g0snC4YNYdTXroSrQArC6vFlTTQGRSOGOTfWHx1LfrMUpB1tbuENAX7aD8wN1YfQxPw9SR+1N6FG1NHoQ/RdkfXEJV/lKGWkcr/L6RMJ/7lxI+Ed1O1qt1Kv7/FEhgJ3MYgu1cLnYt9qUz1xPgipzNgEFVCrUD/gTkg8Nb7SSCLJdk35RsOFUzvLbispQwCFu4aGrmqRTB6u1beeRlS6z5mzQm/ks3Lf61bY4XMMadI+PCdquoGz4/UtEcwpLQIUuZY9Tb8AzN8gxbyz3WcBzVLAJtoJvDyMXbaiputIKnGxnPfsticGI5CNJPiHnV4OaDdbcaWCC8QWqKYd4Ij6buvS2foGwmsOdsB2Qh6CWWAAm0pLLd/1xP9C1xK2b/PyDdU8PwNz511cGeh8l3+WEd7kKGpdPExvEJCC93XZROzGDksVos4Rjmz4BaodI5zQYzC+oOsbFJnh+zhBv7kBsbge3kZ95Q/31DZR5d9eoj+rJGHI1G6TUH5BC7ViFINqHMJTt8OO9BZ9X/EzEiHKFzOApcHxIwe/X3czAu7dDgqcoM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be6f8e0-7930-4acc-a680-08ddf594be1c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 02:48:55.2230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQxiPt2u2k7FviuEMGtXdvqE7fgIUS5gMjx+RwwmA3zLmeKELFJSJREIoIAvgAdwKgm4v95Z4+wlHSjOI4CnoUxkdMx77JMkkf4YNovEeug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF51A640DE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509170026
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX4TB++NOpPwbp
 uc+qB8ErMOjG+6th1k+i6L/6Dh/Tc3uASg7pgHCTxjBSpaA6un2Yc1fF9kWz4qT/1JaaTEQkvPG
 7y/49uW0ESOis0Th2b1ifFlyuJTeEEidipdQELdt/SAJuY+7D2E8mloB/c05wbyWSp2ufbUu8Hq
 CNJ79k5xKS48cqADCZhhch5213MFQDmx7cQeS4RKlclSDpkA42iwEsuoRb8pR93/4l3KUQnNppF
 dWCyNzLEbGzedHhLMIwdng0Plk2GOCsIO54KmDyGj+0mqc4uTZ6Ax4/VoDpcq4V/dIt/tIg0yZL
 ZiLHwMeAuGOjoJN90YZ6i0p5GOldZFsTzl9vhuWhwoqlnEFa9BRKihbn1utOhikAedKQRJEyY1o
 Ern+qoRe
X-Authority-Analysis: v=2.4 cv=X5RSKHTe c=1 sm=1 tr=0 ts=68ca219f cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=OVTcFlQqaWuKfpIeGt4A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: EdBeWmtP2uNeYTnbQI3TjATBVMG6DCDN
X-Proofpoint-ORIG-GUID: EdBeWmtP2uNeYTnbQI3TjATBVMG6DCDN

On Tue, Sep 16, 2025 at 06:55:06PM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The test had no trigger and so waited haphazardly for the write:entry
> probe to fire.  This typically worked, but led to variable run times
> and even, though rarely, a test timeout and failure.
> 
> Add a trigger for more reproducible and typically shorter run times.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/error/tst.argv-corruption-by-error.d | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
> index 6fd1834e1..1fdd89858 100644
> --- a/test/unittest/error/tst.argv-corruption-by-error.d
> +++ b/test/unittest/error/tst.argv-corruption-by-error.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -13,6 +13,7 @@
>   *
>   * SECTION: dtrace Provider
>   */
> +/* @@trigger: periodic_output */
>  
>  #pragma D option quiet
>  
> -- 
> 2.47.3
> 
