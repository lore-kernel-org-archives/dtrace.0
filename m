Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7342E45003
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721328544; cv=fail; b=lBXjeNCHXwAJgyzBf5En9Du7MPQnEi9xXdDPg/ulXn4InfJ3x2oH6UrKo8wiRjRqKP8UukdAYU1R2O2qpqWFEj74gPt/pBEjPXQFF1omMWjSESSaOYuurHMALGZcMBQdn1egvysGZCpR+TDxAoK2qpJt7n7PNDmhV22x8sd4lMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721328544; c=relaxed/simple;
	bh=QiKcFjmcpLhYXDTrNAqfj4ZpcX5MpptpFWE4WyHg4Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gBqoq/1drb777a117+/FaHkewsQDqvAc6iW0arp2RtrO5yRJq1SKavVyk3Lo8lRuC6wjfsa7BPh9Q1FNkfsi2ztMZSs2PpPIzZXiKYgyZ8PGLohzXgxeY7qsSuFOZ8FRD0HbInoRV4HhqPceAYLatZPEHQ7aCxt72Qwio6iULvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BScUmCja; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZZssVT6j; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BScUmCja";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZZssVT6j"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IIeUH0022375
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=HeD7Y+R8aiQI+55
	N54K0un6Y+tm0LOySJ9x+H7iYQsM=; b=BScUmCjaj3y/KEhhF7ZjQ3SJ0TIQS3C
	+NBQiUFk/uBkzKubM7ndDoCzura/AO3lR3SRaCk1yRqnzZMXamG/Y21bW1t3P5j9
	Rr3VI+UFuy+Z7ciAFhpxPcXt3jKVa8tSIIX/qPylMs3CRhK0/fijHws/QdXFJook
	DSZhSiTSCQjGRAp7SRJXVQ69clBqbif8ENl/h/RU74tkl1rDEHAT+lV/m6Nzk46t
	WQrDlhqkt56MqQb3iTKgOxGdzje0cvmPuSnHpHtyiM2HDITQ05VBRkx/5uCRyAPW
	/WjV3cEprXlfrWiEYDVnNHd/BeC3N3OYlYq4NuKJUfpq3xbwRkCDH1g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40f8hgr0sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46IHTrOM003749
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf0tn5q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 18 Jul 2024 18:49:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZgFddpUj/sQm0UmAe5IPfWSvW9MMzuT7K9W1/GVGSwvJbHtNlosyySg3zIH0tq9LU+XcjSk+pHjvMm4Fq1cqb/ql+x3jpaXAdOLAYxzW52rVAUfQ2Ku+c8B6EZAm1GrZNnTtHIQXSgBTMz1ldz0yACwNWyYKKztt2pTJxPogdLy+xgTlnz2fjmwNh4COrgeBR3lFIhK8RZOHOm1ta1tMPdtp4nQjodCQ+kcaylG3rQ4nz1EXh/V5dzT4+zkBbgPo2oo9sfjhT5JBVPpizceUhMgw96ioCoG/PouChNxoCyAUxEy+Jf+yvonB/qFHiutuR6ijUhWkUukEgUx/o3xUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeD7Y+R8aiQI+55N54K0un6Y+tm0LOySJ9x+H7iYQsM=;
 b=XQIxcd1A8UNZiLrWymgm/SnWnoqa8qjC9RhT4B4k3o+ENzZuYA9qx5brVNtww088ZM4wai+RL2nHXXAWJ9gYSx9abQXZ/Xq7bSe0bgbKfejk/1xO1AyqFk9fZrshiB/79cnYpC8Jso97E2JUGUX3PoKl0KPWmJecC9s/pZOpRAizCDMdP1STG9atmHvKj1VVDB1u40SzMY1f+RlEfqOjLzgw67TMeaKDOcwYyaiBmF2Dx+1VeUn6YYLR8ZqB81LhJ5yyLX32bdc2Ji7ynnPmTx38h26HUsx9wNsnooSf07Xx/2uEXEg0Ox5hs/G6txSK9Zz8V3PrWQas044S1zx3og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeD7Y+R8aiQI+55N54K0un6Y+tm0LOySJ9x+H7iYQsM=;
 b=ZZssVT6jHPjEcksK3Y0D9OlUCBiGgq0GXMon6zaPVf3QFrJIVnNgD9zV7l0f8Tr+K+CZp6PRjsDw9cKucv4BMHIwOskvpEq0Z/g+vOIR9SvFok8ynO5BsCFZ/Theid29DtCLKGkSR3PuFL02iVbKxPB0RIvE3zcPAIrwt3FCIG0=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CO1PR10MB4515.namprd10.prod.outlook.com (2603:10b6:303:9b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 18:48:57 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 18:48:56 +0000
Date: Thu, 18 Jul 2024 14:48:53 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 07/38] Clean up prp/pprp/uprp variable names
Message-ID: <ZpljlXz/cG60B2WK@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
 <20240627053455.21567-8-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627053455.21567-8-eugene.loh@oracle.com>
X-ClientProxiedBy: BN9PR03CA0854.namprd03.prod.outlook.com
 (2603:10b6:408:13d::19) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CO1PR10MB4515:EE_
X-MS-Office365-Filtering-Correlation-Id: ca4b7e7f-8dac-4c53-9a98-08dca75a476f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RIYAX9ois5IFBQwP5t7pOI8dttPcRGXRLoMLaTj9OhWgiC/Pf1cQ+gWTKxbY?=
 =?us-ascii?Q?gJIbMRM7farLNL+V0U51AGe/aXd8eRmzt+Xcow82N+a86E6391oG2KNWCOmz?=
 =?us-ascii?Q?NnMo4OOfplDqLhJ8CsdmC9MNAp1fS6DCWm4yXqlhlR7S0zK+IdsAfPWvt8h3?=
 =?us-ascii?Q?eBusByYuaPecXJfcxevgw0j89QEL/crBDoEMcZyMv79dbdaC/k2rszGNPiE0?=
 =?us-ascii?Q?3M1cYW76qA8rKXjQj57305j/5QgyKdZTzoQAXtnuE+9zi5vMVR0AETPTzMDI?=
 =?us-ascii?Q?9BxFn9cZSvhKqQbIyrHrD8dQKXtdFfIRUi3Ox853lIihFKog2cAbQB4QhVar?=
 =?us-ascii?Q?cRSfNzIhfH1eHI9CVjwyujY1coViVrwq9Vgd9gzVs1r/anXNLGr4jAyMmlF0?=
 =?us-ascii?Q?67/zqAFZmSd1uNnJ7ouLABUnyAFKc6x97fgGHrh7EExmgKJbq7hZmiTS0EmC?=
 =?us-ascii?Q?Bu6gv4RnlcRdoQHEaurBSkaVe/oChEq65cAvvxLo2oh4J7PgplF4N4UfA461?=
 =?us-ascii?Q?8oAjbX/ZY7Fmg/1YuyiKt96F4zzoL43QDgSbGubO8Qq9WoC3LVh6oec4bx33?=
 =?us-ascii?Q?5mlPKKBZHqNHb2Ns3kMfCZLp1Wy+YE3lMHFru9dfSqtzfyeflv69nJ37Cos/?=
 =?us-ascii?Q?sBy2AF4NR17RyBxucTkrqP+UFLqQycOoooYrGhtxGPzEDYqG8cSkvORXl4Q4?=
 =?us-ascii?Q?FzuaWuTn0vHUpMkj1jTFL9DnAzs62eI2hMIDDYK5jokRyasn1KFzqmjZRi+r?=
 =?us-ascii?Q?JQrGSL47LR2DXFY4pI/6wJPZvsahNwZ7G5jgCrJME3Ibq2rDDNIeKluKpsko?=
 =?us-ascii?Q?cohTE3/DBN1PMquART1qVBgWw6UTibB1R9CC5LilYkyu5CauewLQV4KoReF0?=
 =?us-ascii?Q?5MqdTL9+nPzoRgpvhVkyVveHOvXKFd/VhjuzReGvsgucYVWeZToiBXIdDabp?=
 =?us-ascii?Q?jBib0V6eAB8xcWgtQCyG2jR3Gea+1q6azti0XfTqP/CVfIYbKbH2/+dQAnHr?=
 =?us-ascii?Q?Lm/fRCoJ1sd/A4YizOQLPoALyYK2y2El3w/jXZzKmeK5MtzymwOiRynrpwe/?=
 =?us-ascii?Q?yZEXbZYENj/qUdmkD01iMuAitCbW5pntfWYGjFIZXJ387kOngyVE7TA9AZXC?=
 =?us-ascii?Q?vB/2gaT3loXtGhAo7mqSYnEVQm89cMfWqMjfnLwbQZTAtzi24q3TS2/9a+2q?=
 =?us-ascii?Q?5LLY28k3PhkABZpIokfBOl1KLaLMkQXhhbU14yVE0Ju7xodomXOoYOyMg5xS?=
 =?us-ascii?Q?ThNPgcaqJIt4KAWi2M6BDbGyanIdrNyY3/Oxkb4M9Osql9HGErTB6WmlUYkj?=
 =?us-ascii?Q?jxrTj1eVKNV2D7Lk5tBGCCDkrT153oCCoinStLfQj/KUrA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sWEj99UirgXJqtJbGxEGUakxE8ABIG05a/YjrXotF5lsOR2pWqI5dhKuSNl3?=
 =?us-ascii?Q?gkyLfk3wx7V0Ne8c8jq+E5P0kYzOv4d/4YLY0yNI790qCMPjqjDD6kotMs2x?=
 =?us-ascii?Q?Zr9MM+RdMH7bDf7yaZEVNU47Xbrg1D3rcP6+ovH2UQKekmFFknoIy9xBBLim?=
 =?us-ascii?Q?B3Hhl0NPZoCioFmR+30HczlqhYszQ0kMNx+RFsaMQ9BjVhwTs86pdqEsZbYL?=
 =?us-ascii?Q?Oco2RkAsUMfu2WvS77Jquk0YzgqVPLq0NCMgRSS5GVSAPhw8o3Y2/Z3lCNpW?=
 =?us-ascii?Q?D5lWRxdmvSy0nT6pwvmSAM3/Zh86+LHIoGveuPdUX++u91DqhhzBgFqOoQyQ?=
 =?us-ascii?Q?K7bl/tpoK4C04P8I1rte5qwKuuQ+C/x0AV3mySNeCaQt84ad6fDcGwsHLJ6t?=
 =?us-ascii?Q?xaMDoffgt8aKhud1CT1FE4w4RqmHYTSQDWh1X90td1b8LKQKzM+K8bTg82Tb?=
 =?us-ascii?Q?vrsOXIKXuoTBtE5YfTAXVZ0JBtsXJqNPadBe7Phrwq11F3jRWJs3QRJIgTx/?=
 =?us-ascii?Q?kvLyMAp2mrS6hGYN/gqBsmrifhvsjGPjkKUUFqGLCB20xkgyWhFnZoLR2pw5?=
 =?us-ascii?Q?MOXB/In469MWkHCX1AaYfVrpycQR3+k/aifeFE4RM3Ky+O+rQpfumfWuVww1?=
 =?us-ascii?Q?j49aGvQXx8hTA2a0bltvxz4joG0VEtadGVmRzGTqVDuyPh9N7xvnyBjRhkt5?=
 =?us-ascii?Q?U/kciI5wPT99qQI2sNSDI6EHcALPUnnNVohBmb2Qa5y8YP0Id9PB+J4KzvRt?=
 =?us-ascii?Q?1VcZK04VKNsO+1rOQKjuOYhrD3ocWgaFXk7ZHP/c3mz7rIpNjZNSoTQdCtH3?=
 =?us-ascii?Q?EnQ76b9VCPlhBuvufbpDh+TcWSqrijlPcC6bksDr5bxK7+FJBuRofW16Zklr?=
 =?us-ascii?Q?duAFivFzBOqrY4Y4ED06Kw4OzlaLcvWpBEPLONEVLTzh9c2MPRAhE7owNuGo?=
 =?us-ascii?Q?1VTWvpYV9hWa/0f7rnIbK+AKtLr/283VLVgBIvPUCoTUS6BgBrScYw0vA5m7?=
 =?us-ascii?Q?ByHNYwm7veR3OGGUjkkNWq9lGLgLP9F3/JNjvvMfqJRN5fuihl5YNa4UFGGI?=
 =?us-ascii?Q?5PVy/KfWSsC/C3p53l9/awPKSW2Cwn4fhLbd32ahTu5sBWvPKit693Eam+RR?=
 =?us-ascii?Q?GX1WQWQDR5A6qVykK6kyDa6F86uJlIXqnta14O09Jq3FkXQDiVHnhZjLiv3i?=
 =?us-ascii?Q?KBhU8ut+01eJQZ1Iy2ge0I81FBMMVL5MTMzEt/oWs576VIuG3aUPHWyPG25f?=
 =?us-ascii?Q?7vIsqBW8fUJzfDTKl2l25iK6YSQ1V/LCRPNLDzGmjjVRsCAajnkuq5iZ061t?=
 =?us-ascii?Q?X9DgLMs9SAeD41a/pKey0+saDd8+3Q02t7wnHZU3PMp0KMBoxq1sOpkkurTy?=
 =?us-ascii?Q?4DndVIwg6OpSZlmmF8lDs+xtjV4nwggQ6MfLalSaUA+U2FO1XVAF/d4WEhzD?=
 =?us-ascii?Q?pkUSHxoT+vYmTJTz35MOSg1pzC024xSuDkGVO2x3xqJywW2HH8KYAuDWia+x?=
 =?us-ascii?Q?qoiX5q9GR0CGQh/kgmCuGoI6b0kAnSrc3TFCY8eNBixBMslql6mmwBKD873I?=
 =?us-ascii?Q?5AIb52H5qLoZo5WYC/zywTWJN9nuJIEhCvDBUSXdeoHlwhxHJ3uDP3e/MMeV?=
 =?us-ascii?Q?hw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	M/Ae+OrRiXljAoPWl/sSQ9tk0edS/2XD3a/vyVOjAyeYGJTyrjN6ncLwxHJNtRMCujicuGfiRNdb3jVLl8Ac3St83jLONexxgW3faIl7OuTuCnyMe4z6bW5YJxmYcAzT1RTAHzPpPSYr9x1eaFmL9BXEXh6Yz56uBMvojNggMeMJsAlOgY3u9QcJ80eQaTRTJn0AwN13QzM24ZRtAdhfozVB5HzWrKjNJkBj8XjqXQC320nXHKAsS41oOt+ehVyeNuygSWGXkI13XjmAQcm8QSzh+Mkuw0rd1XFc35lqiXElH9a3IEq6Rw+THIBRpe7bdRsaN7jK1bLz+Icns8cF9MU4d4YDLrhTXVL37XklvroLJ4yxZ4RIL6tY/G/lu4GtuKQ76ux/GFWZNioKAJ5YyQ/KFOy9VyhjEBBHLAOLqZr3bUqcvDoOfr/uMt6OguXhaN214y/VSlQvLsjw3Y+riK6wGTUrcq/tFtR9/OuQxwq751c6G4Npqq5ezk8eYi7IO1tn421ndiGuCQp9Xl66amp2DJp+Zry4QmjFofsIdjdGYqWK10JxkOiIcEe0UxTwjb5X74OGqougoOAgpFVslMdy6QpRp4zJ4QJwXpxu+A0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4b7e7f-8dac-4c53-9a98-08dca75a476f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 18:48:56.8387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1HRzpA4RLL6xbu2iYfhnCoaCrYHXnnrCa1bzz6fz8YpQbpuylQXRuFRLsKbP2ZvugrytDte7lGfL3cqSD2z6PfM0oAcTZCBwaEMIwA0i0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4515
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_12,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=965 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407180124
X-Proofpoint-ORIG-GUID: zoBpapIUncsRF0V6EU0Lh8-S23Kd-1jI
X-Proofpoint-GUID: zoBpapIUncsRF0V6EU0Lh8-S23Kd-1jI

On Thu, Jun 27, 2024 at 01:34:24AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 83 +++++++++++++++++++++++++-------------
>  1 file changed, 55 insertions(+), 28 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index afc1f628..c77063a8 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -6,6 +6,31 @@
>   *
>   * The uprobe-based provider for DTrace (implementing pid and USDT providers).
>   */
> +/*
> + * This file uses both overlying probes (specified by the user) as well as
> + * underlying probes (the uprobes recognized by the kernel).  To minimize
> + * confusion, this file should use consistent variable names:
> + *
> + *     dt_probe_t	*prp;   //  overlying probe
> + *     dt_probe_t	*uprp;  // underlying probe
> + *
> + *             Either one might be returned by dt_probe_lookup() or
> + *             dt_probe_insert() or added to dt_enablings[] or dt_probes[].
> + *             Further, uprp might be returned by create_underlying().
> + *
> + *     dt_uprobe_t	*upp;   // uprobe associated with an underlying probe
> + *
> + *     list_probe_t	*pop;   //  overlying probe list
> + *     list_probe_t	*pup;   // underlying probe list
> + *
> + * The provider-specific prv_data has these meanings:
> + *
> + *     prp->prv_data            // dt_list_t of associated underlying probes
> + *
> + *     uprp->prv_data           // upp (the associated uprobe)
> + *
> + * Finally, note that upp->probes is a dt_list_t of overlying probes.
> + */

As mentioned in my earlier review, I truly believe that this comment block is
not necessary because the code changes includes in the patch accomplish what
is described here and I think that sets up enough of a precedent/example that
future changes in code should stick to that naming pattern.  No need for an
explicit comment block to highlight that.

>  #include <sys/types.h>
>  #include <assert.h>
>  #include <errno.h>
> @@ -118,7 +143,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	char			mod[DTRACE_MODNAMELEN];
>  	char			prb[DTRACE_NAMELEN];
>  	dtrace_probedesc_t	pd;
> -	dt_probe_t		*prp;
> +	dt_probe_t		*uprp;
>  	dt_uprobe_t		*upp;
>  	int			is_enabled = 0;
>  
> @@ -160,8 +185,8 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	pd.fun = psp->pps_fun;
>  	pd.prb = prb;
>  
> -	prp = dt_probe_lookup(dtp, &pd);
> -	if (prp == NULL) {
> +	uprp = dt_probe_lookup(dtp, &pd);
> +	if (uprp == NULL) {
>  		dt_provider_t	*pvp;
>  
>  		/* Get the provider for underlying probes. */
> @@ -182,12 +207,12 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  		if (upp->tp == NULL)
>  			goto fail;
>  
> -		prp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
> +		uprp = dt_probe_insert(dtp, pvp, pd.prv, pd.mod, pd.fun, pd.prb,
>  				      upp);
> -		if (prp == NULL)
> +		if (uprp == NULL)
>  			goto fail;
>  	} else
> -		upp = prp->prv_data;
> +		upp = uprp->prv_data;
>  
>  	switch (psp->pps_type) {
>  	case DTPPT_RETURN:
> @@ -202,7 +227,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
>  	     */
>  	}
>  
> -	return prp;
> +	return uprp;
>  
>  fail:
>  	probe_destroy(dtp, upp);
> @@ -259,7 +284,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	}
>  
>  	/*
> -	 * Underlying and overlying probe list entries.
> +	 * Overlying and underlying probe list entries.
>  	 */
>  	pop = dt_zalloc(dtp, sizeof(list_probe_t));
>  	if (pop == NULL)
> @@ -271,7 +296,10 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  		return -1;
>  	}
>  
> -	/* Add the pid probe, if we need to. */
> +	/*
> +	 * Add the underlying probe to the list of probes for the overlying probe,
> +	 * adding the overlying probe if we need to.
> +	 */
>  
>  	pup->probe = uprp;
>  	if (prp == NULL)
> @@ -286,11 +314,10 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  		return -1;
>  	}
>  
> -	pop->probe = prp;
> -
>  	/*
> -	 * Add the pid probe to the list of probes for the underlying probe.
> +	 * Add the overlying probe to the list of probes for the underlying probe.
>  	 */
> +	pop->probe = prp;
>  	dt_list_append(&upp->probes, pop);
>  
>  	return 0;
> @@ -394,8 +421,8 @@ static void enable_usdt(dtrace_hdl_t *dtp, dt_probe_t *prp)
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	const dt_probe_t	*prp = pcb->pcb_probe;
> -	const dt_uprobe_t	*upp = prp->prv_data;
> +	const dt_probe_t	*uprp = pcb->pcb_probe;
> +	const dt_uprobe_t	*upp = uprp->prv_data;
>  	const list_probe_t	*pop;
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
>  
> @@ -441,15 +468,15 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 */
>  	for (pop = dt_list_next(&upp->probes); pop != NULL;
>  	     pop = dt_list_next(pop)) {
> -		const dt_probe_t	*pprp = pop->probe;
> +		const dt_probe_t	*prp = pop->probe;
>  		uint_t			lbl_next = dt_irlist_label(dlp);
>  		pid_t			pid;
>  		dt_ident_t		*idp;
>  
> -		pid = dt_pid_get_pid(pprp->desc, pcb->pcb_hdl, pcb, NULL);
> +		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
>  		assert(pid != -1);
>  
> -		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, pprp);
> +		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
>  		assert(idp != NULL);
>  
>  		/*
> @@ -457,8 +484,8 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  		 * process, and emit a sequence of clauses for it when it does.
>  		 */
>  		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
> -		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, pprp->desc->id), idp);
> -		dt_cg_tramp_call_clauses(pcb, pprp, DT_ACTIVITY_ACTIVE);
> +		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
> +		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
>  		emit(dlp,  BPF_JUMP(lbl_exit));
>  		emitl(dlp, lbl_next,
>  			   BPF_NOP());
> @@ -508,8 +535,8 @@ copyout_val(dt_pcb_t *pcb, uint_t lbl, uint32_t val, int arg)
>  static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
>  {
>  	dt_irlist_t		*dlp = &pcb->pcb_ir;
> -	const dt_probe_t	*prp = pcb->pcb_probe;
> -	const dt_uprobe_t	*upp = prp->prv_data;
> +	const dt_probe_t	*uprp = pcb->pcb_probe;
> +	const dt_uprobe_t	*upp = uprp->prv_data;
>  	const list_probe_t	*pop;
>  	uint_t			lbl_assign = dt_irlist_label(dlp);
>  	uint_t			lbl_exit = pcb->pcb_exitlbl;
> @@ -561,14 +588,14 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
>  	 */
>  	for (pop = dt_list_next(&upp->probes); pop != NULL;
>  	     pop = dt_list_next(pop)) {
> -		const dt_probe_t	*pprp = pop->probe;
> +		const dt_probe_t	*prp = pop->probe;
>  		pid_t			pid;
>  		dt_ident_t		*idp;
>  
> -		pid = dt_pid_get_pid(pprp->desc, pcb->pcb_hdl, pcb, NULL);
> +		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
>  		assert(pid != -1);
>  
> -		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, pprp);
> +		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
>  		assert(idp != NULL);
>  
>  		/*
> @@ -636,9 +663,9 @@ out:
>  	return name;
>  }
>  
> -static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
> +static int attach(dtrace_hdl_t *dtp, const dt_probe_t *uprp, int bpf_fd)
>  {
> -	dt_uprobe_t	*upp = prp->prv_data;
> +	dt_uprobe_t	*upp = uprp->prv_data;
>  	tp_probe_t	*tpp = upp->tp;
>  	FILE		*f;
>  	char		*fn;
> @@ -733,9 +760,9 @@ out:
>   * probes that didn't get created.  If the removal fails for some reason we are
>   * out of luck - fortunately it is not harmful to the system as a whole.
>   */
> -static void detach(dtrace_hdl_t *dtp, const dt_probe_t *prp)
> +static void detach(dtrace_hdl_t *dtp, const dt_probe_t *uprp)
>  {
> -	dt_uprobe_t	*upp = prp->prv_data;
> +	dt_uprobe_t	*upp = uprp->prv_data;
>  	tp_probe_t	*tpp = upp->tp;
>  
>  	if (!dt_tp_has_info(tpp))
> -- 
> 2.18.4
> 
