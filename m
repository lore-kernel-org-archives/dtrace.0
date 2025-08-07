Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F699189
	for <dtrace@lists.linux.dev>; Thu,  7 Aug 2025 03:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754537316; cv=fail; b=Ji/6A4jjVrfcrfbMaQDjgDj1NG4W+07ONhVBOxZMhT9TV22GwfaEm9F7TctNBmDFR2B8VA3N9mdMiITblfH9sYoJqzuDEQTtPO6bGkn1GtgSVk+qCShTWEw2EjkuvVAOEaJQt4eoLhVZFpCw2LqrfTv8y/NDy2XTyZrt1ZX749s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754537316; c=relaxed/simple;
	bh=ujNbGH8okT+zbGW5EomeuEZ65wepL/xZ1aqP6UyF0oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t1HiDIyQaf5Iyl3nokPuryUmsuaLPqW3t1dEmD36nfmQFk5VyMDTVKmfXhJH9mNarsvRLX//tyL5QTnRjP5f2MKoq07bj+p6H6kNFPxb4RETz1LPVU1FPAZ+G/CfHZ3icTAPstQgouz3ZDbIXV+ixv9YAj/GLhn9GpJsoUgG184=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cvBi26VB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=owaOvx/S; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cvBi26VB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="owaOvx/S"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576KRS8C010240
	for <dtrace@lists.linux.dev>; Thu, 7 Aug 2025 03:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6txfecepmDAyivWdGN
	kW7EcvQuphVQziRZdkedt0kjU=; b=cvBi26VBM9ZYnARNYMyruvri5yZvrBT/YN
	mnhuwO+5zazf1KdaTHO2M7WD6SKt6OuLk6DIGN6P+QZlrd4Eb2qJe6SMI6BEnA3R
	GVlq7wzZ6kbhr/hjJNMPNBZApxV3Eg3VbxcEToCtHfgZnYaI0cKcIUUoKGdrB5pD
	tAwXt9JBa60TGyfYL7w5z9Z0m/mfIaG+YIDO0LoqO0ko3CRLTj4ZtAwl+RfxkEY/
	vztbRhhoIzCVDKWwU6YqCvg/bQaB+0tvYzEziKa5YytAFGEKQztwCrmmRQ2uP2D5
	nYkpeolgZuseRzgQeqN4mg5USETVvNza+3Wua4eNsoKZOQrKHCDw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvf32b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Aug 2025 03:28:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5771Ean0028187
	for <dtrace@lists.linux.dev>; Thu, 7 Aug 2025 03:28:31 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwn30qe-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 07 Aug 2025 03:28:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV/G48M8j+JD4BHrVs/Ly2Pf88j8clrKduqWeDqve3eHzG/aFIfm3iS+BpfnjD0VEAShYnNDXZtuRCrTlimGjbBsyrdUJq6xN4/syOYDKJio4bvHYURzMg3kNcVu5MTbnNUtIi8L86MkPWa2rvieyWsJY2bTx9NQ3lONQNyvLrJG03k6iEE00ErwVJhvOQwZuHkIGMb4qu2xOB+TSzSyTONhAayflsniIyxu+NWkINTLbJ7JPN2Xns5VS3qtSABiBy0f1E4Qpt3n3OUG9TGN2F3bopmkCUIBJwSWq7gr8PcftcLTu6SbDCVYZdGygKr/q7BRjGpnwAgJu1uwoTSnlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6txfecepmDAyivWdGNkW7EcvQuphVQziRZdkedt0kjU=;
 b=CkhuSgqk7J9JhwEh3CKocguCFVaGkUFj3Yayi5NGKQeJDB/EpOUJGVSGbYztxsIbNDsybZXvJd1W01a4Yf/qcFIHhOtMIgWGVv5bZAMTWx6GKoDA9PkNWS87E6z/vbRvudni2PwcZvAn8xtj8rJzKjwvwdsKt9I6BSs6f5PLvXthkWf6xSUV4i4duWmdNB98LqwzGFGSCpinY1vFLemh8HxOoWNxpvlylh13N4u4zvm3SXi42dZfClt1aSLjqdd4+Zz3folZIejOwVc4JYfscWIaascwFE02q4yCyP7aPWe8ymyxA0/aUSiLiQRM2ZLMVNGgIojRd35LXptGqqYg2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6txfecepmDAyivWdGNkW7EcvQuphVQziRZdkedt0kjU=;
 b=owaOvx/SdIrmkmFn2Cm6rROveCuZL4WMUcIgXjS9FXGIJS5ziPGPZAMGtgMxAexK/ysJJA4wBn41lS/AVGMXoDBXxURnko8ZvFevGwMjSVO0jGtPOmAPwdqd67J/OM83lIT3b2v/nWyRvJ73FnYyh5SNyGsLXvURH330hw+iNfw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BY5PR10MB4274.namprd10.prod.outlook.com (2603:10b6:a03:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 03:28:01 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 03:28:01 +0000
Date: Wed, 6 Aug 2025 23:27:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] Snapshot aggregations just in time
Message-ID: <aJQdPmGMyn6hEeaV@oracle.com>
References: <20250527054313.4849-1-eugene.loh@oracle.com>
 <20250527054313.4849-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527054313.4849-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BY5PR10MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: ae36c545-71cf-4223-df23-08ddd562695f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YM/yMLUYGrQz262r5cebucQm+2oiqB/Wkb3gQJKWmsFp+Y2Me0/GlYLqS3np?=
 =?us-ascii?Q?3SlS7a3QN7f3D3ne6cbWHnHI8f/eP+c+m42UsmrXOd7uzuDHTQ0vYf4TZtmL?=
 =?us-ascii?Q?jXH+YXMApFjuEG+il3cNXdrV8MdrG0nakyyxV1F56LYr3H8r3VeXxINoDOQq?=
 =?us-ascii?Q?5cx7IvjSpzbSccOBZtb5qAYyi/6I5ixDo/wMuJV8XvUDh+X71qifoIrR7G2r?=
 =?us-ascii?Q?MAqQrGy0oPiNjGf+3JfLMjdThsQL0daWX9g1eitdCbt2Pn06G68/lr1zAcLe?=
 =?us-ascii?Q?0pVVRcwFIly/PExGsefG0s/ShedfY7eR4ESqLyZRJUIaa4DnX0jRyXq2xTrs?=
 =?us-ascii?Q?MPZwdqTqEyDmZIzgeWgGy0+OPKXt0+/MYTK7oJ470hUdAQ+K9xNquN3rPoVJ?=
 =?us-ascii?Q?GcyiYZcla0Yd2iyzjngHkF4bmxTKJPjCfcs4X8ttvbNBK1wH5lquDjleKOYN?=
 =?us-ascii?Q?cuZh2ClfP9RngOyPkmsXHW11XRXKICCUbQGgWdXbM0RWhFbw+R5GvOFbeW3j?=
 =?us-ascii?Q?6Yh8s2HRbjX749w/db7Wvr2e1Y6bujcFZj1zmHVrpOo1KWF7Q7WCNaXC5TBq?=
 =?us-ascii?Q?lRUXC4HBnI0zpqIQadamOaHGWM8BU74lIqu2CJoHH8CVwjAdzHtzkf0yNRWL?=
 =?us-ascii?Q?YGLDVntBMzvXOp25KpCH9MymhVei5RK05ATWEzLHHcfOby5Gfm5KgctIrGKd?=
 =?us-ascii?Q?ts7hj6AFW+xKmJlzDJiy4yWNhTRim7g7duqk5ZZTybmCB8J+bhsN0lo9oFFX?=
 =?us-ascii?Q?/JTZxrY+DOGTNwghLdn+b8qgHGwbpKX4/fw1nGio5B5dLmH0lNpN6aDCatvV?=
 =?us-ascii?Q?1ufrfn/PS5PBz8FNYWwA0eGVDmLzenHsCL9RKstEIYYl1EPbcKSEBnaXRyDE?=
 =?us-ascii?Q?tApFAxwah605XNcnNM98dSMm4mh5ZVCzeHvwr7+zvtUwYaNc/C3cGXpg/lRe?=
 =?us-ascii?Q?a0PzTgkXvgWdhHM7+fZt/FeNOUHBPULdYwksjiuHsMh5lYfe0vm/1O36QrPU?=
 =?us-ascii?Q?ljDIRxuXXA+Ezx3igcss+FhbYDrcqSW8uBgZG94/E6tF0lIjAqiyCWp0EetK?=
 =?us-ascii?Q?SONaDdFfQ4akI/hO5rkzkrKXPsLCTPvYd1wFKwRLJK0lAHx58FmrmbNF5VYm?=
 =?us-ascii?Q?+xFDztohImsmA2fN21yluDBSH9KV1LdKewCSnU1+CJHKmGVG1DBsoEp/JN26?=
 =?us-ascii?Q?a0aAFhnCCrTcXlkCilcPvLvL1vICrxZ/aHASagUgoUa3rdy5UHRI0a02dznU?=
 =?us-ascii?Q?5wO+sAdbtgf9CEK02LQuYP6Sd2FWXXNCnzYwm6gCCi/Okz+QnUXlsnj4YRqT?=
 =?us-ascii?Q?NlBHn8JSCowixgC1pg+G3N2wNgN9GGSbBNNgMelxXpg9n/S12Uh3U68EKJYr?=
 =?us-ascii?Q?reSDSzNirZNx3qR36NHnNP4DrH5ukLU/d/K7PI8d5vHxhoELH3Ml+OgoJWi0?=
 =?us-ascii?Q?P2BLVfL3okI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X0fbOZD7h92T31yD1fCjaExxZE0aEDG+DwTJjEfc5u9NIL0xWA1cB/SDweoQ?=
 =?us-ascii?Q?RJGfvgbl4RA2coqJU/w6egN6GWKiF88Jc0Io+92RkmMDzMkziae4LQNbyD26?=
 =?us-ascii?Q?xFYb4LBPsrI2jxM7uF+xBptsq7Bh7hgggvU1zqm+ZaKsDjLazDmuNBH6wvRb?=
 =?us-ascii?Q?TKYP3uxTYSpUYoTK9osx/5sjRp6SiTStkd+GPyay9n2dt7LTwrvv1TokrdIV?=
 =?us-ascii?Q?dOzXX/X/xxivhXLMvx/xdg1KNGxoeEsu0GMubvS1N//r4NPD/gHuSvahUR6g?=
 =?us-ascii?Q?B+C/LXxmBERPmN++3c7eG1DChazmjkt1yupnJnkyuURZ0g5xPKLmyjdUA2i7?=
 =?us-ascii?Q?b0dJJMwi1nXr4sKKEnflIU7wHN5X2aSflp9yatTjxJ+054uoZ8r46XMpo41E?=
 =?us-ascii?Q?4jSvcgaS/8SpM/S8xj0dsofUWZyTfBLMxjtlhP9JANqiR84XZEAWvgSo1s1E?=
 =?us-ascii?Q?ZX3PvwOazZF2e6NFEpyMAiR0bvR1NBuYCAgB0l3Xx+usgZtIq2w5PuwVOoXZ?=
 =?us-ascii?Q?MAfWHeooK3/eMkQRPzJg8ErqqvLIhW+iMF/iUOYi/GymGMl1mkJ+YSNr5C2E?=
 =?us-ascii?Q?tBTgTZWqhP0o2R8fMw2mIt1bxZ0cMkZiHZO2XGQKJt8QFkw1AjCPBCeyr21Q?=
 =?us-ascii?Q?xm3FSorhL7d7rIG6KF2irhUPzd3COCuoRKCByJl6Z+yFaF66J/245joahWPd?=
 =?us-ascii?Q?l2otuozixZH0F2Y5/3CWT5BcNw1bcgzPresn9uaX+PJkmMbS8RqIEcPlDrnP?=
 =?us-ascii?Q?g7RwnOxs7sJbJQ73LEXon5c7zSeUWnAuTGftWTDzr0yl4FeK1RxKhtaqJhcE?=
 =?us-ascii?Q?9KQu9IK+mkHYKMf4JDIrJyvHRaFJzbHIKKZVuwK/tAJGR/oEdL6Yiospfg4H?=
 =?us-ascii?Q?47zOaY5DD2qLt7xPOcz7dCx4j3c5V9dyklZB1P4cmDR6psNwvTzr8g8g89XE?=
 =?us-ascii?Q?nuZ9XETBWHrR+T3pDwQdOSpW8hsvARoE4439YJFH0HFwkYOx5EuCLjUOvhtl?=
 =?us-ascii?Q?nApQH7PFjC65SSVatFyCx0CX8jyP6NydKU3tRILZ4U2VNhiifs7POpJ/fRVS?=
 =?us-ascii?Q?WU4Kq5zZ04oNP4RZCTNxI5MTpQXZCLHZTe5LnjyiUFjySUuMkQLSmXgXXwso?=
 =?us-ascii?Q?OgwoW8NMehVsgWCwnfUhjxcn7cjO+UfaBGHLpwuJ5U4VM+yoxgOVT/Eat5ag?=
 =?us-ascii?Q?Rg6ElMVJjzi/9Tzpd6mdEjrFLGXjg67nyH8YB2Q4mSVIY1cu0t81k6/wtnpe?=
 =?us-ascii?Q?JF2U7sorQt/Tu2hqysOSp2bPvlZ6ROX0WUPGuCOAJhCupIZ0RRv5dwUrkuT4?=
 =?us-ascii?Q?70p5nDz3I3TbvGm1RTdcaL9Ni8wn6RewBsNq6Zl9eh0T8mWX9G0IKCBgqpB+?=
 =?us-ascii?Q?lcc849D9KpEkpTaNAPfLKFz0hPbkGrwO9s/QcmeIpqiXW0cuAimTVEgjV1dd?=
 =?us-ascii?Q?w44VQJO+kAl7AJZ/9+Dr3FlkjTdtbwVi9cBqIL12A413aQHYRuMkzWcRqC20?=
 =?us-ascii?Q?o6/g/80yYkipY8YmCg8OIf6ihI6uJocwXDO2hhEps3FGQpxlnfZZ3HsFRaq1?=
 =?us-ascii?Q?/ANluUnlETQlnvuPcp3dMQuzeBm3kHtl8Sj9aNRqMN5ganBvsvIx1dlcdlhY?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HX5fEXW98hp3rLBSRUnaBInDhYI0liXGL2ZLJsyj3OWwbUtxK7lVXTry0KilPWD0XxgtENYg+rE1CnI7+DarEV3fyE76Bl/GQB9e8snXkIFalAiIflkKclr7J3AqLkpXmbdq2YRpxlgyOL/S08xYfyar3SmxTUJwPwwZF+tfFSD6xL8MgsBf/TzieNJ9G4nAVXczKzPSvSzILtcDVUCf9fi4PeTUIEHTFHWAufsYU8EZGgsfKeLwYVbiQ6LyI4QeGoLNxS7sDuJ3FhQnFkziafFPQ7CsLuh3AlvEDeNDXkh94hnwYoglZ//pabTZq82mjhEwUCPWFKGk+qkvNiFYPStrykgpzr5wdAecdhigo1RYXJfUr3kxLm0cvyNsf03cj8NrrUuny5VaQOidFUh6eXgWCjnqxsVQ2/WH3tNVYoF2ErSMm2ti+RXYg8gT52qHSznp3/27T2lgi9orzE8GfmX69Uq+nlVZZoGixAeIXTQ50k1VDGdAlnTPG0SRkz+CFdAD5c4n3xJiqAOH6agA2W1fOshtWEEaQl1sgWn5f8xtu+LzVWzbULaVa86wNr7tyqEnn1Q7EFvhxNxN9KZSarG1g8Qz23Dr1CIoTdQK2UY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae36c545-71cf-4223-df23-08ddd562695f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 03:28:00.9421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7shP5/vbru8Q6SmVuD3eWkGV0xV+sjwPZ3sQTacEtEmQ17ssT8dU8HKTxdd/+9G3Ev3PGe49tkErTJ3NeU+dXvtHcw5pkP6pRl5xHpCbWCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4274
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508070023
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDAyMyBTYWx0ZWRfX5rJ45dDPMkVi
 pCaK8LIrpPZvD4/a2jAWX4I0L0FIizAGz11DMKnZ5WVAywaVy/krh9kgZcpjtFUEA4P070P8DNP
 jfqWc0xK55R/8fqZ4SJB7b+ihZsOTvVOBZZ697U93ToWT0A1vXjlDHTut32clCJhFEKAuV6bcN9
 swO/EvoOcvwA1ldkRawU/3m1haGbtYLh/gzoL/27cjWXiuoEJkleSXI9G6kPipUP5E38dDa99rd
 V/UOs6VKGq8qdh7woEjgIaU2PadHAxY/WeM4SBf2PdfVsp+9xSRUkBnznVvbcnLUOM1x5JGEiru
 0Ceh6Wl3V+U7zquCeysVKoGBPnscF5xrJ2PARNwkYo4DuZSUBGHORmDkPBkf58HlC9iQWzaxbs2
 0oDNS7/9ZYjI6r4BgwBbG+bsuP1sQtdYMNxdycAtfkJwZLTVoQFEnRTyVaP+B4VrpviITRmP
X-Authority-Analysis: v=2.4 cv=RtTFLDmK c=1 sm=1 tr=0 ts=68941d60 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Knlx3bLYnwdpgMM3BwUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: XhG6mIam1vgpO8aggdVBWI5vhLzz6jGE
X-Proofpoint-GUID: XhG6mIam1vgpO8aggdVBWI5vhLzz6jGE

I am testing this a bit and seeing if we can centralize the call to
dtrace_aggregate_snap() a bit more (unlikely), but I would be inclined
to suggest to keep the aggrate code and only do the on-demand call to
dtrace_aggregate_snap() portion of this patch.  I could see some use
for using aggrate to rate-limit retrieving aggregate snapshots in
cases where the probe firing frequency is sufficiently high to make
aggregate retrieval a noticable cost, and where therefore limiting it
can be useful.  Of course, that would generally mean that the script
is poorly written and should be fixed to get the desired results.

But it has the added benefit of not introducing a new global variable
whole not getting rid of (a now obsolete) one.  Since aggrate is by
default 0, keeping that code (for now) is safe and will still result
in the default behaviour being 100% on-demand.

On Tue, May 27, 2025 at 01:43:13AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Currently, dtrace periodically calls dtrace_work(), which in turn calls
> dtrace_consume(), which among other things calls dtrace_aggregate_snap().
> But aggregations are kept in entirety in the kernel's BPF maps.  There
> is no need to snapshot the aggregations into user space unless we're
> actually going to do something with aggregations.
> 
> Snapshot aggregations just in time -- that is, if there is a clear(),
> trunc(), or printa() or if aggregations are to be printed at the end
> of a dtrace session.
> 
> Skip the aggrate-slow test.  Just-in-time snapshots mean the semantics
> of aggrate have changed.  A fast aggrate means nothing.  A slow aggrate
> means we are supposed to use stale aggregation data, which would be
> baffling.  A future patch is advised to deprecate aggrate entirely.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_aggregate.c                 | 7 +++++++
>  libdtrace/dt_consume.c                   | 9 +++++++--
>  libdtrace/dt_impl.h                      | 1 +
>  test/unittest/options/tst.aggrate-slow.d | 1 +
>  4 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index 40c1ae44f..6c1b642ff 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -817,6 +817,10 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
>  			dtp->dt_lastagg = now;
>  	}
>  
> +	if (dtp->dt_haveagg)
> +		return DTRACE_WORKSTATUS_OKAY;
> +	dtp->dt_haveagg = 1;
> +
>  	dtrace_aggregate_clear(dtp);
>  
>  	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
> @@ -1901,6 +1905,9 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
>  {
>  	dtrace_print_aggdata_t pd;
>  
> +	dtp->dt_haveagg = 0;
> +	dtrace_aggregate_snap(dtp);
> +
>  	if (dtp->dt_maxaggdsize == 0)
>  		return 0;
>  
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 8f50ebefc..a91413672 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -2353,11 +2353,15 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  				i++;
>  				continue;
>  			case DT_ACT_CLEAR:
> +				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> +					return DTRACE_WORKSTATUS_ERROR;
>  				if (dt_clear(dtp, data, rec) != 0)
>  					return DTRACE_WORKSTATUS_ERROR;
>  
>  				continue;
>  			case DT_ACT_TRUNC:
> +				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> +					return DTRACE_WORKSTATUS_ERROR;
>  				if (i == epd->dtdd_nrecs - 1)
>  					return dt_set_errno(dtp, EDT_BADTRUNC);
>  
> @@ -2519,6 +2523,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>  			func = dtrace_fprintf;
>  			break;
>  		case DTRACEACT_PRINTA:
> +			if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> +				return DTRACE_WORKSTATUS_ERROR;
>  			if (rec->dtrd_format != NULL)
>  				func = dtrace_fprinta;
>  			else
> @@ -3113,8 +3119,7 @@ dtrace_consume(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pf,
>  		}
>  	}
>  
> -	if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> -		return DTRACE_WORKSTATUS_ERROR;
> +	dtp->dt_haveagg = 0;
>  
>  	/*
>  	 * If dtp->dt_beganon is not -1, we did not process the BEGIN probe
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 1033154d9..2c376f59a 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -405,6 +405,7 @@ struct dtrace_hdl {
>  	dt_percpu_drops_t *dt_drops; /* per-CPU drop counters cache */
>  	uint64_t dt_specdrops;	/* consumer-side spec drops counter */
>  	int dt_statusgen;	/* current status generation */
> +	int dt_haveagg;		/* FIXME: figure out a good name for this */
>  	hrtime_t dt_laststatus;	/* last status */
>  	hrtime_t dt_lastswitch;	/* last switch of buffer data */
>  	hrtime_t dt_lastagg;	/* last snapshot of aggregation data */
> diff --git a/test/unittest/options/tst.aggrate-slow.d b/test/unittest/options/tst.aggrate-slow.d
> index e2a0f2cb2..cd91c0a6c 100644
> --- a/test/unittest/options/tst.aggrate-slow.d
> +++ b/test/unittest/options/tst.aggrate-slow.d
> @@ -9,6 +9,7 @@
>   * When the aggrate is slower than the switchrate and the pace of printa()
>   * actions, multiple printa() should all reflect the same stale count.
>   */
> +/* @@skip: aggrate makes no sense */
>  /* @@trigger: periodic_output */
>  /* @@nosort */
>  
> -- 
> 2.43.5
> 
