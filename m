Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC07630FC36
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769470923; cv=fail; b=VVQMaffi+gQOKEirSSzpc/L6QRzmzIvc3YqUdiPYVcYxTHrcxy6VXMClclQN70WiCY4oOFDSMjJwCKaW5WyWvj9zOOJPww3Hj8BG34cFfJganjqUl0tK0D3RfKjLLEK341mOQZqpmQq9mneKbHUoyAzCQEsPszlSwX8q/K+EIPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769470923; c=relaxed/simple;
	bh=9mP3OKOjhnYGDdVEGmTxI6sMxvAIcSOn0nFtQU8pMII=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OZSf+GpzxBuxVCEbqmT4PCKRwrnhx4ged1xeNwFrz+kv9ke1MHgtVFtyVuJu4NG3DXvzlDDJMBs1hT9bDei829eBIBNQQnjgBf9cEVuG/cUsQ2xujNVSlgBJBvnEyTkFqtQLH1j7S+0MNDhG9GraqiOLpkVurBj+ndjebov4il4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NZMcfoAc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cqjkIeHE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NZMcfoAc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cqjkIeHE"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60QLbelj178104
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pmStOVGJ4d7aYsNei/
	jnQB7ueNvxT9ihmL+gVeF6BT8=; b=NZMcfoAc4KRlsLaLpFGIkCuNK5n5xwxYEq
	ijDl81Cz49SDW5tE7g0EZuR+/qb1YexthcMk9ABvIjYqhZnPiINevcBKIIgCfwaV
	Ihik26xEpIJbLZpu3zKZCo6obuZIJOLGxCw/BYfhOXbLJs2p95Fab5IerLXENwLt
	qRKsPnieZtQhqSrQOHrQUEKYjbrQiaB1RO4t+X6hmv9pge1Gmg959QgXxFRE/pSq
	URoFbe4+yxZaxSWMXb8FbwoTAUzgCoeGp2qLgWkTwvsPg8IGWz9ucC9OQYwaFpHh
	+aoOBwPXwgRSXiuCv9Glgo7qJ6oROOgozfi+KA+EYnO81PqmSa2Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bvny6u370-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:42:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60QM6URJ010703
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:42:00 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010012.outbound.protection.outlook.com [52.101.46.12])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bvmh8natn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 26 Jan 2026 23:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReDH8pxhoFNncql0R+XXxTBpDOewakTD8WVraJ4ONMHt32jDgKUdtAp4PFx54TbHYw8AhSK2RHNcKLvb6Z2Akkn1bvyMamjI0qvNb875AMY2CcPWkUvpCsIwJcViKYwCt4OVS18zxPqGTOQYsXINGCRLxY+eLzOSoQOd1+gSxBwHPP0OPJM1PFL2HLjrPVB8wfPq1PgDM2jn9fE2dxkV0PwrAlSigI7P10yYQXJVYKUMm1ElZApthG9Wudtx0X4rtjHc1v8sStCJlOL6Tdek9YqY41kgfIdKK+fgmkPOFkraSLMfHiKz+IpjIHJiZ+vBNhM55KFoVGTr9X0ZMt+9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmStOVGJ4d7aYsNei/jnQB7ueNvxT9ihmL+gVeF6BT8=;
 b=pcZmO0KYDggWe4u5ne38/Mmfh/G9eZTcsXdfqgAMCc06WX2kztVBcPZz6OKRQ34bl472tZdTPQ9Oi282YLhK/naoYdY0Hx/faJEzAmPk7TWQfZTgL6LHSkSrKxpCfXZHg/XQsuQXZk8qnCNx2hWm8XUCPbYOz51n1aWmSpwJczQkqUsHzhw14OAfh/lDdO0aJziBPPBuh9jp0o9MnLS6m3v9M95ilJZpvrMy/IUEW18GRe73Jk59GFWKBx1mydiHpMWxbiQsJ/PJLbocynHectM0aBhIrIHNn0D7U3eCRZ28DPxxAODglByl06HnVcsdMllay/WOL7Xh/KBvxv2iig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmStOVGJ4d7aYsNei/jnQB7ueNvxT9ihmL+gVeF6BT8=;
 b=cqjkIeHEcJpKcIwtGOacGXOWyPL0j/DdkABlScFI8x2n8PxZTyN4v+4Bk6WFbS7ATq00PvX5uxLh4XBx5fZ3t4Sr5T7e4qlCu77LZSDMkDn5Vbz3+p8rvkv5Zaip4JNRwemVrbEkrLtqfEYAfCJpSIM091bFxTINuLgXYGTAtgQ=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4369.namprd10.prod.outlook.com (2603:10b6:a03:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Mon, 26 Jan
 2026 23:41:57 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 23:41:57 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/2] Update NEWS and dtrace.spec for release 2.0.4.1
Date: Mon, 26 Jan 2026 18:41:50 -0500
Message-Id: <20260126234150.20939-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20260126234150.20939-1-eugene.loh@oracle.com>
References: <20260126234150.20939-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:208:32a::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f63211b-eeee-4cd6-9ac8-08de5d347e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uGK3fhvaAiDHNV9Hr9S68DUUSuNxy6TYsIohmwhc6mKP+HrNudUfg2Vx4yir?=
 =?us-ascii?Q?suwJieE4EXQw/HRGH9ZzO0q25zkA3YaX2ZJBoKIljIblZorS5hlfYZ4gqMq3?=
 =?us-ascii?Q?U3rSqMJo+J75BWVBH9luVFKKwL6UuZzhL1kpCIumTPUzHP9uuxU4YKCq8uVy?=
 =?us-ascii?Q?oXe64FjVbkiUMnk6rHG8YzCrO+0S0AntxysjoV9yAscHYDJk4BG571cirHKj?=
 =?us-ascii?Q?KjfIZyN1I1NuE0bMq4EX0GOmUiViUoicED7eIXEdfGzMsKBgnJZIvwcU9VHl?=
 =?us-ascii?Q?6qkwvVu0ShTmqsRo0o4YiLh5WLPKJhRSFhlkoEWU6YX305hnI3GP2ndyTBN+?=
 =?us-ascii?Q?L8DNE3PFzeMuubToGh8rHciSBPpeIZYMhmyAf4w14A7XIZHTelv0GckZ3MUh?=
 =?us-ascii?Q?Ci/LeYT71rLwvBDAXSf0LVQGUgk4EF8N/JggJNpMltxz7Hm8etgQYVQ2vtGY?=
 =?us-ascii?Q?2EQ/f7ChL10lvcjGyEw5PMVIKUZN2OQUdCw+WYPilpAMMeem+ZrC7Yje2ZH5?=
 =?us-ascii?Q?VsAijfLYZyETTLgrCyDfIRgqcIiTuyx2BG51Cu5CCmMgJSw3+g1aSXTLNn0p?=
 =?us-ascii?Q?cks0LqE0ZqBXwba6hf0MZ2lzkyg8Gq7UCLQcdd9mefdyzrxWlI5FFJAuu/XK?=
 =?us-ascii?Q?lqLgOh8P/YXdQoHkaoxVB5YQlmWGz6bjnGjymQaeUUlRhlmySMSAygeA4DAx?=
 =?us-ascii?Q?SDINx6hILlY52n622A9JE88IUAVpZkCRCEiFO4NF1xCJXSGREg2t4Cwfs+2X?=
 =?us-ascii?Q?tAjwqJKwsWjHSjkQZFdmaeRexvQsrRAfF2V1TbNJJdmje14FufPhJoHv9+E7?=
 =?us-ascii?Q?MSg7uZQ2CEri64xMGQ19JdeIDCMtAUkQkiFvrpdWUoTkwlVeDpdKvMjMGgoY?=
 =?us-ascii?Q?zZFCKe0/qciee0rssq9A7No3jKwmb0rbrVEkV+R/dYGOxjyrR2e7BnRlUhw8?=
 =?us-ascii?Q?47MGFK/GRsQSPYUPHl8zRUEYXlHwtP5ygZE+Q1K35rp7Kh4fEMSP7KFUkIY5?=
 =?us-ascii?Q?8XeRbydf2+dLfxqD5xnKQQ0yRVDSsibkVQxup0yWiS5BEXVIa///gj/CheR9?=
 =?us-ascii?Q?bhrSZjnMsZYqAC81bI1JRr5glZK9YTgsMNde9rZYV2cuk5mZYmL3WLTN0LIN?=
 =?us-ascii?Q?1R+Rjy9VpuU/90JPGZyUt29bCixirmub7RIJZ4gxgkbfldcBhwQdnCCrOeac?=
 =?us-ascii?Q?cxUEBFqUyi0CYA8DwzchL2tAH4ga4APo6mNbozD5iMjWfsoTcahnwVXREuYc?=
 =?us-ascii?Q?OQOXiwneaAuGLONxHCLR0rlZoMXotJ9DRy05bEho/GknRnOWnPuWvWk56qAv?=
 =?us-ascii?Q?e0jZe7JDxBDv7bTOH6AxRiK3H4LgON9y4RTVNpTOCAIIKHpQNvhMbxHJnrbE?=
 =?us-ascii?Q?1nlG0A+E6FnAHYFj/Kl4VzZ2Eu93B1YE6+weblbkIJlR2dRcXv4dubMn/Y+Y?=
 =?us-ascii?Q?QeqL6yeRt8oquxiPxcxFpOU37qOGbfYIqPIK8dZrmAzp66WfqHEHyNIsfJ+W?=
 =?us-ascii?Q?y7g2lStjwhuIF/5pCOMONI56CyQZUnN/ociZdnkR1u5cbqySk/iuffGMudjw?=
 =?us-ascii?Q?jc2FXUBxdk5nGskrKa4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A+qhYzzitdPpqeSI7RuOFjfhj0FvbSXhaV1d6vxaqN9Khcs4b4jQ+mRV/cZc?=
 =?us-ascii?Q?fUoFEj2kf/+xx6ClaKAJKW5fhoK2DZz00avQQeC9BZd6P+Znyw8jKPJhQcLp?=
 =?us-ascii?Q?OvMqINywBO0oDlWkgeT35i0pK+tKViU5v/rzjCdyaMbM/TXfPizZ9UUJSOeB?=
 =?us-ascii?Q?iry0D0fiqx7QEJ5i93dDqNjcSNta8S1GWY8a34jeN6Z1A2BBfeAxyyeF9u/c?=
 =?us-ascii?Q?0RPsTzmACJpdPHZosA3HwhVjoe9dQGA90S1+g3lrtWcZB4KUPvTCDfGnQync?=
 =?us-ascii?Q?hjO7Bh9p5w6KJD/br01aBH+6EisRX2LcniM9YGfvi50I32dk5qa6/pZIuF8W?=
 =?us-ascii?Q?hGB19rZfk/wu4wKagt00Oo8/nW1T3Gm/qnE5jXvrIzYa6X69VaA5LPiFTNtr?=
 =?us-ascii?Q?uP8q8YAtt0ezjMzuk2p2u8HzryQzxwAxK7nL0iGIMyr5D6A+rFqCZLkzt2Xs?=
 =?us-ascii?Q?qo/enTQz0RTDsixmCg2x4ooGTX0yTBHeA6uA8BMmPvhPykpRzs0tbIZ1WmJ/?=
 =?us-ascii?Q?JKWr9VlrFrkzDVQkSzl0FNxGuTHYfJutf0u7CabXRwD7zxCDjGc6V2r/TLb1?=
 =?us-ascii?Q?aqxsTd2JKcpzYppQUNAXOFXNpyKu2Jj3vvN8Mc5PZhRe3RF+xECtNylsZlIu?=
 =?us-ascii?Q?iI6eoCHK9XMA4j0vy92GUPfqEpecPTZ4IR1ncFw08xBmpoSt3n2JPWPhiHrc?=
 =?us-ascii?Q?qe7J+LvH2ST0qHGlZ7qX7A7qHnBKTkbrxfNtSUlTgkRo7zxQBbROolaawIVQ?=
 =?us-ascii?Q?V+QXON1rPnqtl9g3SgKgVeWWWa9jMziFUNOWBy7wdA0XE8+0AEJH3FkQPbdt?=
 =?us-ascii?Q?GCO0wC7JTDf5yJc6D36C5bxrbes4U+yKRDutTlOduba9bQq8DqXAwpGIlH1D?=
 =?us-ascii?Q?uDJIE5WHjXrwxBlYT4Gl4PUB09acQPo4nxfozx1TBDhT4m1AyLiUKDZ0unX0?=
 =?us-ascii?Q?RTT1NIII0KCfD0rUmGcezzeHDuQHTjveZ/DrY/VlGKfIhpt7poPOmahGMUlh?=
 =?us-ascii?Q?50G8Irhb8t7nAUUrUHgG+0vTy1WX1i+Pr4HfsfCbVo52rnJdBs4MfhxmHDqa?=
 =?us-ascii?Q?bc4jgVEDSHrZ56iCPdAhQvt0O/jALiDYlKwf7vsSw93ZvQWmqDKD97VcimMq?=
 =?us-ascii?Q?e2f4Og2bWwwM18DbpdmGajTnhj48QGTML4XCxy1Ao/IbVnArpUBLecDTUNM5?=
 =?us-ascii?Q?TKto8FPABZuxsZhulCg4UsV7xkRg5b7uKT9DqNBJN34hMqb00ya+kuLp8OcY?=
 =?us-ascii?Q?ZVtt8/zsrIUgbNCoYjwUTFbTTqlPKFW5CHybR3R0/v1OZwwL8pan9avpL2Dx?=
 =?us-ascii?Q?Aj6t3JUp0izhsqRnj2b/BO/++lv8RgxplDNuGcEdEqJn22agyfXQ5lVLs3Bk?=
 =?us-ascii?Q?hMUn2+Yi/g/7xlWt30b3YjZ43DLRhqxUM1gzjwdA1D1X+dxaVIqu8BBhn4Cp?=
 =?us-ascii?Q?oQYXd3FC2YNgZ77uqyuDpd05Ax80vMUfYVUBDcH7p/FS/giE42Ha2xyUmm/V?=
 =?us-ascii?Q?ozvQY0Qs7AU9s0W13LFmdrOxBqFjtfxDnM8GVR9hPA6G2bc6IVo2m3OH7VpU?=
 =?us-ascii?Q?fL0EJu5HLHdybLAMbOuvZsqfL19OAJUZRlNCJwHwAd/9qieZn+e4pICLKhWG?=
 =?us-ascii?Q?pb4TLUgSJsf1AP5Wk6P2YtPuETSDa2MtOSBevUlD7VQEhWNzpEaDL0s8U3zg?=
 =?us-ascii?Q?2pSIj1TUHu+K2Qpr+lgVtcxPg2m4SvMeI/PZCUYfypD7KYPWGXEOtRG7w4Ev?=
 =?us-ascii?Q?34sieefCNQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MHHouO4BvLGg3ZUkhh26yZjRPSr1//k1ML8+f5MrLns+ukcgv4qeWUikAjFeyntNRtHFip+xr2LSi2YivnQ1fQVI3SHOCwxJkhRDe+KT9OgJWpYdTX6KgYAahJENixRRQESX0trDnFmPENEdGPRuggmEp2e2fmwI+qaL1LmA1tPNT0jfSZ7Sic0tDupwfmPLIWm3btNEoKKpCkBXXZNp++QBXyo2MqcNg6L2MmNFnybI8xyi/4BY+GOyrKCcxXM5wOx3gFEaN8a78LHcZ8fF5mBNeEvxLjzJce5utR5LpQn6o0jVflsjCnKwoDyWJ4q3qUGUTZYzGhTphPBcHqdnhokonWKrKp0s8vxtbTIA/AG5te+x8hemC6Z28SJYSd82mULQKHlGNn7jI1H7+lOhvuKhcyunUP871IfmzvZubPbORcQiKT6ZabKQS6xPF0Kkoy0lbMiIEO65cTCGZlJHkie17uqjDSCbYBDDvo5PfnIBIwu2b4MGuQryXaz4dVPabuHBv+ToC2M7GvfAhXqmvjxHVYGBNzo2OmjsLJKckIr4mJin8QOzDmHceOzGGPztUXi2DrHJblAtam0U6KGc/2Su6/xG1nOQi0yae6jKbSE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f63211b-eeee-4cd6-9ac8-08de5d347e83
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 23:41:57.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6i8xUbFGWq4E9Rw/sLsIb7evTkS7l1jWKMrnM1v4mG7sugGgzrqhIYJ8LkdL/fTPfjD6QZqhRdLyHlKPTSmbZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4369
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=78
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2601260202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDIwMyBTYWx0ZWRfXwu8ngn//8eXb
 GrAHbZ0yYgPi3FilRf6GTFkcz9IkfL7Jy0Gajp+YfgYi0lKSROlMpJ5/AyqlsAV9B2yakoY9pPL
 YjTKPDbiGjDxpLZf5adJVWpndTXMtJxrP/IkhmPGhLisL42OCNXQlgQTJ1UqGGiO3nGPh3TPhMc
 P7C5Bp0ulOwqBhqRLBiS5GCUIWua6InDjuJbeqo2owq0houfK3wvlzZGPnKYeywqUjzv86aOdVA
 no+1FNwGIx5mUyRCsAl+DMw/AlONeNsfiOTv9GjGYQ8fn2coF9mqIWBCIwyyIwJB2MyTCXAm4hQ
 eQ0k/3xDzgaLaDGwH4MM0a+rsbdlQGYM1P5UNCBWs04BAIrBtCZO43uVpsCHArV9/wjB550MYcq
 9xFEm1gno9fyCZUziKuwXuWq173HnoDB2jyfCHr9Ad+0fJFBgqUMZieuL4XLPNJ+nH8fjPlfV6v
 7c4tfjEYTidp1gb4e8w==
X-Authority-Analysis: v=2.4 cv=C+XkCAP+ c=1 sm=1 tr=0 ts=6977fbc9 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=joLYzhxoQ_vONn_MFvwA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-GUID: jEDJG-lTX_YpI_fwY9Lhta21DPCL1QYa
X-Proofpoint-ORIG-GUID: jEDJG-lTX_YpI_fwY9Lhta21DPCL1QYa

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 NEWS                    | 57 +++++++++++++++++++++++++++++++++++++++++
 dtrace.spec             | 15 +++++++++++
 libdtrace/versions.list |  1 +
 3 files changed, 73 insertions(+)

diff --git a/NEWS b/NEWS
index 48ae0bdf6..9348c01e1 100644
--- a/NEWS
+++ b/NEWS
@@ -1,3 +1,60 @@
+2.0.4.1-1 (Jan 26th, 2026)
+------------------------
+
+New features:
+
+ - Implement PID-specific uprobes.
+
+Bugfixes:
+
+ - Allocate the buffers BPF map to fit highest CPU id.
+
+ - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
+
+ - Fix prvname so that both rawfbt and fbt probes are seen.
+
+ - Do not convert "__" to "-" for stapsdt provider names.
+
+ - Fix printf formatting with non-monetary grouping chars.
+
+User-visible changes:
+
+ - Discontinue -xversion=V as an option.
+
+ - Support non-libctf environments for tcp.
+
+Internal changes:
+
+ - Fix some memory leaks.
+
+ - Refactor some code.
+
+Testsuite changes:
+
+ - Correct file permissions.
+
+ - Add ERROR clause to prevent hang from runtime error.
+
+Documentation changes:
+
+- Add the DTrace Tutorial to the git repo and install package.
+
+- Clean up formatting.
+
+- Add missing documentation:  trunc(), stapsdt, usdt.h include path.
+
+- Update sections: unimplemented functions, sdt provider.
+
+- Update LLM context files to forbid "if" statements.
+
+- Update README.md for RPM info.
+
+Build-time:
+
+ - Clean up .spec file.
+
+ - Add testsuite dependency for perl-Net-Ping
+
 2.0.4-1 (Oct 24th, 2025)
 ------------------------
 
diff --git a/dtrace.spec b/dtrace.spec
index 58925aeef..33cd4eb6e 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -229,6 +229,21 @@ systemctl start dtprobed || :
 %{_libdir}/dtrace/testsuite
 
 %changelog
+* Mon Jan 26 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.4.1-1
+- Implement PID-specific uprobes.
+- Allocate the buffers BPF map to fit highest CPU id.
+- Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
+  [Orabug: 38776929]
+- Fix prvname so that both rawfbt and fbt probes are seen.
+  [Orabug: 38842114]
+- Do not convert "__" to "-" for stapsdt provider names.
+- Fix printf formatting with non-monetary grouping chars.
+  [Orabug: 30430270]
+- Discontinue -xversion=V as an option.  [Orabug: 38615307]
+- Add the DTrace Tutorial to the git repo and install package.
+- Add missing documentation:  trunc(), stapsdt, usdt.h include path.
+- Update LLM context files to forbid "if" statements.
+
 * Fri Oct 24 2025 Eugene Loh <eugene.loh@oracle.com> - 2.0.4-1
 - TCP, UDP, and stapsdt providers implemented.  (Alan Maguire)
 - New learning materials:  the User's Guide in Markdown format,
diff --git a/libdtrace/versions.list b/libdtrace/versions.list
index 8d858f0bd..29c95dd58 100644
--- a/libdtrace/versions.list
+++ b/libdtrace/versions.list
@@ -66,3 +66,4 @@
 2.0.2	D API 2.0.2 Linux (BPF)
 2.0.3	D API 2.0.3 Linux (BPF)
 2.0.4	D API 2.0.4 Linux (BPF)
+2.0.4.1	D API 2.0.4.1 Linux (BPF)
-- 
2.47.3

