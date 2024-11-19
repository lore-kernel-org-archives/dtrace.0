Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18F53363
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044851; cv=fail; b=ZqoCojU3fBxCQ5lPGGoAN91ON8yPavAFVcdiCW8qW0yAMbGzu+aP/0zUoFHmozXHNFUvdAppsnVSGIXwyZm0TkWd9cUrMjqD2PKN7FKkrpkFkazYVXLuT7g/c00DgkvZbexoUJkz7mGSatB9dPB64O8l0vUuTOi60eabw4Qt7lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044851; c=relaxed/simple;
	bh=Y4Aw5DaD4d4j4w6oMWUgoPF7/HbfmUgwnVb8VEIO3ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NPeGG+UqBxr3pxwG8+Q40jsT4umErpVNUCczGWSKMbiIcLOa/SP/L6ztS9Weaqlio7TeeMKTicshgdubnV79KY4KDAV84gGH2rRjXbeQu/gzVFOgOyYPO33IPjTnzdlP+z2UYS1395Eoy6PQyJxaV4SdUYNJBPHgvnGcSSwqTlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AWTLhQmd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uarXMTSI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AWTLhQmd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uarXMTSI"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIMYY9010407
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=8AY7T6E/9cox9WTtUG
	oVCgHjqpSKSm0wm2TLVFpyD0E=; b=AWTLhQmdZM5ZlSSYkVZlqoXaAJGQTrKxtF
	Hg5VH44aoi/k/FAupaa87TROnbswONSz8MLemazfeHgl8GgWvjpufc9Ek8zAnIp7
	WeYQ0lJEN+Lhxp5NnkJjkDOlDmg59IKWPu4WD5gExhO/dvmj/FtoKo6kfFR9zRqW
	4p0CpnrxAesh0ETxdKSaqZe2vFVHIUUmcw/G0mW+PGvN50rfJORghI6vUuB0f1QG
	vsXGQLeo0HrbBXDald9a3GNZeyLm6yPrBGMgkXgPNXZKlvmOmqzhoJIAyJgK1DrR
	iKlJC+0xmkfzuWfsvZAiSbiGUkWQ2Uc+ErcYgSAuFL/nd3uLvC3w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xk0sntvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:34:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJIW1Ev023299
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:34:07 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhu9ecb4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 19 Nov 2024 19:34:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3nWBSwLPYng2r/w0linSM2TMa5elld82l4HfC11zll8OK3/7oi4/sAHNwA21IqeGi1gHN1Nomh34nqTlkwAsl9BIitatE/J5N/pXq7ANofY+aBeS86tgbGJeXwd6Bl41DXLCFAvncDIFB9naicVRKT01CysJWGA+6cC4JMQ9GLTpY/joQJDm6Lm+vfumNcs2MFaaf0aUPUDT7Angys2DPG2xUiervC/dPEtnhCws/aJYpnaT7WeNLNHunTPNXcOJxaM+WC/shGWlG3bYl//SAS7rNxNzK+Dl7aEwvG51JIonJufmdcSkRZBY07HotJqcZMB+1PWg/gVaRqJlV3phQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AY7T6E/9cox9WTtUGoVCgHjqpSKSm0wm2TLVFpyD0E=;
 b=T2nGFxWv4GLIy9JMni2IQ1kEwOeN/XIu5IXYhRAaSlhwNci6SGy2IRde7Lk/Ajuh2D147ZNRGi6B2Elh8Aijp9wfBXvKh0FL7jlcxXQwc09RypzX5qUhRg8X49lzvjyidiIUYyF425QrMFQV78zH6i16xvvFHJBBxSkAsW4PQ9nXQn8VzAVHlgRfLgLbTAq1duaZgXQNk7lJUMUOAd7mQ1bh30475kUdM2NPEzT2+eaeKtJ5UfWskAa5qjapfYx97M5RUJLJNs28Y+4Rl60UMxKkSYkZCDDaMzxCR3XhCzLOtukO+j0q1PCgZx4dTpx17AeRq5VCIoanapro+EPHfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AY7T6E/9cox9WTtUGoVCgHjqpSKSm0wm2TLVFpyD0E=;
 b=uarXMTSIETvb6ffI+B+tp4N/Jq35NLxfBHrCseDnpOfcfnOY/Bml/4X4U+lEeheZ5hN/zOstW2ZIhCzBWX5gGNGq54EBg7rBHBqHvT62pJgjEdDwfNCgeASVHdDlZ2PxX+X7RMJC39nFyKbjwCzcYaGI0DECacgDtxVtiaDb/Lg=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by DS0PR10MB6125.namprd10.prod.outlook.com (2603:10b6:8:c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 19:34:00 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 19:34:00 +0000
Date: Tue, 19 Nov 2024 14:33:57 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Number refers to nonexistent line
Message-ID: <ZzzoJSEkFhu3uXq/@oracle.com>
References: <20241119152152.15077-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119152152.15077-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0430.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::15) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|DS0PR10MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f9c7431-b191-48ab-2ebc-08dd08d11e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pShlyKkuZHawZrXax8dC0TtzPIkXyc4pUe7DTvPPpOZVxfGHNzFw929jeoB8?=
 =?us-ascii?Q?uu0u2siOL20DInZsqb6FItwmu/9H5lHFkBWy62senFr1csl4Z3KVlHh8Flnm?=
 =?us-ascii?Q?tF0JnUxOwucjpHqpbfhmjYP26Y27baiZyoUWkldEsGUyCXDZokaGSbOjHykl?=
 =?us-ascii?Q?fofuN1528OsDfd1+nYiwK7DlZ3Mcc5oUl2/WVMRRV9XQfZ2GS3ZZuWIr7rne?=
 =?us-ascii?Q?zl51Mx6ywNpiamCOO/2SbYZFNqk0OIqhe72dKS6ihxJhqwekUO0DIfJ/3ae1?=
 =?us-ascii?Q?camuxrHOxzEe8J3xHCn4cKFN2HFnBpe0RNxXDkQ2jGQyLDgxWxXW/zD9gR2g?=
 =?us-ascii?Q?frPDCSEufWn7hegW6bmEsgGU9nUowbIWjT3cxCqKrkXIP0oUzfnCw08RPDpj?=
 =?us-ascii?Q?Tx7DCUdQlF/JMzGnfAVrssjcJMle6x3Wctm3PYhXZNdo2sxhgiIbOCN97HzA?=
 =?us-ascii?Q?4oiS5u1dusZWS+KmYQ8Ma9w24m/++cxRqH8xumKrIGh0r41KT5ABmdScU9w9?=
 =?us-ascii?Q?+B8ajfSSp7mDA2JX/boR5jVfaKIQ8lEhU7H4z8A17ghPfCGfOEo1FPZBVfmU?=
 =?us-ascii?Q?m6Ghg1W4KrCFk4Fmn53Nb/GEcsuIvw3/Or3SlHTGE0GOjGvkg8t1hr96D+Nz?=
 =?us-ascii?Q?9AdYLVhJC5BKms18uYNBnAITjwkJFFjmME34Tft92RP+jPGdCJcEsEZmbB1t?=
 =?us-ascii?Q?J3buQUdb4qifosn4Rr+8Qgb17K/huq0kCJ3N2Frar/egXviyZz/JYZJhUwAz?=
 =?us-ascii?Q?svZ7/gbK7W+4FwyYsYLBgw/XsFfu4Bi8faWSxpuNTjF6i4Bz44LW1Pm+ssTS?=
 =?us-ascii?Q?u0TKDGjJ5NQRGkIUkhw7VyeQm46G2QBy30TT8pXKeNddbUnUGZdovnpnmoR0?=
 =?us-ascii?Q?0PsxSyOP1Jj9T6PACzmxlK4nj/Lrh/ilMr92LykWEQtYIBuuOQGt/Xt/BInD?=
 =?us-ascii?Q?BwEQtXbpGQi3HC/59P12vXLd274tZIVvoFoBEFYQ9jblGNbuGQWjI1IdaGA0?=
 =?us-ascii?Q?H/toma52NLxbqeR9mAdMAFS0Gaq2PvRcEKiyPszRlSbobblA8OggUBkbVUuA?=
 =?us-ascii?Q?sk+q7eL5vhsafedOFkwe2JvotVFwLMtjMUvIHkF5HfFuSdQ9Be2aVkFwwqn0?=
 =?us-ascii?Q?DcVIplGjsI+F67KDm53OLWoSYPhkkSXYvrCuYxiTc/swtYOHmA2eyKnf39oS?=
 =?us-ascii?Q?tfQtMsAxgOIgFeKsAt3c1JNJtdruKYOrI49rRLbZNypDpr9to1wtJRJd1j/S?=
 =?us-ascii?Q?PI9SnvRRdCSOrJaWB6wu3k0APzOcrLv50HavXYoruXOAkmMr2VjiKmlhYUMP?=
 =?us-ascii?Q?giPlXRJ4ngIKc3D409U02dTY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?30Y+AzOCCzjeYjMAFOlY9l/ksbeowHk7MJIvzFdllG8uxdf8FSU2Lkbn978O?=
 =?us-ascii?Q?mRySgqJ3RbkR3iBsB9oPsHdsngqcTDVVGXGhloBlu01fK8lJSgxNW9PvnBIG?=
 =?us-ascii?Q?ynk5gNHI8dy67FxDkB2NUCcygqELQ+HH6u/z1PlCZgId8rj8AJa8fWW3kIjY?=
 =?us-ascii?Q?d5IQF7fDcaiMvTImbPVp4rj01yQg6P4wG0aei5HU8Fp7t1zaG5x0PV/4dij/?=
 =?us-ascii?Q?vJWFnE6H84sZFVOk0BC9IjtK7NkIIl2e/NLTbfT3IbQzBPuOSEyYupwHIw4l?=
 =?us-ascii?Q?EshQmVTQ75coOvOcasrJGrVjhMXKJGHiap+Vv1F/x0C1cD0ucnTkEN9vsOQ6?=
 =?us-ascii?Q?h45yenLkgEc/cGGE2Gu1PWF4UgWOu10mVranUtDXKkBhL8Z+xJaVLBfAJ/Vs?=
 =?us-ascii?Q?5cYtMAO7MGua3VeHsKDlo2v5SJJiRgwrZBL3xLOQvcAHXFeZa1aEnvVXHuMs?=
 =?us-ascii?Q?aDwSd7i1Pl4dj6Qbgs9pRiZ7vow4Gwym2JTqEH2u8XPafPjUj/kZD5/v2dkE?=
 =?us-ascii?Q?gcd442UbHmSJtTZ0M6tXhKR8CROhwukp5C+VDfEkRZzh5ATBAz10q2rAyZUB?=
 =?us-ascii?Q?Di3InMg7hwmhJD/kvoB8scRnvxLCqqsr6t8D3NxSUWzSeyxsc8PXuJc15hNf?=
 =?us-ascii?Q?KPCMReZfOli2DCALVllyInnHnLbOuf0K58FmimvG4hTgUE09452vmldDfbhw?=
 =?us-ascii?Q?W8SHLPRtVWqYjSqrgriEIqOyEXXiPV5f/JuPSlRyQFZVH60a2Q/9iFoDu6UR?=
 =?us-ascii?Q?dCUAAklKbeKOwAApZSeVV3q3/KHIbupctOc6CwuMgNbEIiHmMz5DZj58nKoa?=
 =?us-ascii?Q?4ZibF4e+NtgV9eceznZk6SWz9//IFEL9IGpgR2PnDSZNMS14GUhBU51YaLh1?=
 =?us-ascii?Q?CAzjg2OiDI2Rw2MVQ7GLSxqdM6hsTy1fjCqEv8psUX70FH84GFX9eZ1eXOFa?=
 =?us-ascii?Q?/KH7yccKjsFmn9o3rz0j1Pnu5Ij3BE+3yejHwU//07cYbJyZlqSBzo+dEuh/?=
 =?us-ascii?Q?l2baql6GpMf4fX9Ev7sINQxV7y9cihnXSgIoI0I9cnWYGYubgUg0eLbp/6m8?=
 =?us-ascii?Q?g0dE71hs6ONhcx/VoPdyKj/QF5GblmyBwzxKHa6H6xLtVyBdT9Bym2MYI8s8?=
 =?us-ascii?Q?8diHYLVsBrFV/XdGpSn1p1tZCLWGQ0Q68X8fy/yJXnV9LCqmZPj8NIDanSLN?=
 =?us-ascii?Q?JJXoYCeRrfgsTXc2yvrCxK2zICWvn79BNUITMyxRFYcwBQ4zouo4yeMS2KKd?=
 =?us-ascii?Q?wynjXMYuyxdl+vizeAenTCypP/heG3XnBodMvrlh346wnNc/vPs0oAwjOCxx?=
 =?us-ascii?Q?YE084Vxn/r6MMG7D+9ozL9VH8/f3IvWAkGRPejC0UvIqHnYzbfIiQfTCjX++?=
 =?us-ascii?Q?Z6L9w7/AbHunsTu9MeQSPn3F2YysGphynriAQUCl4tFejAMBlxvJjecrziFP?=
 =?us-ascii?Q?sdWOJpgR+cE+6rbVHKXIHnLCX2EEQeMrK+Z/GQechL2lWBLL/xP2WnpPwnLA?=
 =?us-ascii?Q?5NuxHugjlsTb3ID8oyKy/QNVbdTFHM7roCurkt/F1H/zGqLaNAyGn2l0lVJQ?=
 =?us-ascii?Q?LAupJQn2NdGu4kYemBzh8SDTNDutMLh4z5k5iq42l7Yo6OxKF1vycfiG6HhC?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sEk2xcnGifDqBz12LkowcdmgIKJDyHLIUbV0VJcNSwOW+9iIcWLdBzadlyC3HeuzyWF+FoMHEBligAFC+IDvViOzAEKK/km9UoMnBPPMO+ycfoRxQEmBIzi71vF6gKqhFhc++IiGCbN/YRArwIm9punSL5IpTXuA7dHSaiEUanoJSpnVjCVR6pJLhMrUGVkbptzQTZwa2YPy/1OGBom7r6azurXTnHqzfBvaqxSsa4YUpZu2KjrCGX60oCyxLJU5iZuE9nWwyWp6nzYecyZeK9RQVGWQBQK9WMDvkGPx8OzkLvsn7pXKKsoLMnZKVQFiwWa2E6u1AlZ9fCERcHVtB+LynaaQd7VgyGM4V8jQrqS/8QO8a4pDizvW6gWOfB7uRPTVlofzgtdkkxu9OZXglp6T1W9YRWcNdZp61M1ZeUVEwvsv83SpGpKUJvQdxwuupPmKUccl4FWdDRgSUmF3y1jhBrbfmhIJE3UZ7+rq4yJ5ZSiGzANu1xSwhyG128SgSzzFO39ZX58avmiv0q/8Y5+yeBQipGVjcJGjUsM++a8ePWjIS6KO4hsxUAKOwf0jv13CVWXXklhRCFD+0rqwR5faZD0btjaRwcWye7u5/ww=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9c7431-b191-48ab-2ebc-08dd08d11e19
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 19:34:00.3585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7U653CZZgVXHxp6aJ4dgJ6XOxE11yAKfMxO3Vw+oJaWsK25SiQvS9pNqPFPME1ylR3XBqNaf6GenfhiJgeRJoviuZWrJuGkynIcOqBIW1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6125
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-19_11,2024-11-18_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411190145
X-Proofpoint-ORIG-GUID: CVbEZS47S8HqdVq8VWbwnYXaoQ2jpeM4
X-Proofpoint-GUID: CVbEZS47S8HqdVq8VWbwnYXaoQ2jpeM4

On Tue, Nov 19, 2024 at 10:21:52AM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and thank you for catching my silly mistake.  I must have edited the .d
    file after generating the .r and forgot to re-test and re-capture.

> ---
>  test/unittest/misc/err.bad-prov.r | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/misc/err.bad-prov.r b/test/unittest/misc/err.bad-prov.r
> index 3d1bf3010..6811d3415 100644
> --- a/test/unittest/misc/err.bad-prov.r
> +++ b/test/unittest/misc/err.bad-prov.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/misc/err.bad-prov.d: line 20: syntax error near "}"
> +dtrace: failed to compile script test/unittest/misc/err.bad-prov.d: line 16: syntax error near "}"
> -- 
> 2.43.5
> 
