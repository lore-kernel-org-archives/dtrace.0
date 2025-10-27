Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7DF2AD3D
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589552; cv=fail; b=YSw6tvkkB0DKYeTWvFY9qqmIXn34BClJC4Zx4NRmbtvS4eeoNgG7D9L5w5+xpVDVsek3SmZXVcSKX6jOkIn0LupoWNbY/7jDgdqd3dF5IMS6edIIcDo2/PgDclBFmJBqO0hnCJiALfdsVabYSopkH6D1KaDqh84m4GbkpJdx/7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589552; c=relaxed/simple;
	bh=rTYYjbE10TkoVfHBWv7bjPXqKDxX0+MhoXAybeZhMZs=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Isdvlqema2nPO2VhaKDkv8DUWhFDqUCT5DyI22hMhh5uBZAkIr3UHztksHs1MV5X+0tPLBU0M7HLYFNmApWIuvo8Lj6vXa+QOs4yXxg0/iGsOeQPtxMh1aLL3OffPCdVqFznk1Y0YrWw1+bnrsq8ybwjDrjbVQkxYfr8DypTPhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mfgkqfla; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZbOJktZM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mfgkqfla";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZbOJktZM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RDYCpq005619
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=jQvMwQNc5be/XO4S5s
	kLwL/WKOndKUnuBA34kVWFr1Y=; b=Mfgkqfla1+zI3QwFXytkP14QGaH7B7M6EF
	EhotKthUq7JJTHq1G/8t2qbF8nNr2C5FO9J3XZsRuH4BXZAZzBm9K8nQE2l1JyIa
	hiywcN2MbF2Lidtqh4yL7tt/Mzvh36ay+hZxsjYX0KBykqZ0CTrJeQZHLQ2TZj1P
	Vgj83WyAb0ol6CDetjin7XxKL8l7wrD8OSoJJ0sKjFr0aj6aw7SmNgo4TWY4K6ji
	qxwylViiCmqcehv1CEEtSZo1zpGcaapUImdXjjyNaBSRO/Y4R/RGVWj7RgDpBvKA
	F5XORzVaUlZOmcTqchn0Thr8YUk7pRIcZegdXv+Mt6lYm0losV0Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a22uwhn2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:49 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59RGgdAf015237
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:49 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010016.outbound.protection.outlook.com [40.93.198.16])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n0755v2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 27 Oct 2025 18:25:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7jkl3boPX4tjG3iNrhAxVH2Kkuv7miP/7PetFgLMRnZOgL/jyqAJEQbqirHUFw6QJFEpWruu2ldtq5pJ1OnY8pyk/p/VwYpilLj8N/A65IS/FkfOxamdBv096sHGOTH68dLLpAXXp/7sZq3GOv3TLSDwLMChdOGTjuew9degN77OvruLwOr2EVxVLmou4bIge3ltkJ6QfFUxNnXoSS2W0s6z3hF7AjKzXpTRzEzsksiFL1z0kghbrIFFU5mLPzZFsot89v7YGyoto3nXzGIDPrCQqt+HjLfet5w5D37AslGVp56+wWZ15SOQhbDuQEiEG4RzGcKM6VTdWOQSRH3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQvMwQNc5be/XO4S5skLwL/WKOndKUnuBA34kVWFr1Y=;
 b=rZy7vuNLIrYfhN71HH5sTfbhlppxb4v6KUTVoSSTV2/HmTev/RhpPkHCKy5RYFApAuG3FMJZQnLInIpHNYGE7SBa4ixhMHWaUmo/UtVWhH+ShSD6saayh7b5wFU49KkitHeFXpDn5eF4qAVcllBjiuXkdOL/JbTFzINo4XNTSbBSk9ryBm1qXaiBUqNAuHYkuhA3vUHZGSQZGM/f5rqkF85WLFudLMZGkC1NVN48GLwSwngLPontDw//+4WI6OvAucbAVF2Brhgy5LXTfSSnN3fI32OZAqadUqhu+ntbpeORr8HzsPboQwkQu9DQm7P7IPwfVTe7CTOxyiVC2OMnjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQvMwQNc5be/XO4S5skLwL/WKOndKUnuBA34kVWFr1Y=;
 b=ZbOJktZM5JlW7VO+WhjEtJ+LzGPHLSSrACN30IUcO/DY8zUiCSkpwN8lsg5/oRkdE5JO4ajmBb1T7NFXlOj8kHNwTmIZCdklvwNn3Wc3L2HFpWmyi+STvpl4sCCSb44KUyLszH3ch8nEpdTjQf78EQt9H7olFKDlNhbnHYzUdoU=
Received: from SN4PR10MB5638.namprd10.prod.outlook.com (2603:10b6:806:209::7)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 18:25:44 +0000
Received: from SN4PR10MB5638.namprd10.prod.outlook.com
 ([fe80::d7cc:538f:ec91:3d1c]) by SN4PR10MB5638.namprd10.prod.outlook.com
 ([fe80::d7cc:538f:ec91:3d1c%2]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:25:44 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Bump up the version to 2.0.4
Date: Mon, 27 Oct 2025 14:25:38 -0400
Message-Id: <20251027182538.20466-2-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251027182538.20466-1-eugene.loh@oracle.com>
References: <20251027182538.20466-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0035.namprd07.prod.outlook.com
 (2603:10b6:510:e::10) To SN4PR10MB5638.namprd10.prod.outlook.com
 (2603:10b6:806:209::7)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR10MB5638:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d890062-f7d6-4b7c-1cea-08de15863d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OxCGTAEF1pe3bS4N0ZKPNa+9QgnMJdsPPnd1wt+PeAcKV0g5KxxA85t7bQnu?=
 =?us-ascii?Q?EAcPsPNq6JqO1XHXGNAXvLZWi0Jr8vx9PpITgGaVAcrbJUT40F8U0m7d3GBN?=
 =?us-ascii?Q?An+kSyXMPqpQNflipfjp/NPuULIE+dxH5ho29FyZLzMKwQirt9SAt3SBR/vl?=
 =?us-ascii?Q?bjYL/wDgV8pYlEweTxTIMwNSC5hwFhdWeaDg4G/jHNSusrOSXh6Vf/Hk2Rkz?=
 =?us-ascii?Q?bujycQZFwcNJDottWvCqZVGgEmiOKdzLmdy/bO75WUgJFwLa5fasuACKGM4H?=
 =?us-ascii?Q?cg8UwSVvuaJVJXWw8W8RvVCXQ4wZiMsKztxcrLaY1VTcXiilw+IlTieXpAYZ?=
 =?us-ascii?Q?yVVAG2ddjnc9+Bwt1F6hKUZLSPI1MpKcl9nAfm5ChtM46XZun18n8TzxB7UU?=
 =?us-ascii?Q?DUyC31PrKFFznBYXj+ak3cRzp8hBSsEInnaQ2tj0Ps19k4Y/v0sIIG3q7xiC?=
 =?us-ascii?Q?GXQGZJ043VCoAea83Fxd6Z9V6wewLNqUoaaQIes6tl/g1gvuA/Ap1nKls1hZ?=
 =?us-ascii?Q?P2pLsKiGO/aMZYktieKXhb6OgDEneOuVOPmevbaCd3IxGtVmbpKRkp/zN2jC?=
 =?us-ascii?Q?8r/feqEXBDBo+nY43dA8X+8rtNW2Kg8Hnb3SqS/x7GV2DAFATAIPwKSmd9Tr?=
 =?us-ascii?Q?f9PessrtP+JnGo0xAaoo1CKNJT3t4Okiwab3vO4yMpp6K5hhoYzelXDj5Fzl?=
 =?us-ascii?Q?CdgTmsj1WSBLRgCiKNr7Wkhbs9pCrf1qlsdTmVTXamtodgtlijgSVIEBcOyH?=
 =?us-ascii?Q?BYjOYvs4hugL+GKn22v+eetlV2JyOZTYujGyW+0zgzHHRQjBrfB5jFnPjUwm?=
 =?us-ascii?Q?N1x9EoeRcP8ZRpbhZ0htkXFH00ttjffL3dvRmVQyeYcchghylyVhUlFAYZcL?=
 =?us-ascii?Q?i54tc2OqmKHra/BaR6Sws9fdJ2Qyk2Fq4tIt+WAOBIpNVnPyYFEyxk9Uf88J?=
 =?us-ascii?Q?YSr+ox0Jsy0wvivSRW2oZQ7U2i3nbawY6ZCZPusC0PoNd0miMlSFG7fANIZt?=
 =?us-ascii?Q?HbmN/jtOC+laY5D+ODMmqsacGqKqgPO5eC54qx/5sbNPrHRWRh5Dul4ienbo?=
 =?us-ascii?Q?YhrhipOEDB8VutkGggw2RMG79CIYCuuTSF4Q2cMIXcpJcUqZxGzizuhPBGJR?=
 =?us-ascii?Q?YeTKouzCddnMpZfuOWy0NSvnS42OemMKXSvl8n8G5h6J/UOZheFkrZEGSRl0?=
 =?us-ascii?Q?dJr6PA4GKPAZgZ6j7GwP4T+vt/WZ2Dbtc9zn9h5ab22TxhBpVaMg7Qf55eqf?=
 =?us-ascii?Q?6QCLw+3GFlTGtiLxPrxgnzdsTL+KzdI0c2xJt+nrEhJt1QS9Z1TJdQd6HKHw?=
 =?us-ascii?Q?Bvq1ub4T7swlU0o9/RbECrYGBuFXO22SxDY7Y9Qx4KBKCDU5wwwooeteRHqZ?=
 =?us-ascii?Q?fsEWa5RjFpnr6wH1ZsaKSJ7QXq7GaYubnm04YqRRvDbNOhD/CTl1sAmSzqpi?=
 =?us-ascii?Q?z26sH2HBzvpx09jZE+s5+GPP0Gr74gWZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR10MB5638.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qdAe/6XIJXmxgrDArSxV6AWH6BgLwfCrU8zDR7W4IpQWgnoybuTONBCJsbHH?=
 =?us-ascii?Q?2KmtDGrPlu4+yoP2Mur3c/99s2dop/Ts+BDOMhPPKVkHJ6MCZLcfJm6ng56Z?=
 =?us-ascii?Q?bandTnJGM6V9+Bf15eiNeQfq8aHtzqigIuaiAGPoq9fqtuNVgI1KKyV1BCWO?=
 =?us-ascii?Q?jy94oKjUq7pCsnY1UTmgR0kuLTR53Uq1FrfuvCbiB5qfuYSRBhj9C6cjKWZq?=
 =?us-ascii?Q?6wYbCciR1sRotvR2uoefm9++O/S0290WkGCUdEp5o6/dmg3PO06KksoNzpMa?=
 =?us-ascii?Q?xpaidtc2OHHRCmzRVhYpcDFLv+AAhZxetXFUNlDXuHbUcQPMdULq+8r0qg3R?=
 =?us-ascii?Q?PJ2aqQI0Hlo5Vjg9jTT7D8vyKs/DkM2HvcaA8fVfs/js3VcB97VvF8z+EdbF?=
 =?us-ascii?Q?ZLz33koTOyD2MS0pjBmST3TsPJTNPO3Ka7baWZGIXqZcTP+4Q8CRsnZIdz2D?=
 =?us-ascii?Q?AiMczIlxYqj8zl8kGlW1FD5IhIpSMsdEtFGYI3VP6S+ewUw6QXDBZsntSXbk?=
 =?us-ascii?Q?e/lVeJAhOqDzPAgDMK1thzZlN67aMK3Iz56Tky0RYiLEFyPDkrggGv3djGvo?=
 =?us-ascii?Q?jk61GwJTVVdadEi5lVatWrrlRefCs6hHsjsqSOcaME4YhrihpxLF/9mIWtlF?=
 =?us-ascii?Q?ZdnVOPej4MoD54bv9CTAPVJ4C7XPdxmMuOLbQscRRbnXWG8U8Of/mruj1Nj4?=
 =?us-ascii?Q?E9l3yj91VkYs1qswRE8UVl8lL04MxmG1CKoZPHq9t2rfA/RlYsi6YLpBoFbV?=
 =?us-ascii?Q?NHZZ6bw2Go99YuXbWy+K11up3AX6HnTkJpCywcMuvME4NBjUyt1Za4sNJHgL?=
 =?us-ascii?Q?K2kpqCu7UpfdQEkEom1QRs4VLsmha9vrQGZUzdNHVeyeoitQkb5Kvcngdugy?=
 =?us-ascii?Q?/M1p3wk0SB41fwMR+A8BENbZVNWiyQLpCJMuBcJFaMRaZ1E1+7zlXayxVOGD?=
 =?us-ascii?Q?042FLwFgr9qyXRuPJ0AZsYFmCCBkoFE9dBiQPiRPvh1DcXRqClKFyBbfPd5A?=
 =?us-ascii?Q?J37qNYC9gvAY2wYypmi/7ExxAD57UpK3GnWBHo2F87LDoPjhOmEiZuNIWyTs?=
 =?us-ascii?Q?/dPLoC7QMAFl3xbcuYw982VclFU6gzNJ629VU1cKxOCTB7WaFd5zgKKFHO7Q?=
 =?us-ascii?Q?9RDUVZdRhHAdN5cBrFq/cvI1Rzdl2I2ojiEdWHueEpjzfOlU4FhqOwV1166S?=
 =?us-ascii?Q?IJwiBw4KGwKx8Uj6YlH2+vSW1XoNzmcVIX3VGrKG1nJbmbDyO91TEbm6Iexy?=
 =?us-ascii?Q?7zB3NUy3K5dBVK4MNqNGd0htGq2LL1XmYRYjUSRMJ5Zop/hk2QPq6vw0pgtL?=
 =?us-ascii?Q?scKylAvUISVqaCWtNswGiM9W1aDYkXiWkNNBXTyVOif3cku2iowcxg0PJ09z?=
 =?us-ascii?Q?NadA0Mp0pjr0XurKRbeUbzCDB/dgCIdqKoLb1EwfjH5A6uEaSAS6HSG1Rao6?=
 =?us-ascii?Q?S7u50A1Fu2lfDkx/glDPR6MXgU0cxZUsLwPqxUJu/EpmXSjDWchmPDqyvB71?=
 =?us-ascii?Q?xyixIUY1VCIjc9DDLp4zJPFvOJCIcT1B5TS8Yy4IvysZDhE2H1EFWjHYfWcN?=
 =?us-ascii?Q?ONuEPk/+SVpvhAHsJxqXpObc/ziNK1DgSpd/QXTt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J/rs/m7E9B2YYjlsZgtfwX5/lG1XIcojGPgloEmIfbDGwXF9+fUf1noIdK6xaSUjM0o92fhfrycOR09bmb3tWMNvlDC8vCfjbvWd8/6IA8SVHfO23ddlDfeRIFRYMCA3KQLzxkpdYOX1HIlUE/uuMrrMIfb3MepBmKd/WmrLRH/8y7W4VPn0BkITPZF0eYgQAlpYnXFYnyfAa3kjkHDVggIlx4br4mL1KofI1sOlaN0IEvCI2kxmKszSVwXJsxfvGtbcygy9gC4sHHL3o77IfcmvdNxa47kN11XtXJR7vzC07ZHsECvlD/GJdF0Ps+iar7SWpZSDFBZPkawwwX2PDEQxVAwtez15BKBathbtR9D2Db0q9Es7kg64fLkA74VjH+yiRPItYQz8SG6JO09RVqrc3c2uYtorCWUgcZqKzZNW5WEBOeYrAnknruzCce+zGIpOwndMF9xSebqvMijIGJ0uIvT+Zovd9Vic71RWL7OLib8YS5F8/zYkU09etvz8W8JRUynGKBwaEw8kbswwe2hiFmWdf0xWzugcflChjVKubDsJlKgOF5JOIOhYcNWXsJjhnzrb4gx1hPcc6uC8WkCvt61ajhsQVht5gQnJ5H4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d890062-f7d6-4b7c-1cea-08de15863d64
X-MS-Exchange-CrossTenant-AuthSource: SN4PR10MB5638.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:25:44.1632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QMSNgM3hn/y0DombaJbdarpTOhtn55QhM/MSc0qMjtiR7cvfpb9hc+cJOccjcjAdV+pM4vsZ/LRUBxqVw1I2ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510270170
X-Proofpoint-GUID: 599VEUfyDbhfUQsNnV1u-FTIKShwos7U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1MSBTYWx0ZWRfX8zWFUMug8Deh
 8gMQtNztq6/kQwX/PVgLlNkO8lydE8vQOa0ao4t9A0N7Z4MA7sq9oBCIV5UQEeNqDO8iqetxhib
 tenmG20/7vTlgvuACMGUs3lhNUzbkLUP5JBN5RQMWH3HUGoTEsEIzQ5Rpcag2iiLuMVFIuT24OO
 GM+BhB84f7R3w3KpskqwfPlkjufYTGmC276DtXctdPoesYtue29wwfsnEj8oQXLBle5oqmXnD9r
 QkWG0Zmnt63fn7NGXfHNO8BOPbCG6aUesMuIr2Cr2LSVYH8FaXLYWcvAmRokwMkd/jLMyo0FVK1
 WiBjY5rZMtwMRCA1qyd3CszTEsKzRp2226ahZn7jpmD/RTTE1WIBW+ggy0eiazVsv0UNSMnCc3K
 jgGNs2hDLAiOknMOeWe/Z53a92fAxw==
X-Proofpoint-ORIG-GUID: 599VEUfyDbhfUQsNnV1u-FTIKShwos7U
X-Authority-Analysis: v=2.4 cv=Ae683nXG c=1 sm=1 tr=0 ts=68ffb92e cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=5jOlqaeHYq1RB7g_uIEA:9

From: Eugene Loh <eugene.loh@oracle.com>

Note that test/unittest/preprocessor/tst.predefined.sh checks that the
__SUNW_D_VERSION preprocessor symbol is consistent with the "dtrace -vV"
message, and both of them simply use the last entry of versions.list and
therefore will be consistent for in-tree builds.

When RPM packages are built from the .spec file, however, _DT_VERSION,
used for the "dtrace -vV" "This is" message, comes from the .spec file.

Append a 2.0.4 entry to versions.list.

Remove the VERSION=%{version} from dtrace.spec build's make line, so
that the version of the implementation is defined by the source code
itself.  The version in the spec file should be only the version of the
packaging.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 dtrace.spec             | 3 +--
 libdtrace/versions.list | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/dtrace.spec b/dtrace.spec
index a4f3ed774..e94025472 100644
--- a/dtrace.spec
+++ b/dtrace.spec
@@ -131,8 +131,7 @@ it always tests the installed DTrace.
 %setup -q
 
 %build
-make -j $(getconf _NPROCESSORS_ONLN) VERSION=%{version} \
-	%{bpfc} %{maybe_use_fuse2}
+make -j $(getconf _NPROCESSORS_ONLN) %{bpfc} %{maybe_use_fuse2}
 
 # Force off debuginfo splitting.  We have no debuginfo in dtrace proper,
 # and the testsuite requires debuginfo for proper operation.
diff --git a/libdtrace/versions.list b/libdtrace/versions.list
index 8986d2007..8d858f0bd 100644
--- a/libdtrace/versions.list
+++ b/libdtrace/versions.list
@@ -65,3 +65,4 @@
 2.0.1	D API 2.0.1 Linux (BPF)
 2.0.2	D API 2.0.2 Linux (BPF)
 2.0.3	D API 2.0.3 Linux (BPF)
+2.0.4	D API 2.0.4 Linux (BPF)
-- 
2.47.3

