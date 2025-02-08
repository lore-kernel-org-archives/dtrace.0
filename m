Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93DF241129
	for <dtrace@lists.linux.dev>; Sat,  8 Feb 2025 19:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739041604; cv=fail; b=DoFsA1E0QQndpTL66HVU11LwZb9oOy3RWZFGetxSz6SeOf/u/IiqFeexVeqsWJl/l7liTuJn2pRNy/oDQfD6J38sw/aVHiFjV/ks+/AQhDX3Dc1OrdBOX12faZKIpZz2s/qneCMz2Vsb9d9Zd6VsM9TvtN+7sSAlbiowwES2auQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739041604; c=relaxed/simple;
	bh=d0fKYCS8Y63j28uxAoITtuIF9DUfRt7rgAwotLMI4Dc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pir2wBvdm2+h6eE8xRc22TBUDAQeCLNw+mEe68D4R1379UMyw/V8r+ChCVi1kdKw9kj/7DaaC/+uVQxm147SQHix+qFSWy0PyZ8u3cal3bC/l4gAOq1exem1twQ24n8rvdiwq/WVSqtbypFK6Hdrligt+3F0eZ/KjhizA7Jp+T4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XsfSoqZ0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zVT/GejM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XsfSoqZ0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zVT/GejM"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518FXw6P016559
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=drF/yGC7IhUxfbvRazEPzoTvkZlMC8U4mkulYkxRlNo=; b=
	XsfSoqZ0eYExsOC48rCWo38tEXu584d7yefljA80Km53+CsCMpQSOeuDkmrorAgm
	AQMpxkVFnXsGxCXsSRoNPkGySoKB0Uz5ViQViJv8mVn6VP0A2Z6Yq2yf8qdhqucz
	W+OjWebvVlwr6XrmPvJjaE7FQAPYWrjMKWxsY8iy2bqV7ExdRTWxCHe8qsBwd+ko
	dQlzf3F1A83cRr/ZHOD805omZ5lN7s6eEmJX5fEQy5RaYPvqBgIs/9XGc3e9vSSa
	0oIqfz4WvEqTgDD10uE9WHX5uN3XGCz68fsJ5xHXCzUZwA260CGm+OAyeLHBpFCD
	rrRGzqDI7RnnTB0dPPjT2Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tn0e8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:06:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518EZFqC040842
	for <dtrace@lists.linux.dev>; Sat, 8 Feb 2025 19:06:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44nwqcg1kf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 08 Feb 2025 19:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cc9FwjRbrff3TmJPKg/zDJKMMj+7ykxl0wrpIk3zVwuj6+/yf6YHDL0jkzCVeBdbcoZlUCQon7zVnLrTJvlDBju++Xd+DC77rqii3f4ULXh3I4ZgXqgZku6jbyhYKXdvvyykB6veBYQv8tpvlCdQo44PYZ2qxSEjiPkE2iTplFncR2AuuzN+J0L2wmP9two6/4z5Ngomg+c9VMXDcxOZEfHtyfLxOc1eUaD3F0E76lruTejQFVWGsRBNu+BYrfgORNtiwlQOuOpLkeThWJ9zR2ZXo54mBezYDCC8xkVDbme/MGQk5Yg3XBIiMDKz+/a97o2MuHCi5zb3l81BzmBSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drF/yGC7IhUxfbvRazEPzoTvkZlMC8U4mkulYkxRlNo=;
 b=I3381QguunmM0YdAzCyCHohmGnhlV6B1rl/aDy883XTiGYU3fBMd59Ixxr9NEe9sDfkqZuCYu35DsoGMbAR16Kx3yIR0k/zgBkUoW+3r7FwbYfMFGSh4b5AvVVX4nl6Tr3pNEVif1lifXKzcjeHbF9+wJlLeMF1aznIQmrikMvCYSP+ge5wGWzKyxOTgLWHGtxY6HHeSWNToMMe+bD1MJtcDcRhKOha2BvHZZiJDP2pOsz4noHzroDjBHPl+g3+MW8fJSxQDN/AvFQuY7TXlwoTz74e7XDixSBCDZzMXx4f/E97lMFgl7oU7kHNlzO3l2bOOJOMSqAM6z61AJDNLEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drF/yGC7IhUxfbvRazEPzoTvkZlMC8U4mkulYkxRlNo=;
 b=zVT/GejMxNkCQHKsA0Rb8Uc7DxtvfOHgGQ+SkigamtvGFrzVFVWYpir7t+mnjetwkBWIi9EZE2XyYHxTnc+QIBwsmKq0RJ2J88G9vYt+jgC7yjH7r2FbdS/f4u+MDBsI1pJp3mA9m57T95lzykMQf2VweZ51pAb8S1puTFJi2ZY=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by IA1PR10MB6147.namprd10.prod.outlook.com (2603:10b6:208:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Sat, 8 Feb
 2025 19:06:37 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%6]) with mapi id 15.20.8422.010; Sat, 8 Feb 2025
 19:06:37 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/4] Rename _DTRACE_VERSION
Date: Sat,  8 Feb 2025 14:06:19 -0500
Message-Id: <20250208190622.23484-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0170.namprd05.prod.outlook.com
 (2603:10b6:a03:339::25) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|IA1PR10MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: b310b72a-cde2-45fe-ddb4-08dd4873b641
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JnU7nySs5o8Fx4btBjY9Ynda0lYRZ8LQf08rsxijZms+cIkbVd7KDEfYJSzN?=
 =?us-ascii?Q?f3+gBrV7MUsf/xcRvW+Wf9aDuUPCJGIPF5zLIABohfAQRdsDCvTgP4m2ae0n?=
 =?us-ascii?Q?G2BrpiIJCJsht3JwqxwZDj8Y9tCMSTPEXZJXD5Fa5WhQ04DLoxXkT8V8rRQ+?=
 =?us-ascii?Q?XwXXvAlJ+uEjWLOX4PuVlEEmd7+hjU7cAJgbP8vcFK3lxMW2hIFnbXG27UJ5?=
 =?us-ascii?Q?26SE0BvoBrn9ORhOM1LLqZl22YFywkQ8RfvAd+azimG6MyZe7S+gv7+MkbCF?=
 =?us-ascii?Q?gsZ1q0ZjBhfDq79JPLNjX7RWzJ0LOesg/cN2QaUpf9XqwwNpc7JRNmWw+g3j?=
 =?us-ascii?Q?jpi9n0B+S0imvzLcd6SZcc1H0KxWFJWbD9lFsW0Sp9An9slGuIlxnwHtCq68?=
 =?us-ascii?Q?fXUAJ/zGnK3vDgvJxUFBn+lMDKtPDMRL9+HKwVoyAw3n+Oc1LYQRn44D+yle?=
 =?us-ascii?Q?1xqtDpvIb90QR9HHmLpjRT+6/u8s/V4reVGxouTXN50d097+yvr3EyO8vSLD?=
 =?us-ascii?Q?giX71JC1gUBleMri1ZDR4ED16t7bihn9sVVA4PcD7W3weqjjpOWNErQ/6hTf?=
 =?us-ascii?Q?I114RZLgW3xAS2mgzXkGSpduOtALNaHUpqURlg8VOi/IVHMPE42enhHveWCg?=
 =?us-ascii?Q?uS2WesBR2Q9j8Pi4DIed8niM+llDjZsNbEurTOX4DOZO6U6fEdb9ckt0oxv/?=
 =?us-ascii?Q?+SelU+OPhiPUVk4885Ef3zudKojpXFr4ygHAgLyTCwlnml/sPmBrW8u3lJ51?=
 =?us-ascii?Q?Msnf+Im3TTP/ohC3deFE3AjBV4ixA1eJ9x5mN/PPEWUh6Qm3BOt0sLcvudyH?=
 =?us-ascii?Q?ktD7Iu3CpkYk/ygIQUNSnNB/iBIhtwrehkgInDKSSoIpYQTPGE8pKpeAEwcr?=
 =?us-ascii?Q?ClxrvBvRFYE5hWcXhJWagwEEKDpRhHpLXCWWs1HU+QHvpUWFW39s7WL2Fben?=
 =?us-ascii?Q?O1vuKKXdLxADxO7eCNEVDU+yTrux07pcgBp3/jWLmgi9bAEKJiFX/+9FNFbD?=
 =?us-ascii?Q?zLvdGOs3ty8MEBL1qdWtQpMN4nWAh8Cp060to0ePH6mVQi94SBf62rUNiA9c?=
 =?us-ascii?Q?/7jPFWh9eqVIuzizeXvvcD47IIw7oemclSCkRZU0CfMOw6LHmBMPlIrTao4w?=
 =?us-ascii?Q?RBJ7tca4WVwTS9Cjsroraa9E+izRH1Raxm9OUcwMRSsbYlFcwrllHYi9xIOb?=
 =?us-ascii?Q?8NFgpunVhbwKpFiO9HXiCD/2P0EVyNGyZJkdHuiOYCFnYdltKh2OO3W4SzoA?=
 =?us-ascii?Q?iGoUcc3slAc9+wn95OZiQW2u6uE8zG5WxlXazj2EJ6ewhdu19PsMaB2X6Z64?=
 =?us-ascii?Q?/HdMAMO0JekZYWM6Jn6mObHkYsRmb0GhRoWNt8qtGAtTNYjCDhX6CMxQZwz4?=
 =?us-ascii?Q?Gf6eM52CNrnaYAvoXVaRHOIp57l8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BdcPk7QR4MoipcNK6U+QmqyysMFutcMObqjTsOi8AJNg5EImnf3qMblS1qqw?=
 =?us-ascii?Q?z8Sx3uXeKdAq5MUca/P1E37jTqW/ESLraKYlRFKs2ISF6qjhsS5QU4UdqfOr?=
 =?us-ascii?Q?VjMTzOQCmNQIZBrtHXtoBp2gSV95BlmoRIHqcki4A8KdCiFXcQaLn/jNwP5e?=
 =?us-ascii?Q?a/2qTV8fsaPfGv+s6jYndPPAd6IUrF4waYtA0r0SZAqDZgjpktwxDfr7b0vG?=
 =?us-ascii?Q?82y5CQBzi0adiOakFU+0SAWoktJKJQMzOtIxmqumVBx4M81b2Pfz3Zqlx9Kn?=
 =?us-ascii?Q?+0c65FTwqWj3Gdk/jqI2Tq87pvV4/GJb36cY1A9EvLln9qob+5QESbdcvCZH?=
 =?us-ascii?Q?oRiIc7fdzLZwgYi75KmKcJuCiFl3SL3hn9YgxlKf+KKYvyfMNT6LK7678Zzh?=
 =?us-ascii?Q?w7w1uaIB6y9VZyz8ei/UY/C7+ITOq9lU6JjvYpnvhOUQVE+mynXvVToks4cV?=
 =?us-ascii?Q?jrE1POflx68FyFYLnmTIC5DPKbKHz/XCZqhnIQm5XdmRYm5g/oG01KwhXI6g?=
 =?us-ascii?Q?sGDQFOyYrLuU/ekRRAZIi1PL65s+ySYw4vjPhbxlj2UofXNr1Lf5aNUbANHr?=
 =?us-ascii?Q?JrRJ9p56XlKyUnfQm4dVNWc6qVtmebGoy4CuKKyfkdIMpTn1TFwjRpAOIuZ9?=
 =?us-ascii?Q?Y4TWUso6x/BGrVNM+DS4fLom4/v+6+m+5rizTxqik+KuOE10m3yiaa1rVZZs?=
 =?us-ascii?Q?oae7qfyjdQPbkBWKJ/WleE2heqK+JsthvxLGolCR7teCw8o1iHFss1r9VoUF?=
 =?us-ascii?Q?7375GT21BdIQ+nhnrELOt0P+7qEWX6v6vin+PImNKsuB/69KzndErtf3uN/i?=
 =?us-ascii?Q?olmDfPbc142z7YH46Ew5ej4Y/IHQNrO0DZMRC0mWeCQtvBVJNcfHFV9B9Z0c?=
 =?us-ascii?Q?4WzZAPr+fbXd3TbVPR4WW176dNSYTlZJdXhRdctzMv67u5/xAbzXX/iJPhW5?=
 =?us-ascii?Q?LnbyloG6GCkUWFMP2y3zErl+UCk10/e0uMtdN7X1RpDZV4C9KmyauyJAtAsN?=
 =?us-ascii?Q?MFkHUdTHeyrGgVBMv3tPPztmjtZiXU/zALZkYn54ZfMYbm7XlLkfRgT0p581?=
 =?us-ascii?Q?XsYHWwmMMva0CpdDK8WU98hwJDRnnI3hmIHvMA4JPUdMZTnsWSIBFk+YRozp?=
 =?us-ascii?Q?2Kiu1UwVBMmlvreAv7XLk3+yA0UyDAeT1Kp51d/oow5UKffNft+UVM05uHoz?=
 =?us-ascii?Q?9HxhPLHLTAvqOlX9hg0CiJCFEPNpbDHDsgdcdgO/FMi+3XyM1tKubsCuJFr2?=
 =?us-ascii?Q?acedU5Ox+uAYVPo8xr6mH+HcRUjsY7KUCYZVCeHo+FtC0oUSV1GjnoF2f2CE?=
 =?us-ascii?Q?7oexHnUf8T/6brDGHZrwoeeW9MF60liB2kghwt6BAuS5mU8hBRwuHTUG3/EV?=
 =?us-ascii?Q?5PoaBwT6WAbSYfxVu+BNMvHHxx0nJToB3+toYO8+jRFtfHChWU1FI08KucLV?=
 =?us-ascii?Q?dVL7+Gum1zrK28MNnamAMw11Ipkp2WFWUEoisbOXtO8lztCzcLdScoPgvNRp?=
 =?us-ascii?Q?9NXJsp00dWmP3hDpFt7CfqOHYA4BpYYOYeMYHWqYotdD5QZhPzrLSk2kma/I?=
 =?us-ascii?Q?J22w2gEBAsURiaownS2PU/6oWOJiBz3P9g4ESpS0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+HYw/qxs6e0+aJsBIOPpg2I71FexLshq6dQtXtdMf+8cKdDedS++5aE0GW4DRuSwK2Yu5NZxlSX4xjuDeI0gNqFy2v4arBq1Rba/P29ZX5pf0fKpDNEDp+qO107aF551SMxjXibSlR4No1IBo53Z1I7qlIChufRS98mDDTHI2Oop2UmCkSBfYaE5MfbhkjQQyfs2B3EUnDoBDG7KXxXtpPRd7TvbRcmfnNuI3D+qgDV7TUKRGFLU46mLwNw7a1Jer6pFsrNN1ieuqsXMJRCr9EcsB1dF3/GUfahNY8YL2ChmzC2Xz/iSpT9nQl/Lpf/vJu26O055AYFoDcTxD+Fz4p+TkkalRS08R0CBOMi/OuH1dn0TA35++A/erShsL+v+QoSSaldbQxdk8GFMdaiXt2osadHDdS1ICm++qc+fMVGcyggyewS5KlqCfN6zRkE/AlWKIQLy6VeDnESrJIgT7L5qCtr3NbZ6N/7MtH6GH1CYgRR66pGz/fe+YOkUmcOjivwEpLPZtb2VSMf5jXidk5CkJRwRQPGfDZyQCFLldnZ9w/c8U+ZmoKrPa34jQtIeubxLjbmYyrm+0fPLREfj/kG5Ah7F+XHjLaXaPF3bUaY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b310b72a-cde2-45fe-ddb4-08dd4873b641
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 19:06:37.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcMUKFjaqxPzrNjtC9fiVrde6AE3xPAexwXa7R7iT8qGuGQvtFzfl7khBmZ30u1twlsNU3VKxuMa1xRwQrfHtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6147
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080162
X-Proofpoint-GUID: 8p4oR5B7wM13T8AjX6ndPFVD--7E-Ytp
X-Proofpoint-ORIG-GUID: 8p4oR5B7wM13T8AjX6ndPFVD--7E-Ytp

From: Eugene Loh <eugene.loh@oracle.com>

There are many DTrace version numbers (for version, API version,
package version, etc.).  Meanwhile, _DTRACE_VERSION is not a
version number at all.  It's a preprocessor macro in USDT .h header
files.  Prior to commit e2fb0ecd9
("Ensure multiple passes through dtrace -G work."), it was perhaps
not even set.  With that commit, it was always set to 1, with
the rationale:

    Also add an explicit define for _DTRACE__VERSION in the generated
    header file from 'dtrace -h' invocations.  This seems silly, but
    it is there to give people a skeleton to work with if they want to
    pre-generate header files and select whether to actually compile
    on the probes at a later time.

Rename to _DTRACE_HEADER for better clarity.  Define it only once
per file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_program.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index 23b91fb2e..c6fdafb47 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -505,13 +505,12 @@ dt_header_provider(dtrace_hdl_t *dtp, dt_provider_t *pvp, FILE *out)
 	info.dthi_pfname = alloca(strlen(pvp->desc.dtvd_name) + 1 + i);
 	dt_header_fmt_func(info.dthi_pfname, pvp->desc.dtvd_name);
 
-	if (fprintf(out, "#define _DTRACE_VERSION 1\n\n"
-			 "#if _DTRACE_VERSION\n\n") < 0)
+	if (fprintf(out, "#if _DTRACE_HEADER\n\n") < 0)
 		return dt_set_errno(dtp, errno);
 
 	if (dt_idhash_iter(pvp->pv_probes, dt_header_probe, &info) != 0)
 		return -1; /* dt_errno is set for us */
-	if (fprintf(out, "\n\n") < 0)
+	if (fprintf(out, "\n") < 0)
 		return dt_set_errno(dtp, errno);
 	if (dt_idhash_iter(pvp->pv_probes, dt_header_decl, &info) != 0)
 		return -1; /* dt_errno is set for us */
@@ -560,6 +559,9 @@ dtrace_program_header(dtrace_hdl_t *dtp, FILE *out, const char *fname)
 		"#endif\n\n") < 0)
 		return -1;
 
+	if (fprintf(out, "#define _DTRACE_HEADER 1\n\n") < 0)
+		return -1;
+
 	while ((pvp = dt_htab_next(dtp->dt_provs, &it)) != NULL) {
 		if (dt_header_provider(dtp, pvp, out) != 0) {
 			dt_htab_next_destroy(it);
-- 
2.43.5

