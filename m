Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780719DFA2
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757855857; cv=fail; b=CaIni+eJcRZFPOC9hDlRAa0S6XTTIDkkNg6U72nb7FlQ+8plJFDLzSXAROtZXpXyQRaGXH/AEZfXGqIq9BvFeYKAVIywtdtjQFLlpMvdZcj7wZVZ0S9+EnI/5ML+zaBZl78Ijs6u08MVqKUbc36dE1TPkL2HkDJDiFSS4Xjh4pA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757855857; c=relaxed/simple;
	bh=fQ7pJrV+d4AfF5S5g3LjY4YhdvEueKoNMEHTYikK418=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=E45+aki806+nOBL74oYGQ8v0byuk7z5ShbyuiEcwoNVtcwl/LWs7+I9e4xbC3h6DEzOJc9cUkBQtU5q+WC55u1S/7OPNlMpJw+UM4Goz3U0ljH3xGE5O2WzS3gEU8/IMol61tx8/FQtyp8QL1RogtAM5CbEnJJLullMmFmjXlHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZCUVQSKF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EveXHUSs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZCUVQSKF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EveXHUSs"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58E2ScE0001893
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mwpZd4vduWLyrRjnid
	ZPvmHA3kJjdNSKJScfNv74GsY=; b=ZCUVQSKFIpVWB1B3jY6DABFCNv2JBT4d5m
	PB9TPMsSL9BGko/fBCHCN9wkg2Lh+TgyVwtCSpY2q5ZYOCsKdQwq/jBgo/WYvZy7
	39X9DQSAQRMXsWammD1zA+2ctEYr8lulzx5lL3d5aDMYKdJkP45LNlHGp4JefSBo
	rajGf5o3s66c03pLW0iBYgNvtQ0Urk0h0hqDmYx6T8a1LXzHM/g3F9bxGW4WhAJF
	Z/Zz5K2Ds3vqE9hnX5Sqoh7X6w3+lbxy0bK0RYdqWhQCfMvHuwfl3V6/KjjsRYAz
	0yz/NhwPsLHl+gD90WAkW7HTVdZ4gCHzNBTvMCYLNnuv9kUwLzZQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494y1fh0wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:17:34 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58E71akI015278
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:17:34 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 494y2gch09-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sun, 14 Sep 2025 13:17:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEgrf4I35OtcA6dEC7M5ETQzYqvs2qU+iUyFqcw8CpKWKbrD2wydnHKQ3DZf3J8yTmDQztdaWKfiAi7aXDaQFcxL3vCkajEXPU6YB773sD+dBFWtNocT4pRhQU0Bw3OGdl7KqTJKbchqEYWmrnL8SiI/6nWnUkthOD7PSAwrKgwngjF+UUraPe2UOo/1UHsSY0q+pQga6J+rh+DFqFM5LVn9Mnco1aDV1vAMcNyqcS0KGGFuLoZFZwOA9lkP5DNoRlp1AouoALvNSx3qGBd+vAnNp4Vk1unMRYioBKvrLDrSr50Wpw6mqs5BH+G7xSNUpQeTDx/inQCKC6Zf5n9+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwpZd4vduWLyrRjnidZPvmHA3kJjdNSKJScfNv74GsY=;
 b=ZOcrYlz1xhhI8jHDdKJze/edRFQkwB0hSHdePpnPy6KvjAim4Qv2dV3GN2dPtKGno+J3IyFSaUilAw/OeJoXdXPavcr1fqOPhpusutCxLSpy/zavTZbtDQAfx8NqIxCDrR1wSoTwKl7HVPN/+o9yR4OqKvUhBfiYCcWJebsYfkXtxjLEIUaxN7vxu9mWsa7sIyznHgTpX+v3wg5ye0vqF4p5Q67PXheqQHcULtOnLCEomrF5M/YhyQZl3ZHCX66nwAnDHBdc9d2oscngwC8nUTS3uCMkybi+SNC2MDOMfBXjxFFjoqsVT+MJuQjsyV3Woieq1Frgs7K/42GOqhbA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mwpZd4vduWLyrRjnidZPvmHA3kJjdNSKJScfNv74GsY=;
 b=EveXHUSsWiA6k/AaCt30WRYOrfkRhCtFrsB2qlUnLY+h/hWsKJy6ju8C7ksaDOzdq3z65h9q+Roym5aW5y9lSxWDuTUix9RY5B3W8MSvS/AQEAYlkeAAmx9Mp4R/cPJeL76F/OLKD0R1oq7aU5s3cbxniE5/Dlc/cDE4Xsot6wA=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by SN4PR10MB5621.namprd10.prod.outlook.com
 (2603:10b6:806:20f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sun, 14 Sep
 2025 13:17:32 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9094.021; Sun, 14 Sep 2025
 13:17:31 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/3] Defer stripping out "__data_loc" until we know that
 is useful
References: <20250913155619.22299-1-eugene.loh@oracle.com>
	<20250913155619.22299-2-eugene.loh@oracle.com>
Emacs: it's all fun and games, until somebody tries to edit a file.
Date: Sun, 14 Sep 2025 14:17:29 +0100
In-Reply-To: <20250913155619.22299-2-eugene.loh@oracle.com> (eugene loh's
	message of "Sat, 13 Sep 2025 11:56:18 -0400")
Message-ID: <87jz21w4uu.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0499.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::6) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|SN4PR10MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f932700-c8d5-46f3-cb5b-08ddf3910fac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sFHxvNcULMGNENSYeO2aetJpI7kihnZ7cWyBJlff/v6tP2jE7xROjAf9p+b3?=
 =?us-ascii?Q?3lIr6EF3d3FU6VJ/hkGual/0xcWm8eVQ4cQuxOSF7YM7Jk+mU8jhUqb2Ps8g?=
 =?us-ascii?Q?2tDVIAkcWsakKMudxJhd2PpiduNuhAuNB4iDl35oLYLrsfEJQiphwumtNeSx?=
 =?us-ascii?Q?zsT19VSKDoWKmzAx81MXtU4FOVRhsoPgW41TvWLepjasp3CoIyDMy36GzPAt?=
 =?us-ascii?Q?AQCMJ4IcIMF5DhqsflznTgWkGjiFX0dte2Xc1IM4TLBY4Gy2TEhgDMl1t3LJ?=
 =?us-ascii?Q?0S+NjhDaR7AQ5PLoi/dK3d6hBJ9onkqAsYDBIhlsUc6WOcgi28jrPYhQikHW?=
 =?us-ascii?Q?+J66seMF76XKAs1DKy9ZIq2FUKr3YlLqlqLT/wUlJwQ0qk3pXbxI1MqRfsBj?=
 =?us-ascii?Q?k80RB5upbUA89kJoVjz592f2a6z0uxtVJvy5LEZEJThAGDD3HXILnF1M/o3h?=
 =?us-ascii?Q?03hN4+YYU3YbZ39+cpBMgL6+otqntxi3PboGmj7mxOBoPXH9hApiVTzjnV4U?=
 =?us-ascii?Q?4CHCZAsWqmQU1hmQNAEVMVHJVIxWsjhRfPF0j7uvFHMFd42JlcFYfc/+KyTe?=
 =?us-ascii?Q?1qKwepJ4DiDsTUoARwaIIE0YD+gTIKBP8AptC3X4CcMCJgnqvJWiuIqlszOm?=
 =?us-ascii?Q?uIv9560hYzOCxpRYUVZVUx7zJQaVOJ8LPvWLIgW+omEZgbYKllYZ0ZP9e97H?=
 =?us-ascii?Q?/5qvrN8jCsTcdnUCdqI9RQX2Eg8ybc1WEl/qMnSuoaDHTumEEwvjBxP+7nGJ?=
 =?us-ascii?Q?+Mm9gyMmiNhlE05jNnvlDpWZqINE3MYvlW1w87leHLa76T6/oqxHIUa3MaSb?=
 =?us-ascii?Q?bmQHUDs2+Q4ZrBfwbEN8t/hWSMKUcyu+UWdpxZhIXU6w6SNwLS1beN7Jcani?=
 =?us-ascii?Q?mLJD4wyRZV3r7p0O6Ua+CKl0CNFgGgfTs1Lq9ZpuuMD7wjtSjzoJ5jf7U59a?=
 =?us-ascii?Q?5MBuHyLFQjTvI8Aj2fV11vcmzl55pJuzArp9vhr8pTjDAzrPe4fICEFK8uvK?=
 =?us-ascii?Q?+jrOeEctAFxBbvRibyMTVA2GGISApWOqVsS2fekPiIDQeMg1JO6BvG8RKXns?=
 =?us-ascii?Q?0daq3X8ghdXVqkOq5VIFHNXB1+IDOTvWJyHsH259wubOrJiwYhYRqtCO9ZM5?=
 =?us-ascii?Q?trMuL9+kwCj4mlACf/xX9n94P9L3QRObov4KjqrRzkCJX92bJ+OlLvJEKCAk?=
 =?us-ascii?Q?U5NFhKSLiB6ZZqmr8lildSAzUD0PdvwEhukyyqwOCpkqdwv9qfMo3EVLf8wU?=
 =?us-ascii?Q?Aec5XB3A5F44k1Ul/eJ6o25nr+jzSOeqNsuJPApUyCGq36AqGilu+yMFbXbq?=
 =?us-ascii?Q?Syi1YSMjDpPJJyovuypTgaCFMJ7Kd9tMl+kqjtnVszO4191T/KposikktbSp?=
 =?us-ascii?Q?XZZW4W1ZPXAwbeXB6JQ/nW/i5R9BVQ7bxwPOeGsh0WoVc7Z29x2xozNfrgdW?=
 =?us-ascii?Q?4w2fI+rjRl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SmdpYTODKmjolW7T0WWual5VldAsXE4GHjsQWuMBHxczCaHXs3A2TWRvp82d?=
 =?us-ascii?Q?FisKc9oyfwk8jjEc4bBHrwY1eKzm3qqeK37KDJ0YLZYEFsYh84UxJxpsbWQ1?=
 =?us-ascii?Q?hozO4BRyRR131qckJKgwvJ+GMFuO98FWDQkHBr0bX9eq/caD+O7RTVS+qysI?=
 =?us-ascii?Q?qDQ9fOdFvsk7Y0SewpAR4zHklr5bMx4uzdzy0ix5oFhfyhdL2WoJbzcWNwBf?=
 =?us-ascii?Q?PB9Qcuc2Lr+9kygRz5hg1qQUGOj+QozUHq5KguHyfRJchuOwnatVVybVWn6f?=
 =?us-ascii?Q?o+yb9CMJr/s52nb4D17hF7eKT/X8/SzeMSLkSEPOstefnbRD5QRpEVYyQsKy?=
 =?us-ascii?Q?1L/SHGNo6ZQGsV5yAnmaHU51ejKAR5+ethvhfIcTw+fXRbd9U0tgRZGqFHpb?=
 =?us-ascii?Q?xEsfkdhtHSMyJR3Xi3L/GmJvxdeJbMm4C4IQBtTHZ10v4eQtCY4ETrtBZFna?=
 =?us-ascii?Q?1awxt1S7JFT7fuThBN43wh7w8yb+dB8/TNLfOVGHiuz2IC8RoSS5N9VJ9mwz?=
 =?us-ascii?Q?KNVhgc+u4a95LhEnkGydbNv5ojxwuv0uSBpDTsnCvQz66clNiBsIYL0m13vY?=
 =?us-ascii?Q?91SdI5lIkx+UVZnC/nYQAhbknRDgBpXuOnTEw4vS1LpUCIEjsiGF5WuAgOlQ?=
 =?us-ascii?Q?W0YWtF9vtwEWOxx4u9jreD9t+nON9SjA1HvkHmM+OsgG19aFk2uZmnbCL3mt?=
 =?us-ascii?Q?4STQIfa0Ba1eALFgZq0maz7WamfuerQHqqK4uBjtRjV9+Kq7z0CpS5OkQ6Qd?=
 =?us-ascii?Q?EK8zoB2JumDp3WXrjMWQ1aYk9Bl74fuI7E7LUc55tkgZAwuSeV7ds6AOVyyv?=
 =?us-ascii?Q?yAzNa/iu/2SwiXJH+1BEAEYbGsM1tFcD7iHAkhEO2v/6LnHxewfcEWR0qUHB?=
 =?us-ascii?Q?p8HQNo+YxbB3m5mWGlG+bEjOXbKiWLizQWZc1FO6WtUH1wIkMGgciVU70Znj?=
 =?us-ascii?Q?PIO1YFD7tq2fuh1DOr+OSqkBRPVHEi0Fg85jnLAQTVarQeaxIO/F7ih8hwQ5?=
 =?us-ascii?Q?gFvQS8UXhYF7z74N56f2+rjYiCFXNZC/qfG8q6znrxzVJZ8YompbzZHkbGtQ?=
 =?us-ascii?Q?B/0B3SYFkINCEAOBYrY1ChszJ4Fh/qcBF8tsBLbmCCwP6JGeXnTIFfU7Cqna?=
 =?us-ascii?Q?8F7ZUQSngtYtHOBCfT0+YW++FHmKUGFOsCZJpLLmxFRe9bRLLGFDdN8JpxPX?=
 =?us-ascii?Q?XTdnjcYh95XwQccuTIirCSPqQhBYeixd/1+cIyzIC/WCZnjg3QTnaFg7EH61?=
 =?us-ascii?Q?l5yO/iU9i+Hp+XV3Uw98scXRI3LZcLtlGlK2Bdd6ZlqM0DFHvZSLu/VifyU8?=
 =?us-ascii?Q?LziS557NyxsVcMewuHmq7SQrmKO2BQ4hhptimliSQiLyAExGs0QAbMcZ4bLc?=
 =?us-ascii?Q?UYcpKY0v/Ebz6KE5gc7VVXEWGXC8nqq+wDWIUNIfLRkaliUfbGEEByRbkHQ4?=
 =?us-ascii?Q?Rm7cLZewANm6CC+nWUsnEHf5OOCsYis9jJ6s/4GaQgS1QxacF1nTzkepS+wv?=
 =?us-ascii?Q?i+8bDTUvt0vJeGoMMPvig+AM/mKpK9RHUs7jdpSlQTRUkjGW8nuSDz6tQ2Mi?=
 =?us-ascii?Q?gP+vIBO2qjGzh1lT7Lx92JUH9qkXNE/iDDQkyj9XC0/Lb47RLbgvdgNg+v/m?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kBXtr8ISdsDesHIT1QNbCzb1SalSppLw1KcgESXfWffvgBt8XrDc7GAFle8hKKftutaVfJQ8RuXM/M++trB4sD6CeurSUyeWCZStxUd22EmHCe7pDkLuPHuKlwI+xJ4/vrW5kjIc63BJVOihSAhuz8SxK7vOgUEDpOJitTLnPJnqn2mJdG+Z5B3DPx6s5xpT0/hiEy8rrY0DtvoniffM1UAwI1HgZ7Wp/YfyJElwympPGpvgD8X+UghE4B6m6kMNEz+CmbmYGVcoK+5YaTe98kuwOQJhLBPa/IR184UL6DYwo9sIDCyYSPq1ZdDWVF1/5TzeWLwFEzxazbKDM8Dk4EJR0gbkSGqD3wt9fxlnkpkSnECNFMslKqfzHDRCoLccckO/HCQZQtzoeZlQKKe9DT1HThNFdivIgkFnAYQA6KU4+HJUfmc8LBXPPPDnuP0V1upoYMr2IfuKXzScVJNjb+j+OCEgbAqIxc1rD2bOkOVtUty+jLFjkQBsKscElZlpsyMcLNxXKoVt4udmZF4AMl7MDJRAPnNRGmypyNUw+xaT4nYfT9Aq/kFt9N9giEZizOTVXFfIXkRRiyXXgRML9Hn/u8EfiDqD8TxWj0lRPpc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f932700-c8d5-46f3-cb5b-08ddf3910fac
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 13:17:31.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mcxrs/BCHeUJ++SKMJwUj/OjINd+BdCTbFJCttu37+7TCdngXHbyOFbezn6ISbw3mC8mGZ2azg4PIHsyM1M+Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5621
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-14_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509140126
X-Proofpoint-ORIG-GUID: RtqolA6Xk_OlDhQ7l3A8b7KVP7rKQfjc
X-Authority-Analysis: v=2.4 cv=KNpaDEFo c=1 sm=1 tr=0 ts=68c6c06e b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=m4drZJ5pBwiWW2MF4gAA:9 cc=ntf
 awl=host:13614
X-Proofpoint-GUID: RtqolA6Xk_OlDhQ7l3A8b7KVP7rKQfjc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxMiBTYWx0ZWRfXwwCtPK50kp4I
 OeCSwUtylOhC4D9APNh8b+hqmrjT3o0RBxzJzVVa3FJM+ptUqOLR2TbGR4QyPQz0ubhH+eBUUtL
 l3kqzmxQTAwBVrTeO3j0pHXJG8nblSihlPhJKH5hXJyFcdkniDxQ9wgUbPoAXlFVn/vsR9xOlDC
 fvg3/B8FDYqqtM6c3iadMTkwPuhV7FzBOrlB9ZqrWrUmVnGpN7MXflgz8j18EemRd1qBKIfX8HT
 KNW3Q+NX6CVLhPv+g6cNgfXZY2yrBisMuTUUFAirW9Aa8IYx/Ml4fKIDg6hjiCw36ZP5KVPxD+y
 0VPhPo+sjmA2ECl2r6C8QMR/j4e1wQ8t4qxhjisvXnEua8VOYJpvEnRzV0yLb5HhFIx5lQKzFq5
 x/lNx37M0hWRtRRp7KPi/fd7pD9VfQ==

On 13 Sep 2025, eugene loh uttered the following:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

with the tiny caveat below.

> ---
>  libdtrace/dt_provider_tp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
> index 33821f2c7..a6f978e3f 100644
> --- a/libdtrace/dt_provider_tp.c
> +++ b/libdtrace/dt_provider_tp.c
> @@ -208,12 +208,13 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
>  		p = buf;
>  		if (sscanf(buf, " field:%[^;]", p) <= 0)
>  			continue;
> -		sscanf(p, "__data_loc %[^;]", p);
>  
>  		/* We found a field: description - see if we should skip it. */
>  		if (argc < 0)
>  			goto skip;
>  
> +		sscanf(p, "__data_loc %[^;]", p);
> +

... why not defer the sscanf above it too? The manipulation of argc at
this point looks like this:

        argc = -skip;

(in getline loop)

                /* We found a field: description - see if we should skip it. */
                if (argc < 0)
                        goto skip;
(at loop end)
	skip:
                argc++;
        }


So if argc is < 0, it's going to *stay* like that until a given number
of getlines have happened. Doing more work than just skipping and
getlining is pointless. (This affects the next patch as much as this
one. More generally, it might be clearer to move skipping to a separate
getline loop entirely, above this one that also does all the other work.)

-- 
NULL && (void)
