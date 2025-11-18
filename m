Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EA430DECD
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483895; cv=fail; b=Y6F4oJ5nbk+DohwZg34+Weouk2G9CbqixcjfzTm6p3T4oz5vm0JFTa8O3Hksqdqa6WwtQ4xT2NQIHU4zjypQYtR6lq/4rpuZXRKxwzF64VLaNSqktBBjrQd+RPP9q/GIffgjn/tFIgRmU+7gngHyusooXSqzNmMCOFtfJ4HKszo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483895; c=relaxed/simple;
	bh=y6Rfh+8eqaDX1P8GT+fa5JBpOYV108HivovnKOVqGLo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=L2Lz4YDndoeU/wfVDobWK5sRcvEEcxWszIgyIde13GC7hTSRAyQUfaxLitJcXw0mhC2btZiJCN9wgd+zBx0ab0JC1e7H23S+16jWQcfGNAwmeJiIjZx4yapC6/sjkUUrBe7JMn/nWMzuThGT1XnNO19ly5c7fTkd5thLZDSJgYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XuCy28GJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zuQ3Jwgm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XuCy28GJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zuQ3Jwgm"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIDRn66019525
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=kaesxl0vHJdeIWuwcd69i6UWfJYC6HF2FyvOW3CCn3E=; b=
	XuCy28GJDKTW5Y1Oqq6sPjo14QwffaPlFk+LZ9iGAeo2kQEuPJ9mAD/sMBXyHDkw
	Qiub+juJL/yux9DCtchJ8KUzQ88LdGu3uh50Wn+vuqmUPsdQ2Z7SuFwqXconOM5v
	GxFFBKa37rIVZM1zwVNnp2xmyB16Pbf/mRdKuDiiCrop4QlTY0lLYhdsNuwIj6SA
	UuJAv1h06yWApKARhKxGA+KJwB1CiSnZrDEhwtpR2zvnXyaODx6BY5tm6v3KAyYk
	PW6mm9chOSB0GaEIGzyaxAOGxi7I3xnW8PvgV6IVrQQY01iCpMaCeHoqPPj6ODic
	HZILBCHQX9oXVcPcqB/H4g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbun4tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIGXb8p007744
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:10 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy9cqwt-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdZQZ2IqP63tNJHicAsZaP/3iOO3jNejyivPj84K27ezjdCQkAKSPGc4jZIn+NyIrDm06imRZKUQJgH0pyV8W7edSMvGq4fYBuePedMrCJ/DvU6HfTK79tM5u+nLkS5y4eAxISVlngm8AK8GR457pSm0zXmDM/LgCEKRhpCtaN5dYkMAH/C/DpCdH0EZ+Tv5gtjN26WYXstlmcjdNj3H3WfpL9BNKW5QB9pwKg2g5ZFm24XfHOX5W+ntuWPVqHA/g7nSB+Yp9NJLV9Vzwnl0iDEt+MyaqidYqmyoqRa/OPs4sN0YE/8PvkLVCvpNx5P/oLysll32AUxzO7dNrHynHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaesxl0vHJdeIWuwcd69i6UWfJYC6HF2FyvOW3CCn3E=;
 b=pFKmMfDQYCxA+GfKnpNNZv/1Y02mmLAElXhNPGoJPoFnLw5hXNonK7xywW7QILtrQUDHy8PCxc7xuQl83ttq4rincQRCSnGzusU/jo2/3qMOPG8s3q8Ibb+8WnjkKvNpteSYSetE5Ku6e379TLineZkqDv3SdjKdN77BpqSCZ9xyZIIhjG8MS2/kCiHdws0q3Ftef3o4FpfdYQ8BvKi+Xko8Kf4cagepBhmgu7mmU/U/QJZn10rOuDKzJvgT6Mrbduw/W7fqBe5irBlSd/Lam7xn/zou+YX2znKvN01X0iAe7ubjnSz8xUpY+gOF6oTD88XLm7xUmJJGYMzIG/vgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaesxl0vHJdeIWuwcd69i6UWfJYC6HF2FyvOW3CCn3E=;
 b=zuQ3Jwgmn9aGcFVU7yuXw5wI4k0AY71oqOMa7bB1B2UerdCcRR3JATus4FdVa9rTog0zDQemxW94luNnzwMwOLzh9iw4guhL7hRHi7uIsQj9MBRgiIN8BYurataT4zkCdyBGbGtQB/OZKUCwd7gebO6IB9WtIQ8KE/FNHIPKiLo=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA1PR10MB997631.namprd10.prod.outlook.com (2603:10b6:806:4b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 16:38:04 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:38:04 +0000
Date: Tue, 18 Nov 2025 11:38:03 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/7] uprobe: Implement PID-specific uprobes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB3987183C3CD3C47B9DF93BF7C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA1PR10MB997631:EE_
X-MS-Office365-Filtering-Correlation-Id: 499c3bf3-67b1-4310-e062-08de26c0d8d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIzybGDQYtjdaDBA244nNLlFw7AsMBnxSGOHhMtY2h1eT+bhylzzkPV7o8ff?=
 =?us-ascii?Q?eIeIBhqsCRKoIXEvC/N5Xn2A6dhyuSAwx7zFzPmYyuZ+dYZWoWusGu3It3cQ?=
 =?us-ascii?Q?IA52UR83MjlHT0Dh2MHiUzFxOSE6s7d/9LvUQsiX3ahx0QrNdRdRFY2gToa5?=
 =?us-ascii?Q?uyBF5ViE52O3nJ2vXLaWuQKo5VVUNyWkQbTBgcHnf1+M5vOCSxFTpd9SWn6v?=
 =?us-ascii?Q?R+DkUhKf++g17A0NLnsEH92InGt34Z7thRuJlBgqxgCiJGAOCnJv/m3daI9j?=
 =?us-ascii?Q?ZA5fKEIi6XhKHikCz2vck2/33oU4A3xp3soKx2xy7Zzum16Ur1wMXMZHIpXY?=
 =?us-ascii?Q?iAqJed00+QQsRldR7OwSq/Lk9H59hR0G7AleHkT3dCkJZm79N8jdEoW6+Qyc?=
 =?us-ascii?Q?MKD8kCN5bCUAftNP41JQJFmrejLo3tGySc7IOIDom9xC2awPiEW504O50BQw?=
 =?us-ascii?Q?2RvLvDMklhBfRDhfhxEKrri/vvhk7gA6H4U0Ui+3LcBkpXRvx33U4sDhwEJH?=
 =?us-ascii?Q?aMuKkeys8jN8wa8pQyy3x5nhNayDwrnLP2LTZq9tRUXz0U52CZAnIU2XV4iY?=
 =?us-ascii?Q?QiauyQITSmtIOAyy78tybOsxBz4iYC6iL6WB35UlnkCuj6FWxlwKlx2nuzlI?=
 =?us-ascii?Q?CO4itapWEhm6fPtusDDqnHQoiobKbpiuxY8BfYPse+O9BHOVRh+iB9d8aPfv?=
 =?us-ascii?Q?cpOL/35/+OlT+f7i0kg4RuvwgSFRx0aVby4S+8XhQN44jcP9il3tH3jVfOaK?=
 =?us-ascii?Q?zrUj2Gs0bN2TeKSoxK12jIWA5zFZkXxK8HQ2P3QBKOET40ZLG67QO8g5E+x8?=
 =?us-ascii?Q?E3bU8LEoqwqI8FgN5to9FiCjnsiclQQRruHbgYKrCValnsm1WpmvcwequCIP?=
 =?us-ascii?Q?64szuEh7R3n3EDHRs5+0DnH5vctMwtaKImHoW32uzfl1To4CViVyEWshBRfg?=
 =?us-ascii?Q?WAl1JwDP6SBivrBAjJ6gHaOWiEmDbnzZ7Gd2lwGagWhjenGclEqSVZWKo5Rm?=
 =?us-ascii?Q?Jf7O9DQowJB9q6SheagJE7yw7B8c0LO8u2Fv4VJHbhyX0PfaNEuTX1+cy1zl?=
 =?us-ascii?Q?1aHQ5HxbfjjjvwEkOzWVW9idG5q4GmxqRCy5IG1+RX/ERWh8L30aW3Qs/Fkx?=
 =?us-ascii?Q?h6nHvDvntHWkQxaEZars5ZdY5tpLi1uNhJfuilD0Lab91zNYS6ERsisW0p2v?=
 =?us-ascii?Q?Sj4LewScDleYbqD7/wSxAo51x2q3T72iDJXiSc1Z2RmaB03nj34v1/4WL6aL?=
 =?us-ascii?Q?9WFyIMsRKUV+IEI5bQ01uyHCO3IKA81+sm2PQBMZrz9ziknIHcIExjdhjiHq?=
 =?us-ascii?Q?FuPgpAaXtXdoryOuvvRfvnPqFv7nv8QDQ5OC6ol0kamL2ElvXXjfECwgNH7O?=
 =?us-ascii?Q?O19CGjzA+BSPHIXspQaOOptE3IMa4nHxw0wA8SdZXhHi9P9qowSutD7zVQe5?=
 =?us-ascii?Q?Jxb9Y+y+ISEsKAwhqBLC0BB/TjyS/KZTlCRU5FvR0L4hrDPObVZxFw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o/iP+YzTX7l5pYapZ5xGcKPQ/urcoZ4OR+nKolT7IvaCJR0m/N9o5qKMCzfh?=
 =?us-ascii?Q?wMagDXys+1dYkt4cKhgMvXOW2wPuDp7msOxBLVDUWTSZKaIIp4rlWo0VPmei?=
 =?us-ascii?Q?FM18J7FuxGFJE2FFEQpAFtv1aLLNJ8+WsDQ7iuvSsSgQqYtVZc9ax1/Rbx2l?=
 =?us-ascii?Q?JUxGXcG0LlDcYVS9jP6f+aGgIvB9RaPxT5yfYhSfWpMEpKs7x/rz2dn+pLqu?=
 =?us-ascii?Q?cCBQuXetnhTERVv3Zv7lQSmuyWKWoFO8m9BgleUkOqc7Oia42bgeBD08fkZE?=
 =?us-ascii?Q?oQh3BP+lL9ZjWP2dfpGXLWEQ4KmmUgS2MezeGoxr5B9ag0GPV35ZY0ByJmPc?=
 =?us-ascii?Q?92adBtjtPXbDsfNCacysxsOjCbcTJTv7QpaBS7JMRZ25d6XoWzCqSAhb68mp?=
 =?us-ascii?Q?P9uGndJ6OldtUxr9ggDAxrx1gj0RGZen1n21AIV4qdpzZjGM/z3nFF6Jivvh?=
 =?us-ascii?Q?VoFdeSmpZbe0afqTurd+T58xzPCTr1R4UZRl7C1b6/EQSv0Xl2ELHCApOGey?=
 =?us-ascii?Q?07+8Oa0ZC4qw9ILemfe1YKfW6X2lKI5PYIIzGP6j9+Hr+G0kNLQu/Sd4r1mf?=
 =?us-ascii?Q?cOb8kSesyjbgkCbFaLJv2NgEngd4jxznmCB1HNydrQsHTUyeMglBSqC4MyRL?=
 =?us-ascii?Q?gsH274k+FYSW7ZD4OrfgGr8yuy5QV6aDiXI1rmFRSjieqwn5jwMkubqOaV1X?=
 =?us-ascii?Q?OT4FoT/So9DTga4bFMx3yzpZd6OV0/AUaA3WxcamuVd3DRr1SkNbKok7Alpq?=
 =?us-ascii?Q?gHl7hbPw3DfDfMR2Kcx88HloSN8DwKYQoG4bqedVEcxAbvcTLeVBVomLFtg1?=
 =?us-ascii?Q?kt5MXSvWAIQlB5TwbXRdh0vFKiOdYeE5Vmd0e1yIyZIyo01Gbz6/jCMUg6I9?=
 =?us-ascii?Q?4800dZ3S7YRFarv1B/GJ1bBkF7TqT+oeLKyGe/ZlaNtH9fKAz8MRPT2AogDX?=
 =?us-ascii?Q?EkRUipVmz6yHvv60Yr9yZ+Y+E8MvETjwNgNX+7KBb0+F9NgGFbtr9/WuXhYn?=
 =?us-ascii?Q?60zU69J1rYG53EE4uk+/HJ4FbmV1A+fifM3t/tbAFmy+uDhJHNXvvCdLm6U5?=
 =?us-ascii?Q?zCyERQMXeI25dwOvXfR2tRr8YE1SyXipRfIf7yiQxkD5qS+eWtZpaBjMx8oB?=
 =?us-ascii?Q?N7L3Qrhn0fWwsR6gUStkzlwv7hgfQtgByPVPGt9OynfdWo05BMHNp4Jdm4Lf?=
 =?us-ascii?Q?1KQ1qwlPbriyTmK5VWDoGYjMvAcgTq1i2J/aL/zSPvlDI7OT0oS4rfg305+c?=
 =?us-ascii?Q?4RUyroGVWouy9zZH5+a/uF+1M8GZywU+TRj63HgRGdCtsvrZDq4tw34Ib5df?=
 =?us-ascii?Q?VPFy+7T9dMyw7v0dPZE9eEK4N6pzWfka7D4oALhs1cljcGaqoqyig8K+cjH6?=
 =?us-ascii?Q?b/Jd77cqcg5Ooa8FVSZwkJyJSP9RC6mj1hmYr9ejqXhgkVdcjaJzObN02Yk5?=
 =?us-ascii?Q?AOKcaW5VRUO/v+U0HU5nhCH7RNW4BR0v+z/1QoOFNaAghLyB164u15UUD75F?=
 =?us-ascii?Q?MevkFvCpYV5HmhTvX0yV/SjM93jFNyDx5GOxIy8YTmKufgnteinJsxTp4ySE?=
 =?us-ascii?Q?QF6nmOwoiyeuonvp+2WWwnDmJ/qlRd8HDE0IOuUy04HdiVv1EXzK+hHljiHF?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OpVLXPy7Hol58Ddb2lYuJeTXbLF14OnpRX3tFa9IBaX8WUuL1sEPVG9hzVeydhVWlXyvWlfaK654Gy+xRKH54WzRoEwb9uB9U8EKCqJrQ2psTIWDproa4p5MxcEtRSfVAs4/i0TD9rSY2q+EQ/yDVMx/TbWhLd34xSsTnOdhbgyOpFM/Q+VcoaG3JbybApoQxTWZ4gs95oTgLxkVELMNB/FkpKjzV5e+4AKLQ0ElWfZPT+qSNlIenyRi+wzgpZ9Rys61VjiQaiL2/Gg68HxEG9OySjDeKkdP7h80L0Szc8u+xzZK9cJj464jNY6PFZN8V3VI9koYCayO2b263t+O7avzkuBy1ICOG+Aob3yvwuv6xY6IVn++ztaF+VsN9QvgjUXMzw5wZ/1a5XcZm2wq8lrA9Va2FsRzxInH2t2pAqCvRZxTPzEncdWZ0qzytJRtPh+hT7zV2YL6YwHVKQhA4BKxo0a5xhrBk4SE3cPB944jO8PoJ8ZBLTAjlqfe4jKeL9zjkXra67UckLrtVZIYYETUT7CY73cs1dWHXhmzzgBLbXHOC60v1+8+j5k7NJtXXo9eNkKnb+smVdVgMWztsRYyWDZcb306gpcOsfsrUW4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499c3bf3-67b1-4310-e062-08de26c0d8d2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:38:04.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFdI4wZ6wXvwYXFazi2gyy2e54XB28j88IFA9UEJJ6dTSIgA77EsfZPQdI8v+ToQUqNOGQkfEgpuMgMLZZKxolRQFtR/ZhMgk6el7GLv/8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXwzQNsW+0NRQB
 sKZkENg/gfzGaXizIonDKMshqR11eoyPdWhMKzdsSJhbYggMUsRkBiTLZt3rIHfCfK8BdVdLszo
 iKQnVvgbjT95fIFR8w7vGAmUQzsvbnXFOh5A/yPFd5Gdgp28cZKyw4QMJ7TMfd7HzM+fuXSYGgT
 /lIHP4HGNCgtAqRvRW/S6V7u75ClHtYQtY/2/Pq/h5ikE16o6UdURGym4jK8lP/qsIEVKJqwVMT
 fnoOoggL/kUUdUQTf8TlbZ/zSuA+D6vdYGKJgpTYlOKHPfuVBprxfJwFuW73q+5+5tHXIQJXvyA
 tf0tlPz54r1NgwYcovZ0ENPjpFFrQe+PF39zohcvs42nFe3I6CK7xPUTj9VZKtlI/EqTzkbQI18
 ZlMjdHnVbXOGHiQM0nNRuVxQztnH7w==
X-Proofpoint-GUID: lIXj29YuLDKm_eT3rqkrf0G2ox0A91OI
X-Proofpoint-ORIG-GUID: lIXj29YuLDKm_eT3rqkrf0G2ox0A91OI
X-Authority-Analysis: v=2.4 cv=Rdydyltv c=1 sm=1 tr=0 ts=691ca0f3 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Q_ziuaSfNvtMJrPYbsQA:9

The mechanism to create uprobes by writing to $TRACEFS/uprobe_events
caused probes to be placed in the dev/inode based mapping.  This means
that all tasks that use that mapping are subject to the probes firing.

The kernel supports placing uprobes for a specific task (by PID), which
avoids impacting all other tasks that share the same code but are not
the target of the tracing.

This new mechanism places uprobes using the perf_event_open interface.
Perf event attribute configuration data is read from
/sys/bus/event_source/devices/uprobe/ as needed (and cached to ease
repeated use).  Underlying probes are now organized by PID-specific
providers (uprobe$PID), and attach/detach no longer depends on the
generic tracepoint support.

The usdt_prids BPF map is no longer needed because USDT BPF programs
are now task-specific.  The trampoline generation for USDT Probes
discovered after tracing started can now perform a simple loop over
all compiled clauses, adding those that match the probe description
to the program.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c                      |  14 +-
 libdtrace/dt_bpf_maps.h                 |   9 -
 libdtrace/dt_dlibs.c                    |   1 -
 libdtrace/dt_impl.h                     |   1 -
 libdtrace/dt_pid.c                      |   5 +-
 libdtrace/dt_probe.c                    |  28 +
 libdtrace/dt_probe.h                    |   1 +
 libdtrace/dt_program.c                  |  15 -
 libdtrace/dt_program.h                  |   3 -
 libdtrace/dt_prov_uprobe.c              | 724 ++++++++----------------
 libdtrace/dtrace.h                      |   2 -
 test/unittest/usdt/tst.defer-Z-basic.sh | 102 ++++
 12 files changed, 362 insertions(+), 543 deletions(-)
 create mode 100755 test/unittest/usdt/tst.defer-Z-basic.sh

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 28eb890e..0a57b7d2 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -974,19 +974,12 @@ gmap_create_probes(dtrace_hdl_t *dtp)
 }
 
 /*
- * Create the 'usdt_names' and 'usdt_prids' BPF maps.
+ * Create the 'usdt_names' BPF map.
  *
  * 'usdt_names':  a global hash map indexed by PRID and whose value has probe
  *                name elements at fixed offsets within the value.  This map
  *                is used for get_bvar() to look up probe name elements for
  *                any prid that was created after dtrace_go().
- *
- * 'usdt_prids':  a global hash map indexed by (pid, underlying probe ID).
- *                The value is a probe ID for the overlying USDT probe and
- *                a bit mask indicating which clauses to execute for this pid.
- *
- *                For a given (pid, PRID) key, there can be at most one
- *                overlying USDT probe.
  */
 static int
 gmap_create_usdt(dtrace_hdl_t *dtp)
@@ -998,11 +991,6 @@ gmap_create_usdt(dtrace_hdl_t *dtp)
 	if (dtp->dt_usdt_namesmap_fd == -1)
 		return -1;
 
-	dtp->dt_usdt_pridsmap_fd = create_gmap(dtp, "usdt_prids", BPF_MAP_TYPE_HASH,
-	    sizeof(usdt_prids_map_key_t), sizeof(usdt_prids_map_val_t), nusdtprobes);
-	if (dtp->dt_usdt_pridsmap_fd == -1)
-		return -1;
-
 	dtp->dt_nprobes = dtp->dt_probe_id;
 
 	return 0;
diff --git a/libdtrace/dt_bpf_maps.h b/libdtrace/dt_bpf_maps.h
index 884dc398..2f93c2b3 100644
--- a/libdtrace/dt_bpf_maps.h
+++ b/libdtrace/dt_bpf_maps.h
@@ -42,15 +42,6 @@ struct dt_bpf_cpuinfo {
 	uint64_t	lockstat_stime;	/* lockstat: spin time */
 };
 
-typedef struct usdt_prids_map_key {
-	int		pid;		/* should be pid_t, unistd.h? */
-	uint32_t	uprid;		/* should be dtrace_id_t, sys/dtrace_types.h */
-} usdt_prids_map_key_t;
-typedef struct usdt_prids_map_val {
-	uint32_t	prid;		/* should be dtrace_id_t, sys/dtrace_types.h */
-	long long	mask;
-} usdt_prids_map_val_t;
-
 #ifdef  __cplusplus
 }
 #endif
diff --git a/libdtrace/dt_dlibs.c b/libdtrace/dt_dlibs.c
index 21df22a8..161e2106 100644
--- a/libdtrace/dt_dlibs.c
+++ b/libdtrace/dt_dlibs.c
@@ -72,7 +72,6 @@ static const dt_ident_t		dt_bpf_symbols[] = {
 	DT_BPF_SYMBOL(strtab, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(tuples, DT_IDENT_PTR),
 	DT_BPF_SYMBOL(usdt_names, DT_IDENT_PTR),
-	DT_BPF_SYMBOL(usdt_prids, DT_IDENT_PTR),
 
 	/* BPF internal identifiers */
 	DT_BPF_SYMBOL_ID(PRID, DT_IDENT_SCALAR, DT_CONST_PRID),
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 3b0b2358..5282efbd 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -400,7 +400,6 @@ struct dtrace_hdl {
 	int *dt_aggmap_ids;	/* ids for the 'aggN' BPF maps */
 	int dt_genmap_fd;	/* file descriptor for the 'agggen' BPF map */
 	int dt_cpumap_fd;	/* file descriptor for the 'cpuinfo' BPF map */
-	int dt_usdt_pridsmap_fd; /* file descriptor for the 'usdt_prids' BPF map */
 	int dt_usdt_namesmap_fd; /* file descriptor for the 'usdt_names' BPF map */
 	dtrace_handle_err_f *dt_errhdlr; /* error handler, if any */
 	void *dt_errarg;	/* error handler argument */
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7d6cfb4d..08133466 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1078,8 +1078,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			if (tp->tracepoint.args[0] != 0)
 				psp.pps_sargv = tp->tracepoint.args;
 
-			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
-				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
+			dt_dprintf("providing %s:%s:%s:%s for pid %d @ %lx\n",
+				   psp.pps_prv, psp.pps_mod, psp.pps_fun,
+				   psp.pps_prb, psp.pps_pid, psp.pps_off);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
 				dt_pid_error(dtp, pcb, dpr, D_PROC_USDT,
 					     "failed to instantiate %sprobe %s for pid %d: %s",
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 28a1133f..65316f51 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -1213,6 +1213,34 @@ dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp, dtrace_stmtdesc_t *sdp)
 	return 0;
 }
 
+int
+dt_probe_add_stmt_matchall(dtrace_hdl_t *dtp, dt_probe_t *prp)
+{
+	int	i, rc = 0;
+
+	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
+		dtrace_stmtdesc_t	*sdp = dtp->dt_stmts[i];
+
+		if (sdp == NULL)
+			continue;
+
+		if (dt_gmatch(prp->desc->prv,
+			      sdp->dtsd_ecbdesc->dted_probe.prv) &&
+		    dt_gmatch(prp->desc->mod,
+			      sdp->dtsd_ecbdesc->dted_probe.mod) &&
+		    dt_gmatch(prp->desc->fun,
+			      sdp->dtsd_ecbdesc->dted_probe.fun) &&
+		    dt_gmatch(prp->desc->prb,
+			      sdp->dtsd_ecbdesc->dted_probe.prb)) {
+			rc = dt_probe_add_stmt(dtp, prp, sdp);
+			if (rc < 0)
+				break;
+		}
+	}
+
+	return rc;
+}
+
 int
 dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp, dt_stmt_f *func, void *arg)
 {
diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
index fe9babf3..54053cd3 100644
--- a/libdtrace/dt_probe.h
+++ b/libdtrace/dt_probe.h
@@ -91,6 +91,7 @@ extern int dt_probe_iter(dtrace_hdl_t *dtp, const dtrace_probedesc_t *pdp,
 
 extern int dt_probe_add_stmt(dtrace_hdl_t *dtp, dt_probe_t *prp,
 			     dtrace_stmtdesc_t *sdp);
+extern int dt_probe_add_stmt_matchall(dtrace_hdl_t *dtp, dt_probe_t *prp);
 typedef int dt_stmt_f(dtrace_hdl_t *dtp, dtrace_stmtdesc_t *sdp, void *arg);
 extern int dt_probe_stmt_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 			      dt_stmt_f *func, void *arg);
diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index a2d1918a..38feefef 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -20,21 +20,6 @@
 #include <dt_probe.h>
 #include <dt_bpf.h>
 
-int
-dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags) {
-	stp->dtsd_clauseflags |= flags;
-
-	return 0;
-}
-
-int
-dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags) {
-	if (stp->dtsd_clauseflags & flags)
-		return 1;
-
-	return 0;
-}
-
 dtrace_prog_t *
 dt_program_create(dtrace_hdl_t *dtp)
 {
diff --git a/libdtrace/dt_program.h b/libdtrace/dt_program.h
index 29450d99..70cea993 100644
--- a/libdtrace/dt_program.h
+++ b/libdtrace/dt_program.h
@@ -28,9 +28,6 @@ struct dtrace_prog {
 	uint8_t dp_dofversion;	/* DOF version this program requires */
 };
 
-extern int dt_stmt_clsflag_set(dtrace_stmtdesc_t *stp, int flags);
-extern int dt_stmt_clsflag_test(dtrace_stmtdesc_t *stp, int flags);
-
 extern dtrace_prog_t *dt_program_create(dtrace_hdl_t *);
 extern void dt_program_destroy(dtrace_hdl_t *, dtrace_prog_t *);
 
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 6cea7f4c..e94827f2 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -26,6 +26,7 @@
  * Finally, note that upp->probes is a dt_list_t of overlying probes.
  */
 #include <sys/types.h>
+#include <sys/ioctl.h>
 #include <assert.h>
 #include <ctype.h>
 #include <errno.h>
@@ -278,6 +279,7 @@ get_asm_reg(dt_provider_t *pvp, const char *name)
 #define PP_IS_MAPPED	0x10
 
 typedef struct dt_uprobe {
+	pid_t		pid;
 	dev_t		dev;
 	ino_t		inum;
 	char		*fn;		/* object full file name */
@@ -285,7 +287,7 @@ typedef struct dt_uprobe {
 	uint64_t	off;
 	uint64_t	refcntr_off;	/* optional reference counter offset */
 	int		flags;
-	tp_probe_t	*tp;
+	int		fd;		/* perf event fd (-1 if not created) */
 	int		argc;		/* number of args */
 	dt_argdesc_t	*args;		/* args array (points into argvbuf) */
 	char		*argvbuf;	/* arg strtab */
@@ -299,10 +301,11 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
-typedef struct list_key {
-	dt_list_t		list;
-	usdt_prids_map_key_t	key;
-} list_key_t;
+typedef struct uprobe_data {
+	int	perf_type;
+	int	ret_flag;
+	int	ref_shift;
+} uprobe_data_t;
 
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
@@ -316,11 +319,71 @@ dt_provimpl_t	dt_pid;
 dt_provimpl_t	dt_usdt;
 dt_provimpl_t	dt_stapsdt;
 
+#define UPROBE_CONFIG	"/sys/bus/event_source/devices/uprobe/"
+#define PERF_TYPE_FILE	(UPROBE_CONFIG "type")
+#define RET_FLAG_FILE	(UPROBE_CONFIG "format/retprobe")
+#define REF_SHIFT_FILE	(UPROBE_CONFIG "format/ref_ctr_offset")
+
+static int get_perf_type()
+{
+	FILE	*f;
+	int	val;
+
+	f = fopen(PERF_TYPE_FILE, "r");
+	if (f == NULL)
+		return -1;
+	if (fscanf(f, "%d\n", &val) != 1)
+		val = -1;
+
+	fclose(f);
+	return val;
+}
+
+static int get_retprobe_flag()
+{
+	FILE	*f;
+	int	val;
+
+	f = fopen(RET_FLAG_FILE, "r");
+	if (f == NULL)
+		return -1;
+	if (fscanf(f, "config:%d\n", &val) == 1)
+		val = 1 << val;
+	else
+		val = -1;
+
+	fclose(f);
+	return val;
+}
+
+static int get_refcnt_shift()
+{
+	FILE	*f;
+	int	val;
+
+	f = fopen(REF_SHIFT_FILE, "r");
+	if (f == NULL)
+		return -1;
+	if (fscanf(f, "config:%d-%*d\n", &val) != 1)
+		val = -1;
+
+	fclose(f);
+	return val;
+}
+
 static int populate(dtrace_hdl_t *dtp)
 {
+	uprobe_data_t	*udp = dt_alloc(dtp, sizeof(uprobe_data_t));
+
+	udp->perf_type = -1;			/* not initialized */
+	udp->ret_flag = -1;			/* not initialized */
+	udp->ref_shift = -1;			/* not initialized */
+
 	if (dt_provider_create(dtp, dt_uprobe.name, &dt_uprobe, &pattr,
-			       NULL) == NULL ||
-	    dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
+			       udp) == NULL)
+		return -1;
+
+	if (dt_provider_create(dtp, dt_pid.name, &dt_pid, &pattr,
 			       NULL) == NULL ||
 	    dt_provider_create(dtp, dt_stapsdt.name, &dt_stapsdt, &pattr,
 			       NULL) == NULL)
@@ -355,9 +418,7 @@ static void free_probe_list(dtrace_hdl_t *dtp, list_probe_t *elem)
 static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 {
 	dt_uprobe_t	*upp = datap;
-	tp_probe_t	*tpp = upp->tp;
 
-	dt_tp_destroy(dtp, tpp);
 	free_probe_list(dtp, dt_list_next(&upp->probes));
 	dt_free(dtp, upp->fn);
 	dt_free(dtp, upp->func);
@@ -375,6 +436,17 @@ static void probe_destroy(dtrace_hdl_t *dtp, void *datap)
 	free_probe_list(dtp, datap);
 }
 
+static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
+{
+	dt_uprobe_t	*upp = uprp->prv_data;
+
+	if (upp->fd == -1)
+		return;
+
+	close(upp->fd);
+	upp->fd = -1;
+}
+
 /*
  * Disable an overlying USDT probe.
  */
@@ -392,6 +464,7 @@ static void probe_disable(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	/* Free up its list of underlying probes. */
 	while ((pup = dt_list_next(prp->prv_data)) != NULL) {
 		dt_list_delete(prp->prv_data, pup);
+		detach(dtp, pup->probe);
 		dt_free(dtp, pup);
 	}
 	dt_free(dtp, prp->prv_data);
@@ -401,182 +474,57 @@ static void probe_disable(dtrace_hdl_t *dtp, dt_probe_t *prp)
 /*
  * Clean up stale pids from among the USDT probes.
  */
-static int
-clean_usdt_probes(dtrace_hdl_t *dtp)
-{
-	int			fdprids = dtp->dt_usdt_pridsmap_fd;
-	int			fdnames = dtp->dt_usdt_namesmap_fd;
-	usdt_prids_map_key_t	key, nxt;
-	usdt_prids_map_val_t	val;
-	list_key_t		keys_to_delete, *elem, *elem_next;
-	dt_probe_t		*prp, *prp_next;
-
-	/* Initialize list of usdt_prids keys to delete. */
-	memset(&keys_to_delete, 0, sizeof(keys_to_delete));
-
-	/* Initialize usdt_prids key to a pid/uprid that cannot be found. */
-	key.pid = 0;
-	key.uprid = 0;
-
-	/* Loop over usdt_prids entries. */
-	while (dt_bpf_map_next_key(fdprids, &key, &nxt) == 0) {
-		memcpy(&key, &nxt, sizeof(usdt_prids_map_key_t));
-
-		if (dt_bpf_map_lookup(fdprids, &key, &val) == -1)
-			return dt_set_errno(dtp, EDT_BPF);
-
-		/* Check if the process is still running. */
-		if (!Pexists(key.pid)) {
-			/*
-			 * Delete the usdt_names entry.
-			 *
-			 * Note that a PRID might correspond to multiple
-			 * sites.  So, as we loop over usdt_prids entries,
-			 * we might delete the same usdt_names entry
-			 * multiple times.  That's okay.
-			 */
-			dt_bpf_map_delete(fdnames, &val.prid);
-
-			/*
-			 * Delete the usdt_prids entry.
-			 *
-			 * Note that we do not want to disrupt the iterator.
-			 * So we just add the key to a list and will walk
-			 * the list later for actual deletion.
-			 */
-			elem = calloc(1, sizeof(list_key_t));
-			elem->key.pid = key.pid;
-			elem->key.uprid = key.uprid;
-			dt_list_append((dt_list_t *)&keys_to_delete, elem);
-
-			continue;
-		}
-
-		/*
-		 * FIXME.  There might be another case, where the process
-		 * is still running, but some of its USDT probes are gone?
-		 * So maybe we have to check for the existence of one of
-		 *     dtrace_probedesc_t *pdp = dtp->dt_probes[val.prid]->desc;
-		 *     char *prv = ...pdp->prv minus the numerial part;
-		 *
-		 *     /run/dtrace/probes/$pid/$pdp->prv/$pdp->mod/$pdp->fun/$pdp->prb
-		 *     /run/dtrace/stash/dof-pid/$pid/0/parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
-		 *     /run/dtrace/stash/dof-pid/$pid/.../parsed/$prv:$pdp->mod:$pdp->fun:$pdp->prb
-		 */
-	}
-
-	/*
-	 * Delete the usdt_prids keys in our list.
-	 */
-	for (elem = dt_list_next(&keys_to_delete); elem != NULL; elem = elem_next) {
-		elem_next = dt_list_next(elem);
-
-		dt_bpf_map_delete(fdprids, &elem->key);
-		free(elem);
-	}
-
-	/* Clean up enablings. */
-	for (prp = dt_list_next(&dtp->dt_enablings); prp != NULL; prp = prp_next) {
-		pid_t		pid;
-
-		prp_next = dt_list_next(prp);
-
-		/* Make sure it is an overlying USDT, stapsdt probe. */
-		if (prp->prov->impl != &dt_usdt && prp->prov->impl != &dt_stapsdt)
-			continue;
-
-		/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
-		/*
-		 * Nick writes:
-		 * This is a general problem with running compiler-adjacent things outside
-		 * compile time. I think we should adjust dt_pid_error() so that it works
-		 * with NULL pcb and dpr at once, probably by using the code path for
-		 * pcb != NULL and augmenting it so that it passes in NULL for the region and
-		 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
-		 * already handle this case.)
-		 */
-		pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
-
-		if (Pexists(pid))
-			continue;
-
-		probe_disable(dtp, prp);
-	}
-
-	return 0;
-}
+typedef struct del_list {
+	dt_list_t	list;
+	dt_probe_t	*probe;
+} del_list_t;
 
-/*
- * Judge whether clause "n" could ever be called as a USDT probe
- * for this underlying probe.  We can pass uprp==NULL to see if
- * the clause can be excluded for every probe.
- */
 static int
-ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
+clean_usdt_probes(dtrace_hdl_t *dtp)
 {
-	dtrace_stmtdesc_t	*stp = dtp->dt_stmts[n];
-	dtrace_probedesc_t	*pdp = &stp->dtsd_ecbdesc->dted_probe;
+	int		fdnames = dtp->dt_usdt_namesmap_fd;
+	uint32_t	key, nxt;
+	del_list_t	dlist = { 0, };
+	del_list_t	*del, *ndel;
+	dt_probe_t	*prp;
 
-	if (stp == NULL)
-		return 1;
+	/* Initialize key to a probe id that cannot be found. */
+	key = DTRACE_IDNONE;
 
-	/*
-	 * Some clauses could never be called for a USDT probe,
-	 * regardless of the underlying probe uprp.  Cache this
-	 * status in the clause flags for dt_stmts[n].
-	 */
-	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
-		size_t	len = strlen(pdp->prv);
+	/* Loop over usdt_names entries. */
+	while (dt_bpf_map_next_key(fdnames, &key, &nxt) == 0) {
+		dtrace_probedesc_t	pd = { 0, };
 
-		/*
-		 * If the last char in the provider description is
-		 * neither '*' nor a digit, it cannot be a USDT probe.
-		 */
-		if (len > 1) {
-			char	lastchar = (pdp->prv[0] != '\0' ? pdp->prv[len - 1] : '*');
-
-			if (lastchar != '*' && !isdigit(lastchar)) {
-				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
-				return 1;
-			}
-		}
+		key = nxt;
+		pd.id = key;
 
 		/*
-		 * If the provider description is "pid[0-9]*", it
-		 * is a pid probe, not USDT.
+		 * If the probe exists (as it should), and the process exists,
+		 * we should keep it.
 		 */
-		if (strncmp(pdp->prv, "pid", 3) == 0) {
-			int i, l = strlen(pdp->prv);
-
-			for (i = 3; i < l; i++)
-				if (!isdigit((pdp->prv[i])))
-					break;
+		prp = dt_probe_lookup(dtp, &pd);
+		if (prp != NULL) {
+			list_probe_t		*pup = prp->prv_data;
+			dt_uprobe_t		*upp = pup->probe->prv_data;
 
-			if (i == l) {
-				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
-				return 1;
-			}
+			if (Pexists(upp->pid))
+				continue;
 		}
 
-		/* Otherwise, it is possibly a USDT probe. */
-		dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_INCLUDE);
+		/* Add the key and probe to the delete list. */
+		del = dt_zalloc(dtp, sizeof(del_list_t));
+		del->probe = prp;
+		dt_list_append((dt_list_t *)&dlist, del);
 	}
-	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
-		return 1;
-	if (uprp == NULL)
-		return 0;
 
-	/*
-	 * If we cannot ignore this statement, try to use uprp.
-	 */
-
-	/* We know what function we're in.  It must match the probe description (unless "-"). */
-	if (strcmp(pdp->fun, "-") != 0) {
-		dt_uprobe_t	*upp = uprp->prv_data;
+	/* Really delete entries from usdt_names. */
+	for (del = dt_list_next(&dlist); del != NULL; del = ndel) {
+		ndel = dt_list_next(del);
+		prp = del->probe;
 
-		assert(upp->func);  // never a return probe
-		if (!dt_gmatch(upp->func, pdp->fun))
-			return 1;
+		dt_bpf_map_delete(fdnames, &prp->desc->id);
+		probe_disable(dtp, prp);
+		dt_free(dtp, del);
 	}
 
 	return 0;
@@ -640,8 +588,8 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	if (prp->prov->impl->attach)
 		rc = prp->prov->impl->attach(dtp, prp, fd);
 
+	close(fd);
 	if (rc < 0) {
-		close(fd);
 		dt_attach_error(dtp, rc, prp->desc->prv, prp->desc->mod,
 					 prp->desc->fun, prp->desc->prb);
 		goto fail;
@@ -652,6 +600,7 @@ static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 fail:
 	dt_difo_free(dtp, prp->difo);
 	prp->difo = NULL;
+
 	return 0;	// FIXME in dt_bpf_make_progs() this is a fatal error; should we do the same here?
 }
 
@@ -661,8 +610,9 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	char				probnam[DTRACE_FULLNAMELEN], *p;
 	const dtrace_probedesc_t	*pdp = prp->desc;
 	int				fd = dtp->dt_usdt_namesmap_fd;
-	pid_t				pid;
-	list_probe_t			*pup;
+	list_probe_t			*pup = prp->prv_data;
+	dt_uprobe_t			*upp = pup->probe->prv_data;
+	pid_t				pid = upp->pid;
 
 	/* Add probe name elements to usdt_names map. */
 	p = probnam;
@@ -674,21 +624,10 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	snprintf(p, DTRACE_FUNCNAMELEN, "%s", pdp->fun);
 	p += DTRACE_FUNCNAMELEN;
 	snprintf(p, DTRACE_NAMELEN, "%s", pdp->prb);
+
 	if (dt_bpf_map_update(fd, &pdp->id, probnam) == -1)
 		assert(0);   // FIXME do something here
 
-	/* FIXME passing in NULL pcb and dpr wreaks havoc on error reporting? */
-	/*
-	 * Nick writes:
-	 * This is a general problem with running compiler-adjacent things outside
-	 * compile time. I think we should adjust dt_pid_error() so that it works
-	 * with NULL pcb and dpr at once, probably by using the code path for
-	 * pcb != NULL and augmenting it so that it passes in NULL for the region and
-	 * filename args and 0 for the lineno if pcb is NULL. (dt_set_errmsg can
-	 * already handle this case.)
-	 */
-	pid = dt_pid_get_pid(prp->desc, dtp, NULL, NULL);
-
 	/* Even though we just enabled this, check it's still live. */
 	if (!Pexists(pid)) {
 		probe_disable(dtp, prp);
@@ -697,55 +636,6 @@ static int add_probe_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 		return 0;
 	}
 
-	/* Add prid and bit mask to usdt_prids map. */
-	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
-		dt_probe_t		*uprp = pup->probe;
-		long long		mask = 0, bit = 1;
-		usdt_prids_map_key_t	key;
-		usdt_prids_map_val_t	val;
-		dt_uprobe_t		*upp = uprp->prv_data;
-
-		/*
-		 * For is-enabled probes, the bit mask does not matter.
-		 * It is possible that we have this underlying probe due to
-		 * an overlying pid-offset probe and that we will not know
-		 * until later, when some new pid is created, that we also
-		 * have an overlying USDT is-enabled probe, but missing this
-		 * optimization opportunity is okay.
-		 */
-		if (uprp->prov->impl == &dt_uprobe && !(upp->flags & PP_IS_ENABLED)) {
-			int n;
-
-			for (n = 0; n < dtp->dt_stmt_nextid; n++) {
-				dtrace_stmtdesc_t *stp;
-
-				stp = dtp->dt_stmts[n];
-				if (stp == NULL)
-					continue;
-
-				if (ignore_clause(dtp, n, uprp))
-					continue;
-
-				if (dt_gmatch(prp->desc->prv, stp->dtsd_ecbdesc->dted_probe.prv) &&
-				    dt_gmatch(prp->desc->mod, stp->dtsd_ecbdesc->dted_probe.mod) &&
-				    dt_gmatch(prp->desc->fun, stp->dtsd_ecbdesc->dted_probe.fun) &&
-				    dt_gmatch(prp->desc->prb, stp->dtsd_ecbdesc->dted_probe.prb))
-					mask |= bit;
-
-				bit <<= 1;
-			}
-		}
-
-		key.pid = pid;
-		key.uprid = uprp->desc->id;
-
-		val.prid = prp->desc->id;
-		val.mask = mask;
-
-		// FIXME Check return value, but how should errors be handled?
-		dt_bpf_map_update(dtp->dt_usdt_pridsmap_fd, &key, &val);
-	}
-
 	return 0;
 }
 
@@ -770,8 +660,6 @@ static int discover(dtrace_hdl_t *dtp)
 	 */
 	memset(&pcb, 0, sizeof(dt_pcb_t));
 	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
-		if (ignore_clause(dtp, i, NULL))
-			continue;
 		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb);
 	}
 
@@ -878,6 +766,7 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 				     const pid_probespec_t *psp)
 {
+	char			prv[DTRACE_PROVNAMELEN];
 	char			mod[DTRACE_MODNAMELEN];
 	char			fun[DTRACE_FUNCNAMELEN];
 	char			prb[DTRACE_NAMELEN];
@@ -893,12 +782,13 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	 *
 	 * The probe description for non-return probes is:
 	 *
-	 *	uprobe:<dev>_<inode>::<offset>
+	 *	uprobe<PID>:<dev>_<inode>::<offset>
 	 *
 	 * The probe description for return probes is:
 	 *
-	 *	uprobe:<dev>_<inode>:<func>:return
+	 *	uprobe<PID>:<dev>_<inode>:<func>:return
 	 */
+	snprintf(prv, sizeof(prv), "%s%d", dt_uprobe.name, psp->pps_pid);
 	snprintf(mod, sizeof(mod), "%lx_%lx", psp->pps_dev, psp->pps_inum);
 
 	fun[0] = '\0';
@@ -921,37 +811,40 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	}
 
 	pd.id = DTRACE_IDNONE;
-	pd.prv = prvname;
+	pd.prv = prv;
 	pd.mod = mod;
 	pd.fun = fun;
 	pd.prb = prb;
 
-	dt_dprintf("Providing underlying probe %s:%s:%s:%s @ %lx\n", psp->pps_prv,
-		   psp->pps_mod, psp->pps_fun, psp->pps_prb, psp->pps_off);
+	dt_dprintf("Providing underlying probe %s:%s:%s:%s\n",
+		   prv, mod, fun, prb);
 	uprp = dt_probe_lookup(dtp, &pd);
 	if (uprp == NULL) {
 		dt_provider_t	*pvp;
 
 		/* Get the provider for underlying probes. */
 		pvp = dt_provider_lookup(dtp, pd.prv);
-		if (pvp == NULL)
-			return NULL;
+		if (pvp == NULL) {
+			pvp = dt_provider_create(dtp, pd.prv, &dt_uprobe,
+						 &pattr, NULL);
+			if (pvp == NULL)
+				return NULL;
+		}
 
 		/* Set up the probe data. */
 		upp = dt_zalloc(dtp, sizeof(dt_uprobe_t));
 		if (upp == NULL)
 			return NULL;
 
+		upp->pid = psp->pps_pid;
 		upp->dev = psp->pps_dev;
 		upp->inum = psp->pps_inum;
 		upp->off = psp->pps_off;
 		upp->refcntr_off = psp->pps_refcntr_off;
+		upp->fd = -1;			/* not created yet */
 		upp->fn = strdup(psp->pps_fn);
 		upp->func = NULL;
 		upp->argc = -1;			/* no argument data yet */
-		upp->tp = dt_tp_alloc(dtp);
-		if (upp->tp == NULL)
-			goto fail;
 
 		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
 				       upp);
@@ -1491,13 +1384,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dtrace_hdl_t		*dtp = pcb->pcb_hdl;
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
+	dt_probe_t		*usdtp = NULL;
 	const dt_uprobe_t	*upp = uprp->prv_data;
 	const list_probe_t	*pop;
-	uint_t			lbl_exit = pcb->pcb_exitlbl;
-	dt_ident_t		*usdt_prids = dt_dlib_get_map(dtp, "usdt_prids");
-	int			n;
+	dt_ident_t		*usdt_names = dt_dlib_get_map(dtp, "usdt_names");
 
-	assert(usdt_prids != NULL);
+	assert(usdt_names != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -1508,95 +1400,73 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 */
 	dt_cg_tramp_copy_regs(pcb);
 
-	/*
-	 * Hold the PID of the process that caused the probe to fire in %r6.
-	 */
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
-	emit(dlp,  BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
-
 	/*
 	 * pid probes.
 	 *
 	 * Loop over overlying pid probes, calling clauses for those that match:
 	 *
-	 *	for overlying pid probes (that match except possibly for pid)
-	 *		if (pid matches) {
-	 *			dctx->mst->prid = PRID1;
-	 *			< any number of clause calls >
-	 *		}
+	 *	for overlying pid probes
+	 *		dctx->mst->prid = PRID;
+	 *		< any number of clause calls >
+	 *
+	 * For efficiency, we'll also record if we find an overlying USDT probe
+	 * in the list (there can only be one).
 	 */
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		uint_t			lbl_next = dt_irlist_label(dlp);
-		pid_t			pid;
+		dt_probe_t	*prp = pop->probe;
 
-		if (prp->prov->impl != &dt_pid)
+		if (prp->prov->impl == &dt_usdt ||
+		    prp->prov->impl == &dt_stapsdt) {
+			usdtp = prp;
 			continue;
+		}
 
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
-
-		/*
-		 * Populate probe arguments.
-		 */
+		/* Populate probe arguments.  */
 		if (upp->flags & PP_IS_RETURN)
 			dt_cg_tramp_copy_rval_from_regs(pcb);
 		else
 			dt_cg_tramp_copy_args_from_regs(pcb, 1);
 
-		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and emit a sequence of clauses for it when it does.
-		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6, pid, lbl_next));
+		/* Set PRID and call the clauses for the overlying probe. */
 		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id));
 		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
-		emitl(dlp, lbl_next,
-			   BPF_NOP());
 	}
 
+	/* If not USDT probe was found, we are done. */
+	if (usdtp == NULL)
+		goto out;
+
 	/*
 	 * USDT.
 	 */
 
-	/* In some cases, we know there are no USDT probes. */  // FIXME: add more checks
-	if (upp->flags & PP_IS_RETURN)
-		goto out;
-
+	/*
+	 * First check whether the USDT probe is active, i.e. its probe ID is
+	 * in the usdt_names BPF map.  If not, ignore it for now.
+	 */
+	emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), usdtp->desc->id));
+	dt_cg_xsetx(dlp, usdt_names, DT_LBL_NONE, BPF_REG_1, usdt_names->di_id);
+	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
+	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
+	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
+
+	/* Set up probe arguments. */
 	if (upp->sargc)
 		copy_args(pcb, upp);
 	else
 		dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
-	/*
-	 * Retrieve the PID of the process that caused the probe to fire.
-	 */
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
-
-	/*
-	 * Look up in the BPF 'usdt_prids' map.  The key should fit into
-	 * trampoline stack slot 0.
-	 */
-	assert(sizeof(usdt_prids_map_key_t) <= DT_STK_SLOT_SZ);
-	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), BPF_REG_0));
-	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0) + (int)sizeof(pid_t), uprp->desc->id));
-	dt_cg_xsetx(dlp, usdt_prids, DT_LBL_NONE, BPF_REG_1, usdt_prids->di_id);
-	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
-	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
-
 	if (upp->flags & PP_IS_ENABLED) {
 		/*
-		 * Generate a BPF trampoline for an is-enabled probe.  The is-enabled probe
-		 * prototype looks like:
+		 * Generate a BPF trampoline for an is-enabled probe.  The
+		 * is-enabled probe prototype looks like:
 		 *
 		 *	int is_enabled(int *arg)
 		 *
-		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
+		 * The trampoline writes 1 into the location pointed to by the
+		 * passed-in arg.
 		 */
 		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(0)));
@@ -1608,17 +1478,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		goto out;
 	}
 
-	/*
-	 * Continue with normal USDT probes.
-	 */
-
-	/* Read the PRID from the table lookup and store to mst->prid. */
-	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
-	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
-
-	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
-	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
-
 	/*
 	 * Apply arg mappings, if needed.
 	 */
@@ -1629,51 +1488,21 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	}
 
 	/*
-	 * Hold the bit mask in %r6 between clause calls.
+	 * If the probe does not have clauses (yet), it was recently discovered
+	 * and we need to populate the clause list with any that match the
+	 * probe specification.
 	 */
-	for (n = 0; n < dtp->dt_stmt_nextid; n++) {
-		dtrace_stmtdesc_t *stp;
-		dt_ident_t	*idp;
-		uint_t		lbl_next;
+	if (dt_list_next(&usdtp->stmts) == NULL)
+		dt_probe_add_stmt_matchall(dtp, usdtp);
 
-		stp = dtp->dt_stmts[n];
-		if (stp == NULL)
-			continue;
-
-		if (ignore_clause(dtp, n, uprp))
-			continue;
-
-		idp = stp->dtsd_clause;
-		lbl_next = dt_irlist_label(dlp);
-
-		/* If the lowest %r6 bit is 0, skip over this clause. */
-		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
-		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
-
-		/*
-		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
-		 *	      goto exit;      // ldw %r0, [%r0 + 0]
-		 *			      // jne %r0, act, lbl_exit
-		 */
-		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
-		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
-
-		/* dctx.mst->scratch_top = 8 */
-		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
-
-		/* Call clause. */
-		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
-		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
-
-		/* Finished this clause. */
-		emitl(dlp, lbl_next,
-			   BPF_NOP());
-
-		/* Right-shift %r6. */
-		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
-	}
+	/*
+	 * Call the clauses for the USDT probe:
+	 *
+	 *	dctx->mst->prid = PRID;
+	 *	< any number of clause calls >
+	 */
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, usdtp->desc->id));
+	dt_cg_tramp_call_clauses(pcb, usdtp, DT_ACTIVITY_ACTIVE);
 
 out:
 	dt_cg_tramp_return(pcb);
@@ -1681,111 +1510,65 @@ out:
 	return 0;
 }
 
-static char *uprobe_name(dev_t dev, ino_t ino, uint64_t addr, int flags)
+static int uprobe_create(dtrace_hdl_t *dtp, const dt_uprobe_t *upp,
+			 uint64_t refcntr_off)
 {
-	char	*name;
+	struct perf_event_attr	attr = { 0, };
+	dt_provider_t		*pvp = dt_provider_lookup(dtp, dt_uprobe.name);
+	uprobe_data_t		*udp;
 
-	if (asprintf(&name, "dt_pid/%c_%llx_%llx_%lx",
-		     flags & PP_IS_RETURN ? 'r' : 'p', (unsigned long long)dev,
-		     (unsigned long long)ino, (unsigned long)addr) < 0)
-		return NULL;
+	if (pvp == NULL)
+		return -1;
+	udp = pvp->prv_data;
+	assert(udp != NULL);
 
-	return name;
-}
+	attr.size = sizeof(attr);
 
-/*
- * Create a uprobe for a given dev/ino, mapping filename, and address: the
- * uprobe may be a uretprobe.  Return the probe's name as
- * a new dynamically-allocated string, or NULL on error.
- *
- * An optional refcntr_off - used by stapsdt probes to identify semaphore
- * address - can also be supplied.
- */
-static char *uprobe_create(dev_t dev, ino_t ino, const char *mapping_fn,
-			   uint64_t addr, uint64_t refcntr_off, int flags)
-{
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
-	char	*spec;
+	if (udp->perf_type == -1) {
+		udp->perf_type = get_perf_type();
+		if (udp->perf_type == -1)
+			return -1;
+	}
+	attr.type = udp->perf_type;
 
 	if (refcntr_off) {
-		if (asprintf(&spec, "%s:0x%lx(0x%lx)", mapping_fn, addr, refcntr_off) < 0)
-			return NULL;
-	} else {
-		if (asprintf(&spec, "%s:0x%lx", mapping_fn, addr) < 0)
-			return NULL;
+		if (udp->ref_shift == -1) {
+			udp->ref_shift = get_refcnt_shift();
+			if (udp->ref_shift == -1)
+				return -1;
+		}
+		attr.config = refcntr_off << udp->ref_shift;
 	}
 
-	name = uprobe_name(dev, ino, addr, flags);
-	if (!name)
-		goto out;
-
-	/* Add the uprobe. */
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
-	if (fd == -1)
-		goto out;
-
-	rc = dprintf(fd, "%c:%s %s\n", flags & PP_IS_RETURN ? 'r' : 'p', name, spec);
-
-out:
-	free(spec);
-	if (fd != -1)
-		close(fd);
-	if (rc < 0) {
-		free(name);
-		return NULL;
+	if (upp->flags & PP_IS_RETURN) {
+		if (udp->ret_flag == -1) {
+			udp->ret_flag = get_retprobe_flag();
+			if (udp->ret_flag == -1)
+				return -1;
+		}
+		attr.config |= udp->ret_flag;
 	}
 
-	return name;
+	attr.uprobe_path = (uint64_t)upp->fn;
+	attr.probe_offset = upp->off;
+
+	return dt_perf_event_open(&attr, upp->pid, -1, -1, 0);
 }
 
 static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
 {
 	dt_uprobe_t	*upp = uprp->prv_data;
-	tp_probe_t	*tpp = upp->tp;
-	FILE		*f;
-	char		*fn;
-	char		*prb = NULL;
-	int		rc = -1;
-
-	if (dt_tp_has_info(tpp))
-		goto attach_bpf;
 
+	assert(upp->fd == -1);
 	assert(upp->fn != NULL);
 
-	prb = uprobe_create(upp->dev, upp->inum, upp->fn, upp->off,
-			    upp->refcntr_off, upp->flags);
-
-	/*
-	 * If the uprobe creation failed, it is possible it already
-	 * existed because someone else created it.  Try to access its
-	 * tracefs info and if that fails, we really failed.
-	 */
+	upp->fd = uprobe_create(dtp, upp, upp->refcntr_off);
 
-	if (prb == NULL)
-		prb = uprobe_name(upp->dev, upp->inum, upp->off,
-				  upp->flags);
-
-	/* open format file */
-	rc = asprintf(&fn, "%s%s/format", EVENTSFS, prb);
-	free(prb);
-	if (rc < 0)
-		return -ENOENT;
-	f = fopen(fn, "r");
-	free(fn);
-	if (f == NULL)
-		return -ENOENT;
-
-	rc = dt_tp_event_info(dtp, f, 0, tpp, NULL, NULL);
-	fclose(f);
-
-	if (rc < 0)
-		return -ENOENT;
-
-attach_bpf:
 	/* attach BPF program to the probe */
-	return dt_tp_attach(dtp, tpp, bpf_fd);
+	if (ioctl(upp->fd, PERF_EVENT_IOC_SET_BPF, bpf_fd) < 0)
+		return -errno;
+
+	return 0;
 }
 
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
@@ -1936,59 +1719,6 @@ oom:
 	return dt_set_errno(dtp, EDT_NOMEM);
 }
 
-/*
- * Destroy a uprobe for a given device and address.
- */
-static int
-uprobe_delete(dev_t dev, ino_t ino, uint64_t addr, int flags)
-{
-	int	fd = -1;
-	int	rc = -1;
-	char	*name;
-
-	name = uprobe_name(dev, ino, addr, flags);
-	if (!name)
-		goto out;
-
-	fd = open(TRACEFS "uprobe_events", O_WRONLY | O_APPEND);
-	if (fd == -1)
-		goto out;
-
-
-	rc = dprintf(fd, "-:%s\n", name);
-
-out:
-	if (fd != -1)
-		close(fd);
-	free(name);
-
-	return rc < 0 ? -1 : 0;
-}
-
-/*
- * Try to clean up system resources that may have been allocated for this
- * probe.
- *
- * If there is an event FD, we close it.
- *
- * We also try to remove any uprobe that may have been created for the probe
- * (but only if we created it, not if dtprobed did).  This is harmless for
- * probes that didn't get created.  If the removal fails for some reason we are
- * out of luck - fortunately it is not harmful to the system as a whole.
- */
-static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
-{
-	dt_uprobe_t	*upp = uprp->prv_data;
-	tp_probe_t	*tpp = upp->tp;
-
-	if (!dt_tp_has_info(tpp))
-		return;
-
-	dt_tp_detach(dtp, tpp);
-
-	uprobe_delete(upp->dev, upp->inum, upp->off, upp->flags);
-}
-
 /* Clean up the private provider data. */
 static void destroy(dtrace_hdl_t *dtp, void *arg)
 {
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index ef8f730a..82965fbd 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -162,8 +162,6 @@ typedef struct dtrace_stmtdesc {
 #define DT_CLSFLAG_DESTRUCT		0x0020	/* destructive */
 #define DT_CLSFLAG_RETURN		0x0040	/* aggregation */
 #define DT_CLSFLAG_AGGREGATION		0x0080	/* return action */
-#define DT_CLSFLAG_USDT_INCLUDE		0x0100	/* could be used in USDT clause */
-#define DT_CLSFLAG_USDT_EXCLUDE		0x0200	/* could not be used in USDT clause */
 
 typedef int dtrace_stmt_f(dtrace_hdl_t *dtp, dtrace_prog_t *pgp,
     dtrace_stmtdesc_t *sdp, void *data);
diff --git a/test/unittest/usdt/tst.defer-Z-basic.sh b/test/unittest/usdt/tst.defer-Z-basic.sh
new file mode 100755
index 00000000..a7d1d015
--- /dev/null
+++ b/test/unittest/usdt/tst.defer-Z-basic.sh
@@ -0,0 +1,102 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# This test verifies that DTrace discovers and processes USDT probes in a
+# process that gets executed afer the DTrace session has started (-Z is
+# required).
+
+dtrace=$1
+trigger=`pwd`/test/triggers/usdt-tst-defer
+
+# Set up test directory.
+DIRNAME=$tmpdir/defer-Z-basic.$$.$RANDOM
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Make a private copy of the trigger so that we get our own DOF stash.
+cp $trigger main
+
+# Start dtrace.
+$dtrace $dt_flags -Zq -o dtrace.out -n '
+testprov*:::foo,
+testprov*:::bar
+{
+	printf("%s:%s %d\n", probemod, probename, pid);
+}' &
+dtpid=$!
+
+# Wait up to half of the timeout period for dtrace to start up.
+iter=$((timeout / 2))
+while [ $iter -gt 0 ]; do
+	sleep 1
+	if [ -e dtrace.out ]; then
+		break
+	fi
+	iter=$((iter - 1))
+done
+if [[ $iter -eq 0 ]]; then
+	echo ERROR starting DTrace job
+	cat dtrace.out
+	exit 1
+fi
+
+# Start trigger process.
+./main > main.out &
+tpid=$!
+
+# Confirm that dtrace is still running (otherwise trigger run forever).
+sleep 2
+if [[ ! -d /proc/$dtpid ]]; then
+	echo ERROR dtrace died after trigger started
+	kill -USR1 $tpid
+	wait $tpid
+	exit 1
+fi
+
+# Wait for process to complete.
+wait $tpid
+
+# Kill the dtrace process.
+kill $dtpid
+wait
+
+# Check the program output (main.out).
+echo "$tpid: undefined 1 0 10 10 10" > main.out.expected
+awk '{ $2 = "undefined"; print }' main.out > main.out.post
+if ! diff -q main.out.post main.out.expected; then
+	echo program output looks wrong
+	echo === was ===
+	cat main.out
+	echo === got ===
+	cat main.out.post
+	echo === expected ===
+	cat main.out.expected
+	exit 1
+fi
+
+# Regularize the DTrace output, and check it.
+awk 'NF > 0 { map[$2 " " $1]++; }
+     END { for (i in map) printf "%s %d\n", i, map[i]; }' dtrace.out > dtrace.out.post
+
+echo "$tpid main:bar 10" > dtrace.out.expected
+
+if ! sort dtrace.out.expected | diff -q - dtrace.out.post; then
+	echo dtrace output looks wrong
+	echo === was ===
+	cat dtrace.out
+	echo === got ===
+	cat dtrace.out.post
+	echo === expected ===
+	sort dtrace.out.expected
+	echo === diff ===
+	sort dtrace.out.expected | diff - dtrace.out.post
+	exit 1
+fi
+
+echo success
+
+exit 0
-- 
2.43.5

