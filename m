Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175DA145A03
	for <dtrace@lists.linux.dev>; Mon,  6 Jan 2025 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190835; cv=fail; b=CiUvKK4h1s2btLaD2AhEkN0gpc/VSw6w7LwRvfz4nLvOYzx1t18rlEv43HyS8QFRWn8sAN09Ekj4D1iwNe7StkIfYEGgOS5Yvf6Ung8RR3hEL27+E+iynEKhfJviOhrlWRs5/rOlGLetvMTvLs6cKGDcrZXe9bLaFN2XtCmws8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190835; c=relaxed/simple;
	bh=FUJIekPNKPHZ6JlFqb0iuIBQzm+9UuPz+rcPkk7Onvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RhGayOza9e5DMni35URbWp8Q+HgGw1icYv2Nqx/Uw/j1gzUvSxv6NEZ/Eodmednsndcq0fvWv7WA3dH8aL+WJroKj2MaOIQcLztoeSe/8U7wyWeQ2Zdx6606ZXshtleMeOML6NuH+y03sVixuYyCUAbZO41y+Oa/1/8ALC41+jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=O9qYLVmd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ise6ctx2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="O9qYLVmd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ise6ctx2"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506HtjiB000731
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 19:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=mDX0WdoOg1S79hxKcT
	hj3t4JgCqCLCupkeYZqU0aGnM=; b=O9qYLVmd1GOddNpCbWQCbZC8CwJTCtl6B3
	m7TJZS3J8I52c4bLrPenqkB+3nuVy130PPGHyo14dZn9IciqtDUV2YX4gRUSldxg
	SimuvxbWbABwLQqPJrtCEs/1Y4bBCIox4oUur3VoyMBKR2tDUudKg5hY1c1qtoFj
	/9mI8MdiOmdoJmxjn2Z+k1YZXGQOBA65xHck5iOhqyuh7wsedmMtngh2f92H2BQk
	3v7hJb88SFjHLuugYAcH4V7mH+0mLxFh5vKWofdVzzfHikVNXuDGAoVGc2RX9mFs
	gRt0Eq8DUh6gIemQPqmRC66aOrIPPGa+cNijbpTsTprYpoJRnpow==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xvv92xjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 19:13:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 506JC31C022692
	for <dtrace@lists.linux.dev>; Mon, 6 Jan 2025 19:13:52 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2041.outbound.protection.outlook.com [104.47.51.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43xue7mfg9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Jan 2025 19:13:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcgWiY9Ket+Bj1MrdXGgF8SP/sl68LVphF45/C4hoah2Xnz5V6CrqU7f9O/ZZBPR7M7gFBDwUhh6utQ5wlalXW50StB51PlM5TlIXRVoO2K9SDdm1Aou9EWt1iOcON4b9GR6i0U0E/GqhDNZoExDiQ/wavgd9KBi6nvU9KdFrA0+zReEaTkst+XCmKFb2ta4Q4ZHfumhOe0ITuTkqLXEkw0hdsFDoE3EKr3yb3POeobFvufJh5IjOWhom6NSeNLj7XAVcVgWXQyGT1nsbIEr2iKxxDkzPFMg/+1htmGXoGvj7U5TkM7B6IeEyRhPQmbFHgjyeUES42cEbfEFh3ICdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDX0WdoOg1S79hxKcThj3t4JgCqCLCupkeYZqU0aGnM=;
 b=nY9jK92J7muPeeYuTMSeC5E9sPHV4Fkgzw4lZSlmUY1xuT3GJMlPufcH0FX1ZtOnhY9LLvEr7FKSjp5/dcCPBlV7V8BdBd/zmn50lQRsbnQeWQpxGEleSxWqUeGXUiLr0t9I/8cEJ19Ki98N/fRaBpiCAOlBixxCkkkGjF816Xu/DGqv8LZ3oCnI0NOd1YauTOTyoElXEbg8gPQbTIAbL2X+ia4ze/wx4dOaVcobMJbaC9H/0q0dIiEA9nlOal6xsqn0uCiSCsMUidzjY27/rzRC2hZmSNo5X0wthraytHlj8viTlVSjRFra/a0yFvKNtHZBBA3E43rudRgc8xATRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDX0WdoOg1S79hxKcThj3t4JgCqCLCupkeYZqU0aGnM=;
 b=Ise6ctx2c18oxHgMCxEKGpzFyDu+uUh1NkruNl0Zo6aLvjc3hh3h3PAe7r/fAsRgZhDjkQCXcwzw9m1aMvhQLeFvMm+B/8IhNhjoZeBery+WCzoaY/2fnLezszYBmymOc5gzCWty+ITxfz7C1OPvueJjCCsOIFbvGhbaIxG/Y+Y=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB5736.namprd10.prod.outlook.com (2603:10b6:806:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 19:13:45 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 19:13:45 +0000
Date: Mon, 6 Jan 2025 14:13:43 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Improve dt_pid_create_usdt_probes() error handling
Message-ID: <Z3wrZ7dmS/vaVxF3@oracle.com>
References: <20241202042741.12328-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202042741.12328-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8f3262-b29a-48b5-067b-08dd2e863dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aypdL17rHPF7ohtJ8LXe00cUy7spo6mfmaD4nyturp1W0dYkD+nVRdRUrd1v?=
 =?us-ascii?Q?7oC4D9SVQIv9n2XQyBlWWYwTh0vpJ2y34DWhlAyEaLOZ/qaWplmARy7Rgb+7?=
 =?us-ascii?Q?WP0ZQd8mvkhMcSqT31JyrHwif3txH63pIIDCxBlwh3BdP+T1WFqvrAYb3BSR?=
 =?us-ascii?Q?5Vz7EzcBuFICnaLK0JHYgi7OQMM5WEKwB7bPBLHQCyJ6rT3SSBNDEIAoXTch?=
 =?us-ascii?Q?T99volH2Jian6hCJrPiDhB8+TuVhOHeLTCxIz0WKR310Tb6uW2uQ11S8EjXO?=
 =?us-ascii?Q?boBQyX42Oz1klEFMyzCT7e2+QY3M6e5APFhqzYOdTRXXn5aYP+hFyCGijzKr?=
 =?us-ascii?Q?DzfDDUt3a03KoE0yJijNrV8GZz4aK1QaXuN0O/eI0WqaE6PXJYARUIbVTlSS?=
 =?us-ascii?Q?/x96OfnRU8YyX/VsvXtQ32ku22cepAPq/Q8LnUKOxQWVCpulK1lhqJR5ub6j?=
 =?us-ascii?Q?RyVKVKrrjzzV+Zxs/PuA9oB1nVdTLLg6rjixFZiXwM6n6zVyH6lpBd4S97Nf?=
 =?us-ascii?Q?0FfEl9EfOMIC77Nx6IZvJhtxh67K+wzmidVr+KsTfz5fWfD9zp/qPzz3948b?=
 =?us-ascii?Q?qwODacWqDfAA5EJJB9dP2cevqLCrE1Db4NgBAk0/uhbKeaw8L33gFUdbfnmS?=
 =?us-ascii?Q?Ioil2bdTMbGNEq9GnckX3Mq/4h+xa7ZkB1/28bLbD3obw4AIi2x4jgHg2cgf?=
 =?us-ascii?Q?KZ3pOzcgm6Gi9NFLsMdHPyCHmre/XgXxfXOyHtW9JgoRSLgdJAiCDrFQVkq+?=
 =?us-ascii?Q?Uo/fgJOoQwO05yeRk35erAAtTQRfJALco3Id0CKlk9KSPVs3CNNG+CEHrDuo?=
 =?us-ascii?Q?OD/IIDktZE25KalgJgEB81rgile4DIdnQ0yyAhxVtXox1mvxtha+gskAQyDS?=
 =?us-ascii?Q?qA/o3w72OdpScPWiaVfuItQjwnUY7J/28/oiHDgGRnSgb3ELD7hkQqaXeB92?=
 =?us-ascii?Q?AaRIoXNFG2iawOI029qi39OTm02sA3iNTSKJUueYIXncE20uG6NWzsVWMwxl?=
 =?us-ascii?Q?HStjvuvhUgxR+wPFBxghOfQgFuDiK7v2qzlcvzU70Lw5ligmrlPTRkPdzMhN?=
 =?us-ascii?Q?tPXzQh5BTltMOxaoKk+r3jGAeDyC8ve9pspGnePcHAnmTzJd2NWidePE4YlT?=
 =?us-ascii?Q?+bA8cJcsFlTRm0LVB72hKCNLlMMrO3oggEFZyhTFRfxNXfT+kni5zB3cUBmh?=
 =?us-ascii?Q?2XvQo3sBjgWBqYWgjrYVRqFmn90edUostnL6TNwKpoVITfptZj/uxaIi27sQ?=
 =?us-ascii?Q?IoqFO2XmP0lCgCduN3JDbWtCLTXrtN334+PCU59TOTwtFaj8jNn8CbJiljua?=
 =?us-ascii?Q?ScLFVT3xoyt3ngQ4CD08eJ8srNxvuixovqbcjOM5ZNmSrOtf8Od9JszvMqs9?=
 =?us-ascii?Q?Qg3b/j6YwO2hoUL+Mkc+ydXwWB+U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mNFPJqWnsAxVapZapvOjWpJtaTCukWd5cST6w9joPj1opaZHnsAt0j3VVJx5?=
 =?us-ascii?Q?yWgCItVM3eYnOHzvqPUL9Q9eG54oIez/RlAveT5xPjCzQ+LzmDL1cOW4/XDv?=
 =?us-ascii?Q?rDC8mmDRcx/HUARkVn3vi5nP430itCax56MAVsdHGl4DR8OpsNh5pNGUz6b5?=
 =?us-ascii?Q?dsPJHj8OsFvt9+nhGUnsaUtzqB76IB6jRP/LHWIDM0OzajNyCLiDXBcaYczi?=
 =?us-ascii?Q?3mnUNqsOGL/u0f0hSdwsB5VkEQPHJQRevqUH4E6kko/yb9cFaakKeKQlaLWX?=
 =?us-ascii?Q?AgZAQ/s0lztBEjufqvnFzm9vN2BCIpqlZcNBzmVIS96UKpIsrgAkWzZgPb/2?=
 =?us-ascii?Q?DBXcAmmXb5m7qEQ0TBI0rs1xUoQXDxYd24ekK2JpUjaqerOlqjLD/VB8WOF2?=
 =?us-ascii?Q?UmKRslsDIX5Yirw2MgLcpCdelqRR3dKXey3D1oxot2N7rCy7mtAhNFMf9VbC?=
 =?us-ascii?Q?8BK/F+jy7/DnuT7+38ls2zMxqy6RNmtxp+n5XszGdOCbvo85GaMdTbQo5oYL?=
 =?us-ascii?Q?Hy6g3WzDBnU6AJ99Qrl7FuuBMY9KT+NTjywGHiRC8q1xnCLnPYQ7xnaLQ2Pn?=
 =?us-ascii?Q?FuykDLwNJwQP0muyHl3RyF/5/fNLnpZ8hUc3l4NAb9dzA8hu8b/zs91F9/hI?=
 =?us-ascii?Q?L+glPGUlTZTG6cEMw0rWHFdNtztpT0TdEcHXMNNFtGocXlgai1xLyZE5bYls?=
 =?us-ascii?Q?S4u8y5FFUCzhfgH0KL/NU7Um5utb6IKaiSWIELSatZP/Nx4EQZKZoft8KG60?=
 =?us-ascii?Q?jfE8s2Amu8sZ44kVAtGtgYnAmRSJZk3rkFjO+ADdcuImT1/SUrLzqzNZWz99?=
 =?us-ascii?Q?0LltpH1zcro9WvwOR5EJqsBXn+6wummc+uZZyKeqnh9JrKov6jRg58uwvryK?=
 =?us-ascii?Q?jm+2bSFL06Y+ERAWE1eEDThOzhZjyvd2is5sQdrSyGi7DLwBtQmnV/92lz5Y?=
 =?us-ascii?Q?SR75DjiLgd5Mv6e4+MRbtuyKUDxnlD/ML6xo9wzTM4VyyfwcD2B/CVQ9GRG/?=
 =?us-ascii?Q?BY5ZE4R/iKSgvDthD4alIUxt/C49xMEMvyOU2OgfeEIXtV7TeVfLaiwKib/J?=
 =?us-ascii?Q?9VpKyUtWSxxDTTKip3/UVXAWogWvxjr/pzm1iO6cmi/r8EMKqxZawpbjnPA8?=
 =?us-ascii?Q?n4KVaUxD/OEC6Ik0QYfTi6pKZbkTRxuMxg+7TmrEcaPWSThKpRNIozdvciB3?=
 =?us-ascii?Q?UY6ApvS5jcoAJwHIuyelgmJvlrHVnyy+m8lAX7eaJqEhIYSQUsxjDW/AYDfE?=
 =?us-ascii?Q?GWVBw3H4RQu6+lbauQ11rIlA1wTik0ucQxqzwTkzvDwPYyGtIOYR18PZHUgl?=
 =?us-ascii?Q?DPOd263oQsC8Jc3qcRCKlgb/vbo0DkEcPKjy2KIByOGkv/o9xAKAR8B3nw9J?=
 =?us-ascii?Q?hxbJbS4heqpMMKlbZ2LJaocT92v5MMZhxWupk/Te21e4PeS//TnPdYURznXp?=
 =?us-ascii?Q?aevtFBAeRkW5HiqRjOE/Uyt7ksJ9atfw+ar+c1ky4Z2G5XWfiwA91PlCyqSj?=
 =?us-ascii?Q?cGraNF4cyfw4kDDqDE7KYOF9EQAotxA79XJwS5K+9mq/iIZ4sJ34648Lua/Q?=
 =?us-ascii?Q?Sn3OGANTRMfEVvhguxVh0eOi85T7PxxFKMZGY0clnFPw8RGGz13YepbyRguX?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GkufEx9LwNIYXV6UiyeSU481r9vobi6U4yfD8WrwBWNam7r8d/AQ0JFvlL5XZfGmXMIhpgyrzWNRYAifszKo3v09Ih13Q+RH7/vCLvGS2uBShpaOmDmao5e4fTsRk+EBC1ke7A/LZJJe96nT0+/DoIy31mKN+EDZsn9g7EHQbtVDx6k6i8IGY0K/XHr8Or0NAQLuMVOdXL+vdPnx63vDvPDED6I1F7P0u3TwkD3Ny0Q58akVqYKizw490IwgFe/wJlkPifOIdL6MwcyM6hPPYjcKrLbItY/4N/cLFedoVXCmdFNlrlNKKwzCgeyUijjuVVkA1wi/UhXprpYxI/GErJIKYHnW7ksRBujomD3ldr7IjnIvRd+OorhiJ4zr2hh8yeiEhBeBeVjWK+8DRhkPh4HDPLa+yUXry+/caeKteE6Ukj8H7DD4vaaJLn1xj5OIfAh14wMOeMcPjlsTpTiNBbI/dgrmtgX7ECelH/n6R+uzuc1XfhSrrw+aMql1YXBgoaLCwO/mwHvDtBdrjtMbgFYodrQABDDF0yUZKE343ioH7hRU/388QPMfdqdtabuz3ODLMxz010cKWi87KV9sAXAvNeH5Zda47xXiyWCRs+4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8f3262-b29a-48b5-067b-08dd2e863dc1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 19:13:45.4681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+/tDqnJvwZP2eDGlbUZzSmeHGxKdvjrnGJgldoTWv7W++BHlv8dM5LeVQVSWIgBDeyeY8WdbESRJfQuTJvt9GoZPy6SBcDEXD7S95PbOog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5736
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501060168
X-Proofpoint-GUID: X8mBQBDK5pTi2SMqDYWPV1Rl4SipdUb-
X-Proofpoint-ORIG-GUID: X8mBQBDK5pTi2SMqDYWPV1Rl4SipdUb-

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... although I think that the problem is (in part) on the design side of
USDT handling, where we do a bit too much work at this point of probe
discovery, when we do not even know whether we will be using those probes.

But that is subject matter for a more extensive reworking of the code.

This patch seems sufficient to deal with the existing problem of DTrace
being affected by unruly processes.

On Sun, Dec 01, 2024 at 11:27:41PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> In one run of the test suite, roughly 90 consecutive tests failed.
> The exact circumstances are difficult to reconstruct, but basically
> they complained with messages like:
> 
>     dtrace: failed to compile script ...: failed to grab process 23132
> 
> The same pid was always indicated.  Then, the errors stopped.
> 
> Apparently, the problem was trying "dtrace -s foo.d" where the script
> has a BEGIN (or END) probe.  Then we get to
> 
>     cmd/dtrace.c compile_file
>     ->  libdtrace/dt_cc.c dt_program_compile
>     ->  libdtrace/dt_cc.c dt_compile
>     ->  libdtrace/dt_cc.c dt_compile_one_clause
>     ->  libdtrace/dt_cc.c dt_setcontext
>     ->  libdtrace/dt_pid.c dt_pid_create_usdt_probes
> 
> We look for processes that might have USDT probes.  Since the provider
> description is blank, we check every process in .../run/dtrace.  It
> turned out, that pid 23132 could not be locked.  This sent an error
> back up the call stack.
> 
> We do not know why process 23132 could not be locked, but having dtrace
> fail under these circumstances (using BEGIN or END probe) seems severe.
> 
> Change dt_pid_create_usdt_probes() error handling.  Even if there is a
> problem with some USDT processes, report success anyhow if there was a
> glob pid specification.  If, on the other hand, a pid was specifically
> requested, then a problem with that pid results in an error.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_pid.c | 35 +++++++++++++++++++++++++++++++++--
>  1 file changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index e0a26d5aa..fd94a0706 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -1252,7 +1252,8 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  				      DTRACE_PROC_SHORTLIVED) < 0) {
>  			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
>  			    "failed to grab process %d", (int)pid);
> -			return -1;
> +			err = 1;  // FIXME but do we want to set the error if we end up return 0?
> +			continue;
>  		}
>  		dpr = dt_proc_lookup(dtp, pid);
>  		assert(dpr != NULL);
> @@ -1272,7 +1273,37 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  	free(globpat);
>  	globfree(&globbuf);
>  
> -	return err ? -1 : 0;
> +	/* If no errors, report success. */
> +	if (err == 0)
> +		return 0;
> +
> +	/* If provider description was blank, report success. */
> +	if (pdp->prv[0] == '\0')
> +		return 0;
> +
> +	/* Look to see if the provider description had a pid glob. */
> +	for (i = strlen(pdp->prv) - 1; i >= 0; i--) {
> +		/*
> +		 * If we hit a '*' before a nondigit, we have a pid glob.
> +		 * So, even though err==0, we declare success.
> +		 */
> +		if (pdp->prv[i] == '*')
> +			return 0;
> +
> +		/*
> +		 * If we hit a nondigit before a '*', we do not have a pid glob.
> +		 * Since a pid was specified explicitly, err==1 means an error.
> +		 */
> +		if (!isdigit(pdp->prv[i]))
> +			return -1;
> +	}
> +
> +	/*
> +	 * If the provider description was exclusively digits,
> +	 * it was not a legitimate USDT provider description.
> +	 * So it makes perfect sense not to return any probes.
> +	 */
> +	return 0;
>  }
>  
>  int
> -- 
> 2.43.5
> 
