Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B81C3C08
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763679009; cv=fail; b=VG2TpzDWUAdUSklckqURg9bx3brJMrFK8CRlRLDdnZTi0Gn8dDaXPb1RSRP0KzqroWsNnKd6G9hlXNyxsyXlquCHOL4Aq9OJTCZqdWizN1O6GcUjQOxx2Qd31p9aWC8D+u+OfZAauq9upNXr6UwZq+byuXhPLF0+XPwciOPo4f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763679009; c=relaxed/simple;
	bh=kaDJtvcpkQKujtM0YDCO5/3zpfsGKrhtZ+pcztxB15o=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ORFTsSJU2OAcp6UDQ8zc9oJpsGTazOgVMhC0z/5iXfJc2BJv6dpudMfxAJAxSzBPtkkHH1RpdRGObJI/WyvIDshnygYYO5PCPSL/MI+zLtt28+r2sVXEjgvDdlinEolWWEAbIWwnMYxwiz/FE3gobtBBEkUFMwW/norLUI4FNco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MLRfHmY4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NPyYemPe; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MLRfHmY4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NPyYemPe"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKJgK3u024236
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 22:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=XvPo3bSpAnoG9CUIR6reDXujpz54yU81Z+vtdmZ7gyk=; b=
	MLRfHmY4VQPHOQfSAzMj6W6siMoP/NCXeZzd3LoeT/IzUgpGBTO8Q+Glw5iRpZWK
	195QJLjea+eUCI5KA/2YepvazdyF+SlzRScrUXiG3Hpb8f0iPcqUilZt8YIaJ+Xu
	qyoz/gCUgqnkhbyor6ZhM68BTj7oX3kSeFSUjxmU4bwyS5byZwX/IegAOrfIptYa
	bhOPeMj1nnjcfMDgZ7zvV0NsmQ5LycSC2U8O+j6zZcooY4S8oF3wcP4cYNWf4IFS
	wEFpYhbfwiHh1dCcIR5eVRfDJev9EcbHkzkHuq41Q4pyzYWvLzmYTZag4fZz3F2L
	RXf2goL7n4P0HqO6jhDmtw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aejbusyaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 22:50:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKMd8JN035996
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 22:50:05 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aefyq41uk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 20 Nov 2025 22:50:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Il+F7G9ksBWjpTEt+8PZ4C+lTbjGOhgVb4JsPWR69fV+RE+ztwzp5Qf2Tz5E0ktxVFhSGrh0meurs0Ec+Woq6Sw1ijdrA8vdNGMAUuPdN3E/YzuQdeSZp5r7HwTkcgHbE47ni4HrAd9VMETNHsv9r8+L5flVUEM1dSN7f0L9cROY+U/8YeOURZoC0jUehh7M+Mct0YVhqM9bGA/7v7YxQ+58K+5+vO4ISC4sTq460nm/0cuKX19QOhGtOkLvHgG07Pov6FoQ6hXja1OO1F9w8NBiukOJYp7UxIpuyGhoKpKxrNk8cQHqnxtQyjBE7VkXliozO4W/Em1dF9UgCswQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvPo3bSpAnoG9CUIR6reDXujpz54yU81Z+vtdmZ7gyk=;
 b=pgJJk/Y9QIxS8ENhfEb2Wo0fL0mAbYi8+IR9S/5neGc+u942cKBQS3gBA5e5jqaKJzCEVMonuKrdm6Byq6XyK2uGWCRCrKwA3UAIBxwPcKjHRARwLf8C78Jp4+52GgP5DZi1r2uK+0GmWivrK0n6G47vGog+Sf3lMOniR1mOkE2vj4OIr0dGlEGr5siuVljIbshgGpgK/JD8mOQIx7bCI3Nlt3x1nSb1ZaZGnBfcSR/SczrnygXKUTQzROFWZdDjEpqh5NUZ1j4idfh+kZOudIOogEW2HMQH6zA64pheqSRrrbY9J/9VzizxdxO420DHPr3jCLD0Mw4gaofFENZVUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvPo3bSpAnoG9CUIR6reDXujpz54yU81Z+vtdmZ7gyk=;
 b=NPyYemPezCEdgXIW6e2TRRkxzwQc/q7qy4E/OUAQa7cl9RqqtJKKLW7CCWGnFKEwgDd8tvd8s1dxiaG8KfgtiJAUTZOb/bkdbfEzk1YyV3OvEFQ3hZ9pSnJLvZG43s+Mcam2BwlCG238HrShutPWLeI8b6lyCiEAtPG1LJfpgF8=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 22:50:02 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 22:50:02 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Do not convert "__" to "-" for stapsdt provider names
Date: Thu, 20 Nov 2025 17:50:00 -0500
Message-Id: <20251120225000.31618-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::12) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 1916621d-4103-44bc-bd8a-08de288723ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?f20VlARDKd4MrDSdhmx3sx4RXNaWOIL1iX+NC0GoZsJUQtEuixvMa6OMob/c?=
 =?us-ascii?Q?v2QhU+8cWvQjdjLLT8gCHrf5p9gMDgjDPJwo1kqxO2SODXoJcid2cKAQTTCp?=
 =?us-ascii?Q?ZbqV7VrgOdyNUCmFGcyD0ThDgA9AmyLSwbnuqpLeaIka3o85+wTkTetSTpZw?=
 =?us-ascii?Q?fqhb4wTp3YQvi8FY+to+v5fcWjryxkIiEVe/OiNC401wAZtyKdXDfzcuxJ4L?=
 =?us-ascii?Q?BhvQr6xC4Xp8vZHNhGxbECTAiSQIdpZ6SF53EFvmkCQFpEQbxPjNakhxOudF?=
 =?us-ascii?Q?cQRpesrKRgy+VUACsGqTNh8QSJeTQ3b9p+zqcycYL5ZGoziL15dTPlgRXMg5?=
 =?us-ascii?Q?bTgzsJ62twzdiZRn07eQgeFXRezidfdir/0H4bVig6WcxUS1mo8Tymg8HUsZ?=
 =?us-ascii?Q?PeWRHR803ehFHmkaPffMljQlj47ekLed5mjZJVfxWRYcUOJ5FlsEXfSFeN7A?=
 =?us-ascii?Q?w1DJ1BKYDlrjyRNJUSm0GhU6dQoPyXRCC9FthuqT6s12ZNk6KxeD6cof+RPu?=
 =?us-ascii?Q?pkKrCPRpbKlHyK7/FKCIVWTI1ZlHj6NuBICjb3VDUMHGwIZH8C5UqZM7Kdri?=
 =?us-ascii?Q?cDTscLQiQL6FBJoe2rGD9C/KltG1lMJGuhtUxF0X797lNwksg/8fBp5gTJIN?=
 =?us-ascii?Q?wtCRxe0wc3Bk2651ON8BLeQ0OY5ZAfaXjjLtn6KAmTh9riY9a8Kw9P+SorFn?=
 =?us-ascii?Q?PV8IlxCGkmyYHGcg1lmBA96Sb+Wr1a0CZs+j4TR33CxDr65YfNLqrorRj3WH?=
 =?us-ascii?Q?urUU1ugZoLwSc00mIDDnKdaH2D5mkKxzWL9neyx5CNhbeJqqxHlYIB0XqtkR?=
 =?us-ascii?Q?X2/FSBzDeZGrcn8CBSVAyU17FxOCOdwlPj7RufXX0MEH0lTGD3Xj6+vmj+ic?=
 =?us-ascii?Q?d4ldHW/9G0oE821U2meADcNoVyWMyOSNVoa+4sqDHXrOAf+DUPF3Auuj3Pjv?=
 =?us-ascii?Q?XAYenTGf6449x8rTUKcbSHC5wbF808YItAe3DIbHwWbHDM4IBjVN3yGxTnvi?=
 =?us-ascii?Q?MKMukiLLRYHAHxgqgejv81V76c89LT1BrWmbW+LRqEQLjZGXYBgqVo1ikDbL?=
 =?us-ascii?Q?rtVaGTxZPZiYMYTM0OVDzYLIV9Phe7CUQyGVUaseLSxCl01CVzENizMueN4v?=
 =?us-ascii?Q?peQurl/PVNFtyn6gP3MlErhArg2n9PjdTcwEhI+eUzGvKZSUwTGdMKzByS1w?=
 =?us-ascii?Q?PuNH3MfK+OEmQTSrERnIuVUcPJqrMMnjicb9ESnx5+/62jPambslldk1lYum?=
 =?us-ascii?Q?gfJyHjET8fbbvsvGYet9idgDG3n7itbYHUYr6KgU5yDjHTl6gxkYOQZlyJeW?=
 =?us-ascii?Q?NdDa4VH2qR11T0vSmCOpBG2Vg2+jlY5yGGKYTsiEvR/pqANYCu3nSgCEl0Cf?=
 =?us-ascii?Q?i3/W2/j6e4CD72eTh0QXrE3e2ZSw+Y6iniz6C5y4BHL9HmBYOE80z0iSTjpP?=
 =?us-ascii?Q?B+mO5HpLq5/N4uM++TEN3UtPJ9DjqaQ9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aTkQE2NN+auZqaDBY00AOaxc2HsnFeh3p2CT4mVXuxfUmRjLsJBDN8RQ8rvm?=
 =?us-ascii?Q?5GEn3A2pocnMrzvbM6HBbKn9YeqmGO2I3Mcz6x4m9zwhaUiCObW7zxUSwoDz?=
 =?us-ascii?Q?KoMHqft6d0ZYMe/GarcZ7b/J/SJXg01H6CqL89UrfM/gYwQvHBIeMWH/Kh9L?=
 =?us-ascii?Q?3LDg21AqODX1Sqnhz3E5Rq2UX0DJcu08j2ccNv9revj5PFvQA1Z5GdAPS0V+?=
 =?us-ascii?Q?P8DjgkswY1VowTYRBSHGOdaBl0NaQpE5w9Czie5rMQuAxICMQVzMzKOP+bH5?=
 =?us-ascii?Q?tgE8LSOfDhYteK4aYZQ4dBbouRbNHMpuB0PpuKxWw0fnzOgJgr2esVWpxT7w?=
 =?us-ascii?Q?AqVbXa6I+OfSFF/caMnfplctMK1/leqRaPJ5i4BlKKnVDq8dIsZu87dxExrz?=
 =?us-ascii?Q?pogz3sq2U22NZwTNUGuNtv4gHKUFv9ZZYwKVs1jOcxRWBiLWJt5kdUL3tQet?=
 =?us-ascii?Q?DQbt+3hd0U6xo7yhWo6vx92641DWpGBOP+GNeOT63aHk4S9lJq4anpsU6zlH?=
 =?us-ascii?Q?SJeii3IqqEvH3kg340ABCNbRRAHrW1rm4Xh9JYnLMt42CKUgg/YiCGK5KqAw?=
 =?us-ascii?Q?uOi2D6HFLeBYoVSp8LuLyeEkz3vty26iXJye5xhtG42CV1hxMxO+HfgRXtqO?=
 =?us-ascii?Q?cJO79Uly+8B47E2DKnnLpHaUAcpe25BAsCi3QwZhQBNjTneIxZB7iYgAdh/6?=
 =?us-ascii?Q?Eu4wx0p2hirrowM9uURUjvOBFL7VRdIbOQLr4JUykNSzYAZLluECntrbfK7Z?=
 =?us-ascii?Q?7giB9L2o2anznB6ZLbl0JrhBomk+DH1oz0Bb4ETBXVvjMXp0QDX/QRrBgcVA?=
 =?us-ascii?Q?isOUbO+sNxgNPi0wrTlOu8gZBb6yh24TLT93gGZpYDWs5Ezcc9XyZIdojxSJ?=
 =?us-ascii?Q?3aTDLFi3wqTyPjWJaRGtOhqn21+KGfuEMPv1lwRFo/HvIQ91pJROemHPXCrd?=
 =?us-ascii?Q?c2BuQWNOsKOFK30UiKH5y93OlPu474NZsEWrza/srihW++nzz7md5FHdUcRv?=
 =?us-ascii?Q?CnAtgBGlsVh2QrZjMduDsQXtYK9kEKSVW0cbonMWqhS/rcCzvJP+1TMgpx/H?=
 =?us-ascii?Q?nayeNVQD5fG0K2ThCQhKVATKGbqHtunNwN6VTThblqvc7sv1xO25xbc+KXda?=
 =?us-ascii?Q?JojxMyylI4FRUrlbTlR4ncnAauEnPPeOJrae36FBEI9pibu1ZzMTC9pczgtF?=
 =?us-ascii?Q?gIYCChYUAM8QiKg5JWsk1HsjyG+QvwmhHmvgEEOhHoy2nGAIwZvcHNU/Xiyl?=
 =?us-ascii?Q?ano1e4cTZZvllsB4mlyab/Js6WOmATe0fhpQnxDlcayfLEjHfpZoXgrI4ZXf?=
 =?us-ascii?Q?E2pVpmU02gs0bMvCKtT8l137+TTyMMCsOKpi9iLpjiIO0qZaTB8+fnnhpeQo?=
 =?us-ascii?Q?UNZ7Xkq3rBIGNAHKg+O9PwIZ23voVKivwA2OMCiX74LTjyiP18wGf2790OiY?=
 =?us-ascii?Q?4sFeE/GfH/AqgIDSCR96crY9Pf86f4AFCzuSP0v/+ehqRn7aZ8xZkYwEbZ8L?=
 =?us-ascii?Q?BNQ9xXCMtjmY9LhLTwbrwAmkkXoPNPumt1Af/MzT0aKv8FSrHxKQIzCR+m+4?=
 =?us-ascii?Q?cOPSKjKUc2wtzW3fLmb7ud1+2FWLeVVOtXqFSxKt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d7aL2rrWjtDHlol1EUZTk4VCgt7angurjEeZrTpaAwWlHD2clF1j4pDSrxy7Qck5J+3z6yBvOLtbd3b/bO3imtK4R05hzsDXmsP8zzuSqZ82Dq0uOCbLkoO1kjCfB7I/NRvfkvcRfIJuU41AkhITlCJbiC7wzvwbVu39r39fjJe8Ijau2FOMHRatZLJqZr2E/cv0K+s5uJgsVN2clZWAnWJru8lligbbyhuTly14lK+Ldoy8jvW9CKVUivzxXQA1JNE0C+QfVvIiVuQYoPKGdzQAm4Myn2LrKT+CEM0240PdCg4++CZVeRYozV5bD4Ht+XZ3rZIkUOMImWJ7UlxxoaZU14rU8mv4JSMy+URUwWRO18Iny8c6lWt76OXIwe2jzjCw7HWWFHSxNd7YobHqhi06pwxPxmxBoCqGa5VcQGIylrgy8n+zowDCvjk4Xacd7MFILQQrMiPY2XlATxDOodTBS0KGS4eUiDBCvA3ZOdPorLcuyBpINlcmZ7yM6gQ1uLIiWW19rj8iSk2vNbZ8q8jDSWtQpJfsA/cKZYnJGs/8zpcw38wZaa/iXVN3atiJwPwA+gcHp8aKWm+mrXyJ/cMKIIxgY2okg1d+NgiiF2c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1916621d-4103-44bc-bd8a-08de288723ce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 22:50:02.1741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDs3/2H450NSimBf8FuNqGLHg4pyEx/u/BXtnax5uen6CVtBq3JsdSfestayp6T9YCTOaDKh3TPA+gn0VgIGNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_09,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511200161
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX6xkrHJK9tskl
 Z8RLoYxCIeNw6N8vQli84GOnV6QlgakTVlkyUVqxIT1SR0KkdMh1i0jPbSo7Z1saJT/i0ED2N+V
 kIWzvwm3oaVRgpJv47MZqIxK/oiM8dgf7L+QTVA0+5Aj1LOD3wGvyhymTqcvC9S04gwaY/cUeOt
 zXJDx5rYzFQvKAp3ZQt8tDkThbhCsB60HkZ8lUtDZtnG3HyYDBLEimLtV+uvhhgoBH1KBtl3zQi
 3BZOJQkdEsh/708zAbHRHgBmdbNWsmrLHoOxz5/15OvAuVscqk3NXEL+LGWwu6SkBRE17jeI7Ka
 lTxICxyY4ljxWKPMbqeqg3yajUbEZF1C+5VxqGB2+Z9hFRjylcMnhq0bKLcx850rCjXTDM1jnFV
 ZhfeWzHsYeVkauet4dxTXc+VMFyC4/91+RxkyS0xKJlHska+w8s=
X-Proofpoint-GUID: kyCX-0Al6DB3yCHNGoYhG24_YWDIkaMv
X-Proofpoint-ORIG-GUID: kyCX-0Al6DB3yCHNGoYhG24_YWDIkaMv
X-Authority-Analysis: v=2.4 cv=Rdydyltv c=1 sm=1 tr=0 ts=691f9b1f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=jhF1E0G1u5ZEie5f_MMA:9 cc=ntf awl=host:12098

From: Eugene Loh <eugene.loh@oracle.com>

DTrace provides "__" to "-" conversion for USDT probe names.

Commit 4f58b864a0 ("support stapsdt ELF-note-defined static probes")
included "__" to "-" conversion for stapsdt provider names and probe
names.  Commit 22932a9875
("selftests/usdt: add is-enabled stapsdt tests using semaphores")
adds tests for both conversions.

Since SystemTap itself provides "__" to "-" conversion only for probe
names, remove the conversion for stapsdt provider names.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_pid.c                            |  1 -
 .../usdt/tst.stapsdt-notes-isenabled.r        | 24 ++++----
 .../usdt/tst.stapsdt-notes-isenabled.r.p      |  4 ++
 .../usdt/tst.stapsdt-notes-isenabled.sh       | 61 +++++++++++--------
 4 files changed, 52 insertions(+), 38 deletions(-)
 create mode 100755 test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p

diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 7d6cfb4dc..fb3c59581 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1346,7 +1346,6 @@ dt_stapsdt_parse(dtrace_hdl_t *dtp, dt_proc_t *dpr, dtrace_probedesc_t *pdp,
 		if (strlen(prv) >= nhdr.n_descsz)
 			continue;
 		strncpy(prvname, prv, sizeof(prvname));
-		(void) strhyphenate(prvname);
 		prb = prv + strlen(prv) + 1;
 		if (strlen(prb) >= nhdr.n_descsz)
 			continue;
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
index b088b285f..19924aa6b 100644
--- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r
@@ -1,13 +1,13 @@
-test:main:zero-probe
-test:main:one-probe:1
-test:main:two-probe:2:3
-test:main:three-probe:4:5:7
-test:main:four-probe:7:8:9:10
-test:main:five-probe:11:12:13:14:15
-test:main:six-probe:16:17:18:19:20:21
-test:main:seven-probe:22:23:24:25:26:27:28
-test:main:eight-probe:29:30:31:32:33:34:35:36
-test:main:nine-probe:37:38:39:40:41:42:43:44:45
-test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
-test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
+test__prov$pid:test:main:zero-probe
+test__prov$pid:test:main:one-probe:1
+test__prov$pid:test:main:two-probe:2:3
+test__prov$pid:test:main:three-probe:4:5:7
+test__prov$pid:test:main:four-probe:7:8:9:10
+test__prov$pid:test:main:five-probe:11:12:13:14:15
+test__prov$pid:test:main:six-probe:16:17:18:19:20:21
+test__prov$pid:test:main:seven-probe:22:23:24:25:26:27:28
+test__prov$pid:test:main:eight-probe:29:30:31:32:33:34:35:36
+test__prov$pid:test:main:nine-probe:37:38:39:40:41:42:43:44:45
+test__prov$pid:test:main:eleven-probe:56:57:58:59:60:61:62:63:64:65
+test__prov$pid:test:main:twelve-probe:67:68:69:70:71:72:73:74:75:76
 
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
new file mode 100755
index 000000000..234d1fa55
--- /dev/null
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.r.p
@@ -0,0 +1,4 @@
+#!/usr/bin/gawk -f
+
+# Replace pid in provider name with "$pid" for standardized output.
+{ sub(/^test__prov[0-9][0-9]*:/, "test__prov$pid:"); print; }
diff --git a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
index 322bf53aa..a839d5722 100755
--- a/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
+++ b/test/unittest/usdt/tst.stapsdt-notes-isenabled.sh
@@ -83,67 +83,78 @@ if [ $? -ne 0 ]; then
 fi
 
 $dtrace -c ./test -qs /dev/stdin <<EOF
-test-prov\$target:::zero-probe
+test__prov\$target:::zero-probe
 {
-	printf("%s:%s:%s\n", probemod, probefunc, probename);
+	printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
 }
 
-test-prov\$target:::one-probe
+test__prov\$target:::one-probe
 {
-	printf("%s:%s:%s:%li\n", probemod, probefunc, probename, arg0);
+	printf("%s:%s:%s:%s:%li\n", probeprov, probemod, probefunc, probename,
+	       arg0);
 }
 
-test-prov\$target:::two-probe
+test__prov\$target:::two-probe
 {
-	printf("%s:%s:%s:%li:%li\n", probemod, probefunc, probename, arg0, arg1);
+	printf("%s:%s:%s:%s:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
+	       arg0, arg1);
 }
 
-test-prov\$target:::three-probe
+test__prov\$target:::three-probe
 {
-	printf("%s:%s:%s:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
-	       arg2);
+	printf("%s:%s:%s:%s:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
+	       arg0, arg1, arg2);
 }
 
-test-prov\$target:::four-probe
+test__prov\$target:::four-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li\n", probemod, probefunc, probename, arg0, arg1,
-	       arg2, arg3);
+	printf("%s:%s:%s:%s:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
+	       arg0, arg1, arg2, arg3);
 }
 
-test-prov\$target:::five-probe
+test__prov\$target:::five-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4);
 }
 
-test-prov\$target:::six-probe
+test__prov\$target:::six-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5);
 }
 
-test-prov\$target:::seven-probe
+test__prov\$target:::seven-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6);
 }
 
-test-prov\$target:::eight-probe
+test__prov\$target:::eight-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
 }
 
-test-prov\$target:::nine-probe
+test__prov\$target:::nine-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
 }
 
-test-prov\$target:::eleven-probe,
-test-prov\$target:::twelve-probe
+test__prov\$target:::eleven-probe,
+test__prov\$target:::twelve-probe
 {
-	printf("%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n", probemod, probefunc, probename,
+	printf("%s:%s:%s:%s:%li:%li:%li:%li:%li:%li:%li:%li:%li:%li\n",
+	       probeprov, probemod, probefunc, probename,
 	       arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
 }
 EOF
-- 
2.47.3

