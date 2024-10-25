Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE254727
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 02:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729824655; cv=fail; b=q7QyM2QlIFB60evWVJ1pPB2mzuc6XmDbJKXnsY42wfKuYUVZLlUhuoK+cA4XInpEZGeJuYFWS9Chao1iFP4A0ty/L3hLKUMUEQgW0Q2u++E1lu2Gblh5h0+Jx1+1v65E9qARVcIX/sLCJXP9iI3YBRn/m1EciCvQrUpzim2S+2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729824655; c=relaxed/simple;
	bh=OGWKqcLCfjMqdwRRngjRq/9MLBFuNiczFZwCXYK971c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BfL2UDFEBn3awvvAhb9I8W4dKrULPfTaVmgqFbgez7XzNyNYUie9QsP4Qhr+SvSiDlaZzcRw6VnL+RypeDd2QEYVraWb2Soy31/bXb4q00Sfbmn3bvKM1vU6lZeQd4SJ6sRahT/clGnqo3/JtIi68n8kGgz4vtVIdeZUnyCduEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kKsSJC90; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RXVHUcZH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kKsSJC90";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RXVHUcZH"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fhfK005427;
	Fri, 25 Oct 2024 02:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=9ZBHVxz38LNQdwolWN
	6aey7DVBSu/RYV20szU2+DKME=; b=kKsSJC90NyLAoCYwLRPHzOWzCrUxMMqvQ2
	eG3nJlpTnyGNfJ46zSrPjijpQoCT7Ng7jgRMwYJYVTrelAneqsXS2doNsY2B8AaS
	KdUO72JTOctJzfBq7o3WzEap6FCjhyGYCn1cZHri7ivk+RAMS4T/Er1p6vJmyqfD
	J108dCfGJXjuxsD8OWCwJR/g4Ye7Ws2a7odh42D9OKcSSi1SEndNDX0yqW8LZK/K
	CPe6tvIEdNy8yGcvV0JyHExmfzg2s5kUoEBw2Qwb04LLi0waIjHEZ4cNhmsyVYme
	NoklskDVC7ufMHmd1kh45i1oiIddp4DTLpVkBaaAZ7cRX+TWRg7A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c55v41h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:50:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49ONx3tb018363;
	Fri, 25 Oct 2024 02:50:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhmu4g0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 02:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/HAMukZUtSZw/v+nAFqHeQIBqgNU6H3tDHjDsasc82BDYBAEORkzBmVLrfKLy9POA6e155x9oTOG9DLGbei9Wc+OCpp5eS8ZIsuVj6I1LPVIWsdZVVdI/9bQKyQfEM4M4Jbk961d3EGa/XS3MOX1Yd6+Tl+yzseS2bk4dyos4uBGmAxDYjsjmP1XJ78p/rb6Q8yNHGjYXGhIfJV0XrZPZVyfMpiqlM7Sgz1xMrHMRQ8d2jE0iupyfg8/keRCCmcK58LGyNzMxto58MiCic2ObDnijHEvglZ1yRvAEdd04yWH2x9C2zmOEwzJhPUK/j1YNfBvbFQqE/RuAH/PR1BXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZBHVxz38LNQdwolWN6aey7DVBSu/RYV20szU2+DKME=;
 b=svOuiFte0NNs8jIu1DaWeNPqPrBp7/Ua8lzofXk2ONEQMNMxzKqLIs8EyXQwGXBZS/NdI1fYpCeD6EjwIVDFYxESZNGEuXUb3gjnTKZhmuNu3eY6RwQeNwIIWBzhxQw377LH89AnKtWyF34VT4wjjMd2P2myWZrp9nt6S6UlHklT2xoSb1TouHE2pPhHECQJtdAOqDieOZZNyfUfdUcVolnd17Wg+9tN+qnuxM1XOz0TqxA6pG8Fv2vAgswAmiBsuVmrNyDNddmPlOe7SuScVKAR9nkeQtly1iNHdxQXkPI7QhTAt9q8tBLWPWEj7MN05T2FOrSXM/uRyqtb0i+Sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZBHVxz38LNQdwolWN6aey7DVBSu/RYV20szU2+DKME=;
 b=RXVHUcZHo4mqikGBl2F0IFLDgZvKr17P9tAd3IewJYsabxX1REfuALSZVZQuJkI25puUXyY/5G5Tb+OSCRZQrES22Rfd/Z/bfc6n6llElgxch4YAwE8aAyKQO61uJcPgBcvNnMfnDx7MsU5N77TvX9I8Jg5zObrwHiu6gQMJg+k=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS0PR10MB7150.namprd10.prod.outlook.com (2603:10b6:8:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Fri, 25 Oct
 2024 02:50:47 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 02:50:47 +0000
Date: Thu, 24 Oct 2024 22:50:45 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com, sam@gentoo.org
Subject: Re: [PATCH 10/14] man: fix blank line in environment variables list
Message-ID: <ZxsHhe8BtpZKuogt@kvh-deb-bpf.us.oracle.com>
References: <20241024113758.182050-1-nick.alcock@oracle.com>
 <20241024113758.182050-11-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113758.182050-11-nick.alcock@oracle.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS0PR10MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 0481eaa5-19ea-46b1-9d26-08dcf49fd40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?scBD9If9/AL78D4FRecR0ockd2XB7EFRbYP1Qs3eXhB4wYWMekQvvhoDCGJ2?=
 =?us-ascii?Q?hX9tj522StZP9P66JCvxaXNvosQWiWv4cSGlc86s716ojQwVdgVVBYdOS8zC?=
 =?us-ascii?Q?Gdwhaol3DrnP4EYADScYK2g5qUzMckMuDlqRFvNisBPXFKtwDuh3iUey3yjw?=
 =?us-ascii?Q?uoPICvTAAzoSg8YsAyWRwDrKF0flziHJU44npub/hfUqk/UFz/Je7yv9hmV7?=
 =?us-ascii?Q?JIUL42JSBpHYn6ouQaZMZ//CmpQTkYqccEIZvvaUSQ/UyW8ObFIPR35kB43G?=
 =?us-ascii?Q?Pz3kZVwjKSS38jGb55+NwaScT2eWyR2o3twZg84Y5YKrV5vKY7EPt32Crz+/?=
 =?us-ascii?Q?tFd6qIovFp537JEVqSLfqGS4bvVZ7FpVw2yKJYW4qmSOwNg8voS4kTs/68AG?=
 =?us-ascii?Q?RXCMBaw4cudR5uyCubHG1VvFwXCr7aulLWeyj1cY+l0Rr+u//G9LTDkzSyZd?=
 =?us-ascii?Q?Xh7OAkFAiyWGCkoNhr5ou+BhRQBbxIqUxAxkTvio+TBEryPqKPrLo7tDNyEz?=
 =?us-ascii?Q?7bhcwz5l/wNWWPueZdceDKA0JRgiVLpejTx6nDolyDJDGL+tQTnSuxqjVCEd?=
 =?us-ascii?Q?FVS9gva6bHWSfpVFkRkoxwlcSOoPGl86VxLrKNe5RXrQUrgRalJwd6mk1De7?=
 =?us-ascii?Q?u5ZXNdf074o7QSiCjKa1KpwUKBQx5REwSgn3WBEw+yN2qSRNJ1fO9SX484Pt?=
 =?us-ascii?Q?DxIearpm7206mtaK1qYKmPNaOdNIW+x96l3AnSM4V7tqQMIh8d32Dk3Grt5D?=
 =?us-ascii?Q?YEZQ/CnHyNSF6DYgheyCNmN4unq8U/u3TWDIqWtTo4zkqGXkj19hZQPYP1N0?=
 =?us-ascii?Q?ua0mR7L3a+Sq4q8FzbSEEgKPxV+EL0q9bie2zeYiplOfZWr7hg1kiwoWLROr?=
 =?us-ascii?Q?MYhb15khWQz0M/MJnIEMNI5vbFxTny7rWFy4ktuKgXdYto25tDRLA4EcfPYe?=
 =?us-ascii?Q?tHchlPxs2HfbP99Ulz5384ei6I/HX5IOCjwgyS7bTwjqE9V3JyEe+I7+3ijA?=
 =?us-ascii?Q?iAJUkmrToo9fvVE5TrRaeYSxGpYBnL2QVI+tZyvH78DZWLjtBQRqqa61aj3E?=
 =?us-ascii?Q?9N4Pm4gLsDcz09x3arE0R1cwEXTGBZIKexQ6KtKi99Pin5Ib4MFuIxhVfNYT?=
 =?us-ascii?Q?F6BUV1ckRHLSouopnTjMfVig8b0KFbyO0diFIeV1JrS+ZRlq8VnxaoSUI/Dr?=
 =?us-ascii?Q?EeWX+OajPsQJTE9apL7RuqNIUqXHDBdO1x8iosM/3KpDzNQYMZtp+vmZt070?=
 =?us-ascii?Q?3fSoyDJzLjLVsmg3TZO+tqkaQnroaQqcagEoQxkRYlPEasHXLQ5u/NDGceZh?=
 =?us-ascii?Q?WwXT2DujWL2ov4PH2vApf2s6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NycANB45S15pkxX+JOEj1DVqFqpW/iAOvc8LEQUSOexXFCWN0Y96fO+vVftl?=
 =?us-ascii?Q?L2i4a+BhE+6yhxpA0f4kg4n26va1K6Io8pGv4kaoXvFKGGdXTNzrsyD7BV+3?=
 =?us-ascii?Q?wW61/D+xEUfdDtXESPWeCMiFCWPd+XcVqPOm4u7HULuSBM39v85KEqm6tthb?=
 =?us-ascii?Q?LDr+ja0cRbnA+wHyhf88pnzaRCv2mra+4uCIePNq72x7dpgV1mQWVrLqKLtp?=
 =?us-ascii?Q?GBjw9b3khsqldfuHjlCOogrjErNM7wCgBxIEAAr6B4BQtG/9iQHGV7R1tel7?=
 =?us-ascii?Q?9vrKK0VhyL2eTVR+Z5+rA8TrhO1ZFI+VyTQp2dJ8qCzVEAsC+7mimH7fucEL?=
 =?us-ascii?Q?8uhIhNG4N1QtKTfImoJMrcg+wJ4/JMMrIGc4gpCQFTFXBp0RXFLrFBwFyHsQ?=
 =?us-ascii?Q?przltIiL9PMiMisOsT9AM6pQccADwXN4kU/EtK/YvvaugE0VKRZ6URnc7T8l?=
 =?us-ascii?Q?5dp/cvVGVjwz59lQ6S/lqRZ/iMKnE+XWlUGVsbtYM6awmNE9biIN+tEVudha?=
 =?us-ascii?Q?ZbiYQi1jabWdo4eqXw3bYRePgvr86bCpVCMPIVlebKSkGfavOR87DN8agefJ?=
 =?us-ascii?Q?YP/R3eN5DEiOxsYzQFixPoPWyvzy/OggIEzRDQ2qKHcYOKXb0O64SnTEqYNM?=
 =?us-ascii?Q?TgiVuUhJCfF7zA/zgYeD14w/eB2DlZrDnGp2mx9Jb6+YJEXU6b3sy+bKm9cX?=
 =?us-ascii?Q?bhAA+WtECvoaavUEdH2NdLRicruf8W9Xjf27F6ZSIhp6FW45gGEcx/9FldkP?=
 =?us-ascii?Q?3i15d2zUHq4BK1AGY3EeAQ4q59qzdLetyy79pkARDPUk91rr3UC/eyA9XmQw?=
 =?us-ascii?Q?My/i62ocbrqjzJA7gw/blL5f+V0/xxmL9fpgpknizORHCeU8rzsimb5FtBF6?=
 =?us-ascii?Q?b/Luz6pg791SYSjdM7v/0xTSoyS0oge2CvAQ4FqnaqG223cIiIvJoSqwBUh+?=
 =?us-ascii?Q?ArJ+kIEubC5Tkdkd+VYU/usNfEzd7tH/I4sujMPRttaNijypLfm29RB6dZHK?=
 =?us-ascii?Q?tJEPL8Z9+ZlEaXnpuxORxo/NZsHhx+JcBF4XAP6tqzFjHQz5e5uQ/I2uQPhv?=
 =?us-ascii?Q?sk/tfWT4+ghFJ4P2Oa6vrqvnVPNJUwHwsCYJhp5B4Ge80DWLtCWAwJ2Zb60k?=
 =?us-ascii?Q?Pei6EcM2Wewx+0i0i3v99l/kxKx+SDQQsHdpgOnmmTIxEwgTK9aL24rA5+uJ?=
 =?us-ascii?Q?xdkOTQoxK4vAq40KgImIrkcWTddo1sG55su74bZmwjP73J0QpEFcEZUUAB8l?=
 =?us-ascii?Q?5Pdb5ea94UyYQoNkV+z7OL0IzZ27kXa+80Zy5rUDfsOgX1EfKkTUsRESY7jv?=
 =?us-ascii?Q?wM2s64osLpQRdwto2qsmZQpNjB8DiA28LhZuF+KyG9WA9L7edj3WqvVXCwnY?=
 =?us-ascii?Q?UaD5yd8k1SFK/Uigyc9xm87BiRGq0AFRjwzE/4UYmvOgD++w0xZ6ijBCtD95?=
 =?us-ascii?Q?hAmPKDK5VlUKSI6Sc7psMtYL+QPlAXwmbpzPbClyjeXcX8er5rArUVzAN2FB?=
 =?us-ascii?Q?N65fRYjgpzdXOMPv7jRK9G0Y41ZUckIi9s9b0m6DoD+cimP5CLQ/yJ70M2B2?=
 =?us-ascii?Q?b5wGrBKnIxcnM+MmTpF7/K/tCz4DBSKKp8e5bf8g8nhM4FUKuUYc3YGGBqbK?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BOArA21GvOf35mTyLqhDZAoB9zs5T30O/o32IlylBtQwB4ZCcTchICTIq35Xs5WrGDAmO6NBNcuPmi1kO9veBHdKafr5t2tocNVkNUL11siD3i3XN2fxZFjPDMEWw0YqPF3cmDu3iTmfgzi0POup8NAayl7b/Ek956jhLZ+5OTMhoc+//i5tvRr2OD8QQ3qFB8nZuVhHc7sFhX18VS9In7ryjVS82KqZd/nQ3ddMpeMEXPRhRDoR4mO7DliOTY13qaS3T5+qT0SsN+sXkSb3jMvtufqLnM0tWyv8PCVQrz22LKctLuvUfjFneFLO5gat3aRDDEiJCGfFGiXjaB9dULowYK5cup0KuRxrslAdB5KJ+uN7haml7MXrQLTMF7fIGk7pR6598/WLY6/yHpNtWiMfoSJXQ3UK+uDKmoh7KOTjrYIOJHxg8I3w9q82C3sVHaTI271NRAY04713X9fuOIW7xbBnKrJed3eECvN7PLus722L/GSNyylGvWGhFxvsY3DZcdRINs5Xt9fhovwtEqmcT00OuSY2x/ML+/bWjl1lsfE+smS+KCt0Q989jc8psDKjzwQR2pg9Do+d5JihUOjlI4m7CgKecip0LdHkfGY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0481eaa5-19ea-46b1-9d26-08dcf49fd40c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 02:50:47.5211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rh9HhJ/WCc8oNUcK6VRXZKws3xe/25+fUlTw+B4tys6xrb37yeFOBlcVCEZ5LPif0oUt1P8wylqpMl4ELaFbDXxf/Vg876Jz7BdajNSje9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_02,2024-10-24_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250019
X-Proofpoint-GUID: XNZYJ1Ax2xi8dRwipklUo7ea3VRHnqzH
X-Proofpoint-ORIG-GUID: XNZYJ1Ax2xi8dRwipklUo7ea3VRHnqzH

On Thu, Oct 24, 2024 at 12:37:54PM +0100, Nick Alcock wrote:
> Use .IP instead, to get an indented linebreak.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index 0639db2136a7..fb9392d29cb2 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -179,7 +179,7 @@ Print libdtrace debugging output on standard error.
>  Print CTF type library debugging output on standard error.
>  .IP DTRACE_OPT_*
>  Set a given DTrace option.
> -.
> +.IP
>  Options set this way are overridden both by options specified via \fB\-x\fR on the command line, and by \fBsetopt\fR statements.
>  .
>  .SH SEE ALSO
> -- 
> 2.46.0.278.g36e3a12567
> 
