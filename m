Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B47ABE68
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247752; cv=fail; b=IjjKXXqXV8qoj3mNRTSlsuz/tWR2FFUUhGI33uVm3Wd5BlhXRhCP8QT2S1BG4HESpfG57AQ4WrWNPgBUiu9nbiRFYR2eO4BdZj+K9Wx2p/oxace2zL7WTtLOjI0PAZZJ1mUJCSQDFIJJGMtQFtCsh+h4wK6n6TcIEb1LXCc7E88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247752; c=relaxed/simple;
	bh=ghQn/WozctezIWPWrwyEzJVQvPXxF7/IcsFcDtm+3CA=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dPQ/lkApQQKt+ymrdEuvhbPZIOz2deESvfNq49smxhgF1UcX/h8SKB1yHN3J4HsiJ0CPA5Yb1lJavhlmwWenf+3sFkuhZgcGcAXPiHr9SgEp47owOQs8M/HV24OCiQJYO2Y5R24FVrsv4PGcJDPPpApwrbqLK0SaOdJ4b5lWBS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TEA93U/9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=omRsBt06; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TEA93U/9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="omRsBt06"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DGeo7Y008405
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=cDJI64D+L2GhGeDHRPRKbzVi4dPtY6QqTENW2LtrnhQ=; b=
	TEA93U/9r5EPFiLuSZbcZShdOWmDfstSJTMmkXqtVBDXt3xDtIx3mBhDAmtQKR/o
	Aqufk28FMnJcwNrq6GRXXRBWpBZ05x9ByVtOqwpZdjEUry3iaN+S8jTWuAW286hf
	HTz7bK/GZV093b4vxYfA8VefoaFSsg3m5dNwWpMTaaFNatwG4AK+uqQj1a2JvlYC
	wEcJpy70MgejVGiGbz8eLZHSK/CYiaYx8BDmA6aYqcoZd+PB7Dj+gBkfzTfyYoBd
	W+NIomdbQ99nRzTNp1VFTe8/0yJs2apPJg7uX6acxja+1qvjGDMF+q8PeiT5M8dl
	PvNbEA2qDpwli4PKDJLC1A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdrbe5xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:15:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48DGSLMS034134
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:15:49 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9dd70n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 13 Sep 2024 17:15:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjjbR7JbVpmPxjTBsVvQHDYbhJ5VPKE/cCOgE6k3RK2vhXM9dZcbgFPRV5YT4PXMlnwgDCpTfwXo2RGvmB+hj+mK8gVipPYRGyYmFTtKciZvm7Uh+q6dy1qaYIJiK8PQT5SxmbZySbMvevd0vNVEW83SZKvCqCg2DB1XhTsiZcsKvvsgnVmTNGwBJBxDc5hTOGtE1RY92qX20uEUJ3XUmLqQvPh/hBhAx1nSEqnYoDdrFMiVXWpMMkOr6vbq6IBOeydIj7OuQX+a6sfuoJRcSZtQrUhWpBfrpISHGbCibav0Nh7PP4mwcCToKo/pVtTYPrcTTlbu1FzZlRDYnIbgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDJI64D+L2GhGeDHRPRKbzVi4dPtY6QqTENW2LtrnhQ=;
 b=WmTNpyWfM8YpyvNJREpkv5LfL+8urRz/niubZigEnqxAp5Y0nlzuvCpr4MARXtn3cSy1X6ElU+A2lLvfier7qE/FlAlptVtAJlgoi5IdokPgUbm6sWiyy0rJDfi91XvJ1iNnJA2JWyh5u9M3E/Ye8iOSwWk9XsZ8zVgCoJbuztBoyx00Gr87ma6d+SuxPTRNX7/LwFpehw5qMrO6Xt56Lkl+rymmynIQEbH6pu+RlVo7GeVPUh+Jj4HK9kS+E39+Vv0GLUV/w3sTVpLp0UDh+3yqeD8sxf/YSfWsfp/SygoUjd5c2pB1HC5hM7l3el5Y1y0UxwFmdUpMWo8ThPQoaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDJI64D+L2GhGeDHRPRKbzVi4dPtY6QqTENW2LtrnhQ=;
 b=omRsBt062y4UZCWNwDWsy/9Ximr9i3PvPSLwnauj4bNWm/L1c998ox26mlqgmv5X1biroa7HzGfufz4zDY6nA/pGnol1ILkUTzuEZtQrepjScfGM+ynMRmPjzLhFaNsb9LvOQ/TQbKyq0LaWXDPwIfmKzCMpkt9hym045gZN47A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB4662.namprd10.prod.outlook.com (2603:10b6:510:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.10; Fri, 13 Sep
 2024 17:15:40 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7982.003; Fri, 13 Sep 2024
 17:15:40 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 05/22] Set the ERROR PRID in BPF code
Date: Fri, 13 Sep 2024 13:15:35 -0400
Message-Id: <20240913171535.18630-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0079.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB4662:EE_
X-MS-Office365-Filtering-Correlation-Id: 8076f2c6-6d8c-40af-d080-08dcd417b12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Es+0B/wnGbmNGURvC4ZxldlVzLq7+q89WvqW4gXoiOqTpwpLPYlgIMEGWsP?=
 =?us-ascii?Q?UnhNlQpOO69LEwUbXMer/hwFhj8EooNmhd9HW9EBh4OdLSuI5uWl0HxlXthg?=
 =?us-ascii?Q?KLusHWxzJprKgsBeoDwRv2bfClLkLYywuJUNWdDQItF9huIS+qOrkOQnlTZ7?=
 =?us-ascii?Q?5LiIx8adxlAMmokFVevI20g9y4A/PXAp+lSmBw9XYDSYe+o6TUHUCRTjbvRC?=
 =?us-ascii?Q?LX6z2BIushw5Wlz3nZEXD/WXZthutrEbOyoH3Z4T6NCvRCyUshJdTJMSq62n?=
 =?us-ascii?Q?jDgvA632h3i9VXZquLFQ3xyahcQK4jZNaFHWOOcP+imXiSQ5VRwYezYWF2dZ?=
 =?us-ascii?Q?mG/Y0Gd+STw6FxpxClpiV4AnehS182wD9doDNPmXb6jSMRkJHb9/aiy29T/b?=
 =?us-ascii?Q?nDfyie5zB8YO6P8Ax7mNsqCkgVA9wqQ/T9fSBxokaQclKlzqPjsi59KRQlb/?=
 =?us-ascii?Q?T5BXwQuKt5fxrH50Ilr8qQnmpWiXsau8am7d2rGvhdRpJwzxzooaX7cHd8lR?=
 =?us-ascii?Q?yEwUvJhERPvhj4a72hJzWxbK3bGvBDXFk9U5cGMs0CyZbs85FRhEcfRnptCn?=
 =?us-ascii?Q?WLyLttQvoOrOsdVSJ/F/W28zyuNKYQwoBIQW9Rt4/qjL6lVBS9PscOHzvZBp?=
 =?us-ascii?Q?f1uU22BzaPsSN6t/ncF6BvFbpkeUPB/mSo4BoFsEGhyckj3RWDBP0h6UBSPV?=
 =?us-ascii?Q?domNTlOuBBYnlokSwMxd4UnkiP93q0p72ZA7UW5fP3pQmsy6cx17Zz5DuBep?=
 =?us-ascii?Q?gD0+7BKMz5sV3V2dsfonnOtavXe7KaJV8e9W96i0dUnUA0/vVpykppI5fbd2?=
 =?us-ascii?Q?VI+shrNH0H68S0PRv29WeCO8V/mUj0iIngjn3VKYYkcDOmJ9mKnB11gYmGBC?=
 =?us-ascii?Q?s+ZGhQnQKm11vz39lXmJsL6pGGtPicYEF6c/oF7xTZf7kyWoClu2X9y2bp4r?=
 =?us-ascii?Q?ccswCW7Vggw77AKZ6kzItrOC1C3SuSSX5Ikv0+LEcRyTMbnZQDB2ebkhYcBi?=
 =?us-ascii?Q?LMjo93KHmuNfMxRQfhnN7WOaVKL44T8R6ujaNxmoCf8YfQ51W1VZjlNTHJh4?=
 =?us-ascii?Q?apEdHv7PqkokTl/1CrcdYhiQTe96//B2/lpVTeGArq2Mo1N6+NYSt2RDYxw7?=
 =?us-ascii?Q?vIrg7biFy+7D83npSWHlKBiP+WDBjQWfCoDroX7ZLXme7ZwdNoY/9qLgXevW?=
 =?us-ascii?Q?/eMPA/XQO9Q+2GcDqRC09p65KiYwjApQ8Wui/BIlKb7Tnm7jWIBw6EuYvGuu?=
 =?us-ascii?Q?8q+zbrFx9VxAxA4aN/Irv8lqRxuuNVxGiYyob3pAI3ry8P4U5TLGTBH4sdwM?=
 =?us-ascii?Q?qGL4iVPQbDunJ/VrSlTyl3mFKoqAGak0TiHuTpO6ZhncAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8q2quqNqT6UcLC6d6niYvEnNVAzf3u5bEJG9Jc89qgeUul1NCMkQsr47Z5hV?=
 =?us-ascii?Q?Xv+nHZ8rNoE+fwjNn6Eyqz1Z8z5Zts3K41HSZQOhUtybk+xnSlmWT9m5ZKBT?=
 =?us-ascii?Q?5mMKjQt7B5f9o43Co4vrPi+1rUCtgcxePDKeWCkoB8Vn+F6FUUiVy2NngL3O?=
 =?us-ascii?Q?Jpqd3TREUv90Nh6COgTAJbPrN5ClF+ZsWSAlhSoRsr7lQ8FJwl2DV3rZJODM?=
 =?us-ascii?Q?v48FgdIIHvlAmNDTVME6iH2bDXauttIYb+rjoeXlPCmKkRz20L29KEC2V5jG?=
 =?us-ascii?Q?gDSt5NjTHLedfofG5/a/IMqzUG+uM6J4GvISsSsxRfEBL6vo0aD4B+cftNB3?=
 =?us-ascii?Q?RTqArbzDn1513gz8haoaXURY1mgd3iHNpkNzHNpqpJ6b2Ct/OiG1kxzzjCN4?=
 =?us-ascii?Q?O2PltuW9CtqB5dPyH8H/iooyL/HQs30LuZQGSSiurYQudOvFSBNoYoUFk9Wi?=
 =?us-ascii?Q?Ki8yugj7WTMopY9QtR4/euhxeKdxMzeck+rmrUZ0iM5dXEfMiiUBSHZ3cWRq?=
 =?us-ascii?Q?qDzlqgumpzakY/2+eKCDO1wv6+UIyARDzcB2qudGEG56o7gSUXu9tpzlboSC?=
 =?us-ascii?Q?k/OWvN98v+bwsz2FOeqjMXGJcYRFbRO8zKSOCmm1znuvDI1fCglsPuBmh5aV?=
 =?us-ascii?Q?gQ9IvDi3sGQgRC5RJtQ4xZn4kqyVW6AbCSwhaxUnfOoRVGSbMHQGzxEKcNoX?=
 =?us-ascii?Q?+uVApW8DXVvB3EceSFfmOVaiTyIifUmw3Yf29yLT/0Nq3UaWsx23zaxAvcrv?=
 =?us-ascii?Q?c4QUCI0W7gEJdEhFmIKX6hiwYdM6yPNFHH0ZeET1bzUwoiGEzDeTmmd8VrAb?=
 =?us-ascii?Q?EyaFHpQF8qd3nJT3IS95RMjJCjzfvmgoum6YRaDIU5seWpIcxLf4d2AeUeYD?=
 =?us-ascii?Q?+xrFwpg+GxG2/nNZTn/3ec9T/c0yFq2dr4xSNh/OPQiyYMbBLoQ3R/q5rrtT?=
 =?us-ascii?Q?YOgAKXgolhHx99ueaP15amJhlA5iwLSQxPOa2boWv347PzUh3prjGpPPjRBH?=
 =?us-ascii?Q?heLQzIBceECem2mMvUV8YSAs6xgunxcw9Lyjl+AdAzzFs+P7hAHFxnlboxuN?=
 =?us-ascii?Q?YkUgGAL6h8yLjKAQ3mSfC6+gYzYSuc9NRlOT8O3XMkPrN8SmYSNuPKbVL1u1?=
 =?us-ascii?Q?qERavUkY9UgCNuNrQmxELTU1n/CM8qXXzHjeRWFJWsoLYCxn870K4pbPSpWk?=
 =?us-ascii?Q?O+NB57pBiNTrSP8ZzmWswjnJLbkEdnYD6B2TwK31jSEj1NAdGzHPLu8yGmKa?=
 =?us-ascii?Q?K3mPvwcaaBOyahLRW5FJiag3c5VhN9DdNaL3zwWlTQLPlp/EvwP5YgYjbK/3?=
 =?us-ascii?Q?A/yQzmAG+vkYNXuDHcCO2V7YyrHLnELdE0x0074PD+1r5zooHThR/oJ9pmAT?=
 =?us-ascii?Q?uqTZyWmPJ97QDPqChYz8ThA20oPD6qXoE7Jd8jng1i3AIuQ7BwMX9G/NoKWT?=
 =?us-ascii?Q?GKpCZjFMIy1G2My0t6+6UndkuN9Xe1Pi391itrjGZvlTc7pc4/e90O4WM346?=
 =?us-ascii?Q?2IeTaAGLu2bBtkxlxYGnvXqRl/x/Pqk0fzg6KuiZnPONAey/4bbJPRV/j4sP?=
 =?us-ascii?Q?1MSLqjlPyXot4jnjvdoOpbonIMnBkwxtBw1pWuOL?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n9zCfE+zj2OdEFnEtB4Spqa6VSMH61rBpvlL8T6YK45+xeDVvl2a2i/urIm43oG/A9hXcTJ82y82bywbser0ORt2S04SKzBQuQy2T9NdUkG2wW9422sc7C4a+fzz8DsvNZbGSgUCc5LqCGj625H3k17OXPJB9VTTPSBzjWNV+0awsYlw8OxiqL7aDaemdK0znGrPTZ2ktf8sgaK4qRQLxpiUFEHHEfbNkVlEnIj1GV0IBhvKFdJFmjx0+PWBUVF5qkvhn5TzueT51IBnzdKVSkSUHl2ZUFwwaR5sdrzV3RvHJmyDNAewjA+nrz94xaXh7buen2G87gay1lLkEgLQ7k5fqaad4FdMBpBOXfvn3nPZVI9dpnvFVnnrHWVXq/t2urGAMYfYvupbozgunlK1eW3YmLJkpuuPKydRuVe+82rt3rfBy8cIcjMJf8Vv3S2XE+KusDT7DOflkEdGSaMMY2YEBTwErjkyXOINpNcggcIZ4aJw6ADsyZJBFw0vrxyzfE6UzcE+I53ojA5hSkzKzlDIa3zjyiapBoQO4m+W3GMWDewxBJHAIMllkSLM5NaL2Wy15mLbMqiBr8F/NieT3+JWEW1ndNaKDzijuWDH1pM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8076f2c6-6d8c-40af-d080-08dcd417b12a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 17:15:40.3922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yk+ls5pmwo4q2SpUmSbgQTWlu71Rbu49Xo7VioSVowLARR1b5Vhg/g0K6ZgQh72ReCmWCHkrqBP5nUy8gJ3BTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4662
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_11,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409130123
X-Proofpoint-ORIG-GUID: qryq4G4gMdWg5iF9UYXLGFyRl56omyxY
X-Proofpoint-GUID: qryq4G4gMdWg5iF9UYXLGFyRl56omyxY

From: Eugene Loh <eugene.loh@oracle.com>

There are multiple options for how to set this value.  One is to
hardwire it to 3, its expected value.  Another is to set the value
during relocation.  Here, we choose a middle ground:  we define
the value symbolically (to 3) and also check that value.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/probe_error.c                        |  3 ++
 libdtrace/dt_dctx.h                      |  7 ++++
 libdtrace/dt_prov_dtrace.c               |  3 ++
 test/unittest/builtinvar/tst.id_ERROR.r  |  1 +
 test/unittest/builtinvar/tst.id_ERROR.sh | 52 ++++++++++++++++++++++++
 5 files changed, 66 insertions(+)
 create mode 100644 test/unittest/builtinvar/tst.id_ERROR.r
 create mode 100755 test/unittest/builtinvar/tst.id_ERROR.sh

diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index cad161fd7..1081ee71d 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -26,6 +26,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 			     uint64_t illval)
 {
 	dt_mstate_t	*mst = dctx->mst;
+	int		oldprid = mst->prid;
 
 	__builtin_memcpy(mst->saved_argv, mst->argv, sizeof(mst->saved_argv));
 	mst->argv[0] = 0;
@@ -35,7 +36,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 	mst->argv[4] = fault;
 	mst->argv[5] = illval;
 
+	mst->prid = DTRACE_ERROR_ID;
 	dt_error(dctx);
+	mst->prid = oldprid;
 
 	__builtin_memcpy(mst->argv, mst->saved_argv, sizeof(mst->saved_argv));
 	mst->fault = fault;
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 633c529f3..d8232868d 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -14,6 +14,13 @@
 #include <dt_pt_regs.h>
 #include <dt_state.h>
 
+/*
+ * Static probe IDs for the dtrace provider.
+ */
+#define DTRACE_BEGIN_ID		1
+#define DTRACE_END_ID		2
+#define DTRACE_ERROR_ID		3
+
 /*
  * The DTrace machine state.
  */
diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index bf87cb054..9f0d72b78 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -45,18 +45,21 @@ static int populate(dtrace_hdl_t *dtp)
 
 	prp = dt_tp_probe_insert(dtp, prv, prvname, modname, funname, "BEGIN");
 	if (prp) {
+		assert(prp->desc->id == DTRACE_BEGIN_ID);
 		n++;
 		dt_probe_enable(dtp, prp);
 	}
 
 	prp = dt_tp_probe_insert(dtp, prv, prvname, modname, funname, "END");
 	if (prp) {
+		assert(prp->desc->id == DTRACE_END_ID);
 		n++;
 		dt_probe_enable(dtp, prp);
 	}
 
 	prp = dt_tp_probe_insert(dtp, prv, prvname, modname, funname, "ERROR");
 	if (prp) {
+		assert(prp->desc->id == DTRACE_ERROR_ID);
 		n++;
 		dt_probe_enable(dtp, prp);
 		dtp->dt_error = prp;
diff --git a/test/unittest/builtinvar/tst.id_ERROR.r b/test/unittest/builtinvar/tst.id_ERROR.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/builtinvar/tst.id_ERROR.sh b/test/unittest/builtinvar/tst.id_ERROR.sh
new file mode 100755
index 000000000..082ebd0c4
--- /dev/null
+++ b/test/unittest/builtinvar/tst.id_ERROR.sh
@@ -0,0 +1,52 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+DIRNAME="$tmpdir/builtinvar-id_ERROR.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Have a D script report the probe ID within an ERROR probe.
+
+$dtrace $dt_flags -qn '
+BEGIN { *((int*)0) }
+BEGIN { exit(1) }
+ERROR { printf("ERROR probe id is %d\n", id); exit(0); }
+' -o D.out 2> D.err
+if [ $? -ne 0 ]; then
+    echo DTrace failed
+    echo ==== D.out
+    cat D.out
+    echo ==== D.err
+    cat D.err
+    exit 1
+fi
+
+# Get the ERROR probe ID from "dtrace -l" output.
+
+id=`$dtrace $dt_flags -ln dtrace:::ERROR |& awk '/^ *[0-9]* *dtrace *ERROR *$/ { print $1 }'`
+
+# Construct expected output.
+
+echo "ERROR probe id is $id" > D.out.chk
+echo >> D.out.chk
+
+# Check output.
+
+if ! diff -q D.out D.out.chk; then
+    echo output mismatches
+    echo ==== D.out
+    cat D.out
+    echo ==== D.out.chk
+    cat D.out.chk
+    exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5

