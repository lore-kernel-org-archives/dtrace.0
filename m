Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D269187FEC
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742410744; cv=fail; b=V5nk+/dmpYGbsnwFxEQgBQljltSgxecWbIRT/FUIe+cmMLjQ7/PPJwpPltUKLboxTtkB6l1SUomPG5XqnB92eIOXijjt2am05hieK5dJ2mbOq6cGaaCz7X8fq/pkLRwfTANL8YppgD6jKvUpvmfiFzsnsTmEN2X2Ar7TTw3ara0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742410744; c=relaxed/simple;
	bh=vaRcLlbp+uRZUcwgw2q73arMT6CG9LIiih7RANJsfto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AGFwyg42pMx3IkcRVmpzgg6oin13uefxlSAmXBTKolXAs/VYbYllsYOGsbSIm/FCnUXpai7jLpX3C/jDYHqM8UP3jrWVxFpYi502CexL9hdzFFvKF35ULQ7VII0UydQhac1/JA+/d8JRDsLLc9df03NIfai2uJiddS2SQM+UkKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nd5/FWnw; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ARbj2iLb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nd5/FWnw";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ARbj2iLb"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JItjai029378
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=dxXiNX1CDbGM8k0cyB
	bZE0Z8C4frga5Ldn2Sng7IzHI=; b=nd5/FWnw/ATlvOJDD0pYJmOigUJ1KCin9z
	Ck8FnCFxH3H3BR5YzbOuF9eaS9SUu6evSpCjQNP/c8PVUEzzrjgDSoLRIdOLe8o9
	ll4t0N07kNE1mrK8aQoeHzEQJat785IFDusgxCCetz5Ma2Ht4/ZoD0i/KZyLcRYD
	Ge2e3uxZOF947alybsgGWJ2PxUYYGtgw5RRvyZL4zgbhcdjyMLwYuLOdBtF8CK1J
	zjwTL6/iSDWuSGJpJr8JjWgJOWn+A799zarvnzQbs/EIIWPTZz/Iml7K70gn0jEo
	WConUvv0m3+KLs+RdxlTsYwHLJmjGKUsVGdSXctDGjvcDg//WDoA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1ka47ny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:59:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JIULuC022394
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:59:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45dxeh9ubh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 18:59:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fXLC/gJErN+J/rOY2DvmiEnOHxTxsLe/5ruQ3KrbzapkcQoDahMSYcBKxPmtV94szDU3dj+qJE8mOGNMb3O82f5ncxGflmFwl+te29C2252I8EzARAbpLCOxqgQMcO22vqSHGhCyQEAsSwdE0uQZwUzews2Wb+hsJiQIthScxFk4lhhndjBLL8y8/t5E0IJzMomy2zh/T5BJ7vbyfiC6n5z/10INe55il1PdSDRxTwyec1MaOV1AQ0EPh30/Wb80HuQKxMKVTy+cXC8nhbs8R2Kql5KI7PQZuLwjKSOx2y/IKFR1pphEDqKQSdaPX4x8Y3/4/K1GEO9RCZd6c/z3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxXiNX1CDbGM8k0cyBbZE0Z8C4frga5Ldn2Sng7IzHI=;
 b=feXvSmEH92Sm/5N/VJyZK4MVBNeNvnlNjduZOCPDQKVASH0bLQxUbKmsIxa0Leor1PLPhmX/VIFCorKCXyasAo1bZ4ZJZ2NzavuWFhvfeKU9VyGrgZFgkHj0TBD3fMJpe9fOPExF63dw1g1OLppHZPUaD6pdDPpqLA/oD4qdj/CizA4o8rabdusDUMgYphXZh4NpTkuzf4JPEh6s56HuoY0te5FhyKOn5WM0PfrBJCbzoIh3HSyUkiU7vGKQD9vXpBrXMgku6NUOi6u1UKMaFm2+JuhKK9yvkywFfZSzmxOZ/ewUilCP/oBsAvOwtuP5laUt03HQuvXtbpxCwttIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxXiNX1CDbGM8k0cyBbZE0Z8C4frga5Ldn2Sng7IzHI=;
 b=ARbj2iLbUWoPzrkaFYep1/ANon7Mj6HiCd20v2drqK5FHBNoiwZ5PbDE8yCZgtkfyIe2DDR3/h7lRBoKSSdYxKv3yJH9sKueJV7T5tl5d1Vq+vI8w/ph/iC9HUdatuO8AyrNNoFntnrslJHVFBuHTzmGyEHmj++0olmtLAAudk8=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by DM6PR10MB4283.namprd10.prod.outlook.com (2603:10b6:5:219::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Wed, 19 Mar
 2025 18:58:57 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 18:58:57 +0000
Date: Wed, 19 Mar 2025 14:58:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] Copy fprobes entry args with BPF helper function
Message-ID: <Z9sT70iGDV5bM2Df@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
 <20250319063230.28171-3-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319063230.28171-3-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:208:36e::23) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|DM6PR10MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: cca2c477-6705-4ea5-1715-08dd67181a4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/e3YI9vuvZ93XsqoexJbMiABR0Bx5M6oUmanpUQWr05ai5tEaKzfDwc8TxI/?=
 =?us-ascii?Q?kwseZkZFzaSsXx3SlUrFtwhU2P9t12uiAxd/8FcV771AFE5tj0K1tc9DnKF+?=
 =?us-ascii?Q?bdIQM1suya4cuoyRRqRJ19YqSKj6+BZAhHMM63h/gXcmWVGB7A6WU7K67TNG?=
 =?us-ascii?Q?BMyBg4P2NKBfi/2gVtBc4mCJNoemwT5JqcSr4o/stUCy59FUBImq6VxNBnUF?=
 =?us-ascii?Q?wF6zszLutYSFw6uhqcXXQGnsEbZCQAbUEaQE67FYRBPCCHjjmfbiadqDQ9FM?=
 =?us-ascii?Q?OehXWTXWCGnEFBgj7VqMX0a7P4Y1fpTD0E5iByCOECLlMommHfiYweUY59Fx?=
 =?us-ascii?Q?WuXVl1mo0KKzw+6E9Hm+eBOWO9I9yT9hc+A6ieGEaHVFdYmByJEDQ87CCxNv?=
 =?us-ascii?Q?YRUXqO76pyUJPnY+RzScXE4VQcGqIlQeOn8qAMtzRjzGmL9RH/KPQsggMx/p?=
 =?us-ascii?Q?PVSiNFyC92b6W6P/COriaszdApK+SerVFO54IdiaDhENxFwBYGdseL3wxx6h?=
 =?us-ascii?Q?6DNfJZWp37Jj0INXdVV+L57Yvg1BFCu1bNay/nqKqA4l4RHHwG8Ph2YPf8pA?=
 =?us-ascii?Q?x4JTF9D7FxoloLcMO9s+edY7y47I3fGKA8fHnCZLj5F6BD3lBLy3/pOPWS3R?=
 =?us-ascii?Q?hFK36mOj7dyD7g9sYijATOb83Fm5YNnP3pFfOyNlsEYbIaLqDGLbGhHzYNkG?=
 =?us-ascii?Q?6LEe1ej2HY0TtjB6aOzMIXVVwSCaMexlkFsfyCc6vuufYlGDshmbcb6gwMCg?=
 =?us-ascii?Q?B+JVHrZmTSgAJtQzcfFsQmdXAejjEmy8gJ+tgWEBHfZ6pFkI6ni4Vv6DICEm?=
 =?us-ascii?Q?nGg1HT2vYuH4oAZuN5ARxTcq0iA1GeH2bPhdGPSm53LvuFL9yJ0TPrCRHIT1?=
 =?us-ascii?Q?/t1Sd8i7X7wtUahJQSKxxueyFoqhkovS4CCPekTna8f/1napIJSMMKiXEp18?=
 =?us-ascii?Q?16xX5YM/iKGPfDgSH4DdpIebVJO3dVCXxOKNBgl/D6O2MwIWmicXL1kOA1Sk?=
 =?us-ascii?Q?YUN69LmAaq+M8xtBjkdHUiM0fS04HczU/za4TnHlzuu9RMSAFz48zsaqO81B?=
 =?us-ascii?Q?xcJoB7N6BS8n/aFMzwVw6LNhrIHwJcjCYjK+byX4grO33LbVOv9rsm9R4x/0?=
 =?us-ascii?Q?VpAUjcprLKxOsAHJ5Y+SdRU4U1g0qXiZg4ZyEftKyXxjTkM/DOja2gSM2uw3?=
 =?us-ascii?Q?HNlNWwMbHAmwC8yWjaeQ/P1hfKsXni0QruNXrnSVz83ZxU8JyNmys+I1BvDK?=
 =?us-ascii?Q?VkDJd/0hfIMlbo1BCcSvGr8S1uPG1VgWyPpfLd2peNYbvUpQ8GXQNQ9wbMxY?=
 =?us-ascii?Q?tdEIBQpdsZZ856mtSpgv1AGjxiO+dCCA7o8dOPATPACKAIsI0xrFN4Pmsebh?=
 =?us-ascii?Q?t9Ylh1u3rABRpig4H+Pdu12xkU5V?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S5peJiOiAkDxDsPlrJx1I9gNVzABxc8lk8osy1dOSxzHpfTm2LBkhNAGkAz7?=
 =?us-ascii?Q?nRHxadyF+afEzESkn+IKGyEzTTTTpDQdgqYodXzlj5H1XY6EYyi18IBYOqQu?=
 =?us-ascii?Q?P3BK7Eq87a9QBqRVCBQNEr5DHXqMMn1kkPwi/z91qLltewtnryAVmniGP9xi?=
 =?us-ascii?Q?HYCGvsLCk3/mN+yDXQd4AAnEzy/GF5eBCK7cQGebv/ws81+yHJPL/chLjr69?=
 =?us-ascii?Q?TLXfyUrfTed9nz/Da/HXrb9sCCAS85RNEnEDzRYR9MpLauMS1YvsIQ19RebR?=
 =?us-ascii?Q?wX/y5tWNQkQL8RleHEmlMwef45aiCBGjmCV0rYpkG2E3AJv3cFZjH+zY6G++?=
 =?us-ascii?Q?FgKoElNobb8L3tJehJvdkj8hqDYdHlSpKk/wcWCGOcpk85U6Ejo1H7RkjS7v?=
 =?us-ascii?Q?tI9AA+JvcflxoW77hhQg+UqiLJS+R3ffx7Ft/uozojctN5ozJowwFzB5g7Bp?=
 =?us-ascii?Q?vdW/zFCG3AW4+Uk3AudVuwSKjl51BIDZg28Ick+HXIlzWNoUIMjfhC/CHqUH?=
 =?us-ascii?Q?Qkw3UYYvKQdkbVOhO9TU/8UlXRnD5PDG7GsxgQcNTvOS+S1L8AIlEhPLSuLz?=
 =?us-ascii?Q?wAy4y/zYU3O5VxOX/H6/6O2o/CS4/1MupWQ5N1BrsbKbMMA8qSZMKHZ88fgs?=
 =?us-ascii?Q?rwf5bEVVloaj5SEXZZ1rffjr0k0PB/J/rBCua6Cn6KOnxlP0LXlHK+4sGCxf?=
 =?us-ascii?Q?K/V4/CYnMAdSY4pn1HMJaoIym5DZxozWiN23s1xL5Helf1lwOV6mRNfPS8tJ?=
 =?us-ascii?Q?gdHeCUnkqKPuQ46a4vRubGzSpAHKqDGf61SZOQiNmqjobdgcI6e63EFovZ4N?=
 =?us-ascii?Q?JFc87/0Ja1Snlspnq+6ZrKcE5Jwv8G1rTh6hR3lTkPMhe9N2uEKz/XyJA2m1?=
 =?us-ascii?Q?YjXAHDZcyGl0ggv8wMIFdhlEC/6S5rA2DgMVHfL2OW/UaCOZSNIZrZo8g72Y?=
 =?us-ascii?Q?w3unTDq6Ey9RduRHC7njLe+p1l1jCJhuvQBkNkh6kGcQkmaGXbxU+4MpO24f?=
 =?us-ascii?Q?W1RbbofLT2PNbQlv9twT47WN81BygiPEIr4/iaOWqrZSY6yim9iLtU0kdCOm?=
 =?us-ascii?Q?gm+2Jtvlutxa8lm9j6GAerNuiZScuDKFgaY6BKPyIkOHdCyag1nJBCi6jJMd?=
 =?us-ascii?Q?9UO0ViswqPBfmnjZE3pKJ7LUrWbxia4AApIO0IJQecQ5EtMDCPnN8vNdhuxq?=
 =?us-ascii?Q?nTtQPsNkOJotywNH7iiACfIrA+1O5jIqCXZ/rrBIi9UM5toTouNrMBpji4Iy?=
 =?us-ascii?Q?VHolq+k0zbfMr6xGg5PvXupeXgJtqtlyvFxS8k1F8mQMErw5UDj/zD8Iv5VO?=
 =?us-ascii?Q?9LOnzXEpohvVLivbuIMQ2M1Eeeb6/MsE0mvrRrNf/FMmZlesCXOQ96uvNp++?=
 =?us-ascii?Q?PkgXnYa0TdTiMJDcqPAIF76XyOUAbnZS7qCT56seSNi1Y88MtYD4A9aWaXct?=
 =?us-ascii?Q?u4eZ4+SnNN9sCBl+tegcj6wpFKsdSC5NdUilk35ySqxP8hFnhfzDQSn/iwMo?=
 =?us-ascii?Q?sZAbpGXhu4FI7QTQKFOlKC5Ur+SgiGNQL7Vhp0QjE2zhqLZNy8+JOc7B7kVZ?=
 =?us-ascii?Q?/cE0keWIs0QdQPojaoOFjrCpbXxBBMUcah4/B6uVkUbm/zmHEVqPHbRWT4Y6?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1eFk71JL52SeEjinNaHItK1S/b0WZbF1Z9zzPLQWPP7ehsJM8y/M+MECcrngvgkesrBZYOSCYGUf8i20vXyrar3s33RoOZPZzgMTCgXslGixbmwjq/x3gvPOieQnaviCcFQSvCTIARgta3INfZ3Nk+U05U3+zSS/8zdReboWZvYViz1r0xOQHAOzf6yW8oxbihcD0bPrWf/dI9SMBUOtJ9VFfM5/wGx78lldTsm22iTecBUX/m0gPiIZ0kW4iERSLlS4nRlaHWG4f587MsNddMEnKQCb+cugfYrRAzVMR7k6/IVP17Zv6HCzID0jJx2re1cHc40rW5o2jjo79PShnJoJTVwpCm2kL2zdIIvakTTIgTO4oFI6vaG03gBegePa7BwqPLL6qXxtat8LonjOapY2kAz0N2hEOiUBRdgEI1BRXoOH58kvarYU8PPxDJGbPcpNtivJJ7kRrbrCsYCIglcWYab7faYC0aeCRzyuiK4h6i55Fsgaeo3OT2v5IU2haHcT2Sg6DRmXGb2zaOxfAdRHS4n1aeoMPuw+Ujq8XPbe7Yb85UNUYls+xIuHe4nq6jh39EptHot9tir+dctncLPCr2SOtis5eEouW5TG6jI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca2c477-6705-4ea5-1715-08dd67181a4e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 18:58:57.6545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcuJeCcwiYWrpOUrK72akSRORc5A+LLxNgT1ndA/z6avhLyUFMyWpyfwNpEIoOwNGz4NfG0pnAszOyl7tzk6+V5TtyNIiI0DhvWOHC/pkHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4283
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190127
X-Proofpoint-GUID: oI5Q1kHGgGMPup_winY30IuLijEgeH7R
X-Proofpoint-ORIG-GUID: oI5Q1kHGgGMPup_winY30IuLijEgeH7R

On Wed, Mar 19, 2025 at 02:32:28AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> With commit a6b626a89 ("Fix fprobe/kprobe selection"), fprobes were
> effectively turned on.  Unfortunately, with this fix, some tests like
> test/unittest/stack/tst.stack_fbt.sh encountered problems on UEK7
> since the BPF verifier would complain about the prototypes of some of
> the probe arguments.  E.g., when loading arg3 in fprobe_trampoline()
> from fbt::vfs_write:entry from %r8+24, the BPF verifier complains
> 
>         func 'vfs_write' arg3 type INT is not a struct
>         invalid bpf_context access off=24 size=8
> 
> We can bypass this problem by using a BPF helper function to copy the
> arguments onto the BPF stack and then load the arguments into mstate
> from there.
> 
> There is also a BPF get_func_arg() helper function, but it is not
> introduced until 5.17 -- that is, it appears after UEK7.  See Linux
> commit f92c1e1 ("bpf: Add get_func_[arg|ret|arg_cnt] helpers").

I'm OK with merging this (see r-b below) but I think that we should perhaps
see a follow-up patch soon that implements using bpf_get_func_arg() if
available, and otherwise use bpf_probe_read_kernel().  Not that it is (at
this point) necessary but it might be a good idea to adjust to newer ways
to access this data in case e.g. future kernels will hide access to the
argument data behind that bpf_get_fucn_arg() helper.

> While the already mentioned test signals the problem and the fix, we
> also add an additional test that actually checks the correctness of
> the arguments.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  libdtrace/dt_prov_fbt.c                     |  14 ++-
>  test/unittest/fbtprovider/tst.entryargs2.r  |  29 ++++++
>  test/unittest/fbtprovider/tst.entryargs2.sh | 105 ++++++++++++++++++++
>  3 files changed, 147 insertions(+), 1 deletion(-)
>  create mode 100644 test/unittest/fbtprovider/tst.entryargs2.r
>  create mode 100755 test/unittest/fbtprovider/tst.entryargs2.sh
> 
> diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
> index 8aa53d643..50fa0d9dc 100644
> --- a/libdtrace/dt_prov_fbt.c
> +++ b/libdtrace/dt_prov_fbt.c
> @@ -285,8 +285,20 @@ static int fprobe_trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	if (strcmp(pcb->pcb_probe->desc->prb, "entry") == 0) {
>  		int	i;
>  
> +		/*
> +		 * We want to copy entry args from %r8 to %r7 (plus offsets).
> +		 * Unfortunately, for fprobes, the BPF verifier can reject
> +		 * certain argument types.  We work around this by copying
> +		 * the arguments onto the BPF stack and loading them from there.
> +		 */
> +		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> +		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(prp->argc - 1)));
> +		emit(dlp, BPF_MOV_IMM(BPF_REG_2, 8 * prp->argc));
> +		emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_8));
> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_kernel]));
> +
>  		for (i = 0; i < prp->argc; i++) {
> -			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, i * 8));
> +			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_FP, DT_TRAMP_SP_SLOT(prp->argc - 1) + i * 8));
>  			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
>  		}
>  	} else {
> diff --git a/test/unittest/fbtprovider/tst.entryargs2.r b/test/unittest/fbtprovider/tst.entryargs2.r
> new file mode 100644
> index 000000000..efc4685f9
> --- /dev/null
> +++ b/test/unittest/fbtprovider/tst.entryargs2.r
> @@ -0,0 +1,29 @@
> +mode READ           : no
> +mode WRITE          : yes
> +mode LSEEK          : yes
> +mode PREAD          : yes
> +mode PWRITE         : yes
> +mode WRITER         : yes
> +mode CAN_READ       : no
> +mode CAN_WRITE      : yes
> +mode OPENED         : yes
> +buf: =========================
> +count: 8
> +pos: 20
> +abcdefghijklmnopqrst========CDEFGHIJKLMNOPQRSTUVWXYZ0123456789
> +
> +mode READ           : yes
> +mode WRITE          : yes
> +mode LSEEK          : yes
> +mode PREAD          : yes
> +mode PWRITE         : yes
> +mode WRITER         : yes
> +mode CAN_READ       : yes
> +mode CAN_WRITE      : yes
> +mode OPENED         : yes
> +buf: =========================
> +count: 8
> +pos: 20
> +abcdefghijklmnopqrst========CDEFGHIJKLMNOPQRSTUVWXYZ0123456789
> +
> +success
> diff --git a/test/unittest/fbtprovider/tst.entryargs2.sh b/test/unittest/fbtprovider/tst.entryargs2.sh
> new file mode 100755
> index 000000000..f5b435f56
> --- /dev/null
> +++ b/test/unittest/fbtprovider/tst.entryargs2.sh
> @@ -0,0 +1,105 @@
> +#!/bin/bash
> +#
> +# Oracle Linux DTrace.
> +# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# Another test of entry args.
> +#
> +
> +dtrace=$1
> +CC=${CC:-/usr/bin/gcc}
> +
> +# Set up test directory.
> +
> +DIRNAME=$tmpdir/entryargs2.$$.$RANDOM
> +mkdir -p $DIRNAME
> +cd $DIRNAME
> +
> +# Make the trigger.
> +
> +cat << EOF > main.c
> +#include <stdio.h>
> +#include <fcntl.h>  // open()
> +#include <unistd.h> // lseek(), write(), close()
> +
> +int main(int c, char **v) {
> +	int fd = open("tmp.txt", c == 1 ? O_WRONLY : O_RDWR);
> +
> +	if (fd == -1)
> +		return 1;
> +
> +	/* Move the offset, then write to the file. */
> +	/* (We will overwrite some "middle section" of the file with "========".) */
> +	lseek(fd, 20, SEEK_SET);
> +	write(fd, "=========================", 8);
> +	close(fd);
> +
> +	return 0;
> +}
> +EOF
> +
> +# Build the trigger.           FIXME do consistent with Sam's changes.
> +
> +$CC $test_cppflags $test_ldflags main.c
> +if [ $? -ne 0 ]; then
> +	echo "failed to link final executable" >&2
> +	exit 1
> +fi
> +
> +# Prepare the D script.
> +
> +cat << EOF > D.d
> +/* these definitions come from kernel header include/linux/fs.h */
> +#define FMODE_READ	(1 << 0)
> +#define FMODE_WRITE	(1 << 1)
> +#define FMODE_LSEEK	(1 << 2)
> +#define FMODE_PREAD	(1 << 3)
> +#define FMODE_PWRITE	(1 << 4)
> +
> +#define FMODE_WRITER	(1 << 16)
> +#define FMODE_CAN_READ	(1 << 17)
> +#define FMODE_CAN_WRITE	(1 << 18)
> +#define FMODE_OPENED	(1 << 19)
> +
> +fbt::vfs_write:entry
> +/pid == \$target/
> +{
> +	mode = ((struct file *)arg0)->f_mode;
> +	printf("mode READ           : %s\n", mode & FMODE_READ      ? "yes" : "no");
> +	printf("mode WRITE          : %s\n", mode & FMODE_WRITE     ? "yes" : "no");
> +	printf("mode LSEEK          : %s\n", mode & FMODE_LSEEK     ? "yes" : "no");
> +	printf("mode PREAD          : %s\n", mode & FMODE_PREAD     ? "yes" : "no");
> +	printf("mode PWRITE         : %s\n", mode & FMODE_PWRITE    ? "yes" : "no");
> +	printf("mode WRITER         : %s\n", mode & FMODE_WRITER    ? "yes" : "no");
> +	printf("mode CAN_READ       : %s\n", mode & FMODE_CAN_READ  ? "yes" : "no");
> +	printf("mode CAN_WRITE      : %s\n", mode & FMODE_CAN_WRITE ? "yes" : "no");
> +	printf("mode OPENED         : %s\n", mode & FMODE_OPENED    ? "yes" : "no");
> +
> +	printf("buf: %s\n", stringof(copyinstr(arg1)));
> +	printf("count: %d\n", arg2);
> +	printf("pos: %d", *((loff_t *)arg3));
> +	exit(0);
> +}
> +EOF
> +
> +# Run the D script and trigger twice, once with O_WRONLY and then O_RDWR.
> +
> +for args in "" "dummy"; do
> +
> +	# Prepare the file to be (over)written.
> +	rm -f tmp.txt
> +	echo abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 > tmp.txt
> +
> +	# Run the D script and trigger.
> +	$dtrace $dt_flags -c "./a.out $args" -Cqs D.d
> +
> +        # Report the output file.
> +	cat tmp.txt
> +	echo
> +
> +done
> +
> +echo success
> +exit 0
> -- 
> 2.43.5
> 
