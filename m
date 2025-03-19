Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FA01C4A24
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742395736; cv=fail; b=rCYJEOB6pxZD7T+/jdXitqJO04L/Zzk2UzrdlekKfW/AL/LPW4jyfJSS1bnbN0D9T3kgKQrdxuR5xeB0jTeWZtqJxJ9l3irE+bKtfd9uHSjRZ2GisEkx9RWjJKu4pjqk7BniuVFBVMrxesXJYjUJVVzFTj9KSCS+i9pPT4Rz2RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742395736; c=relaxed/simple;
	bh=s5dhsZluh3834ka7/odzDglEmI5diSYeV77XFS/g+X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uIsdVfK58a+zokh+oxL/JXRSwTHICJyez5HjfE0778/BlxlhvOX2glqt8Ah0QbGsFMO8E8hdF3nRP90uGvwYe2YV081bkBGR0iOkGKzu5gaGIaVWlNB/7QJWabxk7Z6lc8HHNsnJrQD3UficcozMdk1g3Go+/4txGVGignpRgtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=E6k2v/zF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ssnQ2USo; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="E6k2v/zF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ssnQ2USo"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JE0sq9027880
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=i80DsOvI4A1bwb7NTs
	C3nAowTUab5tNT4tMpUD7A6fE=; b=E6k2v/zFJVGYvZbG6Dpvn4LMjkATgGHRD6
	kecA6X4gLLIOVKdaADOzJ2KMCEhFi/NqA3TC7ujHEz4xcyr413uUSdOoZYbRRRU/
	/RcAH4mvTDfEtkL0NOCFyNFevTbipt8fVCTY3qZdHp6eO6liyr+UmT/TaCK2HxcO
	TEJZz4M6uKtqzH9yJHSvwNdBOU9Yfc+rshsvaOCf9F7BH/CbZPMTwks7cofiJBn8
	Y8XYAjDcbv2ym+BrZMBHwOPqevIk5QNorKufZYhM4ozYswWTGVcSUV+3FL9iJby3
	o8nKv/GdLo7GMqNWJcrUx1V+k/0eZk8yXFV6bX+UZKqH3vme5ojA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m13e7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:48:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JEcWqX025067
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:48:47 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbk15tp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 14:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoFfgkbVQJFzviMADmM0LlyltL8MC3WotWNp+ZMsZy7LCNdGLSdCZ10N4weEsgCcMRJOMdKp9WkR5NSJT3gUrKQuNeEtnA/YBCHyRaM9sLHK2Si9a6R8feSvIa7GhVd0e6NbIxzBKBznr7gM85kDqVItprI7AOBk7G4hxQyeX19SXG9uAuf9sT7cPrnoeqND1JkbjYGFu1XW32n4LiADYf6MAPjOFlHx7n4cCFQelZp28G6mieSL+FEluZdB8nEtRZEXqp1gzJdOG0VBSSS4B3y7zcYvz9XpMsQsuDwxFQZsW1inyualLIRTNh79JqYpL/QLC2ZWLDVyjUQrj4xZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i80DsOvI4A1bwb7NTsC3nAowTUab5tNT4tMpUD7A6fE=;
 b=DWvFAGzrpro/5puiLuR48I8TyYy2OBR2X/XLae8CPTRIqhU6mxuvZR8YYO3uL5JR7Vy0cENmkvjjSavfZmYgtdD1wfLL0ZJsHJ0/Sael8DMRjw0udOruyavy2oR88f1m5oPmB822OIdRRqfjQhMgQEb8wLfoxoJO4IdkJS6VoBHwWEhPZkaRdj4UPxNvEchwf6V4Xu54Z1RNlpPgtIbFJMdKrCwacQ40N3OoE66tjBPe3l1Iyy3Es23+JvPD/G6RUgGRsT9dMxXTc4Tt7l5y7qH+C9jNp+0M2uGGUz53uOH5AuYGlEK7vdrRzSTwLJBhgMGNI+mVPjLptfv7oK+qhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i80DsOvI4A1bwb7NTsC3nAowTUab5tNT4tMpUD7A6fE=;
 b=ssnQ2USoJV9fxUnnuUav3JeveaqgGRV2SIZYu6X/uh7P2MdCIx17Qo2CP/D8hyVnu19nq3C9QNtifxUepDuNOiI7TpL3e2OmBmmRMrwUlO1nl+ANu4f3aBoHI7fNyDMUN4Fpid8TezQ9FH3efKKp97Rd2YZX7EawJoGbFq1w7/8=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CO1PR10MB4675.namprd10.prod.outlook.com (2603:10b6:303:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 14:48:43 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 14:48:43 +0000
Date: Wed, 19 Mar 2025 10:48:41 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: "eugene.loh@oracle.com" <eugene.loh@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] Fix format specifier in dtprobed.c
Message-ID: <Z9rZSR8k4ru8wS48@kvh-deb-bpf.us.oracle.com>
References: <20250220232730.25029-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220232730.25029-1-eugene.loh@oracle.com>
X-ClientProxiedBy: SJ0PR13CA0240.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::35) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CO1PR10MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: e8f705d7-2293-4ea0-0d0f-08dd66f52540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Te/2au/3nHF1fyKNvXJ12aBS3MQGgyimgC3hALIrVc6IjWS7/GL5HvndYXsM?=
 =?us-ascii?Q?hVZlJHPCiqyhn10yWqIrv+T71Um3xtiuZyIBFd5D9fX+kvY1MeHMqy1puCaC?=
 =?us-ascii?Q?6UhpoT5fuo8UU/+KPlb47GpPGcxIoZDEmVx+tbaZLyjau5wTvbtzOtgCNPt/?=
 =?us-ascii?Q?M4V1Mq3EKh3+hQfeZWiQ8Jo5Z7RMM7ZVBAi2D15Bw9Ucl6VkMP7Jwft3xEw7?=
 =?us-ascii?Q?Rp/q9kjQI/ynZGLScy6PBz1VoyhzWmqgKUGO/eUOhq21q9snNjePQtYhKohh?=
 =?us-ascii?Q?5++DGWXNqHsqk06eye6xYKxdxWZshjxk85U6HjDfVSTAD5ovubtRg58vdER3?=
 =?us-ascii?Q?dWWcPXIzmQPT2plX+Oj59K7eXZN7ywwvaqlp+p9baQ+UHzmZV7o6Nbd158VQ?=
 =?us-ascii?Q?hsWmDcBkhzMJxrhHgSCwFby95rd3EjaWaxp99lyehGINMAEyBETSxWrtE8BM?=
 =?us-ascii?Q?ltUB2cSGbEKk+LYrVuKCOk9N8KvRViK7AUUOhNAF3s8ZiqUC41pM4bDmvgxO?=
 =?us-ascii?Q?+HlSWe+7e2lzmNnpsrULIACvM2wSMZLMjZPBvss39nMssyz6fHK0lOnD1vRC?=
 =?us-ascii?Q?yzCV82mXdk1pvtoB8zHJoLbQrAjByxT1ULKnlZW5ao1zIl2AOkAYbDN2QOnb?=
 =?us-ascii?Q?0vMxzX6YQg5olFKzGBoIgc3zhN6w2SQPO6jw6Kq9Lx+ONudVCEQkr1NFO6/G?=
 =?us-ascii?Q?dt5ncQKXCggwaQ6fRfe2mWLpdN7wmOZ5ret0XJ5UbzxnCja3+k05wrmjsNc1?=
 =?us-ascii?Q?o6+NbZ3dj1rQSY5lQPsNeh4NCZtsRiHuTGPZQgDItbQK4gkQ12pmwOVPwSgL?=
 =?us-ascii?Q?6gXz0C5n/yln0+kY+GYRJXiJBcdAgsMcZLyluRH4n/ReqyPjwDvoDLYmNN0G?=
 =?us-ascii?Q?AtBW67tp8QzfkXyQF5eKPO0Zb1phn2ogR65DUP4L8AckB1G++O+nc5vlxDSs?=
 =?us-ascii?Q?zuJ2u0uugONAi31/AKrfKR5oFD9DgYTnICQKrYapD6QDU3ixXJobAjuMoDsu?=
 =?us-ascii?Q?XYEnANJ7bYx6c3v7D79yMe7ki8+4L7UG9iiDXjeOOqja/m2bDt3A64dVmDHe?=
 =?us-ascii?Q?gcuR3TY5rEUbsFzpA0Cd3XhH0j9CSCI6eLH6y5YbAynipdWoSXsaRQ+vicGD?=
 =?us-ascii?Q?rHYslFUyxcMOB0/ye3ue5xudkTcXJq262dGQbSFmeiyf4zRPZaDdisRQS7Ib?=
 =?us-ascii?Q?gj2MOIBNIa0bcyJKIcXnPeiuL8iv28sQF8SbGc5JpgPhENDnoojkFuc4aXI9?=
 =?us-ascii?Q?VqCa9cBVqi0NYzJu5DAASuOtHvKD9FjeGh6NA1czZGCUFt0nwWE30YQlYfba?=
 =?us-ascii?Q?UvEFPtqK/gBpdBf8KOuAJp005SbrAAxqE86MEFOVWokCr5yvBeF0RVTCQve2?=
 =?us-ascii?Q?UHaoye+VHGqB5hH8ipRo8n7kd+3E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4sWMcQQMlkavh2SIhSPFWzBfrNppo56TPNEvtaDFv4Xs9s75HVwZk67U13+y?=
 =?us-ascii?Q?Wnh6/u20zs/G3bwtzlgq7iqk7vG0akKZtKb4al+LX17j36CwTrsRYEFTaGNe?=
 =?us-ascii?Q?bwLK6k97T6Av0uLe5GZm3+uK4Kfr5hsPhLS8XSS64BjoU4UNw+L3zLO1XOti?=
 =?us-ascii?Q?SMwT9Uy1BetkHenr7+OfhsE+elVGaDsEtmAzNE5pd2KP9a9fqI+3RhDEGT9M?=
 =?us-ascii?Q?3vhaTspo8UVjlCPcCmpShDG6znujFh71H6I1Ie/TXdnejfaJgGUCqMb/lwyS?=
 =?us-ascii?Q?s27EyhSZGDPb+StvMqUwOwHmXpH7o4wN6GCQDWfmLsMGzDnud9pLIRibQ77P?=
 =?us-ascii?Q?IOZkpnWLgZTgC7cMzBA5N/AXvt75xV9WuUo2VFbUSdRFxrDL+SBTcKGDZ2qn?=
 =?us-ascii?Q?lWQdvN3geySnZeVDqh//VKZJXz8pa7k4z6cSecKmS70oNf53+F5GKce5xE3j?=
 =?us-ascii?Q?3xQezQdpS1YjqY+UkzJJSkrNmEa6fS/MPmttgNOEVfRKBljdpEZI4fLXX91s?=
 =?us-ascii?Q?LrQfFDH089C0NTC2Ya0exeW2o/W5+p/L1frZMM8VrWZM/jl0T7TRxGwQ9tU3?=
 =?us-ascii?Q?w6+RQrvtWELbdATLnpRAdP/19wolDZQfMsEQnrNndhI5kw3fGmcR4lfSOgCm?=
 =?us-ascii?Q?HR9In+bC6y5EJHf5SiWX6l1L1J332X1OZDrs4AiYU6Y2+QbG40iNyFWVnoVO?=
 =?us-ascii?Q?tFcFN/htrhypbdhY7WIZdRGWl4ckuASCZI1INwslLGrZuYzXo2bEFQE69Fbt?=
 =?us-ascii?Q?gieIZg40Qu60xVI62U46VvcIUSjgBwtdN4MNZwjVz1dOCXYHtL2/nAUs3pP0?=
 =?us-ascii?Q?NOeqjD4K4mwsi81l/HDvZ1tBl/bzOSzV6WHsqlOkaC6rP5vZZT94uXQT98DA?=
 =?us-ascii?Q?+KBSDFuKEZKcabBopzuuSTOX6lnfiEKBLPgSP39PCaYiodU25LtocnJ9pQ/x?=
 =?us-ascii?Q?U+8aY6UxNvJUSfTa0hGoSLj9gjaHZ6J+7qLhdzUzScslHed/eWd76L5snFl1?=
 =?us-ascii?Q?WineWwRNRLeF630E5voOm/Xk3aUgJueXb1YfYIJ5XtvGDNAYsR0pWnlqrPb1?=
 =?us-ascii?Q?7tHfxkW0OD2jX53GXgIbm32YotBRzLN/nZpejreAkNefTeb61UA2070Ta1qF?=
 =?us-ascii?Q?GEVSKVKJmHkPJGPROHYGO4SXZz4sb7hEjkMcHuaRVUJLp31R+KiKrgEw7NIn?=
 =?us-ascii?Q?M0PyrCT99+27frCm/0wey35n+zsIi0STQ+GChiHqOvfJ8GgQVFoix4fKVkH+?=
 =?us-ascii?Q?0lvP+RUth4y9CVQNzcJynimbIUDbJnwa+vsv/iMB4/MGEVPU/d9Lr/6OZp8s?=
 =?us-ascii?Q?lkn/u19VRDA3x7LruO3O3wUOARhf4RuwFbGWXQcqDyrFNonzf7LWneT/48Mm?=
 =?us-ascii?Q?6yJ6rE6A3TFBpj9DYX7swN6KsvcNXj5Z+BS2uZZyBzJBm1odSh0gbZH7QoIT?=
 =?us-ascii?Q?/JVI77Jyavrh9KPo6pNUissOk3tODO5kR/0hqdMi95Qk2+JmZB4TAMMkmtrU?=
 =?us-ascii?Q?D9CZl1puOCArmjXjQ+3Yq771vrXK2CFUfAq3/fvyGu1JX4cOX7eO6rl/zyFb?=
 =?us-ascii?Q?tO4lpKsv0YSrOkHG5so69sozpg3+65s15Vh2VhhQ+vlR8s2rklhiAtpAl1J/?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G3mLSz+df8XBfUxyOpfo7tCToeif5fCv4rAG8Mx2UJbbKsPZdpdihZH+2X7KGS0AtbFWFkXUwdVgReT2plLFZ4RZkPUIOfkaCReCChihZm80s4F+BacvFq2jujcoU8jJkCbpt9pu99KfHd7CRpXAzLKnuhIu77Gmi9qcYmsx28z2aNecreaDYF7JIX2I8cPRGv3PB6sZ9SPX0bdjlDxnlbkERP0A761lFcFmIJKsD7yENpQljTieZo87WzMqf26A2Ul9vtS2SqDQXnfJd0CcoBMMBqoT8n0YLvhbyuXDF0Iwmz2LInCi11GlyryD05FMs810rctPe0c4bz+I/QAauq+1Lw22b1eJYDluiFfbVW8J1oxy5FAj1L3rTQzFEjxQLbgyAzgjLb8dJvi0wBmlNmEXOiFnrw2CKEKN7swlvV0obvHb3a+V0/giacXFfnHR/Ve+IovbUmS2t3bCzFSBsQVl9h7LRcDoZNYtaeqC7ftCndsE+ff+qUlM9Sce4YwCFLJXytB6qQKMXEC9Ki0Mk8N1hSszKusWyboAASqMFoJEAF1ap/ZCubM/jJRq1xX7sOHWR43CwtrIg4hjknWQKKozgbOcrNMtGx0a2aXwN20=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f705d7-2293-4ea0-0d0f-08dd66f52540
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 14:48:43.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4+NiwL7TNYTuNrgSMJI0lMGymJK0EqYbTQ+Uj406vH1RkvUnwyBQ8aB9aLQKIwzICVP7aVIe/z6CPu3BP5yMjprzR+N0KTn4QeHmPJ/E8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4675
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_05,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190100
X-Proofpoint-GUID: wjhTMsKaSoLVQssb7lFQNqEjYOinctIG
X-Proofpoint-ORIG-GUID: wjhTMsKaSoLVQssb7lFQNqEjYOinctIG

On Thu, Feb 20, 2025 at 06:27:30PM -0500, eugene.loh@oracle.com wrote:
> 
> The format specifier is %i but nprobes is size_t.  Some compilers
> issue warnings.  Change the format specifier to match the type.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  dtprobed/dtprobed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
> index 7857b3200..5f260f0a4 100644
> --- a/dtprobed/dtprobed.c
> +++ b/dtprobed/dtprobed.c
> @@ -787,7 +787,7 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
>  		if (dof_stash_push_parsed(&accum, provider) < 0)
>  			goto oom;
>  
> -		fuse_log(FUSE_LOG_DEBUG, "Parser read: provider %s, %i probes\n",
> +		fuse_log(FUSE_LOG_DEBUG, "Parser read: provider %s, %li probes\n",
>  			 provider->provider.name, provider->provider.nprobes);
>  
>  		for (i = 0; i < provider->provider.nprobes; i++) {
> -- 
> 2.43.5
> 
> 
