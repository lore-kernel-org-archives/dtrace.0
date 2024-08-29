Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5C84643B
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724947048; cv=fail; b=HVOYYYJK5Y88bVyGp2rYgYGJXXgxyeBZNJ+xuVdgIGQYzbaNXv+AUe52h5byo+Q1Rk0gbI2JOqN4r6d68YkX+zJhuomu6c1OxlN5dYefgenoV9Bsqp0l047B6zt2WvisyavveKMFpEHZaNBgfBeTKXi9wR500O4nFWXpfewRWLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724947048; c=relaxed/simple;
	bh=iy4WXHPYkY9nxg7Kd6cohDzm1raFtuqWSfwfIKY/uVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rwNtEcrr+4lLVWu6+koXbx23BT9JdPtQdrx7GCt27Ka8U48w/BARY7DMbZAPjE7po6XZnMEBkL8YmLxiu9n1gwr1jH+9qo//Twub5ZALbMc9ubnMeWUvuqbxGy/W0NJXygbzd0b80g7Clwo5XzQIBVtmsRPMeJ60hCY++ZU+i6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FZO69hY2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IJS3fC8Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FZO69hY2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IJS3fC8Q"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TF8dDJ018397
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 15:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=pf48EmXKxAqjHg3
	ONEndO5RL8hAx0y3IzuBsbK1XXPg=; b=FZO69hY2He2zQEzvnIdj3ofgd/0cs0R
	o5NgwhrbHMHJFb2/fEdR24yGFq9W6BYoknw0+bUujE3dGt+muppCdtyebjJQ+lXs
	TaO72kSrEXjrrW1x6pUhwYua1UjvgfOxI00IRmxE2kjmV3Ql3odeZkFrw1QvOk9b
	V7uMF6BTDr7dnkwZ1I/B+6S7WQ5myQBvc+xPX8IiN5TxOOYkZq4c9dQgcbs4/Iqc
	HP6TGzMZRVbWbvbIWCynLAN+uqJOKbIvsj6WxwB5stKgHVr950oH21gg8s8PQR38
	q50syoXLnPuc0WLoyiwGqUYmJFpHlDbn9nMmmkv5SCizJBlE4MrjjbQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pugvm26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 15:57:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47TF0ksE034787
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 15:57:24 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189sw6dxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 15:57:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr1C+6KKcMINkEZQH+kGgaNidT7xl7pQrXSMrQ4Ajs6P+Z/h+0y8KGRVPcfPwScqn9Lx8DCbKb+h813gl2RkmyOSbcqx9XqDBF0zJoSKopKW0gOhqzQLThtL6HJhrcD36Mchwje5tZpovwRUHp2+6qOf8eyBtfACn+DNKMfHJDo+tXdGh1oJQLkRdGdW75vQCxTmfagVieqhfhihXQbMV30JHALS58k2rQNH3xCCXFR4q2/Ft1AGn06UxmvdnBe2Yb2nt6lJUvR28AF2SjHoezPSacEqmL4/E5XAjoOXUcX/ujUVDxsEOXacBvW4IXWSEKVZlBc5RbTa9QpCwEBROg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pf48EmXKxAqjHg3ONEndO5RL8hAx0y3IzuBsbK1XXPg=;
 b=LZhmSL14x4Og/K6/pmdxLr79RdgjRHgVLqU5hWvKX7YJ/S6XIwgiOttV3SrQye4dYcFONKebGQ2SS/6Q1lFKB9EbnVZB8dDFeXUB3fKAfhV+pjFE2n6J27GPQOS78jCjoIIBj+kC80i3pWjU5aS866vJrWLzwie/tPIIom0hksw4QwWvIKPaPUYfHnXOvxxHp6KavAc4tFN+rE05DnV/ih20jzOtpsSh6Y4IVSgLhJy5shT6S+ZmzgpIt0PMT42LtLwOPE9sXvN+vSavOUCXpjc8G1egCktcJzUpTp4cPVcxspCNtzOhNqwYwC/XSvxywN5R2hVZtlPIFv0dcKzk1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf48EmXKxAqjHg3ONEndO5RL8hAx0y3IzuBsbK1XXPg=;
 b=IJS3fC8QSQdGcwMN2wHH9JmHrDFnIaYLko5yKOFcgJdVJF1WPGX1WtIFlC1c2bHv/jphfn99JdFF2vqAwE6BfWeSkf0yfyuc4HglQiEivzp9lX/fdAUuCPr8NINWWJ2I6qJSwFLfnbGFNSSas4n12WXHIXMXeuwOJUf1vjALafs=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by PH7PR10MB7801.namprd10.prod.outlook.com (2603:10b6:510:308::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 15:57:20 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%5]) with mapi id 15.20.7918.012; Thu, 29 Aug 2024
 15:57:20 +0000
Date: Thu, 29 Aug 2024 11:57:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 01/22] test: Handle dtrace:::ERROR arg3 specially
Message-ID: <ZtCaXaIQEBOCfirW@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-1-eugene.loh@oracle.com>
X-ClientProxiedBy: MN0PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:208:52d::18) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|PH7PR10MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ae113a-44a7-42a1-868a-08dcc8434395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uU8nGihKpP5FILPjn4v35yzjxNVAJp8yLWGJQIkwsKJMJweYGYF0Ca1i+m6H?=
 =?us-ascii?Q?1a8JtY0u+HNEIxp+8yp4RKtAZWYXpxDIWI3a6o+EPR3oAsU2k7PQyGl9JLer?=
 =?us-ascii?Q?ROctggifUjreAo8i09pmcQLmTFMRtAF3ZcqFB1iMSdEF0n0b3brdTyU0vsRu?=
 =?us-ascii?Q?bp91uXNXh70o5PmME72pS9Y6BTOM1o8Eb+/8Cka3E6pJKWfqUpnXDBOl0cRe?=
 =?us-ascii?Q?iU3r9Ui58PVBfnKkTjalS88QKO1hg8xDxSnQqcQXr/R9EVGfJgPFkp3Cq66u?=
 =?us-ascii?Q?+HEMNXzJSO2MVvHj8egPehG/gsZ/6F+EuiKCNlkvSBpFgpBO2Ae4h0TXgJW1?=
 =?us-ascii?Q?CuXX3axFSjOMQJmbSobRFXTuaQF63PLW3FnIJBYqesESgeJx8jgwRqHsSXoq?=
 =?us-ascii?Q?HpPqZpEWPEcqDfk/cbHzaiJwscwJKAwUumxMVSQ11PNsJB04ksr/QHePQhj7?=
 =?us-ascii?Q?tDVCBp6XQ+7ts5/M6yvWGzq1Xc/Aly069zPViwro4kA2fTNZcuS+n/TXbgim?=
 =?us-ascii?Q?xCIJtKHxYL0nTvuJXyCQtC7x/3h+SK5YlO72WRqBEvX8lldkqNLIV4a8Tyj4?=
 =?us-ascii?Q?3c4zOtuu3dmd9Px8WNCPYiTz98vo5HJ8j9I53751uM8MzcJbhMpy+JOEQsQN?=
 =?us-ascii?Q?Cpyt2vnAtL0G3QKHyjDoWtqrGGGvD/Eqq54rkGsOvhpzjCcaYlYtpc/dTf8/?=
 =?us-ascii?Q?x0sVwFYLAUtrA3cPlGWseyUu/Tz+0IMuCq7ibtP4bLlHDKXfbg2ahtv7+m4Q?=
 =?us-ascii?Q?T2v64/rwdvoBK5uHAougcuf5BrPsHr75BAqgvCVf2iXN3iUMm4B91nxET0Ys?=
 =?us-ascii?Q?opcNAZQM4/AJDj4wRC0tlyKKNX1VXmNrt4bB+BbD/NONA7I6Mtn1puq+P7WJ?=
 =?us-ascii?Q?PtG9eewooxB+aWqScRhkr6mMkanPc03LW2AuRPXbgukMxS619BDqNN4Yhva1?=
 =?us-ascii?Q?tzufaLeKL+I6AlCwwus8WVM5OLIHqrAk5h8TkNE0KBrUiDIuYY1EpdjYpCE3?=
 =?us-ascii?Q?ZxTroH8CBQTyyku0UL0ktmCU6TcxVyftoFY7eW8mLjHGjcIDhbJp6tLg9n5Y?=
 =?us-ascii?Q?CZezIl8AIRQmiR8y7Z6Tzq3so5FM+eevWjbhietwF9xphR7dE8a8ZU/9NvZN?=
 =?us-ascii?Q?n0xXHoO1XNsTv4tYhCLIeiswXwDfKWYhojPDNNQpIGZ+A4c+52SnVoBUzMUp?=
 =?us-ascii?Q?eOS51mHZff8RhSjQKTYuEemhQ8p3WElYbIPBtEyqWSaxO66fZBCmvWyspqUj?=
 =?us-ascii?Q?H2LEkKZNSrDPSjOYyBfHG83i4IgFh0S3axvoE2txMOfVBLP/dBmyvjQP7gms?=
 =?us-ascii?Q?HtQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LKx+Sut+3bPk4u2QjXbVbakdQuVEixB2biAIvHoePZVf9aR1WQBM2nMJdqwL?=
 =?us-ascii?Q?v7TEqGswg7+REi8/QXQZmGtOTZ3cR7iJ4P7Ksd8ga5APxS1A5H2MV/4uKLGe?=
 =?us-ascii?Q?6udZ33lJk6CL7ZgpM6gcnCWEmWxByxhCQo6cxTFEwuOgzeuM2dO8cQ7in7Ac?=
 =?us-ascii?Q?2wEK/52TzW6Qvue3ct0elPyJk8Twb0sGv2a26LXnPZB2ijyWtUcQKFLA/EZ+?=
 =?us-ascii?Q?G899jGJnRW6j2QD/6ecV2cevLXraJZcAaXauXpnPA1TmnYOJ2orGX2wLeYzw?=
 =?us-ascii?Q?2xCkZ9WRDkhODIfS/S+C9hgsP1IUK6zaUGD1SF0lVBJ4lI6Ds0jOQuscxw0o?=
 =?us-ascii?Q?Y0fuGQgifuMAFQ9iBXDXMVuiwx+JNHiDc9lugNnEVf1YKxs63ht884a+E/4J?=
 =?us-ascii?Q?ki9ow6iFqnSl2CcddIdQ6R7jNroJMGEECAQ9PiU9Eo+puetxM8HY6P459iJh?=
 =?us-ascii?Q?SbpXhdIpzn40j6JpcI0RR1eI94JT+8toIA2CSOz3UdhJ5qz8Dqu7oem0suD6?=
 =?us-ascii?Q?kAi+jy6IDO6AlFzXKPQBYU44hIhUwxZA8TbGJaR+IA/gNuUoCpsvn9I6CKDO?=
 =?us-ascii?Q?Spf4X9NjNI/23jwass5AI1Z3sY1eWrCBLmIK/DVCILU4Omr75S1YOSCIKLkX?=
 =?us-ascii?Q?AUbkauQkZcgQD92Mkk5q6Hf02GXp6Xal5+2co0ELkb9bK5O5HxzKSwUtTOsn?=
 =?us-ascii?Q?Y95LP447OAMjh2GhKMcO7ic8TMFoF9yujQnM0vnxKlSvcZIXI4mimIi1qP3n?=
 =?us-ascii?Q?PFGzYzir8BZnH6N4/leMbhbAUaukXyBEXc4HAjV+sPHzLiPe4V8GYVhc3kCk?=
 =?us-ascii?Q?1LcE2GpH+pVyXsvfWhh7QkoPMYyvCYD9GimIBIY0xAfVe2KpODjLTWMX76Iw?=
 =?us-ascii?Q?Df1/qye1JKuadXOjxKDaVwqseoJHAI6+gdGZHcD0HjOH7VuLblC/NCOJuqlV?=
 =?us-ascii?Q?7kJgqwttlYQ2RYL7qJRPTOyymMJcT+Qd/K+Ak+gLKIsOHrzaJc/WPqIEmuB+?=
 =?us-ascii?Q?JMyWDfA9lIIoSBnp2QA3JURTUCCRo+HMxMiH73FtTzyvrrF7g+Ib7bahV23O?=
 =?us-ascii?Q?a9T8MnBBbFcHzYUG+XANegzaDPYH4aqBMX6etPHZPN5pLZTg3dnRi6DaHm2L?=
 =?us-ascii?Q?weH6EAg5bZBe1yw8TBg7zur4KrnUwOmOZCi0V/HF4CiXGE0L2znShIcwF++H?=
 =?us-ascii?Q?RLnArxZxmURzseTyZgh//E4eyjy49DaQBvUnL7I694RDOmidHuuuu6vjO9eo?=
 =?us-ascii?Q?P/+ESK/FfWeTp9zka+7NhAXt8IebAt5zLhdsM3zenRFNBmzL7YczlfERMRAM?=
 =?us-ascii?Q?sEtRCOFTNj91dstXQgmM/eTjoCu/lz+R/uTWz+6M3cGX5oZFRvHXoKKciwOf?=
 =?us-ascii?Q?QdDR+RELuqj3S2R2kke9Sa6cRXYLCWKMuOzDx/RK08dypwdt3cOc9XRdBiDC?=
 =?us-ascii?Q?1B4uj3qUDhRcgB0TmtrjSj7YofLOZniTA8S+Nd8LZ9yS67z8mvIkrH4YtFMG?=
 =?us-ascii?Q?gPFfFyTzu+eVgy7pJu1fD95RSKnCrGPp12Nc6EpO6MaOpkyV4maTwaLYlIS3?=
 =?us-ascii?Q?7CnFIHCRSKKuxIQ0+8DGNXTxZ2QxvP92S/i1ggoDR2BNl1v718U9JWGQs/N+?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	muexp0F5kodMx6EgOqTlAmMdwT5NNOca3ZQ7CQDvJKzsJLHldMP7eCKY3ECPYG9Hqy1Ngl9rbfE/LZkysZc+4l/v1FazZra21DHYv/cFyAMWpXP9S1xNMx1f2j1s6n/KVz+nM/TGYrCMSGiLgxFce9TjmsDYvOJVJE3g9W0zc82twUw/MbkynpJwi599stIHPFk4Zl5youAtOplldnj7lYYuR7EJ7SvqmBXcMPYNSr9GGlqkZnwldCg8UohyI5xR8a/CvNypBhDuI0odINpcRYBoGV9qvCUzORGwWQqU8dxxWEamZD3k0YjoYSpx6MSUtW9lncyF8/qz3wFOBkno1p3zAaC1fRBQJZpOJn9CgxvYfDPPkgf4YzOTXbiIK0rekBhL4t8vNGup2CDu/Ja/19U5kNWuWbkcuuZs+1R3SkBXyQyon5YJmGME/rK9CqzmQJSOPf4FQDh87t5k23BrpLIHFPsdiktF2AV1mgSdOCakKhi4J+3lR/oxwlL+q/f6417dF5zZLSi1sAYv9ti3Lez6xJUd7rqJr4KW7MnFEoJIJJJ2EVKNaBW5AxLkItfdsLheIJylY5DC1kon2VbgekCZnQvDLzv+flD9bJcYedM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ae113a-44a7-42a1-868a-08dcc8434395
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 15:57:20.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gF/vq76OIKkvJ05rcCtovVZgWccp3wu6z8OhkPRJNEKcfeS4De4I2bVlqDgLhzanbv5o8+Cg4nWbJS9OcI3DqSEpX8Y7Ag2DZzNKJ+6McY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7801
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_04,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290112
X-Proofpoint-GUID: Y7_40GtWTGjK3UX6hjf_41MdS44QRueJ
X-Proofpoint-ORIG-GUID: Y7_40GtWTGjK3UX6hjf_41MdS44QRueJ

On Thu, Aug 29, 2024 at 01:21:58AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The ERROR probe's arg3 reports the culprit PC, whose value can vary
> with minor implementation changes.  On the one hand, we do not want
> tests to be overly sensitive to this value.  On the other hand, we
> do at least want to check the value is reasonable.
> 
> Therefore:
> 
> *)  Change tests that dump ERROR's args to omit arg3.
> 
> *)  Add a new test that checks that ERROR's arg3 is reasonable.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>
> ---
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.d   |  6 +-
>  test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  2 +-
>  .../regression/tst.DTRACEFLT_BADADDR.d_path.d |  8 +-
>  .../regression/tst.DTRACEFLT_BADADDR.d_path.r |  2 +-
>  test/unittest/variables/bvar/tst.arg3-ERROR.d | 92 +++++++++++++++++++
>  5 files changed, 101 insertions(+), 9 deletions(-)
>  create mode 100644 test/unittest/variables/bvar/tst.arg3-ERROR.d
> 
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> index 001903ff..bfc77bf5 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.d
> @@ -1,6 +1,6 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> @@ -19,8 +19,8 @@
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u PC %u %u\n",
> +		arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 = %u\n", DTRACEFLT_UNKNOWN);
>  	exit(0);
>  }
> diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> index b11f6c99..3e7caac4 100644
> --- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> +++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
> @@ -1,4 +1,4 @@
> -The arguments are 2 2 4 1 64
> +The arguments are 2 2 PC 1 64
>  The value of arg4 = 0
>  
>  -- @@stderr --
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> index c23f9503..ec519f4f 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.d
> @@ -1,10 +1,10 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2015, 2020, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2015, 2024, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
> -/* @@xfail: dtv2 */
> +/* @@xfail: dtv2 d_path */
>  
>  /*
>   * ASSERTION:
> @@ -18,8 +18,7 @@
>  
>  ERROR
>  {
> -	printf("The arguments are %u %u %u %u %u\n",
> -		arg1, arg2, arg3, arg4, arg5);
> +	printf("The arguments are %u %u PC %u %u\n", arg1, arg2, arg4, arg5);
>  	printf("The value of arg4 should be %u\n", DTRACEFLT_BADADDR);
>  	printf("The value of arg5 should be %u\n", 0x18);
>  	exit(0);
> @@ -29,4 +28,5 @@ BEGIN
>  {
>  	d = d_path((struct path *)0x18);
>  	trace(d);
> +	exit(1);
>  }
> diff --git a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> index 8c601a43..be1f6d5b 100644
> --- a/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> +++ b/test/unittest/regression/tst.DTRACEFLT_BADADDR.d_path.r
> @@ -1,4 +1,4 @@
> -The arguments are 2 1 28 1 24
> +The arguments are 2 1 PC 1 24
>  The value of arg4 should be 1
>  The value of arg5 should be 24
>  
> diff --git a/test/unittest/variables/bvar/tst.arg3-ERROR.d b/test/unittest/variables/bvar/tst.arg3-ERROR.d
> new file mode 100644
> index 00000000..6c2f5206
> --- /dev/null
> +++ b/test/unittest/variables/bvar/tst.arg3-ERROR.d
> @@ -0,0 +1,92 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: The 'arg3' variable can be accessed in the ERROR probe
> + *	and its value (PC) is reasonable.
> + *
> + * SECTION: Variables/Built-in Variables/arg3
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	nerrs = 0;
> +}
> +
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* Error at PC[0] */
> +	trace(y);
> +}
> +
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* Error at PC[1] */
> +	trace(y);
> +}
> +
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* Error at PC[2] */
> +	trace(y);
> +}
> +
> +BEGIN
> +{
> +	x = (int *)64;
> +	y = *x;                       /* Error at PC[3] */
> +	trace(y);
> +}
> +
> +ERROR
> +{
> +	/* Record the problematic PC and continue execution. */
> +	PC[nerrs++] = arg3;
> +}
> +
> +/*
> + * The problematic PCs are likely to satisfy the following
> + * reasonable checks, though it's possible that some radically
> + * different implementation in the future might violate one or
> + * more checks.
> + *
> + * The first problematic PC is expected in the some range.

"in the same range" ??  Changing to "some range".

> + *
> + * The next problematic PC is expected to be PC[0] plus some
> + * delta, including some special functions that are loaded.
> + *
> + * Then, the next PC is expected to be PC[1] plus some delta
> + * that is smaller and narrower since those special functions
> + * do not need to be reloaded.
> + *
> + * The last PC is expected to be PC[2] plus some predictable,
> + * small and narrow, delta PC[2]-PC[1].
> + */
> +BEGIN
> +/PC[0] >   100 &&
> + PC[0] <  2000 &&
> + PC[1] >  PC[0] +  100 &&
> + PC[1] <  PC[0] + 2000 &&
> + PC[2] >  PC[1] +   30 &&
> + PC[2] <  PC[1] +  500 &&
> + PC[3] == PC[2] + (PC[2] - PC[1])/

These ranges seem quite big.  I realize that code generator changes and changes
to linked in code can cause these error locations to drift over time, but I
think I'd rather have smaller ranges with the downfall of needing to update the
test at some point rather than having ranges that are so big that the test
itself may not really verify much anymore.

For that matter, perhaps it would be better to rework the test to actually
compare the error locations with the disassembler output because we know the
mechanism that sets the PC for the error location and thus we know what
instructions to expect there.  That would allow exact verification of the PC
values.

> +{
> +	printf("PCs: %d %d %d %d\n", PC[0], PC[1], PC[2], PC[3]);
> +	exit(0);
> +}
> +
> +BEGIN
> +{
> +	printf("ERROR!  PCs do not seem reasonable: %d %d %d %d\n",
> +		   PC[0], PC[1], PC[2], PC[3]);
> +	exit(1);
> +}
> -- 
> 2.43.5
> 
