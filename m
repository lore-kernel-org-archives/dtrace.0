Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D644F1A3031
	for <dtrace@lists.linux.dev>; Fri,  1 Nov 2024 15:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730474904; cv=fail; b=Fpx7yOHneD3oMH3zxqcCOqNtkhz36313khZv+E3AzrZc4WFTufK46qItHxxgTROW1F/GBDKn2Xlw6r4trhHrNVR4bePCMxVbZVBNF5Xt1xd3szZIT8bxWw5r2ncStod3ebobpwpTzC8upiCrCZraFCbMwGA6fC+DnmhgpPBkcdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730474904; c=relaxed/simple;
	bh=bnivoyIJWTFNS8nJisMhNhDi1Xfp5ud0zfjfYiS3BN4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=ZbX8N9RDKglOqTWabDNl7oD4T+307x+4MhCUUb3DQkPmcBjx3xy1r4GL7+amcZ5TYgpIRkGBhA6ATMq2jV7RDVxv7izYfecb3Xb906QN0YzK8117It7SwyXSzxICuZjfwvMhty4PyUVDxpkjTLDqmWDFccD0XSoSSyVbouAa3Vg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JuzehEwQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cna8A8TV; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JuzehEwQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cna8A8TV"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1EtXw2032341
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=vj6XwJUHKRseePEqM4
	gTM6jwaj66gt/s3I7tbRWOOiI=; b=JuzehEwQw/Oyyjjo0HNahQzOZrgFI6VDUH
	QQmRdSwQEcXoDhIL4vpbE+W48bhOpED17FkIJ/ZXIX43MI8Wc2y5do7Zr5diHaV4
	C11HRX4HTmH8YRRzTlZS+HFIoH20PgIVZWVhrNfm4VPycfFkx1+6PTxtmrUwUNZZ
	Lx0BtW2MhCYX37odTcRScLQ3rQUhuPYjlA4DAV/gRmfbUOwjzsIdD5ysplTQpqTd
	Q7m0gSFoUSXTHgBNUY64M8SpnOo9uFKw6ipBoRH+uvr6UMakiJmZlZ3fEojMYdwi
	yzfz9WcfF2b7iVmthHvAcglDr5hOv88Fy6Coi4YvDw262WC8BAow==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grc24dm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:28:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1F0aaC004754
	for <dtrace@lists.linux.dev>; Fri, 1 Nov 2024 15:28:19 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42jb2y6mw9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 01 Nov 2024 15:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JW8oSf/3zQejI2Cpgrz3Aoyuv0++AL1exuXGTdY+LVoR2MNtkAN8Ny9iArnijLEjEVmNWpVGgXACx9XHfLZmLBwYu0QZllOB0si6ZHwNW2gzgbBlHQlCyy2JJ/S1tLCrTct8lskcYbtCZaZ7flQWEnn+f2KNvf+9NN7a/9Mve7mRE2M8UnxzZCk5DmUS0CQnQ7AmYIlmtx0qP4Q0lWsBmQqZkQdQ2EpPTsKRRBEXvyuPwV5PDt6gWDt297llmnm8ngc7JPHkr4W+fvcugchzgIfjWMEls9aalqHqgGDeBZ7IRkzPNdCE71Hy7CH8SKiGcH9zQpUNWpdtRWtmIYhYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj6XwJUHKRseePEqM4gTM6jwaj66gt/s3I7tbRWOOiI=;
 b=HEjy7DSNOtQ6M2V+jqo7CbdZ0p14L8HhBvdRMUXuKrZhPnxH5SrXjzGmCIV+1cAHBhpth8D1bxl1n6sxHjinCql3ExLzqWBZuHRibzKQGrufj16k7JWm8t5Js0Z4B9RtmQLRuysikhKn8LdLUixwf2GLU3tuzMFP41QviW5xz0e5/asra9BSRbwwWwyeqC8XTpWDPDkzzh+2aRTvdonZbRx9p+mbpFCLjJ8/JaYiltFE2gFfcHeUQ+W05MlbN269mGm60EfYVhzniqr34TnWWTAbjyohgGG4vxUbgabBOap83xT+5XPjFKVDEbqsWJdI7sdF3awkbOk8mnneRxQw8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj6XwJUHKRseePEqM4gTM6jwaj66gt/s3I7tbRWOOiI=;
 b=Cna8A8TVzWaA9JjIZaPYZFg1lonOcsuVYvjyB7XrIpQnNVAaqk/uMRrLxB9RyJHY0+sBJPcoliDFw0cLZqfLzIMD+NsA5RcWa7ji0j7OiE4aSgFlMRgSGjKYAMwn68uD89cqsRw8VhmEaRtl4CVGRYJsmhVxLDQhWQr/PKuIoNg=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CO1PR10MB4546.namprd10.prod.outlook.com (2603:10b6:303:6e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.27; Fri, 1 Nov
 2024 15:27:57 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 15:27:56 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] utils: add args output to showUSDT.c
References: <ZyTyQuIOTB_zRDtC@kvh-deb-bpf.us.oracle.com>
Emacs: more boundary conditions than the Middle East.
Date: Fri, 01 Nov 2024 15:27:52 +0000
In-Reply-To: <ZyTyQuIOTB_zRDtC@kvh-deb-bpf.us.oracle.com> (Kris Van Hees via
	DTrace-devel's message of "Fri, 1 Nov 2024 11:22:42 -0400")
Message-ID: <878qu3km87.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0186.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::11) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CO1PR10MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: b206ac8e-57a8-486a-10fe-08dcfa89c2e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IHuThc5JtP7nXxREkn0OChgLvAFT3EVCo1g+AK6C5h3S1t2hls1w8rsmxy4e?=
 =?us-ascii?Q?9XZt3VeqbmBNj5+ptrkpNnRIr9zRJ7n0YJRlXtqCoIcPDKB1b6m6wTurZLtF?=
 =?us-ascii?Q?ZN7G20xaQJahR+zIygdMxOiCW3U+Pa3SdwHNMmGT1RN3KvTHnkhEFqR6AYHj?=
 =?us-ascii?Q?QxAf/w+iE05QS3tA/OG2FZQrGb/UPPRih5svBBXh/sEdMNNcLpx84tC9bwBy?=
 =?us-ascii?Q?0rZpBoqRKxIYm/HoT2FXxfsbajpStVY2FtVlHOYzWr4BHijKsweSJ155Ni8x?=
 =?us-ascii?Q?IBSKtajkXbfTiTScCSXr6P+wP7ezw3jyXqUK/ftWS/KDdX3/fmHUtffCxCl5?=
 =?us-ascii?Q?LMNj70z/CrHySVlhRi13uR/oB7F5aaM6zyr9G5daSYtqE7ipJ1k3xUDoL0XU?=
 =?us-ascii?Q?LjVntn/0mRC4jvz2Jm+WP/ezUM/umi2BLg+cmd6eP98Sm+9t5N3714EIiiOx?=
 =?us-ascii?Q?BVBDZS4x6kvwB+OBHLqwcd+nkFD32QahDrQG0xA6k5CvIKlCfw2qrzz4bonE?=
 =?us-ascii?Q?ksNsq2nskWtOFbEQZUS86q9WjCQjU7j4DVRIr4UfXiGQW5x9b+jQjrrMsuQn?=
 =?us-ascii?Q?VRnYpXivAXP/9Q+nsYG7pfVG3buUiWQbo6N265qx4R1eJQrVHLnokiBMX6I1?=
 =?us-ascii?Q?QMSTi8Okt8kfmTn/CdWugzIFqCRS1jvVTGkqhg8/wSr7inQ29l47qEAUHiSV?=
 =?us-ascii?Q?WXYtM7Wm1baJvYQ9qdpDOCCrOxe0tX8G6nwILbZecxhi1Y16/dhKz6Fia9Gi?=
 =?us-ascii?Q?RaXwfzySTcrSqKGQfltG3ie4xTMEPxGvOh4AKx+tdT048372O++GP3q603BK?=
 =?us-ascii?Q?aUjEmr3j5Ji89wE5IXGVsmYr9PuqQ2vtxLCKBcA24GqbQmzEwrQWv9ydN2+u?=
 =?us-ascii?Q?DDJ7Vmkn4e/RQ/Qy1M4TVuvx+9FBaVnOVYc+JCePO8pYQ3t6Mb0ub6G6JO7Y?=
 =?us-ascii?Q?BKAJvt67A4SZvo+HVrgn/jGzON9Y9EJYYZC5Nvje9SF0jS/NoiKtpOQ93VtH?=
 =?us-ascii?Q?7flSvW9NYamjpT4psIUPwxfNMUjdCBleHfXOD+O5cqb/MUyclcpCInDkke0q?=
 =?us-ascii?Q?hW4gavlqhD3morzvw1H3UIrMx40YHpqqhvLZ3MMSDqyf2XufIaNCCMXhPz8t?=
 =?us-ascii?Q?zcVif+crZSmIwDOjqyntPSKeHTBxZtE29SHE6DhLdpVWQcKXFcEnA7L3arZe?=
 =?us-ascii?Q?pIKhNNxjn4qqUtabeGuVRTcnX/xUkcY3vWRHfEUjZjcwR0GVg+igGvYdGzG9?=
 =?us-ascii?Q?schHq3HnlN6WWQxOAOVvO0L/4bPt8lJLAcNEp7yVaomOczJMoweF6jtpm7ji?=
 =?us-ascii?Q?Kbjmi7YAT+F+QvJRory8/c+o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fT2bGWga+TrUv1k5uaV2B0eGcIj6kGGWWZZ5Zkqwq4+VS9Wl+5ToRUqUC80E?=
 =?us-ascii?Q?7YTEuulITZbDxZ5+nVsKvUwb2wGtVMdW9Xcrwfinm2LCefWTPweaxtPJsGA+?=
 =?us-ascii?Q?qUKpORUv8WtiiChyOVkLTFoRFJIMkZPN4NPg63vMhzaURfCj6Dpg8CgNoq6S?=
 =?us-ascii?Q?KgZ9mlal3LfrBewbrtiAGk27hmjHHq7o8lj7YFILt4KnGqD1UsR/YKI3S6CL?=
 =?us-ascii?Q?SWgTyMSYWs9pmHNGR0MrnOYPi8Ty7z4Gn23hVq7gersi1KlLcqQ7Q9E75l2j?=
 =?us-ascii?Q?F5A1f5lVdjd2MQIJPPxvBqLESBhfEaoiht431jaG+On4BKEiue35ShvnV5wA?=
 =?us-ascii?Q?WmnNMJJc5PYCxWHUKiVMkuwezIJ6Us3ibbebs3+3aDMNZQCM6ZqgmM0FhucN?=
 =?us-ascii?Q?2xgdQ0i5YNpZNwTjroKHXtC+dReQ3eIt9r5MzEGIKD0VW9OjLyhwwqaE94B2?=
 =?us-ascii?Q?ufNjWxmUIpm6xlY5Vw1E8Y5/tNx/V9Di2HYvLNyrng+EPu2pNellzRBpq+3M?=
 =?us-ascii?Q?RWlAllGU/mcPfoeIpCSmp/VXiw5UUJpflELdF82zYaSlJzP5ffhdtPfgGeKc?=
 =?us-ascii?Q?FS3dxVp259qMvp2TwNSZdNI4jF4fO3FNzKmPIonn/AuaI4qLwi4RGOJKai67?=
 =?us-ascii?Q?pTQRaoxeasbci8QcoVHSrJpJVlV1d90z3TQ1uC2ClBVblAzem60QGEImdIAB?=
 =?us-ascii?Q?/Izk6ZVSQkHbC/S3dkYwH/DwTt1I0xWftTxMZM958y9RC98QUgEuxZYkIRZK?=
 =?us-ascii?Q?xa25XvjQrjgKY3Qz5/GHK79wTcRkmkR5HcIkMyELEmejMQ6jmNsDush9jxu/?=
 =?us-ascii?Q?LR6mnH53hublibXuBGmbZM5c57pPWhY8qQ3gdJWCCRCrXVHxHCi/kRHLA5KP?=
 =?us-ascii?Q?B/Vz9KRvs5vmttJYxTZZxpFDWNZzcWkimZftQF83Y2H5t7zrGXZNbGnDqWie?=
 =?us-ascii?Q?cFu1LTRIBexcQVfDJCCWQhDqfIMlFVKrMdchinNzai6fiWG0Hi+LYFgchB9n?=
 =?us-ascii?Q?Q/zV2H/t1hZdqeUO5kD36TarNMH3vPMuk+hLOJTBxNZBCvPr3fJLRoxAtEJg?=
 =?us-ascii?Q?qCCWKSTwByJYuS/+Ob78/J3Sotp2+gqCSRWAXWFv4FEfUlNLu9m+O0OroHH3?=
 =?us-ascii?Q?izfG8fm8wv+o9L69ALa8yftTF46oV8dhIBlah6E5lqfmTbz+7/BSjkaHlmu1?=
 =?us-ascii?Q?Cu0MCBQCm6gaG+DZC6UkKlg/1ZoX6saNFG3di6XuxjjONrLIuttI/MQk3Hvp?=
 =?us-ascii?Q?RcFH/wiuvIQtqzAnn0cO1Ieice0U+R3WM1NLGz9kJnL3hNBmyaoife2Pt5V5?=
 =?us-ascii?Q?JH9Rie/VUKBkMS8OsWHnN9p7shrxQ4yEP3ZN91aWd42ZVlnZID5r8uH68Csc?=
 =?us-ascii?Q?x4AHIyfIcbqMHRMPip8trH41upwo0dAxqPg+UoKfjQEAqqbLO6Ok/86EDFyb?=
 =?us-ascii?Q?kXzbbYMVJdi8IXoy8vFJQmhvPdV/RAadBi1JlvEzXr3feD7m8HvFIo3VuPC6?=
 =?us-ascii?Q?C3BreQc8nfTPtyPPyOA3ruKRs+5PDDZg93tuJDYLcTRRS0OxZTJ4MgmEO36L?=
 =?us-ascii?Q?MvFecQwMq7fEEcU8y7tGlkdrwtXMC6yvJtOnmvIt4Vwira3xR6LmvEzMyuTu?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Hya7ELiGGilo3qx1R1z4evTShS7GILdIoL1+KQokjn4jxVGlgz1UyhjV6wNwtaatuef0zyEQPTYQcM/1HXrv3IOGlwMxa1sm+5+2zGE/fYEAr3iKOD0emYEdXw59qN+hqixr/8YdwO5G5RNkQqkcVedRIEquLKr1KmPSCWi3qq72jI0w6VUHBvdneNuRu3dwdud0uLcB4GjmHkKfpHgyK5wzTWPtRSoGuPEIDm9SmO4pej8WRc8z6do8wM2GPIeEZNn4p9Dth9m6jp+d/458v3Z+Jfzz7MSa0j36ExVf/ci+W3HttG4KDVm3a8Laby9Mm1DO6yCdnnAS8TmMpIk8V/N412+f5Cxh9EouOm1HYMAQgCawysfTINq3J5S9c9g+TklxM+Guu+yufngSqdLxrZT9Zby6aJbKE9LCEoq9r5tRh4TuPR4bO/5b8UkqwCNAfXyIXbNXdkMZfaqNTrGhsMP0dOA7O6VqBmMZIrRv1n1c2K9oVLSBSSumRfOFV9ZEubbcSWyVRVW+5vjMcyRN/c2Ix6RbFERBqqvtwPJ5g6eoyRknT5xYsTaS4lA3xOycJtNDdGB/J1QH+j5j7Bw7sXau8r05YavhChBBqm2xAPo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b206ac8e-57a8-486a-10fe-08dcfa89c2e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:27:56.8745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+vF/TrKTVE12ABYgcshPgWQdnAa8jrl/DOt7atvW8b2Czqh8li/iyi27F6wK27ZeWIfibMfIekmakCJKtCEfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4546
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-01_10,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411010112
X-Proofpoint-GUID: 1yX_DsGGDUu3yN0qjrpTL3OeFNClLVT3
X-Proofpoint-ORIG-GUID: 1yX_DsGGDUu3yN0qjrpTL3OeFNClLVT3

On 1 Nov 2024, Kris Van Hees via DTrace-devel verbalised:

> The showUSDT utility now reports argument type (native and translated)
> and mapping data for probes.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Nice! Dropped my corresponding one.

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

One caveat:

>      printf("      Probe %d: %s:%s:%s:%s\n",
>  	   id, name, "",
>  	   strtab + probe->dofpr_func, strtab + probe->dofpr_name);
>      printf("        argc %d noffs %d nenoffs %d\n",
> -	   probe->dofpr_nargc, probe->dofpr_noffs, probe->dofpr_nenoffs);
> +	   probe->dofpr_xargc, probe->dofpr_noffs, probe->dofpr_nenoffs);

I think you shuld still print dofpr_nargc here too, because if it's
wrong we don't want the loop beyond to overrun and crash without any
previous indication of why :)

-- 
NULL && (void)
