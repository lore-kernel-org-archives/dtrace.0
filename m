Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A7E2D8763
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754943775; cv=fail; b=WzYJXQ3ZyE38o885k1STpO+78GKFg7k4OpY7JqhetAqeCqpx/s4LhO1GpuRPop4+gTD5ZqnYeGQS612WYyZoCIu6BVmhw3o0J95Oul80w0jjhM7Pe50RNTN/R/adjnUikXNnp6SeqzuR60uKQg0zFVodbK60lycHXWdRsQjU2aA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754943775; c=relaxed/simple;
	bh=Rr1q5M7MtQ3HYyDaqyje/uSmy2+Wus+zUr/ayJNR6Cc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=X9Ew3is9mXNUCliAG3ApioS5yg6SVfig6F7WUyev42hgxzWGCO05KH/mCrs6tEM3QoxvJ2nBLZoxCyiLYFqI0ImKhbx3nKIc9Z4TbkHM34AKQA2f0qFTURj2CH0B/KmOXj70msHs3AF6XGnvS+cZETqV5J0jX/72P0rIjVmUwWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Jpi4Jd0x; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=x8BO9TZ5; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Jpi4Jd0x";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="x8BO9TZ5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJXwaw003404
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:22:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=6aLVplOFSZcwEy7E8Gu28qBeP2DJrZFtSQMs4Y2DQ6Y=; b=
	Jpi4Jd0xpLg+E9mphoDLOkEB0jP4Se/iC0mlhgjrfYh5EK/gOwvIXEo/6f5/rYUq
	g/1Vhco8Zl5yF2GDikX0NJmvsCpZQ+PPthDWG7FvpWFOuk5mXtJu6u4fM17rOgJa
	tLzsQlGSh+Z9VqXELwBobHLIC04TmRZDqrKOi/pmjxH6/8ybfOgD9cYhgpGIXdHU
	k/k2K0gLpISadxt6OIk0oGPPbGZHuPRfCcoYRZ8RAxXfLtPWm4KimI0YXv22DEGV
	Rp4N+a4FZxQ1PAWFgiJJt2mPULvsjxdEDrfLpaudpAVwM5QgCXcyEQQqpsm3SXqN
	fm2cP8zklIvbNwPtPU3tvQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxcf3eg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:22:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJ4S79030164
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:22:51 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48dvs943e4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 20:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ap7wDwaedVUjfLjPX/BW/JTGySj7Ru7iP8cpEDzsA+ZdJMqcLwGD8YmawxBc5WgIGXEsa7x/kK90EyRhQVy2jmAOweiGhO8M4HzseIXV4g/npNiypnsD3ckFbmGIB0GfCE2ChUNl4Hdj3/crBWGRnJSjpRkTjVPV0ZcN2Pl+/uTDbU+PzXhYeEhg/XiXluyIMWZKTilgoO2XDOjm3Qqoj0u9prDKwxlgwK7GeEtpdp20Djf4KL7lymEBY74KOloJqvJyuOh/XG0x8X/GwzPvhOlLFKby7BfLsEreEZloRifU2T6fBjyzhwKuknr5wFTAjzE7BcfHQvOYZGTf0qWfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aLVplOFSZcwEy7E8Gu28qBeP2DJrZFtSQMs4Y2DQ6Y=;
 b=s/sggLCzVxJUlS2twJToQmQzEL/I3ATfPdKbRabJIzAVaAAy4BxTulesC/k+Q/zcgyduGqadF/T7wi+79TAjZZN01sPs6caySsfoOnTDwrgZpLQPbmGbZq3sc5itjQOR1dAS0MFIKLbKFg6i4BHA9Kye4C091w4XUbEqvmnMqKYb0rpvWTu3rlAogYh0V9hVBqDEKBz1i+HeFoEP1c8pGnzRzqv3HKJzQ/eLBsX/4F/8vBaaGfRdPTpaPL/RscgGrfCELjmAP00ntFyJD4d+wt2IgVtx32iwr75vOcIhwjMKgPYu6tF9DxYYcw0gXrjjTQP7f5aKX9zmRGtEBDh1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aLVplOFSZcwEy7E8Gu28qBeP2DJrZFtSQMs4Y2DQ6Y=;
 b=x8BO9TZ5FMb0Aw6EaqXLSFE4qm9eXHrpOofe6Be4kbd6GDVCEDod+iOijbdkrb1YkoqDgWC7M3JfLSBaGs0OkpLBN+3czzuK9T8LNwO4xVKcYuGL0uaPlZSY1ZgfTm/ZGEnyJUw7mx1LHRgm9zH29BdXdReXdygziUMH0hsG+V4=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS0PR10MB7270.namprd10.prod.outlook.com (2603:10b6:8:f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 20:22:48 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 20:22:48 +0000
Date: Mon, 11 Aug 2025 16:22:46 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v3] dvar: ensure dynamic variables cannot overwrite eachother
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB567287FE5AFCB29C1950F1A6C228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS0PR10MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: 2745e9b5-e4f5-4355-8133-08ddd914d67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VtC8X6WSfJn578nY5L7ON2qgdiofxKONjMi5JknwyB5ktWfLPIgallcdIs1l?=
 =?us-ascii?Q?90CbG1tHtscBdXlxTWmpQbot5NxgxOf+DXgDrbcu5Wn8V5oH3xGYLFoc3zz2?=
 =?us-ascii?Q?D+PPLG81bvJMTi0CwTJX3msa3iqVKHic2O2xKVFqGgak5E2oh9gnDLg31UwO?=
 =?us-ascii?Q?NtFmk0zzh/ywKbZKIxV1SfRiNKYxg/zEsm/tNXVxm1jpN78jgR7O1kdLOsG2?=
 =?us-ascii?Q?fwpxZ9o3jW4c1QVhlLsFbcaaUvLUSTdr5gO5eDXcq/Tko7Cq9fDuAD/Yzz6Z?=
 =?us-ascii?Q?WxWxMGEN4AfMe7YFv0eLSwqTbNHMOCWVZ5cCRZ8eHknjzu69Z+Sguz7bubjC?=
 =?us-ascii?Q?crTGAYBe7HjH9Lu3sh1abV0W0UUrzzxkXA2BM9whluU+9u6edyFxxfRc6YWP?=
 =?us-ascii?Q?IBtxTtyKfPleUVEMf7vFBLR2Xkg0Ngsg3V/flw00Wd7qNJk+gMDIK4U1MNi4?=
 =?us-ascii?Q?TNL6tZIEtqNfTvrqTCEocwHYgP3CglWSMJeYWcNhqENVaHgpEfvQX1IwgwNM?=
 =?us-ascii?Q?3nUdJd9yOrssAs4HRnCK2F4ZA2d1FCwdyqoer5DQod6ppBJ5bAsVmNeh0pB+?=
 =?us-ascii?Q?qNJKCSlf5NKe6F3tWuldFLCYyMGQEPAoc6EsWLiexOThMexYecd1RmtWbY6M?=
 =?us-ascii?Q?nqJbrEFQMNWmXaAa+HXbgxUiOVSa1r/WN10UlKPqUBStbC+E1ZfUERJh7J8v?=
 =?us-ascii?Q?nz9gR6BN8Kb7JOofgPmefnG6JY2Xf1SDeM8JeI8G3xT/NP9n1I/Iti3txgq7?=
 =?us-ascii?Q?MtDxvf8AuVw1uwqwTead7sriSFm0ur6sPXV3i+DyvA175aH8bRP6PIbdxUyt?=
 =?us-ascii?Q?fpnxV46p+Cykmr4J+3hpytVIHJ8voDyuBm+nkeT7TOxgg9weO7pMgvxPRjM6?=
 =?us-ascii?Q?O8EnqlhYQcTVH7bt0HweDBqpdw4ZGb09rVobH80h0dLwjd19Hc0rIbuFx3VO?=
 =?us-ascii?Q?HOlpITKiexl8VNmDZnqezMBB+dp0nqLTSRlFOS9okkatizQaFox3KoFkJD2D?=
 =?us-ascii?Q?Zhi4lIdaSD6SyZywIsDIsEabh4/vjwKoJhOz/2vEAxlhIu2yLyyQrqXN/xmZ?=
 =?us-ascii?Q?+vagNIrD+QCosZJbhgHqc2J6rN0ifrHA4pjPWVQZI+X9M/0AW4zxLWNHUvKn?=
 =?us-ascii?Q?N2xFsXJUiZEky7LqYgDKk6pattEipxjMPVKXyEXQiRdy8Zj7SpcKGGsxmVl9?=
 =?us-ascii?Q?YoodJApAmjP313Xse7W/z3ZVjKgCiByPXzb7OmE2fagIoAKKjUlD2fWXu6i/?=
 =?us-ascii?Q?1GLSCIxsH2xYhYg2a/rJO5Sj87KdlMz0tTCdvcDvc1T+d2uW0Sw+ml4Q7Kmz?=
 =?us-ascii?Q?BTy9nglpKbc2yjS9mqbmZwbarhJBfGC4o6GTcVatmAFq3t/PzKNg4d8aW3Bg?=
 =?us-ascii?Q?/6JDK7ULeJ0fy3+1bZslfxltYHrPFcDApYuRnR9wXy/2hxI8Oscqj0yWLqca?=
 =?us-ascii?Q?+WkT5m1Y87c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pX+AhrQeSQ5h4UjwwICc+YMyO0DQQppdE05zZ6ARduphfHSWhgn+9a+vVkaO?=
 =?us-ascii?Q?9ZxWB9JOlAdHBlF+kNdXQYv/Uuo96M98sN1Mw3nNgDsuoGnGM1w3Vtg7y4/p?=
 =?us-ascii?Q?MHhwRUAidZ/moG5SJ1VT4APkq69JLhgfdDm4vAi6J3dTfzAWgBCC0Hd41tvq?=
 =?us-ascii?Q?+xETk5TIqb9laAnYzOAxK1zr4B/YsVXtURr1BRs9AZ9DblBfdWx+YY+yX0JF?=
 =?us-ascii?Q?fATtg5NzcdwgFBwQcNlMdoUmOT0Bdc9Cqn1YSXPT7wao65648Ms/R1BmgfsV?=
 =?us-ascii?Q?e67gewLMCKGX+ek7ijqmLbn9UU55OUyNoz8mMab3sTq8bIIg+XA2weZRSMgw?=
 =?us-ascii?Q?5ScAYSBRZdL/3JhDI4eYEWliDAFCEMxqh8G+h3lkYLc5qK/VLSYxxl62COIC?=
 =?us-ascii?Q?DaGLWbuHp/13WxX7UfCucDZ0X4CF6peMnto0X/v64elG8dJuMkHgOU2hwn2b?=
 =?us-ascii?Q?qFDtL/bc3+CkPWrHGkquxB9D+Xa1W2m4Jc4NrKGfe4VLYnYEZD/NlVInkQWw?=
 =?us-ascii?Q?c3LrzgoBFjsN//AMdj3C+rvqHCO6EjEcrF3CzSTWzrMm9Kz2Lpa1sVRJUY9H?=
 =?us-ascii?Q?VN52tZgb0B5Qs9cRP6k4kLlAdcoeSxuwAYnQckv8SKXZ+zFZXed7Z2rUfmfT?=
 =?us-ascii?Q?LxeOO9yzYhv1J819zhLUIC8p+LdjW7EUm7tQAc9lRXZSHI0oNoAjOJPCZnKg?=
 =?us-ascii?Q?qRVGTVkPpDEUcKNTr7FEefnfZlYF72ecricT739m4RcMq4W/bRCZemuc8HgK?=
 =?us-ascii?Q?4wNHOZucVasl1Bgqp1i88Xv3KdeCb9+Azp4l4phI2y0XZF+VYbTbDNag25my?=
 =?us-ascii?Q?kP9BJXWyc5Ismsr2s+eb6El12GdMPFfD63Qqk+ZKEofLdW8tK4cOv9O06VfE?=
 =?us-ascii?Q?tvi1A1/dCp8jcYuwFyWsARAPvn3X607YjFir3mM4JU1KMUdbQZpwodBOkghT?=
 =?us-ascii?Q?8VZkrAT7LDMiE9141ZHqyHIf9yF+2E6mdFAhjauxJVy+4SqPEonxqbxVXC5g?=
 =?us-ascii?Q?qChOhEH0lltsPoR0bIDaXmsFzz4Px396cMx01bVbqqXSmxZ4djN3SNr+45ye?=
 =?us-ascii?Q?c5eMDPBMnExlEOa02ClnGACFadTB9OSDdwXHzgcpkhGbBFhzopbKVhcylcxU?=
 =?us-ascii?Q?zGWQETj1C0E6YVA7MDF4qleyDmLFMh0TY0zfIavcItW94VTGbSDGs4YFcDmv?=
 =?us-ascii?Q?FJGYuaeSHmPWspqa2lzBrIUyQo26wbULMI0zigbqDvUdc9gO+np1UUF6FD1g?=
 =?us-ascii?Q?SgGHSsVT+BaDMpyGem8ns+SSjasaML16bveqcRMrOJUBCEFNZXoKEoVN+ZZS?=
 =?us-ascii?Q?0OuEwbjoKZ62VPBXkOWLyFdE90R8o7rUB92OExwRtwoupltiy//cp7GmoifP?=
 =?us-ascii?Q?DqcWwMKG9ax5nNca6B+p2qaF7U9X9wyMymPIwdYQC55BpMpUpKLtmrbWKBYN?=
 =?us-ascii?Q?OnCcSQ3peScvNEt97xe8QCrH+19Fm8nXXx5kT8gZMUr+pGVjTN8BKc2Tonuo?=
 =?us-ascii?Q?TuQYFUAAidSqXyS0kYFA5fW6fPqmdbKFooeJEOYERYIwo6OqVD5JJ4RyybWp?=
 =?us-ascii?Q?BlSNeNx4yCim5e7CMCr/GT8zJvULM8gh08B1x1bxWnXUewmDCvXGMtnktGJa?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	34axaTDwUNr+VMiZNTruiauFO4drawXZ4dJOTuIFzu03Fa6nWHeoJGpMVZWVcL9SWsYzSdHhci0OxDibw+/1yFozqBb5HQ7I8uj3FYCvByNhhALmoXMW6aiOY/XwcBIf+uuPm3K9QwMpVcdr5iNi2fUJLn5Ioyv/D4uXv72FpWal4eZcgm8coXfG52/iaVx6Ghjx1Q54zV25jcOs1lI0JgB6jFGhgAki9snUAAq+JbzZfLkaepGNvOG7VKozJnflKGYZd/UgYQk1M+wqlrkFA+7u/EI9VCts7Zgao37sOUSwa6ky1I81nBA43E74O5bNuO9YMelUY9hE9Jz3l2rI6L2qVHkhplz3twYABBSJto9lpSR6UygHfuAPtLe1TzGoBLLHnIxn+jHECXkRFGYVeJBaNKPl/SJRCJTnhFvrKVWQoEQLlrPtxcivhGrP1y5P/p74Y9IxHYxe2eJvsm1m8hJc6x/lWy8WIj42Scnklnb11Eh7+UwFUc0hd0ZQoHyQny7iSIKTeKblaGMt3fxHBAkRhBACdG1u5RTU6/tI1O1JnA3LTYZwCfzMj/ifh8tnhw+LUJj+WnarUSSr8Kbgxp4ErERrOTKXnxF1zIYTt7g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2745e9b5-e4f5-4355-8133-08ddd914d67b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 20:22:47.9736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cu1/1VRWmAzTgpt8vAih54CIMv/xn9QYI3PJypl3rKE+1MsxiAjucUYW2j0Gk5+qquYphAaitmfGHELkLTlc25CH1rd0L/aEE6sg5/JEH1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7270
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508110138
X-Proofpoint-GUID: 2GtFYLYGDyYJYzudD4wN6lBVZhmYQOen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEzNyBTYWx0ZWRfXycIVq1ymhzCq
 gbNsQ8SOz8U8qlmwDpjN72lpOf+gjUudpGzuFtbB1gl88JCwb3D94dFJutecNJdvW/8RKTAW0Ry
 ByKeaKefxaYSK8gSajHGKwhwN7s5w/ODazZV3wQtUH4rYMgPptV4x6+nvEAA16j4SCklW+rXys3
 3/ltbpVSKL5jFjJrL6bk/Uzy6fxeg5MgunRmXLfrk4WjrCwh2waERzWqRnltbYtEgd4p2kfOwLz
 cNg4xQ6LvsElb45enlxSWu4ZKR+ezXfa2wJelCvqqYCCr59nF1yU74adQKEefqxsj3TY9LLHMDo
 i3qzlNYHKD9FEonWCZOGCyrbtsgSjSNcAlnBTF0//G4T/yeHr1sRYkMlM0Gh6YMI6558lOGsruC
 gnaNJsZOSg8hYfbtlrZOBVA/C3I/x4qi1G9/5QgqGhVTcY7AeYJlKcQ5z7zJFBhqck13PMx/
X-Authority-Analysis: v=2.4 cv=W8M4VQWk c=1 sm=1 tr=0 ts=689a511c cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=79fVXfI8GbyGQRs3CvIA:9
X-Proofpoint-ORIG-GUID: 2GtFYLYGDyYJYzudD4wN6lBVZhmYQOen

As Eugene discovered, it was possible for dynamic variables (elements
of associative arrays and TLS variables) to overwrite eachother.  The
problem turns out to be due to the implementation of the BPF helper
bpf_map_update_elem().  In order for the update to be seen as an atomic
operation, it does not update the value of the map element in-place but
instead allocates a new element and places it in front of the old one
before it removes the old one.  The result is that the address of the
map element changes as a result of the bpf_map_update_elem() call.

Fortunately, we can just assign the address of the map element in the
value that we obtained using bpf_map_lookup_elem() because that gives
us a pointer to the map value, and we can assign directly into it.

In other words, we do not need the 2nd bpf_map_update_elem() anyway,
and since that was the culprit, removing it resolves the issue.

Test included.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_dvar.c                       |  5 +----
 test/unittest/assocs/tst.collision.d | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 4 deletions(-)
 create mode 100644 test/unittest/assocs/tst.collision.d

diff --git a/bpf/get_dvar.c b/bpf/get_dvar.c
index 1bb5eb002..073cca57c 100644
--- a/bpf/get_dvar.c
+++ b/bpf/get_dvar.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2019, 2024, Oracle and/or its affiliates.
+ * Copyright (c) 2019, 2025, Oracle and/or its affiliates.
  */
 #include <linux/bpf.h>
 #include <stdint.h>
@@ -150,9 +150,6 @@ noinline void *dt_get_assoc(uint32_t id, const char *tuple, uint64_t store,
 		if (valp == 0)
 			return dt_no_dvar();
 		*valp = (uint64_t)valp;
-		if (bpf_map_update_elem(&tuples, tuple, valp, BPF_ANY) < 0)
-			return dt_no_dvar();
-
 		val = *valp;
 	} else {
 		/*
diff --git a/test/unittest/assocs/tst.collision.d b/test/unittest/assocs/tst.collision.d
new file mode 100644
index 000000000..11a4363ca
--- /dev/null
+++ b/test/unittest/assocs/tst.collision.d
@@ -0,0 +1,22 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Dynamic variables do not overwrite eachother.
+ */
+
+BEGIN
+{
+	assoc[0x1234] = 1;
+	self->tls_assoc[1] = 0x1111;
+	self->tls_assoc[1] = 0;
+	self->tls_assoc[1] = 0x2222;
+
+	printf("%x / %x\n", assoc[0x1234], self->tls_assoc[1]);
+
+	exit(assoc[0x1234] == 1 && self->tls_assoc[1] == 0x2222 ? 0 : 1);
+}
-- 
2.45.2

