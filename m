Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389105;
	b=RQCVr66KN6BM5L5yEcEvACuulJhQf4HNaWH97A4Z6lA3q8U9GGGzOYwwCb7Y+R75k/4i
	 JMgWtyavOGGRsB3WiYKym0PjwOY8o12Z6zUmRJmfciGA8+Gz7UvxdpeK4m3axLHtG7Wzr
	 Miutlb2qfmFAxojRzQY/EB5CINo0rPi9BXZCoCvD7/otxO1Ve9XDlgDhH3ZSncSnx7a0E
	 ZOfUt8K2oPemZumNQ2frgSTCuc4dS2Fy88vTAX37MncC3YVCzKc2XdxiZNH5W1ET/0ckf
	 /CrsPlDcICAhKfdBOU65tuP+FO0l6qT/3a+TeSVNq5vwb+2QUvKeiBgYKsRMtVpoGCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Subject:
	 Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID;
	bh=V+BbOG89fmO551AtkOx8RIb210ZFzEafAwj4DXoAePs=;
	b=ic/emFZ0z4yXG/aFDH/h4nvlv1myi1ua/sRSeujmXZeR4jPZe2PnXpSflsiq2/zay6W6
	 sru8EMKC/qSRUDi0qOiFrzo4FYhrrItB1m3jt+NxENoV+utVGDDSB6djka7+PRoI42Gq1
	 5SE/T5k9+5NsQ0Hnu9ng3AyMVNzeYDlAeVgdrLp5890LErp0cADzITC6FD8iBsGCyozbT
	 m9CiIrK02aWzrAjoqqmpfW+e7Ecri8X8izOsH9/18doHAHd6Aiiyo5/FW6qjXlYjaRmZ8
	 qxzS/SEu8sHyye1o2351DoBSD3ieyEPaTodHowqGXqZBrOkoXOkTf8SKGgyuwBqSqfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=gi+BuHAm;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xi485Mps;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D0606A31C
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=gi+BuHAm;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=xi485Mps
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEXTeO437437
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=V+BbOG89fmO551AtkOx8RIb210ZFzEafAwj4DXoAePs=; b=
	gi+BuHAmTNZu46G1RqqThG2/vBSaQijBa+ZJOgUoxALkWJnUC420kF3IhmBXVSkN
	F9U3BHVBhU/5qP+XmE+9vhMyRk8ObWBXvtIhKQs+FSfBDDh4XIwhHgXBzfj3EpOY
	F0ZXAXn5DDKh2B0U7UWlMjpl0147fOgBep4pkgajkv5VAm/oAQdiUA4QgUJmxkmp
	VEYihH3V3jzwxDIYUdirKekEpYJgKWEXpNi5QWbNAfz9v08X+JyF6+isUZ1nzbDy
	+UYKPrkzI3rwa8osGVTX3r/1gNyzWzyz5HPPo15QAsMRddjAir9rskRqjkuEsYaD
	TI1vtNPH2Sj3QtLIqH+kBQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5p1dr3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHvqRq2444435
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:23 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hmxs4x43a-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KNGKInRz7mpXPmX8W8pzDeOUtEZf67SajsuovhpggQorx+/QCxmgZrSNMhssmDJJ1OQOTL+EUrR3DMz0qsFUb2Qh4f4cY42ylGd0GIhAqVh5c/5koJ7iPJfyZcf1Il7MPmdPe7sORJNzzQLiQj/4zL9Fg9HVYQmUexZAR5BVg/f3R2YNtiwlh0i0bG+07yeqn/hqcLybZl3pT+NJtc5ajk1UqToihEzvslIlA8mlkzdVos/Lxuy1oVHaF26uNnSpA9/0iu5VYpDNffgpJOsJ45XXVnewbpiFqAuypmU+ON/rz3v5X5SSw+S5tKHkZUxZ7XFE7JvieXeYV9HM49MsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+BbOG89fmO551AtkOx8RIb210ZFzEafAwj4DXoAePs=;
 b=zFtHC98m1A7syuff9bFQUv++vV934C0R/tUR7N4hUBr86Yk4hdF0kFZMqfCOtMWr8jg0SYEsP/QcA54Zt+sB5ZvpZyBmVJCADOhWVDQPw7nng7ydwcst2JaVVYYKkENH2awHifLYWziQZxPGros2DKk1ZGHFB4k/QkVbJ6FxPsLEpCH8aqVNN3hdMvoXL0Vyjfhmb6aAxml7jGOhb/mRBLjdGf6cRYjylPcPaAgBYnXePAXwv8Q0pPFwglfWkSh2+B5rDVibRJhTZrTrOSy4CD0ScBuLXAJSwVJI9LKXCEPNSS+uyfDtz/XBjhgRDNBArsg3ipVIAZ9e8IKlBawFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+BbOG89fmO551AtkOx8RIb210ZFzEafAwj4DXoAePs=;
 b=xi485MpsiAZ0DmG8tdXOYm3EmV/vH/k71rO/BkjvINReFp78w2iwX9PKi6ULdRm0D6q1IuHuP3e1KqHkBEKiBkN5rIfPp6UzgsN+nMwtXxHJAVbBjfxxoc65FyaBM6ASmX3utAwhnlFF7CozFFkDg05od+Fp2VgIcLZCHxzRi4Y=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by IA4PR10MB8495.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:20 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:18 +0000
Date: Fri, 30 Oct 2026 19:36:43 +0000
Message-ID: <bf45a777b3fc14c2223d21c81a84fd13@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 09/20] libdtrace: streamline kernel symbol parsing and module
 lookup
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0011.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::22) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Post: <mailto:dtrace@lists.linux.dev>
List-Help: <mailto:dtrace+help@lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
List-Owner: <mailto:dtrace+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|IA4PR10MB8495:EE_
X-MS-PublicTrafficType: Email
client-request-id: 540bfa66-2151-4fcf-ae05-60c861b5c4fc
request-id: a6c99850-3c2c-4978-01e1-08df36bd591f
X-MS-Office365-Filtering-Correlation-Id: a6c99850-3c2c-4978-01e1-08df36bd591f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261026135527099003|261022075727099003|261026140227099003|261021123027099003|261026130827099003|261021135927099003|261009223027099003|261021130227099003|261022113327099003|261022105027099003|261021133027099003|261022115727099003|261021121427099003|56012099006|261028144727099003|10067099003|18002099003|261026121527099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WLaEgbDAkNa9/RH6LBRK3caKdABm0Sp28M2DvEoPa1OkuPbDN5z4o9jPSKcCbIvZW397gcKaUuNpDJNswxl0JnLppOIQgvcYUgmn98hzNVVCs0hGcftJnCaRw0mw6Nh0DESZnyUtXFCGPhCEs/Pp9DIbJlmqScBiSSb2l8bo73Jyf6t75441/6F/TXIDuFie5id+U+PCtrxmsq6K4mrLE/56IZ6qkGCiM9ae60GMlYpjTmu58r1H/3lbuupKu7m1BZ/QjcWFDeCLobYKjCnkeaKISC5beNhUT84m4zuYHkx/OAWkyZUfoPvIT/34ElPxnoRGa6yN63ANzyKBoLWTMawaBeZnagt7625ARAnzpDh4E1U4LEP6g8sCLCtlOfJq1X9YZ7VJ1HDlwuX1V4G12s7OL/vc1V2oZXXS06poP6bIS3QiO7y6vh6kWdbFB5U5Zy0d5xbfpvIV6oGbCW/8iIAaJw97cj0qxQIULz0hU5kwNPfEq8rgHg8S6Upm5dheTuFsq0m54/pRNxtrFgRZdJKK5uQEPWrwjXxTZyXhvuE/6dR1/ATJYXXMtqHuFzt8KDYie5gIvSg3VTWmaFg6IKEfm/VHw8m/1qXVW1oSmeAziJIaXINTRkG6oiSDPCPTb1wKNskBiqTppmiRW7ZSH5Genf3E2QMexqU2o0S0J2U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261026135527099003)(261022075727099003)(261026140227099003)(261021123027099003)(261026130827099003)(261021135927099003)(261009223027099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021133027099003)(261022115727099003)(261021121427099003)(56012099006)(261028144727099003)(10067099003)(18002099003)(261026121527099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0Met99bC6HjZUx3B0Z3KrC78ih+YSpnv8t1UU2wTL1Q+90rPo3F/qe3fo9F?=
 =?us-ascii?Q?Eh9cAfZ5i2s575c69dUdUd4unRNDqDZ8KI96ZgF67HtSig5vBh5h/y9SYFd7?=
 =?us-ascii?Q?zQcef/3WyEg+DdTYhR9r8GrkYjt2BXMG7r6iP4ryVUfWiFbb/G5ASe+LTR5z?=
 =?us-ascii?Q?ym9uzEK8sBXdyBqJHPDn7dowcq31povmDRDORlDFbIiXYwGvzxDCgfjsxIvE?=
 =?us-ascii?Q?rvGmTXessNcA+H4koFtrucjGbz1fhKLg9hgVfR6WyOemBEjq4Gekw0jvpdRu?=
 =?us-ascii?Q?AVdZ1Mcwiun5X+b4Z8K/F3EW3dr063VMi7Ox6ggO9KGCKyuLbQPkfu2HULzJ?=
 =?us-ascii?Q?umecoYRJ1FunW9vEs/5nThR5XLVXt65RLBUYOT0saTD9Iep1VOkTPD2A2kDR?=
 =?us-ascii?Q?fMTCy7dReFDk1bF+zN0vAbZm+H24uXG6oOUqnHGafF05iQNYibab7InEvDZy?=
 =?us-ascii?Q?BGDiUh3HVwmxF1xLPs7cXTHBE+XKw4xnmUCKuLLq3ZUE8K1t2k10PnWBcxOT?=
 =?us-ascii?Q?6UiJbTe5C9u+tBnAJIoSMg9blsjloX3IZ+BKXd/anSLvKx1sVOdEDoKJqC6r?=
 =?us-ascii?Q?iHbuGqBe5bV2QJiNLVG0xSO61jYyL+OXVvHoBYZ0F1XftCur1jb9+0WBRHX9?=
 =?us-ascii?Q?nVKcOfI7GbLGYQdULmoVeLfZJaWzr5mwGe+Q5q/bbrI9G+eHgwE3Unphrqq+?=
 =?us-ascii?Q?qdHmozbFaEoxE5B0LprurezKMVD5hQ4SyrwEyuHlwiA0J5+TFsAfEgF7iO1k?=
 =?us-ascii?Q?EiPophjzqlahGpoMAG3DY6b7qmhoP8d7hTdHt3zqiJ5xl5nl5kLYLGB3QaA5?=
 =?us-ascii?Q?2LMr+rlw6WA2phcZRaWbET8diAO1lO6vZEdnWO3Hisiyfv1M/ad/YI7yEIME?=
 =?us-ascii?Q?4YH/jkSj6Pa/73wns6gImN7qEDQiJE5ADnwi6sDra9atQd9WKbKcXv823bF3?=
 =?us-ascii?Q?qGFhqhPhjF6eCGymJwDkiGNgiGruRyRIdzM5iae8p/zpjSmArUxSawEAyJIP?=
 =?us-ascii?Q?yndtGt9fGEZU7yNwDg6VJ9O9Lf6G38GTNPuHdQ9rdb3Su69K0rRmGsSthCDl?=
 =?us-ascii?Q?sPvzdaZWcVp6KV6sO4vZc45YekZBUfPOiLeppDhCThUhbZWS2CVQb2oPv+j5?=
 =?us-ascii?Q?lCxq41J8f4NxIIfrz1FXQhRIYa2A2CAtx15Nhx34aLC8zsJVLFdl65zdjy4d?=
 =?us-ascii?Q?k0+bxv3p6GfNiXre4P7kqv66Gg9eeBZRb4bi01XwqNeIq6lZX9JRLZ0g9SHm?=
 =?us-ascii?Q?HGVxl+mLnm0ibphfeVsjhmjvoF+1PfVQxuNN79HKoE714FhyD/ZKE520vfU2?=
 =?us-ascii?Q?WW5zALtbwu6c/5Q7ZJJH0o6x/WuCqu1w61mZV1oWhi04Equ/qqYdzZf4AtEa?=
 =?us-ascii?Q?SX9XARXisf8aoTU4Gn48ne8h0S8xIXq4xVe0RvNNOupNprqX0q2ILIScZLXl?=
 =?us-ascii?Q?zmLvEy701BWHWhW0GZhS0iAlz+ue+FEsNVuYYeK7xLccJavZxeJuJiiJMltN?=
 =?us-ascii?Q?d4dDivsI3bQ4FIKrlaZUJKrTho5yriVr/by776/U+JpERuFXkagXG/6BVXDG?=
 =?us-ascii?Q?xkVITOduiUus1T4mEdf1MDaGNkxYR6XlP1sE0nGGoNtGWF09G+oB+RNREQ2B?=
 =?us-ascii?Q?kiCyqMyVTJZMxBsTR6biabyLbYvwpDJRfbnJm4jFn8CnmOPdlw5MYKoGOBlJ?=
 =?us-ascii?Q?OU/j67zeE+tLzPIOKsuSArI+HTvvP04W29YgsK1IzZk7Adq4XhUooBlZ1yIi?=
 =?us-ascii?Q?IYqhlDwLE0aiao6RCHzHmhay/tD8A14=3D?=
X-Exchange-RoutingPolicyChecked:
	Kr9bBFztl51BUCkmr2jh1lQImAci7VSc0YbVXJEPcBK2ZK6/9c4jsLtS6Igd3n5su1gKZJyXM8WyHs/LQNNvt5pv2nXw4m6ySFR7fKUokfTXtlz20UeD/8v8XuXscI6XLWe6cdsJGWiKCbh1yx7JQ4Eug/bEVkp6JVNLddLCa8uGirgqUfdo6hs5ztFtfJNe1gaNETVwL45SS+kTdIslgMWUVhq1Fwffo3X4aMKgY8AY5CuHR7pa9FaRwfZ8VdxWK6nUAK533Na2HAOWQTKzf4dpxxSfRHUr6onh3F13S3CTwaohZ8QlOq0djkYPTDFwnkMJjq5jfhtKzacDVah+QA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OaWm9/hrhG6ymzDZYB15Jt60vGnEX+OoBePq3dlvsLKXA1CFc3zav75JOLwMey4BTkVb+f2twa1nIyXUffq7SqZ3u2uyxW4J7uqNmlM1uBfSGlmpwz6WO6VZ+b0yICs/Zbwr2Hwxij5d9iAlE35TF9FKl/Fh9vL7Kb4sZHwdfSAh+Ws/cLbMFVrqg+fjA/HouEVKHhEPw26bn+nqMI8mgPK5n/X6IkReB4bp9wOQYnJ1oNfz3wqPFsN9tU7pffXeI2nV+actos7EFumtY0Yxx888jZqkpkYw07hNwoRbfM8dkml8I06XRtNOUnXmUJeeIi39CVYfBgpw5xRfYsokEeJBhaa8E35y0JPnIWXi5J02OoQOpOcinpYYBxATwAgmw2Fe2bZcvzRDRLecf53nI9HJ3VubgZ88z/Htmp34VomGchXa9PDSCJzM6iO98qIaSum/7uFyJNo1GR1ckdkkp3siXDMuuxenZcFjYos9bGNxv1pzm0YkwsMdm4X76OiHrFrLe3oIsanDwiIxVepzmEFk1ZQHb/X1zZKiioAA1BcLjCkMdIgrLNa6a9J7MwGlrRiG+XFaPCxkEt7ObH2AJfpcunGOo7oa/gMga6YIukY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c99850-3c2c-4978-01e1-08df36bd591f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:18.2646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92FDtqs7Uzm6ySR77gh15vtnsIW434Y2NiSq8H1w4smGYW23KwJWjdw2nF2Za2iRsSK8yL4WfDW4ILYMA52gfDaz4PwOb/dIfklbGjk4ZHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8495
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=928 lowpriorityscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXwg8TdEL2colr
 g9CmQ8HUXRhBcSb7i/Pzla98An5+VLAGC+bjnjUDK3rAS878Ug34ZUJM2FaUTNjZlW8uGYfFHbh
 98XZfvoi0CL8qhlhLchTzfwg71ankmGv2trRSfzbE3Vj2rKojVowVzbznFpIKU2FTI+R4wxeNFp
 imDuV4EPpJezqzss2tLs+YPl/F0PsWu0pwpD4B3kMMJ6fzHPBUkFm6mSjFLlg3AWsPGTjdhoMvv
 YIs9sZNdEc8SR4Kla+ILkGS8yTxEvEGxWc+pv1p42fbqSs3hr3648kMggtvMblBKKT6g7prevP0
 EhX7QUbVpwNu/Uq0cBXG/HCg9cHAc0NSg/bsKk85Hr6PMwmBVSlji5zvEyn3ORTErZ9UeX0+huv
 f68Ba9de1qXKcWpv2u3nlt3oUgrNmL+Uxbyt+7ntyB5tD7gLOXn/8Xd2sLQPSFCYNa2bfoQQMuL
 T3/kxt7T+cVNLxfgSmY00LQChXLQtlZ9s0oy24Ns=
X-Proofpoint-GUID: yEiYWXfA73OVgPxa6hA9sjSh7--Igfa-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfXwR3aUz0kcFFx
 B7Hu4hF7KXCd10fqNoSIVH6F5l7V3TPQUC2CawS+SbVm6gOl7hw9Ex/3dIYDRP5rrI6VwcBItC/
 FqHL2jceolCJ0gZLLhoUtW0D73jYEjgbn30ohb/Dex4wXa3Pdq6E
X-Authority-Analysis: v=2.4 cv=fKGsTpae c=1 sm=1 tr=0 ts=6ae4f230 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=HZH1ei9p6KKMLn-EqtsA:9 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12107
X-Proofpoint-ORIG-GUID: yEiYWXfA73OVgPxa6hA9sjSh7--Igfa-

---
 libdtrace/dt_module.c            | 133 ++++++++++++++++++++++++-------
 test/triggers/module-discovery.c |  13 +++
 2 files changed, 118 insertions(+), 28 deletions(-)

diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
index 7cc68968..ad43e815 100644
--- a/libdtrace/dt_module.c
+++ b/libdtrace/dt_module.c
@@ -1604,6 +1604,8 @@ typedef struct dt_kasstate {
 	int		kernel_flag;
 	int		last_sym_text;
 	dt_module_t	*last_dmp;
+	dt_module_t	*lookup_dmp;
+	char		lookup_name[DTRACE_MODNAMELEN];
 } dt_kasstate_t;
 
 static dt_kasstate_t *
@@ -1613,6 +1615,8 @@ dt_kasstate_new(dtrace_hdl_t *dtp, int kind)
 	dt_kasstate_t	*state;
 
 	state = dt_zalloc(dtp, sizeof(dt_kasstate_t));
+	if (state == NULL)
+		return NULL;
 	state->kind = kind;
 	state->kernel_flag = 0;
 	state->last_dmp = NULL;
@@ -1818,6 +1822,87 @@ dt_modsym_addsym(dtrace_hdl_t *dtp, dt_module_t *dmp, dt_kallsym_t *sym,
 	return 0;
 }
 
+/* Parse a hexadecimal field without scanf's general format machinery. */
+static int
+dt_modsym_hex(const char **line, uint64_t *value)
+{
+	const char *p = *line;
+	uint64_t v = 0;
+	int digits = 0;
+
+	while (isspace((unsigned char)*p))
+		p++;
+	for (;;) {
+		unsigned int n;
+
+		if (*p >= '0' && *p <= '9')
+			n = *p - '0';
+		else if (*p >= 'a' && *p <= 'f')
+			n = *p - 'a' + 10;
+		else if (*p >= 'A' && *p <= 'F')
+			n = *p - 'A' + 10;
+		else
+			break;
+		if (v > (UINT64_MAX - n) / 16)
+			return -1;
+		v = v * 16 + n;
+		p++;
+		digits++;
+	}
+	if (!digits || !isspace((unsigned char)*p))
+		return -1;
+	*value = v;
+	*line = p;
+	return 0;
+}
+
+static int
+dt_modsym_parse(const char *line, int kind, dt_kallsym_t *sym)
+{
+	const char *end;
+	uint64_t value;
+	size_t len;
+
+	if (dt_modsym_hex(&line, &value) != 0)
+		return -1;
+	sym->addr = value;
+	sym->size = 1;
+	if (kind == DT_MODSYM_KALLMODSYMS) {
+		if (dt_modsym_hex(&line, &value) != 0 || value > SIZE_MAX)
+			return -1;
+		sym->size = value;
+	}
+	while (isspace((unsigned char)*line))
+		line++;
+	if (*line == '\0')
+		return -1;
+	sym->type = *line++;
+	if (!isspace((unsigned char)*line))
+		return -1;
+	while (isspace((unsigned char)*line))
+		line++;
+	len = strcspn(line, " \t\r\n");
+	if (len == 0 || len >= sizeof(sym->name))
+		return -1;
+	memcpy(sym->name, line, len);
+	sym->name[len] = '\0';
+	line += len;
+	while (isspace((unsigned char)*line))
+		line++;
+	if (*line == '\0') {
+		strcpy(sym->mod, "vmlinux");
+		return 0;
+	}
+	if (*line++ != '[' || (end = strchr(line, ']')) == NULL)
+		return -1;
+	len = end - line;
+	if (len == 0 || len >= sizeof(sym->mod))
+		return -1;
+	memcpy(sym->mod, line, len);
+	sym->mod[len] = '\0';
+	return 1;		/* Explicit module name(s). */
+}
+
 /*
  * Update our module cache.  For each line, create or
  * populate the dt_module_t for this module (if necessary), extend its address
@@ -1835,39 +1920,19 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
 	if ((line[0] == '\n') || (line[0] == 0))
 		return 0;
 
-	sym.size = 1;
-	strncpy(sym.mod, "vmlinux]", PATH_MAX);
-
-	/* Read symbol. */
-	if (state->kind == DT_MODSYM_KALLMODSYMS) {
-		if (sscanf(line, "%llx %llx %c %s [%s",
-		    (long long unsigned *)&sym.addr,
-		    (long long unsigned *)&sym.size,
-		    &sym.type, sym.name, sym.mod) < 4) {
-		    dt_dprintf("malformed /proc/kallmodsyms line: %s\n", line);
-		    return EDT_CORRUPT_KALLSYMS;
-		}
+	{
+		int explicit_module = dt_modsym_parse(line, state->kind, &sym);
 
-		sym.mod[strlen(sym.mod)-1] = '\0';	/* chop trailing ] */
-	} else {
-		int	matches;
-
-		matches = sscanf(line, "%llx %c %s [%s",
-				 (long long unsigned *)&sym.addr, &sym.type,
-				 sym.name, sym.mod);
-		if (matches < 3) {
-			dt_dprintf("malformed /proc/kallsyms line: %s\n", line);
+		if (explicit_module < 0) {
+			dt_dprintf("malformed kernel symbol line: %s\n", line);
 			return EDT_CORRUPT_KALLSYMS;
 		}
-
-		sym.mod[strlen(sym.mod)-1] = '\0';	/* chop trailing ] */
-		if (matches == 3 &&
+		if (state->kind == DT_MODSYM_KALLSYMS && !explicit_module &&
 		    !(state->kernel_flag & KERNEL_FLAG_LOADABLE)) {
-			char	*s;
+			char *s = dt_kasstate_modname(state, sym.addr, sym.name);
 
-			s = dt_kasstate_modname(state, sym.addr, sym.name);
 			if (s != NULL)
-				strncpy(sym.mod, s, PATH_MAX);
+				strlcpy(sym.mod, s, sizeof(sym.mod));
 		}
 	}
 
@@ -1927,13 +1992,20 @@ dt_modsym_update(dtrace_hdl_t *dtp, const char *line, dt_kasstate_t *state)
 		dt_module_t	*dmp;
 		int		err;
 
-		dmp = dt_module_lookup_by_name(dtp, modname);
+		/* Separate from last_dmp, which tracks address-range adjacency. */
+		if (state->lookup_dmp && strcmp(state->lookup_name, modname) == 0)
+			dmp = state->lookup_dmp;
+		else
+			dmp = dt_module_lookup_by_name(dtp, modname);
 		if (dmp == NULL) {
 			dmp = dt_module_create(dtp, modname);
 			if (dmp == NULL)
 				return EDT_NOMEM;
 		}
 
+		state->lookup_dmp = dmp;
+		strlcpy(state->lookup_name, modname, sizeof(state->lookup_name));
+
 		if (!(dmp->dm_flags & DT_DM_KERNEL)) {
 			err = dt_kern_module_init(dtp, dmp);
 			if (err != 0)
@@ -1980,6 +2052,11 @@ dtrace_update(dtrace_hdl_t *dtp)
 	else if ((fd = fopen("/proc/kallsyms", "r")) != NULL)
 		state = dt_kasstate_new(dtp, DT_MODSYM_KALLSYMS);
 
+	if (fd != NULL && state == NULL) {
+		fclose(fd);
+		return dt_set_errno(dtp, EDT_NOMEM);
+	}
+
 	if (fd != NULL) {
 		char *line = NULL;
 		size_t line_n = 0;
diff --git a/test/triggers/module-discovery.c b/test/triggers/module-discovery.c
index d11b761b..0b09ae2b 100644
--- a/test/triggers/module-discovery.c
+++ b/test/triggers/module-discovery.c
@@ -118,6 +118,19 @@ check_discovery(int fallback)
 	    "1000 10 T discovery_symbol [discovery_first]\n"
 	    "1010 10 T discovery_tail [discovery_first]\n";
 	CHECK(dtrace_update(dtp) == 0);
+	/* The bounded parser accepts multiple owners and a final line without LF. */
+	symbols = fallback ?
+	    "100 T _end\n4000 T shared_symbol [discovery_multi_a discovery_multi_b]" :
+	    "100 1 T _end\n4000 10 T shared_symbol [discovery_multi_a discovery_multi_b]";
+	CHECK(dtrace_update(dtp) == 0);
+	{
+		dt_module_t *a = dt_module_lookup_by_name(dtp, "discovery_multi_a");
+		dt_module_t *b = dt_module_lookup_by_name(dtp, "discovery_multi_b");
+
+		CHECK(a != NULL && b != NULL);
+		CHECK(dt_module_symbol_by_name(dtp, a, "shared_symbol") != NULL);
+		CHECK(dt_module_symbol_by_name(dtp, b, "shared_symbol") != NULL);
+	}
 	CHECK((first = dt_module_lookup_by_name(dtp, "discovery_first")) != NULL);
 	CHECK(first->dm_flags & DT_DM_KERNEL);
 	CHECK(first->dm_btf_id == 101);
-- 
2.52.0

