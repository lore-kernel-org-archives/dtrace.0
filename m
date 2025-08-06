Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929BC8EB
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 14:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754490567; cv=fail; b=XLZ3/fGlpS2o+IYwHZEMSrrHgnY67FtS+gG9THmFhDaO8ymZskAOwifWkZ8XHJHQG1wVgCpUXjSDmVVnF64uMZhFb2m+O4IhTiEw61gdUAAlNwSIlWlVCKEeFshbfRcbwlIcIkh0N8nFln0gu8aM9f56JWIEjmMyWFuCqt6UfoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754490567; c=relaxed/simple;
	bh=cJkwFpEiWsMNkXIU14NkK/ji7Vj4iq/o2yuPDSDhLZQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ogko5IixfVzAevk4uf5t/3a0lCASE9Dw6HWirIqiBQNPG0zuAmw/JCSo/mEh51SR1HPOQjXIzh8JRTDUZ4wGKxq0vMNo2n6M7caphiRAiOgEf76vikA4syf+6mQs9EosewkjnPV/p066YmM7d8JBq3bCqLOMvqHxzkFcolzzeUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K/C+v7Pd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ciPqijZV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K/C+v7Pd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ciPqijZV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CRV0e022571
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 14:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=cfHyDGPn9qrXRnkG
	UgqHGFWNW2dJcJwSFcQh0IxJZko=; b=K/C+v7PdmAppT6/5CRxOyQ4lZryDl1H/
	Z0dvIz0nNBdV/Y5LRGefx0SAXDt8sh/GjJEfzaphcudJ13xCDNqwOoe2gVtrnxQp
	/h0yyfIwsUT/D5gsACXDcAAEiFHU7n8XfLJmFfweGMJjyOM+3a04oZOo/dvzVqd1
	WVa1vb933WXArjCVBGernwqX/05l0rqJDGIei9VnhPTNF4D7WAD6k6c5D432KCIF
	cWPXiAvnRd6hMMMaUPIbaiCgu4vi6bT9IG0BiHQirElm2ChHVA40FaKOadTIY6v7
	vGJEnGmrwZCgiH220/cRiddJuZfWK5AkwW/PFMiWf5BHzNwEg1rtGQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvh1t7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 14:29:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576DKHaa018372
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 14:29:23 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwr4afv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 14:29:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyCXvZaoEey/TLi4L9TvV6jsCsBaiMyR1Y4WNZshCs6bHtNI+iw3ysL0E4iluL8LVuLfJqjqBSV9l0swHY8QheCMpgIOpQQUFoZfhbPJTI+BpZZu3IRgbtMfKrEEqwxRJpFVBtAd49idfUC97RAGEc3gljGmIBcOoA4KusGY8H7pteve8Mqp6jnw3v+k6AcY7/qdgCknfZS31n7jJqX906QxbsPpMP2qe6xQGhT0kJkS7FLn7CZLC+OqNpv38V5dbnBNaojfbzVkR/X01jaN8aQ7RC/xZb9rmg15X3zoLoMcy+7uE3SA3g9q3H2PwGpm4Kuijv77fztQJncjb+E/Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfHyDGPn9qrXRnkGUgqHGFWNW2dJcJwSFcQh0IxJZko=;
 b=TUgcOJZAjP2pTZhsb6Y9j0qUjuLqh8sK2en/y6CX4N8d8ZteZ8rysa+YSdjRdVVLLPG9DpmEYpKSxoMb3aE6z5rVV7cArbSYVKZKlIfsH0fJgzL4zmsNzRs8lLnkIDV0qwpGE0R2JQz1AtqDL9qhQ7TtDDAud9j+KmbqP0pNH1+6/qgaY5tX1v+f2D3hS8GD/qSA8wVwrFrkEs5WpTZHbOTqD7TYFZ9imDmwfP5duQ559P+NVTFTZ6NDTalpejLttYhspLQvzFkG1PoZA0R1f/nevYIQL4xwrYyCVgTNRD8EszTJqfaIgWTWArJb1u54MkTDRtbeMuPvRTpBxR8u+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfHyDGPn9qrXRnkGUgqHGFWNW2dJcJwSFcQh0IxJZko=;
 b=ciPqijZVpsv2G4cBtUhm38r3706CNsfFxMRVFKTkeqIhRoJK3fgCuvSP3nciAtqoI/JW6b3hbH9ExqKQOUWfTLgiomMeWRIPlqzo80jy5wl46P8hrUxKtRtSRjgSfdZ1l9VysOPuDCytiYLb2yyhiIm8rhpepGGs1gc3XI3uhyw=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DS0PR10MB6823.namprd10.prod.outlook.com
 (2603:10b6:8:11e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 14:29:18 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 14:29:18 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: install get_remote.sh
Date: Wed,  6 Aug 2025 15:29:12 +0100
Message-ID: <20250806142912.4771-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.48.1.283.g18c60a128c
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::22) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DS0PR10MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: 618fe8c5-d21d-4031-6b78-08ddd4f5a054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VyWFJEuIp8hseWivW71wCUXyu4wmYFK01SyCpE8HxwjMT1xq20H6s+5Veunj?=
 =?us-ascii?Q?QpZ93FW0kksoWWjhzBqYsR0+IHPwf3st5FoahBv7Ynkk2QpIVK+GW1NSj4Gr?=
 =?us-ascii?Q?h7oG91qfeDu72+5JJEX4amXPHhEBzSyKMlUlpF2Ec/9gLo1kLk/JVkWuB5ju?=
 =?us-ascii?Q?16GS86zva9PgWz1N94wyGp3rzlpNGhKEHF5FIQHzTNQep8m2RsiDUtM8Racn?=
 =?us-ascii?Q?koRWvlZfuN2aKK5nb3awvp2ivA1H2CJyLnhHLa4Dl81z/+yFbEoQPKx2P64R?=
 =?us-ascii?Q?aXlST5ZUAypIn2xVKswfocFsXVXFL5bnAzBlNZQCZZ5YR2Jsx3tRDsT4bMtv?=
 =?us-ascii?Q?thgw4qyuOxfdRaWEL18uJe6OGBPvF5aL2cP8DQHZsganuGIak0VwTmJauSpn?=
 =?us-ascii?Q?OOhAlxive0BMXvUS9Dt+qMrPQXVvn+XzUJAOWY/qkpX9xOf1JnvrYpmmkFFc?=
 =?us-ascii?Q?XvBXxpVnjral2XbEufgOXR0vrakEnw5BDIbJ0qD9l8RGVg8cM2d90LLHze2x?=
 =?us-ascii?Q?K1wQDdMDPt0J61X2Lq4T0oA8eL3fewjcJr1WopuGRHp6UydYSaBf3dGaSpT9?=
 =?us-ascii?Q?ehr8Lz9ZbqXf2KtqPDx5aj1JRFNvtz/Tb8NzsiGdAtAwmvcy1DKduCT0Ojej?=
 =?us-ascii?Q?k9JE0sZJRXc60IIE3h8kL7H70YqU6gngJ5q7r9svv0Au1+DNSn4PYfreAqZV?=
 =?us-ascii?Q?np5AN+CSH3zG3BErS3VzaHSzv8sqVNm1PKZ97CvRIVB+fAc0syRrOZxWtsoN?=
 =?us-ascii?Q?aUbrD8EEUbJOLORgPp8ZI3tm5zP/TvLy7Avc53e2TGHO//C7A4eNtJVSqqmM?=
 =?us-ascii?Q?6mwfxETGds7xoOvccJznj1ZPspU7qSoiZeVSumOJ4gvU8JCxlkG6JbGMoJ/D?=
 =?us-ascii?Q?z6aIfZ6K4QQ+m7sWlEiaZw1IuIAHHKBsU32XL+qZgaAbTwOKSOiwlBXTrLMl?=
 =?us-ascii?Q?VkTKLmCcjJnOm+bZ1kqO49CTM3HKpp8K0PJ/jBufmAynUzlIF5DboNwv65TW?=
 =?us-ascii?Q?3ttvgS8YAaFE4NYrWtcLZ95wquD7U8FvENIsVI0ffCBPtUGqEoFGLAQZbhRy?=
 =?us-ascii?Q?UubaOxFEp61MEzxuylt0HHMNOxlRm1RFCftIIGTjNeooPzoNCYAsAL6xKd9N?=
 =?us-ascii?Q?ew2r/St9tS6ZKsxtQWL0m/gXwbHmsYYyDmGr9LndgJBI46UnnLb+AGFWQVLA?=
 =?us-ascii?Q?+T5ogqNTRrh1RP+Kd2iDGUVD9EsOr77PyB75pNcezhdBm56ENQa+r7B5DqaR?=
 =?us-ascii?Q?2qZPWFkCPBXXbi2xR2BbKBlw0AfPxKMvWvTkzqzus8wNKn6ysnvZgt7Ub7DO?=
 =?us-ascii?Q?gi/clkoHd7qD/gmdUK4ToIFZZnf8V410b/BT5VRBsn/d0Hv5Syfh3obGafI0?=
 =?us-ascii?Q?SxYOAi1sxuWPhzDBtRxoBrEBwYWGQ33sRYfTq+WRgK4MC2PbJMKkSQOxIyrQ?=
 =?us-ascii?Q?De6512TQHZc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sys4zmgnN05ybDlR23iHyq5l7zz2FAyOHONcsy+w/PiyXM6JfN/+tp+i+tZI?=
 =?us-ascii?Q?nz1DTw0VTdgTswridvmQ13xF+BjxhxcNJBye1eCexJhLXie0or9lhJitdIHg?=
 =?us-ascii?Q?jg7Dacpi+3FB6FeOormk3IQFW8WQcoVECArfgBLX8MKTipEB+0O4PirTT2iV?=
 =?us-ascii?Q?wOFZyQnbQWi8oJWB0Yl/GFzGHs6lVMfD61yu04uZhy/Swqo04SP9rslRUc5t?=
 =?us-ascii?Q?Vjt9Gv/k34rjmWfbGYyf8UOZEbIsPdnsgOFzf8xUwX0aCFB9gf2x5k3VHrNg?=
 =?us-ascii?Q?2oX2Dszpz41TtO+xayzRaTbL3wkAFFvYsmk6IzBTtNqbta0cSUX5mvCjucxb?=
 =?us-ascii?Q?pjWSeZXYsZkI8xcedjvbPYwabi7QbBmFV5aVsYznn+AH2vupiRgQ74FPOzKK?=
 =?us-ascii?Q?P0+W239YIgP5uFaV/QOHIKx21VtW10t5L1XuTyHW6flM7LpDNvMD+7NHn/8H?=
 =?us-ascii?Q?zz/F9XR0l6oolcZ6c87VDsXUBtHdp/qgkI5RBnzBEC3PZxRMxDmbBo6ZRO3b?=
 =?us-ascii?Q?EGJOVrNu08c6UsFWXKocA+9k4/zOEMNqZImjXxi47oQ3zHyJa7B+UiV0gj4D?=
 =?us-ascii?Q?G9b8C/f4JemQK6hz7FSJ9Ty2k1OXe7cN1wPXyszcLWKdLlgMRdi2FkXeC5An?=
 =?us-ascii?Q?zQv6uhOC+jouNeP0bYfH8oh6JtVU7ofvwcwA57j4awlLxG+Dz7h0oA4iLao7?=
 =?us-ascii?Q?vJ0OXJwENs3hK5Mn4DNxbc510SEqnZfHSAm+iaZFx56i0h8xRZWGCE1HuKs0?=
 =?us-ascii?Q?T8gYsRGUgRzXdb57F2VWzyFrJNt61oWxaOb/tFqbTRALrDL9Hfq5qQNvSIkx?=
 =?us-ascii?Q?h2fBd3aQmw/hakYpJ6VjehvMMStsUV2/AEqSH9AiU7a77rClXcFD3dq8oQbI?=
 =?us-ascii?Q?KiLI/rBFmT+cJY0vOqZVy4UgXOacgiS1OE+nTvBlOHnHt9QVLP+6OVzEdsos?=
 =?us-ascii?Q?72O0rpe4jjHUiEqNzFkXJwjIiPbCG0OGjBTT6fehFOiqXkAq60OnpANlsSJI?=
 =?us-ascii?Q?6IcQZh4/9vkncd+sRvz5FIspP/l/B/5bDTKmgF8BZIc3RXpSumoRS/aGp06v?=
 =?us-ascii?Q?pL/w4lRTuAXGBcupIi7uhlgGdpLsUA4n0xfFaw2t+Ai4Z6le0/thgX1WUDFh?=
 =?us-ascii?Q?b/lB7w1hiY2jYFdOjg21V86eAK0iVKPvwqKkzHlM2v2IU8sFrViyD8Syw5i/?=
 =?us-ascii?Q?sKfqXntfjWIicW64SjP3I4IvyfTr7ClHe4W9DItJOtgEEg+xDwldeb7nRHMb?=
 =?us-ascii?Q?ZZFKAKl1GFiugLarsJQrZG9bZ4hLmh1hu0xQB5A9OT+pFNp/d7E+dLdfCrZL?=
 =?us-ascii?Q?rFBCahGkkk7jo7LIIjnErEdV+05kdVuhtBVQFTHr8PO7ExQHiD5ckWO5NmU2?=
 =?us-ascii?Q?UhASC2m8/KiEH4SJrAiNJFRGgZhmBAf8aTATNl7C5xaHLqcyA2cNjkci1L/b?=
 =?us-ascii?Q?5QmF2NQkw+IINkDVYX5x5yAiPjim5sX3VGtJmhtgESo2uq6ymlS0PIwYGyOk?=
 =?us-ascii?Q?SxiDI08WhLykV1ZnCD4mecuDPhAXSxlKXCwKNdRQnilkPuue3Llzpswg/YG+?=
 =?us-ascii?Q?mtVEmgzrZ+rp66eZHez6WmrI7wTRhiStmuewy4ZX4rRuYWAn/6w1zLw3j9bd?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jQOtCjSf/F+/yl7UKcMCNWcisVz6Y/5ywWc4OPbDOsQFOL32W0Er91DQjscaMsMuWgWYt89uN0rboN9vvNtOufeK9Leu1VOGEIkF3geaJElBn/qdypswxQCOlABhrFveusp1xnw3jyXbvEzIKrhGWO98Q5eNHkPoDiJ4zUQmysenRafVJ/cX41mJVGHN6WYUX8O0Rxyf36/CEytC1qO77bE9YRn39LxsbqOVtqC404G3bzUWW/VLMADU+hWsjSZXVcQwl4dTN5VlfOotlZqs7BTabc4QiI1EhJqg7RktgN1BbswmwkkI1JwdjcgQt/mzq1JkW+VRbuXYocw0xgU3ycaq5dUK5HbQOBLDDBMDNSHkmov41cAtSWmd+jK44ZegiyAXKEBIf4Gc3imk3UE+v3ABVAjUJIQExokxOiMQhJdkXPUe7kmgQ4Skc6Q1G02P8fZfK0kqMbrsFQxGboKaaqgJ2pgLESu7zuB+mgkxDV/6ztChudnSp+orfzElESJR36FTYFYU1YKoxGZhON8BogxsHDmVVoAcKSwzjCUPwIQmV2c9IoxL5WW7K30FY2Ftp3uBQje2EkKzSKs21kAXOUe/9eIG/DnRktuk68VpTIU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618fe8c5-d21d-4031-6b78-08ddd4f5a054
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 14:29:18.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEMwSWbFXVKGqHu+UsoKDzB5D0tlzlij3MIgdDEItCPCpqIUuDXY1XNXVaclcP4Nt0im0bPK/OmbWNRLVfWcxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508060090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX0gHa4g+m+fKI
 7OWCK8cS654v0h2s6UK/QQLX60L1XMw8DN+2Dq/9r8qe+iLMlnAhmvdGrWfC55lvyqWzEKs4c11
 e+9HbOPHPH1g5dNVnS0zptbX5dpnUcUm76hFoTxEtirumSkvXpFu5z/8v4RiuRUwbhuDcR7WK6r
 /RZSXXFJRDNEA4AvZz4FU/51Rwxrdnk21z/VpN/wj51MNSuEFeaDwQFrPh3Z8T8yjs4LAG/aWLj
 Jwhk6qywmAQlXPkNAHCQNICA9IqjYRh5bN8xcaEMA3uiien6QU/vapl6UmJb+m1S2CNdBuPMxeP
 BQWOR72K4CpsF5BYZZpk4QKZcK9tjTlwR6h0MkS4Nb+PnLEEpKbbaXU/sXHLE1MT8IqVwYt76fD
 FLDwoVnsdhmuE4cJd62zCtjY+hgYk0l/5U4NMwpW8fWSzEEKVSRQ+uFQoncF8+xQ/cZGoZ3h
X-Proofpoint-ORIG-GUID: nhOGMg9_JjpGGl9wAJE2VGAwu8ywLMo0
X-Proofpoint-GUID: nhOGMg9_JjpGGl9wAJE2VGAwu8ywLMo0
X-Authority-Analysis: v=2.4 cv=Hpl2G1TS c=1 sm=1 tr=0 ts=689366c4 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=BBPG4_huqlX8cmaNuhwA:9 cc=ntf
 awl=host:12066

Otherwise this produces horrible output for every test run in
the entire testsuite when the testsuite is installed from an RPM.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/utils/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/utils/Build b/test/utils/Build
index 7976272f7ca95..e19a1171cea2f 100644
--- a/test/utils/Build
+++ b/test/utils/Build
@@ -4,7 +4,7 @@
 # http://oss.oracle.com/licenses/upl.
 
 TEST_UTILS = workload_kernel workload_user showUSDT print-stack-layout
-TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
+TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh get_remote.sh
 
 define test-util-template
 CMDS += $(1)

base-commit: b420f057c85b0a57bc31e106aa2440b2ada3a4ea
prerequisite-patch-id: fbbc0320814e7df4d38ae7f8ec26080e10c44433
-- 
2.48.1.283.g18c60a128c

