Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25C20298E
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276914; cv=fail; b=Ne5SbYDrRG5WeGwV0Ap1bwIGtT3QO6F03jbRqVPucLTLMGfHxScRPvFILRZCGve7jeoG5QUrSzhoaw+yb/2WNKwcJ5Ugz1nns71U3jUfkuUv1oGx+qBaCMy/xbH9hQugmRjp2I5cmV/hrRQviXUtQYr/mVQGJJRiJemDg9Tq6LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276914; c=relaxed/simple;
	bh=0zdLAU4aQX22FdrxG5DMP19phWkQgJkKjC5cG1lN0mg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=dXQXApej9+ULTI9KnTvIP/MSAplA5MzPG4egm2ONefjhlKqCJhNRKxS+blvuMkUx6kmSqT/YvzF+mEySijALcJSSK/Yc34gmQDk6yuA87htR76BX1G4t/IqraEri7CMSa6VVPiHxYOd8TpgV+sPvyukfyKYabT9kGgdfk6UMPVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g3Rxn/m0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FGM2aMQ2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g3Rxn/m0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FGM2aMQ2"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575xeHO027055
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=Eg+z/9umPVPmF1GweEfgSvMJBTMpbrt0rxk5s/fJ6co=; b=
	g3Rxn/m0WJnSGPk5tljfQ5L5BEXQrgqznPFFXX92p/PF95z2eyUESJez9lGSLrTY
	tWRkpDh+zlfto0Cf15PeB4acJylFpgj/8k4Q2xJ2X/Y16JiC+Ro2wCskEExVKD7H
	oVPDoCD/b8S2lwHNdEOxCv82IPZ/qAF3kS4ylxBko5epFIW0o6EyfrE5pWRF35SH
	I5QLqdVBsH+fti3I2v9c2yuezm94j2buIr9KDkT62HTgLc8OJ7XRYO8JaLmKlVqL
	TzDbPlKfd891ibaxhAUvjpPHeE4tpKQXJCxbYUbszmmcL5WZ4w1qTJTB+x15bZRv
	5iWQAc7dfe9unNVUq8v3nw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dywr1p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5571XYgX020720
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:10 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6kysw-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmi2B28wdYDYJI0dBSiDlnH0RU6mVwm5XrzhoEdgk2nxT+0z3GbWTjpYgmkcgEHgwBvzzPjLXrCK+yFNRXKmGzoCgm5dnvR5Jq9WHJRCupZGdVwz8XZc9xn8PVZ4Z6hUQPE8UvvGJU7+E2JTT0o4hWDqmwEJ/x6g0zGebNFquEYKHdZ5MSrIczCd+D7pXz6Z7Q1q+jQiqyl4m+nLrhvNXlzdHt6bsvojF3K7HjZE94SiXTL/iwUt7Jq5HEYqj9MHX5B0X9CO8DKqah3Nz/3AUYKZ5oks9mTi51oVOISjZV/uREfiAQaFwloV77i9fVeQKRR/RwcGgmF/RXYwligqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eg+z/9umPVPmF1GweEfgSvMJBTMpbrt0rxk5s/fJ6co=;
 b=X/oXPpXebaWxZDDtYCFyRXwgAzfZcLfVLd4xeah4buy6HeDDDAh+cMKxoz9/DHTCS79OtYtFrjKHvFs1mpkcZ2RrM9FY03w6FxOLFIuxguDyksL5bU9aEZgfO8OeZRikSoepbAU1VZXD7yoNamuvuDexRAKQldc8eMLQcCudaAEUxXPF89NH7xL/kWXaWErl4NeU/ihb7dwfeK8Q5DrxshAC72t50Qk0kANa/6ehSjh6e1vcVMr5YE7JiqMNr6mqqEjJsBYDWnrSuMn2+IoqPrbmoKdsab9QbKXBavcmufwsOJbUIwPgD0hr1bYUFVrQZ+mQeY8sxOnUaSCJpMg7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eg+z/9umPVPmF1GweEfgSvMJBTMpbrt0rxk5s/fJ6co=;
 b=FGM2aMQ2f4Mrpw6Spju08y6vN6Ae2fErp5ch2Mc84hcLDOJ6/3CHo+O97K4/DjweULPv+CwhyRj7HK+hrH0aRgFL22XRa/XsdUWKGyVtJJEMashj2HxINt5CflPUFDQKuxd6fY0hGsQitcRp0WFx244naNPPmwU5dZSDK+CKIg8=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:06 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:06 +0000
Date: Sat, 07 Jun 2025 02:15:05 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 14/17] usdt: implement tracing USDT probes specified in ELF
 notes
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:208:36e::16) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB8374FB7BE674A6BF4DD48B75C269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: de66d4c5-61bf-4aa6-56bd-08dda58aa5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VGlStorfR0P6TV9cXuIGZDnSlv4gY2TubzhSUgjmgKG74u3YYRCFcTW+6Y+N?=
 =?us-ascii?Q?Dd0y0gtq/vEhBO2MAm5ezVLZAu/mC4lRUluTaCY36Iqa0o8l7DwUe1jzGMRQ?=
 =?us-ascii?Q?I/N3i/DQtGHOAZkv5WqIZdrfYiRppwUsRwWcSAZMtCxHEMiNRPm+dh4t8eC0?=
 =?us-ascii?Q?lQAZmFaCIUXwm+esnt8cXDujKRGZWwO+BYlGfLB5ENHQUAFWF7EKovRz/Drq?=
 =?us-ascii?Q?T5Y2lG2CBtUqSJpKlrYD1ebnhzeeKYHogdS82pgbpr1Z2b7jBVLBoHbgtqMF?=
 =?us-ascii?Q?A//+iLFucCSGDmB5hcACUdD8373asWuD+TpvvfjwsZ9nQa4lN+ZaQrf93EDq?=
 =?us-ascii?Q?lS9lnKfG9Z4QDx0ntC0tVZfKCJHy2FVLpFXZBlr6bAkdOQ5NEWVrlneHJceO?=
 =?us-ascii?Q?evfymBsHJ6hI0+Keod3boMSqMsuPuTelTP0CMq1N/GCzUroYEPQL/HZ0V4dF?=
 =?us-ascii?Q?Ys/LLd026ExS8f565nUJjl77NCthASXOhwODiKE4up3vXuT+men6Qf7Oc3Rt?=
 =?us-ascii?Q?/dpwVfUfDlS4vhURjC0/LJf3pSFVXGjNWnY8Oebndr2MqL8Mv3p1CQVcXKqv?=
 =?us-ascii?Q?UmVpvMeqGxCa9QsKD4Ooc+pIJH451mPU3xVD5mPix9MaVr5n9w9jJGUrkRFd?=
 =?us-ascii?Q?LGt5BQtrIFcZp1oUJAiXVKijdFOQcXu+SBCHNeuAYYFj+quxzH6sVSR8eYr5?=
 =?us-ascii?Q?Xp4IIDZL1Zy1rr6g4cVS18pV5cH/YAxexrF7mbI8Mpg//dbvTP2ChgdFgDTH?=
 =?us-ascii?Q?Wgj0zb78DbhlJRnS9M+8s9i16/A3ZsgDRENz0+ncvsrjfcr3++CGij55XvXy?=
 =?us-ascii?Q?oOmMPf+zm4q8e4S5M340XRIuolQp54eUErF7kK7n2UXc4VINZ23yc/SFuZMG?=
 =?us-ascii?Q?CFsI3ERxH/mOXLPjIu2cAj/foXyz8QCa8o69OreU7pYDOsY+JnX4sVPvzXeT?=
 =?us-ascii?Q?p+7j8G3OD4vJZb8dlkzocSm2XMDwX3VpgBuGQrm4BT3hf4g2d4vtd1SY1vOX?=
 =?us-ascii?Q?fGfAC8BChpm1pi2vBT09sUvCpEglSN2H7z6djAJOAKmoHYxxfbFLbk2RNsHg?=
 =?us-ascii?Q?KOVA6gQtRGZJFLDypoAfQbNPz9U3nrAl3MGGWBHGx76UxRjblFET/JTWzQTP?=
 =?us-ascii?Q?bTeVw1QeldpetoBYGapLfKQqqlLeKH2sAhk+2zhZlxPF2XUYaOETTxiablKG?=
 =?us-ascii?Q?DHU2yBJkkTHlMWR0MUhvcY0CJEa4QeRyLYkChwassgR1CIkTcMtpgdS01saG?=
 =?us-ascii?Q?HfQ/qnFiWdGA/PPHUy4EXELgseR0N7x7TBFqSQaGq2lk4umaXEbbu0kG1JC5?=
 =?us-ascii?Q?5lBKAwgQMm//klJEyIBRKi8DVX+tyoSmA1SrkNUYmIDggBqmk+hyQVuotTpz?=
 =?us-ascii?Q?lw2jS7OAnqhTTkbPg8SajI9ShA4qPHchhIwZ9NAnrnRVneuUj/UD5cUKlCdB?=
 =?us-ascii?Q?N2RhmkkxavM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d7JoIayq4nDYZa6xeCRG+1fGCBSiHqXXcAld5YUIGI/CNoKBc8QvUd8AT5Nj?=
 =?us-ascii?Q?vnJJ/0SD/5abM9NFIzSfb5s8WVHYKqlbz2iV7ca6x/AyV+bUNbB8wI1UTz/N?=
 =?us-ascii?Q?q9oiTSMeuGS1xVE4jfqLmzT6nFwtPT0rM4mIm12c2z14cQXCSJgb0PV0M62Y?=
 =?us-ascii?Q?2u6eH+5Wzcb7EvIU3sx6SUqso5tuhIpBB2a+/LL08v1NZICi3ggr+tEFYdr7?=
 =?us-ascii?Q?ycmKxjK2tLgvcoOLM2iIy4LIweJ2HVfNkiYshaIDlgAm6tDqr/I2plvqpxUu?=
 =?us-ascii?Q?NqZB5pR/BTwBED7zy5GDRhVxLpFiGpWOr4wbe+F0tNvg3nXh9nMTDRZ5zLN1?=
 =?us-ascii?Q?NLDI9eyqjguHO+SLOm3k3+7HR4In+2HkBnv6T97rPgdaMsDKewvMwBZs1NLl?=
 =?us-ascii?Q?3a3Oo1upG/jOD5mVJwW6uvrV6EUmS3amqoPus041guJ2GTZfrjiCtpeRjqrR?=
 =?us-ascii?Q?33o8c8eIzLkY8h6Gf9TjCMiSKWZKBJdNoJMBcRR9p8c7n4JRwcSEL6KwCFeq?=
 =?us-ascii?Q?52Ux3kWOOD09TYUCCHAsC4NkGhemH92ITbvhiTRnq3Ah9ugP31Ha92aETQe5?=
 =?us-ascii?Q?jeP/IKgmJV7HLViQTd16KzopnmTP/znri/Dtle8FlrqQNp50pqUEKTFuZCX6?=
 =?us-ascii?Q?pxtdxLDXMOWUYyrDOAwHoZmqh/vkJ8DwS+9v+ybyGwGsaSaAu2fCpI2wHu5+?=
 =?us-ascii?Q?v/EJcy6vS05uAMvYqLHZDks5bqIiwZfKFy7YHvXHjQ2qbhnRA8FrlKvetFmI?=
 =?us-ascii?Q?TWruVI+NV1WFinP3ox81dTbwa3jJyOjlTuzDmOzL/ZYZvDCHM6XWYOTvmQZH?=
 =?us-ascii?Q?vhHZ5v3hh/xfppKajDz8n8XrZ8ZRYvrxsud7yMfJNJJ6ZZTBIikH1Mkwt3jj?=
 =?us-ascii?Q?UF+qaONl1CcF1j7XPbWjl2EPMkwWxVsZ7imiRT7ih1eFTR1sLCX1BJWB17F8?=
 =?us-ascii?Q?EAnAndrJaoR/v4Nxw3RomyR1iWtcc9xQ1ItgwPNx6JTCWpsBJ9268xLgWJbn?=
 =?us-ascii?Q?ZhneSEQ6mCXCL2KUSV4fISGhKQzo2oXCCFmYbfoQl7jMGxdvYjtZilnpMu+H?=
 =?us-ascii?Q?wmVCIMthW6iYjSi5zFjivU9KFGPP8UMychrtNDidpL1O2Z6r92ZDyBPW0OQc?=
 =?us-ascii?Q?TAxV1VJkhO5Y1wb430lbsFeZBqQp1cBnWtQ7uwTXTXhLEPf0Kzn+BRIDHSNM?=
 =?us-ascii?Q?IY+OTTW9NRvOVGMr0kiMKXAs73UaLBlFEKp0IhP/+0yZtYfl8OUXYnVhEDBU?=
 =?us-ascii?Q?c4SRL498DVygXeeU5jpdh98psXQ9scJ1njMWhrdhsip0wcE5TLGK6DipmTW5?=
 =?us-ascii?Q?Vtog7a1nil6DQMVraSsc/BDB3Uz8QhZ3Kxb1zZePkD3Y8nwTc4rbZiswhWNH?=
 =?us-ascii?Q?zDgU4olK03995M3FZKne7YsYCtzq45RpNPBmW2p+HEEBXhh6fHdW/x/u2/Qq?=
 =?us-ascii?Q?xgkV6FVKxJDz+3pHoN0HqSchmdqaO1Z9XPlMNWJA7QPtj2f6VDPkbRHrEcdt?=
 =?us-ascii?Q?ITHZ/ndeYtyU/MxxTduO0jWECWiBPibxCD0mOoY8P1skcJzkFrQEfrLDJ/Ok?=
 =?us-ascii?Q?AmWT24me9Srr3GwcTOi8x92GO7oXxRSmUQYJK0gVHEOMVzFRCDkVjkNY4GSr?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DZWhoQ2fCZJ0lNQmvaM252+kanO0X9CzfrBeeovoXVZp01KzJ7ZXCAFuszVhjsF1d0g3p3plwPrKEOSgy9eqFkdzZKs29BFYYRAoUBNgfo4KoVxR3GrYb6SHs+u9GZnpmLIzQvVuFO2acw5gSKXKOTxu9S1mw8O9DzL1y0i1atQBMMePHeHGXrDMAuZzezMufEirX2hiDzPVzpTCXhyFntYSsjFZDWMnlHIyHT7WPwpLv9lhMHTm+0BSOu6+cs1KrE2bXZ/pf7Ep/W1YYVe3LgimWENlixM3Dzw+6GSh6rSvpWM06tn5bMVSSpcxcjkRnGk+SSPokSBOPAriOoWmygVCKiOesza/RxBNP8UDWFQz1AwQSuJTUCp3fvZfOkygRJKn9CnNRVRkO7mSvQA+KUQKfGbrIpvsC+TFk94osGY5M5Il8/rcxszOdsONSEBLyr4T3HCCMzQj1gf/5b+JowuoQPJLlPdn6mSyLCF9ZXsLlXN7hOVpCZ0EUSxqnhJDT5DHUhAJK6iRwNJ8ZVU3gr3vwT6zjoAfDAPRdy8HLtrlaluXPfU4OI0y3K8YwOuCbD9kxo4OqmXHASoalnCy2uwHmwvw0qi87GulTach+iw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de66d4c5-61bf-4aa6-56bd-08dda58aa5c3
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:06.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Qbp4qFn2G/EU3OVqt1JmyPiBz2H6U6z+CY4Eq2ENo8wrEQLMkFXOol1OxW1fh7L6sgLzwuasK94nBSSmb7pGG4V/oJH7Rz3bbzpknlYMy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=6843d8ef b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=XU_hyVlRVydXu6IksfUA:9 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: B_R9iM5NemVcKc9d_DSty3ALGQ-Xs86n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX5FzreCsp2qHt W7oOKoGICbGQppTzEEnLmCmEcmHtQ1j3JpF6fupsUZ/o0EFbsFdQQR6fp2MLp4EyCbiVGKBWffy rtyJiQwr+8GLhh6V+oIqwJMq9y3neoRcFbtqEDVkeUB30UVwddSR35FNN7d+KmxgiOj4Dy1FWXo
 a6Wyr5QPs9vuO6v3olH+/LTrc+Dq8X1yVQTFf9jxJp1pTloR12UAbCQk7DTXF2kepEr5ck7XFUc fsyyFVPZ2546LKMdVY5nAzqEuCh1InZjYglAJ75WPA3QFWbMLEAjo41amxAAfFznGQ33P20RTFo 4Mxu5vS+YlHhqTGxk97DL8ZZdmjsRhYmVH8TSQcCZiMp/mRWAB0WQPlMwkbHrvSmVTJTYH6pGx2
 l+FzIssG61sMxNc+9G+lMXFFfizJEogucw0lb2s/CxIExxs8REcHVDVg965WmzIvfwQ8pdzp
X-Proofpoint-GUID: B_R9iM5NemVcKc9d_DSty3ALGQ-Xs86n

---
 include/dtrace/pid.h       |   1 +
 libdtrace/dt_cg.c          |   4 +-
 libdtrace/dt_cg.h          |   3 +-
 libdtrace/dt_pid.c         |   3 +
 libdtrace/dt_prov_uprobe.c | 590 +++++++++++++++++++++++++++++++++++--
 5 files changed, 573 insertions(+), 28 deletions(-)

diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
index 12934500..8d4b6432 100644
--- a/include/dtrace/pid.h
+++ b/include/dtrace/pid.h
@@ -44,6 +44,7 @@ typedef struct pid_probespec {
 	char *pps_xargv;			/* array of xlated args */
 	size_t pps_xargvlen;			/* (high estimate of) length of array */
 	int8_t *pps_argmap;			/* mapped arg indexes */
+	char *pps_sargv;			/* list of arg sources */
 
 	/*
 	 * Fields below this point do not apply to underlying probes.
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index c68a5d45..bd0763d6 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -1597,7 +1597,7 @@ dt_cg_check_ptr_arg(dt_irlist_t *dlp, dt_regset_t *drp, dt_node_t *dnp,
 		dt_cg_check_notnull(dlp, drp, dnp->dn_reg);
 }
 
-static void dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x);
+void dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x);
 
 static int
 dt_cg_store_val(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind,
@@ -3006,7 +3006,7 @@ dt_cg_xsetx(dt_irlist_t *dlp, dt_ident_t *idp, uint_t lbl, int reg, uint64_t x)
 	emit(dlp,   instr[1]);
 }
 
-static void
+void
 dt_cg_setx(dt_irlist_t *dlp, int reg, uint64_t x)
 {
 	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, reg, x);
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index fb26c125..81b79399 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2020, 2024, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2020, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -18,6 +18,7 @@ extern "C" {
 #endif
 
 extern void dt_cg(dt_pcb_t *, dt_node_t *);
+extern void dt_cg_setx(dt_irlist_t *, int, uint64_t);
 extern void dt_cg_xsetx(dt_irlist_t *, dt_ident_t *, uint_t, int, uint64_t);
 extern dt_irnode_t *dt_cg_node_alloc(uint_t, struct bpf_insn);
 extern void dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act);
diff --git a/libdtrace/dt_pid.c b/libdtrace/dt_pid.c
index 9b1a2278..d12b7919 100644
--- a/libdtrace/dt_pid.c
+++ b/libdtrace/dt_pid.c
@@ -1077,6 +1077,9 @@ dt_pid_create_usdt_probes_proc(dtrace_hdl_t *dtp, pid_t pid, dt_proc_t *dpr,
 			if (argmap)
 				psp.pps_argmap = argmap;
 
+			if (tp->tracepoint.args[0] != 0)
+				psp.pps_sargv = tp->tracepoint.args;
+
 			dt_dprintf("providing %s:%s:%s:%s for pid %d\n", psp.pps_prv,
 				   psp.pps_mod, psp.pps_fun, psp.pps_prb, psp.pps_pid);
 			if (pvp->impl->provide_probe(dtp, &psp) < 0) {
diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 28762eb3..cf5cfd43 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -46,6 +46,231 @@
 /* Provider name for the underlying probes. */
 static const char	prvname[] = "uprobe";
 
+typedef struct asm_reg {
+	const char	*name;			/* register name */
+	const char	*mname;			/* *pt_regs member name */
+	size_t		moff;			/* offset in member */
+	uint64_t	mask;			/* value mask (after shift) */
+	uint8_t		shift;			/* value shift */
+	int		off;			/* *pt_regs value offset */
+	dt_hentry_t	he;
+} asm_reg_t;
+
+static uint32_t
+reg_hval(const asm_reg_t *reg)
+{
+	return str2hval(reg->name, 0);
+}
+
+static int
+reg_cmp(const asm_reg_t *p, const asm_reg_t *q)
+{
+	return strcmp(p->name, q->name);
+}
+
+DEFINE_HE_STD_LINK_FUNCS(reg, asm_reg_t, he)
+DEFINE_HTAB_STD_OPS(reg)
+
+static asm_reg_t	asm_regs[] = {
+#if defined(__amd64)
+# define REG_R(n, m)	{ (n), (m), 0, (-1LL), 0, 0, }
+# define REG_E(n, m)	{ (n), (m), 0, ((1ULL << 32) - 1), 0, 0, }
+# define REG_X(n, m)	{ (n), (m), 0, ((1ULL << 16) - 1), 0, 0, }
+# define REG_L(n, m)	{ (n), (m), 0, ((1ULL << 8) - 1), 0, 0, }
+# define REG_H(n, m)	{ (n), (m), 0, ((1ULL << 8) - 1), 8, 0, }
+
+	REG_R("rax",  "ax"),
+	REG_E("eax",  "ax"),
+	REG_X("ax",   "ax"),
+	REG_L("al",   "ax"),
+	REG_H("ah",   "ax"),
+	REG_R("rbx",  "bx"),
+	REG_E("ebx",  "bx"),
+	REG_X("bx",   "bx"),
+	REG_L("bl",   "bx"),
+	REG_H("bh",   "bx"),
+	REG_R("rcx",  "cx"),
+	REG_E("ecx",  "cx"),
+	REG_X("cx",   "cx"),
+	REG_L("cl",   "cx"),
+	REG_H("ch",   "cx"),
+	REG_R("rdx",  "dx"),
+	REG_E("edx",  "dx"),
+	REG_X("dx",   "dx"),
+	REG_L("dl",   "dx"),
+	REG_H("dh",   "dx"),
+
+	REG_R("rsi",  "si"),
+	REG_E("esi",  "si"),
+	REG_X("si",   "si"),
+	REG_L("sil",  "si"),
+	REG_R("rdi",  "di"),
+	REG_E("edi",  "di"),
+	REG_X("di",   "di"),
+	REG_L("dil",  "di"),
+	REG_R("rsp",  "sp"),
+	REG_E("esp",  "sp"),
+	REG_X("sp",   "sp"),
+	REG_L("spl",  "sp"),
+	REG_R("rbp",  "bp"),
+	REG_E("ebp",  "bp"),
+	REG_X("bp",   "bp"),
+	REG_L("bpl",  "bp"),
+
+	REG_R("r8",   "r8"),
+	REG_E("r8d",  "r8"),
+	REG_X("r8w",  "r8"),
+	REG_L("r8b",  "r8"),
+	REG_R("r9",   "r9"),
+	REG_E("r9d",  "r9"),
+	REG_X("r9w",  "r9"),
+	REG_L("r9b",  "r9"),
+	REG_R("r10",  "r10"),
+	REG_E("r10d", "r10"),
+	REG_X("r10w", "r10"),
+	REG_L("r10b", "r10"),
+	REG_R("r11",  "r11"),
+	REG_E("r11d", "r11"),
+	REG_X("r11w", "r11"),
+	REG_L("r11b", "r11"),
+	REG_R("r12",  "r12"),
+	REG_E("r12d", "r12"),
+	REG_X("r12w", "r12"),
+	REG_L("r12b", "r12"),
+	REG_R("r13",  "r13"),
+	REG_E("r13d", "r13"),
+	REG_X("r13w", "r13"),
+	REG_L("r13b", "r13"),
+	REG_R("r14",  "r14"),
+	REG_E("r14d", "r14"),
+	REG_X("r14w", "r14"),
+	REG_L("r14b", "r14"),
+	REG_R("r15",  "r15"),
+	REG_E("r15d", "r15"),
+	REG_X("r15w", "r15"),
+	REG_L("r15b", "r15"),
+
+	REG_R("rip",  "ip"),
+	REG_E("eip",  "ip"),
+	REG_X("ip",   "ip"),
+#elif defined(__aarch64__)
+# define REG_X(n, m, i)	{ (n), (m), (i) * sizeof(uint64_t), (-1LL), 0, 0, }
+# define REG_W(n, m, i)	{ (n), (m), (i) * sizeof(uint64_t), ((1ULL << 32) - 1), 0, 0, }
+
+	REG_X("x0",  "regs", 0),
+	REG_X("x1",  "regs", 1),
+	REG_X("x2",  "regs", 2),
+	REG_X("x3",  "regs", 3),
+	REG_X("x4",  "regs", 4),
+	REG_X("x5",  "regs", 5),
+	REG_X("x6",  "regs", 6),
+	REG_X("x7",  "regs", 7),
+	REG_X("x8",  "regs", 8),
+	REG_X("x9",  "regs", 9),
+	REG_X("x10", "regs", 10),
+	REG_X("x11", "regs", 11),
+	REG_X("x12", "regs", 12),
+	REG_X("x13", "regs", 13),
+	REG_X("x14", "regs", 14),
+	REG_X("x15", "regs", 15),
+	REG_X("x16", "regs", 16),
+	REG_X("x17", "regs", 17),
+	REG_X("x18", "regs", 18),
+	REG_X("x19", "regs", 19),
+	REG_X("x20", "regs", 20),
+	REG_X("x21", "regs", 21),
+	REG_X("x22", "regs", 22),
+	REG_X("x23", "regs", 23),
+	REG_X("x24", "regs", 24),
+	REG_X("x25", "regs", 25),
+	REG_X("x26", "regs", 26),
+	REG_X("x27", "regs", 27),
+	REG_X("x28", "regs", 28),
+	REG_X("x29", "regs", 29),
+	REG_X("x30", "regs", 30),
+
+	REG_W("w0",  "regs", 0),
+	REG_W("w1",  "regs", 1),
+	REG_W("w2",  "regs", 2),
+	REG_W("w3",  "regs", 3),
+	REG_W("w4",  "regs", 4),
+	REG_W("w5",  "regs", 5),
+	REG_W("w6",  "regs", 6),
+	REG_W("w7",  "regs", 7),
+	REG_W("w8",  "regs", 8),
+	REG_W("w9",  "regs", 9),
+	REG_W("w10", "regs", 10),
+	REG_W("w11", "regs", 11),
+	REG_W("w12", "regs", 12),
+	REG_W("w13", "regs", 13),
+	REG_W("w14", "regs", 14),
+	REG_W("w15", "regs", 15),
+	REG_W("w16", "regs", 16),
+	REG_W("w17", "regs", 17),
+	REG_W("w18", "regs", 18),
+	REG_W("w19", "regs", 19),
+	REG_W("w20", "regs", 20),
+	REG_W("w21", "regs", 21),
+	REG_W("w22", "regs", 22),
+	REG_W("w23", "regs", 23),
+	REG_W("w24", "regs", 24),
+	REG_W("w25", "regs", 25),
+	REG_W("w26", "regs", 26),
+	REG_W("w27", "regs", 27),
+	REG_W("w28", "regs", 28),
+	REG_W("w29", "regs", 29),
+	REG_W("w30", "regs", 30),
+
+	REG_X("sp",  "sp",   0),
+	REG_X("pc",  "sp",   0),
+
+	REG_X("lr", "regs", 30),
+#else
+# error ISA not supported
+#endif
+};
+
+static asm_reg_t *
+get_asm_reg(dt_provider_t *pvp, const char *name)
+{
+	dt_htab_t	*rtab = pvp->prv_data;
+	asm_reg_t	regt;
+
+	if (rtab == NULL) {
+		int		i;
+		asm_reg_t	*rp, *reg = NULL;
+
+		rtab = dt_htab_create(&reg_htab_ops);
+		if (rtab == NULL)
+			return NULL;
+
+		pvp->prv_data = rtab;
+
+		for (i = 0, rp = asm_regs; i < ARRAY_SIZE(asm_regs);
+		     i++, rp++) {
+#if defined(__amd64)
+			rp->off = dt_cg_ctf_offsetof("struct pt_regs",
+						      rp->mname, NULL, 0) +
+				  rp->moff;
+#elif defined(__aarch64__)
+			rp->off = dt_cg_ctf_offsetof("struct user_pt_regs",
+						      rp->mname, NULL, 0) +
+				  rp->moff;
+#endif
+
+			if (dt_htab_insert(rtab, rp) < 0)
+				return NULL;
+			if (strcmp(rp->name, name) == 0)
+				reg = rp;
+		}
+
+		return reg;
+	}
+
+	regt.name = name;
+	return dt_htab_lookup(rtab, &regt);
+}
+
 #define PP_IS_RETURN	0x1
 #define PP_IS_FUNCALL	0x2
 #define PP_IS_ENABLED	0x4
@@ -55,15 +280,17 @@ static const char	prvname[] = "uprobe";
 typedef struct dt_uprobe {
 	dev_t		dev;
 	ino_t		inum;
-	char		*fn;		   /* object full file name */
-	char		*func;		   /* function */
+	char		*fn;		/* object full file name */
+	char		*func;		/* function */
 	uint64_t	off;
 	int		flags;
 	tp_probe_t	*tp;
-	int		argc;		   /* number of args */
-	dt_argdesc_t	*args;		   /* args array (points into argvbuf) */
-	char		*argvbuf;	   /* arg strtab */
-	dt_list_t	probes;		   /* pid/USDT probes triggered by it */
+	int		argc;		/* number of args */
+	dt_argdesc_t	*args;		/* args array (points into argvbuf) */
+	char		*argvbuf;	/* arg strtab */
+	int		sargc;		/* number of arg source specs */
+	char		*sargv;		/* arg source specs */
+	dt_list_t	probes;		/* pid/USDT probes triggered by it */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -132,6 +359,7 @@ static void probe_destroy_underlying(dtrace_hdl_t *dtp, void *datap)
 	dt_free(dtp, upp->func);
 	dt_free(dtp, upp->args);
 	dt_free(dtp, upp->argvbuf);
+	dt_free(dtp, upp->sargv);
 	dt_free(dtp, upp);
 }
 
@@ -290,15 +518,19 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	 * status in the clause flags for dt_stmts[n].
 	 */
 	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_INCLUDE | DT_CLSFLAG_USDT_EXCLUDE) == 0) {
-		char lastchar = pdp->prv[strlen(pdp->prv) - 1];
+		size_t	len = strlen(pdp->prv);
 
 		/*
 		 * If the last char in the provider description is
 		 * neither '*' nor a digit, it cannot be a USDT probe.
 		 */
-		if (lastchar != '*' && !isdigit(lastchar)) {
-			dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
-			return 1;
+		if (len > 1) {
+			char	lastchar = pdp->prv[len - 1];
+
+			if (lastchar != '*' && !isdigit(lastchar)) {
+				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
+				return 1;
+			}
 		}
 
 		/*
@@ -340,6 +572,17 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	return 0;
 }
 
+static void usdt_error(dt_pcb_t *pcb, const char *fmt, ...)
+{
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
+	va_list		ap;
+
+	va_start(ap, fmt);
+	dt_set_errmsg(dtp, NULL, NULL, NULL, 0, fmt, ap);
+	va_end(ap);
+	longjmp(pcb->pcb_jmpbuf, EDT_COMPILER);
+}
+
 static int add_probe_uprobe(dtrace_hdl_t *dtp, dt_probe_t *prp)
 {
 	dtrace_difo_t   *dp;
@@ -539,6 +782,18 @@ static int populate_args(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 
 	upp->argc = psp->pps_xargc;
 
+	/* Copy argument value source string data (if any). */
+	if (psp->pps_sargv) {
+		/*
+		 * Is-enabled probes have one (internal use only) argument.
+		 * They retain the narg/xarg data from the probe they are
+		 * associated with, for consistency, but that data will not be
+		 * used.
+		 */
+		upp->sargc = (upp->flags & PP_IS_ENABLED) ? 1 : psp->pps_nargc;
+		upp->sargv = strdup(psp->pps_sargv);
+	}
+
 	/*
 	 * If we have a nonzero number of args, we always have at least one narg
 	 * and at least one xarg.  Double-check to be sure.  (These are not
@@ -700,9 +955,6 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 			assert(strcmp(upp->func, psp->pps_fun) == 0);
 	}
 
-	if (populate_args(dtp, psp, upp) < 0)
-		goto fail;
-
 	switch (psp->pps_type) {
 	case DTPPT_RETURN:
 		upp->flags |= PP_IS_RETURN;
@@ -719,6 +971,9 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 		 */
 	}
 
+	if (populate_args(dtp, psp, upp) < 0)
+		goto fail;
+
 	return uprp;
 
 fail:
@@ -889,6 +1144,289 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
 	enable(dtp, prp, 1);
 }
 
+/*
+ * Generate code that populates the probe arguments.
+ */
+static void copy_args(dt_pcb_t *pcb, const dt_uprobe_t *upp)
+{
+	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	dt_provider_t	*pvp = dt_provider_lookup(dtp, dt_usdt.name);
+	asm_reg_t	*areg;
+	int		i;
+	char		*p = upp->sargv;
+
+	assert(pvp != NULL);
+
+	for (i = 0; i < upp->sargc; i++) {
+		int	ssize, disp, len;
+		char	*reg = NULL;
+		int64_t	val = 0;
+
+		/*
+		 * Get sign/size.  Missing sign/size is an error.
+		 * Also, float is not supported.
+		 */
+		ssize = 0;
+		len = -1;
+		if (sscanf(p, " %d @ %n", &ssize, &len) <= 0 || len == -1)
+			usdt_error(pcb, "Missing sign/size in arg%d spec", i);
+
+		p += len;
+
+		/* Look for dereference (with optional displacement). */
+		disp = 0;
+		len = -1;
+#ifdef __aarch64__
+		if (sscanf(p, "[ %m[^],] %n", &reg, &len) > 0 && len > 0) {
+			char	*ireg = NULL;
+
+			p += len;
+
+			if (*p != ']') {
+				/* Expect a displacement or index register. */
+				if (sscanf(p, ", %n", &len) < 0)
+					usdt_error(pcb, "Expected , in arg%d spec", i);
+
+				p += len;
+
+				if (sscanf(p, "%d ] %n", &disp, &len) != 1 &&
+				    sscanf(p, "%m[^],] , %d ] %n", &ireg, &disp,
+					   &len) != 2 &&
+				    sscanf(p, "%m[^]] ] %n", &ireg, &len) != 1)
+					usdt_error(pcb, "Missing displacement and/or index register in arg%d spec", i);
+			} else
+				sscanf(p, "] %n", &len);
+
+			p += len;
+
+			/*
+			 * If there is an index register, put its value in %r1
+			 * (after applying the scale if specified).
+			 */
+			if (ireg != NULL) {
+				areg = get_asm_reg(pvp, ireg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown index register %s in arg%d spec", ireg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, areg->off));
+			}
+
+			/* If there is a base register, get its value. */
+			if (reg != NULL) {
+				int	neg = 0;
+				int	shift;
+
+				if (ssize < 0) {
+					neg = 1;
+					ssize = -ssize;
+				}
+
+				shift = 64 - ssize * 8;
+
+				areg = get_asm_reg(pvp, reg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown base register %s in arg%d spec", reg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, areg->off));
+
+				if (ireg != NULL)
+					emit(dlp, BPF_ALU64_REG(BPF_ADD, BPF_REG_0, BPF_REG_1));
+
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, disp));
+
+				/* Load value from the pointer. */
+				emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_7));
+				emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DMST_ARG(i)));
+				emit(dlp, BPF_MOV_IMM(BPF_REG_2, ssize));
+				emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
+				emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_user]));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(i)));
+				if (shift) {
+					emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+					emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+				}
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else {
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, disp));
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_1));
+			}
+
+			free(reg);
+			free(ireg);
+		} else if (sscanf(p, "%ld %n", &val, &len) > 0) {
+			/* Handle constant value. */
+			p += len;
+
+			if (val > (1ULL << 32) - 1ULL) {
+				dt_cg_setx(dlp, BPF_REG_0, val);
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else
+				emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), val));
+		} else if (sscanf(p, "%m[a-z0-9] %n", &reg, &len) > 0) {
+			/* Handle simple register. */
+			int	neg = 0;
+			int	shift;
+			uint_t	sz;
+
+			if (ssize < 0) {
+				neg = 1;
+				ssize = -ssize;
+			}
+
+			shift = 64 - ssize * 8;
+			sz = bpf_ldst_size(ssize, 1);
+
+			areg = get_asm_reg(pvp, reg);
+			if (areg == NULL)
+				usdt_error(pcb, "Unknown register %s in arg%d spec", reg, i);
+
+			emit(dlp, BPF_LOAD(sz, BPF_REG_0, BPF_REG_8, areg->off));
+			if (shift) {
+				emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+				emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+			}
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+
+			free(reg);
+			p += len;
+		} else
+			usdt_error(pcb, "Unknown format in arg%d spec", i);
+#else
+		if ((sscanf(p, "%d ( %n", &disp, &len) == 1 ||
+		     sscanf(p, "( %n", &len) == 0) && len >= 0) {
+			char	*ireg = NULL;
+			int	scale = -1;
+
+			p += len;
+
+			if (*p != ',') {
+				/* Expect a base register. */
+				if (sscanf(p, "%%%m[^,)] %n", &reg, &len) <= 0)
+					usdt_error(pcb, "Missing base register in arg%d spec", i);
+
+				p += len;
+			}
+
+			if (*p != ')') {
+				/* Expect an index register. */
+				if (sscanf(p, ", %%%m[^,)] %n", &ireg, &len) <= 0)
+					usdt_error(pcb, "Missing index register in arg%d spec", i);
+
+				p += len;
+
+				/* Expect scale or closing parenthesis. */
+				len = 0;
+				if (sscanf(p, ", %d ) %n", &scale, &len) <= 0 &&
+				    sscanf(p, ") %n", &len) < 0)
+					usdt_error(pcb, "Missing scale or ) in arg%d spec", i);
+			} else
+				sscanf(p, ") %n", &len);
+
+			p += len;
+
+			/*
+			 * If there is an index register, put its value in %r1
+			 * (after applying the scale if specified).
+			 */
+			if (ireg != NULL) {
+				areg = get_asm_reg(pvp, ireg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown index register %s in arg%d spec", ireg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, areg->off));
+				if (scale > 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_MUL, BPF_REG_1, scale));
+			}
+
+			/* If there is a base register, get its value. */
+			if (reg != NULL) {
+				int	neg = 0;
+				int	shift;
+
+				if (ssize < 0) {
+					neg = 1;
+					ssize = -ssize;
+				}
+
+				shift = 64 - ssize * 8;
+
+				areg = get_asm_reg(pvp, reg);
+				if (areg == NULL)
+					usdt_error(pcb, "Unknown base register %s in arg%d spec", reg, i);
+
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_8, areg->off));
+
+				if (ireg != NULL)
+					emit(dlp, BPF_ALU64_REG(BPF_ADD, BPF_REG_0, BPF_REG_1));
+
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, disp));
+
+				/* Load value from the pointer. */
+				emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_7));
+				emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DMST_ARG(i)));
+				emit(dlp, BPF_MOV_IMM(BPF_REG_2, ssize));
+				emit(dlp, BPF_MOV_REG(BPF_REG_3, BPF_REG_0));
+				emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_probe_read_user]));
+				emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(i)));
+				if (shift) {
+					emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+					emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+				}
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else {
+				if (disp != 0)
+					emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, disp));
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_1));
+			}
+
+			free(reg);
+			free(ireg);
+		} else if (sscanf(p, "%%%ms %n", &reg, &len) > 0) {
+			/* Handle simple register. */
+			int	neg = 0;
+			int	shift;
+			uint_t	sz;
+
+			if (ssize < 0) {
+				neg = 1;
+				ssize = -ssize;
+			}
+
+			shift = 64 - ssize * 8;
+			sz = bpf_ldst_size(ssize, 1);
+
+			areg = get_asm_reg(pvp, reg);
+			if (areg == NULL)
+				usdt_error(pcb, "Unknown register %s in arg%d spec", reg, i);
+
+			emit(dlp, BPF_LOAD(sz, BPF_REG_0, BPF_REG_8, areg->off));
+			if (shift) {
+				emit(dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_0, shift));
+				emit(dlp, BPF_ALU64_IMM(neg ? BPF_ARSH : BPF_RSH, BPF_REG_0, shift));
+			}
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+
+			free(reg);
+			p += len;
+		} else if (sscanf(p, "$%ld %n", &val, &len) > 0) {
+			/* Handle constant value. */
+			p += len;
+
+			if (val > (1ULL << 32) - 1ULL) {
+				dt_cg_setx(dlp, BPF_REG_0, val);
+				emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+			} else
+				emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(i), val));
+		} else
+			usdt_error(pcb, "Unknown format in arg%d spec", i);
+#endif
+	}
+}
+
 /*
  * Generate a BPF trampoline for a pid or USDT probe.
  *
@@ -981,17 +1519,10 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	if (upp->flags & PP_IS_RETURN)
 		goto out;
 
-	dt_cg_tramp_copy_args_from_regs(pcb, 0);
-
-	/*
-	 * Apply arg mappings, if needed.
-	 */
-	if (upp->flags & PP_IS_MAPPED) {
-
-		/* dt_cg_tramp_map_args() works from the saved args. */
-		dt_cg_tramp_save_args(pcb);
-		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
-	}
+	if (upp->sargc)
+		copy_args(pcb, upp);
+	else
+		dt_cg_tramp_copy_args_from_regs(pcb, 0);
 
 	/*
 	 * Retrieve the PID of the process that caused the probe to fire.
@@ -1022,7 +1553,7 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		 * The trampoline writes 1 into the location pointed to by the passed-in arg.
 		 */
 		emit(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_FP, DT_TRAMP_SP_SLOT(0), 1));
-		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_8, PT_REGS_ARG0));
+		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_7, DMST_ARG(0)));
 		emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
 		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_3, sizeof(uint32_t)));
@@ -1042,6 +1573,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
 	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(usdt_prids_map_val_t, mask)));
 
+	/*
+	 * Apply arg mappings, if needed.
+	 */
+	if (upp->flags & PP_IS_MAPPED) {
+		/* dt_cg_tramp_map_args() works from the saved args. */
+		dt_cg_tramp_save_args(pcb);
+		dt_cg_tramp_map_args(pcb, upp->args, upp->argc);
+	}
+
 	/*
 	 * Hold the bit mask in %r6 between clause calls.
 	 */
-- 
2.45.2

