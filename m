Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065AA4A04
	for <dtrace@lists.linux.dev>; Fri,  1 Aug 2025 19:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754075794; cv=fail; b=mtDMEiNeq5HHhUtvx4ZRD268LVqK+C3n5e0SvtjEGM1M2t9ID6WAKakxWq6gUCYLQqSKtSkcbcOsq4urBJq30RCKSLo9rddz9q6l+U+Ersslgyw913uhYhupZ77wDkYlGgPEzN4Ci0zSrWMd7NcvUAl3Wzxrogn3r3fIWDGsejo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754075794; c=relaxed/simple;
	bh=VFSnwe7PDMmccd4NfX6/UcYqvP7PYma0exvcQnPNfEU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UCQMq7QKD/BNRkN/xnf8rfiI8xAATTNhlm85xx5Xatg++V4Q1KhAZ9Zl98faPhKuMHCbtc/3Ch/hvu/fkJDsISSD36ezGsix5RBnm7d6JuaIt2A6bo030LYmEs6qswZmMx9alv0KV73KZIpvSmnDeMBcP/vXfvyTK78jHkdTjN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WnfINODF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ugCh/k+A; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WnfINODF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ugCh/k+A"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HtpHo031131
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 19:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=v8tAt9Jp7NOfgeO7+3U2rrp/Ru4NGuKBEKpyQIVx2z0=; b=
	WnfINODFxl6wguOH5j5D7eYFvc9kN5g9hdoCQo2I5XNY9EN43GF2uXjEYPPRKOoB
	QlUyqGxcagNOwcXCD6OGR2LlJvV4EaGes5VjC5RciBvx4bUhW47zhkzR5jij6RQq
	OyoTUrnc55JTzOsqDsZDAPC5jLZQCcMcsrIEhfr93eGZKc5C59RcsjmHIlQ6Ry8E
	o6tWvfJQaZeUk54IFPrA6x+eSmLTUdTdaYdG37od+1wlFccuEgx3BFAe+Q9LtmB0
	ByAOii8X5+JBlnYxdcTlb7hFnzVllQzr+QbNhkXVGiWuhvSxk2XX9K+Y+vZFZoSp
	VPJLwwGa+Y+O/z8kCM3VRQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 484q4ef1pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 19:16:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 571IjngF034377
	for <dtrace@lists.linux.dev>; Fri, 1 Aug 2025 19:16:31 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 484nfed2nb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Aug 2025 19:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXyxs+Qlr8B4xR8HPMvRFAAv3oqucrYaq1L8XRS1h2LfCwwO7TZytd3dQTMPImpv/D9rhkeJaeJRQGV+RlBq8XghZLKJe4cnYNrDQ8SSSCFEMl9S9m2OHq9aJXLXG4u9JUIwGhpxP5BY/Q4qT1x4gVCdIDHyuuR1JPAw4sqqxT9JG99LNfv/yJOrVHDGu7Xkr9Oadi8LI5uhysf+Yzo/ot52OehzKhlmhNxGKQiGWhPcvwTFWG72Y3ya1LsT07q7ciJkr/yi95OIQblysOtIBuoTN3Edp9AuUda6x6XVG+ggw5NTUasnCu6FBnyxQFf9h3oHiQMc1rrFYuueXzMpCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8tAt9Jp7NOfgeO7+3U2rrp/Ru4NGuKBEKpyQIVx2z0=;
 b=nX3GzWCFOUtjOWsasJrMWl2du8M1SdvN/7IMzXV+TDG2uiHm6qZeNGV9Rb5Ccx3f5gAqpGYXdO/I79IwBbV7dOXjIkP3yciQU0YUaZB7pm2eqNL5BbAX2aBNSTjOIZz5wZdEMar6GXZh8nA6ICSREJ6qteniXFCaHMZCTAJys+vIA3+5+lgbXW4SI/Z8eMn5w/c7c/pHKqgLUI6j+StsdVrygLMacASURCT8fo1AhOKoPj8rwPkmKw/HCCkTaM6n56ooeOH3h+TgoYbyEh4qZmYa8/nWeWDflF/bwuNloazipepUy99IW7gCgwnUKCmUqbZK2AXbcTdvgfR7mgsPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8tAt9Jp7NOfgeO7+3U2rrp/Ru4NGuKBEKpyQIVx2z0=;
 b=ugCh/k+Aj8xg2GKxTjF31XCwBiLYWYB4I/N7vhkXF3Rway4+EQMtLcKlw/tE9/w+Fx2FA1NiH16O7L57uO78NLOxJCzPeIk5ZM1vhZUbcQ03pt4rGOppSzTIStUXvuQdtMG9IN2swLwhCQm4BX1OV2B8DbFPkSNVKxCJ6yZi9EU=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH0PR10MB5210.namprd10.prod.outlook.com (2603:10b6:610:ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Fri, 1 Aug
 2025 19:16:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 19:16:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Need -w for destructive actions, even if clause is not used
Date: Fri,  1 Aug 2025 15:16:21 -0400
Message-Id: <20250801191621.16847-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH0PR10MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: bdadf2a1-2e43-4e4d-1243-08ddd12fe825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T5YYKGogbH2N2yAU+2EgWPgIevsLhEwe3ob+12wwKKGdDutgcsdOISUv+Fpn?=
 =?us-ascii?Q?QnwSyIsT99EjNbgF3Ru3IGu0NKRfpxl4p0ztf6X7FTgImocp7pLoOj5Gmnnk?=
 =?us-ascii?Q?XpAoXhK3lqwvR1V82QFCYaF7WQummsNlhXFcPJoc6al/lS+BLxJL29OsKiXf?=
 =?us-ascii?Q?K6mDAgXRhADkUrd7IgyXX0swkllj70jGF0nJba0W4T8Q+8kqxCIrzCQFurIO?=
 =?us-ascii?Q?ZNCKo6dABVp4k8ufb3Aps22Ty7boo9jT7VAQ1cZ3k1o2a+Ta3jhH1z4+34aK?=
 =?us-ascii?Q?9FKdMZJzrixhXv4TkbTu8KIbfLNAkXDSRULgTjdx8v/Zx9gn2h9eBw4eNRNS?=
 =?us-ascii?Q?rZYIobWSDRGYCDrASJTvelX/UKZYRzbL99Rrjxgx0+J3FQpeZKdK3RHnwLMq?=
 =?us-ascii?Q?r7YArfkfhFiqsVPqLHxNHk67yYhv9FTzAkPtaHV6erGINVKJASqUcPvd9YUe?=
 =?us-ascii?Q?s3v6kFfG2e1Q6KQvDtt9RE556egF5DhP3G3Cm5vLyRyXDS6E4od34CyEZKw1?=
 =?us-ascii?Q?ojtUASihYaUr7qZQ4EWE3xJ8vEDAuGXlxH6bZqMdBN/giUTXnPku4QlG5ihT?=
 =?us-ascii?Q?kHTaKaxMFht/Nx71eyU+GgaXEa9neN6IHF+OQnIZNtKAtwSvRomW4ximqxto?=
 =?us-ascii?Q?G1sjnf2ZRWGb6YHJuPa2dhms0mIvLCd4T4OUtAN2bxW7W55IuRHNSAKorhjl?=
 =?us-ascii?Q?TJjLeEkF899Ky/3i6jKiJ+NCCYldXpy1sOsyefzk3WBvcYYSoUxBpRaL7R54?=
 =?us-ascii?Q?2yxre3Fp4XK+ZWr4vJI2hO93Z7/tpaXOtAK0lFDXQWIYeoirtri6WIh50Zd6?=
 =?us-ascii?Q?yP+qqoOfQFpgaA0K05GqaViqNipLvr42eDTI4iUGsVcfXYO94Kwy48iDnubu?=
 =?us-ascii?Q?BaQWIemFP+f5uzq1bUXZYgy4LTzAUHdlQvbLpf2Yy6Ye+Zdz30Rtcbbk6Cj5?=
 =?us-ascii?Q?u2xSu6BTiG9Q9vWjq9pm1W4bwjv07lbc2zofOyW+ONf1ZiYqTd06xsW3emOo?=
 =?us-ascii?Q?jSjceYXgcWZdwZpUp9tw2HNn54BrCDneGoMyZX75MIuLyka+EuJ5OhF2A89V?=
 =?us-ascii?Q?vtnJa+ShNqwX2VjFvna31UbES3iSWgKkSkf38/GUoywRFd/sqoZueaLhp+rQ?=
 =?us-ascii?Q?kn8MA78WlwDpenifC4k7Sn/O+gF8WdBUDSKfxcPvwk72bt5NtYsRaH536gsN?=
 =?us-ascii?Q?tEJ/S+9ZCg1k4qiE69UtizVGXotHKxeu4ZsPLITtdvtzruO774GdoqNIL4/U?=
 =?us-ascii?Q?04TPmxuSRtAu4U0ROHWFIH1n9PX8gNIh4Kqz7BNxowPDzzuRr+6MaOg8vn7i?=
 =?us-ascii?Q?bdWIpZm547JvZ9VvfI6nUvJcd1Qe4lJjwkFWxAvQ/HSaOcmSqzHeddolKh7q?=
 =?us-ascii?Q?qNalNol2VgY5jNa7AkOdpWYwJTCy5sOfvYCAQUZl2jFxAJJrzYRQQud8KWMt?=
 =?us-ascii?Q?BzcESW0EP5g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WRisO6qFqDn2+q5K8x5ohydKwhildjHZyLJnZEkd0o1jy3PF/gCBtpVgCO6M?=
 =?us-ascii?Q?kxrGMMkZDWGTplyyXNWnbIH6SRpcKERjnouiIsxTZ4lLepptO4jVwp5/Cbpf?=
 =?us-ascii?Q?vHgo3cneMCH7WgGv9PDXn5vLM1vjsjUqI+EdtNgHRzP/As9bdFJNuCC7oFSY?=
 =?us-ascii?Q?O6iZ79zt308AdlWfW1FnZcIuuITn0DMTweqz2kIM4ZMBcIGnLW9CjTo6SuG7?=
 =?us-ascii?Q?sPBkxKGn6bX3ct1S35NM5PnM6wQngEmmwogr0Gbz25wXKicwOKKkMnQqczRE?=
 =?us-ascii?Q?OyXYd1RwU8mAibOEWEC+uVW1doi/tba2jvdDDopE2QCuKyCu3oJbuVdzyJ3q?=
 =?us-ascii?Q?ZjUuBmZJxvOD6wZ26uPQ3nQMk9ioH4JXfBUVKf+9abIwbhhClWqoUb9VLx92?=
 =?us-ascii?Q?CGu07XXbHZcmbKRl4q7MECCzmA6FdLpUY5VHOXTj0sms4SzJGbsak1rUmyP4?=
 =?us-ascii?Q?JWBQjMIKZZuUQ53SGkD3qx7zuF46gGsDbLyQ1mUa0OCLAu1D2c+yGJIPDg1g?=
 =?us-ascii?Q?1VrmLIQ92JI50OBP/01GCbw2DXxniQx8C6ZmduIsJs/2nJoZy/xDTIHqEXXV?=
 =?us-ascii?Q?WLW/zLjmXdfKit3AlfC+HpZx/kxkQP3ZkxvrwxTAea2IP36Spktqo8wjbE6K?=
 =?us-ascii?Q?PTM3xmOE6M4vtbjWfQjKbEhiqSKupG6SA4IZpplndbDqQz6qKQyya7W3AsHH?=
 =?us-ascii?Q?1hn4wK4vqbUeTEOjXAYkcvW3FWgkv5XEolv2i2DyRIk4UMCK4gYdifuhVVyp?=
 =?us-ascii?Q?DHfCg59ASZiMoBBHd6c84qr5Aw0vg85GovvllXHlwF09x+JfIwB2zRUDuIFh?=
 =?us-ascii?Q?OJRIyxKi05B/vBUG3c3A1LjqEGU7WLhElWGASfWy4xupUgAiTdAHpkYSyB2G?=
 =?us-ascii?Q?P7OvLC9K2RW4WhhoH8dd9XHvy6EcUujd7qKtO2DWZSUoxTWKMt0AFTbHdipt?=
 =?us-ascii?Q?xhbn5eW0JDLSK7xFtIzEctv93XTURmvqT/qR188kyJqpQNH7fl3v4hw8tATm?=
 =?us-ascii?Q?fEoaotm+yjuo6VSwuQGSVpJkS4P+1jRM6PeEcWnmK91NDM/JjddlFTuhy0nK?=
 =?us-ascii?Q?DnTVnk4ONQfpBOyjeCq52WrMfYp3JjS2tOq5Nota9VayGyceGiF+BWYivJot?=
 =?us-ascii?Q?+fX+CqOFT6Hw2DN3pbCNECZcz0gTJupkexobBtn1GQxIIRwB6DQLp68WJWyN?=
 =?us-ascii?Q?0/NSTjb46SnObubHikQVdDHWFv5XnCPEyozN9H6IW6GA+4DYS0vhNFR1nT2l?=
 =?us-ascii?Q?Mr+YK2WCw30fuURxx915r0fEs/a9O/Vre2n5tQ3tffkCuhEIxemQX3NZwLRN?=
 =?us-ascii?Q?WYXYBV8bu7K3CoGrPU6hTMnnydk2FLgxmSu5x3qllN9vMpGaAjJw/vnPGeL4?=
 =?us-ascii?Q?MhVCBn3GO/jUPGfWp02SRIziOSthGwD6WXDdFbRzjhKwBV5M7fndn1ft5pvT?=
 =?us-ascii?Q?EnwmPIVb5+bs1qpJgPCMpVz36CbIH9s8htz0LQkGTaN6VZY9Lnshu90qxhm4?=
 =?us-ascii?Q?K/3yriN+VOzIsp0ywjPtIxzCP3cvBQZqvkE8RxBwjwu1ozxBHyjznLeOnzgF?=
 =?us-ascii?Q?Tpj0d/5vs8HlaGe7r7WvazuCvcRrKlMgBgU0GmxE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LG5o6oN3Rs4vjS79xmhcMjSsw83hq3yQJeBYa6njuR1YKbkHVI/+atWh4XZ9jcoOcEZ9jwAiNzexjortA0+5r5XzGonyWgMEKRrC78gJuFwrjQ/lHNft+OcFwqspk6k/YovSlXNl4ERVk4XbSHOFRifUDOT90xEa5K0JoMYoTtJ/iWpoLhsjZWDUh6Swu+PujZMeQjntWjNjztZfqgYg+M4u5e0s9cKi9EXGVcz3Chx8HmmKZtr1Vq4FLmK9VShYSdEZi1P9/DHfnEO5mrikPzmaMQRZsR2GL2O/duA9cAvJ2Nk01vMnigLisdqppVy+JG6zyPkFHNXhJv3yBc8cTPJxgzDWLWJIOLOE7a1/DVMkeEiNS1FRRU6JZkMMDf5/NmR4o2qCsl48J9Rk7LU6LzSKkR0G4JJCfRcInVsLh9emSSqaOX2WK2KRKpoI3pEGU7yl+HT1Fv6fGcdiBjmgzjsMEHIQFbxzF+1PwMDmS8YJVH/HK0/XK2/QmvcRjVykVFbTA+ZPqnHi/P96dbOssjM3UBqCPa6duKh38Vh/GIbbMM8PbUcsj6DCcaxlf/tf1Ahunv5v4Tx1CafGfk8FWweNQL6S3aiQTV28Cmd6hs0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdadf2a1-2e43-4e4d-1243-08ddd12fe825
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 19:16:25.9140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zm1VTjQA8bZ9U8QTG4acaMU+L8nAd9xoLzEupNQLDxLSx9anIlIUXMtO6I9Q8xLmk3sKUclwMBzTjeYblCbnCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5210
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2508010152
X-Proofpoint-ORIG-GUID: 6m62RkCWUjLaR4rLuBSTpYfdueFe_X-k
X-Proofpoint-GUID: 6m62RkCWUjLaR4rLuBSTpYfdueFe_X-k
X-Authority-Analysis: v=2.4 cv=QZtmvtbv c=1 sm=1 tr=0 ts=688d128f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=u-IsWzi3DQYiqw6rGxIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE1MiBTYWx0ZWRfX6PCXjc4Ed+h4
 gqZPVVUKiWZUY9Pw2OdzRp+NePrqr0ToArSnDAnCmFb1M1qXfFCjcMnfHXWtytDwHpO63tdtCU1
 3fSsIpYYxSqNOP0Wqb4gqEV/QCv5kjroAJ6QMJ5SBZCMNlbNtRi82JL+iO9iA9kNt9jzSoe+HPd
 XpzFpIxu+JjqT8FKq6m/JAOkrzdDbijhcgT+A0o8k7FiNAIhOkSB0bACrPp88y5adNnimACv54q
 ks/j9QpOI6gffmG+QIqKtUsYNILI9SLybCfID4CqwtwelglJCfXCvV9fT3XWIVLGKUTEv2Y5fW8
 1vz09Ehn+qsGzoGKBS2ZjcIwIV3RH9EDJmPZbpcgkIkLsus/nbJtq4f5CtdsxIddSS86w38xrpN
 KyaPsPubgSaMJdAb80Dh/swiFfLmoFtWGJozOpRSyThIVA9UxI6qZK1DDDJfYKOA3q1jCj5W

From: Eugene Loh <eugene.loh@oracle.com>

If a clause includes a destructive action but -w is not used, dtrace
should not start up, even if the clause is ignored (due to -Z).
Solaris treated this as a runtime error.  We should do the same.

The test err.Z_no-w.sh was misguided and is replaced by a more
direct test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_bpf.c                            | 15 ++--
 libdtrace/dt_cg.c                             |  1 +
 libdtrace/dt_impl.h                           |  1 +
 .../options/err.no-w-or-destructive2.d        | 26 +++++++
 .../options/err.no-w-or-destructive2.r        |  3 +
 test/unittest/usdt/err.Z_no-w.r               |  4 -
 test/unittest/usdt/err.Z_no-w.sh              | 76 -------------------
 7 files changed, 40 insertions(+), 86 deletions(-)
 create mode 100644 test/unittest/options/err.no-w-or-destructive2.d
 create mode 100644 test/unittest/options/err.no-w-or-destructive2.r
 delete mode 100644 test/unittest/usdt/err.Z_no-w.r
 delete mode 100755 test/unittest/usdt/err.Z_no-w.sh

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index cbf59c1d9..8b617d65e 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -1343,6 +1343,15 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 	 */
 	dtrace_getopt(dtp, "destructive", &dest_ok);
 
+	/*
+	 * If we have any destructive actions at all and -w is not set,
+	 * error out.  Solaris would reject this as a runtime error.  So,
+	 * although we could have detected this problem at compilation,
+	 * we mimic Solaris and wait until now to report.
+	 */
+	if (dtp->dt_destructive && dest_ok == DTRACEOPT_UNSET)
+		return dt_set_errno(dtp, EDT_DESTRUCTIVE);
+
 	dp = NULL;
 	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL;
 	     prp = dt_list_next(prp)) {
@@ -1362,12 +1371,6 @@ dt_bpf_load_progs(dtrace_hdl_t *dtp, uint_t cflags)
 
 		DT_DISASM_PROG_LINKED(dtp, cflags, dp, stderr, NULL, prp->desc);
 
-		if (dp->dtdo_flags & DIFOFLG_DESTRUCTIVE &&
-		    dest_ok == DTRACEOPT_UNSET) {
-			dt_set_errno(dtp, EDT_DESTRUCTIVE);
-			goto fail;
-		}
-
 		fd = dt_bpf_load_prog(dtp, prp, dp, cflags);
 		if (fd == -1)
 			goto fail;
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a1eff8efe..0593a497a 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1876,6 +1876,7 @@ dt_cg_clsflags(dt_pcb_t *pcb, dtrace_actkind_t kind, const dt_node_t *dnp)
 
 	if (DTRACEACT_ISDESTRUCTIVE(kind)) {
 		*cfp |= DT_CLSFLAG_DESTRUCT;
+		pcb->pcb_hdl->dt_destructive |= 1;
 
 		if (kind == DTRACEACT_RETURN)
 			*cfp |= DT_CLSFLAG_RETURN;
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index bf4f6c7bd..7300af6ad 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -367,6 +367,7 @@ struct dtrace_hdl {
 	char *dt_sysslice;	/* the systemd system slice: set via -xsysslice */
 	uint_t dt_lazyload;	/* boolean:  set via -xlazyload */
 	uint_t dt_droptags;	/* boolean:  set via -xdroptags */
+	uint_t dt_destructive;	/* have any destructive actions */
 	uint_t dt_active;	/* boolean:  set once tracing is active */
 	uint_t dt_stopped;	/* boolean:  set once tracing is stopped */
 	processorid_t dt_beganon; /* CPU that executed BEGIN probe (if any) */
diff --git a/test/unittest/options/err.no-w-or-destructive2.d b/test/unittest/options/err.no-w-or-destructive2.d
new file mode 100644
index 000000000..c0a8486c2
--- /dev/null
+++ b/test/unittest/options/err.no-w-or-destructive2.d
@@ -0,0 +1,26 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * ASSERTION: Without -w or -xdestructive, destructive operations are not ok,
+ *            even if a clause will be ignored (since the associated probe
+ *            does not exist at the point of initial program construction
+ *            and loading).
+ *
+ * SECTION: Options and Tunables/Consumer Options
+ */
+/* @@runtest-opts: -Z */
+
+BEGIN
+{
+	exit(0);
+}
+
+bogus:bogus:bogus:bogus
+{
+	system("echo ok");
+}
diff --git a/test/unittest/options/err.no-w-or-destructive2.r b/test/unittest/options/err.no-w-or-destructive2.r
new file mode 100644
index 000000000..1a6959475
--- /dev/null
+++ b/test/unittest/options/err.no-w-or-destructive2.r
@@ -0,0 +1,3 @@
+-- @@stderr --
+dtrace: script 'test/unittest/options/err.no-w-or-destructive2.d' matched 1 probe
+dtrace: could not enable tracing: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.Z_no-w.r b/test/unittest/usdt/err.Z_no-w.r
deleted file mode 100644
index b81622481..000000000
--- a/test/unittest/usdt/err.Z_no-w.r
+++ /dev/null
@@ -1,4 +0,0 @@
-dtrace is running so start the trigger
-dtrace died as expected after trigger started
--- @@stderr --
-dtrace: processing aborted: Destructive actions not allowed
diff --git a/test/unittest/usdt/err.Z_no-w.sh b/test/unittest/usdt/err.Z_no-w.sh
deleted file mode 100755
index 4f129341d..000000000
--- a/test/unittest/usdt/err.Z_no-w.sh
+++ /dev/null
@@ -1,76 +0,0 @@
-#!/bin/bash
-#
-# Oracle Linux DTrace.
-# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
-# Licensed under the Universal Permissive License v 1.0 as shown at
-# http://oss.oracle.com/licenses/upl.
-#
-# This test verifies that dtrace will not run a destructive script
-# for USDT probes if -w is not specified.
-#
-# Specifically, the script is launched with -Z and no USDT processes are
-# initially present.  Only once a USDT process is detected does dtrace
-# fail due to the destructive action.
-
-dtrace=$1
-trigger=`pwd`/test/triggers/usdt-tst-defer
-
-# Set up test directory.
-
-DIRNAME=$tmpdir/Z_no-w.$$.$RANDOM
-mkdir -p $DIRNAME
-cd $DIRNAME
-
-# Make a private copy of the trigger executable so that we get our
-# own DOF stash.
-
-cp $trigger main
-
-# Run dtrace.
-
-$dtrace $dt_flags -Zq -o dtrace.out -n '
-testprov*:::foo
-{
-	raise(SIGUSR1);
-}' &
-dtpid=$!
-
-# Wait up to half of the timeout period for dtrace to start up.
-
-iter=$((timeout / 2))
-while [ $iter -gt 0 ]; do
-	sleep 1
-	if [ -e dtrace.out ]; then
-		break
-	fi
-	iter=$((iter - 1))
-done
-if [[ $iter -eq 0 ]]; then
-	echo ERROR starting DTrace job
-	cat dtrace.out
-	exit 1
-fi
-
-# Start a trigger process.
-
-echo dtrace is running so start the trigger
-./main > main.out &
-pid=$!
-
-# Check again if dtrace is still running.
-
-sleep 2
-if [[ ! -d /proc/$dtpid ]]; then
-	echo dtrace died as expected after trigger started
-else
-	echo dtrace is unexpectedly still running
-	kill -9 $dtpid
-	wait    $dtpid
-fi
-
-# Tell the trigger to proceed to completion.
-
-kill -USR1 $pid
-wait       $pid
-
-exit 1
-- 
2.43.5

