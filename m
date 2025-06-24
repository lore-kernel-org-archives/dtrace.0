Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825EC18DB02
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750801233; cv=fail; b=DwyCkVKQmn1j5UbO1FiJKF0ThYOJAibVUQ6wKoCVoB5cxzar5vkBMKpU93EyDWxPsBTVOAhGycrYkxZdhhKoMYy3cbUdWQF8HHv+/NExXPyNwtys8iLUD9UnFbtbqykW1VTcWgWeDLlXzOxe9E+2ftuATNXVuvEoQfAiwTEAzNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750801233; c=relaxed/simple;
	bh=CxdXCnwaLy553QQ/UJ5dg6lbv7flS8zzp9eGDguLNvQ=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=RSfMKtWmFOVj7nkh5no9ru/wq0zRpTvskRRX1S1CzanHE/1I1zMV9rqAYaTzfYKHFf3JNYMeR55fm5YwLr/G6X1lPy3zsIxRIYsm5YgrUqTUJdCWd4tOWQNLNH7GgjgtBtCA1uqnztxbW4YkTNrcVZRtdqVB5Na1puzGnPhfeF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LlqQY+zG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YJjsLVzG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LlqQY+zG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YJjsLVzG"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OL2F57008627
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=RKbXD4DMqurnf0bmAMho/Ryeux4e/t51yoyYfg/xNrE=; b=
	LlqQY+zGFSUBUyZ+q9smBwd3BVzYWLYZY+jNwaXV8YwRSW0IbX8e/dq+/sMoTf2V
	7UHK3uUwuYFCQKeZXTsyPFYo7nUVgPzFCa+aQJIT1hWkZFKHo1RvawiCwWjNa6Pr
	QWarjrq3gBQknQdxV7r7dhDrW/jrLXcNsmPsGh8+viJs2LIoMAB3qvbWF+Grwt5M
	qyf0W3H/GS4V0DQ6Hy7JpFeqv9NOwVclXiG3UNMXF5yT/enm7+xhStyphtpp19nj
	DXRR52BxYgJ4+k6DfIgDt284msUfvccUHQK2d6v8cBIaaP1IThQbbw5AFvDCqhhB
	eBgk0HCxYVi27iAyJC5QZg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt1d094-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OKxwf2039579
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr56yhf-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 24 Jun 2025 21:40:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViZIeJ1iSlUR9d5s+sUROTmOkLC/Ktjev9LjZig8vysQRT8UMISCaHeCV0ZuuCO/pDF0qYAN/qUbymyufwtkFlNLaZLoiy9qTTiwBck8jptHS4I0255EWr/CB5sk8lfEatCjMsLpHYA6+YCt+s7wnvLWIUDMAmCylgBd9zaqoWoqYV4pPTawH9gx7Kj/nf69j7PP91TdEep51gqKfblr2xFGq18mfwJeZJ3FqQsYD5HzTibyzdfsztP/AYEPDGd2Qyp7DgCRm7c6ENTwDMDeFgRSAint5hHVLCRgPEDXI1Qbr6zwSKep6iuYQcxWZfKdFPPrn+NBZa3oafmGrs9lAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKbXD4DMqurnf0bmAMho/Ryeux4e/t51yoyYfg/xNrE=;
 b=cTUd0OpO2ZeqBm1hgxmU/A++yB48Isr5GfLq3ORH+c4eoXmKZdivlsNPSqR0uGcHwlWv6Nc8lm7Tj54PBjNFa1yJTx39a6YEcNhtsCCyMxWcRdfoQYrDNpHcnwmqDAOfAy7+rlj4h+fA8JjG6PEJ77ePF9qF4bTjmyyDBZFeBQSd81+9qrXnbSb7xVPyeGRwZlii1L2JFySB3wfDao1iPJfdXYBzegjA6TLtm4hlpwxZyuwfAsb/NXz2N8G2McpWVFDRO4yHcqcxacfPHaexehmNr+/j9fdoRENJNc8QjkxKzWvv97vtbU9h0ijhS0iRZDf7/RQA950//7vJpmN56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKbXD4DMqurnf0bmAMho/Ryeux4e/t51yoyYfg/xNrE=;
 b=YJjsLVzGmlC8LXrxiH1OFQwBJ9M4Dy8yMep6yR1ETLUD0zDWi7Fvek8TXd6Y/0h9TeezMPHb2zNb2i08/Viny8Nj81Oh0lZlRvHg6WzlFUlTp+3Pgj4DSvHdQXMMSShIjaoL1zCwm7/nMsAYzPJQh39GyyOCkKA/fTi1e+jYeKc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA3PR10MB8661.namprd10.prod.outlook.com (2603:10b6:208:581::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 24 Jun
 2025 21:40:27 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 21:40:26 +0000
Date: Tue, 24 Jun 2025 17:40:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 2/3] usdt parser: handle encoded hyphens
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672B6C002E022B838F4E832C278A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA3PR10MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b39143-457f-4c10-b40a-08ddb367bbae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c9W0QYzB7NanhEUwB0WSb1NHPfon4Uowkib65PxeIZGApNvXnG6hPUi17r7g?=
 =?us-ascii?Q?beGcUVYQxyvGTL+t6ftCt3oJVzNXWE3FvX3JKYypbsX+fTeMrOagOA8bnHyp?=
 =?us-ascii?Q?O+4RMuxrl2/tDNWWnmvUoD/YQUr+8OulVEwV8Lt76sBZIV0cSqbJbqmBkt6g?=
 =?us-ascii?Q?EAF7c2F70D/FCKM/x5s8agRcHlPFxx8NM8E0p7gWDP70ApouH1djSJusTpLW?=
 =?us-ascii?Q?z4I1DFaXA5/RP104278Qv6waqgIsfEFelDJkBDw/XEvc3HKUAzkid8NazfeK?=
 =?us-ascii?Q?HSTEzN+Z5E1Zrw8Wc9JoZE63SGQ2D+mNt6BT9iJAi/P3pl7KxJ6ojpTJJ5WZ?=
 =?us-ascii?Q?vl8lDKqfzopVSPqYzm3LxGmPXBUnIDOestTuM0BLHzoyq90ALkkmm7y4Xkh4?=
 =?us-ascii?Q?9fXbckmeo0VwrWSfvJFnsj2QzBi/vaWfY1vmMNgipir0Tpp6RK8sT8THlRAJ?=
 =?us-ascii?Q?gWasCtvvANlgmQsIh3/hP6/wTQbzpe2v9ZvcPfpPswCWlgTysWaWwGZQH34j?=
 =?us-ascii?Q?SVeL0A1/KOexpOrzkb/e7/47PwsfACqWMT6lKyvHRuS9id0aORGFqgmOrsm5?=
 =?us-ascii?Q?sDK8LB76JvSlLNc0tTdvuf16alqD5hoOdJ4Y4EgDRyUrgq6x2L/1qfdnTW9L?=
 =?us-ascii?Q?f8wdakWwaXAGSiouRp2f+O/wnPu0VvndgqDYRiCCWCPJ7mz4McTQVwuI0yRc?=
 =?us-ascii?Q?f5iqsw4J1Q+BxaUW2vIwOh4bV6f9hsQQW+VQnHMmocXcaQJbdaNsWJXhV8nA?=
 =?us-ascii?Q?K4hlrjl9tXugbQ0XEdwGCpKMdAyLzEm/hoVAzJ4VZmScOfeuppoJVkJo5B17?=
 =?us-ascii?Q?PeQmOw8ivISqxGW1tTssV9UqGL4/x5Hj5IGApgT/2sOzEjMfv5RY6RA/2SnU?=
 =?us-ascii?Q?MpmyU4H27Hxztvc+q4XjO1Buak5f3pgStDVV5+oBN7ePzNMA/uOpRDUcc+hB?=
 =?us-ascii?Q?RLMp5MGvJ4vyPbfNaWvUFu20ONxUX2TLOZVRSF+HXmiQ0cQGGOe/pxdlPxU7?=
 =?us-ascii?Q?Q8LA5YWG/D+OPFLaHiCXChuCeCxoDBgHJ5iHIWZUsKqwK1e/WCQP5dJzEvx+?=
 =?us-ascii?Q?ftrXJYgEpiMs6Qzcy7ZD/geHGJcYVO7Xa3ufWhOVyyoTvOO7oysfg1+AlPSm?=
 =?us-ascii?Q?2WM9Nc7XJhFdSC2iEO6m53wdImjJUnlEWFl5VgvDQ3x/pJUBvh5mf8R6+7YE?=
 =?us-ascii?Q?nA6n4VX2MhBUeHLPtC8kXYg+4pM45J0VzrNg/yBUSf7xaHQCUrYnDodBoY/X?=
 =?us-ascii?Q?Ir3yh2pPp7D+LcgcmX033tXYVFzh8+qsZD9P2XEFDZ6CfH07rVE5vdNzalbG?=
 =?us-ascii?Q?sId0mT9CjehbglDIVMEsdAGArkH6rwBgF5wlvEzCTVMJBWCmcYpaafgEZ2BL?=
 =?us-ascii?Q?+Scziz6/UncF371XQBzeXdJByGNxS9PITcjUDKGKs/iWASCrWb2Cq7CwUA9i?=
 =?us-ascii?Q?okdUFq5UYOk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xCl4/mdTknhiCvpfkXt/xBdmEFvnGBqzbUsVJ8YVdZ7YrLn7rSReScg1TXl2?=
 =?us-ascii?Q?ibTKxl+4hmcUNL98bV/yRjU/Sr6+ayCYiulXOadUIX2dxIV8MaRYoymGJiDB?=
 =?us-ascii?Q?jn/GRYqta/DtoGWy5pmyy5n5+URb4wlu+Wby/vbgv4iF+l5FSt0gM0BZjlTT?=
 =?us-ascii?Q?uveuHwPIIvoSuxaSWZIzfOYqzg63MSDTq463JpBOTX4mUJoUb3cEyPQyGSwO?=
 =?us-ascii?Q?DzM0ta5Z+0QPqODHeWcAVWvFfGWSUzgnvZbowdvurkOLyi4BIsuKIzhpZTsN?=
 =?us-ascii?Q?KNZqM4cqDC+0K0NM9l6OXpIikFqgeghl8K3yIBTqklMglPEXnhT+fsbC88MR?=
 =?us-ascii?Q?fS9qjXXHlS8eZC3wlixF2CSOQH00so0u71/SxQDZgQxY0nD2POW8tu0wiO0F?=
 =?us-ascii?Q?9ad0rALpO7W2Y7taBenJgX4pQnGb5A4E1XmH9U7FsEY1V6DlJsPnVsvnmJXE?=
 =?us-ascii?Q?0a2zp3zDUfUqlEIvkV3nuapZKVYGlGDEAE+30UaHWY3NNCytYeA5GInZN/pR?=
 =?us-ascii?Q?B43e7A8ccslJ7IOJNU3J6MlajYYSkrJEoQwi185Kx8H7YnWF5yPkmvBYwZS6?=
 =?us-ascii?Q?4J3QLrN2f6azPTftD7aSCvvS/2fer53t+Ms8Clh1+Fwgv9QMjAlC1WUJtCo/?=
 =?us-ascii?Q?RihtPkalK7iZ+QH5i5fBYKrL8EH/Vv+PpjBAy6ZbM3FzMLDR4URJR0B4YzGQ?=
 =?us-ascii?Q?d3jLGhjbI1RA+g3+yHptdUEK0WvBZA2T69skuPfh/+g3/TinAvlfombKn4FI?=
 =?us-ascii?Q?GcgfyRx5W9rGmwZ0R3zufDhcqP2nzmUmmEXiLM1GOJF/CRpuqOdF/Ynm90Q5?=
 =?us-ascii?Q?NFXWLxL6TFF1sy1qSyFeRtuZ5zItrgvES3csLz0dlDXydArGc93QJwtoIT5D?=
 =?us-ascii?Q?nEqRByGuZ5onz07EbCZOWXdzP7QcKLff8JUBFEOLmOjAoNPuTYbC1eVMyOhp?=
 =?us-ascii?Q?rRHJetWJdyVq1H7jFpidl3Sjx87sRFmeX6SNQhWUmrKpefB4MYyyG1eJ1UPQ?=
 =?us-ascii?Q?qtxLbs6Mp2ll7I7U/fgDk848fEaSAviv58tQYu0DXUBbInSCvjb2e339FL0O?=
 =?us-ascii?Q?nQ/hXEMUVJp9OBMlhQYgDTfOC02AtksSKRqEgGCzDEkdBDQrX1MjnTqlj1Xi?=
 =?us-ascii?Q?DFl24ht5MQj4WVSVIZbd/4iuWAa/I2KE0rwZFlFwF838UfxK9zQjfcXfjV0J?=
 =?us-ascii?Q?lCc1IydRtHpZ3BITb1sSFwOdQWTMhatNo8/bPjCxYr1klumXW3YDET7lUYZA?=
 =?us-ascii?Q?BGGBNPJvqILXakii4aYLNkzxabObw2nftTOWkSda1BrZJ7Uo8SWlASnw3lQh?=
 =?us-ascii?Q?WI6etd21sUgPlANOYc29dSF0UeRwYEgZoy/IVkiWKRPiufu4IGOFS5ejVp7E?=
 =?us-ascii?Q?6iLJzi1lx3lzbGUfli62uIrMTyyANmF4rYLYR30jhXYVkXxZlWt5pVCQrW+i?=
 =?us-ascii?Q?242Wqg7gXOLXpzUZ30Rnh/3x2OUp36RUegipvgRGDC4WZZCRpC0W/YkObmgV?=
 =?us-ascii?Q?tUb5fl+CI+Dw8GPPFryU4AcYyq7wo1JZY/7Qa2xprM4SJ+DrEHvqVTkEs6Yx?=
 =?us-ascii?Q?Ua83uH2FizBq15EDBYSQiKuXDYIXlfDBL852odzvvnShPDLHIwr8+xSOHAqa?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oC02X0hNz5Kb1dxwUxFjEBYgpCnCBZDv3+NTGHF4Rb/Uw6iFRZhVdle/RWJ9ZsKDZPqfGpj5gL9Dc2bDZmlhAlJNM1KmIl9TdOYHZY869U7Gdy2AlaKSrSQMhCu6zfAeRgf41uNlzozLmjdAZepvq4ThqIzEVvT5Kt6cYqnAkXGvXJL5v1Z00bp4vTseY5Y8ITzdjYdy/2F6ZiAMSi019hOkzQNXNXXhnd3NtmZPmRJ7rvW58njgyVYx8MNnWvDljUwOcQVL2a149mbbx9vzRlMLjeJmrPsfgQBp8nT0XMdeBjaD+hfOuGFbLbNZK0Vd6HiYTWdqjwbHKlE7s4va5cunRlEQAzZ1LXFcAxlOYJIoVg0Swlz0oYpFmXBqft5mk8WpOW9krf752wvPX4DnKKnslR7ckP5KS1jdjecKGoIke9J6+FQlQ9Z5AiZlKhXSJUcis/CBzNB0ZklaMADVxLbHhdxl4G4gmdRGdflh9H+VygREnpe8m73aCgdA8BAjujU8bUoBA+IjGLp85eXbc9E1ZpATSLNHlu7FqSaNFH0urjYRiQdg3oOsiw0UKcNVds2nxITpU+Nyaw2RNumRgfN9wF5lFK1uoyMTDr5DVEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b39143-457f-4c10-b40a-08ddb367bbae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:40:26.8889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8MntHqigCzIN2ENdSR8zNtzf2hdBIFlKmTh4b4FkSa7Ras5cHjXIY+rPhbJY6/1B2M+JsR7yrclGVFN4NPadIhLVU7xD6xGZscacog0NEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=946 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240172
X-Proofpoint-GUID: ktiKPArZavFtQezgvTcUmGE1u_cSYtaz
X-Proofpoint-ORIG-GUID: ktiKPArZavFtQezgvTcUmGE1u_cSYtaz
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=685b1b4e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zUJAFIcvKhbE_oVC1OcA:9 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE3MiBTYWx0ZWRfX0L1UyeuaNRwW fYXW4399ogKalWIk0FlGqFbYUa2yBdLB1WEvD+u2nNIay91MfjD5K+nC0JhGnn8xlUEppmOTTlO njykQXuvgEFrMIO/2VQQ8/+CsjI1+YK+9FiEmySb26tdsZbpIHnybAJeWwkA3Vto5qbEKxlfHuk
 N4ozTw+JXLt86mJpYR/KwDque5NexrEdHXo1B5fjAqNnDKaztrzgQUGfRHh8JQJq83IijvbYB7B OUgfYC4TK5uLOSx8a5uHzH8SJGws3CZNWmksWREHXlhnZTdHdz/hVFfteOsYUwxQIbrz5q/ipkY rl7pkUzLjattM65P6J1sUZvfLGREIndC2QGwNzLX/h878KWzzldENB0CKanVcWuqFJh2ZF2MJJ7
 hBPJQkkQB1S79JM87p66Yrw5MLYGC0QxoHQICTnfM4WDbQ8cOTKbA5KJzq0DTN+tq4xe35Bj

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libcommon/usdt_parser_notes.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/libcommon/usdt_parser_notes.c b/libcommon/usdt_parser_notes.c
index fb57f119..d3d744fb 100644
--- a/libcommon/usdt_parser_notes.c
+++ b/libcommon/usdt_parser_notes.c
@@ -471,6 +471,23 @@ parse_usdt_note(int out, dof_helper_t *dhp, usdt_data_t *data,
 	}
 	prbt.off = off;
 
+	/*
+	 * If the probe name has encoded hyphens, perform in-place changing
+	 * from "__" into "-".
+	 */
+	if (strstr(prbt.prb, "__") != NULL) {
+		char		*q;
+		const char	*s = prbt.prb, *e = p;
+
+		for (q = (char *)s; s < e; s++, q++) {
+			if (s[0] == '_' && s[1] == '_') {
+				*q = '-';
+				s++;
+			} else if (s > q)
+				*q = *s;
+		}
+	}
+
 	if ((prp = dt_htab_lookup(prbmap, &prbt)) == NULL) {
 		if ((prp = malloc(sizeof(dt_probe_t))) == NULL) {
 			usdt_error(out, ENOMEM, "Failed to allocate probe");
-- 
2.43.5

