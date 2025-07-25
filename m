Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33608253925
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753470472; cv=fail; b=iK8QShUJlo8uqpUmYRyArRoe8VGwJLu6MAfFZoX+hPinWs+vNhR+5V0PoKrnXDOKpd93YdNKKt37+mhSzMNC8rwm+2slUcfB2ixRkueCvjbv7iPxBbSQz+Tsdd7LXP/Z44mXnKD0jX9QsHNI6WuIw6SmGmthvjD7/NUgu5j7U6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753470472; c=relaxed/simple;
	bh=sc0VF8TxTklZfkWEn59VxHG3ZO5sA8vG4SfnBwdEWcQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=DhWL7KE93SMAnLRnA0WkSu3DPD0tSHUbgEq32sHXpGA/Uic5cRpMFRpS66C/cI42Xm02v4dbNVu6ypQhXKmdt7bwOgsdG8Y9ficbKHanKdpoQc68m+wtLwo/pw7ET2t62sPpzsfT//b5KdB8CYNu8s9O0AJAx/au8uy+sWM7tYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MT2FoLfO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dHoFIgwE; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MT2FoLfO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dHoFIgwE"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGCK5k007438
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OU4MgWFRDIlvEH5KFB
	eX+3UM1rjCgyJCg6HML4a3ksA=; b=MT2FoLfOJ1utzwrvv046coZ4Ku3wvhiwwm
	7SACK1nWmyI3LH44+JxNlp1FKmqgcMvaRm1nyLPLrAovoq82Bwi+eii79HhcLW3H
	2o6/CSMmf7l8kPhz7uOvKnGOSZekSUn+NNyK3Rtw0+yjOrW9qJ9gU1PJTIUmxsxT
	jf11OiUrEFYJ+IxawsWRj10ZX3ey+rWcD7vhJQj1vvby2jkHlCG8erZX1OGQ+mMc
	lywBzBaM6lrpTaWxwtcV0Mc97rB/IPlpzJhaqVOaQN7dEUTkLRRkqdgIY1N4DS0f
	ZPpfoAQZatkhARsEIqvivuXzrtWCg7HBXHgHAzjxTjFyM1vWO1iw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1k9q25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:07:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PHVbtC010255
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:07:47 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tddqmh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 19:07:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V80xtncLazOyH4S13FrpHZkkSfSz2NaAZsh81nLJD/vwhKv0lM/Kc8vSt1A0uafw7vN3YLhTOUOvt2TLKn2VOdosWEzBwyUrxd2D3iyBvwRDOLsfctJzCiR9SA+ZcGvCqvpZ6tXCAYccjKd5wpeE3tJlH0H9+Iw3ACXx7OKL2ZIKHoysqpRgwlUk3UMHzT+uFJon7Knt5RlHFRkqsRmpwgiEvRNvXALqaW6E7X6/40fY3cocLmjVxfdAE2+tj4Dz7PLZtN7ZZUbCoXPOXhIrch4+pQXo7a2ir+gjjdxPDn8B4TyOJlRJ6O2m6RLh3cBCuiA+2zLGkLK9zP0bK3iiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OU4MgWFRDIlvEH5KFBeX+3UM1rjCgyJCg6HML4a3ksA=;
 b=bHuObW6wKkL5RLMAJtT5ziv+7qyW8qn2GtbJ41wb+eH75dOnQuu1DPZZuT9d0rTuWGjSdAkTvpGn1zhRDIkNoIzmoBzzox0rXKczSIPlr8yctgC6FyDtzhBPvFBXY1fpJMFPXIxCMUwrd4Fx0QfE4DMM3Rl7LF3W6S5TKwIIjbDE891WCV9xScZBT+q3fjXrBCZh5yEIEsl7WxrgtpUnB/CUJ2ryAPphlfuITX5XTZhqNV5XzA5t5EG7Ku4DoPkeoTSH2gtMV5/z/ANgWYRTzh8NffNP0Qcwiczx+F7x9F3AKVIwP1Gxrf/Pyu+JQdJSni33TGrD9RiDhYiH8WOgtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OU4MgWFRDIlvEH5KFBeX+3UM1rjCgyJCg6HML4a3ksA=;
 b=dHoFIgwENJze1eHXvjFVuBz2okeqTLy8FOXNemd8Zp01CtEe2zqGlRgnyqYZPRQ6gb7WDpIuX/EkGDi+yiKlw7FOBcWVvfkpg7K9MT8fWpy+c5d4OJT5tAIQwR/hXDvyevDtOFenh7iyos+dFIQUFPl1A54HbYFk79jLzGk3rDc=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by CH0PR10MB4844.namprd10.prod.outlook.com
 (2603:10b6:610:c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 19:07:45 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::eedc:3845:77ea:c7a0%4]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 19:07:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH] btf: fix symbol BTF ID lookup
References: <SJ0PR10MB56726C5DD50A9020370699DAC25EA@SJ0PR10MB5672.namprd10.prod.outlook.com>
	<87seik3yme.fsf@esperi.org.uk> <aIPVXuRuOvRLxy3C@oracle.com>
Emacs: the prosecution rests its case.
Date: Fri, 25 Jul 2025 20:07:42 +0100
In-Reply-To: <aIPVXuRuOvRLxy3C@oracle.com> (Kris Van Hees's message of "Fri,
	25 Jul 2025 15:05:02 -0400")
Message-ID: <874iv03x8h.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0321.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::21) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|CH0PR10MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: eb289435-b3f7-4fb9-b868-08ddcbae89a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F37sNMce6KKt3/mcOdVEd8X5Pw2XofKD5x87dGZtah9bFHlVep9G0Ek7qLPx?=
 =?us-ascii?Q?AdPmZT0rngD7fCFLFHO4qvzEOiPxwkF7GHp42TlajXpkW+niM4T8nSE7vA73?=
 =?us-ascii?Q?q0oZQhkpoHh7kgO55lP2y/wM2V65Ba5cj2uSLLTkcCJBFbkcUbP3lycSlN2o?=
 =?us-ascii?Q?EjBfRHxIRtzWTY6Hmqj/+oKe45lmicZ7VZi4f6PqxaVlDtM3cR4hnWypMUg6?=
 =?us-ascii?Q?S8nDmLEn4Yqga0Q1imlsg9FTt8jRXTYHZCUurrH/gm2Sbc6TUtd17A/IIuYa?=
 =?us-ascii?Q?IWY+bvS/Yy9ZTey2VhXyLv2HGBHRe4DR97S54QcLerXmHuVnnVyB1luSXtVA?=
 =?us-ascii?Q?bISko4KU1oysdvxBMCDmYuxrrj2ilRXq6nxXIu7lXLIrekIk+XMCXol4qrun?=
 =?us-ascii?Q?V46658IjZfUo19su1QjEfXhcvHQ/C4oacpUExcdNolHJO9dPtdDi3MV0Kkv3?=
 =?us-ascii?Q?RCGvPMbQw05Wn15oxtPyMYY5kdomdHl5+Cyo0U0to0Js1HJPP/z2wiTEggmg?=
 =?us-ascii?Q?0lchcwMiQJqslm8AzhBYx3r/rPuw46A6TGgchsdhMlWX6Fk4D27Z23N7esyN?=
 =?us-ascii?Q?dj6FT7wK9VeJ+aPWkdlCS/JISlmwdY16kDMkxvsUMHoqVFK0nnDGyqH/DSVq?=
 =?us-ascii?Q?ETs1OLLVM1faD7FYWAqzfAqmjhKZKhCk89uCAkOYAGw6/kvcGxo73Hpmpe3V?=
 =?us-ascii?Q?JHCdzfnxoKngdZYHZBxs+z8Au6V8cH7XXHZMBS3Z8e8LiBSsRCq7JinaEfVV?=
 =?us-ascii?Q?n8HwpkHQzvO254rMf5r03Dm4JkNSu+hOVMhI5zibIXZl0eNyuoLTw/cpLudx?=
 =?us-ascii?Q?CMZGqCPjuwd1Vx4kzojvI60xhkuFmMpDdz1B/VyO8Op4OpO+czOSgrF0gA10?=
 =?us-ascii?Q?0FS6J8HNPJRbMwU76+wYkGdQv/1I1UWP+/8D2eLxfwyid0NlqpjGXX/aDDpB?=
 =?us-ascii?Q?UmudDBk4Zd9nMv54N/NrhjHcQX6Do2CLOdrtuUyg8QIfONRssKqEHtGusrsg?=
 =?us-ascii?Q?vxbs1YXh4XuI+MV/lBZRR7yv9s7VDRMEhbonWVa7Q13CdvJ6LrTk6F3erClR?=
 =?us-ascii?Q?HfCBqS/WZZJSVQEUR5HBp3rzy36ByAe97ZAL/qzLWv8JpRSCwkLmc2nHasoV?=
 =?us-ascii?Q?7eym+4+MzU92eYRKsaMtSWZbliQR3tJMGCLu568rbNTKQBK9GtrotMg2sFjF?=
 =?us-ascii?Q?sKLGq0Y9gLrpUIvqcP4N1WkfUHzfNxezR/A4kMFFHMHXSg/uxTXD8vo5kBY1?=
 =?us-ascii?Q?cMe7nGza+hn/zeD+NX0oSZEDkCE0nmI/qMnUgd+TT5rbYqbtWT0jrB2fGlkt?=
 =?us-ascii?Q?FxfJ7qqeltRToTbWsHjbbiwOG7p42jq5zRJrKLKh6tW8mdMDA52b+bS/C7od?=
 =?us-ascii?Q?KfKMGJ1nm3BnQGMb8nTpfnHPPKwT+WdcZQewFNGuRNfSMAwB/4azyOEpwQ4/?=
 =?us-ascii?Q?1Yw/WEVFdgY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YeoMGeqmlK0ojrG5FK2sT0i14MRx0qxuefR2SpG82VeCHG7JH1uLZFQCzSVA?=
 =?us-ascii?Q?2tEpz5V6eKDTaoEVe97YdCNAQ7ox1Mf/7rBZNwbaZyhytcJEn3f4OVFBn7w/?=
 =?us-ascii?Q?moKB4FGwb0Ag/dSvWMp7J9o4g1UHOb+dLJXgfhoAr2a+XJ91CfN7pkQlrLFx?=
 =?us-ascii?Q?KpBJ06bikJCZemPoojd+5hbNXhWR4DOdbh1iOlicm2pXCNZScMb1Y/3P9pHK?=
 =?us-ascii?Q?FW7l/WriOFdop+YV46dz207dXMv+XDs5obkkGHC1b334GCJX5g/lz1QfB5/F?=
 =?us-ascii?Q?8XofQpZGZwVXlmwV0GpIyKY/UHUOeIEE7AnJTGeFke3SEwCNFOtMONRsyLOa?=
 =?us-ascii?Q?PgsQFnTSSmd8dnlWdCNZUB28bxAnlOipirRKBdKZt+0Kr67jqUy9we/BST85?=
 =?us-ascii?Q?K5ZS/PIk81bLXqr9dJ84yhvMjcpNBJk0TYG5H5uC13x1fiGEytxeTVla2P3B?=
 =?us-ascii?Q?dCTbt4OX9ce4P+e4+mt85Lt+dlMT/bSt2Z5UoLW2daIetN6SYc63dJrlNvC+?=
 =?us-ascii?Q?3N8bxDbbVXtR9Udd4o02n/Xjjzb8CSwfzUIw0TTw5+qkOL3VRcE62XN2rC6g?=
 =?us-ascii?Q?b1HNIWSfqWvI5TvpFL2kCikNGilAGGFu/i7wAzF9AF34M0y341yrVZvCR97E?=
 =?us-ascii?Q?wf3X/3mmi/9PdKvRV8++7cOfhIBGLDb/h15u/2LQjeNwGpZl7sSrHHdlFakQ?=
 =?us-ascii?Q?Wcy62cQiJ85pvtdtds4oqy31a/0dbXuUe8ToVxixSENzsX+56aSvAfiRm0U2?=
 =?us-ascii?Q?1ampgJsRFqY8xJ28egn/7Z7Y1L9EaGaFmeBgqvYiwkWsSNx+cTQWk7J6Ng7R?=
 =?us-ascii?Q?Zf9Rq2Fa2OYvf5E3NXk9DJo8u4AgRf+klbUXMwOCSsbiKuxzA/ztbkDc0FwS?=
 =?us-ascii?Q?JBBpvypZcH/CH5uorgeUXj0ydVy51ECXGsQ79Ck8Ic0krNmsW621BFa77Naz?=
 =?us-ascii?Q?lkK8ogQYSa6npfxKA9Y9tNjpGODahcSVxMJrQsmAmqvfh7O+d2lJpQ02N5jy?=
 =?us-ascii?Q?Mqpjk9Fs+0stsDBr63LSmDRB7oaKJqMycPV7c45oBIizMEqj4v5s7W7Mbe+u?=
 =?us-ascii?Q?ih6qEO8gbYFcKl49lq/vExzXIVIQWUp/QChm5pvXBXmkz8/LbISPRnqtGbuc?=
 =?us-ascii?Q?CWX78AFBky2Yc6us50wiORxdKdTs5uHyhkCsvQRpdwAj8A9HTldws5Z/iUHW?=
 =?us-ascii?Q?SIf1fVwYdJ8Lqfw+OwvlEtDbBt+tOvTteKIW89Ccu4fGUO6SuEYBT6bMOBHY?=
 =?us-ascii?Q?Xv0J7hn49NZMP1G0i+Jccq2t/GC7EIUN1R43lm8rYoyV84hjoZpgss3PLDRq?=
 =?us-ascii?Q?00cbe3qd8Nez33qp6d0b+RdyRzuYj6BRsjGntcRlOtuvN2W0nHzhzR1e23JU?=
 =?us-ascii?Q?i0bQWnyPNuF2zrr4sVxw88Yj5DfngdPvYAJxeYtP08JXL6UY7n4zqR56m3bk?=
 =?us-ascii?Q?L6dkiIss3rcEQvcqpX7PVQPabDwZp4p2tOm42kXUJk+rfMrsnQKiFrGgUWjx?=
 =?us-ascii?Q?LDcnJt8v15xEWcbv7hZVrjJ9BXdoqOtrRgvtapi0VJpX26sloOU3am2mNF7X?=
 =?us-ascii?Q?8jtKI7U/xhUonuE9VZQ+XrorO5iHxRWm+P+8p0H0NEK+FK7VLnuOlHQIZyCg?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5RmjIbgphReFMxv7YmomXqPS9dji9ktGfnSd2YHY2zL7tpJk1PvtyhCTav16XF7l5yHXs956skIRzd8oYNoGSjkSbEwKZZ8s6GGEsWd6xrzvgD27HCOnp3uoTnkcXj208l/F3SqCoamKmgANDkLayuOkK2rjT6jI3ak9ysjVHjwV9sXW+3k/CwwXkQs6n04FSGzsihklziCG1xF/754TZ1tqnWMfXDRhxlTXdIfDkcTuKfVsdMvZ673i4hBpJTKvHnp+2Oq3W4ucJZhm04/mvqW9f1EcLtuP+mXvwhAd5NSF/jHabRH7ji1Z1OEmFSifOFdFTmKKPgS18gFy01SBBzqexWru56XI3UODiT1W9OFAsjHYgeY6Je720e30oTMURNIpvT3Pu6HgC4Fv+wJt+nkaeBgfW792dzb3Ww+/lUvfalNRAlvkfykRJR+uZHuGgp1Mw5vOqJOK9E1HcSC9MvxmfKzT1GuDpQs8vRq1mX6ir6VFjgUH8QO5sp9QBFQLGL4u6vFelOfeE4IQ+/LUbJllZiKVmGpiZHEG/YjIjlHza46qE4S3UjKl10bSABz+juLs9hvOYDtlxSKh1+6L5NpWmmwgIgy083zpBNVUWqE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb289435-b3f7-4fb9-b868-08ddcbae89a5
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 19:07:45.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owqKe0OszBBcP/ULyp2WYXrMU98LICIXfI1erCkG4/J/2iQ/9ANWdOSSwraSNYCQQ4Gk73e8XyfMalnYufGcxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4844
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507250163
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE2MyBTYWx0ZWRfX0EY5bPWzCrm+
 sSwKhV2BwWA9h+UPnQ3JPIinNZWJlj1q8srjbAs7dVngq+yzh7A095KcIWWbLkEc5mh+ANhBmnQ
 ax75Ay4sKrfGLmcdrUyYeEfjILcY1krDdXnpDACtjs3rZL1rIixNztGipHXXWl8BTKd2IlfXIY6
 vDLK5n9iv3ybzISvwYptsqe17/hKeXnhZ37IiQmUtNb+143Sc75P/H9kcOLLcOmqahwvFj4mBrB
 q9zx54Fe09HYaTp1YWgEX/cKZJjjY6ZiPGOTrxDaVczmllXS8z1wpQ0uw/qfYYKmX/hdSQkeTM/
 6ki4KE9Zx2YC0vJiWhCQ0fg8d3zGauGkSFYJWRZiATfgwghUhpBWfNl+uBEDt8lwkuSS1Omhy+k
 hYMv14EPx7r6nm3n/aTlnw4JrYu/IVWKR+EaOd6FWkbeXRtBcdvJ0oTbtcAEQer1hGMENheS
X-Proofpoint-ORIG-GUID: 3xY2OHGmJ6dk2jZvLnUZx11PK0rc2Jre
X-Proofpoint-GUID: 3xY2OHGmJ6dk2jZvLnUZx11PK0rc2Jre
X-Authority-Analysis: v=2.4 cv=JIQ7s9Kb c=1 sm=1 tr=0 ts=6883d604 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=nL8zkiHKlnVg69sreNAA:9

On 25 Jul 2025, Kris Van Hees said:

> On Fri, Jul 25, 2025 at 07:37:45PM +0100, Nick Alcock wrote:
>> On 24 Jul 2025, Kris Van Hees said:
>> > -	/*
>> > -	 * Ensure the shared BTF is loaded, and if no BTF is given, use the
>> > -	 * shared one.
>> > -	 */
>> > -	 if (!dtp->dt_shared_btf) {
>> > -		  dt_btf_load_module(dtp, dtp->dt_exec);
>> > +	/* Ensure the shared BTF is loaded. */
>> > +	if (!dtp->dt_shared_btf)
>> > +		dt_btf_load_module(dtp, dtp->dt_exec);
>> 
>> 
>> If we don't have the dt_shared_btf... load the dt_exec? I mean yes this
>> will probably load dt_shared_btf as a side-effect, but why not check
>> dtp->dt_exec? (Hell, why not check both?)
>
> dt_exec is the dt_module_t representing vmlinux, and thus its dm_btf *is*
> shared_btf.  And if you look at the load code, this *will* initialize the
> shared_btf (not *will probably*).

... yeah, I forgot that dt_exec was a module, not a CTF. It makes sense
given that.

>> >  	if (base > 0)
>> > -		return dt_btf_lookup_name_kind(dtp, dtp->dt_shared_btf,
>> > -					       name, kind);
>> > +		return dt_btf_lookup_name_kind(dtp, dtp->dt_exec, name, kind);
>> 
>> This definitely looks wrong. The intent here is seemingly to climb to
>> the parent (the shared BTF) if a lookup in the child fails, since you
>> don't have anything like libctf here to do that for you. Replacing it
>> with a lookup of dt_exec isn't going to do the same thing at all!
>
> dt_exec == vmlinux, so this will trigger a lookup in shared_btf (which is the
> BTF of vmlinux aka dt_exec).

Aha. My brain was operating in CTF mode, in which of course vmlinux has
its own dict distinct from the shared parent. That's OK, then.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

... and I shouldn't do these when I'm this tired, this was all obvious.

-- 
NULL && (void)
