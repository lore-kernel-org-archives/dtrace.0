Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA8438B12E
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781549972; cv=fail; b=Y9EymBUoTxQuDtiOjjPrqoS0mHAKH14hc6TMxeTExYSpiWf9Z7tnVDcWwoCj2GWF7Byk7bYMQdb+Utxv0SXh9PUB52LdHLR7A/4EwwCEEIe+KKxcnEfT69yRVUF7LcNA8XG8bnbSTSpIPMe4e4qfEnwOXHHHQPB3Q8K4vo8LgS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781549972; c=relaxed/simple;
	bh=PVqpvx73LeR6trYXum1CPL5IgEBao36yE/AL6O1v8cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Axk7fTLXrTXwUkJtbZhUhihNoa+tb5uEpkPsElna8bKWhwzw2qpaIS5TqDpxydLq+tlUwNlnU0Aguj8VHTQJclQu5+icOzxaqQ1RqwgplQgXsgI4BYUCSU3EkTogLTzoVOegGHy2N9rDP8kOnKT4cBlZTdSftIz9exUKfFFw8WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JiJzs9GU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A8Ca93Qq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JiJzs9GU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A8Ca93Qq"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FCMsh11382244
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ljKC5ZT+q9VBW5T2zJ
	/WbQdtTdfrb29fFNo1YUPXAso=; b=JiJzs9GUznAmOJLaonhFom2Kw1LTcYZ+3V
	fTCm8p7d6+O15GwEb7SsX+E51OMXTHV7HG3t4ruNUotBn/kv7/864CW5sNa+WJNR
	R0PkuzD98KgWP9V1xqbFtBJqwyVNPVJckbvJvGOLoKi1BQsjXsaBqkvy6h1/hCii
	13P0xH6ueHGaolQbXN7duxT8ayjGGCgazd74Z7bvRMAbk7ZrbaTJrLtkzqx6V6KM
	2rC6M6Ly+ZLHz5kSJwOESIxWUy78z4oCfztqBHhLU52lgR3LrBTauhRZEd0ekERP
	BXu+E76nb7fbdcQ2uyXZsooOF6VVbiTDsX1MhqE2Pva+gLV1ktKg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1ay3659-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:59:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65FIr8QA030553
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:59:28 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012000.outbound.protection.outlook.com [52.101.53.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4erwnbqyeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Jun 2026 18:59:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1Ryv9VLvhl4IZNafckyU3fbpvg88OG9n4Zhb3zpaqBBlubVWNYdcDvGVRDKQQaAMW1PezCti4ZNldw3gKwdo69NX2LhIWcF/m20SwLEDrQLj2p8T/s+qcmcS1t1xhkcNo9Wv+yAchKNgLOdhwHFUgK8PVb+CnUKSBNSqHW8TDDFaYf0+oCk2DaFsilUgvyE7erqnx0DAAfpjMUk2KpzpkQ0piDRnrc1hC3EFSrdD55YvOPXVL+JZxkg8gziPVSvNUwpo1444Yu+wGSHI+amlnjjwrfYXb0fZNLIEwvRXvlKZ9QQxYnMrbhDA6fvbpPlr0xz6yYj13UdyDnbHAlL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljKC5ZT+q9VBW5T2zJ/WbQdtTdfrb29fFNo1YUPXAso=;
 b=rBWIdMut7Tri+YypY5BDZlOQn2PlzbSGS9LvLI8Zaarcy0f8KleilW5d1M7MrQidfc+yIZ0YxUJ6VweB36Vc2W0rYvLEHsEvBozLCoSDOS+gHSLyOeW9/dN9wndhm/ogTrsSnWVWgkpDYb+9UbIUCf3p4Nfd0AqdboUo6IRS1Of03NHlOz2OTVYmJ77bQTYOVwefo5IlJhufAvKHtcl828OVrIOrY5JKBrzJOEhGBIVLVjwVaw4hZASH5kTdgHgRn6rA2z2ZJoaMG/tJhx6w6XmP7Z7qbkFpWC/l0ePYVnUd9WUmYoWLWDfzZkOG7pfrFE/b/6dKZXELyWswEwgO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljKC5ZT+q9VBW5T2zJ/WbQdtTdfrb29fFNo1YUPXAso=;
 b=A8Ca93QqnEBI26biNccJC/Kz1Qfif/fZfL4fnIOwiR5kj5c7XFVCQunMIJioJBvXC5tMd9+bnLoVV14XIL59CsG/pOovnmt82Zg6ZjJlp2TY8V4R/l9xMzzMcXizD5fhwWpVmNEj7MTQZz0Kx4JeNF5p0yNdeAnD2kVAJnJRCys=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by DS0PR10MB6948.namprd10.prod.outlook.com (2603:10b6:8:144::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 18:58:49 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 18:58:49 +0000
Date: Mon, 15 Jun 2026 14:58:47 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/2] test: Adjust sync timing
Message-ID: <ajBLZwhKTpwXe3VJ@oracle.com>
References: <20260301223943.20324-1-eugene.loh@oracle.com>
 <20260301223943.20324-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301223943.20324-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|DS0PR10MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3cfa85-f59d-4d51-2cca-08decb1022c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|56012099006|6133799003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	hzMAKGz3MiDpwTqDuTgibUpxJUNg3dkRBISfUVgnu8GAYRHFcrADxrcNfxI2uruakgMc0yyrlvTD8SHtRVhMSukI69H/FBHEfGD0KMYaGdUuQYKtAvHVnP/1rW/bD2WppxFwlhMGjLkAGxEEismHEjGLKlP6/0qM2yyoua0U8I++I/Xn6W73k4QY67W/B6rTRIrae95IuS7BdbdjlOpWDW1wfNAOSfkThLUsfIyMVVTFjNzCmyzHoiav5Mmo/UapoobAUnvEek8EmvJ72HlQRJ2CUDFXgxdgoxeTzmTcN/EDqKEV5n3FrXHHiWbEExdB2hPKFoQA1fDxlDNLd3FIqatOHwONSdd8QDo8dVjgemQ9U9rAV8XRcZRxzHSJrusvs7/lk//wd1MEuC3xwUy1KV0QRg8zsx5Nqo7DaRGbMgR0d4YovQwwxnf/n2L9YCPHEEE1/1uP8BTkiPPXALz2wdqPoNbPVs8WyJL+VEmgacndd1DhdYZRUGFJYh2P675eGhJE3EYvVtieSYSMh7w62B9bjWiDIQ8yQxn3dbi1tBKF/4zTeGJ9E1CqojK9UUSi9xVW7t6UN8GWYVcqzm5Q4kRNTWEBhUxYDtCXqkJAIIN3Fg9LM/keJkmzi9nuWFBZmCC5Vglj2SoXTWjzf+jIX55GoFyOnu5yzBB2ZVM86Xp/EUjE27NHgVXjfO98Estj4gpGrizeEaMfARml2LPypw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lqLcHPvS8OUMcI5fRBZenux9bchgCrJmjvBazOeUCiEQzakr63GtHfih1lZ5?=
 =?us-ascii?Q?x3vh4Wg0b4rLwB2tELO+XXDMYlIKhTqrSpG/aS/s047dQlA80ESTz8t55Nij?=
 =?us-ascii?Q?IQjKVvlXKsiY1KzIdkNkvrzXGn5fK5TVdd95Q7+SAloicdEQXodzrvFxm3+c?=
 =?us-ascii?Q?Y2BafVj06yuKI4unLym+kDezn6VVmN50SRyrJkxSaH3QxIli4MIDNThF4T1Z?=
 =?us-ascii?Q?lEsN7AWPRn6DTHQ3X/dMK0M/usbYK00Idk1MPpazRzH4F1m+D8/ZB5ZSuTXW?=
 =?us-ascii?Q?wWKOnTX8qzJ/FVDwkUJIIIE9AeP+u5DVJookzuXU9/q4a5yk1PNXzpBMwcaK?=
 =?us-ascii?Q?iUVJQAcQNwqPCJYsy6mt22eAJMkWNHEaTZstMcwG64ozLWW7WO/QZSeyP7Ax?=
 =?us-ascii?Q?TsqHzPit1dyG8PxZ5LRKZt1m5VeuhvUGdWXZeoFPLUtRSe6QiprduV0jhYCi?=
 =?us-ascii?Q?Kk0sOluW5aCUn0YBs0ONRL9sV9ou9h4EIjOjtHjLW6VRffM32PAF8o6cWo/l?=
 =?us-ascii?Q?zyXWWtt24cl+3ZHnGerMMp08m0bhMSm+z0QWeW9ReEtzEcMyKKrR/VhqICo+?=
 =?us-ascii?Q?zTVV/7My677WDu5OaWhLAtKPIyv6+ppKFQT58ke3zmcD8yQ1nshKQq9bvWPn?=
 =?us-ascii?Q?f/X9GVs0fQfCTp6tXbn15u8y74oC7mfmMAwKRTK5/43zxgJdalVGowCMarAP?=
 =?us-ascii?Q?sw8DMkDZHHx9tAejsrWM9BzZDNWY7G7r+CGsjNlE2cKzbf71+SOEO4dHEQmN?=
 =?us-ascii?Q?u96SwKuLq4VzI7eFt714AcxBaaaKYw+64EJC8/YE+Q9sz+uRwAyp0BuosX60?=
 =?us-ascii?Q?Lo2M9uzHdLen4DPh34TM/DwEQpYHoLvk7OEppeWzLzn8SGc9WVqqpQr0if7C?=
 =?us-ascii?Q?Ayajd0V6Rzel/Od68LucYSEONMEa+MmpgPfiYnYPHGFcNbLj+I+Con+8pXV2?=
 =?us-ascii?Q?R7b8E+9XqYSFNsFQTGby/f9ceJgyg6KOr4X3iw9DgV+Y9CVr75NgR7ty0ywu?=
 =?us-ascii?Q?+nI5XX+0MW84xJ9pf+yVFL+ZQlfqbRCZsGVFSG4HVdxM9V+mlG/bawLzoneo?=
 =?us-ascii?Q?inFdfL9+OChlKieXhhSFZFmuUoA2flv29g8yYE2Gjof3s3dD4jf9QMSJSK22?=
 =?us-ascii?Q?d/q37RhSeeZWgs0TWk62Db6Ow+Mb+aBUqp3tk6B+nDsmlRCViW1pqep4BoMM?=
 =?us-ascii?Q?ezJs6CjBO0hlyNDOI3y8xBC/YRyegChT+wzhqCtELlz9ielIKaCaq5Znjdu7?=
 =?us-ascii?Q?5LJv0lpFP5haJ+bm4Fm5c2pSUjq2UFmj45IDoVqrsFv7lkaYLE44sWBZHhnw?=
 =?us-ascii?Q?xNYEBH+q4VpdOSwcZzVwQO04BWemCIUN3oJ+/+zisIbsM3x56ejF1jgNmsE3?=
 =?us-ascii?Q?dbqTbSPuBQRASB8oWiFLDhp/B43U50h8zAIizYP3eeuhtzVZXGX+5gRlJqX9?=
 =?us-ascii?Q?1qLeOJZ8qrjloOlkvYbIHHRrJ+W+GGU2xiokJB177xRehwghTiFkCd+oybrF?=
 =?us-ascii?Q?w9TeFtXRIDVsEQz1uAhNllNbNtkXGFkjabMbubIsZocnQiuzhvBAjlIjUbuK?=
 =?us-ascii?Q?eVnT9re9FZ3npARKwarzzu9Uu3nW6Ja0JDtTUlfeCINklSRBLcuTAZsHvrXj?=
 =?us-ascii?Q?t0wV5BNDQWKQwxFdVJ09mYLP3EEX3ToblVTa7Lb0SVvFlMmnxKwGanx6XKQ0?=
 =?us-ascii?Q?pwgEKkz9MIbpX5IN8JxMqXbAoNAWCNSq3m6RGunPMc4Ao26/MsESpAGJd4zM?=
 =?us-ascii?Q?ciLFxsdkDQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	lnFfuyVYPaV+kkAM5joZaY4+rjsuML5zEzSi2xntVRVMG46Kd4Nxsw5ajHBMFyOSlKOnfQw29L7BfSMI77lgdiVVrqvditLCleVw/9xag+RALre9hyIrZXuVT32Pv2KuGDPbOITaR9sOLL2zTA7ASMuZHLIMcbSZ913ShcP6dXJOssfiLH+tr7XbiCDCOZVDigRXsFZBODIfh2jVfzucNBngVf4bqa6qWU+zP14EmSHbFP6hlE3LqCiimBGJrIF1fPCJ0ooB7AAlY6Bia9o2Br8zk6JKWms1vGRQLVoU37Yh0UqB0UZl1LRg/oO1JWWS3QO//ERfHWFeApIwq2A1lw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TykFP/MSFyn7IQxnkJgkzDPFfRcyYTq4vP5mkz1o4xOrbhPgC+WAnlMpFU+K3gWrMKfXC4mcfeA2D4ySQv34XeNC0wX9H/k3TTptY7bXSr3Xi2IUaRUzwXxZGqI7J8zs+5pTc4zMXJIMoenDzvjIR36LYwqFCv6gG8OchIlrbERHT7qLv9d4eSLg0+ozNF4HNW7CXGkZHE+wMAJnYo6pdLFfhao8vtNl42GCruu8Dm8jFTAmDVEqkL+9KFN4owKSOyPLbVzcs+hW17VkagEccuA30k22vfEWSFZh8gkSyewuLsK4Xk2KP5kRQCKYWcDmsXeT6EQ2r0rmK5y8EjWkZI6+u5XYxb6mKc4u1N+PTf0Zy7H/kW07bSWtFFNk62TYfZiwT+63RsULysr4Y/xf+IHNv2FW4XlX0y+Wx+YvQd9V+oC9XH5IGeu6kuIiCvv7vBiLfnJExUyGWZJmpx5ctA7orJpJSimHUcWKHtTjv9URHe2zMxGZb6vKdrphxz/Xmm6i+2rEsLR/t5NeOLgTLkkbmN/zr5qaIKOhRSUY4eVW/qfv5nyRCdtoxa6TpW5NYIhQq8SOPbHlC6bDlBsubUtlYtdm/aqbNbw8IcbH65w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3cfa85-f59d-4d51-2cca-08decb1022c6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 18:58:49.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BRtIvD/9HWrXnjCENhT90eZI5ea5gTa3VHMPE1d2TWmWumXdLpP3xUIMM7beNq6A4PSkAgp/v0esCtuo+MidXZ8pcZ/ha0Nmh3iJFpkcR/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6948
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_04,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606150200
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfX+C3Rif359zc+
 YcXt2qtBs3wJf1+L97uOYOUvy5ZXbf90ZwY/Avh/u2bgIhLQqx+75XnTcGhUXVuPesPFPxzL8Ts
 UgWOCw3nzuLuTE8mV8VOE04BChFWmaSgx8F4o1UNCsZnenaAl9Pk
X-Proofpoint-GUID: Gm961AI_bkoGKoNttbqLICpiLbtFLL8A
X-Proofpoint-ORIG-GUID: Gm961AI_bkoGKoNttbqLICpiLbtFLL8A
X-Authority-Analysis: v=2.4 cv=PazPQChd c=1 sm=1 tr=0 ts=6a304b91 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8
 a=LOk4GQnAyCsWxGzPEs8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIwMSBTYWx0ZWRfX17YFUxy417cD
 admoGKIJGRXqceMwEqeDMmtDq6zhP+5uKDuSyG0VqpYGAqVtraTNuatiQmYswyrqtGTCkTW5FFa
 D8LV8XxbJIDd5K44Cz4Xz5ATRjsLmw9Fp/kfwCImuvi8YcOhn1MU/5acauZpAgOJUrjIHq3QOMR
 NG4YVqfHhIdhUYsvQsf59wxt4TdRpsozBWCHyTPlho+6XkbSilHPPCnRLqY9B1kxOdKJBvsD+Et
 VWi8Q6aAoYOdLvengNIIq7jeFgahvUqsjUtPKBAmZuxLSDzk899ZUzCT011uhtQUJO6HTMkdyft
 QTCOek1XMeZTvRU+1vxbV2xCPC7YbrcdQvEFgz/9UI/C7njANElOXHMd689f6sugOUfiDyQ2zK+
 550go4qMukKhRJy6J2GWPyANJpoogziguUJcxlKFxcjEzGfaQl0Ko1fU+c+2S8oAft/17FJKVhY
 0N31qNJn/nwApm98VjA==

On Sun, Mar 01, 2026 at 05:39:43PM -0500, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> The nusdtprobes test was failing rather consistently on systems with
> very large CPU counts.
> 
> The main problem was that dtrace programs with aggregations take a long
> time to start up on such systems.  In particular, gmap_create_aggs()
> tries to create an aggs_$cpu BPF map for each CPU, spending (in
> measurements on one system) about 0.004 sec for each dt_bpf_map_create()
> and 0.011 sec for each dt_bpf_map_update().  When there are hundreds of
> CPUs, the time to start the job up increases by, for example, 5-6
> seconds.  The test waits for dtrace to start up by checking "-e" on the
> output file, but the aggs_$cpu delay occurs after the file is created.
> 
> Add a BEGIN clause to write to the output file.  Replace the "-e" test
> with "-s".
> 
> The test has a sleep before starting a team of processes.  There is
> perhaps no reason for this wait.  Nonetheless, we leave that sleep,
> simply reducing the time to 1 second.
> 
> There is also a delay between launching processes and tracing them:
> 
>   x dtprobed sees newly launched processes rather quickly
>   x dtrace tries discovery 1x/second
>   x discovery is rather fast
>   x starting a newly discovered probe is ~ 0.011sec (on one system)
> 
> For 40 probes, that last step is about 0.5 sec, but the total "sleep 3"
> in the test before killing the new processes is apparently sufficient.
> 
> Make the corresponding "-e" to "-s" change in similar tests, even if
> they have not shown the failure pattern.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

LGTM.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/usdt/tst.defer-Z-basic.sh | 10 +++++++---
>  test/unittest/usdt/tst.defer-Z.sh       | 10 +++++++---
>  test/unittest/usdt/tst.defer.sh         | 10 +++++++---
>  test/unittest/usdt/tst.nusdtprobes.sh   | 10 +++++++---
>  4 files changed, 28 insertions(+), 12 deletions(-)
> 
> diff --git a/test/unittest/usdt/tst.defer-Z-basic.sh b/test/unittest/usdt/tst.defer-Z-basic.sh
> index 61adb4601..fad91e5fe 100755
> --- a/test/unittest/usdt/tst.defer-Z-basic.sh
> +++ b/test/unittest/usdt/tst.defer-Z-basic.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2025, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -22,6 +22,10 @@ cp $trigger main
>  
>  # Start dtrace.
>  $dtrace $dt_flags -Zq -o dtrace.out -n '
> +BEGIN
> +{
> +	printf("BEGIN\n");
> +}
>  testprov*:::foo,
>  testprov*:::bar
>  {
> @@ -33,7 +37,7 @@ dtpid=$!
>  iter=$((timeout / 2))
>  while [ $iter -gt 0 ]; do
>  	sleep 1
> -	if [ -e dtrace.out ]; then
> +	if [ -s dtrace.out ]; then
>  		break
>  	fi
>  	iter=$((iter - 1))
> @@ -79,7 +83,7 @@ if ! diff -q main.out.post main.out.expected; then
>  fi
>  
>  # Regularize the DTrace output, and check it.
> -awk 'NF > 0 { map[$2 " " $1]++; }
> +awk 'NF > 1 { map[$2 " " $1]++; }
>       END { for (i in map) printf "%s %d\n", i, map[i]; }' dtrace.out > dtrace.out.post
>  
>  echo "$tpid main:bar 10" > dtrace.out.expected
> diff --git a/test/unittest/usdt/tst.defer-Z.sh b/test/unittest/usdt/tst.defer-Z.sh
> index ff2c5cbf1..db49cd583 100755
> --- a/test/unittest/usdt/tst.defer-Z.sh
> +++ b/test/unittest/usdt/tst.defer-Z.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -29,6 +29,10 @@ cp $trigger main
>  # Start dtrace.
>  
>  $dtrace $dt_flags -Zwq -o dtrace.out -n '
> +BEGIN
> +{
> +	printf("BEGIN\n");
> +}
>  testprov*:::foo
>  {
>  	raise(SIGUSR1);
> @@ -51,7 +55,7 @@ dtpid=$!
>  iter=$((timeout / 2))
>  while [ $iter -gt 0 ]; do
>  	sleep 1
> -	if [ -e dtrace.out ]; then
> +	if [ -s dtrace.out ]; then
>  		break
>  	fi
>  	iter=$((iter - 1))
> @@ -128,7 +132,7 @@ done
>  # Check the dtrace output.
>  
>  #     regularize the dtrace output
> -awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
> +awk 'NF == 3 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
>  
>  #     determine what to expect
>  
> diff --git a/test/unittest/usdt/tst.defer.sh b/test/unittest/usdt/tst.defer.sh
> index 073af12d5..a1c29571c 100755
> --- a/test/unittest/usdt/tst.defer.sh
> +++ b/test/unittest/usdt/tst.defer.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -39,6 +39,10 @@ lastdigit=$((${pids[0]} % 10))
>  # Start dtrace.
>  
>  $dtrace $dt_flags -wq -o dtrace.out -n '
> +BEGIN
> +{
> +	printf("BEGIN\n");
> +}
>  testprov*:::foo
>  {
>  	raise(SIGUSR1);
> @@ -57,7 +61,7 @@ dtpid=$!
>  iter=$((timeout / 2))
>  while [ $iter -gt 0 ]; do
>  	sleep 1
> -	if [ -e dtrace.out ]; then
> +	if [ -s dtrace.out ]; then
>  		break
>  	fi
>  	iter=$((iter - 1))
> @@ -135,7 +139,7 @@ done
>  # Check the dtrace output.
>  
>  #     regularize the dtrace output
> -awk 'NF != 0 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
> +awk 'NF == 3 { print $1, $2, $3 }' dtrace.out | sort > dtrace.out.post
>  
>  #     determine what to expect
>  
> diff --git a/test/unittest/usdt/tst.nusdtprobes.sh b/test/unittest/usdt/tst.nusdtprobes.sh
> index 93c56e382..5e3a49724 100755
> --- a/test/unittest/usdt/tst.nusdtprobes.sh
> +++ b/test/unittest/usdt/tst.nusdtprobes.sh
> @@ -1,7 +1,7 @@
>  #!/bin/bash
>  #
>  # Oracle Linux DTrace.
> -# Copyright (c) 2024, 2025, Oracle and/or its affiliates. All rights reserved.
> +# Copyright (c) 2024, 2026, Oracle and/or its affiliates. All rights reserved.
>  # Licensed under the Universal Permissive License v 1.0 as shown at
>  # http://oss.oracle.com/licenses/upl.
>  #
> @@ -100,6 +100,10 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
>  
>  	rm -f dtrace.out
>  	$dtrace $dt_flags $nusdt -Zq -o dtrace.out -n '
> +	BEGIN
> +	{
> +		printf("BEGIN\n");
> +	}
>  	testprov*:::
>  	{
>  		@[probeprov, probemod, probefunc, probename] = count();
> @@ -111,7 +115,7 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
>  	iter=$((timeout / 4))
>  	while [ $iter -gt 0 ]; do
>  		sleep 1
> -		if [ -e dtrace.out ]; then
> +		if [ -s dtrace.out ]; then
>  			break
>  		fi
>  		iter=$((iter - 1))
> @@ -127,7 +131,7 @@ for nusdt in "" "-xnusdtprobes=40" "-xnusdtprobes=39"; do
>  	rm -f check.txt
>  	for (( iteam = 0; iteam < $nteams; iteam++ )); do
>  		# Start the team, writing out expected output.
> -		sleep 2
> +		sleep 1
>  		for (( immbr = 0; immbr < $nmmbrs; immbr++ )); do
>  			./main &
>  			pids[$immbr]=$!
> -- 
> 2.47.3
> 
