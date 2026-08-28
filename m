Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8633F399036
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787944228; cv=fail; b=AyZU/5rmGwgbfGqK44fEWj2TomMxF2bnFR9NFxrm0IKK0gUTKqcGw/9YjbznMBS3pIDJ7TA1sPeB89qmt8uPlqMZ/co/WOa0kKynWH+zKiRss0eBGixD5Of38hfFCP76aITJBZBYlldTvHWTRS9JoyrflxkN8hvX1S26DtN2CEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787944228; c=relaxed/simple;
	bh=tjzkpPIBlOcfANjZ4TeWgYLOy/7BHBpAwifEhA2pZws=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=epJ4pMf0iVfIICO2pw2GNPiUMnAr5lrQpztYsvDmCpdTwlKzYWj1Npe9oyMDz6F1iOvMIqopuwFoy3GfAhg06GCmUVFjYFEpUUm9Hrj835tSrkvejdOKS3wPfoSnHj/HkroAl13XncX0FEb6p50hyPy3bVVbMkf04l/v3a1Pks4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CHKy9tGK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p0+dXaTT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CHKy9tGK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p0+dXaTT"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHJivQ3515743
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=/XmQJlsB/cCUrS9YmceG12W6Y0kaHyAHMjxqnsmSWbQ=; b=
	CHKy9tGKz3VsjJ4SuFBxh16pJNkQp5f8uXvAPsD0MXwL4o3ce/9y0BXnJL7PUxlV
	KVyfr4d1T37l7OMOxtWk7kpjdA0rqVOm0+T85fkdPKKz7FKbJzvT0xMoZOK4kEca
	8Qau6s1wA+6fSN4lENMT42YiOquuhnMFvOlC04wNgAiTSrXtzq58BMzT5xs0aGVM
	KJ3kGEJI62tMW2MLVpTmmrkBiay1ohZtNxmqFhUoicKqLr7VhHklA2ynIX5A2OiS
	waLfaCe+rbCiENfKBsu03+yPCMJunHLQLTTFRJrtKij6ZEfWMfxSYX8LNVxlfLUh
	aU7Ttbs8E7Klp65lFPuhwQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g73n7jd0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SJA7xM015276
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:25 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4g850yxwss-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 19:10:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYU+EC957DzfHdqQ8ECaavOX8DJpKHuLS+cltygjxmWq9/JIkXAyRUsqhMKerFg/aoBh51b/WQs01YkUWql8Fv2lAoZ0VodnR1mJahm6x089W81TSgRnEY/6V1q4tZPsHPMdzDhuAR/8pkYmg7vCf5YyXD8dbujiPzEy3Sz0WTHiRicjQmxRsLHeHnazgcXiH1htstdBKn8h5ebAdFJBStlLzsTrYSofX2NCiyHi5YWLux4uY0mudhQ2YPf2dqwoaoyUYjPOZU4sx8qOkhtha3mDStxVEgTukg53Oe4iy4QBddBaEsZSR+XhfXAVGvU/9mX6FeObupsF3U1IyDdgqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XmQJlsB/cCUrS9YmceG12W6Y0kaHyAHMjxqnsmSWbQ=;
 b=CQDQRTVx3EpDhs1IHxz4fOMA6q1VGIN6BnprOW6fwqfSt3Xx6Wz9E4abU+2VMX5nRqow3IU0YXDRhmr61gD9O6I/nWFwyvRQtAW726uSEbPK1aEn/ojfS7fMnSIPwQxapi/vd8JZE9v9IMlpwWXatLwq9tsE191SPYsauLCY15aaf9Zur4N3JUGL5oMap5q+PHyb6UD6xbglOndnHqBKL/ADqzNykr6ZOWKnSQP8+kl+d8mnEQ+Pp8Cm72nf7YYIFU37iCtawFm4sQjxsqQo6lM/qpgMCej/qLVNqZxhNi8hArok8+GNaIMjWA/OQ3zrSld/0rcppH19I4InBoZ4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XmQJlsB/cCUrS9YmceG12W6Y0kaHyAHMjxqnsmSWbQ=;
 b=p0+dXaTTgxSmrrTnjWo6UrNdPO4lxnT9mYHF8AV/BEiPQm31xRcyioTC2wLGns1TvOpP2f2MucrodbzeH9eH6IZ3QGyAZJ7BksSzpC6JrflKcLUM+kUbbJIoq+dUffl5+KHMjtrnYW4U1RenKDYcriZnGqnv1az+pqIkzuUKGdk=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 IA4PR10MB8397.namprd10.prod.outlook.com (2603:10b6:208:566::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8; Fri, 28 Aug 2026 19:10:16 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 19:10:16 +0000
Date: Fri, 28 Aug 2026 19:09:20 +0000
Message-ID: <c330147d9064a35a28bdc2606068251a@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/6] dtprobed: fix dof_stash resource cleanup
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0009.namprd17.prod.outlook.com
 (2603:10b6:510:324::17) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|IA4PR10MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad3523d-5235-427e-4fe9-08df0537fe76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|3023799007|18002099003|17002099007|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	i9JDCrZCZ2ERz/eZIxeqij5vtuG7nVTZLsJbY4778z3r5xITPMGK/1ANfOKyTppfApaRIrAm0S5yYecwUQTBNYwqIXBB3jEL5WSTg9V54F2F583P9ujfilLfeZojlKBNW9UxUwd22cEqYXozX6vAUHj5Ly52C/I5EXAcZjzXrYcuOJ0n7Bhmi0cYPGDP5wNr+TTK4xWNzTfIv0UR/yV4abibsWN7SjMRE6bNy6LW82g+c+ToelU4yPQHLZHKl1CBszTT51/5PvBCl9dosOVcBwz7S64TmhC2NUi3XPnVItJIr4AS53BaeBtRY3n+tmxKHB18IM+qAm00DN7YUVhuozDL3mxs6096m3X39sHhB1viCVWJg6KoDYIqpMdQRcHqJ7Jk05yj/kOdFh7ZvTLsorBi17tH0X32IuJN+6mBMFIbno5pYMl0W8nrRwHEsPlP1Bf78/pp68CuGe2HWuhLd85rVLybq+jsL9d/ywLSCTy+Ze3GK1UUmJwt+IKs+AZ66VU/TGhH91R3pAc7skjVmHABvKSz1P4u2kQXHulOSmwugHnzqyjnqf03g2/PzS/VsFQcV5Y0VjeI4iE8RfudTW7rWfGgCdx7Rzkw4kTB3ULooa0pYbh8dbiS+9cs2t6H47JN05wwHzeObBsF/YmABkYnbZKi52X1mQvU3qwaBYQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(3023799007)(18002099003)(17002099007)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tkS6coa+iMg3Jq2vDCWlcc6FL/9JDn1QjI3KZUI1/+8R8d12cCZA9xEDi9zG?=
 =?us-ascii?Q?jeQ4m4S6M/ipagy9icDQHr2+HGbUxkMuNCvl+wqVdnO09gtX61ioWZ+pxriP?=
 =?us-ascii?Q?AY4iIDsotXsjPvbhLS/RJ8ABH7Py2rKVbA1ugOpbZOmZ4iqE8ldVOAjqD8ir?=
 =?us-ascii?Q?vWX8yTYQA17W+TwfyHBjyuxOtSvlVA9RKg4Vb4vie63EaOhyjfEwC6hqzFkR?=
 =?us-ascii?Q?2sTWV+MeAgIHHfve39sPs96Atc1QQXZxIQqXA29LVRbmHWsyV1Wxm8aYy8E5?=
 =?us-ascii?Q?p+Q6V3yO0lYDrJfeQRdY6WNAEee4EM3BIIL9LiXS9fQkK20zayUwQnbnF4sI?=
 =?us-ascii?Q?Kx9jD4kidR/Chhi3qHCca1escUwv/bed5tHfOwajWQfnvSok54mm2uVRSjGx?=
 =?us-ascii?Q?ADeWR7ZClO98pI/8aBbO1sSLciAAofFdsS1d6EbocUTKFhc7Zf0gvF2QUX+g?=
 =?us-ascii?Q?uyvnK1nerEKV8ZES8t3o7EzI7W7IhuJiSkW2I0+UlzkWCA6kIKOo2IXhhS3e?=
 =?us-ascii?Q?Ejplj8dO+zsrCzQVupAQdM4uvYakJDZgvHCZ8AyqDr63e7828Df8sHJ/nI3b?=
 =?us-ascii?Q?mIq7lxSGyQbYZmCmKSMrF4y1V0l0lLRub8bcjp96BCilkEBy4LnneCuuPgzI?=
 =?us-ascii?Q?G+ErnwD4MM7stIumz5ByipO9ywzkp/a48HhzhZ2V/UJdmUWr7wV0ERE18JbS?=
 =?us-ascii?Q?B1JNcArqPHgtj8YTKCqqeTdGjn2SXsJkBfWGQSGizu2Fy9pR21s/ah91Goh6?=
 =?us-ascii?Q?SxOyyXSKaprGxafju0xPdeGqJCI7dpvL1Xumy9kCHkqP+qykJ2U5hee2sjtf?=
 =?us-ascii?Q?0vMecuoC/1Jw2685eWi/uk7UGHnBIGvwpjaTvvmtirx7V7pEJkbgdoHBh2uG?=
 =?us-ascii?Q?q+M9t61B4rlwMDpj8FcKaMMoG9sVQnsIBvP6eiAIw/v/muXKLVvrhtS6VYF0?=
 =?us-ascii?Q?+cNqwRRDWWHfs8637ohiNdoJxeet3sbaN0tkVwyhBx4+BQGXAcaAXi6ZnKYB?=
 =?us-ascii?Q?0dGN770MhDtFXSeRAQp1ZfDQ8fXP7WXCVTyBXrzRgm9KowlPPPXRWcsSHckj?=
 =?us-ascii?Q?FIwDwasll1gAzu7cmxXGX15Z6OwKze/IvKEwQ2Az3YuAfhFw2lWEbkz+XscY?=
 =?us-ascii?Q?p0V2ZU5NaDEWf9FY2dBK073QJm1oPro5Cp0RHeNcB6gGRO35UcWbF2Le2jbK?=
 =?us-ascii?Q?tVXoJnDFsmF6GUzaIGj9d4WpqfAR39Q24EXz7ntPTp2nznBjC0DiHdYPqSAP?=
 =?us-ascii?Q?6D2xb78WTk+hjEGjGXDbf32j8O8Ei5oCsGfLNlI4Xn+C8Vzt2+m25ANSUjx+?=
 =?us-ascii?Q?nCdD++uYOmxM918MrNv9IFtv1Q8sAHPi0h1nEfJS7K+jQbX/qdbwz8f/AYNn?=
 =?us-ascii?Q?6HrakwGLWtycTkUzgISd9UwyMedunKQas62598/VzHO7gYFmxMIHFqI1vdMA?=
 =?us-ascii?Q?1oMp2RuCZT0ZzvGu3dA9NDN+MDNWT0pQAje+WL4xE0vAW/0e+dDopOK3th0q?=
 =?us-ascii?Q?bxjLDB2XubzlXaQDebT1wFcJfhXekZ4T7+Of2W2evxONgFwchgjFCznZikJC?=
 =?us-ascii?Q?ctIjPfWJFjftPE/an1BmKQVEe357yPs6f+957RGVeRo6tAx4JryWsjOPTBbC?=
 =?us-ascii?Q?QVE77H6GdZMLOJ64cUeMj1cYXdkgxPdNXzR/SMFSckMyP/iF3CSBlNyNxkgw?=
 =?us-ascii?Q?3KEp6Syg0OLpbnPzn+VBb6Wr6Do5IJkjLbdLcpkd46xUR8ID9tcV6JZ5Bg57?=
 =?us-ascii?Q?9Y50wSX73t78LGdsXWo/m0gQrbXkY+M=3D?=
X-Exchange-RoutingPolicyChecked:
	A3Sk1SPXCfku3Ls+xGwY7YO4OCGklrYvzDmiJdzQIp1SYEQUBRbj4+llx7243AU7XRML7sSuASX0jQe9l7NqoIYNehGsglIDwcqfZNmpha0aM2ZIZ+CmMu63dz4fpULcHZtQqLppAgnuXV6X5YggkfKyhQ+ZL3thOYUbTbabU654ZxgqQb7HDRM5vlqb0VXlCl+AuX0abMKtRuW12/PFlPppSVQtKsLQIfZ+wPdRYVAd/tj/i4GSQs6R+E56gvhzVMoRYL8UpCeQXm2oHAif/fukJd16mCQK10sh2PdE5dCP0NKewJihR2qHri4f9XfpLKkRwpGLzdRENMBnazheyQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AOJyXpSes1KOW4SLSup4xdGEuh+YFMuayCHQqGBmDan80w5kx6kfq8zXciaJRMqtNJL38jA1EV/6gOObHiE5ZhbKbJicm659xMUDE5pQYzbkR1o//ZJKCdG77AdU+B5rQLaqcYK14WOyuXOUhfDU5szoPh6WQCItkNmfZ2A9nT6irHJFomRAMs3n+Xu9k230KhFDjDJSy0UOxo9qHBQSav9CPF2eq+QURaMviBpoTJTSM/mnO0vC5T2O8uZusc2Mvl4mHZX6kpHMBVHzatG1fQ0EdMlKbzTZMUEbpTT7M5kiQSqT9iSBUnUGhZeR23TwwyWrYocfXt3/Yi2TjLBp9CiaIgQU99jFl4eIcDZheph7i0wWowy8rZLMnTK9J/iTW1O9Dy/E4lScjFNqZ/kYPiMyvWaLZC2FjHZAh+BwWRT6brRwAnC9mFguDR8XIfKOjBVIib2zyuODDHAhJMpLwT2GIuvmxC2PMJsS/Y79wvHY5ezclKHRhFiu2zidDn3CsUoJaaUt4DgRpxY5y6tmyJB4X+HXT3f1x39HlWUZXS33/K/TKOm8gu5sAd+1KCA0tt/ixA1kAEOrIq11Sp2fGoyMqhRGn70Y0cxi3aEuUQY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad3523d-5235-427e-4fe9-08df0537fe76
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:10:16.1293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12efD5bnsnAI35VynZKi9maoNLnyN8mxA8AZcatalnFPa45k4kAxLg4QC2Ab4ACTBOh7hvNlYTO3JrC3grFZ83NaUWhkFZS6gT3aTWhf1j0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8397
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280167
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX5fmm+VHHj9+K
 002JPvws4QJqZJjCPs0mMkbw3HPhD1NdxyHeS6ucNsawFfi0qwTDTGWMGzFclNHy/+rYcBk4H4S
 bnsa062uN4vqtyWO/zFRdj33MVwilmMwQWbon+p+BZAJ2txjJZGgURpeFiElNKbD4KYsKDftI6S
 8yGB8eHxeH/9XOrLFJppY3fXLKmVZ3mmdYXDB0feuLcvkEbz72QIakQMLS4+ST7pxu7olKlIJgl
 wh+3t2JwfTMjPTeAsHl0aNAHl3QW1aQT1+iPHg7s1No36922xMs9M5Qmxi6R0ta9Oc98TNmC9gT
 8KNy2Mx5c28TXfaG/pHBeiWUxqswC95tKMUI1nCMzYiFwSfJWseIjBcqrCEw1qN/J/CgQPF0MZ9
 VynmSusdth38XYkTOt0tSRJBmOavf78F0f1R6kzH1yaOPjWFBYZP9xBfaFWYhDk3hiULgbksBUq
 jgQaR1wqMEcC884tYrQ==
X-Proofpoint-ORIG-GUID: ze5_ZoZ43U0ApgCz5ZWon8q4aMCgwB18
X-Authority-Analysis: v=2.4 cv=Os9/DS/t c=1 sm=1 tr=0 ts=6a91dd21 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8 a=WelhCq8ezR2u9pqt0_sA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NyBTYWx0ZWRfX+5gYIClI3A35
 lirKayYAspYtmmXyUcx1igMUJgrYbIc79c299HiIsDKhxqAVpS6fVWJ9qWs0+fP0VwcTmUCRaL4
 nRavTjBXyA+6tOyLLaNMkOsUQmIzdzaGeQdtnG0R2MXxHo83JEUv
X-Proofpoint-GUID: ze5_ZoZ43U0ApgCz5ZWon8q4aMCgwB18

Close descriptors and release parsed buffers on every path when scanning
and reparsing the DOF stash.  Treat any non-negative openat() return as
success, clean up exec-mapping and raw-data reads through common error
paths, and avoid leaking mapping descriptors when reparsing can be
skipped.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 125 +++++++++++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 34 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 891d7a69..6e62bdf6 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -304,7 +304,8 @@ make_dof_name(dev_t dev, ino_t ino)
 {
 	char *ret;
 
-	if (asprintf(&ret, "%li-%li", (long) dev, (long) ino) < 0) {
+	if (asprintf(&ret, "%" PRIuMAX "-%" PRIuMAX,
+		     (uintmax_t)dev, (uintmax_t)ino) < 0) {
 		fuse_log(FUSE_LOG_ERR, "dtprobed: out of memory making DOF name\n");
 		return NULL;
 	}
@@ -317,12 +318,41 @@ make_dof_name(dev_t dev, ino_t ino)
 static int
 split_dof_name(const char *dof_name, dev_t *dev, ino_t *ino)
 {
-	if (sscanf(dof_name, "%li-%li", (long *) dev, (long *) ino) < 2) {
-		fuse_log(FUSE_LOG_ERR, "dtprobed: per-pid directory name %s unparseable\n",
-			 dof_name);
-		return -1;
-	}
+	uintmax_t	dev_val, ino_val;
+	dev_t		dev_tmp;
+	ino_t		ino_tmp;
+	char		*end, *ino_start;
+
+	if (dof_name[0] < '0' || dof_name[0] > '9')
+		goto err;
+
+	errno = 0;
+	dev_val = strtoumax(dof_name, &end, 10);
+	if (errno != 0 || end == dof_name || *end != '-')
+		goto err;
+
+	ino_start = end + 1;
+	if (*ino_start < '0' || *ino_start > '9')
+		goto err;
+
+	errno = 0;
+	ino_val = strtoumax(ino_start, &end, 10);
+	if (errno != 0 || end == ino_start || *end != '\0')
+		goto err;
+
+	dev_tmp = (dev_t)dev_val;
+	ino_tmp = (ino_t)ino_val;
+	if ((uintmax_t)dev_tmp != dev_val || (uintmax_t)ino_tmp != ino_val)
+		goto err;
+
+	*dev = dev_tmp;
+	*ino = ino_tmp;
 	return 0;
+
+err:
+		fuse_log(FUSE_LOG_ERR, "dtprobed: cannot derive dev/ino from %s\n",
+			 dof_name);
+	return -1;
 }
 
 /*
@@ -366,22 +396,19 @@ void
 dof_stash_free(dt_list_t *accum)
 {
 	dof_parsed_list_t *accump;
-	dof_parsed_list_t *last_accump = NULL;
+	dof_parsed_list_t *next = NULL;
 
-	for (accump = dt_list_next(accum); accump != NULL;
-	     accump = dt_list_next(accump)) {
+	for (accump = dt_list_next(accum); accump != NULL; accump = next) {
+		next = dt_list_next(accump);
 		dt_list_delete(accum, accump);
 
 		/*
 		 * All parsed memory regions are terminated by an EOF, so once
 		 * we encounter the EOF, this region can safely be freed.
 		 */
-		if (accump->parsed->type == DIT_EOF)
-			free(accump->parsed);
-		free(last_accump);
-		last_accump = accump;
+		free(accump->parsed);
+		free(accump);
 	}
-	free(last_accump);
 }
 
 /*
@@ -972,7 +999,7 @@ dof_stash_execed(pid_t pid, int perpid_dir, dev_t dev, ino_t ino)
 {
 	char *exec_mapping;
 	size_t size;
-	int fd;
+	int fd, rc;
 	dev_t old_dev;
 	ino_t old_ino;
 
@@ -983,20 +1010,42 @@ dof_stash_execed(pid_t pid, int perpid_dir, dev_t dev, ino_t ino)
 	}
 
 	exec_mapping = read_file(fd, -1, &size);
+	close(fd);
 	if (exec_mapping == NULL)
-		goto err_close;
+		goto err;
+	{
+		char *nul, *tmp;
 
-	if (split_dof_name(exec_mapping, &old_dev, &old_ino) < 0) {
-		fuse_log(FUSE_LOG_ERR, "PID %i, exec mapping \"%s\" unparseable\n",
-			 pid, exec_mapping);
-		goto err_free;
+		nul = memchr(exec_mapping, '\0', size);
+		if (nul != NULL && nul != exec_mapping + size - 1) {
+			free(exec_mapping);
+			goto err;
+		}
+
+		/*
+		 * Current exec-mapping files include a terminating NUL, but
+		 * older files do not.  Always append a terminator so the parser
+		 * can treat both forms as C strings.
+		 */
+		if (nul == NULL) {
+			tmp = realloc(exec_mapping, size + 1);
+			if (tmp == NULL) {
+				free(exec_mapping);
+				goto err;
+			}
+
+			exec_mapping = tmp;
+			exec_mapping[size] = '\0';
+		}
 	}
-	return !((dev == old_dev) && (ino == old_ino));
 
-err_free:
+	rc = split_dof_name(exec_mapping, &old_dev, &old_ino);
 	free(exec_mapping);
-err_close:
-	close(fd);
+	if (rc < 0)
+		goto err;
+
+	return !((dev == old_dev) && (ino == old_ino));
+
 err:
 	fuse_log(FUSE_LOG_ERR, "Cannot determine if PID %i has execed; assuming not: %s\n",
 		 pid, strerror(errno));
@@ -1146,7 +1195,7 @@ dof_stash_add(pid_t pid, dev_t dev, ino_t ino, dev_t exec_dev, dev_t exec_ino,
 		 * already-existing file as a do-nothing condition.
 		 */
 		if (dof_stash_write_file(perpid_dir, "exec-mapping", exec_mapping,
-					 strlen(exec_mapping), 1) < 0) {
+					 strlen(exec_mapping) + 1, 1) < 0) {
 			free(exec_mapping);
 			goto err_unlink_nomsg;
 		}
@@ -1765,7 +1814,7 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
 	      int dummy)
 {
 	int fd;
-	usdt_data_t *dp;
+	usdt_data_t *dp = NULL;
 
 	/*
 	 * If the file does not exist, we assume that we have reached the last
@@ -1786,18 +1835,21 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
 	 * to this next pointer and end the block chain.
 	 */
 	if ((dp = malloc(sizeof(usdt_data_t))) == NULL)
-		return -1;
+		goto err;
 
 	dp->size = 0;
 	dp->base = 0;
 	dp->next = NULL;
 
-	if ((dp->buf = read_file(fd, -1, &dp->size)) == NULL) {
-		close(fd);
-		free(dp);
-		return -1;
+	if ((dp->buf = read_file(fd, -1, &dp->size)) == NULL)
+		goto err;
+	if (dp->size < sizeof(size_t)) {
+		free(dp->buf);
+		goto err;
 	}
 
+	close(fd);
+
 	/*
 	 * Raw data blocks are written as a base address (size_t) followed by
 	 * the actual data.  Set dp->base from the data just read, and adjust
@@ -1810,6 +1862,11 @@ read_raw_data(int dirfd, const char *fn, const usdt_data_t *data, int idx,
 
 	((usdt_data_t *)data)->next = dp;
 	return 1;
+
+err:
+	close(fd);
+	free(dp);
+	return -1;
 }
 
 /*
@@ -1930,7 +1987,7 @@ reparse_dof(int out, int in,
 			 */
 			if (!force) {
 				if ((fd = openat(mapping_fd, "parsed/version",
-						 O_RDONLY | O_CLOEXEC)) == 0) {
+						 O_RDONLY | O_CLOEXEC)) >= 0) {
 					uint64_t *parsed_version;
 
 					parsed_version = read_file(fd, sizeof(uint64_t),
@@ -1940,6 +1997,7 @@ reparse_dof(int out, int in,
 					if (parsed_version != NULL &&
 					    *parsed_version == DOF_PARSED_VERSION) {
 						fuse_log(FUSE_LOG_DEBUG, "No need to reparse\n");
+						close(mapping_fd);
 						continue;
 					}
 
@@ -1957,8 +2015,7 @@ reparse_dof(int out, int in,
 			}
 
 			if (split_dof_name(mapping_ent->d_name, &dev, &ino) < 0) {
-				fuse_log(FUSE_LOG_ERR, "when reparsing DOF for PID %s, cannot derive dev/ino from %s: ignored\n",
-					 pid_ent->d_name, mapping_ent->d_name);
+				close(mapping_fd);
 				continue;
 			}
 
-- 
2.52.0

