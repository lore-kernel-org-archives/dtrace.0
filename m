Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3831A1AF0D0
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740673663; cv=fail; b=nb8jKtg94cSrlOAlTngvpAfpZD9hTge93UMQg0R9dayqf1lNBRfsH+aZRlk+HUYHeTlHh7Q2DWivYygurWNeXoqhLThxeaU4KQWysGKXkV7+NAVVs6RI3kxuuvoEunDa16lFfefzw/q9mxi5CGRhBdj3/E3XKvjyN+KcC9ATesE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740673663; c=relaxed/simple;
	bh=/6kVxeYcihf/4Wl4wEvU1ZfOMMgTcuVo4uP8LMJnSuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gr12L0jlb2mowYao0Di2Ie/QcvivwnXQX1J1D/n+zi3SBiX9pdpYedx/6AoYBXHGw9r6Y098MZwhwWJs/bR2cUj8dv0BApGFsvtNfY/Tp7sKzHFmI30JvZJp6VziUdZxhlKd2+TXfB7j82ZCQ2Ee494WcqLcrKFakWiPtpuwO2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Flp3P2tQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kSkFT32f; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Flp3P2tQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kSkFT32f"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RGMhtF017035
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=b4/JBH95DcV913RUz9
	ycL9wH/KgAvkYVCuUVVtVXAKA=; b=Flp3P2tQwsgc/EUfh12P7ZA5EzsskSOYsa
	TNB+mVxEQVc0pglGWwJa9cFQHkV8kYSzxZxf2VIE1QaqF1Ndlu7xC7JhS+IWtvtt
	wZVTbAU4xF9YcrIETuPj7I0fzwvIr0lDPdMgPWCiPorbeVh1mJp6b51p6vr3GgJc
	i2aguzIp2IkwbVMV6vbJ+RqvST0l+CicT8arJcMROTMoGRehDvM4/m3Y6f30QpFW
	VQEAMpRokkxANVy9qnjFxZHlSsQmOU2evXvDbzI/8Lcb0BnSLEStc3xjmixuh7zx
	s7289mKEIBitbuVGuTEc2FMogbkAjv27L+xQ+/HbcBPSRURCQ5Jw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 451pse3rty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:27:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51RFHTW7008182
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:27:39 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51jdb7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Feb 2025 16:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUgGd0GZ8ZVXqjG/cPdGQ3j1cIl84PpZiTUbKNBoLEYFISs9LD+n0LfJV+J2LbzH81xe/cQGJN2g0J8k3atiuUoRQ0LGxlFtRCQXYvM+DYHj4fT2ijE1Uv33st0rOh4mcC9jOYB/q4kGWuxYBxxMXRI6egOlDSSugWpYmKcikJdVKFdGJLgRgWq2kYP+EKvoDFeQ65KGvV5NW58M8gTz9hSr5l9VqTAXrEj2oAVBtqW7X2cYUqR4TMzN5IIVX9svMIGx50rO1O1vtfs+2HdX4aa0fsbdJuN6ltDAjSn+DqugO6Fhsh2rRcAuJT5CcDTUKvgL2Jpc3EFBbM9TJMP+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4/JBH95DcV913RUz9ycL9wH/KgAvkYVCuUVVtVXAKA=;
 b=BXIXnKbwMSnaV+nFsD3iiHnPuclr9MyE76lAoKOtNkFawukFfxEwONRZJ972RZxhqAcb8ob5mokcA50fMwHVrn5I0ZCPdrfkJSP5ylIr+5udCCzwyi3urcP8Pr4ymX8EHsTWx8MHKcJZcmSdR+4pm2OBLkDOEh35/8ElcvR4RFPDjBGW4So8QERDJzywZDQuhn2BTn0BizwHDLR/tDWbLBE0mzBml2yY75BkO/iFdKbdFAi+HUT+V64Ggp+xaIIa2S6ZrjbjqdhEY6PkhdhlE98J7PpUZI2yNyjbVqlm0ntOaJoTE78SgBtgOhCgRthJk91EgxYpBHmULG7lkhCu+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4/JBH95DcV913RUz9ycL9wH/KgAvkYVCuUVVtVXAKA=;
 b=kSkFT32f84wh+2GlMERNyjBEntf5L6LY5xC5tdVqw3q96Tsk6Gen2f1cOarfyh6gYJ8a2vzmPh20pmC8jj1YeZCyDAdu+jiAFR/Vzx2RvvRQE5NKtVrbaFUzzS6OWOSJ5SWEGZAAqAmU/jEJv1xSIBoZBoBRpxHPaCfbFaZb2vU=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DS7PR10MB4830.namprd10.prod.outlook.com (2603:10b6:5:3ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Thu, 27 Feb
 2025 16:27:33 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%6]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 16:27:33 +0000
Date: Thu, 27 Feb 2025 11:27:30 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 1/4] Rename _DTRACE_VERSION
Message-ID: <Z8CScii3+at2Chzu@oracle.com>
References: <20250208190622.23484-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208190622.23484-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DS7PR10MB4830:EE_
X-MS-Office365-Filtering-Correlation-Id: bfbc4ba1-16cc-48e3-83a7-08dd574ba37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C1+BEP4ri1IsgNA572kFIy8i2/u0nJnWBItqt4sRlY/Z8/54ZF3gWda0IiRP?=
 =?us-ascii?Q?IqnZQiwST9ihB4y6tqZCbpv01bnKaKByfTZbSiMxJZvxZ+0mjG8uqK+qNgZY?=
 =?us-ascii?Q?qGPKBtaBVVhOPgpWCUn4nG00t39RSkYg9Cd7JaqNIxsqA+7FnBuTfPRs+20l?=
 =?us-ascii?Q?45BEGc0v+41N67+4xs4GkgucbjMwU3fPRdjk+QOsSBaWfQ3psaKGoZspqHC1?=
 =?us-ascii?Q?xEw8Is0COI3XNxDN/P7ca+kZpU+l7x/iTX/v0Bmvb/7txq972emjVstvdIog?=
 =?us-ascii?Q?isknvbQh0ec5NIVCPTHbeGxyopKmdw2Ud6g1G+q0FPYrYdILG+HZE7bCRQoE?=
 =?us-ascii?Q?R+en4UmXopiF704RqBTo5BTBJKI868u15otEo6AkLQPshNNMrJWrHq89jt+0?=
 =?us-ascii?Q?1jyZrULTqKMheO9mPUPfATMU+YBF2apXgajKBwaARTE4048Wfmb2H/vptd5C?=
 =?us-ascii?Q?NdvBNmvdOKOxMpeHmxhrAyCVb+AcIkWAcO5jDzvjfK1Oqby9Umt2WfGSON1y?=
 =?us-ascii?Q?MCpBR9dgsQvRIbw6Gl7UjECpG295ZE2QyHRJuRk31jAJiLmiBXxskfYSGpTN?=
 =?us-ascii?Q?BvIKWQKLO9Ld6l1TlpUx6P7FtdYxXLQxqICmrBbPqKctz2KpDdlN96MwQlT1?=
 =?us-ascii?Q?abZjfsiP3WwlBr8mwAy72FATNskg49hGpUqEtd1MSzORJW46ZxbbkQvY7IwX?=
 =?us-ascii?Q?2mHnqas/c5RFGXzbn5iPq2ao0pkC8YZP3nDVVu0AgojCG3DNFwuUJ80Rapmp?=
 =?us-ascii?Q?crguJPWmLZDBAw0Cl2/lGU1PjWsz0IKSjRUyg3Dqmg7WhGgxR+Vo3qnS8ggU?=
 =?us-ascii?Q?x+S2H4/2kfGKRs3V4dWJTzHnepeAnS+MEsfso3vU8GMPoUPfJdKNahF4kzGL?=
 =?us-ascii?Q?gHlHWlztIM5yAmivvwDlwCJ2OcuyZFqbmhcPx+0OrGnZCWYbltJa8C9yA+aq?=
 =?us-ascii?Q?xPm7cma/G+SQVLnJ6zt6BQ8gz2wICWYoqjqyxlUImUbv5eZU5dIiRkahQw8L?=
 =?us-ascii?Q?5w9OcysnN2d73wqYXMUIrrdBAWNDx5AsKCuGVKAz05Q+TRjYz6+EkGStYAOO?=
 =?us-ascii?Q?tP7iU0UoG7cDGBgYNPJpvlgfKGOCF2Kng5R37HcKS0J+OnlaKyPPVRSPpUP+?=
 =?us-ascii?Q?LKFDa09/PmbmIERjrGazDofwRd/GTUZUmKaagdtZq6QMxL3Gt0x0UWrrZiB8?=
 =?us-ascii?Q?5rgop33crecKyM6kX9GTAbrwOFVgVCwJ98pbmcwe893gpKP2ADkhzLoP4OJQ?=
 =?us-ascii?Q?ppQAQLLBgxoBrs7reaewZktdEwNX7tGXqqxOmCe1UVGo3heAAk35RuL+6ht0?=
 =?us-ascii?Q?zcha6keSOCeiKWrU2Z+C6iCb51AJ0njYFeP0j0X9s6UxiafAM3z4zinh3LC/?=
 =?us-ascii?Q?c3A+gGSBHjEHH/RVQWWgmSNZJSFG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mMnEXgxp5poRpYoCVst577kIsQHA7gfYS8IfbT1+PvGfQQNycdmDaMN4Y/kO?=
 =?us-ascii?Q?XDX4GebfogiCnZ67rsBZdLojjEPMWEKFGoO4M+Y4hG7NnifEAb0OlSJ/YXRU?=
 =?us-ascii?Q?/ebta+poK1l3uC0Q+H+ynCcJ0cldFkCTdonrvOU2flJvbWbxo1i1H3IJDcye?=
 =?us-ascii?Q?aJAij0VdshDH0+Y5lucaklWKFMML/ual90stwtCOR0piJsfRVVr1MEQ1u3lt?=
 =?us-ascii?Q?AfXuRzKVlcZCNAcFYz+3sQE1r7DZINTewQHvTltesrZHsO/9ymTC0ZilvOh1?=
 =?us-ascii?Q?+a1gJda7vPPWLvisefyAqo0KViQxZwITEpsi9Br9Cih/CIkB1Lr7+6FbNneB?=
 =?us-ascii?Q?8xvpdjRbdeIziqUQ5K4aJcQX0NMcdMoZ2xBwxMqHLDJx6zWWA6iTOjajf0Ai?=
 =?us-ascii?Q?SKPuWHAWDAJZBJp4ockM7JXWWa50yWxZcpT8SwOfW02rMXaFqX1CBLIHcgZ3?=
 =?us-ascii?Q?Ea7CGOlFvQi6Eftz1hh4HcIfadH3Zu8xIO9YFBCoq5RoVKaAxWdfxOFVaPim?=
 =?us-ascii?Q?8GcIhrM1TpdMn4nv806uXZzTL7rgdpPAA69L4FN76DQuwb42A/9JnHj2cpZ8?=
 =?us-ascii?Q?WpGXij6neOQtOUtUcM1RcGaxwJbYkrbemSq2BtXai1oxM9EHW6/PywkPOrgf?=
 =?us-ascii?Q?LZRLz1ghuSUKr40pi8YK2w9QJEn6dSXBxIVgHjXsGkGTB6s1aKWzbgFHevaw?=
 =?us-ascii?Q?yubHFOanYg4Vkg48fY/2ptn4LqC3GHqmdcyaPe+BqCYnypD1FbrSzKLeQtL5?=
 =?us-ascii?Q?ecMyjPjhiC3DDYa0iKIR762GGsV4Rq6FS/dt1SHcMhmdjjmtRL5/JzgROzOQ?=
 =?us-ascii?Q?G25+Ar6869DlEQQ4PWwAWFQtNE9gLU6viIxOC/kRfYfC2s8HxfQIXoZY9MVn?=
 =?us-ascii?Q?J1qF3HEv+Rk/3ocxE+OyW8sk0uqxMbydcW12sE5dykNrYzwZljf1dDELuLQ7?=
 =?us-ascii?Q?2GW7KJ6Vf1S8aqpyXa7qpgrIdg+Je+Y8anRBkIp3UHUk26ul/QP6kom0LWHj?=
 =?us-ascii?Q?suyoE10J7COCbpjl+r1QKqLTwewxZBNZcawfaVvEEN4z2GwVupgeJBdzwY9x?=
 =?us-ascii?Q?9yoTnW3tPOlzH/DK+lvxA+GGv9+/DKC//3yfReAmXc+4ZSAglKHqMS/QFBSQ?=
 =?us-ascii?Q?qMS9s+/Hk4ATSWmLoV1U7oVBn660LtOUsYNNzFiylbTJbWDo5FWCBeW6f8O6?=
 =?us-ascii?Q?1ssu9SnjxilEmy1FXavKEYedycjw2sPClAo/ecd0SpiphBykVjxAjvUj9PLa?=
 =?us-ascii?Q?ZqE19MqH3ufrivCrOR4L3HtOAFctY2suNlImCnorrMRrWv+dvAvYr90Ot9B2?=
 =?us-ascii?Q?HkLtrysOlBFeSJfpjPkUcMFS4Ga+Dqxslo3+VurJZtXMKcztW/m4ao5HcWGg?=
 =?us-ascii?Q?oQV+AMo1BK1TOJzTehKBG0WXD83OUk9nBsTcrgsT9Rfcmin1I9nX6zix4IDe?=
 =?us-ascii?Q?i/Wq5Vk+2CfmybPSFfyKhLd/NLJxSQtXtEUl/hfjxKON6PODJ18zNwNZAMni?=
 =?us-ascii?Q?IpQ9/QwN8yNUGGV36jnn+fhjANZQS9z57kaRQmDf04jQh4FStN3aC36cWvg8?=
 =?us-ascii?Q?XYuM3xkBm1TIrG9I8zvmJ0E+3148Z1+dVXtZEM67a1U0IRYNA6thSpD0+pnB?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6clTbVhFWgAnZPxGyWQHZG2sDKWHLv/ssxSUa1FDbR8vM1gh+5zySR+hGQlz0vccCUVabaFStPorv7vfPmU5yf0LN/MVTF/PA2rwVsjDZCtEtvPPadR5h8nwRikkW12fgQhCCKatDkKVMOhrHZnUG2mqeV0YI3Q5tLJEznAK61VcNm3h5fPARQv3lSMLAoW8x+87jAXkPaxmX1/z7VMrilNCqGcg5FFSEaDQBM24yN/buQXjolFVc2Pyp/edptzVsB0Towv7rJCVd8ULXfyGy5y26KAmB3tILFE2vDK5zjyNndK5hRrJt/S8iY44KP1XB89aIGUj9/bCcvGEoNV0yRLoWrZA3hlYWhpemDH2caFgm8cfziBshEfj3q5PLhHC68vEiLie5bZzZHD5di4M2G5wkDPWC8/+T/u5KRqojXD6YkSHu2NX8/rRRLrKg3VU/Vod34tkORP5OXUUvaaSQc+J4yGwBD31Bz4gNAH+TCJh13BY2RPwKGNzBgUIKPyKWXF5NT86AvUrnVOXYzZ8JHrhSdpbvWoLnO+H6zq47PS2+ezR54AFZ26Hk1m3LZbhSnmZdDRdtCe7FHf9EqP0AqhN8EpErbDfW0r7l7y10t8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfbc4ba1-16cc-48e3-83a7-08dd574ba37a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 16:27:33.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xjMuPSS/yhp2qdFh1/qdBBPXkTJB6MpHuWmF/HITVUu7lSbw8IWITzgaM6E4h3eeszcYzJUolf88W5DVCSYmfQxCfEJPCT/B1yXYa+NHWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4830
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_06,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502270124
X-Proofpoint-GUID: nS1JdVGUsq2vTibKn65kfKZHauFq7G7w
X-Proofpoint-ORIG-GUID: nS1JdVGUsq2vTibKn65kfKZHauFq7G7w

On Sat, Feb 08, 2025 at 02:06:19PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> There are many DTrace version numbers (for version, API version,
> package version, etc.).  Meanwhile, _DTRACE_VERSION is not a
> version number at all.  It's a preprocessor macro in USDT .h header
> files.  Prior to commit e2fb0ecd9
> ("Ensure multiple passes through dtrace -G work."), it was perhaps
> not even set.  With that commit, it was always set to 1, with
> the rationale:
> 
>     Also add an explicit define for _DTRACE__VERSION in the generated
>     header file from 'dtrace -h' invocations.  This seems silly, but
>     it is there to give people a skeleton to work with if they want to
>     pre-generate header files and select whether to actually compile
>     on the probes at a later time.
> 
> Rename to _DTRACE_HEADER for better clarity.  Define it only once
> per file.

Based on the rationale, I would think that something like _DTRACE_USE_USDT
or somethng similar would be better?  Since the purpose seems to be to allow
(after the header file is generated) for someone to change that 1 to 0 to
disable the USDT probes to be compiled in.

In fact, if we want to support this in a more developer-friendly way, we
might as well change the generted line to be more like:

#ifndef _DTRACE_USE_USDT
# define _DTARCE_USE_USDT 1
#endif

so that a package could e.g. allow a configure option or something to set it
to 1 or 0, dypassing the need to manually change the file.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_program.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> index 23b91fb2e..c6fdafb47 100644
> --- a/libdtrace/dt_program.c
> +++ b/libdtrace/dt_program.c
> @@ -505,13 +505,12 @@ dt_header_provider(dtrace_hdl_t *dtp, dt_provider_t *pvp, FILE *out)
>  	info.dthi_pfname = alloca(strlen(pvp->desc.dtvd_name) + 1 + i);
>  	dt_header_fmt_func(info.dthi_pfname, pvp->desc.dtvd_name);
>  
> -	if (fprintf(out, "#define _DTRACE_VERSION 1\n\n"
> -			 "#if _DTRACE_VERSION\n\n") < 0)
> +	if (fprintf(out, "#if _DTRACE_HEADER\n\n") < 0)
>  		return dt_set_errno(dtp, errno);
>  
>  	if (dt_idhash_iter(pvp->pv_probes, dt_header_probe, &info) != 0)
>  		return -1; /* dt_errno is set for us */
> -	if (fprintf(out, "\n\n") < 0)
> +	if (fprintf(out, "\n") < 0)
>  		return dt_set_errno(dtp, errno);
>  	if (dt_idhash_iter(pvp->pv_probes, dt_header_decl, &info) != 0)
>  		return -1; /* dt_errno is set for us */
> @@ -560,6 +559,9 @@ dtrace_program_header(dtrace_hdl_t *dtp, FILE *out, const char *fname)
>  		"#endif\n\n") < 0)
>  		return -1;
>  
> +	if (fprintf(out, "#define _DTRACE_HEADER 1\n\n") < 0)
> +		return -1;
> +
>  	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
>  		if (dt_header_provider(dtp, pvp, out) != 0) {
>  			dt_htab_next_destroy(it);
> -- 
> 2.43.5
> 
