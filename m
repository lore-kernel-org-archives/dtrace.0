Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A801CAA81
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411104; cv=fail; b=VXOwzcXHy1g1vrk+aFjCNAQfhfrJkmNak2pWoLrAXiY7oDlhV5WIaux4o132567Y5e/AEh14K5rVpsFm+Azx34nt2rQ2umyDm2JnmLvgUyYaBsy6HFYYCIilxu+GUYLUZI3FT+mFaF3JAlgI3zPFMewe3/CokTpb+XsIEOlNQuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411104; c=relaxed/simple;
	bh=WdhTpnDv0f3trlYZVH26EFv35i0MxP2/DTqxj459ekM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FjhpjsxOkiOMkatbBYGg7q7jGQkR7M5Dwtvmlfnp27kFAlhv+3Fq0SEaQ0m02lU+tVtVCjYUl1wvy0QMYG9XOdEc0az+dKtmKRIZkTLboZSSPsRHU/2b1EcFxMpPipiLWOQMRHjy6eOasTGbYGXJ9C6J12hqNTRZrYZeVUBgvAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jWwxCFDP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=zLb1/jwK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jWwxCFDP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="zLb1/jwK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JItn1E028018
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=T+04KJV5EKkjIWOvOK
	8GeyykjS9vvi2DNMSypPd7B6w=; b=jWwxCFDPR1j36pmhAeDzbzWMSdesC6SRha
	fYBrqakY6Qp1Xj3uNZYERh3szlaXQSHneBGhe5CgmM+sQfsigZgOR2SBJ1azr3Tr
	ERLvzSF6xHH5S6u5BO0isDVQRtJ8hqINKS4qy1akgz4QZ1hEaLJWaimYOEAFdqOX
	eBhZR1Quo/zWyrXITrvhvi5zXC7JvmjcPhPCJXX4dU6eC8wveth8fDoKb1eUloEF
	h1aw/shNRV/edd/l3ceQ3g+ZvTtg9lQBqZUmYWoh01fLPl1IlC8dg9gcuQdnuEi7
	/rUpEZqtcZyyVb4KSqaSE5dBASk9VoE16ZDdbat4FWC/T9eXdKJQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45d1m1400x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:05:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52JHjBwk024433
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:05:00 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45dxbkbtve-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 19 Mar 2025 19:05:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySY9kE4lHFkeX+btxS7kTN5kAj0n8Nk5izmEPtiKADK6P4/RfXC6mUUVRHTlUDC+I7PcGYP7EdfHhwmonW4CfhFhooelT4eI/EiJI5YTMlK3WA+69Ar8nZZQxjBM2lHkQbJe6A9xeYm+C1RpnYseKIFIzhnPOkpwujJOVjQpHdKjINU+/TqCznMU34zQSTFO2Y4xdkkb53qYh6MDiMP2TubHT+vhVO+Eq+jzXme5UotB3F+Ivbfc5kZ2C/Q0UP6Pd4gio6cmcm3AvywG+nucODy/tJIDOITrCvuYiC+fc4PF4GTHZlO+s5u8TpC3NtflLjHCUCQKobL3dKqm/M8EFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+04KJV5EKkjIWOvOK8GeyykjS9vvi2DNMSypPd7B6w=;
 b=aW/LlKjY8GF7KzK8iOvgTfN315N2i7j0yfqZEeNoIVnljj+pgQ8NLI19i6UyFsbiQ30Bs8V1Gbi5uN6ZRl6IHYKk2feW6bQhg2gl5RnJnyBwpX/3LsQqjTWiCot+9bfk8ASl+4e3CMG4reTvDnMBCyZfKFW1VxyEQfYgmCdJdtNnPnYjc5SW46ZYIZESTGImEexw5CoCJCwWZKX9umG0fVSYFO6DGq9CSIg8yoY/k9v1EFyfcFvPUQliw563F6vshN40cWlfqwxhLM20W3g02b7f7KQuyVTbA6o1z6rF5xF7SDrT73gMusRP3kI78ONumVL57H6hI5UYsZwjnPfTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+04KJV5EKkjIWOvOK8GeyykjS9vvi2DNMSypPd7B6w=;
 b=zLb1/jwKnnKSh9h8JNv88AuhlK9YC9por05lsPoQzDLEMA1eIX0Tm1CH3gKGhg6AMPDq/ONwHS04Zu+2nqePr3M1BNfGPot0PKrrmcPJam/FpzoeagtDqY56tWOZP9/HIb1w3hU6k2QuqDg3VbYeUY7Wc7rb0cLTl9e5WCpsP8M=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SJ0PR10MB4717.namprd10.prod.outlook.com (2603:10b6:a03:2ac::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 19:04:58 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 19:04:57 +0000
Date: Wed, 19 Mar 2025 15:04:55 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Expect USDT argmap to fail on ARM
 on older kernels
Message-ID: <Z9sVV5boKDQLyALm@oracle.com>
References: <20250319063230.28171-1-eugene.loh@oracle.com>
 <20250319063230.28171-4-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319063230.28171-4-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:36e::27) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SJ0PR10MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 46400d11-eaa3-45cd-8947-08dd6718f0ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qrF5JgVT05MA0KORK0vzopB5K0Msrim+OLqpyJv6zLaMQkKsFDEybe5g1Mya?=
 =?us-ascii?Q?oVEg3aXRXCihC50deON3N93bEK+u3f2qF+VwnObj5QyjKTypP9lWTFuZbQ7L?=
 =?us-ascii?Q?43GWkguo4Yi9slyx1tm3PG4ixeH6G19aqO5245q5d8BCcaVnbfV7l1metrIe?=
 =?us-ascii?Q?9aWisRhWR4hBBlBnRCW7XkvPGRSGv/SNW6ChbzE2QfNLIv6Da0QbjJt82f4q?=
 =?us-ascii?Q?VqKKCRWNY663VOFW9V0Ou432YfQ2FzyW6Vglp1c6v2rHNMcS/XsF1efyjBoc?=
 =?us-ascii?Q?EcR637UWZDWw0rw0/i6QGE39Oe4RNTmLamWWJBYjqP6uYEr+9EajvLbCB+eD?=
 =?us-ascii?Q?sdhTg0i7+xrE0ZXNmCETUZ4uPgMHShutpWYTNF2WDXOMIxZg6Y5hPND+zVnj?=
 =?us-ascii?Q?EksMn7VAN/8dRlTROfytH2sZAe7CmTpej7ZcV6a/8j83HJips8BhrJVG+OQ7?=
 =?us-ascii?Q?eRJ8HmiKZVftKHXkEWqHAZDT9vI1OPG0O5WVfkxRxDJus9f0N0AYUSvsnckJ?=
 =?us-ascii?Q?X2eMsFyUZ9mlu56W9mK8kSXOZ5FJnEg/wiT29sJO+A+5iwCMgC0NS1YtqizW?=
 =?us-ascii?Q?JBdNEhciYF+75FB/owZ+1sG7ylumu3pVzL+lmRzOt9o0uwNk8y5fBTHv8eai?=
 =?us-ascii?Q?newDAfFtHhsodCOPLKUOmqgr/jp48w74RIMySnkPJTCDcqg3AhoVc8Du+CZ8?=
 =?us-ascii?Q?ySYHWMOL/8jxKQ3WGFZYTa9PbHBOknvME7OPfrhUbK8t5A3PTPHb7fn95cTU?=
 =?us-ascii?Q?B9SbODszeSajR5XAWJzp2d+ocJPZPkem/T/XUkF2hI6IVBhTMiaToa1HcCd4?=
 =?us-ascii?Q?hohHVH6Af1OU1q8N0cw7DyQ21Yhk9KReUW5jbgiB1kXgFMzIA0Tv4FFAgELw?=
 =?us-ascii?Q?3wZQ4GBmxTFKkf5N810ljdvsRdhSNtrkQt92zAK2TsGJqUOdtfOoeB2pBwao?=
 =?us-ascii?Q?qTh8ZG6yaqx42gCmWYERBUWSKnBUTm06QcRzmAIZV6/F3v+XoiXMF72castW?=
 =?us-ascii?Q?ZjE5AP/g+kqjBlHnqWD2RtaIyewI/7Tju13hMdDIexVLKEbYgtn7QQ8yi+ys?=
 =?us-ascii?Q?xkFBUCDXiirQ2nZPwVq9CohLo2f7wi+AUai5DMGIluyZAbr5rLRB5pTXlH10?=
 =?us-ascii?Q?NM7L9OQVz5+7a0+oqioVD7+n8fG5Xs2IacTKIJI2eZpuBLdNrNzme/fcoku3?=
 =?us-ascii?Q?ywoKg/A+pafu6PzC+PsC5IxsIGilDB+rk0HJf+mo//IongUXiabxaZTPt0h0?=
 =?us-ascii?Q?H+vNGIDxzM/JCL8FSNX8TW4eO7dqG67d6krO3td6hQGZUCzzsHk0HM4eQed4?=
 =?us-ascii?Q?r1q8pEL4vCa9gHtLQZuIsB9qSrZcsQyRmBzRozUxs3oUZeGFdLa+zOhAjSJX?=
 =?us-ascii?Q?RjjMmAk71foteRT1YodRa8ddXfyQXXQsASTwHsl9rP7DscMASQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8zyyXK4AMacM1lqv9JduIQJOxvdnYSVfX2p/WkqPVIW6TXiSW/c6i/lDCL4J?=
 =?us-ascii?Q?jN+uhIuOzqlLl0ypKfdybN1RlWxQ7lfCw6wpB+ERiPfxvtqtzO1ITUNVLZ+6?=
 =?us-ascii?Q?5VYX1ta/x/VsNjRzuylrnCeYnNjgK8tka47Dhmkq/7YMsyAJ1mPO+eW/c4Fw?=
 =?us-ascii?Q?2vH6nz9rdF9yXu8EjrVbUZ4p/HLmZOrwLytbNnLdYYqBoHRASehOc7eN0emn?=
 =?us-ascii?Q?fp+Y85oRgQqEZaOGk/M4a6kjtkCkNoJYN5qRey1r6lUknGhuYzBzEQ8KtIie?=
 =?us-ascii?Q?cUcIDqqSXoDwGMP0mxCxOPTtfA//nqahANwYdaIvoFDWzLqbYIeVe55UvHi8?=
 =?us-ascii?Q?KYAj7t0mKej0PM2z3jgStc+0GkFyCdGg0CjB+9ItlMQzqRpwqPVgO87P4krJ?=
 =?us-ascii?Q?HKTkTx13c4GRaWB+BcHKW5jI/kMb/HNfovU+KO/ReUDVYxJB4ESF37KazSBe?=
 =?us-ascii?Q?EuLUC2ed8yC8AKVfSJaW0LTuzgw39TtMeb9Y44wBJZwUT3gxPyFSdwwCqpLB?=
 =?us-ascii?Q?FpIeQwHpvJ4sLvSZLf4M9nspHRBMaaNGlTOjMe/fuXUYSKyJA2rThcnkjMfx?=
 =?us-ascii?Q?XFsfDjCqpMntFAR66lY9h0MysbT06hZySCoPonA7sqSUa1gedGS4TQ2QI9xu?=
 =?us-ascii?Q?Og8gsd9dNFOs/JpCGvU1uAMQseXh/fJGy1qZCwf3J/d98nno+TegSSxbrdat?=
 =?us-ascii?Q?zBrHiQJuLv6r32f87Fj9cHF+UVWYDnCOHcFmYq95awTvAwCumDDUrjsHrqnp?=
 =?us-ascii?Q?L3MjsMbVubrO9WwYnCdxR93YKOhhfcTqtjGdCasg1jepp0PYqXNdFahX2RlN?=
 =?us-ascii?Q?4RcM5Ae3k110NtPW9VeKnHezujjXkmykvJeTTjrJ9zKGV7vAiEA9OAT0Lp03?=
 =?us-ascii?Q?ohpXAcKcGHtFS99uF0WLIrx17gawaPQzslKDjiStGLQ480dMPcK5Uf1fsUCD?=
 =?us-ascii?Q?8NxNUdqcMWnslv2FfGkHLM767EXXRbixnXu29aQI3bI2wb+ALaISJR7XATcA?=
 =?us-ascii?Q?nFu3QZnQiId/ke/n7R01NDWgIFWYHXaRv3/ognutAPpJ9XIeZInuNre6o734?=
 =?us-ascii?Q?5bKYvHKGm2SlhgLASPMCE4QR3j6U6bwYR98u6JzOGgCt5YVgY7vpr308yrMR?=
 =?us-ascii?Q?ptM84VOC+LyBF+/1FoATMZ9AxlIFW7JbixbnHUEgXtj8I+YbSg5aq9DxTMFW?=
 =?us-ascii?Q?+mjIfsyIW4lWxN/amLh8hftYmAnys6OBaHW1vRBABqHCerC+kpcpcYn020Tv?=
 =?us-ascii?Q?he790rpUratzaJdhZyqA74bxPsalPLciHK/sKPrSQ0pD5ZtPFEB+Baa4NFaY?=
 =?us-ascii?Q?FUXMvFCKy9Y7kYZFDJ4OhjQ7QEmm2wxwYYFCzA7qG0d5vx/DwLWctUcwkNyk?=
 =?us-ascii?Q?9Q7rz9eMtqM20L2PRhRUHbOAv0p8/1HTlSd1tIclUNECnwvfAXJHcDEyfTCs?=
 =?us-ascii?Q?5IH5ONJH30CEx4BzohZN/pVby9d+gXjUtXpJ/cGWVtCKPADmfutiWxK0UDll?=
 =?us-ascii?Q?m7s0FwKntE108S3K8eKuBHuWHVLH9jzcDBHd3yf7/s0Z9CdKIBeNoEqSqNkO?=
 =?us-ascii?Q?ArhqWMrA0SLON/DMvDwnpdQqfc2SiJGm1gS0mq9awRU4drMsJbOGki8JX2sL?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2r2cDf88DqO1A7eI/qupL+GZ98ueVzzHgdiqs7ZN2a5T1cAe3lB7kVYbG/Z9R25eSnPqij8242+fTjYoyy6JxxiOLb3az5ics/HU7wozGE5v8s9rIoj+5IL8F0Jf5qdjwFw1lyJkk14e9jyjciRZEznBRKhHOkGFe3xTMy/jYTpgoamhGP6DH4WIyC9PPtIthQMh9qicRyNRNLflV9tjDthu38U1mTYS5054XaLCw6kjir++IPvKq2i/zxfhMAtHBa75EQGqh43QbAS0hl5u0KA0BQj9KI2xcfJImK+Pn5977WU4AXebjB3Oq0bwq26LEgYU5UCZxfHkXTuaZTgwjHZb/wOZB9FpeGXChfKKOFUwM/HvxWb07C0YI18A2CF291dS6A8oDOZhuYBvDN/hFtphauqVVFNT0HRhqaolyvQGcXOo5VwFcLK4VoDc6eT1GIR9XtZTCOTlIKazyeQhhiAs1YW+uiIM4ouMXx51Ufjg3Q70PLzJnm4FOhG1Fhm+CNszGldpmHo8QnzFCzqHBBC1DVpx5h79wMviU5iRaLyk3SIw6dJ1zYYKoW6iLVFi0m5IEp4OFb9/zkIGn6REDEy0wiCUlNjSsMo9A3kYGUU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46400d11-eaa3-45cd-8947-08dd6718f0ff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 19:04:57.8458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ+kn0lhOiXrFfp/AwSgzL7ba8y5Lh0QDw/PLMcC3mwMmQEOQt0m79Gmz1SuhVGLYHhGtTj84BraCl7XchrruGfCQwKwiiPz6vJCBtusiUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4717
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503190127
X-Proofpoint-GUID: jWD0mYvgWahoVk8wA4sq_Fdgspr8SUtb
X-Proofpoint-ORIG-GUID: jWD0mYvgWahoVk8wA4sq_Fdgspr8SUtb

I am holding off on this patch for the moment, just to get a closer look at
the potential cause (and some info on how old the kernel needs to be for this
to fail).  I would expect arg access to be the problem rather than the mapping
because the mapping is simply something that happens in BPF code.  That should
not be kernel-dependent.

On Wed, Mar 19, 2025 at 02:32:29AM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  test/unittest/usdt/skip_arm_uek6.x            | 25 +++++++++++++++++++
>  .../usdt/tst.argmap-typed-partial.aarch64.x   |  1 +
>  test/unittest/usdt/tst.argmap-typed.aarch64.x |  1 +
>  .../tst.multiprov-dupprobe-fire.aarch64.x     |  1 +
>  .../tst.multiprov-dupprobe-shlibs.aarch64.x   |  1 +
>  .../usdt/tst.multiprovider-fire.aarch64.x     |  1 +
>  6 files changed, 30 insertions(+)
>  create mode 100755 test/unittest/usdt/skip_arm_uek6.x
>  create mode 120000 test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
>  create mode 120000 test/unittest/usdt/tst.argmap-typed.aarch64.x
>  create mode 120000 test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
>  create mode 120000 test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
>  create mode 120000 test/unittest/usdt/tst.multiprovider-fire.aarch64.x
> 
> diff --git a/test/unittest/usdt/skip_arm_uek6.x b/test/unittest/usdt/skip_arm_uek6.x
> new file mode 100755
> index 000000000..252cbebb5
> --- /dev/null
> +++ b/test/unittest/usdt/skip_arm_uek6.x
> @@ -0,0 +1,25 @@
> +#!/bin/bash
> +# Licensed under the Universal Permissive License v 1.0 as shown at
> +# http://oss.oracle.com/licenses/upl.
> +#
> +# @@skip: not run directly by test harness
> +#
> +# Tests that depend on USDT argument translation fail on ARM for UEK6.
> +# They're fine for UEK7.  It is unclear in exactly which kernel they
> +# start working.
> +
> +if [[ `uname -m` != "aarch64" ]]; then
> +	exit 0
> +fi
> +
> +read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
> +
> +if [ $MAJOR -gt 5 ]; then
> +	exit 0
> +fi
> +if [ $MAJOR -eq 5 -a $MINOR -ge 10 ]; then
> +	exit 0
> +fi
> +
> +echo "USDT argmap not working on ARM on older kernels"
> +exit 1
> diff --git a/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x b/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
> new file mode 120000
> index 000000000..8d462f98f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-typed-partial.aarch64.x
> @@ -0,0 +1 @@
> +skip_arm_uek6.x
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.argmap-typed.aarch64.x b/test/unittest/usdt/tst.argmap-typed.aarch64.x
> new file mode 120000
> index 000000000..8d462f98f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.argmap-typed.aarch64.x
> @@ -0,0 +1 @@
> +skip_arm_uek6.x
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x b/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
> new file mode 120000
> index 000000000..8d462f98f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprov-dupprobe-fire.aarch64.x
> @@ -0,0 +1 @@
> +skip_arm_uek6.x
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
> new file mode 120000
> index 000000000..8d462f98f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprov-dupprobe-shlibs.aarch64.x
> @@ -0,0 +1 @@
> +skip_arm_uek6.x
> \ No newline at end of file
> diff --git a/test/unittest/usdt/tst.multiprovider-fire.aarch64.x b/test/unittest/usdt/tst.multiprovider-fire.aarch64.x
> new file mode 120000
> index 000000000..8d462f98f
> --- /dev/null
> +++ b/test/unittest/usdt/tst.multiprovider-fire.aarch64.x
> @@ -0,0 +1 @@
> +skip_arm_uek6.x
> \ No newline at end of file
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
