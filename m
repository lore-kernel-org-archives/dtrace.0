Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548ED25A655
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165805; cv=fail; b=s1SNUL+EdMCqb6CjCT3noWya8fRztpnDcu8o0Bxf11gktYZItKJz5hdLMk3mP4iSYEw8WL745l3CzevF/wT+UH1ta3WhUVkJ6K+MCHBKxDRybdSbHnIeBypb4zmF5Y74M3fqIEkLC+PC7hCnuFw9DBaanUpKZzQyCqbPbVfpo8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165805; c=relaxed/simple;
	bh=RwGyyC1L+X+X7o28on/GrFpQKqnT2SerEsP4ivTsTdI=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ETfWPMjHvl/5XIH456oIYx7THuCAT3bLhwjTFGp9EcA1HEdtdKI6ebRZaUhTrS+ZZOeWzHZ0OjZZp3t526Wo+GVqet8R+FLy96kJ2fMDWdxC5XY0JIBwd2xa7hNNaS1xIgpH3FBy6mdly5spGaDkUIXXLgZwSwaLIgYqVe+hEPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e5qV2oqR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=g1SO0xjm; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e5qV2oqR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="g1SO0xjm"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJGOsiE3120766
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 17:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=EbKjSmHtpmvfwVZJmb8B3WaHN/uI31Xx9Lel0fpUJfI=; b=
	e5qV2oqR/b3LU1MBoAQKc/vV9fFZdXRY/oP9mjaXDFqv/G64aERTKIcwvVEDIrL1
	w/V7Txo8sHK5xpmIxdJbuUIFTgPw0I2jExsdwF2aGtprJ6WQ9Nk1N3Fo/gwkB+K1
	c3SgYco1n81TOq23FH4pzpDmcrtFRMyoE6s12SGQCsw26o8i7/enAJ1Kj+4x2IPG
	+T5luBTY8zrXaB8HhhStN1h0Wsl3Mf5hCmdh9/mBN6CG87+p1Byrar7E+tScnr5D
	VgkqP7dgzdOWM6VhVBUViVoeIFtyQ+5NCxq6e235Img67cu/IIY4VzbkogRh3oPF
	onfgKSSSWv8rdEXHyu3faA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4b4r299gpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 17:36:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BJGXeGN035678
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 17:36:41 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4b4qtt0yrt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Dec 2025 17:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5PKjWbXSBW6mvDa+3q5ZR8nsBMxoH3L5jaumR0r0bk2b0jVjAx05BahDebTujWlpZS+O1gMmXOunU01bSQ1dnLUfZhjcv68ULHIvvvAYIE/P9RlfbsC5J1/EipSxrMCRK11qbMBcousA5UbSNIjuTttryGpAkWwFpALATtTL+9TlXs6WF3/qlDE8xkNQiJPHVeIW3sBpUhMmeTgAkmzON2RpKcPMu7HznsLRZUXeXq3eir1eo0YO6cSdJxDs7/LHEPHyLlXg56bszUe7UIBPl5FHlxMlMwcohwgRFo6WrJK5//H8rUFy6HTLkgAr6OE0SKpcIBkO813p9JhKrhOZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbKjSmHtpmvfwVZJmb8B3WaHN/uI31Xx9Lel0fpUJfI=;
 b=SByaNLOBdhUsmZ03c2nDKKouYoyytIlAkavAWkVlzPqJNOpgyqhMX3UPTYRKzj45jZTqQAGfHfmOykjUkblZbkkwlvOoR4DzahuJr5lBOiGhk7VcvXA8q23McS05DIhwA548ruVuThbwBNPtDcHm9ddj5/GBpXBpFmitPRc+C2/3MeLIEjdIWb96Z0Z+8V+zd56X9QuveSN1uP1gEM7MO2iIC0433xQ1tZD6Y9GUKyz7Xtz+Ufg827kBNJSy1lflCHNQb2uEIBgSAY1RUQhHoXjL62dYjX5zSm99lng9g/6Vuyx/41J1K4oMm6lnsW0UkjjNkofDdKcgM1TBHCkwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbKjSmHtpmvfwVZJmb8B3WaHN/uI31Xx9Lel0fpUJfI=;
 b=g1SO0xjmKoln3NFNGvtErdqoAyShfnhTYrkYtveSG3dzgiWuTCM9MXBLjGlylb7ruxV3dwTNUDsNH+7Bo4k4Y2PCOyuIulNmOHsOWtDfBxQIwKNBIZ2yG0UdFbQRrdkvVyQeuLdvPysaoiKs+Lxj84lFnxnvpoZUhb6KsIuktBA=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4783.namprd10.prod.outlook.com (2603:10b6:a03:2d9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 17:36:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 17:36:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 3/3] doc: Clean up list of unimplemented functions
Date: Fri, 19 Dec 2025 12:36:36 -0500
Message-Id: <20251219173636.16078-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:510:e::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4783:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f8161f-ebe4-4678-ce61-08de3f252a4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rsIEaNaK1fOCpmKpzrQgn8GfjzyoL7G5R1a+bGAtVTOLgvvdAS84y9f4zA8R?=
 =?us-ascii?Q?piYX/GOIfjHQfb/4tF2feInaRwoEMaQp9mdZNLFyuf3aoud5xfJaPMaV3SAq?=
 =?us-ascii?Q?uE8sOXnQ6VKDqHFlC7bFgWD8Prb83J59035X25R9vF52mGFr57ENX91NB7cc?=
 =?us-ascii?Q?98J1ikQqjdV1Av6Cjsuh4dL1FxHhZcUd3jPbqX/8/my+5Ec5StfBlS2eijPz?=
 =?us-ascii?Q?/7rGA9OqND14MCYn3WHZ5VD0EjXk+bAsoaFKIWqq9V+mlvA9dknVO/rq4a4x?=
 =?us-ascii?Q?iPyEB/jkJB2K5f4O6PjgA63Fp3ZxhcGLdkGlRfkfA7tbRrPLl5OOi66UHM6/?=
 =?us-ascii?Q?ZIO9OZWVCQ3dAb00cwHHeu0bd5A6Enx1qu8u6je/pQW/yCbXtYyqq4LxGdsC?=
 =?us-ascii?Q?lBIli1NRuXxmixYGXYO2jfTPKUKNQaEO/DlCgJZNqTqJ9s9NUra2Z/NRgtYo?=
 =?us-ascii?Q?T0kOD/8lrqdLKW99+iJVPUVsOyEazZGdb9DCew8JFdBJldGtRhRZ/iCAHvra?=
 =?us-ascii?Q?2HupV/cjDVJhxk7Go471M+0sdqFKNNh4sqOwYSeNSO53ASlBc8zLiZnn04yJ?=
 =?us-ascii?Q?iYyxyJByMwrm3OZgXuemWxxD71WwhnQFhyKM16/7NrsQLEmhcJhPXhHpoW9W?=
 =?us-ascii?Q?CHbl8HatjwCMsnpZ73OeBRb91Hfy+KYvyzswyomNNR+NQ3/icKzORJQ3zf7p?=
 =?us-ascii?Q?c/RGdSSRHirs7y/TnWrIAsh5QJIMYeiErBsinxB5ANyZYpdJZHIWXVJ7Ln+o?=
 =?us-ascii?Q?SycIVEdmy5B9h3zhLLdMM8dR55Om/RQQQalxMi2IbByHNz7bUKFbBUN+xCPQ?=
 =?us-ascii?Q?XTc3TL9W6PqG2oB9zNajp9cN3YLYzjnW//3kZn8/lDtKQ5Owis8kkXiahqFk?=
 =?us-ascii?Q?xtMlJeiIZXdHegm54gRiNVRhe8B9+BReCIUJKqnOrpZBnesDdCQuizJgJI1k?=
 =?us-ascii?Q?orqny/AyaeeFrSddMgazL6Y3QnDf1NyRY9uNSI1JUofGgYj+rxbDjbhuSIw9?=
 =?us-ascii?Q?trgt6UQZcWqPHfh8SFmVPBO6Z4yd1iQBIQGKi3FoGHpq5OKfXjxxQi2CGCm7?=
 =?us-ascii?Q?4UtndN0jDtnGZyUfLpBCh5zw3oS/P8EG0Bdh4DWtz/xkRXRRbeMAFg36a7Z0?=
 =?us-ascii?Q?8tpIQ3e1zfq57DiNoDUhVoBAorX1B76uYkcm7CUTXl5n60P7eAVBV5XSrrSO?=
 =?us-ascii?Q?1gDFyOT+ZacUl+Lb4ewIWONUGek/3dsbzAPOuYintF4ke34sVDhj1JLEqupH?=
 =?us-ascii?Q?DBGMNNQPAeN0QA0iWQNv5NxSB1Jl6Lxii0z2a4z1ZZLZOdcGLsqL32Ol/iY/?=
 =?us-ascii?Q?3eb8XARErAQ2AbniPVs0ZqEOkqPSA7EiAbQhDWLHME9qQbih5mEeXctBEX15?=
 =?us-ascii?Q?2ZDk9/YPL+CnWmFelkW8b1VHsOL0j77GHmhMBULuX2HTXUAIifzYzHn/q23F?=
 =?us-ascii?Q?izK2K76Ty3YbQ45Ys+FAJzM+DBsAF2Az?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xtRkAXQjbLN0sYv00a9Yqf4f9ecxo7aIflXi2LyP414Rkllygbb5F7Dkux7y?=
 =?us-ascii?Q?IeGA2HthWsxj5r8fVaXqGS63UXixS9Ich4JN6rAzFpl91qZ6nqyK7k2LP3e4?=
 =?us-ascii?Q?IMndhtl5AW3xdupRjz3bgj+C9NZ6brintSN2lJMzK9I0fonfV0+hDscje0Up?=
 =?us-ascii?Q?Kl3PGvYiVX8b6XB4PNKeFpO9hIsQJEsH0XnkslNYdiE1pUkKBXEXhJYMqdHY?=
 =?us-ascii?Q?C2/uuZquIrcwDsdCauyq0BtxPRaOGQUbyDKszzDul9RNTWyU0N54Kar7CU8h?=
 =?us-ascii?Q?kiIyMaKmE/Abi9EAWvqHcrjCldauta+H9d9CvkgRiX6dxWMv3OanvEFXXKeQ?=
 =?us-ascii?Q?dpkDxT6tTkvvDAuXB4n/IIoY8IJdL0PDh/7OzfdbQm+BNPA6d8L8dPh8E7w4?=
 =?us-ascii?Q?SNdqcIDTSafR/a7dKio9RTwJ2cAnRhbIFNnf/LKABfvvqo6fRhdMhGjW964o?=
 =?us-ascii?Q?xcX8ut0/KIOfIVRLz9GgtQ4SdENr2H6Sa5hbq7cctA33XH9Sg98xpvMcgW+O?=
 =?us-ascii?Q?1mDc4KXlwlqjMUgvkmFk9f/eeDv3VzdJmRWp2OMIUEXC0/mdi+Z/rTLEJrBq?=
 =?us-ascii?Q?LQ4E6mgGlWPI+LKI/UMatuDOuPT6Wuuu/5/OQqcUYDx/S1mQHejRuqh0aYPm?=
 =?us-ascii?Q?18GwTTiQmXdVOc5q8aXthsehJtRgwTl4t/EWNET3/MpMnNGLg0DyAqBpQynU?=
 =?us-ascii?Q?/PCtRpo+bl5MGw1eo3YwY94D4LPzrWGxc4tIbPVV4IY166eKbDTD6WlkrguJ?=
 =?us-ascii?Q?WpsPArnhT8CwvmVm0FUIdJOCI3g4geDD74PpFLsfOpCz6todHWaFjCeI5fg4?=
 =?us-ascii?Q?gDdQQTa1PoxhMPMuh03nKR43cEQTJdEuWvfW7JKC1nq6gLk2NLi4ePEkwIJa?=
 =?us-ascii?Q?GH++vjJRLsn1j19EsW9++G84R5PdMGrbkcIBZSRLJE5cFP2NMCGLrCekryxd?=
 =?us-ascii?Q?FbdsWStuehCF1m5zrx0i/gTmN3XWQ8l5kTM2TEh4beUptb10d2vY6HsZKrxv?=
 =?us-ascii?Q?2HbRunkFQxenigmlU0Kp14wJcFZQ/P+a5DIGEVOpYIOoJlWS4cHn2DZyXVE6?=
 =?us-ascii?Q?Bq2Mi7+wu9jMJ01elHF/cdbgHJjHhVUVoTVCrlxX8k1/e/IXTDGxEL0pFND6?=
 =?us-ascii?Q?jwQIM0w9v0MWj2fytbfQgmHJj3KglpS06xIh4lNOufLWoytLfJNRGywdcJdg?=
 =?us-ascii?Q?ht17UQYEk+rhGYdEGrdDeRWMIBy9G4ExrDrZfKpgx6fSrovYzB7i1TUzoA8O?=
 =?us-ascii?Q?TJUrfAPoUoao4LqmMNbcmYC0xoDwztzyRnTx1yZcIoEyx3G9Vf8EC7ams5Sk?=
 =?us-ascii?Q?MC3uXDyW55vzg3r4kexPWguSAc/9eTN2GdiBVJoDoSYEkNuApSfK7Piyv7+w?=
 =?us-ascii?Q?asBVJ8tOf52FFcxRsKjTECOAREP+YAlXA2KrlYvRp/2qPJ+8ZnW/t6kkiGjI?=
 =?us-ascii?Q?LxXjCML8Be9MrImkJQYM90KNld760EawCa6XMEJU5TP2zL2PVFPgzdv4VHE9?=
 =?us-ascii?Q?OnmIS68mZLk96g+aJ8wuv3UIZJUo2cVPSdUwjscLnCmADrYVVtNoNJ2eRFv5?=
 =?us-ascii?Q?PafhDebuCXC+DrvfMpN2522/dGvRx2JgOaJ5Raid/mtdFfSuqh8IeKslnsPY?=
 =?us-ascii?Q?HU9Jtc8nYCAMI/eSyvwcPlGJWHnJRe6BIAhhAoDiLwfOcspLrXvyjaGTrbaN?=
 =?us-ascii?Q?HVKgAw4hmnT5/hjw/+mobhyc/nftX7BVLvn+TnakVrNbuT48s/PRy3LAHnXv?=
 =?us-ascii?Q?iV8zv3FhjQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rjuHB1E5M6Dggcj+Ba48kIq6gcPFdHsBWgeUmXzkwSUHUsAH9PeaNHensRLoWOJLj6xpcpMKFmLoP3kKSinuQIIMmSo14Yp4hpzeas4R0OlNQ/UzYn/r4cQQ4ElxUZXGTrSGqa2+fPzu0Y1zUMuh3+POkjOR8RFyDpFrbaTmNczW9H/Tgsyn9nmS/oj/EITMJ6OEDPmPb0Y5lbSlrOP9hCb1STgGz/Oi2m6cvmqUxziXQkj4r6dN0li13Ztu0DKsL0AZRTrfAPSLM2siMigSnevkxNcx9BoLGQj55gXsc62EhFK7qRxmBHpxihrlzw3++/jLSinbmJkVhFDWJCWmJYMaZjMGUR4LuoDRCnjfHV8Yb90JlXtwxSus+msa9AEZ4IZLgv3ceduFQ/HDrTtrSueVWNVKkBDlfcLbydAyrzsDMMpyjQJcfcphSprqy4i1mD24LTUOFOMvbmAb6Dwd+b6IQn3Wpn+hn1qLK0shO3kkXoxwwDpwVMA9H01kTuCkzHw/HIY6ocLrwdpYkYsxZFn4lDLGDPdKjSBAI5A2VKVPr7RNmaTiGfPNirduLixWdTEBHmOrfB0I2tqSgcaXWNBZJ7VICfM6L1joOU93tlY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f8161f-ebe4-4678-ce61-08de3f252a4b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:36:39.0281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+vY5zpnBoN6HM1qYs48NJltrfcAf/yYw+QNgpzzp3F9HHY2L/a26Bx1OGLrOCncjM61EhHUrty2BpCmkw0Pag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4783
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2512190147
X-Authority-Analysis: v=2.4 cv=Ib2KmGqa c=1 sm=1 tr=0 ts=69458d2a b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=Y8unpwCt_3-RevG5Ji4A:9 cc=ntf awl=host:12110
X-Proofpoint-GUID: 7YEeVaPfpvv9X__fDuffd31LA2aCIYxN
X-Proofpoint-ORIG-GUID: 7YEeVaPfpvv9X__fDuffd31LA2aCIYxN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDE0NyBTYWx0ZWRfX+mEd4mgb2CMY
 ZqlXe5QYVMnPWlS1AwWkwfMqxpSsvJZcGXlZsUqWBv/GBSP8yXAh3xk2+JI9BY6mwLR4ykl/Z7S
 CTG/5Z+dJHS29qmtJSMS2cm5BfarqGtgQx3xMahYAwPfXzKPu/weFHBicBQwT89UIYg2+Vqjefc
 fnSr4WWBzDXCWogBkvhT1RJJM/XN28kuYueEJAmsVQfwPoxRgplrMulPABUaI1LGe8jyhIJnvxO
 MEwsWdIMLH9sMKZVdYJRsrP/9aPDA2FyaG1/WZ1U4Qykp2LdQP4a5f7Ximu8Y9sFF9Tm8DTXnpX
 dW1LVp6hW2tsjcdibz0aacAfxvUUMM3CTjFSkAfttCtzKSAGtZuhUHjOS3q8Ca4M0erIGzTXUlk
 63gwzQ+D07izC2w6sUCGXEjXtnGtqvaVQkMH9NPAsYFuYetc/FD6ZRaWSHZ8qR+UodRniq/uPb5
 vOBQr0FE6AAhklwAO/iq0Yi0q7prRbqZ1xAqQoPM=

From: Eugene Loh <eugene.loh@oracle.com>

The case of dpath is tricky.  First, it is actually called d_path() and
it was always meant to be used internally.  Further, it is in fact
implemented, but only as a stub that always returns "<unknown>".  Just
remove it from this listing and remain silent on it.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/unimplemented_functions.md | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/doc/userguide/reference/unimplemented_functions.md b/doc/userguide/reference/unimplemented_functions.md
index f69600b56..5f30c9385 100644
--- a/doc/userguide/reference/unimplemented_functions.md
+++ b/doc/userguide/reference/unimplemented_functions.md
@@ -6,25 +6,12 @@ and some functions are not relevant to Linux and might never be implemented.
 The following functions are not currently implemented:
 
 -   `breakpoint`
-
 -   `chill`
-
--   `dpath`
 -   `ddi_pathname`
-
--   `inet_ntoa6`
-
--   `inet_ntop`
-
 -   `msgdsize`
-
 -   `msgsize`
-
 -   `panic`
-
 -   `pcap`
-
 -   `stop`
 
-
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
-- 
2.47.3

