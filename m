Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5FDDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909213; cv=fail; b=PH4MxxZgei1HdKQ7cjnP8e/Eb5aC0ecLjSBBjADJ/Na2aemgkCH5ISFlTZLoHR7WBgLZy6C2Y1YZ0kQLxAebPA6CjQdqDUmdSzctBoi9nNlxC+7L2hae42EF07NPKQKBYNDQVMhHFDmfbW3cC7YVh60gMWJpzK5YZQQTrvZFvdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909213; c=relaxed/simple;
	bh=wBq/IoIJveC06X5sOEdHMSy0EblFq1zWnLepi11lN8g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qDA1aRVGGEvjFT9kGBCJM60XXw9IBiObLtjnWzdlfI7lJOH3XjSLIq4/T0oRN+3GYOn/nd/0TYMSr3+XTlR5UfgdushhCfdriaYMKc2hIxEGG6zVZ9n6y029Fa9cg6BMV09mts6Z+Ke5bjrZaEiNXrSxB+pp8Sm+MLWEpOhDFj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aIN9WeL1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xoU7rAeW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aIN9WeL1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xoU7rAeW"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fg0L012374
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=z/cs2WRxglXV1L
	C6JxWO4VYpcS/eqetIy/DiZ1Ib4Mw=; b=aIN9WeL1oRI8dxHPeexsUNtxwXvfXh
	SvBUJQ3MKmZ5QHH4BHgmw0jeoWXUoSVzWDMSUXN6XgiEjjJ4etyZtz7oanIaWK6R
	5GLhw1sIbZkpciA4GH3v0B4CdR35gxEN3CXyDBqpMFQPdlVuN0S8niSOv11nq3B2
	/gO9x++DQPv3z3xHO2aUhGOppG38gH70HFfIRSPo8t4ANAEERBzErJoYmZElLrEb
	XHhKu35Pl4Y40d57PipGOv1FNwnlcUZVVc6cYN8XjM08mck6lF+UNk+7JgIDxsBD
	Kx899L3FInVx02zSvtU+ImaTjXHn+A5Qo6DN+yW/WBbL0AydByYd5CGg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukk76q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3B53p016714
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 418a5unmu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWgNhzLKqAiRypXefhoLS4Yg+FSBWb4x4/2bs++G163BH1xlmLpelrYCrSAY6P9s6aBXPaoeYchEfymyrLtzPLoKSq0980iQAf6QnSI+7vD6/KwTMSPSYH3qWF831tyrElT4aJEdHKU+fGgiUCBXbjTCvXlsmykI8tukrDXEJHMVrNI3WfVSFGfVMHmOoOHOZOfQFgDX6eg+oAQRPN3JPm2cU7mHhDs60YLQFXloyHhF7fiIxYuhehrV7eN4LqBwD6+5cX2h7FHBXgt7m2xllctp+oMGjlmfWkxYZ5GN2TuQxijsHODnDcLh8BgeAq9AQFM/nnpZoAzKwU8Qy1mZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/cs2WRxglXV1LC6JxWO4VYpcS/eqetIy/DiZ1Ib4Mw=;
 b=n3IXjTYJGWyHSqLXX4xtOuJyK19m9kyfzW+3nJXpm3mT4a3OF3jsF/Ir3HKn7bfbVxGDttT0nWVH6up8zZgg/Irwrbw0IfRv/1qEAnd7rX8b0p+tCugwwBZgMAV8DfworI7MJ2EbRGp6ux9S7frjV5hUfOLvFrf9tCwWialPKcJ8TMn4VF9EEO5/5fNT+l3QVtBHlxN4c0+bDAAt9eLiHWNsjAQePrcCCSPzt6QS8h1ZhTYTxnpnazcKO4lG3rJ3JitKwPYT2JjuyWe9x6TD95rjE6IIMvvJNh2r4NMzUVcaMvVNW/dGJ9q6B41s6/AYYpSj6SbtEYKZZGMD4BEicA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/cs2WRxglXV1LC6JxWO4VYpcS/eqetIy/DiZ1Ib4Mw=;
 b=xoU7rAeWDL5uu0G0o90nfPwhsRgwM5D4wKBwXDUdzuvLGvX0XVk9TVDhRenDua7VwcAfM7lEAOt5SIsXrOOxziaheLUTIzT6nHsDbBEQeTrd08jgamz2qa6FkboMlhvpXHJh9jLNDzF+aViKGDKAKJImsXMbr7uzMUfjrzLZfQI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:47 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:47 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 16/19] Ignore clauses: use underlying probe's function information
Date: Thu, 29 Aug 2024 01:25:55 -0400
Message-Id: <20240829052558.3525-16-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::34) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: 79ce7358-2c2b-4729-dd1e-08dcc7eb2d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vzqjFw1OZX4qUWIusKvlWMcIkcyncgvREuub7nyDGX7ZVoa8hzEfg0bDkuA1?=
 =?us-ascii?Q?G+uFAE93qlDAW1hY59FjaI/O8qY7S9U4w3KNvx402s1LVM0BjzOdRbVzYeZb?=
 =?us-ascii?Q?gj6Re/cHHAIgjC+mcjyE37ddnAZnwP4Fr0ZLKi+QxPdOqNRVE8rSGybFAgUS?=
 =?us-ascii?Q?nvTystgmxJEVl6a5wQAsrApSEL18DgPg+LnPNd3rTsOLiwXMcTVnP+rWlBUr?=
 =?us-ascii?Q?4OXUd42B2J7DbqONQTIn6VhG3KZqacQF1DmtQXrihX2qOMldIoCjDJmChnok?=
 =?us-ascii?Q?+HUwQibxpOySQfcu+h5I/7UxsayNn6Nxl0tCLGHHkZMTdvwDXTxbcTKVedfr?=
 =?us-ascii?Q?7IWsHJ0ud8YnhTkcKC69XB+05aiCNeQcFFRz0EUDZ2837Sbt2DEKF0T6Bb8h?=
 =?us-ascii?Q?O3Uv55H32kh/FaIExWi6adgTWHeUZz9HFBrXcyX3YTOEiOvONnU+DifOJsB1?=
 =?us-ascii?Q?qssKkCH2fILiQP0d06461f946CBRD9+pF9eadPJa7vn5bovzuEda2S+QNMOo?=
 =?us-ascii?Q?DMgJHNTk5ynja0KjsdpPBOaGdqB8DrwplIIkcU3yhsqoeVOWWMi1fIfGVnuD?=
 =?us-ascii?Q?BBKNkhi/mZXiNE7aziYMwjpMSf4ENxgx8ml5D2ku0F/6vckEKvSsLedBvy62?=
 =?us-ascii?Q?8Wu3jURryY1wsijIR5QJkl52ebv345COEt+XxRNId+K4mpKZTHPQFMEqaPY+?=
 =?us-ascii?Q?YZ5dygh7NC6oFk6TIu86sLos4Jx7fkHT90iROYmrx/WJQNGFsJDrn2X4ifXO?=
 =?us-ascii?Q?sXDk8r9hTXe7acWFcipOGDF03gq1q9l34ifeFsiXtJvOvyr6Fy0M+K+ZYBqL?=
 =?us-ascii?Q?MxZR8+dBD3gHU3DCkmRolQGZgzl3IebeIi7WSmD+PzH0u4iYvXXITDRtx8sZ?=
 =?us-ascii?Q?+ZQcxubZ2JQRdHb8QG0dsVhcY/GwPSlKxM12WxUT0Qu+eKHNIYeLuexbqWCc?=
 =?us-ascii?Q?2pIJFA5gbdDy6jdL59Gi7s5FPXZmZBHTzuOefpG/4XtOBoIfMym95R0bJ2Uf?=
 =?us-ascii?Q?y5UrwcUXw4OXXYfHKMtJT9rR+6/rcC18RI0K9pWyb4hPtLgHx3F5oDC3snqT?=
 =?us-ascii?Q?sgGKhiVYfVbGalupe1mwPMkzshDYQmceXYBJ30kMotEBMQgDNc02ba99+L45?=
 =?us-ascii?Q?93asn9bTDuvWLGfidOxpvNockb4RS86o6XlhLGMwSigs+gTe1bSARTPNB/Ke?=
 =?us-ascii?Q?SfuByuP1IVI1Emii74+ItLOpOqTgobrV2GqUxx2BjIKIADWUpbQjGLrHwrLq?=
 =?us-ascii?Q?1Sxv2PRvYaWzcUYx3aa4+ONEu0x9I4HlEXCCmtGj20yqtqi+YbdFRatwadIM?=
 =?us-ascii?Q?VRZUz8AejsDBp+r+VNGFvEoNahRjavz7EzT0AaaYpyHAUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?khrrTp7qi6yLsr2DBEvFXG2Mu8iNp7y1Yt55lEsvalslWLeZctgF6B69Ig3D?=
 =?us-ascii?Q?RV5VcoCMXA3WRC1dcfdpkn956stETs5MGOglT1hrCyFt7MoYUC8mmPoc4xgR?=
 =?us-ascii?Q?V/6b3ipjvouvCJ50NXwFrjLsEHHUU7X4UKxKFBmwTeFIGc+A+dsvEkt0KezO?=
 =?us-ascii?Q?cNrtF6bnLB46EcyuICuktXkfzuqIJsOgQN3B96GpNqkcXY8M4U8Fn0B/X5G0?=
 =?us-ascii?Q?j5JWcISfyGpm/8ilbJdm3X1oh3UeKVdaLsxqHeRjQqG3zmIpwxVDQseOgIV6?=
 =?us-ascii?Q?fzV0CUsEIH5bvR6Y6l7eDjKd7Ns5FEfZAbh/GXHM2PBIDxXNV+QALM69iCgH?=
 =?us-ascii?Q?AYzHhaX/iAXVAg+hdD6ck2YIYfWL3Ky7j1lUlr72gZIWwnqK/mA9mzL9yWF/?=
 =?us-ascii?Q?UwJOjW9Jjgcdp8axM8S12Lgw7N2WrhdOWm1DU5fBQp8K/O4BeN69mrnpNiRg?=
 =?us-ascii?Q?iQEfBDQJNDwxi4dHFoSBP+3feyh7BaCXMEmw/T/bJOmvBblzJd6sCS2dBK0k?=
 =?us-ascii?Q?I8yEOW2jAxEICKT74o3Wrf+2hX2/hFSA0YfiuOvUV65byJINUBymUTNWzs86?=
 =?us-ascii?Q?cKXfFpjKAQWhPMX/bcNkRg90EZw0BE0cUgYB3y3am9fAau5hYhr3OzYUR1y9?=
 =?us-ascii?Q?CQ8ZYcZsK81W7GiNpucwgM/QFdw3TfrlmKvzHFNfuhDFWq3EB+g8hIcI7QAV?=
 =?us-ascii?Q?6IIgzQgYZ2cncimLrrM+bKBqndG1uWv7jHtjZLH+isX+u646ZjWHfgj1OQyW?=
 =?us-ascii?Q?gKSMBA313v5OROLMFRCmfh3FSogMhgNc5uwslOVe9lCqzyksxp/V0Qzi2AQP?=
 =?us-ascii?Q?LATxjm1TuSVtx+XRgN2DFq8WNiPAYR5WsW7QkOC7GJJ9vIEDA1sZTX2BlMyR?=
 =?us-ascii?Q?Paao87FmFIStuQCvmF9Qvnxu1WCXCsAdEOv97fELJRZ7gU6bHbnp6qzybxDD?=
 =?us-ascii?Q?6MrW+ghxxcVrcNDq5h+eK3zYdm7a6TCZWVoxFPRi73FX6HtsKwsOvYn8x5Uu?=
 =?us-ascii?Q?RxKocFO48h1ts+f4fGc0zUrc2YEg7sPGzfD6bDHAd9W6JeLcTYN5vU9kp57m?=
 =?us-ascii?Q?f0r7tc1OI9y8RAgeQT4L2pzBph8Etbn/qsxMQOGMK8EVqIz8fZ2WsdhVQQ45?=
 =?us-ascii?Q?PpSDcO4bb9Z6S6C/ocGZgdrcbbJfSThGTgByzoRMA+eo9RWKpNNn3n/i3zo3?=
 =?us-ascii?Q?qBvBMYLw8pSkIxZLuTC5Ka0Ln+eYtHfILeGF1/XKVov3fP6wWRqFBERMdGdB?=
 =?us-ascii?Q?srnL9VvD2mi1tgNR5OMA4phG2Orkdou9+nYPW01bAOG4iI7jzNV+YKi0EUMw?=
 =?us-ascii?Q?t1Pyo4jQL/ETWNK22dNyuPMrT6vYMoRuqZv3xQKrEQB0zGE6HcKZVO6dmRY6?=
 =?us-ascii?Q?IiZjCuTB00uIi3VG1FvXGvHdzpqre9hI8ulM9TJOTVJXnrYL292K0pmKv8Id?=
 =?us-ascii?Q?0gupW2eU3Ci5psWX5xhLd8NyTtv0GUTvL/EJEll7cy6phXAmnHptTXoiM5q4?=
 =?us-ascii?Q?fuKlUl+wuLCUsKcUZcJbYxxXHCK13chVw3ejV5oSAyaNrWQQYI515l4UEKns?=
 =?us-ascii?Q?CXitUgXcTRpbnJ+KvkigZ1GVbN22p1qWxv5oI3bo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B2I/ovFxgt+JxqGh35MGlOFv3cYp2v69HjEhC4MHnHWX6gwaiOjnfVhfsY1yyjuEuIx9MAavatCgnVsDyWx1miSlZIfJR0LkfgXPw422pHnmimP9nAexOgZ9QmHtgSkBI2VE3jtYR88ZJxAUoSextbJoExoITALVnWm8IveSRCDlbhMklLJD9y2Y38/EMFcHCYLDngaLT8AP4LFgoUANeFae+QcZHM91SuwWaO1gGpzG0NGtg8ZwXv5o6tnYj9rXQOhmpaUO4Vqy0/UPxIz34XFL7C+0Dy/Vq98O/RtRelTNXdJW/DHQa/jZmEW2cwl3LReDg1bcCTVsU70F+3vJeR1Kh8t7pUxrSrNEgVk85ixmv3g69aCjBBE2Y68BEdAtkK2dWH9nqsZKPnteb/o585kQjp/5zPsRFGVANieyfhh3mxxVjZETF8hGpQ52zHKi3g4hK3bEt/MGoIxpyuJ9YAOFatoUKFV0CxQjOLCZnUcH9dRDWZlr75gc+dthl4ZxUIjcj0t1eCPABmObz25l3t6MmrspzkLHpfx1tsg+vTuwQBk1VeEg45ehQ5gmMoEU1W/ImoGwkGIk1fb1rzVOcKEGeb4S7xvzrfbjZhuUgtE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79ce7358-2c2b-4729-dd1e-08dcc7eb2d76
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:47.4417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LG1vm3Lb3qfnp9GgwOc0uPvKm7kYYJGxKXH+fadNa8bz/fnLlLODSfIXdr+Krgovm1Jn2RLDJX4iVm9BaP4bgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: wu7UL3PRuSk36sowcQpYD_wLTlAYD4Xl
X-Proofpoint-ORIG-GUID: wu7UL3PRuSk36sowcQpYD_wLTlAYD4Xl

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 454c53dc..9d163d70 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -291,6 +291,11 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	 * If USDT_FLAG_POSSIBLE, try to use uprp.
 	 */
 
+	/* We know what function we're in.  It must match the probe description (unless "-"). */
+	if (strcmp(pdp->fun, "-") != 0 &&
+	    !dt_gmatch(uprp->desc->fun, pdp->fun))
+		return 1;
+
 	return 0;
 }
 
-- 
2.43.5

