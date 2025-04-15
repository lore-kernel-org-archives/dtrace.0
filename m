Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C625392D
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 20:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748405; cv=fail; b=hJMCyAjxadURphhsS1n1whAIApqlIlxiMpPgsTTRHl4vWxi5zP3b+v2ZR7KQ028a2HNYEYiPxVUmuimJ8pSOuPtT8aqLOaibRGqRveHuD/mBRaGyi0HYNMtvJWk/fUFbBK6kDIqoP/ahwOilGir+wweRIJEln30DQxEMndpaR+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748405; c=relaxed/simple;
	bh=HHCxQX1hvMTgXGZIfgA4NXm2j8ToyoNLgAw6SESjLbQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tbzXZpZRNeuaz6eZtodCzEsjJFAvQKDit3h1b3bYiMp+LN1cwmiOuDN+P7xQYoBD3CsUIDKtd//7A4LTOw8tMJfKu7Q6rBMuN63XGhhzN2XLH4TbfHkUGbzaW8hgWDDmhQk9FbKuYk7PjfqR1LGdCkuqKtX0yWAfWHlNTWnmOT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NhimNl8V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=haPVeAwU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NhimNl8V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="haPVeAwU"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJiDne006525
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 20:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=wGgoQph3+7Lxr774cuvwxx2XgrJUgiEZnVa6cEkqyAA=; b=
	NhimNl8Vj4HzTChUGlK9l+NW1sm2uyssGzvHZnK6D6JPXPtYfcncakGITTvYsR09
	fOONUfDZXEiZEb4b7fTMi/zsS7XICBfnB9LHxvnIca6VEzTD4RhrZW97Iq8Rr2fw
	5dy/8F0t0WrCpi5UAKKgKS3z/vZXv8N94Sa8Z+szc6UgJx/x63/gWG/wkeGhwV3E
	JOoRBsU4c63HbR57/pXZjiu3jwPofoKGOnVaiaJM7lUTfCLEOyonel/a0Lolq+Mu
	rCkTCgvPKFpVrCgux3XYSGxHCbcdSMrkpR4mq6tvMQFoqkbu+06Gt/8yBmPkWVVX
	P0cnCZr4xqzKiAhoXs0lQA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4618rd2hth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 20:20:02 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIdDsZ005711
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 20:20:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d5vuq3a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 20:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvm8FrTNwP8Do9hECy2hV4UX1EnOUTRbb95fCwaxuQZLn/Wz5cVJUtOdwp9vFARpGVhWKM61O4Jxx+rv63nKDkihz1U0qzv8s1Gl2Ib0KYbxtXStld28XdtcFmnfdPSjvc3oZRrDmUgK3nda5Y2MJ1CkNMbEqr8QBMNrK2Vz2NxrpvC1kyzEx02HTOlTSTFnLB1QhnMNWgabbhjpDy3/nNNHwkZH5OuemGhXMcoQ5kzYAD64OlwYqx2xGEWh2mgKLv6KpInVAsPyht59J4vF5it5e/DQ20morFaB1YdGxLJVCAFCes74DjX1+uJ1ySGgSnpNoln5O81FH8XRrfVpmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGgoQph3+7Lxr774cuvwxx2XgrJUgiEZnVa6cEkqyAA=;
 b=ZY5/ZlWcnXJuULuyd4Ypy9rbZAmQW1bAb0++BhpnU7zip45R+MPq+jfIQdCmnLdbxPaqEAgKOW58haEx7JBmEcSiCDatMReYcipB/FqOPiqYs/CXfmxRNypHJu8bS0t+mHyepKbI69VK34DPe5bCdeJ+MCWcdidElKRiQTtlOjZENo/T2cxZ2In1K7nGxKEuP0OHndTCep7neOmcdCrZttNDIqvhVOR1BdczL3tg8pRNhEndq1Arj9s3HvF7T+X0sZb+xWoSFJNYcns68fOSwsz2AW2YdLsGEnYu35ZCqO/YGavnR5NtQ2NTrk12TSxFxRr6j4+bT/lAPv9NCCgoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGgoQph3+7Lxr774cuvwxx2XgrJUgiEZnVa6cEkqyAA=;
 b=haPVeAwUNbw3m/KFDF8L+0AZCYQ6vJcEl+EUU3qZs0iKFOZV+X9SS15SSLbPcEoBoEFA/LuSWutTyOsRdbZDxzXH/mW/0IwAcxstIwDk4YbShYnRbhsTFqY+Nh91FSlcgB5CPo+AY/Z+gK5D3KEJAb5nt1MX8NpvLkOwH3sODfY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by LV8PR10MB7823.namprd10.prod.outlook.com (2603:10b6:408:1ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 20:19:58 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8606.029; Tue, 15 Apr 2025
 20:19:58 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 2/2] test: Skip pid-0 tests on oversubscribed systems
Date: Tue, 15 Apr 2025 16:19:54 -0400
Message-Id: <20250415201954.5564-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0124.namprd03.prod.outlook.com
 (2603:10b6:208:32e::9) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|LV8PR10MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: d5776ea1-50ee-47c1-6d97-08dd7c5ae44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zsdFqng5JvbNg79H+WX7dTBEkPxYq9sl7apHmEw5IaptOoQVZ89/oxT7K2sL?=
 =?us-ascii?Q?0OvMTkcy82wk+U/UO04vAM0oD6rL86xplwVZK3L66tIyq7Astcd+7VYnkoUe?=
 =?us-ascii?Q?BdRIrKeN7yz8kUdq5DGLwUZCp1N6slZW3HIk7woLgdERtaSENijoUUjszzRp?=
 =?us-ascii?Q?e1Q7GTHP9BeVKGcI0Yanxjb/+jBC9QeHfg4607SXlEg2fI+lZYl1al35wwea?=
 =?us-ascii?Q?oVHxIwo7zJbwcIgTe+Kck1GmpclK9iwcC3ZpSTuBDnmio8SZq6H2uMW6J1gn?=
 =?us-ascii?Q?xY5a8sZS8cPbsl70d6tJc6ALRsbBX/fTfSDD04hMwK681kk0bHX/ZG52+ZRN?=
 =?us-ascii?Q?i13GJYBs4UnkvxKQAc+QBcUW45XanZdvTU21DaEiEVBdXx5iSB1lk1iGqWzc?=
 =?us-ascii?Q?2YwT8x4YRgVOAEXco5RyzDTAxLXRzXjtrt3htzt3x86pGQmoyHUEjsAJqgzl?=
 =?us-ascii?Q?x/pIETJoSrcNMX4JyqWQ4/OgKa6TZuRALgpmTpF9LUsefvkpeTUm6RvzlaKt?=
 =?us-ascii?Q?mqC8WfcWzCjXZ7VnAdBi0xKXRh8V6d6oIYBwNDNCra+j7l99jjxF2jZ4hsBB?=
 =?us-ascii?Q?l1C5cFe0APb5pGumodYPyINJfTKAhwaLCYSMP7FncgqZeBQTLc/hoATSLZwn?=
 =?us-ascii?Q?k3ArHWYFnLBHmkh6QdERBfI1PghgspY9SO59OoB1aB+YnGeIHamNz87lafKy?=
 =?us-ascii?Q?sBMPGfNZnX1UWlU2IXPaM8ED9TB0BI+CDr7KNf3ViSb24p+KUojjUw6bEu/a?=
 =?us-ascii?Q?xs96cL3TEHeYa70zVkQLBgKuXDoHlx7KRj4nNpf1WgdtpvYGLDm9ZXxvwBN5?=
 =?us-ascii?Q?CYPgWkWbm6O1XiDj8JVW/HFK9ZsWt9PvqblFdROT3HV6/Tq/UHkJTCw8egU+?=
 =?us-ascii?Q?JbRUUQHTGeqCnIW0gybgtiwoaKwYdFpy2Ia8ll4ToHHCuGcREElK+6N4jgkY?=
 =?us-ascii?Q?wJWpl0XgvMeXmLifJYoWKj/E4x+KbyMPPGAKwKV5m8HF3nDdGDsU8dVIEDGQ?=
 =?us-ascii?Q?G7+Rzee1dBaWmFhK9UhHI+glGNBmqrW1OPSEmgOzQDSlCyf+5CXPKhgGC6A5?=
 =?us-ascii?Q?tv6t5QHVUBeDMGSeJvJU9K8iWDepk55qdNvsaSjaAtn10lBsSwqx8NpuhUEa?=
 =?us-ascii?Q?NTN990vjm7Px+mZJfObbibCoU7I/b7IPgpfgjmuJ2sux5mJkv3rrY3D6AoK0?=
 =?us-ascii?Q?IlyFPCIftKHMZ0xJKF8ggDPVjuwN/JD+HyCe+Q8cS2oOulfzQAr0ayS5faLs?=
 =?us-ascii?Q?yJ7OUr+9bC2C35FtMESrgLHTbhc2Us1y2fGB31FGQFDxnj8fhJHL2/ficwdV?=
 =?us-ascii?Q?9Atk726zNzOI8tOcp8D+MYkkJaJg1Q/ebjYBkdb/3Zw09dcX7w9hSs8Ghetd?=
 =?us-ascii?Q?c/LCyyzzBl8sVntvrRSgdIswQuWXP+AxdnFHczjKu5FnuiDLiQruyHYwkJL4?=
 =?us-ascii?Q?3RVHpm2Ttog=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X965KelhUk6sjP3v4oATwlp/GIJBBN5qkM84Qm07taaAnTRfObUmP2xyz9/N?=
 =?us-ascii?Q?bl8aqdb/fv0p0yHCkVavsfvNWX+CtGLpTHuaeiQmyLuUqBvBU/NXpEFj3lyk?=
 =?us-ascii?Q?Nf/eX61l9bfeSqArf2detpWkMYPkaQ4K4WcmIFTI15kqy44xsDK3hWoUBOLO?=
 =?us-ascii?Q?q4W+9DVjxEyGgZgVtNshJpJ8Ofu1/aiImvPYVMUMo4JocZVpjh8gfh1u60WF?=
 =?us-ascii?Q?M49IMQsGUvDhizgdljFImAnQHbsqD6wdo32VQ2z3NtmWsLf0wLZUFMzR9shm?=
 =?us-ascii?Q?61VA1IH19fsV7mwcP+qZefTdOxk87x8+/IModMnlKpo+mamiTXeaHmleZOdv?=
 =?us-ascii?Q?2xHIJcjp6asKgvuWqnIbT1ByYcyKlpd2c11A54UVgMe9m8kFFPa/0uwxaLuZ?=
 =?us-ascii?Q?megF5SzWBmLkDYflHK9tfalU4qXstpIJ1mzpE7pF3fSkT9LudcX+XOFG+koi?=
 =?us-ascii?Q?E0wwqeLj2fOz93Hzbeqp8AyBq3zm2G36Om0emsQ6KRCHCHD8/z1vMwcCZzWN?=
 =?us-ascii?Q?JU9WMrug/YB6479hXBVOdqT6qQccYQ/vUYkq6bvJ64i2NE5GPX+eeClBJEV7?=
 =?us-ascii?Q?w6gQvny/vAYBXEezcQHu25YiqE/nAURWYAWHvuZ6ZoWZ2wo+h7v6ANC5Qed6?=
 =?us-ascii?Q?PD+mpmHhfbWiJfguBCweZQwXUYg48aWhdL5M6hTfmD7PIuRmIxjxoUKVhGAO?=
 =?us-ascii?Q?49tkVWPHf3X5/jaOpx9vTdJHfUT1iRtB+/zOzvM9kC7nVITwM0+qQyoerX8s?=
 =?us-ascii?Q?LlwetzYuLr/16DIbxI/7cMgIV4hBezCbHmX7wM89ughvbcyXhPwa+qm8AiJy?=
 =?us-ascii?Q?+jG5+l8kJ/y2+Du7yDouLsjHlSU3h1TPROJBwVGpld1tTLpQEK4t9W9Q61m+?=
 =?us-ascii?Q?uxzCigiXQyRFtovHEqSZqVduv90kgXezJ2q6o2Lmom8AgVBdT5XU42KK/ck2?=
 =?us-ascii?Q?YCvm61P3AicK0/KhcSnPBNaZiXe0qX4whc4Q6MgQzbpF55ITtkFvotBaMFd+?=
 =?us-ascii?Q?I33YD3TXVKL2zv6Sj3tKNQEkToI3X3D+sVImrM2+7BuXEZ5mO1ilqhwM35Up?=
 =?us-ascii?Q?hsRY0QUrRXw1XjmIfwqNhqVVfnxWuZJfDXIXyVz/ZxAWhAkbF9DyWEHNbsXu?=
 =?us-ascii?Q?Pgh2NhT8G69mwcuLfdnLAzMHtL+cuvfIoRWe4Jg5NHpOhLhQRMzhQsf8P7Bl?=
 =?us-ascii?Q?YlZdc3XOhBQdRVohv+BqgvL8wkh7e+GlJHmii0TIlf8k8nuFBzZA1VTCeNTc?=
 =?us-ascii?Q?gJFFd4Vhs5rSvCvpeOxHGAi85Pq/HiAmaG/yMeBYxhGnBkZZWBk13vWY0x0D?=
 =?us-ascii?Q?Sgm1Kv5QFchhUuEDNafhU5pv2wmyKIZRsAKHwFee+EpA1U8MxQ7pvJxMIh2z?=
 =?us-ascii?Q?XX940Ih+hcPvZffnj1yqZ/UaXQCG6f3PE1+ouS9jMozz+jKzk9uB6K7DNCif?=
 =?us-ascii?Q?UAXee87OzLrMmLavZ/m7nRH9lAI2nKoC79ySqmJuCpKKlmtTX72kxBb3s1lR?=
 =?us-ascii?Q?UtC1MNIoNQJjHv2vaH+V5LVGwpm1w/3RptEuKvbFoHXGzgzVQx2gRJbbPSOr?=
 =?us-ascii?Q?RR6nMvtitsBI6jXOAwSAYtE2Mf8opxKgx2AIHBrW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FdOX961+zONkdBZQJPr93s4+1BxBYdlHtieakBTjXPVY3cO8M//YvzGYZUC0y2NtZ0K0k9RP1UGy3ZGIfV47Wg+mUiLgeAmNjPiOsLgx8XEjx1HUfuxnMXTs6JNWqTJjtE5H3C5sxUOQnKpJFBh+kbp2Kji7zftGnkl88AoLaVR+rzpDEC4iKzYp7YllmbVOXKrUSZgjy0MFUJ3gFiYMRdqaJQ6RdL5/VIHnvFLU9sy5meuM9b3MvdMq/ebmLifSJ0jCi4/Pk/kKgAilLxUimNUBcw01oTso1xW5kZbGwWHa/e/bcEauHZ0Lq4MBoMmSCMwAOkOW8XoeCixMDuTiFeYnH42deCpIpgfR6Mubg3QD3sJKfu4xfFNOdYAM4Mt/MTb/BDBLzOY58VUPz3XmSZyJlSzzArkwiJZL0AVJruidMO3yzOkx8FE2ctMpF8J/SaTLFzjU8ymajtpEdZ8OGULZAjE4K+/FbPEkpskBXifkPcuBT+MsCguSP47YDg/Eo/YjetSAPNqJSwETLYIVO10MvanVXlWrnQ2/rR+eHJnyBLzYE3xTMz2Wn+11nIWP+pZA9ilae0AcF469HtiPc8vLdsFx0XlaYwTEXhxkljY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5776ea1-50ee-47c1-6d97-08dd7c5ae44f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 20:19:58.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6pySKcqitvMto3CS4n1I3g0FpKhSuLAMT9Y1cqTHcLLq6S5gpfWdBvMU1SPDe5K8YjSyxuIywVdM2tlFvRgzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_07,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150143
X-Proofpoint-ORIG-GUID: _uD8fn6OxCy7-88QP1_eZkZAKgTVDayJ
X-Proofpoint-GUID: _uD8fn6OxCy7-88QP1_eZkZAKgTVDayJ

From: Eugene Loh <eugene.loh@oracle.com>

A number of tests check "tick-n /pid==0/" probes.  The problem
with this is that a tick-n probe runs on a specific CPU.  If that
CPU is fully subscribed, then pid 0 (swapper) will not run.  Thus,
the test will take a long time, only to time out.

Change these tests to use profile-n instead of tick-n probes,
improving chances that the test probe will fire on a less subscribed
CPU.

Therefore, also change the .r.p post-processing file so that it uses
only one output line (in case two CPUs manage to write output).

Finally, add skip files in case pid 0 does not fire on any CPU.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/ustack/skip_pid0_if_oversubscribed.x | 5 +++++
 test/unittest/ustack/tst.kthread.d                 | 9 +++++++--
 test/unittest/ustack/tst.kthread.x                 | 1 +
 test/unittest/ustack/tst.uaddr-pid0.d              | 5 +++--
 test/unittest/ustack/tst.uaddr-pid0.r.p            | 4 ++--
 test/unittest/ustack/tst.uaddr-pid0.x              | 1 +
 test/unittest/ustack/tst.ufunc-pid0.d              | 5 +++--
 test/unittest/ustack/tst.ufunc-pid0.r.p            | 4 ++--
 test/unittest/ustack/tst.ufunc-pid0.x              | 1 +
 test/unittest/ustack/tst.usym-pid0.d               | 5 +++--
 test/unittest/ustack/tst.usym-pid0.r.p             | 4 ++--
 test/unittest/ustack/tst.usym-pid0.x               | 1 +
 12 files changed, 31 insertions(+), 14 deletions(-)
 create mode 100755 test/unittest/ustack/skip_pid0_if_oversubscribed.x
 create mode 120000 test/unittest/ustack/tst.kthread.x
 create mode 120000 test/unittest/ustack/tst.uaddr-pid0.x
 create mode 120000 test/unittest/ustack/tst.ufunc-pid0.x
 create mode 120000 test/unittest/ustack/tst.usym-pid0.x

diff --git a/test/unittest/ustack/skip_pid0_if_oversubscribed.x b/test/unittest/ustack/skip_pid0_if_oversubscribed.x
new file mode 100755
index 000000000..b5fe7177a
--- /dev/null
+++ b/test/unittest/ustack/skip_pid0_if_oversubscribed.x
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+$dtrace -qn 'profile-100ms /pid == 0/ { exit(0) }
+             tick-1s { trace("cannot profile pid 0; oversubscribed system?"); exit(2) }'
+exit $?
diff --git a/test/unittest/ustack/tst.kthread.d b/test/unittest/ustack/tst.kthread.d
index c6252b742..0fe5279f3 100644
--- a/test/unittest/ustack/tst.kthread.d
+++ b/test/unittest/ustack/tst.kthread.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2013, 2020, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2013, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -16,4 +16,9 @@
 
 #pragma D option quiet
 
-tick-100msec / pid == 0 / { ustack(); exit(0); }
+profile-100ms
+/ pid == 0 /
+{
+    ustack();
+    exit(0);
+}
diff --git a/test/unittest/ustack/tst.kthread.x b/test/unittest/ustack/tst.kthread.x
new file mode 120000
index 000000000..1df0f1ccc
--- /dev/null
+++ b/test/unittest/ustack/tst.kthread.x
@@ -0,0 +1 @@
+skip_pid0_if_oversubscribed.x
\ No newline at end of file
diff --git a/test/unittest/ustack/tst.uaddr-pid0.d b/test/unittest/ustack/tst.uaddr-pid0.d
index 263a7ca94..3580f0cde 100644
--- a/test/unittest/ustack/tst.uaddr-pid0.d
+++ b/test/unittest/ustack/tst.uaddr-pid0.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,9 +9,10 @@
 
 #pragma D option quiet
 
-tick-1
+profile-100ms
 /pid == $target/
 {
     uaddr(ucaller);
+    printf("\n");
     exit(0);
 }
diff --git a/test/unittest/ustack/tst.uaddr-pid0.r.p b/test/unittest/ustack/tst.uaddr-pid0.r.p
index 9203dc824..78ab8e59d 100755
--- a/test/unittest/ustack/tst.uaddr-pid0.r.p
+++ b/test/unittest/ustack/tst.uaddr-pid0.r.p
@@ -1,4 +1,4 @@
 #!/usr/bin/gawk -f
 
-# remove trailing blanks
-{ sub(" *$", ""); print }
+# remove trailing blanks, use only one line
+{ sub(" *$", ""); print; exit }
diff --git a/test/unittest/ustack/tst.uaddr-pid0.x b/test/unittest/ustack/tst.uaddr-pid0.x
new file mode 120000
index 000000000..1df0f1ccc
--- /dev/null
+++ b/test/unittest/ustack/tst.uaddr-pid0.x
@@ -0,0 +1 @@
+skip_pid0_if_oversubscribed.x
\ No newline at end of file
diff --git a/test/unittest/ustack/tst.ufunc-pid0.d b/test/unittest/ustack/tst.ufunc-pid0.d
index f076782aa..0778c33c1 100644
--- a/test/unittest/ustack/tst.ufunc-pid0.d
+++ b/test/unittest/ustack/tst.ufunc-pid0.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,9 +9,10 @@
 
 #pragma D option quiet
 
-tick-1
+profile-100ms
 /pid == $target/
 {
     ufunc(ucaller);
+    printf("\n");
     exit(0);
 }
diff --git a/test/unittest/ustack/tst.ufunc-pid0.r.p b/test/unittest/ustack/tst.ufunc-pid0.r.p
index 9203dc824..78ab8e59d 100755
--- a/test/unittest/ustack/tst.ufunc-pid0.r.p
+++ b/test/unittest/ustack/tst.ufunc-pid0.r.p
@@ -1,4 +1,4 @@
 #!/usr/bin/gawk -f
 
-# remove trailing blanks
-{ sub(" *$", ""); print }
+# remove trailing blanks, use only one line
+{ sub(" *$", ""); print; exit }
diff --git a/test/unittest/ustack/tst.ufunc-pid0.x b/test/unittest/ustack/tst.ufunc-pid0.x
new file mode 120000
index 000000000..1df0f1ccc
--- /dev/null
+++ b/test/unittest/ustack/tst.ufunc-pid0.x
@@ -0,0 +1 @@
+skip_pid0_if_oversubscribed.x
\ No newline at end of file
diff --git a/test/unittest/ustack/tst.usym-pid0.d b/test/unittest/ustack/tst.usym-pid0.d
index d2f5ec5de..7833ab1e2 100644
--- a/test/unittest/ustack/tst.usym-pid0.d
+++ b/test/unittest/ustack/tst.usym-pid0.d
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2023, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -9,9 +9,10 @@
 
 #pragma D option quiet
 
-tick-1
+profile-100ms
 /pid == $target/
 {
     usym(ucaller);
+    printf("\n");
     exit(0);
 }
diff --git a/test/unittest/ustack/tst.usym-pid0.r.p b/test/unittest/ustack/tst.usym-pid0.r.p
index 9203dc824..78ab8e59d 100755
--- a/test/unittest/ustack/tst.usym-pid0.r.p
+++ b/test/unittest/ustack/tst.usym-pid0.r.p
@@ -1,4 +1,4 @@
 #!/usr/bin/gawk -f
 
-# remove trailing blanks
-{ sub(" *$", ""); print }
+# remove trailing blanks, use only one line
+{ sub(" *$", ""); print; exit }
diff --git a/test/unittest/ustack/tst.usym-pid0.x b/test/unittest/ustack/tst.usym-pid0.x
new file mode 120000
index 000000000..1df0f1ccc
--- /dev/null
+++ b/test/unittest/ustack/tst.usym-pid0.x
@@ -0,0 +1 @@
+skip_pid0_if_oversubscribed.x
\ No newline at end of file
-- 
2.43.5

