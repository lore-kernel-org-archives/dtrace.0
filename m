Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A7E1E47C3
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730290150; cv=fail; b=pAav1KxFfxFJtLNJMYI1zx8ckACnttXxuAoX913s4zE1bgoh+GYLAm/ZnfacIA/h0K/rnEFSxC7Gt9vypjfIYwdI25N4w+1XYB66Jx/JujMvdxYNWBWz3i2GL/r+/3E4eCEezOyKnSLGwewUBFyWn98VN9whm67eNu0sPIyvM3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730290150; c=relaxed/simple;
	bh=2CIdcoXRnYxyWGUbaFj9cNfbF2cMx0GKvo8hl1XEHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ra/lK6uuSiT/aSpl/Bt2+SHtVu44TYPl8BwuuHLn7dmx28rIJbv+knjIrHaH+m6uNWqRLFCF8YkKKYlX15tV9r3qGmAGhbS50pxuZhZHf9EuyRR7i2zrSNqGC9h6f8M6R2IJNohOfr1MLH52ZK8dKCkHR9g1hzGH9+I3i3v1Fts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FAmiu9E8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xwnAN4eU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FAmiu9E8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xwnAN4eU"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U1fqCR021339
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=; b=
	FAmiu9E8uSNiQjSKkmiVIgqDd14wFt/eN1BJpf1kjsl3FjL/q7pKKpQQs6+O9Y3q
	Py8cj38GGVEPhzmFkxEab9fOOTteSb4ELd7bUcRYeu+0Yua4IeQQq3JgdXNRIFgV
	f0nIznpwcl5Xk1CxWORN+6/1lFPKwDk6qwcptbDOIVEqHNwZm/8iX3g6zmBTF3xD
	OgsuQF1qWDbi6zOloIvnA7TJYlyPiVZNCh5GGb9H6And4L+3uZ7agHssYVTNEcWO
	n+o7NyoaYgIZ8SAorL2mhwlvpbUKiJ3N3CKdXy74pwJn1POkdyOHQBXyBThf2Mge
	aqx51CS9uzQ2/JlFLeNmCg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc8ytue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49UBHN5v034771
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:06 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd9126p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 30 Oct 2024 12:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gcVcSMhdQ8PTUVyRCx6GDZbaoqJWPCGQAdP5dnu3gBnsXWtLBo9JSgXbdjRhM2PPi0fqXDD+yFZZufHTKPsBzJsBzFCGRaFnvbbpeQZ80SGQHPCc9NjQ+QX8CkLtWnhK/k5o59ZDaAxBNu1pjZKrbtGrCUbGdM4I2kF+4+tTXIoZbQyXYxw9uYOoxTd2jZyVuX/0mP/IL6J3XBg1dTc2Gs3rUP0a/LzCpudxXjJ+ZZZBZfCG15jlYMEsC62oCEJjg+giCKIYQBnLxJZxiGOKK/llmyCAu4gxJuDG5fcKeHTmbkQ2luuX8RUDUnV1VGpyIomSKbhPSabu0cTlGqXAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=AJyHulmSOZyKVYhVgAXeOFgKoL+6ZjjAV7pQW2kpHsP003tdG+HFp/hFebK3iYq9tSrAWYN4h/VzsbtxEZASPfHV2WIGubCL5SqD6S1fHYCWN0wL1PFalRCxIZV39CrLQ6NXo7aTCUt9UQGd403LzgI1ITyYNfi7gFQMSQciSk21DqRgy6O4nliKwtXXW3iXxG27N53QGSkaljezjlWu6Ul0dkukgFNGxhJph9upuXLiYczT3G88ky5Ybsv2Op3nsQkM9Sx5sl72mFirX+yG3y2LS6xMcJ/bQxzUtYtfCN/enUVy7Vg2W0NBLamDFV8NQsS9pEg3y3i3O6TqLlynEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/FmapA5JZabI4jAIaHquu7eVxT/8CJY0mSINUoXDo4=;
 b=xwnAN4eUNMe0Cu8jxNRojZHhuFc35KHxWUgs44WEctCEIl7DLq+n/q8N6kOmI4gxL+P5mIEb0a7ndNhOQQz6zQ97xbfcY1FdtNQ3Aj/TIcMB63DA6oDgpRSDdQpBuBEWRAPJo890Gn7MWDmz++6W+sXJU0aYR77uN87LQ934vK8=
Received: from DM6PR10MB4091.namprd10.prod.outlook.com (2603:10b6:5:155::28)
 by SA1PR10MB6469.namprd10.prod.outlook.com (2603:10b6:806:29d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 12:09:02 +0000
Received: from DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02]) by DM6PR10MB4091.namprd10.prod.outlook.com
 ([fe80::3b9e:5ef0:46b4:6e02%7]) with mapi id 15.20.8069.027; Wed, 30 Oct 2024
 12:09:01 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH REVIEWED v3 3/6] dtprobed: stop skipping zero-tracepoint probes in dof_stash.c
Date: Wed, 30 Oct 2024 12:08:47 +0000
Message-ID: <20241030120850.256884-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241030120850.256884-1-nick.alcock@oracle.com>
References: <20241030120850.256884-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::9) To DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_|SA1PR10MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2f2708-f130-42ef-f248-08dcf8dba43d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2z4VPoYW17xpJ8lpIGP/BLxEmNs5CZ0Y1uL2UmA2dAkZlH7Z4MBNZUkBl0YS?=
 =?us-ascii?Q?LQy7W0dlceGR+BW1sEsBByVpHAk+IsSaCitIkKgEfdilgDGJYKhSbyzrg8ro?=
 =?us-ascii?Q?dBtuvCmlZAhIP3y0K/LNC2N0ONcpnFzeVbborvqbshh6bmO7eu506e0SmiYw?=
 =?us-ascii?Q?hrUr3kwiLQ5K0KS4L88BJHBxv6Yr/Lxht45R9HaxpynpHJuA/CSWuUJSLsxo?=
 =?us-ascii?Q?/oWPj59JfGMBORDYQNKoyoJoYLvyzkQsRnL6R95f7j5NpO5apO7IqOC28fyR?=
 =?us-ascii?Q?E47BzA5G05Drb0RFnktMse1dDjUiMlb4lNsXezvTPf+ut0WzqmggCX/XQR7v?=
 =?us-ascii?Q?68ictSMznkWEl6WE0fJLZIPPF/ahPsdtwj1oiqZRlcCTgZkpyX+18LZLCpvi?=
 =?us-ascii?Q?iV+6n8SuAxYKlJOaYsFtVxaP3lyar/ugyORgGlKhS6aerMvwD2AwhfjID+GD?=
 =?us-ascii?Q?UV8bHvdmSwTGet+Lti0yE1XWzUeIXleBu/aPllt749mFVy+pzmf9lAwpimzl?=
 =?us-ascii?Q?ADXYJIfnEhMyN5r2AARB0xlUb6FzcMb47ffpZNXhzeD97n4c4Ut5+qOkYd2G?=
 =?us-ascii?Q?ESXY/Ujtj5Cn0WSn8UdfGmnAsm8mBpM+qFx+iAWCsefnwKICxmjFRQgQAAA8?=
 =?us-ascii?Q?inj2l79Nt6GmkEO9/ieBsPK0GN1dkl0Q0fRDseQTSEpoT1bXL0dtPUOEHNCU?=
 =?us-ascii?Q?nyF+5Ve2QT83AyobIHDPimbJsgPCilqAmXBJ3qx5yD//fAicjtAMyHxGMs9j?=
 =?us-ascii?Q?9xT4JL9hA543MFnWJrQp89v4v7GElArZSk9UZE0l96cTHtvPIZftrUMBaFYh?=
 =?us-ascii?Q?3oK68yvMB21a7Fx21EIK8tK6lQrF0iWHxJ35TrN5tnXY7kjx5Ll7ItcyYpeG?=
 =?us-ascii?Q?mvAW9eBRC0VnsIQNz90oIN+k0NYdAFeSmGoRm5xEJ69tEdeLEU4q+PtNtm2G?=
 =?us-ascii?Q?qhn8k12Jv29HKaBLI3NJNLPatMYUrCqgOu6AtkkVSZVJPSePjiZlWfRMLJKr?=
 =?us-ascii?Q?lkYCgig1owXqKZkRjCqXQ6hB4OyozqPtyIbDE2RnsX7sRH3Rcx8UFTMui1QH?=
 =?us-ascii?Q?BDWUz0Q4Cs0uDRQLwZy8fmX7ZW01eAj+nWwA0/GdKP8dZiknCaPt+cvdoViV?=
 =?us-ascii?Q?fpPIRw9mHrRN/KsF/TB1s94vLQR8JPWYvd4fY9mrBxfk2T01BinIW4XqlIf1?=
 =?us-ascii?Q?hdZoGCH8hsV+H02EDdGcmkULexft28FCtAPFJioqLNou3kh2T5g9APUsQxyq?=
 =?us-ascii?Q?RFFVCt1MqssRe1mWbMg9dRB7Ynn3U69vSqXzofU+0L/VRz7/Y/FVY+asx3fs?=
 =?us-ascii?Q?tko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB4091.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DXPzk5ZAqgTywKimNn3LlBQOG8IfejfdI56dTNv63DsN2Kf0LAZjl/njNvt0?=
 =?us-ascii?Q?uxv4cQaQqn4FFC592CpQ2j8dLeJu6CisYypPqCASXKm5d8FLWape2WkCo3uj?=
 =?us-ascii?Q?3RNGwwci1GIx66exZFwG1qHz1xnpBCLt6oMQQnHUXOmdU74mXXm06rb/8LaU?=
 =?us-ascii?Q?aLJThfaAt7gBOzfC+FTXmeXGkg0PM0vMfcL/mPplCgQHO28sU3SP/a7M9dMx?=
 =?us-ascii?Q?p0txy02DT3u5ysRmyfrWVukUybjX7gBf6gR4UMF4NdoIH9AEqQcnjXou0NWU?=
 =?us-ascii?Q?QZPBj7rTkaB7wFFAhRFOmIvDyVUe9jnpT6oQeRGofurtvC16B0a41WioTTsS?=
 =?us-ascii?Q?ZGAJFY84gNPsIMVR91ci/ZmQDU/EdPJs7z7kPsT6SK0A9Ngo/k0fwTcAkPy0?=
 =?us-ascii?Q?4IRBTQcRgrZ7O4S34uDCxHnyPOpjR4gATs8c0Iw4l5ZKfXQmMNxfEuvebaYb?=
 =?us-ascii?Q?25v5PVo3IrKDC4EqlYuwlHXfmMoK3GoMX7H+MOH+hfPGaa7cs2xF1rCo3nvF?=
 =?us-ascii?Q?eD3SQqxgg0ZGXaZC4kYS8jWPZXyRuUhmjYpr9MyDJ2LJg+hXOv/yXDZicaYb?=
 =?us-ascii?Q?OJAxf+A2jyn1IkbhIKVJ8p/tgXZ2kj0ItDxYAugHi2xclYu9mdv4Obf9w3NT?=
 =?us-ascii?Q?5Oo6/0BDXgtVxULV4CsCctLoHglWByBcN+UAxrH3gYFukqILNaSfrIC+p3H2?=
 =?us-ascii?Q?mMUvpnv6dAQci793S337LwxGA1Zxer9wnlisbJwbLjHXJFGZhdlaD2m2NVlZ?=
 =?us-ascii?Q?OngDKS3gWxrgftUg5oImzoGMqdsy7eB7fBgjmE4jq1rgu2qnFntJXyZVt3yf?=
 =?us-ascii?Q?th5ibPTdbs/Q1O3+UgoUt/QfyXO5VAigaZpZHEKKVhvsMyqsfBGYyTYcjv3Y?=
 =?us-ascii?Q?uoR3E7vl5Rpu9bAyFMrut49UdVYBrLiE3vlCBsKu216i9Nnj0i//YvQ1QWjT?=
 =?us-ascii?Q?M2vE8Iu5VOK0FlBpzNVZF5EmgNoCcR2YBhTuNonqODNNFY2HQutv5261lXs5?=
 =?us-ascii?Q?ontB7r7hECkwwabMFI7YCmLeD/VVh0F2JiJdCa8eNLetXJbM/LKYFB8Dw8Oq?=
 =?us-ascii?Q?sErbbjTq9b57PG7DtlbvkLVGB/JiwiHuUSsqshY3PN6cRO5A6FOaCwnCzB/C?=
 =?us-ascii?Q?XyXF3M1PWUC9KtQwPjSnGRp501SP4pNA6JoZW9uUJlIswIPpsuA1PJfqCliC?=
 =?us-ascii?Q?Rs72xLNN801CLuplM6yY+imzswDMO4Xrz0lr3hOcOZhMWiCCLsiN1yuU66/a?=
 =?us-ascii?Q?sx1gpRygoDGDMMPS3Tf3a+K5JU6iYog8OXplJB7csHYSVkgkBzJmNVndfOnE?=
 =?us-ascii?Q?dMpAR6J9MsxlndBwDUcNqKUoLP04UHJWMEiP4O05FZpPO00PqezmnLKErcLc?=
 =?us-ascii?Q?LMo0pd/1oK8dwEuCgONApP9qZGQp5iYyATmhviZGjRHiuR8p9eIVb/TBKskd?=
 =?us-ascii?Q?Y1X7unz4jjxuI9uxlB5pALOSVHtPdxEA7Y6eZKtb1OhcSHLl8cLtz5A98fj7?=
 =?us-ascii?Q?6TIs6zInF8d4CbRFvAg5H9VwxO3E4giKj8dKJA0Lxuzl9VOs9r8FLOaqYzvt?=
 =?us-ascii?Q?tnPinX8OKW85my6GVIc/Hkl3cYBtw8SwcrKM8kziH9zkFt6/NHjbfyzGAIKm?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KVJW5EiTRMKp88X4MctAZ7bjYBvivr6Qv7bcI4Zmj5vIlHk25j14qIxsT2Hv0em49PrWVCXbrxyXewqEDX+H8INp8f4ECzhRId5qe6mNPJ/l7yIdLPgHrVa5YC6sYGZi4fAJmG1uJd2DBeBTws8s4/0ZPV6ZMgxgl08CMgpuJ0M3FVYJjv4MWaV3syIi6V6tsB6UWz4XNw/qpmXCCnHW2EAoEpEjZwsRnFjaIGKv3WmJFtiq7BperIfPRzyvdWH4Ky2QqQvnvDDyaokss25QSbcJPwuN5Io2DatNVKTssgUVYj9ALGOa0uKyoMeT3WgVutLF45HRY8N6X6W7OHJdDOMZioftPKr0OZclRnkXNZP+puvyqXy+noHiZN2XYlx4RW9MZcF3/HUi8dNJV5rsU3GCS7s1XAQNiQj+GEro2bDu/r6URYtYozTWpOesIGTGdXL1LUWBLdptyFIU7rARXB4dfNPUGHmxxf/Enw6XxQMulmyMWNgJp/bRBCAq2GPMgI58XoD5EbNyrcx4GGemLJDqkkflQVhwnLuPmG4+Y4Ujewl0Rfo0sDp2BOdNJiBWyyGkE99NRhZmkmR2DVOwPSL6NWNwDZxWELHhntrNM9c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2f2708-f130-42ef-f248-08dcf8dba43d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB4091.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 12:09:01.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WiLXceYmEgfYllVt0Tk408u4ZG+m4+AIucvA7xeOa0uWLmm39GlvnplvRn8UrU8VR7BnMkDNSNfWoT/KUzY9nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6469
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_10,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=946
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410300095
X-Proofpoint-GUID: 5tc5M9q3K-qaoknt6MjSMKgLbP0cPy4v
X-Proofpoint-ORIG-GUID: 5tc5M9q3K-qaoknt6MjSMKgLbP0cPy4v

We already validate that they don't exist in dof_parser.c, so no such probes
can ever get here.  Handling this impossible, untestable case has just got
harder, because we'd have to skip DIT_ARGS_{NATIVE,XLAT,MAP} records too.
Just stop considering it.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dtprobed/dof_stash.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/dtprobed/dof_stash.c b/dtprobed/dof_stash.c
index 8bf465678217..82fdd3174759 100644
--- a/dtprobed/dof_stash.c
+++ b/dtprobed/dof_stash.c
@@ -586,12 +586,6 @@ dof_stash_write_parsed(pid_t pid, dev_t dev, ino_t ino, dt_list_t *accum)
 			if (err != 0)
 				goto err_provider;
 
-			/*
-			 * Skip probes with zero tracepoints entirely.
-			 */
-			if (accump->parsed->probe.ntp == 0)
-				break;
-
 			mod = accump->parsed->probe.name;
 			assert(accump->parsed->size > (mod - (char *) accump->parsed));
 			fun = mod + strlen(mod) + 1;
-- 
2.46.0.278.g36e3a12567

