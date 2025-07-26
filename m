Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BD16B3B7
	for <dtrace@lists.linux.dev>; Sat, 26 Jul 2025 04:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753502690; cv=fail; b=EQoprzNCrAwE52/j/DxsPG+UWC8PAyewmeEtuwTWiXAEhd9nqHBXx6Z6CbsSDVshwL1GNxgcmeLQWLR20Bc3p5kvSLrROQwbBZfHHsgPomkeo/fZnRLDRu5oEIcj+p3tWORxN0C+aUxyveiPlFWsY/KfV8WV9+4bK3B9+bHAepM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753502690; c=relaxed/simple;
	bh=rwgZCxpxGL4pqOhmE/LVsKCMPC5BTvwkmWoLQxc5ZuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AeSUDLxd1axZiN5agDO4Va7av5sfD0If2cill4jMlIZwGl7pqtCWxY5xLwVb14DeCpaaDx+RIZNTaazYK33hQJa+4ybZUEJWtM4zZkqFWz+nm5Px8Zu8HrKn5XAPI2fv+mGQgiIGIxEt4LvtyTf172akL75pQt7LpjN4rnwT5M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WBn9uUm1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mVdIc1Sx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WBn9uUm1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mVdIc1Sx"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q3ULtr031010
	for <dtrace@lists.linux.dev>; Sat, 26 Jul 2025 04:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MMLCTqITan9HazS5QM
	gRWP+6QrxOLUBXS+/1aQcXE7c=; b=WBn9uUm146ZMDLALJKHQ+44L0MRwiV8kFA
	2vXnr57+fnLrrzalR29vxxq1mfvBO2LALIeNZh4mS60upBkV1H584+aaDhWqkkWQ
	AG70qN4WYEi6mOeXTk3fE5XzJIEgkotacuXbgdWl64CFx7uIw3UZ+qh2TevoTPLc
	VHmXhMvYIF5/QX7j59g8nNBX0gCPp4r0NT/XbDZWHwn8GKhbJuu42RpBXHCoCzbB
	vhwdlYNNsix+9kXi1PD1S1Oa7/ewKvWaXw6Ht+rLd2MIWCdl82705Wv9jCpFuoa4
	psf7Pi6x0jo2mq/+1rEFMKkK4GbfSSreB6OOSRCFgZlKiC1KKIig==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q5wr1fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Jul 2025 04:04:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56Q1YFHA016916
	for <dtrace@lists.linux.dev>; Sat, 26 Jul 2025 04:04:42 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 484nfd2bpu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 26 Jul 2025 04:04:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJh6X027LERSjR48oUVDYLq5K/jajsgZE2zORVqmix1p3LAWLvjSH5UPmUt5dGWNCv/ya6ej90/GC+bex8OI4Y7qfbUL3RjwEvsMmhNFznT3Yvfqvx/j9mCdFHcqKlEMQ2+tO226iJ+UlQC/qi/XpuiOzhu3IqIfFLB7y4jGD4CLpyEscoQsBK+W3GY35h2RbFNbKbGsF2N5BQvtNjfjwLPa4Qjh4C5g85EOAUG2TQPzarInV8udvDjFyyNouXVH9NGAho/dKMkCPI62uqZqYvoS1dirOGKI14780p6AzcSxy4UFwNKaiBXRgcgTZWEAs1yf5lvNREASi+tVN7/8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMLCTqITan9HazS5QMgRWP+6QrxOLUBXS+/1aQcXE7c=;
 b=CqgWA+9JgGUUr69ti9sMt5OTDyYQBIb9CkIJts03XtcghbnfUyMDriWOrlNPPSaUt4W79eoDkOQVv2bo1tiHj3WtM4UVTw9546EmP0UwQMHuQtYMwRxWXSiYpVnEE//DvJBIg5Nn9Ack1xr0ffd3/xp6ynkq+vapufY3/hWGwRlQ3fOyuax8/rNQ2xb+8VRS18jz/awaAxe9NS/wUVvQSBrQqYDljfVuJp8N6a198X3HStW9njLlubq/5QkMWmbVCHI/EdAmIsKFTKwvB9J0Itk2/TMPn/PYhPTmHzd220PN8T3pyrx+MTgjuINgc5wNHFZpQHWAiJ7LUAN3QWCypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMLCTqITan9HazS5QMgRWP+6QrxOLUBXS+/1aQcXE7c=;
 b=mVdIc1Sxece6gA8+/QFvqqE4w36C/wGNskHo6kW3qcYHFrIw0HteVx/IWOsfKkAhgwxSgQ3/dVXmFFrwChvLMgRWlF9NpjjVm5Ax7J2/8q+H/N89Vo+g9d1i4TNstZYyNdksGD16Kpv9H+6HJ/15E05yweWon6RXR5DvNjOG7JU=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM3PPF8E7C782BE.namprd10.prod.outlook.com (2603:10b6:f:fc00::c35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Sat, 26 Jul
 2025 04:04:35 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Sat, 26 Jul 2025
 04:04:35 +0000
Date: Sat, 26 Jul 2025 00:04:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v5 2/6] support stapsdt ELF-note-defined static probes
Message-ID: <aIRTz6RFoA6O3n8g@oracle.com>
References: <20250710215930.82067-1-alan.maguire@oracle.com>
 <20250710215930.82067-3-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710215930.82067-3-alan.maguire@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM3PPF8E7C782BE:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5606ed-f642-4a2f-e96f-08ddcbf9882a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ucNSxZ+/gVetGr8qapySjZVSsP+v+a3PKWktzUAgVjEwAJvMYHOU4jiDv0dt?=
 =?us-ascii?Q?j8G3QsyG+M6nWiR52TQrWFAJ8li/VGbfn52EZ3g/RPPo63Mjtq5idZ2NtNTK?=
 =?us-ascii?Q?FsAZ1323mSq/OlOUIHtxMJ9deFRTSflBNKMpMkGGW0zIPBnRd9KuleF/rJYo?=
 =?us-ascii?Q?+sB17kE4fPdIUFm0L5LCBqotTky6ZTjwl1VcItPTDbWB4e9SxlYkglnR1V+i?=
 =?us-ascii?Q?g9wgY68ST1LO/zwAh912sUL8hZNBsYhXccRNgTtBscLoSChZvbKNCp3zHoOm?=
 =?us-ascii?Q?C7Y9RZqp3xcL3PQ07yJtL/l0OrGczxrqzZD9dJ0xCiz8XUPBGqYgk5fZDCG7?=
 =?us-ascii?Q?S+9+HwEKNG5ij4DWAIy65YM6JBmrjwo4DMqOR7R+4uR8+rVo/yq72Dw/hBIL?=
 =?us-ascii?Q?t4SzxJpzHz5O70qev/xcxonRa7Ac+oUttZ3LdDhJAOCltH5KnSTB9wQCzFri?=
 =?us-ascii?Q?z0f7G3s+Rg6rsRG5kDpmHlP3yL88oXvHeOywIeCDEWhvK7jDIxeo1nPUIhRw?=
 =?us-ascii?Q?jJtIRlKMkby4SdtWgLK7qnvYIF/EQkEinOuk9WkZWgpCRjb4OQbKVF3lIdTH?=
 =?us-ascii?Q?HvCLIrwMUmz4OGBRT/jfdoVaD/ApB3XvGxSYmn7mgbTLJfqYZ+IGgxFPEw3P?=
 =?us-ascii?Q?agoHdH784KMuSHctk0l/LPtAu8b8ZnXux2X3uiokeFpEkW5lW3Y3gdeLhg0v?=
 =?us-ascii?Q?U5JKtU0t4k4NjErkcktGjzTM2ytpFAU42wdziWHMj2iW9174vWGGEIFDzmgf?=
 =?us-ascii?Q?6tH61F91wf1gtkQGszKJWNL70Qn7niHNCTZNN2emwIqcaVOrSz0iVLN6Cyhg?=
 =?us-ascii?Q?rZc2KFQmKXhtMFj9zIHImeJyatNwFkijoIwNFbliMw7vD8DzoBNXDttvJkwO?=
 =?us-ascii?Q?4HBrhVaPlpAw7hWxUwadShmJIPNiV0x920AIpUoIgtFrkspR7AWLyNkNQZRq?=
 =?us-ascii?Q?hTybHNz1jQLQqoi5nJh9TW6UyX/+TzeZ1pg9gznG6KBpxNJAjIUXy1wcUFPU?=
 =?us-ascii?Q?FTFc4t1yRdem4tZU+y5DGHzosXCWZbSCLttxrVh6sXw4jpZlXSYpZxx2dbQq?=
 =?us-ascii?Q?r3hrcTV8ey2QP6nBW/fbYMa6tX7Rssyn0hr5a6VwhCEMJdz/WC/r5gAByPGL?=
 =?us-ascii?Q?fam6iuSV15UmAdwAOM5Bz6olMSY6W0bNro7IQB1/T7ikQNnj1Pg5XVuAFpi5?=
 =?us-ascii?Q?VbMtputlE7wfLOMBIy0qRJdxbhRnYBEpr//JSPusE7DbSKf8iyCUCzrHEC3K?=
 =?us-ascii?Q?oNgCfKMGElmyoCClEhV4lXikQ8MnZ+uYoEU03nelsEIJ+egEorryUjhCHRCa?=
 =?us-ascii?Q?KXbrDkrajCcecevLwCHdCNbV7hll51abSuEPgpBnJe7F8NgYR3kGoWBZk8Cz?=
 =?us-ascii?Q?vUp+VO67mEZHh4v3WWMu7Gt+cZdiHF/DDe19UAcFHnbYi9J35hEJi7LteKVm?=
 =?us-ascii?Q?eqlHlTAUf68=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jARzCt9CapEfd1uh1QaDClAoEPVuAkJJ8Ze4ven3bDbykS8+YgsU2wdGpXyb?=
 =?us-ascii?Q?ufdDtDAqrohhJIQoi+t9fZvbImn7N+i92kPF9RtuVRYDfVF3/ujrV43yeTMt?=
 =?us-ascii?Q?iviLSYGk9VRwMKYWqxi+0opj/grjnK8zis0n31Fy7kTE9LjU3quGR2ndVFG8?=
 =?us-ascii?Q?azLVAV4rYzjqZTznh+5UYuPaVyJEKSwOgy/VWnJmqKt/mQlULHDWgpEgPHkG?=
 =?us-ascii?Q?kROg4jGLdnRo1dczYVb80OtAKe/myp3HUspXMT6y8j8zqhGeuQEPZqJLEA0D?=
 =?us-ascii?Q?GzedtcMXygndS0KDHz4UHHAeXZ52qNsNBsWdUw/G1rJoy/xNbeBl8eu1CnfL?=
 =?us-ascii?Q?SmiGaquB2PjToenUDKzJaXNLS0otd/u4z0wrERZWM7tsI8Pc9t+Wo2SiDP+v?=
 =?us-ascii?Q?qAukRT2hKxcbbFhv9k4CbYY8+NEhZfehH3V3//u/d879nGf0U0oBlKsrYOgZ?=
 =?us-ascii?Q?RpmHARvxFxcReR2wdKWvUdTR8LhFtKvInVy9fpB3Fi0GDFvv3WuRKKVzqfAD?=
 =?us-ascii?Q?TAT62SY4FCPtg1D3+w2HvmnWrtOLOM7UGM31hZDFp4Gtf9TLylP4KnuSwBfm?=
 =?us-ascii?Q?GJAFebDh4hfzLxRGdyAZx0whTGVBlGBp0x0Mi1omkLt0Z5CcyGcHeypBitKy?=
 =?us-ascii?Q?YB+HJCivSxkvYGyge4ABWTfq1vwdWiAy7k0fpC2JDVGWdNxcFEY62oOqJteU?=
 =?us-ascii?Q?R26zVZB0LcMVjX+vUqpTmdm8bJaT+79pMQXypUdLZ1lul57S//RvZsn2bnFA?=
 =?us-ascii?Q?GLAzzdgIxfeDf8Vz3Kf7Yj7ikGa2Pm1UC9dCKU8coBpvkcT2ugGMfvsQdyJk?=
 =?us-ascii?Q?KRUxgjP/9UYIYtMiMIxJyfwgyi23MkQXKrwaQb09d7/s0sasCn/RNDqLmvQi?=
 =?us-ascii?Q?wFdPvbSXXK9id4xBuvjE2r+tiheuCBbKwOaCv+H+mMKRcADAZf/AXcbLRjbW?=
 =?us-ascii?Q?fiMUBsGjNlve/ol0xLxGZL41thZ+4sRNc7bCcA53B1xVCXWrUVTJ95tKOzd3?=
 =?us-ascii?Q?2G1vl21gVnft9h3Y0qUGcc2mb6lrvABjxGLYUTVJreTD/EfjP5mwwVeeyffM?=
 =?us-ascii?Q?XcKTDJSpDmAszJzgepOsQGqq0tiB2Y498Qn84taoCFPmPS88GWO1TQ47uMV/?=
 =?us-ascii?Q?/umFgwJ0X+K153uooGWgbPk6PlF1/dDnd5yIVulDQ8H/6Uwe6OAuGN7T586y?=
 =?us-ascii?Q?JA6S/LF46y/UhLqzDMB+1mwURGpVpySSZ5oRQaJLE36mOtiJl4fzqsS0FWeN?=
 =?us-ascii?Q?CM+SLYBzeNSqHFYs5+sdAYTgJnzkaUyWHiuHIoPZ6oNwzBx+uHqQoOg1Hw0a?=
 =?us-ascii?Q?iicA+1W6bVb6mZtK+nLPzffBXabVingu8UlolQg4RTs4D7V7amkkixK/IejT?=
 =?us-ascii?Q?LabqIjqs343kOQ6jqPtaOzUvgRzbQX3Jer+RPw69kKZDD9jLi8LMXMutuJ6k?=
 =?us-ascii?Q?hWzHG34DWkVYiKlHe5haaSIJrCTAiqnvE6LltCTYqqzrEzlvk5Pua839yvis?=
 =?us-ascii?Q?SfXQqKGrfBbWMiehueFSRMpa0c7TVKq7PUl40fqnnoqrMm6ta/do1Jp7wRBv?=
 =?us-ascii?Q?Huzi+YRZp9bqd+sQaVgO46Mkq/isvtJb3xXEpfw4NUgsUGWbAVrdikN8E01w?=
 =?us-ascii?Q?hA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9m4YbDEyYYC1DqpJdD4fKfj+LUtKC3kXurZE4m6GUlwz0yaQRtpg+wUTTZ/07N3DsWndMmMsvoIL/j2dvnpolhapdVxjZZVKHXUf+uXRJth5NaW9TRIxXCImZvuXZbtv56ACJZetUhWYLst24qQVDVz6cOfAYT5bzaUTZaq687Ztxbj4Z7Xi6PZhqGaYP3EQ2IQbdaTPCot09ou6VAdIzVWV5+lgi8FRjH1UgMQZjZt16x4aPSdKBLKqK3xYLigU4B8aXK6sPB0dzn44WbIfrgadqMcFBLA2Rxu56FIrqxtcFEIZWlSoEmURCa6O6pivbjx8KIM6w8tYI8c2bfC8g4Irfs6pftZf3wcLW9qSrWDaN0IqyPyfjeHEEaemp43sZFBpCzvjrLHu2i9QbpTqqvvS+J5nvfsQukF8+eOlcsfZDMAvQDIuTqWbIwiF2qzbZKfVfvJvE0L2vROt2nufFuPf/CEnU92WbbsX02f3bYL1ILXtl0YiLmL3Pzyze3etyPVHv6yz9vSsbatmv+xv7JbvQJCxORJkDUQM9hs2o5Ns8kjKlA9vcTfBGeG1pd0KfB9ybiiXtpzvp8Dw0CCtCxB0mQ6iUIioBeeeKjBcm1c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5606ed-f642-4a2f-e96f-08ddcbf9882a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2025 04:04:34.9543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8L6v0M6G1sMZkghX75iTFbLMIRjggpf5ygdfDslSyBQRIcIVnq/l0PK3niNr/MVD0Cej4ad+zYAQjPp435RjAJKhhJFlrMw4kHCLr/TIog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF8E7C782BE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507260031
X-Authority-Analysis: v=2.4 cv=X+lSKHTe c=1 sm=1 tr=0 ts=688453dc b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=NEAV23lmAAAA:8 a=yPCof4ZbAAAA:8 a=OJw0p9PLJh3faTT9NMMA:9 a=CjuIK1q_8ugA:10
 cc=ntf awl=host:12061
X-Proofpoint-GUID: SNLGeQM7Ft11HXJTEXYrkTRM-EOB3PaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDAzMSBTYWx0ZWRfX6Z6oJxTKMhO+
 VESZ/CnQrOhaqQOp88DjND3Y2d3iEx64Z8arF05YhZIuMC7PtQD7x0AI+8wrZRpa6veHD8Jswtj
 Qk1XDNCZtTU/f9ZTHFpvRg5YP2yOFgKprz3gjnI2R3Ng/L/dhRl4Mc5+NMme8ossFvH5c2k8GsM
 AcqLSj6IvI1zt9D6MSr6UUdhbOTf7qns79as5IkRq1V38La9EiXL/GcUEWokahbqf7KQ8kUo1Up
 oKF+Unk+J6RRuD90D3+SNBDHra9TQGrvO1N4nNOsxzUp0yujfY9KPqsdLMYoyNk9R+DM3jA1227
 H47siThaf/AixQb0RimDWzvPPufKhbVLr4ZoBVUyIwf/FHaiqnru/f0Q9LSlxTME3pavX43J/mt
 f1x8B8jGhfr1GDR3fdEZ/00ajDKVFd862VjSrEIvDceNTZZwuqVXxLHlMyqJj5SuozgmRK11
X-Proofpoint-ORIG-GUID: SNLGeQM7Ft11HXJTEXYrkTRM-EOB3PaD

Running all tests in unittest/usdt showed core dumps for various tests.
The problem seems to be that dt_stapsdt_parse contains an assert on
whether the file it is trying to parse is an ELF object.  But it is
getting fed files that are *not* ELF objects, and thus the assert triggers
and we get a core dump.

E.g.
dt_pid_create_stapsdt_probes_proc() - [2] /usr/lib64/libdbus-1.so.3.19.13
dt_stapsdt_parse() - Looking at /usr/lib64/libdbus-1.so.3.19.13
dt_pid_create_stapsdt_probes_proc() - [1] /proc/635/fd/9 (from name /memfd:libffi)
dt_stapsdt_parse() - Looking at /proc/635/fd/9
dtrace: libdtrace/dt_pid.c:1301: dt_stapsdt_parse: Assertion `elf_kind(elf) == ELF_K_ELF' failed.

(my debugging output included to show what is going wrong)

As you can see, /memfd:libffi is found in the maps file, which triggers looking
at /proc/635/fd/%d which encounters this entry:

lrwx------. 1 root root 64 Jul 25 16:44 9 -> '/memfd:libffi (deleted)'

and clearly, since the assert got triggered, that is not an ELF object.  But
then again, does it need to be?  Isn't it possible that some of these entries
are not ELF objects?  That assert seems to be wrong, or at least too strict.

Also, from debugging test failures it shows that a probe specification like
test_prov*::: causes the stapsdt support code to scan every running process
on the system, trying to determine whether it might contain probes.  That is
quite invasive...  With a test_prov*::: probe specification it took 2-3 secs
on my system just to determine that there are not stapsdt probes that match.
That is excessive.

This needs a bit more work to ensure that the impact on dtrace operation in
general is minimal.  This might mean that (for now) an approach similar to
the pid provider may be needed (fully specified pid is required) or some other
mechanism that ensures that the rather expensive mechanism to look for stapsdt
probes is not engaged unless necessary.  In other words, I think that looking
to match stapsdt probes shouldn't be done in general as part of probe matching.
Instead, it should be done when a user requests it.

On Thu, Jul 10, 2025 at 10:59:26PM +0100, Alan Maguire wrote:
> As well as using dtrace -G to generate USDT probes, programs and
> libraries may have added static probes via stapsdt ELF notes.
> 
> Read ELF notes from binaries from /proc/ maps associated with processes
> and parse them to retrieve uprobe address and argument-related info
> to create the associated uprobe.
> 
> Probe arguments can be either constants, register values or dereferences
> or dereferences from register values (plus offset), identical to the
> updated USDT ELF note handling.
> 
> A new provider - stapsdt - implements this support, as stapsdt probes do
> not dynamically register themselves with DTrace.  This makes them less
> powerful than DTrace-based USDT probes, but they do exist in programs and
> libraries so should be supported.
> 
> As well as supporting ELF-note stapsdt defined probes in programs and
> libraries, this patch supports dynamically-created probes that
> are created via libstapsdt [1].  libstapsdt allows dynamic languages
> like python to declare and fire probes by dynamically creating
> a memfd-based shared library containing ELF notes for the probes.
> With these changes we can also trace these probes.  This is very
> useful since libstapsdt has python, NodeJS, go and luaJIT bindings.
> 
> [1] https://github.com/linux-usdt/libstapsdt
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  include/dtrace/pid.h       |   1 +
>  libdtrace/dt_pid.c         | 292 +++++++++++++++++++++++++++++++++++++
>  libdtrace/dt_prov_uprobe.c |  43 +++++-
>  3 files changed, 332 insertions(+), 4 deletions(-)
> 
> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
> index 8d4b6432..99093bc9 100644
> --- a/include/dtrace/pid.h
> +++ b/include/dtrace/pid.h
> @@ -24,6 +24,7 @@ typedef enum pid_probetype {
>  	DTPPT_OFFSETS,
>  	DTPPT_ABSOFFSETS,
>  	DTPPT_USDT,
> +	DTPPT_STAPSDT,
>  	DTPPT_IS_ENABLED
>  } pid_probetype_t;
>  
> diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
> index d12b7919..dd36a115 100644
> --- a/libdtrace/dt_pid.c
> +++ b/libdtrace/dt_pid.c
> @@ -38,6 +38,9 @@
>  #include <dt_pid.h>
>  #include <dt_string.h>
>  
> +#define SEC_STAPSDT_NOTE	".note.stapsdt"
> +#define NAME_STAPSDT_NOTE	"stapsdt"
> +
>  /*
>   * Information on a PID probe.
>   */
> @@ -1262,6 +1265,292 @@ dt_pid_create_pid_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *p
>  	return err;
>  }
>  
> +static int
> +dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
> +		 dt_pcb_t *pcb, const dt_provider_t *pvp, char *path,
> +		 unsigned long addr_start)
> +{
> +	size_t shstrndx, noff, doff, off, n;
> +	const prmap_t *pmp = NULL;
> +	char *mapfile = NULL;
> +	Elf_Scn *scn = NULL;
> +	Elf *elf = NULL;
> +	GElf_Shdr shdr;
> +	GElf_Ehdr ehdr;
> +	GElf_Nhdr nhdr;
> +	Elf_Data *data;
> +	int i, err = 0;
> +	int fd = -1;
> +	char *mod;
> +
> +	fd = open(path, O_RDONLY);
> +	if (fd < 0) {
> +		dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +			     "Cannot open %s: %s\n",
> +			     path, strerror(errno));
> +		return -1;
> +	}
> +	mod = strrchr(path, '/');
> +	if (mod)
> +		mod++;
> +	else
> +		mod = path;
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);   // ELF_C_READ ?
> +	assert(elf_kind(elf) == ELF_K_ELF);
> +	elf_getshdrstrndx(elf, &shstrndx);
> +
> +	if (gelf_getehdr(elf, &ehdr)) {
> +		switch (ehdr.e_type) {
> +		case ET_EXEC:
> +			/* binary does not require base addr adjustment */
> +			addr_start = 0;
> +			break;
> +		case ET_DYN:
> +			break;
> +		default:
> +			dt_dprintf("unexpected ELF hdr type 0x%x for '%s'\n",
> +				   ehdr.e_type, path);
> +			err = -1;
> +			goto out;
> +		}
> +	}
> +
> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> +		char *secname;
> +
> +		assert(gelf_getshdr(scn, &shdr) != NULL);
> +
> +		secname = elf_strptr(elf, shstrndx, shdr.sh_name);
> +		if (strcmp(secname, SEC_STAPSDT_NOTE) == 0 &&
> +		    shdr.sh_type == SHT_NOTE)
> +			break;
> +	}
> +	/* No ELF notes, just bail. */
> +	if (scn == NULL)
> +		goto out;
> +	data = elf_getdata(scn, 0);
> +	for (off = 0;
> +	     (off = gelf_getnote(data, off, &nhdr, &noff, &doff)) > 0;) {
> +		pid_probespec_t psp = {0};
> +		char *prv, *prb;
> +		const char *fun;
> +		char *dbuf = (char *)data->d_buf;
> +		long *addrs = data->d_buf + doff; /* 3 addrs are loc/base/semaphore */
> +		GElf_Sym sym;
> +
> +		if (strncmp(dbuf + noff, NAME_STAPSDT_NOTE, nhdr.n_namesz) != 0)
> +			continue;
> +		prv = dbuf + doff + (3*sizeof(long));
> +		/* ensure prv/prb is null-terminated */
> +		if (strlen(prv) >= nhdr.n_descsz)
> +			continue;
> +		prb = prv + strlen(prv) + 1;
> +		if (strlen(prb) >= nhdr.n_descsz)
> +			continue;
> +		if (strncmp(pdp->prv, prv, strlen(prv)) != 0)
> +			continue;
> +		/* skip unmatched, non-wildcarded probes */
> +		if (strcmp(pdp->prb, "*") != 0 &&
> +		    (strlen(pdp->prb) > 0 && strcmp(pdp->prb, prb) != 0))
> +			continue;
> +		if (prb + strlen(prb) + 1 < dbuf + doff + nhdr.n_descsz)
> +			psp.pps_sargv = prb + strlen(prb) + 1;
> +
> +		psp.pps_type = DTPPT_STAPSDT;
> +		psp.pps_prv = prv;
> +		psp.pps_mod = mod;
> +		psp.pps_prb = prb;
> +		if (elf_getphdrnum(elf, &n))
> +			continue;
> +
> +		for (i = 0; i < n; i++) {
> +			GElf_Phdr phdr;
> +
> +			if (!gelf_getphdr(elf, i, &phdr))
> +				break;
> +			if (addrs[0] < phdr.p_vaddr ||
> +			    addrs[0] > phdr.p_vaddr + phdr.p_memsz)
> +				continue;
> +			else
> +				psp.pps_off = addrs[0] - phdr.p_vaddr + phdr.p_offset;
> +			break;
> +		}
> +
> +		if (!psp.pps_off)
> +			continue;
> +		psp.pps_nameoff = 0;
> +
> +		if (!pmp)
> +			pmp = Paddr_to_map(dpr->dpr_proc, addr_start + addrs[0]);
> +		if (!pmp) {
> +			dt_dprintf("%i: cannot determine 0x%lx's mapping\n",
> +				   Pgetpid(dpr->dpr_proc), psp.pps_off);
> +			continue;
> +		}
> +		if (!mapfile)
> +			mapfile = Pmap_mapfile_name(dpr->dpr_proc, pmp);
> +
> +		if (!mapfile) {
> +			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +				     "Cannot get name of mapping containing probe %s for pid %d\n",
> +				     psp.pps_prb, dpr->dpr_pid);
> +			err = -1;
> +			break;
> +		}
> +		psp.pps_fn = mapfile;
> +		if (dt_Plookup_by_addr(dtp, dpr->dpr_pid, addr_start + addrs[0],
> +				       &fun, &sym) == 0)
> +			psp.pps_fun = (char *)fun;
> +		else
> +			psp.pps_fun = "";
> +		psp.pps_dev = pmp->pr_dev;
> +		psp.pps_inum = pmp->pr_inum;
> +		psp.pps_pid = dpr->dpr_pid;
> +		psp.pps_nameoff = 0;
> +
> +		if (pvp->impl->provide_probe(dtp, &psp) < 0) {
> +			dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
> +				     "failed to instantiate probe %s for pid %d: %s",
> +				     psp.pps_prb, psp.pps_pid,
> +			dtrace_errmsg(dtp, dtrace_errno(dtp)));
> +			err = -1;
> +		}
> +		if (err == -1)
> +			break;
> +	}
> +
> +out:
> +	free(mapfile);
> +	elf_end(elf);
> +	close(fd);
> +	return err;
> +}
> +
> +static void
> +dt_pid_create_stapsdt_probes_proc(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp,
> +				  dt_pcb_t *pcb, const dt_provider_t *pvp,
> +				  dt_proc_t *dpr, const char *proc_map)
> +{
> +	char line[1024];
> +	FILE *fp = NULL;
> +	pid_t pid;
> +
> +	assert(dpr != NULL);
> +
> +	pid = dpr->dpr_pid;
> +	fp = fopen(proc_map, "r");
> +	if (!fp)
> +		return;
> +
> +	while (fgets(line, sizeof(line) - 1, fp) != NULL) {
> +		long addr_start, addr_end, file_offset;
> +		long dev_major, dev_minor;
> +		unsigned long inode;
> +		char name[PATH_MAX + 1];
> +		char path[PATH_MAX + 1];
> +		char perm[5];
> +		int ret;
> +
> +		ret = sscanf(line,
> +			     "%lx-%lx %4s %lx %lx:%lx %lu %[^\n]",
> +			     &addr_start, &addr_end, perm, &file_offset,
> +			     &dev_major, &dev_minor, &inode, name);
> +		if (ret != 8 || !strchr(perm, 'x') || strchr(name, '[') != NULL)
> +			continue;
> +
> +		/* libstapsdt uses an memfd-based library to dynamically create
> +		 * stapsdt notes for dynamic languages like python; we need
> +		 * the associated /proc/<pid>/fds/ fd to read these notes.
> +		 */
> +		if (strncmp(name, "/memfd:", strlen("/memfd:")) == 0) {
> +			DIR *d;
> +			struct dirent *dirent;
> +			char *deleted;
> +
> +			deleted = strstr(name, " (deleted)");
> +			if (deleted)
> +				*deleted = '\0';
> +			snprintf(path, sizeof(path), "/proc/%d/fd", pid);
> +			d = opendir(path);
> +			if (d == NULL)
> +				continue;
> +			while ((dirent = readdir(d)) != NULL) {
> +				struct stat s;
> +
> +				snprintf(path, sizeof(path), "/proc/%d/fd/%s",
> +					 pid, dirent->d_name);
> +				if (stat(path, &s) != 0 || s.st_ino != inode)
> +					continue;
> +				if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp,
> +						     path, addr_start - file_offset) != 0)
> +					break;
> +			}
> +		} else {
> +			if (dt_stapsdt_parse(dtp, dpr, pdp, pcb, pvp, name,
> +					     addr_start - file_offset) != 0)
> +				break;
> +		}
> +	}
> +	fclose(fp);
> +}
> +
> +static int
> +dt_pid_create_stapsdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
> +{
> +	int i, nmatches = 0, err = 0;
> +	const dt_provider_t *pvp;
> +	char *globpat = NULL;
> +	const char *pidstr;
> +	glob_t globbuf;
> +	bool wildcard;
> +	pid_t pid;
> +
> +	assert(pcb != NULL);
> +
> +	pidstr = &pdp->prv[strlen(pdp->prv)];
> +
> +	while (isdigit(*(pidstr - 1)) || *(pidstr - 1) == '*')
> +		pidstr--;
> +	if (strlen(pidstr) == 0)
> +		return 0;
> +	wildcard = strchr(pidstr, '*');
> +	asprintf(&globpat, "/proc/%s/maps", pidstr);
> +	nmatches = glob(globpat, 0, NULL, &globbuf) ? 0 : globbuf.gl_pathc;
> +	pvp = dt_provider_lookup(dtp, "stapsdt");
> +	assert(pvp != NULL);
> +
> +	for (i = 0; i < nmatches; i++) {
> +		dt_proc_t *dpr = NULL;
> +
> +		pidstr = globbuf.gl_pathv[i] + strlen("/proc/");
> +		pid = atoll(pidstr);
> +		if (pid <= 0)
> +			continue;
> +		if (dt_proc_grab_lock(dtp, pid, DTRACE_PROC_WAITING |
> +				      DTRACE_PROC_SHORTLIVED) < 0) {
> +			if (wildcard)
> +				continue;
> +			dt_pid_error(dtp, pcb, NULL, D_PROC_GRAB,
> +				     "failed to grab process %d",
> +				     (int)pid);
> +			err = 1;
> +			break;
> +		}
> +		dpr = dt_proc_lookup(dtp, pid);
> +		if (dpr) {
> +			dt_pid_create_stapsdt_probes_proc(pdp, dtp, pcb,
> +							  pvp, dpr,
> +							  globbuf.gl_pathv[i]);
> +			dt_proc_release_unlock(dtp, pid);
> +		}
> +	}
> +	free(globpat);
> +	globfree(&globbuf);
> +
> +	return err;
> +}
> +
>  int
>  dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *pcb)
>  {
> @@ -1319,6 +1608,9 @@ dt_pid_create_usdt_probes(dtrace_probedesc_t *pdp, dtrace_hdl_t *dtp, dt_pcb_t *
>  	free(globpat);
>  	globfree(&globbuf);
>  
> +	if (err == 0)
> +		err = dt_pid_create_stapsdt_probes(pdp, dtp, pcb);
> +
>  	/* If no errors, report success. */
>  	if (err == 0)
>  		return 0;
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index 2cbd8910..b91cf810 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -313,12 +313,15 @@ static const dtrace_pattr_t	pattr = {
>  
>  dt_provimpl_t	dt_pid;
>  dt_provimpl_t	dt_usdt;
> +dt_provimpl_t	dt_stapsdt;
>  
>  static int populate(dtrace_hdl_t *dtp)
>  {
>  	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
>  			       NULL) == NULL ||
>  	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
> +			       NULL) == NULL ||
> +	    dt_provider_create(dtp, dt_stapsdt.name, &dt_stapsdt, &pattr,
>  			       NULL) == NULL)
>  		return -1;			/* errno already set */
>  
> @@ -477,8 +480,8 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
>  
>  		prp_next = dt_list_next(prp);
>  
> -		/* Make sure it is an overlying USDT probe. */
> -		if (prp->prov->impl != &dt_usdt)
> +		/* Make sure it is an overlying USDT, stapsdt probe. */
> +		if (prp->prov->impl != &dt_usdt && prp->prov->impl != &dt_stapsdt)
>  			continue;
>  
>  		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
> @@ -637,6 +640,7 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	return 0;
>  }
>  
> +/* shared between usdt, stapsdt probes */
>  static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  {
>  	char				probnam[DTRACE_FULLNAMELEN], *p;
> @@ -890,6 +894,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	case DTPPT_OFFSETS:
>  	case DTPPT_ABSOFFSETS:
>  	case DTPPT_USDT:
> +	case DTPPT_STAPSDT:
>  		snprintf(prb, sizeof(prb), "%lx", psp->pps_off);
>  		break;
>  	default:
> @@ -904,7 +909,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.prb = prb;
>  
>  	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
> -		   psp->pps_mod, psp->pps_fn, psp->pps_prb, psp->pps_off);
> +		   psp->pps_mod, psp->pps_fun, psp->pps_prb, psp->pps_off);
>  	uprp = dt_probe_lookup(dtp, &pd);
>  	if (uprp == NULL) {
>  		dt_provider_t	*pvp;
> @@ -1108,11 +1113,24 @@ static int provide_usdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
>  	return provide_probe(dtp, psp, psp->pps_prb, &dt_usdt, PP_IS_FUNCALL);
>  }
>  
> +static int provide_stapsdt_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp)
> +{
> +	if (psp->pps_type != DTPPT_STAPSDT &&
> +	    psp->pps_type != DTPPT_IS_ENABLED) {
> +		dt_dprintf("pid: unknown stapsdt probe type %i\n", psp->pps_type);
> +		return -1;
> +	}
> +
> +	return provide_probe(dtp, psp, psp->pps_prb, &dt_stapsdt, PP_IS_FUNCALL);
> +}
> +
> +
>  static void enable(dtrace_hdl_t *dtp, dt_probe_t *prp, int is_usdt)
>  {
>  	const list_probe_t	*pup;
>  
> -	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt);
> +	assert(prp->prov->impl == &dt_pid || prp->prov->impl == &dt_usdt ||
> +	       prp->prov->impl == &dt_stapsdt);
>  
>  	/*
>  	 * We need to enable the underlying probes (if not enabled yet).
> @@ -1144,6 +1162,11 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  	enable(dtp, prp, 1);
>  }
>  
> +static void enable_stapsdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
> +{
> +	enable(dtp, prp, 1);
> +}
> +
>  /*
>   * Generate code that populates, counts the probe arguments.
>   */
> @@ -1875,3 +1898,15 @@ dt_provimpl_t	dt_usdt = {
>  	.discover	= &discover,
>  	.add_probe	= &add_probe_usdt,
>  };
> +
> +/*
> + * Used for stapsdt probes.
> + */
> +dt_provimpl_t	dt_stapsdt = {
> +	.name		= "stapsdt",
> +	.prog_type	= BPF_PROG_TYPE_UNSPEC,
> +	.provide_probe	= &provide_stapsdt_probe,
> +	.enable		= &enable_stapsdt,
> +	.probe_destroy	= &probe_destroy,
> +	.add_probe	= &add_probe_usdt,
> +};
> -- 
> 2.43.5
> 
