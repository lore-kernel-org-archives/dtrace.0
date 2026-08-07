Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA31433688A
	for <dtrace@lists.linux.dev>; Fri,  7 Aug 2026 01:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786066169; cv=fail; b=ChdJ8DG5Z8jnBtuqBjVWxC4OsM+2b7IfOkhMAnBzfKZ7M1RjLs8i8Aad9zc8G/o2aiWKmFJGDqWUY3AvB65Y8LLZEYmNeey7Qx97ZPMR2oh1uHvdp1RgBUh61buqpfpPTlshhBSWkMtYkqiFDdnDtmGJgadPTKmmVUP99xAXejI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786066169; c=relaxed/simple;
	bh=9p6JZ1FpfieoXdsnuOmYywAxit7uAnqT4FgTIjDsDGg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RuwVIc3hcmEopLdDUsauksoXN0pyUmvI5GaoW0LO+8jFl6rE0g2eoZKjbr1RKgWzc+qVrkflYjT5jwLn4wv8yBddPhM5CDck8BhSTf1UUZMfVfknGiWXymPyu+O9x3r3PynY2zdIeiSDe4SLOooUue8QbilOQ1NQh7B/cqlmAQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V5LT04Vc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nVkJCrzx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V5LT04Vc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nVkJCrzx"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 676Fu9tE3283532
	for <dtrace@lists.linux.dev>; Fri, 7 Aug 2026 01:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=3SBW5ynPvumKM0NG/knePaxZZ89WASVet5bQ+dlHRYw=; b=
	V5LT04Vcd3enmqG1kF5SkOd/qeaKACqkf4JAuZBRrG371ktflPpCtwpLV5kBqxqa
	AY9qFYe1YZS5W5m2eREAeslm6OWAWBMrH7WQ5IiBZWvnmp/vc3P67ofJEY1/0TAp
	MGJS7OodB/F+JPm6UVowzR8BPB9BHQZNn64or9Aof3E5v0XLJLPTO5wE8Ui53PZR
	WxRT4WsBkqjkdoJURIGkgRkscqujHA29a2nZhrj5I6LASd+CbTr4lQqsBeEtR9Vm
	caQwJFcwj5WOTPb6YKYf3TfjxNZd7kQHGyzsfodCwf5UF2/IUSP+2TrXp+Y+U727
	KAyNsd/M4u5LZvruDFPbjQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4fs8p9ep6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 07 Aug 2026 01:29:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6771Jwt4020466
	for <dtrace@lists.linux.dev>; Fri, 7 Aug 2026 01:29:17 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ftpyvgg7d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 07 Aug 2026 01:29:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhCehnH3Wz/vogVSVL1paQ9xfPDPVFXejlCWEJfpky9+tSItOGXaHaBjM7UpC+KFe6V37CBkXWVSgRYOZEV8Ac7gQarv6uu0/QGwEhOJY0bAvBLl5uafY7Q6pvb1F+F1fsl/iFG2w5wSIb8Rsdd2B1cBR1kpw1QPVF6Wi4XK1S9TxiOSCPT2UU7BlxqW0N7M8FdlKF+Lj6QuvCP4ML3WpEpAdpVBYc56kJlrBuJ+eon7mXj+bkqvNe7lL+ELtv5Zt4N4R7lvtBw2ATkDQKrq4NPQaUuv1VYYOcLKWQvfnnEbwToLK0GslbC+AuGNRpj1SJb1HBSaqXO3SkPSPK4nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SBW5ynPvumKM0NG/knePaxZZ89WASVet5bQ+dlHRYw=;
 b=aulA69qCv8CKYBnRsyVnqIAiF1sBNGz1SprCcApajq+PAVOeoGqck8FUQ4srt5AEPbzkcYmrFGvCFHr82Q47DsMudYFBM12rDJhcQl83uaoNMv90zoFQRQE5B92sKeht9Yt2y6u/+tXzyoZ/7ZS5bQut5lMVQ5XgcHfMRfAlC7BMvr1xNG/Flzg6ktYaWm3095ljjsRzD4hQ1uRVaKt/JrXZMvePlpKDMSXEQ4QGgENxhEu8p3hHGph/TbFb9ayVPDtF6MzbMnW39yQJJP0ZzKO6TLY4qCrgPKzqm2w3uf5oPyaukTHDT+xgws68MXGevXED3u5D6C8lNn6ZEjkj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SBW5ynPvumKM0NG/knePaxZZ89WASVet5bQ+dlHRYw=;
 b=nVkJCrzxYrFCYlHjvdjM5zijSehhoSqs5mGgVb6kybUka4ShHi3sTFYNIH4Prvk2ibPKW61L5FYZbgmWCnVcR3+6L04rvPtwlSwDf300e/f+KqQU9Lqs3lffuaE88IEC3ntu+3sSNDJREITa3/Vy/rW9LRK3qCMvevJhqgJjvTk=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by SA1PR10MB997714.namprd10.prod.outlook.com (2603:10b6:806:4be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 01:29:14 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0292.019; Fri, 7 Aug 2026
 01:29:14 +0000
Date: Thu, 06 Aug 2026 21:29:12 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/2] llm: define dtrace skill for debugging workflows
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Message-ID:
 <PH0PR10MB5514ADEA3D06D25A9A54C002C2D12@PH0PR10MB5514.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|SA1PR10MB997714:EE_
X-MS-Office365-Filtering-Correlation-Id: d1265789-cf20-455a-327c-08def4234a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|5023799004|56012099006|10067099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	l5qhPfVYP2YeDV1jsjGbSWz4OTQ+XtYNRjs5O9TI1EgM08QfovjUc2GdhatPRN/uP3EXKaW20EITnVg7BNLTVhPajASr2SgkQIADPejsYlsnml/wM1AR2Tk67tpGLsKEZ/BdhpsVdgtt4Uw5Rhur/8uqjaddBFuDrQ1msj6gDHJYDCgtShj9/9bD/8rAOukyQe1zMAoSfElV2qUfwhvtj3RfaO+VIiBvkQ92gGnyoh8DVaiR2w3z8SVvfpX70EiQwwcRCBgEAOqN6eb/XxsxFt4o4SxUKnhXn5I3Fnsco1sB+ueqg6EI1F4YM92Yg+YRYOfpVIxePETUNitttHpO6uuN3GNweRGEUHg5jEk/mULrhuKo9UKMbiEoXuNv9nj9gcXQ5tzBqwBchMtc/NJov8Id4FEA3VoSJ59ABTzftqoCM2rbFF4Is+fZb6IFWm90fm8/MsegMnC5NlR8CgZt8dJ1Po1ujL2ZAj/k7tF3F93tK8cOPPgyGpxH9RSsOnicCRF8otLuekUFDJbQyeHYIlNNR9jSTBr0EgZyd5BWZw6pZ7kf0SOw3SPP3H9bmpJYvarhsDlqQciXwM5zXpXZ46KeP0hc8xwkfQuUyoZ6bL8SiBlGKkOSOa3CO46i0NiPwmJsDTDhAal6uoV/ELAGkBverYiaLM2VWS2eyIwCMuY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(5023799004)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L1jbU+Pw2SW8GYyeFgBEpAcSxZjRS+eafUn+XAGVEnmw1q0xqTqlG1BhcvrS?=
 =?us-ascii?Q?YHuexnwjNLIwEutIv/qCHIpfHHTR5atWU1bxV/3Ex6YGgi8ksEBosVJsklwH?=
 =?us-ascii?Q?G1kxPhGojElLnLlTbFvJlqigqc3UBNIOMas1LUNsh3c478znSBvrBMscLl7F?=
 =?us-ascii?Q?DXPYcqoqXE3FYcxo6t30a5fqC4C1imV7w9AapVBCrnUdtkQrAZN4ggZ9LHxe?=
 =?us-ascii?Q?4uJRbTBpo9rZ3OrH7dlv388kqmKa2e4/dI3Yw2hlvgt//NONgNSxoWDB7wQU?=
 =?us-ascii?Q?O+muon/C6SxHPvrLpwfeckq/XjLRsQ+0sq+JZU/TAYlFalkJ2DyBlh0fyKuL?=
 =?us-ascii?Q?S1TCPcuitlezdkfl4X/21SZ6LzfPXzLPRFlMj4yZ/HI2X/iwau0UoHyRNu4h?=
 =?us-ascii?Q?mwewTER5whnGsNzYKiOlM2GJQfiwWfI2TGMVMGcDQU6xEkbLlPA1harKzIrI?=
 =?us-ascii?Q?z8cWgvpQXAYmdVHRwngHncWKdNqweidk9mbfW+KMgk8ndqwf7Di4CopW/6Dr?=
 =?us-ascii?Q?yirvTtShSli2rQ7VpcVklNxxcnmAka9u9xQQl44VziI5rKff+90yFPBzKzDL?=
 =?us-ascii?Q?T6jsz1EwK4uG9wIC5Bad1yQ4ymdokmKVtt4EBHl9grXirUHxptXYhxHKBq86?=
 =?us-ascii?Q?5ooeFg2yyLYbSCm0hlLn9oX70iyDa6nv5N+IcRSoyRdiwD3hx/zDTzpk4xp2?=
 =?us-ascii?Q?ONv065pQ49043ilvIyeun1aTIjffyVynE9amG2UFBdizsdVXnMoiHKe6z/P6?=
 =?us-ascii?Q?ziOmcprdwDeWg2MsY9gUylumfgUCigQCFLNQIkoh7fSBQxfAcc7LYpjMv81T?=
 =?us-ascii?Q?S2F9bOuL6PSMRUmhxBxbdnB5Bjb1gOk55DVrqFvyWzyOiGMUdFOwZOD/utR4?=
 =?us-ascii?Q?+BC2u3GDptboRhP/Wgqh6y7TGpaZMwPZDj4MBGg1pK8S+ja9Rtv7Acd1MpjY?=
 =?us-ascii?Q?7kyf9Ktp4ulxAbm+A0XaA6BuAhxd58yZBx1bM+P+qxKJF6Ce+PteOlRRI3dD?=
 =?us-ascii?Q?XcmzXrhAabn3hCAJzZpDJflN82NFkehxqqC1au1cIlKccNil6lo5O8AzAzh0?=
 =?us-ascii?Q?gBfSH+5t4CzLWarLH6C24B+nY46MOH6C4/IMsuTKtyJ+y9L0itoZ3EIYfhRX?=
 =?us-ascii?Q?jiGF4Wlt/Lsummubeyf4y33SHyzRh8GzgWxvUkM5Gs4EVlYtTa62BW3+aRGn?=
 =?us-ascii?Q?j+2WAKeX0fmSkbzUXGWufgxP6vXFBn69qF74wmXyL74qOS/lfoC2igU7PIYw?=
 =?us-ascii?Q?F7t6I9bEVCOOUDBQ/I7yLoKupZv79zYTcQ6Zd1eV4xTIpKT8jZ+jduhVZY9w?=
 =?us-ascii?Q?y/lXbsg2BCJsWk7z7mph78rFVefLRSDc7s3mQi21lN9/fU10HbEssxvp7ixb?=
 =?us-ascii?Q?B2kek1D9vOjMtMfvfu/zgO3IjYUF65n1mSKs3NMcHQIohY6se1sRuO7xs8x7?=
 =?us-ascii?Q?NXs6GFA4nlgHkDaOIXjEkgk9G+LOMMJ4NZJu1Ujcyoc96+Bkp8Ib2LiZLW/o?=
 =?us-ascii?Q?E8P4XbA1ssKY9BIKiYTmfKLLhO7oUCxXQX15I7k78F/+/B5/xlo0/7upq+yf?=
 =?us-ascii?Q?oau30cCETgok2uLViORa2V06FCwI6m6aHqiUsxM1uWkdnJdnQzVGJCxZ2o78?=
 =?us-ascii?Q?tAsZz3MURjuS4fRf8yApQvYrfj6nHGjQvfGNBApWsh1rCtypktQFi+A9hA1/?=
 =?us-ascii?Q?oUP8MJsmtK9riMdNRlIw2Av1T+FQJq2ks8bqxvRYt7dE4awZ/BjwzbIsz7Ag?=
 =?us-ascii?Q?CjlqQya0Bg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	cS7BKHK39DYlYFDfwbjRZdKjP+O9AKYXm/P2cy1A67e6h5CFeuLq8sB4NtcywY9scRgjFRqL7caujUmeqehFfCkBVOpUDiLupxWF+cwA8RBusUtfW/UZNrJvnYdRGTa22LpcgkqbSxCanpeowPt+hQox88neTNWrGGaKZQnOQPKy0+5jFRSmPQ1A6RC+hOfr8vB6WoAuA8jTGlBuTJaE26TfLq+Hl6f2qQeu9RIfF4R2p35wTGb4TljYq7Rx5QMRkpFlhho6SB0XWXKkBU7GEcnEEitaWtPj1KppC/FTaLFgAfej0wLXjJSCPwHgGfpPRrbegonV4ZEurT9ac6A1jw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9l6BJgFvxsrz6ouNt4pCaBjfAawgW9mhfyjiLGzn9bxUtK0DDnp8sdF70mkkwrxew+Hxw1rBK3K1y5cxBMFOw9AHB9YBz/rZkKhPW7qZtnI/IvFh04Y1xg3Vf7OsLuOOoqWfUpRR8qGC0YvayT6VYXvQiOK9c2qK1ZnK0vWkxfrgEdrFgBeg8D0mQJx385Kob7byYPV+1wvvo3tD8IwBr3lq/sWOVpdNOh2fmM06yrZZJL6blo3EkLDLrbQMOKev8zBRmcJ7B8Ew8FvzGGohutDkaw7sUt4wtiPjgxy8MzqGghcm8YygIC5bZkbxgcb2pb0PV35I2nNxojU0ek/2UjbvklMuRUnc/QYjIOYff7PqG2TarsmF2hvypNnMUF9/pQKnABqZouxWIbUavC1QhkavszSoTrNFvRLTbKbxPnAfLgqj8oIrIIGR+ILTqantj9bHnumS5a7Ixt6rgjmI9uD6nXAB8j/hgVaj4UqgIAK9et3il2LIm0mcDlE8KIw9dDn7Bmh3hPrR9xklKqnkY1jAcETcpsY8QkrJEwvyNU1LF1jUEtQzN4urkCJlpxOZOHf0OgcagsnL2btxu+c9MBhnAtTmSyVZrRHGFALJa3c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1265789-cf20-455a-327c-08def4234a79
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 01:29:14.4650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCb1J+HkPxjzYattMAGsUHnmbIMfvod2biGO8m04cP4aJPAHf/tCuawp9vJV8I0iv3bS1AsOqVr8uEk1wbZn4cCP/Qm7qJ+Zyca4si1Qcfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608070007
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDAwOCBTYWx0ZWRfX/fMYQJCuftLL
 Dsl3UsC7NH58rVDyDd6bz/iMbCtFH0JqY5JcZ5MQlP2FuW51w+9c8ia2HeDY7uOVtqGCE+qdhaQ
 6hCBtWJYgR+q/Qc03Px7f61HiATiqC2CxuZQjuBlsrUFfMh4z8Ae
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a7534ed cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=JDTkagVbYbqXMKGaCPAA:9
X-Proofpoint-GUID: nprffmprKvyTgZynep2zmqVo2XIrL1MP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDAwOCBTYWx0ZWRfX5Tz+GRbyoZhO
 Qhnjz4goOBA9GpcjwQtbXCUM3XO24C9wr0oT3nMmjNU6m+eQqJljMAgLCwxffZgjolbYQsbEKBC
 fbwNYzb0uO2U9s98bk6Qt8OJ2osHTH4m2MdMPX9+K49jMK9FMQKAS3YKp3tRp+Pmrymu55LEQMw
 7/A9PixLoa80N36oz0PHqPtRJqQagJkXCTL5G0FhbwVt9oEfhFKch2hDJrbK2qqPrxLsfw0xReV
 tJRqaY7MUajATFfKEoZB4evVUqp8C8v/YVr7mYMiS/0jbH3KE3wS6No06MkCHwVVMh+4UCTT0tL
 YWagHldavcI2qnX0pha4zQ4TLNMPdGV17dDnO86hXuPhXRNhyjXk52zCUJ4IHJpt0zXLHSTiLUx
 kFNdt9OwvrRa7Kf33Ee3ci3L9scAN3LiCb2gyQ/o4vl0SSbzxiH1h2Qqkieu5j5amPOVsgW5PrT
 7Ct813uH669LF8xtyyg==
X-Proofpoint-ORIG-GUID: nprffmprKvyTgZynep2zmqVo2XIrL1MP

Add llm/SKILL.md as a reusable DTrace skill for agentic coding frameworks that support SKILLs.

Tune the skill for incident response, root-cause analysis, and latency triage.

Require complete runnable scripts and verification before final output to reduce user trial-and-error during investigations.

Signed-off-by: Greg Marsden <greg.marsden@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 llm/SKILL.md | 199 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)
 create mode 100644 llm/SKILL.md

diff --git a/llm/SKILL.md b/llm/SKILL.md
new file mode 100644
index 000000000000..e5e2f3e30605
--- /dev/null
+++ b/llm/SKILL.md
@@ -0,0 +1,199 @@
+---
+name: dtrace-linux
+description: Generate and validate runnable DTrace scripts for Linux debugging and performance investigations in an agentic coding framework capable of using SKILLs. Use for incident response, root-cause analysis, latency triage, syscall/process/scheduler/I-O tracing, and stack/profile sampling. Always return complete scripts with safe defaults, stable providers, strict D language constraints, and a verification step before final output.
+---
+
+# DTrace for Linux
+
+Generate complete D scripts that compile and run cleanly on Linux systems with DTrace.
+
+## Output Requirements
+
+- Return a full runnable D program every time.
+- Include a shebang for script output: `#!/usr/sbin/dtrace -s`.
+- Prefer predicates for filtering and aggregations for volume control.
+- Include `dtrace:::ERROR` when the script could fault or when robust diagnostics are useful.
+- Avoid placeholders, pseudo-code, and partial solutions.
+
+## Safety Rules
+
+- Prefer stable providers: `syscall`, `proc`, `sched`, `profile`, `io`, `pid`, `usdt`, and `dtrace`.
+- Avoid dangerous actions unless explicitly necessary.
+- Do not recommend `system()` unless there is no viable alternative.
+- Treat `copyout*()`, `raise()`, and `system()` as destructive.
+
+## Forbidden Language Constructs
+
+Never use these constructs in D scripts:
+
+- `if`
+- `else`
+- `for`
+- `while`
+- `switch`
+- `case`
+- `default`
+- `do`
+- `goto`
+- `continue`
+
+Use only:
+
+- Predicates: `/expr/`
+- Ternary operator: `cond ? a : b`
+
+## Clause Structure
+
+Use this canonical form:
+
+```d
+probe-descriptions
+/ optional predicate /
+{
+    statements;
+}
+```
+
+- Probe description format: `provider:module:function:name`
+- Omitted fields are wildcard matches.
+- Multiple probes may be comma-separated in one clause.
+- Avoid numeric probe IDs.
+
+## Script Skeleton
+
+```d
+#!/usr/sbin/dtrace -s
+
+dtrace:::BEGIN
+{
+    printf("Tracing started...\\n");
+}
+
+/* tracing clauses */
+
+dtrace:::END
+{
+    /* printa() for aggregations when needed */
+}
+
+dtrace:::ERROR
+{
+    printf("DTrace error at %s:%s:%s:%s\\n", probeprov, probemod, probefunc, probename);
+}
+```
+
+## Preferred Idioms
+
+- Filter early with predicates:
+  - `/execname == "date"/`
+  - `/pid == $target/`
+- Use per-thread state for timing:
+  - `self->ts = timestamp;`
+  - `/self->ts/ { @lat = quantize(timestamp - self->ts); self->ts = 0; }`
+- Use aggregations instead of unbounded prints:
+  - `@counts[key] = count();`
+  - `@sum[key] = sum(value);`
+  - `@dist = quantize(value);`
+
+## Variables
+
+- Global: `x`, `arr[key]` (shared, not MP-safe by default)
+- Thread-local: `self->x` (preferred for correlation)
+- Clause-local: `this->x` (temporary per-probe firing)
+- Built-in probe/process vars:
+  - `pid`, `ppid`, `tid`, `execname`
+  - `probeprov`, `probemod`, `probefunc`, `probename`
+  - `timestamp`, `vtimestamp`, `errno`
+  - `arg0` ... `arg9`, `args[]`
+- Macro vars:
+  - `$target`, `$pid`, `$uid`, `$1`, `$2`, ...
+
+## Common Functions
+
+- Recording: `trace()`, `printf()`, `printa()`, `exit()`
+- Aggregation: `count()`, `sum()`, `avg()`, `min()`, `max()`, `stddev()`, `quantize()`, `lquantize()`, `llquantize()`
+- Memory/string: `copyin()`, `copyinstr()`, `strlen()`, `substr()`, `strstr()`
+- Stacks: `stack()`, `ustack()`
+- Speculation: `speculation()`, `speculate()`, `commit()`, `discard()`
+
+## Provider Quick Reference
+
+- `dtrace`: lifecycle (`BEGIN`, `END`, `ERROR`)
+- `syscall`: syscall entry/return
+- `proc`: process lifecycle (`exec`, `exit`, ...)
+- `sched`: scheduler activity (`on-cpu`, `off-cpu`, ...)
+- `profile`: timed sampling (`profile-N`, `tick-N`)
+- `io`: I/O start/complete
+- `pid`: user-function boundaries in a target process
+- `usdt`: user static tracepoints
+
+## Patterns
+
+Count syscalls by executable:
+
+```d
+#!/usr/sbin/dtrace -s
+
+syscall:::entry
+/execname != ""/
+{
+    @syscalls[execname] = count();
+}
+
+dtrace:::END
+{
+    printa(@syscalls);
+}
+```
+
+Time syscall latency:
+
+```d
+#!/usr/sbin/dtrace -s
+
+syscall::write:entry
+{
+    self->ts = timestamp;
+}
+
+syscall::write:return
+/self->ts/
+{
+    @lat[execname] = quantize(timestamp - self->ts);
+    self->ts = 0;
+}
+```
+
+Target one process:
+
+```d
+#!/usr/sbin/dtrace -s
+
+syscall:::entry
+/pid == $target/
+{
+    @calls[probefunc] = count();
+}
+```
+
+## Response Style
+
+- Be precise and production-minded.
+- Prefer compact scripts with clear predicates.
+- Add brief comments only where they prevent ambiguity.
+- After presenting a script, include one short run command when useful:
+  - `sudo dtrace -s script.d`
+
+## Verification Workflow
+
+Always verify generated scripts before presenting them as final.
+
+1. Write the script to a file, for example `script.d`.
+2. Run compile-only verification:
+   - `sudo dtrace -e -s script.d`
+3. If compile-only is unavailable on the target distro, use a short bounded run:
+   - `sudo timeout 3 dtrace -s script.d`
+4. Treat verification failures as blocking:
+   - Fix the script and re-run verification until it passes.
+5. Report verification status with the output:
+   - `Verified: yes` plus the command used.
-- 
2.51.2

