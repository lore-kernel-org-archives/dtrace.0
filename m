Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F5627FD56
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 19:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655753; cv=fail; b=hyp7l0MDmOZgjsdEP5nZjo7koSVqRYhzcrXRc5x6Ak1uJ7DxV9MmfCvMMpIg4abs13+FsLgXI6HBu2WA40rAAgo1a5y295T+gxcJoQg4kA52uEKIaU8CaTsjbNF5HMKsrEZH7nLwlcUAoCqln9w8tPKPpeS/RtmdUOfDuhHuKEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655753; c=relaxed/simple;
	bh=CPnyenN6oiK8pJRJlMeu1SXXob+0nc2TY5/MGNEc/rM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PC3J4BNkY4GziNkjuTCP4xunVbZXF/M1IYR6yKYcgZM/abfNYwTkuFdrH3C9aWm7kaazad/ZZ5QsTq6SL7EIdn8xBwHa5tdFy2vOiTG4IqlwjmGzmM4U91udns0VJ0Liu3vbHeHAD7l8wWK0FSvXCd2WoWdg1uRSt8u+B4Z2950=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WA8JfvQe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=prhUerK6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WA8JfvQe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="prhUerK6"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEY3vG017327
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 19:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=+i9IOo/K/ZgCeMq7hfdUXeRejsJr2S8rVWXKy2TsHlQ=; b=
	WA8JfvQeXLIfsW8BYmMOA1HlEGdcsmbYas4CAiqJBw4OmNH1ujE7YWtJx1JCzzhY
	8A+n6Rq2PDkbL3DJb2db87APRCSFHBurIoVYOTtAqmtuoKcI4fgfbThCut8jRA7K
	0OP9elY96IIjfBfFAHGeULP/1UF1XmCvzGAEKVe3irXLlOEVf76PR8Ki2Pl62txf
	tXubSdDr071zXerOg0o1By6e9uMqhruUNAdCoiQJyIVaJb9v/GD5243AEbXdyp/C
	MsuBv0EssKRJ1Ks0CKdJXS+0FwYJsn3xbS1Kyv1YjlWgt9+87Kem+MvHGVy1KDxB
	wH8WykaTagTOvJOHzNWf/g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499jv15h5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 19:29:10 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NI5Mnx028427
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 19:29:10 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8wgxu-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 19:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xwc/fMfB2Lu6J65j4AoNXXoGOrciSewoHNeoNIwEK5cpHSk5/eVtZy6LgkNzFtSHWGfqDEktSrlX0qDYCxtE/1/T2mMOCuJJxAMzYmiFeSp+ZrNy3JIVrZS18riEQGUB0NGJHb3OlDmCiKPu90J2TxSGASvq6NHXuVUvxJiiqbo2MFN9vmKf4Ux0D+drxB/H2aEqHaxI4n1oDsj0XIizNUUvwYD9TM2j6GQR426I/nNPc2ayBaBjgqtzXKHcxWndSs3JQ5TsbytyGw/uZqNKZEKzV4ZyKpxtdGfLEV1eLOAQljWO9lThYN4aWwjL5pyCkH8K/oylAbgDbCndeWIT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+i9IOo/K/ZgCeMq7hfdUXeRejsJr2S8rVWXKy2TsHlQ=;
 b=HwXQkJAkZlG2JoOv2L3/UXqHR6RlpLM4Vg9V/+njviAA1xV7+yDpUPOZAgwMDoaYxmhS3HcxQ/2n/nNF+/M1Gr3f8U1NJQOLtws4EgKNTT+rfCAZLTYU4f1OXLe0XTAig8NMXvp+pMgykFwS1hUIW5DqbAtSi5gdNDRY8VtwOSIOF7Exm1ast9kYaFbRCuH6+2CRLLRMbUPWEUSQ6s2+v/JfBJ7DXmoo8Q4JGCzxVftG7xFSckG1WkvAPhz0Xs34N1hfGDS/JEwlrtLNXJ7GZfxCmg3UROZbuYmm+Uusqy3JZo2T9zjC0yKxk6jbpAlpAx2bdPVNEWCZ+ms4pWyrDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+i9IOo/K/ZgCeMq7hfdUXeRejsJr2S8rVWXKy2TsHlQ=;
 b=prhUerK6VxQqkhmEPP/oIgn19bA3LAH4JRxGPxDB0EV4Epp9o0/sFulXSMcONMFwjVF3uSgIo/dh+TFM2AkLZ6k0O7MiDYarFscKLMo3zfzBXHGk9ieaPqHOqJ8xtvmSuYm3VmtGC4Oz7zjogdQF8yl7O8PoXftaS79tFJgCSFI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8093.namprd10.prod.outlook.com (2603:10b6:208:4f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 19:29:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 19:29:07 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] WIP: Update NEWS and dtrace.spec for release 2.0.4
Date: Tue, 23 Sep 2025 15:29:05 -0400
Message-Id: <20250923192905.2277-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0067.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::28) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e61f2b-a804-4a9a-c177-08ddfad77694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UkywJ+naUwTFYCDG8OicUg+lO2N8Knvka9VVRGzfvknHQmt6XqlePGJX+/f6?=
 =?us-ascii?Q?k4oH3sOPdq9IPW0idZiiDKQJ3vt6AnjUnWE6N3qyPV5tasmFceKECsSl605A?=
 =?us-ascii?Q?D7SFspGepEEcMR83xUJddHwt1Kk6ReUpC3CE0wbW6YzJ4gIXwMoZddVQ82us?=
 =?us-ascii?Q?x4a8Zf6HwHivieoz6w2eR3qPFsl1v95vp5C4Iyx6whvllsMWjPgqNHj2T/fD?=
 =?us-ascii?Q?BGjjbGEjJrQ7N/daoNkVoZ/IIlWOZKppXp06/GjP7p5zkn5SfM395neWqQOU?=
 =?us-ascii?Q?Huf4PA+9rALCxdIPNoUEDna1WTCuDCFU1Sd/oM/1mPaDePzqWlJrhPhU2eJ+?=
 =?us-ascii?Q?KZB0oC0o/3PPvDyxF32hFFdlyJ6EXjnhqzvm4m6GJY5ruNShthIKdVtA+6ge?=
 =?us-ascii?Q?9OX6vXhGGij7zhLWNsaIoOFj0qGyYj/7+galOvJiUlxqQ4l8ecHqUAgjEZ09?=
 =?us-ascii?Q?7wqY7ym8k7MYPxHfTx4Rtxw+YgTyMj7YsDXB3uV5GXEHUJq2/Nur/9+KEiJJ?=
 =?us-ascii?Q?MXWBIQNO0xpJ727RJsam8fiFSn5WOGd5JZYUpaSTEpPv+rRAVaCbdOZXR5Y8?=
 =?us-ascii?Q?9CKXMDMX58GsoXaefX6F4te1laeEvUJSc8vvi5IbIVL17M9mnXtB8M6sqfhF?=
 =?us-ascii?Q?2gA1cWT5EvRruiTO5at+nlaAusg2JEDqUo79Wu4eLzkraYV1+o2lNOHMBH9o?=
 =?us-ascii?Q?aW8RUXRzWjG6LXWdqiofMPBN5DDwLGUepoUiZuRMNW3g6MDjJ9vvmQ1brFFd?=
 =?us-ascii?Q?gWeRxwL6hqcKah0CDkR1SE+upn0IHxkXzC+57I0nNoJpFfU9vY+qUmXdCc9G?=
 =?us-ascii?Q?yLTELcGDy4Zf9xZl0QZq2LpSG8AEUSD8llxWuLmkY1Fa2YDnGIowXn7w1u5n?=
 =?us-ascii?Q?fYYVOsQD7prXYfm0DA/aPHKnVenXbVEOxW1cXVDeerkCjoTvMhMEVI9oOl5C?=
 =?us-ascii?Q?WeGPE/8FjIdVGCMEumZVhFqTazVVgWKetL1Sm1YEuZyFcLxrjbcfF5srp9NV?=
 =?us-ascii?Q?bUvsmRU82nTE0kIuddQzZygm018yu3a8L0pSzeB8UD1f6qUT65lpYhXPw6Yt?=
 =?us-ascii?Q?VJKKzTj0lcUjUCVM3m2x912NC7qljLHx6xxccHlumFdklLG2QebfA5mtxcVA?=
 =?us-ascii?Q?nUrlTnQzHf2N0UnfeYmNzxMSAvDla3EouWwjaQAT4nb9aqDfxeVFO15zlpQQ?=
 =?us-ascii?Q?PQN+KTSbF10dzBMlV9GMKLygJ+wLMyNI4/1XipgGn5gqxVGYntJb2AvEr0Zs?=
 =?us-ascii?Q?LUKGlkmY0BbmO6GoJ4pSrTsW0LiABNAxiqJjyAOkGEMGRyE9FlOO0i64NhYu?=
 =?us-ascii?Q?Bfl0wjzUsNPF2fqVAphlJi/4SBf5oqP1MF5cKlj0uMOod0vTsosPEVT3S8vG?=
 =?us-ascii?Q?9PRGMXTVxJriTJZr/7cJmFypuNdTSV02AtVvqWhhZJX5l6veemsEJe5HZoU7?=
 =?us-ascii?Q?tfT7COyxh+U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KQbvQ9ej6uyMjQz8ID8i71GLO6bpiT/hWXMJCfUY3iCl+tg+++dS/TXa8Frb?=
 =?us-ascii?Q?enJM7xM75v9xxkF5AiUzs+GevV4pUV9NLSnkSIMwAgoanlR40U24G++g+kUA?=
 =?us-ascii?Q?mzVK3Xin0Nhc+WwlYuCGlRK/w0Rwo14rvJ7X9goojMpF7xKb5oqTwJMo17Rb?=
 =?us-ascii?Q?Krd/EvTzEc897z9CmP+lne8T7fXNJdn+uodueuXOrnPDXycxrieUXJeSJkKt?=
 =?us-ascii?Q?QeAP4+XKeg59f20Tbzdr9T4KjYxN5KMgUVGJRn2c7W4uuEzHS35S++ZKLQpU?=
 =?us-ascii?Q?HRh/dWNG6CyJhggFF8rMwknruJMDS/A5O9P0xqbuHgojE/5ZIZHAJtV3k4zJ?=
 =?us-ascii?Q?Pw/XwYzAbG0vlC2O/TygpYTJOrbb4MtghVr5Vsf32U21oPu0zKeeU+2dMRpc?=
 =?us-ascii?Q?fKy7nBkHoUnd7ZUGtbGj05xhyOv5vhJDo3qMdkSo60zLAN3rv6M1Y96RLXZs?=
 =?us-ascii?Q?oIqvmct40ZCj33SS4dzXvYxZsb9mPy8iqnxFab3YGl3VuCHkB7pe2mN7v9Y5?=
 =?us-ascii?Q?vDM+zkexfHCN/Vc7VFx41CUorunZ3w7DUUfaT+WCgMdg2L/D8TqWODdMJ6yZ?=
 =?us-ascii?Q?6cSheiEh6Qkd+nGXxveUOXNH5ZMQmhH57gUlqMV++T8Vygb4VvT+9Ui5CjHf?=
 =?us-ascii?Q?ZBGqwvPrYfFeeAUDIMuiYGZPOtZegq0MjGRS6IhPzMMLjgf7hh8zNuCjAZBr?=
 =?us-ascii?Q?ns+4YLikDeAQqLqVk6eA8ExZRiy8MW0Wf3TvRv4UvbWTeUTjlTWirBfjSsuO?=
 =?us-ascii?Q?4PF5FLyLRLTDbC0L+sAkKPddHAR3GczzmN5Rx7JpBmHyQ+CDpfLmrn+P/e54?=
 =?us-ascii?Q?AiLXEbS1zpzjhxxHviTzw95hfjsyFqe/7e03zEaCD4vCfd6MXeEgROrhpn27?=
 =?us-ascii?Q?yVj4m1elLwPRHHpHDyuZxWaFVLBYV8wcaAU3IuhDLs/WLL+KkGsLL40KXzoS?=
 =?us-ascii?Q?tvGOA4FYuaBPIh8gNRC+NOj9D4OdMD7HVzxS/n7h9O9pUtOcf3R2C3kMaUeO?=
 =?us-ascii?Q?cwlLruhOKvq8coLIYmtAOsifgHI1N6OjgVK2g4Zan4rhWOy49/L2Ic+cujZZ?=
 =?us-ascii?Q?zTeorJu7mKON7Nr2qrxVfG+hS0Dp5/+snwnv5JvmyVA1JzMG+c/k9Sh4O74n?=
 =?us-ascii?Q?VWJL9fc+oXFyAcrJ3EHdbbZdYqpES96l4H7xuYfUe+JTnWsGl5ti1o9yXGZH?=
 =?us-ascii?Q?qhgETdOtS6sC/V4Q4ly4TWkus/s4qbCQHxUYzgIkRWdHIvkqhOih2KK5+SSG?=
 =?us-ascii?Q?YR9jBhNxGqlLPeSyF8uZUWCZR5GWXPpWCP9lYUDYOsGAeeSp1GJULjqCCJ8b?=
 =?us-ascii?Q?U93RG8r8CKAf+Q/aKFtvVU+EEvhShn+E/JsSyAXAE3welxW36iPBktL7WIY5?=
 =?us-ascii?Q?dpyuKVkGKT0hXbzt5pnDadiTHXGR+8gMVVXeMewQU8p3gDvbpbxaNonS0/6q?=
 =?us-ascii?Q?g3KMOEoqv8iZfvT+VumBbnBVv1foad/rrLFfZImUVonnAoyzCcrXVWPS0lBH?=
 =?us-ascii?Q?oXB6wGrJjB1pEYjkmxOdMODf1e723OKfY8rcZ1FqnysmSuxdVYph8ni0ers/?=
 =?us-ascii?Q?h8LK9c0YDP6PsFsMeXhtKwLG/DOBmIyBoPVDKt6f?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hITjDzYIr5Q/vsnDIkh3oFia8tkM1gN4ffYF5VnpOkQOdeG81aYn18dF9kMtbhu7xGTIbUnOrcyigRvtToNBltilXU9RLAZWtKb+612RWPDWnvVD+kwM3QWFArVOl1ZlPxThY4vyZYozphSTG914ymUFRF8wOKxwmnKs2HCTt+fshEB87fxcd381pRk+fU9yDaOwZKDCgLKTmYUKSD/7ikHx3ZIOA9BGHL0WuVIVEXvRm65/df4r/l+fStZudRr7w07z3SuN26sNCm+ZEpnjyUgSYJEgdI7Ye7Ct2Wg9CMkz8eCTDrpqY/H+rPLY9/AL1ICq0RtTl0Q7hIkEUMEJUMwZ6lC6MgWZFyMrKDUY8OrSkoR+emmilQcqQtRio6vmUIk6+pkWmG3VCinunQz4MKheN6ytSAZLZAgVH1F9VoqPRXguvAnOJcWYIjEefRdkDIf59kJV02Ucn8HaDf5fmmBob8h5gjS94Vod6FQqFLQ/C9NdMGfOezsSVGymNqhb78YLZ2qF0GnNs7WGsVnxEsS7CzFcCHYobUU0nU5lspTpeGtsEGUK80Gwhu9aNbw0SOmdfUyg5x9Z6c6/pttEuEi2cqtWs3kzHX4pAbE4960=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e61f2b-a804-4a9a-c177-08ddfad77694
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 19:29:07.2567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3RJ9gm0d4Vcyp8q5Jjvt2wyw4ve00Ho42kjuPFcVdJ7ugVyGmMwE+wmQhSCDeeHumGgfRpiiIvZCCRbVmVleQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8093
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230178
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxMyBTYWx0ZWRfXybSkULAdoitU
 RJt17PWm7VraiRiEM3BmasOGvL+5tM2hUCE90tfLdi/0pfB35VeLwz24xyVdkDMOFPR2JesHXdq
 bTTMiTyXmItH0NMslqkv4/KKzMtGLBkUg3Y0vATagcN37mvPSk9F+cNUHV8xB9JYc6fWwZN5L1E
 dSZrTDjNrFaZ+21L0qr5PsxUajBKG8OzZdmEyBq2uZNg6Gl735++QxeZNMkt9348/2/N+M5nWYu
 pK+8uQPJr7gZzUJ/BVFNl2HNI0EVtt7bAHvI20EBF695PVhBPn0yZbmH8MY2bIu5yVFS+jPHhej
 2TV6rgjH8UUupB5XBsde99lhbyKT6a6EyTSKdW2rg/FhUDAphOgG4wV5pQ9lNOgrxPhSQ4N6oRQ
 09RG0Ig8
X-Proofpoint-GUID: oxsEctPBNj9n_pLoxyzILWnM3q5-vI0e
X-Authority-Analysis: v=2.4 cv=YrMPR5YX c=1 sm=1 tr=0 ts=68d2f507 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=HrAuVk7q57-0hI7mpN8A:9
X-Proofpoint-ORIG-GUID: oxsEctPBNj9n_pLoxyzILWnM3q5-vI0e

From: Eugene Loh <eugene.loh@oracle.com>

WIP status:  Summarize work...
    starting after patch
        6b7ccc9d6 Update NEWS and dtrace.spec for release 2.0.3
    going up to and including patch
        ad6cc1cbc Add LLM context file.

WIP to-do:
    incorporate any last-minute patches
    update the XX dates in both NEWS and dtrace.spec changelog

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 NEWS        | 117 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 dtrace.spec |  15 ++++++-
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/NEWS b/NEWS
index aa61b6bfe..60c834362 100644
--- a/NEWS
+++ b/NEWS
@@ -1,3 +1,120 @@
+2.0.4-1 (Sep XXth, 2025)
+------------------------
+
+New features:
+
+ - The TCP and UDP providers have been implemented.
+
+ - An stapsdt provider has been implemented for user-space static probes
+   defined via stapsdt ELF notes.  The provider also supports probes created
+   dynamically via libstapsdt.
+
+ - The User's Guide is now part of the git repository in Markdown form and
+   part of an install.
+
+ - Example scripts are now part of the git repository.
+
+ - There is now a context file, which explains DTrace, to use with LLMs.
+
+ - Comments using // are now supported.
+
+ - The return() action is now implemented, allowing error injection by forcing
+   a given return value for a kernel function.
+
+Bugfixes:
+
+ - A commonplace problem with dynamics variables overwriting one another was
+   identified and fixed.
+
+ - fbt probes in the "dtrace -l" listing have been restored.
+
+ - Function names have been restored to pid return probes.
+
+ - The built-in variables caller and stackdepth have been corrected by
+   recognizing when additional BPF stack frames must be skipped.
+
+ - The use of -w is now required for destructive actions, even if a clause is
+   being ignored with -Z.
+
+ - Both 'cwd' and 'root' now work (and other inline vars are now tested).
+
+User-visible changes:
+
+ - DIFO is now freed once a probe is loaded, substantially reducing memory
+   consumption when a lot of probes are specified.
+
+ - Per-CPU agg-map IDs are now cached, substantially improving trunc()
+   performance on the consumer side on many-CPU systems.
+
+ - D compilation now allows enum declarations where the last enumerator value
+   is followed by a comma.
+
+ - alloca() pointers are now printed as actual pointer values into kernel space
+   rather than as relatively small offsets into the DTrace scratch memory area.
+
+ - Strings are now handled better with regards to empty strings, the meaning of
+   strsize, testing, and NUL padding.
+
+ - SDT probes that were not firing because they were dependent on fbt probes
+   that were not firing with the fentry/freturn implementation are now dependent
+   on rawfbt probes (kprobes).
+
+ - The USDT parser now handles encoded hyphens.
+
+ - Function Psystem_daemon() now has better logic for detecting system daemons.
+
+ - Management of CTF and BTF data has been improved.  E.g.,
+
+   - If the kernel is not compiled with CTF or BTF, there is an error message.
+
+   - There is now an -xbtfpath option, with -xbtfpath=none disabling the use
+     of BTF data.
+
+   - A BTF ID symbol lookup now checks that the module BTF data is loaded.
+
+Internal changes:
+
+ - The mechanism to skip common fields when querying tracepoint probe arguments
+   is now more robust.
+
+ - The subtraction of two alloca() pointers no longer receives the ALLOCA taint.
+
+ - tstrings are now managed better, including elimination of some leaks,
+   thereby allowing more complex expressions.
+
+ - Aggregations are now snapshot "just in time" for theoretically better
+   performance and for more consistent reporting.
+
+ - DTrace version numbering is now consolidated.
+
+ - References in dlibs to major_names now explicitly mention vmlinux, so as to
+   avoid loading modules needlessly.
+
+ - USDT discovery has been optimized a little.  USDT memory leaks in hash
+   tables have been cleaned up.
+
+ - Some unused variables have been eliminated.
+
+Testsuite changes:
+
+ - Various tests have been made more stringent, reliable, or suitable for newer
+   kernels.
+
+ - Test dependence on tick-* probes has once again been reduced yet further.
+
+ - New tests have been added for more coverage.
+
+ - .r.p files have been moved from /bin/sh to /bin/bash for better behavior on
+   more distributions.
+
+ - Script get_remote.sh is now installed for better testing of RPMs.
+
+Build-time:
+
+ - BPF library functions are now compiled with -ffreestanding.
+
+ - The developer package now includes previous omissions.
+
 2.0.3-1 (Jun 10th, 2025)
 ------------------------
 
diff --git a/dtrace.spec b/dtrace.spec
index a325993a6..0fb4df04e 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -72,7 +72,7 @@ Requires:     libdtrace-ctf >= 1.1.0
 BuildRequires: libdtrace-ctf-devel >= 1.1.0
 %endif
 Summary:      DTrace user interface.
-Version:      2.0.3
+Version:      2.0.4
 Release:      1%{?dist}
 Source:       dtrace-%{version}.tar.bz2
 BuildRoot:    %{_tmppath}/%{name}-%{version}-build
@@ -230,6 +230,19 @@ systemctl start dtprobed || :
 %{_libdir}/dtrace/testsuite
 
 %changelog
+* XXX Sep XX 2025 Eugene Loh <eugene.loh@oracle.com> - 2.0.4-1
+- TCP, UDP, and stapsdt providers implemented.  (Alan Maguire)
+- New learning materials:  the User's Guide in Markdown format,
+  example scripts, and a context file for LLMs.
+  (Eugene Loh, Bruce McCulloch, Ruud van der Pas, Elena Zannoni).
+- Comments using // are now supported.  (Kris Van Hees)
+- Scalability improvements.  (Kris Van Hees)
+- Error injection via return() action.  (Kris Van Hees)
+- Improved string handling.  (Kris Van Hees)
+- Various bug fixes.  (Eugene Loh, Kris Van Hees)
+- Various testsuite fixes and improvements.
+  (Nick Alcock, Eugene Loh, Alan Maguire, Kris Van Hees)
+
 * Tue Jun 10 2025 Kris Van Hees <kris.van.hees@oracle.com> - 2.0.3-1
 - This is only released on OL10.
 - Redesigned USDT support to work for LTO compilations.  [Orabug: 38011704]
-- 
2.47.3

