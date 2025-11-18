Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672ED2848A1
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483893; cv=fail; b=peboiZsO1IN5LxURHzFGvYb8aXM5K/Y1aKzMN/XpsRqHoW7kn9VAV4jmowJVSqF1XRDxmfOQBh2FoJQlF9uzPIalz2mzEaqqXf0LaFskhmVht6W9/rLBCSKu9nVG9Hh4j0DgnC7kfHml62dWkRl0miTBDN4J7T+Ug5FYlNk3AZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483893; c=relaxed/simple;
	bh=6rU+C9t4M8HY6WEsPpkhdnOSIJZJ9YX9KHq+MhUifIo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=a3JMb27LPPTXUcYmOO+YWh94JYmewV3cnqFwDW+Dt5zQNfChycFNiuwwH/vHnv7D3oh+OxF2uZdoNfNw4tziC9W0cRSuInbBSngkRnXvv5q9N3XSfstzJZnJPJWPfYWB/G52HzHmxpHPh8A6PDMZ2YL/4NRL3tNQbB8ZBDQ3ucY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QQXZHkWQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CeAv7OwX; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QQXZHkWQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CeAv7OwX"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIDSjJF023111
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=pBV4Ethywq6dVnB4m+uwY0yc6GpR/ROJJtBvhbZWJcQ=; b=
	QQXZHkWQ2bwlqaXPIT4z4qcWmEP0+MyE0FX3CGGT9erzH2ENbBebib7TBgZBc0vn
	Jr8Mn1dBN6E5ofzvg93AQ/S2EHmbOupPo9T/z0F+q2AXClMejwW+cY+8FqlexXoK
	6+THaXflnEleDeLpj07am/RujQ1uCB9W6ivDnqiJKh9pXf5NGCUXWQOYowjYpPl0
	pXXIaCoLFR+ni/usbaBgP+c0BUUl0+ecU0K4ieqa6ixa9PbnWO7L7VkSv0vPvegK
	oLDUf7SFioHh7MP/P84qxn7KKMxr3tZqCjFE2UzyavEzw1saLknNvwnJXc1HpD5P
	w8V7TEIWV/psPu8zJcEB5A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbpw7c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:09 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIGXb8n007744
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:09 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aefy9cqwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 18 Nov 2025 16:38:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqHGP4I67rja+eauA2kdI5kMBPnGffIynOi191UbZX1gV8THgws8zhXGihn3bbOyIkVIZl+hbVyycIYDoIbqTkfpb6Csz8M4Uj7qsnX1Qu/mKT0NIeyr31AoBfF6ZGv+TwPZjIFDZ5WG03qzQdvfljAcZPHq48q/beolSuTC0lrrDcjGcYvLYPwNNYbfKBC7LZJfqrNxFr7SxbmASUcXCCIIiKWMT3/jOtMw8o7Et4Kq/wBKSUiqPXdBIDTlya8tCdmGjqF7NEvdPiPfzBoF3/DIhtm/+2u4RbryAVA4tVLiA6E9/BwjcRvbblOURsaVB9DH4AwVR7vaymhvZPKwtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBV4Ethywq6dVnB4m+uwY0yc6GpR/ROJJtBvhbZWJcQ=;
 b=iZbfFBAUcvhPfvkNqey4/eRPoQrB8/xAhUPLVw9llvP5/BkF3V4UZFGF5V6c559zXKSlTPeSyi5hcBwY+fASRRgNR5JZj/uQEz/dYmDoAaWmfxr5t86+IvZ6JuqcHee84icsR+6Bk5yYLMnLUaWQvOBvz8Oh8KmBNxZWU8X0L2C/TNlQD+f74q/97kZvSf4CIpYYQqemXUy1X/LMFH4hqxP5pm1JHo5/SqyTssLzM7rO98iNo87NuHYFkwldsDhjWC2Bh6mqv06EwX9x46Jp5l2v7mlx4OC6NDBBfh2jMFbB4SWPi7cyh5CcnUBbbiN0ioO8x6zVCqALAsosFFtXKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pBV4Ethywq6dVnB4m+uwY0yc6GpR/ROJJtBvhbZWJcQ=;
 b=CeAv7OwX2uSXzdX8dfZlHOeNGW07oiCp8qlwLt2qriUiPm80tTiqVtHVfhnfjLKqpcnl7nu71CLWbLHRtr1WXUENT6WW/QNoZvJ7Gasb5Jib+LYFjMBhW5cS1taniZO5e1xfjnGShT1q56sNIknvXaoHCIQhtiG1PFrb6oI1x30=
Received: from BY5PR10MB3987.namprd10.prod.outlook.com (2603:10b6:a03:1b0::20)
 by SA1PR10MB997631.namprd10.prod.outlook.com (2603:10b6:806:4b5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 16:38:03 +0000
Received: from BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf]) by BY5PR10MB3987.namprd10.prod.outlook.com
 ([fe80::82b7:1510:8197:f7bf%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 16:38:03 +0000
Date: Tue, 18 Nov 2025 11:38:01 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 3/7] test: change test trigger and timeout
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:208:36e::15) To BY5PR10MB3987.namprd10.prod.outlook.com
 (2603:10b6:a03:1b0::20)
Message-ID:
 <BY5PR10MB398794446C329C4801E32D86C2D6A@BY5PR10MB3987.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR10MB3987:EE_|SA1PR10MB997631:EE_
X-MS-Office365-Filtering-Correlation-Id: b71bfb7e-169f-4d22-c5ce-08de26c0d7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jFhaDu9gBQphTRDkP3Qvb0CrnmkHkG39uGf+vfh5JdzOB+pxH5kPq1T0iMxz?=
 =?us-ascii?Q?he3QOGuHiZtTfcESTpPtG2/DlJ7bqTL7m8DH+WjGZY6Kd5F9AfSLQtNubt8E?=
 =?us-ascii?Q?w0siU6hEiOUdOcwRNLBB67Yc8P+tOXdBtfAAhLPlqsK6nXyqxjJsoZxmkWsQ?=
 =?us-ascii?Q?pEPr8Zax0u2pAb0TXykuJgX47ddAY3mJFls9Saf15g8RjhQIMgb5Lx0jlVCB?=
 =?us-ascii?Q?NltWJ2QD2Y4oOV68JVw/6AlmxyvSMr7XMsJSQld44OGVFdGE3/n8cU3KvleK?=
 =?us-ascii?Q?/IleFqOH1okgbcAu+6mhXPFQRo42dCHuvimA/uiCFpK4xTxqQrL6FBAQefPN?=
 =?us-ascii?Q?sSDReXpq6LRd135cCzCjjy7+P6XJJRzeQ8sB4OnPbBycB4HBy04ZTzQqjibr?=
 =?us-ascii?Q?Mbqv5gwAFANkJvvglLXtKWzGZBD+UK1B9FeQ8MITNMJs8FbZ3FBhtRTQYcSR?=
 =?us-ascii?Q?MJHR5yzGdk//Phlb9MvP35F7H68F3sIWbwR+FPKy/L4UdDXHZsZ2m50BbIap?=
 =?us-ascii?Q?yNC9a8LBMHP07mXbzOkdMp3QjZtaUQu4M/7qGIbEVWMbLqYv9pS3ziJW0B/M?=
 =?us-ascii?Q?skXS9+SMnE4yH3e0I1UyGMoZgVc+EycyNYujEqfYJHhxel73FbYeJY0CvqWW?=
 =?us-ascii?Q?N8+z0w3QHnATJSwacf/sTEJnSB8+/37MJwLgrtVvd4NotjVlEIeI2Bh1NvAa?=
 =?us-ascii?Q?6OBukPPBxIyU0hHaTbZGZARW1KLuHEFIYqwxnveAkfBnrFuYpGfGJWm2MtrG?=
 =?us-ascii?Q?7kPvI+qejerV9eLiNJO9XpMRim6WYKlNJ4yUp0Za3ZU9ykJtjffRZ6X5hURP?=
 =?us-ascii?Q?UizCcJqpJSNNskiuNb2kHiTzQJbph2vJW1W/lt3IG1cjzeVzeU41qlx3BoHz?=
 =?us-ascii?Q?wfQ9OOBRRdVuNfl/Ci5ik0Cr4XNMbu03korAocnJXJ3OSUaAVaERVJx5UETN?=
 =?us-ascii?Q?BSRADE5Sd6jLHjlbZK/3FxQe+sW724HJTM3BIKSNTKnBDgh1XTObxIjrrJOv?=
 =?us-ascii?Q?NqjyKHtfbD4jBooxLgzdqNog14T2FjTacJJrqAMfx0j8tvGNdL6tQFj1Yrcr?=
 =?us-ascii?Q?KQhu3hC/j3eH9nZgj360nLTJneiobNt4ipofcvY3i+HYMkiKNsgqsZ0OkLJ/?=
 =?us-ascii?Q?JcycjIwwJY9xHDGcQkvMBxspENOQW7XpxIClYq2JCO54AChIuX1LBEYUWp18?=
 =?us-ascii?Q?iLaaVNXy3lpd7cbAbYS5X3n4Hi9i0OoBixnxMS0YKsHquwPDORhZA3zJ1AdF?=
 =?us-ascii?Q?LGdVSUN2qGoTZdc6mJtT+TxgHWNVcoqdfKIzwjoc8J3WXBvl1drEotvQeCAE?=
 =?us-ascii?Q?T2jkDKGeP1B6rsmVGT5BoyzCRzdi/eawDAKN4iWTkK1cnLyIGudJqCvfpaM7?=
 =?us-ascii?Q?cJuOPzCkcWGy8rzAGgByHeXD8W+rPtitJETcbAn/in9aeRhFSeEEimk8YEXb?=
 =?us-ascii?Q?Jl07fDSsZqMZEkg86/A9eUyWXODPKHZh2KgWjhgJHtRw2JqBIgdjYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR10MB3987.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VQedU5AJE5ZKJj2E6P8wR6FB6bdaGEcsB5AktcwehSJJTNNdJGNoJKH0DmzJ?=
 =?us-ascii?Q?2MZzIZcGRYPT6dMQDjoTzLA681qdDYO1Eo3tlvQiTHbZFJBBMCo42Jj01Ywi?=
 =?us-ascii?Q?NBy0CnB4J1Ke7oBqMRBycBlozCNOUpyoAdnrX1XMjsa7FPq/bkVZ93+7I1q6?=
 =?us-ascii?Q?eiYoVXIn+TYGVKj3nHNkFZ4FZmop32l6vUlHFTx7RHFCAyQ4vvkuTtjxHbPR?=
 =?us-ascii?Q?m6JSOA6RxrwXESZWdinj7+ylo4XfyRjp/1/ocm7yMOBxtjKdvE2k3BJdZ4kK?=
 =?us-ascii?Q?rItfMitXzhJchC3nFlY1InUGps1gwL9Ik0mUYftKhn356WL/N23IJjCP8BLx?=
 =?us-ascii?Q?aqGXd1/o9enEsZx/tdpTENwCXxOxfyUHE75QYYyY7RcgKMx4cQJCfEQUBEWU?=
 =?us-ascii?Q?82xxQfLivDhUl1ajBYjDxFv64BYe6Wvhf1ljV8azkSZL3e3GeMaOnuMcTlCA?=
 =?us-ascii?Q?iaKeQPRF4o6l4qkDguQoYIujEC5E9e4ebYNVjmOhgoJck2GKcOpkBjUX/ap1?=
 =?us-ascii?Q?sgMpRG7bKOb5coIomi3B/umzwInNX3Hgr7xvJRy20d5DhGt+v0yULKiSWDBN?=
 =?us-ascii?Q?qlWtNCo1tNB3YcI2DKM4JffLkwyfrQNs3STiyCm9uHPWDkqcPtn/dsb5Fh2S?=
 =?us-ascii?Q?AU1NAUeXLH30WaGGQa1uqu1RX+MZe2k+A4DQzXVyty3bGrkpSQZXuYc7vTO8?=
 =?us-ascii?Q?0zXKAPsEKemYZ/nkrFo/eVJEyVNq1MhL22w36Dag6ml3d8mLn4UcvfWasAhB?=
 =?us-ascii?Q?nPvzd8qOTqE6hmHuVPNRsCI3BYSOwMgWTT3KQkTzQJ7LFTeVe2NzEcHBa2PN?=
 =?us-ascii?Q?RYC4SEFwf8w0AM9rjMLDTNAE5E49jiDXRocgl5Zl9ii5J1O2p4Qe7rE/kq6h?=
 =?us-ascii?Q?fQ7PQ70GY3DaHrw60sj9W/LtlYSwWpTvekWd/umewKEEF8hWhLW25q+0ngXO?=
 =?us-ascii?Q?Ne381+mk+K18bq6VMwR22gHthHVdaisavJ+VoqQxL841zizeemLb6Br+3u4S?=
 =?us-ascii?Q?P44pA5B+6QAEDAnnRmTbuABVP2TxVw05NZ7Iiu9OaeKo6Pzfg6f8JfkwAueb?=
 =?us-ascii?Q?uOQBC5Ewn6pl937hsUUet9r4u2L79L8+w+a5ZMOBW5saAhyov9vj7kCmtylb?=
 =?us-ascii?Q?kgb+DnLI3WO/15DFFNTzpJJJ523K6lDZgCQ8oqFRii1JBIBICf6wuOzD7g4c?=
 =?us-ascii?Q?lluJbdHmknCG38Ll8egJgxy41j906VWU+JczXHyCJVMWQBXuFpkpDpCMOTxr?=
 =?us-ascii?Q?PwIFsBxy6qomKEl4xzG1kQwLPkKIEM0J7I7FDesjZMjqGe0gQ0KN4KwTy6cW?=
 =?us-ascii?Q?ZZPsAVTjt6WICaxJi4ioIeAvvDMYUkVvihEu5zpMJcIOXhG1d5oyLK7dGGSP?=
 =?us-ascii?Q?8/3oFAOAA8NrDosg6UyhRO5Pvo+70Yd3SXaSMYPmw2tDJfjLdcC6QsL/YO3n?=
 =?us-ascii?Q?eeDMH++5A35fMMcrbVWYbRgrZnIW6l1nW9lyjIqHSOs/gJTshn8DbKutVcm6?=
 =?us-ascii?Q?5biawn1x4Wra/5iO52EAFcYf25ENXVBvl+OvT3t5630tE3UzsWNnKKrjkc5b?=
 =?us-ascii?Q?hYieGWGm5D8hWRx/CMg5LykHyzT5uZVaD0ffXyBXDw8coBdF4rGyBdXNT+Vu?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	BkTyCHPN9j3nxb3wUFnH93RR5IGwhjHHRpQGbNIyeF5URBXbSE1oovyldsHIOUQGultTLuipkilZ3TFGlmjLl/37Tk88YZfC+A+CYmUTFtzzerDK4JWX83uUeNkT3Ne70FIcFGdxJRA1idUYSPKT57CKtKR7hKuR3rMogeAyBE2nDSKonE1Ilbxs/HfoqqJYYQaWEfxkm92bbPYNi9wTE634IK0Ok7a4mLbm1cKb4OiIgvsmxJNeel8fD8byZ4bVEji2bYMnBx8xtc2Qn/6EyYr8gQn6cdiECNHLacc+lsfCN6c/7r5XzBZ4+blK/aMmWIxAiMRtaD53irZZGhOmCqMNuVAPyxOhn6pFrBWvd0SEspSDgbxeJIkEbtZI6g2S7XCMef4YObzo7Qx7Qj1pI/E8uiW7/HCE6QS3LDVn9+zzvhiSRfSphGHlnkXHDbtjgj2441qc8wDvDHABd0NS0iZGB3olS5xXqcHluLbNkYRZPHBIkvYYV1ReboFxCtlp/qIfWdS7KeHYHpVQGnT0cbTi8/Qh8m0QIik6Y9LEFFnM0eYbwMWAzVQF5qUznp90AbwBylyTZKRy5Dw59EG7ZwDNGFJDbcB50qNiRPRtxKk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b71bfb7e-169f-4d22-c5ce-08de26c0d7bd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR10MB3987.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:38:02.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZtHQODLp4fSLr78Xlb+OqAeIaivHIVEkWBJvq+lX3Y1k6GXacb/zKIgcGwivOk9hr5fly+dvv28/Qo3/PcMg6s5VRmxrFL+Q7BwZ9MJqLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511180134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMSBTYWx0ZWRfX7m0cbg4Wzmmp
 OH4peT38Ujr6lK8E2BO3Eu/5HJHF5DdijMG4b1sLjfG0HUvPU0+09cd9Tvj+Kl6iQie2FgfFKfP
 eqR7mfeJGz5LySMNds+zUB+oLnJb7hlKnEy8nLGdiR2VFVvKag9ePWKWCIumY2vfT7xAe1kf90u
 3jy05RjjmTxmvCPI2Drq9g5FImjVKvet0ajeiPdo2ydaGBBgUhg7bVfXEKZNnmEiVqn4Trys+XV
 K0XoUwjCOzKia5qjViXt51ijnCtLoqKmBs38TUL4ii7jCI+h/UyZl+oqkpX530l4RSHCqcNq5Yg
 rjyvmjURiBxvpo7nq2E6ptnI+d6wcWXfRUgjcr6bnNmksxtVWDkVe3APvrc+Y22X8ZP6njlnRdz
 f0gcCwRTAnAbmrWja3LDqGyBRmG6Uw==
X-Proofpoint-ORIG-GUID: EP4jppKFP8Ed1Q0GRSzRRAyCTxrPNgrT
X-Proofpoint-GUID: EP4jppKFP8Ed1Q0GRSzRRAyCTxrPNgrT
X-Authority-Analysis: v=2.4 cv=a+o9NESF c=1 sm=1 tr=0 ts=691ca0f1 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=7dDNSsGacgIAAAA81JAA:9

This test requires a trigger that has symbol information to ensure that
we can trace functions in it.  Also, due to the large amount of probes
being placed in this test, a much longer timeout is needed to ensure that
the test does not get killed by the test harness.  Premature killing of
the test results in deferred cleanup being done at the kernel level, and
while that is going on, subsequent tests may be negatively affected.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 - Changed title from v1
---
 test/unittest/ustack/tst.depth.sh | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/test/unittest/ustack/tst.depth.sh b/test/unittest/ustack/tst.depth.sh
index dec16a3a..8f99204c 100755
--- a/test/unittest/ustack/tst.depth.sh
+++ b/test/unittest/ustack/tst.depth.sh
@@ -5,6 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 # @@xfail: dtv2
+# @@timeout: 600
 
 if [ $# != 1 ]; then
 	echo expected one argument: '<'dtrace-path'>'
@@ -16,11 +17,9 @@ dtrace=$1
 
 rm -f $file
 
-$dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
+$dtrace $dt_flags -o $file -c ./test/triggers/mmap -s /dev/stdin <<EOF
 
 	#pragma D option quiet
-	#pragma D option bufsize=1M
-	#pragma D option bufpolicy=fill
 
 	pid\$target:::entry,
 	pid\$target:::return,
@@ -45,7 +44,7 @@ $dtrace $dt_flags -o $file -c date -s /dev/stdin <<EOF
 EOF
 
 status=$?
-if [ "$status" -ne 0 ]; then
+if [ $status -ne 0 ]; then
 	echo $tst: dtrace failed
 	rm -f $file
 	exit $status
@@ -78,8 +77,8 @@ EOF
 
 status=$?
 
-count=`wc -l $file | cut -f1 -do`
-if [ "$count" -lt 1000 ]; then
+count=`wc -l $file | cut -f1 -d' '`
+if [ $count -lt 1000 ]; then
 	echo $tst: output was too short
 	status=1
 fi
-- 
2.43.5

