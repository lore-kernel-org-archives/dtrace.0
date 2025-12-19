Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76BB2D0C92
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766124339; cv=fail; b=lCTTUn6rH7AThVaszjV7d07ZN9zcKRp0eAxpDfGmf9HdUYuVeP0FRaroKokzys4tomHJFfjHhtDz+fSByaVopkKxBC03oaehiz5k4fb51XfpgRlM1FamLJ9nM8Zv9foXYpszFyqz4mb+6/Borp6xUytNzoJuTEWRIPQbJpvE5xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766124339; c=relaxed/simple;
	bh=9+f+egicNdBqHQl+vqJhH2/QwN9t2FhOTYBcGT3bDGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=utXxoUwSMYuJlteajxYMcJo/nUi3ablLt2iRJOTk9lGO5DaVD2CwyyrnqGukcLPTGGDSetKWYaw7yyIlItxBp58/vN9jDHS4KR5XEBYwH40Nz8SddGd7IP70YG0HeT3oqLi0NjVjeJwqnKAEyvb5UQP6a85T1N1er6dkR5iMnic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eqQz8CYi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eb0MVv6X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eqQz8CYi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eb0MVv6X"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ3EXZS2907442
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gyO3gkooIymHur7UOT
	F71AaWFeswXx+o3t1atmoMdPc=; b=eqQz8CYimbf/I6bliqbOofnoF8lBkzxJAc
	5x6zb/4jo9V6NL+giNPgsId47wbJF6X46p9r1IWFjzHTydv2cXJT07g2eb7ksH1s
	bQalOZfkoxb4VirOLLnOA/390oudNqbYRJuQAwLoHcRz95Vg/BcukqW387MvPz8F
	f8bMaNVEm49+yLPS2EhfLVQ0cFjYU1T3PdhjaCHoIYoArUZiyuXVlxLutr0WNMyx
	gO0OXZkGLYLBBl6rNMA3UtQoZayTeBFFuRT8EAGtRfWyg/5hqHWrGRorC2qE58ma
	mAW/G9wlyM+X9UHfuPrduyQYVIZpvZagpoD3vvzM5bjW9LwVtv/Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r2f0hr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:05:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJ4Ltpu036899
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:05:35 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012000.outbound.protection.outlook.com [40.107.200.0])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtm01rq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 06:05:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fk4ZtXMDxjWPd8A6ac5mEZcZejn+zG9RTyHhV/3gPzzKLv2sDgNqH0SOgLTPd/s9n7og0qwoQdhtbGD4x7Z9yJX7L6QESqvCkZrssz0PBx/2MXJoA31HMSKlvjMBtY4SeWwIbPbx5E8cxj17lIIq7RfifJiuauK399fb3ZsS5NALdK+K0Jus0BtSK8bPfP0m+MJfvr/C6Bft8jYr1LpfVSRZlkwGJxuglqBZ186xJc3YmH2zl1Xoguz/ZO7El9aIzCWZ6nNkAEUxDNt8i7Ws3Mn+24rtLekDvYhHJcNg6Owz7xmQnHTJmvCxtTuRDFMeo4ikz1d+2EyIc5iqWf3EVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyO3gkooIymHur7UOTF71AaWFeswXx+o3t1atmoMdPc=;
 b=HEre/u6FND8t8R8NpUopEqzF4kvxgt2iQXal4GL3i184unxdrkBd6aKIDQlWxAS29OFv+rkw/w8t8pnI5EsXpYgw3d+dXGsFHunify5+VM1488+Cb7IG8aby5K0erkhnSyPF3XfAF23Dy11nHpXDOim7OJT3duhFpjVSaoGdH2ODUnWzNyvSAj5M8ti/V6xV4ruqmLiekPpezHMpf0/LR3XGqW6gFrl7t2raX7aNwUVUlqXGHUJfbTKt1vNHMmDtDuG1SfpZ/+pXG0yBB5WbrhARPZiiS7zG0b8VYiO5JyyVFoO6NMbLC8Ka9rXi6mKQoS1Z5g2I5Z0jqfBP2l+SjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyO3gkooIymHur7UOTF71AaWFeswXx+o3t1atmoMdPc=;
 b=eb0MVv6X5lHgovdflCaM+UOMH4XRLTNukocDsqE8msGiVGKhCzvTZgxlJJbmxJG5a5Hk0ILXKLPr6RRGZKg9oDvGNM01GLHue+kZBTdxZmPpgS4IArp1PAzt02awUdR/VZVzKK4BBRtAOw7+gzoIxCUWvZKw5SDXc6hdN9WSeLw=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by LV8PR10MB7989.namprd10.prod.outlook.com (2603:10b6:408:203::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 06:05:33 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 06:05:33 +0000
Date: Fri, 19 Dec 2025 01:05:30 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] doc: Add trunc() documentation to User Guide
Message-ID: <aUTrKmzT2u6MjYev@oracle.com>
References: <20251211190003.10486-1-eugene.loh@oracle.com>
 <20251211190003.10486-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211190003.10486-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|LV8PR10MB7989:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfe811b-0e29-4e7f-e65c-08de3ec49eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2CT9PluKeoqADyq8Ab11Qq3K9VQcgZGiJkInwdqehTttWsbhiClpSWnMqy8i?=
 =?us-ascii?Q?L/vw/1g2A/wrZMTUZuqbc9OJWFr2mfCkcl2lujq8SMoZ34J4dhKN2HQlv/A3?=
 =?us-ascii?Q?IEDMzoGQ4PgrQcBDWzXMAuEOY7YCIABwnBZaFQLJU+9ACDapYo0pGqwx38hN?=
 =?us-ascii?Q?tRHAtRC/u3/4oN3frX5cI/WCjjYp+BJ0Fq+4ziTRmGBh//rsBAdjrPnClZ7n?=
 =?us-ascii?Q?MYnz5uUe7lxA8dYKRn2T0oim5HQWxZINjVgmMe0Llx9HeYTqlvm5VSOyjfR2?=
 =?us-ascii?Q?978KvZuoNLtedUiSX9jgBBUE+rDf10l00pLT9+HO1+WjcPCASYSq1yY4Z2qU?=
 =?us-ascii?Q?uNO3tdOZEuFW6qNIa7m2gRs5yS/i+3yz6fEvST/5fAhE2NigImdOpGE7EKsF?=
 =?us-ascii?Q?BtwNx1wlb86f0aTmXa5qcBxnxN6sNO6a+dRuPL3CRCfFFVirm7Mlth8wDdGH?=
 =?us-ascii?Q?dpD1uav4OsIVnTUc5SJQRobxAhyzRG8am5MXzumPfwke3oD8ZmzaeZOlr4j9?=
 =?us-ascii?Q?XiSie7foX5x5YjLMWEHezUhhHHt65AhwAiAMKF5dPw2X6hKsMM7ic21Oz5UY?=
 =?us-ascii?Q?DeQpFVbbbRoGDNa1LjJB4t/3t8PHB6vFvQP/p9SfFKFaRm3QMnph54AC3u0O?=
 =?us-ascii?Q?yYWrVpmknqh+i1vLjbmAA2JG7gw15/bs2udlTQC17rbAyrP+V4+8pw+YFkQY?=
 =?us-ascii?Q?DJMvjxQvbMflOHH5eEstM8dRa6J0kWkQchcx/3iL3DuPdxMM22qnTBwWT1++?=
 =?us-ascii?Q?QnjzXVidzkKmeoTu2+lbxdShq9Ekf0cpHAUvEMkyPrRM4UZ5TkkjXcHiLpkE?=
 =?us-ascii?Q?FKY4LJFBBNO1Ut/nB6uYmSAFwYRQSgtvVVLBJovk3n4pfcvfLPFNgsH8VqnJ?=
 =?us-ascii?Q?7zLMmmhccbI073B9qAqcvoMqu5I2fpVJnFeaQj/qFUBIs951hnDAGDdeyNkC?=
 =?us-ascii?Q?1KJfx3SrpcNZjausDJa6hFhurimLoJB0K1xpTQdxDebvsorAAbWezhhGwfUX?=
 =?us-ascii?Q?1qmUARAdxxqVs8ddvCAOa2tnHIqal4MTzcI/pXjDRbPb99h5iKE3h7BufRqK?=
 =?us-ascii?Q?m3LkSHyTUW/1rmFTqancERjaTxERi5aS7iICmrJARBYfb6CDnSx0MwxR7kwF?=
 =?us-ascii?Q?9S9xV7R6WxhUJHDGvs5cPOi6z5qetu+nclPbp2XNXdCAF7yEO5uxUPsmkbmn?=
 =?us-ascii?Q?WNc6GJ+Lfytb7n2XscqkM3mFIay1KqZUc3fc1tegdpSa1caGj4saCBShSFgh?=
 =?us-ascii?Q?P0nSdUzEzwaMCDZRg8HSbNhsvJuJUWhPvz4mHHNEqA7BmhNDi252tDTeNISF?=
 =?us-ascii?Q?eJb3JKTM2e4HAlQPXVf1IrVQ8smNUZX/2XhiSNgvXkIyBioDCwBp5bcklb+H?=
 =?us-ascii?Q?tIGot/z9cjRnurura4NQ+1RJSqkT9niyu8WqwzYQq3sYThKd4SZ9qoYeCqvE?=
 =?us-ascii?Q?hy7ukEJ0HAM9GBGHNfAeyDB22p7x2A50?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?toJpYQDS5o5lbCYqVfCihN1AWXGh9HDTXhXnBLtXaW9Mnyr8YKA2K4bWLQEc?=
 =?us-ascii?Q?pPcxTrXMTw0wPN0LPfFhBvW+1mRYtCfPSSVWIBqM4GJB5d/DHLFJ8LaNlxjv?=
 =?us-ascii?Q?o5aEiEUBy3sKaJVGll1Ztq4qUE9UZfgVmQQXQl8IWVw2MbJMMahO+LmOzmbm?=
 =?us-ascii?Q?ZKQ+t8FtkNv/AD+YDrEvIUK+RXZVxPgGKjK3kQuEIz2rwI6cyOmLFsqlqNlR?=
 =?us-ascii?Q?GPch7PRAUtxDU3qUxty6gMS9iFE4lnpC8wjlNHk+vFclvfsnagt1MKXVJxjZ?=
 =?us-ascii?Q?F/S/eCv4pS1EwQAKjGgDQiOmVu/yPi7zT2hWGFd3OkTXCPCHu0S7dfRMLh1p?=
 =?us-ascii?Q?CtrOA9OvclcAIVC2P3ni7Mijt3XRitnDRXuQ18cyVo70Ip/67CtluqYHbTuG?=
 =?us-ascii?Q?zS3njqCbvWx5nCtHy8Q/8fe2lj8QUGtJqpevOq/IhTK8oODurgvhIwz/meom?=
 =?us-ascii?Q?FYR/Xqw43vwr/INjm0S5EM1qrra+vft6GG/R6Ny9lNnQlMym8SEpRtlrXb0E?=
 =?us-ascii?Q?a71g3MMFkN3htiWpfjyeXI0v46Boqz2bvzos1HJAgO684/qfdy1omnMTA5mJ?=
 =?us-ascii?Q?pjCA+/3q/GwucPLtlYUSCKC83/+DwRx5zoJDghRLsKtspDa+J0GfKLGjVO9a?=
 =?us-ascii?Q?6XkvhVFD3rsU5Shgjl7G8KycF+HZ23Vkdyk6GgQ7PMfOUfrXitZccLK2fyCS?=
 =?us-ascii?Q?U6o7KNJ2EJ4WTguUrrEs5KKZKiC/XojHRn0M+5o1zlqsUZrVVg6oGn9BATwl?=
 =?us-ascii?Q?/CNxe6Qi+gUgJdJI85LmUg6gNtyLX3BMyCVsh7qe2usRpj5QlXmPH74AJ2wJ?=
 =?us-ascii?Q?aGW+Cz3FkF9KQm9SEHgM13Dg3a7SfR0JwAeWO40wsZJU/Bn77CZ9OU+PZA1g?=
 =?us-ascii?Q?OGOydtqiw5VftwUVuPWd/9tX9FG8ZoHPuhEoqrrBL1bWrZTF15lpHApwSfWx?=
 =?us-ascii?Q?umdEMOAby9w5Vq5lNC6Y/WUbRNhRPWKPrxEXFmch1MM0n1gRUUpg4v7kM0I6?=
 =?us-ascii?Q?R+zhpcFKMpmpqOfQjBVbl/lDqhpDhe3UNzO1nRgzZVT00mMWtxXiyyM5D+My?=
 =?us-ascii?Q?hMFmPyxU1XJSOAVfHKADmvRDR88a8b+1nv1mWFqvMvWUqHFzXSPOA2EZN60v?=
 =?us-ascii?Q?pIJeOf8+0lCQWLwg8nImdlxRBulZQCDYy/gPrWuMyE+xm/bNFuAOn7vTBvWt?=
 =?us-ascii?Q?yGhuM6s3pRkFTjqNHhATZOihqiHaIViIb/ror4JlJsnTBtJ9AD1snUP7l/AF?=
 =?us-ascii?Q?FFBqXS54ngDNs/ttfqNg7l4kOxdJnK3yEMixQnSzMUaXuAtvmc2zUP6KMf5O?=
 =?us-ascii?Q?7/9Ser3/i+bfQzyIKSRjWMv6NVcssYRxpN2xdYTv4cikd2o/Jfu425jpWxzS?=
 =?us-ascii?Q?6/+gnVryM/nS8t2vl+VqSonMbDDP1tru47ruSmTOHhQdyld7QHLyZaxNkHxk?=
 =?us-ascii?Q?OpDVkV789GknSSK9jqotBGzHQkaux7s5tC0/H7H3qQ7z0il6P2BUpA+oWm4M?=
 =?us-ascii?Q?z0O30jIBttmV04r1ys5G0sNzlhWZD0mNjTbTJqbae20RM+0xChQI8F47O8r1?=
 =?us-ascii?Q?F3aSLSuC52nMbbxUB84QYShMAZ7pEGRFsDFPK2qJFtZM6TWOPtXyezplNi9M?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uMUfH2tpBumHGVxhfIOQq69lLyJ2WnS5OIUzX/HzYmeFSUi8ra13ywESY7iKI1wKGtQhtbUUs67mPSyZMZ16PpG+rVgDdYeZuq4XnF0muH6d+fGlE2XdHYQOo73CH10OTbiqDHjFRiYUgRdcdUqJlWz+5EQ2AkOdo/lALlC2tuZqoyvyMxRhyL+khWo5iOU/v/no2ifYm7QUAdjVBIXEWYRdFpOeHyxv8GtWI6hL9Fxi6AnhNEmzVHKB1p2XyJf7CBB8sxS/kDsu3B+kYtftFs9o+91EyJG6mrrx/1/16bXAniSsgQx9Q+ZIXG+SoCwsILq3cWsA5Xs/HW2U9gV2qhRgPu1nNfPUwC7xGwwM16MiTEdd4H10B/id5gKWEkmv9klVelKgRHIjw2yZ/LhcXwlcTKVdpwnJ7/N7VEUFHmEVwzib/1zuK/QGm65uiq0kph+C96F8s90VZ4ETUHQ8TdjlUsy/PCVkuw7CkdJFPlW52hrpx/uNFbodTbtTucUPGl2dryDMsB9ImEaVF7qAKVq428uamK4K1mdnXR6IQnGZ5B/z69y9sE+mhdPAnGrGWThz3xBwno6gh493Z4rIHVy5pBCQZUthdWJ4CG2Dy4A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfe811b-0e29-4e7f-e65c-08de3ec49eba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:05:33.2585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTA8QRVl5Hm1f20ce1sRUc1C0H1cP0rsQOVNGQi788LXuVOCZAI7xCtjDNB+IE6n2DzlLOJ79rfP7GyvGUcMHwWKQC9xdnKa+prKuQsnSgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2512190048
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0OSBTYWx0ZWRfX/q/WA41vs4R1
 OEATfjWyARZGXNJrFL2BCx/A70ACGQkYt06AZFskrZvM8wiV0wx4IafEt0Ut+Q8W1hvnZEzCyuu
 A7i9Zl/QOPbSrWK+4wFK+bHcb8BxspfQViZErjEizwkkTSY9xUpHvp+gCMD88L3/1BkInzbC2Hx
 v2RN4RYTA/4f5NwqcTMCucguHnSYfGudeIKTMEHfvTnhTxWDtNUZC/dOgjtUzyawp100mwNAOlB
 zu1GbWFAPf9MkfFAUV1T+1JsqMQRX6I64c8FTvtc/l0eDc6E7DHH7lxHUnr5J3yYWxyelu5RY5b
 dFMGSLl7xB2WyzstyE/2K6Etmz8otEoLYirnVPgD3MN9JRtks6UOcZp0OAACUv2RPo2CisuARRC
 RJWo08DOTBDsdO4JN/s9M+4vG6VtmELCfg6gCq8fFlKhJF40i3/8JVGV6P0zGyD/z1ubII1bHPy
 QECEks5mGQfgQeJYlELvVIHWCKyaJATvSiNfDYms=
X-Proofpoint-ORIG-GUID: d2DPYYt_64UFI3ZJmsPCNLuUkaEHJKSl
X-Proofpoint-GUID: d2DPYYt_64UFI3ZJmsPCNLuUkaEHJKSl
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=6944eb30 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=l6WKldDIN5TnYGOKiMAA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13654

On Thu, Dec 11, 2025 at 02:00:02PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  doc/userguide/index.md                        |  1 +
>  doc/userguide/reference/dtrace_functions.md   |  4 ++
>  doc/userguide/reference/function_clear.md     | 11 +++-
>  doc/userguide/reference/function_trunc.md     | 53 +++++++++++++++++++
>  .../reference/unimplemented_functions.md      |  7 ++-
>  5 files changed, 70 insertions(+), 6 deletions(-)
>  create mode 100644 doc/userguide/reference/function_trunc.md
> 
> diff --git a/doc/userguide/index.md b/doc/userguide/index.md
> index 7d6b1caec..3bf731c67 100644
> --- a/doc/userguide/index.md
> +++ b/doc/userguide/index.md
> @@ -179,6 +179,7 @@
>      -   [system](reference/function_system.md)
>      -   [trace](reference/function_trace.md)
>      -   [tracemem](reference/function_tracemem.md)
> +    -   [trunc](reference/function_trunc.md)
>      -   [uaddr](reference/function_uaddr.md)
>      -   [ufunc](reference/function_ufunc.md)
>      -   [umod](reference/function_umod.md)
> diff --git a/doc/userguide/reference/dtrace_functions.md b/doc/userguide/reference/dtrace_functions.md
> index 9a4f01363..7bf37794d 100644
> --- a/doc/userguide/reference/dtrace_functions.md
> +++ b/doc/userguide/reference/dtrace_functions.md
> @@ -57,6 +57,8 @@ Functions can be grouped according to their general use case and might appear in
>  
>      -   [`printa`](function_printa.md): Displays and controls the formatting of an aggregation
>  
> +    -   [`trunc`](function_trunc.md): Truncates (eliminates keys from) an aggregation
> +
>  -   **Speculation Functions**
>  
>      Speculation functions create or operate on speculative buffers. Speculation is used to trace quantities into speculation buffers that can either be committed to the primary buffer or discarded at a later point, when other important information is known.
> @@ -392,6 +394,8 @@ Returns a string translation of a hardware address.
>   Traces the result of an expression to the directed buffer.
>  -   **[tracemem](../reference/function_tracemem.md)**  
>   Copies the specified number of bytes of data from an address in memory to the current buffer.
> +-   **[trunc](../reference/function_trunc.md)**  
> + Truncates keys from an aggregation.
>  -   **[uaddr](../reference/function_uaddr.md)**  
>   Prints the symbol for a specified address.
>  -   **[ufunc](../reference/function_ufunc.md)**  
> diff --git a/doc/userguide/reference/function_clear.md b/doc/userguide/reference/function_clear.md
> index a36a14ff8..de620b650 100644
> --- a/doc/userguide/reference/function_clear.md
> +++ b/doc/userguide/reference/function_clear.md
> @@ -7,7 +7,9 @@ Clears the values from an aggregation while retaining aggregation keys.
>  void clear(@ *aggr*)
>  ```
>  
> -The `clear` function takes an aggregation as its only parameter. The `clear` function clears only the aggregation's values, while the aggregation's keys are retained. If the key is referenced after the `clear` function is run, it has a zero value.
> +The `clear` function takes an aggregation as its only parameter.
> +The `clear` function clears only the aggregation's values, while the aggregation's keys are retained.
> +If the key is referenced after the `clear` function is run, it has a zero value.
>  
>  ## How to use clear to show the system call rate only for the most recent ten-second period
>  
> @@ -35,5 +37,10 @@ tick-10sec
>  }
>  ```
>  
> -**Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> +Each 10 seconds, the counts are cleared.
> +Since the keys are retained, however, keys will persist in later
> +time intervals, even if their corresponding functions never reoccur.
> +More and more keys will be reported with counts of 0.
> +Thus, you may want to use [`trunc`](function_trunc.md) instead.
>  
> +**Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> diff --git a/doc/userguide/reference/function_trunc.md b/doc/userguide/reference/function_trunc.md
> new file mode 100644
> index 000000000..b15cf3fe5
> --- /dev/null
> +++ b/doc/userguide/reference/function_trunc.md
> @@ -0,0 +1,53 @@
> +
> +# trunc
> +
> +Truncates an aggregation, meaning discarding aggregation keys.
> +
> +```nocopybutton
> +void trunc(@ *aggr*, [int64_t *number*])
> +```
> +
> +The `trunc` function takes an aggregation as its first parameter.
> +While the `clear` function clears only the aggregation's values, retaining the aggregation's keys,
> +the `trunc` function removes the aggregation's keys.
> +
> +The optional second argument indicates how many keys to keep.
> +By default, no keys are kept.
> +
> +## How to use trunc to show the system call rate only for the most recent ten-second period
> +
> +The `trunc` function is used inside the `tick-10sec` probe to clear the keys inside the `@func` aggregation.
> +
> +```
> +#pragma D option quiet
> +
> +syscall:::entry
> +{
> +  @func[execname] = count();
> +}
> +
> +tick-10sec
> +{
> +  printa(@func);
> +  trunc(@func);
> +}
> +```
> +
> +Contrast this behavior with [`clear`](function_clear.md), which
> +retains keys and simply clears their values.
> +
> +If the reported aggregations have too many keys, you can use the optional,
> +second argument to indicate how many keys to retain.
> +For example, you could limit the reporting to the 5 most common
> +functions by changing the `tick` probe to:
> +
> +```
> +tick-10sec
> +{
> +  trunc(@func, 5);
> +  printa(@func);
> +  trunc(@func);
> +}
> +```
> +
> +**Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> diff --git a/doc/userguide/reference/unimplemented_functions.md b/doc/userguide/reference/unimplemented_functions.md
> index 942e16cf0..f69600b56 100644
> --- a/doc/userguide/reference/unimplemented_functions.md
> +++ b/doc/userguide/reference/unimplemented_functions.md
> @@ -1,7 +1,9 @@
>  
>  # Unimplemented Functions
>  
> -DTrace implementations have varied in functionality, and some functions aren't relevant to Linux and might never be implemented. The following functions aren't currently implemented:
> +DTrace implementations have varied in functionality,
> +and some functions are not relevant to Linux and might never be implemented.
> +The following functions are not currently implemented:
>  
>  -   `breakpoint`
>  
> @@ -24,8 +26,5 @@ DTrace implementations have varied in functionality, and some functions aren't r
>  
>  -   `stop`
>  
> --   `trunc`
> -
>  
>  **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
> -
> -- 
> 2.47.3
> 
