Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3314C258CCE
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276904; cv=fail; b=cZ4FwgOj9vaM4pGI9bBsbhvS0MdiYOOTtr5pAnOf+96gGtCqNMY1jJKt68dyjo9e6pp/neQALKouRIp9xZD209HMltY44SjlPVcTyfZG+iS4v10n4+tigOREJBR89lOXnuHvxpeg3xO8xFKi3A4iutpalBoiDCzepE6b/q+7Nnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276904; c=relaxed/simple;
	bh=gPzO44qEOh7mZw1d+Ysft+bEm0R9NwucbDSvEci/Leo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=MuCaHJ3yv+pctcTttBf1o7GIr8HOos766Q+i79/vXP1o+GxRTQOC3PSnONuO8+ms6gPR3DCkIN/1KXUkz+Cek6lnarqxCopd7IMc/TnplsIIZ7LWqrKYyyS6PhUtJsMZZSKQEZfPgVLE1PaJ1NkT/l0Ey6/oDRD+Y1V2hk4W9w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H775N9Wt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OXREkttN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H775N9Wt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OXREkttN"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575xeHN027055
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=GGHJZlt7IKaVzNaMcHvcriYRh++ujNrjR5RS9oudVQ8=; b=
	H775N9WtqL5Vbzr524qEKTzYNwhH0honVzUzvTV1Z+JQl1TuOXNTiPJOnnlJQZ+o
	922yxiH/1ZPq3axJCG6ZQ/6hlgciwn15bbnnHysUJTHQnhMWisZLABJ6uNtDuVKd
	WG2xrRGZvbqu+y+Ps3wiTN39SWBi6urmVzjOM4czatT8YDNxfmazTbL9xL2axUbQ
	7Qif1OXwq4ajSaD/SJxwkplveqbMn6PCyfGZDI0Dzbnnl7oHjf9VhEB1J4m4rGA4
	GTX4p0sbODyOo+AAe8b6a35nCOkZDf6/df85fkQmZRp1zHgukuhtga2i7LSBlR05
	1cVv7pPIhnIL9Mzi6uvb2A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr1nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571Y5p8020395
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:00 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc404e-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBcvJq2x3I8F/hZCRHMt6WGxLcnYH+vGhrAZt5labLiu64IOJy3caELk6FcL+Cuhzo6Riyz7rMM4GrHoro2m+lpp477aC0nMu0Bx1R24+I4TyhF1+dklmmYUSFg6krN59RLqJB7icJHyOBfEf176y2iqeaVnP8LoXC15PYmZU627NP59IlrGronAIz+HL+9t33g313rOBVy2PQonByluCKwpfm1IBTQB/9vKd4NKOY22+LhlB7z+gzgGMvyKTfs5vnse49+ChBrPQ52i4KYn09rXUwyLNkn6wA9MUuGct+NtIZsDW98sXAweyC8U+C2irJaDO5qJ1IGaadOSeem2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGHJZlt7IKaVzNaMcHvcriYRh++ujNrjR5RS9oudVQ8=;
 b=S2vK+XNTtbmXf051yBNJuauRLxTgYLMzzQTxlAAtLUY10x+u37antORI+NYp0vRx1VxpJROb/JvD2srpCGWIv7yvSIlzQQCzneMynk2DcraENnmKXptU33rqvsDy/kbsJ72YNSjhS6LLex/lMm0u40LA2S+Sn7Bx0NEzPjjxhgJOPHpWsfKkmnfxQ79VIbKMUt13/K12fZt4pYcFZqGvnW50XV18GK2pigIfZu7wi667Mqxe6v1jVnZSxqEUwr/IMqbRKIrIoKIYMpEJVyb5FTQYz8fXfJU44MgbVkkD0OEeqy4qgPSpFGX31gx+Dvw3Dnl/0DoYEHjM475dHAVgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGHJZlt7IKaVzNaMcHvcriYRh++ujNrjR5RS9oudVQ8=;
 b=OXREkttNADNWZhHnWU50zoCWjha48BwLnstRPdganYJEKSQiZ8ZzbgfQwvX61HiswLfeSSM6WcsfpS3zy0rtqjYODhw1IxqZ83g7Eaxl+F7yoT8yfIqEGVmlaNb1SmSMCMj20ctvCffwx1iLW9P2oQmRpDiHnep91itRqvQoYUY=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:14:58 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:14:58 +0000
Date: Sat, 07 Jun 2025 02:14:57 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/17] providers: loop through all providers for discovery
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83740E6D62283EC4A254D17BC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aa96e83-ba9a-4a0c-596e-08dda58aa0de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R3RZbinMJWaVIqYkGQhfKUgHGR20TXmyAQ+SuUYsaCKbWqVVsOT7r4c/uOGe?=
 =?us-ascii?Q?J3aAcrCNlDKy8QTeW/jFFxrIvOo48VyQ3PTasetrohlPMEzEQnxpX4H1kO9H?=
 =?us-ascii?Q?wak/VDvLgUPDrFy7TU9KMrnmzGJvAZSCjbIm9LkYCre6BWOJk59fWDa1lXzS?=
 =?us-ascii?Q?47QzHFvYSypR4TgUCZ+hS4t3XtJZPbeeCDgCZrfGjkj8iM4luLVasEcEjp76?=
 =?us-ascii?Q?apuIu9uoiXtWDX4JZ8BxHmUU2fEdH3P5peP4vttFU+GqFZEWMVkJvRv4ysug?=
 =?us-ascii?Q?Olu0YN7l4XJOtwylBc0DJkyWEg6sFGYSsdvDDyTY6qGgGVmZFpZZOMVHXlgN?=
 =?us-ascii?Q?Wco+khGCJz8l1lkdH8/hsYKehURTL6Ex/6XnYPZc5ZlNCfS6VPkFU06BUBhD?=
 =?us-ascii?Q?RjIoUFp4LjgIoHn+8rA7A0ue7eGGkpQlvP7L2esu1T4iEPiMLrHwOYw3fOsi?=
 =?us-ascii?Q?+j5WtXVJ3uZbIxDjrIIjExOG/EahaG9L/gjw5DBd9+KpsWWdVSbVtLQucFHF?=
 =?us-ascii?Q?r4ao4EwnBDlUZtz1vx+Hj4buomxUyEoHp0G7f8+hgEUosP22KMOcUfyRqbaJ?=
 =?us-ascii?Q?MlvkhLBMjLwQK3bXuhcFTMBU9Emz7sUErjqP1Wdw8Qy/3M39Uv3lsyzJIiw5?=
 =?us-ascii?Q?avZvGz4wJJazds6YS7aQQea8ZA/QGWe/2JX6I+P0lEmSLb4Pq3/KrJ0YjgzM?=
 =?us-ascii?Q?tK1TLwlG+JIohCgVcOa3Nc0vdrhIAdiqpUuXx4jvXd3TAtywyQbkd28fxYR+?=
 =?us-ascii?Q?AiHplBncQL0v2iCsVHEZxjGETJL/ROYqHaufZ6IkRzMQSaYN588udu8l5uml?=
 =?us-ascii?Q?aKvzQb85FPQixS+kftY5/xw7u1mrEMsPy9EErT0j6erO131S6ChLCQsJIt21?=
 =?us-ascii?Q?pp7UHF2JAAcHGkQj1E1Xfe/6SLyeqfr0vjaYb8VMPTVjbSIqT006HuTqbH9q?=
 =?us-ascii?Q?znSSm+svLwoOq7D7KgSuG3ak1n4/KNqzNCx8nCk2VTdDf1deX8TC7t2v4fnQ?=
 =?us-ascii?Q?ZXZMyt6eAOXzwzlq5XW+UZFMa462qDgBGXE4RV34NxNuuO+uMioMEoOeUsxG?=
 =?us-ascii?Q?jRkx2qNtYgVyTNi4gJ0dTZBtA3mvyIizK9HXqlpdczTQRpsDy7adb3xmozjU?=
 =?us-ascii?Q?shqelrvcv6Uq5G2V6HjCPyIJGYDZLG0B95H/EL+EgZKtxJBXlLsp89ntjSHL?=
 =?us-ascii?Q?OILK8xGoSNoz/+yDc1kf3N92bNsrF5Up2NapRmrHUtmwl9oYPIOn3//xRzyj?=
 =?us-ascii?Q?hDNFEYnepVad4wWjFev+5lmcXZDi1c3DfiyiZ8BaNB74QDfCInBJwhL3ilwj?=
 =?us-ascii?Q?ApOPhcIAsZ4FZ7pezHaUPrBVhcTlHReBFhLPZBmEKZZTPFLftulKBsd6LTXJ?=
 =?us-ascii?Q?EHczvlQHvI0C3tYXkrCVJ16bbC9pPNSQuQEmafqfZPQy/NH01dngwqsjxTvl?=
 =?us-ascii?Q?BHudEm8lQ0s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a9ZA8gtPzTrsnV8Bj4Jddk2MNVWx6y77KklR9m+Li3mW3Qol9T7atZssKbcn?=
 =?us-ascii?Q?o5IOBLtleNn54H2ScWqyRO2IiRS6/LvhCg5s5gxl+Ok5Xr6ByWUoX7hJVlma?=
 =?us-ascii?Q?aMxdO5WFRGj3Ra2DhnUcdZbBt8b0b8lrJOpZlIIu49rQ58yKepNeytMZNnTN?=
 =?us-ascii?Q?HD7TZ6RxKnjtaNn9IdzH4M9d7NAWQurPOeS+UX62z6OnwQA1E37xZMmTT+mW?=
 =?us-ascii?Q?094cBIDfy7bUXTXglWy902ftUWNtKzdhd9jBTCef+2qgmgUU1IAzrl/0FaUJ?=
 =?us-ascii?Q?ia8+xJcFEe/8JMoBthzB7Z1bJbGu8ENAd85pTyv+ATm2/sfYYjnj+FVICu/M?=
 =?us-ascii?Q?LyCP4ByMkAwTL1zyFmpFg6lzTDWfgYE5ojQ/TB9Q2vW+7nJqVXIs7qpqejxC?=
 =?us-ascii?Q?FYqgJdYDN/TZx/uyMDt4i9PI1g+IkIn6/ezk/HKo4bnqI+4DKMKYLMO0FNi/?=
 =?us-ascii?Q?KflsxATQDpudTNLylLCFO9I6fpZUa7asCCTfNSLkD05Kfvj25LPUeqjdII7e?=
 =?us-ascii?Q?cnMbOEubDhSD6GYkWDBwLuvLQOIvw0QrskZdzMGr9dT6yufNVOBHMFriVI69?=
 =?us-ascii?Q?aRl2wprOFSdd4mNVlySJMylH3aRQ26fEZrYSTIGHlJX/GMTITf3Y3gHBTQ/m?=
 =?us-ascii?Q?4QLtNaN9hFkUy4D28Dymc604Z2SU9XYTAzqHRLn6tdw/IS9lQxc/+I9UCtAM?=
 =?us-ascii?Q?lU8ydE+SwVZ38H23Z8C2AHhmKNWaCNcpxZJYE44P6ZUMaQ4KS7d9JmzgOeYZ?=
 =?us-ascii?Q?XCUREwJLyrQQoIAsfpZ4+xJf4DIcj5J5jLPzN062/vmvr4ZXtbaG4urkdSPv?=
 =?us-ascii?Q?c0LggI4tzGSwSec0mUBVE4WNhBYwFAd1U59qNJ0VFm8P5TcdKeM3mBHdjnZa?=
 =?us-ascii?Q?334EU0oNihXyr7ZWQusOQa6t+r/8l8v89ywE9JKV61p0eddibKTO9/5IWIvL?=
 =?us-ascii?Q?Seq6GUEcMiRAdrpYMkYgehLNA2zmlFrjy0vJy7L15iiaMSxgldOkmsEzqvP5?=
 =?us-ascii?Q?6IUYhj+mkFo4cwsMpiRDuQDjWBcU3Bdyw2Hlypar69ABg0q/jVir63mYPFUX?=
 =?us-ascii?Q?6SW6SGSX6pZHg7p6rSTSf3EgZDwfwbOWfXOS5m6aoJQohcdbpgdkqByV//ZU?=
 =?us-ascii?Q?x5UUqNqiB5Gq8zX1blFFiZ1CTaMgJYDQ2anYd5707pNPKF1UQhRyaRDvjsHp?=
 =?us-ascii?Q?rh8U3QsGAEoVygeD1IwsZIh5WKwtZBD5Cm+oGiTnmdAHKl7vSk8Zbpen/cbr?=
 =?us-ascii?Q?mgyLhpYmcaCb/U0koxgole9B+0O4qgGCNkuLc2qrAIN4Wlwc5/jEkpmlLP5N?=
 =?us-ascii?Q?ONvmH1X5e5v6X9WmyPMuhbPziOBGKXLqJlA27Spp8IY1xz5961DyFQGpyJIq?=
 =?us-ascii?Q?WDsfqOJwHP+gyoW/XMhjjPrXXT53TvQUtx+k7nttjGCUgoGUgABg+FlloHFC?=
 =?us-ascii?Q?QCEWk19g1a0ezrNpN5Xo2SQJ1HJpk956Eq/Wkvn1TuriTg3oXs+EDVFHqZ8O?=
 =?us-ascii?Q?ZiuR7BIJOewbP41O4eHjUIDnFdYfGEc5ZbhmJvUKOAmr7QmGzDs4Hs/AyFWs?=
 =?us-ascii?Q?Ut964Tq0w4Dl9+0fXzhX/F9TAVmsv/7B2VuwJ+/utieuyxfwKaiorOTsMO8h?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sb89EyPCO932M5IlRB9Gt4qTFw3QByQ20XEyFr0ba9gn0nv4Jim52EBu2c5qgT6XnW3JeyRvWBQgpr8QfT2j42INrNVEkCwcDg1Jzrkq1HhYKZ+hdzwZoPes2ui8/BkhnWA0CX28eRBrClJjTlCyPr9uLUIkI+wTLV2aJRr2EVOmOvOkHpvdGFy33hkxGqo/aPZUWvRkzoNzjmoc11+JBMF3pJ4LwEYV27YDUeXP5/zVXf6iWtrVfe1gmquDiugAlx1E8sU2nGIFPrC14JRh4AwCw0k/s2IQEyJWHFhLl+hBFGgUPJyrqwbefmGcR9e47S2MaHyC3I/l/Pw0gqkmzusKU43R+GTdCI5mtUoJLULKFXLW3cSgi5eVzxNPYoFsEsflYCA+Qii5C3WCTHZGl7Q+Klq9GYsWnwSAsotCiAGKhpoilRVAlCvudTfw7l/PXCzDq+wm5XkGvmZMEiqgFOqcwiEdz+qYUNlBPGCOhXoLDFkOnsdHCCrItci7+dQ/6jNENmglK/Ihz2zdjbWeKy7e5IEElLK/jcJ4smdftMMKORPh8t1mvzK1a+dqXj+PbbbaTrJj2/1ZIxjBqxcCFsJ3I6tSo8vTzCDLmQA+hlU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa96e83-ba9a-4a0c-596e-08dda58aa0de
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:14:58.0226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQxUbAv2wZWAB6ap3EmFVR3nxAwemVnLMomVwuP6e8H1G1c44OSMZYePL+hFDZv0PK68rWL5ezz3heHUp3OqSstJrTZYWJtFiWCLbIHV7Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6843d8e6 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PeFa0sTlZfMI_3LvvQEA:9 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: uphufaV3UdLCFTAKLn0itONuFS29NgWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfXzcFm7nzm2ncm 37dyBr4Xy7IkC4TXtLbyipkAo000SfmUqU9wHcdto8B1avVgkG1lehsgARt6y+4TzDaBCrj3+6g v112r1ryaof1kEmxGplrT3lAVM2yLqCqv8JxGxQAqucLxrTARuzkK8yYmwDpbPvHAcnjeDC7dif
 8rI8jdYGLmR0800itGfO61J2mieraV3t3UyXBbNaZgKHEFVM4T7ap+dA9RrJZxHjYkfHKLg4AgS kdEWKvAZtVNViCuKbL59VO9Hz+YODfHfN96MaUX5p3hj9L9qHD3Dq2Br0dI8lFoj99Ut98ispzk WVpmZWjho9vQJLBGLprW8ylhMRzgWRyZM80daafvu3zs9589G7yfDZ2J1hk958slXGpaWgn1tOT
 pTfUeleDqAaUgGwBropBe/5WzrnoGwopbswC28Ax8h1UJPs3jAo4GzTu3qsNNhP2+Fu4uhSs
X-Proofpoint-GUID: uphufaV3UdLCFTAKLn0itONuFS29NgWC

The discovery of probes was tied to the static list of providers that
are called on init.  It should iterate over all providers that are in
fact registered, i.e. the dt_provs hash.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_provider.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
index 1e2e844e..06f0b039 100644
--- a/libdtrace/dt_provider.c
+++ b/libdtrace/dt_provider.c
@@ -176,11 +176,13 @@ dt_provider_xref(dtrace_hdl_t *dtp, dt_provider_t *pvp, id_t id)
 int
 dt_provider_discover(dtrace_hdl_t *dtp)
 {
-	int i, prid = dtp->dt_probe_id;
+	int		prid = dtp->dt_probe_id;
+	dt_htab_next_t	*it = NULL;
+	dt_provider_t	*pvp;
 
 	/* Discover new probes. */
-	for (i = 0; dt_providers[i]; i++) {
-		if (dt_providers[i]->discover && dt_providers[i]->discover(dtp) < 0)
+	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
+		if (pvp->impl->discover && pvp->impl->discover(dtp) < 0)
 			return -1;        /* errno is already set */
 	}
 
-- 
2.45.2

