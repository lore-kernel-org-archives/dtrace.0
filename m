Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2FE314B79
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927780; cv=fail; b=r3AKOAlpfUvEeoD1P1jMEblBdNN6CBKbHPM0Ap48TiGjnOqQMix1Ap5osKh/UHL0Dnygch2a6dklrJ7c82tWRRsLn5i9aTb3fLL03RhYmdxa12lRz0Mx8MRvh7lF5pkULLqFEXrCeamDY/1ZQOpUNkslvKZfHZTPZD3AP4N686I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927780; c=relaxed/simple;
	bh=rUo6xF2PtymJAHwmN3s14tFCyj8TqzXYBnVI91plbQM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FNazjvb6hGkYONRDSgkg2+V3q6uAm/1UFzh5XBlqnvIxpBbuUaUAd2FEM/Wh+YoJkVQ4XNOPEwcxoAOMgZQ6xv9ka2peubXcin0pXieSctMeaRcM/madx4dO/ofFCEVQsqgjxODOEzNG6BvgCk/FPE7+DzSovhhA8RTlDP4oNGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=huHwYnr3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hhaBeIpL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="huHwYnr3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hhaBeIpL"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K7us0k3264903
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=6BC6lFn85U8YM62w
	6sU6SAi1Q0cZy/YVaiuwn9aHEyQ=; b=huHwYnr3jbJCy8OuldX0n07SJx2zjQH7
	tSKH+3spSYkJgH59Q5A1smLbTSYEzbMjmfhjgat59jRv7YZgJjtDMsvsBe/OjZAL
	V2jcbTLO5Fq6VvkL0lgoRbJ8lyfjGPyil2VqHpqKQNVyNjmYvEci1J+WOD2Rp3xl
	8S+8fMIlSzD3UBUeTTaCvrQKfs4vjIWZ4JbxQQRWoYYeKsWFxumFVceMBUC9Mu5C
	YrOWVauDZNRKZmis2rMsF39OJ8NqqgTBGAMAP13HpVK4s5goD5HePZp9waDW31D3
	+0XQcQVdfAOh4MwnjhXFjBqPwfsNXjlt14ErDNqfqtjrhQtLw/K10g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br1b8c0k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:49:36 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60KFqRoq022493
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:49:34 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012022.outbound.protection.outlook.com [40.107.200.22])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vdpdkx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 20 Jan 2026 16:49:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1deFWBGc6Y8hFbrebtOtyYdEqpD8LD+7SzKnCrgKxHYHRbRcTNKYp4c20UAvlM+BtNUbjH1aFfWlgN+cV5paQEW3UOB0ZddVVoTOXDlP3HxOMmvt9qzq0LuRG2JYfxQy5IDW+i8nKEGH3zSItCpSvMvrOWwI4YbL74WQ//xuvq89ZTPxr7jqefhYPqeK1h+WwMgVFmYbQHZNTdJFyaxBBmjYr9SW+9kbyRHx/muO9tW3BW6qcj//fn0UAi2RyGEtKPzCUyoNX97psrhSYZ1jeoC2Ac2j4O1sECxJj95jWmtPUq1GWFB/8cfafXl4ZRBsV5gQOn6WHRVeq6PAT0OXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BC6lFn85U8YM62w6sU6SAi1Q0cZy/YVaiuwn9aHEyQ=;
 b=BrcexR7VN6/r2LXjOnTIbol/hwejCOyxKJ+FaKLs/k7P3Qlgi/R+zkRkfEeu70HqIGx29rM3stn6rxy1OZOlyENstq+2wXc682oKNxHZOY0v3FhGUcCO4FAXT7YeHS1S0MY70LCWJdtgdnztjMs3vVaKq5qK1zUVT8GIn7fg0tFHPhsZ3p6Jmhea8kxe2ORjqSIZOQSFiftcrP9vJCUmCkI4hyR2OSeOkiGZYkYjDC1BIiDA3ZM+IUZVoJUqUJj2yu6e9NOwg+3XpzkZQB7rQW/8H0QM5W+P001ztm9GROvoS02AlByD4/rDCGkjf5/Sk9+4FMW833Iwrozw1hF3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BC6lFn85U8YM62w6sU6SAi1Q0cZy/YVaiuwn9aHEyQ=;
 b=hhaBeIpLn34SdNkuGnL3oRYu1EL0a7NIfCCfCpuux3f4X6Vt0ZJfaz2UL9H1/o/voZMTebwD/vIHbBXiJRs7W+/kR6Q0GoIXF++hIw2bVOJsw5q2wNZLOOVMOP9c2Jc5xmNrbxBjvKeeASKYAG2dm0KnakJH1+fdCplpMqlUYwk=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SA3PR10MB6999.namprd10.prod.outlook.com
 (2603:10b6:806:318::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:49:32 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::afbe:3417:6b0a:43e%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:49:31 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: [PATCH] spec: testsuite: weakly pull in kernel-uek-tools to get perf
Date: Tue, 20 Jan 2026 16:49:26 +0000
Message-ID: <20260120164926.198356-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.52.0.285.g44a719c714.dirty
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0109.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::6) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SA3PR10MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e3997f-5c32-4111-d838-08de5843e25f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nqaSPnzbxPF1ThBvB0o/tO1x1AzlNdbCrmMOgGd0K2imwn237gMSq2LO7ljg?=
 =?us-ascii?Q?RQ7IUa7iXejahJ9JzaWymlBfjHErQhImLdb4iQlmPe8ERIw8G9aj73vNOx4G?=
 =?us-ascii?Q?DTGn/5nddmnbv+6DvjUbbjy1YIsFIW/qc38mDonI2PlmwBHmlY4RRaY+9HlJ?=
 =?us-ascii?Q?lpauecyjGtk5Dm6LsmbpRdNwezPQT0OcVl/Sg144MEKs16c6QLLu+Jt3nP/M?=
 =?us-ascii?Q?07UGhPULA6ZFYohZ0PARY1BabVn5jq5gckqprtzyniLP0ympr8y/5/l1EjnJ?=
 =?us-ascii?Q?wBMZAPeNfd3EmJSx/wn+RgxDwQxrFmJ3IS2MPyFMceYNSQXGDeFX42oj1d+J?=
 =?us-ascii?Q?7VQg68dmTvx7RkpptkY6qL4jnWdwgT0RhKsnlXpoL10DIgJYJ+pPVdQ7APhy?=
 =?us-ascii?Q?ny1p2iJo27EJB98KWShJD66q8RvfSLfmnUG8J7Lyc999RbfpUYiLco1tYfJb?=
 =?us-ascii?Q?RasdY9v+MlUfCgqg0NOnvA7GbmefT2qgGG3482zWf0ON4SIDyfX4Mz6UtOom?=
 =?us-ascii?Q?x66GcShlFm1p5tKlCKn6K7u01R/ID9qWMahIOFWc5N4v7gelEFr2Z+e5tZ2t?=
 =?us-ascii?Q?dfr7Cy88M5Uget7HqBlRTpNWRKGu3a6B63TtffA55roMMc/VNe9HMEwLGXUv?=
 =?us-ascii?Q?SidE534XK0UP5jS6I8yPh3vRLexmhxrsteyJWCTLK9+BlkV4BwBT8jhqH7ld?=
 =?us-ascii?Q?Nr0Sh8zI1dlbkWXyJyrdUkK3T/G4mjS7Y/IavlUofRZafRbp9/lHjIWJUUwl?=
 =?us-ascii?Q?UusmTpOomKxNoRHVF5pAr/Rwr0+10FCS6pnGHk+tU1iAv+mADZWjHJeJGRRb?=
 =?us-ascii?Q?HsF0F+QU9zkRf4ndU0Ot6B0AvOH4PVwT4ZNWYQo2xCrmw43tIIius5QBr6Aa?=
 =?us-ascii?Q?HBh5HXhyx1lOj7bmFgtzFVightJugjHf2l8GNQZTN/bNATFgf6Q45IRklkhI?=
 =?us-ascii?Q?SuEPHs4ItaN40m4W1/mgpV114PODoHX7mU5YSuQVGG+VVNvbCn9J4MgTDbke?=
 =?us-ascii?Q?adDjv7nZml0wtrk2v2Adt30IKGLWJq2BH2hGtywMmb4yuxKpA+IM/WgTnNm+?=
 =?us-ascii?Q?ysExdXqCFUThmhQ/qupRNyCPQ6OdqbKB+AjEIszQCsFeLUmZxC9UAEN93BZE?=
 =?us-ascii?Q?fOV+F2MU47QkzUYN7EIIhtNkdP1CN2Y9WX9I4vID5OUmY4Ho5IQniE2C3G0O?=
 =?us-ascii?Q?pjaLZmhMCeOfh+TCQhwwdzbyYUKxkVhU0Az5HUvo5B+4iTIfFRkVFtMBjk1C?=
 =?us-ascii?Q?WvPtOrxd3g9s4cD0l4IJ1crvco8HTC5iHVm9z1MA7e4a/KeaN68lh+LnYPGx?=
 =?us-ascii?Q?0ebd1oUn3FKW7HQDD3ZEGizYRph9eqwUFCLgRkoidPr8XVNP+Cv07itCuQ8j?=
 =?us-ascii?Q?ilmjnCJSuaM7RjevdPxJY09B6cMzHe8GsIc3b4vNf3Ss5gU+j390VJaRzBpj?=
 =?us-ascii?Q?rhVtyURMB8ck+GyLwGHYi/3La5sYCAxFXdAIwCN3uBFZSdShjMUlr4FbYjmP?=
 =?us-ascii?Q?4HWAAUPDNsiFwz/4zEaWkya7chUWaC3nSkyl4a+f7IQngMeJNlEpDsRFppOs?=
 =?us-ascii?Q?Ap6dv0QvMgrg6qCDxIw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XbRSvy/rdPx1dwlpPT+S30SXxZEli08SmTIYepqV/0gWlCmlsqQN+CNTpfK3?=
 =?us-ascii?Q?gw9LldvrrpsngQJUcl05It2D102j/WXG/3zHaLoi1XaWrNPripziwwbMnntp?=
 =?us-ascii?Q?f8+R53xa2vbQ1GrhmO2qcKpwVatebyd80BLtVW9BLKFqQ1J1aC6NBIcGF2iG?=
 =?us-ascii?Q?h7R0Lk5zj6QR/v6xOEWLMWD4TuwxvDu2Vc5sBNK5HftimP2HtiWYleDAwPV/?=
 =?us-ascii?Q?Y/6hwOV4r5jbOa/tu2baUUiUgjLMfjfRNauZFyMXFczTmRpuLKN4SsPo4xDC?=
 =?us-ascii?Q?N8PG+s4lzPbXCh7FAiTYQ1WGfPhMWRmYYgTtGfa7pCAqA9pfPR4QZLgc0zlx?=
 =?us-ascii?Q?UbLFPrzEM22V9gy+hK5pa2xsY+Sis96DGW8KbeyVygF8vgG4exnaLxI2QCEc?=
 =?us-ascii?Q?Z7Yh/bnx4o48PED0WodXYNptJJxSImT7EIaHUaiaolwpavs6hed2/yxjSSML?=
 =?us-ascii?Q?xMpYEI7Xn+2pd4qXz/ztAC+RkKfT5gKsD1KsekUns/Dnc3CgL7OJuv1ghNJF?=
 =?us-ascii?Q?v1vFQIlPoJYQqoK42vC2j1ufYHyZsP4UNyvYxi/G+vL0P0++akiQFzMEtO5q?=
 =?us-ascii?Q?0G7VOnFz81YK0d5JIAv9fLN7/qq9BTiKbmaxhWXI5fxyDg+rjXSjMqCS7DXV?=
 =?us-ascii?Q?p6qZdLOFAitZ+Bby8/I7ekgFAnXscHL8NITNSmfZ3fer4GnxE9yF/Xc9Z7Tm?=
 =?us-ascii?Q?nBR0zowCa3VJeooOMwDk+hDPUFix5ekAb1yO1/lstVHLVSe+Y6VajlCgLtdj?=
 =?us-ascii?Q?bPosJHYs8XqOmzE6ZTlsH+IkUYCmwDl+Ls95nFJcgHBC7j7F2/EIqSuSzS7k?=
 =?us-ascii?Q?Q/9WV97sdLlEPFk0mlDpQ1rZTEiVT4HXqd0B1zfQZl13qR0KNx5wwHhns3jH?=
 =?us-ascii?Q?yhtjNTSf8SWGoAl7axjhv59+JPnP8LJ0o4efRWAxt+JjloT16KBrb6qJlrLx?=
 =?us-ascii?Q?/u14EnjBWaj/VfF8MXoClEsgIM3UY0bT9WqlkE9Efx+8mo+Gg2qde6j8d3iI?=
 =?us-ascii?Q?geHRu2mLesnUTbbf5mtKOwtiLSXUNDuFpNI/hnrzFpwBhBiNj/DJ9ljr3p87?=
 =?us-ascii?Q?R0+pGgWTJiMXZRJ7ueEO6ncowdZKRE8I576m5gIORjs8Al9RA2JspyFYGYHf?=
 =?us-ascii?Q?sIMES8NlstDMSHQhpxxj0PUCpUP0AGTWOpbnXGJkGb735WpeHXZKjA3V6/OH?=
 =?us-ascii?Q?Y75v7byLw6ADkiWBP+CuKID6rIaIHEUmr69FHd4yaESY9oSkT1Nynt8h8+rD?=
 =?us-ascii?Q?JO0IyIOdO7oClOu/nLIjwf5B3KfIvZpuwt0bAVQnkxjotXs0wWXG7l88MzxZ?=
 =?us-ascii?Q?fvHoK1ki+2mbDDblE/lfVG3YNjkigHpgCIpL+CK3GkfbNilX1ioQibYBRl0b?=
 =?us-ascii?Q?O9HLhjWLXPBlISVmfr153TNcpUNS1oZ+WLGrE3JsPnMcrA9ypOiAw+Xp5lXi?=
 =?us-ascii?Q?004v5gItoxMFjBpKFby5wJXCi/RZXk1cVymWjXTCSKXqzNIXqUc55YdXCeMD?=
 =?us-ascii?Q?xdiNIvLOKVnlSJd0s8QiiMPCDTPFhWJRZJvSVz8OQxI4ZTewyJy6xjObAR8n?=
 =?us-ascii?Q?sSoPwb+um3ZHBUbCOAvSXWz3S/xlx6SfuM6eHyY+0q4XAyArkJiXKEXjOiUx?=
 =?us-ascii?Q?/1teDFd22I23CODk1xHAfYgDqeEvWhJJZhcCV8gFheJDZhEKn0Du50MawlFO?=
 =?us-ascii?Q?gb39qEgZ3MPI15NiQmzDeyvMkrzHFSTQ2Sa7H7T1kBtkgQuoWeq9BVEnuYbP?=
 =?us-ascii?Q?jrEzcLhJBg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QN5rOtPL6W/qE3VfOwEUV9+3h7rbp8hXt1DuNfBAOsZ1zZmhdI/i9znu4uMMgu9tpuwwxYrK2MTop9f+qm92Ypl1rTyHHqFdzeYQjqGjC4L2+IAG+w5YMjkpWQtGo3ADWuDFu1qIt/gwop1EXmqBhobhu5FdqjGrQons7QomKVAmf5XyhQO8zao9HUmioq6LfOiG1NyrUm6kFyo08SXYueAAFQM26Co6SGM1GDvzYMjhdmb6ugl7LcpUoPqID74hEVVNtLXMCWssiVPfU0A1gQdvvpuXWGke5ubq683QfxJSgGha5YyF/WKmTliyitFSNFqK1hAQa8hHwDP97tBkVLaztpWcv9+VtjY2yUQI0hPiCIJ+iM1XzeG8ueTD/TPA+nsx/mniHDLyQ6cJR2/iUWc2ADcju3zY/8zKTwmQ23u8maJBneADC8mvxLcDqClvwSdVSmmUegg5/lss99/pTuVrb2FA+XZ3+hHmDjrYxfglUhXeTwmYsEhunypfRkkY/BbBP3coA+Q0MpspCOyfbzlbmc/rtYY6zrCLRFyCzjs6a62xfq25dQBAROkYirzyMydRL2aovdoNS5vpztdPZR9oa2XX9JAcL7nngbLE2Cs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e3997f-5c32-4111-d838-08de5843e25f
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:49:31.8311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bx9wq1dFe7AvCjV1tl2t1OJTqX2YPCT16ev/K4engmCPc/JEEkq6lfGF5Z1ZIW3qn1j8QTA3//dmrGML9BPTiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6999
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601200140
X-Authority-Analysis: v=2.4 cv=WbcBqkhX c=1 sm=1 tr=0 ts=696fb220 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=oHYq4Qs0uUD-M28iUOYA:9 cc=ntf awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0MCBTYWx0ZWRfX2UGl3ue/nXNE
 gbB4OqGf54L3ab81IdDN1ED0gKXQXeT+d/N/uV2cYfJno6joR+kRZEl8+005O0VJ8LHVrBWolkg
 AVgL371vQrMHqwOpIyBDELO1UQRfkcyw6ufq+VmMfSKnKcZ1+R0Uw0oY9AibsvMS3rxzkvh8/78
 yN2b1UNNcy7+cqzL5O87THf7KxCr/m8i/p/k6h0cYLXzj5aPOOAVLYYe5Kqg1y+4LSgPU6diCgC
 NdN/EkgIzLQKtZYuxLAsu/2/c5hJbm42i+POoTLC93ZYrf9judvn7QTjGgpZ5Raab4hifjCmz8Y
 3DJv2mTZ5TFGNzDLfqIPbXNuyapj69RD/BR/2WBeN46evxa10DnuM9zJdVkU4GHbZ3eN5XZk/uz
 vhrnaYjZfhEBSX98mB9r4hvCj3zNjROkouWmbotGxM4UXOhoXrAX/ng9lksN9fXkEB99mVxfqic
 k0dFd0F4oBFoiGfafE6lWi51JADRe8gm1bOV73vA=
X-Proofpoint-ORIG-GUID: KRXRSkMmdQjZmAeS-b2ePcf1QDQFw8us
X-Proofpoint-GUID: KRXRSkMmdQjZmAeS-b2ePcf1QDQFw8us

This prevents yum/dnf from pulling in the first kernel it finds, which
is often entirely wrong.

(This is obviously only applicable to OL and no other distro.)

Orabug: 38064413
Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 dtrace.spec | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/dtrace.spec b/dtrace.spec
index 4b20dc4088595..9fb9f1f8f30dd 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -115,7 +115,8 @@ Requires:     %{name}-devel = %{version}-%{release} perl gcc java
 Requires:     java-devel perl-IO-Socket-IP perl-Net-Ping xfsprogs
 Requires:     exportfs vim-minimal %{name}%{?_isa} = %{version}-%{release}
 Requires:     coreutils wireshark %{glibc32}
-Requires:     perf time bc nfs-utils
+Requires:     time bc nfs-utils
+Suggests:     kernel-uek-tools
 Autoreq:      0
 Group:	      Development/System
 

base-commit: 6e94c7d0a253806f85c39ff5f4e32a800d4cb6b6
prerequisite-patch-id: 531b3b91cb7c41bb13c03b50038a80e76bd7b093
-- 
2.52.0.285.g44a719c714.dirty

