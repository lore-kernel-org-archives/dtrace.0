Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E189F1E766D
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290374; cv=fail; b=g6QXykt66odRajiiTiHoOmwU/rG2Wblx+RfLsXfcoQiIPBEGCjK67vkNZL3YcWDjK6Mj2zl4+osllhRk/NaQBhvXAmwNEehMO7wNqjpQ1DirDOOTKLdhhyuYxNPvOPCZomz8gO0S3mW9ZFqmm/kE5cUaC9AxAUrCqXhbLWfSe+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290374; c=relaxed/simple;
	bh=iBbtNFLMJMX3n6B2ok5lnyhEu4VgAtfuI2CYayY8cbM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qYRgrP8aKxJN03y0rPLR2R2CGfCkk5DSuseElIf36xSUe3mKtg4LFUvR/su1Q7HkLaLdSkyXZ+3Y35xQNaF9szM8HPD3eRXHTv2G8LnNMsR45SMaW72NmooostoBM7/3QQrkFX2M3y4j7LDKAh+1jt/c5GPOnYfLDLzaIBoM/N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FZwHrovQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pmDoU1aj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FZwHrovQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pmDoU1aj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fgtm009033
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wzFW7kTOBBZGJ/q34EkWtZUCpbKF+aKJgt7O2rj1jj0=; b=
	FZwHrovQmtoqj8MId1vG/TuSHd5bRqkSGHCvAm07CwaniuKtdzTITS1wPafFrCSw
	aEh/WN1NKdwrJdC2eaDrCLvGM5v3lsl9clYSH8IEfdRR1zxAEWw2qYa1fSalhG6o
	E2Xzju8SYTJQPMU6zq3R0JUbSCM0FclBvyQJ6KFY0mkAx0DuH0gTUvmxGSWZw6Ub
	Y2imQ3eyQQDUaDzNhmR8tmNMUrc2jwo28ZRAp+sPh58V28mVsyuanBjJI6dMMBQq
	nHKUmOlBg5hCAc77dCdUhMaOsk4eGiAAUcmh3N1wZRmOR1t4g1Dnjqt+PcNR7Quo
	iws00FyGbcBasGCAzvZC4A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdxqu9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBLv0K011986
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:49 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnadx93j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxSmRZOQHicIHH5Y3KKetPZOMhHEegj5xYp6BNEWDAM0Js5tGUZQ8vkmEFm8bwAJ1vs8FJ9OyqdA/32x0jvBYH87B2NQhe5M/qWJk5Dqs6HNIe4mbFZizazk8hjuckdSTm8vjPBkauRNkEQhve1zGaLw2nsVbZoA5v+PqWMWQhjxhsVaEwHD43UspKHEv5a9yzsl4Gp0MAzBtqVRGK33XOVQcVGthJkNAkHpbGZ2o8qkO9eQLgzJJjixar9HxqntHmKggPjh+LTJYi2FMC2rGudHgvmyddgNruJVd+2xPsOdnPHWkZpM0Z/3PCsJiguYn7xV/VftCjjLFKAVNZ0Jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzFW7kTOBBZGJ/q34EkWtZUCpbKF+aKJgt7O2rj1jj0=;
 b=mDFAB71GtlTNlsC8dfUbP3ZDSiZiAlx9q5KzSZbD3VDjcp4Xny2oFHIuMWUZc9jrA4CY3AL9hyc0watc6b3XyaENATzD3fgmuEOjxyhgywl+RjH8OXZhj80HyGLV46GUFqIkNfj44ZN9FpKZKonGz7eUl/oDfxarSdt8jymy8dEgbrfDiGDco5Halzt1NK/P56OX7zfiZ5HaHStiZkBC6R49vrjTlkwn9m8YCElhj3Xzn/V/CbVt80sUaDITlPTl0V3UkuPQRijhacKso+e0H5GgkqrzFiQ21fu/k/wydd3+gFCK5q0LUWFK7ZeZFXI58RpEa1zdbDeZ813ocZ7B9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzFW7kTOBBZGJ/q34EkWtZUCpbKF+aKJgt7O2rj1jj0=;
 b=pmDoU1ajnImYN0XFBvTrExoTGBtwD9I7qsqSchz9nWnQAQgUHQLbQ/ol3JQnpGMV4qg3BFWXLTGlSoMXaM+reguZfqgVw/hOxMhtOICdOqrMAtg6MszhNtUyr9/ynqnEsITuPurVyeTvENSPqZnuWUH5lE9oQ7/41or5fKp5cE8=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:12:42 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 01/14] No longer depend on libsystemd
Date: Wed, 30 Oct 2024 12:12:23 +0000
Message-ID: <20241030121236.257803-2-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0083.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::20) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d251bbe-ff43-4710-b2c8-08dcf8dc2794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?42XkM5tyP8uM1fba6O5/isnCc0CgkQXWCf8IyXWhDNxcCDK05kvbcdmHIVvJ?=
 =?us-ascii?Q?dWqVbpp2cltosDE/cyGW9Trs7Sfsx3M+7VHkTEIpwlzt1WTLg2Yq6/3ML0yt?=
 =?us-ascii?Q?agV4LRQuXOmH5GJ2ybrrOHzYH+tKoIt/VK8yDM0ilHX/28Wf8P4atSiAfDwS?=
 =?us-ascii?Q?lUIqiBA2XsLh1Zb8i8Lnu+/qXx/wxreDVzMeYT+62YzeiFtvljHlvxZLIT9i?=
 =?us-ascii?Q?BVbZMSuVSg7g5hL8+ZEyt3n/b5sDzpt1m7hmQLP36DKrgIkzZr7AoTqPKsSi?=
 =?us-ascii?Q?gcl/MRC0cbOM1tt6n0PIx1OUyrxJGUWbEIMud4IQWeBewN5BQ/aGOIN5raeq?=
 =?us-ascii?Q?Q7PsYixYyKUHy1y3fbVnPBE8Vh0OgkhNS9MXuaj66EJhWImuaOToBn/R3hO2?=
 =?us-ascii?Q?XuwnAh2LgZ9PyM31eqIYPOVqkB7amwTfJ2910cGQr6UWpAjL4F5b44hInJVp?=
 =?us-ascii?Q?T0Rdiftb4V38DGPgGga6VmfVZwkusDUehSmXhWKYbA14a+eKa9yI12Vet9TB?=
 =?us-ascii?Q?oLAoKSKjepQiDLSc0w3PNJK7lLDzj8/LymkZr3nJ7xhAQHZdW6Ph9bydQnVI?=
 =?us-ascii?Q?QGxyo1pGWgZleHRIhS/9FpNL9/5wwA/4VMTSIRer5ijYVYvBM3gq11UpapUQ?=
 =?us-ascii?Q?KhvNlj3TFV7aMsU2rw7H1iAzAe+uy8z3LWhiL1jN+xsqmyTGIFCKZ3yTmdyY?=
 =?us-ascii?Q?XMdj301BJNe4v5GBq2siOGl4gzFIZR+FiCZUmP9PaObF0wiAmwfvgFkza+qH?=
 =?us-ascii?Q?p7KxD41HMNPas7qlD5i9aHSdF/liL73mborGB8Z2Nm5gvfF3AzSye+OHdISs?=
 =?us-ascii?Q?a87F3YQYdWJjJ5riiqevXrVP92+Zg1xIw2gwsRxfKvFrxu1kv2/0a696GP1q?=
 =?us-ascii?Q?F5GUKtlaOXnf8p1CLmWIOKE7jwr5PeHgwetauzDxi3YihVnM4amcYzuG4+7W?=
 =?us-ascii?Q?CFwc2WsjPP5GOAPi+4/BvI0yXRQaYXfXcHqhfLjXcTsP2HnEwS77D9H4ff5S?=
 =?us-ascii?Q?f5G9/8+KL/XM4vwJcaGN3RUZ/desRhksUOgU6BZMsIxI7R5WLzXftv7YezY6?=
 =?us-ascii?Q?CEU5XjRCqwzq1SV2RDJzneJD+SbFRwXnzBLTfJ5luKW8KDk7VW1j8poK4JWe?=
 =?us-ascii?Q?yOyjJDEIKfNBcUwWozoMmXbS0fB3+tzfaurdrSOpwZXyHmsfiL7LJwgxb7RR?=
 =?us-ascii?Q?Lyhtp4wlPk0z5Bo5YZTEDfHcEBR/myFs3dTyENTn4PQhPIIMTGP9XA3gbGxn?=
 =?us-ascii?Q?ijfbLfnQaE8RDTnfd6jzXKoxL+e/GbyK+YXoDoG2KA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e/MTjkojmvWSBdr6gi8A2KTMSMHYA90qeXbbUDOfAZx1k8vZQT/YZNVzJEGT?=
 =?us-ascii?Q?vlkzJl/EaFqJFm0zjzoWQohQgWNZMvMlCV5IcahNb0No/Ffxq+auHoCEGO6b?=
 =?us-ascii?Q?ZSJEaS/87sf/bet7zZ0txHvfRzrl0DN56NKw9aLu/kOmU1pc5zi4r3OCAvwo?=
 =?us-ascii?Q?TLS1OPAiwVdes+hPS0UCvmbet4d9FLoYUlsfNNZ4T4Nzj+ED8Xk/UzSHjLB/?=
 =?us-ascii?Q?GAUPhePaGmhzk9dBJ21lqZqlp1z/RLQOHXZiX+yH7Z7vee8rjlg64dTpbjoK?=
 =?us-ascii?Q?QAaOJ63ivstWyI251xSZVPwmZ+lNyHKr7I1l1PsVmbJ/pCnxDyFhRuzoVQWA?=
 =?us-ascii?Q?xPFQSJTUlhU8IqiApYveozr2jEJx7UDR2njADyvjkfiSAPScxVy6SWW4FHZ5?=
 =?us-ascii?Q?Qpp0oLApYbEZWzkzTcLIL3snWoAFoFKME5RMFchnWXGmnZiZ9Q0LXvv+A9a9?=
 =?us-ascii?Q?mZvMcBMihxPInA/pojdL2UI+Efvdb46XNch6LoWvo0RffNVTHj8vlQqpAsNd?=
 =?us-ascii?Q?FqssKA4bjnVPhcGH1bEop4hooYLp6VG4b9GFTilsxZ83r07WjyAVkoCXII52?=
 =?us-ascii?Q?/IziV0K8voWXJhHzRiKZ22ENcxkSq4ld6uaDQ1djPiMWai8S3qZ3y/TtS9Jy?=
 =?us-ascii?Q?46ffPlrJxMMyqoCtI4rsogQEOjxFAR5qxPoQi/2Dc2X/88OIVB411faR1JLh?=
 =?us-ascii?Q?a7Siqt8IKubRmXzsm5FWVuZlv5TJavH3fkWU2X82Ob3NOYe+XOIfBg6ueZJ5?=
 =?us-ascii?Q?BLQbxWrRmKO1JWTOi3xmNns61ORHVqRdBRTWevTa51607+yWIDhS1K+yAhmU?=
 =?us-ascii?Q?S0O5MSAfmgXMSzsrOyh0fK/kzxd6FiUbCBksDF6+s+Aa3jqDSU0pFm+uvJOi?=
 =?us-ascii?Q?xCNbkW8MyKvgHeBZuDTsS7RUW0N/kO3NHrUOM2nABYcPTyZQh5vrtcjJR+gC?=
 =?us-ascii?Q?5M2tM+yR3CSrz7PC/PlY9oQSUjE372DgcUVnEJ5TvCmfIE02dyhGysRCQQnH?=
 =?us-ascii?Q?hjQLW0hGBZ5O/o/Zyd+jHu81xuvO3Z3Ojy9GlLonEPICJIxOpai2M8wZcon1?=
 =?us-ascii?Q?usqsv9kxuAUnvkffgA2u6ITgYV+cm8k16FuBGU40qZi8oio8L9wf8INMfDqw?=
 =?us-ascii?Q?UwcVcf4DsWooThGXalbccD1vq+lG+wNOf/l9bLcSlLuaX+EsfW+9UlIMifzO?=
 =?us-ascii?Q?zlI5U6DLGYUb+Ae4K/Qqc2o7hb/pwljC39qPo9sFAyqCEDyMYwg7RDAC6cls?=
 =?us-ascii?Q?g+xwmIMP3i+Tt7tL5ZYJb/TKJo2X4HdTE5Kp6ZKkYgaL8CjHV26oYB8OU/IG?=
 =?us-ascii?Q?fRV1pBK5rVpJQuJvQZYy6WrE3YpSCUwoc1em0ebU2swg2r84H5m0gxHL0pOi?=
 =?us-ascii?Q?bsjlAaHTOcFlRgC7m9cyB7KPGM4c0QUnwfhv4A499ee5chJfwY7QLXywQSyE?=
 =?us-ascii?Q?OkJ84d83OdYlJblaLDu9TRufYsuhHs/QwDYtfVlSe/htPDvFRjxcSoKbTbqe?=
 =?us-ascii?Q?e60TWWCtbv5NmFrkDMMW6B8Zl4KFuU+HGbKiPxrnhohTxVXnrAE/2sIVTUCQ?=
 =?us-ascii?Q?oiIrlVEkvW0yITjCKFL/zOdW3Z/LO+1PWfef11OqvkGCgC2RLHFVQkaX9aeZ?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BYCM67bBv1C0Yv7qSR67jgrWj+kwXyTyrJ1Whm2SnMmVVTEbXbZX7YJq5bYEgh7ytW/3/uTP1DBldJ3ztr4o7V+7ERigsvbD++DRn51Av7WPW9X/6WaxlijClrli+x23LT4sTW4/NW6FuV5yCsQWTir3pluCfGUXOk+iUfsd+DQ6d09nmveqI0D47QBnX3f9xIkZXpk1RogEkjEVHBM0B/zYw1FtM+47FdsdyKwhix+LvkTA/avMBgtQSGo5eNZn11PCkCGWgLba8LlSePqZWF8xvAubHJ2ajri6zkQatDh+6kB53xSo0Te0z84Gur89G71DfO+JgDfJeNLAthE7uoyM8+rNJ5jBEujO9AXmep3FJvtrDRXGt0QA1pKIQ+SESpvm7FQVlRDeBxlNf10OnVRDgujkuhUVRBGi6ZGmr9sybJs5e82uaAMhEPITqCkVOJizyuV2KKEE7XJoAc8ApD3IuVL9VWFWAyxYTN6XGZ1U2R9rLnEThtoZfZ7oOHDa4T4KgAS9LGJOEGOuRC2LLiqUbl3Q/XyO5sIsZVnqGAsZBHRTyr/Sv5fcW4f9DmsYHCXqjSw4bRj5dH5vxCrUJLHOtsXcbNnw7x03ywvZD9w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d251bbe-ff43-4710-b2c8-08dcf8dc2794
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:42.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBNVAAC4x8D+10hx6ch95PqtA8K79V9V7I/WDxdNfbeeegtqjIB09OPi3oAtZ6IVDRvMdaeJQjhGZ3YV93dJwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: Yw-pvJuEbtwGTu2cVGpFd1OSS8METTDL
X-Proofpoint-ORIG-GUID: Yw-pvJuEbtwGTu2cVGpFd1OSS8METTDL

We only need this for the systemd notification protocol, and that's so
simple there is MIT-0-licensed reusable code in the sd_notify manpage
showing you how to use it.  That code looks pretty much OK, so I modified it
lightly and pulled it into libport, with one tweak to remove the use of
__attribute__((cleanup)) (it could be replaced by one line of perfectly
trivial standard C code, saving five or six lines in all).

With libsystemd linkage gone, we need another way for the user to indicate
that systemd is not in use and the systemd unit files are not wanted: so
introduce a new --without-systemd (and corresponding --with-systemd=no,
etc) in configure.  (Someone directly running make can just pass
WITH_SYSTEMD= to make.)

We lose one feature of libsystemd's sd_notify: we no longer remove the
NOTIFY_SOCKET env var from the environment, so our children could in theory
pretend to be us and notify systemd on our behalf.  Since our only child
is in a seccomped jail and is part of dtprobed anyway, this loss of
functionality is purely theoretical.

(Fix a bit of tabdamage in configure while we're at it.)

Bug: https://github.com/oracle/dtrace-utils/issues/92
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 GNUmakefile              |  1 +
 Makeconfig               |  1 -
 configure                | 16 +++++----
 dtprobed/Build           |  7 +---
 dtprobed/dtprobed.c      |  8 +----
 include/port.h           |  1 +
 libport/Build            |  4 +--
 libport/systemd_notify.c | 70 ++++++++++++++++++++++++++++++++++++++++
 8 files changed, 86 insertions(+), 22 deletions(-)
 create mode 100644 libport/systemd_notify.c

diff --git a/GNUmakefile b/GNUmakefile
index e7657d466df5..cbf27b6be111 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -102,6 +102,7 @@ PKGCONFIGDIR = $(prefix)/share/pkgconfig
 INSTPKGCONFIGDIR = $(DESTDIR)$(PKGCONFIGDIR)
 TESTDIR = $(LIBDIR)/dtrace/testsuite
 INSTTESTDIR = $(DESTDIR)$(TESTDIR)
+WITH_SYSTEMD = y
 TARGETS =
 
 DTRACE ?= $(objdir)/dtrace
diff --git a/Makeconfig b/Makeconfig
index f3d47c086f4a..346078598624 100644
--- a/Makeconfig
+++ b/Makeconfig
@@ -218,7 +218,6 @@ $(eval $(call check-symbol-rule,ELF_GETSHDRSTRNDX,elf_getshdrstrndx,elf))
 $(eval $(call check-symbol-rule,LIBCTF,ctf_open,ctf,t))
 $(eval $(call check-symbol-rule,STRRSTR,strrstr,c))
 $(eval $(call check-symbol-rule,PTHREAD_ATFORK,pthread_atfork,c))
-$(eval $(call check-symbol-rule,LIBSYSTEMD,sd_notify,systemd,t))
 ifndef WANTS_LIBFUSE2
 $(eval $(call check-symbol-rule,FUSE_LOG,fuse_set_log_func,fuse3))
 $(eval $(call check-symbol-rule,LIBFUSE3,fuse_session_receive_buf,fuse3,t))
diff --git a/configure b/configure
index 4026a3eafcd3..c44c77383dd0 100755
--- a/configure
+++ b/configure
@@ -92,10 +92,14 @@ built locally, none of these should be needed):
 				"build"); seen under /lib/modules
 
 EOF
-	make help-overrides-header help-overrides-option
+        make help-overrides-header help-overrides-option
+        cat >&2 <<'EOF'
+--with-systemd=[yes/no]		Install the systemd unit files (default: yes)
+EOF
         echo >&2
         make help-overrides
-	cat >&2 <<'EOF'
+        cat >&2 <<'EOF'
+
 Options controlling the compiler (pass on the command line):
 
 CC				C compiler (may be a cross-compiler)
@@ -122,7 +126,7 @@ trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
 for option in "$@"; do
     case "$option" in
         --help) help; exit 1;;
-	--prefix=*) write_make_var prefix "$option";;
+        --prefix=*) write_make_var prefix "$option";;
         --objdir=*) write_make_var objdir "$option";;
         --libdir=*) write_make_var LIBDIR "$option";;
         --bindir=*) write_make_var SBINDIR "$option";;
@@ -153,12 +157,12 @@ for option in "$@"; do
         --kernel-obj-dir=*) write_make_var KERNELOBJDIR "$option";;
         --kernel-src-suffix=*) write_make_var KERNELSRCNAME "$option";;
         --kernel-obj-suffix=*) write_make_var KERNELBLDNAME "$option";;
+        --with-systemd|--with-systemd=y*) write_make_var WITH_SYSTEMD "y";;
+        --with-systemd=n*|--without-systemd) write_make_var WITH_SYSTEMD "";;
         HAVE_ELF_GETSHDRSTRNDX=*) write_config_var ELF_GETSHDRSTRNDX "$option";;
         --with-libctf=*) write_config_var LIBCTF "$option";;
         HAVE_LIBCTF=*) write_config_var LIBCTF "$option";;
         HAVE_STRRSTR=*) write_config_var STRRSTR "$option";;
-        --with-libsystemd=*) write_config_var LIBSYSTEMD "$option";;
-        HAVE_LIBSYSTEMD=*) write_config_var LIBSYSTEMD "$option";;
         HAVE_FUSE_LOG=*) write_config_var FUSE_LOG "$option";;
         --with-libfuse3=*) write_config_var LIBFUSE3 "$option";;
         HAVE_LIBFUSE3=*) write_config_var LIBFUSE3 "$option";;
@@ -167,7 +171,7 @@ for option in "$@"; do
         HAVE_GETTID=*) write_config_var GETTID "$option";;
         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
-	*) echo "Unknown option $option" >&2
+        *) echo "Unknown option $option" >&2
            exit 1;;
     esac
 done
diff --git a/dtprobed/Build b/dtprobed/Build
index 9132c3e31c8a..346cd6aee190 100644
--- a/dtprobed/Build
+++ b/dtprobed/Build
@@ -29,11 +29,6 @@ dtprobed_DEPS := libproc.a libcommon.a libport.a
 dtprobed_SOURCES := dtprobed.c dof_stash.c seccomp-assistance.c
 dtprobed_LIBSOURCES := libproc libcommon
 
-ifdef HAVE_LIBSYSTEMD
-dtprobed_CFLAGS += $(shell pkg-config --cflags libsystemd)
-dtprobed_LIBS += $(shell pkg-config --libs libsystemd)
-endif
-
 ifndef HAVE_FUSE_LOG
 dtprobed_SOURCES += rpl_fuse_log.c
 endif
@@ -43,7 +38,7 @@ seccomp-assistance.c_CFLAGS := -fno-lto
 endif
 
 install-dtprobed-autostart::
-ifdef HAVE_LIBSYSTEMD
+ifneq ($(WITH_SYSTEMD),)
 	mkdir -p $(INSTSYSTEMDUNITDIR) $(INSTSYSTEMDPRESETDIR)
 	$(call describe-install-target,$(INSTSYSTEMDUNITDIR),dtprobed.service)
 	sed 's,@SBINDIR@,$(SBINDIR),' < $(dtprobed_DIR)dtprobed.service.in > $(INSTSYSTEMDUNITDIR)/dtprobed.service
diff --git a/dtprobed/dtprobed.c b/dtprobed/dtprobed.c
index fdcdee14f851..c83f0adb56c4 100644
--- a/dtprobed/dtprobed.c
+++ b/dtprobed/dtprobed.c
@@ -61,10 +61,6 @@
 
 #include <dtrace/ioctl.h>
 
-#ifdef HAVE_LIBSYSTEMD
-#include <systemd/sd-daemon.h>
-#endif
-
 #include <dt_list.h>
 #include "dof_parser.h"
 #include "dof_stash.h"
@@ -1073,9 +1069,7 @@ main(int argc, char *argv[])
 		sync_fd = -1;
 	}
 
-#ifdef HAVE_LIBSYSTEMD
-	sd_notify(1, "READY=1");
-#endif
+	systemd_notify("READY=1");
 
 	ret = loop();
 
diff --git a/include/port.h b/include/port.h
index 427129000b4f..6ce8611e9025 100644
--- a/include/port.h
+++ b/include/port.h
@@ -29,6 +29,7 @@ int p_online(int cpun);
 #define MUTEX_HELD(x)	((x)->__data.__count == 0)
 
 int daemonize(int close_fds);
+int systemd_notify(const char *message);
 
 _dt_noreturn_ void daemon_perr(int fd, const char *err, int err_no);
 _dt_printflike_(2, 3) void daemon_log(int fd, const char *fmt, ...);
diff --git a/libport/Build b/libport/Build
index 48ed99e2b017..822049f5e547 100644
--- a/libport/Build
+++ b/libport/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -8,7 +8,7 @@ LIBS += libport
 
 libport_TARGET = libport
 libport_DIR := $(current-dir)
-libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c
+libport_SOURCES = gmatch.c linux_version_code.c strlcat.c strlcpy.c p_online.c time.c daemonize.c systemd_notify.c
 ifndef HAVE_CLOSE_RANGE
 libport_SOURCES += close_range.c
 endif
diff --git a/libport/systemd_notify.c b/libport/systemd_notify.c
new file mode 100644
index 000000000000..f78bca6e14c5
--- /dev/null
+++ b/libport/systemd_notify.c
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: MIT-0 */
+/* Lightly modified from the sd_notify manpage.  */
+
+#include <sys/socket.h>
+#include <sys/un.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <stddef.h>
+#include <string.h>
+#include <unistd.h>
+
+int
+systemd_notify(const char *message)
+{
+	union sockaddr_union {
+		struct sockaddr sa;
+		struct sockaddr_un sun;
+	} socket_addr = {
+		.sun.sun_family = AF_UNIX,
+	};
+
+	size_t path_length, message_length;
+	int fd = -1;
+	const char *socket_path;
+
+	/* Verify the argument first */
+	if (!message)
+		return -EINVAL;
+
+	message_length = strlen(message);
+	if (message_length == 0)
+		return -EINVAL;
+
+	/* If the variable is not set, the protocol is a noop */
+	socket_path = getenv("NOTIFY_SOCKET");
+	if (!socket_path)
+		return 0; /* Not set? Nothing to do */
+
+	/* Only AF_UNIX is supported, with path or abstract sockets */
+	if (socket_path[0] != '/' && socket_path[0] != '@')
+		return -EAFNOSUPPORT;
+
+	path_length = strlen(socket_path);
+	/* Ensure there is room for NUL byte */
+	if (path_length >= sizeof(socket_addr.sun.sun_path))
+		return -E2BIG;
+
+	memcpy(socket_addr.sun.sun_path, socket_path, path_length);
+
+	/* Support for abstract socket */
+	if (socket_addr.sun.sun_path[0] == '@')
+		socket_addr.sun.sun_path[0] = 0;
+
+	fd = socket(AF_UNIX, SOCK_DGRAM|SOCK_CLOEXEC, 0);
+	if (fd < 0)
+		return -errno;
+
+	if (connect(fd, &socket_addr.sa, offsetof(struct sockaddr_un, sun_path) + path_length) != 0) {
+		close(fd);
+		return -errno;
+	}
+
+	ssize_t written = write(fd, message, message_length);
+	if (written != (ssize_t) message_length) {
+		close(fd);
+		return written < 0 ? -errno : -EPROTO;
+	}
+
+	return 1; /* Notified! */
+}
-- 
2.46.0.278.g36e3a12567

