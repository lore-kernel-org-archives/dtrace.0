Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D2327BFC
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 23:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769039525; cv=fail; b=BQNzk+MAyhrb1EK/8mLw7IsC03luqbUdn0gyJrPeMj0FqMPm8k9aQDWeWOfJ46WGM7M7TLEx6KFyHzAj/ua20VOfBt8vVuxsDsBgRsI/vT8UVl7ZRrG3wrnaSYNH/Zscn9XNskGz/BaU+KaNXwf4bUbb3dXG0tQjLjKAg7bKkFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769039525; c=relaxed/simple;
	bh=1TNvm/WcP+EQ6FgSGxjr5nO7g3+f1iSaZbNf8NoYZ/k=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=F1HvUaLmfNyGewKAO1XQjds1dP0yj6fzOLZkJTdcrIFij3wQZzarhKEl7FE31icY883QyjJlL9vTVoPR6mOVft2fJPvAwpVHjnwIHW671DRo63/kUC3Jvg6kW3lbRRoWXwb025RFY0h8ijAP1XGJGXPAZtJqpFHJ4bXKePBfLWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Qx00cMpC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=S8ACNk/P; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Qx00cMpC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="S8ACNk/P"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LJVKXH3523415
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 23:52:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Rp5B8QBQhtw1hb3ix0R8RJwzTi2lPtqoV1RrwUpJkqY=; b=
	Qx00cMpCgmMBP7ynTVjBf3nnIkLFjkJfkZr6NNuuszu9ZkQaS8PoGMMmw+ZqYcz5
	hxiTuYrGkTkxtxRpwbQ4Fw/i+oX7nMLzsnFvC9GmZ2WZRS937BodS7MdINVhBzL+
	+W+h0HVG2ERofywFxJRV7v31JWI5zji1P8HyNywdXekskn9J6syJmzEKwbswWoIM
	S8NSDqIhSDqGvlWy5VWYXxROc55zH0xClCpM43iXriANPT6KJnvmOB6w7v2sQhy7
	V7o7QLeIjdvH+ACVstm9gRtQhjPkMjgF5RepGhqvhpmV8tXTJYnuA2+2b6eecSMY
	bwhzi1fIJsdLNOWgk6VF2g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br21qf31r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 23:52:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60LMRq0c021921
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 23:52:00 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vft5cs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 21 Jan 2026 23:52:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fco2lNuui2mcBbkVgPOq2OoePtrx6QzJ6XneYk0Zwu/Hw/xWmSr3aLPtcCWiq6iTE0KXnAJB+mZqELDC8RNRzWpn0mxczhYbZXR8dSDncuEsrOeUHUTDyU/rJ56BpYg9SEemX1JUfsj5EmPkbKZULBRRESi8rohlaVxo4JcTuMYhBnBxF/myCslvqeTDAPVT/RW3dANc2cxj8ycdLX7feZWL60dqj+tmxHqNZoZwbTVZUsqcf80sxyb4KK2nRFxCpMCilAV8p7ouYD9YRsgwE3twRl4EA6FoWrQDcioyS+r4N665gENPAGOAJDN/HOuFVdCyLUMjdnnDPe0p4naA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rp5B8QBQhtw1hb3ix0R8RJwzTi2lPtqoV1RrwUpJkqY=;
 b=VfvUpIxvS7fHxqUvWIaktXao4jFAxkhGP6jyeIwE708DRQ8ZtG2fJSQ2KOK5+gGiiTbVOayd6cJW8xeLqAXcx+V/mjXb3VwgNa4Fl1NVnbFRlBfsWCRDfCZ2bW5L+gsH9pPoBzpSrvrjN3UiyB1wHBv+wOmkEeYBtY43jQ86e62HCN61MJf1LMx4XvSxBASaxPd+tLx0NGoeZsZKZT2aD3bHphVtv8z6uf7xA/Np8PMP2dZOrxAuEcEWk9rKAbjuchBNjXR1LiZiElSsFomSmFn9OxmT4PuZtjIxf9rf7jdIL0RmZ4gCYqH59yj7z3PEtbN/HHFVh3e8coDQSezIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp5B8QBQhtw1hb3ix0R8RJwzTi2lPtqoV1RrwUpJkqY=;
 b=S8ACNk/PjShdBaT/FlU7Tj8MjyW9BMvEwB1tgEi4P1vcGDONk1XBRcTXMxUndGVmHyeF73Pvnpoh6HE7lQZUK8UDjBJ7XT1bQjqf4hHxH2e+DHAL1JgkJ2bTVl15f5L9/wGgfsgciUMUzpfxmgLVqgdWtKHbTRtng1f/kKYiw5E=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA4PR10MB8610.namprd10.prod.outlook.com (2603:10b6:208:55f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 23:51:55 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9542.009; Wed, 21 Jan 2026
 23:51:55 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Change stack_skip to 3
Date: Wed, 21 Jan 2026 18:51:54 -0500
Message-Id: <20260121235154.4600-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH8P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::23) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA4PR10MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 2027e783-0784-46ea-3f45-08de59480eeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tlzVpeCafIbN1ebRdBBb7TKnu+rM/a/ItvKLI96svNaRfpDPLLKaRWsHu9IC?=
 =?us-ascii?Q?gVYUWvUsWSsiuwTeqLD0yN/IEvGrHZn42LYvUV7o1mHkFsvlZdrjXpxr5LDL?=
 =?us-ascii?Q?fU4xSLs2HSIx82vW1N5tYEedl9bDL6MVuUAtK/fa/dVNFhusq/C4z3Jy18ma?=
 =?us-ascii?Q?9wh+Zq1NwubNz2cbDEwgyaOnWvElSklp53iKAP2HA3/xV6gOYFP6/DG0ykG3?=
 =?us-ascii?Q?h5mN4NzWYr1SbE3nLzRS1m+nO+g1BzXJjcY8wySr7c0GE8Oyjaw2kKiq398i?=
 =?us-ascii?Q?q0IUXKu7IDnJpPi3jbKKfFFDAs6ok6TW7Czsri+2Qf3S5js6dT6yQartMHUR?=
 =?us-ascii?Q?NlI44eFzh6+stMQENVLoYfVCZKLFeAck+5LyxslWPv9wo0PwFc80yJM5oxz4?=
 =?us-ascii?Q?o4QA6DJuDPTlf8iarc79bYw1IRVrKmJPWz7ICFOmRSLhBONKBq91w/94E6NB?=
 =?us-ascii?Q?Kq4/fMXrYnzXrO6UCziZjhPVNPMHMnQnhIuKK8p0yM8dqakLPLmFOJYNvu/Y?=
 =?us-ascii?Q?44L+ghyiANAZzJFdxnv52t21pO/BNN262enii+yY/GR6VOCfLeETcaZSQkgz?=
 =?us-ascii?Q?xA9nsaIBTWynaEu3kVXCgLM2k6q7zLifHJNIk3ei/Mknx/po3Rbvac4bhqBn?=
 =?us-ascii?Q?3AJkvdt/WQQ6qTYFozr6TiYQsbaxVlDzuMDtbHo1dMyQh3BgM/NUU1nhDou9?=
 =?us-ascii?Q?bXS9mZFp6H7xoGFnvnR0290LhCSEKXKZFIQDtv240dXoSfg/MxAroTR7DeAm?=
 =?us-ascii?Q?cPCQdOuRj2eU1G2UCKMobhpalDm1WvvSAvrM1yiNEM3qKedIGIxYXJs55yJN?=
 =?us-ascii?Q?Keyqorx9moAY8iq1/ww82ZXHJ9dnE+r7xyg4g6WamhuZm6NYnFCPzlaYZh6W?=
 =?us-ascii?Q?rSRsHbwmXm9ZHLArTyqSGcTOtN9/HmJkAEG9us7Giu05tkWkj6Am0jaA56r+?=
 =?us-ascii?Q?l8nUbhyEhtfCQD13UvQJz4MJHGjTYxRg6O/lHb14ICNRkEgtZ12zblM6LDiq?=
 =?us-ascii?Q?xYNQy2+05g1+/pHMxN57/1e79p8t43sZrWSWsT2ACT0n/oVObqm3cg1oFP2S?=
 =?us-ascii?Q?KqbTHX6tvGxb7vcS2lNaEaODdPp7+WlBXld6IjQmyI7MCulb4mfndtS8Xy8f?=
 =?us-ascii?Q?sy0FVOTLSNKEG255wFowX4Q4ZwY9f41coCtRo6ym7inuaDBbV25dXUwdBjTV?=
 =?us-ascii?Q?WHKgoM/IDJJBxWnGPlWxko8REOWj94VAGOlSTo2wSmQgT+E6ytgMS4g0DJLu?=
 =?us-ascii?Q?+qOOEqqUszA7evVGRgkXHNj6+GwIAvzDbZQzHQlkv+q5KR6opAjvmWKwrlMd?=
 =?us-ascii?Q?MT2UJV3gVenfhdUIzS/p4OeLpeFjdKYpZiZQ1Eq7A/eu0o3T++rAe7bbHjz/?=
 =?us-ascii?Q?41AnqBRQdEGIhNJCMmrBjCaVXbw53W170N8vTJwxzb9f9eA4pZP+rBIQDGdZ?=
 =?us-ascii?Q?Jwe8vc+C202ueyDx7vJ0Q4BbOOR06Yayj9Asg9Yvs0LUQ1GwXbRuyXQk+VuO?=
 =?us-ascii?Q?cAF4z2t3rHf0rHzBahMpZTB6SKjwK/mCzdMYS711vB68haDLVVVGEELaRnRB?=
 =?us-ascii?Q?vDhB3uI17bMUAJoa6t4j2roShjELaZ6B/lGOkM9k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wq4UBg1lksn+646lSDVSuGc6Lr1+1DKF1k54+mWALepu/BhXerHfenuKC3pP?=
 =?us-ascii?Q?TakTSVnUnr34nRsY5L1t4d4c9/htlae3r1Csu41djd93qYebJDg95hqHWG8J?=
 =?us-ascii?Q?Yrff4/Y+1liEwGKgjoAH/8djbCJHrF75Hvzd10AG5wg1npFnsXfMYrXJ/eXo?=
 =?us-ascii?Q?ymI6jvUluljpQjw9AIsh/Xl6u4etqxOlMVuEERL7A5hcNJtmE8tcgANfCAdk?=
 =?us-ascii?Q?iA4KrlikCR0bIQAJGkRTk/xmy7YuOjOEfmzlGCdAF5Jyk71DZ/JlsS6r/Ypz?=
 =?us-ascii?Q?cXBhR2Kkd+/Gt6I4aVQCPcmIlJ7HzS+ZmLW9MH2q8fnanLb+Tch7Yn4+zKwj?=
 =?us-ascii?Q?/ITek+0cMZrwCQ5JdtOLOCVEGhJS9LUKH/Vp4YVuXr8A0n6xGQdYwVcL2Wzz?=
 =?us-ascii?Q?P2rTy8TfJJDIkpMVoOOLuSTtPsJvVKoCjbC5UvEVCqzRKFlhVSk3uu2VbK2P?=
 =?us-ascii?Q?epnzk9Sc6uFwc7RpFGlmkhlZ39nFASk0wh2VhMKVRd9BsICuxZ2qpkdB6lOi?=
 =?us-ascii?Q?NjOuCi/LKDgc9WFQOnmmGBxY5/lJQRKp7af1H8uQ1L0wBFYJ96w3364MjALY?=
 =?us-ascii?Q?IuCklbQXmRe9NFYDQiFALW02N68/Cj1cwhXwkJ+SMG01sUcAGn3CCDHTRVVr?=
 =?us-ascii?Q?kWIQQvawOs5VmbvoJ3yBQ2MIYJAR997qv6dOWgvhnOn8//r79NUxTCSSGIHX?=
 =?us-ascii?Q?bsHoAEDoTgGYN+j9IasWOGzyW7L/yKqm0pQf/wgCqA5Gc/yu+oBehqXQUtYc?=
 =?us-ascii?Q?0RjO6sQ/StpVvbkkHGnBT6jCONmVbkN2rlGQitKn3LxtqJFVYk82pMqSMd7Z?=
 =?us-ascii?Q?oz6OI4vpG/IXVMOkgKuK/K/f2vBPs5D9SwEQf294UegNjCko4h56dWkCqMQ/?=
 =?us-ascii?Q?csb8uE+vhiI556K4/o75gfFU/h7qZw44UpnDWI23MKHueH43DbtPGset+OEX?=
 =?us-ascii?Q?cAXd2dfODN904TKhXYtY1okr8HhhlECQukAYe6yoB2dayH9SUMqndJfYP5Ke?=
 =?us-ascii?Q?8/HN/se3C1XPm55OHZaEoPpNAfoJUMOCXH4CguWFxcAdjgMsmhNCSIoQoyRn?=
 =?us-ascii?Q?8p0z7TP1NmLhWTqnXdhqO4QAOeMMEfBHMtCtaUxPYJPm3A0LIgHWOkP79NHf?=
 =?us-ascii?Q?+pPaOq8sodLi1dyUFGclG0kLuSlf9rdlL6gl99tRdVZxT4Zk2kkSSHEbIN4A?=
 =?us-ascii?Q?YVqmwlGgXBMzgTKYWTAYCRoT28OF+B+Ec8+RNRi5owmHhPnZDjwicE/gN/fQ?=
 =?us-ascii?Q?i7jSifO9XWLFKqUmPhAqS5WBPjXBrxu+fO8gROHxIVKnHpl2U2sMRYx2Mt3M?=
 =?us-ascii?Q?SwP/9JbSFSR9rV3otw1WmXHznYRxzVkipUKPoU8q6S5YUBmMowSti2yddutc?=
 =?us-ascii?Q?1BHkd8yhs3ZrWJs/HQuxvpP15oa9+xgVaWNGjJ6nOqtogPRTPA4d7sRD9Nq+?=
 =?us-ascii?Q?6gRyyesDIMMEJwTawdsISvhBtfD6RMKG41QJEg6qEY3u/SksTQ501uRLTT7I?=
 =?us-ascii?Q?6+TPnxVzzUGqD9qKA9SEZ8gIV/wO+M2ymZLDdcN/EtYjlYGhUEjSBvo4HdFr?=
 =?us-ascii?Q?6WeGBPS9Y41gxNxCdG6I06oKtxLnVyOdNBY38wLHHSSnw3B8VkdogUCkOfhU?=
 =?us-ascii?Q?bzeWE9tzTIisYoiD8QNuKDgfUtgfwwIPw4YICrAcMWQZa5NFUc37DVQ1p4Qc?=
 =?us-ascii?Q?HKzm+Jnm+wYJxCN27w0348lHBLJ9vkifF3aTTrtdn1e3VV2TdK/KNC/akdaL?=
 =?us-ascii?Q?jyqz/GiFOQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hqMDpRHJcuaM9sOVcNKQbNZDz2cwn8EBHAWrzfpW8BthPih2q/YQeKCRs5mwSNZhXC/+QrBmHYjVNaBBUvM6TDP2RUytLfhS/oqAUM495Fn3LuiZCM/VV3/IK8rtdA2DRVJptqFCzLODQVn0b6wwyarhIlD9PVMUWcuE2nfI1yhC2o5BWLy66bGLnsi9yr5YeSjv3xG5AL7SQwy5Gon8JkFy+wPrEq2lS7kt5YnK/XrtOs/J91gdRoMPd2x/JKpfd9KBKr98/JGoTL2fhBOV7sgN4ay9EbifZJ8mrDUCO1gEpM+TGo7Hh00ipohhDiCUErxMoOANS+EJoHLLyIEwJGR76brMLnaNjQlDESPT+9ODc8mwws+tjOZr+UpB/dQD5H6pd7meO8rQETvg7jhhtEX5ba+habPUMV+8hQj3aJf8C4FU4kh+Kau7ym5kU2TQiGIvBH9oIXxDQvx2H7MirDePtsX7T7REsZW5WtGMlj/pYRaOgbAHkhckiGvbEc+0/ZuOrHd2ELaS+SZ1b5iDCdIpYhBbiehdS0Rc0xpgCkhg35AJrvzTQFx1DBqRhUNG+QlWWSFxAvYa442mqIyJgtZVL2RW0EGkvGw8l9lJafA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2027e783-0784-46ea-3f45-08de59480eeb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 23:51:55.7911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGCBTRGm6OjAU7egMtgVtEDazXonFWwcaGYyN3Yd4LVsHbeaMRLeMt+zYZBARadDNF/rploGElKGFD/Ely10fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8610
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601210200
X-Proofpoint-GUID: 0T_m6tXWaZX6dPUL4eayz5e7PL-uc7sy
X-Proofpoint-ORIG-GUID: 0T_m6tXWaZX6dPUL4eayz5e7PL-uc7sy
X-Authority-Analysis: v=2.4 cv=QdJrf8bv c=1 sm=1 tr=0 ts=697166a1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=XAnoEM-drkdDF88pxggA:9 cc=ntf awl=host:12103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDIwMCBTYWx0ZWRfX4P1HSm7GGDKm
 oe48Q6qHuzF14w2CWkeL9x/v8siyL50nexcXkF9BYt1LjeeWvTQmXYQlrrJx3Mq8jjZVZ6d5Qh/
 kK21C/Tt/Dc5yP044EC0+uQaR9HdP9cQZHGGMJETEtDvT9Sbz9CYIbU3URdG+uUYXTZ0Hc4M0oL
 9VnTWMD4NiE5KyIMaslDFYRiStismHbL+dwGTanm/9tL2B9E4JbP7v0YKHpA8IaHfFTLK7DKxvr
 wW+Vee9IIcsAMNuPL/k0T8JpkDCLlI0QEEckRZEzm7HGe3vAhh2pJ2QfGSjJr3JrF/Vhx2B1xFI
 Pe3D2lvkKXQ6oz2ifuo9GzgSlpybkkIxhF+wdiiyjPGdpNogjejUZdgl6bzs/8GP083kGTvOXkO
 HvojOYcmFShRO6GNxdEU4TgCpNyEgythCHlaEYWXmsi2QDKHAw+xpiJKuojm5LSJuqZGFeodcAa
 L7A4WQhyI7INeMdA+jH/HvdPQDt6u+3QEDatHRg0=

From: Eugene Loh <eugene.loh@oracle.com>

For most probes, bpf_get_stack() strips off artificial BPF JIT stack
frames.  In a few cases -- like fprobes and rawtp -- we have to skip
the first few frames manually.  Typically, we should skip 3 frames
(trampoline, clause, and the bpf_get_stack call itself).  Further,
our BPF functions like
    get_bvar_caller()
    get_bvar_stackdepth()
    get_bvar_ucaller()
    get_bvar_ustackdepth()
skip an additional frame to account for that call.

Change stack_skip to 3 for the dt_fbt_fprobe and dt_rawtp providers.

This raises the thorny question of testing.  Until recently, the
stack_skip value we had been using -- 4, not 3 -- worked since it was
chosen empirically:  there was a bug in the kernel that added an extra
frame.  But now, the kernel situation is muddled.  The bug has been
fixed in recent kernels, but only for x86.  See

https://github.com/torvalds/linux/commit/6d08340d1e354787d6c65a8c3cdd4d41ffb8a5ed
Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"

A broader fix, for non-x86, is also expected.  See the thread that
starts at:
https://lore.kernel.org/all/a38fed68-67bc-98ce-8e12-743342121ae3@oracle.com/

So, for now, XFAIL tests on "unfixed" (older) kernels.

Orabug: 38776929
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_fbt.c                   |  2 +-
 libdtrace/dt_prov_rawtp.c                 |  2 +-
 test/unittest/funcs/stack/tst.asgn_dvar.x |  1 +
 test/unittest/funcs/stack/tst.asgn_gvar.x |  1 +
 test/unittest/funcs/stack/tst.asgn_lvar.x |  1 +
 test/unittest/funcs/stack/tst.asgn_tvar.x |  1 +
 test/unittest/funcs/stack/tst.ref_addrs.x |  1 +
 test/unittest/printf/tst.stack.x          |  1 +
 test/unittest/stack/tst.stack.x           |  1 +
 test/utils/stack_skip_test.sh             | 33 +++++++++++++++++++++++
 10 files changed, 42 insertions(+), 2 deletions(-)
 create mode 120000 test/unittest/funcs/stack/tst.asgn_dvar.x
 create mode 120000 test/unittest/funcs/stack/tst.asgn_gvar.x
 create mode 120000 test/unittest/funcs/stack/tst.asgn_lvar.x
 create mode 120000 test/unittest/funcs/stack/tst.asgn_tvar.x
 create mode 120000 test/unittest/funcs/stack/tst.ref_addrs.x
 create mode 120000 test/unittest/printf/tst.stack.x
 create mode 120000 test/unittest/stack/tst.stack.x
 create mode 100755 test/utils/stack_skip_test.sh

diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index 8dbf9740a..4df621657 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -736,7 +736,7 @@ reject:
 dt_provimpl_t	dt_fbt_fprobe = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_TRACING,
-	.stack_skip	= 4,
+	.stack_skip	= 3,
 	.populate	= &populate,
 	.provide	= &provide,
 	.load_prog	= &fprobe_prog_load,
diff --git a/libdtrace/dt_prov_rawtp.c b/libdtrace/dt_prov_rawtp.c
index e3269f4b3..27a992d2e 100644
--- a/libdtrace/dt_prov_rawtp.c
+++ b/libdtrace/dt_prov_rawtp.c
@@ -296,7 +296,7 @@ use_alt:
 dt_provimpl_t	dt_rawtp = {
 	.name		= prvname,
 	.prog_type	= BPF_PROG_TYPE_RAW_TRACEPOINT,
-	.stack_skip	= 4,
+	.stack_skip	= 3,
 	.populate	= &populate,
 	.load_prog	= &dt_bpf_prog_load,
 	.trampoline	= &trampoline,
diff --git a/test/unittest/funcs/stack/tst.asgn_dvar.x b/test/unittest/funcs/stack/tst.asgn_dvar.x
new file mode 120000
index 000000000..0edb412f0
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_dvar.x
@@ -0,0 +1 @@
+../../../utils/stack_skip_test.sh
\ No newline at end of file
diff --git a/test/unittest/funcs/stack/tst.asgn_gvar.x b/test/unittest/funcs/stack/tst.asgn_gvar.x
new file mode 120000
index 000000000..0edb412f0
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_gvar.x
@@ -0,0 +1 @@
+../../../utils/stack_skip_test.sh
\ No newline at end of file
diff --git a/test/unittest/funcs/stack/tst.asgn_lvar.x b/test/unittest/funcs/stack/tst.asgn_lvar.x
new file mode 120000
index 000000000..0edb412f0
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_lvar.x
@@ -0,0 +1 @@
+../../../utils/stack_skip_test.sh
\ No newline at end of file
diff --git a/test/unittest/funcs/stack/tst.asgn_tvar.x b/test/unittest/funcs/stack/tst.asgn_tvar.x
new file mode 120000
index 000000000..0edb412f0
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.asgn_tvar.x
@@ -0,0 +1 @@
+../../../utils/stack_skip_test.sh
\ No newline at end of file
diff --git a/test/unittest/funcs/stack/tst.ref_addrs.x b/test/unittest/funcs/stack/tst.ref_addrs.x
new file mode 120000
index 000000000..0edb412f0
--- /dev/null
+++ b/test/unittest/funcs/stack/tst.ref_addrs.x
@@ -0,0 +1 @@
+../../../utils/stack_skip_test.sh
\ No newline at end of file
diff --git a/test/unittest/printf/tst.stack.x b/test/unittest/printf/tst.stack.x
new file mode 120000
index 000000000..b5ac46b84
--- /dev/null
+++ b/test/unittest/printf/tst.stack.x
@@ -0,0 +1 @@
+../../utils/stack_skip_test.sh
\ No newline at end of file
diff --git a/test/unittest/stack/tst.stack.x b/test/unittest/stack/tst.stack.x
new file mode 120000
index 000000000..b5ac46b84
--- /dev/null
+++ b/test/unittest/stack/tst.stack.x
@@ -0,0 +1 @@
+../../utils/stack_skip_test.sh
\ No newline at end of file
diff --git a/test/utils/stack_skip_test.sh b/test/utils/stack_skip_test.sh
new file mode 100755
index 000000000..8ebfd29ff
--- /dev/null
+++ b/test/utils/stack_skip_test.sh
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+# Older kernels had a bug in which the leaf frame was replicated.
+#
+# This bug was fixed on x86_64.  See
+#   https://github.com/torvalds/linux/commit/6d08340d1e354787d6c65a8c3cdd4d41ffb8a5ed
+#   Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"
+#
+# A broader fix, for non-x86, is also expected.  See the thread that starts at:
+#   https://lore.kernel.org/all/a38fed68-67bc-98ce-8e12-743342121ae3@oracle.com/
+#
+# Use this as a .x file to mark tests as "XFAIL" for older kernels with the
+# superfluous frame (and therefore exposing a BPF JIT frame, appearing as an
+# untranslated 0xffff address).  On older kernels, it is also possible for fbt
+# to be implemented with kprobes rather than fprobes;  in this case, the .x
+# issues no concerns and the tests are expected to PASS.
+
+$dtrace -c test/triggers/periodic_output -qn '
+fbt::hrtimer_nanosleep:entry
+{
+        stack(1);
+        exit(0);
+}
+
+ERROR
+{
+        exit(1);
+}' | grep -q 0xffff
+if [ $? -eq 0 ]; then
+	echo stack appears to have superfluous frame
+	exit 1
+fi
+exit 0
-- 
2.47.3

