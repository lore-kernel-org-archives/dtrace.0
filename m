Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEA221B9CD
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276909; cv=fail; b=gYW0DXNO6m0RFhUryqEUmsK+FWKmVZ9KYFBQ//WNCRO0qPVgoCU5N2j9pdp+SwzRWpCSTBTJfTr1daKBhpolISF3u1ULJ1cQ2lPR2FseEkUidHKqi768NDqT271FeaMjRSuwH+JcUF/Kw4Ta9IugTgHxICBtEpR4ejt6rRq/UdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276909; c=relaxed/simple;
	bh=f/kIok+DWR21mjK5S4X2xLJYKbQW3yv5kwWH1RVDWTw=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=SQ+Eugc3BVqqEAg0+H7zXMD8XUxpBxR76bcO3c7ak9hBwSPpLuqsa+J3inQx18voX248hGTnFGYjo9giNSieXBVo8nM2dYBqE6GkXfiD8rj6pZmu88TcNJ2MntBE9HK718wVUcZQF7jOzE18yavHN0cHDuM9h3KzoAU4hQevqWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EJUE/bPs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xfTZrIGz; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EJUE/bPs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xfTZrIGz"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55750S7w020244
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ZuUTA4Ok5V4Rj2dhTVJ3yGGf4Kbns/Et3aK+R8eoeLE=; b=
	EJUE/bPsXXt+D5j+/hx7N9198JDTdRnxoKdhHMHZFaTYze+VzQ522/kRe+7v6rei
	k8BkVCSqqkIXZWUlp0m9WdJ9DQZtugiZUGAdLuDiTSQDFMS5Z7ENUbmhpK2RA5QB
	WaCuaAtFQeJViOUA++8FRBssixe/2xs/9whR8p1f8dkhaApsYQIHpYpM+xUSrMK1
	BBUPRFwJ5rCAUSHMkoqjIws+SohUjs4LZkWsr8X8hvSUMAOCxK2yJynWFLNuPABO
	wjlbSPbhU3m8iUIIa1fabsIs/p5hZymvoxDLbU2IXcrul8Pv4KSs818f4vQ20hG4
	jW5hy9N6PENm9lJgzgWMkA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe8318-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571Y5pC020395
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:02 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc404e-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cv/oM3KR0otMMVmQEUSSFXYh1ho8cnGD5m9VN/+4aB86qah3xXeMBGLW/p6xtzF1djZ+ANLNUscv+j279TJBMEGIzwi53C0hnITO2uaMYET+nVez2cIn+NEMyRX3EHEvpwYTyzLuK0YE5vlmh49LoHQFBrHPTAPn7DOgsa0RkZQLHrSUqAxPvxrj1yLbCq2I9kO5+zQHdt5KXg4CvhCD30UXXn93e7c3HoHLmbCKRl8AqE15rriyLkt6o0xv5MCt5WukwPulUFwtHRAoFQEFYi3OMCmyCKelF0dM+YKS/NpacW9Nymds3eO+LEB5wDRhAruNXj6+kuk0hJ/Ks6mouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuUTA4Ok5V4Rj2dhTVJ3yGGf4Kbns/Et3aK+R8eoeLE=;
 b=rhh6U2CloQevvscfeVVZQlmxSjuithDQigadmDDm4xFvm6SV7EdWj2+0KABEtA8ujwQDmbsEufgyy9ksbmOrgkgH+yZ03/7u1jKtBI45AqpmWo29Vzc1mBZoyM0gOr7+xkL5XORlhR90h15Qoql+9Bkfc1hvNg2gwAcBI1AIZOz/GdSWTXFOxUTtVK7vgvsnO/pqzNM57RrUIpK0qMuu1MevROOYbSiITzntqdd3MYQfAmrpxCPJj4W2/rLN/kKoAjAdNJ8L9fp4O0ScoxgG4MPl3l2QMGr9N+ClL9QtAfo0jlIZ6ppvHXgS7QuU/DmSdpzzw6mb7MmwtO50OzpZqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuUTA4Ok5V4Rj2dhTVJ3yGGf4Kbns/Et3aK+R8eoeLE=;
 b=xfTZrIGz88MB4v5xhGUBBk42gC6EU1TypJP4+dmaymm3Nm8bi3KpILsJR61f/9tGHlb7FpGSGt13A781TNog4gk0UIUvDM8NfwLyEte3Cbm4ddl4q9HHDfdl0LT0aeeoADdPcUYx3oMjNeAJzM3n638G0dGOrAXyeGfQBgCUcTo=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:14:59 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:14:59 +0000
Date: Sat, 07 Jun 2025 02:14:58 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/17] dof_parser: remove pointless comment
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:36e::28) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83747DBE957EB529688A0E3AC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: f87acbee-53e6-4894-d7ec-08dda58aa1d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iIKX6sihfNXPp04yUNZ4ZGlgbsbVjzhKso6/8PhLWQzGcueA7JRFgjv5h9zG?=
 =?us-ascii?Q?xFnpji1fBC1rk2NWPTQYP9xDOwBICVXLkyMF+MTBFLPVuPX6rGW1K/t/0+E9?=
 =?us-ascii?Q?KaTZcz1qZVciRM7X201WdrIgQnsPm4Gh8eW81Xnrgch0twi76yA7m8n7hoal?=
 =?us-ascii?Q?c+29HTDxVt044EpWIyiW3hbF7XfTZcBfJ2DFvF21BmzoQOljCZIjAMOIJD5Y?=
 =?us-ascii?Q?srhTBVDCFIVeKm/6pg2keIgQsdwLDDxYEdPLXMeQCe6okw0wEhP+ydvzHRcW?=
 =?us-ascii?Q?6GjErwlrDfvwe5whptrEbmyZygmRAa1rrXUalod/jH/HgTJzzXpmb1A7K+JI?=
 =?us-ascii?Q?Qy/mHpDwJQEt+tgX5wcdyUinj7dYD4br1tKyCw3pbCpEdSB5LCmBuZt1BkoB?=
 =?us-ascii?Q?PGWm1A7/EyECNdMWOanaNSMYv1n/7e9nCkWDoO3WMM0CUMldyOmJaln/ZkcH?=
 =?us-ascii?Q?4tqRMUZeGyaJLyBadBsCOKmYkuRyhoRm0hNnqeXnhHNuIqBSckyY56zBgzVw?=
 =?us-ascii?Q?KwJlecnSIr7mY0uAlbj3AkGTHFmaMdsFitVVFy8rFtXLKz/xZMhx+5OQ9qZX?=
 =?us-ascii?Q?QIb21aPK+hDdwYEHNgu1BgMysMsuWZIjeks/tQehebYbCfXL9A8JZ3IUhDV3?=
 =?us-ascii?Q?oN1MEZjFX8KO2L3DE8S931DYhvP8phVYJ03Co4LJ0j+qPXEUYjSCZpAuHsXv?=
 =?us-ascii?Q?sUA8Hp5QC/Mh3XOb9enbbUcggXKXTF1PyKVVmDlObN253ek966AS3K6EHtYy?=
 =?us-ascii?Q?UE/jRsIKQ5CLo7p79Wv/31q51ZOpuUmBoINrmUzAkOKhcsvY9QSGNI2cFiw+?=
 =?us-ascii?Q?821qTA7Gz1/IvISKfU5eg+xRyFvoDpazNFIPaC+gCqGANoum2c3JKWYGBLRI?=
 =?us-ascii?Q?Rpw9LLmgl9LjRnUpC7DX/kxULt4Q6+lDOmIlykfBCeDIyl9j09MMZW5qKvVD?=
 =?us-ascii?Q?ZPXXuQqsQQ5PLPl3Ea2ZY1B9oJp0YJ4Rgyffkbns7bUKd9maKNoaj7oyBWpZ?=
 =?us-ascii?Q?IItqZrjcEtDJlN0CxyCbdbb5x+68Hi9DMFoaVd8529rjcsft0tWbi12xkeY5?=
 =?us-ascii?Q?UENrZBlgdntk9alXeb9Ttkyj57aXpendfgp0jrekNVgJifViBXt0HmPhzjX0?=
 =?us-ascii?Q?ris6ef25/RSH8l9wkoeJnZWtV6/cqoEibnHvftYw9wpqNgO5dKr2Ml8vMl1f?=
 =?us-ascii?Q?agHY03KjyZSzk/9m+8Jrdy5ft4vYXslYlHB9XtJEilHdyPD3YFEUL9YgbYlx?=
 =?us-ascii?Q?ZsA3bwsAXjGJ7FaOHdHhO5o3qtdi+y8/On8Fu3nXVLsLiDG5NmnoHNtn0oJH?=
 =?us-ascii?Q?Zwle9R0l9Qtv7dJbG5JJuoI9L19ObktguRU0dvoldpxWvPmEb1gaW0ziX3fv?=
 =?us-ascii?Q?NQ0CyMidcX4j4XMlIY/p9JykaaYDileAkd73HU8njiHDHs68QAEebFB9JzmE?=
 =?us-ascii?Q?7M6s8pX2zx8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9j53w0Bz+z/wwt2sgp+AnkgzFdR0VFqZ7F/RgQ3Tg/bZ+3Y28JBmI9IlAtZ3?=
 =?us-ascii?Q?1rTgelGvFehDQyHAb9KVilT2bfHi5896BEjvXA+KYtCOF1r5KP+L8jW35Ttm?=
 =?us-ascii?Q?gc5P/DeTM00qV4nWJUDW+Ec1rrsNjldUSMS0/IUuxty+ptFAWTv7aoYDbpkJ?=
 =?us-ascii?Q?MyYb13963ELCJjJuDXn6WyZ/+SUV5Y8i80HYM4YA8W5cCUcf4tm4aFyIlhSy?=
 =?us-ascii?Q?J2o4IXKzb//oD2KNg7GlP00VciZ78NOaVPP3oBcc0XQLbLhuNZw8WURTL1yC?=
 =?us-ascii?Q?ZTdBxTGdXMzu6e5tMF1HOg8CTafINhDOFQwUNGXANJZcWq4K4tLnFc2Q5Ak3?=
 =?us-ascii?Q?oFWfxZqo3Tx1RYhmEwL9fKUjLQqoVuiTCCfc5JOMB69hXRryuZsABB9ck+NN?=
 =?us-ascii?Q?mNv0tT4G5oR4DRAIBz1BLINDyGXHCPyAwshFEECrUpBsqAsXE2fOuB5F6YPW?=
 =?us-ascii?Q?Fy1mBTIBubE1kRmNir52PdxPBOq51NOtB+4iiIQONm6Uyo734JGZuXHoW8Pp?=
 =?us-ascii?Q?eVbuDrw3JK2aPgXevMEZp4SnddRoreAH2XITwE7OTs028aK6HZ+uRqfxHx/7?=
 =?us-ascii?Q?Q6Od/FwZui6ElhovJH8oQIim+0xImbMDEVZF1YrY932/ZDFpZBOEcJBR/gI+?=
 =?us-ascii?Q?sZiMgdKrzw8p/R8L2E477j/qo+lzOEzS3VcS2KXwVj41QTbJMUWoP1hfIkvd?=
 =?us-ascii?Q?vEy77eO9zQlppqGRg7IZs37E0Qw15yNFgir8syFXl1ZE4XQGKaAt2fDjOaWz?=
 =?us-ascii?Q?EKpVFWvXhtt8NbBY5peHb0J4CR5vnKHzEq3wbctRlk7Jt0cMePfuOuRRHjvV?=
 =?us-ascii?Q?nDj1F9OfQbwAOFe9NCXauQaAaEL9hqArcGlrySQy+YmS3Lnioh4fD35cXm8k?=
 =?us-ascii?Q?yiSseUbv4mjGwdcN/N8YndT7hOLqWTH6RCfuMV9W2H4VtdqqYXi0UnqR07Fe?=
 =?us-ascii?Q?UBnxJtRCkTtxOc4HyXMcMFc+Igs7F47Q96wySmSUJDoGdmyRg8pEP/LR1eJO?=
 =?us-ascii?Q?G0fZT4NCmucc6xlzd4moZ8HRXk7kAuZ+IsUWB8IL1S23HBHoh3zGKEg+oGNJ?=
 =?us-ascii?Q?fMuzPp9OogjiHmmHqmBfc1ougLcvl1FFiH1d0yarntcB9qWbsYYSqI83QeBD?=
 =?us-ascii?Q?RbLnfSVU6d+mVhhHioKBdd87tmcDWckR3JeBU01ldIlyoKnaVrm3nfRmzprN?=
 =?us-ascii?Q?a3I84lRoWA9rL5kDJISYbQ1sg1V4vJyhV6bb0TbvTDe9yj+BwOmznm/QDjqT?=
 =?us-ascii?Q?MVpW2tN2I9n1FhNz3C1cOyyTnkmsYABDf5S3D7V/lWJm52rV5IY2DIJE3LZ6?=
 =?us-ascii?Q?eJB1GV5DGdszHtId6/+hrYwxpyli5lmOQgf1y22oOyaoBrSg0zYpzySSXiuL?=
 =?us-ascii?Q?7E73Fcl2rCUrChoFfvVNPw+f8hgHo0gOzAhANp2KeSEmjNTpEQZ6hfxRrpl8?=
 =?us-ascii?Q?aTC38hCDOAlxeEqxg69TOABYLzr1CfEQN3R0lvui3rAYcIZI6sDqyUHdX94E?=
 =?us-ascii?Q?SongDTa8IxHYmm/UniOonJTwl69dQRtkfWTYtbyli2QXr9bPRTs3et5ghM6k?=
 =?us-ascii?Q?z3PBp2xFfVZtohoZGuj4aUjZX84VRPyfBtRJz0BRWCFcFC98D/aOC1gMdNbD?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wEHoJMo3OlYA3j9mQkajqSPAP7CB4W8mCosTka8eRgeNuqE1OmjaFdIwg0phwlNB/FqbKh9nxDwyp4XsUXKSvCuC57TZ05PzRAe8b/r2+Ja2IBnrPbyEt0EQAkgpwiQkn0e8yGMI6VJPGLB79mdpjDWq0CJeUyN9h7u9b1C8Za0ZMFsS2xv70t9TYJvKZ5JvOtGSZQrc8Y7B7zNVi6i/n9Rt25fx0Sq2XjfYGi/wXQAwqVVlxqpTD753/5GaQvmsn3MB3JEM7XChT3192bQst24T1n78Vdrm4UbphsRR/2A2hebvK1p7NfhbZIhIIbach6ziMNWG83d2GX29UM/I8w0mHURTuetKlNjC6lqD+RUXDPqnvct5kcG634/rKzrBGt/OiRdZaMrvg3PpwqTu2JzKDCgmxqDGjTyptN6HZN/yYWS9BiPqWAGLxC7s3e4lPxdKYx55hQv7d0LMiYEwEInnlQG/cuX/1i4Wvf1F1TTG2v/2IdanLdOyA1dvbL+QwLcY+80p83W+dBDse+ekZfEhvcusStvut97tLNLSpEGT0JG96hgkfY5MxSSJC16bYAr7yd1ChKFRUJoFHihtxYc9bStx+izYtwobbbAQ4gs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f87acbee-53e6-4894-d7ec-08dda58aa1d9
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:14:59.6783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ioA/pWYeeA3YICUe9ybhAe9/9lwsj4cNkVpHqq5A7x2TeBjulvpF62tzdDxsq7cJhwHzG4a5w8ckUn6HZoTpVjKAMGvf6HwohaeWZ4OBzcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=874
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-GUID: Xj5QA-iAKe8f1w8KuipKS1_ewr0JY1pE
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6843d8e7 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=sJy_p6EAAy1-R_Z2HcgA:9 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: Xj5QA-iAKe8f1w8KuipKS1_ewr0JY1pE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfXxqWBBiUh8RP7 vnwSWOuXiZ2z3Xeb/S0rThMFyfVXYac8pcb9ZATi56F8258Yq/2rkCTfk4cGrQo2Uk3EKZ2F4ev JCM1uca23osFNO7F51h5Bs/11Xmn3f4WbA+zGovd8ykle8ENeEH/0cDXpHURnKK/b8YOC8M3uQr
 l4iKBJ64gppt5TlYBoGZnDy9gKQEPLrtSqrZArfDOgQU10LPnYRuS/4I8pgsulZYCDvy9i86I6h T6qsplTv3G3HetnLsSFhCE6X3a4RmeQVMNVVR+9+5N7oIUfephnaHUjOKAWoVjVevdaAZtGpuna 4+TymNuPMEfYifJlu3H4tvpQjJvqMjHBfc+jWbOOq8ND1ZND4mXlsfN7VEjiEQOEkquwlsVBI2c
 CDLMipRVlEkAD46cA7EHswBNoiKKSV5pa+V+k+LOdkcgKB5GkNgRQAXGqe2OwaEDJweHjAxT

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
---
 libcommon/dof_parser.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/libcommon/dof_parser.c b/libcommon/dof_parser.c
index 5b3dde36..58bbd604 100644
--- a/libcommon/dof_parser.c
+++ b/libcommon/dof_parser.c
@@ -89,9 +89,6 @@ dof_copyin_helper(int in, int out, int *ok)
 	dof_helper_t *dh;
 	size_t i;
 
-	/*
-	 * First get the header, which gives the size of everything else.
-	 */
 	dh = malloc(sizeof(dof_helper_t));
 	if (!dh)
 		abort();
-- 
2.45.2

