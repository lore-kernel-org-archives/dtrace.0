Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A866B225797
	for <dtrace@lists.linux.dev>; Thu,  5 Dec 2024 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733424828; cv=fail; b=SpnXSE/8kZOySRWGhA4gbszWWCAuu2Zc55IJbgNm0zdbfUxkzlRzF1ofQ//l5e6t/+9VksFLSd68mFJmfgnIB+HPiBVrHkNx/ExXsNOdOcufixoZpKliG6gbgU2Vy/EDUuILbogmZagXwLmsUxeTMWvcKSagEHeHCu7IRUFkDe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733424828; c=relaxed/simple;
	bh=TYne6vWr1I7I90XjRxy1Cj+M8Z2aqqtVmL7uvsJSKzs=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Uq58vMXCYaxTUiBD64lmyNubwU6bNARQQktRKClwdAPua6VyBWEOwJZu+PswkdRtTF5f3wGjDYHE5qho5XNcuD4xBiDomXcLARWpFBfa8BYuxc9SQrBFvRYibfQgQvnm+Dn2RjjzJiDEk/iHIQIzqr+zW6YmFIzKKoQ2mIW2ITU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QKtJ/nNj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BxP8F01g; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QKtJ/nNj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BxP8F01g"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5Dfupq010357
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=dQtAMFB3lB5x+tImFVmL9We+qkxa0bLlv6pIHwwM6Xw=; b=
	QKtJ/nNjhnzYUhIQTL0O+1WQumwg0R5zLU+VrctG1k2jPWZ7Fc5sjMZx878MGpmN
	NwunyKhA5rvRLFgO1bIUnZpTwpa36aVxTVW0cBcep8p89u9t+FOcSIT/cF6mLria
	UNHDX8OApN6IjRfA+GTVZO3kFmXRzpiPoo8ZfVgjSG9pFCtJAIerVCF/7vNdY5L2
	a1ub3aaZsJx+acidypoTkf4iVJgDfuUoF64uldlwTh3rJ7PsIfkM9KYpIq561dnO
	iAyJ2y7zAMI9Ov28+JkFPHRCPBgxGvlOZeV/Q8yl+PkvMVQToXl/qqZrnEmZZIxV
	h9nao+Kg8tjSDDOYiJbmwg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437smakyqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5IAjjV040353
	for <dtrace@lists.linux.dev>; Thu, 5 Dec 2024 18:53:44 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43836x8kb8-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 05 Dec 2024 18:53:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYro9W7g4KL/zER0lu6WbM8rZPT/FdKFNHHipy69EO1wGEv80CRNlTykOfXc4HArSVgf3d158UYV+Dr8OBt5qUSgtQWCWtRVInRYjna/aSf6VUytsQ6xWMZmuAWabwvb2WjzYGEgJxtAhyOBZ9g8cf0nJPie7+seJ4vRt8rbXAETO9zRO5ZAMIH9nIP/kHhprn6NVvgncTtmU4QszgbRQ+oiV0UvAZ5Zm86ZdpDyOQCUzJ4oXlLUcj/FQ+H/Cn+FYP8J/aXbh05bGsc8US3ARtffj+OuwI4HktK3RTniETOaBtmuB27DbocdYvRzSRaAkanYQXUER8qDRAtN/jsbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQtAMFB3lB5x+tImFVmL9We+qkxa0bLlv6pIHwwM6Xw=;
 b=UWHg8s4LUYKSRnrlNAX2MjAEiUQ2t6TwAbnivI40tKkvhI+yMsOjR+dvEQ9SNRNZ+BhogSAnnakP16Ph94e/XU00bzWUjF2fBwuZ46673562zhGfnbxcEVEuqpmg1ePIXBeoa7phfm9QKdQG7qxJE0LxDgnscqI6aFlSdBnPCGBfFsrBKbXndfHz+kMsh7asEQSDBwTgRG7jBcvc2H2pVMeEsu24Mn+biPO1v2kDflcrFoY4hgVSs2mDaTDrZlvy6r35Q3TyecVT3vJZIWRMkx5vBYSu5A+cjZsAn38WhEAichyyRR63/YcJeGVZZjjKI8OuogO3WB1F/ocxIfqepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQtAMFB3lB5x+tImFVmL9We+qkxa0bLlv6pIHwwM6Xw=;
 b=BxP8F01gbUiO/6agYK7OVN1cFBwdZ9CNQ34J2ZkHii8TWLoQmgQEonaBenv/HQ7ibHfbkQoAeMbD4FaL3IveQq5oH4R5aPhFEPY193LvhHizUE8OtxigGQRdFeQG0hurWwRGdwJF5PO+OXVcAykFLJ8KCYZ0SuyTgpJl13l5brs=
Received: from PH8SPRMB0037.namprd10.prod.outlook.com (2603:10b6:510:17b::21)
 by CH3PR10MB7282.namprd10.prod.outlook.com (2603:10b6:610:12c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 18:53:31 +0000
Received: from PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e]) by PH8SPRMB0037.namprd10.prod.outlook.com
 ([fe80::1af4:aff7:305a:7e3e%4]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 18:53:31 +0000
Date: Thu, 05 Dec 2024 13:53:29 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/4] rawfbt: new provider
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0437.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::22) To PH8SPRMB0037.namprd10.prod.outlook.com
 (2603:10b6:510:17b::21)
Message-ID:
 <PH8SPRMB00375EF399EF3CAE90C6573EC2302@PH8SPRMB0037.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8SPRMB0037:EE_|CH3PR10MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 435a4367-9399-4c33-351f-08dd155e1cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5zFghonIFofR5Y/WwlsA+EDnrEQ1Fq6fzBjknhkK66wapjVXqXq2gC19dLIC?=
 =?us-ascii?Q?KWNZilIgH9KRpBugQiVj0GHX0xdBmYI1Kn0H7yIUR1z58Wm2Mq2RtKOa3oZf?=
 =?us-ascii?Q?reLy8z/3lYLgKU+SJHSu9gqZy5cwLmOQcvVe6BbKAKkAEtmCLNPKA4I30/Bp?=
 =?us-ascii?Q?ZG87TkC5Q/FIE3A3jO/0ll3TBGjHN0MIUcxhOEsSJkDzY2aFEN/cPVDKfhsk?=
 =?us-ascii?Q?y1So+tKvf71ydVHL98BN5xadCPx6qqCDkLvq5bJo4vAIgh3JVeySf1kTuOnF?=
 =?us-ascii?Q?cx5dhZ+BLDxxFbTEk319vkR6Rtke/S928L/FAVXS478n0ClDBs9T96JEFyrx?=
 =?us-ascii?Q?KX/qymyTK1c3ePU9jTgHI229wtOeVY7QCzsiXTFcrBHxOmc0ozV/YAmIwve9?=
 =?us-ascii?Q?BD4e4AiY8CicBCDDt/Mdh/V61ciJnWgnick3Q/fAMCzFcHFvDf8I6A9DMCXD?=
 =?us-ascii?Q?lM1TQ8LfJG42Jf8Ry8KrtlKi6PY7TmIxq/BjIQfIOS9jAv+1qxZGDudIf5s9?=
 =?us-ascii?Q?okUF4WgluPLnyaygHqqpP+gzNXvMeUsIvk/oWMtT9A5uFtCh3wThZBNaM4fw?=
 =?us-ascii?Q?QnSjKwKkQfmCsrKf8VBRXVO15u+D5KLT31uF5g6byTLuZei4mjD9JXTuDhrz?=
 =?us-ascii?Q?dGOxZqac3ATKc/rebX7ZtY2VDnsGSqNH8HpN9rTGYW3AtgOU/RhjwClBnkvN?=
 =?us-ascii?Q?JO/osIvynKGToDtlRTlW+CC9Sg9MtYMdtuLo6RD4T2xSAWGfm0qSHshNPeZ2?=
 =?us-ascii?Q?bjT6AetgqRSasB4Dd3TPwTKP7FvluM/Xp2/Wj+C5dN3TD/c3FyVXRziT7htK?=
 =?us-ascii?Q?cttnN19ALSP5UPtW6zPZ41WIxZXZlTFCc7SLiCMKDqrQjwx32aQ6qUhHhLOg?=
 =?us-ascii?Q?HoDSc2TxRRF3G7TvYCn4hUsMLnjOQzHgq/OvdIip8oQ1sk8H4209f1VO5NQH?=
 =?us-ascii?Q?sfGz8XVsim0ikQ58ISyvf+AQ1NnouyFV6DsWdRqnrdokz54/usKTU+8lr/DR?=
 =?us-ascii?Q?eUuA/LJitgoIXEr+iEtVFzQHBZMzVRt+mK54Q0BSCePnogpgs1Tn0KTJFAXj?=
 =?us-ascii?Q?OC4BCvAkaV/iQSbszP2BgMxcPe2YVF8Sg+WZSkLwrcgkAs3Oog75A4Hx1G3h?=
 =?us-ascii?Q?2Y1+uGNvG9fnBsJfHNDEdDqGXkbOdXoi6Y3OOyOlUHBYwL2dxEhKECHSf2zp?=
 =?us-ascii?Q?/HYzFYTdCDSyVzagYtJTsFihU50Kd5ngXR3QF0JwB3SheFaD6xnXjzJzmieH?=
 =?us-ascii?Q?oXi+U8jjIPSvRZe/e7L3YfNt69migj84yqsB7qq4dIZ7SwsirkYypfC4gHee?=
 =?us-ascii?Q?KuEGf88bjNXLj/OnkN2qJ9v4r5X+4onFNeQXRh01YS/tkMv04AmcB8kdUoaq?=
 =?us-ascii?Q?uGd3imY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8SPRMB0037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?drsuavfg6uaASuDZukolCz38cj+Eo6BuPaRCP+kJXG6LbrsCvdFt8GQ7BzQb?=
 =?us-ascii?Q?TRpUnjsNU3BAtIg/De0SsMj+1Nxw3ZFBrElBPpxOfl4rw0A8v7gxa6YmG5ED?=
 =?us-ascii?Q?zkdwxx2Uguzb2798s0maqZCSpJdsvUy4nMciH3RTx8i6TVPRWAGtu6hbMYXM?=
 =?us-ascii?Q?f1oTZ8jh4vc6rmb0z0dxQa1MyLpooJd2XDBvSQn4Y9Aj33IGcuDXA3g66Cht?=
 =?us-ascii?Q?hlvClW22dhpTPPQX3Ofm8mZ8798nJBp44BgnVlY2xA7TPBQZIKSEzwSN1OAh?=
 =?us-ascii?Q?OSXsPZ2ZmDSpk0tBZdCq3T5bqL2rHVPrWGR2KC0NbuNfi1wX+4BbDoI0aeoc?=
 =?us-ascii?Q?cAbhzuGnndi1Zjv9dJWsiJBD4a0NjCcnD8QBTAXL2Nrx6XfJj8nKca85TXHE?=
 =?us-ascii?Q?EMOBG0WcRTq+3EjYBEmy0gYUXB1mHEZC+oCkxdNleusi/75avuKnkUB5jXup?=
 =?us-ascii?Q?Z83Z/7/WKtyd175G+iw+3Gn0bZfiRNOJ6D3F7Hgsyyz+0+lutFlVxMflzlLu?=
 =?us-ascii?Q?ck3JJT7ex4EDYQUjfn7q1ZWy5SuAGhN05BlFTTjwu3EvyjlLoP6/oWNpziWl?=
 =?us-ascii?Q?d0dy23ZVPKh0A13JP29Ss9fhtZPjOW8qr7u+y4ELToKP8bYU+z4qBRhwy549?=
 =?us-ascii?Q?SBK9Iod0/oe+VHGRdjjqvAOH1ALhE69ghML2vw2i4p6Oo7JGXw1bS+eiQwb8?=
 =?us-ascii?Q?EJNud75JRo1uki0mb5o7gvbWS8hwCigGYUBIFGYCV6UM7koo9AwtYSmtJyHN?=
 =?us-ascii?Q?476jWrR5UArFgR6c7PTYJ+zDUGkyl5odJpaOGQ8XocP2wdjzW1LLl6psCvam?=
 =?us-ascii?Q?Ibs7IVIKFAiYwLw4VrIz43nSAo7xpSTmRkoIxrNZ46wWF3QuD//IyWIWJayC?=
 =?us-ascii?Q?gKIsR+WdYxoSlcSf3jfp2uRl6GANtz/g4edHpfow+Fe5AUtZtYmqzrIWbNrM?=
 =?us-ascii?Q?Fe6q4B2rErRdGMttpILtHchmxhVoYl6zLEOJh9ZCYIT1mQuowhKd68sNvFWn?=
 =?us-ascii?Q?UqgsEGX3v/zDu4PN1Jld51JCA9Zds1eiOuDGja8rOEmaLWz/Yjd1cY/0fh+M?=
 =?us-ascii?Q?mzLn2ptW5+Rx0c8F39WdEyy7Qv941oO4qddPEdOyRySG9KEfkCbMmD0oIlAe?=
 =?us-ascii?Q?DDJsuzf9bqHkSGQnPzC2CQ62B2BcLC42CABU+humTco4nUKErnRzg+1zrbQx?=
 =?us-ascii?Q?aM11gYNkP3FRmMZOdVt4TDUXhP8OsVb/pGmr3nwiqACcJTmeuZXhGVwjCs1B?=
 =?us-ascii?Q?ubdApueekkhV66uVTVI8EKYQLSzXggo/AIJTLr49RaRBoFY43J1Ybjub+fIy?=
 =?us-ascii?Q?BQIVLHlONcnISFKDgG2H7rLnBm/HNMU8t17aeWLPQ3zmT1g7rODYbumFCsh4?=
 =?us-ascii?Q?2vf0fBAeLjh5cYMe2ABwymTpvVULkLYqpV/Ro0L5cpbAe1KfUP7K4ZU9vlCu?=
 =?us-ascii?Q?u1lWgOE5n1/dBQWeaya0bGWKUj8CRLEUetAlxV2N73LKOM2qNWyFevUPhTHk?=
 =?us-ascii?Q?wpkwE2vie4PMOQ1JAnJQESDFAfGDC/LdvZV/PttQJsvuc8JDIKxqCFFzR1Dy?=
 =?us-ascii?Q?Y+0s47oyq5dv+SCyfBM62dj7IF+03f2FpPNaZN36RSZ4nhhYY0eyJ59MsLqz?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WIRhi1nddfEf7UHkn/qlm6RCRA8Hxmg3ffsXxTE/WHFAjCrFOVdEYQFMFKoa7oQ29b4oxJbi+MGYon2DP9xe4b0DKAyUbnpbSj+hqzBNTOv8ruWT3f60E+mVb07z0ckRBdjyHAmBsdWttGSHzmFiH5FvtwbwblfuFpIfZ2juf5Qe6RskZUffnIZ+/uzi9qRFx4ry3YVlrGOIt+mMkv8OxFmYXD65vCc014DgFkmiY7vSVbQM2cX17fqQaP8bxWd57vGkcSrqSQledx+CHPsYXJIXgnwQcXmemM4i4UelsBP+KrUuzE956bH6P12aeUk39CZq0NHWqsFV/gCZXXwd1iIxRefc7UAb9C3yC0YTsdRQeBCrA+UsJCafKJbWK7z6NQZnsuordYzH6CPkO1/q1HnI+LJO30JMVYxD5ElUpQkohys8CUf3PmNXfzS+ZEVsBlVzvJhQuLTO0VbNNG1s9kfL/ZZVbtwGozBloy3EoKKfypHXspyXBv1FacYsZFm7QtCNOCJaaDhkdkZ6UK7QyQ3cQutcHB/6nZhhWL7pJwEiam6VTwsHblT8JiOwhrWkNYVuIHunxqldRnXI6JVSw+1VLa883C8Qom8rYlWOMgc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 435a4367-9399-4c33-351f-08dd155e1cb3
X-MS-Exchange-CrossTenant-AuthSource: PH8SPRMB0037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 18:53:31.0408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJvyN/KQmtX46hViTtxWaZ1Zul9badkJRPo8UEzQtjE846qM2rWVfM/yn7Yzeva3H6V4Vhn7qVmjNn+MVUI9oLYnpzGGJAlzRqcUg2XloFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7282
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_14,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412050140
X-Proofpoint-ORIG-GUID: TqasZdVnRGR_mX0wpW31Kptr_xhf1URo
X-Proofpoint-GUID: TqasZdVnRGR_mX0wpW31Kptr_xhf1URo

This provider provides access to all kprobe-based probes that are
available on the system.  This includes any compiler-generated
optimized variants of functions, named <func>.<suffix>.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/Build            |   2 +
 libdtrace/dt_prov_rawfbt.c | 330 +++++++++++++++++++++++++++++++++++++
 libdtrace/dt_provider.c    |   1 +
 libdtrace/dt_provider.h    |   1 +
 4 files changed, 334 insertions(+)
 create mode 100644 libdtrace/dt_prov_rawfbt.c

diff --git a/libdtrace/Build b/libdtrace/Build
index 8d398221..72235159 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -55,6 +55,7 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_prov_lockstat.c \
 			  dt_prov_proc.c \
 			  dt_prov_profile.c \
+			  dt_prov_rawfbt.c \
 			  dt_prov_rawtp.c \
 			  dt_prov_sched.c \
 			  dt_prov_sdt.c \
@@ -112,6 +113,7 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
 dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
 dt_prov_proc.c_CFLAGS := -Wno-pedantic
 dt_prov_profile.c_CFLAGS := -Wno-pedantic
+dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
 dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
 dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
diff --git a/libdtrace/dt_prov_rawfbt.c b/libdtrace/dt_prov_rawfbt.c
new file mode 100644
index 00000000..edfd36b4
--- /dev/null
+++ b/libdtrace/dt_prov_rawfbt.c
@@ -0,0 +1,330 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ *
+ * The Raw Function Boundary Tracing provider for DTrace.
+ *
+ * The kernel provides kprobes to trace specific symbols.  They are listed in
+ * the TRACEFS/available_filter_functions file.  Kprobes may be associated with
+ * a symbol in the core kernel or with a symbol in a specific kernel module.
+ * Whereas the fbt provider supports tracing regular symbols only, the rawfbt
+ * provider also provides access to synthetic symbols, i.e. symbols created by
+ * compiler optimizations.
+ *
+ * Mapping from event name to DTrace probe name:
+ *
+ *	<name>					rawfbt:vmlinux:<name>:entry
+ *						rawfbt:vmlinux:<name>:return
+ *   or
+ *	<name> [<modname>]			rawfbt:<modname>:<name>:entry
+ *						rawfbt:<modname>:<name>:return
+ */
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <linux/bpf.h>
+#include <linux/btf.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+
+#include <bpf_asm.h>
+
+#include "dt_btf.h"
+#include "dt_dctx.h"
+#include "dt_cg.h"
+#include "dt_module.h"
+#include "dt_provider_tp.h"
+#include "dt_probe.h"
+#include "dt_pt_regs.h"
+
+static const char		prvname[] = "rawfbt";
+static const char		modname[] = "vmlinux";
+
+#define KPROBE_EVENTS		TRACEFS "kprobe_events"
+#define PROBE_LIST		TRACEFS "available_filter_functions"
+
+#define FBT_GROUP_FMT		GROUP_FMT "_%s"
+#define FBT_GROUP_DATA		GROUP_DATA, prp->desc->prb
+
+static const dtrace_pattr_t	pattr = {
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
+{ DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
+{ DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_ISA },
+};
+
+/*
+ * Scan the PROBE_LIST file and add entry and return probes for every function
+ * that is listed.
+ */
+static int populate(dtrace_hdl_t *dtp)
+{
+	dt_provider_t		*prv;
+	FILE			*f;
+	char			*buf = NULL;
+	size_t			len  = 0;
+	size_t			n = 0;
+	dtrace_syminfo_t	sip;
+	dtrace_probedesc_t	pd;
+
+	prv = dt_provider_create(dtp, prvname, &dt_rawfbt, &pattr, NULL);
+	if (prv == NULL)
+		return -1;			/* errno already set */
+
+	f = fopen(PROBE_LIST, "r");
+	if (f == NULL)
+		return 0;
+
+	while (getline(&buf, &len, f) >= 0) {
+		char		*p, *q;
+		const char	*mod = modname;
+		dt_probe_t	*prp;
+
+		/*
+		 * Here buf is either "funcname\n" or "funcname [modname]\n".
+		 * The last line may not have a linefeed.
+		 */
+		p = strchr(buf, '\n');
+		if (p) {
+			*p = '\0';
+			if (p > buf && *(--p) == ']')
+				*p = '\0';
+		}
+
+		/*
+		 * Now buf is either "funcname" or "funcname [modname".  If
+		 * there is no module name provided, we will use the default.
+		 */
+		p = strchr(buf, ' ');
+		if (p) {
+			*p++ = '\0';
+			if (*p == '[')
+				p++;
+		}
+
+#define strstarts(var, x) (strncmp(var, x, strlen (x)) == 0)
+		/* Weed out __ftrace_invalid_address___* entries. */
+		if (strstarts(buf, "__ftrace_invalid_address__") ||
+		    strstarts(buf, "__probestub_") ||
+		    strstarts(buf, "__traceiter_"))
+			continue;
+#undef strstarts
+
+		/*
+		 * If we did not see a module name, perform a symbol lookup to
+		 * try to determine the module name.
+		 */
+		if (!p) {
+			/*
+			 * For synthetic symbol names (those containing '.'),
+			 * we need to use the base name (before the '.') for
+			 * module name lookup, because the synthetic forms are
+			 * not recorded in kallsyms information.
+			 *
+			 * We replace the first '.' with a 0 to terminate the
+			 * string, and after the lookup, we put it back.
+			 */
+			q = strchr(buf, '.');
+			if (q != NULL)
+				*q = '\0';
+
+			if (dtrace_lookup_by_name(dtp, DTRACE_OBJ_KMODS, buf,
+						  NULL, &sip) == 0)
+				mod = sip.object;
+
+			if (q != NULL)
+				*q = '.';
+		} else
+			mod = p;
+
+		/*
+		 * Due to the lack of module names in
+		 * TRACEFS/available_filter_functions, there are some duplicate
+		 * function names.  The kernel does not let us trace functions
+		 * that have duplicates, so we need to remove the existing one.
+		 */
+		pd.id = DTRACE_IDNONE;
+		pd.prv = prvname;
+		pd.mod = mod;
+		pd.fun = buf;
+		pd.prb = "entry";
+		prp = dt_probe_lookup(dtp, &pd);
+		if (prp != NULL) {
+			dt_probe_destroy(prp);
+			continue;
+		}
+
+		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "entry"))
+			n++;
+		if (dt_tp_probe_insert(dtp, prv, prvname, mod, buf, "return"))
+			n++;
+	}
+
+	free(buf);
+	fclose(f);
+
+	return n;
+}
+
+/*
+ * Generate a BPF trampoline for a FBT probe.
+ *
+ * The trampoline function is called when a FBT probe triggers, and it must
+ * satisfy the following prototype:
+ *
+ *	int dt_fbt(dt_pt_regs *regs)
+ *
+ * The trampoline will populate a dt_dctx_t struct and then call the function
+ * that implements the compiled D clause.  It returns 0 to the caller.
+ */
+static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
+{
+	dt_cg_tramp_prologue(pcb);
+
+	/*
+	 * After the dt_cg_tramp_prologue() call, we have:
+	 *				//     (%r7 = dctx->mst)
+	 *				//     (%r8 = dctx->ctx)
+	 */
+	dt_cg_tramp_copy_regs(pcb);
+	if (strcmp(pcb->pcb_probe->desc->prb, "return") == 0) {
+		dt_irlist_t	*dlp = &pcb->pcb_ir;
+
+		dt_cg_tramp_copy_rval_from_regs(pcb);
+
+		/*
+		 * fbt:::return arg0 should be the function offset for
+		 * return instruction.  Since we use kretprobes, however,
+		 * which do not fire until the function has returned to
+		 * its caller, information about the returning instruction
+		 * in the callee has been lost.
+		 *
+		 * Set arg0=-1 to indicate that we do not know the value.
+		 */
+		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_0, -1);
+		emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
+	} else
+		dt_cg_tramp_copy_args_from_regs(pcb, 1);
+	dt_cg_tramp_epilogue(pcb);
+
+	return 0;
+}
+
+static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
+{
+	if (!dt_tp_probe_has_info(prp)) {
+		char	*fn, *prb, *p;
+		FILE	*f;
+		size_t	len;
+		int	fd, rc = -1;
+
+		/*
+		 * The tracepoint event we will be creating needs to have a
+		 * valid name.  We use a copy of the probe name, with . -> _
+		 * conversion.
+		 */
+		prb = strdup(prp->desc->fun);
+		for (p = prb; *p; p++) {
+			if (*p == '.')
+				*p = '_';
+		}
+
+		/*
+		 * Register the kprobe with the tracing subsystem.  This will
+		 * create a tracepoint event.
+		 */
+		fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+		if (fd == -1)
+			return -ENOENT;
+
+		rc = dprintf(fd, "%c:" FBT_GROUP_FMT "/%s %s\n",
+			     prp->desc->prb[0] == 'e' ? 'p' : 'r',
+			     FBT_GROUP_DATA, prb, prp->desc->fun);
+		close(fd);
+		if (rc == -1)
+			return -ENOENT;
+
+		/* create format file name */
+		len = snprintf(NULL, 0, "%s" FBT_GROUP_FMT "/%s/format",
+			       EVENTSFS, FBT_GROUP_DATA, prb) + 1;
+		fn = dt_alloc(dtp, len);
+		if (fn == NULL)
+			return -ENOENT;
+
+		snprintf(fn, len, "%s" FBT_GROUP_FMT "/%s/format", EVENTSFS,
+			 FBT_GROUP_DATA, prb);
+
+		/* open format file */
+		f = fopen(fn, "r");
+		dt_free(dtp, fn);
+		if (f == NULL)
+			return -ENOENT;
+
+		/* read event id from format file */
+		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
+		fclose(f);
+
+		if (rc < 0)
+			return -ENOENT;
+	}
+
+	/* attach BPF program to the probe */
+	return dt_tp_probe_attach(dtp, prp, bpf_fd);
+}
+
+static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp, int *argcp,
+		      dt_argdesc_t **argvp)
+{
+	*argcp = 0;			/* no arguments by default */
+	*argvp = NULL;
+
+	return 0;
+}
+
+/*
+ * Try to clean up system resources that may have been allocated for this
+ * probe.
+ *
+ * If there is an event FD, we close it.
+ *
+ * We also try to remove any kprobe that may have been created for the probe.
+ * This is harmless for probes that didn't get created.  If the removal fails
+ * for some reason we are out of luck - fortunately it is not harmful to the
+ * system as a whole.
+ */
+static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
+{
+	int	fd;
+
+	if (!dt_tp_probe_has_info(prp))
+		return;
+
+	dt_tp_probe_detach(dtp, prp);
+
+	fd = open(KPROBE_EVENTS, O_WRONLY | O_APPEND);
+	if (fd == -1)
+		return;
+
+	dprintf(fd, "-:" FBT_GROUP_FMT "/%s\n", FBT_GROUP_DATA,
+		prp->desc->fun);
+	close(fd);
+}
+
+dt_provimpl_t	dt_rawfbt = {
+	.name		= "rawfbt",
+	.prog_type	= BPF_PROG_TYPE_KPROBE,
+	.populate	= &populate,
+	.load_prog	= &dt_bpf_prog_load,
+	.trampoline	= &trampoline,
+	.attach		= &attach,
+	.probe_info	= &probe_info,
+	.detach		= &detach,
+	.probe_destroy	= &dt_tp_probe_destroy,
+};
diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 1e2e844e..0c621197 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -36,6 +36,7 @@ const dt_provimpl_t *dt_providers[] = {
 	&dt_lockstat,
 	&dt_proc,
 	&dt_profile,
+	&dt_rawfbt,
 	&dt_rawtp,
 	&dt_sched,
 	&dt_sdt,
diff --git a/libdtrace/dt_provider.h b/libdtrace/dt_provider.h
index f62137de..59a8d62e 100644
--- a/libdtrace/dt_provider.h
+++ b/libdtrace/dt_provider.h
@@ -82,6 +82,7 @@ extern dt_provimpl_t dt_ip;
 extern dt_provimpl_t dt_lockstat;
 extern dt_provimpl_t dt_proc;
 extern dt_provimpl_t dt_profile;
+extern dt_provimpl_t dt_rawfbt;
 extern dt_provimpl_t dt_rawtp;
 extern dt_provimpl_t dt_sched;
 extern dt_provimpl_t dt_sdt;
-- 
2.45.2

