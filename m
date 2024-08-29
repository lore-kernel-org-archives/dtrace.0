Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3007DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909228; cv=fail; b=H3VnA99DMs1ut8U4UcArzPzDwbQAo2nU4oeDLXv+JVTI3redcg9gY0lbu9RptMpk7VyPtd2YnQB972IH15WlbxYgqMmtHSzVA0+NbnOfVixmry/M8M/iyF5SpJo1OceKwvtVstXLKrzayKg62vOX84HPkHr1UVL6Y4mLQA64QGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909228; c=relaxed/simple;
	bh=Vzik0ioI2b0ZrIC6QvtsbLvLd3WTpWEdU842hKGoDcc=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KuNTktucdt/7uZCrtJSTDY0IeuqIdWIv52nEv/mpGvCy+9cqlg5e55BzCBE2Q3hA3lO71HtK2RWhrCyWBHJtovRIRbkegoLNtxYoUMo2z9IURlj4Y6bph4v+tkvXJiY1zGg5IXDlA/YV95WYzJnqxxc9VS2hk5MP9W1k4HTUoVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G+hvBWNA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hxEspg2o; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G+hvBWNA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hxEspg2o"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fXhd024387
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=iLP7upoBWoBvYW
	dn8whzlzsdZFH+pBMR8s1MaWc0aGY=; b=G+hvBWNAmBT+Q1y9BU35GcB/U99Mog
	MkUMAg2hBgoAT0a36Xrq4Yb0kgUh1+bsD9uY2aJvgDgQcwaSdd+X8LErYQyVShn+
	nmQ4/3yeqbf6feeeSXyTKm6zBQe6M7RCnl/LQ38J6dvJuQBRgU2Ek2XRmf9CH3E2
	7RE/hhsi2l+e758QuZjXGY4taCxdKcloguRFkQPxksVbuuOxcLIH/fCFRoFc/uxf
	qGB4LhEhw+2V7IKwXoa9Oa2Wf3TNkg110nSxqnf4UppXDjjToOxW2kSmqn24Phqm
	HEEfY5G2zCQ9WEuGEoKmqxIJrMaD8h5AkJ3dQTde3aijGDlAJwK6AKPQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419purbavk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4hXgh010507
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:05 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41894q8ps3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:27:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/gNxlvIXwxmVVQEa1KPi6ljPfujiMjVORaN0OGzpa+3Nz7O1lO4OA89Sgf1dvu3y0UJEm/fyU9QTcleEijdDggMZntorG+/e3p00E9NzTJJWTaq5aaQ0M6J9IVKEGegXNzRtBqhEDx1PGdw/qIJ+KffTID2ERkFkpg/6sOj3ba+BvsCZGDfbR6bfYucdN4mIz9BOZe9eLgshkT10JeD1IJhkGIMFzfBVz6sbxI+2e99VFUPAvh+0y9oPxlWgiAppxI2StY3Q64kGj/moZWDnmApqEw4JSNMAETFEvYNCV9ecj5gU/qA7uW/b4K8RfivV4GZmkVtxlInJ8kAwfjHcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLP7upoBWoBvYWdn8whzlzsdZFH+pBMR8s1MaWc0aGY=;
 b=bgH02ejmEeiUj+joVw+RY69AkjgTtQ8bRNpAKSa6CvgMEyMkeXHivLpEUpS3XQ0WBmGRnIWtsMalkD2RLqzPnCHSx/GfzH9XbtwiqTB+xSWYpksktGj3uasae4X29umz1w4+zFE+BVH4apUGyy556G1uT2PUCoUDBKQIgtWd7hXLgNKMtQfu+sMDudYsmlcNchShWjiMJ/o6QS6rnvpFdBuCB4FLq4KoCeHxfsL1BtZMdH11RGnClVlq70fAS/z8grun61cLImuMK1w4XCYWvm03z7Oyn4xhDZMR/Ng/0RUcJwDXowUDEM7gL38iuKUcwQRwzJSLj5+plq1N/7z/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLP7upoBWoBvYWdn8whzlzsdZFH+pBMR8s1MaWc0aGY=;
 b=hxEspg2ossAJr7flG8GKEeGafSLuZxcGl1VnfPwipPWmUoLWItNPeUuiZqsOp30YRruxBYaMjKdDMaIPazR0axT8hy0+rT+ZmNZOWLx1foEcxtlU9w9PXTv7KjK1JXRXURBKqutL09JVrcEOaOlbNiVK5VvlqRhmYVU+1Fi4ons=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:27:02 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:27:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 19/19] test: Add another USDT open/close test
Date: Thu, 29 Aug 2024 01:25:58 -0400
Message-Id: <20240829052558.3525-19-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ea9c0e-4a3f-4004-1338-08dcc7eb362c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Hq63jMRhijpHRkkkDApZX0kyHioJmfS//MzaKVainD5mcdhaUqZYXRGDHg6n?=
 =?us-ascii?Q?CbQhf3trywqyPpiCMU8htL5WE2BH/hAdTTNl6q7ix5Fg9uFNwZyOtLo4ctT7?=
 =?us-ascii?Q?fAT55LrnN1vo3LlYXaVidl5XGrBDets2l/i6Lwyy39V0KTDaOn4KlO3VOviZ?=
 =?us-ascii?Q?RQ57DCVi8XkDLXkXD9eY9XkLtCt1B8NbdKqS8ei31Vh7VIl8sGxOw/UxxKcU?=
 =?us-ascii?Q?DwPE0Jbp5uAOJ27jhQ3d51j2omWt6BjgNaiIwUJKdYI0gTQevjJ+XdtPCGH+?=
 =?us-ascii?Q?EbL6eFkX9hOZPkdI6BUB1RoFDr8A3ztd+gO6RsUhNuXZY9WwN/yiZRZD1Yt+?=
 =?us-ascii?Q?BdzQfauDmY+d0G7ZiOtCUkzAUXGP7C4jv+DwcAZ1oRCvMIMnc+Wetwq79gkE?=
 =?us-ascii?Q?dqesQbrhVBKl+nvxNLuAbufRY4DTyCW2ThUnOFFqpfQ8GtjxrSJZ9ZJO6Z0K?=
 =?us-ascii?Q?iMHgjE+hFJIHW6M8vVuLsmCyiqvPN8D8yteZ/gsK/xZ1UYPZGJPi0YL+lGLR?=
 =?us-ascii?Q?bc8qAgDfRtcwclxrRnzjNkPLvcfJisIHFYAiP2KrDCopeGgswONkP1RaRVQT?=
 =?us-ascii?Q?kejiERYTV7GmNESfQLDmeMquIDs/7ZCRLri2y9x3bURbwUvvVZDKVIlP5ecU?=
 =?us-ascii?Q?JD2O/+h62jY5kJ1XeB15XCQh+JECOHWREusLdOcawZQqs6TNZAXxzUEExuba?=
 =?us-ascii?Q?Hfxhp3W54cN8D7lVNEUDK/bziH7zIQuix569eoTZJd1m7RPTmZXE7r1yaUyW?=
 =?us-ascii?Q?6cFrB8DusFzwmbtwkEXOsPJm44k3OkbV/KmnlfW4aqDQ1Boww2Dg56RNWO9F?=
 =?us-ascii?Q?Y/rjWcA8L40in90klDaC8e14296z93F3YMrcj5QDPNf12vh9D25qX+cZAIzZ?=
 =?us-ascii?Q?yYFg1+rVeiQEFabYeOBgk3lpQFVZJuudv19Z8yOd1QwdqQkqcFHXQAAfP1Qz?=
 =?us-ascii?Q?nUwUE4V5RfanEZg5j70Tiv+42fW30WvvaPhI9rA8Iz04Z8h/1MD+NkKhHM5b?=
 =?us-ascii?Q?7V/zx/pka6GPH0Sf7zS+cNIPyZKe7ZaaX6ppKHpgRJwcfv4HnZ+fZWlu6Qsl?=
 =?us-ascii?Q?euzi1n7+mVr8GFu0mTVz7U2+I34XHqwWVH7hk/+FkzAdeDmtESlaMPcs0chW?=
 =?us-ascii?Q?Gsa7vDfDYBjfOWJx1Mm+SPwN8Knms5l1F7CWp5xSRB6qbTXRGDINZJZ4BzUq?=
 =?us-ascii?Q?NlNeleb80smMyLcR8SSgilUy6bsjVfE5gqymFsPwUigRdK14iAG3YF2EdAFw?=
 =?us-ascii?Q?LeTEGDMucgn4AWaq5Dn/tHtHWG17kePjN4vvieW+I98OCOVcKn3omhPELOel?=
 =?us-ascii?Q?ENw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3XizluCOyf7U28oWaRQDrLY3/A8ebdVEF4AO9CKoBuyFMVxpup0o4AYcW4i1?=
 =?us-ascii?Q?wnEzza2lbWeaoHdZEgOhuqhQiFRLY4eVnp/rulDatMvQszfGvSE1PtklqTm3?=
 =?us-ascii?Q?wsFyHHFaizIbTMoc+vU/L/Xc1K7c4UsOuVDJLM3oDs2Ywylw1oxEyFGpj0CA?=
 =?us-ascii?Q?x6LFHO8zLnlpHen79Sp0xD7vRD9SFARAfHgIZptZ384RKSSdhhkWVw6xH/Qg?=
 =?us-ascii?Q?ys6nkNUu4xWj1rrK6auI+eqEJ84YMoO/lzo75oCQhKBv5a7RNAvdg8+wXTFi?=
 =?us-ascii?Q?UozQ3S7K15a13yBGJM6vdfaZD7dy4bhLt+i7TUwYmpCYZBg9biq9jOigjEny?=
 =?us-ascii?Q?6amRlhVEc2r7qfSSNNV66p7CUyylvpyoFTWBKWKHz56qTGVl6+a3zKlIMHir?=
 =?us-ascii?Q?nFAX76aP+yS98IqbfKdufWYCb6Tte6k0NFnMGXARwPWJBH75pKRN0Wwfe1mR?=
 =?us-ascii?Q?zZ82ukBG8PVVwuedCDKBEfRBb0pXl92F6Id+XCJdq8slVXwUNSeSSkXbL5Wr?=
 =?us-ascii?Q?YHGEZzZfcwa0OFSP5ErPNJ/dnKjXHMqADfVjQ4GuPYY/uMms4YQzVjEe3oNx?=
 =?us-ascii?Q?Z48TMq8XQYcrhQKCIJPU+J0iJUfNQ9fiUtn4nLvDnMoEivQfQqXo22x0LAgs?=
 =?us-ascii?Q?JxxSWjTeBVNsN2EF9e9mxCo22R3VhemZUOo4wqGfsFANFnjf3BlNPwnaMZoo?=
 =?us-ascii?Q?JqW2A4DUr0riNTBTU0PrUR/b1UmIQAPoZD9a70sERG/D9rdyPPZTnzzd3bJ3?=
 =?us-ascii?Q?Qvp+iBJSOmlbCaEBqEXh/NOll8p0Znvg/FE0tvk/LRrwgD+RIMEPFx21Py5I?=
 =?us-ascii?Q?Cj+7BxaFMOucz1eTSxCK1nf/X4LWyKB6BNMOLLRLdMY6MDutvPtSj6I9ArG6?=
 =?us-ascii?Q?YD6nKWVjiklCtvmn8n7aUgj38tV9nyn2eKDngdqQJ7ndOg28eUQe9PUKjmsm?=
 =?us-ascii?Q?NyYQ2jSm48SwLAoR13U/FH4xSLVpbl99bJdIc2Chaql7sZ/xKoHoDyh2NhwN?=
 =?us-ascii?Q?ZJjr2mmkCY2QYhFWu6OqveC9PcRiHXbMKbNhG8TTPbAZXIbhVvfe6iiQ/WYg?=
 =?us-ascii?Q?f2oVdJD6BiP4a6ndgiSyk0M9kXPqcL+RmQlf1NR0tv/60eb0D5QnrK623Bk7?=
 =?us-ascii?Q?CGVtYfB2Dp8WftmAxp1f2+DwMIqD0iGH5S6CzhxCrnPVdMDLXYTw2VCzdAmC?=
 =?us-ascii?Q?NOgejswwSllN8PCfekJYD5tFlGynruQ2gwm0QNcwfznTwQz3ERJgYJK2FijJ?=
 =?us-ascii?Q?LORvMq9IlyFi4dg/yMTh+k8QCDNiInLC9cLXQiQ8e6bwapOXu5KULR1MSllj?=
 =?us-ascii?Q?VOSJS3T+4y67NmtbhZ/zsUPxkU9dXnqiSvJ6Q74cK2akT6wupTv4XZYZZdKb?=
 =?us-ascii?Q?xNOJpENjY60HEqylFY+R+/bsxO8V+T8apJktGonq4xc1cjlENXdRC+fxsl9l?=
 =?us-ascii?Q?kc5GU9yyg9WnGqx55BFF2sAj42Yl07d3udxXdpFJ0rWJlqbiaQGVXpOGKVpM?=
 =?us-ascii?Q?9hlO0gzBP2nbiHE24a3vflCl286PP9aiyqRZY03pjPevvrDhDDrRvzfnityq?=
 =?us-ascii?Q?z2tu+ahMmGPCwA3Egm0ycEu0oI1QSM3HTw9tH68N?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XMuc6Xrdl6KLjiQDk2tzGSTN9J5afxlyw6vCK1NDSAm9VndKU29gNRm9BDorYL4GAES5pP4o5IW7/PJNBHOtrSzqjeq0CixPUkXUWgaw/ONdXoy/cbG4XAbcOuWEknW251v544v2HlDIN3h3O/P2t/48ECP+Yhy4U++9427AJv9Z/DL5Qg+m/yMHHBi7t+US/Mu2lL2qPEtPNp9cgnPdSx7EUbxfz/z2LU7z+yXcCkAw7KkEncVfKPGuNTBJzoM+VfPcuxMcorzwkj55P4heiAl+rjqLpvxp7seFTOIchJPE5/LPhB79ZolUg4s7zmTjGYEyiocx3KKhAL1A8Es20k2va3QmoCPDhVY7TegnuWxrgLxLZqpbY6La5QaRbut1HEczjWnsbrXw3vdsOomu5K4D+8AxOS2fx73uTn/R3mW1PXC+WIxiJnkAN7edpK3JiT6e6zdhWrCZSnMYKa+TpUbsuhyRQIeX6uLGIFifK2nFOUrDm4EUOyI7XAxCIofnMZT8wU+4T/xvpsHYs3uQ7EYq04dt98215cC+QG/uGHmycjqhx/DA5laZ65cpzPP6Nso6MXgRywZpU2LfvgKkSYtlBvbhFuuJdD5evLUvdtA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ea9c0e-4a3f-4004-1338-08dcc7eb362c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:27:02.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUjGiTewaMjqhgmFdTv7VATs+3iJAe7i7fereMYJ3xDF5y9VlmjbD4kOfec+gVU8EoI+oRvH2s5W7KdFsndo9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: n4gNZEgRctMYHN1JGP89aVfHFfvnqFfO
X-Proofpoint-GUID: n4gNZEgRctMYHN1JGP89aVfHFfvnqFfO

From: Eugene Loh <eugene.loh@oracle.com>

There is already a test to check that "dtrace -l" sees USDT
probes come and go as an executable loads and unloads a shared
library with USDT probes.  (See dlclose1.sh.)  But it could
also fail if DTrace does not immediately notice USDT probes
coming or going.

Introduce a test that allows a grace period before DTrace
notices a USDT probe come or go.

There is a deadlib.so here.  It is not needed for the test.
It simply mimics other, similar tests.  The real thing to do
might be to put these shared libraries, common to multiple
tests, in test/triggers.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.dlclose4.r  |   5 +
 test/unittest/usdt/tst.dlclose4.sh | 225 +++++++++++++++++++++++++++++
 2 files changed, 230 insertions(+)
 create mode 100644 test/unittest/usdt/tst.dlclose4.r
 create mode 100755 test/unittest/usdt/tst.dlclose4.sh

diff --git a/test/unittest/usdt/tst.dlclose4.r b/test/unittest/usdt/tst.dlclose4.r
new file mode 100644
index 00000000..07927a4a
--- /dev/null
+++ b/test/unittest/usdt/tst.dlclose4.r
@@ -0,0 +1,5 @@
+as expected: USDT probe appeared
+as expected: USDT probe disappeared
+as expected: USDT probe appeared
+as expected: USDT probe disappeared
+success
diff --git a/test/unittest/usdt/tst.dlclose4.sh b/test/unittest/usdt/tst.dlclose4.sh
new file mode 100755
index 00000000..015bc52c
--- /dev/null
+++ b/test/unittest/usdt/tst.dlclose4.sh
@@ -0,0 +1,225 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+PATH=/usr/bin:/usr/sbin:$PATH
+
+#
+# In this test, we send alternating USR1 and USR2 signals to an executable
+# that responds by opening and closing, respectively, a shared library with
+# USDT probes.  After each signal, we check "dtrace -l" to confirm that the
+# USDT probes are and are not listed, as expected.
+#
+
+dtrace=$1
+CC=/usr/bin/gcc
+CFLAGS=
+
+DIRNAME="$tmpdir/usdt-dlclose4.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+#
+# Set up the source files.
+#
+
+cat > Makefile <<EOF
+all: main livelib.so deadlib.so
+
+main: main.o prov.o
+	\$(CC) -o main main.o -ldl
+
+main.o: main.c
+	\$(CC) -c main.c
+
+
+livelib.so: livelib.o prov.o
+	\$(CC) -shared -o livelib.so livelib.o prov.o -lc
+
+livelib.o: livelib.c prov.h
+	\$(CC) -c livelib.c
+
+prov.o: livelib.o prov.d
+	$dtrace -G -s prov.d livelib.o
+
+prov.h: prov.d
+	$dtrace -h -s prov.d
+
+
+deadlib.so: deadlib.o
+	\$(CC) -shared -o deadlib.so deadlib.o -lc
+
+deadlib.o: deadlib.c
+	\$(CC) -c deadlib.c
+
+clean:
+	rm -f main.o livelib.o prov.o prov.h deadlib.o
+
+clobber: clean
+	rm -f main livelib.so deadlib.so
+EOF
+
+cat > prov.d <<EOF
+provider test_prov {
+	probe go();
+};
+EOF
+
+cat > livelib.c <<EOF
+#include "prov.h"
+
+void
+go(void)
+{
+	TEST_PROV_GO();
+}
+EOF
+
+cat > deadlib.c <<EOF
+void
+go(void)
+{
+}
+EOF
+
+cat > main.c <<EOF
+#include <dlfcn.h>
+#include <unistd.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+
+void *live;
+
+/*
+ * Open and close livelib.so, thereby adding or removing USDT probes.
+ */
+
+static void my_open(int sig) {
+	live = dlopen("./livelib.so", RTLD_LAZY | RTLD_LOCAL);
+	if (live == NULL) {
+		printf("dlopen of livelib.so failed: %s\n", dlerror());
+		exit(1);
+	}
+}
+
+static void my_close(int sig) {
+	dlclose(live);
+}
+
+int
+main(int argc, char **argv)
+{
+	struct sigaction act;
+
+	/*
+	 * Set USR1 (USR2) to open (close) the livelib.so.
+	 */
+	act.sa_flags = 0;
+	act.sa_handler = my_open;
+	if (sigaction(SIGUSR1, &act, NULL)) {
+		printf("set handler failed\n");
+		return 1;
+	}
+	act.sa_handler = my_close;
+	if (sigaction(SIGUSR2, &act, NULL)) {
+		printf("set handler failed\n");
+		return 1;
+	}
+
+	/*
+	 * Listen for signals.
+	 */
+	while (pause() == -1)
+		;
+
+	return 0;
+}
+EOF
+
+#
+# Build.
+#
+
+make > /dev/null
+if [ $? -ne 0 ]; then
+	echo "failed to build" >& 2
+	exit 1
+fi
+
+# Define a function that looks for the USDT probe with "dtrace -l".
+# For debugging, one could also check:
+#     ls /run/dtrace/probes/$pid/test_prov$pid/livelib.so/go/go 
+#     ls /run/dtrace/stash/dof-pid/$pid/*/parsed/test_prov:livelib.so:go:go 
+
+function check_USDT_probes() {
+	$dtrace -lP test_prov$pid |& awk '
+	    /ID *PROVIDER *MODULE *FUNCTION *NAME/ { next }
+	    /test_prov'$pid' *livelib\.so *go *go/ { exit(0) }
+	    /No probe matches description/ { exit(1) }'
+	return $?
+}
+
+# Define a function that checks loading the library:
+# send USR1 and wait up to 6 seconds for the USDT probe to appear.
+
+function load_lib() {
+	kill -s USR1 $pid
+	for iter in `seq 6`; do
+		sleep 1
+		if check_USDT_probes; then
+			iter=0
+			break
+		fi
+	done
+	if [[ $iter -ne 0 ]]; then
+		echo did not see USDT probe
+		kill -s KILL $pid
+		exit 1
+	fi
+	echo as expected: USDT probe appeared
+}
+
+# Define a function that checks unloading the library:
+# send USR2 and wait up to 6 seconds for the USDT probe to disappear.
+
+function unload_lib() {
+	kill -s USR2 $pid  # send USR2 to unload library and USDT probe
+	for iter in `seq 6`; do
+		sleep 1
+		if ! check_USDT_probes; then
+			iter=0
+			break
+		fi
+	done
+	if [[ $iter -ne 0 ]]; then
+		echo still see USDT probe after timeout
+		kill -s KILL $pid
+		exit 1
+	fi
+	echo as expected: USDT probe disappeared
+}
+
+# Start the process.
+
+./main &
+pid=$!
+sleep 2
+
+# Check.
+
+load_lib
+unload_lib
+load_lib
+unload_lib
+
+# Clean up.
+
+kill -s KILL $pid
+wait $pid >& /dev/null
+
+echo success
+exit 0
-- 
2.43.5

