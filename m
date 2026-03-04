Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60C6334C1C
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772655604; cv=fail; b=SC/QtvvWx50e5sJTk09q54ZF0RXRINBFBU9C/9wmFX7Y+BxlwX4lsQE/peH4MHNeeqbPkBmCjq6TEpKF6TJRD0jOeQnJiSmcnqCA7MVpqDWZB/DyRhUlut/CC2RtG9seBtY5kYTLxa+0qzLQ6NjSRPegUtvUCq4fTPgp5zW8GpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772655604; c=relaxed/simple;
	bh=RpyGGDxquVEl15Gfs7fBLSxWsZWoKMJHY5XmWu8210s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=SjAtT1qSSZh4rFcNf4xyF3cqkScdEo1ls7TLjo8MiXRBUuIpsHwdELu/Vdhu7+hC4xYx39+f0MiKPWD9uxs1GGr6uI7RpkQLosrYsBFOeZ2LkxSqh0+nUd+ZnCHfvTCQxsFMnsNK0+5C0Q0e6giOgwE5fFN9/RlS0WJ107pb5PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bmj1lZ0s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DnlfE4a8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bmj1lZ0s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DnlfE4a8"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624JrWdm3034708
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=taNC3bLfGxI3fJoapF
	o3uzQ1stqr/XL2nbZGO+1nPvA=; b=bmj1lZ0se0+qoUaCddjbDtO4BY5iS6nq1R
	EFijckMdjNziRxQ5r44OA5YFlwE8OAjLMkAPiKXWZT7fJWe8GibKQIi5ZF53VlsA
	B5Vh8WFBy9pFvVaqYMGVnaSEog54OuZ8ilieJ/z3Uu14CoDAdTVQv3kK5EkIhaVG
	2Jb8TmwSKfXkoJcicwvRTJ7d6V8RYt+j3DJSzAH2Os7ArRq4W1XTG01q1aBdRU/K
	YLxt8VAS82RKktmTDsHptUh9HVf4jnJTBZ11F+Xg3ZHWUziE1+B5p8pvQfUQzKsF
	cacQdgVn9TU3DsMfoADppWFMfCN+GTlM2XzRCA+Z6/iOGfGFstUA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpu9kr1vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:20:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624IPkL8023465
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 20:20:00 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011047.outbound.protection.outlook.com [52.101.57.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptgjw22-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 20:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaIgtm/47+GknDWnofzCleTgZEbXS0CO+KeNYfNJaLu+4UeRJSwhWKd5iMEFPAjGNzHVMJleqp1qi0d8BTJ1l07XvgbwIQIrPNXOSTZy/aomF2xPpOPOM1WXZZJqyFdbJiXBo8vPmnHv5+b8+ZNRuTro4gyLPNtT12UmXjtIV7dRibSLsgbPHC/6yHOA6kch4xoA/DQmoR5A+HczxYo/iG5py18PK0Gc70Ly6yHWm06XJF+nqeCi/G7m1d28GZZ1L/+hfeh7evn5qXa2AL08KRb8T6P6ddJt1rn8M7fEHGazinOFeoJUgDZuLoJmHFOLBnG4SOBz7qIR2JsW8OB/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taNC3bLfGxI3fJoapFo3uzQ1stqr/XL2nbZGO+1nPvA=;
 b=mQcliydYsmzFPgp2sJxVMC+iZ3jhn2jdF9z4ew3sInR0NXRb64vRe5br6NdI85p2KBugWXW0WNX6a7OXws+VVSopyeIILgaDv8PZGi8mLxJEgXSTdZbrkrmE3U+Eb7GMc/ifOsoHwuqlVLQgkKVzFMgB2pRPTzNhI3wkgffyAjN92FaQb5Ji+NxzqHHP0rUKFY9ah4jFI2H7PlFWiApvEEx+limfbN2rLX3MCwla3hEvKPzxPkxRxMX9W2HHu3Lryzs8vJ02LWci9oovP5LXRkgXFEMsvxOtTqvuWHXklJadQRZUPC/vS6ggQt8poIsB/Q01r52ztx66BX53hGmLYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taNC3bLfGxI3fJoapFo3uzQ1stqr/XL2nbZGO+1nPvA=;
 b=DnlfE4a8BN+Hn47L8mzg5dc9tQ+q3c0vIWOABJK/GFmlUtBs68vTYnbIcuE9kJQEP09hANE3OUfxWRE4CCbxmAYVVwvYAjIRNkV8k5t+5h2nFrGyoGInydfSKazH5Z4a0vcUZG4d/SkDN02RzizGpWq3wcmMGRk08PnNB4QZaEI=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by MN2PR10MB4223.namprd10.prod.outlook.com
 (2603:10b6:208:1dd::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 20:19:58 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::7d13:9138:f4b8:e7e6%6]) with mapi id 15.20.9632.010; Wed, 4 Mar 2026
 20:19:57 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH] configure: accept standard installation
 directory options
References: <DS0PR10MB7522D6733324ACDB8A52D983C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
Emacs: the answer to the world surplus of CPU cycles.
Date: Wed, 04 Mar 2026 20:19:42 +0000
In-Reply-To: <DS0PR10MB7522D6733324ACDB8A52D983C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Wed, 04 Mar 2026
	13:50:40 -0500")
Message-ID: <87eclz73fl.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0689.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::14) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|MN2PR10MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bbf3e7-30a7-478c-3b8b-08de7a2b67ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	Zw8zixrvrx/Ze5UUgiWunJE7xWCuVaMqbPrdn33kovo+gdkyQsaEzP4ss1l0ozXJ2yW2yq1wAw+3Lwa2yLknxUOl+UOKT9a4ecxutqm9PqkcEz/ggcqPId+AoANaVkbLQTLmqYDyL6S0VRrOUK05XU+PljsxaOVqsmEmeYy1vICguuEE0Tt/KEcwR+T8O8bD0n2sYEVS5mk0oplKDw1o60oWxLB/Aa91crICFHxTytrodFUoW5ThTIQHTVrP/gZcZ84fANtqTNp2zPbhWHIsYN3ARo6HOryOS94NlhUA8xbJVAoWAvIaoTh+4Wz6cdHaG33Se69AEuJvrbEK+DaJ/mbC6j6A530oMdpP7msOtJVbzod2HCAKyhi+LJD8ecdSCQxKo1Q9WvRqleX4A/94Aj/XFnt9pLPGyCE1jfMnll62IsfVxlG8X6u9zeIvYn8ApHlLsI6yw2WNmLdgYitAxqKI63SsMSIVwzNXctqjh52AkqhGFm0HuBfaSmOghcuLXGJkVZv1kOKV4IiTqj+/x9rsdhDWrgQ596OGpXHxElGPRrQ9JXgy6s1ukCwfk2c1giBCdPlu9QqOV5I2qRJeUuqnJVC0JVPGumIsUUhetx1JLsfLy62gltaH13ykMN9+WXnCFp1L67K09Xf6XHKfFMbe6PNeZaci3ZqnpFKhL5Qdy+529KNBkwSbriYRkBhb+N9xqNcfECRxE0jU7JWbCGIlOY8e1b29zsEO0K1iQm4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P468tN4eXkjY/JgC84Wm8xfzjd5lKZ3K0b6RA22jbr+f8kMn6kBihIwMA8B0?=
 =?us-ascii?Q?NhpP6YmFlGtGnMTee06rXvfNHP56OlCrZiBOY+akOx7Tm+TPPDoWTeiiDwNP?=
 =?us-ascii?Q?YdDcoYoP6EE0k2Ucv0+fhByCWzsCDLh6u6c0+bBhj1w12LkTPIaICWSrhJwP?=
 =?us-ascii?Q?PPEXwHxC4DcGeAUWdyp8dFOeLHM3er2wyiXRQVsVYcdekKOqlxKFzAUdtozF?=
 =?us-ascii?Q?AC7vIjxY9vCXiIaBiAt9EcQmQMbBgWJzLIloae9A63N8HD3dvBmQSgte1KYP?=
 =?us-ascii?Q?ML/QxzjuUMmghBY3VkHPLIJKe2UIxSMWstP63NIrRq2AevDKvFJiXdXt4Uxm?=
 =?us-ascii?Q?QO9vk7wTppXIvjkMBLmkjkxpyRViE7JZm0FptA9AL/0wc/FUEtuWC4UHTuk2?=
 =?us-ascii?Q?zhItAMVvJ7wgT8Urn2aaaJKUYyho3hQkjOR+TL+s5ynSuqzKt9KdaT3z3X+R?=
 =?us-ascii?Q?ik1kXXMZd7wArMULREpktRJxKPFsvXBskOBSTpfL77hBxdb2AUS3jwIFVcOa?=
 =?us-ascii?Q?n1PXUDCicqcEXxSpAC+nBq6v+Vxa1ohtE7/9uf5xu3D+P6YI5roDIqxTDeMN?=
 =?us-ascii?Q?F9xI6UuBhQ5xvju8eDf76xlsXdaBK3E05CrCOvQuPupYZJK7tbycn1onBmzS?=
 =?us-ascii?Q?ttt+Mh+9cpPUBts+tpNDm9OiVWyGMVuQE3gy5Pe0fif8fottmzovI73CMhBR?=
 =?us-ascii?Q?R+RE4aKycwaRkI6aNlu/xguEfWmeNmjbFBfxzONf0KVJ0AEperYjo3KQ/K+j?=
 =?us-ascii?Q?P8zpfMxMCibsLbQCh9xNjsnha+wXzJda7P4o7xATAkgllovuSoDPo9pti758?=
 =?us-ascii?Q?B0Po4zfEhheH73zhWu8FK7mY1uVyZNZNFmjIK8hIdjK03UlFnUL79SSdsGXe?=
 =?us-ascii?Q?Hc+92vAx0x/LV3+pPOL78kLMNT2VNU+lFLaFk3F2Z4R/6FYOY1izXU20CMM5?=
 =?us-ascii?Q?ef5yqwU2LddYQR7HW9vHUV0tgPww1HavB5LvCArV44hcug3RYZouzCr1t+9s?=
 =?us-ascii?Q?NcPjaEOkCc0WEkAUrcNcDXh2OY8f6YZFBRWfNK07UNYxSTT5g7uQ4pdABvj9?=
 =?us-ascii?Q?/8pN78WRV9obLA1k1efbtLIieDqkSz1HaSu9M4vaXVTQQhsLWUomuqBygW2h?=
 =?us-ascii?Q?uA1GjW8okeAkSTNPjZD/EWVeOuWmlLKBLWQzdKm03/Pk1xtfn/9/E6l/Zlvl?=
 =?us-ascii?Q?yV047cV2Rtx6OIhs4pYCsVMCwzAFmolslrKZcqVIO9jIELrKft+dWRG3UbCY?=
 =?us-ascii?Q?oP58OMKG1RZZKy8VHZtYPeSaczs51ZRnuZbJ0XoKEnG6vEYKC1rsea2R6ijj?=
 =?us-ascii?Q?4ANWGu8T+wUgsNKOkE/pz3IAtFRvHWDOL1ECM5wxta5qvTkRTAFTTNBb5c/I?=
 =?us-ascii?Q?UbkPWiFSoo9FuOe58mZlJbKI/3B9XJHqdZCkKeCXF1OzxgmQfm0oWpBpIMvP?=
 =?us-ascii?Q?h9r+eBwaDUSkZfhYyBBCulKgFT2ASqneKscYSLlXEYt7cB22BszZhoik78GL?=
 =?us-ascii?Q?1bC+hjN0WxxTEw/MTBwNjl7w0x4Qd0/+DycEQX/LcNf7YQfXT6ZBXtsfNYH/?=
 =?us-ascii?Q?FqmLwEST8k/v7DzDmjceMsJ/0Xs0ZQI5EKsf7wYsNzD6tcPZHNasxXCigBE6?=
 =?us-ascii?Q?DTDY2yrPmadisQZKXVn0qFh+E2lFKu/9pqOA6MJObQwj9FdbzNNlcwCYzQ4h?=
 =?us-ascii?Q?uFw1xd11b/wPikpUPPWvDpXHyMu7eov/BO0BoSr1BVJNzHW2SlQ9zUPMPPGy?=
 =?us-ascii?Q?AmGNqVpKeA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	cd3dg9L9SZqIRlSf1zzcy7bUGJhm6Nh2SvR+IuoJ5bJUUqOyrCSq+MkUL47HDFeZGxTwEmIeNjpOEtlXXbShi9J2F458yEvh7v71nu974qePj8wo7f1a2G/1aWJQELSzyERjhntfxWQBH3ts6f7su7yB5D+i2ojtHSBd1u97F54QUL9rOuytSFkDBZzOr/xW/yVqH8pBr9h8Q3A8iHLJizhry1SHHPxg1koDF2As2Qg8a+5ZNlItMv7iI6FFAuyJwZ8JvYQAsmjwPnIjtLn98+UYoS/LAi97/9PbBfD0Idzm0v84ly3ljMytK07bUw1STMLVw1rBUMcDr5e/2h2rWw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EbrKkKSeOIonG9kha/r4aSukYBh1nIUK5i2zyL60NFwcbrVReY8bh98qpcCfN+llve5gJLQPA2SwZIIqDQAgNHg8LsFWuVjHu+DM4wiHavd6rSd4RUiEDtaPqHKAW8b6G83iYNFPtvua9zFxfi6n0AUdZMIr/XTjieqjaCPAFnEWO5McKsmIMFkc63NxRQsc4VhCATpzaHCozdaYQCAmcsagKdf/AOfzzI2TbRgDSb+MYoxWmP3UT/Cl5B+ULacfg+6uKFyU6akK/bpLdYjWhkbjprbL8uData4mxRyTKuexpRx1eZOu0GPzsCe2rA3EtqxTcMhfL56Ae6ZSFHJqDqvOJhy5R+w93q0ws/pINglaEPeUO+6IgDt4Q7KCDvYMQI4jjX/dxbYSE/5+I0TxYN8ssyVhlzcdDsygFzHGu8fa/yP4i60n/Pk6v8QiQMxYO9yqbwM0ECLfM0cARK+WrvDlUNPTuwJccKAlNTdMTdvpni272ZYauSS9N4epvjnyZLxh2Ty6qxZTVDFhEBG/Z/8pyjbXCmeLQQMa6Fxi492ErHfTiL+d6nvdEft1uheXGcE/Nt1/WzT3N9/6BbnjNTw7hg5DJ0Tf0mBdhBRV2IE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bbf3e7-30a7-478c-3b8b-08de7a2b67ab
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 20:19:57.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bv2DKUBe6O91Oz5PsQowoDntypGxsXTlaVZkRaZN4dgoJfgMvgbpAgWdZ2dtCtNTfLz34UCuQP8+urR575fX6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4223
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040166
X-Authority-Analysis: v=2.4 cv=afVsXBot c=1 sm=1 tr=0 ts=69a893f1 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=M8lzWuqH053gUCDIb1wA:9 cc=ntf
 awl=host:12267
X-Proofpoint-GUID: jZ7JfGErbKm6Dyeil8dIQ2sLwxcwFow9
X-Proofpoint-ORIG-GUID: jZ7JfGErbKm6Dyeil8dIQ2sLwxcwFow9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE2NiBTYWx0ZWRfX0BShkDprRYMO
 kt2ufkyDR/jW+jFeS5doPV3N67oTGL6cbOHgWWR7f7Esx2h1Ytt++gDBAfzP2g+qY7menMpf3Dm
 /S35HQBdIyFXOApGKXMnCEo2lcIU3DDINmM7vZS3RlfItToGo4DFmCsmaJHJhFrxHwiHLc8YVKE
 P0+TFGShrYwtVxh6V2S6rDlHCq/94y7uDBDGMAbTLewrwVuPxIWgd4f7m/efbPaoEAjOsL0DEPh
 lSLaFxVVb+G2yerOQciAtb4jwO5uUIVNbeq3ml5EuikQM+NTRpZvxxsjUAPUjMgrurXAifiVz1O
 GB3/yK+kfV1LghgB636xQU9Ww1sBB9STn3V+4Qg83XoZ0iMocgijLqXLQjbawCr0ha1XaIHmuA5
 HlFkMiz/DVAq2r0x086joM2Zeg1Tm388k2cpesbyhtHLY0idS/dGhqluECA9ypESU0XxjzYKVRS
 Ny2QEelLA2ZcU+IXj6Hiv03vuneGjupyaCRaRWW0=

On 4 Mar 2026, Kris Van Hees via DTrace-devel verbalised:

> Even though we do not use them, the GNU Coding Standards expect configure
> to accept the following installation directory options as well:
>
> 	--infodir=PREFIX/share/info	Info documentation directory
> 	--sysconfdir=PREFIX/etc		System configuration directory
> 	--localstatedir=PREFIX/var	Runtime system data directory
> 	--runstatedir=PREFIX/var/run	Per-process data directory
>
> This patch also redefines some of the make variables in terms of one
> another now that a larger set is supported.

Oh, excellent!

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Looks good, but...

> ---
>  GNUmakefile | 13 ++++++++-----
>  configure   | 42 +++++++++++++++++++++++++++++++++++-------
>  2 files changed, 43 insertions(+), 12 deletions(-)
>
> diff --git a/GNUmakefile b/GNUmakefile
> index 38ae5423..835bc9b5 100644
> --- a/GNUmakefile
> +++ b/GNUmakefile
> @@ -90,15 +90,18 @@ SBINDIR = $(prefix)/sbin
>  INSTSBINDIR = $(DESTDIR)$(SBINDIR)
>  UDEVDIR = $(prefix)/lib/udev/rules.d
>  INSTUDEVDIR = $(DESTDIR)$(UDEVDIR)
> -SYSTEMDPRESETDIR = $(prefix)/lib/systemd/system-preset
> -SYSTEMDUNITDIR = $(prefix)/lib/systemd/system
> +SYSTEMDDIR = $(prefix)/lib/systemd
> +SYSTEMDPRESETDIR = $(SYSTEMDDIR)/system-preset
> +SYSTEMDUNITDIR = $(SYSTEMDDIR)/system
>  INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
>  INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
> -DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
> +DATAROOTDIR = $(prefix)/share
> +DATADIR = $(DATAROOTDIR)
> +DOCDIR = $(DATADIR)/doc/dtrace-$(VERSION)
>  INSTDOCDIR = $(DESTDIR)$(DOCDIR)
> -MANDIR = $(prefix)/share/man
> +MANDIR = $(DATADIR)/man
>  INSTMANDIR = $(DESTDIR)$(MANDIR)
> -PKGCONFIGDIR = $(prefix)/share/pkgconfig
> +PKGCONFIGDIR = $(DATADIR)/pkgconfig
>  INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
>  TESTDIR = $(LIBDIR)/dtrace/testsuite
>  INSTTESTDIR = $(DESTDIR)$(TESTDIR)
> diff --git a/configure b/configure
> index cb2f585a..96a13137 100755
> --- a/configure
> +++ b/configure
> @@ -53,16 +53,30 @@ help()
>  Installation paths:
>  
>  --prefix=/usr					Prefix of all installed paths
> +--exec-prefix=PREFIX				Prefix of arch-dependent paths
>  --objdir=build					Build directory
>  --libdir=PREFIX/lib64				Library directory
>  --bindir=PREFIX/sbin				Binary directory
>  --sbindir=PREFIX/sbin				Alias for --bindir
> +--libexecdir=PREFIX/libexec			Program executables directory
> +--sysconfdir=PREFIX/etc				System configuration directory
> +--sharedstatedir=PREFIX/com			Arch-independent data directory
> +--localstatedir=PREFIX/var			Runtime system data directory
> +--runstatedir=PREFIX/var/run			Per-process data directory
>  --includedir=PREFIX/include			#include directory
> ---mandir=PREFIX/share/man			Manpage directory
> ---pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
> ---udevdir=PREFIX/lib/udev/rules.d		udev rules directory
> ---systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory

Did you mean to entirely disappear this option? It would still have an
effect if it was kept.

> ---docdir=PREFIX/share/doc/dtrace		Documentation directory
> +--oldincludedir=PREFIX/include			#include directory (non-gcc)
> +--udevdir=PREFIX/lib/udev/rules.d		Udev rules directory
> +--systemd-dir=PREFIX/lib/systemd		Systemd config directory
> +--datarootdir=PREFIX/share			Arch-independent data root
> +--datadir=DATAROOTDIR				Arch-independent data directory
> +--pkg-config-dir=DATADIR/pkgconfig		Pkg-config directory
> +--infodir=DATARIR/info				Info documentation directory
> +--localedir=DATADIR/locale			locale specific data directory
> +--mandir=DATADIR/man				Manpage documentation directory
> +--docdir=DATADIR/doc/dtrace			Documentation root directory
> +--htmldir=DOCDIR				Html documentation directory
> +--pdfdir=DOCDIR					PDF documentation directory
> +--psdir=DOCDIR					PS documentation directory
>  --testdir=LIBDIR/dtrace/testsuite		Testsuite install directory

Nice!

... really the number of these is quite overwhelming now. I think we
need a little more structure. It might be worth indicating in the help
output which options have no effect, though, since some of them do have
an effect indirectly, like --datarootdir, but some have no effect at
all, like --oldincludedir. I'm honestly shocked --oldincludedir still
exists -- I've never seen anything at all that uses it. Maybe GCC
pre-2.7.x?

Maybe these should be moved to separate --help sections, maybe titled
'Installation paths affecting other paths' and 'Unused paths accepted
for compatibility only'?

> +        --pdfdir=*) write_make_var PDFDIR "$option";;
> +        --psdir=*) write_make_var PSDIR "$option";;

These don't exist in most Autoconf-using programs at all, though they
are in the GNU Coding Standards. But, again, this would be fine with me
if only they were moved into a separate --help section :)

-- 
NULL && (void)
