Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E082475CE
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 22:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759877756; cv=fail; b=JvVpE7hoCYQ5PxZw2PXLN31ps3WZ7c8NOVIV2YRJOy6QFbF4f0K19zuYFykYIe+WZMtLWvzrRv7PuGdUikyCp+ANcxqNCUlmvg5Gld0vZtFTtxUKpj4uaS0gdHDpA71yqaLfj+TqMmTIB029FTBwXoVZ+N6CM7kBveaAEiJz0YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759877756; c=relaxed/simple;
	bh=InfnfKvyUhEgswMSobWkpfPt75cW1DlLbW/jnbeLdtE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Tvpcc1uaQ+ogg7+ZUiCt9uTyCodoNBmKktfkzziCICZwLG5I0smG0WMTQrqOATESiLMHmmGXE1Z8zkOyz3Sr9gZx7sI6otzw3XT2NUzM0qh87nxAxAwC1u22fSftg+WHhWbiknpNo9c/sAK1I0UTuV0SnXnRakqyvhjW1iMKxjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QZQGN8A7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BcrpiHPJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QZQGN8A7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BcrpiHPJ"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597MDZPN028918
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 22:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=rz8xW/46riOH/E5gXdguNWO/8ElfcwMkEfb5UsSBzqM=; b=
	QZQGN8A7/gy4mcKNrzm7FJrgYNK2SBkSYyEFpnyLEus1DPgsqUrKHI31WfNWWLpd
	muff/maegR5uFFi1szbqDePqrJr4+MP4XMiyBNAnWQ8qwOrA773fY8NvaflR74bw
	pUw9n6P4Jsbr6yfUbEYYIJPsjom8iDQ+mBOP+/kLwEfdxUhIKhcMfeBb0kPn3oGH
	rkiUUXwxJ4roh1chR4naIA9rLU3WXe9T2VIO2iqr2i7M1xjsM1PTAkPaiCt6PKff
	GMrrZB2F1cAM/Uo7GIpuxrf6tgXTcarlpOuiH2Oyw3UoVrM572Ev+7Qy+xw8yt7/
	3160foKSYg2n0oU4Q/EGPQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nakr03ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 22:55:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597LmQKB034882
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 22:55:53 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012051.outbound.protection.outlook.com [52.101.48.51])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt18uk3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 22:55:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIC9FbzCdk/HkruthCxc2bnvGKVq7Od+1H/qbythEMtNOec7no+CUSDBZjGLP32BSFdcRCoOLXR8t5Kbe0STF3GxczrOs9uWOqgdRW01wNXl7k1qW9OFavNjXVbRthgp3hy5wTXAoRqGC9GZHX7fgTPAdCxYKYYOE1xkPTq8ke6vbs9z4f+yX7i28R+psX2+IeRZbf4uzVsXikMkGFcNPCuOMfVuyR45JZrlkT0Lfgf6O4CM+tjrMNDknsYGQUE8wJeX+erlokZE4q3jQlyWUse1sQLvpPlEaMFbOb3vBeP+xKby1eBTCGMnO20ciRcjEIh3CqJ5j7lEteaWo0nCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rz8xW/46riOH/E5gXdguNWO/8ElfcwMkEfb5UsSBzqM=;
 b=EhayqrMHtuusJIbDEsEhgDRKWVo1ujn6MAAH9RsODccUgQKgeiG2HySH4UWy0JtaeSSvE+NjkjMrKdQF15a217e8pGyVq2tTvEa49v25baZwpn4r/YQMrfI8BNYx4gddQQDCxOOfV8fpW5BvG7WJfX1UJ/tttnzF1E960XbJi8TOotvX54BAaU0+KOSqVIzayfG9RmIcDr+iMrlnOfZgg8/goBb/pEGFtUlLa5xanSLOhYOqYantGL3P3U2hDZL5oxwDLwv/x7tvD5n10HV2VQqOvO8MAE+4CoTdsHtpAW4GtgUdCUNTnyeqisJJgzu7fi21fm/LduUUcPex5Ml0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rz8xW/46riOH/E5gXdguNWO/8ElfcwMkEfb5UsSBzqM=;
 b=BcrpiHPJZAzTcqgcWGGRbY5ITe99hLJBjr/0t/zX0Eoy+rXwgxz7GJcEoawJHFuNgxIM3RDLYCawucj8C1u74GpAKLG2XdYFkd2RnHkX7j/PUQXVcxtzKQ8Kv0q7HD8h0/yYvB3nxkRaUzsQS5kr7rkPXaeClWj7bpCGuQWW4b4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4498.namprd10.prod.outlook.com (2603:10b6:303:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 22:55:46 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 22:55:46 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Modify fbtsafety tests that use vtimestamp unnecessarily
Date: Tue,  7 Oct 2025 18:55:43 -0400
Message-Id: <20251007225543.31749-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4498:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3ab8b6-6869-4e0c-de48-08de05f4a6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h6TRZV3mb/Kg1vhnGuT+bksDzi+BZaPzTINhyFWxO6tBrE1TlR5qBLNRPRlC?=
 =?us-ascii?Q?VnBp56DzN+hZrUXYkGvlObO8h04sU1S9H1jp9zCBqorPcAzqc5WHTei/g0zb?=
 =?us-ascii?Q?w6MpXYiNszgW7g8jtHl9dfqzPlXqsczPE+dREZqtXKMvdE/HlF2Y8RwMD5OP?=
 =?us-ascii?Q?0TMlrzNex/0bM21/mm4MMrXHzAzx3W4oc2YkaixqNjCAbCWiSrE2ji5H9TsD?=
 =?us-ascii?Q?i05qXNLpRHkv0YLgRgEsrXa+2A9zrn9YRZUXS/0krJXkOkmuxjWgXWI/0BEN?=
 =?us-ascii?Q?pPxicWnOst25da2HN0hvlID18RgsfvMJOeGGaqKg3KgsgLFBeyC76nFIwEII?=
 =?us-ascii?Q?7aUEhdUxPaFW2q7kh4ppdPtkV3YrJMcH34HlNl6m2Pb6xUjtj0jOUgK7sy6M?=
 =?us-ascii?Q?ABbX/A8rv8mjGDaXu+tLHqHMgaTv5wRZd41j+yYFS5zWCb0z130J315PpvBB?=
 =?us-ascii?Q?Vazj4qa/Mm5luvgqfH3o0Jx43onmfIVPbDrpxi6uUYHbtPGF3WS2InOPZ0t2?=
 =?us-ascii?Q?bL9bNp/luqOm4n2kfYQOZ7eFYep41HCCUxS7MFD6emhgs3YeGsVCQtCBEZIQ?=
 =?us-ascii?Q?eeq51dWNkHa662JK+ic9OHnUiFudDRmySxc9+16TCyppPAQU6l8ZOYhe0PJc?=
 =?us-ascii?Q?eWrnTEMhs+16voWy4UmeFGqs6B4OX9vjFbyHPOYsn5FKJqxHB3W+5lHqI5DR?=
 =?us-ascii?Q?Hjvh5VPgXNRPRvaqNLBugBU7oYRFND1+qssMHUNiVWr2IUGY0SjxFX6Rrrt5?=
 =?us-ascii?Q?k7U+qj6pfd/zLZmyALTwhYPYo7mbLDjnjdTAYaLJJPaekbhXQHc+Uufv7liA?=
 =?us-ascii?Q?1LmpyPi/ib+ZJNVLZOx2wb1+I0xsjuCujA9XAbdCQtEdFbErpsPj/eFbaz3q?=
 =?us-ascii?Q?BcC6Fk9NrjGxScV8kMqkmx9MKRMdQ6zhByg7N4da5HY37ipkswAQwotYvN5f?=
 =?us-ascii?Q?z2wVMjg7eqoIopBFVBg8TVPCrdJyzkcg3aqzYvJMcBRzrPOWagbQcpwWPePB?=
 =?us-ascii?Q?H7+iKfxONwV7rQ0AGc1MGwlubGuyprxEgWnTjGeMlrdLmkihd1NswqAU7SLJ?=
 =?us-ascii?Q?oyZ9DvnjzIylO6KK9eza+Yxo99AEtjVcdhrym/uuXq3TXMNQ9HQHQIT8YlFn?=
 =?us-ascii?Q?t4c7jiLImkOalhuRDsmL1jOJmuioGOEm7uBgdQE7/dT/aDJwBpyInasnp4Qt?=
 =?us-ascii?Q?5l9R/miRAitkFscO+B5FaLwYq61zQ3FlNNJGiKn8BVRFLU/kyn+k4/WL5XIn?=
 =?us-ascii?Q?98CB782UibT3I9XjGf843kICDakUCxrVqVgAkxLz+s9HmxvzXHx4hmbfk/R+?=
 =?us-ascii?Q?IA6R2ZrWN9l63UVp9N4sXhrHobdLFo1jI4lt3b3yC0OebKKw0GEjwWX+/Hrm?=
 =?us-ascii?Q?XagV4ryhjFPwCXcY13g5KGmgDDKh/GhH+kam3nXsd/1M1mmL7dVDg0xBkIeE?=
 =?us-ascii?Q?uGJa+JWGn/QkX+b56bx3Nxk6BbRBiPuZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Sfwu+/ZJnX5otWqI3B3tlIgevxMxRPaBmjLi0HtezEbNKzXlNgw8acT2j7x?=
 =?us-ascii?Q?SKatLBBCrIgdvSuelfaXEPqobMVE9gS7NduB+3Cfp/TpZd/fVmjRbi/NiiCc?=
 =?us-ascii?Q?aMPjkRhYjLwGROQ4fBeJPQWeJWeQQRlJD3WaSHbFJp6Ya/Pw4oaKjC+jk5x1?=
 =?us-ascii?Q?S+x8+9HFwmow2z9RPUt1VJhnYsSKyhtDaN2ZxKPXN0yAnQ2BZX0oHa22pmAr?=
 =?us-ascii?Q?NepnLzF5ulkUpwn9C0FIrsDDZ73VbTUFKWECtk7imrgHXSdQe7fs5crZlF3O?=
 =?us-ascii?Q?XTQY7lDVDuQpJpOAct4UQm+WryC5fGS+oX63cSB6WoE/1NULtj4B+Fl2lwL3?=
 =?us-ascii?Q?s32X1L5Z3NEO8HBibA1HJItzyUTUoiHStiw0hkOBlWIqKNtOE6ZCPqp1HBsT?=
 =?us-ascii?Q?aXpyRPxbUPPAfT2m2XayXLm8DSRBTB9IWoIurSrFX3gZjcP0qYbwzzHuGBUT?=
 =?us-ascii?Q?ijESR5y4is5gweug6nyTCU37UdcTLH4GyeQTDP6oOBW9H3QpMyjhd3nEw+4G?=
 =?us-ascii?Q?BvJhrtS3m3O7uvdh27mo5uoAfpyDbUQJDUB2iUYVdtDFbziojQsQXqC2r4OF?=
 =?us-ascii?Q?1sYpKO/7Dc5gmeKixPensZHZ03AaaLj17tU2Cz959ji2kiQ2JlF/TQnpgOlq?=
 =?us-ascii?Q?Q5bOK2mVzoxf5X0r99YmvhotMVLLge5yvqDzgOzWRAtJXMNvbA253gxIUTTS?=
 =?us-ascii?Q?0bwE3QRbfV9QBaKtSKweUv60rUcO49ZqjTgATTEZXHUiWHU7xcg71E7uls7H?=
 =?us-ascii?Q?Wwa7B0wiqR2o10EOI5huEqINjVIj8gB7VFGQarJ0neKRNq8LpIUQU8Ja8q4N?=
 =?us-ascii?Q?v8lDyp1PeVRKPZD6yCTym61LgITIOysMS3xXSX2TYdhU0eIrMFktioPw38IY?=
 =?us-ascii?Q?2L2AMKIZ/uX53BsFtDrAUvl+XYibaC/q1RBgVVsJ33t3pZpFBYKZ+AkpoyAS?=
 =?us-ascii?Q?z84jgxUFDEjHh0Hli/Fppl0uB/q9TmkBiUKGux2DgFNzFRnOS++i8JHeFh8a?=
 =?us-ascii?Q?SiapRClsYfaW5iSae9zKE6fT+CV7qVB/hWCjThCgP3beBuwehKUidIkJErgL?=
 =?us-ascii?Q?N44UmWZKO+TbMie8RhcFIWvkWCObxUT6JGaZT/3S2FegBtoMqKNwUbdlctf3?=
 =?us-ascii?Q?YhBqrxrjiDRQvVRKqvXG5iqgd5sS3OrDWmwLAVT55iv6SzDa8JGrJkpyb6MS?=
 =?us-ascii?Q?G4JIoNzpRJYfk9bdO8AtDls5VGFP8xvaPGmu9ddbhX3LLqXnIXltlKxpMbrV?=
 =?us-ascii?Q?ot2X6fcHpic+cZ8U571K2hviDfXPjugbMfBS7CPYWKG9HTqKgj+AQNrEqtGO?=
 =?us-ascii?Q?k9hGR4F5BBIHLlGMqWpiuwvYSnlox+ru1hag+7UpdBzL8VUc2WsJtnm/xjBK?=
 =?us-ascii?Q?owmG2V6BpQ6IClpSmFnWp9lnJ7TD/Y6C9SdW48w5rFKD4GtkkibkNFoDAjuz?=
 =?us-ascii?Q?/84y0KuLb5A1LzmMpihAdbF8HdHuQB6RqXVp2dPgqy3XDDiOUspkpYEaSUIq?=
 =?us-ascii?Q?K7mm+Xd/fqXd69fSzkGUBGR2OfGKxg5QDGlcBtmoMu4RXXeLn6zVmcjR3eZX?=
 =?us-ascii?Q?KanmHELIcBnBX0zVsLT+olzM6Zew5Bcr/yfsR5so?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aUQX/QntLIsIWMMCL6lalOHHl5uP/SRU8cBab+wyL8taLM3E2ETS5IL9srSI33zGy0xancZ32R/ZwJkx50X1BQaYpv4RHV6/Em8XL3NUAz9lyEQtju4dY1PLRVW3b+QxhnA4FlpO4b/u281P2yjTUdb/4w8XhzIQ24NK2vEaIweXwK+YfNb5Z+QrWEd3LhARjpELYOMKRG57L9poUXQu6HK0QwzveiD7XdgOZPdEwyl7jYOPnPJ77dj/KP0XcqziM591/UIDIR2DP36K7IhJ8s/H9ey0LF3zrOyGiqxTq+cBjw0G39NGOXGzJeIJ0aZzfSjy4LrQIfI4MSiNsXQDqKij1DC9xgvBQsc++TirNpyFnazLToORZHP5Tclbc4AlaRKualVhf3UrHBx2BS6Rh0VUWO/dtI2VD5ObDZEK6Lm8lBuD9rmuHQuu6RjONP+1WILGTnZBLPCHpsdFLb+2qSl2Y156wB+iAIM7J9c8BIrxD8rx6WBKEkPdRXp23dzzuqZ2g7g7gBmoQXcgOkhNv6UBITcw9aixUqnSbY12XKQ6cGWHiM0cG4RQXpkmXzk0H6h3CcRAfB9K1e8Zcl3WkBck9bpFoai80T326aB84wY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3ab8b6-6869-4e0c-de48-08de05f4a6b3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 22:55:46.1371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7MvCYlTzdEAym0+ZQ1yclbfHcjuHzh+gceEjYcZrNhnOqmkNLrGSkvILpBn8dhxCDcXunk+B2sXyXDLz+FrPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4498
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510070175
X-Proofpoint-GUID: TN2yay8ErTykhNcxd70B4Nyo2HZ-DX8r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE2NCBTYWx0ZWRfX75+nz+MJvVY8
 GpU0AV75lZ30H8EtGz8x9pxlh22NMHzZ5pmkJ2hOZzIYAVlP6H7qvUIEYPadBLCXImJqDzfHk8Q
 kefZ4bF40knhAfbdiEA44FgERAgURxHAHXjoCaP9NHSzkjXO+OaSXMYasY2VJm+yHXJQE58d2if
 4C9bFspvOhcZ7Z/f2Cr8hMs7+c0UkPI9A3FduiXdBpdw1U3NwbM0xkORMGKtXgotstx8pdvOCoG
 8QXMxWUvRWHGx9ndqpUS8A2pN958GuHBCLXmTh1ZEQZ4/caHw2WoiAqB9knQGVy6HTAqUMV8kIa
 gG3UPVjUl9n24apQ0w7xcuQC/217YagtWbXBJUAnybHqXhojSnMMaOgrTCFZO1kseGoijOzW+QC
 qyOE6PAC9hwZdohJwMXlHkaSJCN8VSRlxcgYMmiZitjnGdxfYt8=
X-Proofpoint-ORIG-GUID: TN2yay8ErTykhNcxd70B4Nyo2HZ-DX8r
X-Authority-Analysis: v=2.4 cv=Vaj6/Vp9 c=1 sm=1 tr=0 ts=68e59a79 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Sg3LJNrEeMw9F2-CCzIA:9 cc=ntf
 awl=host:12091

From: Eugene Loh <eugene.loh@oracle.com>

Currently, we do not implement vtimestamp.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/stress/fbtsafety/tst.index.d             | 6 +++---
 test/stress/fbtsafety/tst.strjoin.d           | 4 ++--
 test/stress/fbtsafety/tst.strstr.d            | 4 ++--
 test/stress/fbtsafety/tst.strtok.d            | 4 ++--
 test/stress/fbtsafety/tst.substr.d            | 6 +++---
 test/unittest/variables/bvar/tst.vtimestamp.d | 2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/test/stress/fbtsafety/tst.index.d b/test/stress/fbtsafety/tst.index.d
index e30b94c0a..930d074ab 100644
--- a/test/stress/fbtsafety/tst.index.d
+++ b/test/stress/fbtsafety/tst.index.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -17,13 +17,13 @@ fbt:::
 fbt:::
 /on/
 {
-	trace(index((char *)rand(), (char *)(rand() ^ vtimestamp)));
+	trace(index((char *)rand(), (char *)(rand() ^ timestamp)));
 }
 
 fbt:::
 /on/
 {
-	trace(rindex((char *)rand(), (char *)(rand() ^ vtimestamp,
+	trace(rindex((char *)rand(), (char *)(rand() ^ timestamp,
 	    timestamp)));
 }
 
diff --git a/test/stress/fbtsafety/tst.strjoin.d b/test/stress/fbtsafety/tst.strjoin.d
index a22cc7943..1a9fbe733 100644
--- a/test/stress/fbtsafety/tst.strjoin.d
+++ b/test/stress/fbtsafety/tst.strjoin.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -17,7 +17,7 @@ fbt:::
 fbt:::
 /on/
 {
-	trace(strjoin((char *)rand(), (char *)(rand() ^ vtimestamp)));
+	trace(strjoin((char *)rand(), (char *)(rand() ^ timestamp)));
 }
 
 fbt:::entry
diff --git a/test/stress/fbtsafety/tst.strstr.d b/test/stress/fbtsafety/tst.strstr.d
index 13f4a9245..15c1e15e8 100644
--- a/test/stress/fbtsafety/tst.strstr.d
+++ b/test/stress/fbtsafety/tst.strstr.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -17,7 +17,7 @@ fbt:::
 fbt:::
 /on/
 {
-	trace(strstr((char *)rand(), (char *)(rand() ^ vtimestamp)));
+	trace(strstr((char *)rand(), (char *)(rand() ^ timestamp)));
 }
 
 fbt:::entry
diff --git a/test/stress/fbtsafety/tst.strtok.d b/test/stress/fbtsafety/tst.strtok.d
index bc0a707eb..edc2ec558 100644
--- a/test/stress/fbtsafety/tst.strtok.d
+++ b/test/stress/fbtsafety/tst.strtok.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -17,7 +17,7 @@ fbt:::
 fbt:::
 /on/
 {
-	trace(strtok((char *)rand(), (char *)(rand() ^ vtimestamp)));
+	trace(strtok((char *)rand(), (char *)(rand() ^ timestamp)));
 }
 
 fbt:::entry
diff --git a/test/stress/fbtsafety/tst.substr.d b/test/stress/fbtsafety/tst.substr.d
index 8cd021176..ac02584ee 100644
--- a/test/stress/fbtsafety/tst.substr.d
+++ b/test/stress/fbtsafety/tst.substr.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -17,13 +17,13 @@ fbt:::
 fbt:::
 /on/
 {
-	trace(substr((char *)rand(), rand() ^ vtimestamp));
+	trace(substr((char *)rand(), rand() ^ timestamp));
 }
 
 fbt:::
 /on/
 {
-	trace(substr((char *)rand(), -rand() ^ vtimestamp));
+	trace(substr((char *)rand(), -rand() ^ timestamp));
 }
 
 tick-1sec
diff --git a/test/unittest/variables/bvar/tst.vtimestamp.d b/test/unittest/variables/bvar/tst.vtimestamp.d
index b72eb8a7f..7d92bf4cc 100644
--- a/test/unittest/variables/bvar/tst.vtimestamp.d
+++ b/test/unittest/variables/bvar/tst.vtimestamp.d
@@ -4,7 +4,7 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 need vtimestamp support */
+/* @@xfail: dtv2: need vtimestamp support */
 
 /*
  * ASSERTION: The 'vtimestamp' variable can be accessed and is not -1.
-- 
2.47.3

