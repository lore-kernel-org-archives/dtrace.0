Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A6719ADBF
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937487; cv=fail; b=PNt3OmdQrDldo3pT7LKLulJMBVpSu1BzPasvhpDai1sRyHcwoJBxPp3bIJd4jmsav3nReVCepcquiEXx5LUKpzulHqmyNphYSYkcPAoutWmkQtpT4a9/hanLw6f0AsH1Z9LyUo6/HxzuHnxhzMuYVPydj45Tab03Y+RdGxCb/9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937487; c=relaxed/simple;
	bh=PA4/QgbehJdcG/5Ne6+7JNaIR8finJsLd03Y13BddCc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZVJ+tUkbfDcxLoaxPj9eTsx5J99qPeHg3Qd7XBVqmRYSzwdvPSY2aaPKurGCifxEF6hpBqcoKwTcRblnFRT13LT/mNJE7Yf/fi+L7vsd4xsuG+Bx3BsodlS7p2DPCd8alZURTDutbKFVqJTESlCcMncFwKMPI3rkaKbffs1MhGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pLr24vcr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mHPEuEln; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pLr24vcr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mHPEuEln"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0vP7014504
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=L4O6RhjORi6PyuUoJe
	HN9my82USE9zYYUtumVcJE6jk=; b=pLr24vcrogqBtkgONwtCNSWk2BBf8xGC5W
	TH9QQjnsOhyRB9l5GjU8KKmK2me6NOUkbQCeuoB79uPZ4SmmkApdGnLzZtGRIkbA
	mKFV2ssX0R2DIxcWvi372kmc/WCtU1hz5NjQBYNnGwpiPKPAqSiTVlA8DpsoRNap
	caTpahhyMEbcRUHZoNyozEB3eCU1yACnZ61S8+QqpyyqT8JjQq/xrsUXCWEf2P1W
	zKb0s+Av6VrFIZs/gHr1YWJ7kwldMAPDFSTJ0AwoDk9DROAZ3AJ+VorzpWkaiaDl
	F4A2jqQb0EVYeIlaN5D+J2GHqj7GWMms2senVytWY1VKherZP9Zg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t7838bhb-17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:11:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHYwgm033586
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:01 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rweq0eyp-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlgMQqv1h67jxeTlQ645uOur0J/U4qbdMUfIA3E9Ww/xXRSjYZauvpUpxwCig5tUZDXmVpGGD3sD5AEPTirgN1o1chqLDYiZzl0RE97qoHCEcEeqYAWUrkvdifERjfsL2GHD1Cxx8huQU90/rOFSYIkua/LDE6TWjF9CReEmp/j/mx8ZhZz4NrIrJtZuv2Qac+huL/pcYlzvTZ2kiHZtT7/3Wx8stwg8iWpcCHgjGv+yUfBG+VL5CiVL7MWWrcI4ksR2yLolZzXDIRJNpdTIeJ8+aSefjCPecR0mHS8wbIbhN2NNHtBb/m3BWfCfIXBZt2IZZLDrK5bdThUPMzGLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4O6RhjORi6PyuUoJeHN9my82USE9zYYUtumVcJE6jk=;
 b=Ec750CF1Lwzec+5ZoU65Thg1cbHk5rEsqPG+jt3A10+CUUoJFvQV55msVvhY/NhG3MkpeZpRBBwkkhrF26IAXBb+OLCePxjOVg03DGvnjdsQqGjYchMjIjUlRlLnetD8Zq2+7Kn5s8qPbl137V3HqYanRK9dvy5DyzCz5sU2+8VC/zFgYjjU+Ncdj/nqyD6hIWU4AzivIUhGNGEQ7uO24fgxOomrjINM9NxMNv2scyPf/L8zlFA13SEjtEyfMIVD0XSgZ3m4CPKtqUFWCUapai2FLzYXPPXQpsJu/bmshOz4WD9AvM1WvHTrlwSytl11QbcxPW3ueRrYJV9Ae/RCZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4O6RhjORi6PyuUoJeHN9my82USE9zYYUtumVcJE6jk=;
 b=mHPEuElnkFD8oONj2yy5sY1WTi7CTjPCiFdPXmCV2PBypOaRJ8TjqwEq9Txi6FsV3VXQjLUNXjNIJk0X5E9cVNskforjRkc5J3GaaCuEi+NeurnUavlW2/NI0xhQiYMc4gOU3TvhMI/654F4q/RHy5+BhyVnQt+k0r4Ooz3rfW8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5120.namprd10.prod.outlook.com (2603:10b6:5:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 18:01:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:58 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 13/14] Test: caller and stackdepth tests for io provider
Date: Thu, 22 May 2025 14:01:17 -0400
Message-Id: <20250522180118.27343-13-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0261.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 719c0f65-82ab-4cfc-73f6-08dd995abee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1gbl1SfImj4VLR7veCZpPGRZAOSarADH3DvPNqJ5SHXXBtSBioc/eYPUeCaI?=
 =?us-ascii?Q?Mj0W2ve1JYoehNh2bBF+hZ7zgLMuJIEuU0IHNpK/mPa+oAYqjVozbjxj7qmw?=
 =?us-ascii?Q?kCusKUkAefJCdEigpmBIOzsqkzwf3CFH/ZK3cOT51MNR8ahJazINhND5+l3o?=
 =?us-ascii?Q?Iazul4K1apg4YSzv/yysqbjW44Np8aEGEg910hb4duyzlq5fb4gONKHMP2xX?=
 =?us-ascii?Q?Ed6bMfGHet2Qcl7pJ99yrVxOZZov3O8bk0Q4V3CuTkcCLYukcbSYb/gdZG4d?=
 =?us-ascii?Q?S8fTIf2EYWPKhyTb6txWbN89017P7eIItv8JcnvAM+ZqrooeuyBfye9SYo3T?=
 =?us-ascii?Q?Asaiu3mVWcJPlux8d1/6kOhKMKaNddPmYFCfOQyZOThKhzaAvuoob8+lxNlX?=
 =?us-ascii?Q?py+W5gqCZeke/3rqFAhuIZn3fn8LbzqwbcpFcRI1f4NtGJw33kdnxvBXlnGp?=
 =?us-ascii?Q?z7FDnXpgfvkJ2i8m5nGsLE9XScjP3j4l08Wzr7pbdIPjKwiHvpbrmC/qIvNw?=
 =?us-ascii?Q?UBKQ6ctXSk2+DUCkJkbLM1SYfEJ+OtADiAbH00Vyne1HTsMXe4W3UMPHs5iv?=
 =?us-ascii?Q?ADgmmqbww9BZB/p0Ch3MZGhEEbW/rzu4NXEM6TEIGvH6clvmc5nhRCoQhsMZ?=
 =?us-ascii?Q?dMtllSjEM6rcFmadjhf41oI46ML5kUBKmY3D1r3TSoBTNN75aT2Fz5ZD1FYz?=
 =?us-ascii?Q?b10BgoeSMyLU63669w6+HqBfPMSnNntrkUr6Ttmf228icS1vlcOv0Nqqv0Kv?=
 =?us-ascii?Q?a3ssKlCs0j2WJJpOsLN6/L77hdqdFPmdU6fK3/DmrtatNW1BdmCkoBhZ7vM/?=
 =?us-ascii?Q?S8HDyUY4CSQy+sxivjSS0tr9ib6f0bsSSuBVE3QXd3XHA+IEsJOHXrFydXLa?=
 =?us-ascii?Q?WGpBkifKT9+IsbZ8Uee7s4X8e/ckDrpbFh+2BO1NkivixyoJAR6hOCF23Z/V?=
 =?us-ascii?Q?PpVtFtCM7o7tTP+9ewGhoHb7pf/j0VrwUz7NaPpuNb1gw0YXKiObGBkDblC+?=
 =?us-ascii?Q?7HMFTFP6/Qdun+LSrbvOc1MKoQUtItLWE9pq59PIi0CaNmZ9ueGCFqOzVNMT?=
 =?us-ascii?Q?91vjk9uVDOIs4ctMdv3c1zF1zuIOjSRw/Z6B8NO6WVBfQYn9OC+y1k1TXIxU?=
 =?us-ascii?Q?pSHlVZtDUbbRK/5MeExV2KU5zjQYMbjtJKx8i5j9+bu4JrbIwybyRBJqQIDE?=
 =?us-ascii?Q?Gg5xu6KAqzGZMicfIgD7s/t10408HF2fbmrWXBzP15uTcdihB9VWQJZZfPJ6?=
 =?us-ascii?Q?eCnFRUkKclag940tQ/O+agJEpqPRWZdQS9sNIcuGB1y6dlGPW4XJrfnMCMwQ?=
 =?us-ascii?Q?xrG6PdZj2K0yabN44XtguFmKljksdACT9I6xtufmQO7gVwFTSaK12JzZAdCY?=
 =?us-ascii?Q?QwkY6rr6Na9WRFHFmC2EljJ/bznQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?utqfva661IzME3Pl2e37GcGiSCgA79rBHG5AFO/qhz8KdlMQgK3kRvTe2mVd?=
 =?us-ascii?Q?Rn+/1/9tJ80MFfdHqqaT6osM+aPtcCN3VKttO8nxkUQ+RT3Gdh4asO5nFyD7?=
 =?us-ascii?Q?srza0iS/pu8pjXIHiUSPS7vo3RQLWop20MZIJ7lvTtyGcfmckJI+gdte+j8h?=
 =?us-ascii?Q?ypudEvU8oCq9jwhCGaFYf+IhMhpxJ4AvTg4sAyhPCogkAPNw17tRVKLbrqy6?=
 =?us-ascii?Q?hCzYagMOgmGtqkBJZqRaFU5RpmNYxy9nDaSLZ6DM6901U0NF8pVrh8oDExm0?=
 =?us-ascii?Q?zYzSnmmLgvIisMT1C8pjMmwaWJ623j99/ubYiSeeQR9eKeVm2NNSvMcM6y1Q?=
 =?us-ascii?Q?rpkmW8bzojlUTuH9uL9D0vVRAQmuAQerh9UBaCsxbbMowBQWGcvwSqNTuarA?=
 =?us-ascii?Q?O5ZaMmpEKW1tUPe/sMFr0LNlmAFyUK/lJS8XGSBmGLOEES4Yi/TYxnRk1TKB?=
 =?us-ascii?Q?PO899/opnhlIme1ijxtgiPd94ahPn3EYMgcweqdhInYV8T8D/L8HRP8Jwkdc?=
 =?us-ascii?Q?UNL7fr/c7ipqSX9/Q/U0QdFCUjP6c2RGlPYlt724JOPh5aSUCIVrPjRLwvuo?=
 =?us-ascii?Q?yfRzYT4kZC7owU4G78CU4cRo+jxgP4weVDo1WJmvCrP+McoM/iynm+MVLlPJ?=
 =?us-ascii?Q?v0ArXSwjdvZAnqq4SCL7o5/yHv59Y+0RqzJtSA49LM/jI6FXGq+CqXZOSmCt?=
 =?us-ascii?Q?xBRTzhiBhMzhoiTQv5lz4TGiJChuN+SduwyB3hr2HKwYf4X/nGjCCkXOOes3?=
 =?us-ascii?Q?Qiaye9HgPvxCFHpXdF023DiT7RftxxMo/P27fA/fR1HyJa8ZhR2Eej2oC/T2?=
 =?us-ascii?Q?Cw25uw1mNfFISZzgunG2S5Gp3f+gKcoLZ3avWdoCTH7NAavWIpzOBsxfjoZN?=
 =?us-ascii?Q?D8CjQj3xweNgeL/1IuhZh5s27aXFNzdkLX/4Ns60NR7qjw4Cm1pZZWgMdue8?=
 =?us-ascii?Q?y91tzUQaes0IEbpU/x4pUB+4HHasC6CvC12ZxCKsxW8eOU/YG5odo56StSU+?=
 =?us-ascii?Q?VNE7NGnqzpeE///EscKNpXuiHVlPCq94JBie/yh1AF+jcSfAH1mYql75Te7q?=
 =?us-ascii?Q?BSi9+QvJDx2M1T8mVH/G4u4YUKW+iIwSGn0yPerFdIiSIhLy1AXVvWGW31tc?=
 =?us-ascii?Q?pBJuqRUxaRIA/qls9G2+TTVIA9WTweA07Tw9s4oSOAbYnjmirPtsBr/AKqr6?=
 =?us-ascii?Q?MbmL/xQCp3gIVv3vByQloNG6uAFXYFfR+8lxkw0mcMi/zzD6nHr7okjuwSlg?=
 =?us-ascii?Q?n0tmrzg2vBeRZMYip1H48HuNvWiC+ejVeWgiVatMHAxRJNgDfZpjSJwLKjRm?=
 =?us-ascii?Q?k06L7MP6NnVFREHoAcc4zkw42/DXif8QfD5HS6LGVSiiwlkOTaJf6tn11IYJ?=
 =?us-ascii?Q?s8V9nlS2XdnEvnQAsmRV1mO6ovcGNwjv5oKz2YItjthbORFtZS4FSXDNR0Bi?=
 =?us-ascii?Q?WZ/ABYQif25OT6Ucx8CyKYXfuk/AWd46GvAF8Ph/XtNZj56hBIPNshliEn8W?=
 =?us-ascii?Q?w34hK7YqSgw24qmmSs0I3lP2LX9c8TPPe9xeFamfJJaKCntAmmEkPSDGQreV?=
 =?us-ascii?Q?y7gKe5Ug8HX5Xi4qO+76HGsnoXlVTnjqxb5mvV8a?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7BEpPTmU7SdExTpaLWBlrvg9svcnfAk5aAWjWeg/vs5kRmXvEuhj96myz94/7nL5yOSMij12IkMmctzGee88yJpDi3XxEUyW8MBB/dEdtZGan7l7F/+RRx/fGzkBsLbnONsCXEM/qUVpFhsTrGp4p9968kM2dq97F5DKP9eoJDStkClTRQKf2mCa2ClwVL/1ASFgLwfKY90oYh8sKhDPC09Dr3cBFhEEDk7v6oHdD2aiXeUg8bB20+9Gk4lYnWvkY3LebvVu46jwT3c98myxtQyD5caoIiSBNbj1YgG3JOqcdZF5kjvgZP97UICwvWZUoiatclTWzdv5ryKL7zphfDB18lAQgkhtJ2z76Ow7LxE8PcAVYwh/+pLsiAke22FH3wCac+rMUyIqy3n6n7zX0C56oVdVbPerAdkEL0O+A4S8pfyTateqHy1hBjUKgc8suBMwoO9SSaRdd7PcfIv76SmdqO0KYSBbejKXjBtYRgft9zLfSiXKRQq0DSVsSr7doDLs21564yqc5eELAju50/bCKOzL98C5W82JDr5uemaAQSWo5JnE4C38Zy0Gb7mxAwsQvD319I48K6tcp7TS6rtFNgxMPPrxrlhFJEruLSc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719c0f65-82ab-4cfc-73f6-08dd995abee4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:58.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7P8jRJ40YbnPbPMPLMF1OrEoN+NzsG4/Vx29fSvRCbi9RoBfAPcRXLX/RmpQBtFPcctntvm/Lw+31Ppsx07kZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX/I726y8xGvA9 EbVsMrFtFglQCgpTtvV64uadEcTHr4vN3LEp3Wc8zCZAyQJxPqgqJKgfSzseSPlp0AQiYD1c8M2 vPpTN4HghVBDiS1qOuMXYyPGK11jN1tD8t5K/Wm4V9W2pCeE2DzIn3grfotBVrI4u7uU5HsPcKU
 yIuJC3yKHoDxfUpztSITyFQSzPJQiylRoLddPYe75eRh1eRtjK8aG7U2ymYwnGKPGEyn8Q0Efqg T3lPNtFf/jzWy0t3V79Eg8CnQ4n1uLdTJsjBWGv1s5fJLxDgIFD9iB2qB1HWIVQzZvGjcU6A/az RnC77bwS3ZE5MS/OfJOCEyy4+2rZQcesrqnl65Wcap/VEHDhgc/bxKGbgDmr/vCvO2X3BRQQ2Jv
 FWjUquRnNDZgCdDFCGqmY3E45UqwJMflS8wsNa/en1j06HRmgoiTuog/0ecKhi1jMcbp+wLd
X-Proofpoint-ORIG-GUID: Z8xWsBy03ewLXb6FPqGaCjRNGI74aRNB
X-Proofpoint-GUID: Z8xWsBy03ewLXb6FPqGaCjRNGI74aRNB
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f68cb b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tigEIFbzDRcQ18ulKJwA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/variables/bvar/tst.caller-io.r  |  1 +
 .../unittest/variables/bvar/tst.caller-io.r.p |  1 +
 test/unittest/variables/bvar/tst.caller-io.sh | 37 ++++++++++++++++++
 test/unittest/variables/bvar/tst.caller-io.x  |  1 +
 .../variables/bvar/tst.stackdepth-io.r        |  1 +
 .../variables/bvar/tst.stackdepth-io.r.p      |  1 +
 .../variables/bvar/tst.stackdepth-io.sh       | 39 +++++++++++++++++++
 .../variables/bvar/tst.stackdepth-io.x        |  1 +
 8 files changed, 82 insertions(+)
 create mode 100644 test/unittest/variables/bvar/tst.caller-io.r
 create mode 120000 test/unittest/variables/bvar/tst.caller-io.r.p
 create mode 100755 test/unittest/variables/bvar/tst.caller-io.sh
 create mode 120000 test/unittest/variables/bvar/tst.caller-io.x
 create mode 100644 test/unittest/variables/bvar/tst.stackdepth-io.r
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-io.r.p
 create mode 100755 test/unittest/variables/bvar/tst.stackdepth-io.sh
 create mode 120000 test/unittest/variables/bvar/tst.stackdepth-io.x

diff --git a/test/unittest/variables/bvar/tst.caller-io.r b/test/unittest/variables/bvar/tst.caller-io.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/variables/bvar/tst.caller-io.r.p b/test/unittest/variables/bvar/tst.caller-io.r.p
new file mode 120000
index 000000000..954ca96aa
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.r.p
@@ -0,0 +1 @@
+check_caller_to_stack2.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.caller-io.sh b/test/unittest/variables/bvar/tst.caller-io.sh
new file mode 100755
index 000000000..876ea70e3
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.sh
@@ -0,0 +1,37 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dtrace=$1
+nblocks=1024
+filesize=$((1024*$nblocks))
+fsoptions="defaults,atime,diratime,nosuid,nodev"
+iodir=$tmpdir/tst-caller-io.$$
+tempfile=`mktemp -u -p $iodir`
+
+trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
+
+# create loopback file system
+dd if=/dev/zero of=$iodir.img bs=1024 count=$((300*$nblocks)) status=none
+mkfs.xfs $iodir.img > /dev/null
+mkdir $iodir
+test/triggers/io-mount-local.sh $iodir xfs $fsoptions
+
+$dtrace $dt_flags -c "test/triggers/doio.sh $tempfile $filesize test/triggers/io-mount-local.sh $iodir xfs $fsoptions" -qn '
+io:::
+{
+	stack(2);
+	sym(caller);
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}'
+
+exit $?
diff --git a/test/unittest/variables/bvar/tst.caller-io.x b/test/unittest/variables/bvar/tst.caller-io.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.caller-io.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.r b/test/unittest/variables/bvar/tst.stackdepth-io.r
new file mode 100644
index 000000000..3bd29b8ed
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.r
@@ -0,0 +1 @@
+Stack depth OK
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.r.p b/test/unittest/variables/bvar/tst.stackdepth-io.r.p
new file mode 120000
index 000000000..e50f12822
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.r.p
@@ -0,0 +1 @@
+check_stackdepth_to_stack.awk
\ No newline at end of file
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.sh b/test/unittest/variables/bvar/tst.stackdepth-io.sh
new file mode 100755
index 000000000..3bbf38a47
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.sh
@@ -0,0 +1,39 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+
+dtrace=$1
+nblocks=1024
+filesize=$((1024*$nblocks))
+fsoptions="defaults,atime,diratime,nosuid,nodev"
+iodir=$tmpdir/tst-stackdepth-io.$$
+tempfile=`mktemp -u -p $iodir`
+
+trap "umount $iodir; rmdir $iodir; rm -f $iodir.img" QUIT EXIT
+
+# create loopback file system
+dd if=/dev/zero of=$iodir.img bs=1024 count=$((300*$nblocks)) status=none
+mkfs.xfs $iodir.img > /dev/null
+mkdir $iodir
+test/triggers/io-mount-local.sh $iodir xfs $fsoptions
+
+$dtrace $dt_flags -c "test/triggers/doio.sh $tempfile $filesize test/triggers/io-mount-local.sh $iodir xfs $fsoptions" -qn '
+io:::
+{
+	printf("DEPTH %d\n", stackdepth);
+	printf("TRACE BEGIN\n");
+	stack(100);
+	printf("TRACE END\n");
+	exit(0);
+}
+
+ERROR
+{
+	printf("error encountered\n");
+	exit(1);
+}'
+
+exit $?
diff --git a/test/unittest/variables/bvar/tst.stackdepth-io.x b/test/unittest/variables/bvar/tst.stackdepth-io.x
new file mode 120000
index 000000000..37b3ef9f8
--- /dev/null
+++ b/test/unittest/variables/bvar/tst.stackdepth-io.x
@@ -0,0 +1 @@
+skip_rawtp_old.x
\ No newline at end of file
-- 
2.43.5

