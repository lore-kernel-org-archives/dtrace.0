Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1861C25F98E
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913588; cv=fail; b=or/907kGh2bMINW/2Z2ocVniEKQGtW9zlqpTIcrOF9jPmtMniG5O3R4iimaIMVS8M8B7PKvX3cdNY8retf5VvG7KETUCrQR69iWTGuEc7SYWmR2R7Zjk92MPOwl8lIoeQQL8FGD9JxyX2KSDOpVSj8kiOCyhjLQflpe3gtRbnTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913588; c=relaxed/simple;
	bh=EkyYwI10/qlHy8gSn0PVzSkUI6IZw3irY2SD5s+uGHw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i2LZfHpdumc8bC5rV+xAUmSOQZgPvIVzit7p3H3K6Eq8t3dkrgng7mLhXPfYYZM2nJ10+Yu9D484GgiUFq8UbEjKmTFPFKc1g3byfKExVUvPMijvnK6CTYT4sMyS/owvOkw0ayv8AAbC/dPld97Mh/oNcit4ZYJ1ipT6AYmij3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pjkMEhdx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G982RrXl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pjkMEhdx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G982RrXl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIivlG014361
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gmcfxzyulXVXCpv10o
	eZGkiEi777erthOhewYE3HZ7U=; b=pjkMEhdxtvpW6c+s2udkPDoyAEtwlzI1oa
	IVXlGtNy5vWhaqV7ZAVKSc2WBBrmbymWYvQInFL2hHA428eWPeXVAdKRFC8SFTg7
	LEmOyxoskxZna6ibMeWFtLC4fSo1NpS3A4YHWBILQQU0OHp2yE0bExFOAfb2qulY
	TucbFV8MQIT82o6NMlsXr0V+vDFfEqKKLL7aY5fe125HmaGvbHmGfWpJFYLR2apY
	67f85GbGcDBlgrvXxWpADImx06e4Pi5UfqCjYufEfOc22n7N1Gu8UxQfk4cN22Na
	k4yE45jW4xBFKxW7akIKSAm2yF1kGkOBjrq/p9+NCNmAbHx6tTUw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49e0cfg0yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIE6o9010263
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:25 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011009.outbound.protection.outlook.com [52.101.57.9])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49dawmc25k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhxCvN+DhA4loi9KV0COyOrPTMpwa6rz9cU7cmPr5EooFIhYeyeh9ejK0oMgpgTudiasxYRlq+e0/NEwaAJn8/LUeEe+xVHHQx7b7lDflytVunalwKYJpC7I/jKwoT2TdmsOsQb0tEoayXvGa+7qVFCA19AWXdHfNKAjfk6gL0vydaKlmzB6Rtz3zum3wdZubD1f6NX5qkP4IiXT8SJzDUNGbHnLTWSPHj38RKk1Y8jEXuQ8WV6JcHgaMdWGdMnbf5xRrP2/71vLFwrPo+tuqjcDOz3YR4mLhPE5zWKHct2H2Ta6Lix+V30My3DtrUOz/y2ZAV1VHuKJYdLXRi0p7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmcfxzyulXVXCpv10oeZGkiEi777erthOhewYE3HZ7U=;
 b=fWV4uBh9i3ikOcwQDFZw50DtORnYioHRwZ9PYtYstQvXdSrwOkVQOWn1/fN27Vvi/xMQheAWzwrG0Q/XLbs0HUUCPYQb4fB0BosqlM7idu5BXzc4M2jsfW7v2AGV5kW/Y0UCAdSgc46GKzaEc1+VZovjTfX0z6HKHMkpuJq/XgTRULf5jlHSqwhSJInGE1ghiyi/K1dOnST5kjE/0rPIbHEddNJlF0n7th5y/h7/R9/y7RnNP6vq6d1x3vAlrOpEd1nx8a4L4KGUnCvpVkHBqxHYCV0PaBC/gb+9OoqHZm95jnuqKzPm1jcg+rvgM6LWdLpgULMuyButPkPW/a8tmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmcfxzyulXVXCpv10oeZGkiEi777erthOhewYE3HZ7U=;
 b=G982RrXl4P42fl2gR0Tzs8oWO7gSWv57cymptn7qOaGXPTcpVJCNpuLWo6C4MHs3O+ZR2NDbMexgW5jbGLQPQXo4EWXSrqI1AG0EBLASYJDDR8LNKHt69t8HzisHFPA88PpQ+79o0iUWQor1aYrQr7Jqq7Ig4qGaL2QKMOcAoKU=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:21 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:21 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 15/20] doc: Clean up profile unit table
Date: Fri, 26 Sep 2025 15:05:52 -0400
Message-Id: <20250926190557.8485-15-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0013.namprd10.prod.outlook.com
 (2603:10b6:a03:255::18) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eefd58d-cc3d-4f79-56bb-08ddfd2fc7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GloICRnz0Bthq2JCT3muatmcSJHwSDqMQ8jjsuefKevihpFnVzz2YfeCuqhZ?=
 =?us-ascii?Q?wA6OwlVAltaE8vmjzJ93ZL+GB+haF2W4gapWMNrqXDWbbm8w1Xup+xxZblc1?=
 =?us-ascii?Q?Z6wjgqMyogSoW7J+Cb+bpUbzA7oaeGnyq7GZ8B7HQN7OoofUbKS0AlXrNZhM?=
 =?us-ascii?Q?ZEU4owSD3RdqDOrn/0V5HxovODYXb+HjEzfWmHgZM5/QZwH//9QCaEiqArOJ?=
 =?us-ascii?Q?pFCZAXhAUOxamWtLEVa547VwT7SJFGxHIf0cnkeFGRbMOS254OGuosKXbpUu?=
 =?us-ascii?Q?b83S2otQtkB8fG71B/zAbF/fQC0B5CnQswWFsvRWx2cnSiz/NJ00xExC/3ZA?=
 =?us-ascii?Q?r49kcTu25tePNjs1XUpNXRP0I18lipGsz1LEz0M10GDj5XkZtUS0tb104gxk?=
 =?us-ascii?Q?EsyTjrxNzywWYBXqbEPrRaEZCnJ8RWYUZAAKalunFR4yQc0sppykD8oB/PO0?=
 =?us-ascii?Q?wXCyIBhlGa7/BucfkLJ7UPZ2XWDXGcvuOs5j8U5vjAV2aEyJ/fSQSWQV6dOf?=
 =?us-ascii?Q?N/tLuc2jsA27Cs5j5UztI3hzsWG10IFf8fgY7YtG1aofYKCA7iCPRo5rAMMe?=
 =?us-ascii?Q?G0uOYTsD5HOTlURc2tgYNA8cZ35b70vDp0BVz6TvyPfDub9XVRYeFOT6DwSO?=
 =?us-ascii?Q?QUbfIL36r06v65LoDppBj+syczPgdHZ8CMCmc3+EKWKp+7E9j5RmJOGfwaF2?=
 =?us-ascii?Q?MzhQ3jRNhJe8aFWcaXAGQuclvHVWo6snLMWoU5vpBdmtjcBVvHvX6p2pI4ju?=
 =?us-ascii?Q?eYDF3AqlwE74Qo4r4sCezac0nt8AvuqGYsTND6oArbBmB0Kprz9eSTBOEh9m?=
 =?us-ascii?Q?6Ft0G1UoTSLJGddK0WdVpeHSuRuTuuq6ogRvAzo81NGh30zQgfaiiUuQN/+O?=
 =?us-ascii?Q?DyUPArs2hChnW3v6+fptmgSo4QW5BskBehjEZ9XJ43AVc8JwXmwH4sf5KWZN?=
 =?us-ascii?Q?usPM4mtNcX1Lr1uZTrlA1/lVf6GRbrC1u67a1TaPmhrP9Xctb1vQGHjhgKuS?=
 =?us-ascii?Q?vjz/G1wVeNJj3+8cf4g8GrkzCq6oKR1niZudED3fr2C6qdicN+u2RW4CSPPb?=
 =?us-ascii?Q?ZkAd3JEdtXcYwq7ThOveIssC5UIOA01RNiE/lCgoCRE2s09nfAjcmi+UbPn1?=
 =?us-ascii?Q?qEJgmv0XWr6zisMiNSsw72CHesyEqE6Gi6Xh09otT9/KNsjtZIvkROIhenNo?=
 =?us-ascii?Q?IZrkB6T9JexB8o89ACaBepmlYuPCoWj8ieRewsyOjA+R1vAgAOH6Vlvpj+8S?=
 =?us-ascii?Q?FVl/iUgxvvVsjSruUX+sEvF1pe7r+sbdAWK8u2gxVKXh0rI0YJzxzhqU6wnQ?=
 =?us-ascii?Q?q0jXG6yE1I8ln4n7tN7xYOPswbNvu1NuU4i+fvS+4R9psrNoR1odkwNyXa3f?=
 =?us-ascii?Q?43qtn0vADn6LRwuXh7FbVSb8054d976aH6+J04NeEJ44T5NWK51hBPGqyRMc?=
 =?us-ascii?Q?e7N3X+KDBmS7xsHkXM7SWV7LEYzOlal8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sXYoQ2Y7YBNAn20gBl020A2R/F6f9WOd4F/zXNFp3oUAkmPV1nj1jF3E+M5p?=
 =?us-ascii?Q?byyV0Mjaf0QKOH//0UOu4TeG9Wb81Snv6YZ09yZ70AuDVUjFnpoS+k+m8JBS?=
 =?us-ascii?Q?tGSyld5RGTsJFzJxW1WIp4qHj/spkRoqOpmD9jiE5y7U840WYdoSDI55FzFB?=
 =?us-ascii?Q?dl+WImnbJyh/RFHdBjQCK53utjqsZ93+9BwN82ofTGcNI+CXaKQitDGa1hl/?=
 =?us-ascii?Q?9JMo4FSpjOcZyE7w1ijpbtFqvtN0SQsNbH4oujQj4OJ/q/E5ZOL+u0NwR1+4?=
 =?us-ascii?Q?hxV61gzTuaBbnQ6U7e3UVCnUVTPYGcc4Ufy8CSdDIF9LmTlVdsFZP1sEbmYs?=
 =?us-ascii?Q?W1bsxpcuuMPocJLnwsCeagCh2b36H2mFzUxE8OIU0/h2mxwO+k149qkcZG0g?=
 =?us-ascii?Q?WZCpFhDUXHgucMuHyVjVyLYtJ7uQwf/kJOP6PYfWEyQREmeRCgLrlt9RG2vz?=
 =?us-ascii?Q?wrANajXiUvU6OKTi3pFO+jl24ssNFHLKQCKsgC+/KVhvpZmfS2bXXwbcZDt9?=
 =?us-ascii?Q?gjGJWUIHHF0gYQu2X6ZbeKIEB36z558MTAt0DbdzbGJWgSDacjj7xaiiLjE9?=
 =?us-ascii?Q?3m3jKskh7Wam08DgdSSkbnyQ6sKA/HI00/kw68yyEn9Ha/7OVDG3kJ+57Pxb?=
 =?us-ascii?Q?L5gn0B1icGoUGN/r561vwZBnqyQWOSOtbKsWEqd0X0vYVClk8zWmUkygEBDZ?=
 =?us-ascii?Q?0Z3NPDQDUBNqjemB78nEGBUYuj/TULhBfdZmtsVfsMC8N/bIJ6yLJIcVrCxp?=
 =?us-ascii?Q?SGmT1pTg1EjEXHSWs58WDmHEYptOjX6GKUH1GXGHYuIdEOaGuAQmeenFhfzl?=
 =?us-ascii?Q?8v5bPsdQ2od1lG8BVo/lmOasvRN7JVdssET0Ov51nWzHHWOw1wtWlCrhfy4o?=
 =?us-ascii?Q?o7dGphdJsWE/BYuXWxINql24/TY0khFQEJ74wtLTozC2NEUqe09BCkD53cAS?=
 =?us-ascii?Q?jmF3m3u/Mvk31u8PvZI4aQYP/5MxwHNc2iduY5MJNEkvIQqj7XXTjr7ZkWMr?=
 =?us-ascii?Q?aLSadw27hxfV0xeRJImqdnmO2Lysl86cKZEMwcuLPcw2APEENsDgFJIxX2bo?=
 =?us-ascii?Q?Gl7+lcM4XApq3MM6VNnwIL0DuJ0PkyHZSdV/GqPaMOXXUj1oEjb6fWTHMeMd?=
 =?us-ascii?Q?Le9wyC5/AwXYI5cl0lHbEM2p5ypU+C9CiDmNMh0997QwtPbhSfAOSVskKrx2?=
 =?us-ascii?Q?01u1uUYjgWeyauumUrnAN8cRkYTgtLfjHCgy7esZfMdb3Fn4KIL0g2N7xSsh?=
 =?us-ascii?Q?J4s81V0r/xb/1ndsRytTYQ3WN45lcbwXUj8UTFCce9fAP29O8+HBWaXm/9Zi?=
 =?us-ascii?Q?p0gOJ8G9DuN+V/x6az+dazU2QooQjDeh/E4HUBNSMQLfNljIQg9QYAgkNbmb?=
 =?us-ascii?Q?I6HYHmIoEqvymGW7d/U9bNwwr/Xkm+XxgsCVosQVNwMfZgOEb/NBtEgXSuH+?=
 =?us-ascii?Q?ItKZsAH1cAcojbplY9EivxPHovREqIt/iOYTFiMjfq+imSaQcHTNnJ9k7BOZ?=
 =?us-ascii?Q?ca13Isq/UK2TAfDj1plxdtMFNn70ejMiYZHwebMtCOCJd0VsQhmC57A4eJrH?=
 =?us-ascii?Q?vUalXUrFZd6bXr8QNBDM5sMy/de0I2LwJmBk4u6I?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tNQw2Y+ArfrdL082t+8E/7nrUxcGjzpAJxcsw0xkyuVOnPNt8cKEeem/QGZjoGrKhnJF3f1EJqySO/rwiuGFpMxZ/Uot3LtVx4CiUcGCe0fBv/xX1I4AL2KcE/MlM9qVfQn4E+ZOFv0zJc6WMghsClceoXyLCWgL40c7GsZiFBwMabPIzA/XEi3fOBjs2drdNWGxDRQoUQp/lROI6XwK5E/ewj8Pn2ONrHJrgVfXBw5XE7Y1AukLXGaBL+J2K3/x5Dnppi03TGCDOKtdPKfVorVfj5bxPP5CaHTLdC29FEpbx0J2owXQI85PiOCw124tMPWi7B+uW0nQqAaVIxF9loymZDdbnZk1yLL38C/Rf1VtQ61oLeW5w+6MdBbktniMXCDILdicVzRy51e0KLM7ORGtWFsceVeKTdjf+4boQTAO1X8Kp6+9AkLNqdTlOjGynKnN8Lgcr97aLAJ00d4ZmL9LyEzLLpAJPBYppRKcvq4bNdwkOgLMKBEYyVbjU5LSiLvmXDOM6wLy9p/+8xBKVQuEtp6u81SJ2BcCV2qjzdHKP3jh8ZikPkfeZgy8PzSv3uHt/jLq1QsJbLpuVcI1rnfnzPBidH+RHx3zIhvppDc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eefd58d-cc3d-4f79-56bb-08ddfd2fc7fd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:21.8750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgEZVPOrf6n/JvuB2Y1QUALOsnF+b7ogHnKl4NvEfqF6CisLDyEYdwdc+iaOF8vePmoKtN1tV0ASsLxNRAQ8IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2509260172
X-Proofpoint-GUID: lm9zmyyov2WTLaQDLTGBMRqtgSUT4Tt1
X-Proofpoint-ORIG-GUID: lm9zmyyov2WTLaQDLTGBMRqtgSUT4Tt1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE3MCBTYWx0ZWRfX9t2GCBJHMOUV
 4bgkgUY09EvXyTMAWi//VhFhEdXI29CfpC6HplVyUvlIPPjx/HN9KSkjTshZ0NqAhb+H4SJL22k
 olUmPQp+7HsrNWVtnlN/xCGLcjcuuptxFGEV1A1a9OEiF+M8I/1UTVkDj9Kew4jbKMD/IrtUS4T
 nBP+LIxJ1E8A8ob3DFB2rhJ5p1ZGg2N5vo2hwrewwrv1lVR3QxCldCqPntlvYCCZzlJQG+mC/Ge
 e+T5lwRTbOygADba9sGpmz0yHyUP40RUK9aEcYnjVfChV2B20k9+JxwHVvbfS80vMA/SyYNoldZ
 /1jdDgXjc9e6QQ+Ft4D+4XfKBakJ7X1c9vg6n0UH8UuIJ1+6lpAVd/Y2zVwvu1DpCG3oPom+vhQ
 nG/Vg1/tT9lgAL+X7ctT+t/mJxZdm3LbosDVA44PZYhuQOkmAY8=
X-Authority-Analysis: v=2.4 cv=S/XUAYsP c=1 sm=1 tr=0 ts=68d6e431 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ya8n6P55ioffdQ_uoxoA:9
 a=ht3SdGwVgXH9XrWC:21 cc=ntf awl=host:12090

From: Eugene Loh <eugene.loh@oracle.com>

There are two references to "Table 1" (which is not otherwise
identified), along with links to an undefined ID.  Rework these
references.

While we're at it, convert the table from HTML to Markdown and break up
some longer lines, improving readability and maintainability of the
Markdown source file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 .../reference/dtrace_providers_profile.md     | 95 ++++---------------
 1 file changed, 20 insertions(+), 75 deletions(-)

diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
index 94a308984..1ee7fd6aa 100644
--- a/doc/userguide/reference/dtrace_providers_profile.md
+++ b/doc/userguide/reference/dtrace_providers_profile.md
@@ -11,86 +11,31 @@ Such probes aren't associated with any particular point of execution, but rather
 
 The `profile-*n*` probes fire at a fixed interval, at a high-interrupt level on all active CPUs.
 
-The units of *n* default to a frequency that's expressed as a rate of firing per second, but the value can also have an optional suffix , as shown in [Table 1](dtrace_providers_profile.md#dt_t1_prov), which specifies either a time interval or a frequency. The following table describes valid time suffixes for a `tick-` *n* probe.
+The units of *n* default to a frequency that's expressed as a rate of firing per second,
+but the value can also have an optional suffix, as shown in the following table,
+which specifies either a time interval or a frequency.
+The following table describes valid time suffixes for a `tick-` *n* probe.
+
+| Suffix         | Time Units                                       |
+| :---           | :---                                             |
+| `nsec` or `ns` | nanoseconds                                      |
+| `usec` or `us` | microseconds                                     |
+| `msec` or `ms` | milliseconds                                     |
+| `sec` or `s`   | seconds                                          |
+| `min` or `m`   | minutes                                          |
+| `hour` or `h`  | hours                                            |
+| `day` or `d`   | days                                             |
+| `hz`           | hertz \(frequency expressed as rate per second\) |
 
-<table><thead><tr><th>
-
-Suffix
-
-</th><th>
-
-Time Units
-
-</th></tr></thead><tbody><tr><td>
-
-`nsec` or `ns`
-
-</td><td>
-
-nanoseconds
-
-</td></tr><tr><td>
-
-`usec` or `us`
-
-</td><td>
-
-microseconds
-
-</td></tr><tr><td>
-
-`msec` or `ms`
-
-</td><td>
-
-milliseconds
-
-</td></tr><tr><td>
-
-`sec` or `s`
-
-</td><td>
-
-seconds
-
-</td></tr><tr><td>
-
-`min` or `m`
-
-</td><td>
-
-minutes
-
-</td></tr><tr><td>
-
-`hour` or `h`
-
-</td><td>
-
-hours
-
-</td></tr><tr><td>
-
-`day` or `d`
-
-</td><td>
-
-days
-
-</td></tr><tr><td>
-
-`hz`
-
-</td><td>
-
-hertz \(frequency expressed as rate per second\)
-
-</td></tr><tbody></table>
 ## tick-*n* Probes
 
 The `tick-*n*` probes fire at fixed intervals, at a high interrupt level on only one CPU per interval.
 
-Unlike `profile-*n*` probes, which fire on every CPU, `tick-*n*` probes fire on only one CPU per interval and the CPU on which they fire can change over time. The units of *n* default to a frequency expressed as a rate of firing per second, but the value can also have an optional time suffix as shown in [Table 1](dtrace_providers_profile.md#dt_t1_prov), which specifies either a time interval or a frequency.
+Unlike `profile-*n*` probes, which fire on every CPU,
+`tick-*n*` probes fire on only one CPU per interval and the CPU on which they fire can change over time.
+The units of *n* default to a frequency expressed as a rate of firing per second,
+but the value can also have an optional time suffix as shown in the earlier table,
+which specifies either a time interval or a frequency.
 
 The `tick-*n*` probes have several uses, such as providing some periodic output or taking a periodic action.
 
-- 
2.47.3

