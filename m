Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43D0421234
	for <dtrace@lists.linux.dev>; Wed,  7 Oct 2026 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368550; cv=fail; b=kmKhyVSBOseuGvo+YL5XKTRbcfGW8TGg5kZPRJhl6qzuH0t15SSZVU2E3asTKKn6F8m/O1zrn9yV1aB9h2Y3Kbw22stkeMyLXlJCWqiim76cQspGF90HKVM1Pylc6psRWM5+z2lBjhDCMPCFbYb8LalyV4CyZjCrVv3pbIlEYBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368550; c=relaxed/simple;
	bh=n8x6vKQ3vzl15t+6u2QEtbezYqOyDc5H96QmYpg7bXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s+b/RZs85spl7gzRvzakRVlinbA44F3P1E3pVVTpv9c7/bMpMxJz6VqvtzDVg7ZujOf1kHw5I+gqLOCZQsLHq9IF/xhAP1RR5zLEfxdF0lRDxfHyjvBN7GZG/Yt/zbRbd16WsAt8pOgXFr+a5d6NGjCthAcpLfzxFmWWKrragX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PSkxIEn1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ovj60QdJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PSkxIEn1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ovj60QdJ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977g9w22106062
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 10:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TaqdvJytC2MQaakbf+
	n9hAJJUAEMaiyUKIA77jIlSCQ=; b=PSkxIEn1R/L3z62AYuwgQ1jJbHMK4Kr6qb
	xYoQcv5yqqVHK4Cv+Q+SVP8CgLpHdGnP9+s6FKKdsrWEvv5Ec3OnLef0ZTuyhJIu
	IqQJJLAnBskOx0MOCQKMgh//rI7OrvIFX5IA2QOvQju3HCRBjtWFLD7r3ZChcPbt
	VWOcdTm/CltbcFHQjeLTMQRS4aD3BiP/MwYVSxHNzTx/SS6FJKX2xdyRrz/K9Xkr
	QFYg4NjviynkfLa6EEjA3YQTsQSexLZMpkUdjMpeoP/jf2vczCJcURrTzHJadwky
	xRDLcSZnM9ipVaBlntm+OSD1Hw77qxBSdIlMIHKT3OJKA8WD12gQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2sk7ne7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 10:22:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 697ALAZ9032177
	for <dtrace@lists.linux.dev>; Wed, 7 Oct 2026 10:22:17 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h4d00t407-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Wed, 07 Oct 2026 10:22:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0tfE1Zw+ZQjLZgWlxkbvmGWkywp+XenvRDhDDmMqsV3g9BGRejFXuH1yaJQQ9bNXKAjfyO+PY1JjSDp0kBRS1eMeu1FdLJIeN8UqzGDA9xEe3Ib0CWP+QH2fkTlUrBKo9ho7D8fIt07KGHhscfaMoA8Zqf82Yz8jnLCwrsEGJ++2Nsrce1bNPRY7Fe/p7qCxSCIVLrv9BO8wVDhKqGfQtwWNhI4+PQjcFUt7d5ZFwjtHqSPe6SiMxPvbv11+MY5dSUU+OUMRFm3S8i+767CzjnZMRf9BMRvNJHWN/fpNt/t8dVYkAswMMfHMYPtFpmJbVqXVEh2nBgHhoreI3tJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaqdvJytC2MQaakbf+n9hAJJUAEMaiyUKIA77jIlSCQ=;
 b=xRB/WTRnO5ecajf+No5Y6idZtK5wElHqJ+4YLSNSuxltcQkG28zVNdV6J8aKt/5f4J2MgIhlEb3KYfjqWkqGSXCybqs/C+j7QN8lrgrM+QXy3TMipfO07LNzONDTJD97rHvzi19gE6vLGuhdqnDGa29wRjG4l3ik7Q23K9lXwWcRyXSmfWkjbRyeUUY4bdDYscN1f6uTjl7J3ovadoujPoBKuFJtUxBcoai6nK4CDzlZl920v5IiZOym78U0Yct7304+J0y82BFCH1nBpF64N/L0OmqW+DxQSaYosz0A3EZTeuPYAH+Uy8niQpuud5+OIButLjiovEAgx065Wg6S9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaqdvJytC2MQaakbf+n9hAJJUAEMaiyUKIA77jIlSCQ=;
 b=Ovj60QdJPzP0K8S8gWDuCRTtPqhxJn4RhQY2DgA9jel5dWCpYPn21nd2EK2AdV3+ye4N1nwzbtlpMZNyPfLua0OnUaG/U1pySZmASCJ1qPvZhYQpynQJHqRIyMljSdnS7Hu5g9A7WO4Rol9+/VMSm8verPsFDY3SbAn+LAjjPRM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by SA6PR10MB8157.namprd10.prod.outlook.com (2603:10b6:806:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:22:10 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0496.008; Wed, 7 Oct 2026
 10:22:10 +0000
Date: Wed, 7 Oct 2026 10:20:49 +0000
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 03/11] libdtrace: avoid BTF probes for ranged built-in
 modules
Message-ID: <asYdAbzPN9i-OSFN@kvh-deb-bpf>
References: <20260821161100.41710-1-alan.maguire@oracle.com>
 <20260821161100.41710-4-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821161100.41710-4-alan.maguire@oracle.com>
X-ClientProxiedBy: CH0P221CA0038.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:610:11d::24) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|SA6PR10MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8c0de4-500b-47fd-b113-08df245cd8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	etWKd32ZtyLL0ZXWeZJENhkOd32CHpy1T/F3sMFMhMXOUYJ3aU/U2h6ati0CsoONwEHIx2VSuN0SryqLUJFo7IJVzeNbOcgB+pqEOZ6X4PHy6S2Zu5m7Tsy9r1s+9PR4SEUN/t2b1GoFZFSETPKIGRGfrhhcLkEb/Z29QpIlWWXyOD8t7Eu6yTIaB5Fb2bybb0rLMarqQK0Wzripg9gwkCaXH97J28bOJklKsYT44bRUOinccln6lHolbuuvNSa4BBoSCxRRji/QX1geaYcTjukwCywcD5wY+pZXXCDdlxK9qBcvIGvfu0IT8gpszq0at+wFGn2a+dbGYfGKvgSHW0oLRLtu/mdGWkhLYNDNEWitnkHtO1IuYcIKwC6wV/FidNT8TCmWcqEOt8u5eIPBXaNHyj/wZSHzyUxD09KYUqwGHhqJuehEABCF5rD5/+zFi+tTBCARunVx3NUhsZpHC/dIoO9OfUHZPOqOBk4rndHGhg1uleMXB5k0FtSFbmqJF2qLA17UXIboBScOkhOb4dI3d5y5zSPQ+XJtxadNVLnNXwX5hn/gxQjuAt5m3HZ41o7IsqS88PkjtZozceECiAg3IM7uGtNswO6F9d1PS7hYd0/kG06oSRgfKfa0G9vIzq6BUzJpfAAn2mLJUbmwBmO2AcX9TckPUQgLLUu1qUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QZj4LTfecl5Iz/zsJvi0lB5+L1Cn/juKlYgbLHQ/mRWrekEyyrLnppGOV8Ye?=
 =?us-ascii?Q?w8vXjkxsfdUnthbvv/2n6AN3Nu/k4mWi9NoPxHFUfwVGCFRYkhIkdrjWgQzx?=
 =?us-ascii?Q?JRWsATNsIvPM+C8NZgVNZmLyEDvv/Kcuu53NMAXNGCKo+YG4i69MOGTnia5e?=
 =?us-ascii?Q?b/N9rFgBw0q9dsz4+L1UOc54YvWRBFCNpga4gjNxbP0JQIoyqmf7z6cL6luY?=
 =?us-ascii?Q?5W9b8dPUQ56GrJb9g6gCTE/dfnI40mQ6bZhQvxIsp+tBFiKlrC8R6epR64U/?=
 =?us-ascii?Q?bRSyHDodk8cLz1TbSRHS37R3pMxCtk8NeRCdke7oPTyW/GWGPpBTja8oMcQ0?=
 =?us-ascii?Q?6QIQarYY4to5vBTNZY+ZAAmBJsRXt8w7ac+fFSmwgJvGtGyLTy5Bmg9taoi3?=
 =?us-ascii?Q?Crs/gHTzCcw4jpI2lDddHLqGcLXpezTWiZeKbqA7Xd+Uf34yhLThYCUccqOd?=
 =?us-ascii?Q?oepTrE9t8zSs38djEIRaRUrt0+DELX9J0Jl7vlDX5Fy5ddJbAJBkRcl6BIPJ?=
 =?us-ascii?Q?9l+mTipbrbM2lnst2g9KrJcI3h1O9QCtlhIZjXRp0i7duXUF/uo+Bg3GELqu?=
 =?us-ascii?Q?wxPMbLF/pFZ4E6711Xn9CQZ29bKFpbuzYWyzIMACQcUWro8kr2vHUkBJ613N?=
 =?us-ascii?Q?IRLjW8LY3vUI5JGYOd+M14WS00SFuXRC+wsojLNF38/+GSjbDVHu0wrb9mcN?=
 =?us-ascii?Q?4FmipKP2hISYBnYMgNJQg+LLE64MjEX7o0g/uzqNOiyJtT+MixACNFSJ/qQE?=
 =?us-ascii?Q?zhk4Sd+6Hiu2U5AukyP9clY8Z3bfdVMaVBNrzxnfh6hb/zh0p/xixrSmxnM9?=
 =?us-ascii?Q?I8aq6SKRCn6twiY8bciWImnycym4pPq0e1ro66/wQ6Gbs87aTGkSpwBBllcE?=
 =?us-ascii?Q?i8c76v4cQq84IFPXU/OtpUwHDtFc7zYZn9NMCdz50Pp0vgkShd9nzbOEOrJ3?=
 =?us-ascii?Q?itnq8tyEFi+R+4nQoqW+ITYs+QSdsG4alkqRFmSKwVIu8lJdACX4VT1AMk4d?=
 =?us-ascii?Q?hsiOO+8T/nryEBcij+XN8i8M+eWJ8ZW72yThn84Khnu+MGjEHhXT3/TCp1Hb?=
 =?us-ascii?Q?KHYC23qGh+uQ8kWmGkjOOJI6L+KmGcMP/lC9slmkJ3sYVSFRmzsEd9rTQYXW?=
 =?us-ascii?Q?vmY6LGj3TLroYxpLXQh6rU9lZqp5Qu6NbOR+WayrAGr296EuhUpGnsq+Xrk6?=
 =?us-ascii?Q?Kgf4PObPXA6bQ3a9z3Ie7/T1lsggCoVn/2DWgeYRlhu5W04yMGjokejyYdTo?=
 =?us-ascii?Q?YvVB6RoL1XJaleP/xEoDtZek9jMEMbq1Achjv2KZZ4yGmrxOnsoCeLf90+N3?=
 =?us-ascii?Q?Q0iEZY+NmhUP/zb0kR1T0xrha5k0LAZfJbZN3r579aQY2/ygSQQeUhVcs2jN?=
 =?us-ascii?Q?PzqE2aokT40yA65aLZ6Y/Q+S1ip5w5YV8ZBNkrum7kl6M18XFKq+9235IueS?=
 =?us-ascii?Q?dFbwegLgwFxS2TaS45t0jaRzpQmpODlJ1oZ5RwKAFJ2G+wyBSIGcJI8o5Mfy?=
 =?us-ascii?Q?CH0lv/jNzVaiTfJOUwiUjmSrw6ppHRAVNJaYn7ihvkHI+gOx6RSs6ICysoWd?=
 =?us-ascii?Q?RGuIi7hzLS21PjvWipvw4olE1yXPmoO/fcGDGd7KvBPtn3XwGZ/UWOsw4jL8?=
 =?us-ascii?Q?BMC5K0K4LL/at+Sb3r6PW+GfoaRdUTlN3CL+3NPkhn6RQl5ade/Qbusz71H1?=
 =?us-ascii?Q?hqBGERrEh2guIe/GanQCodeWA71kSpssi6YezBCPN7/MJnXBx293MDS+PNxL?=
 =?us-ascii?Q?awdqYT4kfFw2PvyEIB3rJrJeJ8bS5nU=3D?=
X-Exchange-RoutingPolicyChecked:
	mbZVhue3Xbfv9yFJyMvWaEotQeMv4C2R/ztmq0W/ivnVzY6+shPLhDRwZur/5bnyiAuP6itsuAtopoxUFL5xK+8t2FUTJNjTjW8Vl/gtMGrbRRmSMQLfOuXP2Z4AJy03CtjupPDpBHGyvRO2mnwa2o3vdA+LxmSNnBl9PhXRsYyJcw/Go0tGbL/PpjQYX8ZTQtFdCDAWb8fjkIScBy9LmZPVkCrk5gQ3JrDHDPNDzPKD1gUzJGYpkBfj68zunArRf+PbeXKNbI9b7OHeifwds+FWyLfR/NX8sxsAehtrMyoXolre1wfeo1IcxGSOLXkQIJJDIP+1YR/a8M56VQnzrw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sIKFvv/BcHoJXs+3DsS85fLYN8OteozNNuy6uOnsmSjrvvil2M1DRunhkkIjmq13srWIlvAoatHQ56WtE6y27LQeXTTp3fiLrVnh2hO0K6IC1Muf61Ty24qe+dREuamm8F1p1Os1+UqIOO3Fk3Qjj4kEu7IKIFhf0m0qaaBPBlP6PFaJLQXOyAo3Bixq6Nka6SYeGpQ91UwVc4VHp6IvInazHpyR78ufOSkEnlNL+n8TR7/H9u+raqlWdFHU7c9lNzIrhtm0/e5u4y0ADurmbS0ZnUUcLUvykZ5gq0j/vAbdu3aHJtdyKXR026v983TjnBotV+uxOGZ4AmMbswZ/gI38enbIGB2THC+sJT0oR+mcbmcjMJ6kBa/huf8h1YRRNt8+FarlLdV5ZixEaB3/RPz6xXYAGg+qGdStPUlTvYPjrShIemyRCgOrlf/OUssfmdJJkemHW3pGwAdzrDrtp24ZUnE+bVC+meE+QaY9tehwTd6qGLkiRw7sykjIPwHCHE84UnM136Hoyjc+e2ECnKmVKK5JwUFymbH9FvUsX2fyfk4owsCyXWVulgdG5iUDqGE0Qy+bMJKuM4YpIIZCSuFJHdWAJ4eBirVttsx7LQQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8c0de4-500b-47fd-b113-08df245cd8a9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:22:10.1666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rah4T+A8fDN0Drl3azbzLsFYjedvdVUETZYTd1MAxpuVpSNhH/v6SFfiahfxZlPgXNNWhTr23VGHJp3VnluqJUOUPajcXjvYDwQc+hz9HI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8157
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=953 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2609040000 definitions=main-2610070041
X-Authority-Analysis: v=2.4 cv=Cpsq4X4D c=1 sm=1 tr=0 ts=6ac61d59 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=yPCof4ZbAAAA:8
 a=MenLz3yfUKRBz7TFPQQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 8Y8l8N2-tqEk6GSEzogNNQQntY_5zGn0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX7nZO8TAAv2UD
 wIEq0nzuQj6vVDfLegyryQ1AAE93Ia2e0Q0dEt+lSpFgq02SM+VB9tyYmoWZEl7IWibKtaBl4+9
 Qj+oF3LFvsQ+8FHVdzoEHnQgY+WtzDnzG+6kMMxequigmH7JiRWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX63HbQs6MuFVi
 dNnx87uAd891OotrbanMjjMQvatv8NTOqlgZ26sPgtEqLuREgGBtpNpPZAMC30F/ZrpTe0xoPHZ
 Wf/ZOy9iVDwPm2SBjDCYne7E0K4vZngNMXh1wv+ki5YfzL2AbPTzduOwyzLt64DHHCOuWPb2izr
 HjQTwymxxwNTubH/sxWyWQbv0EzHEMdv0BowB2MDBFKJLttGmoMSko8RMFq2TG2dY01Sk27AqQk
 eWc0Oj2wGo41x6APMk950TOx9H1P3vfiHHUyH1VlWyG7RPMn06KnMoW1OFH/jL0JEH32YxjtOYq
 Y6StG/y6SSAUCpaGv22WL6OD8hpWk2xoLSyYjrN5C8EFbxyF9if8uEbejhU9FJ3SAuymTpD3qA7
 yqx8Ytf0WGI4/cdhEd51AEWTnTKRXmCt28sXwxBxfFAU4bYTmjT0yXINXdZ/QI338VGLdFPwx6Z
 9fB6567FjbSa+xaotDg==
X-Proofpoint-GUID: 8Y8l8N2-tqEk6GSEzogNNQQntY_5zGn0

Some questions below.

On Fri, Aug 21, 2026 at 05:10:51PM +0100, Alan Maguire wrote:
> When /proc/kallsyms is used with modules.builtin.ranges, libdtrace can
> attribute symbols linked into vmlinux to their individual built-in objects,
> such as bitrev or atomic64_test.  This creates module objects for those
> names.
> 
> These objects have no per-module BTF file under /sys/kernel/btf.  Avoid
> probing for one when modules.builtin.ranges has identified the module as
> built in, and use the shared vmlinux BTF directly instead.
> 
> Keep the existing lookup path for loadable modules and for an explicitly
> configured BTF directory.
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_btf.c    |  8 ++++++--
>  libdtrace/dt_impl.h   |  1 +
>  libdtrace/dt_module.c | 20 +++++++++++++++++++-
>  3 files changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
> index e7980969..93ecf5cd 100644
> --- a/libdtrace/dt_btf.c
> +++ b/libdtrace/dt_btf.c
> @@ -915,8 +915,12 @@ dt_btf_module_ctf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  	if (!dtp->dt_shared_ctf && dtp->dt_shared_btf && btf == dtp->dt_shared_btf)
>  		dtp->dt_shared_ctf = ctf;
>  
> -	dt_dprintf("Generated %s CTF from BTF (%d types).\n", dmp->dm_name,
> -		   btf->type_cnt);
> +	if (btf == dtp->dt_shared_btf && strcmp(dmp->dm_name, "vmlinux") != 0)
> +		dt_dprintf("Created %s CTF import from shared vmlinux BTF.\n",
> +		    dmp->dm_name);
> +	else
> +		dt_dprintf("Generated %s CTF from BTF (%d types).\n", dmp->dm_name,
> +		    btf->type_cnt);
>  #endif
>  
>  	return ctf;
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 7ccdc271..38c5ff0b 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -201,6 +201,7 @@ typedef struct dt_kern_path {
>  #define DT_DM_KERNEL		0x2	/* module is associated with a kernel object */
>  #define DT_DM_CTF_ARCHIVED	0x4	/* module found in a CTF archive */
>  #define DT_DM_KERN_UNLOADED	0x8	/* module not loaded into the kernel */
> +#define DT_DM_KERN_BUILTIN	0x10	/* module is linked into vmlinux */
>  
>  /*
>   * Why do we need (only) 4 slots?  The maximum amount of string arguments to
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 00978911..ea6d56c3 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -871,6 +871,19 @@ dt_kern_module_find_btf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  	if (dtp->dt_shared_btf == NULL && strcmp(dmp->dm_name, "vmlinux") != 0)
>  		return;
>  
> +	/*
> +	 * modules.builtin.ranges identifies this object as linked into vmlinux.
> +	 * Such objects cannot have a per-module BTF object, so use the shared
> +	 * vmlinux BTF directly.  Retain the usual lookup for an explicitly
> +	 * configured BTF directory and every other module.
> +	 */
> +	if (dtp->dt_btf_path == NULL && (dmp->dm_flags & DT_DM_KERN_BUILTIN)) {
> +		dmp->dm_btf = dtp->dt_shared_btf;
> +		dt_dprintf("Using shared vmlinux BTF for built-in module %s.\n",
> +		    dmp->dm_name);
> +		return;
> +	}

This does not look right to me, because if a dt_btf_path is specified, I
would expect the handle to still provided a handle-wide shared CTF and
BTF, even if it may be different from the system-wide shared CTF and
BTF.  In other words, I think that sharing should be based on:

System standard CTF and BTF -> dt_shared_ctf and dt_share_btf globals
Non-standard CTF or BTF -> dtp->dt_shared_ctf and dtp->dt_shared_btf

So dropping the dtp->dt_btf_path == NULL in the conditional clause above
should be fine, right?

> +
>  	dt_dprintf("Loading BTF for module %s.\n", dmp->dm_name);
>  
>  	/*
> @@ -1405,6 +1418,7 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
>  {
>  	dt_kallsym_t	sym;
>  	char		*modname;
> +	int		builtin = 0;
>  
>  	if ((line[0] == '\n') || (line[0] == 0))
>  		return 0;
> @@ -1440,8 +1454,10 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
>  			char	*s;
>  
>  			s = dt_kasstate_modname(state, sym.addr, sym.name);
> -			if (s != NULL)
> +			if (s != NULL) {
>  				strncpy(sym.mod, s, PATH_MAX);
> +				builtin = 1;
> +			}
>  		}
>  	}
>  
> @@ -1511,6 +1527,8 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
>  			if (err != 0)
>  				return err;
>  		}
> +		if (builtin)
> +			dmp->dm_flags |= DT_DM_KERN_BUILTIN;
>  
>  		err = dt_modsym_addsym(dtp, dmp, &sym, state);
>  		if (err != 0)
> -- 
> 2.43.5
> 
