Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21754918
	for <dtrace@lists.linux.dev>; Tue,  3 Jun 2025 21:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748984952; cv=fail; b=OzOWh+Np5YTe9QMYHVjA98pxHXpfZcB+JQpoljZGogXl2ekHSyTL5niTTTUZRtdBaVCZYxdqhK3vVocvQ42jByrSK0OjSpYbfQBbEr+TwPyf5+YIedi44CjPl6qn4/mAk6K1hiHC09TrE7Xy4AYvSDbwlWJrqF1HhcddU+mKSEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748984952; c=relaxed/simple;
	bh=6M8ueDeQdIGlPB2A2CrnbUYrXXWJtwg2sMFmKEldUoc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JyeO9D5aKRmfGd8t/TVUg+ITLAfniKuUP3woigT4QZvloziwwBJsp2vkskMSn0nIuYXLCCLm9vG8ap92gPpERZyffd/bvTFAoBjXYmXmHvhcX2PyP0yk80LAXJn6PNYvxHP1KntlLbAutL3xDOrR01UQwpp0nWJopMThGFZ/h80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Hgr+dxVY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WvFF71q/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hgr+dxVY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WvFF71q/"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553HY2oB020081
	for <dtrace@lists.linux.dev>; Tue, 3 Jun 2025 21:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=gkHjv/8ZH57BoSS1G7QQDKxk3/S3nKnMH5j5SAd6j0I=; b=
	Hgr+dxVYQhCOnw1PAsMH9IdOhdQrR3LMpyi/HTJNvlGlKOHfmadVycWEnkF193Wc
	2IVp6owhuhrvf/LhLwomuLPheQMU77HqKXIwXbunWrKKTxgLvN6cXt+Fq2Jw6EbM
	djCEhajewqi7wLoySqcg6sUV5LtAPVz+o6RKB8m4os6hzav3JBEFb/DtbyQ586Wb
	GboTCkDbFK7xKTcOGbarDwuKLQ/eoAoFtPmRx8M90ycUQV6zYSEN4Fovao0gaspr
	2hUxjojxG4wmV3qtsA804mciqusybPX/w6DrwVOBgswuOcryycxjCm5KZgXEt4sQ
	JA/pkiBhFbqHPKm7Xf/4gg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8kasvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Jun 2025 21:09:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553KV4gM040645
	for <dtrace@lists.linux.dev>; Tue, 3 Jun 2025 21:09:08 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a6sdd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Jun 2025 21:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id7Q8CytboOpGMaRq+c0hJ13CuQ4V20YIsVHK1NZr7Pb7+jUuZs2Cdzxd/AhpBU5JbLzsxDkGrHITN04wZUgkNl3pbN6ziIke5sMBD43xGD/qzSK7O6n6OHfsY7kM6H704Axcff3o8/j74IfsEk9ydCWcHn4DLL+qE0mM97kj2ZqXGELcIQtE8/3bGwLnF7NCBGMUKgum59Wu67RUEyDK6yUKQYuj/A9MftArMpH512bC2/Sr1x7OBWFwW3GHSe6wL7q61geEvR9gcMF3QKOE8QnO6FB6BhC8x0iYu8t5Q/gy8pz7/Dx+ZzFHHgoWPhn225LU+RYNVAislZHAALscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkHjv/8ZH57BoSS1G7QQDKxk3/S3nKnMH5j5SAd6j0I=;
 b=cEVf8JCbOqPD2SXtxkoV5wQacF4V83yBSKww+WW01wdT56FK0IKsIEgCAw6AX9e98drkm+FX+NRd2+AwOebbSDnPwxPjKvBWrzL4XcpxOkBf9RXvvkDOPzbgD19cwKN2NFeDdfPiVR7XNrdsuA+4TN2Exit/pG6v4qdV5xkVOE4vGIbQ1hHl64ott84Wi2YK8qtheebMJ0pMK5k6O1IvB+Bcepkh/9J/qnGcs3ZIkcPTIeTgpIp8GxdpAC7bTTgf1M12xOUUbQdk/x3M56q4sttQ/ljr/sq7GQIeFEFG0sM6jcgMjY/I9ISWNMMmGrtboYJASlSQ7ki9i+f/1CZJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkHjv/8ZH57BoSS1G7QQDKxk3/S3nKnMH5j5SAd6j0I=;
 b=WvFF71q/UjF4KAJyNf1AZzmYug7Tj7opt2svaXJmQo+IvbZ2c/agFSfbA3JBQAbhRTlqPgSfrAAULrtBkaiaVAKLdsXTn+QhCB6k7M2sCXYk2KzOhVijIAgqKknoZDG7E5k5Kit4d9Ip+tZYC/xdHdMTRILR6yW7pn1lR2sLhX4=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH7PR10MB6354.namprd10.prod.outlook.com (2603:10b6:510:1b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Tue, 3 Jun
 2025 21:08:36 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 21:08:36 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 1/2] Omit an aggregation record if [u][sym|mod] translation fails
Date: Tue,  3 Jun 2025 17:08:34 -0400
Message-Id: <20250603210834.21204-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH7PR10MB6354:EE_
X-MS-Office365-Filtering-Correlation-Id: bca819b8-456d-4fec-b1e2-08dda2e2ce0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lZlGGeeVeTQbqLI2ctXT1NIyBbRrrOWI/wf3VO/XX1Z9W2g4WoFTxpVE4qpb?=
 =?us-ascii?Q?Sz5rbMhoh6/7mtbCYbyIqx3ZXO26M3IjSZETup/VC8VHQdfmCV+6BTx4Gsim?=
 =?us-ascii?Q?DFiDUkXc0lIdGT4a9ZBaHp+gLzQamwqhjdXnJ03eVA6A6nSPfF73diRsUog8?=
 =?us-ascii?Q?gKClmdaboOMgkslk2tP4zokwbSS1w16qZ0+j+neNVl0fHxwJ0iM905gVFECB?=
 =?us-ascii?Q?FIetbmx30TsUDjHpmyXRa3KXmoWk3GboddTYtBLMFaNQ+t9m2NI9iOgUR2K/?=
 =?us-ascii?Q?/LV8sm0M7n8k/NK+IFM6d7sFq02wXsqyIlFCwcSUv5UGd3nWP6SG4uY87D0K?=
 =?us-ascii?Q?RcYIhgluRDzVg5xTmbPUg4bSagp4i7SYU5ObgRemm3TZ5mgH2cCpONyJHbVs?=
 =?us-ascii?Q?DSc9a3mgwHtjDo6ZO3Az7N6j8/Eg3cRFco1csa8DK3WU2Y6Z7L7oYT9Xk6o5?=
 =?us-ascii?Q?07d+kSBn6iKes4bXuRYEGTVzXprvLaapcOJpuEM04lTlqaLeW6EdZR3bjhZ3?=
 =?us-ascii?Q?x8unCvuOrQMZDUWG2hbOnIQcH84OfXXva7MEksDVmsnBH4gj2aff9VLbwtrs?=
 =?us-ascii?Q?GHHLKNr2DL8L3b52PqtDvJend0EovdKDqOyUx3khVS1o6VmLoWDaDM7H5OWB?=
 =?us-ascii?Q?W3nUnkBQWQajZujT1TgYVZE5Q7x86XJi8GO77QbTr0dnoD86yRIFzT67imaa?=
 =?us-ascii?Q?B+jPNGDNvNK3QIi51fR+PizqzGIrkQSPDFD4jCAa5MK6HYTx7eBMqixyWQEB?=
 =?us-ascii?Q?figCqt7O6T8cRwXAHEiHUaKRQRciL9rrzSY0eovkhtb15Su0fgJ3XBsCN2rl?=
 =?us-ascii?Q?utzERlthhsS+t46ID6Ve7m5iBT6BGzmUCoQeSQWDseZazIvypGLQfodraenU?=
 =?us-ascii?Q?Hc5SKs7jp8rOrvsAwVsl+hBvNH6O+iAj3Kr0V3q+5K2LnBIoV50TfWaZNaYz?=
 =?us-ascii?Q?q3mGoDrlaC0/wj5O0UBoDK+hddZ3CMk8cXw2FpsyoBH8Y/V1qUuqHqV7V04R?=
 =?us-ascii?Q?Y6pIlk8cYGT58sz822sg7GTlh9v+rsolmTir7h8Aez4r+5mwBHOraQYBhsFA?=
 =?us-ascii?Q?vxwUYdg2Ys54CPr8Kb6c1Jf9/0l8syUBvZq8XkFbdgxyHO/w/O3pHt2NA+Sm?=
 =?us-ascii?Q?numLDxEACFsppa4atsvoMHlBQwhOy9kfo7f2rtyVg7c+o/UIQ7b6MdOsN0mt?=
 =?us-ascii?Q?+0w49PpOgGcgJopdLRoJjBvNxvnpR2uYdRWnQW9lDN9acOOxYOc3a+UZ0zlK?=
 =?us-ascii?Q?kMRAouxBbi3TXUGNqY9paPBXF3MLbS7Ybg/YWAY1rK1XrRCpE4bOVX/h1VcS?=
 =?us-ascii?Q?7rn9VXbxY44d0MHk4umVTVR3Vxej2g7wcebItxcq7tY6W/YtbEsMSP8mm+aC?=
 =?us-ascii?Q?CTRs8lFrXm2pJo6P6PY3bTnYtAAfa5WVTNciXnA1YfD8SHiWqWEQwitdVAcb?=
 =?us-ascii?Q?Q/ZfT8sRQgY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uuDrNghgnebfHQC89xj5CEuat8Q0HUSEljk8WjkEqMlpCtlnhWg2zfYJ6SqK?=
 =?us-ascii?Q?e0mG/3O/gSlVxMG+kFAEl/tcYSzxrbwYOX4dEFHSIP9QlQj3kJnvNsvu/69C?=
 =?us-ascii?Q?OdikgARZk2VBcQI28f1oRCk2YCFQhIxRYZpo1cjpHk4gjKbf0mOtGix/YR0D?=
 =?us-ascii?Q?aU97v5p69EqJcLjgBEo6jflFwRwvSYmFDb20uzRooKRg90Z3hWM3TJ5oCxvH?=
 =?us-ascii?Q?5uGw399accSQRTkTm6d7HDZ3YOS/8+DuHxbzUchoIMh2h17vAf7zMG3eLzlO?=
 =?us-ascii?Q?iEv7vdkTWbxSePeBNYnm0yV2TXHoQVYvRFgLjngFfAPrCesqJALaSJN5N/i9?=
 =?us-ascii?Q?DQUchJLvyMHyxuE5hs8L4WYbO3SG1TF7XRssOENg0H12fz3I6baPCpa/SfZF?=
 =?us-ascii?Q?OZzdk/Mf2iYdKZrzBgDgPtDpFvycoRbVzszVApw03JoLiCk9VBEgIxmS9lpO?=
 =?us-ascii?Q?JB1q7V1EQuqz3cWx2OlmfAAuXbpsjnET7CijPfdAnTvba4um/dKmXVSITu/D?=
 =?us-ascii?Q?jxhJlwJYZ/pAgsjuLAgkGf/9AHTvgRaw8NsqnLEM40kHvkIGCRg2X/ztw3fZ?=
 =?us-ascii?Q?DjvV1Ks4ezkETlFgrYE36Ej2T6vFw0Fs6p1x20HzoL8kMwoF8mWxI5EeWfMF?=
 =?us-ascii?Q?GYtqQF3v6H1+BST67gaS8HNQ4YzKJ5iU4iQOS/OP5B35FtHd6TjkeGLu5vgh?=
 =?us-ascii?Q?Lw3DRyef65fy0ro5f3swLHU7xkJDwhtBfZk4nHaNMnNWbf3Tk6g6g9mOs3uZ?=
 =?us-ascii?Q?u24tAjnVfvaz3XX2NxM4RX6tNHgcRuk505Q828fJNq752vUvOb5ejji579yU?=
 =?us-ascii?Q?Gt/nMhZ0+Du/gvpZg3MYcZjFCLN+2eJw284aX+M3VwMVNrN/B9aBB5k1f3/a?=
 =?us-ascii?Q?PZr73yvk03HZVZ5Y4w3pW2wzXok+qsqBh3thrSUciZAQSaS2gZriPpNCBxB+?=
 =?us-ascii?Q?Ug/X9Q+//0rcKxCNbLu8rctZKUGyQIwubrdPVLEnYvPfKrMkO/E1mAmHR71h?=
 =?us-ascii?Q?bSu9EcSF36WelHEsM3u7RU1SXcWVsO84gkADn333tuN05GJM6VUNoMUuzEJd?=
 =?us-ascii?Q?+KzWHrDCu6ZzABQe2+T8pJfQOLLv0fTCsz7ELrDwlp0WP3qawJh4NVevlSFG?=
 =?us-ascii?Q?XT7hdje9MjGM7tuUCbAaEb3qTJW5Tcfcb8X6IUVDLehc9gBu21wa4hLAKkxP?=
 =?us-ascii?Q?xq5l+9ct7cK6eK300iZ37ay2nVfPsgH6ZUmXL83NjVFKjFkFX80K/9tS3EqI?=
 =?us-ascii?Q?yHTe4YO6l+3spWa3cE/xwB+T6mvzXbPKgAmc5eiLU0E1yXYI4B+IYNzm/EwX?=
 =?us-ascii?Q?gttBfKc2pT12rs65Q2gNKMhx0DVEVuR1snyEjyqM6JT/FbuY8bo3wO07gLkX?=
 =?us-ascii?Q?Nz0nR8iKsKo7ue0HOftCwICbhzUSMVlKfedf1u28z1w8mEO2QWJFNycDGk24?=
 =?us-ascii?Q?P9k8pNxhv60g4Z/hzqUgXuRzM/ux8yHdSt4AfPgq268eizxmr9BbuHdEZx3d?=
 =?us-ascii?Q?tPf5B3CgTAsqCmJbRblEdqhSkbGm8KLCWU6s3gRycDXFmTUxfz5TS1o4+kXd?=
 =?us-ascii?Q?DyMCqdfIQQSVaQQROCVaMXK/mVdFmUsSSq/xg3Xq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FmrJlkJlw73it/mXWSmvpaSRKw/BfhBO325N/0+IU++/8ZfBuUiu1Bh8cMLFbf3Na/mgKJ6n3AcUXBUUEARz0UV/i7/EaiIMLNNJj2NriEryEuNFr5B4896/+7FGmKnbWmLJvh7R1LwQG3pEEY+RBGbyk7M8K9d4HmYeSbQikedTMzLNnO/hCzgksFC8suQX3yaF4nX70aPgx0033Tm7W7Jcibk++sh1pIeJsJFu1/KujBRYwB52Q72FsfHohvUK+6acVlH724A06UPQe6Ev/zqV2oLCXPm2wV0O9LX4uq1tKqJJNDXhgCk5Xnm+jITX9d7Glq8+1PKKiOYaGgKTGBLgQmGo+v8CEFDfPfRqtYizz419UjQr8/4dpYjJYGeDkguXzIXn8V8IGwrQHwanipp2obey/wepBpekfvC/dSbfsnIMp7ECC8k8Z14EpA72zx7nD2VjPgVK1Ujj8kQdjh0u7+KDdkqVgnL2A2Y/w2mTGNnhuytahhDBZib3n5wT14ZvG3R9pc8AyUl+Q4R23GCZV4g75p5Jp0SB6SR7qAGXYNwictOtGuqsWmY35QedxMBSS3hiHQU0XEFyIOZkXyJCbldXKs8q2tECQ+VbtnE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca819b8-456d-4fec-b1e2-08dda2e2ce0a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 21:08:36.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dImyVGEESd/B85hVkzHMkZEwps9LI7k7C5UbxZbC7mnO1TJzf6axfhu3m1tPGF2MnpbqhWx1BEA84esTImid0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6354
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_03,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506030183
X-Proofpoint-GUID: 6zJWrfNzm-XXjyyqh5pvt4o-MrmgMpdM
X-Proofpoint-ORIG-GUID: 6zJWrfNzm-XXjyyqh5pvt4o-MrmgMpdM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE4MyBTYWx0ZWRfX1nj3t4+vqDxG eBpW2aZFNqDJ8SyOAYqXGE4RKur8Nh0p4/UzRwIkaUIx7mMwpIMjoHpgU3bskUPalxIkPowKK42 FnMXtbetZ6cmSojsWAUpI2bc1nBKKZ755Kmi90lhrcQ9eLDjwXZOesZSI5rlniLE2P7pJ0GkvNV
 jscpnJGeU6sQO/x2c/0DKG+WSn0t++omKc0h7JRsd/ByWf51ZZSZP8TXLlr02RLxl1x8EFxfiH0 k66mmWg00tvPEjynSn1daYHWd+yGufgsNlYcoHigfMoL48Hs9ErKS5I9Bll6HQYQM3FmdFIVEvZ 6uHN+qmt5Zu9W7Vl3oQmyLDYFkpeageCtvLcVSsc6a6DkNKmIvKRlhUQR8JEKUntnFAEjp7WKDN
 n/oiQIsIYIshEIVtPPt+ht0Xq0ynka4QfS+YVioXtUHOuH0E3Ny9lTiOjNBY4Anjpg3/SEOu
X-Authority-Analysis: v=2.4 cv=FM4bx/os c=1 sm=1 tr=0 ts=683f6475 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=er08khIU1teJfuVYuRUA:9 cc=ntf awl=host:13206

From: Eugene Loh <eugene.loh@oracle.com>

An aggregation key can be a sym(), mod(), usym(), or umod()
translation of an address.  It is passed from producer to user
space as an address, and the consumer must translate the address.
It is possible for the translation to fail.

Omit a record if the translation fails.  This addresses failures
seen before OL9 in
    test/unittest/profile-n/tst.ufunc.sh
    test/unittest/profile-n/tst.usym.sh

The problem was that the kernel's aggregation buffers are snapshot
multiple times.  If a translation ever fails, the raw address is
used instead.  Later on, when the aggregation is printed, if the
translation is successful, the raw key will report a count of 0.

E.g., we snapshot an aggregation.  The translation of address
0xabcedf fails and so the key remains 0xabcdef.  Later the
aggregation is printed and, therefore, again snapshot.  The
values are cleared.  This time the translation of the address
-- say to the function starting at 0xabcd00 -- is successful.
That aggregation key is successfully and correctly reported, but
the the raw 0xabcdef will mysteriously be reported with a count 0.

It may be argued that some users would like to see addresses that
could not be translated, but typically those unsuccessful addresses
are not very meaningful.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_aggregate.c | 51 ++++++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
index a18de3a75..32b0faced 100644
--- a/libdtrace/dt_aggregate.c
+++ b/libdtrace/dt_aggregate.c
@@ -317,61 +317,76 @@ dt_aggregate_quantizedcmp(int64_t *lhs, int64_t *rhs)
 	return 0;
 }
 
-static void
+static int
 dt_aggregate_usym(dtrace_hdl_t *dtp, uint64_t *data)
 {
 	uint64_t tgid = data[0];
 	uint64_t *pc = &data[1];
 	pid_t pid;
 	GElf_Sym sym;
+	int rc = 0;
 
 	if (dtp->dt_vector != NULL)
-		return;
+		return -1;
 
 	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
 	    DTRACE_PROC_SHORTLIVED);
 	if (pid < 0)
-		return;
+		return -1;
 
 	if (dt_Plookup_by_addr(dtp, pid, *pc, NULL, &sym) == 0)
 		*pc = sym.st_value;
+	else
+		rc = -1;
 
 	dt_proc_release_unlock(dtp, pid);
+
+	return rc;
 }
 
-static void
+static int
 dt_aggregate_umod(dtrace_hdl_t *dtp, uint64_t *data)
 {
 	uint64_t tgid = data[0];
 	uint64_t *pc = &data[1];
 	pid_t pid;
 	const prmap_t *map;
+	int rc = 0;
 
 	if (dtp->dt_vector != NULL)
-		return;
+		return -1;
 
 	pid = dt_proc_grab_lock(dtp, tgid, DTRACE_PROC_WAITING |
 	    DTRACE_PROC_SHORTLIVED);
 	if (pid < 0)
-		return;
+		return -1;
 
 	if ((map = dt_Paddr_to_map(dtp, pid, *pc)) != NULL)
 		*pc = map->pr_vaddr;
+	else
+		rc = -1;
 
 	dt_proc_release_unlock(dtp, pid);
+
+	return rc;
 }
 
-static void
+static int
 dt_aggregate_sym(dtrace_hdl_t *dtp, uint64_t *data)
 {
 	GElf_Sym sym;
 	uint64_t *pc = data;
+	int rc = 0;
 
 	if (dtrace_lookup_by_addr(dtp, *pc, &sym, NULL) == 0)
 		*pc = sym.st_value;
+	else
+		rc = -1;
+
+	return rc;
 }
 
-static void
+static int
 dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 {
 	dt_module_t *dmp;
@@ -385,7 +400,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 		 * appear more than once in aggregation output).  It seems
 		 * unlikely that anyone will ever notice or care...
 		 */
-		return;
+		return -1;
 	}
 
 	for (dmp = dt_list_next(&dtp->dt_modlist); dmp != NULL;
@@ -400,7 +415,7 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 			    dtrace_addr_range_cmp) != NULL) {
 
 			*addr = dmp->dm_text_addrs[0].dar_va;
-			return;
+			return 0;
 		}
 
 		if (dmp->dm_data_addrs != NULL &&
@@ -413,9 +428,11 @@ dt_aggregate_mod(dtrace_hdl_t *dtp, uint64_t *addr)
 			else
 				*addr = dmp->dm_data_addrs[0].dar_va;
 
-			return;
+			return 0;
 		}
 	}
+
+	return -1;
 }
 
 static dtrace_aggid_t
@@ -574,16 +591,20 @@ dt_aggregate_snap_one(dtrace_hdl_t *dtp, int aggid, int cpu, const char *key,
 
 		switch(agg->dtagd_krecs[i].dtrd_action) {
 		case DTRACEACT_USYM:
-			dt_aggregate_usym(dtp, p);
+			if (dt_aggregate_usym(dtp, p) == -1)
+				return 0;
 			break;
 		case DTRACEACT_UMOD:
-			dt_aggregate_umod(dtp, p);
+			if (dt_aggregate_umod(dtp, p) == -1)
+				return 0;
 			break;
 		case DTRACEACT_SYM:
-			dt_aggregate_sym(dtp, p);
+			if (dt_aggregate_sym(dtp, p) == -1)
+				return 0;
 			break;
 		case DTRACEACT_MOD:
-			dt_aggregate_mod(dtp, p);
+			if (dt_aggregate_mod(dtp, p) == -1)
+				return 0;
 			break;
 		default:
 			break;
-- 
2.43.5

