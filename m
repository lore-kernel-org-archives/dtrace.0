Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5162D8DD0
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943059; cv=fail; b=iZot+gynOGkrXlQilSej5tFdrzwCzM8aKVHUkDl10CGJpQWmJOm4zxdkqtxhdOTlgUkn+EPr96M1yH+H4ezJA06SLP08p2sg/Mx3pvskXRqqAhVORh4hgw9eCy4X++pkG9glLGMnG49qeMhcT28r8v4iU9x+dCrtWXU7fQtJF9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943059; c=relaxed/simple;
	bh=fSeFqPdCcVGhrB6wKRhSr8HJI8PU8jCmIWPH2lfKcqg=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=WhcNSTGGQbQJUfmI/DL7ilGk1AgW1GbexVNnYEPCbEJwu+lsvVPjWR8ATmewIzmOw7lV0yffR7XYNGL4xpWxw7iqY/A8edAVocYiXsNBezHuf4/dLCPWhUOwk1Kw7IrGpZka+qN3+UcnjqJFmXIKbWC6NLlHaeSz1x8wlkn/GQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DiQoq8rr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tI+/Uxf3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DiQoq8rr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tI+/Uxf3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SHKNZ83087267
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Dl4hCxmoHD5oitMKkTPU0vgUv9pzSCBjMP7F/evgt3w=; b=
	DiQoq8rrqvAzrK9im+I30koy4+4u5l6bJlq3g3zw5GJuB0HmV1tAI1X2WvjNYU7h
	Pka/tRcOZ7JAMN3kscjpPFV394kDc9Kn6+rD2fRiHBM07wSW92SXTdSyRQiJ6dpW
	rli3atGlXB9wBeZTHhqs7rs5Ke9r73NCm4LAnZgkyH6olNuQ8161A4z+pYEExM4T
	ayr/n2LpWZ4icUzQ3n6GgQKBxBIa7XypJmUNqOyORxHAAnq+cwPGEZ+V3gf8p/1g
	cEEwOoS+PbCBECpxUHBfngOBjtdFkGrbnNaPOhNWQ3DZqYa8KTH/mDSu0x0o8gcq
	mfGQSuG4BHYgPXFm7XskpQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4g726btdr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:50:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 67SIoSm9005836
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:50:56 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4g849pmnk1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 28 Aug 2026 18:50:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4LRmXQgxVQQviM8QibUwbRM1ffJqsraN+gUVOozJ2hT9RoAMsQJv9EhqfWLz0T3HJRoNSnAFL/zarQIQJaRshWmJHiegBCQmjPI3RgkKWML6QerBCuUhJwAyOB8A1AQ+Rq1V8yum2QOPAY618xvgIK0WsT8amfu+ceOms+pRIsjV5yV4J21bXI008qskFSb2an3bNKuVUDJDOSeHfDDwBQyYDqm6a/dcTso4xHFgXADKqniVu39eoPUR0svStaSbEIDC8z0jqYL8jS6szOrXcEN48l5/K7KMyIJ4cOI8DDgXpWonrwITxb7bthZhJnb8JxkvuAkH2wkPBVmvwqPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dl4hCxmoHD5oitMKkTPU0vgUv9pzSCBjMP7F/evgt3w=;
 b=czm7/+zgxITat+2HwT36GqANKYWtW1rAmVefIaNDGfQlZel4oH24CJhZ1VKfmaOd2X4tUIHhzIcszExsCz2RAh+g1EXwMoT5qruaQ5jeCT+v1LeNRloQpABUIeyNfZ4dK2Uled/EWxxUpDnXex+gxk2+eYJCB3yVPl1bvP7LBHb34f3ajVhBXy/XhnwODTQFyAG+N1tA/U+8xfdPC1sOuH/zCI/e9tUiHc4+5yjzu2qDYwDzIuE/oTVCmF3BehgunOY81G87EF46uNLLeCLl99CE2522XpD0u4hLf0NlVbjrH2Rq7ft2prRpaOV0pRNnK/ofG/Fd7BS9cwVt/LeNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dl4hCxmoHD5oitMKkTPU0vgUv9pzSCBjMP7F/evgt3w=;
 b=tI+/Uxf3Go0Op/fcSaoatqlWjbchnx/oU5iFU8Hk4vvzF96F0Cllc7m+Go7w4QCiBJtP++/6B4jmvlVmhpg6onjemJk/nrEfSosL65uBhFV3EvrX6FVKUnq2zoeElyHP1RYEdFyORQQ1NUtGfXgMYCQZzdVCPCEieoPSLUlYz2g=
Received: from DM6PR10MB2476.namprd10.prod.outlook.com (2603:10b6:5:ae::24) by
 SN7PR10MB6665.namprd10.prod.outlook.com (2603:10b6:806:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 18:49:49 +0000
Received: from DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537]) by DM6PR10MB2476.namprd10.prod.outlook.com
 ([fe80::7c07:98d9:2030:e537%5]) with mapi id 15.21.0382.007; Fri, 28 Aug 2026
 18:49:49 +0000
Date: Fri, 28 Aug 2026 18:48:54 +0000
Message-ID: <95468f6ec03c34a81288f9106e28ec9f@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Fix typo in conditional
Content-Type: text/plain
X-ClientProxiedBy: CH0P221CA0040.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::20) To DM6PR10MB2476.namprd10.prod.outlook.com
 (2603:10b6:5:ae::24)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2476:EE_|SN7PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 1abd381b-ada4-415d-34af-08df0535238a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	19e3P+etHRhZ2uGrcKaMWObtHry4UagYdI+Qjt4VKeIFv8eDYwWnuH6aLa4zWj+57UhpsG7XZth4TAuVM1fD37YEj8EukmNLhmk/3H0qMvWFUCLsHcsjIC4i5+WMZpLjfPD/sHDQqMTD8EDDXdi95qPAY3ClFqrFYohj7ncZ9GlidO1kRORz3j0FZd+nU2aFcUqxIdT4t9o4dd4XJLpbEIs8arBwZb1TjubO812QIPs67XrPJPR3oAc1itPNe5bu5TSEKgPEMThrRfo5Y4iF34mbEPh4+NQn3bAYchy5FbMhJygczFpd30pcg9Ws6Bu8Z4so3U/knOUTj4FP6NkPra7r3ebSeQQhQsddHVLjSGpA5SZEQEpFb1ju9Efq4kogmvyjqlelAbjqwxMUEsx7zGNs603hwsEx/s1TUC5qXhgAm6AXeRUVKhbZx4jSky+2yP3UPS+B68CdlTU60h6zV835HTfy6odePBG41cgt0EqwRcuh2YMolF5vpXKJGNVX+HbWA21qegRojjoLAgka/fq1Btk9tmwdqwPpweywR4pL0tMj6JXbF14rTMZjoHSDVZFzHg1KETcau3gjiCa8ptqrhxRDWyc0GHawvy0tBAJDXAqhm3syLqbY3fOi5bsm1XNxpG8Ls36OJx2LWzuZ/kpyvJxjrKfCqhsneGdPcjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2476.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TSWLHRuhDAUxuVTzIrS9VpQUQXwMbYWmFrlIEAy0KOy1mGiDvg6Oguoa9fJH?=
 =?us-ascii?Q?9s0UQXYQ0yuTuUANJvmZyabl8ypkyEoanPfhHpkJilogng2aO/cD5BurrBay?=
 =?us-ascii?Q?5RqyYoQdoUUk3HcmPq9DBZiQ5FMSzwrAubq4YHm08y3wOB5amv8iyDWV0Wsv?=
 =?us-ascii?Q?oOW7GFindTEbQx/0DTaOqJifKgw6UvjRHCLrkqEjWUJ47tGq8qoHncGzIMjU?=
 =?us-ascii?Q?sKESEHZtlm4qlzJbUNOyFqpqxugg2m53vBicR5lTf5wtvFOpDh3gtg14Gps6?=
 =?us-ascii?Q?cgANZ3PdWdzifuTZggmXWn3RMYdevfvr+y3qefXaGgnRTWTohrqGtaVUPon9?=
 =?us-ascii?Q?28SP4rVcPI2peYsgJw2Z066RGawOhP8gYa8TypX8Iw2zqjyggeunhADsBtMY?=
 =?us-ascii?Q?pw700JWzokm1YcvGtKVslvEOIZJiqGqv8lqUFqb2c2zp+b5ru5n6Sglic6nW?=
 =?us-ascii?Q?N/JI2JCoxpBL2Z7743jS46/EqXnsou/TH0PJrVF96shSLDcOkQoXuT7g1JHL?=
 =?us-ascii?Q?BF3WhOnsxpp86Y90ay8augtM3MQmnVqghPDKQ86hZ45nZTBTLIHvNwlgPswI?=
 =?us-ascii?Q?U3F9Dh58C3SlqgLGmnEChDUBpffe65Rorq0wUw7S0ahUpN/cGxQyR3fZY5kt?=
 =?us-ascii?Q?xWIBAY0RiVcz30AQdu3wvWOObSvo9D5Pp3JrYl15eNRuwqzftwLGYDNdJ7H2?=
 =?us-ascii?Q?oys5rFKn8FHBpVqwJ18Wj/9an1JQ1wfco++70aTcW+XPDeQbIq/swy9ujVDZ?=
 =?us-ascii?Q?ChdsxJB7c7T0VnfQelpee8e96Q2fplBXkxZUmBgu8NLFjHqiPJTLVuuQTq/p?=
 =?us-ascii?Q?dFRiAIPsRPb7vo2poGLFHpvSOI/rLQIrpsRb9R+mX3nhUu6c9A56YYs/mcw9?=
 =?us-ascii?Q?nK8jSIm03GdcTZDbo7LNiZEXiKF+Tq12l8iZu1/eKbJvKS7n0K4pTtBdzmmZ?=
 =?us-ascii?Q?qv/Pdh4gaeFHGk9nyIsnliPLKTjik2ZekCefjB5BBfaMxgFkG+yGP0WUjwZJ?=
 =?us-ascii?Q?BFtiBsNhXnMXRdzDuY8Stvug9q9V/aSfSX5cMRUrtcD+Mz1hUJS22LxH0bZA?=
 =?us-ascii?Q?s/2zi4eUqNgIvYCO2mXejaRE04vvoUSbVyJWUV33yfLaC5ELADc3kKET3RaR?=
 =?us-ascii?Q?6pKU0bH5+vQx/d2Ev1CQqlli6QGw7ODuM6BML7yusfkAgczlD/ttbJshH9BR?=
 =?us-ascii?Q?YySKZq5BE9zJYXWmb1u03Mm1ga21aLfoK3BkGaS+/fbvmpMLtSeocmhZahV8?=
 =?us-ascii?Q?ifhM8HMJSyzuh9OU/Dj6XABPGm3Hdgavvlc1QvYDWuQ7DLdaP0WetLwBOlsP?=
 =?us-ascii?Q?uSDHg4ii7ARsaGCRNOJHPBc48tLd534w/AtnXKHN71l7FBIa8RMHhG64REDr?=
 =?us-ascii?Q?pQpVVySvE5kGCQX8uZruujHlQPWW3tbu2G4LjRj6P4hR63R8ykE5GwgZ79BU?=
 =?us-ascii?Q?pGGz/Fd/kbFL8dONHJJFRbWOfUWizWBT48eJVEyuTJK5qprDaG3C/LTk4Tic?=
 =?us-ascii?Q?vxIn50akA/2JNF2MCtFU5h/h2XKG4xGLVdeYi2OSfGfg0sxWVYrBHwNOIkIK?=
 =?us-ascii?Q?UPM7RSbut8dnlm232XqgFu3Tevw8wCz1AvwVPk3y9O68eXw+vpm9ZHtPDcxq?=
 =?us-ascii?Q?r4pNPD4OaHHUomP+zyWBBr7bcUnuHUX0PyMY5GHyun2subXPs2ELqxYbQtTe?=
 =?us-ascii?Q?OnLyyMF0slCVHIrkxJzTsJxRiI2sZ8Do6GzwGLx/yl7v0yc9HVpWBgePd4La?=
 =?us-ascii?Q?ybPcE8+H8UimIubB/SL9UNiy3EfxBTw=3D?=
X-Exchange-RoutingPolicyChecked:
	B/WhseODr7F8hF0+ZYNts7t7VslSuodx88BTK42EzbKD5aqSrfHnH6RzQA1gk4X7JaGYHIAF/AQ+Sx5NGLorgl+bZrDJYA7T5J4db+zjKFuDxZXrYqSSHBHKFdIUwqtfa5AiOG0xFxHXtf0TtRQbLcOwlGQ/j2E6FgfobZP3/Aqg4WcbxPEtiTb0xYPCW5OrGLP17koI1POVUzm8vtHbJ2679iWNuIsWLBFA49NhaDZlMwPqT8hFnO+9e1Cfnmq3dvD4/ZKoSah2PwsiqzPZhNC4e9/Sq+0Hq2TotMQ3dOxjUF/Aow9wZR2aVu8JoEqul15SHBT29PSt+Z7rkETyBQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lnIsuudgZMyoqHid5LOyxXogV8rhRdMHQoDg3neKGyqSn/tj/7pE3TJixYDh7sPbRZeR8o1fL/1SYDRogfLNev0E1wDc5NUjP8XrzSsVhlbkzidht7WPz1eWUJfxCGY9vE8UwBD7zwm8IuwnS3IeY6foPORZ7+FqxG+w1H9ubCVFduP5vQZCvqN/9EjkKAUdJIyPch6HbK9pGHQsHdTYgZ507YWhqaFBt83N9Fwe3auuZBf0YM2xd7z/zTBLuwLkl5QfZ5LdDErN+mdFNFzxKlVqeXRewSkOcu9+rC5EoqdmfkC7SfpOniIeOTM6OryfiLsvFMO59dRMssniCZ3aaL36VBA1VA/FkTMmJgMoQgVx42j0qatTvq7AweVwP8XCVAKoNpV6wh1texVv5HSarbBkQZS+qHBXyXHV/+gImfIAgmVcLgEowjKo92C3/o5Ln7ZPoyumBIKNRPx4SJOvf4TIFbeazFA9P5txp++5dlg5FW1w9x+XBZ1B/un13X15rkCg+2eNL9+TI13F5sOWPaGd/aUNybCT6ILWneYuhZ0gXj/a6rg6F/5nnpTf1IjL1qjsInVUZyV/6/W0dWNSvCCYPPVDDRZJItuIDz79UFo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1abd381b-ada4-415d-34af-08df0535238a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2476.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 18:49:49.8428
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aeeTW1DqooSmLwhvVfL7c8AMAo5llwK/kY99g3xB5HPugk8hVjYJKquW96GJAOoDYrb7zDKrANSzf6EX3tfRU/99LMU6WJrlnGfIxc9YQ2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606160000 definitions=main-2608280164
X-Authority-Analysis: v=2.4 cv=Q6niJY2a c=1 sm=1 tr=0 ts=6a91d891 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=9QizKnBv0COop2lGVqQA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12102
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfX7kIqK5r9maxq
 gNTYA97HwummWZ/bPBRC9rsvLGTQScG/K9MbsIwQQSX41J4vJy+uWHulDfc5/IYXuKbNCrCY2Pf
 0FYG0vlSIjU539Ha4smH+60zyRLY/FwhNQajMaw/dfiqBOhZeksakhur0RwUPfymg/6ek8yp4Pj
 gQ/Z3DuAXKis/hHbHIqu6R/9BKCzS0aSFFXXGswGDBerwKZ3DeF/xdaOyp+Be0kBxTXNNdehuWa
 4sDXy42STpXQzYTjUIsWKsCwYrjFISWAhAJABjq1EJykHsHgkEFPMyUrTnpnCi5+4LFVSZZ5uYS
 HZ+yyz6yOy/TcEggTb1cfoiPNXn8/5/vbF0fvqjNCcxVYdyt4FNvdcViBE7u3kg4TxyslR3KwPZ
 soKvyLeuqvkjUyQ6Wh3c7TetgtthtLTaS5AbM3Yv42e/+le8q/0v62COTnvNJz/uUYSOOkDUZMj
 ryHKbehBmGXgHNPX/aou4Zh2wjTO4L1GvgJeHKOQ=
X-Proofpoint-GUID: lWhpg5qder2fnk3zrB8m3XhVN03IhRPa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE2NCBTYWx0ZWRfX+LnkzbCwMiUh
 uviB+Cq8s5FS9xVQBsdxm9+j3j6m2mcRBymlmqEwTQtvPFzqpjYUQR5okLsGnTLbCosWhL5Pmev
 WP7U00gVYp10m2ysz4Jy3INH3fiTKe2fSt2NDwYgbGsOKd1UkVks
X-Proofpoint-ORIG-GUID: lWhpg5qder2fnk3zrB8m3XhVN03IhRPa

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 00978911..b5c8d319 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -200,7 +200,7 @@ dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
 	int fd, err, bits;
 	size_t shstrs;
 
-	if (!dmp->dm_file[0] == '\0') {
+	if (dmp->dm_file[0] == '\0') {
 		dt_dprintf("failed to open ELF file for module %s: "
 		    "no file name known\n", dmp->dm_name);
 		return dt_set_errno(dtp, EDT_NOTLOADED);
-- 
2.52.0

