Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1B4C6C
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755316026; cv=fail; b=DyBwxrGpujPBU2PbTLatrPgVsfYUWPX1YxpoCuuas4DPpYkPSjEB2nv5VZRCdI36xHcsMCu+s2DMvWQg/mnRNOj4osJJNM+CitOjXX4xNeEFRWBJvmcQV5ef0l+7V2NscNr1aFeq4Rl+Q+eaywjvz4H676MXquXSIE+/GEZQaG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755316026; c=relaxed/simple;
	bh=Acw3tmh+TYJ3RQLePiak7udS85XzjsxLMFfTUDeA130=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=pBrnF2P3jMVwkk585TY+pMaLywlD5xQ+i/7VQWajk27kIETD0XAFFFdKiN7ROfL1b52DiW2nvk2+4SQsedLimDwXvbFn1KtT/EtV6bbkNBTD58sTspdjUiy45BZKhLA0pgaf9pYSD5XXoVCJWAq2+jxQvlzL0piSofK21GRdfp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rmqKKQ/X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vsGh/E3g; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rmqKKQ/X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vsGh/E3g"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G3gVvc024864
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=LaDYilkwj7qAGGSBWiJoMf2vz3v99OIp40cAygPkt7Y=; b=
	rmqKKQ/XSTFAPaSmie7enmbSUGEEOX0RE1P6dDoLCQw0KrP6ahwCPVFetM31HBUF
	8RkzZHP/Wz0tiwGeAH6n4qtqbbilQuxKazyQxLo7d7ZTVEMUiqvjvpBLF8lQL0ag
	qjVJYOh/gfv8xsncTLJ/hAzgPuUqSu7L8OVDVkjZmPWGU9eFHOOrNSxQ3SxxOGj/
	Erx8wvwhS5DVvMBtKBQy9RMHKulOVj50XvSp3cnMm1I9ggtKD65Dl9ee+dZv/7yJ
	G9GKE7D0IjWhWOrk4eqMPxaJ8OXUzrtNlXfxT6y50/BgVgoIKvHI1tZYi1pnPNTN
	BSe8Q5cl7vCHAHgq14mQgA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48jgdfg2vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:47:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57G1XgPw023586
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:47:02 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48jge6tqp8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 16 Aug 2025 03:47:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4Ss5soBPK/UyKtBz1TEcTwq1SDUgVpUMnr2AAQQlvG9gxzVIJwKDAsFeE1izuCKP2P+ZeSTQmxazseCGphIJpe9J321gebRo/PCyNcYfNMeYsLvhw1BtejLjqjblX0lWErTthS5IHrlV7ZBVtD8rXxX76bFqVC7jMEW+GXsq0xRy8yO3U7HvNJ+RaZj/s/kiGrldTUOBPjCkogcBq/O0usSL4zzoGtdchAtcRcsG98SnzeKD99vKg3OFGmND/6roJ4Sg5PA3kvX4FBFrb1Ko5s3pRzRUUV19pRIXjy/AGSUzLEHD2/M9M+D0JlcIwzL9xs0Yaq/OHmF2CI4vqHghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LaDYilkwj7qAGGSBWiJoMf2vz3v99OIp40cAygPkt7Y=;
 b=UufN0VFMV9VtQ5fL/dFG3T4miXm8RIluIhlhxfFxQ6bANaEp3tV2wVdupJ8vNns9d0IppwhDCAPR7/SrpsWbyTq66+ZuHHgFn8t+NEEJ4zEWmsaNq7WetittUST+qkWiaRYLwdn9nhjg4Yt6tQWC1KThoMgeHF3WVB/6QFIgu5yKtOYHHGbUe7j+rUfZ+A2zEkX+3IyyIeun4CpzTI1OW6QY3n1WvvDq+MniLaNJCM46MkZxDm/qlKLknQxZgqgaaO4b+pmZNCsgk4VVdN99FEaQhqP2XFG4aMS0AZV+KogZlFIi570IDkoG45NUbLBGvdOa1+/PGfu7I/phX1Ihxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LaDYilkwj7qAGGSBWiJoMf2vz3v99OIp40cAygPkt7Y=;
 b=vsGh/E3gVBHWEfnbrUtWrsGFQCCn80LiMEikwa0O027/1LvAOksYVK+SPPbYenoybFqIGkKmLb4FJe5kqLzUEKC3u09+zxZzLPCT07spzkXmgbvrSxpQ9t9sZ3Xkv9EzkK43nAtVI4H8XkcpztkAfw8rId27q2EGPJmW+M23eDw=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SJ0PR10MB5892.namprd10.prod.outlook.com (2603:10b6:a03:422::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Sat, 16 Aug
 2025 03:46:59 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9031.014; Sat, 16 Aug 2025
 03:46:59 +0000
Date: Fri, 15 Aug 2025 23:46:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Refactor the versioning handling system (consolidate
 data)
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672EB3042EB4FF38F34FFD6C237A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SJ0PR10MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f5aa3a9-714a-4595-717c-08dddc778dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NMUHyLDWauBha8+wDKZnkYF3qXm8UxSMPqzRhN3E2dxWvMs+gt7Q7j2X6R0E?=
 =?us-ascii?Q?4ZLzr0GOFp1dkZjPSNqtTmj5f4oMiR/JQJE8whH/PNZXvmampYDfJar+4ztr?=
 =?us-ascii?Q?S5/cV6gcvQ/gfkSdlNVv9O0VgVoCcyd3hJh+bv0+64VjEOVHB6OEQ+91Qb21?=
 =?us-ascii?Q?VXKiGTgKaHCxMrxwBkwZiGbt2ALCTgtOCuqgynR2iR7dv+piMM23OKJa7Em8?=
 =?us-ascii?Q?bqlcDLUnj87zaFnByVEUoFqo5IIK2lkL7+9k7t0WgFDMuGSgxr0JvSUFO99D?=
 =?us-ascii?Q?/yMo/lfhUYqZD8K9yGa+xcxHLIh4a37fxCZfHQ4XwDM3P3+x+f85CXMWuM6C?=
 =?us-ascii?Q?SV9ZNGSjQjCzoVJDZHYM7XA+t/F2JmnJDpYkmJ3XQ0NMhYQddHDGNHRECwh+?=
 =?us-ascii?Q?8RSUY80obHXTSjaMEk7/lhuU0jzlKorGkCN0onpZQTX+kycS85RRgmxo70lq?=
 =?us-ascii?Q?ePfmOGfy02njM4Gdq0R1xEdO08Qt7CiOM6z9vZbNovv4wrSRT0cy74KEQq5M?=
 =?us-ascii?Q?EpzNKnBsSUy9ehnprLsFYr0qcsRQZQUhpY1k0N6LxhhMfIz0tpj/kwtaWJKo?=
 =?us-ascii?Q?Vg284654/WF1L4wc1n1wM/x5/IHEOh1FEd24KENos11u5VjO93fiX4GUTL/s?=
 =?us-ascii?Q?x8K2uHIMVVxLsdLuR0s27JpAFMRLk35E5H5Z7jJiSScLpGU1QZvbqcJbcXGw?=
 =?us-ascii?Q?G6HArOYiGhyDschhTSkGkuZPTZ+/qh4CzpP52tSTeIYFxQtarK0WqB/vcG+f?=
 =?us-ascii?Q?ytgWCk8ihc4+sK8O6c8H0PEDdgxu6QRG8lZHIrxlFNbV10hUGX7YD26CLKYv?=
 =?us-ascii?Q?scaOnMUClak+7KMt5cuMzYWxTfzE7SYZ/N1OBdE2vK0NFCjKXocxi4lwrDdg?=
 =?us-ascii?Q?rb15KRncedqlovD5HUko7S7/YoJbbYAbIWlDwAT69GYS+DqxERPE+xxYVLM4?=
 =?us-ascii?Q?qV22uzyaTcr7Xlh/s45rV31d+VqKCgPSBhUkeaOH80nVAakmXrg+Fs0qpz5A?=
 =?us-ascii?Q?1LMYX2NxvkC/Y5WroXp6NKaWxphF8Cu464qEfqKgMCR7nNjTh1/iRG7Jzy1r?=
 =?us-ascii?Q?/wDpyN7WlITq72x4ga9k6aRwLBhzaWpefbYV5c1E54dQuxXxxgz5tzq3Ak4/?=
 =?us-ascii?Q?Etd5NxhdED5qTMQLS2LLJakMYUlgDFNx5fMQJBWxG/A/SxNyMJxtB+l7XHQm?=
 =?us-ascii?Q?vZYNlEnCPWA7TgXx0hktSAwhnuwEsNXeTB6WAXmC+7TeGCkcQ0KVdSPp3OJl?=
 =?us-ascii?Q?QXUa8SFNmldnQsT19KQOacCHqAHnxwp8bX/ATE7G//KMcN9Lyvaw0CrizjKh?=
 =?us-ascii?Q?YOZxQQt/xFEO9S9URfeViMwrc5sdBN3+VOc4GSr2IKoTMRp7S3TGxuJAoJXW?=
 =?us-ascii?Q?n8VhmyfkRsQpShx49Pf6iTVJGOhVvcJhZwL4vZYd+JHkO0Tny+AVoEbk54HN?=
 =?us-ascii?Q?ayez6CMkoLY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iDkFbYBnLBq54ImHxkvvY7v2Qw0Czz6cEmRkA4Vz5ffCy2Pk+5lSgBeReatd?=
 =?us-ascii?Q?rY1ff20IdZJXkG6vKfORQHswlAdtVJ5/9KPTly7H8GSPdXvyXSZJFjfU1peA?=
 =?us-ascii?Q?7gnGI5BQDYy6iOadH/l4OmOVT4aWLZURZwTDfo1HbGsA6M1bU63ASbipVlFr?=
 =?us-ascii?Q?u5emNOHddk8J81lj1J+p08/ZiKZ7YBneji1Zu700BhKFfXc92GH7o7TCwdqU?=
 =?us-ascii?Q?i7VrEWg+pWOwmcTPm7umZTb6rz4TGk9h/8dQt4mjQRpQWUNcMBt6gGhxgEny?=
 =?us-ascii?Q?QCMNZ9no1X1zLb2JSMjOiLeLT8itXKz8jn2h1gShPXu5bSrPOpim5yhMFRKH?=
 =?us-ascii?Q?FU1E127ZGLqWLAS9gwDFOizNQK1EL+e1DHXIS7suvaIjtUd9OdqIlvQWE82K?=
 =?us-ascii?Q?gYONwp3+YsqO4FIaazQClwVmeBUTLwILO5fp2g8HOEOtpJpp5s0B7TBhX4RV?=
 =?us-ascii?Q?Z2zaarEipVV0zrAi0xt0CQegRi3J//FouZvYfp5ntdU7bPcIB4oNTs7VBDhe?=
 =?us-ascii?Q?jYeQpH7s7f/f8c/QjqqvYaeoa0+uwtMpNpIaoVvVdbHYYBfKyGqr6rz1RiKk?=
 =?us-ascii?Q?gAqCme9vk2/PJXREg/IKX12Rp0Ao0BqvtXpz6UlIubxmu37h1cS/kPi2l+qw?=
 =?us-ascii?Q?qH/PyVc2X8hFkJf9mSF130p4M5f8fIbTqsBYqRXjjHuvxFqsoo/0u9XXD+jl?=
 =?us-ascii?Q?B0d40eIXP526P4VGsKtBO1h6NEVP1xD1kDzGhvz6FwmVHy/aH8S1XQVJlbBz?=
 =?us-ascii?Q?yDhJZju9nioZ1HpGoUh6xmIDjzKazRx02pztbnW63ECfKXvz0X0N/F/S9Eol?=
 =?us-ascii?Q?IOnpPbjiAESHg2b48Q7GcX5roSGkzId46VGyCo6qajquQqldeH19i7lRb9yU?=
 =?us-ascii?Q?LgUBH3Lsq6FgJnR0w9vj0dIVV+wELdkx67JImIKbSRNGIQT8xWLFykFj37A3?=
 =?us-ascii?Q?iwl0FUtwljIZCrf/MXd4kwGAbbkWYOaIvqcA7IWh4dV+l1txfhmbLhHhJjZa?=
 =?us-ascii?Q?qi5x79EYnSOocqMXL59wNyeFfH+avsdZuZMH7mESWmWkID6HHstnqnuoYAlz?=
 =?us-ascii?Q?OElKFsxx2jied7c9SoO1DRmwqt3dWcZ7p09stTebCOdG8O/MHvKgYAFvr4qu?=
 =?us-ascii?Q?i/KT6i7pSNSCxKvekKfWWPS5KtbVEO1mEhiiGg1snsrTj9T6obUWiujXe2J6?=
 =?us-ascii?Q?0ZwSNBeQyIou3iURYXq/FOGUTAhwyPzKYbsd3tj4MwKEdMxeu39dngFORFyP?=
 =?us-ascii?Q?x94XjMKjppS+62xM/fPGAUvnQx3C2Ghp/gmLh4fl8Bv6QJ65qfsK3cR55LWY?=
 =?us-ascii?Q?gPH7ovVX+yZJctqf9PtaLyWjvafNmDU+Tx0DaCHppiXy1b3TlXluqmHNaqRK?=
 =?us-ascii?Q?KEJY+WMXXPuO1W7h48ne/4hOOMDqvuEopdCWzN4DehiVUwPvcgXURmotuctP?=
 =?us-ascii?Q?vrlC7gfR0JujcfC9wbtOkvd1OK+7sYUEW9a1Z2hoXlkQ+JJXHmYPXWEO+QRM?=
 =?us-ascii?Q?3WgmYpJ4+I7h6dNm4YpLqQIwNbiaXIJU+7iuaLhFauqCrugn4kRfiMhgFdEX?=
 =?us-ascii?Q?c4Y6FuWyXlfMu9PKQMKrt/Vm8FGV57hocBjnbWgIEXN+T9inevUDryECdTRl?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CRtwtin8LHmFZ+a9mYJW9LtOoq6zimzK4SQRbAL9Au8n6H2XS0ERV/AnWw5j3hH+f8qZnfIaUNYd0mjWUp4FsuBDFStf/DUFqVs3C2P5Z2wqRR3SlHTiO61cYXQ6cVx1XuLcBAtVI7LUEm19qgUStjDCVYVV1MKeuJN8MarwCXrd4fZd3Uikdz7iO3eKo9cUV2XTIgi6Yt/V9EHPcw0GdlF2NsEQWP0/qQNWUKageVMASphyGO9+tkNfXe5YPOT1TGRtgMTrbKAqhujFU9xbbvxN/ht0DYpX+VCnYGQVmbctCbag1uaVhmDM3kASVqiaZu8kcJmXlKhrTZwtUJJcMTTfZyBIYeTUktPuec3NSEsnxTTO/tc5oLJKnUzs9Kj8o/IrEc+N77Eu1MabGsFv3neJC0zxDkCySq4ACvM1wpjXoxFDt8dpWxU7cefL3FWadc49xBqOqgaMfiNWZPAJn9cyNRDf8myOsPYiIYy8nep2m6YQGHgh2q5cKKLTv37UiszvL8vbAmQL8p9M/l7CvfoKV816+VuZBwtydQOzjTS88BEPPH1sQ8bxUb7XYJsOEO4sZQOfQmn53jQd98NyvcXibvofF9H4DVGMg2BNH1I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5aa3a9-714a-4595-717c-08dddc778dc9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 03:46:59.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdEvMCPnysmB3y0fV1XyjnToSVxohiB8Atvb/EFKuF0aKD3wae9BX7/lgpwPBbrRD2I1eq9rNL3tBGQn5tWB5ZTgjvTjyUDVu8x26FY2tO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5892
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508160034
X-Proofpoint-ORIG-GUID: bmByinNW_rM77hCzaZ820OTE29mb_3f3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzNCBTYWx0ZWRfX5dNJQC8ZvVHs
 kt+SeZY+azEkFFG2s+rkr8nceMlrBgMo5azsbbcMx02J+BmxuiRQyJFM2yuqZQqjeARTZa24JtD
 cDl2LT3kGuIvpr1+QOVIBmYuy8sHmNPCfDpAi0CaHbfSt25aTr8Syo5et1U32zXvTssg6wg3KgX
 QkeNw30DChlvemx6hWKfuOTIBMxdsgzI6E5mKcB/JtJwDpFp7M+QvJRIqj88upq3kCQiG7W7LGO
 PMzmEe6KG7Nh96FsVQwUGpCp9GW3Ohe544vCncew0jAEJwc68Bv9oiWMGdBqkYVnsX1jObLA69q
 HEPTjFWM7pHgDTtuHeLI2htFs1NXXPxNRfyOdl4z+JzvxAzak82CcMqLYzWd5c8VUrzVirJ/gUE
 H2DLwwKB3dQjyza+mnnx5RGw1Okmm2ztBe0AjHDflJMQ69DsRSHNTmvW0K8PrOfVcoTUbiVq
X-Proofpoint-GUID: bmByinNW_rM77hCzaZ820OTE29mb_3f3
X-Authority-Analysis: v=2.4 cv=OK4n3TaB c=1 sm=1 tr=0 ts=689fff37 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=XVbX3NYY5uN5etjJgCUA:9

Rather than having multiple data items that need to be updated whenever
a new version is released, a single entry in versions.list will now be
all that is needed.  The mkvers script generated the necessary defines,
and is also used to return the most recent release version to be used
in GNUmakefile.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile             |  2 +-
 libdtrace/.gitignore    |  1 +
 libdtrace/Build         |  7 +++-
 libdtrace/dt_version.h  | 83 ++---------------------------------------
 libdtrace/mkvers        | 68 +++++++++++++++++++++++++++++++++
 libdtrace/versions.list | 67 +++++++++++++++++++++++++++++++++
 6 files changed, 147 insertions(+), 81 deletions(-)
 create mode 100755 libdtrace/mkvers
 create mode 100644 libdtrace/versions.list

diff --git a/GNUmakefile b/GNUmakefile
index 7ad857f88..03687bf3f 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -14,7 +14,7 @@
 SHELL = /bin/bash
 
 PROJECT := dtrace
-VERSION := 2.0.3
+VERSION := $(shell ./libdtrace/mkvers -vrelease=1 libdtrace/versions.list)
 
 # Verify supported hardware.
 
diff --git a/libdtrace/.gitignore b/libdtrace/.gitignore
index cf124ba1d..ebf6ac9b2 100644
--- a/libdtrace/.gitignore
+++ b/libdtrace/.gitignore
@@ -3,6 +3,7 @@ dt_errtags.c
 dt_grammar.[ch]
 dt_lex.c
 dt_names.c
+dt_versions_defs.h
 errno.d
 regs.d
 signal.d
diff --git a/libdtrace/Build b/libdtrace/Build
index 164023bbc..a3c3a2e1a 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -73,7 +73,8 @@ libdtrace-build_SOURCES = dt_aggregate.c \
 			  dt_work.c \
 			  dt_xlator.c
 
-libdtrace-build_SRCDEPS := dt_grammar.h $(objdir)/dt_git_version.h
+libdtrace-build_SRCDEPS := dt_grammar.h dt_versions_defs.h \
+			   $(objdir)/dt_git_version.h
 
 SHLIBS += libdtrace
 
@@ -129,6 +130,10 @@ SHORTKERNELS := $(foreach kernel,$(KERNELS),$(shell printf %s $(kernel) | sed -e
 $(libdtrace-build_DIR)dt_errtags.c: $(libdtrace-build_DIR)dt_errtags.h $(libdtrace-build_DIR)/mkerrtags.sh
 	sh $(libdtrace-build_DIR)mkerrtags.sh < $(libdtrace-build_DIR)dt_errtags.h | sed -e 's/\\n/\n/g' > $@
 
+$(libdtrace-build_DIR)dt_versions_defs.h: $(libdtrace-build_DIR)versions.list
+	$(call describe-target,MKVERS,$@)
+	$(libdtrace-build_DIR)mkvers $< > $@
+
 $(libdtrace-build_DIR)%.h $(libdtrace-build_DIR)%.c: $(libdtrace-build_DIR)%.y
 	$(call describe-target,YACC,$(libdtrace-build_DIR)$*.c)
 	bison -o $(libdtrace-build_DIR)$*.c -d $(libdtrace-build_DIR)$*.y
diff --git a/libdtrace/dt_version.h b/libdtrace/dt_version.h
index 8dd252b08..5c1528266 100644
--- a/libdtrace/dt_version.h
+++ b/libdtrace/dt_version.h
@@ -13,83 +13,7 @@ extern "C" {
 #endif
 
 #include <dt_ident.h>
-
-/*
- * Versioning definitions
- *
- * These #defines are used in identifier tables to fill in the version fields
- * associated with each identifier.  The DT_VERS_* macros declare the encoded
- * integer values of all versions used so far.  DT_VERS_LATEST must correspond
- * to the latest version value among all versions exported by the D compiler.
- * DT_VERS_STRING must be an ASCII string that contains DT_VERS_LATEST within
- * it along with any suffixes (e.g. Beta).
- *
- * Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
- * explanation of these DTrace features and their values.
- *
- * When adding a new version:
- *  - Add a new DT_VERS_* macro
- *  - Add the new DT_VERS_* macro at the end of the DTRACE_VERSIONS macro
- *  - Set DT_VERS_LATEST to the new DT_VERS_*
- *  - Update DT_VERS_STRING to reflect the new version
- *
- * NOTE: Although the DTrace versioning scheme supports the labeling and
- *       introduction of incompatible changes (e.g. dropping an interface in a
- *       major release), the libdtrace code does not currently support this.
- *       All versions are assumed to strictly inherit from one another.  If
- *       we ever need to provide divergent interfaces, this will need work.
- *
- * The version number should be increased for every customer visible release
- * of DTrace.
- *  - The major number should be incremented when a fundamental change has been
- *    made that would affect all consumers, and would reflect sweeping changes
- *    to DTrace or the D language.
- *  - The minor number should be incremented when a change is introduced that
- *    could break scripts that had previously worked; for example, adding a new
- *    built-in variable could break a script which was already using that
- *    identifier.
- *  - The micro number should be changed when introducing functionality changes
- *    or major bug fixes that do not affect backward compatibility -- this is
- *    merely to make capabilities easily determined from the version number.
- *    Minor bugs do not require any modification to the version number.
- */
-#define	DT_VERS_1_0	DT_VERSION_NUMBER(1, 0, 0)
-#define	DT_VERS_1_1	DT_VERSION_NUMBER(1, 1, 0)
-#define	DT_VERS_1_2	DT_VERSION_NUMBER(1, 2, 0)
-#define	DT_VERS_1_2_1	DT_VERSION_NUMBER(1, 2, 1)
-#define	DT_VERS_1_2_2	DT_VERSION_NUMBER(1, 2, 2)
-#define	DT_VERS_1_3	DT_VERSION_NUMBER(1, 3, 0)
-#define	DT_VERS_1_4	DT_VERSION_NUMBER(1, 4, 0)
-#define	DT_VERS_1_4_1	DT_VERSION_NUMBER(1, 4, 1)
-#define	DT_VERS_1_5	DT_VERSION_NUMBER(1, 5, 0)
-#define	DT_VERS_1_6	DT_VERSION_NUMBER(1, 6, 0)
-#define	DT_VERS_1_6_1	DT_VERSION_NUMBER(1, 6, 1)
-#define	DT_VERS_1_6_2	DT_VERSION_NUMBER(1, 6, 2)
-#define	DT_VERS_1_6_3	DT_VERSION_NUMBER(1, 6, 3)
-#define	DT_VERS_1_6_4	DT_VERSION_NUMBER(1, 6, 4)
-#define	DT_VERS_2_0	DT_VERSION_NUMBER(2, 0, 0)
-#define	DT_VERS_2_0_1	DT_VERSION_NUMBER(2, 0, 1)
-
-#define DTRACE_VERSIONS	{ \
-	DT_VERS_1_0,	/* D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS */ \
-	DT_VERS_1_1,	/* D API 1.1.0 Solaris Express 6/05 */ \
-	DT_VERS_1_2,	/* D API 1.2.0 Solaris 10 Update 1 */ \
-	DT_VERS_1_2_1,	/* D API 1.2.1 Solaris Express 4/06 */ \
-	DT_VERS_1_2_2,	/* D API 1.2.2 Solaris Express 6/06 */ \
-	DT_VERS_1_3,	/* D API 1.3 Solaris Express 10/06 */ \
-	DT_VERS_1_4,	/* D API 1.4 Solaris Express 2/07 */ \
-	DT_VERS_1_4_1,	/* D API 1.4.1 Solaris Express 4/07 */ \
-	DT_VERS_1_5,	/* D API 1.5 Solaris Express 7/07 */ \
-	DT_VERS_1_6,	/* D API 1.6 */ \
-	DT_VERS_1_6_1,	/* D API 1.6.1 */ \
-	DT_VERS_1_6_2,	/* D API 1.6.2 */ \
-	DT_VERS_1_6_3,	/* D API 1.6.3 */ \
-	DT_VERS_1_6_4,	/* D API 1.6.4 */ \
-	DT_VERS_2_0,	/* D API 2.0 */ \
-}
-
-#define	DT_VERS_LATEST	DT_VERS_2_0_1
-#define	DT_VERS_STRING	"Oracle D 2.0"
+#include "dt_versions_defs.h"
 
 /*
  * Interfaces for parsing and handling DTrace version strings.  Version binding
@@ -112,8 +36,9 @@ extern "C" {
 
 typedef uint32_t dt_version_t;
 
-extern const dt_version_t _dtrace_versions[];
-extern const char *const _dtrace_version;
+extern const dt_version_t	_dtrace_versions[];
+extern const char *const	_dtrace_version;
+extern const dt_version_t	_dtrace_vers_latest;
 
 extern char *dt_version_num2str(dt_version_t, char *, size_t);
 extern int dt_version_str2num(const char *, dt_version_t *);
diff --git a/libdtrace/mkvers b/libdtrace/mkvers
new file mode 100755
index 000000000..c45617773
--- /dev/null
+++ b/libdtrace/mkvers
@@ -0,0 +1,68 @@
+#!/usr/bin/gawk -f
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+/^\s*#/ { next; }
+NF == 0 { next; }
+
+# 1.2.1	D API 1.2.1 Solaris Express 4/06
+{
+	if (match($1, /^[1-9][0-9]*(\.[0-9]*){1,2}$/) == 0) {
+		print "E: Invalid version string: " $1 >"/dev/stderr";
+		exit 1
+	}
+
+	n = split($1, arr, /\./);
+	if (n == 2)
+		arr[3] = 0;
+
+	code = arr[1] * 0x1000000 + arr[2] * 0x1000 + arr[3];
+	versions[code] = arr[1] " " arr[2] " " arr[3];
+	next;
+}
+
+END {
+	n = asorti(versions, idx);
+
+	if (release) {
+		$0 = versions[idx[n]];
+		if ($3 == 0)
+			printf "%s.%s", $1, $2;
+		else
+			printf "%s.%s.%s", $1, $2, $3;
+
+		exit(0);
+	}
+
+	for (i = 1; i <= n; i++) {
+		$0 = versions[idx[i]];
+		if ($3 == 0)
+			printf "#define DT_VERS_%d_%d\tDT_VERSION_NUMBER(%d, %d, 0)\n",\
+			       $1, $2, $1, $2;
+		else
+			printf "#define DT_VERS_%d_%d_%d\tDT_VERSION_NUMBER(%d, %d, %d)\n",\
+			       $1, $2, $3, $1, $2, $3;
+	}
+
+	print "\n#define DTRACE_VERSIONS { \\";
+	for (i = 1; i <= n; i++) {
+		$0 = versions[idx[i]];
+		if ($3 == 0)
+			printf "\t\tDT_VERS_%d_%d, \\\n", $1, $2, $1, $2;
+		else
+			printf "\t\tDT_VERS_%d_%d_%d, \\\n", $1, $2, $3, $1, $2, $3;
+	}
+	print "}";
+
+	if ($3 == 0) {
+		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d\n", $1, $2;
+		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d\"\n", $1, $2;
+	} else {
+		printf "\n#define DT_VERS_LATEST\tDT_VERS_%d_%d_%d\n", $1, $2, $3;
+		printf "#define DT_VERS_STRING\t\"Oracle D %d.%d.%d\"\n", $1, $2, $3;
+	}
+}
diff --git a/libdtrace/versions.list b/libdtrace/versions.list
new file mode 100644
index 000000000..8986d2007
--- /dev/null
+++ b/libdtrace/versions.list
@@ -0,0 +1,67 @@
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+#
+# Version definitions
+#
+# These definitions are used to generate dt_versions_defs.h.
+#
+# The generated file contains:
+#  - DT_VERS_* defines that are used in identifier tables to fill in the
+#    version fields associated with each identifier.
+#
+#  - DTRACE_VERSIONS which is used in dt_versions.c to populate the array of
+#    valid DTrace versions
+#
+#  - DT_VERS_LATEST which has the value of the most recent DT_VERS_* define
+#
+#  - DT_VERS_STRING which provides a string representation of the most recent
+#    DTrace version
+#
+# Refer to the Solaris Dynamic Tracing Guide Versioning chapter for an
+# explanation of these DTrace features and their values.
+#
+# NOTE: Although the DTrace versioning scheme supports the labeling and
+#       introduction of incompatible changes (e.g. dropping an interface in a
+#       major release), the libdtrace code does not currently support this.
+#       All versions are assumed to strictly inherit from one another.  If
+#       we ever need to provide divergent interfaces, this will need work.
+#
+# The version number should be increased for every customer visible release
+# of DTrace.
+#  - The major number should be incremented when a fundamental change has been
+#    made that would affect all consumers, and would reflect sweeping changes
+#    to DTrace or the D language.
+#  - The minor number should be incremented when a change is introduced that
+#    could break scripts that had previously worked; for example, adding a new
+#    built-in variable could break a script which was already using that
+#    identifier.
+#  - The micro number should be changed when introducing functionality changes
+#    or major bug fixes that do not affect backward compatibility -- this is
+#    merely to make capabilities easily determined from the version number.
+#    Minor bugs do not require any modification to the version number.
+#
+
+# Ver	Description
+1.0	D API 1.0.0 (PSARC 2001/466) Solaris 10 FCS
+1.1	D API 1.1.0 Solaris Express 6/05
+1.2	D API 1.2.0 Solaris 10 Update 1
+1.2.1	D API 1.2.1 Solaris Express 4/06
+1.2.2	D API 1.2.2 Solaris Express 6/06
+1.3	D API 1.3 Solaris Express 10/06
+1.4	D API 1.4 Solaris Express 2/07
+1.4.1	D API 1.4.1 Solaris Express 4/07
+1.5	D API 1.5 Solaris Express 7/07
+1.6	D API 1.6
+1.6.1	D API 1.6.1
+1.6.2	D API 1.6.2
+1.6.3	D API 1.6.3
+1.6.4	D API 1.6.4
+2.0	D API 2.0 Linux (BPF)
+2.0.1	D API 2.0.1 Linux (BPF)
+2.0.2	D API 2.0.2 Linux (BPF)
+2.0.3	D API 2.0.3 Linux (BPF)
-- 
2.45.2

