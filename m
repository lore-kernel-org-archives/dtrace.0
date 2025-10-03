Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00BB4A02
	for <dtrace@lists.linux.dev>; Fri,  3 Oct 2025 00:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759449667; cv=fail; b=NeKyGqUodRh9OPRVcnyYUJanIR6R/qnPrHP2+eXOTJvt7w3wmfrq6tiadUaIdGVtlXj0631FayebcHwq7DBiAkYkRQNe7jluZwXNyRzDGzyNXij7zpQhNcDjM0kilUmd7F3EDis3RkFY97XcGon1w5MmiJxLlkeg8EP2kkNNu/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759449667; c=relaxed/simple;
	bh=fKXrDngITN1TYgRfG22fAAy6g2UhWcCv22Wsr1d2Uks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AYA5kBdFa6N5++TZ1jpRZ7oVP9/oQFRDFQYW4xFWk6ZhmgTEYEqcfsgjqrqZaIzPcBaPQ/ebGkW2gdjbmIhlDCvibphy9fFgXvhtaSbqaFgiOY9Y5UBZEaGzKldukR4rOS+acWEen+MnVM2ANQFAFX0JeIZLUSOVtmHGKggQeGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K6EtkuyF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KBAoev4P; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K6EtkuyF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KBAoev4P"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 592J1mSA015452
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=+m9fG0/KcxMfnsot6s
	aPeY3iaCyWMExr+qM43L8hPrA=; b=K6EtkuyFucp6/4fWWJs6lsLkSCXW5lu/5S
	Q2T8fBl6ZBisAfmse9PXR+toKfTIYNqKCRUBmzt8cFl+0s2L1p0dObYYJlu90EbB
	Qj04mTC+BX7zHNYzIgdwNXx9t6iXYmqEYL6cswfiHdcDfqT/pFgndJJixndqZn3o
	gQynDYzruPHHoqolECv43tiymytwrz/EhGAlHf6eyCMjfvtyRggt5E23z7RBvoEL
	16tgMYqI2p+UNGR8bGRO48Vdrqc+NW5C/R5Y4PutoU32sUKJu8Mn9e79MEXPOs1l
	BXQlrLUQMnvCApxWIvJ+wOF7WVL5p8bEb833zwDfcw8IH2mysIQA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49gmabmcb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:01:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 592NLeEY029741
	for <dtrace@lists.linux.dev>; Fri, 3 Oct 2025 00:01:04 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010034.outbound.protection.outlook.com [40.93.198.34])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49hw1ewe58-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 03 Oct 2025 00:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC9B65g+hnfe3ZOPkqRumfZo8nGjDsyF/dtaOd4SAuVkF3aUwjGL6TpGISXjIQlvOby0/RWJJsP4QdwOreeodWStEeSVbdhYeU7b5dHldO+FVjVHs7uevHye2r+/6dT3buh5WKM8aNF1yUvX8Wl+k/GdZcR6R7vn8fqYATzOIpuq6KORYfPB7cqjW3LzcbHdzO++EQsLvoRiPNmc+0oeLwQXExNXCJsgOu81ynVmP2LdoRVr/Z55zo9+9BE6KkZlxrx9ZXbr60XqepxmOx7mlEnLExvNlcmhLI0IdjHn6hXXjuT5xmDrmJjecllXS8HdC69GUImk6pxbDdaNTO68mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+m9fG0/KcxMfnsot6saPeY3iaCyWMExr+qM43L8hPrA=;
 b=F7cQufZdMv3jMcpG5nV1Rf1eAyIsZPgn4ndFSPKx5Fx5vDzqix6VJHHPyEdYtjJPveCbgsIQV6GJ+KvmvZFp6/fL+6s7TPgQuBvsVwgB2TBJim755UBolWk1rxWGXwYjnKDzca4H9/4Kvuf+wdP1KZjbpDA17f+WK+HK4vwo8KbEYCIuS3Nv+M8X1vKmpmSEqpOteP1Yt8YCJs22UXzbs2aQIHKt7ttzWKxwXw52UNA3QQuWs7o/mYb3BjlcAoxO8KlV6nZ+SK+JqSc5kp6RgGwALa81NkujaoM+pwihLeMfhhHUhcPI0KW6pEs3qtTjbZuUm+XtMR7Ui6HvZLuZAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+m9fG0/KcxMfnsot6saPeY3iaCyWMExr+qM43L8hPrA=;
 b=KBAoev4P7GZuJ4dsfkVnE96ACAYZbBlPWgMIkHG6jI7ISqgbcOj/6aB9srl2UjgOgPwthUHHreH63g8oetLEp8UEJKO6+0UGEozNfri2nR4B5KMxAwQJo4hPTru8j4h9bNraOfd7v41DoEAiAWGUWi5FVeTWsu/gqgmZdITbcYo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY8PR10MB6754.namprd10.prod.outlook.com (2603:10b6:930:95::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 00:00:57 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 00:00:57 +0000
Date: Thu, 2 Oct 2025 20:00:54 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 3/4] test: enum tests
Message-ID: <aN8SNhatY/SesHvE@oracle.com>
References: <20250918180338.197827-1-nick.alcock@oracle.com>
 <20250918180338.197827-3-nick.alcock@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918180338.197827-3-nick.alcock@oracle.com>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY8PR10MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 2642c1f0-3e27-494a-2b65-08de020fede9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vt6v2llgrDolOrbR2iJ1kuSRUvVfmKjfFZ2RMmxdLKJboH+BtfN/l8lWdvIe?=
 =?us-ascii?Q?ToldO10tR0E7zO1jVhmPrUEsTFOROlxUZMaQmaUvKYtgXpUzxFHnj1hA2zV3?=
 =?us-ascii?Q?zUfbI3NLiuFRqoy+GfHKcVgb5WA8bisoJVXlSXnONkQ7CjGZWk0FV8/ZZIaG?=
 =?us-ascii?Q?fo/xsSR41wuvHwCglzNCNtGTqg6cMnjlAkXM9g/GOqg7fYrROsNjGhC2rRDU?=
 =?us-ascii?Q?15lomckA8moLBKUW0weXPUZ/7x/a0HnrcPNxP+05AyNV77DPEZ0qV3L5P4cn?=
 =?us-ascii?Q?nRym7Fa2Efd+jbnQ4N0UcyZGHXE+uhNxyhFVg+Rdr/XsJIXHUTAuNzq1XQyP?=
 =?us-ascii?Q?K394xz4tX1q8oIrxqeaJs6F0mDXC4ZUaqpuVpkFeB1thTvUdN2aSRrgF4XN7?=
 =?us-ascii?Q?tbye39MBVBAutYsUcUwGliXr9G8z+ykEg7tefmKSPO/Fn569WM03vXlamYW+?=
 =?us-ascii?Q?d23sFnqc7xpPab6jwxVZeCcbOgJ69o2PiZ5vrD/O7zrA6RBTx6UNMwqgscmq?=
 =?us-ascii?Q?3qW6J+WnApA8MGQ6sfVzcudRk0ruWE8d9KJ0rZ2oAHmU4dZWqUgbiodPWguJ?=
 =?us-ascii?Q?Wx7RxBR1mUuU9YKGlW4479UCii6X6IUXIRjJUjVr9exvE/4ol1Q+0e9p4Q2e?=
 =?us-ascii?Q?VCj8gY7ChYbvyT8yx9aEuVVTLfHV6OGLqhnq+OK2dXNi9PwSUHBWVQXgG+94?=
 =?us-ascii?Q?tsn9GJUOAyfZF7T8R9AmlXLd4wqQO3aZoEabjMm2I5duWBipkzjT/UEf77s7?=
 =?us-ascii?Q?SNQFkLbSfqscJ4Sm/baLNm3/34A1gFZ6DialcSbEyj9IuQbCqqZiRzLYyMNT?=
 =?us-ascii?Q?GqrZ3xia6gsuV/pkbOXcqAUGwZQ36Unji/VBwaO7rs0pj/jTtDhWiJu8fyj4?=
 =?us-ascii?Q?Je6NZkumkcYz2sKsFgopNJeuDA/GLVeyWPWDwlGoFJMDiW/nrqeJGx836DJN?=
 =?us-ascii?Q?UTD/Yf8Xdd3sCfywnr3O/kl84PCQtm+IkrWSmkAZQUKA0TY3AhBa/doHmxa0?=
 =?us-ascii?Q?xbSySdtO3OaKjGz2XjeeBhADPAtqUA+tWkZOC1Wo5gT6gd8Mpvw5B2P+MN2z?=
 =?us-ascii?Q?fMmkDgHzawfWkYZQc7Ue02d0uqo0GpgTIkK0E72moyb5Ip86v9TAFPiu6U4P?=
 =?us-ascii?Q?lJeHeXALGwg8DLYHCbzMz5HbmyeSAX3eURkDLTjeE74j5/kJUAAvWoNjmY75?=
 =?us-ascii?Q?Z0HJaPHwrKUJYlzaTeOOGgUO4F1vNheUi2/QnaXPvYu2VDI5xVJfHiJBcXCU?=
 =?us-ascii?Q?d186PlAWEik+4AxLhsYyV/G/yyBWrKJGfTLHR9ObU1bPu5in3XFCEmyO56jV?=
 =?us-ascii?Q?JJDm/lrW6Q6TtfIjj7vlys5buNrwYx8ggEkxXM+QCqfdgw4hivV/1JEGZ9Ex?=
 =?us-ascii?Q?gA8V5j8bKvf3hhKO2gTBphvG7kVx/+sgWoAi03iXmR1qBA+uRD3e4k2xkz63?=
 =?us-ascii?Q?qOFUNRSTPWTNMqXIjeI7xxjoJaHzTZfZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L2pcRKqVEcuLDkA9HA7dFtMWB8RszEbDUFEsJgietkCFRewZ1lG7M1D+OZ1F?=
 =?us-ascii?Q?s+w2D6dPdntcLVPiGntq1VSmcg+mYTyUzNFpUnVnfBOqwnrwkWpt7nkThIsT?=
 =?us-ascii?Q?D5AMbJk8a0F20LtZD0w/WUQE6vyPzd5EdU4861ZaeAwCI3/S56LDK2GJLQLI?=
 =?us-ascii?Q?0R583H/iPBbes6QFtnskb2JyC2uwVvQqLwNCJjOYNqd4oN2e+DaEVhIuOSPJ?=
 =?us-ascii?Q?rksH/9YcF8JSW5Gwb0XW7yWInJZ7Rd4NNchi+m7OUlfIzFnkXMg5n0B7BGZY?=
 =?us-ascii?Q?jCBwnyHQ12qBYVj2IhG1pwQxGTnu8kIlmeKOdIXhOQrDykqMKO+kEYFW1omg?=
 =?us-ascii?Q?tutue219Bl/DkQi1g/J3BitJuauh9mGZYBq+ucRqGx9ZFuQUugGnFZL7l3m3?=
 =?us-ascii?Q?JhK2ztjykWc+9baxj6YYZwBVrnKazWH0ZqFYIJmdgGiqdkMvTPoOp2BPCEOA?=
 =?us-ascii?Q?NOqkw6af9RpULX2XqZLUbsI6WGMIQ5pi2pOuh3xQiX50AuuAb5su74rCr1Ur?=
 =?us-ascii?Q?JUkq+wV8+kSuTKAzlZwypfM0drtwzArP+hhkm99zP1/JVOSjDdydj4eudJlP?=
 =?us-ascii?Q?q3ymONWm5bED/75qi2sVLG4149lKgyUYwWRjtYHs3SWhxpErGnUXzXI0LLoK?=
 =?us-ascii?Q?YXAVR3k88uxXlXhWDS5q+9McQhVzEmGogS5+9Hl8oEZK1W0N+xejCBlvmVbY?=
 =?us-ascii?Q?LlcMnt1fcpqOW+SJaxvQNRgEUQypi3Zfv4I1I+DtxyKWLhu87K3XvpPeNClS?=
 =?us-ascii?Q?HPuQ+HWyKT5jyX1EHTBTcmBKyftJPkST1sjiPGSUaiXgO7DpIuBGhsJ11Ha2?=
 =?us-ascii?Q?W03vCUolJQuZXtDwa9DlB8tooN2CzeM//LOC+P4o01wFUque34c+HJGiaxZX?=
 =?us-ascii?Q?Zp019Q08ALcYo6arOdlG0uqFJKBP16CmOCe5foNHoUl+XMlbLwqSwDEMrZLG?=
 =?us-ascii?Q?fLA5cMeBsZ9ZEw2wb6qaiHs+ZAL865q29PRovZ/MMyOAQDGOhHHZb45Dcitn?=
 =?us-ascii?Q?ZitytrX5cIJBBIkj0wf3yRKZLtJMmUmnBb6LJl0RtUp0PoDYbUGn4IqpeBNr?=
 =?us-ascii?Q?KdcMxzn+1G6lQXwjnaRrQ844uQJ3U2kPSL/YqjLcyaVCGpe7yeJLtYbIor1k?=
 =?us-ascii?Q?uaN2fjw29F7ym8QD2Rmwb7TAsy5BClodglcMcl9pDkQKdQP5w/ZR9Nn34axO?=
 =?us-ascii?Q?A26X11KdsfIkLM/VckgppZAmsN1eMvSp6xg5yYpGMUeac/asGs6ko683qOAl?=
 =?us-ascii?Q?5G3BbnoBu6qUq0B05EdvJEWht1HHQcf6pY6SXQvCROMLrbBW13dhiJagpo7Y?=
 =?us-ascii?Q?jWExoPi1wAx4v9oz22ItJoJM/5e4D7RI4LsRY8lQgj8dYczrH77Y+Wyk+sA8?=
 =?us-ascii?Q?H2n6SQRbCKjCXt3rJ26Zt3HokDt7pk3BdL6T5cVg3qBbOBN9JA5Y5Fpa0TOq?=
 =?us-ascii?Q?mLHHnX6/IyS1eM1E22+D2UZwV0YEiNbWT6Qok744iD/DkK/v7glOvMe/Aox+?=
 =?us-ascii?Q?dCza+cM9IK1DDmejqYNFZJLOHDDWm49d4U9DrKMXj7G8I/jAijDf/upgR4dv?=
 =?us-ascii?Q?vswp4v1d/a/JF+nP9fmZDVV7VFMqoQjoA3/X6NBNyiAeh6eFCUmrPcd9M6/1?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZFfUztlq5aDt04SlBtTwYi5R+sXnjrr4FpO94B8A+3yXXWDpqNmKkaJkFyCFdZqnqfWyohepzTNuUmjQ0mwvAQ7mjPDCsumX31FOfeHHpMduC1qlkdHZhOqZCOE9GUxbujPiS5z/nQdbu92kDwsEHsaAfZm8/vg5xWmip+MW+AO6T8960mvPEKRMnr+JAfrBv8L3nJzuf2UMXquSnDJpO8wwYfgMVb/9XQbfVHaHERqvIhNwU+rkeeetHscTQlbxLngWRC6OAgUhkNLJegp3i54svsNeD0w7krFuMk+GHUcK1tjoHd0wgZ6LXOsOBKcUtHz6jbszgeNhvoskfdU0KOmNozq1J3N4Ppf/7ERlCcx6vBczQtHHWprAjg54LRXC3zoBfHs/tQijqPSWoVCVJvxjXet3CBZgU24pU17wwv7w+1z2zE1rmVPVM9TNsexgARLL4k4yGtNMzcxoHBy7tyGvFX35brs+YZzOx5/jNnj9EL+a3CymXcObFDBCeaHRm+3Gr/2A5Izj0lwsHOpEf2f5A7ZnomvMSzUd95scf7K3SNunts71gQDcMlV8hBj8D9qrFdlBJ5Zr12oE5WP1UsN9dKmySZki4zbnNAChmcw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2642c1f0-3e27-494a-2b65-08de020fede9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 00:00:57.4570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omH6+FpiQOZKZalpCxUIUuvZV393x/Okb5X24mpzvPbJjSeEe/7EL1oH6m5SBXirHI5oUk00EC7P6X1CmGb0S1aQnnvrOqVScLl3RYXrWPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6754
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_09,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2509150000 definitions=main-2510020210
X-Authority-Analysis: v=2.4 cv=SI1PlevH c=1 sm=1 tr=0 ts=68df1240 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7ccvU2ulMQwfasrchF4A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13622
X-Proofpoint-ORIG-GUID: vUcPPVOCNErq1qaocUCG4QS3eg7QduI1
X-Proofpoint-GUID: vUcPPVOCNErq1qaocUCG4QS3eg7QduI1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDE2NSBTYWx0ZWRfX6rZ/+GXJFJZg
 HSxKwzytmvOTa7ss/0LAxBXKd0+j2Ziskst3jTupTZ//aXRXQ3FAH+0VQu5wiMm9tOTTS0xSaa2
 sIAmc9f412OJ2xfFnDY0ti0XqR4fBgOEVDPX0sOvQL+eumyQf9rR0d0rrjV49E4ArTfnESopymw
 XFDV87LgG0lBr/CE/U7rYJlAtK71V5dryvcRSsj5l9Pa3XyFktFZbP1TZZ+xvcTyWQs5ALTwNoU
 b9O3WauuuuUU+RVEyahvwUVXFSXeO8wWm8KNiF0gBRNXA7fREXnfWFr0pUjIfnMOZpKRUaOvTCj
 LVUziixwbG1c2gS751OjLZjYSp1f7fwf4XDr/JXPO9wDZ6F8pTfLa6u4y1po9Zzhcn+NHdHdtxZ
 /szhcT4Tlki75YICGLWR5qRW7o0bHi4u3I9z2gZsusUDnC53aKU=

On Thu, Sep 18, 2025 at 07:03:37PM +0100, Nick Alcock wrote:
> A couple of new tests verifying that type names appearing in enums are
> forbidden, as well as that kernel-visible identifiers are permitted;
> and a renaming of the D_UNKNOWN tests now that libctf can be assumed
> to be everywhere and it's probably more common to have a libctf that
> emits a good description of this failure than the converse.
> 
> (The previous commit changes the error messages in this case back to
> what they used to be in the old days, too.)
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  ...iers.d => err.D_DECL_IDRED.RepeatIdentifiers.d} |  0
>  .../enum/err.D_DECL_IDRED.RepeatIdentifiers.r      |  2 ++
>  ....r.p => err.D_DECL_IDRED.RepeatIdentifiers.r.p} |  0
>  ...dentifiers.d => err.D_SYNTAX.RepeatTypeNames.d} | 12 +++---------
>  .../enum/err.D_UNKNOWN.RepeatIdentifiers.r         |  2 --
>  ...OWN.RepeatIdentifiers.d => tst.EnumKernelDup.d} | 14 ++++++--------
>  test/unittest/enum/tst.EnumKernelDup.r             |  1 +
>  ...NKNOWN.dupenum.d => err.D_DECL_IDRED.dupenum.d} |  0
>  test/unittest/types/err.D_DECL_IDRED.dupenum.r     |  2 ++
>  ...WN.dupenum.r.p => err.D_DECL_IDRED.dupenum.r.p} |  0
>  test/unittest/types/err.D_UNKNOWN.dupenum.r        |  2 --
>  11 files changed, 14 insertions(+), 21 deletions(-)
>  copy test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.d => err.D_DECL_IDRED.RepeatIdentifiers.d} (100%)
>  create mode 100644 test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
>  rename test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.r.p => err.D_DECL_IDRED.RepeatIdentifiers.r.p} (100%)
>  copy test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.d => err.D_SYNTAX.RepeatTypeNames.d} (72%)
>  delete mode 100644 test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r
>  rename test/unittest/enum/{err.D_UNKNOWN.RepeatIdentifiers.d => tst.EnumKernelDup.d} (57%)
>  create mode 100644 test/unittest/enum/tst.EnumKernelDup.r
>  rename test/unittest/types/{err.D_UNKNOWN.dupenum.d => err.D_DECL_IDRED.dupenum.d} (100%)
>  create mode 100644 test/unittest/types/err.D_DECL_IDRED.dupenum.r
>  rename test/unittest/types/{err.D_UNKNOWN.dupenum.r.p => err.D_DECL_IDRED.dupenum.r.p} (100%)
>  delete mode 100644 test/unittest/types/err.D_UNKNOWN.dupenum.r
> 
> diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
> similarity index 100%
> copy from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
> copy to test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d
> diff --git a/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
> new file mode 100644
> index 0000000000000..424d6b0775810
> --- /dev/null
> +++ b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.d: [D_DECL_IDRED] line 24: identifier redeclared: GREEN
> diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r.p b/test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p
> similarity index 100%
> rename from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r.p
> rename to test/unittest/enum/err.D_DECL_IDRED.RepeatIdentifiers.r.p
> diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d b/test/unittest/enum/err.D_SYNTAX.RepeatTypeNames.d
> similarity index 72%
> copy from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
> copy to test/unittest/enum/err.D_SYNTAX.RepeatTypeNames.d
> index 43837c78af9f2..74afdebf98082 100644
> --- a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
> +++ b/test/unittest/enum/err.D_SYNTAX.RepeatTypeNames.d
> @@ -7,22 +7,16 @@
>  
>  /*
>   * ASSERTION:
> - * Repeating the same identifier in the same enumeration will throw a compiler
> - * error.
> + * Enumerations cannot have the same names as already-existing types.
>   *
>   * SECTION: Type and Constant Definitions/Enumerations
> - *
> - * NOTES:
> - *
>   */
>  
>  #pragma D option quiet
>  
>  enum colors {
> -	RED,
> -	GREEN,
> -	GREEN = 2,
> -	BLUE
> +	int,
> +	not_int
>  };
>  
>  BEGIN
> diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r b/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r
> deleted file mode 100644
> index 0bf0acdb0702b..0000000000000
> --- a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.r
> +++ /dev/null
> @@ -1,2 +0,0 @@
> --- @@stderr --
> -dtrace: failed to compile script test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d: [D_UNKNOWN] line 24: failed to define enumerator 'GREEN': Duplicate member or variable name
> diff --git a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d b/test/unittest/enum/tst.EnumKernelDup.d
> similarity index 57%
> rename from test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
> rename to test/unittest/enum/tst.EnumKernelDup.d
> index 43837c78af9f2..429e2d0a01f66 100644
> --- a/test/unittest/enum/err.D_UNKNOWN.RepeatIdentifiers.d
> +++ b/test/unittest/enum/tst.EnumKernelDup.d
> @@ -1,14 +1,14 @@
>  /*
>   * Oracle Linux DTrace.
> - * Copyright (c) 2006, Oracle and/or its affiliates. All rights reserved.
> + * Copyright (c) 2006, 2020, Oracle and/or its affiliates. All rights reserved.
>   * Licensed under the Universal Permissive License v 1.0 as shown at
>   * http://oss.oracle.com/licenses/upl.
>   */
>  
>  /*
>   * ASSERTION:
> - * Repeating the same identifier in the same enumeration will throw a compiler
> - * error.
> + * Enumerations using names also used for enumerators in the kernel should not
> + * raise errors.
>   *
>   * SECTION: Type and Constant Definitions/Enumerations
>   *
> @@ -18,11 +18,9 @@
>  
>  #pragma D option quiet
>  
> -enum colors {
> -	RED,
> -	GREEN,
> -	GREEN = 2,
> -	BLUE
> +enum dirs {
> +	UP,
> +	DOWN
>  };
>  
>  BEGIN
> diff --git a/test/unittest/enum/tst.EnumKernelDup.r b/test/unittest/enum/tst.EnumKernelDup.r
> new file mode 100644
> index 0000000000000..8b137891791fe
> --- /dev/null
> +++ b/test/unittest/enum/tst.EnumKernelDup.r
> @@ -0,0 +1 @@
> +
> diff --git a/test/unittest/types/err.D_UNKNOWN.dupenum.d b/test/unittest/types/err.D_DECL_IDRED.dupenum.d
> similarity index 100%
> rename from test/unittest/types/err.D_UNKNOWN.dupenum.d
> rename to test/unittest/types/err.D_DECL_IDRED.dupenum.d
> diff --git a/test/unittest/types/err.D_DECL_IDRED.dupenum.r b/test/unittest/types/err.D_DECL_IDRED.dupenum.r
> new file mode 100644
> index 0000000000000..0b6369e523cb2
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_IDRED.dupenum.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_IDRED.dupenum.d: [D_DECL_IDRED] line 18: identifier redeclared: x
> diff --git a/test/unittest/types/err.D_UNKNOWN.dupenum.r.p b/test/unittest/types/err.D_DECL_IDRED.dupenum.r.p
> similarity index 100%
> rename from test/unittest/types/err.D_UNKNOWN.dupenum.r.p
> rename to test/unittest/types/err.D_DECL_IDRED.dupenum.r.p
> diff --git a/test/unittest/types/err.D_UNKNOWN.dupenum.r b/test/unittest/types/err.D_UNKNOWN.dupenum.r
> deleted file mode 100644
> index 2d6aa3069b94d..0000000000000
> --- a/test/unittest/types/err.D_UNKNOWN.dupenum.r
> +++ /dev/null
> @@ -1,2 +0,0 @@
> --- @@stderr --
> -dtrace: failed to compile script test/unittest/types/err.D_UNKNOWN.dupenum.d: [D_UNKNOWN] line 18: failed to define enumerator 'x': Duplicate member or variable name
> -- 
> 2.48.1.283.g18c60a128c
> 
