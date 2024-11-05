Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C71F21218D
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840397; cv=fail; b=g71pPCP8gRD3L6k8IKNmIbWOxCYxq6SNGXoOtRxt5XJR8JD66+2dCuDk5Nb2bVzS6o8lZ+mxj+GR6AjSHDGkzOuI/3ufDmIuzLI/tzGTbEBX2sUs4KIKm46RlIxYsifvsYY564y//+oDOm6qbG1pWMdwYb6NlF31fcVA7g17Zq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840397; c=relaxed/simple;
	bh=2CIdcoXRnYxyWGUbaFj9cNfbF2cMx0GKvo8hl1XEHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BIWBAiNAjyrFdF6Dzn15ziF/HZr8VDnWKolTAd5Tj0LGs1oLUJ9i9rqKVpSzZvO58KmmNRIuXqWwHGnZ+uqNRwYpNW6sbvwV708ykKwECsOzO+4AewAYnvNBEvbCAWwY9pTjkvtwlTbuBk/4Z3rKP5hvKppry5RmTY1b+ZUPI1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YJEdMnxy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wyPfbJuR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YJEdMnxy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wyPfbJuR"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KfXX6000978
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=; b=
	YJEdMnxymS0kv1rRah6B4X4yHX4pwWrjaCN2Fg34mzRqhZ9+Nrcy+RpcKSrlFs5q
	8C1jtDhfg/KADNS3xwdrP8rtplt1esGKNHKxWeMq4baSYDJeH8OLnVbbIDkXgc/B
	ruJYtU4BLUfx/mBCtZOR+oYQIixvaAMqZyU2IxRC6iS/7WT0xyEZRD46moi5kWWk
	Hog7sMJ9Ov4jWmNB4EL8hPU16saGdM3kXv7tqMLO0MlQGzc0QnwTq0ab2oIHXvuu
	Okf5fWzYjgKSALBfRdOGD5RCTkMAnmLzqnM3bhRoFD7Fr0ENv0C25aIzg59k82/K
	JHGBn2lABLo4Zf/Ix5GXQQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nagc6e46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5J2jtl036113
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahdyhn8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7wrMxijzMJvmyqg9dyWBUD/nLHsPiO2O+ECmsAE5OFZfm9iBMMEPhrOam8DQX7i5j6wQOA6dk7qMIj4hj4iqdnNl8OeUTVvj6GQFrtMa8slRwf+WUld39egvCGwOZOpvZ4hK401RWChctp2l221WHm+tiqJtUnRYFT5Ory2nPJ3IYpHmX15qNoCDeNemzu9rVb1/rM2/D2Q4memLD+xr1fCI1CsDHPNNnA2vueCDyExEnXf9zlhVJLJUeNSUBb/0yLzcQgHV2Uj7DLvWkUgMQdgKAnvDQgGDvXEWEZ0b9fvnqPkNDpO1E9GbADP9s+/Y+wav5JWxSe1VXndHG6C5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=I8ZmefVzVvevqvwnyXKzN40XfmxjWMIq+LMgTMmX9l2U/1TLhwYaQoqdGn2ejsaD5w+3nBjuQz+wKU/xnpaBD4xol+TdAeiqW21LtY2ToTC8FlgCNTv3UaChoXL4b9+W1RQRAIoTlgIsrIZicrTuxzFLMtNZWHHf+bgCt/P0uWACEowiA24HdeuvG8saPgj3xdBXViL8+keuxPJiKrbfEuTtPqnD0P/7AsH/LbsoDfLzfuOXg+ChRWPJsNoqnw3fuqwDMtNaNhIyZ6bygTiHQn7ZwzRovX+zetgwxwJTfoECuRunzgLosWIy7HRWZMf6SVDWAeZI88CV3Jczmsb1Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=wyPfbJuRHgOmhsP1263XZqoTxs/nABMjGal3fHhaP2BP3xeq+8G9oXeRPbifmYGiFwEcqWG5nHAqqW/sApI16Jw6axm+wEjXXWznRaCir6xqlVdsayuAmtk1iM2YLSLw5UprjlTVY/kNMUuI/WMFCX8OEI+gpolKYNyyzpE8emo=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 20:59:51 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 20:59:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v6 2/6] dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
Date: Tue,  5 Nov 2024 20:59:38 +0000
Message-ID: <20241105205942.192409-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105205942.192409-1-nick.alcock@oracle.com>
References: <20241105205942.192409-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0068.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::22) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dbc9abc-ec43-47a4-23fc-08dcfddcca8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?db9mIM4ib8nP9tOiD6JUM5Sffpi1xI8ppYFY3xJ6I/Q1qmDzjZhB87iNZtCX?=
 =?us-ascii?Q?zFuj5UsPD3NBIdE+w8LRvQXSUHIv/mKwPSFvWyx1Z1pgtFKQOHlqPI3HQWw4?=
 =?us-ascii?Q?rdVxDXb79YmlwICSb1sDhAa+YtWeroC57CUhF4Q/97XhjxLRjXif8NUwfE4D?=
 =?us-ascii?Q?ps0aCNLfDKJq7mGH4WTNgxmVJaWE76ndd2OwC6u9+kbhyk2zahD14a3z1fbm?=
 =?us-ascii?Q?5eUWJPthbumoLi7AZ/onPljeWuk98z9E374K/H1TIi4DrXDFIq7jASz/XyP9?=
 =?us-ascii?Q?mktDkerSSZgL1mt0JYLRiN9PFJQgZAizr7z8nVzgalN48yXjDwyrdUw9vSPl?=
 =?us-ascii?Q?v2MaKdwf7EtsBgZNuI8sU0sYXaEmR3peXYyMDftTXNuxRJiigmRlq6JVS/jo?=
 =?us-ascii?Q?JzPRoiUDSYXWyWSO6IXfEipWJIt0HFGwjPmDOX+jQi66bJvlGjQs8JYL14DJ?=
 =?us-ascii?Q?8D80pMZyFvPcKF6KkcRUFo/oteyJW5zPV8pmRQ9FQz+/q/l0aeuo48LTOme7?=
 =?us-ascii?Q?MvzNusy7HaKW/WrrzEBqSKceFogxfCrpx4JqIokCq1+p58losqzgt3uMW01A?=
 =?us-ascii?Q?NkiIKiSyqslFUvzroickXt5kQ6mhkxL1swyVZj0ZZ64ul+NjGMG9uVCqtCld?=
 =?us-ascii?Q?PsaC52LU9VR9TuPX7AaGur9CTw7q3W00iVRsqNtECpMq+apTMyDW/XACUscK?=
 =?us-ascii?Q?Wli2pC/h3UKpysBXwq7MbGpaM/2sY05gzXdPKQdgoIyXI5v1BxLZtPDC+E8Y?=
 =?us-ascii?Q?ELH+rpbY6fyMWG2LRsb/1TDV9Y8xNE4rswxImhq3b9IeqpVfbInKOxpI9gVn?=
 =?us-ascii?Q?h9mAhTHyPlu6zre7+vhB8xUzj1t/3l6Roza6/zmei6ZnSVQLkByrNBiGOrfI?=
 =?us-ascii?Q?yOvZDaYH4kVKxb6NZaGFGRpgVz5lP2u1eYeyU2hjuT8oGTnVUyRyngIbFS5M?=
 =?us-ascii?Q?cxjoiWNGXQ2jgbRZUys8hg0SKvjOn8YJrwAt9xQocXnbyQZfWLBWGWxndOr/?=
 =?us-ascii?Q?iKtClKo5vHxKBHdycJJSWrk42gcw8+v12FpK+Wdvpvzh7JOrC0lpA8qhSKPA?=
 =?us-ascii?Q?X1nsBbnJs9cf8Bj+iKZqz8yd3lGhR2T0qzXa3lxQCJOMQ/BbFDuLeD7kWNlg?=
 =?us-ascii?Q?niUoFUKML4dzm+SYbjcpoyuLBOzgbI89kVHlegwej3JvSUfi77iPVn6Bn2+N?=
 =?us-ascii?Q?ic+5MlVv8h1/1jux6WrQkEiYV4cl24FybiC+1Iuk8Y89o9r3aBTRZXoB9J+N?=
 =?us-ascii?Q?CqNWngB+W9JHwDAWvAW7XuyilL3Ir2Wqe+ouopui/HbNOd9rsGO0bQPjuHYy?=
 =?us-ascii?Q?PIM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XWVOS8zcaRck8+b1e2/jHr+5BxDGY/LV4OL/GTct8aH6daHmUjc0WdToW4qQ?=
 =?us-ascii?Q?1UIpOqxERAPf+leAvfUFE54TCNuoDKEBiNhIMH/AY5g4gONKjNgCpWH05oSO?=
 =?us-ascii?Q?JGMBSDoibKpLkIbrJm7MpwZRKAKsL3ZJ10glp2msBzhcDOKW6uqXKoBC+sUu?=
 =?us-ascii?Q?lQJHjZcGcWWaQ5vG2JihQRSakw8GR4LG7pzV4FTJIQoGuNIMa4gT1wITNyVE?=
 =?us-ascii?Q?mbfwpua0C7ZaVyGyIwevbhOjDAxmYLVCbTQbv/Beh1BvoUN/eeg0X0mO//Io?=
 =?us-ascii?Q?nfY9H9GE0wW2FkrxiRK87Gj1BoLtNPiMFoZuO2HlpNuPqiNf/lljwMq8De+3?=
 =?us-ascii?Q?2t5TwmCHJasTQX5VJYWj7gCJZ2LMw3aZgPsRWd23cu1r6SbAHDiHy46hxNEo?=
 =?us-ascii?Q?Bjj4uWAc4bZymIaSjuaK3L1wi/QonlXyoGAXM70Smw1oNpHmIvQkmcBlbv7d?=
 =?us-ascii?Q?cvqeRyX5fNQQlaBT/oZXM8LuvuTzenTziZ+L/TLrivkf++8Jd1+N//aQ5Sg5?=
 =?us-ascii?Q?uwt7rYOlUzjo3072PPOkdD5E2N0tvjyoPnb8Vok/slGx0M266I/nelZOu/+D?=
 =?us-ascii?Q?+96Sn6zbUVzH0CQiGYEIlcu6D2+eQzjSrie5/3I+S0DJXBdCKY6rnrU/kjbM?=
 =?us-ascii?Q?iGZSjYvMIoe5u3AaF+XjtbwYzlMII/RYO+GixjHWl5e+KKXL9pf/DpoRv6Og?=
 =?us-ascii?Q?4BampGvM6nYurnLgOPaFkHQODL8lPtcNg4OTM5Jg5N2R8xawJNJXfKBOt8Vo?=
 =?us-ascii?Q?9W5Axq6bAgIplUPymYRsA99T+pk8IiiNZxt6P6Uoa2DLlLe7CxC9GssOKYpg?=
 =?us-ascii?Q?nQuJAsC610tXkx17GedYFcLB4XowGuPZmhNYp6Lk98kC/qmFGb6coEQRUyH8?=
 =?us-ascii?Q?kvGXmv3/f4kazNhJ+SPwj9WUqFFuiAzfFaYHh7IyBn98dwO1gGNbr8SVxAwY?=
 =?us-ascii?Q?9/KsjRROhxClh2565RJ61WVxKIZS0ZRQqbVZGZeLeQlX49s5brkxsTI813e9?=
 =?us-ascii?Q?w4xUl3ZhnNh02r2IwY1/alkM8hns5PmHNnc/nEYOPmQaSpPY38CWV22Sjsck?=
 =?us-ascii?Q?8GgDcxSQ2evm6IO8/isNyC/LbyHGTivwD7FZmrnb9chjHCiiOhP/BhSlHwLh?=
 =?us-ascii?Q?ozANtOL4mK9j81sHwJCeTxCxNhg6uL6gFomC0ErH72KDnc+IwaMvHKk94DAf?=
 =?us-ascii?Q?dD0+Ls4LLOZ6sHI6GBVuBuxsJHNtJT56NAhqIkUpAYmZOlXyGWYiUcQhPlDn?=
 =?us-ascii?Q?mbmE9NX7gO33jYDUi3jmKL823R1ruSnaTBE1mo1Et9rhckmTYOowyU8lQF8u?=
 =?us-ascii?Q?8jeJy1EW85eghkESxXaieDQsfHInBH3t1YDewxliATp8uuX0odRLmOqn40ZC?=
 =?us-ascii?Q?01iK0BH+FyPUOd94ci9qBy/thBWSnjc4/zSzPR7bV6kiSWzf6Yk5QUivms1Q?=
 =?us-ascii?Q?r6ff6Qq0HB8Q5hv/kLkGX0zV3NSwjBPaMelIiPGfd6cXZ4HGX5EMTFKc6F9g?=
 =?us-ascii?Q?dFKd7GMy/BlMbhrnjdz+IWFxAxLt419AxoN1qLjZQ6KPGWSNEw45/rNIGwrW?=
 =?us-ascii?Q?bpwT9lZhIP6WO3DyeRCqZi4m1G/pBG96Cl4bi0hv59bHbLMjX8ozMQ70eWW3?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uFBdFuywRh+KbUsMOV/2cH4WS0jS5duPKovwqa43xFvrpcJox3bDMWG5rII8nc4wpfuv5WACMG65ingfWErhFmgxkVDa77AbnK6gk9jiGG2RQokk1wCuBa4mbT3Efk6Y/aZBDPILfkC9MckHLNKlW0DUaiUdWH1sFc2hncflh0o7Ad3AygWTqDVJBC2pKdZdmVCBs/qnjJkUDT+fujJRt5VeVDOZKhwzJB9bDjV38Ksh9kL5Zkrd0uu261OD1chGTblw8jRMqc2TXBh0BoyoKaJRa92mjTbROs43lE/czvP7klBGV7bBlFXytPY9kgleS/Z0GmXbL7nkONI+5n87QnbeDzNtLbe5hPwISyZq1cC5Lx/TRTJv2AbJ3wgArdKENYU8oKXfqxUINl04Wjg+KfrsgLXzsIkexiWogbjEQVtKSenk54W/Xu5hs4JVUinh3GUuYkGxYD/rZ/p2oW8vksXipTp2pXf6Yut/ioe22gMtL8S9jy6SlgOIgIihh4TVKgRRUvW8c7a9gU0+prH6PK6CAE4AkUsZMoT9AELFSXHBChlwnoXaJ/t2WH+NDltA8nzaEuv7EBzDdwKq/6og11vuFsCEEoxU7Wiuqg0UlpU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbc9abc-ec43-47a4-23fc-08dcfddcca8e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:59:51.3529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk8qXxLJWbPhlqHefa7cOfJEbBns1m+Qeio4eBoy9CN8SX5a0oOckSfhni+4nxrnTADyGQzRq6pPhtC00gUOIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 spamscore=0 mlxlogscore=879 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411050162
X-Proofpoint-ORIG-GUID: KOdIMfP4CARmj9zoUFbxk4SRJDCe_y9P
X-Proofpoint-GUID: KOdIMfP4CARmj9zoUFbxk4SRJDCe_y9P

We already validate that they don't exist in dof_parser.c, so no such probes
can ever get here.  Handling this impossible, untestable case has just got
harder, because we'd have to skip DIT_ARGS_{NATIVE,XLAT,MAP} records too.
Just stop considering it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 8bf465678217..82fdd3174759 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -586,12 +586,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (err != 0)
 				goto err_provider;
 
-			/*
-			 * Skip probes with zero tracepoints entirely.
-			 */
-			if (accump->parsed->probe.ntp == 0)
-				break;
-
 			mod = accump->parsed->probe.name;
 			assert(accump->parsed->size > (mod - (char *) accump->parsed));
 			fun = mod + strlen(mod) + 1;
-- 
2.46.0.278.g36e3a12567

