Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95BF3CCA18
	for <dtrace@lists.linux.dev>; Wed,  4 Mar 2026 18:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650255; cv=fail; b=o5kjTdqhGZPJm/xJT23GWb2wyd1JMrX9/aNA3zB77DafV2ON/B72rEljuSNfdnCTLvtjgyoVyUSJCR5jgoZUdMxTgtZuWps4bJZPhTMOvPOqZcJxpY9P2QDff5AUQ8I4Z2ZSVCXB5aMN4NdfGDwOB9emYlBAEp381npY/jRa3F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650255; c=relaxed/simple;
	bh=r3thyPXhCGp4owS+R2BXTf7k/DuGq9wIX27QkAc3gGw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=CxQmh3GIUiW5Xv2C6G9DDTO9Z9ftp6uytPU6fz6i3rOuKT/QjvaaPW0zXD4l1Etj50MyMRBjBElviSECokDq7rTqiMueR0if5v/S1F2BQdNkBFWQeqm1b4Wzx1A4gLKTo4i8KkxqMANVa7Q1uu2xiSpaYSLDRlnjC6Bs9rRYEaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IQhppM3f; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DlRPH0JQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IQhppM3f";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DlRPH0JQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624I8ATq2915405
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 18:50:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=42OIu07Cq0dCoAJ3Zx2J6PL6HcKr5FFcjSlJcrGQvNo=; b=
	IQhppM3fiyllOlOsCMIwd2rZcpiPNtDOlHi5iwUJIHm9UUfgHpNJSLWm1uV0H7YX
	qASbYraEdycDEud1WVCr4e1YMMKZ/KmnCFXvX+EHwG9oY2pc+JE2n8LADRpOo0M7
	Wx5R4fCqofqu6OeYKAMsfDARi6RL7qAMFYyj8XGWSi9W8MIGG+Ko62cYLUDY+Upn
	Pv1ffuItII+fxWF4EiDW5cI6uaBfHZ9q11skE85B/yCwDyrBZooCA8uPvt8HU8WE
	AtTAKrubh6odGmNNA4dHWvb277N9Y4U7oq6zWxov1YT9Edd5QNY/dv43gJlniMga
	/XenliATHe6LOxff6C945Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cpsrfg2a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 18:50:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 624H02Oa001482
	for <dtrace@lists.linux.dev>; Wed, 4 Mar 2026 18:50:51 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ckptgfxat-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Mar 2026 18:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUguv1ZRld9mGzcmnfXIfcF2pewJFYLyzU8ohZZJKkWTioJjmrJG1YkIk9bQ8EBjJ5BEVeAsDnaAUpSuVcrN3ywPVIr91OKZh4peNFDGB/cS8Xf6tbf+UU6YzMcurC1Lt4Zi+6q3173sf4j/Qh1abx+YQnVyuVuhhOczFz86v8cIlQUht68aFX79AGNW4ppAqwg5z9TB30BI0jJwfGaYPOhyypvFJy5SMzT9eKRi0lIcEfA0Va0J9X0QjO6RdC9c7Fd6bLZp4MxUZbG+7vZnzG7fI6HqfXG4x5DGBhbdovenez2OGYvQTmVBZVZRz7S+M1TTCAJkL50gMg6Oc4QiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42OIu07Cq0dCoAJ3Zx2J6PL6HcKr5FFcjSlJcrGQvNo=;
 b=bfC1BwXgCq7Wl+zfx0qiy+XFXxfS5q/SZGcsdqZCGROvtE7tlyILEIPxiCoQ8J8gN7mX0f6x6nyBSeHHsfvH1ksClCvMHyNr7FFk0YaSl22cGzcstiejTyv6sHgHBdM5A5M0sHB2RKSe3YuM1rkoqriPHuwA213fdDDHdx1IJ2hQAvntdYemphiXhf+xVgNF8s8Cgh+85N1PNazl4KqTGQw0NXwZCvXxV96B0UgTdRvbsdB85b6aLzzp5wnogyQ1zGnReSujIY3lV75qRfpF9ESakwcsE1ul16sfABtsvqIPMCrh/M9o9Y9F4dsjFSYlUZOiZHP99JFVSCM27+styA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42OIu07Cq0dCoAJ3Zx2J6PL6HcKr5FFcjSlJcrGQvNo=;
 b=DlRPH0JQ6DosKk3J9FWgsyz8R+bDYf15so/ipFLU1ewyFJ/UDRzVLv8YyryS1BlneZc+ssrNq9ymK+/DnKNgetO3hQlkaHlv94zrV5FagTUK1aO0jTsQd6f047z1NwqwE8a0DxR1OjeqHtbd72/cob4Ep9019SQ0U6KLx293r6A=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DS0PR10MB6728.namprd10.prod.outlook.com (2603:10b6:8:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 18:50:42 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 18:50:42 +0000
Date: Wed, 04 Mar 2026 13:50:40 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] configure: accept standard installation directory options
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522D6733324ACDB8A52D983C27CA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DS0PR10MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae8ef80-77bc-45e7-1f0b-08de7a1eef94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	DlEHrKeN0I7g024pg6HyNxgje+BtG5XyupjNIeKAxjrMdaliApY4PxAEtNeFDuO/79xed5/asjnlq1GfqjvhYVoKHTgvq5VDIaJTd/8xP+B/t+xx28DElHiO3nJNq4XTBLSNICCw95Xf1+BRbm17sCIJxfGdA2Pri5PX6yBk9hEbeGJpY36pc9gof2+IJ79AcD1tpjezQoDfWszvcD0wSo6zgPucVRFlbwwB0BDB20pmH2zKgGNfsJIAXx4AuRqefkGJ1j/1yArwRtrX2IZzxhzwm/4Dc7LtXRmFNXNK25wreu6XPbTtQuK293pSIrA1Aw8v7LcpoAZKDMfUk0AAMR5vqY6ewmIITNTWvQf/yJ2YtrxEDV8M0j6RcoQ6wDpuu8L/Lo1+o5ekBPFBNYxyq96usfSbWMe2G38WfihecHFVwR0+EGgf2wGgtW7+qT3aNX6OVgmP5WAWzanQpj7b7u1l53tBIbbjlmCV9bO8VWy/DJT0eriHvLpOdS3c2/aJz7YKp/dL+F5OQ6B/4Pb2YjFshHzZpjV2sU1B8OUDhFzgwquUgfZsN0CfrowTM9xHi02llZWqjPQ6ALbX016Scc3qk5K0R/hgXbK/RW/oCVLXjVz7UgjhU5i8Z82oWJbApSwRlTpwnjfZcXuDIqajK49RSBolIJih7JvXPRJiq5CQmMak39BYWYOnrL8TiwfHEWWWdBAsy+5+1gChLWHstaeVQN32A/hkMbkVOJILRGU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZktXO0bt0nTkD3O1dGRtuwzjXtV1n8sSVFxcAzqWHXlr0R5+WHAv3IHMp7bf?=
 =?us-ascii?Q?n/bPRvjeU/fvVoVTylJ17PB/6ISabHWSkQ6m2z2C4qSF8xAexPpe1r3YZ4FU?=
 =?us-ascii?Q?cDemrB5L22+CveH//bGAcSLpzNL6014LRxTurvBAPFNYNVcc0gtCBZOKI1mT?=
 =?us-ascii?Q?8tvUak/JiAdSMtDDddE70AWXSjTEEiQwOSOEBHmdi+eTscN3JBwXzekKCJYZ?=
 =?us-ascii?Q?izKsiTSi2uDLOGN3JnxJnZbsto96gFUCFuchv7uylfQqB0tLeqwhuY7LkLq8?=
 =?us-ascii?Q?rZjsYr5g8U0kqXDhQo5W4CgGS3D3/VVON9rCSGcioyKy6a2vCNHaYYW9EcVH?=
 =?us-ascii?Q?hwcMSbX5CyfEO2ftl/Hl6ywmkN4uCOgTUvGIGxXv1ZhIoyGd/sFL3sjBwMVm?=
 =?us-ascii?Q?w/3ZvpuYiFZVYOBCKmVuC/mzCXKL8nFxmZC8W6I5ViIxxLB+MmAJN9WP66Ua?=
 =?us-ascii?Q?MOvQQSXytiS9e1/IzEPMAdCUoi3uoDAVPT2Z8ChIUo5bQcu8YiJjHCTxgp6P?=
 =?us-ascii?Q?F0UDvj9XaJSoQVpx9/CrnRmmz01+BVpfX30SJ6kF5dtAbgTVOs3ZUEFc7vPV?=
 =?us-ascii?Q?gkjdbCvEuBrgSfs4E44fE/TW0/l79/n1D/PKn7TpRjdFxvXcXTSw1BjmbO1W?=
 =?us-ascii?Q?xrsq7z2EFKR+yzhGJuD4WAivGPU8z+Quqk3eXnRLiEQPZTrWSzMTvpF3KfVc?=
 =?us-ascii?Q?Vm9f9J1YfgNE5T3rLjhmlErcBTLvUCmGbALHddeO8KxNjefT74QaIW9o6cWq?=
 =?us-ascii?Q?Syb3j819H+Ahi3nyJ+DBPWKIMsN6HJ25yH2i1bYL1CA0Kv+kdkie3yUWJpID?=
 =?us-ascii?Q?aFZskGtiO7V634mkWFh5Dyi5jontdc3SbQYdCOXjWEhmF5a7CBovQ2CezFBK?=
 =?us-ascii?Q?VRH/4W/45J6pkiN77+7b1S7oH6qRNbbNrd+7xQry6DpJWPN+HkeoGFB3WO09?=
 =?us-ascii?Q?TCN/4TltU2Xfq/nOvUBA+TNdPaSuPn2idogyXAiHak7hyqspLhRSM1nsv3ux?=
 =?us-ascii?Q?C7izC6Ck5SsRrU+u5z0bwCqA7vo6uvjXTMpOFcViJ1HDeMnnlfPJIxvI1yqC?=
 =?us-ascii?Q?voHsxdIWc19R15pHo/5rNrNrFCePPOWFy6wRMrL6EwTkLgwFRxuy72PjFvAO?=
 =?us-ascii?Q?QmfjoSBe3bZsUXDtUpDGnjQPW1/K7fK0JfnWFugh+6ixW6e+j1DP5gPFMdNC?=
 =?us-ascii?Q?E0vMlPdkBNeRlgCFDKUV0FKSrJjmyTrvdzx51I1WnJGT1s42HniV1ibi/UtX?=
 =?us-ascii?Q?WIDJD/ZVA3mJnfKDB5Dw39JFAZel0RVBIwKkpKRg9pOAZSL4O3lMUfaLDuv0?=
 =?us-ascii?Q?fJEjRv/4qwmzmBbb7atprI2GEesRXOfzYf7ZCrQx1/YLCQEvwkbl/8J55p+u?=
 =?us-ascii?Q?aBLyQTFjh5zWbSFdbvKmPIhn9GKyeVStlTmkoIeqVYfk81zMC2e3hpbqtjaY?=
 =?us-ascii?Q?mPLsq6tFxCudmIMS9SXAaBlQ8MN+kz8kZ5s0fCV2divfLmVVGDeE0Mh/ms7r?=
 =?us-ascii?Q?mBf3f5N4DrrRb3Zh/t6aCp8fvEU/qpvjtqe6FaW+LeAE8zkFCjPv3Z8/VWkE?=
 =?us-ascii?Q?dQo6ClPCmDFC8SkY0lMAPirvljPBbzy9I9kFqSn1oqmy72nH1hwyS5o/TRp6?=
 =?us-ascii?Q?/qWFuYYIE8yfztPnyZqfmODwBXETM6BVHq4YkIBCoEbUEyhtk2QQU5UO54PV?=
 =?us-ascii?Q?Mofr6mvJwE8O19fOzzv5axHIxqOw71UDfOc2/fC2vOmuTbtTCP/v0Dbaoe8b?=
 =?us-ascii?Q?LQvmIE/9QA=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	lpoGIoB9WR2vNQaE5YRUNYNm+QQ2UMqdbLAaaxG2UgblNs6I+kcaBcaG4c/FXo7rTMJcEFps7cKMuDjSueiWTVu5eyrW2AlA1p58aju2iKTYEd0vuNqaGbwFmDf1U2IAKlgYQYnX/FZxo3Pcw51VECMWIdkdeq2aeX1QjN0FUbruEbsfiCKxMep97ezj2S5d5DOkejW0/vrBjtz+LM6QZlc8X2eB8yRctho1bKAEyqSOhVEapdHulpobnh0swCoH8Z/NGAf7WY4dGP6USDcgfjVxFPKxZPhiKHLIJ73GCbpBDa89zAVD8TiWdf+MOOKjpRmSZbMx5FPFgVbB2Cf45Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lDNNLu7bfeJGru8MNuF8Q2pKIyCQ7h4iLB3ND3mM/Zh3/VC3W2FT8RVP2Sho61EgYgpwW3Z/mXP2nmrPqVC9A1+JTG/F+Hx+iZUhsvvvFj2UQQlDGkSarUTdYB6eW/ttBta6NFxIX+Pn4STCS86rjz+OB8WC2OSoKsm+aTTmTDy8I+jz0PgONCguRksjhwNWrjJLk2A2NayIeKt/uYHRNSi3ZwMBhFeGv1+xqe0h9sBImn/NL+qES4ry12tElns07mEaj171tUd7ibP+BpWn3FBvUkrkwutY8jHLaBvo0EPfzL8N8Q4GV1JLBXHIW1vR5Dxd5Onwt1gemv1i25WnTw8CsZ+OHdyO43QO+Ufj4XgrN2L3vIeCtbkN6VC2mnfAq/VMj9HEGAzpotWwtn8AZo0MZowQWm0BquMnQhPHbh1lLr+t1L/ITiFQLtND8LXWgtZBLfN03vZmSP+PZE+oCIFcB6QX3qtzg/3LNnyWwil1y7UeJ7c0C+wmrZYuhoCEDQTBvuWETA588GS3SMSd+moNOcTNP7CLPr/Myn06EksMUrirgsVrqIca532heR7MA24FhFntyNxLKhM0ZG8Tc/Zo/4sqzvz2qsmmdrAwwjE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae8ef80-77bc-45e7-1f0b-08de7a1eef94
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 18:50:42.2920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42MQT3XvMHeLkiUysgzvnQBVQwY4cjkJl9sNjkPAYqvaG/f0rcHdlP1xrL0+8D4OMZiZawCtt3Jl0fZydlMHCki+zeQA/vWRNcGPyxDm1RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6728
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603040154
X-Authority-Analysis: v=2.4 cv=B9S0EetM c=1 sm=1 tr=0 ts=69a87f0d b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=sYeirsab23co2UPaJZEA:9 cc=ntf
 awl=host:13812
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1NCBTYWx0ZWRfXwlT0ltCKiam+
 1LLcB8Wf0IqNyct3JyfDvUWrUhGo7cbECxe63cw473Liedy3/wq0XbHIkWC2JGDLB8q/VMn0WDg
 oqx+RMHTjlDA+Z9e4BklyCurXk7hVUAoidPnNsd71F+fc9K8X1aN0IqfOzWqTCwWqW0AxuVew6M
 3ZL80oevq7d5Bqf05kA2zI3VAs3Ox5HstYU3uhMSnItxE43O9HDlfdnechc4LO6Pk8z5bFpctNe
 GUmtpyLNwIR1FcyIX1o1hDcBzu6mpg6SNGJ4KVQdMPcLrb4/3uFyz0h37DzPIRT61RGWNUGaNr8
 dNLS1lRMdvyITNWwm4ZG+fhrgmiqyz5E+SvJ4cOAiZMbpsgajHJBtmqklkrHlKjQ95l924yMAYL
 Pkcuc0WQj0U5o7lu62sjim6BFpBhYztGkCy8G54CE1B9//EPobCdUU0TS3q/cxng8i4eyUGK3Cp
 ihWSYP1sn9nU6yucA5N2PYGQdosGrPMitTzmeRkI=
X-Proofpoint-ORIG-GUID: lAH3v7ITg-CvLzEmZLr3f-wC7JgreUCn
X-Proofpoint-GUID: lAH3v7ITg-CvLzEmZLr3f-wC7JgreUCn

Even though we do not use them, the GNU Coding Standards expect configure
to accept the following installation directory options as well:

	--infodir=PREFIX/share/info	Info documentation directory
	--sysconfdir=PREFIX/etc		System configuration directory
	--localstatedir=PREFIX/var	Runtime system data directory
	--runstatedir=PREFIX/var/run	Per-process data directory

This patch also redefines some of the make variables in terms of one
another now that a larger set is supported.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile | 13 ++++++++-----
 configure   | 42 +++++++++++++++++++++++++++++++++++-------
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/GNUmakefile b/GNUmakefile
index 38ae5423..835bc9b5 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -90,15 +90,18 @@ SBINDIR = $(prefix)/sbin
 INSTSBINDIR = $(DESTDIR)$(SBINDIR)
 UDEVDIR = $(prefix)/lib/udev/rules.d
 INSTUDEVDIR = $(DESTDIR)$(UDEVDIR)
-SYSTEMDPRESETDIR = $(prefix)/lib/systemd/system-preset
-SYSTEMDUNITDIR = $(prefix)/lib/systemd/system
+SYSTEMDDIR = $(prefix)/lib/systemd
+SYSTEMDPRESETDIR = $(SYSTEMDDIR)/system-preset
+SYSTEMDUNITDIR = $(SYSTEMDDIR)/system
 INSTSYSTEMDPRESETDIR = $(DESTDIR)$(SYSTEMDPRESETDIR)
 INSTSYSTEMDUNITDIR = $(DESTDIR)$(SYSTEMDUNITDIR)
-DOCDIR = $(prefix)/share/doc/dtrace-$(VERSION)
+DATAROOTDIR = $(prefix)/share
+DATADIR = $(DATAROOTDIR)
+DOCDIR = $(DATADIR)/doc/dtrace-$(VERSION)
 INSTDOCDIR = $(DESTDIR)$(DOCDIR)
-MANDIR = $(prefix)/share/man
+MANDIR = $(DATADIR)/man
 INSTMANDIR = $(DESTDIR)$(MANDIR)
-PKGCONFIGDIR = $(prefix)/share/pkgconfig
+PKGCONFIGDIR = $(DATADIR)/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
diff --git a/configure b/configure
index cb2f585a..96a13137 100755
--- a/configure
+++ b/configure
@@ -53,16 +53,30 @@ help()
 Installation paths:
 
 --prefix=/usr					Prefix of all installed paths
+--exec-prefix=PREFIX				Prefix of arch-dependent paths
 --objdir=build					Build directory
 --libdir=PREFIX/lib64				Library directory
 --bindir=PREFIX/sbin				Binary directory
 --sbindir=PREFIX/sbin				Alias for --bindir
+--libexecdir=PREFIX/libexec			Program executables directory
+--sysconfdir=PREFIX/etc				System configuration directory
+--sharedstatedir=PREFIX/com			Arch-independent data directory
+--localstatedir=PREFIX/var			Runtime system data directory
+--runstatedir=PREFIX/var/run			Per-process data directory
 --includedir=PREFIX/include			#include directory
---mandir=PREFIX/share/man			Manpage directory
---pkg-config-dir=PREFIX/share/pkgconfig		Pkg-config directory
---udevdir=PREFIX/lib/udev/rules.d		udev rules directory
---systemd-unit-dir=PREFIX/lib/systemd/system	systemd unit directory
---docdir=PREFIX/share/doc/dtrace		Documentation directory
+--oldincludedir=PREFIX/include			#include directory (non-gcc)
+--udevdir=PREFIX/lib/udev/rules.d		Udev rules directory
+--systemd-dir=PREFIX/lib/systemd		Systemd config directory
+--datarootdir=PREFIX/share			Arch-independent data root
+--datadir=DATAROOTDIR				Arch-independent data directory
+--pkg-config-dir=DATADIR/pkgconfig		Pkg-config directory
+--infodir=DATARIR/info				Info documentation directory
+--localedir=DATADIR/locale			locale specific data directory
+--mandir=DATADIR/man				Manpage documentation directory
+--docdir=DATADIR/doc/dtrace			Documentation root directory
+--htmldir=DOCDIR				Html documentation directory
+--pdfdir=DOCDIR					PDF documentation directory
+--psdir=DOCDIR					PS documentation directory
 --testdir=LIBDIR/dtrace/testsuite		Testsuite install directory
 
 Options relating to the user environment (may need customization on
@@ -136,15 +150,29 @@ for option in "$@"; do
     case "$option" in
         --help) help; exit 1;;
         --prefix=*) write_make_var prefix "$option";;
+        --exec-prefix=*) write_make_var exec_prefix "$option";;
         --objdir=*) write_make_var objdir "$option";;
         --libdir=*) write_make_var LIBDIR "$option";;
         --bindir=*) write_make_var SBINDIR "$option";;
         --sbindir=*) write_make_var SBINDIR "$option";;
+        --libexecdir=*) write_make_var LIBEXECDIR "$option";;
+        --sysconfdir=*) write_make_var SYSCONFDIR "$option";;
+        --sharedstatedir=*) write_make_var SHAREDSTATEDIR "$option";;
+        --localstatedir=*) write_make_var LOCALSTATEDIR "$option";;
+        --runstatedir=*) write_make_var RUNSTATEDIR "$option";;
         --includedir=*) write_make_var INCLUDEDIR "$option";;
+        --oldincludedir=*) write_make_var OLDINCLUDEDIR "$option";;
         --udevdir=*) write_make_var UDEVDIR "$option";;
-        --systemd-unit-dir=*) write_make_var SYSTEMDUNITDIR "$option";;
-        --docdir=*) write_make_var DOCDIR "$option";;
+        --systemd-dir=*) write_make_var SYSTEMDDIR "$option";;
+        --datarootdir=*) write_make_var DATAROOTDIR "$option";;
+        --datadir=*) write_make_var DATADIR "$option";;
+        --infodir=*) write_make_var INFODIR "$option";;
+        --localedir=*) write_make_var LOCALEDIR "$option";;
         --mandir=*) write_make_var MANDIR "$option";;
+        --docdir=*) write_make_var DOCDIR "$option";;
+        --htmldir=*) write_make_var HTMLDIR "$option";;
+        --pdfdir=*) write_make_var PDFDIR "$option";;
+        --psdir=*) write_make_var PSDIR "$option";;
         --pkg-config-dir=*) write_make_var PKGCONFIGDIR "$option";;
         --testdir=*) write_make_var TESTDIR "$option";;
         CC=*) write_make_var CC "$option";;
-- 
2.51.0

