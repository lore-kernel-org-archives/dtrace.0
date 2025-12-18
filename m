Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC33A1E66
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766089219; cv=fail; b=ChnrvBBaMC2yT7oT6uvn4y0JC4v6FcBRNsGKwCTnAzAk0s7eM+IUQ0OijUsgdAbr82MRd3nuEpW+wEYMe9DX7glQuxHGc5FUh5g3I3F6nYvguDOoqO2X48uTqyLfHLRy/T76jcp3kq+r7/wklM20N/YVYWTY3ukcSCJ13ajxmhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766089219; c=relaxed/simple;
	bh=jI2bG3e4m4GPi+we+kVzbQ4xwC53ZSpKU6k3qThbdqY=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=fm+jOeKZiSH3iGL/d8rDpn7NfHSVDM04fMFuY+UY4xuKVypEqLQXf7dhzu+F91zGoeStH3czLRFivyfp0OKvzUqLIyW9zP7uiLS5DqsVDo8RqiBRc4FHFkTpEEbNz8UwDnJ/0jIgmS7sI2olusctzMcL3JiFDyqwdK7Z8KSvi3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hG3LCtYH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N0xO21hs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hG3LCtYH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N0xO21hs"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIJkQ1u1641500
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=A+mOSIbhHtYt6lDsk75eAZfj68qpNOAIrJv6r9A8clA=; b=
	hG3LCtYHQv80ZsDVr3h90mFn4pl1KlDUuTzs83seP1FZGPoCb1T7ze44qNeSmS98
	UsmbDYAp7COMpiBs+Q26l/qddjPZM+fhCgR7ZFwHpMExk71jmRggPo/w5G0yc7q+
	8mqHOvTSJgFCLGPId2b+G7S1r9c6TovJ86goEmyi/lF2JKnpNoJHH469gOI+WYY8
	PQT0zTOK3Zwx7ddw2mhCkSHvGn9gF0XIpf0pS8XcLQnWma11jfxwOUl/7n2kH2G4
	x/wFCxgKyHMVGly9+0dwooE+J8lukIX4woWI8dciVXYt21Ag4kgSenVvNJOyBNQo
	VDHjqIxg5x12WCsrTdDCPw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2901p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIJTnuw036904
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:15 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtkhxas-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Dec 2025 20:20:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mslEGY9XlYQe0nOpfR0nhFSWNyAPT11NDiUzsdAfGoIRiED7R6yUWZMJBtHtQs+HdOCCZTpye+QXHm+BxlwJngxgOcpCxYKZM3nik8k+qaYP8s2rIffHcZ7GFlDcop8ILV++/PHgMfyy1IhqVunQUxcq/Rjbf29wvYpCShNImvQOYQWZ+8OmUcfmsQSpTzz4dvcPxmteQHbnkYLGd7dy7XCLroc7iu8bqRIqY+4P+et9jUsJjuksEczZyxzN3nR+QwDX01Q7IIoNHFGIfZac4KT5tx80fE9LXvfr0c0ReVyBteW3f6tYX8wrxJUCGjxn1yLe9YOveFG3XNKp+Wdc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+mOSIbhHtYt6lDsk75eAZfj68qpNOAIrJv6r9A8clA=;
 b=FtN967das48GxYYcqVAfngWf+BVtikQZYuJ5UepXRGhXtd3gUBfb0Vc+N8xfPxH05HYhtUjRBnlXTVqkUF60fpFosJnur7vIB1mJpEcarUDdS9wncQJXHkrsPclFpK/Gd8PksGh4iIXvQxAI6oaJB0DcZLpA69Kx071QIBP25e0OVo1gLJ7eUmLrAN+UV4wP0UaK91wkLzplq9C8RTd0YnzobtIzvArL9kmIgE+MHJ69H1EI0vFbMKUQBhoeXQ4M3rfSIHLdE2EiDkLou+DjBFahhEFfRLmnaoTl0fJJiPnv4jmPduTyZ6XDQZx9Beb9QYnQWrvBvYpyHHVVRJVvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+mOSIbhHtYt6lDsk75eAZfj68qpNOAIrJv6r9A8clA=;
 b=N0xO21hs9YkSfK7eqqbIMekfjATiM6i9e8COc9EZKPfdq8jDPZPzbj9yvOrPo7wA9P0nMMLfWm3+QMv+Ok/WTm386qB/OMwdDr++VUQeeaY4V+fPxOOttsr0hPJ5v0ZxizcUdxByK7/aQxVb4G3p0icH8HHjWT6SlvdC6hl4wcs=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:20:12 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:20:12 +0000
Date: Thu, 18 Dec 2025 15:20:11 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH real-v2 1/4] cg, providers: refactor clearing probe arguments
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522A4C31BDE5BCAE1818348C2A8A@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|PH8PR10MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de0d87f-591e-40af-8890-08de3e72d913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v7zyNi6ynlaPjHUOAlieilwlhbi8vziA2ds7VaCKaTQh7cra2Cq56q2MPLqI?=
 =?us-ascii?Q?9hQGN+P/gMy4p2S90FycSYEB5oY4FEIRuVMRvDSqAg3w3OF7hA+X1LJ+6TM+?=
 =?us-ascii?Q?rbtjtTVzwr+G7vBpzKszmTdJhwM+RUy5q98kDe3npP1C9RHgOY2PhP2ghvno?=
 =?us-ascii?Q?NRHQYZthGtBXCNNyN0HqquxHlzCoRr16qJvKLjUTxeOqXh6yjWVNOUI1J6YB?=
 =?us-ascii?Q?pmzDmyCJuoigTo1s3YCun3u+sNhOszQrEp8O3i9+a7e2AVlcOQDsnQXkT2pW?=
 =?us-ascii?Q?8t3l3OB8UN8FrC32S977q7BnRNEKejU+VEetr6WlMXQsefr/kfHVeV8WdoHD?=
 =?us-ascii?Q?EPz4LNz3u1OJT6Oz3vB267hpIZj/wyPXji/BU8UUfzqyZg9t58f6B8nl/OwL?=
 =?us-ascii?Q?Dzi7uXAoi1KmjI1OSI9fE+/zTM7/Q0t+QY7ksdOQ6Qgj2QYUpIH81M1DQJjE?=
 =?us-ascii?Q?otCaX71Qc58BwVn7pZxYMaVjeXBvugP1ozVDs0zSBYEi0xaG61Yf7rl9ed/H?=
 =?us-ascii?Q?RtU3vMB0QhOMqqq86PBHNX2ohNkgmGeV9yCmkPNLoYRSiv6Grj3wf8ztP92l?=
 =?us-ascii?Q?RcMTdTj04kOVh1xZ8xU2FcgQhEz011mpoz87IYLoldvmNtV/CMW0M0z2eHta?=
 =?us-ascii?Q?VNoxysh+TxCkz8aebUeXA+cE4Iz6SI+B3g1QfdRE+sq9rEuYQniEa3mkCVm/?=
 =?us-ascii?Q?1YiKuIB6Ar6lDrY4UZaOVp+rPKnGzg27qyYUarMpnkMpoCw0IN84pZtQVCk+?=
 =?us-ascii?Q?mPGgPwRdbE+XxKMXEC7Hwqim0zAX/wQSfYW85sQhBG725UP+HR0NuW6JuWKx?=
 =?us-ascii?Q?DZOLhYWTAEG8Uc+TF3G31s15jpKnfm+kzlOflTQwsKZjM7cRzWs35j85X/97?=
 =?us-ascii?Q?j7s1EIzitolOG3lwngOfcurxTbI0FIXj7WOlfXMkkAoO6kigG5rGQ054ff8+?=
 =?us-ascii?Q?rv6AQqg/AVJO2uE61AcAMoTxpEVMNr7Q5KWsWBmTU3eJa3f131jYcLWYYaIs?=
 =?us-ascii?Q?8MYDnFTfc/CySUEbb81T81M3/Fsoalsdo9C1XoSk37akRSoOJWMflHA1Q3Wh?=
 =?us-ascii?Q?aTtOylDnlJFPNXytNId+GRFlX4w5mS0AATR2JZp+cEyVjfSxTdQ9U0Wvzjui?=
 =?us-ascii?Q?6N+uHfq4Wmh7dVsEDomDtI6b3GPD0gBFnMsKxRp7iV6PsSnQei3xPu9nXZvm?=
 =?us-ascii?Q?7Lb65S6D93Yx49Gld+P8acgy6PQ2kTDgy9VB3rji5ffKkVhVzw6nqSxQ9Bft?=
 =?us-ascii?Q?j1rP9VNLArkluymtXP49g0opZHlEPuvh5ENnhV/eDbmgMTqk66Of+TBPN2Y6?=
 =?us-ascii?Q?iD1tiZIp9oqy5z4I6zLIfZpUty2ZGIftm848fOwpkYwZ7NutWB2DHRJ+dIc1?=
 =?us-ascii?Q?ViYuEgjOThw7DZ1e/p7Wr+R+nUf7YzWTVc9UZ8eNYf3C69OwkhNKYUHwHHNz?=
 =?us-ascii?Q?rfSct+Qydt8NWo0YDZWj9Rl+1vhqMnT1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pcN7Ds2xIqz8TEH7eNmPppn4ZgvQUZeWTRLwB+Ff9bUzCTieQwSsJtFUV5l3?=
 =?us-ascii?Q?ezJ2tg89cxn54LwYgKJGEXMqr3Xbe1FqpXnl9VIgaslHVH5H0AM2Ku9GfL69?=
 =?us-ascii?Q?HEdfS7RhKvboWMdRvDvXSbOVG/nRupalNDusFl6Xb/5zT1fjB0QESXnQt9aQ?=
 =?us-ascii?Q?XgZ8IIfvb4p8Jl46sbCtZuZTnwfyaKA5+koaXooe3E064dGAoTsy9jKRbMvS?=
 =?us-ascii?Q?7c9RgdB40k22uqk9CAknT6KAdP43t6p1t77vKS5U2w80iPLJX2mL2/sCoNA+?=
 =?us-ascii?Q?hdqFzw48pwZfvG0iKYa36bF4svZSuWjvpqQKXQtzcS/uQTdTQOc5YAT3ltww?=
 =?us-ascii?Q?nhJ550j9AMHdFEfTY8JQ1Vk3CRYCiTPY5qFWDarqzuG7xmc/hCtxjE9tLIKN?=
 =?us-ascii?Q?7IVWnRsh2iZ/kCjmu7AZFZ0WlvZ4ClhERjD7qMxQYioV9e6zvBIxzqSXZWKV?=
 =?us-ascii?Q?Q46G2TX5WTRZUza9qwwQ4RiQt8G0WzAX0A0IdZHOgDb7YvFjMJwgQFBloxMu?=
 =?us-ascii?Q?bVPnEErUX6NsFMhkXj57nisw3mX+Tnx5mNwcM4pNIlaXJMyFgqjw7/PIvEzN?=
 =?us-ascii?Q?cmNA/2pT5cxQ+aNVXxbUJENEBTsEpfK+nbtqfeT9VnSMd+qUQ7Or1c+sDH6B?=
 =?us-ascii?Q?V8VpC7jMnhByC7Qu8uewDq6/1Pkm8HIrQKzRsn98Wrmbk99c4YpnjC+3snEf?=
 =?us-ascii?Q?oajRiU/9KQbFscNwdbNvkc+KMauz1lb5ulwlMnOGXh/zteN28MJeGiVbQq82?=
 =?us-ascii?Q?VfVQtDS0hH2KmBsP/qqz20IeGgBSUKKUwk5taKd3UWMBIMRlroCOKNYsaxTF?=
 =?us-ascii?Q?Lc2b3+Lo3VOugfl2p0ErcKXgyMbhYetVqdoBm8xSCty9EmMd9zUEw6UBrOY3?=
 =?us-ascii?Q?MZvUSk1/chbrDALu7kMlraabfDKfGgBcy2TV4bIS9zzzMv0wG6vJeRvUg0t+?=
 =?us-ascii?Q?MfMUthDLDAWm4B9gJLOigcc9Gsxsu4SHbZFrBPyXYJO79QWpoGDb92MoCV30?=
 =?us-ascii?Q?m8YyxZhsbddnWCxSzt18kNG/G+3PN9hqFM2nl9+1Shp3csX4iw1Q4CtFv5BJ?=
 =?us-ascii?Q?pljMyM3gfnxKE2I8eZSVdGYwBlNkw2Zs2XMfnBvz96ARRlb4v0wHNfs8qzUC?=
 =?us-ascii?Q?IyrJtDu4ZKb285ZQN9vSbXr4lKpMEY0kT4lxg7TuvEHaZQtCBoT8ujvlU2iH?=
 =?us-ascii?Q?kXFFbSBHM+PFRR3mI+chBcVs2djcCfaFfuMqDPYs8eBsRrbu7gkGRz2yZ4IE?=
 =?us-ascii?Q?rvLTdiarXA7X/r48AWfODLNWrDQg+1xFEXBgWu9tMRpW6Qrz+GGAytPSt5vC?=
 =?us-ascii?Q?ZL7K97Cr6+udqPcenO06lOjoscM7zJmHxX/QCbmz10PekC0ApQeMWQ0E5KWz?=
 =?us-ascii?Q?DwF3/ubn7Xp8q4eDIG7uy+jD43TvDdySBiB75/rfbpAXWrGy9eTIYHkhUlKF?=
 =?us-ascii?Q?1LEiSGvz274U1WVTdtSWJDVVZ3UoN7ccgWuKdYmAMsQX6MFUpeaB52wROb5H?=
 =?us-ascii?Q?kADenaEC5/5vR1GEUbSHqL8MIygtTH8Y1WM1ADjWXWHJ6CMBdslLstkPqN6A?=
 =?us-ascii?Q?CQW3dd6W9dlXE6Q4/ZtXh8TfpM+Ci6v/7134XZpBaZb5Rn2FuGe6ipsylspi?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5mYlhYz4ihNv1DaQlZ/jS2gD0U657R/gSl185P1v3Z2raa42uK6FiF5RC9PN/nQmFT+LI1sj5371Po0GiHfwJPiHxOaLQZ6m+TkGzyB5p/BLIpy/Q2L3kp1Vpd79FbhSIuQaY4OCy4rGz+I+K6ItZ06WlM3ozMBJRkrcrLeUG8Z6rDU0VtWWnKLbOR5QyvN0ro3iQF9/O96vkMfq8JwCfLsKxogkasUVhwhl/ICmhmBjcGJFvb+s8p3eQ00Nid/lujj/qFAAhdWFbfb+4OgrVdma+gVzlNdTa6Fi0MvsD4kNR1hv+h9Cx7NccBxxNW8hvqsS5bv/wRl2zlgWh5fydOsPLe0msbrIIVBudHtWPAixuQD/unBjYwijM2hXD5XoLh3bqlbiXBCD/N+fVwQYySvkIN7fCgFgu/fbtChSE7vdUHXvW9hYueHmE1fBb4zj4eJ35Cb6ilPWcbbqMbqfKyeGd7xpjrTK6m+Se6vKYbF+QK8mTEJt3kHMKPXN8ZqDo4EejQOJX4vmIvKlD+QoHbfBZhOOJfeSXW2OrfzRv83VBUu1Ix9MkINBs7Qbh3BKuZfOZ7SpzbjAeQ6YNcngaYK6MF6MAP6Wp41lKXXlR9I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de0d87f-591e-40af-8890-08de3e72d913
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 20:20:12.3923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vc46YkysJQpottkmQkPqIbZIT+S5Guc6hNDNHqSMUVXNljZ1HtE3UE6naKpIpZ9bwvWFyZaAsMWN9dQIdhT1bA2koF5xpMQ9raxYTPBLU/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6290
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=947 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2512180168
X-Authority-Analysis: v=2.4 cv=WZgBqkhX c=1 sm=1 tr=0 ts=69446200 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=sSV-fTKZYZwYaJdNStEA:9 cc=ntf awl=host:13654
X-Proofpoint-ORIG-GUID: akfZFk8oOdCxnxSPDVar2wYY77f09ocQ
X-Proofpoint-GUID: akfZFk8oOdCxnxSPDVar2wYY77f09ocQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE2OSBTYWx0ZWRfXxOkmERtydaGZ
 SBa4D9kHfAMISl+a50Iq3/RbeEZwnPSm8g4BsmYrxdJL63iSmT4+WqfZOSJiKwgY1lsp8TaNWOP
 BDAiCBLZ+H5KAhdE1p+qtd5AeuVmo7zMNZ1t6Vk8n9Tihagz6EIPxvF4Yw01dwHOeTGSblmGUO7
 2gR+4RpeJXhs0kPNYZH83zoMQTJ5T2uuxgX+pLXLOBpJW7HhPyq/QSS8cyGz4fMUoVb6wNFB7nc
 OXWzlYXw34fCz9bnYC1e2yQL4BF+vdULKs9dg4QcrMzD4Xd652cC8pcRqzxOc2w7qEwLE7s+yVe
 0xT6oZb6jdlWXPVUxW9bwKvEcMuTjc5IUb2xr4vKjMKpAT7ne+ZfDWYDtT8BycipP2cPZdhduXL
 WOTEQNRRrjpogBSJD2v2FLrCM+Hd6EmsDnxR8+KNx05L0lI4cy0kHjpZNEqALoLj/6gzCObMeIJ
 tzDF4rEBmTxTo5Yr/Qafd8BcacnC3N28VWZ6Rl+c=

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_cg.c           | 28 +++++++++++++++++++++++++---
 libdtrace/dt_cg.h           |  1 +
 libdtrace/dt_prov_cpc.c     | 17 -----------------
 libdtrace/dt_prov_dtrace.c  |  8 ++------
 libdtrace/dt_prov_profile.c | 23 +----------------------
 libdtrace/dt_prov_sdt.c     |  7 ++-----
 libdtrace/dt_prov_syscall.c | 10 ++--------
 7 files changed, 33 insertions(+), 61 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index ec4e3123..a77c022c 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -454,6 +454,26 @@ dt_cg_tramp_copy_regs(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Clear the content of the 'argv' member of the machine state, from the given
+ * index (idx).
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int idx)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i, argc = ARRAY_SIZE(((dt_mstate_t *)0)->argv);
+
+	if (idx >= argc)
+		return;
+
+	for (i = idx; i < argc; i++)
+		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+}
+
 /*
  * Copy arguments from a dt_pt_regs structure referenced by %r8.
  * If 'called' is nonzero, the registers are laid out as when inside the
@@ -626,6 +646,10 @@ dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb)
 	/* done */
 	emitl(dlp, Ldone,
 	      BPF_NOP());
+
+	/* clear the rest of the arguments */
+	dt_cg_tramp_clear_argv(pcb, 2);
+
 	dt_regset_free_args(drp);
 }
 
@@ -640,15 +664,13 @@ void
 dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
-	int		i;
 
 	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
 
 	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_RET));
 	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
 
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+	dt_cg_tramp_clear_argv(pcb, 2);
 }
 
 /*
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 9493edbb..401ac0e0 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -26,6 +26,7 @@ extern void dt_cg_tramp_prologue_cpu(dt_pcb_t *pcb);
 extern void dt_cg_tramp_prologue(dt_pcb_t *pcb);
 extern void dt_cg_tramp_clear_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_regs(dt_pcb_t *pcb);
+extern void dt_cg_tramp_clear_argv(dt_pcb_t *pcb, int i);
 extern void dt_cg_tramp_copy_args_from_regs(dt_pcb_t *pcb, int called);
 extern void dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb);
 extern void dt_cg_tramp_copy_rval_from_regs(dt_pcb_t *pcb);
diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
index 57b11b13..fd33990f 100644
--- a/libdtrace/dt_prov_cpc.c
+++ b/libdtrace/dt_prov_cpc.c
@@ -393,26 +393,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
-	int		i;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
 	dt_cg_tramp_prologue_cpu(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue_cpu() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-
 	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * Use the PC to set arg0 and arg1, then clear the other args.
-	 */
 	dt_cg_tramp_copy_pc_from_regs(pcb);
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
 	dt_cg_tramp_epilogue(pcb);
 
 	return 0;
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 34b5d8e2..453d3e58 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -83,7 +83,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
 	dt_activity_t	act = DT_ACTIVITY_ACTIVE;
-	uint32_t	i, key = 0;
+	uint32_t	key = 0;
 
 	/*
 	 * The ERROR probe isn't really a trace event that a BPF program is
@@ -174,11 +174,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_update_elem));
 
 	dt_cg_tramp_copy_regs(pcb);
-
-	/* zero the probe args */
-	for (i = 0; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
+	dt_cg_tramp_clear_argv(pcb, 0);
 	dt_cg_tramp_epilogue_advance(pcb, act);
 
 	return 0;
diff --git a/libdtrace/dt_prov_profile.c b/libdtrace/dt_prov_profile.c
index e1369ca9..cb65ca43 100644
--- a/libdtrace/dt_prov_profile.c
+++ b/libdtrace/dt_prov_profile.c
@@ -216,24 +216,9 @@ static int provide(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp)
  */
 static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 {
-	int		i;
-	dt_irlist_t	*dlp = &pcb->pcb_ir;
-
 	dt_cg_tramp_prologue_cpu(pcb);
-
-	/*
-	 * After the dt_cg_tramp_prologue_cpu() call, we have:
-	 *				//     (%r7 = dctx->mst)
-	 *				//     (%r8 = dctx->ctx)
-	 */
-
 	dt_cg_tramp_copy_regs(pcb);
-
-	/*
-	 * dctx->mst->argv[0] = kernel PC
-	 * dctx->mst->argv[1] = userspace PC
-	 */
-        dt_cg_tramp_copy_pc_from_regs(pcb);
+	dt_cg_tramp_copy_pc_from_regs(pcb);
 
 	/*
 	 * TODO: For profile-n probes:
@@ -246,12 +231,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 * and update expected+=interval.
 	 */
 
-	/*
-	 *     (we clear dctx->mst->argv[2] and on)
-	 */
-	for (i = 2; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
-
 	dt_cg_tramp_epilogue(pcb);
 
 	return 0;
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index 74555f5b..5be43ebc 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -174,11 +174,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		off += size;
 	}
 
-	/*
-	 * Clear the remainder of the cached arguments.
-	 */
-	for (; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+	/* Clear the remainder of the cached arguments.  */
+	dt_cg_tramp_clear_argv(pcb, i);
 
 	dt_cg_tramp_epilogue(pcb);
 
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 20843c6f..237f2728 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -159,14 +159,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
 	}
 
-	/*
-	 * Zero the remaining probe args.
-	 *	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-	 *		dctx->mst->argv[i] = 0;
-	 *				// stdw [%r7 + DMST_ARG(i)], 0
-	 */
-	for ( ; i < ARRAY_SIZE(((dt_mstate_t *)0)->argv); i++)
-		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), 0));
+	/* Zero the remaining probe args. */
+	dt_cg_tramp_clear_argv(pcb, i);
 
 	/*
 	 * For return probes, store the errno.  That is, examine arg0.
-- 
2.51.0

