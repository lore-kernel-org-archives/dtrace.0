Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3660770830
	for <dtrace@lists.linux.dev>; Thu,  9 Oct 2025 21:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760044162; cv=fail; b=fku5HkjzyTSI7f971Gm8pkoqMk45ugQP/LnPzq8RkTBbKWfJ4EsboOCtSRfFt1E4Lc4vvT/fSATwjCSmNr0DB9p1bQQTrTLWeK46gENRGGQY55isLyppH/77U1ayvqp2mL2haALfUzgFXazLr58ciAjMWViscUvd/gu/EyjX9uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760044162; c=relaxed/simple;
	bh=Duwy7eg1CHcCAiGFH3bKeCYIyyavxwRHwgN/Rb3klg4=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JoXqvK4wYLcHEAM+lVNfhJIgsmZ37fZzOZHJcbO5LBpOQOzbEV3W8fO/M98R6iOVtAqdhMGlj7pD9ywbfAIyab9eu+dEcx8JaiHCSfo6yEWlPVMTAPWtPbj8VDoEvXlsyiLGLrEQounCshZ0BKLnbGgzyRQmctUv/GHDxXTjCO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lmy8QYw9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yGpvJ2J8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lmy8QYw9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yGpvJ2J8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Kg3Q9013733
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=VXFc2mMq/g1VK0v6uSW8LFUy1CYrJtx01Ud2xBIetuw=; b=
	lmy8QYw9JVA9ramwIdc1sMpmL9ccJeBs0l+Zhd7t0XFL1goBdV18n340bSMrAkI/
	3zFv+1YOBzg5NUB50jx9NUKscheFixBNEwrMgZfOYFcxkQLFFxkDcHhuPjmtuGmO
	T+s+yh+4VjR2cpTYcUhbJfGjlCDisIyjyV3ttnyrlvmpAvkYsUa+kBkePHnQDU9V
	vm1Y4kPlOkP4WiSjF00FC8HF29akwJRWMd5sRSHpmm46SolF0t9k3KuQGzBosOFh
	nRLTMx95M4mMX6OsrPWV7uB5Bm0UAfPB9VjB/M8yGNy31I7gPoWkpaMyrMrRNCHy
	4l16ggSC1GtR8kwHX3DUAw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nv8pthnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:09:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 599KWk6k010287
	for <dtrace@lists.linux.dev>; Thu, 9 Oct 2025 21:09:19 GMT
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49nv67ersd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 09 Oct 2025 21:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJ10dQeuvbSPuX8m53BhGUncRzP4ZVdlMYPr9fTeiM26n0rflrY2626N5Qt0O2YIvwS6dA67pLCcUvLFi82XF9UpWamSMOgYIKl5qKZVFyya4ckJwoWvrtKof56+QuafqOthCNOvjTso4gCSG2JEFfnpiEtVhTTd0jHS7MgFCeULuiRrfVbOInS41uEFR42kXDFjXA5yKVuhkwDAavqU1O5p59e/jDwhnR82EBF8vyjMyglgSriVdqmCDwm7VbiPwKzxlzToawlTz92rF61MKTXXdCakx6iCA6Q/0bfCE1k3HaRQ2obs/PVCdDJSfOWTBqpP7m8Y9g0ubA8+45VEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VXFc2mMq/g1VK0v6uSW8LFUy1CYrJtx01Ud2xBIetuw=;
 b=E5FVZ5m+8AM8xyRq39P/AWwenna5vw057/Pe1ilb6fud60Gpma7+gd4gBurPrFtRX7TmJg8zasCYOGqoTPrlDhOwoyvf822AjtmSaSqNDsOSUKwJmpaNCD7ibOm+t3/bgB66OeG2dODTm1aoO8TYl63T2wG89dCnXyvvz/e9Hcz8/84hDkBK8yOcIiaB7pEfZKXqfTDUydb4JTBYhFq/KaDXmj28R4/tKS1hT9yMQ0guCp10S61FeD79RKBE/GKyNTmQqbtUkQCXTShwMPtjnISm9uqiEDj/ZcYPlEFbhHTSC2FWUtgI8SBFc4rEPybwX2EOTZcrc23XDjugASI7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VXFc2mMq/g1VK0v6uSW8LFUy1CYrJtx01Ud2xBIetuw=;
 b=yGpvJ2J8PUBgyS7F/qyRGieEVbno9sKwPmYdDjrEpPWwiyYbb65mfnjINWrADnTsDah/7Ty1SEcDL4t//M1FLvgBuYWeA2vevua47kpzN7lE0yJCssFKsTl2OTe+PfD911u+3dHN2PxHHYy9LZBJrT9HvkrUe+LHBXprseGJK5U=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by IA4PR10MB8634.namprd10.prod.outlook.com (2603:10b6:208:56a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Thu, 9 Oct
 2025 21:09:17 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 21:09:16 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Account for large stack-limit kernel parameter
Date: Thu,  9 Oct 2025 17:09:14 -0400
Message-Id: <20251009210914.30382-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|IA4PR10MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d5e9d8-20ff-491a-3771-08de07781b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nx9khMyPM6ZZKMnlfKHSnfg7bUIDT0ry5j5uCUq5oFqcnn5eytQc3L6L/Xzl?=
 =?us-ascii?Q?ChSb0knJ1G3hhssqyOU8IF4muuMDkfuv6xxIlvLjBHBY+Jxd8T2I3PxrlUys?=
 =?us-ascii?Q?CPEA75E/zcT1kd6nzjt9F9c/bDr0V9CunG4bIf7tGXs11KJixGCjfmMxmPYQ?=
 =?us-ascii?Q?1WzHD2bLKvkXc++Z4QI6UYtXbvghfcgH+qaYYvI+FzHm0eMVFSrhBeLkZOwS?=
 =?us-ascii?Q?eaNu1RdCsfb66ZGQQLJ6SS7YVbagcpVUpagjGvyX8nc5YCVmXQSw1a/L6iIv?=
 =?us-ascii?Q?UaALO+0fk3ymDnW8L3MgyaGzK1760rbQs2IUxp+1zm6u2IcehPNF2w0/x4sG?=
 =?us-ascii?Q?8Mt1dNTu6briRW/VFITi3gmmEDyD5XKsmY8PZfGXjLfisVcBeMN/sL0PCgSn?=
 =?us-ascii?Q?BihknknXg+wCnFg+Z/n/yOMtGFZfYXp6J23KrSl9vjKb6q4sAjLemsDgLiZ9?=
 =?us-ascii?Q?KxbVg9k5y23+XadF9QCsYTd3szdCHKX9UFhj3SeO8n9iiodUqTZKcfkjeHTt?=
 =?us-ascii?Q?HLGwMN1MDNthaE1yNpSHZJTpK1ipWuQfDSmP69ao3XbdG8C7ckaLjfPMv/Em?=
 =?us-ascii?Q?DZSsZG41YkYR4OiF/pcpyB94JdAm+nMxImuogZNVXRb7clGmlomvC+7LcXYI?=
 =?us-ascii?Q?Japqh4J3DHLv8GqCYwrdGeIpcN4oufiHP+O/pB7wpQnN0hw8G4D96hGLUH7p?=
 =?us-ascii?Q?To0jp0mx5DgdBssgkMlnYVJfJJ3w7GVKL0gn9WMN11TaQWPtoa54f1z722AG?=
 =?us-ascii?Q?nOkP1iovRZYB4agZwgZWZmHGEhaEq/TQ0CuXDEIXiCSJNomMG2hgeRciwWEU?=
 =?us-ascii?Q?Ph3yt4nYGmvZV1A9GoKVgqqSohnFKTn7LGja7jsk8SWykYpbwuDaPJlrbi+9?=
 =?us-ascii?Q?FeezZC+Zlfdgn0R5VbcADq9r8OChxFd8+8OSxZX72/slAblyg2FXWBJuPfJQ?=
 =?us-ascii?Q?ngajHLynjPENB6rQ1xkLX71EYGBW2X76VqwOZm5K4QXH+/vhEv1286rCAdX4?=
 =?us-ascii?Q?ojQ96BXoMH2g3MsMPdjeSwCGm7CaAqMWAodrOUP3ZVyuJejbJLR+1ofqSCle?=
 =?us-ascii?Q?OTDthMcmdxUfaA0hpiawo4n0c0b3avbvusQDczdB5tOOs2+JEm1arkkcIWB1?=
 =?us-ascii?Q?1RjD7FgwNAIYAJQGVXvag7Hzlr6jrnZeyep52YUbBtmgBHxqEvu+CQ8vyCzu?=
 =?us-ascii?Q?N93XL4Tm+yCYc8ElscZgxlgzU3g99gH0KLb1ZXQn9/uoEq0I8srUQQhDcX4M?=
 =?us-ascii?Q?sz7ZjgjWFbdShhzLGvQ/GV1ys5osQsisK+MDB7e9O8UgQTew7qp7cY4OA95C?=
 =?us-ascii?Q?PFB+2ETQK2a6z7kzfDX9S0CeCJNIimAE0eTE9ganp44iwZWmgnOZ4pGrO5VC?=
 =?us-ascii?Q?hC/nW9mbA2vQ8YgukVB8OfGJvoSigNW13Wf7kpWNLMsyO06yn6x1MJrPoMMt?=
 =?us-ascii?Q?u4gXP3dqq6GtLrRsPc7d5lDubRPjKeW2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A3GnjhRVQx1dFRSwzEC33mPIgEjHyTDYZ3/6I50Pl8yGlQDzM0KH6XMY5eJd?=
 =?us-ascii?Q?ntZoid7kktLsHnUKA/KBN6ET73VA9DuA39xT34+7oRc3tzEyHaooJ4YdwXD8?=
 =?us-ascii?Q?WVTgwJBanGEs9bkxCWL5TLpWCSICn+MMBlFzV7+fRFGZQdstrs6b+xjPC2Qb?=
 =?us-ascii?Q?s7hhGdZ03Sz4Fg1EfnA5DV90i3UDmbcy4UT0snrfGBfvfzW2siUty319a2/e?=
 =?us-ascii?Q?itQ6CF22PWaBme0zERianIwRo+YMgJ9Pq76fpI7hKfkjYx8knCOw4APTEO+a?=
 =?us-ascii?Q?b/wZ2KFJLKWAU8coY7L3F7JCJvnWwVVuJmQ1TDBmxLsqvEIXHDw+9lWCCt+e?=
 =?us-ascii?Q?KBEFqWQRXqCYRgEGnEtgsRdVGl7I2WMwRFhkoOry4Ds4e0D4F+ebbOkk16C2?=
 =?us-ascii?Q?O2gnaRvOlb78P3YBkIo3mcqmGMCnVg8rYMzUREC1oDQZDH4NcG2lZpx7n1+t?=
 =?us-ascii?Q?LGEITCf52T5awzU6+T65s6vEYb5dFVyw8y2ussb7xox8WciCL1j5u9qSDfJW?=
 =?us-ascii?Q?L8nVgGNWCf+r8RKwRjaaNAVKX71OvwpqAZSiduq+/B0bKUBq7mjal99uLYUb?=
 =?us-ascii?Q?Bk763WUlXFog36Vdf7ZFo4Y1gLs9/agSouPWzXY7r0yg0fWtKFk7Pfki6hfi?=
 =?us-ascii?Q?tCqqDYdTI+FxSfJcYVz1F3X1Tmp15BaA3GwJFB0ACntJPefRA2AqCuK1XESX?=
 =?us-ascii?Q?rIh2GIK4MYC7NQf5s3leNnVM6gY6VSFwxQkwVdNI7z9KYiALJeGh4ztT3I8Z?=
 =?us-ascii?Q?mEcjMnU72/5U3EWQQJiDurlvpiiERj+d1b+geSx9YBq9BF6xgtkgKnMiA9O3?=
 =?us-ascii?Q?yNwrWscvVJIEptTxVHCDRcUm+FIwkdHt2UHaQ/RFWGJHqILdzrDBJlqcLLlr?=
 =?us-ascii?Q?amprhACy3/NwnnWTnZfDE0HLPj4FUtJsIymQSZQlJRFye7DAJhzXJtpQaM/g?=
 =?us-ascii?Q?ev2gUIX3EsvTI0HyPNOXa5F6Vf/H1Sx4NcFeXjvdHTYp/vNf+N98Hp34gQlG?=
 =?us-ascii?Q?GGLzoH5SNuARakEQ5uzuYnG+1Uf/daPESDv4FCpGOwCr7HFyaeghWpnhi6XU?=
 =?us-ascii?Q?pHLCVOdUYAyoVCcfG/Dmhvlyaoy/HB/BJ0ET4oP5K0U76whNHAYvs8kkPVNX?=
 =?us-ascii?Q?IuPgAB2tO5FCsesXFaGbRect1XfJZKFz9OMwUJzCC90hlFHA9p5Od07UZKxN?=
 =?us-ascii?Q?fyTsAseetCJtP0+IYE/hK1Yydinoh4N0SsvrZmTUrhaqWgZRYBVJhqACXh8R?=
 =?us-ascii?Q?c3a3SNr086oPt6Bny3n6aPKXLFuEDvrR+b/A18KM9QlqfaLcrLiY3e0pjwFB?=
 =?us-ascii?Q?era7ygWhDzQ8dWAhxfQ0vW5HLggj4wcQa7DdS6S95aK+KrwQfcjO3p5OsLOu?=
 =?us-ascii?Q?57/hfrLK4vD1ABngSpUOiDf21xPPTqYD2vHRqc1llSoKo0Py/Pp/7dj+NM8P?=
 =?us-ascii?Q?/PLm0SjTS/+aisxe5RDRjq/sB0yQEhFVmZlK7mUdieEwxIirBTWxR/QiXrq2?=
 =?us-ascii?Q?/gdvG9Doea2CGWwoigFavgDqOCuWVZtnMI9LMfdX2GzdBhijSkgSZM1ReVJ8?=
 =?us-ascii?Q?8jD0VxCgi20mjHfq97eVet+ire0mDPi6cUCkcp1K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	TB2EhtHfCeZ6Ag1/ftwZ0cIh9yUBW7hd4mVYVoLuFt9Dvm8Y1nnaqpdZoCP1VUtogS7/Gnb7O8rBfuYATbvBv4FJWb3JsKdNDivPtXKBEtmdcxltxwCSDKZSZWDQHxENrwNdstUT0JG8GTixD+GLcef15sGJZT3p/3iOyQzJ6nc4A7QMzTs8EJUpw/4VEup3YKZabpmB991oMxkh3O82gdiUKZfTnnvW24VTTYkOjvm3fGOcRdFQtKta6pmKYKA4Qq7nxu0f6+TBJagsBdGFSi9LSIWc+hx14wCYgsR5j2f2595ObvlsRZkX0mfCXxWUOEcDvdGsmxmPG94PXh3spOsqVVY+AmDcgcDr2MnnKNCSr2cc+GlBmZODBrluDR2/wnasxWWjX+9zF7FNbmGGU2PzzxSVsiz2Yd2MoIBcvktu2ulYOTkOPp4bu1AYjpnG3fa+eBk6SdqUtLezligvszcIfhs/TJCfL25N4dTbAevf6wYato01G8RAmGBtzKsibR4tJPMNFXrhwGh2sKdbiEpPNMg2LH9KgvBm/4QSpEyX89dmvaOB4/pr0iHY6njyJk/EeMoCJRaSQdBmd7GqKDfeXq9hxG5bZKoQxw2BERA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d5e9d8-20ff-491a-3771-08de07781b28
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 21:09:16.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITZuFDOlbDR9+WjANgBBhZUQ014k8ldHfYh4RMPZV3HdRQLqvDCEds1zSkNICC70869dsat1SszfesPQfwyerg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8634
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510090130
X-Proofpoint-GUID: ChTOrddQ0WmfbPTRL27UBn1JOLTIkJE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXywsTMtZRbMT4
 aqWfb74pjyTMLJ7u2jie2b8uJN2J4jgD7fGRXpQ3IJnJio9flVOnjvba4+1tISQ0DYPeA3MjhUa
 tmSqFlvmwsDi7qZHT1YCbmLTanLuM2KwBxNv1i2L8o7+JYZ4SU3sYggXQuzGVgCPg4TGbBD72Fx
 QXP+O+8nJyJhgCnQmPmI7RqCK7R0rzqZuY3Qo7drBzBt2zHeitNfxH1Srn17QXWoGVsJt92KLTU
 SPsZrVuaq8/i+EGqweUCg+BBT6DMYz98vF3A0RsZEPeGc64+xr2Lj1AEb/H/fWlaIrxXd0ekVcA
 i7qEb0FsDIZ43U678cCpaeCJDOHOqGeuNupeU+3Rxut09hI9zq5bwgsHf01PBw/gn6G3ubsWdej
 DYqPwyXSXGhZWrseT9IOCVZbr0PrMg==
X-Proofpoint-ORIG-GUID: ChTOrddQ0WmfbPTRL27UBn1JOLTIkJE9
X-Authority-Analysis: v=2.4 cv=U6SfzOru c=1 sm=1 tr=0 ts=68e82480 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=AjYYjH9JHWbp5wQmh74A:9
 a=HhbK4dLum7pmb74im6QT:22

From: Eugene Loh <eugene.loh@oracle.com>

In commit d0fdeec50 ("test: Fix some ustackdepth tests"), the test was
tweaked to check that the full stack would be recovered if the kernel
stack-limit parameter were increased from a default 127 to greater than
about 190 frames.  But this does not work if the system already has
reset the kernel parameter to a high value.

Change the test to deliberately try a "too small" and a "big enough"
value -- again, ultimately restoring the original value.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../variables/bvar/tst.ustackdepth_big.sh     | 103 +++++++++++-------
 1 file changed, 65 insertions(+), 38 deletions(-)

diff --git a/test/unittest/variables/bvar/tst.ustackdepth_big.sh b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
index 4ce53d929..0ab59fadf 100755
--- a/test/unittest/variables/bvar/tst.ustackdepth_big.sh
+++ b/test/unittest/variables/bvar/tst.ustackdepth_big.sh
@@ -23,52 +23,79 @@ cd $DIRNAME
 
 orig_maxstack=`sysctl -n kernel.perf_event_max_stack`
 echo kernel.perf_event_max_stack was $orig_maxstack
-trap "sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
-sysctl kernel.perf_event_max_stack=200
+trap "sleep 2; sysctl kernel.perf_event_max_stack=$orig_maxstack" QUIT EXIT
 
-$dtrace $dt_flags -c $TRIGGER -qn '
-profile-1
-/pid == $target/
-{
-    printf("DEPTH %d\n", ustackdepth);
-    printf("TRACE BEGIN\n");
-    ustack(200);
-    printf("TRACE END\n");
-    exit(0);
-}
-ERROR
-{
-    exit(1);
-}
-' > D.out
-if [ $? -ne 0 ]; then
-    echo DTrace failure
-    exit 1
-fi
+# set bounds on the full stack depth (which is ambiguous)
+lo=188
+hi=192
 
-sleep 2
-sysctl kernel.perf_event_max_stack=$orig_maxstack
+function do_dtrace() {
+    # set the kernel parameter
+    sysctl kernel.perf_event_max_stack=$stack_limit
 
-$POSTPROC D.out > awk.out
-if [ $? -ne 0 ]; then
-    echo post processing failure
-    exit 1
-fi
+    # run dtrace
+    $dtrace $dt_flags -c $TRIGGER -qn '
+    profile-1
+    /pid == $target/
+    {
+        printf("DEPTH %d\n", ustackdepth);
+        printf("TRACE BEGIN\n");
+        ustack(200);
+        printf("TRACE END\n");
+        exit(0);
+    }
+    ERROR
+    {
+        exit(1);
+    }
+    ' > D.out.$stack_limit
+    if [ $? -ne 0 ]; then
+        echo ERROR: DTrace failure with $stack_limit
+        exit 1
+    fi
 
-if echo "Stack depth OK" | diff -q - awk.out; then
-    mydepth=`gawk '/DEPTH/ { print $2 }' D.out`
-    if [ $mydepth -gt $orig_maxstack ]; then
-        echo success depth $mydepth exceeded original limit $orig_maxstack
-        exit 0
-    else
-        echo ERROR: $mydepth does not exceed original limit $orig_maxstack
+    # check stackdepth consistency
+    $POSTPROC D.out.$stack_limit > awk.out.$stack_limit
+    if [ $? -ne 0 ]; then
+        echo ERROR: post processing failure
+        exit 1
+    fi
+    if ! grep -q "Stack depth OK" awk.out.$stack_limit; then
+        echo ERROR: stack depth does not match stack
         cat D.out
         exit 1
     fi
-else
-    echo "ERROR: stack depth does not match stack"
-    cat D.out
+
+    # get actual stack depth
+    mydepth=`gawk '/DEPTH/ { print $2 }' D.out.$stack_limit`
+    echo with limit $stack_limit got stack depth $mydepth
+}
+
+# try a stack limit that is too small
+stack_limit=$(($lo / 2))
+do_dtrace
+echo "   " stack limit $stack_limit is too small for the entire stack
+if [ $mydepth -ne $stack_limit ]; then
+    echo ERROR: $mydepth does not match $stack_limit
+    exit 1
+fi
+echo "   " success:  actual depth matches limit
+
+# try a stack limit that is large enough
+stack_limit=$(($hi + 20))
+do_dtrace
+echo "   " stack limit $stack_limit is large enough
+if [ $mydepth -lt $lo ]; then
+    echo ERROR: $mydepth is lower than low bound $lo
+    exit 1
+fi
+if [ $mydepth -gt $hi ]; then
+    echo ERROR: $mydepth is greater than high bound $hi
     exit 1
 fi
+echo "   " success:  actual depth captures full stack
+
+# restore the kernel parameter
+sysctl kernel.perf_event_max_stack=$orig_maxstack
 
 exit 0
-- 
2.47.3

