Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA393A1D12
	for <dtrace@lists.linux.dev>; Mon,  9 Feb 2026 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770663904; cv=fail; b=BDBASH7B8Tz7f31eu/YjpYQAEkSlhj89UKqQ3m2G/GDsDADLYFlcUK3DGkQkjBY/fHjco832HW444C1ADFUoya1z40lplVlBxZY0EQP/F5WEjZhjNNvJ9u5jZVF1hF2W2bnsEDx6P+VZYW8BLWaN9MdztC//Q/kVDxe+xqiEdUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770663904; c=relaxed/simple;
	bh=/5ODlIlVd8u8eoJh+hbmjbOezVjb4mg59smePFVIrSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kWJgXMS6w7tXtlubsc9oE4YpF6CA/FV5QpajmnC8b6Bx2smkKVO6QbX33BllqV62gX3nNjEwhHY2/lPiXBqs2ax+NRsHlEvd0yuzVRG+pC2HcF46i7GDHP4XIRwAgFhu0BKdpPBDGYVAUVlh/Uof4P3J0/EDuiNAc8c39nf2tss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ktBEKL63; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Dda8bMLs reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ktBEKL63";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Dda8bMLs"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ECnrZ1628192
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=0tPzhxPmwLJ7TJtgMHAQHNj3fzS8HaFeNjC28MCsX50=; b=
	ktBEKL634ZRXKszoSWMr8zI83Bi5czbc0LU7LXYLiPDH/QvQE68wD/TuBc2VleFR
	eCz3oUp4BhJAigc5eVE1SGU27+VkDZYaRkz+zLAr9ep/d7OkGBMPnGdBkwXVzKXs
	5VJY0+cxcb3IZmC1QXW41+TTXNjvafvSzA7yfYnf93W8KiFrTNONxBVwB2+90uUr
	JhRxxGD+hFSZ+Yh4IIcydyhvSfYBq98SWlfRpdKml28dZ53g3kr8eHjhBKOnkLsu
	d44tfJSa+nDOvVjUSI/QDiB6LphzasVMqOX5Rlmye9/qkjLe7Q6dNXwl1p11NnCD
	tCUxpr3eJ/SuBJsHUeZNHw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c5xh8tj73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:05:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 619J0MrN000419
	for <dtrace@lists.linux.dev>; Mon, 9 Feb 2026 19:05:02 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c5uuddkqn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 09 Feb 2026 19:05:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=splim2/zCiKPoeFqseSg1nh1yDeiYj7wbfD+dtRc2CQBcvEAjImGLw3xadDwmQWqezNZEiehF9wTXf2n0zdMd5X12SbyZhX13BvVLpkr5zRhcnjihE8bdFNOgNqFrzVwh37iq2+t3T6703qbhJa/efErgDh8YMYFmqGyfYVeVckBHLqBfCRpU6YiV0kjVzeRXFmxX4CtxsvXxVxxyudxIqVnxT3KBdB6S+LiTcdudhj3Kf+i+4kyXX+MvjhANCzk56sRK7wJmiud5Uux97rRoqgJueudab6gGWuPk8bvc9jHpyFcbz4xk/njjL4fyTHBTzOzLVealfASR83r57l1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r3GafXFvpFgNSvQMzATiDeZhY0fjxxhkr1y3b6w01I=;
 b=pvzAmdhI6JvVAAEcuGZJ5CbKdEbXhKHFaHa22Yr79HRiAix1dT7TveEbdjOSlI+91YG06pITFmHaRlu6jH9IxMjAcXOxwNpDbtnab13u6ovFAXOma1gSfHx91C5Njlsb3VSZv3SufHh5ufRyJl8Huw1+dl3NpmbOrM7Qoly9BF/5QPwyioWLGKrmKN1wV0M0zaYnCdLvnGpQ6fG65Ni7aGJ8x6AI9Vnm6DMr5jBvYU7uDySoGVghSm0rXslcNvakuc3DXLsairnIUCD+9INSRB5v1LaYC983y2na3NFCb9DC3wIJ7ekeszWUMbDOdnPFx1F5ygN0l5wRTvwhoCixCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r3GafXFvpFgNSvQMzATiDeZhY0fjxxhkr1y3b6w01I=;
 b=Dda8bMLseJuE1B6yGOA41nm7mstH6f6EjclKbytrVwFAHZNJocKyH74GQk8OI15eNl32gOKN1jIvGK75yWt346w4Smma51RAcMUzdmclM1y2O5Ax40q7O4KHQlOC6paFFyCBnoNc64sPuVsakyy2jpHrdBNA+FJ7744KhPExrrY=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by CO6PR10MB5619.namprd10.prod.outlook.com (2603:10b6:303:14a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:04:55 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 19:04:55 +0000
Date: Mon, 9 Feb 2026 14:04:52 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: skip when /proc/kallmodsyms is not present
Message-ID: <aYov1BfhUaIuEAg6@oracle.com>
References: <DS0PR10MB75223D0A585D1EFA33B7C033C265A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <9eec5a13-12b6-8866-a563-022bb94f40d5@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9eec5a13-12b6-8866-a563-022bb94f40d5@oracle.com>
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|CO6PR10MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: 4328b6cc-0e48-4cde-ff45-08de680e1c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?fqQpms5xmiG9MMx7TjZGjFSSyfzywyyM7yh15ZMmepKwIq68XgVbn7L34F?=
 =?iso-8859-1?Q?xw4Bou/aFvaid+MF/ZKxcinG39q5qpW1S6ipbtGKw/Q/E6x73hPcTSTyjg?=
 =?iso-8859-1?Q?hD0f0NyDSqwyvKE0IO8t6vHEg56AUXKACw/yFVc9MY5k7oUiCoAIF3MBCO?=
 =?iso-8859-1?Q?uPNuUDcnxzWcaFAXrWNHa1SBRnyVWE5wBNefmPccwzWjN5Jp3P2SHd4uaT?=
 =?iso-8859-1?Q?j0LZ7VLLXwh9a+KX8DlmIzwJPNOSTnCir0NvTJZLxAEwpKio3qEJAHXL/0?=
 =?iso-8859-1?Q?kVvkyS9DBhvYcAsb55wrpWf6PZfayUg+ia/Lf9oYvsx7ffJOfRwHzA8gD0?=
 =?iso-8859-1?Q?BzaOlVx10uThLvH/l+6aObSZkTCvqzgE+fzQjL5mnjraU8dBDsrQ06hUO3?=
 =?iso-8859-1?Q?PzhL+t0wLQWEgDFr2TMQspkccz9vTYaxAK1b7hpdiFySitd+wVYLW3g+Ev?=
 =?iso-8859-1?Q?dkA/nbBAk5MpgbvqmXbS/KCSFds+mobaIWrT23fYg23Lf3Of+RXu0PjFN5?=
 =?iso-8859-1?Q?2ZVjidm3/NyOGzWUnOhjC1pejpPt/9LsI6owS2uq5UzhdZVgPYplNJo8fq?=
 =?iso-8859-1?Q?XY1jPdvlcxFUi50BPNSxVNNt40SOYmapE2nKr1/yoDXhGkapORU41wysRF?=
 =?iso-8859-1?Q?15djeKUbeP4VjJ1MuZZ4AAbtv5HmjNByMXfsO4WXqNfW6K4cS0HcFULP6i?=
 =?iso-8859-1?Q?EBta7KNDKOSlEPDketj2yHI3BtedvV5GpMJRxUbWrcQ8kVqzEnV1/dQV96?=
 =?iso-8859-1?Q?K3NjdetPc3uO39Dxvf2DJFMhkLhhuUWAcFQtv6wMiZ3qxCrHBbxT3oRJe5?=
 =?iso-8859-1?Q?y6+h04hnZzZlZ+wHYMeX85jAiOVjn9Tk6OUaruuQksoRo7vM7auXqlGQtY?=
 =?iso-8859-1?Q?/AH6dPdrst71U1ZUqh1wih6JBwMqIPFS5fsglAFU4vKZQZ1Ez5ShC1g+zg?=
 =?iso-8859-1?Q?/m4RtBbw5nqAbiWQYb3ShL+y8t31e1LqcYN5iAPnB3c51WZJ0XpTAoxUF4?=
 =?iso-8859-1?Q?JM1YuPyTPXG0Q5iSAtnuesPauHdU/9mgtO39k+CRvBvueo7Jf485jeQgEk?=
 =?iso-8859-1?Q?//4A/hUjBhxQR1ve0zDh7awJL1rprU6tqrqxaUc577YpSKgMYDwy8PE4ph?=
 =?iso-8859-1?Q?UkCsSbephbwXWJxLMt0dtYO9UEALG66POb5VLZe4J//htx+dBlfAAdUpQa?=
 =?iso-8859-1?Q?btvSjnEMpIevbB/wkz1VS5ro2MBC6ptZi8DcX9W61Pm+xF489wO7k5DPoZ?=
 =?iso-8859-1?Q?uO1j6UQx6jdWthwr5xk+iG5O4TUWxm4W7Ch4eDD03RhQMzsIZIKsuLRdMy?=
 =?iso-8859-1?Q?pvMcTTCAWs8gjGTJtU51G/O1JxEfz/FHdheAVdhN+T1WXuyI1GD2ZX0cdy?=
 =?iso-8859-1?Q?4DvldF7bgDGqsQk2ibFdOTOgrRqldZB5NzItop9/LOLF4pRga7jYPBF5aS?=
 =?iso-8859-1?Q?9U9/jVrKY361W+kb2a5MWkECSkv8Te56n4CKlw22RMuXotcAdQDSQA0LLt?=
 =?iso-8859-1?Q?+lyEnG/Nq4hku8gwS6uDVmAfuGwyvfR1wpbDm9zL25JTy9lmHFNPqCKvid?=
 =?iso-8859-1?Q?ZcgvZURfdfgkVo3tinRoGKFJlvY7JRHV0YsRDxwFnIdVYg1Y6IJp7Xnvg9?=
 =?iso-8859-1?Q?xghSdL+wwISGs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?wAm8ysZKpKVSR6B9LpiLqZWJCC0vJx65YQr7ZYnWGVo14C4/eG6S+q817y?=
 =?iso-8859-1?Q?KcB/O88DL9VcBYsRMGuXbqYw7ZRO0Qwt6ChQfyi7ksARF0RGTiZlqgHZcA?=
 =?iso-8859-1?Q?nLrF1PgGbsvO72br87V8ZFLencJSKcy4oXu/P7Zu1lFXXeio6sLbVO0h9X?=
 =?iso-8859-1?Q?3jZ6VtTjjkhH5jJDFwN/FSxo4aYI3M/CGDiu5XzE30Thwg3dxhitEYggji?=
 =?iso-8859-1?Q?GtbaUkJatiWywb46S7uPq8NpJ1VPYkI39kfjI0fU/yLMcOEfgtv9AehJP0?=
 =?iso-8859-1?Q?b+WgAoV9Z4up1zJQAcVJbie87yfnMsgJXmQpH/+zV7cunW1bRQuZkUgKFa?=
 =?iso-8859-1?Q?NaPmhvvAuuHuwv2lQNe7D1AFPThA8NQsqQgAUpL1ZILcQfHfewcf6ptuGr?=
 =?iso-8859-1?Q?+Iqq4sjGR+ExRW4xVMcXcAdp5qwGQlmWpFJoVnVJMLxZVu7xQopfoMzaAb?=
 =?iso-8859-1?Q?ZXBnEuFXySZEDz1PHUFTwHT9246uDEceyuf52TlwKW1axnU9o+hhbaf8UF?=
 =?iso-8859-1?Q?ZfQcqg6PkqvlW8jKIb/QSE/tFnlYnVFMQ2LPz6KBJE5l3QdkNwL4eQYptc?=
 =?iso-8859-1?Q?QUmXlBmdV80fuelNQ8i6X0eUGomDw0mjIV622j0X7nEb98J4YJWRgKfmdB?=
 =?iso-8859-1?Q?DKBWWsH3OqoWDoPrLqSYgwddIEOl8xjyszEsJfDIGSXk6w0k8sNLs8F6HJ?=
 =?iso-8859-1?Q?fNxq/pknJgOaLmMvvq5d60y33dCJHUo2djNYRLr+ld2lvnTA+dRLcIviQM?=
 =?iso-8859-1?Q?JygOAdNIapLxyZwUVdCFX3m82/l3rKCq/PUyKrpBleFWjHYwWcYO2giQyw?=
 =?iso-8859-1?Q?Xxx/srLr/KFF4miDH+b0R3F4F5h44GRF7+Jjqb96Dk9aaCxuXoq2SO0D/j?=
 =?iso-8859-1?Q?V25sITpjd8vzny8ZGZwlXC1O2D0vJwx8dM4MGiGwB427Ps7Ua9fc6O5YZG?=
 =?iso-8859-1?Q?KC8mT7939ZaLqD3T28Bkc2dAn2HS9cKbtCxPO5n4nhaKgY89iZxiHdFyOU?=
 =?iso-8859-1?Q?kEsQw42c9U2LEfHDGEZwJtXmdwZ37SWtzKxjXt+1F9C/VDvi65wYFuDpRC?=
 =?iso-8859-1?Q?y/A5OPQoedtbHFKQBhgOlI/2jPbvKLz60pkc7SmMH8pJkPJwRIaMOlEDPd?=
 =?iso-8859-1?Q?h9NumB3HVh4xK2febDES5NNOKSwCe4q1Vhg/Ki9PmW4brOr42lEHZuiMvo?=
 =?iso-8859-1?Q?bPQjQzaDu6n/xpnnltR2G++Wf19hyNBqlgzljNlglUkyTmE3nv4Fsj32Ne?=
 =?iso-8859-1?Q?KOb4VRHo2gKRN7VYmgB7Ft1moGVBo1LhJzCWZe7JJn0gRHYBzx6x866nUY?=
 =?iso-8859-1?Q?JYToQUg67O8ArhfqUtBeSHUO6lzBMJqoTd5iUysQ1rJGqjppMwtyDRNJNl?=
 =?iso-8859-1?Q?9IT7uMY6+yU3qc1xH7W2G9uVubiJ65+9VQGezgjXTZFRk/R7L+y6Y/magi?=
 =?iso-8859-1?Q?ddQX0RuZxZav7+E0FCVuEAQVeDxDrDmlhMtgWsNjSaauvj8pEhpB+ZSBj3?=
 =?iso-8859-1?Q?fhryJfr41ja30IK8kSyKCyKR8FLXMXCaWCEwSn5hWaAYha6w8R22oG1G5i?=
 =?iso-8859-1?Q?1clHMsK9Wymy1hUv0fKJouH+swZ1RlnyEOz772SpwvRfK6s4n2GBKxOBpz?=
 =?iso-8859-1?Q?CADjReOiscsdwjb59uXBQnh36Er6aKD4QHM3Ew31+AY+HZuV+CYoDaPNFZ?=
 =?iso-8859-1?Q?cqvCZ4Dus5X0FFTDsD6k7DIbzXYsNxSnVmGVIoIl5P/a15EBTAT8lJkwBM?=
 =?iso-8859-1?Q?Y39jTDa0wCbDMtkuzSljpgH2d8ci22MwGFV4/M3tM88H3UtyQ2AK2omoEe?=
 =?iso-8859-1?Q?Pl56jbU7dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pMV2DrJIKNVfsLUh5D4gPQVtMKGRBd89AR7IVJasB5XkhFGFN6C2o0g64KCT2BZj4QYMU9p5hBG+BZOahRwjQMV4ERGz0P+g9F3WEp/iOMUjVyn/JvmFhBb9FSeOXRnsmlaBtwuH7kloosmwa5qefr0u/JmG4ljw8vWRAMy0teA6iQCF8qZMu7mj3UK+/0kQ8zkz/cC7GrHkQtffMkF46n/MGWyGk0+Wi7kdMqIkUOpSEbSe/726XtQacg41uV4Wkja1k0MMKW0d2PyARiRpUGkqCBjBtwoqrHTFXteA3e6TLLc93BGbWMS8f9KA0ybq+ZpB1W6anv8lTKVPVT0yVGQbKdNfLTW0gifddc389cIKVPh1ob67Do2Fl4U3Z7AMpjlse1UQkPcBlyh9rEvw0N9MUuMzb4FxO8klPVhlYsqsYXSJzQt22oe1qWrG4jlhFfdr1Gs042O1ZwPwKQ4vwU8wxE1MaLZH/bqyfmsttdDdjq+JCEOWJVtbUpdwPJNuDEgdE2t/ETsZeySkW36Aivpf7UdoIrOSVZE4TxUUgIWxniDCpzyfSMifJPdTAaMcQ6AtZfQ0iSfQ3qal4y2MXiKyms17zMxLiQm3i7wnjik=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4328b6cc-0e48-4cde-ff45-08de680e1c79
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:04:55.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zkPP9x+4Zz6k5TMVOKtoiFPhrLjU/SjB3irRZRMomxfC8Z5o3BrzAAgIT9ahcyUBVUEzpvyj0OnYeM6UjMJSdeOaTA1KrSOJvOng2f1YDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5619
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602090161
X-Authority-Analysis: v=2.4 cv=YbOwJgRf c=1 sm=1 tr=0 ts=698a2fdf b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=jBpoLbECB3911k4lcnkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf
 awl=host:12148
X-Proofpoint-ORIG-GUID: f1bjZ1RL1266evwCRXjvvmE8LPbR9Zen
X-Proofpoint-GUID: f1bjZ1RL1266evwCRXjvvmE8LPbR9Zen
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2MSBTYWx0ZWRfX8ss5hSD4r+J4
 Iic+TbAqkpKl/mxrDP7RNJax1JsBRQko1hGQ8nyD4Jeem8LEn6tcMkMvdDYXSwMP4tmwn+1i88M
 9dwAPFBwUZJQh5nSS1IvM47K8jeeCd6wuOa41+Dq2nRLrWOXJAjM2m/p/Q3+XA4+ukJBINsWHZs
 4ZNSvrq/8bkzk5FFY8/2t1CEq6jSyiZllAKphJW5lF1cFZPobc38hYdYOWfuf6GCH15MbS+Khua
 4EsEQthAQxI6pxtaJ+hhSZPMFfxNXYS3ejpGcIbUrvSWHNbGyitUN0f9GATEpQ07qe6ZZI+k4Q3
 yDT1eNheQBCy0hK1Zx15WgeD8rINs+CNsWZKT1ScmjrqohfzHu4NJKQ9jQPWtQfHvcixZZf1rgj
 TQa+hwHGPqrJay8LJIHMypPmWrsDDPbynTl1XGLTJGjA6pnPPFo0AlUBQKXmv8WOf9NgXKdpHO7
 tu9S5w+0Dj8EFY/PEFTk+WKXT8IXz3HhRORXfng4=

On Mon, Feb 09, 2026 at 01:55:03PM -0500, Eugene Loh wrote:
> I'm rusty on this stuff, but maybe you can help me out.  What happens with
> the test if kallmodsyms is not there?  The test does not directly rely on
> that file.  The test simply makes libdtrace calls, and dt_modsym_update()
> can fail over to kallsyms if kallmodsyms is not present.

The .x file depends on being able to read kallmodsyms to determine whether
the kernel fix that the test depends on is in the running kernel, which
cannot be when kallmodsyms isn't even in the kernel.

Without kallmodsyms, this test becomes a verifier for the kallsyms data that
the kernel provides, and then only in terms of loaded modules, which is pretty
much guaranteed to be correct or the kernel modules would be conflicting and
cause horrible crashes of the kernel.

With modules.builtin.ranges, the association of an address with a builtin
module is done by performing a lookup of the symbol address in the data that
modules.builtin.ranges provides.  If that has overlapping ranges, then this
is a kernel bug, and this test wouldn't be able to detect it anyway.

So, if kallmodsyms is not present, the test is useless.

> On 2/9/26 13:34, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/consumer/tst.merge_ranges_bug25767469.x | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/test/unittest/consumer/tst.merge_ranges_bug25767469.x b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
> > index 7e265f2f..a92690ad 100755
> > --- a/test/unittest/consumer/tst.merge_ranges_bug25767469.x
> > +++ b/test/unittest/consumer/tst.merge_ranges_bug25767469.x
> > @@ -1,10 +1,14 @@
> >   #!/bin/bash
> >   #
> >   # Oracle Linux DTrace.
> > -# Copyright (c) 2018, Oracle and/or its affiliates. All rights reserved.
> > +# Copyright (c) 2018, 2026, Oracle and/or its affiliates. All rights reserved.
> >   # Licensed under the Universal Permissive License v 1.0 as shown at
> >   # http://oss.oracle.com/licenses/upl.
> > +# If /proc/kallmodsyms does not exist, there is nothing to test.
> > +
> > +[[ -r /proc/kallmodsyms ]] || exit 2
> > +
> >   # The test depends on a kernel fix to report kernel (and built-in-module)
> >   # symbol sizes correctly in /proc/kallmodsyms.  An easy check is to count
> >   # how many kernel and built-in-module symbols (that is, symbols that appear
