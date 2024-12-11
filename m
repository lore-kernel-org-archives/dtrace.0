Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB598632B
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 23:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733958552; cv=fail; b=lmlS+Y+ACvOOz5w2o6d2YAouQEhxJOOebZZZtOF4aFfF/3wwXD9GlBWYVGosUZt/Ci2ZaJa1eDlAg47a35tqpEKGnrY6SFHy1a1rSjIF+awzYpyUq3QWwjBM0I4FUN8qeO46rPgL7dRWF7kcCfu0lVO0afrWf4Avq9mFjvuTZwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733958552; c=relaxed/simple;
	bh=4cmZ8WhiuoLnXOKBeJszn4N9xjWawoNll1yH/RXmgA8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=VbbxYrDSbh97VsfJQw6On3KHhxEbde9MdkjQqMqTD5Wpg3bNFB+ePxfPgNeMvLnDGeDPXYbHGDlp4nguj1m5NeH39owQGLqZuRn/hrZGC+Bz2c92d0aT/BSSjX4IBoJFLDXta0Kkjm/L3iphOdwv7IkBNhRnTeNs7VlcJAq/Xks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jwveC/mb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ELlxGetk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jwveC/mb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ELlxGetk"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBKCrFB026302
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 23:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=ZFALm8qbnLn/7gwE26daie7CYel/BQHPaDzNy7ZhX/8=; b=
	jwveC/mb5Sj2vrlBxgpPsmh3QNFNxiJEVeQe9TgTbnG62eWpuMomej6cnvEzK0P9
	k+038+EKTpiqv6bYlvobZymRHXMr2SN6iKDd45doIW4QCXOv/Us+gDIKcZzO5zVJ
	GClt9e4zcc619dVA5FfiFfGWPXpLe2hyubId5v7zvuCtPKOmPezciEQYjmGxXJp7
	ERjAezuuuNsRd2SStf1sFSVWP6j6Qjg4JYt43j6Taa7GIDdgCbgiegac3NdO2R6D
	fqPOtf6Wav5q7OBnW2P8obEm+CLbBbXDRTUuRef69AopWRfPRmBH8G+ncnDF49dx
	i9NKT+aws7Fb6XAsDsJHWQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43ce899rs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 23:09:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBLaK2q008634
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 23:09:08 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 43cctaccej-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 11 Dec 2024 23:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4CPRowpidoHVbjIjwG58fX8DKMd1SYWTLo3T0u9MOYeKCYU0+6KLyWZMKxBN7aBgeaFxK1Mw581KBjXQriN4tixwbTTrzNtcHL7lndit92DAyRjbKnU4I/cAaXWk25zQokWbBAg3QF/hP7Be07RxkKitoHJl3zAZZlKtWk/sMaw4ZYkeXl5FfSKm83MbDjPlPSvyyN2X8oFgb7JfG0Co+N5xtW4Li+rP/bTxKCHouOnMUluF/5LjwNTgdvDs3EyvGdS06gVisvjndoXGfpjg8B1+WNF2z+6QNlZ0oIQ4pHz5CWrRt93G1RyHzRh67NKUgFsfpn6h5Y0ukLGUOBwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFALm8qbnLn/7gwE26daie7CYel/BQHPaDzNy7ZhX/8=;
 b=s0MisJgKSiJ8ot/Ooyk8GOStGCR58GlOZ3geSnx4mm6Q52ROOCsXuI7JyE4USAJlcNHk3xbeLLwA5zNyMqjUMcKJGI4kFqL1d/vrKi64+r4gL8sCrUp992KiTFXHqD+Ekgg7XikjnK0gq8iTGvZPGIj4vl6w93SlrANHlCeWJiygNfydrGmxZvjsYHZOyV2GwQldwfqT9gFeRFuFg+nF0lyHU6aMbilHBubRSo2ytEiIMGI/KTZhcKieE06YXvwcHdOqnyax1ZWtrt5bS2by0s6xNjTxEKMobK8kh2jG2nGtENuDwXZtOrPmGSxUOpj2/Qrpxca4n1b94J5znZLl0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFALm8qbnLn/7gwE26daie7CYel/BQHPaDzNy7ZhX/8=;
 b=ELlxGetkjHTEoAqYEhuulOCf7GOtcu4JiQtMmDooD7OsMRtEAJrmkIemdapNOs4+wez/nVt4sYigcFxFHv8MWllPrRZB6oUG8E0JAlGjTcwHSm6C8YfAcKqwth8dtkgOjxqrUOIxZcSmEpuU3kM5qozrPrvUHpOnbNMzjVocp/8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8189.namprd10.prod.outlook.com (2603:10b6:208:4f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 23:09:05 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 23:09:05 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Improve sync mechanism in tst.multiple.sh
Date: Wed, 11 Dec 2024 18:09:01 -0500
Message-Id: <20241211230901.27768-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:208:52f::6) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8189:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dec4203-cb0c-4c4f-6a23-08dd1a38cef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9cyzwH4pzzJUcfz5ruMx21B4KvrRb+HiWzOv980w4KpnAk9QSVPWMzBQKOog?=
 =?us-ascii?Q?BOeUSvKNWcj6glpFYS1K/l4rDZFx2lQXNcjcvxs0QiGU3AJXZDYG+gdsvwKD?=
 =?us-ascii?Q?WpZ5G7QOiYdug1QNEjg2pQ4mXnsrwvRv66mt7SjkIEvx+llEvghtXTFfmOPx?=
 =?us-ascii?Q?Obh1shJwpjozJ6BVuitHQrwnhq76Pij6ekT14n03RMStoGC8GcGqfgLqHEpr?=
 =?us-ascii?Q?ZOWKmhmBmP3FcNFjXrbp7U1tc68voZY6zG/MqRChgbUc1fgROX5dm/BZ/fJ/?=
 =?us-ascii?Q?yIHYa8dlIwGctHqrn9UMstR5RWQXKuLB6I3mUvgsaMK7+elflNq5nGxxQ/dl?=
 =?us-ascii?Q?1yEgYiZec06PzLEy8jam1OmTrPmjL5h4VSWp0F5mCuB54GYrhww9v3+FgDUn?=
 =?us-ascii?Q?P6xuzn48IeHyS9WA3TbNlD2o1Avda1kUnkMSf2Ffczhe3LROz6qSgL1B1OZN?=
 =?us-ascii?Q?VIC9QQ4LWf6/hfFCyTNgwzgfWXCEcKYMSfzFodmPvR3skxjFbhFe0vgZz1xn?=
 =?us-ascii?Q?IIHDFTjxkEqQafS1na+pmuCxFCokVatDxIMZtBkw/CwEpS235r5ajubaFW3B?=
 =?us-ascii?Q?L0ggjQhjSo/i1Up54Uy5f61rn9BcmsvNLbBmjUo3R4J00GGCItNy56wxt6ie?=
 =?us-ascii?Q?SJ2JRwyJhqZLXm7aC6cBUb/p/QFevdrpTum1DLIagjVNGDh4GAsfdyRDut99?=
 =?us-ascii?Q?bdt9ZF946h1PfI45cPiN/66MNluAifwCfB+TTTv/llCkzvyv0sekPHM4jr6x?=
 =?us-ascii?Q?8QGwU8XSs5I+de7u7Lw5ElNH1VSTsMEW+iHrd1J1et8p4U2EBK9MSpuO5y99?=
 =?us-ascii?Q?QLpXp6iJv4o1G/TzfVXZUJnTPTz1W1wSNGoBWFyVYQLZMInI1Sgj/JfYS3wt?=
 =?us-ascii?Q?X9cnMBzRY5f7pwZVSj5G8mYY+XAW9JMcc8ka+v0siWLq2dPq7ZhTb1ARjBS1?=
 =?us-ascii?Q?oKNTJ6TsFLn1N20hTuNiEVYP80JuFPBp30ZX6Un1i6SHdAxya2Q/W2bZUzl/?=
 =?us-ascii?Q?+GWf+gH6FovJTa7CCsFMuM7xjDABIQBhUrSgV9SiLOgalrxmaK0a8cM6F/7k?=
 =?us-ascii?Q?qNgQCi+GOXvs0pND6wr32hoU52W4BDb5YDuUEyMeWudda9iv/5611ouNVyM5?=
 =?us-ascii?Q?VluJgI7DoBpR4LU8+O1L5OHltvRPagfYuNdmvXZyRadPjn/tAefwMSivN7Ca?=
 =?us-ascii?Q?tmRYd+osdIt+Q7Ch9+GFX+QS+/WzAZV/HRBsMlVPXRpXC2Lrc6GV4hsBXXbf?=
 =?us-ascii?Q?vuSPwsX3lzyDF0rbZ/nUqE9ALg+hhFh+GHWVxIMwFZ56bEbDhTxLAgF+v9yf?=
 =?us-ascii?Q?VqZt9iXK4PXJXZpo+gco5abOF4sL/x8IKui/J4h+LdtWmqowYmAAGqC+nbD3?=
 =?us-ascii?Q?b4Dhdh4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MxrLfbx57NwkWceHjBuBHWmETOr0MxVumct1HiP4e65z5n5FFebbOLJEMqCu?=
 =?us-ascii?Q?WkIYcfI5YNIeUznkTc6MSSN90hMblXNN2D12kt035gZBtl2MmbrlmGx0NWGa?=
 =?us-ascii?Q?qJxan2kUkPU3Evd9+udD7jzSOxvX5uUT13puAFhZ1x+ZCNEtOmhyQTxIAskH?=
 =?us-ascii?Q?Om9BzN7clRckvk30zyfF1cEWXRDlz4cUYlT9ckHUQvvRWlsZSQdsBh7+8KIO?=
 =?us-ascii?Q?mYqVTJHMkCHyjFcyaeb+TeHiSZi9i69rC+X2ua2CuFActmxQcqyZVrtElQG8?=
 =?us-ascii?Q?JiGbRd1TXBectWJoKWhBr7a7jE4psyJF8f7T1zvVz4+ctRitrpLf2GT3l7nN?=
 =?us-ascii?Q?4j8yburYGsM1LQ/SBckF+G3NEbDrnTMGczTfa5b5uUNIxiQnm3xPO4vt9yKI?=
 =?us-ascii?Q?NKSWGxjiST7gqpji+Nkop4AUJgPjFgBeKGCvF2GVULXtN/xodjuCKwklFFpZ?=
 =?us-ascii?Q?8Qe0oMgL1GzR/bceWAHlTUn0yE0rslY1HTdWGShEa73M/F4alRRRFUSY7i/9?=
 =?us-ascii?Q?4fDUSDbmb8Yt3WeY9/RulCyZfnNm2mRyQnoxVMOWqasf2i0SccmSxRKflveV?=
 =?us-ascii?Q?s6LO+kJu/LnB9UehE7ALTGVY6D5klqPOL0MXttrqXlSBSU9oKO2fPegEHVk7?=
 =?us-ascii?Q?FrF0HuFzuPFX++H1ESWjhoP43mJjbCpyT00AqPQq/vrPNxhAjDAZvU+goh9d?=
 =?us-ascii?Q?Z0ICrcYJNTtLvCE4ONY2nioVPEoMhH9PkDf7WjgRnyXytxvmgrgygZJdPqo0?=
 =?us-ascii?Q?qAIej1n9IBWHWnJI+IiaL5jnZTpNVd6nj9I5KO7i3rq9mQblYgcIzJhEd2Dr?=
 =?us-ascii?Q?waTrIB43Lzpz3AKZvve8KCa+8/2V5+xNrzxzvd2zUZi8gUzHuxXerJ8abHml?=
 =?us-ascii?Q?hR5mCC1U+fR4j7HcW0/bYWYgns0i50Paiv8a9yWCAv4VHpkeSi82AUMDYfXs?=
 =?us-ascii?Q?GqNHeSclPCIpyFQg72IabQ5HyMt/dOAFt17owTw00q+pbT8/ZCFEfeP9DilN?=
 =?us-ascii?Q?mMTR7b6T3azEDCQNz/oFfTNRFq+o9RhsJCl23ONSj+umB7LZmHgCTHyDqU+/?=
 =?us-ascii?Q?hX3enUbRjVzyvYOX7M9qM5KRhdG+rQOmtQCPBfVdZcKa0bj6Rt57Ia/qxfPV?=
 =?us-ascii?Q?efQM1VxDXl6SCNYcW7Vpr1fV+aAMauwlsAW1lu1xXuZOay+vKl5FWy5iPQR1?=
 =?us-ascii?Q?Tl0BzVzC8qJ4rHzXNEDtuSgh4VHKzOEgvgHaUOWIWd7Rqi29J6oswryOnQ/I?=
 =?us-ascii?Q?tMXIbS0yex5U7rwW7uIkWiK/hhHAGeyZZ7QSgAcvK8MZtNxVfNpsOMAvs/Y7?=
 =?us-ascii?Q?tPxPHTRMaj3yrB9D8/5P9PQmMnfJOeNndzOFROXW4Jb3YsnKcKgWUnHJjPQt?=
 =?us-ascii?Q?U0NvHxO9SpG2Lpp66w+B+tQ47Ph1nQiviFESLa0Ui3CflwWKD35IeHbhlN35?=
 =?us-ascii?Q?H8MI/x75zAaV6RQlj5K4WW5bgqCF3+4NGs1/sX5y7eNmGhMHkISAncfohjRA?=
 =?us-ascii?Q?Kr3ZtyyioCazpgID34uxce+JY3ZMQI9BCezNofz8wxh2REhocyb7HBC/SCTC?=
 =?us-ascii?Q?PvTaP+vKoD53qD3bsjpnK51bGrruBiyBdTTD2Yrz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dLuHmRw1J1saTAapGxWTaFHnR8WxUL2/A8GGQHXvDq7zp8Gjr5PDWjwt+wacIUsbCokHzS9AOcThkY5uWoq+ZCO707KNnYl6OP1RDI2E51omEsPvDN5B4yKJiiMXte58hD4n9DJOmSh4r30mBonrXjV5cvv69NkyypZeCza8tw/TZkNgUTv16LOteyK+cqOiR67k7FrGEAXA1GMuoh3jLpZrmrSgaaVd1qNVbgTMBiGB4z6Sk1JEMq9O5YyeYme2d9qIhs/YRWe2tIPiB3WoH9NtYWrr4WeVUK8vw68ul745XyQCD6ZOeBYvdylGohlE6cEuuh+xqhJxZTdWzbnuNQzAUwFCcXN+JVGQOBGC3iGKPpvFvDVgh1YvF/D8SO3XEEOAVGB5AvsWRCH0jnuH339S9RdGRwfjNggzHHFfBGT1C62TxRgtVDSXi+LZ+0oOKNBtJu+mQwYldHtFFGM8YfQKTgPo6iXKVY4Npg/fEU3no/kTkMXyCkK6CDsiqxCIruOeetK4DQmDrBo7z/XZcK66yal4s9yP5e6NN8ChqshZqcyyFoVmQsVfSOqe5ucwEw0pGwreQR0fB5zAHxO7UrEfCvp12NfXgKwIeLJalg8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dec4203-cb0c-4c4f-6a23-08dd1a38cef1
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 23:09:05.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUe2Ko/WZYhQXueplTNBXFD3OkZmoy+F5KJ8f6LiFAkyMnFq6EN4o8/UYGfWiVqtnEOmzvT70XHszWnwQXey8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_11,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412110162
X-Proofpoint-GUID: 7_1yNfL7BYXRC30DLsCptrxcJMqvm2el
X-Proofpoint-ORIG-GUID: 7_1yNfL7BYXRC30DLsCptrxcJMqvm2el

From: Eugene Loh <eugene.loh@oracle.com>

In this test, a USDT process is launched.  Subsequently, dtrace is
started.  To give dtrace a chance to enable the USDT probes, the
USDT process waits a few seconds.  On some systems and when the
amount of work dtrace does upon startup is high, "a few seconds"
may not be enough, causing the test to miss expected probes.

Have the USDT process loop on an is-enabled probe;  this is a
more resilient sync mechanism between it and dtrace.

That said, dtrace does not enable all probes in one instant, and
it makes no promises in what order probes will be started.  So,
we still leave a (shorter) sleep() in the target process.

Arguably, the test could be simplified by launching the USDT
process with "dtrace -c".  In this patch, we choose instead to
retain the overall character of the existing test.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/usdt/tst.multiple.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/test/unittest/usdt/tst.multiple.sh b/test/unittest/usdt/tst.multiple.sh
index 1fd30dc6f..440a7d7ba 100755
--- a/test/unittest/usdt/tst.multiple.sh
+++ b/test/unittest/usdt/tst.multiple.sh
@@ -1,7 +1,7 @@
 #!/bin/bash
 #
 # Oracle Linux DTrace.
-# Copyright (c) 2006, 2023, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2006, 2024, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
@@ -41,7 +41,12 @@ cat > test.c <<EOF
 int
 main(int argc, char **argv)
 {
-	sleep(5); /* Until proper synchronization is implemented. */
+	/* Wait for probes to be enabled. */
+	while (! TEST_PROV_GO_ENABLED());
+
+	/* Allow a generous delay. (Not all probes are enabled instantaneously.) */
+	sleep(2);
+
 	TEST_PROV_GO();
 	TEST_PROV_GO();
 	TEST_PROV_GO();
-- 
2.43.5

