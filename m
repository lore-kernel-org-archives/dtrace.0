Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9A189B98
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518547; cv=fail; b=o0b2sUbL6bzEwX0jrzDcM8iBmQtxVHKdcMUBoVoyfCpz4mxhAgIj6oHlnnhCG+Q2Efw+8adOhHbNpxeYX42tSosIlvJtlXvwJQsphmjymVnH81XUGILGuFa/XIRaDipIoaMrI6qYgw6vpMetB8yJj6uVtWi4rhhFaMB+iZIJUhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518547; c=relaxed/simple;
	bh=R2JSMYPVhJrGTYioa/CrsjTAFBmF4y77X9aix5yfSB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rsl2elVr/ViRmLbPGO+vP/cFha3cgyVAy1XkZzLH0qJktsqCmkvPf/w0L2MpCTB98Za5XqR3JSpFdx8WIm7Wfs9RbCM4tUvKNTo0E0nqfJWFS4nCNMlESh5w0hnYmx6yASC6IbhwCXBMvf6BZAi6VkSAkNBagvssjec6PjJjBbM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mNINQvC/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=O78Qg/IM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mNINQvC/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="O78Qg/IM"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717tVB2030760
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=aJo1Lh8hy2rpigkfmVixlsfSj6qLrPlHZ14Ez1/75mY=; b=
	mNINQvC/hWDTdmCajVXc4vNoazQ01Qd7Og/Uh8oCFhdhvEsmjr90MAhqTNfrZJ/C
	imMwS/ien8khgx3eSneX4YNFOTI7tQJ+8mmAshEI0Xom9J6sYHLCwzK7qY1ks+or
	hetnMBvGuTe9NP/w4L8BKOgY6PAX44Om9I7WvOCugY5jkM+qJlRlfuBXJjhwt7HI
	veC9UdoyOOMQnmYYqz1hHSaG/pJIpraqGciOSbSdEz79LRvPY65sDVvDh76fQBUp
	lHrdvR4O7XoL8eG8/v6/dWkyxzr6/51gPLrR3kSLLTX1v/MDc/GopoeK99I5qEnm
	mlcn3fNpD2ixjNz3Z6xo5A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40msessqht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471Cf8el035951
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:24 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40nvp06fmh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Har+zdnG3CIXYNHiFSde6qR7chc8a0OAt5+zJiGfj+ow8H0K1qHPVXbK2+i4dAf0qBCxC7hSrRShPgoVdZMSti8Zt4b7OFD3LTqRPOD5UwSkZdUx+tpdRvfxi/5GE4jiT/SYbm5znSHrEIXKwLXkbeLATyUuCTqtrhln2HYRjiTYbhz0AqhkbjLmkLLKkAalSTNB13JAJkxs+GMQivCgmdNwVxi+Lb85SkVR+OIcTiBqPdFJX0rKORhdrRqWy7G8X6lue6y3PZFpfqJXXvG6iHGXqV2aZwWe1Qo8c3kBw3LMwtNsEqfKnlhzFuZGAvZkeLh7D+Xi985wEJZMvU/3QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJo1Lh8hy2rpigkfmVixlsfSj6qLrPlHZ14Ez1/75mY=;
 b=VPU3NXM8QYKoaByuaPKdULykHog6wRp/KpdvGqBmadJ5u+qv9PG4cI5qPWt8dcNa3bJecS1gLQZEYdDhqSBkEPShAUSUV/Vlj71L5xvNobkzh1o6cpZXJITnaXOvCQVyg1faGuq0nOqRQ0nPa7SrQvtVQCa+huTQMdnBxvNuWOuHqRHeveamWao6NZpHQyYMW84YTuR9GWDPzco4fQZC1nM2f7SmX6Qg4Hu4XH7HY1rNRrHByi58FUvopYQDgIIHjg9BrLXzeNTcWvX0SlAmkQzL9FcBCAxYC0EBZKt9UPkpfcdRxecPKuIDRyIIbOf/oc7DRpPlRBbW9KlpO1hD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJo1Lh8hy2rpigkfmVixlsfSj6qLrPlHZ14Ez1/75mY=;
 b=O78Qg/IMRifE321mQsKctnBplnO8t0RG5cZwDwUuENMZ9vR11r1jgIu2LoSz2hxGszcxL+wdz06ZxMgMt5GAL1mj+hZVzNQdmxZ1Pd4AKNglgzNduo6e6yfmZj84ODVfDMx9dxBbfibAbobxKftLSUzOa9ivnmPHzkoozfdcBw8=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:22:21 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:22:21 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 2/9] build: initial pkg-config support
Date: Thu,  1 Aug 2024 14:21:49 +0100
Message-ID: <20240801132156.286780-3-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::16) To SN7PR10MB6595.namprd10.prod.outlook.com
 (2603:10b6:806:2ab::18)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 8076c954-9ccb-4ba0-408b-08dcb22cf96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zH3j7vKb6ZdVYrQQ+RPDg4L3UFrMmdN4HxThZdKim8LFcxI72FG7R+E9MzZL?=
 =?us-ascii?Q?EkBkC17wrPsvN18coOrtgdSX7hh0cQfL7RSXwAu8o1xVMagHlaRMh1V03MrT?=
 =?us-ascii?Q?ysdwH8sKaHB8hXCKnMdgL2CE+FHVpBsqBv6vATQzC3wTz5/xzSu4aVib9yb7?=
 =?us-ascii?Q?lHYwBuAlGrF3bTr5NR+un4zMu4nkej12E9RHBevAY3uhEixeFvvBhtw21Ff6?=
 =?us-ascii?Q?qsCDl7k8q7wminjRYr1yOHDVVEtGo7bWtM9qZ48RaFWAmnN4qs70NKiBfror?=
 =?us-ascii?Q?5yCJeVwTIFNFmOi/RgstO2dvOGM2+WgytumrfkdhiXBPkNP/5LtDq/N8pXJs?=
 =?us-ascii?Q?XYx8FeV9aDhu+Xodx+La2AwuBwyLstGV6CXSwcl7eIqtNjub1JQtPw9u1wYN?=
 =?us-ascii?Q?ZaWVmC5Hdt/NftERSMXr30nsmMuxLWQQO+RJdI09fAkMS47RKf6iOcI4ybpG?=
 =?us-ascii?Q?+mkQMJQj7UVb+Z6G0KYdNUAbhdUyTbcw9RFuR3lRubF/3opwCPWMuyEqvBlk?=
 =?us-ascii?Q?KOFvp3TR45EGkQ5mEh5EBUHZFnwanMr1ZYTbCRIvaczYhkn+EvkY4ZQq7ian?=
 =?us-ascii?Q?7lAmOkAU9RCYIePEO0/giFTGbOdf9adJzZcLkg0ZahIY3slmZlamQ1fWVRi6?=
 =?us-ascii?Q?DSGHHy7V30RrajF6IyxVCO0yEXLIHq+D9QiADOrTlbwZ4HPVYAMF9gPa0/Q5?=
 =?us-ascii?Q?kn0562QyinWbyoj/eB6qOYUDlQ5lVCrzdEleLTvVUlEni2zAoJrGdlo3uwLI?=
 =?us-ascii?Q?/w75fPGfiJHooHhH3/Oc0cKgnDojPhhp/5xybv/gPVTsLrGbWMQnRKhbCGF8?=
 =?us-ascii?Q?up3kAoS6fdt5UdD9EZupxXZwBMakV48ATvTwTRxvbXK9CcDjbxg/RExIro3G?=
 =?us-ascii?Q?XnwiVnntATjSMcORXeTzNbFH5xxBhhww+sIcaw6z4lCNzoX+wad65SlhA1eT?=
 =?us-ascii?Q?YwKK4M6Q298anH4/KvsV1P3kXcILxVlfJXM5IMej9oBDM27AffrhCud7os23?=
 =?us-ascii?Q?p+qTwPpOlCFmOh50VhqFG9qlXwKy8lz3LU5BgEoq/BeCKDwKmI5vQcArFEEP?=
 =?us-ascii?Q?oTtLKX5pjNVAFJB/wJJVTYUo5Cd3f2NRxmgvve7t6yxtTJWlNbKszILpymkS?=
 =?us-ascii?Q?pPTByBaN5NWe5vxV/bOpFQWO55crJwYktQddzceqwP7agvMNXVUE0+9angc5?=
 =?us-ascii?Q?ybF61CF0lroMzB/XGK0wBF7q48ViRs8m7ArZB6NQkNsaFj6ohs91NANobeI1?=
 =?us-ascii?Q?OhLW0GIZAD1fZrlj3MqCJcXzQE/R9kBBvLY67fPQYL36Ajxnd+hzWe0/sUEy?=
 =?us-ascii?Q?15aXOlEkrJ9i6hdVn92yLjjj9PPUPAeZiy97WxeyDeIqDQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EuNiet5DuCeycprK1QAkyK67aKmWW2+ajpK/9pStDNztGx5ZFuSg191TR2LA?=
 =?us-ascii?Q?TCjla/opmQ9svX0gzAaLSFBTM0b64C/0Kr1KY0pWfZDmOR9+Mh6H0QVdnPx7?=
 =?us-ascii?Q?cyF8CVrFhBjmxtW7DOkmaqWTier8YNofEkb02UTpKANkW1R7HmpwCGKedrdb?=
 =?us-ascii?Q?EKUdZ7Q/hhOpM7f9Od4/6Lkqg8ogK3SHkWoiSB/AbZoOq8o/5VOD8Ep5g/+A?=
 =?us-ascii?Q?3+XmWjJcn4hbIczELJil66QKxnNAML3s5GpmxEdiEHFp+Wov5O27wRYEO+hX?=
 =?us-ascii?Q?h8r+ZAEep4GjJSVVPPHx1oUCIwkAEYRX+Q0Mo4Y3LMrjENIOGrillChBYcJ3?=
 =?us-ascii?Q?txpwBT3ahbeEBViPFO2s9LuS2VMPu3veSbbiNDZAWOJE1tQO/ITJbjQi7Cfo?=
 =?us-ascii?Q?Ue/duy5Q5ze6Vhxqdk0V438s0agnjAwkwlR6XIHoXrNcSCxgq5U7waP0a507?=
 =?us-ascii?Q?tckZzJoGkytDSFYWFgtEQjAWbggxO6cKShJQdsmVs0tELsNzu34Q3iMp9mCh?=
 =?us-ascii?Q?rNI3GKGTG0g3he9+7SzRsMyh2Nd0wE0L7JMp69LbQSfWZpM9Yl0I8o/0XZKF?=
 =?us-ascii?Q?jV6+3NCQU3DNlfp4YEtagTuyEFL3tMeSeHq6FcmRTEc7RPtLnfbksoGJNL1p?=
 =?us-ascii?Q?Grn6O+r8t101to/6nq7n37eZGawgU6ff+7EJxX9oK5P+O7gebhEcbtpb5fA+?=
 =?us-ascii?Q?WOL1KYMUlrcvm2J/T/uQWYDPzAVs8YbUylgRsJuVnYVZoN+PAmAdHgpWyme0?=
 =?us-ascii?Q?t0/C2rKE1sPa4KLvv6yFga4CkcQlJ7h0+Al1hUCeiiSubC48qSYhTB/A/6AC?=
 =?us-ascii?Q?UE6j2ZLkOcwHPwuaCV6Yqz+cmMQsPsMZEbFZNpA1W4iPsoLnh1IT2hV0lyr2?=
 =?us-ascii?Q?DuG5RbuTITTAXMfqx3gBaaEqvId/7jLNSFSBgUiDkVUSt8k29IXbVHXhGc6S?=
 =?us-ascii?Q?wY9KfUnv7ixcM5CUYH6sStrSDM+O8nGovBRbrVvzxDwdB38w2ZiKe68WQWX/?=
 =?us-ascii?Q?osRyBOTKwdR39YYWO4o27PIL7y53olj3QnpUxX6sE6sHtNt3roAtoVRV6IGN?=
 =?us-ascii?Q?TdCuYAwGmH4QCsVgSiPlB/luQBtc8489nJXO+kEaFN37T9Z8fJYpbQ4CMm/2?=
 =?us-ascii?Q?sRH/xTSWXIo0tsYeC06RCnsrRP99G98fjp2Il4ARyjF/MeGEFSfuFBhxn3HF?=
 =?us-ascii?Q?7wKEGWVkmz41YMKjSftpghzq97YLyvgEbLV+YEtEe1O/Y50C84whih2jyKPA?=
 =?us-ascii?Q?/kre+RVEr0kxra09LUjQTs1W+aRPz9Igp4Br/ZnSzvtsl7sgKU3N7Foa/ddd?=
 =?us-ascii?Q?+7sXCVdEKQWikHSGPYtj0gbhilWIhAyJSFyGLy+ClJYdtQkdlockIQ8lQuHg?=
 =?us-ascii?Q?QOs7UDkOceefvZdGoK3k10CSWizsfmkAkb0hrB449IpH1CukcHvQwQ4e9SXM?=
 =?us-ascii?Q?rHwdZ/8TDHvp7v58ugBk4IQswo77SP67Dlt5SQCB3hlgcsffFkENFI3oT3oA?=
 =?us-ascii?Q?DYnFT6PAkBaUqeMaCkCgVdzUv4ZX8yeDdpdD56byzyqBfDQXug0NZ7R56h59?=
 =?us-ascii?Q?zTvvCE0DvcmSa+sVDcqLmu22frYs7BHPbUVNioAJudyM3kyY6C3B+Q1KvDsF?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CAeeHI3K5bFWSL28ON7kihCuJ7d8225O6ZgOSrPodKyGduikwIh/pxoupRzELOdEzmg/DwI6vCianOiiO1ND9zJnlfU+ju78vvOkI67Mg+BumT3CkbSQ8XJFpBEEYbnz9lYKEJZ1h/0TVw5PDNk6h2Rm5sKPtliXThPqKvN7Wk9Xy6tCym96t8NGiJhFStkwPq0p5wiGlLp1qNRJonbuTy7DPYrB20+e/vxH4ndo8fIaZpIJ/mEc5hFI6eCEgZCcGXByQgvaCGSpldMxcTdoNXCsKejJYnbOl5BGZY2UbmIcmqBEwppyFqG8qA+8o1uPMwtDL8DbXglZeC+9o9ATM4xZRNXumjrBINcyx35CMXcmZr6XC2W3GzWpcqWWaLePeeREoT7wHHhSj2dU3Am9pg8dg7rguDrt1vzYH1pI0EvfXnBHEsN2C8uJsbY4UTSyk/TC0Syn6AaIQlleFTcUZgCTLr7Uyto7pIUksBxKUeOLrqEvaGFH96vrJEvvVZlG64oAZjQKVd+JFKRqcdBbdN0yVd6z/MspOZd0Muwwdzo8oDP/9a8bpRt/XCuk8UOlXTiUmtnfgZvLxGQmO0JuMKRo5dew+JwqMKDYPEuqCX0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8076c954-9ccb-4ba0-408b-08dcb22cf96b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6595.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:22:21.4893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7/N+o3ejevY9MDDSGVhuOd971BxJQIFEWWqCOx7qUt5+M49LKe44q/P0aq9lSPlbAQfrLhqt8ePJxx7MccVvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408010086
X-Proofpoint-ORIG-GUID: 43r-SlUHeLehOa3vWbjs2lZkxlt14NXK
X-Proofpoint-GUID: 43r-SlUHeLehOa3vWbjs2lZkxlt14NXK

This initial pkg-config file, dtrace_sdt.pc, points at the location
of the sdt.h include file.  We immediately use it in make check in the
installed testsuite, compensating for any install-time changes in the
location of the dtrace libdir.

Further changes will be forthcoming to properly support relocatable
installation.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile          |  2 ++
 configure            |  2 ++
 dtrace.spec          |  1 +
 runtest.sh           |  2 +-
 uts/Build            | 14 +++++++++++++-
 uts/dtrace_sdt.pc.in |  6 ++++++
 6 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 uts/dtrace_sdt.pc.in

diff --git a/GNUmakefile b/GNUmakefile
index b1109727dc66..0fc9b3b5e85c 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -100,6 +100,8 @@ DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
 MANDIR = $(prefix)/share/man/man8
 INSTMANDIR = $(DESTDIR)$(MANDIR)
+PKGCONFIGDIR = $(prefix)/share/pkgconfig
+INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(prefix)/lib$(BITNESS)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
 TARGETS =
diff --git a/configure b/configure
index c423bc82b763..462548bcc69c 100755
--- a/configure
+++ b/configure
@@ -60,6 +60,7 @@ Installation paths:
 --sbindir=PREFIX/sbin				Alias for --bindir
 --includedir=PREFIX/include			#include directory
 --mandir=PREFIX/share/man/man8			Manpage directory
+--pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
 --udevdir=PREFIX/lib/udev/rules.d		udev rules directory
 --systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
 --docdir=PREFIX/share/doc/dtrace		Documentation directory
@@ -130,6 +131,7 @@ for option in "$@"; do
         --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
         --docdir=*) write_make_var DOCDIR "$option";;
         --mandir=*) write_make_var MANDIR "$option";;
+        --pkg-config-dir=*) write_make_var PKGCONFIGDIR "$option";;
         --testdir=*) write_make_var TESTDIR "$option";;
         CC=*) write_make_var CC "$option";;
         CPP=*) write_make_var PREPROCESS "$option";;
diff --git a/dtrace.spec b/dtrace.spec
index 28eeaa478376..1887fcadaed6 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -246,6 +246,7 @@ systemctl start dtprobed || :
 %{_libdir}/libdtrace.so.*
 %{_sbindir}/dtrace
 %{_sbindir}/dtprobed
+%{_datadir}/pkgconfig/dtrace_sdt.pc
 %{_mandir}/man8/dtrace.8.gz
 %doc %{_docdir}/dtrace-%{version}/*
 %{_unitdir}/dtprobed.service
diff --git a/runtest.sh b/runtest.sh
index 3bcd676ea788..cc9703e12c16 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_cppflags="-DARCH_$arch -I/usr/lib64/dtrace/include"
+    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
diff --git a/uts/Build b/uts/Build
index 864b2dfdacbf..feafa21369f2 100644
--- a/uts/Build
+++ b/uts/Build
@@ -14,11 +14,16 @@ SYS_HEADERS_INSTALL := common/sys/dtrace.h \
 
 # sdt*.h are used by programs that contain USDT probes that want to define
 # probes by hand rather than using dtrace -h.  SystemTap has another header
-# with the same name, so we install these out of the way.
+# with the same name, so we install these out of the way and provide a
+# pkg-config file to pull them in.
 
 PROBE_HEADERS_INSTALL := common/sys/sdt.h \
                          common/sys/sdt_internal.h
 
+# The pkg-config files undergo a few translations with sed before installation.
+
+SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
+
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTINCLUDEDIR)/sys,$(notdir $(SYS_HEADERS_INSTALL)))
@@ -26,3 +31,10 @@ install::
 	mkdir -p $(INSTSDTINCLUDEDIR)/sys
 	$(call describe-install-target,$(INSTSDTINCLUDEDIR)/sys,$(notdir $(PROBE_HEADERS_INSTALL)))
 	cd $(uts_DIR) && install -m 644 $(PROBE_HEADERS_INSTALL) $(INSTSDTINCLUDEDIR)/sys
+	mkdir -p $(INSTPKGCONFIGDIR)
+	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
+	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
+		cd $(uts_DIR) && \
+		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
+			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
+	done
diff --git a/uts/dtrace_sdt.pc.in b/uts/dtrace_sdt.pc.in
new file mode 100644
index 000000000000..c5506f9355d9
--- /dev/null
+++ b/uts/dtrace_sdt.pc.in
@@ -0,0 +1,6 @@
+sdtincludedir = @SDTINCLUDEDIR@
+
+Name: DTrace SDT
+Description: DTrace raw SDT headers
+Version: @VERSION@
+Cflags: -I${sdtincludedir}
-- 
2.46.0.277.ge12b8151ed

