Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5C202F70
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913573; cv=fail; b=ZOEdovuBkHq6Oqcy2tDICA/8cLQVl9+h6wvBXw8OK2pkqmrQ9EfV0QwXsYM/bqcdKluOzs9V2Os6Icj0/6ytrw1+6n7fAVL3p3jUUW7hHx68OC+i5wZ+FYbv462iKXudgJ75UhmwtPJYBRbmVjfAs25TfNkkEEPtHZYnAyYZ/Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913573; c=relaxed/simple;
	bh=oxIH2egnKjczgO9IpVyM87eGKEO543xez2/cHCasa5U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=enWueIbZ11eWeeNl2lb1M3lvb3u4a4ZCxSwH8nDlJly7hObyhFoBzhktZ0ce2nUTaMS2vvVSoJ0irZvvQK9Jwz0qMgZQGLMtsJ4oNHw0WHYW2LkUKgBTaXgKCHx0OZwtih/TNXT6rw5r+/B9INXz+ioKnMfcyGKF46iNvZr8Hc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JDf1K4Sl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lAtBUJDv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JDf1K4Sl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lAtBUJDv"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIivlE014361
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=2lr0zbBY4W3VFv80hT
	jJFZSs6kKNlaeS1+5dsTf8dAs=; b=JDf1K4Slw4Y9N3qky9N21i7c6qn7jlAmB8
	hsGg83uD8G9qh96I50WW1tXW4XVKMvAsMqqFRbs2bTQKeVz1fPuaMDOgVjDwz0Tn
	hAEWEiYMs02GGE2RAVNbvwy3vM1buvJ+q12N0RcLVaVesdzjqKJyLz0q4gwv+UdA
	9H5ToUHBgyCd/bk+pC0f/HQI88IsUgwqG3f+VW/+Gn/8G8+dzxsYhtj2YspPVsri
	mJDdiUtQtyjZQpu7zdr453iTWNKiXzEJ3LHeMn0PKqjQ0SOSOpTw8yIx34oBtJD7
	OLCT5beqlpJJoaoJWNClB5cMByrzNAmUVGkZfAyLcrVIh7Og/YMg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49e0cfg0xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIKUKP010205
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:09 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013071.outbound.protection.outlook.com [40.107.201.71])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49dawmc23f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWSYJ0U5CrvJXVQt0vO5y+Iyc7clpb2kzEe9JBkBQ96gQEfkFPQ8Nxs+aWoc25vtKTdx3/X9Ph7Nu7Odg05pnrZnLI/yedHsOa7qtFCKGkbcpaqoxFya885K/2c60Z9SWVrok492cI2aPIjxQMKkVumpq992WxHtqDMHqo7s4tQkf6vskPOS0+3vOXDfXgMG6U2U60UciaawFHa+irwBBf72QB2NVkpv/96qEzygz9BNa6GQsES0+VN7LdGzeonEPIDPn1G/nOAsiVQIMT2aMwTGZu8EshXPXA7yNgwH15BwhdLzzLiRtFbvLlfzZWTkaWlLIrEjwQSefvWau+8TyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lr0zbBY4W3VFv80hTjJFZSs6kKNlaeS1+5dsTf8dAs=;
 b=ph+Fafj4ICJiWxxQZstbsf4UTTx0G65liy3vbrXb+y/1aGj4k7lSkoYXS/6SZ9y5WU+dSVjPeMLdKEIJ/rxrR+N0XNfH8CQCCg+qe0mffU+i9wpGcAJFTd5tfVRWIFZPKbftBCvJ8547rHhB6eYSx5lV9zXZoemnhD0yF9XeguF9jZWxy/EOQvy8ZzuuKP0ShXEwqZJStoaUI9bV/qX2+ywlfojar4+Pjxfu+eXOhSgmn8HxUmFabzM3kNTkPNQFORESThDizyJi1UxT3t6Wuky1xl+kda1Uor0gKNrek5RVup2jnRUKyimJBgzn9tTCtwl5xSC1ZfMg20sLCIyYoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lr0zbBY4W3VFv80hTjJFZSs6kKNlaeS1+5dsTf8dAs=;
 b=lAtBUJDvIIHBMaXri4e9jlX9CFXYUlBuvgcA3FC7BvpPwYlaVvmui29QXlDYsLaEX4VsZn5QGZTahiVvYoyIdQ7Bvh+xI/og4Pl34vFDuaZweloWRyTlKgICwmRG72Ehil8Rrv+gTwx1H2rmNrX/DV2iG9yPcTYHgXkXIhJvlNk=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:05 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:05 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 04/20] doc: Convert stability attribute tables to Markdown for readability
Date: Fri, 26 Sep 2025 15:05:41 -0400
Message-Id: <20250926190557.8485-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::29) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b892559-7119-4078-eca2-08ddfd2fbe50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hat+2oGPrBwWD72oo9EB6bczcKsC4LffhSOR+98x0zpOHjEmEavyBIUjGZ6R?=
 =?us-ascii?Q?nrgN61MeypWWT0db2ZptwS6Ecb7Octt078DiLH8AKXVJRrOTE02kFOGsgF9I?=
 =?us-ascii?Q?5FaHNTaudAq0KhtHiE2UwuivQeQ+fKLpi0mJEllrXBNxU+1orJB36rDOLh2P?=
 =?us-ascii?Q?ZNUS+qCqAbZnefvOfu03uVJe5h740OiFDRLrZ0vkkgN7I5wpNns4z/gXMTjI?=
 =?us-ascii?Q?WkORBw0Q3s9nSBnDOf2i4Jx1hxEuRKc69BQgSjkeX6SN9z3oupUMF1NMYC9s?=
 =?us-ascii?Q?yCmI2SW0R4kMRoCkJT/siQzRWHyUut/lFxvHG8uESpUMH1mZqroB/+PcYiGP?=
 =?us-ascii?Q?KZdeFOHE41OTursCoa9JAkU4br+diqjIueajK2Wtrb+FdxBBMYNZ8JYmzMvb?=
 =?us-ascii?Q?zFprDWjMMpa5+VvGO7u+U5Hj56SLxByOpiNDzd/RUtS7SPwwKPE4xL7lVR++?=
 =?us-ascii?Q?kGYu1F5KEN4EU71XRiGVdomMOz1VaYGQgRvXrkGIDQzE2eZ2+3wG9wpY3I6E?=
 =?us-ascii?Q?RXmRJv6n0JL47kA0sBO1nD7gN6aiNAp3QCvG/zOpKZthmrHnx55iwfWqIRwh?=
 =?us-ascii?Q?EJkndV34kdAxtJoB+OPVeYc3ztlFk8K1J93l0+WrPYQ7LRvEo3tSLLFHp43i?=
 =?us-ascii?Q?zzZyl6d5E0hfXlnQIWXhl64TfrEnsn/D7q262caVCa+b8tqmlNBJN99iK4V8?=
 =?us-ascii?Q?JgahxWkEUnlOfxYFDR9jTkletZctc0AvBh85rtaS57rDYFMkwEG1wwwJq1Xl?=
 =?us-ascii?Q?5hBiTAYa1shYgcfLC09gUjL3REozcoWvie53B3v+qNe9P+QacMNT5ghBnnJP?=
 =?us-ascii?Q?6y5MzOH51anFKbUm8UhzFqrUKAD4+vDOO45ufEmyNmU5sDxvtHstkjcq7mfy?=
 =?us-ascii?Q?+wSKgK0sNXEBoN8lNkRSEBEve0ZcD4Qe+4S6GCkoze4sJcU6UFBGdIL86Sro?=
 =?us-ascii?Q?dBZ44BUu53SJWGhH2BtUDEKx8L31OT7mavuqjArH6WL3okSBBYi+yJ5lflUs?=
 =?us-ascii?Q?T+w541b31PGrv/z2ey0E0X5xhdXdI4rAXIB4+i3k6+KgqgxShQnzEwdJW21P?=
 =?us-ascii?Q?y1aGwq/82dNAyO49YrimzknPFwT6VP9E5uwYjhnkvql7fMZ3TvA0WI99hRdA?=
 =?us-ascii?Q?Tumox6nh/A/nAK9iJXuPNxGB9lq0HF1D/2ezvFe/EqNMaHxHaTSAivXkEIPz?=
 =?us-ascii?Q?FNBq+yKP0k44U9Xl8jA0gD3MBJMiXSOWKSyWyHfZl+P4Py3MpxG0tmXhrPXy?=
 =?us-ascii?Q?2YC9bo3l7kbO0n2ppapORBh+Op6aa7cn0+LEFakzl7C2U+XxufUN1m5oopip?=
 =?us-ascii?Q?q17OM6iw9H6P1CmOapt5lGfQfXphZHALfEWOtu/Oc2YjXr2z8ONrrRSmlyal?=
 =?us-ascii?Q?CCFqbM/Pc+JzOqCJaSkSO/A6HBqwL0PBraYd8I5VW0DKAq5o306CMbxW3PHQ?=
 =?us-ascii?Q?RIxWzYgqNZlKMXN4e2TulobArobZJin5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/nPRL6C53p+L8aExPebHveS4AxsemQHB9ZMGr8n62fNfG/bHGY8ZLf/VyoB9?=
 =?us-ascii?Q?0Xfrlpgc4Yii6xqOiZHkE1FX9dIGM98vVpz05EXXdTqKB0OpaALQ2m3WOnER?=
 =?us-ascii?Q?R1y3msu8arwVQzyhFnv8yKC32EAtvCo52yJR8zzn5YJEREP6O8Kim1HAp0Sa?=
 =?us-ascii?Q?X+4SxzHkvkqP7aGbZHVKcDqz1yUFpqBBqRCufPwQsYiUzYI3PSdCqOUma2Cv?=
 =?us-ascii?Q?88h19JPbyxhQUvwpaLDv70x4Qma+wV5ub4oJubgOhD2I6WeQ0sjtofVC15FT?=
 =?us-ascii?Q?6P7dS7EpyjWCB91b6bmfyH9Cm67cTCtZ9Ubr6r3Bb+pZg9eyMPQNAx3Qwkf2?=
 =?us-ascii?Q?T3lecsEUBhnUXofPlt1VSFxlQgN53AVMzlMm8j0Jidgglkq26+3qP59RF/Dl?=
 =?us-ascii?Q?1pezRYA854tjDg9fYXODVkD16zFeQEBo6OZMsQl8puLnn3OUdJ8EbjoJb7Ra?=
 =?us-ascii?Q?ZbaU90XLT0sCNifiniBNH3j5gvSizKrYPJSFrEqPZS3/r6Npza0eeOzHYuwh?=
 =?us-ascii?Q?8dprb5ckFGbZe2qVpFz5pFV7D/+ydCuyF9FVUgNUTRtdeMVx3VTH8fq8PvRa?=
 =?us-ascii?Q?tgvG9C+WW/hHo1D3XETORXoxToWQaRxWAWSpbAvnyo9RCXFot/a1q7nTsOBQ?=
 =?us-ascii?Q?43+b0GwerehyrJFZ0JxKLoaVtKtx0QFPGzktwOnjtgF3DSH3dy/Axamvvkvt?=
 =?us-ascii?Q?YwI4B9WTRkj3qhjCAo6UFzEYTE+8mghWketGCSYHvkd9JJsU1LwAKHZlHlX+?=
 =?us-ascii?Q?gr2/pys2+V/sZMHRvbX/4F4S9JfcN46J6ATolqKA+YS3T5CP8f38g8wlwtyH?=
 =?us-ascii?Q?BKEHeo6syPv39YWG6BINrkFXqdG2hgVNnkU68wU1jG2YoxXl611eF5Req94k?=
 =?us-ascii?Q?RX73mQTN8tQbMaKiPkkXTj6wTY05XujXZ/c6EYUNtx5AZeMy1uv9Umus89qQ?=
 =?us-ascii?Q?emjqKj5cFaArHTt5kfGMZgijl9pwLIXWxt+a19kT6xzzl/t3QLin2kYH1hNG?=
 =?us-ascii?Q?pmfuv4JAI4U80MZ1VsQIW1EAYJvP08k52e+ezW8Yu/uh7/wHr0RUoAU6ayW7?=
 =?us-ascii?Q?VySQ19LGv/YKtQXXaXGKfI/N7vndh7Cnjqaw5DS4nq6w04VI8sQH0+8MxGaK?=
 =?us-ascii?Q?1gqLGcynuCE4RPQ5fM7H7dcq8M+1ItoLn6gGe7wpwRAMcFFrHsQ9DswpGddT?=
 =?us-ascii?Q?C45BBSFbCLVb4Vi3iJ91FWVnFGcFbdvGvj75BOkdKYuHWm8B5qblH3RPaVce?=
 =?us-ascii?Q?wefFHxMP+/dHoZ+02EA1u8WpzVp73mxBsW1GKp1NOMoHY2esOO3wi+0DxULn?=
 =?us-ascii?Q?QcbswbLK0lq1mB4YbSI3O/48lcGci+dY8WZ+FEYhb6pp6B+nDkTtMly/YbDx?=
 =?us-ascii?Q?pspe33ilZcReMwT1jAo0YpEohPc3hr8IYRIZa1CB/SWzYmqw0mIIBHO40Bzv?=
 =?us-ascii?Q?0wX42+3OqYiC5h1R+UijjODtV+I5AVgtmRCf0NcnJOYwUvtxrku/qI0fR5l+?=
 =?us-ascii?Q?jo1YTiS269eWqCytqCKbaF4QwZVQ19y9FqowvokiamhcV1glUfy1hSDUhZOH?=
 =?us-ascii?Q?pJWcdzo/CMhNpj3cpUXkDHwXpA5Hnu8xQ1itD4sW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kRf+TX/0MlaOlKkG5vl/JAwITV0tsaC8//hjVK++nP1PPf1Hnq9tIoojqzOVgQJVX2SkT9lcXFC6ZBYGMMIMXPIk43JtxU0cIRu9qmezZ9d3153QyiwZioRRR4AazOhKjlWBaXhbt8wo3ff0k2s9n9Dz50bFvKKWG6Fhx/8vldSalAowe7rFD+y2PCmx0zis0ZyTmItuvtAOkCP68D3CsIfoLI14RTH0FnzSP+FogNkOAfDyXR2tVXWRiZ49ljMA3d/v8BKWJ8FQMTxdvW7Xj0/rpAKDSaPE0ri2sFjEFiQPDf9WPpoDCAQXxAJg7dW5ydvCfXOi0f4q8/UJtRgrhOT+urrowDjvx0k2pHGHpwzyuu0IMQYp512PmaXIlh6gMlZ77TfjV1rXaorEpGm1Dk3dcCFuaw+nKk16V806/OnVxRS1oqnikjK0ByYrdM4PnlisiAuPS603kUCrXJe4jjY8kkgr+2K7MLTQ+B+YTvPV+j33A4Sya08FKuY2S4jFXPoSpvw5wj5OozJJcK3sPFCRwW5cwCRG693yI4WxZG4tB3736VIA/0LCk72jkE7yLei+fTruCJ0V4iMY0ExUHKKKjVhOC/lzvMaaeSKvFG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b892559-7119-4078-eca2-08ddfd2fbe50
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:05.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Is4oHxTMvym6tIjf1KuT5e55krHiTDCzpNPHsaUil9tS/dLyov/t2NkClyM4rNV4fCZcOzgR8wMJMZcJr42yBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509260172
X-Proofpoint-GUID: kCoyISNV5M7CfeCZnarYTHfMmPKsGmxS
X-Proofpoint-ORIG-GUID: kCoyISNV5M7CfeCZnarYTHfMmPKsGmxS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE3MCBTYWx0ZWRfX0Se6zt/t2eBy
 yuu/BJ0944r88Xp6vwCTd+OuacpyruKEmPPEqkI74NlpFpR1cqsgU6dgNrW3iUahRRn1keHGyfB
 JYgsvzwTbO/MV2L/CD2ojcMWpCjZqJXu1vcQeBYhsRFMItUpmPN1YAi96FzjvL2MLhqy4aTp6N/
 3D7/WY9N0PoxKMT1qi7ZhZNBdg3zETum8u1KigJVH2y++Tur8+IGpSywj9qF8OGqen5Owvbpclp
 YYDmN57iqTixfYVvmPOPfQH7egosQBes1JKRXIKv0N6vM5V165Pg+fl+04c9iRgWZkSCu4e/6wk
 x0qfbe12VE8WTAbBnwV0grpZppu+v6rHNCQAWJgyd6widWEbNi50IpXhrPHmnweDO9jFlANMLxA
 fKxv/GImG/U53D9nXYFv1waFMF5EOhjo1Yn2PqwUaOesS6cVmuU=
X-Authority-Analysis: v=2.4 cv=S/XUAYsP c=1 sm=1 tr=0 ts=68d6e422 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ZPaTsSJx0e4PweTTZx0A:9
 a=BQThsPIMUTkxSCMj:21 cc=ntf awl=host:12090

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../reference/dtrace_providers_cpc.md         | 104 ++----------------
 .../reference/dtrace_providers_dtrace.md      | 104 ++----------------
 .../reference/dtrace_providers_fbt.md         | 104 ++----------------
 .../reference/dtrace_providers_io.md          | 104 ++----------------
 .../reference/dtrace_providers_lockstat.md    | 104 ++----------------
 .../reference/dtrace_providers_pid.md         | 104 ++----------------
 .../reference/dtrace_providers_proc.md        | 104 ++----------------
 .../reference/dtrace_providers_profile.md     | 104 ++----------------
 .../reference/dtrace_providers_rawtp.md       | 104 ++----------------
 .../reference/dtrace_providers_sched.md       | 104 ++----------------
 .../reference/dtrace_providers_sdt.md         | 104 ++----------------
 .../reference/dtrace_providers_syscall.md     | 104 ++----------------
 12 files changed, 84 insertions(+), 1164 deletions(-)

diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
index 5128d8e8b..39b2ca6f5 100644
--- a/doc/userguide/reference/dtrace_providers_cpc.md
+++ b/doc/userguide/reference/dtrace_providers_cpc.md
@@ -60,100 +60,10 @@ cpc:::cycles-all-50000000
 
 The `cpc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-CPU
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | CPU              |
+| Arguments | Evolving       | Evolving       | Common           |
diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
index 1680c2a72..ef62c5040 100644
--- a/doc/userguide/reference/dtrace_providers_dtrace.md
+++ b/doc/userguide/reference/dtrace_providers_dtrace.md
@@ -315,100 +315,10 @@ If the actions that are taken in the `ERROR` probe cause an error, that error is
 
 The `dtrace` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Stable
-
-</td><td>
-
-Stable
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Stable
-
-</td><td>
-
-Stable
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Stable
-
-</td><td>
-
-Stable
-
-</td><td>
-
-Common
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Stable         | Stable         | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Stable         | Stable         | Common           |
+| Arguments | Stable         | Stable         | Common           |
diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
index 727614434..885d59230 100644
--- a/doc/userguide/reference/dtrace_providers_fbt.md
+++ b/doc/userguide/reference/dtrace_providers_fbt.md
@@ -78,100 +78,10 @@ The output shows the internal kernel functions that are making calls to the `kme
 
 The `fbt` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | ISA              |
+| Name      | Evolving       | Evolving       | Common           |
+| Arguments | Private        | Private        | ISA              |
diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
index ff1d12887..a458ab284 100644
--- a/doc/userguide/reference/dtrace_providers_io.md
+++ b/doc/userguide/reference/dtrace_providers_io.md
@@ -521,100 +521,10 @@ The previous output shows that the USB drive \(`sdc1`\) is clearly the limiting
 
 The `io` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
index 1cf06a5db..98affd838 100644
--- a/doc/userguide/reference/dtrace_providers_lockstat.md
+++ b/doc/userguide/reference/dtrace_providers_lockstat.md
@@ -275,100 +275,10 @@ It might be surprising that so many locks are acquired with the `date` command.
 
 The `lockstat` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
diff --git a/doc/userguide/reference/dtrace_providers_pid.md b/doc/userguide/reference/dtrace_providers_pid.md
index e403d6c94..c0c7bbb9a 100644
--- a/doc/userguide/reference/dtrace_providers_pid.md
+++ b/doc/userguide/reference/dtrace_providers_pid.md
@@ -177,100 +177,10 @@ We probe on the chosen instruction, using both a relative offset `foo:4`, and an
 
 The `pid` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Private        | Private        | Unknown          |
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index 24b18fc78..40903775d 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -695,100 +695,10 @@ Running this script results in output similar to the following:
 
 The `proc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
index 2fcc13213..bcc8c64d2 100644
--- a/doc/userguide/reference/dtrace_providers_profile.md
+++ b/doc/userguide/reference/dtrace_providers_profile.md
@@ -156,100 +156,10 @@ A time interval that's too short causes the machine to continuously field time-b
 
 The `profile` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Unstable
-
-</td><td>
-
-Unstable
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Unstable       | Unstable       | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | Common           |
+| Arguments | Evolving       | Evolving       | Common           |
diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
index 39f4f00f5..d85dd45a8 100644
--- a/doc/userguide/reference/dtrace_providers_rawtp.md
+++ b/doc/userguide/reference/dtrace_providers_rawtp.md
@@ -21,100 +21,10 @@ sudo dtrace -lvP rawtp
 
 The `rawtp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Private        | Private        | ISA              |
+| Arguments | Private        | Private        | ISA              |
diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index d4cd546ce..68bcdf715 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -814,100 +814,10 @@ The output histogram named `tick` shows that the clock tick is firing at a 1 mil
 
 The `sched` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Evolving       | Evolving       | ISA              |
+| Arguments | Evolving       | Evolving       | ISA              |
diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
index 212d3f886..442911fc7 100644
--- a/doc/userguide/reference/dtrace_providers_sdt.md
+++ b/doc/userguide/reference/dtrace_providers_sdt.md
@@ -42,100 +42,10 @@ The arguments for each `sdt` probe are the arguments that are specified in the k
 
 The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-ISA
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | ISA              |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | Unknown          |
+| Name      | Private        | Private        | ISA              |
+| Arguments | Private        | Private        | ISA              |
diff --git a/doc/userguide/reference/dtrace_providers_syscall.md b/doc/userguide/reference/dtrace_providers_syscall.md
index 3eaac4897..880b7de69 100644
--- a/doc/userguide/reference/dtrace_providers_syscall.md
+++ b/doc/userguide/reference/dtrace_providers_syscall.md
@@ -21,100 +21,10 @@ For `entry` probes, the arguments, `arg0` ... `arg*n*`, are arguments to the sys
 
 The `syscall` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
-<table><thead><tr><th>
-
-Element
-
-</th><th>
-
-Name Stability
-
-</th><th>
-
-Data Stability
-
-</th><th>
-
-Dependency Class
-
-</th></tr></thead><tbody><tr><td>
-
-Provider
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Module
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Unknown
-
-</td></tr><tr><td>
-
-Function
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-Instruction set architecture \(ISA\)
-
-</td></tr><tr><td>
-
-Name
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Evolving
-
-</td><td>
-
-Common
-
-</td></tr><tr><td>
-
-Arguments
-
-</td><td>
-
-Private
-
-</td><td>
-
-Private
-
-</td><td>
-
-ISA
-
-</td></tr><tbody></table>
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | ISA              |
+| Name      | Evolving       | Evolving       | Common           |
+| Arguments | Private        | Private        | ISA              |
-- 
2.47.3

