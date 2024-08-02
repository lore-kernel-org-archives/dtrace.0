Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7E211C
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722576715; cv=fail; b=Cb0+TrcJxkiteTHfk96xSLHd4cJhGnCYKbSGybsKJByDaLYJNd5g9PBb0PNSz33ScxTXOuv39hsJaYOxB1x0FDZE35lKT/zHhYuN+JnxSukyRhxYUkXfvm80yAnLk0EFSz0izFusjtf7/+ssu5EzcTtshFPwg2zM9kIjbDwQELs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722576715; c=relaxed/simple;
	bh=AwF4B12mGSk+uqS9oDdW/wWAL2mUV7N2MXrE7fQS3L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CBpKfeGgSBRZ7fcRiAsYYRJPNCjeWCxO23uAXFbPueKP6ClQPwnA2nUbyGspn5fnwM/p4cfJ1QKcvHn/4sASpECNbgylIuQI0C6yauDqVQxzdavKK5clnHlaV9kWg94Fy8fX023E/ll4nVPzVH3HH1FXAEtIRJt6kpsu6tksq4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZH84kWXc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wf1+km2h; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZH84kWXc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wf1+km2h"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fVp5014370
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=IMJCvZQ4CRdzcHl
	D5kmAgjDUrv6hrtgzyAhsCpaDEwY=; b=ZH84kWXczUU9tfqkKz1awxlaCdCz1sP
	enwindVyCt4ixFduetJC9ycapQjIFrrobxfVnE9QYSrTSvjtocrW5XH5qo52Waik
	cosD+h9qyoIAEsoSjxuYUKxMio1VVfOeepL8fIHNSHO6O1u1rX093bB0qLnFJr+u
	Wju/8D8VcwH9UGUqyq+ony8zGsTNr6YXVaRsqQpaUBEv34lZrJqBZFMsdrI0lWG4
	1LgVyYvPfzk2rQ0uODjYKkAK4Fema3dyaxibSE03HG+I9QsJ1RP9JMgVS7/p4N2b
	6vtdk2lySYl3du4rFeSLdpfawuMTBa5KKfrDE5MtL+JITTpEI0ZVSYw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rjdy0e4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:31:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4723aNBo019006
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 05:31:52 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmujgad-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 05:31:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L730wnHa7YPni8cspRMrR01eQIWdnmbb8vBNwyB82J6XggTiZOY21TB2r6fsAFp3Csn+SbZFaE5JjwgWelSRH/CuPyW1d13Xb6bnWkTryG0EjsRRnPmK3VV9sEBXgaY/d+G+AiHB7+uVNdbm7Euh6KqUjKEUxyDrmEd9U16YMpTUkU31dmN9XOfhss2OuUoAJaCcZQiaxI2jNbM6v2cZCDWd5JmcypYmoPemxf24pH0tKPWomoL9diFzrzBizg1RfvbEBw3lawRGB+3pRkLsPD1WlVH5bJWX5YujmDZeiKz61xvkrWsiOvX9C4xAUhZbaEh2CuaNiMK8HzMUiV+siQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMJCvZQ4CRdzcHlD5kmAgjDUrv6hrtgzyAhsCpaDEwY=;
 b=XlTSsFJGGglveQAPB3kyy/guqC4AHcfpjafhmXNUqMzm4rPQ4e3+ok4Jveyre0SVdD3wFNyiX+OpCQa9tZoDvJqXMLHqidRSwwYr2yqZ9eSGsex6wQLpMpDJeYFl8rAZTO9SOFT+pqSEeMYitKqrgjhoDavwMEoz9nrGEKgc5siYNeguiP4siBtEFnl04ZTOM4kk0wMvAumpz3HSyoUMuQMzjVtPyEBBPjPx8c2SAHl6+oeLuoYvu4+bsHGU4CJPkRJP31S9S3imJUI+eStL74XS+u9jUU3ZCpYzLSS5saQqq/g34/6g+eQoAzxp9eQfylI0b24F64eQDiqZ53UZFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMJCvZQ4CRdzcHlD5kmAgjDUrv6hrtgzyAhsCpaDEwY=;
 b=wf1+km2hivwus1A9HYvzmQei7y/XGUbR+Uqt8UPy7REspSIFJoYdgO641yBfG4AMLyZlg1+PNS81/zC75BSXO0idhhiN4/9kbW/No3J5uoyx2nKkQayZIIFIJKV91IYNastNZiboVHFKpQOu9rAZgYZnuIHmw06Jv7dL4TKnblw=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by IA0PR10MB7326.namprd10.prod.outlook.com (2603:10b6:208:40d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 05:31:48 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 05:31:48 +0000
Date: Fri, 2 Aug 2024 01:31:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com,
        kris.van.hees@oracle.com
Subject: Re: [PATCH v2 8/9] build: make dtrace and dtprobed relocatable
Message-ID: <ZqxvQc6j0d5JNeLx@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
 <20240801132156.286780-9-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801132156.286780-9-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:208:32a::29) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|IA0PR10MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bfe3192-dfdc-4cdb-96ee-08dcb2b467a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9AiLjRn4ihgG1QOnGJNTpnJCVLxC4lx5muJxpS5R8IISKZ/U6urzKYrh2Y8X?=
 =?us-ascii?Q?pMXdIjcWe00xlgrHE387GmzhNNAxjvLKiaxn218CojPNKqpQR5GAwxCzRFpJ?=
 =?us-ascii?Q?f4CKJ/NjmlaZblsQWobNITbGpi1TyUkr2NpKxPABfhzXHArUrNHGiwNw6q9H?=
 =?us-ascii?Q?kjSsPMW17FnWi7JMw7okXdQZxHDFQi06jzYo6FW1BfRs/y9sEsJ9x3tMm4FZ?=
 =?us-ascii?Q?wb2/Vw8PycvMtFY7KpOdbWKOCMxD/0kwCaKqpKkwT64J+btsOWeQaE9wW+xa?=
 =?us-ascii?Q?fbnci+yD75IiG/gtu19i95qFG/wmMhUEvMot4CmMVNnDuVTqwjjV1NS9UgSp?=
 =?us-ascii?Q?3BvDtl8YP/wmVtBvE/HuoEsPYbs8WCS7shMsUfQenjIVJfh3XAC10SvJ3bK/?=
 =?us-ascii?Q?cP/d+mJFrQuj4G4/oyJ6vlTXbQJtUxKiiefpG/cragE5tsfv2p6YYO9ICi8L?=
 =?us-ascii?Q?v8VBpGZ2jTL8D++1855ItJC640IzhCzjAXw2Y7Oxg67bSyYXxxj4JAIL31aq?=
 =?us-ascii?Q?mCw8rT3Vqtgv4XRWaZWmVCRUReIy79o/4rN04OIJsdazML8m3yrj1/gd5wrN?=
 =?us-ascii?Q?1VooE5fdGc5gRqB46rIAVKOzE8ogltfhIjC0eu+8GOS990oUkYjysRXyfntu?=
 =?us-ascii?Q?kJg768EV9KB041UW7Kc/vZ8Kj8KtS6DXrlrlQ7b8k6Fy6o0XlLi/DN4xyTXE?=
 =?us-ascii?Q?8kt9akPjnvtXnDq/Ryw7wHPOAWrdZ0uQDQx2vkzWpKKbHPOdS12aOR1NMDap?=
 =?us-ascii?Q?hgrE6Do+bUg/2wSb4RtAoxtN6gt07rxDX22A4a+PVRwAFVEL/16J4e0EmUhg?=
 =?us-ascii?Q?uRRch+fI1oK17K8BIwqJ/1jZ0hqzZ9+VTHE4SIPCz1rNyIr8KPCq5nPe/jR7?=
 =?us-ascii?Q?GmkiIJsDE3aTR8ynsuDX6XKzr0KWyWeIwxuLC0aviyYIH/+QXagzh+FEaz6Z?=
 =?us-ascii?Q?qFA1TQO7iJzKua2oRiCNc22yGnTDPRYAM/MThe583LTKLAYC5hKfd8tiAQOm?=
 =?us-ascii?Q?gRDRQHDSUIzVCK2P1y3qz/P7VpQkfKn/L3+cG53SnITUsNqq5CVcWqgtfMSa?=
 =?us-ascii?Q?QdmoejR3WQsbYZ8Jt3K2MPfMBdG42xEuRMaEeHxq1CnNA+zMWicsi1s8Jr4u?=
 =?us-ascii?Q?WEj62lZnu/OhLUN8Ik9SVM2WyGTOhhXHf8R15ZERvh+ITesXVZOTrZG42v0T?=
 =?us-ascii?Q?AatBHDAhm7WTlFo1MuIeQJdnT2h4PGK5kSDWvCXz+BKGQ1sAC2NM4UQ1Sxz3?=
 =?us-ascii?Q?zijYuBJeBMrSXNLghHTXHJ9rCbjBxcBYkrjpMPdWJYo8jVYuKeyE2X5Z+blt?=
 =?us-ascii?Q?E5rl8WDX033PVv4Gkh4tVoTM1Gdh+qU3UYbdWKVYFDrkby0SpJ463+J/nISp?=
 =?us-ascii?Q?PSTQHRo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p7bwK5Zl4zoBUkuMQDomXg8GddEKch63pCMjXLuRhcRo8QIu+Hr0sAximPUy?=
 =?us-ascii?Q?VWm1IlpBLEP39QFn7M5RCwFPQtruDfI6fzbibyCE7OY3EvoqQRYHD+OAg0Y4?=
 =?us-ascii?Q?KRXHQZoUuldyn3TphVH6XR6bOzWoaXJBrlimst9nj+CNb5P6JG5j6yzY+GbR?=
 =?us-ascii?Q?lNAT67yvZshj8YEHP0VNWUoruOOXIehwnAzpR7vSN6r6mB8fAfio76X1XP89?=
 =?us-ascii?Q?gxsnY1PGqsAk8sQAtRkb7bdSLd1SSJ9ytNmnXs5ijCSofAF1cHVJOiPTUosb?=
 =?us-ascii?Q?UjGHbf2uxOtOoRnkVt6u2usFp1+vrpy+zuJl3djMXkIlMRJn7/93Q1Adymun?=
 =?us-ascii?Q?q/Agn8W8p/g37AomY1CrVxs7545OJieulYP7GdkJ1Sen0ETSI7rR3CIqWOf5?=
 =?us-ascii?Q?qEdUUamwEDVWZGswj2SE6IyznhUZ2lQIWByTPE2Zd46nFaH6tlHEUDTiMPFw?=
 =?us-ascii?Q?hazG7mhlSTKnypTPdSxkj9gi8uPLTct20JvhuL9LdmK9jhgRJ94fHh3LB+JM?=
 =?us-ascii?Q?NoMie8D4+J8Pvrc0Xww9bKL1j8QhTwZO+flBOzatvu+L/kcfsYH90ti4Nt+C?=
 =?us-ascii?Q?XsXfYQd6tDdBhAnkSPcEvQH2CD7zMm7ZdBVYeB/itnSgLLBk3CU3UDH57mVL?=
 =?us-ascii?Q?FRsJfHap7PFSkKSuZRCcEHMRuYPPY6P7M1tGevAeAFvJErNFEvzS8pSFMgjw?=
 =?us-ascii?Q?sDwFc9uDS6J2V4XYB+/OoUbDlTaYTCD4DGVnihruyGFJ04Dc/RNWfA8uEvtB?=
 =?us-ascii?Q?xIvnMf6BbP1guJhP40n+338NoB9vznGyScLGFu6eFU38XHYnCxRLEElPRt5a?=
 =?us-ascii?Q?fwBT/cwxrKdoDgRwuBJfBTonr1C/xIX/VFY/4CLW4edoCT/lwgoY3R+7wJyH?=
 =?us-ascii?Q?FW3GPXxQ+sOIB3QEUFde/BdU92YNRPwC3J3sgxaycOue3cNhotPPRJHcNMUk?=
 =?us-ascii?Q?KG1jGa5Ejg+JLlVr4VeWBkClJLEhUDOGO1mJjeW8+b+tHuqz+qSq6avS2OXu?=
 =?us-ascii?Q?dFHZzd2Se9C0u0EOplCHE2Q0yiHM9VGMUxHLvVi9nhvE50YYFrC7qc6v3vrf?=
 =?us-ascii?Q?6GC6pz73ROMTYlEfU5nxT1gWcXhVoYHe2K3MlT0mqS/1zTZRkiNYQSe1c1l2?=
 =?us-ascii?Q?9fB9ZZ+MISOaHR88uUMF3NZWvqM9UB2bfbvJRgqkDPaq27NOy5dSqo3fnsuF?=
 =?us-ascii?Q?FBVEbOIba3LABigiVL1vFylaDuprdoyTc3LeOelJEqB1kGLo4KOj7TS7W4hU?=
 =?us-ascii?Q?sxzpSzkGX60Va9Uh8HvfCEAKrsHsz/MGKCRmvA5LDGTqV2uFlIyAXAU7bbOs?=
 =?us-ascii?Q?KemlzIbnuiTGvCqJPaUnfxqpGHhwe7HcQzmugLq2e6Rau3YN8qjkJ+3asgAO?=
 =?us-ascii?Q?lbZ06awlyGYim3MZjIB9xQvMSoCjpUAqh3VSdY25vFq+YjQDvgHW02VMw03N?=
 =?us-ascii?Q?k7lKNODL4Y1JWM4xXIdE7nFUJ7A/lTmMWCNj9GphTot/EciCkmtbr+aJd6kN?=
 =?us-ascii?Q?1Ry72ArjDqh6XW4vzG70je8ld7txwUU/GV8XjgjYB6xC4mefunWh8j8BwdyY?=
 =?us-ascii?Q?1YQIhHnR9KqvmiSfdUyOhscsF4b18darQ+48kqbnIrdmj+jfzc5yy0P3zlgs?=
 =?us-ascii?Q?JA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w1x0PqEnWCYG+k3uIlWJl6A19LwtFMofKjwJ1y1vVRRMiZqcJryxGcz4JIRVMibPkH595o+dZ5dov8eLIuvrFOCsPhsbUzXEx5dATe2RNIGKnQA7Hono2EhMe3f8xh9mOeiDqZlV9QQ1r3ndQUPckygIQr/27E6aD4NwNCOQN2hfhKUeBBood7gaTDbrRWe+RDICFYKNXwWWmUkR2/nizNxRfV+5Qm/NqOjS2ukosmCgy2i9WT+0ZU2yq+3VgTBwoNvc1vlIoPwi3PKiajtWBtVSxMpPOFpfsFPRDY2pV5GPWwgUaSIoXH9ToOf4vgU3xRULFqbIPL7N56DCUFca/jhB8fqyRmu3XmOTn8+N+rNzaLG+88CyGYLHM0wxiG+HD+p3oZYQhuClPnk4+faGRNU4oUUubbL4WHSJtbM4xWB0MdJ+OQh64vb2RdrruUscSz5iX6ynAg3H6e/Eg7PHatpU8XfcSPrfW4Rpa82fwMJMWgoHaB+kLL6JAHxvKlqm4GFi8rwKE659XMNcaAPpY07dLwegCUwUlve7Mq7lI/XiRcRw4c5CmRvuy9fAnQmdzqApYZfd7f7gCEp8l2fVcH7zXWCTkPYmYT3MnfeMkbA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfe3192-dfdc-4cdb-96ee-08dcb2b467a0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 05:31:48.3045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIrdca2+eDih2cLNroSwD+CWq/UfWGeBtAb1yhFOWZOQSVIjUaWbo7vihWxJLaW+6mP/nlq/g7IEwKVSi2NbPFczEIqR4F8NSCTdABCrgNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7326
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408020036
X-Proofpoint-ORIG-GUID: wfxmLWjSZYx4PW1HxV4UKfjkjD3Rxr-A
X-Proofpoint-GUID: wfxmLWjSZYx4PW1HxV4UKfjkjD3Rxr-A

On Thu, Aug 01, 2024 at 02:21:55PM +0100, Nick Alcock wrote:
> The majority of the complexity here involves figuring out what to
> do about the systemd service file.  We presume that if the user
> is installing such that the service file lands inone of the two fixed
> locations systemd knows how to find persistent service files in, or
> if the user has explicitly passed --systemd-unit-dir to configure,
> it makes sense to install the systemd service file (because systemd
> will find it): otherwise, we avoid installing it and print a
> warning that the user must do so if dtprobed is to be properly
> started.
> 
> Provide a new installation target, install-dtprobed-autostart, to do
> so.
> 
> (Regardless, the service file is changed to substitute in the real
> installed path of dtprobed.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  Maketargets                                   |  3 ++
>  cmd/Build                                     |  4 +--
>  dtprobed/Build                                | 36 ++++++++++++++-----
>  .../{dtprobed.service => dtprobed.service.in} |  2 +-
>  4 files changed, 34 insertions(+), 11 deletions(-)
>  rename dtprobed/{dtprobed.service => dtprobed.service.in} (95%)
> 
> diff --git a/Maketargets b/Maketargets
> index 11ad9fed4dcf..5b4906a86d26 100644
> --- a/Maketargets
> +++ b/Maketargets
> @@ -14,6 +14,9 @@ help::
>  	@printf "dlibs                          Build translator files\n" >&2
>  	@printf "install                        Install (DESTDIR supported)\n" >&2
>  	@printf "install-test                   Install testsuite (DESTDIR supported)\n" >&2
> +	@printf "install-dtprobed-autostart     Install udev / systemd rules to start dtprobed" >&2
> +	@printf "                               (done by make install unless prefix or sbindir" >&2
> +	@printf "                                are changed)" >&2
>  	@printf "clean / realclean              Clean up build tree\n" >&2
>  	@printf "TAGS / tags / gtags            Make tags files\n" >&2
>  	@printf "\n" >&2
> diff --git a/cmd/Build b/cmd/Build
> index 55c622c19dc0..68800fbeb5fc 100644
> --- a/cmd/Build
> +++ b/cmd/Build
> @@ -1,5 +1,5 @@
>  # Oracle Linux DTrace.
> -# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  
> @@ -36,7 +36,7 @@ if [[ -z \$$_DTRACE_CHECK_INSTALLED ]]; then\n\
>      export LD_LIBRARY_PATH=$(objdir)\n\
>      dtrace_cmd=$(objdir)/dtrace\n\
>  else\n\
> -    dtrace_cmd=/usr/sbin/dtrace\n\
> +    dtrace_cmd=$(SBINDIR)/dtrace\n\
>  fi\n\
>  \n\
>  if [[ -n \$$DTRACE_GDB ]]; then\n\
> diff --git a/dtprobed/Build b/dtprobed/Build
> index 0f5d1c08aee8..9132c3e31c8a 100644
> --- a/dtprobed/Build
> +++ b/dtprobed/Build
> @@ -42,17 +42,13 @@ dtprobed.c_CFLAGS := -Wno-pedantic
>  seccomp-assistance.c_CFLAGS := -fno-lto
>  endif
>  
> -install::
> -	mkdir -p $(INSTSBINDIR)
> -	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
> -	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
> -	mkdir -p $(INSTUDEVDIR)
> -	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
> -	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
> +install-dtprobed-autostart::
>  ifdef HAVE_LIBSYSTEMD
>  	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
>  	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
> -	install -m 644 $(dtprobed_DIR)dtprobed.service $(INSTSYSTEMDUNITDIR)
> +	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
> +        chown root:root $(INSTSYSTEMDUNITDIR)/dtprobed.service
> +	chmod 0644 $(INSTSYSTEMDUNITDIR)/dtprobed.service
>  	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtrace-usdt.target)
>  	install -m 644 $(dtprobed_DIR)dtrace-usdt.target $(INSTSYSTEMDUNITDIR)
>  	$(call describe-install-target,$(INSTSYSTEMDPRESETDIR),50-dtprobed.preset)
> @@ -61,3 +57,27 @@ ifdef HAVE_LIBSYSTEMD
>  		systemctl enable dtprobed.service dtrace-usdt.target; \
>  	fi
>  endif
> +
> +install::
> +	mkdir -p $(INSTSBINDIR)
> +	$(call describe-install-target,$(INSTSBINDIR),dtprobed)
> +	install -m 755 $(objdir)/dtprobed $(INSTSBINDIR)
> +	mkdir -p $(INSTUDEVDIR)
> +	$(call describe-install-target,$(INSTUDEVDIR),60-dtprobed.rules)
> +	install -m 644 $(dtprobed_DIR)60-dtprobed.rules $(INSTUDEVDIR)
> +	if [[ "$(SYSTEMDUNITDIR)" = /usr/lib/systemd/system ]] || \
> +	   [[ "$(SYSTEMDUNITDIR)" = /usr/local/lib/systemd/system ]] || \
> +	   [[ -n "$(filter SYSTEMDUNITDIR,$(CONFIGURED_VARS))" ]] ; then \
> +		$(MAKE) install-dtprobed-autostart; \
> +	else \
> +		echo " === WARNING WARNING WARNING === " >&2; \
> +		echo "systemd service files for dtprobed not installed." >&2; \
> +		echo "USDT probes (and the testsuite) will not work unless this is" >&2; \
> +		echo "done.  Try make install-dtprobed-autostart, but this may not" >&2; \
> +		echo "be enough: you may need to manually move the systemd service" >&2; \
> +		echo "files somewhere udev and systemd will find them." >&2; \
> +		echo "If there is already a running dtprobed, it may or may not work" >&2; \
> +		echo "in conjunction with this DTrace." >&2; \
> +		echo "Configure with --systemd-unit-dir to override this decision." >&2; \
> +		echo " === WARNING WARNING WARNING === " >&2; \
> +	fi
> diff --git a/dtprobed/dtprobed.service b/dtprobed/dtprobed.service.in
> similarity index 95%
> rename from dtprobed/dtprobed.service
> rename to dtprobed/dtprobed.service.in
> index 8e491fe28ad1..2e590701d03e 100644
> --- a/dtprobed/dtprobed.service
> +++ b/dtprobed/dtprobed.service.in
> @@ -12,7 +12,7 @@ Before=basic.target
>  
>  [Service]
>  Type=notify
> -ExecStart=/usr/sbin/dtprobed -F
> +ExecStart=@SBINDIR@/dtprobed -F
>  Restart=on-failure
>  RestartPreventExitStatus=1
>  ProtectSystem=strict
> -- 
> 2.46.0.277.ge12b8151ed
