Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256741D0480
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726339526; cv=fail; b=oAWIJfpSMoRcNi96qntNft3gsAnlPgcEu6nPtJuIVE4/Wk0xAIuOkFcHi4a0phx0kteME+1kLIlBhtYUHXyADA7esXf0p6nSy0UftEPP47i2q+S+nJVp0B/N4GdnRM00ipgblxYb+0k/TegwlC3vh9ZQILS3KTYTmTWtuWMiuw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726339526; c=relaxed/simple;
	bh=QENiApOW+RMdB9KhO0KG54vZcM00hARqO+VceM4WZDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FxD+31o+qxG+8KxXbcZdlaGXDIKmedgqpjY0iY0BYba1B9+/jUSI91IfvF06fv2cOoxIgLgXr4JByKtUWr+YkhAmF+/AJBi1eHPzxqCTYEJRhnYWpVDx2wSFCGW+EAyLFpLtTnBqJSCwLNwKxmFav0AbhQLAbTRPYPU3pxA9XsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LLN5IUQQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I+E21bLG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LLN5IUQQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I+E21bLG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48EGdHVq028319
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=20A9UZ6Vzr4wObK
	5ro5Ognn7komMYOZwvn9d3oJ7c/E=; b=LLN5IUQQVIOESMDrKA9d8SW6SFCoeYT
	qu6EE+t8FVWGxAtEEOfp31EyTn2AAjbRgcdSk0QjcJQJF8X/2FWfFNLW8LBhcfO3
	4y+vb2e8XyWZOy1DEzpl0IjLKB+LamfMvAt8PrLf+glJ3auGrOJtq+A/Gqtox2uQ
	wsQvm++2jYQlk4Y3LzpY8zKI4bCwUg3c26OP1Z+6OgDR8RH+xvz+NKjvVDaIQuOD
	bQD7eKgFj95O3x6yZFI6Ybi+MXelFO0y2Cxwj1u0cRLUBCvpGeidQe3qgaOIlWEd
	UOTDDSBjkWyrAOqxlG9P3VKq+Z32b0oCST2ExvL3RnijCapVkiQF+DA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sfgpg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:45:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48EEH7fw012284
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:45:22 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41n0x6pbuc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 14 Sep 2024 18:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhOnYtlMQkSOKLXC/N3T3yKjV+zv+azyFYP8/PzBPkqE24B6gNt/6LOCnNeqEU4V5uE0uDtluC28Tz0drxd84JsqlizL/KhlXhO2KStEqOQ8fAkHsNqcPHUkH7g2Kl/fsiP+z2J+iNKH3uYfhMJv1yes44pECJvwQ2lMs2FipbzAESj0UMqtBmCY8+mIDA0h0I/UxG4dvLRD3KoYh47U2ma3z9Bp5lzSq9615f1xtjYp6davSBwHxNEijLSke6loqQU+8hkgaJESslLl+uZ9b6Z/jxPlemSgtUzK+pE+TRtKrZy5+OaOSeJbLxds/Jvc+KP0xO3hUktnOYCzqKk+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20A9UZ6Vzr4wObK5ro5Ognn7komMYOZwvn9d3oJ7c/E=;
 b=qEXbgsMTEsG0uLfOSIWu31th6ANMAAfWYkzH/GcxEq5YOOEIF8UhfkY3rIKoVq3ipzQWwcMqLAHv58xqrzyciB+Lw/+4F/73jp6T9lUN2QK2KDf0xx2dQMbEYZ98oe3yPVHkIseIghPULvbnehptf3vKvZrORHyPkCjFhYI0Ts5EbwH157Z3MTFaoZ0KizIcNtW3VYHZx3PbIQ1V3RwE6w8PTJp1yLkFG1RLYUvSfJvgQnSEbMO7OCh1V6+9HkWq1THbwfaRbH8HrO9wI1EwQTGSCCA7GmAAytr6MJdAV4OEgVS7575WAWIpKUQt1YBwJO/nQU0e2WJZWi4ULGe2/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20A9UZ6Vzr4wObK5ro5Ognn7komMYOZwvn9d3oJ7c/E=;
 b=I+E21bLGyYkkUgI0kDq5Bud6I7M5IWuexwKcm7JsT869WgMYvUXlRLrRN8EoWCF4wzStDUwJJp60eHsKPcKOHrMSFxrz3xqTK5vJfV1S5nf6SGWbnFbOmRkWDN2uhb+7BCjdiCD93CPVJZcV8pT3oHgo+cp/1lItPx/3hsRxcto=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by BN0PR10MB4886.namprd10.prod.outlook.com (2603:10b6:408:114::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.11; Sat, 14 Sep
 2024 18:45:19 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7982.011; Sat, 14 Sep 2024
 18:45:19 +0000
Date: Sat, 14 Sep 2024 14:45:16 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 22/22] test: Update tst.newprobes.sh xfail message
Message-ID: <ZuXZvN1qPCXv0CZf@oracle.com>
References: <20240829052219.3234-1-eugene.loh@oracle.com>
 <20240829052219.3234-22-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052219.3234-22-eugene.loh@oracle.com>
X-ClientProxiedBy: BL1PR13CA0440.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::25) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|BN0PR10MB4886:EE_
X-MS-Office365-Filtering-Correlation-Id: 2950e677-0b16-4b69-73d9-08dcd4ed618d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ogVzpOxftyQ9Zg5rXjpCWtttltm4cvtR1/A5hGYFSeHQtKnA/Mn5sylYkzR9?=
 =?us-ascii?Q?GEXoj5bCG+C5gfOmxQclCcL5/ydYL+SKV2npTynM1Yxd44Spnip3arzaEE3/?=
 =?us-ascii?Q?hJErLOP4rqISRX+S6ghmghbJu8O6ucp9nsOD77Ff1fEqUBcsS+UI24EZSbYe?=
 =?us-ascii?Q?orDR0vK7rNyL/VUCibclCbgMzP/6MxHBag50IHIIJkmpuyCrbdsluGUnXlT7?=
 =?us-ascii?Q?7rsD0vOH1akaGeL3zJ72Wl3I2qFlPE/fqBBAYaXswuY18tQAYAlOVnQBZYqs?=
 =?us-ascii?Q?luK0JkarUr1y+NBTamTtx/ahPnOgFXq+GhXQ3L9MdWMbf2pQ7PyMD28fUP+A?=
 =?us-ascii?Q?vCllf1q8/Yayn3yxGmYtxKkUDF6A4QIIpKtXNUh+jNS5h50d4uMUp4QYDNEe?=
 =?us-ascii?Q?VIGMtUFqiXebelelC6VhK627CkiK8OGxnjfvSpMZCUgr2T18cMy3K8g6Pxkp?=
 =?us-ascii?Q?pzK7lOMrCuWd6zHH1PathmRMPlHZL/Z7x5CUL7ufIhUgPa+FrV5O5aTqv0Vs?=
 =?us-ascii?Q?cZyHBPmbFnESIwe1uyfkLchuy7oA8w8t+s+IJCuCmrvE9v37QiSbEoq71YoD?=
 =?us-ascii?Q?WNFt67SoFC8RtM3YSFSNzynU0QbNIkc2ysBs8U1/3ItyZMG9D+umRQifwo1H?=
 =?us-ascii?Q?jwqo25DUh7mQFTwvh1Fo8GqsghoZL7WhdhJhaXSLXOgFpzu9eN9SwhJYliZW?=
 =?us-ascii?Q?7HZ6/kAg6ukoojpMENaUEPV2yaLN0gpCScsu/CL7DSN3PxqWbNCFrss3Opxx?=
 =?us-ascii?Q?m7QFlJLkzQvIFaTE30nTz79dv2R7gdnBKBSkuMF2S/ntJB76W+J6SBBWfDDp?=
 =?us-ascii?Q?lu4Ld37k9P5qCpFKZQ9g+oph9pCdt0lXV8c3xMmWiD0XWpn+mRbATMREbvh8?=
 =?us-ascii?Q?p8T/pOfgFLxf6ghY/csXOq+PUGPXu2y6A/qeMX4SgzhXokCXvf6x/wemQa1w?=
 =?us-ascii?Q?MLbpNjjC7Bcs7kxfmpCjzI+g5iD9DxQSYKMRkD2+ZWPgjz8k2GtfpSNLYbGf?=
 =?us-ascii?Q?oHmM+RlKPHxJxMNfYzLNl3IxW8LCbULlji2N7PdMLDqmsZzSl+dkxGYgvJbq?=
 =?us-ascii?Q?+x9M5d4k7CsN6+aDGALHc0nRKy8YM0cjVPah8J3u4sF788NUrlv2QyJTjqUt?=
 =?us-ascii?Q?HbMwEjc1AEf9CoJ1QI/2pqxvu2P90LgcZ9ovuvIHONrlXMjaFCX15yiQJDmW?=
 =?us-ascii?Q?0e9fzWe4l8KCcvcdt5OdAAAqkCfUd0XtxZBNfoYYUKzPGf6dfAHPxFKP1CA3?=
 =?us-ascii?Q?c7i0G2Wrwd64T/Ao130PoPQM5/eaMzdYoOOuh9XuKfozqVhRR1kJWYnPl93U?=
 =?us-ascii?Q?fUVzyVdpVmMHKFYK87XPUwSw41f34K2t4Zlh7xn0BlKtGq9wwpvLu+6Hm1YO?=
 =?us-ascii?Q?3KbUEsw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AwXhuW5kOodVaQdP1pjG4mIe9kdZs5KzSvv79f0oyLV6DfQSCuxSFVt5aMzT?=
 =?us-ascii?Q?ud8R0fyMoTR2xb81yP0igqTy2kLz7t3zhh7vud1EVVJk3y5LVtRqvmwSaAir?=
 =?us-ascii?Q?58usQ9X7JYkFiV/Hli4NT1j55XDoBs2FXxZCwZytT3Fa0y69zNh2dVpu5iYJ?=
 =?us-ascii?Q?9NpEdhDMyvjeku7YDq7egzsN3KMxKdNs2YNailSNfX+jmNSVkSWkhuqbpUHq?=
 =?us-ascii?Q?SWjFk4g8663ckstmA/GrlVqcXVklIX5b7Rj6efmZM3TBpsa+LT0gfa4Vqriu?=
 =?us-ascii?Q?4RxVNncHWZSILcXD9f/JM5pM0hF86RWx8550Gge/BECHFZU8z6pumVgEWBAw?=
 =?us-ascii?Q?xvI2469L/+YAdnPPTEaV1ODbZaeKT5Vz3dj60guPYED0qYDpWKgDlFzClt56?=
 =?us-ascii?Q?q/nRg69HyCEteDTIdVAl4cBhskU047kCRPEe9WR+Kv80sCDM9zKVo6srZ25w?=
 =?us-ascii?Q?OBOrV5Gt2fAeCvxxWeqapiHfJ/mvI8aj+nB7d1om1lKb3/dF/g4QQGVlGXUn?=
 =?us-ascii?Q?mwVUxZHzM1GG/GYSTKArqbRFZwKUmwfaP2bHVA+EeB9DFJfM3ZIpRh8GsRZG?=
 =?us-ascii?Q?xdqx0fScANLCXeZwd/mBi1EAftT3WDngi7DcbhImiTCsGDt7v579QzzdR53o?=
 =?us-ascii?Q?aPStz1/IyKmFSW8gqqzo3ladUsJBpfCVv12ahHPLOQSU50Ly6dDqnNflQ7Xw?=
 =?us-ascii?Q?GwluzbGDHP/Sk4zwrx5BruNLhRhQScrBz+ZArIk8J8vMr+9iCwu8RmobSAxM?=
 =?us-ascii?Q?3+0F4Vv+o8hNxTRrbkWdHqhZ3jV6Swe5DdluebGfTVbp1GZrL7PSnAy4GIj6?=
 =?us-ascii?Q?1EHZzc0ODIzcWUczNGYfGCXTZJJPDL3GUhSqLr3FWRwbbRBsDMjFz9pXP7No?=
 =?us-ascii?Q?qydfOSA51vuKfwXtVner3rinYqn1t8GiOEDgtZnZu96aSRSw61hJDAB7pEST?=
 =?us-ascii?Q?QEqRAWbgaggdfmbzXjtTuNF8BVn2c1RFIoAgWPFqBF+whO6yd2xXVdFft+Im?=
 =?us-ascii?Q?KRP4Qijyd44flUER7Nx0VpjegFPpjz7v/0yJ9eQgUvV8T/LGAHh/0HkRmZi1?=
 =?us-ascii?Q?ZfNf8sD68TwhxM3jp6hAJAcDZ8DrS8Qp72+wu+nigyxy4lkbJCk/VCwo78lh?=
 =?us-ascii?Q?F7tPhxFVvTyRKFHyDNFHl7h5M3XhV3yCgF9fSTKSR9Y7KTcvqgB+mGzZYomW?=
 =?us-ascii?Q?pIYRGDGksBV49YeuRLn4NPwge5ZXTSAqF23GFWQqDzLz6bcfaP/DvyTqOKQa?=
 =?us-ascii?Q?tso+CsBr0lsuOetnPWl1kOSJ/tr0l1s1unGuUxGuSPkMIBG89IMYQpkFiD3P?=
 =?us-ascii?Q?1BlHergKwhRp18B3jbr1PmUaTqusNoD0dFzH3W4mtbMpEcgj5I7X2e8HLqvU?=
 =?us-ascii?Q?mroyI5sKJbhVazcs6hXr+bl1A2vt1BDs3+/Oqpzdcpqw/q7/98W645n6IHgB?=
 =?us-ascii?Q?v2CXj5U3OFh8dYp3ABD6S3GAI+hZPEZo/aRZGwxfO/S6C5Blai4o1V6IGnvR?=
 =?us-ascii?Q?8H+CcGYp9EQRNSfNZ0bHRORgi/G7rvaVD0YRYQ7Krd7HjQlMY6GNlrv84dAD?=
 =?us-ascii?Q?wIaejZ8lYEmQEwLW44FkOQ2obLEf2Qq/R4mgejvRLjw7okXcNy94ic1uQtm9?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2k0JPQWz8sdMc+YUbWjV9yDoZOsHA9QPSxLth3gCcAb71QrhVNxkdQbhPEtO1nI/EsiVgfSfpQY9cs71s7yZZLb4mf4yoqkEDSWLrhfNiHpE1ga6zIaLVmJWIz1ycyshR5Bq/T2rwxVsOz1LMMSh/nfX3B4CZtZpTW5xM6LzlqhEXRC6HjKPDsejmxDWZHuCf4fEFVsQMIrWWhzQ+YffaQuS3qCTVdfgkhH82RECOkRs+ndx73xLoyzV62K/+w2ea83d/73gKwJTBwIfM2c8hKMB7zIZdFCUvtL+xpqnDLVN18YmTESjD5kmAuMf3PSyJDcOvOeSc5J47QJxskYWzTa/2jAxR59Ts8Lvnx0ySpmUJFgH8fAORiK+sP/YKY0qiUM4XIrdQdAskvIkX90fY+9Ljux+i/1lnH7LE3EMVFlKtGpL5VhCqZJl4ZLr7NN1OSmyzt41dHveuRq/sQXCuP8syOMBqnDB0HGtT/emauyys2KXSQuUxjMjO4pWBSPkpbapIjEq36ViEGFadt8EiKQuDnd8Calg/pXPE1iyd9OfN88vEHUM6z5DuLcEZOsatvcokSNBqBdp1OAc+9UsSvz0Iv0B6Ud2/gZLeDz90jI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2950e677-0b16-4b69-73d9-08dcd4ed618d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 18:45:18.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cz6cbwk9VM2F1Bp+vWq/JGss8JObzu8aOYdPum0IN8+WfVu9sysUZluXRT9uMMKkodBTaW/JdHlBHmX5VhnPprdfHQ+S56wMDEqJSXiceOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-14_09,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409140132
X-Proofpoint-GUID: x7IE6ovxUVfAxomDkWt_NKpKY9OFyy-c
X-Proofpoint-ORIG-GUID: x7IE6ovxUVfAxomDkWt_NKpKY9OFyy-c

On Thu, Aug 29, 2024 at 01:22:19AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/pid/tst.newprobes.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/pid/tst.newprobes.sh b/test/unittest/pid/tst.newprobes.sh
> index a4944688..1a88c3a8 100755
> --- a/test/unittest/pid/tst.newprobes.sh
> +++ b/test/unittest/pid/tst.newprobes.sh
> @@ -6,7 +6,7 @@
>  # http://oss.oracle.com/licenses/upl.
>  #
>  
> -# @@xfail: not working yet
> +# @@xfail: we do not support wildcard pids for pid probes

I think it would be more accurate to say that 'dtrace' does not support
wildcards pids for pid probe.  It is not our choice or lack of support in
our implementation - dtrace never did support it.

Updated it to be:

   # @@xfail: dtrace does not support wildcard pids for pid probes

>  
>  if [ $# != 1 ]; then
>  	echo expected one argument: '<'dtrace-path'>'
> -- 
> 2.43.5
> 
