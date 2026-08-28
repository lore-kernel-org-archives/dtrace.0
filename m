Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAB35975
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944226; cv=fail; b=hYaEZFPGX7eWE7ZWHw2ERYl/enQcXRxFZdLXPc6EmYQSTUGGH8ljyq0W7w4UUx1uFg3FDDSVJWWnRcRG5jfnWHzJFlZ8n31E+1/Z7GstWv2awfb3212g32NnemPf7vhtKY7bZDsIlERyTgqvfTGDjdes7Vwp7BXgFFOVPv+Na7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944226; c=relaxed/simple;
	bh=35ckQdmQQMnQkpMM8IbSr+ChGGXaBpx6aIzUmZw3dz0=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=XWN4k9X1NpCx7/QhQRk6EhQZ1LXeI1uXz4pLxw+0mgsBvQDM4pRq/YVi1RmPFXJkV1HrrP6KpDlmTM0h7gzzefdQ3JsdP366PCcy7pn0JTMiHazuKZ9s9Djj1+ROiyHuHgiEq5kSeA+v29KRCA8DBy4+hK2TQK/UrjZqsvKsckY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BZEl7/0A; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uQU2fyI+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BZEl7/0A";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uQU2fyI+"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHKKxS3689074
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=sexrU2KrResa/kfQZD4n8cbwyJ8JbNNcLDajPEVITlc=; b=
	BZEl7/0AQHcYVouXu1OGb1pRwtjofILH1V61gZXt1mvRuEXEmP0m2cqtO7bCTDlY
	QIIesKdudaUs26Oh+NCypJM2KZKDG9IW+K4v1gYR1UaBNyES73IZMC9vzwoQkf8r
	aHUK2odmnwuc+UGisnMrYrqY5iTt/nZh3nQLaXcRd27z0wx5bVtwzA9HlLyyjvg7
	bvcuus4a6HFHT2vFRSjefotKCqNn8CMvm7QikwnMx92/TSszBnLw1a1aqBR+aIR4
	AJqJi1XlEW+1uh8xb69G9dkpduWTuey0j1eVmF7ihs4lYSIELYv83eiXNC8q9mgI
	OMVFb8iiIfAjIqqnFqA20Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g72pa2j1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SJA7xJ015276
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:23 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g850yxwss-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqsLiaxx+F2Hxfp4uTCRTfD7FzNB7Vp4NUBWnw8dtoQZUQQAfHNDJE4VMZpvDQi+eeojM1cVn2asBvrGo7QWvL7XhMzzhQ7LzACbH1TeZbHrFjS6gWJseGYNr2xRE1runBio2VUeYsbaGAcZlGKCR6fDp2IIUqq17/evSCbubkjcGkH8np3sONF2k+FUhZoV9LS8IZXSTCeCcFusBqUVnkQPvmz17I4lQaGwPU+JdGUlLPFQDw8hj7wGqShJRkh/ZM/iGcnYqGSSOLPFUVuXKWd/W7a8yeGyLgq8b4kQOuxeZXA6N1mZDz6oxNNie4U2WeliAVKvzfMp4FB+D1sdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sexrU2KrResa/kfQZD4n8cbwyJ8JbNNcLDajPEVITlc=;
 b=awalsu7Sh1oVZc2/X47RRrQrULkp+yqnwLCulLCDwYfS/2YCJiR1iPEtaKNZus8GdpFVOPIrQ3j9SaEbZU5IaryCCxKut6bpGecoEuLPbUJMvOFEgBpL8Ck9i8h2QPHTf92SELXYjD4ca1gfEuh/7J03CdeF5cjjpItdTuGyCcmDqRmpjgaEIxI8FOl2pFb0+L8UodHWq/NWCyLrgsRozN+Wu4jb8eKVUCPCSUADpQBoPPqF9E75oLO/e6HasanlR+vd9ua/xyKWwn85ZLSlkKBh1kNwuYHzyh9jcv5y35OFbgx8SK0BAOVP2XW5gkJkMy3iC5S/maiNiP8WU15z9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sexrU2KrResa/kfQZD4n8cbwyJ8JbNNcLDajPEVITlc=;
 b=uQU2fyI+0tqMoXeMowWDux+uJla1RbRjkjca+BJxIk5SWXPiDFE53ip/0aH51nPLizFLH6EFOXDiAQTvZVrFxL2Q+H7h0PJfNVbX8qzqtWbmvmkfCsBaEvyec2mX3by1Eu8BgyDxqYpF85qZCd2Y8kl2y/j4+cw6632G/czhASM=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 IA4PR10MB8397.namprd10.prod.outlook.com (2603:10b6:208:566::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8; Fri, 28 Aug 2026 19:10:11 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 19:10:11 +0000
Date: Fri, 28 Aug 2026 19:09:16 +0000
Message-ID: <546e942ec601bcbf992ee08c77cff42e@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/6] usdt_parser: fix parser pipe I/O error handling
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0018.namprd17.prod.outlook.com
 (2603:10b6:510:324::9) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|IA4PR10MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: f425ebef-d913-4d56-f38d-08df0537fbe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rEmZsx9aVr9PDMrT6dbZxHGH+fd/d/CvSruAxutUx2ywEdLED+u7TT9L3YbaPnW0Bq0ZBQ+MhQWcgBgjt66XkPlTTjkUPviWGXYfxhKEwe88qZnra/NTqPJqu8jbXdM/bLk4dQa32SNREECn/08NeJTxwOVyiwrPCMPKvuQKbvnk6L3sEkAe8qZCHnQxFP74CGNaxWjRODGDLfPbviX5RfE3aDOUhoPaGmKYU4c+8rxJhaXheeY0iA+U5IEWhiX85cg/8SzMRt5J1Bz3o5v8Co4HXKQnnZblpjL/XxLKbifIw8v49SCXPyXJOZnVxPsAIQfs+9vv13TUDrsQMar7htrXRD13eUNlIbxerH/gC5P0gMnDXz8K539Oa7eQdUBAwSz3X5XXDKG/PD5FAU7ijJfYmAcB1jh3KaZzf3CyDViV46jjprcbJJf+5OYvFMIaqCgF1beZeiyrrjrfU+KHa3ErmprxcC1LLb1Vtp7G4b0DvgkH8Ntj/r6eOvu/KL0Hb3VsITRBImpznEicr0nn0fBBpPlBnjiXR3ryeiqnLteukfks6eAHdfaeGnsG05rKsvEochWEnPwBBtOw4bBNV18mu9voR0EuyRaUK2pELITL3oZNc2tamxpG65gZ3n/ysAdR9mBycgBigI5GpiF44wraI4PwG7Dw2tJVys1xR/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C+7Sxxlye9hY5v2G9LSkOwui2Fr2dTxMYC55busEXU2VYH1nsaJyoquV5eaK?=
 =?us-ascii?Q?1J0Zws2IqvHSBxvZx/NDjz+dGSjGCOnIKl8iEXL4B4xLGOnHrQ/7+N+zlo0u?=
 =?us-ascii?Q?1MYIOjnVRbqGF989QGHHjAXQPai01ZE2gDkHn1iwczh5PuacGGDW3XsRrsCn?=
 =?us-ascii?Q?aGcN4CX+XvBA2mqSOr2lY4ph7vel8kziH2LjO8m7Kpu8p/mmbssLPa25Zqb9?=
 =?us-ascii?Q?EOwqN8SUQnYncyTjpzQXsRXuEUzM1ZuzzwMtY5xey1YLIKgwzhkPxBFf7Srx?=
 =?us-ascii?Q?eIYEVghjQlH7bQKc/Rih9tXPbsFmTYiMz9Cf+iH9vLTa92Cr9Pif4d6PuUqy?=
 =?us-ascii?Q?+DCJDIe6LUPX3XYYLrOtxFy6TLMiz6DftUyhi9MEtWUdHNIzszFAoM1KACoQ?=
 =?us-ascii?Q?Ibor03RwC0KkdAKcQnWI19QoMMpFu/B25bB4k7/M1EwHb1HTUB5oR+Nmdvw6?=
 =?us-ascii?Q?TG7uj51SjSh6s+1jwHCZwTrNeFlKxA+FpDifceXUIg3G5raIkcNXFcTD9S13?=
 =?us-ascii?Q?QmZ4FVGituMS/6vjHOWUlgao62QIGdlwGyRbq7PZ5RsgN6MXH+TqYRSYRCAk?=
 =?us-ascii?Q?RX3LdqY9hwlYfO2m9oWB3SkXSunfRQwQSW0o2AkVboJsB6Hh9MXTSZlhK/Em?=
 =?us-ascii?Q?tJ78U0m+/XjWHeOW4SBzzRrojO4OJCvgsK3vGzULpQ4VqQ37UhAfJTvxFi0H?=
 =?us-ascii?Q?CBCPGu9fY1n2o/9sw3XD4QD32Qgc9My8fEpAM2M4o9OT4doffvLgbg9UV1q6?=
 =?us-ascii?Q?aQF8/3z/JqbowURMQZu0HCjCC0DkIm3w3oW0JOA/CTzxGPRsU42f/4AW1sRZ?=
 =?us-ascii?Q?U9+uOxOI3WKxu3kJrhJw9vmfTjQDIHPh1zbfc3dmYicSlv51thSEoXr/w0cC?=
 =?us-ascii?Q?4r37xzQoTXesSTLv4J4Z4N/oXEssrR48DlAmgqkmx9ruoQSYX0H7N4boA88P?=
 =?us-ascii?Q?5gwQ8OupUPY7A8pZrTFFZRW+rw8dmNB5WbWr3VA60oMzipqwyOBXw97WLuBZ?=
 =?us-ascii?Q?FpvoDAPmEKYnjOIpPHef8k+2t9H7It5P/NQzID70egIy475Qudnk+FjEOlUX?=
 =?us-ascii?Q?ziggyd2WRKfIehDRomy71Iu5B83WIWtTHzHJT+eB1cBKDuGJZZF+zIyf8cG3?=
 =?us-ascii?Q?/ixGnrRT/6aXOzxDjF+5HkMwAmkI2XQvLoaAWn1NgWvbv58BM1fghO3jCQAe?=
 =?us-ascii?Q?qk/WNeav3E4IjoOVO9vCX0o58MUyIFgtH/hSGhi8GjnjWelPV8kM13b94eDi?=
 =?us-ascii?Q?iYKG1h8D67rBEmYBSPr5+4beVS6wV0Y8lJddeV0xx/BynXB7+dCgjCOr85M9?=
 =?us-ascii?Q?aKMPAvuVY2BbG3c1XpLhziPzpgbuzinhGkUayQGztT6WFBRjk3kmyGsRxZ2Q?=
 =?us-ascii?Q?fdPZBZ7m6UmBFbgEn6+PCdBdelZCmCDnbl1FojF15Q9y0jlIUtDzel6cB/XM?=
 =?us-ascii?Q?12jYDYyuJD0s31NtuAppg8hzxAy7N67cBZ/JdTu30J/giAwoxLO1dr5Y24Dh?=
 =?us-ascii?Q?1BXexFy7dvlXxsOZI3l8E+H3JDALPplm7GsrwBgicXRYk9Vygpa5Wt8t9hpL?=
 =?us-ascii?Q?lReHbcso5Hfi2OwfMFcvwo8Nt1xhM86mMd7HFBmjaJdEGO3rcMEVnkFnuZR+?=
 =?us-ascii?Q?dx8+lXtxwCqkAwsgBZj1+FoFZTU9cQEUCfBJSEe8sw99vKS5Ga+a7gdcc1il?=
 =?us-ascii?Q?HxgMgqKvNrwK8pu6Q5mwudQEDB5Lrv1RpcaO9WIkudi1/dBFsCQoFqyp9LsP?=
 =?us-ascii?Q?4T+VUGeQHHbOn6xFzqiJwODFQBjdkhM=3D?=
X-Exchange-RoutingPolicyChecked:
	WlOzgsfbAQ8kVsKAnxkfgsI7GgpF/8B+xuhsaJvUnOJ41GvJjcUqXi3tAYHG0gmS513XPRIzInhcCce2Q9pVkA1Q3Fc7cUfgvqnOmYCp8p3iuTTThy55TazdIbMvo5vC9BCuAVnkimgLV3orb2dHwvaq2uspY3kW5GK3EvMYwwt1fppkqfYai/OAEPHQq4Q15De4QyjQTZloCpR3Emm36ztXk2ZU5S8/0S4dhGiwZJvS2VgA/nNun9pUYtEJndta7enjr89HROBDrnjaW2DJ3+9H/utTJzgPpQZnHLYjXgeM8pM3fSlx1jXK3lNdH4WSKaE7vy++4FLVVPmGb0mnrQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cwPZFrtFuDCnHeaqWsNCzC4ZkqlIEZe5Oq5zzExIMHy44hj5/lCjojXxC7BxOaGjkvTk/hNAKgQr5+sqb3vkXnYUzvUItjevDcRe17SanStTY6mFcQ4G03HqQues6/IBvuLLs7dTGlvLxohUTQAxedH9Farh+jEhRP5kglSHVrqoouirVbE7tKb8ZP28tBCr2y80NcZf1A+gPgiFpuydEmQg8ZgTdwH3Y4UZS9dSb07rTMVWVo9x2UARduVj+pxUzci8hpqPgl4dnHd/y0AcJJuvnDN7SCrOXxZiD880+aKxROuvl4ysOLIIGCw4kZIm1Pi9PSRH1j37ohc2jqxtna63jgcfDnFjBzUzpue7juKQ321r91Q4yiMCaZj4na57sRD2krmOvfdy0a9bd4t9iG5reO/ym04qfzcatSQqwFwL/RqfPFzYJIZ/s/Mep+rY0VpCuMGBmyvemY+i8OozAagdzPq7aJG5+3Jb6cMTH5h4tDGxhImqQ4NrkCx42duF/4QnpGQWMjFj0m1K7RJmbfxiflj+hJVGQ0kkP6xlbvyZT3A4rv4KMAyWcRl9QKXWcwSrFD24kJTa2KRcJ9neizbVm4l8h2qMM6ONnBrLXjE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f425ebef-d913-4d56-f38d-08df0537fbe7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:10:11.8460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6QXKMLjhNBYHb7y7cyXmOM4oEUnZ7Qa9g8qj8RZFrTav2sA8tg6JMbvKQE7JbzgbLR7lCm9PzgXT241NYuIANFlxFZwD3LIKySDJVg7t/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280167
X-Proofpoint-ORIG-GUID: xZzVoLQgFhpIdml8LKFt-_2v-csVFNdT
X-Authority-Analysis: v=2.4 cv=EqfiaycA c=1 sm=1 tr=0 ts=6a91dd20 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=yPCof4ZbAAAA:8 a=AMuSwi9o_gtNlSW0J5IA:9
X-Proofpoint-GUID: xZzVoLQgFhpIdml8LKFt-_2v-csVFNdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX4lrAVRg3BeIm
 Kv14vfWXJr5D811ufLrhFzvoiF1YC4pLNwAV0Cj4VmIFbjpimC+OWZpL3uPmOIFxmmqmZHRQ2Pq
 2wrPEGne8zlYjbrng2qnFLWrUXJohY2ndmwWK12eSK/QsILrq35sZt4u/SEzX2isZZjDfA6jDZD
 8RGcCU/0pc40yZ3mktDHCNRmoMZ3CYD2kgSWDw/HJ/Xmh72k1SXE883nIEulPSuUGggZ/8oMznU
 6jKP9RFF2W0TsmxKhopvHmycgIM2Ufmf/0rdmpH7NfHRR6MS1Wp3IeozN1bWH7cH7Ii8WEqYa3Z
 TZrblOi+wHxhoNy80MSpzeh0tooJAyZHmdcShdJigdUtnFljVwl4pAz8s50PDdtnkEbvlg/wiB6
 8gPBwTBF/hL9aFg6Cc/OP7d0LdopLUWtibbronQaVfonK1V1Qiw4KeZIkF2AQArKcDivSKZ9UDh
 7D9kNIZH/zFnAalMJOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX0kexTSmCGdY+
 SbWhQXnhCmZgRsEaWP0bpLByk2dY4hTu5fv8NVb45/1ELJncGZ3IcnPWYGRZXV2Gd068IPs5TOV
 jj77UPlU5+229ds6ldwccJ2bBtDT0FyGYlZaL5AKcuUGtR0A9GhN

Use ssize_t for read() and write() return values, return negative errno
from usdt_parser_write_one() to match its callers, and cap the reply
size advertised by the jailed parser before allocating host memory.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dtprobed.c          |  8 +++-
 libcommon/usdt_parser.c      |  2 +-
 libcommon/usdt_parser.h      | 13 +++++-
 libcommon/usdt_parser_host.c | 84 +++++++++++++++++++++++++++++++++---
 4 files changed, 95 insertions(+), 12 deletions(-)

diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index 81b28e6d..9ce941ee 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -935,10 +935,14 @@ process_dof(pid_t pid, int out, int in, dev_t dev, ino_t inum, dev_t exec_dev,
 	dt_list_t accum = {0};
 
 	do {
+		int parser_err;
+
 		errmsg = "DOF parser write failed";
-		while ((errno = usdt_parser_host_write(out, dh, data)) == EAGAIN);
-		if (errno != 0)
+		while ((parser_err = usdt_parser_host_write(out, dh, data)) == -EAGAIN);
+		if (parser_err != 0) {
+			errno = parser_err < 0 ? -parser_err : parser_err;
 			goto err;
+		}
 
 		/*
 		 * Wait for parsed reply.  If it fails, try once more; possibly
diff --git a/libcommon/usdt_parser.c b/libcommon/usdt_parser.c
index 1dc2fffb..18808b9a 100644
--- a/libcommon/usdt_parser.c
+++ b/libcommon/usdt_parser.c
@@ -71,7 +71,7 @@ usdt_copyin(int in, char *buf_, size_t sz)
 	memset(buf, 0, sz);
 
 	for (i = 0; i < sz; ) {
-		size_t ret;
+		ssize_t ret;
 
 		ret = read(in, buf + i, sz - i);
 
diff --git a/libcommon/usdt_parser.h b/libcommon/usdt_parser.h
index 99fc3033..a8298cbf 100644
--- a/libcommon/usdt_parser.h
+++ b/libcommon/usdt_parser.h
@@ -178,6 +178,15 @@ typedef struct dof_parsed {
 #define DIT_ARGS_NATIVE_HEADSZ	offsetof(dof_parsed_t, nargs.args)
 #define DIT_ARGS_XLAT_HEADSZ	offsetof(dof_parsed_t, xargs.args)
 #define DIT_ARGS_MAP_HEADSZ	offsetof(dof_parsed_t, argmap.argmap)
+#define DIT_BASE_HEADSZ		offsetof(dof_parsed_t, provider)
+#define DIT_EOF_HEADSZ		DIT_BASE_HEADSZ
+
+/*
+ * This is the maximum message size for dof_parsed_t (header + extra data).
+ * Parser replies are derived from one parser input block, which is already
+ * capped at DOF_MAXSZ.
+ */
+#define DIT_MAX_SIZE		DOF_MAXSZ
 
 /*
  * Host-side: in usdt_parser_host.c.
@@ -187,7 +196,7 @@ typedef struct dof_parsed {
 /*
  * Write the USDT definitions data to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int usdt_parser_host_write(int out, const dof_helper_t *dh,
 			   const usdt_data_t *data);
@@ -250,7 +259,7 @@ int usdt_parse_notes(int out, dof_helper_t *dhp, usdt_data_t *data);
 /*
  * Write something to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int usdt_parser_write_one(int out, const void *buf, size_t size);
 
diff --git a/libcommon/usdt_parser_host.c b/libcommon/usdt_parser_host.c
index 80dcf10f..939c66e7 100644
--- a/libcommon/usdt_parser_host.c
+++ b/libcommon/usdt_parser_host.c
@@ -18,7 +18,7 @@
 /*
  * Write BUF to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int
 usdt_parser_write_one(int out, const void *buf_, size_t size)
@@ -27,7 +27,7 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
 	char *buf = (char *) buf_;
 
 	for (i = 0; i < size; ) {
-		size_t ret;
+		ssize_t ret;
 
 		ret = write(out, buf + i, size - i);
 		if (ret < 0) {
@@ -35,7 +35,7 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
 			case EINTR:
 				continue;
 			default:
-				return errno;
+				return -errno;
 			}
 		}
 
@@ -45,10 +45,72 @@ usdt_parser_write_one(int out, const void *buf_, size_t size)
 	return 0;
 }
 
+static int
+usdt_parser_validate_reply(dof_parsed_t *reply)
+{
+	size_t	min_size;
+	size_t	payload_size;
+	const char *payload;
+
+	switch (reply->type) {
+	case DIT_PROVIDER:
+		min_size = DIT_PROVIDER_HEADSZ + 1;
+		payload = reply->provider.name;
+		break;
+	case DIT_PROBE:
+		min_size = DIT_PROBE_HEADSZ + 1;
+		payload = reply->probe.name;
+		break;
+	case DIT_TRACEPOINT:
+		min_size = DIT_TRACEPOINT_HEADSZ + 1;
+		payload = reply->tracepoint.args;
+		break;
+	case DIT_ERR:
+		min_size = DIT_ERR_HEADSZ + 1;
+		payload = reply->err.err;
+		break;
+	case DIT_ARGS_NATIVE:
+		min_size = DIT_ARGS_NATIVE_HEADSZ + 1;
+		payload = reply->nargs.args;
+		break;
+	case DIT_ARGS_XLAT:
+		min_size = DIT_ARGS_XLAT_HEADSZ + 1;
+		payload = reply->xargs.args;
+		break;
+	case DIT_ARGS_MAP:
+		min_size = DIT_ARGS_MAP_HEADSZ + 1;
+		payload = NULL;
+		break;
+	case DIT_EOF:
+		min_size = DIT_EOF_HEADSZ;
+		payload = NULL;
+		break;
+	default:
+		errno = EPROTO;
+		return -1;
+	}
+
+	if (reply->size < min_size) {
+		errno = EPROTO;
+		return -1;
+	}
+
+	if (payload == NULL)
+		return 0;
+
+	payload_size = reply->size - (payload - (const char *)reply);
+	if (memchr(payload, '\0', payload_size) == NULL) {
+		errno = EPROTO;
+		return -1;
+	}
+
+	return 0;
+}
+
 /*
  * Write the DOF to the parser pipe OUT.
  *
- * Returns 0 on success or a positive errno value on error.
+ * Returns 0 on success or a negative errno value on error.
  */
 int
 usdt_parser_host_write(int out, const dof_helper_t *dh, const usdt_data_t *data)
@@ -118,7 +180,7 @@ usdt_parser_host_read(int in, int timeout)
 	 * longer than expected is better than no read at all.
 	 */
 	for (i = 0, sz = offsetof(dof_parsed_t, type); i < sz;) {
-		size_t ret;
+		ssize_t ret;
 		struct timespec start, end;
 		int no_adjustment = 0;
 		long timeout_msec = timeout * MILLISEC;
@@ -151,10 +213,16 @@ usdt_parser_host_read(int in, int timeout)
 		/*
 		 * Fix up the size once it's received.  Might be large enough
 		 * that we've done the initial size read...
+		 * The size is bound to avoid memory starvation.
 		 */
 		if (i < offsetof(dof_parsed_t, type) &&
-		    i + ret >= offsetof(dof_parsed_t, type))
+		    i + ret >= offsetof(dof_parsed_t, type)) {
 			sz = reply->size;
+			if (sz < DIT_BASE_HEADSZ || sz > DIT_MAX_SIZE) {
+				errno = EPROTO;
+				goto err;
+			}
+		}
 
 		/* Allocate more room if needed for the reply.  */
 		if (sz > sizeof(dof_parsed_t)) {
@@ -171,10 +239,12 @@ usdt_parser_host_read(int in, int timeout)
 		i += ret;
 	}
 
+	if (usdt_parser_validate_reply(reply) < 0)
+		goto err;
+
 	return reply;
 
 err:
 	free(reply);
 	return NULL;
 }
-
-- 
2.52.0

