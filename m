Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F24AAD2C
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742365969; cv=fail; b=KOJtIDUipJer8AtmPKQNkoml0LN8VJ8Vxpnm7Sb+ZBxn6t+FwAZbomthSBikOMhqLxYMcaL5OIwhYWxnG8B8W9YVqq3uq8jKK8rR/HHVYENKqWTv+DPyb8VvlLGa+JU6LZIMs2EXStWpzva4WiEZwfjgzUolRj3PSYVOGtruPTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742365969; c=relaxed/simple;
	bh=tneH/YroCFxCuwpRStXAx1/vEf+jWiXweAf/2wpmDy8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gU262Z3sK0gwFjO69SBiGDwj8ZnqU3NDd4aOGyd2ukMxYTX6cwX2dqMIQzoBd2SLKlvymqysHtIqgMKl/wJC4PI/djYkvf/knKZrIRn+1xJIR7FPmbEL1NoiFVG18QlxcvcGXN1lTyGpTG38xzrCwHwJuyPDcRU6v0fHH69O/Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Nthp6Tdm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RoZgslzA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Nthp6Tdm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RoZgslzA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4l4WU019509
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=17qrHtsHjz+HFL7UKx
	uGaKTZfzBdyJkl0bGTQghr+AE=; b=Nthp6TdmDml1GUwYzWwRuVj/2Li9L6LsS0
	jXI1guFFSP8k61H2t81DXeb/JQNeu93hU+jLhSrBBoQPsvYauAZwCayBcXGOLs09
	s2Yo3Bz3aRFDAA4EpwKi6eeQV1ULbiQjsNEFBlFBxY+F3gF23ghffUTie+g2hWqW
	6VoDuIDOWg7g5nYsvF+5ES3zE4bqtuEbzTWbTOpMW5k9emChEoRCKMyJGsgP+zri
	Bt2Ze2c2vrElpmzS7GAc426bIXGP6T7rnAmk05ExiG038FJ51oBaW6Mqnkb2A/CI
	RmGTyTte9I6YYBarhjd5BKIy9Ujl/VVxMai3fFDa2lfZuK0fsz9w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1s8t68m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4oSNd027925
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxdeghg8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 06:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMRo3xgJS5pdre6Th9/R7mEJRW/IK0sYqIICZh2N+/L0i52eGLvYVaCQ3Fkrl8/ODTaj09Pe3mePgSzl4VMA7C8wtR+BR34tKvbkOCdfBn85OYq7tCrKjZpXv0Wkv6hNxkL2vDoWEhGCCuu0+OJX8sl387P3N2zpjRBaZcYMI9NkRbltZ5Nd1RuZNPFVoqn0lqyWp+OW5UuLXgKeCjdSi7zmzlUH8U4u4rYfGJuN36PnCcjNNUdAMSIY7nTYaxy6G1u7rsX4Hk9l0UnTmA4lL47cDLR4YIaoOeT3atjrwgg4JzWbPJVwvvpdRF1Cp5DiLrWAqVt8AOKE+WrazcJdXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17qrHtsHjz+HFL7UKxuGaKTZfzBdyJkl0bGTQghr+AE=;
 b=Thxx4/tDZ/bJFL0M9WMUCExMk5AS30iiM9OyaedeAVgWRVM5xo8q1Kgm263/aTxbMECsgiLKPbncgYgtnvQsRam2ZaTtgldA588jWhQf4UP2WuMqBbcZao+bQjpHx9O1x2tP8HVqGX1AXJNl77mt+JioRKJriqYc2b4MQsINZKopHE1JTx1S2ZuUt64XrOCaNl7yATEHnQ1tAz3B618DL5w7yT8a4M/yrhhNJvZ19jaN7/bCJHUSqRlN+GRk82+A7oK0P2/Aca3SuGMfT+TeDUmkIlAihjPY8CNn6578YWnI8squS9X9lmFPbnWOUmBAbhba3hgfm9Hj4yEDa08Q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17qrHtsHjz+HFL7UKxuGaKTZfzBdyJkl0bGTQghr+AE=;
 b=RoZgslzA0kZgmZIqwnJf6TlDoCcnhehzeXtOr2MyX9ZEbKWv9XWNQEVye6KWT6o/z/inmS+BrY6LhjrmgJXyBX2uYp00KcfNfxFqyFLo8XQ8moYRenW5KpEMGzw8u/9CepxU6a6Uql9AKnrlAkIahBJv6+hbJFJMZkK+ukb0mUs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7638.namprd10.prod.outlook.com (2603:10b6:303:248::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 06:32:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 06:32:42 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Expect USDT argmap to fail on ARM on older kernels
Date: Wed, 19 Mar 2025 02:32:29 -0400
Message-Id: <20250319063230.28171-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250319063230.28171-1-eugene.loh@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:208:32a::35) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3d7fa1-98a9-4e66-bd4f-08dd66afda3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7+uqWSswjHDd0c4agfMuqgY5sAkRxK2E2NuUiOIb4FBf5tp4Iuce8cCXPcg1?=
 =?us-ascii?Q?zeoeRZ74GZj/g6lfESNq4eMXe+2s+lbTZrBFyFngS9qfLYE61ZTgL6b4cZ6T?=
 =?us-ascii?Q?li4rBUT4a99Ychhb8EsB0KhlHDcT+tQTbxYhGL2ovDmWIURgKppXmQhxywDd?=
 =?us-ascii?Q?ADlU8ZBhT2Hrw+GHAUgndDGCJTtYtP31vvwyx3q7JqlI/JjPnbAP3hrhUmNc?=
 =?us-ascii?Q?bzZelKRb1w7hQt1W2VbtFKjPL6xlP7OgD9I7npTavcdF4eHSrBZoDTGDpRTv?=
 =?us-ascii?Q?KVurL8xEe4wq3qsXpyadKZcrax9uIRmydGlhLXTI0E/Zx5wsFcCaVuv+9hxf?=
 =?us-ascii?Q?UdQQkfs9klKa+PE5Wq5KuaUwK8sxsGufGtk0L3eYVlct+LYa8e7r4/hSoaOK?=
 =?us-ascii?Q?ysvsD5q8CV32pC70ys98TTybC4FCSjJHq1ABYpoEvL3n7kp9x6BZwb2p7RlI?=
 =?us-ascii?Q?t/fg6aQtxDJlcg6QiiDEDtgG+n3JspM0GSkiC23CzWn3Ywe/q/r56KdbJrYV?=
 =?us-ascii?Q?mMxQNh2wubh+zlMDqUC42MyLLflYtEY4xXFFBJ/vVXK338P+AgiO6f+6c0tY?=
 =?us-ascii?Q?rUtrIZ3nhNJPq8fFznS5jgmSNsboowT/4zuVpdwpeZEjIMDWcjUuUfKsfNON?=
 =?us-ascii?Q?MJxcnGcei/QYmviphoiSn2fx9X5gP9UfTJy2XcKowJJojCjUuzAjXLZqsuj3?=
 =?us-ascii?Q?eEInuBcBflzkovzfzwKloXn5sTjulDuLgfS0Uw1mtZ7WltNgSmv4V3nZJs8K?=
 =?us-ascii?Q?LNNKU2Uf1Kq4HLtknrY6omz7MCvyQgokaJ2QvWbwbdJVLofXtvPmBSbGOHZ4?=
 =?us-ascii?Q?WI0xhRiGir+SKn/rlhw7x2hymxDRKLhXIKkZpQ4oPFlrzlGaG8e4Arb+R30j?=
 =?us-ascii?Q?EWWiGDAk9M+Ig8sKnlGbEfS/+nY47qAKMmSu6kRKF9Oy6moup52nbhWmNnl0?=
 =?us-ascii?Q?r27uUhTjno8dhlFTlewYGsAJJf2UySwBhUYcb54NLsQAUMBnwYlGz71DDqpX?=
 =?us-ascii?Q?bIyTXBDeGJ7AgsG94YN90QImQb9ujUHDt4eoxmGs3kZCDscRv7i2zsVw2o7v?=
 =?us-ascii?Q?FbtABFTl/h5KDrmwuRIlNFXZ9uyO75/mDvXOdT3OSpGCY6d2rQVaCmNa9W6M?=
 =?us-ascii?Q?BIDAwmBLBARXck3lpmopUBeFkYtzvr3pMfu1/L/XA0o1lcCyO4jOiwHZbsop?=
 =?us-ascii?Q?aY6D+L7dmvH/oJ9r3eyb2JATghTTWSVbqACD5l0++d0CBg+TjHrEOeKI+gR4?=
 =?us-ascii?Q?/oAMeGMGVwLWirYR2UUVvQmcmAzHfrjmSI0PAm7kJMEkXjPkp2E0FNJpkCj0?=
 =?us-ascii?Q?9VKmrn0ekpA2o0szbb9b81tqQvquXflpZy8lSSZ/U41mS+sysi3UAidzu3KQ?=
 =?us-ascii?Q?1K07DjvMiWvx1L+rI1qfGUpy/79Z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?va1NHq3rNNHscUAlKP7jzvYrHts3VhvWiHISeu3TDCYX6vm80R+FWNn8uJop?=
 =?us-ascii?Q?1hydUgntQ42NuRhXbmInG6o3ow88pJNuqzq8QuxfumKIIR2a4e+C6rcyXihU?=
 =?us-ascii?Q?itxhH2nElarzz0UlwdLoQvC5ugL9oDiiMHi4lpxQBNoaUl1nCKCF5a7hjeOw?=
 =?us-ascii?Q?yLyiYcEm/mbn5JaLwc2XF+43oQ8uVz+xTAbqnElsDZJncuQXeWAKSL/R+CaC?=
 =?us-ascii?Q?ksXrmyuV897i7DmSfCyhAIGR7RlrsefbTIy5cR9YCr70EFG6rtS6nLe0xrdy?=
 =?us-ascii?Q?G1ET2RB3dpdMe7ZGwuBn5IUItgc1D8by012gbfv4lxzlMW/amMqiRCYqjqgS?=
 =?us-ascii?Q?hHY5n+QMaLsNTf4DsWyyRcA7F1+keNeFaodtySkOLEWE7aUm4ZezYenazsq4?=
 =?us-ascii?Q?oVubWTGkK/SkMS1/XJsBEoMlvoUcc63rUBQlp+LFRjUOlcJt4mQWb1fQjVOy?=
 =?us-ascii?Q?fI3xTN0zQTzG7vxH1Lxri7RouFtPxGPhvOQTcW7slPvvOtF64wf0uXJtfOKQ?=
 =?us-ascii?Q?XcIxWTegUL/sj15l2rFlMaNmOcfD3Fhhd134V2+es9k9RiXh1N0ci1sTSYOM?=
 =?us-ascii?Q?58pv23tiYs1rAqvWRxv1BKiAdasDWvPinrcu8IyqjmC46YTT/LAfS+x6f4RL?=
 =?us-ascii?Q?SxDMzwtKW1gAX0SCgGm93S51GebA6hg17DRATkjx5iDCylr8P4yPGcrKEx5P?=
 =?us-ascii?Q?eBEt5gIvsuSorURs0gGMKCj2pwgq4WPM1xDq6BkmJ7pJQ7I0sw6EPyKLHJ1K?=
 =?us-ascii?Q?ki77pq4fwegzb+5nUgfqU1KNdDQFXN8whdqtNnM/DjHWUFZvgKu7wBd3YPpc?=
 =?us-ascii?Q?Ptb+dNchZjgbjuLqg0tZJjLOKj+cKic9GV7hxJJW/hW34S/CEnKOxqNAdNAp?=
 =?us-ascii?Q?GznBunWQ+hyyWDTn7VmastG8Q0wChVDAbHRiiZSUQzzD5YVQlwbC9pQOvpHr?=
 =?us-ascii?Q?kPa9jAdTTOw7ukDZ4/QOBrqhSN9MygI9kiUwDpgJPp+P7kLnrvzucbw9KeQy?=
 =?us-ascii?Q?Yx4HGu2lh21oHzjit0Lw/MeVRAtcJp9/9H+Yne7VPuLOOTW2mGhgUJznrt5N?=
 =?us-ascii?Q?lEQ/jNHTiQKlfwhreo2YN6HAUdHX9acrG7hzcmgOA91gjgCtGHX5VlUcUZvb?=
 =?us-ascii?Q?le3IoQNG118qZ+e9UXa8BjcpTnaKB2SGKe09pIDM8ogv4fMSBt2atxYIkJX/?=
 =?us-ascii?Q?jPFh3WzW7lTQ5laRRrR0+dRQy0wgVy4bSNtWmlJWSt2wqEQxtseIJJRmo+KC?=
 =?us-ascii?Q?gjjrvYSLReGD0Ey/tvjrMNoM5CwmDgV5vz4/naedRxl2xAs+lbd8ftzZY9te?=
 =?us-ascii?Q?aGDm6ER4qdu1Wf0GDJqNrQ3u17sF5Vf23wGC/L1MR7lqbXIHwvSRPrUSr4nh?=
 =?us-ascii?Q?wy+6mr5eNPgtvewysZWjTQu2A5gfvITq+1Xk/guDVxroL65mjGVWsFxNThQj?=
 =?us-ascii?Q?6WPrHDR3TAJ82UT5OuNQMxgEaN15EXHOOrihoXoa6+cGRD9GtCC10apIalUy?=
 =?us-ascii?Q?u3qvgmy7nD5YB7ymbcNM3ttQd4+2I32vY94icNGP1uGboDw+2QG3F8sC3+Lc?=
 =?us-ascii?Q?gcEjeXE5JOzIEngOp9cWM2XzTmGO0J4AgHBNZOnA?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X63iwMSP0vpNaVJHACyIau7Hnxmv+hrv/Wmxh+OiJFJzuU3TVzAtohQmXwb5FywOPyCU0jWf+kckQTfeg2/K37PGd0ZysxBtQeBiEO+zbt9SLbEDzK3CFXhQZYgtasebft0VVafg9i/41QD8fhlkz++IXDAke+o0JVzbBlEyXtUJ48OmrC6LiN/httoYYs7aQNw/Wd6gxM6nPVri98WVGVk2cNZgJ/3arsSj/n354lW/t9gxkOhwr9Q5YjSIiRZn/DJJZ7MPGSqcnzfLT0vFlQzUvqws1kbASVbBVuyQw5T9/k3uvW0gtelRPKDIXY8QkIBSCzNrlWbsNRL4orfOd+8RFpaabBk58UM7BFlZWrp8N0s9DphDHUfvV3cEHQosC98yYYS6OSeiSkFylB4WXTnRFh2Fee4w2LEt4nQP+9U7Kwg4TuU+dccK3sxOubTsO+LAMBZ6kigwB6F6VLmUOSIVHE8o7O/2Hdd/k9IzA+Mr3vGUYdYLPjLxw3XnZ0ftkghHV7+SRbaMh/xyGiw9OrWeDqcB7JpiD1uWB7vSHV+lpbuwNfVhteDQ4GOfOCM/5ydt53pEIG/NniX5xekKBVpgyESkX+NN4X7L0XwunnA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3d7fa1-98a9-4e66-bd4f-08dd66afda3b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 06:32:42.4545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZyccuQLFQ9GUUUFgxSUh9iHHj1Eo7idKKxnbwasScW26BC58sKCsVBx313fPhS5mhb5PGj3sZbvkecfVjq8Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7638
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_02,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190043
X-Proofpoint-ORIG-GUID: RWPLBXx4zy40jqENcQXQJ67KiYiTsCe8
X-Proofpoint-GUID: RWPLBXx4zy40jqENcQXQJ67KiYiTsCe8

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/skip_arm_uek6.x            | 25 +++++++++++++++++++
 .../usdt/tst.argmap-typed-partial.aarch64.x   |  1 +
 test/unittest/usdt/tst.argmap-typed.aarch64.x |  1 +
 .../tst.multiprov-dupprobe-fire.aarch64.x     |  1 +
 .../tst.multiprov-dupprobe-shlibs.aarch64.x   |  1 +
 .../usdt/tst.multiprovider-fire.aarch64.x     |  1 +
 6 files changed, 30 insertions(+)
 create mode 100755 test/unittest/usdt/skip_arm_uek6.x
 create mode 120000 test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
 create mode 120000 test/unittest/usdt/tst.argmap-typed.aarch64.x
 create mode 120000 test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
 create mode 120000 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
 create mode 120000 test/unittest/usdt/tst.multiprovider-fire.aarch64.x

diff --git a/test/unittest/usdt/skip_arm_uek6.x b/test/unittest/usdt/skip_arm_uek6.x
new file mode 100755
index 000000000..252cbebb5
--- /dev/null
+++ b/test/unittest/usdt/skip_arm_uek6.x
@@ -0,0 +1,25 @@
+#!/bin/bash
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# @@skip: not run directly by test harness
+#
+# Tests that depend on USDT argument translation fail on ARM for UEK6.
+# They're fine for UEK7.  It is unclear in exactly which kernel they
+# start working.
+
+if [[ `uname -m` != "aarch64" ]]; then
+	exit 0
+fi
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -gt 5 ]; then
+	exit 0
+fi
+if [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
+	exit 0
+fi
+
+echo "USDT argmap not working on ARM on older kernels"
+exit 1
diff --git a/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x b/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
new file mode 120000
index 000000000..8d462f98f
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
@@ -0,0 +1 @@
+skip_arm_uek6.x
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.argmap-typed.aarch64.x b/test/unittest/usdt/tst.argmap-typed.aarch64.x
new file mode 120000
index 000000000..8d462f98f
--- /dev/null
+++ b/test/unittest/usdt/tst.argmap-typed.aarch64.x
@@ -0,0 +1 @@
+skip_arm_uek6.x
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x b/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
new file mode 120000
index 000000000..8d462f98f
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
@@ -0,0 +1 @@
+skip_arm_uek6.x
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
new file mode 120000
index 000000000..8d462f98f
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
@@ -0,0 +1 @@
+skip_arm_uek6.x
\ No newline at end of file
diff --git a/test/unittest/usdt/tst.multiprovider-fire.aarch64.x b/test/unittest/usdt/tst.multiprovider-fire.aarch64.x
new file mode 120000
index 000000000..8d462f98f
--- /dev/null
+++ b/test/unittest/usdt/tst.multiprovider-fire.aarch64.x
@@ -0,0 +1 @@
+skip_arm_uek6.x
\ No newline at end of file
-- 
2.43.5

