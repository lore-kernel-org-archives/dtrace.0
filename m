Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BAB4C81
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 00:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740096521; cv=fail; b=gfqHt8fzVMB6Bh5STr3v+fEFXYZ849+ZNg4qQEatsy1f1lFFleoUKHPO5MYDSdJgAw2a5aXvWK6XYrz4zZA9+BqKAVi5hnrpRmj4xGOOeEtqGFJKqEydTdwBuEYELBEnPWf061OnPv5jNdqh5uxcKjPUyTFrpCvWFQRmncRYnT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740096521; c=relaxed/simple;
	bh=QjSrT0CvQAVlP3kaWpIC6yL8nndRBhkuRPUXs4FLMXM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OjRoUIspJ1NOLHf1cEUtlj+6jLnx/8+O5nbzbOEU92sCHC5YP8K/sX1Hgm1iEqYfSg9WB22qtlPiQbi+ZISSCpBvTVO6QXkOU9go3SkVrz8PZE7UW3ZqxhTNKgl57BIePs9HH4rm1bDNYFpwX/d+2sW3zgFFmgwS0ZGr8akeK8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eRTsH1TH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IQAfCtrz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eRTsH1TH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IQAfCtrz"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KLrZAV016236
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 00:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=blVEagxkkF9GkXoezvr/z54VUEWDRfR4nFZd4CiR4L0=; b=
	eRTsH1TH7Y3xXg6L9dV+tNJYbDecH8mV9bYBWaw2EMcUzghIjYH+cqofv99Z6QYy
	LviIf/k4gUySBBnfYwJSZVCSwTduJp13HQkl1/cCdqEcnoJc1xCNzwiYF1F4YQbD
	j12/QJEiruRtVfkW31tGdi2ko6B253PTJW9CeXbq5IhC5pKc3DbaSfMgpSxDUsR/
	2Xf2S6IOsStmz2wSE91G5TbGlhupoFWIF+QYmYUJ97tn6nfk0AlQhsvGVneaiMNe
	7oNBv/awxadX4oLKQy2vmmULlrAGHeuXRxLnelKXMfNkYhC0cG55R7hcrEH5+WQf
	fSzupRCBVPHdPlvmw8Vxdw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w02ynb6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 00:08:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51KMdCMo026213
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 00:08:36 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2047.outbound.protection.outlook.com [104.47.58.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w0sr7d8w-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 00:08:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AipMp3A+FWKmudxxAxggNZ9lrS/W7phKW4yTj8eYH29eoYYNktX9zl4AsR01R0WxPhQxuN97/G9vdaPAh0g+pfXMWleB5lwi53cQ6DJtEG4xTf99SsXNg67xIpV8WGmQiTOwahzxdgdSwPq++uXxwmPkkfWhCmjVuLcOMVfQk7ryiVEHwNQgN2CbWeNnXQt4NpBrozqRKukzKXinMRyVcVoovj/VJ9BXtCR2fjmgjQB4TSTl3qMfyyTN7MA7WW9g6G+BkjtkX8XTtjn4yoqh8K0yr5fVFjVDHHwnFMRu7lPxZcDTESVV27vx0C2NU40Y5FIYZXlBEmevPWnBN6cbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blVEagxkkF9GkXoezvr/z54VUEWDRfR4nFZd4CiR4L0=;
 b=OLtk/sFpWE4U5YFiYFX7uH+9h3YdFEhTEu/oRL3QZkZ6xk+dJlKYC5qjLfQPGji/okAu0xYOdsSHmD3xP8FbBFgfiGUKLV8R0NSYNcaaW10FopjZBHI/ZffL33WhzVmmLyUCZHo0Hs3qldfgDn2/rJ9TxYz5LZWa59Cy7k00JpCtSDrc7W0gKUwLXd9d499LLGXyE0IT6A1LxsPoHVUOEvhbjJh+QufOjw+jcLO/o2Z5AlZHkLWkXsj4oGlMfSjraq3eZ24nhS6g6dFS7aPnwUDjAQJkN8IPoB7LgJBEtegWMU19l/b5QqZaqg5AX+pbW0JaDJ1h2GtlxfdkN/9SOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blVEagxkkF9GkXoezvr/z54VUEWDRfR4nFZd4CiR4L0=;
 b=IQAfCtrz6X+I0BNjfy4Vl3jR01JAQogqrXjttnKXuUpyW4VFs7KN2e1Yg6ycmVsL99qJkMMbjkkJA0SmAIKpbLKZFozUsAAQIF+g72PRALrMniCJPNUfyKBwBemlFSeTr5rwfj9ArrZvdynHhg0bisi/fOP5cfaKevwQ0Go9zm8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6058.namprd10.prod.outlook.com (2603:10b6:510:1fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Fri, 21 Feb
 2025 00:08:33 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.013; Fri, 21 Feb 2025
 00:08:33 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 6/6] Add support for pid function "-" with absolute offset
Date: Thu, 20 Feb 2025 19:08:31 -0500
Message-Id: <20250221000831.25523-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 9391e569-1031-4827-21f6-08dd520be0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bpT+jTzwdFnIbGxemC7tMDQq1+UKWWCaG3vjGWGH7yTblc0bMRBMgh1TNHCt?=
 =?us-ascii?Q?h113IzS2kCilmDcH97L2p7NUTosIErVJ/h7rmAaqUgdTUSWm2FlGV3LmewXS?=
 =?us-ascii?Q?DjpJxrBXDFDpOlS67eBTkiGjAT/e183OWS+SoJIDsqCmDJiFk9mh1hMY+WMd?=
 =?us-ascii?Q?qK7mmIgiC+GmZP4AfE8xyyy0vZDYsidJOQZndslVfQJtbcnDGK46TQA0LT84?=
 =?us-ascii?Q?MJzAzx/txVXvjex575nXy4G3LdX/ZD7LwW+kX92lkYRdH+l+vCqVRshnJzti?=
 =?us-ascii?Q?3YC4S3nCvrLnQoXJxANsNHdRIype5AqrvDRYAgzGB33DTxlHAQrEqa79xczQ?=
 =?us-ascii?Q?RgB9IQOxE7+KLgXv4QYHAJ2CsYCWdJ9i8Q/N/D0/F9eqexvuJzbnTjUOCRPL?=
 =?us-ascii?Q?9iZvzjGEQWeQX/Vzbva7enbzMiLBKzBEC2LMzmc7HYjI91n+twhGnXwjw0Wk?=
 =?us-ascii?Q?yr1bngMA44B5t+xulD8iPLB8nUPu6GPzFdItc4EtJOXS3ytud+IJ/aMt5JLj?=
 =?us-ascii?Q?IFt5U2ZidBYWugF89zc/qsukkjUTy7XacBDoCzlRkzG5J7MpeG/1M7YtDNQa?=
 =?us-ascii?Q?MgLHIi1WXTS9ptmdvoWNfVcUkvN295P+rhyhicBw98R/2y7pp3aQj4Vle5mF?=
 =?us-ascii?Q?ZhAD8075A52ILv/fSEgFzHRQJfu4mcIAbaD7vGPbe5m++nlp9tSTS0k+gfEB?=
 =?us-ascii?Q?n6jbPvGFLa/YP7GtgUkVsWxH+WBFbCDs1uSKDXjCcIcHpOzzIbKlO/yrAbEB?=
 =?us-ascii?Q?2503QvWGXYY80A2m6KSbFRkyJh/DRatYoHMObs3SKJd4EQ9pDD5VX6cLP/2T?=
 =?us-ascii?Q?kbBufJj1Ie6YyQUMOAkyrwhlOHdTUzxMLJml2hQRQu/lgNgx5ZBtuqdZBuI2?=
 =?us-ascii?Q?9qAB6vOiHYV+YXBMVX4vw1T7bYS9KBR39OriuJuFBp7nKnWqn8g6HHbskFar?=
 =?us-ascii?Q?uBmpFFqhOhLS1TLD8n0vQiakB5ZEr1ObGfraHsnYKi1XlbjtxO7LCgCBdVi9?=
 =?us-ascii?Q?BaO47Za3AfHF0GO6TDy92+9H1wEOHGLzwp4ilrw4YJhT4hXUtDTWmChAlLqi?=
 =?us-ascii?Q?OhLBuQK9TgHCDQU9z1N96VX9tP708doal90TK1XyrvOC7b909hrReVf8RWrT?=
 =?us-ascii?Q?OkhWY5LJVn84hFfdwdwAKlbIBuSX11xdUQNdiGnP+6bFROJKII9Svt6HZqL+?=
 =?us-ascii?Q?1L2krxG+gwCPp9GbZWoGwlMwU//2SuoJrOu8i4M50fc97Kj9/cKOQy3ihDwT?=
 =?us-ascii?Q?/Z+wV2eNBlWfM4k5MgTIpzWTHnNWd4M7s7zmCmurHa2FKpyVu7Aph1VH8oG3?=
 =?us-ascii?Q?WlhfD3ihvP4cuL7yv9JxWV5+ivC0RBCrYcUpWhHiTnxeqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvbFf/TUZZNYPgrd/v+b7PVSbl2IBQ2ILszzCZebPEtyO96eAd5kQC0aImr+?=
 =?us-ascii?Q?3gVgZw8FwIdF6KWe9Xz3HGVHOZXSQtrQ714dQopC46T9bvulVNJeZ8xbGd1c?=
 =?us-ascii?Q?MiJj/SvQY8ZZkQTsWW8Ady5ATZfo/yLoeoI5RDw8OVXRdJfjrGAc3qgpKvxv?=
 =?us-ascii?Q?HPW1rSszAVbn/SJ7M9TguxpIMu3YvXl6GS7rVO01geeXY5JVBn91+FVoahCz?=
 =?us-ascii?Q?ntXv+APRFXoVUNBXcwwf/ojgZjDb4LwRD8VufFqHyeB2y4h4SGokfuAnOSSX?=
 =?us-ascii?Q?ZPtYjU+quWJj5xRkYN9WT2vLDhDj1Yzeyy79kT72CDnEy/bQrskXT21YKiK/?=
 =?us-ascii?Q?pr2FOqQjdIJM1R8MtzDAUcN0rY1zf4L45PYtnoEIsOng5m2ztkn5DBZsxj/F?=
 =?us-ascii?Q?/LTPJbVxuxqSaoOMf/7RTGC7+7JmMO82NbU/HXrz6BGEMoPQ7VpeJBhaI8wP?=
 =?us-ascii?Q?Jo6G5UDhNnMxKYw7KqIE/QRIN8mJebffKM0NWbBfXiS1+7ztFsdBUsm6KAyH?=
 =?us-ascii?Q?s034Gu2BmODKsmIvrEI2SWvQLYm+iL2afwOSrNGX8MFiC4iesGAIRaECFrpM?=
 =?us-ascii?Q?KEL+6ZhIUdHYH6DyJIJhSMpxutM8HQ2mCR4sRS/E/Ur7sOU6Db3RhnWp80Kn?=
 =?us-ascii?Q?beKV9ZQerA6ATIfxWZqdCAORP7D3fcKipRicuEy3hkE+7wzpo+ND3xOlqbAy?=
 =?us-ascii?Q?Rl4P/16nR0vbfkkXjv7zEQCgNUM7XepzWzMnID1cidb4HJOLUVoUy2QrtyWI?=
 =?us-ascii?Q?93NOwvPRnGY5cf/SHK2qkFzJwe3vVbEce3Ce7D2gSBopAGRvKGneB7Q+RTGn?=
 =?us-ascii?Q?eejg472TrUq7xtUN2ksjIJmINqz7MuHnJed65enZDKRYPnQe6jwvcE9a7N9t?=
 =?us-ascii?Q?feeIBI3zftfW5oUndgf/BUO43FUTORMyMFmclUsx6J5T+7SXH/K2iqhuKxHa?=
 =?us-ascii?Q?tSWUuRDuTy2bXdF/W5TjV28eB2PLtTZvHmoIg8cUZ6EK9pxkmdaCPV0n8E2r?=
 =?us-ascii?Q?XxRHGT/72mZEccaoi8+q2tF4UhdPtfVDCGqjRKUpeslrAqwfr8mU3HldRAx3?=
 =?us-ascii?Q?GLNmRQD/CEJ9PlEaPvVWlBPS5bdyVSWU1QH19E8eU4O1G9D3+RG0diaao9n2?=
 =?us-ascii?Q?DmVAunfQpyOwGC4q7MKN/Grj8BvruB0nbEf/J5auoxIbnUEyHa4Vb8/1O3o0?=
 =?us-ascii?Q?vsxIahQQYDL00hr29itvvAqVvCjrMIemMF/R8IwWcVU5SAxKb0sqZQvWf2cv?=
 =?us-ascii?Q?9ZjZobEHSSr4XDcQ0UGgC5riUzMchPSpsYRrpgIN4g0jZSe2Vr6UQQw9+tm3?=
 =?us-ascii?Q?ye99pSCD37fAauRFbDV+Zo1pZSELVdzwm53A04gzzzYPAfa7L+oS6eRBqN93?=
 =?us-ascii?Q?R3d2xzzymcCC5vGpXYBSiQHtF/DgBuBC7dhiy8qo3IMWy2FtzKodQocqXII6?=
 =?us-ascii?Q?9X5y7tCe0sdfuZn06igOBNZBo+Z4BzsdhqedotmXmqjy1a0sr7fYO4/ma0mm?=
 =?us-ascii?Q?2WaGZ8FceMP/4cxeYvLVg5oFhjQfahzLUdg4EhqDGp2PIZG9KRTcHVerKc6j?=
 =?us-ascii?Q?zIonZ3z8fbOXs7skY9/Zhzjd//M8mxG5iI22mpVy?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	G+FOT4jfeM1RqKo1Ior+2IUOYkrEERPRzTLWakTHHDkvPpMEsXnNWk27oEhFSbFvPCIyCOtvl5RwokQGsKnVHCMP9KzAwTuVp7ZbjWcYvWDkpXc7ORSiVrnq28Q7GFjhu0VHzsCfXv3YZJUZR3witg9J5a2yWEV9qAwbxO3TFrZWRkThDLjf+td4iAm7FU29WKF6FlpJHJEz/EWWmwkC41Mg5uwqfJzaWyXTpm9ay6Ibllxefx8Ruqad2Fi9uoN2iFgNlCxJOtPhbhAjINy7X0yEoKOXNZlMQnbLfK5mzVqXxKmG6Of3bRP8NaovK+w25JFtMCSq2epCerThoUih8DEM1limCT4gUQFizz+yFLoWHdE+ToxEyTrWFfKjSmQoOjeEPznS1+xAJyH8DtZ2y3ee1CeCFrvOF4UjuhMrufzhX0DNDOdLBy2igmMOmVbAoaGv6f8Mbn1ZZBV+UCbOTogH0SMM4vjLgfetyc63ss39QPdYLKaaDOy6Bt4RgJMSv2kv6C7JH9KFju1W8EXOZ35yD7x72fUUhxq0/cPcUhONMlcHapxAT7GDOec+OjCCnAyAsIR+JAmbtA3pcQDvznvBaxG7tThLZcKwLMZ2zpA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9391e569-1031-4827-21f6-08dd520be0fc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 00:08:33.0888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgsTbupk4kqRp2PC2o89zcrQPNcHj4UA1/1VZ70AuX0mNMqaoLS5IlpWohzjjS4qGh5erFgAmEWAY2MHJlyp1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6058
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502100000 definitions=main-2502200160
X-Proofpoint-ORIG-GUID: fk3QWdrtXUrP6ZJhrN-neUxvvDOu8aD0
X-Proofpoint-GUID: fk3QWdrtXUrP6ZJhrN-neUxvvDOu8aD0

From: Eugene Loh <eugene.loh@oracle.com>

The pid providers allow users to specify a probe function "-",
meaning that the probe name gives an absolute offset.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 include/dtrace/pid.h                |   3 +-
 libdtrace/dt_pid.c                  |  79 ++++++++++++------
 libdtrace/dt_prov_uprobe.c          |  38 ++++++---
 test/unittest/pid/tst.dash.r        |   1 +
 test/unittest/pid/tst.dash.sh       | 119 ++++++++++++++++++++++++++++
 test/unittest/usdt/tst.pidprobes.sh |  21 ++++-
 6 files changed, 224 insertions(+), 37 deletions(-)
 create mode 100644 test/unittest/pid/tst.dash.r
 create mode 100755 test/unittest/pid/tst.dash.sh

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index c53e60047..12934500a 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -2,7 +2,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
- * Copyright (c) 2009, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2009, 2025, Oracle and/or its affiliates. All rights reserved.
  */
 
 /*
@@ -22,6 +22,7 @@ typedef enum pid_probetype {
 	DTPPT_ENTRY,
 	DTPPT_RETURN,
 	DTPPT_OFFSETS,
+	DTPPT_ABSOFFSETS,
 	DTPPT_USDT,
 	DTPPT_IS_ENABLED
 } pid_probetype_t;
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 11b964561..76608f690 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2010, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2010, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -155,7 +155,6 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	uint_t nmatches = 0;
 	ulong_t sz;
 	int glob, rc = 0;
-	int isdash = strcmp("-", func) == 0;
 	pid_t pid;
 
 	/*
@@ -183,7 +182,46 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 	psp->pps_nameoff = 0;
 	psp->pps_off = symp->st_value - pp->dpp_vaddr;
 
-	if (!isdash && gmatch("return", pp->dpp_name)) {
+	/*
+	 * The special function "-" means the probe name is an absolute
+	 * virtual address.
+	 */
+	if (strcmp("-", func) == 0) {
+		char *end;
+		GElf_Sym sym;
+
+		off = strtoull(pp->dpp_name, &end, 16);
+		if (*end != '\0') {
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+					  "'%s' is an invalid probe name",
+					  pp->dpp_name);
+			goto out;
+		}
+
+		psp->pps_nameoff = off;
+
+		if (dt_Plookup_by_addr(dtp, pid, off, (const char **)&psp->pps_fun, &sym)) {
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_NAME,
+			     "failed to lookup 0x%lx in module '%s'", off, pp->dpp_mod);
+			if (psp->pps_fun != func && psp->pps_fun != NULL)
+				free(psp->pps_fun);
+			goto out;
+		}
+
+		psp->pps_prb = (char*)pp->dpp_name;
+		psp->pps_off = off - pp->dpp_vaddr;
+
+		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ABSOFFSETS) < 0)
+			rc = dt_pid_error(dtp, pcb, dpr, D_PROC_CREATEFAIL,
+			    "failed to create probes at '%s+0x%llx': %s",
+			    func, (unsigned long long)off, dtrace_errmsg(dtp, dtrace_errno(dtp)));
+		else
+			pp->dpp_nmatches++;
+		free(psp->pps_fun);
+		goto out;
+	}
+
+	if (gmatch("return", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_RETURN) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -195,7 +233,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		nmatches++;
 	}
 
-	if (!isdash && gmatch("entry", pp->dpp_name)) {
+	if (gmatch("entry", pp->dpp_name)) {
 		if (dt_pid_create_one_probe(pp->dpp_pr, dtp, psp, DTPPT_ENTRY) < 0) {
 			rc = dt_pid_error(
 				dtp, pcb, dpr, D_PROC_CREATEFAIL,
@@ -240,7 +278,7 @@ dt_pid_per_sym(dt_pid_probe_t *pp, const GElf_Sym *symp, const char *func)
 		}
 
 		nmatches++;
-	} else if (glob && !isdash) {
+	} else if (glob) {
 #if defined(__amd64)
 		/*
 		 * We need to step through the instructions to find their
@@ -449,31 +487,25 @@ dt_pid_per_mod(void *arg, const prmap_t *pmp, const char *obj)
 	else
 		pp->dpp_obj++;
 
+	/*
+	 * If it is the special function "-", cut to dt_pid_per_sym() now.
+	 */
+	if (strcmp("-", pp->dpp_func) == 0)
+		return dt_pid_per_sym(pp, &sym, pp->dpp_func);
+
 	/*
 	 * If pp->dpp_func contains any globbing meta-characters, we need
 	 * to iterate over the symbol table and compare each function name
 	 * against the pattern.
 	 */
 	if (!strisglob(pp->dpp_func)) {
-		/*
-		 * If we fail to lookup the symbol, try interpreting the
-		 * function as the special "-" function that indicates that the
-		 * probe name should be interpreted as a absolute virtual
-		 * address. If that fails and we were matching a specific
-		 * function in a specific module, report the error, otherwise
-		 * just fail silently in the hopes that some other object will
-		 * contain the desired symbol.
+		/* If we are matching a specific function in a specific module,
+		 * report the error, otherwise just fail silently in the hopes
+		 * that some other object will contain the desired symbol.
 		 */
 		if (dt_Pxlookup_by_name(dtp, pid, pp->dpp_lmid, obj,
 					pp->dpp_func, &sym, NULL) != 0) {
-			if (strcmp("-", pp->dpp_func) == 0) {
-				sym.st_name = 0;
-				sym.st_info =
-				    GELF_ST_INFO(STB_LOCAL, STT_FUNC);
-				sym.st_other = 0;
-				sym.st_value = 0;
-				sym.st_size = Pelf64(pp->dpp_pr) ? -1ULL : -1U;
-			} else if (!strisglob(pp->dpp_mod)) {
+			if (!strisglob(pp->dpp_mod)) {
 				return dt_pid_error(
 					dtp, pcb, dpr, D_PROC_FUNC,
 					"failed to lookup '%s' in module '%s'",
@@ -647,9 +679,10 @@ dt_pid_create_pid_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
 	if (strcmp(pp.dpp_func, "-") == 0) {
 		const prmap_t *aout, *pmp;
 
-		if (pdp->mod[0] == '\0') {
-			pp.dpp_mod = pdp->mod;
+		if (strcmp(pp.dpp_mod, "*") == 0) {
+			/* Tolerate two glob cases:  "" and "*". */
 			pdp->mod = "a.out";
+			pp.dpp_mod = pdp->mod;
 		} else if (strisglob(pp.dpp_mod) ||
 		    (aout = dt_Pname_to_map(dtp, pid, "a.out")) == NULL ||
 		    (pmp = dt_Pname_to_map(dtp, pid, pp.dpp_mod)) == NULL ||
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 11d595898..e96479963 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2021, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  *
@@ -55,7 +55,8 @@ static const char	prvname[] = "uprobe";
 typedef struct dt_uprobe {
 	dev_t		dev;
 	ino_t		inum;
-	char		*fn;
+	char		*fn;		   /* object full file name */
+	char		*func;		   /* function */
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
@@ -128,6 +129,7 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
+	dt_free(dtp, upp->func);
 	dt_free(dtp, upp->args);
 	dt_free(dtp, upp->argvbuf);
 	dt_free(dtp, upp);
@@ -333,9 +335,13 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	 */
 
 	/* We know what function we're in.  It must match the probe description (unless "-"). */
-	if (strcmp(pdp->fun, "-") != 0 &&
-	    !dt_gmatch(uprp->desc->fun, pdp->fun))
-		return 1;
+	if (strcmp(pdp->fun, "-") != 0) {
+		dt_uprobe_t	*upp = uprp->prv_data;
+
+		assert(upp->func);  // never a return probe
+		if (!dt_gmatch(upp->func, pdp->fun))
+			return 1;
+	}
 
 	return 0;
 }
@@ -623,11 +629,11 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	 *
 	 * The probe description for non-return probes is:
 	 *
-	 *	uprobe:<dev>_<inode>:<func>:<offset>
+	 *	uprobe:<dev>_<inode>::<offset>
 	 *
 	 * The probe description for return probes is:
 	 *
-	 *	uprobe:<dev>_<inode>:<func>:return
+	 *	uprobe:<dev>_<inode>::return
 	 */
 	snprintf(mod, sizeof(mod), "%lx_%lx", psp->pps_dev, psp->pps_inum);
 
@@ -638,6 +644,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	case DTPPT_IS_ENABLED:
 	case DTPPT_ENTRY:
 	case DTPPT_OFFSETS:
+	case DTPPT_ABSOFFSETS:
 	case DTPPT_USDT:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
 		break;
@@ -649,7 +656,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prvname;
 	pd.mod = mod;
-	pd.fun = psp->pps_fun;
+	pd.fun = "";
 	pd.prb = prb;
 
 	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
@@ -672,6 +679,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		upp->inum = psp->pps_inum;
 		upp->off = psp->pps_off;
 		upp->fn = strdup(psp->pps_fn);
+		upp->func = NULL;
 		upp->tp = dt_tp_alloc(dtp);
 		if (upp->tp == NULL)
 			goto fail;
@@ -692,6 +700,17 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		goto fail;
 	}
 
+	/*
+	 * The underlying probe should have the same function for all
+	 * overlying probes unless it's a return probe.
+	 */
+	if (psp->pps_type != DTPPT_RETURN) {
+		if (upp->func == NULL)
+			upp->func = strdup(psp->pps_fun);
+		else
+			assert(strcmp(upp->func, psp->pps_fun) == 0);
+	}
+
 	if (populate_args(dtp, psp, upp) < 0)
 		goto fail;
 
@@ -735,7 +754,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	pd.id = DTRACE_IDNONE;
 	pd.prv = prv;
 	pd.mod = psp->pps_mod;
-	pd.fun = psp->pps_fun;
+	pd.fun = (psp->pps_type == DTPPT_ABSOFFSETS) ? "-" : psp->pps_fun;
 	pd.prb = prb;
 
 	/* Get (or create) the provider for the PID of the probe. */
@@ -823,6 +842,7 @@ static int provide_pid_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
 		strcpy(prb, "return");
 		break;
 	case DTPPT_OFFSETS:
+	case DTPPT_ABSOFFSETS:
 		snprintf(prb, sizeof(prb), "%lx", psp->pps_nameoff);
 		break;
 	default:
diff --git a/test/unittest/pid/tst.dash.r b/test/unittest/pid/tst.dash.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/pid/tst.dash.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/pid/tst.dash.sh b/test/unittest/pid/tst.dash.sh
new file mode 100755
index 000000000..f364e3e3c
--- /dev/null
+++ b/test/unittest/pid/tst.dash.sh
@@ -0,0 +1,119 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# @@timeout: 80
+
+dtrace=$1
+
+DIRNAME=$tmpdir/pid-dash.$$.$RANDOM
+mkdir $DIRNAME
+cd $DIRNAME
+
+# Make trigger program.
+
+cat << EOF > main.c
+int foo0(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int foo1(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int foo2(int i) {
+    int j, k;
+
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+    j = i ^ 1; k = j ^ 1; i = k ^ 1;
+
+    return i;
+}
+int main(int c, char **v) {
+    int i = 0;
+
+    i = foo0(i) ^ i;
+    i = foo1(i) ^ i;
+    i = foo2(i) ^ i;
+
+    return i;
+}
+EOF
+
+gcc main.c
+if [ $? -ne 0 ]; then
+	echo ERROR compile
+	exit 1
+fi
+
+# Loop over functions in the program.
+
+for func in foo0 foo1 foo2 main; do
+	# For each function, get the absolute and relative
+	# (to the function) address of some instruction in
+	# the function.
+	read ABS REL <<< `objdump -d a.out | awk '
+	  # Look for the function.
+	  /^[0-9a-f]* <'$func'>:$/ {
+
+	  # Get the first instruction and note the base address of the function.
+	  getline; sub(":", ""); base = strtonum("0x"$1);
+
+	  # Get the next instruction.
+	  getline;
+
+	  # Get the next instruction.  Note its PC.
+	  getline; sub(":", ""); pc = strtonum("0x"$1);
+
+	  # Print the address, both absolute and relative.
+	  printf("%x %x\n", pc, pc - base);
+	  exit(0);
+	  }'`
+
+	# Write the expected output to the compare file.
+	echo got $ABS $func:$REL >> dtrace.exp
+	echo got $ABS "-":$ABS   >> dtrace.exp
+
+	# Write the actual dtrace output to the output file.
+	# Specify the pid probe with both relative and absolute
+	# forms.
+	for probe in $func:$REL "-:$ABS"; do
+		$dtrace -c ./a.out -o dtrace.out -qn '
+		    pid$target:a.out:'$probe'
+		    { printf("got %x %s:%s", uregs[R_PC], probefunc,
+							  probename); }'
+		if [ $? -ne 0 ]; then
+			echo ERROR: dtrace
+			cat dtrace.out
+			exit 1
+		fi
+	done
+done
+
+# Check results.
+
+if ! diff -q dtrace.exp dtrace.out; then
+	echo ERROR: 
+	echo "==== expected"
+	cat dtrace.exp
+	echo "==== actual"
+	cat dtrace.out
+	exit 1
+fi
+
+echo success
+exit 0
diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
index 54444d49b..0c75d7967 100755
--- a/test/unittest/usdt/tst.pidprobes.sh
+++ b/test/unittest/usdt/tst.pidprobes.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -121,7 +121,13 @@ fi
 pcs=`awk '{print strtonum("0x"$1)}' disasm_foo.txt`
 pc0=`echo $pcs | awk '{print $1}'`
 
-# Run dtrace.
+# Construct D script:  add a pid$pid::-:$absoff probe for each PC in foo.
+
+for pc in $pcs; do
+	printf 'p*d$target::-:%x,\n' $pc >> pidprobes.d
+done
+
+# Construct D script:  add a glob for all pid and USDT pyramid probes in foo.
 
 cat >> pidprobes.d <<'EOF'
 p*d$target::foo:
@@ -130,6 +136,8 @@ p*d$target::foo:
 }
 EOF
 
+# Construct D script:  add a glob for all USDT pyramid probes, dumping args.
+
 if [[ -n $usdt ]]; then
 	echo 'pyramid$target::foo: {' >> pidprobes.d
 
@@ -141,9 +149,12 @@ if [[ -n $usdt ]]; then
 	echo '}' >> pidprobes.d
 fi
 
+# Run dtrace.
+
 $dtrace $dt_flags -q -c ./main -o dtrace.out -s pidprobes.d > main.out2
 if [ $? -ne 0 ]; then
 	echo "failed to run dtrace" >&2
+	cat pidprobes.d
 	cat main.out2
 	cat dtrace.out
 	exit 1
@@ -286,14 +297,16 @@ fi
 # - a blank line
 # - pid entry
 # - pid return
-# - pid offset
+# - pid offset (relative -- that is, pid$pid:main:foo:$reloff)
+# - pid offset (absolute -- that is, pid$pid:main:-:$absoff)
 # - two USDT probes (ignore is-enabled probes)
 
 echo > dtrace.out.expected
-printf "$pid pid$pid:main:foo:entry %x\n" $pc0 >> dtrace.out.expected
+printf "$pid pid$pid:main:foo:entry %x\n" $pc0   >> dtrace.out.expected
 echo   "$pid pid$pid:main:foo:return $pc_return" >> dtrace.out.expected
 for pc in $pcs; do
 	printf "$pid pid$pid:main:foo:%x %x\n" $(($pc - $pc0)) $pc >> dtrace.out.expected
+	printf "$pid pid$pid:main:-:%x %x\n"      $pc          $pc >> dtrace.out.expected
 done
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $1);}' >> dtrace.out.expected
 echo $usdt_pcs | awk '{printf("'$pid' pyramid'$pid':main:foo:entry %x\n", $2);}' >> dtrace.out.expected
-- 
2.43.5

