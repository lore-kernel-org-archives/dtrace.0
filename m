Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983CB1DE887
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764541; cv=fail; b=IDCPCHVcc08kijhKbJbJYg0s0P3y/64kU4N4GTXTjy4M276ade6DTWieJjJoqBTQASjD/ITcYUJa/GOyHjiItT2ZAfOm10weC/2YAob/Y8zCsb5N/+3JDT+7rCgmjXQBIRTG+nWcRdCHbPx+Doomk51XxYFYnqUlp+4swzpOYNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764541; c=relaxed/simple;
	bh=YBnKIdN28ujqILzZIWHcuQIeAjp8pW2Q9tmjP+yoXhk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XvBH0EJP1E05rqylfYo/SYlN9rQNyLdPG0MuBEKtd6QdJq8iF7XtmUIwr3Nst76rrhIISAJgTldTR8MSbYnlDKW4OtJ1ew48azXwjG+i63sTH3EOf/2J99gN9rIs/OsuP/hHQ1jCDvDKbDKNBpLUOhpakWJsKLDMjynizQkx6Lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jDXuj7kw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gyBEAFZT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jDXuj7kw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gyBEAFZT"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FEnFC024946
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=9ggzHjd/G+QC5OxpH8sVG4FrOEEZWGAjwU+u/gYE8bk=; b=
	jDXuj7kwP8ZhmWwnUOQvk2EmRFiRVTlkO+x2BdjQQlCtKvJy6F4wisKnUWXnsB06
	T29uP2ebtV++UwzdXU/DuCD6lXBwR9vJmUhce1f+HhJn35npmSXswRiG0uf2LnJU
	eMD0C36gLJ91Oy/dpSSjrUfqCSNzUy3uhQqGldyIKTgl7vhHtX8QrEolnThP9sg1
	UnjGOQ/WQFWwSCaeM+fGe3+qgTGAeGfx7v1phWsu2j60fLrSC0BHS80Fm/VQVSvB
	iMdhYRSPZnn+pcxQpCNVzxW3gIFiOkyGZC1aZZMFhrIdCg1GIrpqePstZ2Wou83k
	YqmyOEgMcGouCIKLsYJQcg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mg80012y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596FHHqF034923
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:58 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49jt170jw5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGKSCwaSDIBxwPCUlMNEfT7wGJTNlavSvraIMHKUldGp0J6E5j7tmdiSnEgYJGmbZCMnuWm8HQpfhVy8mPQ4BuKWw4lIBJj66Hws2cHRZnaIXzoiqNINrlw74x6UD7aRma9KhOJBLW4yGDpjb0MpTRPOu25bKfMxkvO+qFBnUDbM7FPAh0a6hmG9ZYfyUmQLsit+Rvk/8974HKs7zNKW+R6YudDVhEWqVtY1nrPWCaK0NQc74y+iri8OR2LeJfZ75+OXLvbH326WT0u3SmwTGndDFsBTwShOWnYc3by+S3i5H0K8BuI9haREbHG8d6YCocd8ODIOES07LuigzxwoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ggzHjd/G+QC5OxpH8sVG4FrOEEZWGAjwU+u/gYE8bk=;
 b=LhyKM2e+1A2FUpvwAnGi42HISMwcpRYUhH8SQlZTG+cFH777lToHETMJiy42iKYwQrSiDlnSBGPqfqpHGFDKX6T/g2ze8IjO8ybnFUbhhyF0DeHmof9O8jDaRhVhk1CtPjZjdvGjIuce3UR2dpp3QHWSzJz6z5UgJW+wXA73wUebUDq5tDQ/qDe2eFsk/0i0r8boktG9i6SGYnsEfz5CaA+0+3CyEKiUDPCyPKQbX82RP/e92N7LM05Z4WmQkZyO0y3c+ftErbBv6mKNuuni0qmFiQE61hMCDe5lEnrdJouKUzYxkz9QCXLVyiFg9cQgcHzn1t4DOgO+VVyfqRks1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ggzHjd/G+QC5OxpH8sVG4FrOEEZWGAjwU+u/gYE8bk=;
 b=gyBEAFZTft+WK9yW0U4U8ZaadsBWhEGVfTKHZbS+58/WK2Ve5kTxXCzRiJDYThRK8WEa5CFt11FeDCQIDzzX6qmZNdZWI9v/+ObV68DpJz3H5FwJNxZDGHshoG3AbWBzrtPC0wG9W3D1qcwgXW5lq4/Ekq6kb25QENKsBxZFKN4=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA4PR10MB8253.namprd10.prod.outlook.com
 (2603:10b6:208:561::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 6 Oct
 2025 15:28:50 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 15:28:50 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 5/5] test: dupstruct: fix extra duplicate identifier case
Date: Mon,  6 Oct 2025 16:28:28 +0100
Message-ID: <20251006152829.239100-5-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
In-Reply-To: <20251006152829.239100-1-nick.alcock@oracle.com>
References: <20251006152829.239100-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0046.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::20) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA4PR10MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: ee80e9c2-235e-4f79-c079-08de04ed0ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A6CYiN+H/XE08/rylQ255FtKJIyjGTVJQmcgvSGYpwfm0BOMSsItuAMipROM?=
 =?us-ascii?Q?Zebf4zls9Jy2PqkaFNEJSEiNtiph1WPMzMQ2+dRiSoYVAskmV6fcmFW9QnjT?=
 =?us-ascii?Q?jVIXkDD21CRwX8bvb+x79W420VLhv9sk0FVnxn2uQlA3OOcWHg4CYuR0x8aW?=
 =?us-ascii?Q?4piZ/Z9JPmnHXOGcudDrwQvMn1tHiJkFH4xNe00zL7Cg51ksn2s0kdHGWW1K?=
 =?us-ascii?Q?3EdgQGQ01RTnIaN7cDEAwsKStLemUU+bKUxuIeWlfi+YjWRCc6/q685siILt?=
 =?us-ascii?Q?/kmhb+M7UQ95t+u0TcuCK+r+gfDJO5dww1HdM+4Ppg9+iqrr8hRm9hgLHXb6?=
 =?us-ascii?Q?MX2U9A7TJIraaXPYXm+FwLmPxFouZcb1R5MAb5RRkv6/9O6j42NkV9t1hsT9?=
 =?us-ascii?Q?ZZl+UblrMwTYTVsmcff2r1YTeEGi0aB6Tk33dYvlrTJS+vQDq8jsqUQr4coc?=
 =?us-ascii?Q?AE1m2TYSPpaQaqgyhg76TgScuy73Pabvlb7QqY1ro2vCIvGdnhwFJsgh+jz0?=
 =?us-ascii?Q?7a3c9pl096h/74YAN0J1S5OlB5FZJe6e47tYRrCA39WDwLhjFI6NdgFpbXEf?=
 =?us-ascii?Q?2AVEUfBrk91XIsPbuK6WoY7UDHgTuYONn8Eih932uHYt+tDPjUp+EFlPvnAj?=
 =?us-ascii?Q?8IOLA8y91luLFiIoZ7Fp77fRLysTAYQDGOyl3Q5kme6QaWiak8OByKyV8cL6?=
 =?us-ascii?Q?AbTlpschknqM5Hb6JYfTB6vzYTBCSZ39rkSl6l/PVcXCMdqSlGbU3KtJDied?=
 =?us-ascii?Q?GhKw7NfdL7JphLzK+IpIQFqEjQRb6xey6+D0ZwKwm6lpwk922LMZHjbGc6MH?=
 =?us-ascii?Q?Ju2cnXi4FIhM36rq72vdTlr31PL+YFnu0jO3XPsyFZlkk5RNp79e3so4dpIo?=
 =?us-ascii?Q?6WUwOW4j+Xg9NbcO3/DFCgi3OrcHipD/vHhwVxNVKgx1EGUggDd2JiXChCC9?=
 =?us-ascii?Q?SUgRdBg+0GhIS5r3Ek869ARG+AvIltu0Xf+5HQ7U5WVxAe4jiq3pt/0cgAAL?=
 =?us-ascii?Q?8WS35UODnxyGq1TRF3n5moIkesyBR3u6R4CnyZJt9Y2AuZIs3NilyuNR9n36?=
 =?us-ascii?Q?8kpk9XCjYZtvwjC3mCGWAJzCJ63FTepCZnDcpeme7Wn0UJqeKhVGenBweMbI?=
 =?us-ascii?Q?mdgKQw+Yf7exE5nRo+ryAa9qUJ3aj7Ej5LEnladWEs/liN31bP0NG7svlULk?=
 =?us-ascii?Q?q3kq5awE0ZOf+M7HZxPySzIeJ55OA/qOTxAVRLPMAY4ehOU0MgLFZVpnouvN?=
 =?us-ascii?Q?fklwNpMT8DzRqW6vTFomaq7kadQOtmZe/+odE17gEvuY5O2g96DEh/cDMmHH?=
 =?us-ascii?Q?ywQBhyJgRJUyAdiCOCnbBqqw7eavGfQNDVzKQBXTNU2Gf+Li35mnxUHvgMxE?=
 =?us-ascii?Q?zQzIXqqiHVRLPtLblvTSk9J4hjKMFYuj2fV3gnktWyUHVaW1DxAJknix/Wd3?=
 =?us-ascii?Q?mbO7sBovtKVy0Wy3A6QTiDBvLa3/1eezob6YADMhLen+FYehOJv5kg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2TCytTUU481yADu6riXFNPsZal9u/rACLYjnjnddhJVSCWkRzCMq1fFzrYUd?=
 =?us-ascii?Q?Cr6ZbNBo+bVYRUMxbUgkdKcmjvoOdZDlCEVK4rTOfY6yqY9wBRsndiVPWn/h?=
 =?us-ascii?Q?zvGOhvFs3lpO1LVt9fpksnyVjZx7xGmC+pxUrOC8rBZnxY+7D+5ROmqBOd4Z?=
 =?us-ascii?Q?eDlPnFi3NVNRAFtCrGhRalQ2xRKJTis41Bok+ycWnWtR8kvJYDrssNDDLDYz?=
 =?us-ascii?Q?zRcVk8Df1MjB8/P4wnjUY7yfHDB0rcOzVKgFX/cLv3pnyUWFGgHCLOrWc9tN?=
 =?us-ascii?Q?I9jyAYPUifnerB8JfBd33d5dkCvcl9l/EYqf70EDWit+sB/yXyJbiM6if5K7?=
 =?us-ascii?Q?tJLr4q2P63Z4dxQczU/EwDG812EezPNu3HyTXLpH8qInfVMRSH9vnCJev1Mi?=
 =?us-ascii?Q?KJWsD9y4MVZP7/3coTjJ/zxurA8UCpeh3oeaT5aHjkcArQRDWSQGAjy/ukAs?=
 =?us-ascii?Q?o54FniSOzMJysDcXNVbaslNMPM3XtUfo7BoZqmIpyofzmy11gnRftULLUTwh?=
 =?us-ascii?Q?ywV9jthZ6wRr70a0ticIX+w4WfLfvNwfqajJDCjeyezNHfqaebSZZvOXLriC?=
 =?us-ascii?Q?ZeP0cX0aQrmxHbcUspwcETGyjtATwnqrDe3SST7uwLd/KLTtgUwwj/eqhbhD?=
 =?us-ascii?Q?3cn40jhnIGID6zRUX3z5FEMYArH03G4YmxBX9TCcQ3bNe0xw37E3yrA8JdcQ?=
 =?us-ascii?Q?cUS6pYdsLs1wjjQE7cMkuSBgtYZq2gaCsrvPZatkLeCw2lqTGCice6kuORMJ?=
 =?us-ascii?Q?9uxTozvPK4/4zpZJEf+YrtkooII9HWhHNK+Ku24/myEPWIWyKrP11fOgpMgM?=
 =?us-ascii?Q?aEfCkKHXO56ie4nGGMTYcitv+Of8tKSrob1S62GKS5ZqkbjRdiYrsSwegK5t?=
 =?us-ascii?Q?Rwahz3XpJpuZlEodRMOfyZSXtqL9UVrMGNWyznacqnHM2m5bEZGszK2CTcB1?=
 =?us-ascii?Q?yhcj5d+emIsquFa94LG5qVAtu67ncydeBb1xYXQqp665z+viatFK9pLiNuif?=
 =?us-ascii?Q?K3sjE1SitAglW/AUHiXL6wEtvcsMRz/5TiM/neZx7IC7i4hhulU2+LEEO6s+?=
 =?us-ascii?Q?79CU1KAnoTQG7o/788VY65srUYlAqyQzkGJ8+MJeR3zACRe7sVMOVtthYjBT?=
 =?us-ascii?Q?iAlWcurD821oLOBaVHxMgIT81nUqahgNn2ev+KlADY3ZSxO1JuDijM596Vpl?=
 =?us-ascii?Q?PLk7R5wJEonNANhx9HJ0R0QfPrNSC9kRGB87AlFnSG0ct7+cpm2x43dAkcDU?=
 =?us-ascii?Q?v7S+n8cPum6Ggnj3w19PBUbkJW27+qMpmPWTaQUAS+9O3cLMQF/GjRHj2BWD?=
 =?us-ascii?Q?yVNzM1t6bWK5SMfqovy0D38nuGTS0ocSstmwzeb7as2No7tNliGBoTzgVCoQ?=
 =?us-ascii?Q?LknOfA4/fk4c11IiVwxd/RatEmZ2LF8CDNkoFqh5+7A8fuHYMK5TRXCzrwuU?=
 =?us-ascii?Q?8iO6ZZ/yBYagniHLO5Coe5OM/VEZ9Y0xqp0zIdXA23A5N5d/qIdsBrCw7XKn?=
 =?us-ascii?Q?6q1bIF0YQ+IiviK9kRL2FXpDwLVIpWOlK0194xx6DaDQ03JN4g+WgLEi3h1q?=
 =?us-ascii?Q?EaMsm7Sd4ao5gaoKRQtRgHVU5amThbYzm/yX/cr2VDw5jiCOQkytyhGPpfVq?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VCAC7447pHT5OrV5fAfy23ykrmYWgKkzxQ3/CDugwd3Led8HIUnp/GSNso59024kXg8rpp8pIHDZ4QnYz7OEMM1GxkZjH9HAjf7rF5sDbh/E1b4QNZgTMYZAgpgin795MJ1V45QKyS/cOCqWRN4jy/z3diPkJAQWmKVqJaS8dDKchdsR8P46p2atzIv9bYJYl67VWMJG1p+kWYZ6efLzVX01bNAURYbP/bgEaI0ra+yDoVazbv9078ga9OTdO5LCjfDhIcj7kTzFDbwdVQjTli1utekwFcAVsRPUID7rOVuwz2XsQRN1MRsm4E7FMSrwHNQTOs3jss+ErJ6GH9nhEwdC9JF1TV2UmhXg1x2lx/wEDLwKj7fHwpJmqMHa7yU3v3C4vnfmO0zrGiEOIZPGvChQZtvCcWavrmbLjr4VjRuuYWTrZzPxP+/yBSdsUUK7Rwj15PWKoRz8SPtYgJSv/7XbQM7HBTjUjzy0xFeQJOBVdZDGQvGt4zqFac30rNu/78TxaSFP88Are+cgec8OBJ1+hudd/74/mRuDgiZgP7p188hLwP4i74wtHdBb7mEkk8f0EHML1NKDJkpfDxuN9/3du6G51I/n24rluHyqpgw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee80e9c2-235e-4f79-c079-08de04ed0ca0
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:28:50.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmUevoqwlijgTBrZBtlPtyPTNtrvlChXTDcMJ0BvyUL62ALb2M24JNhNFRzw55JlBiC91NLKN/EzIV9kZ2pEuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510060124
X-Proofpoint-GUID: t2rcOaRr5cCYu9dy1eGTQj2xWyYuBXQW
X-Proofpoint-ORIG-GUID: t2rcOaRr5cCYu9dy1eGTQj2xWyYuBXQW
X-Authority-Analysis: v=2.4 cv=HLvO14tv c=1 sm=1 tr=0 ts=68e3e03a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=2OyXNydD7y_s-TsZ39kA:9 cc=ntf
 awl=host:12091
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMiBTYWx0ZWRfX5SStKXsapLMG
 dHu2Ifqbp0j2qZLMkwv6o2Uqi8wZwt/UDNdy/bsWDb5noZjgyEA0S3jfVN+xgKjTGLyo28NVwvL
 kvfbrQi5D32S6d4U0c07hG++W15+7hTJQ4JTe4eKAS7Y+NUzD9H1QLfKBHfIeSoXal24NhRF57L
 vEcjkUALGN0Y2lePJXFRRi8Su8F8/yoqI+tCVjrtDE27AGIke4rtV++h8/M4C5RbQaXR2t6pnsE
 eCI9SjmYpTzEFxvvI1HHPsiHqdmFwZK65eW/wOrtw+pUmW5n57c3Dr9xdpzc55pz+sp8pLngDDe
 rew7+u8Bij18Tg9mkGeKZ1Mqnfs+TCcsJOSL6EsbgRa1o9ht7MMop6trZjxWkfXrmw3csZauNzu
 CsccdIjHTW6Zs/uDIMvtBMMrYd+Dzsjo5fW0qi+r1xSE4fks9ug=

We were failing to handle one case where duplicate members or variables
are now reported as duplicate members, enumerators, or variables.
(It was concealed inside an .r.p.)

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/types/err.D_UNKNOWN.dupstruct.r | 2 +-
 test/utils/libctf.r.p                         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/test/unittest/types/err.D_UNKNOWN.dupstruct.r b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
index 7afa74aa7f6d7..762b24f4c5901 100644
--- a/test/unittest/types/err.D_UNKNOWN.dupstruct.r
+++ b/test/unittest/types/err.D_UNKNOWN.dupstruct.r
@@ -1,2 +1,2 @@
 -- @@stderr --
-dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member or variable name
+dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupstruct.d: [D_UNKNOWN] line 17: failed to define member 'x': Duplicate member, enumerator, or variable name
diff --git a/test/utils/libctf.r.p b/test/utils/libctf.r.p
index a2b4602cf713b..774eda7f57e1f 100755
--- a/test/utils/libctf.r.p
+++ b/test/utils/libctf.r.p
@@ -1,7 +1,8 @@
 #!/usr/bin/gawk -f
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
-/Duplicate member or variable name\.$/ { sub(/\.$/, ""); }
+/Duplicate member or variable name/ { sub(/Duplicate member/, "&, enumerator,"); }
+/Duplicate member, enumerator, or variable name\.$/ { sub(/\.$/, ""); }
 /Member name not found\.$/ { sub(/\.$/, ""); }
 /enum union pirate:/ { sub(/enum union pirate/, "enum struct pirate"); }
 { print; }
-- 
2.51.0.284.g117bcb8de7

