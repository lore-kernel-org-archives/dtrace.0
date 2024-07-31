Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A464AEF2
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453677; cv=fail; b=kU6J2DE9d/ZuZRJYF+Of9b3h0h+YR5wEhld8/+uhvt92yDve2IUIh0tijYFycCWp7mo5L4rXLyrLlZIInUb3qIhwpw/nq/jt8hnIAUkWIs9VvcXg70TW/vJoauP/9ESPhPj+wXYZpkTF8mAnBSYU4GzSzixLTRaqPoFYiXCEyb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453677; c=relaxed/simple;
	bh=bn7hpGlN57X/UFmBBwrL8+HCrRPBOZc3U8bI/XmxyyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UjHy8GZkh/Oh57LydPyptFKtuOBOpZ1Xd/KKWua+XyiHrwO3eCbRdRmH792MeEEfg1OkW0jhW0IrZrVnMMOJLKQZlWxDBOwLnsHNSX2L3x2L8l0SwHeLeGbXexhFpT3gRSV79T8wtUQQzV0Jo9WS8/BtarNwLQ9NY76EjvkVBIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=edvrBNbh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WzWnsfGH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="edvrBNbh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WzWnsfGH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VHtSls007205
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=AyH/D3ezH/vbyC4
	sBmy9P1ziNuJdgg7N0pR7c1d0Fz8=; b=edvrBNbh3NmCAoCBqTreNHhz+NUXWp9
	Fley85KE8EfZykij8m8501AYAd1l6HTH+mEKjV7H3SmpmfvJH3/RqehLOFojA9IW
	HzHikPZKoP8zzIZZe5AvW2w0z/cdipk+TEHbY3zu7X/gXnmF8z8Q0yX7PB1b3Wgo
	bRtoXClLUYQ0c3X0YDtjV0Bk+uFWWkNtTpPyAKwEhzJlbT2LvDP8q+zgi41vQaDQ
	OapIAZ2Q0w5TrnMdTUf2Br4gB/VkP41FKcwFwBYYvbMA14uALhP8vNqL9RSS6fr8
	LtfqK0enJtQhhil2RyEeq5bfqBvPeL4OoFMD2RZem8FEFeByaQ1pN5A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrxc09sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:21:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46VI8DAg029603
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:21:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmps1t96-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 31 Jul 2024 19:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie1DujUq3ic1FY+Ev7uH7EYLWB6JpLxy8u3UgAzdC0vhB0gtJNveO/cdZq72AbceKQEL1dbzF/wtsxp7P9gURuvuei/0NM+7X7Hq1gx8CYLl6/slCKrLjOCWDLmXkLAehS3yRt08ZMzkLym2mquODU2SkcYWekb8wqcrw8e+Q+CbZjXfcT8H6cSZexl1zHzoJZDeuTEoBRTtbgtmM5almMi0NMfMrK7o5Mt/l97CMIbiyx846S9Nh3b2T6ddnRhVSsOEfPzkXHTRa11H61b8928pffWeW2xz022yuNvrUPsW+B4HzgO2hwSQsUfcJLW0NOQvqwuhu4jLPNFTk9L8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyH/D3ezH/vbyC4sBmy9P1ziNuJdgg7N0pR7c1d0Fz8=;
 b=SIAA+idqaaPSwyx8kPPARIlR4ulPScGVXEu66jb1KN1IkBarweVvajfTkz9tPDZ3+z0+FYnXcDDjWCazT/huLqTX8y+2jBSBEVN28WCrAzsrYZZOQsScH4KiHO8t1CbcodrFpbjppYz3KA8HRTeCsrmHShg+7v2CTZIbQ4PXozAFd0QtGXQ/rb+aAgWFovSQtqtn3w2nImRz6xb4rVjDf2xNgAMcRfDQpxHLxXIK5xqwhniSOeNypIMBFA63wOxu5DnSoxshYCKuuCpEemvmbMiHw5XMZrqOj3PoiOaZRIj3eseTsnqX0Rfyjee6jqJy2g5DbdnE2jJRwpD0k738ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyH/D3ezH/vbyC4sBmy9P1ziNuJdgg7N0pR7c1d0Fz8=;
 b=WzWnsfGHh2Rh1N5nuTpHcF3omrPFGDfjkHFOlnfHSJQeiIlBPVEcNgkfzlYLOxocvw2G5N/0OpJ0/QcpAwjrs55g0ixVyYdQe0fsBkrCaSqXCPvKjMBcNA0pmucM5G0d873qVwmrz3JRA78Dl1pp91hmkK5muszXCpaKFbtae6k=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM4PR10MB7526.namprd10.prod.outlook.com (2603:10b6:8:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 19:21:09 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 19:21:09 +0000
Date: Wed, 31 Jul 2024 15:21:06 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 0/9] relocatable DTrace
Message-ID: <ZqqOogLNszSvuMmW@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
X-ClientProxiedBy: MN2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:208:e8::16) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM4PR10MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 4522ec97-41e2-43d1-ed67-08dcb195eece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vN90OZjYdCU41axH0XSZVgk8o64yyb++wQCYbH6sJ1LQ+XFKWxU5beR+Ul/1?=
 =?us-ascii?Q?kmfishQ96MBMtKRiB4Rq7ak0ElU0rMknBr4o1fuo/cYghVuP/XYp4xZoPuqG?=
 =?us-ascii?Q?yrYyoWqAazs31i9l8MeHP2shPe/0ydMRiK3gUZqEawn+M0334K9vytbNuoSh?=
 =?us-ascii?Q?xnZ7xTd92FqyFKeMCtCHT0LrN3mX8DJgl9IMPdCf4++a4rk8K2FUoInJUlL5?=
 =?us-ascii?Q?Mu8+dnpxy1DLrxVPVOkBmjEiW80UJznmShNntvz8VTQB+y0DGXdUscLkv2Bf?=
 =?us-ascii?Q?KNowrvQ6f+joeT1SHDxHrgie7zDSAxeBIEiWteTUv1OHtRYZCMkKbXcnBIn+?=
 =?us-ascii?Q?LnpN2/8cfg604L9mDuZzgR31Kn7zRchjC+kONk0qPJ5ro1/r5pYPMVVlvGHB?=
 =?us-ascii?Q?Nck8q4mE1BVejly5HShJv6MospEP0NfIdwJqUpImPOiw4l2CofCs83F/pAFY?=
 =?us-ascii?Q?brYetln6kvsaLq0mDA//5OVQeUNW+fNdKSUrafGPGIHiw2WTDbtSoAahwuq2?=
 =?us-ascii?Q?fSZvgg+HBLBZYhEjfcoEHwflqttUkuV8XOovqyPqqNn8oww7kiX0NTptZT1o?=
 =?us-ascii?Q?TQLW6Ij2NfMsqbCPHBJVbTny8cTlK61pZTSy3pcE1XxEDKsbPf4QVbnkEsw9?=
 =?us-ascii?Q?I2cSpT2NXiTrxDCHquhkZq/9D+Su2EILpqnTgJ4yoMS73qYVYekQhrVMtE4q?=
 =?us-ascii?Q?lriWYIx+7YFEudPbUAAWpRw8UddX8Rbb59MqVsM0pJqVb/LtyCBgwbwCABDd?=
 =?us-ascii?Q?vxyxrBgcOlVa0ewS4SpcATg17GZgApbDThN5FJoJ2JCar2/spAlBdCk7BY75?=
 =?us-ascii?Q?jwo6tjGDkZ/eMAYaRDsMomMB8i2CVWd+f2/Dt1SsBY1ZuhWm+0BAxn1Mm0Ju?=
 =?us-ascii?Q?+KmYBq7EHMSUZhzSVgi5qlqwckJXMqGQYOGhIIq9lGNnLikOOPn8KlyqJ+W1?=
 =?us-ascii?Q?VIqjc9QigWxja2mFcwrgQ6lRlrw8qdLASG+Eh/ARIG26rc9H9PHscqGyBla4?=
 =?us-ascii?Q?zSC1DVdXaASW4JJeYWe2npAWYy56EczR6bHSFs0+LSrqASj6jeTEhOjQ1Wd8?=
 =?us-ascii?Q?xUWC/YXhy2dGNHqKra95nMTt/vKhgkroHxOcEGM1uX1DiM1xCrjeL7aX5PGd?=
 =?us-ascii?Q?43HBOJHA1OY+LoazCHuESTt9s1W6jbexRTLLvbrUdrfvuqbIFfkVcfRNrhxB?=
 =?us-ascii?Q?tY8Pr+D2UCJVpWTqCrEjvHczAZ3ZJeHGY204eOCts/Xw/2Hfp1RCDKDQINpx?=
 =?us-ascii?Q?wZ3TXcCS+O/b08BlTOvuajBvh6QzhcloT6O2hKE/mgbMTqLw4Xg1TsrSPUuN?=
 =?us-ascii?Q?utSOWPThpiipzGukIK+PjQN4X+R4b8nmTyTz/eVi4Dclqr4yxzj8kqeH+6EF?=
 =?us-ascii?Q?ZPVko4Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?npielafYxfblMP8nF4h7g6o6md3fM8BYJzA7sMkXO8HF5JEf1aESonwtRBwp?=
 =?us-ascii?Q?aaNwwErR7FOOqFq4votU8bEmhDNojvKv1YRr/AI6V+JnV9KYjoQtlYvq9ByV?=
 =?us-ascii?Q?gheQcxxhioVI/aodnj6Pr2k6FT+RiWILITEe7a1+ly7raunXBOU0oNn4PV2K?=
 =?us-ascii?Q?iufItbAueJ71oqBPoZRP1qv2bF5OAMRRWTURZ/2UL1/YQvm/nx2cdRkaSNAn?=
 =?us-ascii?Q?DvZcmbq6CEHAOP0wx3Mtzu7sJ4LRRCkstWd1sYydEJHIW77s+bqKhrDXPioU?=
 =?us-ascii?Q?2XjCxRqtOtpsa7AlIQiSM0U9m+2BOmoaS+PpDe5DO6xDn0pBvtvMO3nyZZ0m?=
 =?us-ascii?Q?S3sjNNhSVxrGge1B84YD5p5TCdYfZTQd5d0Y1VgJLNtjKGTCeKos8QMkFZpH?=
 =?us-ascii?Q?jNidbyUjyvl/nS1bZ0jviiW+DPwFhfoIE1iqBIN2BLhTVD0j7HbtYQtwfq3Z?=
 =?us-ascii?Q?cd0Yy2tIbdL5VzXYuKHCaqz6EZpPUY5ZnqYua10k/eCCMRAfqVYSR/k4ktrg?=
 =?us-ascii?Q?m9TQrnENEzYyuYSpYmkSLJY5GjjMxQWtemT95ubvQW2x7pIVP2Jnv0tgchPv?=
 =?us-ascii?Q?4IwjBbOgTOwdqvHHVUkDSlgkwgwRNsTaq/IL8CBRVST16sUSemGhtHOiOopa?=
 =?us-ascii?Q?Ndu/MEWFQYkFaJuVQovWb7LN3PUYzpx40+8HA7+3DHjuCsQrQ/JJYw4lIzko?=
 =?us-ascii?Q?DQz0JhMGslB3jcees7jOX8ZmvXZj94UGzw1WN6bv+WP1vP9/LB7HZVdKAgxh?=
 =?us-ascii?Q?kBaWwUHHNmwDRAloj3ZWGcEn7CMCsLQ0JGIKfqb/bwnwgI6t1tEKEImHbqMA?=
 =?us-ascii?Q?dSN9CuLWp94IW/tDKmH4jVLAMrmxrZcntO6CLrpnrGVHOJgQSlyqux/Yt37X?=
 =?us-ascii?Q?WqR9n+4aqgn+UZsz+z/1p11nLaF+f5vvrhJh9XsbkpfSxwcTYkYakSraTwQh?=
 =?us-ascii?Q?Ge1g6Rl7lbjvCTVqxgmzq/rkcWQ9d0UZmOheh2u06TUMdGYhUu12CDucZ6Gk?=
 =?us-ascii?Q?ZsiGmOL8G6S6pF0SKkZudEiTiOIQ0t6lj+5zbeiiiY7errDs1zRPCXzEMe2G?=
 =?us-ascii?Q?9rj2zzj9bmeDTWJPQ7xCsT71kqTwZIrHhk/XCZr6M/FD045hfkX/u6Ay9+gf?=
 =?us-ascii?Q?SIGZFYd4m0JDlpAYfFwERPl0CO3YFjdQSlj2VXfZIM8ULI5SANFOQeexcmev?=
 =?us-ascii?Q?ZL5gcHGaJWOeHuB3KLigXZPw/ECJFSEC/NQqqKSln7ENPcMqKdvHyKPp/ucs?=
 =?us-ascii?Q?CqmoOpQmDBsWTAUxKv/Cm2yP/5d9krG0aTGhukgB5Lj9c1mjSwbTXTYkK9mP?=
 =?us-ascii?Q?MeC6QeZxyLAoKuG5IUK0+L3QkVOtnfnS+fGcDFAEQW6ANY1F+DXe81upOn08?=
 =?us-ascii?Q?/5fr083YRq1L5fWmjcczk3B7lXs+0pV2lgJnUM9dyBlDvLM28cf8hXllyuSq?=
 =?us-ascii?Q?tA94lTfmX0afHhXfA22nCLNkFyEK7PEhDXOB3cTbyraTyDZ/k0C8PDJ6B6/j?=
 =?us-ascii?Q?OxUkNGfkELWeKGd70fnQAwdKUGXhmoKBRfOB3ddcH5c8DqPwLkKbtMiGFWJy?=
 =?us-ascii?Q?+HSrmcklb5sO3npRzulQ8P5jftP10RvPNK06vQApYrrwLPZMfIK2g1LsKrdB?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PznlRuX3IWe+/4G6OCFr+txt9c2AX+H2yMrSdwLauwaFOrbdWlDpp1f+8n4ESOaeqkbnQue4pn6XHyVvg7VDfM/iVwcDMhLzXf5TRZo+3BeRZMtVeN7bdwheyDJbq5qPji0Gm3brKZoGbvDXXQWhiCli8QYzBlxcSs/sHVIBC5SK3/cvfNmoZOaaOAJiyJ/ZcnoYTcykRSI/z+uTgR9tgehGoYJwOXgybpoAVGsG8c6AsYIrxPlylJonImDe3T4gYnrKdbM3belqA1O4l9Q0ynox6tTUTDu1iORdWQLbLvChVZpjii8jZH3vkhCOFJZkLJptzruXJ0LhXgVKImc0Z1uddSLLaKVxRUtJLGF0IJ4fPhh8q3dsv7bkARMlUaMRl93uwRujHqGCE1RamZcnS3EBJEDW6lNZ7rM5zOibwbfoSDdCDMagHQQ52lNRDcxye1+CzRW1dLAkDHXzJd2/GqR1lAA/BJU/K09rgUczUYYR1ZsA0yD0rwPUyTPQTYiVRpEaLk+58n1fqqjzhXeEqpBCXP80uRtv83jPKbvKHphE70MwEtRlaGzPx4XnOEA37Y6hDkM3uVuLdaiyPqzlnvFTypwa0VmC04JkIm51I/k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4522ec97-41e2-43d1-ed67-08dcb195eece
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 19:21:09.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfMWEeGhLIn3dGlABrSOZxGMT/VMoC3BhuRstUw+NEgdah8fvoP2a3CqQV32eIRIYWLijW7qyLLnRiMZkTNx0aIr+SH7ua1u/JYQ7+ulMgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7526
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407310135
X-Proofpoint-GUID: wXbbS8AAsp7PDOj8IwHpyRBTvSImyMdi
X-Proofpoint-ORIG-GUID: wXbbS8AAsp7PDOj8IwHpyRBTvSImyMdi

General comments because my review covers the entire series...

Why are there two pkg_config files being introduced when it seems like a
single dtrace.pc one would be sufficient.  The dtrace utility is used both
for tracing and for the building of libraries and executables with USDT
probes,  I see no reason why a single dtrace.pc couldn't cover both.

On that note, why can't pkg-config then also be used as a means to get the
location of the dtrace executable?  Why go through the trouble of performing
text substitution on runtest.sh to insert the location of dtrace when you
already use pkg-config in it to get the appropriate include directory for
the installed case.

I think this series needs to be reworked to be consistent.  If we are going
to use pkg-config, then let's use it to its fullest extent rather than using
it for some stuff but then still hardcoding other things.  That makes no sense
to me.

On Fri, May 31, 2024 at 07:59:19PM +0100, Nick Alcock via DTrace-devel wrote:
> This relatively simple patch series makes DTrace work with non-default
> (s)bindir, libdir, includedir (changing the other installation-directory
> variables largely worked already).
> 
> We add a pkg-config file named dtrace.pc for the consumer headers
> <dtrace.h> and <sys/dtrace.h> and for libdtrace.so: I expect there are
> no users of these outside DTrace proper at all right now, but providing
> this means we can point future users at a suitable pkg-config file so
> they can automatically adapt to dtraces installed wherever you please.
> 
> There is one wrinkle, which is that the udev and (especially) systemd
> service files for dtprobed have to be installed somewhere where udev and
> systemd can see them.  We emit a warning if they don't end up in either
> of the two fixed locations where systemd looks for such things, unless
> the user has explicitly passed in --with-systemd-unit-dir=, in which
> case we presume that the user is doing that because they know that their
> systemd is looking somewhere else too and is pointing the DTrace build
> system at it.
> 
> (We add an extra makefile target to allow users to forcibly install the
> systemd service file even if we have not installed it by default because
> we think that it won't be used. Users/distributors installing DTrace in
> --prefix=/usr or --prefix=/usr/local will never need to worry about any
> of this: in these cases we install the service file as before because we
> know that systemd will find it).
> 
> (The first of these patches has already been submitted on its own,
> but this series relies on it so I thought it might be clearest to
> resubmit it as part of this series too.)
> 
> (Multiple test runs with non-default values of prefix, sbindir, libdir,
> includedir, and systemd-unit-dir passed OK with no failures I can
> attribute to relocating things.)
> 
> Nick Alcock (9):
>   spec: install sdt*.h in /usr/lib64/dtrace/include/sys
>   build: initial pkg-config support
>   build: track configured vars
>   build: --bindir is supposed to be equivalent to --sbindir
>   build: the TESTDIR is relative to the LIBDIR by default
>   build: add a pkg-config file for dtrace consumers: use it
>   tests: delete the kernel build dir stuff
>   build: make dtrace and dtprobed relocatable
>   test: work when relocated
> 
>  Build                                         |  1 +
>  GNUmakefile                                   |  6 ++--
>  Maketargets                                   |  3 ++
>  cmd/Build                                     |  4 +--
>  configure                                     | 11 +++---
>  dtprobed/Build                                | 36 ++++++++++++++-----
>  .../{dtprobed.service => dtprobed.service.in} |  2 +-
>  dtrace.spec                                   | 23 +++++-------
>  runtest.conf.example                          | 10 ------
>  runtest.sh                                    | 33 +++--------------
>  test/unittest/usdt/tst.manyprocs.sh           |  2 +-
>  test/unittest/usdt/tst.multitrace.sh          |  2 +-
>  uts/Build                                     | 16 ++++++++-
>  uts/dtrace.pc.in                              |  8 +++++
>  uts/dtrace_sdt.pc.in                          |  6 ++++
>  15 files changed, 87 insertions(+), 76 deletions(-)
>  rename dtprobed/{dtprobed.service => dtprobed.service.in} (95%)
>  delete mode 100644 runtest.conf.example
>  create mode 100644 uts/dtrace.pc.in
>  create mode 100644 uts/dtrace_sdt.pc.in
> 
> 
> base-commit: 454c6d47bf408415f7eb52ea701779f041aa6957
> -- 
> 2.45.1.275.g567cb0950c
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
