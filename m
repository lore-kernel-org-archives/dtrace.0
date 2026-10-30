Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793389094;
	b=d4NfEGJNrhSbUuracH9TofCNPaIcyA4ep0km4bCluuEdBbDBsaX7E3oDnYXCkQ2qt0BE
	 hRDDwbS3PfqM6/BELzFxevRTlTNK8w/wcnqjaGl/+K4J0v2A9Bww5R4j6UgQJ+80Sw0Cu
	 rj8kv6WweFNXiaWP5ZqlmjfBOUfHymmUObUCbzB/17H2xQ02inu8GuLbK5rSYTO7ESZQd
	 KdAt9Zx35ar/F+A/mJ00CRNAPB64G7cF9wsLnZpkDriyoN+Il/CPJ933WJnUU5ENNXPHG
	 MKQBgUNbxXbopkDyVVC0huTMNXETszd/3cucdpxbQo0UhauOb6C1L7OsrzKpgekjhzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389094;
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
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc;
	bh=Kikd3WfZ3Ay0LLeSqM49s4V+pQSt+I9dB5HiRk7FaIY=;
	b=4pLcyhuwavuqi9IlkzbZOAQsqGqzy1QAfe46TxFUJYKQLrcYKU9nczvwjAsUreSeugeU
	 k8F9ZFeG8F/UbBc9Y+wLseOjIcQKQpj9U1eCeyP8h8jDMyLPYBri8LUmnK8iVY6MKPl6b
	 1mFrIQONyrUAoS660BLJse5IH6PnaDCYj1d1KrRtsFeqbplWQAPcgUlZjq/zb5gqhdPLV
	 kSfpzZJKEmmdomTEA305Br0FsIZK8/0eAM5L9mCJmklTTFZXKsZXc42Qsnd5+GK13GJO8
	 AnmYo/44CmzcR5ZQk70Wg8Eg6Spihs6bf1fFUQWzxRHGAnnE+1u8kPSjCdYARxB2xrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=VdnRXjZ0;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=iIR5OxqD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.165.32
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD89A606A31A
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD89A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=VdnRXjZ0;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=iIR5OxqD
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UEYRYW1603768
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Kikd3WfZ3Ay0LLeSqM49s4V+pQSt+I9dB5HiRk7FaIY=; b=
	VdnRXjZ0CmaXXCUvGXtllVqbxHnstXFxtVFgGg7RaWLpAZeeO1hXVxSsnK0TZnE6
	TJ0KLZHvUumK5NCDOIXufCJWsVpYCBiXmzEKk96kSRwAGtXiuoQZD3Axz1yuvE04
	h9PGktNesPpWalDAAgR/8DOeSUf3VLn8u5Wje/YVc19+R3laITQRkdkB4Hlw8JQg
	Av/j4HITKaFH7cDp/gf3mEvrLQdcDx/SILniMCnNqUiZZCbkRkM3gyBcpmEsanqx
	cZBsG8fxRyLLn+gSFj7vhvFaNPINqmN5IIFzZIGE2/L5dQTIkgSGE8gYHj96oNeX
	0EsphVUNXLVjjCdSYmYwrA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hme5qhdq7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69UHviTt433734
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:12 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4hmyuy3hrt-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Fri, 30 Oct 2026 19:38:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soM9ZSIWqrAmijapHTCLcJehTYlOaiN7hSJODQwNmb8IYyGvERk1A18GMhE7F6CqxenhsRwWwcEaHWYHBfCKPnDwJC2dR0J9NnhTwVp7J/J731UEF1lWbVxP3fI53Y8EMKIoo6ykALVAYMfjsS1F4x/UNMh+V2Lg6eAP8JdeoxV5z13FF2Z23MXu0knM/Chl/F50/DDJlgn9ZjGJWy8UswOQW+wtTFtcznu5uqwdXIj/j8+TBLmAlbE6ifnnrnRUBxlBV7Owl8yxkm6BvmhDzHPqMsuOc+NzL4Kbco6xC57xXCjlRtiBPmL9He+HoTUYHhDLcStCyKcgQl3qlxDbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kikd3WfZ3Ay0LLeSqM49s4V+pQSt+I9dB5HiRk7FaIY=;
 b=ruFSxh3FMXh0gWGilgAtlRjFHY7MMgwn++30CYGmMe0Y8bhkXAyLU8ilPYfuLc8bNC8nkUrmhpKscThE79diuNUwJFH6EttBqOp15wza8FfNL0Vym9INAGiTrY8VyZUi0ZzRp5xnkXVpZbMiZOGGAOWDfTjCOZZnJcs4zutB7isoBRWsjpS8pQKDKwq4dWYcWmr6i5/hslXNLNgeML3BdoqROMkXUR/ezjUA3ECqUrof4dl6S/lDY4CsJ8ZoxuPntwo6hUpWh3eiG10jEeiDwgiSKDECarlt2rZoDrFnQY9E3FqUNmnw8k/o9BD3t8Bh8s+UfXEySBI/UnGWBdU1Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kikd3WfZ3Ay0LLeSqM49s4V+pQSt+I9dB5HiRk7FaIY=;
 b=iIR5OxqD2aRT5ESY+rYydoARjySGyq4b/UUC1FQwTtWTi39P7r3bgU8YCwd0nSRBtVaettZuSrDQBoUOwboMJMWICy1xpaMwXhCmvGJmnbGG/pOrbqKyuPO1+L6W/9otzSWFTrEZkW8EJ24AGAdkqJTtyNuy65b6IOHKj3rCKvA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH5PR10MB997710.namprd10.prod.outlook.com with HTTP via P2P; Fri, 30 Oct
 2026 19:38:10 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::ada4:9b51:3a74:3649%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 19:38:10 +0000
Date: Fri, 30 Oct 2026 19:36:35 +0000
Message-ID: <62cfb7eb8b923ab975f376f7850c0a83@oracle.com>
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 05/20] btf: stop resolving cyclic type references
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0014.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::29) To CO1PR10MB4769.namprd10.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH5PR10MB997710:EE_
X-MS-PublicTrafficType: Email
client-request-id: 1f4538e0-2da2-4f73-9465-40a4fe74f333
request-id: 08df72aa-3da3-4827-efd0-08df36bd543a
X-MS-Office365-Filtering-Correlation-Id: 08df72aa-3da3-4827-efd0-08df36bd543a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|261009223027099003|261028144727099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003|10067099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	aZK5teOnaiioJZnSnIJfsfGAUWMp96aPg2mplI31WR98sSPo/h9PoLi6JavwrXgjbQP8TBdqPRVcPV+g/yVD1Yc1YHSX+q02o4kbvTFk+E7daZortpcvGXbbr4kEq+HpqsDQ0P6WGV29AYGiOiwhr/zsGNqiI6KW/wbdHT5BYrdvhR6IgIta2LALqE3aFWDGisBfJdXuK7OfhxpEJi9FaiE6k5+0WrojWyAGhaw2IH0EU4ozfb9r9wv/5bV5xdMxJrTDxjQOZQnNne9tWCgRe0gHOb4Bmm6q9KNLJ0lipDWVc+sV5pWf4BG14lLlIkzbWnPzAR5lEtvNkKVvD63lfzei5sRQ/ofEMVj+pv9/HSjKaeLsVlKzzWoVlh9V9q2oD4kkvpIsP/7rn+/lwylS5aojHxmqgEt26dF3AYUgsJuv3QaN2u9UanhbS/1+//9YEqEaoj3gsayBy0KK0zUsqN3T3olji4VMYMHxISfjSOAF3khg40ruJsivhrg9lyyDhig7cYYU4Rbfof95wpza9Jdmc9ercd4u5ZaeVkEVdQu+L14YzSu1lWDghZnwMlxKQo9Y8FkR4uZDymmfwn/cOMzB2DH+jyhuU0zu8G6Z9T7yqoyZq0TTfvmUUP57s5n4fsJShpXljzeawyl7peLbwrZysNNdfE+FCwG/xU90JpQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(261009223027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KSwnTxk7R/Ajg24GZsk5HZDx1OQzoTJs2MY/0jfqKZRp7wakAI/EwXwIAAYW?=
 =?us-ascii?Q?I/s3Ls4fSv2ZQmda2S+jl2UF27N7XPMYkzKwPbiq1fFm63gJ1QnbwIi26Vbm?=
 =?us-ascii?Q?S+klfEOMNeNAvzR8HPa33Ldg/4+iNu3A9hnj8BEKFdHnwOF0eRobl2wifVij?=
 =?us-ascii?Q?m1TOKaXeNkvlZzuTi0f9DWKAKE10v/XhBH05QSHQiRVJW95DOckCTV85LXCJ?=
 =?us-ascii?Q?ujE5+Z3qDfikDoq+YZmvCpTdhOGqoITyMRVWjg1e/e1Ds6Fj3oXoBO9qU582?=
 =?us-ascii?Q?56SE7fbFmkyBiTWDckYjUVBi45lquhI8tNOpP9gbYaIYZrr7avzQuntmg/uV?=
 =?us-ascii?Q?ZPtYKgAOP5rOfP0BYnbaX49S+Xijbc10M6hr2S1sGkriuJSx8gOPHSzNzIq4?=
 =?us-ascii?Q?GXatMSsggIcahdF1nDt4e7IrFrVU1dzN/WdZDT8lmg5Mlkpcxq+BYhS6dFeF?=
 =?us-ascii?Q?5zIeJDazjQzqwmP10paBbA0H2UvCQX5XYQS9C4364CWszheNoptfYCgUIrvE?=
 =?us-ascii?Q?p9A3uXC+TV6e59GFXmtDvS8pWm5Sp7s4aBY90JM0CF/Oj9MhLukMgcGsmff3?=
 =?us-ascii?Q?elw5qbL/FQzeHrSZndRtXrSvcZnyYexr3GgAbgAnw7n9q4/dICI+oDQAlKJF?=
 =?us-ascii?Q?Ip640wGExpyhkTxH76PmXQdO2yBG9NdfxevKQ3pB1cJGn4Y/Lqiq/cwZTqOj?=
 =?us-ascii?Q?5WB25UuJPo2E3FG/1MwEJ9E5MXkthfG+FcNyrePSz8YGD9UX8FUEbRKs7VVx?=
 =?us-ascii?Q?FFo936OW4C77QysFTFupoo3TF7nqfPL97wKS024IryY+UsA8vsQPlombfstX?=
 =?us-ascii?Q?t76g2gE3jMgHf3JapKxaK8jWhIzruMqMCq6Xq8zm7mc0fRNpw9SEMBJ1RD6f?=
 =?us-ascii?Q?xDd3Vy7X6C9M/oC5917YN1E6WQGq9X03FaR/NfQ6Slc6YPuDBRW20+CNKcqO?=
 =?us-ascii?Q?LUdJMIUVRSuHh6f6PYaOvGlQFy3MBGlYtIYFxM7dDbFg05hSMm5kvL1nyNHi?=
 =?us-ascii?Q?yshuJx4nNNs+XVfJAplWW8pwSbltB8rkkJ/rcCloKfMMIjyR1035OGCnWJti?=
 =?us-ascii?Q?VMP1RzgLsuVdx6RrdZVlg+N0wK9fP8PeAMHd5WcfmySrd1+CGncC/O0QdBqF?=
 =?us-ascii?Q?+qOWGg1OzjsSKZDUP+UZsF/SjYabsCaxxtGB0MgkccqN4QpHsKDHfOcAwHwW?=
 =?us-ascii?Q?5XciEjkcln+mtTOBJTatnPpOCivlsvVYcFuusrWdqFJvL99j1JiJsnQfVb9C?=
 =?us-ascii?Q?jJdxtEPLMmCvj0idHbBiRpoR8hp5ob+XZY0uL4Emdd0SRwauWLx/o0E1LeVR?=
 =?us-ascii?Q?pMKfzYNaMwH1brwk9fwJ/toNtqJXvZnJYHfNeijZL6VGwaDgaYUN8TOVDeqS?=
 =?us-ascii?Q?jgyRYeeV1hdtMHsi7bckP6C8jXlOBaQ3i/oebXxdz//zPWQmxEjNRqob7NcE?=
 =?us-ascii?Q?ztkiSlBePiU1mRvHGzItnOEN4M5B7/P3W+kcKcBJjB4xdceIax9WMGr839H5?=
 =?us-ascii?Q?oIuTiK4cTmGOcAHfp5+ziV+VaGF2MYCyRuDuTkPjWwCYCOEnCyq0ncbBtPBi?=
 =?us-ascii?Q?W88POS1UJmSmmxr4I7xAJjasO4o42ZTVO+ZPWJ9Jmd/wFpGGsZeF6G6hz1v0?=
 =?us-ascii?Q?wdsf1+MNU8Ur93j9Uqb91s9Nq+qUs77CDCvf/i+ReKi33sOcV3yz26RLtGAG?=
 =?us-ascii?Q?K2eGTmLDVAfNONN2Y/vSWduRAbcPdJxmmVsXKNJMmmb0mQhtw94ECtURrLAX?=
 =?us-ascii?Q?gVuafDODANK47uj5hylLVa1OFVTlTjs=3D?=
X-Exchange-RoutingPolicyChecked:
	VelhG7dPCuBoLk1WhYr4l7NwAUsiOgvWtc2x2VYK0kyyV/LU7HvAh03jZ1THAxE7XEdf5gUD2sS+IP0m9T4kR7cygIW0Yw8OM6jUIc4uHf3GEe7WWX6WyrGqosGf6SQTzYXi3fNLw1lOwP/Jf5S2n5BOVSgJlZ2JSBCaaMAuzxtxgP9B1Tf1cvBiGTrbhmIWaHJlInH/98pbXN1+GtttK98bVp45HyNzOfRqdNEqhIv8ukS4L976L4nabdg1L+6vMYHeVEW3WzNni+YsyyWTI8yB2HaH5IBOritiS1X7zDSIqbWRIsxmCVDZZORAVZUFXekSS/6icE8j+aO0xJrb/Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7RLOCvBS8642pE0qlqHvtxbcr0J6fCe+x+Ba+raXEx/pzBN8yYSxkL0GCikjI/gROqr1wr5w/IqX2uugmE70wnyg6IbEb6oIwcQHFb1sh+deasQWnffynyfG/5fE1cnDcQSSURAcMuiXjqJqhOrCyhooRucU4gLQeZA/KECpqN5t7UqqR2pqZLZKGzeUbx9iqTI1bOKrOL12mbn37zpo+sjemepwPhuElXgSShqKkZZEsMFF99yavs86oMYGAUImij1GtdhC7Qk2h4pJ7F4V5GFPA40gBcESw8z4KFOj9EK10G8bdg1eCyhCOzZg1pP1tkzOVnA2g0pOewi+uD3LIhtkazwl58HZM9yL1w8Wi8o8GxpPnYzLd/4F6L78fEzd08433PS+bzwuuxdp0clF7aiLW1IkOolxgfv893r5Fr6RlsfBV0leJ7bvHc2WaDLMDQ3Jt7Vi1IPjBc3alF0n1rfAG+nQRXODzzQzgozWj/upCGxep6ehEWFa0crSNPcu5IlBXIdC9np3z9pXdluPrbp3E0czpLugtW14ZpLJ8nL4QDX0HRhyhEFDfGJ2RwIAakDQJyhJL1i9d8Ieaz9AjAHSFn7DJt286LW2+KcCfV8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08df72aa-3da3-4827-efd0-08df36bd543a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 19:38:10.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Dh3KJTQkfTlvV7cseSRUSHkKhY3GsdKJoORQi4CWXiDOfHs2QA6atXQbliw8KYJPgffOULxWdz6hLOtTOiyan+m5wJXbXmNNGQcFnMyZcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997710
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2610190000 definitions=main-2610300078
X-Authority-Analysis: v=2.4 cv=OrbaWC/t c=1 sm=1 tr=0 ts=6ae4f224 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8 a=U4HdvZLnAAAA:8
 a=Fp5kR9G45p-0VFG59m0A:9 a=WmVTiCyuxqgg3mnwYu6p:22 a=bvn03Iw4QUXGFMcVqUo5:22
X-Proofpoint-GUID: DQySL50Acyku6_dL0UsklEJle3PTFuej
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX1iibeEOxIPfv
 cvqjRwt1gGJvg1hGYYNwQOOWyUNJjpGAND1Xeo6KxNgH50w+Ctz8PMq1PJShD0oTR0BDB87bBY0
 KpDZ3Q3ZEHJtYwBANepAgd/nG8t2PHV6tyZyv241xXjtBzbH3QII
X-Proofpoint-ORIG-GUID: DQySL50Acyku6_dL0UsklEJle3PTFuej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA3OCBTYWx0ZWRfX2xm2F36Isyk1
 k7o4CpDBv+TXolKHqTJIIZ3hLF8/bGqOgoIEy9mPH4JbRFCOCyaYW2e9pnkbAFBncoIW6NK0TRV
 bHrocCgzv+utqbWRGL+UdeKV7vxZfZmmrAy39y5Zh2A+k7MDTNXodbt/bug1ksvPphkgmMzoXCN
 dO667L+WJbhBqktA5eVpf4hPDi1QzWpWQFs1vkr0PSm5RaNCUDZBoG8YtQb/X5A6OfPP4bjY4RX
 CwLWpFbhlxQoqMYDS+BHhoaGm8qH5/7pfr2HnBgE9YZnKV+oAhFsSU2knTUwd9VQU9QNREW/2DL
 wBM2NUy4qUamvDEV7uoTGhFUbRxyMeNIB4RFtHEKwNPjAQ2keCPDtLktKKIyH2z2OKwg37uzEJl
 2iwFOu5sttVlqT1plcphQlyhCMJV2t2XcaC/iDtfxoeee21Du1cAz/BH5gZO8OQK7H38X34mZB4
 iI+QTAC1ULt7ShVb90Q==

test: expand BTF cyclic type resolution coverage
---
 libdtrace/dt_btf.c                     |   8 +-
 test/internals/btf/tst.cyclic-types.sh |  18 ++++
 test/triggers/Build                    |   8 +-
 test/triggers/btf-cyclic-types.c       | 113 +++++++++++++++++++++++++
 4 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100755 test/internals/btf/tst.cyclic-types.sh
 create mode 100644 test/triggers/btf-cyclic-types.c

diff --git a/libdtrace/dt_btf.c b/libdtrace/dt_btf.c
index 194a251c..039742d1 100644
--- a/libdtrace/dt_btf.c
+++ b/libdtrace/dt_btf.c
@@ -100,8 +100,14 @@ static btf_type_t *
 dt_btf_real_type_by_id(const dt_btf_t *btf, int32_t id)
 {
 	btf_type_t	*type = dt_btf_type_by_id(btf, id);
+	uint64_t	remaining = 1 + (uint64_t)btf->type_cnt;
 
-	while (type != NULL) {
+	if (btf->parent != NULL)
+		remaining += btf->parent->type_cnt;
+
+	/* A longer chain must revisit a type, so reject cyclic BTF references. */
+	while (type != NULL && remaining > 0) {
+		remaining--;
 		switch (BTF_INFO_KIND(type->info)) {
 		case BTF_KIND_CONST:
 		case BTF_KIND_FUNC:
diff --git a/test/internals/btf/tst.cyclic-types.sh b/test/internals/btf/tst.cyclic-types.sh
new file mode 100755
index 00000000..88d092d6
--- /dev/null
+++ b/test/internals/btf/tst.cyclic-types.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+#
+# Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+# ASSERTION: Cyclic BTF type references fail resolution, while a finite
+#            chain still resolves to its function prototype.
+#
+
+test/triggers/btf-cyclic-types
+rc=$?
+
+echo "Result: $rc"
+
+[[ $rc -eq 0 ]] || exit 1
+
+exit 0
diff --git a/test/triggers/Build b/test/triggers/Build
index 947341c6..5480f423 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -25,7 +25,7 @@ EXTERNAL_TRIGGERS = $(EXTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(EX
 INTERNAL_64BIT_TRIGGERS = libproc-pldd libproc-consistency libproc-sleeper \
     libproc-sleeper-pie libproc-dlmadopen libproc-lookup-by-name \
     libproc-lookup-victim libproc-execing-bkpts libproc-execing-bkpts-victim \
-    module-discovery shared-ctf
+    btf-cyclic-types shared-ctf module-discovery
 INTERNAL_32BIT_TRIGGERS := libproc-sleeper-32 libproc-sleeper-pie-32
 INTERNAL_TRIGGERS = $(INTERNAL_64BIT_TRIGGERS) $(if $(NATIVE_BITNESS_ONLY),,$(INTERNAL_32BIT_TRIGGERS))
 
@@ -126,6 +126,12 @@ visible-constructor-static_LDFLAGS := -static -s
 visible-constructor_LDFLAGS := -s
 visible-constructor-32_LDFLAGS := -s
 
+# Include the private BTF resolver and discard its unrelated functions, which
+# otherwise require the rest of libdtrace at link time.
+btf-cyclic-types_CFLAGS := -I. -Ilibdtrace -Ilibproc -Ilibcommon \
+    -ffunction-sections -fdata-sections -Wno-pedantic
+btf-cyclic-types_LDFLAGS := -Wl,--gc-sections
+
 # We are using machinery from libproc directly, but libproc calls into
 # nonpublic parts of libdtrace for various shared machinery (dt_list
 # and so on).  Thus, we must link directly to the build libraries, since
diff --git a/test/triggers/btf-cyclic-types.c b/test/triggers/btf-cyclic-types.c
new file mode 100644
index 00000000..cb5358ca
--- /dev/null
+++ b/test/triggers/btf-cyclic-types.c
@@ -0,0 +1,113 @@
+/*
+ * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#include "libdtrace/dt_btf.c"
+
+static int
+check(const dt_btf_t *btf, int argc, int is_void, int traceable)
+{
+	return dt_btf_func_argc(btf, 1) == argc &&
+	       dt_btf_func_is_void(btf, 1) == is_void &&
+	       dt_btf_func_is_traceable(btf, 1) == traceable;
+}
+
+int
+main(void)
+{
+	btf_type_t	func = { .info = BTF_KIND_FUNC << 24, .type = 1 };
+	btf_type_t	qualifier = { .info = BTF_KIND_CONST << 24, .type = 1 };
+	btf_type_t	proto = { .info = BTF_KIND_FUNC_PROTO << 24 };
+	btf_type_t	*types[] = { NULL, &func, &qualifier, &proto };
+	dt_btf_t	btf = { .type_cnt = 4, .types = types };
+
+	/* A function that refers directly to itself. */
+	if (!check(&btf, -1, 0, 0))
+		return 1;
+
+	/* A function and qualifier that refer to each other. */
+	func.type = 2;
+	if (!check(&btf, -1, 0, 0))
+		return 2;
+
+	/* The same chain must resolve when it ends at a prototype. */
+	qualifier.type = 3;
+	if (!check(&btf, 0, 1, 1))
+		return 3;
+
+	/* A cyclic return type makes an otherwise valid prototype untraceable. */
+	func.type = 3;
+	proto.type = 2;
+	qualifier.type = 2;
+	if (!check(&btf, 0, 0, 0))
+		return 4;
+
+	/* Follow references through a parent and child BTF, then close a loop. */
+	{
+		btf_type_t *parent_types[] = { NULL, &func, &proto };
+		btf_type_t *child_types[] = { NULL, &qualifier };
+		dt_btf_t parent = { .type_cnt = 3, .types = parent_types };
+		dt_btf_t child = { .parent = &parent, .type_cnt = 2,
+				   .types = child_types };
+
+		func.type = 3;
+		proto.type = 0;
+		qualifier.type = 2;
+		if (!check(&child, 0, 1, 1))
+			return 5;
+
+		qualifier.type = 1;
+		if (!check(&child, -1, 0, 0))
+			return 6;
+	}
+
+	/* A cyclic argument makes a valid prototype untraceable. */
+	{
+		struct {
+			btf_type_t proto;
+			btf_param_t arg;
+		} arg_proto = {
+			.proto = { .info = (BTF_KIND_FUNC_PROTO << 24) | 1 },
+			.arg = { .type = 2 }
+		};
+		btf_type_t argument = { .info = BTF_KIND_PTR << 24 };
+		btf_type_t *arg_types[] = { NULL, &func, &argument,
+					   &arg_proto.proto };
+		dt_btf_t arg_btf = { .type_cnt = 4, .types = arg_types };
+
+		func.type = 3;
+		if (!check(&arg_btf, 1, 1, 1))
+			return 7;
+
+		argument.info = BTF_KIND_CONST << 24;
+		argument.type = 2;
+		if (!check(&arg_btf, 1, 1, 0))
+			return 8;
+	}
+
+	/* A long finite qualifier chain still reaches its prototype. */
+	{
+		enum { CHAIN_LEN = 256 };
+		btf_type_t qualifiers[CHAIN_LEN];
+		btf_type_t *chain_types[CHAIN_LEN + 3] = { NULL, &func };
+		dt_btf_t chain_btf = { .type_cnt = CHAIN_LEN + 3,
+				       .types = chain_types };
+		int i;
+
+		func.type = 2;
+		proto.type = 0;
+		for (i = 0; i < CHAIN_LEN; i++) {
+			qualifiers[i] = (btf_type_t) {
+				.info = BTF_KIND_CONST << 24, .type = i + 3
+			};
+			chain_types[i + 2] = &qualifiers[i];
+		}
+		chain_types[CHAIN_LEN + 2] = &proto;
+		if (!check(&chain_btf, 0, 1, 1))
+			return 9;
+	}
+
+	return 0;
+}
-- 
2.52.0

