Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897441537D4
	for <dtrace@lists.linux.dev>; Tue, 21 Jan 2025 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737483391; cv=fail; b=M6BQA3d5b+GYTGoAWsbDw15uiAVK39ein9H9K20aB/PczhcFy6lh9dUHj0AJ7t1HXZbruiOC7lWvjjrdaAK4LFqAz7FzhODcDalacVdWdTe/eR5vR3XQPi77epyRPgzVx0JLTvw255768fIKk9qB6yuIblKEDxNbFhd6JZ/YcdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737483391; c=relaxed/simple;
	bh=JE/mOOytCP0WRlKniXx2k9zmGCh/Eu1GkSyvPwKoQ2A=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oJYeaTnN2VTPwLfNWyzECF6t2MlTNo0v86f4hn7ysGUUYHPO1uU50ppqVPqU0H8j9sW3oVN9n+xuSADB2J+oYCITJ9lBnL4qNGMYEixBr3IPKPQRhYRX1KIgeWx9ga26wNFTWkgYdgPbrcUYPQpo2ClaAwwhNDvHPWM5Zw3oZ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ib8xVXfx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q/Qt/n9X; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ib8xVXfx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q/Qt/n9X"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50LFDwkl000572
	for <dtrace@lists.linux.dev>; Tue, 21 Jan 2025 18:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=U5p8vUCc1WMHLIV5
	J7zO0FLLBoIZLfhcxD1VyQHxqec=; b=Ib8xVXfxBvSLfDZbtVp4d1Cs3KbAqGK5
	XCrHX+5JnRAfOEzqWq23QO84GVraabcenaPvPVWIUps0k2iWmwL89D4Vb1bxjkUh
	fjcIf3Xa9bDsxG1gv1ONAjvdukNHQQ2Tt/IpWnkJFZ9X55bJbkFDY0sHv8btVBFT
	0ZPx6nnxxoF53NW6ipZPOuKJVHXtynvsJBqmcKf/kJ66OrQpnaiMpyCSk/ZojPtD
	UflX/dK9Q3sMb4njpXmE+sTguAl+Wm3Aw3kntkHDx38ncPzVpuGRF9UCqGcF2Q3L
	WGQE4AAxeDOS2aXoScdcNWaIT0tP6I94xgfgIDMvejSDyCyURHQuWw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4485nsdykn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jan 2025 18:16:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50LHB5K3030304
	for <dtrace@lists.linux.dev>; Tue, 21 Jan 2025 18:16:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4491fj5gr7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 21 Jan 2025 18:16:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BjobbBhRuWg/6xawLn+s8CpSAFRW8weAHmSA+Y/kM9XwicYfA9FF3jXPG8/GZKTkMYWxiBG9gL4aqktsQ9WX0F5A30+jTmc1ydsj0Rr+MYbuDg41MsfbK2dHtvX6xIeSU2DDQEPra24odup/z/zySrGCk0W2i9ootPoe7bPzbQDQfsukSL7rpVjD7jvRkKt9GDKiU/5iVtpeac2dl6Gx8fHClcTc5Tm2ydINHXc1EbmrDc5DAXoPv6CoU8KN4NorU112xlaK3WgmiOUYiJ+T2latinfUAHmVbGXLhExIo4/iAB75lmexRpriIDgqEyf3YHr652wT2kwK2kz6LTGm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5p8vUCc1WMHLIV5J7zO0FLLBoIZLfhcxD1VyQHxqec=;
 b=YK/oWR9wOifregrN88MNvW43NmnlpVHxkBPcLLDD30cdjRi3WXM3tROnDpSHDUa2yx7eHPyJ7NX6rfCfb7mTosFgvyrlLiLnxBF+Lr3nQ7aIC8ihqbOW1vRiVwMMC2KbF20PBdjkUQFyqvTwMnfdiWSle/51tmS0Dp69tIw3CV7nbNetfpYz/QQ+ks8L6PbfTRXS8YMf7o2+LxDFAD5M4N3zp6iZPxtI0FaHj7b7n3ltEAcqLutVVxOSR3chCJELzAPEuikf+yE2BOhBUgPktC8ApCTG8KXdDO/LvlpHirhl147tfrbOjxm6e2sicYk/yNCeCprtXosL78sqGA1Dyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5p8vUCc1WMHLIV5J7zO0FLLBoIZLfhcxD1VyQHxqec=;
 b=q/Qt/n9Xk3mYtxO1i1l9ZWQgSnCSjsDZfgfdwmicUVV+rS8nPkBVbrfJgSCxppEnsUDkqUXTJ0Lk6OrgFxCFiarH/9nptt2T8DN1NRVQQhIrH2TYrM6xcvH3LAvw2uYWCYL9kPA6GoTfRzvOuGIqiYStnDBvoxztfqxEZKuxQl0=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CY8PR10MB7124.namprd10.prod.outlook.com (2603:10b6:930:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 18:16:20 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 18:16:20 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] translators: fix io.d.in devinfo_t.dev_{statname,pathname}
Date: Tue, 21 Jan 2025 18:16:17 +0000
Message-ID: <20250121181617.342071-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.47.1.279.g84c5f4e78e
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::20) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CY8PR10MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 354f58f9-f0d5-4f8b-ffe2-08dd3a47b4aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1g84VXaPk6CZLE2iJaD8RSArWEVUWv8d04N31Zh2At8TIJy6am87xe4z32Kr?=
 =?us-ascii?Q?cHhQ87+kSJRAADkDuV3tebd8hH7xPE093cZITXAO4iKDrGS3pLpAabUkdaRC?=
 =?us-ascii?Q?zLPMbIumMyVKYsaYCCW/RugrEPEwaGHCD82dZScmaZCQJXZQr6SL1vbDsjGd?=
 =?us-ascii?Q?YSkGkciubktR6pEGNj0VsqE6Idi4pAP+18Q9cvFqYH373M5J6kUnmmnJMw16?=
 =?us-ascii?Q?AjGv85DqfmPgTNU+SlUToVF97kD0GvIFmM9lHVLyZFVe+bY88Bobq0bluG2k?=
 =?us-ascii?Q?WlgawSuaGIrhTT4csBdjLU6TPj8XeWHwyMO+LODf38hkwtt9g3wa2gmV6Obk?=
 =?us-ascii?Q?U68vzx96Qc/GlfQVYv/bFNUbbHLHpbKEhVhf7XXqKEEYkKOL8RalKq2bLxKl?=
 =?us-ascii?Q?0VR8ZPmO2IviTug5dcJpxdaY+kzeaX4JQ3hng/m902HyV0p5ZBbsb0FLEhmN?=
 =?us-ascii?Q?WTGmjihzYZQwUND2jtVM6maMK/wtj3EU5t61pr5O8N4q1w1nLsohFYBHbO/D?=
 =?us-ascii?Q?O5+S2KmRBHIGB5AlzkUQbgU6+YqdOzFkkM+AMaEgAZRqMou6qqY+yjHLEMkm?=
 =?us-ascii?Q?2vw8TfU+pOIpYsqO+YRmY22MsLH2+CiZeEmnbbUo32qVX1R7iUIiTiqFtwIS?=
 =?us-ascii?Q?3wHNQoeAWjT/xn9xmxj5RzNic9LberJUyYhTtbjUJL5mAq6lA6E2pnB4rcBS?=
 =?us-ascii?Q?5Ioe08GNM3onqoQOhTHytT63pCNNugYedWtquuOl/CtvZ2N+10x3HK780sRp?=
 =?us-ascii?Q?OttDc69LvJk/8WZBQu5QFsPLh3nnZBL03Yvg1jhSnZOJVlTzFT+zWAEZwpED?=
 =?us-ascii?Q?zTq7Gw4HxnR2njeMlDuIa5DaI7XMHu/3BgcgwmtnhFquMHPsnzduHsEl3m8L?=
 =?us-ascii?Q?pt5GvBs1AfTc9ZLQcK/3aCaURW2zT4yaMRyhsVxLr0DOhs8VDVEVYnA4eDMB?=
 =?us-ascii?Q?wDcdQ0PBWcpOiLe3Gr5ErFAYllznktm1sb7sdgzKf+HI/Y7UvDiVbAH1wWy6?=
 =?us-ascii?Q?wnUONZK/xY//oUNgUlQl0VAY3ZErXQvriV3CwRbk+wtEJSmrH5cJw+PbKuHy?=
 =?us-ascii?Q?ocH4kR1rgTy4LTDqMA6vqpQ/p1ZAX5ToB6NQpw2Ul6NIeNsZrwlG58fnquCZ?=
 =?us-ascii?Q?JJQjoSZ8Ig7cr5e0MmoX+4lrkcatp/LhkeZ/KGuiGAlydSd9EjN5Jedh151K?=
 =?us-ascii?Q?ao+kE8oeOrI+zXgPV3Ru50uSN9lnTRwji9sHy6na2nyl26ls0QkRzpPgTpP9?=
 =?us-ascii?Q?t4xKP4P8HJINj+lgXCZXouDsG2OrtyWqmWKOKfBCAEK39XzUYgV2ygJB8iL8?=
 =?us-ascii?Q?ysCzVW+NGRnY+e2PMheyvrl5aEHnpKGot9xMldEhPRtsfh1kZQE2o2at3a2N?=
 =?us-ascii?Q?xDzAge3EF6BFbcqWqFB/ziSsYoVz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RmTTKUNyGyGzaDXlFbKVx1vEvYkSuqhjWYJhJ1jAYBakLJrxEvAcsxd/SWHt?=
 =?us-ascii?Q?KM6k2J/vllcN3IK4eTI5p148cxHc7HTqX9QAscnCWnngWfKQO5oWzeS0bUOf?=
 =?us-ascii?Q?Wr4hSQlXtSRb7N1xE0Hs59pQayDzM8Gwl9NzWS9jgRZNXGNmIrknBGJApyQW?=
 =?us-ascii?Q?sjc2hJg+yXjInTllQedn22GiCIR4VqWTcnAWVYQnl0MM8LHxQR21j7G/g0x7?=
 =?us-ascii?Q?5KI5mqBPV3Q4+BJCBssGYD9+Znn/fUuqUsjUXunU1UiXMcg1I4+vgWF+NQkJ?=
 =?us-ascii?Q?38LB9FVxFuZ9Eb+y6tDF6bJR4X5TquwXgAS00LH1izJhMTjrxHcfWfjnx7xh?=
 =?us-ascii?Q?vzn9rMjpOTQ+xg0m6q1UwyGv8NA4oKv+FhMwyRbVgHGDojN/Ttfe21RlYcbU?=
 =?us-ascii?Q?aSuMFgR8T7tnJUix9vm+1VtKClZcZCcMxiO7mjRMgNpFRl85tQtd+ZpITsL1?=
 =?us-ascii?Q?3Z6DldWCXIZu68Qv9sh62OB25vgrEptdqvoHGmIhb4cuxtE8Up0cFH7mTFDa?=
 =?us-ascii?Q?EWlyH0z7kni1OZHHp/tIwYwZYFr+F/OFAdhfUVYW3alQIrV8H1KOJ64Ksp8o?=
 =?us-ascii?Q?Ml/bZQtkqp9J+/Jpdwj7mFs/GPTW7KI55m4g4HzmrE3eGS8vj5xXTQ98i97H?=
 =?us-ascii?Q?90pOWMmLBczAQ3lLEJy3pVKtQr/sWfVCVdLHSvPArKTHl8OXJYsHCsxzGNOD?=
 =?us-ascii?Q?fk3puWQx6GP129MJ25AN/A8N09uKAMbasVNVnJP7ueUmTcgZzvzkKVAzdemQ?=
 =?us-ascii?Q?64XcJ1Rw9d/UAg1zljCwXJ3aIwAzttDJQgDDI9mk2NCVtVUW5GZQxMXo1LPr?=
 =?us-ascii?Q?XacswESHsEko4leXnXh5eSmvl6DfVz7pdjp/PWmqTioMhCx48gxoKmluqVmj?=
 =?us-ascii?Q?QLM/JAAw5ecwOXIKpaUwynKVtEF0S02701nm5gXXK7q37Bpc44B2ZjOmgq7g?=
 =?us-ascii?Q?Z3NZ/2nWG4GPflvSs6zstrkdQOmBXGzM97HUg7ZLyu5nYl2xVurgNJkqWu9+?=
 =?us-ascii?Q?kCxp3ZTuaZGBYePqqE/mUrK9kJ5NxdHmAsOLeguoYN3otAL+cpOm5PiWJo8L?=
 =?us-ascii?Q?r9jINPJBb5sGQoMD1gUPYbZkJd2IPyV1O9qMivF+Cc/awNjBY9myhtV4VX2C?=
 =?us-ascii?Q?O92tI82BnjwYUrrXtbm/mxLTJSbcvLnxf/ahFzJSyxtNvDiEgBfUG+SRo7W+?=
 =?us-ascii?Q?CnNA9SsFaA7glVZ3pnQJ4jcc7TlKSrKF8ph1fSXfY7TS2PoP0+niKaUE+ZDy?=
 =?us-ascii?Q?wZMcFlUj7WPRSaDIbKaaeMZ9P7VsJtIOoqpxvoCGCzKP+rt0ywvDeUVJlhNY?=
 =?us-ascii?Q?sy1MKF1ieeJ8sGuPyFwQgD0UaHeNEU8FxE6JnmhqG19u1/+Du4HNZBAJ69Fk?=
 =?us-ascii?Q?P8Lrh5BewZmvwoK5bBEUpJJoUP0l4hg9Zbq5eDxM29i+cAKCZUsxIcRzfbIE?=
 =?us-ascii?Q?98VnE7jX7IWWMxIvD881kyAJTysHsPuMgpjEcTbVtI/OPAbCdpbU/stBDdEm?=
 =?us-ascii?Q?yR9cKdHndVmVWOFes6soSR9zEfUfR2nUcTHPQiAebuyeAQMQ/VzgVCDGh/X9?=
 =?us-ascii?Q?+wOZgxgQ/gpvCmunvbybJncskzUf6GoCTfp9lbxluxnbp/QVmh4jVfoNngnZ?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pjzUAE5mrHlYVGCOTcgp6on6cx8wuqqF7Xgzjo/a/fZcCqmnFMQ6a66yItFjcaSF43AaKctUPIkHen7zrfL95c0eIw/u8WOU9y2NQDruGDWQbFlOcUfmXaab/Yrvw+Ifet5jaOzKBK90OFKdXnFJ03yp6Kf8wI6kR6mtX8f/OEKyPDjNX5QcSZKMir2Yf3mSc/NmKMb+/EzeiGOCxL0p8wfaonVWdeVA3HNjAuyWv5Z/BxJiljOBBBJRBhuFTowQDMYpDhFQWlmzVJU5lhQSugcsPt8MEuz7Yp7GvNY1fkLqfkc/eN6eC9rSNabZkGqL9Kv9IozPRs5oWei7kMZJHnaxzfHPUiLu79rJ83yEYGebJWqIBuQXbrCcp5En9DngUtmt9ZRnW04M8SlmugAJ+qsDM04LL3XdxS65R6FZ0p2rWK80ARcBZJP62Zv/m8sWDYtWr6pZGD5lXLpqO4Vr6CTPT2FvUzuQcXgZZGDa+hW8M6PoI+byKmEEwYPOObV9ZhPm1yefvNTChhcQj2se7L+rtCxRMuow4KqymJ5LBPdfRqepzAdVZBZYAHCZ7BL+cNvJNxTewo7wdgXOHwQztmmAIcvqbWnbxgC9D8Sxw70=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354f58f9-f0d5-4f8b-ffe2-08dd3a47b4aa
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 18:16:20.5960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gmt4xrFbzSzBjQDH08As/LK5kkIanXwB08HemnSvBAPKgi9dsE8JI5y2X+0rsDWy2ztOkf6xTJkbF3NKBNGioQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7124
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_07,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501210146
X-Proofpoint-GUID: kgc6QNpQ1e9ISeerAkgH_JUP9laPfKBF
X-Proofpoint-ORIG-GUID: kgc6QNpQ1e9ISeerAkgH_JUP9laPfKBF

A precedence problem caused us to never accurately determine that
a partitionless device was partitionless, producing erroneous
names like "loop00" for conventional loop devices, etc.

Fixed thusly: translators above 5.12 need regenerating.

Fixes test/unittest/io/tst.{local,wait}.sh.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/io.d.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/io.d.in b/libdtrace/io.d.in
index f44f53f092dce..09915dbceafa2 100644
--- a/libdtrace/io.d.in
+++ b/libdtrace/io.d.in
@@ -135,7 +135,7 @@ translator devinfo_t < struct bio *B > {
 					getmajor(B->__bio_part_dev) % 255
 				   ]->name);
 	dev_statname = B->__disk_chk == NULL ? "nfs" :
-	    B->__bio_partno == 0 ? stringof(B->__disk->disk_name) :
+	    (B->__bio_partno) == 0 ? stringof(B->__disk->disk_name) :
 	    strjoin(stringof(B->__disk->disk_name), lltostr(B->__bio_partno));
 	dev_pathname = B->__disk_chk == NULL ? "<nfs>" : "<unknown>";
 };

base-commit: 0fd90283cc03c640de3695d5f276dd6289a022db
-- 
2.47.1.279.g84c5f4e78e

