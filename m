Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0617D1E882A
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290378; cv=fail; b=XiNVeOS8sgL1gfg72fqZ3vUX6Ms5jntTtVg9UMaPkJF1aQzu93sunTUwxhxWbDGG8QqT0i3sZ8/dUVeVy3oC1DnyGT935tsS5S7F+G0Dw4YBTJYf+QqzxmTsq4YNDMR8GbnJ8BsPe3ea056aCtDI44GwL1r4BKeYsVyd7iLYymg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290378; c=relaxed/simple;
	bh=9Ul9Q3XleFJi+1F1wcPoRjBttPtMxSw5PqYpzJhXIQI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Cu/glmEtsKwQRXl1qayBmUeSSWPqkpcPqz66yb+w2d9bYXOkp65/I9B5UaH4ytmnH7qFmzC7PgcLYncn2Cckn79UXcqsevSMZ6LSdU4tf8lMh6LWMpQ4Wpt56a/vm6dOE2DJVXy1ZHF4lbAHoLUg8WAZxArCKQXPo5OO4seXNA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NEoOV42N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=J29YER73; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NEoOV42N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="J29YER73"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fe4m027042
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=VF3v+Wd9BEAF6REKGRr9VPlQKP9bL3Mh6g8BvmVQwoA=; b=
	NEoOV42NlCYGa1+eEjze0KecjAfH+RKdXrciRy4WiguSnsRPkZW25F75/7d9sheU
	E4zEhG66K3t8qCDqOqOhL28IijPhTuIQjgCTRK2ud2yS+ZZbEz+vzPzKYjREws8/
	F0fzCJN64bGXSQhDFg/8IQjpw6CvWfqBSLCf1Gr4BHlPN5qlqLnfD/DLBF6pPa31
	TRAwvk1ehn6YTimjB9QzqCekIfIShbA8ZyeEiJPfQuyesv0ruWVT0c+/CUWmY06f
	dTDZJZa0p/AuhDt5rPn+yXtzIswN4JxqqSzMFyyAHYgWturPCCvnj0A3uJ+6SPdt
	06Io9B4DHVAzev7JT7oUfA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwfs62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UASuuj004798
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2vkye8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:12:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdvD4J4l7jyRDrrogEl2XyiWRv6zzkvTirYr64gMgd8xRdT6LvdfdJimHLsjd63PTlU7KvqzSZiH8dfn9GkwmGAKzNeHj5ZrIApSiM9gJzuxpqYei9gTiVKLBT+wajNBPfwuOuCJuNrcN6fMmpR7hDdR9B/lX7KFm6GzE9N0u3UtUKzCY0Jh0gSX6cPJ8E1T36m/3IJ+ryLWx/p5UwDZfe0A0gAecXr+1jL21IP+aY2qtCAWSDWtZc15DWmR262vP1V0y6CCkgCaqH5TwkZKSc0OQHr4H0FhgJVAUVvv888ehveRa+5WN+w22QsQ/zbc6HFrniaSdVLsLRcw3d6G7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF3v+Wd9BEAF6REKGRr9VPlQKP9bL3Mh6g8BvmVQwoA=;
 b=iwsChlQpB7ddo78o6wqqInx65Y89KB4VLgqgGm38TkWaFuretn/GpHJRepu2ZW+CTtLVYrWxkFZfmndCRrDz2UZkOjq3r+jAlz3TmAgDQ615FbzaFi3xnrYXyEB3ikX8bdkpKRGdZFM+fyimRhzV44viHdPMulq5mY+4Lv2mf+H0CK0OfzQEj4WEvlTHwXth6z5sUYujf7zO66bL8y9b0GaJaSYMD3p335hFh8yBuSuwAAKCTJ5rV7ndHV3wqKVQuGPnBwUib0ac8hty6aIWPYnhja18r/y2EcleXBnUMd4gD+3u9KzODPVKmDoltLduQGdvZJOd6NGaKkZBC4Umuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VF3v+Wd9BEAF6REKGRr9VPlQKP9bL3Mh6g8BvmVQwoA=;
 b=J29YER73kRMDIrZ0l+ibY16THuHBTS55wEuBHEGwA51iUABvwjNfDXoxQPQqzntmfa08X0bjv0nZEb907PukJu1mWeFliaxhc33nbLDYPeMwbXCrsxs9OBhaG5wWF0EWJIY2ceuUVK2DDUxe7eIac39UKQsJMgJeUTNZDPnBS/8=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Wed, 30 Oct
 2024 12:12:51 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:12:51 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3 05/14] probe: improve dt_probe_lookup2()
Date: Wed, 30 Oct 2024 12:12:27 +0000
Message-ID: <20241030121236.257803-6-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030121236.257803-1-nick.alcock@oracle.com>
References: <20241030121236.257803-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0448.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::28) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: fd820c0b-02ad-402e-ffbd-08dcf8dc2cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mGepZrvtV/fhLDQXGhWeYL/sTSzyvOcCuzAE8FIVFN++ZUg4Mh1CymkHeqGk?=
 =?us-ascii?Q?P5HaiOBjptdECRxZ13Hp6a5SNBR1FNuqqTIjYQfrLkvI3XihBic5y/Q5Jemf?=
 =?us-ascii?Q?0DrgZDnNiqpa2K8GYdFsxxt0hK0SyNZcWNE2Xo77q0B6dxomlvs8Uz9l0es3?=
 =?us-ascii?Q?erfNikAp+7JBuyql8i/SUNk6CE2H14zGb1q+AcMxXGW1/8ss739a3ERqRtE1?=
 =?us-ascii?Q?F6F4AivwPm43UgmxbBxfAEtscxdQE4zDCZilHPkTZlEmGnqHlQfaQlJlW+A3?=
 =?us-ascii?Q?1BLFpllNyjsv+6KYuImSSEsLvaPCz2SIiwUdHCJC3zpt7ZF6bvEVB/QhPmC6?=
 =?us-ascii?Q?o5FpWvSkx9MNgpB7jgK0ktLPQ1YJLNXNLXLUJJFsM/pXLj5yDbshrcpjPfWP?=
 =?us-ascii?Q?IEQ65FmcOmNQsfu43nTgbh5D1MvV0xPefV/3Fg6tV3EiYlAKLHK0xCx/n3df?=
 =?us-ascii?Q?rDrWHDSaMPFBtgz5fjsPs9zkmyzrrHSymiGzzCmObNdo2Ls2e3S75f4gKDJQ?=
 =?us-ascii?Q?zd413xLm10dBSs0RpSRbSroIaHxMZBUaOmLixlQ6MZFMydeAx7clNHE43wG1?=
 =?us-ascii?Q?iiuL/V9nM17lnA9bgN+vTvJEwRxoGbA6dciggoJDeh9KDfhDtrn8Vabiggjc?=
 =?us-ascii?Q?qMsmaWy15dozzT3BT1QvhjSDKWHnDidsJu8XbMbQbesqJUhj0B9khOO+Op25?=
 =?us-ascii?Q?6onYHz1YdpMbDG6c9a8Qqd2vqeGa3LN3rLRnTi6gDMGai0sRi9goZNH9bhKB?=
 =?us-ascii?Q?hd3fYopYbs2Fm/wMVK7lR0pGViIfdTWjs02+PKUCwWDp5zc4HHZtU3XMLg8O?=
 =?us-ascii?Q?5ioMYihY57mUD3c+3Dz8ZyAaSm2mgFKfGZllG9DWVMhjXlXrvJmm3VNs58+j?=
 =?us-ascii?Q?KDpurMEhvDAW0Tqjcyvuy1BnJhE0LcWKw62eiDy3LgYBw14bhHaNMtoiIIf9?=
 =?us-ascii?Q?l7n9vEypTlTxqqo5whjNMYWjgtwW/do31azOGpQNFKBk4vvbFGWc6G6sCLJ0?=
 =?us-ascii?Q?I3UR6eGVEYcC9AssP94PPkLYBm1VKbxCFrq6Hmh3v7ajd497Qb/CONLoNFmr?=
 =?us-ascii?Q?82ZZv/Il7XSQUDzVllSlSi80ZYnSXNFk2f7LODC6n8vx4n1Vtufp0vuRLrnM?=
 =?us-ascii?Q?rrQwD/HOgqfJPghWMXr97VbNXd3g3XUqbg0NzukUBgsIIN5D1q8cqlBJXSws?=
 =?us-ascii?Q?OjsIY0eov39dyM8JSsZrzW1xodD/kypRuwfVreHYt+CNR5KaqMeUZjUibkXI?=
 =?us-ascii?Q?wEDZsFNpdjiuxyyIBwzf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HlN35t14TGeAvLyP5/EniaMRC6KeaTvzLOEt4qUHycbNI9EQJvMFobjwtT57?=
 =?us-ascii?Q?5wUwCYyMqy9Q0p150allghKfA56ItlMKu0uDGBSK9KpxBCo3QI5OhhtnR+uN?=
 =?us-ascii?Q?87OjTuNAZ7OpRji3hdeiE6KkCpw2KZcKhq1aClN+DLbE9++m3EJNuCbp8v+K?=
 =?us-ascii?Q?O09nBMjpis6oSGVqSjbGViIKWYD3rIgEmbVqiZS5BfVTR8iqeBuVjZ8LMD/P?=
 =?us-ascii?Q?5HOCw4rXD7rf12fiOmQ+vjHgd8QrfEGmSCeRv9e4N2KCRq3kA3BiucaA5w64?=
 =?us-ascii?Q?uvMQxRiWjzLgDpQuNu3yZZtul3rFM48jiPMIIWkvEyEsiloaXtLqpgEDHjWM?=
 =?us-ascii?Q?ddw6GfeL3Fr0WuuFu6DtqthsXLTm6/qy9uGu4xZU+QjFPPeK4tuzpEjijTvv?=
 =?us-ascii?Q?8LJ2Yy4WSnuxmZzT7O1Q//U2lh5Jswtbv5ldgSD4lt9v7UYod8W40810ltXj?=
 =?us-ascii?Q?SFHdR044Ezh1k47UyNvG4wNR97qsY+Crj8jdPF/zduwllo5xokL1SaJQrkfa?=
 =?us-ascii?Q?ksGEJthoof95CuIS0PwLbID+CEpbKHLp21Jp1lXX8fulVYjW/3WS0/biXxPk?=
 =?us-ascii?Q?LvCKauLhC2ZcPJ5uqeNdvxWrArluCvPnwGKTVo9vxEMkgS8KVS08CmkrIfqi?=
 =?us-ascii?Q?m6FubcVw5P7LqWA1nteZIgXfjeqiujN2fw3c8HsqevPpvdTOK5YckD/o/sWa?=
 =?us-ascii?Q?2wiImBR3ilr6miRu9uKWwSZy7igLikQXSBwH55bCPeJ24GpQLJbHKraoxnt7?=
 =?us-ascii?Q?CHnXThtuPMBA8d6o/P4xJllCKS9GasTM5hNC5IW5BrdST5J21AQ2CtsuSUIb?=
 =?us-ascii?Q?NFEyR9a7EvKAXcpIraLP/e2PY31mUTifmjY9HzJezkRgSen4an2kRukkam0L?=
 =?us-ascii?Q?kvaWKiPGozfWus329VRa8PVNUsZFRTckt1I+1vLzXBNp6RZtD8Rin3AtP+2R?=
 =?us-ascii?Q?Aji40gGj2OGcK/MDu+ZfHWIvNGBn4r9bO9n2z/erTIP/4cTxxsad42FFyeet?=
 =?us-ascii?Q?PkIMUCuwV9KyYOGfk1AKG5jF4OdZeD/GL9fjgi7Io06pq5HrCTqk3KLSyyaX?=
 =?us-ascii?Q?c+Ix7DFLPQ71rjhurqk11JO48Xk1gHYXTZ2eUqEp6i9L9brpZsy9o7lR/2sW?=
 =?us-ascii?Q?lpV45zHsXWTPc2NznSCHpmaxhOgBf5SamL3UusxAy55R6d7XHfw6i1TQF9FH?=
 =?us-ascii?Q?pka6x/TV7ZO36o8LtLKD66rTb2MvrzSaSF/OTMsV8OnpJPnqHjNa3RbctsrQ?=
 =?us-ascii?Q?LGIkNKrnKwTZVKuLQAt4feTHgA6BywJ4Jk8DyKuhfc6BeShTHLD+NDcisVuU?=
 =?us-ascii?Q?xQMJ61J5owlrwAg7Ynrh4fDaW936EKXhqz8EeDwR0/Hl4CnlT6LsQITE0kE2?=
 =?us-ascii?Q?WQEAmyz0XC3AoLiqXri5dT66uDXyJQM1p5kks1CnA+5doxoMDass3PFB5JsG?=
 =?us-ascii?Q?jWywERqLTQBwB+EAXERfuK23hYJnD7ukw2/LFviCZXeixQCP7SVGtRfJ40fe?=
 =?us-ascii?Q?ObYG73Bd07bQkwQXMCawQLAVaWO15Yrk+3x5lg2l8nn0sdNUloOSm0QhOHDF?=
 =?us-ascii?Q?xdgVBeZVUcCliWl8ygMeV8beH02+SPUchEW3OWWGNdMEI7Jzyij4VHenqEWf?=
 =?us-ascii?Q?Eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	S1NJMHqusi7j+ZPq5Mo1IuxnjMlLaXq/b5/ZEzvMV8UKp5kmtB60pVhDBBNiXpcKvSwji528PsfiPC8O6xNVlel3dtSriViV8NEwUSO2FGcMvlmhzXy+lpbF89Sz5SEj9b/mGs7Jt9EpoP0TWlcgy8cLrQHVxKTd8JITWlsHVkCVNHRmlm/3aYy2naUjT+HogrEsx6NxwXwjfwqjo4R56Q21Rtic65mTDvctSEaBDERMDGXvmmQh2nh4XTfoHhcRZEI5W/VKDwqCsTzOxAQrcfUUuc62fvaqd+ueEGL4vYY6zHS1qmH52B740UeBBnUNzk6hyAVcSS5B6DEDPvthvFqmfhe3K9iOJUJBXOq7YtWqMohUgxetDydpkbCf/tSv5Xl72NHkvZgp15AB+krOTXCFMh7NJTuVORiYMLCEuZY/WUPS9V/cwYRuUi/V4w0n4CyZDL63oxtyn+1c+V26ZXoy9D2Xd5+tD64U3lG5a3YrSd7TyI/w/jkNtO4AzUMR8Ek/xkVJNIjvJFswYNOYqKQSvZQoJfBx2oebZejf6pDDfdNlOYIMYpAe89ILBBZeg4Fd6E0HhhJBMktJLppRdEwtC/vTFZTnMow/gIj/B+A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd820c0b-02ad-402e-ffbd-08dcf8dc2cfd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:12:51.3059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WSRxQ4rhUHPaMNhyVvEue4FDrBRAb4fFbYq3fFg/cOqpi8pWnSoIKZNJRGM99T8JMU+MtNMQmo9XEtgcMZxeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-ORIG-GUID: EWHSUrsAVjxrHeSyt02GCDko-uialXM3
X-Proofpoint-GUID: EWHSUrsAVjxrHeSyt02GCDko-uialXM3

This function had numerous problems:

 - it broke _FORTIFY_SOURCE due to using a function that snprintf()ed
   with a size of INT_MAX, into a much smaller alloca()ed buffer
 - it claimed to call down to the dtrace kernel module for a probe
   description (long obsolete)
 - it invariably leaked the probe description it constructed by calling
   dtrace_xstr2desc()
 - it did meaningless errno testing to determine whether to return
   EDT_NOPROBE on error, which more or less led to EDT_NOPROBE never
   being returned even though it should always be in this case (there
   is no other cause for the ID hash lookup failing).

Fix the lot: while we're at it, implement a dt_desc_destroy() to
undo the strdup()s done by dtrace_xstr2desc(), and use it additionally
in dt_probe_destroy() instead of an identical sequence of dt_free()s.

Bug: https://github.com/oracle/dtrace-utils/issues/78
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_impl.h  |  2 ++
 libdtrace/dt_probe.c | 47 ++++++++++++--------------------------------
 libdtrace/dt_subr.c  | 15 ++++++++++++++
 3 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 340dc1960c5e..5d34072042e5 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -759,6 +759,8 @@ extern dtrace_difo_t *dt_difo_copy(dtrace_hdl_t *dtp, const dtrace_difo_t *odp);
 extern int dt_consume_init(dtrace_hdl_t *);
 extern void dt_consume_fini(dtrace_hdl_t *);
 
+extern void dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *, int free_pdp);
+
 extern dtrace_datadesc_t *dt_datadesc_hold(dtrace_datadesc_t *ddp);
 extern void dt_datadesc_release(dtrace_hdl_t *, dtrace_datadesc_t *);
 extern dtrace_datadesc_t *dt_datadesc_create(dtrace_hdl_t *);
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 686e2a661253..189bf7928e14 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -172,24 +172,9 @@ dt_probe_alloc_args(dt_probe_t *prp, int nargc, int xargc)
 	}
 }
 
-static size_t
-dt_probe_keylen(const dtrace_probedesc_t *pdp)
-{
-	return strlen(pdp->mod) + 1 + strlen(pdp->fun) + 1 +
-		strlen(pdp->prb) + 1;
-}
-
-static char *
-dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
-{
-	snprintf(s, INT_MAX, "%s:%s:%s", pdp->mod, pdp->fun, pdp->prb);
-	return s;
-}
-
 /*
  * Lookup a probe declaration based on a known provider and full or partially
- * specified module, function, and name.  If the probe is not known to us yet,
- * ask dtrace(7D) to match the description and then cache any useful results.
+ * specified module, function, and name.
  */
 dt_probe_t *
 dt_probe_lookup2(dt_provider_t *pvp, const char *s)
@@ -197,28 +182,28 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
 	dtrace_hdl_t *dtp = pvp->pv_hdl;
 	dtrace_probedesc_t pd;
 	dt_ident_t *idp;
-	size_t keylen;
 	char *key;
 
 	if (dtrace_str2desc(dtp, DTRACE_PROBESPEC_NAME, s, &pd) != 0)
 		return NULL; /* dt_errno is set for us */
 
-	keylen = dt_probe_keylen(&pd);
-	key = dt_probe_key(&pd, alloca(keylen));
+	if (asprintf(&key, "%s:%s:%s", pd.mod, pd.fun, pd.prb) == -1) {
+		dt_set_errno(dtp, errno);
+		goto out;
+	}
 
 	/*
 	 * If the probe is already declared, then return the dt_probe_t from
-	 * the existing identifier.  This could come from a static declaration
-	 * or it could have been cached from an earlier call to this function.
+	 * the existing identifier.
 	 */
-	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
+	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL) {
+		dt_desc_destroy(dtp, &pd, 0);
 		return idp->di_data;
+	}
 
-	if (errno == ESRCH || errno == EBADF)
-		dt_set_errno(dtp, EDT_NOPROBE);
-	else
-		dt_set_errno(dtp, errno);
-
+	dt_set_errno(dtp, EDT_NOPROBE);
+ out:
+	dt_desc_destroy(dtp, &pd, 0);
 	return NULL;
 }
 
@@ -386,13 +371,7 @@ dt_probe_destroy(dt_probe_t *prp)
 
 	dt_free(dtp, prp->mapping);
 	dt_free(dtp, prp->argv);
-	if (prp->desc) {
-		dt_free(dtp, (void *)prp->desc->prv);
-		dt_free(dtp, (void *)prp->desc->mod);
-		dt_free(dtp, (void *)prp->desc->fun);
-		dt_free(dtp, (void *)prp->desc->prb);
-		dt_free(dtp, (void *)prp->desc);
-	}
+	dt_desc_destroy(dtp, (dtrace_probedesc_t *)prp->desc, 1);
 	dt_free(dtp, prp);
 }
 
diff --git a/libdtrace/dt_subr.c b/libdtrace/dt_subr.c
index d6aad7637fb9..afcdb733d26c 100644
--- a/libdtrace/dt_subr.c
+++ b/libdtrace/dt_subr.c
@@ -175,6 +175,21 @@ dtrace_desc2str(const dtrace_probedesc_t *pdp, char *buf, size_t len)
 	return buf;
 }
 
+void
+dt_desc_destroy(dtrace_hdl_t *dtp, dtrace_probedesc_t *pdp, int free_pdp)
+{
+	if (pdp == NULL)
+		return;
+
+        dt_free(dtp, (void *) pdp->prv);
+	dt_free(dtp, (void *) pdp->mod);
+	dt_free(dtp, (void *) pdp->fun);
+	dt_free(dtp, (void *) pdp->prb);
+
+        if (free_pdp)
+		dt_free(dtp, pdp);
+}
+
 char *
 dtrace_attr2str(dtrace_attribute_t attr, char *buf, size_t len)
 {
-- 
2.46.0.278.g36e3a12567

