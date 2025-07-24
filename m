Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C52114286
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 17:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753377912; cv=fail; b=Gc35hujZtFF0IP8B75S7wvswdRN7YIA102+yhIW5PukrzYX1d6gIDSrQAN2/HehqoWIKq8i/xsBn8Mx2V1ucxVe8/8Csz5ok/3jCHg0AlXTpM+iqCzhe+WPJUM8Y57H9iOKdQzrUeH+MQV9Sr7L7t9NNyat9uBL38jtpm6uD4W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753377912; c=relaxed/simple;
	bh=au0vNLt2RZVPHGs+ICs/EdWyVUqSTlwaPxGYnuJe7Rk=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=M3dsleH9bprg56obpntxi3+jCJWnu7+KS/LPv46RBGuST3P0KtFh55NByq6cXUunzi7eSIvterfSXDHSGEVRAfXFDem2in27zFVh5Zhp4qhyMeJ/WLfDNFYupaRwwm2+U8+6pF0h5Lr54FA+8jz7L/KL+JeDDLWRiOrYzi+NMz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Rn8MzaLx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hn14y/ww; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Rn8MzaLx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hn14y/ww"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OGisSl027446
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 17:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=au0vNLt2RZVPHGs+ICs/EdWyVUqSTlwaPxGYnuJe7Rk=; b=
	Rn8MzaLxwRzmude3X8Jvublo/rq8ejpopKQHpMFVNio285c1yZhEv8enJyqMeM5N
	xtMGZbLZVOIyffBDJBY6lORQBvlzJuE6mMCEWvhDyJo/nKQx9VIppyOVMy311WpI
	N6Ag50TOZlL9kbC5A8WeHRLIfaXysTHiFeABgm8kCQtqdTXRv8L7684kZyKvQFt/
	UJbwYo/J3bONer+4VmQfdVqWCku/jukuL6leQhXDOzWQqyw0e3BxS/eFoQ1+bonj
	4LA4lEenEtU61v9GvUaiyoVT9VvD1YI/MqIFOqy0paREF3wx92PiZ6OIntYIuDza
	C/P4cV0lED7vgqXjVRlDxA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805txa5ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 17:25:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56OG71Wc006731
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 17:25:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801tc4cjy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Jul 2025 17:25:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bl8pHzUvUswsUEm2Eswq+wu2zUoQzjqRpFsn+MEPr8AZJ+lWONydriHbWQ2Bymm1+AuR8AG+n1R35Z/a1YHBtMSQGBJoky8BlkLTUJ25Sc9SdlwXpCPrOcPHQSkaB754p1jrP0eil2YvqOBaUOdNCnY/oiXq1IYz7Z67Z9wC6ATywJ930iUIxX4bfeYlLjR6h0APVin/i/ZLzheg6UHVtDlAqHwi4W6clrC0mjfixNNffDmgj4vrt18iraC14Z1RoK/Fwf2LCI/UJ82GMxb+/mzW1xm80YX4tRjuXzDV8isKW/WjF7ZERUwcf6TPG/WUaEm2wfRgCdPXxdFH3WbGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au0vNLt2RZVPHGs+ICs/EdWyVUqSTlwaPxGYnuJe7Rk=;
 b=h/WkkpFSKwgO2wqK1AfLU1J4YglG2vc2EZSlcF3EADFzETdeNVUq183acdXOMor+Z3Ly//czcQJjkUSQyYh7fEMTnZOKlX76XwCk5HX4KwFrQu7YaWIJvD+O5DI0fw4sH7QObvU4TxT5KAhTUeJiKrzoIunUor2pZYsx2MDiUFllyJMXLMAkTOWZUsNTgDfOzED40iTmbHt7lNC6fE/TWkj3UonKhrrkEVLiA1G148ejghR9UW6M9MDUnsr/tLbGO0bWjV7MCSiEDDVVIdFw9PrYVV3ikuGWdjETYKAWyn8GjcaJiTeFuN/cpkB/Mn3xMNc7OcMu83Oj/OS9ktop6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au0vNLt2RZVPHGs+ICs/EdWyVUqSTlwaPxGYnuJe7Rk=;
 b=Hn14y/ww03dJtOTwM0X8tteSgiTqx0l5UpAB5SS0tpmCSqfyiaX3rNkYlwOizCr9KzZcSGAw7idhu76quC8FQROqB5sq2rpqFY3il3Dfd9jL+DeuN0eznsSuny+kTWfWnXz3wYmO9xIm8slrgGeVKCg7WyDPuxXNZXF1xNa7KFk=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by SA3PR10MB7021.namprd10.prod.outlook.com (2603:10b6:806:314::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 17:25:06 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Thu, 24 Jul 2025
 17:25:05 +0000
Date: Thu, 24 Jul 2025 13:25:03 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
Subject: Test that PASSes but should not
Message-ID: <aIJsb0P4H6S+tO0k@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|SA3PR10MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: db8bb85f-088f-412c-35b7-08ddcad707fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+LRtdat4DA3lytebun9XJFcYm+xN+r0z95gVJuWghOWBbFFRKieoDR2rohIG?=
 =?us-ascii?Q?GjLmYWlljNmLmRkiE9GzR0aCnCD7pQZHFFzOoIgDOcKxdPc9m3khCNtgkXqV?=
 =?us-ascii?Q?vKGd+CGGkA8dodbkOmsbjcftBGCQGHCaYaTI8+8f+S42xXOLo3IvgDUIIYgn?=
 =?us-ascii?Q?eQwRWr8/cUkC86mIlJV0YA9kPfpJTy7x5TaxuftGZxczuVW4W45QlA2GInJD?=
 =?us-ascii?Q?kiLo/kLZ56EK2jHJCaYOL+3vpvcfmBNQNplGkiYnKDRIlT9ifjM5kxiCi7Fy?=
 =?us-ascii?Q?Qu/WExL1Db4logOdIFoFL+7ojCcOsrP0tT+7jKJlel7SbE8RDU3wZiwFnMtE?=
 =?us-ascii?Q?rsRLGQbkjrfG+MTCAOUjDTAR8CHrak7HbLpjsCggoXHc30SlSy+ElI1qqWxW?=
 =?us-ascii?Q?b7lK6tVnO2tigNxYEdh+1of5ZxpYYM/wxqZNiCFxnBkbScCJi1BdL2mr6G/3?=
 =?us-ascii?Q?f4pJfPNhjygFN0hfFqVBsLB4OF7FZqwXVQGH/gBH38yyHjCLBSVLML4HPUOV?=
 =?us-ascii?Q?Mc/8wjjIk3uWhnfQJUxNKVu+QRxP7hXfQrS6VZwVR7eQGK6jtzULXOl2S1yj?=
 =?us-ascii?Q?BuMY7WHM9Mnp4FS0mB4htx/4NmtoRnyHkDJ4RIpSfshz+xz3GoF4bE1cuwdC?=
 =?us-ascii?Q?h1ul/ScGv92/IqSWO7kdZjuAssbPijiCyI47ULoYSu6qWkTlOHhlvqQdaiDZ?=
 =?us-ascii?Q?vUCHrrBVWdfJUsPh0axNIrCyJEFVwow0MigHQbXjReaeUTaw+Z2D0lO2ECEy?=
 =?us-ascii?Q?w9UL/Bvt600koIHUdAXw3VxIDKfPuVP4UphczhY/pVVE+vTZGRbLXRPgB7MD?=
 =?us-ascii?Q?kD9itWpD8vYHSrMjwHDH5lDTDje8G0zoUe1u3F0UDvGWC+OniNsZffCMJQOM?=
 =?us-ascii?Q?k5eB+4ynvpPKxbXZF+b4/9ubZ87ddquqhYHZLozM2Y3eRKEoLU8BOJSpEDPu?=
 =?us-ascii?Q?plhKIflivCUlBL7DmX356Y+6WO8hqkNC8e5QMvmFh11EqczFUQTS62RYpwqO?=
 =?us-ascii?Q?BORVcUSvwC+wAmwtBz0HHjKSITBQowInWM5sv2VrLCvnJFc8MRx4wr3pUer0?=
 =?us-ascii?Q?TDSfBDf5ml7OD28aSga+HrP+OvrRx4Si5mnmtaqo9ZT3MfyvHNRpKS52vGEa?=
 =?us-ascii?Q?y5ZY/ktsnjQ8yB+MtThYBwx/n71VCNJyc+wPoucu1qt2ls6qshbgivtUI+0P?=
 =?us-ascii?Q?jHaNN503MLQ2opXLc8eowG0rJ7MB/qE/ux4jhxdS7ZoMOCAT9dLwn1U72r+S?=
 =?us-ascii?Q?EacvR9Cmo+5gQEVRhqVg2iaBqUe9tEYKRn9pJB0SK7PhmrDWnSm3ZR8vI9oA?=
 =?us-ascii?Q?avH24AY0R+U2BUQ9g4cfcQz+s8pk5Lvc2vWWO6Nop7VUFJzYEwk3fepOXc5g?=
 =?us-ascii?Q?zkIDiCgFVLoSVxNlfnYEeV0mWTtjpQ1+Q1BlPxEVdJmtgUZXgVvaST7U6HAd?=
 =?us-ascii?Q?s6TW0aT70jc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XFo+59dJx+lwZilgPsOuemrCNy1Q4z6pdu16YGddu1IMElhMXb41JaseDNLI?=
 =?us-ascii?Q?+E7DG0PR3IHEeKkXnp0nwLvRqDmKm9uHjEhrdDHwH4IlTR5u1bcg9IhxcOsS?=
 =?us-ascii?Q?AklecQExyyofNK4jqUlP6wwh7gQQ07mA/CSYA0nx79MaFEiNuMLaKHk94hMq?=
 =?us-ascii?Q?FQzmkTdSZ212E2akTCCo5pYy2JaRpZadrmIqiC1TIV2+GFEq1vzEg8H/gmq9?=
 =?us-ascii?Q?LTRa4pC2amJcHYMMOCc1G+YX8T+aCDWEmxxNcSUUgBht0A1TDSXSyV2AWr+I?=
 =?us-ascii?Q?GEfTf7v2ib7pjP5HRkd6oeZ1A4KclEtlrMsfpGLMB8LCaYSN1L4ZN4Xvjfwz?=
 =?us-ascii?Q?l1UweKqeG1KbYfKIED295SKuPI3LeocLU8xoLM0i3YmUEUpsraFIXbPCGuYj?=
 =?us-ascii?Q?Cl0cfso4oVVg4KVWQEF8U02Pps6j5K+yYw2zFpW3U6CMo9co8ZgmYr60/QFU?=
 =?us-ascii?Q?VsIMnhr5rbPNl3y1rxGEnfl4RBrr2IUlvOFpLpqiUrFDF3fAtYSSH2Qv3H5R?=
 =?us-ascii?Q?GB4+EDOxmeM7UhrYEQnehg0wXEZZ5WkOtaWA/SKRepLW8/Yc5InhPwtimmlX?=
 =?us-ascii?Q?qgVwV1rUygiNi888sobPKn/kVJmsMJ+FPw2ixirlRpQLKkGd/T05iOKi1Ygn?=
 =?us-ascii?Q?OEpxQ6dtOR3/31DFAA38eC0o+rkqJP/yXlaBiT8WFd5mraID+RLaKX2iJyKL?=
 =?us-ascii?Q?OQjNnpG5P44khQ1WaASSD/Ycu27E5JrURi0ydVw2FbLsYxzt4epLh2wvSeSb?=
 =?us-ascii?Q?+pLD0xPgMbwqboW3CETp93/sKfjmDDmWtmlJxnbEp0Qal0FedTM3A15mIVFO?=
 =?us-ascii?Q?V8hOuu3Puklh1wzH5hkdwc7oLjcjyxh0M3N3/4+IdRMvWB/1cdzsJRwO7tr4?=
 =?us-ascii?Q?hW5DGuDnzdn7qJ9910VmflToLCZruVQ4S1a4B0qCbPVgGfbs0lLg+Qp+Ja/g?=
 =?us-ascii?Q?UQPpQNylqMVc30pX8DrGkNqyud6GAhxnF9FTxnxjhKqlGkJGwkgb5Lyqt1EQ?=
 =?us-ascii?Q?ipVCaJE5mgfwIzcpKK4tL/UKEMllQFZPxPeXj4JTM2QkK7clSafu7xZHcRel?=
 =?us-ascii?Q?Hjx2LSBK6GC+GYA1RDSJgILvUaNhaRs9QKsmwef7pN4zGO6ROgbB7UTwtLsI?=
 =?us-ascii?Q?arYz9Ugoxbe99ymEBSfr2ne/CNJK59auwL8KVy5VYQsMTqClQbp+skNdWxr2?=
 =?us-ascii?Q?GzWgkKyVjUKjuB53JZRaM160xxp7P5RMgEA/R0mcCImGlbjIXwy+LS1DGF5u?=
 =?us-ascii?Q?TASfEbj7OQ7K5zb7ZtJWG2T5PhaJ6lsSTC9rvfCykaWYx2Bl8nNiO7Uu8dyj?=
 =?us-ascii?Q?64u2+1wtlyoio4gYRBYAIWCTcIZrl4GF7crsiIsV/kWVs93p3wqNpEGbz92c?=
 =?us-ascii?Q?g7CHgQ6SMGlhBAMw5mZCwg6bhBqLFv/E6g7AQvt1JvyxEWhKv2Urns2oaIUB?=
 =?us-ascii?Q?J7PF78yN0jxpsMQCpe4Z4ayAWvGWUgS6jzKMOFMB1r5+99ETPzccKTVXrTbX?=
 =?us-ascii?Q?KqG7a9KMFiMlXKyHZIVOom7JPUNpCq1lWMhfR+A9uR3SzFE6bsIW0Q0/xtWF?=
 =?us-ascii?Q?OcJ3IAqnGAAslltnG8SlcP6U8FW/AOO/DUxQS2o4miIy5hte02DtInIPsuTa?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0BclZa692M55MRJ8fSZZAh0hrZ2aAIUKgSaHIyuAK+Lis3/3f3dLwkJYVm3jvq44VCyIj/w2Lh2vPZZVkTzlfSyfL8RP6iWgmjG3i6ZOyoRuOagwentlj1BgVUTZapBfWCEPixXa3zLbqnCsHL7rIOyEH4XAborpYNY48zMamfAyV5I5ajp8KgUb16a2k/WjDSEAQrIAqXKWY6F6rduB3i2L+DrwSKkG6FbzMfd90ksIhm65Vh2U+1r4leMX+ZvV1BLoS0vu9Jo9dedT1+Kr5lE4KAeeot9X/lR1aeCd8yz2dcHYcmcMJMRhP4Tz/Y/1p1DPqrP5NYt2F+PO+XM4jnyK1rruSs3/az+kqHcvNLG48zUzd4hwm4mcr8Mx5y00dSKLQa7fnaT7hjMAYiiMx/JOMomdPGdjErTDEOlzke7WLIYghKZUHwgFJyBkmauK1I9lIFSI4tptjVNpdRjrSAr6Kd+OGTFeUzdHCHba4Dv9PUZntPEd6kZ3M58VqzgsEhTVpXg6At8NeiE0+ewOAqRz95uSqwQcY68IszhRoCGHyO3ZPGSyyX4hf1oh+VcGK4akyr1eLNyUprVHSIAuaENKt53gBVewbSMW6rzrYmQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8bb85f-088f-412c-35b7-08ddcad707fa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 17:25:05.9229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySddIXbGcrv2YmEMlVgOC4qCgmRE2JOqPuT3f87xiEdt2GVE3s8PQvgIQY3DKGYut+q/sr6rSFng3d26FxrxwyLYKz4M3fkC1wdj+onGE8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7021
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507240133
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEzMyBTYWx0ZWRfX/wNT0S7wAtz1
 7vh9cFgTZPn1xADwFj2A2a6ZPyOq8e15opWGGVtM8pm21HLz1HchdJHdzMk/hqTsJ71AbdQoL7r
 gfDYqLFzTZJY0REh+qQkdjz3dp5KwxafN9its6XGsgZD4GeyIQkqu9bcG1qusA05ZvwJV0NEE48
 0L8l9EHSA1cGyKJ7Z1kKGoKFYlnHRhFNMb9oP2BImfTpguRE84FD0gH1bI7CIWLNUQI8USzbZem
 FE+GqifDXbirKXUdfCgvCtPVMWvDQ7AdTH2hsiY2pASsg1On8+DOmwgdQ567P/IXEo6jld2lP1+
 +2UK73QOB+ZilFeTtzxxih1pZqM8Ky+eXZfPha+SJAs6HEZGQzGUnwMLc5TUPHSc7CIlJ9OTeAB
 +NOjtcnl6NBTgR8Jn3xXHeuzFaQjfvBeSVdITDKcTnAJk+DfJfUSDIhLUalHB1nCfQPf+3hA
X-Proofpoint-GUID: UHc9Ajm4NLx5h7o8JhHYJ5_bOmcU0mcq
X-Authority-Analysis: v=2.4 cv=IsYecK/g c=1 sm=1 tr=0 ts=68826c76 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=Af9SKPBPNaooX4pdka0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: UHc9Ajm4NLx5h7o8JhHYJ5_bOmcU0mcq

This is not a good thing:

test/unittest/ip/tst.ipv4localicmp.sh: Running timeout --signal=TERM 41 test/unittest/ip/tst.ipv4localicmp.sh /home/kvanhees/dtrace-bpf-user/build/dtrace
PASS.
-- @@stderr --
BPF: func#0 @0
BPF: func#1 @154
BPF: func#2 @1121
BPF: func#3 @1136
BPF: func#4 @1350
BPF: func#5 @1355
BPF: func#6 @1438
BPF: func#7 @1453
BPF: func#8 @1667
BPF: func#9 @1706
BPF: func#10 @1746
BPF: func#11 @1926
BPF: func#12 @1995
BPF: func#13 @2064
BPF: func#14 @2074
BPF: Tracing programs must provide btf_id
BPF: verification time 33 usec
BPF: stack depth 0+0+0+0+0+0+0+0+0+0+0+0+0+0+0
BPF: processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
dtrace: could not enable tracing: BPF program load for 'fbt:ipv6:ip6_finish_output:entry' failed: Invalid argument

That failure definitely should cause the test to fail.
