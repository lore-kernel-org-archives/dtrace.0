Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4018A2F365C
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752664522; cv=fail; b=kg7hxI+pYbCjtjcjziLjtsDwPF9lNvG4N6Z7siY4JKzSdJ5J7vn18eyh+/xDSvemcf7B+lNPzBMxGdjoWk8f+K8wAc79KsuUpqtulqAOBfXr+uxX/4rjrTkMTRX4x+BzV7tP8G/KIof+AlNwdFyy+8HA4/lh3+tY52otdc90/fY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752664522; c=relaxed/simple;
	bh=MAWkHb9zZ0Fg0oM5YGnH6c5fKrOhPzRUU8p1u27v5ng=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=Wkh3rN7tdLd7+xffK0y2+KHQOMX7/lOxz8Z/kcwvnN8rrttc0ZFSn2Fnrl8DkUdnFF8OMiTQMdbSknM3sZPLKerYk9W+JY6LkjLxzpRHvB4EcNewvjqKt22qOn3+aaLh4Vs7Q0NXZzp8rMLczWs1ep0QYsVaaMOOoZ2/9G9RfLI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OAgw0tTz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=psBkMn6n; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OAgw0tTz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="psBkMn6n"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G7g37w014995
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=bMgYemVhOUlMxwaI5i
	g1IJqH/GEyjIZjExS3qZuF7cc=; b=OAgw0tTzqfRM5lHPA5cK/K1rGZreEcetcq
	OPuvAWJb6tr4ux7f61biNHStrJVkG3TEeUQmFd6Q9L51ZMi6ye5qRwScCETUe3xy
	s20ycX7KBme7pljL8QCrJOtm4dtzyUdvHlbysmeHOTxL/CJo1vp4BFdNQYljkzK1
	wgicx2zBTAbSFiyynWav/hIOKVt/KK1oPSq7f8cxaieSRI8IovTN5N3+lbrlRnnO
	6nX9ky34LytkiiHwZN3NjXssZPcaorRxRyYCtoMQxOWw7mQ8haGqPB6iM99roSk0
	LluiDjeGk/5oa6Q0T8xgceiL+I7qpXpnvYhI2MvAlBbDW3Of8emQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1b0ps5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:15:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G9F34g013724
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:15:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5aqgtc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 11:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=biNpVoc1iP4XHqObEBXRRk0Vj2bSxWxtWOcg8cJ26KmIJNGAoaFiWbGHJatO1jKEtck4uzgTWRJ47jHwo09bEWPb9uQxT1dGETEz5q/lLF5bBJnj4JnxnYKgEYPL07nNia54LW9yNoZ93/S4mYrKfCEMamh/Q4ZcjAwhiYOLye35zlDWgESd0bQviwy4rkqdGXeu++drbe+JLtYgLd4dvPbWQWlIyfYqI3PWw6nGRLai02PNVlimlOtfdHvWmAw/XMOldhndK8lIo63bg3HQL+GRV1pw5b6SUCs2GYlnFbN3byY6/ivvYFRZEYq20Z5PHEoevuHAGLYGK9OAJDJqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMgYemVhOUlMxwaI5ig1IJqH/GEyjIZjExS3qZuF7cc=;
 b=iST8J5L7bRgHsLqnNGcWmx3QCaRsrQLt4ZkKy5IW1ClYOw8xNINvBa0xic7ulEoU2EX8rzLTxf8mmr/negtIlk963O9NEgk13jfAkxO/oZipAL9DALjD5WFLv6OnwVrV9ukXg2Qyrt4d2fwefhDP3tDsXP7cOLsPgzBFddvTY6elDi2T7g76ud5hmMH9Nkh3+okNyiLQKRzLl4QHMWVxZDkt7lV4WQXLe5uYKk0jbRhcdKZrZxe+vyzuoLqIelksBCzfeluM6PsEwtNMGOzys1xyueVy0ZLq1NijJkIG9BIolln7i3qdVMzAhZWER0FQCyg9JvJ0zLVUE9tXuxzYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMgYemVhOUlMxwaI5ig1IJqH/GEyjIZjExS3qZuF7cc=;
 b=psBkMn6n7Xokw2hyQ70Nsm8632PLwzzcboteHiflk4zPHS/KOI8AEGMzoAGrIOG4WZdAU971BZvxNq77sScDp0BsH2o3Q3DFhgmkxYPg8q8KrewBtoBrcAwTvevu0Cla/67DILmLa6ELDCcSRGzXc4e3FUu/geGbZW+A+kHDVDY=
Received: from BN0PR10MB5029.namprd10.prod.outlook.com (2603:10b6:408:115::16)
 by IA4PR10MB8495.namprd10.prod.outlook.com (2603:10b6:208:55d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 16 Jul
 2025 11:15:11 +0000
Received: from BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f]) by BN0PR10MB5029.namprd10.prod.outlook.com
 ([fe80::b85a:c2fa:6a79:393f%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 11:15:11 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] test: Make tests more resilient to different prid widths
References: <20250313003946.11074-1-eugene.loh@oracle.com>
Emacs: (setq software-quality (/ 1 number-of-authors))
Date: Wed, 16 Jul 2025 12:15:10 +0100
In-Reply-To: <20250313003946.11074-1-eugene.loh@oracle.com> (eugene loh's
	message of "Wed, 12 Mar 2025 20:39:46 -0400")
Message-ID: <87ple0petd.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0495.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::20) To BN0PR10MB5029.namprd10.prod.outlook.com
 (2603:10b6:408:115::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5029:EE_|IA4PR10MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d1b886-c8e6-4f05-6112-08ddc45a07ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BbT9ThzQlcnDOrJfqIgutB8ZTAwJ3vP9FsuXY56d+9ILQqCsDvSRXO3hy44U?=
 =?us-ascii?Q?ZzscYsj/zkYAWXFxYUegRl5wYgPboXPxKhC9PdC8b6nWjcvP54XCZx4U6tME?=
 =?us-ascii?Q?QFxe+kH8XwYL2JMP4qm3GpRzsPJqSju9mCuzbxo4oFsdKrq3HOdYs56KFh/v?=
 =?us-ascii?Q?dEDfTm0oGJ9AhRQ9z1mmaBSXuN8qrUfTwvXAaltaGbq1J4hjDaO5ua7+tkz7?=
 =?us-ascii?Q?Rc2ZBIuAgX6k3Tid9oVznOb3h8RvsZmtK/F4Am2mWLsCj0dBaKaRtJillfxJ?=
 =?us-ascii?Q?nCSkSRtlozye8f1xUOhE2L/4hwupllAhLiHb5mjO3Q/lwMXdpTGdRymI65ci?=
 =?us-ascii?Q?auZdhP4J9M5xPhqlbRLrUQQQuVsVJlOM99a5iHH0cFKJp2yBu0/LcxteN3FX?=
 =?us-ascii?Q?ln/X2Yoea31AD0YbVlcbo/PSo6te82GwmPAKQ2p1dDRXw1qm6Io5oSJrla5P?=
 =?us-ascii?Q?bNhZBcWlgwDJ7jXWBtb5kFuRK2z5dn6WNYbyUlgZz2B5m/rTT2Zpg7FsAAPb?=
 =?us-ascii?Q?S81Aoosi86gRB6NwWkDEAej9I32Rn2aan2sszHrwYHlSq06SXrKT3yBzSWcJ?=
 =?us-ascii?Q?Gun7bwRyF7/H4HyQpjbY5qzRw61xbYdAPgwhTD534zLt1TXW+qxrwdmV7UH+?=
 =?us-ascii?Q?GK0c2iPrRRb2v3kyNvWVeAZ2VuFzdQ/HjT9+5NYgcFVtcY12PG+eFkfA2t8K?=
 =?us-ascii?Q?uSl3VovlCyVtwIgy7CjQoPHrJ+O3D8A66nDBsXhiTkI8F2trW8yPVy5pjPDg?=
 =?us-ascii?Q?ICZQekrVe1eneBjJDAFR6r7LfZWaalIK4A1XP0p2PHagVC+0J3IAuAMZ/W0s?=
 =?us-ascii?Q?oeg+D/zNZwDlJt618ch2oQ0NuFgx8TZovCOtXLtgQECw2F8yuOQk/STkajxk?=
 =?us-ascii?Q?RHrMADXCmwxmxNJTRcQ6rYnBVSyzXvBOpgsT7h4CDYPjN1vdvb5PzgNOuSaZ?=
 =?us-ascii?Q?VW309+s/E0sPV4/Gm49gnIMZk3YIeIZ9iX6kV3IkpKD0L5X4KB7lU1I4Ep7Z?=
 =?us-ascii?Q?e1/0pe2l7OuPEu/JnLmtWQFDse8KXJdZgVvfm3R8Dfkccv5UMS8p02sf6+Bq?=
 =?us-ascii?Q?XZRiAfZF94qQQQRwks4FimqFzL1cUWO2kV2hJEZxzElC489W7c5D9uVEczps?=
 =?us-ascii?Q?9OKeFztNtKEvcVJat9x0UwE72Gh+OjPt/S3SNyAvJSDe7ijSmxOzTV40yQz6?=
 =?us-ascii?Q?SSt9alwoJyqXguh3mY3Y7A6lAuhiUcT2ks0fwL7SL6d571KlGEmTnCglQ2VE?=
 =?us-ascii?Q?Ep91WKdq8CqctKHsgu0WpZPQtQ/UBwT/6aoxkBQFsloVHxQEf1F8ybfyHWYQ?=
 =?us-ascii?Q?Kw4jedojl+PcqWWSfR5AtVcsMbviX9gI47gDnzG0HY4YSgR1K7Mbj6mm8czj?=
 =?us-ascii?Q?zV4iU0ccxCrMBdvpHGQA/iC3n5s1Z6ncj4+y2MnmeOqkA1xb/OebPq378WDq?=
 =?us-ascii?Q?C/BUg8lGrt4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN0PR10MB5029.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qyxVdSy8Nf8Xn+v8KKm5NJwzOoyUtjFHUkzlHFKHacLBt62Wg/iC5WPpyqzI?=
 =?us-ascii?Q?2MUXVhy9m7O6cJX2B2CH65tGtLkH6lcs/LYkmVNonawuSqOP82iSnJpMJ2cO?=
 =?us-ascii?Q?3Uzc4rWyhEx6/PKpt3+OcoiqPz2lZ0rP/ABTkIWDpgoDNsV7VXNBVBg6N7hZ?=
 =?us-ascii?Q?4CV0MBso7CEXP3S4U9sRwM/vTySBMsLxkOZtWYtS2yXu1+JEPH2vPMQaTlsl?=
 =?us-ascii?Q?H3h9ScSA4oXsKmWELrb0pIAtALoab5fWJHlsXnWZznEv+tMPvH4QHjBF4MPi?=
 =?us-ascii?Q?ayzRYL1qMRUYNre1P4wZ5C6cKLcjyMGQTWRfKJWrH7zAwRMfB2mAf4l6zxwd?=
 =?us-ascii?Q?KvLMZYf6NmuyDlJZqM14jC3zmTCyJ/QwLU3g0abJM2a7Z06r4InKuJe8KrPx?=
 =?us-ascii?Q?yYEMTU8bDBCiA4P1EFtcFH836mVYVsXLVA4bm8ctyiZ4wBqmASNyJ1Lg4lqL?=
 =?us-ascii?Q?qD4ruPjaqEPD4gOfSq9rONdKjuIpf+n+XDMmwlkKj1c+bIW2yl4BJc7oQscy?=
 =?us-ascii?Q?VQmzxqIeqJU4dRNWiCaYjDaQ2Wpv0Pj2owcz1E6tgmHxIYdQqVApGDjB9i2/?=
 =?us-ascii?Q?86A+x9g8ooFUjPbYjs+X5w7FM9rjs0I97F+NCLvU2kAsE47cYMPv76tVvI6c?=
 =?us-ascii?Q?BiXrUGZdMR4XEDQjgr9vU4mxTOiTXVnrInnqLmy7UfICKsNmmhLDeVva2SHB?=
 =?us-ascii?Q?CyM8hiZq9gfnQ0+wCrUhdJQeWKcjaHD98hC+PrDHYq1EExm0G/Bk5LCZ+PDD?=
 =?us-ascii?Q?tPy59+c5fJijD3PUbGhSGZwmoakJJJ7WamyCL5ciL2wpZC7rn1H4exEDdX4j?=
 =?us-ascii?Q?KzVpQ4psgec2blmjLJhUi6YcY6b7UrK99pRPlPijYbhXtfOKvTOSlode3Ug7?=
 =?us-ascii?Q?ESD7DQg0Wbqxyt9rlAbR0fjfwlIs37VeGTYi+soxrCAU2zC6a6tnEQiY4xZV?=
 =?us-ascii?Q?MPUiMwS1oO9siZC6/fuax/IBFNOz+Z9stPfl9kPrx5FCdUUj4UKAcgBHkodi?=
 =?us-ascii?Q?Y1/l0hmwuFbFdJhpVi5sXOYD21tGdJjqkUlSe4wxwXrYWA99pCfDreE2Jq8D?=
 =?us-ascii?Q?/6XaClWX7GHI4i4erMlHr3iYDrP8/SJUiZvqIGZbAo9RGvPz909g6Ommtvrk?=
 =?us-ascii?Q?+DDjGG19v2wGoNPjYkG2AfJOFyjkj4lxNAii9A471Su51f3971sjxFGv2+o7?=
 =?us-ascii?Q?lr7tCUJIavkRDK2YsYCODLSXUedin1hAvAcpm14USkWxtZJL/ayu9OroxM+n?=
 =?us-ascii?Q?XLlxvokpPIhGTkKZUU9+EKpOoykLcjMeT4OODt/bG6qzUoMPwtma+dwpSLIL?=
 =?us-ascii?Q?q2OU9WqkRoLEgY8Z4PgQxJXwO7KamXkuUGFuJDoj+PAvIv3JI2E//oy8KYdU?=
 =?us-ascii?Q?DILJlb3qhoimQ/uzdlIpFxzxTNHgTVPaB6RNRs+cybDVsD1idpYS8ItoU5IX?=
 =?us-ascii?Q?gk0PEFLAM+kWB02H4gVzdChL9gzQkW9Gd8hwq4neAPPBPqLR9e+9XnfoBqRb?=
 =?us-ascii?Q?N1LmAIuxCiwmgLzUVXIEjenXDDyiCxnvO2Xz7LgvqBEsJo/qBn3UFOLyaEoD?=
 =?us-ascii?Q?QEjStVdGT7W879LYZ2BOA2RmHCR11UDFBnAK1BH/zR4OR3sqdlu5ken8SdDe?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cOO1fn786CKEb1+ku/DZL8bXLmSvD2moFd9+Wkh4BBumgK+uFF8HTAJq1iyanzIV9qpx9X/haF+CSDQi96UmhT8GTmp1XhtMc/jqHE3F+qmfFudvse8T5JCzKsNUXr2+gbsHYIaknUQWwHvIcJKt0sGSbYNe2Q3dj9EjfktyrCXm3A9fsu1s+2tT/N0kY4X8XYTLU60RHtHFcp8chnzk3XcRoCGStPW8C2JDnLOXIvCMneAIwQ6jOtLkwHQ5WiT2stAy/1N7Ya388hXkyx+qvosNSb93FvXI3H+WIUg01IGrWeHhg5nzNFvIHSu8Khe7t/x9fXHtxO2mLRr6vpqWxD4wMT9c0kOF2GnAdzfgGPDXlCbkwqHkIUQ9WxJBzNo7lz0bjnd8f/ie3BWPKcSqUqZF5RtPS0e+GjGXNDPMgcTEnZ2mGrV77MDFhQnUiAMbzhCkVlnnND2IXoJbZxS1iJGoDaXBDN5Bp6lF8l40YLO5VWv2l50k37qH09FYLqHXNoCDv8fmQZUlATeJY6hzxAT3tU8pCMFtT5pbUv4mhuGGfxk8VVMnX400CTpKNWQBlucpKqEvHxVEwbTLaIknwdiIetgFuxbAi6jtyxs4S+c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d1b886-c8e6-4f05-6112-08ddc45a07ed
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5029.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 11:15:11.7571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lemq1atpg3948u8RaCiwrCb1aOqck6HSvvr8vgGMmOpIC6+jT01RwAlxRcepc4uc5QIE/Qfc7hJ/SGPwI46BIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8495
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160101
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEwMSBTYWx0ZWRfXzRNn2iRIa/V9 Lz18iEzpFrRVDj2tWBWID38pWlaRD5Sl8ix/MiZv3Jb9XFnQ0Eo5hA4gNTpoTdyBKsPNKpbFH7l NKlmxuCoq6M86+wEcYg8KD+yq/eUOum3AdkmTgWntI734Uy8DG0RdVk46V8BuWQRKaWUTPN05HM
 OgkvvEYyAcBRmcZvXN+0MMUcm9brLk5dFvrxgTV3uHYNPVopfy5D88Ux5FbQh9skS1zoeE6VlHS YUE5EoewlQnndgS4MRgDtCOZNHmh2evoTKMGqMT3b8k4Ysbj3cItUSQzeo6vROeYegn0G6m++xE B4jzu4cgaarFvQPJCSv8nrNqO+uqCr7ThbukeUP2rLrQsHDaWfd4W+xdAsO3gdFd1JG6mzDBU/N
 zT3qPMrYv21Q5GP69yUkYXXJHtrxntc9gJKt+zUD5YG/J4ugtBNiEDUaWWWmMNiOpV35Gmbo
X-Proofpoint-GUID: jdpH4Ru4d7nGd1gcYE40OXy5ZWtj4zii
X-Proofpoint-ORIG-GUID: jdpH4Ru4d7nGd1gcYE40OXy5ZWtj4zii
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=687789c8 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=r5HloHShQVPENgUtww0A:9 cc=ntf awl=host:12061

On 13 Mar 2025, eugene loh said:

> From: Eugene Loh <eugene.loh@oracle.com>
>
> Various tests convert run-dependent values -- like PIDs and probe IDs
> -- to run-independent strings before checking against their .r results
> files.  But the conversions could be remarkably sensitive to the width
> of probe IDs.  E.g., some conversions assumed probe IDs were flush with
> the beginning of the line, but if they were narrower they were preceded
> by white space and were not detected.  This will be important in up-coming
> fbt work, where probe IDs for fbt probes can be much lower in value
> (fewer digits).

I have long wished for some way to fix this.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

> diff --git a/test/unittest/usdt/convert_PID_and_PRID.awk b/test/unittest/usdt/convert_PID_and_PRID.awk
> new file mode 100755
> index 000000000..1dbb31301
> --- /dev/null
> +++ b/test/unittest/usdt/convert_PID_and_PRID.awk
> @@ -0,0 +1,20 @@
> +#!/usr/bin/gawk -f
> +
> +# ignore the banner
> +/^ *ID *PROVIDER *MODULE *FUNCTION *NAME *$/ { next; }
> +
> +# process other lines
> +{
> +	# convert run-dependent PID values to "PID"
> +	$0 = gensub("prov([abc]?)[0-9]+", "prov\\1PID", "g");
> +	sub("pid [0-9]+", "pid PID");
> +
> +	# convert run-dependent probe ID values to "PRID"
> +	sub("^ *[0-9]+", "PRID");

... that seems like a rather wide net to cast. I suppose as long as it's
not used outside usdt and possibly pid, this should do.

-- 
NULL && (void)
