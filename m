Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D517258CF8
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750801232; cv=fail; b=F3/XBuQUep28Ud8Qz5pgnY3wXlI/BLvGToFMrlxqY6mnNKT2+tWflrCGvFNbSNgo4UysZQgmQjRCdil5UfHBKXPMRnqJV0fK5yqIQuLaJdWUYcCQlAJPedX760WckYkXEJt4UKuY0qqDThE/j166QgypcBf/Giw4YtGdDrB3ANw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750801232; c=relaxed/simple;
	bh=M4+/KLhgBecpenHmvSVF+WK75ASxRUKCUSVIamnuHf8=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=XycBdrN7OtadmPhYP7pwAOjTlqavhKgv1Qfn8y4cZ8iwqsFYqPagetQOVJrqWG016r5u7hy5/x8wVDQSgBiy49SgSXyGfyKBFrSbAkaZ05tMbaIjol7GnR3Em+3gwme5QaB4ir5thfouWmU2K0EGcImE2s7GCYIxIc+899pyYe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ro4zH8oI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aNk/4xts; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ro4zH8oI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aNk/4xts"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OL2CFO012661
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=+Lsukd0WduAqWLXJJ0f/LZpEsN7NjIKJsVzmehmxyg8=; b=
	Ro4zH8oIzt3c498BdcbqbdQOnPayxSyHnSPGb6n6DfTkpNshz1GfLNRgILp3+gvZ
	LuV899VQmVRyavaG6EFcmXyL76MwRQMAd3CULx5jNpV9vEyRptDmOxzVy9utAzRB
	ctln6O9QMZdYKf9oASy3IWo/Fp9tBPS3gTaAz1lb1qHqrCx1IYqqyP2I4xYCYA4L
	SjTpWwL51WEfj/kQBEvZ92KyYGnTDTslDG3KDO3NjrHjr9NvnwRLDK3h9Kvtp6/K
	KDcG2SmAe2zzSdnsN650QsOULWDXs84xpoXYnoWPCDlUKvceaWTI4uwiDX2vrnMU
	CvPe+0sdkHr1wKUYnOzWGw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y6511-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OKxwf0039579
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr56yhf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4Nwbxas9Ko3u/bKiFS1bfiiqmRxHJKMGHeqTIl3bvJkkJL9r4pXvr4EFlgZ/yHGL/FLu8R6uYeLI6YPwptPMG7dJEg5HnupzFOzkNV+puYVamg2phJEz9vFb2mirvPOz8FpOwJ16voOt3YOBc2WokY34vL5rnNalQRUQqys4xoepCMdo9l6xQjcq9tyP4kuuC7WQ/gQdTak2X7ApXTCIahz6g8TN4ZTTwFK6xIjqw8kZUkCgLV/O3e9/CkcCQzV2JPvIlomLJXDjbaqG7TUhGoemRHfHW7e2I7WsmsE1uDzQYAk8TK7GcbnHnNw7IA17vFS3cv2mGWdjZwzI1HpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Lsukd0WduAqWLXJJ0f/LZpEsN7NjIKJsVzmehmxyg8=;
 b=CfIZgWCkL2k1AJ+Yc0Vx0mahjH/n6cy+iU7FFPgXU6TESYTLWZPKiSTZb06eVbi9ZRrrJuH0PdnbiUBjpkFS+5LD38EBt1OEyVX/HGXARVwhSv2NffTs8sykkfzWyHGi18G4UAiTm0hegyC4hAVAQlZoJ9G4+Kxp0eJsKO0t4EmSKbM4rJyMjI7pcUC0IaAFKJKeUzkYYDs4OHzuNCqfelR0FPHd3XUtDzeoLb6ot9bWaF56SJw+AYhBjb5uAXGMAG80Xcj1KnjDk9c2KyJ/YwmPk8tCLS2V7q2yzMxkcI8bY+eY1QKQlabBvqNukTrsErEzVxHfWovX516izCeTvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Lsukd0WduAqWLXJJ0f/LZpEsN7NjIKJsVzmehmxyg8=;
 b=aNk/4xtsHxGOqtm5f2KCnqMf7rzoykFN5pY4YSdA/QISzLATwq/8JMIA+Vszp7eJUncDGXqnivi8VZnTOg+fr6iI1FatlNBi/xE2MEuF86+t3QpjYivLjx6wRJRQYMIFhIdn4wng5Qw8sYu83s1F+7yrZI6FVAyBff54Qwv3kzs=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8661.namprd10.prod.outlook.com (2603:10b6:208:581::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 24 Jun
 2025 21:40:25 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 21:40:25 +0000
Date: Tue, 24 Jun 2025 17:40:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/3] usdt parser: remove left-over debug statement
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672830B66B21D81EF3D07ABC278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ea987d-2d6d-4db0-5f17-08ddb367ba8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6M/bPOBP7EbV3GNJPy0s0YyPqdKiJFmq4bpD6AEKdjHTOaqCrgChKcrdix87?=
 =?us-ascii?Q?gbctwVfA+n7M/AopCuQXMJfZpyIck9NnY7xiCZXwcE4ZdctERyUi9Aldjh9C?=
 =?us-ascii?Q?V9u5A+KcG4cfJ+ynr+f2mAWLHW6xdq6JuvZM//O4opTOwVShnjWj2IP/Qac+?=
 =?us-ascii?Q?snMlrFgXSoTADS7TdvmG1boWX6ZzFBHzE+OTtwMmh9Z5lG+ma/YDoLnPwgAB?=
 =?us-ascii?Q?vqpIwWa6YcG/FsBRSZYhNTXAVVpwODdwlteJNaF7ThbFZL7zojLYjcPY1ngn?=
 =?us-ascii?Q?kptLY1xyLJNoLjnMWrdddTX+t3o2tMLt6x5sCdKI2pkG+Nl3EhWuW26IKE3n?=
 =?us-ascii?Q?9w8+/UBirmObimuXL0meQkNaL1YQf69Ix37Ayp9NIHxWp5KQL17XOruu5t1u?=
 =?us-ascii?Q?0OEZItU4zIpewfq/Eo7I+gm8VPYqWdHLzuQvjHQnFZxFt7RsT9wxy8GYTJr2?=
 =?us-ascii?Q?cyUocrXU2TyssOVH+J8pd2y7ggkveQ3PSJRwPJYQ7ZC1bDk9vK4F/PNYuq/O?=
 =?us-ascii?Q?tC8O6HA+rDjVjiXE82IKyibY9dTnvOp1AjXTVjLZYPo8l2n3KaNa7jnv0VZp?=
 =?us-ascii?Q?QyVYP94YFeS7ftjRUQE5p4btNng0H2U7Mhneninqy4Biov0hXawStZ+VLxf9?=
 =?us-ascii?Q?/ELzukcthhm2x9nk7rkaBfrh6+Ib6ea9SQT4DCkx5SUElQQnbvLwfvxsVzqM?=
 =?us-ascii?Q?Yp3NofjzPWCP50rQu+OYwlc2TuSU7o7ETqJgcPLMZRFyadjzM94cM1lk6vRr?=
 =?us-ascii?Q?oUMd2SO55NP0OCld1eU6QS+Lh4cCgAHyfTWEA/P7RnPE26hnMFm1xJWvf9CK?=
 =?us-ascii?Q?+H+jC6JUB/taUfmvy8udZL9YpQNlakRGPUDqC9KtzxXfa40FGZmOD0V+sgc7?=
 =?us-ascii?Q?mqqJDvCQf2O4K7FY5ZV2dYbrooN4YexXP658Vl203fIFjidJA+aLylURL0kP?=
 =?us-ascii?Q?1etdNbGhMOniNsIqc2bflm068+7wDGlPohL/o3B20Jgrw3EoXsm7yjW/H3Q9?=
 =?us-ascii?Q?iu2FF7nBYUmeSkxN67e8bpZNdR0NmSNU9DT/dlSIme9INPJPOvOXyvFnWZhZ?=
 =?us-ascii?Q?jde3YV57Wc//2Cup/xu2IZxlDmPllX79n9P/llXjPQt7i2bSRpmYvbn7iRFB?=
 =?us-ascii?Q?6fZhyq7ROK4O8fwZrUN1haCgQ0vaG5TrAEGxD+E1374n984bKnCKi5u0/44M?=
 =?us-ascii?Q?OozW0CPkH2atLraOB22KHyZxY/rdcJL046Kd6rY4RHqhaZ1qT3q6KqNAl/Op?=
 =?us-ascii?Q?NtMC1mF15qbVNT5MGk/I7zsqBPSnQmwo3u/1U8/kIhvkfmUwH7kYWrP6IF/Z?=
 =?us-ascii?Q?BxEB7D3p3gLF6eAF63hd3IZhk2KARfuwpyb+6tj3DmN4j8m4PDmOKawFNgvy?=
 =?us-ascii?Q?F/AfQvLhRzlQ5/H4vRhNV9MK2hS2u0jyJ3EunFfSISdGM3OHBonTrNcecOTm?=
 =?us-ascii?Q?3VLvzAnK2Oc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dIXRQLQvjw6+HD6F1qwTqBOnlzt3bdsXCxlRTzvUPM07uQ6FUIzrY6E1ytv8?=
 =?us-ascii?Q?E+Ic65F1FvtOuaeE2M1ZodsFR1ggS1arHm6aHtbcLxfwJcy582Glf6HapBEE?=
 =?us-ascii?Q?saZblYAmfN1mJugBZYLiN/3N81vnGwFkqW+bbNiOzFX613+3ytvVipuN99ln?=
 =?us-ascii?Q?NrG6sJEU/p+erIQIjqrl9HH0WBXFCK/1q/VgBx1vOrS71wlSlhe4WkwnHLU1?=
 =?us-ascii?Q?wDujfuICteV20H9p6dTt4cLR3ilE7Eq9ttx8nodEsiVvntIgyPw+G8eFthNW?=
 =?us-ascii?Q?F5p9jRjCmEQOZ3BVuNYyXvXqHTa012gqiEmL6lfNF+SJkvF7VVgQbmbFf4+r?=
 =?us-ascii?Q?hd5dtPz2+84hiiyOZouGQx3oJ7tbZwotVcZGIb2LPvKeEc9/fCzPYcPYm157?=
 =?us-ascii?Q?QZyrcVZx3vPTb4CBOaFavR1X5XBjqkEZ17O/IwQzdUMO/H3EkOI04vK1Vt5z?=
 =?us-ascii?Q?sEk4SSc/8Mt3vD4Bt9V9kxJ3k5X3/isRP6FEVW+in0HNo1OEA0q5UyHLbh3H?=
 =?us-ascii?Q?vaILRhLEAck7BqxDFhIum+J7pMCWmhsbr0huf904G6RdcmT5teMo/XWjS2Tw?=
 =?us-ascii?Q?iPQ75Mog6jqR+S0F9Gk1gf5RAPqXTkQ+vX2JMLZrvl7jlEahxw9K3pmztsqG?=
 =?us-ascii?Q?ygO0avGMqhp7h80hU1wuBKR2jyzgEmP0+Pa3mLu8D+Wjmx7btuwXCHKqNEvt?=
 =?us-ascii?Q?NMyM4yoWAF5SeB0TnghAfp0w1Q6IDhNwFDSYMPDAkO2xG5g4wbNBbflYi4xv?=
 =?us-ascii?Q?Jr+9QcOgxZliOVnOXTkL+QuokTZd5BZv4GWQhH2QcJvno2TxouSzrH+i/i0A?=
 =?us-ascii?Q?so7PTGOXz68D2PQijGCaC2FCERGZvyoZg2jP1fXNT80W8GkGpQkg1RfHivGx?=
 =?us-ascii?Q?KW9h0oOHXloOYJNfvIsWdPqo05UTIXGTGc84aprL1xz/AF9Pg0tI+EnPP2Ah?=
 =?us-ascii?Q?WhTKPmWcsHDH8kqz8PeRZ3dc5rQYNX7bipmKHNw0luQDtLs2W2jIidU1pyy+?=
 =?us-ascii?Q?PyVjGa3LNRhJdyeHjGlprVmo3LrQ/VuuDQJknleSqwsqOvRN+MspsXXriZix?=
 =?us-ascii?Q?ZvlEN7hY7xQNT/lFglA9KxeJWCcqXztcwnLDJiXEUasgKvHd2PMeHQUEdg1a?=
 =?us-ascii?Q?oE+JMoRI5KyJe1RQmKgSH+QOXPaoe6qg3GXLXYRpydlExs4zQjuth6M8JtSj?=
 =?us-ascii?Q?Z7OHi8Nj91n5dUuvAl61IemwqB8wCjSZpORdkM3PETbnYyw3Y8wTPZkPxSfN?=
 =?us-ascii?Q?QtYNvwQ33aRA8SIT5ZVSJWudh42Q6EIsuD3TE2127EDe/+Be+AOml5TZOlsQ?=
 =?us-ascii?Q?l8FEZOzzMFT6J1wrKIFGVkBUK0+VKKjvsC/BZgtdLpeiAqT6R7nSa7yi349L?=
 =?us-ascii?Q?rJwCrPJ4RNPY0Xgz1JH9oAq6Z4h1IGBjgeBSa1EtmJBaOiHXH7DngwCIyF3y?=
 =?us-ascii?Q?aVSvCupdWZENVurjI9ts+AT3ivV8ksq6fA6Dfadr5uyDmpiHzOpntGKOzIAy?=
 =?us-ascii?Q?b/MbDbuEPb6VZqTu/HsDvPf9jctX3HPisqcN8R76oIVOI1r6a42Qzd1/lNlc?=
 =?us-ascii?Q?203QAimeJXMwABorQJGCKSl6Cby7YVmWXVG0X9MwmKyKSvqxdv831jF8RHLN?=
 =?us-ascii?Q?pQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9TjxQH+rQmFXgJ/Ld21RlAg6qxCgV3NAruFv+hT6dmyEDNvZN6Je/Vk+SGfXTzuE/+YEduieDf/yPWXGs/ls1p/omQMzuBkXmtCxv84REY/A6P31qHKxc8uTat3yqDTktvM8d++khP4kam8KFqhp+xlFxQSIxlAiHSQWuG1xsdpbYzsDYyOmPOXBgduJLmZWU/w02MC5XpqToozpCT4O5ASeb6U6RJvjR+GElFBSH9vYj16ysBXfUaTEuZ/NNgPKA07OzLu/whoxgfxPM3wAQs0huPlJoU+3UTzlXzAAM9Hbhm+po8regoEKS5NJyhUObZJlkNMJCsBvaLwyFP0l1/kR0M3IEWQE7rtw5Li4ZjBBuxqUPqKFBinN2emklxR7RpNqhILLs7L1KpQH6jT1BMPE80OmnkOjhmX+uxNgDAExjnUAu0b7h+FXWPkeHuSiwn2PfkjcwgI/WJeUd0KwF9jDD4C7qesdygj0QNPsntGM1AX/ZJoDnpU5GCqmULJXixNBr8tCKLCNj0muUIjoi4J9tWVrLu05bIX2nBJ987dLCBlc+psWPwo17bK/zzJoM/5cW02+Gt4LSAJxabzbFAZTV2/B+Bz8mA5dySDVbV0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ea987d-2d6d-4db0-5f17-08ddb367ba8e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:40:25.0113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvjCFCUiZMVmmty+Iqc8ar8iDKoVEwMk8gQ63+APWHmKWocyEYuOrkOi+3cU+aabW0bGC2on9PNMzbK8Rg1uXYraucxyVynGt9DFHKcM1ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240172
X-Proofpoint-ORIG-GUID: dqk1fxqLY5F61hPdCmo0ou_omvS2AX55
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3MiBTYWx0ZWRfXzLsO/QGoeqAw C6AkeW4Ld81KgXMsgWLQFG8T2aFtjHbhEbnZhYID4nRaoY3L14UD190mTdtAOiqP3CvtYvIYAe8 EjtZk+8mSy/RvqnChxRKBdqA+8eXydfOVwE3Mo9+XohkUiq65wETTy4f+kQ0bh0uvGkaQLWSmH3
 6Bd4ffLpVS2s5LHQlmgFlAFoOMUNwalLAsWF1likQSwjObP4cPmu11XmsIfOmj2TSls3jHu67fX mqfnSJjileePedaVTR3rG5JdZEv2ig67yIsjfM0cCtuaeiQF9aWHLuRd38pc9kR6sJXkFAdlT4a TcHXoxn0Cqf84QZevAqfsLJHYVjEKA++TQFyxfjhriXTIheMhHsGB8fChonOyrSnqPajJoe1DX4
 T7ZL197fhV/lZdp4rVt8eNJUfo5eiyt2/FGXGAOXzqx0WynCUSi6ddoCoYVJhFlbXCB4S04G
X-Proofpoint-GUID: dqk1fxqLY5F61hPdCmo0ou_omvS2AX55
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685b1b4e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=np4bkWn-7rfrobCGUDEA:9 cc=ntf awl=host:13206

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/usdt_parser_notes.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index 0b0e1a7a..fb57f119 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -287,7 +287,6 @@ strarray_size(uint8_t cnt, const char *str, const char *end, size_t skip)
 		if (p >= end)
 			return -1;
 
-dt_dbg_usdt("%s: [%s] [%hhd]\n", __func__, p, *(p + strlen(p) + 1));
 		p += strlen(p) + 1 + skip;
 	}
 
-- 
2.43.5

