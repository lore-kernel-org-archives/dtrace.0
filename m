Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A08D63D0
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719540230; cv=fail; b=f5t8uOYnMLQkudQvaK2u/DkbobssUkmoxdJ73h2Aq11J+6PbMI1ar7adXhhf/bVh7wGQmRP+UdGJXYqk9qt05iuGDNkxfcRHITHqutGdDn0v6wSKYgI8R6gNBrCTQ0UBMpaPUkrBb13u6DPBgfx1836cUGR0c0/KncbdYqdjZ6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719540230; c=relaxed/simple;
	bh=24RwjSXIAOOITvNDLWX79mxsG5NoMUKtEiGq2xiTuhM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BTdaOb0CQbcEl5Wi098BDYS8gK6QsrxcVwpw/Czrqe4V4rfHBIRPzuF0urA0aPKJwOdGeld8/sk4K+lDuh8jr62xrokVm+f9qaZqw5LgJzlCHov4gGQ6l610decmG6ARXDQ4vv5ITDsYF80yYZNFlQqynh73gP8yJOagOo1Hioc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QWybNAfU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MsvT+Jqh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QWybNAfU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MsvT+Jqh"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RKBYeC020056
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=oQOf1O5DoHOh6E
	OEeTzA5V2LzZNdijLnAJyDj1XM820=; b=QWybNAfUHxB8dXXb/Ns2YoDdDYi/Ea
	sVoM6x4k4OGb2bCdX6o0iX2NbGu8oy5oU2f1k4An/NedfFuG8R4f1ZxSOevNGirC
	7ju76wqYH/pSaQzVi87FIrSP1epXcSiSZUiuH0x+M9UqYcyf0dSBtd903Tmotjuy
	f1rEJ82MonqpOziXmE9n9uD2uniXFQ1pcYWIoNgfjKB3BXlrafiKHm40adWsjRh8
	II/6a7XoiJrGVQBJG9HgK/uD2nXk7u3fJ4JSXJaLpAeK7wstFvsEa/nOF2Y36Yim
	6j6ROleXbykuBiq+x9CXLp006fN4qmtorMf4GIJB0EVnj79g6HPhUsdg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn1d71kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45RNrDdT023336
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2hqvp0-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 02:03:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFhbKE+xz9dlmPr+QfVsZ9spr0vKutA5Pr51pHvv4N2YBZLJtwx13oqYCtpVDWJcohch+npNBlwk5qXqERIf2eaCPJzpalZffYx0LCJiCqGxBd2kuUymbXiwA2/3PzzzRM436vConUcSUTvZ4nmuI4T/UuI85TvBWX6PFPvbko5OSMkGPNgEuPPH8KadAGbySjZmL4069HnzWWOSjWxPr8KG0+fJsOR57eve4VR3BVgXtn6Fe665I5Gyvb66MwymvJrMYYADgmJSUMqhdtOWR4K8Ydt+Hi4lYzdQIS6TxptMQyOTKHX0Zw8npAIhKVvCGgUv2TMjssFQKWCr2vMmrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQOf1O5DoHOh6EOEeTzA5V2LzZNdijLnAJyDj1XM820=;
 b=MC6aE1f1kdI4NFrCkV1DBpA/iebwGR970Gybm2SofshpNzvtuuKNQ5UuTdU8inHFNOVJdRBeI15FSWtMNz6PftoNWH17q23EortpDVzzy0URXj8U80eXuxQRpO/knFyEvx4RL3SVLDbBYr7N08GT6RPBHBeQoCsBxD6FyETZ9bxOnqAtrV2MjpDgy5A657L7rJVshnkSyDz+NeRXkP3jq8+ZiNUe2Gtgc32FTRdvzWKpqNxh2H2hgydtKiOeXRZvEGPMU1sGTQlDrt8sheKXBzD67XwLlQat0b9Duq5It9sQI4iWEADme2mgLcYxABE3gQ0P5Fpo+OipKV+D2OfJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQOf1O5DoHOh6EOEeTzA5V2LzZNdijLnAJyDj1XM820=;
 b=MsvT+Jqh3YhuR4qC1BseIczeGx0lg8q5Yt6ngMgonViv5iwQhcvy7CtAqmLOuNO/ysJmtngCS7sQP1X0oGXgYwMOgU22ln/Htt4owQEPiO8oPanY8G5ii7E1yToCBeNKyNK10Z9BVP4/WxuU50Dt/8Uia5SEkLquMHgjv4QnHac=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH8PR10MB6671.namprd10.prod.outlook.com (2603:10b6:510:217::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Fri, 28 Jun
 2024 02:03:25 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 02:03:25 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 35/38] Use uprobes map to call clauses conditionally
Date: Thu, 27 Jun 2024 22:03:14 -0400
Message-Id: <20240628020316.32544-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240628020316.32544-1-eugene.loh@oracle.com>
References: <20240628020316.32544-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:a03:217::14) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH8PR10MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: bc35ca84-b29a-40d2-0555-08dc97167f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bVYc3elcZ2dXb7Edo/9IAvQR3ZtnUefzbmsDtmcBX6Y/VsHRuWeX4sLbgEd/?=
 =?us-ascii?Q?dVL3GshhPAK2OtAk7Y2RWcmnjat7KlRVR4AW85GIS59GjKq1bRxarGvT/WKK?=
 =?us-ascii?Q?EYQqjvTlrRgWAfl46KCJysoFVLLT8McPQD1NNGEtc2CvV1capgnH5CybpHMf?=
 =?us-ascii?Q?J/GOudS7NJTgYtBLOVNtgMqGkOuATZ4p2Cc+ii9FucVI1r4DUG1I+5p2xodr?=
 =?us-ascii?Q?o30+Aj0rWhatT9PODKl9gQnec23aVAHYF72705gR3WSAG8Kxc1/WzBYKp6GT?=
 =?us-ascii?Q?zUegwDPMpIN2NtA+VTPcGHiPCrH1GPBto1xHEeJ2lM1T1ZD48KQEY/LczDGE?=
 =?us-ascii?Q?cLmwFh1Nrrvayzs9ycKnSJeTvI73mUc0UnJiLDY5GzYOfGQ8e8wEfZNHtGJD?=
 =?us-ascii?Q?AJ8dO8QUJXwYO9Zm+Go0KsbVOUEMx7h1IX53wnIruNRc2mlIBRHUWILs7WZ1?=
 =?us-ascii?Q?dPKuv7KKr/7Lg73DEAEB31zAH2BzzaW0YaHD135QznQ1k1JNRDuPigj5YVjn?=
 =?us-ascii?Q?NOceYBVT+0yoaIkfr8lmLi8ldTbGomj2HIkcrzAerYIbP+DievBGaxRUbT3b?=
 =?us-ascii?Q?64otLTERFA2dBvR5dB+xnKF6e9X75c+ybyLqnNZIJenxQzpaBVe5Q/4hPgTU?=
 =?us-ascii?Q?NQIrRJiJjYq6mnFabAJq9aLpZ5Le796nWqgDJzpCInh3Wf2zRoG4BNcFGdUn?=
 =?us-ascii?Q?m7w9qGV4QVBS/zjXwdxM2o9DErApRgqe64RA0ZH5rrDJCl99nBTSnOySI/Oy?=
 =?us-ascii?Q?JR75gK5xMrZS3feaXu2oW3vtwjgIZgioULkLslixTWKQgpqTZRAeJaCfd5mY?=
 =?us-ascii?Q?N/mUwGerYmGJe5eeYYzU2ptskWjcn/+7/GkGYL3jDGZ6FKdBbWZaHfQHB3fF?=
 =?us-ascii?Q?6DHUAixa3svSAjOEEczB2vhch5wNKyNefvu/fFK52+vcQhJIIj+IFn9hijaH?=
 =?us-ascii?Q?VNi3SvDSL+MyzDAlfK+REuI9zX5sWPLNEudxm3A2GV9nzIK6RwG5jiOujB0C?=
 =?us-ascii?Q?BXqgqo0feNVCNmOjB9XbA/G6SECqEONm1/GJiBfE2p2EVtFzqyAqs7Jk0Bva?=
 =?us-ascii?Q?brVvKYeCMHKOxR6Cm2vhFxF5EFh2s5sgA1ja6F3DWemyDBa1NKrth3h3IHGt?=
 =?us-ascii?Q?TjZ1Vp0h4JBB28SNkwfaSvTmhT761mScxg/VZcy6IGCNoCf+OZ2R9CWNdlgQ?=
 =?us-ascii?Q?baWnPMG0kLgfLmk+KAEY1XYjyG4Sm/B7X5R82BfvZoIMfcTNMDB1n1V97TA1?=
 =?us-ascii?Q?5gCoNa1Ddjb3WClCnFwXjsSdlMMZCL05snvYYYIOPcWVqR5oFtgWxrmozKTN?=
 =?us-ascii?Q?Z3lZbHGwI1Gwk1sDhEt8gL9Ijwvx7MGgZTeH0n/iu074Jw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2OtbLqFDqPyq+xSB9EwvvqLpgIQ+ld/bdAS6xDpWjfs4Cig2Ps45eU4Pv6m7?=
 =?us-ascii?Q?gH7dcItmXrllxHYZlMd3aCfVTsush9saPfRmNpudNh6uO2Zv5YjmsckidF7b?=
 =?us-ascii?Q?nmuWk6Z/ptm6gQNgy02gvKfwowe6+d0S0A9LWsAyL+IhYtw8IyotGweKTLaA?=
 =?us-ascii?Q?7ZFb7VviRZrNaN8eJJ+B9Ci71Eskbgf09nIx//I+eSEMUdRIqnu4HZi1WSP1?=
 =?us-ascii?Q?5WwklFv+bq2weUhzDo/32bwCb6FYDDMdCyIOpcW1T1XL9v49t44qbbcQoBPJ?=
 =?us-ascii?Q?ZfDz+c9aCwMh7DZrwn08f4AJdfp6/Cg4hUjuXvsMId+1d8ZLmG89293OtALa?=
 =?us-ascii?Q?tYzvL7Tfpyn1Ex1CDbyDm+/OH7AoyBpLsY+X3rTuyNg/2m0KybaGsvfJU5CY?=
 =?us-ascii?Q?5YNB+8mwDAa1Jop4lmhQFeTDHbCd9VzVVyTnUjMGoWwLhF44rFcXkMLhjicI?=
 =?us-ascii?Q?3Tbc8mtRZiPW6cbi254rpq5FfDUcjLg84TGeRRvhg0TC7ChAW4yWhHiX2lx2?=
 =?us-ascii?Q?bCKUA8s3t/M8eR2pjrYEJUzDYiHib4asRqk38XLP7qPsp7Ov/p1LihsHuzsE?=
 =?us-ascii?Q?edoFohT4RInllBVpzLkdZ79ta8x1G537mveJJ9EgtjzsEET/SkmLLbd4oUP8?=
 =?us-ascii?Q?fEcV5K9xAHfYl4RTPlYoVVMCYOxnJTrqbjRYkUmMUo/EASF5IE42xLwAVNEi?=
 =?us-ascii?Q?zCJCcK7r5BCKUVa/+HeEw20f38m802l74cFytILoPgveYwUccuGl0dzGWPbZ?=
 =?us-ascii?Q?XfUApa/X+HVFPUckWHxygryO6uuN8wKuzZxUDvhNoq8iLytbgDQN/BQB0CJD?=
 =?us-ascii?Q?O/+gSpiU9FvJiyIXgCq47q7Lz2LfUeA5d9TK4tLBoitf44qmPQFua9TyemuQ?=
 =?us-ascii?Q?A8uPpOZYH4Gjdjd7ng34jJbJ8nSgStV5pRBujgDYFp4BJpbrzOWg80xr3k47?=
 =?us-ascii?Q?b/aUd0IvmJIZdDxAkZmeeIVqV5izcLAYyWs3Hx12NBTLUpzogKPn27iNrSSB?=
 =?us-ascii?Q?sOoOl/ZEajbOlnJItuqz+7I4kUX9PWNZ8ufcRNLpl1KJ9U7E6YoIPzemkAEZ?=
 =?us-ascii?Q?Ezlqe6Nolno23vHVa9Hf70fcf7KW2ZdbW5Btagp6rDYpY5AA4N0D711GJhzK?=
 =?us-ascii?Q?wm1t+MSw1J3KQmoPhgp/wOKy6Ei3PrC0yQruvN28FdLQ/9QqOToqZMw0YisX?=
 =?us-ascii?Q?GH9NdKMPSw4BVizOcuRs/nyB2NKxU93d6r7x3Xvi+JOCRWFtSw4ZRjfa71u0?=
 =?us-ascii?Q?5QsgSSTllzg4OOVtkjwJDcDvG+6yMqPapqlrxsEvPRGj3gObmRcHx9knIL2b?=
 =?us-ascii?Q?CuoV1BqzkSTzi4w0W6WoN5CVKp+F5pPlmh5pPdkwFEeVdQPB0Ex1EK7ApQWb?=
 =?us-ascii?Q?hu1Qk9Tif8LJ1RTZYi0xYdTn5LqjT01bPoa5euzCTOhoiFqU4m9Q72HUFQ/z?=
 =?us-ascii?Q?oOSzCHJlLTHPfOT32oOeo+NuA7gnp6sCIYG9XfV8PzLgA8AeKYkK1hRU0N67?=
 =?us-ascii?Q?2C9TScSjHzmehEpoN7eg9RqtLDttj7FN2UE3NBKajCrn+xRsOYtm6f/NYMFT?=
 =?us-ascii?Q?/qUt7hsPlpvAMy3FCsruqnu18IQ4cQukTu5ynyh+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	B3OZseXfC9y0Ia5Us2ehj5La4ige0vKuXma2XS7CFVrvPvwmU6G4XYDVx5ahu8YPUKKgFAGhTiGm1+EWYqhVes3B7iTl+hyYpsaraPgPxa8TA3KQEPHYoj6uMM0hWjXkgWMKAxToMhhankWrzmyLXErwsUHaC0ojsr1rtppF+3spCNPY9cpWdRZuIwzCzlcRLIM28+vuM0EXOcvmqpN9EYBe4DH5JiqSmQ3aiwxNj99vcDf1zGxHGysTlN7J+29C5pt+meJwR6tKn5BDFNjrnVqA8HJ7+K0J+cdVL9C0Gw+76Vq88r5svN2GVPXDACM6G76MpEkAC9DYCTt5UkgXrnsKiiWdLRWLc8vrn+Wa4YNAS5bzKQy3gIDNusLQ4BtRwLXOHtQHyB5LAGSZWXHxcky8ma2FabFMqoZOVPT1Jf36DZ8AfEoO6uN6iCHoNZh4rbGwh+EtKDJsyAkNZK09Y1h1nmFmE+H9gbOIiIWG73ag7pQsF4FvUmI1x+nOShtIeJb9ryV64TjDRsQWHwzV151B1Iv2tB6p4VpiwaEmeM4MN4w0eut1v52P1RtHX/B7axDkPDp4hAvFuTPF0M4ZEBsvsZM/03VMwewRW32TtEM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc35ca84-b29a-40d2-0555-08dc97167f1e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 02:03:25.8561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4gLhjmm9Z5Q4q3gST+B9Jy61dfOB2sMS9/SNzBVTqEuyXmLkzSYFXxLs+WW3v92+5d0Ns4/azCOLRhb678pkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6671
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_16,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406280014
X-Proofpoint-GUID: htFZtTVxsAGuFFt9yuXKFO0GOvos5_Mz
X-Proofpoint-ORIG-GUID: htFZtTVxsAGuFFt9yuXKFO0GOvos5_Mz

From: Eugene Loh <eugene.loh@oracle.com>

This version supports only up to 64 clauses for an underlying
probe, but it can be extended to more clauses.

This version also does not work when two overlying probes that
differ in more than just pid map to the same underlying probe.
For example, a pid$pid:::offset probe could map to the same
underlying probe as a usdt$pid::: probe.  In the current scheme,
only the "first" overlying probe would fire.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 151 +++++++++++++++++++------------------
 1 file changed, 77 insertions(+), 74 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e99f02c3..38974609 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -517,8 +517,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
 	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*uprobes = dt_dlib_get_map(pcb->pcb_hdl, "uprobes");
+	dt_probe_clause_t       *pcp;
+
+	assert(uprobes != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -527,7 +530,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
 	if (upp->flags & PP_IS_RETURN)
 		dt_cg_tramp_copy_rval_from_regs(pcb);
@@ -542,47 +544,66 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause:
+	 * Look up in the BPF uprobes map.  Space for the look-up key will be used
+	 * on the BPF stack:
 	 *
-	 *	if (pid == PID1) {
-	 *		dctx->mst->prid = PRID1;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == PID2) {
-	 *		dctx->mst->prid = PRID2;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == ...) {
-	 *		< ... >
-	 *	}
+	 *     offset                                       value
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *     -sizeof(uprobe_map_key_t)                    pid (in %r0)
+	 *
+	 *     -sizeof(uprobe_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		uint_t			lbl_next = dt_irlist_label(dlp);
-		pid_t			pid;
-		dt_ident_t		*idp;
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(uprobe_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, uprobes, DT_LBL_NONE, BPF_REG_1, uprobes->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(uprobe_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, lbl_exit));
 
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
+	/* Read the PRID from the table lookup and store to mst->prid. */
+	emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, 0));
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_7, DMST_PRID, BPF_REG_1));
+
+	/* Read the bit mask from the table lookup in %r6. */    // FIXME someday, extend this past 64 bits
+	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_0, offsetof(uprobe_map_val_t, mask)));
+
+	/*
+	 * Hold the bit mask in %r6 between clause calls.
+	 */
+	for (pcp = dt_list_next(&uprp->clauses); pcp; pcp = dt_list_next(pcp)) {
+		dt_ident_t	*idp = pcp->clause;
+		uint_t		lbl_next = dt_irlist_label(dlp);
 
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
+		/* If the lowest %r6 bit is 0, skip over this clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_6));
+		emit(dlp,  BPF_ALU64_IMM(BPF_AND, BPF_REG_1, 1));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_1, 0, lbl_next));
 
 		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and emit a sequence of clauses for it when it does.
+		 *      if (*dctx.act != act)   // ldw %r0, [%r9 + DCTX_ACT]
+		 *	      goto exit;      // ldw %r0, [%r0 + 0]
+		 *			      // jne %r0, act, lbl_exit
 		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
-		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
-		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
-		emit(dlp,  BPF_JUMP(lbl_exit));
+		emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_9, DCTX_ACT));
+		emit(dlp,  BPF_LOAD(BPF_W, BPF_REG_0, BPF_REG_0, 0));
+		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, DT_ACTIVITY_ACTIVE, lbl_exit));
+
+		/* dctx.mst->scratch_top = 8 */
+		emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_SCRATCH_TOP, 8));
+
+		/* Call clause. */
+		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_9));
+		emite(dlp, BPF_CALL_FUNC(idp->di_id), idp);
+
+		/* Finished this clause. */
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
+
+		/* Right-shift %r6. */
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_6, 1));
 	}
 
 	dt_cg_tramp_return(pcb);
@@ -630,10 +651,9 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 {
 	dt_irlist_t		*dlp = &pcb->pcb_ir;
 	const dt_probe_t	*uprp = pcb->pcb_probe;
-	const dt_uprobe_t	*upp = uprp->prv_data;
-	const list_probe_t	*pop;
-	uint_t			lbl_assign = dt_irlist_label(dlp);
-	uint_t			lbl_exit = pcb->pcb_exitlbl;
+	dt_ident_t		*uprobes = dt_dlib_get_map(pcb->pcb_hdl, "uprobes");
+
+	assert(uprobes != NULL);
 
 	dt_cg_tramp_prologue(pcb);
 
@@ -642,7 +662,6 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
 	dt_cg_tramp_copy_regs(pcb);
 
 	/*
@@ -660,46 +679,30 @@ static int trampoline_is_enabled(dt_pcb_t *pcb, uint_t exitlbl)
 	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
 
 	/*
-	 * Generate a composite conditional clause, as above, except that rather
-	 * than emitting call_clauses, we emit copyouts instead, using
-	 * copyout_val() above:
+	 * Look up in the BPF uprobes map.  Space for the look-up key will be used
+	 * on the BPF stack:
 	 *
-	 *	if (pid == PID1) {
-	 *		goto assign;
-	 *	} else if (pid == PID2) {
-	 *		goto assign;
-	 *	} else if (pid == ...) {
-	 *		goto assign;
-	 *	}
-	 *	goto exit;
-	 *	assign:
-	 *	    *arg0 = 1;
-	 *	goto exit;
+	 *     offset                                       value
+	 *
+	 *     -sizeof(uprobe_map_key_t)                    pid (in %r0)
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *     -sizeof(uprobe_map_key_t) + sizeof(pid_t)
+	 *     ==
+	 *     -sizeof(dtrace_id_t)                         underlying-probe prid
 	 */
-	for (pop = dt_list_next(&upp->probes); pop != NULL;
-	     pop = dt_list_next(pop)) {
-		const dt_probe_t	*prp = pop->probe;
-		pid_t			pid;
-		dt_ident_t		*idp;
-
-		pid = dt_pid_get_pid(prp->desc, pcb->pcb_hdl, pcb, NULL);
-		assert(pid != -1);
-
-		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
-		assert(idp != NULL);
+	emit(dlp,  BPF_STORE(BPF_W, BPF_REG_9, (int)(-sizeof(uprobe_map_key_t)), BPF_REG_0));
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, (int)(-sizeof(dtrace_id_t)), uprp->desc->id));
+	dt_cg_xsetx(dlp, uprobes, DT_LBL_NONE, BPF_REG_1, uprobes->di_id);
+	emit(dlp,  BPF_MOV_REG(BPF_REG_2, BPF_REG_9));
+	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, (int)(-sizeof(uprobe_map_key_t))));
+	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
+	emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
 
-		/*
-		 * Check whether this pid-provider probe serves the current
-		 * process, and copy out a 1 into arg 0 if so.
-		 */
-		emit(dlp,  BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, pid, lbl_assign));
-	}
-	emit(dlp,  BPF_JUMP(lbl_exit));
-	copyout_val(pcb, lbl_assign, 1, 0);
+	/*
+	 * If we succeeded, then we use copyout_val() above to assign:
+	 *	    *arg0 = 1;
+	 */
+	copyout_val(pcb, DT_LBL_NONE, 1, 0);
 
 	dt_cg_tramp_return(pcb);
 
-- 
2.43.5

