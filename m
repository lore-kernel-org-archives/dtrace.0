Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D354E4C34
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790628895; cv=fail; b=W2DQnnaPttRzGSawxuQR+WH9I05H6Q08GcdxqXF2iUQwo0+pYk9pX53xtYiBgAq6Cv9bo1+dQtQVPuqMT3jMLilTus+FoD78EGDdL3UXzKWJMrl34EreQojeVtP0uPXxuD5RcEruD4woXJtV6vHbr4w2sxvSiYhRJ04jLTumI0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790628895; c=relaxed/simple;
	bh=9HS/uWDCw3W2RfK1YbUrNbQhKm2GncxwLH136j/u3uY=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version; b=EyPrgC9owe1//1pW43GHdNTuVi40gVWwFwvrH6agXIU5tfDcNMdiLP8Kxgsp5W24CL+1J8c/HJzv2wefL0i0N2Yi4iOGYhGcG82DaHrDd1vyJTS3xiiDMZG3b5sFDEEQGhA3Nu44KeuhGKAmoJGpyJOhydIntMGUO+hg4n8B9rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UKaXSUHI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pVR7VaHM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UKaXSUHI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pVR7VaHM"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SDjAhZ1697684
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=xw/zvhvTc0v5fEKZAo3HTH79MKChlQKAqqa4lT7vg4E=; b=
	UKaXSUHI4uPEeysP+EebxrfHK4Fo7CzOQK9B0Ze/z4bp2tMbjluuy9fOhW+PSa6S
	wd0b+helo/cSt5ghGHJ1X9pM9bTFLQ3A0GqtctFzFtnE3LTt/omMd/XpRFqsqmZ2
	3yo0bolraxkPIWQDhznh6yQOfPmC8bC2TH4JgkxCjvU1pR2ha1zoUfBUi4lFRSfA
	iUlWDKu6SiO5PKMr5bbG1H2NjUlC8XP6NZpQt1nsLLo8X9fjdLJcdtjJQ3BE/btL
	7uvVN+GltbIskSNoKejTGV7IHBrho0C+sIupxYZ1nH/cuPcm2yzj/ZUkU6fg+o4K
	fJqTLFQz9ApyGdpE+5EMdA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gx4fbbjxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68SKoOHv008458
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:51 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010052.outbound.protection.outlook.com [52.101.85.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4gx4gpc0p8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Mon, 28 Sep 2026 20:54:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tjin6/9/1gE27vqDKkt2T6dgH636uX4ofpfStMUIAMHeTzC1+R+nn6vYWp9DTZqsd3jRkDdm7/pd2ZteQSY+bG5dwiYxcVsWxBgFSpj/kE56jwbY1rWJBuKr1WqQAa+QvvS7/LUdebJXy5v1uo2s8YC+pLlDg0DIanygBaSdJiFMYyQU/fuPhRq1AInHKWrTzTGcO/391lnpUfdT5GWOtwvmwyj/qI47njYAxmTJwmkJMwwI0Lb0NSFLjJCw+inAN323yixycXBuobHSt4it4NV1lzzJd/OWkN+AcCay0s8psSxtpJNJvFTNg2TfgeXY+bk8aqOT2UtgGxeubPjh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw/zvhvTc0v5fEKZAo3HTH79MKChlQKAqqa4lT7vg4E=;
 b=QKE28+ZXYQE9QYve3CUjAHPZAnC+IUKJNfdU8hByFX40yQC1Amtoyr6Aso4h7u+9kToyMovFPNpLXFkLrqV+GQIZhGUdc4fPNUHZVi16oyCrjFieg06rSgdWwnpJJDsCqvK0+3v8Kr/v/BWviCWg4XJ4Ngp0d/0lU+eK0iqVS3TUbKiy3CJIHF+O6eA+zUMYJNh0FekCwgM11Zo7mi2UvHEslFt4hbZKVA4gyOFxH2jyUQYIA2JdAkaZFI1h6cV/OKlQ0ldf6zpmqXrqu9NCBslCxWxXlRt462wCgbNOUr8uUIU5fTO6kPOwjTD8S30pkZQ7UxZIQi/aJl5n9Pee/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw/zvhvTc0v5fEKZAo3HTH79MKChlQKAqqa4lT7vg4E=;
 b=pVR7VaHMMoIuUWGysCa9S8fp7y1y+eRrRweeTzrjVZQCA/SNBPNxOfNBsjxPMOTsaD11ijuqliX6ocOUQxYvZvXPzIRvRDVNBPTnx23VWFmsyOrwAk83HseoSHYy9W0zJMK1nEgbNizw+cczLWEx1Cl3tgSlDm8TD27RffjV9xI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA1PR10MB697989.namprd10.prod.outlook.com (2603:10b6:208:5a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 20:54:48 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0472.005; Mon, 28 Sep 2026
 20:54:48 +0000
Date: Mon, 28 Sep 2026 20:53:33 +0000
Message-ID: <065856951b0fa5e001b995773402efcc@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] link: no longer add utsname in USDT ELF notes
Content-Type: text/plain
X-ClientProxiedBy: CH5P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::10) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA1PR10MB697989:EE_
X-MS-Office365-Filtering-Correlation-Id: d1781151-d932-4031-f4af-08df1da2bbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bCCncqYH0QxZqXZfK6x8wvwJx1nE0WfQb4nqa0EUxvOsTr3C6buYHG05ZZuS2UBcvoH7zHLRpvCa9PQT5OyElxTTXezNCYJXVUuCVQ/5Cfg8HAsdZkFtortnWMnu2kr0INkZApj8FqUAxSrsqe1yT9gusnHqqENzstGBHFNkyfo9saFEMZxIMT+BHix2NBT9SavysDa/itf6dpCBIrJk/r4BLeSgJTAFaoXlTkzXCg/P2libNNLZuHk7nCgsFscwI7ysJMBBJQmwAPaO1fBgKVPlr8YUr1mWEYTWkfXppRGo3YGJIcV6QcTXE3BunEjQP0SYlbIUmTn30I4B3uCDnMZfYqblJt4I179jNe8RQ9lsKE3DtsH5EuGOTGCrt1rXvx4tveD1rcnGqOhc4ijkvd8yq3rKs2SuSMEPeWUiCUv0olAlRsdDyb5b22qhTwUs5/uP4jGjo3pyzPY7OY4+yrWILhjvRS35xDEVOcI2leyupEgP87aLvmWkoIYlbXVnvei6ginlGIfGmyIMbNHQJCx7bdQ20VpCi/p72ESBrD4o4AdYCueViW979DHvjf1jq7r4wKGTRg1Di3BlPhsRoCLWFLePb56s9+GbLutzSywk5O2hwHFkFyY2JKj2HUQirqXZJ+tJC69lu5WYRuFfnFe1lHfBM0uinC3scB6xz9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o661/cILKhdwkY0sFOmh/YIAiw2yk+adSQLMLBwPvfqVfkr5xgqrxbi615n/?=
 =?us-ascii?Q?BWEbEMUCpxOzcGDJCc1OsT1z5geX2O78QCXqkiLyLth/D9PKVkK9qjBlFlfY?=
 =?us-ascii?Q?1mbdx7A1+P+AibiXUeDEkPPFM3q/dOBzDVrw5whRyeZiA1hRZNuvnMxy3b5O?=
 =?us-ascii?Q?KMSwj2u3JpX+DXdij7niS4w+vkLrRw+g1vQeiEqAEWdY9fPd4+IsdliayALK?=
 =?us-ascii?Q?S1gTPvtVseyT2fYkEE1jzSdZmj09xqe10b+LBHtYE5Uuh/nDmdZlYwCik5+o?=
 =?us-ascii?Q?B3NBNDAFuUu1viwK+Hl8U/ZJq559PNF8E0xw6wkRRD5vv67bTDlKQo+FTbtY?=
 =?us-ascii?Q?EwpuSuSiUpJtxH5FhAZqNBP5BGr0xdtFJH++nucu0suCUV0UyWmXWDpLCTTT?=
 =?us-ascii?Q?XAHu7Mx3OG+joST9U37cNR3RwqSGW3aXFzxailSZ7mqlW4hvDQr+k17V2rQn?=
 =?us-ascii?Q?X9+TtK3507QCCUW89aPLZo+Gq4HpW1Qj9M/9MU7HI/R07KeeA4ixFRtCTZE2?=
 =?us-ascii?Q?YLJWyDbvAkQXeRbqwHvCzE/rUIidYUz4QJKcz9cgW2wmpv87aWMSV2W4GxlF?=
 =?us-ascii?Q?73nICFGtdJizwYkM7/+GKM74XLxGd/NLzhu8g5aEVSN4YVssssXyL4REM+22?=
 =?us-ascii?Q?t3fgSRhw3HqckbFtUSUriEwSG9/p6nZ5tyNNyFuWkIUOhSdx2Cw88kE4jHjS?=
 =?us-ascii?Q?p6m97zCZIbHQmFZA4lYOZhZLXuIyvjUYp0tj1nYPc6zW4GIngpaXgl2Zh2lI?=
 =?us-ascii?Q?vG8uhcxlvPM4jIez3tYV8FADXog9CzNHlOIQQknQuEU2R9BHWuB3DqlI1sM1?=
 =?us-ascii?Q?VgqCgb7NR7qbDWGsw6F2oWb8l0T4XmxN/KISYSL4INFxLE/x8qZSi6AVAman?=
 =?us-ascii?Q?LprvBfKh7D4a7paPhTi9WPHHkTtjDa4uXGeIMg3oTQ5jmd+KOTTbK0VbsZEB?=
 =?us-ascii?Q?9yr066BX7lD40fQWLEEGxsD7BOlKRnK0Xc9R0seddsOqT3T83Pp5y1onOsS7?=
 =?us-ascii?Q?XZxE7CSuoR56t/QmaZyK5w6DJDuDL+c2TzXAntWoVFPZez/u1uoqWNI0ANoU?=
 =?us-ascii?Q?7XuADPMJ8YluxCUdzmSU1mHVKZOoJeK2XJrZVvBWxh5s+1sWzBmGo0a6gsT6?=
 =?us-ascii?Q?2Q5n1oFBEiTNHD0z/B6nk5gJH90mXWwjgXK7VVss1Cnl+LtjeeCUk5W4KSdp?=
 =?us-ascii?Q?SeTn/ACNT2TD5gh+aZQTl9Jku8qcAK3aHtug4POLl/4RALQdPr2aua9ayCxW?=
 =?us-ascii?Q?XuMekWt1Bf4QWLRNulYNMvUf5jH7yX6N7ki1O5tlL3YG2ds3kOKa5KOboJ+L?=
 =?us-ascii?Q?WlcTw073Y41iFv1Lq6Xehn2a/sFADU/wsLylnFd6uPHfJT8BE3eSOLHN9qAC?=
 =?us-ascii?Q?MOG2/0/8MFkr7oemMob4Cs4UoksS048/+krnVD0AaKFiCyX1k/gXaYCJWcrT?=
 =?us-ascii?Q?DGvShNhcnUdz0STIMuX4svKtQaMd8/Ie/pCkipW7BErK7n8odbG1Z9xvmtew?=
 =?us-ascii?Q?P5MMCQlKPc9jdoCT/V0Zu9+Hhd4ukHBrOhNVNl0+0ib7NE0ZUO9/Xq3AJLTB?=
 =?us-ascii?Q?uQWCip+Mmk1jqnnVlgjLUSEapxZlBJKMlPWJQxMtoNRQfgiH+0amh2kT8zRP?=
 =?us-ascii?Q?8bZjPwsTBNKvuRxOf2gMumek18WhkCzmJd6US+9IWc/16SqTzNU3k1fnPrOT?=
 =?us-ascii?Q?hMRsXp7RQsCMmFItwqZMaAcOIhX02SsV7JBziWtNBpxSZthozJ9MybIzTHZi?=
 =?us-ascii?Q?EcXifr+UPjaL7DuB7I/RVvEH73r92HM=3D?=
X-Exchange-RoutingPolicyChecked:
	w8pTmofcjxzCb+yytr11b+6Sn1PWCoTt+0zDW46p+TdOjfd9aHiqYfrW4az9DlfQgDHG4Y561lKIghza4cmv/iGRwisl46No+NnYxcg/dFLNERGvT3TqenCDeC45ReHo7nEq2I4tZY5tLwGncjBwBUHxSAGMcITA1mXsVmHlABLei0tnhWS0QUHGxCWOGafNNyhiLBimMUt7q2GEwT/UY2nblRPKuX6bPhwkQDoibvFgQGb9Nf5TWcqVqOxWOB0rsOJxBYcyqSECGU+WQS0Xa0iyofMqbw4jWBfCQI8NFTtqrmc8WV8aKu9ol0xstgDQ6dWvUaoSBG5HogeqeZQ42Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZuhbM5R1QeZIqOxrFTcVtc5+s40W8eiOFFcaji5fJPQVdSj+dX/vM7SYfM92Psv73pAeJXh1Ioxz6Y/VI4QTr1n77Z7djq1Hd5n6h+3eIc4hSYnSbYq0tziREWGcVD1vNwwaKMQY4CVjVBTRagIiI8TdJrH7XVUxSVfpm3tiD4dYcJrxgGUMZd1R723sA/U+QGY+zPxnLAr1iMxR/3JmMN8UVK1XuGJ+wdDRaYgPusyruQ+9ldalMRevKblb2htxlqpKdIXhE9fY5iUpwZGXjoOOwN1JusWwPfYeE9Z6uSjBYAqo5eqaV2N27rAPXq03tkTBZTKJp9wkqpk/dJsa9d/iBLg4HVPBop1xh2yrMaNDtzebWBvN1+7787z2g8HjegsSAG6H6CgcyW4LE7nADOlr3S2QE7ck2KI38nxGyctmoLkHguelChu1bIyB1qsIgG/UNATvqBEKx51D+HsSE1USipg+xwRhmKyTI/oqADeNu4wF9cJXlulLVeJLc/mX2IlOLQ+OW52RUDxveZi7CIRv/XPiVpWRS6JmkHSgrKA+U2SOnC2PLYhvwNDEWW8Q9I/z4QELUeT+i/Ilw6OxwXfjRzxvjOyU3FybQBh73gU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1781151-d932-4031-f4af-08df1da2bbd3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 20:54:48.3636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89K3af9+PYktXei6d+XZrt3Vq5S9Z3jUk+83+k3CkII3aHuudDNHsRXpeOuGKJF46tlnBBlcgsw64QZ5W67GikhUKebiWQRMfL5HSXU5JFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB697989
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609280083
X-Proofpoint-ORIG-GUID: -2K0Tyki1fTdi6MpqoHEO-OqxYnhyKUb
X-Proofpoint-GUID: -2K0Tyki1fTdi6MpqoHEO-OqxYnhyKUb
X-Authority-Analysis: v=2.4 cv=eJCGH3p1 c=1 sm=1 tr=0 ts=6abad41c b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x4eqshVgHu-cdnggieHk:22 a=yPCof4ZbAAAA:8 a=4fsqVjVFvoJX5W-3TVYA:9
 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA4MyBTYWx0ZWRfX2xklNVqlHctg
 zmKn1xoeicJDNsi85u7XL98z2GSh9ncWXc5CwAb2bb8gA4o4TnMYeFZs/RREt275sIbv3PW5rbd
 b8cA9BBdSngV/bTrRrS2EZ3qU+9O9ckzndGKLQSTSIjSbV5Y73ts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA4MyBTYWx0ZWRfXxT8XG+a0qpZ/
 ELQ3LhqjKDUjECxsZEljRSIrcdDto4dqUorTIJj7tc44PqSZ/eH2wuPtfZIFBjz74ZWLZJdeFXY
 D0dd2aatRCS9eM08kw3jlklwNBn+0fC8+mFSvo5fRp/QcmxYgMz4rcBhXZuLqtKdLSpA06QX7Q5
 Qbh3RUSfYQZJwKrx5m+BrwzSaGmHrslxzGS/hZEDJOdwThHGPFlUdqvd0AwHLiowOzS3uePgVmA
 um1TbQoTtt4c/04phaoTvRILEtvAo5LjLTd6cki5Kna5o4ApLMoxvBhmvmZ0zl79zrhhQfFDVTx
 Tl4ioHOlb9AnDxTgoZUUcRLbRXADLjehQQoHLOwwkKQPL7GskBpRfp2J0dd0YNQmtp9s1MQ1L1Q
 rcUqg/fPnF5qEFMkLXXHUs4TNZENBjfP1sXIdG8MTQarMlsozhm+U70tswSejTaCboZTlVSq+X5
 fM75NgdeL3TtYKwZnnhgswJ7KtJWtnWWECx8nbv4=

USDT ELF notes used to contain utsname information for debugging, but
this has proven to be troublesome for distributions that expect to be
able to regenerate build objects with identical data.  Since the
utsname data contains the system name, the USDT ELF notes were causing
comparisons between generates and regenerated objects to fail.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_link.c | 48 ---------------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/libdtrace/dt_link.c b/libdtrace/dt_link.c
index aa5eb735..d8188881 100644
--- a/libdtrace/dt_link.c
+++ b/libdtrace/dt_link.c
@@ -261,52 +261,6 @@ note_add_version(usdt_elf_t *usdt)
 	return 0;
 }
 
-static int
-note_add_utsname(usdt_elf_t *usdt)
-{
-	Elf_Data	*dbuf;
-	char		*buf, *p;
-	size_t		len, sz;
-
-#define UTSN_NOTE_HEADSZ \
-		((3 * sizeof(uint32_t)) +	/* namesz, descsz, type */ \
-		 ALIGN(5, 4))			/* "utsn\0" */
-
-	/* Ensure the note starts on a 4-byte alignment boundary. */
-	usdt->base = ALIGN(usdt->base + usdt->size, 4);
-	usdt->size = 0;
-
-	len = sizeof(struct utsname);
-	sz = UTSN_NOTE_HEADSZ + ALIGN(len, 4);
-
-	buf = malloc(sz);
-	if (buf == NULL)
-		return dt_set_errno(usdt->dtp, EDT_NOMEM);
-	memset(buf, 0, sz);
-
-	/* Construct the note header. */
-	*((uint32_t *)&buf[0]) = 5;
-	*((uint32_t *)&buf[4]) = sz - UTSN_NOTE_HEADSZ;
-	*((uint32_t *)&buf[8]) = 1;
-	memcpy(&buf[12], "utsn", 4);
-
-	/* Add the data. */
-	p = buf + UTSN_NOTE_HEADSZ;
-	memcpy(p, &usdt->dtp->dt_uts, sizeof(struct utsname));
-
-	/* Add the note header. */
-	dbuf = elf_newdata(usdt->note);
-	dbuf->d_align = sizeof(uint32_t);
-	dbuf->d_off = usdt->base;
-	dbuf->d_buf = buf;
-	dbuf->d_size = sz;
-	usdt->size = sz;
-
-	usdt->notes.next = NULL;
-
-	return 0;
-}
-
 static int
 create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
 {
@@ -398,8 +352,6 @@ create_elf64(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, int fd, uint_t flags)
 	if (!(flags & DTRACE_D_STRIP)) {
 		if (note_add_version(usdt) == -1)
 			goto fail;
-		if (note_add_utsname(usdt) == -1)
-			goto fail;
 	}
 
 	dt_free(dtp, usdt);
-- 
2.52.0

