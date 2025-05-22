Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349833F3
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937346; cv=fail; b=bDY4/WcXgpLD4LzT+Z4ybuyHOjJomJxCNT6wdmz2rpcL/p3CNanoHrrjk3T7OYDMAWIoxzRNrtqCiCo/YPCvFZe4wW8cJEMPTnve3NNb2gdnmiQZOr5IZ0XaKKxAXJtj5jU6jvHEn98NzMWShvzafY7QbZOXVPSwMicrU+YOPe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937346; c=relaxed/simple;
	bh=zn9+4XwaB7lrb6UiBxddJ8BSImJdqdFhrFcpecWaFo0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bbm8iKKuW1pN4oIzDOZk5byhtykqUxGiiK/tgum6Tmod/AtQmUQpSdq14Mlck0RO1aO3mXKX19r/hQRfBoseBBsmfsi+JlhSIWstS5pprWwcpwk9WzdPlJK3ychurjM1DHibC3UtZFRfxpu8bjXe5OmPQd02ZstIfvwaVD9/Zso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BNT7dhBa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V2l5R4NJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BNT7dhBa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V2l5R4NJ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH13v5015388
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bbsXTU6PeEnJZ4gGzj
	2blYGi1cOzjf6kajzt9XSov/Q=; b=BNT7dhBamK1eaW9RZ0twR5iTtB6YyYCtiK
	E9ofdIydcO5hRwNSw/G+G1zE5mwgG36kR3rbabpBTw63z+vBjfj7h/yGhxjMgOer
	PKt8wa3wdhKmcckGMTIGofNNnpazXWb4yk+JKRU6UdBWbsVl7stg/jp/ZANi521S
	zVIrdEmfIA+iFgv4mZJDEXaBcYXaCsWnQHlAC/raJUrL5klEo7C+TvpbbYCVgjNM
	t6nLC2gMmRpW2jtGkgitgoXjx/UPWN+1obKm693C9aa7Yin64kfdF/K1D6hNsoi6
	HFjJQyA0YmaKYqEliBahc73e8LTzVJruY4xEY1A79rcCo0KFZ2Gg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46t7838bgw-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:09:04 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHOvxC032157
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:32 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11010023.outbound.protection.outlook.com [40.93.198.23])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwep0gx1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 May 2025 18:01:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/x3ozCsUfuBfqM53Ti3vy5esrYpEISvJnaY3RGSPT1OGQOBwe9XkGxLY/RvY6gLHjfwecb06gU0Zt7n0siY0jlxPEmg4alUzWFyq2KruQgbB6dEqFDuAxl10ZnH7i0zCaAdfND6sIzrMxLvRMV/3k/mG1pcuaVoJmv7FjWUApjnvMeMtdTJt34DuM5m43YVRQafggNGrIhL1zp0Q+UX1R+pr+QNbze4qTp0BdSmDoVns8c4VJzslz24uwkExmK8dnwyZnOe0jpmwCJPYURwRcseiCoBSOF3t6AHM90XGYz0mQfbomlSf2kfGGTClZltLQdzc7OvxZc9HqAdrrY6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbsXTU6PeEnJZ4gGzj2blYGi1cOzjf6kajzt9XSov/Q=;
 b=aIL0T8R4nlMy1rt1K5CxjO1zg93omW1NbUj8fk38+G2UyXo1tYXA8NAPPx09bMr/W/U+W7X43cb4YOGrUsn9o04ZEdjpqvKTvzo6yAUR3VAvuHew5mJ90QIwkUEKcyo5Mjvi73xZ+zDP/n2ozvAKp1jXr51AyEKjUsQjegeRtfL7rkXCOiLxzEMDjtWzPU/Bpux854FZ0lYOvBi5Fl2foitVQ+KN79RfEHYhgfsJpFFInsFGuGybTMN/lrFjUVxdlbJ9SOumVedY/2uEeHDirGd1Qlh9HTr4/PZwobj7JDutKUEHWVEeh2TEpd50zDjTC82a56yAfQskGj+/pCwj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbsXTU6PeEnJZ4gGzj2blYGi1cOzjf6kajzt9XSov/Q=;
 b=V2l5R4NJYpq+gzd35LUodLY8gNbtpDs7pnnm+PGCKS67EuE+p3o4bTcrndwltSe71bEhYp8K9dQJsY8io0+OcrSV4trPvk4LOp3UFSF2/SCkiLLW+dvfJfymI+WBVi7DAsZ2QX6wucFtwco7TMAPtoIhiKqglNUOUwFQsO8ryBc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW6PR10MB7590.namprd10.prod.outlook.com (2603:10b6:303:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.32; Thu, 22 May
 2025 18:01:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 18:01:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/14] Test: remove unnecessary "unstable" tag
Date: Thu, 22 May 2025 14:01:07 -0400
Message-Id: <20250522180118.27343-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250522180118.27343-1-eugene.loh@oracle.com>
References: <20250522180118.27343-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0285.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW6PR10MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9eea7a-c936-402d-cc81-08dd995aad56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?07bjGXjedolopI3p8abaUmITe9FjL5ZAuyMl8y1SWB3TzoSyuIKVwoL4TIvG?=
 =?us-ascii?Q?puLjUsKUh6bKkQiEBsmjlZ1W9sIi0MvTLq9MUufFjxofZIWP80sxOk/KiSYd?=
 =?us-ascii?Q?/V4Lb+ZvFuI/5CbmE6WDlVXQhpDCqLtLEXIYmcmmCbGqA7lNf1OX5bnASaHU?=
 =?us-ascii?Q?0u8NuW8e2uPi3nQEu47qa3WYaTYvksET3Ue+Ew78FRXV1GhAYjcQb/zsWaIb?=
 =?us-ascii?Q?HTA6kVS3Ovh5A1cVrYiEkA/w9Ky0XDwL3cXFIgcu+EwrRKIIQVJLXY9TTgML?=
 =?us-ascii?Q?VNh1ZKK1jETbYmWm8k9/vT463DQB3v0flZCjYAeOWUFcDUYFXtXHYhDPTy+1?=
 =?us-ascii?Q?2XFHKOSHVb7lKM5+/caWd4/t6ppnV0Rx4417BIg4q1dEel3TwGfe+oXaiFNE?=
 =?us-ascii?Q?rGm3Oan/UoTvTEsxQ96xEnGNFjRYoqsAU4wqh1/yx/T1+DRsJDdpOVUVxdej?=
 =?us-ascii?Q?HKZHvgZWrM97CsMTSd4B+5Lhay9TLPnLhdwbtAfBq9U+TklD5U01khYBjmCX?=
 =?us-ascii?Q?9T1wZA8pAWf1vypQzNC/aRaGz8JJSwLSOMhT1uSVX9sWYpOmJq0vHxfAkFf2?=
 =?us-ascii?Q?Q8yGBEl0qoLxlii6+72foPauYNhH7iN55HQvXXjNkdWMkA0OjdzQ3YJA7Dpq?=
 =?us-ascii?Q?JvLGc4tOTiNy+mrg3C1p9Nm+JMxCQsaLGANBlu4LdVltr8FDnXDIIV6470V1?=
 =?us-ascii?Q?PiwaVV/502dLNxHKk/LDCg9l4/y/p2gd7Pkxe09TkefvNv6wmCZVbubQcCXs?=
 =?us-ascii?Q?Jv1MssedSb1N/4xsEy5gSakmyaaEULu6KyJZf1brnt2mGcqYK4T9MIb7ZsVC?=
 =?us-ascii?Q?RRx3h8LurGzg8QoQsX8g8Hdr8YB3+MCrOkoH2z5B5Ix1Lp086tVrNcyqzddW?=
 =?us-ascii?Q?Yr0pjVOvlQpTCqjxOchiHOnpmQRHHlYpYSDSv3vEz8DCE1+NYbVSCIyo2D/c?=
 =?us-ascii?Q?3MHAQzyS2PP1KH6xHYEAgJ8w4NFFFHV3enw5R4eHBxY5UP3d/TQLkmZdrMwO?=
 =?us-ascii?Q?x4/VD9p/8+mItm6H1b94OL+GV/xEL7fT94s/lJuP+L1A9BaQ0rCXA3wHJC2g?=
 =?us-ascii?Q?38S03aBKcRxIsWyS3ze8aCDaEzRg5T8f1m4up7G0fti+7+Ou7q7d+6J2aP9V?=
 =?us-ascii?Q?lABvLYfFoCvAQpdUr+1Pn//FCKyQp3QZTLmPM26EoDmhBN7pSIpFoz7dQZFL?=
 =?us-ascii?Q?PsaI+XtDHZWVkeoOBpJlDnDRJOgLCqr+HNM/l4oDwT0iwYCGPsW7wZEBUqMM?=
 =?us-ascii?Q?6mEx280mWeeD4kN/PvHehow4z9hiMN6FYJMu46eIfbro1O0YsV09q7GVameK?=
 =?us-ascii?Q?XYYQUrUDDQGFzoA9VyIHHk01eOs7vf0v/ouYSGwJyuCf9xgicJa/jGWCvVfa?=
 =?us-ascii?Q?BmU33rtuGJFBdLxAH2hK8192y+aa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Ukx06I/oo7JygRjEiIV0B9mYyxBHa7QhpP5BBDvDNK+XiwmBAytWwvQvcI0?=
 =?us-ascii?Q?rydMGph9hqiuFSxu/O3snyt85ypD9na2hrhQAMcXcz6DE0MeHuLyJvByJfkm?=
 =?us-ascii?Q?B+clspRPJATJdycLtBaBjlRXE1JiaWSQfq6Fn0Rn0ZByswzVQFZxRdjC3Y+3?=
 =?us-ascii?Q?NECIGG0RdAnMXL86uik2lXQj8h4R1BSO4e+ojORSjBqE+V7giD2QVMHqN+Tb?=
 =?us-ascii?Q?2WKbON5NoQJtjG6Bu+GB+N/jEofjerszPrSZRbYwReEDqvGnCuZ5UaJSrdSw?=
 =?us-ascii?Q?G4cMml9VOqKgQrfe+Ap5fhwYVMXqq0JxdXqkF2rPSGZGrH741XmppYkYW6Ig?=
 =?us-ascii?Q?iWThNsGoa7LHqYCXuV3n3WBfSfzH9/FuXG6RRq131tZ6sJG0iTuob+uQo+DQ?=
 =?us-ascii?Q?0AhP8ItdwKLwd9v4GqPrQ3hxxIT4N3gzVXuOsTjV4TUW0Ap1crQb9oQBWFEF?=
 =?us-ascii?Q?bvzRJrbeUTVe2oZukxT4pX7SPJcPEWO+1R4yRsv+hUCXvveh38YUHWBiYAQF?=
 =?us-ascii?Q?krxCNNVvi2n0d94827Tj29fToARQNER65XjZ51iuLXBHHpcgjQdKud+n8bOA?=
 =?us-ascii?Q?gvgpxjB+mxWKpYXC12UKtXDlsZZhzAcuo4DeucKhQVhyllZp2tAIVLGgBTng?=
 =?us-ascii?Q?6rvq+dIs274WI2RBcWqm8WuMvXUnFXYkN6rKcOp6nuKmO0/NzjXdNflPr10g?=
 =?us-ascii?Q?4HLmh2NuTAm6yUTNd8uQqAPTed6ownLVK9yIj9bpeelqK6FVb0EZ+EGF4R0f?=
 =?us-ascii?Q?YR9EUX52+Dxqr94bWyNS4eA6pNIQZy1Cm/J1EidZOLz1mKeTlJsAJ63VE/gQ?=
 =?us-ascii?Q?drewefImc+KE2Ova0azrQi1BnfH/qI36Mj3i3qV7Z2tNHZp0IRRsE5B53xov?=
 =?us-ascii?Q?BMemVoSgZGAxOl3i9JtJwfsuLuN5rNA113r/GAVvzsjO+sUgLserQd1YJYfu?=
 =?us-ascii?Q?ayxR4x7PKlsnMbymnW8rhS1PNzO6dkW2MsaAKA0Fga9dwlRhNWMlV75eEy06?=
 =?us-ascii?Q?hNmXvDaFg3Kz7TiQSxqJ6QkdlXSujLmENMocWQ18Au4AZF1JFchdaCv6uN/a?=
 =?us-ascii?Q?oPPlroYnfK2uw8Q9qMDHG7jTj4h63jua0tywiobFSwxou4rngUoi56KKATbp?=
 =?us-ascii?Q?/CS3plwNwJxf9TPOW+7afJyDtygpO5VzM8iWtKEHuhPAqybUCgzut+4VlkD3?=
 =?us-ascii?Q?UBvKOtnijiiR22DbTJI/QTnGCvMi5w+TN17v0reusfXd0BNVqSh45Ld+/F0Z?=
 =?us-ascii?Q?7SsGGPeQR2JO39p2w30hGVtljFyPwbJRVunOgACLF3kR77axgoql9ZRCcGs1?=
 =?us-ascii?Q?SLoGKGeOU88ycrQAgahNb0LeIVNRq+Z59GT1KnlgE/sJtbT2uDFDjXgIJ0Bh?=
 =?us-ascii?Q?f4/hTcpxhPuD4aVZrI3yRNDW621Kuj3AMQUDbDMfg/DLVRcONOkZvitZoAXH?=
 =?us-ascii?Q?t+1DGiKBCZS4OnL0mupCT9OCF0FEz2VZ7XVn88aXOxEOUdkli19al7+Lc7i8?=
 =?us-ascii?Q?pDsdCB+6h5w4Uk/L5BLpGXRZtEubq8bRkjx3wAHaA9AkNcT5PyYxXGGWmC5N?=
 =?us-ascii?Q?k7uZcE8WRGVTjp8aFXz0XCJgScLiuevNdWkGsToP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sDL2mSCPMMfGOgz+4pBc/uuZigA4zxnFhRRteN553sgHVceUh/9dwqpBXnBEBH/+/CWea2elLRnTB1mL/ov1hSFsVFIuSa6M5OOi5AuDYYqpBLAeAY2dtZ3PxjHgY9S1LnDHvNdsjvMl3bP51hkJSDSZLtvQtNFbIDwOJ6LvWISXB/bknYZfPFBn1g0Oi2+00nnR1jkzOIw0wHbmhZatgF1C9g1Xv08wJJGl8hNnkq5fc/V+WX/9M4UK/q3wkYdHDc7pxKugRQFwC0hHByKV55UqCcOZGeslixaLHHvf9bLgjrPpKQQe3d/dePnStzysOV/6DzSmFfsVg0Ta0L8SgKH2UlVzjtQslrqnv167oawP1yE1sXpEGf3FCfYXpRQR4oWVifdXaPBfxRoPA8xOJtGuAHfEVJUS/Zfk5sALgpj6+9XV87WFuB7trgnj2X/EVMFcTyyWR1v0W08u0y2FnnjvjB5x6NtwtV8uCiqdcG+K/vfKR7ZfiKcMhznsvTdC7+sbP2nmzc6DVvh5dFWxztsz9vQ6O+DZ8hg058aY7PhZUBmIEA58s4LsGFT7V5ABxspTs0VfUfQLBNrrHziP5/ki3wl4NzagUXaIrMesgjs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9eea7a-c936-402d-cc81-08dd995aad56
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 18:01:29.2856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUDknZELuR7LVoLZy/XntgHfJyQq7wUTrJdYWj1jGdSEJvfT2dA4+KDQFnxrQekRHkL12UBwOZ0iJBX5wVnikw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220181
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4MyBTYWx0ZWRfX1tRL3/cH74l4 lBqKZSJXxowJ3II3upYbI4T31bYw8UxhyB0l32RDM1No4ptwY+CRq8iyf3KJzdlpcHxu02oxy3E pA1dYyR8NjcKs8z+kpQK/1lAQKW+/hd37PGRlXgHMrFiqxoSv/a3C5v/TwZHb5mCxi1nfwKIJmv
 bcaGshx9+5IntemSrTWma7iUxze8Bw1W25WLfbi49XMlkPGFyXp5cA3ZtebN9/jDT526+46XFEG HN6fhIISorTo8+C/s7IrLNmF8ZFy0eugERu/l5PDxRUhkqooKpOMhGDyM1EW0ZJypveexE4T++N 4jvy45Ga1E3Qu75B50CN4LXc9ZA/etRHLBNztoP6cnM4DRxLyHG/LLl6TnflgnMKsyKP+aFpZTg
 Gu0A8JojT2qUgzEVBGtbm0fxJTfwkUAyiCyrhdrGkdZLvpM7KspdYFRQLVoouZYdLoJnEuGW
X-Proofpoint-ORIG-GUID: 8Wzgvm__EnZFtU3p6L_GvGyIPguYgJ4O
X-Proofpoint-GUID: 8Wzgvm__EnZFtU3p6L_GvGyIPguYgJ4O
X-Authority-Analysis: v=2.4 cv=H9Xbw/Yi c=1 sm=1 tr=0 ts=682f6840 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=8BYCmc0dCO9CqidnpmwA:9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/sched/tst.stackdepth.d | 1 -
 1 file changed, 1 deletion(-)

diff --git a/test/unittest/sched/tst.stackdepth.d b/test/unittest/sched/tst.stackdepth.d
index 02a878bea..e6ffca01c 100644
--- a/test/unittest/sched/tst.stackdepth.d
+++ b/test/unittest/sched/tst.stackdepth.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@tags: unstable */
 
 #pragma D option switchrate=100hz
 
-- 
2.43.5

