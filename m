Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94B3090D9
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920135; cv=fail; b=YlTspN5j8FbWb4GsaSPtaRJ1laLWIMHuvxEdY0BvELC9/839hMv9Eg+hv2vroBK87UAK/YnypKRNh4kPVJ52wVC7Z8Za1/iQMgTA3n14rNG6sxNtHNNDr3ZRrqaLKzh67Ot9ZTsoWKcn/ltvBoaDnWq4Jt3Me03nWngWMzklGO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920135; c=relaxed/simple;
	bh=GRwQw5MqlwnoliY3yMTqJAnGh4atp/v9lbtqm9ei0b8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=r61WYZQ1roLo6Q2EufcsotTAxWRv9br52/YGvb+3cdEA+JnkwHBbpfvindINAAohWZqMiQkQFGzUaMoexSyTicTDk1DCwXCI33X2i+BctBMqf9chtt3mCBSgnIPFBSulszRkK2gTlKxQ+dRfQe+YwB0KUt4OerUn3T6oU755bNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zw1KlEod; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BQWi9DLM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zw1KlEod";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BQWi9DLM"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UMNo5k3751702
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=CCwfYy06qxl9WQvNZALpiFJheFZ47xIXg/SV63R+S5I=; b=
	Zw1KlEod1G6jqw+BRcW7OTQHuh64DmHOxZmC5E578RiOzz7WfSm4nf7A/okQ99oS
	uoD1pjovQe4hWmWQP8jiR/sH35PM8K8lNfUDdf079tLPZ+Wt9VtBxpNl1K2knJ9P
	msi+oDko1NH/MtBKnlj3LdWiy02GWvQzVehE5YJpZqWN8vqNYjYUKoiWN7RNP1l3
	8hdezKUyKge11G/OBL0NuWOvD+0AAYsm0IDxVwagQhimaHwfQeThf4YP+Okww3UI
	lgMPKKv2Sr0oRPVl52dlUe3V02OVElukZU5w1Xss4IzBNIITMZLkr+J0yjn0PM7g
	epam41OTKXEzMQfMNEr/+Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4d65s0u93r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62UMIW7q018452
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:31 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4d65eftpmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 31 Mar 2026 01:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRJm1+yK7Au9pV5Ta7gz67yrA3XEc/CCdI9IPme7Bt06i5ZVKpivHMzCirr7FaDdWRQb4tmIOgqAFpalXeB/lqESHWLSIsmeJ9iApjrgHVt65E9jJKriLyULuDLZl/3hkKeJJzxTXqbXtOFExB55fknLobB5P6Yjj7rSRJ2lIhLFrD9YXKc1XmXkTU+uxPAgEVM6MJ9f3fOINmoV1KHNwthssJCT14dQQ8CqRnosrFTj3mMH86NcyUvvM0V7jt0a3JEqDR9M+IHUykItAaqvSJCI64ubTGnBoOqwxZ8a4xi3ra9gBh+qPIp/Gn1+9aIB6VDtbibBeL8mio1JVWSh0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCwfYy06qxl9WQvNZALpiFJheFZ47xIXg/SV63R+S5I=;
 b=winu7ikGLUkrvL2O0fuqeWxnceE6UbIU2C2MAg1WhzyOkLim9Tmo6Rd6Rm91G+TcNtHZ2YwLw/6sZN6aicvkX13v/DNDXtArl6hun+chEEXyxnL4l/X6K2FQCdnCs/lF0bcMWNOu79wHxueLjVrvTFevIUaJqjLeYysxl9d9/H8ELnF6JCNK+kVmaiYDxVjymAE5srKWNhuuHg6OFB/E22Sr9bxAtyAkoZwgnC+duehRrEtgdnTg75jjUWNOcfkBLcH9rH/jb5LL7CVaLj/E/xYCfqCkMFR8/72l2uVbfTJJ/gaAaDE+lCf2HhSkgCXh6XyhwrKvEt5DdJMmS35SfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCwfYy06qxl9WQvNZALpiFJheFZ47xIXg/SV63R+S5I=;
 b=BQWi9DLMUgcBMYrnlnXc/hsXZ5WXLgekP8p7RfLR8AXyQn+Vhp02JEyj9Znrc7D/GKJ/LW0uEZed1jcyknvIPtczHUQYAFKDEXn2iTaoZKAk7qh2fMk4Xg9UHp2KnuL6kZiO82SjpGo9EwOcK7srV1ozw90wQHQ/CLVkbgFJDVI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 01:02:26 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%4]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 01:02:26 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/6] test: Skip tst.depth.sh
Date: Mon, 30 Mar 2026 21:02:19 -0400
Message-Id: <20260331010224.16165-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0061.namprd07.prod.outlook.com
 (2603:10b6:510:f::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6131:EE_
X-MS-Office365-Filtering-Correlation-Id: fa05f805-ff0c-41e4-964e-08de8ec12cdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S9x2EE5IQBHcsiwBf4LHdFmy9n9y7ntfESlTvpBqI8l/yRdlITIfvrXbqJUa15XXJ8YTXAUIk3QGfnX0VctVLRx6yRJIdWkX96Z3G14rUgDdD9whT/E9I91gIOxJIF/5MjqAWOS5KnfN/K9iVBd4J8VxayZP2rMAJ1yfnQfBZfvIz2svCVWGrAQNHO3wEmqhLLefifYvbu38oIG94b4TfyCGjBd2UDQb8C7LK+kLlp9PA7IzyKbTtF6Cwm3wn7nxjBwYbVwakMya4/W4iN3zm1IRZ4dTNc6O4fmDGPkljOmDWfli5bi70T+h0E/7VJJyUrloJw0vHtV6l8WJd7tNto4k2TkOFe3RvSmCGbDWJv8QyCgHgtecRIO/6mM2hIxkQU1j4fpkiNa86qPwL0SxiAmBrk3lDdU33rC5bflC3AGy81bHaHi8zr87Z48aAMxOvWi+OIzQiGUAYOoyzCBrWCBJSL2JwQLoxO78R4NxXm9naIKjlQ2DHmXydZGUlgl5A7ZJPUoq9P/4v/2CXTJU5Rknzp1dghdXObyIof+KKwsdUH6JfhPLsWNaPWM9a7UFyZ1nl6QxlzO2KoPHLjTE1ScJa0LpAppi5/G91ylLW682IPU16k185nMxWU6Cue6jFVPZw9VQnocMMbAMMfnby9pELw+m/uT+M4JeWQqrGkbqi54hMOzh+S+m2Ich/AEaS/zn9icIfnxZOH213Vu6ah1DSw+sllc4/7JNXy8W995SNDCGU33LMuutRfyLIt4V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a25LYUQ5RIgnfD5p6hGC6H+gi6j4ZO4Jdxg011ynmA46x0+nwvg79jIPzz7l?=
 =?us-ascii?Q?BkZGFpRDP+mk6ZkEqYpY+gtDxU1wXmRLKw87GhOwCqRLL7lM04+LeaxOAlnB?=
 =?us-ascii?Q?e300HKTw6flYoX1Y35xyrImSswB6rlvbMGYNTz5gLvYP4kk5xpL719wdp+vI?=
 =?us-ascii?Q?jeDG0Sw/T9FJYHi1MrIpI3rDFjqSgzjKhobWZMEv+KW6L/WV+CKZASAhmbv5?=
 =?us-ascii?Q?+Sl1T675l/eSL4xn3r7pyHQsFvpCsicG2IusU7+FbRrKF1oLGXeLjjQmbXAi?=
 =?us-ascii?Q?CQE/zExVqgLQDxrPMqoeaEPU2kldJeaQ5RzQAauH83q9Lum8qkhRJKUgVqx0?=
 =?us-ascii?Q?DVEFP8NR8bq0vFnoCe2XT0JYmcjh1/RyA6oDFsugCzdVbdJWZnBcjanrZ+T2?=
 =?us-ascii?Q?fkfvP7xnUscods6rxbm4D9fsawlwx9coWX3qYkaxFlRv2wL/LfwJKRnESO4l?=
 =?us-ascii?Q?e34HhUYIgoEZqqisKlOW+ypUCmDC0u4KpI0SbZ3Ak81RrkWF9U3OEzPeYxlN?=
 =?us-ascii?Q?DfSsuSRt2GuGNHzW3YTnW6F871lUefXifTnAyI3HigmajioQVAb89Fl1VKiO?=
 =?us-ascii?Q?o6BIwooiUEyBX74BNid7fjQIQKjxjZludd4TYIWPnIK1xqJJ8w6GgNh3p2/A?=
 =?us-ascii?Q?ebwK3uJ4FKdyyjNcgAqFOufrb6V5i/pXd4x9/yjeJOsexejk/sS8ZXX8Y0Ii?=
 =?us-ascii?Q?Yj4jW7CL9MN7BU1FlkGPZTYN1YsMM5PivAWycSM0XLcmZbOAMiBh13pCnuMf?=
 =?us-ascii?Q?yhUIfLY/WV7drjsoHJqbqGlBKxVKiBPaS1RzLMjyTACbkxm4tLTLP0JTSAEy?=
 =?us-ascii?Q?21/Xr+NPLyDGqqdabrEqk3JabV6E4r5myiB/chFvyslbovtbcLIwogk0BBTV?=
 =?us-ascii?Q?ciP5a6vzcPoFxOu1lb8OGCPxOk8pryGQiQYzi/Cxcl8apzqXkH39+AmRav47?=
 =?us-ascii?Q?zGQmriKfWH2htLWm7bxMn3bedwQNJz+VbnDeF3WR3gw4FA9f2wfEsgPSj8sa?=
 =?us-ascii?Q?fnJrmzctmE30r2vTRYnQLK8EkizV+aWBHsgRCzUyy1wGtWs5D4IHONPgf5uK?=
 =?us-ascii?Q?j/JDMYNZRCxJH0U1iIFR/6HHNm8tTuJN17FECuLawPygplWopFpQfC8Vo3Zf?=
 =?us-ascii?Q?/xQ3ya2iv9bQvSRHSdY9xdbH5WMdyUZ71Y0zAOp6jjRQBAwbEAHJR1A7y2bF?=
 =?us-ascii?Q?JDRD/CGm1ALAH0fPXTdz/iJPLX3b+hWNseg4nkrsSnFlcYGyPKzHFaRh0QGJ?=
 =?us-ascii?Q?dks0iOrrqSZYAIGLVxnE380QRk/TkSrZgOuYDmfiIc73U4R10e/CeoOq1FEQ?=
 =?us-ascii?Q?psI+EHODPB6idue+xb5jolwecPZJNVzEyyxWowET2Uu4mBMfpvnKsSlQuWp9?=
 =?us-ascii?Q?wfGeMsnocHgi4xoxhnEDNjKcSj+HVUhdNSNCMCBUqAKZxj5bOnExwRdXgAbv?=
 =?us-ascii?Q?OzZFmMqzgSzoW14ZYuPRNtPLdNoxkm92hphAMDyWF1c9ppx7g13x/A0ywGLG?=
 =?us-ascii?Q?w5cDqfq9YZv/F4abbzgna6ZjYj1OoZxUdvo+hmm9ewVScgCRaSsyJP+fCoOE?=
 =?us-ascii?Q?ZHlRrT41qHwoQO3fm8PbAexJrb1OxlD4oifFGjkXxxG/XplBzrfWR9ht861B?=
 =?us-ascii?Q?zSyEHXY/IiQVkj5JjCHVqxcvZ1HEUluK9FkVm9BN5hBjueCCfghombD8Aa8N?=
 =?us-ascii?Q?B33vjxcgMrNNlTVPuBJwFYYrayTrVlTY7ruF8wobBSaxGFq9K2iUBe6NIKv7?=
 =?us-ascii?Q?6ZfNHGhotg=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	OwZFClUL+Gint9oqwKVMJjW8GmckXCNy7SxgC/lKFfbw4O9P3GbkCWB6S9L8vjZp8/UWHEQ7NoCmoydRXG6ibYkEtAlQGud3clsmz7iqn/Lku2pOI3h92XoAQAPhUKp4NX5aIzeTQi2tubftQdR/YeAFFyUqnKDD7IYEtq2JT2sHeK4n0hUKWxj/sD5A+v03dm1yD4s4o8QWRThOfqwN8Cql15zp+7xhTB3TlxgT+v5tEv67KdDBDqIgAnrIBQs33hjMrlTK6hZBqO3kIyTrtb4q2UAAko/hpHrPI18NCle9aITrcdkdj54a6xqDH/P9C0yQWx8Yi5KcgEexLCVPow==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uAktK0rOLVxwNLTSzVQdVzCkPUcz2zYq/UsBsLHD7/4UAVQsLRs+Hany/3zgDubRos4LWpM4xRslvoQeukhHQRIFtAXMiqBkeutHEwB3P1qTmVtCvo9T+U9UdDVGdcvKovAdfnXIyw/7CjWKUfVipGC3y1qS4Zx0Gcub1K0eT4UECoyZmPuREgTGwFHz9ocWVYgkk36G0sWKoZ18KGOrUQLxhHFyoRGU5gR36OdhC60yPMPC5wazULAB+qY6wEZlP0aMMTy2//B+BG6arzzKFqeK7e0rhGD3NxPHJgB3V1Wz8ueu1BTaHGdC31o2a0ojaY6ZAui1Sya7ZwcW2rOVd8pgNfFE1GqnfFbpTMjeOtvXFyykMjawszxenSAotirsXuhuHs8PRaQ6XAUYOZzN/dFG4lZMlUUCV8XQsv+Gnj/Fk+m7s568tjYZJ9st9b71ScjBo/OT4yPV5wiTPwOZBOwMjl3Q9bt4YliYKxFs0JaF41zuB7zuBk0OLFdlfFwyxrui7GIMistoLkSi4BQcIkL4Cf1q+spzCWg5DHx/JS8MyQ/WPQV57E5ST3KZXT1GrLZy64t4yxWkfW+pfLF5Su369X7iq0T6WRZHnygH514=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa05f805-ff0c-41e4-964e-08de8ec12cdb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 01:02:26.7335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YCKpCSk4WmXl7VEDz962lz4Ewvem2wLvdyPR8v0MYoH5zj72L87rSqTU/gA2hh64D1qP2rog0J4PX2FvZe57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603310007
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDAwNyBTYWx0ZWRfX83pG1cJgcN5B
 xeSx8iIPYhqEEdJbaI2RBhSh1+uZKN8PiRdojtDDpMvfAvup50xKNXZ65G+xuKqkaudwVImdOgK
 ccoFKfloYUjF6TixLwVadfUl2nIUY68AkLIt3Eh1Zy8eVf8b1HxDYT92NizVWp9Usk2jx3xGVJu
 49XQ6NhkXn38d+sOOfgIG4q1utzeAhri3uoMWAi1j1ecu037faq17bdbRUycZYgxnjpSQzuhMo1
 RfeVt8J+VGpfKA6D3MDrK+8ynWq8C1bZyzzo10XkJSRUH0K1e/KGHui2A36Cgpw9NIH2W8wB3fP
 9vMPOus7RMcYWbjR3IyNug1OP1h2FcGeUaYcWHwM8z8qaheM806UMhrsmcAo++6gyxjqhrliezq
 FJKCWL2XsAQFyJCJ25hdUx+6CHwyp6QYQpFFpZ133dqnJOGNuvIPrKBNxtj9tYXAAsFrtM5ZOvx
 uONsJBjFyrfhSJtVMdhDy3QgxIw3te3QUoRezAck=
X-Proofpoint-ORIG-GUID: RDo2IWh7dCaXgwutdEFXD2VnpAIbYZdU
X-Authority-Analysis: v=2.4 cv=BvOQAIX5 c=1 sm=1 tr=0 ts=69cb1d28 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=o5oIOnhZENCTenyL_yNV:22 a=yPCof4ZbAAAA:8 a=e6WgNHw0UpcQRKbkQugA:9 cc=ntf
 awl=host:13811
X-Proofpoint-GUID: RDo2IWh7dCaXgwutdEFXD2VnpAIbYZdU

From: Eugene Loh <eugene.loh@oracle.com>

The test asks for very many pid probes.  E.g.,

        pid$target:::entry,
        pid$target:::return,
        pid$target:a.out::,

If it is successful, this can wreak havoc on some systems, in some cases
leading to 1-2 dozen subsequent tests failing due to cascading problems:
poor test clean up, triggers left running, persistent loads, pid=0 not
running, tests timing out, and so on.  These problems require
investigation.

For now, skip the precipitating test.

See
https://oss.oracle.com/pipermail/dtrace-devel/2025-November/006916.html

Incidentally, there are similar issues for

* test/unittest/pid/err.D_PROC_CREATEFAIL.many.d
  but this test is already marked SKIP, apparently for the same reason.
  See commit d9423bd79
  ("err.D_PROC_CREATEFAIL.many.d causes failures in subsequent tests").
  The current patch simply seeks to apply the same SKIP to another test.

* test/demo/user/userfunc.d
  but this test is marked XFAIL since it needs a trigger

All three tests should be resolved when the underlying problem is
tackled.

Orabug: 38642080
Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/ustack/tst.depth.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
index dec16a3aa..4a67291de 100755
--- a/test/unittest/ustack/tst.depth.sh
+++ b/test/unittest/ustack/tst.depth.sh
@@ -1,10 +1,10 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2025, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
-# @@xfail: dtv2
+# @@skip
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
-- 
2.47.3

