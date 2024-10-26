Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57795661
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729907499; cv=fail; b=lGDLRVf8PmVVuujdST9hsFTeIX69IIJ3x5zqfUhujFwn8NGvac35mj4bSNLlWQLbGdpcawsEF2KlF/AYGiAwrzFKQtdTxfyt3CpMV21fuIltZ7UVVR3AQmlYW3zxpqniVg+IVwl79mVbgWbzcDHAhYh29zAB/P+cMHUewWhHfDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729907499; c=relaxed/simple;
	bh=wZvMZ9BeaK4NiyWEMZTZm0gn3KmxkJtAFy2+GupmhOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mU7+iIVb3Q6gHMj6H2mWrmZATfwqFfR/iIDlGb0U+jnbCtH2E3eaZpJvT7hVZYD6KDuRcrs/e3+S058wlkOxvLe9H48Ifnt8tMLlmKIBQ0w++HS42ppN6HiKaydJzPud4B1zdE3FaFwbqE5Cj37jcH/nEgnnIec0WXg0HdMlu2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dyNhdhM/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SRHuzLWe; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dyNhdhM/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SRHuzLWe"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdVZw021916
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=11AaHzy6y1qVoFnVHl
	bYgDN7P1ruFRXeH9u1fIHjXaQ=; b=dyNhdhM/tJVl/sp47FJB2NBIpEeslj7wjt
	ot3dEuPSKpwgOEBUN/Hae8sCID4wLiIc03ced3uFBRMi8f1YNGAhE30fyRJ5pdIU
	Wtg8+MtiKVU6hXXvDGM3kluxd+csTZ4SUT+LRqfTX20RzxNnfHFdTOM5bT2wwjG9
	krImdUqAKHWz64/1UXO4TnOMe4tQeHJzUDZ0MPFxvyLDus6vB0NlTw0b06ao4uCJ
	E9zoz5J1bTbVNgHsSbOvWXQfRSwP7VXnksuV8A9/7hi9DonPtJrc4KlZESISyWRr
	idcfp3Qp9QjZebOe9cnZzlUQMtNqK+wRs8iI3ld57xdihcHZCkdw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c57qp4wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:51:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49Q1Xct1005779
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:51:33 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42gpva87st-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Oct 2024 01:51:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0YfKMFuXtv8BzESvqAwSXquZoePHI2LQ7XFrH0EaUPMSBIPfBXSGcfhbWv38+BgFnbvUsJc+v7S1Zwz0wmfYLzK6qPEkCCl8uWKV23WvZYzKk000KS9alZnRkcfIq1Pz2+keWozK9Ac6doF7DF4n9qmjLHmnKoyeODSmvwMKB05ity8T5CKRlUKsupdH7jWwAnTk+ND6MXRnW5QkJkJEj8p1LIR/1ixQLtuTyo6FVTN3bjFwFe0GMuQfdmPf814PaaAHWhYkCe7jXupBbMyCUtGZa8ka8vEnTrDjUU/+vNA98W+DfZZKS2aJb+tMSEb0fGOW//zlqqB73ZJKZS+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11AaHzy6y1qVoFnVHlbYgDN7P1ruFRXeH9u1fIHjXaQ=;
 b=TuZ/oNdsQ0j+qgw5QB948qaESdu6Bj8dAfLc6ymoxsFlZHskv39yzCdynJ5wC0wvtFmf1fqYhmG7jbSPaufNX3v/acSy6OgHfbZdLLS+WJCNlMfbGjrcjjSUwvAFjSfQ4S1w9WV4VA0+Mq9MnSYvGJKQ+EJYIk+j5Bt0LvlCTZ6rHJmwaLuYDCtp6OgZGsIN3ivTJ1SAZNlepAnaN8O7W3nqJme3dt/C+yo+S/DPDhfQGKdkNxgbRm/teuhgOMEY5EbNw1LeMynLwoyyAfVqyq8muZn/Vktlxeu8tkZDG/yfHpCU9+huGe9TQE/7u/Rk3twbmTIOEj8cOUhI1wvK7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11AaHzy6y1qVoFnVHlbYgDN7P1ruFRXeH9u1fIHjXaQ=;
 b=SRHuzLWeF+4GNOgs+WJV+C5uZZ11SO1toMLkh/1qMXBro2AwL+2QxGle37FP2/UiNNJO95uJY3/dVynLAmlTyuiVTfiR3uL1vDRZ1tGEIqSt3cDh1ZaBEI9xWV9PiJVnOZcSVZZPfJUh4zuV8M133f+Y/3MshcSVXX0gZyUf8rY=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by MN6PR10MB8000.namprd10.prod.outlook.com (2603:10b6:208:4f5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 01:51:31 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Sat, 26 Oct 2024
 01:51:31 +0000
Date: Fri, 25 Oct 2024 21:51:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH v2 10/19] Remove the is-enabled provider
Message-ID: <ZxxLH09V1TABizRv@oracle.com>
References: <20241026011619.28560-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026011619.28560-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::23) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|MN6PR10MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 99640d06-04cf-4ff3-cb6d-08dcf560b694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8sB+4LsGum5Tur2i1lFFqf4+xGLTqd/c66kgn04V/RATJdA9EMwvuXc5AQkH?=
 =?us-ascii?Q?Mdk7664GuhXk16NhXQIq1/8Y0b8FAQQaHh/W0FtTUaNFjOF2Ygywqg/iSY7Q?=
 =?us-ascii?Q?SmaV/FSp6qk7GFGchrjrbzX5g7FkWJt6dVIx8I7RCjCXlfcU/COFdv34vHPN?=
 =?us-ascii?Q?ESTJJMJSK+3YYYZR9kVkoarzIhsbd69zDG7tmhm74RzivagfJM7HvgJ6RXpV?=
 =?us-ascii?Q?LAKuxUu/3C42zoN10SpwYKxwXHLyXQzVgMJczkDTYtIZHlwJfTYdxkgVTkzC?=
 =?us-ascii?Q?hAWO8SL58GvyXtDTgOoc390Q2sC3ubz1mO0Hyz4DfKcWeO7WzNX4iqUVQgD/?=
 =?us-ascii?Q?zzZMiUYADOffTfSmculIWA2x1Od2BioAKZWbsgy4+kucC+6IOsSISVTtUB9f?=
 =?us-ascii?Q?gbAN4MGL9b5+5ULEtUagXMGxO7xfmAX/cgkai9wy9oc/acgEef8HqrpBuXA+?=
 =?us-ascii?Q?XLdvUZ579zS0jUhBikzQrDaHTv1lLtzdavAqwH+NCSYNutjEfvYOj8w9+xA2?=
 =?us-ascii?Q?4AVbkLKAqL5GjB6lOKTbZJGcbncImnKASqa9uNodvLyJbtbZ5EWu5RwbTr/j?=
 =?us-ascii?Q?kYrfDl/f4lF/khYXaARqTZuDIY/T3E3XZrQY+20ylJjPRVezlqWL9l7AXSZY?=
 =?us-ascii?Q?a6PPsDKrEAsPP186nx3UXVXSUKRfUpesuXt68N+A0SaoEuExmXe/GZT3arKI?=
 =?us-ascii?Q?zyFauPnuizWVMR0J0oyvgnpg1QWt3Ke/J2mvRoDZzJ7UfsRjD033PYf1xaBe?=
 =?us-ascii?Q?3j8jS5aLqYeQOsQprrVoTMvaqkK7JIMUirDz4zk7qvRAfBsOpy6fExnsCNHR?=
 =?us-ascii?Q?M1Alv+swkkVgrbTXGVoyYStHT30yfEeowy8eLPiI28V7Ausj7ZPzzQZG8ls8?=
 =?us-ascii?Q?YNaBJKe3DI4H8rN+eGQVNT+eL1W7L/sKdK6aFk9ZytaDTABhvvIB8vGCEllO?=
 =?us-ascii?Q?Aq1wOg/Lo6Eu9kvvrxkjKZOLKcj7u3UWUDBNYV7EIR1mZz2AbRi8s5Y0jK+I?=
 =?us-ascii?Q?cG8UY+wIGfAiJo9ILDg0EYwuUPtnhYdYxNKXvlHW6KLKrtJoXSvYPV77LbSO?=
 =?us-ascii?Q?DumgiH39mvTMnfoUlszKMKnYY7ZqY0Jq4L5OrUyhYEtwbpHDfccvBizcbyZ3?=
 =?us-ascii?Q?TYP0MIsDr3jfEZh5PhIwMMR8xZDEJIFkl6meYubMUHwlQSaj0PjSGUDbagJW?=
 =?us-ascii?Q?eGqlw8UzwZT/jFaXhdzXYFnfEmoSMGG53BI1WJe8L7A3ws2l/uL6Q+Nzj1F1?=
 =?us-ascii?Q?CmYH0sE5GZ8HetnqU+zJ/iaL2hDpJXnH7Lzr2uXJ5rnA7kKXconElvmmNEr/?=
 =?us-ascii?Q?zGh3KD3cXZJ8Wofog2U7Vuwu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WvRaNWM+n3vTRchTzFxhEcWrEq3xxjn5ls1laT7kAzPjD9960ibO/HhSi5TN?=
 =?us-ascii?Q?kNi/tvgDxKwLnOhfUc4tR+dPhJKzu2/KhVL+hfTC7CacDhg29jWPOjSeE8CX?=
 =?us-ascii?Q?gm8e/HxW72S9qyaD+5zf7+OZz69E/40uhE4ax274TW0NzfbOqBCt/E8H3TrE?=
 =?us-ascii?Q?mW78rPVoeAPfbutGyPMdz/wt10iFCGqXEoDmbFabJsypwepGYsPKq3eZrOSp?=
 =?us-ascii?Q?GSPhJCr/2rrfFlAh0HTPQHwg+4KyKro7LlEf+b6oRnijf7jr2bgv6ty/Inhl?=
 =?us-ascii?Q?yQoLpnueEPwevWk6Majda9+aVgtW4iS/kS+0JvApNZkad0HKCw56ZQq+wN/3?=
 =?us-ascii?Q?wzIZQekMTU+NUGJ4j/FbtQiRVxG+lI1VK5NswFUxVoMGhpR7FklOewErzDc+?=
 =?us-ascii?Q?K+dvIutyThrgczWXjKlZPIu2s8YjT7miR2DB9Kb6XcU94j49qgsxguW+O2kj?=
 =?us-ascii?Q?cbG68aUxX9Kdp8perGY41h94thDylt5jMAyyy1fxXJw9e+tGjCFNOidIwTVJ?=
 =?us-ascii?Q?7vgk8bAFNhMztWTxb6UTdR+BVQW+Oaw6z1AzyVYlSEy66zTJ/qLzM2+Ckf4V?=
 =?us-ascii?Q?quKxLCtxg5vAOzY0RSteNMLM0OjM7kbyojGMJds8/xCyN3LShJOKbZ6V2a3B?=
 =?us-ascii?Q?VPTfF/kG4P8DyomFLbsPkrTV99RCRRefdttZEoCQ4F3B2yNGqvI9L76DfHLS?=
 =?us-ascii?Q?txVPI+32oU2ZIaohcpvYWmSAo3FuL96IpI9zRUD9m+g0Cp7Is1w7ePx+UnSh?=
 =?us-ascii?Q?cTSmEdiHmu/U10fTSAycfF1gDGv533f4x0AE6HUZSi5aYaOPk7scw9hg7i/S?=
 =?us-ascii?Q?G7uoqN8D7pQqQW2HvQ5d/+9VkXkMpkOB288mVHyu5DSMKFoceZi8bWOIJJZ6?=
 =?us-ascii?Q?a8Niu2g5SJWxrA5FSv0417nbvQ2sL+376e/gNFP2+E6mNMxhesbGBYnyP6Ba?=
 =?us-ascii?Q?pPYVIQn9vpZLd0+ytVjWgeDfMYml0aaBw5ihr1hmxWNZn7t6LoauDJQzxxmE?=
 =?us-ascii?Q?5NPRgaA/lkt1q5ww6Or6h2VQmW2XYH0xKKp0sh17BE9UgI3h+FH+UxClAjbY?=
 =?us-ascii?Q?q/qJpOLXVrELfvg4ddLIoXXsdYWvEuzJmCnPtF6zoj2r6+pYDBtMdmunmHhk?=
 =?us-ascii?Q?2UqyId2gJC/rVgAY1VDJEM4dhB3noDPB2cssPoIKPU2dhc7VAkT1sNB2jKN3?=
 =?us-ascii?Q?wpabjIuwMqG74dptayrRSYArBOL7wOFqOO7RiHM2L98WEG2K1WDIa3+e/I9e?=
 =?us-ascii?Q?inLwXNQMjX+2b9eBZE4TA6oHsN7TZ3QriD1pZ9+WjW1mHV4eArJfx5CrRsVo?=
 =?us-ascii?Q?fsIMLi+zHeFkdrEiPrBaFLKsQct+/RY8SYY0oBEdlCYZOaok1c5Ffo8kUT5U?=
 =?us-ascii?Q?SbjcvOjDSXY+JA4srOWX9mlEpfMwuR7zlBFFltv79b/eo4+jXi52J+JlBdA5?=
 =?us-ascii?Q?rZQS2KeVxrYzPAykViNntVcgcFLKqpb06xQi1MxBnXQq2K3oh05PP4DC90/7?=
 =?us-ascii?Q?pB2ldamyR5X/FDLpK04+eVvgbQEThJMSLROSIW7NfadNcg5QxSDzv5KvdiT7?=
 =?us-ascii?Q?yHqNifSeZkzXs01Erf+ekkYhdqy14ZgV2pV+Nn8iiU77p7KoilmM21oHcTAy?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	gK5U+qCnsbV1Y43HTzQCcOk40zURkME/xNkF/pkmZ5s90pvLkCVGM74pXkcEGmLYg5m8MyCPK7A/awj3sg5fTRhHaZtsG5veu12RGqotMAUqFEXTdU1cXSHQSl5kqbLGSvFhpicyFBwCCibRzfuXh4GXAMyth0EC2F0HaRzZ42/lE3z3AStQvdLElQD1Jct0xebrJbyHHYGxsvvW/lZKo/5ZhaJhhlXYBrDzrbGiObw6ypcQBXrYnftBz42i/fn6vTUnEnLZw8LCFsu044frIkiyDxIJmlcacUv3g7G5U4EOs88gAs9fPUnm++1SXaIFS/gaCXTrhROlA6XP9PCxyMRnxCcitmQ5gfDB5DsQtIsWGPPbpEzKSgqvksLWrPtpG82bzsBxkkNlCCMV9YyE1LDAbV8NqCoH96/4B+lIiCD3KLYaaZoXeSPne3Klpb+LdpiJ38cD39azuOQOtfZ/i1HSz8TVWCI+Trij0iCCphAsEuK0qvC45M8G4GtKXmmfuWsdZkMojRYxGnlNVvEBTN/izv3kAOMIZu2bDMNK2zIj2K2mrJSA+Pc0SJTkLRVndD04K0CUb932SQnzcZObXllnKVuAOZmhZOy4wTs3M14=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99640d06-04cf-4ff3-cb6d-08dcf560b694
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 01:51:30.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xt56ErWQ07Jz7vmINMWrTtdNbQQLRUhCX/HFzl+60UTjkTZysTHTMfO1h4BR+ZXFwy5omegEqlUDDkSaRo2tew+ex+w/LR7OLvfbdU1m29Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8000
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410260014
X-Proofpoint-ORIG-GUID: UXug9Ym_lefBqY_Wvurn2RV3BgWIxBJ2
X-Proofpoint-GUID: UXug9Ym_lefBqY_Wvurn2RV3BgWIxBJ2

On Fri, Oct 25, 2024 at 09:16:19PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The trampoline for the is-enabled provider is unnecessarily complicated.
> We do not need dt_cg_tramp_copy_regs() since the copied values will not
> be used.  Nor do we need the (second) copy of regs[arg0] to mst->arg[0].
> We can inline copyout_val().
> 
> Actually, we can simply consolidate the USDT and is-enabled providers.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_uprobe.c            | 165 ++++-------------------
>  test/unittest/usdt/tst.enable_pid.r   |  45 +++++++
>  test/unittest/usdt/tst.enable_pid.r.p |   7 +
>  test/unittest/usdt/tst.enable_pid.sh  | 183 ++++++++++++++++++++++++++
>  4 files changed, 261 insertions(+), 139 deletions(-)
>  create mode 100644 test/unittest/usdt/tst.enable_pid.r
>  create mode 100755 test/unittest/usdt/tst.enable_pid.r.p
>  create mode 100755 test/unittest/usdt/tst.enable_pid.sh
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 54e115f51..dcec76956 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -43,7 +43,6 @@
>  
>  /* Provider name for the underlying probes. */
>  static const char	prvname[] = "uprobe";
> -static const char	prvname_is_enabled[] = "uprobe__is_enabled";
>  
>  #define PP_IS_RETURN	1
>  #define PP_IS_FUNCALL	2
> @@ -77,7 +76,6 @@ static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
>  };
>  
> -dt_provimpl_t	dt_uprobe_is_enabled;
>  dt_provimpl_t	dt_pid;
>  dt_provimpl_t	dt_usdt;
>  
> @@ -85,8 +83,6 @@ static int populate(dtrace_hdl_t *dtp)
>  {
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
> -	    dt_provider_create(dtp, dt_uprobe_is_enabled.name,
> -			       &dt_uprobe_is_enabled, &pattr, NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
>  			       NULL) == NULL)
>  		return -1;			/* errno already set */
> @@ -464,7 +460,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	dtrace_probedesc_t	pd;
>  	dt_probe_t		*uprp;
>  	dt_uprobe_t		*upp;
> -	int			is_enabled = 0;
>  
>  	/*
>  	 * The underlying probes (uprobes) represent the tracepoints that pid
> @@ -487,8 +482,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		strcpy(prb, "return");
>  		break;
>  	case DTPPT_IS_ENABLED:
> -		is_enabled = 1;
> -		/* Fallthrough. */
>  	case DTPPT_ENTRY:
>  	case DTPPT_OFFSETS:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
> @@ -499,7 +492,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	}
>  
>  	pd.id = DTRACE_IDNONE;
> -	pd.prv = is_enabled ? prvname_is_enabled : prvname;
> +	pd.prv = prvname;
>  	pd.mod = mod;
>  	pd.fun = psp->pps_fun;
>  	pd.prb = prb;
> @@ -691,21 +684,6 @@ static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
>  		dt_probe_enable(dtp, uprp);
>  	}
>  
> -	/*
> -	 * If necessary, we need to enable is-enabled probes too (if they
> -	 * exist).
> -	 */
> -	if (is_usdt) {
> -		dtrace_probedesc_t pd;
> -		dt_probe_t *iep;
> -
> -		memcpy(&pd, &prp->desc, sizeof(pd));
> -		pd.prv = prvname_is_enabled;
> -		iep = dt_probe_lookup(dtp, &pd);
> -		if (iep != NULL)
> -			dt_probe_enable(dtp, iep);
> -	}
> -
>  	/*
>  	 * Finally, ensure we're in the list of enablings as well.
>  	 * (This ensures that, among other things, the probes map
> @@ -850,6 +828,29 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
>  	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
>  
> +	if (upp->flags & PP_IS_ENABLED) {
> +		/*
> +		 * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
> +		 * prototype looks like:
> +		 *
> +		 *	int is_enabled(int *arg)
> +		 *
> +		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
> +		 */
> +		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, PT_REGS_ARG0));
> +		emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> +		emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
> +		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
> +
> +		goto out;
> +	}
> +
> +	/*
> +	 * Continue with normal USDT probes.
> +	 */
> +
>  	/* Read the PRID from the table lookup and store to mst->prid. */
>  	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
>  	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
> @@ -906,110 +907,11 @@ out:
>  	return 0;
>  }
>  
> -/*
> - * Copy the given immediate value into the address given by the specified probe
> - * argument.
> - */
> -static void
> -copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
> -{
> -	dt_regset_t	*drp = pcb->pcb_regs;
> -	dt_irlist_t	*dlp = &pcb->pcb_ir;
> -
> -	emitl(dlp, lbl, BPF_STORE_IMM(BPF_DW, BPF_REG_FP, DT_TRAMP_SP_SLOT(0),
> -		val));
> -
> -	if (dt_regset_xalloc_args(drp) == -1)
> -		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> -	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(arg)));
> -	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> -	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> -	emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
> -	dt_regset_xalloc(drp, BPF_REG_0);
> -	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_write_user));
> -
> -	/* XXX any point error-checking here? What can we possibly do? */
> -	dt_regset_free(drp, BPF_REG_0);
> -	dt_regset_free_args(drp);
> -}
> -
> -/*
> - * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
> - * prototype looks like:
> - *
> - *	int is_enabled(int *arg)
> - *
> - * The trampoline dereferences the passed-in arg and writes 1 into it if this is
> - * one of the processes for which the probe is enabled.
> - */
> -static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
> -{
> -	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	const dt_probe_t	*uprp = pcb->pcb_probe;
> -	dt_ident_t		*usdt_prids = dt_dlib_get_map(pcb->pcb_hdl, "usdt_prids");
> -
> -	assert(usdt_prids != NULL);
> -
> -	dt_cg_tramp_prologue(pcb);
> -
> -	/*
> -	 * After the dt_cg_tramp_prologue() call, we have:
> -	 *				//     (%r7 = dctx->mst)
> -	 *				//     (%r8 = dctx->ctx)
> -	 */
> -	dt_cg_tramp_copy_regs(pcb);
> -
> -	/*
> -	 * Copy in the first function argument, a pointer value to which
> -	 * the is-enabled state of the probe will be written (necessarily
> -	 * 1 if this probe is running at all).
> -	 */
> -	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, PT_REGS_ARG0));
> -	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> -
> -	/*
> -	 * Retrieve the PID of the process that caused the probe to fire.
> -	 */
> -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
> -
> -	/*
> -	 * Look up in the BPF 'usdt_prids' map.  Space for the look-up key
> -	 * will be used on the BPF stack:
> -	 *
> -	 *     offset                                       value
> -	 *
> -	 *     -sizeof(usdt_prids_map_key_t)                pid (in %r0)
> -	 *
> -	 *     -sizeof(usdt_prids_map_key_t) + sizeof(pid_t)
> -	 *     ==
> -	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
> -	 */
> -	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(usdt_prids_map_key_t)), BPF_REG_0));
> -	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
> -	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
> -	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
> -	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(usdt_prids_map_key_t))));
> -	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> -	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
> -
> -	/*
> -	 * If we succeeded, then we use copyout_val() above to assign:
> -	 *	    *arg0 = 1;
> -	 */
> -	copyout_val(pcb, DT_LBL_NONE, 1, 0);
> -
> -	dt_cg_tramp_return(pcb);
> -
> -	return 0;
> -}
> -
>  static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>  {
>  	char	*name;
>  
> -	if (asprintf(&name, "dt_pid%s/%c_%llx_%llx_%lx",
> -		     flags & PP_IS_ENABLED ? "_is_enabled" : "",
> +	if (asprintf(&name, "dt_pid/%c_%llx_%llx_%lx",
>  		     flags & PP_IS_RETURN ? 'r' : 'p', (unsigned long long)dev,
>  		     (unsigned long long)ino, (unsigned long)addr) < 0)
>  		return NULL;
> @@ -1019,7 +921,7 @@ static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
>  
>  /*
>   * Create a uprobe for a given dev/ino, mapping filename, and address: the
> - * uprobe may be a uretprobe or an is-enabled probe.  Return the probe's name as
> + * uprobe may be a uretprobe.  Return the probe's name as
>   * a new dynamically-allocated string, or NULL on error.
>   */
>  static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
> @@ -1181,21 +1083,6 @@ dt_provimpl_t	dt_uprobe = {
>  	.add_probe	= &add_probe_uprobe,
>  };
>  
> -/*
> - * Used for underlying is-enabled uprobes.
> - */
> -dt_provimpl_t	dt_uprobe_is_enabled = {
> -	.name		= prvname_is_enabled,
> -	.prog_type	= BPF_PROG_TYPE_KPROBE,
> -	.populate	= &populate,
> -	.load_prog	= &dt_bpf_prog_load,
> -	.trampoline	= &trampoline_is_enabled,
> -	.attach		= &attach,
> -	.probe_info	= &probe_info,
> -	.detach		= &detach,
> -	.probe_destroy	= &probe_destroy_underlying,
> -};
> -
>  /*
>   * Used for pid probes.
>   */
> diff --git a/test/unittest/usdt/tst.enable_pid.r b/test/unittest/usdt/tst.enable_pid.r
> new file mode 100644
> index 000000000..675fcdd6f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.enable_pid.r
> @@ -0,0 +1,45 @@
> +                   FUNCTION:NAME
> +                        :tick-1s 
> +
> +                   FUNCTION:NAME
> +                        :tick-1s 
> +
> +                   FUNCTION:NAME
> +                        :tick-1s 
> +
> +                   FUNCTION:NAME
> +                        :tick-1s 
> +
> +done
> +========== out 1
> +is not enabled
> +=== epoch ===
> +is not enabled
> +is enabled
> +is not enabled
> +=== epoch ===
> +is not enabled
> +=== epoch ===
> +is not enabled
> +is enabled
> +is not enabled
> +=== epoch ===
> +========== out 2
> +is not enabled
> +=== epoch ===
> +is not enabled
> +=== epoch ===
> +is not enabled
> +is enabled
> +is not enabled
> +=== epoch ===
> +is not enabled
> +is enabled
> +is not enabled
> +=== epoch ===
> +success
> +-- @@stderr --
> +dtrace: description 'test_provNNN:::go ' matched 1 probe
> +dtrace: description 'test_provNNN:::go ' matched 2 probes
> +dtrace: description 'test_provNNN:::go ' matched 2 probes
> +dtrace: description 'test_prov*:::go ' matched 3 probes
> diff --git a/test/unittest/usdt/tst.enable_pid.r.p b/test/unittest/usdt/tst.enable_pid.r.p
> new file mode 100755
> index 000000000..baf9d2a90
> --- /dev/null
> +++ b/test/unittest/usdt/tst.enable_pid.r.p
> @@ -0,0 +1,7 @@
> +#!/usr/bin/awk -f
> +{
> +	# ignore the specific process ID
> +	gsub(/test_prov[0-9]+/, "test_provNNN");
> +
> +	print;
> +}
> diff --git a/test/unittest/usdt/tst.enable_pid.sh b/test/unittest/usdt/tst.enable_pid.sh
> new file mode 100755
> index 000000000..91923014d
> --- /dev/null
> +++ b/test/unittest/usdt/tst.enable_pid.sh
> @@ -0,0 +1,183 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# @@timeout: 80
> +
> +PATH=/usr/bin:/usr/sbin:$PATH
> +
> +#
> +# In this test, we check that is-enabled probes depend correctly on pid.
> +#
> +
> +dtrace=$1
> +CC=/usr/bin/gcc
> +CFLAGS=
> +
> +DIRNAME="$tmpdir/usdt-enable_pid.$$.$RANDOM"
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +#
> +# Set up the source files.
> +#
> +
> +cat > prov.d <<EOF
> +provider test_prov {
> +	probe go();
> +};
> +EOF
> +
> +cat > main.c <<EOF
> +#include <signal.h>
> +#include <stdio.h>
> +#include "prov.h"
> +
> +/* We check if the is-enabled probe is or is not enabled (or unknown). */
> +#define ENABLED_IS	1
> +#define ENABLED_NOT	2
> +#define ENABLED_UNK	3
> +
> +/* Start with the previous probe "unknown". */
> +int prv = ENABLED_UNK;
> +long long num = 0;
> +
> +/* Report how many times the previous case was encountered. */
> +static void report() {
> +
> +	/* Skip if there is nothing to report. */
> +	if (num == 0)
> +		return;
> +
> +	switch (prv) {
> +	case ENABLED_IS:
> +		printf("is enabled\n");
> +		break;
> +	case ENABLED_NOT:
> +		printf("is not enabled\n");
> +		break;
> +	}
> +	fflush(stdout);
> +
> +	/* Reset. */
> +	prv = ENABLED_UNK;
> +	num = 0;
> +}
> +
> +/* When USR1 is received, mark an "epoch" in the output. */
> +static void mark_epoch(int sig) {
> +	report();
> +	printf("=== epoch ===\n");
> +	fflush(stdout);
> +}
> +
> +int
> +main(int argc, char **argv)
> +{
> +	struct sigaction act;
> +
> +	/* Set USR1 to mark epochs. */
> +	act.sa_flags = 0;
> +	act.sa_handler = mark_epoch;
> +	if (sigaction(SIGUSR1, &act, NULL)) {
> +		printf("set handler failed\n");
> +		return 1;
> +	}
> +
> +	/* Just keep looping, counting consecutive cases. */
> +	while (1) {
> +		int now;
> +
> +		/* Check the is-enabled probe. */
> +		if (TEST_PROV_GO_ENABLED()) {
> +			now = ENABLED_IS;
> +		} else {
> +			now = ENABLED_NOT;
> +		}
> +
> +		/* Compare to the previous case. */
> +		if (now == prv) {
> +			num++;
> +		} else {
> +			report();  /* resets num */
> +			prv = now;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EOF
> +
> +#
> +# Build the test program.
> +#
> +
> +$dtrace -h -s prov.d
> +if [ $? -ne 0 ]; then
> +	echo "failed to generate header file" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -c main.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to compile test" >&2
> +	exit 1
> +fi
> +$dtrace -G -64 -s prov.d main.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to create DOF" >&2
> +	exit 1
> +fi
> +cc $test_cppflags -o main main.o prov.o
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >&2
> +	exit 1
> +fi
> +
> +#
> +# Start two copies.
> +#
> +
> +./main >& out.1 &
> +pid1=$!
> +./main >& out.2 &
> +pid2=$!
> +
> +#
> +# Run DTrace with different pid probes, each case is its own "epoch":
> +#                   pid1?      pid2?
> +#   - 1              no         no
> +#   - $pid1          YES        no
> +#   - $pid2          no         YES
> +#   - *              YES        YES
> +#
> +
> +for pid in 1 $pid1 $pid2 '*'; do
> +	sleep 1
> +	$dtrace $dt_flags -Zn 'test_prov'$pid':::go { trace("hi"); }
> +                               tick-1s { exit(0) }'
> +	if [ $? -ne 0 ]; then
> +		echo ERROR: dtrace
> +		kill -TERM $pid1
> +		kill -TERM $pid2
> +		exit 1
> +	fi
> +	sleep 1
> +
> +        # Use USR1 to mark epochs in the output.
> +	kill -USR1 $pid1
> +	kill -USR1 $pid2
> +done
> +
> +echo done
> +echo "========== out 1"; cat out.1
> +echo "========== out 2"; cat out.2
> +
> +echo success
> +
> +kill -TERM $pid1
> +kill -TERM $pid2
> +
> +exit 0
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
