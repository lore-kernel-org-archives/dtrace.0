Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44567261B8A
	for <dtrace@lists.linux.dev>; Mon,  8 Dec 2025 05:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172485; cv=fail; b=OSJU/1Xxf/kMP2cWcbZYTs2qNKLDN36rQ01PqUb93JW3Cs7zLYfxFctO3HJYNnbLRDYEnoo6iIRzlY5hgbp6qypdorFG64HVpDcF8SDj1c/NgjccxP7AuvCZwv+T0r54YEmdFTXmbcIu/gV4LH6jxeV1Kfg1iX3YfsDcHEY8Uu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172485; c=relaxed/simple;
	bh=YWbOshtczWf1xrpDM0K6YUmyfllYMI9gXSpU/h3m4Sk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KRRyC0AyfpkUSgOxbHvPuYfZSKyaUHaOj6uFt8NohTrLh+NFWTtgTwI0JiI2Xn13OhNzq9FSNwuRQ2K4nrEhDbDa0uu4XaY5v2Hrlht+Tfd0cNsqrxvv43FTB7sAYm/LmLxlpwl4Y+KhrjNOwPKXbYhAfGXd9Av+XE2Ymda1qaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OxsD0Xr6; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=U11bF43f; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OxsD0Xr6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="U11bF43f"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B84sv9t1689385
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 05:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xQE9euxbpHEzu/sfoa
	R58jrRQOzZuk28Q0SmFM7+f4s=; b=OxsD0Xr6JKv5zD9186cj3kPUv/DdlIsB1M
	nn8BrrjFC7l7vCWxTRWVEutJZo1C9tWOsOrdnMfFwIDyLwK5/Waty2rFc3KRjsgp
	UhzsKU0qZPLni8nwhndCC+UgrC7HyKeGzmTmghADmB+h6CBnUnSRxY5U8pUjD22V
	XmOJhvsaCZS9yPEo0gJaIn6fvdt97vibKSmE6Ogzce6kLM4QY8xHhz1o1Js+1Yoe
	d363k5UdU/aG5e5ElHng7q2/Fl/yu8eGrY+gIC9Q+pJj/t8i2ZVBjq8WXfkotZJj
	VZDZ/dtGcZ5n4eu1V5cmYEy+y32m9gAGKw6huK/nlBvJvEuU1SuQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4awr2r010x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 05:41:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B82HJ8m040639
	for <dtrace@lists.linux.dev>; Mon, 8 Dec 2025 05:41:21 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010028.outbound.protection.outlook.com [52.101.46.28])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxb3dpy-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 08 Dec 2025 05:41:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbbrlyOiiaK7KbeakfK+0m4d/Cwe1pZkXxkhTCDPc7ppWnwInizMDCOKVEiDzo7x6jp/lvutS3TNoJdrUUfFLXFE+lQvDaTLg1s6uj4niFVxPZwfUUH+2XZBQGdgFzqbuQ5G1KLax6lGkwhXP6rq0ZWLAlcEKzNYxGtl7pqg/2kMO3NFs77pr7giy2f5CL6U/W+u0WV6Qei2zVM/7RtEFtMFJO1xT74ZT/viJQxmObt/f31Jvm6pQuZVv9W8yDGCX+DQA8/9gSn6QGmnzXfeksqNtJSPb21DTjgS3o650Zh3X2MhFWSgcF1MQiBQ52EjZVXE25mAtMTuqr6RE0+0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQE9euxbpHEzu/sfoaR58jrRQOzZuk28Q0SmFM7+f4s=;
 b=nLEXQQsCdH5026iAV7iWhKA3HijDKdRvZPETZAOoWdqXO10f0cv5k0/PeUe2YGthP0qD5WbRiWpdX9yW/SGCqwa62xiKudBk1kvIJMMg+iGERWeQJNOwqCky4OxvmQtLXo64lM+wIo2GRuvwa3QKscILSTlIVEA72qFumT1yEfoLL80chvG8QzXjbup0IG7/r4WIs4Df1lRsFzCcBesmP+S3A36nV+4fmtbLECuhJqq49SDsUAWmSyvawFoT9htfAi1wS8SWCxQCAvO6nCrgXVW+MwkoEmsvU52gbLT2A5JB1gmyhhWI65UvQtVuOUI5oK+tsS9Js7llbb3aN2ToIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQE9euxbpHEzu/sfoaR58jrRQOzZuk28Q0SmFM7+f4s=;
 b=U11bF43fMns0MSWcb/10ggcG+cK5cIq/jeCCpBDe33k9QG+YaNQDLZOKrwkN3RZaIDIdB2HEyG8kZBANZADD8yPRS1R/DllBD5N0xoafr34qEa0hVRzR7K0XxY7JabUL6KF1K8OGNuANXaNtn7m59+KN54CWr2g0EwD5hjH2SrY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5120.namprd10.prod.outlook.com (2603:10b6:5:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 05:41:19 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 05:41:19 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] doc: Update the sdt provider documentation
Date: Mon,  8 Dec 2025 00:41:14 -0500
Message-Id: <20251208054114.28036-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251208054114.28036-1-eugene.loh@oracle.com>
References: <20251208054114.28036-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0002.namprd17.prod.outlook.com
 (2603:10b6:510:324::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ade210-1108-4976-2c44-08de361c6964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j7snh8o5WICPb2BkCX52ssi9QKXHc81SdStO5Bld+4wtdqEnoiIGqrmepZYy?=
 =?us-ascii?Q?ubpThUQQah8lf6HvzMxONkS6AEEyG3DU0IyJ4uRZUik5RPpkg5JAC71KcyML?=
 =?us-ascii?Q?Wy0c9KSVE+alAPdP7ea5m6IWT4sNZqMhXuy54QYwtTflCzrdQf9WudzCxQ5f?=
 =?us-ascii?Q?GtM4aEr0wqJYPHrSBJXxX5myQEg9PYCOTYtvDvjJ/LZpKWCCoItiG9+t0hoo?=
 =?us-ascii?Q?CwpQtbeJay3wVVaW4g55upHZgC4nBH1eocS2L/J1CueXF8Zjg/NCZ+rqUr6p?=
 =?us-ascii?Q?nYu6mxMdhzAXbM/yDHDLZ0dtgup1cxpScJgOhmuqB+0kTlFrSD3a4Gf/fvdp?=
 =?us-ascii?Q?es4jbeeO4ID8yAsYMAqlQ0Hud0esTyg2HoRmed+1aq6X1KK3KC14Z9YPdxmh?=
 =?us-ascii?Q?aWf4oFtFgSirWOrkM/HpAXL4pDJQN5Vzy0MI2FiGN3dhj6mQYWUQvGVHaVqA?=
 =?us-ascii?Q?kNfVCi7CAhYl7VehddnQHlBQtvXLJ1NfBujLNQBBuc917nDGmuv7ElieEAAz?=
 =?us-ascii?Q?hyLn0iKgLxPBHu66APKV3uQMuMf++IYwikq21X+p/4TTUruO+ERB7IJ1ola/?=
 =?us-ascii?Q?FTD8uXGfW7hwryuaeo1opXPERDNvOAwIEiQV1D9kOvVC47LC7ag7T7/zBlsB?=
 =?us-ascii?Q?j2mnzwPjOCULGdBj449APVCIDTYhr0l5T0L95qFLg9fh9uVVWf8hwLVzf4fN?=
 =?us-ascii?Q?V6Oy+oZDpLF1upJ33jTJfjOmTqwugFeJLgCOHnE828vzp/+/WsDQPxOBi3aX?=
 =?us-ascii?Q?IcEiBW0M9okhDWO8eybE1oK2e3ps3BX6EQEUatX415FN055sVJ/cUqVix2Sb?=
 =?us-ascii?Q?sT13KQdAV73jiDnvgyZljPpd92Mg8TvBPM16ZBHC47ubkLa7JXeQfnRdb0H3?=
 =?us-ascii?Q?YaQWdIDSk1CqkZfvAIvLbxlr7zRswkeiL+6QGzRQj7ReZIkuD6E4G/itUKvi?=
 =?us-ascii?Q?tEclk7W0nAGKflqnmVpOtf4ym+THkJhc9DisOFeIgCtYc+0z+0Bt/Q5My2jn?=
 =?us-ascii?Q?nbZLq1E1LetVNEuC0BU9s/t9KuPNU9EjVYd1Xt+t/V1OPqhu/Cs2A/hlJYve?=
 =?us-ascii?Q?k3457klG4N25Lzi1twWscI5Q/vXDG9sO7BjOZw2MG18q+Q5ThNcLKVmsFUhD?=
 =?us-ascii?Q?zpTBLOw2vYF/HDYDVmAlp2wQG03v6uMybVXwuhbFfv37UvPflJTXlAU1q7I0?=
 =?us-ascii?Q?6o0001d7Ogivj7/xsagDpcznEsl27gKhAnNS53k3F0r1M+apd5RWX8YPbZ+1?=
 =?us-ascii?Q?JedcaCpidyKFMnK6FaRo+DLQ+hNCTLcRgRemXBLgznwmh4zeIeEM/SHDQrEs?=
 =?us-ascii?Q?BraVAP4/XfLdaoGMcmQl10jm3BZpWF1qKFX2eRpPRI6e0etKH0+JATJJ578r?=
 =?us-ascii?Q?N+HxmV+oJHzVJA9hktvZ0E2/gynNXtM2Q0UAUcJWyvjERhaL9yiZDezqZT8E?=
 =?us-ascii?Q?ki6MWUvSyHCgk5sX2by/MmnAbSGCOdmN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JWfC9I977Odr0cKyPL4VenSpwhC2zGveCP+Vt14GW6vkakTYgNiVbU7Vfh+Z?=
 =?us-ascii?Q?3FuIdDz2ueWQXEgepS8A1N16kzA41RSisDDYX7xdH8NHw7bQkaMWLecEhEV0?=
 =?us-ascii?Q?xL/RfWrKmZU2dJyYpBYapN8FXt90o7K04M/eJZQjJQc3dxfAFs95VSDRQPR/?=
 =?us-ascii?Q?vrOjvn0fGB1yE3+lB/vFZtnhwOFSq/F/fA7JIzluhKWea3x1NDTxd7YTwCt0?=
 =?us-ascii?Q?XqdUQ1mrKqSrl3CWXEMmKe9+XxQWmpwAcDchj8EAdSUxhlVqRQpQd1olDHHl?=
 =?us-ascii?Q?655VbYONyBZf+i+LgAGqoHccmIRKRKc2bWoaanW+r42t/5Z00IfFET+BJe9n?=
 =?us-ascii?Q?l07a8p0KtHumclUqbPZsnwKpw8EBdXM7U1TUozlBzpTi8h9jD/xq5hBQbiSA?=
 =?us-ascii?Q?QrdU8ZIMRcg8DNeDto3RsuBnReRn38Qbvwlou401rh7LGHtcrcrpU4Bda4Zs?=
 =?us-ascii?Q?ogt+yI90MMVZ4fhtOqS11/SuFeVQfCR0OIyCeeBZZ47zyjep0nzHULxL2ZpE?=
 =?us-ascii?Q?Q/JDlT+5fNym5WI+vOopQQLeMlR9d8trLMeYIzbHIKwJisQh4ODHFbrWQ1Jz?=
 =?us-ascii?Q?cmbaWift6Krk0G50bYVi9OLMZj6jqRQ5YBDC0/aH8LgFj5OV5X5kUbYu4onE?=
 =?us-ascii?Q?czferxOoGmb4kvHUdQqQtBgZmS8eYqCyUo0n3lZHF0zdwCrz0pe45eQbRffx?=
 =?us-ascii?Q?7nKMQro1f7LEUgiI2OSQO8L7Rco1yVF1D0ZiyS8iKPkmNNz/v7AxYDkZrWXY?=
 =?us-ascii?Q?nJg9Uk28kK9sKxEsOl2+pHxB/WGyaZwpgn/UOsgzn/6L9YjOqfirDFhtQufW?=
 =?us-ascii?Q?oFFtenzlfNN3DSJVnOzgyXvzblBq2YcVHxW7PV3Vy4YYmWBrxuutLVtVT62K?=
 =?us-ascii?Q?IjRMX2BPt/+s408Xm5j+zgnys3o7/If4FSe4fz7qWl0IIeoKALyQivR5tgCf?=
 =?us-ascii?Q?ScJ/WrAafMVXyMxxmZt0j09Tb0XFxRgQ4VX3/coxXlbpoJAzfG2k69pbXU6g?=
 =?us-ascii?Q?sIaia2DU+WWnF4VaNUXUJoTP7gneTjqq8LF6YP0Q8rUoZ5Hw5+6XB3O8Oc7X?=
 =?us-ascii?Q?nfgLAxqCevzscPBbmFlLwgmtN8thyKEq5yEQgH1Ucrx8nxElryZZ62IPp+y0?=
 =?us-ascii?Q?riA1Th/jl1gExGcsnst72TEK8cJqGTuMQCwwIayHGj9BDB2p/wR2RSnoJN+3?=
 =?us-ascii?Q?27dcvPu4zsnNm9/ikA/K/1yHgp6gjFNCptIC87XI9Mt9wjnHH++NOdKD8AZI?=
 =?us-ascii?Q?YrvYi4hHQS1F3TmdIBjcNZi1/YpJYS+syPZIvdm6hFy003i0Smvwp9b84sZ0?=
 =?us-ascii?Q?35JhMwn72/VzWxbF0rkQCSftpCffwR6pu5eQFV4idNUSG5RvCc24xih82r8u?=
 =?us-ascii?Q?73CVAQTulFaoIjYQCVQyMkWciZqcGsTtH9gVm0W6Jhn+h2xTKPDPt/HLVyo8?=
 =?us-ascii?Q?PPhsXg7ztMkjaSsq8eUtRocAUCgWV5FAzsitK6INwWSBwYAFUtL22+LYf5Yk?=
 =?us-ascii?Q?KICrVGPc6nhtuoc5+n64j3dqCHB2I8U/1EKDMI/8bd/oqnZxmPcTQs8HYGPb?=
 =?us-ascii?Q?vRllWdf4LbDfQUSOrQT0P5gj8a/jDTkQgGolU2cl?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bbtjqKgXfW7LZ9NOnyng8SopTCJvby2usNlDoYXxejmE8WnuUJLs+5tqA5DR95GcQftBQnEBLkNfffYmoqMKVNDWT/GwBuS1Nyd4uDy6lsVmYa/8++NDdquGxEoUD77PHbk7ygeSCLDiXpJ+VCLvgbdsWhsX44YfawDPZkjvxVvRgij/VEAs5mZsoO4mYC7uw4I1+ge2/cx84/IHuQf3rVCKeVxmOM+S5Nd48XifyG16K2S0wdHI6g0UqDKwNTr0vlwvjmrPMuM2c9vUbp/lRy0MNkqXkCeHvxBhcs0oVdRj1BlvMMKyWrqDbBUSrFyIlFi3QcJWJCxQDpvNfso57AMyUUFrJcp1mPyErzOflqy9FSDhWStNypc5+Bhf+nRYUD6VXbidGkCS4Hg0rxQFC+2UbI/+UJX9gzUmVcvjAGCCnFP/XFHBrSxuIdYbmsxoDWWu1Y8KOUyXJABSep4ULKYzbORy8WlQ9xG1drYa5bo/RXzZ9CfnMlAC8XZupTVzSqjX6k3raam3wZHh6HQJjCUY06LSezmyTEv3UINUOiUjI8oWP0S/pfGNJDDNM1ww7G+95gjVTcR3xPHQYSHt76gKpu6sRH4kJi1nn7jfKA8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ade210-1108-4976-2c44-08de361c6964
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 05:41:18.9656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auCQdQurwSFsZu9fuIdffPp2znS0xinMTLB26qJbUw/MX/R/Syrr/h7LBOcVEZzW4u3OkuWBMMVdfRkAvrpr3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512080046
X-Proofpoint-ORIG-GUID: MWdz3vX41LykttRRp08aHYt2hywy6eZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA0NiBTYWx0ZWRfX2wa/H2jF5X5G
 I6w8e4CFNelRGgoiUTkpbApukAvltjQMRERrmd2fjz6dj9j5hFUlQRP0hfJptYpOGG4lKZm+hnY
 2x0UJCLWmQU/HTo2hcRah9dyGHEVzjGtAPixFkoVM1dr/7huLzD8fCdIuZxRyemyQLGGcKa3okD
 wOuYY0gJyoTps9RS/VYVuPwXpeflgKpXIhObQVVJOfX2ERzUCS3eejYmnQ/keOatFWbjm+Ri0MN
 Hu0G02q74Pw3pG5mK5F+xvHoZIjvmzKfLPTWC+H0fTBJk46UNBii0F9aBfLxDwhLk6vLnaqp839
 APvumaDb7LTu337VAMp8sO4I6ykzWF274LBN1Des4maHDXV5QrGICLVm8/OvMNf1FXEmPkZLc0s
 KixU83QV/Jngqiq2vZssL/Bex4x7fHyleyUHVGqPyv7etd6Wig4=
X-Proofpoint-GUID: MWdz3vX41LykttRRp08aHYt2hywy6eZO
X-Authority-Analysis: v=2.4 cv=LawxKzfi c=1 sm=1 tr=0 ts=69366501 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=eq587CeeSyjqKJBdpbUA:9 cc=ntf awl=host:12098

From: Eugene Loh <eugene.loh@oracle.com>

The documentation had been describing the legacy provider, in which sdt
probes were DTrace-specific instrumentation points in the kernel to
support other providers.  In the current implementation, the sdt
provider simply exposes Linux kernel tracepoints.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  3 --
 .../reference/dtrace_providers_sdt.md         | 42 ++++---------------
 2 files changed, 8 insertions(+), 37 deletions(-)

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 3e057d4de..7d6b1caec 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -255,9 +255,6 @@
         -   [sched Examples](reference/dtrace_providers_sched.md#dt_ref_schedexamples_prov)
         -   [sched Stability](reference/dtrace_providers_sched.md#dt_ref_schedstab_prov)
     -   [SDT Provider](reference/dtrace_providers_sdt.md#dt_ref_sdt_prov)
-        -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtcreatep_prov)
-            -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
-            -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
         -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
     -   [Stapsdt Provider](reference/dtrace_providers_stapsdt.md)
         -   [stapsdt Probes](reference/dtrace_providers_stapsdt.md#dt_ref_stapsdtprobes_prov)
diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
index b4490401a..735b7b2c9 100644
--- a/doc/userguide/reference/dtrace_providers_sdt.md
+++ b/doc/userguide/reference/dtrace_providers_sdt.md
@@ -1,46 +1,20 @@
 
 # SDT Provider <a id="dt_ref_sdt_prov">
 
-The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
+The Statically Defined Tracing \(SDT\) provider \(`sdt`\) gives DTrace users
+access to the tracepoints that have been inserted into the Linux kernel source
+code and are exposed by the kernel tracing system
+to designate semantically meaningful points of execution.
 
-The SDT mechanism enables programmers to consciously choose locations of interest to users of DTrace and to convey some semantic knowledge about each location through the probe name.
-
-Importantly, SDT can act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `lockstat`, `proc`, and `sched`.
-
-Both the name stability and the data stability of the probes are Private, which reflects the kernel's implementation and should not be interpreted as a commitment to preserve these interfaces.
+The tracepoint arguments are converted.  To access the raw arguments,
+use the [rawtp](../reference/dtrace_provider_rawtp.md) provider.
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## Creating sdt Probes <a id="dt_ref_sdtcreatep_prov">
-
-If you are a device driver developer, you might be interested in creating `sdt` probes for a Linux driver that you are working on. The disabled probe effect of SDT is only the cost of several no-operation machine instructions. You are therefore encouraged to add `sdt` probes to device driver code as needed. Unless these probes negatively affect performance, you can leave them in shipped code.
-
-DTrace also provides a mechanism for application developers to define user-space static probes.
-
-### Declaring Probes <a id="dt_ref_sdtdeclp_prov">
-
-The `sdt` probes are declared by using the `DTRACE_PROBE` macro from `<linux/sdt.h>`.
-
-The module name and function name of an SDT-based probe correspond to the kernel module name and function name where the probe is declared. DTrace includes the kernel module name and function name as part of the tuple used to identify the probe in the probe description, so you don't need to explicitly include this information when devising the probe name. You can still specify the module and function name when referring to the probe in a DTrace program to prevent namespace collisions. Use the `dtrace -l -m *mymodule*` command to list the probes that *mymodule* has installed and the full names that are seen by DTrace users.
-
-The name of the probe depends on the name that's provided in the `DTRACE_PROBE` macro. If the name doesn't contain two consecutive underscores \(`__`\), the name of the probe is as written in the macro. If the name contains two consecutive underscores, the probe name converts the consecutive underscores to a single dash \(`-`\). For example, if a `DTRACE_PROBE` macro specifies `transaction__start`, the SDT probe is named `transaction-start`. This substitution enables C code to provide macro names that aren't valid C identifiers without specifying a string.
-
-SDT can also act as a metaprovider by registering probes so that they appear to come from other providers, such as `io`, `proc`, and `sched`, which don't have dedicated modules of their own. For example, `kernel/exit.c` contains calls to the `DTRACE_PROC` macro, which are defined as follows in `<linux/sdt.h>`:
-
-```
-# define DTRACE_PROC(name) \
-         DTRACE_PROBE(__proc_##name);
-```
-
-Probes that use such macros appear to come from a provider other than `sdt`. The leading double underscore, provider name, and trailing underscore in the `name` argument are used to match the provider and aren't included in the probe name.
-
-### sdt Probe Arguments <a id="dt_ref_sdtparg_prov">
-
-The arguments for each `sdt` probe are the arguments that are specified in the kernel source code in the corresponding `DTRACE_PROBE` macro reference. When declaring `sdt` probes, you can minimize their disabled probe effect by not dereferencing pointers and by not loading from global variables in the probe arguments. Both pointer dereferencing and global variable loading can be done safely in D functions that enable probes, so DTrace users can request these functions only when they're needed.
-
 ## sdt Stability <a id="dt_ref_sdtstab_prov">
 
-The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
+The `sdt` provider uses DTrace's stability mechanism to describe its stabilities.
+These values are listed in the following table.
 
 | Element   | Name Stability | Data Stability | Dependency Class |
 | :---      | :---           | :---           | :---             |
-- 
2.47.3

