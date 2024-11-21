Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02086CDBA
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732213060; cv=fail; b=EC0a1LVaFR2tR9YMAEngo72k55gMc5ki8DWcM2zjGuUk0WBpX+OPqxfVr14GjaTUV6MjRKHHtmq+C04redqk5eZy2v3EW1PT7+YedtMacobwTpg96fu505jqCseQpmmKWpOJgikI++RrH2tw4IfwFOwl60aoTfuRkkT7BkarZio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732213060; c=relaxed/simple;
	bh=KiDPu0HcKST8W0Uj2PK+HqlNMJKKMQomAxIAjnz+eZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NZ+43uMplYdZSx47yDJ/ApydH2vL0p4Imha9U9NhlR9FzhyQY588dEOpVWYGnywRroB6iuSLssMBGX2zOaLf2wvdos+czrpClJXefmjfMOhYR7W11xiMRCyZANpPoddt56yp8pi+gLRDdIcnBDDMD4Pg72aVh5VVsVoaYwMwLMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JorgtA5V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v9Sd0O9T; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JorgtA5V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v9Sd0O9T"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALIBXaD017151
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=OtmKYhAu6V4OtIMz7d
	aovZFGWuMEo5QN3qVWm9hyQEg=; b=JorgtA5VjTd+Wf9k3BZPz6MPnYiFZMLa9L
	FmbAys9aUjdGe3IS0QegJetrJt28QKYhKcLUNypQ8sNzaEx32ZNgAPy+oxbTr3gk
	U1uhu2AQHMF1ZnLFUOMQEI46q+55UCurMFJ3+OsOPDGkhRQb9IT/7fh9KmvxaP7o
	eAro7z7OkdsMGw23sZqivnaG4pjF7/wweXxm30MhDztK31LK8YDasamWF2xhJtKi
	p8qcS49RPJAAUg+fORLgfpAvhV2q5bXBsCtrqm4TuXVjQs8wpt9G+swYMusUc5/O
	M7F++brtSaqba29/L6sWOQD0z+I8+tCHfVp0mb+EdjEx1abWwZxg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42xhyyjbuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:17:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALHYuaJ023199
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:17:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42xhuckv56-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 21 Nov 2024 18:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=suND9Y3T60lg6fZRGQ/DnnlbY/Pe+KbG+8ENeutYO9qVp+rsVEw0K3oaAprg5Txp5Y2PdVj9DBU9GOC4QuoTebU7RciXsd9FQ8UstKzg5kCmf5MwoLC1f0wn6nWLfU7VLROgdxNg866/OZLfifSuJtYxtV05OZ47pYoFm5H6fOT+2rRXdiaAYxcLdEK/UeZfbkWqvOfiCnWCc/R4HD9HD3fJ6HY8CMiJcyCa57XO60/DSZ8jC3L1mgcMxx9JbTwhArtNWi3yIf8mYNBf3mSikXtRp2lvDWs49WnOsUx50LpSc7qFRCIPKr6b5/b6BU3AD4tIiTnhrobEIh7wOP55Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtmKYhAu6V4OtIMz7daovZFGWuMEo5QN3qVWm9hyQEg=;
 b=VYFVVOo2j4RU3RgWUGR7UPhjKadmkpxHir8nvw0FToDb9kDAPZ+HijYOHLiRFHWKGCfOTiT+BXH4D17RCs+AvqN+3vB0vyGKM5yhFrA100Y0OeF6mA7AKl6LJkeks/t2cQ96w+89LIL2OgawM3bSr7GTjlGcueX2xnMvncDnR32XYSsECCeCEKYGeNMAxY1ha0xo4EZ+8jrntAMe1dNjbHgO+zNuGsThp4mW23hZ7IMOYm4WQexggSniMvYXrqQ4CFUVthe6+4JdeJNDjSrVI0ztERv1q7bnVOZ5P9awEp9dA2t+kD3k5kPyh1rEkXb3rKV+59QJWyhg7nkOAQ2NyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtmKYhAu6V4OtIMz7daovZFGWuMEo5QN3qVWm9hyQEg=;
 b=v9Sd0O9TFKuUrkeBdbTWORZVRyAEFelNNCxKakdnBB1lmcN9Rm7kjUjJydrBaxUM+2Nt/10OdkyRMi6QLjBIh/4ko5LXpSdXbkMa3qHFNcZsc33IYzjp43/MZ2nBVnOs23vxkTyCwzT0GJ/FUebtInirhjbZ2llBTjatin0JXA8=
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com (2603:10b6:a03:478::19)
 by SA3PR10MB7041.namprd10.prod.outlook.com (2603:10b6:806:320::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 18:17:32 +0000
Received: from SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe]) by SJ0PR10MB6350.namprd10.prod.outlook.com
 ([fe80::cfcf:fa44:f610:4cfe%5]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 18:17:32 +0000
Date: Thu, 21 Nov 2024 13:17:29 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] Fix memory leaks
Message-ID: <Zz95ORuCZkzpGQlz@oracle.com>
References: <SJ0PR10MB635051E2F4FFEA4CBE5B3B02C2222@SJ0PR10MB6350.namprd10.prod.outlook.com>
 <ea997f1c-1ccc-cce7-d867-e19109bbcf46@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea997f1c-1ccc-cce7-d867-e19109bbcf46@oracle.com>
X-ClientProxiedBy: BL1PR13CA0426.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::11) To SJ0PR10MB6350.namprd10.prod.outlook.com
 (2603:10b6:a03:478::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB6350:EE_|SA3PR10MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: 62eec39b-06ba-474f-49f3-08dd0a58c403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EqAgVdIveEMbcv1uFpmSXftll6zYY+r6ze5W1vlTleg4RZb2Mjf2vFMr2GQQ?=
 =?us-ascii?Q?1OBCZtprG4XohepOWG7fRP/s0JbUujvM8GNBeSh6fdsqZ1PDGWI7RlIXK1Vg?=
 =?us-ascii?Q?Y1ELzj9s1wFNetOBIHze15IgfaAu/gzSUS401yyAQHEpwAU4MTQbZbkTWIvY?=
 =?us-ascii?Q?j7Nh+roQMYGsZwUA44TmJQz/QuEyjIfzfKsTHw8VUperEfJLIbHkvYp/h3fm?=
 =?us-ascii?Q?0uOOCehlF8KEfvb0W2qddGGIhpoWcsAXyq1mZk1+CSKjY7Xfze879LGA1nIx?=
 =?us-ascii?Q?wrdHb+ewfPElh6n6s8cYG8PVkgcGTSSvZrMqRLV9PffOWUFO/t69fhe3HSyR?=
 =?us-ascii?Q?R34fzbUkj6Eppff/U7ISimD+qtqttwWFVFRAtWZR5tcdRxGfrkcW0QrmM/hp?=
 =?us-ascii?Q?FvKRpYf8HwExHU71uX8vSxcvfWitN86Dpma9Xt7h2HIe3u5nvX6SEA1xHODY?=
 =?us-ascii?Q?AiUYJL6o1+0m/yFJ4zHAbiwHulNNiqVaVHG+JggWUou0pBZ6vrnbb5T1EGZ+?=
 =?us-ascii?Q?GAFqMD/BAwchjwin3wih56C1mTP1dKSNHPtfcj2fCKHfdC3qTXdgu/EeyWTU?=
 =?us-ascii?Q?SNjGAaLk5Gme78ku04KXGJAleWmXbFdemNydvYkSFZQfdtvAaJmPI+1WdqSC?=
 =?us-ascii?Q?JzL3V0Obre4yfi7eV3uYuHnIwz8GBAZh8Y3y9gEKin6J4Ep5Fu/PcirVTMQV?=
 =?us-ascii?Q?GBO0eTaXfb4eUm+Pp37EzLDWoIvJB0pHv8eBHb7uemSfg1Z4YsdKQsL/MZTB?=
 =?us-ascii?Q?LlgjPP3xKSM4YFgdwsQTXC/D7iCPs7A6PaeiWWs+jGf3t9rI18nVgWTQf4dm?=
 =?us-ascii?Q?EZpulH2/D0YuWcP0VWEJlfu5bht/4l45q7YTkzaKjBhJl1mq39qZWL9ti2H1?=
 =?us-ascii?Q?ADnQwG6I7liYoY9V2Hao4VJZ8bXrSEsLE+lOCJHF3T3CnB6IaLegEmofECac?=
 =?us-ascii?Q?Hn+AcYKp3K6eRvGoh+NCTfcHdxMnCXsMMiQqMkzY07dxAjl6b79OiAfm1TPK?=
 =?us-ascii?Q?qXGmU6UQLyExvhbzX4fEiq2p5EMmmaNO0TsX/VnP5viTdJAiGM43GNb58SyC?=
 =?us-ascii?Q?1O+x3Ec1Jc6fuXQq8La5IArmJxX4VWibLfoHedr0tHgoTF8TlqlXjYIxZiIg?=
 =?us-ascii?Q?KWkFvwUYikxHKld6weT7yInflsOFsXqXgDWkne32lUw6t3GhrWD3iP8dIUop?=
 =?us-ascii?Q?vsymwJsoxxPoD2dV4YSvWjNo9Xd4USCMtS+Uk/eeuOhbWLoXUbQE8APqXf9g?=
 =?us-ascii?Q?fqBvIXaY+X5jVQ4wB7sZjGUPGpZwd3GKdAs6tsAiHZY/NXJZtC+fOX58tqXE?=
 =?us-ascii?Q?OFoBrrVayFx6mqE8ZmPp7XqN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB6350.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dtz8vrIBTh/wqMDjASw3zX1ilukFL7EsNP/o9p6629FPf2ECqjFzQWUShrSQ?=
 =?us-ascii?Q?j6H1D228rS9coLvGy2FUYFkrhSDY7onQ41X7QFNDSdARRrkZ1y/1BbhtwVHA?=
 =?us-ascii?Q?w3M59oi2TOf/uC2d+XH9B3Ffq1zJE+A2FwiyFHqI+YBlb6YDQ8GV0Dy9Cukd?=
 =?us-ascii?Q?GuKy/qYGvaxdoH1zy8NPlqv1LibGSJ+Zy8WW65lJzOZuB/lg2NxzD78EktkZ?=
 =?us-ascii?Q?i8hQghwFuDhWa6e9Ym5VaOV3l+ZmhPCLUEXeJeyaniPxIOlh3KSdx/UJunDs?=
 =?us-ascii?Q?2fhPm01TZZozX+FQxC17y7mtI3GX5O1ezCwgrPVThT0E1psj4OwajRQC0Vva?=
 =?us-ascii?Q?tR+HgBMeZCfXmW7MHP9dXcjy/U+E4/9kDPFGdwIJizq4eE97DAg7zZ8af1vV?=
 =?us-ascii?Q?YFH86eMt68tqku8wP4TaVKYiuxHmOY4WFVkK627tbLoPNr3d2wGCqhyMV6e/?=
 =?us-ascii?Q?vW79xB+qi1oz425HddyW/Tp9ijP0M0NByd3EjxdEZcYENSCuma3rnBqEWotp?=
 =?us-ascii?Q?PIFbwPZzQyWZQ1RawGvJlQxV+zefF+twmTC59H1rCiLIAy3IQVoFLNssDTCC?=
 =?us-ascii?Q?77tvDG11Fsd+Y3wod6sYfzsIsjMRvE5ALiWfpUV+h+DTnZ8srs06sSezBzqp?=
 =?us-ascii?Q?7JHqNIHt2dxhwB8ZTuM8ZOro5mSPaA9T7UagtVHjtzhgpc3ZLi3bIIm77WBB?=
 =?us-ascii?Q?cyvl8rxIMylF8WSEeF5B+aOPOzyNW869UZMPRyn/Z/PzrvQZsKjh+PfLCDw3?=
 =?us-ascii?Q?hZZklTtdl1wdaE3ZDbsVntW9TzBOixAY+USYwhUkEVgXHs4RF78UVOdu1rRD?=
 =?us-ascii?Q?WmXEnCXPLUuPuZv9dh5RD+J5KcuanGmpgzX2zLAPQXwmjfBVz6OEERP8D0P2?=
 =?us-ascii?Q?pk4jQ7QopZBPKF9L4WCTNOr2V0+9A8N0oDWzCZ5sGziHqY5MaJBxZbIi0q4r?=
 =?us-ascii?Q?RE5i4IsGDhNohlNtxt0TBz5HO93brhwrOEhZ4+P9+I3s5Yt6fB67npnFRXju?=
 =?us-ascii?Q?oWiV90i4iSWNfzdTE+jrpq73WoR97zp7NKXwjNCinu4JsJPoCztqU+UgwWt0?=
 =?us-ascii?Q?HPDksbQIO4BQiEFv2HnQXd51adDa6JX4keYCRUR8yfqCG+hR+JZbDmnjR74M?=
 =?us-ascii?Q?iej17r/wSOkU5N4oxFiCGJ4BQceq5LrGawC/kE2Kny0Vq9qFV9Nzz8w4IcSm?=
 =?us-ascii?Q?8QGpAlBWcO69EaCHSHJSUp453CthpkfVyBU9++QQB1qvb68D90PHINGCsS+v?=
 =?us-ascii?Q?woUSHXBUUDlVz6SsYrvdcnrv+1Wya3BAmotxsnAlm6KVcL0TDORfTNoZm9Cw?=
 =?us-ascii?Q?xT3W65z1SSf8Cm+zUKSWQd3SFe6O28IWnzwT1JcayfGPqSElR6Hmow+le778?=
 =?us-ascii?Q?vqyFBK+F1erxOAw1Hc6Gs070OV7pTNH3UFhT/xXomGLadyfpUDv5bORE2/fw?=
 =?us-ascii?Q?ofFc9MQhnFumiLbcFuVODxjD6aoBxdH52VctBCMvRc6O9GNA5EnxRKRDS66S?=
 =?us-ascii?Q?PuDIefjiYJP9xHRO+F+cFdovZ2dQRJwJ53yuRvHdO/VG1MsyxxyYQnFnP03+?=
 =?us-ascii?Q?AXtiN1NvCy6/Fcx3YcJC73bVKcZBO0JlsUHkwsY8xsqIbKd4IYqrk1hnWj8t?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y/5+ro3aZNjgWVJ/kDE1IVuuBxQo76dszvCNe7kg9WcFsYtrHlMl7QZzqOVaJsHVyY6v4PbhLia8Y22FOcc1aDuOTtUuypGu/YVSxet+Ff+qcLvtW7lcFC8RWQEdx/8hZNIq6ay4UWe8Y1hrChBveZs3UxIv6b7BbGVM1J8uemPOTm2pGAVSLZe1oONovvwCm2nYuGT7uUutz10JlN6+07cHuMtJM4zLrp+iy/EUTUYvOQxlSW91hxltU2qAC96snZMBVpoAek0vC24b0AT3lcPmMAIDFc8k7vFp4dUFttUyOI7TbFCwZb/p/LzUmVNKBDxiTq0T+9op4Mz5L9ItWu6hzRhCLQ1r5JiURu0jFW1YydF0TD/uKLXhJbz03+qLe1dJ+Pk9MgLIpLC1UpSnzLphFvuuKfTpAYpdrFbbAzcTRlshQQXhTPaQgGs0DuehgBPaqbP9WCJOApaEtFmc89kvjBT+PVAMGZn3Eqi9F+t+Afuz07J9s7+DOidCuot93727yoG9NfYZLmsYucn1G5BthtVPDh4GGHju/jvbKRuchafLXyMOnE00PNwVDNboe2UPH7VAZ33vGb7EZ13d3G6DEWd5j5VHJW8zeFKTifA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62eec39b-06ba-474f-49f3-08dd0a58c403
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB6350.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:17:32.0383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLOJGIIEmh5A8PpVeeYfHAKyadmUoj/IT8ktECjtYUWw3nVM7Gfjl6e2S5dZ37U8K2wInl3DVAdkAqzfF1sFfm9uC3X4N9tlfpY41l1DRhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-21_11,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411210137
X-Proofpoint-ORIG-GUID: zyy0VsSVnlTj2LnuEyZFm1h9_NjD-nRR
X-Proofpoint-GUID: zyy0VsSVnlTj2LnuEyZFm1h9_NjD-nRR

On Thu, Nov 21, 2024 at 01:10:29PM -0500, Eugene Loh via DTrace-devel wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> (Oops by me.)
> 
> I don't have a good feel for these things, but in dtrace_close() might it
> make more sense to move the free(dt_stmts) to right after the
> dt_program_destroy() loop?

Sure.  Sounds like a good idea.

> With this patch, it also makes sense to remove the "CPC will call
> pfm_terminate()" comment in dtrace_close()

Ah yes, I overlooked that one.  Thanks!

> On 11/21/24 01:40, Kris Van Hees wrote:
> > The array of statements was never freed.
> > The PFM library data was never cleaned up.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   libdtrace/dt_open.c     | 2 ++
> >   libdtrace/dt_prov_cpc.c | 1 +
> >   2 files changed, 3 insertions(+)
> > 
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index e1972aa8..717a7ad0 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -1314,6 +1314,8 @@ dtrace_close(dtrace_hdl_t *dtp)
> >   		free(dirp);
> >   	}
> > +	free(dtp->dt_stmts);
> > +
> >   	free(dtp->dt_cpp_argv);
> >   	free(dtp->dt_cpp_path);
> >   	free(dtp->dt_ld_path);
> > diff --git a/libdtrace/dt_prov_cpc.c b/libdtrace/dt_prov_cpc.c
> > index 8f33cf58..57b11b13 100644
> > --- a/libdtrace/dt_prov_cpc.c
> > +++ b/libdtrace/dt_prov_cpc.c
> > @@ -484,6 +484,7 @@ static void destroy(dtrace_hdl_t *dtp, void *arg)
> >   		dt_free(dtp, probe_map);
> >   	}
> >   	dt_free(dtp, arg);
> > +	pfm_terminate();
> >   }
> >   dt_provimpl_t	dt_cpc = {
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
