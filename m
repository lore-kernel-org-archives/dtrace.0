Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8063AD531
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825289; cv=fail; b=pgKkfyZ5Sx1c1Y3eTCa34tC40WPuFFhv6i30q2bzfDCiG5fXOdVo0Obzn/AtxLmiTHq4eNMQ5y5qdfSnLp8qykPMcmd0g9Tfq40im/sk+mye8iiu+0uphaglWcEJfOtbvcocMeFZ0Ue68Wv3291GrU9E3VPX3BJuqgESxqz3IWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825289; c=relaxed/simple;
	bh=AcVK2M4SWpeLmIIg9EkWxIVvORlxv27d4J+LN71TRRI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LLYxX/B0GWI58rbSY5RwcpO6sJmTMTWnTyOpfgakz1LCvqfjG/4pvUHUTsWs0mdg+muVhIq5NUbrfnXBnRKe6U87X9sxYQOfsTCbxSSLn5NJsSTqfgwTkZAnbv6qSwp4zzBVXu/s7k7lpfKB657zVQvvHLZvtW5UdI+cOdB6xFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XmtSPMXB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rGySpxuI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XmtSPMXB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rGySpxuI"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMif1Z019163
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mnzBzO3WjQDuYvV63V
	ejg7OvS1TwO3wImE6GvqGAO0M=; b=XmtSPMXBRjR9oMgchFoWOGH9vxu2vtsioY
	GHRu85MsxXilwP4Haohy3JTZyimGrQl2drMqSl3kDOA4rXEhCqZuBdaoObb6PqLm
	tYKfiVxdclr+Rag2QIYGF6m1TVg2PaJaiizYKCtSyMB3djF5chI3rgEyvFvgCk3w
	/QKTqzT4Ttzv+/xMTxclRU0G6vitgeyX90VnM5UQ5pkbQohhjroYL69VEV9+snxf
	j8NWqYJwE5+aPmO32IpwsbOIOmzM6Xmjavugl0NEpy6oz/jt3etCPx8brWlzqA8P
	s7fiuXwHVprVPMGuVRhMlKwe4eNXkiPMvCjgumBFFUca8wYGPIqA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxjjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2jw8Z005634
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq4hkyh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 04:21:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPKoU6vvU1ZEVpfJhucKPI8a4S/8Adqc9U037WICECiG4UmJwxKhuHFmUR+zpKzxqYVdx4mLIW0LDU+wpPNscMc5fcmVYtJUinPktILLy6OcBOr4lQjgOt4fCp4hhcnEDfW/l8nBJHMPQxK6CBYJpgR3k9vHmrufHPu0C0rx84jtxR4rt6CKdYUhhL38S3O4xnJX59efaGJqD5SBY4f7fdRF0BKJU8p2G7u7KsGAdGpnzpwg0Z/2tQDOxNkTE+Iq0s92WKfqpQJoqk6Tmcux1NuzTqBfDuos+qy4YjAFpJz8Nh7Q3Dock2bCIlhbdCBQGsm9XAaXZYbGyrnbyNdBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnzBzO3WjQDuYvV63Vejg7OvS1TwO3wImE6GvqGAO0M=;
 b=XusXzAuDctIoEYIr59GUoOQe+zZ/sQZD7PeHCXLRiuLxsoe9eARfJW50gaQcj6afylRLi3uy2O0103EXjhDsUEVIfrYjacp0BUM26gCvAGbl9xSiOFT8R6LeD7v0s1ZTPpTLmzrvJJ2wADwspHCBlNlcxB7uyb8iMM27PU5U5LIkhEWO+BlHf4EVbWx1JIVjRPsJOi7UQzVNA2AdfQmVFsUqnFYU6wlvTl/jkwHU6N0nbbIkD4ppMr7hqPCUZZ8kDN3L3ZfPP5P51gxTvgIiOZZaee3cJE8PNTpIvG/uq3asFtP6ibU1MVKg840C+WrHiSfF38Z8j+8UI3kVQIzwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnzBzO3WjQDuYvV63Vejg7OvS1TwO3wImE6GvqGAO0M=;
 b=rGySpxuIzrqRsp1coLAnEXIp7bME6np+nDICZ4Z5jIgj+Gn4j6pB0ulyB45YefSM28y5NLROVEd3/5tsnSqtTji54N32AWr9TXsDNLg3QCBS2rS9ZpXwz8ZX+wJvyH5B/0FcdIrmBn8QhN/mSFlpwsFqmHnC4EO4QmW1Y8aS6dY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4582.namprd10.prod.outlook.com (2603:10b6:510:39::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 04:21:23 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:21:23 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 09/14] test: caller and stackdepth tests for profile provider
Date: Wed, 25 Jun 2025 00:21:02 -0400
Message-Id: <20250625042107.13571-9-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250625042107.13571-1-eugene.loh@oracle.com>
References: <20250625042107.13571-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4582:EE_
X-MS-Office365-Filtering-Correlation-Id: b27362df-7388-40f5-6b3e-08ddb39fbe40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OcgnMukHmzODVA+B0/HyI8IukDO/Zg/iY6cOBbbVL+5BxT2ZeUZOELw91Sx1?=
 =?us-ascii?Q?OPSayJ9wucF1uXFUvhyM6zOAlFk8iUWWA1ozazuVmGcgnbmtXqA0Ap6ba6cl?=
 =?us-ascii?Q?JqJhVDcoUwqUDQIanwdO1DKo78lWAj/+bwOXYhNEGXimd0qcalo8+koZLVEt?=
 =?us-ascii?Q?0J8zOCC7NqJpuRnqmKqpqKspF/8telKo+WxUvmTl+SbKYBV4nJrnLrydCVRa?=
 =?us-ascii?Q?qtxaeZm4P9/Q1SH+qIipSdFC3jYqq2Ab3XOgdKMgG0MGMSOzYezAfKRsB0jl?=
 =?us-ascii?Q?fJwusy4Wt3ynMfNheinPUe+/cyawqcraA+8338kAUswyOT5Yxa4L0jO8dCgB?=
 =?us-ascii?Q?bKsu5qMcOEz+Ia6HliggPgX6+YGvgqko42aY8pD4iUtnppBOzx6h9+xKByiV?=
 =?us-ascii?Q?gKjQ8YGfGc6pp/xx5WxrM9Hjm1L7M2tpMMEX6q82/nx00oY6UVjjLpZm2B0W?=
 =?us-ascii?Q?/PRspGQPqqhQEVxLte1MK3FWQKiMGq+8QPAX0J6j/WDV6h6zLl3nKD1cU4Rd?=
 =?us-ascii?Q?xeFt0UDBa4RMLwT56IF4UgEGPUtKDMOaUKET1sxmjSWbYAVMPI6HxtBTc2lp?=
 =?us-ascii?Q?kRfpzRVoJ/0lHMlcRIiyZAtohiu90zuIVkbk0dN2oeL+V7PczO/sxcwhiBtV?=
 =?us-ascii?Q?fgdKEn2Jd4w+0gQImRdaP50poiHV03uRLiILIKrTuqlvElULrbI/1M2JqC5M?=
 =?us-ascii?Q?l4ZBIJxlKh9boEyPu25wO9sLCpqszfqBsxTgz23MFxwmJjuxMQWBm8ml0aij?=
 =?us-ascii?Q?qEKKL9h35+Np/lx1qzz6UT57U81qm7ixYni7KhQyOAoybzCmv8+cZFn7redi?=
 =?us-ascii?Q?RyMsFqUcYS9+sR9AhykRY7nM+3/WAip+NY8FeG1mWpqY74hQSPDy2pyIVy7g?=
 =?us-ascii?Q?Xwlilt2c9e+5os80RLZdGtq6ZDwnMHuI5dePYD8l+r6Fs4PNzVamZyP8MIG6?=
 =?us-ascii?Q?5JQZ+Gdabo569noJZGTnbP2MEkDUeVDZtPdKuINPb7fvNYgEv4C4xGrSHgsi?=
 =?us-ascii?Q?2W5HTqxPX0gZKY5hLJ6IQe6EccsE9JNeEfoYbTHfgx0DE+vWEqPc1lzq8eR4?=
 =?us-ascii?Q?4/bGm/ml9W/aySB+JerF4zE4fjuGUi19cq/sGg/iPcTcMjhIUmZ5kCy8eOEz?=
 =?us-ascii?Q?rao992Htv0lAUXOS9ccd3tEK6elewLTyA1eh/uczURaCMduLT+MNSUdNwt0J?=
 =?us-ascii?Q?BPnvPEjXb44t4KhjW324UdyGdVycPFb3KMsf8i3Zf0QN6Ya0K20m9DlKyWdY?=
 =?us-ascii?Q?d9/YKbb4aYfqYFFlccIepLkmsm706AW1K+Zb9LUOxkRGNrBdLuqYV8MULRAE?=
 =?us-ascii?Q?Zod3jbgs8tk4rNsKCnX7Pz3Y5GNv7zzIrE8HWBHQ61et2J9u7zwp2Qfuu7Sn?=
 =?us-ascii?Q?HM69r91cQiiEO3wnLJ4HIC4+CNRWlI/s7qCwMSVpPLGvWaa+ULRCwzN0H2Em?=
 =?us-ascii?Q?81+M+wXs9Bs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jOGHzb941UFlhfCx2QIl+nRhoak5OiSciJxJ1M61gWJhVzRjityBqrhVMAPO?=
 =?us-ascii?Q?wKAXhVdO+woZ3nooA7rUbEEbC6JS9eP/vXw7CCkO4gjlVlBE9yRMtyzpQHua?=
 =?us-ascii?Q?VSr169P/U4TCnbA2RNQ9lvQOL6Gjdkszkl0L6N6ESI7ej7RqfwtrLguuvsaI?=
 =?us-ascii?Q?4wksvRaGbgpGf4oI/ieqP0A3y4/nYfHLoPH41Mk65FJkqvcajZZGBt1jth9e?=
 =?us-ascii?Q?P245F58fbUR1vk3ojz39rGaLuIbY2lqga26ghoNSvAj/QWR4b2X+Oge2jBG+?=
 =?us-ascii?Q?Mkr24Tf02ddTxq6Iz6zimVw00pfz2/e1I3rhieX9sTT/kMe+8F6CUkyrJnnc?=
 =?us-ascii?Q?gy2Vlta29i4t4VInGxRF4xLyd1XpD96nDO/YqJND+l8X1UbT/9b60fWUfwG4?=
 =?us-ascii?Q?tdGMRtS2eNzii1D+5n8f/UEPKgJZLwdfKyhswikLuMRBvMLyfLwtbj9lOr4m?=
 =?us-ascii?Q?MWAVYWxC+uBqYKX+W5e6GVuxWZ+oUFfZuhA0GEqtovNSHmzZQfIi/plQMCfh?=
 =?us-ascii?Q?kO1jHUFn5jHIFzXrUHzMJ0NDbntiEzgYSZ77z3wh+pgM2NCBFLF1mEjxP5/b?=
 =?us-ascii?Q?ydahhiMA4/qPiKvDCQQTpbtjMXInOA694C1Y/BNmrF4h5cGlZ3BCidVsHxGt?=
 =?us-ascii?Q?WxdDUSbymFwa3gEPw6fW2fdnnjIASd5EhrrrToBGSozHErGRnnKTmrewOScB?=
 =?us-ascii?Q?VwUhkF9cF3Djho83mjsPfrgkEaiaIYNLFg1S7drIdGnjKLTVfheQlqo2Y5Sp?=
 =?us-ascii?Q?KY+dNtyHzeWN8uXjMVrKJzKET+MeTywGI3GP3OdsrN/9mVDG1e14J3mxu+UQ?=
 =?us-ascii?Q?JtQD4SjQ3tBQMb1spLdMhCy3vLpsZECGXGOFaLujQz3P89H4QZmucTzto3Nr?=
 =?us-ascii?Q?QG2QTjT9FqiOYBUF4oZtYdXHbky++SHjK0EtQ+aQD8UQPb/HxPsQ3J7Vcw9W?=
 =?us-ascii?Q?UdTkWZxD+AfEIHtWHLFwq5cWK8Us3Xp0pOKW5pzA2LldDQOHt/uGOlWqj81c?=
 =?us-ascii?Q?VV0rCwAGbP2P3oPZLDKC5+bVejqyf/HK4/GnDyMuVjREcufeNO+pTE96FE38?=
 =?us-ascii?Q?xu4v0aCp+7PvULrv8Z6NEyks5YUa3C7P4jbqhu812Nb50KuTJVd8IocxlZnI?=
 =?us-ascii?Q?5eGGo56UHZOomBryl6hQZHODdDEkIyTfhLIi3vJg2XDKB6PFRTL7PRDW2t+o?=
 =?us-ascii?Q?RsJkJdD/PyDgC9dPv51BaEDqy+FAs1DgkdkYvw6MwX5Ywxhb0VGjfkXwK85f?=
 =?us-ascii?Q?7c7AR90NYblFPkBM8AMTFo8MFT8DdkU4KnDp5uUKxD2I8EfOfdIkwy0tCg+r?=
 =?us-ascii?Q?2rXbbf1AUJU7TunSvcE0f1FFiK0P3dIdjwLuSqhxWjzmVsShqMeTGIAaqdfm?=
 =?us-ascii?Q?ebW6T8m5YLP39vnWSULe2rB3QF39VLfmAgIVp1iMbkt8x2/pxTqp67mKR/AF?=
 =?us-ascii?Q?/TdhQXhDQKPe5NNqdL3KgZEYQXN4wWhFLtW5oNkvVk813pYPjReTJSsQjU9g?=
 =?us-ascii?Q?8fKx8HCXFaNisNGs4Wbd/WwJIJadtSFaKtXZGEmV7k5vJoNdTk+Xk3MWUCxS?=
 =?us-ascii?Q?K+8C94S6B2wDVqCOg6GtDSgBq/aGQJs/vw5AjuR3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lSe6BWBIBsTdkOcJIBnmy/2CAc8ipmjsqZUSmUleZ0EhdayBMlbSu2WjI0cpR+z2N1BLIpwmGQ00w+tOXDiydWO7E9t0WJpVVXPc0cDodIbV1fKYWb8P7JleHLMB1Q2LWIzMYaYZkCAu8JccRHreuq3MSwGZdvDHUfp7JHJXTdeDaejHcJokQhxjXwj/57cdJe1iSEoKWJQlM36xatyI1cYrCRqNtQ3/mM/UDGHJiahxr6+ftjcT7i78IFxHwkHIc1nTlhRY+3fBEzfkU5jvYqfx0sEYOD2R6lBvHUr23B7QXtpIsvQCRPK9KFW9/cs8NRQh0oEgezL99ITYy305VqbYFSsPvRbhuU9Q3LjfkYz46KGDJ5ne/TjSYypEMOF67jl+lqdi2spLAm7Af5qsqTUYgEDk0hyy1bFWyJYcNreDzhz9IEE5bEX+uHlzCHYeE0U9c0vahkjlR3q1uWlp3263XojW8gs2TLRBbuRuR1HUxL7fLlM5j/WUfCs4BqVWfiJbNYwGJgcfZ1MuXiBHOrxOzyDk5LySEHms98d0/qnhYYcPJdjak5D8ZilObjh2zCGECwjHWnonvo4nRI3Bu7EXXgC7DA5sG9FEQ3jFPc4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b27362df-7388-40f5-6b3e-08ddb39fbe40
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:23.1203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11VQotjbDXmdPZDfh2+wBqxrFofccsfIZf5X26JkT4T8SWhUCQ7YMf4moBmTbiKG17azp1rrC5iZyvhy/KV19A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4582
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250030
X-Proofpoint-GUID: 0pFZZ5US6MR_5CJpFKO_CDdSojuRvUqw
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b7946 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=BaVqHgSiZxxewaDosMwA:9
X-Proofpoint-ORIG-GUID: 0pFZZ5US6MR_5CJpFKO_CDdSojuRvUqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMSBTYWx0ZWRfX6zPa3BqnyJ3C tBfpIwpWPE3wGEEA9nLu9996EulEG878sLQwiI6+aHlN9glA+973L6wCzEUsqMJ+45mcfxUi8u2 +8t0i3782r0lYKi2KA+2tTY5FOM90Z++1oLalToEk41t/a/Fv9FWhwupJyOrz+JgqppZjlZtJLl
 S+TheLwyawZH1MgWWszV+HeGCvNkJVBSx55Ep6MoA6KGsa1Kfr/DOmAaW7YIfy0JZVNvrOqkbMX XPfL4AsQbhZJkqD/5sktKllj60v7Z2NHUeNBehTNcgsO8cDERV1R2jGQWYbY7nECPW2MdkaPPAs LhTZ6xS9j5lx9dfSWYXwnAlxaIEHAnwUQHnoNJFmKTOqDeXCbDPzwltPp3oEGVsQ3ZRvap/88xB
 RrJKTKV8c07WYIfpuQPgGTnnnA2T2INU6T56T8es5A4144GbsyFrTm9CL9A3Fjgl6hgYhaW2

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/builtinvar/tst.caller1.d        | 29 -------------------
 .../variables/bvar/tst.caller-profile.d       | 23 +++++++++++++++
 .../variables/bvar/tst.caller-profile.r       |  1 +
 .../variables/bvar/tst.caller-profile.r.p     |  1 +
 .../variables/bvar/tst.stackdepth-profile.d   | 25 ++++++++++++++++
 .../variables/bvar/tst.stackdepth-profile.r   |  1 +
 .../variables/bvar/tst.stackdepth-profile.r.p |  1 +
 7 files changed, 52 insertions(+), 29 deletions(-)
 delete mode 100644 test/unittest/builtinvar/tst.caller1.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-profile.d
 create mode 100644 test/unittest/variables/bvar/tst.caller-profile.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-profile.r.p
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-profile.d
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-profile.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-profile.r.p

diff --git a/test/unittest/builtinvar/tst.caller1.d b/test/unittest/builtinvar/tst.caller1.d
deleted file mode 100644
index ca0f098f3..000000000
--- a/test/unittest/builtinvar/tst.caller1.d
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * Oracle Linux DTrace.
- * Copyright (c) 2006, 2021, Oracle and/or its affiliates. All rights reserved.
- * Licensed under the Universal Permissive License v 1.0 as shown at
- * http://oss.oracle.com/licenses/upl.
- */
-
-/*
- * ASSERTION: To print caller from profile and make sure it succeeds.
- *
- * SECTION: Variables/Built-in Variables
- */
-
-#pragma D option quiet
-
-BEGIN
-{
-}
-
-tick-10ms
-{
-	printf("The caller is %u\n", caller);
-	exit (0);
-}
-
-ERROR
-{
-	exit(1);
-}
diff --git a/test/unittest/variables/bvar/tst.caller-profile.d b/test/unittest/variables/bvar/tst.caller-profile.d
new file mode 100644
index 000000000..82d21f784
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-profile.d
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'caller' is consistent with stack(). */
+
+#pragma D option quiet
+
+profile:::tick-50ms
+/stackdepth > 1/
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.caller-profile.r b/test/unittest/variables/bvar/tst.caller-profile.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-profile.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-profile.r.p b/test/unittest/variables/bvar/tst.caller-profile.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-profile.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-profile.d b/test/unittest/variables/bvar/tst.stackdepth-profile.d
new file mode 100644
index 000000000..614c43a08
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-profile.d
@@ -0,0 +1,25 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+/* Check that 'stackdepth' is consistent with stack(). */
+
+#pragma D option quiet
+
+profile:::tick-50ms
+/stackdepth > 1/
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}
diff --git a/test/unittest/variables/bvar/tst.stackdepth-profile.r b/test/unittest/variables/bvar/tst.stackdepth-profile.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-profile.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-profile.r.p b/test/unittest/variables/bvar/tst.stackdepth-profile.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-profile.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
-- 
2.43.5

